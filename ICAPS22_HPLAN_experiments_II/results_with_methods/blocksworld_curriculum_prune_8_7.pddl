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
      ?auto_37060 - BLOCK
    )
    :vars
    (
      ?auto_37061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37060 ?auto_37061 ) ( CLEAR ?auto_37060 ) ( HAND-EMPTY ) ( not ( = ?auto_37060 ?auto_37061 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37060 ?auto_37061 )
      ( !PUTDOWN ?auto_37060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37067 - BLOCK
      ?auto_37068 - BLOCK
    )
    :vars
    (
      ?auto_37069 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37067 ) ( ON ?auto_37068 ?auto_37069 ) ( CLEAR ?auto_37068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37067 ) ( not ( = ?auto_37067 ?auto_37068 ) ) ( not ( = ?auto_37067 ?auto_37069 ) ) ( not ( = ?auto_37068 ?auto_37069 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37068 ?auto_37069 )
      ( !STACK ?auto_37068 ?auto_37067 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37077 - BLOCK
      ?auto_37078 - BLOCK
    )
    :vars
    (
      ?auto_37079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37078 ?auto_37079 ) ( not ( = ?auto_37077 ?auto_37078 ) ) ( not ( = ?auto_37077 ?auto_37079 ) ) ( not ( = ?auto_37078 ?auto_37079 ) ) ( ON ?auto_37077 ?auto_37078 ) ( CLEAR ?auto_37077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37077 )
      ( MAKE-2PILE ?auto_37077 ?auto_37078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37088 - BLOCK
      ?auto_37089 - BLOCK
      ?auto_37090 - BLOCK
    )
    :vars
    (
      ?auto_37091 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37089 ) ( ON ?auto_37090 ?auto_37091 ) ( CLEAR ?auto_37090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37088 ) ( ON ?auto_37089 ?auto_37088 ) ( not ( = ?auto_37088 ?auto_37089 ) ) ( not ( = ?auto_37088 ?auto_37090 ) ) ( not ( = ?auto_37088 ?auto_37091 ) ) ( not ( = ?auto_37089 ?auto_37090 ) ) ( not ( = ?auto_37089 ?auto_37091 ) ) ( not ( = ?auto_37090 ?auto_37091 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37090 ?auto_37091 )
      ( !STACK ?auto_37090 ?auto_37089 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37102 - BLOCK
      ?auto_37103 - BLOCK
      ?auto_37104 - BLOCK
    )
    :vars
    (
      ?auto_37105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37104 ?auto_37105 ) ( ON-TABLE ?auto_37102 ) ( not ( = ?auto_37102 ?auto_37103 ) ) ( not ( = ?auto_37102 ?auto_37104 ) ) ( not ( = ?auto_37102 ?auto_37105 ) ) ( not ( = ?auto_37103 ?auto_37104 ) ) ( not ( = ?auto_37103 ?auto_37105 ) ) ( not ( = ?auto_37104 ?auto_37105 ) ) ( CLEAR ?auto_37102 ) ( ON ?auto_37103 ?auto_37104 ) ( CLEAR ?auto_37103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37102 ?auto_37103 )
      ( MAKE-3PILE ?auto_37102 ?auto_37103 ?auto_37104 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37116 - BLOCK
      ?auto_37117 - BLOCK
      ?auto_37118 - BLOCK
    )
    :vars
    (
      ?auto_37119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37118 ?auto_37119 ) ( not ( = ?auto_37116 ?auto_37117 ) ) ( not ( = ?auto_37116 ?auto_37118 ) ) ( not ( = ?auto_37116 ?auto_37119 ) ) ( not ( = ?auto_37117 ?auto_37118 ) ) ( not ( = ?auto_37117 ?auto_37119 ) ) ( not ( = ?auto_37118 ?auto_37119 ) ) ( ON ?auto_37117 ?auto_37118 ) ( ON ?auto_37116 ?auto_37117 ) ( CLEAR ?auto_37116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37116 )
      ( MAKE-3PILE ?auto_37116 ?auto_37117 ?auto_37118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37131 - BLOCK
      ?auto_37132 - BLOCK
      ?auto_37133 - BLOCK
      ?auto_37134 - BLOCK
    )
    :vars
    (
      ?auto_37135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37133 ) ( ON ?auto_37134 ?auto_37135 ) ( CLEAR ?auto_37134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37131 ) ( ON ?auto_37132 ?auto_37131 ) ( ON ?auto_37133 ?auto_37132 ) ( not ( = ?auto_37131 ?auto_37132 ) ) ( not ( = ?auto_37131 ?auto_37133 ) ) ( not ( = ?auto_37131 ?auto_37134 ) ) ( not ( = ?auto_37131 ?auto_37135 ) ) ( not ( = ?auto_37132 ?auto_37133 ) ) ( not ( = ?auto_37132 ?auto_37134 ) ) ( not ( = ?auto_37132 ?auto_37135 ) ) ( not ( = ?auto_37133 ?auto_37134 ) ) ( not ( = ?auto_37133 ?auto_37135 ) ) ( not ( = ?auto_37134 ?auto_37135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37134 ?auto_37135 )
      ( !STACK ?auto_37134 ?auto_37133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37149 - BLOCK
      ?auto_37150 - BLOCK
      ?auto_37151 - BLOCK
      ?auto_37152 - BLOCK
    )
    :vars
    (
      ?auto_37153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37152 ?auto_37153 ) ( ON-TABLE ?auto_37149 ) ( ON ?auto_37150 ?auto_37149 ) ( not ( = ?auto_37149 ?auto_37150 ) ) ( not ( = ?auto_37149 ?auto_37151 ) ) ( not ( = ?auto_37149 ?auto_37152 ) ) ( not ( = ?auto_37149 ?auto_37153 ) ) ( not ( = ?auto_37150 ?auto_37151 ) ) ( not ( = ?auto_37150 ?auto_37152 ) ) ( not ( = ?auto_37150 ?auto_37153 ) ) ( not ( = ?auto_37151 ?auto_37152 ) ) ( not ( = ?auto_37151 ?auto_37153 ) ) ( not ( = ?auto_37152 ?auto_37153 ) ) ( CLEAR ?auto_37150 ) ( ON ?auto_37151 ?auto_37152 ) ( CLEAR ?auto_37151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37149 ?auto_37150 ?auto_37151 )
      ( MAKE-4PILE ?auto_37149 ?auto_37150 ?auto_37151 ?auto_37152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37167 - BLOCK
      ?auto_37168 - BLOCK
      ?auto_37169 - BLOCK
      ?auto_37170 - BLOCK
    )
    :vars
    (
      ?auto_37171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37170 ?auto_37171 ) ( ON-TABLE ?auto_37167 ) ( not ( = ?auto_37167 ?auto_37168 ) ) ( not ( = ?auto_37167 ?auto_37169 ) ) ( not ( = ?auto_37167 ?auto_37170 ) ) ( not ( = ?auto_37167 ?auto_37171 ) ) ( not ( = ?auto_37168 ?auto_37169 ) ) ( not ( = ?auto_37168 ?auto_37170 ) ) ( not ( = ?auto_37168 ?auto_37171 ) ) ( not ( = ?auto_37169 ?auto_37170 ) ) ( not ( = ?auto_37169 ?auto_37171 ) ) ( not ( = ?auto_37170 ?auto_37171 ) ) ( ON ?auto_37169 ?auto_37170 ) ( CLEAR ?auto_37167 ) ( ON ?auto_37168 ?auto_37169 ) ( CLEAR ?auto_37168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37167 ?auto_37168 )
      ( MAKE-4PILE ?auto_37167 ?auto_37168 ?auto_37169 ?auto_37170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37185 - BLOCK
      ?auto_37186 - BLOCK
      ?auto_37187 - BLOCK
      ?auto_37188 - BLOCK
    )
    :vars
    (
      ?auto_37189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37188 ?auto_37189 ) ( not ( = ?auto_37185 ?auto_37186 ) ) ( not ( = ?auto_37185 ?auto_37187 ) ) ( not ( = ?auto_37185 ?auto_37188 ) ) ( not ( = ?auto_37185 ?auto_37189 ) ) ( not ( = ?auto_37186 ?auto_37187 ) ) ( not ( = ?auto_37186 ?auto_37188 ) ) ( not ( = ?auto_37186 ?auto_37189 ) ) ( not ( = ?auto_37187 ?auto_37188 ) ) ( not ( = ?auto_37187 ?auto_37189 ) ) ( not ( = ?auto_37188 ?auto_37189 ) ) ( ON ?auto_37187 ?auto_37188 ) ( ON ?auto_37186 ?auto_37187 ) ( ON ?auto_37185 ?auto_37186 ) ( CLEAR ?auto_37185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37185 )
      ( MAKE-4PILE ?auto_37185 ?auto_37186 ?auto_37187 ?auto_37188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37204 - BLOCK
      ?auto_37205 - BLOCK
      ?auto_37206 - BLOCK
      ?auto_37207 - BLOCK
      ?auto_37208 - BLOCK
    )
    :vars
    (
      ?auto_37209 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37207 ) ( ON ?auto_37208 ?auto_37209 ) ( CLEAR ?auto_37208 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37204 ) ( ON ?auto_37205 ?auto_37204 ) ( ON ?auto_37206 ?auto_37205 ) ( ON ?auto_37207 ?auto_37206 ) ( not ( = ?auto_37204 ?auto_37205 ) ) ( not ( = ?auto_37204 ?auto_37206 ) ) ( not ( = ?auto_37204 ?auto_37207 ) ) ( not ( = ?auto_37204 ?auto_37208 ) ) ( not ( = ?auto_37204 ?auto_37209 ) ) ( not ( = ?auto_37205 ?auto_37206 ) ) ( not ( = ?auto_37205 ?auto_37207 ) ) ( not ( = ?auto_37205 ?auto_37208 ) ) ( not ( = ?auto_37205 ?auto_37209 ) ) ( not ( = ?auto_37206 ?auto_37207 ) ) ( not ( = ?auto_37206 ?auto_37208 ) ) ( not ( = ?auto_37206 ?auto_37209 ) ) ( not ( = ?auto_37207 ?auto_37208 ) ) ( not ( = ?auto_37207 ?auto_37209 ) ) ( not ( = ?auto_37208 ?auto_37209 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37208 ?auto_37209 )
      ( !STACK ?auto_37208 ?auto_37207 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37226 - BLOCK
      ?auto_37227 - BLOCK
      ?auto_37228 - BLOCK
      ?auto_37229 - BLOCK
      ?auto_37230 - BLOCK
    )
    :vars
    (
      ?auto_37231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37230 ?auto_37231 ) ( ON-TABLE ?auto_37226 ) ( ON ?auto_37227 ?auto_37226 ) ( ON ?auto_37228 ?auto_37227 ) ( not ( = ?auto_37226 ?auto_37227 ) ) ( not ( = ?auto_37226 ?auto_37228 ) ) ( not ( = ?auto_37226 ?auto_37229 ) ) ( not ( = ?auto_37226 ?auto_37230 ) ) ( not ( = ?auto_37226 ?auto_37231 ) ) ( not ( = ?auto_37227 ?auto_37228 ) ) ( not ( = ?auto_37227 ?auto_37229 ) ) ( not ( = ?auto_37227 ?auto_37230 ) ) ( not ( = ?auto_37227 ?auto_37231 ) ) ( not ( = ?auto_37228 ?auto_37229 ) ) ( not ( = ?auto_37228 ?auto_37230 ) ) ( not ( = ?auto_37228 ?auto_37231 ) ) ( not ( = ?auto_37229 ?auto_37230 ) ) ( not ( = ?auto_37229 ?auto_37231 ) ) ( not ( = ?auto_37230 ?auto_37231 ) ) ( CLEAR ?auto_37228 ) ( ON ?auto_37229 ?auto_37230 ) ( CLEAR ?auto_37229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37226 ?auto_37227 ?auto_37228 ?auto_37229 )
      ( MAKE-5PILE ?auto_37226 ?auto_37227 ?auto_37228 ?auto_37229 ?auto_37230 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37248 - BLOCK
      ?auto_37249 - BLOCK
      ?auto_37250 - BLOCK
      ?auto_37251 - BLOCK
      ?auto_37252 - BLOCK
    )
    :vars
    (
      ?auto_37253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37252 ?auto_37253 ) ( ON-TABLE ?auto_37248 ) ( ON ?auto_37249 ?auto_37248 ) ( not ( = ?auto_37248 ?auto_37249 ) ) ( not ( = ?auto_37248 ?auto_37250 ) ) ( not ( = ?auto_37248 ?auto_37251 ) ) ( not ( = ?auto_37248 ?auto_37252 ) ) ( not ( = ?auto_37248 ?auto_37253 ) ) ( not ( = ?auto_37249 ?auto_37250 ) ) ( not ( = ?auto_37249 ?auto_37251 ) ) ( not ( = ?auto_37249 ?auto_37252 ) ) ( not ( = ?auto_37249 ?auto_37253 ) ) ( not ( = ?auto_37250 ?auto_37251 ) ) ( not ( = ?auto_37250 ?auto_37252 ) ) ( not ( = ?auto_37250 ?auto_37253 ) ) ( not ( = ?auto_37251 ?auto_37252 ) ) ( not ( = ?auto_37251 ?auto_37253 ) ) ( not ( = ?auto_37252 ?auto_37253 ) ) ( ON ?auto_37251 ?auto_37252 ) ( CLEAR ?auto_37249 ) ( ON ?auto_37250 ?auto_37251 ) ( CLEAR ?auto_37250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37248 ?auto_37249 ?auto_37250 )
      ( MAKE-5PILE ?auto_37248 ?auto_37249 ?auto_37250 ?auto_37251 ?auto_37252 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37270 - BLOCK
      ?auto_37271 - BLOCK
      ?auto_37272 - BLOCK
      ?auto_37273 - BLOCK
      ?auto_37274 - BLOCK
    )
    :vars
    (
      ?auto_37275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37274 ?auto_37275 ) ( ON-TABLE ?auto_37270 ) ( not ( = ?auto_37270 ?auto_37271 ) ) ( not ( = ?auto_37270 ?auto_37272 ) ) ( not ( = ?auto_37270 ?auto_37273 ) ) ( not ( = ?auto_37270 ?auto_37274 ) ) ( not ( = ?auto_37270 ?auto_37275 ) ) ( not ( = ?auto_37271 ?auto_37272 ) ) ( not ( = ?auto_37271 ?auto_37273 ) ) ( not ( = ?auto_37271 ?auto_37274 ) ) ( not ( = ?auto_37271 ?auto_37275 ) ) ( not ( = ?auto_37272 ?auto_37273 ) ) ( not ( = ?auto_37272 ?auto_37274 ) ) ( not ( = ?auto_37272 ?auto_37275 ) ) ( not ( = ?auto_37273 ?auto_37274 ) ) ( not ( = ?auto_37273 ?auto_37275 ) ) ( not ( = ?auto_37274 ?auto_37275 ) ) ( ON ?auto_37273 ?auto_37274 ) ( ON ?auto_37272 ?auto_37273 ) ( CLEAR ?auto_37270 ) ( ON ?auto_37271 ?auto_37272 ) ( CLEAR ?auto_37271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37270 ?auto_37271 )
      ( MAKE-5PILE ?auto_37270 ?auto_37271 ?auto_37272 ?auto_37273 ?auto_37274 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37292 - BLOCK
      ?auto_37293 - BLOCK
      ?auto_37294 - BLOCK
      ?auto_37295 - BLOCK
      ?auto_37296 - BLOCK
    )
    :vars
    (
      ?auto_37297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37296 ?auto_37297 ) ( not ( = ?auto_37292 ?auto_37293 ) ) ( not ( = ?auto_37292 ?auto_37294 ) ) ( not ( = ?auto_37292 ?auto_37295 ) ) ( not ( = ?auto_37292 ?auto_37296 ) ) ( not ( = ?auto_37292 ?auto_37297 ) ) ( not ( = ?auto_37293 ?auto_37294 ) ) ( not ( = ?auto_37293 ?auto_37295 ) ) ( not ( = ?auto_37293 ?auto_37296 ) ) ( not ( = ?auto_37293 ?auto_37297 ) ) ( not ( = ?auto_37294 ?auto_37295 ) ) ( not ( = ?auto_37294 ?auto_37296 ) ) ( not ( = ?auto_37294 ?auto_37297 ) ) ( not ( = ?auto_37295 ?auto_37296 ) ) ( not ( = ?auto_37295 ?auto_37297 ) ) ( not ( = ?auto_37296 ?auto_37297 ) ) ( ON ?auto_37295 ?auto_37296 ) ( ON ?auto_37294 ?auto_37295 ) ( ON ?auto_37293 ?auto_37294 ) ( ON ?auto_37292 ?auto_37293 ) ( CLEAR ?auto_37292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37292 )
      ( MAKE-5PILE ?auto_37292 ?auto_37293 ?auto_37294 ?auto_37295 ?auto_37296 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37315 - BLOCK
      ?auto_37316 - BLOCK
      ?auto_37317 - BLOCK
      ?auto_37318 - BLOCK
      ?auto_37319 - BLOCK
      ?auto_37320 - BLOCK
    )
    :vars
    (
      ?auto_37321 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37319 ) ( ON ?auto_37320 ?auto_37321 ) ( CLEAR ?auto_37320 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37315 ) ( ON ?auto_37316 ?auto_37315 ) ( ON ?auto_37317 ?auto_37316 ) ( ON ?auto_37318 ?auto_37317 ) ( ON ?auto_37319 ?auto_37318 ) ( not ( = ?auto_37315 ?auto_37316 ) ) ( not ( = ?auto_37315 ?auto_37317 ) ) ( not ( = ?auto_37315 ?auto_37318 ) ) ( not ( = ?auto_37315 ?auto_37319 ) ) ( not ( = ?auto_37315 ?auto_37320 ) ) ( not ( = ?auto_37315 ?auto_37321 ) ) ( not ( = ?auto_37316 ?auto_37317 ) ) ( not ( = ?auto_37316 ?auto_37318 ) ) ( not ( = ?auto_37316 ?auto_37319 ) ) ( not ( = ?auto_37316 ?auto_37320 ) ) ( not ( = ?auto_37316 ?auto_37321 ) ) ( not ( = ?auto_37317 ?auto_37318 ) ) ( not ( = ?auto_37317 ?auto_37319 ) ) ( not ( = ?auto_37317 ?auto_37320 ) ) ( not ( = ?auto_37317 ?auto_37321 ) ) ( not ( = ?auto_37318 ?auto_37319 ) ) ( not ( = ?auto_37318 ?auto_37320 ) ) ( not ( = ?auto_37318 ?auto_37321 ) ) ( not ( = ?auto_37319 ?auto_37320 ) ) ( not ( = ?auto_37319 ?auto_37321 ) ) ( not ( = ?auto_37320 ?auto_37321 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37320 ?auto_37321 )
      ( !STACK ?auto_37320 ?auto_37319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37341 - BLOCK
      ?auto_37342 - BLOCK
      ?auto_37343 - BLOCK
      ?auto_37344 - BLOCK
      ?auto_37345 - BLOCK
      ?auto_37346 - BLOCK
    )
    :vars
    (
      ?auto_37347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37346 ?auto_37347 ) ( ON-TABLE ?auto_37341 ) ( ON ?auto_37342 ?auto_37341 ) ( ON ?auto_37343 ?auto_37342 ) ( ON ?auto_37344 ?auto_37343 ) ( not ( = ?auto_37341 ?auto_37342 ) ) ( not ( = ?auto_37341 ?auto_37343 ) ) ( not ( = ?auto_37341 ?auto_37344 ) ) ( not ( = ?auto_37341 ?auto_37345 ) ) ( not ( = ?auto_37341 ?auto_37346 ) ) ( not ( = ?auto_37341 ?auto_37347 ) ) ( not ( = ?auto_37342 ?auto_37343 ) ) ( not ( = ?auto_37342 ?auto_37344 ) ) ( not ( = ?auto_37342 ?auto_37345 ) ) ( not ( = ?auto_37342 ?auto_37346 ) ) ( not ( = ?auto_37342 ?auto_37347 ) ) ( not ( = ?auto_37343 ?auto_37344 ) ) ( not ( = ?auto_37343 ?auto_37345 ) ) ( not ( = ?auto_37343 ?auto_37346 ) ) ( not ( = ?auto_37343 ?auto_37347 ) ) ( not ( = ?auto_37344 ?auto_37345 ) ) ( not ( = ?auto_37344 ?auto_37346 ) ) ( not ( = ?auto_37344 ?auto_37347 ) ) ( not ( = ?auto_37345 ?auto_37346 ) ) ( not ( = ?auto_37345 ?auto_37347 ) ) ( not ( = ?auto_37346 ?auto_37347 ) ) ( CLEAR ?auto_37344 ) ( ON ?auto_37345 ?auto_37346 ) ( CLEAR ?auto_37345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37341 ?auto_37342 ?auto_37343 ?auto_37344 ?auto_37345 )
      ( MAKE-6PILE ?auto_37341 ?auto_37342 ?auto_37343 ?auto_37344 ?auto_37345 ?auto_37346 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37367 - BLOCK
      ?auto_37368 - BLOCK
      ?auto_37369 - BLOCK
      ?auto_37370 - BLOCK
      ?auto_37371 - BLOCK
      ?auto_37372 - BLOCK
    )
    :vars
    (
      ?auto_37373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37372 ?auto_37373 ) ( ON-TABLE ?auto_37367 ) ( ON ?auto_37368 ?auto_37367 ) ( ON ?auto_37369 ?auto_37368 ) ( not ( = ?auto_37367 ?auto_37368 ) ) ( not ( = ?auto_37367 ?auto_37369 ) ) ( not ( = ?auto_37367 ?auto_37370 ) ) ( not ( = ?auto_37367 ?auto_37371 ) ) ( not ( = ?auto_37367 ?auto_37372 ) ) ( not ( = ?auto_37367 ?auto_37373 ) ) ( not ( = ?auto_37368 ?auto_37369 ) ) ( not ( = ?auto_37368 ?auto_37370 ) ) ( not ( = ?auto_37368 ?auto_37371 ) ) ( not ( = ?auto_37368 ?auto_37372 ) ) ( not ( = ?auto_37368 ?auto_37373 ) ) ( not ( = ?auto_37369 ?auto_37370 ) ) ( not ( = ?auto_37369 ?auto_37371 ) ) ( not ( = ?auto_37369 ?auto_37372 ) ) ( not ( = ?auto_37369 ?auto_37373 ) ) ( not ( = ?auto_37370 ?auto_37371 ) ) ( not ( = ?auto_37370 ?auto_37372 ) ) ( not ( = ?auto_37370 ?auto_37373 ) ) ( not ( = ?auto_37371 ?auto_37372 ) ) ( not ( = ?auto_37371 ?auto_37373 ) ) ( not ( = ?auto_37372 ?auto_37373 ) ) ( ON ?auto_37371 ?auto_37372 ) ( CLEAR ?auto_37369 ) ( ON ?auto_37370 ?auto_37371 ) ( CLEAR ?auto_37370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37367 ?auto_37368 ?auto_37369 ?auto_37370 )
      ( MAKE-6PILE ?auto_37367 ?auto_37368 ?auto_37369 ?auto_37370 ?auto_37371 ?auto_37372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37393 - BLOCK
      ?auto_37394 - BLOCK
      ?auto_37395 - BLOCK
      ?auto_37396 - BLOCK
      ?auto_37397 - BLOCK
      ?auto_37398 - BLOCK
    )
    :vars
    (
      ?auto_37399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37398 ?auto_37399 ) ( ON-TABLE ?auto_37393 ) ( ON ?auto_37394 ?auto_37393 ) ( not ( = ?auto_37393 ?auto_37394 ) ) ( not ( = ?auto_37393 ?auto_37395 ) ) ( not ( = ?auto_37393 ?auto_37396 ) ) ( not ( = ?auto_37393 ?auto_37397 ) ) ( not ( = ?auto_37393 ?auto_37398 ) ) ( not ( = ?auto_37393 ?auto_37399 ) ) ( not ( = ?auto_37394 ?auto_37395 ) ) ( not ( = ?auto_37394 ?auto_37396 ) ) ( not ( = ?auto_37394 ?auto_37397 ) ) ( not ( = ?auto_37394 ?auto_37398 ) ) ( not ( = ?auto_37394 ?auto_37399 ) ) ( not ( = ?auto_37395 ?auto_37396 ) ) ( not ( = ?auto_37395 ?auto_37397 ) ) ( not ( = ?auto_37395 ?auto_37398 ) ) ( not ( = ?auto_37395 ?auto_37399 ) ) ( not ( = ?auto_37396 ?auto_37397 ) ) ( not ( = ?auto_37396 ?auto_37398 ) ) ( not ( = ?auto_37396 ?auto_37399 ) ) ( not ( = ?auto_37397 ?auto_37398 ) ) ( not ( = ?auto_37397 ?auto_37399 ) ) ( not ( = ?auto_37398 ?auto_37399 ) ) ( ON ?auto_37397 ?auto_37398 ) ( ON ?auto_37396 ?auto_37397 ) ( CLEAR ?auto_37394 ) ( ON ?auto_37395 ?auto_37396 ) ( CLEAR ?auto_37395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37393 ?auto_37394 ?auto_37395 )
      ( MAKE-6PILE ?auto_37393 ?auto_37394 ?auto_37395 ?auto_37396 ?auto_37397 ?auto_37398 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37419 - BLOCK
      ?auto_37420 - BLOCK
      ?auto_37421 - BLOCK
      ?auto_37422 - BLOCK
      ?auto_37423 - BLOCK
      ?auto_37424 - BLOCK
    )
    :vars
    (
      ?auto_37425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37424 ?auto_37425 ) ( ON-TABLE ?auto_37419 ) ( not ( = ?auto_37419 ?auto_37420 ) ) ( not ( = ?auto_37419 ?auto_37421 ) ) ( not ( = ?auto_37419 ?auto_37422 ) ) ( not ( = ?auto_37419 ?auto_37423 ) ) ( not ( = ?auto_37419 ?auto_37424 ) ) ( not ( = ?auto_37419 ?auto_37425 ) ) ( not ( = ?auto_37420 ?auto_37421 ) ) ( not ( = ?auto_37420 ?auto_37422 ) ) ( not ( = ?auto_37420 ?auto_37423 ) ) ( not ( = ?auto_37420 ?auto_37424 ) ) ( not ( = ?auto_37420 ?auto_37425 ) ) ( not ( = ?auto_37421 ?auto_37422 ) ) ( not ( = ?auto_37421 ?auto_37423 ) ) ( not ( = ?auto_37421 ?auto_37424 ) ) ( not ( = ?auto_37421 ?auto_37425 ) ) ( not ( = ?auto_37422 ?auto_37423 ) ) ( not ( = ?auto_37422 ?auto_37424 ) ) ( not ( = ?auto_37422 ?auto_37425 ) ) ( not ( = ?auto_37423 ?auto_37424 ) ) ( not ( = ?auto_37423 ?auto_37425 ) ) ( not ( = ?auto_37424 ?auto_37425 ) ) ( ON ?auto_37423 ?auto_37424 ) ( ON ?auto_37422 ?auto_37423 ) ( ON ?auto_37421 ?auto_37422 ) ( CLEAR ?auto_37419 ) ( ON ?auto_37420 ?auto_37421 ) ( CLEAR ?auto_37420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37419 ?auto_37420 )
      ( MAKE-6PILE ?auto_37419 ?auto_37420 ?auto_37421 ?auto_37422 ?auto_37423 ?auto_37424 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37445 - BLOCK
      ?auto_37446 - BLOCK
      ?auto_37447 - BLOCK
      ?auto_37448 - BLOCK
      ?auto_37449 - BLOCK
      ?auto_37450 - BLOCK
    )
    :vars
    (
      ?auto_37451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37450 ?auto_37451 ) ( not ( = ?auto_37445 ?auto_37446 ) ) ( not ( = ?auto_37445 ?auto_37447 ) ) ( not ( = ?auto_37445 ?auto_37448 ) ) ( not ( = ?auto_37445 ?auto_37449 ) ) ( not ( = ?auto_37445 ?auto_37450 ) ) ( not ( = ?auto_37445 ?auto_37451 ) ) ( not ( = ?auto_37446 ?auto_37447 ) ) ( not ( = ?auto_37446 ?auto_37448 ) ) ( not ( = ?auto_37446 ?auto_37449 ) ) ( not ( = ?auto_37446 ?auto_37450 ) ) ( not ( = ?auto_37446 ?auto_37451 ) ) ( not ( = ?auto_37447 ?auto_37448 ) ) ( not ( = ?auto_37447 ?auto_37449 ) ) ( not ( = ?auto_37447 ?auto_37450 ) ) ( not ( = ?auto_37447 ?auto_37451 ) ) ( not ( = ?auto_37448 ?auto_37449 ) ) ( not ( = ?auto_37448 ?auto_37450 ) ) ( not ( = ?auto_37448 ?auto_37451 ) ) ( not ( = ?auto_37449 ?auto_37450 ) ) ( not ( = ?auto_37449 ?auto_37451 ) ) ( not ( = ?auto_37450 ?auto_37451 ) ) ( ON ?auto_37449 ?auto_37450 ) ( ON ?auto_37448 ?auto_37449 ) ( ON ?auto_37447 ?auto_37448 ) ( ON ?auto_37446 ?auto_37447 ) ( ON ?auto_37445 ?auto_37446 ) ( CLEAR ?auto_37445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37445 )
      ( MAKE-6PILE ?auto_37445 ?auto_37446 ?auto_37447 ?auto_37448 ?auto_37449 ?auto_37450 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_37472 - BLOCK
      ?auto_37473 - BLOCK
      ?auto_37474 - BLOCK
      ?auto_37475 - BLOCK
      ?auto_37476 - BLOCK
      ?auto_37477 - BLOCK
      ?auto_37478 - BLOCK
    )
    :vars
    (
      ?auto_37479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37477 ) ( ON ?auto_37478 ?auto_37479 ) ( CLEAR ?auto_37478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37472 ) ( ON ?auto_37473 ?auto_37472 ) ( ON ?auto_37474 ?auto_37473 ) ( ON ?auto_37475 ?auto_37474 ) ( ON ?auto_37476 ?auto_37475 ) ( ON ?auto_37477 ?auto_37476 ) ( not ( = ?auto_37472 ?auto_37473 ) ) ( not ( = ?auto_37472 ?auto_37474 ) ) ( not ( = ?auto_37472 ?auto_37475 ) ) ( not ( = ?auto_37472 ?auto_37476 ) ) ( not ( = ?auto_37472 ?auto_37477 ) ) ( not ( = ?auto_37472 ?auto_37478 ) ) ( not ( = ?auto_37472 ?auto_37479 ) ) ( not ( = ?auto_37473 ?auto_37474 ) ) ( not ( = ?auto_37473 ?auto_37475 ) ) ( not ( = ?auto_37473 ?auto_37476 ) ) ( not ( = ?auto_37473 ?auto_37477 ) ) ( not ( = ?auto_37473 ?auto_37478 ) ) ( not ( = ?auto_37473 ?auto_37479 ) ) ( not ( = ?auto_37474 ?auto_37475 ) ) ( not ( = ?auto_37474 ?auto_37476 ) ) ( not ( = ?auto_37474 ?auto_37477 ) ) ( not ( = ?auto_37474 ?auto_37478 ) ) ( not ( = ?auto_37474 ?auto_37479 ) ) ( not ( = ?auto_37475 ?auto_37476 ) ) ( not ( = ?auto_37475 ?auto_37477 ) ) ( not ( = ?auto_37475 ?auto_37478 ) ) ( not ( = ?auto_37475 ?auto_37479 ) ) ( not ( = ?auto_37476 ?auto_37477 ) ) ( not ( = ?auto_37476 ?auto_37478 ) ) ( not ( = ?auto_37476 ?auto_37479 ) ) ( not ( = ?auto_37477 ?auto_37478 ) ) ( not ( = ?auto_37477 ?auto_37479 ) ) ( not ( = ?auto_37478 ?auto_37479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37478 ?auto_37479 )
      ( !STACK ?auto_37478 ?auto_37477 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_37502 - BLOCK
      ?auto_37503 - BLOCK
      ?auto_37504 - BLOCK
      ?auto_37505 - BLOCK
      ?auto_37506 - BLOCK
      ?auto_37507 - BLOCK
      ?auto_37508 - BLOCK
    )
    :vars
    (
      ?auto_37509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37508 ?auto_37509 ) ( ON-TABLE ?auto_37502 ) ( ON ?auto_37503 ?auto_37502 ) ( ON ?auto_37504 ?auto_37503 ) ( ON ?auto_37505 ?auto_37504 ) ( ON ?auto_37506 ?auto_37505 ) ( not ( = ?auto_37502 ?auto_37503 ) ) ( not ( = ?auto_37502 ?auto_37504 ) ) ( not ( = ?auto_37502 ?auto_37505 ) ) ( not ( = ?auto_37502 ?auto_37506 ) ) ( not ( = ?auto_37502 ?auto_37507 ) ) ( not ( = ?auto_37502 ?auto_37508 ) ) ( not ( = ?auto_37502 ?auto_37509 ) ) ( not ( = ?auto_37503 ?auto_37504 ) ) ( not ( = ?auto_37503 ?auto_37505 ) ) ( not ( = ?auto_37503 ?auto_37506 ) ) ( not ( = ?auto_37503 ?auto_37507 ) ) ( not ( = ?auto_37503 ?auto_37508 ) ) ( not ( = ?auto_37503 ?auto_37509 ) ) ( not ( = ?auto_37504 ?auto_37505 ) ) ( not ( = ?auto_37504 ?auto_37506 ) ) ( not ( = ?auto_37504 ?auto_37507 ) ) ( not ( = ?auto_37504 ?auto_37508 ) ) ( not ( = ?auto_37504 ?auto_37509 ) ) ( not ( = ?auto_37505 ?auto_37506 ) ) ( not ( = ?auto_37505 ?auto_37507 ) ) ( not ( = ?auto_37505 ?auto_37508 ) ) ( not ( = ?auto_37505 ?auto_37509 ) ) ( not ( = ?auto_37506 ?auto_37507 ) ) ( not ( = ?auto_37506 ?auto_37508 ) ) ( not ( = ?auto_37506 ?auto_37509 ) ) ( not ( = ?auto_37507 ?auto_37508 ) ) ( not ( = ?auto_37507 ?auto_37509 ) ) ( not ( = ?auto_37508 ?auto_37509 ) ) ( CLEAR ?auto_37506 ) ( ON ?auto_37507 ?auto_37508 ) ( CLEAR ?auto_37507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37502 ?auto_37503 ?auto_37504 ?auto_37505 ?auto_37506 ?auto_37507 )
      ( MAKE-7PILE ?auto_37502 ?auto_37503 ?auto_37504 ?auto_37505 ?auto_37506 ?auto_37507 ?auto_37508 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_37532 - BLOCK
      ?auto_37533 - BLOCK
      ?auto_37534 - BLOCK
      ?auto_37535 - BLOCK
      ?auto_37536 - BLOCK
      ?auto_37537 - BLOCK
      ?auto_37538 - BLOCK
    )
    :vars
    (
      ?auto_37539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37538 ?auto_37539 ) ( ON-TABLE ?auto_37532 ) ( ON ?auto_37533 ?auto_37532 ) ( ON ?auto_37534 ?auto_37533 ) ( ON ?auto_37535 ?auto_37534 ) ( not ( = ?auto_37532 ?auto_37533 ) ) ( not ( = ?auto_37532 ?auto_37534 ) ) ( not ( = ?auto_37532 ?auto_37535 ) ) ( not ( = ?auto_37532 ?auto_37536 ) ) ( not ( = ?auto_37532 ?auto_37537 ) ) ( not ( = ?auto_37532 ?auto_37538 ) ) ( not ( = ?auto_37532 ?auto_37539 ) ) ( not ( = ?auto_37533 ?auto_37534 ) ) ( not ( = ?auto_37533 ?auto_37535 ) ) ( not ( = ?auto_37533 ?auto_37536 ) ) ( not ( = ?auto_37533 ?auto_37537 ) ) ( not ( = ?auto_37533 ?auto_37538 ) ) ( not ( = ?auto_37533 ?auto_37539 ) ) ( not ( = ?auto_37534 ?auto_37535 ) ) ( not ( = ?auto_37534 ?auto_37536 ) ) ( not ( = ?auto_37534 ?auto_37537 ) ) ( not ( = ?auto_37534 ?auto_37538 ) ) ( not ( = ?auto_37534 ?auto_37539 ) ) ( not ( = ?auto_37535 ?auto_37536 ) ) ( not ( = ?auto_37535 ?auto_37537 ) ) ( not ( = ?auto_37535 ?auto_37538 ) ) ( not ( = ?auto_37535 ?auto_37539 ) ) ( not ( = ?auto_37536 ?auto_37537 ) ) ( not ( = ?auto_37536 ?auto_37538 ) ) ( not ( = ?auto_37536 ?auto_37539 ) ) ( not ( = ?auto_37537 ?auto_37538 ) ) ( not ( = ?auto_37537 ?auto_37539 ) ) ( not ( = ?auto_37538 ?auto_37539 ) ) ( ON ?auto_37537 ?auto_37538 ) ( CLEAR ?auto_37535 ) ( ON ?auto_37536 ?auto_37537 ) ( CLEAR ?auto_37536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37532 ?auto_37533 ?auto_37534 ?auto_37535 ?auto_37536 )
      ( MAKE-7PILE ?auto_37532 ?auto_37533 ?auto_37534 ?auto_37535 ?auto_37536 ?auto_37537 ?auto_37538 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_37562 - BLOCK
      ?auto_37563 - BLOCK
      ?auto_37564 - BLOCK
      ?auto_37565 - BLOCK
      ?auto_37566 - BLOCK
      ?auto_37567 - BLOCK
      ?auto_37568 - BLOCK
    )
    :vars
    (
      ?auto_37569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37568 ?auto_37569 ) ( ON-TABLE ?auto_37562 ) ( ON ?auto_37563 ?auto_37562 ) ( ON ?auto_37564 ?auto_37563 ) ( not ( = ?auto_37562 ?auto_37563 ) ) ( not ( = ?auto_37562 ?auto_37564 ) ) ( not ( = ?auto_37562 ?auto_37565 ) ) ( not ( = ?auto_37562 ?auto_37566 ) ) ( not ( = ?auto_37562 ?auto_37567 ) ) ( not ( = ?auto_37562 ?auto_37568 ) ) ( not ( = ?auto_37562 ?auto_37569 ) ) ( not ( = ?auto_37563 ?auto_37564 ) ) ( not ( = ?auto_37563 ?auto_37565 ) ) ( not ( = ?auto_37563 ?auto_37566 ) ) ( not ( = ?auto_37563 ?auto_37567 ) ) ( not ( = ?auto_37563 ?auto_37568 ) ) ( not ( = ?auto_37563 ?auto_37569 ) ) ( not ( = ?auto_37564 ?auto_37565 ) ) ( not ( = ?auto_37564 ?auto_37566 ) ) ( not ( = ?auto_37564 ?auto_37567 ) ) ( not ( = ?auto_37564 ?auto_37568 ) ) ( not ( = ?auto_37564 ?auto_37569 ) ) ( not ( = ?auto_37565 ?auto_37566 ) ) ( not ( = ?auto_37565 ?auto_37567 ) ) ( not ( = ?auto_37565 ?auto_37568 ) ) ( not ( = ?auto_37565 ?auto_37569 ) ) ( not ( = ?auto_37566 ?auto_37567 ) ) ( not ( = ?auto_37566 ?auto_37568 ) ) ( not ( = ?auto_37566 ?auto_37569 ) ) ( not ( = ?auto_37567 ?auto_37568 ) ) ( not ( = ?auto_37567 ?auto_37569 ) ) ( not ( = ?auto_37568 ?auto_37569 ) ) ( ON ?auto_37567 ?auto_37568 ) ( ON ?auto_37566 ?auto_37567 ) ( CLEAR ?auto_37564 ) ( ON ?auto_37565 ?auto_37566 ) ( CLEAR ?auto_37565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37562 ?auto_37563 ?auto_37564 ?auto_37565 )
      ( MAKE-7PILE ?auto_37562 ?auto_37563 ?auto_37564 ?auto_37565 ?auto_37566 ?auto_37567 ?auto_37568 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_37592 - BLOCK
      ?auto_37593 - BLOCK
      ?auto_37594 - BLOCK
      ?auto_37595 - BLOCK
      ?auto_37596 - BLOCK
      ?auto_37597 - BLOCK
      ?auto_37598 - BLOCK
    )
    :vars
    (
      ?auto_37599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37598 ?auto_37599 ) ( ON-TABLE ?auto_37592 ) ( ON ?auto_37593 ?auto_37592 ) ( not ( = ?auto_37592 ?auto_37593 ) ) ( not ( = ?auto_37592 ?auto_37594 ) ) ( not ( = ?auto_37592 ?auto_37595 ) ) ( not ( = ?auto_37592 ?auto_37596 ) ) ( not ( = ?auto_37592 ?auto_37597 ) ) ( not ( = ?auto_37592 ?auto_37598 ) ) ( not ( = ?auto_37592 ?auto_37599 ) ) ( not ( = ?auto_37593 ?auto_37594 ) ) ( not ( = ?auto_37593 ?auto_37595 ) ) ( not ( = ?auto_37593 ?auto_37596 ) ) ( not ( = ?auto_37593 ?auto_37597 ) ) ( not ( = ?auto_37593 ?auto_37598 ) ) ( not ( = ?auto_37593 ?auto_37599 ) ) ( not ( = ?auto_37594 ?auto_37595 ) ) ( not ( = ?auto_37594 ?auto_37596 ) ) ( not ( = ?auto_37594 ?auto_37597 ) ) ( not ( = ?auto_37594 ?auto_37598 ) ) ( not ( = ?auto_37594 ?auto_37599 ) ) ( not ( = ?auto_37595 ?auto_37596 ) ) ( not ( = ?auto_37595 ?auto_37597 ) ) ( not ( = ?auto_37595 ?auto_37598 ) ) ( not ( = ?auto_37595 ?auto_37599 ) ) ( not ( = ?auto_37596 ?auto_37597 ) ) ( not ( = ?auto_37596 ?auto_37598 ) ) ( not ( = ?auto_37596 ?auto_37599 ) ) ( not ( = ?auto_37597 ?auto_37598 ) ) ( not ( = ?auto_37597 ?auto_37599 ) ) ( not ( = ?auto_37598 ?auto_37599 ) ) ( ON ?auto_37597 ?auto_37598 ) ( ON ?auto_37596 ?auto_37597 ) ( ON ?auto_37595 ?auto_37596 ) ( CLEAR ?auto_37593 ) ( ON ?auto_37594 ?auto_37595 ) ( CLEAR ?auto_37594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37592 ?auto_37593 ?auto_37594 )
      ( MAKE-7PILE ?auto_37592 ?auto_37593 ?auto_37594 ?auto_37595 ?auto_37596 ?auto_37597 ?auto_37598 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_37622 - BLOCK
      ?auto_37623 - BLOCK
      ?auto_37624 - BLOCK
      ?auto_37625 - BLOCK
      ?auto_37626 - BLOCK
      ?auto_37627 - BLOCK
      ?auto_37628 - BLOCK
    )
    :vars
    (
      ?auto_37629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37628 ?auto_37629 ) ( ON-TABLE ?auto_37622 ) ( not ( = ?auto_37622 ?auto_37623 ) ) ( not ( = ?auto_37622 ?auto_37624 ) ) ( not ( = ?auto_37622 ?auto_37625 ) ) ( not ( = ?auto_37622 ?auto_37626 ) ) ( not ( = ?auto_37622 ?auto_37627 ) ) ( not ( = ?auto_37622 ?auto_37628 ) ) ( not ( = ?auto_37622 ?auto_37629 ) ) ( not ( = ?auto_37623 ?auto_37624 ) ) ( not ( = ?auto_37623 ?auto_37625 ) ) ( not ( = ?auto_37623 ?auto_37626 ) ) ( not ( = ?auto_37623 ?auto_37627 ) ) ( not ( = ?auto_37623 ?auto_37628 ) ) ( not ( = ?auto_37623 ?auto_37629 ) ) ( not ( = ?auto_37624 ?auto_37625 ) ) ( not ( = ?auto_37624 ?auto_37626 ) ) ( not ( = ?auto_37624 ?auto_37627 ) ) ( not ( = ?auto_37624 ?auto_37628 ) ) ( not ( = ?auto_37624 ?auto_37629 ) ) ( not ( = ?auto_37625 ?auto_37626 ) ) ( not ( = ?auto_37625 ?auto_37627 ) ) ( not ( = ?auto_37625 ?auto_37628 ) ) ( not ( = ?auto_37625 ?auto_37629 ) ) ( not ( = ?auto_37626 ?auto_37627 ) ) ( not ( = ?auto_37626 ?auto_37628 ) ) ( not ( = ?auto_37626 ?auto_37629 ) ) ( not ( = ?auto_37627 ?auto_37628 ) ) ( not ( = ?auto_37627 ?auto_37629 ) ) ( not ( = ?auto_37628 ?auto_37629 ) ) ( ON ?auto_37627 ?auto_37628 ) ( ON ?auto_37626 ?auto_37627 ) ( ON ?auto_37625 ?auto_37626 ) ( ON ?auto_37624 ?auto_37625 ) ( CLEAR ?auto_37622 ) ( ON ?auto_37623 ?auto_37624 ) ( CLEAR ?auto_37623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37622 ?auto_37623 )
      ( MAKE-7PILE ?auto_37622 ?auto_37623 ?auto_37624 ?auto_37625 ?auto_37626 ?auto_37627 ?auto_37628 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_37652 - BLOCK
      ?auto_37653 - BLOCK
      ?auto_37654 - BLOCK
      ?auto_37655 - BLOCK
      ?auto_37656 - BLOCK
      ?auto_37657 - BLOCK
      ?auto_37658 - BLOCK
    )
    :vars
    (
      ?auto_37659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37658 ?auto_37659 ) ( not ( = ?auto_37652 ?auto_37653 ) ) ( not ( = ?auto_37652 ?auto_37654 ) ) ( not ( = ?auto_37652 ?auto_37655 ) ) ( not ( = ?auto_37652 ?auto_37656 ) ) ( not ( = ?auto_37652 ?auto_37657 ) ) ( not ( = ?auto_37652 ?auto_37658 ) ) ( not ( = ?auto_37652 ?auto_37659 ) ) ( not ( = ?auto_37653 ?auto_37654 ) ) ( not ( = ?auto_37653 ?auto_37655 ) ) ( not ( = ?auto_37653 ?auto_37656 ) ) ( not ( = ?auto_37653 ?auto_37657 ) ) ( not ( = ?auto_37653 ?auto_37658 ) ) ( not ( = ?auto_37653 ?auto_37659 ) ) ( not ( = ?auto_37654 ?auto_37655 ) ) ( not ( = ?auto_37654 ?auto_37656 ) ) ( not ( = ?auto_37654 ?auto_37657 ) ) ( not ( = ?auto_37654 ?auto_37658 ) ) ( not ( = ?auto_37654 ?auto_37659 ) ) ( not ( = ?auto_37655 ?auto_37656 ) ) ( not ( = ?auto_37655 ?auto_37657 ) ) ( not ( = ?auto_37655 ?auto_37658 ) ) ( not ( = ?auto_37655 ?auto_37659 ) ) ( not ( = ?auto_37656 ?auto_37657 ) ) ( not ( = ?auto_37656 ?auto_37658 ) ) ( not ( = ?auto_37656 ?auto_37659 ) ) ( not ( = ?auto_37657 ?auto_37658 ) ) ( not ( = ?auto_37657 ?auto_37659 ) ) ( not ( = ?auto_37658 ?auto_37659 ) ) ( ON ?auto_37657 ?auto_37658 ) ( ON ?auto_37656 ?auto_37657 ) ( ON ?auto_37655 ?auto_37656 ) ( ON ?auto_37654 ?auto_37655 ) ( ON ?auto_37653 ?auto_37654 ) ( ON ?auto_37652 ?auto_37653 ) ( CLEAR ?auto_37652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37652 )
      ( MAKE-7PILE ?auto_37652 ?auto_37653 ?auto_37654 ?auto_37655 ?auto_37656 ?auto_37657 ?auto_37658 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37683 - BLOCK
      ?auto_37684 - BLOCK
      ?auto_37685 - BLOCK
      ?auto_37686 - BLOCK
      ?auto_37687 - BLOCK
      ?auto_37688 - BLOCK
      ?auto_37689 - BLOCK
      ?auto_37690 - BLOCK
    )
    :vars
    (
      ?auto_37691 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37689 ) ( ON ?auto_37690 ?auto_37691 ) ( CLEAR ?auto_37690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37683 ) ( ON ?auto_37684 ?auto_37683 ) ( ON ?auto_37685 ?auto_37684 ) ( ON ?auto_37686 ?auto_37685 ) ( ON ?auto_37687 ?auto_37686 ) ( ON ?auto_37688 ?auto_37687 ) ( ON ?auto_37689 ?auto_37688 ) ( not ( = ?auto_37683 ?auto_37684 ) ) ( not ( = ?auto_37683 ?auto_37685 ) ) ( not ( = ?auto_37683 ?auto_37686 ) ) ( not ( = ?auto_37683 ?auto_37687 ) ) ( not ( = ?auto_37683 ?auto_37688 ) ) ( not ( = ?auto_37683 ?auto_37689 ) ) ( not ( = ?auto_37683 ?auto_37690 ) ) ( not ( = ?auto_37683 ?auto_37691 ) ) ( not ( = ?auto_37684 ?auto_37685 ) ) ( not ( = ?auto_37684 ?auto_37686 ) ) ( not ( = ?auto_37684 ?auto_37687 ) ) ( not ( = ?auto_37684 ?auto_37688 ) ) ( not ( = ?auto_37684 ?auto_37689 ) ) ( not ( = ?auto_37684 ?auto_37690 ) ) ( not ( = ?auto_37684 ?auto_37691 ) ) ( not ( = ?auto_37685 ?auto_37686 ) ) ( not ( = ?auto_37685 ?auto_37687 ) ) ( not ( = ?auto_37685 ?auto_37688 ) ) ( not ( = ?auto_37685 ?auto_37689 ) ) ( not ( = ?auto_37685 ?auto_37690 ) ) ( not ( = ?auto_37685 ?auto_37691 ) ) ( not ( = ?auto_37686 ?auto_37687 ) ) ( not ( = ?auto_37686 ?auto_37688 ) ) ( not ( = ?auto_37686 ?auto_37689 ) ) ( not ( = ?auto_37686 ?auto_37690 ) ) ( not ( = ?auto_37686 ?auto_37691 ) ) ( not ( = ?auto_37687 ?auto_37688 ) ) ( not ( = ?auto_37687 ?auto_37689 ) ) ( not ( = ?auto_37687 ?auto_37690 ) ) ( not ( = ?auto_37687 ?auto_37691 ) ) ( not ( = ?auto_37688 ?auto_37689 ) ) ( not ( = ?auto_37688 ?auto_37690 ) ) ( not ( = ?auto_37688 ?auto_37691 ) ) ( not ( = ?auto_37689 ?auto_37690 ) ) ( not ( = ?auto_37689 ?auto_37691 ) ) ( not ( = ?auto_37690 ?auto_37691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37690 ?auto_37691 )
      ( !STACK ?auto_37690 ?auto_37689 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37700 - BLOCK
      ?auto_37701 - BLOCK
      ?auto_37702 - BLOCK
      ?auto_37703 - BLOCK
      ?auto_37704 - BLOCK
      ?auto_37705 - BLOCK
      ?auto_37706 - BLOCK
      ?auto_37707 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37706 ) ( ON-TABLE ?auto_37707 ) ( CLEAR ?auto_37707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37700 ) ( ON ?auto_37701 ?auto_37700 ) ( ON ?auto_37702 ?auto_37701 ) ( ON ?auto_37703 ?auto_37702 ) ( ON ?auto_37704 ?auto_37703 ) ( ON ?auto_37705 ?auto_37704 ) ( ON ?auto_37706 ?auto_37705 ) ( not ( = ?auto_37700 ?auto_37701 ) ) ( not ( = ?auto_37700 ?auto_37702 ) ) ( not ( = ?auto_37700 ?auto_37703 ) ) ( not ( = ?auto_37700 ?auto_37704 ) ) ( not ( = ?auto_37700 ?auto_37705 ) ) ( not ( = ?auto_37700 ?auto_37706 ) ) ( not ( = ?auto_37700 ?auto_37707 ) ) ( not ( = ?auto_37701 ?auto_37702 ) ) ( not ( = ?auto_37701 ?auto_37703 ) ) ( not ( = ?auto_37701 ?auto_37704 ) ) ( not ( = ?auto_37701 ?auto_37705 ) ) ( not ( = ?auto_37701 ?auto_37706 ) ) ( not ( = ?auto_37701 ?auto_37707 ) ) ( not ( = ?auto_37702 ?auto_37703 ) ) ( not ( = ?auto_37702 ?auto_37704 ) ) ( not ( = ?auto_37702 ?auto_37705 ) ) ( not ( = ?auto_37702 ?auto_37706 ) ) ( not ( = ?auto_37702 ?auto_37707 ) ) ( not ( = ?auto_37703 ?auto_37704 ) ) ( not ( = ?auto_37703 ?auto_37705 ) ) ( not ( = ?auto_37703 ?auto_37706 ) ) ( not ( = ?auto_37703 ?auto_37707 ) ) ( not ( = ?auto_37704 ?auto_37705 ) ) ( not ( = ?auto_37704 ?auto_37706 ) ) ( not ( = ?auto_37704 ?auto_37707 ) ) ( not ( = ?auto_37705 ?auto_37706 ) ) ( not ( = ?auto_37705 ?auto_37707 ) ) ( not ( = ?auto_37706 ?auto_37707 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_37707 )
      ( !STACK ?auto_37707 ?auto_37706 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37716 - BLOCK
      ?auto_37717 - BLOCK
      ?auto_37718 - BLOCK
      ?auto_37719 - BLOCK
      ?auto_37720 - BLOCK
      ?auto_37721 - BLOCK
      ?auto_37722 - BLOCK
      ?auto_37723 - BLOCK
    )
    :vars
    (
      ?auto_37724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37723 ?auto_37724 ) ( ON-TABLE ?auto_37716 ) ( ON ?auto_37717 ?auto_37716 ) ( ON ?auto_37718 ?auto_37717 ) ( ON ?auto_37719 ?auto_37718 ) ( ON ?auto_37720 ?auto_37719 ) ( ON ?auto_37721 ?auto_37720 ) ( not ( = ?auto_37716 ?auto_37717 ) ) ( not ( = ?auto_37716 ?auto_37718 ) ) ( not ( = ?auto_37716 ?auto_37719 ) ) ( not ( = ?auto_37716 ?auto_37720 ) ) ( not ( = ?auto_37716 ?auto_37721 ) ) ( not ( = ?auto_37716 ?auto_37722 ) ) ( not ( = ?auto_37716 ?auto_37723 ) ) ( not ( = ?auto_37716 ?auto_37724 ) ) ( not ( = ?auto_37717 ?auto_37718 ) ) ( not ( = ?auto_37717 ?auto_37719 ) ) ( not ( = ?auto_37717 ?auto_37720 ) ) ( not ( = ?auto_37717 ?auto_37721 ) ) ( not ( = ?auto_37717 ?auto_37722 ) ) ( not ( = ?auto_37717 ?auto_37723 ) ) ( not ( = ?auto_37717 ?auto_37724 ) ) ( not ( = ?auto_37718 ?auto_37719 ) ) ( not ( = ?auto_37718 ?auto_37720 ) ) ( not ( = ?auto_37718 ?auto_37721 ) ) ( not ( = ?auto_37718 ?auto_37722 ) ) ( not ( = ?auto_37718 ?auto_37723 ) ) ( not ( = ?auto_37718 ?auto_37724 ) ) ( not ( = ?auto_37719 ?auto_37720 ) ) ( not ( = ?auto_37719 ?auto_37721 ) ) ( not ( = ?auto_37719 ?auto_37722 ) ) ( not ( = ?auto_37719 ?auto_37723 ) ) ( not ( = ?auto_37719 ?auto_37724 ) ) ( not ( = ?auto_37720 ?auto_37721 ) ) ( not ( = ?auto_37720 ?auto_37722 ) ) ( not ( = ?auto_37720 ?auto_37723 ) ) ( not ( = ?auto_37720 ?auto_37724 ) ) ( not ( = ?auto_37721 ?auto_37722 ) ) ( not ( = ?auto_37721 ?auto_37723 ) ) ( not ( = ?auto_37721 ?auto_37724 ) ) ( not ( = ?auto_37722 ?auto_37723 ) ) ( not ( = ?auto_37722 ?auto_37724 ) ) ( not ( = ?auto_37723 ?auto_37724 ) ) ( CLEAR ?auto_37721 ) ( ON ?auto_37722 ?auto_37723 ) ( CLEAR ?auto_37722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_37716 ?auto_37717 ?auto_37718 ?auto_37719 ?auto_37720 ?auto_37721 ?auto_37722 )
      ( MAKE-8PILE ?auto_37716 ?auto_37717 ?auto_37718 ?auto_37719 ?auto_37720 ?auto_37721 ?auto_37722 ?auto_37723 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37733 - BLOCK
      ?auto_37734 - BLOCK
      ?auto_37735 - BLOCK
      ?auto_37736 - BLOCK
      ?auto_37737 - BLOCK
      ?auto_37738 - BLOCK
      ?auto_37739 - BLOCK
      ?auto_37740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37740 ) ( ON-TABLE ?auto_37733 ) ( ON ?auto_37734 ?auto_37733 ) ( ON ?auto_37735 ?auto_37734 ) ( ON ?auto_37736 ?auto_37735 ) ( ON ?auto_37737 ?auto_37736 ) ( ON ?auto_37738 ?auto_37737 ) ( not ( = ?auto_37733 ?auto_37734 ) ) ( not ( = ?auto_37733 ?auto_37735 ) ) ( not ( = ?auto_37733 ?auto_37736 ) ) ( not ( = ?auto_37733 ?auto_37737 ) ) ( not ( = ?auto_37733 ?auto_37738 ) ) ( not ( = ?auto_37733 ?auto_37739 ) ) ( not ( = ?auto_37733 ?auto_37740 ) ) ( not ( = ?auto_37734 ?auto_37735 ) ) ( not ( = ?auto_37734 ?auto_37736 ) ) ( not ( = ?auto_37734 ?auto_37737 ) ) ( not ( = ?auto_37734 ?auto_37738 ) ) ( not ( = ?auto_37734 ?auto_37739 ) ) ( not ( = ?auto_37734 ?auto_37740 ) ) ( not ( = ?auto_37735 ?auto_37736 ) ) ( not ( = ?auto_37735 ?auto_37737 ) ) ( not ( = ?auto_37735 ?auto_37738 ) ) ( not ( = ?auto_37735 ?auto_37739 ) ) ( not ( = ?auto_37735 ?auto_37740 ) ) ( not ( = ?auto_37736 ?auto_37737 ) ) ( not ( = ?auto_37736 ?auto_37738 ) ) ( not ( = ?auto_37736 ?auto_37739 ) ) ( not ( = ?auto_37736 ?auto_37740 ) ) ( not ( = ?auto_37737 ?auto_37738 ) ) ( not ( = ?auto_37737 ?auto_37739 ) ) ( not ( = ?auto_37737 ?auto_37740 ) ) ( not ( = ?auto_37738 ?auto_37739 ) ) ( not ( = ?auto_37738 ?auto_37740 ) ) ( not ( = ?auto_37739 ?auto_37740 ) ) ( CLEAR ?auto_37738 ) ( ON ?auto_37739 ?auto_37740 ) ( CLEAR ?auto_37739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_37733 ?auto_37734 ?auto_37735 ?auto_37736 ?auto_37737 ?auto_37738 ?auto_37739 )
      ( MAKE-8PILE ?auto_37733 ?auto_37734 ?auto_37735 ?auto_37736 ?auto_37737 ?auto_37738 ?auto_37739 ?auto_37740 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37749 - BLOCK
      ?auto_37750 - BLOCK
      ?auto_37751 - BLOCK
      ?auto_37752 - BLOCK
      ?auto_37753 - BLOCK
      ?auto_37754 - BLOCK
      ?auto_37755 - BLOCK
      ?auto_37756 - BLOCK
    )
    :vars
    (
      ?auto_37757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37756 ?auto_37757 ) ( ON-TABLE ?auto_37749 ) ( ON ?auto_37750 ?auto_37749 ) ( ON ?auto_37751 ?auto_37750 ) ( ON ?auto_37752 ?auto_37751 ) ( ON ?auto_37753 ?auto_37752 ) ( not ( = ?auto_37749 ?auto_37750 ) ) ( not ( = ?auto_37749 ?auto_37751 ) ) ( not ( = ?auto_37749 ?auto_37752 ) ) ( not ( = ?auto_37749 ?auto_37753 ) ) ( not ( = ?auto_37749 ?auto_37754 ) ) ( not ( = ?auto_37749 ?auto_37755 ) ) ( not ( = ?auto_37749 ?auto_37756 ) ) ( not ( = ?auto_37749 ?auto_37757 ) ) ( not ( = ?auto_37750 ?auto_37751 ) ) ( not ( = ?auto_37750 ?auto_37752 ) ) ( not ( = ?auto_37750 ?auto_37753 ) ) ( not ( = ?auto_37750 ?auto_37754 ) ) ( not ( = ?auto_37750 ?auto_37755 ) ) ( not ( = ?auto_37750 ?auto_37756 ) ) ( not ( = ?auto_37750 ?auto_37757 ) ) ( not ( = ?auto_37751 ?auto_37752 ) ) ( not ( = ?auto_37751 ?auto_37753 ) ) ( not ( = ?auto_37751 ?auto_37754 ) ) ( not ( = ?auto_37751 ?auto_37755 ) ) ( not ( = ?auto_37751 ?auto_37756 ) ) ( not ( = ?auto_37751 ?auto_37757 ) ) ( not ( = ?auto_37752 ?auto_37753 ) ) ( not ( = ?auto_37752 ?auto_37754 ) ) ( not ( = ?auto_37752 ?auto_37755 ) ) ( not ( = ?auto_37752 ?auto_37756 ) ) ( not ( = ?auto_37752 ?auto_37757 ) ) ( not ( = ?auto_37753 ?auto_37754 ) ) ( not ( = ?auto_37753 ?auto_37755 ) ) ( not ( = ?auto_37753 ?auto_37756 ) ) ( not ( = ?auto_37753 ?auto_37757 ) ) ( not ( = ?auto_37754 ?auto_37755 ) ) ( not ( = ?auto_37754 ?auto_37756 ) ) ( not ( = ?auto_37754 ?auto_37757 ) ) ( not ( = ?auto_37755 ?auto_37756 ) ) ( not ( = ?auto_37755 ?auto_37757 ) ) ( not ( = ?auto_37756 ?auto_37757 ) ) ( ON ?auto_37755 ?auto_37756 ) ( CLEAR ?auto_37753 ) ( ON ?auto_37754 ?auto_37755 ) ( CLEAR ?auto_37754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37749 ?auto_37750 ?auto_37751 ?auto_37752 ?auto_37753 ?auto_37754 )
      ( MAKE-8PILE ?auto_37749 ?auto_37750 ?auto_37751 ?auto_37752 ?auto_37753 ?auto_37754 ?auto_37755 ?auto_37756 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37766 - BLOCK
      ?auto_37767 - BLOCK
      ?auto_37768 - BLOCK
      ?auto_37769 - BLOCK
      ?auto_37770 - BLOCK
      ?auto_37771 - BLOCK
      ?auto_37772 - BLOCK
      ?auto_37773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37773 ) ( ON-TABLE ?auto_37766 ) ( ON ?auto_37767 ?auto_37766 ) ( ON ?auto_37768 ?auto_37767 ) ( ON ?auto_37769 ?auto_37768 ) ( ON ?auto_37770 ?auto_37769 ) ( not ( = ?auto_37766 ?auto_37767 ) ) ( not ( = ?auto_37766 ?auto_37768 ) ) ( not ( = ?auto_37766 ?auto_37769 ) ) ( not ( = ?auto_37766 ?auto_37770 ) ) ( not ( = ?auto_37766 ?auto_37771 ) ) ( not ( = ?auto_37766 ?auto_37772 ) ) ( not ( = ?auto_37766 ?auto_37773 ) ) ( not ( = ?auto_37767 ?auto_37768 ) ) ( not ( = ?auto_37767 ?auto_37769 ) ) ( not ( = ?auto_37767 ?auto_37770 ) ) ( not ( = ?auto_37767 ?auto_37771 ) ) ( not ( = ?auto_37767 ?auto_37772 ) ) ( not ( = ?auto_37767 ?auto_37773 ) ) ( not ( = ?auto_37768 ?auto_37769 ) ) ( not ( = ?auto_37768 ?auto_37770 ) ) ( not ( = ?auto_37768 ?auto_37771 ) ) ( not ( = ?auto_37768 ?auto_37772 ) ) ( not ( = ?auto_37768 ?auto_37773 ) ) ( not ( = ?auto_37769 ?auto_37770 ) ) ( not ( = ?auto_37769 ?auto_37771 ) ) ( not ( = ?auto_37769 ?auto_37772 ) ) ( not ( = ?auto_37769 ?auto_37773 ) ) ( not ( = ?auto_37770 ?auto_37771 ) ) ( not ( = ?auto_37770 ?auto_37772 ) ) ( not ( = ?auto_37770 ?auto_37773 ) ) ( not ( = ?auto_37771 ?auto_37772 ) ) ( not ( = ?auto_37771 ?auto_37773 ) ) ( not ( = ?auto_37772 ?auto_37773 ) ) ( ON ?auto_37772 ?auto_37773 ) ( CLEAR ?auto_37770 ) ( ON ?auto_37771 ?auto_37772 ) ( CLEAR ?auto_37771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37766 ?auto_37767 ?auto_37768 ?auto_37769 ?auto_37770 ?auto_37771 )
      ( MAKE-8PILE ?auto_37766 ?auto_37767 ?auto_37768 ?auto_37769 ?auto_37770 ?auto_37771 ?auto_37772 ?auto_37773 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37782 - BLOCK
      ?auto_37783 - BLOCK
      ?auto_37784 - BLOCK
      ?auto_37785 - BLOCK
      ?auto_37786 - BLOCK
      ?auto_37787 - BLOCK
      ?auto_37788 - BLOCK
      ?auto_37789 - BLOCK
    )
    :vars
    (
      ?auto_37790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37789 ?auto_37790 ) ( ON-TABLE ?auto_37782 ) ( ON ?auto_37783 ?auto_37782 ) ( ON ?auto_37784 ?auto_37783 ) ( ON ?auto_37785 ?auto_37784 ) ( not ( = ?auto_37782 ?auto_37783 ) ) ( not ( = ?auto_37782 ?auto_37784 ) ) ( not ( = ?auto_37782 ?auto_37785 ) ) ( not ( = ?auto_37782 ?auto_37786 ) ) ( not ( = ?auto_37782 ?auto_37787 ) ) ( not ( = ?auto_37782 ?auto_37788 ) ) ( not ( = ?auto_37782 ?auto_37789 ) ) ( not ( = ?auto_37782 ?auto_37790 ) ) ( not ( = ?auto_37783 ?auto_37784 ) ) ( not ( = ?auto_37783 ?auto_37785 ) ) ( not ( = ?auto_37783 ?auto_37786 ) ) ( not ( = ?auto_37783 ?auto_37787 ) ) ( not ( = ?auto_37783 ?auto_37788 ) ) ( not ( = ?auto_37783 ?auto_37789 ) ) ( not ( = ?auto_37783 ?auto_37790 ) ) ( not ( = ?auto_37784 ?auto_37785 ) ) ( not ( = ?auto_37784 ?auto_37786 ) ) ( not ( = ?auto_37784 ?auto_37787 ) ) ( not ( = ?auto_37784 ?auto_37788 ) ) ( not ( = ?auto_37784 ?auto_37789 ) ) ( not ( = ?auto_37784 ?auto_37790 ) ) ( not ( = ?auto_37785 ?auto_37786 ) ) ( not ( = ?auto_37785 ?auto_37787 ) ) ( not ( = ?auto_37785 ?auto_37788 ) ) ( not ( = ?auto_37785 ?auto_37789 ) ) ( not ( = ?auto_37785 ?auto_37790 ) ) ( not ( = ?auto_37786 ?auto_37787 ) ) ( not ( = ?auto_37786 ?auto_37788 ) ) ( not ( = ?auto_37786 ?auto_37789 ) ) ( not ( = ?auto_37786 ?auto_37790 ) ) ( not ( = ?auto_37787 ?auto_37788 ) ) ( not ( = ?auto_37787 ?auto_37789 ) ) ( not ( = ?auto_37787 ?auto_37790 ) ) ( not ( = ?auto_37788 ?auto_37789 ) ) ( not ( = ?auto_37788 ?auto_37790 ) ) ( not ( = ?auto_37789 ?auto_37790 ) ) ( ON ?auto_37788 ?auto_37789 ) ( ON ?auto_37787 ?auto_37788 ) ( CLEAR ?auto_37785 ) ( ON ?auto_37786 ?auto_37787 ) ( CLEAR ?auto_37786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37782 ?auto_37783 ?auto_37784 ?auto_37785 ?auto_37786 )
      ( MAKE-8PILE ?auto_37782 ?auto_37783 ?auto_37784 ?auto_37785 ?auto_37786 ?auto_37787 ?auto_37788 ?auto_37789 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37799 - BLOCK
      ?auto_37800 - BLOCK
      ?auto_37801 - BLOCK
      ?auto_37802 - BLOCK
      ?auto_37803 - BLOCK
      ?auto_37804 - BLOCK
      ?auto_37805 - BLOCK
      ?auto_37806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37806 ) ( ON-TABLE ?auto_37799 ) ( ON ?auto_37800 ?auto_37799 ) ( ON ?auto_37801 ?auto_37800 ) ( ON ?auto_37802 ?auto_37801 ) ( not ( = ?auto_37799 ?auto_37800 ) ) ( not ( = ?auto_37799 ?auto_37801 ) ) ( not ( = ?auto_37799 ?auto_37802 ) ) ( not ( = ?auto_37799 ?auto_37803 ) ) ( not ( = ?auto_37799 ?auto_37804 ) ) ( not ( = ?auto_37799 ?auto_37805 ) ) ( not ( = ?auto_37799 ?auto_37806 ) ) ( not ( = ?auto_37800 ?auto_37801 ) ) ( not ( = ?auto_37800 ?auto_37802 ) ) ( not ( = ?auto_37800 ?auto_37803 ) ) ( not ( = ?auto_37800 ?auto_37804 ) ) ( not ( = ?auto_37800 ?auto_37805 ) ) ( not ( = ?auto_37800 ?auto_37806 ) ) ( not ( = ?auto_37801 ?auto_37802 ) ) ( not ( = ?auto_37801 ?auto_37803 ) ) ( not ( = ?auto_37801 ?auto_37804 ) ) ( not ( = ?auto_37801 ?auto_37805 ) ) ( not ( = ?auto_37801 ?auto_37806 ) ) ( not ( = ?auto_37802 ?auto_37803 ) ) ( not ( = ?auto_37802 ?auto_37804 ) ) ( not ( = ?auto_37802 ?auto_37805 ) ) ( not ( = ?auto_37802 ?auto_37806 ) ) ( not ( = ?auto_37803 ?auto_37804 ) ) ( not ( = ?auto_37803 ?auto_37805 ) ) ( not ( = ?auto_37803 ?auto_37806 ) ) ( not ( = ?auto_37804 ?auto_37805 ) ) ( not ( = ?auto_37804 ?auto_37806 ) ) ( not ( = ?auto_37805 ?auto_37806 ) ) ( ON ?auto_37805 ?auto_37806 ) ( ON ?auto_37804 ?auto_37805 ) ( CLEAR ?auto_37802 ) ( ON ?auto_37803 ?auto_37804 ) ( CLEAR ?auto_37803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37799 ?auto_37800 ?auto_37801 ?auto_37802 ?auto_37803 )
      ( MAKE-8PILE ?auto_37799 ?auto_37800 ?auto_37801 ?auto_37802 ?auto_37803 ?auto_37804 ?auto_37805 ?auto_37806 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37815 - BLOCK
      ?auto_37816 - BLOCK
      ?auto_37817 - BLOCK
      ?auto_37818 - BLOCK
      ?auto_37819 - BLOCK
      ?auto_37820 - BLOCK
      ?auto_37821 - BLOCK
      ?auto_37822 - BLOCK
    )
    :vars
    (
      ?auto_37823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37822 ?auto_37823 ) ( ON-TABLE ?auto_37815 ) ( ON ?auto_37816 ?auto_37815 ) ( ON ?auto_37817 ?auto_37816 ) ( not ( = ?auto_37815 ?auto_37816 ) ) ( not ( = ?auto_37815 ?auto_37817 ) ) ( not ( = ?auto_37815 ?auto_37818 ) ) ( not ( = ?auto_37815 ?auto_37819 ) ) ( not ( = ?auto_37815 ?auto_37820 ) ) ( not ( = ?auto_37815 ?auto_37821 ) ) ( not ( = ?auto_37815 ?auto_37822 ) ) ( not ( = ?auto_37815 ?auto_37823 ) ) ( not ( = ?auto_37816 ?auto_37817 ) ) ( not ( = ?auto_37816 ?auto_37818 ) ) ( not ( = ?auto_37816 ?auto_37819 ) ) ( not ( = ?auto_37816 ?auto_37820 ) ) ( not ( = ?auto_37816 ?auto_37821 ) ) ( not ( = ?auto_37816 ?auto_37822 ) ) ( not ( = ?auto_37816 ?auto_37823 ) ) ( not ( = ?auto_37817 ?auto_37818 ) ) ( not ( = ?auto_37817 ?auto_37819 ) ) ( not ( = ?auto_37817 ?auto_37820 ) ) ( not ( = ?auto_37817 ?auto_37821 ) ) ( not ( = ?auto_37817 ?auto_37822 ) ) ( not ( = ?auto_37817 ?auto_37823 ) ) ( not ( = ?auto_37818 ?auto_37819 ) ) ( not ( = ?auto_37818 ?auto_37820 ) ) ( not ( = ?auto_37818 ?auto_37821 ) ) ( not ( = ?auto_37818 ?auto_37822 ) ) ( not ( = ?auto_37818 ?auto_37823 ) ) ( not ( = ?auto_37819 ?auto_37820 ) ) ( not ( = ?auto_37819 ?auto_37821 ) ) ( not ( = ?auto_37819 ?auto_37822 ) ) ( not ( = ?auto_37819 ?auto_37823 ) ) ( not ( = ?auto_37820 ?auto_37821 ) ) ( not ( = ?auto_37820 ?auto_37822 ) ) ( not ( = ?auto_37820 ?auto_37823 ) ) ( not ( = ?auto_37821 ?auto_37822 ) ) ( not ( = ?auto_37821 ?auto_37823 ) ) ( not ( = ?auto_37822 ?auto_37823 ) ) ( ON ?auto_37821 ?auto_37822 ) ( ON ?auto_37820 ?auto_37821 ) ( ON ?auto_37819 ?auto_37820 ) ( CLEAR ?auto_37817 ) ( ON ?auto_37818 ?auto_37819 ) ( CLEAR ?auto_37818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37815 ?auto_37816 ?auto_37817 ?auto_37818 )
      ( MAKE-8PILE ?auto_37815 ?auto_37816 ?auto_37817 ?auto_37818 ?auto_37819 ?auto_37820 ?auto_37821 ?auto_37822 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37832 - BLOCK
      ?auto_37833 - BLOCK
      ?auto_37834 - BLOCK
      ?auto_37835 - BLOCK
      ?auto_37836 - BLOCK
      ?auto_37837 - BLOCK
      ?auto_37838 - BLOCK
      ?auto_37839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37839 ) ( ON-TABLE ?auto_37832 ) ( ON ?auto_37833 ?auto_37832 ) ( ON ?auto_37834 ?auto_37833 ) ( not ( = ?auto_37832 ?auto_37833 ) ) ( not ( = ?auto_37832 ?auto_37834 ) ) ( not ( = ?auto_37832 ?auto_37835 ) ) ( not ( = ?auto_37832 ?auto_37836 ) ) ( not ( = ?auto_37832 ?auto_37837 ) ) ( not ( = ?auto_37832 ?auto_37838 ) ) ( not ( = ?auto_37832 ?auto_37839 ) ) ( not ( = ?auto_37833 ?auto_37834 ) ) ( not ( = ?auto_37833 ?auto_37835 ) ) ( not ( = ?auto_37833 ?auto_37836 ) ) ( not ( = ?auto_37833 ?auto_37837 ) ) ( not ( = ?auto_37833 ?auto_37838 ) ) ( not ( = ?auto_37833 ?auto_37839 ) ) ( not ( = ?auto_37834 ?auto_37835 ) ) ( not ( = ?auto_37834 ?auto_37836 ) ) ( not ( = ?auto_37834 ?auto_37837 ) ) ( not ( = ?auto_37834 ?auto_37838 ) ) ( not ( = ?auto_37834 ?auto_37839 ) ) ( not ( = ?auto_37835 ?auto_37836 ) ) ( not ( = ?auto_37835 ?auto_37837 ) ) ( not ( = ?auto_37835 ?auto_37838 ) ) ( not ( = ?auto_37835 ?auto_37839 ) ) ( not ( = ?auto_37836 ?auto_37837 ) ) ( not ( = ?auto_37836 ?auto_37838 ) ) ( not ( = ?auto_37836 ?auto_37839 ) ) ( not ( = ?auto_37837 ?auto_37838 ) ) ( not ( = ?auto_37837 ?auto_37839 ) ) ( not ( = ?auto_37838 ?auto_37839 ) ) ( ON ?auto_37838 ?auto_37839 ) ( ON ?auto_37837 ?auto_37838 ) ( ON ?auto_37836 ?auto_37837 ) ( CLEAR ?auto_37834 ) ( ON ?auto_37835 ?auto_37836 ) ( CLEAR ?auto_37835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37832 ?auto_37833 ?auto_37834 ?auto_37835 )
      ( MAKE-8PILE ?auto_37832 ?auto_37833 ?auto_37834 ?auto_37835 ?auto_37836 ?auto_37837 ?auto_37838 ?auto_37839 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37848 - BLOCK
      ?auto_37849 - BLOCK
      ?auto_37850 - BLOCK
      ?auto_37851 - BLOCK
      ?auto_37852 - BLOCK
      ?auto_37853 - BLOCK
      ?auto_37854 - BLOCK
      ?auto_37855 - BLOCK
    )
    :vars
    (
      ?auto_37856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37855 ?auto_37856 ) ( ON-TABLE ?auto_37848 ) ( ON ?auto_37849 ?auto_37848 ) ( not ( = ?auto_37848 ?auto_37849 ) ) ( not ( = ?auto_37848 ?auto_37850 ) ) ( not ( = ?auto_37848 ?auto_37851 ) ) ( not ( = ?auto_37848 ?auto_37852 ) ) ( not ( = ?auto_37848 ?auto_37853 ) ) ( not ( = ?auto_37848 ?auto_37854 ) ) ( not ( = ?auto_37848 ?auto_37855 ) ) ( not ( = ?auto_37848 ?auto_37856 ) ) ( not ( = ?auto_37849 ?auto_37850 ) ) ( not ( = ?auto_37849 ?auto_37851 ) ) ( not ( = ?auto_37849 ?auto_37852 ) ) ( not ( = ?auto_37849 ?auto_37853 ) ) ( not ( = ?auto_37849 ?auto_37854 ) ) ( not ( = ?auto_37849 ?auto_37855 ) ) ( not ( = ?auto_37849 ?auto_37856 ) ) ( not ( = ?auto_37850 ?auto_37851 ) ) ( not ( = ?auto_37850 ?auto_37852 ) ) ( not ( = ?auto_37850 ?auto_37853 ) ) ( not ( = ?auto_37850 ?auto_37854 ) ) ( not ( = ?auto_37850 ?auto_37855 ) ) ( not ( = ?auto_37850 ?auto_37856 ) ) ( not ( = ?auto_37851 ?auto_37852 ) ) ( not ( = ?auto_37851 ?auto_37853 ) ) ( not ( = ?auto_37851 ?auto_37854 ) ) ( not ( = ?auto_37851 ?auto_37855 ) ) ( not ( = ?auto_37851 ?auto_37856 ) ) ( not ( = ?auto_37852 ?auto_37853 ) ) ( not ( = ?auto_37852 ?auto_37854 ) ) ( not ( = ?auto_37852 ?auto_37855 ) ) ( not ( = ?auto_37852 ?auto_37856 ) ) ( not ( = ?auto_37853 ?auto_37854 ) ) ( not ( = ?auto_37853 ?auto_37855 ) ) ( not ( = ?auto_37853 ?auto_37856 ) ) ( not ( = ?auto_37854 ?auto_37855 ) ) ( not ( = ?auto_37854 ?auto_37856 ) ) ( not ( = ?auto_37855 ?auto_37856 ) ) ( ON ?auto_37854 ?auto_37855 ) ( ON ?auto_37853 ?auto_37854 ) ( ON ?auto_37852 ?auto_37853 ) ( ON ?auto_37851 ?auto_37852 ) ( CLEAR ?auto_37849 ) ( ON ?auto_37850 ?auto_37851 ) ( CLEAR ?auto_37850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37848 ?auto_37849 ?auto_37850 )
      ( MAKE-8PILE ?auto_37848 ?auto_37849 ?auto_37850 ?auto_37851 ?auto_37852 ?auto_37853 ?auto_37854 ?auto_37855 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37865 - BLOCK
      ?auto_37866 - BLOCK
      ?auto_37867 - BLOCK
      ?auto_37868 - BLOCK
      ?auto_37869 - BLOCK
      ?auto_37870 - BLOCK
      ?auto_37871 - BLOCK
      ?auto_37872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37872 ) ( ON-TABLE ?auto_37865 ) ( ON ?auto_37866 ?auto_37865 ) ( not ( = ?auto_37865 ?auto_37866 ) ) ( not ( = ?auto_37865 ?auto_37867 ) ) ( not ( = ?auto_37865 ?auto_37868 ) ) ( not ( = ?auto_37865 ?auto_37869 ) ) ( not ( = ?auto_37865 ?auto_37870 ) ) ( not ( = ?auto_37865 ?auto_37871 ) ) ( not ( = ?auto_37865 ?auto_37872 ) ) ( not ( = ?auto_37866 ?auto_37867 ) ) ( not ( = ?auto_37866 ?auto_37868 ) ) ( not ( = ?auto_37866 ?auto_37869 ) ) ( not ( = ?auto_37866 ?auto_37870 ) ) ( not ( = ?auto_37866 ?auto_37871 ) ) ( not ( = ?auto_37866 ?auto_37872 ) ) ( not ( = ?auto_37867 ?auto_37868 ) ) ( not ( = ?auto_37867 ?auto_37869 ) ) ( not ( = ?auto_37867 ?auto_37870 ) ) ( not ( = ?auto_37867 ?auto_37871 ) ) ( not ( = ?auto_37867 ?auto_37872 ) ) ( not ( = ?auto_37868 ?auto_37869 ) ) ( not ( = ?auto_37868 ?auto_37870 ) ) ( not ( = ?auto_37868 ?auto_37871 ) ) ( not ( = ?auto_37868 ?auto_37872 ) ) ( not ( = ?auto_37869 ?auto_37870 ) ) ( not ( = ?auto_37869 ?auto_37871 ) ) ( not ( = ?auto_37869 ?auto_37872 ) ) ( not ( = ?auto_37870 ?auto_37871 ) ) ( not ( = ?auto_37870 ?auto_37872 ) ) ( not ( = ?auto_37871 ?auto_37872 ) ) ( ON ?auto_37871 ?auto_37872 ) ( ON ?auto_37870 ?auto_37871 ) ( ON ?auto_37869 ?auto_37870 ) ( ON ?auto_37868 ?auto_37869 ) ( CLEAR ?auto_37866 ) ( ON ?auto_37867 ?auto_37868 ) ( CLEAR ?auto_37867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37865 ?auto_37866 ?auto_37867 )
      ( MAKE-8PILE ?auto_37865 ?auto_37866 ?auto_37867 ?auto_37868 ?auto_37869 ?auto_37870 ?auto_37871 ?auto_37872 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37881 - BLOCK
      ?auto_37882 - BLOCK
      ?auto_37883 - BLOCK
      ?auto_37884 - BLOCK
      ?auto_37885 - BLOCK
      ?auto_37886 - BLOCK
      ?auto_37887 - BLOCK
      ?auto_37888 - BLOCK
    )
    :vars
    (
      ?auto_37889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37888 ?auto_37889 ) ( ON-TABLE ?auto_37881 ) ( not ( = ?auto_37881 ?auto_37882 ) ) ( not ( = ?auto_37881 ?auto_37883 ) ) ( not ( = ?auto_37881 ?auto_37884 ) ) ( not ( = ?auto_37881 ?auto_37885 ) ) ( not ( = ?auto_37881 ?auto_37886 ) ) ( not ( = ?auto_37881 ?auto_37887 ) ) ( not ( = ?auto_37881 ?auto_37888 ) ) ( not ( = ?auto_37881 ?auto_37889 ) ) ( not ( = ?auto_37882 ?auto_37883 ) ) ( not ( = ?auto_37882 ?auto_37884 ) ) ( not ( = ?auto_37882 ?auto_37885 ) ) ( not ( = ?auto_37882 ?auto_37886 ) ) ( not ( = ?auto_37882 ?auto_37887 ) ) ( not ( = ?auto_37882 ?auto_37888 ) ) ( not ( = ?auto_37882 ?auto_37889 ) ) ( not ( = ?auto_37883 ?auto_37884 ) ) ( not ( = ?auto_37883 ?auto_37885 ) ) ( not ( = ?auto_37883 ?auto_37886 ) ) ( not ( = ?auto_37883 ?auto_37887 ) ) ( not ( = ?auto_37883 ?auto_37888 ) ) ( not ( = ?auto_37883 ?auto_37889 ) ) ( not ( = ?auto_37884 ?auto_37885 ) ) ( not ( = ?auto_37884 ?auto_37886 ) ) ( not ( = ?auto_37884 ?auto_37887 ) ) ( not ( = ?auto_37884 ?auto_37888 ) ) ( not ( = ?auto_37884 ?auto_37889 ) ) ( not ( = ?auto_37885 ?auto_37886 ) ) ( not ( = ?auto_37885 ?auto_37887 ) ) ( not ( = ?auto_37885 ?auto_37888 ) ) ( not ( = ?auto_37885 ?auto_37889 ) ) ( not ( = ?auto_37886 ?auto_37887 ) ) ( not ( = ?auto_37886 ?auto_37888 ) ) ( not ( = ?auto_37886 ?auto_37889 ) ) ( not ( = ?auto_37887 ?auto_37888 ) ) ( not ( = ?auto_37887 ?auto_37889 ) ) ( not ( = ?auto_37888 ?auto_37889 ) ) ( ON ?auto_37887 ?auto_37888 ) ( ON ?auto_37886 ?auto_37887 ) ( ON ?auto_37885 ?auto_37886 ) ( ON ?auto_37884 ?auto_37885 ) ( ON ?auto_37883 ?auto_37884 ) ( CLEAR ?auto_37881 ) ( ON ?auto_37882 ?auto_37883 ) ( CLEAR ?auto_37882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37881 ?auto_37882 )
      ( MAKE-8PILE ?auto_37881 ?auto_37882 ?auto_37883 ?auto_37884 ?auto_37885 ?auto_37886 ?auto_37887 ?auto_37888 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37898 - BLOCK
      ?auto_37899 - BLOCK
      ?auto_37900 - BLOCK
      ?auto_37901 - BLOCK
      ?auto_37902 - BLOCK
      ?auto_37903 - BLOCK
      ?auto_37904 - BLOCK
      ?auto_37905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37905 ) ( ON-TABLE ?auto_37898 ) ( not ( = ?auto_37898 ?auto_37899 ) ) ( not ( = ?auto_37898 ?auto_37900 ) ) ( not ( = ?auto_37898 ?auto_37901 ) ) ( not ( = ?auto_37898 ?auto_37902 ) ) ( not ( = ?auto_37898 ?auto_37903 ) ) ( not ( = ?auto_37898 ?auto_37904 ) ) ( not ( = ?auto_37898 ?auto_37905 ) ) ( not ( = ?auto_37899 ?auto_37900 ) ) ( not ( = ?auto_37899 ?auto_37901 ) ) ( not ( = ?auto_37899 ?auto_37902 ) ) ( not ( = ?auto_37899 ?auto_37903 ) ) ( not ( = ?auto_37899 ?auto_37904 ) ) ( not ( = ?auto_37899 ?auto_37905 ) ) ( not ( = ?auto_37900 ?auto_37901 ) ) ( not ( = ?auto_37900 ?auto_37902 ) ) ( not ( = ?auto_37900 ?auto_37903 ) ) ( not ( = ?auto_37900 ?auto_37904 ) ) ( not ( = ?auto_37900 ?auto_37905 ) ) ( not ( = ?auto_37901 ?auto_37902 ) ) ( not ( = ?auto_37901 ?auto_37903 ) ) ( not ( = ?auto_37901 ?auto_37904 ) ) ( not ( = ?auto_37901 ?auto_37905 ) ) ( not ( = ?auto_37902 ?auto_37903 ) ) ( not ( = ?auto_37902 ?auto_37904 ) ) ( not ( = ?auto_37902 ?auto_37905 ) ) ( not ( = ?auto_37903 ?auto_37904 ) ) ( not ( = ?auto_37903 ?auto_37905 ) ) ( not ( = ?auto_37904 ?auto_37905 ) ) ( ON ?auto_37904 ?auto_37905 ) ( ON ?auto_37903 ?auto_37904 ) ( ON ?auto_37902 ?auto_37903 ) ( ON ?auto_37901 ?auto_37902 ) ( ON ?auto_37900 ?auto_37901 ) ( CLEAR ?auto_37898 ) ( ON ?auto_37899 ?auto_37900 ) ( CLEAR ?auto_37899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37898 ?auto_37899 )
      ( MAKE-8PILE ?auto_37898 ?auto_37899 ?auto_37900 ?auto_37901 ?auto_37902 ?auto_37903 ?auto_37904 ?auto_37905 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37914 - BLOCK
      ?auto_37915 - BLOCK
      ?auto_37916 - BLOCK
      ?auto_37917 - BLOCK
      ?auto_37918 - BLOCK
      ?auto_37919 - BLOCK
      ?auto_37920 - BLOCK
      ?auto_37921 - BLOCK
    )
    :vars
    (
      ?auto_37922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37921 ?auto_37922 ) ( not ( = ?auto_37914 ?auto_37915 ) ) ( not ( = ?auto_37914 ?auto_37916 ) ) ( not ( = ?auto_37914 ?auto_37917 ) ) ( not ( = ?auto_37914 ?auto_37918 ) ) ( not ( = ?auto_37914 ?auto_37919 ) ) ( not ( = ?auto_37914 ?auto_37920 ) ) ( not ( = ?auto_37914 ?auto_37921 ) ) ( not ( = ?auto_37914 ?auto_37922 ) ) ( not ( = ?auto_37915 ?auto_37916 ) ) ( not ( = ?auto_37915 ?auto_37917 ) ) ( not ( = ?auto_37915 ?auto_37918 ) ) ( not ( = ?auto_37915 ?auto_37919 ) ) ( not ( = ?auto_37915 ?auto_37920 ) ) ( not ( = ?auto_37915 ?auto_37921 ) ) ( not ( = ?auto_37915 ?auto_37922 ) ) ( not ( = ?auto_37916 ?auto_37917 ) ) ( not ( = ?auto_37916 ?auto_37918 ) ) ( not ( = ?auto_37916 ?auto_37919 ) ) ( not ( = ?auto_37916 ?auto_37920 ) ) ( not ( = ?auto_37916 ?auto_37921 ) ) ( not ( = ?auto_37916 ?auto_37922 ) ) ( not ( = ?auto_37917 ?auto_37918 ) ) ( not ( = ?auto_37917 ?auto_37919 ) ) ( not ( = ?auto_37917 ?auto_37920 ) ) ( not ( = ?auto_37917 ?auto_37921 ) ) ( not ( = ?auto_37917 ?auto_37922 ) ) ( not ( = ?auto_37918 ?auto_37919 ) ) ( not ( = ?auto_37918 ?auto_37920 ) ) ( not ( = ?auto_37918 ?auto_37921 ) ) ( not ( = ?auto_37918 ?auto_37922 ) ) ( not ( = ?auto_37919 ?auto_37920 ) ) ( not ( = ?auto_37919 ?auto_37921 ) ) ( not ( = ?auto_37919 ?auto_37922 ) ) ( not ( = ?auto_37920 ?auto_37921 ) ) ( not ( = ?auto_37920 ?auto_37922 ) ) ( not ( = ?auto_37921 ?auto_37922 ) ) ( ON ?auto_37920 ?auto_37921 ) ( ON ?auto_37919 ?auto_37920 ) ( ON ?auto_37918 ?auto_37919 ) ( ON ?auto_37917 ?auto_37918 ) ( ON ?auto_37916 ?auto_37917 ) ( ON ?auto_37915 ?auto_37916 ) ( ON ?auto_37914 ?auto_37915 ) ( CLEAR ?auto_37914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37914 )
      ( MAKE-8PILE ?auto_37914 ?auto_37915 ?auto_37916 ?auto_37917 ?auto_37918 ?auto_37919 ?auto_37920 ?auto_37921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37931 - BLOCK
      ?auto_37932 - BLOCK
      ?auto_37933 - BLOCK
      ?auto_37934 - BLOCK
      ?auto_37935 - BLOCK
      ?auto_37936 - BLOCK
      ?auto_37937 - BLOCK
      ?auto_37938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37938 ) ( not ( = ?auto_37931 ?auto_37932 ) ) ( not ( = ?auto_37931 ?auto_37933 ) ) ( not ( = ?auto_37931 ?auto_37934 ) ) ( not ( = ?auto_37931 ?auto_37935 ) ) ( not ( = ?auto_37931 ?auto_37936 ) ) ( not ( = ?auto_37931 ?auto_37937 ) ) ( not ( = ?auto_37931 ?auto_37938 ) ) ( not ( = ?auto_37932 ?auto_37933 ) ) ( not ( = ?auto_37932 ?auto_37934 ) ) ( not ( = ?auto_37932 ?auto_37935 ) ) ( not ( = ?auto_37932 ?auto_37936 ) ) ( not ( = ?auto_37932 ?auto_37937 ) ) ( not ( = ?auto_37932 ?auto_37938 ) ) ( not ( = ?auto_37933 ?auto_37934 ) ) ( not ( = ?auto_37933 ?auto_37935 ) ) ( not ( = ?auto_37933 ?auto_37936 ) ) ( not ( = ?auto_37933 ?auto_37937 ) ) ( not ( = ?auto_37933 ?auto_37938 ) ) ( not ( = ?auto_37934 ?auto_37935 ) ) ( not ( = ?auto_37934 ?auto_37936 ) ) ( not ( = ?auto_37934 ?auto_37937 ) ) ( not ( = ?auto_37934 ?auto_37938 ) ) ( not ( = ?auto_37935 ?auto_37936 ) ) ( not ( = ?auto_37935 ?auto_37937 ) ) ( not ( = ?auto_37935 ?auto_37938 ) ) ( not ( = ?auto_37936 ?auto_37937 ) ) ( not ( = ?auto_37936 ?auto_37938 ) ) ( not ( = ?auto_37937 ?auto_37938 ) ) ( ON ?auto_37937 ?auto_37938 ) ( ON ?auto_37936 ?auto_37937 ) ( ON ?auto_37935 ?auto_37936 ) ( ON ?auto_37934 ?auto_37935 ) ( ON ?auto_37933 ?auto_37934 ) ( ON ?auto_37932 ?auto_37933 ) ( ON ?auto_37931 ?auto_37932 ) ( CLEAR ?auto_37931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37931 )
      ( MAKE-8PILE ?auto_37931 ?auto_37932 ?auto_37933 ?auto_37934 ?auto_37935 ?auto_37936 ?auto_37937 ?auto_37938 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37947 - BLOCK
      ?auto_37948 - BLOCK
      ?auto_37949 - BLOCK
      ?auto_37950 - BLOCK
      ?auto_37951 - BLOCK
      ?auto_37952 - BLOCK
      ?auto_37953 - BLOCK
      ?auto_37954 - BLOCK
    )
    :vars
    (
      ?auto_37955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37947 ?auto_37948 ) ) ( not ( = ?auto_37947 ?auto_37949 ) ) ( not ( = ?auto_37947 ?auto_37950 ) ) ( not ( = ?auto_37947 ?auto_37951 ) ) ( not ( = ?auto_37947 ?auto_37952 ) ) ( not ( = ?auto_37947 ?auto_37953 ) ) ( not ( = ?auto_37947 ?auto_37954 ) ) ( not ( = ?auto_37948 ?auto_37949 ) ) ( not ( = ?auto_37948 ?auto_37950 ) ) ( not ( = ?auto_37948 ?auto_37951 ) ) ( not ( = ?auto_37948 ?auto_37952 ) ) ( not ( = ?auto_37948 ?auto_37953 ) ) ( not ( = ?auto_37948 ?auto_37954 ) ) ( not ( = ?auto_37949 ?auto_37950 ) ) ( not ( = ?auto_37949 ?auto_37951 ) ) ( not ( = ?auto_37949 ?auto_37952 ) ) ( not ( = ?auto_37949 ?auto_37953 ) ) ( not ( = ?auto_37949 ?auto_37954 ) ) ( not ( = ?auto_37950 ?auto_37951 ) ) ( not ( = ?auto_37950 ?auto_37952 ) ) ( not ( = ?auto_37950 ?auto_37953 ) ) ( not ( = ?auto_37950 ?auto_37954 ) ) ( not ( = ?auto_37951 ?auto_37952 ) ) ( not ( = ?auto_37951 ?auto_37953 ) ) ( not ( = ?auto_37951 ?auto_37954 ) ) ( not ( = ?auto_37952 ?auto_37953 ) ) ( not ( = ?auto_37952 ?auto_37954 ) ) ( not ( = ?auto_37953 ?auto_37954 ) ) ( ON ?auto_37947 ?auto_37955 ) ( not ( = ?auto_37954 ?auto_37955 ) ) ( not ( = ?auto_37953 ?auto_37955 ) ) ( not ( = ?auto_37952 ?auto_37955 ) ) ( not ( = ?auto_37951 ?auto_37955 ) ) ( not ( = ?auto_37950 ?auto_37955 ) ) ( not ( = ?auto_37949 ?auto_37955 ) ) ( not ( = ?auto_37948 ?auto_37955 ) ) ( not ( = ?auto_37947 ?auto_37955 ) ) ( ON ?auto_37948 ?auto_37947 ) ( ON ?auto_37949 ?auto_37948 ) ( ON ?auto_37950 ?auto_37949 ) ( ON ?auto_37951 ?auto_37950 ) ( ON ?auto_37952 ?auto_37951 ) ( ON ?auto_37953 ?auto_37952 ) ( ON ?auto_37954 ?auto_37953 ) ( CLEAR ?auto_37954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_37954 ?auto_37953 ?auto_37952 ?auto_37951 ?auto_37950 ?auto_37949 ?auto_37948 ?auto_37947 )
      ( MAKE-8PILE ?auto_37947 ?auto_37948 ?auto_37949 ?auto_37950 ?auto_37951 ?auto_37952 ?auto_37953 ?auto_37954 ) )
  )

)

