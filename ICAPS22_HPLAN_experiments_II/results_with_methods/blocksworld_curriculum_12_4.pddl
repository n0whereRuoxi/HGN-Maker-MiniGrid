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
      ?auto_161177 - BLOCK
    )
    :vars
    (
      ?auto_161178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161177 ?auto_161178 ) ( CLEAR ?auto_161177 ) ( HAND-EMPTY ) ( not ( = ?auto_161177 ?auto_161178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161177 ?auto_161178 )
      ( !PUTDOWN ?auto_161177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_161180 - BLOCK
    )
    :vars
    (
      ?auto_161181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161180 ?auto_161181 ) ( CLEAR ?auto_161180 ) ( HAND-EMPTY ) ( not ( = ?auto_161180 ?auto_161181 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161180 ?auto_161181 )
      ( !PUTDOWN ?auto_161180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161184 - BLOCK
      ?auto_161185 - BLOCK
    )
    :vars
    (
      ?auto_161186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161184 ) ( ON ?auto_161185 ?auto_161186 ) ( CLEAR ?auto_161185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161184 ) ( not ( = ?auto_161184 ?auto_161185 ) ) ( not ( = ?auto_161184 ?auto_161186 ) ) ( not ( = ?auto_161185 ?auto_161186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161185 ?auto_161186 )
      ( !STACK ?auto_161185 ?auto_161184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161189 - BLOCK
      ?auto_161190 - BLOCK
    )
    :vars
    (
      ?auto_161191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161189 ) ( ON ?auto_161190 ?auto_161191 ) ( CLEAR ?auto_161190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161189 ) ( not ( = ?auto_161189 ?auto_161190 ) ) ( not ( = ?auto_161189 ?auto_161191 ) ) ( not ( = ?auto_161190 ?auto_161191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161190 ?auto_161191 )
      ( !STACK ?auto_161190 ?auto_161189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161194 - BLOCK
      ?auto_161195 - BLOCK
    )
    :vars
    (
      ?auto_161196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161195 ?auto_161196 ) ( not ( = ?auto_161194 ?auto_161195 ) ) ( not ( = ?auto_161194 ?auto_161196 ) ) ( not ( = ?auto_161195 ?auto_161196 ) ) ( ON ?auto_161194 ?auto_161195 ) ( CLEAR ?auto_161194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161194 )
      ( MAKE-2PILE ?auto_161194 ?auto_161195 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_161199 - BLOCK
      ?auto_161200 - BLOCK
    )
    :vars
    (
      ?auto_161201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161200 ?auto_161201 ) ( not ( = ?auto_161199 ?auto_161200 ) ) ( not ( = ?auto_161199 ?auto_161201 ) ) ( not ( = ?auto_161200 ?auto_161201 ) ) ( ON ?auto_161199 ?auto_161200 ) ( CLEAR ?auto_161199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161199 )
      ( MAKE-2PILE ?auto_161199 ?auto_161200 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_161205 - BLOCK
      ?auto_161206 - BLOCK
      ?auto_161207 - BLOCK
    )
    :vars
    (
      ?auto_161208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161206 ) ( ON ?auto_161207 ?auto_161208 ) ( CLEAR ?auto_161207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161205 ) ( ON ?auto_161206 ?auto_161205 ) ( not ( = ?auto_161205 ?auto_161206 ) ) ( not ( = ?auto_161205 ?auto_161207 ) ) ( not ( = ?auto_161205 ?auto_161208 ) ) ( not ( = ?auto_161206 ?auto_161207 ) ) ( not ( = ?auto_161206 ?auto_161208 ) ) ( not ( = ?auto_161207 ?auto_161208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161207 ?auto_161208 )
      ( !STACK ?auto_161207 ?auto_161206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_161212 - BLOCK
      ?auto_161213 - BLOCK
      ?auto_161214 - BLOCK
    )
    :vars
    (
      ?auto_161215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161213 ) ( ON ?auto_161214 ?auto_161215 ) ( CLEAR ?auto_161214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161212 ) ( ON ?auto_161213 ?auto_161212 ) ( not ( = ?auto_161212 ?auto_161213 ) ) ( not ( = ?auto_161212 ?auto_161214 ) ) ( not ( = ?auto_161212 ?auto_161215 ) ) ( not ( = ?auto_161213 ?auto_161214 ) ) ( not ( = ?auto_161213 ?auto_161215 ) ) ( not ( = ?auto_161214 ?auto_161215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161214 ?auto_161215 )
      ( !STACK ?auto_161214 ?auto_161213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_161219 - BLOCK
      ?auto_161220 - BLOCK
      ?auto_161221 - BLOCK
    )
    :vars
    (
      ?auto_161222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161221 ?auto_161222 ) ( ON-TABLE ?auto_161219 ) ( not ( = ?auto_161219 ?auto_161220 ) ) ( not ( = ?auto_161219 ?auto_161221 ) ) ( not ( = ?auto_161219 ?auto_161222 ) ) ( not ( = ?auto_161220 ?auto_161221 ) ) ( not ( = ?auto_161220 ?auto_161222 ) ) ( not ( = ?auto_161221 ?auto_161222 ) ) ( CLEAR ?auto_161219 ) ( ON ?auto_161220 ?auto_161221 ) ( CLEAR ?auto_161220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161219 ?auto_161220 )
      ( MAKE-3PILE ?auto_161219 ?auto_161220 ?auto_161221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_161226 - BLOCK
      ?auto_161227 - BLOCK
      ?auto_161228 - BLOCK
    )
    :vars
    (
      ?auto_161229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161228 ?auto_161229 ) ( ON-TABLE ?auto_161226 ) ( not ( = ?auto_161226 ?auto_161227 ) ) ( not ( = ?auto_161226 ?auto_161228 ) ) ( not ( = ?auto_161226 ?auto_161229 ) ) ( not ( = ?auto_161227 ?auto_161228 ) ) ( not ( = ?auto_161227 ?auto_161229 ) ) ( not ( = ?auto_161228 ?auto_161229 ) ) ( CLEAR ?auto_161226 ) ( ON ?auto_161227 ?auto_161228 ) ( CLEAR ?auto_161227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161226 ?auto_161227 )
      ( MAKE-3PILE ?auto_161226 ?auto_161227 ?auto_161228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_161233 - BLOCK
      ?auto_161234 - BLOCK
      ?auto_161235 - BLOCK
    )
    :vars
    (
      ?auto_161236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161235 ?auto_161236 ) ( not ( = ?auto_161233 ?auto_161234 ) ) ( not ( = ?auto_161233 ?auto_161235 ) ) ( not ( = ?auto_161233 ?auto_161236 ) ) ( not ( = ?auto_161234 ?auto_161235 ) ) ( not ( = ?auto_161234 ?auto_161236 ) ) ( not ( = ?auto_161235 ?auto_161236 ) ) ( ON ?auto_161234 ?auto_161235 ) ( ON ?auto_161233 ?auto_161234 ) ( CLEAR ?auto_161233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161233 )
      ( MAKE-3PILE ?auto_161233 ?auto_161234 ?auto_161235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_161240 - BLOCK
      ?auto_161241 - BLOCK
      ?auto_161242 - BLOCK
    )
    :vars
    (
      ?auto_161243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161242 ?auto_161243 ) ( not ( = ?auto_161240 ?auto_161241 ) ) ( not ( = ?auto_161240 ?auto_161242 ) ) ( not ( = ?auto_161240 ?auto_161243 ) ) ( not ( = ?auto_161241 ?auto_161242 ) ) ( not ( = ?auto_161241 ?auto_161243 ) ) ( not ( = ?auto_161242 ?auto_161243 ) ) ( ON ?auto_161241 ?auto_161242 ) ( ON ?auto_161240 ?auto_161241 ) ( CLEAR ?auto_161240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161240 )
      ( MAKE-3PILE ?auto_161240 ?auto_161241 ?auto_161242 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161248 - BLOCK
      ?auto_161249 - BLOCK
      ?auto_161250 - BLOCK
      ?auto_161251 - BLOCK
    )
    :vars
    (
      ?auto_161252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161250 ) ( ON ?auto_161251 ?auto_161252 ) ( CLEAR ?auto_161251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161248 ) ( ON ?auto_161249 ?auto_161248 ) ( ON ?auto_161250 ?auto_161249 ) ( not ( = ?auto_161248 ?auto_161249 ) ) ( not ( = ?auto_161248 ?auto_161250 ) ) ( not ( = ?auto_161248 ?auto_161251 ) ) ( not ( = ?auto_161248 ?auto_161252 ) ) ( not ( = ?auto_161249 ?auto_161250 ) ) ( not ( = ?auto_161249 ?auto_161251 ) ) ( not ( = ?auto_161249 ?auto_161252 ) ) ( not ( = ?auto_161250 ?auto_161251 ) ) ( not ( = ?auto_161250 ?auto_161252 ) ) ( not ( = ?auto_161251 ?auto_161252 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161251 ?auto_161252 )
      ( !STACK ?auto_161251 ?auto_161250 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161257 - BLOCK
      ?auto_161258 - BLOCK
      ?auto_161259 - BLOCK
      ?auto_161260 - BLOCK
    )
    :vars
    (
      ?auto_161261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161259 ) ( ON ?auto_161260 ?auto_161261 ) ( CLEAR ?auto_161260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161257 ) ( ON ?auto_161258 ?auto_161257 ) ( ON ?auto_161259 ?auto_161258 ) ( not ( = ?auto_161257 ?auto_161258 ) ) ( not ( = ?auto_161257 ?auto_161259 ) ) ( not ( = ?auto_161257 ?auto_161260 ) ) ( not ( = ?auto_161257 ?auto_161261 ) ) ( not ( = ?auto_161258 ?auto_161259 ) ) ( not ( = ?auto_161258 ?auto_161260 ) ) ( not ( = ?auto_161258 ?auto_161261 ) ) ( not ( = ?auto_161259 ?auto_161260 ) ) ( not ( = ?auto_161259 ?auto_161261 ) ) ( not ( = ?auto_161260 ?auto_161261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161260 ?auto_161261 )
      ( !STACK ?auto_161260 ?auto_161259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161266 - BLOCK
      ?auto_161267 - BLOCK
      ?auto_161268 - BLOCK
      ?auto_161269 - BLOCK
    )
    :vars
    (
      ?auto_161270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161269 ?auto_161270 ) ( ON-TABLE ?auto_161266 ) ( ON ?auto_161267 ?auto_161266 ) ( not ( = ?auto_161266 ?auto_161267 ) ) ( not ( = ?auto_161266 ?auto_161268 ) ) ( not ( = ?auto_161266 ?auto_161269 ) ) ( not ( = ?auto_161266 ?auto_161270 ) ) ( not ( = ?auto_161267 ?auto_161268 ) ) ( not ( = ?auto_161267 ?auto_161269 ) ) ( not ( = ?auto_161267 ?auto_161270 ) ) ( not ( = ?auto_161268 ?auto_161269 ) ) ( not ( = ?auto_161268 ?auto_161270 ) ) ( not ( = ?auto_161269 ?auto_161270 ) ) ( CLEAR ?auto_161267 ) ( ON ?auto_161268 ?auto_161269 ) ( CLEAR ?auto_161268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161266 ?auto_161267 ?auto_161268 )
      ( MAKE-4PILE ?auto_161266 ?auto_161267 ?auto_161268 ?auto_161269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161275 - BLOCK
      ?auto_161276 - BLOCK
      ?auto_161277 - BLOCK
      ?auto_161278 - BLOCK
    )
    :vars
    (
      ?auto_161279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161278 ?auto_161279 ) ( ON-TABLE ?auto_161275 ) ( ON ?auto_161276 ?auto_161275 ) ( not ( = ?auto_161275 ?auto_161276 ) ) ( not ( = ?auto_161275 ?auto_161277 ) ) ( not ( = ?auto_161275 ?auto_161278 ) ) ( not ( = ?auto_161275 ?auto_161279 ) ) ( not ( = ?auto_161276 ?auto_161277 ) ) ( not ( = ?auto_161276 ?auto_161278 ) ) ( not ( = ?auto_161276 ?auto_161279 ) ) ( not ( = ?auto_161277 ?auto_161278 ) ) ( not ( = ?auto_161277 ?auto_161279 ) ) ( not ( = ?auto_161278 ?auto_161279 ) ) ( CLEAR ?auto_161276 ) ( ON ?auto_161277 ?auto_161278 ) ( CLEAR ?auto_161277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161275 ?auto_161276 ?auto_161277 )
      ( MAKE-4PILE ?auto_161275 ?auto_161276 ?auto_161277 ?auto_161278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161284 - BLOCK
      ?auto_161285 - BLOCK
      ?auto_161286 - BLOCK
      ?auto_161287 - BLOCK
    )
    :vars
    (
      ?auto_161288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161287 ?auto_161288 ) ( ON-TABLE ?auto_161284 ) ( not ( = ?auto_161284 ?auto_161285 ) ) ( not ( = ?auto_161284 ?auto_161286 ) ) ( not ( = ?auto_161284 ?auto_161287 ) ) ( not ( = ?auto_161284 ?auto_161288 ) ) ( not ( = ?auto_161285 ?auto_161286 ) ) ( not ( = ?auto_161285 ?auto_161287 ) ) ( not ( = ?auto_161285 ?auto_161288 ) ) ( not ( = ?auto_161286 ?auto_161287 ) ) ( not ( = ?auto_161286 ?auto_161288 ) ) ( not ( = ?auto_161287 ?auto_161288 ) ) ( ON ?auto_161286 ?auto_161287 ) ( CLEAR ?auto_161284 ) ( ON ?auto_161285 ?auto_161286 ) ( CLEAR ?auto_161285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161284 ?auto_161285 )
      ( MAKE-4PILE ?auto_161284 ?auto_161285 ?auto_161286 ?auto_161287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161293 - BLOCK
      ?auto_161294 - BLOCK
      ?auto_161295 - BLOCK
      ?auto_161296 - BLOCK
    )
    :vars
    (
      ?auto_161297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161296 ?auto_161297 ) ( ON-TABLE ?auto_161293 ) ( not ( = ?auto_161293 ?auto_161294 ) ) ( not ( = ?auto_161293 ?auto_161295 ) ) ( not ( = ?auto_161293 ?auto_161296 ) ) ( not ( = ?auto_161293 ?auto_161297 ) ) ( not ( = ?auto_161294 ?auto_161295 ) ) ( not ( = ?auto_161294 ?auto_161296 ) ) ( not ( = ?auto_161294 ?auto_161297 ) ) ( not ( = ?auto_161295 ?auto_161296 ) ) ( not ( = ?auto_161295 ?auto_161297 ) ) ( not ( = ?auto_161296 ?auto_161297 ) ) ( ON ?auto_161295 ?auto_161296 ) ( CLEAR ?auto_161293 ) ( ON ?auto_161294 ?auto_161295 ) ( CLEAR ?auto_161294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161293 ?auto_161294 )
      ( MAKE-4PILE ?auto_161293 ?auto_161294 ?auto_161295 ?auto_161296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161302 - BLOCK
      ?auto_161303 - BLOCK
      ?auto_161304 - BLOCK
      ?auto_161305 - BLOCK
    )
    :vars
    (
      ?auto_161306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161305 ?auto_161306 ) ( not ( = ?auto_161302 ?auto_161303 ) ) ( not ( = ?auto_161302 ?auto_161304 ) ) ( not ( = ?auto_161302 ?auto_161305 ) ) ( not ( = ?auto_161302 ?auto_161306 ) ) ( not ( = ?auto_161303 ?auto_161304 ) ) ( not ( = ?auto_161303 ?auto_161305 ) ) ( not ( = ?auto_161303 ?auto_161306 ) ) ( not ( = ?auto_161304 ?auto_161305 ) ) ( not ( = ?auto_161304 ?auto_161306 ) ) ( not ( = ?auto_161305 ?auto_161306 ) ) ( ON ?auto_161304 ?auto_161305 ) ( ON ?auto_161303 ?auto_161304 ) ( ON ?auto_161302 ?auto_161303 ) ( CLEAR ?auto_161302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161302 )
      ( MAKE-4PILE ?auto_161302 ?auto_161303 ?auto_161304 ?auto_161305 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_161311 - BLOCK
      ?auto_161312 - BLOCK
      ?auto_161313 - BLOCK
      ?auto_161314 - BLOCK
    )
    :vars
    (
      ?auto_161315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161314 ?auto_161315 ) ( not ( = ?auto_161311 ?auto_161312 ) ) ( not ( = ?auto_161311 ?auto_161313 ) ) ( not ( = ?auto_161311 ?auto_161314 ) ) ( not ( = ?auto_161311 ?auto_161315 ) ) ( not ( = ?auto_161312 ?auto_161313 ) ) ( not ( = ?auto_161312 ?auto_161314 ) ) ( not ( = ?auto_161312 ?auto_161315 ) ) ( not ( = ?auto_161313 ?auto_161314 ) ) ( not ( = ?auto_161313 ?auto_161315 ) ) ( not ( = ?auto_161314 ?auto_161315 ) ) ( ON ?auto_161313 ?auto_161314 ) ( ON ?auto_161312 ?auto_161313 ) ( ON ?auto_161311 ?auto_161312 ) ( CLEAR ?auto_161311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161311 )
      ( MAKE-4PILE ?auto_161311 ?auto_161312 ?auto_161313 ?auto_161314 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161321 - BLOCK
      ?auto_161322 - BLOCK
      ?auto_161323 - BLOCK
      ?auto_161324 - BLOCK
      ?auto_161325 - BLOCK
    )
    :vars
    (
      ?auto_161326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161324 ) ( ON ?auto_161325 ?auto_161326 ) ( CLEAR ?auto_161325 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161321 ) ( ON ?auto_161322 ?auto_161321 ) ( ON ?auto_161323 ?auto_161322 ) ( ON ?auto_161324 ?auto_161323 ) ( not ( = ?auto_161321 ?auto_161322 ) ) ( not ( = ?auto_161321 ?auto_161323 ) ) ( not ( = ?auto_161321 ?auto_161324 ) ) ( not ( = ?auto_161321 ?auto_161325 ) ) ( not ( = ?auto_161321 ?auto_161326 ) ) ( not ( = ?auto_161322 ?auto_161323 ) ) ( not ( = ?auto_161322 ?auto_161324 ) ) ( not ( = ?auto_161322 ?auto_161325 ) ) ( not ( = ?auto_161322 ?auto_161326 ) ) ( not ( = ?auto_161323 ?auto_161324 ) ) ( not ( = ?auto_161323 ?auto_161325 ) ) ( not ( = ?auto_161323 ?auto_161326 ) ) ( not ( = ?auto_161324 ?auto_161325 ) ) ( not ( = ?auto_161324 ?auto_161326 ) ) ( not ( = ?auto_161325 ?auto_161326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161325 ?auto_161326 )
      ( !STACK ?auto_161325 ?auto_161324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161332 - BLOCK
      ?auto_161333 - BLOCK
      ?auto_161334 - BLOCK
      ?auto_161335 - BLOCK
      ?auto_161336 - BLOCK
    )
    :vars
    (
      ?auto_161337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161335 ) ( ON ?auto_161336 ?auto_161337 ) ( CLEAR ?auto_161336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161332 ) ( ON ?auto_161333 ?auto_161332 ) ( ON ?auto_161334 ?auto_161333 ) ( ON ?auto_161335 ?auto_161334 ) ( not ( = ?auto_161332 ?auto_161333 ) ) ( not ( = ?auto_161332 ?auto_161334 ) ) ( not ( = ?auto_161332 ?auto_161335 ) ) ( not ( = ?auto_161332 ?auto_161336 ) ) ( not ( = ?auto_161332 ?auto_161337 ) ) ( not ( = ?auto_161333 ?auto_161334 ) ) ( not ( = ?auto_161333 ?auto_161335 ) ) ( not ( = ?auto_161333 ?auto_161336 ) ) ( not ( = ?auto_161333 ?auto_161337 ) ) ( not ( = ?auto_161334 ?auto_161335 ) ) ( not ( = ?auto_161334 ?auto_161336 ) ) ( not ( = ?auto_161334 ?auto_161337 ) ) ( not ( = ?auto_161335 ?auto_161336 ) ) ( not ( = ?auto_161335 ?auto_161337 ) ) ( not ( = ?auto_161336 ?auto_161337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161336 ?auto_161337 )
      ( !STACK ?auto_161336 ?auto_161335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161343 - BLOCK
      ?auto_161344 - BLOCK
      ?auto_161345 - BLOCK
      ?auto_161346 - BLOCK
      ?auto_161347 - BLOCK
    )
    :vars
    (
      ?auto_161348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161347 ?auto_161348 ) ( ON-TABLE ?auto_161343 ) ( ON ?auto_161344 ?auto_161343 ) ( ON ?auto_161345 ?auto_161344 ) ( not ( = ?auto_161343 ?auto_161344 ) ) ( not ( = ?auto_161343 ?auto_161345 ) ) ( not ( = ?auto_161343 ?auto_161346 ) ) ( not ( = ?auto_161343 ?auto_161347 ) ) ( not ( = ?auto_161343 ?auto_161348 ) ) ( not ( = ?auto_161344 ?auto_161345 ) ) ( not ( = ?auto_161344 ?auto_161346 ) ) ( not ( = ?auto_161344 ?auto_161347 ) ) ( not ( = ?auto_161344 ?auto_161348 ) ) ( not ( = ?auto_161345 ?auto_161346 ) ) ( not ( = ?auto_161345 ?auto_161347 ) ) ( not ( = ?auto_161345 ?auto_161348 ) ) ( not ( = ?auto_161346 ?auto_161347 ) ) ( not ( = ?auto_161346 ?auto_161348 ) ) ( not ( = ?auto_161347 ?auto_161348 ) ) ( CLEAR ?auto_161345 ) ( ON ?auto_161346 ?auto_161347 ) ( CLEAR ?auto_161346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161343 ?auto_161344 ?auto_161345 ?auto_161346 )
      ( MAKE-5PILE ?auto_161343 ?auto_161344 ?auto_161345 ?auto_161346 ?auto_161347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161354 - BLOCK
      ?auto_161355 - BLOCK
      ?auto_161356 - BLOCK
      ?auto_161357 - BLOCK
      ?auto_161358 - BLOCK
    )
    :vars
    (
      ?auto_161359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161358 ?auto_161359 ) ( ON-TABLE ?auto_161354 ) ( ON ?auto_161355 ?auto_161354 ) ( ON ?auto_161356 ?auto_161355 ) ( not ( = ?auto_161354 ?auto_161355 ) ) ( not ( = ?auto_161354 ?auto_161356 ) ) ( not ( = ?auto_161354 ?auto_161357 ) ) ( not ( = ?auto_161354 ?auto_161358 ) ) ( not ( = ?auto_161354 ?auto_161359 ) ) ( not ( = ?auto_161355 ?auto_161356 ) ) ( not ( = ?auto_161355 ?auto_161357 ) ) ( not ( = ?auto_161355 ?auto_161358 ) ) ( not ( = ?auto_161355 ?auto_161359 ) ) ( not ( = ?auto_161356 ?auto_161357 ) ) ( not ( = ?auto_161356 ?auto_161358 ) ) ( not ( = ?auto_161356 ?auto_161359 ) ) ( not ( = ?auto_161357 ?auto_161358 ) ) ( not ( = ?auto_161357 ?auto_161359 ) ) ( not ( = ?auto_161358 ?auto_161359 ) ) ( CLEAR ?auto_161356 ) ( ON ?auto_161357 ?auto_161358 ) ( CLEAR ?auto_161357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161354 ?auto_161355 ?auto_161356 ?auto_161357 )
      ( MAKE-5PILE ?auto_161354 ?auto_161355 ?auto_161356 ?auto_161357 ?auto_161358 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161365 - BLOCK
      ?auto_161366 - BLOCK
      ?auto_161367 - BLOCK
      ?auto_161368 - BLOCK
      ?auto_161369 - BLOCK
    )
    :vars
    (
      ?auto_161370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161369 ?auto_161370 ) ( ON-TABLE ?auto_161365 ) ( ON ?auto_161366 ?auto_161365 ) ( not ( = ?auto_161365 ?auto_161366 ) ) ( not ( = ?auto_161365 ?auto_161367 ) ) ( not ( = ?auto_161365 ?auto_161368 ) ) ( not ( = ?auto_161365 ?auto_161369 ) ) ( not ( = ?auto_161365 ?auto_161370 ) ) ( not ( = ?auto_161366 ?auto_161367 ) ) ( not ( = ?auto_161366 ?auto_161368 ) ) ( not ( = ?auto_161366 ?auto_161369 ) ) ( not ( = ?auto_161366 ?auto_161370 ) ) ( not ( = ?auto_161367 ?auto_161368 ) ) ( not ( = ?auto_161367 ?auto_161369 ) ) ( not ( = ?auto_161367 ?auto_161370 ) ) ( not ( = ?auto_161368 ?auto_161369 ) ) ( not ( = ?auto_161368 ?auto_161370 ) ) ( not ( = ?auto_161369 ?auto_161370 ) ) ( ON ?auto_161368 ?auto_161369 ) ( CLEAR ?auto_161366 ) ( ON ?auto_161367 ?auto_161368 ) ( CLEAR ?auto_161367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161365 ?auto_161366 ?auto_161367 )
      ( MAKE-5PILE ?auto_161365 ?auto_161366 ?auto_161367 ?auto_161368 ?auto_161369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161376 - BLOCK
      ?auto_161377 - BLOCK
      ?auto_161378 - BLOCK
      ?auto_161379 - BLOCK
      ?auto_161380 - BLOCK
    )
    :vars
    (
      ?auto_161381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161380 ?auto_161381 ) ( ON-TABLE ?auto_161376 ) ( ON ?auto_161377 ?auto_161376 ) ( not ( = ?auto_161376 ?auto_161377 ) ) ( not ( = ?auto_161376 ?auto_161378 ) ) ( not ( = ?auto_161376 ?auto_161379 ) ) ( not ( = ?auto_161376 ?auto_161380 ) ) ( not ( = ?auto_161376 ?auto_161381 ) ) ( not ( = ?auto_161377 ?auto_161378 ) ) ( not ( = ?auto_161377 ?auto_161379 ) ) ( not ( = ?auto_161377 ?auto_161380 ) ) ( not ( = ?auto_161377 ?auto_161381 ) ) ( not ( = ?auto_161378 ?auto_161379 ) ) ( not ( = ?auto_161378 ?auto_161380 ) ) ( not ( = ?auto_161378 ?auto_161381 ) ) ( not ( = ?auto_161379 ?auto_161380 ) ) ( not ( = ?auto_161379 ?auto_161381 ) ) ( not ( = ?auto_161380 ?auto_161381 ) ) ( ON ?auto_161379 ?auto_161380 ) ( CLEAR ?auto_161377 ) ( ON ?auto_161378 ?auto_161379 ) ( CLEAR ?auto_161378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161376 ?auto_161377 ?auto_161378 )
      ( MAKE-5PILE ?auto_161376 ?auto_161377 ?auto_161378 ?auto_161379 ?auto_161380 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161387 - BLOCK
      ?auto_161388 - BLOCK
      ?auto_161389 - BLOCK
      ?auto_161390 - BLOCK
      ?auto_161391 - BLOCK
    )
    :vars
    (
      ?auto_161392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161391 ?auto_161392 ) ( ON-TABLE ?auto_161387 ) ( not ( = ?auto_161387 ?auto_161388 ) ) ( not ( = ?auto_161387 ?auto_161389 ) ) ( not ( = ?auto_161387 ?auto_161390 ) ) ( not ( = ?auto_161387 ?auto_161391 ) ) ( not ( = ?auto_161387 ?auto_161392 ) ) ( not ( = ?auto_161388 ?auto_161389 ) ) ( not ( = ?auto_161388 ?auto_161390 ) ) ( not ( = ?auto_161388 ?auto_161391 ) ) ( not ( = ?auto_161388 ?auto_161392 ) ) ( not ( = ?auto_161389 ?auto_161390 ) ) ( not ( = ?auto_161389 ?auto_161391 ) ) ( not ( = ?auto_161389 ?auto_161392 ) ) ( not ( = ?auto_161390 ?auto_161391 ) ) ( not ( = ?auto_161390 ?auto_161392 ) ) ( not ( = ?auto_161391 ?auto_161392 ) ) ( ON ?auto_161390 ?auto_161391 ) ( ON ?auto_161389 ?auto_161390 ) ( CLEAR ?auto_161387 ) ( ON ?auto_161388 ?auto_161389 ) ( CLEAR ?auto_161388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161387 ?auto_161388 )
      ( MAKE-5PILE ?auto_161387 ?auto_161388 ?auto_161389 ?auto_161390 ?auto_161391 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161398 - BLOCK
      ?auto_161399 - BLOCK
      ?auto_161400 - BLOCK
      ?auto_161401 - BLOCK
      ?auto_161402 - BLOCK
    )
    :vars
    (
      ?auto_161403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161402 ?auto_161403 ) ( ON-TABLE ?auto_161398 ) ( not ( = ?auto_161398 ?auto_161399 ) ) ( not ( = ?auto_161398 ?auto_161400 ) ) ( not ( = ?auto_161398 ?auto_161401 ) ) ( not ( = ?auto_161398 ?auto_161402 ) ) ( not ( = ?auto_161398 ?auto_161403 ) ) ( not ( = ?auto_161399 ?auto_161400 ) ) ( not ( = ?auto_161399 ?auto_161401 ) ) ( not ( = ?auto_161399 ?auto_161402 ) ) ( not ( = ?auto_161399 ?auto_161403 ) ) ( not ( = ?auto_161400 ?auto_161401 ) ) ( not ( = ?auto_161400 ?auto_161402 ) ) ( not ( = ?auto_161400 ?auto_161403 ) ) ( not ( = ?auto_161401 ?auto_161402 ) ) ( not ( = ?auto_161401 ?auto_161403 ) ) ( not ( = ?auto_161402 ?auto_161403 ) ) ( ON ?auto_161401 ?auto_161402 ) ( ON ?auto_161400 ?auto_161401 ) ( CLEAR ?auto_161398 ) ( ON ?auto_161399 ?auto_161400 ) ( CLEAR ?auto_161399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161398 ?auto_161399 )
      ( MAKE-5PILE ?auto_161398 ?auto_161399 ?auto_161400 ?auto_161401 ?auto_161402 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161409 - BLOCK
      ?auto_161410 - BLOCK
      ?auto_161411 - BLOCK
      ?auto_161412 - BLOCK
      ?auto_161413 - BLOCK
    )
    :vars
    (
      ?auto_161414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161413 ?auto_161414 ) ( not ( = ?auto_161409 ?auto_161410 ) ) ( not ( = ?auto_161409 ?auto_161411 ) ) ( not ( = ?auto_161409 ?auto_161412 ) ) ( not ( = ?auto_161409 ?auto_161413 ) ) ( not ( = ?auto_161409 ?auto_161414 ) ) ( not ( = ?auto_161410 ?auto_161411 ) ) ( not ( = ?auto_161410 ?auto_161412 ) ) ( not ( = ?auto_161410 ?auto_161413 ) ) ( not ( = ?auto_161410 ?auto_161414 ) ) ( not ( = ?auto_161411 ?auto_161412 ) ) ( not ( = ?auto_161411 ?auto_161413 ) ) ( not ( = ?auto_161411 ?auto_161414 ) ) ( not ( = ?auto_161412 ?auto_161413 ) ) ( not ( = ?auto_161412 ?auto_161414 ) ) ( not ( = ?auto_161413 ?auto_161414 ) ) ( ON ?auto_161412 ?auto_161413 ) ( ON ?auto_161411 ?auto_161412 ) ( ON ?auto_161410 ?auto_161411 ) ( ON ?auto_161409 ?auto_161410 ) ( CLEAR ?auto_161409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161409 )
      ( MAKE-5PILE ?auto_161409 ?auto_161410 ?auto_161411 ?auto_161412 ?auto_161413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_161420 - BLOCK
      ?auto_161421 - BLOCK
      ?auto_161422 - BLOCK
      ?auto_161423 - BLOCK
      ?auto_161424 - BLOCK
    )
    :vars
    (
      ?auto_161425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161424 ?auto_161425 ) ( not ( = ?auto_161420 ?auto_161421 ) ) ( not ( = ?auto_161420 ?auto_161422 ) ) ( not ( = ?auto_161420 ?auto_161423 ) ) ( not ( = ?auto_161420 ?auto_161424 ) ) ( not ( = ?auto_161420 ?auto_161425 ) ) ( not ( = ?auto_161421 ?auto_161422 ) ) ( not ( = ?auto_161421 ?auto_161423 ) ) ( not ( = ?auto_161421 ?auto_161424 ) ) ( not ( = ?auto_161421 ?auto_161425 ) ) ( not ( = ?auto_161422 ?auto_161423 ) ) ( not ( = ?auto_161422 ?auto_161424 ) ) ( not ( = ?auto_161422 ?auto_161425 ) ) ( not ( = ?auto_161423 ?auto_161424 ) ) ( not ( = ?auto_161423 ?auto_161425 ) ) ( not ( = ?auto_161424 ?auto_161425 ) ) ( ON ?auto_161423 ?auto_161424 ) ( ON ?auto_161422 ?auto_161423 ) ( ON ?auto_161421 ?auto_161422 ) ( ON ?auto_161420 ?auto_161421 ) ( CLEAR ?auto_161420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161420 )
      ( MAKE-5PILE ?auto_161420 ?auto_161421 ?auto_161422 ?auto_161423 ?auto_161424 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161432 - BLOCK
      ?auto_161433 - BLOCK
      ?auto_161434 - BLOCK
      ?auto_161435 - BLOCK
      ?auto_161436 - BLOCK
      ?auto_161437 - BLOCK
    )
    :vars
    (
      ?auto_161438 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161436 ) ( ON ?auto_161437 ?auto_161438 ) ( CLEAR ?auto_161437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161432 ) ( ON ?auto_161433 ?auto_161432 ) ( ON ?auto_161434 ?auto_161433 ) ( ON ?auto_161435 ?auto_161434 ) ( ON ?auto_161436 ?auto_161435 ) ( not ( = ?auto_161432 ?auto_161433 ) ) ( not ( = ?auto_161432 ?auto_161434 ) ) ( not ( = ?auto_161432 ?auto_161435 ) ) ( not ( = ?auto_161432 ?auto_161436 ) ) ( not ( = ?auto_161432 ?auto_161437 ) ) ( not ( = ?auto_161432 ?auto_161438 ) ) ( not ( = ?auto_161433 ?auto_161434 ) ) ( not ( = ?auto_161433 ?auto_161435 ) ) ( not ( = ?auto_161433 ?auto_161436 ) ) ( not ( = ?auto_161433 ?auto_161437 ) ) ( not ( = ?auto_161433 ?auto_161438 ) ) ( not ( = ?auto_161434 ?auto_161435 ) ) ( not ( = ?auto_161434 ?auto_161436 ) ) ( not ( = ?auto_161434 ?auto_161437 ) ) ( not ( = ?auto_161434 ?auto_161438 ) ) ( not ( = ?auto_161435 ?auto_161436 ) ) ( not ( = ?auto_161435 ?auto_161437 ) ) ( not ( = ?auto_161435 ?auto_161438 ) ) ( not ( = ?auto_161436 ?auto_161437 ) ) ( not ( = ?auto_161436 ?auto_161438 ) ) ( not ( = ?auto_161437 ?auto_161438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161437 ?auto_161438 )
      ( !STACK ?auto_161437 ?auto_161436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161445 - BLOCK
      ?auto_161446 - BLOCK
      ?auto_161447 - BLOCK
      ?auto_161448 - BLOCK
      ?auto_161449 - BLOCK
      ?auto_161450 - BLOCK
    )
    :vars
    (
      ?auto_161451 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161449 ) ( ON ?auto_161450 ?auto_161451 ) ( CLEAR ?auto_161450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161445 ) ( ON ?auto_161446 ?auto_161445 ) ( ON ?auto_161447 ?auto_161446 ) ( ON ?auto_161448 ?auto_161447 ) ( ON ?auto_161449 ?auto_161448 ) ( not ( = ?auto_161445 ?auto_161446 ) ) ( not ( = ?auto_161445 ?auto_161447 ) ) ( not ( = ?auto_161445 ?auto_161448 ) ) ( not ( = ?auto_161445 ?auto_161449 ) ) ( not ( = ?auto_161445 ?auto_161450 ) ) ( not ( = ?auto_161445 ?auto_161451 ) ) ( not ( = ?auto_161446 ?auto_161447 ) ) ( not ( = ?auto_161446 ?auto_161448 ) ) ( not ( = ?auto_161446 ?auto_161449 ) ) ( not ( = ?auto_161446 ?auto_161450 ) ) ( not ( = ?auto_161446 ?auto_161451 ) ) ( not ( = ?auto_161447 ?auto_161448 ) ) ( not ( = ?auto_161447 ?auto_161449 ) ) ( not ( = ?auto_161447 ?auto_161450 ) ) ( not ( = ?auto_161447 ?auto_161451 ) ) ( not ( = ?auto_161448 ?auto_161449 ) ) ( not ( = ?auto_161448 ?auto_161450 ) ) ( not ( = ?auto_161448 ?auto_161451 ) ) ( not ( = ?auto_161449 ?auto_161450 ) ) ( not ( = ?auto_161449 ?auto_161451 ) ) ( not ( = ?auto_161450 ?auto_161451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161450 ?auto_161451 )
      ( !STACK ?auto_161450 ?auto_161449 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161458 - BLOCK
      ?auto_161459 - BLOCK
      ?auto_161460 - BLOCK
      ?auto_161461 - BLOCK
      ?auto_161462 - BLOCK
      ?auto_161463 - BLOCK
    )
    :vars
    (
      ?auto_161464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161463 ?auto_161464 ) ( ON-TABLE ?auto_161458 ) ( ON ?auto_161459 ?auto_161458 ) ( ON ?auto_161460 ?auto_161459 ) ( ON ?auto_161461 ?auto_161460 ) ( not ( = ?auto_161458 ?auto_161459 ) ) ( not ( = ?auto_161458 ?auto_161460 ) ) ( not ( = ?auto_161458 ?auto_161461 ) ) ( not ( = ?auto_161458 ?auto_161462 ) ) ( not ( = ?auto_161458 ?auto_161463 ) ) ( not ( = ?auto_161458 ?auto_161464 ) ) ( not ( = ?auto_161459 ?auto_161460 ) ) ( not ( = ?auto_161459 ?auto_161461 ) ) ( not ( = ?auto_161459 ?auto_161462 ) ) ( not ( = ?auto_161459 ?auto_161463 ) ) ( not ( = ?auto_161459 ?auto_161464 ) ) ( not ( = ?auto_161460 ?auto_161461 ) ) ( not ( = ?auto_161460 ?auto_161462 ) ) ( not ( = ?auto_161460 ?auto_161463 ) ) ( not ( = ?auto_161460 ?auto_161464 ) ) ( not ( = ?auto_161461 ?auto_161462 ) ) ( not ( = ?auto_161461 ?auto_161463 ) ) ( not ( = ?auto_161461 ?auto_161464 ) ) ( not ( = ?auto_161462 ?auto_161463 ) ) ( not ( = ?auto_161462 ?auto_161464 ) ) ( not ( = ?auto_161463 ?auto_161464 ) ) ( CLEAR ?auto_161461 ) ( ON ?auto_161462 ?auto_161463 ) ( CLEAR ?auto_161462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161458 ?auto_161459 ?auto_161460 ?auto_161461 ?auto_161462 )
      ( MAKE-6PILE ?auto_161458 ?auto_161459 ?auto_161460 ?auto_161461 ?auto_161462 ?auto_161463 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161471 - BLOCK
      ?auto_161472 - BLOCK
      ?auto_161473 - BLOCK
      ?auto_161474 - BLOCK
      ?auto_161475 - BLOCK
      ?auto_161476 - BLOCK
    )
    :vars
    (
      ?auto_161477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161476 ?auto_161477 ) ( ON-TABLE ?auto_161471 ) ( ON ?auto_161472 ?auto_161471 ) ( ON ?auto_161473 ?auto_161472 ) ( ON ?auto_161474 ?auto_161473 ) ( not ( = ?auto_161471 ?auto_161472 ) ) ( not ( = ?auto_161471 ?auto_161473 ) ) ( not ( = ?auto_161471 ?auto_161474 ) ) ( not ( = ?auto_161471 ?auto_161475 ) ) ( not ( = ?auto_161471 ?auto_161476 ) ) ( not ( = ?auto_161471 ?auto_161477 ) ) ( not ( = ?auto_161472 ?auto_161473 ) ) ( not ( = ?auto_161472 ?auto_161474 ) ) ( not ( = ?auto_161472 ?auto_161475 ) ) ( not ( = ?auto_161472 ?auto_161476 ) ) ( not ( = ?auto_161472 ?auto_161477 ) ) ( not ( = ?auto_161473 ?auto_161474 ) ) ( not ( = ?auto_161473 ?auto_161475 ) ) ( not ( = ?auto_161473 ?auto_161476 ) ) ( not ( = ?auto_161473 ?auto_161477 ) ) ( not ( = ?auto_161474 ?auto_161475 ) ) ( not ( = ?auto_161474 ?auto_161476 ) ) ( not ( = ?auto_161474 ?auto_161477 ) ) ( not ( = ?auto_161475 ?auto_161476 ) ) ( not ( = ?auto_161475 ?auto_161477 ) ) ( not ( = ?auto_161476 ?auto_161477 ) ) ( CLEAR ?auto_161474 ) ( ON ?auto_161475 ?auto_161476 ) ( CLEAR ?auto_161475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161471 ?auto_161472 ?auto_161473 ?auto_161474 ?auto_161475 )
      ( MAKE-6PILE ?auto_161471 ?auto_161472 ?auto_161473 ?auto_161474 ?auto_161475 ?auto_161476 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161484 - BLOCK
      ?auto_161485 - BLOCK
      ?auto_161486 - BLOCK
      ?auto_161487 - BLOCK
      ?auto_161488 - BLOCK
      ?auto_161489 - BLOCK
    )
    :vars
    (
      ?auto_161490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161489 ?auto_161490 ) ( ON-TABLE ?auto_161484 ) ( ON ?auto_161485 ?auto_161484 ) ( ON ?auto_161486 ?auto_161485 ) ( not ( = ?auto_161484 ?auto_161485 ) ) ( not ( = ?auto_161484 ?auto_161486 ) ) ( not ( = ?auto_161484 ?auto_161487 ) ) ( not ( = ?auto_161484 ?auto_161488 ) ) ( not ( = ?auto_161484 ?auto_161489 ) ) ( not ( = ?auto_161484 ?auto_161490 ) ) ( not ( = ?auto_161485 ?auto_161486 ) ) ( not ( = ?auto_161485 ?auto_161487 ) ) ( not ( = ?auto_161485 ?auto_161488 ) ) ( not ( = ?auto_161485 ?auto_161489 ) ) ( not ( = ?auto_161485 ?auto_161490 ) ) ( not ( = ?auto_161486 ?auto_161487 ) ) ( not ( = ?auto_161486 ?auto_161488 ) ) ( not ( = ?auto_161486 ?auto_161489 ) ) ( not ( = ?auto_161486 ?auto_161490 ) ) ( not ( = ?auto_161487 ?auto_161488 ) ) ( not ( = ?auto_161487 ?auto_161489 ) ) ( not ( = ?auto_161487 ?auto_161490 ) ) ( not ( = ?auto_161488 ?auto_161489 ) ) ( not ( = ?auto_161488 ?auto_161490 ) ) ( not ( = ?auto_161489 ?auto_161490 ) ) ( ON ?auto_161488 ?auto_161489 ) ( CLEAR ?auto_161486 ) ( ON ?auto_161487 ?auto_161488 ) ( CLEAR ?auto_161487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161484 ?auto_161485 ?auto_161486 ?auto_161487 )
      ( MAKE-6PILE ?auto_161484 ?auto_161485 ?auto_161486 ?auto_161487 ?auto_161488 ?auto_161489 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161497 - BLOCK
      ?auto_161498 - BLOCK
      ?auto_161499 - BLOCK
      ?auto_161500 - BLOCK
      ?auto_161501 - BLOCK
      ?auto_161502 - BLOCK
    )
    :vars
    (
      ?auto_161503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161502 ?auto_161503 ) ( ON-TABLE ?auto_161497 ) ( ON ?auto_161498 ?auto_161497 ) ( ON ?auto_161499 ?auto_161498 ) ( not ( = ?auto_161497 ?auto_161498 ) ) ( not ( = ?auto_161497 ?auto_161499 ) ) ( not ( = ?auto_161497 ?auto_161500 ) ) ( not ( = ?auto_161497 ?auto_161501 ) ) ( not ( = ?auto_161497 ?auto_161502 ) ) ( not ( = ?auto_161497 ?auto_161503 ) ) ( not ( = ?auto_161498 ?auto_161499 ) ) ( not ( = ?auto_161498 ?auto_161500 ) ) ( not ( = ?auto_161498 ?auto_161501 ) ) ( not ( = ?auto_161498 ?auto_161502 ) ) ( not ( = ?auto_161498 ?auto_161503 ) ) ( not ( = ?auto_161499 ?auto_161500 ) ) ( not ( = ?auto_161499 ?auto_161501 ) ) ( not ( = ?auto_161499 ?auto_161502 ) ) ( not ( = ?auto_161499 ?auto_161503 ) ) ( not ( = ?auto_161500 ?auto_161501 ) ) ( not ( = ?auto_161500 ?auto_161502 ) ) ( not ( = ?auto_161500 ?auto_161503 ) ) ( not ( = ?auto_161501 ?auto_161502 ) ) ( not ( = ?auto_161501 ?auto_161503 ) ) ( not ( = ?auto_161502 ?auto_161503 ) ) ( ON ?auto_161501 ?auto_161502 ) ( CLEAR ?auto_161499 ) ( ON ?auto_161500 ?auto_161501 ) ( CLEAR ?auto_161500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161497 ?auto_161498 ?auto_161499 ?auto_161500 )
      ( MAKE-6PILE ?auto_161497 ?auto_161498 ?auto_161499 ?auto_161500 ?auto_161501 ?auto_161502 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161510 - BLOCK
      ?auto_161511 - BLOCK
      ?auto_161512 - BLOCK
      ?auto_161513 - BLOCK
      ?auto_161514 - BLOCK
      ?auto_161515 - BLOCK
    )
    :vars
    (
      ?auto_161516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161515 ?auto_161516 ) ( ON-TABLE ?auto_161510 ) ( ON ?auto_161511 ?auto_161510 ) ( not ( = ?auto_161510 ?auto_161511 ) ) ( not ( = ?auto_161510 ?auto_161512 ) ) ( not ( = ?auto_161510 ?auto_161513 ) ) ( not ( = ?auto_161510 ?auto_161514 ) ) ( not ( = ?auto_161510 ?auto_161515 ) ) ( not ( = ?auto_161510 ?auto_161516 ) ) ( not ( = ?auto_161511 ?auto_161512 ) ) ( not ( = ?auto_161511 ?auto_161513 ) ) ( not ( = ?auto_161511 ?auto_161514 ) ) ( not ( = ?auto_161511 ?auto_161515 ) ) ( not ( = ?auto_161511 ?auto_161516 ) ) ( not ( = ?auto_161512 ?auto_161513 ) ) ( not ( = ?auto_161512 ?auto_161514 ) ) ( not ( = ?auto_161512 ?auto_161515 ) ) ( not ( = ?auto_161512 ?auto_161516 ) ) ( not ( = ?auto_161513 ?auto_161514 ) ) ( not ( = ?auto_161513 ?auto_161515 ) ) ( not ( = ?auto_161513 ?auto_161516 ) ) ( not ( = ?auto_161514 ?auto_161515 ) ) ( not ( = ?auto_161514 ?auto_161516 ) ) ( not ( = ?auto_161515 ?auto_161516 ) ) ( ON ?auto_161514 ?auto_161515 ) ( ON ?auto_161513 ?auto_161514 ) ( CLEAR ?auto_161511 ) ( ON ?auto_161512 ?auto_161513 ) ( CLEAR ?auto_161512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161510 ?auto_161511 ?auto_161512 )
      ( MAKE-6PILE ?auto_161510 ?auto_161511 ?auto_161512 ?auto_161513 ?auto_161514 ?auto_161515 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161523 - BLOCK
      ?auto_161524 - BLOCK
      ?auto_161525 - BLOCK
      ?auto_161526 - BLOCK
      ?auto_161527 - BLOCK
      ?auto_161528 - BLOCK
    )
    :vars
    (
      ?auto_161529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161528 ?auto_161529 ) ( ON-TABLE ?auto_161523 ) ( ON ?auto_161524 ?auto_161523 ) ( not ( = ?auto_161523 ?auto_161524 ) ) ( not ( = ?auto_161523 ?auto_161525 ) ) ( not ( = ?auto_161523 ?auto_161526 ) ) ( not ( = ?auto_161523 ?auto_161527 ) ) ( not ( = ?auto_161523 ?auto_161528 ) ) ( not ( = ?auto_161523 ?auto_161529 ) ) ( not ( = ?auto_161524 ?auto_161525 ) ) ( not ( = ?auto_161524 ?auto_161526 ) ) ( not ( = ?auto_161524 ?auto_161527 ) ) ( not ( = ?auto_161524 ?auto_161528 ) ) ( not ( = ?auto_161524 ?auto_161529 ) ) ( not ( = ?auto_161525 ?auto_161526 ) ) ( not ( = ?auto_161525 ?auto_161527 ) ) ( not ( = ?auto_161525 ?auto_161528 ) ) ( not ( = ?auto_161525 ?auto_161529 ) ) ( not ( = ?auto_161526 ?auto_161527 ) ) ( not ( = ?auto_161526 ?auto_161528 ) ) ( not ( = ?auto_161526 ?auto_161529 ) ) ( not ( = ?auto_161527 ?auto_161528 ) ) ( not ( = ?auto_161527 ?auto_161529 ) ) ( not ( = ?auto_161528 ?auto_161529 ) ) ( ON ?auto_161527 ?auto_161528 ) ( ON ?auto_161526 ?auto_161527 ) ( CLEAR ?auto_161524 ) ( ON ?auto_161525 ?auto_161526 ) ( CLEAR ?auto_161525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161523 ?auto_161524 ?auto_161525 )
      ( MAKE-6PILE ?auto_161523 ?auto_161524 ?auto_161525 ?auto_161526 ?auto_161527 ?auto_161528 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161536 - BLOCK
      ?auto_161537 - BLOCK
      ?auto_161538 - BLOCK
      ?auto_161539 - BLOCK
      ?auto_161540 - BLOCK
      ?auto_161541 - BLOCK
    )
    :vars
    (
      ?auto_161542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161541 ?auto_161542 ) ( ON-TABLE ?auto_161536 ) ( not ( = ?auto_161536 ?auto_161537 ) ) ( not ( = ?auto_161536 ?auto_161538 ) ) ( not ( = ?auto_161536 ?auto_161539 ) ) ( not ( = ?auto_161536 ?auto_161540 ) ) ( not ( = ?auto_161536 ?auto_161541 ) ) ( not ( = ?auto_161536 ?auto_161542 ) ) ( not ( = ?auto_161537 ?auto_161538 ) ) ( not ( = ?auto_161537 ?auto_161539 ) ) ( not ( = ?auto_161537 ?auto_161540 ) ) ( not ( = ?auto_161537 ?auto_161541 ) ) ( not ( = ?auto_161537 ?auto_161542 ) ) ( not ( = ?auto_161538 ?auto_161539 ) ) ( not ( = ?auto_161538 ?auto_161540 ) ) ( not ( = ?auto_161538 ?auto_161541 ) ) ( not ( = ?auto_161538 ?auto_161542 ) ) ( not ( = ?auto_161539 ?auto_161540 ) ) ( not ( = ?auto_161539 ?auto_161541 ) ) ( not ( = ?auto_161539 ?auto_161542 ) ) ( not ( = ?auto_161540 ?auto_161541 ) ) ( not ( = ?auto_161540 ?auto_161542 ) ) ( not ( = ?auto_161541 ?auto_161542 ) ) ( ON ?auto_161540 ?auto_161541 ) ( ON ?auto_161539 ?auto_161540 ) ( ON ?auto_161538 ?auto_161539 ) ( CLEAR ?auto_161536 ) ( ON ?auto_161537 ?auto_161538 ) ( CLEAR ?auto_161537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161536 ?auto_161537 )
      ( MAKE-6PILE ?auto_161536 ?auto_161537 ?auto_161538 ?auto_161539 ?auto_161540 ?auto_161541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161549 - BLOCK
      ?auto_161550 - BLOCK
      ?auto_161551 - BLOCK
      ?auto_161552 - BLOCK
      ?auto_161553 - BLOCK
      ?auto_161554 - BLOCK
    )
    :vars
    (
      ?auto_161555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161554 ?auto_161555 ) ( ON-TABLE ?auto_161549 ) ( not ( = ?auto_161549 ?auto_161550 ) ) ( not ( = ?auto_161549 ?auto_161551 ) ) ( not ( = ?auto_161549 ?auto_161552 ) ) ( not ( = ?auto_161549 ?auto_161553 ) ) ( not ( = ?auto_161549 ?auto_161554 ) ) ( not ( = ?auto_161549 ?auto_161555 ) ) ( not ( = ?auto_161550 ?auto_161551 ) ) ( not ( = ?auto_161550 ?auto_161552 ) ) ( not ( = ?auto_161550 ?auto_161553 ) ) ( not ( = ?auto_161550 ?auto_161554 ) ) ( not ( = ?auto_161550 ?auto_161555 ) ) ( not ( = ?auto_161551 ?auto_161552 ) ) ( not ( = ?auto_161551 ?auto_161553 ) ) ( not ( = ?auto_161551 ?auto_161554 ) ) ( not ( = ?auto_161551 ?auto_161555 ) ) ( not ( = ?auto_161552 ?auto_161553 ) ) ( not ( = ?auto_161552 ?auto_161554 ) ) ( not ( = ?auto_161552 ?auto_161555 ) ) ( not ( = ?auto_161553 ?auto_161554 ) ) ( not ( = ?auto_161553 ?auto_161555 ) ) ( not ( = ?auto_161554 ?auto_161555 ) ) ( ON ?auto_161553 ?auto_161554 ) ( ON ?auto_161552 ?auto_161553 ) ( ON ?auto_161551 ?auto_161552 ) ( CLEAR ?auto_161549 ) ( ON ?auto_161550 ?auto_161551 ) ( CLEAR ?auto_161550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161549 ?auto_161550 )
      ( MAKE-6PILE ?auto_161549 ?auto_161550 ?auto_161551 ?auto_161552 ?auto_161553 ?auto_161554 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161562 - BLOCK
      ?auto_161563 - BLOCK
      ?auto_161564 - BLOCK
      ?auto_161565 - BLOCK
      ?auto_161566 - BLOCK
      ?auto_161567 - BLOCK
    )
    :vars
    (
      ?auto_161568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161567 ?auto_161568 ) ( not ( = ?auto_161562 ?auto_161563 ) ) ( not ( = ?auto_161562 ?auto_161564 ) ) ( not ( = ?auto_161562 ?auto_161565 ) ) ( not ( = ?auto_161562 ?auto_161566 ) ) ( not ( = ?auto_161562 ?auto_161567 ) ) ( not ( = ?auto_161562 ?auto_161568 ) ) ( not ( = ?auto_161563 ?auto_161564 ) ) ( not ( = ?auto_161563 ?auto_161565 ) ) ( not ( = ?auto_161563 ?auto_161566 ) ) ( not ( = ?auto_161563 ?auto_161567 ) ) ( not ( = ?auto_161563 ?auto_161568 ) ) ( not ( = ?auto_161564 ?auto_161565 ) ) ( not ( = ?auto_161564 ?auto_161566 ) ) ( not ( = ?auto_161564 ?auto_161567 ) ) ( not ( = ?auto_161564 ?auto_161568 ) ) ( not ( = ?auto_161565 ?auto_161566 ) ) ( not ( = ?auto_161565 ?auto_161567 ) ) ( not ( = ?auto_161565 ?auto_161568 ) ) ( not ( = ?auto_161566 ?auto_161567 ) ) ( not ( = ?auto_161566 ?auto_161568 ) ) ( not ( = ?auto_161567 ?auto_161568 ) ) ( ON ?auto_161566 ?auto_161567 ) ( ON ?auto_161565 ?auto_161566 ) ( ON ?auto_161564 ?auto_161565 ) ( ON ?auto_161563 ?auto_161564 ) ( ON ?auto_161562 ?auto_161563 ) ( CLEAR ?auto_161562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161562 )
      ( MAKE-6PILE ?auto_161562 ?auto_161563 ?auto_161564 ?auto_161565 ?auto_161566 ?auto_161567 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_161575 - BLOCK
      ?auto_161576 - BLOCK
      ?auto_161577 - BLOCK
      ?auto_161578 - BLOCK
      ?auto_161579 - BLOCK
      ?auto_161580 - BLOCK
    )
    :vars
    (
      ?auto_161581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161580 ?auto_161581 ) ( not ( = ?auto_161575 ?auto_161576 ) ) ( not ( = ?auto_161575 ?auto_161577 ) ) ( not ( = ?auto_161575 ?auto_161578 ) ) ( not ( = ?auto_161575 ?auto_161579 ) ) ( not ( = ?auto_161575 ?auto_161580 ) ) ( not ( = ?auto_161575 ?auto_161581 ) ) ( not ( = ?auto_161576 ?auto_161577 ) ) ( not ( = ?auto_161576 ?auto_161578 ) ) ( not ( = ?auto_161576 ?auto_161579 ) ) ( not ( = ?auto_161576 ?auto_161580 ) ) ( not ( = ?auto_161576 ?auto_161581 ) ) ( not ( = ?auto_161577 ?auto_161578 ) ) ( not ( = ?auto_161577 ?auto_161579 ) ) ( not ( = ?auto_161577 ?auto_161580 ) ) ( not ( = ?auto_161577 ?auto_161581 ) ) ( not ( = ?auto_161578 ?auto_161579 ) ) ( not ( = ?auto_161578 ?auto_161580 ) ) ( not ( = ?auto_161578 ?auto_161581 ) ) ( not ( = ?auto_161579 ?auto_161580 ) ) ( not ( = ?auto_161579 ?auto_161581 ) ) ( not ( = ?auto_161580 ?auto_161581 ) ) ( ON ?auto_161579 ?auto_161580 ) ( ON ?auto_161578 ?auto_161579 ) ( ON ?auto_161577 ?auto_161578 ) ( ON ?auto_161576 ?auto_161577 ) ( ON ?auto_161575 ?auto_161576 ) ( CLEAR ?auto_161575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161575 )
      ( MAKE-6PILE ?auto_161575 ?auto_161576 ?auto_161577 ?auto_161578 ?auto_161579 ?auto_161580 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161589 - BLOCK
      ?auto_161590 - BLOCK
      ?auto_161591 - BLOCK
      ?auto_161592 - BLOCK
      ?auto_161593 - BLOCK
      ?auto_161594 - BLOCK
      ?auto_161595 - BLOCK
    )
    :vars
    (
      ?auto_161596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161594 ) ( ON ?auto_161595 ?auto_161596 ) ( CLEAR ?auto_161595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161589 ) ( ON ?auto_161590 ?auto_161589 ) ( ON ?auto_161591 ?auto_161590 ) ( ON ?auto_161592 ?auto_161591 ) ( ON ?auto_161593 ?auto_161592 ) ( ON ?auto_161594 ?auto_161593 ) ( not ( = ?auto_161589 ?auto_161590 ) ) ( not ( = ?auto_161589 ?auto_161591 ) ) ( not ( = ?auto_161589 ?auto_161592 ) ) ( not ( = ?auto_161589 ?auto_161593 ) ) ( not ( = ?auto_161589 ?auto_161594 ) ) ( not ( = ?auto_161589 ?auto_161595 ) ) ( not ( = ?auto_161589 ?auto_161596 ) ) ( not ( = ?auto_161590 ?auto_161591 ) ) ( not ( = ?auto_161590 ?auto_161592 ) ) ( not ( = ?auto_161590 ?auto_161593 ) ) ( not ( = ?auto_161590 ?auto_161594 ) ) ( not ( = ?auto_161590 ?auto_161595 ) ) ( not ( = ?auto_161590 ?auto_161596 ) ) ( not ( = ?auto_161591 ?auto_161592 ) ) ( not ( = ?auto_161591 ?auto_161593 ) ) ( not ( = ?auto_161591 ?auto_161594 ) ) ( not ( = ?auto_161591 ?auto_161595 ) ) ( not ( = ?auto_161591 ?auto_161596 ) ) ( not ( = ?auto_161592 ?auto_161593 ) ) ( not ( = ?auto_161592 ?auto_161594 ) ) ( not ( = ?auto_161592 ?auto_161595 ) ) ( not ( = ?auto_161592 ?auto_161596 ) ) ( not ( = ?auto_161593 ?auto_161594 ) ) ( not ( = ?auto_161593 ?auto_161595 ) ) ( not ( = ?auto_161593 ?auto_161596 ) ) ( not ( = ?auto_161594 ?auto_161595 ) ) ( not ( = ?auto_161594 ?auto_161596 ) ) ( not ( = ?auto_161595 ?auto_161596 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161595 ?auto_161596 )
      ( !STACK ?auto_161595 ?auto_161594 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161604 - BLOCK
      ?auto_161605 - BLOCK
      ?auto_161606 - BLOCK
      ?auto_161607 - BLOCK
      ?auto_161608 - BLOCK
      ?auto_161609 - BLOCK
      ?auto_161610 - BLOCK
    )
    :vars
    (
      ?auto_161611 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161609 ) ( ON ?auto_161610 ?auto_161611 ) ( CLEAR ?auto_161610 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161604 ) ( ON ?auto_161605 ?auto_161604 ) ( ON ?auto_161606 ?auto_161605 ) ( ON ?auto_161607 ?auto_161606 ) ( ON ?auto_161608 ?auto_161607 ) ( ON ?auto_161609 ?auto_161608 ) ( not ( = ?auto_161604 ?auto_161605 ) ) ( not ( = ?auto_161604 ?auto_161606 ) ) ( not ( = ?auto_161604 ?auto_161607 ) ) ( not ( = ?auto_161604 ?auto_161608 ) ) ( not ( = ?auto_161604 ?auto_161609 ) ) ( not ( = ?auto_161604 ?auto_161610 ) ) ( not ( = ?auto_161604 ?auto_161611 ) ) ( not ( = ?auto_161605 ?auto_161606 ) ) ( not ( = ?auto_161605 ?auto_161607 ) ) ( not ( = ?auto_161605 ?auto_161608 ) ) ( not ( = ?auto_161605 ?auto_161609 ) ) ( not ( = ?auto_161605 ?auto_161610 ) ) ( not ( = ?auto_161605 ?auto_161611 ) ) ( not ( = ?auto_161606 ?auto_161607 ) ) ( not ( = ?auto_161606 ?auto_161608 ) ) ( not ( = ?auto_161606 ?auto_161609 ) ) ( not ( = ?auto_161606 ?auto_161610 ) ) ( not ( = ?auto_161606 ?auto_161611 ) ) ( not ( = ?auto_161607 ?auto_161608 ) ) ( not ( = ?auto_161607 ?auto_161609 ) ) ( not ( = ?auto_161607 ?auto_161610 ) ) ( not ( = ?auto_161607 ?auto_161611 ) ) ( not ( = ?auto_161608 ?auto_161609 ) ) ( not ( = ?auto_161608 ?auto_161610 ) ) ( not ( = ?auto_161608 ?auto_161611 ) ) ( not ( = ?auto_161609 ?auto_161610 ) ) ( not ( = ?auto_161609 ?auto_161611 ) ) ( not ( = ?auto_161610 ?auto_161611 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161610 ?auto_161611 )
      ( !STACK ?auto_161610 ?auto_161609 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161619 - BLOCK
      ?auto_161620 - BLOCK
      ?auto_161621 - BLOCK
      ?auto_161622 - BLOCK
      ?auto_161623 - BLOCK
      ?auto_161624 - BLOCK
      ?auto_161625 - BLOCK
    )
    :vars
    (
      ?auto_161626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161625 ?auto_161626 ) ( ON-TABLE ?auto_161619 ) ( ON ?auto_161620 ?auto_161619 ) ( ON ?auto_161621 ?auto_161620 ) ( ON ?auto_161622 ?auto_161621 ) ( ON ?auto_161623 ?auto_161622 ) ( not ( = ?auto_161619 ?auto_161620 ) ) ( not ( = ?auto_161619 ?auto_161621 ) ) ( not ( = ?auto_161619 ?auto_161622 ) ) ( not ( = ?auto_161619 ?auto_161623 ) ) ( not ( = ?auto_161619 ?auto_161624 ) ) ( not ( = ?auto_161619 ?auto_161625 ) ) ( not ( = ?auto_161619 ?auto_161626 ) ) ( not ( = ?auto_161620 ?auto_161621 ) ) ( not ( = ?auto_161620 ?auto_161622 ) ) ( not ( = ?auto_161620 ?auto_161623 ) ) ( not ( = ?auto_161620 ?auto_161624 ) ) ( not ( = ?auto_161620 ?auto_161625 ) ) ( not ( = ?auto_161620 ?auto_161626 ) ) ( not ( = ?auto_161621 ?auto_161622 ) ) ( not ( = ?auto_161621 ?auto_161623 ) ) ( not ( = ?auto_161621 ?auto_161624 ) ) ( not ( = ?auto_161621 ?auto_161625 ) ) ( not ( = ?auto_161621 ?auto_161626 ) ) ( not ( = ?auto_161622 ?auto_161623 ) ) ( not ( = ?auto_161622 ?auto_161624 ) ) ( not ( = ?auto_161622 ?auto_161625 ) ) ( not ( = ?auto_161622 ?auto_161626 ) ) ( not ( = ?auto_161623 ?auto_161624 ) ) ( not ( = ?auto_161623 ?auto_161625 ) ) ( not ( = ?auto_161623 ?auto_161626 ) ) ( not ( = ?auto_161624 ?auto_161625 ) ) ( not ( = ?auto_161624 ?auto_161626 ) ) ( not ( = ?auto_161625 ?auto_161626 ) ) ( CLEAR ?auto_161623 ) ( ON ?auto_161624 ?auto_161625 ) ( CLEAR ?auto_161624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161619 ?auto_161620 ?auto_161621 ?auto_161622 ?auto_161623 ?auto_161624 )
      ( MAKE-7PILE ?auto_161619 ?auto_161620 ?auto_161621 ?auto_161622 ?auto_161623 ?auto_161624 ?auto_161625 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161634 - BLOCK
      ?auto_161635 - BLOCK
      ?auto_161636 - BLOCK
      ?auto_161637 - BLOCK
      ?auto_161638 - BLOCK
      ?auto_161639 - BLOCK
      ?auto_161640 - BLOCK
    )
    :vars
    (
      ?auto_161641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161640 ?auto_161641 ) ( ON-TABLE ?auto_161634 ) ( ON ?auto_161635 ?auto_161634 ) ( ON ?auto_161636 ?auto_161635 ) ( ON ?auto_161637 ?auto_161636 ) ( ON ?auto_161638 ?auto_161637 ) ( not ( = ?auto_161634 ?auto_161635 ) ) ( not ( = ?auto_161634 ?auto_161636 ) ) ( not ( = ?auto_161634 ?auto_161637 ) ) ( not ( = ?auto_161634 ?auto_161638 ) ) ( not ( = ?auto_161634 ?auto_161639 ) ) ( not ( = ?auto_161634 ?auto_161640 ) ) ( not ( = ?auto_161634 ?auto_161641 ) ) ( not ( = ?auto_161635 ?auto_161636 ) ) ( not ( = ?auto_161635 ?auto_161637 ) ) ( not ( = ?auto_161635 ?auto_161638 ) ) ( not ( = ?auto_161635 ?auto_161639 ) ) ( not ( = ?auto_161635 ?auto_161640 ) ) ( not ( = ?auto_161635 ?auto_161641 ) ) ( not ( = ?auto_161636 ?auto_161637 ) ) ( not ( = ?auto_161636 ?auto_161638 ) ) ( not ( = ?auto_161636 ?auto_161639 ) ) ( not ( = ?auto_161636 ?auto_161640 ) ) ( not ( = ?auto_161636 ?auto_161641 ) ) ( not ( = ?auto_161637 ?auto_161638 ) ) ( not ( = ?auto_161637 ?auto_161639 ) ) ( not ( = ?auto_161637 ?auto_161640 ) ) ( not ( = ?auto_161637 ?auto_161641 ) ) ( not ( = ?auto_161638 ?auto_161639 ) ) ( not ( = ?auto_161638 ?auto_161640 ) ) ( not ( = ?auto_161638 ?auto_161641 ) ) ( not ( = ?auto_161639 ?auto_161640 ) ) ( not ( = ?auto_161639 ?auto_161641 ) ) ( not ( = ?auto_161640 ?auto_161641 ) ) ( CLEAR ?auto_161638 ) ( ON ?auto_161639 ?auto_161640 ) ( CLEAR ?auto_161639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161634 ?auto_161635 ?auto_161636 ?auto_161637 ?auto_161638 ?auto_161639 )
      ( MAKE-7PILE ?auto_161634 ?auto_161635 ?auto_161636 ?auto_161637 ?auto_161638 ?auto_161639 ?auto_161640 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161649 - BLOCK
      ?auto_161650 - BLOCK
      ?auto_161651 - BLOCK
      ?auto_161652 - BLOCK
      ?auto_161653 - BLOCK
      ?auto_161654 - BLOCK
      ?auto_161655 - BLOCK
    )
    :vars
    (
      ?auto_161656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161655 ?auto_161656 ) ( ON-TABLE ?auto_161649 ) ( ON ?auto_161650 ?auto_161649 ) ( ON ?auto_161651 ?auto_161650 ) ( ON ?auto_161652 ?auto_161651 ) ( not ( = ?auto_161649 ?auto_161650 ) ) ( not ( = ?auto_161649 ?auto_161651 ) ) ( not ( = ?auto_161649 ?auto_161652 ) ) ( not ( = ?auto_161649 ?auto_161653 ) ) ( not ( = ?auto_161649 ?auto_161654 ) ) ( not ( = ?auto_161649 ?auto_161655 ) ) ( not ( = ?auto_161649 ?auto_161656 ) ) ( not ( = ?auto_161650 ?auto_161651 ) ) ( not ( = ?auto_161650 ?auto_161652 ) ) ( not ( = ?auto_161650 ?auto_161653 ) ) ( not ( = ?auto_161650 ?auto_161654 ) ) ( not ( = ?auto_161650 ?auto_161655 ) ) ( not ( = ?auto_161650 ?auto_161656 ) ) ( not ( = ?auto_161651 ?auto_161652 ) ) ( not ( = ?auto_161651 ?auto_161653 ) ) ( not ( = ?auto_161651 ?auto_161654 ) ) ( not ( = ?auto_161651 ?auto_161655 ) ) ( not ( = ?auto_161651 ?auto_161656 ) ) ( not ( = ?auto_161652 ?auto_161653 ) ) ( not ( = ?auto_161652 ?auto_161654 ) ) ( not ( = ?auto_161652 ?auto_161655 ) ) ( not ( = ?auto_161652 ?auto_161656 ) ) ( not ( = ?auto_161653 ?auto_161654 ) ) ( not ( = ?auto_161653 ?auto_161655 ) ) ( not ( = ?auto_161653 ?auto_161656 ) ) ( not ( = ?auto_161654 ?auto_161655 ) ) ( not ( = ?auto_161654 ?auto_161656 ) ) ( not ( = ?auto_161655 ?auto_161656 ) ) ( ON ?auto_161654 ?auto_161655 ) ( CLEAR ?auto_161652 ) ( ON ?auto_161653 ?auto_161654 ) ( CLEAR ?auto_161653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161649 ?auto_161650 ?auto_161651 ?auto_161652 ?auto_161653 )
      ( MAKE-7PILE ?auto_161649 ?auto_161650 ?auto_161651 ?auto_161652 ?auto_161653 ?auto_161654 ?auto_161655 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161664 - BLOCK
      ?auto_161665 - BLOCK
      ?auto_161666 - BLOCK
      ?auto_161667 - BLOCK
      ?auto_161668 - BLOCK
      ?auto_161669 - BLOCK
      ?auto_161670 - BLOCK
    )
    :vars
    (
      ?auto_161671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161670 ?auto_161671 ) ( ON-TABLE ?auto_161664 ) ( ON ?auto_161665 ?auto_161664 ) ( ON ?auto_161666 ?auto_161665 ) ( ON ?auto_161667 ?auto_161666 ) ( not ( = ?auto_161664 ?auto_161665 ) ) ( not ( = ?auto_161664 ?auto_161666 ) ) ( not ( = ?auto_161664 ?auto_161667 ) ) ( not ( = ?auto_161664 ?auto_161668 ) ) ( not ( = ?auto_161664 ?auto_161669 ) ) ( not ( = ?auto_161664 ?auto_161670 ) ) ( not ( = ?auto_161664 ?auto_161671 ) ) ( not ( = ?auto_161665 ?auto_161666 ) ) ( not ( = ?auto_161665 ?auto_161667 ) ) ( not ( = ?auto_161665 ?auto_161668 ) ) ( not ( = ?auto_161665 ?auto_161669 ) ) ( not ( = ?auto_161665 ?auto_161670 ) ) ( not ( = ?auto_161665 ?auto_161671 ) ) ( not ( = ?auto_161666 ?auto_161667 ) ) ( not ( = ?auto_161666 ?auto_161668 ) ) ( not ( = ?auto_161666 ?auto_161669 ) ) ( not ( = ?auto_161666 ?auto_161670 ) ) ( not ( = ?auto_161666 ?auto_161671 ) ) ( not ( = ?auto_161667 ?auto_161668 ) ) ( not ( = ?auto_161667 ?auto_161669 ) ) ( not ( = ?auto_161667 ?auto_161670 ) ) ( not ( = ?auto_161667 ?auto_161671 ) ) ( not ( = ?auto_161668 ?auto_161669 ) ) ( not ( = ?auto_161668 ?auto_161670 ) ) ( not ( = ?auto_161668 ?auto_161671 ) ) ( not ( = ?auto_161669 ?auto_161670 ) ) ( not ( = ?auto_161669 ?auto_161671 ) ) ( not ( = ?auto_161670 ?auto_161671 ) ) ( ON ?auto_161669 ?auto_161670 ) ( CLEAR ?auto_161667 ) ( ON ?auto_161668 ?auto_161669 ) ( CLEAR ?auto_161668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161664 ?auto_161665 ?auto_161666 ?auto_161667 ?auto_161668 )
      ( MAKE-7PILE ?auto_161664 ?auto_161665 ?auto_161666 ?auto_161667 ?auto_161668 ?auto_161669 ?auto_161670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161679 - BLOCK
      ?auto_161680 - BLOCK
      ?auto_161681 - BLOCK
      ?auto_161682 - BLOCK
      ?auto_161683 - BLOCK
      ?auto_161684 - BLOCK
      ?auto_161685 - BLOCK
    )
    :vars
    (
      ?auto_161686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161685 ?auto_161686 ) ( ON-TABLE ?auto_161679 ) ( ON ?auto_161680 ?auto_161679 ) ( ON ?auto_161681 ?auto_161680 ) ( not ( = ?auto_161679 ?auto_161680 ) ) ( not ( = ?auto_161679 ?auto_161681 ) ) ( not ( = ?auto_161679 ?auto_161682 ) ) ( not ( = ?auto_161679 ?auto_161683 ) ) ( not ( = ?auto_161679 ?auto_161684 ) ) ( not ( = ?auto_161679 ?auto_161685 ) ) ( not ( = ?auto_161679 ?auto_161686 ) ) ( not ( = ?auto_161680 ?auto_161681 ) ) ( not ( = ?auto_161680 ?auto_161682 ) ) ( not ( = ?auto_161680 ?auto_161683 ) ) ( not ( = ?auto_161680 ?auto_161684 ) ) ( not ( = ?auto_161680 ?auto_161685 ) ) ( not ( = ?auto_161680 ?auto_161686 ) ) ( not ( = ?auto_161681 ?auto_161682 ) ) ( not ( = ?auto_161681 ?auto_161683 ) ) ( not ( = ?auto_161681 ?auto_161684 ) ) ( not ( = ?auto_161681 ?auto_161685 ) ) ( not ( = ?auto_161681 ?auto_161686 ) ) ( not ( = ?auto_161682 ?auto_161683 ) ) ( not ( = ?auto_161682 ?auto_161684 ) ) ( not ( = ?auto_161682 ?auto_161685 ) ) ( not ( = ?auto_161682 ?auto_161686 ) ) ( not ( = ?auto_161683 ?auto_161684 ) ) ( not ( = ?auto_161683 ?auto_161685 ) ) ( not ( = ?auto_161683 ?auto_161686 ) ) ( not ( = ?auto_161684 ?auto_161685 ) ) ( not ( = ?auto_161684 ?auto_161686 ) ) ( not ( = ?auto_161685 ?auto_161686 ) ) ( ON ?auto_161684 ?auto_161685 ) ( ON ?auto_161683 ?auto_161684 ) ( CLEAR ?auto_161681 ) ( ON ?auto_161682 ?auto_161683 ) ( CLEAR ?auto_161682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161679 ?auto_161680 ?auto_161681 ?auto_161682 )
      ( MAKE-7PILE ?auto_161679 ?auto_161680 ?auto_161681 ?auto_161682 ?auto_161683 ?auto_161684 ?auto_161685 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161694 - BLOCK
      ?auto_161695 - BLOCK
      ?auto_161696 - BLOCK
      ?auto_161697 - BLOCK
      ?auto_161698 - BLOCK
      ?auto_161699 - BLOCK
      ?auto_161700 - BLOCK
    )
    :vars
    (
      ?auto_161701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161700 ?auto_161701 ) ( ON-TABLE ?auto_161694 ) ( ON ?auto_161695 ?auto_161694 ) ( ON ?auto_161696 ?auto_161695 ) ( not ( = ?auto_161694 ?auto_161695 ) ) ( not ( = ?auto_161694 ?auto_161696 ) ) ( not ( = ?auto_161694 ?auto_161697 ) ) ( not ( = ?auto_161694 ?auto_161698 ) ) ( not ( = ?auto_161694 ?auto_161699 ) ) ( not ( = ?auto_161694 ?auto_161700 ) ) ( not ( = ?auto_161694 ?auto_161701 ) ) ( not ( = ?auto_161695 ?auto_161696 ) ) ( not ( = ?auto_161695 ?auto_161697 ) ) ( not ( = ?auto_161695 ?auto_161698 ) ) ( not ( = ?auto_161695 ?auto_161699 ) ) ( not ( = ?auto_161695 ?auto_161700 ) ) ( not ( = ?auto_161695 ?auto_161701 ) ) ( not ( = ?auto_161696 ?auto_161697 ) ) ( not ( = ?auto_161696 ?auto_161698 ) ) ( not ( = ?auto_161696 ?auto_161699 ) ) ( not ( = ?auto_161696 ?auto_161700 ) ) ( not ( = ?auto_161696 ?auto_161701 ) ) ( not ( = ?auto_161697 ?auto_161698 ) ) ( not ( = ?auto_161697 ?auto_161699 ) ) ( not ( = ?auto_161697 ?auto_161700 ) ) ( not ( = ?auto_161697 ?auto_161701 ) ) ( not ( = ?auto_161698 ?auto_161699 ) ) ( not ( = ?auto_161698 ?auto_161700 ) ) ( not ( = ?auto_161698 ?auto_161701 ) ) ( not ( = ?auto_161699 ?auto_161700 ) ) ( not ( = ?auto_161699 ?auto_161701 ) ) ( not ( = ?auto_161700 ?auto_161701 ) ) ( ON ?auto_161699 ?auto_161700 ) ( ON ?auto_161698 ?auto_161699 ) ( CLEAR ?auto_161696 ) ( ON ?auto_161697 ?auto_161698 ) ( CLEAR ?auto_161697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161694 ?auto_161695 ?auto_161696 ?auto_161697 )
      ( MAKE-7PILE ?auto_161694 ?auto_161695 ?auto_161696 ?auto_161697 ?auto_161698 ?auto_161699 ?auto_161700 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161709 - BLOCK
      ?auto_161710 - BLOCK
      ?auto_161711 - BLOCK
      ?auto_161712 - BLOCK
      ?auto_161713 - BLOCK
      ?auto_161714 - BLOCK
      ?auto_161715 - BLOCK
    )
    :vars
    (
      ?auto_161716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161715 ?auto_161716 ) ( ON-TABLE ?auto_161709 ) ( ON ?auto_161710 ?auto_161709 ) ( not ( = ?auto_161709 ?auto_161710 ) ) ( not ( = ?auto_161709 ?auto_161711 ) ) ( not ( = ?auto_161709 ?auto_161712 ) ) ( not ( = ?auto_161709 ?auto_161713 ) ) ( not ( = ?auto_161709 ?auto_161714 ) ) ( not ( = ?auto_161709 ?auto_161715 ) ) ( not ( = ?auto_161709 ?auto_161716 ) ) ( not ( = ?auto_161710 ?auto_161711 ) ) ( not ( = ?auto_161710 ?auto_161712 ) ) ( not ( = ?auto_161710 ?auto_161713 ) ) ( not ( = ?auto_161710 ?auto_161714 ) ) ( not ( = ?auto_161710 ?auto_161715 ) ) ( not ( = ?auto_161710 ?auto_161716 ) ) ( not ( = ?auto_161711 ?auto_161712 ) ) ( not ( = ?auto_161711 ?auto_161713 ) ) ( not ( = ?auto_161711 ?auto_161714 ) ) ( not ( = ?auto_161711 ?auto_161715 ) ) ( not ( = ?auto_161711 ?auto_161716 ) ) ( not ( = ?auto_161712 ?auto_161713 ) ) ( not ( = ?auto_161712 ?auto_161714 ) ) ( not ( = ?auto_161712 ?auto_161715 ) ) ( not ( = ?auto_161712 ?auto_161716 ) ) ( not ( = ?auto_161713 ?auto_161714 ) ) ( not ( = ?auto_161713 ?auto_161715 ) ) ( not ( = ?auto_161713 ?auto_161716 ) ) ( not ( = ?auto_161714 ?auto_161715 ) ) ( not ( = ?auto_161714 ?auto_161716 ) ) ( not ( = ?auto_161715 ?auto_161716 ) ) ( ON ?auto_161714 ?auto_161715 ) ( ON ?auto_161713 ?auto_161714 ) ( ON ?auto_161712 ?auto_161713 ) ( CLEAR ?auto_161710 ) ( ON ?auto_161711 ?auto_161712 ) ( CLEAR ?auto_161711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161709 ?auto_161710 ?auto_161711 )
      ( MAKE-7PILE ?auto_161709 ?auto_161710 ?auto_161711 ?auto_161712 ?auto_161713 ?auto_161714 ?auto_161715 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161724 - BLOCK
      ?auto_161725 - BLOCK
      ?auto_161726 - BLOCK
      ?auto_161727 - BLOCK
      ?auto_161728 - BLOCK
      ?auto_161729 - BLOCK
      ?auto_161730 - BLOCK
    )
    :vars
    (
      ?auto_161731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161730 ?auto_161731 ) ( ON-TABLE ?auto_161724 ) ( ON ?auto_161725 ?auto_161724 ) ( not ( = ?auto_161724 ?auto_161725 ) ) ( not ( = ?auto_161724 ?auto_161726 ) ) ( not ( = ?auto_161724 ?auto_161727 ) ) ( not ( = ?auto_161724 ?auto_161728 ) ) ( not ( = ?auto_161724 ?auto_161729 ) ) ( not ( = ?auto_161724 ?auto_161730 ) ) ( not ( = ?auto_161724 ?auto_161731 ) ) ( not ( = ?auto_161725 ?auto_161726 ) ) ( not ( = ?auto_161725 ?auto_161727 ) ) ( not ( = ?auto_161725 ?auto_161728 ) ) ( not ( = ?auto_161725 ?auto_161729 ) ) ( not ( = ?auto_161725 ?auto_161730 ) ) ( not ( = ?auto_161725 ?auto_161731 ) ) ( not ( = ?auto_161726 ?auto_161727 ) ) ( not ( = ?auto_161726 ?auto_161728 ) ) ( not ( = ?auto_161726 ?auto_161729 ) ) ( not ( = ?auto_161726 ?auto_161730 ) ) ( not ( = ?auto_161726 ?auto_161731 ) ) ( not ( = ?auto_161727 ?auto_161728 ) ) ( not ( = ?auto_161727 ?auto_161729 ) ) ( not ( = ?auto_161727 ?auto_161730 ) ) ( not ( = ?auto_161727 ?auto_161731 ) ) ( not ( = ?auto_161728 ?auto_161729 ) ) ( not ( = ?auto_161728 ?auto_161730 ) ) ( not ( = ?auto_161728 ?auto_161731 ) ) ( not ( = ?auto_161729 ?auto_161730 ) ) ( not ( = ?auto_161729 ?auto_161731 ) ) ( not ( = ?auto_161730 ?auto_161731 ) ) ( ON ?auto_161729 ?auto_161730 ) ( ON ?auto_161728 ?auto_161729 ) ( ON ?auto_161727 ?auto_161728 ) ( CLEAR ?auto_161725 ) ( ON ?auto_161726 ?auto_161727 ) ( CLEAR ?auto_161726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161724 ?auto_161725 ?auto_161726 )
      ( MAKE-7PILE ?auto_161724 ?auto_161725 ?auto_161726 ?auto_161727 ?auto_161728 ?auto_161729 ?auto_161730 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161739 - BLOCK
      ?auto_161740 - BLOCK
      ?auto_161741 - BLOCK
      ?auto_161742 - BLOCK
      ?auto_161743 - BLOCK
      ?auto_161744 - BLOCK
      ?auto_161745 - BLOCK
    )
    :vars
    (
      ?auto_161746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161745 ?auto_161746 ) ( ON-TABLE ?auto_161739 ) ( not ( = ?auto_161739 ?auto_161740 ) ) ( not ( = ?auto_161739 ?auto_161741 ) ) ( not ( = ?auto_161739 ?auto_161742 ) ) ( not ( = ?auto_161739 ?auto_161743 ) ) ( not ( = ?auto_161739 ?auto_161744 ) ) ( not ( = ?auto_161739 ?auto_161745 ) ) ( not ( = ?auto_161739 ?auto_161746 ) ) ( not ( = ?auto_161740 ?auto_161741 ) ) ( not ( = ?auto_161740 ?auto_161742 ) ) ( not ( = ?auto_161740 ?auto_161743 ) ) ( not ( = ?auto_161740 ?auto_161744 ) ) ( not ( = ?auto_161740 ?auto_161745 ) ) ( not ( = ?auto_161740 ?auto_161746 ) ) ( not ( = ?auto_161741 ?auto_161742 ) ) ( not ( = ?auto_161741 ?auto_161743 ) ) ( not ( = ?auto_161741 ?auto_161744 ) ) ( not ( = ?auto_161741 ?auto_161745 ) ) ( not ( = ?auto_161741 ?auto_161746 ) ) ( not ( = ?auto_161742 ?auto_161743 ) ) ( not ( = ?auto_161742 ?auto_161744 ) ) ( not ( = ?auto_161742 ?auto_161745 ) ) ( not ( = ?auto_161742 ?auto_161746 ) ) ( not ( = ?auto_161743 ?auto_161744 ) ) ( not ( = ?auto_161743 ?auto_161745 ) ) ( not ( = ?auto_161743 ?auto_161746 ) ) ( not ( = ?auto_161744 ?auto_161745 ) ) ( not ( = ?auto_161744 ?auto_161746 ) ) ( not ( = ?auto_161745 ?auto_161746 ) ) ( ON ?auto_161744 ?auto_161745 ) ( ON ?auto_161743 ?auto_161744 ) ( ON ?auto_161742 ?auto_161743 ) ( ON ?auto_161741 ?auto_161742 ) ( CLEAR ?auto_161739 ) ( ON ?auto_161740 ?auto_161741 ) ( CLEAR ?auto_161740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161739 ?auto_161740 )
      ( MAKE-7PILE ?auto_161739 ?auto_161740 ?auto_161741 ?auto_161742 ?auto_161743 ?auto_161744 ?auto_161745 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161754 - BLOCK
      ?auto_161755 - BLOCK
      ?auto_161756 - BLOCK
      ?auto_161757 - BLOCK
      ?auto_161758 - BLOCK
      ?auto_161759 - BLOCK
      ?auto_161760 - BLOCK
    )
    :vars
    (
      ?auto_161761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161760 ?auto_161761 ) ( ON-TABLE ?auto_161754 ) ( not ( = ?auto_161754 ?auto_161755 ) ) ( not ( = ?auto_161754 ?auto_161756 ) ) ( not ( = ?auto_161754 ?auto_161757 ) ) ( not ( = ?auto_161754 ?auto_161758 ) ) ( not ( = ?auto_161754 ?auto_161759 ) ) ( not ( = ?auto_161754 ?auto_161760 ) ) ( not ( = ?auto_161754 ?auto_161761 ) ) ( not ( = ?auto_161755 ?auto_161756 ) ) ( not ( = ?auto_161755 ?auto_161757 ) ) ( not ( = ?auto_161755 ?auto_161758 ) ) ( not ( = ?auto_161755 ?auto_161759 ) ) ( not ( = ?auto_161755 ?auto_161760 ) ) ( not ( = ?auto_161755 ?auto_161761 ) ) ( not ( = ?auto_161756 ?auto_161757 ) ) ( not ( = ?auto_161756 ?auto_161758 ) ) ( not ( = ?auto_161756 ?auto_161759 ) ) ( not ( = ?auto_161756 ?auto_161760 ) ) ( not ( = ?auto_161756 ?auto_161761 ) ) ( not ( = ?auto_161757 ?auto_161758 ) ) ( not ( = ?auto_161757 ?auto_161759 ) ) ( not ( = ?auto_161757 ?auto_161760 ) ) ( not ( = ?auto_161757 ?auto_161761 ) ) ( not ( = ?auto_161758 ?auto_161759 ) ) ( not ( = ?auto_161758 ?auto_161760 ) ) ( not ( = ?auto_161758 ?auto_161761 ) ) ( not ( = ?auto_161759 ?auto_161760 ) ) ( not ( = ?auto_161759 ?auto_161761 ) ) ( not ( = ?auto_161760 ?auto_161761 ) ) ( ON ?auto_161759 ?auto_161760 ) ( ON ?auto_161758 ?auto_161759 ) ( ON ?auto_161757 ?auto_161758 ) ( ON ?auto_161756 ?auto_161757 ) ( CLEAR ?auto_161754 ) ( ON ?auto_161755 ?auto_161756 ) ( CLEAR ?auto_161755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_161754 ?auto_161755 )
      ( MAKE-7PILE ?auto_161754 ?auto_161755 ?auto_161756 ?auto_161757 ?auto_161758 ?auto_161759 ?auto_161760 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161769 - BLOCK
      ?auto_161770 - BLOCK
      ?auto_161771 - BLOCK
      ?auto_161772 - BLOCK
      ?auto_161773 - BLOCK
      ?auto_161774 - BLOCK
      ?auto_161775 - BLOCK
    )
    :vars
    (
      ?auto_161776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161775 ?auto_161776 ) ( not ( = ?auto_161769 ?auto_161770 ) ) ( not ( = ?auto_161769 ?auto_161771 ) ) ( not ( = ?auto_161769 ?auto_161772 ) ) ( not ( = ?auto_161769 ?auto_161773 ) ) ( not ( = ?auto_161769 ?auto_161774 ) ) ( not ( = ?auto_161769 ?auto_161775 ) ) ( not ( = ?auto_161769 ?auto_161776 ) ) ( not ( = ?auto_161770 ?auto_161771 ) ) ( not ( = ?auto_161770 ?auto_161772 ) ) ( not ( = ?auto_161770 ?auto_161773 ) ) ( not ( = ?auto_161770 ?auto_161774 ) ) ( not ( = ?auto_161770 ?auto_161775 ) ) ( not ( = ?auto_161770 ?auto_161776 ) ) ( not ( = ?auto_161771 ?auto_161772 ) ) ( not ( = ?auto_161771 ?auto_161773 ) ) ( not ( = ?auto_161771 ?auto_161774 ) ) ( not ( = ?auto_161771 ?auto_161775 ) ) ( not ( = ?auto_161771 ?auto_161776 ) ) ( not ( = ?auto_161772 ?auto_161773 ) ) ( not ( = ?auto_161772 ?auto_161774 ) ) ( not ( = ?auto_161772 ?auto_161775 ) ) ( not ( = ?auto_161772 ?auto_161776 ) ) ( not ( = ?auto_161773 ?auto_161774 ) ) ( not ( = ?auto_161773 ?auto_161775 ) ) ( not ( = ?auto_161773 ?auto_161776 ) ) ( not ( = ?auto_161774 ?auto_161775 ) ) ( not ( = ?auto_161774 ?auto_161776 ) ) ( not ( = ?auto_161775 ?auto_161776 ) ) ( ON ?auto_161774 ?auto_161775 ) ( ON ?auto_161773 ?auto_161774 ) ( ON ?auto_161772 ?auto_161773 ) ( ON ?auto_161771 ?auto_161772 ) ( ON ?auto_161770 ?auto_161771 ) ( ON ?auto_161769 ?auto_161770 ) ( CLEAR ?auto_161769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161769 )
      ( MAKE-7PILE ?auto_161769 ?auto_161770 ?auto_161771 ?auto_161772 ?auto_161773 ?auto_161774 ?auto_161775 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_161784 - BLOCK
      ?auto_161785 - BLOCK
      ?auto_161786 - BLOCK
      ?auto_161787 - BLOCK
      ?auto_161788 - BLOCK
      ?auto_161789 - BLOCK
      ?auto_161790 - BLOCK
    )
    :vars
    (
      ?auto_161791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161790 ?auto_161791 ) ( not ( = ?auto_161784 ?auto_161785 ) ) ( not ( = ?auto_161784 ?auto_161786 ) ) ( not ( = ?auto_161784 ?auto_161787 ) ) ( not ( = ?auto_161784 ?auto_161788 ) ) ( not ( = ?auto_161784 ?auto_161789 ) ) ( not ( = ?auto_161784 ?auto_161790 ) ) ( not ( = ?auto_161784 ?auto_161791 ) ) ( not ( = ?auto_161785 ?auto_161786 ) ) ( not ( = ?auto_161785 ?auto_161787 ) ) ( not ( = ?auto_161785 ?auto_161788 ) ) ( not ( = ?auto_161785 ?auto_161789 ) ) ( not ( = ?auto_161785 ?auto_161790 ) ) ( not ( = ?auto_161785 ?auto_161791 ) ) ( not ( = ?auto_161786 ?auto_161787 ) ) ( not ( = ?auto_161786 ?auto_161788 ) ) ( not ( = ?auto_161786 ?auto_161789 ) ) ( not ( = ?auto_161786 ?auto_161790 ) ) ( not ( = ?auto_161786 ?auto_161791 ) ) ( not ( = ?auto_161787 ?auto_161788 ) ) ( not ( = ?auto_161787 ?auto_161789 ) ) ( not ( = ?auto_161787 ?auto_161790 ) ) ( not ( = ?auto_161787 ?auto_161791 ) ) ( not ( = ?auto_161788 ?auto_161789 ) ) ( not ( = ?auto_161788 ?auto_161790 ) ) ( not ( = ?auto_161788 ?auto_161791 ) ) ( not ( = ?auto_161789 ?auto_161790 ) ) ( not ( = ?auto_161789 ?auto_161791 ) ) ( not ( = ?auto_161790 ?auto_161791 ) ) ( ON ?auto_161789 ?auto_161790 ) ( ON ?auto_161788 ?auto_161789 ) ( ON ?auto_161787 ?auto_161788 ) ( ON ?auto_161786 ?auto_161787 ) ( ON ?auto_161785 ?auto_161786 ) ( ON ?auto_161784 ?auto_161785 ) ( CLEAR ?auto_161784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_161784 )
      ( MAKE-7PILE ?auto_161784 ?auto_161785 ?auto_161786 ?auto_161787 ?auto_161788 ?auto_161789 ?auto_161790 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161800 - BLOCK
      ?auto_161801 - BLOCK
      ?auto_161802 - BLOCK
      ?auto_161803 - BLOCK
      ?auto_161804 - BLOCK
      ?auto_161805 - BLOCK
      ?auto_161806 - BLOCK
      ?auto_161807 - BLOCK
    )
    :vars
    (
      ?auto_161808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161806 ) ( ON ?auto_161807 ?auto_161808 ) ( CLEAR ?auto_161807 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161800 ) ( ON ?auto_161801 ?auto_161800 ) ( ON ?auto_161802 ?auto_161801 ) ( ON ?auto_161803 ?auto_161802 ) ( ON ?auto_161804 ?auto_161803 ) ( ON ?auto_161805 ?auto_161804 ) ( ON ?auto_161806 ?auto_161805 ) ( not ( = ?auto_161800 ?auto_161801 ) ) ( not ( = ?auto_161800 ?auto_161802 ) ) ( not ( = ?auto_161800 ?auto_161803 ) ) ( not ( = ?auto_161800 ?auto_161804 ) ) ( not ( = ?auto_161800 ?auto_161805 ) ) ( not ( = ?auto_161800 ?auto_161806 ) ) ( not ( = ?auto_161800 ?auto_161807 ) ) ( not ( = ?auto_161800 ?auto_161808 ) ) ( not ( = ?auto_161801 ?auto_161802 ) ) ( not ( = ?auto_161801 ?auto_161803 ) ) ( not ( = ?auto_161801 ?auto_161804 ) ) ( not ( = ?auto_161801 ?auto_161805 ) ) ( not ( = ?auto_161801 ?auto_161806 ) ) ( not ( = ?auto_161801 ?auto_161807 ) ) ( not ( = ?auto_161801 ?auto_161808 ) ) ( not ( = ?auto_161802 ?auto_161803 ) ) ( not ( = ?auto_161802 ?auto_161804 ) ) ( not ( = ?auto_161802 ?auto_161805 ) ) ( not ( = ?auto_161802 ?auto_161806 ) ) ( not ( = ?auto_161802 ?auto_161807 ) ) ( not ( = ?auto_161802 ?auto_161808 ) ) ( not ( = ?auto_161803 ?auto_161804 ) ) ( not ( = ?auto_161803 ?auto_161805 ) ) ( not ( = ?auto_161803 ?auto_161806 ) ) ( not ( = ?auto_161803 ?auto_161807 ) ) ( not ( = ?auto_161803 ?auto_161808 ) ) ( not ( = ?auto_161804 ?auto_161805 ) ) ( not ( = ?auto_161804 ?auto_161806 ) ) ( not ( = ?auto_161804 ?auto_161807 ) ) ( not ( = ?auto_161804 ?auto_161808 ) ) ( not ( = ?auto_161805 ?auto_161806 ) ) ( not ( = ?auto_161805 ?auto_161807 ) ) ( not ( = ?auto_161805 ?auto_161808 ) ) ( not ( = ?auto_161806 ?auto_161807 ) ) ( not ( = ?auto_161806 ?auto_161808 ) ) ( not ( = ?auto_161807 ?auto_161808 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161807 ?auto_161808 )
      ( !STACK ?auto_161807 ?auto_161806 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161817 - BLOCK
      ?auto_161818 - BLOCK
      ?auto_161819 - BLOCK
      ?auto_161820 - BLOCK
      ?auto_161821 - BLOCK
      ?auto_161822 - BLOCK
      ?auto_161823 - BLOCK
      ?auto_161824 - BLOCK
    )
    :vars
    (
      ?auto_161825 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_161823 ) ( ON ?auto_161824 ?auto_161825 ) ( CLEAR ?auto_161824 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_161817 ) ( ON ?auto_161818 ?auto_161817 ) ( ON ?auto_161819 ?auto_161818 ) ( ON ?auto_161820 ?auto_161819 ) ( ON ?auto_161821 ?auto_161820 ) ( ON ?auto_161822 ?auto_161821 ) ( ON ?auto_161823 ?auto_161822 ) ( not ( = ?auto_161817 ?auto_161818 ) ) ( not ( = ?auto_161817 ?auto_161819 ) ) ( not ( = ?auto_161817 ?auto_161820 ) ) ( not ( = ?auto_161817 ?auto_161821 ) ) ( not ( = ?auto_161817 ?auto_161822 ) ) ( not ( = ?auto_161817 ?auto_161823 ) ) ( not ( = ?auto_161817 ?auto_161824 ) ) ( not ( = ?auto_161817 ?auto_161825 ) ) ( not ( = ?auto_161818 ?auto_161819 ) ) ( not ( = ?auto_161818 ?auto_161820 ) ) ( not ( = ?auto_161818 ?auto_161821 ) ) ( not ( = ?auto_161818 ?auto_161822 ) ) ( not ( = ?auto_161818 ?auto_161823 ) ) ( not ( = ?auto_161818 ?auto_161824 ) ) ( not ( = ?auto_161818 ?auto_161825 ) ) ( not ( = ?auto_161819 ?auto_161820 ) ) ( not ( = ?auto_161819 ?auto_161821 ) ) ( not ( = ?auto_161819 ?auto_161822 ) ) ( not ( = ?auto_161819 ?auto_161823 ) ) ( not ( = ?auto_161819 ?auto_161824 ) ) ( not ( = ?auto_161819 ?auto_161825 ) ) ( not ( = ?auto_161820 ?auto_161821 ) ) ( not ( = ?auto_161820 ?auto_161822 ) ) ( not ( = ?auto_161820 ?auto_161823 ) ) ( not ( = ?auto_161820 ?auto_161824 ) ) ( not ( = ?auto_161820 ?auto_161825 ) ) ( not ( = ?auto_161821 ?auto_161822 ) ) ( not ( = ?auto_161821 ?auto_161823 ) ) ( not ( = ?auto_161821 ?auto_161824 ) ) ( not ( = ?auto_161821 ?auto_161825 ) ) ( not ( = ?auto_161822 ?auto_161823 ) ) ( not ( = ?auto_161822 ?auto_161824 ) ) ( not ( = ?auto_161822 ?auto_161825 ) ) ( not ( = ?auto_161823 ?auto_161824 ) ) ( not ( = ?auto_161823 ?auto_161825 ) ) ( not ( = ?auto_161824 ?auto_161825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_161824 ?auto_161825 )
      ( !STACK ?auto_161824 ?auto_161823 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161834 - BLOCK
      ?auto_161835 - BLOCK
      ?auto_161836 - BLOCK
      ?auto_161837 - BLOCK
      ?auto_161838 - BLOCK
      ?auto_161839 - BLOCK
      ?auto_161840 - BLOCK
      ?auto_161841 - BLOCK
    )
    :vars
    (
      ?auto_161842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161841 ?auto_161842 ) ( ON-TABLE ?auto_161834 ) ( ON ?auto_161835 ?auto_161834 ) ( ON ?auto_161836 ?auto_161835 ) ( ON ?auto_161837 ?auto_161836 ) ( ON ?auto_161838 ?auto_161837 ) ( ON ?auto_161839 ?auto_161838 ) ( not ( = ?auto_161834 ?auto_161835 ) ) ( not ( = ?auto_161834 ?auto_161836 ) ) ( not ( = ?auto_161834 ?auto_161837 ) ) ( not ( = ?auto_161834 ?auto_161838 ) ) ( not ( = ?auto_161834 ?auto_161839 ) ) ( not ( = ?auto_161834 ?auto_161840 ) ) ( not ( = ?auto_161834 ?auto_161841 ) ) ( not ( = ?auto_161834 ?auto_161842 ) ) ( not ( = ?auto_161835 ?auto_161836 ) ) ( not ( = ?auto_161835 ?auto_161837 ) ) ( not ( = ?auto_161835 ?auto_161838 ) ) ( not ( = ?auto_161835 ?auto_161839 ) ) ( not ( = ?auto_161835 ?auto_161840 ) ) ( not ( = ?auto_161835 ?auto_161841 ) ) ( not ( = ?auto_161835 ?auto_161842 ) ) ( not ( = ?auto_161836 ?auto_161837 ) ) ( not ( = ?auto_161836 ?auto_161838 ) ) ( not ( = ?auto_161836 ?auto_161839 ) ) ( not ( = ?auto_161836 ?auto_161840 ) ) ( not ( = ?auto_161836 ?auto_161841 ) ) ( not ( = ?auto_161836 ?auto_161842 ) ) ( not ( = ?auto_161837 ?auto_161838 ) ) ( not ( = ?auto_161837 ?auto_161839 ) ) ( not ( = ?auto_161837 ?auto_161840 ) ) ( not ( = ?auto_161837 ?auto_161841 ) ) ( not ( = ?auto_161837 ?auto_161842 ) ) ( not ( = ?auto_161838 ?auto_161839 ) ) ( not ( = ?auto_161838 ?auto_161840 ) ) ( not ( = ?auto_161838 ?auto_161841 ) ) ( not ( = ?auto_161838 ?auto_161842 ) ) ( not ( = ?auto_161839 ?auto_161840 ) ) ( not ( = ?auto_161839 ?auto_161841 ) ) ( not ( = ?auto_161839 ?auto_161842 ) ) ( not ( = ?auto_161840 ?auto_161841 ) ) ( not ( = ?auto_161840 ?auto_161842 ) ) ( not ( = ?auto_161841 ?auto_161842 ) ) ( CLEAR ?auto_161839 ) ( ON ?auto_161840 ?auto_161841 ) ( CLEAR ?auto_161840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161834 ?auto_161835 ?auto_161836 ?auto_161837 ?auto_161838 ?auto_161839 ?auto_161840 )
      ( MAKE-8PILE ?auto_161834 ?auto_161835 ?auto_161836 ?auto_161837 ?auto_161838 ?auto_161839 ?auto_161840 ?auto_161841 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161851 - BLOCK
      ?auto_161852 - BLOCK
      ?auto_161853 - BLOCK
      ?auto_161854 - BLOCK
      ?auto_161855 - BLOCK
      ?auto_161856 - BLOCK
      ?auto_161857 - BLOCK
      ?auto_161858 - BLOCK
    )
    :vars
    (
      ?auto_161859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161858 ?auto_161859 ) ( ON-TABLE ?auto_161851 ) ( ON ?auto_161852 ?auto_161851 ) ( ON ?auto_161853 ?auto_161852 ) ( ON ?auto_161854 ?auto_161853 ) ( ON ?auto_161855 ?auto_161854 ) ( ON ?auto_161856 ?auto_161855 ) ( not ( = ?auto_161851 ?auto_161852 ) ) ( not ( = ?auto_161851 ?auto_161853 ) ) ( not ( = ?auto_161851 ?auto_161854 ) ) ( not ( = ?auto_161851 ?auto_161855 ) ) ( not ( = ?auto_161851 ?auto_161856 ) ) ( not ( = ?auto_161851 ?auto_161857 ) ) ( not ( = ?auto_161851 ?auto_161858 ) ) ( not ( = ?auto_161851 ?auto_161859 ) ) ( not ( = ?auto_161852 ?auto_161853 ) ) ( not ( = ?auto_161852 ?auto_161854 ) ) ( not ( = ?auto_161852 ?auto_161855 ) ) ( not ( = ?auto_161852 ?auto_161856 ) ) ( not ( = ?auto_161852 ?auto_161857 ) ) ( not ( = ?auto_161852 ?auto_161858 ) ) ( not ( = ?auto_161852 ?auto_161859 ) ) ( not ( = ?auto_161853 ?auto_161854 ) ) ( not ( = ?auto_161853 ?auto_161855 ) ) ( not ( = ?auto_161853 ?auto_161856 ) ) ( not ( = ?auto_161853 ?auto_161857 ) ) ( not ( = ?auto_161853 ?auto_161858 ) ) ( not ( = ?auto_161853 ?auto_161859 ) ) ( not ( = ?auto_161854 ?auto_161855 ) ) ( not ( = ?auto_161854 ?auto_161856 ) ) ( not ( = ?auto_161854 ?auto_161857 ) ) ( not ( = ?auto_161854 ?auto_161858 ) ) ( not ( = ?auto_161854 ?auto_161859 ) ) ( not ( = ?auto_161855 ?auto_161856 ) ) ( not ( = ?auto_161855 ?auto_161857 ) ) ( not ( = ?auto_161855 ?auto_161858 ) ) ( not ( = ?auto_161855 ?auto_161859 ) ) ( not ( = ?auto_161856 ?auto_161857 ) ) ( not ( = ?auto_161856 ?auto_161858 ) ) ( not ( = ?auto_161856 ?auto_161859 ) ) ( not ( = ?auto_161857 ?auto_161858 ) ) ( not ( = ?auto_161857 ?auto_161859 ) ) ( not ( = ?auto_161858 ?auto_161859 ) ) ( CLEAR ?auto_161856 ) ( ON ?auto_161857 ?auto_161858 ) ( CLEAR ?auto_161857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_161851 ?auto_161852 ?auto_161853 ?auto_161854 ?auto_161855 ?auto_161856 ?auto_161857 )
      ( MAKE-8PILE ?auto_161851 ?auto_161852 ?auto_161853 ?auto_161854 ?auto_161855 ?auto_161856 ?auto_161857 ?auto_161858 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161868 - BLOCK
      ?auto_161869 - BLOCK
      ?auto_161870 - BLOCK
      ?auto_161871 - BLOCK
      ?auto_161872 - BLOCK
      ?auto_161873 - BLOCK
      ?auto_161874 - BLOCK
      ?auto_161875 - BLOCK
    )
    :vars
    (
      ?auto_161876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161875 ?auto_161876 ) ( ON-TABLE ?auto_161868 ) ( ON ?auto_161869 ?auto_161868 ) ( ON ?auto_161870 ?auto_161869 ) ( ON ?auto_161871 ?auto_161870 ) ( ON ?auto_161872 ?auto_161871 ) ( not ( = ?auto_161868 ?auto_161869 ) ) ( not ( = ?auto_161868 ?auto_161870 ) ) ( not ( = ?auto_161868 ?auto_161871 ) ) ( not ( = ?auto_161868 ?auto_161872 ) ) ( not ( = ?auto_161868 ?auto_161873 ) ) ( not ( = ?auto_161868 ?auto_161874 ) ) ( not ( = ?auto_161868 ?auto_161875 ) ) ( not ( = ?auto_161868 ?auto_161876 ) ) ( not ( = ?auto_161869 ?auto_161870 ) ) ( not ( = ?auto_161869 ?auto_161871 ) ) ( not ( = ?auto_161869 ?auto_161872 ) ) ( not ( = ?auto_161869 ?auto_161873 ) ) ( not ( = ?auto_161869 ?auto_161874 ) ) ( not ( = ?auto_161869 ?auto_161875 ) ) ( not ( = ?auto_161869 ?auto_161876 ) ) ( not ( = ?auto_161870 ?auto_161871 ) ) ( not ( = ?auto_161870 ?auto_161872 ) ) ( not ( = ?auto_161870 ?auto_161873 ) ) ( not ( = ?auto_161870 ?auto_161874 ) ) ( not ( = ?auto_161870 ?auto_161875 ) ) ( not ( = ?auto_161870 ?auto_161876 ) ) ( not ( = ?auto_161871 ?auto_161872 ) ) ( not ( = ?auto_161871 ?auto_161873 ) ) ( not ( = ?auto_161871 ?auto_161874 ) ) ( not ( = ?auto_161871 ?auto_161875 ) ) ( not ( = ?auto_161871 ?auto_161876 ) ) ( not ( = ?auto_161872 ?auto_161873 ) ) ( not ( = ?auto_161872 ?auto_161874 ) ) ( not ( = ?auto_161872 ?auto_161875 ) ) ( not ( = ?auto_161872 ?auto_161876 ) ) ( not ( = ?auto_161873 ?auto_161874 ) ) ( not ( = ?auto_161873 ?auto_161875 ) ) ( not ( = ?auto_161873 ?auto_161876 ) ) ( not ( = ?auto_161874 ?auto_161875 ) ) ( not ( = ?auto_161874 ?auto_161876 ) ) ( not ( = ?auto_161875 ?auto_161876 ) ) ( ON ?auto_161874 ?auto_161875 ) ( CLEAR ?auto_161872 ) ( ON ?auto_161873 ?auto_161874 ) ( CLEAR ?auto_161873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161868 ?auto_161869 ?auto_161870 ?auto_161871 ?auto_161872 ?auto_161873 )
      ( MAKE-8PILE ?auto_161868 ?auto_161869 ?auto_161870 ?auto_161871 ?auto_161872 ?auto_161873 ?auto_161874 ?auto_161875 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161885 - BLOCK
      ?auto_161886 - BLOCK
      ?auto_161887 - BLOCK
      ?auto_161888 - BLOCK
      ?auto_161889 - BLOCK
      ?auto_161890 - BLOCK
      ?auto_161891 - BLOCK
      ?auto_161892 - BLOCK
    )
    :vars
    (
      ?auto_161893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161892 ?auto_161893 ) ( ON-TABLE ?auto_161885 ) ( ON ?auto_161886 ?auto_161885 ) ( ON ?auto_161887 ?auto_161886 ) ( ON ?auto_161888 ?auto_161887 ) ( ON ?auto_161889 ?auto_161888 ) ( not ( = ?auto_161885 ?auto_161886 ) ) ( not ( = ?auto_161885 ?auto_161887 ) ) ( not ( = ?auto_161885 ?auto_161888 ) ) ( not ( = ?auto_161885 ?auto_161889 ) ) ( not ( = ?auto_161885 ?auto_161890 ) ) ( not ( = ?auto_161885 ?auto_161891 ) ) ( not ( = ?auto_161885 ?auto_161892 ) ) ( not ( = ?auto_161885 ?auto_161893 ) ) ( not ( = ?auto_161886 ?auto_161887 ) ) ( not ( = ?auto_161886 ?auto_161888 ) ) ( not ( = ?auto_161886 ?auto_161889 ) ) ( not ( = ?auto_161886 ?auto_161890 ) ) ( not ( = ?auto_161886 ?auto_161891 ) ) ( not ( = ?auto_161886 ?auto_161892 ) ) ( not ( = ?auto_161886 ?auto_161893 ) ) ( not ( = ?auto_161887 ?auto_161888 ) ) ( not ( = ?auto_161887 ?auto_161889 ) ) ( not ( = ?auto_161887 ?auto_161890 ) ) ( not ( = ?auto_161887 ?auto_161891 ) ) ( not ( = ?auto_161887 ?auto_161892 ) ) ( not ( = ?auto_161887 ?auto_161893 ) ) ( not ( = ?auto_161888 ?auto_161889 ) ) ( not ( = ?auto_161888 ?auto_161890 ) ) ( not ( = ?auto_161888 ?auto_161891 ) ) ( not ( = ?auto_161888 ?auto_161892 ) ) ( not ( = ?auto_161888 ?auto_161893 ) ) ( not ( = ?auto_161889 ?auto_161890 ) ) ( not ( = ?auto_161889 ?auto_161891 ) ) ( not ( = ?auto_161889 ?auto_161892 ) ) ( not ( = ?auto_161889 ?auto_161893 ) ) ( not ( = ?auto_161890 ?auto_161891 ) ) ( not ( = ?auto_161890 ?auto_161892 ) ) ( not ( = ?auto_161890 ?auto_161893 ) ) ( not ( = ?auto_161891 ?auto_161892 ) ) ( not ( = ?auto_161891 ?auto_161893 ) ) ( not ( = ?auto_161892 ?auto_161893 ) ) ( ON ?auto_161891 ?auto_161892 ) ( CLEAR ?auto_161889 ) ( ON ?auto_161890 ?auto_161891 ) ( CLEAR ?auto_161890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_161885 ?auto_161886 ?auto_161887 ?auto_161888 ?auto_161889 ?auto_161890 )
      ( MAKE-8PILE ?auto_161885 ?auto_161886 ?auto_161887 ?auto_161888 ?auto_161889 ?auto_161890 ?auto_161891 ?auto_161892 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161902 - BLOCK
      ?auto_161903 - BLOCK
      ?auto_161904 - BLOCK
      ?auto_161905 - BLOCK
      ?auto_161906 - BLOCK
      ?auto_161907 - BLOCK
      ?auto_161908 - BLOCK
      ?auto_161909 - BLOCK
    )
    :vars
    (
      ?auto_161910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161909 ?auto_161910 ) ( ON-TABLE ?auto_161902 ) ( ON ?auto_161903 ?auto_161902 ) ( ON ?auto_161904 ?auto_161903 ) ( ON ?auto_161905 ?auto_161904 ) ( not ( = ?auto_161902 ?auto_161903 ) ) ( not ( = ?auto_161902 ?auto_161904 ) ) ( not ( = ?auto_161902 ?auto_161905 ) ) ( not ( = ?auto_161902 ?auto_161906 ) ) ( not ( = ?auto_161902 ?auto_161907 ) ) ( not ( = ?auto_161902 ?auto_161908 ) ) ( not ( = ?auto_161902 ?auto_161909 ) ) ( not ( = ?auto_161902 ?auto_161910 ) ) ( not ( = ?auto_161903 ?auto_161904 ) ) ( not ( = ?auto_161903 ?auto_161905 ) ) ( not ( = ?auto_161903 ?auto_161906 ) ) ( not ( = ?auto_161903 ?auto_161907 ) ) ( not ( = ?auto_161903 ?auto_161908 ) ) ( not ( = ?auto_161903 ?auto_161909 ) ) ( not ( = ?auto_161903 ?auto_161910 ) ) ( not ( = ?auto_161904 ?auto_161905 ) ) ( not ( = ?auto_161904 ?auto_161906 ) ) ( not ( = ?auto_161904 ?auto_161907 ) ) ( not ( = ?auto_161904 ?auto_161908 ) ) ( not ( = ?auto_161904 ?auto_161909 ) ) ( not ( = ?auto_161904 ?auto_161910 ) ) ( not ( = ?auto_161905 ?auto_161906 ) ) ( not ( = ?auto_161905 ?auto_161907 ) ) ( not ( = ?auto_161905 ?auto_161908 ) ) ( not ( = ?auto_161905 ?auto_161909 ) ) ( not ( = ?auto_161905 ?auto_161910 ) ) ( not ( = ?auto_161906 ?auto_161907 ) ) ( not ( = ?auto_161906 ?auto_161908 ) ) ( not ( = ?auto_161906 ?auto_161909 ) ) ( not ( = ?auto_161906 ?auto_161910 ) ) ( not ( = ?auto_161907 ?auto_161908 ) ) ( not ( = ?auto_161907 ?auto_161909 ) ) ( not ( = ?auto_161907 ?auto_161910 ) ) ( not ( = ?auto_161908 ?auto_161909 ) ) ( not ( = ?auto_161908 ?auto_161910 ) ) ( not ( = ?auto_161909 ?auto_161910 ) ) ( ON ?auto_161908 ?auto_161909 ) ( ON ?auto_161907 ?auto_161908 ) ( CLEAR ?auto_161905 ) ( ON ?auto_161906 ?auto_161907 ) ( CLEAR ?auto_161906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161902 ?auto_161903 ?auto_161904 ?auto_161905 ?auto_161906 )
      ( MAKE-8PILE ?auto_161902 ?auto_161903 ?auto_161904 ?auto_161905 ?auto_161906 ?auto_161907 ?auto_161908 ?auto_161909 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161919 - BLOCK
      ?auto_161920 - BLOCK
      ?auto_161921 - BLOCK
      ?auto_161922 - BLOCK
      ?auto_161923 - BLOCK
      ?auto_161924 - BLOCK
      ?auto_161925 - BLOCK
      ?auto_161926 - BLOCK
    )
    :vars
    (
      ?auto_161927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161926 ?auto_161927 ) ( ON-TABLE ?auto_161919 ) ( ON ?auto_161920 ?auto_161919 ) ( ON ?auto_161921 ?auto_161920 ) ( ON ?auto_161922 ?auto_161921 ) ( not ( = ?auto_161919 ?auto_161920 ) ) ( not ( = ?auto_161919 ?auto_161921 ) ) ( not ( = ?auto_161919 ?auto_161922 ) ) ( not ( = ?auto_161919 ?auto_161923 ) ) ( not ( = ?auto_161919 ?auto_161924 ) ) ( not ( = ?auto_161919 ?auto_161925 ) ) ( not ( = ?auto_161919 ?auto_161926 ) ) ( not ( = ?auto_161919 ?auto_161927 ) ) ( not ( = ?auto_161920 ?auto_161921 ) ) ( not ( = ?auto_161920 ?auto_161922 ) ) ( not ( = ?auto_161920 ?auto_161923 ) ) ( not ( = ?auto_161920 ?auto_161924 ) ) ( not ( = ?auto_161920 ?auto_161925 ) ) ( not ( = ?auto_161920 ?auto_161926 ) ) ( not ( = ?auto_161920 ?auto_161927 ) ) ( not ( = ?auto_161921 ?auto_161922 ) ) ( not ( = ?auto_161921 ?auto_161923 ) ) ( not ( = ?auto_161921 ?auto_161924 ) ) ( not ( = ?auto_161921 ?auto_161925 ) ) ( not ( = ?auto_161921 ?auto_161926 ) ) ( not ( = ?auto_161921 ?auto_161927 ) ) ( not ( = ?auto_161922 ?auto_161923 ) ) ( not ( = ?auto_161922 ?auto_161924 ) ) ( not ( = ?auto_161922 ?auto_161925 ) ) ( not ( = ?auto_161922 ?auto_161926 ) ) ( not ( = ?auto_161922 ?auto_161927 ) ) ( not ( = ?auto_161923 ?auto_161924 ) ) ( not ( = ?auto_161923 ?auto_161925 ) ) ( not ( = ?auto_161923 ?auto_161926 ) ) ( not ( = ?auto_161923 ?auto_161927 ) ) ( not ( = ?auto_161924 ?auto_161925 ) ) ( not ( = ?auto_161924 ?auto_161926 ) ) ( not ( = ?auto_161924 ?auto_161927 ) ) ( not ( = ?auto_161925 ?auto_161926 ) ) ( not ( = ?auto_161925 ?auto_161927 ) ) ( not ( = ?auto_161926 ?auto_161927 ) ) ( ON ?auto_161925 ?auto_161926 ) ( ON ?auto_161924 ?auto_161925 ) ( CLEAR ?auto_161922 ) ( ON ?auto_161923 ?auto_161924 ) ( CLEAR ?auto_161923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_161919 ?auto_161920 ?auto_161921 ?auto_161922 ?auto_161923 )
      ( MAKE-8PILE ?auto_161919 ?auto_161920 ?auto_161921 ?auto_161922 ?auto_161923 ?auto_161924 ?auto_161925 ?auto_161926 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161936 - BLOCK
      ?auto_161937 - BLOCK
      ?auto_161938 - BLOCK
      ?auto_161939 - BLOCK
      ?auto_161940 - BLOCK
      ?auto_161941 - BLOCK
      ?auto_161942 - BLOCK
      ?auto_161943 - BLOCK
    )
    :vars
    (
      ?auto_161944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161943 ?auto_161944 ) ( ON-TABLE ?auto_161936 ) ( ON ?auto_161937 ?auto_161936 ) ( ON ?auto_161938 ?auto_161937 ) ( not ( = ?auto_161936 ?auto_161937 ) ) ( not ( = ?auto_161936 ?auto_161938 ) ) ( not ( = ?auto_161936 ?auto_161939 ) ) ( not ( = ?auto_161936 ?auto_161940 ) ) ( not ( = ?auto_161936 ?auto_161941 ) ) ( not ( = ?auto_161936 ?auto_161942 ) ) ( not ( = ?auto_161936 ?auto_161943 ) ) ( not ( = ?auto_161936 ?auto_161944 ) ) ( not ( = ?auto_161937 ?auto_161938 ) ) ( not ( = ?auto_161937 ?auto_161939 ) ) ( not ( = ?auto_161937 ?auto_161940 ) ) ( not ( = ?auto_161937 ?auto_161941 ) ) ( not ( = ?auto_161937 ?auto_161942 ) ) ( not ( = ?auto_161937 ?auto_161943 ) ) ( not ( = ?auto_161937 ?auto_161944 ) ) ( not ( = ?auto_161938 ?auto_161939 ) ) ( not ( = ?auto_161938 ?auto_161940 ) ) ( not ( = ?auto_161938 ?auto_161941 ) ) ( not ( = ?auto_161938 ?auto_161942 ) ) ( not ( = ?auto_161938 ?auto_161943 ) ) ( not ( = ?auto_161938 ?auto_161944 ) ) ( not ( = ?auto_161939 ?auto_161940 ) ) ( not ( = ?auto_161939 ?auto_161941 ) ) ( not ( = ?auto_161939 ?auto_161942 ) ) ( not ( = ?auto_161939 ?auto_161943 ) ) ( not ( = ?auto_161939 ?auto_161944 ) ) ( not ( = ?auto_161940 ?auto_161941 ) ) ( not ( = ?auto_161940 ?auto_161942 ) ) ( not ( = ?auto_161940 ?auto_161943 ) ) ( not ( = ?auto_161940 ?auto_161944 ) ) ( not ( = ?auto_161941 ?auto_161942 ) ) ( not ( = ?auto_161941 ?auto_161943 ) ) ( not ( = ?auto_161941 ?auto_161944 ) ) ( not ( = ?auto_161942 ?auto_161943 ) ) ( not ( = ?auto_161942 ?auto_161944 ) ) ( not ( = ?auto_161943 ?auto_161944 ) ) ( ON ?auto_161942 ?auto_161943 ) ( ON ?auto_161941 ?auto_161942 ) ( ON ?auto_161940 ?auto_161941 ) ( CLEAR ?auto_161938 ) ( ON ?auto_161939 ?auto_161940 ) ( CLEAR ?auto_161939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161936 ?auto_161937 ?auto_161938 ?auto_161939 )
      ( MAKE-8PILE ?auto_161936 ?auto_161937 ?auto_161938 ?auto_161939 ?auto_161940 ?auto_161941 ?auto_161942 ?auto_161943 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161953 - BLOCK
      ?auto_161954 - BLOCK
      ?auto_161955 - BLOCK
      ?auto_161956 - BLOCK
      ?auto_161957 - BLOCK
      ?auto_161958 - BLOCK
      ?auto_161959 - BLOCK
      ?auto_161960 - BLOCK
    )
    :vars
    (
      ?auto_161961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161960 ?auto_161961 ) ( ON-TABLE ?auto_161953 ) ( ON ?auto_161954 ?auto_161953 ) ( ON ?auto_161955 ?auto_161954 ) ( not ( = ?auto_161953 ?auto_161954 ) ) ( not ( = ?auto_161953 ?auto_161955 ) ) ( not ( = ?auto_161953 ?auto_161956 ) ) ( not ( = ?auto_161953 ?auto_161957 ) ) ( not ( = ?auto_161953 ?auto_161958 ) ) ( not ( = ?auto_161953 ?auto_161959 ) ) ( not ( = ?auto_161953 ?auto_161960 ) ) ( not ( = ?auto_161953 ?auto_161961 ) ) ( not ( = ?auto_161954 ?auto_161955 ) ) ( not ( = ?auto_161954 ?auto_161956 ) ) ( not ( = ?auto_161954 ?auto_161957 ) ) ( not ( = ?auto_161954 ?auto_161958 ) ) ( not ( = ?auto_161954 ?auto_161959 ) ) ( not ( = ?auto_161954 ?auto_161960 ) ) ( not ( = ?auto_161954 ?auto_161961 ) ) ( not ( = ?auto_161955 ?auto_161956 ) ) ( not ( = ?auto_161955 ?auto_161957 ) ) ( not ( = ?auto_161955 ?auto_161958 ) ) ( not ( = ?auto_161955 ?auto_161959 ) ) ( not ( = ?auto_161955 ?auto_161960 ) ) ( not ( = ?auto_161955 ?auto_161961 ) ) ( not ( = ?auto_161956 ?auto_161957 ) ) ( not ( = ?auto_161956 ?auto_161958 ) ) ( not ( = ?auto_161956 ?auto_161959 ) ) ( not ( = ?auto_161956 ?auto_161960 ) ) ( not ( = ?auto_161956 ?auto_161961 ) ) ( not ( = ?auto_161957 ?auto_161958 ) ) ( not ( = ?auto_161957 ?auto_161959 ) ) ( not ( = ?auto_161957 ?auto_161960 ) ) ( not ( = ?auto_161957 ?auto_161961 ) ) ( not ( = ?auto_161958 ?auto_161959 ) ) ( not ( = ?auto_161958 ?auto_161960 ) ) ( not ( = ?auto_161958 ?auto_161961 ) ) ( not ( = ?auto_161959 ?auto_161960 ) ) ( not ( = ?auto_161959 ?auto_161961 ) ) ( not ( = ?auto_161960 ?auto_161961 ) ) ( ON ?auto_161959 ?auto_161960 ) ( ON ?auto_161958 ?auto_161959 ) ( ON ?auto_161957 ?auto_161958 ) ( CLEAR ?auto_161955 ) ( ON ?auto_161956 ?auto_161957 ) ( CLEAR ?auto_161956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_161953 ?auto_161954 ?auto_161955 ?auto_161956 )
      ( MAKE-8PILE ?auto_161953 ?auto_161954 ?auto_161955 ?auto_161956 ?auto_161957 ?auto_161958 ?auto_161959 ?auto_161960 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161970 - BLOCK
      ?auto_161971 - BLOCK
      ?auto_161972 - BLOCK
      ?auto_161973 - BLOCK
      ?auto_161974 - BLOCK
      ?auto_161975 - BLOCK
      ?auto_161976 - BLOCK
      ?auto_161977 - BLOCK
    )
    :vars
    (
      ?auto_161978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161977 ?auto_161978 ) ( ON-TABLE ?auto_161970 ) ( ON ?auto_161971 ?auto_161970 ) ( not ( = ?auto_161970 ?auto_161971 ) ) ( not ( = ?auto_161970 ?auto_161972 ) ) ( not ( = ?auto_161970 ?auto_161973 ) ) ( not ( = ?auto_161970 ?auto_161974 ) ) ( not ( = ?auto_161970 ?auto_161975 ) ) ( not ( = ?auto_161970 ?auto_161976 ) ) ( not ( = ?auto_161970 ?auto_161977 ) ) ( not ( = ?auto_161970 ?auto_161978 ) ) ( not ( = ?auto_161971 ?auto_161972 ) ) ( not ( = ?auto_161971 ?auto_161973 ) ) ( not ( = ?auto_161971 ?auto_161974 ) ) ( not ( = ?auto_161971 ?auto_161975 ) ) ( not ( = ?auto_161971 ?auto_161976 ) ) ( not ( = ?auto_161971 ?auto_161977 ) ) ( not ( = ?auto_161971 ?auto_161978 ) ) ( not ( = ?auto_161972 ?auto_161973 ) ) ( not ( = ?auto_161972 ?auto_161974 ) ) ( not ( = ?auto_161972 ?auto_161975 ) ) ( not ( = ?auto_161972 ?auto_161976 ) ) ( not ( = ?auto_161972 ?auto_161977 ) ) ( not ( = ?auto_161972 ?auto_161978 ) ) ( not ( = ?auto_161973 ?auto_161974 ) ) ( not ( = ?auto_161973 ?auto_161975 ) ) ( not ( = ?auto_161973 ?auto_161976 ) ) ( not ( = ?auto_161973 ?auto_161977 ) ) ( not ( = ?auto_161973 ?auto_161978 ) ) ( not ( = ?auto_161974 ?auto_161975 ) ) ( not ( = ?auto_161974 ?auto_161976 ) ) ( not ( = ?auto_161974 ?auto_161977 ) ) ( not ( = ?auto_161974 ?auto_161978 ) ) ( not ( = ?auto_161975 ?auto_161976 ) ) ( not ( = ?auto_161975 ?auto_161977 ) ) ( not ( = ?auto_161975 ?auto_161978 ) ) ( not ( = ?auto_161976 ?auto_161977 ) ) ( not ( = ?auto_161976 ?auto_161978 ) ) ( not ( = ?auto_161977 ?auto_161978 ) ) ( ON ?auto_161976 ?auto_161977 ) ( ON ?auto_161975 ?auto_161976 ) ( ON ?auto_161974 ?auto_161975 ) ( ON ?auto_161973 ?auto_161974 ) ( CLEAR ?auto_161971 ) ( ON ?auto_161972 ?auto_161973 ) ( CLEAR ?auto_161972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161970 ?auto_161971 ?auto_161972 )
      ( MAKE-8PILE ?auto_161970 ?auto_161971 ?auto_161972 ?auto_161973 ?auto_161974 ?auto_161975 ?auto_161976 ?auto_161977 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_161987 - BLOCK
      ?auto_161988 - BLOCK
      ?auto_161989 - BLOCK
      ?auto_161990 - BLOCK
      ?auto_161991 - BLOCK
      ?auto_161992 - BLOCK
      ?auto_161993 - BLOCK
      ?auto_161994 - BLOCK
    )
    :vars
    (
      ?auto_161995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_161994 ?auto_161995 ) ( ON-TABLE ?auto_161987 ) ( ON ?auto_161988 ?auto_161987 ) ( not ( = ?auto_161987 ?auto_161988 ) ) ( not ( = ?auto_161987 ?auto_161989 ) ) ( not ( = ?auto_161987 ?auto_161990 ) ) ( not ( = ?auto_161987 ?auto_161991 ) ) ( not ( = ?auto_161987 ?auto_161992 ) ) ( not ( = ?auto_161987 ?auto_161993 ) ) ( not ( = ?auto_161987 ?auto_161994 ) ) ( not ( = ?auto_161987 ?auto_161995 ) ) ( not ( = ?auto_161988 ?auto_161989 ) ) ( not ( = ?auto_161988 ?auto_161990 ) ) ( not ( = ?auto_161988 ?auto_161991 ) ) ( not ( = ?auto_161988 ?auto_161992 ) ) ( not ( = ?auto_161988 ?auto_161993 ) ) ( not ( = ?auto_161988 ?auto_161994 ) ) ( not ( = ?auto_161988 ?auto_161995 ) ) ( not ( = ?auto_161989 ?auto_161990 ) ) ( not ( = ?auto_161989 ?auto_161991 ) ) ( not ( = ?auto_161989 ?auto_161992 ) ) ( not ( = ?auto_161989 ?auto_161993 ) ) ( not ( = ?auto_161989 ?auto_161994 ) ) ( not ( = ?auto_161989 ?auto_161995 ) ) ( not ( = ?auto_161990 ?auto_161991 ) ) ( not ( = ?auto_161990 ?auto_161992 ) ) ( not ( = ?auto_161990 ?auto_161993 ) ) ( not ( = ?auto_161990 ?auto_161994 ) ) ( not ( = ?auto_161990 ?auto_161995 ) ) ( not ( = ?auto_161991 ?auto_161992 ) ) ( not ( = ?auto_161991 ?auto_161993 ) ) ( not ( = ?auto_161991 ?auto_161994 ) ) ( not ( = ?auto_161991 ?auto_161995 ) ) ( not ( = ?auto_161992 ?auto_161993 ) ) ( not ( = ?auto_161992 ?auto_161994 ) ) ( not ( = ?auto_161992 ?auto_161995 ) ) ( not ( = ?auto_161993 ?auto_161994 ) ) ( not ( = ?auto_161993 ?auto_161995 ) ) ( not ( = ?auto_161994 ?auto_161995 ) ) ( ON ?auto_161993 ?auto_161994 ) ( ON ?auto_161992 ?auto_161993 ) ( ON ?auto_161991 ?auto_161992 ) ( ON ?auto_161990 ?auto_161991 ) ( CLEAR ?auto_161988 ) ( ON ?auto_161989 ?auto_161990 ) ( CLEAR ?auto_161989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_161987 ?auto_161988 ?auto_161989 )
      ( MAKE-8PILE ?auto_161987 ?auto_161988 ?auto_161989 ?auto_161990 ?auto_161991 ?auto_161992 ?auto_161993 ?auto_161994 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162004 - BLOCK
      ?auto_162005 - BLOCK
      ?auto_162006 - BLOCK
      ?auto_162007 - BLOCK
      ?auto_162008 - BLOCK
      ?auto_162009 - BLOCK
      ?auto_162010 - BLOCK
      ?auto_162011 - BLOCK
    )
    :vars
    (
      ?auto_162012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162011 ?auto_162012 ) ( ON-TABLE ?auto_162004 ) ( not ( = ?auto_162004 ?auto_162005 ) ) ( not ( = ?auto_162004 ?auto_162006 ) ) ( not ( = ?auto_162004 ?auto_162007 ) ) ( not ( = ?auto_162004 ?auto_162008 ) ) ( not ( = ?auto_162004 ?auto_162009 ) ) ( not ( = ?auto_162004 ?auto_162010 ) ) ( not ( = ?auto_162004 ?auto_162011 ) ) ( not ( = ?auto_162004 ?auto_162012 ) ) ( not ( = ?auto_162005 ?auto_162006 ) ) ( not ( = ?auto_162005 ?auto_162007 ) ) ( not ( = ?auto_162005 ?auto_162008 ) ) ( not ( = ?auto_162005 ?auto_162009 ) ) ( not ( = ?auto_162005 ?auto_162010 ) ) ( not ( = ?auto_162005 ?auto_162011 ) ) ( not ( = ?auto_162005 ?auto_162012 ) ) ( not ( = ?auto_162006 ?auto_162007 ) ) ( not ( = ?auto_162006 ?auto_162008 ) ) ( not ( = ?auto_162006 ?auto_162009 ) ) ( not ( = ?auto_162006 ?auto_162010 ) ) ( not ( = ?auto_162006 ?auto_162011 ) ) ( not ( = ?auto_162006 ?auto_162012 ) ) ( not ( = ?auto_162007 ?auto_162008 ) ) ( not ( = ?auto_162007 ?auto_162009 ) ) ( not ( = ?auto_162007 ?auto_162010 ) ) ( not ( = ?auto_162007 ?auto_162011 ) ) ( not ( = ?auto_162007 ?auto_162012 ) ) ( not ( = ?auto_162008 ?auto_162009 ) ) ( not ( = ?auto_162008 ?auto_162010 ) ) ( not ( = ?auto_162008 ?auto_162011 ) ) ( not ( = ?auto_162008 ?auto_162012 ) ) ( not ( = ?auto_162009 ?auto_162010 ) ) ( not ( = ?auto_162009 ?auto_162011 ) ) ( not ( = ?auto_162009 ?auto_162012 ) ) ( not ( = ?auto_162010 ?auto_162011 ) ) ( not ( = ?auto_162010 ?auto_162012 ) ) ( not ( = ?auto_162011 ?auto_162012 ) ) ( ON ?auto_162010 ?auto_162011 ) ( ON ?auto_162009 ?auto_162010 ) ( ON ?auto_162008 ?auto_162009 ) ( ON ?auto_162007 ?auto_162008 ) ( ON ?auto_162006 ?auto_162007 ) ( CLEAR ?auto_162004 ) ( ON ?auto_162005 ?auto_162006 ) ( CLEAR ?auto_162005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162004 ?auto_162005 )
      ( MAKE-8PILE ?auto_162004 ?auto_162005 ?auto_162006 ?auto_162007 ?auto_162008 ?auto_162009 ?auto_162010 ?auto_162011 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162021 - BLOCK
      ?auto_162022 - BLOCK
      ?auto_162023 - BLOCK
      ?auto_162024 - BLOCK
      ?auto_162025 - BLOCK
      ?auto_162026 - BLOCK
      ?auto_162027 - BLOCK
      ?auto_162028 - BLOCK
    )
    :vars
    (
      ?auto_162029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162028 ?auto_162029 ) ( ON-TABLE ?auto_162021 ) ( not ( = ?auto_162021 ?auto_162022 ) ) ( not ( = ?auto_162021 ?auto_162023 ) ) ( not ( = ?auto_162021 ?auto_162024 ) ) ( not ( = ?auto_162021 ?auto_162025 ) ) ( not ( = ?auto_162021 ?auto_162026 ) ) ( not ( = ?auto_162021 ?auto_162027 ) ) ( not ( = ?auto_162021 ?auto_162028 ) ) ( not ( = ?auto_162021 ?auto_162029 ) ) ( not ( = ?auto_162022 ?auto_162023 ) ) ( not ( = ?auto_162022 ?auto_162024 ) ) ( not ( = ?auto_162022 ?auto_162025 ) ) ( not ( = ?auto_162022 ?auto_162026 ) ) ( not ( = ?auto_162022 ?auto_162027 ) ) ( not ( = ?auto_162022 ?auto_162028 ) ) ( not ( = ?auto_162022 ?auto_162029 ) ) ( not ( = ?auto_162023 ?auto_162024 ) ) ( not ( = ?auto_162023 ?auto_162025 ) ) ( not ( = ?auto_162023 ?auto_162026 ) ) ( not ( = ?auto_162023 ?auto_162027 ) ) ( not ( = ?auto_162023 ?auto_162028 ) ) ( not ( = ?auto_162023 ?auto_162029 ) ) ( not ( = ?auto_162024 ?auto_162025 ) ) ( not ( = ?auto_162024 ?auto_162026 ) ) ( not ( = ?auto_162024 ?auto_162027 ) ) ( not ( = ?auto_162024 ?auto_162028 ) ) ( not ( = ?auto_162024 ?auto_162029 ) ) ( not ( = ?auto_162025 ?auto_162026 ) ) ( not ( = ?auto_162025 ?auto_162027 ) ) ( not ( = ?auto_162025 ?auto_162028 ) ) ( not ( = ?auto_162025 ?auto_162029 ) ) ( not ( = ?auto_162026 ?auto_162027 ) ) ( not ( = ?auto_162026 ?auto_162028 ) ) ( not ( = ?auto_162026 ?auto_162029 ) ) ( not ( = ?auto_162027 ?auto_162028 ) ) ( not ( = ?auto_162027 ?auto_162029 ) ) ( not ( = ?auto_162028 ?auto_162029 ) ) ( ON ?auto_162027 ?auto_162028 ) ( ON ?auto_162026 ?auto_162027 ) ( ON ?auto_162025 ?auto_162026 ) ( ON ?auto_162024 ?auto_162025 ) ( ON ?auto_162023 ?auto_162024 ) ( CLEAR ?auto_162021 ) ( ON ?auto_162022 ?auto_162023 ) ( CLEAR ?auto_162022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162021 ?auto_162022 )
      ( MAKE-8PILE ?auto_162021 ?auto_162022 ?auto_162023 ?auto_162024 ?auto_162025 ?auto_162026 ?auto_162027 ?auto_162028 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162038 - BLOCK
      ?auto_162039 - BLOCK
      ?auto_162040 - BLOCK
      ?auto_162041 - BLOCK
      ?auto_162042 - BLOCK
      ?auto_162043 - BLOCK
      ?auto_162044 - BLOCK
      ?auto_162045 - BLOCK
    )
    :vars
    (
      ?auto_162046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162045 ?auto_162046 ) ( not ( = ?auto_162038 ?auto_162039 ) ) ( not ( = ?auto_162038 ?auto_162040 ) ) ( not ( = ?auto_162038 ?auto_162041 ) ) ( not ( = ?auto_162038 ?auto_162042 ) ) ( not ( = ?auto_162038 ?auto_162043 ) ) ( not ( = ?auto_162038 ?auto_162044 ) ) ( not ( = ?auto_162038 ?auto_162045 ) ) ( not ( = ?auto_162038 ?auto_162046 ) ) ( not ( = ?auto_162039 ?auto_162040 ) ) ( not ( = ?auto_162039 ?auto_162041 ) ) ( not ( = ?auto_162039 ?auto_162042 ) ) ( not ( = ?auto_162039 ?auto_162043 ) ) ( not ( = ?auto_162039 ?auto_162044 ) ) ( not ( = ?auto_162039 ?auto_162045 ) ) ( not ( = ?auto_162039 ?auto_162046 ) ) ( not ( = ?auto_162040 ?auto_162041 ) ) ( not ( = ?auto_162040 ?auto_162042 ) ) ( not ( = ?auto_162040 ?auto_162043 ) ) ( not ( = ?auto_162040 ?auto_162044 ) ) ( not ( = ?auto_162040 ?auto_162045 ) ) ( not ( = ?auto_162040 ?auto_162046 ) ) ( not ( = ?auto_162041 ?auto_162042 ) ) ( not ( = ?auto_162041 ?auto_162043 ) ) ( not ( = ?auto_162041 ?auto_162044 ) ) ( not ( = ?auto_162041 ?auto_162045 ) ) ( not ( = ?auto_162041 ?auto_162046 ) ) ( not ( = ?auto_162042 ?auto_162043 ) ) ( not ( = ?auto_162042 ?auto_162044 ) ) ( not ( = ?auto_162042 ?auto_162045 ) ) ( not ( = ?auto_162042 ?auto_162046 ) ) ( not ( = ?auto_162043 ?auto_162044 ) ) ( not ( = ?auto_162043 ?auto_162045 ) ) ( not ( = ?auto_162043 ?auto_162046 ) ) ( not ( = ?auto_162044 ?auto_162045 ) ) ( not ( = ?auto_162044 ?auto_162046 ) ) ( not ( = ?auto_162045 ?auto_162046 ) ) ( ON ?auto_162044 ?auto_162045 ) ( ON ?auto_162043 ?auto_162044 ) ( ON ?auto_162042 ?auto_162043 ) ( ON ?auto_162041 ?auto_162042 ) ( ON ?auto_162040 ?auto_162041 ) ( ON ?auto_162039 ?auto_162040 ) ( ON ?auto_162038 ?auto_162039 ) ( CLEAR ?auto_162038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162038 )
      ( MAKE-8PILE ?auto_162038 ?auto_162039 ?auto_162040 ?auto_162041 ?auto_162042 ?auto_162043 ?auto_162044 ?auto_162045 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_162055 - BLOCK
      ?auto_162056 - BLOCK
      ?auto_162057 - BLOCK
      ?auto_162058 - BLOCK
      ?auto_162059 - BLOCK
      ?auto_162060 - BLOCK
      ?auto_162061 - BLOCK
      ?auto_162062 - BLOCK
    )
    :vars
    (
      ?auto_162063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162062 ?auto_162063 ) ( not ( = ?auto_162055 ?auto_162056 ) ) ( not ( = ?auto_162055 ?auto_162057 ) ) ( not ( = ?auto_162055 ?auto_162058 ) ) ( not ( = ?auto_162055 ?auto_162059 ) ) ( not ( = ?auto_162055 ?auto_162060 ) ) ( not ( = ?auto_162055 ?auto_162061 ) ) ( not ( = ?auto_162055 ?auto_162062 ) ) ( not ( = ?auto_162055 ?auto_162063 ) ) ( not ( = ?auto_162056 ?auto_162057 ) ) ( not ( = ?auto_162056 ?auto_162058 ) ) ( not ( = ?auto_162056 ?auto_162059 ) ) ( not ( = ?auto_162056 ?auto_162060 ) ) ( not ( = ?auto_162056 ?auto_162061 ) ) ( not ( = ?auto_162056 ?auto_162062 ) ) ( not ( = ?auto_162056 ?auto_162063 ) ) ( not ( = ?auto_162057 ?auto_162058 ) ) ( not ( = ?auto_162057 ?auto_162059 ) ) ( not ( = ?auto_162057 ?auto_162060 ) ) ( not ( = ?auto_162057 ?auto_162061 ) ) ( not ( = ?auto_162057 ?auto_162062 ) ) ( not ( = ?auto_162057 ?auto_162063 ) ) ( not ( = ?auto_162058 ?auto_162059 ) ) ( not ( = ?auto_162058 ?auto_162060 ) ) ( not ( = ?auto_162058 ?auto_162061 ) ) ( not ( = ?auto_162058 ?auto_162062 ) ) ( not ( = ?auto_162058 ?auto_162063 ) ) ( not ( = ?auto_162059 ?auto_162060 ) ) ( not ( = ?auto_162059 ?auto_162061 ) ) ( not ( = ?auto_162059 ?auto_162062 ) ) ( not ( = ?auto_162059 ?auto_162063 ) ) ( not ( = ?auto_162060 ?auto_162061 ) ) ( not ( = ?auto_162060 ?auto_162062 ) ) ( not ( = ?auto_162060 ?auto_162063 ) ) ( not ( = ?auto_162061 ?auto_162062 ) ) ( not ( = ?auto_162061 ?auto_162063 ) ) ( not ( = ?auto_162062 ?auto_162063 ) ) ( ON ?auto_162061 ?auto_162062 ) ( ON ?auto_162060 ?auto_162061 ) ( ON ?auto_162059 ?auto_162060 ) ( ON ?auto_162058 ?auto_162059 ) ( ON ?auto_162057 ?auto_162058 ) ( ON ?auto_162056 ?auto_162057 ) ( ON ?auto_162055 ?auto_162056 ) ( CLEAR ?auto_162055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162055 )
      ( MAKE-8PILE ?auto_162055 ?auto_162056 ?auto_162057 ?auto_162058 ?auto_162059 ?auto_162060 ?auto_162061 ?auto_162062 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162073 - BLOCK
      ?auto_162074 - BLOCK
      ?auto_162075 - BLOCK
      ?auto_162076 - BLOCK
      ?auto_162077 - BLOCK
      ?auto_162078 - BLOCK
      ?auto_162079 - BLOCK
      ?auto_162080 - BLOCK
      ?auto_162081 - BLOCK
    )
    :vars
    (
      ?auto_162082 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162080 ) ( ON ?auto_162081 ?auto_162082 ) ( CLEAR ?auto_162081 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162073 ) ( ON ?auto_162074 ?auto_162073 ) ( ON ?auto_162075 ?auto_162074 ) ( ON ?auto_162076 ?auto_162075 ) ( ON ?auto_162077 ?auto_162076 ) ( ON ?auto_162078 ?auto_162077 ) ( ON ?auto_162079 ?auto_162078 ) ( ON ?auto_162080 ?auto_162079 ) ( not ( = ?auto_162073 ?auto_162074 ) ) ( not ( = ?auto_162073 ?auto_162075 ) ) ( not ( = ?auto_162073 ?auto_162076 ) ) ( not ( = ?auto_162073 ?auto_162077 ) ) ( not ( = ?auto_162073 ?auto_162078 ) ) ( not ( = ?auto_162073 ?auto_162079 ) ) ( not ( = ?auto_162073 ?auto_162080 ) ) ( not ( = ?auto_162073 ?auto_162081 ) ) ( not ( = ?auto_162073 ?auto_162082 ) ) ( not ( = ?auto_162074 ?auto_162075 ) ) ( not ( = ?auto_162074 ?auto_162076 ) ) ( not ( = ?auto_162074 ?auto_162077 ) ) ( not ( = ?auto_162074 ?auto_162078 ) ) ( not ( = ?auto_162074 ?auto_162079 ) ) ( not ( = ?auto_162074 ?auto_162080 ) ) ( not ( = ?auto_162074 ?auto_162081 ) ) ( not ( = ?auto_162074 ?auto_162082 ) ) ( not ( = ?auto_162075 ?auto_162076 ) ) ( not ( = ?auto_162075 ?auto_162077 ) ) ( not ( = ?auto_162075 ?auto_162078 ) ) ( not ( = ?auto_162075 ?auto_162079 ) ) ( not ( = ?auto_162075 ?auto_162080 ) ) ( not ( = ?auto_162075 ?auto_162081 ) ) ( not ( = ?auto_162075 ?auto_162082 ) ) ( not ( = ?auto_162076 ?auto_162077 ) ) ( not ( = ?auto_162076 ?auto_162078 ) ) ( not ( = ?auto_162076 ?auto_162079 ) ) ( not ( = ?auto_162076 ?auto_162080 ) ) ( not ( = ?auto_162076 ?auto_162081 ) ) ( not ( = ?auto_162076 ?auto_162082 ) ) ( not ( = ?auto_162077 ?auto_162078 ) ) ( not ( = ?auto_162077 ?auto_162079 ) ) ( not ( = ?auto_162077 ?auto_162080 ) ) ( not ( = ?auto_162077 ?auto_162081 ) ) ( not ( = ?auto_162077 ?auto_162082 ) ) ( not ( = ?auto_162078 ?auto_162079 ) ) ( not ( = ?auto_162078 ?auto_162080 ) ) ( not ( = ?auto_162078 ?auto_162081 ) ) ( not ( = ?auto_162078 ?auto_162082 ) ) ( not ( = ?auto_162079 ?auto_162080 ) ) ( not ( = ?auto_162079 ?auto_162081 ) ) ( not ( = ?auto_162079 ?auto_162082 ) ) ( not ( = ?auto_162080 ?auto_162081 ) ) ( not ( = ?auto_162080 ?auto_162082 ) ) ( not ( = ?auto_162081 ?auto_162082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162081 ?auto_162082 )
      ( !STACK ?auto_162081 ?auto_162080 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162092 - BLOCK
      ?auto_162093 - BLOCK
      ?auto_162094 - BLOCK
      ?auto_162095 - BLOCK
      ?auto_162096 - BLOCK
      ?auto_162097 - BLOCK
      ?auto_162098 - BLOCK
      ?auto_162099 - BLOCK
      ?auto_162100 - BLOCK
    )
    :vars
    (
      ?auto_162101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162099 ) ( ON ?auto_162100 ?auto_162101 ) ( CLEAR ?auto_162100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162092 ) ( ON ?auto_162093 ?auto_162092 ) ( ON ?auto_162094 ?auto_162093 ) ( ON ?auto_162095 ?auto_162094 ) ( ON ?auto_162096 ?auto_162095 ) ( ON ?auto_162097 ?auto_162096 ) ( ON ?auto_162098 ?auto_162097 ) ( ON ?auto_162099 ?auto_162098 ) ( not ( = ?auto_162092 ?auto_162093 ) ) ( not ( = ?auto_162092 ?auto_162094 ) ) ( not ( = ?auto_162092 ?auto_162095 ) ) ( not ( = ?auto_162092 ?auto_162096 ) ) ( not ( = ?auto_162092 ?auto_162097 ) ) ( not ( = ?auto_162092 ?auto_162098 ) ) ( not ( = ?auto_162092 ?auto_162099 ) ) ( not ( = ?auto_162092 ?auto_162100 ) ) ( not ( = ?auto_162092 ?auto_162101 ) ) ( not ( = ?auto_162093 ?auto_162094 ) ) ( not ( = ?auto_162093 ?auto_162095 ) ) ( not ( = ?auto_162093 ?auto_162096 ) ) ( not ( = ?auto_162093 ?auto_162097 ) ) ( not ( = ?auto_162093 ?auto_162098 ) ) ( not ( = ?auto_162093 ?auto_162099 ) ) ( not ( = ?auto_162093 ?auto_162100 ) ) ( not ( = ?auto_162093 ?auto_162101 ) ) ( not ( = ?auto_162094 ?auto_162095 ) ) ( not ( = ?auto_162094 ?auto_162096 ) ) ( not ( = ?auto_162094 ?auto_162097 ) ) ( not ( = ?auto_162094 ?auto_162098 ) ) ( not ( = ?auto_162094 ?auto_162099 ) ) ( not ( = ?auto_162094 ?auto_162100 ) ) ( not ( = ?auto_162094 ?auto_162101 ) ) ( not ( = ?auto_162095 ?auto_162096 ) ) ( not ( = ?auto_162095 ?auto_162097 ) ) ( not ( = ?auto_162095 ?auto_162098 ) ) ( not ( = ?auto_162095 ?auto_162099 ) ) ( not ( = ?auto_162095 ?auto_162100 ) ) ( not ( = ?auto_162095 ?auto_162101 ) ) ( not ( = ?auto_162096 ?auto_162097 ) ) ( not ( = ?auto_162096 ?auto_162098 ) ) ( not ( = ?auto_162096 ?auto_162099 ) ) ( not ( = ?auto_162096 ?auto_162100 ) ) ( not ( = ?auto_162096 ?auto_162101 ) ) ( not ( = ?auto_162097 ?auto_162098 ) ) ( not ( = ?auto_162097 ?auto_162099 ) ) ( not ( = ?auto_162097 ?auto_162100 ) ) ( not ( = ?auto_162097 ?auto_162101 ) ) ( not ( = ?auto_162098 ?auto_162099 ) ) ( not ( = ?auto_162098 ?auto_162100 ) ) ( not ( = ?auto_162098 ?auto_162101 ) ) ( not ( = ?auto_162099 ?auto_162100 ) ) ( not ( = ?auto_162099 ?auto_162101 ) ) ( not ( = ?auto_162100 ?auto_162101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162100 ?auto_162101 )
      ( !STACK ?auto_162100 ?auto_162099 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162111 - BLOCK
      ?auto_162112 - BLOCK
      ?auto_162113 - BLOCK
      ?auto_162114 - BLOCK
      ?auto_162115 - BLOCK
      ?auto_162116 - BLOCK
      ?auto_162117 - BLOCK
      ?auto_162118 - BLOCK
      ?auto_162119 - BLOCK
    )
    :vars
    (
      ?auto_162120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162119 ?auto_162120 ) ( ON-TABLE ?auto_162111 ) ( ON ?auto_162112 ?auto_162111 ) ( ON ?auto_162113 ?auto_162112 ) ( ON ?auto_162114 ?auto_162113 ) ( ON ?auto_162115 ?auto_162114 ) ( ON ?auto_162116 ?auto_162115 ) ( ON ?auto_162117 ?auto_162116 ) ( not ( = ?auto_162111 ?auto_162112 ) ) ( not ( = ?auto_162111 ?auto_162113 ) ) ( not ( = ?auto_162111 ?auto_162114 ) ) ( not ( = ?auto_162111 ?auto_162115 ) ) ( not ( = ?auto_162111 ?auto_162116 ) ) ( not ( = ?auto_162111 ?auto_162117 ) ) ( not ( = ?auto_162111 ?auto_162118 ) ) ( not ( = ?auto_162111 ?auto_162119 ) ) ( not ( = ?auto_162111 ?auto_162120 ) ) ( not ( = ?auto_162112 ?auto_162113 ) ) ( not ( = ?auto_162112 ?auto_162114 ) ) ( not ( = ?auto_162112 ?auto_162115 ) ) ( not ( = ?auto_162112 ?auto_162116 ) ) ( not ( = ?auto_162112 ?auto_162117 ) ) ( not ( = ?auto_162112 ?auto_162118 ) ) ( not ( = ?auto_162112 ?auto_162119 ) ) ( not ( = ?auto_162112 ?auto_162120 ) ) ( not ( = ?auto_162113 ?auto_162114 ) ) ( not ( = ?auto_162113 ?auto_162115 ) ) ( not ( = ?auto_162113 ?auto_162116 ) ) ( not ( = ?auto_162113 ?auto_162117 ) ) ( not ( = ?auto_162113 ?auto_162118 ) ) ( not ( = ?auto_162113 ?auto_162119 ) ) ( not ( = ?auto_162113 ?auto_162120 ) ) ( not ( = ?auto_162114 ?auto_162115 ) ) ( not ( = ?auto_162114 ?auto_162116 ) ) ( not ( = ?auto_162114 ?auto_162117 ) ) ( not ( = ?auto_162114 ?auto_162118 ) ) ( not ( = ?auto_162114 ?auto_162119 ) ) ( not ( = ?auto_162114 ?auto_162120 ) ) ( not ( = ?auto_162115 ?auto_162116 ) ) ( not ( = ?auto_162115 ?auto_162117 ) ) ( not ( = ?auto_162115 ?auto_162118 ) ) ( not ( = ?auto_162115 ?auto_162119 ) ) ( not ( = ?auto_162115 ?auto_162120 ) ) ( not ( = ?auto_162116 ?auto_162117 ) ) ( not ( = ?auto_162116 ?auto_162118 ) ) ( not ( = ?auto_162116 ?auto_162119 ) ) ( not ( = ?auto_162116 ?auto_162120 ) ) ( not ( = ?auto_162117 ?auto_162118 ) ) ( not ( = ?auto_162117 ?auto_162119 ) ) ( not ( = ?auto_162117 ?auto_162120 ) ) ( not ( = ?auto_162118 ?auto_162119 ) ) ( not ( = ?auto_162118 ?auto_162120 ) ) ( not ( = ?auto_162119 ?auto_162120 ) ) ( CLEAR ?auto_162117 ) ( ON ?auto_162118 ?auto_162119 ) ( CLEAR ?auto_162118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162111 ?auto_162112 ?auto_162113 ?auto_162114 ?auto_162115 ?auto_162116 ?auto_162117 ?auto_162118 )
      ( MAKE-9PILE ?auto_162111 ?auto_162112 ?auto_162113 ?auto_162114 ?auto_162115 ?auto_162116 ?auto_162117 ?auto_162118 ?auto_162119 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162130 - BLOCK
      ?auto_162131 - BLOCK
      ?auto_162132 - BLOCK
      ?auto_162133 - BLOCK
      ?auto_162134 - BLOCK
      ?auto_162135 - BLOCK
      ?auto_162136 - BLOCK
      ?auto_162137 - BLOCK
      ?auto_162138 - BLOCK
    )
    :vars
    (
      ?auto_162139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162138 ?auto_162139 ) ( ON-TABLE ?auto_162130 ) ( ON ?auto_162131 ?auto_162130 ) ( ON ?auto_162132 ?auto_162131 ) ( ON ?auto_162133 ?auto_162132 ) ( ON ?auto_162134 ?auto_162133 ) ( ON ?auto_162135 ?auto_162134 ) ( ON ?auto_162136 ?auto_162135 ) ( not ( = ?auto_162130 ?auto_162131 ) ) ( not ( = ?auto_162130 ?auto_162132 ) ) ( not ( = ?auto_162130 ?auto_162133 ) ) ( not ( = ?auto_162130 ?auto_162134 ) ) ( not ( = ?auto_162130 ?auto_162135 ) ) ( not ( = ?auto_162130 ?auto_162136 ) ) ( not ( = ?auto_162130 ?auto_162137 ) ) ( not ( = ?auto_162130 ?auto_162138 ) ) ( not ( = ?auto_162130 ?auto_162139 ) ) ( not ( = ?auto_162131 ?auto_162132 ) ) ( not ( = ?auto_162131 ?auto_162133 ) ) ( not ( = ?auto_162131 ?auto_162134 ) ) ( not ( = ?auto_162131 ?auto_162135 ) ) ( not ( = ?auto_162131 ?auto_162136 ) ) ( not ( = ?auto_162131 ?auto_162137 ) ) ( not ( = ?auto_162131 ?auto_162138 ) ) ( not ( = ?auto_162131 ?auto_162139 ) ) ( not ( = ?auto_162132 ?auto_162133 ) ) ( not ( = ?auto_162132 ?auto_162134 ) ) ( not ( = ?auto_162132 ?auto_162135 ) ) ( not ( = ?auto_162132 ?auto_162136 ) ) ( not ( = ?auto_162132 ?auto_162137 ) ) ( not ( = ?auto_162132 ?auto_162138 ) ) ( not ( = ?auto_162132 ?auto_162139 ) ) ( not ( = ?auto_162133 ?auto_162134 ) ) ( not ( = ?auto_162133 ?auto_162135 ) ) ( not ( = ?auto_162133 ?auto_162136 ) ) ( not ( = ?auto_162133 ?auto_162137 ) ) ( not ( = ?auto_162133 ?auto_162138 ) ) ( not ( = ?auto_162133 ?auto_162139 ) ) ( not ( = ?auto_162134 ?auto_162135 ) ) ( not ( = ?auto_162134 ?auto_162136 ) ) ( not ( = ?auto_162134 ?auto_162137 ) ) ( not ( = ?auto_162134 ?auto_162138 ) ) ( not ( = ?auto_162134 ?auto_162139 ) ) ( not ( = ?auto_162135 ?auto_162136 ) ) ( not ( = ?auto_162135 ?auto_162137 ) ) ( not ( = ?auto_162135 ?auto_162138 ) ) ( not ( = ?auto_162135 ?auto_162139 ) ) ( not ( = ?auto_162136 ?auto_162137 ) ) ( not ( = ?auto_162136 ?auto_162138 ) ) ( not ( = ?auto_162136 ?auto_162139 ) ) ( not ( = ?auto_162137 ?auto_162138 ) ) ( not ( = ?auto_162137 ?auto_162139 ) ) ( not ( = ?auto_162138 ?auto_162139 ) ) ( CLEAR ?auto_162136 ) ( ON ?auto_162137 ?auto_162138 ) ( CLEAR ?auto_162137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162130 ?auto_162131 ?auto_162132 ?auto_162133 ?auto_162134 ?auto_162135 ?auto_162136 ?auto_162137 )
      ( MAKE-9PILE ?auto_162130 ?auto_162131 ?auto_162132 ?auto_162133 ?auto_162134 ?auto_162135 ?auto_162136 ?auto_162137 ?auto_162138 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162149 - BLOCK
      ?auto_162150 - BLOCK
      ?auto_162151 - BLOCK
      ?auto_162152 - BLOCK
      ?auto_162153 - BLOCK
      ?auto_162154 - BLOCK
      ?auto_162155 - BLOCK
      ?auto_162156 - BLOCK
      ?auto_162157 - BLOCK
    )
    :vars
    (
      ?auto_162158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162157 ?auto_162158 ) ( ON-TABLE ?auto_162149 ) ( ON ?auto_162150 ?auto_162149 ) ( ON ?auto_162151 ?auto_162150 ) ( ON ?auto_162152 ?auto_162151 ) ( ON ?auto_162153 ?auto_162152 ) ( ON ?auto_162154 ?auto_162153 ) ( not ( = ?auto_162149 ?auto_162150 ) ) ( not ( = ?auto_162149 ?auto_162151 ) ) ( not ( = ?auto_162149 ?auto_162152 ) ) ( not ( = ?auto_162149 ?auto_162153 ) ) ( not ( = ?auto_162149 ?auto_162154 ) ) ( not ( = ?auto_162149 ?auto_162155 ) ) ( not ( = ?auto_162149 ?auto_162156 ) ) ( not ( = ?auto_162149 ?auto_162157 ) ) ( not ( = ?auto_162149 ?auto_162158 ) ) ( not ( = ?auto_162150 ?auto_162151 ) ) ( not ( = ?auto_162150 ?auto_162152 ) ) ( not ( = ?auto_162150 ?auto_162153 ) ) ( not ( = ?auto_162150 ?auto_162154 ) ) ( not ( = ?auto_162150 ?auto_162155 ) ) ( not ( = ?auto_162150 ?auto_162156 ) ) ( not ( = ?auto_162150 ?auto_162157 ) ) ( not ( = ?auto_162150 ?auto_162158 ) ) ( not ( = ?auto_162151 ?auto_162152 ) ) ( not ( = ?auto_162151 ?auto_162153 ) ) ( not ( = ?auto_162151 ?auto_162154 ) ) ( not ( = ?auto_162151 ?auto_162155 ) ) ( not ( = ?auto_162151 ?auto_162156 ) ) ( not ( = ?auto_162151 ?auto_162157 ) ) ( not ( = ?auto_162151 ?auto_162158 ) ) ( not ( = ?auto_162152 ?auto_162153 ) ) ( not ( = ?auto_162152 ?auto_162154 ) ) ( not ( = ?auto_162152 ?auto_162155 ) ) ( not ( = ?auto_162152 ?auto_162156 ) ) ( not ( = ?auto_162152 ?auto_162157 ) ) ( not ( = ?auto_162152 ?auto_162158 ) ) ( not ( = ?auto_162153 ?auto_162154 ) ) ( not ( = ?auto_162153 ?auto_162155 ) ) ( not ( = ?auto_162153 ?auto_162156 ) ) ( not ( = ?auto_162153 ?auto_162157 ) ) ( not ( = ?auto_162153 ?auto_162158 ) ) ( not ( = ?auto_162154 ?auto_162155 ) ) ( not ( = ?auto_162154 ?auto_162156 ) ) ( not ( = ?auto_162154 ?auto_162157 ) ) ( not ( = ?auto_162154 ?auto_162158 ) ) ( not ( = ?auto_162155 ?auto_162156 ) ) ( not ( = ?auto_162155 ?auto_162157 ) ) ( not ( = ?auto_162155 ?auto_162158 ) ) ( not ( = ?auto_162156 ?auto_162157 ) ) ( not ( = ?auto_162156 ?auto_162158 ) ) ( not ( = ?auto_162157 ?auto_162158 ) ) ( ON ?auto_162156 ?auto_162157 ) ( CLEAR ?auto_162154 ) ( ON ?auto_162155 ?auto_162156 ) ( CLEAR ?auto_162155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162149 ?auto_162150 ?auto_162151 ?auto_162152 ?auto_162153 ?auto_162154 ?auto_162155 )
      ( MAKE-9PILE ?auto_162149 ?auto_162150 ?auto_162151 ?auto_162152 ?auto_162153 ?auto_162154 ?auto_162155 ?auto_162156 ?auto_162157 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162168 - BLOCK
      ?auto_162169 - BLOCK
      ?auto_162170 - BLOCK
      ?auto_162171 - BLOCK
      ?auto_162172 - BLOCK
      ?auto_162173 - BLOCK
      ?auto_162174 - BLOCK
      ?auto_162175 - BLOCK
      ?auto_162176 - BLOCK
    )
    :vars
    (
      ?auto_162177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162176 ?auto_162177 ) ( ON-TABLE ?auto_162168 ) ( ON ?auto_162169 ?auto_162168 ) ( ON ?auto_162170 ?auto_162169 ) ( ON ?auto_162171 ?auto_162170 ) ( ON ?auto_162172 ?auto_162171 ) ( ON ?auto_162173 ?auto_162172 ) ( not ( = ?auto_162168 ?auto_162169 ) ) ( not ( = ?auto_162168 ?auto_162170 ) ) ( not ( = ?auto_162168 ?auto_162171 ) ) ( not ( = ?auto_162168 ?auto_162172 ) ) ( not ( = ?auto_162168 ?auto_162173 ) ) ( not ( = ?auto_162168 ?auto_162174 ) ) ( not ( = ?auto_162168 ?auto_162175 ) ) ( not ( = ?auto_162168 ?auto_162176 ) ) ( not ( = ?auto_162168 ?auto_162177 ) ) ( not ( = ?auto_162169 ?auto_162170 ) ) ( not ( = ?auto_162169 ?auto_162171 ) ) ( not ( = ?auto_162169 ?auto_162172 ) ) ( not ( = ?auto_162169 ?auto_162173 ) ) ( not ( = ?auto_162169 ?auto_162174 ) ) ( not ( = ?auto_162169 ?auto_162175 ) ) ( not ( = ?auto_162169 ?auto_162176 ) ) ( not ( = ?auto_162169 ?auto_162177 ) ) ( not ( = ?auto_162170 ?auto_162171 ) ) ( not ( = ?auto_162170 ?auto_162172 ) ) ( not ( = ?auto_162170 ?auto_162173 ) ) ( not ( = ?auto_162170 ?auto_162174 ) ) ( not ( = ?auto_162170 ?auto_162175 ) ) ( not ( = ?auto_162170 ?auto_162176 ) ) ( not ( = ?auto_162170 ?auto_162177 ) ) ( not ( = ?auto_162171 ?auto_162172 ) ) ( not ( = ?auto_162171 ?auto_162173 ) ) ( not ( = ?auto_162171 ?auto_162174 ) ) ( not ( = ?auto_162171 ?auto_162175 ) ) ( not ( = ?auto_162171 ?auto_162176 ) ) ( not ( = ?auto_162171 ?auto_162177 ) ) ( not ( = ?auto_162172 ?auto_162173 ) ) ( not ( = ?auto_162172 ?auto_162174 ) ) ( not ( = ?auto_162172 ?auto_162175 ) ) ( not ( = ?auto_162172 ?auto_162176 ) ) ( not ( = ?auto_162172 ?auto_162177 ) ) ( not ( = ?auto_162173 ?auto_162174 ) ) ( not ( = ?auto_162173 ?auto_162175 ) ) ( not ( = ?auto_162173 ?auto_162176 ) ) ( not ( = ?auto_162173 ?auto_162177 ) ) ( not ( = ?auto_162174 ?auto_162175 ) ) ( not ( = ?auto_162174 ?auto_162176 ) ) ( not ( = ?auto_162174 ?auto_162177 ) ) ( not ( = ?auto_162175 ?auto_162176 ) ) ( not ( = ?auto_162175 ?auto_162177 ) ) ( not ( = ?auto_162176 ?auto_162177 ) ) ( ON ?auto_162175 ?auto_162176 ) ( CLEAR ?auto_162173 ) ( ON ?auto_162174 ?auto_162175 ) ( CLEAR ?auto_162174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162168 ?auto_162169 ?auto_162170 ?auto_162171 ?auto_162172 ?auto_162173 ?auto_162174 )
      ( MAKE-9PILE ?auto_162168 ?auto_162169 ?auto_162170 ?auto_162171 ?auto_162172 ?auto_162173 ?auto_162174 ?auto_162175 ?auto_162176 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162187 - BLOCK
      ?auto_162188 - BLOCK
      ?auto_162189 - BLOCK
      ?auto_162190 - BLOCK
      ?auto_162191 - BLOCK
      ?auto_162192 - BLOCK
      ?auto_162193 - BLOCK
      ?auto_162194 - BLOCK
      ?auto_162195 - BLOCK
    )
    :vars
    (
      ?auto_162196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162195 ?auto_162196 ) ( ON-TABLE ?auto_162187 ) ( ON ?auto_162188 ?auto_162187 ) ( ON ?auto_162189 ?auto_162188 ) ( ON ?auto_162190 ?auto_162189 ) ( ON ?auto_162191 ?auto_162190 ) ( not ( = ?auto_162187 ?auto_162188 ) ) ( not ( = ?auto_162187 ?auto_162189 ) ) ( not ( = ?auto_162187 ?auto_162190 ) ) ( not ( = ?auto_162187 ?auto_162191 ) ) ( not ( = ?auto_162187 ?auto_162192 ) ) ( not ( = ?auto_162187 ?auto_162193 ) ) ( not ( = ?auto_162187 ?auto_162194 ) ) ( not ( = ?auto_162187 ?auto_162195 ) ) ( not ( = ?auto_162187 ?auto_162196 ) ) ( not ( = ?auto_162188 ?auto_162189 ) ) ( not ( = ?auto_162188 ?auto_162190 ) ) ( not ( = ?auto_162188 ?auto_162191 ) ) ( not ( = ?auto_162188 ?auto_162192 ) ) ( not ( = ?auto_162188 ?auto_162193 ) ) ( not ( = ?auto_162188 ?auto_162194 ) ) ( not ( = ?auto_162188 ?auto_162195 ) ) ( not ( = ?auto_162188 ?auto_162196 ) ) ( not ( = ?auto_162189 ?auto_162190 ) ) ( not ( = ?auto_162189 ?auto_162191 ) ) ( not ( = ?auto_162189 ?auto_162192 ) ) ( not ( = ?auto_162189 ?auto_162193 ) ) ( not ( = ?auto_162189 ?auto_162194 ) ) ( not ( = ?auto_162189 ?auto_162195 ) ) ( not ( = ?auto_162189 ?auto_162196 ) ) ( not ( = ?auto_162190 ?auto_162191 ) ) ( not ( = ?auto_162190 ?auto_162192 ) ) ( not ( = ?auto_162190 ?auto_162193 ) ) ( not ( = ?auto_162190 ?auto_162194 ) ) ( not ( = ?auto_162190 ?auto_162195 ) ) ( not ( = ?auto_162190 ?auto_162196 ) ) ( not ( = ?auto_162191 ?auto_162192 ) ) ( not ( = ?auto_162191 ?auto_162193 ) ) ( not ( = ?auto_162191 ?auto_162194 ) ) ( not ( = ?auto_162191 ?auto_162195 ) ) ( not ( = ?auto_162191 ?auto_162196 ) ) ( not ( = ?auto_162192 ?auto_162193 ) ) ( not ( = ?auto_162192 ?auto_162194 ) ) ( not ( = ?auto_162192 ?auto_162195 ) ) ( not ( = ?auto_162192 ?auto_162196 ) ) ( not ( = ?auto_162193 ?auto_162194 ) ) ( not ( = ?auto_162193 ?auto_162195 ) ) ( not ( = ?auto_162193 ?auto_162196 ) ) ( not ( = ?auto_162194 ?auto_162195 ) ) ( not ( = ?auto_162194 ?auto_162196 ) ) ( not ( = ?auto_162195 ?auto_162196 ) ) ( ON ?auto_162194 ?auto_162195 ) ( ON ?auto_162193 ?auto_162194 ) ( CLEAR ?auto_162191 ) ( ON ?auto_162192 ?auto_162193 ) ( CLEAR ?auto_162192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162187 ?auto_162188 ?auto_162189 ?auto_162190 ?auto_162191 ?auto_162192 )
      ( MAKE-9PILE ?auto_162187 ?auto_162188 ?auto_162189 ?auto_162190 ?auto_162191 ?auto_162192 ?auto_162193 ?auto_162194 ?auto_162195 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162206 - BLOCK
      ?auto_162207 - BLOCK
      ?auto_162208 - BLOCK
      ?auto_162209 - BLOCK
      ?auto_162210 - BLOCK
      ?auto_162211 - BLOCK
      ?auto_162212 - BLOCK
      ?auto_162213 - BLOCK
      ?auto_162214 - BLOCK
    )
    :vars
    (
      ?auto_162215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162214 ?auto_162215 ) ( ON-TABLE ?auto_162206 ) ( ON ?auto_162207 ?auto_162206 ) ( ON ?auto_162208 ?auto_162207 ) ( ON ?auto_162209 ?auto_162208 ) ( ON ?auto_162210 ?auto_162209 ) ( not ( = ?auto_162206 ?auto_162207 ) ) ( not ( = ?auto_162206 ?auto_162208 ) ) ( not ( = ?auto_162206 ?auto_162209 ) ) ( not ( = ?auto_162206 ?auto_162210 ) ) ( not ( = ?auto_162206 ?auto_162211 ) ) ( not ( = ?auto_162206 ?auto_162212 ) ) ( not ( = ?auto_162206 ?auto_162213 ) ) ( not ( = ?auto_162206 ?auto_162214 ) ) ( not ( = ?auto_162206 ?auto_162215 ) ) ( not ( = ?auto_162207 ?auto_162208 ) ) ( not ( = ?auto_162207 ?auto_162209 ) ) ( not ( = ?auto_162207 ?auto_162210 ) ) ( not ( = ?auto_162207 ?auto_162211 ) ) ( not ( = ?auto_162207 ?auto_162212 ) ) ( not ( = ?auto_162207 ?auto_162213 ) ) ( not ( = ?auto_162207 ?auto_162214 ) ) ( not ( = ?auto_162207 ?auto_162215 ) ) ( not ( = ?auto_162208 ?auto_162209 ) ) ( not ( = ?auto_162208 ?auto_162210 ) ) ( not ( = ?auto_162208 ?auto_162211 ) ) ( not ( = ?auto_162208 ?auto_162212 ) ) ( not ( = ?auto_162208 ?auto_162213 ) ) ( not ( = ?auto_162208 ?auto_162214 ) ) ( not ( = ?auto_162208 ?auto_162215 ) ) ( not ( = ?auto_162209 ?auto_162210 ) ) ( not ( = ?auto_162209 ?auto_162211 ) ) ( not ( = ?auto_162209 ?auto_162212 ) ) ( not ( = ?auto_162209 ?auto_162213 ) ) ( not ( = ?auto_162209 ?auto_162214 ) ) ( not ( = ?auto_162209 ?auto_162215 ) ) ( not ( = ?auto_162210 ?auto_162211 ) ) ( not ( = ?auto_162210 ?auto_162212 ) ) ( not ( = ?auto_162210 ?auto_162213 ) ) ( not ( = ?auto_162210 ?auto_162214 ) ) ( not ( = ?auto_162210 ?auto_162215 ) ) ( not ( = ?auto_162211 ?auto_162212 ) ) ( not ( = ?auto_162211 ?auto_162213 ) ) ( not ( = ?auto_162211 ?auto_162214 ) ) ( not ( = ?auto_162211 ?auto_162215 ) ) ( not ( = ?auto_162212 ?auto_162213 ) ) ( not ( = ?auto_162212 ?auto_162214 ) ) ( not ( = ?auto_162212 ?auto_162215 ) ) ( not ( = ?auto_162213 ?auto_162214 ) ) ( not ( = ?auto_162213 ?auto_162215 ) ) ( not ( = ?auto_162214 ?auto_162215 ) ) ( ON ?auto_162213 ?auto_162214 ) ( ON ?auto_162212 ?auto_162213 ) ( CLEAR ?auto_162210 ) ( ON ?auto_162211 ?auto_162212 ) ( CLEAR ?auto_162211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162206 ?auto_162207 ?auto_162208 ?auto_162209 ?auto_162210 ?auto_162211 )
      ( MAKE-9PILE ?auto_162206 ?auto_162207 ?auto_162208 ?auto_162209 ?auto_162210 ?auto_162211 ?auto_162212 ?auto_162213 ?auto_162214 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162225 - BLOCK
      ?auto_162226 - BLOCK
      ?auto_162227 - BLOCK
      ?auto_162228 - BLOCK
      ?auto_162229 - BLOCK
      ?auto_162230 - BLOCK
      ?auto_162231 - BLOCK
      ?auto_162232 - BLOCK
      ?auto_162233 - BLOCK
    )
    :vars
    (
      ?auto_162234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162233 ?auto_162234 ) ( ON-TABLE ?auto_162225 ) ( ON ?auto_162226 ?auto_162225 ) ( ON ?auto_162227 ?auto_162226 ) ( ON ?auto_162228 ?auto_162227 ) ( not ( = ?auto_162225 ?auto_162226 ) ) ( not ( = ?auto_162225 ?auto_162227 ) ) ( not ( = ?auto_162225 ?auto_162228 ) ) ( not ( = ?auto_162225 ?auto_162229 ) ) ( not ( = ?auto_162225 ?auto_162230 ) ) ( not ( = ?auto_162225 ?auto_162231 ) ) ( not ( = ?auto_162225 ?auto_162232 ) ) ( not ( = ?auto_162225 ?auto_162233 ) ) ( not ( = ?auto_162225 ?auto_162234 ) ) ( not ( = ?auto_162226 ?auto_162227 ) ) ( not ( = ?auto_162226 ?auto_162228 ) ) ( not ( = ?auto_162226 ?auto_162229 ) ) ( not ( = ?auto_162226 ?auto_162230 ) ) ( not ( = ?auto_162226 ?auto_162231 ) ) ( not ( = ?auto_162226 ?auto_162232 ) ) ( not ( = ?auto_162226 ?auto_162233 ) ) ( not ( = ?auto_162226 ?auto_162234 ) ) ( not ( = ?auto_162227 ?auto_162228 ) ) ( not ( = ?auto_162227 ?auto_162229 ) ) ( not ( = ?auto_162227 ?auto_162230 ) ) ( not ( = ?auto_162227 ?auto_162231 ) ) ( not ( = ?auto_162227 ?auto_162232 ) ) ( not ( = ?auto_162227 ?auto_162233 ) ) ( not ( = ?auto_162227 ?auto_162234 ) ) ( not ( = ?auto_162228 ?auto_162229 ) ) ( not ( = ?auto_162228 ?auto_162230 ) ) ( not ( = ?auto_162228 ?auto_162231 ) ) ( not ( = ?auto_162228 ?auto_162232 ) ) ( not ( = ?auto_162228 ?auto_162233 ) ) ( not ( = ?auto_162228 ?auto_162234 ) ) ( not ( = ?auto_162229 ?auto_162230 ) ) ( not ( = ?auto_162229 ?auto_162231 ) ) ( not ( = ?auto_162229 ?auto_162232 ) ) ( not ( = ?auto_162229 ?auto_162233 ) ) ( not ( = ?auto_162229 ?auto_162234 ) ) ( not ( = ?auto_162230 ?auto_162231 ) ) ( not ( = ?auto_162230 ?auto_162232 ) ) ( not ( = ?auto_162230 ?auto_162233 ) ) ( not ( = ?auto_162230 ?auto_162234 ) ) ( not ( = ?auto_162231 ?auto_162232 ) ) ( not ( = ?auto_162231 ?auto_162233 ) ) ( not ( = ?auto_162231 ?auto_162234 ) ) ( not ( = ?auto_162232 ?auto_162233 ) ) ( not ( = ?auto_162232 ?auto_162234 ) ) ( not ( = ?auto_162233 ?auto_162234 ) ) ( ON ?auto_162232 ?auto_162233 ) ( ON ?auto_162231 ?auto_162232 ) ( ON ?auto_162230 ?auto_162231 ) ( CLEAR ?auto_162228 ) ( ON ?auto_162229 ?auto_162230 ) ( CLEAR ?auto_162229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162225 ?auto_162226 ?auto_162227 ?auto_162228 ?auto_162229 )
      ( MAKE-9PILE ?auto_162225 ?auto_162226 ?auto_162227 ?auto_162228 ?auto_162229 ?auto_162230 ?auto_162231 ?auto_162232 ?auto_162233 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162244 - BLOCK
      ?auto_162245 - BLOCK
      ?auto_162246 - BLOCK
      ?auto_162247 - BLOCK
      ?auto_162248 - BLOCK
      ?auto_162249 - BLOCK
      ?auto_162250 - BLOCK
      ?auto_162251 - BLOCK
      ?auto_162252 - BLOCK
    )
    :vars
    (
      ?auto_162253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162252 ?auto_162253 ) ( ON-TABLE ?auto_162244 ) ( ON ?auto_162245 ?auto_162244 ) ( ON ?auto_162246 ?auto_162245 ) ( ON ?auto_162247 ?auto_162246 ) ( not ( = ?auto_162244 ?auto_162245 ) ) ( not ( = ?auto_162244 ?auto_162246 ) ) ( not ( = ?auto_162244 ?auto_162247 ) ) ( not ( = ?auto_162244 ?auto_162248 ) ) ( not ( = ?auto_162244 ?auto_162249 ) ) ( not ( = ?auto_162244 ?auto_162250 ) ) ( not ( = ?auto_162244 ?auto_162251 ) ) ( not ( = ?auto_162244 ?auto_162252 ) ) ( not ( = ?auto_162244 ?auto_162253 ) ) ( not ( = ?auto_162245 ?auto_162246 ) ) ( not ( = ?auto_162245 ?auto_162247 ) ) ( not ( = ?auto_162245 ?auto_162248 ) ) ( not ( = ?auto_162245 ?auto_162249 ) ) ( not ( = ?auto_162245 ?auto_162250 ) ) ( not ( = ?auto_162245 ?auto_162251 ) ) ( not ( = ?auto_162245 ?auto_162252 ) ) ( not ( = ?auto_162245 ?auto_162253 ) ) ( not ( = ?auto_162246 ?auto_162247 ) ) ( not ( = ?auto_162246 ?auto_162248 ) ) ( not ( = ?auto_162246 ?auto_162249 ) ) ( not ( = ?auto_162246 ?auto_162250 ) ) ( not ( = ?auto_162246 ?auto_162251 ) ) ( not ( = ?auto_162246 ?auto_162252 ) ) ( not ( = ?auto_162246 ?auto_162253 ) ) ( not ( = ?auto_162247 ?auto_162248 ) ) ( not ( = ?auto_162247 ?auto_162249 ) ) ( not ( = ?auto_162247 ?auto_162250 ) ) ( not ( = ?auto_162247 ?auto_162251 ) ) ( not ( = ?auto_162247 ?auto_162252 ) ) ( not ( = ?auto_162247 ?auto_162253 ) ) ( not ( = ?auto_162248 ?auto_162249 ) ) ( not ( = ?auto_162248 ?auto_162250 ) ) ( not ( = ?auto_162248 ?auto_162251 ) ) ( not ( = ?auto_162248 ?auto_162252 ) ) ( not ( = ?auto_162248 ?auto_162253 ) ) ( not ( = ?auto_162249 ?auto_162250 ) ) ( not ( = ?auto_162249 ?auto_162251 ) ) ( not ( = ?auto_162249 ?auto_162252 ) ) ( not ( = ?auto_162249 ?auto_162253 ) ) ( not ( = ?auto_162250 ?auto_162251 ) ) ( not ( = ?auto_162250 ?auto_162252 ) ) ( not ( = ?auto_162250 ?auto_162253 ) ) ( not ( = ?auto_162251 ?auto_162252 ) ) ( not ( = ?auto_162251 ?auto_162253 ) ) ( not ( = ?auto_162252 ?auto_162253 ) ) ( ON ?auto_162251 ?auto_162252 ) ( ON ?auto_162250 ?auto_162251 ) ( ON ?auto_162249 ?auto_162250 ) ( CLEAR ?auto_162247 ) ( ON ?auto_162248 ?auto_162249 ) ( CLEAR ?auto_162248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162244 ?auto_162245 ?auto_162246 ?auto_162247 ?auto_162248 )
      ( MAKE-9PILE ?auto_162244 ?auto_162245 ?auto_162246 ?auto_162247 ?auto_162248 ?auto_162249 ?auto_162250 ?auto_162251 ?auto_162252 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162263 - BLOCK
      ?auto_162264 - BLOCK
      ?auto_162265 - BLOCK
      ?auto_162266 - BLOCK
      ?auto_162267 - BLOCK
      ?auto_162268 - BLOCK
      ?auto_162269 - BLOCK
      ?auto_162270 - BLOCK
      ?auto_162271 - BLOCK
    )
    :vars
    (
      ?auto_162272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162271 ?auto_162272 ) ( ON-TABLE ?auto_162263 ) ( ON ?auto_162264 ?auto_162263 ) ( ON ?auto_162265 ?auto_162264 ) ( not ( = ?auto_162263 ?auto_162264 ) ) ( not ( = ?auto_162263 ?auto_162265 ) ) ( not ( = ?auto_162263 ?auto_162266 ) ) ( not ( = ?auto_162263 ?auto_162267 ) ) ( not ( = ?auto_162263 ?auto_162268 ) ) ( not ( = ?auto_162263 ?auto_162269 ) ) ( not ( = ?auto_162263 ?auto_162270 ) ) ( not ( = ?auto_162263 ?auto_162271 ) ) ( not ( = ?auto_162263 ?auto_162272 ) ) ( not ( = ?auto_162264 ?auto_162265 ) ) ( not ( = ?auto_162264 ?auto_162266 ) ) ( not ( = ?auto_162264 ?auto_162267 ) ) ( not ( = ?auto_162264 ?auto_162268 ) ) ( not ( = ?auto_162264 ?auto_162269 ) ) ( not ( = ?auto_162264 ?auto_162270 ) ) ( not ( = ?auto_162264 ?auto_162271 ) ) ( not ( = ?auto_162264 ?auto_162272 ) ) ( not ( = ?auto_162265 ?auto_162266 ) ) ( not ( = ?auto_162265 ?auto_162267 ) ) ( not ( = ?auto_162265 ?auto_162268 ) ) ( not ( = ?auto_162265 ?auto_162269 ) ) ( not ( = ?auto_162265 ?auto_162270 ) ) ( not ( = ?auto_162265 ?auto_162271 ) ) ( not ( = ?auto_162265 ?auto_162272 ) ) ( not ( = ?auto_162266 ?auto_162267 ) ) ( not ( = ?auto_162266 ?auto_162268 ) ) ( not ( = ?auto_162266 ?auto_162269 ) ) ( not ( = ?auto_162266 ?auto_162270 ) ) ( not ( = ?auto_162266 ?auto_162271 ) ) ( not ( = ?auto_162266 ?auto_162272 ) ) ( not ( = ?auto_162267 ?auto_162268 ) ) ( not ( = ?auto_162267 ?auto_162269 ) ) ( not ( = ?auto_162267 ?auto_162270 ) ) ( not ( = ?auto_162267 ?auto_162271 ) ) ( not ( = ?auto_162267 ?auto_162272 ) ) ( not ( = ?auto_162268 ?auto_162269 ) ) ( not ( = ?auto_162268 ?auto_162270 ) ) ( not ( = ?auto_162268 ?auto_162271 ) ) ( not ( = ?auto_162268 ?auto_162272 ) ) ( not ( = ?auto_162269 ?auto_162270 ) ) ( not ( = ?auto_162269 ?auto_162271 ) ) ( not ( = ?auto_162269 ?auto_162272 ) ) ( not ( = ?auto_162270 ?auto_162271 ) ) ( not ( = ?auto_162270 ?auto_162272 ) ) ( not ( = ?auto_162271 ?auto_162272 ) ) ( ON ?auto_162270 ?auto_162271 ) ( ON ?auto_162269 ?auto_162270 ) ( ON ?auto_162268 ?auto_162269 ) ( ON ?auto_162267 ?auto_162268 ) ( CLEAR ?auto_162265 ) ( ON ?auto_162266 ?auto_162267 ) ( CLEAR ?auto_162266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162263 ?auto_162264 ?auto_162265 ?auto_162266 )
      ( MAKE-9PILE ?auto_162263 ?auto_162264 ?auto_162265 ?auto_162266 ?auto_162267 ?auto_162268 ?auto_162269 ?auto_162270 ?auto_162271 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162282 - BLOCK
      ?auto_162283 - BLOCK
      ?auto_162284 - BLOCK
      ?auto_162285 - BLOCK
      ?auto_162286 - BLOCK
      ?auto_162287 - BLOCK
      ?auto_162288 - BLOCK
      ?auto_162289 - BLOCK
      ?auto_162290 - BLOCK
    )
    :vars
    (
      ?auto_162291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162290 ?auto_162291 ) ( ON-TABLE ?auto_162282 ) ( ON ?auto_162283 ?auto_162282 ) ( ON ?auto_162284 ?auto_162283 ) ( not ( = ?auto_162282 ?auto_162283 ) ) ( not ( = ?auto_162282 ?auto_162284 ) ) ( not ( = ?auto_162282 ?auto_162285 ) ) ( not ( = ?auto_162282 ?auto_162286 ) ) ( not ( = ?auto_162282 ?auto_162287 ) ) ( not ( = ?auto_162282 ?auto_162288 ) ) ( not ( = ?auto_162282 ?auto_162289 ) ) ( not ( = ?auto_162282 ?auto_162290 ) ) ( not ( = ?auto_162282 ?auto_162291 ) ) ( not ( = ?auto_162283 ?auto_162284 ) ) ( not ( = ?auto_162283 ?auto_162285 ) ) ( not ( = ?auto_162283 ?auto_162286 ) ) ( not ( = ?auto_162283 ?auto_162287 ) ) ( not ( = ?auto_162283 ?auto_162288 ) ) ( not ( = ?auto_162283 ?auto_162289 ) ) ( not ( = ?auto_162283 ?auto_162290 ) ) ( not ( = ?auto_162283 ?auto_162291 ) ) ( not ( = ?auto_162284 ?auto_162285 ) ) ( not ( = ?auto_162284 ?auto_162286 ) ) ( not ( = ?auto_162284 ?auto_162287 ) ) ( not ( = ?auto_162284 ?auto_162288 ) ) ( not ( = ?auto_162284 ?auto_162289 ) ) ( not ( = ?auto_162284 ?auto_162290 ) ) ( not ( = ?auto_162284 ?auto_162291 ) ) ( not ( = ?auto_162285 ?auto_162286 ) ) ( not ( = ?auto_162285 ?auto_162287 ) ) ( not ( = ?auto_162285 ?auto_162288 ) ) ( not ( = ?auto_162285 ?auto_162289 ) ) ( not ( = ?auto_162285 ?auto_162290 ) ) ( not ( = ?auto_162285 ?auto_162291 ) ) ( not ( = ?auto_162286 ?auto_162287 ) ) ( not ( = ?auto_162286 ?auto_162288 ) ) ( not ( = ?auto_162286 ?auto_162289 ) ) ( not ( = ?auto_162286 ?auto_162290 ) ) ( not ( = ?auto_162286 ?auto_162291 ) ) ( not ( = ?auto_162287 ?auto_162288 ) ) ( not ( = ?auto_162287 ?auto_162289 ) ) ( not ( = ?auto_162287 ?auto_162290 ) ) ( not ( = ?auto_162287 ?auto_162291 ) ) ( not ( = ?auto_162288 ?auto_162289 ) ) ( not ( = ?auto_162288 ?auto_162290 ) ) ( not ( = ?auto_162288 ?auto_162291 ) ) ( not ( = ?auto_162289 ?auto_162290 ) ) ( not ( = ?auto_162289 ?auto_162291 ) ) ( not ( = ?auto_162290 ?auto_162291 ) ) ( ON ?auto_162289 ?auto_162290 ) ( ON ?auto_162288 ?auto_162289 ) ( ON ?auto_162287 ?auto_162288 ) ( ON ?auto_162286 ?auto_162287 ) ( CLEAR ?auto_162284 ) ( ON ?auto_162285 ?auto_162286 ) ( CLEAR ?auto_162285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162282 ?auto_162283 ?auto_162284 ?auto_162285 )
      ( MAKE-9PILE ?auto_162282 ?auto_162283 ?auto_162284 ?auto_162285 ?auto_162286 ?auto_162287 ?auto_162288 ?auto_162289 ?auto_162290 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162301 - BLOCK
      ?auto_162302 - BLOCK
      ?auto_162303 - BLOCK
      ?auto_162304 - BLOCK
      ?auto_162305 - BLOCK
      ?auto_162306 - BLOCK
      ?auto_162307 - BLOCK
      ?auto_162308 - BLOCK
      ?auto_162309 - BLOCK
    )
    :vars
    (
      ?auto_162310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162309 ?auto_162310 ) ( ON-TABLE ?auto_162301 ) ( ON ?auto_162302 ?auto_162301 ) ( not ( = ?auto_162301 ?auto_162302 ) ) ( not ( = ?auto_162301 ?auto_162303 ) ) ( not ( = ?auto_162301 ?auto_162304 ) ) ( not ( = ?auto_162301 ?auto_162305 ) ) ( not ( = ?auto_162301 ?auto_162306 ) ) ( not ( = ?auto_162301 ?auto_162307 ) ) ( not ( = ?auto_162301 ?auto_162308 ) ) ( not ( = ?auto_162301 ?auto_162309 ) ) ( not ( = ?auto_162301 ?auto_162310 ) ) ( not ( = ?auto_162302 ?auto_162303 ) ) ( not ( = ?auto_162302 ?auto_162304 ) ) ( not ( = ?auto_162302 ?auto_162305 ) ) ( not ( = ?auto_162302 ?auto_162306 ) ) ( not ( = ?auto_162302 ?auto_162307 ) ) ( not ( = ?auto_162302 ?auto_162308 ) ) ( not ( = ?auto_162302 ?auto_162309 ) ) ( not ( = ?auto_162302 ?auto_162310 ) ) ( not ( = ?auto_162303 ?auto_162304 ) ) ( not ( = ?auto_162303 ?auto_162305 ) ) ( not ( = ?auto_162303 ?auto_162306 ) ) ( not ( = ?auto_162303 ?auto_162307 ) ) ( not ( = ?auto_162303 ?auto_162308 ) ) ( not ( = ?auto_162303 ?auto_162309 ) ) ( not ( = ?auto_162303 ?auto_162310 ) ) ( not ( = ?auto_162304 ?auto_162305 ) ) ( not ( = ?auto_162304 ?auto_162306 ) ) ( not ( = ?auto_162304 ?auto_162307 ) ) ( not ( = ?auto_162304 ?auto_162308 ) ) ( not ( = ?auto_162304 ?auto_162309 ) ) ( not ( = ?auto_162304 ?auto_162310 ) ) ( not ( = ?auto_162305 ?auto_162306 ) ) ( not ( = ?auto_162305 ?auto_162307 ) ) ( not ( = ?auto_162305 ?auto_162308 ) ) ( not ( = ?auto_162305 ?auto_162309 ) ) ( not ( = ?auto_162305 ?auto_162310 ) ) ( not ( = ?auto_162306 ?auto_162307 ) ) ( not ( = ?auto_162306 ?auto_162308 ) ) ( not ( = ?auto_162306 ?auto_162309 ) ) ( not ( = ?auto_162306 ?auto_162310 ) ) ( not ( = ?auto_162307 ?auto_162308 ) ) ( not ( = ?auto_162307 ?auto_162309 ) ) ( not ( = ?auto_162307 ?auto_162310 ) ) ( not ( = ?auto_162308 ?auto_162309 ) ) ( not ( = ?auto_162308 ?auto_162310 ) ) ( not ( = ?auto_162309 ?auto_162310 ) ) ( ON ?auto_162308 ?auto_162309 ) ( ON ?auto_162307 ?auto_162308 ) ( ON ?auto_162306 ?auto_162307 ) ( ON ?auto_162305 ?auto_162306 ) ( ON ?auto_162304 ?auto_162305 ) ( CLEAR ?auto_162302 ) ( ON ?auto_162303 ?auto_162304 ) ( CLEAR ?auto_162303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162301 ?auto_162302 ?auto_162303 )
      ( MAKE-9PILE ?auto_162301 ?auto_162302 ?auto_162303 ?auto_162304 ?auto_162305 ?auto_162306 ?auto_162307 ?auto_162308 ?auto_162309 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162320 - BLOCK
      ?auto_162321 - BLOCK
      ?auto_162322 - BLOCK
      ?auto_162323 - BLOCK
      ?auto_162324 - BLOCK
      ?auto_162325 - BLOCK
      ?auto_162326 - BLOCK
      ?auto_162327 - BLOCK
      ?auto_162328 - BLOCK
    )
    :vars
    (
      ?auto_162329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162328 ?auto_162329 ) ( ON-TABLE ?auto_162320 ) ( ON ?auto_162321 ?auto_162320 ) ( not ( = ?auto_162320 ?auto_162321 ) ) ( not ( = ?auto_162320 ?auto_162322 ) ) ( not ( = ?auto_162320 ?auto_162323 ) ) ( not ( = ?auto_162320 ?auto_162324 ) ) ( not ( = ?auto_162320 ?auto_162325 ) ) ( not ( = ?auto_162320 ?auto_162326 ) ) ( not ( = ?auto_162320 ?auto_162327 ) ) ( not ( = ?auto_162320 ?auto_162328 ) ) ( not ( = ?auto_162320 ?auto_162329 ) ) ( not ( = ?auto_162321 ?auto_162322 ) ) ( not ( = ?auto_162321 ?auto_162323 ) ) ( not ( = ?auto_162321 ?auto_162324 ) ) ( not ( = ?auto_162321 ?auto_162325 ) ) ( not ( = ?auto_162321 ?auto_162326 ) ) ( not ( = ?auto_162321 ?auto_162327 ) ) ( not ( = ?auto_162321 ?auto_162328 ) ) ( not ( = ?auto_162321 ?auto_162329 ) ) ( not ( = ?auto_162322 ?auto_162323 ) ) ( not ( = ?auto_162322 ?auto_162324 ) ) ( not ( = ?auto_162322 ?auto_162325 ) ) ( not ( = ?auto_162322 ?auto_162326 ) ) ( not ( = ?auto_162322 ?auto_162327 ) ) ( not ( = ?auto_162322 ?auto_162328 ) ) ( not ( = ?auto_162322 ?auto_162329 ) ) ( not ( = ?auto_162323 ?auto_162324 ) ) ( not ( = ?auto_162323 ?auto_162325 ) ) ( not ( = ?auto_162323 ?auto_162326 ) ) ( not ( = ?auto_162323 ?auto_162327 ) ) ( not ( = ?auto_162323 ?auto_162328 ) ) ( not ( = ?auto_162323 ?auto_162329 ) ) ( not ( = ?auto_162324 ?auto_162325 ) ) ( not ( = ?auto_162324 ?auto_162326 ) ) ( not ( = ?auto_162324 ?auto_162327 ) ) ( not ( = ?auto_162324 ?auto_162328 ) ) ( not ( = ?auto_162324 ?auto_162329 ) ) ( not ( = ?auto_162325 ?auto_162326 ) ) ( not ( = ?auto_162325 ?auto_162327 ) ) ( not ( = ?auto_162325 ?auto_162328 ) ) ( not ( = ?auto_162325 ?auto_162329 ) ) ( not ( = ?auto_162326 ?auto_162327 ) ) ( not ( = ?auto_162326 ?auto_162328 ) ) ( not ( = ?auto_162326 ?auto_162329 ) ) ( not ( = ?auto_162327 ?auto_162328 ) ) ( not ( = ?auto_162327 ?auto_162329 ) ) ( not ( = ?auto_162328 ?auto_162329 ) ) ( ON ?auto_162327 ?auto_162328 ) ( ON ?auto_162326 ?auto_162327 ) ( ON ?auto_162325 ?auto_162326 ) ( ON ?auto_162324 ?auto_162325 ) ( ON ?auto_162323 ?auto_162324 ) ( CLEAR ?auto_162321 ) ( ON ?auto_162322 ?auto_162323 ) ( CLEAR ?auto_162322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162320 ?auto_162321 ?auto_162322 )
      ( MAKE-9PILE ?auto_162320 ?auto_162321 ?auto_162322 ?auto_162323 ?auto_162324 ?auto_162325 ?auto_162326 ?auto_162327 ?auto_162328 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162339 - BLOCK
      ?auto_162340 - BLOCK
      ?auto_162341 - BLOCK
      ?auto_162342 - BLOCK
      ?auto_162343 - BLOCK
      ?auto_162344 - BLOCK
      ?auto_162345 - BLOCK
      ?auto_162346 - BLOCK
      ?auto_162347 - BLOCK
    )
    :vars
    (
      ?auto_162348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162347 ?auto_162348 ) ( ON-TABLE ?auto_162339 ) ( not ( = ?auto_162339 ?auto_162340 ) ) ( not ( = ?auto_162339 ?auto_162341 ) ) ( not ( = ?auto_162339 ?auto_162342 ) ) ( not ( = ?auto_162339 ?auto_162343 ) ) ( not ( = ?auto_162339 ?auto_162344 ) ) ( not ( = ?auto_162339 ?auto_162345 ) ) ( not ( = ?auto_162339 ?auto_162346 ) ) ( not ( = ?auto_162339 ?auto_162347 ) ) ( not ( = ?auto_162339 ?auto_162348 ) ) ( not ( = ?auto_162340 ?auto_162341 ) ) ( not ( = ?auto_162340 ?auto_162342 ) ) ( not ( = ?auto_162340 ?auto_162343 ) ) ( not ( = ?auto_162340 ?auto_162344 ) ) ( not ( = ?auto_162340 ?auto_162345 ) ) ( not ( = ?auto_162340 ?auto_162346 ) ) ( not ( = ?auto_162340 ?auto_162347 ) ) ( not ( = ?auto_162340 ?auto_162348 ) ) ( not ( = ?auto_162341 ?auto_162342 ) ) ( not ( = ?auto_162341 ?auto_162343 ) ) ( not ( = ?auto_162341 ?auto_162344 ) ) ( not ( = ?auto_162341 ?auto_162345 ) ) ( not ( = ?auto_162341 ?auto_162346 ) ) ( not ( = ?auto_162341 ?auto_162347 ) ) ( not ( = ?auto_162341 ?auto_162348 ) ) ( not ( = ?auto_162342 ?auto_162343 ) ) ( not ( = ?auto_162342 ?auto_162344 ) ) ( not ( = ?auto_162342 ?auto_162345 ) ) ( not ( = ?auto_162342 ?auto_162346 ) ) ( not ( = ?auto_162342 ?auto_162347 ) ) ( not ( = ?auto_162342 ?auto_162348 ) ) ( not ( = ?auto_162343 ?auto_162344 ) ) ( not ( = ?auto_162343 ?auto_162345 ) ) ( not ( = ?auto_162343 ?auto_162346 ) ) ( not ( = ?auto_162343 ?auto_162347 ) ) ( not ( = ?auto_162343 ?auto_162348 ) ) ( not ( = ?auto_162344 ?auto_162345 ) ) ( not ( = ?auto_162344 ?auto_162346 ) ) ( not ( = ?auto_162344 ?auto_162347 ) ) ( not ( = ?auto_162344 ?auto_162348 ) ) ( not ( = ?auto_162345 ?auto_162346 ) ) ( not ( = ?auto_162345 ?auto_162347 ) ) ( not ( = ?auto_162345 ?auto_162348 ) ) ( not ( = ?auto_162346 ?auto_162347 ) ) ( not ( = ?auto_162346 ?auto_162348 ) ) ( not ( = ?auto_162347 ?auto_162348 ) ) ( ON ?auto_162346 ?auto_162347 ) ( ON ?auto_162345 ?auto_162346 ) ( ON ?auto_162344 ?auto_162345 ) ( ON ?auto_162343 ?auto_162344 ) ( ON ?auto_162342 ?auto_162343 ) ( ON ?auto_162341 ?auto_162342 ) ( CLEAR ?auto_162339 ) ( ON ?auto_162340 ?auto_162341 ) ( CLEAR ?auto_162340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162339 ?auto_162340 )
      ( MAKE-9PILE ?auto_162339 ?auto_162340 ?auto_162341 ?auto_162342 ?auto_162343 ?auto_162344 ?auto_162345 ?auto_162346 ?auto_162347 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162358 - BLOCK
      ?auto_162359 - BLOCK
      ?auto_162360 - BLOCK
      ?auto_162361 - BLOCK
      ?auto_162362 - BLOCK
      ?auto_162363 - BLOCK
      ?auto_162364 - BLOCK
      ?auto_162365 - BLOCK
      ?auto_162366 - BLOCK
    )
    :vars
    (
      ?auto_162367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162366 ?auto_162367 ) ( ON-TABLE ?auto_162358 ) ( not ( = ?auto_162358 ?auto_162359 ) ) ( not ( = ?auto_162358 ?auto_162360 ) ) ( not ( = ?auto_162358 ?auto_162361 ) ) ( not ( = ?auto_162358 ?auto_162362 ) ) ( not ( = ?auto_162358 ?auto_162363 ) ) ( not ( = ?auto_162358 ?auto_162364 ) ) ( not ( = ?auto_162358 ?auto_162365 ) ) ( not ( = ?auto_162358 ?auto_162366 ) ) ( not ( = ?auto_162358 ?auto_162367 ) ) ( not ( = ?auto_162359 ?auto_162360 ) ) ( not ( = ?auto_162359 ?auto_162361 ) ) ( not ( = ?auto_162359 ?auto_162362 ) ) ( not ( = ?auto_162359 ?auto_162363 ) ) ( not ( = ?auto_162359 ?auto_162364 ) ) ( not ( = ?auto_162359 ?auto_162365 ) ) ( not ( = ?auto_162359 ?auto_162366 ) ) ( not ( = ?auto_162359 ?auto_162367 ) ) ( not ( = ?auto_162360 ?auto_162361 ) ) ( not ( = ?auto_162360 ?auto_162362 ) ) ( not ( = ?auto_162360 ?auto_162363 ) ) ( not ( = ?auto_162360 ?auto_162364 ) ) ( not ( = ?auto_162360 ?auto_162365 ) ) ( not ( = ?auto_162360 ?auto_162366 ) ) ( not ( = ?auto_162360 ?auto_162367 ) ) ( not ( = ?auto_162361 ?auto_162362 ) ) ( not ( = ?auto_162361 ?auto_162363 ) ) ( not ( = ?auto_162361 ?auto_162364 ) ) ( not ( = ?auto_162361 ?auto_162365 ) ) ( not ( = ?auto_162361 ?auto_162366 ) ) ( not ( = ?auto_162361 ?auto_162367 ) ) ( not ( = ?auto_162362 ?auto_162363 ) ) ( not ( = ?auto_162362 ?auto_162364 ) ) ( not ( = ?auto_162362 ?auto_162365 ) ) ( not ( = ?auto_162362 ?auto_162366 ) ) ( not ( = ?auto_162362 ?auto_162367 ) ) ( not ( = ?auto_162363 ?auto_162364 ) ) ( not ( = ?auto_162363 ?auto_162365 ) ) ( not ( = ?auto_162363 ?auto_162366 ) ) ( not ( = ?auto_162363 ?auto_162367 ) ) ( not ( = ?auto_162364 ?auto_162365 ) ) ( not ( = ?auto_162364 ?auto_162366 ) ) ( not ( = ?auto_162364 ?auto_162367 ) ) ( not ( = ?auto_162365 ?auto_162366 ) ) ( not ( = ?auto_162365 ?auto_162367 ) ) ( not ( = ?auto_162366 ?auto_162367 ) ) ( ON ?auto_162365 ?auto_162366 ) ( ON ?auto_162364 ?auto_162365 ) ( ON ?auto_162363 ?auto_162364 ) ( ON ?auto_162362 ?auto_162363 ) ( ON ?auto_162361 ?auto_162362 ) ( ON ?auto_162360 ?auto_162361 ) ( CLEAR ?auto_162358 ) ( ON ?auto_162359 ?auto_162360 ) ( CLEAR ?auto_162359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162358 ?auto_162359 )
      ( MAKE-9PILE ?auto_162358 ?auto_162359 ?auto_162360 ?auto_162361 ?auto_162362 ?auto_162363 ?auto_162364 ?auto_162365 ?auto_162366 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162377 - BLOCK
      ?auto_162378 - BLOCK
      ?auto_162379 - BLOCK
      ?auto_162380 - BLOCK
      ?auto_162381 - BLOCK
      ?auto_162382 - BLOCK
      ?auto_162383 - BLOCK
      ?auto_162384 - BLOCK
      ?auto_162385 - BLOCK
    )
    :vars
    (
      ?auto_162386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162385 ?auto_162386 ) ( not ( = ?auto_162377 ?auto_162378 ) ) ( not ( = ?auto_162377 ?auto_162379 ) ) ( not ( = ?auto_162377 ?auto_162380 ) ) ( not ( = ?auto_162377 ?auto_162381 ) ) ( not ( = ?auto_162377 ?auto_162382 ) ) ( not ( = ?auto_162377 ?auto_162383 ) ) ( not ( = ?auto_162377 ?auto_162384 ) ) ( not ( = ?auto_162377 ?auto_162385 ) ) ( not ( = ?auto_162377 ?auto_162386 ) ) ( not ( = ?auto_162378 ?auto_162379 ) ) ( not ( = ?auto_162378 ?auto_162380 ) ) ( not ( = ?auto_162378 ?auto_162381 ) ) ( not ( = ?auto_162378 ?auto_162382 ) ) ( not ( = ?auto_162378 ?auto_162383 ) ) ( not ( = ?auto_162378 ?auto_162384 ) ) ( not ( = ?auto_162378 ?auto_162385 ) ) ( not ( = ?auto_162378 ?auto_162386 ) ) ( not ( = ?auto_162379 ?auto_162380 ) ) ( not ( = ?auto_162379 ?auto_162381 ) ) ( not ( = ?auto_162379 ?auto_162382 ) ) ( not ( = ?auto_162379 ?auto_162383 ) ) ( not ( = ?auto_162379 ?auto_162384 ) ) ( not ( = ?auto_162379 ?auto_162385 ) ) ( not ( = ?auto_162379 ?auto_162386 ) ) ( not ( = ?auto_162380 ?auto_162381 ) ) ( not ( = ?auto_162380 ?auto_162382 ) ) ( not ( = ?auto_162380 ?auto_162383 ) ) ( not ( = ?auto_162380 ?auto_162384 ) ) ( not ( = ?auto_162380 ?auto_162385 ) ) ( not ( = ?auto_162380 ?auto_162386 ) ) ( not ( = ?auto_162381 ?auto_162382 ) ) ( not ( = ?auto_162381 ?auto_162383 ) ) ( not ( = ?auto_162381 ?auto_162384 ) ) ( not ( = ?auto_162381 ?auto_162385 ) ) ( not ( = ?auto_162381 ?auto_162386 ) ) ( not ( = ?auto_162382 ?auto_162383 ) ) ( not ( = ?auto_162382 ?auto_162384 ) ) ( not ( = ?auto_162382 ?auto_162385 ) ) ( not ( = ?auto_162382 ?auto_162386 ) ) ( not ( = ?auto_162383 ?auto_162384 ) ) ( not ( = ?auto_162383 ?auto_162385 ) ) ( not ( = ?auto_162383 ?auto_162386 ) ) ( not ( = ?auto_162384 ?auto_162385 ) ) ( not ( = ?auto_162384 ?auto_162386 ) ) ( not ( = ?auto_162385 ?auto_162386 ) ) ( ON ?auto_162384 ?auto_162385 ) ( ON ?auto_162383 ?auto_162384 ) ( ON ?auto_162382 ?auto_162383 ) ( ON ?auto_162381 ?auto_162382 ) ( ON ?auto_162380 ?auto_162381 ) ( ON ?auto_162379 ?auto_162380 ) ( ON ?auto_162378 ?auto_162379 ) ( ON ?auto_162377 ?auto_162378 ) ( CLEAR ?auto_162377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162377 )
      ( MAKE-9PILE ?auto_162377 ?auto_162378 ?auto_162379 ?auto_162380 ?auto_162381 ?auto_162382 ?auto_162383 ?auto_162384 ?auto_162385 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_162396 - BLOCK
      ?auto_162397 - BLOCK
      ?auto_162398 - BLOCK
      ?auto_162399 - BLOCK
      ?auto_162400 - BLOCK
      ?auto_162401 - BLOCK
      ?auto_162402 - BLOCK
      ?auto_162403 - BLOCK
      ?auto_162404 - BLOCK
    )
    :vars
    (
      ?auto_162405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162404 ?auto_162405 ) ( not ( = ?auto_162396 ?auto_162397 ) ) ( not ( = ?auto_162396 ?auto_162398 ) ) ( not ( = ?auto_162396 ?auto_162399 ) ) ( not ( = ?auto_162396 ?auto_162400 ) ) ( not ( = ?auto_162396 ?auto_162401 ) ) ( not ( = ?auto_162396 ?auto_162402 ) ) ( not ( = ?auto_162396 ?auto_162403 ) ) ( not ( = ?auto_162396 ?auto_162404 ) ) ( not ( = ?auto_162396 ?auto_162405 ) ) ( not ( = ?auto_162397 ?auto_162398 ) ) ( not ( = ?auto_162397 ?auto_162399 ) ) ( not ( = ?auto_162397 ?auto_162400 ) ) ( not ( = ?auto_162397 ?auto_162401 ) ) ( not ( = ?auto_162397 ?auto_162402 ) ) ( not ( = ?auto_162397 ?auto_162403 ) ) ( not ( = ?auto_162397 ?auto_162404 ) ) ( not ( = ?auto_162397 ?auto_162405 ) ) ( not ( = ?auto_162398 ?auto_162399 ) ) ( not ( = ?auto_162398 ?auto_162400 ) ) ( not ( = ?auto_162398 ?auto_162401 ) ) ( not ( = ?auto_162398 ?auto_162402 ) ) ( not ( = ?auto_162398 ?auto_162403 ) ) ( not ( = ?auto_162398 ?auto_162404 ) ) ( not ( = ?auto_162398 ?auto_162405 ) ) ( not ( = ?auto_162399 ?auto_162400 ) ) ( not ( = ?auto_162399 ?auto_162401 ) ) ( not ( = ?auto_162399 ?auto_162402 ) ) ( not ( = ?auto_162399 ?auto_162403 ) ) ( not ( = ?auto_162399 ?auto_162404 ) ) ( not ( = ?auto_162399 ?auto_162405 ) ) ( not ( = ?auto_162400 ?auto_162401 ) ) ( not ( = ?auto_162400 ?auto_162402 ) ) ( not ( = ?auto_162400 ?auto_162403 ) ) ( not ( = ?auto_162400 ?auto_162404 ) ) ( not ( = ?auto_162400 ?auto_162405 ) ) ( not ( = ?auto_162401 ?auto_162402 ) ) ( not ( = ?auto_162401 ?auto_162403 ) ) ( not ( = ?auto_162401 ?auto_162404 ) ) ( not ( = ?auto_162401 ?auto_162405 ) ) ( not ( = ?auto_162402 ?auto_162403 ) ) ( not ( = ?auto_162402 ?auto_162404 ) ) ( not ( = ?auto_162402 ?auto_162405 ) ) ( not ( = ?auto_162403 ?auto_162404 ) ) ( not ( = ?auto_162403 ?auto_162405 ) ) ( not ( = ?auto_162404 ?auto_162405 ) ) ( ON ?auto_162403 ?auto_162404 ) ( ON ?auto_162402 ?auto_162403 ) ( ON ?auto_162401 ?auto_162402 ) ( ON ?auto_162400 ?auto_162401 ) ( ON ?auto_162399 ?auto_162400 ) ( ON ?auto_162398 ?auto_162399 ) ( ON ?auto_162397 ?auto_162398 ) ( ON ?auto_162396 ?auto_162397 ) ( CLEAR ?auto_162396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162396 )
      ( MAKE-9PILE ?auto_162396 ?auto_162397 ?auto_162398 ?auto_162399 ?auto_162400 ?auto_162401 ?auto_162402 ?auto_162403 ?auto_162404 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162416 - BLOCK
      ?auto_162417 - BLOCK
      ?auto_162418 - BLOCK
      ?auto_162419 - BLOCK
      ?auto_162420 - BLOCK
      ?auto_162421 - BLOCK
      ?auto_162422 - BLOCK
      ?auto_162423 - BLOCK
      ?auto_162424 - BLOCK
      ?auto_162425 - BLOCK
    )
    :vars
    (
      ?auto_162426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162424 ) ( ON ?auto_162425 ?auto_162426 ) ( CLEAR ?auto_162425 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162416 ) ( ON ?auto_162417 ?auto_162416 ) ( ON ?auto_162418 ?auto_162417 ) ( ON ?auto_162419 ?auto_162418 ) ( ON ?auto_162420 ?auto_162419 ) ( ON ?auto_162421 ?auto_162420 ) ( ON ?auto_162422 ?auto_162421 ) ( ON ?auto_162423 ?auto_162422 ) ( ON ?auto_162424 ?auto_162423 ) ( not ( = ?auto_162416 ?auto_162417 ) ) ( not ( = ?auto_162416 ?auto_162418 ) ) ( not ( = ?auto_162416 ?auto_162419 ) ) ( not ( = ?auto_162416 ?auto_162420 ) ) ( not ( = ?auto_162416 ?auto_162421 ) ) ( not ( = ?auto_162416 ?auto_162422 ) ) ( not ( = ?auto_162416 ?auto_162423 ) ) ( not ( = ?auto_162416 ?auto_162424 ) ) ( not ( = ?auto_162416 ?auto_162425 ) ) ( not ( = ?auto_162416 ?auto_162426 ) ) ( not ( = ?auto_162417 ?auto_162418 ) ) ( not ( = ?auto_162417 ?auto_162419 ) ) ( not ( = ?auto_162417 ?auto_162420 ) ) ( not ( = ?auto_162417 ?auto_162421 ) ) ( not ( = ?auto_162417 ?auto_162422 ) ) ( not ( = ?auto_162417 ?auto_162423 ) ) ( not ( = ?auto_162417 ?auto_162424 ) ) ( not ( = ?auto_162417 ?auto_162425 ) ) ( not ( = ?auto_162417 ?auto_162426 ) ) ( not ( = ?auto_162418 ?auto_162419 ) ) ( not ( = ?auto_162418 ?auto_162420 ) ) ( not ( = ?auto_162418 ?auto_162421 ) ) ( not ( = ?auto_162418 ?auto_162422 ) ) ( not ( = ?auto_162418 ?auto_162423 ) ) ( not ( = ?auto_162418 ?auto_162424 ) ) ( not ( = ?auto_162418 ?auto_162425 ) ) ( not ( = ?auto_162418 ?auto_162426 ) ) ( not ( = ?auto_162419 ?auto_162420 ) ) ( not ( = ?auto_162419 ?auto_162421 ) ) ( not ( = ?auto_162419 ?auto_162422 ) ) ( not ( = ?auto_162419 ?auto_162423 ) ) ( not ( = ?auto_162419 ?auto_162424 ) ) ( not ( = ?auto_162419 ?auto_162425 ) ) ( not ( = ?auto_162419 ?auto_162426 ) ) ( not ( = ?auto_162420 ?auto_162421 ) ) ( not ( = ?auto_162420 ?auto_162422 ) ) ( not ( = ?auto_162420 ?auto_162423 ) ) ( not ( = ?auto_162420 ?auto_162424 ) ) ( not ( = ?auto_162420 ?auto_162425 ) ) ( not ( = ?auto_162420 ?auto_162426 ) ) ( not ( = ?auto_162421 ?auto_162422 ) ) ( not ( = ?auto_162421 ?auto_162423 ) ) ( not ( = ?auto_162421 ?auto_162424 ) ) ( not ( = ?auto_162421 ?auto_162425 ) ) ( not ( = ?auto_162421 ?auto_162426 ) ) ( not ( = ?auto_162422 ?auto_162423 ) ) ( not ( = ?auto_162422 ?auto_162424 ) ) ( not ( = ?auto_162422 ?auto_162425 ) ) ( not ( = ?auto_162422 ?auto_162426 ) ) ( not ( = ?auto_162423 ?auto_162424 ) ) ( not ( = ?auto_162423 ?auto_162425 ) ) ( not ( = ?auto_162423 ?auto_162426 ) ) ( not ( = ?auto_162424 ?auto_162425 ) ) ( not ( = ?auto_162424 ?auto_162426 ) ) ( not ( = ?auto_162425 ?auto_162426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162425 ?auto_162426 )
      ( !STACK ?auto_162425 ?auto_162424 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162437 - BLOCK
      ?auto_162438 - BLOCK
      ?auto_162439 - BLOCK
      ?auto_162440 - BLOCK
      ?auto_162441 - BLOCK
      ?auto_162442 - BLOCK
      ?auto_162443 - BLOCK
      ?auto_162444 - BLOCK
      ?auto_162445 - BLOCK
      ?auto_162446 - BLOCK
    )
    :vars
    (
      ?auto_162447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162445 ) ( ON ?auto_162446 ?auto_162447 ) ( CLEAR ?auto_162446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162437 ) ( ON ?auto_162438 ?auto_162437 ) ( ON ?auto_162439 ?auto_162438 ) ( ON ?auto_162440 ?auto_162439 ) ( ON ?auto_162441 ?auto_162440 ) ( ON ?auto_162442 ?auto_162441 ) ( ON ?auto_162443 ?auto_162442 ) ( ON ?auto_162444 ?auto_162443 ) ( ON ?auto_162445 ?auto_162444 ) ( not ( = ?auto_162437 ?auto_162438 ) ) ( not ( = ?auto_162437 ?auto_162439 ) ) ( not ( = ?auto_162437 ?auto_162440 ) ) ( not ( = ?auto_162437 ?auto_162441 ) ) ( not ( = ?auto_162437 ?auto_162442 ) ) ( not ( = ?auto_162437 ?auto_162443 ) ) ( not ( = ?auto_162437 ?auto_162444 ) ) ( not ( = ?auto_162437 ?auto_162445 ) ) ( not ( = ?auto_162437 ?auto_162446 ) ) ( not ( = ?auto_162437 ?auto_162447 ) ) ( not ( = ?auto_162438 ?auto_162439 ) ) ( not ( = ?auto_162438 ?auto_162440 ) ) ( not ( = ?auto_162438 ?auto_162441 ) ) ( not ( = ?auto_162438 ?auto_162442 ) ) ( not ( = ?auto_162438 ?auto_162443 ) ) ( not ( = ?auto_162438 ?auto_162444 ) ) ( not ( = ?auto_162438 ?auto_162445 ) ) ( not ( = ?auto_162438 ?auto_162446 ) ) ( not ( = ?auto_162438 ?auto_162447 ) ) ( not ( = ?auto_162439 ?auto_162440 ) ) ( not ( = ?auto_162439 ?auto_162441 ) ) ( not ( = ?auto_162439 ?auto_162442 ) ) ( not ( = ?auto_162439 ?auto_162443 ) ) ( not ( = ?auto_162439 ?auto_162444 ) ) ( not ( = ?auto_162439 ?auto_162445 ) ) ( not ( = ?auto_162439 ?auto_162446 ) ) ( not ( = ?auto_162439 ?auto_162447 ) ) ( not ( = ?auto_162440 ?auto_162441 ) ) ( not ( = ?auto_162440 ?auto_162442 ) ) ( not ( = ?auto_162440 ?auto_162443 ) ) ( not ( = ?auto_162440 ?auto_162444 ) ) ( not ( = ?auto_162440 ?auto_162445 ) ) ( not ( = ?auto_162440 ?auto_162446 ) ) ( not ( = ?auto_162440 ?auto_162447 ) ) ( not ( = ?auto_162441 ?auto_162442 ) ) ( not ( = ?auto_162441 ?auto_162443 ) ) ( not ( = ?auto_162441 ?auto_162444 ) ) ( not ( = ?auto_162441 ?auto_162445 ) ) ( not ( = ?auto_162441 ?auto_162446 ) ) ( not ( = ?auto_162441 ?auto_162447 ) ) ( not ( = ?auto_162442 ?auto_162443 ) ) ( not ( = ?auto_162442 ?auto_162444 ) ) ( not ( = ?auto_162442 ?auto_162445 ) ) ( not ( = ?auto_162442 ?auto_162446 ) ) ( not ( = ?auto_162442 ?auto_162447 ) ) ( not ( = ?auto_162443 ?auto_162444 ) ) ( not ( = ?auto_162443 ?auto_162445 ) ) ( not ( = ?auto_162443 ?auto_162446 ) ) ( not ( = ?auto_162443 ?auto_162447 ) ) ( not ( = ?auto_162444 ?auto_162445 ) ) ( not ( = ?auto_162444 ?auto_162446 ) ) ( not ( = ?auto_162444 ?auto_162447 ) ) ( not ( = ?auto_162445 ?auto_162446 ) ) ( not ( = ?auto_162445 ?auto_162447 ) ) ( not ( = ?auto_162446 ?auto_162447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162446 ?auto_162447 )
      ( !STACK ?auto_162446 ?auto_162445 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162458 - BLOCK
      ?auto_162459 - BLOCK
      ?auto_162460 - BLOCK
      ?auto_162461 - BLOCK
      ?auto_162462 - BLOCK
      ?auto_162463 - BLOCK
      ?auto_162464 - BLOCK
      ?auto_162465 - BLOCK
      ?auto_162466 - BLOCK
      ?auto_162467 - BLOCK
    )
    :vars
    (
      ?auto_162468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162467 ?auto_162468 ) ( ON-TABLE ?auto_162458 ) ( ON ?auto_162459 ?auto_162458 ) ( ON ?auto_162460 ?auto_162459 ) ( ON ?auto_162461 ?auto_162460 ) ( ON ?auto_162462 ?auto_162461 ) ( ON ?auto_162463 ?auto_162462 ) ( ON ?auto_162464 ?auto_162463 ) ( ON ?auto_162465 ?auto_162464 ) ( not ( = ?auto_162458 ?auto_162459 ) ) ( not ( = ?auto_162458 ?auto_162460 ) ) ( not ( = ?auto_162458 ?auto_162461 ) ) ( not ( = ?auto_162458 ?auto_162462 ) ) ( not ( = ?auto_162458 ?auto_162463 ) ) ( not ( = ?auto_162458 ?auto_162464 ) ) ( not ( = ?auto_162458 ?auto_162465 ) ) ( not ( = ?auto_162458 ?auto_162466 ) ) ( not ( = ?auto_162458 ?auto_162467 ) ) ( not ( = ?auto_162458 ?auto_162468 ) ) ( not ( = ?auto_162459 ?auto_162460 ) ) ( not ( = ?auto_162459 ?auto_162461 ) ) ( not ( = ?auto_162459 ?auto_162462 ) ) ( not ( = ?auto_162459 ?auto_162463 ) ) ( not ( = ?auto_162459 ?auto_162464 ) ) ( not ( = ?auto_162459 ?auto_162465 ) ) ( not ( = ?auto_162459 ?auto_162466 ) ) ( not ( = ?auto_162459 ?auto_162467 ) ) ( not ( = ?auto_162459 ?auto_162468 ) ) ( not ( = ?auto_162460 ?auto_162461 ) ) ( not ( = ?auto_162460 ?auto_162462 ) ) ( not ( = ?auto_162460 ?auto_162463 ) ) ( not ( = ?auto_162460 ?auto_162464 ) ) ( not ( = ?auto_162460 ?auto_162465 ) ) ( not ( = ?auto_162460 ?auto_162466 ) ) ( not ( = ?auto_162460 ?auto_162467 ) ) ( not ( = ?auto_162460 ?auto_162468 ) ) ( not ( = ?auto_162461 ?auto_162462 ) ) ( not ( = ?auto_162461 ?auto_162463 ) ) ( not ( = ?auto_162461 ?auto_162464 ) ) ( not ( = ?auto_162461 ?auto_162465 ) ) ( not ( = ?auto_162461 ?auto_162466 ) ) ( not ( = ?auto_162461 ?auto_162467 ) ) ( not ( = ?auto_162461 ?auto_162468 ) ) ( not ( = ?auto_162462 ?auto_162463 ) ) ( not ( = ?auto_162462 ?auto_162464 ) ) ( not ( = ?auto_162462 ?auto_162465 ) ) ( not ( = ?auto_162462 ?auto_162466 ) ) ( not ( = ?auto_162462 ?auto_162467 ) ) ( not ( = ?auto_162462 ?auto_162468 ) ) ( not ( = ?auto_162463 ?auto_162464 ) ) ( not ( = ?auto_162463 ?auto_162465 ) ) ( not ( = ?auto_162463 ?auto_162466 ) ) ( not ( = ?auto_162463 ?auto_162467 ) ) ( not ( = ?auto_162463 ?auto_162468 ) ) ( not ( = ?auto_162464 ?auto_162465 ) ) ( not ( = ?auto_162464 ?auto_162466 ) ) ( not ( = ?auto_162464 ?auto_162467 ) ) ( not ( = ?auto_162464 ?auto_162468 ) ) ( not ( = ?auto_162465 ?auto_162466 ) ) ( not ( = ?auto_162465 ?auto_162467 ) ) ( not ( = ?auto_162465 ?auto_162468 ) ) ( not ( = ?auto_162466 ?auto_162467 ) ) ( not ( = ?auto_162466 ?auto_162468 ) ) ( not ( = ?auto_162467 ?auto_162468 ) ) ( CLEAR ?auto_162465 ) ( ON ?auto_162466 ?auto_162467 ) ( CLEAR ?auto_162466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_162458 ?auto_162459 ?auto_162460 ?auto_162461 ?auto_162462 ?auto_162463 ?auto_162464 ?auto_162465 ?auto_162466 )
      ( MAKE-10PILE ?auto_162458 ?auto_162459 ?auto_162460 ?auto_162461 ?auto_162462 ?auto_162463 ?auto_162464 ?auto_162465 ?auto_162466 ?auto_162467 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162479 - BLOCK
      ?auto_162480 - BLOCK
      ?auto_162481 - BLOCK
      ?auto_162482 - BLOCK
      ?auto_162483 - BLOCK
      ?auto_162484 - BLOCK
      ?auto_162485 - BLOCK
      ?auto_162486 - BLOCK
      ?auto_162487 - BLOCK
      ?auto_162488 - BLOCK
    )
    :vars
    (
      ?auto_162489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162488 ?auto_162489 ) ( ON-TABLE ?auto_162479 ) ( ON ?auto_162480 ?auto_162479 ) ( ON ?auto_162481 ?auto_162480 ) ( ON ?auto_162482 ?auto_162481 ) ( ON ?auto_162483 ?auto_162482 ) ( ON ?auto_162484 ?auto_162483 ) ( ON ?auto_162485 ?auto_162484 ) ( ON ?auto_162486 ?auto_162485 ) ( not ( = ?auto_162479 ?auto_162480 ) ) ( not ( = ?auto_162479 ?auto_162481 ) ) ( not ( = ?auto_162479 ?auto_162482 ) ) ( not ( = ?auto_162479 ?auto_162483 ) ) ( not ( = ?auto_162479 ?auto_162484 ) ) ( not ( = ?auto_162479 ?auto_162485 ) ) ( not ( = ?auto_162479 ?auto_162486 ) ) ( not ( = ?auto_162479 ?auto_162487 ) ) ( not ( = ?auto_162479 ?auto_162488 ) ) ( not ( = ?auto_162479 ?auto_162489 ) ) ( not ( = ?auto_162480 ?auto_162481 ) ) ( not ( = ?auto_162480 ?auto_162482 ) ) ( not ( = ?auto_162480 ?auto_162483 ) ) ( not ( = ?auto_162480 ?auto_162484 ) ) ( not ( = ?auto_162480 ?auto_162485 ) ) ( not ( = ?auto_162480 ?auto_162486 ) ) ( not ( = ?auto_162480 ?auto_162487 ) ) ( not ( = ?auto_162480 ?auto_162488 ) ) ( not ( = ?auto_162480 ?auto_162489 ) ) ( not ( = ?auto_162481 ?auto_162482 ) ) ( not ( = ?auto_162481 ?auto_162483 ) ) ( not ( = ?auto_162481 ?auto_162484 ) ) ( not ( = ?auto_162481 ?auto_162485 ) ) ( not ( = ?auto_162481 ?auto_162486 ) ) ( not ( = ?auto_162481 ?auto_162487 ) ) ( not ( = ?auto_162481 ?auto_162488 ) ) ( not ( = ?auto_162481 ?auto_162489 ) ) ( not ( = ?auto_162482 ?auto_162483 ) ) ( not ( = ?auto_162482 ?auto_162484 ) ) ( not ( = ?auto_162482 ?auto_162485 ) ) ( not ( = ?auto_162482 ?auto_162486 ) ) ( not ( = ?auto_162482 ?auto_162487 ) ) ( not ( = ?auto_162482 ?auto_162488 ) ) ( not ( = ?auto_162482 ?auto_162489 ) ) ( not ( = ?auto_162483 ?auto_162484 ) ) ( not ( = ?auto_162483 ?auto_162485 ) ) ( not ( = ?auto_162483 ?auto_162486 ) ) ( not ( = ?auto_162483 ?auto_162487 ) ) ( not ( = ?auto_162483 ?auto_162488 ) ) ( not ( = ?auto_162483 ?auto_162489 ) ) ( not ( = ?auto_162484 ?auto_162485 ) ) ( not ( = ?auto_162484 ?auto_162486 ) ) ( not ( = ?auto_162484 ?auto_162487 ) ) ( not ( = ?auto_162484 ?auto_162488 ) ) ( not ( = ?auto_162484 ?auto_162489 ) ) ( not ( = ?auto_162485 ?auto_162486 ) ) ( not ( = ?auto_162485 ?auto_162487 ) ) ( not ( = ?auto_162485 ?auto_162488 ) ) ( not ( = ?auto_162485 ?auto_162489 ) ) ( not ( = ?auto_162486 ?auto_162487 ) ) ( not ( = ?auto_162486 ?auto_162488 ) ) ( not ( = ?auto_162486 ?auto_162489 ) ) ( not ( = ?auto_162487 ?auto_162488 ) ) ( not ( = ?auto_162487 ?auto_162489 ) ) ( not ( = ?auto_162488 ?auto_162489 ) ) ( CLEAR ?auto_162486 ) ( ON ?auto_162487 ?auto_162488 ) ( CLEAR ?auto_162487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_162479 ?auto_162480 ?auto_162481 ?auto_162482 ?auto_162483 ?auto_162484 ?auto_162485 ?auto_162486 ?auto_162487 )
      ( MAKE-10PILE ?auto_162479 ?auto_162480 ?auto_162481 ?auto_162482 ?auto_162483 ?auto_162484 ?auto_162485 ?auto_162486 ?auto_162487 ?auto_162488 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162500 - BLOCK
      ?auto_162501 - BLOCK
      ?auto_162502 - BLOCK
      ?auto_162503 - BLOCK
      ?auto_162504 - BLOCK
      ?auto_162505 - BLOCK
      ?auto_162506 - BLOCK
      ?auto_162507 - BLOCK
      ?auto_162508 - BLOCK
      ?auto_162509 - BLOCK
    )
    :vars
    (
      ?auto_162510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162509 ?auto_162510 ) ( ON-TABLE ?auto_162500 ) ( ON ?auto_162501 ?auto_162500 ) ( ON ?auto_162502 ?auto_162501 ) ( ON ?auto_162503 ?auto_162502 ) ( ON ?auto_162504 ?auto_162503 ) ( ON ?auto_162505 ?auto_162504 ) ( ON ?auto_162506 ?auto_162505 ) ( not ( = ?auto_162500 ?auto_162501 ) ) ( not ( = ?auto_162500 ?auto_162502 ) ) ( not ( = ?auto_162500 ?auto_162503 ) ) ( not ( = ?auto_162500 ?auto_162504 ) ) ( not ( = ?auto_162500 ?auto_162505 ) ) ( not ( = ?auto_162500 ?auto_162506 ) ) ( not ( = ?auto_162500 ?auto_162507 ) ) ( not ( = ?auto_162500 ?auto_162508 ) ) ( not ( = ?auto_162500 ?auto_162509 ) ) ( not ( = ?auto_162500 ?auto_162510 ) ) ( not ( = ?auto_162501 ?auto_162502 ) ) ( not ( = ?auto_162501 ?auto_162503 ) ) ( not ( = ?auto_162501 ?auto_162504 ) ) ( not ( = ?auto_162501 ?auto_162505 ) ) ( not ( = ?auto_162501 ?auto_162506 ) ) ( not ( = ?auto_162501 ?auto_162507 ) ) ( not ( = ?auto_162501 ?auto_162508 ) ) ( not ( = ?auto_162501 ?auto_162509 ) ) ( not ( = ?auto_162501 ?auto_162510 ) ) ( not ( = ?auto_162502 ?auto_162503 ) ) ( not ( = ?auto_162502 ?auto_162504 ) ) ( not ( = ?auto_162502 ?auto_162505 ) ) ( not ( = ?auto_162502 ?auto_162506 ) ) ( not ( = ?auto_162502 ?auto_162507 ) ) ( not ( = ?auto_162502 ?auto_162508 ) ) ( not ( = ?auto_162502 ?auto_162509 ) ) ( not ( = ?auto_162502 ?auto_162510 ) ) ( not ( = ?auto_162503 ?auto_162504 ) ) ( not ( = ?auto_162503 ?auto_162505 ) ) ( not ( = ?auto_162503 ?auto_162506 ) ) ( not ( = ?auto_162503 ?auto_162507 ) ) ( not ( = ?auto_162503 ?auto_162508 ) ) ( not ( = ?auto_162503 ?auto_162509 ) ) ( not ( = ?auto_162503 ?auto_162510 ) ) ( not ( = ?auto_162504 ?auto_162505 ) ) ( not ( = ?auto_162504 ?auto_162506 ) ) ( not ( = ?auto_162504 ?auto_162507 ) ) ( not ( = ?auto_162504 ?auto_162508 ) ) ( not ( = ?auto_162504 ?auto_162509 ) ) ( not ( = ?auto_162504 ?auto_162510 ) ) ( not ( = ?auto_162505 ?auto_162506 ) ) ( not ( = ?auto_162505 ?auto_162507 ) ) ( not ( = ?auto_162505 ?auto_162508 ) ) ( not ( = ?auto_162505 ?auto_162509 ) ) ( not ( = ?auto_162505 ?auto_162510 ) ) ( not ( = ?auto_162506 ?auto_162507 ) ) ( not ( = ?auto_162506 ?auto_162508 ) ) ( not ( = ?auto_162506 ?auto_162509 ) ) ( not ( = ?auto_162506 ?auto_162510 ) ) ( not ( = ?auto_162507 ?auto_162508 ) ) ( not ( = ?auto_162507 ?auto_162509 ) ) ( not ( = ?auto_162507 ?auto_162510 ) ) ( not ( = ?auto_162508 ?auto_162509 ) ) ( not ( = ?auto_162508 ?auto_162510 ) ) ( not ( = ?auto_162509 ?auto_162510 ) ) ( ON ?auto_162508 ?auto_162509 ) ( CLEAR ?auto_162506 ) ( ON ?auto_162507 ?auto_162508 ) ( CLEAR ?auto_162507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162500 ?auto_162501 ?auto_162502 ?auto_162503 ?auto_162504 ?auto_162505 ?auto_162506 ?auto_162507 )
      ( MAKE-10PILE ?auto_162500 ?auto_162501 ?auto_162502 ?auto_162503 ?auto_162504 ?auto_162505 ?auto_162506 ?auto_162507 ?auto_162508 ?auto_162509 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162521 - BLOCK
      ?auto_162522 - BLOCK
      ?auto_162523 - BLOCK
      ?auto_162524 - BLOCK
      ?auto_162525 - BLOCK
      ?auto_162526 - BLOCK
      ?auto_162527 - BLOCK
      ?auto_162528 - BLOCK
      ?auto_162529 - BLOCK
      ?auto_162530 - BLOCK
    )
    :vars
    (
      ?auto_162531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162530 ?auto_162531 ) ( ON-TABLE ?auto_162521 ) ( ON ?auto_162522 ?auto_162521 ) ( ON ?auto_162523 ?auto_162522 ) ( ON ?auto_162524 ?auto_162523 ) ( ON ?auto_162525 ?auto_162524 ) ( ON ?auto_162526 ?auto_162525 ) ( ON ?auto_162527 ?auto_162526 ) ( not ( = ?auto_162521 ?auto_162522 ) ) ( not ( = ?auto_162521 ?auto_162523 ) ) ( not ( = ?auto_162521 ?auto_162524 ) ) ( not ( = ?auto_162521 ?auto_162525 ) ) ( not ( = ?auto_162521 ?auto_162526 ) ) ( not ( = ?auto_162521 ?auto_162527 ) ) ( not ( = ?auto_162521 ?auto_162528 ) ) ( not ( = ?auto_162521 ?auto_162529 ) ) ( not ( = ?auto_162521 ?auto_162530 ) ) ( not ( = ?auto_162521 ?auto_162531 ) ) ( not ( = ?auto_162522 ?auto_162523 ) ) ( not ( = ?auto_162522 ?auto_162524 ) ) ( not ( = ?auto_162522 ?auto_162525 ) ) ( not ( = ?auto_162522 ?auto_162526 ) ) ( not ( = ?auto_162522 ?auto_162527 ) ) ( not ( = ?auto_162522 ?auto_162528 ) ) ( not ( = ?auto_162522 ?auto_162529 ) ) ( not ( = ?auto_162522 ?auto_162530 ) ) ( not ( = ?auto_162522 ?auto_162531 ) ) ( not ( = ?auto_162523 ?auto_162524 ) ) ( not ( = ?auto_162523 ?auto_162525 ) ) ( not ( = ?auto_162523 ?auto_162526 ) ) ( not ( = ?auto_162523 ?auto_162527 ) ) ( not ( = ?auto_162523 ?auto_162528 ) ) ( not ( = ?auto_162523 ?auto_162529 ) ) ( not ( = ?auto_162523 ?auto_162530 ) ) ( not ( = ?auto_162523 ?auto_162531 ) ) ( not ( = ?auto_162524 ?auto_162525 ) ) ( not ( = ?auto_162524 ?auto_162526 ) ) ( not ( = ?auto_162524 ?auto_162527 ) ) ( not ( = ?auto_162524 ?auto_162528 ) ) ( not ( = ?auto_162524 ?auto_162529 ) ) ( not ( = ?auto_162524 ?auto_162530 ) ) ( not ( = ?auto_162524 ?auto_162531 ) ) ( not ( = ?auto_162525 ?auto_162526 ) ) ( not ( = ?auto_162525 ?auto_162527 ) ) ( not ( = ?auto_162525 ?auto_162528 ) ) ( not ( = ?auto_162525 ?auto_162529 ) ) ( not ( = ?auto_162525 ?auto_162530 ) ) ( not ( = ?auto_162525 ?auto_162531 ) ) ( not ( = ?auto_162526 ?auto_162527 ) ) ( not ( = ?auto_162526 ?auto_162528 ) ) ( not ( = ?auto_162526 ?auto_162529 ) ) ( not ( = ?auto_162526 ?auto_162530 ) ) ( not ( = ?auto_162526 ?auto_162531 ) ) ( not ( = ?auto_162527 ?auto_162528 ) ) ( not ( = ?auto_162527 ?auto_162529 ) ) ( not ( = ?auto_162527 ?auto_162530 ) ) ( not ( = ?auto_162527 ?auto_162531 ) ) ( not ( = ?auto_162528 ?auto_162529 ) ) ( not ( = ?auto_162528 ?auto_162530 ) ) ( not ( = ?auto_162528 ?auto_162531 ) ) ( not ( = ?auto_162529 ?auto_162530 ) ) ( not ( = ?auto_162529 ?auto_162531 ) ) ( not ( = ?auto_162530 ?auto_162531 ) ) ( ON ?auto_162529 ?auto_162530 ) ( CLEAR ?auto_162527 ) ( ON ?auto_162528 ?auto_162529 ) ( CLEAR ?auto_162528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162521 ?auto_162522 ?auto_162523 ?auto_162524 ?auto_162525 ?auto_162526 ?auto_162527 ?auto_162528 )
      ( MAKE-10PILE ?auto_162521 ?auto_162522 ?auto_162523 ?auto_162524 ?auto_162525 ?auto_162526 ?auto_162527 ?auto_162528 ?auto_162529 ?auto_162530 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162542 - BLOCK
      ?auto_162543 - BLOCK
      ?auto_162544 - BLOCK
      ?auto_162545 - BLOCK
      ?auto_162546 - BLOCK
      ?auto_162547 - BLOCK
      ?auto_162548 - BLOCK
      ?auto_162549 - BLOCK
      ?auto_162550 - BLOCK
      ?auto_162551 - BLOCK
    )
    :vars
    (
      ?auto_162552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162551 ?auto_162552 ) ( ON-TABLE ?auto_162542 ) ( ON ?auto_162543 ?auto_162542 ) ( ON ?auto_162544 ?auto_162543 ) ( ON ?auto_162545 ?auto_162544 ) ( ON ?auto_162546 ?auto_162545 ) ( ON ?auto_162547 ?auto_162546 ) ( not ( = ?auto_162542 ?auto_162543 ) ) ( not ( = ?auto_162542 ?auto_162544 ) ) ( not ( = ?auto_162542 ?auto_162545 ) ) ( not ( = ?auto_162542 ?auto_162546 ) ) ( not ( = ?auto_162542 ?auto_162547 ) ) ( not ( = ?auto_162542 ?auto_162548 ) ) ( not ( = ?auto_162542 ?auto_162549 ) ) ( not ( = ?auto_162542 ?auto_162550 ) ) ( not ( = ?auto_162542 ?auto_162551 ) ) ( not ( = ?auto_162542 ?auto_162552 ) ) ( not ( = ?auto_162543 ?auto_162544 ) ) ( not ( = ?auto_162543 ?auto_162545 ) ) ( not ( = ?auto_162543 ?auto_162546 ) ) ( not ( = ?auto_162543 ?auto_162547 ) ) ( not ( = ?auto_162543 ?auto_162548 ) ) ( not ( = ?auto_162543 ?auto_162549 ) ) ( not ( = ?auto_162543 ?auto_162550 ) ) ( not ( = ?auto_162543 ?auto_162551 ) ) ( not ( = ?auto_162543 ?auto_162552 ) ) ( not ( = ?auto_162544 ?auto_162545 ) ) ( not ( = ?auto_162544 ?auto_162546 ) ) ( not ( = ?auto_162544 ?auto_162547 ) ) ( not ( = ?auto_162544 ?auto_162548 ) ) ( not ( = ?auto_162544 ?auto_162549 ) ) ( not ( = ?auto_162544 ?auto_162550 ) ) ( not ( = ?auto_162544 ?auto_162551 ) ) ( not ( = ?auto_162544 ?auto_162552 ) ) ( not ( = ?auto_162545 ?auto_162546 ) ) ( not ( = ?auto_162545 ?auto_162547 ) ) ( not ( = ?auto_162545 ?auto_162548 ) ) ( not ( = ?auto_162545 ?auto_162549 ) ) ( not ( = ?auto_162545 ?auto_162550 ) ) ( not ( = ?auto_162545 ?auto_162551 ) ) ( not ( = ?auto_162545 ?auto_162552 ) ) ( not ( = ?auto_162546 ?auto_162547 ) ) ( not ( = ?auto_162546 ?auto_162548 ) ) ( not ( = ?auto_162546 ?auto_162549 ) ) ( not ( = ?auto_162546 ?auto_162550 ) ) ( not ( = ?auto_162546 ?auto_162551 ) ) ( not ( = ?auto_162546 ?auto_162552 ) ) ( not ( = ?auto_162547 ?auto_162548 ) ) ( not ( = ?auto_162547 ?auto_162549 ) ) ( not ( = ?auto_162547 ?auto_162550 ) ) ( not ( = ?auto_162547 ?auto_162551 ) ) ( not ( = ?auto_162547 ?auto_162552 ) ) ( not ( = ?auto_162548 ?auto_162549 ) ) ( not ( = ?auto_162548 ?auto_162550 ) ) ( not ( = ?auto_162548 ?auto_162551 ) ) ( not ( = ?auto_162548 ?auto_162552 ) ) ( not ( = ?auto_162549 ?auto_162550 ) ) ( not ( = ?auto_162549 ?auto_162551 ) ) ( not ( = ?auto_162549 ?auto_162552 ) ) ( not ( = ?auto_162550 ?auto_162551 ) ) ( not ( = ?auto_162550 ?auto_162552 ) ) ( not ( = ?auto_162551 ?auto_162552 ) ) ( ON ?auto_162550 ?auto_162551 ) ( ON ?auto_162549 ?auto_162550 ) ( CLEAR ?auto_162547 ) ( ON ?auto_162548 ?auto_162549 ) ( CLEAR ?auto_162548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162542 ?auto_162543 ?auto_162544 ?auto_162545 ?auto_162546 ?auto_162547 ?auto_162548 )
      ( MAKE-10PILE ?auto_162542 ?auto_162543 ?auto_162544 ?auto_162545 ?auto_162546 ?auto_162547 ?auto_162548 ?auto_162549 ?auto_162550 ?auto_162551 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162563 - BLOCK
      ?auto_162564 - BLOCK
      ?auto_162565 - BLOCK
      ?auto_162566 - BLOCK
      ?auto_162567 - BLOCK
      ?auto_162568 - BLOCK
      ?auto_162569 - BLOCK
      ?auto_162570 - BLOCK
      ?auto_162571 - BLOCK
      ?auto_162572 - BLOCK
    )
    :vars
    (
      ?auto_162573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162572 ?auto_162573 ) ( ON-TABLE ?auto_162563 ) ( ON ?auto_162564 ?auto_162563 ) ( ON ?auto_162565 ?auto_162564 ) ( ON ?auto_162566 ?auto_162565 ) ( ON ?auto_162567 ?auto_162566 ) ( ON ?auto_162568 ?auto_162567 ) ( not ( = ?auto_162563 ?auto_162564 ) ) ( not ( = ?auto_162563 ?auto_162565 ) ) ( not ( = ?auto_162563 ?auto_162566 ) ) ( not ( = ?auto_162563 ?auto_162567 ) ) ( not ( = ?auto_162563 ?auto_162568 ) ) ( not ( = ?auto_162563 ?auto_162569 ) ) ( not ( = ?auto_162563 ?auto_162570 ) ) ( not ( = ?auto_162563 ?auto_162571 ) ) ( not ( = ?auto_162563 ?auto_162572 ) ) ( not ( = ?auto_162563 ?auto_162573 ) ) ( not ( = ?auto_162564 ?auto_162565 ) ) ( not ( = ?auto_162564 ?auto_162566 ) ) ( not ( = ?auto_162564 ?auto_162567 ) ) ( not ( = ?auto_162564 ?auto_162568 ) ) ( not ( = ?auto_162564 ?auto_162569 ) ) ( not ( = ?auto_162564 ?auto_162570 ) ) ( not ( = ?auto_162564 ?auto_162571 ) ) ( not ( = ?auto_162564 ?auto_162572 ) ) ( not ( = ?auto_162564 ?auto_162573 ) ) ( not ( = ?auto_162565 ?auto_162566 ) ) ( not ( = ?auto_162565 ?auto_162567 ) ) ( not ( = ?auto_162565 ?auto_162568 ) ) ( not ( = ?auto_162565 ?auto_162569 ) ) ( not ( = ?auto_162565 ?auto_162570 ) ) ( not ( = ?auto_162565 ?auto_162571 ) ) ( not ( = ?auto_162565 ?auto_162572 ) ) ( not ( = ?auto_162565 ?auto_162573 ) ) ( not ( = ?auto_162566 ?auto_162567 ) ) ( not ( = ?auto_162566 ?auto_162568 ) ) ( not ( = ?auto_162566 ?auto_162569 ) ) ( not ( = ?auto_162566 ?auto_162570 ) ) ( not ( = ?auto_162566 ?auto_162571 ) ) ( not ( = ?auto_162566 ?auto_162572 ) ) ( not ( = ?auto_162566 ?auto_162573 ) ) ( not ( = ?auto_162567 ?auto_162568 ) ) ( not ( = ?auto_162567 ?auto_162569 ) ) ( not ( = ?auto_162567 ?auto_162570 ) ) ( not ( = ?auto_162567 ?auto_162571 ) ) ( not ( = ?auto_162567 ?auto_162572 ) ) ( not ( = ?auto_162567 ?auto_162573 ) ) ( not ( = ?auto_162568 ?auto_162569 ) ) ( not ( = ?auto_162568 ?auto_162570 ) ) ( not ( = ?auto_162568 ?auto_162571 ) ) ( not ( = ?auto_162568 ?auto_162572 ) ) ( not ( = ?auto_162568 ?auto_162573 ) ) ( not ( = ?auto_162569 ?auto_162570 ) ) ( not ( = ?auto_162569 ?auto_162571 ) ) ( not ( = ?auto_162569 ?auto_162572 ) ) ( not ( = ?auto_162569 ?auto_162573 ) ) ( not ( = ?auto_162570 ?auto_162571 ) ) ( not ( = ?auto_162570 ?auto_162572 ) ) ( not ( = ?auto_162570 ?auto_162573 ) ) ( not ( = ?auto_162571 ?auto_162572 ) ) ( not ( = ?auto_162571 ?auto_162573 ) ) ( not ( = ?auto_162572 ?auto_162573 ) ) ( ON ?auto_162571 ?auto_162572 ) ( ON ?auto_162570 ?auto_162571 ) ( CLEAR ?auto_162568 ) ( ON ?auto_162569 ?auto_162570 ) ( CLEAR ?auto_162569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_162563 ?auto_162564 ?auto_162565 ?auto_162566 ?auto_162567 ?auto_162568 ?auto_162569 )
      ( MAKE-10PILE ?auto_162563 ?auto_162564 ?auto_162565 ?auto_162566 ?auto_162567 ?auto_162568 ?auto_162569 ?auto_162570 ?auto_162571 ?auto_162572 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162584 - BLOCK
      ?auto_162585 - BLOCK
      ?auto_162586 - BLOCK
      ?auto_162587 - BLOCK
      ?auto_162588 - BLOCK
      ?auto_162589 - BLOCK
      ?auto_162590 - BLOCK
      ?auto_162591 - BLOCK
      ?auto_162592 - BLOCK
      ?auto_162593 - BLOCK
    )
    :vars
    (
      ?auto_162594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162593 ?auto_162594 ) ( ON-TABLE ?auto_162584 ) ( ON ?auto_162585 ?auto_162584 ) ( ON ?auto_162586 ?auto_162585 ) ( ON ?auto_162587 ?auto_162586 ) ( ON ?auto_162588 ?auto_162587 ) ( not ( = ?auto_162584 ?auto_162585 ) ) ( not ( = ?auto_162584 ?auto_162586 ) ) ( not ( = ?auto_162584 ?auto_162587 ) ) ( not ( = ?auto_162584 ?auto_162588 ) ) ( not ( = ?auto_162584 ?auto_162589 ) ) ( not ( = ?auto_162584 ?auto_162590 ) ) ( not ( = ?auto_162584 ?auto_162591 ) ) ( not ( = ?auto_162584 ?auto_162592 ) ) ( not ( = ?auto_162584 ?auto_162593 ) ) ( not ( = ?auto_162584 ?auto_162594 ) ) ( not ( = ?auto_162585 ?auto_162586 ) ) ( not ( = ?auto_162585 ?auto_162587 ) ) ( not ( = ?auto_162585 ?auto_162588 ) ) ( not ( = ?auto_162585 ?auto_162589 ) ) ( not ( = ?auto_162585 ?auto_162590 ) ) ( not ( = ?auto_162585 ?auto_162591 ) ) ( not ( = ?auto_162585 ?auto_162592 ) ) ( not ( = ?auto_162585 ?auto_162593 ) ) ( not ( = ?auto_162585 ?auto_162594 ) ) ( not ( = ?auto_162586 ?auto_162587 ) ) ( not ( = ?auto_162586 ?auto_162588 ) ) ( not ( = ?auto_162586 ?auto_162589 ) ) ( not ( = ?auto_162586 ?auto_162590 ) ) ( not ( = ?auto_162586 ?auto_162591 ) ) ( not ( = ?auto_162586 ?auto_162592 ) ) ( not ( = ?auto_162586 ?auto_162593 ) ) ( not ( = ?auto_162586 ?auto_162594 ) ) ( not ( = ?auto_162587 ?auto_162588 ) ) ( not ( = ?auto_162587 ?auto_162589 ) ) ( not ( = ?auto_162587 ?auto_162590 ) ) ( not ( = ?auto_162587 ?auto_162591 ) ) ( not ( = ?auto_162587 ?auto_162592 ) ) ( not ( = ?auto_162587 ?auto_162593 ) ) ( not ( = ?auto_162587 ?auto_162594 ) ) ( not ( = ?auto_162588 ?auto_162589 ) ) ( not ( = ?auto_162588 ?auto_162590 ) ) ( not ( = ?auto_162588 ?auto_162591 ) ) ( not ( = ?auto_162588 ?auto_162592 ) ) ( not ( = ?auto_162588 ?auto_162593 ) ) ( not ( = ?auto_162588 ?auto_162594 ) ) ( not ( = ?auto_162589 ?auto_162590 ) ) ( not ( = ?auto_162589 ?auto_162591 ) ) ( not ( = ?auto_162589 ?auto_162592 ) ) ( not ( = ?auto_162589 ?auto_162593 ) ) ( not ( = ?auto_162589 ?auto_162594 ) ) ( not ( = ?auto_162590 ?auto_162591 ) ) ( not ( = ?auto_162590 ?auto_162592 ) ) ( not ( = ?auto_162590 ?auto_162593 ) ) ( not ( = ?auto_162590 ?auto_162594 ) ) ( not ( = ?auto_162591 ?auto_162592 ) ) ( not ( = ?auto_162591 ?auto_162593 ) ) ( not ( = ?auto_162591 ?auto_162594 ) ) ( not ( = ?auto_162592 ?auto_162593 ) ) ( not ( = ?auto_162592 ?auto_162594 ) ) ( not ( = ?auto_162593 ?auto_162594 ) ) ( ON ?auto_162592 ?auto_162593 ) ( ON ?auto_162591 ?auto_162592 ) ( ON ?auto_162590 ?auto_162591 ) ( CLEAR ?auto_162588 ) ( ON ?auto_162589 ?auto_162590 ) ( CLEAR ?auto_162589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162584 ?auto_162585 ?auto_162586 ?auto_162587 ?auto_162588 ?auto_162589 )
      ( MAKE-10PILE ?auto_162584 ?auto_162585 ?auto_162586 ?auto_162587 ?auto_162588 ?auto_162589 ?auto_162590 ?auto_162591 ?auto_162592 ?auto_162593 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162605 - BLOCK
      ?auto_162606 - BLOCK
      ?auto_162607 - BLOCK
      ?auto_162608 - BLOCK
      ?auto_162609 - BLOCK
      ?auto_162610 - BLOCK
      ?auto_162611 - BLOCK
      ?auto_162612 - BLOCK
      ?auto_162613 - BLOCK
      ?auto_162614 - BLOCK
    )
    :vars
    (
      ?auto_162615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162614 ?auto_162615 ) ( ON-TABLE ?auto_162605 ) ( ON ?auto_162606 ?auto_162605 ) ( ON ?auto_162607 ?auto_162606 ) ( ON ?auto_162608 ?auto_162607 ) ( ON ?auto_162609 ?auto_162608 ) ( not ( = ?auto_162605 ?auto_162606 ) ) ( not ( = ?auto_162605 ?auto_162607 ) ) ( not ( = ?auto_162605 ?auto_162608 ) ) ( not ( = ?auto_162605 ?auto_162609 ) ) ( not ( = ?auto_162605 ?auto_162610 ) ) ( not ( = ?auto_162605 ?auto_162611 ) ) ( not ( = ?auto_162605 ?auto_162612 ) ) ( not ( = ?auto_162605 ?auto_162613 ) ) ( not ( = ?auto_162605 ?auto_162614 ) ) ( not ( = ?auto_162605 ?auto_162615 ) ) ( not ( = ?auto_162606 ?auto_162607 ) ) ( not ( = ?auto_162606 ?auto_162608 ) ) ( not ( = ?auto_162606 ?auto_162609 ) ) ( not ( = ?auto_162606 ?auto_162610 ) ) ( not ( = ?auto_162606 ?auto_162611 ) ) ( not ( = ?auto_162606 ?auto_162612 ) ) ( not ( = ?auto_162606 ?auto_162613 ) ) ( not ( = ?auto_162606 ?auto_162614 ) ) ( not ( = ?auto_162606 ?auto_162615 ) ) ( not ( = ?auto_162607 ?auto_162608 ) ) ( not ( = ?auto_162607 ?auto_162609 ) ) ( not ( = ?auto_162607 ?auto_162610 ) ) ( not ( = ?auto_162607 ?auto_162611 ) ) ( not ( = ?auto_162607 ?auto_162612 ) ) ( not ( = ?auto_162607 ?auto_162613 ) ) ( not ( = ?auto_162607 ?auto_162614 ) ) ( not ( = ?auto_162607 ?auto_162615 ) ) ( not ( = ?auto_162608 ?auto_162609 ) ) ( not ( = ?auto_162608 ?auto_162610 ) ) ( not ( = ?auto_162608 ?auto_162611 ) ) ( not ( = ?auto_162608 ?auto_162612 ) ) ( not ( = ?auto_162608 ?auto_162613 ) ) ( not ( = ?auto_162608 ?auto_162614 ) ) ( not ( = ?auto_162608 ?auto_162615 ) ) ( not ( = ?auto_162609 ?auto_162610 ) ) ( not ( = ?auto_162609 ?auto_162611 ) ) ( not ( = ?auto_162609 ?auto_162612 ) ) ( not ( = ?auto_162609 ?auto_162613 ) ) ( not ( = ?auto_162609 ?auto_162614 ) ) ( not ( = ?auto_162609 ?auto_162615 ) ) ( not ( = ?auto_162610 ?auto_162611 ) ) ( not ( = ?auto_162610 ?auto_162612 ) ) ( not ( = ?auto_162610 ?auto_162613 ) ) ( not ( = ?auto_162610 ?auto_162614 ) ) ( not ( = ?auto_162610 ?auto_162615 ) ) ( not ( = ?auto_162611 ?auto_162612 ) ) ( not ( = ?auto_162611 ?auto_162613 ) ) ( not ( = ?auto_162611 ?auto_162614 ) ) ( not ( = ?auto_162611 ?auto_162615 ) ) ( not ( = ?auto_162612 ?auto_162613 ) ) ( not ( = ?auto_162612 ?auto_162614 ) ) ( not ( = ?auto_162612 ?auto_162615 ) ) ( not ( = ?auto_162613 ?auto_162614 ) ) ( not ( = ?auto_162613 ?auto_162615 ) ) ( not ( = ?auto_162614 ?auto_162615 ) ) ( ON ?auto_162613 ?auto_162614 ) ( ON ?auto_162612 ?auto_162613 ) ( ON ?auto_162611 ?auto_162612 ) ( CLEAR ?auto_162609 ) ( ON ?auto_162610 ?auto_162611 ) ( CLEAR ?auto_162610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_162605 ?auto_162606 ?auto_162607 ?auto_162608 ?auto_162609 ?auto_162610 )
      ( MAKE-10PILE ?auto_162605 ?auto_162606 ?auto_162607 ?auto_162608 ?auto_162609 ?auto_162610 ?auto_162611 ?auto_162612 ?auto_162613 ?auto_162614 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162626 - BLOCK
      ?auto_162627 - BLOCK
      ?auto_162628 - BLOCK
      ?auto_162629 - BLOCK
      ?auto_162630 - BLOCK
      ?auto_162631 - BLOCK
      ?auto_162632 - BLOCK
      ?auto_162633 - BLOCK
      ?auto_162634 - BLOCK
      ?auto_162635 - BLOCK
    )
    :vars
    (
      ?auto_162636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162635 ?auto_162636 ) ( ON-TABLE ?auto_162626 ) ( ON ?auto_162627 ?auto_162626 ) ( ON ?auto_162628 ?auto_162627 ) ( ON ?auto_162629 ?auto_162628 ) ( not ( = ?auto_162626 ?auto_162627 ) ) ( not ( = ?auto_162626 ?auto_162628 ) ) ( not ( = ?auto_162626 ?auto_162629 ) ) ( not ( = ?auto_162626 ?auto_162630 ) ) ( not ( = ?auto_162626 ?auto_162631 ) ) ( not ( = ?auto_162626 ?auto_162632 ) ) ( not ( = ?auto_162626 ?auto_162633 ) ) ( not ( = ?auto_162626 ?auto_162634 ) ) ( not ( = ?auto_162626 ?auto_162635 ) ) ( not ( = ?auto_162626 ?auto_162636 ) ) ( not ( = ?auto_162627 ?auto_162628 ) ) ( not ( = ?auto_162627 ?auto_162629 ) ) ( not ( = ?auto_162627 ?auto_162630 ) ) ( not ( = ?auto_162627 ?auto_162631 ) ) ( not ( = ?auto_162627 ?auto_162632 ) ) ( not ( = ?auto_162627 ?auto_162633 ) ) ( not ( = ?auto_162627 ?auto_162634 ) ) ( not ( = ?auto_162627 ?auto_162635 ) ) ( not ( = ?auto_162627 ?auto_162636 ) ) ( not ( = ?auto_162628 ?auto_162629 ) ) ( not ( = ?auto_162628 ?auto_162630 ) ) ( not ( = ?auto_162628 ?auto_162631 ) ) ( not ( = ?auto_162628 ?auto_162632 ) ) ( not ( = ?auto_162628 ?auto_162633 ) ) ( not ( = ?auto_162628 ?auto_162634 ) ) ( not ( = ?auto_162628 ?auto_162635 ) ) ( not ( = ?auto_162628 ?auto_162636 ) ) ( not ( = ?auto_162629 ?auto_162630 ) ) ( not ( = ?auto_162629 ?auto_162631 ) ) ( not ( = ?auto_162629 ?auto_162632 ) ) ( not ( = ?auto_162629 ?auto_162633 ) ) ( not ( = ?auto_162629 ?auto_162634 ) ) ( not ( = ?auto_162629 ?auto_162635 ) ) ( not ( = ?auto_162629 ?auto_162636 ) ) ( not ( = ?auto_162630 ?auto_162631 ) ) ( not ( = ?auto_162630 ?auto_162632 ) ) ( not ( = ?auto_162630 ?auto_162633 ) ) ( not ( = ?auto_162630 ?auto_162634 ) ) ( not ( = ?auto_162630 ?auto_162635 ) ) ( not ( = ?auto_162630 ?auto_162636 ) ) ( not ( = ?auto_162631 ?auto_162632 ) ) ( not ( = ?auto_162631 ?auto_162633 ) ) ( not ( = ?auto_162631 ?auto_162634 ) ) ( not ( = ?auto_162631 ?auto_162635 ) ) ( not ( = ?auto_162631 ?auto_162636 ) ) ( not ( = ?auto_162632 ?auto_162633 ) ) ( not ( = ?auto_162632 ?auto_162634 ) ) ( not ( = ?auto_162632 ?auto_162635 ) ) ( not ( = ?auto_162632 ?auto_162636 ) ) ( not ( = ?auto_162633 ?auto_162634 ) ) ( not ( = ?auto_162633 ?auto_162635 ) ) ( not ( = ?auto_162633 ?auto_162636 ) ) ( not ( = ?auto_162634 ?auto_162635 ) ) ( not ( = ?auto_162634 ?auto_162636 ) ) ( not ( = ?auto_162635 ?auto_162636 ) ) ( ON ?auto_162634 ?auto_162635 ) ( ON ?auto_162633 ?auto_162634 ) ( ON ?auto_162632 ?auto_162633 ) ( ON ?auto_162631 ?auto_162632 ) ( CLEAR ?auto_162629 ) ( ON ?auto_162630 ?auto_162631 ) ( CLEAR ?auto_162630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162626 ?auto_162627 ?auto_162628 ?auto_162629 ?auto_162630 )
      ( MAKE-10PILE ?auto_162626 ?auto_162627 ?auto_162628 ?auto_162629 ?auto_162630 ?auto_162631 ?auto_162632 ?auto_162633 ?auto_162634 ?auto_162635 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162647 - BLOCK
      ?auto_162648 - BLOCK
      ?auto_162649 - BLOCK
      ?auto_162650 - BLOCK
      ?auto_162651 - BLOCK
      ?auto_162652 - BLOCK
      ?auto_162653 - BLOCK
      ?auto_162654 - BLOCK
      ?auto_162655 - BLOCK
      ?auto_162656 - BLOCK
    )
    :vars
    (
      ?auto_162657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162656 ?auto_162657 ) ( ON-TABLE ?auto_162647 ) ( ON ?auto_162648 ?auto_162647 ) ( ON ?auto_162649 ?auto_162648 ) ( ON ?auto_162650 ?auto_162649 ) ( not ( = ?auto_162647 ?auto_162648 ) ) ( not ( = ?auto_162647 ?auto_162649 ) ) ( not ( = ?auto_162647 ?auto_162650 ) ) ( not ( = ?auto_162647 ?auto_162651 ) ) ( not ( = ?auto_162647 ?auto_162652 ) ) ( not ( = ?auto_162647 ?auto_162653 ) ) ( not ( = ?auto_162647 ?auto_162654 ) ) ( not ( = ?auto_162647 ?auto_162655 ) ) ( not ( = ?auto_162647 ?auto_162656 ) ) ( not ( = ?auto_162647 ?auto_162657 ) ) ( not ( = ?auto_162648 ?auto_162649 ) ) ( not ( = ?auto_162648 ?auto_162650 ) ) ( not ( = ?auto_162648 ?auto_162651 ) ) ( not ( = ?auto_162648 ?auto_162652 ) ) ( not ( = ?auto_162648 ?auto_162653 ) ) ( not ( = ?auto_162648 ?auto_162654 ) ) ( not ( = ?auto_162648 ?auto_162655 ) ) ( not ( = ?auto_162648 ?auto_162656 ) ) ( not ( = ?auto_162648 ?auto_162657 ) ) ( not ( = ?auto_162649 ?auto_162650 ) ) ( not ( = ?auto_162649 ?auto_162651 ) ) ( not ( = ?auto_162649 ?auto_162652 ) ) ( not ( = ?auto_162649 ?auto_162653 ) ) ( not ( = ?auto_162649 ?auto_162654 ) ) ( not ( = ?auto_162649 ?auto_162655 ) ) ( not ( = ?auto_162649 ?auto_162656 ) ) ( not ( = ?auto_162649 ?auto_162657 ) ) ( not ( = ?auto_162650 ?auto_162651 ) ) ( not ( = ?auto_162650 ?auto_162652 ) ) ( not ( = ?auto_162650 ?auto_162653 ) ) ( not ( = ?auto_162650 ?auto_162654 ) ) ( not ( = ?auto_162650 ?auto_162655 ) ) ( not ( = ?auto_162650 ?auto_162656 ) ) ( not ( = ?auto_162650 ?auto_162657 ) ) ( not ( = ?auto_162651 ?auto_162652 ) ) ( not ( = ?auto_162651 ?auto_162653 ) ) ( not ( = ?auto_162651 ?auto_162654 ) ) ( not ( = ?auto_162651 ?auto_162655 ) ) ( not ( = ?auto_162651 ?auto_162656 ) ) ( not ( = ?auto_162651 ?auto_162657 ) ) ( not ( = ?auto_162652 ?auto_162653 ) ) ( not ( = ?auto_162652 ?auto_162654 ) ) ( not ( = ?auto_162652 ?auto_162655 ) ) ( not ( = ?auto_162652 ?auto_162656 ) ) ( not ( = ?auto_162652 ?auto_162657 ) ) ( not ( = ?auto_162653 ?auto_162654 ) ) ( not ( = ?auto_162653 ?auto_162655 ) ) ( not ( = ?auto_162653 ?auto_162656 ) ) ( not ( = ?auto_162653 ?auto_162657 ) ) ( not ( = ?auto_162654 ?auto_162655 ) ) ( not ( = ?auto_162654 ?auto_162656 ) ) ( not ( = ?auto_162654 ?auto_162657 ) ) ( not ( = ?auto_162655 ?auto_162656 ) ) ( not ( = ?auto_162655 ?auto_162657 ) ) ( not ( = ?auto_162656 ?auto_162657 ) ) ( ON ?auto_162655 ?auto_162656 ) ( ON ?auto_162654 ?auto_162655 ) ( ON ?auto_162653 ?auto_162654 ) ( ON ?auto_162652 ?auto_162653 ) ( CLEAR ?auto_162650 ) ( ON ?auto_162651 ?auto_162652 ) ( CLEAR ?auto_162651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_162647 ?auto_162648 ?auto_162649 ?auto_162650 ?auto_162651 )
      ( MAKE-10PILE ?auto_162647 ?auto_162648 ?auto_162649 ?auto_162650 ?auto_162651 ?auto_162652 ?auto_162653 ?auto_162654 ?auto_162655 ?auto_162656 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162668 - BLOCK
      ?auto_162669 - BLOCK
      ?auto_162670 - BLOCK
      ?auto_162671 - BLOCK
      ?auto_162672 - BLOCK
      ?auto_162673 - BLOCK
      ?auto_162674 - BLOCK
      ?auto_162675 - BLOCK
      ?auto_162676 - BLOCK
      ?auto_162677 - BLOCK
    )
    :vars
    (
      ?auto_162678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162677 ?auto_162678 ) ( ON-TABLE ?auto_162668 ) ( ON ?auto_162669 ?auto_162668 ) ( ON ?auto_162670 ?auto_162669 ) ( not ( = ?auto_162668 ?auto_162669 ) ) ( not ( = ?auto_162668 ?auto_162670 ) ) ( not ( = ?auto_162668 ?auto_162671 ) ) ( not ( = ?auto_162668 ?auto_162672 ) ) ( not ( = ?auto_162668 ?auto_162673 ) ) ( not ( = ?auto_162668 ?auto_162674 ) ) ( not ( = ?auto_162668 ?auto_162675 ) ) ( not ( = ?auto_162668 ?auto_162676 ) ) ( not ( = ?auto_162668 ?auto_162677 ) ) ( not ( = ?auto_162668 ?auto_162678 ) ) ( not ( = ?auto_162669 ?auto_162670 ) ) ( not ( = ?auto_162669 ?auto_162671 ) ) ( not ( = ?auto_162669 ?auto_162672 ) ) ( not ( = ?auto_162669 ?auto_162673 ) ) ( not ( = ?auto_162669 ?auto_162674 ) ) ( not ( = ?auto_162669 ?auto_162675 ) ) ( not ( = ?auto_162669 ?auto_162676 ) ) ( not ( = ?auto_162669 ?auto_162677 ) ) ( not ( = ?auto_162669 ?auto_162678 ) ) ( not ( = ?auto_162670 ?auto_162671 ) ) ( not ( = ?auto_162670 ?auto_162672 ) ) ( not ( = ?auto_162670 ?auto_162673 ) ) ( not ( = ?auto_162670 ?auto_162674 ) ) ( not ( = ?auto_162670 ?auto_162675 ) ) ( not ( = ?auto_162670 ?auto_162676 ) ) ( not ( = ?auto_162670 ?auto_162677 ) ) ( not ( = ?auto_162670 ?auto_162678 ) ) ( not ( = ?auto_162671 ?auto_162672 ) ) ( not ( = ?auto_162671 ?auto_162673 ) ) ( not ( = ?auto_162671 ?auto_162674 ) ) ( not ( = ?auto_162671 ?auto_162675 ) ) ( not ( = ?auto_162671 ?auto_162676 ) ) ( not ( = ?auto_162671 ?auto_162677 ) ) ( not ( = ?auto_162671 ?auto_162678 ) ) ( not ( = ?auto_162672 ?auto_162673 ) ) ( not ( = ?auto_162672 ?auto_162674 ) ) ( not ( = ?auto_162672 ?auto_162675 ) ) ( not ( = ?auto_162672 ?auto_162676 ) ) ( not ( = ?auto_162672 ?auto_162677 ) ) ( not ( = ?auto_162672 ?auto_162678 ) ) ( not ( = ?auto_162673 ?auto_162674 ) ) ( not ( = ?auto_162673 ?auto_162675 ) ) ( not ( = ?auto_162673 ?auto_162676 ) ) ( not ( = ?auto_162673 ?auto_162677 ) ) ( not ( = ?auto_162673 ?auto_162678 ) ) ( not ( = ?auto_162674 ?auto_162675 ) ) ( not ( = ?auto_162674 ?auto_162676 ) ) ( not ( = ?auto_162674 ?auto_162677 ) ) ( not ( = ?auto_162674 ?auto_162678 ) ) ( not ( = ?auto_162675 ?auto_162676 ) ) ( not ( = ?auto_162675 ?auto_162677 ) ) ( not ( = ?auto_162675 ?auto_162678 ) ) ( not ( = ?auto_162676 ?auto_162677 ) ) ( not ( = ?auto_162676 ?auto_162678 ) ) ( not ( = ?auto_162677 ?auto_162678 ) ) ( ON ?auto_162676 ?auto_162677 ) ( ON ?auto_162675 ?auto_162676 ) ( ON ?auto_162674 ?auto_162675 ) ( ON ?auto_162673 ?auto_162674 ) ( ON ?auto_162672 ?auto_162673 ) ( CLEAR ?auto_162670 ) ( ON ?auto_162671 ?auto_162672 ) ( CLEAR ?auto_162671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162668 ?auto_162669 ?auto_162670 ?auto_162671 )
      ( MAKE-10PILE ?auto_162668 ?auto_162669 ?auto_162670 ?auto_162671 ?auto_162672 ?auto_162673 ?auto_162674 ?auto_162675 ?auto_162676 ?auto_162677 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162689 - BLOCK
      ?auto_162690 - BLOCK
      ?auto_162691 - BLOCK
      ?auto_162692 - BLOCK
      ?auto_162693 - BLOCK
      ?auto_162694 - BLOCK
      ?auto_162695 - BLOCK
      ?auto_162696 - BLOCK
      ?auto_162697 - BLOCK
      ?auto_162698 - BLOCK
    )
    :vars
    (
      ?auto_162699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162698 ?auto_162699 ) ( ON-TABLE ?auto_162689 ) ( ON ?auto_162690 ?auto_162689 ) ( ON ?auto_162691 ?auto_162690 ) ( not ( = ?auto_162689 ?auto_162690 ) ) ( not ( = ?auto_162689 ?auto_162691 ) ) ( not ( = ?auto_162689 ?auto_162692 ) ) ( not ( = ?auto_162689 ?auto_162693 ) ) ( not ( = ?auto_162689 ?auto_162694 ) ) ( not ( = ?auto_162689 ?auto_162695 ) ) ( not ( = ?auto_162689 ?auto_162696 ) ) ( not ( = ?auto_162689 ?auto_162697 ) ) ( not ( = ?auto_162689 ?auto_162698 ) ) ( not ( = ?auto_162689 ?auto_162699 ) ) ( not ( = ?auto_162690 ?auto_162691 ) ) ( not ( = ?auto_162690 ?auto_162692 ) ) ( not ( = ?auto_162690 ?auto_162693 ) ) ( not ( = ?auto_162690 ?auto_162694 ) ) ( not ( = ?auto_162690 ?auto_162695 ) ) ( not ( = ?auto_162690 ?auto_162696 ) ) ( not ( = ?auto_162690 ?auto_162697 ) ) ( not ( = ?auto_162690 ?auto_162698 ) ) ( not ( = ?auto_162690 ?auto_162699 ) ) ( not ( = ?auto_162691 ?auto_162692 ) ) ( not ( = ?auto_162691 ?auto_162693 ) ) ( not ( = ?auto_162691 ?auto_162694 ) ) ( not ( = ?auto_162691 ?auto_162695 ) ) ( not ( = ?auto_162691 ?auto_162696 ) ) ( not ( = ?auto_162691 ?auto_162697 ) ) ( not ( = ?auto_162691 ?auto_162698 ) ) ( not ( = ?auto_162691 ?auto_162699 ) ) ( not ( = ?auto_162692 ?auto_162693 ) ) ( not ( = ?auto_162692 ?auto_162694 ) ) ( not ( = ?auto_162692 ?auto_162695 ) ) ( not ( = ?auto_162692 ?auto_162696 ) ) ( not ( = ?auto_162692 ?auto_162697 ) ) ( not ( = ?auto_162692 ?auto_162698 ) ) ( not ( = ?auto_162692 ?auto_162699 ) ) ( not ( = ?auto_162693 ?auto_162694 ) ) ( not ( = ?auto_162693 ?auto_162695 ) ) ( not ( = ?auto_162693 ?auto_162696 ) ) ( not ( = ?auto_162693 ?auto_162697 ) ) ( not ( = ?auto_162693 ?auto_162698 ) ) ( not ( = ?auto_162693 ?auto_162699 ) ) ( not ( = ?auto_162694 ?auto_162695 ) ) ( not ( = ?auto_162694 ?auto_162696 ) ) ( not ( = ?auto_162694 ?auto_162697 ) ) ( not ( = ?auto_162694 ?auto_162698 ) ) ( not ( = ?auto_162694 ?auto_162699 ) ) ( not ( = ?auto_162695 ?auto_162696 ) ) ( not ( = ?auto_162695 ?auto_162697 ) ) ( not ( = ?auto_162695 ?auto_162698 ) ) ( not ( = ?auto_162695 ?auto_162699 ) ) ( not ( = ?auto_162696 ?auto_162697 ) ) ( not ( = ?auto_162696 ?auto_162698 ) ) ( not ( = ?auto_162696 ?auto_162699 ) ) ( not ( = ?auto_162697 ?auto_162698 ) ) ( not ( = ?auto_162697 ?auto_162699 ) ) ( not ( = ?auto_162698 ?auto_162699 ) ) ( ON ?auto_162697 ?auto_162698 ) ( ON ?auto_162696 ?auto_162697 ) ( ON ?auto_162695 ?auto_162696 ) ( ON ?auto_162694 ?auto_162695 ) ( ON ?auto_162693 ?auto_162694 ) ( CLEAR ?auto_162691 ) ( ON ?auto_162692 ?auto_162693 ) ( CLEAR ?auto_162692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_162689 ?auto_162690 ?auto_162691 ?auto_162692 )
      ( MAKE-10PILE ?auto_162689 ?auto_162690 ?auto_162691 ?auto_162692 ?auto_162693 ?auto_162694 ?auto_162695 ?auto_162696 ?auto_162697 ?auto_162698 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162710 - BLOCK
      ?auto_162711 - BLOCK
      ?auto_162712 - BLOCK
      ?auto_162713 - BLOCK
      ?auto_162714 - BLOCK
      ?auto_162715 - BLOCK
      ?auto_162716 - BLOCK
      ?auto_162717 - BLOCK
      ?auto_162718 - BLOCK
      ?auto_162719 - BLOCK
    )
    :vars
    (
      ?auto_162720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162719 ?auto_162720 ) ( ON-TABLE ?auto_162710 ) ( ON ?auto_162711 ?auto_162710 ) ( not ( = ?auto_162710 ?auto_162711 ) ) ( not ( = ?auto_162710 ?auto_162712 ) ) ( not ( = ?auto_162710 ?auto_162713 ) ) ( not ( = ?auto_162710 ?auto_162714 ) ) ( not ( = ?auto_162710 ?auto_162715 ) ) ( not ( = ?auto_162710 ?auto_162716 ) ) ( not ( = ?auto_162710 ?auto_162717 ) ) ( not ( = ?auto_162710 ?auto_162718 ) ) ( not ( = ?auto_162710 ?auto_162719 ) ) ( not ( = ?auto_162710 ?auto_162720 ) ) ( not ( = ?auto_162711 ?auto_162712 ) ) ( not ( = ?auto_162711 ?auto_162713 ) ) ( not ( = ?auto_162711 ?auto_162714 ) ) ( not ( = ?auto_162711 ?auto_162715 ) ) ( not ( = ?auto_162711 ?auto_162716 ) ) ( not ( = ?auto_162711 ?auto_162717 ) ) ( not ( = ?auto_162711 ?auto_162718 ) ) ( not ( = ?auto_162711 ?auto_162719 ) ) ( not ( = ?auto_162711 ?auto_162720 ) ) ( not ( = ?auto_162712 ?auto_162713 ) ) ( not ( = ?auto_162712 ?auto_162714 ) ) ( not ( = ?auto_162712 ?auto_162715 ) ) ( not ( = ?auto_162712 ?auto_162716 ) ) ( not ( = ?auto_162712 ?auto_162717 ) ) ( not ( = ?auto_162712 ?auto_162718 ) ) ( not ( = ?auto_162712 ?auto_162719 ) ) ( not ( = ?auto_162712 ?auto_162720 ) ) ( not ( = ?auto_162713 ?auto_162714 ) ) ( not ( = ?auto_162713 ?auto_162715 ) ) ( not ( = ?auto_162713 ?auto_162716 ) ) ( not ( = ?auto_162713 ?auto_162717 ) ) ( not ( = ?auto_162713 ?auto_162718 ) ) ( not ( = ?auto_162713 ?auto_162719 ) ) ( not ( = ?auto_162713 ?auto_162720 ) ) ( not ( = ?auto_162714 ?auto_162715 ) ) ( not ( = ?auto_162714 ?auto_162716 ) ) ( not ( = ?auto_162714 ?auto_162717 ) ) ( not ( = ?auto_162714 ?auto_162718 ) ) ( not ( = ?auto_162714 ?auto_162719 ) ) ( not ( = ?auto_162714 ?auto_162720 ) ) ( not ( = ?auto_162715 ?auto_162716 ) ) ( not ( = ?auto_162715 ?auto_162717 ) ) ( not ( = ?auto_162715 ?auto_162718 ) ) ( not ( = ?auto_162715 ?auto_162719 ) ) ( not ( = ?auto_162715 ?auto_162720 ) ) ( not ( = ?auto_162716 ?auto_162717 ) ) ( not ( = ?auto_162716 ?auto_162718 ) ) ( not ( = ?auto_162716 ?auto_162719 ) ) ( not ( = ?auto_162716 ?auto_162720 ) ) ( not ( = ?auto_162717 ?auto_162718 ) ) ( not ( = ?auto_162717 ?auto_162719 ) ) ( not ( = ?auto_162717 ?auto_162720 ) ) ( not ( = ?auto_162718 ?auto_162719 ) ) ( not ( = ?auto_162718 ?auto_162720 ) ) ( not ( = ?auto_162719 ?auto_162720 ) ) ( ON ?auto_162718 ?auto_162719 ) ( ON ?auto_162717 ?auto_162718 ) ( ON ?auto_162716 ?auto_162717 ) ( ON ?auto_162715 ?auto_162716 ) ( ON ?auto_162714 ?auto_162715 ) ( ON ?auto_162713 ?auto_162714 ) ( CLEAR ?auto_162711 ) ( ON ?auto_162712 ?auto_162713 ) ( CLEAR ?auto_162712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162710 ?auto_162711 ?auto_162712 )
      ( MAKE-10PILE ?auto_162710 ?auto_162711 ?auto_162712 ?auto_162713 ?auto_162714 ?auto_162715 ?auto_162716 ?auto_162717 ?auto_162718 ?auto_162719 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162731 - BLOCK
      ?auto_162732 - BLOCK
      ?auto_162733 - BLOCK
      ?auto_162734 - BLOCK
      ?auto_162735 - BLOCK
      ?auto_162736 - BLOCK
      ?auto_162737 - BLOCK
      ?auto_162738 - BLOCK
      ?auto_162739 - BLOCK
      ?auto_162740 - BLOCK
    )
    :vars
    (
      ?auto_162741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162740 ?auto_162741 ) ( ON-TABLE ?auto_162731 ) ( ON ?auto_162732 ?auto_162731 ) ( not ( = ?auto_162731 ?auto_162732 ) ) ( not ( = ?auto_162731 ?auto_162733 ) ) ( not ( = ?auto_162731 ?auto_162734 ) ) ( not ( = ?auto_162731 ?auto_162735 ) ) ( not ( = ?auto_162731 ?auto_162736 ) ) ( not ( = ?auto_162731 ?auto_162737 ) ) ( not ( = ?auto_162731 ?auto_162738 ) ) ( not ( = ?auto_162731 ?auto_162739 ) ) ( not ( = ?auto_162731 ?auto_162740 ) ) ( not ( = ?auto_162731 ?auto_162741 ) ) ( not ( = ?auto_162732 ?auto_162733 ) ) ( not ( = ?auto_162732 ?auto_162734 ) ) ( not ( = ?auto_162732 ?auto_162735 ) ) ( not ( = ?auto_162732 ?auto_162736 ) ) ( not ( = ?auto_162732 ?auto_162737 ) ) ( not ( = ?auto_162732 ?auto_162738 ) ) ( not ( = ?auto_162732 ?auto_162739 ) ) ( not ( = ?auto_162732 ?auto_162740 ) ) ( not ( = ?auto_162732 ?auto_162741 ) ) ( not ( = ?auto_162733 ?auto_162734 ) ) ( not ( = ?auto_162733 ?auto_162735 ) ) ( not ( = ?auto_162733 ?auto_162736 ) ) ( not ( = ?auto_162733 ?auto_162737 ) ) ( not ( = ?auto_162733 ?auto_162738 ) ) ( not ( = ?auto_162733 ?auto_162739 ) ) ( not ( = ?auto_162733 ?auto_162740 ) ) ( not ( = ?auto_162733 ?auto_162741 ) ) ( not ( = ?auto_162734 ?auto_162735 ) ) ( not ( = ?auto_162734 ?auto_162736 ) ) ( not ( = ?auto_162734 ?auto_162737 ) ) ( not ( = ?auto_162734 ?auto_162738 ) ) ( not ( = ?auto_162734 ?auto_162739 ) ) ( not ( = ?auto_162734 ?auto_162740 ) ) ( not ( = ?auto_162734 ?auto_162741 ) ) ( not ( = ?auto_162735 ?auto_162736 ) ) ( not ( = ?auto_162735 ?auto_162737 ) ) ( not ( = ?auto_162735 ?auto_162738 ) ) ( not ( = ?auto_162735 ?auto_162739 ) ) ( not ( = ?auto_162735 ?auto_162740 ) ) ( not ( = ?auto_162735 ?auto_162741 ) ) ( not ( = ?auto_162736 ?auto_162737 ) ) ( not ( = ?auto_162736 ?auto_162738 ) ) ( not ( = ?auto_162736 ?auto_162739 ) ) ( not ( = ?auto_162736 ?auto_162740 ) ) ( not ( = ?auto_162736 ?auto_162741 ) ) ( not ( = ?auto_162737 ?auto_162738 ) ) ( not ( = ?auto_162737 ?auto_162739 ) ) ( not ( = ?auto_162737 ?auto_162740 ) ) ( not ( = ?auto_162737 ?auto_162741 ) ) ( not ( = ?auto_162738 ?auto_162739 ) ) ( not ( = ?auto_162738 ?auto_162740 ) ) ( not ( = ?auto_162738 ?auto_162741 ) ) ( not ( = ?auto_162739 ?auto_162740 ) ) ( not ( = ?auto_162739 ?auto_162741 ) ) ( not ( = ?auto_162740 ?auto_162741 ) ) ( ON ?auto_162739 ?auto_162740 ) ( ON ?auto_162738 ?auto_162739 ) ( ON ?auto_162737 ?auto_162738 ) ( ON ?auto_162736 ?auto_162737 ) ( ON ?auto_162735 ?auto_162736 ) ( ON ?auto_162734 ?auto_162735 ) ( CLEAR ?auto_162732 ) ( ON ?auto_162733 ?auto_162734 ) ( CLEAR ?auto_162733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_162731 ?auto_162732 ?auto_162733 )
      ( MAKE-10PILE ?auto_162731 ?auto_162732 ?auto_162733 ?auto_162734 ?auto_162735 ?auto_162736 ?auto_162737 ?auto_162738 ?auto_162739 ?auto_162740 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162752 - BLOCK
      ?auto_162753 - BLOCK
      ?auto_162754 - BLOCK
      ?auto_162755 - BLOCK
      ?auto_162756 - BLOCK
      ?auto_162757 - BLOCK
      ?auto_162758 - BLOCK
      ?auto_162759 - BLOCK
      ?auto_162760 - BLOCK
      ?auto_162761 - BLOCK
    )
    :vars
    (
      ?auto_162762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162761 ?auto_162762 ) ( ON-TABLE ?auto_162752 ) ( not ( = ?auto_162752 ?auto_162753 ) ) ( not ( = ?auto_162752 ?auto_162754 ) ) ( not ( = ?auto_162752 ?auto_162755 ) ) ( not ( = ?auto_162752 ?auto_162756 ) ) ( not ( = ?auto_162752 ?auto_162757 ) ) ( not ( = ?auto_162752 ?auto_162758 ) ) ( not ( = ?auto_162752 ?auto_162759 ) ) ( not ( = ?auto_162752 ?auto_162760 ) ) ( not ( = ?auto_162752 ?auto_162761 ) ) ( not ( = ?auto_162752 ?auto_162762 ) ) ( not ( = ?auto_162753 ?auto_162754 ) ) ( not ( = ?auto_162753 ?auto_162755 ) ) ( not ( = ?auto_162753 ?auto_162756 ) ) ( not ( = ?auto_162753 ?auto_162757 ) ) ( not ( = ?auto_162753 ?auto_162758 ) ) ( not ( = ?auto_162753 ?auto_162759 ) ) ( not ( = ?auto_162753 ?auto_162760 ) ) ( not ( = ?auto_162753 ?auto_162761 ) ) ( not ( = ?auto_162753 ?auto_162762 ) ) ( not ( = ?auto_162754 ?auto_162755 ) ) ( not ( = ?auto_162754 ?auto_162756 ) ) ( not ( = ?auto_162754 ?auto_162757 ) ) ( not ( = ?auto_162754 ?auto_162758 ) ) ( not ( = ?auto_162754 ?auto_162759 ) ) ( not ( = ?auto_162754 ?auto_162760 ) ) ( not ( = ?auto_162754 ?auto_162761 ) ) ( not ( = ?auto_162754 ?auto_162762 ) ) ( not ( = ?auto_162755 ?auto_162756 ) ) ( not ( = ?auto_162755 ?auto_162757 ) ) ( not ( = ?auto_162755 ?auto_162758 ) ) ( not ( = ?auto_162755 ?auto_162759 ) ) ( not ( = ?auto_162755 ?auto_162760 ) ) ( not ( = ?auto_162755 ?auto_162761 ) ) ( not ( = ?auto_162755 ?auto_162762 ) ) ( not ( = ?auto_162756 ?auto_162757 ) ) ( not ( = ?auto_162756 ?auto_162758 ) ) ( not ( = ?auto_162756 ?auto_162759 ) ) ( not ( = ?auto_162756 ?auto_162760 ) ) ( not ( = ?auto_162756 ?auto_162761 ) ) ( not ( = ?auto_162756 ?auto_162762 ) ) ( not ( = ?auto_162757 ?auto_162758 ) ) ( not ( = ?auto_162757 ?auto_162759 ) ) ( not ( = ?auto_162757 ?auto_162760 ) ) ( not ( = ?auto_162757 ?auto_162761 ) ) ( not ( = ?auto_162757 ?auto_162762 ) ) ( not ( = ?auto_162758 ?auto_162759 ) ) ( not ( = ?auto_162758 ?auto_162760 ) ) ( not ( = ?auto_162758 ?auto_162761 ) ) ( not ( = ?auto_162758 ?auto_162762 ) ) ( not ( = ?auto_162759 ?auto_162760 ) ) ( not ( = ?auto_162759 ?auto_162761 ) ) ( not ( = ?auto_162759 ?auto_162762 ) ) ( not ( = ?auto_162760 ?auto_162761 ) ) ( not ( = ?auto_162760 ?auto_162762 ) ) ( not ( = ?auto_162761 ?auto_162762 ) ) ( ON ?auto_162760 ?auto_162761 ) ( ON ?auto_162759 ?auto_162760 ) ( ON ?auto_162758 ?auto_162759 ) ( ON ?auto_162757 ?auto_162758 ) ( ON ?auto_162756 ?auto_162757 ) ( ON ?auto_162755 ?auto_162756 ) ( ON ?auto_162754 ?auto_162755 ) ( CLEAR ?auto_162752 ) ( ON ?auto_162753 ?auto_162754 ) ( CLEAR ?auto_162753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162752 ?auto_162753 )
      ( MAKE-10PILE ?auto_162752 ?auto_162753 ?auto_162754 ?auto_162755 ?auto_162756 ?auto_162757 ?auto_162758 ?auto_162759 ?auto_162760 ?auto_162761 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162773 - BLOCK
      ?auto_162774 - BLOCK
      ?auto_162775 - BLOCK
      ?auto_162776 - BLOCK
      ?auto_162777 - BLOCK
      ?auto_162778 - BLOCK
      ?auto_162779 - BLOCK
      ?auto_162780 - BLOCK
      ?auto_162781 - BLOCK
      ?auto_162782 - BLOCK
    )
    :vars
    (
      ?auto_162783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162782 ?auto_162783 ) ( ON-TABLE ?auto_162773 ) ( not ( = ?auto_162773 ?auto_162774 ) ) ( not ( = ?auto_162773 ?auto_162775 ) ) ( not ( = ?auto_162773 ?auto_162776 ) ) ( not ( = ?auto_162773 ?auto_162777 ) ) ( not ( = ?auto_162773 ?auto_162778 ) ) ( not ( = ?auto_162773 ?auto_162779 ) ) ( not ( = ?auto_162773 ?auto_162780 ) ) ( not ( = ?auto_162773 ?auto_162781 ) ) ( not ( = ?auto_162773 ?auto_162782 ) ) ( not ( = ?auto_162773 ?auto_162783 ) ) ( not ( = ?auto_162774 ?auto_162775 ) ) ( not ( = ?auto_162774 ?auto_162776 ) ) ( not ( = ?auto_162774 ?auto_162777 ) ) ( not ( = ?auto_162774 ?auto_162778 ) ) ( not ( = ?auto_162774 ?auto_162779 ) ) ( not ( = ?auto_162774 ?auto_162780 ) ) ( not ( = ?auto_162774 ?auto_162781 ) ) ( not ( = ?auto_162774 ?auto_162782 ) ) ( not ( = ?auto_162774 ?auto_162783 ) ) ( not ( = ?auto_162775 ?auto_162776 ) ) ( not ( = ?auto_162775 ?auto_162777 ) ) ( not ( = ?auto_162775 ?auto_162778 ) ) ( not ( = ?auto_162775 ?auto_162779 ) ) ( not ( = ?auto_162775 ?auto_162780 ) ) ( not ( = ?auto_162775 ?auto_162781 ) ) ( not ( = ?auto_162775 ?auto_162782 ) ) ( not ( = ?auto_162775 ?auto_162783 ) ) ( not ( = ?auto_162776 ?auto_162777 ) ) ( not ( = ?auto_162776 ?auto_162778 ) ) ( not ( = ?auto_162776 ?auto_162779 ) ) ( not ( = ?auto_162776 ?auto_162780 ) ) ( not ( = ?auto_162776 ?auto_162781 ) ) ( not ( = ?auto_162776 ?auto_162782 ) ) ( not ( = ?auto_162776 ?auto_162783 ) ) ( not ( = ?auto_162777 ?auto_162778 ) ) ( not ( = ?auto_162777 ?auto_162779 ) ) ( not ( = ?auto_162777 ?auto_162780 ) ) ( not ( = ?auto_162777 ?auto_162781 ) ) ( not ( = ?auto_162777 ?auto_162782 ) ) ( not ( = ?auto_162777 ?auto_162783 ) ) ( not ( = ?auto_162778 ?auto_162779 ) ) ( not ( = ?auto_162778 ?auto_162780 ) ) ( not ( = ?auto_162778 ?auto_162781 ) ) ( not ( = ?auto_162778 ?auto_162782 ) ) ( not ( = ?auto_162778 ?auto_162783 ) ) ( not ( = ?auto_162779 ?auto_162780 ) ) ( not ( = ?auto_162779 ?auto_162781 ) ) ( not ( = ?auto_162779 ?auto_162782 ) ) ( not ( = ?auto_162779 ?auto_162783 ) ) ( not ( = ?auto_162780 ?auto_162781 ) ) ( not ( = ?auto_162780 ?auto_162782 ) ) ( not ( = ?auto_162780 ?auto_162783 ) ) ( not ( = ?auto_162781 ?auto_162782 ) ) ( not ( = ?auto_162781 ?auto_162783 ) ) ( not ( = ?auto_162782 ?auto_162783 ) ) ( ON ?auto_162781 ?auto_162782 ) ( ON ?auto_162780 ?auto_162781 ) ( ON ?auto_162779 ?auto_162780 ) ( ON ?auto_162778 ?auto_162779 ) ( ON ?auto_162777 ?auto_162778 ) ( ON ?auto_162776 ?auto_162777 ) ( ON ?auto_162775 ?auto_162776 ) ( CLEAR ?auto_162773 ) ( ON ?auto_162774 ?auto_162775 ) ( CLEAR ?auto_162774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_162773 ?auto_162774 )
      ( MAKE-10PILE ?auto_162773 ?auto_162774 ?auto_162775 ?auto_162776 ?auto_162777 ?auto_162778 ?auto_162779 ?auto_162780 ?auto_162781 ?auto_162782 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162794 - BLOCK
      ?auto_162795 - BLOCK
      ?auto_162796 - BLOCK
      ?auto_162797 - BLOCK
      ?auto_162798 - BLOCK
      ?auto_162799 - BLOCK
      ?auto_162800 - BLOCK
      ?auto_162801 - BLOCK
      ?auto_162802 - BLOCK
      ?auto_162803 - BLOCK
    )
    :vars
    (
      ?auto_162804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162803 ?auto_162804 ) ( not ( = ?auto_162794 ?auto_162795 ) ) ( not ( = ?auto_162794 ?auto_162796 ) ) ( not ( = ?auto_162794 ?auto_162797 ) ) ( not ( = ?auto_162794 ?auto_162798 ) ) ( not ( = ?auto_162794 ?auto_162799 ) ) ( not ( = ?auto_162794 ?auto_162800 ) ) ( not ( = ?auto_162794 ?auto_162801 ) ) ( not ( = ?auto_162794 ?auto_162802 ) ) ( not ( = ?auto_162794 ?auto_162803 ) ) ( not ( = ?auto_162794 ?auto_162804 ) ) ( not ( = ?auto_162795 ?auto_162796 ) ) ( not ( = ?auto_162795 ?auto_162797 ) ) ( not ( = ?auto_162795 ?auto_162798 ) ) ( not ( = ?auto_162795 ?auto_162799 ) ) ( not ( = ?auto_162795 ?auto_162800 ) ) ( not ( = ?auto_162795 ?auto_162801 ) ) ( not ( = ?auto_162795 ?auto_162802 ) ) ( not ( = ?auto_162795 ?auto_162803 ) ) ( not ( = ?auto_162795 ?auto_162804 ) ) ( not ( = ?auto_162796 ?auto_162797 ) ) ( not ( = ?auto_162796 ?auto_162798 ) ) ( not ( = ?auto_162796 ?auto_162799 ) ) ( not ( = ?auto_162796 ?auto_162800 ) ) ( not ( = ?auto_162796 ?auto_162801 ) ) ( not ( = ?auto_162796 ?auto_162802 ) ) ( not ( = ?auto_162796 ?auto_162803 ) ) ( not ( = ?auto_162796 ?auto_162804 ) ) ( not ( = ?auto_162797 ?auto_162798 ) ) ( not ( = ?auto_162797 ?auto_162799 ) ) ( not ( = ?auto_162797 ?auto_162800 ) ) ( not ( = ?auto_162797 ?auto_162801 ) ) ( not ( = ?auto_162797 ?auto_162802 ) ) ( not ( = ?auto_162797 ?auto_162803 ) ) ( not ( = ?auto_162797 ?auto_162804 ) ) ( not ( = ?auto_162798 ?auto_162799 ) ) ( not ( = ?auto_162798 ?auto_162800 ) ) ( not ( = ?auto_162798 ?auto_162801 ) ) ( not ( = ?auto_162798 ?auto_162802 ) ) ( not ( = ?auto_162798 ?auto_162803 ) ) ( not ( = ?auto_162798 ?auto_162804 ) ) ( not ( = ?auto_162799 ?auto_162800 ) ) ( not ( = ?auto_162799 ?auto_162801 ) ) ( not ( = ?auto_162799 ?auto_162802 ) ) ( not ( = ?auto_162799 ?auto_162803 ) ) ( not ( = ?auto_162799 ?auto_162804 ) ) ( not ( = ?auto_162800 ?auto_162801 ) ) ( not ( = ?auto_162800 ?auto_162802 ) ) ( not ( = ?auto_162800 ?auto_162803 ) ) ( not ( = ?auto_162800 ?auto_162804 ) ) ( not ( = ?auto_162801 ?auto_162802 ) ) ( not ( = ?auto_162801 ?auto_162803 ) ) ( not ( = ?auto_162801 ?auto_162804 ) ) ( not ( = ?auto_162802 ?auto_162803 ) ) ( not ( = ?auto_162802 ?auto_162804 ) ) ( not ( = ?auto_162803 ?auto_162804 ) ) ( ON ?auto_162802 ?auto_162803 ) ( ON ?auto_162801 ?auto_162802 ) ( ON ?auto_162800 ?auto_162801 ) ( ON ?auto_162799 ?auto_162800 ) ( ON ?auto_162798 ?auto_162799 ) ( ON ?auto_162797 ?auto_162798 ) ( ON ?auto_162796 ?auto_162797 ) ( ON ?auto_162795 ?auto_162796 ) ( ON ?auto_162794 ?auto_162795 ) ( CLEAR ?auto_162794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162794 )
      ( MAKE-10PILE ?auto_162794 ?auto_162795 ?auto_162796 ?auto_162797 ?auto_162798 ?auto_162799 ?auto_162800 ?auto_162801 ?auto_162802 ?auto_162803 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_162815 - BLOCK
      ?auto_162816 - BLOCK
      ?auto_162817 - BLOCK
      ?auto_162818 - BLOCK
      ?auto_162819 - BLOCK
      ?auto_162820 - BLOCK
      ?auto_162821 - BLOCK
      ?auto_162822 - BLOCK
      ?auto_162823 - BLOCK
      ?auto_162824 - BLOCK
    )
    :vars
    (
      ?auto_162825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162824 ?auto_162825 ) ( not ( = ?auto_162815 ?auto_162816 ) ) ( not ( = ?auto_162815 ?auto_162817 ) ) ( not ( = ?auto_162815 ?auto_162818 ) ) ( not ( = ?auto_162815 ?auto_162819 ) ) ( not ( = ?auto_162815 ?auto_162820 ) ) ( not ( = ?auto_162815 ?auto_162821 ) ) ( not ( = ?auto_162815 ?auto_162822 ) ) ( not ( = ?auto_162815 ?auto_162823 ) ) ( not ( = ?auto_162815 ?auto_162824 ) ) ( not ( = ?auto_162815 ?auto_162825 ) ) ( not ( = ?auto_162816 ?auto_162817 ) ) ( not ( = ?auto_162816 ?auto_162818 ) ) ( not ( = ?auto_162816 ?auto_162819 ) ) ( not ( = ?auto_162816 ?auto_162820 ) ) ( not ( = ?auto_162816 ?auto_162821 ) ) ( not ( = ?auto_162816 ?auto_162822 ) ) ( not ( = ?auto_162816 ?auto_162823 ) ) ( not ( = ?auto_162816 ?auto_162824 ) ) ( not ( = ?auto_162816 ?auto_162825 ) ) ( not ( = ?auto_162817 ?auto_162818 ) ) ( not ( = ?auto_162817 ?auto_162819 ) ) ( not ( = ?auto_162817 ?auto_162820 ) ) ( not ( = ?auto_162817 ?auto_162821 ) ) ( not ( = ?auto_162817 ?auto_162822 ) ) ( not ( = ?auto_162817 ?auto_162823 ) ) ( not ( = ?auto_162817 ?auto_162824 ) ) ( not ( = ?auto_162817 ?auto_162825 ) ) ( not ( = ?auto_162818 ?auto_162819 ) ) ( not ( = ?auto_162818 ?auto_162820 ) ) ( not ( = ?auto_162818 ?auto_162821 ) ) ( not ( = ?auto_162818 ?auto_162822 ) ) ( not ( = ?auto_162818 ?auto_162823 ) ) ( not ( = ?auto_162818 ?auto_162824 ) ) ( not ( = ?auto_162818 ?auto_162825 ) ) ( not ( = ?auto_162819 ?auto_162820 ) ) ( not ( = ?auto_162819 ?auto_162821 ) ) ( not ( = ?auto_162819 ?auto_162822 ) ) ( not ( = ?auto_162819 ?auto_162823 ) ) ( not ( = ?auto_162819 ?auto_162824 ) ) ( not ( = ?auto_162819 ?auto_162825 ) ) ( not ( = ?auto_162820 ?auto_162821 ) ) ( not ( = ?auto_162820 ?auto_162822 ) ) ( not ( = ?auto_162820 ?auto_162823 ) ) ( not ( = ?auto_162820 ?auto_162824 ) ) ( not ( = ?auto_162820 ?auto_162825 ) ) ( not ( = ?auto_162821 ?auto_162822 ) ) ( not ( = ?auto_162821 ?auto_162823 ) ) ( not ( = ?auto_162821 ?auto_162824 ) ) ( not ( = ?auto_162821 ?auto_162825 ) ) ( not ( = ?auto_162822 ?auto_162823 ) ) ( not ( = ?auto_162822 ?auto_162824 ) ) ( not ( = ?auto_162822 ?auto_162825 ) ) ( not ( = ?auto_162823 ?auto_162824 ) ) ( not ( = ?auto_162823 ?auto_162825 ) ) ( not ( = ?auto_162824 ?auto_162825 ) ) ( ON ?auto_162823 ?auto_162824 ) ( ON ?auto_162822 ?auto_162823 ) ( ON ?auto_162821 ?auto_162822 ) ( ON ?auto_162820 ?auto_162821 ) ( ON ?auto_162819 ?auto_162820 ) ( ON ?auto_162818 ?auto_162819 ) ( ON ?auto_162817 ?auto_162818 ) ( ON ?auto_162816 ?auto_162817 ) ( ON ?auto_162815 ?auto_162816 ) ( CLEAR ?auto_162815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_162815 )
      ( MAKE-10PILE ?auto_162815 ?auto_162816 ?auto_162817 ?auto_162818 ?auto_162819 ?auto_162820 ?auto_162821 ?auto_162822 ?auto_162823 ?auto_162824 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162837 - BLOCK
      ?auto_162838 - BLOCK
      ?auto_162839 - BLOCK
      ?auto_162840 - BLOCK
      ?auto_162841 - BLOCK
      ?auto_162842 - BLOCK
      ?auto_162843 - BLOCK
      ?auto_162844 - BLOCK
      ?auto_162845 - BLOCK
      ?auto_162846 - BLOCK
      ?auto_162847 - BLOCK
    )
    :vars
    (
      ?auto_162848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162846 ) ( ON ?auto_162847 ?auto_162848 ) ( CLEAR ?auto_162847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162837 ) ( ON ?auto_162838 ?auto_162837 ) ( ON ?auto_162839 ?auto_162838 ) ( ON ?auto_162840 ?auto_162839 ) ( ON ?auto_162841 ?auto_162840 ) ( ON ?auto_162842 ?auto_162841 ) ( ON ?auto_162843 ?auto_162842 ) ( ON ?auto_162844 ?auto_162843 ) ( ON ?auto_162845 ?auto_162844 ) ( ON ?auto_162846 ?auto_162845 ) ( not ( = ?auto_162837 ?auto_162838 ) ) ( not ( = ?auto_162837 ?auto_162839 ) ) ( not ( = ?auto_162837 ?auto_162840 ) ) ( not ( = ?auto_162837 ?auto_162841 ) ) ( not ( = ?auto_162837 ?auto_162842 ) ) ( not ( = ?auto_162837 ?auto_162843 ) ) ( not ( = ?auto_162837 ?auto_162844 ) ) ( not ( = ?auto_162837 ?auto_162845 ) ) ( not ( = ?auto_162837 ?auto_162846 ) ) ( not ( = ?auto_162837 ?auto_162847 ) ) ( not ( = ?auto_162837 ?auto_162848 ) ) ( not ( = ?auto_162838 ?auto_162839 ) ) ( not ( = ?auto_162838 ?auto_162840 ) ) ( not ( = ?auto_162838 ?auto_162841 ) ) ( not ( = ?auto_162838 ?auto_162842 ) ) ( not ( = ?auto_162838 ?auto_162843 ) ) ( not ( = ?auto_162838 ?auto_162844 ) ) ( not ( = ?auto_162838 ?auto_162845 ) ) ( not ( = ?auto_162838 ?auto_162846 ) ) ( not ( = ?auto_162838 ?auto_162847 ) ) ( not ( = ?auto_162838 ?auto_162848 ) ) ( not ( = ?auto_162839 ?auto_162840 ) ) ( not ( = ?auto_162839 ?auto_162841 ) ) ( not ( = ?auto_162839 ?auto_162842 ) ) ( not ( = ?auto_162839 ?auto_162843 ) ) ( not ( = ?auto_162839 ?auto_162844 ) ) ( not ( = ?auto_162839 ?auto_162845 ) ) ( not ( = ?auto_162839 ?auto_162846 ) ) ( not ( = ?auto_162839 ?auto_162847 ) ) ( not ( = ?auto_162839 ?auto_162848 ) ) ( not ( = ?auto_162840 ?auto_162841 ) ) ( not ( = ?auto_162840 ?auto_162842 ) ) ( not ( = ?auto_162840 ?auto_162843 ) ) ( not ( = ?auto_162840 ?auto_162844 ) ) ( not ( = ?auto_162840 ?auto_162845 ) ) ( not ( = ?auto_162840 ?auto_162846 ) ) ( not ( = ?auto_162840 ?auto_162847 ) ) ( not ( = ?auto_162840 ?auto_162848 ) ) ( not ( = ?auto_162841 ?auto_162842 ) ) ( not ( = ?auto_162841 ?auto_162843 ) ) ( not ( = ?auto_162841 ?auto_162844 ) ) ( not ( = ?auto_162841 ?auto_162845 ) ) ( not ( = ?auto_162841 ?auto_162846 ) ) ( not ( = ?auto_162841 ?auto_162847 ) ) ( not ( = ?auto_162841 ?auto_162848 ) ) ( not ( = ?auto_162842 ?auto_162843 ) ) ( not ( = ?auto_162842 ?auto_162844 ) ) ( not ( = ?auto_162842 ?auto_162845 ) ) ( not ( = ?auto_162842 ?auto_162846 ) ) ( not ( = ?auto_162842 ?auto_162847 ) ) ( not ( = ?auto_162842 ?auto_162848 ) ) ( not ( = ?auto_162843 ?auto_162844 ) ) ( not ( = ?auto_162843 ?auto_162845 ) ) ( not ( = ?auto_162843 ?auto_162846 ) ) ( not ( = ?auto_162843 ?auto_162847 ) ) ( not ( = ?auto_162843 ?auto_162848 ) ) ( not ( = ?auto_162844 ?auto_162845 ) ) ( not ( = ?auto_162844 ?auto_162846 ) ) ( not ( = ?auto_162844 ?auto_162847 ) ) ( not ( = ?auto_162844 ?auto_162848 ) ) ( not ( = ?auto_162845 ?auto_162846 ) ) ( not ( = ?auto_162845 ?auto_162847 ) ) ( not ( = ?auto_162845 ?auto_162848 ) ) ( not ( = ?auto_162846 ?auto_162847 ) ) ( not ( = ?auto_162846 ?auto_162848 ) ) ( not ( = ?auto_162847 ?auto_162848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162847 ?auto_162848 )
      ( !STACK ?auto_162847 ?auto_162846 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162860 - BLOCK
      ?auto_162861 - BLOCK
      ?auto_162862 - BLOCK
      ?auto_162863 - BLOCK
      ?auto_162864 - BLOCK
      ?auto_162865 - BLOCK
      ?auto_162866 - BLOCK
      ?auto_162867 - BLOCK
      ?auto_162868 - BLOCK
      ?auto_162869 - BLOCK
      ?auto_162870 - BLOCK
    )
    :vars
    (
      ?auto_162871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_162869 ) ( ON ?auto_162870 ?auto_162871 ) ( CLEAR ?auto_162870 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_162860 ) ( ON ?auto_162861 ?auto_162860 ) ( ON ?auto_162862 ?auto_162861 ) ( ON ?auto_162863 ?auto_162862 ) ( ON ?auto_162864 ?auto_162863 ) ( ON ?auto_162865 ?auto_162864 ) ( ON ?auto_162866 ?auto_162865 ) ( ON ?auto_162867 ?auto_162866 ) ( ON ?auto_162868 ?auto_162867 ) ( ON ?auto_162869 ?auto_162868 ) ( not ( = ?auto_162860 ?auto_162861 ) ) ( not ( = ?auto_162860 ?auto_162862 ) ) ( not ( = ?auto_162860 ?auto_162863 ) ) ( not ( = ?auto_162860 ?auto_162864 ) ) ( not ( = ?auto_162860 ?auto_162865 ) ) ( not ( = ?auto_162860 ?auto_162866 ) ) ( not ( = ?auto_162860 ?auto_162867 ) ) ( not ( = ?auto_162860 ?auto_162868 ) ) ( not ( = ?auto_162860 ?auto_162869 ) ) ( not ( = ?auto_162860 ?auto_162870 ) ) ( not ( = ?auto_162860 ?auto_162871 ) ) ( not ( = ?auto_162861 ?auto_162862 ) ) ( not ( = ?auto_162861 ?auto_162863 ) ) ( not ( = ?auto_162861 ?auto_162864 ) ) ( not ( = ?auto_162861 ?auto_162865 ) ) ( not ( = ?auto_162861 ?auto_162866 ) ) ( not ( = ?auto_162861 ?auto_162867 ) ) ( not ( = ?auto_162861 ?auto_162868 ) ) ( not ( = ?auto_162861 ?auto_162869 ) ) ( not ( = ?auto_162861 ?auto_162870 ) ) ( not ( = ?auto_162861 ?auto_162871 ) ) ( not ( = ?auto_162862 ?auto_162863 ) ) ( not ( = ?auto_162862 ?auto_162864 ) ) ( not ( = ?auto_162862 ?auto_162865 ) ) ( not ( = ?auto_162862 ?auto_162866 ) ) ( not ( = ?auto_162862 ?auto_162867 ) ) ( not ( = ?auto_162862 ?auto_162868 ) ) ( not ( = ?auto_162862 ?auto_162869 ) ) ( not ( = ?auto_162862 ?auto_162870 ) ) ( not ( = ?auto_162862 ?auto_162871 ) ) ( not ( = ?auto_162863 ?auto_162864 ) ) ( not ( = ?auto_162863 ?auto_162865 ) ) ( not ( = ?auto_162863 ?auto_162866 ) ) ( not ( = ?auto_162863 ?auto_162867 ) ) ( not ( = ?auto_162863 ?auto_162868 ) ) ( not ( = ?auto_162863 ?auto_162869 ) ) ( not ( = ?auto_162863 ?auto_162870 ) ) ( not ( = ?auto_162863 ?auto_162871 ) ) ( not ( = ?auto_162864 ?auto_162865 ) ) ( not ( = ?auto_162864 ?auto_162866 ) ) ( not ( = ?auto_162864 ?auto_162867 ) ) ( not ( = ?auto_162864 ?auto_162868 ) ) ( not ( = ?auto_162864 ?auto_162869 ) ) ( not ( = ?auto_162864 ?auto_162870 ) ) ( not ( = ?auto_162864 ?auto_162871 ) ) ( not ( = ?auto_162865 ?auto_162866 ) ) ( not ( = ?auto_162865 ?auto_162867 ) ) ( not ( = ?auto_162865 ?auto_162868 ) ) ( not ( = ?auto_162865 ?auto_162869 ) ) ( not ( = ?auto_162865 ?auto_162870 ) ) ( not ( = ?auto_162865 ?auto_162871 ) ) ( not ( = ?auto_162866 ?auto_162867 ) ) ( not ( = ?auto_162866 ?auto_162868 ) ) ( not ( = ?auto_162866 ?auto_162869 ) ) ( not ( = ?auto_162866 ?auto_162870 ) ) ( not ( = ?auto_162866 ?auto_162871 ) ) ( not ( = ?auto_162867 ?auto_162868 ) ) ( not ( = ?auto_162867 ?auto_162869 ) ) ( not ( = ?auto_162867 ?auto_162870 ) ) ( not ( = ?auto_162867 ?auto_162871 ) ) ( not ( = ?auto_162868 ?auto_162869 ) ) ( not ( = ?auto_162868 ?auto_162870 ) ) ( not ( = ?auto_162868 ?auto_162871 ) ) ( not ( = ?auto_162869 ?auto_162870 ) ) ( not ( = ?auto_162869 ?auto_162871 ) ) ( not ( = ?auto_162870 ?auto_162871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_162870 ?auto_162871 )
      ( !STACK ?auto_162870 ?auto_162869 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162883 - BLOCK
      ?auto_162884 - BLOCK
      ?auto_162885 - BLOCK
      ?auto_162886 - BLOCK
      ?auto_162887 - BLOCK
      ?auto_162888 - BLOCK
      ?auto_162889 - BLOCK
      ?auto_162890 - BLOCK
      ?auto_162891 - BLOCK
      ?auto_162892 - BLOCK
      ?auto_162893 - BLOCK
    )
    :vars
    (
      ?auto_162894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162893 ?auto_162894 ) ( ON-TABLE ?auto_162883 ) ( ON ?auto_162884 ?auto_162883 ) ( ON ?auto_162885 ?auto_162884 ) ( ON ?auto_162886 ?auto_162885 ) ( ON ?auto_162887 ?auto_162886 ) ( ON ?auto_162888 ?auto_162887 ) ( ON ?auto_162889 ?auto_162888 ) ( ON ?auto_162890 ?auto_162889 ) ( ON ?auto_162891 ?auto_162890 ) ( not ( = ?auto_162883 ?auto_162884 ) ) ( not ( = ?auto_162883 ?auto_162885 ) ) ( not ( = ?auto_162883 ?auto_162886 ) ) ( not ( = ?auto_162883 ?auto_162887 ) ) ( not ( = ?auto_162883 ?auto_162888 ) ) ( not ( = ?auto_162883 ?auto_162889 ) ) ( not ( = ?auto_162883 ?auto_162890 ) ) ( not ( = ?auto_162883 ?auto_162891 ) ) ( not ( = ?auto_162883 ?auto_162892 ) ) ( not ( = ?auto_162883 ?auto_162893 ) ) ( not ( = ?auto_162883 ?auto_162894 ) ) ( not ( = ?auto_162884 ?auto_162885 ) ) ( not ( = ?auto_162884 ?auto_162886 ) ) ( not ( = ?auto_162884 ?auto_162887 ) ) ( not ( = ?auto_162884 ?auto_162888 ) ) ( not ( = ?auto_162884 ?auto_162889 ) ) ( not ( = ?auto_162884 ?auto_162890 ) ) ( not ( = ?auto_162884 ?auto_162891 ) ) ( not ( = ?auto_162884 ?auto_162892 ) ) ( not ( = ?auto_162884 ?auto_162893 ) ) ( not ( = ?auto_162884 ?auto_162894 ) ) ( not ( = ?auto_162885 ?auto_162886 ) ) ( not ( = ?auto_162885 ?auto_162887 ) ) ( not ( = ?auto_162885 ?auto_162888 ) ) ( not ( = ?auto_162885 ?auto_162889 ) ) ( not ( = ?auto_162885 ?auto_162890 ) ) ( not ( = ?auto_162885 ?auto_162891 ) ) ( not ( = ?auto_162885 ?auto_162892 ) ) ( not ( = ?auto_162885 ?auto_162893 ) ) ( not ( = ?auto_162885 ?auto_162894 ) ) ( not ( = ?auto_162886 ?auto_162887 ) ) ( not ( = ?auto_162886 ?auto_162888 ) ) ( not ( = ?auto_162886 ?auto_162889 ) ) ( not ( = ?auto_162886 ?auto_162890 ) ) ( not ( = ?auto_162886 ?auto_162891 ) ) ( not ( = ?auto_162886 ?auto_162892 ) ) ( not ( = ?auto_162886 ?auto_162893 ) ) ( not ( = ?auto_162886 ?auto_162894 ) ) ( not ( = ?auto_162887 ?auto_162888 ) ) ( not ( = ?auto_162887 ?auto_162889 ) ) ( not ( = ?auto_162887 ?auto_162890 ) ) ( not ( = ?auto_162887 ?auto_162891 ) ) ( not ( = ?auto_162887 ?auto_162892 ) ) ( not ( = ?auto_162887 ?auto_162893 ) ) ( not ( = ?auto_162887 ?auto_162894 ) ) ( not ( = ?auto_162888 ?auto_162889 ) ) ( not ( = ?auto_162888 ?auto_162890 ) ) ( not ( = ?auto_162888 ?auto_162891 ) ) ( not ( = ?auto_162888 ?auto_162892 ) ) ( not ( = ?auto_162888 ?auto_162893 ) ) ( not ( = ?auto_162888 ?auto_162894 ) ) ( not ( = ?auto_162889 ?auto_162890 ) ) ( not ( = ?auto_162889 ?auto_162891 ) ) ( not ( = ?auto_162889 ?auto_162892 ) ) ( not ( = ?auto_162889 ?auto_162893 ) ) ( not ( = ?auto_162889 ?auto_162894 ) ) ( not ( = ?auto_162890 ?auto_162891 ) ) ( not ( = ?auto_162890 ?auto_162892 ) ) ( not ( = ?auto_162890 ?auto_162893 ) ) ( not ( = ?auto_162890 ?auto_162894 ) ) ( not ( = ?auto_162891 ?auto_162892 ) ) ( not ( = ?auto_162891 ?auto_162893 ) ) ( not ( = ?auto_162891 ?auto_162894 ) ) ( not ( = ?auto_162892 ?auto_162893 ) ) ( not ( = ?auto_162892 ?auto_162894 ) ) ( not ( = ?auto_162893 ?auto_162894 ) ) ( CLEAR ?auto_162891 ) ( ON ?auto_162892 ?auto_162893 ) ( CLEAR ?auto_162892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_162883 ?auto_162884 ?auto_162885 ?auto_162886 ?auto_162887 ?auto_162888 ?auto_162889 ?auto_162890 ?auto_162891 ?auto_162892 )
      ( MAKE-11PILE ?auto_162883 ?auto_162884 ?auto_162885 ?auto_162886 ?auto_162887 ?auto_162888 ?auto_162889 ?auto_162890 ?auto_162891 ?auto_162892 ?auto_162893 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162906 - BLOCK
      ?auto_162907 - BLOCK
      ?auto_162908 - BLOCK
      ?auto_162909 - BLOCK
      ?auto_162910 - BLOCK
      ?auto_162911 - BLOCK
      ?auto_162912 - BLOCK
      ?auto_162913 - BLOCK
      ?auto_162914 - BLOCK
      ?auto_162915 - BLOCK
      ?auto_162916 - BLOCK
    )
    :vars
    (
      ?auto_162917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162916 ?auto_162917 ) ( ON-TABLE ?auto_162906 ) ( ON ?auto_162907 ?auto_162906 ) ( ON ?auto_162908 ?auto_162907 ) ( ON ?auto_162909 ?auto_162908 ) ( ON ?auto_162910 ?auto_162909 ) ( ON ?auto_162911 ?auto_162910 ) ( ON ?auto_162912 ?auto_162911 ) ( ON ?auto_162913 ?auto_162912 ) ( ON ?auto_162914 ?auto_162913 ) ( not ( = ?auto_162906 ?auto_162907 ) ) ( not ( = ?auto_162906 ?auto_162908 ) ) ( not ( = ?auto_162906 ?auto_162909 ) ) ( not ( = ?auto_162906 ?auto_162910 ) ) ( not ( = ?auto_162906 ?auto_162911 ) ) ( not ( = ?auto_162906 ?auto_162912 ) ) ( not ( = ?auto_162906 ?auto_162913 ) ) ( not ( = ?auto_162906 ?auto_162914 ) ) ( not ( = ?auto_162906 ?auto_162915 ) ) ( not ( = ?auto_162906 ?auto_162916 ) ) ( not ( = ?auto_162906 ?auto_162917 ) ) ( not ( = ?auto_162907 ?auto_162908 ) ) ( not ( = ?auto_162907 ?auto_162909 ) ) ( not ( = ?auto_162907 ?auto_162910 ) ) ( not ( = ?auto_162907 ?auto_162911 ) ) ( not ( = ?auto_162907 ?auto_162912 ) ) ( not ( = ?auto_162907 ?auto_162913 ) ) ( not ( = ?auto_162907 ?auto_162914 ) ) ( not ( = ?auto_162907 ?auto_162915 ) ) ( not ( = ?auto_162907 ?auto_162916 ) ) ( not ( = ?auto_162907 ?auto_162917 ) ) ( not ( = ?auto_162908 ?auto_162909 ) ) ( not ( = ?auto_162908 ?auto_162910 ) ) ( not ( = ?auto_162908 ?auto_162911 ) ) ( not ( = ?auto_162908 ?auto_162912 ) ) ( not ( = ?auto_162908 ?auto_162913 ) ) ( not ( = ?auto_162908 ?auto_162914 ) ) ( not ( = ?auto_162908 ?auto_162915 ) ) ( not ( = ?auto_162908 ?auto_162916 ) ) ( not ( = ?auto_162908 ?auto_162917 ) ) ( not ( = ?auto_162909 ?auto_162910 ) ) ( not ( = ?auto_162909 ?auto_162911 ) ) ( not ( = ?auto_162909 ?auto_162912 ) ) ( not ( = ?auto_162909 ?auto_162913 ) ) ( not ( = ?auto_162909 ?auto_162914 ) ) ( not ( = ?auto_162909 ?auto_162915 ) ) ( not ( = ?auto_162909 ?auto_162916 ) ) ( not ( = ?auto_162909 ?auto_162917 ) ) ( not ( = ?auto_162910 ?auto_162911 ) ) ( not ( = ?auto_162910 ?auto_162912 ) ) ( not ( = ?auto_162910 ?auto_162913 ) ) ( not ( = ?auto_162910 ?auto_162914 ) ) ( not ( = ?auto_162910 ?auto_162915 ) ) ( not ( = ?auto_162910 ?auto_162916 ) ) ( not ( = ?auto_162910 ?auto_162917 ) ) ( not ( = ?auto_162911 ?auto_162912 ) ) ( not ( = ?auto_162911 ?auto_162913 ) ) ( not ( = ?auto_162911 ?auto_162914 ) ) ( not ( = ?auto_162911 ?auto_162915 ) ) ( not ( = ?auto_162911 ?auto_162916 ) ) ( not ( = ?auto_162911 ?auto_162917 ) ) ( not ( = ?auto_162912 ?auto_162913 ) ) ( not ( = ?auto_162912 ?auto_162914 ) ) ( not ( = ?auto_162912 ?auto_162915 ) ) ( not ( = ?auto_162912 ?auto_162916 ) ) ( not ( = ?auto_162912 ?auto_162917 ) ) ( not ( = ?auto_162913 ?auto_162914 ) ) ( not ( = ?auto_162913 ?auto_162915 ) ) ( not ( = ?auto_162913 ?auto_162916 ) ) ( not ( = ?auto_162913 ?auto_162917 ) ) ( not ( = ?auto_162914 ?auto_162915 ) ) ( not ( = ?auto_162914 ?auto_162916 ) ) ( not ( = ?auto_162914 ?auto_162917 ) ) ( not ( = ?auto_162915 ?auto_162916 ) ) ( not ( = ?auto_162915 ?auto_162917 ) ) ( not ( = ?auto_162916 ?auto_162917 ) ) ( CLEAR ?auto_162914 ) ( ON ?auto_162915 ?auto_162916 ) ( CLEAR ?auto_162915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_162906 ?auto_162907 ?auto_162908 ?auto_162909 ?auto_162910 ?auto_162911 ?auto_162912 ?auto_162913 ?auto_162914 ?auto_162915 )
      ( MAKE-11PILE ?auto_162906 ?auto_162907 ?auto_162908 ?auto_162909 ?auto_162910 ?auto_162911 ?auto_162912 ?auto_162913 ?auto_162914 ?auto_162915 ?auto_162916 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162929 - BLOCK
      ?auto_162930 - BLOCK
      ?auto_162931 - BLOCK
      ?auto_162932 - BLOCK
      ?auto_162933 - BLOCK
      ?auto_162934 - BLOCK
      ?auto_162935 - BLOCK
      ?auto_162936 - BLOCK
      ?auto_162937 - BLOCK
      ?auto_162938 - BLOCK
      ?auto_162939 - BLOCK
    )
    :vars
    (
      ?auto_162940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162939 ?auto_162940 ) ( ON-TABLE ?auto_162929 ) ( ON ?auto_162930 ?auto_162929 ) ( ON ?auto_162931 ?auto_162930 ) ( ON ?auto_162932 ?auto_162931 ) ( ON ?auto_162933 ?auto_162932 ) ( ON ?auto_162934 ?auto_162933 ) ( ON ?auto_162935 ?auto_162934 ) ( ON ?auto_162936 ?auto_162935 ) ( not ( = ?auto_162929 ?auto_162930 ) ) ( not ( = ?auto_162929 ?auto_162931 ) ) ( not ( = ?auto_162929 ?auto_162932 ) ) ( not ( = ?auto_162929 ?auto_162933 ) ) ( not ( = ?auto_162929 ?auto_162934 ) ) ( not ( = ?auto_162929 ?auto_162935 ) ) ( not ( = ?auto_162929 ?auto_162936 ) ) ( not ( = ?auto_162929 ?auto_162937 ) ) ( not ( = ?auto_162929 ?auto_162938 ) ) ( not ( = ?auto_162929 ?auto_162939 ) ) ( not ( = ?auto_162929 ?auto_162940 ) ) ( not ( = ?auto_162930 ?auto_162931 ) ) ( not ( = ?auto_162930 ?auto_162932 ) ) ( not ( = ?auto_162930 ?auto_162933 ) ) ( not ( = ?auto_162930 ?auto_162934 ) ) ( not ( = ?auto_162930 ?auto_162935 ) ) ( not ( = ?auto_162930 ?auto_162936 ) ) ( not ( = ?auto_162930 ?auto_162937 ) ) ( not ( = ?auto_162930 ?auto_162938 ) ) ( not ( = ?auto_162930 ?auto_162939 ) ) ( not ( = ?auto_162930 ?auto_162940 ) ) ( not ( = ?auto_162931 ?auto_162932 ) ) ( not ( = ?auto_162931 ?auto_162933 ) ) ( not ( = ?auto_162931 ?auto_162934 ) ) ( not ( = ?auto_162931 ?auto_162935 ) ) ( not ( = ?auto_162931 ?auto_162936 ) ) ( not ( = ?auto_162931 ?auto_162937 ) ) ( not ( = ?auto_162931 ?auto_162938 ) ) ( not ( = ?auto_162931 ?auto_162939 ) ) ( not ( = ?auto_162931 ?auto_162940 ) ) ( not ( = ?auto_162932 ?auto_162933 ) ) ( not ( = ?auto_162932 ?auto_162934 ) ) ( not ( = ?auto_162932 ?auto_162935 ) ) ( not ( = ?auto_162932 ?auto_162936 ) ) ( not ( = ?auto_162932 ?auto_162937 ) ) ( not ( = ?auto_162932 ?auto_162938 ) ) ( not ( = ?auto_162932 ?auto_162939 ) ) ( not ( = ?auto_162932 ?auto_162940 ) ) ( not ( = ?auto_162933 ?auto_162934 ) ) ( not ( = ?auto_162933 ?auto_162935 ) ) ( not ( = ?auto_162933 ?auto_162936 ) ) ( not ( = ?auto_162933 ?auto_162937 ) ) ( not ( = ?auto_162933 ?auto_162938 ) ) ( not ( = ?auto_162933 ?auto_162939 ) ) ( not ( = ?auto_162933 ?auto_162940 ) ) ( not ( = ?auto_162934 ?auto_162935 ) ) ( not ( = ?auto_162934 ?auto_162936 ) ) ( not ( = ?auto_162934 ?auto_162937 ) ) ( not ( = ?auto_162934 ?auto_162938 ) ) ( not ( = ?auto_162934 ?auto_162939 ) ) ( not ( = ?auto_162934 ?auto_162940 ) ) ( not ( = ?auto_162935 ?auto_162936 ) ) ( not ( = ?auto_162935 ?auto_162937 ) ) ( not ( = ?auto_162935 ?auto_162938 ) ) ( not ( = ?auto_162935 ?auto_162939 ) ) ( not ( = ?auto_162935 ?auto_162940 ) ) ( not ( = ?auto_162936 ?auto_162937 ) ) ( not ( = ?auto_162936 ?auto_162938 ) ) ( not ( = ?auto_162936 ?auto_162939 ) ) ( not ( = ?auto_162936 ?auto_162940 ) ) ( not ( = ?auto_162937 ?auto_162938 ) ) ( not ( = ?auto_162937 ?auto_162939 ) ) ( not ( = ?auto_162937 ?auto_162940 ) ) ( not ( = ?auto_162938 ?auto_162939 ) ) ( not ( = ?auto_162938 ?auto_162940 ) ) ( not ( = ?auto_162939 ?auto_162940 ) ) ( ON ?auto_162938 ?auto_162939 ) ( CLEAR ?auto_162936 ) ( ON ?auto_162937 ?auto_162938 ) ( CLEAR ?auto_162937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_162929 ?auto_162930 ?auto_162931 ?auto_162932 ?auto_162933 ?auto_162934 ?auto_162935 ?auto_162936 ?auto_162937 )
      ( MAKE-11PILE ?auto_162929 ?auto_162930 ?auto_162931 ?auto_162932 ?auto_162933 ?auto_162934 ?auto_162935 ?auto_162936 ?auto_162937 ?auto_162938 ?auto_162939 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162952 - BLOCK
      ?auto_162953 - BLOCK
      ?auto_162954 - BLOCK
      ?auto_162955 - BLOCK
      ?auto_162956 - BLOCK
      ?auto_162957 - BLOCK
      ?auto_162958 - BLOCK
      ?auto_162959 - BLOCK
      ?auto_162960 - BLOCK
      ?auto_162961 - BLOCK
      ?auto_162962 - BLOCK
    )
    :vars
    (
      ?auto_162963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162962 ?auto_162963 ) ( ON-TABLE ?auto_162952 ) ( ON ?auto_162953 ?auto_162952 ) ( ON ?auto_162954 ?auto_162953 ) ( ON ?auto_162955 ?auto_162954 ) ( ON ?auto_162956 ?auto_162955 ) ( ON ?auto_162957 ?auto_162956 ) ( ON ?auto_162958 ?auto_162957 ) ( ON ?auto_162959 ?auto_162958 ) ( not ( = ?auto_162952 ?auto_162953 ) ) ( not ( = ?auto_162952 ?auto_162954 ) ) ( not ( = ?auto_162952 ?auto_162955 ) ) ( not ( = ?auto_162952 ?auto_162956 ) ) ( not ( = ?auto_162952 ?auto_162957 ) ) ( not ( = ?auto_162952 ?auto_162958 ) ) ( not ( = ?auto_162952 ?auto_162959 ) ) ( not ( = ?auto_162952 ?auto_162960 ) ) ( not ( = ?auto_162952 ?auto_162961 ) ) ( not ( = ?auto_162952 ?auto_162962 ) ) ( not ( = ?auto_162952 ?auto_162963 ) ) ( not ( = ?auto_162953 ?auto_162954 ) ) ( not ( = ?auto_162953 ?auto_162955 ) ) ( not ( = ?auto_162953 ?auto_162956 ) ) ( not ( = ?auto_162953 ?auto_162957 ) ) ( not ( = ?auto_162953 ?auto_162958 ) ) ( not ( = ?auto_162953 ?auto_162959 ) ) ( not ( = ?auto_162953 ?auto_162960 ) ) ( not ( = ?auto_162953 ?auto_162961 ) ) ( not ( = ?auto_162953 ?auto_162962 ) ) ( not ( = ?auto_162953 ?auto_162963 ) ) ( not ( = ?auto_162954 ?auto_162955 ) ) ( not ( = ?auto_162954 ?auto_162956 ) ) ( not ( = ?auto_162954 ?auto_162957 ) ) ( not ( = ?auto_162954 ?auto_162958 ) ) ( not ( = ?auto_162954 ?auto_162959 ) ) ( not ( = ?auto_162954 ?auto_162960 ) ) ( not ( = ?auto_162954 ?auto_162961 ) ) ( not ( = ?auto_162954 ?auto_162962 ) ) ( not ( = ?auto_162954 ?auto_162963 ) ) ( not ( = ?auto_162955 ?auto_162956 ) ) ( not ( = ?auto_162955 ?auto_162957 ) ) ( not ( = ?auto_162955 ?auto_162958 ) ) ( not ( = ?auto_162955 ?auto_162959 ) ) ( not ( = ?auto_162955 ?auto_162960 ) ) ( not ( = ?auto_162955 ?auto_162961 ) ) ( not ( = ?auto_162955 ?auto_162962 ) ) ( not ( = ?auto_162955 ?auto_162963 ) ) ( not ( = ?auto_162956 ?auto_162957 ) ) ( not ( = ?auto_162956 ?auto_162958 ) ) ( not ( = ?auto_162956 ?auto_162959 ) ) ( not ( = ?auto_162956 ?auto_162960 ) ) ( not ( = ?auto_162956 ?auto_162961 ) ) ( not ( = ?auto_162956 ?auto_162962 ) ) ( not ( = ?auto_162956 ?auto_162963 ) ) ( not ( = ?auto_162957 ?auto_162958 ) ) ( not ( = ?auto_162957 ?auto_162959 ) ) ( not ( = ?auto_162957 ?auto_162960 ) ) ( not ( = ?auto_162957 ?auto_162961 ) ) ( not ( = ?auto_162957 ?auto_162962 ) ) ( not ( = ?auto_162957 ?auto_162963 ) ) ( not ( = ?auto_162958 ?auto_162959 ) ) ( not ( = ?auto_162958 ?auto_162960 ) ) ( not ( = ?auto_162958 ?auto_162961 ) ) ( not ( = ?auto_162958 ?auto_162962 ) ) ( not ( = ?auto_162958 ?auto_162963 ) ) ( not ( = ?auto_162959 ?auto_162960 ) ) ( not ( = ?auto_162959 ?auto_162961 ) ) ( not ( = ?auto_162959 ?auto_162962 ) ) ( not ( = ?auto_162959 ?auto_162963 ) ) ( not ( = ?auto_162960 ?auto_162961 ) ) ( not ( = ?auto_162960 ?auto_162962 ) ) ( not ( = ?auto_162960 ?auto_162963 ) ) ( not ( = ?auto_162961 ?auto_162962 ) ) ( not ( = ?auto_162961 ?auto_162963 ) ) ( not ( = ?auto_162962 ?auto_162963 ) ) ( ON ?auto_162961 ?auto_162962 ) ( CLEAR ?auto_162959 ) ( ON ?auto_162960 ?auto_162961 ) ( CLEAR ?auto_162960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_162952 ?auto_162953 ?auto_162954 ?auto_162955 ?auto_162956 ?auto_162957 ?auto_162958 ?auto_162959 ?auto_162960 )
      ( MAKE-11PILE ?auto_162952 ?auto_162953 ?auto_162954 ?auto_162955 ?auto_162956 ?auto_162957 ?auto_162958 ?auto_162959 ?auto_162960 ?auto_162961 ?auto_162962 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162975 - BLOCK
      ?auto_162976 - BLOCK
      ?auto_162977 - BLOCK
      ?auto_162978 - BLOCK
      ?auto_162979 - BLOCK
      ?auto_162980 - BLOCK
      ?auto_162981 - BLOCK
      ?auto_162982 - BLOCK
      ?auto_162983 - BLOCK
      ?auto_162984 - BLOCK
      ?auto_162985 - BLOCK
    )
    :vars
    (
      ?auto_162986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_162985 ?auto_162986 ) ( ON-TABLE ?auto_162975 ) ( ON ?auto_162976 ?auto_162975 ) ( ON ?auto_162977 ?auto_162976 ) ( ON ?auto_162978 ?auto_162977 ) ( ON ?auto_162979 ?auto_162978 ) ( ON ?auto_162980 ?auto_162979 ) ( ON ?auto_162981 ?auto_162980 ) ( not ( = ?auto_162975 ?auto_162976 ) ) ( not ( = ?auto_162975 ?auto_162977 ) ) ( not ( = ?auto_162975 ?auto_162978 ) ) ( not ( = ?auto_162975 ?auto_162979 ) ) ( not ( = ?auto_162975 ?auto_162980 ) ) ( not ( = ?auto_162975 ?auto_162981 ) ) ( not ( = ?auto_162975 ?auto_162982 ) ) ( not ( = ?auto_162975 ?auto_162983 ) ) ( not ( = ?auto_162975 ?auto_162984 ) ) ( not ( = ?auto_162975 ?auto_162985 ) ) ( not ( = ?auto_162975 ?auto_162986 ) ) ( not ( = ?auto_162976 ?auto_162977 ) ) ( not ( = ?auto_162976 ?auto_162978 ) ) ( not ( = ?auto_162976 ?auto_162979 ) ) ( not ( = ?auto_162976 ?auto_162980 ) ) ( not ( = ?auto_162976 ?auto_162981 ) ) ( not ( = ?auto_162976 ?auto_162982 ) ) ( not ( = ?auto_162976 ?auto_162983 ) ) ( not ( = ?auto_162976 ?auto_162984 ) ) ( not ( = ?auto_162976 ?auto_162985 ) ) ( not ( = ?auto_162976 ?auto_162986 ) ) ( not ( = ?auto_162977 ?auto_162978 ) ) ( not ( = ?auto_162977 ?auto_162979 ) ) ( not ( = ?auto_162977 ?auto_162980 ) ) ( not ( = ?auto_162977 ?auto_162981 ) ) ( not ( = ?auto_162977 ?auto_162982 ) ) ( not ( = ?auto_162977 ?auto_162983 ) ) ( not ( = ?auto_162977 ?auto_162984 ) ) ( not ( = ?auto_162977 ?auto_162985 ) ) ( not ( = ?auto_162977 ?auto_162986 ) ) ( not ( = ?auto_162978 ?auto_162979 ) ) ( not ( = ?auto_162978 ?auto_162980 ) ) ( not ( = ?auto_162978 ?auto_162981 ) ) ( not ( = ?auto_162978 ?auto_162982 ) ) ( not ( = ?auto_162978 ?auto_162983 ) ) ( not ( = ?auto_162978 ?auto_162984 ) ) ( not ( = ?auto_162978 ?auto_162985 ) ) ( not ( = ?auto_162978 ?auto_162986 ) ) ( not ( = ?auto_162979 ?auto_162980 ) ) ( not ( = ?auto_162979 ?auto_162981 ) ) ( not ( = ?auto_162979 ?auto_162982 ) ) ( not ( = ?auto_162979 ?auto_162983 ) ) ( not ( = ?auto_162979 ?auto_162984 ) ) ( not ( = ?auto_162979 ?auto_162985 ) ) ( not ( = ?auto_162979 ?auto_162986 ) ) ( not ( = ?auto_162980 ?auto_162981 ) ) ( not ( = ?auto_162980 ?auto_162982 ) ) ( not ( = ?auto_162980 ?auto_162983 ) ) ( not ( = ?auto_162980 ?auto_162984 ) ) ( not ( = ?auto_162980 ?auto_162985 ) ) ( not ( = ?auto_162980 ?auto_162986 ) ) ( not ( = ?auto_162981 ?auto_162982 ) ) ( not ( = ?auto_162981 ?auto_162983 ) ) ( not ( = ?auto_162981 ?auto_162984 ) ) ( not ( = ?auto_162981 ?auto_162985 ) ) ( not ( = ?auto_162981 ?auto_162986 ) ) ( not ( = ?auto_162982 ?auto_162983 ) ) ( not ( = ?auto_162982 ?auto_162984 ) ) ( not ( = ?auto_162982 ?auto_162985 ) ) ( not ( = ?auto_162982 ?auto_162986 ) ) ( not ( = ?auto_162983 ?auto_162984 ) ) ( not ( = ?auto_162983 ?auto_162985 ) ) ( not ( = ?auto_162983 ?auto_162986 ) ) ( not ( = ?auto_162984 ?auto_162985 ) ) ( not ( = ?auto_162984 ?auto_162986 ) ) ( not ( = ?auto_162985 ?auto_162986 ) ) ( ON ?auto_162984 ?auto_162985 ) ( ON ?auto_162983 ?auto_162984 ) ( CLEAR ?auto_162981 ) ( ON ?auto_162982 ?auto_162983 ) ( CLEAR ?auto_162982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162975 ?auto_162976 ?auto_162977 ?auto_162978 ?auto_162979 ?auto_162980 ?auto_162981 ?auto_162982 )
      ( MAKE-11PILE ?auto_162975 ?auto_162976 ?auto_162977 ?auto_162978 ?auto_162979 ?auto_162980 ?auto_162981 ?auto_162982 ?auto_162983 ?auto_162984 ?auto_162985 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_162998 - BLOCK
      ?auto_162999 - BLOCK
      ?auto_163000 - BLOCK
      ?auto_163001 - BLOCK
      ?auto_163002 - BLOCK
      ?auto_163003 - BLOCK
      ?auto_163004 - BLOCK
      ?auto_163005 - BLOCK
      ?auto_163006 - BLOCK
      ?auto_163007 - BLOCK
      ?auto_163008 - BLOCK
    )
    :vars
    (
      ?auto_163009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163008 ?auto_163009 ) ( ON-TABLE ?auto_162998 ) ( ON ?auto_162999 ?auto_162998 ) ( ON ?auto_163000 ?auto_162999 ) ( ON ?auto_163001 ?auto_163000 ) ( ON ?auto_163002 ?auto_163001 ) ( ON ?auto_163003 ?auto_163002 ) ( ON ?auto_163004 ?auto_163003 ) ( not ( = ?auto_162998 ?auto_162999 ) ) ( not ( = ?auto_162998 ?auto_163000 ) ) ( not ( = ?auto_162998 ?auto_163001 ) ) ( not ( = ?auto_162998 ?auto_163002 ) ) ( not ( = ?auto_162998 ?auto_163003 ) ) ( not ( = ?auto_162998 ?auto_163004 ) ) ( not ( = ?auto_162998 ?auto_163005 ) ) ( not ( = ?auto_162998 ?auto_163006 ) ) ( not ( = ?auto_162998 ?auto_163007 ) ) ( not ( = ?auto_162998 ?auto_163008 ) ) ( not ( = ?auto_162998 ?auto_163009 ) ) ( not ( = ?auto_162999 ?auto_163000 ) ) ( not ( = ?auto_162999 ?auto_163001 ) ) ( not ( = ?auto_162999 ?auto_163002 ) ) ( not ( = ?auto_162999 ?auto_163003 ) ) ( not ( = ?auto_162999 ?auto_163004 ) ) ( not ( = ?auto_162999 ?auto_163005 ) ) ( not ( = ?auto_162999 ?auto_163006 ) ) ( not ( = ?auto_162999 ?auto_163007 ) ) ( not ( = ?auto_162999 ?auto_163008 ) ) ( not ( = ?auto_162999 ?auto_163009 ) ) ( not ( = ?auto_163000 ?auto_163001 ) ) ( not ( = ?auto_163000 ?auto_163002 ) ) ( not ( = ?auto_163000 ?auto_163003 ) ) ( not ( = ?auto_163000 ?auto_163004 ) ) ( not ( = ?auto_163000 ?auto_163005 ) ) ( not ( = ?auto_163000 ?auto_163006 ) ) ( not ( = ?auto_163000 ?auto_163007 ) ) ( not ( = ?auto_163000 ?auto_163008 ) ) ( not ( = ?auto_163000 ?auto_163009 ) ) ( not ( = ?auto_163001 ?auto_163002 ) ) ( not ( = ?auto_163001 ?auto_163003 ) ) ( not ( = ?auto_163001 ?auto_163004 ) ) ( not ( = ?auto_163001 ?auto_163005 ) ) ( not ( = ?auto_163001 ?auto_163006 ) ) ( not ( = ?auto_163001 ?auto_163007 ) ) ( not ( = ?auto_163001 ?auto_163008 ) ) ( not ( = ?auto_163001 ?auto_163009 ) ) ( not ( = ?auto_163002 ?auto_163003 ) ) ( not ( = ?auto_163002 ?auto_163004 ) ) ( not ( = ?auto_163002 ?auto_163005 ) ) ( not ( = ?auto_163002 ?auto_163006 ) ) ( not ( = ?auto_163002 ?auto_163007 ) ) ( not ( = ?auto_163002 ?auto_163008 ) ) ( not ( = ?auto_163002 ?auto_163009 ) ) ( not ( = ?auto_163003 ?auto_163004 ) ) ( not ( = ?auto_163003 ?auto_163005 ) ) ( not ( = ?auto_163003 ?auto_163006 ) ) ( not ( = ?auto_163003 ?auto_163007 ) ) ( not ( = ?auto_163003 ?auto_163008 ) ) ( not ( = ?auto_163003 ?auto_163009 ) ) ( not ( = ?auto_163004 ?auto_163005 ) ) ( not ( = ?auto_163004 ?auto_163006 ) ) ( not ( = ?auto_163004 ?auto_163007 ) ) ( not ( = ?auto_163004 ?auto_163008 ) ) ( not ( = ?auto_163004 ?auto_163009 ) ) ( not ( = ?auto_163005 ?auto_163006 ) ) ( not ( = ?auto_163005 ?auto_163007 ) ) ( not ( = ?auto_163005 ?auto_163008 ) ) ( not ( = ?auto_163005 ?auto_163009 ) ) ( not ( = ?auto_163006 ?auto_163007 ) ) ( not ( = ?auto_163006 ?auto_163008 ) ) ( not ( = ?auto_163006 ?auto_163009 ) ) ( not ( = ?auto_163007 ?auto_163008 ) ) ( not ( = ?auto_163007 ?auto_163009 ) ) ( not ( = ?auto_163008 ?auto_163009 ) ) ( ON ?auto_163007 ?auto_163008 ) ( ON ?auto_163006 ?auto_163007 ) ( CLEAR ?auto_163004 ) ( ON ?auto_163005 ?auto_163006 ) ( CLEAR ?auto_163005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_162998 ?auto_162999 ?auto_163000 ?auto_163001 ?auto_163002 ?auto_163003 ?auto_163004 ?auto_163005 )
      ( MAKE-11PILE ?auto_162998 ?auto_162999 ?auto_163000 ?auto_163001 ?auto_163002 ?auto_163003 ?auto_163004 ?auto_163005 ?auto_163006 ?auto_163007 ?auto_163008 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163021 - BLOCK
      ?auto_163022 - BLOCK
      ?auto_163023 - BLOCK
      ?auto_163024 - BLOCK
      ?auto_163025 - BLOCK
      ?auto_163026 - BLOCK
      ?auto_163027 - BLOCK
      ?auto_163028 - BLOCK
      ?auto_163029 - BLOCK
      ?auto_163030 - BLOCK
      ?auto_163031 - BLOCK
    )
    :vars
    (
      ?auto_163032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163031 ?auto_163032 ) ( ON-TABLE ?auto_163021 ) ( ON ?auto_163022 ?auto_163021 ) ( ON ?auto_163023 ?auto_163022 ) ( ON ?auto_163024 ?auto_163023 ) ( ON ?auto_163025 ?auto_163024 ) ( ON ?auto_163026 ?auto_163025 ) ( not ( = ?auto_163021 ?auto_163022 ) ) ( not ( = ?auto_163021 ?auto_163023 ) ) ( not ( = ?auto_163021 ?auto_163024 ) ) ( not ( = ?auto_163021 ?auto_163025 ) ) ( not ( = ?auto_163021 ?auto_163026 ) ) ( not ( = ?auto_163021 ?auto_163027 ) ) ( not ( = ?auto_163021 ?auto_163028 ) ) ( not ( = ?auto_163021 ?auto_163029 ) ) ( not ( = ?auto_163021 ?auto_163030 ) ) ( not ( = ?auto_163021 ?auto_163031 ) ) ( not ( = ?auto_163021 ?auto_163032 ) ) ( not ( = ?auto_163022 ?auto_163023 ) ) ( not ( = ?auto_163022 ?auto_163024 ) ) ( not ( = ?auto_163022 ?auto_163025 ) ) ( not ( = ?auto_163022 ?auto_163026 ) ) ( not ( = ?auto_163022 ?auto_163027 ) ) ( not ( = ?auto_163022 ?auto_163028 ) ) ( not ( = ?auto_163022 ?auto_163029 ) ) ( not ( = ?auto_163022 ?auto_163030 ) ) ( not ( = ?auto_163022 ?auto_163031 ) ) ( not ( = ?auto_163022 ?auto_163032 ) ) ( not ( = ?auto_163023 ?auto_163024 ) ) ( not ( = ?auto_163023 ?auto_163025 ) ) ( not ( = ?auto_163023 ?auto_163026 ) ) ( not ( = ?auto_163023 ?auto_163027 ) ) ( not ( = ?auto_163023 ?auto_163028 ) ) ( not ( = ?auto_163023 ?auto_163029 ) ) ( not ( = ?auto_163023 ?auto_163030 ) ) ( not ( = ?auto_163023 ?auto_163031 ) ) ( not ( = ?auto_163023 ?auto_163032 ) ) ( not ( = ?auto_163024 ?auto_163025 ) ) ( not ( = ?auto_163024 ?auto_163026 ) ) ( not ( = ?auto_163024 ?auto_163027 ) ) ( not ( = ?auto_163024 ?auto_163028 ) ) ( not ( = ?auto_163024 ?auto_163029 ) ) ( not ( = ?auto_163024 ?auto_163030 ) ) ( not ( = ?auto_163024 ?auto_163031 ) ) ( not ( = ?auto_163024 ?auto_163032 ) ) ( not ( = ?auto_163025 ?auto_163026 ) ) ( not ( = ?auto_163025 ?auto_163027 ) ) ( not ( = ?auto_163025 ?auto_163028 ) ) ( not ( = ?auto_163025 ?auto_163029 ) ) ( not ( = ?auto_163025 ?auto_163030 ) ) ( not ( = ?auto_163025 ?auto_163031 ) ) ( not ( = ?auto_163025 ?auto_163032 ) ) ( not ( = ?auto_163026 ?auto_163027 ) ) ( not ( = ?auto_163026 ?auto_163028 ) ) ( not ( = ?auto_163026 ?auto_163029 ) ) ( not ( = ?auto_163026 ?auto_163030 ) ) ( not ( = ?auto_163026 ?auto_163031 ) ) ( not ( = ?auto_163026 ?auto_163032 ) ) ( not ( = ?auto_163027 ?auto_163028 ) ) ( not ( = ?auto_163027 ?auto_163029 ) ) ( not ( = ?auto_163027 ?auto_163030 ) ) ( not ( = ?auto_163027 ?auto_163031 ) ) ( not ( = ?auto_163027 ?auto_163032 ) ) ( not ( = ?auto_163028 ?auto_163029 ) ) ( not ( = ?auto_163028 ?auto_163030 ) ) ( not ( = ?auto_163028 ?auto_163031 ) ) ( not ( = ?auto_163028 ?auto_163032 ) ) ( not ( = ?auto_163029 ?auto_163030 ) ) ( not ( = ?auto_163029 ?auto_163031 ) ) ( not ( = ?auto_163029 ?auto_163032 ) ) ( not ( = ?auto_163030 ?auto_163031 ) ) ( not ( = ?auto_163030 ?auto_163032 ) ) ( not ( = ?auto_163031 ?auto_163032 ) ) ( ON ?auto_163030 ?auto_163031 ) ( ON ?auto_163029 ?auto_163030 ) ( ON ?auto_163028 ?auto_163029 ) ( CLEAR ?auto_163026 ) ( ON ?auto_163027 ?auto_163028 ) ( CLEAR ?auto_163027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163021 ?auto_163022 ?auto_163023 ?auto_163024 ?auto_163025 ?auto_163026 ?auto_163027 )
      ( MAKE-11PILE ?auto_163021 ?auto_163022 ?auto_163023 ?auto_163024 ?auto_163025 ?auto_163026 ?auto_163027 ?auto_163028 ?auto_163029 ?auto_163030 ?auto_163031 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163044 - BLOCK
      ?auto_163045 - BLOCK
      ?auto_163046 - BLOCK
      ?auto_163047 - BLOCK
      ?auto_163048 - BLOCK
      ?auto_163049 - BLOCK
      ?auto_163050 - BLOCK
      ?auto_163051 - BLOCK
      ?auto_163052 - BLOCK
      ?auto_163053 - BLOCK
      ?auto_163054 - BLOCK
    )
    :vars
    (
      ?auto_163055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163054 ?auto_163055 ) ( ON-TABLE ?auto_163044 ) ( ON ?auto_163045 ?auto_163044 ) ( ON ?auto_163046 ?auto_163045 ) ( ON ?auto_163047 ?auto_163046 ) ( ON ?auto_163048 ?auto_163047 ) ( ON ?auto_163049 ?auto_163048 ) ( not ( = ?auto_163044 ?auto_163045 ) ) ( not ( = ?auto_163044 ?auto_163046 ) ) ( not ( = ?auto_163044 ?auto_163047 ) ) ( not ( = ?auto_163044 ?auto_163048 ) ) ( not ( = ?auto_163044 ?auto_163049 ) ) ( not ( = ?auto_163044 ?auto_163050 ) ) ( not ( = ?auto_163044 ?auto_163051 ) ) ( not ( = ?auto_163044 ?auto_163052 ) ) ( not ( = ?auto_163044 ?auto_163053 ) ) ( not ( = ?auto_163044 ?auto_163054 ) ) ( not ( = ?auto_163044 ?auto_163055 ) ) ( not ( = ?auto_163045 ?auto_163046 ) ) ( not ( = ?auto_163045 ?auto_163047 ) ) ( not ( = ?auto_163045 ?auto_163048 ) ) ( not ( = ?auto_163045 ?auto_163049 ) ) ( not ( = ?auto_163045 ?auto_163050 ) ) ( not ( = ?auto_163045 ?auto_163051 ) ) ( not ( = ?auto_163045 ?auto_163052 ) ) ( not ( = ?auto_163045 ?auto_163053 ) ) ( not ( = ?auto_163045 ?auto_163054 ) ) ( not ( = ?auto_163045 ?auto_163055 ) ) ( not ( = ?auto_163046 ?auto_163047 ) ) ( not ( = ?auto_163046 ?auto_163048 ) ) ( not ( = ?auto_163046 ?auto_163049 ) ) ( not ( = ?auto_163046 ?auto_163050 ) ) ( not ( = ?auto_163046 ?auto_163051 ) ) ( not ( = ?auto_163046 ?auto_163052 ) ) ( not ( = ?auto_163046 ?auto_163053 ) ) ( not ( = ?auto_163046 ?auto_163054 ) ) ( not ( = ?auto_163046 ?auto_163055 ) ) ( not ( = ?auto_163047 ?auto_163048 ) ) ( not ( = ?auto_163047 ?auto_163049 ) ) ( not ( = ?auto_163047 ?auto_163050 ) ) ( not ( = ?auto_163047 ?auto_163051 ) ) ( not ( = ?auto_163047 ?auto_163052 ) ) ( not ( = ?auto_163047 ?auto_163053 ) ) ( not ( = ?auto_163047 ?auto_163054 ) ) ( not ( = ?auto_163047 ?auto_163055 ) ) ( not ( = ?auto_163048 ?auto_163049 ) ) ( not ( = ?auto_163048 ?auto_163050 ) ) ( not ( = ?auto_163048 ?auto_163051 ) ) ( not ( = ?auto_163048 ?auto_163052 ) ) ( not ( = ?auto_163048 ?auto_163053 ) ) ( not ( = ?auto_163048 ?auto_163054 ) ) ( not ( = ?auto_163048 ?auto_163055 ) ) ( not ( = ?auto_163049 ?auto_163050 ) ) ( not ( = ?auto_163049 ?auto_163051 ) ) ( not ( = ?auto_163049 ?auto_163052 ) ) ( not ( = ?auto_163049 ?auto_163053 ) ) ( not ( = ?auto_163049 ?auto_163054 ) ) ( not ( = ?auto_163049 ?auto_163055 ) ) ( not ( = ?auto_163050 ?auto_163051 ) ) ( not ( = ?auto_163050 ?auto_163052 ) ) ( not ( = ?auto_163050 ?auto_163053 ) ) ( not ( = ?auto_163050 ?auto_163054 ) ) ( not ( = ?auto_163050 ?auto_163055 ) ) ( not ( = ?auto_163051 ?auto_163052 ) ) ( not ( = ?auto_163051 ?auto_163053 ) ) ( not ( = ?auto_163051 ?auto_163054 ) ) ( not ( = ?auto_163051 ?auto_163055 ) ) ( not ( = ?auto_163052 ?auto_163053 ) ) ( not ( = ?auto_163052 ?auto_163054 ) ) ( not ( = ?auto_163052 ?auto_163055 ) ) ( not ( = ?auto_163053 ?auto_163054 ) ) ( not ( = ?auto_163053 ?auto_163055 ) ) ( not ( = ?auto_163054 ?auto_163055 ) ) ( ON ?auto_163053 ?auto_163054 ) ( ON ?auto_163052 ?auto_163053 ) ( ON ?auto_163051 ?auto_163052 ) ( CLEAR ?auto_163049 ) ( ON ?auto_163050 ?auto_163051 ) ( CLEAR ?auto_163050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163044 ?auto_163045 ?auto_163046 ?auto_163047 ?auto_163048 ?auto_163049 ?auto_163050 )
      ( MAKE-11PILE ?auto_163044 ?auto_163045 ?auto_163046 ?auto_163047 ?auto_163048 ?auto_163049 ?auto_163050 ?auto_163051 ?auto_163052 ?auto_163053 ?auto_163054 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163067 - BLOCK
      ?auto_163068 - BLOCK
      ?auto_163069 - BLOCK
      ?auto_163070 - BLOCK
      ?auto_163071 - BLOCK
      ?auto_163072 - BLOCK
      ?auto_163073 - BLOCK
      ?auto_163074 - BLOCK
      ?auto_163075 - BLOCK
      ?auto_163076 - BLOCK
      ?auto_163077 - BLOCK
    )
    :vars
    (
      ?auto_163078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163077 ?auto_163078 ) ( ON-TABLE ?auto_163067 ) ( ON ?auto_163068 ?auto_163067 ) ( ON ?auto_163069 ?auto_163068 ) ( ON ?auto_163070 ?auto_163069 ) ( ON ?auto_163071 ?auto_163070 ) ( not ( = ?auto_163067 ?auto_163068 ) ) ( not ( = ?auto_163067 ?auto_163069 ) ) ( not ( = ?auto_163067 ?auto_163070 ) ) ( not ( = ?auto_163067 ?auto_163071 ) ) ( not ( = ?auto_163067 ?auto_163072 ) ) ( not ( = ?auto_163067 ?auto_163073 ) ) ( not ( = ?auto_163067 ?auto_163074 ) ) ( not ( = ?auto_163067 ?auto_163075 ) ) ( not ( = ?auto_163067 ?auto_163076 ) ) ( not ( = ?auto_163067 ?auto_163077 ) ) ( not ( = ?auto_163067 ?auto_163078 ) ) ( not ( = ?auto_163068 ?auto_163069 ) ) ( not ( = ?auto_163068 ?auto_163070 ) ) ( not ( = ?auto_163068 ?auto_163071 ) ) ( not ( = ?auto_163068 ?auto_163072 ) ) ( not ( = ?auto_163068 ?auto_163073 ) ) ( not ( = ?auto_163068 ?auto_163074 ) ) ( not ( = ?auto_163068 ?auto_163075 ) ) ( not ( = ?auto_163068 ?auto_163076 ) ) ( not ( = ?auto_163068 ?auto_163077 ) ) ( not ( = ?auto_163068 ?auto_163078 ) ) ( not ( = ?auto_163069 ?auto_163070 ) ) ( not ( = ?auto_163069 ?auto_163071 ) ) ( not ( = ?auto_163069 ?auto_163072 ) ) ( not ( = ?auto_163069 ?auto_163073 ) ) ( not ( = ?auto_163069 ?auto_163074 ) ) ( not ( = ?auto_163069 ?auto_163075 ) ) ( not ( = ?auto_163069 ?auto_163076 ) ) ( not ( = ?auto_163069 ?auto_163077 ) ) ( not ( = ?auto_163069 ?auto_163078 ) ) ( not ( = ?auto_163070 ?auto_163071 ) ) ( not ( = ?auto_163070 ?auto_163072 ) ) ( not ( = ?auto_163070 ?auto_163073 ) ) ( not ( = ?auto_163070 ?auto_163074 ) ) ( not ( = ?auto_163070 ?auto_163075 ) ) ( not ( = ?auto_163070 ?auto_163076 ) ) ( not ( = ?auto_163070 ?auto_163077 ) ) ( not ( = ?auto_163070 ?auto_163078 ) ) ( not ( = ?auto_163071 ?auto_163072 ) ) ( not ( = ?auto_163071 ?auto_163073 ) ) ( not ( = ?auto_163071 ?auto_163074 ) ) ( not ( = ?auto_163071 ?auto_163075 ) ) ( not ( = ?auto_163071 ?auto_163076 ) ) ( not ( = ?auto_163071 ?auto_163077 ) ) ( not ( = ?auto_163071 ?auto_163078 ) ) ( not ( = ?auto_163072 ?auto_163073 ) ) ( not ( = ?auto_163072 ?auto_163074 ) ) ( not ( = ?auto_163072 ?auto_163075 ) ) ( not ( = ?auto_163072 ?auto_163076 ) ) ( not ( = ?auto_163072 ?auto_163077 ) ) ( not ( = ?auto_163072 ?auto_163078 ) ) ( not ( = ?auto_163073 ?auto_163074 ) ) ( not ( = ?auto_163073 ?auto_163075 ) ) ( not ( = ?auto_163073 ?auto_163076 ) ) ( not ( = ?auto_163073 ?auto_163077 ) ) ( not ( = ?auto_163073 ?auto_163078 ) ) ( not ( = ?auto_163074 ?auto_163075 ) ) ( not ( = ?auto_163074 ?auto_163076 ) ) ( not ( = ?auto_163074 ?auto_163077 ) ) ( not ( = ?auto_163074 ?auto_163078 ) ) ( not ( = ?auto_163075 ?auto_163076 ) ) ( not ( = ?auto_163075 ?auto_163077 ) ) ( not ( = ?auto_163075 ?auto_163078 ) ) ( not ( = ?auto_163076 ?auto_163077 ) ) ( not ( = ?auto_163076 ?auto_163078 ) ) ( not ( = ?auto_163077 ?auto_163078 ) ) ( ON ?auto_163076 ?auto_163077 ) ( ON ?auto_163075 ?auto_163076 ) ( ON ?auto_163074 ?auto_163075 ) ( ON ?auto_163073 ?auto_163074 ) ( CLEAR ?auto_163071 ) ( ON ?auto_163072 ?auto_163073 ) ( CLEAR ?auto_163072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163067 ?auto_163068 ?auto_163069 ?auto_163070 ?auto_163071 ?auto_163072 )
      ( MAKE-11PILE ?auto_163067 ?auto_163068 ?auto_163069 ?auto_163070 ?auto_163071 ?auto_163072 ?auto_163073 ?auto_163074 ?auto_163075 ?auto_163076 ?auto_163077 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163090 - BLOCK
      ?auto_163091 - BLOCK
      ?auto_163092 - BLOCK
      ?auto_163093 - BLOCK
      ?auto_163094 - BLOCK
      ?auto_163095 - BLOCK
      ?auto_163096 - BLOCK
      ?auto_163097 - BLOCK
      ?auto_163098 - BLOCK
      ?auto_163099 - BLOCK
      ?auto_163100 - BLOCK
    )
    :vars
    (
      ?auto_163101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163100 ?auto_163101 ) ( ON-TABLE ?auto_163090 ) ( ON ?auto_163091 ?auto_163090 ) ( ON ?auto_163092 ?auto_163091 ) ( ON ?auto_163093 ?auto_163092 ) ( ON ?auto_163094 ?auto_163093 ) ( not ( = ?auto_163090 ?auto_163091 ) ) ( not ( = ?auto_163090 ?auto_163092 ) ) ( not ( = ?auto_163090 ?auto_163093 ) ) ( not ( = ?auto_163090 ?auto_163094 ) ) ( not ( = ?auto_163090 ?auto_163095 ) ) ( not ( = ?auto_163090 ?auto_163096 ) ) ( not ( = ?auto_163090 ?auto_163097 ) ) ( not ( = ?auto_163090 ?auto_163098 ) ) ( not ( = ?auto_163090 ?auto_163099 ) ) ( not ( = ?auto_163090 ?auto_163100 ) ) ( not ( = ?auto_163090 ?auto_163101 ) ) ( not ( = ?auto_163091 ?auto_163092 ) ) ( not ( = ?auto_163091 ?auto_163093 ) ) ( not ( = ?auto_163091 ?auto_163094 ) ) ( not ( = ?auto_163091 ?auto_163095 ) ) ( not ( = ?auto_163091 ?auto_163096 ) ) ( not ( = ?auto_163091 ?auto_163097 ) ) ( not ( = ?auto_163091 ?auto_163098 ) ) ( not ( = ?auto_163091 ?auto_163099 ) ) ( not ( = ?auto_163091 ?auto_163100 ) ) ( not ( = ?auto_163091 ?auto_163101 ) ) ( not ( = ?auto_163092 ?auto_163093 ) ) ( not ( = ?auto_163092 ?auto_163094 ) ) ( not ( = ?auto_163092 ?auto_163095 ) ) ( not ( = ?auto_163092 ?auto_163096 ) ) ( not ( = ?auto_163092 ?auto_163097 ) ) ( not ( = ?auto_163092 ?auto_163098 ) ) ( not ( = ?auto_163092 ?auto_163099 ) ) ( not ( = ?auto_163092 ?auto_163100 ) ) ( not ( = ?auto_163092 ?auto_163101 ) ) ( not ( = ?auto_163093 ?auto_163094 ) ) ( not ( = ?auto_163093 ?auto_163095 ) ) ( not ( = ?auto_163093 ?auto_163096 ) ) ( not ( = ?auto_163093 ?auto_163097 ) ) ( not ( = ?auto_163093 ?auto_163098 ) ) ( not ( = ?auto_163093 ?auto_163099 ) ) ( not ( = ?auto_163093 ?auto_163100 ) ) ( not ( = ?auto_163093 ?auto_163101 ) ) ( not ( = ?auto_163094 ?auto_163095 ) ) ( not ( = ?auto_163094 ?auto_163096 ) ) ( not ( = ?auto_163094 ?auto_163097 ) ) ( not ( = ?auto_163094 ?auto_163098 ) ) ( not ( = ?auto_163094 ?auto_163099 ) ) ( not ( = ?auto_163094 ?auto_163100 ) ) ( not ( = ?auto_163094 ?auto_163101 ) ) ( not ( = ?auto_163095 ?auto_163096 ) ) ( not ( = ?auto_163095 ?auto_163097 ) ) ( not ( = ?auto_163095 ?auto_163098 ) ) ( not ( = ?auto_163095 ?auto_163099 ) ) ( not ( = ?auto_163095 ?auto_163100 ) ) ( not ( = ?auto_163095 ?auto_163101 ) ) ( not ( = ?auto_163096 ?auto_163097 ) ) ( not ( = ?auto_163096 ?auto_163098 ) ) ( not ( = ?auto_163096 ?auto_163099 ) ) ( not ( = ?auto_163096 ?auto_163100 ) ) ( not ( = ?auto_163096 ?auto_163101 ) ) ( not ( = ?auto_163097 ?auto_163098 ) ) ( not ( = ?auto_163097 ?auto_163099 ) ) ( not ( = ?auto_163097 ?auto_163100 ) ) ( not ( = ?auto_163097 ?auto_163101 ) ) ( not ( = ?auto_163098 ?auto_163099 ) ) ( not ( = ?auto_163098 ?auto_163100 ) ) ( not ( = ?auto_163098 ?auto_163101 ) ) ( not ( = ?auto_163099 ?auto_163100 ) ) ( not ( = ?auto_163099 ?auto_163101 ) ) ( not ( = ?auto_163100 ?auto_163101 ) ) ( ON ?auto_163099 ?auto_163100 ) ( ON ?auto_163098 ?auto_163099 ) ( ON ?auto_163097 ?auto_163098 ) ( ON ?auto_163096 ?auto_163097 ) ( CLEAR ?auto_163094 ) ( ON ?auto_163095 ?auto_163096 ) ( CLEAR ?auto_163095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163090 ?auto_163091 ?auto_163092 ?auto_163093 ?auto_163094 ?auto_163095 )
      ( MAKE-11PILE ?auto_163090 ?auto_163091 ?auto_163092 ?auto_163093 ?auto_163094 ?auto_163095 ?auto_163096 ?auto_163097 ?auto_163098 ?auto_163099 ?auto_163100 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163113 - BLOCK
      ?auto_163114 - BLOCK
      ?auto_163115 - BLOCK
      ?auto_163116 - BLOCK
      ?auto_163117 - BLOCK
      ?auto_163118 - BLOCK
      ?auto_163119 - BLOCK
      ?auto_163120 - BLOCK
      ?auto_163121 - BLOCK
      ?auto_163122 - BLOCK
      ?auto_163123 - BLOCK
    )
    :vars
    (
      ?auto_163124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163123 ?auto_163124 ) ( ON-TABLE ?auto_163113 ) ( ON ?auto_163114 ?auto_163113 ) ( ON ?auto_163115 ?auto_163114 ) ( ON ?auto_163116 ?auto_163115 ) ( not ( = ?auto_163113 ?auto_163114 ) ) ( not ( = ?auto_163113 ?auto_163115 ) ) ( not ( = ?auto_163113 ?auto_163116 ) ) ( not ( = ?auto_163113 ?auto_163117 ) ) ( not ( = ?auto_163113 ?auto_163118 ) ) ( not ( = ?auto_163113 ?auto_163119 ) ) ( not ( = ?auto_163113 ?auto_163120 ) ) ( not ( = ?auto_163113 ?auto_163121 ) ) ( not ( = ?auto_163113 ?auto_163122 ) ) ( not ( = ?auto_163113 ?auto_163123 ) ) ( not ( = ?auto_163113 ?auto_163124 ) ) ( not ( = ?auto_163114 ?auto_163115 ) ) ( not ( = ?auto_163114 ?auto_163116 ) ) ( not ( = ?auto_163114 ?auto_163117 ) ) ( not ( = ?auto_163114 ?auto_163118 ) ) ( not ( = ?auto_163114 ?auto_163119 ) ) ( not ( = ?auto_163114 ?auto_163120 ) ) ( not ( = ?auto_163114 ?auto_163121 ) ) ( not ( = ?auto_163114 ?auto_163122 ) ) ( not ( = ?auto_163114 ?auto_163123 ) ) ( not ( = ?auto_163114 ?auto_163124 ) ) ( not ( = ?auto_163115 ?auto_163116 ) ) ( not ( = ?auto_163115 ?auto_163117 ) ) ( not ( = ?auto_163115 ?auto_163118 ) ) ( not ( = ?auto_163115 ?auto_163119 ) ) ( not ( = ?auto_163115 ?auto_163120 ) ) ( not ( = ?auto_163115 ?auto_163121 ) ) ( not ( = ?auto_163115 ?auto_163122 ) ) ( not ( = ?auto_163115 ?auto_163123 ) ) ( not ( = ?auto_163115 ?auto_163124 ) ) ( not ( = ?auto_163116 ?auto_163117 ) ) ( not ( = ?auto_163116 ?auto_163118 ) ) ( not ( = ?auto_163116 ?auto_163119 ) ) ( not ( = ?auto_163116 ?auto_163120 ) ) ( not ( = ?auto_163116 ?auto_163121 ) ) ( not ( = ?auto_163116 ?auto_163122 ) ) ( not ( = ?auto_163116 ?auto_163123 ) ) ( not ( = ?auto_163116 ?auto_163124 ) ) ( not ( = ?auto_163117 ?auto_163118 ) ) ( not ( = ?auto_163117 ?auto_163119 ) ) ( not ( = ?auto_163117 ?auto_163120 ) ) ( not ( = ?auto_163117 ?auto_163121 ) ) ( not ( = ?auto_163117 ?auto_163122 ) ) ( not ( = ?auto_163117 ?auto_163123 ) ) ( not ( = ?auto_163117 ?auto_163124 ) ) ( not ( = ?auto_163118 ?auto_163119 ) ) ( not ( = ?auto_163118 ?auto_163120 ) ) ( not ( = ?auto_163118 ?auto_163121 ) ) ( not ( = ?auto_163118 ?auto_163122 ) ) ( not ( = ?auto_163118 ?auto_163123 ) ) ( not ( = ?auto_163118 ?auto_163124 ) ) ( not ( = ?auto_163119 ?auto_163120 ) ) ( not ( = ?auto_163119 ?auto_163121 ) ) ( not ( = ?auto_163119 ?auto_163122 ) ) ( not ( = ?auto_163119 ?auto_163123 ) ) ( not ( = ?auto_163119 ?auto_163124 ) ) ( not ( = ?auto_163120 ?auto_163121 ) ) ( not ( = ?auto_163120 ?auto_163122 ) ) ( not ( = ?auto_163120 ?auto_163123 ) ) ( not ( = ?auto_163120 ?auto_163124 ) ) ( not ( = ?auto_163121 ?auto_163122 ) ) ( not ( = ?auto_163121 ?auto_163123 ) ) ( not ( = ?auto_163121 ?auto_163124 ) ) ( not ( = ?auto_163122 ?auto_163123 ) ) ( not ( = ?auto_163122 ?auto_163124 ) ) ( not ( = ?auto_163123 ?auto_163124 ) ) ( ON ?auto_163122 ?auto_163123 ) ( ON ?auto_163121 ?auto_163122 ) ( ON ?auto_163120 ?auto_163121 ) ( ON ?auto_163119 ?auto_163120 ) ( ON ?auto_163118 ?auto_163119 ) ( CLEAR ?auto_163116 ) ( ON ?auto_163117 ?auto_163118 ) ( CLEAR ?auto_163117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163113 ?auto_163114 ?auto_163115 ?auto_163116 ?auto_163117 )
      ( MAKE-11PILE ?auto_163113 ?auto_163114 ?auto_163115 ?auto_163116 ?auto_163117 ?auto_163118 ?auto_163119 ?auto_163120 ?auto_163121 ?auto_163122 ?auto_163123 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163136 - BLOCK
      ?auto_163137 - BLOCK
      ?auto_163138 - BLOCK
      ?auto_163139 - BLOCK
      ?auto_163140 - BLOCK
      ?auto_163141 - BLOCK
      ?auto_163142 - BLOCK
      ?auto_163143 - BLOCK
      ?auto_163144 - BLOCK
      ?auto_163145 - BLOCK
      ?auto_163146 - BLOCK
    )
    :vars
    (
      ?auto_163147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163146 ?auto_163147 ) ( ON-TABLE ?auto_163136 ) ( ON ?auto_163137 ?auto_163136 ) ( ON ?auto_163138 ?auto_163137 ) ( ON ?auto_163139 ?auto_163138 ) ( not ( = ?auto_163136 ?auto_163137 ) ) ( not ( = ?auto_163136 ?auto_163138 ) ) ( not ( = ?auto_163136 ?auto_163139 ) ) ( not ( = ?auto_163136 ?auto_163140 ) ) ( not ( = ?auto_163136 ?auto_163141 ) ) ( not ( = ?auto_163136 ?auto_163142 ) ) ( not ( = ?auto_163136 ?auto_163143 ) ) ( not ( = ?auto_163136 ?auto_163144 ) ) ( not ( = ?auto_163136 ?auto_163145 ) ) ( not ( = ?auto_163136 ?auto_163146 ) ) ( not ( = ?auto_163136 ?auto_163147 ) ) ( not ( = ?auto_163137 ?auto_163138 ) ) ( not ( = ?auto_163137 ?auto_163139 ) ) ( not ( = ?auto_163137 ?auto_163140 ) ) ( not ( = ?auto_163137 ?auto_163141 ) ) ( not ( = ?auto_163137 ?auto_163142 ) ) ( not ( = ?auto_163137 ?auto_163143 ) ) ( not ( = ?auto_163137 ?auto_163144 ) ) ( not ( = ?auto_163137 ?auto_163145 ) ) ( not ( = ?auto_163137 ?auto_163146 ) ) ( not ( = ?auto_163137 ?auto_163147 ) ) ( not ( = ?auto_163138 ?auto_163139 ) ) ( not ( = ?auto_163138 ?auto_163140 ) ) ( not ( = ?auto_163138 ?auto_163141 ) ) ( not ( = ?auto_163138 ?auto_163142 ) ) ( not ( = ?auto_163138 ?auto_163143 ) ) ( not ( = ?auto_163138 ?auto_163144 ) ) ( not ( = ?auto_163138 ?auto_163145 ) ) ( not ( = ?auto_163138 ?auto_163146 ) ) ( not ( = ?auto_163138 ?auto_163147 ) ) ( not ( = ?auto_163139 ?auto_163140 ) ) ( not ( = ?auto_163139 ?auto_163141 ) ) ( not ( = ?auto_163139 ?auto_163142 ) ) ( not ( = ?auto_163139 ?auto_163143 ) ) ( not ( = ?auto_163139 ?auto_163144 ) ) ( not ( = ?auto_163139 ?auto_163145 ) ) ( not ( = ?auto_163139 ?auto_163146 ) ) ( not ( = ?auto_163139 ?auto_163147 ) ) ( not ( = ?auto_163140 ?auto_163141 ) ) ( not ( = ?auto_163140 ?auto_163142 ) ) ( not ( = ?auto_163140 ?auto_163143 ) ) ( not ( = ?auto_163140 ?auto_163144 ) ) ( not ( = ?auto_163140 ?auto_163145 ) ) ( not ( = ?auto_163140 ?auto_163146 ) ) ( not ( = ?auto_163140 ?auto_163147 ) ) ( not ( = ?auto_163141 ?auto_163142 ) ) ( not ( = ?auto_163141 ?auto_163143 ) ) ( not ( = ?auto_163141 ?auto_163144 ) ) ( not ( = ?auto_163141 ?auto_163145 ) ) ( not ( = ?auto_163141 ?auto_163146 ) ) ( not ( = ?auto_163141 ?auto_163147 ) ) ( not ( = ?auto_163142 ?auto_163143 ) ) ( not ( = ?auto_163142 ?auto_163144 ) ) ( not ( = ?auto_163142 ?auto_163145 ) ) ( not ( = ?auto_163142 ?auto_163146 ) ) ( not ( = ?auto_163142 ?auto_163147 ) ) ( not ( = ?auto_163143 ?auto_163144 ) ) ( not ( = ?auto_163143 ?auto_163145 ) ) ( not ( = ?auto_163143 ?auto_163146 ) ) ( not ( = ?auto_163143 ?auto_163147 ) ) ( not ( = ?auto_163144 ?auto_163145 ) ) ( not ( = ?auto_163144 ?auto_163146 ) ) ( not ( = ?auto_163144 ?auto_163147 ) ) ( not ( = ?auto_163145 ?auto_163146 ) ) ( not ( = ?auto_163145 ?auto_163147 ) ) ( not ( = ?auto_163146 ?auto_163147 ) ) ( ON ?auto_163145 ?auto_163146 ) ( ON ?auto_163144 ?auto_163145 ) ( ON ?auto_163143 ?auto_163144 ) ( ON ?auto_163142 ?auto_163143 ) ( ON ?auto_163141 ?auto_163142 ) ( CLEAR ?auto_163139 ) ( ON ?auto_163140 ?auto_163141 ) ( CLEAR ?auto_163140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163136 ?auto_163137 ?auto_163138 ?auto_163139 ?auto_163140 )
      ( MAKE-11PILE ?auto_163136 ?auto_163137 ?auto_163138 ?auto_163139 ?auto_163140 ?auto_163141 ?auto_163142 ?auto_163143 ?auto_163144 ?auto_163145 ?auto_163146 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163159 - BLOCK
      ?auto_163160 - BLOCK
      ?auto_163161 - BLOCK
      ?auto_163162 - BLOCK
      ?auto_163163 - BLOCK
      ?auto_163164 - BLOCK
      ?auto_163165 - BLOCK
      ?auto_163166 - BLOCK
      ?auto_163167 - BLOCK
      ?auto_163168 - BLOCK
      ?auto_163169 - BLOCK
    )
    :vars
    (
      ?auto_163170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163169 ?auto_163170 ) ( ON-TABLE ?auto_163159 ) ( ON ?auto_163160 ?auto_163159 ) ( ON ?auto_163161 ?auto_163160 ) ( not ( = ?auto_163159 ?auto_163160 ) ) ( not ( = ?auto_163159 ?auto_163161 ) ) ( not ( = ?auto_163159 ?auto_163162 ) ) ( not ( = ?auto_163159 ?auto_163163 ) ) ( not ( = ?auto_163159 ?auto_163164 ) ) ( not ( = ?auto_163159 ?auto_163165 ) ) ( not ( = ?auto_163159 ?auto_163166 ) ) ( not ( = ?auto_163159 ?auto_163167 ) ) ( not ( = ?auto_163159 ?auto_163168 ) ) ( not ( = ?auto_163159 ?auto_163169 ) ) ( not ( = ?auto_163159 ?auto_163170 ) ) ( not ( = ?auto_163160 ?auto_163161 ) ) ( not ( = ?auto_163160 ?auto_163162 ) ) ( not ( = ?auto_163160 ?auto_163163 ) ) ( not ( = ?auto_163160 ?auto_163164 ) ) ( not ( = ?auto_163160 ?auto_163165 ) ) ( not ( = ?auto_163160 ?auto_163166 ) ) ( not ( = ?auto_163160 ?auto_163167 ) ) ( not ( = ?auto_163160 ?auto_163168 ) ) ( not ( = ?auto_163160 ?auto_163169 ) ) ( not ( = ?auto_163160 ?auto_163170 ) ) ( not ( = ?auto_163161 ?auto_163162 ) ) ( not ( = ?auto_163161 ?auto_163163 ) ) ( not ( = ?auto_163161 ?auto_163164 ) ) ( not ( = ?auto_163161 ?auto_163165 ) ) ( not ( = ?auto_163161 ?auto_163166 ) ) ( not ( = ?auto_163161 ?auto_163167 ) ) ( not ( = ?auto_163161 ?auto_163168 ) ) ( not ( = ?auto_163161 ?auto_163169 ) ) ( not ( = ?auto_163161 ?auto_163170 ) ) ( not ( = ?auto_163162 ?auto_163163 ) ) ( not ( = ?auto_163162 ?auto_163164 ) ) ( not ( = ?auto_163162 ?auto_163165 ) ) ( not ( = ?auto_163162 ?auto_163166 ) ) ( not ( = ?auto_163162 ?auto_163167 ) ) ( not ( = ?auto_163162 ?auto_163168 ) ) ( not ( = ?auto_163162 ?auto_163169 ) ) ( not ( = ?auto_163162 ?auto_163170 ) ) ( not ( = ?auto_163163 ?auto_163164 ) ) ( not ( = ?auto_163163 ?auto_163165 ) ) ( not ( = ?auto_163163 ?auto_163166 ) ) ( not ( = ?auto_163163 ?auto_163167 ) ) ( not ( = ?auto_163163 ?auto_163168 ) ) ( not ( = ?auto_163163 ?auto_163169 ) ) ( not ( = ?auto_163163 ?auto_163170 ) ) ( not ( = ?auto_163164 ?auto_163165 ) ) ( not ( = ?auto_163164 ?auto_163166 ) ) ( not ( = ?auto_163164 ?auto_163167 ) ) ( not ( = ?auto_163164 ?auto_163168 ) ) ( not ( = ?auto_163164 ?auto_163169 ) ) ( not ( = ?auto_163164 ?auto_163170 ) ) ( not ( = ?auto_163165 ?auto_163166 ) ) ( not ( = ?auto_163165 ?auto_163167 ) ) ( not ( = ?auto_163165 ?auto_163168 ) ) ( not ( = ?auto_163165 ?auto_163169 ) ) ( not ( = ?auto_163165 ?auto_163170 ) ) ( not ( = ?auto_163166 ?auto_163167 ) ) ( not ( = ?auto_163166 ?auto_163168 ) ) ( not ( = ?auto_163166 ?auto_163169 ) ) ( not ( = ?auto_163166 ?auto_163170 ) ) ( not ( = ?auto_163167 ?auto_163168 ) ) ( not ( = ?auto_163167 ?auto_163169 ) ) ( not ( = ?auto_163167 ?auto_163170 ) ) ( not ( = ?auto_163168 ?auto_163169 ) ) ( not ( = ?auto_163168 ?auto_163170 ) ) ( not ( = ?auto_163169 ?auto_163170 ) ) ( ON ?auto_163168 ?auto_163169 ) ( ON ?auto_163167 ?auto_163168 ) ( ON ?auto_163166 ?auto_163167 ) ( ON ?auto_163165 ?auto_163166 ) ( ON ?auto_163164 ?auto_163165 ) ( ON ?auto_163163 ?auto_163164 ) ( CLEAR ?auto_163161 ) ( ON ?auto_163162 ?auto_163163 ) ( CLEAR ?auto_163162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163159 ?auto_163160 ?auto_163161 ?auto_163162 )
      ( MAKE-11PILE ?auto_163159 ?auto_163160 ?auto_163161 ?auto_163162 ?auto_163163 ?auto_163164 ?auto_163165 ?auto_163166 ?auto_163167 ?auto_163168 ?auto_163169 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163182 - BLOCK
      ?auto_163183 - BLOCK
      ?auto_163184 - BLOCK
      ?auto_163185 - BLOCK
      ?auto_163186 - BLOCK
      ?auto_163187 - BLOCK
      ?auto_163188 - BLOCK
      ?auto_163189 - BLOCK
      ?auto_163190 - BLOCK
      ?auto_163191 - BLOCK
      ?auto_163192 - BLOCK
    )
    :vars
    (
      ?auto_163193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163192 ?auto_163193 ) ( ON-TABLE ?auto_163182 ) ( ON ?auto_163183 ?auto_163182 ) ( ON ?auto_163184 ?auto_163183 ) ( not ( = ?auto_163182 ?auto_163183 ) ) ( not ( = ?auto_163182 ?auto_163184 ) ) ( not ( = ?auto_163182 ?auto_163185 ) ) ( not ( = ?auto_163182 ?auto_163186 ) ) ( not ( = ?auto_163182 ?auto_163187 ) ) ( not ( = ?auto_163182 ?auto_163188 ) ) ( not ( = ?auto_163182 ?auto_163189 ) ) ( not ( = ?auto_163182 ?auto_163190 ) ) ( not ( = ?auto_163182 ?auto_163191 ) ) ( not ( = ?auto_163182 ?auto_163192 ) ) ( not ( = ?auto_163182 ?auto_163193 ) ) ( not ( = ?auto_163183 ?auto_163184 ) ) ( not ( = ?auto_163183 ?auto_163185 ) ) ( not ( = ?auto_163183 ?auto_163186 ) ) ( not ( = ?auto_163183 ?auto_163187 ) ) ( not ( = ?auto_163183 ?auto_163188 ) ) ( not ( = ?auto_163183 ?auto_163189 ) ) ( not ( = ?auto_163183 ?auto_163190 ) ) ( not ( = ?auto_163183 ?auto_163191 ) ) ( not ( = ?auto_163183 ?auto_163192 ) ) ( not ( = ?auto_163183 ?auto_163193 ) ) ( not ( = ?auto_163184 ?auto_163185 ) ) ( not ( = ?auto_163184 ?auto_163186 ) ) ( not ( = ?auto_163184 ?auto_163187 ) ) ( not ( = ?auto_163184 ?auto_163188 ) ) ( not ( = ?auto_163184 ?auto_163189 ) ) ( not ( = ?auto_163184 ?auto_163190 ) ) ( not ( = ?auto_163184 ?auto_163191 ) ) ( not ( = ?auto_163184 ?auto_163192 ) ) ( not ( = ?auto_163184 ?auto_163193 ) ) ( not ( = ?auto_163185 ?auto_163186 ) ) ( not ( = ?auto_163185 ?auto_163187 ) ) ( not ( = ?auto_163185 ?auto_163188 ) ) ( not ( = ?auto_163185 ?auto_163189 ) ) ( not ( = ?auto_163185 ?auto_163190 ) ) ( not ( = ?auto_163185 ?auto_163191 ) ) ( not ( = ?auto_163185 ?auto_163192 ) ) ( not ( = ?auto_163185 ?auto_163193 ) ) ( not ( = ?auto_163186 ?auto_163187 ) ) ( not ( = ?auto_163186 ?auto_163188 ) ) ( not ( = ?auto_163186 ?auto_163189 ) ) ( not ( = ?auto_163186 ?auto_163190 ) ) ( not ( = ?auto_163186 ?auto_163191 ) ) ( not ( = ?auto_163186 ?auto_163192 ) ) ( not ( = ?auto_163186 ?auto_163193 ) ) ( not ( = ?auto_163187 ?auto_163188 ) ) ( not ( = ?auto_163187 ?auto_163189 ) ) ( not ( = ?auto_163187 ?auto_163190 ) ) ( not ( = ?auto_163187 ?auto_163191 ) ) ( not ( = ?auto_163187 ?auto_163192 ) ) ( not ( = ?auto_163187 ?auto_163193 ) ) ( not ( = ?auto_163188 ?auto_163189 ) ) ( not ( = ?auto_163188 ?auto_163190 ) ) ( not ( = ?auto_163188 ?auto_163191 ) ) ( not ( = ?auto_163188 ?auto_163192 ) ) ( not ( = ?auto_163188 ?auto_163193 ) ) ( not ( = ?auto_163189 ?auto_163190 ) ) ( not ( = ?auto_163189 ?auto_163191 ) ) ( not ( = ?auto_163189 ?auto_163192 ) ) ( not ( = ?auto_163189 ?auto_163193 ) ) ( not ( = ?auto_163190 ?auto_163191 ) ) ( not ( = ?auto_163190 ?auto_163192 ) ) ( not ( = ?auto_163190 ?auto_163193 ) ) ( not ( = ?auto_163191 ?auto_163192 ) ) ( not ( = ?auto_163191 ?auto_163193 ) ) ( not ( = ?auto_163192 ?auto_163193 ) ) ( ON ?auto_163191 ?auto_163192 ) ( ON ?auto_163190 ?auto_163191 ) ( ON ?auto_163189 ?auto_163190 ) ( ON ?auto_163188 ?auto_163189 ) ( ON ?auto_163187 ?auto_163188 ) ( ON ?auto_163186 ?auto_163187 ) ( CLEAR ?auto_163184 ) ( ON ?auto_163185 ?auto_163186 ) ( CLEAR ?auto_163185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163182 ?auto_163183 ?auto_163184 ?auto_163185 )
      ( MAKE-11PILE ?auto_163182 ?auto_163183 ?auto_163184 ?auto_163185 ?auto_163186 ?auto_163187 ?auto_163188 ?auto_163189 ?auto_163190 ?auto_163191 ?auto_163192 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163205 - BLOCK
      ?auto_163206 - BLOCK
      ?auto_163207 - BLOCK
      ?auto_163208 - BLOCK
      ?auto_163209 - BLOCK
      ?auto_163210 - BLOCK
      ?auto_163211 - BLOCK
      ?auto_163212 - BLOCK
      ?auto_163213 - BLOCK
      ?auto_163214 - BLOCK
      ?auto_163215 - BLOCK
    )
    :vars
    (
      ?auto_163216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163215 ?auto_163216 ) ( ON-TABLE ?auto_163205 ) ( ON ?auto_163206 ?auto_163205 ) ( not ( = ?auto_163205 ?auto_163206 ) ) ( not ( = ?auto_163205 ?auto_163207 ) ) ( not ( = ?auto_163205 ?auto_163208 ) ) ( not ( = ?auto_163205 ?auto_163209 ) ) ( not ( = ?auto_163205 ?auto_163210 ) ) ( not ( = ?auto_163205 ?auto_163211 ) ) ( not ( = ?auto_163205 ?auto_163212 ) ) ( not ( = ?auto_163205 ?auto_163213 ) ) ( not ( = ?auto_163205 ?auto_163214 ) ) ( not ( = ?auto_163205 ?auto_163215 ) ) ( not ( = ?auto_163205 ?auto_163216 ) ) ( not ( = ?auto_163206 ?auto_163207 ) ) ( not ( = ?auto_163206 ?auto_163208 ) ) ( not ( = ?auto_163206 ?auto_163209 ) ) ( not ( = ?auto_163206 ?auto_163210 ) ) ( not ( = ?auto_163206 ?auto_163211 ) ) ( not ( = ?auto_163206 ?auto_163212 ) ) ( not ( = ?auto_163206 ?auto_163213 ) ) ( not ( = ?auto_163206 ?auto_163214 ) ) ( not ( = ?auto_163206 ?auto_163215 ) ) ( not ( = ?auto_163206 ?auto_163216 ) ) ( not ( = ?auto_163207 ?auto_163208 ) ) ( not ( = ?auto_163207 ?auto_163209 ) ) ( not ( = ?auto_163207 ?auto_163210 ) ) ( not ( = ?auto_163207 ?auto_163211 ) ) ( not ( = ?auto_163207 ?auto_163212 ) ) ( not ( = ?auto_163207 ?auto_163213 ) ) ( not ( = ?auto_163207 ?auto_163214 ) ) ( not ( = ?auto_163207 ?auto_163215 ) ) ( not ( = ?auto_163207 ?auto_163216 ) ) ( not ( = ?auto_163208 ?auto_163209 ) ) ( not ( = ?auto_163208 ?auto_163210 ) ) ( not ( = ?auto_163208 ?auto_163211 ) ) ( not ( = ?auto_163208 ?auto_163212 ) ) ( not ( = ?auto_163208 ?auto_163213 ) ) ( not ( = ?auto_163208 ?auto_163214 ) ) ( not ( = ?auto_163208 ?auto_163215 ) ) ( not ( = ?auto_163208 ?auto_163216 ) ) ( not ( = ?auto_163209 ?auto_163210 ) ) ( not ( = ?auto_163209 ?auto_163211 ) ) ( not ( = ?auto_163209 ?auto_163212 ) ) ( not ( = ?auto_163209 ?auto_163213 ) ) ( not ( = ?auto_163209 ?auto_163214 ) ) ( not ( = ?auto_163209 ?auto_163215 ) ) ( not ( = ?auto_163209 ?auto_163216 ) ) ( not ( = ?auto_163210 ?auto_163211 ) ) ( not ( = ?auto_163210 ?auto_163212 ) ) ( not ( = ?auto_163210 ?auto_163213 ) ) ( not ( = ?auto_163210 ?auto_163214 ) ) ( not ( = ?auto_163210 ?auto_163215 ) ) ( not ( = ?auto_163210 ?auto_163216 ) ) ( not ( = ?auto_163211 ?auto_163212 ) ) ( not ( = ?auto_163211 ?auto_163213 ) ) ( not ( = ?auto_163211 ?auto_163214 ) ) ( not ( = ?auto_163211 ?auto_163215 ) ) ( not ( = ?auto_163211 ?auto_163216 ) ) ( not ( = ?auto_163212 ?auto_163213 ) ) ( not ( = ?auto_163212 ?auto_163214 ) ) ( not ( = ?auto_163212 ?auto_163215 ) ) ( not ( = ?auto_163212 ?auto_163216 ) ) ( not ( = ?auto_163213 ?auto_163214 ) ) ( not ( = ?auto_163213 ?auto_163215 ) ) ( not ( = ?auto_163213 ?auto_163216 ) ) ( not ( = ?auto_163214 ?auto_163215 ) ) ( not ( = ?auto_163214 ?auto_163216 ) ) ( not ( = ?auto_163215 ?auto_163216 ) ) ( ON ?auto_163214 ?auto_163215 ) ( ON ?auto_163213 ?auto_163214 ) ( ON ?auto_163212 ?auto_163213 ) ( ON ?auto_163211 ?auto_163212 ) ( ON ?auto_163210 ?auto_163211 ) ( ON ?auto_163209 ?auto_163210 ) ( ON ?auto_163208 ?auto_163209 ) ( CLEAR ?auto_163206 ) ( ON ?auto_163207 ?auto_163208 ) ( CLEAR ?auto_163207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163205 ?auto_163206 ?auto_163207 )
      ( MAKE-11PILE ?auto_163205 ?auto_163206 ?auto_163207 ?auto_163208 ?auto_163209 ?auto_163210 ?auto_163211 ?auto_163212 ?auto_163213 ?auto_163214 ?auto_163215 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163228 - BLOCK
      ?auto_163229 - BLOCK
      ?auto_163230 - BLOCK
      ?auto_163231 - BLOCK
      ?auto_163232 - BLOCK
      ?auto_163233 - BLOCK
      ?auto_163234 - BLOCK
      ?auto_163235 - BLOCK
      ?auto_163236 - BLOCK
      ?auto_163237 - BLOCK
      ?auto_163238 - BLOCK
    )
    :vars
    (
      ?auto_163239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163238 ?auto_163239 ) ( ON-TABLE ?auto_163228 ) ( ON ?auto_163229 ?auto_163228 ) ( not ( = ?auto_163228 ?auto_163229 ) ) ( not ( = ?auto_163228 ?auto_163230 ) ) ( not ( = ?auto_163228 ?auto_163231 ) ) ( not ( = ?auto_163228 ?auto_163232 ) ) ( not ( = ?auto_163228 ?auto_163233 ) ) ( not ( = ?auto_163228 ?auto_163234 ) ) ( not ( = ?auto_163228 ?auto_163235 ) ) ( not ( = ?auto_163228 ?auto_163236 ) ) ( not ( = ?auto_163228 ?auto_163237 ) ) ( not ( = ?auto_163228 ?auto_163238 ) ) ( not ( = ?auto_163228 ?auto_163239 ) ) ( not ( = ?auto_163229 ?auto_163230 ) ) ( not ( = ?auto_163229 ?auto_163231 ) ) ( not ( = ?auto_163229 ?auto_163232 ) ) ( not ( = ?auto_163229 ?auto_163233 ) ) ( not ( = ?auto_163229 ?auto_163234 ) ) ( not ( = ?auto_163229 ?auto_163235 ) ) ( not ( = ?auto_163229 ?auto_163236 ) ) ( not ( = ?auto_163229 ?auto_163237 ) ) ( not ( = ?auto_163229 ?auto_163238 ) ) ( not ( = ?auto_163229 ?auto_163239 ) ) ( not ( = ?auto_163230 ?auto_163231 ) ) ( not ( = ?auto_163230 ?auto_163232 ) ) ( not ( = ?auto_163230 ?auto_163233 ) ) ( not ( = ?auto_163230 ?auto_163234 ) ) ( not ( = ?auto_163230 ?auto_163235 ) ) ( not ( = ?auto_163230 ?auto_163236 ) ) ( not ( = ?auto_163230 ?auto_163237 ) ) ( not ( = ?auto_163230 ?auto_163238 ) ) ( not ( = ?auto_163230 ?auto_163239 ) ) ( not ( = ?auto_163231 ?auto_163232 ) ) ( not ( = ?auto_163231 ?auto_163233 ) ) ( not ( = ?auto_163231 ?auto_163234 ) ) ( not ( = ?auto_163231 ?auto_163235 ) ) ( not ( = ?auto_163231 ?auto_163236 ) ) ( not ( = ?auto_163231 ?auto_163237 ) ) ( not ( = ?auto_163231 ?auto_163238 ) ) ( not ( = ?auto_163231 ?auto_163239 ) ) ( not ( = ?auto_163232 ?auto_163233 ) ) ( not ( = ?auto_163232 ?auto_163234 ) ) ( not ( = ?auto_163232 ?auto_163235 ) ) ( not ( = ?auto_163232 ?auto_163236 ) ) ( not ( = ?auto_163232 ?auto_163237 ) ) ( not ( = ?auto_163232 ?auto_163238 ) ) ( not ( = ?auto_163232 ?auto_163239 ) ) ( not ( = ?auto_163233 ?auto_163234 ) ) ( not ( = ?auto_163233 ?auto_163235 ) ) ( not ( = ?auto_163233 ?auto_163236 ) ) ( not ( = ?auto_163233 ?auto_163237 ) ) ( not ( = ?auto_163233 ?auto_163238 ) ) ( not ( = ?auto_163233 ?auto_163239 ) ) ( not ( = ?auto_163234 ?auto_163235 ) ) ( not ( = ?auto_163234 ?auto_163236 ) ) ( not ( = ?auto_163234 ?auto_163237 ) ) ( not ( = ?auto_163234 ?auto_163238 ) ) ( not ( = ?auto_163234 ?auto_163239 ) ) ( not ( = ?auto_163235 ?auto_163236 ) ) ( not ( = ?auto_163235 ?auto_163237 ) ) ( not ( = ?auto_163235 ?auto_163238 ) ) ( not ( = ?auto_163235 ?auto_163239 ) ) ( not ( = ?auto_163236 ?auto_163237 ) ) ( not ( = ?auto_163236 ?auto_163238 ) ) ( not ( = ?auto_163236 ?auto_163239 ) ) ( not ( = ?auto_163237 ?auto_163238 ) ) ( not ( = ?auto_163237 ?auto_163239 ) ) ( not ( = ?auto_163238 ?auto_163239 ) ) ( ON ?auto_163237 ?auto_163238 ) ( ON ?auto_163236 ?auto_163237 ) ( ON ?auto_163235 ?auto_163236 ) ( ON ?auto_163234 ?auto_163235 ) ( ON ?auto_163233 ?auto_163234 ) ( ON ?auto_163232 ?auto_163233 ) ( ON ?auto_163231 ?auto_163232 ) ( CLEAR ?auto_163229 ) ( ON ?auto_163230 ?auto_163231 ) ( CLEAR ?auto_163230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163228 ?auto_163229 ?auto_163230 )
      ( MAKE-11PILE ?auto_163228 ?auto_163229 ?auto_163230 ?auto_163231 ?auto_163232 ?auto_163233 ?auto_163234 ?auto_163235 ?auto_163236 ?auto_163237 ?auto_163238 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163251 - BLOCK
      ?auto_163252 - BLOCK
      ?auto_163253 - BLOCK
      ?auto_163254 - BLOCK
      ?auto_163255 - BLOCK
      ?auto_163256 - BLOCK
      ?auto_163257 - BLOCK
      ?auto_163258 - BLOCK
      ?auto_163259 - BLOCK
      ?auto_163260 - BLOCK
      ?auto_163261 - BLOCK
    )
    :vars
    (
      ?auto_163262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163261 ?auto_163262 ) ( ON-TABLE ?auto_163251 ) ( not ( = ?auto_163251 ?auto_163252 ) ) ( not ( = ?auto_163251 ?auto_163253 ) ) ( not ( = ?auto_163251 ?auto_163254 ) ) ( not ( = ?auto_163251 ?auto_163255 ) ) ( not ( = ?auto_163251 ?auto_163256 ) ) ( not ( = ?auto_163251 ?auto_163257 ) ) ( not ( = ?auto_163251 ?auto_163258 ) ) ( not ( = ?auto_163251 ?auto_163259 ) ) ( not ( = ?auto_163251 ?auto_163260 ) ) ( not ( = ?auto_163251 ?auto_163261 ) ) ( not ( = ?auto_163251 ?auto_163262 ) ) ( not ( = ?auto_163252 ?auto_163253 ) ) ( not ( = ?auto_163252 ?auto_163254 ) ) ( not ( = ?auto_163252 ?auto_163255 ) ) ( not ( = ?auto_163252 ?auto_163256 ) ) ( not ( = ?auto_163252 ?auto_163257 ) ) ( not ( = ?auto_163252 ?auto_163258 ) ) ( not ( = ?auto_163252 ?auto_163259 ) ) ( not ( = ?auto_163252 ?auto_163260 ) ) ( not ( = ?auto_163252 ?auto_163261 ) ) ( not ( = ?auto_163252 ?auto_163262 ) ) ( not ( = ?auto_163253 ?auto_163254 ) ) ( not ( = ?auto_163253 ?auto_163255 ) ) ( not ( = ?auto_163253 ?auto_163256 ) ) ( not ( = ?auto_163253 ?auto_163257 ) ) ( not ( = ?auto_163253 ?auto_163258 ) ) ( not ( = ?auto_163253 ?auto_163259 ) ) ( not ( = ?auto_163253 ?auto_163260 ) ) ( not ( = ?auto_163253 ?auto_163261 ) ) ( not ( = ?auto_163253 ?auto_163262 ) ) ( not ( = ?auto_163254 ?auto_163255 ) ) ( not ( = ?auto_163254 ?auto_163256 ) ) ( not ( = ?auto_163254 ?auto_163257 ) ) ( not ( = ?auto_163254 ?auto_163258 ) ) ( not ( = ?auto_163254 ?auto_163259 ) ) ( not ( = ?auto_163254 ?auto_163260 ) ) ( not ( = ?auto_163254 ?auto_163261 ) ) ( not ( = ?auto_163254 ?auto_163262 ) ) ( not ( = ?auto_163255 ?auto_163256 ) ) ( not ( = ?auto_163255 ?auto_163257 ) ) ( not ( = ?auto_163255 ?auto_163258 ) ) ( not ( = ?auto_163255 ?auto_163259 ) ) ( not ( = ?auto_163255 ?auto_163260 ) ) ( not ( = ?auto_163255 ?auto_163261 ) ) ( not ( = ?auto_163255 ?auto_163262 ) ) ( not ( = ?auto_163256 ?auto_163257 ) ) ( not ( = ?auto_163256 ?auto_163258 ) ) ( not ( = ?auto_163256 ?auto_163259 ) ) ( not ( = ?auto_163256 ?auto_163260 ) ) ( not ( = ?auto_163256 ?auto_163261 ) ) ( not ( = ?auto_163256 ?auto_163262 ) ) ( not ( = ?auto_163257 ?auto_163258 ) ) ( not ( = ?auto_163257 ?auto_163259 ) ) ( not ( = ?auto_163257 ?auto_163260 ) ) ( not ( = ?auto_163257 ?auto_163261 ) ) ( not ( = ?auto_163257 ?auto_163262 ) ) ( not ( = ?auto_163258 ?auto_163259 ) ) ( not ( = ?auto_163258 ?auto_163260 ) ) ( not ( = ?auto_163258 ?auto_163261 ) ) ( not ( = ?auto_163258 ?auto_163262 ) ) ( not ( = ?auto_163259 ?auto_163260 ) ) ( not ( = ?auto_163259 ?auto_163261 ) ) ( not ( = ?auto_163259 ?auto_163262 ) ) ( not ( = ?auto_163260 ?auto_163261 ) ) ( not ( = ?auto_163260 ?auto_163262 ) ) ( not ( = ?auto_163261 ?auto_163262 ) ) ( ON ?auto_163260 ?auto_163261 ) ( ON ?auto_163259 ?auto_163260 ) ( ON ?auto_163258 ?auto_163259 ) ( ON ?auto_163257 ?auto_163258 ) ( ON ?auto_163256 ?auto_163257 ) ( ON ?auto_163255 ?auto_163256 ) ( ON ?auto_163254 ?auto_163255 ) ( ON ?auto_163253 ?auto_163254 ) ( CLEAR ?auto_163251 ) ( ON ?auto_163252 ?auto_163253 ) ( CLEAR ?auto_163252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163251 ?auto_163252 )
      ( MAKE-11PILE ?auto_163251 ?auto_163252 ?auto_163253 ?auto_163254 ?auto_163255 ?auto_163256 ?auto_163257 ?auto_163258 ?auto_163259 ?auto_163260 ?auto_163261 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163274 - BLOCK
      ?auto_163275 - BLOCK
      ?auto_163276 - BLOCK
      ?auto_163277 - BLOCK
      ?auto_163278 - BLOCK
      ?auto_163279 - BLOCK
      ?auto_163280 - BLOCK
      ?auto_163281 - BLOCK
      ?auto_163282 - BLOCK
      ?auto_163283 - BLOCK
      ?auto_163284 - BLOCK
    )
    :vars
    (
      ?auto_163285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163284 ?auto_163285 ) ( ON-TABLE ?auto_163274 ) ( not ( = ?auto_163274 ?auto_163275 ) ) ( not ( = ?auto_163274 ?auto_163276 ) ) ( not ( = ?auto_163274 ?auto_163277 ) ) ( not ( = ?auto_163274 ?auto_163278 ) ) ( not ( = ?auto_163274 ?auto_163279 ) ) ( not ( = ?auto_163274 ?auto_163280 ) ) ( not ( = ?auto_163274 ?auto_163281 ) ) ( not ( = ?auto_163274 ?auto_163282 ) ) ( not ( = ?auto_163274 ?auto_163283 ) ) ( not ( = ?auto_163274 ?auto_163284 ) ) ( not ( = ?auto_163274 ?auto_163285 ) ) ( not ( = ?auto_163275 ?auto_163276 ) ) ( not ( = ?auto_163275 ?auto_163277 ) ) ( not ( = ?auto_163275 ?auto_163278 ) ) ( not ( = ?auto_163275 ?auto_163279 ) ) ( not ( = ?auto_163275 ?auto_163280 ) ) ( not ( = ?auto_163275 ?auto_163281 ) ) ( not ( = ?auto_163275 ?auto_163282 ) ) ( not ( = ?auto_163275 ?auto_163283 ) ) ( not ( = ?auto_163275 ?auto_163284 ) ) ( not ( = ?auto_163275 ?auto_163285 ) ) ( not ( = ?auto_163276 ?auto_163277 ) ) ( not ( = ?auto_163276 ?auto_163278 ) ) ( not ( = ?auto_163276 ?auto_163279 ) ) ( not ( = ?auto_163276 ?auto_163280 ) ) ( not ( = ?auto_163276 ?auto_163281 ) ) ( not ( = ?auto_163276 ?auto_163282 ) ) ( not ( = ?auto_163276 ?auto_163283 ) ) ( not ( = ?auto_163276 ?auto_163284 ) ) ( not ( = ?auto_163276 ?auto_163285 ) ) ( not ( = ?auto_163277 ?auto_163278 ) ) ( not ( = ?auto_163277 ?auto_163279 ) ) ( not ( = ?auto_163277 ?auto_163280 ) ) ( not ( = ?auto_163277 ?auto_163281 ) ) ( not ( = ?auto_163277 ?auto_163282 ) ) ( not ( = ?auto_163277 ?auto_163283 ) ) ( not ( = ?auto_163277 ?auto_163284 ) ) ( not ( = ?auto_163277 ?auto_163285 ) ) ( not ( = ?auto_163278 ?auto_163279 ) ) ( not ( = ?auto_163278 ?auto_163280 ) ) ( not ( = ?auto_163278 ?auto_163281 ) ) ( not ( = ?auto_163278 ?auto_163282 ) ) ( not ( = ?auto_163278 ?auto_163283 ) ) ( not ( = ?auto_163278 ?auto_163284 ) ) ( not ( = ?auto_163278 ?auto_163285 ) ) ( not ( = ?auto_163279 ?auto_163280 ) ) ( not ( = ?auto_163279 ?auto_163281 ) ) ( not ( = ?auto_163279 ?auto_163282 ) ) ( not ( = ?auto_163279 ?auto_163283 ) ) ( not ( = ?auto_163279 ?auto_163284 ) ) ( not ( = ?auto_163279 ?auto_163285 ) ) ( not ( = ?auto_163280 ?auto_163281 ) ) ( not ( = ?auto_163280 ?auto_163282 ) ) ( not ( = ?auto_163280 ?auto_163283 ) ) ( not ( = ?auto_163280 ?auto_163284 ) ) ( not ( = ?auto_163280 ?auto_163285 ) ) ( not ( = ?auto_163281 ?auto_163282 ) ) ( not ( = ?auto_163281 ?auto_163283 ) ) ( not ( = ?auto_163281 ?auto_163284 ) ) ( not ( = ?auto_163281 ?auto_163285 ) ) ( not ( = ?auto_163282 ?auto_163283 ) ) ( not ( = ?auto_163282 ?auto_163284 ) ) ( not ( = ?auto_163282 ?auto_163285 ) ) ( not ( = ?auto_163283 ?auto_163284 ) ) ( not ( = ?auto_163283 ?auto_163285 ) ) ( not ( = ?auto_163284 ?auto_163285 ) ) ( ON ?auto_163283 ?auto_163284 ) ( ON ?auto_163282 ?auto_163283 ) ( ON ?auto_163281 ?auto_163282 ) ( ON ?auto_163280 ?auto_163281 ) ( ON ?auto_163279 ?auto_163280 ) ( ON ?auto_163278 ?auto_163279 ) ( ON ?auto_163277 ?auto_163278 ) ( ON ?auto_163276 ?auto_163277 ) ( CLEAR ?auto_163274 ) ( ON ?auto_163275 ?auto_163276 ) ( CLEAR ?auto_163275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163274 ?auto_163275 )
      ( MAKE-11PILE ?auto_163274 ?auto_163275 ?auto_163276 ?auto_163277 ?auto_163278 ?auto_163279 ?auto_163280 ?auto_163281 ?auto_163282 ?auto_163283 ?auto_163284 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163297 - BLOCK
      ?auto_163298 - BLOCK
      ?auto_163299 - BLOCK
      ?auto_163300 - BLOCK
      ?auto_163301 - BLOCK
      ?auto_163302 - BLOCK
      ?auto_163303 - BLOCK
      ?auto_163304 - BLOCK
      ?auto_163305 - BLOCK
      ?auto_163306 - BLOCK
      ?auto_163307 - BLOCK
    )
    :vars
    (
      ?auto_163308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163307 ?auto_163308 ) ( not ( = ?auto_163297 ?auto_163298 ) ) ( not ( = ?auto_163297 ?auto_163299 ) ) ( not ( = ?auto_163297 ?auto_163300 ) ) ( not ( = ?auto_163297 ?auto_163301 ) ) ( not ( = ?auto_163297 ?auto_163302 ) ) ( not ( = ?auto_163297 ?auto_163303 ) ) ( not ( = ?auto_163297 ?auto_163304 ) ) ( not ( = ?auto_163297 ?auto_163305 ) ) ( not ( = ?auto_163297 ?auto_163306 ) ) ( not ( = ?auto_163297 ?auto_163307 ) ) ( not ( = ?auto_163297 ?auto_163308 ) ) ( not ( = ?auto_163298 ?auto_163299 ) ) ( not ( = ?auto_163298 ?auto_163300 ) ) ( not ( = ?auto_163298 ?auto_163301 ) ) ( not ( = ?auto_163298 ?auto_163302 ) ) ( not ( = ?auto_163298 ?auto_163303 ) ) ( not ( = ?auto_163298 ?auto_163304 ) ) ( not ( = ?auto_163298 ?auto_163305 ) ) ( not ( = ?auto_163298 ?auto_163306 ) ) ( not ( = ?auto_163298 ?auto_163307 ) ) ( not ( = ?auto_163298 ?auto_163308 ) ) ( not ( = ?auto_163299 ?auto_163300 ) ) ( not ( = ?auto_163299 ?auto_163301 ) ) ( not ( = ?auto_163299 ?auto_163302 ) ) ( not ( = ?auto_163299 ?auto_163303 ) ) ( not ( = ?auto_163299 ?auto_163304 ) ) ( not ( = ?auto_163299 ?auto_163305 ) ) ( not ( = ?auto_163299 ?auto_163306 ) ) ( not ( = ?auto_163299 ?auto_163307 ) ) ( not ( = ?auto_163299 ?auto_163308 ) ) ( not ( = ?auto_163300 ?auto_163301 ) ) ( not ( = ?auto_163300 ?auto_163302 ) ) ( not ( = ?auto_163300 ?auto_163303 ) ) ( not ( = ?auto_163300 ?auto_163304 ) ) ( not ( = ?auto_163300 ?auto_163305 ) ) ( not ( = ?auto_163300 ?auto_163306 ) ) ( not ( = ?auto_163300 ?auto_163307 ) ) ( not ( = ?auto_163300 ?auto_163308 ) ) ( not ( = ?auto_163301 ?auto_163302 ) ) ( not ( = ?auto_163301 ?auto_163303 ) ) ( not ( = ?auto_163301 ?auto_163304 ) ) ( not ( = ?auto_163301 ?auto_163305 ) ) ( not ( = ?auto_163301 ?auto_163306 ) ) ( not ( = ?auto_163301 ?auto_163307 ) ) ( not ( = ?auto_163301 ?auto_163308 ) ) ( not ( = ?auto_163302 ?auto_163303 ) ) ( not ( = ?auto_163302 ?auto_163304 ) ) ( not ( = ?auto_163302 ?auto_163305 ) ) ( not ( = ?auto_163302 ?auto_163306 ) ) ( not ( = ?auto_163302 ?auto_163307 ) ) ( not ( = ?auto_163302 ?auto_163308 ) ) ( not ( = ?auto_163303 ?auto_163304 ) ) ( not ( = ?auto_163303 ?auto_163305 ) ) ( not ( = ?auto_163303 ?auto_163306 ) ) ( not ( = ?auto_163303 ?auto_163307 ) ) ( not ( = ?auto_163303 ?auto_163308 ) ) ( not ( = ?auto_163304 ?auto_163305 ) ) ( not ( = ?auto_163304 ?auto_163306 ) ) ( not ( = ?auto_163304 ?auto_163307 ) ) ( not ( = ?auto_163304 ?auto_163308 ) ) ( not ( = ?auto_163305 ?auto_163306 ) ) ( not ( = ?auto_163305 ?auto_163307 ) ) ( not ( = ?auto_163305 ?auto_163308 ) ) ( not ( = ?auto_163306 ?auto_163307 ) ) ( not ( = ?auto_163306 ?auto_163308 ) ) ( not ( = ?auto_163307 ?auto_163308 ) ) ( ON ?auto_163306 ?auto_163307 ) ( ON ?auto_163305 ?auto_163306 ) ( ON ?auto_163304 ?auto_163305 ) ( ON ?auto_163303 ?auto_163304 ) ( ON ?auto_163302 ?auto_163303 ) ( ON ?auto_163301 ?auto_163302 ) ( ON ?auto_163300 ?auto_163301 ) ( ON ?auto_163299 ?auto_163300 ) ( ON ?auto_163298 ?auto_163299 ) ( ON ?auto_163297 ?auto_163298 ) ( CLEAR ?auto_163297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163297 )
      ( MAKE-11PILE ?auto_163297 ?auto_163298 ?auto_163299 ?auto_163300 ?auto_163301 ?auto_163302 ?auto_163303 ?auto_163304 ?auto_163305 ?auto_163306 ?auto_163307 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_163320 - BLOCK
      ?auto_163321 - BLOCK
      ?auto_163322 - BLOCK
      ?auto_163323 - BLOCK
      ?auto_163324 - BLOCK
      ?auto_163325 - BLOCK
      ?auto_163326 - BLOCK
      ?auto_163327 - BLOCK
      ?auto_163328 - BLOCK
      ?auto_163329 - BLOCK
      ?auto_163330 - BLOCK
    )
    :vars
    (
      ?auto_163331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163330 ?auto_163331 ) ( not ( = ?auto_163320 ?auto_163321 ) ) ( not ( = ?auto_163320 ?auto_163322 ) ) ( not ( = ?auto_163320 ?auto_163323 ) ) ( not ( = ?auto_163320 ?auto_163324 ) ) ( not ( = ?auto_163320 ?auto_163325 ) ) ( not ( = ?auto_163320 ?auto_163326 ) ) ( not ( = ?auto_163320 ?auto_163327 ) ) ( not ( = ?auto_163320 ?auto_163328 ) ) ( not ( = ?auto_163320 ?auto_163329 ) ) ( not ( = ?auto_163320 ?auto_163330 ) ) ( not ( = ?auto_163320 ?auto_163331 ) ) ( not ( = ?auto_163321 ?auto_163322 ) ) ( not ( = ?auto_163321 ?auto_163323 ) ) ( not ( = ?auto_163321 ?auto_163324 ) ) ( not ( = ?auto_163321 ?auto_163325 ) ) ( not ( = ?auto_163321 ?auto_163326 ) ) ( not ( = ?auto_163321 ?auto_163327 ) ) ( not ( = ?auto_163321 ?auto_163328 ) ) ( not ( = ?auto_163321 ?auto_163329 ) ) ( not ( = ?auto_163321 ?auto_163330 ) ) ( not ( = ?auto_163321 ?auto_163331 ) ) ( not ( = ?auto_163322 ?auto_163323 ) ) ( not ( = ?auto_163322 ?auto_163324 ) ) ( not ( = ?auto_163322 ?auto_163325 ) ) ( not ( = ?auto_163322 ?auto_163326 ) ) ( not ( = ?auto_163322 ?auto_163327 ) ) ( not ( = ?auto_163322 ?auto_163328 ) ) ( not ( = ?auto_163322 ?auto_163329 ) ) ( not ( = ?auto_163322 ?auto_163330 ) ) ( not ( = ?auto_163322 ?auto_163331 ) ) ( not ( = ?auto_163323 ?auto_163324 ) ) ( not ( = ?auto_163323 ?auto_163325 ) ) ( not ( = ?auto_163323 ?auto_163326 ) ) ( not ( = ?auto_163323 ?auto_163327 ) ) ( not ( = ?auto_163323 ?auto_163328 ) ) ( not ( = ?auto_163323 ?auto_163329 ) ) ( not ( = ?auto_163323 ?auto_163330 ) ) ( not ( = ?auto_163323 ?auto_163331 ) ) ( not ( = ?auto_163324 ?auto_163325 ) ) ( not ( = ?auto_163324 ?auto_163326 ) ) ( not ( = ?auto_163324 ?auto_163327 ) ) ( not ( = ?auto_163324 ?auto_163328 ) ) ( not ( = ?auto_163324 ?auto_163329 ) ) ( not ( = ?auto_163324 ?auto_163330 ) ) ( not ( = ?auto_163324 ?auto_163331 ) ) ( not ( = ?auto_163325 ?auto_163326 ) ) ( not ( = ?auto_163325 ?auto_163327 ) ) ( not ( = ?auto_163325 ?auto_163328 ) ) ( not ( = ?auto_163325 ?auto_163329 ) ) ( not ( = ?auto_163325 ?auto_163330 ) ) ( not ( = ?auto_163325 ?auto_163331 ) ) ( not ( = ?auto_163326 ?auto_163327 ) ) ( not ( = ?auto_163326 ?auto_163328 ) ) ( not ( = ?auto_163326 ?auto_163329 ) ) ( not ( = ?auto_163326 ?auto_163330 ) ) ( not ( = ?auto_163326 ?auto_163331 ) ) ( not ( = ?auto_163327 ?auto_163328 ) ) ( not ( = ?auto_163327 ?auto_163329 ) ) ( not ( = ?auto_163327 ?auto_163330 ) ) ( not ( = ?auto_163327 ?auto_163331 ) ) ( not ( = ?auto_163328 ?auto_163329 ) ) ( not ( = ?auto_163328 ?auto_163330 ) ) ( not ( = ?auto_163328 ?auto_163331 ) ) ( not ( = ?auto_163329 ?auto_163330 ) ) ( not ( = ?auto_163329 ?auto_163331 ) ) ( not ( = ?auto_163330 ?auto_163331 ) ) ( ON ?auto_163329 ?auto_163330 ) ( ON ?auto_163328 ?auto_163329 ) ( ON ?auto_163327 ?auto_163328 ) ( ON ?auto_163326 ?auto_163327 ) ( ON ?auto_163325 ?auto_163326 ) ( ON ?auto_163324 ?auto_163325 ) ( ON ?auto_163323 ?auto_163324 ) ( ON ?auto_163322 ?auto_163323 ) ( ON ?auto_163321 ?auto_163322 ) ( ON ?auto_163320 ?auto_163321 ) ( CLEAR ?auto_163320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163320 )
      ( MAKE-11PILE ?auto_163320 ?auto_163321 ?auto_163322 ?auto_163323 ?auto_163324 ?auto_163325 ?auto_163326 ?auto_163327 ?auto_163328 ?auto_163329 ?auto_163330 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163344 - BLOCK
      ?auto_163345 - BLOCK
      ?auto_163346 - BLOCK
      ?auto_163347 - BLOCK
      ?auto_163348 - BLOCK
      ?auto_163349 - BLOCK
      ?auto_163350 - BLOCK
      ?auto_163351 - BLOCK
      ?auto_163352 - BLOCK
      ?auto_163353 - BLOCK
      ?auto_163354 - BLOCK
      ?auto_163355 - BLOCK
    )
    :vars
    (
      ?auto_163356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_163354 ) ( ON ?auto_163355 ?auto_163356 ) ( CLEAR ?auto_163355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163344 ) ( ON ?auto_163345 ?auto_163344 ) ( ON ?auto_163346 ?auto_163345 ) ( ON ?auto_163347 ?auto_163346 ) ( ON ?auto_163348 ?auto_163347 ) ( ON ?auto_163349 ?auto_163348 ) ( ON ?auto_163350 ?auto_163349 ) ( ON ?auto_163351 ?auto_163350 ) ( ON ?auto_163352 ?auto_163351 ) ( ON ?auto_163353 ?auto_163352 ) ( ON ?auto_163354 ?auto_163353 ) ( not ( = ?auto_163344 ?auto_163345 ) ) ( not ( = ?auto_163344 ?auto_163346 ) ) ( not ( = ?auto_163344 ?auto_163347 ) ) ( not ( = ?auto_163344 ?auto_163348 ) ) ( not ( = ?auto_163344 ?auto_163349 ) ) ( not ( = ?auto_163344 ?auto_163350 ) ) ( not ( = ?auto_163344 ?auto_163351 ) ) ( not ( = ?auto_163344 ?auto_163352 ) ) ( not ( = ?auto_163344 ?auto_163353 ) ) ( not ( = ?auto_163344 ?auto_163354 ) ) ( not ( = ?auto_163344 ?auto_163355 ) ) ( not ( = ?auto_163344 ?auto_163356 ) ) ( not ( = ?auto_163345 ?auto_163346 ) ) ( not ( = ?auto_163345 ?auto_163347 ) ) ( not ( = ?auto_163345 ?auto_163348 ) ) ( not ( = ?auto_163345 ?auto_163349 ) ) ( not ( = ?auto_163345 ?auto_163350 ) ) ( not ( = ?auto_163345 ?auto_163351 ) ) ( not ( = ?auto_163345 ?auto_163352 ) ) ( not ( = ?auto_163345 ?auto_163353 ) ) ( not ( = ?auto_163345 ?auto_163354 ) ) ( not ( = ?auto_163345 ?auto_163355 ) ) ( not ( = ?auto_163345 ?auto_163356 ) ) ( not ( = ?auto_163346 ?auto_163347 ) ) ( not ( = ?auto_163346 ?auto_163348 ) ) ( not ( = ?auto_163346 ?auto_163349 ) ) ( not ( = ?auto_163346 ?auto_163350 ) ) ( not ( = ?auto_163346 ?auto_163351 ) ) ( not ( = ?auto_163346 ?auto_163352 ) ) ( not ( = ?auto_163346 ?auto_163353 ) ) ( not ( = ?auto_163346 ?auto_163354 ) ) ( not ( = ?auto_163346 ?auto_163355 ) ) ( not ( = ?auto_163346 ?auto_163356 ) ) ( not ( = ?auto_163347 ?auto_163348 ) ) ( not ( = ?auto_163347 ?auto_163349 ) ) ( not ( = ?auto_163347 ?auto_163350 ) ) ( not ( = ?auto_163347 ?auto_163351 ) ) ( not ( = ?auto_163347 ?auto_163352 ) ) ( not ( = ?auto_163347 ?auto_163353 ) ) ( not ( = ?auto_163347 ?auto_163354 ) ) ( not ( = ?auto_163347 ?auto_163355 ) ) ( not ( = ?auto_163347 ?auto_163356 ) ) ( not ( = ?auto_163348 ?auto_163349 ) ) ( not ( = ?auto_163348 ?auto_163350 ) ) ( not ( = ?auto_163348 ?auto_163351 ) ) ( not ( = ?auto_163348 ?auto_163352 ) ) ( not ( = ?auto_163348 ?auto_163353 ) ) ( not ( = ?auto_163348 ?auto_163354 ) ) ( not ( = ?auto_163348 ?auto_163355 ) ) ( not ( = ?auto_163348 ?auto_163356 ) ) ( not ( = ?auto_163349 ?auto_163350 ) ) ( not ( = ?auto_163349 ?auto_163351 ) ) ( not ( = ?auto_163349 ?auto_163352 ) ) ( not ( = ?auto_163349 ?auto_163353 ) ) ( not ( = ?auto_163349 ?auto_163354 ) ) ( not ( = ?auto_163349 ?auto_163355 ) ) ( not ( = ?auto_163349 ?auto_163356 ) ) ( not ( = ?auto_163350 ?auto_163351 ) ) ( not ( = ?auto_163350 ?auto_163352 ) ) ( not ( = ?auto_163350 ?auto_163353 ) ) ( not ( = ?auto_163350 ?auto_163354 ) ) ( not ( = ?auto_163350 ?auto_163355 ) ) ( not ( = ?auto_163350 ?auto_163356 ) ) ( not ( = ?auto_163351 ?auto_163352 ) ) ( not ( = ?auto_163351 ?auto_163353 ) ) ( not ( = ?auto_163351 ?auto_163354 ) ) ( not ( = ?auto_163351 ?auto_163355 ) ) ( not ( = ?auto_163351 ?auto_163356 ) ) ( not ( = ?auto_163352 ?auto_163353 ) ) ( not ( = ?auto_163352 ?auto_163354 ) ) ( not ( = ?auto_163352 ?auto_163355 ) ) ( not ( = ?auto_163352 ?auto_163356 ) ) ( not ( = ?auto_163353 ?auto_163354 ) ) ( not ( = ?auto_163353 ?auto_163355 ) ) ( not ( = ?auto_163353 ?auto_163356 ) ) ( not ( = ?auto_163354 ?auto_163355 ) ) ( not ( = ?auto_163354 ?auto_163356 ) ) ( not ( = ?auto_163355 ?auto_163356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_163355 ?auto_163356 )
      ( !STACK ?auto_163355 ?auto_163354 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163369 - BLOCK
      ?auto_163370 - BLOCK
      ?auto_163371 - BLOCK
      ?auto_163372 - BLOCK
      ?auto_163373 - BLOCK
      ?auto_163374 - BLOCK
      ?auto_163375 - BLOCK
      ?auto_163376 - BLOCK
      ?auto_163377 - BLOCK
      ?auto_163378 - BLOCK
      ?auto_163379 - BLOCK
      ?auto_163380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_163379 ) ( ON-TABLE ?auto_163380 ) ( CLEAR ?auto_163380 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_163369 ) ( ON ?auto_163370 ?auto_163369 ) ( ON ?auto_163371 ?auto_163370 ) ( ON ?auto_163372 ?auto_163371 ) ( ON ?auto_163373 ?auto_163372 ) ( ON ?auto_163374 ?auto_163373 ) ( ON ?auto_163375 ?auto_163374 ) ( ON ?auto_163376 ?auto_163375 ) ( ON ?auto_163377 ?auto_163376 ) ( ON ?auto_163378 ?auto_163377 ) ( ON ?auto_163379 ?auto_163378 ) ( not ( = ?auto_163369 ?auto_163370 ) ) ( not ( = ?auto_163369 ?auto_163371 ) ) ( not ( = ?auto_163369 ?auto_163372 ) ) ( not ( = ?auto_163369 ?auto_163373 ) ) ( not ( = ?auto_163369 ?auto_163374 ) ) ( not ( = ?auto_163369 ?auto_163375 ) ) ( not ( = ?auto_163369 ?auto_163376 ) ) ( not ( = ?auto_163369 ?auto_163377 ) ) ( not ( = ?auto_163369 ?auto_163378 ) ) ( not ( = ?auto_163369 ?auto_163379 ) ) ( not ( = ?auto_163369 ?auto_163380 ) ) ( not ( = ?auto_163370 ?auto_163371 ) ) ( not ( = ?auto_163370 ?auto_163372 ) ) ( not ( = ?auto_163370 ?auto_163373 ) ) ( not ( = ?auto_163370 ?auto_163374 ) ) ( not ( = ?auto_163370 ?auto_163375 ) ) ( not ( = ?auto_163370 ?auto_163376 ) ) ( not ( = ?auto_163370 ?auto_163377 ) ) ( not ( = ?auto_163370 ?auto_163378 ) ) ( not ( = ?auto_163370 ?auto_163379 ) ) ( not ( = ?auto_163370 ?auto_163380 ) ) ( not ( = ?auto_163371 ?auto_163372 ) ) ( not ( = ?auto_163371 ?auto_163373 ) ) ( not ( = ?auto_163371 ?auto_163374 ) ) ( not ( = ?auto_163371 ?auto_163375 ) ) ( not ( = ?auto_163371 ?auto_163376 ) ) ( not ( = ?auto_163371 ?auto_163377 ) ) ( not ( = ?auto_163371 ?auto_163378 ) ) ( not ( = ?auto_163371 ?auto_163379 ) ) ( not ( = ?auto_163371 ?auto_163380 ) ) ( not ( = ?auto_163372 ?auto_163373 ) ) ( not ( = ?auto_163372 ?auto_163374 ) ) ( not ( = ?auto_163372 ?auto_163375 ) ) ( not ( = ?auto_163372 ?auto_163376 ) ) ( not ( = ?auto_163372 ?auto_163377 ) ) ( not ( = ?auto_163372 ?auto_163378 ) ) ( not ( = ?auto_163372 ?auto_163379 ) ) ( not ( = ?auto_163372 ?auto_163380 ) ) ( not ( = ?auto_163373 ?auto_163374 ) ) ( not ( = ?auto_163373 ?auto_163375 ) ) ( not ( = ?auto_163373 ?auto_163376 ) ) ( not ( = ?auto_163373 ?auto_163377 ) ) ( not ( = ?auto_163373 ?auto_163378 ) ) ( not ( = ?auto_163373 ?auto_163379 ) ) ( not ( = ?auto_163373 ?auto_163380 ) ) ( not ( = ?auto_163374 ?auto_163375 ) ) ( not ( = ?auto_163374 ?auto_163376 ) ) ( not ( = ?auto_163374 ?auto_163377 ) ) ( not ( = ?auto_163374 ?auto_163378 ) ) ( not ( = ?auto_163374 ?auto_163379 ) ) ( not ( = ?auto_163374 ?auto_163380 ) ) ( not ( = ?auto_163375 ?auto_163376 ) ) ( not ( = ?auto_163375 ?auto_163377 ) ) ( not ( = ?auto_163375 ?auto_163378 ) ) ( not ( = ?auto_163375 ?auto_163379 ) ) ( not ( = ?auto_163375 ?auto_163380 ) ) ( not ( = ?auto_163376 ?auto_163377 ) ) ( not ( = ?auto_163376 ?auto_163378 ) ) ( not ( = ?auto_163376 ?auto_163379 ) ) ( not ( = ?auto_163376 ?auto_163380 ) ) ( not ( = ?auto_163377 ?auto_163378 ) ) ( not ( = ?auto_163377 ?auto_163379 ) ) ( not ( = ?auto_163377 ?auto_163380 ) ) ( not ( = ?auto_163378 ?auto_163379 ) ) ( not ( = ?auto_163378 ?auto_163380 ) ) ( not ( = ?auto_163379 ?auto_163380 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_163380 )
      ( !STACK ?auto_163380 ?auto_163379 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163393 - BLOCK
      ?auto_163394 - BLOCK
      ?auto_163395 - BLOCK
      ?auto_163396 - BLOCK
      ?auto_163397 - BLOCK
      ?auto_163398 - BLOCK
      ?auto_163399 - BLOCK
      ?auto_163400 - BLOCK
      ?auto_163401 - BLOCK
      ?auto_163402 - BLOCK
      ?auto_163403 - BLOCK
      ?auto_163404 - BLOCK
    )
    :vars
    (
      ?auto_163405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163404 ?auto_163405 ) ( ON-TABLE ?auto_163393 ) ( ON ?auto_163394 ?auto_163393 ) ( ON ?auto_163395 ?auto_163394 ) ( ON ?auto_163396 ?auto_163395 ) ( ON ?auto_163397 ?auto_163396 ) ( ON ?auto_163398 ?auto_163397 ) ( ON ?auto_163399 ?auto_163398 ) ( ON ?auto_163400 ?auto_163399 ) ( ON ?auto_163401 ?auto_163400 ) ( ON ?auto_163402 ?auto_163401 ) ( not ( = ?auto_163393 ?auto_163394 ) ) ( not ( = ?auto_163393 ?auto_163395 ) ) ( not ( = ?auto_163393 ?auto_163396 ) ) ( not ( = ?auto_163393 ?auto_163397 ) ) ( not ( = ?auto_163393 ?auto_163398 ) ) ( not ( = ?auto_163393 ?auto_163399 ) ) ( not ( = ?auto_163393 ?auto_163400 ) ) ( not ( = ?auto_163393 ?auto_163401 ) ) ( not ( = ?auto_163393 ?auto_163402 ) ) ( not ( = ?auto_163393 ?auto_163403 ) ) ( not ( = ?auto_163393 ?auto_163404 ) ) ( not ( = ?auto_163393 ?auto_163405 ) ) ( not ( = ?auto_163394 ?auto_163395 ) ) ( not ( = ?auto_163394 ?auto_163396 ) ) ( not ( = ?auto_163394 ?auto_163397 ) ) ( not ( = ?auto_163394 ?auto_163398 ) ) ( not ( = ?auto_163394 ?auto_163399 ) ) ( not ( = ?auto_163394 ?auto_163400 ) ) ( not ( = ?auto_163394 ?auto_163401 ) ) ( not ( = ?auto_163394 ?auto_163402 ) ) ( not ( = ?auto_163394 ?auto_163403 ) ) ( not ( = ?auto_163394 ?auto_163404 ) ) ( not ( = ?auto_163394 ?auto_163405 ) ) ( not ( = ?auto_163395 ?auto_163396 ) ) ( not ( = ?auto_163395 ?auto_163397 ) ) ( not ( = ?auto_163395 ?auto_163398 ) ) ( not ( = ?auto_163395 ?auto_163399 ) ) ( not ( = ?auto_163395 ?auto_163400 ) ) ( not ( = ?auto_163395 ?auto_163401 ) ) ( not ( = ?auto_163395 ?auto_163402 ) ) ( not ( = ?auto_163395 ?auto_163403 ) ) ( not ( = ?auto_163395 ?auto_163404 ) ) ( not ( = ?auto_163395 ?auto_163405 ) ) ( not ( = ?auto_163396 ?auto_163397 ) ) ( not ( = ?auto_163396 ?auto_163398 ) ) ( not ( = ?auto_163396 ?auto_163399 ) ) ( not ( = ?auto_163396 ?auto_163400 ) ) ( not ( = ?auto_163396 ?auto_163401 ) ) ( not ( = ?auto_163396 ?auto_163402 ) ) ( not ( = ?auto_163396 ?auto_163403 ) ) ( not ( = ?auto_163396 ?auto_163404 ) ) ( not ( = ?auto_163396 ?auto_163405 ) ) ( not ( = ?auto_163397 ?auto_163398 ) ) ( not ( = ?auto_163397 ?auto_163399 ) ) ( not ( = ?auto_163397 ?auto_163400 ) ) ( not ( = ?auto_163397 ?auto_163401 ) ) ( not ( = ?auto_163397 ?auto_163402 ) ) ( not ( = ?auto_163397 ?auto_163403 ) ) ( not ( = ?auto_163397 ?auto_163404 ) ) ( not ( = ?auto_163397 ?auto_163405 ) ) ( not ( = ?auto_163398 ?auto_163399 ) ) ( not ( = ?auto_163398 ?auto_163400 ) ) ( not ( = ?auto_163398 ?auto_163401 ) ) ( not ( = ?auto_163398 ?auto_163402 ) ) ( not ( = ?auto_163398 ?auto_163403 ) ) ( not ( = ?auto_163398 ?auto_163404 ) ) ( not ( = ?auto_163398 ?auto_163405 ) ) ( not ( = ?auto_163399 ?auto_163400 ) ) ( not ( = ?auto_163399 ?auto_163401 ) ) ( not ( = ?auto_163399 ?auto_163402 ) ) ( not ( = ?auto_163399 ?auto_163403 ) ) ( not ( = ?auto_163399 ?auto_163404 ) ) ( not ( = ?auto_163399 ?auto_163405 ) ) ( not ( = ?auto_163400 ?auto_163401 ) ) ( not ( = ?auto_163400 ?auto_163402 ) ) ( not ( = ?auto_163400 ?auto_163403 ) ) ( not ( = ?auto_163400 ?auto_163404 ) ) ( not ( = ?auto_163400 ?auto_163405 ) ) ( not ( = ?auto_163401 ?auto_163402 ) ) ( not ( = ?auto_163401 ?auto_163403 ) ) ( not ( = ?auto_163401 ?auto_163404 ) ) ( not ( = ?auto_163401 ?auto_163405 ) ) ( not ( = ?auto_163402 ?auto_163403 ) ) ( not ( = ?auto_163402 ?auto_163404 ) ) ( not ( = ?auto_163402 ?auto_163405 ) ) ( not ( = ?auto_163403 ?auto_163404 ) ) ( not ( = ?auto_163403 ?auto_163405 ) ) ( not ( = ?auto_163404 ?auto_163405 ) ) ( CLEAR ?auto_163402 ) ( ON ?auto_163403 ?auto_163404 ) ( CLEAR ?auto_163403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_163393 ?auto_163394 ?auto_163395 ?auto_163396 ?auto_163397 ?auto_163398 ?auto_163399 ?auto_163400 ?auto_163401 ?auto_163402 ?auto_163403 )
      ( MAKE-12PILE ?auto_163393 ?auto_163394 ?auto_163395 ?auto_163396 ?auto_163397 ?auto_163398 ?auto_163399 ?auto_163400 ?auto_163401 ?auto_163402 ?auto_163403 ?auto_163404 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163418 - BLOCK
      ?auto_163419 - BLOCK
      ?auto_163420 - BLOCK
      ?auto_163421 - BLOCK
      ?auto_163422 - BLOCK
      ?auto_163423 - BLOCK
      ?auto_163424 - BLOCK
      ?auto_163425 - BLOCK
      ?auto_163426 - BLOCK
      ?auto_163427 - BLOCK
      ?auto_163428 - BLOCK
      ?auto_163429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163429 ) ( ON-TABLE ?auto_163418 ) ( ON ?auto_163419 ?auto_163418 ) ( ON ?auto_163420 ?auto_163419 ) ( ON ?auto_163421 ?auto_163420 ) ( ON ?auto_163422 ?auto_163421 ) ( ON ?auto_163423 ?auto_163422 ) ( ON ?auto_163424 ?auto_163423 ) ( ON ?auto_163425 ?auto_163424 ) ( ON ?auto_163426 ?auto_163425 ) ( ON ?auto_163427 ?auto_163426 ) ( not ( = ?auto_163418 ?auto_163419 ) ) ( not ( = ?auto_163418 ?auto_163420 ) ) ( not ( = ?auto_163418 ?auto_163421 ) ) ( not ( = ?auto_163418 ?auto_163422 ) ) ( not ( = ?auto_163418 ?auto_163423 ) ) ( not ( = ?auto_163418 ?auto_163424 ) ) ( not ( = ?auto_163418 ?auto_163425 ) ) ( not ( = ?auto_163418 ?auto_163426 ) ) ( not ( = ?auto_163418 ?auto_163427 ) ) ( not ( = ?auto_163418 ?auto_163428 ) ) ( not ( = ?auto_163418 ?auto_163429 ) ) ( not ( = ?auto_163419 ?auto_163420 ) ) ( not ( = ?auto_163419 ?auto_163421 ) ) ( not ( = ?auto_163419 ?auto_163422 ) ) ( not ( = ?auto_163419 ?auto_163423 ) ) ( not ( = ?auto_163419 ?auto_163424 ) ) ( not ( = ?auto_163419 ?auto_163425 ) ) ( not ( = ?auto_163419 ?auto_163426 ) ) ( not ( = ?auto_163419 ?auto_163427 ) ) ( not ( = ?auto_163419 ?auto_163428 ) ) ( not ( = ?auto_163419 ?auto_163429 ) ) ( not ( = ?auto_163420 ?auto_163421 ) ) ( not ( = ?auto_163420 ?auto_163422 ) ) ( not ( = ?auto_163420 ?auto_163423 ) ) ( not ( = ?auto_163420 ?auto_163424 ) ) ( not ( = ?auto_163420 ?auto_163425 ) ) ( not ( = ?auto_163420 ?auto_163426 ) ) ( not ( = ?auto_163420 ?auto_163427 ) ) ( not ( = ?auto_163420 ?auto_163428 ) ) ( not ( = ?auto_163420 ?auto_163429 ) ) ( not ( = ?auto_163421 ?auto_163422 ) ) ( not ( = ?auto_163421 ?auto_163423 ) ) ( not ( = ?auto_163421 ?auto_163424 ) ) ( not ( = ?auto_163421 ?auto_163425 ) ) ( not ( = ?auto_163421 ?auto_163426 ) ) ( not ( = ?auto_163421 ?auto_163427 ) ) ( not ( = ?auto_163421 ?auto_163428 ) ) ( not ( = ?auto_163421 ?auto_163429 ) ) ( not ( = ?auto_163422 ?auto_163423 ) ) ( not ( = ?auto_163422 ?auto_163424 ) ) ( not ( = ?auto_163422 ?auto_163425 ) ) ( not ( = ?auto_163422 ?auto_163426 ) ) ( not ( = ?auto_163422 ?auto_163427 ) ) ( not ( = ?auto_163422 ?auto_163428 ) ) ( not ( = ?auto_163422 ?auto_163429 ) ) ( not ( = ?auto_163423 ?auto_163424 ) ) ( not ( = ?auto_163423 ?auto_163425 ) ) ( not ( = ?auto_163423 ?auto_163426 ) ) ( not ( = ?auto_163423 ?auto_163427 ) ) ( not ( = ?auto_163423 ?auto_163428 ) ) ( not ( = ?auto_163423 ?auto_163429 ) ) ( not ( = ?auto_163424 ?auto_163425 ) ) ( not ( = ?auto_163424 ?auto_163426 ) ) ( not ( = ?auto_163424 ?auto_163427 ) ) ( not ( = ?auto_163424 ?auto_163428 ) ) ( not ( = ?auto_163424 ?auto_163429 ) ) ( not ( = ?auto_163425 ?auto_163426 ) ) ( not ( = ?auto_163425 ?auto_163427 ) ) ( not ( = ?auto_163425 ?auto_163428 ) ) ( not ( = ?auto_163425 ?auto_163429 ) ) ( not ( = ?auto_163426 ?auto_163427 ) ) ( not ( = ?auto_163426 ?auto_163428 ) ) ( not ( = ?auto_163426 ?auto_163429 ) ) ( not ( = ?auto_163427 ?auto_163428 ) ) ( not ( = ?auto_163427 ?auto_163429 ) ) ( not ( = ?auto_163428 ?auto_163429 ) ) ( CLEAR ?auto_163427 ) ( ON ?auto_163428 ?auto_163429 ) ( CLEAR ?auto_163428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_163418 ?auto_163419 ?auto_163420 ?auto_163421 ?auto_163422 ?auto_163423 ?auto_163424 ?auto_163425 ?auto_163426 ?auto_163427 ?auto_163428 )
      ( MAKE-12PILE ?auto_163418 ?auto_163419 ?auto_163420 ?auto_163421 ?auto_163422 ?auto_163423 ?auto_163424 ?auto_163425 ?auto_163426 ?auto_163427 ?auto_163428 ?auto_163429 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163442 - BLOCK
      ?auto_163443 - BLOCK
      ?auto_163444 - BLOCK
      ?auto_163445 - BLOCK
      ?auto_163446 - BLOCK
      ?auto_163447 - BLOCK
      ?auto_163448 - BLOCK
      ?auto_163449 - BLOCK
      ?auto_163450 - BLOCK
      ?auto_163451 - BLOCK
      ?auto_163452 - BLOCK
      ?auto_163453 - BLOCK
    )
    :vars
    (
      ?auto_163454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163453 ?auto_163454 ) ( ON-TABLE ?auto_163442 ) ( ON ?auto_163443 ?auto_163442 ) ( ON ?auto_163444 ?auto_163443 ) ( ON ?auto_163445 ?auto_163444 ) ( ON ?auto_163446 ?auto_163445 ) ( ON ?auto_163447 ?auto_163446 ) ( ON ?auto_163448 ?auto_163447 ) ( ON ?auto_163449 ?auto_163448 ) ( ON ?auto_163450 ?auto_163449 ) ( not ( = ?auto_163442 ?auto_163443 ) ) ( not ( = ?auto_163442 ?auto_163444 ) ) ( not ( = ?auto_163442 ?auto_163445 ) ) ( not ( = ?auto_163442 ?auto_163446 ) ) ( not ( = ?auto_163442 ?auto_163447 ) ) ( not ( = ?auto_163442 ?auto_163448 ) ) ( not ( = ?auto_163442 ?auto_163449 ) ) ( not ( = ?auto_163442 ?auto_163450 ) ) ( not ( = ?auto_163442 ?auto_163451 ) ) ( not ( = ?auto_163442 ?auto_163452 ) ) ( not ( = ?auto_163442 ?auto_163453 ) ) ( not ( = ?auto_163442 ?auto_163454 ) ) ( not ( = ?auto_163443 ?auto_163444 ) ) ( not ( = ?auto_163443 ?auto_163445 ) ) ( not ( = ?auto_163443 ?auto_163446 ) ) ( not ( = ?auto_163443 ?auto_163447 ) ) ( not ( = ?auto_163443 ?auto_163448 ) ) ( not ( = ?auto_163443 ?auto_163449 ) ) ( not ( = ?auto_163443 ?auto_163450 ) ) ( not ( = ?auto_163443 ?auto_163451 ) ) ( not ( = ?auto_163443 ?auto_163452 ) ) ( not ( = ?auto_163443 ?auto_163453 ) ) ( not ( = ?auto_163443 ?auto_163454 ) ) ( not ( = ?auto_163444 ?auto_163445 ) ) ( not ( = ?auto_163444 ?auto_163446 ) ) ( not ( = ?auto_163444 ?auto_163447 ) ) ( not ( = ?auto_163444 ?auto_163448 ) ) ( not ( = ?auto_163444 ?auto_163449 ) ) ( not ( = ?auto_163444 ?auto_163450 ) ) ( not ( = ?auto_163444 ?auto_163451 ) ) ( not ( = ?auto_163444 ?auto_163452 ) ) ( not ( = ?auto_163444 ?auto_163453 ) ) ( not ( = ?auto_163444 ?auto_163454 ) ) ( not ( = ?auto_163445 ?auto_163446 ) ) ( not ( = ?auto_163445 ?auto_163447 ) ) ( not ( = ?auto_163445 ?auto_163448 ) ) ( not ( = ?auto_163445 ?auto_163449 ) ) ( not ( = ?auto_163445 ?auto_163450 ) ) ( not ( = ?auto_163445 ?auto_163451 ) ) ( not ( = ?auto_163445 ?auto_163452 ) ) ( not ( = ?auto_163445 ?auto_163453 ) ) ( not ( = ?auto_163445 ?auto_163454 ) ) ( not ( = ?auto_163446 ?auto_163447 ) ) ( not ( = ?auto_163446 ?auto_163448 ) ) ( not ( = ?auto_163446 ?auto_163449 ) ) ( not ( = ?auto_163446 ?auto_163450 ) ) ( not ( = ?auto_163446 ?auto_163451 ) ) ( not ( = ?auto_163446 ?auto_163452 ) ) ( not ( = ?auto_163446 ?auto_163453 ) ) ( not ( = ?auto_163446 ?auto_163454 ) ) ( not ( = ?auto_163447 ?auto_163448 ) ) ( not ( = ?auto_163447 ?auto_163449 ) ) ( not ( = ?auto_163447 ?auto_163450 ) ) ( not ( = ?auto_163447 ?auto_163451 ) ) ( not ( = ?auto_163447 ?auto_163452 ) ) ( not ( = ?auto_163447 ?auto_163453 ) ) ( not ( = ?auto_163447 ?auto_163454 ) ) ( not ( = ?auto_163448 ?auto_163449 ) ) ( not ( = ?auto_163448 ?auto_163450 ) ) ( not ( = ?auto_163448 ?auto_163451 ) ) ( not ( = ?auto_163448 ?auto_163452 ) ) ( not ( = ?auto_163448 ?auto_163453 ) ) ( not ( = ?auto_163448 ?auto_163454 ) ) ( not ( = ?auto_163449 ?auto_163450 ) ) ( not ( = ?auto_163449 ?auto_163451 ) ) ( not ( = ?auto_163449 ?auto_163452 ) ) ( not ( = ?auto_163449 ?auto_163453 ) ) ( not ( = ?auto_163449 ?auto_163454 ) ) ( not ( = ?auto_163450 ?auto_163451 ) ) ( not ( = ?auto_163450 ?auto_163452 ) ) ( not ( = ?auto_163450 ?auto_163453 ) ) ( not ( = ?auto_163450 ?auto_163454 ) ) ( not ( = ?auto_163451 ?auto_163452 ) ) ( not ( = ?auto_163451 ?auto_163453 ) ) ( not ( = ?auto_163451 ?auto_163454 ) ) ( not ( = ?auto_163452 ?auto_163453 ) ) ( not ( = ?auto_163452 ?auto_163454 ) ) ( not ( = ?auto_163453 ?auto_163454 ) ) ( ON ?auto_163452 ?auto_163453 ) ( CLEAR ?auto_163450 ) ( ON ?auto_163451 ?auto_163452 ) ( CLEAR ?auto_163451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_163442 ?auto_163443 ?auto_163444 ?auto_163445 ?auto_163446 ?auto_163447 ?auto_163448 ?auto_163449 ?auto_163450 ?auto_163451 )
      ( MAKE-12PILE ?auto_163442 ?auto_163443 ?auto_163444 ?auto_163445 ?auto_163446 ?auto_163447 ?auto_163448 ?auto_163449 ?auto_163450 ?auto_163451 ?auto_163452 ?auto_163453 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163467 - BLOCK
      ?auto_163468 - BLOCK
      ?auto_163469 - BLOCK
      ?auto_163470 - BLOCK
      ?auto_163471 - BLOCK
      ?auto_163472 - BLOCK
      ?auto_163473 - BLOCK
      ?auto_163474 - BLOCK
      ?auto_163475 - BLOCK
      ?auto_163476 - BLOCK
      ?auto_163477 - BLOCK
      ?auto_163478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163478 ) ( ON-TABLE ?auto_163467 ) ( ON ?auto_163468 ?auto_163467 ) ( ON ?auto_163469 ?auto_163468 ) ( ON ?auto_163470 ?auto_163469 ) ( ON ?auto_163471 ?auto_163470 ) ( ON ?auto_163472 ?auto_163471 ) ( ON ?auto_163473 ?auto_163472 ) ( ON ?auto_163474 ?auto_163473 ) ( ON ?auto_163475 ?auto_163474 ) ( not ( = ?auto_163467 ?auto_163468 ) ) ( not ( = ?auto_163467 ?auto_163469 ) ) ( not ( = ?auto_163467 ?auto_163470 ) ) ( not ( = ?auto_163467 ?auto_163471 ) ) ( not ( = ?auto_163467 ?auto_163472 ) ) ( not ( = ?auto_163467 ?auto_163473 ) ) ( not ( = ?auto_163467 ?auto_163474 ) ) ( not ( = ?auto_163467 ?auto_163475 ) ) ( not ( = ?auto_163467 ?auto_163476 ) ) ( not ( = ?auto_163467 ?auto_163477 ) ) ( not ( = ?auto_163467 ?auto_163478 ) ) ( not ( = ?auto_163468 ?auto_163469 ) ) ( not ( = ?auto_163468 ?auto_163470 ) ) ( not ( = ?auto_163468 ?auto_163471 ) ) ( not ( = ?auto_163468 ?auto_163472 ) ) ( not ( = ?auto_163468 ?auto_163473 ) ) ( not ( = ?auto_163468 ?auto_163474 ) ) ( not ( = ?auto_163468 ?auto_163475 ) ) ( not ( = ?auto_163468 ?auto_163476 ) ) ( not ( = ?auto_163468 ?auto_163477 ) ) ( not ( = ?auto_163468 ?auto_163478 ) ) ( not ( = ?auto_163469 ?auto_163470 ) ) ( not ( = ?auto_163469 ?auto_163471 ) ) ( not ( = ?auto_163469 ?auto_163472 ) ) ( not ( = ?auto_163469 ?auto_163473 ) ) ( not ( = ?auto_163469 ?auto_163474 ) ) ( not ( = ?auto_163469 ?auto_163475 ) ) ( not ( = ?auto_163469 ?auto_163476 ) ) ( not ( = ?auto_163469 ?auto_163477 ) ) ( not ( = ?auto_163469 ?auto_163478 ) ) ( not ( = ?auto_163470 ?auto_163471 ) ) ( not ( = ?auto_163470 ?auto_163472 ) ) ( not ( = ?auto_163470 ?auto_163473 ) ) ( not ( = ?auto_163470 ?auto_163474 ) ) ( not ( = ?auto_163470 ?auto_163475 ) ) ( not ( = ?auto_163470 ?auto_163476 ) ) ( not ( = ?auto_163470 ?auto_163477 ) ) ( not ( = ?auto_163470 ?auto_163478 ) ) ( not ( = ?auto_163471 ?auto_163472 ) ) ( not ( = ?auto_163471 ?auto_163473 ) ) ( not ( = ?auto_163471 ?auto_163474 ) ) ( not ( = ?auto_163471 ?auto_163475 ) ) ( not ( = ?auto_163471 ?auto_163476 ) ) ( not ( = ?auto_163471 ?auto_163477 ) ) ( not ( = ?auto_163471 ?auto_163478 ) ) ( not ( = ?auto_163472 ?auto_163473 ) ) ( not ( = ?auto_163472 ?auto_163474 ) ) ( not ( = ?auto_163472 ?auto_163475 ) ) ( not ( = ?auto_163472 ?auto_163476 ) ) ( not ( = ?auto_163472 ?auto_163477 ) ) ( not ( = ?auto_163472 ?auto_163478 ) ) ( not ( = ?auto_163473 ?auto_163474 ) ) ( not ( = ?auto_163473 ?auto_163475 ) ) ( not ( = ?auto_163473 ?auto_163476 ) ) ( not ( = ?auto_163473 ?auto_163477 ) ) ( not ( = ?auto_163473 ?auto_163478 ) ) ( not ( = ?auto_163474 ?auto_163475 ) ) ( not ( = ?auto_163474 ?auto_163476 ) ) ( not ( = ?auto_163474 ?auto_163477 ) ) ( not ( = ?auto_163474 ?auto_163478 ) ) ( not ( = ?auto_163475 ?auto_163476 ) ) ( not ( = ?auto_163475 ?auto_163477 ) ) ( not ( = ?auto_163475 ?auto_163478 ) ) ( not ( = ?auto_163476 ?auto_163477 ) ) ( not ( = ?auto_163476 ?auto_163478 ) ) ( not ( = ?auto_163477 ?auto_163478 ) ) ( ON ?auto_163477 ?auto_163478 ) ( CLEAR ?auto_163475 ) ( ON ?auto_163476 ?auto_163477 ) ( CLEAR ?auto_163476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_163467 ?auto_163468 ?auto_163469 ?auto_163470 ?auto_163471 ?auto_163472 ?auto_163473 ?auto_163474 ?auto_163475 ?auto_163476 )
      ( MAKE-12PILE ?auto_163467 ?auto_163468 ?auto_163469 ?auto_163470 ?auto_163471 ?auto_163472 ?auto_163473 ?auto_163474 ?auto_163475 ?auto_163476 ?auto_163477 ?auto_163478 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163491 - BLOCK
      ?auto_163492 - BLOCK
      ?auto_163493 - BLOCK
      ?auto_163494 - BLOCK
      ?auto_163495 - BLOCK
      ?auto_163496 - BLOCK
      ?auto_163497 - BLOCK
      ?auto_163498 - BLOCK
      ?auto_163499 - BLOCK
      ?auto_163500 - BLOCK
      ?auto_163501 - BLOCK
      ?auto_163502 - BLOCK
    )
    :vars
    (
      ?auto_163503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163502 ?auto_163503 ) ( ON-TABLE ?auto_163491 ) ( ON ?auto_163492 ?auto_163491 ) ( ON ?auto_163493 ?auto_163492 ) ( ON ?auto_163494 ?auto_163493 ) ( ON ?auto_163495 ?auto_163494 ) ( ON ?auto_163496 ?auto_163495 ) ( ON ?auto_163497 ?auto_163496 ) ( ON ?auto_163498 ?auto_163497 ) ( not ( = ?auto_163491 ?auto_163492 ) ) ( not ( = ?auto_163491 ?auto_163493 ) ) ( not ( = ?auto_163491 ?auto_163494 ) ) ( not ( = ?auto_163491 ?auto_163495 ) ) ( not ( = ?auto_163491 ?auto_163496 ) ) ( not ( = ?auto_163491 ?auto_163497 ) ) ( not ( = ?auto_163491 ?auto_163498 ) ) ( not ( = ?auto_163491 ?auto_163499 ) ) ( not ( = ?auto_163491 ?auto_163500 ) ) ( not ( = ?auto_163491 ?auto_163501 ) ) ( not ( = ?auto_163491 ?auto_163502 ) ) ( not ( = ?auto_163491 ?auto_163503 ) ) ( not ( = ?auto_163492 ?auto_163493 ) ) ( not ( = ?auto_163492 ?auto_163494 ) ) ( not ( = ?auto_163492 ?auto_163495 ) ) ( not ( = ?auto_163492 ?auto_163496 ) ) ( not ( = ?auto_163492 ?auto_163497 ) ) ( not ( = ?auto_163492 ?auto_163498 ) ) ( not ( = ?auto_163492 ?auto_163499 ) ) ( not ( = ?auto_163492 ?auto_163500 ) ) ( not ( = ?auto_163492 ?auto_163501 ) ) ( not ( = ?auto_163492 ?auto_163502 ) ) ( not ( = ?auto_163492 ?auto_163503 ) ) ( not ( = ?auto_163493 ?auto_163494 ) ) ( not ( = ?auto_163493 ?auto_163495 ) ) ( not ( = ?auto_163493 ?auto_163496 ) ) ( not ( = ?auto_163493 ?auto_163497 ) ) ( not ( = ?auto_163493 ?auto_163498 ) ) ( not ( = ?auto_163493 ?auto_163499 ) ) ( not ( = ?auto_163493 ?auto_163500 ) ) ( not ( = ?auto_163493 ?auto_163501 ) ) ( not ( = ?auto_163493 ?auto_163502 ) ) ( not ( = ?auto_163493 ?auto_163503 ) ) ( not ( = ?auto_163494 ?auto_163495 ) ) ( not ( = ?auto_163494 ?auto_163496 ) ) ( not ( = ?auto_163494 ?auto_163497 ) ) ( not ( = ?auto_163494 ?auto_163498 ) ) ( not ( = ?auto_163494 ?auto_163499 ) ) ( not ( = ?auto_163494 ?auto_163500 ) ) ( not ( = ?auto_163494 ?auto_163501 ) ) ( not ( = ?auto_163494 ?auto_163502 ) ) ( not ( = ?auto_163494 ?auto_163503 ) ) ( not ( = ?auto_163495 ?auto_163496 ) ) ( not ( = ?auto_163495 ?auto_163497 ) ) ( not ( = ?auto_163495 ?auto_163498 ) ) ( not ( = ?auto_163495 ?auto_163499 ) ) ( not ( = ?auto_163495 ?auto_163500 ) ) ( not ( = ?auto_163495 ?auto_163501 ) ) ( not ( = ?auto_163495 ?auto_163502 ) ) ( not ( = ?auto_163495 ?auto_163503 ) ) ( not ( = ?auto_163496 ?auto_163497 ) ) ( not ( = ?auto_163496 ?auto_163498 ) ) ( not ( = ?auto_163496 ?auto_163499 ) ) ( not ( = ?auto_163496 ?auto_163500 ) ) ( not ( = ?auto_163496 ?auto_163501 ) ) ( not ( = ?auto_163496 ?auto_163502 ) ) ( not ( = ?auto_163496 ?auto_163503 ) ) ( not ( = ?auto_163497 ?auto_163498 ) ) ( not ( = ?auto_163497 ?auto_163499 ) ) ( not ( = ?auto_163497 ?auto_163500 ) ) ( not ( = ?auto_163497 ?auto_163501 ) ) ( not ( = ?auto_163497 ?auto_163502 ) ) ( not ( = ?auto_163497 ?auto_163503 ) ) ( not ( = ?auto_163498 ?auto_163499 ) ) ( not ( = ?auto_163498 ?auto_163500 ) ) ( not ( = ?auto_163498 ?auto_163501 ) ) ( not ( = ?auto_163498 ?auto_163502 ) ) ( not ( = ?auto_163498 ?auto_163503 ) ) ( not ( = ?auto_163499 ?auto_163500 ) ) ( not ( = ?auto_163499 ?auto_163501 ) ) ( not ( = ?auto_163499 ?auto_163502 ) ) ( not ( = ?auto_163499 ?auto_163503 ) ) ( not ( = ?auto_163500 ?auto_163501 ) ) ( not ( = ?auto_163500 ?auto_163502 ) ) ( not ( = ?auto_163500 ?auto_163503 ) ) ( not ( = ?auto_163501 ?auto_163502 ) ) ( not ( = ?auto_163501 ?auto_163503 ) ) ( not ( = ?auto_163502 ?auto_163503 ) ) ( ON ?auto_163501 ?auto_163502 ) ( ON ?auto_163500 ?auto_163501 ) ( CLEAR ?auto_163498 ) ( ON ?auto_163499 ?auto_163500 ) ( CLEAR ?auto_163499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_163491 ?auto_163492 ?auto_163493 ?auto_163494 ?auto_163495 ?auto_163496 ?auto_163497 ?auto_163498 ?auto_163499 )
      ( MAKE-12PILE ?auto_163491 ?auto_163492 ?auto_163493 ?auto_163494 ?auto_163495 ?auto_163496 ?auto_163497 ?auto_163498 ?auto_163499 ?auto_163500 ?auto_163501 ?auto_163502 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163516 - BLOCK
      ?auto_163517 - BLOCK
      ?auto_163518 - BLOCK
      ?auto_163519 - BLOCK
      ?auto_163520 - BLOCK
      ?auto_163521 - BLOCK
      ?auto_163522 - BLOCK
      ?auto_163523 - BLOCK
      ?auto_163524 - BLOCK
      ?auto_163525 - BLOCK
      ?auto_163526 - BLOCK
      ?auto_163527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163527 ) ( ON-TABLE ?auto_163516 ) ( ON ?auto_163517 ?auto_163516 ) ( ON ?auto_163518 ?auto_163517 ) ( ON ?auto_163519 ?auto_163518 ) ( ON ?auto_163520 ?auto_163519 ) ( ON ?auto_163521 ?auto_163520 ) ( ON ?auto_163522 ?auto_163521 ) ( ON ?auto_163523 ?auto_163522 ) ( not ( = ?auto_163516 ?auto_163517 ) ) ( not ( = ?auto_163516 ?auto_163518 ) ) ( not ( = ?auto_163516 ?auto_163519 ) ) ( not ( = ?auto_163516 ?auto_163520 ) ) ( not ( = ?auto_163516 ?auto_163521 ) ) ( not ( = ?auto_163516 ?auto_163522 ) ) ( not ( = ?auto_163516 ?auto_163523 ) ) ( not ( = ?auto_163516 ?auto_163524 ) ) ( not ( = ?auto_163516 ?auto_163525 ) ) ( not ( = ?auto_163516 ?auto_163526 ) ) ( not ( = ?auto_163516 ?auto_163527 ) ) ( not ( = ?auto_163517 ?auto_163518 ) ) ( not ( = ?auto_163517 ?auto_163519 ) ) ( not ( = ?auto_163517 ?auto_163520 ) ) ( not ( = ?auto_163517 ?auto_163521 ) ) ( not ( = ?auto_163517 ?auto_163522 ) ) ( not ( = ?auto_163517 ?auto_163523 ) ) ( not ( = ?auto_163517 ?auto_163524 ) ) ( not ( = ?auto_163517 ?auto_163525 ) ) ( not ( = ?auto_163517 ?auto_163526 ) ) ( not ( = ?auto_163517 ?auto_163527 ) ) ( not ( = ?auto_163518 ?auto_163519 ) ) ( not ( = ?auto_163518 ?auto_163520 ) ) ( not ( = ?auto_163518 ?auto_163521 ) ) ( not ( = ?auto_163518 ?auto_163522 ) ) ( not ( = ?auto_163518 ?auto_163523 ) ) ( not ( = ?auto_163518 ?auto_163524 ) ) ( not ( = ?auto_163518 ?auto_163525 ) ) ( not ( = ?auto_163518 ?auto_163526 ) ) ( not ( = ?auto_163518 ?auto_163527 ) ) ( not ( = ?auto_163519 ?auto_163520 ) ) ( not ( = ?auto_163519 ?auto_163521 ) ) ( not ( = ?auto_163519 ?auto_163522 ) ) ( not ( = ?auto_163519 ?auto_163523 ) ) ( not ( = ?auto_163519 ?auto_163524 ) ) ( not ( = ?auto_163519 ?auto_163525 ) ) ( not ( = ?auto_163519 ?auto_163526 ) ) ( not ( = ?auto_163519 ?auto_163527 ) ) ( not ( = ?auto_163520 ?auto_163521 ) ) ( not ( = ?auto_163520 ?auto_163522 ) ) ( not ( = ?auto_163520 ?auto_163523 ) ) ( not ( = ?auto_163520 ?auto_163524 ) ) ( not ( = ?auto_163520 ?auto_163525 ) ) ( not ( = ?auto_163520 ?auto_163526 ) ) ( not ( = ?auto_163520 ?auto_163527 ) ) ( not ( = ?auto_163521 ?auto_163522 ) ) ( not ( = ?auto_163521 ?auto_163523 ) ) ( not ( = ?auto_163521 ?auto_163524 ) ) ( not ( = ?auto_163521 ?auto_163525 ) ) ( not ( = ?auto_163521 ?auto_163526 ) ) ( not ( = ?auto_163521 ?auto_163527 ) ) ( not ( = ?auto_163522 ?auto_163523 ) ) ( not ( = ?auto_163522 ?auto_163524 ) ) ( not ( = ?auto_163522 ?auto_163525 ) ) ( not ( = ?auto_163522 ?auto_163526 ) ) ( not ( = ?auto_163522 ?auto_163527 ) ) ( not ( = ?auto_163523 ?auto_163524 ) ) ( not ( = ?auto_163523 ?auto_163525 ) ) ( not ( = ?auto_163523 ?auto_163526 ) ) ( not ( = ?auto_163523 ?auto_163527 ) ) ( not ( = ?auto_163524 ?auto_163525 ) ) ( not ( = ?auto_163524 ?auto_163526 ) ) ( not ( = ?auto_163524 ?auto_163527 ) ) ( not ( = ?auto_163525 ?auto_163526 ) ) ( not ( = ?auto_163525 ?auto_163527 ) ) ( not ( = ?auto_163526 ?auto_163527 ) ) ( ON ?auto_163526 ?auto_163527 ) ( ON ?auto_163525 ?auto_163526 ) ( CLEAR ?auto_163523 ) ( ON ?auto_163524 ?auto_163525 ) ( CLEAR ?auto_163524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_163516 ?auto_163517 ?auto_163518 ?auto_163519 ?auto_163520 ?auto_163521 ?auto_163522 ?auto_163523 ?auto_163524 )
      ( MAKE-12PILE ?auto_163516 ?auto_163517 ?auto_163518 ?auto_163519 ?auto_163520 ?auto_163521 ?auto_163522 ?auto_163523 ?auto_163524 ?auto_163525 ?auto_163526 ?auto_163527 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163540 - BLOCK
      ?auto_163541 - BLOCK
      ?auto_163542 - BLOCK
      ?auto_163543 - BLOCK
      ?auto_163544 - BLOCK
      ?auto_163545 - BLOCK
      ?auto_163546 - BLOCK
      ?auto_163547 - BLOCK
      ?auto_163548 - BLOCK
      ?auto_163549 - BLOCK
      ?auto_163550 - BLOCK
      ?auto_163551 - BLOCK
    )
    :vars
    (
      ?auto_163552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163551 ?auto_163552 ) ( ON-TABLE ?auto_163540 ) ( ON ?auto_163541 ?auto_163540 ) ( ON ?auto_163542 ?auto_163541 ) ( ON ?auto_163543 ?auto_163542 ) ( ON ?auto_163544 ?auto_163543 ) ( ON ?auto_163545 ?auto_163544 ) ( ON ?auto_163546 ?auto_163545 ) ( not ( = ?auto_163540 ?auto_163541 ) ) ( not ( = ?auto_163540 ?auto_163542 ) ) ( not ( = ?auto_163540 ?auto_163543 ) ) ( not ( = ?auto_163540 ?auto_163544 ) ) ( not ( = ?auto_163540 ?auto_163545 ) ) ( not ( = ?auto_163540 ?auto_163546 ) ) ( not ( = ?auto_163540 ?auto_163547 ) ) ( not ( = ?auto_163540 ?auto_163548 ) ) ( not ( = ?auto_163540 ?auto_163549 ) ) ( not ( = ?auto_163540 ?auto_163550 ) ) ( not ( = ?auto_163540 ?auto_163551 ) ) ( not ( = ?auto_163540 ?auto_163552 ) ) ( not ( = ?auto_163541 ?auto_163542 ) ) ( not ( = ?auto_163541 ?auto_163543 ) ) ( not ( = ?auto_163541 ?auto_163544 ) ) ( not ( = ?auto_163541 ?auto_163545 ) ) ( not ( = ?auto_163541 ?auto_163546 ) ) ( not ( = ?auto_163541 ?auto_163547 ) ) ( not ( = ?auto_163541 ?auto_163548 ) ) ( not ( = ?auto_163541 ?auto_163549 ) ) ( not ( = ?auto_163541 ?auto_163550 ) ) ( not ( = ?auto_163541 ?auto_163551 ) ) ( not ( = ?auto_163541 ?auto_163552 ) ) ( not ( = ?auto_163542 ?auto_163543 ) ) ( not ( = ?auto_163542 ?auto_163544 ) ) ( not ( = ?auto_163542 ?auto_163545 ) ) ( not ( = ?auto_163542 ?auto_163546 ) ) ( not ( = ?auto_163542 ?auto_163547 ) ) ( not ( = ?auto_163542 ?auto_163548 ) ) ( not ( = ?auto_163542 ?auto_163549 ) ) ( not ( = ?auto_163542 ?auto_163550 ) ) ( not ( = ?auto_163542 ?auto_163551 ) ) ( not ( = ?auto_163542 ?auto_163552 ) ) ( not ( = ?auto_163543 ?auto_163544 ) ) ( not ( = ?auto_163543 ?auto_163545 ) ) ( not ( = ?auto_163543 ?auto_163546 ) ) ( not ( = ?auto_163543 ?auto_163547 ) ) ( not ( = ?auto_163543 ?auto_163548 ) ) ( not ( = ?auto_163543 ?auto_163549 ) ) ( not ( = ?auto_163543 ?auto_163550 ) ) ( not ( = ?auto_163543 ?auto_163551 ) ) ( not ( = ?auto_163543 ?auto_163552 ) ) ( not ( = ?auto_163544 ?auto_163545 ) ) ( not ( = ?auto_163544 ?auto_163546 ) ) ( not ( = ?auto_163544 ?auto_163547 ) ) ( not ( = ?auto_163544 ?auto_163548 ) ) ( not ( = ?auto_163544 ?auto_163549 ) ) ( not ( = ?auto_163544 ?auto_163550 ) ) ( not ( = ?auto_163544 ?auto_163551 ) ) ( not ( = ?auto_163544 ?auto_163552 ) ) ( not ( = ?auto_163545 ?auto_163546 ) ) ( not ( = ?auto_163545 ?auto_163547 ) ) ( not ( = ?auto_163545 ?auto_163548 ) ) ( not ( = ?auto_163545 ?auto_163549 ) ) ( not ( = ?auto_163545 ?auto_163550 ) ) ( not ( = ?auto_163545 ?auto_163551 ) ) ( not ( = ?auto_163545 ?auto_163552 ) ) ( not ( = ?auto_163546 ?auto_163547 ) ) ( not ( = ?auto_163546 ?auto_163548 ) ) ( not ( = ?auto_163546 ?auto_163549 ) ) ( not ( = ?auto_163546 ?auto_163550 ) ) ( not ( = ?auto_163546 ?auto_163551 ) ) ( not ( = ?auto_163546 ?auto_163552 ) ) ( not ( = ?auto_163547 ?auto_163548 ) ) ( not ( = ?auto_163547 ?auto_163549 ) ) ( not ( = ?auto_163547 ?auto_163550 ) ) ( not ( = ?auto_163547 ?auto_163551 ) ) ( not ( = ?auto_163547 ?auto_163552 ) ) ( not ( = ?auto_163548 ?auto_163549 ) ) ( not ( = ?auto_163548 ?auto_163550 ) ) ( not ( = ?auto_163548 ?auto_163551 ) ) ( not ( = ?auto_163548 ?auto_163552 ) ) ( not ( = ?auto_163549 ?auto_163550 ) ) ( not ( = ?auto_163549 ?auto_163551 ) ) ( not ( = ?auto_163549 ?auto_163552 ) ) ( not ( = ?auto_163550 ?auto_163551 ) ) ( not ( = ?auto_163550 ?auto_163552 ) ) ( not ( = ?auto_163551 ?auto_163552 ) ) ( ON ?auto_163550 ?auto_163551 ) ( ON ?auto_163549 ?auto_163550 ) ( ON ?auto_163548 ?auto_163549 ) ( CLEAR ?auto_163546 ) ( ON ?auto_163547 ?auto_163548 ) ( CLEAR ?auto_163547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163540 ?auto_163541 ?auto_163542 ?auto_163543 ?auto_163544 ?auto_163545 ?auto_163546 ?auto_163547 )
      ( MAKE-12PILE ?auto_163540 ?auto_163541 ?auto_163542 ?auto_163543 ?auto_163544 ?auto_163545 ?auto_163546 ?auto_163547 ?auto_163548 ?auto_163549 ?auto_163550 ?auto_163551 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163565 - BLOCK
      ?auto_163566 - BLOCK
      ?auto_163567 - BLOCK
      ?auto_163568 - BLOCK
      ?auto_163569 - BLOCK
      ?auto_163570 - BLOCK
      ?auto_163571 - BLOCK
      ?auto_163572 - BLOCK
      ?auto_163573 - BLOCK
      ?auto_163574 - BLOCK
      ?auto_163575 - BLOCK
      ?auto_163576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163576 ) ( ON-TABLE ?auto_163565 ) ( ON ?auto_163566 ?auto_163565 ) ( ON ?auto_163567 ?auto_163566 ) ( ON ?auto_163568 ?auto_163567 ) ( ON ?auto_163569 ?auto_163568 ) ( ON ?auto_163570 ?auto_163569 ) ( ON ?auto_163571 ?auto_163570 ) ( not ( = ?auto_163565 ?auto_163566 ) ) ( not ( = ?auto_163565 ?auto_163567 ) ) ( not ( = ?auto_163565 ?auto_163568 ) ) ( not ( = ?auto_163565 ?auto_163569 ) ) ( not ( = ?auto_163565 ?auto_163570 ) ) ( not ( = ?auto_163565 ?auto_163571 ) ) ( not ( = ?auto_163565 ?auto_163572 ) ) ( not ( = ?auto_163565 ?auto_163573 ) ) ( not ( = ?auto_163565 ?auto_163574 ) ) ( not ( = ?auto_163565 ?auto_163575 ) ) ( not ( = ?auto_163565 ?auto_163576 ) ) ( not ( = ?auto_163566 ?auto_163567 ) ) ( not ( = ?auto_163566 ?auto_163568 ) ) ( not ( = ?auto_163566 ?auto_163569 ) ) ( not ( = ?auto_163566 ?auto_163570 ) ) ( not ( = ?auto_163566 ?auto_163571 ) ) ( not ( = ?auto_163566 ?auto_163572 ) ) ( not ( = ?auto_163566 ?auto_163573 ) ) ( not ( = ?auto_163566 ?auto_163574 ) ) ( not ( = ?auto_163566 ?auto_163575 ) ) ( not ( = ?auto_163566 ?auto_163576 ) ) ( not ( = ?auto_163567 ?auto_163568 ) ) ( not ( = ?auto_163567 ?auto_163569 ) ) ( not ( = ?auto_163567 ?auto_163570 ) ) ( not ( = ?auto_163567 ?auto_163571 ) ) ( not ( = ?auto_163567 ?auto_163572 ) ) ( not ( = ?auto_163567 ?auto_163573 ) ) ( not ( = ?auto_163567 ?auto_163574 ) ) ( not ( = ?auto_163567 ?auto_163575 ) ) ( not ( = ?auto_163567 ?auto_163576 ) ) ( not ( = ?auto_163568 ?auto_163569 ) ) ( not ( = ?auto_163568 ?auto_163570 ) ) ( not ( = ?auto_163568 ?auto_163571 ) ) ( not ( = ?auto_163568 ?auto_163572 ) ) ( not ( = ?auto_163568 ?auto_163573 ) ) ( not ( = ?auto_163568 ?auto_163574 ) ) ( not ( = ?auto_163568 ?auto_163575 ) ) ( not ( = ?auto_163568 ?auto_163576 ) ) ( not ( = ?auto_163569 ?auto_163570 ) ) ( not ( = ?auto_163569 ?auto_163571 ) ) ( not ( = ?auto_163569 ?auto_163572 ) ) ( not ( = ?auto_163569 ?auto_163573 ) ) ( not ( = ?auto_163569 ?auto_163574 ) ) ( not ( = ?auto_163569 ?auto_163575 ) ) ( not ( = ?auto_163569 ?auto_163576 ) ) ( not ( = ?auto_163570 ?auto_163571 ) ) ( not ( = ?auto_163570 ?auto_163572 ) ) ( not ( = ?auto_163570 ?auto_163573 ) ) ( not ( = ?auto_163570 ?auto_163574 ) ) ( not ( = ?auto_163570 ?auto_163575 ) ) ( not ( = ?auto_163570 ?auto_163576 ) ) ( not ( = ?auto_163571 ?auto_163572 ) ) ( not ( = ?auto_163571 ?auto_163573 ) ) ( not ( = ?auto_163571 ?auto_163574 ) ) ( not ( = ?auto_163571 ?auto_163575 ) ) ( not ( = ?auto_163571 ?auto_163576 ) ) ( not ( = ?auto_163572 ?auto_163573 ) ) ( not ( = ?auto_163572 ?auto_163574 ) ) ( not ( = ?auto_163572 ?auto_163575 ) ) ( not ( = ?auto_163572 ?auto_163576 ) ) ( not ( = ?auto_163573 ?auto_163574 ) ) ( not ( = ?auto_163573 ?auto_163575 ) ) ( not ( = ?auto_163573 ?auto_163576 ) ) ( not ( = ?auto_163574 ?auto_163575 ) ) ( not ( = ?auto_163574 ?auto_163576 ) ) ( not ( = ?auto_163575 ?auto_163576 ) ) ( ON ?auto_163575 ?auto_163576 ) ( ON ?auto_163574 ?auto_163575 ) ( ON ?auto_163573 ?auto_163574 ) ( CLEAR ?auto_163571 ) ( ON ?auto_163572 ?auto_163573 ) ( CLEAR ?auto_163572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_163565 ?auto_163566 ?auto_163567 ?auto_163568 ?auto_163569 ?auto_163570 ?auto_163571 ?auto_163572 )
      ( MAKE-12PILE ?auto_163565 ?auto_163566 ?auto_163567 ?auto_163568 ?auto_163569 ?auto_163570 ?auto_163571 ?auto_163572 ?auto_163573 ?auto_163574 ?auto_163575 ?auto_163576 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163589 - BLOCK
      ?auto_163590 - BLOCK
      ?auto_163591 - BLOCK
      ?auto_163592 - BLOCK
      ?auto_163593 - BLOCK
      ?auto_163594 - BLOCK
      ?auto_163595 - BLOCK
      ?auto_163596 - BLOCK
      ?auto_163597 - BLOCK
      ?auto_163598 - BLOCK
      ?auto_163599 - BLOCK
      ?auto_163600 - BLOCK
    )
    :vars
    (
      ?auto_163601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163600 ?auto_163601 ) ( ON-TABLE ?auto_163589 ) ( ON ?auto_163590 ?auto_163589 ) ( ON ?auto_163591 ?auto_163590 ) ( ON ?auto_163592 ?auto_163591 ) ( ON ?auto_163593 ?auto_163592 ) ( ON ?auto_163594 ?auto_163593 ) ( not ( = ?auto_163589 ?auto_163590 ) ) ( not ( = ?auto_163589 ?auto_163591 ) ) ( not ( = ?auto_163589 ?auto_163592 ) ) ( not ( = ?auto_163589 ?auto_163593 ) ) ( not ( = ?auto_163589 ?auto_163594 ) ) ( not ( = ?auto_163589 ?auto_163595 ) ) ( not ( = ?auto_163589 ?auto_163596 ) ) ( not ( = ?auto_163589 ?auto_163597 ) ) ( not ( = ?auto_163589 ?auto_163598 ) ) ( not ( = ?auto_163589 ?auto_163599 ) ) ( not ( = ?auto_163589 ?auto_163600 ) ) ( not ( = ?auto_163589 ?auto_163601 ) ) ( not ( = ?auto_163590 ?auto_163591 ) ) ( not ( = ?auto_163590 ?auto_163592 ) ) ( not ( = ?auto_163590 ?auto_163593 ) ) ( not ( = ?auto_163590 ?auto_163594 ) ) ( not ( = ?auto_163590 ?auto_163595 ) ) ( not ( = ?auto_163590 ?auto_163596 ) ) ( not ( = ?auto_163590 ?auto_163597 ) ) ( not ( = ?auto_163590 ?auto_163598 ) ) ( not ( = ?auto_163590 ?auto_163599 ) ) ( not ( = ?auto_163590 ?auto_163600 ) ) ( not ( = ?auto_163590 ?auto_163601 ) ) ( not ( = ?auto_163591 ?auto_163592 ) ) ( not ( = ?auto_163591 ?auto_163593 ) ) ( not ( = ?auto_163591 ?auto_163594 ) ) ( not ( = ?auto_163591 ?auto_163595 ) ) ( not ( = ?auto_163591 ?auto_163596 ) ) ( not ( = ?auto_163591 ?auto_163597 ) ) ( not ( = ?auto_163591 ?auto_163598 ) ) ( not ( = ?auto_163591 ?auto_163599 ) ) ( not ( = ?auto_163591 ?auto_163600 ) ) ( not ( = ?auto_163591 ?auto_163601 ) ) ( not ( = ?auto_163592 ?auto_163593 ) ) ( not ( = ?auto_163592 ?auto_163594 ) ) ( not ( = ?auto_163592 ?auto_163595 ) ) ( not ( = ?auto_163592 ?auto_163596 ) ) ( not ( = ?auto_163592 ?auto_163597 ) ) ( not ( = ?auto_163592 ?auto_163598 ) ) ( not ( = ?auto_163592 ?auto_163599 ) ) ( not ( = ?auto_163592 ?auto_163600 ) ) ( not ( = ?auto_163592 ?auto_163601 ) ) ( not ( = ?auto_163593 ?auto_163594 ) ) ( not ( = ?auto_163593 ?auto_163595 ) ) ( not ( = ?auto_163593 ?auto_163596 ) ) ( not ( = ?auto_163593 ?auto_163597 ) ) ( not ( = ?auto_163593 ?auto_163598 ) ) ( not ( = ?auto_163593 ?auto_163599 ) ) ( not ( = ?auto_163593 ?auto_163600 ) ) ( not ( = ?auto_163593 ?auto_163601 ) ) ( not ( = ?auto_163594 ?auto_163595 ) ) ( not ( = ?auto_163594 ?auto_163596 ) ) ( not ( = ?auto_163594 ?auto_163597 ) ) ( not ( = ?auto_163594 ?auto_163598 ) ) ( not ( = ?auto_163594 ?auto_163599 ) ) ( not ( = ?auto_163594 ?auto_163600 ) ) ( not ( = ?auto_163594 ?auto_163601 ) ) ( not ( = ?auto_163595 ?auto_163596 ) ) ( not ( = ?auto_163595 ?auto_163597 ) ) ( not ( = ?auto_163595 ?auto_163598 ) ) ( not ( = ?auto_163595 ?auto_163599 ) ) ( not ( = ?auto_163595 ?auto_163600 ) ) ( not ( = ?auto_163595 ?auto_163601 ) ) ( not ( = ?auto_163596 ?auto_163597 ) ) ( not ( = ?auto_163596 ?auto_163598 ) ) ( not ( = ?auto_163596 ?auto_163599 ) ) ( not ( = ?auto_163596 ?auto_163600 ) ) ( not ( = ?auto_163596 ?auto_163601 ) ) ( not ( = ?auto_163597 ?auto_163598 ) ) ( not ( = ?auto_163597 ?auto_163599 ) ) ( not ( = ?auto_163597 ?auto_163600 ) ) ( not ( = ?auto_163597 ?auto_163601 ) ) ( not ( = ?auto_163598 ?auto_163599 ) ) ( not ( = ?auto_163598 ?auto_163600 ) ) ( not ( = ?auto_163598 ?auto_163601 ) ) ( not ( = ?auto_163599 ?auto_163600 ) ) ( not ( = ?auto_163599 ?auto_163601 ) ) ( not ( = ?auto_163600 ?auto_163601 ) ) ( ON ?auto_163599 ?auto_163600 ) ( ON ?auto_163598 ?auto_163599 ) ( ON ?auto_163597 ?auto_163598 ) ( ON ?auto_163596 ?auto_163597 ) ( CLEAR ?auto_163594 ) ( ON ?auto_163595 ?auto_163596 ) ( CLEAR ?auto_163595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163589 ?auto_163590 ?auto_163591 ?auto_163592 ?auto_163593 ?auto_163594 ?auto_163595 )
      ( MAKE-12PILE ?auto_163589 ?auto_163590 ?auto_163591 ?auto_163592 ?auto_163593 ?auto_163594 ?auto_163595 ?auto_163596 ?auto_163597 ?auto_163598 ?auto_163599 ?auto_163600 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163614 - BLOCK
      ?auto_163615 - BLOCK
      ?auto_163616 - BLOCK
      ?auto_163617 - BLOCK
      ?auto_163618 - BLOCK
      ?auto_163619 - BLOCK
      ?auto_163620 - BLOCK
      ?auto_163621 - BLOCK
      ?auto_163622 - BLOCK
      ?auto_163623 - BLOCK
      ?auto_163624 - BLOCK
      ?auto_163625 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163625 ) ( ON-TABLE ?auto_163614 ) ( ON ?auto_163615 ?auto_163614 ) ( ON ?auto_163616 ?auto_163615 ) ( ON ?auto_163617 ?auto_163616 ) ( ON ?auto_163618 ?auto_163617 ) ( ON ?auto_163619 ?auto_163618 ) ( not ( = ?auto_163614 ?auto_163615 ) ) ( not ( = ?auto_163614 ?auto_163616 ) ) ( not ( = ?auto_163614 ?auto_163617 ) ) ( not ( = ?auto_163614 ?auto_163618 ) ) ( not ( = ?auto_163614 ?auto_163619 ) ) ( not ( = ?auto_163614 ?auto_163620 ) ) ( not ( = ?auto_163614 ?auto_163621 ) ) ( not ( = ?auto_163614 ?auto_163622 ) ) ( not ( = ?auto_163614 ?auto_163623 ) ) ( not ( = ?auto_163614 ?auto_163624 ) ) ( not ( = ?auto_163614 ?auto_163625 ) ) ( not ( = ?auto_163615 ?auto_163616 ) ) ( not ( = ?auto_163615 ?auto_163617 ) ) ( not ( = ?auto_163615 ?auto_163618 ) ) ( not ( = ?auto_163615 ?auto_163619 ) ) ( not ( = ?auto_163615 ?auto_163620 ) ) ( not ( = ?auto_163615 ?auto_163621 ) ) ( not ( = ?auto_163615 ?auto_163622 ) ) ( not ( = ?auto_163615 ?auto_163623 ) ) ( not ( = ?auto_163615 ?auto_163624 ) ) ( not ( = ?auto_163615 ?auto_163625 ) ) ( not ( = ?auto_163616 ?auto_163617 ) ) ( not ( = ?auto_163616 ?auto_163618 ) ) ( not ( = ?auto_163616 ?auto_163619 ) ) ( not ( = ?auto_163616 ?auto_163620 ) ) ( not ( = ?auto_163616 ?auto_163621 ) ) ( not ( = ?auto_163616 ?auto_163622 ) ) ( not ( = ?auto_163616 ?auto_163623 ) ) ( not ( = ?auto_163616 ?auto_163624 ) ) ( not ( = ?auto_163616 ?auto_163625 ) ) ( not ( = ?auto_163617 ?auto_163618 ) ) ( not ( = ?auto_163617 ?auto_163619 ) ) ( not ( = ?auto_163617 ?auto_163620 ) ) ( not ( = ?auto_163617 ?auto_163621 ) ) ( not ( = ?auto_163617 ?auto_163622 ) ) ( not ( = ?auto_163617 ?auto_163623 ) ) ( not ( = ?auto_163617 ?auto_163624 ) ) ( not ( = ?auto_163617 ?auto_163625 ) ) ( not ( = ?auto_163618 ?auto_163619 ) ) ( not ( = ?auto_163618 ?auto_163620 ) ) ( not ( = ?auto_163618 ?auto_163621 ) ) ( not ( = ?auto_163618 ?auto_163622 ) ) ( not ( = ?auto_163618 ?auto_163623 ) ) ( not ( = ?auto_163618 ?auto_163624 ) ) ( not ( = ?auto_163618 ?auto_163625 ) ) ( not ( = ?auto_163619 ?auto_163620 ) ) ( not ( = ?auto_163619 ?auto_163621 ) ) ( not ( = ?auto_163619 ?auto_163622 ) ) ( not ( = ?auto_163619 ?auto_163623 ) ) ( not ( = ?auto_163619 ?auto_163624 ) ) ( not ( = ?auto_163619 ?auto_163625 ) ) ( not ( = ?auto_163620 ?auto_163621 ) ) ( not ( = ?auto_163620 ?auto_163622 ) ) ( not ( = ?auto_163620 ?auto_163623 ) ) ( not ( = ?auto_163620 ?auto_163624 ) ) ( not ( = ?auto_163620 ?auto_163625 ) ) ( not ( = ?auto_163621 ?auto_163622 ) ) ( not ( = ?auto_163621 ?auto_163623 ) ) ( not ( = ?auto_163621 ?auto_163624 ) ) ( not ( = ?auto_163621 ?auto_163625 ) ) ( not ( = ?auto_163622 ?auto_163623 ) ) ( not ( = ?auto_163622 ?auto_163624 ) ) ( not ( = ?auto_163622 ?auto_163625 ) ) ( not ( = ?auto_163623 ?auto_163624 ) ) ( not ( = ?auto_163623 ?auto_163625 ) ) ( not ( = ?auto_163624 ?auto_163625 ) ) ( ON ?auto_163624 ?auto_163625 ) ( ON ?auto_163623 ?auto_163624 ) ( ON ?auto_163622 ?auto_163623 ) ( ON ?auto_163621 ?auto_163622 ) ( CLEAR ?auto_163619 ) ( ON ?auto_163620 ?auto_163621 ) ( CLEAR ?auto_163620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_163614 ?auto_163615 ?auto_163616 ?auto_163617 ?auto_163618 ?auto_163619 ?auto_163620 )
      ( MAKE-12PILE ?auto_163614 ?auto_163615 ?auto_163616 ?auto_163617 ?auto_163618 ?auto_163619 ?auto_163620 ?auto_163621 ?auto_163622 ?auto_163623 ?auto_163624 ?auto_163625 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163638 - BLOCK
      ?auto_163639 - BLOCK
      ?auto_163640 - BLOCK
      ?auto_163641 - BLOCK
      ?auto_163642 - BLOCK
      ?auto_163643 - BLOCK
      ?auto_163644 - BLOCK
      ?auto_163645 - BLOCK
      ?auto_163646 - BLOCK
      ?auto_163647 - BLOCK
      ?auto_163648 - BLOCK
      ?auto_163649 - BLOCK
    )
    :vars
    (
      ?auto_163650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163649 ?auto_163650 ) ( ON-TABLE ?auto_163638 ) ( ON ?auto_163639 ?auto_163638 ) ( ON ?auto_163640 ?auto_163639 ) ( ON ?auto_163641 ?auto_163640 ) ( ON ?auto_163642 ?auto_163641 ) ( not ( = ?auto_163638 ?auto_163639 ) ) ( not ( = ?auto_163638 ?auto_163640 ) ) ( not ( = ?auto_163638 ?auto_163641 ) ) ( not ( = ?auto_163638 ?auto_163642 ) ) ( not ( = ?auto_163638 ?auto_163643 ) ) ( not ( = ?auto_163638 ?auto_163644 ) ) ( not ( = ?auto_163638 ?auto_163645 ) ) ( not ( = ?auto_163638 ?auto_163646 ) ) ( not ( = ?auto_163638 ?auto_163647 ) ) ( not ( = ?auto_163638 ?auto_163648 ) ) ( not ( = ?auto_163638 ?auto_163649 ) ) ( not ( = ?auto_163638 ?auto_163650 ) ) ( not ( = ?auto_163639 ?auto_163640 ) ) ( not ( = ?auto_163639 ?auto_163641 ) ) ( not ( = ?auto_163639 ?auto_163642 ) ) ( not ( = ?auto_163639 ?auto_163643 ) ) ( not ( = ?auto_163639 ?auto_163644 ) ) ( not ( = ?auto_163639 ?auto_163645 ) ) ( not ( = ?auto_163639 ?auto_163646 ) ) ( not ( = ?auto_163639 ?auto_163647 ) ) ( not ( = ?auto_163639 ?auto_163648 ) ) ( not ( = ?auto_163639 ?auto_163649 ) ) ( not ( = ?auto_163639 ?auto_163650 ) ) ( not ( = ?auto_163640 ?auto_163641 ) ) ( not ( = ?auto_163640 ?auto_163642 ) ) ( not ( = ?auto_163640 ?auto_163643 ) ) ( not ( = ?auto_163640 ?auto_163644 ) ) ( not ( = ?auto_163640 ?auto_163645 ) ) ( not ( = ?auto_163640 ?auto_163646 ) ) ( not ( = ?auto_163640 ?auto_163647 ) ) ( not ( = ?auto_163640 ?auto_163648 ) ) ( not ( = ?auto_163640 ?auto_163649 ) ) ( not ( = ?auto_163640 ?auto_163650 ) ) ( not ( = ?auto_163641 ?auto_163642 ) ) ( not ( = ?auto_163641 ?auto_163643 ) ) ( not ( = ?auto_163641 ?auto_163644 ) ) ( not ( = ?auto_163641 ?auto_163645 ) ) ( not ( = ?auto_163641 ?auto_163646 ) ) ( not ( = ?auto_163641 ?auto_163647 ) ) ( not ( = ?auto_163641 ?auto_163648 ) ) ( not ( = ?auto_163641 ?auto_163649 ) ) ( not ( = ?auto_163641 ?auto_163650 ) ) ( not ( = ?auto_163642 ?auto_163643 ) ) ( not ( = ?auto_163642 ?auto_163644 ) ) ( not ( = ?auto_163642 ?auto_163645 ) ) ( not ( = ?auto_163642 ?auto_163646 ) ) ( not ( = ?auto_163642 ?auto_163647 ) ) ( not ( = ?auto_163642 ?auto_163648 ) ) ( not ( = ?auto_163642 ?auto_163649 ) ) ( not ( = ?auto_163642 ?auto_163650 ) ) ( not ( = ?auto_163643 ?auto_163644 ) ) ( not ( = ?auto_163643 ?auto_163645 ) ) ( not ( = ?auto_163643 ?auto_163646 ) ) ( not ( = ?auto_163643 ?auto_163647 ) ) ( not ( = ?auto_163643 ?auto_163648 ) ) ( not ( = ?auto_163643 ?auto_163649 ) ) ( not ( = ?auto_163643 ?auto_163650 ) ) ( not ( = ?auto_163644 ?auto_163645 ) ) ( not ( = ?auto_163644 ?auto_163646 ) ) ( not ( = ?auto_163644 ?auto_163647 ) ) ( not ( = ?auto_163644 ?auto_163648 ) ) ( not ( = ?auto_163644 ?auto_163649 ) ) ( not ( = ?auto_163644 ?auto_163650 ) ) ( not ( = ?auto_163645 ?auto_163646 ) ) ( not ( = ?auto_163645 ?auto_163647 ) ) ( not ( = ?auto_163645 ?auto_163648 ) ) ( not ( = ?auto_163645 ?auto_163649 ) ) ( not ( = ?auto_163645 ?auto_163650 ) ) ( not ( = ?auto_163646 ?auto_163647 ) ) ( not ( = ?auto_163646 ?auto_163648 ) ) ( not ( = ?auto_163646 ?auto_163649 ) ) ( not ( = ?auto_163646 ?auto_163650 ) ) ( not ( = ?auto_163647 ?auto_163648 ) ) ( not ( = ?auto_163647 ?auto_163649 ) ) ( not ( = ?auto_163647 ?auto_163650 ) ) ( not ( = ?auto_163648 ?auto_163649 ) ) ( not ( = ?auto_163648 ?auto_163650 ) ) ( not ( = ?auto_163649 ?auto_163650 ) ) ( ON ?auto_163648 ?auto_163649 ) ( ON ?auto_163647 ?auto_163648 ) ( ON ?auto_163646 ?auto_163647 ) ( ON ?auto_163645 ?auto_163646 ) ( ON ?auto_163644 ?auto_163645 ) ( CLEAR ?auto_163642 ) ( ON ?auto_163643 ?auto_163644 ) ( CLEAR ?auto_163643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163638 ?auto_163639 ?auto_163640 ?auto_163641 ?auto_163642 ?auto_163643 )
      ( MAKE-12PILE ?auto_163638 ?auto_163639 ?auto_163640 ?auto_163641 ?auto_163642 ?auto_163643 ?auto_163644 ?auto_163645 ?auto_163646 ?auto_163647 ?auto_163648 ?auto_163649 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163663 - BLOCK
      ?auto_163664 - BLOCK
      ?auto_163665 - BLOCK
      ?auto_163666 - BLOCK
      ?auto_163667 - BLOCK
      ?auto_163668 - BLOCK
      ?auto_163669 - BLOCK
      ?auto_163670 - BLOCK
      ?auto_163671 - BLOCK
      ?auto_163672 - BLOCK
      ?auto_163673 - BLOCK
      ?auto_163674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163674 ) ( ON-TABLE ?auto_163663 ) ( ON ?auto_163664 ?auto_163663 ) ( ON ?auto_163665 ?auto_163664 ) ( ON ?auto_163666 ?auto_163665 ) ( ON ?auto_163667 ?auto_163666 ) ( not ( = ?auto_163663 ?auto_163664 ) ) ( not ( = ?auto_163663 ?auto_163665 ) ) ( not ( = ?auto_163663 ?auto_163666 ) ) ( not ( = ?auto_163663 ?auto_163667 ) ) ( not ( = ?auto_163663 ?auto_163668 ) ) ( not ( = ?auto_163663 ?auto_163669 ) ) ( not ( = ?auto_163663 ?auto_163670 ) ) ( not ( = ?auto_163663 ?auto_163671 ) ) ( not ( = ?auto_163663 ?auto_163672 ) ) ( not ( = ?auto_163663 ?auto_163673 ) ) ( not ( = ?auto_163663 ?auto_163674 ) ) ( not ( = ?auto_163664 ?auto_163665 ) ) ( not ( = ?auto_163664 ?auto_163666 ) ) ( not ( = ?auto_163664 ?auto_163667 ) ) ( not ( = ?auto_163664 ?auto_163668 ) ) ( not ( = ?auto_163664 ?auto_163669 ) ) ( not ( = ?auto_163664 ?auto_163670 ) ) ( not ( = ?auto_163664 ?auto_163671 ) ) ( not ( = ?auto_163664 ?auto_163672 ) ) ( not ( = ?auto_163664 ?auto_163673 ) ) ( not ( = ?auto_163664 ?auto_163674 ) ) ( not ( = ?auto_163665 ?auto_163666 ) ) ( not ( = ?auto_163665 ?auto_163667 ) ) ( not ( = ?auto_163665 ?auto_163668 ) ) ( not ( = ?auto_163665 ?auto_163669 ) ) ( not ( = ?auto_163665 ?auto_163670 ) ) ( not ( = ?auto_163665 ?auto_163671 ) ) ( not ( = ?auto_163665 ?auto_163672 ) ) ( not ( = ?auto_163665 ?auto_163673 ) ) ( not ( = ?auto_163665 ?auto_163674 ) ) ( not ( = ?auto_163666 ?auto_163667 ) ) ( not ( = ?auto_163666 ?auto_163668 ) ) ( not ( = ?auto_163666 ?auto_163669 ) ) ( not ( = ?auto_163666 ?auto_163670 ) ) ( not ( = ?auto_163666 ?auto_163671 ) ) ( not ( = ?auto_163666 ?auto_163672 ) ) ( not ( = ?auto_163666 ?auto_163673 ) ) ( not ( = ?auto_163666 ?auto_163674 ) ) ( not ( = ?auto_163667 ?auto_163668 ) ) ( not ( = ?auto_163667 ?auto_163669 ) ) ( not ( = ?auto_163667 ?auto_163670 ) ) ( not ( = ?auto_163667 ?auto_163671 ) ) ( not ( = ?auto_163667 ?auto_163672 ) ) ( not ( = ?auto_163667 ?auto_163673 ) ) ( not ( = ?auto_163667 ?auto_163674 ) ) ( not ( = ?auto_163668 ?auto_163669 ) ) ( not ( = ?auto_163668 ?auto_163670 ) ) ( not ( = ?auto_163668 ?auto_163671 ) ) ( not ( = ?auto_163668 ?auto_163672 ) ) ( not ( = ?auto_163668 ?auto_163673 ) ) ( not ( = ?auto_163668 ?auto_163674 ) ) ( not ( = ?auto_163669 ?auto_163670 ) ) ( not ( = ?auto_163669 ?auto_163671 ) ) ( not ( = ?auto_163669 ?auto_163672 ) ) ( not ( = ?auto_163669 ?auto_163673 ) ) ( not ( = ?auto_163669 ?auto_163674 ) ) ( not ( = ?auto_163670 ?auto_163671 ) ) ( not ( = ?auto_163670 ?auto_163672 ) ) ( not ( = ?auto_163670 ?auto_163673 ) ) ( not ( = ?auto_163670 ?auto_163674 ) ) ( not ( = ?auto_163671 ?auto_163672 ) ) ( not ( = ?auto_163671 ?auto_163673 ) ) ( not ( = ?auto_163671 ?auto_163674 ) ) ( not ( = ?auto_163672 ?auto_163673 ) ) ( not ( = ?auto_163672 ?auto_163674 ) ) ( not ( = ?auto_163673 ?auto_163674 ) ) ( ON ?auto_163673 ?auto_163674 ) ( ON ?auto_163672 ?auto_163673 ) ( ON ?auto_163671 ?auto_163672 ) ( ON ?auto_163670 ?auto_163671 ) ( ON ?auto_163669 ?auto_163670 ) ( CLEAR ?auto_163667 ) ( ON ?auto_163668 ?auto_163669 ) ( CLEAR ?auto_163668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_163663 ?auto_163664 ?auto_163665 ?auto_163666 ?auto_163667 ?auto_163668 )
      ( MAKE-12PILE ?auto_163663 ?auto_163664 ?auto_163665 ?auto_163666 ?auto_163667 ?auto_163668 ?auto_163669 ?auto_163670 ?auto_163671 ?auto_163672 ?auto_163673 ?auto_163674 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163687 - BLOCK
      ?auto_163688 - BLOCK
      ?auto_163689 - BLOCK
      ?auto_163690 - BLOCK
      ?auto_163691 - BLOCK
      ?auto_163692 - BLOCK
      ?auto_163693 - BLOCK
      ?auto_163694 - BLOCK
      ?auto_163695 - BLOCK
      ?auto_163696 - BLOCK
      ?auto_163697 - BLOCK
      ?auto_163698 - BLOCK
    )
    :vars
    (
      ?auto_163699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163698 ?auto_163699 ) ( ON-TABLE ?auto_163687 ) ( ON ?auto_163688 ?auto_163687 ) ( ON ?auto_163689 ?auto_163688 ) ( ON ?auto_163690 ?auto_163689 ) ( not ( = ?auto_163687 ?auto_163688 ) ) ( not ( = ?auto_163687 ?auto_163689 ) ) ( not ( = ?auto_163687 ?auto_163690 ) ) ( not ( = ?auto_163687 ?auto_163691 ) ) ( not ( = ?auto_163687 ?auto_163692 ) ) ( not ( = ?auto_163687 ?auto_163693 ) ) ( not ( = ?auto_163687 ?auto_163694 ) ) ( not ( = ?auto_163687 ?auto_163695 ) ) ( not ( = ?auto_163687 ?auto_163696 ) ) ( not ( = ?auto_163687 ?auto_163697 ) ) ( not ( = ?auto_163687 ?auto_163698 ) ) ( not ( = ?auto_163687 ?auto_163699 ) ) ( not ( = ?auto_163688 ?auto_163689 ) ) ( not ( = ?auto_163688 ?auto_163690 ) ) ( not ( = ?auto_163688 ?auto_163691 ) ) ( not ( = ?auto_163688 ?auto_163692 ) ) ( not ( = ?auto_163688 ?auto_163693 ) ) ( not ( = ?auto_163688 ?auto_163694 ) ) ( not ( = ?auto_163688 ?auto_163695 ) ) ( not ( = ?auto_163688 ?auto_163696 ) ) ( not ( = ?auto_163688 ?auto_163697 ) ) ( not ( = ?auto_163688 ?auto_163698 ) ) ( not ( = ?auto_163688 ?auto_163699 ) ) ( not ( = ?auto_163689 ?auto_163690 ) ) ( not ( = ?auto_163689 ?auto_163691 ) ) ( not ( = ?auto_163689 ?auto_163692 ) ) ( not ( = ?auto_163689 ?auto_163693 ) ) ( not ( = ?auto_163689 ?auto_163694 ) ) ( not ( = ?auto_163689 ?auto_163695 ) ) ( not ( = ?auto_163689 ?auto_163696 ) ) ( not ( = ?auto_163689 ?auto_163697 ) ) ( not ( = ?auto_163689 ?auto_163698 ) ) ( not ( = ?auto_163689 ?auto_163699 ) ) ( not ( = ?auto_163690 ?auto_163691 ) ) ( not ( = ?auto_163690 ?auto_163692 ) ) ( not ( = ?auto_163690 ?auto_163693 ) ) ( not ( = ?auto_163690 ?auto_163694 ) ) ( not ( = ?auto_163690 ?auto_163695 ) ) ( not ( = ?auto_163690 ?auto_163696 ) ) ( not ( = ?auto_163690 ?auto_163697 ) ) ( not ( = ?auto_163690 ?auto_163698 ) ) ( not ( = ?auto_163690 ?auto_163699 ) ) ( not ( = ?auto_163691 ?auto_163692 ) ) ( not ( = ?auto_163691 ?auto_163693 ) ) ( not ( = ?auto_163691 ?auto_163694 ) ) ( not ( = ?auto_163691 ?auto_163695 ) ) ( not ( = ?auto_163691 ?auto_163696 ) ) ( not ( = ?auto_163691 ?auto_163697 ) ) ( not ( = ?auto_163691 ?auto_163698 ) ) ( not ( = ?auto_163691 ?auto_163699 ) ) ( not ( = ?auto_163692 ?auto_163693 ) ) ( not ( = ?auto_163692 ?auto_163694 ) ) ( not ( = ?auto_163692 ?auto_163695 ) ) ( not ( = ?auto_163692 ?auto_163696 ) ) ( not ( = ?auto_163692 ?auto_163697 ) ) ( not ( = ?auto_163692 ?auto_163698 ) ) ( not ( = ?auto_163692 ?auto_163699 ) ) ( not ( = ?auto_163693 ?auto_163694 ) ) ( not ( = ?auto_163693 ?auto_163695 ) ) ( not ( = ?auto_163693 ?auto_163696 ) ) ( not ( = ?auto_163693 ?auto_163697 ) ) ( not ( = ?auto_163693 ?auto_163698 ) ) ( not ( = ?auto_163693 ?auto_163699 ) ) ( not ( = ?auto_163694 ?auto_163695 ) ) ( not ( = ?auto_163694 ?auto_163696 ) ) ( not ( = ?auto_163694 ?auto_163697 ) ) ( not ( = ?auto_163694 ?auto_163698 ) ) ( not ( = ?auto_163694 ?auto_163699 ) ) ( not ( = ?auto_163695 ?auto_163696 ) ) ( not ( = ?auto_163695 ?auto_163697 ) ) ( not ( = ?auto_163695 ?auto_163698 ) ) ( not ( = ?auto_163695 ?auto_163699 ) ) ( not ( = ?auto_163696 ?auto_163697 ) ) ( not ( = ?auto_163696 ?auto_163698 ) ) ( not ( = ?auto_163696 ?auto_163699 ) ) ( not ( = ?auto_163697 ?auto_163698 ) ) ( not ( = ?auto_163697 ?auto_163699 ) ) ( not ( = ?auto_163698 ?auto_163699 ) ) ( ON ?auto_163697 ?auto_163698 ) ( ON ?auto_163696 ?auto_163697 ) ( ON ?auto_163695 ?auto_163696 ) ( ON ?auto_163694 ?auto_163695 ) ( ON ?auto_163693 ?auto_163694 ) ( ON ?auto_163692 ?auto_163693 ) ( CLEAR ?auto_163690 ) ( ON ?auto_163691 ?auto_163692 ) ( CLEAR ?auto_163691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163687 ?auto_163688 ?auto_163689 ?auto_163690 ?auto_163691 )
      ( MAKE-12PILE ?auto_163687 ?auto_163688 ?auto_163689 ?auto_163690 ?auto_163691 ?auto_163692 ?auto_163693 ?auto_163694 ?auto_163695 ?auto_163696 ?auto_163697 ?auto_163698 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163712 - BLOCK
      ?auto_163713 - BLOCK
      ?auto_163714 - BLOCK
      ?auto_163715 - BLOCK
      ?auto_163716 - BLOCK
      ?auto_163717 - BLOCK
      ?auto_163718 - BLOCK
      ?auto_163719 - BLOCK
      ?auto_163720 - BLOCK
      ?auto_163721 - BLOCK
      ?auto_163722 - BLOCK
      ?auto_163723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163723 ) ( ON-TABLE ?auto_163712 ) ( ON ?auto_163713 ?auto_163712 ) ( ON ?auto_163714 ?auto_163713 ) ( ON ?auto_163715 ?auto_163714 ) ( not ( = ?auto_163712 ?auto_163713 ) ) ( not ( = ?auto_163712 ?auto_163714 ) ) ( not ( = ?auto_163712 ?auto_163715 ) ) ( not ( = ?auto_163712 ?auto_163716 ) ) ( not ( = ?auto_163712 ?auto_163717 ) ) ( not ( = ?auto_163712 ?auto_163718 ) ) ( not ( = ?auto_163712 ?auto_163719 ) ) ( not ( = ?auto_163712 ?auto_163720 ) ) ( not ( = ?auto_163712 ?auto_163721 ) ) ( not ( = ?auto_163712 ?auto_163722 ) ) ( not ( = ?auto_163712 ?auto_163723 ) ) ( not ( = ?auto_163713 ?auto_163714 ) ) ( not ( = ?auto_163713 ?auto_163715 ) ) ( not ( = ?auto_163713 ?auto_163716 ) ) ( not ( = ?auto_163713 ?auto_163717 ) ) ( not ( = ?auto_163713 ?auto_163718 ) ) ( not ( = ?auto_163713 ?auto_163719 ) ) ( not ( = ?auto_163713 ?auto_163720 ) ) ( not ( = ?auto_163713 ?auto_163721 ) ) ( not ( = ?auto_163713 ?auto_163722 ) ) ( not ( = ?auto_163713 ?auto_163723 ) ) ( not ( = ?auto_163714 ?auto_163715 ) ) ( not ( = ?auto_163714 ?auto_163716 ) ) ( not ( = ?auto_163714 ?auto_163717 ) ) ( not ( = ?auto_163714 ?auto_163718 ) ) ( not ( = ?auto_163714 ?auto_163719 ) ) ( not ( = ?auto_163714 ?auto_163720 ) ) ( not ( = ?auto_163714 ?auto_163721 ) ) ( not ( = ?auto_163714 ?auto_163722 ) ) ( not ( = ?auto_163714 ?auto_163723 ) ) ( not ( = ?auto_163715 ?auto_163716 ) ) ( not ( = ?auto_163715 ?auto_163717 ) ) ( not ( = ?auto_163715 ?auto_163718 ) ) ( not ( = ?auto_163715 ?auto_163719 ) ) ( not ( = ?auto_163715 ?auto_163720 ) ) ( not ( = ?auto_163715 ?auto_163721 ) ) ( not ( = ?auto_163715 ?auto_163722 ) ) ( not ( = ?auto_163715 ?auto_163723 ) ) ( not ( = ?auto_163716 ?auto_163717 ) ) ( not ( = ?auto_163716 ?auto_163718 ) ) ( not ( = ?auto_163716 ?auto_163719 ) ) ( not ( = ?auto_163716 ?auto_163720 ) ) ( not ( = ?auto_163716 ?auto_163721 ) ) ( not ( = ?auto_163716 ?auto_163722 ) ) ( not ( = ?auto_163716 ?auto_163723 ) ) ( not ( = ?auto_163717 ?auto_163718 ) ) ( not ( = ?auto_163717 ?auto_163719 ) ) ( not ( = ?auto_163717 ?auto_163720 ) ) ( not ( = ?auto_163717 ?auto_163721 ) ) ( not ( = ?auto_163717 ?auto_163722 ) ) ( not ( = ?auto_163717 ?auto_163723 ) ) ( not ( = ?auto_163718 ?auto_163719 ) ) ( not ( = ?auto_163718 ?auto_163720 ) ) ( not ( = ?auto_163718 ?auto_163721 ) ) ( not ( = ?auto_163718 ?auto_163722 ) ) ( not ( = ?auto_163718 ?auto_163723 ) ) ( not ( = ?auto_163719 ?auto_163720 ) ) ( not ( = ?auto_163719 ?auto_163721 ) ) ( not ( = ?auto_163719 ?auto_163722 ) ) ( not ( = ?auto_163719 ?auto_163723 ) ) ( not ( = ?auto_163720 ?auto_163721 ) ) ( not ( = ?auto_163720 ?auto_163722 ) ) ( not ( = ?auto_163720 ?auto_163723 ) ) ( not ( = ?auto_163721 ?auto_163722 ) ) ( not ( = ?auto_163721 ?auto_163723 ) ) ( not ( = ?auto_163722 ?auto_163723 ) ) ( ON ?auto_163722 ?auto_163723 ) ( ON ?auto_163721 ?auto_163722 ) ( ON ?auto_163720 ?auto_163721 ) ( ON ?auto_163719 ?auto_163720 ) ( ON ?auto_163718 ?auto_163719 ) ( ON ?auto_163717 ?auto_163718 ) ( CLEAR ?auto_163715 ) ( ON ?auto_163716 ?auto_163717 ) ( CLEAR ?auto_163716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_163712 ?auto_163713 ?auto_163714 ?auto_163715 ?auto_163716 )
      ( MAKE-12PILE ?auto_163712 ?auto_163713 ?auto_163714 ?auto_163715 ?auto_163716 ?auto_163717 ?auto_163718 ?auto_163719 ?auto_163720 ?auto_163721 ?auto_163722 ?auto_163723 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163736 - BLOCK
      ?auto_163737 - BLOCK
      ?auto_163738 - BLOCK
      ?auto_163739 - BLOCK
      ?auto_163740 - BLOCK
      ?auto_163741 - BLOCK
      ?auto_163742 - BLOCK
      ?auto_163743 - BLOCK
      ?auto_163744 - BLOCK
      ?auto_163745 - BLOCK
      ?auto_163746 - BLOCK
      ?auto_163747 - BLOCK
    )
    :vars
    (
      ?auto_163748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163747 ?auto_163748 ) ( ON-TABLE ?auto_163736 ) ( ON ?auto_163737 ?auto_163736 ) ( ON ?auto_163738 ?auto_163737 ) ( not ( = ?auto_163736 ?auto_163737 ) ) ( not ( = ?auto_163736 ?auto_163738 ) ) ( not ( = ?auto_163736 ?auto_163739 ) ) ( not ( = ?auto_163736 ?auto_163740 ) ) ( not ( = ?auto_163736 ?auto_163741 ) ) ( not ( = ?auto_163736 ?auto_163742 ) ) ( not ( = ?auto_163736 ?auto_163743 ) ) ( not ( = ?auto_163736 ?auto_163744 ) ) ( not ( = ?auto_163736 ?auto_163745 ) ) ( not ( = ?auto_163736 ?auto_163746 ) ) ( not ( = ?auto_163736 ?auto_163747 ) ) ( not ( = ?auto_163736 ?auto_163748 ) ) ( not ( = ?auto_163737 ?auto_163738 ) ) ( not ( = ?auto_163737 ?auto_163739 ) ) ( not ( = ?auto_163737 ?auto_163740 ) ) ( not ( = ?auto_163737 ?auto_163741 ) ) ( not ( = ?auto_163737 ?auto_163742 ) ) ( not ( = ?auto_163737 ?auto_163743 ) ) ( not ( = ?auto_163737 ?auto_163744 ) ) ( not ( = ?auto_163737 ?auto_163745 ) ) ( not ( = ?auto_163737 ?auto_163746 ) ) ( not ( = ?auto_163737 ?auto_163747 ) ) ( not ( = ?auto_163737 ?auto_163748 ) ) ( not ( = ?auto_163738 ?auto_163739 ) ) ( not ( = ?auto_163738 ?auto_163740 ) ) ( not ( = ?auto_163738 ?auto_163741 ) ) ( not ( = ?auto_163738 ?auto_163742 ) ) ( not ( = ?auto_163738 ?auto_163743 ) ) ( not ( = ?auto_163738 ?auto_163744 ) ) ( not ( = ?auto_163738 ?auto_163745 ) ) ( not ( = ?auto_163738 ?auto_163746 ) ) ( not ( = ?auto_163738 ?auto_163747 ) ) ( not ( = ?auto_163738 ?auto_163748 ) ) ( not ( = ?auto_163739 ?auto_163740 ) ) ( not ( = ?auto_163739 ?auto_163741 ) ) ( not ( = ?auto_163739 ?auto_163742 ) ) ( not ( = ?auto_163739 ?auto_163743 ) ) ( not ( = ?auto_163739 ?auto_163744 ) ) ( not ( = ?auto_163739 ?auto_163745 ) ) ( not ( = ?auto_163739 ?auto_163746 ) ) ( not ( = ?auto_163739 ?auto_163747 ) ) ( not ( = ?auto_163739 ?auto_163748 ) ) ( not ( = ?auto_163740 ?auto_163741 ) ) ( not ( = ?auto_163740 ?auto_163742 ) ) ( not ( = ?auto_163740 ?auto_163743 ) ) ( not ( = ?auto_163740 ?auto_163744 ) ) ( not ( = ?auto_163740 ?auto_163745 ) ) ( not ( = ?auto_163740 ?auto_163746 ) ) ( not ( = ?auto_163740 ?auto_163747 ) ) ( not ( = ?auto_163740 ?auto_163748 ) ) ( not ( = ?auto_163741 ?auto_163742 ) ) ( not ( = ?auto_163741 ?auto_163743 ) ) ( not ( = ?auto_163741 ?auto_163744 ) ) ( not ( = ?auto_163741 ?auto_163745 ) ) ( not ( = ?auto_163741 ?auto_163746 ) ) ( not ( = ?auto_163741 ?auto_163747 ) ) ( not ( = ?auto_163741 ?auto_163748 ) ) ( not ( = ?auto_163742 ?auto_163743 ) ) ( not ( = ?auto_163742 ?auto_163744 ) ) ( not ( = ?auto_163742 ?auto_163745 ) ) ( not ( = ?auto_163742 ?auto_163746 ) ) ( not ( = ?auto_163742 ?auto_163747 ) ) ( not ( = ?auto_163742 ?auto_163748 ) ) ( not ( = ?auto_163743 ?auto_163744 ) ) ( not ( = ?auto_163743 ?auto_163745 ) ) ( not ( = ?auto_163743 ?auto_163746 ) ) ( not ( = ?auto_163743 ?auto_163747 ) ) ( not ( = ?auto_163743 ?auto_163748 ) ) ( not ( = ?auto_163744 ?auto_163745 ) ) ( not ( = ?auto_163744 ?auto_163746 ) ) ( not ( = ?auto_163744 ?auto_163747 ) ) ( not ( = ?auto_163744 ?auto_163748 ) ) ( not ( = ?auto_163745 ?auto_163746 ) ) ( not ( = ?auto_163745 ?auto_163747 ) ) ( not ( = ?auto_163745 ?auto_163748 ) ) ( not ( = ?auto_163746 ?auto_163747 ) ) ( not ( = ?auto_163746 ?auto_163748 ) ) ( not ( = ?auto_163747 ?auto_163748 ) ) ( ON ?auto_163746 ?auto_163747 ) ( ON ?auto_163745 ?auto_163746 ) ( ON ?auto_163744 ?auto_163745 ) ( ON ?auto_163743 ?auto_163744 ) ( ON ?auto_163742 ?auto_163743 ) ( ON ?auto_163741 ?auto_163742 ) ( ON ?auto_163740 ?auto_163741 ) ( CLEAR ?auto_163738 ) ( ON ?auto_163739 ?auto_163740 ) ( CLEAR ?auto_163739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163736 ?auto_163737 ?auto_163738 ?auto_163739 )
      ( MAKE-12PILE ?auto_163736 ?auto_163737 ?auto_163738 ?auto_163739 ?auto_163740 ?auto_163741 ?auto_163742 ?auto_163743 ?auto_163744 ?auto_163745 ?auto_163746 ?auto_163747 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163761 - BLOCK
      ?auto_163762 - BLOCK
      ?auto_163763 - BLOCK
      ?auto_163764 - BLOCK
      ?auto_163765 - BLOCK
      ?auto_163766 - BLOCK
      ?auto_163767 - BLOCK
      ?auto_163768 - BLOCK
      ?auto_163769 - BLOCK
      ?auto_163770 - BLOCK
      ?auto_163771 - BLOCK
      ?auto_163772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163772 ) ( ON-TABLE ?auto_163761 ) ( ON ?auto_163762 ?auto_163761 ) ( ON ?auto_163763 ?auto_163762 ) ( not ( = ?auto_163761 ?auto_163762 ) ) ( not ( = ?auto_163761 ?auto_163763 ) ) ( not ( = ?auto_163761 ?auto_163764 ) ) ( not ( = ?auto_163761 ?auto_163765 ) ) ( not ( = ?auto_163761 ?auto_163766 ) ) ( not ( = ?auto_163761 ?auto_163767 ) ) ( not ( = ?auto_163761 ?auto_163768 ) ) ( not ( = ?auto_163761 ?auto_163769 ) ) ( not ( = ?auto_163761 ?auto_163770 ) ) ( not ( = ?auto_163761 ?auto_163771 ) ) ( not ( = ?auto_163761 ?auto_163772 ) ) ( not ( = ?auto_163762 ?auto_163763 ) ) ( not ( = ?auto_163762 ?auto_163764 ) ) ( not ( = ?auto_163762 ?auto_163765 ) ) ( not ( = ?auto_163762 ?auto_163766 ) ) ( not ( = ?auto_163762 ?auto_163767 ) ) ( not ( = ?auto_163762 ?auto_163768 ) ) ( not ( = ?auto_163762 ?auto_163769 ) ) ( not ( = ?auto_163762 ?auto_163770 ) ) ( not ( = ?auto_163762 ?auto_163771 ) ) ( not ( = ?auto_163762 ?auto_163772 ) ) ( not ( = ?auto_163763 ?auto_163764 ) ) ( not ( = ?auto_163763 ?auto_163765 ) ) ( not ( = ?auto_163763 ?auto_163766 ) ) ( not ( = ?auto_163763 ?auto_163767 ) ) ( not ( = ?auto_163763 ?auto_163768 ) ) ( not ( = ?auto_163763 ?auto_163769 ) ) ( not ( = ?auto_163763 ?auto_163770 ) ) ( not ( = ?auto_163763 ?auto_163771 ) ) ( not ( = ?auto_163763 ?auto_163772 ) ) ( not ( = ?auto_163764 ?auto_163765 ) ) ( not ( = ?auto_163764 ?auto_163766 ) ) ( not ( = ?auto_163764 ?auto_163767 ) ) ( not ( = ?auto_163764 ?auto_163768 ) ) ( not ( = ?auto_163764 ?auto_163769 ) ) ( not ( = ?auto_163764 ?auto_163770 ) ) ( not ( = ?auto_163764 ?auto_163771 ) ) ( not ( = ?auto_163764 ?auto_163772 ) ) ( not ( = ?auto_163765 ?auto_163766 ) ) ( not ( = ?auto_163765 ?auto_163767 ) ) ( not ( = ?auto_163765 ?auto_163768 ) ) ( not ( = ?auto_163765 ?auto_163769 ) ) ( not ( = ?auto_163765 ?auto_163770 ) ) ( not ( = ?auto_163765 ?auto_163771 ) ) ( not ( = ?auto_163765 ?auto_163772 ) ) ( not ( = ?auto_163766 ?auto_163767 ) ) ( not ( = ?auto_163766 ?auto_163768 ) ) ( not ( = ?auto_163766 ?auto_163769 ) ) ( not ( = ?auto_163766 ?auto_163770 ) ) ( not ( = ?auto_163766 ?auto_163771 ) ) ( not ( = ?auto_163766 ?auto_163772 ) ) ( not ( = ?auto_163767 ?auto_163768 ) ) ( not ( = ?auto_163767 ?auto_163769 ) ) ( not ( = ?auto_163767 ?auto_163770 ) ) ( not ( = ?auto_163767 ?auto_163771 ) ) ( not ( = ?auto_163767 ?auto_163772 ) ) ( not ( = ?auto_163768 ?auto_163769 ) ) ( not ( = ?auto_163768 ?auto_163770 ) ) ( not ( = ?auto_163768 ?auto_163771 ) ) ( not ( = ?auto_163768 ?auto_163772 ) ) ( not ( = ?auto_163769 ?auto_163770 ) ) ( not ( = ?auto_163769 ?auto_163771 ) ) ( not ( = ?auto_163769 ?auto_163772 ) ) ( not ( = ?auto_163770 ?auto_163771 ) ) ( not ( = ?auto_163770 ?auto_163772 ) ) ( not ( = ?auto_163771 ?auto_163772 ) ) ( ON ?auto_163771 ?auto_163772 ) ( ON ?auto_163770 ?auto_163771 ) ( ON ?auto_163769 ?auto_163770 ) ( ON ?auto_163768 ?auto_163769 ) ( ON ?auto_163767 ?auto_163768 ) ( ON ?auto_163766 ?auto_163767 ) ( ON ?auto_163765 ?auto_163766 ) ( CLEAR ?auto_163763 ) ( ON ?auto_163764 ?auto_163765 ) ( CLEAR ?auto_163764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_163761 ?auto_163762 ?auto_163763 ?auto_163764 )
      ( MAKE-12PILE ?auto_163761 ?auto_163762 ?auto_163763 ?auto_163764 ?auto_163765 ?auto_163766 ?auto_163767 ?auto_163768 ?auto_163769 ?auto_163770 ?auto_163771 ?auto_163772 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163785 - BLOCK
      ?auto_163786 - BLOCK
      ?auto_163787 - BLOCK
      ?auto_163788 - BLOCK
      ?auto_163789 - BLOCK
      ?auto_163790 - BLOCK
      ?auto_163791 - BLOCK
      ?auto_163792 - BLOCK
      ?auto_163793 - BLOCK
      ?auto_163794 - BLOCK
      ?auto_163795 - BLOCK
      ?auto_163796 - BLOCK
    )
    :vars
    (
      ?auto_163797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163796 ?auto_163797 ) ( ON-TABLE ?auto_163785 ) ( ON ?auto_163786 ?auto_163785 ) ( not ( = ?auto_163785 ?auto_163786 ) ) ( not ( = ?auto_163785 ?auto_163787 ) ) ( not ( = ?auto_163785 ?auto_163788 ) ) ( not ( = ?auto_163785 ?auto_163789 ) ) ( not ( = ?auto_163785 ?auto_163790 ) ) ( not ( = ?auto_163785 ?auto_163791 ) ) ( not ( = ?auto_163785 ?auto_163792 ) ) ( not ( = ?auto_163785 ?auto_163793 ) ) ( not ( = ?auto_163785 ?auto_163794 ) ) ( not ( = ?auto_163785 ?auto_163795 ) ) ( not ( = ?auto_163785 ?auto_163796 ) ) ( not ( = ?auto_163785 ?auto_163797 ) ) ( not ( = ?auto_163786 ?auto_163787 ) ) ( not ( = ?auto_163786 ?auto_163788 ) ) ( not ( = ?auto_163786 ?auto_163789 ) ) ( not ( = ?auto_163786 ?auto_163790 ) ) ( not ( = ?auto_163786 ?auto_163791 ) ) ( not ( = ?auto_163786 ?auto_163792 ) ) ( not ( = ?auto_163786 ?auto_163793 ) ) ( not ( = ?auto_163786 ?auto_163794 ) ) ( not ( = ?auto_163786 ?auto_163795 ) ) ( not ( = ?auto_163786 ?auto_163796 ) ) ( not ( = ?auto_163786 ?auto_163797 ) ) ( not ( = ?auto_163787 ?auto_163788 ) ) ( not ( = ?auto_163787 ?auto_163789 ) ) ( not ( = ?auto_163787 ?auto_163790 ) ) ( not ( = ?auto_163787 ?auto_163791 ) ) ( not ( = ?auto_163787 ?auto_163792 ) ) ( not ( = ?auto_163787 ?auto_163793 ) ) ( not ( = ?auto_163787 ?auto_163794 ) ) ( not ( = ?auto_163787 ?auto_163795 ) ) ( not ( = ?auto_163787 ?auto_163796 ) ) ( not ( = ?auto_163787 ?auto_163797 ) ) ( not ( = ?auto_163788 ?auto_163789 ) ) ( not ( = ?auto_163788 ?auto_163790 ) ) ( not ( = ?auto_163788 ?auto_163791 ) ) ( not ( = ?auto_163788 ?auto_163792 ) ) ( not ( = ?auto_163788 ?auto_163793 ) ) ( not ( = ?auto_163788 ?auto_163794 ) ) ( not ( = ?auto_163788 ?auto_163795 ) ) ( not ( = ?auto_163788 ?auto_163796 ) ) ( not ( = ?auto_163788 ?auto_163797 ) ) ( not ( = ?auto_163789 ?auto_163790 ) ) ( not ( = ?auto_163789 ?auto_163791 ) ) ( not ( = ?auto_163789 ?auto_163792 ) ) ( not ( = ?auto_163789 ?auto_163793 ) ) ( not ( = ?auto_163789 ?auto_163794 ) ) ( not ( = ?auto_163789 ?auto_163795 ) ) ( not ( = ?auto_163789 ?auto_163796 ) ) ( not ( = ?auto_163789 ?auto_163797 ) ) ( not ( = ?auto_163790 ?auto_163791 ) ) ( not ( = ?auto_163790 ?auto_163792 ) ) ( not ( = ?auto_163790 ?auto_163793 ) ) ( not ( = ?auto_163790 ?auto_163794 ) ) ( not ( = ?auto_163790 ?auto_163795 ) ) ( not ( = ?auto_163790 ?auto_163796 ) ) ( not ( = ?auto_163790 ?auto_163797 ) ) ( not ( = ?auto_163791 ?auto_163792 ) ) ( not ( = ?auto_163791 ?auto_163793 ) ) ( not ( = ?auto_163791 ?auto_163794 ) ) ( not ( = ?auto_163791 ?auto_163795 ) ) ( not ( = ?auto_163791 ?auto_163796 ) ) ( not ( = ?auto_163791 ?auto_163797 ) ) ( not ( = ?auto_163792 ?auto_163793 ) ) ( not ( = ?auto_163792 ?auto_163794 ) ) ( not ( = ?auto_163792 ?auto_163795 ) ) ( not ( = ?auto_163792 ?auto_163796 ) ) ( not ( = ?auto_163792 ?auto_163797 ) ) ( not ( = ?auto_163793 ?auto_163794 ) ) ( not ( = ?auto_163793 ?auto_163795 ) ) ( not ( = ?auto_163793 ?auto_163796 ) ) ( not ( = ?auto_163793 ?auto_163797 ) ) ( not ( = ?auto_163794 ?auto_163795 ) ) ( not ( = ?auto_163794 ?auto_163796 ) ) ( not ( = ?auto_163794 ?auto_163797 ) ) ( not ( = ?auto_163795 ?auto_163796 ) ) ( not ( = ?auto_163795 ?auto_163797 ) ) ( not ( = ?auto_163796 ?auto_163797 ) ) ( ON ?auto_163795 ?auto_163796 ) ( ON ?auto_163794 ?auto_163795 ) ( ON ?auto_163793 ?auto_163794 ) ( ON ?auto_163792 ?auto_163793 ) ( ON ?auto_163791 ?auto_163792 ) ( ON ?auto_163790 ?auto_163791 ) ( ON ?auto_163789 ?auto_163790 ) ( ON ?auto_163788 ?auto_163789 ) ( CLEAR ?auto_163786 ) ( ON ?auto_163787 ?auto_163788 ) ( CLEAR ?auto_163787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163785 ?auto_163786 ?auto_163787 )
      ( MAKE-12PILE ?auto_163785 ?auto_163786 ?auto_163787 ?auto_163788 ?auto_163789 ?auto_163790 ?auto_163791 ?auto_163792 ?auto_163793 ?auto_163794 ?auto_163795 ?auto_163796 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163810 - BLOCK
      ?auto_163811 - BLOCK
      ?auto_163812 - BLOCK
      ?auto_163813 - BLOCK
      ?auto_163814 - BLOCK
      ?auto_163815 - BLOCK
      ?auto_163816 - BLOCK
      ?auto_163817 - BLOCK
      ?auto_163818 - BLOCK
      ?auto_163819 - BLOCK
      ?auto_163820 - BLOCK
      ?auto_163821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163821 ) ( ON-TABLE ?auto_163810 ) ( ON ?auto_163811 ?auto_163810 ) ( not ( = ?auto_163810 ?auto_163811 ) ) ( not ( = ?auto_163810 ?auto_163812 ) ) ( not ( = ?auto_163810 ?auto_163813 ) ) ( not ( = ?auto_163810 ?auto_163814 ) ) ( not ( = ?auto_163810 ?auto_163815 ) ) ( not ( = ?auto_163810 ?auto_163816 ) ) ( not ( = ?auto_163810 ?auto_163817 ) ) ( not ( = ?auto_163810 ?auto_163818 ) ) ( not ( = ?auto_163810 ?auto_163819 ) ) ( not ( = ?auto_163810 ?auto_163820 ) ) ( not ( = ?auto_163810 ?auto_163821 ) ) ( not ( = ?auto_163811 ?auto_163812 ) ) ( not ( = ?auto_163811 ?auto_163813 ) ) ( not ( = ?auto_163811 ?auto_163814 ) ) ( not ( = ?auto_163811 ?auto_163815 ) ) ( not ( = ?auto_163811 ?auto_163816 ) ) ( not ( = ?auto_163811 ?auto_163817 ) ) ( not ( = ?auto_163811 ?auto_163818 ) ) ( not ( = ?auto_163811 ?auto_163819 ) ) ( not ( = ?auto_163811 ?auto_163820 ) ) ( not ( = ?auto_163811 ?auto_163821 ) ) ( not ( = ?auto_163812 ?auto_163813 ) ) ( not ( = ?auto_163812 ?auto_163814 ) ) ( not ( = ?auto_163812 ?auto_163815 ) ) ( not ( = ?auto_163812 ?auto_163816 ) ) ( not ( = ?auto_163812 ?auto_163817 ) ) ( not ( = ?auto_163812 ?auto_163818 ) ) ( not ( = ?auto_163812 ?auto_163819 ) ) ( not ( = ?auto_163812 ?auto_163820 ) ) ( not ( = ?auto_163812 ?auto_163821 ) ) ( not ( = ?auto_163813 ?auto_163814 ) ) ( not ( = ?auto_163813 ?auto_163815 ) ) ( not ( = ?auto_163813 ?auto_163816 ) ) ( not ( = ?auto_163813 ?auto_163817 ) ) ( not ( = ?auto_163813 ?auto_163818 ) ) ( not ( = ?auto_163813 ?auto_163819 ) ) ( not ( = ?auto_163813 ?auto_163820 ) ) ( not ( = ?auto_163813 ?auto_163821 ) ) ( not ( = ?auto_163814 ?auto_163815 ) ) ( not ( = ?auto_163814 ?auto_163816 ) ) ( not ( = ?auto_163814 ?auto_163817 ) ) ( not ( = ?auto_163814 ?auto_163818 ) ) ( not ( = ?auto_163814 ?auto_163819 ) ) ( not ( = ?auto_163814 ?auto_163820 ) ) ( not ( = ?auto_163814 ?auto_163821 ) ) ( not ( = ?auto_163815 ?auto_163816 ) ) ( not ( = ?auto_163815 ?auto_163817 ) ) ( not ( = ?auto_163815 ?auto_163818 ) ) ( not ( = ?auto_163815 ?auto_163819 ) ) ( not ( = ?auto_163815 ?auto_163820 ) ) ( not ( = ?auto_163815 ?auto_163821 ) ) ( not ( = ?auto_163816 ?auto_163817 ) ) ( not ( = ?auto_163816 ?auto_163818 ) ) ( not ( = ?auto_163816 ?auto_163819 ) ) ( not ( = ?auto_163816 ?auto_163820 ) ) ( not ( = ?auto_163816 ?auto_163821 ) ) ( not ( = ?auto_163817 ?auto_163818 ) ) ( not ( = ?auto_163817 ?auto_163819 ) ) ( not ( = ?auto_163817 ?auto_163820 ) ) ( not ( = ?auto_163817 ?auto_163821 ) ) ( not ( = ?auto_163818 ?auto_163819 ) ) ( not ( = ?auto_163818 ?auto_163820 ) ) ( not ( = ?auto_163818 ?auto_163821 ) ) ( not ( = ?auto_163819 ?auto_163820 ) ) ( not ( = ?auto_163819 ?auto_163821 ) ) ( not ( = ?auto_163820 ?auto_163821 ) ) ( ON ?auto_163820 ?auto_163821 ) ( ON ?auto_163819 ?auto_163820 ) ( ON ?auto_163818 ?auto_163819 ) ( ON ?auto_163817 ?auto_163818 ) ( ON ?auto_163816 ?auto_163817 ) ( ON ?auto_163815 ?auto_163816 ) ( ON ?auto_163814 ?auto_163815 ) ( ON ?auto_163813 ?auto_163814 ) ( CLEAR ?auto_163811 ) ( ON ?auto_163812 ?auto_163813 ) ( CLEAR ?auto_163812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_163810 ?auto_163811 ?auto_163812 )
      ( MAKE-12PILE ?auto_163810 ?auto_163811 ?auto_163812 ?auto_163813 ?auto_163814 ?auto_163815 ?auto_163816 ?auto_163817 ?auto_163818 ?auto_163819 ?auto_163820 ?auto_163821 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163834 - BLOCK
      ?auto_163835 - BLOCK
      ?auto_163836 - BLOCK
      ?auto_163837 - BLOCK
      ?auto_163838 - BLOCK
      ?auto_163839 - BLOCK
      ?auto_163840 - BLOCK
      ?auto_163841 - BLOCK
      ?auto_163842 - BLOCK
      ?auto_163843 - BLOCK
      ?auto_163844 - BLOCK
      ?auto_163845 - BLOCK
    )
    :vars
    (
      ?auto_163846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163845 ?auto_163846 ) ( ON-TABLE ?auto_163834 ) ( not ( = ?auto_163834 ?auto_163835 ) ) ( not ( = ?auto_163834 ?auto_163836 ) ) ( not ( = ?auto_163834 ?auto_163837 ) ) ( not ( = ?auto_163834 ?auto_163838 ) ) ( not ( = ?auto_163834 ?auto_163839 ) ) ( not ( = ?auto_163834 ?auto_163840 ) ) ( not ( = ?auto_163834 ?auto_163841 ) ) ( not ( = ?auto_163834 ?auto_163842 ) ) ( not ( = ?auto_163834 ?auto_163843 ) ) ( not ( = ?auto_163834 ?auto_163844 ) ) ( not ( = ?auto_163834 ?auto_163845 ) ) ( not ( = ?auto_163834 ?auto_163846 ) ) ( not ( = ?auto_163835 ?auto_163836 ) ) ( not ( = ?auto_163835 ?auto_163837 ) ) ( not ( = ?auto_163835 ?auto_163838 ) ) ( not ( = ?auto_163835 ?auto_163839 ) ) ( not ( = ?auto_163835 ?auto_163840 ) ) ( not ( = ?auto_163835 ?auto_163841 ) ) ( not ( = ?auto_163835 ?auto_163842 ) ) ( not ( = ?auto_163835 ?auto_163843 ) ) ( not ( = ?auto_163835 ?auto_163844 ) ) ( not ( = ?auto_163835 ?auto_163845 ) ) ( not ( = ?auto_163835 ?auto_163846 ) ) ( not ( = ?auto_163836 ?auto_163837 ) ) ( not ( = ?auto_163836 ?auto_163838 ) ) ( not ( = ?auto_163836 ?auto_163839 ) ) ( not ( = ?auto_163836 ?auto_163840 ) ) ( not ( = ?auto_163836 ?auto_163841 ) ) ( not ( = ?auto_163836 ?auto_163842 ) ) ( not ( = ?auto_163836 ?auto_163843 ) ) ( not ( = ?auto_163836 ?auto_163844 ) ) ( not ( = ?auto_163836 ?auto_163845 ) ) ( not ( = ?auto_163836 ?auto_163846 ) ) ( not ( = ?auto_163837 ?auto_163838 ) ) ( not ( = ?auto_163837 ?auto_163839 ) ) ( not ( = ?auto_163837 ?auto_163840 ) ) ( not ( = ?auto_163837 ?auto_163841 ) ) ( not ( = ?auto_163837 ?auto_163842 ) ) ( not ( = ?auto_163837 ?auto_163843 ) ) ( not ( = ?auto_163837 ?auto_163844 ) ) ( not ( = ?auto_163837 ?auto_163845 ) ) ( not ( = ?auto_163837 ?auto_163846 ) ) ( not ( = ?auto_163838 ?auto_163839 ) ) ( not ( = ?auto_163838 ?auto_163840 ) ) ( not ( = ?auto_163838 ?auto_163841 ) ) ( not ( = ?auto_163838 ?auto_163842 ) ) ( not ( = ?auto_163838 ?auto_163843 ) ) ( not ( = ?auto_163838 ?auto_163844 ) ) ( not ( = ?auto_163838 ?auto_163845 ) ) ( not ( = ?auto_163838 ?auto_163846 ) ) ( not ( = ?auto_163839 ?auto_163840 ) ) ( not ( = ?auto_163839 ?auto_163841 ) ) ( not ( = ?auto_163839 ?auto_163842 ) ) ( not ( = ?auto_163839 ?auto_163843 ) ) ( not ( = ?auto_163839 ?auto_163844 ) ) ( not ( = ?auto_163839 ?auto_163845 ) ) ( not ( = ?auto_163839 ?auto_163846 ) ) ( not ( = ?auto_163840 ?auto_163841 ) ) ( not ( = ?auto_163840 ?auto_163842 ) ) ( not ( = ?auto_163840 ?auto_163843 ) ) ( not ( = ?auto_163840 ?auto_163844 ) ) ( not ( = ?auto_163840 ?auto_163845 ) ) ( not ( = ?auto_163840 ?auto_163846 ) ) ( not ( = ?auto_163841 ?auto_163842 ) ) ( not ( = ?auto_163841 ?auto_163843 ) ) ( not ( = ?auto_163841 ?auto_163844 ) ) ( not ( = ?auto_163841 ?auto_163845 ) ) ( not ( = ?auto_163841 ?auto_163846 ) ) ( not ( = ?auto_163842 ?auto_163843 ) ) ( not ( = ?auto_163842 ?auto_163844 ) ) ( not ( = ?auto_163842 ?auto_163845 ) ) ( not ( = ?auto_163842 ?auto_163846 ) ) ( not ( = ?auto_163843 ?auto_163844 ) ) ( not ( = ?auto_163843 ?auto_163845 ) ) ( not ( = ?auto_163843 ?auto_163846 ) ) ( not ( = ?auto_163844 ?auto_163845 ) ) ( not ( = ?auto_163844 ?auto_163846 ) ) ( not ( = ?auto_163845 ?auto_163846 ) ) ( ON ?auto_163844 ?auto_163845 ) ( ON ?auto_163843 ?auto_163844 ) ( ON ?auto_163842 ?auto_163843 ) ( ON ?auto_163841 ?auto_163842 ) ( ON ?auto_163840 ?auto_163841 ) ( ON ?auto_163839 ?auto_163840 ) ( ON ?auto_163838 ?auto_163839 ) ( ON ?auto_163837 ?auto_163838 ) ( ON ?auto_163836 ?auto_163837 ) ( CLEAR ?auto_163834 ) ( ON ?auto_163835 ?auto_163836 ) ( CLEAR ?auto_163835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163834 ?auto_163835 )
      ( MAKE-12PILE ?auto_163834 ?auto_163835 ?auto_163836 ?auto_163837 ?auto_163838 ?auto_163839 ?auto_163840 ?auto_163841 ?auto_163842 ?auto_163843 ?auto_163844 ?auto_163845 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163859 - BLOCK
      ?auto_163860 - BLOCK
      ?auto_163861 - BLOCK
      ?auto_163862 - BLOCK
      ?auto_163863 - BLOCK
      ?auto_163864 - BLOCK
      ?auto_163865 - BLOCK
      ?auto_163866 - BLOCK
      ?auto_163867 - BLOCK
      ?auto_163868 - BLOCK
      ?auto_163869 - BLOCK
      ?auto_163870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163870 ) ( ON-TABLE ?auto_163859 ) ( not ( = ?auto_163859 ?auto_163860 ) ) ( not ( = ?auto_163859 ?auto_163861 ) ) ( not ( = ?auto_163859 ?auto_163862 ) ) ( not ( = ?auto_163859 ?auto_163863 ) ) ( not ( = ?auto_163859 ?auto_163864 ) ) ( not ( = ?auto_163859 ?auto_163865 ) ) ( not ( = ?auto_163859 ?auto_163866 ) ) ( not ( = ?auto_163859 ?auto_163867 ) ) ( not ( = ?auto_163859 ?auto_163868 ) ) ( not ( = ?auto_163859 ?auto_163869 ) ) ( not ( = ?auto_163859 ?auto_163870 ) ) ( not ( = ?auto_163860 ?auto_163861 ) ) ( not ( = ?auto_163860 ?auto_163862 ) ) ( not ( = ?auto_163860 ?auto_163863 ) ) ( not ( = ?auto_163860 ?auto_163864 ) ) ( not ( = ?auto_163860 ?auto_163865 ) ) ( not ( = ?auto_163860 ?auto_163866 ) ) ( not ( = ?auto_163860 ?auto_163867 ) ) ( not ( = ?auto_163860 ?auto_163868 ) ) ( not ( = ?auto_163860 ?auto_163869 ) ) ( not ( = ?auto_163860 ?auto_163870 ) ) ( not ( = ?auto_163861 ?auto_163862 ) ) ( not ( = ?auto_163861 ?auto_163863 ) ) ( not ( = ?auto_163861 ?auto_163864 ) ) ( not ( = ?auto_163861 ?auto_163865 ) ) ( not ( = ?auto_163861 ?auto_163866 ) ) ( not ( = ?auto_163861 ?auto_163867 ) ) ( not ( = ?auto_163861 ?auto_163868 ) ) ( not ( = ?auto_163861 ?auto_163869 ) ) ( not ( = ?auto_163861 ?auto_163870 ) ) ( not ( = ?auto_163862 ?auto_163863 ) ) ( not ( = ?auto_163862 ?auto_163864 ) ) ( not ( = ?auto_163862 ?auto_163865 ) ) ( not ( = ?auto_163862 ?auto_163866 ) ) ( not ( = ?auto_163862 ?auto_163867 ) ) ( not ( = ?auto_163862 ?auto_163868 ) ) ( not ( = ?auto_163862 ?auto_163869 ) ) ( not ( = ?auto_163862 ?auto_163870 ) ) ( not ( = ?auto_163863 ?auto_163864 ) ) ( not ( = ?auto_163863 ?auto_163865 ) ) ( not ( = ?auto_163863 ?auto_163866 ) ) ( not ( = ?auto_163863 ?auto_163867 ) ) ( not ( = ?auto_163863 ?auto_163868 ) ) ( not ( = ?auto_163863 ?auto_163869 ) ) ( not ( = ?auto_163863 ?auto_163870 ) ) ( not ( = ?auto_163864 ?auto_163865 ) ) ( not ( = ?auto_163864 ?auto_163866 ) ) ( not ( = ?auto_163864 ?auto_163867 ) ) ( not ( = ?auto_163864 ?auto_163868 ) ) ( not ( = ?auto_163864 ?auto_163869 ) ) ( not ( = ?auto_163864 ?auto_163870 ) ) ( not ( = ?auto_163865 ?auto_163866 ) ) ( not ( = ?auto_163865 ?auto_163867 ) ) ( not ( = ?auto_163865 ?auto_163868 ) ) ( not ( = ?auto_163865 ?auto_163869 ) ) ( not ( = ?auto_163865 ?auto_163870 ) ) ( not ( = ?auto_163866 ?auto_163867 ) ) ( not ( = ?auto_163866 ?auto_163868 ) ) ( not ( = ?auto_163866 ?auto_163869 ) ) ( not ( = ?auto_163866 ?auto_163870 ) ) ( not ( = ?auto_163867 ?auto_163868 ) ) ( not ( = ?auto_163867 ?auto_163869 ) ) ( not ( = ?auto_163867 ?auto_163870 ) ) ( not ( = ?auto_163868 ?auto_163869 ) ) ( not ( = ?auto_163868 ?auto_163870 ) ) ( not ( = ?auto_163869 ?auto_163870 ) ) ( ON ?auto_163869 ?auto_163870 ) ( ON ?auto_163868 ?auto_163869 ) ( ON ?auto_163867 ?auto_163868 ) ( ON ?auto_163866 ?auto_163867 ) ( ON ?auto_163865 ?auto_163866 ) ( ON ?auto_163864 ?auto_163865 ) ( ON ?auto_163863 ?auto_163864 ) ( ON ?auto_163862 ?auto_163863 ) ( ON ?auto_163861 ?auto_163862 ) ( CLEAR ?auto_163859 ) ( ON ?auto_163860 ?auto_163861 ) ( CLEAR ?auto_163860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_163859 ?auto_163860 )
      ( MAKE-12PILE ?auto_163859 ?auto_163860 ?auto_163861 ?auto_163862 ?auto_163863 ?auto_163864 ?auto_163865 ?auto_163866 ?auto_163867 ?auto_163868 ?auto_163869 ?auto_163870 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163883 - BLOCK
      ?auto_163884 - BLOCK
      ?auto_163885 - BLOCK
      ?auto_163886 - BLOCK
      ?auto_163887 - BLOCK
      ?auto_163888 - BLOCK
      ?auto_163889 - BLOCK
      ?auto_163890 - BLOCK
      ?auto_163891 - BLOCK
      ?auto_163892 - BLOCK
      ?auto_163893 - BLOCK
      ?auto_163894 - BLOCK
    )
    :vars
    (
      ?auto_163895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_163894 ?auto_163895 ) ( not ( = ?auto_163883 ?auto_163884 ) ) ( not ( = ?auto_163883 ?auto_163885 ) ) ( not ( = ?auto_163883 ?auto_163886 ) ) ( not ( = ?auto_163883 ?auto_163887 ) ) ( not ( = ?auto_163883 ?auto_163888 ) ) ( not ( = ?auto_163883 ?auto_163889 ) ) ( not ( = ?auto_163883 ?auto_163890 ) ) ( not ( = ?auto_163883 ?auto_163891 ) ) ( not ( = ?auto_163883 ?auto_163892 ) ) ( not ( = ?auto_163883 ?auto_163893 ) ) ( not ( = ?auto_163883 ?auto_163894 ) ) ( not ( = ?auto_163883 ?auto_163895 ) ) ( not ( = ?auto_163884 ?auto_163885 ) ) ( not ( = ?auto_163884 ?auto_163886 ) ) ( not ( = ?auto_163884 ?auto_163887 ) ) ( not ( = ?auto_163884 ?auto_163888 ) ) ( not ( = ?auto_163884 ?auto_163889 ) ) ( not ( = ?auto_163884 ?auto_163890 ) ) ( not ( = ?auto_163884 ?auto_163891 ) ) ( not ( = ?auto_163884 ?auto_163892 ) ) ( not ( = ?auto_163884 ?auto_163893 ) ) ( not ( = ?auto_163884 ?auto_163894 ) ) ( not ( = ?auto_163884 ?auto_163895 ) ) ( not ( = ?auto_163885 ?auto_163886 ) ) ( not ( = ?auto_163885 ?auto_163887 ) ) ( not ( = ?auto_163885 ?auto_163888 ) ) ( not ( = ?auto_163885 ?auto_163889 ) ) ( not ( = ?auto_163885 ?auto_163890 ) ) ( not ( = ?auto_163885 ?auto_163891 ) ) ( not ( = ?auto_163885 ?auto_163892 ) ) ( not ( = ?auto_163885 ?auto_163893 ) ) ( not ( = ?auto_163885 ?auto_163894 ) ) ( not ( = ?auto_163885 ?auto_163895 ) ) ( not ( = ?auto_163886 ?auto_163887 ) ) ( not ( = ?auto_163886 ?auto_163888 ) ) ( not ( = ?auto_163886 ?auto_163889 ) ) ( not ( = ?auto_163886 ?auto_163890 ) ) ( not ( = ?auto_163886 ?auto_163891 ) ) ( not ( = ?auto_163886 ?auto_163892 ) ) ( not ( = ?auto_163886 ?auto_163893 ) ) ( not ( = ?auto_163886 ?auto_163894 ) ) ( not ( = ?auto_163886 ?auto_163895 ) ) ( not ( = ?auto_163887 ?auto_163888 ) ) ( not ( = ?auto_163887 ?auto_163889 ) ) ( not ( = ?auto_163887 ?auto_163890 ) ) ( not ( = ?auto_163887 ?auto_163891 ) ) ( not ( = ?auto_163887 ?auto_163892 ) ) ( not ( = ?auto_163887 ?auto_163893 ) ) ( not ( = ?auto_163887 ?auto_163894 ) ) ( not ( = ?auto_163887 ?auto_163895 ) ) ( not ( = ?auto_163888 ?auto_163889 ) ) ( not ( = ?auto_163888 ?auto_163890 ) ) ( not ( = ?auto_163888 ?auto_163891 ) ) ( not ( = ?auto_163888 ?auto_163892 ) ) ( not ( = ?auto_163888 ?auto_163893 ) ) ( not ( = ?auto_163888 ?auto_163894 ) ) ( not ( = ?auto_163888 ?auto_163895 ) ) ( not ( = ?auto_163889 ?auto_163890 ) ) ( not ( = ?auto_163889 ?auto_163891 ) ) ( not ( = ?auto_163889 ?auto_163892 ) ) ( not ( = ?auto_163889 ?auto_163893 ) ) ( not ( = ?auto_163889 ?auto_163894 ) ) ( not ( = ?auto_163889 ?auto_163895 ) ) ( not ( = ?auto_163890 ?auto_163891 ) ) ( not ( = ?auto_163890 ?auto_163892 ) ) ( not ( = ?auto_163890 ?auto_163893 ) ) ( not ( = ?auto_163890 ?auto_163894 ) ) ( not ( = ?auto_163890 ?auto_163895 ) ) ( not ( = ?auto_163891 ?auto_163892 ) ) ( not ( = ?auto_163891 ?auto_163893 ) ) ( not ( = ?auto_163891 ?auto_163894 ) ) ( not ( = ?auto_163891 ?auto_163895 ) ) ( not ( = ?auto_163892 ?auto_163893 ) ) ( not ( = ?auto_163892 ?auto_163894 ) ) ( not ( = ?auto_163892 ?auto_163895 ) ) ( not ( = ?auto_163893 ?auto_163894 ) ) ( not ( = ?auto_163893 ?auto_163895 ) ) ( not ( = ?auto_163894 ?auto_163895 ) ) ( ON ?auto_163893 ?auto_163894 ) ( ON ?auto_163892 ?auto_163893 ) ( ON ?auto_163891 ?auto_163892 ) ( ON ?auto_163890 ?auto_163891 ) ( ON ?auto_163889 ?auto_163890 ) ( ON ?auto_163888 ?auto_163889 ) ( ON ?auto_163887 ?auto_163888 ) ( ON ?auto_163886 ?auto_163887 ) ( ON ?auto_163885 ?auto_163886 ) ( ON ?auto_163884 ?auto_163885 ) ( ON ?auto_163883 ?auto_163884 ) ( CLEAR ?auto_163883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163883 )
      ( MAKE-12PILE ?auto_163883 ?auto_163884 ?auto_163885 ?auto_163886 ?auto_163887 ?auto_163888 ?auto_163889 ?auto_163890 ?auto_163891 ?auto_163892 ?auto_163893 ?auto_163894 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163908 - BLOCK
      ?auto_163909 - BLOCK
      ?auto_163910 - BLOCK
      ?auto_163911 - BLOCK
      ?auto_163912 - BLOCK
      ?auto_163913 - BLOCK
      ?auto_163914 - BLOCK
      ?auto_163915 - BLOCK
      ?auto_163916 - BLOCK
      ?auto_163917 - BLOCK
      ?auto_163918 - BLOCK
      ?auto_163919 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_163919 ) ( not ( = ?auto_163908 ?auto_163909 ) ) ( not ( = ?auto_163908 ?auto_163910 ) ) ( not ( = ?auto_163908 ?auto_163911 ) ) ( not ( = ?auto_163908 ?auto_163912 ) ) ( not ( = ?auto_163908 ?auto_163913 ) ) ( not ( = ?auto_163908 ?auto_163914 ) ) ( not ( = ?auto_163908 ?auto_163915 ) ) ( not ( = ?auto_163908 ?auto_163916 ) ) ( not ( = ?auto_163908 ?auto_163917 ) ) ( not ( = ?auto_163908 ?auto_163918 ) ) ( not ( = ?auto_163908 ?auto_163919 ) ) ( not ( = ?auto_163909 ?auto_163910 ) ) ( not ( = ?auto_163909 ?auto_163911 ) ) ( not ( = ?auto_163909 ?auto_163912 ) ) ( not ( = ?auto_163909 ?auto_163913 ) ) ( not ( = ?auto_163909 ?auto_163914 ) ) ( not ( = ?auto_163909 ?auto_163915 ) ) ( not ( = ?auto_163909 ?auto_163916 ) ) ( not ( = ?auto_163909 ?auto_163917 ) ) ( not ( = ?auto_163909 ?auto_163918 ) ) ( not ( = ?auto_163909 ?auto_163919 ) ) ( not ( = ?auto_163910 ?auto_163911 ) ) ( not ( = ?auto_163910 ?auto_163912 ) ) ( not ( = ?auto_163910 ?auto_163913 ) ) ( not ( = ?auto_163910 ?auto_163914 ) ) ( not ( = ?auto_163910 ?auto_163915 ) ) ( not ( = ?auto_163910 ?auto_163916 ) ) ( not ( = ?auto_163910 ?auto_163917 ) ) ( not ( = ?auto_163910 ?auto_163918 ) ) ( not ( = ?auto_163910 ?auto_163919 ) ) ( not ( = ?auto_163911 ?auto_163912 ) ) ( not ( = ?auto_163911 ?auto_163913 ) ) ( not ( = ?auto_163911 ?auto_163914 ) ) ( not ( = ?auto_163911 ?auto_163915 ) ) ( not ( = ?auto_163911 ?auto_163916 ) ) ( not ( = ?auto_163911 ?auto_163917 ) ) ( not ( = ?auto_163911 ?auto_163918 ) ) ( not ( = ?auto_163911 ?auto_163919 ) ) ( not ( = ?auto_163912 ?auto_163913 ) ) ( not ( = ?auto_163912 ?auto_163914 ) ) ( not ( = ?auto_163912 ?auto_163915 ) ) ( not ( = ?auto_163912 ?auto_163916 ) ) ( not ( = ?auto_163912 ?auto_163917 ) ) ( not ( = ?auto_163912 ?auto_163918 ) ) ( not ( = ?auto_163912 ?auto_163919 ) ) ( not ( = ?auto_163913 ?auto_163914 ) ) ( not ( = ?auto_163913 ?auto_163915 ) ) ( not ( = ?auto_163913 ?auto_163916 ) ) ( not ( = ?auto_163913 ?auto_163917 ) ) ( not ( = ?auto_163913 ?auto_163918 ) ) ( not ( = ?auto_163913 ?auto_163919 ) ) ( not ( = ?auto_163914 ?auto_163915 ) ) ( not ( = ?auto_163914 ?auto_163916 ) ) ( not ( = ?auto_163914 ?auto_163917 ) ) ( not ( = ?auto_163914 ?auto_163918 ) ) ( not ( = ?auto_163914 ?auto_163919 ) ) ( not ( = ?auto_163915 ?auto_163916 ) ) ( not ( = ?auto_163915 ?auto_163917 ) ) ( not ( = ?auto_163915 ?auto_163918 ) ) ( not ( = ?auto_163915 ?auto_163919 ) ) ( not ( = ?auto_163916 ?auto_163917 ) ) ( not ( = ?auto_163916 ?auto_163918 ) ) ( not ( = ?auto_163916 ?auto_163919 ) ) ( not ( = ?auto_163917 ?auto_163918 ) ) ( not ( = ?auto_163917 ?auto_163919 ) ) ( not ( = ?auto_163918 ?auto_163919 ) ) ( ON ?auto_163918 ?auto_163919 ) ( ON ?auto_163917 ?auto_163918 ) ( ON ?auto_163916 ?auto_163917 ) ( ON ?auto_163915 ?auto_163916 ) ( ON ?auto_163914 ?auto_163915 ) ( ON ?auto_163913 ?auto_163914 ) ( ON ?auto_163912 ?auto_163913 ) ( ON ?auto_163911 ?auto_163912 ) ( ON ?auto_163910 ?auto_163911 ) ( ON ?auto_163909 ?auto_163910 ) ( ON ?auto_163908 ?auto_163909 ) ( CLEAR ?auto_163908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_163908 )
      ( MAKE-12PILE ?auto_163908 ?auto_163909 ?auto_163910 ?auto_163911 ?auto_163912 ?auto_163913 ?auto_163914 ?auto_163915 ?auto_163916 ?auto_163917 ?auto_163918 ?auto_163919 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_163932 - BLOCK
      ?auto_163933 - BLOCK
      ?auto_163934 - BLOCK
      ?auto_163935 - BLOCK
      ?auto_163936 - BLOCK
      ?auto_163937 - BLOCK
      ?auto_163938 - BLOCK
      ?auto_163939 - BLOCK
      ?auto_163940 - BLOCK
      ?auto_163941 - BLOCK
      ?auto_163942 - BLOCK
      ?auto_163943 - BLOCK
    )
    :vars
    (
      ?auto_163944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_163932 ?auto_163933 ) ) ( not ( = ?auto_163932 ?auto_163934 ) ) ( not ( = ?auto_163932 ?auto_163935 ) ) ( not ( = ?auto_163932 ?auto_163936 ) ) ( not ( = ?auto_163932 ?auto_163937 ) ) ( not ( = ?auto_163932 ?auto_163938 ) ) ( not ( = ?auto_163932 ?auto_163939 ) ) ( not ( = ?auto_163932 ?auto_163940 ) ) ( not ( = ?auto_163932 ?auto_163941 ) ) ( not ( = ?auto_163932 ?auto_163942 ) ) ( not ( = ?auto_163932 ?auto_163943 ) ) ( not ( = ?auto_163933 ?auto_163934 ) ) ( not ( = ?auto_163933 ?auto_163935 ) ) ( not ( = ?auto_163933 ?auto_163936 ) ) ( not ( = ?auto_163933 ?auto_163937 ) ) ( not ( = ?auto_163933 ?auto_163938 ) ) ( not ( = ?auto_163933 ?auto_163939 ) ) ( not ( = ?auto_163933 ?auto_163940 ) ) ( not ( = ?auto_163933 ?auto_163941 ) ) ( not ( = ?auto_163933 ?auto_163942 ) ) ( not ( = ?auto_163933 ?auto_163943 ) ) ( not ( = ?auto_163934 ?auto_163935 ) ) ( not ( = ?auto_163934 ?auto_163936 ) ) ( not ( = ?auto_163934 ?auto_163937 ) ) ( not ( = ?auto_163934 ?auto_163938 ) ) ( not ( = ?auto_163934 ?auto_163939 ) ) ( not ( = ?auto_163934 ?auto_163940 ) ) ( not ( = ?auto_163934 ?auto_163941 ) ) ( not ( = ?auto_163934 ?auto_163942 ) ) ( not ( = ?auto_163934 ?auto_163943 ) ) ( not ( = ?auto_163935 ?auto_163936 ) ) ( not ( = ?auto_163935 ?auto_163937 ) ) ( not ( = ?auto_163935 ?auto_163938 ) ) ( not ( = ?auto_163935 ?auto_163939 ) ) ( not ( = ?auto_163935 ?auto_163940 ) ) ( not ( = ?auto_163935 ?auto_163941 ) ) ( not ( = ?auto_163935 ?auto_163942 ) ) ( not ( = ?auto_163935 ?auto_163943 ) ) ( not ( = ?auto_163936 ?auto_163937 ) ) ( not ( = ?auto_163936 ?auto_163938 ) ) ( not ( = ?auto_163936 ?auto_163939 ) ) ( not ( = ?auto_163936 ?auto_163940 ) ) ( not ( = ?auto_163936 ?auto_163941 ) ) ( not ( = ?auto_163936 ?auto_163942 ) ) ( not ( = ?auto_163936 ?auto_163943 ) ) ( not ( = ?auto_163937 ?auto_163938 ) ) ( not ( = ?auto_163937 ?auto_163939 ) ) ( not ( = ?auto_163937 ?auto_163940 ) ) ( not ( = ?auto_163937 ?auto_163941 ) ) ( not ( = ?auto_163937 ?auto_163942 ) ) ( not ( = ?auto_163937 ?auto_163943 ) ) ( not ( = ?auto_163938 ?auto_163939 ) ) ( not ( = ?auto_163938 ?auto_163940 ) ) ( not ( = ?auto_163938 ?auto_163941 ) ) ( not ( = ?auto_163938 ?auto_163942 ) ) ( not ( = ?auto_163938 ?auto_163943 ) ) ( not ( = ?auto_163939 ?auto_163940 ) ) ( not ( = ?auto_163939 ?auto_163941 ) ) ( not ( = ?auto_163939 ?auto_163942 ) ) ( not ( = ?auto_163939 ?auto_163943 ) ) ( not ( = ?auto_163940 ?auto_163941 ) ) ( not ( = ?auto_163940 ?auto_163942 ) ) ( not ( = ?auto_163940 ?auto_163943 ) ) ( not ( = ?auto_163941 ?auto_163942 ) ) ( not ( = ?auto_163941 ?auto_163943 ) ) ( not ( = ?auto_163942 ?auto_163943 ) ) ( ON ?auto_163932 ?auto_163944 ) ( not ( = ?auto_163943 ?auto_163944 ) ) ( not ( = ?auto_163942 ?auto_163944 ) ) ( not ( = ?auto_163941 ?auto_163944 ) ) ( not ( = ?auto_163940 ?auto_163944 ) ) ( not ( = ?auto_163939 ?auto_163944 ) ) ( not ( = ?auto_163938 ?auto_163944 ) ) ( not ( = ?auto_163937 ?auto_163944 ) ) ( not ( = ?auto_163936 ?auto_163944 ) ) ( not ( = ?auto_163935 ?auto_163944 ) ) ( not ( = ?auto_163934 ?auto_163944 ) ) ( not ( = ?auto_163933 ?auto_163944 ) ) ( not ( = ?auto_163932 ?auto_163944 ) ) ( ON ?auto_163933 ?auto_163932 ) ( ON ?auto_163934 ?auto_163933 ) ( ON ?auto_163935 ?auto_163934 ) ( ON ?auto_163936 ?auto_163935 ) ( ON ?auto_163937 ?auto_163936 ) ( ON ?auto_163938 ?auto_163937 ) ( ON ?auto_163939 ?auto_163938 ) ( ON ?auto_163940 ?auto_163939 ) ( ON ?auto_163941 ?auto_163940 ) ( ON ?auto_163942 ?auto_163941 ) ( ON ?auto_163943 ?auto_163942 ) ( CLEAR ?auto_163943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_163943 ?auto_163942 ?auto_163941 ?auto_163940 ?auto_163939 ?auto_163938 ?auto_163937 ?auto_163936 ?auto_163935 ?auto_163934 ?auto_163933 ?auto_163932 )
      ( MAKE-12PILE ?auto_163932 ?auto_163933 ?auto_163934 ?auto_163935 ?auto_163936 ?auto_163937 ?auto_163938 ?auto_163939 ?auto_163940 ?auto_163941 ?auto_163942 ?auto_163943 ) )
  )

)

