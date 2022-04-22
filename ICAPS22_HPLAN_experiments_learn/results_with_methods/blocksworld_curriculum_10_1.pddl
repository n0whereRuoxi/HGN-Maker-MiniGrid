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
      ?auto_75182 - BLOCK
    )
    :vars
    (
      ?auto_75183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75182 ?auto_75183 ) ( CLEAR ?auto_75182 ) ( HAND-EMPTY ) ( not ( = ?auto_75182 ?auto_75183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75182 ?auto_75183 )
      ( !PUTDOWN ?auto_75182 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75185 - BLOCK
    )
    :vars
    (
      ?auto_75186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75185 ?auto_75186 ) ( CLEAR ?auto_75185 ) ( HAND-EMPTY ) ( not ( = ?auto_75185 ?auto_75186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75185 ?auto_75186 )
      ( !PUTDOWN ?auto_75185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75189 - BLOCK
      ?auto_75190 - BLOCK
    )
    :vars
    (
      ?auto_75191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75189 ) ( ON ?auto_75190 ?auto_75191 ) ( CLEAR ?auto_75190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75189 ) ( not ( = ?auto_75189 ?auto_75190 ) ) ( not ( = ?auto_75189 ?auto_75191 ) ) ( not ( = ?auto_75190 ?auto_75191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75190 ?auto_75191 )
      ( !STACK ?auto_75190 ?auto_75189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75194 - BLOCK
      ?auto_75195 - BLOCK
    )
    :vars
    (
      ?auto_75196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75194 ) ( ON ?auto_75195 ?auto_75196 ) ( CLEAR ?auto_75195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75194 ) ( not ( = ?auto_75194 ?auto_75195 ) ) ( not ( = ?auto_75194 ?auto_75196 ) ) ( not ( = ?auto_75195 ?auto_75196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75195 ?auto_75196 )
      ( !STACK ?auto_75195 ?auto_75194 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75199 - BLOCK
      ?auto_75200 - BLOCK
    )
    :vars
    (
      ?auto_75201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75200 ?auto_75201 ) ( not ( = ?auto_75199 ?auto_75200 ) ) ( not ( = ?auto_75199 ?auto_75201 ) ) ( not ( = ?auto_75200 ?auto_75201 ) ) ( ON ?auto_75199 ?auto_75200 ) ( CLEAR ?auto_75199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75199 )
      ( MAKE-2PILE ?auto_75199 ?auto_75200 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75204 - BLOCK
      ?auto_75205 - BLOCK
    )
    :vars
    (
      ?auto_75206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75205 ?auto_75206 ) ( not ( = ?auto_75204 ?auto_75205 ) ) ( not ( = ?auto_75204 ?auto_75206 ) ) ( not ( = ?auto_75205 ?auto_75206 ) ) ( ON ?auto_75204 ?auto_75205 ) ( CLEAR ?auto_75204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75204 )
      ( MAKE-2PILE ?auto_75204 ?auto_75205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75210 - BLOCK
      ?auto_75211 - BLOCK
      ?auto_75212 - BLOCK
    )
    :vars
    (
      ?auto_75213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75211 ) ( ON ?auto_75212 ?auto_75213 ) ( CLEAR ?auto_75212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75210 ) ( ON ?auto_75211 ?auto_75210 ) ( not ( = ?auto_75210 ?auto_75211 ) ) ( not ( = ?auto_75210 ?auto_75212 ) ) ( not ( = ?auto_75210 ?auto_75213 ) ) ( not ( = ?auto_75211 ?auto_75212 ) ) ( not ( = ?auto_75211 ?auto_75213 ) ) ( not ( = ?auto_75212 ?auto_75213 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75212 ?auto_75213 )
      ( !STACK ?auto_75212 ?auto_75211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75217 - BLOCK
      ?auto_75218 - BLOCK
      ?auto_75219 - BLOCK
    )
    :vars
    (
      ?auto_75220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75218 ) ( ON ?auto_75219 ?auto_75220 ) ( CLEAR ?auto_75219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75217 ) ( ON ?auto_75218 ?auto_75217 ) ( not ( = ?auto_75217 ?auto_75218 ) ) ( not ( = ?auto_75217 ?auto_75219 ) ) ( not ( = ?auto_75217 ?auto_75220 ) ) ( not ( = ?auto_75218 ?auto_75219 ) ) ( not ( = ?auto_75218 ?auto_75220 ) ) ( not ( = ?auto_75219 ?auto_75220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75219 ?auto_75220 )
      ( !STACK ?auto_75219 ?auto_75218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75224 - BLOCK
      ?auto_75225 - BLOCK
      ?auto_75226 - BLOCK
    )
    :vars
    (
      ?auto_75227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75226 ?auto_75227 ) ( ON-TABLE ?auto_75224 ) ( not ( = ?auto_75224 ?auto_75225 ) ) ( not ( = ?auto_75224 ?auto_75226 ) ) ( not ( = ?auto_75224 ?auto_75227 ) ) ( not ( = ?auto_75225 ?auto_75226 ) ) ( not ( = ?auto_75225 ?auto_75227 ) ) ( not ( = ?auto_75226 ?auto_75227 ) ) ( CLEAR ?auto_75224 ) ( ON ?auto_75225 ?auto_75226 ) ( CLEAR ?auto_75225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75224 ?auto_75225 )
      ( MAKE-3PILE ?auto_75224 ?auto_75225 ?auto_75226 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75231 - BLOCK
      ?auto_75232 - BLOCK
      ?auto_75233 - BLOCK
    )
    :vars
    (
      ?auto_75234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75233 ?auto_75234 ) ( ON-TABLE ?auto_75231 ) ( not ( = ?auto_75231 ?auto_75232 ) ) ( not ( = ?auto_75231 ?auto_75233 ) ) ( not ( = ?auto_75231 ?auto_75234 ) ) ( not ( = ?auto_75232 ?auto_75233 ) ) ( not ( = ?auto_75232 ?auto_75234 ) ) ( not ( = ?auto_75233 ?auto_75234 ) ) ( CLEAR ?auto_75231 ) ( ON ?auto_75232 ?auto_75233 ) ( CLEAR ?auto_75232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75231 ?auto_75232 )
      ( MAKE-3PILE ?auto_75231 ?auto_75232 ?auto_75233 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75238 - BLOCK
      ?auto_75239 - BLOCK
      ?auto_75240 - BLOCK
    )
    :vars
    (
      ?auto_75241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75240 ?auto_75241 ) ( not ( = ?auto_75238 ?auto_75239 ) ) ( not ( = ?auto_75238 ?auto_75240 ) ) ( not ( = ?auto_75238 ?auto_75241 ) ) ( not ( = ?auto_75239 ?auto_75240 ) ) ( not ( = ?auto_75239 ?auto_75241 ) ) ( not ( = ?auto_75240 ?auto_75241 ) ) ( ON ?auto_75239 ?auto_75240 ) ( ON ?auto_75238 ?auto_75239 ) ( CLEAR ?auto_75238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75238 )
      ( MAKE-3PILE ?auto_75238 ?auto_75239 ?auto_75240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75245 - BLOCK
      ?auto_75246 - BLOCK
      ?auto_75247 - BLOCK
    )
    :vars
    (
      ?auto_75248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75247 ?auto_75248 ) ( not ( = ?auto_75245 ?auto_75246 ) ) ( not ( = ?auto_75245 ?auto_75247 ) ) ( not ( = ?auto_75245 ?auto_75248 ) ) ( not ( = ?auto_75246 ?auto_75247 ) ) ( not ( = ?auto_75246 ?auto_75248 ) ) ( not ( = ?auto_75247 ?auto_75248 ) ) ( ON ?auto_75246 ?auto_75247 ) ( ON ?auto_75245 ?auto_75246 ) ( CLEAR ?auto_75245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75245 )
      ( MAKE-3PILE ?auto_75245 ?auto_75246 ?auto_75247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75253 - BLOCK
      ?auto_75254 - BLOCK
      ?auto_75255 - BLOCK
      ?auto_75256 - BLOCK
    )
    :vars
    (
      ?auto_75257 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75255 ) ( ON ?auto_75256 ?auto_75257 ) ( CLEAR ?auto_75256 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75253 ) ( ON ?auto_75254 ?auto_75253 ) ( ON ?auto_75255 ?auto_75254 ) ( not ( = ?auto_75253 ?auto_75254 ) ) ( not ( = ?auto_75253 ?auto_75255 ) ) ( not ( = ?auto_75253 ?auto_75256 ) ) ( not ( = ?auto_75253 ?auto_75257 ) ) ( not ( = ?auto_75254 ?auto_75255 ) ) ( not ( = ?auto_75254 ?auto_75256 ) ) ( not ( = ?auto_75254 ?auto_75257 ) ) ( not ( = ?auto_75255 ?auto_75256 ) ) ( not ( = ?auto_75255 ?auto_75257 ) ) ( not ( = ?auto_75256 ?auto_75257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75256 ?auto_75257 )
      ( !STACK ?auto_75256 ?auto_75255 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75262 - BLOCK
      ?auto_75263 - BLOCK
      ?auto_75264 - BLOCK
      ?auto_75265 - BLOCK
    )
    :vars
    (
      ?auto_75266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75264 ) ( ON ?auto_75265 ?auto_75266 ) ( CLEAR ?auto_75265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75262 ) ( ON ?auto_75263 ?auto_75262 ) ( ON ?auto_75264 ?auto_75263 ) ( not ( = ?auto_75262 ?auto_75263 ) ) ( not ( = ?auto_75262 ?auto_75264 ) ) ( not ( = ?auto_75262 ?auto_75265 ) ) ( not ( = ?auto_75262 ?auto_75266 ) ) ( not ( = ?auto_75263 ?auto_75264 ) ) ( not ( = ?auto_75263 ?auto_75265 ) ) ( not ( = ?auto_75263 ?auto_75266 ) ) ( not ( = ?auto_75264 ?auto_75265 ) ) ( not ( = ?auto_75264 ?auto_75266 ) ) ( not ( = ?auto_75265 ?auto_75266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75265 ?auto_75266 )
      ( !STACK ?auto_75265 ?auto_75264 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75271 - BLOCK
      ?auto_75272 - BLOCK
      ?auto_75273 - BLOCK
      ?auto_75274 - BLOCK
    )
    :vars
    (
      ?auto_75275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75274 ?auto_75275 ) ( ON-TABLE ?auto_75271 ) ( ON ?auto_75272 ?auto_75271 ) ( not ( = ?auto_75271 ?auto_75272 ) ) ( not ( = ?auto_75271 ?auto_75273 ) ) ( not ( = ?auto_75271 ?auto_75274 ) ) ( not ( = ?auto_75271 ?auto_75275 ) ) ( not ( = ?auto_75272 ?auto_75273 ) ) ( not ( = ?auto_75272 ?auto_75274 ) ) ( not ( = ?auto_75272 ?auto_75275 ) ) ( not ( = ?auto_75273 ?auto_75274 ) ) ( not ( = ?auto_75273 ?auto_75275 ) ) ( not ( = ?auto_75274 ?auto_75275 ) ) ( CLEAR ?auto_75272 ) ( ON ?auto_75273 ?auto_75274 ) ( CLEAR ?auto_75273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75271 ?auto_75272 ?auto_75273 )
      ( MAKE-4PILE ?auto_75271 ?auto_75272 ?auto_75273 ?auto_75274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75280 - BLOCK
      ?auto_75281 - BLOCK
      ?auto_75282 - BLOCK
      ?auto_75283 - BLOCK
    )
    :vars
    (
      ?auto_75284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75283 ?auto_75284 ) ( ON-TABLE ?auto_75280 ) ( ON ?auto_75281 ?auto_75280 ) ( not ( = ?auto_75280 ?auto_75281 ) ) ( not ( = ?auto_75280 ?auto_75282 ) ) ( not ( = ?auto_75280 ?auto_75283 ) ) ( not ( = ?auto_75280 ?auto_75284 ) ) ( not ( = ?auto_75281 ?auto_75282 ) ) ( not ( = ?auto_75281 ?auto_75283 ) ) ( not ( = ?auto_75281 ?auto_75284 ) ) ( not ( = ?auto_75282 ?auto_75283 ) ) ( not ( = ?auto_75282 ?auto_75284 ) ) ( not ( = ?auto_75283 ?auto_75284 ) ) ( CLEAR ?auto_75281 ) ( ON ?auto_75282 ?auto_75283 ) ( CLEAR ?auto_75282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75280 ?auto_75281 ?auto_75282 )
      ( MAKE-4PILE ?auto_75280 ?auto_75281 ?auto_75282 ?auto_75283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75289 - BLOCK
      ?auto_75290 - BLOCK
      ?auto_75291 - BLOCK
      ?auto_75292 - BLOCK
    )
    :vars
    (
      ?auto_75293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75292 ?auto_75293 ) ( ON-TABLE ?auto_75289 ) ( not ( = ?auto_75289 ?auto_75290 ) ) ( not ( = ?auto_75289 ?auto_75291 ) ) ( not ( = ?auto_75289 ?auto_75292 ) ) ( not ( = ?auto_75289 ?auto_75293 ) ) ( not ( = ?auto_75290 ?auto_75291 ) ) ( not ( = ?auto_75290 ?auto_75292 ) ) ( not ( = ?auto_75290 ?auto_75293 ) ) ( not ( = ?auto_75291 ?auto_75292 ) ) ( not ( = ?auto_75291 ?auto_75293 ) ) ( not ( = ?auto_75292 ?auto_75293 ) ) ( ON ?auto_75291 ?auto_75292 ) ( CLEAR ?auto_75289 ) ( ON ?auto_75290 ?auto_75291 ) ( CLEAR ?auto_75290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75289 ?auto_75290 )
      ( MAKE-4PILE ?auto_75289 ?auto_75290 ?auto_75291 ?auto_75292 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75298 - BLOCK
      ?auto_75299 - BLOCK
      ?auto_75300 - BLOCK
      ?auto_75301 - BLOCK
    )
    :vars
    (
      ?auto_75302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75301 ?auto_75302 ) ( ON-TABLE ?auto_75298 ) ( not ( = ?auto_75298 ?auto_75299 ) ) ( not ( = ?auto_75298 ?auto_75300 ) ) ( not ( = ?auto_75298 ?auto_75301 ) ) ( not ( = ?auto_75298 ?auto_75302 ) ) ( not ( = ?auto_75299 ?auto_75300 ) ) ( not ( = ?auto_75299 ?auto_75301 ) ) ( not ( = ?auto_75299 ?auto_75302 ) ) ( not ( = ?auto_75300 ?auto_75301 ) ) ( not ( = ?auto_75300 ?auto_75302 ) ) ( not ( = ?auto_75301 ?auto_75302 ) ) ( ON ?auto_75300 ?auto_75301 ) ( CLEAR ?auto_75298 ) ( ON ?auto_75299 ?auto_75300 ) ( CLEAR ?auto_75299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75298 ?auto_75299 )
      ( MAKE-4PILE ?auto_75298 ?auto_75299 ?auto_75300 ?auto_75301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75307 - BLOCK
      ?auto_75308 - BLOCK
      ?auto_75309 - BLOCK
      ?auto_75310 - BLOCK
    )
    :vars
    (
      ?auto_75311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75310 ?auto_75311 ) ( not ( = ?auto_75307 ?auto_75308 ) ) ( not ( = ?auto_75307 ?auto_75309 ) ) ( not ( = ?auto_75307 ?auto_75310 ) ) ( not ( = ?auto_75307 ?auto_75311 ) ) ( not ( = ?auto_75308 ?auto_75309 ) ) ( not ( = ?auto_75308 ?auto_75310 ) ) ( not ( = ?auto_75308 ?auto_75311 ) ) ( not ( = ?auto_75309 ?auto_75310 ) ) ( not ( = ?auto_75309 ?auto_75311 ) ) ( not ( = ?auto_75310 ?auto_75311 ) ) ( ON ?auto_75309 ?auto_75310 ) ( ON ?auto_75308 ?auto_75309 ) ( ON ?auto_75307 ?auto_75308 ) ( CLEAR ?auto_75307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75307 )
      ( MAKE-4PILE ?auto_75307 ?auto_75308 ?auto_75309 ?auto_75310 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75316 - BLOCK
      ?auto_75317 - BLOCK
      ?auto_75318 - BLOCK
      ?auto_75319 - BLOCK
    )
    :vars
    (
      ?auto_75320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75319 ?auto_75320 ) ( not ( = ?auto_75316 ?auto_75317 ) ) ( not ( = ?auto_75316 ?auto_75318 ) ) ( not ( = ?auto_75316 ?auto_75319 ) ) ( not ( = ?auto_75316 ?auto_75320 ) ) ( not ( = ?auto_75317 ?auto_75318 ) ) ( not ( = ?auto_75317 ?auto_75319 ) ) ( not ( = ?auto_75317 ?auto_75320 ) ) ( not ( = ?auto_75318 ?auto_75319 ) ) ( not ( = ?auto_75318 ?auto_75320 ) ) ( not ( = ?auto_75319 ?auto_75320 ) ) ( ON ?auto_75318 ?auto_75319 ) ( ON ?auto_75317 ?auto_75318 ) ( ON ?auto_75316 ?auto_75317 ) ( CLEAR ?auto_75316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75316 )
      ( MAKE-4PILE ?auto_75316 ?auto_75317 ?auto_75318 ?auto_75319 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75326 - BLOCK
      ?auto_75327 - BLOCK
      ?auto_75328 - BLOCK
      ?auto_75329 - BLOCK
      ?auto_75330 - BLOCK
    )
    :vars
    (
      ?auto_75331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75329 ) ( ON ?auto_75330 ?auto_75331 ) ( CLEAR ?auto_75330 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75326 ) ( ON ?auto_75327 ?auto_75326 ) ( ON ?auto_75328 ?auto_75327 ) ( ON ?auto_75329 ?auto_75328 ) ( not ( = ?auto_75326 ?auto_75327 ) ) ( not ( = ?auto_75326 ?auto_75328 ) ) ( not ( = ?auto_75326 ?auto_75329 ) ) ( not ( = ?auto_75326 ?auto_75330 ) ) ( not ( = ?auto_75326 ?auto_75331 ) ) ( not ( = ?auto_75327 ?auto_75328 ) ) ( not ( = ?auto_75327 ?auto_75329 ) ) ( not ( = ?auto_75327 ?auto_75330 ) ) ( not ( = ?auto_75327 ?auto_75331 ) ) ( not ( = ?auto_75328 ?auto_75329 ) ) ( not ( = ?auto_75328 ?auto_75330 ) ) ( not ( = ?auto_75328 ?auto_75331 ) ) ( not ( = ?auto_75329 ?auto_75330 ) ) ( not ( = ?auto_75329 ?auto_75331 ) ) ( not ( = ?auto_75330 ?auto_75331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75330 ?auto_75331 )
      ( !STACK ?auto_75330 ?auto_75329 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75337 - BLOCK
      ?auto_75338 - BLOCK
      ?auto_75339 - BLOCK
      ?auto_75340 - BLOCK
      ?auto_75341 - BLOCK
    )
    :vars
    (
      ?auto_75342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75340 ) ( ON ?auto_75341 ?auto_75342 ) ( CLEAR ?auto_75341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75337 ) ( ON ?auto_75338 ?auto_75337 ) ( ON ?auto_75339 ?auto_75338 ) ( ON ?auto_75340 ?auto_75339 ) ( not ( = ?auto_75337 ?auto_75338 ) ) ( not ( = ?auto_75337 ?auto_75339 ) ) ( not ( = ?auto_75337 ?auto_75340 ) ) ( not ( = ?auto_75337 ?auto_75341 ) ) ( not ( = ?auto_75337 ?auto_75342 ) ) ( not ( = ?auto_75338 ?auto_75339 ) ) ( not ( = ?auto_75338 ?auto_75340 ) ) ( not ( = ?auto_75338 ?auto_75341 ) ) ( not ( = ?auto_75338 ?auto_75342 ) ) ( not ( = ?auto_75339 ?auto_75340 ) ) ( not ( = ?auto_75339 ?auto_75341 ) ) ( not ( = ?auto_75339 ?auto_75342 ) ) ( not ( = ?auto_75340 ?auto_75341 ) ) ( not ( = ?auto_75340 ?auto_75342 ) ) ( not ( = ?auto_75341 ?auto_75342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75341 ?auto_75342 )
      ( !STACK ?auto_75341 ?auto_75340 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75348 - BLOCK
      ?auto_75349 - BLOCK
      ?auto_75350 - BLOCK
      ?auto_75351 - BLOCK
      ?auto_75352 - BLOCK
    )
    :vars
    (
      ?auto_75353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75352 ?auto_75353 ) ( ON-TABLE ?auto_75348 ) ( ON ?auto_75349 ?auto_75348 ) ( ON ?auto_75350 ?auto_75349 ) ( not ( = ?auto_75348 ?auto_75349 ) ) ( not ( = ?auto_75348 ?auto_75350 ) ) ( not ( = ?auto_75348 ?auto_75351 ) ) ( not ( = ?auto_75348 ?auto_75352 ) ) ( not ( = ?auto_75348 ?auto_75353 ) ) ( not ( = ?auto_75349 ?auto_75350 ) ) ( not ( = ?auto_75349 ?auto_75351 ) ) ( not ( = ?auto_75349 ?auto_75352 ) ) ( not ( = ?auto_75349 ?auto_75353 ) ) ( not ( = ?auto_75350 ?auto_75351 ) ) ( not ( = ?auto_75350 ?auto_75352 ) ) ( not ( = ?auto_75350 ?auto_75353 ) ) ( not ( = ?auto_75351 ?auto_75352 ) ) ( not ( = ?auto_75351 ?auto_75353 ) ) ( not ( = ?auto_75352 ?auto_75353 ) ) ( CLEAR ?auto_75350 ) ( ON ?auto_75351 ?auto_75352 ) ( CLEAR ?auto_75351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75348 ?auto_75349 ?auto_75350 ?auto_75351 )
      ( MAKE-5PILE ?auto_75348 ?auto_75349 ?auto_75350 ?auto_75351 ?auto_75352 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75359 - BLOCK
      ?auto_75360 - BLOCK
      ?auto_75361 - BLOCK
      ?auto_75362 - BLOCK
      ?auto_75363 - BLOCK
    )
    :vars
    (
      ?auto_75364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75363 ?auto_75364 ) ( ON-TABLE ?auto_75359 ) ( ON ?auto_75360 ?auto_75359 ) ( ON ?auto_75361 ?auto_75360 ) ( not ( = ?auto_75359 ?auto_75360 ) ) ( not ( = ?auto_75359 ?auto_75361 ) ) ( not ( = ?auto_75359 ?auto_75362 ) ) ( not ( = ?auto_75359 ?auto_75363 ) ) ( not ( = ?auto_75359 ?auto_75364 ) ) ( not ( = ?auto_75360 ?auto_75361 ) ) ( not ( = ?auto_75360 ?auto_75362 ) ) ( not ( = ?auto_75360 ?auto_75363 ) ) ( not ( = ?auto_75360 ?auto_75364 ) ) ( not ( = ?auto_75361 ?auto_75362 ) ) ( not ( = ?auto_75361 ?auto_75363 ) ) ( not ( = ?auto_75361 ?auto_75364 ) ) ( not ( = ?auto_75362 ?auto_75363 ) ) ( not ( = ?auto_75362 ?auto_75364 ) ) ( not ( = ?auto_75363 ?auto_75364 ) ) ( CLEAR ?auto_75361 ) ( ON ?auto_75362 ?auto_75363 ) ( CLEAR ?auto_75362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75359 ?auto_75360 ?auto_75361 ?auto_75362 )
      ( MAKE-5PILE ?auto_75359 ?auto_75360 ?auto_75361 ?auto_75362 ?auto_75363 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75370 - BLOCK
      ?auto_75371 - BLOCK
      ?auto_75372 - BLOCK
      ?auto_75373 - BLOCK
      ?auto_75374 - BLOCK
    )
    :vars
    (
      ?auto_75375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75374 ?auto_75375 ) ( ON-TABLE ?auto_75370 ) ( ON ?auto_75371 ?auto_75370 ) ( not ( = ?auto_75370 ?auto_75371 ) ) ( not ( = ?auto_75370 ?auto_75372 ) ) ( not ( = ?auto_75370 ?auto_75373 ) ) ( not ( = ?auto_75370 ?auto_75374 ) ) ( not ( = ?auto_75370 ?auto_75375 ) ) ( not ( = ?auto_75371 ?auto_75372 ) ) ( not ( = ?auto_75371 ?auto_75373 ) ) ( not ( = ?auto_75371 ?auto_75374 ) ) ( not ( = ?auto_75371 ?auto_75375 ) ) ( not ( = ?auto_75372 ?auto_75373 ) ) ( not ( = ?auto_75372 ?auto_75374 ) ) ( not ( = ?auto_75372 ?auto_75375 ) ) ( not ( = ?auto_75373 ?auto_75374 ) ) ( not ( = ?auto_75373 ?auto_75375 ) ) ( not ( = ?auto_75374 ?auto_75375 ) ) ( ON ?auto_75373 ?auto_75374 ) ( CLEAR ?auto_75371 ) ( ON ?auto_75372 ?auto_75373 ) ( CLEAR ?auto_75372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75370 ?auto_75371 ?auto_75372 )
      ( MAKE-5PILE ?auto_75370 ?auto_75371 ?auto_75372 ?auto_75373 ?auto_75374 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75381 - BLOCK
      ?auto_75382 - BLOCK
      ?auto_75383 - BLOCK
      ?auto_75384 - BLOCK
      ?auto_75385 - BLOCK
    )
    :vars
    (
      ?auto_75386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75385 ?auto_75386 ) ( ON-TABLE ?auto_75381 ) ( ON ?auto_75382 ?auto_75381 ) ( not ( = ?auto_75381 ?auto_75382 ) ) ( not ( = ?auto_75381 ?auto_75383 ) ) ( not ( = ?auto_75381 ?auto_75384 ) ) ( not ( = ?auto_75381 ?auto_75385 ) ) ( not ( = ?auto_75381 ?auto_75386 ) ) ( not ( = ?auto_75382 ?auto_75383 ) ) ( not ( = ?auto_75382 ?auto_75384 ) ) ( not ( = ?auto_75382 ?auto_75385 ) ) ( not ( = ?auto_75382 ?auto_75386 ) ) ( not ( = ?auto_75383 ?auto_75384 ) ) ( not ( = ?auto_75383 ?auto_75385 ) ) ( not ( = ?auto_75383 ?auto_75386 ) ) ( not ( = ?auto_75384 ?auto_75385 ) ) ( not ( = ?auto_75384 ?auto_75386 ) ) ( not ( = ?auto_75385 ?auto_75386 ) ) ( ON ?auto_75384 ?auto_75385 ) ( CLEAR ?auto_75382 ) ( ON ?auto_75383 ?auto_75384 ) ( CLEAR ?auto_75383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75381 ?auto_75382 ?auto_75383 )
      ( MAKE-5PILE ?auto_75381 ?auto_75382 ?auto_75383 ?auto_75384 ?auto_75385 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75392 - BLOCK
      ?auto_75393 - BLOCK
      ?auto_75394 - BLOCK
      ?auto_75395 - BLOCK
      ?auto_75396 - BLOCK
    )
    :vars
    (
      ?auto_75397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75396 ?auto_75397 ) ( ON-TABLE ?auto_75392 ) ( not ( = ?auto_75392 ?auto_75393 ) ) ( not ( = ?auto_75392 ?auto_75394 ) ) ( not ( = ?auto_75392 ?auto_75395 ) ) ( not ( = ?auto_75392 ?auto_75396 ) ) ( not ( = ?auto_75392 ?auto_75397 ) ) ( not ( = ?auto_75393 ?auto_75394 ) ) ( not ( = ?auto_75393 ?auto_75395 ) ) ( not ( = ?auto_75393 ?auto_75396 ) ) ( not ( = ?auto_75393 ?auto_75397 ) ) ( not ( = ?auto_75394 ?auto_75395 ) ) ( not ( = ?auto_75394 ?auto_75396 ) ) ( not ( = ?auto_75394 ?auto_75397 ) ) ( not ( = ?auto_75395 ?auto_75396 ) ) ( not ( = ?auto_75395 ?auto_75397 ) ) ( not ( = ?auto_75396 ?auto_75397 ) ) ( ON ?auto_75395 ?auto_75396 ) ( ON ?auto_75394 ?auto_75395 ) ( CLEAR ?auto_75392 ) ( ON ?auto_75393 ?auto_75394 ) ( CLEAR ?auto_75393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75392 ?auto_75393 )
      ( MAKE-5PILE ?auto_75392 ?auto_75393 ?auto_75394 ?auto_75395 ?auto_75396 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75403 - BLOCK
      ?auto_75404 - BLOCK
      ?auto_75405 - BLOCK
      ?auto_75406 - BLOCK
      ?auto_75407 - BLOCK
    )
    :vars
    (
      ?auto_75408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75407 ?auto_75408 ) ( ON-TABLE ?auto_75403 ) ( not ( = ?auto_75403 ?auto_75404 ) ) ( not ( = ?auto_75403 ?auto_75405 ) ) ( not ( = ?auto_75403 ?auto_75406 ) ) ( not ( = ?auto_75403 ?auto_75407 ) ) ( not ( = ?auto_75403 ?auto_75408 ) ) ( not ( = ?auto_75404 ?auto_75405 ) ) ( not ( = ?auto_75404 ?auto_75406 ) ) ( not ( = ?auto_75404 ?auto_75407 ) ) ( not ( = ?auto_75404 ?auto_75408 ) ) ( not ( = ?auto_75405 ?auto_75406 ) ) ( not ( = ?auto_75405 ?auto_75407 ) ) ( not ( = ?auto_75405 ?auto_75408 ) ) ( not ( = ?auto_75406 ?auto_75407 ) ) ( not ( = ?auto_75406 ?auto_75408 ) ) ( not ( = ?auto_75407 ?auto_75408 ) ) ( ON ?auto_75406 ?auto_75407 ) ( ON ?auto_75405 ?auto_75406 ) ( CLEAR ?auto_75403 ) ( ON ?auto_75404 ?auto_75405 ) ( CLEAR ?auto_75404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75403 ?auto_75404 )
      ( MAKE-5PILE ?auto_75403 ?auto_75404 ?auto_75405 ?auto_75406 ?auto_75407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75414 - BLOCK
      ?auto_75415 - BLOCK
      ?auto_75416 - BLOCK
      ?auto_75417 - BLOCK
      ?auto_75418 - BLOCK
    )
    :vars
    (
      ?auto_75419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75418 ?auto_75419 ) ( not ( = ?auto_75414 ?auto_75415 ) ) ( not ( = ?auto_75414 ?auto_75416 ) ) ( not ( = ?auto_75414 ?auto_75417 ) ) ( not ( = ?auto_75414 ?auto_75418 ) ) ( not ( = ?auto_75414 ?auto_75419 ) ) ( not ( = ?auto_75415 ?auto_75416 ) ) ( not ( = ?auto_75415 ?auto_75417 ) ) ( not ( = ?auto_75415 ?auto_75418 ) ) ( not ( = ?auto_75415 ?auto_75419 ) ) ( not ( = ?auto_75416 ?auto_75417 ) ) ( not ( = ?auto_75416 ?auto_75418 ) ) ( not ( = ?auto_75416 ?auto_75419 ) ) ( not ( = ?auto_75417 ?auto_75418 ) ) ( not ( = ?auto_75417 ?auto_75419 ) ) ( not ( = ?auto_75418 ?auto_75419 ) ) ( ON ?auto_75417 ?auto_75418 ) ( ON ?auto_75416 ?auto_75417 ) ( ON ?auto_75415 ?auto_75416 ) ( ON ?auto_75414 ?auto_75415 ) ( CLEAR ?auto_75414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75414 )
      ( MAKE-5PILE ?auto_75414 ?auto_75415 ?auto_75416 ?auto_75417 ?auto_75418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75425 - BLOCK
      ?auto_75426 - BLOCK
      ?auto_75427 - BLOCK
      ?auto_75428 - BLOCK
      ?auto_75429 - BLOCK
    )
    :vars
    (
      ?auto_75430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75429 ?auto_75430 ) ( not ( = ?auto_75425 ?auto_75426 ) ) ( not ( = ?auto_75425 ?auto_75427 ) ) ( not ( = ?auto_75425 ?auto_75428 ) ) ( not ( = ?auto_75425 ?auto_75429 ) ) ( not ( = ?auto_75425 ?auto_75430 ) ) ( not ( = ?auto_75426 ?auto_75427 ) ) ( not ( = ?auto_75426 ?auto_75428 ) ) ( not ( = ?auto_75426 ?auto_75429 ) ) ( not ( = ?auto_75426 ?auto_75430 ) ) ( not ( = ?auto_75427 ?auto_75428 ) ) ( not ( = ?auto_75427 ?auto_75429 ) ) ( not ( = ?auto_75427 ?auto_75430 ) ) ( not ( = ?auto_75428 ?auto_75429 ) ) ( not ( = ?auto_75428 ?auto_75430 ) ) ( not ( = ?auto_75429 ?auto_75430 ) ) ( ON ?auto_75428 ?auto_75429 ) ( ON ?auto_75427 ?auto_75428 ) ( ON ?auto_75426 ?auto_75427 ) ( ON ?auto_75425 ?auto_75426 ) ( CLEAR ?auto_75425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75425 )
      ( MAKE-5PILE ?auto_75425 ?auto_75426 ?auto_75427 ?auto_75428 ?auto_75429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75437 - BLOCK
      ?auto_75438 - BLOCK
      ?auto_75439 - BLOCK
      ?auto_75440 - BLOCK
      ?auto_75441 - BLOCK
      ?auto_75442 - BLOCK
    )
    :vars
    (
      ?auto_75443 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75441 ) ( ON ?auto_75442 ?auto_75443 ) ( CLEAR ?auto_75442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75437 ) ( ON ?auto_75438 ?auto_75437 ) ( ON ?auto_75439 ?auto_75438 ) ( ON ?auto_75440 ?auto_75439 ) ( ON ?auto_75441 ?auto_75440 ) ( not ( = ?auto_75437 ?auto_75438 ) ) ( not ( = ?auto_75437 ?auto_75439 ) ) ( not ( = ?auto_75437 ?auto_75440 ) ) ( not ( = ?auto_75437 ?auto_75441 ) ) ( not ( = ?auto_75437 ?auto_75442 ) ) ( not ( = ?auto_75437 ?auto_75443 ) ) ( not ( = ?auto_75438 ?auto_75439 ) ) ( not ( = ?auto_75438 ?auto_75440 ) ) ( not ( = ?auto_75438 ?auto_75441 ) ) ( not ( = ?auto_75438 ?auto_75442 ) ) ( not ( = ?auto_75438 ?auto_75443 ) ) ( not ( = ?auto_75439 ?auto_75440 ) ) ( not ( = ?auto_75439 ?auto_75441 ) ) ( not ( = ?auto_75439 ?auto_75442 ) ) ( not ( = ?auto_75439 ?auto_75443 ) ) ( not ( = ?auto_75440 ?auto_75441 ) ) ( not ( = ?auto_75440 ?auto_75442 ) ) ( not ( = ?auto_75440 ?auto_75443 ) ) ( not ( = ?auto_75441 ?auto_75442 ) ) ( not ( = ?auto_75441 ?auto_75443 ) ) ( not ( = ?auto_75442 ?auto_75443 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75442 ?auto_75443 )
      ( !STACK ?auto_75442 ?auto_75441 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75450 - BLOCK
      ?auto_75451 - BLOCK
      ?auto_75452 - BLOCK
      ?auto_75453 - BLOCK
      ?auto_75454 - BLOCK
      ?auto_75455 - BLOCK
    )
    :vars
    (
      ?auto_75456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75454 ) ( ON ?auto_75455 ?auto_75456 ) ( CLEAR ?auto_75455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75450 ) ( ON ?auto_75451 ?auto_75450 ) ( ON ?auto_75452 ?auto_75451 ) ( ON ?auto_75453 ?auto_75452 ) ( ON ?auto_75454 ?auto_75453 ) ( not ( = ?auto_75450 ?auto_75451 ) ) ( not ( = ?auto_75450 ?auto_75452 ) ) ( not ( = ?auto_75450 ?auto_75453 ) ) ( not ( = ?auto_75450 ?auto_75454 ) ) ( not ( = ?auto_75450 ?auto_75455 ) ) ( not ( = ?auto_75450 ?auto_75456 ) ) ( not ( = ?auto_75451 ?auto_75452 ) ) ( not ( = ?auto_75451 ?auto_75453 ) ) ( not ( = ?auto_75451 ?auto_75454 ) ) ( not ( = ?auto_75451 ?auto_75455 ) ) ( not ( = ?auto_75451 ?auto_75456 ) ) ( not ( = ?auto_75452 ?auto_75453 ) ) ( not ( = ?auto_75452 ?auto_75454 ) ) ( not ( = ?auto_75452 ?auto_75455 ) ) ( not ( = ?auto_75452 ?auto_75456 ) ) ( not ( = ?auto_75453 ?auto_75454 ) ) ( not ( = ?auto_75453 ?auto_75455 ) ) ( not ( = ?auto_75453 ?auto_75456 ) ) ( not ( = ?auto_75454 ?auto_75455 ) ) ( not ( = ?auto_75454 ?auto_75456 ) ) ( not ( = ?auto_75455 ?auto_75456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75455 ?auto_75456 )
      ( !STACK ?auto_75455 ?auto_75454 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75463 - BLOCK
      ?auto_75464 - BLOCK
      ?auto_75465 - BLOCK
      ?auto_75466 - BLOCK
      ?auto_75467 - BLOCK
      ?auto_75468 - BLOCK
    )
    :vars
    (
      ?auto_75469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75468 ?auto_75469 ) ( ON-TABLE ?auto_75463 ) ( ON ?auto_75464 ?auto_75463 ) ( ON ?auto_75465 ?auto_75464 ) ( ON ?auto_75466 ?auto_75465 ) ( not ( = ?auto_75463 ?auto_75464 ) ) ( not ( = ?auto_75463 ?auto_75465 ) ) ( not ( = ?auto_75463 ?auto_75466 ) ) ( not ( = ?auto_75463 ?auto_75467 ) ) ( not ( = ?auto_75463 ?auto_75468 ) ) ( not ( = ?auto_75463 ?auto_75469 ) ) ( not ( = ?auto_75464 ?auto_75465 ) ) ( not ( = ?auto_75464 ?auto_75466 ) ) ( not ( = ?auto_75464 ?auto_75467 ) ) ( not ( = ?auto_75464 ?auto_75468 ) ) ( not ( = ?auto_75464 ?auto_75469 ) ) ( not ( = ?auto_75465 ?auto_75466 ) ) ( not ( = ?auto_75465 ?auto_75467 ) ) ( not ( = ?auto_75465 ?auto_75468 ) ) ( not ( = ?auto_75465 ?auto_75469 ) ) ( not ( = ?auto_75466 ?auto_75467 ) ) ( not ( = ?auto_75466 ?auto_75468 ) ) ( not ( = ?auto_75466 ?auto_75469 ) ) ( not ( = ?auto_75467 ?auto_75468 ) ) ( not ( = ?auto_75467 ?auto_75469 ) ) ( not ( = ?auto_75468 ?auto_75469 ) ) ( CLEAR ?auto_75466 ) ( ON ?auto_75467 ?auto_75468 ) ( CLEAR ?auto_75467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75463 ?auto_75464 ?auto_75465 ?auto_75466 ?auto_75467 )
      ( MAKE-6PILE ?auto_75463 ?auto_75464 ?auto_75465 ?auto_75466 ?auto_75467 ?auto_75468 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75476 - BLOCK
      ?auto_75477 - BLOCK
      ?auto_75478 - BLOCK
      ?auto_75479 - BLOCK
      ?auto_75480 - BLOCK
      ?auto_75481 - BLOCK
    )
    :vars
    (
      ?auto_75482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75481 ?auto_75482 ) ( ON-TABLE ?auto_75476 ) ( ON ?auto_75477 ?auto_75476 ) ( ON ?auto_75478 ?auto_75477 ) ( ON ?auto_75479 ?auto_75478 ) ( not ( = ?auto_75476 ?auto_75477 ) ) ( not ( = ?auto_75476 ?auto_75478 ) ) ( not ( = ?auto_75476 ?auto_75479 ) ) ( not ( = ?auto_75476 ?auto_75480 ) ) ( not ( = ?auto_75476 ?auto_75481 ) ) ( not ( = ?auto_75476 ?auto_75482 ) ) ( not ( = ?auto_75477 ?auto_75478 ) ) ( not ( = ?auto_75477 ?auto_75479 ) ) ( not ( = ?auto_75477 ?auto_75480 ) ) ( not ( = ?auto_75477 ?auto_75481 ) ) ( not ( = ?auto_75477 ?auto_75482 ) ) ( not ( = ?auto_75478 ?auto_75479 ) ) ( not ( = ?auto_75478 ?auto_75480 ) ) ( not ( = ?auto_75478 ?auto_75481 ) ) ( not ( = ?auto_75478 ?auto_75482 ) ) ( not ( = ?auto_75479 ?auto_75480 ) ) ( not ( = ?auto_75479 ?auto_75481 ) ) ( not ( = ?auto_75479 ?auto_75482 ) ) ( not ( = ?auto_75480 ?auto_75481 ) ) ( not ( = ?auto_75480 ?auto_75482 ) ) ( not ( = ?auto_75481 ?auto_75482 ) ) ( CLEAR ?auto_75479 ) ( ON ?auto_75480 ?auto_75481 ) ( CLEAR ?auto_75480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75476 ?auto_75477 ?auto_75478 ?auto_75479 ?auto_75480 )
      ( MAKE-6PILE ?auto_75476 ?auto_75477 ?auto_75478 ?auto_75479 ?auto_75480 ?auto_75481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75489 - BLOCK
      ?auto_75490 - BLOCK
      ?auto_75491 - BLOCK
      ?auto_75492 - BLOCK
      ?auto_75493 - BLOCK
      ?auto_75494 - BLOCK
    )
    :vars
    (
      ?auto_75495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75494 ?auto_75495 ) ( ON-TABLE ?auto_75489 ) ( ON ?auto_75490 ?auto_75489 ) ( ON ?auto_75491 ?auto_75490 ) ( not ( = ?auto_75489 ?auto_75490 ) ) ( not ( = ?auto_75489 ?auto_75491 ) ) ( not ( = ?auto_75489 ?auto_75492 ) ) ( not ( = ?auto_75489 ?auto_75493 ) ) ( not ( = ?auto_75489 ?auto_75494 ) ) ( not ( = ?auto_75489 ?auto_75495 ) ) ( not ( = ?auto_75490 ?auto_75491 ) ) ( not ( = ?auto_75490 ?auto_75492 ) ) ( not ( = ?auto_75490 ?auto_75493 ) ) ( not ( = ?auto_75490 ?auto_75494 ) ) ( not ( = ?auto_75490 ?auto_75495 ) ) ( not ( = ?auto_75491 ?auto_75492 ) ) ( not ( = ?auto_75491 ?auto_75493 ) ) ( not ( = ?auto_75491 ?auto_75494 ) ) ( not ( = ?auto_75491 ?auto_75495 ) ) ( not ( = ?auto_75492 ?auto_75493 ) ) ( not ( = ?auto_75492 ?auto_75494 ) ) ( not ( = ?auto_75492 ?auto_75495 ) ) ( not ( = ?auto_75493 ?auto_75494 ) ) ( not ( = ?auto_75493 ?auto_75495 ) ) ( not ( = ?auto_75494 ?auto_75495 ) ) ( ON ?auto_75493 ?auto_75494 ) ( CLEAR ?auto_75491 ) ( ON ?auto_75492 ?auto_75493 ) ( CLEAR ?auto_75492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75489 ?auto_75490 ?auto_75491 ?auto_75492 )
      ( MAKE-6PILE ?auto_75489 ?auto_75490 ?auto_75491 ?auto_75492 ?auto_75493 ?auto_75494 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75502 - BLOCK
      ?auto_75503 - BLOCK
      ?auto_75504 - BLOCK
      ?auto_75505 - BLOCK
      ?auto_75506 - BLOCK
      ?auto_75507 - BLOCK
    )
    :vars
    (
      ?auto_75508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75507 ?auto_75508 ) ( ON-TABLE ?auto_75502 ) ( ON ?auto_75503 ?auto_75502 ) ( ON ?auto_75504 ?auto_75503 ) ( not ( = ?auto_75502 ?auto_75503 ) ) ( not ( = ?auto_75502 ?auto_75504 ) ) ( not ( = ?auto_75502 ?auto_75505 ) ) ( not ( = ?auto_75502 ?auto_75506 ) ) ( not ( = ?auto_75502 ?auto_75507 ) ) ( not ( = ?auto_75502 ?auto_75508 ) ) ( not ( = ?auto_75503 ?auto_75504 ) ) ( not ( = ?auto_75503 ?auto_75505 ) ) ( not ( = ?auto_75503 ?auto_75506 ) ) ( not ( = ?auto_75503 ?auto_75507 ) ) ( not ( = ?auto_75503 ?auto_75508 ) ) ( not ( = ?auto_75504 ?auto_75505 ) ) ( not ( = ?auto_75504 ?auto_75506 ) ) ( not ( = ?auto_75504 ?auto_75507 ) ) ( not ( = ?auto_75504 ?auto_75508 ) ) ( not ( = ?auto_75505 ?auto_75506 ) ) ( not ( = ?auto_75505 ?auto_75507 ) ) ( not ( = ?auto_75505 ?auto_75508 ) ) ( not ( = ?auto_75506 ?auto_75507 ) ) ( not ( = ?auto_75506 ?auto_75508 ) ) ( not ( = ?auto_75507 ?auto_75508 ) ) ( ON ?auto_75506 ?auto_75507 ) ( CLEAR ?auto_75504 ) ( ON ?auto_75505 ?auto_75506 ) ( CLEAR ?auto_75505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75502 ?auto_75503 ?auto_75504 ?auto_75505 )
      ( MAKE-6PILE ?auto_75502 ?auto_75503 ?auto_75504 ?auto_75505 ?auto_75506 ?auto_75507 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75515 - BLOCK
      ?auto_75516 - BLOCK
      ?auto_75517 - BLOCK
      ?auto_75518 - BLOCK
      ?auto_75519 - BLOCK
      ?auto_75520 - BLOCK
    )
    :vars
    (
      ?auto_75521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75520 ?auto_75521 ) ( ON-TABLE ?auto_75515 ) ( ON ?auto_75516 ?auto_75515 ) ( not ( = ?auto_75515 ?auto_75516 ) ) ( not ( = ?auto_75515 ?auto_75517 ) ) ( not ( = ?auto_75515 ?auto_75518 ) ) ( not ( = ?auto_75515 ?auto_75519 ) ) ( not ( = ?auto_75515 ?auto_75520 ) ) ( not ( = ?auto_75515 ?auto_75521 ) ) ( not ( = ?auto_75516 ?auto_75517 ) ) ( not ( = ?auto_75516 ?auto_75518 ) ) ( not ( = ?auto_75516 ?auto_75519 ) ) ( not ( = ?auto_75516 ?auto_75520 ) ) ( not ( = ?auto_75516 ?auto_75521 ) ) ( not ( = ?auto_75517 ?auto_75518 ) ) ( not ( = ?auto_75517 ?auto_75519 ) ) ( not ( = ?auto_75517 ?auto_75520 ) ) ( not ( = ?auto_75517 ?auto_75521 ) ) ( not ( = ?auto_75518 ?auto_75519 ) ) ( not ( = ?auto_75518 ?auto_75520 ) ) ( not ( = ?auto_75518 ?auto_75521 ) ) ( not ( = ?auto_75519 ?auto_75520 ) ) ( not ( = ?auto_75519 ?auto_75521 ) ) ( not ( = ?auto_75520 ?auto_75521 ) ) ( ON ?auto_75519 ?auto_75520 ) ( ON ?auto_75518 ?auto_75519 ) ( CLEAR ?auto_75516 ) ( ON ?auto_75517 ?auto_75518 ) ( CLEAR ?auto_75517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75515 ?auto_75516 ?auto_75517 )
      ( MAKE-6PILE ?auto_75515 ?auto_75516 ?auto_75517 ?auto_75518 ?auto_75519 ?auto_75520 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75528 - BLOCK
      ?auto_75529 - BLOCK
      ?auto_75530 - BLOCK
      ?auto_75531 - BLOCK
      ?auto_75532 - BLOCK
      ?auto_75533 - BLOCK
    )
    :vars
    (
      ?auto_75534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75533 ?auto_75534 ) ( ON-TABLE ?auto_75528 ) ( ON ?auto_75529 ?auto_75528 ) ( not ( = ?auto_75528 ?auto_75529 ) ) ( not ( = ?auto_75528 ?auto_75530 ) ) ( not ( = ?auto_75528 ?auto_75531 ) ) ( not ( = ?auto_75528 ?auto_75532 ) ) ( not ( = ?auto_75528 ?auto_75533 ) ) ( not ( = ?auto_75528 ?auto_75534 ) ) ( not ( = ?auto_75529 ?auto_75530 ) ) ( not ( = ?auto_75529 ?auto_75531 ) ) ( not ( = ?auto_75529 ?auto_75532 ) ) ( not ( = ?auto_75529 ?auto_75533 ) ) ( not ( = ?auto_75529 ?auto_75534 ) ) ( not ( = ?auto_75530 ?auto_75531 ) ) ( not ( = ?auto_75530 ?auto_75532 ) ) ( not ( = ?auto_75530 ?auto_75533 ) ) ( not ( = ?auto_75530 ?auto_75534 ) ) ( not ( = ?auto_75531 ?auto_75532 ) ) ( not ( = ?auto_75531 ?auto_75533 ) ) ( not ( = ?auto_75531 ?auto_75534 ) ) ( not ( = ?auto_75532 ?auto_75533 ) ) ( not ( = ?auto_75532 ?auto_75534 ) ) ( not ( = ?auto_75533 ?auto_75534 ) ) ( ON ?auto_75532 ?auto_75533 ) ( ON ?auto_75531 ?auto_75532 ) ( CLEAR ?auto_75529 ) ( ON ?auto_75530 ?auto_75531 ) ( CLEAR ?auto_75530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75528 ?auto_75529 ?auto_75530 )
      ( MAKE-6PILE ?auto_75528 ?auto_75529 ?auto_75530 ?auto_75531 ?auto_75532 ?auto_75533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75541 - BLOCK
      ?auto_75542 - BLOCK
      ?auto_75543 - BLOCK
      ?auto_75544 - BLOCK
      ?auto_75545 - BLOCK
      ?auto_75546 - BLOCK
    )
    :vars
    (
      ?auto_75547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75546 ?auto_75547 ) ( ON-TABLE ?auto_75541 ) ( not ( = ?auto_75541 ?auto_75542 ) ) ( not ( = ?auto_75541 ?auto_75543 ) ) ( not ( = ?auto_75541 ?auto_75544 ) ) ( not ( = ?auto_75541 ?auto_75545 ) ) ( not ( = ?auto_75541 ?auto_75546 ) ) ( not ( = ?auto_75541 ?auto_75547 ) ) ( not ( = ?auto_75542 ?auto_75543 ) ) ( not ( = ?auto_75542 ?auto_75544 ) ) ( not ( = ?auto_75542 ?auto_75545 ) ) ( not ( = ?auto_75542 ?auto_75546 ) ) ( not ( = ?auto_75542 ?auto_75547 ) ) ( not ( = ?auto_75543 ?auto_75544 ) ) ( not ( = ?auto_75543 ?auto_75545 ) ) ( not ( = ?auto_75543 ?auto_75546 ) ) ( not ( = ?auto_75543 ?auto_75547 ) ) ( not ( = ?auto_75544 ?auto_75545 ) ) ( not ( = ?auto_75544 ?auto_75546 ) ) ( not ( = ?auto_75544 ?auto_75547 ) ) ( not ( = ?auto_75545 ?auto_75546 ) ) ( not ( = ?auto_75545 ?auto_75547 ) ) ( not ( = ?auto_75546 ?auto_75547 ) ) ( ON ?auto_75545 ?auto_75546 ) ( ON ?auto_75544 ?auto_75545 ) ( ON ?auto_75543 ?auto_75544 ) ( CLEAR ?auto_75541 ) ( ON ?auto_75542 ?auto_75543 ) ( CLEAR ?auto_75542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75541 ?auto_75542 )
      ( MAKE-6PILE ?auto_75541 ?auto_75542 ?auto_75543 ?auto_75544 ?auto_75545 ?auto_75546 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75554 - BLOCK
      ?auto_75555 - BLOCK
      ?auto_75556 - BLOCK
      ?auto_75557 - BLOCK
      ?auto_75558 - BLOCK
      ?auto_75559 - BLOCK
    )
    :vars
    (
      ?auto_75560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75559 ?auto_75560 ) ( ON-TABLE ?auto_75554 ) ( not ( = ?auto_75554 ?auto_75555 ) ) ( not ( = ?auto_75554 ?auto_75556 ) ) ( not ( = ?auto_75554 ?auto_75557 ) ) ( not ( = ?auto_75554 ?auto_75558 ) ) ( not ( = ?auto_75554 ?auto_75559 ) ) ( not ( = ?auto_75554 ?auto_75560 ) ) ( not ( = ?auto_75555 ?auto_75556 ) ) ( not ( = ?auto_75555 ?auto_75557 ) ) ( not ( = ?auto_75555 ?auto_75558 ) ) ( not ( = ?auto_75555 ?auto_75559 ) ) ( not ( = ?auto_75555 ?auto_75560 ) ) ( not ( = ?auto_75556 ?auto_75557 ) ) ( not ( = ?auto_75556 ?auto_75558 ) ) ( not ( = ?auto_75556 ?auto_75559 ) ) ( not ( = ?auto_75556 ?auto_75560 ) ) ( not ( = ?auto_75557 ?auto_75558 ) ) ( not ( = ?auto_75557 ?auto_75559 ) ) ( not ( = ?auto_75557 ?auto_75560 ) ) ( not ( = ?auto_75558 ?auto_75559 ) ) ( not ( = ?auto_75558 ?auto_75560 ) ) ( not ( = ?auto_75559 ?auto_75560 ) ) ( ON ?auto_75558 ?auto_75559 ) ( ON ?auto_75557 ?auto_75558 ) ( ON ?auto_75556 ?auto_75557 ) ( CLEAR ?auto_75554 ) ( ON ?auto_75555 ?auto_75556 ) ( CLEAR ?auto_75555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75554 ?auto_75555 )
      ( MAKE-6PILE ?auto_75554 ?auto_75555 ?auto_75556 ?auto_75557 ?auto_75558 ?auto_75559 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75567 - BLOCK
      ?auto_75568 - BLOCK
      ?auto_75569 - BLOCK
      ?auto_75570 - BLOCK
      ?auto_75571 - BLOCK
      ?auto_75572 - BLOCK
    )
    :vars
    (
      ?auto_75573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75572 ?auto_75573 ) ( not ( = ?auto_75567 ?auto_75568 ) ) ( not ( = ?auto_75567 ?auto_75569 ) ) ( not ( = ?auto_75567 ?auto_75570 ) ) ( not ( = ?auto_75567 ?auto_75571 ) ) ( not ( = ?auto_75567 ?auto_75572 ) ) ( not ( = ?auto_75567 ?auto_75573 ) ) ( not ( = ?auto_75568 ?auto_75569 ) ) ( not ( = ?auto_75568 ?auto_75570 ) ) ( not ( = ?auto_75568 ?auto_75571 ) ) ( not ( = ?auto_75568 ?auto_75572 ) ) ( not ( = ?auto_75568 ?auto_75573 ) ) ( not ( = ?auto_75569 ?auto_75570 ) ) ( not ( = ?auto_75569 ?auto_75571 ) ) ( not ( = ?auto_75569 ?auto_75572 ) ) ( not ( = ?auto_75569 ?auto_75573 ) ) ( not ( = ?auto_75570 ?auto_75571 ) ) ( not ( = ?auto_75570 ?auto_75572 ) ) ( not ( = ?auto_75570 ?auto_75573 ) ) ( not ( = ?auto_75571 ?auto_75572 ) ) ( not ( = ?auto_75571 ?auto_75573 ) ) ( not ( = ?auto_75572 ?auto_75573 ) ) ( ON ?auto_75571 ?auto_75572 ) ( ON ?auto_75570 ?auto_75571 ) ( ON ?auto_75569 ?auto_75570 ) ( ON ?auto_75568 ?auto_75569 ) ( ON ?auto_75567 ?auto_75568 ) ( CLEAR ?auto_75567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75567 )
      ( MAKE-6PILE ?auto_75567 ?auto_75568 ?auto_75569 ?auto_75570 ?auto_75571 ?auto_75572 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75580 - BLOCK
      ?auto_75581 - BLOCK
      ?auto_75582 - BLOCK
      ?auto_75583 - BLOCK
      ?auto_75584 - BLOCK
      ?auto_75585 - BLOCK
    )
    :vars
    (
      ?auto_75586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75585 ?auto_75586 ) ( not ( = ?auto_75580 ?auto_75581 ) ) ( not ( = ?auto_75580 ?auto_75582 ) ) ( not ( = ?auto_75580 ?auto_75583 ) ) ( not ( = ?auto_75580 ?auto_75584 ) ) ( not ( = ?auto_75580 ?auto_75585 ) ) ( not ( = ?auto_75580 ?auto_75586 ) ) ( not ( = ?auto_75581 ?auto_75582 ) ) ( not ( = ?auto_75581 ?auto_75583 ) ) ( not ( = ?auto_75581 ?auto_75584 ) ) ( not ( = ?auto_75581 ?auto_75585 ) ) ( not ( = ?auto_75581 ?auto_75586 ) ) ( not ( = ?auto_75582 ?auto_75583 ) ) ( not ( = ?auto_75582 ?auto_75584 ) ) ( not ( = ?auto_75582 ?auto_75585 ) ) ( not ( = ?auto_75582 ?auto_75586 ) ) ( not ( = ?auto_75583 ?auto_75584 ) ) ( not ( = ?auto_75583 ?auto_75585 ) ) ( not ( = ?auto_75583 ?auto_75586 ) ) ( not ( = ?auto_75584 ?auto_75585 ) ) ( not ( = ?auto_75584 ?auto_75586 ) ) ( not ( = ?auto_75585 ?auto_75586 ) ) ( ON ?auto_75584 ?auto_75585 ) ( ON ?auto_75583 ?auto_75584 ) ( ON ?auto_75582 ?auto_75583 ) ( ON ?auto_75581 ?auto_75582 ) ( ON ?auto_75580 ?auto_75581 ) ( CLEAR ?auto_75580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75580 )
      ( MAKE-6PILE ?auto_75580 ?auto_75581 ?auto_75582 ?auto_75583 ?auto_75584 ?auto_75585 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75594 - BLOCK
      ?auto_75595 - BLOCK
      ?auto_75596 - BLOCK
      ?auto_75597 - BLOCK
      ?auto_75598 - BLOCK
      ?auto_75599 - BLOCK
      ?auto_75600 - BLOCK
    )
    :vars
    (
      ?auto_75601 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75599 ) ( ON ?auto_75600 ?auto_75601 ) ( CLEAR ?auto_75600 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75594 ) ( ON ?auto_75595 ?auto_75594 ) ( ON ?auto_75596 ?auto_75595 ) ( ON ?auto_75597 ?auto_75596 ) ( ON ?auto_75598 ?auto_75597 ) ( ON ?auto_75599 ?auto_75598 ) ( not ( = ?auto_75594 ?auto_75595 ) ) ( not ( = ?auto_75594 ?auto_75596 ) ) ( not ( = ?auto_75594 ?auto_75597 ) ) ( not ( = ?auto_75594 ?auto_75598 ) ) ( not ( = ?auto_75594 ?auto_75599 ) ) ( not ( = ?auto_75594 ?auto_75600 ) ) ( not ( = ?auto_75594 ?auto_75601 ) ) ( not ( = ?auto_75595 ?auto_75596 ) ) ( not ( = ?auto_75595 ?auto_75597 ) ) ( not ( = ?auto_75595 ?auto_75598 ) ) ( not ( = ?auto_75595 ?auto_75599 ) ) ( not ( = ?auto_75595 ?auto_75600 ) ) ( not ( = ?auto_75595 ?auto_75601 ) ) ( not ( = ?auto_75596 ?auto_75597 ) ) ( not ( = ?auto_75596 ?auto_75598 ) ) ( not ( = ?auto_75596 ?auto_75599 ) ) ( not ( = ?auto_75596 ?auto_75600 ) ) ( not ( = ?auto_75596 ?auto_75601 ) ) ( not ( = ?auto_75597 ?auto_75598 ) ) ( not ( = ?auto_75597 ?auto_75599 ) ) ( not ( = ?auto_75597 ?auto_75600 ) ) ( not ( = ?auto_75597 ?auto_75601 ) ) ( not ( = ?auto_75598 ?auto_75599 ) ) ( not ( = ?auto_75598 ?auto_75600 ) ) ( not ( = ?auto_75598 ?auto_75601 ) ) ( not ( = ?auto_75599 ?auto_75600 ) ) ( not ( = ?auto_75599 ?auto_75601 ) ) ( not ( = ?auto_75600 ?auto_75601 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75600 ?auto_75601 )
      ( !STACK ?auto_75600 ?auto_75599 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75609 - BLOCK
      ?auto_75610 - BLOCK
      ?auto_75611 - BLOCK
      ?auto_75612 - BLOCK
      ?auto_75613 - BLOCK
      ?auto_75614 - BLOCK
      ?auto_75615 - BLOCK
    )
    :vars
    (
      ?auto_75616 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75614 ) ( ON ?auto_75615 ?auto_75616 ) ( CLEAR ?auto_75615 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75609 ) ( ON ?auto_75610 ?auto_75609 ) ( ON ?auto_75611 ?auto_75610 ) ( ON ?auto_75612 ?auto_75611 ) ( ON ?auto_75613 ?auto_75612 ) ( ON ?auto_75614 ?auto_75613 ) ( not ( = ?auto_75609 ?auto_75610 ) ) ( not ( = ?auto_75609 ?auto_75611 ) ) ( not ( = ?auto_75609 ?auto_75612 ) ) ( not ( = ?auto_75609 ?auto_75613 ) ) ( not ( = ?auto_75609 ?auto_75614 ) ) ( not ( = ?auto_75609 ?auto_75615 ) ) ( not ( = ?auto_75609 ?auto_75616 ) ) ( not ( = ?auto_75610 ?auto_75611 ) ) ( not ( = ?auto_75610 ?auto_75612 ) ) ( not ( = ?auto_75610 ?auto_75613 ) ) ( not ( = ?auto_75610 ?auto_75614 ) ) ( not ( = ?auto_75610 ?auto_75615 ) ) ( not ( = ?auto_75610 ?auto_75616 ) ) ( not ( = ?auto_75611 ?auto_75612 ) ) ( not ( = ?auto_75611 ?auto_75613 ) ) ( not ( = ?auto_75611 ?auto_75614 ) ) ( not ( = ?auto_75611 ?auto_75615 ) ) ( not ( = ?auto_75611 ?auto_75616 ) ) ( not ( = ?auto_75612 ?auto_75613 ) ) ( not ( = ?auto_75612 ?auto_75614 ) ) ( not ( = ?auto_75612 ?auto_75615 ) ) ( not ( = ?auto_75612 ?auto_75616 ) ) ( not ( = ?auto_75613 ?auto_75614 ) ) ( not ( = ?auto_75613 ?auto_75615 ) ) ( not ( = ?auto_75613 ?auto_75616 ) ) ( not ( = ?auto_75614 ?auto_75615 ) ) ( not ( = ?auto_75614 ?auto_75616 ) ) ( not ( = ?auto_75615 ?auto_75616 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75615 ?auto_75616 )
      ( !STACK ?auto_75615 ?auto_75614 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75624 - BLOCK
      ?auto_75625 - BLOCK
      ?auto_75626 - BLOCK
      ?auto_75627 - BLOCK
      ?auto_75628 - BLOCK
      ?auto_75629 - BLOCK
      ?auto_75630 - BLOCK
    )
    :vars
    (
      ?auto_75631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75630 ?auto_75631 ) ( ON-TABLE ?auto_75624 ) ( ON ?auto_75625 ?auto_75624 ) ( ON ?auto_75626 ?auto_75625 ) ( ON ?auto_75627 ?auto_75626 ) ( ON ?auto_75628 ?auto_75627 ) ( not ( = ?auto_75624 ?auto_75625 ) ) ( not ( = ?auto_75624 ?auto_75626 ) ) ( not ( = ?auto_75624 ?auto_75627 ) ) ( not ( = ?auto_75624 ?auto_75628 ) ) ( not ( = ?auto_75624 ?auto_75629 ) ) ( not ( = ?auto_75624 ?auto_75630 ) ) ( not ( = ?auto_75624 ?auto_75631 ) ) ( not ( = ?auto_75625 ?auto_75626 ) ) ( not ( = ?auto_75625 ?auto_75627 ) ) ( not ( = ?auto_75625 ?auto_75628 ) ) ( not ( = ?auto_75625 ?auto_75629 ) ) ( not ( = ?auto_75625 ?auto_75630 ) ) ( not ( = ?auto_75625 ?auto_75631 ) ) ( not ( = ?auto_75626 ?auto_75627 ) ) ( not ( = ?auto_75626 ?auto_75628 ) ) ( not ( = ?auto_75626 ?auto_75629 ) ) ( not ( = ?auto_75626 ?auto_75630 ) ) ( not ( = ?auto_75626 ?auto_75631 ) ) ( not ( = ?auto_75627 ?auto_75628 ) ) ( not ( = ?auto_75627 ?auto_75629 ) ) ( not ( = ?auto_75627 ?auto_75630 ) ) ( not ( = ?auto_75627 ?auto_75631 ) ) ( not ( = ?auto_75628 ?auto_75629 ) ) ( not ( = ?auto_75628 ?auto_75630 ) ) ( not ( = ?auto_75628 ?auto_75631 ) ) ( not ( = ?auto_75629 ?auto_75630 ) ) ( not ( = ?auto_75629 ?auto_75631 ) ) ( not ( = ?auto_75630 ?auto_75631 ) ) ( CLEAR ?auto_75628 ) ( ON ?auto_75629 ?auto_75630 ) ( CLEAR ?auto_75629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75624 ?auto_75625 ?auto_75626 ?auto_75627 ?auto_75628 ?auto_75629 )
      ( MAKE-7PILE ?auto_75624 ?auto_75625 ?auto_75626 ?auto_75627 ?auto_75628 ?auto_75629 ?auto_75630 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75639 - BLOCK
      ?auto_75640 - BLOCK
      ?auto_75641 - BLOCK
      ?auto_75642 - BLOCK
      ?auto_75643 - BLOCK
      ?auto_75644 - BLOCK
      ?auto_75645 - BLOCK
    )
    :vars
    (
      ?auto_75646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75645 ?auto_75646 ) ( ON-TABLE ?auto_75639 ) ( ON ?auto_75640 ?auto_75639 ) ( ON ?auto_75641 ?auto_75640 ) ( ON ?auto_75642 ?auto_75641 ) ( ON ?auto_75643 ?auto_75642 ) ( not ( = ?auto_75639 ?auto_75640 ) ) ( not ( = ?auto_75639 ?auto_75641 ) ) ( not ( = ?auto_75639 ?auto_75642 ) ) ( not ( = ?auto_75639 ?auto_75643 ) ) ( not ( = ?auto_75639 ?auto_75644 ) ) ( not ( = ?auto_75639 ?auto_75645 ) ) ( not ( = ?auto_75639 ?auto_75646 ) ) ( not ( = ?auto_75640 ?auto_75641 ) ) ( not ( = ?auto_75640 ?auto_75642 ) ) ( not ( = ?auto_75640 ?auto_75643 ) ) ( not ( = ?auto_75640 ?auto_75644 ) ) ( not ( = ?auto_75640 ?auto_75645 ) ) ( not ( = ?auto_75640 ?auto_75646 ) ) ( not ( = ?auto_75641 ?auto_75642 ) ) ( not ( = ?auto_75641 ?auto_75643 ) ) ( not ( = ?auto_75641 ?auto_75644 ) ) ( not ( = ?auto_75641 ?auto_75645 ) ) ( not ( = ?auto_75641 ?auto_75646 ) ) ( not ( = ?auto_75642 ?auto_75643 ) ) ( not ( = ?auto_75642 ?auto_75644 ) ) ( not ( = ?auto_75642 ?auto_75645 ) ) ( not ( = ?auto_75642 ?auto_75646 ) ) ( not ( = ?auto_75643 ?auto_75644 ) ) ( not ( = ?auto_75643 ?auto_75645 ) ) ( not ( = ?auto_75643 ?auto_75646 ) ) ( not ( = ?auto_75644 ?auto_75645 ) ) ( not ( = ?auto_75644 ?auto_75646 ) ) ( not ( = ?auto_75645 ?auto_75646 ) ) ( CLEAR ?auto_75643 ) ( ON ?auto_75644 ?auto_75645 ) ( CLEAR ?auto_75644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75639 ?auto_75640 ?auto_75641 ?auto_75642 ?auto_75643 ?auto_75644 )
      ( MAKE-7PILE ?auto_75639 ?auto_75640 ?auto_75641 ?auto_75642 ?auto_75643 ?auto_75644 ?auto_75645 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75654 - BLOCK
      ?auto_75655 - BLOCK
      ?auto_75656 - BLOCK
      ?auto_75657 - BLOCK
      ?auto_75658 - BLOCK
      ?auto_75659 - BLOCK
      ?auto_75660 - BLOCK
    )
    :vars
    (
      ?auto_75661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75660 ?auto_75661 ) ( ON-TABLE ?auto_75654 ) ( ON ?auto_75655 ?auto_75654 ) ( ON ?auto_75656 ?auto_75655 ) ( ON ?auto_75657 ?auto_75656 ) ( not ( = ?auto_75654 ?auto_75655 ) ) ( not ( = ?auto_75654 ?auto_75656 ) ) ( not ( = ?auto_75654 ?auto_75657 ) ) ( not ( = ?auto_75654 ?auto_75658 ) ) ( not ( = ?auto_75654 ?auto_75659 ) ) ( not ( = ?auto_75654 ?auto_75660 ) ) ( not ( = ?auto_75654 ?auto_75661 ) ) ( not ( = ?auto_75655 ?auto_75656 ) ) ( not ( = ?auto_75655 ?auto_75657 ) ) ( not ( = ?auto_75655 ?auto_75658 ) ) ( not ( = ?auto_75655 ?auto_75659 ) ) ( not ( = ?auto_75655 ?auto_75660 ) ) ( not ( = ?auto_75655 ?auto_75661 ) ) ( not ( = ?auto_75656 ?auto_75657 ) ) ( not ( = ?auto_75656 ?auto_75658 ) ) ( not ( = ?auto_75656 ?auto_75659 ) ) ( not ( = ?auto_75656 ?auto_75660 ) ) ( not ( = ?auto_75656 ?auto_75661 ) ) ( not ( = ?auto_75657 ?auto_75658 ) ) ( not ( = ?auto_75657 ?auto_75659 ) ) ( not ( = ?auto_75657 ?auto_75660 ) ) ( not ( = ?auto_75657 ?auto_75661 ) ) ( not ( = ?auto_75658 ?auto_75659 ) ) ( not ( = ?auto_75658 ?auto_75660 ) ) ( not ( = ?auto_75658 ?auto_75661 ) ) ( not ( = ?auto_75659 ?auto_75660 ) ) ( not ( = ?auto_75659 ?auto_75661 ) ) ( not ( = ?auto_75660 ?auto_75661 ) ) ( ON ?auto_75659 ?auto_75660 ) ( CLEAR ?auto_75657 ) ( ON ?auto_75658 ?auto_75659 ) ( CLEAR ?auto_75658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75654 ?auto_75655 ?auto_75656 ?auto_75657 ?auto_75658 )
      ( MAKE-7PILE ?auto_75654 ?auto_75655 ?auto_75656 ?auto_75657 ?auto_75658 ?auto_75659 ?auto_75660 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75669 - BLOCK
      ?auto_75670 - BLOCK
      ?auto_75671 - BLOCK
      ?auto_75672 - BLOCK
      ?auto_75673 - BLOCK
      ?auto_75674 - BLOCK
      ?auto_75675 - BLOCK
    )
    :vars
    (
      ?auto_75676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75675 ?auto_75676 ) ( ON-TABLE ?auto_75669 ) ( ON ?auto_75670 ?auto_75669 ) ( ON ?auto_75671 ?auto_75670 ) ( ON ?auto_75672 ?auto_75671 ) ( not ( = ?auto_75669 ?auto_75670 ) ) ( not ( = ?auto_75669 ?auto_75671 ) ) ( not ( = ?auto_75669 ?auto_75672 ) ) ( not ( = ?auto_75669 ?auto_75673 ) ) ( not ( = ?auto_75669 ?auto_75674 ) ) ( not ( = ?auto_75669 ?auto_75675 ) ) ( not ( = ?auto_75669 ?auto_75676 ) ) ( not ( = ?auto_75670 ?auto_75671 ) ) ( not ( = ?auto_75670 ?auto_75672 ) ) ( not ( = ?auto_75670 ?auto_75673 ) ) ( not ( = ?auto_75670 ?auto_75674 ) ) ( not ( = ?auto_75670 ?auto_75675 ) ) ( not ( = ?auto_75670 ?auto_75676 ) ) ( not ( = ?auto_75671 ?auto_75672 ) ) ( not ( = ?auto_75671 ?auto_75673 ) ) ( not ( = ?auto_75671 ?auto_75674 ) ) ( not ( = ?auto_75671 ?auto_75675 ) ) ( not ( = ?auto_75671 ?auto_75676 ) ) ( not ( = ?auto_75672 ?auto_75673 ) ) ( not ( = ?auto_75672 ?auto_75674 ) ) ( not ( = ?auto_75672 ?auto_75675 ) ) ( not ( = ?auto_75672 ?auto_75676 ) ) ( not ( = ?auto_75673 ?auto_75674 ) ) ( not ( = ?auto_75673 ?auto_75675 ) ) ( not ( = ?auto_75673 ?auto_75676 ) ) ( not ( = ?auto_75674 ?auto_75675 ) ) ( not ( = ?auto_75674 ?auto_75676 ) ) ( not ( = ?auto_75675 ?auto_75676 ) ) ( ON ?auto_75674 ?auto_75675 ) ( CLEAR ?auto_75672 ) ( ON ?auto_75673 ?auto_75674 ) ( CLEAR ?auto_75673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75669 ?auto_75670 ?auto_75671 ?auto_75672 ?auto_75673 )
      ( MAKE-7PILE ?auto_75669 ?auto_75670 ?auto_75671 ?auto_75672 ?auto_75673 ?auto_75674 ?auto_75675 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75684 - BLOCK
      ?auto_75685 - BLOCK
      ?auto_75686 - BLOCK
      ?auto_75687 - BLOCK
      ?auto_75688 - BLOCK
      ?auto_75689 - BLOCK
      ?auto_75690 - BLOCK
    )
    :vars
    (
      ?auto_75691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75690 ?auto_75691 ) ( ON-TABLE ?auto_75684 ) ( ON ?auto_75685 ?auto_75684 ) ( ON ?auto_75686 ?auto_75685 ) ( not ( = ?auto_75684 ?auto_75685 ) ) ( not ( = ?auto_75684 ?auto_75686 ) ) ( not ( = ?auto_75684 ?auto_75687 ) ) ( not ( = ?auto_75684 ?auto_75688 ) ) ( not ( = ?auto_75684 ?auto_75689 ) ) ( not ( = ?auto_75684 ?auto_75690 ) ) ( not ( = ?auto_75684 ?auto_75691 ) ) ( not ( = ?auto_75685 ?auto_75686 ) ) ( not ( = ?auto_75685 ?auto_75687 ) ) ( not ( = ?auto_75685 ?auto_75688 ) ) ( not ( = ?auto_75685 ?auto_75689 ) ) ( not ( = ?auto_75685 ?auto_75690 ) ) ( not ( = ?auto_75685 ?auto_75691 ) ) ( not ( = ?auto_75686 ?auto_75687 ) ) ( not ( = ?auto_75686 ?auto_75688 ) ) ( not ( = ?auto_75686 ?auto_75689 ) ) ( not ( = ?auto_75686 ?auto_75690 ) ) ( not ( = ?auto_75686 ?auto_75691 ) ) ( not ( = ?auto_75687 ?auto_75688 ) ) ( not ( = ?auto_75687 ?auto_75689 ) ) ( not ( = ?auto_75687 ?auto_75690 ) ) ( not ( = ?auto_75687 ?auto_75691 ) ) ( not ( = ?auto_75688 ?auto_75689 ) ) ( not ( = ?auto_75688 ?auto_75690 ) ) ( not ( = ?auto_75688 ?auto_75691 ) ) ( not ( = ?auto_75689 ?auto_75690 ) ) ( not ( = ?auto_75689 ?auto_75691 ) ) ( not ( = ?auto_75690 ?auto_75691 ) ) ( ON ?auto_75689 ?auto_75690 ) ( ON ?auto_75688 ?auto_75689 ) ( CLEAR ?auto_75686 ) ( ON ?auto_75687 ?auto_75688 ) ( CLEAR ?auto_75687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75684 ?auto_75685 ?auto_75686 ?auto_75687 )
      ( MAKE-7PILE ?auto_75684 ?auto_75685 ?auto_75686 ?auto_75687 ?auto_75688 ?auto_75689 ?auto_75690 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75699 - BLOCK
      ?auto_75700 - BLOCK
      ?auto_75701 - BLOCK
      ?auto_75702 - BLOCK
      ?auto_75703 - BLOCK
      ?auto_75704 - BLOCK
      ?auto_75705 - BLOCK
    )
    :vars
    (
      ?auto_75706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75705 ?auto_75706 ) ( ON-TABLE ?auto_75699 ) ( ON ?auto_75700 ?auto_75699 ) ( ON ?auto_75701 ?auto_75700 ) ( not ( = ?auto_75699 ?auto_75700 ) ) ( not ( = ?auto_75699 ?auto_75701 ) ) ( not ( = ?auto_75699 ?auto_75702 ) ) ( not ( = ?auto_75699 ?auto_75703 ) ) ( not ( = ?auto_75699 ?auto_75704 ) ) ( not ( = ?auto_75699 ?auto_75705 ) ) ( not ( = ?auto_75699 ?auto_75706 ) ) ( not ( = ?auto_75700 ?auto_75701 ) ) ( not ( = ?auto_75700 ?auto_75702 ) ) ( not ( = ?auto_75700 ?auto_75703 ) ) ( not ( = ?auto_75700 ?auto_75704 ) ) ( not ( = ?auto_75700 ?auto_75705 ) ) ( not ( = ?auto_75700 ?auto_75706 ) ) ( not ( = ?auto_75701 ?auto_75702 ) ) ( not ( = ?auto_75701 ?auto_75703 ) ) ( not ( = ?auto_75701 ?auto_75704 ) ) ( not ( = ?auto_75701 ?auto_75705 ) ) ( not ( = ?auto_75701 ?auto_75706 ) ) ( not ( = ?auto_75702 ?auto_75703 ) ) ( not ( = ?auto_75702 ?auto_75704 ) ) ( not ( = ?auto_75702 ?auto_75705 ) ) ( not ( = ?auto_75702 ?auto_75706 ) ) ( not ( = ?auto_75703 ?auto_75704 ) ) ( not ( = ?auto_75703 ?auto_75705 ) ) ( not ( = ?auto_75703 ?auto_75706 ) ) ( not ( = ?auto_75704 ?auto_75705 ) ) ( not ( = ?auto_75704 ?auto_75706 ) ) ( not ( = ?auto_75705 ?auto_75706 ) ) ( ON ?auto_75704 ?auto_75705 ) ( ON ?auto_75703 ?auto_75704 ) ( CLEAR ?auto_75701 ) ( ON ?auto_75702 ?auto_75703 ) ( CLEAR ?auto_75702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75699 ?auto_75700 ?auto_75701 ?auto_75702 )
      ( MAKE-7PILE ?auto_75699 ?auto_75700 ?auto_75701 ?auto_75702 ?auto_75703 ?auto_75704 ?auto_75705 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75714 - BLOCK
      ?auto_75715 - BLOCK
      ?auto_75716 - BLOCK
      ?auto_75717 - BLOCK
      ?auto_75718 - BLOCK
      ?auto_75719 - BLOCK
      ?auto_75720 - BLOCK
    )
    :vars
    (
      ?auto_75721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75720 ?auto_75721 ) ( ON-TABLE ?auto_75714 ) ( ON ?auto_75715 ?auto_75714 ) ( not ( = ?auto_75714 ?auto_75715 ) ) ( not ( = ?auto_75714 ?auto_75716 ) ) ( not ( = ?auto_75714 ?auto_75717 ) ) ( not ( = ?auto_75714 ?auto_75718 ) ) ( not ( = ?auto_75714 ?auto_75719 ) ) ( not ( = ?auto_75714 ?auto_75720 ) ) ( not ( = ?auto_75714 ?auto_75721 ) ) ( not ( = ?auto_75715 ?auto_75716 ) ) ( not ( = ?auto_75715 ?auto_75717 ) ) ( not ( = ?auto_75715 ?auto_75718 ) ) ( not ( = ?auto_75715 ?auto_75719 ) ) ( not ( = ?auto_75715 ?auto_75720 ) ) ( not ( = ?auto_75715 ?auto_75721 ) ) ( not ( = ?auto_75716 ?auto_75717 ) ) ( not ( = ?auto_75716 ?auto_75718 ) ) ( not ( = ?auto_75716 ?auto_75719 ) ) ( not ( = ?auto_75716 ?auto_75720 ) ) ( not ( = ?auto_75716 ?auto_75721 ) ) ( not ( = ?auto_75717 ?auto_75718 ) ) ( not ( = ?auto_75717 ?auto_75719 ) ) ( not ( = ?auto_75717 ?auto_75720 ) ) ( not ( = ?auto_75717 ?auto_75721 ) ) ( not ( = ?auto_75718 ?auto_75719 ) ) ( not ( = ?auto_75718 ?auto_75720 ) ) ( not ( = ?auto_75718 ?auto_75721 ) ) ( not ( = ?auto_75719 ?auto_75720 ) ) ( not ( = ?auto_75719 ?auto_75721 ) ) ( not ( = ?auto_75720 ?auto_75721 ) ) ( ON ?auto_75719 ?auto_75720 ) ( ON ?auto_75718 ?auto_75719 ) ( ON ?auto_75717 ?auto_75718 ) ( CLEAR ?auto_75715 ) ( ON ?auto_75716 ?auto_75717 ) ( CLEAR ?auto_75716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75714 ?auto_75715 ?auto_75716 )
      ( MAKE-7PILE ?auto_75714 ?auto_75715 ?auto_75716 ?auto_75717 ?auto_75718 ?auto_75719 ?auto_75720 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75729 - BLOCK
      ?auto_75730 - BLOCK
      ?auto_75731 - BLOCK
      ?auto_75732 - BLOCK
      ?auto_75733 - BLOCK
      ?auto_75734 - BLOCK
      ?auto_75735 - BLOCK
    )
    :vars
    (
      ?auto_75736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75735 ?auto_75736 ) ( ON-TABLE ?auto_75729 ) ( ON ?auto_75730 ?auto_75729 ) ( not ( = ?auto_75729 ?auto_75730 ) ) ( not ( = ?auto_75729 ?auto_75731 ) ) ( not ( = ?auto_75729 ?auto_75732 ) ) ( not ( = ?auto_75729 ?auto_75733 ) ) ( not ( = ?auto_75729 ?auto_75734 ) ) ( not ( = ?auto_75729 ?auto_75735 ) ) ( not ( = ?auto_75729 ?auto_75736 ) ) ( not ( = ?auto_75730 ?auto_75731 ) ) ( not ( = ?auto_75730 ?auto_75732 ) ) ( not ( = ?auto_75730 ?auto_75733 ) ) ( not ( = ?auto_75730 ?auto_75734 ) ) ( not ( = ?auto_75730 ?auto_75735 ) ) ( not ( = ?auto_75730 ?auto_75736 ) ) ( not ( = ?auto_75731 ?auto_75732 ) ) ( not ( = ?auto_75731 ?auto_75733 ) ) ( not ( = ?auto_75731 ?auto_75734 ) ) ( not ( = ?auto_75731 ?auto_75735 ) ) ( not ( = ?auto_75731 ?auto_75736 ) ) ( not ( = ?auto_75732 ?auto_75733 ) ) ( not ( = ?auto_75732 ?auto_75734 ) ) ( not ( = ?auto_75732 ?auto_75735 ) ) ( not ( = ?auto_75732 ?auto_75736 ) ) ( not ( = ?auto_75733 ?auto_75734 ) ) ( not ( = ?auto_75733 ?auto_75735 ) ) ( not ( = ?auto_75733 ?auto_75736 ) ) ( not ( = ?auto_75734 ?auto_75735 ) ) ( not ( = ?auto_75734 ?auto_75736 ) ) ( not ( = ?auto_75735 ?auto_75736 ) ) ( ON ?auto_75734 ?auto_75735 ) ( ON ?auto_75733 ?auto_75734 ) ( ON ?auto_75732 ?auto_75733 ) ( CLEAR ?auto_75730 ) ( ON ?auto_75731 ?auto_75732 ) ( CLEAR ?auto_75731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75729 ?auto_75730 ?auto_75731 )
      ( MAKE-7PILE ?auto_75729 ?auto_75730 ?auto_75731 ?auto_75732 ?auto_75733 ?auto_75734 ?auto_75735 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75744 - BLOCK
      ?auto_75745 - BLOCK
      ?auto_75746 - BLOCK
      ?auto_75747 - BLOCK
      ?auto_75748 - BLOCK
      ?auto_75749 - BLOCK
      ?auto_75750 - BLOCK
    )
    :vars
    (
      ?auto_75751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75750 ?auto_75751 ) ( ON-TABLE ?auto_75744 ) ( not ( = ?auto_75744 ?auto_75745 ) ) ( not ( = ?auto_75744 ?auto_75746 ) ) ( not ( = ?auto_75744 ?auto_75747 ) ) ( not ( = ?auto_75744 ?auto_75748 ) ) ( not ( = ?auto_75744 ?auto_75749 ) ) ( not ( = ?auto_75744 ?auto_75750 ) ) ( not ( = ?auto_75744 ?auto_75751 ) ) ( not ( = ?auto_75745 ?auto_75746 ) ) ( not ( = ?auto_75745 ?auto_75747 ) ) ( not ( = ?auto_75745 ?auto_75748 ) ) ( not ( = ?auto_75745 ?auto_75749 ) ) ( not ( = ?auto_75745 ?auto_75750 ) ) ( not ( = ?auto_75745 ?auto_75751 ) ) ( not ( = ?auto_75746 ?auto_75747 ) ) ( not ( = ?auto_75746 ?auto_75748 ) ) ( not ( = ?auto_75746 ?auto_75749 ) ) ( not ( = ?auto_75746 ?auto_75750 ) ) ( not ( = ?auto_75746 ?auto_75751 ) ) ( not ( = ?auto_75747 ?auto_75748 ) ) ( not ( = ?auto_75747 ?auto_75749 ) ) ( not ( = ?auto_75747 ?auto_75750 ) ) ( not ( = ?auto_75747 ?auto_75751 ) ) ( not ( = ?auto_75748 ?auto_75749 ) ) ( not ( = ?auto_75748 ?auto_75750 ) ) ( not ( = ?auto_75748 ?auto_75751 ) ) ( not ( = ?auto_75749 ?auto_75750 ) ) ( not ( = ?auto_75749 ?auto_75751 ) ) ( not ( = ?auto_75750 ?auto_75751 ) ) ( ON ?auto_75749 ?auto_75750 ) ( ON ?auto_75748 ?auto_75749 ) ( ON ?auto_75747 ?auto_75748 ) ( ON ?auto_75746 ?auto_75747 ) ( CLEAR ?auto_75744 ) ( ON ?auto_75745 ?auto_75746 ) ( CLEAR ?auto_75745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75744 ?auto_75745 )
      ( MAKE-7PILE ?auto_75744 ?auto_75745 ?auto_75746 ?auto_75747 ?auto_75748 ?auto_75749 ?auto_75750 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75759 - BLOCK
      ?auto_75760 - BLOCK
      ?auto_75761 - BLOCK
      ?auto_75762 - BLOCK
      ?auto_75763 - BLOCK
      ?auto_75764 - BLOCK
      ?auto_75765 - BLOCK
    )
    :vars
    (
      ?auto_75766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75765 ?auto_75766 ) ( ON-TABLE ?auto_75759 ) ( not ( = ?auto_75759 ?auto_75760 ) ) ( not ( = ?auto_75759 ?auto_75761 ) ) ( not ( = ?auto_75759 ?auto_75762 ) ) ( not ( = ?auto_75759 ?auto_75763 ) ) ( not ( = ?auto_75759 ?auto_75764 ) ) ( not ( = ?auto_75759 ?auto_75765 ) ) ( not ( = ?auto_75759 ?auto_75766 ) ) ( not ( = ?auto_75760 ?auto_75761 ) ) ( not ( = ?auto_75760 ?auto_75762 ) ) ( not ( = ?auto_75760 ?auto_75763 ) ) ( not ( = ?auto_75760 ?auto_75764 ) ) ( not ( = ?auto_75760 ?auto_75765 ) ) ( not ( = ?auto_75760 ?auto_75766 ) ) ( not ( = ?auto_75761 ?auto_75762 ) ) ( not ( = ?auto_75761 ?auto_75763 ) ) ( not ( = ?auto_75761 ?auto_75764 ) ) ( not ( = ?auto_75761 ?auto_75765 ) ) ( not ( = ?auto_75761 ?auto_75766 ) ) ( not ( = ?auto_75762 ?auto_75763 ) ) ( not ( = ?auto_75762 ?auto_75764 ) ) ( not ( = ?auto_75762 ?auto_75765 ) ) ( not ( = ?auto_75762 ?auto_75766 ) ) ( not ( = ?auto_75763 ?auto_75764 ) ) ( not ( = ?auto_75763 ?auto_75765 ) ) ( not ( = ?auto_75763 ?auto_75766 ) ) ( not ( = ?auto_75764 ?auto_75765 ) ) ( not ( = ?auto_75764 ?auto_75766 ) ) ( not ( = ?auto_75765 ?auto_75766 ) ) ( ON ?auto_75764 ?auto_75765 ) ( ON ?auto_75763 ?auto_75764 ) ( ON ?auto_75762 ?auto_75763 ) ( ON ?auto_75761 ?auto_75762 ) ( CLEAR ?auto_75759 ) ( ON ?auto_75760 ?auto_75761 ) ( CLEAR ?auto_75760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75759 ?auto_75760 )
      ( MAKE-7PILE ?auto_75759 ?auto_75760 ?auto_75761 ?auto_75762 ?auto_75763 ?auto_75764 ?auto_75765 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75774 - BLOCK
      ?auto_75775 - BLOCK
      ?auto_75776 - BLOCK
      ?auto_75777 - BLOCK
      ?auto_75778 - BLOCK
      ?auto_75779 - BLOCK
      ?auto_75780 - BLOCK
    )
    :vars
    (
      ?auto_75781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75780 ?auto_75781 ) ( not ( = ?auto_75774 ?auto_75775 ) ) ( not ( = ?auto_75774 ?auto_75776 ) ) ( not ( = ?auto_75774 ?auto_75777 ) ) ( not ( = ?auto_75774 ?auto_75778 ) ) ( not ( = ?auto_75774 ?auto_75779 ) ) ( not ( = ?auto_75774 ?auto_75780 ) ) ( not ( = ?auto_75774 ?auto_75781 ) ) ( not ( = ?auto_75775 ?auto_75776 ) ) ( not ( = ?auto_75775 ?auto_75777 ) ) ( not ( = ?auto_75775 ?auto_75778 ) ) ( not ( = ?auto_75775 ?auto_75779 ) ) ( not ( = ?auto_75775 ?auto_75780 ) ) ( not ( = ?auto_75775 ?auto_75781 ) ) ( not ( = ?auto_75776 ?auto_75777 ) ) ( not ( = ?auto_75776 ?auto_75778 ) ) ( not ( = ?auto_75776 ?auto_75779 ) ) ( not ( = ?auto_75776 ?auto_75780 ) ) ( not ( = ?auto_75776 ?auto_75781 ) ) ( not ( = ?auto_75777 ?auto_75778 ) ) ( not ( = ?auto_75777 ?auto_75779 ) ) ( not ( = ?auto_75777 ?auto_75780 ) ) ( not ( = ?auto_75777 ?auto_75781 ) ) ( not ( = ?auto_75778 ?auto_75779 ) ) ( not ( = ?auto_75778 ?auto_75780 ) ) ( not ( = ?auto_75778 ?auto_75781 ) ) ( not ( = ?auto_75779 ?auto_75780 ) ) ( not ( = ?auto_75779 ?auto_75781 ) ) ( not ( = ?auto_75780 ?auto_75781 ) ) ( ON ?auto_75779 ?auto_75780 ) ( ON ?auto_75778 ?auto_75779 ) ( ON ?auto_75777 ?auto_75778 ) ( ON ?auto_75776 ?auto_75777 ) ( ON ?auto_75775 ?auto_75776 ) ( ON ?auto_75774 ?auto_75775 ) ( CLEAR ?auto_75774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75774 )
      ( MAKE-7PILE ?auto_75774 ?auto_75775 ?auto_75776 ?auto_75777 ?auto_75778 ?auto_75779 ?auto_75780 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75789 - BLOCK
      ?auto_75790 - BLOCK
      ?auto_75791 - BLOCK
      ?auto_75792 - BLOCK
      ?auto_75793 - BLOCK
      ?auto_75794 - BLOCK
      ?auto_75795 - BLOCK
    )
    :vars
    (
      ?auto_75796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75795 ?auto_75796 ) ( not ( = ?auto_75789 ?auto_75790 ) ) ( not ( = ?auto_75789 ?auto_75791 ) ) ( not ( = ?auto_75789 ?auto_75792 ) ) ( not ( = ?auto_75789 ?auto_75793 ) ) ( not ( = ?auto_75789 ?auto_75794 ) ) ( not ( = ?auto_75789 ?auto_75795 ) ) ( not ( = ?auto_75789 ?auto_75796 ) ) ( not ( = ?auto_75790 ?auto_75791 ) ) ( not ( = ?auto_75790 ?auto_75792 ) ) ( not ( = ?auto_75790 ?auto_75793 ) ) ( not ( = ?auto_75790 ?auto_75794 ) ) ( not ( = ?auto_75790 ?auto_75795 ) ) ( not ( = ?auto_75790 ?auto_75796 ) ) ( not ( = ?auto_75791 ?auto_75792 ) ) ( not ( = ?auto_75791 ?auto_75793 ) ) ( not ( = ?auto_75791 ?auto_75794 ) ) ( not ( = ?auto_75791 ?auto_75795 ) ) ( not ( = ?auto_75791 ?auto_75796 ) ) ( not ( = ?auto_75792 ?auto_75793 ) ) ( not ( = ?auto_75792 ?auto_75794 ) ) ( not ( = ?auto_75792 ?auto_75795 ) ) ( not ( = ?auto_75792 ?auto_75796 ) ) ( not ( = ?auto_75793 ?auto_75794 ) ) ( not ( = ?auto_75793 ?auto_75795 ) ) ( not ( = ?auto_75793 ?auto_75796 ) ) ( not ( = ?auto_75794 ?auto_75795 ) ) ( not ( = ?auto_75794 ?auto_75796 ) ) ( not ( = ?auto_75795 ?auto_75796 ) ) ( ON ?auto_75794 ?auto_75795 ) ( ON ?auto_75793 ?auto_75794 ) ( ON ?auto_75792 ?auto_75793 ) ( ON ?auto_75791 ?auto_75792 ) ( ON ?auto_75790 ?auto_75791 ) ( ON ?auto_75789 ?auto_75790 ) ( CLEAR ?auto_75789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75789 )
      ( MAKE-7PILE ?auto_75789 ?auto_75790 ?auto_75791 ?auto_75792 ?auto_75793 ?auto_75794 ?auto_75795 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75805 - BLOCK
      ?auto_75806 - BLOCK
      ?auto_75807 - BLOCK
      ?auto_75808 - BLOCK
      ?auto_75809 - BLOCK
      ?auto_75810 - BLOCK
      ?auto_75811 - BLOCK
      ?auto_75812 - BLOCK
    )
    :vars
    (
      ?auto_75813 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75811 ) ( ON ?auto_75812 ?auto_75813 ) ( CLEAR ?auto_75812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75805 ) ( ON ?auto_75806 ?auto_75805 ) ( ON ?auto_75807 ?auto_75806 ) ( ON ?auto_75808 ?auto_75807 ) ( ON ?auto_75809 ?auto_75808 ) ( ON ?auto_75810 ?auto_75809 ) ( ON ?auto_75811 ?auto_75810 ) ( not ( = ?auto_75805 ?auto_75806 ) ) ( not ( = ?auto_75805 ?auto_75807 ) ) ( not ( = ?auto_75805 ?auto_75808 ) ) ( not ( = ?auto_75805 ?auto_75809 ) ) ( not ( = ?auto_75805 ?auto_75810 ) ) ( not ( = ?auto_75805 ?auto_75811 ) ) ( not ( = ?auto_75805 ?auto_75812 ) ) ( not ( = ?auto_75805 ?auto_75813 ) ) ( not ( = ?auto_75806 ?auto_75807 ) ) ( not ( = ?auto_75806 ?auto_75808 ) ) ( not ( = ?auto_75806 ?auto_75809 ) ) ( not ( = ?auto_75806 ?auto_75810 ) ) ( not ( = ?auto_75806 ?auto_75811 ) ) ( not ( = ?auto_75806 ?auto_75812 ) ) ( not ( = ?auto_75806 ?auto_75813 ) ) ( not ( = ?auto_75807 ?auto_75808 ) ) ( not ( = ?auto_75807 ?auto_75809 ) ) ( not ( = ?auto_75807 ?auto_75810 ) ) ( not ( = ?auto_75807 ?auto_75811 ) ) ( not ( = ?auto_75807 ?auto_75812 ) ) ( not ( = ?auto_75807 ?auto_75813 ) ) ( not ( = ?auto_75808 ?auto_75809 ) ) ( not ( = ?auto_75808 ?auto_75810 ) ) ( not ( = ?auto_75808 ?auto_75811 ) ) ( not ( = ?auto_75808 ?auto_75812 ) ) ( not ( = ?auto_75808 ?auto_75813 ) ) ( not ( = ?auto_75809 ?auto_75810 ) ) ( not ( = ?auto_75809 ?auto_75811 ) ) ( not ( = ?auto_75809 ?auto_75812 ) ) ( not ( = ?auto_75809 ?auto_75813 ) ) ( not ( = ?auto_75810 ?auto_75811 ) ) ( not ( = ?auto_75810 ?auto_75812 ) ) ( not ( = ?auto_75810 ?auto_75813 ) ) ( not ( = ?auto_75811 ?auto_75812 ) ) ( not ( = ?auto_75811 ?auto_75813 ) ) ( not ( = ?auto_75812 ?auto_75813 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75812 ?auto_75813 )
      ( !STACK ?auto_75812 ?auto_75811 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75822 - BLOCK
      ?auto_75823 - BLOCK
      ?auto_75824 - BLOCK
      ?auto_75825 - BLOCK
      ?auto_75826 - BLOCK
      ?auto_75827 - BLOCK
      ?auto_75828 - BLOCK
      ?auto_75829 - BLOCK
    )
    :vars
    (
      ?auto_75830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75828 ) ( ON ?auto_75829 ?auto_75830 ) ( CLEAR ?auto_75829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75822 ) ( ON ?auto_75823 ?auto_75822 ) ( ON ?auto_75824 ?auto_75823 ) ( ON ?auto_75825 ?auto_75824 ) ( ON ?auto_75826 ?auto_75825 ) ( ON ?auto_75827 ?auto_75826 ) ( ON ?auto_75828 ?auto_75827 ) ( not ( = ?auto_75822 ?auto_75823 ) ) ( not ( = ?auto_75822 ?auto_75824 ) ) ( not ( = ?auto_75822 ?auto_75825 ) ) ( not ( = ?auto_75822 ?auto_75826 ) ) ( not ( = ?auto_75822 ?auto_75827 ) ) ( not ( = ?auto_75822 ?auto_75828 ) ) ( not ( = ?auto_75822 ?auto_75829 ) ) ( not ( = ?auto_75822 ?auto_75830 ) ) ( not ( = ?auto_75823 ?auto_75824 ) ) ( not ( = ?auto_75823 ?auto_75825 ) ) ( not ( = ?auto_75823 ?auto_75826 ) ) ( not ( = ?auto_75823 ?auto_75827 ) ) ( not ( = ?auto_75823 ?auto_75828 ) ) ( not ( = ?auto_75823 ?auto_75829 ) ) ( not ( = ?auto_75823 ?auto_75830 ) ) ( not ( = ?auto_75824 ?auto_75825 ) ) ( not ( = ?auto_75824 ?auto_75826 ) ) ( not ( = ?auto_75824 ?auto_75827 ) ) ( not ( = ?auto_75824 ?auto_75828 ) ) ( not ( = ?auto_75824 ?auto_75829 ) ) ( not ( = ?auto_75824 ?auto_75830 ) ) ( not ( = ?auto_75825 ?auto_75826 ) ) ( not ( = ?auto_75825 ?auto_75827 ) ) ( not ( = ?auto_75825 ?auto_75828 ) ) ( not ( = ?auto_75825 ?auto_75829 ) ) ( not ( = ?auto_75825 ?auto_75830 ) ) ( not ( = ?auto_75826 ?auto_75827 ) ) ( not ( = ?auto_75826 ?auto_75828 ) ) ( not ( = ?auto_75826 ?auto_75829 ) ) ( not ( = ?auto_75826 ?auto_75830 ) ) ( not ( = ?auto_75827 ?auto_75828 ) ) ( not ( = ?auto_75827 ?auto_75829 ) ) ( not ( = ?auto_75827 ?auto_75830 ) ) ( not ( = ?auto_75828 ?auto_75829 ) ) ( not ( = ?auto_75828 ?auto_75830 ) ) ( not ( = ?auto_75829 ?auto_75830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75829 ?auto_75830 )
      ( !STACK ?auto_75829 ?auto_75828 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75839 - BLOCK
      ?auto_75840 - BLOCK
      ?auto_75841 - BLOCK
      ?auto_75842 - BLOCK
      ?auto_75843 - BLOCK
      ?auto_75844 - BLOCK
      ?auto_75845 - BLOCK
      ?auto_75846 - BLOCK
    )
    :vars
    (
      ?auto_75847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75846 ?auto_75847 ) ( ON-TABLE ?auto_75839 ) ( ON ?auto_75840 ?auto_75839 ) ( ON ?auto_75841 ?auto_75840 ) ( ON ?auto_75842 ?auto_75841 ) ( ON ?auto_75843 ?auto_75842 ) ( ON ?auto_75844 ?auto_75843 ) ( not ( = ?auto_75839 ?auto_75840 ) ) ( not ( = ?auto_75839 ?auto_75841 ) ) ( not ( = ?auto_75839 ?auto_75842 ) ) ( not ( = ?auto_75839 ?auto_75843 ) ) ( not ( = ?auto_75839 ?auto_75844 ) ) ( not ( = ?auto_75839 ?auto_75845 ) ) ( not ( = ?auto_75839 ?auto_75846 ) ) ( not ( = ?auto_75839 ?auto_75847 ) ) ( not ( = ?auto_75840 ?auto_75841 ) ) ( not ( = ?auto_75840 ?auto_75842 ) ) ( not ( = ?auto_75840 ?auto_75843 ) ) ( not ( = ?auto_75840 ?auto_75844 ) ) ( not ( = ?auto_75840 ?auto_75845 ) ) ( not ( = ?auto_75840 ?auto_75846 ) ) ( not ( = ?auto_75840 ?auto_75847 ) ) ( not ( = ?auto_75841 ?auto_75842 ) ) ( not ( = ?auto_75841 ?auto_75843 ) ) ( not ( = ?auto_75841 ?auto_75844 ) ) ( not ( = ?auto_75841 ?auto_75845 ) ) ( not ( = ?auto_75841 ?auto_75846 ) ) ( not ( = ?auto_75841 ?auto_75847 ) ) ( not ( = ?auto_75842 ?auto_75843 ) ) ( not ( = ?auto_75842 ?auto_75844 ) ) ( not ( = ?auto_75842 ?auto_75845 ) ) ( not ( = ?auto_75842 ?auto_75846 ) ) ( not ( = ?auto_75842 ?auto_75847 ) ) ( not ( = ?auto_75843 ?auto_75844 ) ) ( not ( = ?auto_75843 ?auto_75845 ) ) ( not ( = ?auto_75843 ?auto_75846 ) ) ( not ( = ?auto_75843 ?auto_75847 ) ) ( not ( = ?auto_75844 ?auto_75845 ) ) ( not ( = ?auto_75844 ?auto_75846 ) ) ( not ( = ?auto_75844 ?auto_75847 ) ) ( not ( = ?auto_75845 ?auto_75846 ) ) ( not ( = ?auto_75845 ?auto_75847 ) ) ( not ( = ?auto_75846 ?auto_75847 ) ) ( CLEAR ?auto_75844 ) ( ON ?auto_75845 ?auto_75846 ) ( CLEAR ?auto_75845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75839 ?auto_75840 ?auto_75841 ?auto_75842 ?auto_75843 ?auto_75844 ?auto_75845 )
      ( MAKE-8PILE ?auto_75839 ?auto_75840 ?auto_75841 ?auto_75842 ?auto_75843 ?auto_75844 ?auto_75845 ?auto_75846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75856 - BLOCK
      ?auto_75857 - BLOCK
      ?auto_75858 - BLOCK
      ?auto_75859 - BLOCK
      ?auto_75860 - BLOCK
      ?auto_75861 - BLOCK
      ?auto_75862 - BLOCK
      ?auto_75863 - BLOCK
    )
    :vars
    (
      ?auto_75864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75863 ?auto_75864 ) ( ON-TABLE ?auto_75856 ) ( ON ?auto_75857 ?auto_75856 ) ( ON ?auto_75858 ?auto_75857 ) ( ON ?auto_75859 ?auto_75858 ) ( ON ?auto_75860 ?auto_75859 ) ( ON ?auto_75861 ?auto_75860 ) ( not ( = ?auto_75856 ?auto_75857 ) ) ( not ( = ?auto_75856 ?auto_75858 ) ) ( not ( = ?auto_75856 ?auto_75859 ) ) ( not ( = ?auto_75856 ?auto_75860 ) ) ( not ( = ?auto_75856 ?auto_75861 ) ) ( not ( = ?auto_75856 ?auto_75862 ) ) ( not ( = ?auto_75856 ?auto_75863 ) ) ( not ( = ?auto_75856 ?auto_75864 ) ) ( not ( = ?auto_75857 ?auto_75858 ) ) ( not ( = ?auto_75857 ?auto_75859 ) ) ( not ( = ?auto_75857 ?auto_75860 ) ) ( not ( = ?auto_75857 ?auto_75861 ) ) ( not ( = ?auto_75857 ?auto_75862 ) ) ( not ( = ?auto_75857 ?auto_75863 ) ) ( not ( = ?auto_75857 ?auto_75864 ) ) ( not ( = ?auto_75858 ?auto_75859 ) ) ( not ( = ?auto_75858 ?auto_75860 ) ) ( not ( = ?auto_75858 ?auto_75861 ) ) ( not ( = ?auto_75858 ?auto_75862 ) ) ( not ( = ?auto_75858 ?auto_75863 ) ) ( not ( = ?auto_75858 ?auto_75864 ) ) ( not ( = ?auto_75859 ?auto_75860 ) ) ( not ( = ?auto_75859 ?auto_75861 ) ) ( not ( = ?auto_75859 ?auto_75862 ) ) ( not ( = ?auto_75859 ?auto_75863 ) ) ( not ( = ?auto_75859 ?auto_75864 ) ) ( not ( = ?auto_75860 ?auto_75861 ) ) ( not ( = ?auto_75860 ?auto_75862 ) ) ( not ( = ?auto_75860 ?auto_75863 ) ) ( not ( = ?auto_75860 ?auto_75864 ) ) ( not ( = ?auto_75861 ?auto_75862 ) ) ( not ( = ?auto_75861 ?auto_75863 ) ) ( not ( = ?auto_75861 ?auto_75864 ) ) ( not ( = ?auto_75862 ?auto_75863 ) ) ( not ( = ?auto_75862 ?auto_75864 ) ) ( not ( = ?auto_75863 ?auto_75864 ) ) ( CLEAR ?auto_75861 ) ( ON ?auto_75862 ?auto_75863 ) ( CLEAR ?auto_75862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75856 ?auto_75857 ?auto_75858 ?auto_75859 ?auto_75860 ?auto_75861 ?auto_75862 )
      ( MAKE-8PILE ?auto_75856 ?auto_75857 ?auto_75858 ?auto_75859 ?auto_75860 ?auto_75861 ?auto_75862 ?auto_75863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75873 - BLOCK
      ?auto_75874 - BLOCK
      ?auto_75875 - BLOCK
      ?auto_75876 - BLOCK
      ?auto_75877 - BLOCK
      ?auto_75878 - BLOCK
      ?auto_75879 - BLOCK
      ?auto_75880 - BLOCK
    )
    :vars
    (
      ?auto_75881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75880 ?auto_75881 ) ( ON-TABLE ?auto_75873 ) ( ON ?auto_75874 ?auto_75873 ) ( ON ?auto_75875 ?auto_75874 ) ( ON ?auto_75876 ?auto_75875 ) ( ON ?auto_75877 ?auto_75876 ) ( not ( = ?auto_75873 ?auto_75874 ) ) ( not ( = ?auto_75873 ?auto_75875 ) ) ( not ( = ?auto_75873 ?auto_75876 ) ) ( not ( = ?auto_75873 ?auto_75877 ) ) ( not ( = ?auto_75873 ?auto_75878 ) ) ( not ( = ?auto_75873 ?auto_75879 ) ) ( not ( = ?auto_75873 ?auto_75880 ) ) ( not ( = ?auto_75873 ?auto_75881 ) ) ( not ( = ?auto_75874 ?auto_75875 ) ) ( not ( = ?auto_75874 ?auto_75876 ) ) ( not ( = ?auto_75874 ?auto_75877 ) ) ( not ( = ?auto_75874 ?auto_75878 ) ) ( not ( = ?auto_75874 ?auto_75879 ) ) ( not ( = ?auto_75874 ?auto_75880 ) ) ( not ( = ?auto_75874 ?auto_75881 ) ) ( not ( = ?auto_75875 ?auto_75876 ) ) ( not ( = ?auto_75875 ?auto_75877 ) ) ( not ( = ?auto_75875 ?auto_75878 ) ) ( not ( = ?auto_75875 ?auto_75879 ) ) ( not ( = ?auto_75875 ?auto_75880 ) ) ( not ( = ?auto_75875 ?auto_75881 ) ) ( not ( = ?auto_75876 ?auto_75877 ) ) ( not ( = ?auto_75876 ?auto_75878 ) ) ( not ( = ?auto_75876 ?auto_75879 ) ) ( not ( = ?auto_75876 ?auto_75880 ) ) ( not ( = ?auto_75876 ?auto_75881 ) ) ( not ( = ?auto_75877 ?auto_75878 ) ) ( not ( = ?auto_75877 ?auto_75879 ) ) ( not ( = ?auto_75877 ?auto_75880 ) ) ( not ( = ?auto_75877 ?auto_75881 ) ) ( not ( = ?auto_75878 ?auto_75879 ) ) ( not ( = ?auto_75878 ?auto_75880 ) ) ( not ( = ?auto_75878 ?auto_75881 ) ) ( not ( = ?auto_75879 ?auto_75880 ) ) ( not ( = ?auto_75879 ?auto_75881 ) ) ( not ( = ?auto_75880 ?auto_75881 ) ) ( ON ?auto_75879 ?auto_75880 ) ( CLEAR ?auto_75877 ) ( ON ?auto_75878 ?auto_75879 ) ( CLEAR ?auto_75878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75873 ?auto_75874 ?auto_75875 ?auto_75876 ?auto_75877 ?auto_75878 )
      ( MAKE-8PILE ?auto_75873 ?auto_75874 ?auto_75875 ?auto_75876 ?auto_75877 ?auto_75878 ?auto_75879 ?auto_75880 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75890 - BLOCK
      ?auto_75891 - BLOCK
      ?auto_75892 - BLOCK
      ?auto_75893 - BLOCK
      ?auto_75894 - BLOCK
      ?auto_75895 - BLOCK
      ?auto_75896 - BLOCK
      ?auto_75897 - BLOCK
    )
    :vars
    (
      ?auto_75898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75897 ?auto_75898 ) ( ON-TABLE ?auto_75890 ) ( ON ?auto_75891 ?auto_75890 ) ( ON ?auto_75892 ?auto_75891 ) ( ON ?auto_75893 ?auto_75892 ) ( ON ?auto_75894 ?auto_75893 ) ( not ( = ?auto_75890 ?auto_75891 ) ) ( not ( = ?auto_75890 ?auto_75892 ) ) ( not ( = ?auto_75890 ?auto_75893 ) ) ( not ( = ?auto_75890 ?auto_75894 ) ) ( not ( = ?auto_75890 ?auto_75895 ) ) ( not ( = ?auto_75890 ?auto_75896 ) ) ( not ( = ?auto_75890 ?auto_75897 ) ) ( not ( = ?auto_75890 ?auto_75898 ) ) ( not ( = ?auto_75891 ?auto_75892 ) ) ( not ( = ?auto_75891 ?auto_75893 ) ) ( not ( = ?auto_75891 ?auto_75894 ) ) ( not ( = ?auto_75891 ?auto_75895 ) ) ( not ( = ?auto_75891 ?auto_75896 ) ) ( not ( = ?auto_75891 ?auto_75897 ) ) ( not ( = ?auto_75891 ?auto_75898 ) ) ( not ( = ?auto_75892 ?auto_75893 ) ) ( not ( = ?auto_75892 ?auto_75894 ) ) ( not ( = ?auto_75892 ?auto_75895 ) ) ( not ( = ?auto_75892 ?auto_75896 ) ) ( not ( = ?auto_75892 ?auto_75897 ) ) ( not ( = ?auto_75892 ?auto_75898 ) ) ( not ( = ?auto_75893 ?auto_75894 ) ) ( not ( = ?auto_75893 ?auto_75895 ) ) ( not ( = ?auto_75893 ?auto_75896 ) ) ( not ( = ?auto_75893 ?auto_75897 ) ) ( not ( = ?auto_75893 ?auto_75898 ) ) ( not ( = ?auto_75894 ?auto_75895 ) ) ( not ( = ?auto_75894 ?auto_75896 ) ) ( not ( = ?auto_75894 ?auto_75897 ) ) ( not ( = ?auto_75894 ?auto_75898 ) ) ( not ( = ?auto_75895 ?auto_75896 ) ) ( not ( = ?auto_75895 ?auto_75897 ) ) ( not ( = ?auto_75895 ?auto_75898 ) ) ( not ( = ?auto_75896 ?auto_75897 ) ) ( not ( = ?auto_75896 ?auto_75898 ) ) ( not ( = ?auto_75897 ?auto_75898 ) ) ( ON ?auto_75896 ?auto_75897 ) ( CLEAR ?auto_75894 ) ( ON ?auto_75895 ?auto_75896 ) ( CLEAR ?auto_75895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75890 ?auto_75891 ?auto_75892 ?auto_75893 ?auto_75894 ?auto_75895 )
      ( MAKE-8PILE ?auto_75890 ?auto_75891 ?auto_75892 ?auto_75893 ?auto_75894 ?auto_75895 ?auto_75896 ?auto_75897 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75907 - BLOCK
      ?auto_75908 - BLOCK
      ?auto_75909 - BLOCK
      ?auto_75910 - BLOCK
      ?auto_75911 - BLOCK
      ?auto_75912 - BLOCK
      ?auto_75913 - BLOCK
      ?auto_75914 - BLOCK
    )
    :vars
    (
      ?auto_75915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75914 ?auto_75915 ) ( ON-TABLE ?auto_75907 ) ( ON ?auto_75908 ?auto_75907 ) ( ON ?auto_75909 ?auto_75908 ) ( ON ?auto_75910 ?auto_75909 ) ( not ( = ?auto_75907 ?auto_75908 ) ) ( not ( = ?auto_75907 ?auto_75909 ) ) ( not ( = ?auto_75907 ?auto_75910 ) ) ( not ( = ?auto_75907 ?auto_75911 ) ) ( not ( = ?auto_75907 ?auto_75912 ) ) ( not ( = ?auto_75907 ?auto_75913 ) ) ( not ( = ?auto_75907 ?auto_75914 ) ) ( not ( = ?auto_75907 ?auto_75915 ) ) ( not ( = ?auto_75908 ?auto_75909 ) ) ( not ( = ?auto_75908 ?auto_75910 ) ) ( not ( = ?auto_75908 ?auto_75911 ) ) ( not ( = ?auto_75908 ?auto_75912 ) ) ( not ( = ?auto_75908 ?auto_75913 ) ) ( not ( = ?auto_75908 ?auto_75914 ) ) ( not ( = ?auto_75908 ?auto_75915 ) ) ( not ( = ?auto_75909 ?auto_75910 ) ) ( not ( = ?auto_75909 ?auto_75911 ) ) ( not ( = ?auto_75909 ?auto_75912 ) ) ( not ( = ?auto_75909 ?auto_75913 ) ) ( not ( = ?auto_75909 ?auto_75914 ) ) ( not ( = ?auto_75909 ?auto_75915 ) ) ( not ( = ?auto_75910 ?auto_75911 ) ) ( not ( = ?auto_75910 ?auto_75912 ) ) ( not ( = ?auto_75910 ?auto_75913 ) ) ( not ( = ?auto_75910 ?auto_75914 ) ) ( not ( = ?auto_75910 ?auto_75915 ) ) ( not ( = ?auto_75911 ?auto_75912 ) ) ( not ( = ?auto_75911 ?auto_75913 ) ) ( not ( = ?auto_75911 ?auto_75914 ) ) ( not ( = ?auto_75911 ?auto_75915 ) ) ( not ( = ?auto_75912 ?auto_75913 ) ) ( not ( = ?auto_75912 ?auto_75914 ) ) ( not ( = ?auto_75912 ?auto_75915 ) ) ( not ( = ?auto_75913 ?auto_75914 ) ) ( not ( = ?auto_75913 ?auto_75915 ) ) ( not ( = ?auto_75914 ?auto_75915 ) ) ( ON ?auto_75913 ?auto_75914 ) ( ON ?auto_75912 ?auto_75913 ) ( CLEAR ?auto_75910 ) ( ON ?auto_75911 ?auto_75912 ) ( CLEAR ?auto_75911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75907 ?auto_75908 ?auto_75909 ?auto_75910 ?auto_75911 )
      ( MAKE-8PILE ?auto_75907 ?auto_75908 ?auto_75909 ?auto_75910 ?auto_75911 ?auto_75912 ?auto_75913 ?auto_75914 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75924 - BLOCK
      ?auto_75925 - BLOCK
      ?auto_75926 - BLOCK
      ?auto_75927 - BLOCK
      ?auto_75928 - BLOCK
      ?auto_75929 - BLOCK
      ?auto_75930 - BLOCK
      ?auto_75931 - BLOCK
    )
    :vars
    (
      ?auto_75932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75931 ?auto_75932 ) ( ON-TABLE ?auto_75924 ) ( ON ?auto_75925 ?auto_75924 ) ( ON ?auto_75926 ?auto_75925 ) ( ON ?auto_75927 ?auto_75926 ) ( not ( = ?auto_75924 ?auto_75925 ) ) ( not ( = ?auto_75924 ?auto_75926 ) ) ( not ( = ?auto_75924 ?auto_75927 ) ) ( not ( = ?auto_75924 ?auto_75928 ) ) ( not ( = ?auto_75924 ?auto_75929 ) ) ( not ( = ?auto_75924 ?auto_75930 ) ) ( not ( = ?auto_75924 ?auto_75931 ) ) ( not ( = ?auto_75924 ?auto_75932 ) ) ( not ( = ?auto_75925 ?auto_75926 ) ) ( not ( = ?auto_75925 ?auto_75927 ) ) ( not ( = ?auto_75925 ?auto_75928 ) ) ( not ( = ?auto_75925 ?auto_75929 ) ) ( not ( = ?auto_75925 ?auto_75930 ) ) ( not ( = ?auto_75925 ?auto_75931 ) ) ( not ( = ?auto_75925 ?auto_75932 ) ) ( not ( = ?auto_75926 ?auto_75927 ) ) ( not ( = ?auto_75926 ?auto_75928 ) ) ( not ( = ?auto_75926 ?auto_75929 ) ) ( not ( = ?auto_75926 ?auto_75930 ) ) ( not ( = ?auto_75926 ?auto_75931 ) ) ( not ( = ?auto_75926 ?auto_75932 ) ) ( not ( = ?auto_75927 ?auto_75928 ) ) ( not ( = ?auto_75927 ?auto_75929 ) ) ( not ( = ?auto_75927 ?auto_75930 ) ) ( not ( = ?auto_75927 ?auto_75931 ) ) ( not ( = ?auto_75927 ?auto_75932 ) ) ( not ( = ?auto_75928 ?auto_75929 ) ) ( not ( = ?auto_75928 ?auto_75930 ) ) ( not ( = ?auto_75928 ?auto_75931 ) ) ( not ( = ?auto_75928 ?auto_75932 ) ) ( not ( = ?auto_75929 ?auto_75930 ) ) ( not ( = ?auto_75929 ?auto_75931 ) ) ( not ( = ?auto_75929 ?auto_75932 ) ) ( not ( = ?auto_75930 ?auto_75931 ) ) ( not ( = ?auto_75930 ?auto_75932 ) ) ( not ( = ?auto_75931 ?auto_75932 ) ) ( ON ?auto_75930 ?auto_75931 ) ( ON ?auto_75929 ?auto_75930 ) ( CLEAR ?auto_75927 ) ( ON ?auto_75928 ?auto_75929 ) ( CLEAR ?auto_75928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75924 ?auto_75925 ?auto_75926 ?auto_75927 ?auto_75928 )
      ( MAKE-8PILE ?auto_75924 ?auto_75925 ?auto_75926 ?auto_75927 ?auto_75928 ?auto_75929 ?auto_75930 ?auto_75931 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75941 - BLOCK
      ?auto_75942 - BLOCK
      ?auto_75943 - BLOCK
      ?auto_75944 - BLOCK
      ?auto_75945 - BLOCK
      ?auto_75946 - BLOCK
      ?auto_75947 - BLOCK
      ?auto_75948 - BLOCK
    )
    :vars
    (
      ?auto_75949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75948 ?auto_75949 ) ( ON-TABLE ?auto_75941 ) ( ON ?auto_75942 ?auto_75941 ) ( ON ?auto_75943 ?auto_75942 ) ( not ( = ?auto_75941 ?auto_75942 ) ) ( not ( = ?auto_75941 ?auto_75943 ) ) ( not ( = ?auto_75941 ?auto_75944 ) ) ( not ( = ?auto_75941 ?auto_75945 ) ) ( not ( = ?auto_75941 ?auto_75946 ) ) ( not ( = ?auto_75941 ?auto_75947 ) ) ( not ( = ?auto_75941 ?auto_75948 ) ) ( not ( = ?auto_75941 ?auto_75949 ) ) ( not ( = ?auto_75942 ?auto_75943 ) ) ( not ( = ?auto_75942 ?auto_75944 ) ) ( not ( = ?auto_75942 ?auto_75945 ) ) ( not ( = ?auto_75942 ?auto_75946 ) ) ( not ( = ?auto_75942 ?auto_75947 ) ) ( not ( = ?auto_75942 ?auto_75948 ) ) ( not ( = ?auto_75942 ?auto_75949 ) ) ( not ( = ?auto_75943 ?auto_75944 ) ) ( not ( = ?auto_75943 ?auto_75945 ) ) ( not ( = ?auto_75943 ?auto_75946 ) ) ( not ( = ?auto_75943 ?auto_75947 ) ) ( not ( = ?auto_75943 ?auto_75948 ) ) ( not ( = ?auto_75943 ?auto_75949 ) ) ( not ( = ?auto_75944 ?auto_75945 ) ) ( not ( = ?auto_75944 ?auto_75946 ) ) ( not ( = ?auto_75944 ?auto_75947 ) ) ( not ( = ?auto_75944 ?auto_75948 ) ) ( not ( = ?auto_75944 ?auto_75949 ) ) ( not ( = ?auto_75945 ?auto_75946 ) ) ( not ( = ?auto_75945 ?auto_75947 ) ) ( not ( = ?auto_75945 ?auto_75948 ) ) ( not ( = ?auto_75945 ?auto_75949 ) ) ( not ( = ?auto_75946 ?auto_75947 ) ) ( not ( = ?auto_75946 ?auto_75948 ) ) ( not ( = ?auto_75946 ?auto_75949 ) ) ( not ( = ?auto_75947 ?auto_75948 ) ) ( not ( = ?auto_75947 ?auto_75949 ) ) ( not ( = ?auto_75948 ?auto_75949 ) ) ( ON ?auto_75947 ?auto_75948 ) ( ON ?auto_75946 ?auto_75947 ) ( ON ?auto_75945 ?auto_75946 ) ( CLEAR ?auto_75943 ) ( ON ?auto_75944 ?auto_75945 ) ( CLEAR ?auto_75944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75941 ?auto_75942 ?auto_75943 ?auto_75944 )
      ( MAKE-8PILE ?auto_75941 ?auto_75942 ?auto_75943 ?auto_75944 ?auto_75945 ?auto_75946 ?auto_75947 ?auto_75948 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75958 - BLOCK
      ?auto_75959 - BLOCK
      ?auto_75960 - BLOCK
      ?auto_75961 - BLOCK
      ?auto_75962 - BLOCK
      ?auto_75963 - BLOCK
      ?auto_75964 - BLOCK
      ?auto_75965 - BLOCK
    )
    :vars
    (
      ?auto_75966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75965 ?auto_75966 ) ( ON-TABLE ?auto_75958 ) ( ON ?auto_75959 ?auto_75958 ) ( ON ?auto_75960 ?auto_75959 ) ( not ( = ?auto_75958 ?auto_75959 ) ) ( not ( = ?auto_75958 ?auto_75960 ) ) ( not ( = ?auto_75958 ?auto_75961 ) ) ( not ( = ?auto_75958 ?auto_75962 ) ) ( not ( = ?auto_75958 ?auto_75963 ) ) ( not ( = ?auto_75958 ?auto_75964 ) ) ( not ( = ?auto_75958 ?auto_75965 ) ) ( not ( = ?auto_75958 ?auto_75966 ) ) ( not ( = ?auto_75959 ?auto_75960 ) ) ( not ( = ?auto_75959 ?auto_75961 ) ) ( not ( = ?auto_75959 ?auto_75962 ) ) ( not ( = ?auto_75959 ?auto_75963 ) ) ( not ( = ?auto_75959 ?auto_75964 ) ) ( not ( = ?auto_75959 ?auto_75965 ) ) ( not ( = ?auto_75959 ?auto_75966 ) ) ( not ( = ?auto_75960 ?auto_75961 ) ) ( not ( = ?auto_75960 ?auto_75962 ) ) ( not ( = ?auto_75960 ?auto_75963 ) ) ( not ( = ?auto_75960 ?auto_75964 ) ) ( not ( = ?auto_75960 ?auto_75965 ) ) ( not ( = ?auto_75960 ?auto_75966 ) ) ( not ( = ?auto_75961 ?auto_75962 ) ) ( not ( = ?auto_75961 ?auto_75963 ) ) ( not ( = ?auto_75961 ?auto_75964 ) ) ( not ( = ?auto_75961 ?auto_75965 ) ) ( not ( = ?auto_75961 ?auto_75966 ) ) ( not ( = ?auto_75962 ?auto_75963 ) ) ( not ( = ?auto_75962 ?auto_75964 ) ) ( not ( = ?auto_75962 ?auto_75965 ) ) ( not ( = ?auto_75962 ?auto_75966 ) ) ( not ( = ?auto_75963 ?auto_75964 ) ) ( not ( = ?auto_75963 ?auto_75965 ) ) ( not ( = ?auto_75963 ?auto_75966 ) ) ( not ( = ?auto_75964 ?auto_75965 ) ) ( not ( = ?auto_75964 ?auto_75966 ) ) ( not ( = ?auto_75965 ?auto_75966 ) ) ( ON ?auto_75964 ?auto_75965 ) ( ON ?auto_75963 ?auto_75964 ) ( ON ?auto_75962 ?auto_75963 ) ( CLEAR ?auto_75960 ) ( ON ?auto_75961 ?auto_75962 ) ( CLEAR ?auto_75961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75958 ?auto_75959 ?auto_75960 ?auto_75961 )
      ( MAKE-8PILE ?auto_75958 ?auto_75959 ?auto_75960 ?auto_75961 ?auto_75962 ?auto_75963 ?auto_75964 ?auto_75965 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75975 - BLOCK
      ?auto_75976 - BLOCK
      ?auto_75977 - BLOCK
      ?auto_75978 - BLOCK
      ?auto_75979 - BLOCK
      ?auto_75980 - BLOCK
      ?auto_75981 - BLOCK
      ?auto_75982 - BLOCK
    )
    :vars
    (
      ?auto_75983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75982 ?auto_75983 ) ( ON-TABLE ?auto_75975 ) ( ON ?auto_75976 ?auto_75975 ) ( not ( = ?auto_75975 ?auto_75976 ) ) ( not ( = ?auto_75975 ?auto_75977 ) ) ( not ( = ?auto_75975 ?auto_75978 ) ) ( not ( = ?auto_75975 ?auto_75979 ) ) ( not ( = ?auto_75975 ?auto_75980 ) ) ( not ( = ?auto_75975 ?auto_75981 ) ) ( not ( = ?auto_75975 ?auto_75982 ) ) ( not ( = ?auto_75975 ?auto_75983 ) ) ( not ( = ?auto_75976 ?auto_75977 ) ) ( not ( = ?auto_75976 ?auto_75978 ) ) ( not ( = ?auto_75976 ?auto_75979 ) ) ( not ( = ?auto_75976 ?auto_75980 ) ) ( not ( = ?auto_75976 ?auto_75981 ) ) ( not ( = ?auto_75976 ?auto_75982 ) ) ( not ( = ?auto_75976 ?auto_75983 ) ) ( not ( = ?auto_75977 ?auto_75978 ) ) ( not ( = ?auto_75977 ?auto_75979 ) ) ( not ( = ?auto_75977 ?auto_75980 ) ) ( not ( = ?auto_75977 ?auto_75981 ) ) ( not ( = ?auto_75977 ?auto_75982 ) ) ( not ( = ?auto_75977 ?auto_75983 ) ) ( not ( = ?auto_75978 ?auto_75979 ) ) ( not ( = ?auto_75978 ?auto_75980 ) ) ( not ( = ?auto_75978 ?auto_75981 ) ) ( not ( = ?auto_75978 ?auto_75982 ) ) ( not ( = ?auto_75978 ?auto_75983 ) ) ( not ( = ?auto_75979 ?auto_75980 ) ) ( not ( = ?auto_75979 ?auto_75981 ) ) ( not ( = ?auto_75979 ?auto_75982 ) ) ( not ( = ?auto_75979 ?auto_75983 ) ) ( not ( = ?auto_75980 ?auto_75981 ) ) ( not ( = ?auto_75980 ?auto_75982 ) ) ( not ( = ?auto_75980 ?auto_75983 ) ) ( not ( = ?auto_75981 ?auto_75982 ) ) ( not ( = ?auto_75981 ?auto_75983 ) ) ( not ( = ?auto_75982 ?auto_75983 ) ) ( ON ?auto_75981 ?auto_75982 ) ( ON ?auto_75980 ?auto_75981 ) ( ON ?auto_75979 ?auto_75980 ) ( ON ?auto_75978 ?auto_75979 ) ( CLEAR ?auto_75976 ) ( ON ?auto_75977 ?auto_75978 ) ( CLEAR ?auto_75977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75975 ?auto_75976 ?auto_75977 )
      ( MAKE-8PILE ?auto_75975 ?auto_75976 ?auto_75977 ?auto_75978 ?auto_75979 ?auto_75980 ?auto_75981 ?auto_75982 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_75992 - BLOCK
      ?auto_75993 - BLOCK
      ?auto_75994 - BLOCK
      ?auto_75995 - BLOCK
      ?auto_75996 - BLOCK
      ?auto_75997 - BLOCK
      ?auto_75998 - BLOCK
      ?auto_75999 - BLOCK
    )
    :vars
    (
      ?auto_76000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75999 ?auto_76000 ) ( ON-TABLE ?auto_75992 ) ( ON ?auto_75993 ?auto_75992 ) ( not ( = ?auto_75992 ?auto_75993 ) ) ( not ( = ?auto_75992 ?auto_75994 ) ) ( not ( = ?auto_75992 ?auto_75995 ) ) ( not ( = ?auto_75992 ?auto_75996 ) ) ( not ( = ?auto_75992 ?auto_75997 ) ) ( not ( = ?auto_75992 ?auto_75998 ) ) ( not ( = ?auto_75992 ?auto_75999 ) ) ( not ( = ?auto_75992 ?auto_76000 ) ) ( not ( = ?auto_75993 ?auto_75994 ) ) ( not ( = ?auto_75993 ?auto_75995 ) ) ( not ( = ?auto_75993 ?auto_75996 ) ) ( not ( = ?auto_75993 ?auto_75997 ) ) ( not ( = ?auto_75993 ?auto_75998 ) ) ( not ( = ?auto_75993 ?auto_75999 ) ) ( not ( = ?auto_75993 ?auto_76000 ) ) ( not ( = ?auto_75994 ?auto_75995 ) ) ( not ( = ?auto_75994 ?auto_75996 ) ) ( not ( = ?auto_75994 ?auto_75997 ) ) ( not ( = ?auto_75994 ?auto_75998 ) ) ( not ( = ?auto_75994 ?auto_75999 ) ) ( not ( = ?auto_75994 ?auto_76000 ) ) ( not ( = ?auto_75995 ?auto_75996 ) ) ( not ( = ?auto_75995 ?auto_75997 ) ) ( not ( = ?auto_75995 ?auto_75998 ) ) ( not ( = ?auto_75995 ?auto_75999 ) ) ( not ( = ?auto_75995 ?auto_76000 ) ) ( not ( = ?auto_75996 ?auto_75997 ) ) ( not ( = ?auto_75996 ?auto_75998 ) ) ( not ( = ?auto_75996 ?auto_75999 ) ) ( not ( = ?auto_75996 ?auto_76000 ) ) ( not ( = ?auto_75997 ?auto_75998 ) ) ( not ( = ?auto_75997 ?auto_75999 ) ) ( not ( = ?auto_75997 ?auto_76000 ) ) ( not ( = ?auto_75998 ?auto_75999 ) ) ( not ( = ?auto_75998 ?auto_76000 ) ) ( not ( = ?auto_75999 ?auto_76000 ) ) ( ON ?auto_75998 ?auto_75999 ) ( ON ?auto_75997 ?auto_75998 ) ( ON ?auto_75996 ?auto_75997 ) ( ON ?auto_75995 ?auto_75996 ) ( CLEAR ?auto_75993 ) ( ON ?auto_75994 ?auto_75995 ) ( CLEAR ?auto_75994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75992 ?auto_75993 ?auto_75994 )
      ( MAKE-8PILE ?auto_75992 ?auto_75993 ?auto_75994 ?auto_75995 ?auto_75996 ?auto_75997 ?auto_75998 ?auto_75999 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_76009 - BLOCK
      ?auto_76010 - BLOCK
      ?auto_76011 - BLOCK
      ?auto_76012 - BLOCK
      ?auto_76013 - BLOCK
      ?auto_76014 - BLOCK
      ?auto_76015 - BLOCK
      ?auto_76016 - BLOCK
    )
    :vars
    (
      ?auto_76017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76016 ?auto_76017 ) ( ON-TABLE ?auto_76009 ) ( not ( = ?auto_76009 ?auto_76010 ) ) ( not ( = ?auto_76009 ?auto_76011 ) ) ( not ( = ?auto_76009 ?auto_76012 ) ) ( not ( = ?auto_76009 ?auto_76013 ) ) ( not ( = ?auto_76009 ?auto_76014 ) ) ( not ( = ?auto_76009 ?auto_76015 ) ) ( not ( = ?auto_76009 ?auto_76016 ) ) ( not ( = ?auto_76009 ?auto_76017 ) ) ( not ( = ?auto_76010 ?auto_76011 ) ) ( not ( = ?auto_76010 ?auto_76012 ) ) ( not ( = ?auto_76010 ?auto_76013 ) ) ( not ( = ?auto_76010 ?auto_76014 ) ) ( not ( = ?auto_76010 ?auto_76015 ) ) ( not ( = ?auto_76010 ?auto_76016 ) ) ( not ( = ?auto_76010 ?auto_76017 ) ) ( not ( = ?auto_76011 ?auto_76012 ) ) ( not ( = ?auto_76011 ?auto_76013 ) ) ( not ( = ?auto_76011 ?auto_76014 ) ) ( not ( = ?auto_76011 ?auto_76015 ) ) ( not ( = ?auto_76011 ?auto_76016 ) ) ( not ( = ?auto_76011 ?auto_76017 ) ) ( not ( = ?auto_76012 ?auto_76013 ) ) ( not ( = ?auto_76012 ?auto_76014 ) ) ( not ( = ?auto_76012 ?auto_76015 ) ) ( not ( = ?auto_76012 ?auto_76016 ) ) ( not ( = ?auto_76012 ?auto_76017 ) ) ( not ( = ?auto_76013 ?auto_76014 ) ) ( not ( = ?auto_76013 ?auto_76015 ) ) ( not ( = ?auto_76013 ?auto_76016 ) ) ( not ( = ?auto_76013 ?auto_76017 ) ) ( not ( = ?auto_76014 ?auto_76015 ) ) ( not ( = ?auto_76014 ?auto_76016 ) ) ( not ( = ?auto_76014 ?auto_76017 ) ) ( not ( = ?auto_76015 ?auto_76016 ) ) ( not ( = ?auto_76015 ?auto_76017 ) ) ( not ( = ?auto_76016 ?auto_76017 ) ) ( ON ?auto_76015 ?auto_76016 ) ( ON ?auto_76014 ?auto_76015 ) ( ON ?auto_76013 ?auto_76014 ) ( ON ?auto_76012 ?auto_76013 ) ( ON ?auto_76011 ?auto_76012 ) ( CLEAR ?auto_76009 ) ( ON ?auto_76010 ?auto_76011 ) ( CLEAR ?auto_76010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76009 ?auto_76010 )
      ( MAKE-8PILE ?auto_76009 ?auto_76010 ?auto_76011 ?auto_76012 ?auto_76013 ?auto_76014 ?auto_76015 ?auto_76016 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_76026 - BLOCK
      ?auto_76027 - BLOCK
      ?auto_76028 - BLOCK
      ?auto_76029 - BLOCK
      ?auto_76030 - BLOCK
      ?auto_76031 - BLOCK
      ?auto_76032 - BLOCK
      ?auto_76033 - BLOCK
    )
    :vars
    (
      ?auto_76034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76033 ?auto_76034 ) ( ON-TABLE ?auto_76026 ) ( not ( = ?auto_76026 ?auto_76027 ) ) ( not ( = ?auto_76026 ?auto_76028 ) ) ( not ( = ?auto_76026 ?auto_76029 ) ) ( not ( = ?auto_76026 ?auto_76030 ) ) ( not ( = ?auto_76026 ?auto_76031 ) ) ( not ( = ?auto_76026 ?auto_76032 ) ) ( not ( = ?auto_76026 ?auto_76033 ) ) ( not ( = ?auto_76026 ?auto_76034 ) ) ( not ( = ?auto_76027 ?auto_76028 ) ) ( not ( = ?auto_76027 ?auto_76029 ) ) ( not ( = ?auto_76027 ?auto_76030 ) ) ( not ( = ?auto_76027 ?auto_76031 ) ) ( not ( = ?auto_76027 ?auto_76032 ) ) ( not ( = ?auto_76027 ?auto_76033 ) ) ( not ( = ?auto_76027 ?auto_76034 ) ) ( not ( = ?auto_76028 ?auto_76029 ) ) ( not ( = ?auto_76028 ?auto_76030 ) ) ( not ( = ?auto_76028 ?auto_76031 ) ) ( not ( = ?auto_76028 ?auto_76032 ) ) ( not ( = ?auto_76028 ?auto_76033 ) ) ( not ( = ?auto_76028 ?auto_76034 ) ) ( not ( = ?auto_76029 ?auto_76030 ) ) ( not ( = ?auto_76029 ?auto_76031 ) ) ( not ( = ?auto_76029 ?auto_76032 ) ) ( not ( = ?auto_76029 ?auto_76033 ) ) ( not ( = ?auto_76029 ?auto_76034 ) ) ( not ( = ?auto_76030 ?auto_76031 ) ) ( not ( = ?auto_76030 ?auto_76032 ) ) ( not ( = ?auto_76030 ?auto_76033 ) ) ( not ( = ?auto_76030 ?auto_76034 ) ) ( not ( = ?auto_76031 ?auto_76032 ) ) ( not ( = ?auto_76031 ?auto_76033 ) ) ( not ( = ?auto_76031 ?auto_76034 ) ) ( not ( = ?auto_76032 ?auto_76033 ) ) ( not ( = ?auto_76032 ?auto_76034 ) ) ( not ( = ?auto_76033 ?auto_76034 ) ) ( ON ?auto_76032 ?auto_76033 ) ( ON ?auto_76031 ?auto_76032 ) ( ON ?auto_76030 ?auto_76031 ) ( ON ?auto_76029 ?auto_76030 ) ( ON ?auto_76028 ?auto_76029 ) ( CLEAR ?auto_76026 ) ( ON ?auto_76027 ?auto_76028 ) ( CLEAR ?auto_76027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76026 ?auto_76027 )
      ( MAKE-8PILE ?auto_76026 ?auto_76027 ?auto_76028 ?auto_76029 ?auto_76030 ?auto_76031 ?auto_76032 ?auto_76033 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_76043 - BLOCK
      ?auto_76044 - BLOCK
      ?auto_76045 - BLOCK
      ?auto_76046 - BLOCK
      ?auto_76047 - BLOCK
      ?auto_76048 - BLOCK
      ?auto_76049 - BLOCK
      ?auto_76050 - BLOCK
    )
    :vars
    (
      ?auto_76051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76050 ?auto_76051 ) ( not ( = ?auto_76043 ?auto_76044 ) ) ( not ( = ?auto_76043 ?auto_76045 ) ) ( not ( = ?auto_76043 ?auto_76046 ) ) ( not ( = ?auto_76043 ?auto_76047 ) ) ( not ( = ?auto_76043 ?auto_76048 ) ) ( not ( = ?auto_76043 ?auto_76049 ) ) ( not ( = ?auto_76043 ?auto_76050 ) ) ( not ( = ?auto_76043 ?auto_76051 ) ) ( not ( = ?auto_76044 ?auto_76045 ) ) ( not ( = ?auto_76044 ?auto_76046 ) ) ( not ( = ?auto_76044 ?auto_76047 ) ) ( not ( = ?auto_76044 ?auto_76048 ) ) ( not ( = ?auto_76044 ?auto_76049 ) ) ( not ( = ?auto_76044 ?auto_76050 ) ) ( not ( = ?auto_76044 ?auto_76051 ) ) ( not ( = ?auto_76045 ?auto_76046 ) ) ( not ( = ?auto_76045 ?auto_76047 ) ) ( not ( = ?auto_76045 ?auto_76048 ) ) ( not ( = ?auto_76045 ?auto_76049 ) ) ( not ( = ?auto_76045 ?auto_76050 ) ) ( not ( = ?auto_76045 ?auto_76051 ) ) ( not ( = ?auto_76046 ?auto_76047 ) ) ( not ( = ?auto_76046 ?auto_76048 ) ) ( not ( = ?auto_76046 ?auto_76049 ) ) ( not ( = ?auto_76046 ?auto_76050 ) ) ( not ( = ?auto_76046 ?auto_76051 ) ) ( not ( = ?auto_76047 ?auto_76048 ) ) ( not ( = ?auto_76047 ?auto_76049 ) ) ( not ( = ?auto_76047 ?auto_76050 ) ) ( not ( = ?auto_76047 ?auto_76051 ) ) ( not ( = ?auto_76048 ?auto_76049 ) ) ( not ( = ?auto_76048 ?auto_76050 ) ) ( not ( = ?auto_76048 ?auto_76051 ) ) ( not ( = ?auto_76049 ?auto_76050 ) ) ( not ( = ?auto_76049 ?auto_76051 ) ) ( not ( = ?auto_76050 ?auto_76051 ) ) ( ON ?auto_76049 ?auto_76050 ) ( ON ?auto_76048 ?auto_76049 ) ( ON ?auto_76047 ?auto_76048 ) ( ON ?auto_76046 ?auto_76047 ) ( ON ?auto_76045 ?auto_76046 ) ( ON ?auto_76044 ?auto_76045 ) ( ON ?auto_76043 ?auto_76044 ) ( CLEAR ?auto_76043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76043 )
      ( MAKE-8PILE ?auto_76043 ?auto_76044 ?auto_76045 ?auto_76046 ?auto_76047 ?auto_76048 ?auto_76049 ?auto_76050 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_76060 - BLOCK
      ?auto_76061 - BLOCK
      ?auto_76062 - BLOCK
      ?auto_76063 - BLOCK
      ?auto_76064 - BLOCK
      ?auto_76065 - BLOCK
      ?auto_76066 - BLOCK
      ?auto_76067 - BLOCK
    )
    :vars
    (
      ?auto_76068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76067 ?auto_76068 ) ( not ( = ?auto_76060 ?auto_76061 ) ) ( not ( = ?auto_76060 ?auto_76062 ) ) ( not ( = ?auto_76060 ?auto_76063 ) ) ( not ( = ?auto_76060 ?auto_76064 ) ) ( not ( = ?auto_76060 ?auto_76065 ) ) ( not ( = ?auto_76060 ?auto_76066 ) ) ( not ( = ?auto_76060 ?auto_76067 ) ) ( not ( = ?auto_76060 ?auto_76068 ) ) ( not ( = ?auto_76061 ?auto_76062 ) ) ( not ( = ?auto_76061 ?auto_76063 ) ) ( not ( = ?auto_76061 ?auto_76064 ) ) ( not ( = ?auto_76061 ?auto_76065 ) ) ( not ( = ?auto_76061 ?auto_76066 ) ) ( not ( = ?auto_76061 ?auto_76067 ) ) ( not ( = ?auto_76061 ?auto_76068 ) ) ( not ( = ?auto_76062 ?auto_76063 ) ) ( not ( = ?auto_76062 ?auto_76064 ) ) ( not ( = ?auto_76062 ?auto_76065 ) ) ( not ( = ?auto_76062 ?auto_76066 ) ) ( not ( = ?auto_76062 ?auto_76067 ) ) ( not ( = ?auto_76062 ?auto_76068 ) ) ( not ( = ?auto_76063 ?auto_76064 ) ) ( not ( = ?auto_76063 ?auto_76065 ) ) ( not ( = ?auto_76063 ?auto_76066 ) ) ( not ( = ?auto_76063 ?auto_76067 ) ) ( not ( = ?auto_76063 ?auto_76068 ) ) ( not ( = ?auto_76064 ?auto_76065 ) ) ( not ( = ?auto_76064 ?auto_76066 ) ) ( not ( = ?auto_76064 ?auto_76067 ) ) ( not ( = ?auto_76064 ?auto_76068 ) ) ( not ( = ?auto_76065 ?auto_76066 ) ) ( not ( = ?auto_76065 ?auto_76067 ) ) ( not ( = ?auto_76065 ?auto_76068 ) ) ( not ( = ?auto_76066 ?auto_76067 ) ) ( not ( = ?auto_76066 ?auto_76068 ) ) ( not ( = ?auto_76067 ?auto_76068 ) ) ( ON ?auto_76066 ?auto_76067 ) ( ON ?auto_76065 ?auto_76066 ) ( ON ?auto_76064 ?auto_76065 ) ( ON ?auto_76063 ?auto_76064 ) ( ON ?auto_76062 ?auto_76063 ) ( ON ?auto_76061 ?auto_76062 ) ( ON ?auto_76060 ?auto_76061 ) ( CLEAR ?auto_76060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76060 )
      ( MAKE-8PILE ?auto_76060 ?auto_76061 ?auto_76062 ?auto_76063 ?auto_76064 ?auto_76065 ?auto_76066 ?auto_76067 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76078 - BLOCK
      ?auto_76079 - BLOCK
      ?auto_76080 - BLOCK
      ?auto_76081 - BLOCK
      ?auto_76082 - BLOCK
      ?auto_76083 - BLOCK
      ?auto_76084 - BLOCK
      ?auto_76085 - BLOCK
      ?auto_76086 - BLOCK
    )
    :vars
    (
      ?auto_76087 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76085 ) ( ON ?auto_76086 ?auto_76087 ) ( CLEAR ?auto_76086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76078 ) ( ON ?auto_76079 ?auto_76078 ) ( ON ?auto_76080 ?auto_76079 ) ( ON ?auto_76081 ?auto_76080 ) ( ON ?auto_76082 ?auto_76081 ) ( ON ?auto_76083 ?auto_76082 ) ( ON ?auto_76084 ?auto_76083 ) ( ON ?auto_76085 ?auto_76084 ) ( not ( = ?auto_76078 ?auto_76079 ) ) ( not ( = ?auto_76078 ?auto_76080 ) ) ( not ( = ?auto_76078 ?auto_76081 ) ) ( not ( = ?auto_76078 ?auto_76082 ) ) ( not ( = ?auto_76078 ?auto_76083 ) ) ( not ( = ?auto_76078 ?auto_76084 ) ) ( not ( = ?auto_76078 ?auto_76085 ) ) ( not ( = ?auto_76078 ?auto_76086 ) ) ( not ( = ?auto_76078 ?auto_76087 ) ) ( not ( = ?auto_76079 ?auto_76080 ) ) ( not ( = ?auto_76079 ?auto_76081 ) ) ( not ( = ?auto_76079 ?auto_76082 ) ) ( not ( = ?auto_76079 ?auto_76083 ) ) ( not ( = ?auto_76079 ?auto_76084 ) ) ( not ( = ?auto_76079 ?auto_76085 ) ) ( not ( = ?auto_76079 ?auto_76086 ) ) ( not ( = ?auto_76079 ?auto_76087 ) ) ( not ( = ?auto_76080 ?auto_76081 ) ) ( not ( = ?auto_76080 ?auto_76082 ) ) ( not ( = ?auto_76080 ?auto_76083 ) ) ( not ( = ?auto_76080 ?auto_76084 ) ) ( not ( = ?auto_76080 ?auto_76085 ) ) ( not ( = ?auto_76080 ?auto_76086 ) ) ( not ( = ?auto_76080 ?auto_76087 ) ) ( not ( = ?auto_76081 ?auto_76082 ) ) ( not ( = ?auto_76081 ?auto_76083 ) ) ( not ( = ?auto_76081 ?auto_76084 ) ) ( not ( = ?auto_76081 ?auto_76085 ) ) ( not ( = ?auto_76081 ?auto_76086 ) ) ( not ( = ?auto_76081 ?auto_76087 ) ) ( not ( = ?auto_76082 ?auto_76083 ) ) ( not ( = ?auto_76082 ?auto_76084 ) ) ( not ( = ?auto_76082 ?auto_76085 ) ) ( not ( = ?auto_76082 ?auto_76086 ) ) ( not ( = ?auto_76082 ?auto_76087 ) ) ( not ( = ?auto_76083 ?auto_76084 ) ) ( not ( = ?auto_76083 ?auto_76085 ) ) ( not ( = ?auto_76083 ?auto_76086 ) ) ( not ( = ?auto_76083 ?auto_76087 ) ) ( not ( = ?auto_76084 ?auto_76085 ) ) ( not ( = ?auto_76084 ?auto_76086 ) ) ( not ( = ?auto_76084 ?auto_76087 ) ) ( not ( = ?auto_76085 ?auto_76086 ) ) ( not ( = ?auto_76085 ?auto_76087 ) ) ( not ( = ?auto_76086 ?auto_76087 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76086 ?auto_76087 )
      ( !STACK ?auto_76086 ?auto_76085 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76097 - BLOCK
      ?auto_76098 - BLOCK
      ?auto_76099 - BLOCK
      ?auto_76100 - BLOCK
      ?auto_76101 - BLOCK
      ?auto_76102 - BLOCK
      ?auto_76103 - BLOCK
      ?auto_76104 - BLOCK
      ?auto_76105 - BLOCK
    )
    :vars
    (
      ?auto_76106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76104 ) ( ON ?auto_76105 ?auto_76106 ) ( CLEAR ?auto_76105 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76097 ) ( ON ?auto_76098 ?auto_76097 ) ( ON ?auto_76099 ?auto_76098 ) ( ON ?auto_76100 ?auto_76099 ) ( ON ?auto_76101 ?auto_76100 ) ( ON ?auto_76102 ?auto_76101 ) ( ON ?auto_76103 ?auto_76102 ) ( ON ?auto_76104 ?auto_76103 ) ( not ( = ?auto_76097 ?auto_76098 ) ) ( not ( = ?auto_76097 ?auto_76099 ) ) ( not ( = ?auto_76097 ?auto_76100 ) ) ( not ( = ?auto_76097 ?auto_76101 ) ) ( not ( = ?auto_76097 ?auto_76102 ) ) ( not ( = ?auto_76097 ?auto_76103 ) ) ( not ( = ?auto_76097 ?auto_76104 ) ) ( not ( = ?auto_76097 ?auto_76105 ) ) ( not ( = ?auto_76097 ?auto_76106 ) ) ( not ( = ?auto_76098 ?auto_76099 ) ) ( not ( = ?auto_76098 ?auto_76100 ) ) ( not ( = ?auto_76098 ?auto_76101 ) ) ( not ( = ?auto_76098 ?auto_76102 ) ) ( not ( = ?auto_76098 ?auto_76103 ) ) ( not ( = ?auto_76098 ?auto_76104 ) ) ( not ( = ?auto_76098 ?auto_76105 ) ) ( not ( = ?auto_76098 ?auto_76106 ) ) ( not ( = ?auto_76099 ?auto_76100 ) ) ( not ( = ?auto_76099 ?auto_76101 ) ) ( not ( = ?auto_76099 ?auto_76102 ) ) ( not ( = ?auto_76099 ?auto_76103 ) ) ( not ( = ?auto_76099 ?auto_76104 ) ) ( not ( = ?auto_76099 ?auto_76105 ) ) ( not ( = ?auto_76099 ?auto_76106 ) ) ( not ( = ?auto_76100 ?auto_76101 ) ) ( not ( = ?auto_76100 ?auto_76102 ) ) ( not ( = ?auto_76100 ?auto_76103 ) ) ( not ( = ?auto_76100 ?auto_76104 ) ) ( not ( = ?auto_76100 ?auto_76105 ) ) ( not ( = ?auto_76100 ?auto_76106 ) ) ( not ( = ?auto_76101 ?auto_76102 ) ) ( not ( = ?auto_76101 ?auto_76103 ) ) ( not ( = ?auto_76101 ?auto_76104 ) ) ( not ( = ?auto_76101 ?auto_76105 ) ) ( not ( = ?auto_76101 ?auto_76106 ) ) ( not ( = ?auto_76102 ?auto_76103 ) ) ( not ( = ?auto_76102 ?auto_76104 ) ) ( not ( = ?auto_76102 ?auto_76105 ) ) ( not ( = ?auto_76102 ?auto_76106 ) ) ( not ( = ?auto_76103 ?auto_76104 ) ) ( not ( = ?auto_76103 ?auto_76105 ) ) ( not ( = ?auto_76103 ?auto_76106 ) ) ( not ( = ?auto_76104 ?auto_76105 ) ) ( not ( = ?auto_76104 ?auto_76106 ) ) ( not ( = ?auto_76105 ?auto_76106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76105 ?auto_76106 )
      ( !STACK ?auto_76105 ?auto_76104 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76116 - BLOCK
      ?auto_76117 - BLOCK
      ?auto_76118 - BLOCK
      ?auto_76119 - BLOCK
      ?auto_76120 - BLOCK
      ?auto_76121 - BLOCK
      ?auto_76122 - BLOCK
      ?auto_76123 - BLOCK
      ?auto_76124 - BLOCK
    )
    :vars
    (
      ?auto_76125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76124 ?auto_76125 ) ( ON-TABLE ?auto_76116 ) ( ON ?auto_76117 ?auto_76116 ) ( ON ?auto_76118 ?auto_76117 ) ( ON ?auto_76119 ?auto_76118 ) ( ON ?auto_76120 ?auto_76119 ) ( ON ?auto_76121 ?auto_76120 ) ( ON ?auto_76122 ?auto_76121 ) ( not ( = ?auto_76116 ?auto_76117 ) ) ( not ( = ?auto_76116 ?auto_76118 ) ) ( not ( = ?auto_76116 ?auto_76119 ) ) ( not ( = ?auto_76116 ?auto_76120 ) ) ( not ( = ?auto_76116 ?auto_76121 ) ) ( not ( = ?auto_76116 ?auto_76122 ) ) ( not ( = ?auto_76116 ?auto_76123 ) ) ( not ( = ?auto_76116 ?auto_76124 ) ) ( not ( = ?auto_76116 ?auto_76125 ) ) ( not ( = ?auto_76117 ?auto_76118 ) ) ( not ( = ?auto_76117 ?auto_76119 ) ) ( not ( = ?auto_76117 ?auto_76120 ) ) ( not ( = ?auto_76117 ?auto_76121 ) ) ( not ( = ?auto_76117 ?auto_76122 ) ) ( not ( = ?auto_76117 ?auto_76123 ) ) ( not ( = ?auto_76117 ?auto_76124 ) ) ( not ( = ?auto_76117 ?auto_76125 ) ) ( not ( = ?auto_76118 ?auto_76119 ) ) ( not ( = ?auto_76118 ?auto_76120 ) ) ( not ( = ?auto_76118 ?auto_76121 ) ) ( not ( = ?auto_76118 ?auto_76122 ) ) ( not ( = ?auto_76118 ?auto_76123 ) ) ( not ( = ?auto_76118 ?auto_76124 ) ) ( not ( = ?auto_76118 ?auto_76125 ) ) ( not ( = ?auto_76119 ?auto_76120 ) ) ( not ( = ?auto_76119 ?auto_76121 ) ) ( not ( = ?auto_76119 ?auto_76122 ) ) ( not ( = ?auto_76119 ?auto_76123 ) ) ( not ( = ?auto_76119 ?auto_76124 ) ) ( not ( = ?auto_76119 ?auto_76125 ) ) ( not ( = ?auto_76120 ?auto_76121 ) ) ( not ( = ?auto_76120 ?auto_76122 ) ) ( not ( = ?auto_76120 ?auto_76123 ) ) ( not ( = ?auto_76120 ?auto_76124 ) ) ( not ( = ?auto_76120 ?auto_76125 ) ) ( not ( = ?auto_76121 ?auto_76122 ) ) ( not ( = ?auto_76121 ?auto_76123 ) ) ( not ( = ?auto_76121 ?auto_76124 ) ) ( not ( = ?auto_76121 ?auto_76125 ) ) ( not ( = ?auto_76122 ?auto_76123 ) ) ( not ( = ?auto_76122 ?auto_76124 ) ) ( not ( = ?auto_76122 ?auto_76125 ) ) ( not ( = ?auto_76123 ?auto_76124 ) ) ( not ( = ?auto_76123 ?auto_76125 ) ) ( not ( = ?auto_76124 ?auto_76125 ) ) ( CLEAR ?auto_76122 ) ( ON ?auto_76123 ?auto_76124 ) ( CLEAR ?auto_76123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_76116 ?auto_76117 ?auto_76118 ?auto_76119 ?auto_76120 ?auto_76121 ?auto_76122 ?auto_76123 )
      ( MAKE-9PILE ?auto_76116 ?auto_76117 ?auto_76118 ?auto_76119 ?auto_76120 ?auto_76121 ?auto_76122 ?auto_76123 ?auto_76124 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76135 - BLOCK
      ?auto_76136 - BLOCK
      ?auto_76137 - BLOCK
      ?auto_76138 - BLOCK
      ?auto_76139 - BLOCK
      ?auto_76140 - BLOCK
      ?auto_76141 - BLOCK
      ?auto_76142 - BLOCK
      ?auto_76143 - BLOCK
    )
    :vars
    (
      ?auto_76144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76143 ?auto_76144 ) ( ON-TABLE ?auto_76135 ) ( ON ?auto_76136 ?auto_76135 ) ( ON ?auto_76137 ?auto_76136 ) ( ON ?auto_76138 ?auto_76137 ) ( ON ?auto_76139 ?auto_76138 ) ( ON ?auto_76140 ?auto_76139 ) ( ON ?auto_76141 ?auto_76140 ) ( not ( = ?auto_76135 ?auto_76136 ) ) ( not ( = ?auto_76135 ?auto_76137 ) ) ( not ( = ?auto_76135 ?auto_76138 ) ) ( not ( = ?auto_76135 ?auto_76139 ) ) ( not ( = ?auto_76135 ?auto_76140 ) ) ( not ( = ?auto_76135 ?auto_76141 ) ) ( not ( = ?auto_76135 ?auto_76142 ) ) ( not ( = ?auto_76135 ?auto_76143 ) ) ( not ( = ?auto_76135 ?auto_76144 ) ) ( not ( = ?auto_76136 ?auto_76137 ) ) ( not ( = ?auto_76136 ?auto_76138 ) ) ( not ( = ?auto_76136 ?auto_76139 ) ) ( not ( = ?auto_76136 ?auto_76140 ) ) ( not ( = ?auto_76136 ?auto_76141 ) ) ( not ( = ?auto_76136 ?auto_76142 ) ) ( not ( = ?auto_76136 ?auto_76143 ) ) ( not ( = ?auto_76136 ?auto_76144 ) ) ( not ( = ?auto_76137 ?auto_76138 ) ) ( not ( = ?auto_76137 ?auto_76139 ) ) ( not ( = ?auto_76137 ?auto_76140 ) ) ( not ( = ?auto_76137 ?auto_76141 ) ) ( not ( = ?auto_76137 ?auto_76142 ) ) ( not ( = ?auto_76137 ?auto_76143 ) ) ( not ( = ?auto_76137 ?auto_76144 ) ) ( not ( = ?auto_76138 ?auto_76139 ) ) ( not ( = ?auto_76138 ?auto_76140 ) ) ( not ( = ?auto_76138 ?auto_76141 ) ) ( not ( = ?auto_76138 ?auto_76142 ) ) ( not ( = ?auto_76138 ?auto_76143 ) ) ( not ( = ?auto_76138 ?auto_76144 ) ) ( not ( = ?auto_76139 ?auto_76140 ) ) ( not ( = ?auto_76139 ?auto_76141 ) ) ( not ( = ?auto_76139 ?auto_76142 ) ) ( not ( = ?auto_76139 ?auto_76143 ) ) ( not ( = ?auto_76139 ?auto_76144 ) ) ( not ( = ?auto_76140 ?auto_76141 ) ) ( not ( = ?auto_76140 ?auto_76142 ) ) ( not ( = ?auto_76140 ?auto_76143 ) ) ( not ( = ?auto_76140 ?auto_76144 ) ) ( not ( = ?auto_76141 ?auto_76142 ) ) ( not ( = ?auto_76141 ?auto_76143 ) ) ( not ( = ?auto_76141 ?auto_76144 ) ) ( not ( = ?auto_76142 ?auto_76143 ) ) ( not ( = ?auto_76142 ?auto_76144 ) ) ( not ( = ?auto_76143 ?auto_76144 ) ) ( CLEAR ?auto_76141 ) ( ON ?auto_76142 ?auto_76143 ) ( CLEAR ?auto_76142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_76135 ?auto_76136 ?auto_76137 ?auto_76138 ?auto_76139 ?auto_76140 ?auto_76141 ?auto_76142 )
      ( MAKE-9PILE ?auto_76135 ?auto_76136 ?auto_76137 ?auto_76138 ?auto_76139 ?auto_76140 ?auto_76141 ?auto_76142 ?auto_76143 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76154 - BLOCK
      ?auto_76155 - BLOCK
      ?auto_76156 - BLOCK
      ?auto_76157 - BLOCK
      ?auto_76158 - BLOCK
      ?auto_76159 - BLOCK
      ?auto_76160 - BLOCK
      ?auto_76161 - BLOCK
      ?auto_76162 - BLOCK
    )
    :vars
    (
      ?auto_76163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76162 ?auto_76163 ) ( ON-TABLE ?auto_76154 ) ( ON ?auto_76155 ?auto_76154 ) ( ON ?auto_76156 ?auto_76155 ) ( ON ?auto_76157 ?auto_76156 ) ( ON ?auto_76158 ?auto_76157 ) ( ON ?auto_76159 ?auto_76158 ) ( not ( = ?auto_76154 ?auto_76155 ) ) ( not ( = ?auto_76154 ?auto_76156 ) ) ( not ( = ?auto_76154 ?auto_76157 ) ) ( not ( = ?auto_76154 ?auto_76158 ) ) ( not ( = ?auto_76154 ?auto_76159 ) ) ( not ( = ?auto_76154 ?auto_76160 ) ) ( not ( = ?auto_76154 ?auto_76161 ) ) ( not ( = ?auto_76154 ?auto_76162 ) ) ( not ( = ?auto_76154 ?auto_76163 ) ) ( not ( = ?auto_76155 ?auto_76156 ) ) ( not ( = ?auto_76155 ?auto_76157 ) ) ( not ( = ?auto_76155 ?auto_76158 ) ) ( not ( = ?auto_76155 ?auto_76159 ) ) ( not ( = ?auto_76155 ?auto_76160 ) ) ( not ( = ?auto_76155 ?auto_76161 ) ) ( not ( = ?auto_76155 ?auto_76162 ) ) ( not ( = ?auto_76155 ?auto_76163 ) ) ( not ( = ?auto_76156 ?auto_76157 ) ) ( not ( = ?auto_76156 ?auto_76158 ) ) ( not ( = ?auto_76156 ?auto_76159 ) ) ( not ( = ?auto_76156 ?auto_76160 ) ) ( not ( = ?auto_76156 ?auto_76161 ) ) ( not ( = ?auto_76156 ?auto_76162 ) ) ( not ( = ?auto_76156 ?auto_76163 ) ) ( not ( = ?auto_76157 ?auto_76158 ) ) ( not ( = ?auto_76157 ?auto_76159 ) ) ( not ( = ?auto_76157 ?auto_76160 ) ) ( not ( = ?auto_76157 ?auto_76161 ) ) ( not ( = ?auto_76157 ?auto_76162 ) ) ( not ( = ?auto_76157 ?auto_76163 ) ) ( not ( = ?auto_76158 ?auto_76159 ) ) ( not ( = ?auto_76158 ?auto_76160 ) ) ( not ( = ?auto_76158 ?auto_76161 ) ) ( not ( = ?auto_76158 ?auto_76162 ) ) ( not ( = ?auto_76158 ?auto_76163 ) ) ( not ( = ?auto_76159 ?auto_76160 ) ) ( not ( = ?auto_76159 ?auto_76161 ) ) ( not ( = ?auto_76159 ?auto_76162 ) ) ( not ( = ?auto_76159 ?auto_76163 ) ) ( not ( = ?auto_76160 ?auto_76161 ) ) ( not ( = ?auto_76160 ?auto_76162 ) ) ( not ( = ?auto_76160 ?auto_76163 ) ) ( not ( = ?auto_76161 ?auto_76162 ) ) ( not ( = ?auto_76161 ?auto_76163 ) ) ( not ( = ?auto_76162 ?auto_76163 ) ) ( ON ?auto_76161 ?auto_76162 ) ( CLEAR ?auto_76159 ) ( ON ?auto_76160 ?auto_76161 ) ( CLEAR ?auto_76160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76154 ?auto_76155 ?auto_76156 ?auto_76157 ?auto_76158 ?auto_76159 ?auto_76160 )
      ( MAKE-9PILE ?auto_76154 ?auto_76155 ?auto_76156 ?auto_76157 ?auto_76158 ?auto_76159 ?auto_76160 ?auto_76161 ?auto_76162 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76173 - BLOCK
      ?auto_76174 - BLOCK
      ?auto_76175 - BLOCK
      ?auto_76176 - BLOCK
      ?auto_76177 - BLOCK
      ?auto_76178 - BLOCK
      ?auto_76179 - BLOCK
      ?auto_76180 - BLOCK
      ?auto_76181 - BLOCK
    )
    :vars
    (
      ?auto_76182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76181 ?auto_76182 ) ( ON-TABLE ?auto_76173 ) ( ON ?auto_76174 ?auto_76173 ) ( ON ?auto_76175 ?auto_76174 ) ( ON ?auto_76176 ?auto_76175 ) ( ON ?auto_76177 ?auto_76176 ) ( ON ?auto_76178 ?auto_76177 ) ( not ( = ?auto_76173 ?auto_76174 ) ) ( not ( = ?auto_76173 ?auto_76175 ) ) ( not ( = ?auto_76173 ?auto_76176 ) ) ( not ( = ?auto_76173 ?auto_76177 ) ) ( not ( = ?auto_76173 ?auto_76178 ) ) ( not ( = ?auto_76173 ?auto_76179 ) ) ( not ( = ?auto_76173 ?auto_76180 ) ) ( not ( = ?auto_76173 ?auto_76181 ) ) ( not ( = ?auto_76173 ?auto_76182 ) ) ( not ( = ?auto_76174 ?auto_76175 ) ) ( not ( = ?auto_76174 ?auto_76176 ) ) ( not ( = ?auto_76174 ?auto_76177 ) ) ( not ( = ?auto_76174 ?auto_76178 ) ) ( not ( = ?auto_76174 ?auto_76179 ) ) ( not ( = ?auto_76174 ?auto_76180 ) ) ( not ( = ?auto_76174 ?auto_76181 ) ) ( not ( = ?auto_76174 ?auto_76182 ) ) ( not ( = ?auto_76175 ?auto_76176 ) ) ( not ( = ?auto_76175 ?auto_76177 ) ) ( not ( = ?auto_76175 ?auto_76178 ) ) ( not ( = ?auto_76175 ?auto_76179 ) ) ( not ( = ?auto_76175 ?auto_76180 ) ) ( not ( = ?auto_76175 ?auto_76181 ) ) ( not ( = ?auto_76175 ?auto_76182 ) ) ( not ( = ?auto_76176 ?auto_76177 ) ) ( not ( = ?auto_76176 ?auto_76178 ) ) ( not ( = ?auto_76176 ?auto_76179 ) ) ( not ( = ?auto_76176 ?auto_76180 ) ) ( not ( = ?auto_76176 ?auto_76181 ) ) ( not ( = ?auto_76176 ?auto_76182 ) ) ( not ( = ?auto_76177 ?auto_76178 ) ) ( not ( = ?auto_76177 ?auto_76179 ) ) ( not ( = ?auto_76177 ?auto_76180 ) ) ( not ( = ?auto_76177 ?auto_76181 ) ) ( not ( = ?auto_76177 ?auto_76182 ) ) ( not ( = ?auto_76178 ?auto_76179 ) ) ( not ( = ?auto_76178 ?auto_76180 ) ) ( not ( = ?auto_76178 ?auto_76181 ) ) ( not ( = ?auto_76178 ?auto_76182 ) ) ( not ( = ?auto_76179 ?auto_76180 ) ) ( not ( = ?auto_76179 ?auto_76181 ) ) ( not ( = ?auto_76179 ?auto_76182 ) ) ( not ( = ?auto_76180 ?auto_76181 ) ) ( not ( = ?auto_76180 ?auto_76182 ) ) ( not ( = ?auto_76181 ?auto_76182 ) ) ( ON ?auto_76180 ?auto_76181 ) ( CLEAR ?auto_76178 ) ( ON ?auto_76179 ?auto_76180 ) ( CLEAR ?auto_76179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76173 ?auto_76174 ?auto_76175 ?auto_76176 ?auto_76177 ?auto_76178 ?auto_76179 )
      ( MAKE-9PILE ?auto_76173 ?auto_76174 ?auto_76175 ?auto_76176 ?auto_76177 ?auto_76178 ?auto_76179 ?auto_76180 ?auto_76181 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76192 - BLOCK
      ?auto_76193 - BLOCK
      ?auto_76194 - BLOCK
      ?auto_76195 - BLOCK
      ?auto_76196 - BLOCK
      ?auto_76197 - BLOCK
      ?auto_76198 - BLOCK
      ?auto_76199 - BLOCK
      ?auto_76200 - BLOCK
    )
    :vars
    (
      ?auto_76201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76200 ?auto_76201 ) ( ON-TABLE ?auto_76192 ) ( ON ?auto_76193 ?auto_76192 ) ( ON ?auto_76194 ?auto_76193 ) ( ON ?auto_76195 ?auto_76194 ) ( ON ?auto_76196 ?auto_76195 ) ( not ( = ?auto_76192 ?auto_76193 ) ) ( not ( = ?auto_76192 ?auto_76194 ) ) ( not ( = ?auto_76192 ?auto_76195 ) ) ( not ( = ?auto_76192 ?auto_76196 ) ) ( not ( = ?auto_76192 ?auto_76197 ) ) ( not ( = ?auto_76192 ?auto_76198 ) ) ( not ( = ?auto_76192 ?auto_76199 ) ) ( not ( = ?auto_76192 ?auto_76200 ) ) ( not ( = ?auto_76192 ?auto_76201 ) ) ( not ( = ?auto_76193 ?auto_76194 ) ) ( not ( = ?auto_76193 ?auto_76195 ) ) ( not ( = ?auto_76193 ?auto_76196 ) ) ( not ( = ?auto_76193 ?auto_76197 ) ) ( not ( = ?auto_76193 ?auto_76198 ) ) ( not ( = ?auto_76193 ?auto_76199 ) ) ( not ( = ?auto_76193 ?auto_76200 ) ) ( not ( = ?auto_76193 ?auto_76201 ) ) ( not ( = ?auto_76194 ?auto_76195 ) ) ( not ( = ?auto_76194 ?auto_76196 ) ) ( not ( = ?auto_76194 ?auto_76197 ) ) ( not ( = ?auto_76194 ?auto_76198 ) ) ( not ( = ?auto_76194 ?auto_76199 ) ) ( not ( = ?auto_76194 ?auto_76200 ) ) ( not ( = ?auto_76194 ?auto_76201 ) ) ( not ( = ?auto_76195 ?auto_76196 ) ) ( not ( = ?auto_76195 ?auto_76197 ) ) ( not ( = ?auto_76195 ?auto_76198 ) ) ( not ( = ?auto_76195 ?auto_76199 ) ) ( not ( = ?auto_76195 ?auto_76200 ) ) ( not ( = ?auto_76195 ?auto_76201 ) ) ( not ( = ?auto_76196 ?auto_76197 ) ) ( not ( = ?auto_76196 ?auto_76198 ) ) ( not ( = ?auto_76196 ?auto_76199 ) ) ( not ( = ?auto_76196 ?auto_76200 ) ) ( not ( = ?auto_76196 ?auto_76201 ) ) ( not ( = ?auto_76197 ?auto_76198 ) ) ( not ( = ?auto_76197 ?auto_76199 ) ) ( not ( = ?auto_76197 ?auto_76200 ) ) ( not ( = ?auto_76197 ?auto_76201 ) ) ( not ( = ?auto_76198 ?auto_76199 ) ) ( not ( = ?auto_76198 ?auto_76200 ) ) ( not ( = ?auto_76198 ?auto_76201 ) ) ( not ( = ?auto_76199 ?auto_76200 ) ) ( not ( = ?auto_76199 ?auto_76201 ) ) ( not ( = ?auto_76200 ?auto_76201 ) ) ( ON ?auto_76199 ?auto_76200 ) ( ON ?auto_76198 ?auto_76199 ) ( CLEAR ?auto_76196 ) ( ON ?auto_76197 ?auto_76198 ) ( CLEAR ?auto_76197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76192 ?auto_76193 ?auto_76194 ?auto_76195 ?auto_76196 ?auto_76197 )
      ( MAKE-9PILE ?auto_76192 ?auto_76193 ?auto_76194 ?auto_76195 ?auto_76196 ?auto_76197 ?auto_76198 ?auto_76199 ?auto_76200 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76211 - BLOCK
      ?auto_76212 - BLOCK
      ?auto_76213 - BLOCK
      ?auto_76214 - BLOCK
      ?auto_76215 - BLOCK
      ?auto_76216 - BLOCK
      ?auto_76217 - BLOCK
      ?auto_76218 - BLOCK
      ?auto_76219 - BLOCK
    )
    :vars
    (
      ?auto_76220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76219 ?auto_76220 ) ( ON-TABLE ?auto_76211 ) ( ON ?auto_76212 ?auto_76211 ) ( ON ?auto_76213 ?auto_76212 ) ( ON ?auto_76214 ?auto_76213 ) ( ON ?auto_76215 ?auto_76214 ) ( not ( = ?auto_76211 ?auto_76212 ) ) ( not ( = ?auto_76211 ?auto_76213 ) ) ( not ( = ?auto_76211 ?auto_76214 ) ) ( not ( = ?auto_76211 ?auto_76215 ) ) ( not ( = ?auto_76211 ?auto_76216 ) ) ( not ( = ?auto_76211 ?auto_76217 ) ) ( not ( = ?auto_76211 ?auto_76218 ) ) ( not ( = ?auto_76211 ?auto_76219 ) ) ( not ( = ?auto_76211 ?auto_76220 ) ) ( not ( = ?auto_76212 ?auto_76213 ) ) ( not ( = ?auto_76212 ?auto_76214 ) ) ( not ( = ?auto_76212 ?auto_76215 ) ) ( not ( = ?auto_76212 ?auto_76216 ) ) ( not ( = ?auto_76212 ?auto_76217 ) ) ( not ( = ?auto_76212 ?auto_76218 ) ) ( not ( = ?auto_76212 ?auto_76219 ) ) ( not ( = ?auto_76212 ?auto_76220 ) ) ( not ( = ?auto_76213 ?auto_76214 ) ) ( not ( = ?auto_76213 ?auto_76215 ) ) ( not ( = ?auto_76213 ?auto_76216 ) ) ( not ( = ?auto_76213 ?auto_76217 ) ) ( not ( = ?auto_76213 ?auto_76218 ) ) ( not ( = ?auto_76213 ?auto_76219 ) ) ( not ( = ?auto_76213 ?auto_76220 ) ) ( not ( = ?auto_76214 ?auto_76215 ) ) ( not ( = ?auto_76214 ?auto_76216 ) ) ( not ( = ?auto_76214 ?auto_76217 ) ) ( not ( = ?auto_76214 ?auto_76218 ) ) ( not ( = ?auto_76214 ?auto_76219 ) ) ( not ( = ?auto_76214 ?auto_76220 ) ) ( not ( = ?auto_76215 ?auto_76216 ) ) ( not ( = ?auto_76215 ?auto_76217 ) ) ( not ( = ?auto_76215 ?auto_76218 ) ) ( not ( = ?auto_76215 ?auto_76219 ) ) ( not ( = ?auto_76215 ?auto_76220 ) ) ( not ( = ?auto_76216 ?auto_76217 ) ) ( not ( = ?auto_76216 ?auto_76218 ) ) ( not ( = ?auto_76216 ?auto_76219 ) ) ( not ( = ?auto_76216 ?auto_76220 ) ) ( not ( = ?auto_76217 ?auto_76218 ) ) ( not ( = ?auto_76217 ?auto_76219 ) ) ( not ( = ?auto_76217 ?auto_76220 ) ) ( not ( = ?auto_76218 ?auto_76219 ) ) ( not ( = ?auto_76218 ?auto_76220 ) ) ( not ( = ?auto_76219 ?auto_76220 ) ) ( ON ?auto_76218 ?auto_76219 ) ( ON ?auto_76217 ?auto_76218 ) ( CLEAR ?auto_76215 ) ( ON ?auto_76216 ?auto_76217 ) ( CLEAR ?auto_76216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76211 ?auto_76212 ?auto_76213 ?auto_76214 ?auto_76215 ?auto_76216 )
      ( MAKE-9PILE ?auto_76211 ?auto_76212 ?auto_76213 ?auto_76214 ?auto_76215 ?auto_76216 ?auto_76217 ?auto_76218 ?auto_76219 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76230 - BLOCK
      ?auto_76231 - BLOCK
      ?auto_76232 - BLOCK
      ?auto_76233 - BLOCK
      ?auto_76234 - BLOCK
      ?auto_76235 - BLOCK
      ?auto_76236 - BLOCK
      ?auto_76237 - BLOCK
      ?auto_76238 - BLOCK
    )
    :vars
    (
      ?auto_76239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76238 ?auto_76239 ) ( ON-TABLE ?auto_76230 ) ( ON ?auto_76231 ?auto_76230 ) ( ON ?auto_76232 ?auto_76231 ) ( ON ?auto_76233 ?auto_76232 ) ( not ( = ?auto_76230 ?auto_76231 ) ) ( not ( = ?auto_76230 ?auto_76232 ) ) ( not ( = ?auto_76230 ?auto_76233 ) ) ( not ( = ?auto_76230 ?auto_76234 ) ) ( not ( = ?auto_76230 ?auto_76235 ) ) ( not ( = ?auto_76230 ?auto_76236 ) ) ( not ( = ?auto_76230 ?auto_76237 ) ) ( not ( = ?auto_76230 ?auto_76238 ) ) ( not ( = ?auto_76230 ?auto_76239 ) ) ( not ( = ?auto_76231 ?auto_76232 ) ) ( not ( = ?auto_76231 ?auto_76233 ) ) ( not ( = ?auto_76231 ?auto_76234 ) ) ( not ( = ?auto_76231 ?auto_76235 ) ) ( not ( = ?auto_76231 ?auto_76236 ) ) ( not ( = ?auto_76231 ?auto_76237 ) ) ( not ( = ?auto_76231 ?auto_76238 ) ) ( not ( = ?auto_76231 ?auto_76239 ) ) ( not ( = ?auto_76232 ?auto_76233 ) ) ( not ( = ?auto_76232 ?auto_76234 ) ) ( not ( = ?auto_76232 ?auto_76235 ) ) ( not ( = ?auto_76232 ?auto_76236 ) ) ( not ( = ?auto_76232 ?auto_76237 ) ) ( not ( = ?auto_76232 ?auto_76238 ) ) ( not ( = ?auto_76232 ?auto_76239 ) ) ( not ( = ?auto_76233 ?auto_76234 ) ) ( not ( = ?auto_76233 ?auto_76235 ) ) ( not ( = ?auto_76233 ?auto_76236 ) ) ( not ( = ?auto_76233 ?auto_76237 ) ) ( not ( = ?auto_76233 ?auto_76238 ) ) ( not ( = ?auto_76233 ?auto_76239 ) ) ( not ( = ?auto_76234 ?auto_76235 ) ) ( not ( = ?auto_76234 ?auto_76236 ) ) ( not ( = ?auto_76234 ?auto_76237 ) ) ( not ( = ?auto_76234 ?auto_76238 ) ) ( not ( = ?auto_76234 ?auto_76239 ) ) ( not ( = ?auto_76235 ?auto_76236 ) ) ( not ( = ?auto_76235 ?auto_76237 ) ) ( not ( = ?auto_76235 ?auto_76238 ) ) ( not ( = ?auto_76235 ?auto_76239 ) ) ( not ( = ?auto_76236 ?auto_76237 ) ) ( not ( = ?auto_76236 ?auto_76238 ) ) ( not ( = ?auto_76236 ?auto_76239 ) ) ( not ( = ?auto_76237 ?auto_76238 ) ) ( not ( = ?auto_76237 ?auto_76239 ) ) ( not ( = ?auto_76238 ?auto_76239 ) ) ( ON ?auto_76237 ?auto_76238 ) ( ON ?auto_76236 ?auto_76237 ) ( ON ?auto_76235 ?auto_76236 ) ( CLEAR ?auto_76233 ) ( ON ?auto_76234 ?auto_76235 ) ( CLEAR ?auto_76234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76230 ?auto_76231 ?auto_76232 ?auto_76233 ?auto_76234 )
      ( MAKE-9PILE ?auto_76230 ?auto_76231 ?auto_76232 ?auto_76233 ?auto_76234 ?auto_76235 ?auto_76236 ?auto_76237 ?auto_76238 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76249 - BLOCK
      ?auto_76250 - BLOCK
      ?auto_76251 - BLOCK
      ?auto_76252 - BLOCK
      ?auto_76253 - BLOCK
      ?auto_76254 - BLOCK
      ?auto_76255 - BLOCK
      ?auto_76256 - BLOCK
      ?auto_76257 - BLOCK
    )
    :vars
    (
      ?auto_76258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76257 ?auto_76258 ) ( ON-TABLE ?auto_76249 ) ( ON ?auto_76250 ?auto_76249 ) ( ON ?auto_76251 ?auto_76250 ) ( ON ?auto_76252 ?auto_76251 ) ( not ( = ?auto_76249 ?auto_76250 ) ) ( not ( = ?auto_76249 ?auto_76251 ) ) ( not ( = ?auto_76249 ?auto_76252 ) ) ( not ( = ?auto_76249 ?auto_76253 ) ) ( not ( = ?auto_76249 ?auto_76254 ) ) ( not ( = ?auto_76249 ?auto_76255 ) ) ( not ( = ?auto_76249 ?auto_76256 ) ) ( not ( = ?auto_76249 ?auto_76257 ) ) ( not ( = ?auto_76249 ?auto_76258 ) ) ( not ( = ?auto_76250 ?auto_76251 ) ) ( not ( = ?auto_76250 ?auto_76252 ) ) ( not ( = ?auto_76250 ?auto_76253 ) ) ( not ( = ?auto_76250 ?auto_76254 ) ) ( not ( = ?auto_76250 ?auto_76255 ) ) ( not ( = ?auto_76250 ?auto_76256 ) ) ( not ( = ?auto_76250 ?auto_76257 ) ) ( not ( = ?auto_76250 ?auto_76258 ) ) ( not ( = ?auto_76251 ?auto_76252 ) ) ( not ( = ?auto_76251 ?auto_76253 ) ) ( not ( = ?auto_76251 ?auto_76254 ) ) ( not ( = ?auto_76251 ?auto_76255 ) ) ( not ( = ?auto_76251 ?auto_76256 ) ) ( not ( = ?auto_76251 ?auto_76257 ) ) ( not ( = ?auto_76251 ?auto_76258 ) ) ( not ( = ?auto_76252 ?auto_76253 ) ) ( not ( = ?auto_76252 ?auto_76254 ) ) ( not ( = ?auto_76252 ?auto_76255 ) ) ( not ( = ?auto_76252 ?auto_76256 ) ) ( not ( = ?auto_76252 ?auto_76257 ) ) ( not ( = ?auto_76252 ?auto_76258 ) ) ( not ( = ?auto_76253 ?auto_76254 ) ) ( not ( = ?auto_76253 ?auto_76255 ) ) ( not ( = ?auto_76253 ?auto_76256 ) ) ( not ( = ?auto_76253 ?auto_76257 ) ) ( not ( = ?auto_76253 ?auto_76258 ) ) ( not ( = ?auto_76254 ?auto_76255 ) ) ( not ( = ?auto_76254 ?auto_76256 ) ) ( not ( = ?auto_76254 ?auto_76257 ) ) ( not ( = ?auto_76254 ?auto_76258 ) ) ( not ( = ?auto_76255 ?auto_76256 ) ) ( not ( = ?auto_76255 ?auto_76257 ) ) ( not ( = ?auto_76255 ?auto_76258 ) ) ( not ( = ?auto_76256 ?auto_76257 ) ) ( not ( = ?auto_76256 ?auto_76258 ) ) ( not ( = ?auto_76257 ?auto_76258 ) ) ( ON ?auto_76256 ?auto_76257 ) ( ON ?auto_76255 ?auto_76256 ) ( ON ?auto_76254 ?auto_76255 ) ( CLEAR ?auto_76252 ) ( ON ?auto_76253 ?auto_76254 ) ( CLEAR ?auto_76253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76249 ?auto_76250 ?auto_76251 ?auto_76252 ?auto_76253 )
      ( MAKE-9PILE ?auto_76249 ?auto_76250 ?auto_76251 ?auto_76252 ?auto_76253 ?auto_76254 ?auto_76255 ?auto_76256 ?auto_76257 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76268 - BLOCK
      ?auto_76269 - BLOCK
      ?auto_76270 - BLOCK
      ?auto_76271 - BLOCK
      ?auto_76272 - BLOCK
      ?auto_76273 - BLOCK
      ?auto_76274 - BLOCK
      ?auto_76275 - BLOCK
      ?auto_76276 - BLOCK
    )
    :vars
    (
      ?auto_76277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76276 ?auto_76277 ) ( ON-TABLE ?auto_76268 ) ( ON ?auto_76269 ?auto_76268 ) ( ON ?auto_76270 ?auto_76269 ) ( not ( = ?auto_76268 ?auto_76269 ) ) ( not ( = ?auto_76268 ?auto_76270 ) ) ( not ( = ?auto_76268 ?auto_76271 ) ) ( not ( = ?auto_76268 ?auto_76272 ) ) ( not ( = ?auto_76268 ?auto_76273 ) ) ( not ( = ?auto_76268 ?auto_76274 ) ) ( not ( = ?auto_76268 ?auto_76275 ) ) ( not ( = ?auto_76268 ?auto_76276 ) ) ( not ( = ?auto_76268 ?auto_76277 ) ) ( not ( = ?auto_76269 ?auto_76270 ) ) ( not ( = ?auto_76269 ?auto_76271 ) ) ( not ( = ?auto_76269 ?auto_76272 ) ) ( not ( = ?auto_76269 ?auto_76273 ) ) ( not ( = ?auto_76269 ?auto_76274 ) ) ( not ( = ?auto_76269 ?auto_76275 ) ) ( not ( = ?auto_76269 ?auto_76276 ) ) ( not ( = ?auto_76269 ?auto_76277 ) ) ( not ( = ?auto_76270 ?auto_76271 ) ) ( not ( = ?auto_76270 ?auto_76272 ) ) ( not ( = ?auto_76270 ?auto_76273 ) ) ( not ( = ?auto_76270 ?auto_76274 ) ) ( not ( = ?auto_76270 ?auto_76275 ) ) ( not ( = ?auto_76270 ?auto_76276 ) ) ( not ( = ?auto_76270 ?auto_76277 ) ) ( not ( = ?auto_76271 ?auto_76272 ) ) ( not ( = ?auto_76271 ?auto_76273 ) ) ( not ( = ?auto_76271 ?auto_76274 ) ) ( not ( = ?auto_76271 ?auto_76275 ) ) ( not ( = ?auto_76271 ?auto_76276 ) ) ( not ( = ?auto_76271 ?auto_76277 ) ) ( not ( = ?auto_76272 ?auto_76273 ) ) ( not ( = ?auto_76272 ?auto_76274 ) ) ( not ( = ?auto_76272 ?auto_76275 ) ) ( not ( = ?auto_76272 ?auto_76276 ) ) ( not ( = ?auto_76272 ?auto_76277 ) ) ( not ( = ?auto_76273 ?auto_76274 ) ) ( not ( = ?auto_76273 ?auto_76275 ) ) ( not ( = ?auto_76273 ?auto_76276 ) ) ( not ( = ?auto_76273 ?auto_76277 ) ) ( not ( = ?auto_76274 ?auto_76275 ) ) ( not ( = ?auto_76274 ?auto_76276 ) ) ( not ( = ?auto_76274 ?auto_76277 ) ) ( not ( = ?auto_76275 ?auto_76276 ) ) ( not ( = ?auto_76275 ?auto_76277 ) ) ( not ( = ?auto_76276 ?auto_76277 ) ) ( ON ?auto_76275 ?auto_76276 ) ( ON ?auto_76274 ?auto_76275 ) ( ON ?auto_76273 ?auto_76274 ) ( ON ?auto_76272 ?auto_76273 ) ( CLEAR ?auto_76270 ) ( ON ?auto_76271 ?auto_76272 ) ( CLEAR ?auto_76271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76268 ?auto_76269 ?auto_76270 ?auto_76271 )
      ( MAKE-9PILE ?auto_76268 ?auto_76269 ?auto_76270 ?auto_76271 ?auto_76272 ?auto_76273 ?auto_76274 ?auto_76275 ?auto_76276 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76287 - BLOCK
      ?auto_76288 - BLOCK
      ?auto_76289 - BLOCK
      ?auto_76290 - BLOCK
      ?auto_76291 - BLOCK
      ?auto_76292 - BLOCK
      ?auto_76293 - BLOCK
      ?auto_76294 - BLOCK
      ?auto_76295 - BLOCK
    )
    :vars
    (
      ?auto_76296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76295 ?auto_76296 ) ( ON-TABLE ?auto_76287 ) ( ON ?auto_76288 ?auto_76287 ) ( ON ?auto_76289 ?auto_76288 ) ( not ( = ?auto_76287 ?auto_76288 ) ) ( not ( = ?auto_76287 ?auto_76289 ) ) ( not ( = ?auto_76287 ?auto_76290 ) ) ( not ( = ?auto_76287 ?auto_76291 ) ) ( not ( = ?auto_76287 ?auto_76292 ) ) ( not ( = ?auto_76287 ?auto_76293 ) ) ( not ( = ?auto_76287 ?auto_76294 ) ) ( not ( = ?auto_76287 ?auto_76295 ) ) ( not ( = ?auto_76287 ?auto_76296 ) ) ( not ( = ?auto_76288 ?auto_76289 ) ) ( not ( = ?auto_76288 ?auto_76290 ) ) ( not ( = ?auto_76288 ?auto_76291 ) ) ( not ( = ?auto_76288 ?auto_76292 ) ) ( not ( = ?auto_76288 ?auto_76293 ) ) ( not ( = ?auto_76288 ?auto_76294 ) ) ( not ( = ?auto_76288 ?auto_76295 ) ) ( not ( = ?auto_76288 ?auto_76296 ) ) ( not ( = ?auto_76289 ?auto_76290 ) ) ( not ( = ?auto_76289 ?auto_76291 ) ) ( not ( = ?auto_76289 ?auto_76292 ) ) ( not ( = ?auto_76289 ?auto_76293 ) ) ( not ( = ?auto_76289 ?auto_76294 ) ) ( not ( = ?auto_76289 ?auto_76295 ) ) ( not ( = ?auto_76289 ?auto_76296 ) ) ( not ( = ?auto_76290 ?auto_76291 ) ) ( not ( = ?auto_76290 ?auto_76292 ) ) ( not ( = ?auto_76290 ?auto_76293 ) ) ( not ( = ?auto_76290 ?auto_76294 ) ) ( not ( = ?auto_76290 ?auto_76295 ) ) ( not ( = ?auto_76290 ?auto_76296 ) ) ( not ( = ?auto_76291 ?auto_76292 ) ) ( not ( = ?auto_76291 ?auto_76293 ) ) ( not ( = ?auto_76291 ?auto_76294 ) ) ( not ( = ?auto_76291 ?auto_76295 ) ) ( not ( = ?auto_76291 ?auto_76296 ) ) ( not ( = ?auto_76292 ?auto_76293 ) ) ( not ( = ?auto_76292 ?auto_76294 ) ) ( not ( = ?auto_76292 ?auto_76295 ) ) ( not ( = ?auto_76292 ?auto_76296 ) ) ( not ( = ?auto_76293 ?auto_76294 ) ) ( not ( = ?auto_76293 ?auto_76295 ) ) ( not ( = ?auto_76293 ?auto_76296 ) ) ( not ( = ?auto_76294 ?auto_76295 ) ) ( not ( = ?auto_76294 ?auto_76296 ) ) ( not ( = ?auto_76295 ?auto_76296 ) ) ( ON ?auto_76294 ?auto_76295 ) ( ON ?auto_76293 ?auto_76294 ) ( ON ?auto_76292 ?auto_76293 ) ( ON ?auto_76291 ?auto_76292 ) ( CLEAR ?auto_76289 ) ( ON ?auto_76290 ?auto_76291 ) ( CLEAR ?auto_76290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76287 ?auto_76288 ?auto_76289 ?auto_76290 )
      ( MAKE-9PILE ?auto_76287 ?auto_76288 ?auto_76289 ?auto_76290 ?auto_76291 ?auto_76292 ?auto_76293 ?auto_76294 ?auto_76295 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76306 - BLOCK
      ?auto_76307 - BLOCK
      ?auto_76308 - BLOCK
      ?auto_76309 - BLOCK
      ?auto_76310 - BLOCK
      ?auto_76311 - BLOCK
      ?auto_76312 - BLOCK
      ?auto_76313 - BLOCK
      ?auto_76314 - BLOCK
    )
    :vars
    (
      ?auto_76315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76314 ?auto_76315 ) ( ON-TABLE ?auto_76306 ) ( ON ?auto_76307 ?auto_76306 ) ( not ( = ?auto_76306 ?auto_76307 ) ) ( not ( = ?auto_76306 ?auto_76308 ) ) ( not ( = ?auto_76306 ?auto_76309 ) ) ( not ( = ?auto_76306 ?auto_76310 ) ) ( not ( = ?auto_76306 ?auto_76311 ) ) ( not ( = ?auto_76306 ?auto_76312 ) ) ( not ( = ?auto_76306 ?auto_76313 ) ) ( not ( = ?auto_76306 ?auto_76314 ) ) ( not ( = ?auto_76306 ?auto_76315 ) ) ( not ( = ?auto_76307 ?auto_76308 ) ) ( not ( = ?auto_76307 ?auto_76309 ) ) ( not ( = ?auto_76307 ?auto_76310 ) ) ( not ( = ?auto_76307 ?auto_76311 ) ) ( not ( = ?auto_76307 ?auto_76312 ) ) ( not ( = ?auto_76307 ?auto_76313 ) ) ( not ( = ?auto_76307 ?auto_76314 ) ) ( not ( = ?auto_76307 ?auto_76315 ) ) ( not ( = ?auto_76308 ?auto_76309 ) ) ( not ( = ?auto_76308 ?auto_76310 ) ) ( not ( = ?auto_76308 ?auto_76311 ) ) ( not ( = ?auto_76308 ?auto_76312 ) ) ( not ( = ?auto_76308 ?auto_76313 ) ) ( not ( = ?auto_76308 ?auto_76314 ) ) ( not ( = ?auto_76308 ?auto_76315 ) ) ( not ( = ?auto_76309 ?auto_76310 ) ) ( not ( = ?auto_76309 ?auto_76311 ) ) ( not ( = ?auto_76309 ?auto_76312 ) ) ( not ( = ?auto_76309 ?auto_76313 ) ) ( not ( = ?auto_76309 ?auto_76314 ) ) ( not ( = ?auto_76309 ?auto_76315 ) ) ( not ( = ?auto_76310 ?auto_76311 ) ) ( not ( = ?auto_76310 ?auto_76312 ) ) ( not ( = ?auto_76310 ?auto_76313 ) ) ( not ( = ?auto_76310 ?auto_76314 ) ) ( not ( = ?auto_76310 ?auto_76315 ) ) ( not ( = ?auto_76311 ?auto_76312 ) ) ( not ( = ?auto_76311 ?auto_76313 ) ) ( not ( = ?auto_76311 ?auto_76314 ) ) ( not ( = ?auto_76311 ?auto_76315 ) ) ( not ( = ?auto_76312 ?auto_76313 ) ) ( not ( = ?auto_76312 ?auto_76314 ) ) ( not ( = ?auto_76312 ?auto_76315 ) ) ( not ( = ?auto_76313 ?auto_76314 ) ) ( not ( = ?auto_76313 ?auto_76315 ) ) ( not ( = ?auto_76314 ?auto_76315 ) ) ( ON ?auto_76313 ?auto_76314 ) ( ON ?auto_76312 ?auto_76313 ) ( ON ?auto_76311 ?auto_76312 ) ( ON ?auto_76310 ?auto_76311 ) ( ON ?auto_76309 ?auto_76310 ) ( CLEAR ?auto_76307 ) ( ON ?auto_76308 ?auto_76309 ) ( CLEAR ?auto_76308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76306 ?auto_76307 ?auto_76308 )
      ( MAKE-9PILE ?auto_76306 ?auto_76307 ?auto_76308 ?auto_76309 ?auto_76310 ?auto_76311 ?auto_76312 ?auto_76313 ?auto_76314 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76325 - BLOCK
      ?auto_76326 - BLOCK
      ?auto_76327 - BLOCK
      ?auto_76328 - BLOCK
      ?auto_76329 - BLOCK
      ?auto_76330 - BLOCK
      ?auto_76331 - BLOCK
      ?auto_76332 - BLOCK
      ?auto_76333 - BLOCK
    )
    :vars
    (
      ?auto_76334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76333 ?auto_76334 ) ( ON-TABLE ?auto_76325 ) ( ON ?auto_76326 ?auto_76325 ) ( not ( = ?auto_76325 ?auto_76326 ) ) ( not ( = ?auto_76325 ?auto_76327 ) ) ( not ( = ?auto_76325 ?auto_76328 ) ) ( not ( = ?auto_76325 ?auto_76329 ) ) ( not ( = ?auto_76325 ?auto_76330 ) ) ( not ( = ?auto_76325 ?auto_76331 ) ) ( not ( = ?auto_76325 ?auto_76332 ) ) ( not ( = ?auto_76325 ?auto_76333 ) ) ( not ( = ?auto_76325 ?auto_76334 ) ) ( not ( = ?auto_76326 ?auto_76327 ) ) ( not ( = ?auto_76326 ?auto_76328 ) ) ( not ( = ?auto_76326 ?auto_76329 ) ) ( not ( = ?auto_76326 ?auto_76330 ) ) ( not ( = ?auto_76326 ?auto_76331 ) ) ( not ( = ?auto_76326 ?auto_76332 ) ) ( not ( = ?auto_76326 ?auto_76333 ) ) ( not ( = ?auto_76326 ?auto_76334 ) ) ( not ( = ?auto_76327 ?auto_76328 ) ) ( not ( = ?auto_76327 ?auto_76329 ) ) ( not ( = ?auto_76327 ?auto_76330 ) ) ( not ( = ?auto_76327 ?auto_76331 ) ) ( not ( = ?auto_76327 ?auto_76332 ) ) ( not ( = ?auto_76327 ?auto_76333 ) ) ( not ( = ?auto_76327 ?auto_76334 ) ) ( not ( = ?auto_76328 ?auto_76329 ) ) ( not ( = ?auto_76328 ?auto_76330 ) ) ( not ( = ?auto_76328 ?auto_76331 ) ) ( not ( = ?auto_76328 ?auto_76332 ) ) ( not ( = ?auto_76328 ?auto_76333 ) ) ( not ( = ?auto_76328 ?auto_76334 ) ) ( not ( = ?auto_76329 ?auto_76330 ) ) ( not ( = ?auto_76329 ?auto_76331 ) ) ( not ( = ?auto_76329 ?auto_76332 ) ) ( not ( = ?auto_76329 ?auto_76333 ) ) ( not ( = ?auto_76329 ?auto_76334 ) ) ( not ( = ?auto_76330 ?auto_76331 ) ) ( not ( = ?auto_76330 ?auto_76332 ) ) ( not ( = ?auto_76330 ?auto_76333 ) ) ( not ( = ?auto_76330 ?auto_76334 ) ) ( not ( = ?auto_76331 ?auto_76332 ) ) ( not ( = ?auto_76331 ?auto_76333 ) ) ( not ( = ?auto_76331 ?auto_76334 ) ) ( not ( = ?auto_76332 ?auto_76333 ) ) ( not ( = ?auto_76332 ?auto_76334 ) ) ( not ( = ?auto_76333 ?auto_76334 ) ) ( ON ?auto_76332 ?auto_76333 ) ( ON ?auto_76331 ?auto_76332 ) ( ON ?auto_76330 ?auto_76331 ) ( ON ?auto_76329 ?auto_76330 ) ( ON ?auto_76328 ?auto_76329 ) ( CLEAR ?auto_76326 ) ( ON ?auto_76327 ?auto_76328 ) ( CLEAR ?auto_76327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76325 ?auto_76326 ?auto_76327 )
      ( MAKE-9PILE ?auto_76325 ?auto_76326 ?auto_76327 ?auto_76328 ?auto_76329 ?auto_76330 ?auto_76331 ?auto_76332 ?auto_76333 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76344 - BLOCK
      ?auto_76345 - BLOCK
      ?auto_76346 - BLOCK
      ?auto_76347 - BLOCK
      ?auto_76348 - BLOCK
      ?auto_76349 - BLOCK
      ?auto_76350 - BLOCK
      ?auto_76351 - BLOCK
      ?auto_76352 - BLOCK
    )
    :vars
    (
      ?auto_76353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76352 ?auto_76353 ) ( ON-TABLE ?auto_76344 ) ( not ( = ?auto_76344 ?auto_76345 ) ) ( not ( = ?auto_76344 ?auto_76346 ) ) ( not ( = ?auto_76344 ?auto_76347 ) ) ( not ( = ?auto_76344 ?auto_76348 ) ) ( not ( = ?auto_76344 ?auto_76349 ) ) ( not ( = ?auto_76344 ?auto_76350 ) ) ( not ( = ?auto_76344 ?auto_76351 ) ) ( not ( = ?auto_76344 ?auto_76352 ) ) ( not ( = ?auto_76344 ?auto_76353 ) ) ( not ( = ?auto_76345 ?auto_76346 ) ) ( not ( = ?auto_76345 ?auto_76347 ) ) ( not ( = ?auto_76345 ?auto_76348 ) ) ( not ( = ?auto_76345 ?auto_76349 ) ) ( not ( = ?auto_76345 ?auto_76350 ) ) ( not ( = ?auto_76345 ?auto_76351 ) ) ( not ( = ?auto_76345 ?auto_76352 ) ) ( not ( = ?auto_76345 ?auto_76353 ) ) ( not ( = ?auto_76346 ?auto_76347 ) ) ( not ( = ?auto_76346 ?auto_76348 ) ) ( not ( = ?auto_76346 ?auto_76349 ) ) ( not ( = ?auto_76346 ?auto_76350 ) ) ( not ( = ?auto_76346 ?auto_76351 ) ) ( not ( = ?auto_76346 ?auto_76352 ) ) ( not ( = ?auto_76346 ?auto_76353 ) ) ( not ( = ?auto_76347 ?auto_76348 ) ) ( not ( = ?auto_76347 ?auto_76349 ) ) ( not ( = ?auto_76347 ?auto_76350 ) ) ( not ( = ?auto_76347 ?auto_76351 ) ) ( not ( = ?auto_76347 ?auto_76352 ) ) ( not ( = ?auto_76347 ?auto_76353 ) ) ( not ( = ?auto_76348 ?auto_76349 ) ) ( not ( = ?auto_76348 ?auto_76350 ) ) ( not ( = ?auto_76348 ?auto_76351 ) ) ( not ( = ?auto_76348 ?auto_76352 ) ) ( not ( = ?auto_76348 ?auto_76353 ) ) ( not ( = ?auto_76349 ?auto_76350 ) ) ( not ( = ?auto_76349 ?auto_76351 ) ) ( not ( = ?auto_76349 ?auto_76352 ) ) ( not ( = ?auto_76349 ?auto_76353 ) ) ( not ( = ?auto_76350 ?auto_76351 ) ) ( not ( = ?auto_76350 ?auto_76352 ) ) ( not ( = ?auto_76350 ?auto_76353 ) ) ( not ( = ?auto_76351 ?auto_76352 ) ) ( not ( = ?auto_76351 ?auto_76353 ) ) ( not ( = ?auto_76352 ?auto_76353 ) ) ( ON ?auto_76351 ?auto_76352 ) ( ON ?auto_76350 ?auto_76351 ) ( ON ?auto_76349 ?auto_76350 ) ( ON ?auto_76348 ?auto_76349 ) ( ON ?auto_76347 ?auto_76348 ) ( ON ?auto_76346 ?auto_76347 ) ( CLEAR ?auto_76344 ) ( ON ?auto_76345 ?auto_76346 ) ( CLEAR ?auto_76345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76344 ?auto_76345 )
      ( MAKE-9PILE ?auto_76344 ?auto_76345 ?auto_76346 ?auto_76347 ?auto_76348 ?auto_76349 ?auto_76350 ?auto_76351 ?auto_76352 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76363 - BLOCK
      ?auto_76364 - BLOCK
      ?auto_76365 - BLOCK
      ?auto_76366 - BLOCK
      ?auto_76367 - BLOCK
      ?auto_76368 - BLOCK
      ?auto_76369 - BLOCK
      ?auto_76370 - BLOCK
      ?auto_76371 - BLOCK
    )
    :vars
    (
      ?auto_76372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76371 ?auto_76372 ) ( ON-TABLE ?auto_76363 ) ( not ( = ?auto_76363 ?auto_76364 ) ) ( not ( = ?auto_76363 ?auto_76365 ) ) ( not ( = ?auto_76363 ?auto_76366 ) ) ( not ( = ?auto_76363 ?auto_76367 ) ) ( not ( = ?auto_76363 ?auto_76368 ) ) ( not ( = ?auto_76363 ?auto_76369 ) ) ( not ( = ?auto_76363 ?auto_76370 ) ) ( not ( = ?auto_76363 ?auto_76371 ) ) ( not ( = ?auto_76363 ?auto_76372 ) ) ( not ( = ?auto_76364 ?auto_76365 ) ) ( not ( = ?auto_76364 ?auto_76366 ) ) ( not ( = ?auto_76364 ?auto_76367 ) ) ( not ( = ?auto_76364 ?auto_76368 ) ) ( not ( = ?auto_76364 ?auto_76369 ) ) ( not ( = ?auto_76364 ?auto_76370 ) ) ( not ( = ?auto_76364 ?auto_76371 ) ) ( not ( = ?auto_76364 ?auto_76372 ) ) ( not ( = ?auto_76365 ?auto_76366 ) ) ( not ( = ?auto_76365 ?auto_76367 ) ) ( not ( = ?auto_76365 ?auto_76368 ) ) ( not ( = ?auto_76365 ?auto_76369 ) ) ( not ( = ?auto_76365 ?auto_76370 ) ) ( not ( = ?auto_76365 ?auto_76371 ) ) ( not ( = ?auto_76365 ?auto_76372 ) ) ( not ( = ?auto_76366 ?auto_76367 ) ) ( not ( = ?auto_76366 ?auto_76368 ) ) ( not ( = ?auto_76366 ?auto_76369 ) ) ( not ( = ?auto_76366 ?auto_76370 ) ) ( not ( = ?auto_76366 ?auto_76371 ) ) ( not ( = ?auto_76366 ?auto_76372 ) ) ( not ( = ?auto_76367 ?auto_76368 ) ) ( not ( = ?auto_76367 ?auto_76369 ) ) ( not ( = ?auto_76367 ?auto_76370 ) ) ( not ( = ?auto_76367 ?auto_76371 ) ) ( not ( = ?auto_76367 ?auto_76372 ) ) ( not ( = ?auto_76368 ?auto_76369 ) ) ( not ( = ?auto_76368 ?auto_76370 ) ) ( not ( = ?auto_76368 ?auto_76371 ) ) ( not ( = ?auto_76368 ?auto_76372 ) ) ( not ( = ?auto_76369 ?auto_76370 ) ) ( not ( = ?auto_76369 ?auto_76371 ) ) ( not ( = ?auto_76369 ?auto_76372 ) ) ( not ( = ?auto_76370 ?auto_76371 ) ) ( not ( = ?auto_76370 ?auto_76372 ) ) ( not ( = ?auto_76371 ?auto_76372 ) ) ( ON ?auto_76370 ?auto_76371 ) ( ON ?auto_76369 ?auto_76370 ) ( ON ?auto_76368 ?auto_76369 ) ( ON ?auto_76367 ?auto_76368 ) ( ON ?auto_76366 ?auto_76367 ) ( ON ?auto_76365 ?auto_76366 ) ( CLEAR ?auto_76363 ) ( ON ?auto_76364 ?auto_76365 ) ( CLEAR ?auto_76364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76363 ?auto_76364 )
      ( MAKE-9PILE ?auto_76363 ?auto_76364 ?auto_76365 ?auto_76366 ?auto_76367 ?auto_76368 ?auto_76369 ?auto_76370 ?auto_76371 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76382 - BLOCK
      ?auto_76383 - BLOCK
      ?auto_76384 - BLOCK
      ?auto_76385 - BLOCK
      ?auto_76386 - BLOCK
      ?auto_76387 - BLOCK
      ?auto_76388 - BLOCK
      ?auto_76389 - BLOCK
      ?auto_76390 - BLOCK
    )
    :vars
    (
      ?auto_76391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76390 ?auto_76391 ) ( not ( = ?auto_76382 ?auto_76383 ) ) ( not ( = ?auto_76382 ?auto_76384 ) ) ( not ( = ?auto_76382 ?auto_76385 ) ) ( not ( = ?auto_76382 ?auto_76386 ) ) ( not ( = ?auto_76382 ?auto_76387 ) ) ( not ( = ?auto_76382 ?auto_76388 ) ) ( not ( = ?auto_76382 ?auto_76389 ) ) ( not ( = ?auto_76382 ?auto_76390 ) ) ( not ( = ?auto_76382 ?auto_76391 ) ) ( not ( = ?auto_76383 ?auto_76384 ) ) ( not ( = ?auto_76383 ?auto_76385 ) ) ( not ( = ?auto_76383 ?auto_76386 ) ) ( not ( = ?auto_76383 ?auto_76387 ) ) ( not ( = ?auto_76383 ?auto_76388 ) ) ( not ( = ?auto_76383 ?auto_76389 ) ) ( not ( = ?auto_76383 ?auto_76390 ) ) ( not ( = ?auto_76383 ?auto_76391 ) ) ( not ( = ?auto_76384 ?auto_76385 ) ) ( not ( = ?auto_76384 ?auto_76386 ) ) ( not ( = ?auto_76384 ?auto_76387 ) ) ( not ( = ?auto_76384 ?auto_76388 ) ) ( not ( = ?auto_76384 ?auto_76389 ) ) ( not ( = ?auto_76384 ?auto_76390 ) ) ( not ( = ?auto_76384 ?auto_76391 ) ) ( not ( = ?auto_76385 ?auto_76386 ) ) ( not ( = ?auto_76385 ?auto_76387 ) ) ( not ( = ?auto_76385 ?auto_76388 ) ) ( not ( = ?auto_76385 ?auto_76389 ) ) ( not ( = ?auto_76385 ?auto_76390 ) ) ( not ( = ?auto_76385 ?auto_76391 ) ) ( not ( = ?auto_76386 ?auto_76387 ) ) ( not ( = ?auto_76386 ?auto_76388 ) ) ( not ( = ?auto_76386 ?auto_76389 ) ) ( not ( = ?auto_76386 ?auto_76390 ) ) ( not ( = ?auto_76386 ?auto_76391 ) ) ( not ( = ?auto_76387 ?auto_76388 ) ) ( not ( = ?auto_76387 ?auto_76389 ) ) ( not ( = ?auto_76387 ?auto_76390 ) ) ( not ( = ?auto_76387 ?auto_76391 ) ) ( not ( = ?auto_76388 ?auto_76389 ) ) ( not ( = ?auto_76388 ?auto_76390 ) ) ( not ( = ?auto_76388 ?auto_76391 ) ) ( not ( = ?auto_76389 ?auto_76390 ) ) ( not ( = ?auto_76389 ?auto_76391 ) ) ( not ( = ?auto_76390 ?auto_76391 ) ) ( ON ?auto_76389 ?auto_76390 ) ( ON ?auto_76388 ?auto_76389 ) ( ON ?auto_76387 ?auto_76388 ) ( ON ?auto_76386 ?auto_76387 ) ( ON ?auto_76385 ?auto_76386 ) ( ON ?auto_76384 ?auto_76385 ) ( ON ?auto_76383 ?auto_76384 ) ( ON ?auto_76382 ?auto_76383 ) ( CLEAR ?auto_76382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76382 )
      ( MAKE-9PILE ?auto_76382 ?auto_76383 ?auto_76384 ?auto_76385 ?auto_76386 ?auto_76387 ?auto_76388 ?auto_76389 ?auto_76390 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_76401 - BLOCK
      ?auto_76402 - BLOCK
      ?auto_76403 - BLOCK
      ?auto_76404 - BLOCK
      ?auto_76405 - BLOCK
      ?auto_76406 - BLOCK
      ?auto_76407 - BLOCK
      ?auto_76408 - BLOCK
      ?auto_76409 - BLOCK
    )
    :vars
    (
      ?auto_76410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76409 ?auto_76410 ) ( not ( = ?auto_76401 ?auto_76402 ) ) ( not ( = ?auto_76401 ?auto_76403 ) ) ( not ( = ?auto_76401 ?auto_76404 ) ) ( not ( = ?auto_76401 ?auto_76405 ) ) ( not ( = ?auto_76401 ?auto_76406 ) ) ( not ( = ?auto_76401 ?auto_76407 ) ) ( not ( = ?auto_76401 ?auto_76408 ) ) ( not ( = ?auto_76401 ?auto_76409 ) ) ( not ( = ?auto_76401 ?auto_76410 ) ) ( not ( = ?auto_76402 ?auto_76403 ) ) ( not ( = ?auto_76402 ?auto_76404 ) ) ( not ( = ?auto_76402 ?auto_76405 ) ) ( not ( = ?auto_76402 ?auto_76406 ) ) ( not ( = ?auto_76402 ?auto_76407 ) ) ( not ( = ?auto_76402 ?auto_76408 ) ) ( not ( = ?auto_76402 ?auto_76409 ) ) ( not ( = ?auto_76402 ?auto_76410 ) ) ( not ( = ?auto_76403 ?auto_76404 ) ) ( not ( = ?auto_76403 ?auto_76405 ) ) ( not ( = ?auto_76403 ?auto_76406 ) ) ( not ( = ?auto_76403 ?auto_76407 ) ) ( not ( = ?auto_76403 ?auto_76408 ) ) ( not ( = ?auto_76403 ?auto_76409 ) ) ( not ( = ?auto_76403 ?auto_76410 ) ) ( not ( = ?auto_76404 ?auto_76405 ) ) ( not ( = ?auto_76404 ?auto_76406 ) ) ( not ( = ?auto_76404 ?auto_76407 ) ) ( not ( = ?auto_76404 ?auto_76408 ) ) ( not ( = ?auto_76404 ?auto_76409 ) ) ( not ( = ?auto_76404 ?auto_76410 ) ) ( not ( = ?auto_76405 ?auto_76406 ) ) ( not ( = ?auto_76405 ?auto_76407 ) ) ( not ( = ?auto_76405 ?auto_76408 ) ) ( not ( = ?auto_76405 ?auto_76409 ) ) ( not ( = ?auto_76405 ?auto_76410 ) ) ( not ( = ?auto_76406 ?auto_76407 ) ) ( not ( = ?auto_76406 ?auto_76408 ) ) ( not ( = ?auto_76406 ?auto_76409 ) ) ( not ( = ?auto_76406 ?auto_76410 ) ) ( not ( = ?auto_76407 ?auto_76408 ) ) ( not ( = ?auto_76407 ?auto_76409 ) ) ( not ( = ?auto_76407 ?auto_76410 ) ) ( not ( = ?auto_76408 ?auto_76409 ) ) ( not ( = ?auto_76408 ?auto_76410 ) ) ( not ( = ?auto_76409 ?auto_76410 ) ) ( ON ?auto_76408 ?auto_76409 ) ( ON ?auto_76407 ?auto_76408 ) ( ON ?auto_76406 ?auto_76407 ) ( ON ?auto_76405 ?auto_76406 ) ( ON ?auto_76404 ?auto_76405 ) ( ON ?auto_76403 ?auto_76404 ) ( ON ?auto_76402 ?auto_76403 ) ( ON ?auto_76401 ?auto_76402 ) ( CLEAR ?auto_76401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76401 )
      ( MAKE-9PILE ?auto_76401 ?auto_76402 ?auto_76403 ?auto_76404 ?auto_76405 ?auto_76406 ?auto_76407 ?auto_76408 ?auto_76409 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76421 - BLOCK
      ?auto_76422 - BLOCK
      ?auto_76423 - BLOCK
      ?auto_76424 - BLOCK
      ?auto_76425 - BLOCK
      ?auto_76426 - BLOCK
      ?auto_76427 - BLOCK
      ?auto_76428 - BLOCK
      ?auto_76429 - BLOCK
      ?auto_76430 - BLOCK
    )
    :vars
    (
      ?auto_76431 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76429 ) ( ON ?auto_76430 ?auto_76431 ) ( CLEAR ?auto_76430 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76421 ) ( ON ?auto_76422 ?auto_76421 ) ( ON ?auto_76423 ?auto_76422 ) ( ON ?auto_76424 ?auto_76423 ) ( ON ?auto_76425 ?auto_76424 ) ( ON ?auto_76426 ?auto_76425 ) ( ON ?auto_76427 ?auto_76426 ) ( ON ?auto_76428 ?auto_76427 ) ( ON ?auto_76429 ?auto_76428 ) ( not ( = ?auto_76421 ?auto_76422 ) ) ( not ( = ?auto_76421 ?auto_76423 ) ) ( not ( = ?auto_76421 ?auto_76424 ) ) ( not ( = ?auto_76421 ?auto_76425 ) ) ( not ( = ?auto_76421 ?auto_76426 ) ) ( not ( = ?auto_76421 ?auto_76427 ) ) ( not ( = ?auto_76421 ?auto_76428 ) ) ( not ( = ?auto_76421 ?auto_76429 ) ) ( not ( = ?auto_76421 ?auto_76430 ) ) ( not ( = ?auto_76421 ?auto_76431 ) ) ( not ( = ?auto_76422 ?auto_76423 ) ) ( not ( = ?auto_76422 ?auto_76424 ) ) ( not ( = ?auto_76422 ?auto_76425 ) ) ( not ( = ?auto_76422 ?auto_76426 ) ) ( not ( = ?auto_76422 ?auto_76427 ) ) ( not ( = ?auto_76422 ?auto_76428 ) ) ( not ( = ?auto_76422 ?auto_76429 ) ) ( not ( = ?auto_76422 ?auto_76430 ) ) ( not ( = ?auto_76422 ?auto_76431 ) ) ( not ( = ?auto_76423 ?auto_76424 ) ) ( not ( = ?auto_76423 ?auto_76425 ) ) ( not ( = ?auto_76423 ?auto_76426 ) ) ( not ( = ?auto_76423 ?auto_76427 ) ) ( not ( = ?auto_76423 ?auto_76428 ) ) ( not ( = ?auto_76423 ?auto_76429 ) ) ( not ( = ?auto_76423 ?auto_76430 ) ) ( not ( = ?auto_76423 ?auto_76431 ) ) ( not ( = ?auto_76424 ?auto_76425 ) ) ( not ( = ?auto_76424 ?auto_76426 ) ) ( not ( = ?auto_76424 ?auto_76427 ) ) ( not ( = ?auto_76424 ?auto_76428 ) ) ( not ( = ?auto_76424 ?auto_76429 ) ) ( not ( = ?auto_76424 ?auto_76430 ) ) ( not ( = ?auto_76424 ?auto_76431 ) ) ( not ( = ?auto_76425 ?auto_76426 ) ) ( not ( = ?auto_76425 ?auto_76427 ) ) ( not ( = ?auto_76425 ?auto_76428 ) ) ( not ( = ?auto_76425 ?auto_76429 ) ) ( not ( = ?auto_76425 ?auto_76430 ) ) ( not ( = ?auto_76425 ?auto_76431 ) ) ( not ( = ?auto_76426 ?auto_76427 ) ) ( not ( = ?auto_76426 ?auto_76428 ) ) ( not ( = ?auto_76426 ?auto_76429 ) ) ( not ( = ?auto_76426 ?auto_76430 ) ) ( not ( = ?auto_76426 ?auto_76431 ) ) ( not ( = ?auto_76427 ?auto_76428 ) ) ( not ( = ?auto_76427 ?auto_76429 ) ) ( not ( = ?auto_76427 ?auto_76430 ) ) ( not ( = ?auto_76427 ?auto_76431 ) ) ( not ( = ?auto_76428 ?auto_76429 ) ) ( not ( = ?auto_76428 ?auto_76430 ) ) ( not ( = ?auto_76428 ?auto_76431 ) ) ( not ( = ?auto_76429 ?auto_76430 ) ) ( not ( = ?auto_76429 ?auto_76431 ) ) ( not ( = ?auto_76430 ?auto_76431 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76430 ?auto_76431 )
      ( !STACK ?auto_76430 ?auto_76429 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76442 - BLOCK
      ?auto_76443 - BLOCK
      ?auto_76444 - BLOCK
      ?auto_76445 - BLOCK
      ?auto_76446 - BLOCK
      ?auto_76447 - BLOCK
      ?auto_76448 - BLOCK
      ?auto_76449 - BLOCK
      ?auto_76450 - BLOCK
      ?auto_76451 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76450 ) ( ON-TABLE ?auto_76451 ) ( CLEAR ?auto_76451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76442 ) ( ON ?auto_76443 ?auto_76442 ) ( ON ?auto_76444 ?auto_76443 ) ( ON ?auto_76445 ?auto_76444 ) ( ON ?auto_76446 ?auto_76445 ) ( ON ?auto_76447 ?auto_76446 ) ( ON ?auto_76448 ?auto_76447 ) ( ON ?auto_76449 ?auto_76448 ) ( ON ?auto_76450 ?auto_76449 ) ( not ( = ?auto_76442 ?auto_76443 ) ) ( not ( = ?auto_76442 ?auto_76444 ) ) ( not ( = ?auto_76442 ?auto_76445 ) ) ( not ( = ?auto_76442 ?auto_76446 ) ) ( not ( = ?auto_76442 ?auto_76447 ) ) ( not ( = ?auto_76442 ?auto_76448 ) ) ( not ( = ?auto_76442 ?auto_76449 ) ) ( not ( = ?auto_76442 ?auto_76450 ) ) ( not ( = ?auto_76442 ?auto_76451 ) ) ( not ( = ?auto_76443 ?auto_76444 ) ) ( not ( = ?auto_76443 ?auto_76445 ) ) ( not ( = ?auto_76443 ?auto_76446 ) ) ( not ( = ?auto_76443 ?auto_76447 ) ) ( not ( = ?auto_76443 ?auto_76448 ) ) ( not ( = ?auto_76443 ?auto_76449 ) ) ( not ( = ?auto_76443 ?auto_76450 ) ) ( not ( = ?auto_76443 ?auto_76451 ) ) ( not ( = ?auto_76444 ?auto_76445 ) ) ( not ( = ?auto_76444 ?auto_76446 ) ) ( not ( = ?auto_76444 ?auto_76447 ) ) ( not ( = ?auto_76444 ?auto_76448 ) ) ( not ( = ?auto_76444 ?auto_76449 ) ) ( not ( = ?auto_76444 ?auto_76450 ) ) ( not ( = ?auto_76444 ?auto_76451 ) ) ( not ( = ?auto_76445 ?auto_76446 ) ) ( not ( = ?auto_76445 ?auto_76447 ) ) ( not ( = ?auto_76445 ?auto_76448 ) ) ( not ( = ?auto_76445 ?auto_76449 ) ) ( not ( = ?auto_76445 ?auto_76450 ) ) ( not ( = ?auto_76445 ?auto_76451 ) ) ( not ( = ?auto_76446 ?auto_76447 ) ) ( not ( = ?auto_76446 ?auto_76448 ) ) ( not ( = ?auto_76446 ?auto_76449 ) ) ( not ( = ?auto_76446 ?auto_76450 ) ) ( not ( = ?auto_76446 ?auto_76451 ) ) ( not ( = ?auto_76447 ?auto_76448 ) ) ( not ( = ?auto_76447 ?auto_76449 ) ) ( not ( = ?auto_76447 ?auto_76450 ) ) ( not ( = ?auto_76447 ?auto_76451 ) ) ( not ( = ?auto_76448 ?auto_76449 ) ) ( not ( = ?auto_76448 ?auto_76450 ) ) ( not ( = ?auto_76448 ?auto_76451 ) ) ( not ( = ?auto_76449 ?auto_76450 ) ) ( not ( = ?auto_76449 ?auto_76451 ) ) ( not ( = ?auto_76450 ?auto_76451 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_76451 )
      ( !STACK ?auto_76451 ?auto_76450 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76462 - BLOCK
      ?auto_76463 - BLOCK
      ?auto_76464 - BLOCK
      ?auto_76465 - BLOCK
      ?auto_76466 - BLOCK
      ?auto_76467 - BLOCK
      ?auto_76468 - BLOCK
      ?auto_76469 - BLOCK
      ?auto_76470 - BLOCK
      ?auto_76471 - BLOCK
    )
    :vars
    (
      ?auto_76472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76471 ?auto_76472 ) ( ON-TABLE ?auto_76462 ) ( ON ?auto_76463 ?auto_76462 ) ( ON ?auto_76464 ?auto_76463 ) ( ON ?auto_76465 ?auto_76464 ) ( ON ?auto_76466 ?auto_76465 ) ( ON ?auto_76467 ?auto_76466 ) ( ON ?auto_76468 ?auto_76467 ) ( ON ?auto_76469 ?auto_76468 ) ( not ( = ?auto_76462 ?auto_76463 ) ) ( not ( = ?auto_76462 ?auto_76464 ) ) ( not ( = ?auto_76462 ?auto_76465 ) ) ( not ( = ?auto_76462 ?auto_76466 ) ) ( not ( = ?auto_76462 ?auto_76467 ) ) ( not ( = ?auto_76462 ?auto_76468 ) ) ( not ( = ?auto_76462 ?auto_76469 ) ) ( not ( = ?auto_76462 ?auto_76470 ) ) ( not ( = ?auto_76462 ?auto_76471 ) ) ( not ( = ?auto_76462 ?auto_76472 ) ) ( not ( = ?auto_76463 ?auto_76464 ) ) ( not ( = ?auto_76463 ?auto_76465 ) ) ( not ( = ?auto_76463 ?auto_76466 ) ) ( not ( = ?auto_76463 ?auto_76467 ) ) ( not ( = ?auto_76463 ?auto_76468 ) ) ( not ( = ?auto_76463 ?auto_76469 ) ) ( not ( = ?auto_76463 ?auto_76470 ) ) ( not ( = ?auto_76463 ?auto_76471 ) ) ( not ( = ?auto_76463 ?auto_76472 ) ) ( not ( = ?auto_76464 ?auto_76465 ) ) ( not ( = ?auto_76464 ?auto_76466 ) ) ( not ( = ?auto_76464 ?auto_76467 ) ) ( not ( = ?auto_76464 ?auto_76468 ) ) ( not ( = ?auto_76464 ?auto_76469 ) ) ( not ( = ?auto_76464 ?auto_76470 ) ) ( not ( = ?auto_76464 ?auto_76471 ) ) ( not ( = ?auto_76464 ?auto_76472 ) ) ( not ( = ?auto_76465 ?auto_76466 ) ) ( not ( = ?auto_76465 ?auto_76467 ) ) ( not ( = ?auto_76465 ?auto_76468 ) ) ( not ( = ?auto_76465 ?auto_76469 ) ) ( not ( = ?auto_76465 ?auto_76470 ) ) ( not ( = ?auto_76465 ?auto_76471 ) ) ( not ( = ?auto_76465 ?auto_76472 ) ) ( not ( = ?auto_76466 ?auto_76467 ) ) ( not ( = ?auto_76466 ?auto_76468 ) ) ( not ( = ?auto_76466 ?auto_76469 ) ) ( not ( = ?auto_76466 ?auto_76470 ) ) ( not ( = ?auto_76466 ?auto_76471 ) ) ( not ( = ?auto_76466 ?auto_76472 ) ) ( not ( = ?auto_76467 ?auto_76468 ) ) ( not ( = ?auto_76467 ?auto_76469 ) ) ( not ( = ?auto_76467 ?auto_76470 ) ) ( not ( = ?auto_76467 ?auto_76471 ) ) ( not ( = ?auto_76467 ?auto_76472 ) ) ( not ( = ?auto_76468 ?auto_76469 ) ) ( not ( = ?auto_76468 ?auto_76470 ) ) ( not ( = ?auto_76468 ?auto_76471 ) ) ( not ( = ?auto_76468 ?auto_76472 ) ) ( not ( = ?auto_76469 ?auto_76470 ) ) ( not ( = ?auto_76469 ?auto_76471 ) ) ( not ( = ?auto_76469 ?auto_76472 ) ) ( not ( = ?auto_76470 ?auto_76471 ) ) ( not ( = ?auto_76470 ?auto_76472 ) ) ( not ( = ?auto_76471 ?auto_76472 ) ) ( CLEAR ?auto_76469 ) ( ON ?auto_76470 ?auto_76471 ) ( CLEAR ?auto_76470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_76462 ?auto_76463 ?auto_76464 ?auto_76465 ?auto_76466 ?auto_76467 ?auto_76468 ?auto_76469 ?auto_76470 )
      ( MAKE-10PILE ?auto_76462 ?auto_76463 ?auto_76464 ?auto_76465 ?auto_76466 ?auto_76467 ?auto_76468 ?auto_76469 ?auto_76470 ?auto_76471 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76483 - BLOCK
      ?auto_76484 - BLOCK
      ?auto_76485 - BLOCK
      ?auto_76486 - BLOCK
      ?auto_76487 - BLOCK
      ?auto_76488 - BLOCK
      ?auto_76489 - BLOCK
      ?auto_76490 - BLOCK
      ?auto_76491 - BLOCK
      ?auto_76492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76492 ) ( ON-TABLE ?auto_76483 ) ( ON ?auto_76484 ?auto_76483 ) ( ON ?auto_76485 ?auto_76484 ) ( ON ?auto_76486 ?auto_76485 ) ( ON ?auto_76487 ?auto_76486 ) ( ON ?auto_76488 ?auto_76487 ) ( ON ?auto_76489 ?auto_76488 ) ( ON ?auto_76490 ?auto_76489 ) ( not ( = ?auto_76483 ?auto_76484 ) ) ( not ( = ?auto_76483 ?auto_76485 ) ) ( not ( = ?auto_76483 ?auto_76486 ) ) ( not ( = ?auto_76483 ?auto_76487 ) ) ( not ( = ?auto_76483 ?auto_76488 ) ) ( not ( = ?auto_76483 ?auto_76489 ) ) ( not ( = ?auto_76483 ?auto_76490 ) ) ( not ( = ?auto_76483 ?auto_76491 ) ) ( not ( = ?auto_76483 ?auto_76492 ) ) ( not ( = ?auto_76484 ?auto_76485 ) ) ( not ( = ?auto_76484 ?auto_76486 ) ) ( not ( = ?auto_76484 ?auto_76487 ) ) ( not ( = ?auto_76484 ?auto_76488 ) ) ( not ( = ?auto_76484 ?auto_76489 ) ) ( not ( = ?auto_76484 ?auto_76490 ) ) ( not ( = ?auto_76484 ?auto_76491 ) ) ( not ( = ?auto_76484 ?auto_76492 ) ) ( not ( = ?auto_76485 ?auto_76486 ) ) ( not ( = ?auto_76485 ?auto_76487 ) ) ( not ( = ?auto_76485 ?auto_76488 ) ) ( not ( = ?auto_76485 ?auto_76489 ) ) ( not ( = ?auto_76485 ?auto_76490 ) ) ( not ( = ?auto_76485 ?auto_76491 ) ) ( not ( = ?auto_76485 ?auto_76492 ) ) ( not ( = ?auto_76486 ?auto_76487 ) ) ( not ( = ?auto_76486 ?auto_76488 ) ) ( not ( = ?auto_76486 ?auto_76489 ) ) ( not ( = ?auto_76486 ?auto_76490 ) ) ( not ( = ?auto_76486 ?auto_76491 ) ) ( not ( = ?auto_76486 ?auto_76492 ) ) ( not ( = ?auto_76487 ?auto_76488 ) ) ( not ( = ?auto_76487 ?auto_76489 ) ) ( not ( = ?auto_76487 ?auto_76490 ) ) ( not ( = ?auto_76487 ?auto_76491 ) ) ( not ( = ?auto_76487 ?auto_76492 ) ) ( not ( = ?auto_76488 ?auto_76489 ) ) ( not ( = ?auto_76488 ?auto_76490 ) ) ( not ( = ?auto_76488 ?auto_76491 ) ) ( not ( = ?auto_76488 ?auto_76492 ) ) ( not ( = ?auto_76489 ?auto_76490 ) ) ( not ( = ?auto_76489 ?auto_76491 ) ) ( not ( = ?auto_76489 ?auto_76492 ) ) ( not ( = ?auto_76490 ?auto_76491 ) ) ( not ( = ?auto_76490 ?auto_76492 ) ) ( not ( = ?auto_76491 ?auto_76492 ) ) ( CLEAR ?auto_76490 ) ( ON ?auto_76491 ?auto_76492 ) ( CLEAR ?auto_76491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_76483 ?auto_76484 ?auto_76485 ?auto_76486 ?auto_76487 ?auto_76488 ?auto_76489 ?auto_76490 ?auto_76491 )
      ( MAKE-10PILE ?auto_76483 ?auto_76484 ?auto_76485 ?auto_76486 ?auto_76487 ?auto_76488 ?auto_76489 ?auto_76490 ?auto_76491 ?auto_76492 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76503 - BLOCK
      ?auto_76504 - BLOCK
      ?auto_76505 - BLOCK
      ?auto_76506 - BLOCK
      ?auto_76507 - BLOCK
      ?auto_76508 - BLOCK
      ?auto_76509 - BLOCK
      ?auto_76510 - BLOCK
      ?auto_76511 - BLOCK
      ?auto_76512 - BLOCK
    )
    :vars
    (
      ?auto_76513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76512 ?auto_76513 ) ( ON-TABLE ?auto_76503 ) ( ON ?auto_76504 ?auto_76503 ) ( ON ?auto_76505 ?auto_76504 ) ( ON ?auto_76506 ?auto_76505 ) ( ON ?auto_76507 ?auto_76506 ) ( ON ?auto_76508 ?auto_76507 ) ( ON ?auto_76509 ?auto_76508 ) ( not ( = ?auto_76503 ?auto_76504 ) ) ( not ( = ?auto_76503 ?auto_76505 ) ) ( not ( = ?auto_76503 ?auto_76506 ) ) ( not ( = ?auto_76503 ?auto_76507 ) ) ( not ( = ?auto_76503 ?auto_76508 ) ) ( not ( = ?auto_76503 ?auto_76509 ) ) ( not ( = ?auto_76503 ?auto_76510 ) ) ( not ( = ?auto_76503 ?auto_76511 ) ) ( not ( = ?auto_76503 ?auto_76512 ) ) ( not ( = ?auto_76503 ?auto_76513 ) ) ( not ( = ?auto_76504 ?auto_76505 ) ) ( not ( = ?auto_76504 ?auto_76506 ) ) ( not ( = ?auto_76504 ?auto_76507 ) ) ( not ( = ?auto_76504 ?auto_76508 ) ) ( not ( = ?auto_76504 ?auto_76509 ) ) ( not ( = ?auto_76504 ?auto_76510 ) ) ( not ( = ?auto_76504 ?auto_76511 ) ) ( not ( = ?auto_76504 ?auto_76512 ) ) ( not ( = ?auto_76504 ?auto_76513 ) ) ( not ( = ?auto_76505 ?auto_76506 ) ) ( not ( = ?auto_76505 ?auto_76507 ) ) ( not ( = ?auto_76505 ?auto_76508 ) ) ( not ( = ?auto_76505 ?auto_76509 ) ) ( not ( = ?auto_76505 ?auto_76510 ) ) ( not ( = ?auto_76505 ?auto_76511 ) ) ( not ( = ?auto_76505 ?auto_76512 ) ) ( not ( = ?auto_76505 ?auto_76513 ) ) ( not ( = ?auto_76506 ?auto_76507 ) ) ( not ( = ?auto_76506 ?auto_76508 ) ) ( not ( = ?auto_76506 ?auto_76509 ) ) ( not ( = ?auto_76506 ?auto_76510 ) ) ( not ( = ?auto_76506 ?auto_76511 ) ) ( not ( = ?auto_76506 ?auto_76512 ) ) ( not ( = ?auto_76506 ?auto_76513 ) ) ( not ( = ?auto_76507 ?auto_76508 ) ) ( not ( = ?auto_76507 ?auto_76509 ) ) ( not ( = ?auto_76507 ?auto_76510 ) ) ( not ( = ?auto_76507 ?auto_76511 ) ) ( not ( = ?auto_76507 ?auto_76512 ) ) ( not ( = ?auto_76507 ?auto_76513 ) ) ( not ( = ?auto_76508 ?auto_76509 ) ) ( not ( = ?auto_76508 ?auto_76510 ) ) ( not ( = ?auto_76508 ?auto_76511 ) ) ( not ( = ?auto_76508 ?auto_76512 ) ) ( not ( = ?auto_76508 ?auto_76513 ) ) ( not ( = ?auto_76509 ?auto_76510 ) ) ( not ( = ?auto_76509 ?auto_76511 ) ) ( not ( = ?auto_76509 ?auto_76512 ) ) ( not ( = ?auto_76509 ?auto_76513 ) ) ( not ( = ?auto_76510 ?auto_76511 ) ) ( not ( = ?auto_76510 ?auto_76512 ) ) ( not ( = ?auto_76510 ?auto_76513 ) ) ( not ( = ?auto_76511 ?auto_76512 ) ) ( not ( = ?auto_76511 ?auto_76513 ) ) ( not ( = ?auto_76512 ?auto_76513 ) ) ( ON ?auto_76511 ?auto_76512 ) ( CLEAR ?auto_76509 ) ( ON ?auto_76510 ?auto_76511 ) ( CLEAR ?auto_76510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_76503 ?auto_76504 ?auto_76505 ?auto_76506 ?auto_76507 ?auto_76508 ?auto_76509 ?auto_76510 )
      ( MAKE-10PILE ?auto_76503 ?auto_76504 ?auto_76505 ?auto_76506 ?auto_76507 ?auto_76508 ?auto_76509 ?auto_76510 ?auto_76511 ?auto_76512 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76524 - BLOCK
      ?auto_76525 - BLOCK
      ?auto_76526 - BLOCK
      ?auto_76527 - BLOCK
      ?auto_76528 - BLOCK
      ?auto_76529 - BLOCK
      ?auto_76530 - BLOCK
      ?auto_76531 - BLOCK
      ?auto_76532 - BLOCK
      ?auto_76533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76533 ) ( ON-TABLE ?auto_76524 ) ( ON ?auto_76525 ?auto_76524 ) ( ON ?auto_76526 ?auto_76525 ) ( ON ?auto_76527 ?auto_76526 ) ( ON ?auto_76528 ?auto_76527 ) ( ON ?auto_76529 ?auto_76528 ) ( ON ?auto_76530 ?auto_76529 ) ( not ( = ?auto_76524 ?auto_76525 ) ) ( not ( = ?auto_76524 ?auto_76526 ) ) ( not ( = ?auto_76524 ?auto_76527 ) ) ( not ( = ?auto_76524 ?auto_76528 ) ) ( not ( = ?auto_76524 ?auto_76529 ) ) ( not ( = ?auto_76524 ?auto_76530 ) ) ( not ( = ?auto_76524 ?auto_76531 ) ) ( not ( = ?auto_76524 ?auto_76532 ) ) ( not ( = ?auto_76524 ?auto_76533 ) ) ( not ( = ?auto_76525 ?auto_76526 ) ) ( not ( = ?auto_76525 ?auto_76527 ) ) ( not ( = ?auto_76525 ?auto_76528 ) ) ( not ( = ?auto_76525 ?auto_76529 ) ) ( not ( = ?auto_76525 ?auto_76530 ) ) ( not ( = ?auto_76525 ?auto_76531 ) ) ( not ( = ?auto_76525 ?auto_76532 ) ) ( not ( = ?auto_76525 ?auto_76533 ) ) ( not ( = ?auto_76526 ?auto_76527 ) ) ( not ( = ?auto_76526 ?auto_76528 ) ) ( not ( = ?auto_76526 ?auto_76529 ) ) ( not ( = ?auto_76526 ?auto_76530 ) ) ( not ( = ?auto_76526 ?auto_76531 ) ) ( not ( = ?auto_76526 ?auto_76532 ) ) ( not ( = ?auto_76526 ?auto_76533 ) ) ( not ( = ?auto_76527 ?auto_76528 ) ) ( not ( = ?auto_76527 ?auto_76529 ) ) ( not ( = ?auto_76527 ?auto_76530 ) ) ( not ( = ?auto_76527 ?auto_76531 ) ) ( not ( = ?auto_76527 ?auto_76532 ) ) ( not ( = ?auto_76527 ?auto_76533 ) ) ( not ( = ?auto_76528 ?auto_76529 ) ) ( not ( = ?auto_76528 ?auto_76530 ) ) ( not ( = ?auto_76528 ?auto_76531 ) ) ( not ( = ?auto_76528 ?auto_76532 ) ) ( not ( = ?auto_76528 ?auto_76533 ) ) ( not ( = ?auto_76529 ?auto_76530 ) ) ( not ( = ?auto_76529 ?auto_76531 ) ) ( not ( = ?auto_76529 ?auto_76532 ) ) ( not ( = ?auto_76529 ?auto_76533 ) ) ( not ( = ?auto_76530 ?auto_76531 ) ) ( not ( = ?auto_76530 ?auto_76532 ) ) ( not ( = ?auto_76530 ?auto_76533 ) ) ( not ( = ?auto_76531 ?auto_76532 ) ) ( not ( = ?auto_76531 ?auto_76533 ) ) ( not ( = ?auto_76532 ?auto_76533 ) ) ( ON ?auto_76532 ?auto_76533 ) ( CLEAR ?auto_76530 ) ( ON ?auto_76531 ?auto_76532 ) ( CLEAR ?auto_76531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_76524 ?auto_76525 ?auto_76526 ?auto_76527 ?auto_76528 ?auto_76529 ?auto_76530 ?auto_76531 )
      ( MAKE-10PILE ?auto_76524 ?auto_76525 ?auto_76526 ?auto_76527 ?auto_76528 ?auto_76529 ?auto_76530 ?auto_76531 ?auto_76532 ?auto_76533 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76544 - BLOCK
      ?auto_76545 - BLOCK
      ?auto_76546 - BLOCK
      ?auto_76547 - BLOCK
      ?auto_76548 - BLOCK
      ?auto_76549 - BLOCK
      ?auto_76550 - BLOCK
      ?auto_76551 - BLOCK
      ?auto_76552 - BLOCK
      ?auto_76553 - BLOCK
    )
    :vars
    (
      ?auto_76554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76553 ?auto_76554 ) ( ON-TABLE ?auto_76544 ) ( ON ?auto_76545 ?auto_76544 ) ( ON ?auto_76546 ?auto_76545 ) ( ON ?auto_76547 ?auto_76546 ) ( ON ?auto_76548 ?auto_76547 ) ( ON ?auto_76549 ?auto_76548 ) ( not ( = ?auto_76544 ?auto_76545 ) ) ( not ( = ?auto_76544 ?auto_76546 ) ) ( not ( = ?auto_76544 ?auto_76547 ) ) ( not ( = ?auto_76544 ?auto_76548 ) ) ( not ( = ?auto_76544 ?auto_76549 ) ) ( not ( = ?auto_76544 ?auto_76550 ) ) ( not ( = ?auto_76544 ?auto_76551 ) ) ( not ( = ?auto_76544 ?auto_76552 ) ) ( not ( = ?auto_76544 ?auto_76553 ) ) ( not ( = ?auto_76544 ?auto_76554 ) ) ( not ( = ?auto_76545 ?auto_76546 ) ) ( not ( = ?auto_76545 ?auto_76547 ) ) ( not ( = ?auto_76545 ?auto_76548 ) ) ( not ( = ?auto_76545 ?auto_76549 ) ) ( not ( = ?auto_76545 ?auto_76550 ) ) ( not ( = ?auto_76545 ?auto_76551 ) ) ( not ( = ?auto_76545 ?auto_76552 ) ) ( not ( = ?auto_76545 ?auto_76553 ) ) ( not ( = ?auto_76545 ?auto_76554 ) ) ( not ( = ?auto_76546 ?auto_76547 ) ) ( not ( = ?auto_76546 ?auto_76548 ) ) ( not ( = ?auto_76546 ?auto_76549 ) ) ( not ( = ?auto_76546 ?auto_76550 ) ) ( not ( = ?auto_76546 ?auto_76551 ) ) ( not ( = ?auto_76546 ?auto_76552 ) ) ( not ( = ?auto_76546 ?auto_76553 ) ) ( not ( = ?auto_76546 ?auto_76554 ) ) ( not ( = ?auto_76547 ?auto_76548 ) ) ( not ( = ?auto_76547 ?auto_76549 ) ) ( not ( = ?auto_76547 ?auto_76550 ) ) ( not ( = ?auto_76547 ?auto_76551 ) ) ( not ( = ?auto_76547 ?auto_76552 ) ) ( not ( = ?auto_76547 ?auto_76553 ) ) ( not ( = ?auto_76547 ?auto_76554 ) ) ( not ( = ?auto_76548 ?auto_76549 ) ) ( not ( = ?auto_76548 ?auto_76550 ) ) ( not ( = ?auto_76548 ?auto_76551 ) ) ( not ( = ?auto_76548 ?auto_76552 ) ) ( not ( = ?auto_76548 ?auto_76553 ) ) ( not ( = ?auto_76548 ?auto_76554 ) ) ( not ( = ?auto_76549 ?auto_76550 ) ) ( not ( = ?auto_76549 ?auto_76551 ) ) ( not ( = ?auto_76549 ?auto_76552 ) ) ( not ( = ?auto_76549 ?auto_76553 ) ) ( not ( = ?auto_76549 ?auto_76554 ) ) ( not ( = ?auto_76550 ?auto_76551 ) ) ( not ( = ?auto_76550 ?auto_76552 ) ) ( not ( = ?auto_76550 ?auto_76553 ) ) ( not ( = ?auto_76550 ?auto_76554 ) ) ( not ( = ?auto_76551 ?auto_76552 ) ) ( not ( = ?auto_76551 ?auto_76553 ) ) ( not ( = ?auto_76551 ?auto_76554 ) ) ( not ( = ?auto_76552 ?auto_76553 ) ) ( not ( = ?auto_76552 ?auto_76554 ) ) ( not ( = ?auto_76553 ?auto_76554 ) ) ( ON ?auto_76552 ?auto_76553 ) ( ON ?auto_76551 ?auto_76552 ) ( CLEAR ?auto_76549 ) ( ON ?auto_76550 ?auto_76551 ) ( CLEAR ?auto_76550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76544 ?auto_76545 ?auto_76546 ?auto_76547 ?auto_76548 ?auto_76549 ?auto_76550 )
      ( MAKE-10PILE ?auto_76544 ?auto_76545 ?auto_76546 ?auto_76547 ?auto_76548 ?auto_76549 ?auto_76550 ?auto_76551 ?auto_76552 ?auto_76553 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76565 - BLOCK
      ?auto_76566 - BLOCK
      ?auto_76567 - BLOCK
      ?auto_76568 - BLOCK
      ?auto_76569 - BLOCK
      ?auto_76570 - BLOCK
      ?auto_76571 - BLOCK
      ?auto_76572 - BLOCK
      ?auto_76573 - BLOCK
      ?auto_76574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76574 ) ( ON-TABLE ?auto_76565 ) ( ON ?auto_76566 ?auto_76565 ) ( ON ?auto_76567 ?auto_76566 ) ( ON ?auto_76568 ?auto_76567 ) ( ON ?auto_76569 ?auto_76568 ) ( ON ?auto_76570 ?auto_76569 ) ( not ( = ?auto_76565 ?auto_76566 ) ) ( not ( = ?auto_76565 ?auto_76567 ) ) ( not ( = ?auto_76565 ?auto_76568 ) ) ( not ( = ?auto_76565 ?auto_76569 ) ) ( not ( = ?auto_76565 ?auto_76570 ) ) ( not ( = ?auto_76565 ?auto_76571 ) ) ( not ( = ?auto_76565 ?auto_76572 ) ) ( not ( = ?auto_76565 ?auto_76573 ) ) ( not ( = ?auto_76565 ?auto_76574 ) ) ( not ( = ?auto_76566 ?auto_76567 ) ) ( not ( = ?auto_76566 ?auto_76568 ) ) ( not ( = ?auto_76566 ?auto_76569 ) ) ( not ( = ?auto_76566 ?auto_76570 ) ) ( not ( = ?auto_76566 ?auto_76571 ) ) ( not ( = ?auto_76566 ?auto_76572 ) ) ( not ( = ?auto_76566 ?auto_76573 ) ) ( not ( = ?auto_76566 ?auto_76574 ) ) ( not ( = ?auto_76567 ?auto_76568 ) ) ( not ( = ?auto_76567 ?auto_76569 ) ) ( not ( = ?auto_76567 ?auto_76570 ) ) ( not ( = ?auto_76567 ?auto_76571 ) ) ( not ( = ?auto_76567 ?auto_76572 ) ) ( not ( = ?auto_76567 ?auto_76573 ) ) ( not ( = ?auto_76567 ?auto_76574 ) ) ( not ( = ?auto_76568 ?auto_76569 ) ) ( not ( = ?auto_76568 ?auto_76570 ) ) ( not ( = ?auto_76568 ?auto_76571 ) ) ( not ( = ?auto_76568 ?auto_76572 ) ) ( not ( = ?auto_76568 ?auto_76573 ) ) ( not ( = ?auto_76568 ?auto_76574 ) ) ( not ( = ?auto_76569 ?auto_76570 ) ) ( not ( = ?auto_76569 ?auto_76571 ) ) ( not ( = ?auto_76569 ?auto_76572 ) ) ( not ( = ?auto_76569 ?auto_76573 ) ) ( not ( = ?auto_76569 ?auto_76574 ) ) ( not ( = ?auto_76570 ?auto_76571 ) ) ( not ( = ?auto_76570 ?auto_76572 ) ) ( not ( = ?auto_76570 ?auto_76573 ) ) ( not ( = ?auto_76570 ?auto_76574 ) ) ( not ( = ?auto_76571 ?auto_76572 ) ) ( not ( = ?auto_76571 ?auto_76573 ) ) ( not ( = ?auto_76571 ?auto_76574 ) ) ( not ( = ?auto_76572 ?auto_76573 ) ) ( not ( = ?auto_76572 ?auto_76574 ) ) ( not ( = ?auto_76573 ?auto_76574 ) ) ( ON ?auto_76573 ?auto_76574 ) ( ON ?auto_76572 ?auto_76573 ) ( CLEAR ?auto_76570 ) ( ON ?auto_76571 ?auto_76572 ) ( CLEAR ?auto_76571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76565 ?auto_76566 ?auto_76567 ?auto_76568 ?auto_76569 ?auto_76570 ?auto_76571 )
      ( MAKE-10PILE ?auto_76565 ?auto_76566 ?auto_76567 ?auto_76568 ?auto_76569 ?auto_76570 ?auto_76571 ?auto_76572 ?auto_76573 ?auto_76574 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76585 - BLOCK
      ?auto_76586 - BLOCK
      ?auto_76587 - BLOCK
      ?auto_76588 - BLOCK
      ?auto_76589 - BLOCK
      ?auto_76590 - BLOCK
      ?auto_76591 - BLOCK
      ?auto_76592 - BLOCK
      ?auto_76593 - BLOCK
      ?auto_76594 - BLOCK
    )
    :vars
    (
      ?auto_76595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76594 ?auto_76595 ) ( ON-TABLE ?auto_76585 ) ( ON ?auto_76586 ?auto_76585 ) ( ON ?auto_76587 ?auto_76586 ) ( ON ?auto_76588 ?auto_76587 ) ( ON ?auto_76589 ?auto_76588 ) ( not ( = ?auto_76585 ?auto_76586 ) ) ( not ( = ?auto_76585 ?auto_76587 ) ) ( not ( = ?auto_76585 ?auto_76588 ) ) ( not ( = ?auto_76585 ?auto_76589 ) ) ( not ( = ?auto_76585 ?auto_76590 ) ) ( not ( = ?auto_76585 ?auto_76591 ) ) ( not ( = ?auto_76585 ?auto_76592 ) ) ( not ( = ?auto_76585 ?auto_76593 ) ) ( not ( = ?auto_76585 ?auto_76594 ) ) ( not ( = ?auto_76585 ?auto_76595 ) ) ( not ( = ?auto_76586 ?auto_76587 ) ) ( not ( = ?auto_76586 ?auto_76588 ) ) ( not ( = ?auto_76586 ?auto_76589 ) ) ( not ( = ?auto_76586 ?auto_76590 ) ) ( not ( = ?auto_76586 ?auto_76591 ) ) ( not ( = ?auto_76586 ?auto_76592 ) ) ( not ( = ?auto_76586 ?auto_76593 ) ) ( not ( = ?auto_76586 ?auto_76594 ) ) ( not ( = ?auto_76586 ?auto_76595 ) ) ( not ( = ?auto_76587 ?auto_76588 ) ) ( not ( = ?auto_76587 ?auto_76589 ) ) ( not ( = ?auto_76587 ?auto_76590 ) ) ( not ( = ?auto_76587 ?auto_76591 ) ) ( not ( = ?auto_76587 ?auto_76592 ) ) ( not ( = ?auto_76587 ?auto_76593 ) ) ( not ( = ?auto_76587 ?auto_76594 ) ) ( not ( = ?auto_76587 ?auto_76595 ) ) ( not ( = ?auto_76588 ?auto_76589 ) ) ( not ( = ?auto_76588 ?auto_76590 ) ) ( not ( = ?auto_76588 ?auto_76591 ) ) ( not ( = ?auto_76588 ?auto_76592 ) ) ( not ( = ?auto_76588 ?auto_76593 ) ) ( not ( = ?auto_76588 ?auto_76594 ) ) ( not ( = ?auto_76588 ?auto_76595 ) ) ( not ( = ?auto_76589 ?auto_76590 ) ) ( not ( = ?auto_76589 ?auto_76591 ) ) ( not ( = ?auto_76589 ?auto_76592 ) ) ( not ( = ?auto_76589 ?auto_76593 ) ) ( not ( = ?auto_76589 ?auto_76594 ) ) ( not ( = ?auto_76589 ?auto_76595 ) ) ( not ( = ?auto_76590 ?auto_76591 ) ) ( not ( = ?auto_76590 ?auto_76592 ) ) ( not ( = ?auto_76590 ?auto_76593 ) ) ( not ( = ?auto_76590 ?auto_76594 ) ) ( not ( = ?auto_76590 ?auto_76595 ) ) ( not ( = ?auto_76591 ?auto_76592 ) ) ( not ( = ?auto_76591 ?auto_76593 ) ) ( not ( = ?auto_76591 ?auto_76594 ) ) ( not ( = ?auto_76591 ?auto_76595 ) ) ( not ( = ?auto_76592 ?auto_76593 ) ) ( not ( = ?auto_76592 ?auto_76594 ) ) ( not ( = ?auto_76592 ?auto_76595 ) ) ( not ( = ?auto_76593 ?auto_76594 ) ) ( not ( = ?auto_76593 ?auto_76595 ) ) ( not ( = ?auto_76594 ?auto_76595 ) ) ( ON ?auto_76593 ?auto_76594 ) ( ON ?auto_76592 ?auto_76593 ) ( ON ?auto_76591 ?auto_76592 ) ( CLEAR ?auto_76589 ) ( ON ?auto_76590 ?auto_76591 ) ( CLEAR ?auto_76590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76585 ?auto_76586 ?auto_76587 ?auto_76588 ?auto_76589 ?auto_76590 )
      ( MAKE-10PILE ?auto_76585 ?auto_76586 ?auto_76587 ?auto_76588 ?auto_76589 ?auto_76590 ?auto_76591 ?auto_76592 ?auto_76593 ?auto_76594 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76606 - BLOCK
      ?auto_76607 - BLOCK
      ?auto_76608 - BLOCK
      ?auto_76609 - BLOCK
      ?auto_76610 - BLOCK
      ?auto_76611 - BLOCK
      ?auto_76612 - BLOCK
      ?auto_76613 - BLOCK
      ?auto_76614 - BLOCK
      ?auto_76615 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76615 ) ( ON-TABLE ?auto_76606 ) ( ON ?auto_76607 ?auto_76606 ) ( ON ?auto_76608 ?auto_76607 ) ( ON ?auto_76609 ?auto_76608 ) ( ON ?auto_76610 ?auto_76609 ) ( not ( = ?auto_76606 ?auto_76607 ) ) ( not ( = ?auto_76606 ?auto_76608 ) ) ( not ( = ?auto_76606 ?auto_76609 ) ) ( not ( = ?auto_76606 ?auto_76610 ) ) ( not ( = ?auto_76606 ?auto_76611 ) ) ( not ( = ?auto_76606 ?auto_76612 ) ) ( not ( = ?auto_76606 ?auto_76613 ) ) ( not ( = ?auto_76606 ?auto_76614 ) ) ( not ( = ?auto_76606 ?auto_76615 ) ) ( not ( = ?auto_76607 ?auto_76608 ) ) ( not ( = ?auto_76607 ?auto_76609 ) ) ( not ( = ?auto_76607 ?auto_76610 ) ) ( not ( = ?auto_76607 ?auto_76611 ) ) ( not ( = ?auto_76607 ?auto_76612 ) ) ( not ( = ?auto_76607 ?auto_76613 ) ) ( not ( = ?auto_76607 ?auto_76614 ) ) ( not ( = ?auto_76607 ?auto_76615 ) ) ( not ( = ?auto_76608 ?auto_76609 ) ) ( not ( = ?auto_76608 ?auto_76610 ) ) ( not ( = ?auto_76608 ?auto_76611 ) ) ( not ( = ?auto_76608 ?auto_76612 ) ) ( not ( = ?auto_76608 ?auto_76613 ) ) ( not ( = ?auto_76608 ?auto_76614 ) ) ( not ( = ?auto_76608 ?auto_76615 ) ) ( not ( = ?auto_76609 ?auto_76610 ) ) ( not ( = ?auto_76609 ?auto_76611 ) ) ( not ( = ?auto_76609 ?auto_76612 ) ) ( not ( = ?auto_76609 ?auto_76613 ) ) ( not ( = ?auto_76609 ?auto_76614 ) ) ( not ( = ?auto_76609 ?auto_76615 ) ) ( not ( = ?auto_76610 ?auto_76611 ) ) ( not ( = ?auto_76610 ?auto_76612 ) ) ( not ( = ?auto_76610 ?auto_76613 ) ) ( not ( = ?auto_76610 ?auto_76614 ) ) ( not ( = ?auto_76610 ?auto_76615 ) ) ( not ( = ?auto_76611 ?auto_76612 ) ) ( not ( = ?auto_76611 ?auto_76613 ) ) ( not ( = ?auto_76611 ?auto_76614 ) ) ( not ( = ?auto_76611 ?auto_76615 ) ) ( not ( = ?auto_76612 ?auto_76613 ) ) ( not ( = ?auto_76612 ?auto_76614 ) ) ( not ( = ?auto_76612 ?auto_76615 ) ) ( not ( = ?auto_76613 ?auto_76614 ) ) ( not ( = ?auto_76613 ?auto_76615 ) ) ( not ( = ?auto_76614 ?auto_76615 ) ) ( ON ?auto_76614 ?auto_76615 ) ( ON ?auto_76613 ?auto_76614 ) ( ON ?auto_76612 ?auto_76613 ) ( CLEAR ?auto_76610 ) ( ON ?auto_76611 ?auto_76612 ) ( CLEAR ?auto_76611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76606 ?auto_76607 ?auto_76608 ?auto_76609 ?auto_76610 ?auto_76611 )
      ( MAKE-10PILE ?auto_76606 ?auto_76607 ?auto_76608 ?auto_76609 ?auto_76610 ?auto_76611 ?auto_76612 ?auto_76613 ?auto_76614 ?auto_76615 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76626 - BLOCK
      ?auto_76627 - BLOCK
      ?auto_76628 - BLOCK
      ?auto_76629 - BLOCK
      ?auto_76630 - BLOCK
      ?auto_76631 - BLOCK
      ?auto_76632 - BLOCK
      ?auto_76633 - BLOCK
      ?auto_76634 - BLOCK
      ?auto_76635 - BLOCK
    )
    :vars
    (
      ?auto_76636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76635 ?auto_76636 ) ( ON-TABLE ?auto_76626 ) ( ON ?auto_76627 ?auto_76626 ) ( ON ?auto_76628 ?auto_76627 ) ( ON ?auto_76629 ?auto_76628 ) ( not ( = ?auto_76626 ?auto_76627 ) ) ( not ( = ?auto_76626 ?auto_76628 ) ) ( not ( = ?auto_76626 ?auto_76629 ) ) ( not ( = ?auto_76626 ?auto_76630 ) ) ( not ( = ?auto_76626 ?auto_76631 ) ) ( not ( = ?auto_76626 ?auto_76632 ) ) ( not ( = ?auto_76626 ?auto_76633 ) ) ( not ( = ?auto_76626 ?auto_76634 ) ) ( not ( = ?auto_76626 ?auto_76635 ) ) ( not ( = ?auto_76626 ?auto_76636 ) ) ( not ( = ?auto_76627 ?auto_76628 ) ) ( not ( = ?auto_76627 ?auto_76629 ) ) ( not ( = ?auto_76627 ?auto_76630 ) ) ( not ( = ?auto_76627 ?auto_76631 ) ) ( not ( = ?auto_76627 ?auto_76632 ) ) ( not ( = ?auto_76627 ?auto_76633 ) ) ( not ( = ?auto_76627 ?auto_76634 ) ) ( not ( = ?auto_76627 ?auto_76635 ) ) ( not ( = ?auto_76627 ?auto_76636 ) ) ( not ( = ?auto_76628 ?auto_76629 ) ) ( not ( = ?auto_76628 ?auto_76630 ) ) ( not ( = ?auto_76628 ?auto_76631 ) ) ( not ( = ?auto_76628 ?auto_76632 ) ) ( not ( = ?auto_76628 ?auto_76633 ) ) ( not ( = ?auto_76628 ?auto_76634 ) ) ( not ( = ?auto_76628 ?auto_76635 ) ) ( not ( = ?auto_76628 ?auto_76636 ) ) ( not ( = ?auto_76629 ?auto_76630 ) ) ( not ( = ?auto_76629 ?auto_76631 ) ) ( not ( = ?auto_76629 ?auto_76632 ) ) ( not ( = ?auto_76629 ?auto_76633 ) ) ( not ( = ?auto_76629 ?auto_76634 ) ) ( not ( = ?auto_76629 ?auto_76635 ) ) ( not ( = ?auto_76629 ?auto_76636 ) ) ( not ( = ?auto_76630 ?auto_76631 ) ) ( not ( = ?auto_76630 ?auto_76632 ) ) ( not ( = ?auto_76630 ?auto_76633 ) ) ( not ( = ?auto_76630 ?auto_76634 ) ) ( not ( = ?auto_76630 ?auto_76635 ) ) ( not ( = ?auto_76630 ?auto_76636 ) ) ( not ( = ?auto_76631 ?auto_76632 ) ) ( not ( = ?auto_76631 ?auto_76633 ) ) ( not ( = ?auto_76631 ?auto_76634 ) ) ( not ( = ?auto_76631 ?auto_76635 ) ) ( not ( = ?auto_76631 ?auto_76636 ) ) ( not ( = ?auto_76632 ?auto_76633 ) ) ( not ( = ?auto_76632 ?auto_76634 ) ) ( not ( = ?auto_76632 ?auto_76635 ) ) ( not ( = ?auto_76632 ?auto_76636 ) ) ( not ( = ?auto_76633 ?auto_76634 ) ) ( not ( = ?auto_76633 ?auto_76635 ) ) ( not ( = ?auto_76633 ?auto_76636 ) ) ( not ( = ?auto_76634 ?auto_76635 ) ) ( not ( = ?auto_76634 ?auto_76636 ) ) ( not ( = ?auto_76635 ?auto_76636 ) ) ( ON ?auto_76634 ?auto_76635 ) ( ON ?auto_76633 ?auto_76634 ) ( ON ?auto_76632 ?auto_76633 ) ( ON ?auto_76631 ?auto_76632 ) ( CLEAR ?auto_76629 ) ( ON ?auto_76630 ?auto_76631 ) ( CLEAR ?auto_76630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76626 ?auto_76627 ?auto_76628 ?auto_76629 ?auto_76630 )
      ( MAKE-10PILE ?auto_76626 ?auto_76627 ?auto_76628 ?auto_76629 ?auto_76630 ?auto_76631 ?auto_76632 ?auto_76633 ?auto_76634 ?auto_76635 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76647 - BLOCK
      ?auto_76648 - BLOCK
      ?auto_76649 - BLOCK
      ?auto_76650 - BLOCK
      ?auto_76651 - BLOCK
      ?auto_76652 - BLOCK
      ?auto_76653 - BLOCK
      ?auto_76654 - BLOCK
      ?auto_76655 - BLOCK
      ?auto_76656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76656 ) ( ON-TABLE ?auto_76647 ) ( ON ?auto_76648 ?auto_76647 ) ( ON ?auto_76649 ?auto_76648 ) ( ON ?auto_76650 ?auto_76649 ) ( not ( = ?auto_76647 ?auto_76648 ) ) ( not ( = ?auto_76647 ?auto_76649 ) ) ( not ( = ?auto_76647 ?auto_76650 ) ) ( not ( = ?auto_76647 ?auto_76651 ) ) ( not ( = ?auto_76647 ?auto_76652 ) ) ( not ( = ?auto_76647 ?auto_76653 ) ) ( not ( = ?auto_76647 ?auto_76654 ) ) ( not ( = ?auto_76647 ?auto_76655 ) ) ( not ( = ?auto_76647 ?auto_76656 ) ) ( not ( = ?auto_76648 ?auto_76649 ) ) ( not ( = ?auto_76648 ?auto_76650 ) ) ( not ( = ?auto_76648 ?auto_76651 ) ) ( not ( = ?auto_76648 ?auto_76652 ) ) ( not ( = ?auto_76648 ?auto_76653 ) ) ( not ( = ?auto_76648 ?auto_76654 ) ) ( not ( = ?auto_76648 ?auto_76655 ) ) ( not ( = ?auto_76648 ?auto_76656 ) ) ( not ( = ?auto_76649 ?auto_76650 ) ) ( not ( = ?auto_76649 ?auto_76651 ) ) ( not ( = ?auto_76649 ?auto_76652 ) ) ( not ( = ?auto_76649 ?auto_76653 ) ) ( not ( = ?auto_76649 ?auto_76654 ) ) ( not ( = ?auto_76649 ?auto_76655 ) ) ( not ( = ?auto_76649 ?auto_76656 ) ) ( not ( = ?auto_76650 ?auto_76651 ) ) ( not ( = ?auto_76650 ?auto_76652 ) ) ( not ( = ?auto_76650 ?auto_76653 ) ) ( not ( = ?auto_76650 ?auto_76654 ) ) ( not ( = ?auto_76650 ?auto_76655 ) ) ( not ( = ?auto_76650 ?auto_76656 ) ) ( not ( = ?auto_76651 ?auto_76652 ) ) ( not ( = ?auto_76651 ?auto_76653 ) ) ( not ( = ?auto_76651 ?auto_76654 ) ) ( not ( = ?auto_76651 ?auto_76655 ) ) ( not ( = ?auto_76651 ?auto_76656 ) ) ( not ( = ?auto_76652 ?auto_76653 ) ) ( not ( = ?auto_76652 ?auto_76654 ) ) ( not ( = ?auto_76652 ?auto_76655 ) ) ( not ( = ?auto_76652 ?auto_76656 ) ) ( not ( = ?auto_76653 ?auto_76654 ) ) ( not ( = ?auto_76653 ?auto_76655 ) ) ( not ( = ?auto_76653 ?auto_76656 ) ) ( not ( = ?auto_76654 ?auto_76655 ) ) ( not ( = ?auto_76654 ?auto_76656 ) ) ( not ( = ?auto_76655 ?auto_76656 ) ) ( ON ?auto_76655 ?auto_76656 ) ( ON ?auto_76654 ?auto_76655 ) ( ON ?auto_76653 ?auto_76654 ) ( ON ?auto_76652 ?auto_76653 ) ( CLEAR ?auto_76650 ) ( ON ?auto_76651 ?auto_76652 ) ( CLEAR ?auto_76651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76647 ?auto_76648 ?auto_76649 ?auto_76650 ?auto_76651 )
      ( MAKE-10PILE ?auto_76647 ?auto_76648 ?auto_76649 ?auto_76650 ?auto_76651 ?auto_76652 ?auto_76653 ?auto_76654 ?auto_76655 ?auto_76656 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76667 - BLOCK
      ?auto_76668 - BLOCK
      ?auto_76669 - BLOCK
      ?auto_76670 - BLOCK
      ?auto_76671 - BLOCK
      ?auto_76672 - BLOCK
      ?auto_76673 - BLOCK
      ?auto_76674 - BLOCK
      ?auto_76675 - BLOCK
      ?auto_76676 - BLOCK
    )
    :vars
    (
      ?auto_76677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76676 ?auto_76677 ) ( ON-TABLE ?auto_76667 ) ( ON ?auto_76668 ?auto_76667 ) ( ON ?auto_76669 ?auto_76668 ) ( not ( = ?auto_76667 ?auto_76668 ) ) ( not ( = ?auto_76667 ?auto_76669 ) ) ( not ( = ?auto_76667 ?auto_76670 ) ) ( not ( = ?auto_76667 ?auto_76671 ) ) ( not ( = ?auto_76667 ?auto_76672 ) ) ( not ( = ?auto_76667 ?auto_76673 ) ) ( not ( = ?auto_76667 ?auto_76674 ) ) ( not ( = ?auto_76667 ?auto_76675 ) ) ( not ( = ?auto_76667 ?auto_76676 ) ) ( not ( = ?auto_76667 ?auto_76677 ) ) ( not ( = ?auto_76668 ?auto_76669 ) ) ( not ( = ?auto_76668 ?auto_76670 ) ) ( not ( = ?auto_76668 ?auto_76671 ) ) ( not ( = ?auto_76668 ?auto_76672 ) ) ( not ( = ?auto_76668 ?auto_76673 ) ) ( not ( = ?auto_76668 ?auto_76674 ) ) ( not ( = ?auto_76668 ?auto_76675 ) ) ( not ( = ?auto_76668 ?auto_76676 ) ) ( not ( = ?auto_76668 ?auto_76677 ) ) ( not ( = ?auto_76669 ?auto_76670 ) ) ( not ( = ?auto_76669 ?auto_76671 ) ) ( not ( = ?auto_76669 ?auto_76672 ) ) ( not ( = ?auto_76669 ?auto_76673 ) ) ( not ( = ?auto_76669 ?auto_76674 ) ) ( not ( = ?auto_76669 ?auto_76675 ) ) ( not ( = ?auto_76669 ?auto_76676 ) ) ( not ( = ?auto_76669 ?auto_76677 ) ) ( not ( = ?auto_76670 ?auto_76671 ) ) ( not ( = ?auto_76670 ?auto_76672 ) ) ( not ( = ?auto_76670 ?auto_76673 ) ) ( not ( = ?auto_76670 ?auto_76674 ) ) ( not ( = ?auto_76670 ?auto_76675 ) ) ( not ( = ?auto_76670 ?auto_76676 ) ) ( not ( = ?auto_76670 ?auto_76677 ) ) ( not ( = ?auto_76671 ?auto_76672 ) ) ( not ( = ?auto_76671 ?auto_76673 ) ) ( not ( = ?auto_76671 ?auto_76674 ) ) ( not ( = ?auto_76671 ?auto_76675 ) ) ( not ( = ?auto_76671 ?auto_76676 ) ) ( not ( = ?auto_76671 ?auto_76677 ) ) ( not ( = ?auto_76672 ?auto_76673 ) ) ( not ( = ?auto_76672 ?auto_76674 ) ) ( not ( = ?auto_76672 ?auto_76675 ) ) ( not ( = ?auto_76672 ?auto_76676 ) ) ( not ( = ?auto_76672 ?auto_76677 ) ) ( not ( = ?auto_76673 ?auto_76674 ) ) ( not ( = ?auto_76673 ?auto_76675 ) ) ( not ( = ?auto_76673 ?auto_76676 ) ) ( not ( = ?auto_76673 ?auto_76677 ) ) ( not ( = ?auto_76674 ?auto_76675 ) ) ( not ( = ?auto_76674 ?auto_76676 ) ) ( not ( = ?auto_76674 ?auto_76677 ) ) ( not ( = ?auto_76675 ?auto_76676 ) ) ( not ( = ?auto_76675 ?auto_76677 ) ) ( not ( = ?auto_76676 ?auto_76677 ) ) ( ON ?auto_76675 ?auto_76676 ) ( ON ?auto_76674 ?auto_76675 ) ( ON ?auto_76673 ?auto_76674 ) ( ON ?auto_76672 ?auto_76673 ) ( ON ?auto_76671 ?auto_76672 ) ( CLEAR ?auto_76669 ) ( ON ?auto_76670 ?auto_76671 ) ( CLEAR ?auto_76670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76667 ?auto_76668 ?auto_76669 ?auto_76670 )
      ( MAKE-10PILE ?auto_76667 ?auto_76668 ?auto_76669 ?auto_76670 ?auto_76671 ?auto_76672 ?auto_76673 ?auto_76674 ?auto_76675 ?auto_76676 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76688 - BLOCK
      ?auto_76689 - BLOCK
      ?auto_76690 - BLOCK
      ?auto_76691 - BLOCK
      ?auto_76692 - BLOCK
      ?auto_76693 - BLOCK
      ?auto_76694 - BLOCK
      ?auto_76695 - BLOCK
      ?auto_76696 - BLOCK
      ?auto_76697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76697 ) ( ON-TABLE ?auto_76688 ) ( ON ?auto_76689 ?auto_76688 ) ( ON ?auto_76690 ?auto_76689 ) ( not ( = ?auto_76688 ?auto_76689 ) ) ( not ( = ?auto_76688 ?auto_76690 ) ) ( not ( = ?auto_76688 ?auto_76691 ) ) ( not ( = ?auto_76688 ?auto_76692 ) ) ( not ( = ?auto_76688 ?auto_76693 ) ) ( not ( = ?auto_76688 ?auto_76694 ) ) ( not ( = ?auto_76688 ?auto_76695 ) ) ( not ( = ?auto_76688 ?auto_76696 ) ) ( not ( = ?auto_76688 ?auto_76697 ) ) ( not ( = ?auto_76689 ?auto_76690 ) ) ( not ( = ?auto_76689 ?auto_76691 ) ) ( not ( = ?auto_76689 ?auto_76692 ) ) ( not ( = ?auto_76689 ?auto_76693 ) ) ( not ( = ?auto_76689 ?auto_76694 ) ) ( not ( = ?auto_76689 ?auto_76695 ) ) ( not ( = ?auto_76689 ?auto_76696 ) ) ( not ( = ?auto_76689 ?auto_76697 ) ) ( not ( = ?auto_76690 ?auto_76691 ) ) ( not ( = ?auto_76690 ?auto_76692 ) ) ( not ( = ?auto_76690 ?auto_76693 ) ) ( not ( = ?auto_76690 ?auto_76694 ) ) ( not ( = ?auto_76690 ?auto_76695 ) ) ( not ( = ?auto_76690 ?auto_76696 ) ) ( not ( = ?auto_76690 ?auto_76697 ) ) ( not ( = ?auto_76691 ?auto_76692 ) ) ( not ( = ?auto_76691 ?auto_76693 ) ) ( not ( = ?auto_76691 ?auto_76694 ) ) ( not ( = ?auto_76691 ?auto_76695 ) ) ( not ( = ?auto_76691 ?auto_76696 ) ) ( not ( = ?auto_76691 ?auto_76697 ) ) ( not ( = ?auto_76692 ?auto_76693 ) ) ( not ( = ?auto_76692 ?auto_76694 ) ) ( not ( = ?auto_76692 ?auto_76695 ) ) ( not ( = ?auto_76692 ?auto_76696 ) ) ( not ( = ?auto_76692 ?auto_76697 ) ) ( not ( = ?auto_76693 ?auto_76694 ) ) ( not ( = ?auto_76693 ?auto_76695 ) ) ( not ( = ?auto_76693 ?auto_76696 ) ) ( not ( = ?auto_76693 ?auto_76697 ) ) ( not ( = ?auto_76694 ?auto_76695 ) ) ( not ( = ?auto_76694 ?auto_76696 ) ) ( not ( = ?auto_76694 ?auto_76697 ) ) ( not ( = ?auto_76695 ?auto_76696 ) ) ( not ( = ?auto_76695 ?auto_76697 ) ) ( not ( = ?auto_76696 ?auto_76697 ) ) ( ON ?auto_76696 ?auto_76697 ) ( ON ?auto_76695 ?auto_76696 ) ( ON ?auto_76694 ?auto_76695 ) ( ON ?auto_76693 ?auto_76694 ) ( ON ?auto_76692 ?auto_76693 ) ( CLEAR ?auto_76690 ) ( ON ?auto_76691 ?auto_76692 ) ( CLEAR ?auto_76691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76688 ?auto_76689 ?auto_76690 ?auto_76691 )
      ( MAKE-10PILE ?auto_76688 ?auto_76689 ?auto_76690 ?auto_76691 ?auto_76692 ?auto_76693 ?auto_76694 ?auto_76695 ?auto_76696 ?auto_76697 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76708 - BLOCK
      ?auto_76709 - BLOCK
      ?auto_76710 - BLOCK
      ?auto_76711 - BLOCK
      ?auto_76712 - BLOCK
      ?auto_76713 - BLOCK
      ?auto_76714 - BLOCK
      ?auto_76715 - BLOCK
      ?auto_76716 - BLOCK
      ?auto_76717 - BLOCK
    )
    :vars
    (
      ?auto_76718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76717 ?auto_76718 ) ( ON-TABLE ?auto_76708 ) ( ON ?auto_76709 ?auto_76708 ) ( not ( = ?auto_76708 ?auto_76709 ) ) ( not ( = ?auto_76708 ?auto_76710 ) ) ( not ( = ?auto_76708 ?auto_76711 ) ) ( not ( = ?auto_76708 ?auto_76712 ) ) ( not ( = ?auto_76708 ?auto_76713 ) ) ( not ( = ?auto_76708 ?auto_76714 ) ) ( not ( = ?auto_76708 ?auto_76715 ) ) ( not ( = ?auto_76708 ?auto_76716 ) ) ( not ( = ?auto_76708 ?auto_76717 ) ) ( not ( = ?auto_76708 ?auto_76718 ) ) ( not ( = ?auto_76709 ?auto_76710 ) ) ( not ( = ?auto_76709 ?auto_76711 ) ) ( not ( = ?auto_76709 ?auto_76712 ) ) ( not ( = ?auto_76709 ?auto_76713 ) ) ( not ( = ?auto_76709 ?auto_76714 ) ) ( not ( = ?auto_76709 ?auto_76715 ) ) ( not ( = ?auto_76709 ?auto_76716 ) ) ( not ( = ?auto_76709 ?auto_76717 ) ) ( not ( = ?auto_76709 ?auto_76718 ) ) ( not ( = ?auto_76710 ?auto_76711 ) ) ( not ( = ?auto_76710 ?auto_76712 ) ) ( not ( = ?auto_76710 ?auto_76713 ) ) ( not ( = ?auto_76710 ?auto_76714 ) ) ( not ( = ?auto_76710 ?auto_76715 ) ) ( not ( = ?auto_76710 ?auto_76716 ) ) ( not ( = ?auto_76710 ?auto_76717 ) ) ( not ( = ?auto_76710 ?auto_76718 ) ) ( not ( = ?auto_76711 ?auto_76712 ) ) ( not ( = ?auto_76711 ?auto_76713 ) ) ( not ( = ?auto_76711 ?auto_76714 ) ) ( not ( = ?auto_76711 ?auto_76715 ) ) ( not ( = ?auto_76711 ?auto_76716 ) ) ( not ( = ?auto_76711 ?auto_76717 ) ) ( not ( = ?auto_76711 ?auto_76718 ) ) ( not ( = ?auto_76712 ?auto_76713 ) ) ( not ( = ?auto_76712 ?auto_76714 ) ) ( not ( = ?auto_76712 ?auto_76715 ) ) ( not ( = ?auto_76712 ?auto_76716 ) ) ( not ( = ?auto_76712 ?auto_76717 ) ) ( not ( = ?auto_76712 ?auto_76718 ) ) ( not ( = ?auto_76713 ?auto_76714 ) ) ( not ( = ?auto_76713 ?auto_76715 ) ) ( not ( = ?auto_76713 ?auto_76716 ) ) ( not ( = ?auto_76713 ?auto_76717 ) ) ( not ( = ?auto_76713 ?auto_76718 ) ) ( not ( = ?auto_76714 ?auto_76715 ) ) ( not ( = ?auto_76714 ?auto_76716 ) ) ( not ( = ?auto_76714 ?auto_76717 ) ) ( not ( = ?auto_76714 ?auto_76718 ) ) ( not ( = ?auto_76715 ?auto_76716 ) ) ( not ( = ?auto_76715 ?auto_76717 ) ) ( not ( = ?auto_76715 ?auto_76718 ) ) ( not ( = ?auto_76716 ?auto_76717 ) ) ( not ( = ?auto_76716 ?auto_76718 ) ) ( not ( = ?auto_76717 ?auto_76718 ) ) ( ON ?auto_76716 ?auto_76717 ) ( ON ?auto_76715 ?auto_76716 ) ( ON ?auto_76714 ?auto_76715 ) ( ON ?auto_76713 ?auto_76714 ) ( ON ?auto_76712 ?auto_76713 ) ( ON ?auto_76711 ?auto_76712 ) ( CLEAR ?auto_76709 ) ( ON ?auto_76710 ?auto_76711 ) ( CLEAR ?auto_76710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76708 ?auto_76709 ?auto_76710 )
      ( MAKE-10PILE ?auto_76708 ?auto_76709 ?auto_76710 ?auto_76711 ?auto_76712 ?auto_76713 ?auto_76714 ?auto_76715 ?auto_76716 ?auto_76717 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76729 - BLOCK
      ?auto_76730 - BLOCK
      ?auto_76731 - BLOCK
      ?auto_76732 - BLOCK
      ?auto_76733 - BLOCK
      ?auto_76734 - BLOCK
      ?auto_76735 - BLOCK
      ?auto_76736 - BLOCK
      ?auto_76737 - BLOCK
      ?auto_76738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76738 ) ( ON-TABLE ?auto_76729 ) ( ON ?auto_76730 ?auto_76729 ) ( not ( = ?auto_76729 ?auto_76730 ) ) ( not ( = ?auto_76729 ?auto_76731 ) ) ( not ( = ?auto_76729 ?auto_76732 ) ) ( not ( = ?auto_76729 ?auto_76733 ) ) ( not ( = ?auto_76729 ?auto_76734 ) ) ( not ( = ?auto_76729 ?auto_76735 ) ) ( not ( = ?auto_76729 ?auto_76736 ) ) ( not ( = ?auto_76729 ?auto_76737 ) ) ( not ( = ?auto_76729 ?auto_76738 ) ) ( not ( = ?auto_76730 ?auto_76731 ) ) ( not ( = ?auto_76730 ?auto_76732 ) ) ( not ( = ?auto_76730 ?auto_76733 ) ) ( not ( = ?auto_76730 ?auto_76734 ) ) ( not ( = ?auto_76730 ?auto_76735 ) ) ( not ( = ?auto_76730 ?auto_76736 ) ) ( not ( = ?auto_76730 ?auto_76737 ) ) ( not ( = ?auto_76730 ?auto_76738 ) ) ( not ( = ?auto_76731 ?auto_76732 ) ) ( not ( = ?auto_76731 ?auto_76733 ) ) ( not ( = ?auto_76731 ?auto_76734 ) ) ( not ( = ?auto_76731 ?auto_76735 ) ) ( not ( = ?auto_76731 ?auto_76736 ) ) ( not ( = ?auto_76731 ?auto_76737 ) ) ( not ( = ?auto_76731 ?auto_76738 ) ) ( not ( = ?auto_76732 ?auto_76733 ) ) ( not ( = ?auto_76732 ?auto_76734 ) ) ( not ( = ?auto_76732 ?auto_76735 ) ) ( not ( = ?auto_76732 ?auto_76736 ) ) ( not ( = ?auto_76732 ?auto_76737 ) ) ( not ( = ?auto_76732 ?auto_76738 ) ) ( not ( = ?auto_76733 ?auto_76734 ) ) ( not ( = ?auto_76733 ?auto_76735 ) ) ( not ( = ?auto_76733 ?auto_76736 ) ) ( not ( = ?auto_76733 ?auto_76737 ) ) ( not ( = ?auto_76733 ?auto_76738 ) ) ( not ( = ?auto_76734 ?auto_76735 ) ) ( not ( = ?auto_76734 ?auto_76736 ) ) ( not ( = ?auto_76734 ?auto_76737 ) ) ( not ( = ?auto_76734 ?auto_76738 ) ) ( not ( = ?auto_76735 ?auto_76736 ) ) ( not ( = ?auto_76735 ?auto_76737 ) ) ( not ( = ?auto_76735 ?auto_76738 ) ) ( not ( = ?auto_76736 ?auto_76737 ) ) ( not ( = ?auto_76736 ?auto_76738 ) ) ( not ( = ?auto_76737 ?auto_76738 ) ) ( ON ?auto_76737 ?auto_76738 ) ( ON ?auto_76736 ?auto_76737 ) ( ON ?auto_76735 ?auto_76736 ) ( ON ?auto_76734 ?auto_76735 ) ( ON ?auto_76733 ?auto_76734 ) ( ON ?auto_76732 ?auto_76733 ) ( CLEAR ?auto_76730 ) ( ON ?auto_76731 ?auto_76732 ) ( CLEAR ?auto_76731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76729 ?auto_76730 ?auto_76731 )
      ( MAKE-10PILE ?auto_76729 ?auto_76730 ?auto_76731 ?auto_76732 ?auto_76733 ?auto_76734 ?auto_76735 ?auto_76736 ?auto_76737 ?auto_76738 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76749 - BLOCK
      ?auto_76750 - BLOCK
      ?auto_76751 - BLOCK
      ?auto_76752 - BLOCK
      ?auto_76753 - BLOCK
      ?auto_76754 - BLOCK
      ?auto_76755 - BLOCK
      ?auto_76756 - BLOCK
      ?auto_76757 - BLOCK
      ?auto_76758 - BLOCK
    )
    :vars
    (
      ?auto_76759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76758 ?auto_76759 ) ( ON-TABLE ?auto_76749 ) ( not ( = ?auto_76749 ?auto_76750 ) ) ( not ( = ?auto_76749 ?auto_76751 ) ) ( not ( = ?auto_76749 ?auto_76752 ) ) ( not ( = ?auto_76749 ?auto_76753 ) ) ( not ( = ?auto_76749 ?auto_76754 ) ) ( not ( = ?auto_76749 ?auto_76755 ) ) ( not ( = ?auto_76749 ?auto_76756 ) ) ( not ( = ?auto_76749 ?auto_76757 ) ) ( not ( = ?auto_76749 ?auto_76758 ) ) ( not ( = ?auto_76749 ?auto_76759 ) ) ( not ( = ?auto_76750 ?auto_76751 ) ) ( not ( = ?auto_76750 ?auto_76752 ) ) ( not ( = ?auto_76750 ?auto_76753 ) ) ( not ( = ?auto_76750 ?auto_76754 ) ) ( not ( = ?auto_76750 ?auto_76755 ) ) ( not ( = ?auto_76750 ?auto_76756 ) ) ( not ( = ?auto_76750 ?auto_76757 ) ) ( not ( = ?auto_76750 ?auto_76758 ) ) ( not ( = ?auto_76750 ?auto_76759 ) ) ( not ( = ?auto_76751 ?auto_76752 ) ) ( not ( = ?auto_76751 ?auto_76753 ) ) ( not ( = ?auto_76751 ?auto_76754 ) ) ( not ( = ?auto_76751 ?auto_76755 ) ) ( not ( = ?auto_76751 ?auto_76756 ) ) ( not ( = ?auto_76751 ?auto_76757 ) ) ( not ( = ?auto_76751 ?auto_76758 ) ) ( not ( = ?auto_76751 ?auto_76759 ) ) ( not ( = ?auto_76752 ?auto_76753 ) ) ( not ( = ?auto_76752 ?auto_76754 ) ) ( not ( = ?auto_76752 ?auto_76755 ) ) ( not ( = ?auto_76752 ?auto_76756 ) ) ( not ( = ?auto_76752 ?auto_76757 ) ) ( not ( = ?auto_76752 ?auto_76758 ) ) ( not ( = ?auto_76752 ?auto_76759 ) ) ( not ( = ?auto_76753 ?auto_76754 ) ) ( not ( = ?auto_76753 ?auto_76755 ) ) ( not ( = ?auto_76753 ?auto_76756 ) ) ( not ( = ?auto_76753 ?auto_76757 ) ) ( not ( = ?auto_76753 ?auto_76758 ) ) ( not ( = ?auto_76753 ?auto_76759 ) ) ( not ( = ?auto_76754 ?auto_76755 ) ) ( not ( = ?auto_76754 ?auto_76756 ) ) ( not ( = ?auto_76754 ?auto_76757 ) ) ( not ( = ?auto_76754 ?auto_76758 ) ) ( not ( = ?auto_76754 ?auto_76759 ) ) ( not ( = ?auto_76755 ?auto_76756 ) ) ( not ( = ?auto_76755 ?auto_76757 ) ) ( not ( = ?auto_76755 ?auto_76758 ) ) ( not ( = ?auto_76755 ?auto_76759 ) ) ( not ( = ?auto_76756 ?auto_76757 ) ) ( not ( = ?auto_76756 ?auto_76758 ) ) ( not ( = ?auto_76756 ?auto_76759 ) ) ( not ( = ?auto_76757 ?auto_76758 ) ) ( not ( = ?auto_76757 ?auto_76759 ) ) ( not ( = ?auto_76758 ?auto_76759 ) ) ( ON ?auto_76757 ?auto_76758 ) ( ON ?auto_76756 ?auto_76757 ) ( ON ?auto_76755 ?auto_76756 ) ( ON ?auto_76754 ?auto_76755 ) ( ON ?auto_76753 ?auto_76754 ) ( ON ?auto_76752 ?auto_76753 ) ( ON ?auto_76751 ?auto_76752 ) ( CLEAR ?auto_76749 ) ( ON ?auto_76750 ?auto_76751 ) ( CLEAR ?auto_76750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76749 ?auto_76750 )
      ( MAKE-10PILE ?auto_76749 ?auto_76750 ?auto_76751 ?auto_76752 ?auto_76753 ?auto_76754 ?auto_76755 ?auto_76756 ?auto_76757 ?auto_76758 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76770 - BLOCK
      ?auto_76771 - BLOCK
      ?auto_76772 - BLOCK
      ?auto_76773 - BLOCK
      ?auto_76774 - BLOCK
      ?auto_76775 - BLOCK
      ?auto_76776 - BLOCK
      ?auto_76777 - BLOCK
      ?auto_76778 - BLOCK
      ?auto_76779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76779 ) ( ON-TABLE ?auto_76770 ) ( not ( = ?auto_76770 ?auto_76771 ) ) ( not ( = ?auto_76770 ?auto_76772 ) ) ( not ( = ?auto_76770 ?auto_76773 ) ) ( not ( = ?auto_76770 ?auto_76774 ) ) ( not ( = ?auto_76770 ?auto_76775 ) ) ( not ( = ?auto_76770 ?auto_76776 ) ) ( not ( = ?auto_76770 ?auto_76777 ) ) ( not ( = ?auto_76770 ?auto_76778 ) ) ( not ( = ?auto_76770 ?auto_76779 ) ) ( not ( = ?auto_76771 ?auto_76772 ) ) ( not ( = ?auto_76771 ?auto_76773 ) ) ( not ( = ?auto_76771 ?auto_76774 ) ) ( not ( = ?auto_76771 ?auto_76775 ) ) ( not ( = ?auto_76771 ?auto_76776 ) ) ( not ( = ?auto_76771 ?auto_76777 ) ) ( not ( = ?auto_76771 ?auto_76778 ) ) ( not ( = ?auto_76771 ?auto_76779 ) ) ( not ( = ?auto_76772 ?auto_76773 ) ) ( not ( = ?auto_76772 ?auto_76774 ) ) ( not ( = ?auto_76772 ?auto_76775 ) ) ( not ( = ?auto_76772 ?auto_76776 ) ) ( not ( = ?auto_76772 ?auto_76777 ) ) ( not ( = ?auto_76772 ?auto_76778 ) ) ( not ( = ?auto_76772 ?auto_76779 ) ) ( not ( = ?auto_76773 ?auto_76774 ) ) ( not ( = ?auto_76773 ?auto_76775 ) ) ( not ( = ?auto_76773 ?auto_76776 ) ) ( not ( = ?auto_76773 ?auto_76777 ) ) ( not ( = ?auto_76773 ?auto_76778 ) ) ( not ( = ?auto_76773 ?auto_76779 ) ) ( not ( = ?auto_76774 ?auto_76775 ) ) ( not ( = ?auto_76774 ?auto_76776 ) ) ( not ( = ?auto_76774 ?auto_76777 ) ) ( not ( = ?auto_76774 ?auto_76778 ) ) ( not ( = ?auto_76774 ?auto_76779 ) ) ( not ( = ?auto_76775 ?auto_76776 ) ) ( not ( = ?auto_76775 ?auto_76777 ) ) ( not ( = ?auto_76775 ?auto_76778 ) ) ( not ( = ?auto_76775 ?auto_76779 ) ) ( not ( = ?auto_76776 ?auto_76777 ) ) ( not ( = ?auto_76776 ?auto_76778 ) ) ( not ( = ?auto_76776 ?auto_76779 ) ) ( not ( = ?auto_76777 ?auto_76778 ) ) ( not ( = ?auto_76777 ?auto_76779 ) ) ( not ( = ?auto_76778 ?auto_76779 ) ) ( ON ?auto_76778 ?auto_76779 ) ( ON ?auto_76777 ?auto_76778 ) ( ON ?auto_76776 ?auto_76777 ) ( ON ?auto_76775 ?auto_76776 ) ( ON ?auto_76774 ?auto_76775 ) ( ON ?auto_76773 ?auto_76774 ) ( ON ?auto_76772 ?auto_76773 ) ( CLEAR ?auto_76770 ) ( ON ?auto_76771 ?auto_76772 ) ( CLEAR ?auto_76771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76770 ?auto_76771 )
      ( MAKE-10PILE ?auto_76770 ?auto_76771 ?auto_76772 ?auto_76773 ?auto_76774 ?auto_76775 ?auto_76776 ?auto_76777 ?auto_76778 ?auto_76779 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76790 - BLOCK
      ?auto_76791 - BLOCK
      ?auto_76792 - BLOCK
      ?auto_76793 - BLOCK
      ?auto_76794 - BLOCK
      ?auto_76795 - BLOCK
      ?auto_76796 - BLOCK
      ?auto_76797 - BLOCK
      ?auto_76798 - BLOCK
      ?auto_76799 - BLOCK
    )
    :vars
    (
      ?auto_76800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76799 ?auto_76800 ) ( not ( = ?auto_76790 ?auto_76791 ) ) ( not ( = ?auto_76790 ?auto_76792 ) ) ( not ( = ?auto_76790 ?auto_76793 ) ) ( not ( = ?auto_76790 ?auto_76794 ) ) ( not ( = ?auto_76790 ?auto_76795 ) ) ( not ( = ?auto_76790 ?auto_76796 ) ) ( not ( = ?auto_76790 ?auto_76797 ) ) ( not ( = ?auto_76790 ?auto_76798 ) ) ( not ( = ?auto_76790 ?auto_76799 ) ) ( not ( = ?auto_76790 ?auto_76800 ) ) ( not ( = ?auto_76791 ?auto_76792 ) ) ( not ( = ?auto_76791 ?auto_76793 ) ) ( not ( = ?auto_76791 ?auto_76794 ) ) ( not ( = ?auto_76791 ?auto_76795 ) ) ( not ( = ?auto_76791 ?auto_76796 ) ) ( not ( = ?auto_76791 ?auto_76797 ) ) ( not ( = ?auto_76791 ?auto_76798 ) ) ( not ( = ?auto_76791 ?auto_76799 ) ) ( not ( = ?auto_76791 ?auto_76800 ) ) ( not ( = ?auto_76792 ?auto_76793 ) ) ( not ( = ?auto_76792 ?auto_76794 ) ) ( not ( = ?auto_76792 ?auto_76795 ) ) ( not ( = ?auto_76792 ?auto_76796 ) ) ( not ( = ?auto_76792 ?auto_76797 ) ) ( not ( = ?auto_76792 ?auto_76798 ) ) ( not ( = ?auto_76792 ?auto_76799 ) ) ( not ( = ?auto_76792 ?auto_76800 ) ) ( not ( = ?auto_76793 ?auto_76794 ) ) ( not ( = ?auto_76793 ?auto_76795 ) ) ( not ( = ?auto_76793 ?auto_76796 ) ) ( not ( = ?auto_76793 ?auto_76797 ) ) ( not ( = ?auto_76793 ?auto_76798 ) ) ( not ( = ?auto_76793 ?auto_76799 ) ) ( not ( = ?auto_76793 ?auto_76800 ) ) ( not ( = ?auto_76794 ?auto_76795 ) ) ( not ( = ?auto_76794 ?auto_76796 ) ) ( not ( = ?auto_76794 ?auto_76797 ) ) ( not ( = ?auto_76794 ?auto_76798 ) ) ( not ( = ?auto_76794 ?auto_76799 ) ) ( not ( = ?auto_76794 ?auto_76800 ) ) ( not ( = ?auto_76795 ?auto_76796 ) ) ( not ( = ?auto_76795 ?auto_76797 ) ) ( not ( = ?auto_76795 ?auto_76798 ) ) ( not ( = ?auto_76795 ?auto_76799 ) ) ( not ( = ?auto_76795 ?auto_76800 ) ) ( not ( = ?auto_76796 ?auto_76797 ) ) ( not ( = ?auto_76796 ?auto_76798 ) ) ( not ( = ?auto_76796 ?auto_76799 ) ) ( not ( = ?auto_76796 ?auto_76800 ) ) ( not ( = ?auto_76797 ?auto_76798 ) ) ( not ( = ?auto_76797 ?auto_76799 ) ) ( not ( = ?auto_76797 ?auto_76800 ) ) ( not ( = ?auto_76798 ?auto_76799 ) ) ( not ( = ?auto_76798 ?auto_76800 ) ) ( not ( = ?auto_76799 ?auto_76800 ) ) ( ON ?auto_76798 ?auto_76799 ) ( ON ?auto_76797 ?auto_76798 ) ( ON ?auto_76796 ?auto_76797 ) ( ON ?auto_76795 ?auto_76796 ) ( ON ?auto_76794 ?auto_76795 ) ( ON ?auto_76793 ?auto_76794 ) ( ON ?auto_76792 ?auto_76793 ) ( ON ?auto_76791 ?auto_76792 ) ( ON ?auto_76790 ?auto_76791 ) ( CLEAR ?auto_76790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76790 )
      ( MAKE-10PILE ?auto_76790 ?auto_76791 ?auto_76792 ?auto_76793 ?auto_76794 ?auto_76795 ?auto_76796 ?auto_76797 ?auto_76798 ?auto_76799 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76811 - BLOCK
      ?auto_76812 - BLOCK
      ?auto_76813 - BLOCK
      ?auto_76814 - BLOCK
      ?auto_76815 - BLOCK
      ?auto_76816 - BLOCK
      ?auto_76817 - BLOCK
      ?auto_76818 - BLOCK
      ?auto_76819 - BLOCK
      ?auto_76820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76820 ) ( not ( = ?auto_76811 ?auto_76812 ) ) ( not ( = ?auto_76811 ?auto_76813 ) ) ( not ( = ?auto_76811 ?auto_76814 ) ) ( not ( = ?auto_76811 ?auto_76815 ) ) ( not ( = ?auto_76811 ?auto_76816 ) ) ( not ( = ?auto_76811 ?auto_76817 ) ) ( not ( = ?auto_76811 ?auto_76818 ) ) ( not ( = ?auto_76811 ?auto_76819 ) ) ( not ( = ?auto_76811 ?auto_76820 ) ) ( not ( = ?auto_76812 ?auto_76813 ) ) ( not ( = ?auto_76812 ?auto_76814 ) ) ( not ( = ?auto_76812 ?auto_76815 ) ) ( not ( = ?auto_76812 ?auto_76816 ) ) ( not ( = ?auto_76812 ?auto_76817 ) ) ( not ( = ?auto_76812 ?auto_76818 ) ) ( not ( = ?auto_76812 ?auto_76819 ) ) ( not ( = ?auto_76812 ?auto_76820 ) ) ( not ( = ?auto_76813 ?auto_76814 ) ) ( not ( = ?auto_76813 ?auto_76815 ) ) ( not ( = ?auto_76813 ?auto_76816 ) ) ( not ( = ?auto_76813 ?auto_76817 ) ) ( not ( = ?auto_76813 ?auto_76818 ) ) ( not ( = ?auto_76813 ?auto_76819 ) ) ( not ( = ?auto_76813 ?auto_76820 ) ) ( not ( = ?auto_76814 ?auto_76815 ) ) ( not ( = ?auto_76814 ?auto_76816 ) ) ( not ( = ?auto_76814 ?auto_76817 ) ) ( not ( = ?auto_76814 ?auto_76818 ) ) ( not ( = ?auto_76814 ?auto_76819 ) ) ( not ( = ?auto_76814 ?auto_76820 ) ) ( not ( = ?auto_76815 ?auto_76816 ) ) ( not ( = ?auto_76815 ?auto_76817 ) ) ( not ( = ?auto_76815 ?auto_76818 ) ) ( not ( = ?auto_76815 ?auto_76819 ) ) ( not ( = ?auto_76815 ?auto_76820 ) ) ( not ( = ?auto_76816 ?auto_76817 ) ) ( not ( = ?auto_76816 ?auto_76818 ) ) ( not ( = ?auto_76816 ?auto_76819 ) ) ( not ( = ?auto_76816 ?auto_76820 ) ) ( not ( = ?auto_76817 ?auto_76818 ) ) ( not ( = ?auto_76817 ?auto_76819 ) ) ( not ( = ?auto_76817 ?auto_76820 ) ) ( not ( = ?auto_76818 ?auto_76819 ) ) ( not ( = ?auto_76818 ?auto_76820 ) ) ( not ( = ?auto_76819 ?auto_76820 ) ) ( ON ?auto_76819 ?auto_76820 ) ( ON ?auto_76818 ?auto_76819 ) ( ON ?auto_76817 ?auto_76818 ) ( ON ?auto_76816 ?auto_76817 ) ( ON ?auto_76815 ?auto_76816 ) ( ON ?auto_76814 ?auto_76815 ) ( ON ?auto_76813 ?auto_76814 ) ( ON ?auto_76812 ?auto_76813 ) ( ON ?auto_76811 ?auto_76812 ) ( CLEAR ?auto_76811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76811 )
      ( MAKE-10PILE ?auto_76811 ?auto_76812 ?auto_76813 ?auto_76814 ?auto_76815 ?auto_76816 ?auto_76817 ?auto_76818 ?auto_76819 ?auto_76820 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_76831 - BLOCK
      ?auto_76832 - BLOCK
      ?auto_76833 - BLOCK
      ?auto_76834 - BLOCK
      ?auto_76835 - BLOCK
      ?auto_76836 - BLOCK
      ?auto_76837 - BLOCK
      ?auto_76838 - BLOCK
      ?auto_76839 - BLOCK
      ?auto_76840 - BLOCK
    )
    :vars
    (
      ?auto_76841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76831 ?auto_76832 ) ) ( not ( = ?auto_76831 ?auto_76833 ) ) ( not ( = ?auto_76831 ?auto_76834 ) ) ( not ( = ?auto_76831 ?auto_76835 ) ) ( not ( = ?auto_76831 ?auto_76836 ) ) ( not ( = ?auto_76831 ?auto_76837 ) ) ( not ( = ?auto_76831 ?auto_76838 ) ) ( not ( = ?auto_76831 ?auto_76839 ) ) ( not ( = ?auto_76831 ?auto_76840 ) ) ( not ( = ?auto_76832 ?auto_76833 ) ) ( not ( = ?auto_76832 ?auto_76834 ) ) ( not ( = ?auto_76832 ?auto_76835 ) ) ( not ( = ?auto_76832 ?auto_76836 ) ) ( not ( = ?auto_76832 ?auto_76837 ) ) ( not ( = ?auto_76832 ?auto_76838 ) ) ( not ( = ?auto_76832 ?auto_76839 ) ) ( not ( = ?auto_76832 ?auto_76840 ) ) ( not ( = ?auto_76833 ?auto_76834 ) ) ( not ( = ?auto_76833 ?auto_76835 ) ) ( not ( = ?auto_76833 ?auto_76836 ) ) ( not ( = ?auto_76833 ?auto_76837 ) ) ( not ( = ?auto_76833 ?auto_76838 ) ) ( not ( = ?auto_76833 ?auto_76839 ) ) ( not ( = ?auto_76833 ?auto_76840 ) ) ( not ( = ?auto_76834 ?auto_76835 ) ) ( not ( = ?auto_76834 ?auto_76836 ) ) ( not ( = ?auto_76834 ?auto_76837 ) ) ( not ( = ?auto_76834 ?auto_76838 ) ) ( not ( = ?auto_76834 ?auto_76839 ) ) ( not ( = ?auto_76834 ?auto_76840 ) ) ( not ( = ?auto_76835 ?auto_76836 ) ) ( not ( = ?auto_76835 ?auto_76837 ) ) ( not ( = ?auto_76835 ?auto_76838 ) ) ( not ( = ?auto_76835 ?auto_76839 ) ) ( not ( = ?auto_76835 ?auto_76840 ) ) ( not ( = ?auto_76836 ?auto_76837 ) ) ( not ( = ?auto_76836 ?auto_76838 ) ) ( not ( = ?auto_76836 ?auto_76839 ) ) ( not ( = ?auto_76836 ?auto_76840 ) ) ( not ( = ?auto_76837 ?auto_76838 ) ) ( not ( = ?auto_76837 ?auto_76839 ) ) ( not ( = ?auto_76837 ?auto_76840 ) ) ( not ( = ?auto_76838 ?auto_76839 ) ) ( not ( = ?auto_76838 ?auto_76840 ) ) ( not ( = ?auto_76839 ?auto_76840 ) ) ( ON ?auto_76831 ?auto_76841 ) ( not ( = ?auto_76840 ?auto_76841 ) ) ( not ( = ?auto_76839 ?auto_76841 ) ) ( not ( = ?auto_76838 ?auto_76841 ) ) ( not ( = ?auto_76837 ?auto_76841 ) ) ( not ( = ?auto_76836 ?auto_76841 ) ) ( not ( = ?auto_76835 ?auto_76841 ) ) ( not ( = ?auto_76834 ?auto_76841 ) ) ( not ( = ?auto_76833 ?auto_76841 ) ) ( not ( = ?auto_76832 ?auto_76841 ) ) ( not ( = ?auto_76831 ?auto_76841 ) ) ( ON ?auto_76832 ?auto_76831 ) ( ON ?auto_76833 ?auto_76832 ) ( ON ?auto_76834 ?auto_76833 ) ( ON ?auto_76835 ?auto_76834 ) ( ON ?auto_76836 ?auto_76835 ) ( ON ?auto_76837 ?auto_76836 ) ( ON ?auto_76838 ?auto_76837 ) ( ON ?auto_76839 ?auto_76838 ) ( ON ?auto_76840 ?auto_76839 ) ( CLEAR ?auto_76840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_76840 ?auto_76839 ?auto_76838 ?auto_76837 ?auto_76836 ?auto_76835 ?auto_76834 ?auto_76833 ?auto_76832 ?auto_76831 )
      ( MAKE-10PILE ?auto_76831 ?auto_76832 ?auto_76833 ?auto_76834 ?auto_76835 ?auto_76836 ?auto_76837 ?auto_76838 ?auto_76839 ?auto_76840 ) )
  )

)

