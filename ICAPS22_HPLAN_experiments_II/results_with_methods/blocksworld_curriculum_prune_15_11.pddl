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
      ?auto_417997 - BLOCK
    )
    :vars
    (
      ?auto_417998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_417997 ?auto_417998 ) ( CLEAR ?auto_417997 ) ( HAND-EMPTY ) ( not ( = ?auto_417997 ?auto_417998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_417997 ?auto_417998 )
      ( !PUTDOWN ?auto_417997 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_418004 - BLOCK
      ?auto_418005 - BLOCK
    )
    :vars
    (
      ?auto_418006 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_418004 ) ( ON ?auto_418005 ?auto_418006 ) ( CLEAR ?auto_418005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_418004 ) ( not ( = ?auto_418004 ?auto_418005 ) ) ( not ( = ?auto_418004 ?auto_418006 ) ) ( not ( = ?auto_418005 ?auto_418006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_418005 ?auto_418006 )
      ( !STACK ?auto_418005 ?auto_418004 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_418014 - BLOCK
      ?auto_418015 - BLOCK
    )
    :vars
    (
      ?auto_418016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418015 ?auto_418016 ) ( not ( = ?auto_418014 ?auto_418015 ) ) ( not ( = ?auto_418014 ?auto_418016 ) ) ( not ( = ?auto_418015 ?auto_418016 ) ) ( ON ?auto_418014 ?auto_418015 ) ( CLEAR ?auto_418014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_418014 )
      ( MAKE-2PILE ?auto_418014 ?auto_418015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_418025 - BLOCK
      ?auto_418026 - BLOCK
      ?auto_418027 - BLOCK
    )
    :vars
    (
      ?auto_418028 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_418026 ) ( ON ?auto_418027 ?auto_418028 ) ( CLEAR ?auto_418027 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_418025 ) ( ON ?auto_418026 ?auto_418025 ) ( not ( = ?auto_418025 ?auto_418026 ) ) ( not ( = ?auto_418025 ?auto_418027 ) ) ( not ( = ?auto_418025 ?auto_418028 ) ) ( not ( = ?auto_418026 ?auto_418027 ) ) ( not ( = ?auto_418026 ?auto_418028 ) ) ( not ( = ?auto_418027 ?auto_418028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_418027 ?auto_418028 )
      ( !STACK ?auto_418027 ?auto_418026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_418039 - BLOCK
      ?auto_418040 - BLOCK
      ?auto_418041 - BLOCK
    )
    :vars
    (
      ?auto_418042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418041 ?auto_418042 ) ( ON-TABLE ?auto_418039 ) ( not ( = ?auto_418039 ?auto_418040 ) ) ( not ( = ?auto_418039 ?auto_418041 ) ) ( not ( = ?auto_418039 ?auto_418042 ) ) ( not ( = ?auto_418040 ?auto_418041 ) ) ( not ( = ?auto_418040 ?auto_418042 ) ) ( not ( = ?auto_418041 ?auto_418042 ) ) ( CLEAR ?auto_418039 ) ( ON ?auto_418040 ?auto_418041 ) ( CLEAR ?auto_418040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_418039 ?auto_418040 )
      ( MAKE-3PILE ?auto_418039 ?auto_418040 ?auto_418041 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_418053 - BLOCK
      ?auto_418054 - BLOCK
      ?auto_418055 - BLOCK
    )
    :vars
    (
      ?auto_418056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418055 ?auto_418056 ) ( not ( = ?auto_418053 ?auto_418054 ) ) ( not ( = ?auto_418053 ?auto_418055 ) ) ( not ( = ?auto_418053 ?auto_418056 ) ) ( not ( = ?auto_418054 ?auto_418055 ) ) ( not ( = ?auto_418054 ?auto_418056 ) ) ( not ( = ?auto_418055 ?auto_418056 ) ) ( ON ?auto_418054 ?auto_418055 ) ( ON ?auto_418053 ?auto_418054 ) ( CLEAR ?auto_418053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_418053 )
      ( MAKE-3PILE ?auto_418053 ?auto_418054 ?auto_418055 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_418068 - BLOCK
      ?auto_418069 - BLOCK
      ?auto_418070 - BLOCK
      ?auto_418071 - BLOCK
    )
    :vars
    (
      ?auto_418072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_418070 ) ( ON ?auto_418071 ?auto_418072 ) ( CLEAR ?auto_418071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_418068 ) ( ON ?auto_418069 ?auto_418068 ) ( ON ?auto_418070 ?auto_418069 ) ( not ( = ?auto_418068 ?auto_418069 ) ) ( not ( = ?auto_418068 ?auto_418070 ) ) ( not ( = ?auto_418068 ?auto_418071 ) ) ( not ( = ?auto_418068 ?auto_418072 ) ) ( not ( = ?auto_418069 ?auto_418070 ) ) ( not ( = ?auto_418069 ?auto_418071 ) ) ( not ( = ?auto_418069 ?auto_418072 ) ) ( not ( = ?auto_418070 ?auto_418071 ) ) ( not ( = ?auto_418070 ?auto_418072 ) ) ( not ( = ?auto_418071 ?auto_418072 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_418071 ?auto_418072 )
      ( !STACK ?auto_418071 ?auto_418070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_418086 - BLOCK
      ?auto_418087 - BLOCK
      ?auto_418088 - BLOCK
      ?auto_418089 - BLOCK
    )
    :vars
    (
      ?auto_418090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418089 ?auto_418090 ) ( ON-TABLE ?auto_418086 ) ( ON ?auto_418087 ?auto_418086 ) ( not ( = ?auto_418086 ?auto_418087 ) ) ( not ( = ?auto_418086 ?auto_418088 ) ) ( not ( = ?auto_418086 ?auto_418089 ) ) ( not ( = ?auto_418086 ?auto_418090 ) ) ( not ( = ?auto_418087 ?auto_418088 ) ) ( not ( = ?auto_418087 ?auto_418089 ) ) ( not ( = ?auto_418087 ?auto_418090 ) ) ( not ( = ?auto_418088 ?auto_418089 ) ) ( not ( = ?auto_418088 ?auto_418090 ) ) ( not ( = ?auto_418089 ?auto_418090 ) ) ( CLEAR ?auto_418087 ) ( ON ?auto_418088 ?auto_418089 ) ( CLEAR ?auto_418088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_418086 ?auto_418087 ?auto_418088 )
      ( MAKE-4PILE ?auto_418086 ?auto_418087 ?auto_418088 ?auto_418089 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_418104 - BLOCK
      ?auto_418105 - BLOCK
      ?auto_418106 - BLOCK
      ?auto_418107 - BLOCK
    )
    :vars
    (
      ?auto_418108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418107 ?auto_418108 ) ( ON-TABLE ?auto_418104 ) ( not ( = ?auto_418104 ?auto_418105 ) ) ( not ( = ?auto_418104 ?auto_418106 ) ) ( not ( = ?auto_418104 ?auto_418107 ) ) ( not ( = ?auto_418104 ?auto_418108 ) ) ( not ( = ?auto_418105 ?auto_418106 ) ) ( not ( = ?auto_418105 ?auto_418107 ) ) ( not ( = ?auto_418105 ?auto_418108 ) ) ( not ( = ?auto_418106 ?auto_418107 ) ) ( not ( = ?auto_418106 ?auto_418108 ) ) ( not ( = ?auto_418107 ?auto_418108 ) ) ( ON ?auto_418106 ?auto_418107 ) ( CLEAR ?auto_418104 ) ( ON ?auto_418105 ?auto_418106 ) ( CLEAR ?auto_418105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_418104 ?auto_418105 )
      ( MAKE-4PILE ?auto_418104 ?auto_418105 ?auto_418106 ?auto_418107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_418122 - BLOCK
      ?auto_418123 - BLOCK
      ?auto_418124 - BLOCK
      ?auto_418125 - BLOCK
    )
    :vars
    (
      ?auto_418126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418125 ?auto_418126 ) ( not ( = ?auto_418122 ?auto_418123 ) ) ( not ( = ?auto_418122 ?auto_418124 ) ) ( not ( = ?auto_418122 ?auto_418125 ) ) ( not ( = ?auto_418122 ?auto_418126 ) ) ( not ( = ?auto_418123 ?auto_418124 ) ) ( not ( = ?auto_418123 ?auto_418125 ) ) ( not ( = ?auto_418123 ?auto_418126 ) ) ( not ( = ?auto_418124 ?auto_418125 ) ) ( not ( = ?auto_418124 ?auto_418126 ) ) ( not ( = ?auto_418125 ?auto_418126 ) ) ( ON ?auto_418124 ?auto_418125 ) ( ON ?auto_418123 ?auto_418124 ) ( ON ?auto_418122 ?auto_418123 ) ( CLEAR ?auto_418122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_418122 )
      ( MAKE-4PILE ?auto_418122 ?auto_418123 ?auto_418124 ?auto_418125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_418141 - BLOCK
      ?auto_418142 - BLOCK
      ?auto_418143 - BLOCK
      ?auto_418144 - BLOCK
      ?auto_418145 - BLOCK
    )
    :vars
    (
      ?auto_418146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_418144 ) ( ON ?auto_418145 ?auto_418146 ) ( CLEAR ?auto_418145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_418141 ) ( ON ?auto_418142 ?auto_418141 ) ( ON ?auto_418143 ?auto_418142 ) ( ON ?auto_418144 ?auto_418143 ) ( not ( = ?auto_418141 ?auto_418142 ) ) ( not ( = ?auto_418141 ?auto_418143 ) ) ( not ( = ?auto_418141 ?auto_418144 ) ) ( not ( = ?auto_418141 ?auto_418145 ) ) ( not ( = ?auto_418141 ?auto_418146 ) ) ( not ( = ?auto_418142 ?auto_418143 ) ) ( not ( = ?auto_418142 ?auto_418144 ) ) ( not ( = ?auto_418142 ?auto_418145 ) ) ( not ( = ?auto_418142 ?auto_418146 ) ) ( not ( = ?auto_418143 ?auto_418144 ) ) ( not ( = ?auto_418143 ?auto_418145 ) ) ( not ( = ?auto_418143 ?auto_418146 ) ) ( not ( = ?auto_418144 ?auto_418145 ) ) ( not ( = ?auto_418144 ?auto_418146 ) ) ( not ( = ?auto_418145 ?auto_418146 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_418145 ?auto_418146 )
      ( !STACK ?auto_418145 ?auto_418144 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_418163 - BLOCK
      ?auto_418164 - BLOCK
      ?auto_418165 - BLOCK
      ?auto_418166 - BLOCK
      ?auto_418167 - BLOCK
    )
    :vars
    (
      ?auto_418168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418167 ?auto_418168 ) ( ON-TABLE ?auto_418163 ) ( ON ?auto_418164 ?auto_418163 ) ( ON ?auto_418165 ?auto_418164 ) ( not ( = ?auto_418163 ?auto_418164 ) ) ( not ( = ?auto_418163 ?auto_418165 ) ) ( not ( = ?auto_418163 ?auto_418166 ) ) ( not ( = ?auto_418163 ?auto_418167 ) ) ( not ( = ?auto_418163 ?auto_418168 ) ) ( not ( = ?auto_418164 ?auto_418165 ) ) ( not ( = ?auto_418164 ?auto_418166 ) ) ( not ( = ?auto_418164 ?auto_418167 ) ) ( not ( = ?auto_418164 ?auto_418168 ) ) ( not ( = ?auto_418165 ?auto_418166 ) ) ( not ( = ?auto_418165 ?auto_418167 ) ) ( not ( = ?auto_418165 ?auto_418168 ) ) ( not ( = ?auto_418166 ?auto_418167 ) ) ( not ( = ?auto_418166 ?auto_418168 ) ) ( not ( = ?auto_418167 ?auto_418168 ) ) ( CLEAR ?auto_418165 ) ( ON ?auto_418166 ?auto_418167 ) ( CLEAR ?auto_418166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_418163 ?auto_418164 ?auto_418165 ?auto_418166 )
      ( MAKE-5PILE ?auto_418163 ?auto_418164 ?auto_418165 ?auto_418166 ?auto_418167 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_418185 - BLOCK
      ?auto_418186 - BLOCK
      ?auto_418187 - BLOCK
      ?auto_418188 - BLOCK
      ?auto_418189 - BLOCK
    )
    :vars
    (
      ?auto_418190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418189 ?auto_418190 ) ( ON-TABLE ?auto_418185 ) ( ON ?auto_418186 ?auto_418185 ) ( not ( = ?auto_418185 ?auto_418186 ) ) ( not ( = ?auto_418185 ?auto_418187 ) ) ( not ( = ?auto_418185 ?auto_418188 ) ) ( not ( = ?auto_418185 ?auto_418189 ) ) ( not ( = ?auto_418185 ?auto_418190 ) ) ( not ( = ?auto_418186 ?auto_418187 ) ) ( not ( = ?auto_418186 ?auto_418188 ) ) ( not ( = ?auto_418186 ?auto_418189 ) ) ( not ( = ?auto_418186 ?auto_418190 ) ) ( not ( = ?auto_418187 ?auto_418188 ) ) ( not ( = ?auto_418187 ?auto_418189 ) ) ( not ( = ?auto_418187 ?auto_418190 ) ) ( not ( = ?auto_418188 ?auto_418189 ) ) ( not ( = ?auto_418188 ?auto_418190 ) ) ( not ( = ?auto_418189 ?auto_418190 ) ) ( ON ?auto_418188 ?auto_418189 ) ( CLEAR ?auto_418186 ) ( ON ?auto_418187 ?auto_418188 ) ( CLEAR ?auto_418187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_418185 ?auto_418186 ?auto_418187 )
      ( MAKE-5PILE ?auto_418185 ?auto_418186 ?auto_418187 ?auto_418188 ?auto_418189 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_418207 - BLOCK
      ?auto_418208 - BLOCK
      ?auto_418209 - BLOCK
      ?auto_418210 - BLOCK
      ?auto_418211 - BLOCK
    )
    :vars
    (
      ?auto_418212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418211 ?auto_418212 ) ( ON-TABLE ?auto_418207 ) ( not ( = ?auto_418207 ?auto_418208 ) ) ( not ( = ?auto_418207 ?auto_418209 ) ) ( not ( = ?auto_418207 ?auto_418210 ) ) ( not ( = ?auto_418207 ?auto_418211 ) ) ( not ( = ?auto_418207 ?auto_418212 ) ) ( not ( = ?auto_418208 ?auto_418209 ) ) ( not ( = ?auto_418208 ?auto_418210 ) ) ( not ( = ?auto_418208 ?auto_418211 ) ) ( not ( = ?auto_418208 ?auto_418212 ) ) ( not ( = ?auto_418209 ?auto_418210 ) ) ( not ( = ?auto_418209 ?auto_418211 ) ) ( not ( = ?auto_418209 ?auto_418212 ) ) ( not ( = ?auto_418210 ?auto_418211 ) ) ( not ( = ?auto_418210 ?auto_418212 ) ) ( not ( = ?auto_418211 ?auto_418212 ) ) ( ON ?auto_418210 ?auto_418211 ) ( ON ?auto_418209 ?auto_418210 ) ( CLEAR ?auto_418207 ) ( ON ?auto_418208 ?auto_418209 ) ( CLEAR ?auto_418208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_418207 ?auto_418208 )
      ( MAKE-5PILE ?auto_418207 ?auto_418208 ?auto_418209 ?auto_418210 ?auto_418211 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_418229 - BLOCK
      ?auto_418230 - BLOCK
      ?auto_418231 - BLOCK
      ?auto_418232 - BLOCK
      ?auto_418233 - BLOCK
    )
    :vars
    (
      ?auto_418234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418233 ?auto_418234 ) ( not ( = ?auto_418229 ?auto_418230 ) ) ( not ( = ?auto_418229 ?auto_418231 ) ) ( not ( = ?auto_418229 ?auto_418232 ) ) ( not ( = ?auto_418229 ?auto_418233 ) ) ( not ( = ?auto_418229 ?auto_418234 ) ) ( not ( = ?auto_418230 ?auto_418231 ) ) ( not ( = ?auto_418230 ?auto_418232 ) ) ( not ( = ?auto_418230 ?auto_418233 ) ) ( not ( = ?auto_418230 ?auto_418234 ) ) ( not ( = ?auto_418231 ?auto_418232 ) ) ( not ( = ?auto_418231 ?auto_418233 ) ) ( not ( = ?auto_418231 ?auto_418234 ) ) ( not ( = ?auto_418232 ?auto_418233 ) ) ( not ( = ?auto_418232 ?auto_418234 ) ) ( not ( = ?auto_418233 ?auto_418234 ) ) ( ON ?auto_418232 ?auto_418233 ) ( ON ?auto_418231 ?auto_418232 ) ( ON ?auto_418230 ?auto_418231 ) ( ON ?auto_418229 ?auto_418230 ) ( CLEAR ?auto_418229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_418229 )
      ( MAKE-5PILE ?auto_418229 ?auto_418230 ?auto_418231 ?auto_418232 ?auto_418233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_418252 - BLOCK
      ?auto_418253 - BLOCK
      ?auto_418254 - BLOCK
      ?auto_418255 - BLOCK
      ?auto_418256 - BLOCK
      ?auto_418257 - BLOCK
    )
    :vars
    (
      ?auto_418258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_418256 ) ( ON ?auto_418257 ?auto_418258 ) ( CLEAR ?auto_418257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_418252 ) ( ON ?auto_418253 ?auto_418252 ) ( ON ?auto_418254 ?auto_418253 ) ( ON ?auto_418255 ?auto_418254 ) ( ON ?auto_418256 ?auto_418255 ) ( not ( = ?auto_418252 ?auto_418253 ) ) ( not ( = ?auto_418252 ?auto_418254 ) ) ( not ( = ?auto_418252 ?auto_418255 ) ) ( not ( = ?auto_418252 ?auto_418256 ) ) ( not ( = ?auto_418252 ?auto_418257 ) ) ( not ( = ?auto_418252 ?auto_418258 ) ) ( not ( = ?auto_418253 ?auto_418254 ) ) ( not ( = ?auto_418253 ?auto_418255 ) ) ( not ( = ?auto_418253 ?auto_418256 ) ) ( not ( = ?auto_418253 ?auto_418257 ) ) ( not ( = ?auto_418253 ?auto_418258 ) ) ( not ( = ?auto_418254 ?auto_418255 ) ) ( not ( = ?auto_418254 ?auto_418256 ) ) ( not ( = ?auto_418254 ?auto_418257 ) ) ( not ( = ?auto_418254 ?auto_418258 ) ) ( not ( = ?auto_418255 ?auto_418256 ) ) ( not ( = ?auto_418255 ?auto_418257 ) ) ( not ( = ?auto_418255 ?auto_418258 ) ) ( not ( = ?auto_418256 ?auto_418257 ) ) ( not ( = ?auto_418256 ?auto_418258 ) ) ( not ( = ?auto_418257 ?auto_418258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_418257 ?auto_418258 )
      ( !STACK ?auto_418257 ?auto_418256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_418278 - BLOCK
      ?auto_418279 - BLOCK
      ?auto_418280 - BLOCK
      ?auto_418281 - BLOCK
      ?auto_418282 - BLOCK
      ?auto_418283 - BLOCK
    )
    :vars
    (
      ?auto_418284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418283 ?auto_418284 ) ( ON-TABLE ?auto_418278 ) ( ON ?auto_418279 ?auto_418278 ) ( ON ?auto_418280 ?auto_418279 ) ( ON ?auto_418281 ?auto_418280 ) ( not ( = ?auto_418278 ?auto_418279 ) ) ( not ( = ?auto_418278 ?auto_418280 ) ) ( not ( = ?auto_418278 ?auto_418281 ) ) ( not ( = ?auto_418278 ?auto_418282 ) ) ( not ( = ?auto_418278 ?auto_418283 ) ) ( not ( = ?auto_418278 ?auto_418284 ) ) ( not ( = ?auto_418279 ?auto_418280 ) ) ( not ( = ?auto_418279 ?auto_418281 ) ) ( not ( = ?auto_418279 ?auto_418282 ) ) ( not ( = ?auto_418279 ?auto_418283 ) ) ( not ( = ?auto_418279 ?auto_418284 ) ) ( not ( = ?auto_418280 ?auto_418281 ) ) ( not ( = ?auto_418280 ?auto_418282 ) ) ( not ( = ?auto_418280 ?auto_418283 ) ) ( not ( = ?auto_418280 ?auto_418284 ) ) ( not ( = ?auto_418281 ?auto_418282 ) ) ( not ( = ?auto_418281 ?auto_418283 ) ) ( not ( = ?auto_418281 ?auto_418284 ) ) ( not ( = ?auto_418282 ?auto_418283 ) ) ( not ( = ?auto_418282 ?auto_418284 ) ) ( not ( = ?auto_418283 ?auto_418284 ) ) ( CLEAR ?auto_418281 ) ( ON ?auto_418282 ?auto_418283 ) ( CLEAR ?auto_418282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_418278 ?auto_418279 ?auto_418280 ?auto_418281 ?auto_418282 )
      ( MAKE-6PILE ?auto_418278 ?auto_418279 ?auto_418280 ?auto_418281 ?auto_418282 ?auto_418283 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_418304 - BLOCK
      ?auto_418305 - BLOCK
      ?auto_418306 - BLOCK
      ?auto_418307 - BLOCK
      ?auto_418308 - BLOCK
      ?auto_418309 - BLOCK
    )
    :vars
    (
      ?auto_418310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418309 ?auto_418310 ) ( ON-TABLE ?auto_418304 ) ( ON ?auto_418305 ?auto_418304 ) ( ON ?auto_418306 ?auto_418305 ) ( not ( = ?auto_418304 ?auto_418305 ) ) ( not ( = ?auto_418304 ?auto_418306 ) ) ( not ( = ?auto_418304 ?auto_418307 ) ) ( not ( = ?auto_418304 ?auto_418308 ) ) ( not ( = ?auto_418304 ?auto_418309 ) ) ( not ( = ?auto_418304 ?auto_418310 ) ) ( not ( = ?auto_418305 ?auto_418306 ) ) ( not ( = ?auto_418305 ?auto_418307 ) ) ( not ( = ?auto_418305 ?auto_418308 ) ) ( not ( = ?auto_418305 ?auto_418309 ) ) ( not ( = ?auto_418305 ?auto_418310 ) ) ( not ( = ?auto_418306 ?auto_418307 ) ) ( not ( = ?auto_418306 ?auto_418308 ) ) ( not ( = ?auto_418306 ?auto_418309 ) ) ( not ( = ?auto_418306 ?auto_418310 ) ) ( not ( = ?auto_418307 ?auto_418308 ) ) ( not ( = ?auto_418307 ?auto_418309 ) ) ( not ( = ?auto_418307 ?auto_418310 ) ) ( not ( = ?auto_418308 ?auto_418309 ) ) ( not ( = ?auto_418308 ?auto_418310 ) ) ( not ( = ?auto_418309 ?auto_418310 ) ) ( ON ?auto_418308 ?auto_418309 ) ( CLEAR ?auto_418306 ) ( ON ?auto_418307 ?auto_418308 ) ( CLEAR ?auto_418307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_418304 ?auto_418305 ?auto_418306 ?auto_418307 )
      ( MAKE-6PILE ?auto_418304 ?auto_418305 ?auto_418306 ?auto_418307 ?auto_418308 ?auto_418309 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_418330 - BLOCK
      ?auto_418331 - BLOCK
      ?auto_418332 - BLOCK
      ?auto_418333 - BLOCK
      ?auto_418334 - BLOCK
      ?auto_418335 - BLOCK
    )
    :vars
    (
      ?auto_418336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418335 ?auto_418336 ) ( ON-TABLE ?auto_418330 ) ( ON ?auto_418331 ?auto_418330 ) ( not ( = ?auto_418330 ?auto_418331 ) ) ( not ( = ?auto_418330 ?auto_418332 ) ) ( not ( = ?auto_418330 ?auto_418333 ) ) ( not ( = ?auto_418330 ?auto_418334 ) ) ( not ( = ?auto_418330 ?auto_418335 ) ) ( not ( = ?auto_418330 ?auto_418336 ) ) ( not ( = ?auto_418331 ?auto_418332 ) ) ( not ( = ?auto_418331 ?auto_418333 ) ) ( not ( = ?auto_418331 ?auto_418334 ) ) ( not ( = ?auto_418331 ?auto_418335 ) ) ( not ( = ?auto_418331 ?auto_418336 ) ) ( not ( = ?auto_418332 ?auto_418333 ) ) ( not ( = ?auto_418332 ?auto_418334 ) ) ( not ( = ?auto_418332 ?auto_418335 ) ) ( not ( = ?auto_418332 ?auto_418336 ) ) ( not ( = ?auto_418333 ?auto_418334 ) ) ( not ( = ?auto_418333 ?auto_418335 ) ) ( not ( = ?auto_418333 ?auto_418336 ) ) ( not ( = ?auto_418334 ?auto_418335 ) ) ( not ( = ?auto_418334 ?auto_418336 ) ) ( not ( = ?auto_418335 ?auto_418336 ) ) ( ON ?auto_418334 ?auto_418335 ) ( ON ?auto_418333 ?auto_418334 ) ( CLEAR ?auto_418331 ) ( ON ?auto_418332 ?auto_418333 ) ( CLEAR ?auto_418332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_418330 ?auto_418331 ?auto_418332 )
      ( MAKE-6PILE ?auto_418330 ?auto_418331 ?auto_418332 ?auto_418333 ?auto_418334 ?auto_418335 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_418356 - BLOCK
      ?auto_418357 - BLOCK
      ?auto_418358 - BLOCK
      ?auto_418359 - BLOCK
      ?auto_418360 - BLOCK
      ?auto_418361 - BLOCK
    )
    :vars
    (
      ?auto_418362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418361 ?auto_418362 ) ( ON-TABLE ?auto_418356 ) ( not ( = ?auto_418356 ?auto_418357 ) ) ( not ( = ?auto_418356 ?auto_418358 ) ) ( not ( = ?auto_418356 ?auto_418359 ) ) ( not ( = ?auto_418356 ?auto_418360 ) ) ( not ( = ?auto_418356 ?auto_418361 ) ) ( not ( = ?auto_418356 ?auto_418362 ) ) ( not ( = ?auto_418357 ?auto_418358 ) ) ( not ( = ?auto_418357 ?auto_418359 ) ) ( not ( = ?auto_418357 ?auto_418360 ) ) ( not ( = ?auto_418357 ?auto_418361 ) ) ( not ( = ?auto_418357 ?auto_418362 ) ) ( not ( = ?auto_418358 ?auto_418359 ) ) ( not ( = ?auto_418358 ?auto_418360 ) ) ( not ( = ?auto_418358 ?auto_418361 ) ) ( not ( = ?auto_418358 ?auto_418362 ) ) ( not ( = ?auto_418359 ?auto_418360 ) ) ( not ( = ?auto_418359 ?auto_418361 ) ) ( not ( = ?auto_418359 ?auto_418362 ) ) ( not ( = ?auto_418360 ?auto_418361 ) ) ( not ( = ?auto_418360 ?auto_418362 ) ) ( not ( = ?auto_418361 ?auto_418362 ) ) ( ON ?auto_418360 ?auto_418361 ) ( ON ?auto_418359 ?auto_418360 ) ( ON ?auto_418358 ?auto_418359 ) ( CLEAR ?auto_418356 ) ( ON ?auto_418357 ?auto_418358 ) ( CLEAR ?auto_418357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_418356 ?auto_418357 )
      ( MAKE-6PILE ?auto_418356 ?auto_418357 ?auto_418358 ?auto_418359 ?auto_418360 ?auto_418361 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_418382 - BLOCK
      ?auto_418383 - BLOCK
      ?auto_418384 - BLOCK
      ?auto_418385 - BLOCK
      ?auto_418386 - BLOCK
      ?auto_418387 - BLOCK
    )
    :vars
    (
      ?auto_418388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418387 ?auto_418388 ) ( not ( = ?auto_418382 ?auto_418383 ) ) ( not ( = ?auto_418382 ?auto_418384 ) ) ( not ( = ?auto_418382 ?auto_418385 ) ) ( not ( = ?auto_418382 ?auto_418386 ) ) ( not ( = ?auto_418382 ?auto_418387 ) ) ( not ( = ?auto_418382 ?auto_418388 ) ) ( not ( = ?auto_418383 ?auto_418384 ) ) ( not ( = ?auto_418383 ?auto_418385 ) ) ( not ( = ?auto_418383 ?auto_418386 ) ) ( not ( = ?auto_418383 ?auto_418387 ) ) ( not ( = ?auto_418383 ?auto_418388 ) ) ( not ( = ?auto_418384 ?auto_418385 ) ) ( not ( = ?auto_418384 ?auto_418386 ) ) ( not ( = ?auto_418384 ?auto_418387 ) ) ( not ( = ?auto_418384 ?auto_418388 ) ) ( not ( = ?auto_418385 ?auto_418386 ) ) ( not ( = ?auto_418385 ?auto_418387 ) ) ( not ( = ?auto_418385 ?auto_418388 ) ) ( not ( = ?auto_418386 ?auto_418387 ) ) ( not ( = ?auto_418386 ?auto_418388 ) ) ( not ( = ?auto_418387 ?auto_418388 ) ) ( ON ?auto_418386 ?auto_418387 ) ( ON ?auto_418385 ?auto_418386 ) ( ON ?auto_418384 ?auto_418385 ) ( ON ?auto_418383 ?auto_418384 ) ( ON ?auto_418382 ?auto_418383 ) ( CLEAR ?auto_418382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_418382 )
      ( MAKE-6PILE ?auto_418382 ?auto_418383 ?auto_418384 ?auto_418385 ?auto_418386 ?auto_418387 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_418409 - BLOCK
      ?auto_418410 - BLOCK
      ?auto_418411 - BLOCK
      ?auto_418412 - BLOCK
      ?auto_418413 - BLOCK
      ?auto_418414 - BLOCK
      ?auto_418415 - BLOCK
    )
    :vars
    (
      ?auto_418416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_418414 ) ( ON ?auto_418415 ?auto_418416 ) ( CLEAR ?auto_418415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_418409 ) ( ON ?auto_418410 ?auto_418409 ) ( ON ?auto_418411 ?auto_418410 ) ( ON ?auto_418412 ?auto_418411 ) ( ON ?auto_418413 ?auto_418412 ) ( ON ?auto_418414 ?auto_418413 ) ( not ( = ?auto_418409 ?auto_418410 ) ) ( not ( = ?auto_418409 ?auto_418411 ) ) ( not ( = ?auto_418409 ?auto_418412 ) ) ( not ( = ?auto_418409 ?auto_418413 ) ) ( not ( = ?auto_418409 ?auto_418414 ) ) ( not ( = ?auto_418409 ?auto_418415 ) ) ( not ( = ?auto_418409 ?auto_418416 ) ) ( not ( = ?auto_418410 ?auto_418411 ) ) ( not ( = ?auto_418410 ?auto_418412 ) ) ( not ( = ?auto_418410 ?auto_418413 ) ) ( not ( = ?auto_418410 ?auto_418414 ) ) ( not ( = ?auto_418410 ?auto_418415 ) ) ( not ( = ?auto_418410 ?auto_418416 ) ) ( not ( = ?auto_418411 ?auto_418412 ) ) ( not ( = ?auto_418411 ?auto_418413 ) ) ( not ( = ?auto_418411 ?auto_418414 ) ) ( not ( = ?auto_418411 ?auto_418415 ) ) ( not ( = ?auto_418411 ?auto_418416 ) ) ( not ( = ?auto_418412 ?auto_418413 ) ) ( not ( = ?auto_418412 ?auto_418414 ) ) ( not ( = ?auto_418412 ?auto_418415 ) ) ( not ( = ?auto_418412 ?auto_418416 ) ) ( not ( = ?auto_418413 ?auto_418414 ) ) ( not ( = ?auto_418413 ?auto_418415 ) ) ( not ( = ?auto_418413 ?auto_418416 ) ) ( not ( = ?auto_418414 ?auto_418415 ) ) ( not ( = ?auto_418414 ?auto_418416 ) ) ( not ( = ?auto_418415 ?auto_418416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_418415 ?auto_418416 )
      ( !STACK ?auto_418415 ?auto_418414 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_418439 - BLOCK
      ?auto_418440 - BLOCK
      ?auto_418441 - BLOCK
      ?auto_418442 - BLOCK
      ?auto_418443 - BLOCK
      ?auto_418444 - BLOCK
      ?auto_418445 - BLOCK
    )
    :vars
    (
      ?auto_418446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418445 ?auto_418446 ) ( ON-TABLE ?auto_418439 ) ( ON ?auto_418440 ?auto_418439 ) ( ON ?auto_418441 ?auto_418440 ) ( ON ?auto_418442 ?auto_418441 ) ( ON ?auto_418443 ?auto_418442 ) ( not ( = ?auto_418439 ?auto_418440 ) ) ( not ( = ?auto_418439 ?auto_418441 ) ) ( not ( = ?auto_418439 ?auto_418442 ) ) ( not ( = ?auto_418439 ?auto_418443 ) ) ( not ( = ?auto_418439 ?auto_418444 ) ) ( not ( = ?auto_418439 ?auto_418445 ) ) ( not ( = ?auto_418439 ?auto_418446 ) ) ( not ( = ?auto_418440 ?auto_418441 ) ) ( not ( = ?auto_418440 ?auto_418442 ) ) ( not ( = ?auto_418440 ?auto_418443 ) ) ( not ( = ?auto_418440 ?auto_418444 ) ) ( not ( = ?auto_418440 ?auto_418445 ) ) ( not ( = ?auto_418440 ?auto_418446 ) ) ( not ( = ?auto_418441 ?auto_418442 ) ) ( not ( = ?auto_418441 ?auto_418443 ) ) ( not ( = ?auto_418441 ?auto_418444 ) ) ( not ( = ?auto_418441 ?auto_418445 ) ) ( not ( = ?auto_418441 ?auto_418446 ) ) ( not ( = ?auto_418442 ?auto_418443 ) ) ( not ( = ?auto_418442 ?auto_418444 ) ) ( not ( = ?auto_418442 ?auto_418445 ) ) ( not ( = ?auto_418442 ?auto_418446 ) ) ( not ( = ?auto_418443 ?auto_418444 ) ) ( not ( = ?auto_418443 ?auto_418445 ) ) ( not ( = ?auto_418443 ?auto_418446 ) ) ( not ( = ?auto_418444 ?auto_418445 ) ) ( not ( = ?auto_418444 ?auto_418446 ) ) ( not ( = ?auto_418445 ?auto_418446 ) ) ( CLEAR ?auto_418443 ) ( ON ?auto_418444 ?auto_418445 ) ( CLEAR ?auto_418444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_418439 ?auto_418440 ?auto_418441 ?auto_418442 ?auto_418443 ?auto_418444 )
      ( MAKE-7PILE ?auto_418439 ?auto_418440 ?auto_418441 ?auto_418442 ?auto_418443 ?auto_418444 ?auto_418445 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_418469 - BLOCK
      ?auto_418470 - BLOCK
      ?auto_418471 - BLOCK
      ?auto_418472 - BLOCK
      ?auto_418473 - BLOCK
      ?auto_418474 - BLOCK
      ?auto_418475 - BLOCK
    )
    :vars
    (
      ?auto_418476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418475 ?auto_418476 ) ( ON-TABLE ?auto_418469 ) ( ON ?auto_418470 ?auto_418469 ) ( ON ?auto_418471 ?auto_418470 ) ( ON ?auto_418472 ?auto_418471 ) ( not ( = ?auto_418469 ?auto_418470 ) ) ( not ( = ?auto_418469 ?auto_418471 ) ) ( not ( = ?auto_418469 ?auto_418472 ) ) ( not ( = ?auto_418469 ?auto_418473 ) ) ( not ( = ?auto_418469 ?auto_418474 ) ) ( not ( = ?auto_418469 ?auto_418475 ) ) ( not ( = ?auto_418469 ?auto_418476 ) ) ( not ( = ?auto_418470 ?auto_418471 ) ) ( not ( = ?auto_418470 ?auto_418472 ) ) ( not ( = ?auto_418470 ?auto_418473 ) ) ( not ( = ?auto_418470 ?auto_418474 ) ) ( not ( = ?auto_418470 ?auto_418475 ) ) ( not ( = ?auto_418470 ?auto_418476 ) ) ( not ( = ?auto_418471 ?auto_418472 ) ) ( not ( = ?auto_418471 ?auto_418473 ) ) ( not ( = ?auto_418471 ?auto_418474 ) ) ( not ( = ?auto_418471 ?auto_418475 ) ) ( not ( = ?auto_418471 ?auto_418476 ) ) ( not ( = ?auto_418472 ?auto_418473 ) ) ( not ( = ?auto_418472 ?auto_418474 ) ) ( not ( = ?auto_418472 ?auto_418475 ) ) ( not ( = ?auto_418472 ?auto_418476 ) ) ( not ( = ?auto_418473 ?auto_418474 ) ) ( not ( = ?auto_418473 ?auto_418475 ) ) ( not ( = ?auto_418473 ?auto_418476 ) ) ( not ( = ?auto_418474 ?auto_418475 ) ) ( not ( = ?auto_418474 ?auto_418476 ) ) ( not ( = ?auto_418475 ?auto_418476 ) ) ( ON ?auto_418474 ?auto_418475 ) ( CLEAR ?auto_418472 ) ( ON ?auto_418473 ?auto_418474 ) ( CLEAR ?auto_418473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_418469 ?auto_418470 ?auto_418471 ?auto_418472 ?auto_418473 )
      ( MAKE-7PILE ?auto_418469 ?auto_418470 ?auto_418471 ?auto_418472 ?auto_418473 ?auto_418474 ?auto_418475 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_418499 - BLOCK
      ?auto_418500 - BLOCK
      ?auto_418501 - BLOCK
      ?auto_418502 - BLOCK
      ?auto_418503 - BLOCK
      ?auto_418504 - BLOCK
      ?auto_418505 - BLOCK
    )
    :vars
    (
      ?auto_418506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418505 ?auto_418506 ) ( ON-TABLE ?auto_418499 ) ( ON ?auto_418500 ?auto_418499 ) ( ON ?auto_418501 ?auto_418500 ) ( not ( = ?auto_418499 ?auto_418500 ) ) ( not ( = ?auto_418499 ?auto_418501 ) ) ( not ( = ?auto_418499 ?auto_418502 ) ) ( not ( = ?auto_418499 ?auto_418503 ) ) ( not ( = ?auto_418499 ?auto_418504 ) ) ( not ( = ?auto_418499 ?auto_418505 ) ) ( not ( = ?auto_418499 ?auto_418506 ) ) ( not ( = ?auto_418500 ?auto_418501 ) ) ( not ( = ?auto_418500 ?auto_418502 ) ) ( not ( = ?auto_418500 ?auto_418503 ) ) ( not ( = ?auto_418500 ?auto_418504 ) ) ( not ( = ?auto_418500 ?auto_418505 ) ) ( not ( = ?auto_418500 ?auto_418506 ) ) ( not ( = ?auto_418501 ?auto_418502 ) ) ( not ( = ?auto_418501 ?auto_418503 ) ) ( not ( = ?auto_418501 ?auto_418504 ) ) ( not ( = ?auto_418501 ?auto_418505 ) ) ( not ( = ?auto_418501 ?auto_418506 ) ) ( not ( = ?auto_418502 ?auto_418503 ) ) ( not ( = ?auto_418502 ?auto_418504 ) ) ( not ( = ?auto_418502 ?auto_418505 ) ) ( not ( = ?auto_418502 ?auto_418506 ) ) ( not ( = ?auto_418503 ?auto_418504 ) ) ( not ( = ?auto_418503 ?auto_418505 ) ) ( not ( = ?auto_418503 ?auto_418506 ) ) ( not ( = ?auto_418504 ?auto_418505 ) ) ( not ( = ?auto_418504 ?auto_418506 ) ) ( not ( = ?auto_418505 ?auto_418506 ) ) ( ON ?auto_418504 ?auto_418505 ) ( ON ?auto_418503 ?auto_418504 ) ( CLEAR ?auto_418501 ) ( ON ?auto_418502 ?auto_418503 ) ( CLEAR ?auto_418502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_418499 ?auto_418500 ?auto_418501 ?auto_418502 )
      ( MAKE-7PILE ?auto_418499 ?auto_418500 ?auto_418501 ?auto_418502 ?auto_418503 ?auto_418504 ?auto_418505 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_418529 - BLOCK
      ?auto_418530 - BLOCK
      ?auto_418531 - BLOCK
      ?auto_418532 - BLOCK
      ?auto_418533 - BLOCK
      ?auto_418534 - BLOCK
      ?auto_418535 - BLOCK
    )
    :vars
    (
      ?auto_418536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418535 ?auto_418536 ) ( ON-TABLE ?auto_418529 ) ( ON ?auto_418530 ?auto_418529 ) ( not ( = ?auto_418529 ?auto_418530 ) ) ( not ( = ?auto_418529 ?auto_418531 ) ) ( not ( = ?auto_418529 ?auto_418532 ) ) ( not ( = ?auto_418529 ?auto_418533 ) ) ( not ( = ?auto_418529 ?auto_418534 ) ) ( not ( = ?auto_418529 ?auto_418535 ) ) ( not ( = ?auto_418529 ?auto_418536 ) ) ( not ( = ?auto_418530 ?auto_418531 ) ) ( not ( = ?auto_418530 ?auto_418532 ) ) ( not ( = ?auto_418530 ?auto_418533 ) ) ( not ( = ?auto_418530 ?auto_418534 ) ) ( not ( = ?auto_418530 ?auto_418535 ) ) ( not ( = ?auto_418530 ?auto_418536 ) ) ( not ( = ?auto_418531 ?auto_418532 ) ) ( not ( = ?auto_418531 ?auto_418533 ) ) ( not ( = ?auto_418531 ?auto_418534 ) ) ( not ( = ?auto_418531 ?auto_418535 ) ) ( not ( = ?auto_418531 ?auto_418536 ) ) ( not ( = ?auto_418532 ?auto_418533 ) ) ( not ( = ?auto_418532 ?auto_418534 ) ) ( not ( = ?auto_418532 ?auto_418535 ) ) ( not ( = ?auto_418532 ?auto_418536 ) ) ( not ( = ?auto_418533 ?auto_418534 ) ) ( not ( = ?auto_418533 ?auto_418535 ) ) ( not ( = ?auto_418533 ?auto_418536 ) ) ( not ( = ?auto_418534 ?auto_418535 ) ) ( not ( = ?auto_418534 ?auto_418536 ) ) ( not ( = ?auto_418535 ?auto_418536 ) ) ( ON ?auto_418534 ?auto_418535 ) ( ON ?auto_418533 ?auto_418534 ) ( ON ?auto_418532 ?auto_418533 ) ( CLEAR ?auto_418530 ) ( ON ?auto_418531 ?auto_418532 ) ( CLEAR ?auto_418531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_418529 ?auto_418530 ?auto_418531 )
      ( MAKE-7PILE ?auto_418529 ?auto_418530 ?auto_418531 ?auto_418532 ?auto_418533 ?auto_418534 ?auto_418535 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_418559 - BLOCK
      ?auto_418560 - BLOCK
      ?auto_418561 - BLOCK
      ?auto_418562 - BLOCK
      ?auto_418563 - BLOCK
      ?auto_418564 - BLOCK
      ?auto_418565 - BLOCK
    )
    :vars
    (
      ?auto_418566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418565 ?auto_418566 ) ( ON-TABLE ?auto_418559 ) ( not ( = ?auto_418559 ?auto_418560 ) ) ( not ( = ?auto_418559 ?auto_418561 ) ) ( not ( = ?auto_418559 ?auto_418562 ) ) ( not ( = ?auto_418559 ?auto_418563 ) ) ( not ( = ?auto_418559 ?auto_418564 ) ) ( not ( = ?auto_418559 ?auto_418565 ) ) ( not ( = ?auto_418559 ?auto_418566 ) ) ( not ( = ?auto_418560 ?auto_418561 ) ) ( not ( = ?auto_418560 ?auto_418562 ) ) ( not ( = ?auto_418560 ?auto_418563 ) ) ( not ( = ?auto_418560 ?auto_418564 ) ) ( not ( = ?auto_418560 ?auto_418565 ) ) ( not ( = ?auto_418560 ?auto_418566 ) ) ( not ( = ?auto_418561 ?auto_418562 ) ) ( not ( = ?auto_418561 ?auto_418563 ) ) ( not ( = ?auto_418561 ?auto_418564 ) ) ( not ( = ?auto_418561 ?auto_418565 ) ) ( not ( = ?auto_418561 ?auto_418566 ) ) ( not ( = ?auto_418562 ?auto_418563 ) ) ( not ( = ?auto_418562 ?auto_418564 ) ) ( not ( = ?auto_418562 ?auto_418565 ) ) ( not ( = ?auto_418562 ?auto_418566 ) ) ( not ( = ?auto_418563 ?auto_418564 ) ) ( not ( = ?auto_418563 ?auto_418565 ) ) ( not ( = ?auto_418563 ?auto_418566 ) ) ( not ( = ?auto_418564 ?auto_418565 ) ) ( not ( = ?auto_418564 ?auto_418566 ) ) ( not ( = ?auto_418565 ?auto_418566 ) ) ( ON ?auto_418564 ?auto_418565 ) ( ON ?auto_418563 ?auto_418564 ) ( ON ?auto_418562 ?auto_418563 ) ( ON ?auto_418561 ?auto_418562 ) ( CLEAR ?auto_418559 ) ( ON ?auto_418560 ?auto_418561 ) ( CLEAR ?auto_418560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_418559 ?auto_418560 )
      ( MAKE-7PILE ?auto_418559 ?auto_418560 ?auto_418561 ?auto_418562 ?auto_418563 ?auto_418564 ?auto_418565 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_418589 - BLOCK
      ?auto_418590 - BLOCK
      ?auto_418591 - BLOCK
      ?auto_418592 - BLOCK
      ?auto_418593 - BLOCK
      ?auto_418594 - BLOCK
      ?auto_418595 - BLOCK
    )
    :vars
    (
      ?auto_418596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418595 ?auto_418596 ) ( not ( = ?auto_418589 ?auto_418590 ) ) ( not ( = ?auto_418589 ?auto_418591 ) ) ( not ( = ?auto_418589 ?auto_418592 ) ) ( not ( = ?auto_418589 ?auto_418593 ) ) ( not ( = ?auto_418589 ?auto_418594 ) ) ( not ( = ?auto_418589 ?auto_418595 ) ) ( not ( = ?auto_418589 ?auto_418596 ) ) ( not ( = ?auto_418590 ?auto_418591 ) ) ( not ( = ?auto_418590 ?auto_418592 ) ) ( not ( = ?auto_418590 ?auto_418593 ) ) ( not ( = ?auto_418590 ?auto_418594 ) ) ( not ( = ?auto_418590 ?auto_418595 ) ) ( not ( = ?auto_418590 ?auto_418596 ) ) ( not ( = ?auto_418591 ?auto_418592 ) ) ( not ( = ?auto_418591 ?auto_418593 ) ) ( not ( = ?auto_418591 ?auto_418594 ) ) ( not ( = ?auto_418591 ?auto_418595 ) ) ( not ( = ?auto_418591 ?auto_418596 ) ) ( not ( = ?auto_418592 ?auto_418593 ) ) ( not ( = ?auto_418592 ?auto_418594 ) ) ( not ( = ?auto_418592 ?auto_418595 ) ) ( not ( = ?auto_418592 ?auto_418596 ) ) ( not ( = ?auto_418593 ?auto_418594 ) ) ( not ( = ?auto_418593 ?auto_418595 ) ) ( not ( = ?auto_418593 ?auto_418596 ) ) ( not ( = ?auto_418594 ?auto_418595 ) ) ( not ( = ?auto_418594 ?auto_418596 ) ) ( not ( = ?auto_418595 ?auto_418596 ) ) ( ON ?auto_418594 ?auto_418595 ) ( ON ?auto_418593 ?auto_418594 ) ( ON ?auto_418592 ?auto_418593 ) ( ON ?auto_418591 ?auto_418592 ) ( ON ?auto_418590 ?auto_418591 ) ( ON ?auto_418589 ?auto_418590 ) ( CLEAR ?auto_418589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_418589 )
      ( MAKE-7PILE ?auto_418589 ?auto_418590 ?auto_418591 ?auto_418592 ?auto_418593 ?auto_418594 ?auto_418595 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_418620 - BLOCK
      ?auto_418621 - BLOCK
      ?auto_418622 - BLOCK
      ?auto_418623 - BLOCK
      ?auto_418624 - BLOCK
      ?auto_418625 - BLOCK
      ?auto_418626 - BLOCK
      ?auto_418627 - BLOCK
    )
    :vars
    (
      ?auto_418628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_418626 ) ( ON ?auto_418627 ?auto_418628 ) ( CLEAR ?auto_418627 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_418620 ) ( ON ?auto_418621 ?auto_418620 ) ( ON ?auto_418622 ?auto_418621 ) ( ON ?auto_418623 ?auto_418622 ) ( ON ?auto_418624 ?auto_418623 ) ( ON ?auto_418625 ?auto_418624 ) ( ON ?auto_418626 ?auto_418625 ) ( not ( = ?auto_418620 ?auto_418621 ) ) ( not ( = ?auto_418620 ?auto_418622 ) ) ( not ( = ?auto_418620 ?auto_418623 ) ) ( not ( = ?auto_418620 ?auto_418624 ) ) ( not ( = ?auto_418620 ?auto_418625 ) ) ( not ( = ?auto_418620 ?auto_418626 ) ) ( not ( = ?auto_418620 ?auto_418627 ) ) ( not ( = ?auto_418620 ?auto_418628 ) ) ( not ( = ?auto_418621 ?auto_418622 ) ) ( not ( = ?auto_418621 ?auto_418623 ) ) ( not ( = ?auto_418621 ?auto_418624 ) ) ( not ( = ?auto_418621 ?auto_418625 ) ) ( not ( = ?auto_418621 ?auto_418626 ) ) ( not ( = ?auto_418621 ?auto_418627 ) ) ( not ( = ?auto_418621 ?auto_418628 ) ) ( not ( = ?auto_418622 ?auto_418623 ) ) ( not ( = ?auto_418622 ?auto_418624 ) ) ( not ( = ?auto_418622 ?auto_418625 ) ) ( not ( = ?auto_418622 ?auto_418626 ) ) ( not ( = ?auto_418622 ?auto_418627 ) ) ( not ( = ?auto_418622 ?auto_418628 ) ) ( not ( = ?auto_418623 ?auto_418624 ) ) ( not ( = ?auto_418623 ?auto_418625 ) ) ( not ( = ?auto_418623 ?auto_418626 ) ) ( not ( = ?auto_418623 ?auto_418627 ) ) ( not ( = ?auto_418623 ?auto_418628 ) ) ( not ( = ?auto_418624 ?auto_418625 ) ) ( not ( = ?auto_418624 ?auto_418626 ) ) ( not ( = ?auto_418624 ?auto_418627 ) ) ( not ( = ?auto_418624 ?auto_418628 ) ) ( not ( = ?auto_418625 ?auto_418626 ) ) ( not ( = ?auto_418625 ?auto_418627 ) ) ( not ( = ?auto_418625 ?auto_418628 ) ) ( not ( = ?auto_418626 ?auto_418627 ) ) ( not ( = ?auto_418626 ?auto_418628 ) ) ( not ( = ?auto_418627 ?auto_418628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_418627 ?auto_418628 )
      ( !STACK ?auto_418627 ?auto_418626 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_418654 - BLOCK
      ?auto_418655 - BLOCK
      ?auto_418656 - BLOCK
      ?auto_418657 - BLOCK
      ?auto_418658 - BLOCK
      ?auto_418659 - BLOCK
      ?auto_418660 - BLOCK
      ?auto_418661 - BLOCK
    )
    :vars
    (
      ?auto_418662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418661 ?auto_418662 ) ( ON-TABLE ?auto_418654 ) ( ON ?auto_418655 ?auto_418654 ) ( ON ?auto_418656 ?auto_418655 ) ( ON ?auto_418657 ?auto_418656 ) ( ON ?auto_418658 ?auto_418657 ) ( ON ?auto_418659 ?auto_418658 ) ( not ( = ?auto_418654 ?auto_418655 ) ) ( not ( = ?auto_418654 ?auto_418656 ) ) ( not ( = ?auto_418654 ?auto_418657 ) ) ( not ( = ?auto_418654 ?auto_418658 ) ) ( not ( = ?auto_418654 ?auto_418659 ) ) ( not ( = ?auto_418654 ?auto_418660 ) ) ( not ( = ?auto_418654 ?auto_418661 ) ) ( not ( = ?auto_418654 ?auto_418662 ) ) ( not ( = ?auto_418655 ?auto_418656 ) ) ( not ( = ?auto_418655 ?auto_418657 ) ) ( not ( = ?auto_418655 ?auto_418658 ) ) ( not ( = ?auto_418655 ?auto_418659 ) ) ( not ( = ?auto_418655 ?auto_418660 ) ) ( not ( = ?auto_418655 ?auto_418661 ) ) ( not ( = ?auto_418655 ?auto_418662 ) ) ( not ( = ?auto_418656 ?auto_418657 ) ) ( not ( = ?auto_418656 ?auto_418658 ) ) ( not ( = ?auto_418656 ?auto_418659 ) ) ( not ( = ?auto_418656 ?auto_418660 ) ) ( not ( = ?auto_418656 ?auto_418661 ) ) ( not ( = ?auto_418656 ?auto_418662 ) ) ( not ( = ?auto_418657 ?auto_418658 ) ) ( not ( = ?auto_418657 ?auto_418659 ) ) ( not ( = ?auto_418657 ?auto_418660 ) ) ( not ( = ?auto_418657 ?auto_418661 ) ) ( not ( = ?auto_418657 ?auto_418662 ) ) ( not ( = ?auto_418658 ?auto_418659 ) ) ( not ( = ?auto_418658 ?auto_418660 ) ) ( not ( = ?auto_418658 ?auto_418661 ) ) ( not ( = ?auto_418658 ?auto_418662 ) ) ( not ( = ?auto_418659 ?auto_418660 ) ) ( not ( = ?auto_418659 ?auto_418661 ) ) ( not ( = ?auto_418659 ?auto_418662 ) ) ( not ( = ?auto_418660 ?auto_418661 ) ) ( not ( = ?auto_418660 ?auto_418662 ) ) ( not ( = ?auto_418661 ?auto_418662 ) ) ( CLEAR ?auto_418659 ) ( ON ?auto_418660 ?auto_418661 ) ( CLEAR ?auto_418660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_418654 ?auto_418655 ?auto_418656 ?auto_418657 ?auto_418658 ?auto_418659 ?auto_418660 )
      ( MAKE-8PILE ?auto_418654 ?auto_418655 ?auto_418656 ?auto_418657 ?auto_418658 ?auto_418659 ?auto_418660 ?auto_418661 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_418688 - BLOCK
      ?auto_418689 - BLOCK
      ?auto_418690 - BLOCK
      ?auto_418691 - BLOCK
      ?auto_418692 - BLOCK
      ?auto_418693 - BLOCK
      ?auto_418694 - BLOCK
      ?auto_418695 - BLOCK
    )
    :vars
    (
      ?auto_418696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418695 ?auto_418696 ) ( ON-TABLE ?auto_418688 ) ( ON ?auto_418689 ?auto_418688 ) ( ON ?auto_418690 ?auto_418689 ) ( ON ?auto_418691 ?auto_418690 ) ( ON ?auto_418692 ?auto_418691 ) ( not ( = ?auto_418688 ?auto_418689 ) ) ( not ( = ?auto_418688 ?auto_418690 ) ) ( not ( = ?auto_418688 ?auto_418691 ) ) ( not ( = ?auto_418688 ?auto_418692 ) ) ( not ( = ?auto_418688 ?auto_418693 ) ) ( not ( = ?auto_418688 ?auto_418694 ) ) ( not ( = ?auto_418688 ?auto_418695 ) ) ( not ( = ?auto_418688 ?auto_418696 ) ) ( not ( = ?auto_418689 ?auto_418690 ) ) ( not ( = ?auto_418689 ?auto_418691 ) ) ( not ( = ?auto_418689 ?auto_418692 ) ) ( not ( = ?auto_418689 ?auto_418693 ) ) ( not ( = ?auto_418689 ?auto_418694 ) ) ( not ( = ?auto_418689 ?auto_418695 ) ) ( not ( = ?auto_418689 ?auto_418696 ) ) ( not ( = ?auto_418690 ?auto_418691 ) ) ( not ( = ?auto_418690 ?auto_418692 ) ) ( not ( = ?auto_418690 ?auto_418693 ) ) ( not ( = ?auto_418690 ?auto_418694 ) ) ( not ( = ?auto_418690 ?auto_418695 ) ) ( not ( = ?auto_418690 ?auto_418696 ) ) ( not ( = ?auto_418691 ?auto_418692 ) ) ( not ( = ?auto_418691 ?auto_418693 ) ) ( not ( = ?auto_418691 ?auto_418694 ) ) ( not ( = ?auto_418691 ?auto_418695 ) ) ( not ( = ?auto_418691 ?auto_418696 ) ) ( not ( = ?auto_418692 ?auto_418693 ) ) ( not ( = ?auto_418692 ?auto_418694 ) ) ( not ( = ?auto_418692 ?auto_418695 ) ) ( not ( = ?auto_418692 ?auto_418696 ) ) ( not ( = ?auto_418693 ?auto_418694 ) ) ( not ( = ?auto_418693 ?auto_418695 ) ) ( not ( = ?auto_418693 ?auto_418696 ) ) ( not ( = ?auto_418694 ?auto_418695 ) ) ( not ( = ?auto_418694 ?auto_418696 ) ) ( not ( = ?auto_418695 ?auto_418696 ) ) ( ON ?auto_418694 ?auto_418695 ) ( CLEAR ?auto_418692 ) ( ON ?auto_418693 ?auto_418694 ) ( CLEAR ?auto_418693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_418688 ?auto_418689 ?auto_418690 ?auto_418691 ?auto_418692 ?auto_418693 )
      ( MAKE-8PILE ?auto_418688 ?auto_418689 ?auto_418690 ?auto_418691 ?auto_418692 ?auto_418693 ?auto_418694 ?auto_418695 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_418722 - BLOCK
      ?auto_418723 - BLOCK
      ?auto_418724 - BLOCK
      ?auto_418725 - BLOCK
      ?auto_418726 - BLOCK
      ?auto_418727 - BLOCK
      ?auto_418728 - BLOCK
      ?auto_418729 - BLOCK
    )
    :vars
    (
      ?auto_418730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418729 ?auto_418730 ) ( ON-TABLE ?auto_418722 ) ( ON ?auto_418723 ?auto_418722 ) ( ON ?auto_418724 ?auto_418723 ) ( ON ?auto_418725 ?auto_418724 ) ( not ( = ?auto_418722 ?auto_418723 ) ) ( not ( = ?auto_418722 ?auto_418724 ) ) ( not ( = ?auto_418722 ?auto_418725 ) ) ( not ( = ?auto_418722 ?auto_418726 ) ) ( not ( = ?auto_418722 ?auto_418727 ) ) ( not ( = ?auto_418722 ?auto_418728 ) ) ( not ( = ?auto_418722 ?auto_418729 ) ) ( not ( = ?auto_418722 ?auto_418730 ) ) ( not ( = ?auto_418723 ?auto_418724 ) ) ( not ( = ?auto_418723 ?auto_418725 ) ) ( not ( = ?auto_418723 ?auto_418726 ) ) ( not ( = ?auto_418723 ?auto_418727 ) ) ( not ( = ?auto_418723 ?auto_418728 ) ) ( not ( = ?auto_418723 ?auto_418729 ) ) ( not ( = ?auto_418723 ?auto_418730 ) ) ( not ( = ?auto_418724 ?auto_418725 ) ) ( not ( = ?auto_418724 ?auto_418726 ) ) ( not ( = ?auto_418724 ?auto_418727 ) ) ( not ( = ?auto_418724 ?auto_418728 ) ) ( not ( = ?auto_418724 ?auto_418729 ) ) ( not ( = ?auto_418724 ?auto_418730 ) ) ( not ( = ?auto_418725 ?auto_418726 ) ) ( not ( = ?auto_418725 ?auto_418727 ) ) ( not ( = ?auto_418725 ?auto_418728 ) ) ( not ( = ?auto_418725 ?auto_418729 ) ) ( not ( = ?auto_418725 ?auto_418730 ) ) ( not ( = ?auto_418726 ?auto_418727 ) ) ( not ( = ?auto_418726 ?auto_418728 ) ) ( not ( = ?auto_418726 ?auto_418729 ) ) ( not ( = ?auto_418726 ?auto_418730 ) ) ( not ( = ?auto_418727 ?auto_418728 ) ) ( not ( = ?auto_418727 ?auto_418729 ) ) ( not ( = ?auto_418727 ?auto_418730 ) ) ( not ( = ?auto_418728 ?auto_418729 ) ) ( not ( = ?auto_418728 ?auto_418730 ) ) ( not ( = ?auto_418729 ?auto_418730 ) ) ( ON ?auto_418728 ?auto_418729 ) ( ON ?auto_418727 ?auto_418728 ) ( CLEAR ?auto_418725 ) ( ON ?auto_418726 ?auto_418727 ) ( CLEAR ?auto_418726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_418722 ?auto_418723 ?auto_418724 ?auto_418725 ?auto_418726 )
      ( MAKE-8PILE ?auto_418722 ?auto_418723 ?auto_418724 ?auto_418725 ?auto_418726 ?auto_418727 ?auto_418728 ?auto_418729 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_418756 - BLOCK
      ?auto_418757 - BLOCK
      ?auto_418758 - BLOCK
      ?auto_418759 - BLOCK
      ?auto_418760 - BLOCK
      ?auto_418761 - BLOCK
      ?auto_418762 - BLOCK
      ?auto_418763 - BLOCK
    )
    :vars
    (
      ?auto_418764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418763 ?auto_418764 ) ( ON-TABLE ?auto_418756 ) ( ON ?auto_418757 ?auto_418756 ) ( ON ?auto_418758 ?auto_418757 ) ( not ( = ?auto_418756 ?auto_418757 ) ) ( not ( = ?auto_418756 ?auto_418758 ) ) ( not ( = ?auto_418756 ?auto_418759 ) ) ( not ( = ?auto_418756 ?auto_418760 ) ) ( not ( = ?auto_418756 ?auto_418761 ) ) ( not ( = ?auto_418756 ?auto_418762 ) ) ( not ( = ?auto_418756 ?auto_418763 ) ) ( not ( = ?auto_418756 ?auto_418764 ) ) ( not ( = ?auto_418757 ?auto_418758 ) ) ( not ( = ?auto_418757 ?auto_418759 ) ) ( not ( = ?auto_418757 ?auto_418760 ) ) ( not ( = ?auto_418757 ?auto_418761 ) ) ( not ( = ?auto_418757 ?auto_418762 ) ) ( not ( = ?auto_418757 ?auto_418763 ) ) ( not ( = ?auto_418757 ?auto_418764 ) ) ( not ( = ?auto_418758 ?auto_418759 ) ) ( not ( = ?auto_418758 ?auto_418760 ) ) ( not ( = ?auto_418758 ?auto_418761 ) ) ( not ( = ?auto_418758 ?auto_418762 ) ) ( not ( = ?auto_418758 ?auto_418763 ) ) ( not ( = ?auto_418758 ?auto_418764 ) ) ( not ( = ?auto_418759 ?auto_418760 ) ) ( not ( = ?auto_418759 ?auto_418761 ) ) ( not ( = ?auto_418759 ?auto_418762 ) ) ( not ( = ?auto_418759 ?auto_418763 ) ) ( not ( = ?auto_418759 ?auto_418764 ) ) ( not ( = ?auto_418760 ?auto_418761 ) ) ( not ( = ?auto_418760 ?auto_418762 ) ) ( not ( = ?auto_418760 ?auto_418763 ) ) ( not ( = ?auto_418760 ?auto_418764 ) ) ( not ( = ?auto_418761 ?auto_418762 ) ) ( not ( = ?auto_418761 ?auto_418763 ) ) ( not ( = ?auto_418761 ?auto_418764 ) ) ( not ( = ?auto_418762 ?auto_418763 ) ) ( not ( = ?auto_418762 ?auto_418764 ) ) ( not ( = ?auto_418763 ?auto_418764 ) ) ( ON ?auto_418762 ?auto_418763 ) ( ON ?auto_418761 ?auto_418762 ) ( ON ?auto_418760 ?auto_418761 ) ( CLEAR ?auto_418758 ) ( ON ?auto_418759 ?auto_418760 ) ( CLEAR ?auto_418759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_418756 ?auto_418757 ?auto_418758 ?auto_418759 )
      ( MAKE-8PILE ?auto_418756 ?auto_418757 ?auto_418758 ?auto_418759 ?auto_418760 ?auto_418761 ?auto_418762 ?auto_418763 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_418790 - BLOCK
      ?auto_418791 - BLOCK
      ?auto_418792 - BLOCK
      ?auto_418793 - BLOCK
      ?auto_418794 - BLOCK
      ?auto_418795 - BLOCK
      ?auto_418796 - BLOCK
      ?auto_418797 - BLOCK
    )
    :vars
    (
      ?auto_418798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418797 ?auto_418798 ) ( ON-TABLE ?auto_418790 ) ( ON ?auto_418791 ?auto_418790 ) ( not ( = ?auto_418790 ?auto_418791 ) ) ( not ( = ?auto_418790 ?auto_418792 ) ) ( not ( = ?auto_418790 ?auto_418793 ) ) ( not ( = ?auto_418790 ?auto_418794 ) ) ( not ( = ?auto_418790 ?auto_418795 ) ) ( not ( = ?auto_418790 ?auto_418796 ) ) ( not ( = ?auto_418790 ?auto_418797 ) ) ( not ( = ?auto_418790 ?auto_418798 ) ) ( not ( = ?auto_418791 ?auto_418792 ) ) ( not ( = ?auto_418791 ?auto_418793 ) ) ( not ( = ?auto_418791 ?auto_418794 ) ) ( not ( = ?auto_418791 ?auto_418795 ) ) ( not ( = ?auto_418791 ?auto_418796 ) ) ( not ( = ?auto_418791 ?auto_418797 ) ) ( not ( = ?auto_418791 ?auto_418798 ) ) ( not ( = ?auto_418792 ?auto_418793 ) ) ( not ( = ?auto_418792 ?auto_418794 ) ) ( not ( = ?auto_418792 ?auto_418795 ) ) ( not ( = ?auto_418792 ?auto_418796 ) ) ( not ( = ?auto_418792 ?auto_418797 ) ) ( not ( = ?auto_418792 ?auto_418798 ) ) ( not ( = ?auto_418793 ?auto_418794 ) ) ( not ( = ?auto_418793 ?auto_418795 ) ) ( not ( = ?auto_418793 ?auto_418796 ) ) ( not ( = ?auto_418793 ?auto_418797 ) ) ( not ( = ?auto_418793 ?auto_418798 ) ) ( not ( = ?auto_418794 ?auto_418795 ) ) ( not ( = ?auto_418794 ?auto_418796 ) ) ( not ( = ?auto_418794 ?auto_418797 ) ) ( not ( = ?auto_418794 ?auto_418798 ) ) ( not ( = ?auto_418795 ?auto_418796 ) ) ( not ( = ?auto_418795 ?auto_418797 ) ) ( not ( = ?auto_418795 ?auto_418798 ) ) ( not ( = ?auto_418796 ?auto_418797 ) ) ( not ( = ?auto_418796 ?auto_418798 ) ) ( not ( = ?auto_418797 ?auto_418798 ) ) ( ON ?auto_418796 ?auto_418797 ) ( ON ?auto_418795 ?auto_418796 ) ( ON ?auto_418794 ?auto_418795 ) ( ON ?auto_418793 ?auto_418794 ) ( CLEAR ?auto_418791 ) ( ON ?auto_418792 ?auto_418793 ) ( CLEAR ?auto_418792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_418790 ?auto_418791 ?auto_418792 )
      ( MAKE-8PILE ?auto_418790 ?auto_418791 ?auto_418792 ?auto_418793 ?auto_418794 ?auto_418795 ?auto_418796 ?auto_418797 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_418824 - BLOCK
      ?auto_418825 - BLOCK
      ?auto_418826 - BLOCK
      ?auto_418827 - BLOCK
      ?auto_418828 - BLOCK
      ?auto_418829 - BLOCK
      ?auto_418830 - BLOCK
      ?auto_418831 - BLOCK
    )
    :vars
    (
      ?auto_418832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418831 ?auto_418832 ) ( ON-TABLE ?auto_418824 ) ( not ( = ?auto_418824 ?auto_418825 ) ) ( not ( = ?auto_418824 ?auto_418826 ) ) ( not ( = ?auto_418824 ?auto_418827 ) ) ( not ( = ?auto_418824 ?auto_418828 ) ) ( not ( = ?auto_418824 ?auto_418829 ) ) ( not ( = ?auto_418824 ?auto_418830 ) ) ( not ( = ?auto_418824 ?auto_418831 ) ) ( not ( = ?auto_418824 ?auto_418832 ) ) ( not ( = ?auto_418825 ?auto_418826 ) ) ( not ( = ?auto_418825 ?auto_418827 ) ) ( not ( = ?auto_418825 ?auto_418828 ) ) ( not ( = ?auto_418825 ?auto_418829 ) ) ( not ( = ?auto_418825 ?auto_418830 ) ) ( not ( = ?auto_418825 ?auto_418831 ) ) ( not ( = ?auto_418825 ?auto_418832 ) ) ( not ( = ?auto_418826 ?auto_418827 ) ) ( not ( = ?auto_418826 ?auto_418828 ) ) ( not ( = ?auto_418826 ?auto_418829 ) ) ( not ( = ?auto_418826 ?auto_418830 ) ) ( not ( = ?auto_418826 ?auto_418831 ) ) ( not ( = ?auto_418826 ?auto_418832 ) ) ( not ( = ?auto_418827 ?auto_418828 ) ) ( not ( = ?auto_418827 ?auto_418829 ) ) ( not ( = ?auto_418827 ?auto_418830 ) ) ( not ( = ?auto_418827 ?auto_418831 ) ) ( not ( = ?auto_418827 ?auto_418832 ) ) ( not ( = ?auto_418828 ?auto_418829 ) ) ( not ( = ?auto_418828 ?auto_418830 ) ) ( not ( = ?auto_418828 ?auto_418831 ) ) ( not ( = ?auto_418828 ?auto_418832 ) ) ( not ( = ?auto_418829 ?auto_418830 ) ) ( not ( = ?auto_418829 ?auto_418831 ) ) ( not ( = ?auto_418829 ?auto_418832 ) ) ( not ( = ?auto_418830 ?auto_418831 ) ) ( not ( = ?auto_418830 ?auto_418832 ) ) ( not ( = ?auto_418831 ?auto_418832 ) ) ( ON ?auto_418830 ?auto_418831 ) ( ON ?auto_418829 ?auto_418830 ) ( ON ?auto_418828 ?auto_418829 ) ( ON ?auto_418827 ?auto_418828 ) ( ON ?auto_418826 ?auto_418827 ) ( CLEAR ?auto_418824 ) ( ON ?auto_418825 ?auto_418826 ) ( CLEAR ?auto_418825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_418824 ?auto_418825 )
      ( MAKE-8PILE ?auto_418824 ?auto_418825 ?auto_418826 ?auto_418827 ?auto_418828 ?auto_418829 ?auto_418830 ?auto_418831 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_418858 - BLOCK
      ?auto_418859 - BLOCK
      ?auto_418860 - BLOCK
      ?auto_418861 - BLOCK
      ?auto_418862 - BLOCK
      ?auto_418863 - BLOCK
      ?auto_418864 - BLOCK
      ?auto_418865 - BLOCK
    )
    :vars
    (
      ?auto_418866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418865 ?auto_418866 ) ( not ( = ?auto_418858 ?auto_418859 ) ) ( not ( = ?auto_418858 ?auto_418860 ) ) ( not ( = ?auto_418858 ?auto_418861 ) ) ( not ( = ?auto_418858 ?auto_418862 ) ) ( not ( = ?auto_418858 ?auto_418863 ) ) ( not ( = ?auto_418858 ?auto_418864 ) ) ( not ( = ?auto_418858 ?auto_418865 ) ) ( not ( = ?auto_418858 ?auto_418866 ) ) ( not ( = ?auto_418859 ?auto_418860 ) ) ( not ( = ?auto_418859 ?auto_418861 ) ) ( not ( = ?auto_418859 ?auto_418862 ) ) ( not ( = ?auto_418859 ?auto_418863 ) ) ( not ( = ?auto_418859 ?auto_418864 ) ) ( not ( = ?auto_418859 ?auto_418865 ) ) ( not ( = ?auto_418859 ?auto_418866 ) ) ( not ( = ?auto_418860 ?auto_418861 ) ) ( not ( = ?auto_418860 ?auto_418862 ) ) ( not ( = ?auto_418860 ?auto_418863 ) ) ( not ( = ?auto_418860 ?auto_418864 ) ) ( not ( = ?auto_418860 ?auto_418865 ) ) ( not ( = ?auto_418860 ?auto_418866 ) ) ( not ( = ?auto_418861 ?auto_418862 ) ) ( not ( = ?auto_418861 ?auto_418863 ) ) ( not ( = ?auto_418861 ?auto_418864 ) ) ( not ( = ?auto_418861 ?auto_418865 ) ) ( not ( = ?auto_418861 ?auto_418866 ) ) ( not ( = ?auto_418862 ?auto_418863 ) ) ( not ( = ?auto_418862 ?auto_418864 ) ) ( not ( = ?auto_418862 ?auto_418865 ) ) ( not ( = ?auto_418862 ?auto_418866 ) ) ( not ( = ?auto_418863 ?auto_418864 ) ) ( not ( = ?auto_418863 ?auto_418865 ) ) ( not ( = ?auto_418863 ?auto_418866 ) ) ( not ( = ?auto_418864 ?auto_418865 ) ) ( not ( = ?auto_418864 ?auto_418866 ) ) ( not ( = ?auto_418865 ?auto_418866 ) ) ( ON ?auto_418864 ?auto_418865 ) ( ON ?auto_418863 ?auto_418864 ) ( ON ?auto_418862 ?auto_418863 ) ( ON ?auto_418861 ?auto_418862 ) ( ON ?auto_418860 ?auto_418861 ) ( ON ?auto_418859 ?auto_418860 ) ( ON ?auto_418858 ?auto_418859 ) ( CLEAR ?auto_418858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_418858 )
      ( MAKE-8PILE ?auto_418858 ?auto_418859 ?auto_418860 ?auto_418861 ?auto_418862 ?auto_418863 ?auto_418864 ?auto_418865 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_418893 - BLOCK
      ?auto_418894 - BLOCK
      ?auto_418895 - BLOCK
      ?auto_418896 - BLOCK
      ?auto_418897 - BLOCK
      ?auto_418898 - BLOCK
      ?auto_418899 - BLOCK
      ?auto_418900 - BLOCK
      ?auto_418901 - BLOCK
    )
    :vars
    (
      ?auto_418902 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_418900 ) ( ON ?auto_418901 ?auto_418902 ) ( CLEAR ?auto_418901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_418893 ) ( ON ?auto_418894 ?auto_418893 ) ( ON ?auto_418895 ?auto_418894 ) ( ON ?auto_418896 ?auto_418895 ) ( ON ?auto_418897 ?auto_418896 ) ( ON ?auto_418898 ?auto_418897 ) ( ON ?auto_418899 ?auto_418898 ) ( ON ?auto_418900 ?auto_418899 ) ( not ( = ?auto_418893 ?auto_418894 ) ) ( not ( = ?auto_418893 ?auto_418895 ) ) ( not ( = ?auto_418893 ?auto_418896 ) ) ( not ( = ?auto_418893 ?auto_418897 ) ) ( not ( = ?auto_418893 ?auto_418898 ) ) ( not ( = ?auto_418893 ?auto_418899 ) ) ( not ( = ?auto_418893 ?auto_418900 ) ) ( not ( = ?auto_418893 ?auto_418901 ) ) ( not ( = ?auto_418893 ?auto_418902 ) ) ( not ( = ?auto_418894 ?auto_418895 ) ) ( not ( = ?auto_418894 ?auto_418896 ) ) ( not ( = ?auto_418894 ?auto_418897 ) ) ( not ( = ?auto_418894 ?auto_418898 ) ) ( not ( = ?auto_418894 ?auto_418899 ) ) ( not ( = ?auto_418894 ?auto_418900 ) ) ( not ( = ?auto_418894 ?auto_418901 ) ) ( not ( = ?auto_418894 ?auto_418902 ) ) ( not ( = ?auto_418895 ?auto_418896 ) ) ( not ( = ?auto_418895 ?auto_418897 ) ) ( not ( = ?auto_418895 ?auto_418898 ) ) ( not ( = ?auto_418895 ?auto_418899 ) ) ( not ( = ?auto_418895 ?auto_418900 ) ) ( not ( = ?auto_418895 ?auto_418901 ) ) ( not ( = ?auto_418895 ?auto_418902 ) ) ( not ( = ?auto_418896 ?auto_418897 ) ) ( not ( = ?auto_418896 ?auto_418898 ) ) ( not ( = ?auto_418896 ?auto_418899 ) ) ( not ( = ?auto_418896 ?auto_418900 ) ) ( not ( = ?auto_418896 ?auto_418901 ) ) ( not ( = ?auto_418896 ?auto_418902 ) ) ( not ( = ?auto_418897 ?auto_418898 ) ) ( not ( = ?auto_418897 ?auto_418899 ) ) ( not ( = ?auto_418897 ?auto_418900 ) ) ( not ( = ?auto_418897 ?auto_418901 ) ) ( not ( = ?auto_418897 ?auto_418902 ) ) ( not ( = ?auto_418898 ?auto_418899 ) ) ( not ( = ?auto_418898 ?auto_418900 ) ) ( not ( = ?auto_418898 ?auto_418901 ) ) ( not ( = ?auto_418898 ?auto_418902 ) ) ( not ( = ?auto_418899 ?auto_418900 ) ) ( not ( = ?auto_418899 ?auto_418901 ) ) ( not ( = ?auto_418899 ?auto_418902 ) ) ( not ( = ?auto_418900 ?auto_418901 ) ) ( not ( = ?auto_418900 ?auto_418902 ) ) ( not ( = ?auto_418901 ?auto_418902 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_418901 ?auto_418902 )
      ( !STACK ?auto_418901 ?auto_418900 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_418931 - BLOCK
      ?auto_418932 - BLOCK
      ?auto_418933 - BLOCK
      ?auto_418934 - BLOCK
      ?auto_418935 - BLOCK
      ?auto_418936 - BLOCK
      ?auto_418937 - BLOCK
      ?auto_418938 - BLOCK
      ?auto_418939 - BLOCK
    )
    :vars
    (
      ?auto_418940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418939 ?auto_418940 ) ( ON-TABLE ?auto_418931 ) ( ON ?auto_418932 ?auto_418931 ) ( ON ?auto_418933 ?auto_418932 ) ( ON ?auto_418934 ?auto_418933 ) ( ON ?auto_418935 ?auto_418934 ) ( ON ?auto_418936 ?auto_418935 ) ( ON ?auto_418937 ?auto_418936 ) ( not ( = ?auto_418931 ?auto_418932 ) ) ( not ( = ?auto_418931 ?auto_418933 ) ) ( not ( = ?auto_418931 ?auto_418934 ) ) ( not ( = ?auto_418931 ?auto_418935 ) ) ( not ( = ?auto_418931 ?auto_418936 ) ) ( not ( = ?auto_418931 ?auto_418937 ) ) ( not ( = ?auto_418931 ?auto_418938 ) ) ( not ( = ?auto_418931 ?auto_418939 ) ) ( not ( = ?auto_418931 ?auto_418940 ) ) ( not ( = ?auto_418932 ?auto_418933 ) ) ( not ( = ?auto_418932 ?auto_418934 ) ) ( not ( = ?auto_418932 ?auto_418935 ) ) ( not ( = ?auto_418932 ?auto_418936 ) ) ( not ( = ?auto_418932 ?auto_418937 ) ) ( not ( = ?auto_418932 ?auto_418938 ) ) ( not ( = ?auto_418932 ?auto_418939 ) ) ( not ( = ?auto_418932 ?auto_418940 ) ) ( not ( = ?auto_418933 ?auto_418934 ) ) ( not ( = ?auto_418933 ?auto_418935 ) ) ( not ( = ?auto_418933 ?auto_418936 ) ) ( not ( = ?auto_418933 ?auto_418937 ) ) ( not ( = ?auto_418933 ?auto_418938 ) ) ( not ( = ?auto_418933 ?auto_418939 ) ) ( not ( = ?auto_418933 ?auto_418940 ) ) ( not ( = ?auto_418934 ?auto_418935 ) ) ( not ( = ?auto_418934 ?auto_418936 ) ) ( not ( = ?auto_418934 ?auto_418937 ) ) ( not ( = ?auto_418934 ?auto_418938 ) ) ( not ( = ?auto_418934 ?auto_418939 ) ) ( not ( = ?auto_418934 ?auto_418940 ) ) ( not ( = ?auto_418935 ?auto_418936 ) ) ( not ( = ?auto_418935 ?auto_418937 ) ) ( not ( = ?auto_418935 ?auto_418938 ) ) ( not ( = ?auto_418935 ?auto_418939 ) ) ( not ( = ?auto_418935 ?auto_418940 ) ) ( not ( = ?auto_418936 ?auto_418937 ) ) ( not ( = ?auto_418936 ?auto_418938 ) ) ( not ( = ?auto_418936 ?auto_418939 ) ) ( not ( = ?auto_418936 ?auto_418940 ) ) ( not ( = ?auto_418937 ?auto_418938 ) ) ( not ( = ?auto_418937 ?auto_418939 ) ) ( not ( = ?auto_418937 ?auto_418940 ) ) ( not ( = ?auto_418938 ?auto_418939 ) ) ( not ( = ?auto_418938 ?auto_418940 ) ) ( not ( = ?auto_418939 ?auto_418940 ) ) ( CLEAR ?auto_418937 ) ( ON ?auto_418938 ?auto_418939 ) ( CLEAR ?auto_418938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_418931 ?auto_418932 ?auto_418933 ?auto_418934 ?auto_418935 ?auto_418936 ?auto_418937 ?auto_418938 )
      ( MAKE-9PILE ?auto_418931 ?auto_418932 ?auto_418933 ?auto_418934 ?auto_418935 ?auto_418936 ?auto_418937 ?auto_418938 ?auto_418939 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_418969 - BLOCK
      ?auto_418970 - BLOCK
      ?auto_418971 - BLOCK
      ?auto_418972 - BLOCK
      ?auto_418973 - BLOCK
      ?auto_418974 - BLOCK
      ?auto_418975 - BLOCK
      ?auto_418976 - BLOCK
      ?auto_418977 - BLOCK
    )
    :vars
    (
      ?auto_418978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_418977 ?auto_418978 ) ( ON-TABLE ?auto_418969 ) ( ON ?auto_418970 ?auto_418969 ) ( ON ?auto_418971 ?auto_418970 ) ( ON ?auto_418972 ?auto_418971 ) ( ON ?auto_418973 ?auto_418972 ) ( ON ?auto_418974 ?auto_418973 ) ( not ( = ?auto_418969 ?auto_418970 ) ) ( not ( = ?auto_418969 ?auto_418971 ) ) ( not ( = ?auto_418969 ?auto_418972 ) ) ( not ( = ?auto_418969 ?auto_418973 ) ) ( not ( = ?auto_418969 ?auto_418974 ) ) ( not ( = ?auto_418969 ?auto_418975 ) ) ( not ( = ?auto_418969 ?auto_418976 ) ) ( not ( = ?auto_418969 ?auto_418977 ) ) ( not ( = ?auto_418969 ?auto_418978 ) ) ( not ( = ?auto_418970 ?auto_418971 ) ) ( not ( = ?auto_418970 ?auto_418972 ) ) ( not ( = ?auto_418970 ?auto_418973 ) ) ( not ( = ?auto_418970 ?auto_418974 ) ) ( not ( = ?auto_418970 ?auto_418975 ) ) ( not ( = ?auto_418970 ?auto_418976 ) ) ( not ( = ?auto_418970 ?auto_418977 ) ) ( not ( = ?auto_418970 ?auto_418978 ) ) ( not ( = ?auto_418971 ?auto_418972 ) ) ( not ( = ?auto_418971 ?auto_418973 ) ) ( not ( = ?auto_418971 ?auto_418974 ) ) ( not ( = ?auto_418971 ?auto_418975 ) ) ( not ( = ?auto_418971 ?auto_418976 ) ) ( not ( = ?auto_418971 ?auto_418977 ) ) ( not ( = ?auto_418971 ?auto_418978 ) ) ( not ( = ?auto_418972 ?auto_418973 ) ) ( not ( = ?auto_418972 ?auto_418974 ) ) ( not ( = ?auto_418972 ?auto_418975 ) ) ( not ( = ?auto_418972 ?auto_418976 ) ) ( not ( = ?auto_418972 ?auto_418977 ) ) ( not ( = ?auto_418972 ?auto_418978 ) ) ( not ( = ?auto_418973 ?auto_418974 ) ) ( not ( = ?auto_418973 ?auto_418975 ) ) ( not ( = ?auto_418973 ?auto_418976 ) ) ( not ( = ?auto_418973 ?auto_418977 ) ) ( not ( = ?auto_418973 ?auto_418978 ) ) ( not ( = ?auto_418974 ?auto_418975 ) ) ( not ( = ?auto_418974 ?auto_418976 ) ) ( not ( = ?auto_418974 ?auto_418977 ) ) ( not ( = ?auto_418974 ?auto_418978 ) ) ( not ( = ?auto_418975 ?auto_418976 ) ) ( not ( = ?auto_418975 ?auto_418977 ) ) ( not ( = ?auto_418975 ?auto_418978 ) ) ( not ( = ?auto_418976 ?auto_418977 ) ) ( not ( = ?auto_418976 ?auto_418978 ) ) ( not ( = ?auto_418977 ?auto_418978 ) ) ( ON ?auto_418976 ?auto_418977 ) ( CLEAR ?auto_418974 ) ( ON ?auto_418975 ?auto_418976 ) ( CLEAR ?auto_418975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_418969 ?auto_418970 ?auto_418971 ?auto_418972 ?auto_418973 ?auto_418974 ?auto_418975 )
      ( MAKE-9PILE ?auto_418969 ?auto_418970 ?auto_418971 ?auto_418972 ?auto_418973 ?auto_418974 ?auto_418975 ?auto_418976 ?auto_418977 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_419007 - BLOCK
      ?auto_419008 - BLOCK
      ?auto_419009 - BLOCK
      ?auto_419010 - BLOCK
      ?auto_419011 - BLOCK
      ?auto_419012 - BLOCK
      ?auto_419013 - BLOCK
      ?auto_419014 - BLOCK
      ?auto_419015 - BLOCK
    )
    :vars
    (
      ?auto_419016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419015 ?auto_419016 ) ( ON-TABLE ?auto_419007 ) ( ON ?auto_419008 ?auto_419007 ) ( ON ?auto_419009 ?auto_419008 ) ( ON ?auto_419010 ?auto_419009 ) ( ON ?auto_419011 ?auto_419010 ) ( not ( = ?auto_419007 ?auto_419008 ) ) ( not ( = ?auto_419007 ?auto_419009 ) ) ( not ( = ?auto_419007 ?auto_419010 ) ) ( not ( = ?auto_419007 ?auto_419011 ) ) ( not ( = ?auto_419007 ?auto_419012 ) ) ( not ( = ?auto_419007 ?auto_419013 ) ) ( not ( = ?auto_419007 ?auto_419014 ) ) ( not ( = ?auto_419007 ?auto_419015 ) ) ( not ( = ?auto_419007 ?auto_419016 ) ) ( not ( = ?auto_419008 ?auto_419009 ) ) ( not ( = ?auto_419008 ?auto_419010 ) ) ( not ( = ?auto_419008 ?auto_419011 ) ) ( not ( = ?auto_419008 ?auto_419012 ) ) ( not ( = ?auto_419008 ?auto_419013 ) ) ( not ( = ?auto_419008 ?auto_419014 ) ) ( not ( = ?auto_419008 ?auto_419015 ) ) ( not ( = ?auto_419008 ?auto_419016 ) ) ( not ( = ?auto_419009 ?auto_419010 ) ) ( not ( = ?auto_419009 ?auto_419011 ) ) ( not ( = ?auto_419009 ?auto_419012 ) ) ( not ( = ?auto_419009 ?auto_419013 ) ) ( not ( = ?auto_419009 ?auto_419014 ) ) ( not ( = ?auto_419009 ?auto_419015 ) ) ( not ( = ?auto_419009 ?auto_419016 ) ) ( not ( = ?auto_419010 ?auto_419011 ) ) ( not ( = ?auto_419010 ?auto_419012 ) ) ( not ( = ?auto_419010 ?auto_419013 ) ) ( not ( = ?auto_419010 ?auto_419014 ) ) ( not ( = ?auto_419010 ?auto_419015 ) ) ( not ( = ?auto_419010 ?auto_419016 ) ) ( not ( = ?auto_419011 ?auto_419012 ) ) ( not ( = ?auto_419011 ?auto_419013 ) ) ( not ( = ?auto_419011 ?auto_419014 ) ) ( not ( = ?auto_419011 ?auto_419015 ) ) ( not ( = ?auto_419011 ?auto_419016 ) ) ( not ( = ?auto_419012 ?auto_419013 ) ) ( not ( = ?auto_419012 ?auto_419014 ) ) ( not ( = ?auto_419012 ?auto_419015 ) ) ( not ( = ?auto_419012 ?auto_419016 ) ) ( not ( = ?auto_419013 ?auto_419014 ) ) ( not ( = ?auto_419013 ?auto_419015 ) ) ( not ( = ?auto_419013 ?auto_419016 ) ) ( not ( = ?auto_419014 ?auto_419015 ) ) ( not ( = ?auto_419014 ?auto_419016 ) ) ( not ( = ?auto_419015 ?auto_419016 ) ) ( ON ?auto_419014 ?auto_419015 ) ( ON ?auto_419013 ?auto_419014 ) ( CLEAR ?auto_419011 ) ( ON ?auto_419012 ?auto_419013 ) ( CLEAR ?auto_419012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_419007 ?auto_419008 ?auto_419009 ?auto_419010 ?auto_419011 ?auto_419012 )
      ( MAKE-9PILE ?auto_419007 ?auto_419008 ?auto_419009 ?auto_419010 ?auto_419011 ?auto_419012 ?auto_419013 ?auto_419014 ?auto_419015 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_419045 - BLOCK
      ?auto_419046 - BLOCK
      ?auto_419047 - BLOCK
      ?auto_419048 - BLOCK
      ?auto_419049 - BLOCK
      ?auto_419050 - BLOCK
      ?auto_419051 - BLOCK
      ?auto_419052 - BLOCK
      ?auto_419053 - BLOCK
    )
    :vars
    (
      ?auto_419054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419053 ?auto_419054 ) ( ON-TABLE ?auto_419045 ) ( ON ?auto_419046 ?auto_419045 ) ( ON ?auto_419047 ?auto_419046 ) ( ON ?auto_419048 ?auto_419047 ) ( not ( = ?auto_419045 ?auto_419046 ) ) ( not ( = ?auto_419045 ?auto_419047 ) ) ( not ( = ?auto_419045 ?auto_419048 ) ) ( not ( = ?auto_419045 ?auto_419049 ) ) ( not ( = ?auto_419045 ?auto_419050 ) ) ( not ( = ?auto_419045 ?auto_419051 ) ) ( not ( = ?auto_419045 ?auto_419052 ) ) ( not ( = ?auto_419045 ?auto_419053 ) ) ( not ( = ?auto_419045 ?auto_419054 ) ) ( not ( = ?auto_419046 ?auto_419047 ) ) ( not ( = ?auto_419046 ?auto_419048 ) ) ( not ( = ?auto_419046 ?auto_419049 ) ) ( not ( = ?auto_419046 ?auto_419050 ) ) ( not ( = ?auto_419046 ?auto_419051 ) ) ( not ( = ?auto_419046 ?auto_419052 ) ) ( not ( = ?auto_419046 ?auto_419053 ) ) ( not ( = ?auto_419046 ?auto_419054 ) ) ( not ( = ?auto_419047 ?auto_419048 ) ) ( not ( = ?auto_419047 ?auto_419049 ) ) ( not ( = ?auto_419047 ?auto_419050 ) ) ( not ( = ?auto_419047 ?auto_419051 ) ) ( not ( = ?auto_419047 ?auto_419052 ) ) ( not ( = ?auto_419047 ?auto_419053 ) ) ( not ( = ?auto_419047 ?auto_419054 ) ) ( not ( = ?auto_419048 ?auto_419049 ) ) ( not ( = ?auto_419048 ?auto_419050 ) ) ( not ( = ?auto_419048 ?auto_419051 ) ) ( not ( = ?auto_419048 ?auto_419052 ) ) ( not ( = ?auto_419048 ?auto_419053 ) ) ( not ( = ?auto_419048 ?auto_419054 ) ) ( not ( = ?auto_419049 ?auto_419050 ) ) ( not ( = ?auto_419049 ?auto_419051 ) ) ( not ( = ?auto_419049 ?auto_419052 ) ) ( not ( = ?auto_419049 ?auto_419053 ) ) ( not ( = ?auto_419049 ?auto_419054 ) ) ( not ( = ?auto_419050 ?auto_419051 ) ) ( not ( = ?auto_419050 ?auto_419052 ) ) ( not ( = ?auto_419050 ?auto_419053 ) ) ( not ( = ?auto_419050 ?auto_419054 ) ) ( not ( = ?auto_419051 ?auto_419052 ) ) ( not ( = ?auto_419051 ?auto_419053 ) ) ( not ( = ?auto_419051 ?auto_419054 ) ) ( not ( = ?auto_419052 ?auto_419053 ) ) ( not ( = ?auto_419052 ?auto_419054 ) ) ( not ( = ?auto_419053 ?auto_419054 ) ) ( ON ?auto_419052 ?auto_419053 ) ( ON ?auto_419051 ?auto_419052 ) ( ON ?auto_419050 ?auto_419051 ) ( CLEAR ?auto_419048 ) ( ON ?auto_419049 ?auto_419050 ) ( CLEAR ?auto_419049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_419045 ?auto_419046 ?auto_419047 ?auto_419048 ?auto_419049 )
      ( MAKE-9PILE ?auto_419045 ?auto_419046 ?auto_419047 ?auto_419048 ?auto_419049 ?auto_419050 ?auto_419051 ?auto_419052 ?auto_419053 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_419083 - BLOCK
      ?auto_419084 - BLOCK
      ?auto_419085 - BLOCK
      ?auto_419086 - BLOCK
      ?auto_419087 - BLOCK
      ?auto_419088 - BLOCK
      ?auto_419089 - BLOCK
      ?auto_419090 - BLOCK
      ?auto_419091 - BLOCK
    )
    :vars
    (
      ?auto_419092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419091 ?auto_419092 ) ( ON-TABLE ?auto_419083 ) ( ON ?auto_419084 ?auto_419083 ) ( ON ?auto_419085 ?auto_419084 ) ( not ( = ?auto_419083 ?auto_419084 ) ) ( not ( = ?auto_419083 ?auto_419085 ) ) ( not ( = ?auto_419083 ?auto_419086 ) ) ( not ( = ?auto_419083 ?auto_419087 ) ) ( not ( = ?auto_419083 ?auto_419088 ) ) ( not ( = ?auto_419083 ?auto_419089 ) ) ( not ( = ?auto_419083 ?auto_419090 ) ) ( not ( = ?auto_419083 ?auto_419091 ) ) ( not ( = ?auto_419083 ?auto_419092 ) ) ( not ( = ?auto_419084 ?auto_419085 ) ) ( not ( = ?auto_419084 ?auto_419086 ) ) ( not ( = ?auto_419084 ?auto_419087 ) ) ( not ( = ?auto_419084 ?auto_419088 ) ) ( not ( = ?auto_419084 ?auto_419089 ) ) ( not ( = ?auto_419084 ?auto_419090 ) ) ( not ( = ?auto_419084 ?auto_419091 ) ) ( not ( = ?auto_419084 ?auto_419092 ) ) ( not ( = ?auto_419085 ?auto_419086 ) ) ( not ( = ?auto_419085 ?auto_419087 ) ) ( not ( = ?auto_419085 ?auto_419088 ) ) ( not ( = ?auto_419085 ?auto_419089 ) ) ( not ( = ?auto_419085 ?auto_419090 ) ) ( not ( = ?auto_419085 ?auto_419091 ) ) ( not ( = ?auto_419085 ?auto_419092 ) ) ( not ( = ?auto_419086 ?auto_419087 ) ) ( not ( = ?auto_419086 ?auto_419088 ) ) ( not ( = ?auto_419086 ?auto_419089 ) ) ( not ( = ?auto_419086 ?auto_419090 ) ) ( not ( = ?auto_419086 ?auto_419091 ) ) ( not ( = ?auto_419086 ?auto_419092 ) ) ( not ( = ?auto_419087 ?auto_419088 ) ) ( not ( = ?auto_419087 ?auto_419089 ) ) ( not ( = ?auto_419087 ?auto_419090 ) ) ( not ( = ?auto_419087 ?auto_419091 ) ) ( not ( = ?auto_419087 ?auto_419092 ) ) ( not ( = ?auto_419088 ?auto_419089 ) ) ( not ( = ?auto_419088 ?auto_419090 ) ) ( not ( = ?auto_419088 ?auto_419091 ) ) ( not ( = ?auto_419088 ?auto_419092 ) ) ( not ( = ?auto_419089 ?auto_419090 ) ) ( not ( = ?auto_419089 ?auto_419091 ) ) ( not ( = ?auto_419089 ?auto_419092 ) ) ( not ( = ?auto_419090 ?auto_419091 ) ) ( not ( = ?auto_419090 ?auto_419092 ) ) ( not ( = ?auto_419091 ?auto_419092 ) ) ( ON ?auto_419090 ?auto_419091 ) ( ON ?auto_419089 ?auto_419090 ) ( ON ?auto_419088 ?auto_419089 ) ( ON ?auto_419087 ?auto_419088 ) ( CLEAR ?auto_419085 ) ( ON ?auto_419086 ?auto_419087 ) ( CLEAR ?auto_419086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_419083 ?auto_419084 ?auto_419085 ?auto_419086 )
      ( MAKE-9PILE ?auto_419083 ?auto_419084 ?auto_419085 ?auto_419086 ?auto_419087 ?auto_419088 ?auto_419089 ?auto_419090 ?auto_419091 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_419121 - BLOCK
      ?auto_419122 - BLOCK
      ?auto_419123 - BLOCK
      ?auto_419124 - BLOCK
      ?auto_419125 - BLOCK
      ?auto_419126 - BLOCK
      ?auto_419127 - BLOCK
      ?auto_419128 - BLOCK
      ?auto_419129 - BLOCK
    )
    :vars
    (
      ?auto_419130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419129 ?auto_419130 ) ( ON-TABLE ?auto_419121 ) ( ON ?auto_419122 ?auto_419121 ) ( not ( = ?auto_419121 ?auto_419122 ) ) ( not ( = ?auto_419121 ?auto_419123 ) ) ( not ( = ?auto_419121 ?auto_419124 ) ) ( not ( = ?auto_419121 ?auto_419125 ) ) ( not ( = ?auto_419121 ?auto_419126 ) ) ( not ( = ?auto_419121 ?auto_419127 ) ) ( not ( = ?auto_419121 ?auto_419128 ) ) ( not ( = ?auto_419121 ?auto_419129 ) ) ( not ( = ?auto_419121 ?auto_419130 ) ) ( not ( = ?auto_419122 ?auto_419123 ) ) ( not ( = ?auto_419122 ?auto_419124 ) ) ( not ( = ?auto_419122 ?auto_419125 ) ) ( not ( = ?auto_419122 ?auto_419126 ) ) ( not ( = ?auto_419122 ?auto_419127 ) ) ( not ( = ?auto_419122 ?auto_419128 ) ) ( not ( = ?auto_419122 ?auto_419129 ) ) ( not ( = ?auto_419122 ?auto_419130 ) ) ( not ( = ?auto_419123 ?auto_419124 ) ) ( not ( = ?auto_419123 ?auto_419125 ) ) ( not ( = ?auto_419123 ?auto_419126 ) ) ( not ( = ?auto_419123 ?auto_419127 ) ) ( not ( = ?auto_419123 ?auto_419128 ) ) ( not ( = ?auto_419123 ?auto_419129 ) ) ( not ( = ?auto_419123 ?auto_419130 ) ) ( not ( = ?auto_419124 ?auto_419125 ) ) ( not ( = ?auto_419124 ?auto_419126 ) ) ( not ( = ?auto_419124 ?auto_419127 ) ) ( not ( = ?auto_419124 ?auto_419128 ) ) ( not ( = ?auto_419124 ?auto_419129 ) ) ( not ( = ?auto_419124 ?auto_419130 ) ) ( not ( = ?auto_419125 ?auto_419126 ) ) ( not ( = ?auto_419125 ?auto_419127 ) ) ( not ( = ?auto_419125 ?auto_419128 ) ) ( not ( = ?auto_419125 ?auto_419129 ) ) ( not ( = ?auto_419125 ?auto_419130 ) ) ( not ( = ?auto_419126 ?auto_419127 ) ) ( not ( = ?auto_419126 ?auto_419128 ) ) ( not ( = ?auto_419126 ?auto_419129 ) ) ( not ( = ?auto_419126 ?auto_419130 ) ) ( not ( = ?auto_419127 ?auto_419128 ) ) ( not ( = ?auto_419127 ?auto_419129 ) ) ( not ( = ?auto_419127 ?auto_419130 ) ) ( not ( = ?auto_419128 ?auto_419129 ) ) ( not ( = ?auto_419128 ?auto_419130 ) ) ( not ( = ?auto_419129 ?auto_419130 ) ) ( ON ?auto_419128 ?auto_419129 ) ( ON ?auto_419127 ?auto_419128 ) ( ON ?auto_419126 ?auto_419127 ) ( ON ?auto_419125 ?auto_419126 ) ( ON ?auto_419124 ?auto_419125 ) ( CLEAR ?auto_419122 ) ( ON ?auto_419123 ?auto_419124 ) ( CLEAR ?auto_419123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_419121 ?auto_419122 ?auto_419123 )
      ( MAKE-9PILE ?auto_419121 ?auto_419122 ?auto_419123 ?auto_419124 ?auto_419125 ?auto_419126 ?auto_419127 ?auto_419128 ?auto_419129 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_419159 - BLOCK
      ?auto_419160 - BLOCK
      ?auto_419161 - BLOCK
      ?auto_419162 - BLOCK
      ?auto_419163 - BLOCK
      ?auto_419164 - BLOCK
      ?auto_419165 - BLOCK
      ?auto_419166 - BLOCK
      ?auto_419167 - BLOCK
    )
    :vars
    (
      ?auto_419168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419167 ?auto_419168 ) ( ON-TABLE ?auto_419159 ) ( not ( = ?auto_419159 ?auto_419160 ) ) ( not ( = ?auto_419159 ?auto_419161 ) ) ( not ( = ?auto_419159 ?auto_419162 ) ) ( not ( = ?auto_419159 ?auto_419163 ) ) ( not ( = ?auto_419159 ?auto_419164 ) ) ( not ( = ?auto_419159 ?auto_419165 ) ) ( not ( = ?auto_419159 ?auto_419166 ) ) ( not ( = ?auto_419159 ?auto_419167 ) ) ( not ( = ?auto_419159 ?auto_419168 ) ) ( not ( = ?auto_419160 ?auto_419161 ) ) ( not ( = ?auto_419160 ?auto_419162 ) ) ( not ( = ?auto_419160 ?auto_419163 ) ) ( not ( = ?auto_419160 ?auto_419164 ) ) ( not ( = ?auto_419160 ?auto_419165 ) ) ( not ( = ?auto_419160 ?auto_419166 ) ) ( not ( = ?auto_419160 ?auto_419167 ) ) ( not ( = ?auto_419160 ?auto_419168 ) ) ( not ( = ?auto_419161 ?auto_419162 ) ) ( not ( = ?auto_419161 ?auto_419163 ) ) ( not ( = ?auto_419161 ?auto_419164 ) ) ( not ( = ?auto_419161 ?auto_419165 ) ) ( not ( = ?auto_419161 ?auto_419166 ) ) ( not ( = ?auto_419161 ?auto_419167 ) ) ( not ( = ?auto_419161 ?auto_419168 ) ) ( not ( = ?auto_419162 ?auto_419163 ) ) ( not ( = ?auto_419162 ?auto_419164 ) ) ( not ( = ?auto_419162 ?auto_419165 ) ) ( not ( = ?auto_419162 ?auto_419166 ) ) ( not ( = ?auto_419162 ?auto_419167 ) ) ( not ( = ?auto_419162 ?auto_419168 ) ) ( not ( = ?auto_419163 ?auto_419164 ) ) ( not ( = ?auto_419163 ?auto_419165 ) ) ( not ( = ?auto_419163 ?auto_419166 ) ) ( not ( = ?auto_419163 ?auto_419167 ) ) ( not ( = ?auto_419163 ?auto_419168 ) ) ( not ( = ?auto_419164 ?auto_419165 ) ) ( not ( = ?auto_419164 ?auto_419166 ) ) ( not ( = ?auto_419164 ?auto_419167 ) ) ( not ( = ?auto_419164 ?auto_419168 ) ) ( not ( = ?auto_419165 ?auto_419166 ) ) ( not ( = ?auto_419165 ?auto_419167 ) ) ( not ( = ?auto_419165 ?auto_419168 ) ) ( not ( = ?auto_419166 ?auto_419167 ) ) ( not ( = ?auto_419166 ?auto_419168 ) ) ( not ( = ?auto_419167 ?auto_419168 ) ) ( ON ?auto_419166 ?auto_419167 ) ( ON ?auto_419165 ?auto_419166 ) ( ON ?auto_419164 ?auto_419165 ) ( ON ?auto_419163 ?auto_419164 ) ( ON ?auto_419162 ?auto_419163 ) ( ON ?auto_419161 ?auto_419162 ) ( CLEAR ?auto_419159 ) ( ON ?auto_419160 ?auto_419161 ) ( CLEAR ?auto_419160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_419159 ?auto_419160 )
      ( MAKE-9PILE ?auto_419159 ?auto_419160 ?auto_419161 ?auto_419162 ?auto_419163 ?auto_419164 ?auto_419165 ?auto_419166 ?auto_419167 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_419197 - BLOCK
      ?auto_419198 - BLOCK
      ?auto_419199 - BLOCK
      ?auto_419200 - BLOCK
      ?auto_419201 - BLOCK
      ?auto_419202 - BLOCK
      ?auto_419203 - BLOCK
      ?auto_419204 - BLOCK
      ?auto_419205 - BLOCK
    )
    :vars
    (
      ?auto_419206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419205 ?auto_419206 ) ( not ( = ?auto_419197 ?auto_419198 ) ) ( not ( = ?auto_419197 ?auto_419199 ) ) ( not ( = ?auto_419197 ?auto_419200 ) ) ( not ( = ?auto_419197 ?auto_419201 ) ) ( not ( = ?auto_419197 ?auto_419202 ) ) ( not ( = ?auto_419197 ?auto_419203 ) ) ( not ( = ?auto_419197 ?auto_419204 ) ) ( not ( = ?auto_419197 ?auto_419205 ) ) ( not ( = ?auto_419197 ?auto_419206 ) ) ( not ( = ?auto_419198 ?auto_419199 ) ) ( not ( = ?auto_419198 ?auto_419200 ) ) ( not ( = ?auto_419198 ?auto_419201 ) ) ( not ( = ?auto_419198 ?auto_419202 ) ) ( not ( = ?auto_419198 ?auto_419203 ) ) ( not ( = ?auto_419198 ?auto_419204 ) ) ( not ( = ?auto_419198 ?auto_419205 ) ) ( not ( = ?auto_419198 ?auto_419206 ) ) ( not ( = ?auto_419199 ?auto_419200 ) ) ( not ( = ?auto_419199 ?auto_419201 ) ) ( not ( = ?auto_419199 ?auto_419202 ) ) ( not ( = ?auto_419199 ?auto_419203 ) ) ( not ( = ?auto_419199 ?auto_419204 ) ) ( not ( = ?auto_419199 ?auto_419205 ) ) ( not ( = ?auto_419199 ?auto_419206 ) ) ( not ( = ?auto_419200 ?auto_419201 ) ) ( not ( = ?auto_419200 ?auto_419202 ) ) ( not ( = ?auto_419200 ?auto_419203 ) ) ( not ( = ?auto_419200 ?auto_419204 ) ) ( not ( = ?auto_419200 ?auto_419205 ) ) ( not ( = ?auto_419200 ?auto_419206 ) ) ( not ( = ?auto_419201 ?auto_419202 ) ) ( not ( = ?auto_419201 ?auto_419203 ) ) ( not ( = ?auto_419201 ?auto_419204 ) ) ( not ( = ?auto_419201 ?auto_419205 ) ) ( not ( = ?auto_419201 ?auto_419206 ) ) ( not ( = ?auto_419202 ?auto_419203 ) ) ( not ( = ?auto_419202 ?auto_419204 ) ) ( not ( = ?auto_419202 ?auto_419205 ) ) ( not ( = ?auto_419202 ?auto_419206 ) ) ( not ( = ?auto_419203 ?auto_419204 ) ) ( not ( = ?auto_419203 ?auto_419205 ) ) ( not ( = ?auto_419203 ?auto_419206 ) ) ( not ( = ?auto_419204 ?auto_419205 ) ) ( not ( = ?auto_419204 ?auto_419206 ) ) ( not ( = ?auto_419205 ?auto_419206 ) ) ( ON ?auto_419204 ?auto_419205 ) ( ON ?auto_419203 ?auto_419204 ) ( ON ?auto_419202 ?auto_419203 ) ( ON ?auto_419201 ?auto_419202 ) ( ON ?auto_419200 ?auto_419201 ) ( ON ?auto_419199 ?auto_419200 ) ( ON ?auto_419198 ?auto_419199 ) ( ON ?auto_419197 ?auto_419198 ) ( CLEAR ?auto_419197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_419197 )
      ( MAKE-9PILE ?auto_419197 ?auto_419198 ?auto_419199 ?auto_419200 ?auto_419201 ?auto_419202 ?auto_419203 ?auto_419204 ?auto_419205 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_419236 - BLOCK
      ?auto_419237 - BLOCK
      ?auto_419238 - BLOCK
      ?auto_419239 - BLOCK
      ?auto_419240 - BLOCK
      ?auto_419241 - BLOCK
      ?auto_419242 - BLOCK
      ?auto_419243 - BLOCK
      ?auto_419244 - BLOCK
      ?auto_419245 - BLOCK
    )
    :vars
    (
      ?auto_419246 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_419244 ) ( ON ?auto_419245 ?auto_419246 ) ( CLEAR ?auto_419245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_419236 ) ( ON ?auto_419237 ?auto_419236 ) ( ON ?auto_419238 ?auto_419237 ) ( ON ?auto_419239 ?auto_419238 ) ( ON ?auto_419240 ?auto_419239 ) ( ON ?auto_419241 ?auto_419240 ) ( ON ?auto_419242 ?auto_419241 ) ( ON ?auto_419243 ?auto_419242 ) ( ON ?auto_419244 ?auto_419243 ) ( not ( = ?auto_419236 ?auto_419237 ) ) ( not ( = ?auto_419236 ?auto_419238 ) ) ( not ( = ?auto_419236 ?auto_419239 ) ) ( not ( = ?auto_419236 ?auto_419240 ) ) ( not ( = ?auto_419236 ?auto_419241 ) ) ( not ( = ?auto_419236 ?auto_419242 ) ) ( not ( = ?auto_419236 ?auto_419243 ) ) ( not ( = ?auto_419236 ?auto_419244 ) ) ( not ( = ?auto_419236 ?auto_419245 ) ) ( not ( = ?auto_419236 ?auto_419246 ) ) ( not ( = ?auto_419237 ?auto_419238 ) ) ( not ( = ?auto_419237 ?auto_419239 ) ) ( not ( = ?auto_419237 ?auto_419240 ) ) ( not ( = ?auto_419237 ?auto_419241 ) ) ( not ( = ?auto_419237 ?auto_419242 ) ) ( not ( = ?auto_419237 ?auto_419243 ) ) ( not ( = ?auto_419237 ?auto_419244 ) ) ( not ( = ?auto_419237 ?auto_419245 ) ) ( not ( = ?auto_419237 ?auto_419246 ) ) ( not ( = ?auto_419238 ?auto_419239 ) ) ( not ( = ?auto_419238 ?auto_419240 ) ) ( not ( = ?auto_419238 ?auto_419241 ) ) ( not ( = ?auto_419238 ?auto_419242 ) ) ( not ( = ?auto_419238 ?auto_419243 ) ) ( not ( = ?auto_419238 ?auto_419244 ) ) ( not ( = ?auto_419238 ?auto_419245 ) ) ( not ( = ?auto_419238 ?auto_419246 ) ) ( not ( = ?auto_419239 ?auto_419240 ) ) ( not ( = ?auto_419239 ?auto_419241 ) ) ( not ( = ?auto_419239 ?auto_419242 ) ) ( not ( = ?auto_419239 ?auto_419243 ) ) ( not ( = ?auto_419239 ?auto_419244 ) ) ( not ( = ?auto_419239 ?auto_419245 ) ) ( not ( = ?auto_419239 ?auto_419246 ) ) ( not ( = ?auto_419240 ?auto_419241 ) ) ( not ( = ?auto_419240 ?auto_419242 ) ) ( not ( = ?auto_419240 ?auto_419243 ) ) ( not ( = ?auto_419240 ?auto_419244 ) ) ( not ( = ?auto_419240 ?auto_419245 ) ) ( not ( = ?auto_419240 ?auto_419246 ) ) ( not ( = ?auto_419241 ?auto_419242 ) ) ( not ( = ?auto_419241 ?auto_419243 ) ) ( not ( = ?auto_419241 ?auto_419244 ) ) ( not ( = ?auto_419241 ?auto_419245 ) ) ( not ( = ?auto_419241 ?auto_419246 ) ) ( not ( = ?auto_419242 ?auto_419243 ) ) ( not ( = ?auto_419242 ?auto_419244 ) ) ( not ( = ?auto_419242 ?auto_419245 ) ) ( not ( = ?auto_419242 ?auto_419246 ) ) ( not ( = ?auto_419243 ?auto_419244 ) ) ( not ( = ?auto_419243 ?auto_419245 ) ) ( not ( = ?auto_419243 ?auto_419246 ) ) ( not ( = ?auto_419244 ?auto_419245 ) ) ( not ( = ?auto_419244 ?auto_419246 ) ) ( not ( = ?auto_419245 ?auto_419246 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_419245 ?auto_419246 )
      ( !STACK ?auto_419245 ?auto_419244 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_419278 - BLOCK
      ?auto_419279 - BLOCK
      ?auto_419280 - BLOCK
      ?auto_419281 - BLOCK
      ?auto_419282 - BLOCK
      ?auto_419283 - BLOCK
      ?auto_419284 - BLOCK
      ?auto_419285 - BLOCK
      ?auto_419286 - BLOCK
      ?auto_419287 - BLOCK
    )
    :vars
    (
      ?auto_419288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419287 ?auto_419288 ) ( ON-TABLE ?auto_419278 ) ( ON ?auto_419279 ?auto_419278 ) ( ON ?auto_419280 ?auto_419279 ) ( ON ?auto_419281 ?auto_419280 ) ( ON ?auto_419282 ?auto_419281 ) ( ON ?auto_419283 ?auto_419282 ) ( ON ?auto_419284 ?auto_419283 ) ( ON ?auto_419285 ?auto_419284 ) ( not ( = ?auto_419278 ?auto_419279 ) ) ( not ( = ?auto_419278 ?auto_419280 ) ) ( not ( = ?auto_419278 ?auto_419281 ) ) ( not ( = ?auto_419278 ?auto_419282 ) ) ( not ( = ?auto_419278 ?auto_419283 ) ) ( not ( = ?auto_419278 ?auto_419284 ) ) ( not ( = ?auto_419278 ?auto_419285 ) ) ( not ( = ?auto_419278 ?auto_419286 ) ) ( not ( = ?auto_419278 ?auto_419287 ) ) ( not ( = ?auto_419278 ?auto_419288 ) ) ( not ( = ?auto_419279 ?auto_419280 ) ) ( not ( = ?auto_419279 ?auto_419281 ) ) ( not ( = ?auto_419279 ?auto_419282 ) ) ( not ( = ?auto_419279 ?auto_419283 ) ) ( not ( = ?auto_419279 ?auto_419284 ) ) ( not ( = ?auto_419279 ?auto_419285 ) ) ( not ( = ?auto_419279 ?auto_419286 ) ) ( not ( = ?auto_419279 ?auto_419287 ) ) ( not ( = ?auto_419279 ?auto_419288 ) ) ( not ( = ?auto_419280 ?auto_419281 ) ) ( not ( = ?auto_419280 ?auto_419282 ) ) ( not ( = ?auto_419280 ?auto_419283 ) ) ( not ( = ?auto_419280 ?auto_419284 ) ) ( not ( = ?auto_419280 ?auto_419285 ) ) ( not ( = ?auto_419280 ?auto_419286 ) ) ( not ( = ?auto_419280 ?auto_419287 ) ) ( not ( = ?auto_419280 ?auto_419288 ) ) ( not ( = ?auto_419281 ?auto_419282 ) ) ( not ( = ?auto_419281 ?auto_419283 ) ) ( not ( = ?auto_419281 ?auto_419284 ) ) ( not ( = ?auto_419281 ?auto_419285 ) ) ( not ( = ?auto_419281 ?auto_419286 ) ) ( not ( = ?auto_419281 ?auto_419287 ) ) ( not ( = ?auto_419281 ?auto_419288 ) ) ( not ( = ?auto_419282 ?auto_419283 ) ) ( not ( = ?auto_419282 ?auto_419284 ) ) ( not ( = ?auto_419282 ?auto_419285 ) ) ( not ( = ?auto_419282 ?auto_419286 ) ) ( not ( = ?auto_419282 ?auto_419287 ) ) ( not ( = ?auto_419282 ?auto_419288 ) ) ( not ( = ?auto_419283 ?auto_419284 ) ) ( not ( = ?auto_419283 ?auto_419285 ) ) ( not ( = ?auto_419283 ?auto_419286 ) ) ( not ( = ?auto_419283 ?auto_419287 ) ) ( not ( = ?auto_419283 ?auto_419288 ) ) ( not ( = ?auto_419284 ?auto_419285 ) ) ( not ( = ?auto_419284 ?auto_419286 ) ) ( not ( = ?auto_419284 ?auto_419287 ) ) ( not ( = ?auto_419284 ?auto_419288 ) ) ( not ( = ?auto_419285 ?auto_419286 ) ) ( not ( = ?auto_419285 ?auto_419287 ) ) ( not ( = ?auto_419285 ?auto_419288 ) ) ( not ( = ?auto_419286 ?auto_419287 ) ) ( not ( = ?auto_419286 ?auto_419288 ) ) ( not ( = ?auto_419287 ?auto_419288 ) ) ( CLEAR ?auto_419285 ) ( ON ?auto_419286 ?auto_419287 ) ( CLEAR ?auto_419286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_419278 ?auto_419279 ?auto_419280 ?auto_419281 ?auto_419282 ?auto_419283 ?auto_419284 ?auto_419285 ?auto_419286 )
      ( MAKE-10PILE ?auto_419278 ?auto_419279 ?auto_419280 ?auto_419281 ?auto_419282 ?auto_419283 ?auto_419284 ?auto_419285 ?auto_419286 ?auto_419287 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_419320 - BLOCK
      ?auto_419321 - BLOCK
      ?auto_419322 - BLOCK
      ?auto_419323 - BLOCK
      ?auto_419324 - BLOCK
      ?auto_419325 - BLOCK
      ?auto_419326 - BLOCK
      ?auto_419327 - BLOCK
      ?auto_419328 - BLOCK
      ?auto_419329 - BLOCK
    )
    :vars
    (
      ?auto_419330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419329 ?auto_419330 ) ( ON-TABLE ?auto_419320 ) ( ON ?auto_419321 ?auto_419320 ) ( ON ?auto_419322 ?auto_419321 ) ( ON ?auto_419323 ?auto_419322 ) ( ON ?auto_419324 ?auto_419323 ) ( ON ?auto_419325 ?auto_419324 ) ( ON ?auto_419326 ?auto_419325 ) ( not ( = ?auto_419320 ?auto_419321 ) ) ( not ( = ?auto_419320 ?auto_419322 ) ) ( not ( = ?auto_419320 ?auto_419323 ) ) ( not ( = ?auto_419320 ?auto_419324 ) ) ( not ( = ?auto_419320 ?auto_419325 ) ) ( not ( = ?auto_419320 ?auto_419326 ) ) ( not ( = ?auto_419320 ?auto_419327 ) ) ( not ( = ?auto_419320 ?auto_419328 ) ) ( not ( = ?auto_419320 ?auto_419329 ) ) ( not ( = ?auto_419320 ?auto_419330 ) ) ( not ( = ?auto_419321 ?auto_419322 ) ) ( not ( = ?auto_419321 ?auto_419323 ) ) ( not ( = ?auto_419321 ?auto_419324 ) ) ( not ( = ?auto_419321 ?auto_419325 ) ) ( not ( = ?auto_419321 ?auto_419326 ) ) ( not ( = ?auto_419321 ?auto_419327 ) ) ( not ( = ?auto_419321 ?auto_419328 ) ) ( not ( = ?auto_419321 ?auto_419329 ) ) ( not ( = ?auto_419321 ?auto_419330 ) ) ( not ( = ?auto_419322 ?auto_419323 ) ) ( not ( = ?auto_419322 ?auto_419324 ) ) ( not ( = ?auto_419322 ?auto_419325 ) ) ( not ( = ?auto_419322 ?auto_419326 ) ) ( not ( = ?auto_419322 ?auto_419327 ) ) ( not ( = ?auto_419322 ?auto_419328 ) ) ( not ( = ?auto_419322 ?auto_419329 ) ) ( not ( = ?auto_419322 ?auto_419330 ) ) ( not ( = ?auto_419323 ?auto_419324 ) ) ( not ( = ?auto_419323 ?auto_419325 ) ) ( not ( = ?auto_419323 ?auto_419326 ) ) ( not ( = ?auto_419323 ?auto_419327 ) ) ( not ( = ?auto_419323 ?auto_419328 ) ) ( not ( = ?auto_419323 ?auto_419329 ) ) ( not ( = ?auto_419323 ?auto_419330 ) ) ( not ( = ?auto_419324 ?auto_419325 ) ) ( not ( = ?auto_419324 ?auto_419326 ) ) ( not ( = ?auto_419324 ?auto_419327 ) ) ( not ( = ?auto_419324 ?auto_419328 ) ) ( not ( = ?auto_419324 ?auto_419329 ) ) ( not ( = ?auto_419324 ?auto_419330 ) ) ( not ( = ?auto_419325 ?auto_419326 ) ) ( not ( = ?auto_419325 ?auto_419327 ) ) ( not ( = ?auto_419325 ?auto_419328 ) ) ( not ( = ?auto_419325 ?auto_419329 ) ) ( not ( = ?auto_419325 ?auto_419330 ) ) ( not ( = ?auto_419326 ?auto_419327 ) ) ( not ( = ?auto_419326 ?auto_419328 ) ) ( not ( = ?auto_419326 ?auto_419329 ) ) ( not ( = ?auto_419326 ?auto_419330 ) ) ( not ( = ?auto_419327 ?auto_419328 ) ) ( not ( = ?auto_419327 ?auto_419329 ) ) ( not ( = ?auto_419327 ?auto_419330 ) ) ( not ( = ?auto_419328 ?auto_419329 ) ) ( not ( = ?auto_419328 ?auto_419330 ) ) ( not ( = ?auto_419329 ?auto_419330 ) ) ( ON ?auto_419328 ?auto_419329 ) ( CLEAR ?auto_419326 ) ( ON ?auto_419327 ?auto_419328 ) ( CLEAR ?auto_419327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_419320 ?auto_419321 ?auto_419322 ?auto_419323 ?auto_419324 ?auto_419325 ?auto_419326 ?auto_419327 )
      ( MAKE-10PILE ?auto_419320 ?auto_419321 ?auto_419322 ?auto_419323 ?auto_419324 ?auto_419325 ?auto_419326 ?auto_419327 ?auto_419328 ?auto_419329 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_419362 - BLOCK
      ?auto_419363 - BLOCK
      ?auto_419364 - BLOCK
      ?auto_419365 - BLOCK
      ?auto_419366 - BLOCK
      ?auto_419367 - BLOCK
      ?auto_419368 - BLOCK
      ?auto_419369 - BLOCK
      ?auto_419370 - BLOCK
      ?auto_419371 - BLOCK
    )
    :vars
    (
      ?auto_419372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419371 ?auto_419372 ) ( ON-TABLE ?auto_419362 ) ( ON ?auto_419363 ?auto_419362 ) ( ON ?auto_419364 ?auto_419363 ) ( ON ?auto_419365 ?auto_419364 ) ( ON ?auto_419366 ?auto_419365 ) ( ON ?auto_419367 ?auto_419366 ) ( not ( = ?auto_419362 ?auto_419363 ) ) ( not ( = ?auto_419362 ?auto_419364 ) ) ( not ( = ?auto_419362 ?auto_419365 ) ) ( not ( = ?auto_419362 ?auto_419366 ) ) ( not ( = ?auto_419362 ?auto_419367 ) ) ( not ( = ?auto_419362 ?auto_419368 ) ) ( not ( = ?auto_419362 ?auto_419369 ) ) ( not ( = ?auto_419362 ?auto_419370 ) ) ( not ( = ?auto_419362 ?auto_419371 ) ) ( not ( = ?auto_419362 ?auto_419372 ) ) ( not ( = ?auto_419363 ?auto_419364 ) ) ( not ( = ?auto_419363 ?auto_419365 ) ) ( not ( = ?auto_419363 ?auto_419366 ) ) ( not ( = ?auto_419363 ?auto_419367 ) ) ( not ( = ?auto_419363 ?auto_419368 ) ) ( not ( = ?auto_419363 ?auto_419369 ) ) ( not ( = ?auto_419363 ?auto_419370 ) ) ( not ( = ?auto_419363 ?auto_419371 ) ) ( not ( = ?auto_419363 ?auto_419372 ) ) ( not ( = ?auto_419364 ?auto_419365 ) ) ( not ( = ?auto_419364 ?auto_419366 ) ) ( not ( = ?auto_419364 ?auto_419367 ) ) ( not ( = ?auto_419364 ?auto_419368 ) ) ( not ( = ?auto_419364 ?auto_419369 ) ) ( not ( = ?auto_419364 ?auto_419370 ) ) ( not ( = ?auto_419364 ?auto_419371 ) ) ( not ( = ?auto_419364 ?auto_419372 ) ) ( not ( = ?auto_419365 ?auto_419366 ) ) ( not ( = ?auto_419365 ?auto_419367 ) ) ( not ( = ?auto_419365 ?auto_419368 ) ) ( not ( = ?auto_419365 ?auto_419369 ) ) ( not ( = ?auto_419365 ?auto_419370 ) ) ( not ( = ?auto_419365 ?auto_419371 ) ) ( not ( = ?auto_419365 ?auto_419372 ) ) ( not ( = ?auto_419366 ?auto_419367 ) ) ( not ( = ?auto_419366 ?auto_419368 ) ) ( not ( = ?auto_419366 ?auto_419369 ) ) ( not ( = ?auto_419366 ?auto_419370 ) ) ( not ( = ?auto_419366 ?auto_419371 ) ) ( not ( = ?auto_419366 ?auto_419372 ) ) ( not ( = ?auto_419367 ?auto_419368 ) ) ( not ( = ?auto_419367 ?auto_419369 ) ) ( not ( = ?auto_419367 ?auto_419370 ) ) ( not ( = ?auto_419367 ?auto_419371 ) ) ( not ( = ?auto_419367 ?auto_419372 ) ) ( not ( = ?auto_419368 ?auto_419369 ) ) ( not ( = ?auto_419368 ?auto_419370 ) ) ( not ( = ?auto_419368 ?auto_419371 ) ) ( not ( = ?auto_419368 ?auto_419372 ) ) ( not ( = ?auto_419369 ?auto_419370 ) ) ( not ( = ?auto_419369 ?auto_419371 ) ) ( not ( = ?auto_419369 ?auto_419372 ) ) ( not ( = ?auto_419370 ?auto_419371 ) ) ( not ( = ?auto_419370 ?auto_419372 ) ) ( not ( = ?auto_419371 ?auto_419372 ) ) ( ON ?auto_419370 ?auto_419371 ) ( ON ?auto_419369 ?auto_419370 ) ( CLEAR ?auto_419367 ) ( ON ?auto_419368 ?auto_419369 ) ( CLEAR ?auto_419368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_419362 ?auto_419363 ?auto_419364 ?auto_419365 ?auto_419366 ?auto_419367 ?auto_419368 )
      ( MAKE-10PILE ?auto_419362 ?auto_419363 ?auto_419364 ?auto_419365 ?auto_419366 ?auto_419367 ?auto_419368 ?auto_419369 ?auto_419370 ?auto_419371 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_419404 - BLOCK
      ?auto_419405 - BLOCK
      ?auto_419406 - BLOCK
      ?auto_419407 - BLOCK
      ?auto_419408 - BLOCK
      ?auto_419409 - BLOCK
      ?auto_419410 - BLOCK
      ?auto_419411 - BLOCK
      ?auto_419412 - BLOCK
      ?auto_419413 - BLOCK
    )
    :vars
    (
      ?auto_419414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419413 ?auto_419414 ) ( ON-TABLE ?auto_419404 ) ( ON ?auto_419405 ?auto_419404 ) ( ON ?auto_419406 ?auto_419405 ) ( ON ?auto_419407 ?auto_419406 ) ( ON ?auto_419408 ?auto_419407 ) ( not ( = ?auto_419404 ?auto_419405 ) ) ( not ( = ?auto_419404 ?auto_419406 ) ) ( not ( = ?auto_419404 ?auto_419407 ) ) ( not ( = ?auto_419404 ?auto_419408 ) ) ( not ( = ?auto_419404 ?auto_419409 ) ) ( not ( = ?auto_419404 ?auto_419410 ) ) ( not ( = ?auto_419404 ?auto_419411 ) ) ( not ( = ?auto_419404 ?auto_419412 ) ) ( not ( = ?auto_419404 ?auto_419413 ) ) ( not ( = ?auto_419404 ?auto_419414 ) ) ( not ( = ?auto_419405 ?auto_419406 ) ) ( not ( = ?auto_419405 ?auto_419407 ) ) ( not ( = ?auto_419405 ?auto_419408 ) ) ( not ( = ?auto_419405 ?auto_419409 ) ) ( not ( = ?auto_419405 ?auto_419410 ) ) ( not ( = ?auto_419405 ?auto_419411 ) ) ( not ( = ?auto_419405 ?auto_419412 ) ) ( not ( = ?auto_419405 ?auto_419413 ) ) ( not ( = ?auto_419405 ?auto_419414 ) ) ( not ( = ?auto_419406 ?auto_419407 ) ) ( not ( = ?auto_419406 ?auto_419408 ) ) ( not ( = ?auto_419406 ?auto_419409 ) ) ( not ( = ?auto_419406 ?auto_419410 ) ) ( not ( = ?auto_419406 ?auto_419411 ) ) ( not ( = ?auto_419406 ?auto_419412 ) ) ( not ( = ?auto_419406 ?auto_419413 ) ) ( not ( = ?auto_419406 ?auto_419414 ) ) ( not ( = ?auto_419407 ?auto_419408 ) ) ( not ( = ?auto_419407 ?auto_419409 ) ) ( not ( = ?auto_419407 ?auto_419410 ) ) ( not ( = ?auto_419407 ?auto_419411 ) ) ( not ( = ?auto_419407 ?auto_419412 ) ) ( not ( = ?auto_419407 ?auto_419413 ) ) ( not ( = ?auto_419407 ?auto_419414 ) ) ( not ( = ?auto_419408 ?auto_419409 ) ) ( not ( = ?auto_419408 ?auto_419410 ) ) ( not ( = ?auto_419408 ?auto_419411 ) ) ( not ( = ?auto_419408 ?auto_419412 ) ) ( not ( = ?auto_419408 ?auto_419413 ) ) ( not ( = ?auto_419408 ?auto_419414 ) ) ( not ( = ?auto_419409 ?auto_419410 ) ) ( not ( = ?auto_419409 ?auto_419411 ) ) ( not ( = ?auto_419409 ?auto_419412 ) ) ( not ( = ?auto_419409 ?auto_419413 ) ) ( not ( = ?auto_419409 ?auto_419414 ) ) ( not ( = ?auto_419410 ?auto_419411 ) ) ( not ( = ?auto_419410 ?auto_419412 ) ) ( not ( = ?auto_419410 ?auto_419413 ) ) ( not ( = ?auto_419410 ?auto_419414 ) ) ( not ( = ?auto_419411 ?auto_419412 ) ) ( not ( = ?auto_419411 ?auto_419413 ) ) ( not ( = ?auto_419411 ?auto_419414 ) ) ( not ( = ?auto_419412 ?auto_419413 ) ) ( not ( = ?auto_419412 ?auto_419414 ) ) ( not ( = ?auto_419413 ?auto_419414 ) ) ( ON ?auto_419412 ?auto_419413 ) ( ON ?auto_419411 ?auto_419412 ) ( ON ?auto_419410 ?auto_419411 ) ( CLEAR ?auto_419408 ) ( ON ?auto_419409 ?auto_419410 ) ( CLEAR ?auto_419409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_419404 ?auto_419405 ?auto_419406 ?auto_419407 ?auto_419408 ?auto_419409 )
      ( MAKE-10PILE ?auto_419404 ?auto_419405 ?auto_419406 ?auto_419407 ?auto_419408 ?auto_419409 ?auto_419410 ?auto_419411 ?auto_419412 ?auto_419413 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_419446 - BLOCK
      ?auto_419447 - BLOCK
      ?auto_419448 - BLOCK
      ?auto_419449 - BLOCK
      ?auto_419450 - BLOCK
      ?auto_419451 - BLOCK
      ?auto_419452 - BLOCK
      ?auto_419453 - BLOCK
      ?auto_419454 - BLOCK
      ?auto_419455 - BLOCK
    )
    :vars
    (
      ?auto_419456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419455 ?auto_419456 ) ( ON-TABLE ?auto_419446 ) ( ON ?auto_419447 ?auto_419446 ) ( ON ?auto_419448 ?auto_419447 ) ( ON ?auto_419449 ?auto_419448 ) ( not ( = ?auto_419446 ?auto_419447 ) ) ( not ( = ?auto_419446 ?auto_419448 ) ) ( not ( = ?auto_419446 ?auto_419449 ) ) ( not ( = ?auto_419446 ?auto_419450 ) ) ( not ( = ?auto_419446 ?auto_419451 ) ) ( not ( = ?auto_419446 ?auto_419452 ) ) ( not ( = ?auto_419446 ?auto_419453 ) ) ( not ( = ?auto_419446 ?auto_419454 ) ) ( not ( = ?auto_419446 ?auto_419455 ) ) ( not ( = ?auto_419446 ?auto_419456 ) ) ( not ( = ?auto_419447 ?auto_419448 ) ) ( not ( = ?auto_419447 ?auto_419449 ) ) ( not ( = ?auto_419447 ?auto_419450 ) ) ( not ( = ?auto_419447 ?auto_419451 ) ) ( not ( = ?auto_419447 ?auto_419452 ) ) ( not ( = ?auto_419447 ?auto_419453 ) ) ( not ( = ?auto_419447 ?auto_419454 ) ) ( not ( = ?auto_419447 ?auto_419455 ) ) ( not ( = ?auto_419447 ?auto_419456 ) ) ( not ( = ?auto_419448 ?auto_419449 ) ) ( not ( = ?auto_419448 ?auto_419450 ) ) ( not ( = ?auto_419448 ?auto_419451 ) ) ( not ( = ?auto_419448 ?auto_419452 ) ) ( not ( = ?auto_419448 ?auto_419453 ) ) ( not ( = ?auto_419448 ?auto_419454 ) ) ( not ( = ?auto_419448 ?auto_419455 ) ) ( not ( = ?auto_419448 ?auto_419456 ) ) ( not ( = ?auto_419449 ?auto_419450 ) ) ( not ( = ?auto_419449 ?auto_419451 ) ) ( not ( = ?auto_419449 ?auto_419452 ) ) ( not ( = ?auto_419449 ?auto_419453 ) ) ( not ( = ?auto_419449 ?auto_419454 ) ) ( not ( = ?auto_419449 ?auto_419455 ) ) ( not ( = ?auto_419449 ?auto_419456 ) ) ( not ( = ?auto_419450 ?auto_419451 ) ) ( not ( = ?auto_419450 ?auto_419452 ) ) ( not ( = ?auto_419450 ?auto_419453 ) ) ( not ( = ?auto_419450 ?auto_419454 ) ) ( not ( = ?auto_419450 ?auto_419455 ) ) ( not ( = ?auto_419450 ?auto_419456 ) ) ( not ( = ?auto_419451 ?auto_419452 ) ) ( not ( = ?auto_419451 ?auto_419453 ) ) ( not ( = ?auto_419451 ?auto_419454 ) ) ( not ( = ?auto_419451 ?auto_419455 ) ) ( not ( = ?auto_419451 ?auto_419456 ) ) ( not ( = ?auto_419452 ?auto_419453 ) ) ( not ( = ?auto_419452 ?auto_419454 ) ) ( not ( = ?auto_419452 ?auto_419455 ) ) ( not ( = ?auto_419452 ?auto_419456 ) ) ( not ( = ?auto_419453 ?auto_419454 ) ) ( not ( = ?auto_419453 ?auto_419455 ) ) ( not ( = ?auto_419453 ?auto_419456 ) ) ( not ( = ?auto_419454 ?auto_419455 ) ) ( not ( = ?auto_419454 ?auto_419456 ) ) ( not ( = ?auto_419455 ?auto_419456 ) ) ( ON ?auto_419454 ?auto_419455 ) ( ON ?auto_419453 ?auto_419454 ) ( ON ?auto_419452 ?auto_419453 ) ( ON ?auto_419451 ?auto_419452 ) ( CLEAR ?auto_419449 ) ( ON ?auto_419450 ?auto_419451 ) ( CLEAR ?auto_419450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_419446 ?auto_419447 ?auto_419448 ?auto_419449 ?auto_419450 )
      ( MAKE-10PILE ?auto_419446 ?auto_419447 ?auto_419448 ?auto_419449 ?auto_419450 ?auto_419451 ?auto_419452 ?auto_419453 ?auto_419454 ?auto_419455 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_419488 - BLOCK
      ?auto_419489 - BLOCK
      ?auto_419490 - BLOCK
      ?auto_419491 - BLOCK
      ?auto_419492 - BLOCK
      ?auto_419493 - BLOCK
      ?auto_419494 - BLOCK
      ?auto_419495 - BLOCK
      ?auto_419496 - BLOCK
      ?auto_419497 - BLOCK
    )
    :vars
    (
      ?auto_419498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419497 ?auto_419498 ) ( ON-TABLE ?auto_419488 ) ( ON ?auto_419489 ?auto_419488 ) ( ON ?auto_419490 ?auto_419489 ) ( not ( = ?auto_419488 ?auto_419489 ) ) ( not ( = ?auto_419488 ?auto_419490 ) ) ( not ( = ?auto_419488 ?auto_419491 ) ) ( not ( = ?auto_419488 ?auto_419492 ) ) ( not ( = ?auto_419488 ?auto_419493 ) ) ( not ( = ?auto_419488 ?auto_419494 ) ) ( not ( = ?auto_419488 ?auto_419495 ) ) ( not ( = ?auto_419488 ?auto_419496 ) ) ( not ( = ?auto_419488 ?auto_419497 ) ) ( not ( = ?auto_419488 ?auto_419498 ) ) ( not ( = ?auto_419489 ?auto_419490 ) ) ( not ( = ?auto_419489 ?auto_419491 ) ) ( not ( = ?auto_419489 ?auto_419492 ) ) ( not ( = ?auto_419489 ?auto_419493 ) ) ( not ( = ?auto_419489 ?auto_419494 ) ) ( not ( = ?auto_419489 ?auto_419495 ) ) ( not ( = ?auto_419489 ?auto_419496 ) ) ( not ( = ?auto_419489 ?auto_419497 ) ) ( not ( = ?auto_419489 ?auto_419498 ) ) ( not ( = ?auto_419490 ?auto_419491 ) ) ( not ( = ?auto_419490 ?auto_419492 ) ) ( not ( = ?auto_419490 ?auto_419493 ) ) ( not ( = ?auto_419490 ?auto_419494 ) ) ( not ( = ?auto_419490 ?auto_419495 ) ) ( not ( = ?auto_419490 ?auto_419496 ) ) ( not ( = ?auto_419490 ?auto_419497 ) ) ( not ( = ?auto_419490 ?auto_419498 ) ) ( not ( = ?auto_419491 ?auto_419492 ) ) ( not ( = ?auto_419491 ?auto_419493 ) ) ( not ( = ?auto_419491 ?auto_419494 ) ) ( not ( = ?auto_419491 ?auto_419495 ) ) ( not ( = ?auto_419491 ?auto_419496 ) ) ( not ( = ?auto_419491 ?auto_419497 ) ) ( not ( = ?auto_419491 ?auto_419498 ) ) ( not ( = ?auto_419492 ?auto_419493 ) ) ( not ( = ?auto_419492 ?auto_419494 ) ) ( not ( = ?auto_419492 ?auto_419495 ) ) ( not ( = ?auto_419492 ?auto_419496 ) ) ( not ( = ?auto_419492 ?auto_419497 ) ) ( not ( = ?auto_419492 ?auto_419498 ) ) ( not ( = ?auto_419493 ?auto_419494 ) ) ( not ( = ?auto_419493 ?auto_419495 ) ) ( not ( = ?auto_419493 ?auto_419496 ) ) ( not ( = ?auto_419493 ?auto_419497 ) ) ( not ( = ?auto_419493 ?auto_419498 ) ) ( not ( = ?auto_419494 ?auto_419495 ) ) ( not ( = ?auto_419494 ?auto_419496 ) ) ( not ( = ?auto_419494 ?auto_419497 ) ) ( not ( = ?auto_419494 ?auto_419498 ) ) ( not ( = ?auto_419495 ?auto_419496 ) ) ( not ( = ?auto_419495 ?auto_419497 ) ) ( not ( = ?auto_419495 ?auto_419498 ) ) ( not ( = ?auto_419496 ?auto_419497 ) ) ( not ( = ?auto_419496 ?auto_419498 ) ) ( not ( = ?auto_419497 ?auto_419498 ) ) ( ON ?auto_419496 ?auto_419497 ) ( ON ?auto_419495 ?auto_419496 ) ( ON ?auto_419494 ?auto_419495 ) ( ON ?auto_419493 ?auto_419494 ) ( ON ?auto_419492 ?auto_419493 ) ( CLEAR ?auto_419490 ) ( ON ?auto_419491 ?auto_419492 ) ( CLEAR ?auto_419491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_419488 ?auto_419489 ?auto_419490 ?auto_419491 )
      ( MAKE-10PILE ?auto_419488 ?auto_419489 ?auto_419490 ?auto_419491 ?auto_419492 ?auto_419493 ?auto_419494 ?auto_419495 ?auto_419496 ?auto_419497 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_419530 - BLOCK
      ?auto_419531 - BLOCK
      ?auto_419532 - BLOCK
      ?auto_419533 - BLOCK
      ?auto_419534 - BLOCK
      ?auto_419535 - BLOCK
      ?auto_419536 - BLOCK
      ?auto_419537 - BLOCK
      ?auto_419538 - BLOCK
      ?auto_419539 - BLOCK
    )
    :vars
    (
      ?auto_419540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419539 ?auto_419540 ) ( ON-TABLE ?auto_419530 ) ( ON ?auto_419531 ?auto_419530 ) ( not ( = ?auto_419530 ?auto_419531 ) ) ( not ( = ?auto_419530 ?auto_419532 ) ) ( not ( = ?auto_419530 ?auto_419533 ) ) ( not ( = ?auto_419530 ?auto_419534 ) ) ( not ( = ?auto_419530 ?auto_419535 ) ) ( not ( = ?auto_419530 ?auto_419536 ) ) ( not ( = ?auto_419530 ?auto_419537 ) ) ( not ( = ?auto_419530 ?auto_419538 ) ) ( not ( = ?auto_419530 ?auto_419539 ) ) ( not ( = ?auto_419530 ?auto_419540 ) ) ( not ( = ?auto_419531 ?auto_419532 ) ) ( not ( = ?auto_419531 ?auto_419533 ) ) ( not ( = ?auto_419531 ?auto_419534 ) ) ( not ( = ?auto_419531 ?auto_419535 ) ) ( not ( = ?auto_419531 ?auto_419536 ) ) ( not ( = ?auto_419531 ?auto_419537 ) ) ( not ( = ?auto_419531 ?auto_419538 ) ) ( not ( = ?auto_419531 ?auto_419539 ) ) ( not ( = ?auto_419531 ?auto_419540 ) ) ( not ( = ?auto_419532 ?auto_419533 ) ) ( not ( = ?auto_419532 ?auto_419534 ) ) ( not ( = ?auto_419532 ?auto_419535 ) ) ( not ( = ?auto_419532 ?auto_419536 ) ) ( not ( = ?auto_419532 ?auto_419537 ) ) ( not ( = ?auto_419532 ?auto_419538 ) ) ( not ( = ?auto_419532 ?auto_419539 ) ) ( not ( = ?auto_419532 ?auto_419540 ) ) ( not ( = ?auto_419533 ?auto_419534 ) ) ( not ( = ?auto_419533 ?auto_419535 ) ) ( not ( = ?auto_419533 ?auto_419536 ) ) ( not ( = ?auto_419533 ?auto_419537 ) ) ( not ( = ?auto_419533 ?auto_419538 ) ) ( not ( = ?auto_419533 ?auto_419539 ) ) ( not ( = ?auto_419533 ?auto_419540 ) ) ( not ( = ?auto_419534 ?auto_419535 ) ) ( not ( = ?auto_419534 ?auto_419536 ) ) ( not ( = ?auto_419534 ?auto_419537 ) ) ( not ( = ?auto_419534 ?auto_419538 ) ) ( not ( = ?auto_419534 ?auto_419539 ) ) ( not ( = ?auto_419534 ?auto_419540 ) ) ( not ( = ?auto_419535 ?auto_419536 ) ) ( not ( = ?auto_419535 ?auto_419537 ) ) ( not ( = ?auto_419535 ?auto_419538 ) ) ( not ( = ?auto_419535 ?auto_419539 ) ) ( not ( = ?auto_419535 ?auto_419540 ) ) ( not ( = ?auto_419536 ?auto_419537 ) ) ( not ( = ?auto_419536 ?auto_419538 ) ) ( not ( = ?auto_419536 ?auto_419539 ) ) ( not ( = ?auto_419536 ?auto_419540 ) ) ( not ( = ?auto_419537 ?auto_419538 ) ) ( not ( = ?auto_419537 ?auto_419539 ) ) ( not ( = ?auto_419537 ?auto_419540 ) ) ( not ( = ?auto_419538 ?auto_419539 ) ) ( not ( = ?auto_419538 ?auto_419540 ) ) ( not ( = ?auto_419539 ?auto_419540 ) ) ( ON ?auto_419538 ?auto_419539 ) ( ON ?auto_419537 ?auto_419538 ) ( ON ?auto_419536 ?auto_419537 ) ( ON ?auto_419535 ?auto_419536 ) ( ON ?auto_419534 ?auto_419535 ) ( ON ?auto_419533 ?auto_419534 ) ( CLEAR ?auto_419531 ) ( ON ?auto_419532 ?auto_419533 ) ( CLEAR ?auto_419532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_419530 ?auto_419531 ?auto_419532 )
      ( MAKE-10PILE ?auto_419530 ?auto_419531 ?auto_419532 ?auto_419533 ?auto_419534 ?auto_419535 ?auto_419536 ?auto_419537 ?auto_419538 ?auto_419539 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_419572 - BLOCK
      ?auto_419573 - BLOCK
      ?auto_419574 - BLOCK
      ?auto_419575 - BLOCK
      ?auto_419576 - BLOCK
      ?auto_419577 - BLOCK
      ?auto_419578 - BLOCK
      ?auto_419579 - BLOCK
      ?auto_419580 - BLOCK
      ?auto_419581 - BLOCK
    )
    :vars
    (
      ?auto_419582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419581 ?auto_419582 ) ( ON-TABLE ?auto_419572 ) ( not ( = ?auto_419572 ?auto_419573 ) ) ( not ( = ?auto_419572 ?auto_419574 ) ) ( not ( = ?auto_419572 ?auto_419575 ) ) ( not ( = ?auto_419572 ?auto_419576 ) ) ( not ( = ?auto_419572 ?auto_419577 ) ) ( not ( = ?auto_419572 ?auto_419578 ) ) ( not ( = ?auto_419572 ?auto_419579 ) ) ( not ( = ?auto_419572 ?auto_419580 ) ) ( not ( = ?auto_419572 ?auto_419581 ) ) ( not ( = ?auto_419572 ?auto_419582 ) ) ( not ( = ?auto_419573 ?auto_419574 ) ) ( not ( = ?auto_419573 ?auto_419575 ) ) ( not ( = ?auto_419573 ?auto_419576 ) ) ( not ( = ?auto_419573 ?auto_419577 ) ) ( not ( = ?auto_419573 ?auto_419578 ) ) ( not ( = ?auto_419573 ?auto_419579 ) ) ( not ( = ?auto_419573 ?auto_419580 ) ) ( not ( = ?auto_419573 ?auto_419581 ) ) ( not ( = ?auto_419573 ?auto_419582 ) ) ( not ( = ?auto_419574 ?auto_419575 ) ) ( not ( = ?auto_419574 ?auto_419576 ) ) ( not ( = ?auto_419574 ?auto_419577 ) ) ( not ( = ?auto_419574 ?auto_419578 ) ) ( not ( = ?auto_419574 ?auto_419579 ) ) ( not ( = ?auto_419574 ?auto_419580 ) ) ( not ( = ?auto_419574 ?auto_419581 ) ) ( not ( = ?auto_419574 ?auto_419582 ) ) ( not ( = ?auto_419575 ?auto_419576 ) ) ( not ( = ?auto_419575 ?auto_419577 ) ) ( not ( = ?auto_419575 ?auto_419578 ) ) ( not ( = ?auto_419575 ?auto_419579 ) ) ( not ( = ?auto_419575 ?auto_419580 ) ) ( not ( = ?auto_419575 ?auto_419581 ) ) ( not ( = ?auto_419575 ?auto_419582 ) ) ( not ( = ?auto_419576 ?auto_419577 ) ) ( not ( = ?auto_419576 ?auto_419578 ) ) ( not ( = ?auto_419576 ?auto_419579 ) ) ( not ( = ?auto_419576 ?auto_419580 ) ) ( not ( = ?auto_419576 ?auto_419581 ) ) ( not ( = ?auto_419576 ?auto_419582 ) ) ( not ( = ?auto_419577 ?auto_419578 ) ) ( not ( = ?auto_419577 ?auto_419579 ) ) ( not ( = ?auto_419577 ?auto_419580 ) ) ( not ( = ?auto_419577 ?auto_419581 ) ) ( not ( = ?auto_419577 ?auto_419582 ) ) ( not ( = ?auto_419578 ?auto_419579 ) ) ( not ( = ?auto_419578 ?auto_419580 ) ) ( not ( = ?auto_419578 ?auto_419581 ) ) ( not ( = ?auto_419578 ?auto_419582 ) ) ( not ( = ?auto_419579 ?auto_419580 ) ) ( not ( = ?auto_419579 ?auto_419581 ) ) ( not ( = ?auto_419579 ?auto_419582 ) ) ( not ( = ?auto_419580 ?auto_419581 ) ) ( not ( = ?auto_419580 ?auto_419582 ) ) ( not ( = ?auto_419581 ?auto_419582 ) ) ( ON ?auto_419580 ?auto_419581 ) ( ON ?auto_419579 ?auto_419580 ) ( ON ?auto_419578 ?auto_419579 ) ( ON ?auto_419577 ?auto_419578 ) ( ON ?auto_419576 ?auto_419577 ) ( ON ?auto_419575 ?auto_419576 ) ( ON ?auto_419574 ?auto_419575 ) ( CLEAR ?auto_419572 ) ( ON ?auto_419573 ?auto_419574 ) ( CLEAR ?auto_419573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_419572 ?auto_419573 )
      ( MAKE-10PILE ?auto_419572 ?auto_419573 ?auto_419574 ?auto_419575 ?auto_419576 ?auto_419577 ?auto_419578 ?auto_419579 ?auto_419580 ?auto_419581 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_419614 - BLOCK
      ?auto_419615 - BLOCK
      ?auto_419616 - BLOCK
      ?auto_419617 - BLOCK
      ?auto_419618 - BLOCK
      ?auto_419619 - BLOCK
      ?auto_419620 - BLOCK
      ?auto_419621 - BLOCK
      ?auto_419622 - BLOCK
      ?auto_419623 - BLOCK
    )
    :vars
    (
      ?auto_419624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419623 ?auto_419624 ) ( not ( = ?auto_419614 ?auto_419615 ) ) ( not ( = ?auto_419614 ?auto_419616 ) ) ( not ( = ?auto_419614 ?auto_419617 ) ) ( not ( = ?auto_419614 ?auto_419618 ) ) ( not ( = ?auto_419614 ?auto_419619 ) ) ( not ( = ?auto_419614 ?auto_419620 ) ) ( not ( = ?auto_419614 ?auto_419621 ) ) ( not ( = ?auto_419614 ?auto_419622 ) ) ( not ( = ?auto_419614 ?auto_419623 ) ) ( not ( = ?auto_419614 ?auto_419624 ) ) ( not ( = ?auto_419615 ?auto_419616 ) ) ( not ( = ?auto_419615 ?auto_419617 ) ) ( not ( = ?auto_419615 ?auto_419618 ) ) ( not ( = ?auto_419615 ?auto_419619 ) ) ( not ( = ?auto_419615 ?auto_419620 ) ) ( not ( = ?auto_419615 ?auto_419621 ) ) ( not ( = ?auto_419615 ?auto_419622 ) ) ( not ( = ?auto_419615 ?auto_419623 ) ) ( not ( = ?auto_419615 ?auto_419624 ) ) ( not ( = ?auto_419616 ?auto_419617 ) ) ( not ( = ?auto_419616 ?auto_419618 ) ) ( not ( = ?auto_419616 ?auto_419619 ) ) ( not ( = ?auto_419616 ?auto_419620 ) ) ( not ( = ?auto_419616 ?auto_419621 ) ) ( not ( = ?auto_419616 ?auto_419622 ) ) ( not ( = ?auto_419616 ?auto_419623 ) ) ( not ( = ?auto_419616 ?auto_419624 ) ) ( not ( = ?auto_419617 ?auto_419618 ) ) ( not ( = ?auto_419617 ?auto_419619 ) ) ( not ( = ?auto_419617 ?auto_419620 ) ) ( not ( = ?auto_419617 ?auto_419621 ) ) ( not ( = ?auto_419617 ?auto_419622 ) ) ( not ( = ?auto_419617 ?auto_419623 ) ) ( not ( = ?auto_419617 ?auto_419624 ) ) ( not ( = ?auto_419618 ?auto_419619 ) ) ( not ( = ?auto_419618 ?auto_419620 ) ) ( not ( = ?auto_419618 ?auto_419621 ) ) ( not ( = ?auto_419618 ?auto_419622 ) ) ( not ( = ?auto_419618 ?auto_419623 ) ) ( not ( = ?auto_419618 ?auto_419624 ) ) ( not ( = ?auto_419619 ?auto_419620 ) ) ( not ( = ?auto_419619 ?auto_419621 ) ) ( not ( = ?auto_419619 ?auto_419622 ) ) ( not ( = ?auto_419619 ?auto_419623 ) ) ( not ( = ?auto_419619 ?auto_419624 ) ) ( not ( = ?auto_419620 ?auto_419621 ) ) ( not ( = ?auto_419620 ?auto_419622 ) ) ( not ( = ?auto_419620 ?auto_419623 ) ) ( not ( = ?auto_419620 ?auto_419624 ) ) ( not ( = ?auto_419621 ?auto_419622 ) ) ( not ( = ?auto_419621 ?auto_419623 ) ) ( not ( = ?auto_419621 ?auto_419624 ) ) ( not ( = ?auto_419622 ?auto_419623 ) ) ( not ( = ?auto_419622 ?auto_419624 ) ) ( not ( = ?auto_419623 ?auto_419624 ) ) ( ON ?auto_419622 ?auto_419623 ) ( ON ?auto_419621 ?auto_419622 ) ( ON ?auto_419620 ?auto_419621 ) ( ON ?auto_419619 ?auto_419620 ) ( ON ?auto_419618 ?auto_419619 ) ( ON ?auto_419617 ?auto_419618 ) ( ON ?auto_419616 ?auto_419617 ) ( ON ?auto_419615 ?auto_419616 ) ( ON ?auto_419614 ?auto_419615 ) ( CLEAR ?auto_419614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_419614 )
      ( MAKE-10PILE ?auto_419614 ?auto_419615 ?auto_419616 ?auto_419617 ?auto_419618 ?auto_419619 ?auto_419620 ?auto_419621 ?auto_419622 ?auto_419623 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_419657 - BLOCK
      ?auto_419658 - BLOCK
      ?auto_419659 - BLOCK
      ?auto_419660 - BLOCK
      ?auto_419661 - BLOCK
      ?auto_419662 - BLOCK
      ?auto_419663 - BLOCK
      ?auto_419664 - BLOCK
      ?auto_419665 - BLOCK
      ?auto_419666 - BLOCK
      ?auto_419667 - BLOCK
    )
    :vars
    (
      ?auto_419668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_419666 ) ( ON ?auto_419667 ?auto_419668 ) ( CLEAR ?auto_419667 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_419657 ) ( ON ?auto_419658 ?auto_419657 ) ( ON ?auto_419659 ?auto_419658 ) ( ON ?auto_419660 ?auto_419659 ) ( ON ?auto_419661 ?auto_419660 ) ( ON ?auto_419662 ?auto_419661 ) ( ON ?auto_419663 ?auto_419662 ) ( ON ?auto_419664 ?auto_419663 ) ( ON ?auto_419665 ?auto_419664 ) ( ON ?auto_419666 ?auto_419665 ) ( not ( = ?auto_419657 ?auto_419658 ) ) ( not ( = ?auto_419657 ?auto_419659 ) ) ( not ( = ?auto_419657 ?auto_419660 ) ) ( not ( = ?auto_419657 ?auto_419661 ) ) ( not ( = ?auto_419657 ?auto_419662 ) ) ( not ( = ?auto_419657 ?auto_419663 ) ) ( not ( = ?auto_419657 ?auto_419664 ) ) ( not ( = ?auto_419657 ?auto_419665 ) ) ( not ( = ?auto_419657 ?auto_419666 ) ) ( not ( = ?auto_419657 ?auto_419667 ) ) ( not ( = ?auto_419657 ?auto_419668 ) ) ( not ( = ?auto_419658 ?auto_419659 ) ) ( not ( = ?auto_419658 ?auto_419660 ) ) ( not ( = ?auto_419658 ?auto_419661 ) ) ( not ( = ?auto_419658 ?auto_419662 ) ) ( not ( = ?auto_419658 ?auto_419663 ) ) ( not ( = ?auto_419658 ?auto_419664 ) ) ( not ( = ?auto_419658 ?auto_419665 ) ) ( not ( = ?auto_419658 ?auto_419666 ) ) ( not ( = ?auto_419658 ?auto_419667 ) ) ( not ( = ?auto_419658 ?auto_419668 ) ) ( not ( = ?auto_419659 ?auto_419660 ) ) ( not ( = ?auto_419659 ?auto_419661 ) ) ( not ( = ?auto_419659 ?auto_419662 ) ) ( not ( = ?auto_419659 ?auto_419663 ) ) ( not ( = ?auto_419659 ?auto_419664 ) ) ( not ( = ?auto_419659 ?auto_419665 ) ) ( not ( = ?auto_419659 ?auto_419666 ) ) ( not ( = ?auto_419659 ?auto_419667 ) ) ( not ( = ?auto_419659 ?auto_419668 ) ) ( not ( = ?auto_419660 ?auto_419661 ) ) ( not ( = ?auto_419660 ?auto_419662 ) ) ( not ( = ?auto_419660 ?auto_419663 ) ) ( not ( = ?auto_419660 ?auto_419664 ) ) ( not ( = ?auto_419660 ?auto_419665 ) ) ( not ( = ?auto_419660 ?auto_419666 ) ) ( not ( = ?auto_419660 ?auto_419667 ) ) ( not ( = ?auto_419660 ?auto_419668 ) ) ( not ( = ?auto_419661 ?auto_419662 ) ) ( not ( = ?auto_419661 ?auto_419663 ) ) ( not ( = ?auto_419661 ?auto_419664 ) ) ( not ( = ?auto_419661 ?auto_419665 ) ) ( not ( = ?auto_419661 ?auto_419666 ) ) ( not ( = ?auto_419661 ?auto_419667 ) ) ( not ( = ?auto_419661 ?auto_419668 ) ) ( not ( = ?auto_419662 ?auto_419663 ) ) ( not ( = ?auto_419662 ?auto_419664 ) ) ( not ( = ?auto_419662 ?auto_419665 ) ) ( not ( = ?auto_419662 ?auto_419666 ) ) ( not ( = ?auto_419662 ?auto_419667 ) ) ( not ( = ?auto_419662 ?auto_419668 ) ) ( not ( = ?auto_419663 ?auto_419664 ) ) ( not ( = ?auto_419663 ?auto_419665 ) ) ( not ( = ?auto_419663 ?auto_419666 ) ) ( not ( = ?auto_419663 ?auto_419667 ) ) ( not ( = ?auto_419663 ?auto_419668 ) ) ( not ( = ?auto_419664 ?auto_419665 ) ) ( not ( = ?auto_419664 ?auto_419666 ) ) ( not ( = ?auto_419664 ?auto_419667 ) ) ( not ( = ?auto_419664 ?auto_419668 ) ) ( not ( = ?auto_419665 ?auto_419666 ) ) ( not ( = ?auto_419665 ?auto_419667 ) ) ( not ( = ?auto_419665 ?auto_419668 ) ) ( not ( = ?auto_419666 ?auto_419667 ) ) ( not ( = ?auto_419666 ?auto_419668 ) ) ( not ( = ?auto_419667 ?auto_419668 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_419667 ?auto_419668 )
      ( !STACK ?auto_419667 ?auto_419666 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_419703 - BLOCK
      ?auto_419704 - BLOCK
      ?auto_419705 - BLOCK
      ?auto_419706 - BLOCK
      ?auto_419707 - BLOCK
      ?auto_419708 - BLOCK
      ?auto_419709 - BLOCK
      ?auto_419710 - BLOCK
      ?auto_419711 - BLOCK
      ?auto_419712 - BLOCK
      ?auto_419713 - BLOCK
    )
    :vars
    (
      ?auto_419714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419713 ?auto_419714 ) ( ON-TABLE ?auto_419703 ) ( ON ?auto_419704 ?auto_419703 ) ( ON ?auto_419705 ?auto_419704 ) ( ON ?auto_419706 ?auto_419705 ) ( ON ?auto_419707 ?auto_419706 ) ( ON ?auto_419708 ?auto_419707 ) ( ON ?auto_419709 ?auto_419708 ) ( ON ?auto_419710 ?auto_419709 ) ( ON ?auto_419711 ?auto_419710 ) ( not ( = ?auto_419703 ?auto_419704 ) ) ( not ( = ?auto_419703 ?auto_419705 ) ) ( not ( = ?auto_419703 ?auto_419706 ) ) ( not ( = ?auto_419703 ?auto_419707 ) ) ( not ( = ?auto_419703 ?auto_419708 ) ) ( not ( = ?auto_419703 ?auto_419709 ) ) ( not ( = ?auto_419703 ?auto_419710 ) ) ( not ( = ?auto_419703 ?auto_419711 ) ) ( not ( = ?auto_419703 ?auto_419712 ) ) ( not ( = ?auto_419703 ?auto_419713 ) ) ( not ( = ?auto_419703 ?auto_419714 ) ) ( not ( = ?auto_419704 ?auto_419705 ) ) ( not ( = ?auto_419704 ?auto_419706 ) ) ( not ( = ?auto_419704 ?auto_419707 ) ) ( not ( = ?auto_419704 ?auto_419708 ) ) ( not ( = ?auto_419704 ?auto_419709 ) ) ( not ( = ?auto_419704 ?auto_419710 ) ) ( not ( = ?auto_419704 ?auto_419711 ) ) ( not ( = ?auto_419704 ?auto_419712 ) ) ( not ( = ?auto_419704 ?auto_419713 ) ) ( not ( = ?auto_419704 ?auto_419714 ) ) ( not ( = ?auto_419705 ?auto_419706 ) ) ( not ( = ?auto_419705 ?auto_419707 ) ) ( not ( = ?auto_419705 ?auto_419708 ) ) ( not ( = ?auto_419705 ?auto_419709 ) ) ( not ( = ?auto_419705 ?auto_419710 ) ) ( not ( = ?auto_419705 ?auto_419711 ) ) ( not ( = ?auto_419705 ?auto_419712 ) ) ( not ( = ?auto_419705 ?auto_419713 ) ) ( not ( = ?auto_419705 ?auto_419714 ) ) ( not ( = ?auto_419706 ?auto_419707 ) ) ( not ( = ?auto_419706 ?auto_419708 ) ) ( not ( = ?auto_419706 ?auto_419709 ) ) ( not ( = ?auto_419706 ?auto_419710 ) ) ( not ( = ?auto_419706 ?auto_419711 ) ) ( not ( = ?auto_419706 ?auto_419712 ) ) ( not ( = ?auto_419706 ?auto_419713 ) ) ( not ( = ?auto_419706 ?auto_419714 ) ) ( not ( = ?auto_419707 ?auto_419708 ) ) ( not ( = ?auto_419707 ?auto_419709 ) ) ( not ( = ?auto_419707 ?auto_419710 ) ) ( not ( = ?auto_419707 ?auto_419711 ) ) ( not ( = ?auto_419707 ?auto_419712 ) ) ( not ( = ?auto_419707 ?auto_419713 ) ) ( not ( = ?auto_419707 ?auto_419714 ) ) ( not ( = ?auto_419708 ?auto_419709 ) ) ( not ( = ?auto_419708 ?auto_419710 ) ) ( not ( = ?auto_419708 ?auto_419711 ) ) ( not ( = ?auto_419708 ?auto_419712 ) ) ( not ( = ?auto_419708 ?auto_419713 ) ) ( not ( = ?auto_419708 ?auto_419714 ) ) ( not ( = ?auto_419709 ?auto_419710 ) ) ( not ( = ?auto_419709 ?auto_419711 ) ) ( not ( = ?auto_419709 ?auto_419712 ) ) ( not ( = ?auto_419709 ?auto_419713 ) ) ( not ( = ?auto_419709 ?auto_419714 ) ) ( not ( = ?auto_419710 ?auto_419711 ) ) ( not ( = ?auto_419710 ?auto_419712 ) ) ( not ( = ?auto_419710 ?auto_419713 ) ) ( not ( = ?auto_419710 ?auto_419714 ) ) ( not ( = ?auto_419711 ?auto_419712 ) ) ( not ( = ?auto_419711 ?auto_419713 ) ) ( not ( = ?auto_419711 ?auto_419714 ) ) ( not ( = ?auto_419712 ?auto_419713 ) ) ( not ( = ?auto_419712 ?auto_419714 ) ) ( not ( = ?auto_419713 ?auto_419714 ) ) ( CLEAR ?auto_419711 ) ( ON ?auto_419712 ?auto_419713 ) ( CLEAR ?auto_419712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_419703 ?auto_419704 ?auto_419705 ?auto_419706 ?auto_419707 ?auto_419708 ?auto_419709 ?auto_419710 ?auto_419711 ?auto_419712 )
      ( MAKE-11PILE ?auto_419703 ?auto_419704 ?auto_419705 ?auto_419706 ?auto_419707 ?auto_419708 ?auto_419709 ?auto_419710 ?auto_419711 ?auto_419712 ?auto_419713 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_419749 - BLOCK
      ?auto_419750 - BLOCK
      ?auto_419751 - BLOCK
      ?auto_419752 - BLOCK
      ?auto_419753 - BLOCK
      ?auto_419754 - BLOCK
      ?auto_419755 - BLOCK
      ?auto_419756 - BLOCK
      ?auto_419757 - BLOCK
      ?auto_419758 - BLOCK
      ?auto_419759 - BLOCK
    )
    :vars
    (
      ?auto_419760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419759 ?auto_419760 ) ( ON-TABLE ?auto_419749 ) ( ON ?auto_419750 ?auto_419749 ) ( ON ?auto_419751 ?auto_419750 ) ( ON ?auto_419752 ?auto_419751 ) ( ON ?auto_419753 ?auto_419752 ) ( ON ?auto_419754 ?auto_419753 ) ( ON ?auto_419755 ?auto_419754 ) ( ON ?auto_419756 ?auto_419755 ) ( not ( = ?auto_419749 ?auto_419750 ) ) ( not ( = ?auto_419749 ?auto_419751 ) ) ( not ( = ?auto_419749 ?auto_419752 ) ) ( not ( = ?auto_419749 ?auto_419753 ) ) ( not ( = ?auto_419749 ?auto_419754 ) ) ( not ( = ?auto_419749 ?auto_419755 ) ) ( not ( = ?auto_419749 ?auto_419756 ) ) ( not ( = ?auto_419749 ?auto_419757 ) ) ( not ( = ?auto_419749 ?auto_419758 ) ) ( not ( = ?auto_419749 ?auto_419759 ) ) ( not ( = ?auto_419749 ?auto_419760 ) ) ( not ( = ?auto_419750 ?auto_419751 ) ) ( not ( = ?auto_419750 ?auto_419752 ) ) ( not ( = ?auto_419750 ?auto_419753 ) ) ( not ( = ?auto_419750 ?auto_419754 ) ) ( not ( = ?auto_419750 ?auto_419755 ) ) ( not ( = ?auto_419750 ?auto_419756 ) ) ( not ( = ?auto_419750 ?auto_419757 ) ) ( not ( = ?auto_419750 ?auto_419758 ) ) ( not ( = ?auto_419750 ?auto_419759 ) ) ( not ( = ?auto_419750 ?auto_419760 ) ) ( not ( = ?auto_419751 ?auto_419752 ) ) ( not ( = ?auto_419751 ?auto_419753 ) ) ( not ( = ?auto_419751 ?auto_419754 ) ) ( not ( = ?auto_419751 ?auto_419755 ) ) ( not ( = ?auto_419751 ?auto_419756 ) ) ( not ( = ?auto_419751 ?auto_419757 ) ) ( not ( = ?auto_419751 ?auto_419758 ) ) ( not ( = ?auto_419751 ?auto_419759 ) ) ( not ( = ?auto_419751 ?auto_419760 ) ) ( not ( = ?auto_419752 ?auto_419753 ) ) ( not ( = ?auto_419752 ?auto_419754 ) ) ( not ( = ?auto_419752 ?auto_419755 ) ) ( not ( = ?auto_419752 ?auto_419756 ) ) ( not ( = ?auto_419752 ?auto_419757 ) ) ( not ( = ?auto_419752 ?auto_419758 ) ) ( not ( = ?auto_419752 ?auto_419759 ) ) ( not ( = ?auto_419752 ?auto_419760 ) ) ( not ( = ?auto_419753 ?auto_419754 ) ) ( not ( = ?auto_419753 ?auto_419755 ) ) ( not ( = ?auto_419753 ?auto_419756 ) ) ( not ( = ?auto_419753 ?auto_419757 ) ) ( not ( = ?auto_419753 ?auto_419758 ) ) ( not ( = ?auto_419753 ?auto_419759 ) ) ( not ( = ?auto_419753 ?auto_419760 ) ) ( not ( = ?auto_419754 ?auto_419755 ) ) ( not ( = ?auto_419754 ?auto_419756 ) ) ( not ( = ?auto_419754 ?auto_419757 ) ) ( not ( = ?auto_419754 ?auto_419758 ) ) ( not ( = ?auto_419754 ?auto_419759 ) ) ( not ( = ?auto_419754 ?auto_419760 ) ) ( not ( = ?auto_419755 ?auto_419756 ) ) ( not ( = ?auto_419755 ?auto_419757 ) ) ( not ( = ?auto_419755 ?auto_419758 ) ) ( not ( = ?auto_419755 ?auto_419759 ) ) ( not ( = ?auto_419755 ?auto_419760 ) ) ( not ( = ?auto_419756 ?auto_419757 ) ) ( not ( = ?auto_419756 ?auto_419758 ) ) ( not ( = ?auto_419756 ?auto_419759 ) ) ( not ( = ?auto_419756 ?auto_419760 ) ) ( not ( = ?auto_419757 ?auto_419758 ) ) ( not ( = ?auto_419757 ?auto_419759 ) ) ( not ( = ?auto_419757 ?auto_419760 ) ) ( not ( = ?auto_419758 ?auto_419759 ) ) ( not ( = ?auto_419758 ?auto_419760 ) ) ( not ( = ?auto_419759 ?auto_419760 ) ) ( ON ?auto_419758 ?auto_419759 ) ( CLEAR ?auto_419756 ) ( ON ?auto_419757 ?auto_419758 ) ( CLEAR ?auto_419757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_419749 ?auto_419750 ?auto_419751 ?auto_419752 ?auto_419753 ?auto_419754 ?auto_419755 ?auto_419756 ?auto_419757 )
      ( MAKE-11PILE ?auto_419749 ?auto_419750 ?auto_419751 ?auto_419752 ?auto_419753 ?auto_419754 ?auto_419755 ?auto_419756 ?auto_419757 ?auto_419758 ?auto_419759 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_419795 - BLOCK
      ?auto_419796 - BLOCK
      ?auto_419797 - BLOCK
      ?auto_419798 - BLOCK
      ?auto_419799 - BLOCK
      ?auto_419800 - BLOCK
      ?auto_419801 - BLOCK
      ?auto_419802 - BLOCK
      ?auto_419803 - BLOCK
      ?auto_419804 - BLOCK
      ?auto_419805 - BLOCK
    )
    :vars
    (
      ?auto_419806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419805 ?auto_419806 ) ( ON-TABLE ?auto_419795 ) ( ON ?auto_419796 ?auto_419795 ) ( ON ?auto_419797 ?auto_419796 ) ( ON ?auto_419798 ?auto_419797 ) ( ON ?auto_419799 ?auto_419798 ) ( ON ?auto_419800 ?auto_419799 ) ( ON ?auto_419801 ?auto_419800 ) ( not ( = ?auto_419795 ?auto_419796 ) ) ( not ( = ?auto_419795 ?auto_419797 ) ) ( not ( = ?auto_419795 ?auto_419798 ) ) ( not ( = ?auto_419795 ?auto_419799 ) ) ( not ( = ?auto_419795 ?auto_419800 ) ) ( not ( = ?auto_419795 ?auto_419801 ) ) ( not ( = ?auto_419795 ?auto_419802 ) ) ( not ( = ?auto_419795 ?auto_419803 ) ) ( not ( = ?auto_419795 ?auto_419804 ) ) ( not ( = ?auto_419795 ?auto_419805 ) ) ( not ( = ?auto_419795 ?auto_419806 ) ) ( not ( = ?auto_419796 ?auto_419797 ) ) ( not ( = ?auto_419796 ?auto_419798 ) ) ( not ( = ?auto_419796 ?auto_419799 ) ) ( not ( = ?auto_419796 ?auto_419800 ) ) ( not ( = ?auto_419796 ?auto_419801 ) ) ( not ( = ?auto_419796 ?auto_419802 ) ) ( not ( = ?auto_419796 ?auto_419803 ) ) ( not ( = ?auto_419796 ?auto_419804 ) ) ( not ( = ?auto_419796 ?auto_419805 ) ) ( not ( = ?auto_419796 ?auto_419806 ) ) ( not ( = ?auto_419797 ?auto_419798 ) ) ( not ( = ?auto_419797 ?auto_419799 ) ) ( not ( = ?auto_419797 ?auto_419800 ) ) ( not ( = ?auto_419797 ?auto_419801 ) ) ( not ( = ?auto_419797 ?auto_419802 ) ) ( not ( = ?auto_419797 ?auto_419803 ) ) ( not ( = ?auto_419797 ?auto_419804 ) ) ( not ( = ?auto_419797 ?auto_419805 ) ) ( not ( = ?auto_419797 ?auto_419806 ) ) ( not ( = ?auto_419798 ?auto_419799 ) ) ( not ( = ?auto_419798 ?auto_419800 ) ) ( not ( = ?auto_419798 ?auto_419801 ) ) ( not ( = ?auto_419798 ?auto_419802 ) ) ( not ( = ?auto_419798 ?auto_419803 ) ) ( not ( = ?auto_419798 ?auto_419804 ) ) ( not ( = ?auto_419798 ?auto_419805 ) ) ( not ( = ?auto_419798 ?auto_419806 ) ) ( not ( = ?auto_419799 ?auto_419800 ) ) ( not ( = ?auto_419799 ?auto_419801 ) ) ( not ( = ?auto_419799 ?auto_419802 ) ) ( not ( = ?auto_419799 ?auto_419803 ) ) ( not ( = ?auto_419799 ?auto_419804 ) ) ( not ( = ?auto_419799 ?auto_419805 ) ) ( not ( = ?auto_419799 ?auto_419806 ) ) ( not ( = ?auto_419800 ?auto_419801 ) ) ( not ( = ?auto_419800 ?auto_419802 ) ) ( not ( = ?auto_419800 ?auto_419803 ) ) ( not ( = ?auto_419800 ?auto_419804 ) ) ( not ( = ?auto_419800 ?auto_419805 ) ) ( not ( = ?auto_419800 ?auto_419806 ) ) ( not ( = ?auto_419801 ?auto_419802 ) ) ( not ( = ?auto_419801 ?auto_419803 ) ) ( not ( = ?auto_419801 ?auto_419804 ) ) ( not ( = ?auto_419801 ?auto_419805 ) ) ( not ( = ?auto_419801 ?auto_419806 ) ) ( not ( = ?auto_419802 ?auto_419803 ) ) ( not ( = ?auto_419802 ?auto_419804 ) ) ( not ( = ?auto_419802 ?auto_419805 ) ) ( not ( = ?auto_419802 ?auto_419806 ) ) ( not ( = ?auto_419803 ?auto_419804 ) ) ( not ( = ?auto_419803 ?auto_419805 ) ) ( not ( = ?auto_419803 ?auto_419806 ) ) ( not ( = ?auto_419804 ?auto_419805 ) ) ( not ( = ?auto_419804 ?auto_419806 ) ) ( not ( = ?auto_419805 ?auto_419806 ) ) ( ON ?auto_419804 ?auto_419805 ) ( ON ?auto_419803 ?auto_419804 ) ( CLEAR ?auto_419801 ) ( ON ?auto_419802 ?auto_419803 ) ( CLEAR ?auto_419802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_419795 ?auto_419796 ?auto_419797 ?auto_419798 ?auto_419799 ?auto_419800 ?auto_419801 ?auto_419802 )
      ( MAKE-11PILE ?auto_419795 ?auto_419796 ?auto_419797 ?auto_419798 ?auto_419799 ?auto_419800 ?auto_419801 ?auto_419802 ?auto_419803 ?auto_419804 ?auto_419805 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_419841 - BLOCK
      ?auto_419842 - BLOCK
      ?auto_419843 - BLOCK
      ?auto_419844 - BLOCK
      ?auto_419845 - BLOCK
      ?auto_419846 - BLOCK
      ?auto_419847 - BLOCK
      ?auto_419848 - BLOCK
      ?auto_419849 - BLOCK
      ?auto_419850 - BLOCK
      ?auto_419851 - BLOCK
    )
    :vars
    (
      ?auto_419852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419851 ?auto_419852 ) ( ON-TABLE ?auto_419841 ) ( ON ?auto_419842 ?auto_419841 ) ( ON ?auto_419843 ?auto_419842 ) ( ON ?auto_419844 ?auto_419843 ) ( ON ?auto_419845 ?auto_419844 ) ( ON ?auto_419846 ?auto_419845 ) ( not ( = ?auto_419841 ?auto_419842 ) ) ( not ( = ?auto_419841 ?auto_419843 ) ) ( not ( = ?auto_419841 ?auto_419844 ) ) ( not ( = ?auto_419841 ?auto_419845 ) ) ( not ( = ?auto_419841 ?auto_419846 ) ) ( not ( = ?auto_419841 ?auto_419847 ) ) ( not ( = ?auto_419841 ?auto_419848 ) ) ( not ( = ?auto_419841 ?auto_419849 ) ) ( not ( = ?auto_419841 ?auto_419850 ) ) ( not ( = ?auto_419841 ?auto_419851 ) ) ( not ( = ?auto_419841 ?auto_419852 ) ) ( not ( = ?auto_419842 ?auto_419843 ) ) ( not ( = ?auto_419842 ?auto_419844 ) ) ( not ( = ?auto_419842 ?auto_419845 ) ) ( not ( = ?auto_419842 ?auto_419846 ) ) ( not ( = ?auto_419842 ?auto_419847 ) ) ( not ( = ?auto_419842 ?auto_419848 ) ) ( not ( = ?auto_419842 ?auto_419849 ) ) ( not ( = ?auto_419842 ?auto_419850 ) ) ( not ( = ?auto_419842 ?auto_419851 ) ) ( not ( = ?auto_419842 ?auto_419852 ) ) ( not ( = ?auto_419843 ?auto_419844 ) ) ( not ( = ?auto_419843 ?auto_419845 ) ) ( not ( = ?auto_419843 ?auto_419846 ) ) ( not ( = ?auto_419843 ?auto_419847 ) ) ( not ( = ?auto_419843 ?auto_419848 ) ) ( not ( = ?auto_419843 ?auto_419849 ) ) ( not ( = ?auto_419843 ?auto_419850 ) ) ( not ( = ?auto_419843 ?auto_419851 ) ) ( not ( = ?auto_419843 ?auto_419852 ) ) ( not ( = ?auto_419844 ?auto_419845 ) ) ( not ( = ?auto_419844 ?auto_419846 ) ) ( not ( = ?auto_419844 ?auto_419847 ) ) ( not ( = ?auto_419844 ?auto_419848 ) ) ( not ( = ?auto_419844 ?auto_419849 ) ) ( not ( = ?auto_419844 ?auto_419850 ) ) ( not ( = ?auto_419844 ?auto_419851 ) ) ( not ( = ?auto_419844 ?auto_419852 ) ) ( not ( = ?auto_419845 ?auto_419846 ) ) ( not ( = ?auto_419845 ?auto_419847 ) ) ( not ( = ?auto_419845 ?auto_419848 ) ) ( not ( = ?auto_419845 ?auto_419849 ) ) ( not ( = ?auto_419845 ?auto_419850 ) ) ( not ( = ?auto_419845 ?auto_419851 ) ) ( not ( = ?auto_419845 ?auto_419852 ) ) ( not ( = ?auto_419846 ?auto_419847 ) ) ( not ( = ?auto_419846 ?auto_419848 ) ) ( not ( = ?auto_419846 ?auto_419849 ) ) ( not ( = ?auto_419846 ?auto_419850 ) ) ( not ( = ?auto_419846 ?auto_419851 ) ) ( not ( = ?auto_419846 ?auto_419852 ) ) ( not ( = ?auto_419847 ?auto_419848 ) ) ( not ( = ?auto_419847 ?auto_419849 ) ) ( not ( = ?auto_419847 ?auto_419850 ) ) ( not ( = ?auto_419847 ?auto_419851 ) ) ( not ( = ?auto_419847 ?auto_419852 ) ) ( not ( = ?auto_419848 ?auto_419849 ) ) ( not ( = ?auto_419848 ?auto_419850 ) ) ( not ( = ?auto_419848 ?auto_419851 ) ) ( not ( = ?auto_419848 ?auto_419852 ) ) ( not ( = ?auto_419849 ?auto_419850 ) ) ( not ( = ?auto_419849 ?auto_419851 ) ) ( not ( = ?auto_419849 ?auto_419852 ) ) ( not ( = ?auto_419850 ?auto_419851 ) ) ( not ( = ?auto_419850 ?auto_419852 ) ) ( not ( = ?auto_419851 ?auto_419852 ) ) ( ON ?auto_419850 ?auto_419851 ) ( ON ?auto_419849 ?auto_419850 ) ( ON ?auto_419848 ?auto_419849 ) ( CLEAR ?auto_419846 ) ( ON ?auto_419847 ?auto_419848 ) ( CLEAR ?auto_419847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_419841 ?auto_419842 ?auto_419843 ?auto_419844 ?auto_419845 ?auto_419846 ?auto_419847 )
      ( MAKE-11PILE ?auto_419841 ?auto_419842 ?auto_419843 ?auto_419844 ?auto_419845 ?auto_419846 ?auto_419847 ?auto_419848 ?auto_419849 ?auto_419850 ?auto_419851 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_419887 - BLOCK
      ?auto_419888 - BLOCK
      ?auto_419889 - BLOCK
      ?auto_419890 - BLOCK
      ?auto_419891 - BLOCK
      ?auto_419892 - BLOCK
      ?auto_419893 - BLOCK
      ?auto_419894 - BLOCK
      ?auto_419895 - BLOCK
      ?auto_419896 - BLOCK
      ?auto_419897 - BLOCK
    )
    :vars
    (
      ?auto_419898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419897 ?auto_419898 ) ( ON-TABLE ?auto_419887 ) ( ON ?auto_419888 ?auto_419887 ) ( ON ?auto_419889 ?auto_419888 ) ( ON ?auto_419890 ?auto_419889 ) ( ON ?auto_419891 ?auto_419890 ) ( not ( = ?auto_419887 ?auto_419888 ) ) ( not ( = ?auto_419887 ?auto_419889 ) ) ( not ( = ?auto_419887 ?auto_419890 ) ) ( not ( = ?auto_419887 ?auto_419891 ) ) ( not ( = ?auto_419887 ?auto_419892 ) ) ( not ( = ?auto_419887 ?auto_419893 ) ) ( not ( = ?auto_419887 ?auto_419894 ) ) ( not ( = ?auto_419887 ?auto_419895 ) ) ( not ( = ?auto_419887 ?auto_419896 ) ) ( not ( = ?auto_419887 ?auto_419897 ) ) ( not ( = ?auto_419887 ?auto_419898 ) ) ( not ( = ?auto_419888 ?auto_419889 ) ) ( not ( = ?auto_419888 ?auto_419890 ) ) ( not ( = ?auto_419888 ?auto_419891 ) ) ( not ( = ?auto_419888 ?auto_419892 ) ) ( not ( = ?auto_419888 ?auto_419893 ) ) ( not ( = ?auto_419888 ?auto_419894 ) ) ( not ( = ?auto_419888 ?auto_419895 ) ) ( not ( = ?auto_419888 ?auto_419896 ) ) ( not ( = ?auto_419888 ?auto_419897 ) ) ( not ( = ?auto_419888 ?auto_419898 ) ) ( not ( = ?auto_419889 ?auto_419890 ) ) ( not ( = ?auto_419889 ?auto_419891 ) ) ( not ( = ?auto_419889 ?auto_419892 ) ) ( not ( = ?auto_419889 ?auto_419893 ) ) ( not ( = ?auto_419889 ?auto_419894 ) ) ( not ( = ?auto_419889 ?auto_419895 ) ) ( not ( = ?auto_419889 ?auto_419896 ) ) ( not ( = ?auto_419889 ?auto_419897 ) ) ( not ( = ?auto_419889 ?auto_419898 ) ) ( not ( = ?auto_419890 ?auto_419891 ) ) ( not ( = ?auto_419890 ?auto_419892 ) ) ( not ( = ?auto_419890 ?auto_419893 ) ) ( not ( = ?auto_419890 ?auto_419894 ) ) ( not ( = ?auto_419890 ?auto_419895 ) ) ( not ( = ?auto_419890 ?auto_419896 ) ) ( not ( = ?auto_419890 ?auto_419897 ) ) ( not ( = ?auto_419890 ?auto_419898 ) ) ( not ( = ?auto_419891 ?auto_419892 ) ) ( not ( = ?auto_419891 ?auto_419893 ) ) ( not ( = ?auto_419891 ?auto_419894 ) ) ( not ( = ?auto_419891 ?auto_419895 ) ) ( not ( = ?auto_419891 ?auto_419896 ) ) ( not ( = ?auto_419891 ?auto_419897 ) ) ( not ( = ?auto_419891 ?auto_419898 ) ) ( not ( = ?auto_419892 ?auto_419893 ) ) ( not ( = ?auto_419892 ?auto_419894 ) ) ( not ( = ?auto_419892 ?auto_419895 ) ) ( not ( = ?auto_419892 ?auto_419896 ) ) ( not ( = ?auto_419892 ?auto_419897 ) ) ( not ( = ?auto_419892 ?auto_419898 ) ) ( not ( = ?auto_419893 ?auto_419894 ) ) ( not ( = ?auto_419893 ?auto_419895 ) ) ( not ( = ?auto_419893 ?auto_419896 ) ) ( not ( = ?auto_419893 ?auto_419897 ) ) ( not ( = ?auto_419893 ?auto_419898 ) ) ( not ( = ?auto_419894 ?auto_419895 ) ) ( not ( = ?auto_419894 ?auto_419896 ) ) ( not ( = ?auto_419894 ?auto_419897 ) ) ( not ( = ?auto_419894 ?auto_419898 ) ) ( not ( = ?auto_419895 ?auto_419896 ) ) ( not ( = ?auto_419895 ?auto_419897 ) ) ( not ( = ?auto_419895 ?auto_419898 ) ) ( not ( = ?auto_419896 ?auto_419897 ) ) ( not ( = ?auto_419896 ?auto_419898 ) ) ( not ( = ?auto_419897 ?auto_419898 ) ) ( ON ?auto_419896 ?auto_419897 ) ( ON ?auto_419895 ?auto_419896 ) ( ON ?auto_419894 ?auto_419895 ) ( ON ?auto_419893 ?auto_419894 ) ( CLEAR ?auto_419891 ) ( ON ?auto_419892 ?auto_419893 ) ( CLEAR ?auto_419892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_419887 ?auto_419888 ?auto_419889 ?auto_419890 ?auto_419891 ?auto_419892 )
      ( MAKE-11PILE ?auto_419887 ?auto_419888 ?auto_419889 ?auto_419890 ?auto_419891 ?auto_419892 ?auto_419893 ?auto_419894 ?auto_419895 ?auto_419896 ?auto_419897 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_419933 - BLOCK
      ?auto_419934 - BLOCK
      ?auto_419935 - BLOCK
      ?auto_419936 - BLOCK
      ?auto_419937 - BLOCK
      ?auto_419938 - BLOCK
      ?auto_419939 - BLOCK
      ?auto_419940 - BLOCK
      ?auto_419941 - BLOCK
      ?auto_419942 - BLOCK
      ?auto_419943 - BLOCK
    )
    :vars
    (
      ?auto_419944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419943 ?auto_419944 ) ( ON-TABLE ?auto_419933 ) ( ON ?auto_419934 ?auto_419933 ) ( ON ?auto_419935 ?auto_419934 ) ( ON ?auto_419936 ?auto_419935 ) ( not ( = ?auto_419933 ?auto_419934 ) ) ( not ( = ?auto_419933 ?auto_419935 ) ) ( not ( = ?auto_419933 ?auto_419936 ) ) ( not ( = ?auto_419933 ?auto_419937 ) ) ( not ( = ?auto_419933 ?auto_419938 ) ) ( not ( = ?auto_419933 ?auto_419939 ) ) ( not ( = ?auto_419933 ?auto_419940 ) ) ( not ( = ?auto_419933 ?auto_419941 ) ) ( not ( = ?auto_419933 ?auto_419942 ) ) ( not ( = ?auto_419933 ?auto_419943 ) ) ( not ( = ?auto_419933 ?auto_419944 ) ) ( not ( = ?auto_419934 ?auto_419935 ) ) ( not ( = ?auto_419934 ?auto_419936 ) ) ( not ( = ?auto_419934 ?auto_419937 ) ) ( not ( = ?auto_419934 ?auto_419938 ) ) ( not ( = ?auto_419934 ?auto_419939 ) ) ( not ( = ?auto_419934 ?auto_419940 ) ) ( not ( = ?auto_419934 ?auto_419941 ) ) ( not ( = ?auto_419934 ?auto_419942 ) ) ( not ( = ?auto_419934 ?auto_419943 ) ) ( not ( = ?auto_419934 ?auto_419944 ) ) ( not ( = ?auto_419935 ?auto_419936 ) ) ( not ( = ?auto_419935 ?auto_419937 ) ) ( not ( = ?auto_419935 ?auto_419938 ) ) ( not ( = ?auto_419935 ?auto_419939 ) ) ( not ( = ?auto_419935 ?auto_419940 ) ) ( not ( = ?auto_419935 ?auto_419941 ) ) ( not ( = ?auto_419935 ?auto_419942 ) ) ( not ( = ?auto_419935 ?auto_419943 ) ) ( not ( = ?auto_419935 ?auto_419944 ) ) ( not ( = ?auto_419936 ?auto_419937 ) ) ( not ( = ?auto_419936 ?auto_419938 ) ) ( not ( = ?auto_419936 ?auto_419939 ) ) ( not ( = ?auto_419936 ?auto_419940 ) ) ( not ( = ?auto_419936 ?auto_419941 ) ) ( not ( = ?auto_419936 ?auto_419942 ) ) ( not ( = ?auto_419936 ?auto_419943 ) ) ( not ( = ?auto_419936 ?auto_419944 ) ) ( not ( = ?auto_419937 ?auto_419938 ) ) ( not ( = ?auto_419937 ?auto_419939 ) ) ( not ( = ?auto_419937 ?auto_419940 ) ) ( not ( = ?auto_419937 ?auto_419941 ) ) ( not ( = ?auto_419937 ?auto_419942 ) ) ( not ( = ?auto_419937 ?auto_419943 ) ) ( not ( = ?auto_419937 ?auto_419944 ) ) ( not ( = ?auto_419938 ?auto_419939 ) ) ( not ( = ?auto_419938 ?auto_419940 ) ) ( not ( = ?auto_419938 ?auto_419941 ) ) ( not ( = ?auto_419938 ?auto_419942 ) ) ( not ( = ?auto_419938 ?auto_419943 ) ) ( not ( = ?auto_419938 ?auto_419944 ) ) ( not ( = ?auto_419939 ?auto_419940 ) ) ( not ( = ?auto_419939 ?auto_419941 ) ) ( not ( = ?auto_419939 ?auto_419942 ) ) ( not ( = ?auto_419939 ?auto_419943 ) ) ( not ( = ?auto_419939 ?auto_419944 ) ) ( not ( = ?auto_419940 ?auto_419941 ) ) ( not ( = ?auto_419940 ?auto_419942 ) ) ( not ( = ?auto_419940 ?auto_419943 ) ) ( not ( = ?auto_419940 ?auto_419944 ) ) ( not ( = ?auto_419941 ?auto_419942 ) ) ( not ( = ?auto_419941 ?auto_419943 ) ) ( not ( = ?auto_419941 ?auto_419944 ) ) ( not ( = ?auto_419942 ?auto_419943 ) ) ( not ( = ?auto_419942 ?auto_419944 ) ) ( not ( = ?auto_419943 ?auto_419944 ) ) ( ON ?auto_419942 ?auto_419943 ) ( ON ?auto_419941 ?auto_419942 ) ( ON ?auto_419940 ?auto_419941 ) ( ON ?auto_419939 ?auto_419940 ) ( ON ?auto_419938 ?auto_419939 ) ( CLEAR ?auto_419936 ) ( ON ?auto_419937 ?auto_419938 ) ( CLEAR ?auto_419937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_419933 ?auto_419934 ?auto_419935 ?auto_419936 ?auto_419937 )
      ( MAKE-11PILE ?auto_419933 ?auto_419934 ?auto_419935 ?auto_419936 ?auto_419937 ?auto_419938 ?auto_419939 ?auto_419940 ?auto_419941 ?auto_419942 ?auto_419943 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_419979 - BLOCK
      ?auto_419980 - BLOCK
      ?auto_419981 - BLOCK
      ?auto_419982 - BLOCK
      ?auto_419983 - BLOCK
      ?auto_419984 - BLOCK
      ?auto_419985 - BLOCK
      ?auto_419986 - BLOCK
      ?auto_419987 - BLOCK
      ?auto_419988 - BLOCK
      ?auto_419989 - BLOCK
    )
    :vars
    (
      ?auto_419990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_419989 ?auto_419990 ) ( ON-TABLE ?auto_419979 ) ( ON ?auto_419980 ?auto_419979 ) ( ON ?auto_419981 ?auto_419980 ) ( not ( = ?auto_419979 ?auto_419980 ) ) ( not ( = ?auto_419979 ?auto_419981 ) ) ( not ( = ?auto_419979 ?auto_419982 ) ) ( not ( = ?auto_419979 ?auto_419983 ) ) ( not ( = ?auto_419979 ?auto_419984 ) ) ( not ( = ?auto_419979 ?auto_419985 ) ) ( not ( = ?auto_419979 ?auto_419986 ) ) ( not ( = ?auto_419979 ?auto_419987 ) ) ( not ( = ?auto_419979 ?auto_419988 ) ) ( not ( = ?auto_419979 ?auto_419989 ) ) ( not ( = ?auto_419979 ?auto_419990 ) ) ( not ( = ?auto_419980 ?auto_419981 ) ) ( not ( = ?auto_419980 ?auto_419982 ) ) ( not ( = ?auto_419980 ?auto_419983 ) ) ( not ( = ?auto_419980 ?auto_419984 ) ) ( not ( = ?auto_419980 ?auto_419985 ) ) ( not ( = ?auto_419980 ?auto_419986 ) ) ( not ( = ?auto_419980 ?auto_419987 ) ) ( not ( = ?auto_419980 ?auto_419988 ) ) ( not ( = ?auto_419980 ?auto_419989 ) ) ( not ( = ?auto_419980 ?auto_419990 ) ) ( not ( = ?auto_419981 ?auto_419982 ) ) ( not ( = ?auto_419981 ?auto_419983 ) ) ( not ( = ?auto_419981 ?auto_419984 ) ) ( not ( = ?auto_419981 ?auto_419985 ) ) ( not ( = ?auto_419981 ?auto_419986 ) ) ( not ( = ?auto_419981 ?auto_419987 ) ) ( not ( = ?auto_419981 ?auto_419988 ) ) ( not ( = ?auto_419981 ?auto_419989 ) ) ( not ( = ?auto_419981 ?auto_419990 ) ) ( not ( = ?auto_419982 ?auto_419983 ) ) ( not ( = ?auto_419982 ?auto_419984 ) ) ( not ( = ?auto_419982 ?auto_419985 ) ) ( not ( = ?auto_419982 ?auto_419986 ) ) ( not ( = ?auto_419982 ?auto_419987 ) ) ( not ( = ?auto_419982 ?auto_419988 ) ) ( not ( = ?auto_419982 ?auto_419989 ) ) ( not ( = ?auto_419982 ?auto_419990 ) ) ( not ( = ?auto_419983 ?auto_419984 ) ) ( not ( = ?auto_419983 ?auto_419985 ) ) ( not ( = ?auto_419983 ?auto_419986 ) ) ( not ( = ?auto_419983 ?auto_419987 ) ) ( not ( = ?auto_419983 ?auto_419988 ) ) ( not ( = ?auto_419983 ?auto_419989 ) ) ( not ( = ?auto_419983 ?auto_419990 ) ) ( not ( = ?auto_419984 ?auto_419985 ) ) ( not ( = ?auto_419984 ?auto_419986 ) ) ( not ( = ?auto_419984 ?auto_419987 ) ) ( not ( = ?auto_419984 ?auto_419988 ) ) ( not ( = ?auto_419984 ?auto_419989 ) ) ( not ( = ?auto_419984 ?auto_419990 ) ) ( not ( = ?auto_419985 ?auto_419986 ) ) ( not ( = ?auto_419985 ?auto_419987 ) ) ( not ( = ?auto_419985 ?auto_419988 ) ) ( not ( = ?auto_419985 ?auto_419989 ) ) ( not ( = ?auto_419985 ?auto_419990 ) ) ( not ( = ?auto_419986 ?auto_419987 ) ) ( not ( = ?auto_419986 ?auto_419988 ) ) ( not ( = ?auto_419986 ?auto_419989 ) ) ( not ( = ?auto_419986 ?auto_419990 ) ) ( not ( = ?auto_419987 ?auto_419988 ) ) ( not ( = ?auto_419987 ?auto_419989 ) ) ( not ( = ?auto_419987 ?auto_419990 ) ) ( not ( = ?auto_419988 ?auto_419989 ) ) ( not ( = ?auto_419988 ?auto_419990 ) ) ( not ( = ?auto_419989 ?auto_419990 ) ) ( ON ?auto_419988 ?auto_419989 ) ( ON ?auto_419987 ?auto_419988 ) ( ON ?auto_419986 ?auto_419987 ) ( ON ?auto_419985 ?auto_419986 ) ( ON ?auto_419984 ?auto_419985 ) ( ON ?auto_419983 ?auto_419984 ) ( CLEAR ?auto_419981 ) ( ON ?auto_419982 ?auto_419983 ) ( CLEAR ?auto_419982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_419979 ?auto_419980 ?auto_419981 ?auto_419982 )
      ( MAKE-11PILE ?auto_419979 ?auto_419980 ?auto_419981 ?auto_419982 ?auto_419983 ?auto_419984 ?auto_419985 ?auto_419986 ?auto_419987 ?auto_419988 ?auto_419989 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_420025 - BLOCK
      ?auto_420026 - BLOCK
      ?auto_420027 - BLOCK
      ?auto_420028 - BLOCK
      ?auto_420029 - BLOCK
      ?auto_420030 - BLOCK
      ?auto_420031 - BLOCK
      ?auto_420032 - BLOCK
      ?auto_420033 - BLOCK
      ?auto_420034 - BLOCK
      ?auto_420035 - BLOCK
    )
    :vars
    (
      ?auto_420036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420035 ?auto_420036 ) ( ON-TABLE ?auto_420025 ) ( ON ?auto_420026 ?auto_420025 ) ( not ( = ?auto_420025 ?auto_420026 ) ) ( not ( = ?auto_420025 ?auto_420027 ) ) ( not ( = ?auto_420025 ?auto_420028 ) ) ( not ( = ?auto_420025 ?auto_420029 ) ) ( not ( = ?auto_420025 ?auto_420030 ) ) ( not ( = ?auto_420025 ?auto_420031 ) ) ( not ( = ?auto_420025 ?auto_420032 ) ) ( not ( = ?auto_420025 ?auto_420033 ) ) ( not ( = ?auto_420025 ?auto_420034 ) ) ( not ( = ?auto_420025 ?auto_420035 ) ) ( not ( = ?auto_420025 ?auto_420036 ) ) ( not ( = ?auto_420026 ?auto_420027 ) ) ( not ( = ?auto_420026 ?auto_420028 ) ) ( not ( = ?auto_420026 ?auto_420029 ) ) ( not ( = ?auto_420026 ?auto_420030 ) ) ( not ( = ?auto_420026 ?auto_420031 ) ) ( not ( = ?auto_420026 ?auto_420032 ) ) ( not ( = ?auto_420026 ?auto_420033 ) ) ( not ( = ?auto_420026 ?auto_420034 ) ) ( not ( = ?auto_420026 ?auto_420035 ) ) ( not ( = ?auto_420026 ?auto_420036 ) ) ( not ( = ?auto_420027 ?auto_420028 ) ) ( not ( = ?auto_420027 ?auto_420029 ) ) ( not ( = ?auto_420027 ?auto_420030 ) ) ( not ( = ?auto_420027 ?auto_420031 ) ) ( not ( = ?auto_420027 ?auto_420032 ) ) ( not ( = ?auto_420027 ?auto_420033 ) ) ( not ( = ?auto_420027 ?auto_420034 ) ) ( not ( = ?auto_420027 ?auto_420035 ) ) ( not ( = ?auto_420027 ?auto_420036 ) ) ( not ( = ?auto_420028 ?auto_420029 ) ) ( not ( = ?auto_420028 ?auto_420030 ) ) ( not ( = ?auto_420028 ?auto_420031 ) ) ( not ( = ?auto_420028 ?auto_420032 ) ) ( not ( = ?auto_420028 ?auto_420033 ) ) ( not ( = ?auto_420028 ?auto_420034 ) ) ( not ( = ?auto_420028 ?auto_420035 ) ) ( not ( = ?auto_420028 ?auto_420036 ) ) ( not ( = ?auto_420029 ?auto_420030 ) ) ( not ( = ?auto_420029 ?auto_420031 ) ) ( not ( = ?auto_420029 ?auto_420032 ) ) ( not ( = ?auto_420029 ?auto_420033 ) ) ( not ( = ?auto_420029 ?auto_420034 ) ) ( not ( = ?auto_420029 ?auto_420035 ) ) ( not ( = ?auto_420029 ?auto_420036 ) ) ( not ( = ?auto_420030 ?auto_420031 ) ) ( not ( = ?auto_420030 ?auto_420032 ) ) ( not ( = ?auto_420030 ?auto_420033 ) ) ( not ( = ?auto_420030 ?auto_420034 ) ) ( not ( = ?auto_420030 ?auto_420035 ) ) ( not ( = ?auto_420030 ?auto_420036 ) ) ( not ( = ?auto_420031 ?auto_420032 ) ) ( not ( = ?auto_420031 ?auto_420033 ) ) ( not ( = ?auto_420031 ?auto_420034 ) ) ( not ( = ?auto_420031 ?auto_420035 ) ) ( not ( = ?auto_420031 ?auto_420036 ) ) ( not ( = ?auto_420032 ?auto_420033 ) ) ( not ( = ?auto_420032 ?auto_420034 ) ) ( not ( = ?auto_420032 ?auto_420035 ) ) ( not ( = ?auto_420032 ?auto_420036 ) ) ( not ( = ?auto_420033 ?auto_420034 ) ) ( not ( = ?auto_420033 ?auto_420035 ) ) ( not ( = ?auto_420033 ?auto_420036 ) ) ( not ( = ?auto_420034 ?auto_420035 ) ) ( not ( = ?auto_420034 ?auto_420036 ) ) ( not ( = ?auto_420035 ?auto_420036 ) ) ( ON ?auto_420034 ?auto_420035 ) ( ON ?auto_420033 ?auto_420034 ) ( ON ?auto_420032 ?auto_420033 ) ( ON ?auto_420031 ?auto_420032 ) ( ON ?auto_420030 ?auto_420031 ) ( ON ?auto_420029 ?auto_420030 ) ( ON ?auto_420028 ?auto_420029 ) ( CLEAR ?auto_420026 ) ( ON ?auto_420027 ?auto_420028 ) ( CLEAR ?auto_420027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_420025 ?auto_420026 ?auto_420027 )
      ( MAKE-11PILE ?auto_420025 ?auto_420026 ?auto_420027 ?auto_420028 ?auto_420029 ?auto_420030 ?auto_420031 ?auto_420032 ?auto_420033 ?auto_420034 ?auto_420035 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_420071 - BLOCK
      ?auto_420072 - BLOCK
      ?auto_420073 - BLOCK
      ?auto_420074 - BLOCK
      ?auto_420075 - BLOCK
      ?auto_420076 - BLOCK
      ?auto_420077 - BLOCK
      ?auto_420078 - BLOCK
      ?auto_420079 - BLOCK
      ?auto_420080 - BLOCK
      ?auto_420081 - BLOCK
    )
    :vars
    (
      ?auto_420082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420081 ?auto_420082 ) ( ON-TABLE ?auto_420071 ) ( not ( = ?auto_420071 ?auto_420072 ) ) ( not ( = ?auto_420071 ?auto_420073 ) ) ( not ( = ?auto_420071 ?auto_420074 ) ) ( not ( = ?auto_420071 ?auto_420075 ) ) ( not ( = ?auto_420071 ?auto_420076 ) ) ( not ( = ?auto_420071 ?auto_420077 ) ) ( not ( = ?auto_420071 ?auto_420078 ) ) ( not ( = ?auto_420071 ?auto_420079 ) ) ( not ( = ?auto_420071 ?auto_420080 ) ) ( not ( = ?auto_420071 ?auto_420081 ) ) ( not ( = ?auto_420071 ?auto_420082 ) ) ( not ( = ?auto_420072 ?auto_420073 ) ) ( not ( = ?auto_420072 ?auto_420074 ) ) ( not ( = ?auto_420072 ?auto_420075 ) ) ( not ( = ?auto_420072 ?auto_420076 ) ) ( not ( = ?auto_420072 ?auto_420077 ) ) ( not ( = ?auto_420072 ?auto_420078 ) ) ( not ( = ?auto_420072 ?auto_420079 ) ) ( not ( = ?auto_420072 ?auto_420080 ) ) ( not ( = ?auto_420072 ?auto_420081 ) ) ( not ( = ?auto_420072 ?auto_420082 ) ) ( not ( = ?auto_420073 ?auto_420074 ) ) ( not ( = ?auto_420073 ?auto_420075 ) ) ( not ( = ?auto_420073 ?auto_420076 ) ) ( not ( = ?auto_420073 ?auto_420077 ) ) ( not ( = ?auto_420073 ?auto_420078 ) ) ( not ( = ?auto_420073 ?auto_420079 ) ) ( not ( = ?auto_420073 ?auto_420080 ) ) ( not ( = ?auto_420073 ?auto_420081 ) ) ( not ( = ?auto_420073 ?auto_420082 ) ) ( not ( = ?auto_420074 ?auto_420075 ) ) ( not ( = ?auto_420074 ?auto_420076 ) ) ( not ( = ?auto_420074 ?auto_420077 ) ) ( not ( = ?auto_420074 ?auto_420078 ) ) ( not ( = ?auto_420074 ?auto_420079 ) ) ( not ( = ?auto_420074 ?auto_420080 ) ) ( not ( = ?auto_420074 ?auto_420081 ) ) ( not ( = ?auto_420074 ?auto_420082 ) ) ( not ( = ?auto_420075 ?auto_420076 ) ) ( not ( = ?auto_420075 ?auto_420077 ) ) ( not ( = ?auto_420075 ?auto_420078 ) ) ( not ( = ?auto_420075 ?auto_420079 ) ) ( not ( = ?auto_420075 ?auto_420080 ) ) ( not ( = ?auto_420075 ?auto_420081 ) ) ( not ( = ?auto_420075 ?auto_420082 ) ) ( not ( = ?auto_420076 ?auto_420077 ) ) ( not ( = ?auto_420076 ?auto_420078 ) ) ( not ( = ?auto_420076 ?auto_420079 ) ) ( not ( = ?auto_420076 ?auto_420080 ) ) ( not ( = ?auto_420076 ?auto_420081 ) ) ( not ( = ?auto_420076 ?auto_420082 ) ) ( not ( = ?auto_420077 ?auto_420078 ) ) ( not ( = ?auto_420077 ?auto_420079 ) ) ( not ( = ?auto_420077 ?auto_420080 ) ) ( not ( = ?auto_420077 ?auto_420081 ) ) ( not ( = ?auto_420077 ?auto_420082 ) ) ( not ( = ?auto_420078 ?auto_420079 ) ) ( not ( = ?auto_420078 ?auto_420080 ) ) ( not ( = ?auto_420078 ?auto_420081 ) ) ( not ( = ?auto_420078 ?auto_420082 ) ) ( not ( = ?auto_420079 ?auto_420080 ) ) ( not ( = ?auto_420079 ?auto_420081 ) ) ( not ( = ?auto_420079 ?auto_420082 ) ) ( not ( = ?auto_420080 ?auto_420081 ) ) ( not ( = ?auto_420080 ?auto_420082 ) ) ( not ( = ?auto_420081 ?auto_420082 ) ) ( ON ?auto_420080 ?auto_420081 ) ( ON ?auto_420079 ?auto_420080 ) ( ON ?auto_420078 ?auto_420079 ) ( ON ?auto_420077 ?auto_420078 ) ( ON ?auto_420076 ?auto_420077 ) ( ON ?auto_420075 ?auto_420076 ) ( ON ?auto_420074 ?auto_420075 ) ( ON ?auto_420073 ?auto_420074 ) ( CLEAR ?auto_420071 ) ( ON ?auto_420072 ?auto_420073 ) ( CLEAR ?auto_420072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_420071 ?auto_420072 )
      ( MAKE-11PILE ?auto_420071 ?auto_420072 ?auto_420073 ?auto_420074 ?auto_420075 ?auto_420076 ?auto_420077 ?auto_420078 ?auto_420079 ?auto_420080 ?auto_420081 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_420117 - BLOCK
      ?auto_420118 - BLOCK
      ?auto_420119 - BLOCK
      ?auto_420120 - BLOCK
      ?auto_420121 - BLOCK
      ?auto_420122 - BLOCK
      ?auto_420123 - BLOCK
      ?auto_420124 - BLOCK
      ?auto_420125 - BLOCK
      ?auto_420126 - BLOCK
      ?auto_420127 - BLOCK
    )
    :vars
    (
      ?auto_420128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420127 ?auto_420128 ) ( not ( = ?auto_420117 ?auto_420118 ) ) ( not ( = ?auto_420117 ?auto_420119 ) ) ( not ( = ?auto_420117 ?auto_420120 ) ) ( not ( = ?auto_420117 ?auto_420121 ) ) ( not ( = ?auto_420117 ?auto_420122 ) ) ( not ( = ?auto_420117 ?auto_420123 ) ) ( not ( = ?auto_420117 ?auto_420124 ) ) ( not ( = ?auto_420117 ?auto_420125 ) ) ( not ( = ?auto_420117 ?auto_420126 ) ) ( not ( = ?auto_420117 ?auto_420127 ) ) ( not ( = ?auto_420117 ?auto_420128 ) ) ( not ( = ?auto_420118 ?auto_420119 ) ) ( not ( = ?auto_420118 ?auto_420120 ) ) ( not ( = ?auto_420118 ?auto_420121 ) ) ( not ( = ?auto_420118 ?auto_420122 ) ) ( not ( = ?auto_420118 ?auto_420123 ) ) ( not ( = ?auto_420118 ?auto_420124 ) ) ( not ( = ?auto_420118 ?auto_420125 ) ) ( not ( = ?auto_420118 ?auto_420126 ) ) ( not ( = ?auto_420118 ?auto_420127 ) ) ( not ( = ?auto_420118 ?auto_420128 ) ) ( not ( = ?auto_420119 ?auto_420120 ) ) ( not ( = ?auto_420119 ?auto_420121 ) ) ( not ( = ?auto_420119 ?auto_420122 ) ) ( not ( = ?auto_420119 ?auto_420123 ) ) ( not ( = ?auto_420119 ?auto_420124 ) ) ( not ( = ?auto_420119 ?auto_420125 ) ) ( not ( = ?auto_420119 ?auto_420126 ) ) ( not ( = ?auto_420119 ?auto_420127 ) ) ( not ( = ?auto_420119 ?auto_420128 ) ) ( not ( = ?auto_420120 ?auto_420121 ) ) ( not ( = ?auto_420120 ?auto_420122 ) ) ( not ( = ?auto_420120 ?auto_420123 ) ) ( not ( = ?auto_420120 ?auto_420124 ) ) ( not ( = ?auto_420120 ?auto_420125 ) ) ( not ( = ?auto_420120 ?auto_420126 ) ) ( not ( = ?auto_420120 ?auto_420127 ) ) ( not ( = ?auto_420120 ?auto_420128 ) ) ( not ( = ?auto_420121 ?auto_420122 ) ) ( not ( = ?auto_420121 ?auto_420123 ) ) ( not ( = ?auto_420121 ?auto_420124 ) ) ( not ( = ?auto_420121 ?auto_420125 ) ) ( not ( = ?auto_420121 ?auto_420126 ) ) ( not ( = ?auto_420121 ?auto_420127 ) ) ( not ( = ?auto_420121 ?auto_420128 ) ) ( not ( = ?auto_420122 ?auto_420123 ) ) ( not ( = ?auto_420122 ?auto_420124 ) ) ( not ( = ?auto_420122 ?auto_420125 ) ) ( not ( = ?auto_420122 ?auto_420126 ) ) ( not ( = ?auto_420122 ?auto_420127 ) ) ( not ( = ?auto_420122 ?auto_420128 ) ) ( not ( = ?auto_420123 ?auto_420124 ) ) ( not ( = ?auto_420123 ?auto_420125 ) ) ( not ( = ?auto_420123 ?auto_420126 ) ) ( not ( = ?auto_420123 ?auto_420127 ) ) ( not ( = ?auto_420123 ?auto_420128 ) ) ( not ( = ?auto_420124 ?auto_420125 ) ) ( not ( = ?auto_420124 ?auto_420126 ) ) ( not ( = ?auto_420124 ?auto_420127 ) ) ( not ( = ?auto_420124 ?auto_420128 ) ) ( not ( = ?auto_420125 ?auto_420126 ) ) ( not ( = ?auto_420125 ?auto_420127 ) ) ( not ( = ?auto_420125 ?auto_420128 ) ) ( not ( = ?auto_420126 ?auto_420127 ) ) ( not ( = ?auto_420126 ?auto_420128 ) ) ( not ( = ?auto_420127 ?auto_420128 ) ) ( ON ?auto_420126 ?auto_420127 ) ( ON ?auto_420125 ?auto_420126 ) ( ON ?auto_420124 ?auto_420125 ) ( ON ?auto_420123 ?auto_420124 ) ( ON ?auto_420122 ?auto_420123 ) ( ON ?auto_420121 ?auto_420122 ) ( ON ?auto_420120 ?auto_420121 ) ( ON ?auto_420119 ?auto_420120 ) ( ON ?auto_420118 ?auto_420119 ) ( ON ?auto_420117 ?auto_420118 ) ( CLEAR ?auto_420117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_420117 )
      ( MAKE-11PILE ?auto_420117 ?auto_420118 ?auto_420119 ?auto_420120 ?auto_420121 ?auto_420122 ?auto_420123 ?auto_420124 ?auto_420125 ?auto_420126 ?auto_420127 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420164 - BLOCK
      ?auto_420165 - BLOCK
      ?auto_420166 - BLOCK
      ?auto_420167 - BLOCK
      ?auto_420168 - BLOCK
      ?auto_420169 - BLOCK
      ?auto_420170 - BLOCK
      ?auto_420171 - BLOCK
      ?auto_420172 - BLOCK
      ?auto_420173 - BLOCK
      ?auto_420174 - BLOCK
      ?auto_420175 - BLOCK
    )
    :vars
    (
      ?auto_420176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_420174 ) ( ON ?auto_420175 ?auto_420176 ) ( CLEAR ?auto_420175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_420164 ) ( ON ?auto_420165 ?auto_420164 ) ( ON ?auto_420166 ?auto_420165 ) ( ON ?auto_420167 ?auto_420166 ) ( ON ?auto_420168 ?auto_420167 ) ( ON ?auto_420169 ?auto_420168 ) ( ON ?auto_420170 ?auto_420169 ) ( ON ?auto_420171 ?auto_420170 ) ( ON ?auto_420172 ?auto_420171 ) ( ON ?auto_420173 ?auto_420172 ) ( ON ?auto_420174 ?auto_420173 ) ( not ( = ?auto_420164 ?auto_420165 ) ) ( not ( = ?auto_420164 ?auto_420166 ) ) ( not ( = ?auto_420164 ?auto_420167 ) ) ( not ( = ?auto_420164 ?auto_420168 ) ) ( not ( = ?auto_420164 ?auto_420169 ) ) ( not ( = ?auto_420164 ?auto_420170 ) ) ( not ( = ?auto_420164 ?auto_420171 ) ) ( not ( = ?auto_420164 ?auto_420172 ) ) ( not ( = ?auto_420164 ?auto_420173 ) ) ( not ( = ?auto_420164 ?auto_420174 ) ) ( not ( = ?auto_420164 ?auto_420175 ) ) ( not ( = ?auto_420164 ?auto_420176 ) ) ( not ( = ?auto_420165 ?auto_420166 ) ) ( not ( = ?auto_420165 ?auto_420167 ) ) ( not ( = ?auto_420165 ?auto_420168 ) ) ( not ( = ?auto_420165 ?auto_420169 ) ) ( not ( = ?auto_420165 ?auto_420170 ) ) ( not ( = ?auto_420165 ?auto_420171 ) ) ( not ( = ?auto_420165 ?auto_420172 ) ) ( not ( = ?auto_420165 ?auto_420173 ) ) ( not ( = ?auto_420165 ?auto_420174 ) ) ( not ( = ?auto_420165 ?auto_420175 ) ) ( not ( = ?auto_420165 ?auto_420176 ) ) ( not ( = ?auto_420166 ?auto_420167 ) ) ( not ( = ?auto_420166 ?auto_420168 ) ) ( not ( = ?auto_420166 ?auto_420169 ) ) ( not ( = ?auto_420166 ?auto_420170 ) ) ( not ( = ?auto_420166 ?auto_420171 ) ) ( not ( = ?auto_420166 ?auto_420172 ) ) ( not ( = ?auto_420166 ?auto_420173 ) ) ( not ( = ?auto_420166 ?auto_420174 ) ) ( not ( = ?auto_420166 ?auto_420175 ) ) ( not ( = ?auto_420166 ?auto_420176 ) ) ( not ( = ?auto_420167 ?auto_420168 ) ) ( not ( = ?auto_420167 ?auto_420169 ) ) ( not ( = ?auto_420167 ?auto_420170 ) ) ( not ( = ?auto_420167 ?auto_420171 ) ) ( not ( = ?auto_420167 ?auto_420172 ) ) ( not ( = ?auto_420167 ?auto_420173 ) ) ( not ( = ?auto_420167 ?auto_420174 ) ) ( not ( = ?auto_420167 ?auto_420175 ) ) ( not ( = ?auto_420167 ?auto_420176 ) ) ( not ( = ?auto_420168 ?auto_420169 ) ) ( not ( = ?auto_420168 ?auto_420170 ) ) ( not ( = ?auto_420168 ?auto_420171 ) ) ( not ( = ?auto_420168 ?auto_420172 ) ) ( not ( = ?auto_420168 ?auto_420173 ) ) ( not ( = ?auto_420168 ?auto_420174 ) ) ( not ( = ?auto_420168 ?auto_420175 ) ) ( not ( = ?auto_420168 ?auto_420176 ) ) ( not ( = ?auto_420169 ?auto_420170 ) ) ( not ( = ?auto_420169 ?auto_420171 ) ) ( not ( = ?auto_420169 ?auto_420172 ) ) ( not ( = ?auto_420169 ?auto_420173 ) ) ( not ( = ?auto_420169 ?auto_420174 ) ) ( not ( = ?auto_420169 ?auto_420175 ) ) ( not ( = ?auto_420169 ?auto_420176 ) ) ( not ( = ?auto_420170 ?auto_420171 ) ) ( not ( = ?auto_420170 ?auto_420172 ) ) ( not ( = ?auto_420170 ?auto_420173 ) ) ( not ( = ?auto_420170 ?auto_420174 ) ) ( not ( = ?auto_420170 ?auto_420175 ) ) ( not ( = ?auto_420170 ?auto_420176 ) ) ( not ( = ?auto_420171 ?auto_420172 ) ) ( not ( = ?auto_420171 ?auto_420173 ) ) ( not ( = ?auto_420171 ?auto_420174 ) ) ( not ( = ?auto_420171 ?auto_420175 ) ) ( not ( = ?auto_420171 ?auto_420176 ) ) ( not ( = ?auto_420172 ?auto_420173 ) ) ( not ( = ?auto_420172 ?auto_420174 ) ) ( not ( = ?auto_420172 ?auto_420175 ) ) ( not ( = ?auto_420172 ?auto_420176 ) ) ( not ( = ?auto_420173 ?auto_420174 ) ) ( not ( = ?auto_420173 ?auto_420175 ) ) ( not ( = ?auto_420173 ?auto_420176 ) ) ( not ( = ?auto_420174 ?auto_420175 ) ) ( not ( = ?auto_420174 ?auto_420176 ) ) ( not ( = ?auto_420175 ?auto_420176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_420175 ?auto_420176 )
      ( !STACK ?auto_420175 ?auto_420174 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420214 - BLOCK
      ?auto_420215 - BLOCK
      ?auto_420216 - BLOCK
      ?auto_420217 - BLOCK
      ?auto_420218 - BLOCK
      ?auto_420219 - BLOCK
      ?auto_420220 - BLOCK
      ?auto_420221 - BLOCK
      ?auto_420222 - BLOCK
      ?auto_420223 - BLOCK
      ?auto_420224 - BLOCK
      ?auto_420225 - BLOCK
    )
    :vars
    (
      ?auto_420226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420225 ?auto_420226 ) ( ON-TABLE ?auto_420214 ) ( ON ?auto_420215 ?auto_420214 ) ( ON ?auto_420216 ?auto_420215 ) ( ON ?auto_420217 ?auto_420216 ) ( ON ?auto_420218 ?auto_420217 ) ( ON ?auto_420219 ?auto_420218 ) ( ON ?auto_420220 ?auto_420219 ) ( ON ?auto_420221 ?auto_420220 ) ( ON ?auto_420222 ?auto_420221 ) ( ON ?auto_420223 ?auto_420222 ) ( not ( = ?auto_420214 ?auto_420215 ) ) ( not ( = ?auto_420214 ?auto_420216 ) ) ( not ( = ?auto_420214 ?auto_420217 ) ) ( not ( = ?auto_420214 ?auto_420218 ) ) ( not ( = ?auto_420214 ?auto_420219 ) ) ( not ( = ?auto_420214 ?auto_420220 ) ) ( not ( = ?auto_420214 ?auto_420221 ) ) ( not ( = ?auto_420214 ?auto_420222 ) ) ( not ( = ?auto_420214 ?auto_420223 ) ) ( not ( = ?auto_420214 ?auto_420224 ) ) ( not ( = ?auto_420214 ?auto_420225 ) ) ( not ( = ?auto_420214 ?auto_420226 ) ) ( not ( = ?auto_420215 ?auto_420216 ) ) ( not ( = ?auto_420215 ?auto_420217 ) ) ( not ( = ?auto_420215 ?auto_420218 ) ) ( not ( = ?auto_420215 ?auto_420219 ) ) ( not ( = ?auto_420215 ?auto_420220 ) ) ( not ( = ?auto_420215 ?auto_420221 ) ) ( not ( = ?auto_420215 ?auto_420222 ) ) ( not ( = ?auto_420215 ?auto_420223 ) ) ( not ( = ?auto_420215 ?auto_420224 ) ) ( not ( = ?auto_420215 ?auto_420225 ) ) ( not ( = ?auto_420215 ?auto_420226 ) ) ( not ( = ?auto_420216 ?auto_420217 ) ) ( not ( = ?auto_420216 ?auto_420218 ) ) ( not ( = ?auto_420216 ?auto_420219 ) ) ( not ( = ?auto_420216 ?auto_420220 ) ) ( not ( = ?auto_420216 ?auto_420221 ) ) ( not ( = ?auto_420216 ?auto_420222 ) ) ( not ( = ?auto_420216 ?auto_420223 ) ) ( not ( = ?auto_420216 ?auto_420224 ) ) ( not ( = ?auto_420216 ?auto_420225 ) ) ( not ( = ?auto_420216 ?auto_420226 ) ) ( not ( = ?auto_420217 ?auto_420218 ) ) ( not ( = ?auto_420217 ?auto_420219 ) ) ( not ( = ?auto_420217 ?auto_420220 ) ) ( not ( = ?auto_420217 ?auto_420221 ) ) ( not ( = ?auto_420217 ?auto_420222 ) ) ( not ( = ?auto_420217 ?auto_420223 ) ) ( not ( = ?auto_420217 ?auto_420224 ) ) ( not ( = ?auto_420217 ?auto_420225 ) ) ( not ( = ?auto_420217 ?auto_420226 ) ) ( not ( = ?auto_420218 ?auto_420219 ) ) ( not ( = ?auto_420218 ?auto_420220 ) ) ( not ( = ?auto_420218 ?auto_420221 ) ) ( not ( = ?auto_420218 ?auto_420222 ) ) ( not ( = ?auto_420218 ?auto_420223 ) ) ( not ( = ?auto_420218 ?auto_420224 ) ) ( not ( = ?auto_420218 ?auto_420225 ) ) ( not ( = ?auto_420218 ?auto_420226 ) ) ( not ( = ?auto_420219 ?auto_420220 ) ) ( not ( = ?auto_420219 ?auto_420221 ) ) ( not ( = ?auto_420219 ?auto_420222 ) ) ( not ( = ?auto_420219 ?auto_420223 ) ) ( not ( = ?auto_420219 ?auto_420224 ) ) ( not ( = ?auto_420219 ?auto_420225 ) ) ( not ( = ?auto_420219 ?auto_420226 ) ) ( not ( = ?auto_420220 ?auto_420221 ) ) ( not ( = ?auto_420220 ?auto_420222 ) ) ( not ( = ?auto_420220 ?auto_420223 ) ) ( not ( = ?auto_420220 ?auto_420224 ) ) ( not ( = ?auto_420220 ?auto_420225 ) ) ( not ( = ?auto_420220 ?auto_420226 ) ) ( not ( = ?auto_420221 ?auto_420222 ) ) ( not ( = ?auto_420221 ?auto_420223 ) ) ( not ( = ?auto_420221 ?auto_420224 ) ) ( not ( = ?auto_420221 ?auto_420225 ) ) ( not ( = ?auto_420221 ?auto_420226 ) ) ( not ( = ?auto_420222 ?auto_420223 ) ) ( not ( = ?auto_420222 ?auto_420224 ) ) ( not ( = ?auto_420222 ?auto_420225 ) ) ( not ( = ?auto_420222 ?auto_420226 ) ) ( not ( = ?auto_420223 ?auto_420224 ) ) ( not ( = ?auto_420223 ?auto_420225 ) ) ( not ( = ?auto_420223 ?auto_420226 ) ) ( not ( = ?auto_420224 ?auto_420225 ) ) ( not ( = ?auto_420224 ?auto_420226 ) ) ( not ( = ?auto_420225 ?auto_420226 ) ) ( CLEAR ?auto_420223 ) ( ON ?auto_420224 ?auto_420225 ) ( CLEAR ?auto_420224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_420214 ?auto_420215 ?auto_420216 ?auto_420217 ?auto_420218 ?auto_420219 ?auto_420220 ?auto_420221 ?auto_420222 ?auto_420223 ?auto_420224 )
      ( MAKE-12PILE ?auto_420214 ?auto_420215 ?auto_420216 ?auto_420217 ?auto_420218 ?auto_420219 ?auto_420220 ?auto_420221 ?auto_420222 ?auto_420223 ?auto_420224 ?auto_420225 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420264 - BLOCK
      ?auto_420265 - BLOCK
      ?auto_420266 - BLOCK
      ?auto_420267 - BLOCK
      ?auto_420268 - BLOCK
      ?auto_420269 - BLOCK
      ?auto_420270 - BLOCK
      ?auto_420271 - BLOCK
      ?auto_420272 - BLOCK
      ?auto_420273 - BLOCK
      ?auto_420274 - BLOCK
      ?auto_420275 - BLOCK
    )
    :vars
    (
      ?auto_420276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420275 ?auto_420276 ) ( ON-TABLE ?auto_420264 ) ( ON ?auto_420265 ?auto_420264 ) ( ON ?auto_420266 ?auto_420265 ) ( ON ?auto_420267 ?auto_420266 ) ( ON ?auto_420268 ?auto_420267 ) ( ON ?auto_420269 ?auto_420268 ) ( ON ?auto_420270 ?auto_420269 ) ( ON ?auto_420271 ?auto_420270 ) ( ON ?auto_420272 ?auto_420271 ) ( not ( = ?auto_420264 ?auto_420265 ) ) ( not ( = ?auto_420264 ?auto_420266 ) ) ( not ( = ?auto_420264 ?auto_420267 ) ) ( not ( = ?auto_420264 ?auto_420268 ) ) ( not ( = ?auto_420264 ?auto_420269 ) ) ( not ( = ?auto_420264 ?auto_420270 ) ) ( not ( = ?auto_420264 ?auto_420271 ) ) ( not ( = ?auto_420264 ?auto_420272 ) ) ( not ( = ?auto_420264 ?auto_420273 ) ) ( not ( = ?auto_420264 ?auto_420274 ) ) ( not ( = ?auto_420264 ?auto_420275 ) ) ( not ( = ?auto_420264 ?auto_420276 ) ) ( not ( = ?auto_420265 ?auto_420266 ) ) ( not ( = ?auto_420265 ?auto_420267 ) ) ( not ( = ?auto_420265 ?auto_420268 ) ) ( not ( = ?auto_420265 ?auto_420269 ) ) ( not ( = ?auto_420265 ?auto_420270 ) ) ( not ( = ?auto_420265 ?auto_420271 ) ) ( not ( = ?auto_420265 ?auto_420272 ) ) ( not ( = ?auto_420265 ?auto_420273 ) ) ( not ( = ?auto_420265 ?auto_420274 ) ) ( not ( = ?auto_420265 ?auto_420275 ) ) ( not ( = ?auto_420265 ?auto_420276 ) ) ( not ( = ?auto_420266 ?auto_420267 ) ) ( not ( = ?auto_420266 ?auto_420268 ) ) ( not ( = ?auto_420266 ?auto_420269 ) ) ( not ( = ?auto_420266 ?auto_420270 ) ) ( not ( = ?auto_420266 ?auto_420271 ) ) ( not ( = ?auto_420266 ?auto_420272 ) ) ( not ( = ?auto_420266 ?auto_420273 ) ) ( not ( = ?auto_420266 ?auto_420274 ) ) ( not ( = ?auto_420266 ?auto_420275 ) ) ( not ( = ?auto_420266 ?auto_420276 ) ) ( not ( = ?auto_420267 ?auto_420268 ) ) ( not ( = ?auto_420267 ?auto_420269 ) ) ( not ( = ?auto_420267 ?auto_420270 ) ) ( not ( = ?auto_420267 ?auto_420271 ) ) ( not ( = ?auto_420267 ?auto_420272 ) ) ( not ( = ?auto_420267 ?auto_420273 ) ) ( not ( = ?auto_420267 ?auto_420274 ) ) ( not ( = ?auto_420267 ?auto_420275 ) ) ( not ( = ?auto_420267 ?auto_420276 ) ) ( not ( = ?auto_420268 ?auto_420269 ) ) ( not ( = ?auto_420268 ?auto_420270 ) ) ( not ( = ?auto_420268 ?auto_420271 ) ) ( not ( = ?auto_420268 ?auto_420272 ) ) ( not ( = ?auto_420268 ?auto_420273 ) ) ( not ( = ?auto_420268 ?auto_420274 ) ) ( not ( = ?auto_420268 ?auto_420275 ) ) ( not ( = ?auto_420268 ?auto_420276 ) ) ( not ( = ?auto_420269 ?auto_420270 ) ) ( not ( = ?auto_420269 ?auto_420271 ) ) ( not ( = ?auto_420269 ?auto_420272 ) ) ( not ( = ?auto_420269 ?auto_420273 ) ) ( not ( = ?auto_420269 ?auto_420274 ) ) ( not ( = ?auto_420269 ?auto_420275 ) ) ( not ( = ?auto_420269 ?auto_420276 ) ) ( not ( = ?auto_420270 ?auto_420271 ) ) ( not ( = ?auto_420270 ?auto_420272 ) ) ( not ( = ?auto_420270 ?auto_420273 ) ) ( not ( = ?auto_420270 ?auto_420274 ) ) ( not ( = ?auto_420270 ?auto_420275 ) ) ( not ( = ?auto_420270 ?auto_420276 ) ) ( not ( = ?auto_420271 ?auto_420272 ) ) ( not ( = ?auto_420271 ?auto_420273 ) ) ( not ( = ?auto_420271 ?auto_420274 ) ) ( not ( = ?auto_420271 ?auto_420275 ) ) ( not ( = ?auto_420271 ?auto_420276 ) ) ( not ( = ?auto_420272 ?auto_420273 ) ) ( not ( = ?auto_420272 ?auto_420274 ) ) ( not ( = ?auto_420272 ?auto_420275 ) ) ( not ( = ?auto_420272 ?auto_420276 ) ) ( not ( = ?auto_420273 ?auto_420274 ) ) ( not ( = ?auto_420273 ?auto_420275 ) ) ( not ( = ?auto_420273 ?auto_420276 ) ) ( not ( = ?auto_420274 ?auto_420275 ) ) ( not ( = ?auto_420274 ?auto_420276 ) ) ( not ( = ?auto_420275 ?auto_420276 ) ) ( ON ?auto_420274 ?auto_420275 ) ( CLEAR ?auto_420272 ) ( ON ?auto_420273 ?auto_420274 ) ( CLEAR ?auto_420273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_420264 ?auto_420265 ?auto_420266 ?auto_420267 ?auto_420268 ?auto_420269 ?auto_420270 ?auto_420271 ?auto_420272 ?auto_420273 )
      ( MAKE-12PILE ?auto_420264 ?auto_420265 ?auto_420266 ?auto_420267 ?auto_420268 ?auto_420269 ?auto_420270 ?auto_420271 ?auto_420272 ?auto_420273 ?auto_420274 ?auto_420275 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420314 - BLOCK
      ?auto_420315 - BLOCK
      ?auto_420316 - BLOCK
      ?auto_420317 - BLOCK
      ?auto_420318 - BLOCK
      ?auto_420319 - BLOCK
      ?auto_420320 - BLOCK
      ?auto_420321 - BLOCK
      ?auto_420322 - BLOCK
      ?auto_420323 - BLOCK
      ?auto_420324 - BLOCK
      ?auto_420325 - BLOCK
    )
    :vars
    (
      ?auto_420326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420325 ?auto_420326 ) ( ON-TABLE ?auto_420314 ) ( ON ?auto_420315 ?auto_420314 ) ( ON ?auto_420316 ?auto_420315 ) ( ON ?auto_420317 ?auto_420316 ) ( ON ?auto_420318 ?auto_420317 ) ( ON ?auto_420319 ?auto_420318 ) ( ON ?auto_420320 ?auto_420319 ) ( ON ?auto_420321 ?auto_420320 ) ( not ( = ?auto_420314 ?auto_420315 ) ) ( not ( = ?auto_420314 ?auto_420316 ) ) ( not ( = ?auto_420314 ?auto_420317 ) ) ( not ( = ?auto_420314 ?auto_420318 ) ) ( not ( = ?auto_420314 ?auto_420319 ) ) ( not ( = ?auto_420314 ?auto_420320 ) ) ( not ( = ?auto_420314 ?auto_420321 ) ) ( not ( = ?auto_420314 ?auto_420322 ) ) ( not ( = ?auto_420314 ?auto_420323 ) ) ( not ( = ?auto_420314 ?auto_420324 ) ) ( not ( = ?auto_420314 ?auto_420325 ) ) ( not ( = ?auto_420314 ?auto_420326 ) ) ( not ( = ?auto_420315 ?auto_420316 ) ) ( not ( = ?auto_420315 ?auto_420317 ) ) ( not ( = ?auto_420315 ?auto_420318 ) ) ( not ( = ?auto_420315 ?auto_420319 ) ) ( not ( = ?auto_420315 ?auto_420320 ) ) ( not ( = ?auto_420315 ?auto_420321 ) ) ( not ( = ?auto_420315 ?auto_420322 ) ) ( not ( = ?auto_420315 ?auto_420323 ) ) ( not ( = ?auto_420315 ?auto_420324 ) ) ( not ( = ?auto_420315 ?auto_420325 ) ) ( not ( = ?auto_420315 ?auto_420326 ) ) ( not ( = ?auto_420316 ?auto_420317 ) ) ( not ( = ?auto_420316 ?auto_420318 ) ) ( not ( = ?auto_420316 ?auto_420319 ) ) ( not ( = ?auto_420316 ?auto_420320 ) ) ( not ( = ?auto_420316 ?auto_420321 ) ) ( not ( = ?auto_420316 ?auto_420322 ) ) ( not ( = ?auto_420316 ?auto_420323 ) ) ( not ( = ?auto_420316 ?auto_420324 ) ) ( not ( = ?auto_420316 ?auto_420325 ) ) ( not ( = ?auto_420316 ?auto_420326 ) ) ( not ( = ?auto_420317 ?auto_420318 ) ) ( not ( = ?auto_420317 ?auto_420319 ) ) ( not ( = ?auto_420317 ?auto_420320 ) ) ( not ( = ?auto_420317 ?auto_420321 ) ) ( not ( = ?auto_420317 ?auto_420322 ) ) ( not ( = ?auto_420317 ?auto_420323 ) ) ( not ( = ?auto_420317 ?auto_420324 ) ) ( not ( = ?auto_420317 ?auto_420325 ) ) ( not ( = ?auto_420317 ?auto_420326 ) ) ( not ( = ?auto_420318 ?auto_420319 ) ) ( not ( = ?auto_420318 ?auto_420320 ) ) ( not ( = ?auto_420318 ?auto_420321 ) ) ( not ( = ?auto_420318 ?auto_420322 ) ) ( not ( = ?auto_420318 ?auto_420323 ) ) ( not ( = ?auto_420318 ?auto_420324 ) ) ( not ( = ?auto_420318 ?auto_420325 ) ) ( not ( = ?auto_420318 ?auto_420326 ) ) ( not ( = ?auto_420319 ?auto_420320 ) ) ( not ( = ?auto_420319 ?auto_420321 ) ) ( not ( = ?auto_420319 ?auto_420322 ) ) ( not ( = ?auto_420319 ?auto_420323 ) ) ( not ( = ?auto_420319 ?auto_420324 ) ) ( not ( = ?auto_420319 ?auto_420325 ) ) ( not ( = ?auto_420319 ?auto_420326 ) ) ( not ( = ?auto_420320 ?auto_420321 ) ) ( not ( = ?auto_420320 ?auto_420322 ) ) ( not ( = ?auto_420320 ?auto_420323 ) ) ( not ( = ?auto_420320 ?auto_420324 ) ) ( not ( = ?auto_420320 ?auto_420325 ) ) ( not ( = ?auto_420320 ?auto_420326 ) ) ( not ( = ?auto_420321 ?auto_420322 ) ) ( not ( = ?auto_420321 ?auto_420323 ) ) ( not ( = ?auto_420321 ?auto_420324 ) ) ( not ( = ?auto_420321 ?auto_420325 ) ) ( not ( = ?auto_420321 ?auto_420326 ) ) ( not ( = ?auto_420322 ?auto_420323 ) ) ( not ( = ?auto_420322 ?auto_420324 ) ) ( not ( = ?auto_420322 ?auto_420325 ) ) ( not ( = ?auto_420322 ?auto_420326 ) ) ( not ( = ?auto_420323 ?auto_420324 ) ) ( not ( = ?auto_420323 ?auto_420325 ) ) ( not ( = ?auto_420323 ?auto_420326 ) ) ( not ( = ?auto_420324 ?auto_420325 ) ) ( not ( = ?auto_420324 ?auto_420326 ) ) ( not ( = ?auto_420325 ?auto_420326 ) ) ( ON ?auto_420324 ?auto_420325 ) ( ON ?auto_420323 ?auto_420324 ) ( CLEAR ?auto_420321 ) ( ON ?auto_420322 ?auto_420323 ) ( CLEAR ?auto_420322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_420314 ?auto_420315 ?auto_420316 ?auto_420317 ?auto_420318 ?auto_420319 ?auto_420320 ?auto_420321 ?auto_420322 )
      ( MAKE-12PILE ?auto_420314 ?auto_420315 ?auto_420316 ?auto_420317 ?auto_420318 ?auto_420319 ?auto_420320 ?auto_420321 ?auto_420322 ?auto_420323 ?auto_420324 ?auto_420325 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420364 - BLOCK
      ?auto_420365 - BLOCK
      ?auto_420366 - BLOCK
      ?auto_420367 - BLOCK
      ?auto_420368 - BLOCK
      ?auto_420369 - BLOCK
      ?auto_420370 - BLOCK
      ?auto_420371 - BLOCK
      ?auto_420372 - BLOCK
      ?auto_420373 - BLOCK
      ?auto_420374 - BLOCK
      ?auto_420375 - BLOCK
    )
    :vars
    (
      ?auto_420376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420375 ?auto_420376 ) ( ON-TABLE ?auto_420364 ) ( ON ?auto_420365 ?auto_420364 ) ( ON ?auto_420366 ?auto_420365 ) ( ON ?auto_420367 ?auto_420366 ) ( ON ?auto_420368 ?auto_420367 ) ( ON ?auto_420369 ?auto_420368 ) ( ON ?auto_420370 ?auto_420369 ) ( not ( = ?auto_420364 ?auto_420365 ) ) ( not ( = ?auto_420364 ?auto_420366 ) ) ( not ( = ?auto_420364 ?auto_420367 ) ) ( not ( = ?auto_420364 ?auto_420368 ) ) ( not ( = ?auto_420364 ?auto_420369 ) ) ( not ( = ?auto_420364 ?auto_420370 ) ) ( not ( = ?auto_420364 ?auto_420371 ) ) ( not ( = ?auto_420364 ?auto_420372 ) ) ( not ( = ?auto_420364 ?auto_420373 ) ) ( not ( = ?auto_420364 ?auto_420374 ) ) ( not ( = ?auto_420364 ?auto_420375 ) ) ( not ( = ?auto_420364 ?auto_420376 ) ) ( not ( = ?auto_420365 ?auto_420366 ) ) ( not ( = ?auto_420365 ?auto_420367 ) ) ( not ( = ?auto_420365 ?auto_420368 ) ) ( not ( = ?auto_420365 ?auto_420369 ) ) ( not ( = ?auto_420365 ?auto_420370 ) ) ( not ( = ?auto_420365 ?auto_420371 ) ) ( not ( = ?auto_420365 ?auto_420372 ) ) ( not ( = ?auto_420365 ?auto_420373 ) ) ( not ( = ?auto_420365 ?auto_420374 ) ) ( not ( = ?auto_420365 ?auto_420375 ) ) ( not ( = ?auto_420365 ?auto_420376 ) ) ( not ( = ?auto_420366 ?auto_420367 ) ) ( not ( = ?auto_420366 ?auto_420368 ) ) ( not ( = ?auto_420366 ?auto_420369 ) ) ( not ( = ?auto_420366 ?auto_420370 ) ) ( not ( = ?auto_420366 ?auto_420371 ) ) ( not ( = ?auto_420366 ?auto_420372 ) ) ( not ( = ?auto_420366 ?auto_420373 ) ) ( not ( = ?auto_420366 ?auto_420374 ) ) ( not ( = ?auto_420366 ?auto_420375 ) ) ( not ( = ?auto_420366 ?auto_420376 ) ) ( not ( = ?auto_420367 ?auto_420368 ) ) ( not ( = ?auto_420367 ?auto_420369 ) ) ( not ( = ?auto_420367 ?auto_420370 ) ) ( not ( = ?auto_420367 ?auto_420371 ) ) ( not ( = ?auto_420367 ?auto_420372 ) ) ( not ( = ?auto_420367 ?auto_420373 ) ) ( not ( = ?auto_420367 ?auto_420374 ) ) ( not ( = ?auto_420367 ?auto_420375 ) ) ( not ( = ?auto_420367 ?auto_420376 ) ) ( not ( = ?auto_420368 ?auto_420369 ) ) ( not ( = ?auto_420368 ?auto_420370 ) ) ( not ( = ?auto_420368 ?auto_420371 ) ) ( not ( = ?auto_420368 ?auto_420372 ) ) ( not ( = ?auto_420368 ?auto_420373 ) ) ( not ( = ?auto_420368 ?auto_420374 ) ) ( not ( = ?auto_420368 ?auto_420375 ) ) ( not ( = ?auto_420368 ?auto_420376 ) ) ( not ( = ?auto_420369 ?auto_420370 ) ) ( not ( = ?auto_420369 ?auto_420371 ) ) ( not ( = ?auto_420369 ?auto_420372 ) ) ( not ( = ?auto_420369 ?auto_420373 ) ) ( not ( = ?auto_420369 ?auto_420374 ) ) ( not ( = ?auto_420369 ?auto_420375 ) ) ( not ( = ?auto_420369 ?auto_420376 ) ) ( not ( = ?auto_420370 ?auto_420371 ) ) ( not ( = ?auto_420370 ?auto_420372 ) ) ( not ( = ?auto_420370 ?auto_420373 ) ) ( not ( = ?auto_420370 ?auto_420374 ) ) ( not ( = ?auto_420370 ?auto_420375 ) ) ( not ( = ?auto_420370 ?auto_420376 ) ) ( not ( = ?auto_420371 ?auto_420372 ) ) ( not ( = ?auto_420371 ?auto_420373 ) ) ( not ( = ?auto_420371 ?auto_420374 ) ) ( not ( = ?auto_420371 ?auto_420375 ) ) ( not ( = ?auto_420371 ?auto_420376 ) ) ( not ( = ?auto_420372 ?auto_420373 ) ) ( not ( = ?auto_420372 ?auto_420374 ) ) ( not ( = ?auto_420372 ?auto_420375 ) ) ( not ( = ?auto_420372 ?auto_420376 ) ) ( not ( = ?auto_420373 ?auto_420374 ) ) ( not ( = ?auto_420373 ?auto_420375 ) ) ( not ( = ?auto_420373 ?auto_420376 ) ) ( not ( = ?auto_420374 ?auto_420375 ) ) ( not ( = ?auto_420374 ?auto_420376 ) ) ( not ( = ?auto_420375 ?auto_420376 ) ) ( ON ?auto_420374 ?auto_420375 ) ( ON ?auto_420373 ?auto_420374 ) ( ON ?auto_420372 ?auto_420373 ) ( CLEAR ?auto_420370 ) ( ON ?auto_420371 ?auto_420372 ) ( CLEAR ?auto_420371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_420364 ?auto_420365 ?auto_420366 ?auto_420367 ?auto_420368 ?auto_420369 ?auto_420370 ?auto_420371 )
      ( MAKE-12PILE ?auto_420364 ?auto_420365 ?auto_420366 ?auto_420367 ?auto_420368 ?auto_420369 ?auto_420370 ?auto_420371 ?auto_420372 ?auto_420373 ?auto_420374 ?auto_420375 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420414 - BLOCK
      ?auto_420415 - BLOCK
      ?auto_420416 - BLOCK
      ?auto_420417 - BLOCK
      ?auto_420418 - BLOCK
      ?auto_420419 - BLOCK
      ?auto_420420 - BLOCK
      ?auto_420421 - BLOCK
      ?auto_420422 - BLOCK
      ?auto_420423 - BLOCK
      ?auto_420424 - BLOCK
      ?auto_420425 - BLOCK
    )
    :vars
    (
      ?auto_420426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420425 ?auto_420426 ) ( ON-TABLE ?auto_420414 ) ( ON ?auto_420415 ?auto_420414 ) ( ON ?auto_420416 ?auto_420415 ) ( ON ?auto_420417 ?auto_420416 ) ( ON ?auto_420418 ?auto_420417 ) ( ON ?auto_420419 ?auto_420418 ) ( not ( = ?auto_420414 ?auto_420415 ) ) ( not ( = ?auto_420414 ?auto_420416 ) ) ( not ( = ?auto_420414 ?auto_420417 ) ) ( not ( = ?auto_420414 ?auto_420418 ) ) ( not ( = ?auto_420414 ?auto_420419 ) ) ( not ( = ?auto_420414 ?auto_420420 ) ) ( not ( = ?auto_420414 ?auto_420421 ) ) ( not ( = ?auto_420414 ?auto_420422 ) ) ( not ( = ?auto_420414 ?auto_420423 ) ) ( not ( = ?auto_420414 ?auto_420424 ) ) ( not ( = ?auto_420414 ?auto_420425 ) ) ( not ( = ?auto_420414 ?auto_420426 ) ) ( not ( = ?auto_420415 ?auto_420416 ) ) ( not ( = ?auto_420415 ?auto_420417 ) ) ( not ( = ?auto_420415 ?auto_420418 ) ) ( not ( = ?auto_420415 ?auto_420419 ) ) ( not ( = ?auto_420415 ?auto_420420 ) ) ( not ( = ?auto_420415 ?auto_420421 ) ) ( not ( = ?auto_420415 ?auto_420422 ) ) ( not ( = ?auto_420415 ?auto_420423 ) ) ( not ( = ?auto_420415 ?auto_420424 ) ) ( not ( = ?auto_420415 ?auto_420425 ) ) ( not ( = ?auto_420415 ?auto_420426 ) ) ( not ( = ?auto_420416 ?auto_420417 ) ) ( not ( = ?auto_420416 ?auto_420418 ) ) ( not ( = ?auto_420416 ?auto_420419 ) ) ( not ( = ?auto_420416 ?auto_420420 ) ) ( not ( = ?auto_420416 ?auto_420421 ) ) ( not ( = ?auto_420416 ?auto_420422 ) ) ( not ( = ?auto_420416 ?auto_420423 ) ) ( not ( = ?auto_420416 ?auto_420424 ) ) ( not ( = ?auto_420416 ?auto_420425 ) ) ( not ( = ?auto_420416 ?auto_420426 ) ) ( not ( = ?auto_420417 ?auto_420418 ) ) ( not ( = ?auto_420417 ?auto_420419 ) ) ( not ( = ?auto_420417 ?auto_420420 ) ) ( not ( = ?auto_420417 ?auto_420421 ) ) ( not ( = ?auto_420417 ?auto_420422 ) ) ( not ( = ?auto_420417 ?auto_420423 ) ) ( not ( = ?auto_420417 ?auto_420424 ) ) ( not ( = ?auto_420417 ?auto_420425 ) ) ( not ( = ?auto_420417 ?auto_420426 ) ) ( not ( = ?auto_420418 ?auto_420419 ) ) ( not ( = ?auto_420418 ?auto_420420 ) ) ( not ( = ?auto_420418 ?auto_420421 ) ) ( not ( = ?auto_420418 ?auto_420422 ) ) ( not ( = ?auto_420418 ?auto_420423 ) ) ( not ( = ?auto_420418 ?auto_420424 ) ) ( not ( = ?auto_420418 ?auto_420425 ) ) ( not ( = ?auto_420418 ?auto_420426 ) ) ( not ( = ?auto_420419 ?auto_420420 ) ) ( not ( = ?auto_420419 ?auto_420421 ) ) ( not ( = ?auto_420419 ?auto_420422 ) ) ( not ( = ?auto_420419 ?auto_420423 ) ) ( not ( = ?auto_420419 ?auto_420424 ) ) ( not ( = ?auto_420419 ?auto_420425 ) ) ( not ( = ?auto_420419 ?auto_420426 ) ) ( not ( = ?auto_420420 ?auto_420421 ) ) ( not ( = ?auto_420420 ?auto_420422 ) ) ( not ( = ?auto_420420 ?auto_420423 ) ) ( not ( = ?auto_420420 ?auto_420424 ) ) ( not ( = ?auto_420420 ?auto_420425 ) ) ( not ( = ?auto_420420 ?auto_420426 ) ) ( not ( = ?auto_420421 ?auto_420422 ) ) ( not ( = ?auto_420421 ?auto_420423 ) ) ( not ( = ?auto_420421 ?auto_420424 ) ) ( not ( = ?auto_420421 ?auto_420425 ) ) ( not ( = ?auto_420421 ?auto_420426 ) ) ( not ( = ?auto_420422 ?auto_420423 ) ) ( not ( = ?auto_420422 ?auto_420424 ) ) ( not ( = ?auto_420422 ?auto_420425 ) ) ( not ( = ?auto_420422 ?auto_420426 ) ) ( not ( = ?auto_420423 ?auto_420424 ) ) ( not ( = ?auto_420423 ?auto_420425 ) ) ( not ( = ?auto_420423 ?auto_420426 ) ) ( not ( = ?auto_420424 ?auto_420425 ) ) ( not ( = ?auto_420424 ?auto_420426 ) ) ( not ( = ?auto_420425 ?auto_420426 ) ) ( ON ?auto_420424 ?auto_420425 ) ( ON ?auto_420423 ?auto_420424 ) ( ON ?auto_420422 ?auto_420423 ) ( ON ?auto_420421 ?auto_420422 ) ( CLEAR ?auto_420419 ) ( ON ?auto_420420 ?auto_420421 ) ( CLEAR ?auto_420420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_420414 ?auto_420415 ?auto_420416 ?auto_420417 ?auto_420418 ?auto_420419 ?auto_420420 )
      ( MAKE-12PILE ?auto_420414 ?auto_420415 ?auto_420416 ?auto_420417 ?auto_420418 ?auto_420419 ?auto_420420 ?auto_420421 ?auto_420422 ?auto_420423 ?auto_420424 ?auto_420425 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420464 - BLOCK
      ?auto_420465 - BLOCK
      ?auto_420466 - BLOCK
      ?auto_420467 - BLOCK
      ?auto_420468 - BLOCK
      ?auto_420469 - BLOCK
      ?auto_420470 - BLOCK
      ?auto_420471 - BLOCK
      ?auto_420472 - BLOCK
      ?auto_420473 - BLOCK
      ?auto_420474 - BLOCK
      ?auto_420475 - BLOCK
    )
    :vars
    (
      ?auto_420476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420475 ?auto_420476 ) ( ON-TABLE ?auto_420464 ) ( ON ?auto_420465 ?auto_420464 ) ( ON ?auto_420466 ?auto_420465 ) ( ON ?auto_420467 ?auto_420466 ) ( ON ?auto_420468 ?auto_420467 ) ( not ( = ?auto_420464 ?auto_420465 ) ) ( not ( = ?auto_420464 ?auto_420466 ) ) ( not ( = ?auto_420464 ?auto_420467 ) ) ( not ( = ?auto_420464 ?auto_420468 ) ) ( not ( = ?auto_420464 ?auto_420469 ) ) ( not ( = ?auto_420464 ?auto_420470 ) ) ( not ( = ?auto_420464 ?auto_420471 ) ) ( not ( = ?auto_420464 ?auto_420472 ) ) ( not ( = ?auto_420464 ?auto_420473 ) ) ( not ( = ?auto_420464 ?auto_420474 ) ) ( not ( = ?auto_420464 ?auto_420475 ) ) ( not ( = ?auto_420464 ?auto_420476 ) ) ( not ( = ?auto_420465 ?auto_420466 ) ) ( not ( = ?auto_420465 ?auto_420467 ) ) ( not ( = ?auto_420465 ?auto_420468 ) ) ( not ( = ?auto_420465 ?auto_420469 ) ) ( not ( = ?auto_420465 ?auto_420470 ) ) ( not ( = ?auto_420465 ?auto_420471 ) ) ( not ( = ?auto_420465 ?auto_420472 ) ) ( not ( = ?auto_420465 ?auto_420473 ) ) ( not ( = ?auto_420465 ?auto_420474 ) ) ( not ( = ?auto_420465 ?auto_420475 ) ) ( not ( = ?auto_420465 ?auto_420476 ) ) ( not ( = ?auto_420466 ?auto_420467 ) ) ( not ( = ?auto_420466 ?auto_420468 ) ) ( not ( = ?auto_420466 ?auto_420469 ) ) ( not ( = ?auto_420466 ?auto_420470 ) ) ( not ( = ?auto_420466 ?auto_420471 ) ) ( not ( = ?auto_420466 ?auto_420472 ) ) ( not ( = ?auto_420466 ?auto_420473 ) ) ( not ( = ?auto_420466 ?auto_420474 ) ) ( not ( = ?auto_420466 ?auto_420475 ) ) ( not ( = ?auto_420466 ?auto_420476 ) ) ( not ( = ?auto_420467 ?auto_420468 ) ) ( not ( = ?auto_420467 ?auto_420469 ) ) ( not ( = ?auto_420467 ?auto_420470 ) ) ( not ( = ?auto_420467 ?auto_420471 ) ) ( not ( = ?auto_420467 ?auto_420472 ) ) ( not ( = ?auto_420467 ?auto_420473 ) ) ( not ( = ?auto_420467 ?auto_420474 ) ) ( not ( = ?auto_420467 ?auto_420475 ) ) ( not ( = ?auto_420467 ?auto_420476 ) ) ( not ( = ?auto_420468 ?auto_420469 ) ) ( not ( = ?auto_420468 ?auto_420470 ) ) ( not ( = ?auto_420468 ?auto_420471 ) ) ( not ( = ?auto_420468 ?auto_420472 ) ) ( not ( = ?auto_420468 ?auto_420473 ) ) ( not ( = ?auto_420468 ?auto_420474 ) ) ( not ( = ?auto_420468 ?auto_420475 ) ) ( not ( = ?auto_420468 ?auto_420476 ) ) ( not ( = ?auto_420469 ?auto_420470 ) ) ( not ( = ?auto_420469 ?auto_420471 ) ) ( not ( = ?auto_420469 ?auto_420472 ) ) ( not ( = ?auto_420469 ?auto_420473 ) ) ( not ( = ?auto_420469 ?auto_420474 ) ) ( not ( = ?auto_420469 ?auto_420475 ) ) ( not ( = ?auto_420469 ?auto_420476 ) ) ( not ( = ?auto_420470 ?auto_420471 ) ) ( not ( = ?auto_420470 ?auto_420472 ) ) ( not ( = ?auto_420470 ?auto_420473 ) ) ( not ( = ?auto_420470 ?auto_420474 ) ) ( not ( = ?auto_420470 ?auto_420475 ) ) ( not ( = ?auto_420470 ?auto_420476 ) ) ( not ( = ?auto_420471 ?auto_420472 ) ) ( not ( = ?auto_420471 ?auto_420473 ) ) ( not ( = ?auto_420471 ?auto_420474 ) ) ( not ( = ?auto_420471 ?auto_420475 ) ) ( not ( = ?auto_420471 ?auto_420476 ) ) ( not ( = ?auto_420472 ?auto_420473 ) ) ( not ( = ?auto_420472 ?auto_420474 ) ) ( not ( = ?auto_420472 ?auto_420475 ) ) ( not ( = ?auto_420472 ?auto_420476 ) ) ( not ( = ?auto_420473 ?auto_420474 ) ) ( not ( = ?auto_420473 ?auto_420475 ) ) ( not ( = ?auto_420473 ?auto_420476 ) ) ( not ( = ?auto_420474 ?auto_420475 ) ) ( not ( = ?auto_420474 ?auto_420476 ) ) ( not ( = ?auto_420475 ?auto_420476 ) ) ( ON ?auto_420474 ?auto_420475 ) ( ON ?auto_420473 ?auto_420474 ) ( ON ?auto_420472 ?auto_420473 ) ( ON ?auto_420471 ?auto_420472 ) ( ON ?auto_420470 ?auto_420471 ) ( CLEAR ?auto_420468 ) ( ON ?auto_420469 ?auto_420470 ) ( CLEAR ?auto_420469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_420464 ?auto_420465 ?auto_420466 ?auto_420467 ?auto_420468 ?auto_420469 )
      ( MAKE-12PILE ?auto_420464 ?auto_420465 ?auto_420466 ?auto_420467 ?auto_420468 ?auto_420469 ?auto_420470 ?auto_420471 ?auto_420472 ?auto_420473 ?auto_420474 ?auto_420475 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420514 - BLOCK
      ?auto_420515 - BLOCK
      ?auto_420516 - BLOCK
      ?auto_420517 - BLOCK
      ?auto_420518 - BLOCK
      ?auto_420519 - BLOCK
      ?auto_420520 - BLOCK
      ?auto_420521 - BLOCK
      ?auto_420522 - BLOCK
      ?auto_420523 - BLOCK
      ?auto_420524 - BLOCK
      ?auto_420525 - BLOCK
    )
    :vars
    (
      ?auto_420526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420525 ?auto_420526 ) ( ON-TABLE ?auto_420514 ) ( ON ?auto_420515 ?auto_420514 ) ( ON ?auto_420516 ?auto_420515 ) ( ON ?auto_420517 ?auto_420516 ) ( not ( = ?auto_420514 ?auto_420515 ) ) ( not ( = ?auto_420514 ?auto_420516 ) ) ( not ( = ?auto_420514 ?auto_420517 ) ) ( not ( = ?auto_420514 ?auto_420518 ) ) ( not ( = ?auto_420514 ?auto_420519 ) ) ( not ( = ?auto_420514 ?auto_420520 ) ) ( not ( = ?auto_420514 ?auto_420521 ) ) ( not ( = ?auto_420514 ?auto_420522 ) ) ( not ( = ?auto_420514 ?auto_420523 ) ) ( not ( = ?auto_420514 ?auto_420524 ) ) ( not ( = ?auto_420514 ?auto_420525 ) ) ( not ( = ?auto_420514 ?auto_420526 ) ) ( not ( = ?auto_420515 ?auto_420516 ) ) ( not ( = ?auto_420515 ?auto_420517 ) ) ( not ( = ?auto_420515 ?auto_420518 ) ) ( not ( = ?auto_420515 ?auto_420519 ) ) ( not ( = ?auto_420515 ?auto_420520 ) ) ( not ( = ?auto_420515 ?auto_420521 ) ) ( not ( = ?auto_420515 ?auto_420522 ) ) ( not ( = ?auto_420515 ?auto_420523 ) ) ( not ( = ?auto_420515 ?auto_420524 ) ) ( not ( = ?auto_420515 ?auto_420525 ) ) ( not ( = ?auto_420515 ?auto_420526 ) ) ( not ( = ?auto_420516 ?auto_420517 ) ) ( not ( = ?auto_420516 ?auto_420518 ) ) ( not ( = ?auto_420516 ?auto_420519 ) ) ( not ( = ?auto_420516 ?auto_420520 ) ) ( not ( = ?auto_420516 ?auto_420521 ) ) ( not ( = ?auto_420516 ?auto_420522 ) ) ( not ( = ?auto_420516 ?auto_420523 ) ) ( not ( = ?auto_420516 ?auto_420524 ) ) ( not ( = ?auto_420516 ?auto_420525 ) ) ( not ( = ?auto_420516 ?auto_420526 ) ) ( not ( = ?auto_420517 ?auto_420518 ) ) ( not ( = ?auto_420517 ?auto_420519 ) ) ( not ( = ?auto_420517 ?auto_420520 ) ) ( not ( = ?auto_420517 ?auto_420521 ) ) ( not ( = ?auto_420517 ?auto_420522 ) ) ( not ( = ?auto_420517 ?auto_420523 ) ) ( not ( = ?auto_420517 ?auto_420524 ) ) ( not ( = ?auto_420517 ?auto_420525 ) ) ( not ( = ?auto_420517 ?auto_420526 ) ) ( not ( = ?auto_420518 ?auto_420519 ) ) ( not ( = ?auto_420518 ?auto_420520 ) ) ( not ( = ?auto_420518 ?auto_420521 ) ) ( not ( = ?auto_420518 ?auto_420522 ) ) ( not ( = ?auto_420518 ?auto_420523 ) ) ( not ( = ?auto_420518 ?auto_420524 ) ) ( not ( = ?auto_420518 ?auto_420525 ) ) ( not ( = ?auto_420518 ?auto_420526 ) ) ( not ( = ?auto_420519 ?auto_420520 ) ) ( not ( = ?auto_420519 ?auto_420521 ) ) ( not ( = ?auto_420519 ?auto_420522 ) ) ( not ( = ?auto_420519 ?auto_420523 ) ) ( not ( = ?auto_420519 ?auto_420524 ) ) ( not ( = ?auto_420519 ?auto_420525 ) ) ( not ( = ?auto_420519 ?auto_420526 ) ) ( not ( = ?auto_420520 ?auto_420521 ) ) ( not ( = ?auto_420520 ?auto_420522 ) ) ( not ( = ?auto_420520 ?auto_420523 ) ) ( not ( = ?auto_420520 ?auto_420524 ) ) ( not ( = ?auto_420520 ?auto_420525 ) ) ( not ( = ?auto_420520 ?auto_420526 ) ) ( not ( = ?auto_420521 ?auto_420522 ) ) ( not ( = ?auto_420521 ?auto_420523 ) ) ( not ( = ?auto_420521 ?auto_420524 ) ) ( not ( = ?auto_420521 ?auto_420525 ) ) ( not ( = ?auto_420521 ?auto_420526 ) ) ( not ( = ?auto_420522 ?auto_420523 ) ) ( not ( = ?auto_420522 ?auto_420524 ) ) ( not ( = ?auto_420522 ?auto_420525 ) ) ( not ( = ?auto_420522 ?auto_420526 ) ) ( not ( = ?auto_420523 ?auto_420524 ) ) ( not ( = ?auto_420523 ?auto_420525 ) ) ( not ( = ?auto_420523 ?auto_420526 ) ) ( not ( = ?auto_420524 ?auto_420525 ) ) ( not ( = ?auto_420524 ?auto_420526 ) ) ( not ( = ?auto_420525 ?auto_420526 ) ) ( ON ?auto_420524 ?auto_420525 ) ( ON ?auto_420523 ?auto_420524 ) ( ON ?auto_420522 ?auto_420523 ) ( ON ?auto_420521 ?auto_420522 ) ( ON ?auto_420520 ?auto_420521 ) ( ON ?auto_420519 ?auto_420520 ) ( CLEAR ?auto_420517 ) ( ON ?auto_420518 ?auto_420519 ) ( CLEAR ?auto_420518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_420514 ?auto_420515 ?auto_420516 ?auto_420517 ?auto_420518 )
      ( MAKE-12PILE ?auto_420514 ?auto_420515 ?auto_420516 ?auto_420517 ?auto_420518 ?auto_420519 ?auto_420520 ?auto_420521 ?auto_420522 ?auto_420523 ?auto_420524 ?auto_420525 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420564 - BLOCK
      ?auto_420565 - BLOCK
      ?auto_420566 - BLOCK
      ?auto_420567 - BLOCK
      ?auto_420568 - BLOCK
      ?auto_420569 - BLOCK
      ?auto_420570 - BLOCK
      ?auto_420571 - BLOCK
      ?auto_420572 - BLOCK
      ?auto_420573 - BLOCK
      ?auto_420574 - BLOCK
      ?auto_420575 - BLOCK
    )
    :vars
    (
      ?auto_420576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420575 ?auto_420576 ) ( ON-TABLE ?auto_420564 ) ( ON ?auto_420565 ?auto_420564 ) ( ON ?auto_420566 ?auto_420565 ) ( not ( = ?auto_420564 ?auto_420565 ) ) ( not ( = ?auto_420564 ?auto_420566 ) ) ( not ( = ?auto_420564 ?auto_420567 ) ) ( not ( = ?auto_420564 ?auto_420568 ) ) ( not ( = ?auto_420564 ?auto_420569 ) ) ( not ( = ?auto_420564 ?auto_420570 ) ) ( not ( = ?auto_420564 ?auto_420571 ) ) ( not ( = ?auto_420564 ?auto_420572 ) ) ( not ( = ?auto_420564 ?auto_420573 ) ) ( not ( = ?auto_420564 ?auto_420574 ) ) ( not ( = ?auto_420564 ?auto_420575 ) ) ( not ( = ?auto_420564 ?auto_420576 ) ) ( not ( = ?auto_420565 ?auto_420566 ) ) ( not ( = ?auto_420565 ?auto_420567 ) ) ( not ( = ?auto_420565 ?auto_420568 ) ) ( not ( = ?auto_420565 ?auto_420569 ) ) ( not ( = ?auto_420565 ?auto_420570 ) ) ( not ( = ?auto_420565 ?auto_420571 ) ) ( not ( = ?auto_420565 ?auto_420572 ) ) ( not ( = ?auto_420565 ?auto_420573 ) ) ( not ( = ?auto_420565 ?auto_420574 ) ) ( not ( = ?auto_420565 ?auto_420575 ) ) ( not ( = ?auto_420565 ?auto_420576 ) ) ( not ( = ?auto_420566 ?auto_420567 ) ) ( not ( = ?auto_420566 ?auto_420568 ) ) ( not ( = ?auto_420566 ?auto_420569 ) ) ( not ( = ?auto_420566 ?auto_420570 ) ) ( not ( = ?auto_420566 ?auto_420571 ) ) ( not ( = ?auto_420566 ?auto_420572 ) ) ( not ( = ?auto_420566 ?auto_420573 ) ) ( not ( = ?auto_420566 ?auto_420574 ) ) ( not ( = ?auto_420566 ?auto_420575 ) ) ( not ( = ?auto_420566 ?auto_420576 ) ) ( not ( = ?auto_420567 ?auto_420568 ) ) ( not ( = ?auto_420567 ?auto_420569 ) ) ( not ( = ?auto_420567 ?auto_420570 ) ) ( not ( = ?auto_420567 ?auto_420571 ) ) ( not ( = ?auto_420567 ?auto_420572 ) ) ( not ( = ?auto_420567 ?auto_420573 ) ) ( not ( = ?auto_420567 ?auto_420574 ) ) ( not ( = ?auto_420567 ?auto_420575 ) ) ( not ( = ?auto_420567 ?auto_420576 ) ) ( not ( = ?auto_420568 ?auto_420569 ) ) ( not ( = ?auto_420568 ?auto_420570 ) ) ( not ( = ?auto_420568 ?auto_420571 ) ) ( not ( = ?auto_420568 ?auto_420572 ) ) ( not ( = ?auto_420568 ?auto_420573 ) ) ( not ( = ?auto_420568 ?auto_420574 ) ) ( not ( = ?auto_420568 ?auto_420575 ) ) ( not ( = ?auto_420568 ?auto_420576 ) ) ( not ( = ?auto_420569 ?auto_420570 ) ) ( not ( = ?auto_420569 ?auto_420571 ) ) ( not ( = ?auto_420569 ?auto_420572 ) ) ( not ( = ?auto_420569 ?auto_420573 ) ) ( not ( = ?auto_420569 ?auto_420574 ) ) ( not ( = ?auto_420569 ?auto_420575 ) ) ( not ( = ?auto_420569 ?auto_420576 ) ) ( not ( = ?auto_420570 ?auto_420571 ) ) ( not ( = ?auto_420570 ?auto_420572 ) ) ( not ( = ?auto_420570 ?auto_420573 ) ) ( not ( = ?auto_420570 ?auto_420574 ) ) ( not ( = ?auto_420570 ?auto_420575 ) ) ( not ( = ?auto_420570 ?auto_420576 ) ) ( not ( = ?auto_420571 ?auto_420572 ) ) ( not ( = ?auto_420571 ?auto_420573 ) ) ( not ( = ?auto_420571 ?auto_420574 ) ) ( not ( = ?auto_420571 ?auto_420575 ) ) ( not ( = ?auto_420571 ?auto_420576 ) ) ( not ( = ?auto_420572 ?auto_420573 ) ) ( not ( = ?auto_420572 ?auto_420574 ) ) ( not ( = ?auto_420572 ?auto_420575 ) ) ( not ( = ?auto_420572 ?auto_420576 ) ) ( not ( = ?auto_420573 ?auto_420574 ) ) ( not ( = ?auto_420573 ?auto_420575 ) ) ( not ( = ?auto_420573 ?auto_420576 ) ) ( not ( = ?auto_420574 ?auto_420575 ) ) ( not ( = ?auto_420574 ?auto_420576 ) ) ( not ( = ?auto_420575 ?auto_420576 ) ) ( ON ?auto_420574 ?auto_420575 ) ( ON ?auto_420573 ?auto_420574 ) ( ON ?auto_420572 ?auto_420573 ) ( ON ?auto_420571 ?auto_420572 ) ( ON ?auto_420570 ?auto_420571 ) ( ON ?auto_420569 ?auto_420570 ) ( ON ?auto_420568 ?auto_420569 ) ( CLEAR ?auto_420566 ) ( ON ?auto_420567 ?auto_420568 ) ( CLEAR ?auto_420567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_420564 ?auto_420565 ?auto_420566 ?auto_420567 )
      ( MAKE-12PILE ?auto_420564 ?auto_420565 ?auto_420566 ?auto_420567 ?auto_420568 ?auto_420569 ?auto_420570 ?auto_420571 ?auto_420572 ?auto_420573 ?auto_420574 ?auto_420575 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420614 - BLOCK
      ?auto_420615 - BLOCK
      ?auto_420616 - BLOCK
      ?auto_420617 - BLOCK
      ?auto_420618 - BLOCK
      ?auto_420619 - BLOCK
      ?auto_420620 - BLOCK
      ?auto_420621 - BLOCK
      ?auto_420622 - BLOCK
      ?auto_420623 - BLOCK
      ?auto_420624 - BLOCK
      ?auto_420625 - BLOCK
    )
    :vars
    (
      ?auto_420626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420625 ?auto_420626 ) ( ON-TABLE ?auto_420614 ) ( ON ?auto_420615 ?auto_420614 ) ( not ( = ?auto_420614 ?auto_420615 ) ) ( not ( = ?auto_420614 ?auto_420616 ) ) ( not ( = ?auto_420614 ?auto_420617 ) ) ( not ( = ?auto_420614 ?auto_420618 ) ) ( not ( = ?auto_420614 ?auto_420619 ) ) ( not ( = ?auto_420614 ?auto_420620 ) ) ( not ( = ?auto_420614 ?auto_420621 ) ) ( not ( = ?auto_420614 ?auto_420622 ) ) ( not ( = ?auto_420614 ?auto_420623 ) ) ( not ( = ?auto_420614 ?auto_420624 ) ) ( not ( = ?auto_420614 ?auto_420625 ) ) ( not ( = ?auto_420614 ?auto_420626 ) ) ( not ( = ?auto_420615 ?auto_420616 ) ) ( not ( = ?auto_420615 ?auto_420617 ) ) ( not ( = ?auto_420615 ?auto_420618 ) ) ( not ( = ?auto_420615 ?auto_420619 ) ) ( not ( = ?auto_420615 ?auto_420620 ) ) ( not ( = ?auto_420615 ?auto_420621 ) ) ( not ( = ?auto_420615 ?auto_420622 ) ) ( not ( = ?auto_420615 ?auto_420623 ) ) ( not ( = ?auto_420615 ?auto_420624 ) ) ( not ( = ?auto_420615 ?auto_420625 ) ) ( not ( = ?auto_420615 ?auto_420626 ) ) ( not ( = ?auto_420616 ?auto_420617 ) ) ( not ( = ?auto_420616 ?auto_420618 ) ) ( not ( = ?auto_420616 ?auto_420619 ) ) ( not ( = ?auto_420616 ?auto_420620 ) ) ( not ( = ?auto_420616 ?auto_420621 ) ) ( not ( = ?auto_420616 ?auto_420622 ) ) ( not ( = ?auto_420616 ?auto_420623 ) ) ( not ( = ?auto_420616 ?auto_420624 ) ) ( not ( = ?auto_420616 ?auto_420625 ) ) ( not ( = ?auto_420616 ?auto_420626 ) ) ( not ( = ?auto_420617 ?auto_420618 ) ) ( not ( = ?auto_420617 ?auto_420619 ) ) ( not ( = ?auto_420617 ?auto_420620 ) ) ( not ( = ?auto_420617 ?auto_420621 ) ) ( not ( = ?auto_420617 ?auto_420622 ) ) ( not ( = ?auto_420617 ?auto_420623 ) ) ( not ( = ?auto_420617 ?auto_420624 ) ) ( not ( = ?auto_420617 ?auto_420625 ) ) ( not ( = ?auto_420617 ?auto_420626 ) ) ( not ( = ?auto_420618 ?auto_420619 ) ) ( not ( = ?auto_420618 ?auto_420620 ) ) ( not ( = ?auto_420618 ?auto_420621 ) ) ( not ( = ?auto_420618 ?auto_420622 ) ) ( not ( = ?auto_420618 ?auto_420623 ) ) ( not ( = ?auto_420618 ?auto_420624 ) ) ( not ( = ?auto_420618 ?auto_420625 ) ) ( not ( = ?auto_420618 ?auto_420626 ) ) ( not ( = ?auto_420619 ?auto_420620 ) ) ( not ( = ?auto_420619 ?auto_420621 ) ) ( not ( = ?auto_420619 ?auto_420622 ) ) ( not ( = ?auto_420619 ?auto_420623 ) ) ( not ( = ?auto_420619 ?auto_420624 ) ) ( not ( = ?auto_420619 ?auto_420625 ) ) ( not ( = ?auto_420619 ?auto_420626 ) ) ( not ( = ?auto_420620 ?auto_420621 ) ) ( not ( = ?auto_420620 ?auto_420622 ) ) ( not ( = ?auto_420620 ?auto_420623 ) ) ( not ( = ?auto_420620 ?auto_420624 ) ) ( not ( = ?auto_420620 ?auto_420625 ) ) ( not ( = ?auto_420620 ?auto_420626 ) ) ( not ( = ?auto_420621 ?auto_420622 ) ) ( not ( = ?auto_420621 ?auto_420623 ) ) ( not ( = ?auto_420621 ?auto_420624 ) ) ( not ( = ?auto_420621 ?auto_420625 ) ) ( not ( = ?auto_420621 ?auto_420626 ) ) ( not ( = ?auto_420622 ?auto_420623 ) ) ( not ( = ?auto_420622 ?auto_420624 ) ) ( not ( = ?auto_420622 ?auto_420625 ) ) ( not ( = ?auto_420622 ?auto_420626 ) ) ( not ( = ?auto_420623 ?auto_420624 ) ) ( not ( = ?auto_420623 ?auto_420625 ) ) ( not ( = ?auto_420623 ?auto_420626 ) ) ( not ( = ?auto_420624 ?auto_420625 ) ) ( not ( = ?auto_420624 ?auto_420626 ) ) ( not ( = ?auto_420625 ?auto_420626 ) ) ( ON ?auto_420624 ?auto_420625 ) ( ON ?auto_420623 ?auto_420624 ) ( ON ?auto_420622 ?auto_420623 ) ( ON ?auto_420621 ?auto_420622 ) ( ON ?auto_420620 ?auto_420621 ) ( ON ?auto_420619 ?auto_420620 ) ( ON ?auto_420618 ?auto_420619 ) ( ON ?auto_420617 ?auto_420618 ) ( CLEAR ?auto_420615 ) ( ON ?auto_420616 ?auto_420617 ) ( CLEAR ?auto_420616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_420614 ?auto_420615 ?auto_420616 )
      ( MAKE-12PILE ?auto_420614 ?auto_420615 ?auto_420616 ?auto_420617 ?auto_420618 ?auto_420619 ?auto_420620 ?auto_420621 ?auto_420622 ?auto_420623 ?auto_420624 ?auto_420625 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420664 - BLOCK
      ?auto_420665 - BLOCK
      ?auto_420666 - BLOCK
      ?auto_420667 - BLOCK
      ?auto_420668 - BLOCK
      ?auto_420669 - BLOCK
      ?auto_420670 - BLOCK
      ?auto_420671 - BLOCK
      ?auto_420672 - BLOCK
      ?auto_420673 - BLOCK
      ?auto_420674 - BLOCK
      ?auto_420675 - BLOCK
    )
    :vars
    (
      ?auto_420676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420675 ?auto_420676 ) ( ON-TABLE ?auto_420664 ) ( not ( = ?auto_420664 ?auto_420665 ) ) ( not ( = ?auto_420664 ?auto_420666 ) ) ( not ( = ?auto_420664 ?auto_420667 ) ) ( not ( = ?auto_420664 ?auto_420668 ) ) ( not ( = ?auto_420664 ?auto_420669 ) ) ( not ( = ?auto_420664 ?auto_420670 ) ) ( not ( = ?auto_420664 ?auto_420671 ) ) ( not ( = ?auto_420664 ?auto_420672 ) ) ( not ( = ?auto_420664 ?auto_420673 ) ) ( not ( = ?auto_420664 ?auto_420674 ) ) ( not ( = ?auto_420664 ?auto_420675 ) ) ( not ( = ?auto_420664 ?auto_420676 ) ) ( not ( = ?auto_420665 ?auto_420666 ) ) ( not ( = ?auto_420665 ?auto_420667 ) ) ( not ( = ?auto_420665 ?auto_420668 ) ) ( not ( = ?auto_420665 ?auto_420669 ) ) ( not ( = ?auto_420665 ?auto_420670 ) ) ( not ( = ?auto_420665 ?auto_420671 ) ) ( not ( = ?auto_420665 ?auto_420672 ) ) ( not ( = ?auto_420665 ?auto_420673 ) ) ( not ( = ?auto_420665 ?auto_420674 ) ) ( not ( = ?auto_420665 ?auto_420675 ) ) ( not ( = ?auto_420665 ?auto_420676 ) ) ( not ( = ?auto_420666 ?auto_420667 ) ) ( not ( = ?auto_420666 ?auto_420668 ) ) ( not ( = ?auto_420666 ?auto_420669 ) ) ( not ( = ?auto_420666 ?auto_420670 ) ) ( not ( = ?auto_420666 ?auto_420671 ) ) ( not ( = ?auto_420666 ?auto_420672 ) ) ( not ( = ?auto_420666 ?auto_420673 ) ) ( not ( = ?auto_420666 ?auto_420674 ) ) ( not ( = ?auto_420666 ?auto_420675 ) ) ( not ( = ?auto_420666 ?auto_420676 ) ) ( not ( = ?auto_420667 ?auto_420668 ) ) ( not ( = ?auto_420667 ?auto_420669 ) ) ( not ( = ?auto_420667 ?auto_420670 ) ) ( not ( = ?auto_420667 ?auto_420671 ) ) ( not ( = ?auto_420667 ?auto_420672 ) ) ( not ( = ?auto_420667 ?auto_420673 ) ) ( not ( = ?auto_420667 ?auto_420674 ) ) ( not ( = ?auto_420667 ?auto_420675 ) ) ( not ( = ?auto_420667 ?auto_420676 ) ) ( not ( = ?auto_420668 ?auto_420669 ) ) ( not ( = ?auto_420668 ?auto_420670 ) ) ( not ( = ?auto_420668 ?auto_420671 ) ) ( not ( = ?auto_420668 ?auto_420672 ) ) ( not ( = ?auto_420668 ?auto_420673 ) ) ( not ( = ?auto_420668 ?auto_420674 ) ) ( not ( = ?auto_420668 ?auto_420675 ) ) ( not ( = ?auto_420668 ?auto_420676 ) ) ( not ( = ?auto_420669 ?auto_420670 ) ) ( not ( = ?auto_420669 ?auto_420671 ) ) ( not ( = ?auto_420669 ?auto_420672 ) ) ( not ( = ?auto_420669 ?auto_420673 ) ) ( not ( = ?auto_420669 ?auto_420674 ) ) ( not ( = ?auto_420669 ?auto_420675 ) ) ( not ( = ?auto_420669 ?auto_420676 ) ) ( not ( = ?auto_420670 ?auto_420671 ) ) ( not ( = ?auto_420670 ?auto_420672 ) ) ( not ( = ?auto_420670 ?auto_420673 ) ) ( not ( = ?auto_420670 ?auto_420674 ) ) ( not ( = ?auto_420670 ?auto_420675 ) ) ( not ( = ?auto_420670 ?auto_420676 ) ) ( not ( = ?auto_420671 ?auto_420672 ) ) ( not ( = ?auto_420671 ?auto_420673 ) ) ( not ( = ?auto_420671 ?auto_420674 ) ) ( not ( = ?auto_420671 ?auto_420675 ) ) ( not ( = ?auto_420671 ?auto_420676 ) ) ( not ( = ?auto_420672 ?auto_420673 ) ) ( not ( = ?auto_420672 ?auto_420674 ) ) ( not ( = ?auto_420672 ?auto_420675 ) ) ( not ( = ?auto_420672 ?auto_420676 ) ) ( not ( = ?auto_420673 ?auto_420674 ) ) ( not ( = ?auto_420673 ?auto_420675 ) ) ( not ( = ?auto_420673 ?auto_420676 ) ) ( not ( = ?auto_420674 ?auto_420675 ) ) ( not ( = ?auto_420674 ?auto_420676 ) ) ( not ( = ?auto_420675 ?auto_420676 ) ) ( ON ?auto_420674 ?auto_420675 ) ( ON ?auto_420673 ?auto_420674 ) ( ON ?auto_420672 ?auto_420673 ) ( ON ?auto_420671 ?auto_420672 ) ( ON ?auto_420670 ?auto_420671 ) ( ON ?auto_420669 ?auto_420670 ) ( ON ?auto_420668 ?auto_420669 ) ( ON ?auto_420667 ?auto_420668 ) ( ON ?auto_420666 ?auto_420667 ) ( CLEAR ?auto_420664 ) ( ON ?auto_420665 ?auto_420666 ) ( CLEAR ?auto_420665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_420664 ?auto_420665 )
      ( MAKE-12PILE ?auto_420664 ?auto_420665 ?auto_420666 ?auto_420667 ?auto_420668 ?auto_420669 ?auto_420670 ?auto_420671 ?auto_420672 ?auto_420673 ?auto_420674 ?auto_420675 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_420714 - BLOCK
      ?auto_420715 - BLOCK
      ?auto_420716 - BLOCK
      ?auto_420717 - BLOCK
      ?auto_420718 - BLOCK
      ?auto_420719 - BLOCK
      ?auto_420720 - BLOCK
      ?auto_420721 - BLOCK
      ?auto_420722 - BLOCK
      ?auto_420723 - BLOCK
      ?auto_420724 - BLOCK
      ?auto_420725 - BLOCK
    )
    :vars
    (
      ?auto_420726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420725 ?auto_420726 ) ( not ( = ?auto_420714 ?auto_420715 ) ) ( not ( = ?auto_420714 ?auto_420716 ) ) ( not ( = ?auto_420714 ?auto_420717 ) ) ( not ( = ?auto_420714 ?auto_420718 ) ) ( not ( = ?auto_420714 ?auto_420719 ) ) ( not ( = ?auto_420714 ?auto_420720 ) ) ( not ( = ?auto_420714 ?auto_420721 ) ) ( not ( = ?auto_420714 ?auto_420722 ) ) ( not ( = ?auto_420714 ?auto_420723 ) ) ( not ( = ?auto_420714 ?auto_420724 ) ) ( not ( = ?auto_420714 ?auto_420725 ) ) ( not ( = ?auto_420714 ?auto_420726 ) ) ( not ( = ?auto_420715 ?auto_420716 ) ) ( not ( = ?auto_420715 ?auto_420717 ) ) ( not ( = ?auto_420715 ?auto_420718 ) ) ( not ( = ?auto_420715 ?auto_420719 ) ) ( not ( = ?auto_420715 ?auto_420720 ) ) ( not ( = ?auto_420715 ?auto_420721 ) ) ( not ( = ?auto_420715 ?auto_420722 ) ) ( not ( = ?auto_420715 ?auto_420723 ) ) ( not ( = ?auto_420715 ?auto_420724 ) ) ( not ( = ?auto_420715 ?auto_420725 ) ) ( not ( = ?auto_420715 ?auto_420726 ) ) ( not ( = ?auto_420716 ?auto_420717 ) ) ( not ( = ?auto_420716 ?auto_420718 ) ) ( not ( = ?auto_420716 ?auto_420719 ) ) ( not ( = ?auto_420716 ?auto_420720 ) ) ( not ( = ?auto_420716 ?auto_420721 ) ) ( not ( = ?auto_420716 ?auto_420722 ) ) ( not ( = ?auto_420716 ?auto_420723 ) ) ( not ( = ?auto_420716 ?auto_420724 ) ) ( not ( = ?auto_420716 ?auto_420725 ) ) ( not ( = ?auto_420716 ?auto_420726 ) ) ( not ( = ?auto_420717 ?auto_420718 ) ) ( not ( = ?auto_420717 ?auto_420719 ) ) ( not ( = ?auto_420717 ?auto_420720 ) ) ( not ( = ?auto_420717 ?auto_420721 ) ) ( not ( = ?auto_420717 ?auto_420722 ) ) ( not ( = ?auto_420717 ?auto_420723 ) ) ( not ( = ?auto_420717 ?auto_420724 ) ) ( not ( = ?auto_420717 ?auto_420725 ) ) ( not ( = ?auto_420717 ?auto_420726 ) ) ( not ( = ?auto_420718 ?auto_420719 ) ) ( not ( = ?auto_420718 ?auto_420720 ) ) ( not ( = ?auto_420718 ?auto_420721 ) ) ( not ( = ?auto_420718 ?auto_420722 ) ) ( not ( = ?auto_420718 ?auto_420723 ) ) ( not ( = ?auto_420718 ?auto_420724 ) ) ( not ( = ?auto_420718 ?auto_420725 ) ) ( not ( = ?auto_420718 ?auto_420726 ) ) ( not ( = ?auto_420719 ?auto_420720 ) ) ( not ( = ?auto_420719 ?auto_420721 ) ) ( not ( = ?auto_420719 ?auto_420722 ) ) ( not ( = ?auto_420719 ?auto_420723 ) ) ( not ( = ?auto_420719 ?auto_420724 ) ) ( not ( = ?auto_420719 ?auto_420725 ) ) ( not ( = ?auto_420719 ?auto_420726 ) ) ( not ( = ?auto_420720 ?auto_420721 ) ) ( not ( = ?auto_420720 ?auto_420722 ) ) ( not ( = ?auto_420720 ?auto_420723 ) ) ( not ( = ?auto_420720 ?auto_420724 ) ) ( not ( = ?auto_420720 ?auto_420725 ) ) ( not ( = ?auto_420720 ?auto_420726 ) ) ( not ( = ?auto_420721 ?auto_420722 ) ) ( not ( = ?auto_420721 ?auto_420723 ) ) ( not ( = ?auto_420721 ?auto_420724 ) ) ( not ( = ?auto_420721 ?auto_420725 ) ) ( not ( = ?auto_420721 ?auto_420726 ) ) ( not ( = ?auto_420722 ?auto_420723 ) ) ( not ( = ?auto_420722 ?auto_420724 ) ) ( not ( = ?auto_420722 ?auto_420725 ) ) ( not ( = ?auto_420722 ?auto_420726 ) ) ( not ( = ?auto_420723 ?auto_420724 ) ) ( not ( = ?auto_420723 ?auto_420725 ) ) ( not ( = ?auto_420723 ?auto_420726 ) ) ( not ( = ?auto_420724 ?auto_420725 ) ) ( not ( = ?auto_420724 ?auto_420726 ) ) ( not ( = ?auto_420725 ?auto_420726 ) ) ( ON ?auto_420724 ?auto_420725 ) ( ON ?auto_420723 ?auto_420724 ) ( ON ?auto_420722 ?auto_420723 ) ( ON ?auto_420721 ?auto_420722 ) ( ON ?auto_420720 ?auto_420721 ) ( ON ?auto_420719 ?auto_420720 ) ( ON ?auto_420718 ?auto_420719 ) ( ON ?auto_420717 ?auto_420718 ) ( ON ?auto_420716 ?auto_420717 ) ( ON ?auto_420715 ?auto_420716 ) ( ON ?auto_420714 ?auto_420715 ) ( CLEAR ?auto_420714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_420714 )
      ( MAKE-12PILE ?auto_420714 ?auto_420715 ?auto_420716 ?auto_420717 ?auto_420718 ?auto_420719 ?auto_420720 ?auto_420721 ?auto_420722 ?auto_420723 ?auto_420724 ?auto_420725 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_420765 - BLOCK
      ?auto_420766 - BLOCK
      ?auto_420767 - BLOCK
      ?auto_420768 - BLOCK
      ?auto_420769 - BLOCK
      ?auto_420770 - BLOCK
      ?auto_420771 - BLOCK
      ?auto_420772 - BLOCK
      ?auto_420773 - BLOCK
      ?auto_420774 - BLOCK
      ?auto_420775 - BLOCK
      ?auto_420776 - BLOCK
      ?auto_420777 - BLOCK
    )
    :vars
    (
      ?auto_420778 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_420776 ) ( ON ?auto_420777 ?auto_420778 ) ( CLEAR ?auto_420777 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_420765 ) ( ON ?auto_420766 ?auto_420765 ) ( ON ?auto_420767 ?auto_420766 ) ( ON ?auto_420768 ?auto_420767 ) ( ON ?auto_420769 ?auto_420768 ) ( ON ?auto_420770 ?auto_420769 ) ( ON ?auto_420771 ?auto_420770 ) ( ON ?auto_420772 ?auto_420771 ) ( ON ?auto_420773 ?auto_420772 ) ( ON ?auto_420774 ?auto_420773 ) ( ON ?auto_420775 ?auto_420774 ) ( ON ?auto_420776 ?auto_420775 ) ( not ( = ?auto_420765 ?auto_420766 ) ) ( not ( = ?auto_420765 ?auto_420767 ) ) ( not ( = ?auto_420765 ?auto_420768 ) ) ( not ( = ?auto_420765 ?auto_420769 ) ) ( not ( = ?auto_420765 ?auto_420770 ) ) ( not ( = ?auto_420765 ?auto_420771 ) ) ( not ( = ?auto_420765 ?auto_420772 ) ) ( not ( = ?auto_420765 ?auto_420773 ) ) ( not ( = ?auto_420765 ?auto_420774 ) ) ( not ( = ?auto_420765 ?auto_420775 ) ) ( not ( = ?auto_420765 ?auto_420776 ) ) ( not ( = ?auto_420765 ?auto_420777 ) ) ( not ( = ?auto_420765 ?auto_420778 ) ) ( not ( = ?auto_420766 ?auto_420767 ) ) ( not ( = ?auto_420766 ?auto_420768 ) ) ( not ( = ?auto_420766 ?auto_420769 ) ) ( not ( = ?auto_420766 ?auto_420770 ) ) ( not ( = ?auto_420766 ?auto_420771 ) ) ( not ( = ?auto_420766 ?auto_420772 ) ) ( not ( = ?auto_420766 ?auto_420773 ) ) ( not ( = ?auto_420766 ?auto_420774 ) ) ( not ( = ?auto_420766 ?auto_420775 ) ) ( not ( = ?auto_420766 ?auto_420776 ) ) ( not ( = ?auto_420766 ?auto_420777 ) ) ( not ( = ?auto_420766 ?auto_420778 ) ) ( not ( = ?auto_420767 ?auto_420768 ) ) ( not ( = ?auto_420767 ?auto_420769 ) ) ( not ( = ?auto_420767 ?auto_420770 ) ) ( not ( = ?auto_420767 ?auto_420771 ) ) ( not ( = ?auto_420767 ?auto_420772 ) ) ( not ( = ?auto_420767 ?auto_420773 ) ) ( not ( = ?auto_420767 ?auto_420774 ) ) ( not ( = ?auto_420767 ?auto_420775 ) ) ( not ( = ?auto_420767 ?auto_420776 ) ) ( not ( = ?auto_420767 ?auto_420777 ) ) ( not ( = ?auto_420767 ?auto_420778 ) ) ( not ( = ?auto_420768 ?auto_420769 ) ) ( not ( = ?auto_420768 ?auto_420770 ) ) ( not ( = ?auto_420768 ?auto_420771 ) ) ( not ( = ?auto_420768 ?auto_420772 ) ) ( not ( = ?auto_420768 ?auto_420773 ) ) ( not ( = ?auto_420768 ?auto_420774 ) ) ( not ( = ?auto_420768 ?auto_420775 ) ) ( not ( = ?auto_420768 ?auto_420776 ) ) ( not ( = ?auto_420768 ?auto_420777 ) ) ( not ( = ?auto_420768 ?auto_420778 ) ) ( not ( = ?auto_420769 ?auto_420770 ) ) ( not ( = ?auto_420769 ?auto_420771 ) ) ( not ( = ?auto_420769 ?auto_420772 ) ) ( not ( = ?auto_420769 ?auto_420773 ) ) ( not ( = ?auto_420769 ?auto_420774 ) ) ( not ( = ?auto_420769 ?auto_420775 ) ) ( not ( = ?auto_420769 ?auto_420776 ) ) ( not ( = ?auto_420769 ?auto_420777 ) ) ( not ( = ?auto_420769 ?auto_420778 ) ) ( not ( = ?auto_420770 ?auto_420771 ) ) ( not ( = ?auto_420770 ?auto_420772 ) ) ( not ( = ?auto_420770 ?auto_420773 ) ) ( not ( = ?auto_420770 ?auto_420774 ) ) ( not ( = ?auto_420770 ?auto_420775 ) ) ( not ( = ?auto_420770 ?auto_420776 ) ) ( not ( = ?auto_420770 ?auto_420777 ) ) ( not ( = ?auto_420770 ?auto_420778 ) ) ( not ( = ?auto_420771 ?auto_420772 ) ) ( not ( = ?auto_420771 ?auto_420773 ) ) ( not ( = ?auto_420771 ?auto_420774 ) ) ( not ( = ?auto_420771 ?auto_420775 ) ) ( not ( = ?auto_420771 ?auto_420776 ) ) ( not ( = ?auto_420771 ?auto_420777 ) ) ( not ( = ?auto_420771 ?auto_420778 ) ) ( not ( = ?auto_420772 ?auto_420773 ) ) ( not ( = ?auto_420772 ?auto_420774 ) ) ( not ( = ?auto_420772 ?auto_420775 ) ) ( not ( = ?auto_420772 ?auto_420776 ) ) ( not ( = ?auto_420772 ?auto_420777 ) ) ( not ( = ?auto_420772 ?auto_420778 ) ) ( not ( = ?auto_420773 ?auto_420774 ) ) ( not ( = ?auto_420773 ?auto_420775 ) ) ( not ( = ?auto_420773 ?auto_420776 ) ) ( not ( = ?auto_420773 ?auto_420777 ) ) ( not ( = ?auto_420773 ?auto_420778 ) ) ( not ( = ?auto_420774 ?auto_420775 ) ) ( not ( = ?auto_420774 ?auto_420776 ) ) ( not ( = ?auto_420774 ?auto_420777 ) ) ( not ( = ?auto_420774 ?auto_420778 ) ) ( not ( = ?auto_420775 ?auto_420776 ) ) ( not ( = ?auto_420775 ?auto_420777 ) ) ( not ( = ?auto_420775 ?auto_420778 ) ) ( not ( = ?auto_420776 ?auto_420777 ) ) ( not ( = ?auto_420776 ?auto_420778 ) ) ( not ( = ?auto_420777 ?auto_420778 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_420777 ?auto_420778 )
      ( !STACK ?auto_420777 ?auto_420776 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_420819 - BLOCK
      ?auto_420820 - BLOCK
      ?auto_420821 - BLOCK
      ?auto_420822 - BLOCK
      ?auto_420823 - BLOCK
      ?auto_420824 - BLOCK
      ?auto_420825 - BLOCK
      ?auto_420826 - BLOCK
      ?auto_420827 - BLOCK
      ?auto_420828 - BLOCK
      ?auto_420829 - BLOCK
      ?auto_420830 - BLOCK
      ?auto_420831 - BLOCK
    )
    :vars
    (
      ?auto_420832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420831 ?auto_420832 ) ( ON-TABLE ?auto_420819 ) ( ON ?auto_420820 ?auto_420819 ) ( ON ?auto_420821 ?auto_420820 ) ( ON ?auto_420822 ?auto_420821 ) ( ON ?auto_420823 ?auto_420822 ) ( ON ?auto_420824 ?auto_420823 ) ( ON ?auto_420825 ?auto_420824 ) ( ON ?auto_420826 ?auto_420825 ) ( ON ?auto_420827 ?auto_420826 ) ( ON ?auto_420828 ?auto_420827 ) ( ON ?auto_420829 ?auto_420828 ) ( not ( = ?auto_420819 ?auto_420820 ) ) ( not ( = ?auto_420819 ?auto_420821 ) ) ( not ( = ?auto_420819 ?auto_420822 ) ) ( not ( = ?auto_420819 ?auto_420823 ) ) ( not ( = ?auto_420819 ?auto_420824 ) ) ( not ( = ?auto_420819 ?auto_420825 ) ) ( not ( = ?auto_420819 ?auto_420826 ) ) ( not ( = ?auto_420819 ?auto_420827 ) ) ( not ( = ?auto_420819 ?auto_420828 ) ) ( not ( = ?auto_420819 ?auto_420829 ) ) ( not ( = ?auto_420819 ?auto_420830 ) ) ( not ( = ?auto_420819 ?auto_420831 ) ) ( not ( = ?auto_420819 ?auto_420832 ) ) ( not ( = ?auto_420820 ?auto_420821 ) ) ( not ( = ?auto_420820 ?auto_420822 ) ) ( not ( = ?auto_420820 ?auto_420823 ) ) ( not ( = ?auto_420820 ?auto_420824 ) ) ( not ( = ?auto_420820 ?auto_420825 ) ) ( not ( = ?auto_420820 ?auto_420826 ) ) ( not ( = ?auto_420820 ?auto_420827 ) ) ( not ( = ?auto_420820 ?auto_420828 ) ) ( not ( = ?auto_420820 ?auto_420829 ) ) ( not ( = ?auto_420820 ?auto_420830 ) ) ( not ( = ?auto_420820 ?auto_420831 ) ) ( not ( = ?auto_420820 ?auto_420832 ) ) ( not ( = ?auto_420821 ?auto_420822 ) ) ( not ( = ?auto_420821 ?auto_420823 ) ) ( not ( = ?auto_420821 ?auto_420824 ) ) ( not ( = ?auto_420821 ?auto_420825 ) ) ( not ( = ?auto_420821 ?auto_420826 ) ) ( not ( = ?auto_420821 ?auto_420827 ) ) ( not ( = ?auto_420821 ?auto_420828 ) ) ( not ( = ?auto_420821 ?auto_420829 ) ) ( not ( = ?auto_420821 ?auto_420830 ) ) ( not ( = ?auto_420821 ?auto_420831 ) ) ( not ( = ?auto_420821 ?auto_420832 ) ) ( not ( = ?auto_420822 ?auto_420823 ) ) ( not ( = ?auto_420822 ?auto_420824 ) ) ( not ( = ?auto_420822 ?auto_420825 ) ) ( not ( = ?auto_420822 ?auto_420826 ) ) ( not ( = ?auto_420822 ?auto_420827 ) ) ( not ( = ?auto_420822 ?auto_420828 ) ) ( not ( = ?auto_420822 ?auto_420829 ) ) ( not ( = ?auto_420822 ?auto_420830 ) ) ( not ( = ?auto_420822 ?auto_420831 ) ) ( not ( = ?auto_420822 ?auto_420832 ) ) ( not ( = ?auto_420823 ?auto_420824 ) ) ( not ( = ?auto_420823 ?auto_420825 ) ) ( not ( = ?auto_420823 ?auto_420826 ) ) ( not ( = ?auto_420823 ?auto_420827 ) ) ( not ( = ?auto_420823 ?auto_420828 ) ) ( not ( = ?auto_420823 ?auto_420829 ) ) ( not ( = ?auto_420823 ?auto_420830 ) ) ( not ( = ?auto_420823 ?auto_420831 ) ) ( not ( = ?auto_420823 ?auto_420832 ) ) ( not ( = ?auto_420824 ?auto_420825 ) ) ( not ( = ?auto_420824 ?auto_420826 ) ) ( not ( = ?auto_420824 ?auto_420827 ) ) ( not ( = ?auto_420824 ?auto_420828 ) ) ( not ( = ?auto_420824 ?auto_420829 ) ) ( not ( = ?auto_420824 ?auto_420830 ) ) ( not ( = ?auto_420824 ?auto_420831 ) ) ( not ( = ?auto_420824 ?auto_420832 ) ) ( not ( = ?auto_420825 ?auto_420826 ) ) ( not ( = ?auto_420825 ?auto_420827 ) ) ( not ( = ?auto_420825 ?auto_420828 ) ) ( not ( = ?auto_420825 ?auto_420829 ) ) ( not ( = ?auto_420825 ?auto_420830 ) ) ( not ( = ?auto_420825 ?auto_420831 ) ) ( not ( = ?auto_420825 ?auto_420832 ) ) ( not ( = ?auto_420826 ?auto_420827 ) ) ( not ( = ?auto_420826 ?auto_420828 ) ) ( not ( = ?auto_420826 ?auto_420829 ) ) ( not ( = ?auto_420826 ?auto_420830 ) ) ( not ( = ?auto_420826 ?auto_420831 ) ) ( not ( = ?auto_420826 ?auto_420832 ) ) ( not ( = ?auto_420827 ?auto_420828 ) ) ( not ( = ?auto_420827 ?auto_420829 ) ) ( not ( = ?auto_420827 ?auto_420830 ) ) ( not ( = ?auto_420827 ?auto_420831 ) ) ( not ( = ?auto_420827 ?auto_420832 ) ) ( not ( = ?auto_420828 ?auto_420829 ) ) ( not ( = ?auto_420828 ?auto_420830 ) ) ( not ( = ?auto_420828 ?auto_420831 ) ) ( not ( = ?auto_420828 ?auto_420832 ) ) ( not ( = ?auto_420829 ?auto_420830 ) ) ( not ( = ?auto_420829 ?auto_420831 ) ) ( not ( = ?auto_420829 ?auto_420832 ) ) ( not ( = ?auto_420830 ?auto_420831 ) ) ( not ( = ?auto_420830 ?auto_420832 ) ) ( not ( = ?auto_420831 ?auto_420832 ) ) ( CLEAR ?auto_420829 ) ( ON ?auto_420830 ?auto_420831 ) ( CLEAR ?auto_420830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_420819 ?auto_420820 ?auto_420821 ?auto_420822 ?auto_420823 ?auto_420824 ?auto_420825 ?auto_420826 ?auto_420827 ?auto_420828 ?auto_420829 ?auto_420830 )
      ( MAKE-13PILE ?auto_420819 ?auto_420820 ?auto_420821 ?auto_420822 ?auto_420823 ?auto_420824 ?auto_420825 ?auto_420826 ?auto_420827 ?auto_420828 ?auto_420829 ?auto_420830 ?auto_420831 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_420873 - BLOCK
      ?auto_420874 - BLOCK
      ?auto_420875 - BLOCK
      ?auto_420876 - BLOCK
      ?auto_420877 - BLOCK
      ?auto_420878 - BLOCK
      ?auto_420879 - BLOCK
      ?auto_420880 - BLOCK
      ?auto_420881 - BLOCK
      ?auto_420882 - BLOCK
      ?auto_420883 - BLOCK
      ?auto_420884 - BLOCK
      ?auto_420885 - BLOCK
    )
    :vars
    (
      ?auto_420886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420885 ?auto_420886 ) ( ON-TABLE ?auto_420873 ) ( ON ?auto_420874 ?auto_420873 ) ( ON ?auto_420875 ?auto_420874 ) ( ON ?auto_420876 ?auto_420875 ) ( ON ?auto_420877 ?auto_420876 ) ( ON ?auto_420878 ?auto_420877 ) ( ON ?auto_420879 ?auto_420878 ) ( ON ?auto_420880 ?auto_420879 ) ( ON ?auto_420881 ?auto_420880 ) ( ON ?auto_420882 ?auto_420881 ) ( not ( = ?auto_420873 ?auto_420874 ) ) ( not ( = ?auto_420873 ?auto_420875 ) ) ( not ( = ?auto_420873 ?auto_420876 ) ) ( not ( = ?auto_420873 ?auto_420877 ) ) ( not ( = ?auto_420873 ?auto_420878 ) ) ( not ( = ?auto_420873 ?auto_420879 ) ) ( not ( = ?auto_420873 ?auto_420880 ) ) ( not ( = ?auto_420873 ?auto_420881 ) ) ( not ( = ?auto_420873 ?auto_420882 ) ) ( not ( = ?auto_420873 ?auto_420883 ) ) ( not ( = ?auto_420873 ?auto_420884 ) ) ( not ( = ?auto_420873 ?auto_420885 ) ) ( not ( = ?auto_420873 ?auto_420886 ) ) ( not ( = ?auto_420874 ?auto_420875 ) ) ( not ( = ?auto_420874 ?auto_420876 ) ) ( not ( = ?auto_420874 ?auto_420877 ) ) ( not ( = ?auto_420874 ?auto_420878 ) ) ( not ( = ?auto_420874 ?auto_420879 ) ) ( not ( = ?auto_420874 ?auto_420880 ) ) ( not ( = ?auto_420874 ?auto_420881 ) ) ( not ( = ?auto_420874 ?auto_420882 ) ) ( not ( = ?auto_420874 ?auto_420883 ) ) ( not ( = ?auto_420874 ?auto_420884 ) ) ( not ( = ?auto_420874 ?auto_420885 ) ) ( not ( = ?auto_420874 ?auto_420886 ) ) ( not ( = ?auto_420875 ?auto_420876 ) ) ( not ( = ?auto_420875 ?auto_420877 ) ) ( not ( = ?auto_420875 ?auto_420878 ) ) ( not ( = ?auto_420875 ?auto_420879 ) ) ( not ( = ?auto_420875 ?auto_420880 ) ) ( not ( = ?auto_420875 ?auto_420881 ) ) ( not ( = ?auto_420875 ?auto_420882 ) ) ( not ( = ?auto_420875 ?auto_420883 ) ) ( not ( = ?auto_420875 ?auto_420884 ) ) ( not ( = ?auto_420875 ?auto_420885 ) ) ( not ( = ?auto_420875 ?auto_420886 ) ) ( not ( = ?auto_420876 ?auto_420877 ) ) ( not ( = ?auto_420876 ?auto_420878 ) ) ( not ( = ?auto_420876 ?auto_420879 ) ) ( not ( = ?auto_420876 ?auto_420880 ) ) ( not ( = ?auto_420876 ?auto_420881 ) ) ( not ( = ?auto_420876 ?auto_420882 ) ) ( not ( = ?auto_420876 ?auto_420883 ) ) ( not ( = ?auto_420876 ?auto_420884 ) ) ( not ( = ?auto_420876 ?auto_420885 ) ) ( not ( = ?auto_420876 ?auto_420886 ) ) ( not ( = ?auto_420877 ?auto_420878 ) ) ( not ( = ?auto_420877 ?auto_420879 ) ) ( not ( = ?auto_420877 ?auto_420880 ) ) ( not ( = ?auto_420877 ?auto_420881 ) ) ( not ( = ?auto_420877 ?auto_420882 ) ) ( not ( = ?auto_420877 ?auto_420883 ) ) ( not ( = ?auto_420877 ?auto_420884 ) ) ( not ( = ?auto_420877 ?auto_420885 ) ) ( not ( = ?auto_420877 ?auto_420886 ) ) ( not ( = ?auto_420878 ?auto_420879 ) ) ( not ( = ?auto_420878 ?auto_420880 ) ) ( not ( = ?auto_420878 ?auto_420881 ) ) ( not ( = ?auto_420878 ?auto_420882 ) ) ( not ( = ?auto_420878 ?auto_420883 ) ) ( not ( = ?auto_420878 ?auto_420884 ) ) ( not ( = ?auto_420878 ?auto_420885 ) ) ( not ( = ?auto_420878 ?auto_420886 ) ) ( not ( = ?auto_420879 ?auto_420880 ) ) ( not ( = ?auto_420879 ?auto_420881 ) ) ( not ( = ?auto_420879 ?auto_420882 ) ) ( not ( = ?auto_420879 ?auto_420883 ) ) ( not ( = ?auto_420879 ?auto_420884 ) ) ( not ( = ?auto_420879 ?auto_420885 ) ) ( not ( = ?auto_420879 ?auto_420886 ) ) ( not ( = ?auto_420880 ?auto_420881 ) ) ( not ( = ?auto_420880 ?auto_420882 ) ) ( not ( = ?auto_420880 ?auto_420883 ) ) ( not ( = ?auto_420880 ?auto_420884 ) ) ( not ( = ?auto_420880 ?auto_420885 ) ) ( not ( = ?auto_420880 ?auto_420886 ) ) ( not ( = ?auto_420881 ?auto_420882 ) ) ( not ( = ?auto_420881 ?auto_420883 ) ) ( not ( = ?auto_420881 ?auto_420884 ) ) ( not ( = ?auto_420881 ?auto_420885 ) ) ( not ( = ?auto_420881 ?auto_420886 ) ) ( not ( = ?auto_420882 ?auto_420883 ) ) ( not ( = ?auto_420882 ?auto_420884 ) ) ( not ( = ?auto_420882 ?auto_420885 ) ) ( not ( = ?auto_420882 ?auto_420886 ) ) ( not ( = ?auto_420883 ?auto_420884 ) ) ( not ( = ?auto_420883 ?auto_420885 ) ) ( not ( = ?auto_420883 ?auto_420886 ) ) ( not ( = ?auto_420884 ?auto_420885 ) ) ( not ( = ?auto_420884 ?auto_420886 ) ) ( not ( = ?auto_420885 ?auto_420886 ) ) ( ON ?auto_420884 ?auto_420885 ) ( CLEAR ?auto_420882 ) ( ON ?auto_420883 ?auto_420884 ) ( CLEAR ?auto_420883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_420873 ?auto_420874 ?auto_420875 ?auto_420876 ?auto_420877 ?auto_420878 ?auto_420879 ?auto_420880 ?auto_420881 ?auto_420882 ?auto_420883 )
      ( MAKE-13PILE ?auto_420873 ?auto_420874 ?auto_420875 ?auto_420876 ?auto_420877 ?auto_420878 ?auto_420879 ?auto_420880 ?auto_420881 ?auto_420882 ?auto_420883 ?auto_420884 ?auto_420885 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_420927 - BLOCK
      ?auto_420928 - BLOCK
      ?auto_420929 - BLOCK
      ?auto_420930 - BLOCK
      ?auto_420931 - BLOCK
      ?auto_420932 - BLOCK
      ?auto_420933 - BLOCK
      ?auto_420934 - BLOCK
      ?auto_420935 - BLOCK
      ?auto_420936 - BLOCK
      ?auto_420937 - BLOCK
      ?auto_420938 - BLOCK
      ?auto_420939 - BLOCK
    )
    :vars
    (
      ?auto_420940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420939 ?auto_420940 ) ( ON-TABLE ?auto_420927 ) ( ON ?auto_420928 ?auto_420927 ) ( ON ?auto_420929 ?auto_420928 ) ( ON ?auto_420930 ?auto_420929 ) ( ON ?auto_420931 ?auto_420930 ) ( ON ?auto_420932 ?auto_420931 ) ( ON ?auto_420933 ?auto_420932 ) ( ON ?auto_420934 ?auto_420933 ) ( ON ?auto_420935 ?auto_420934 ) ( not ( = ?auto_420927 ?auto_420928 ) ) ( not ( = ?auto_420927 ?auto_420929 ) ) ( not ( = ?auto_420927 ?auto_420930 ) ) ( not ( = ?auto_420927 ?auto_420931 ) ) ( not ( = ?auto_420927 ?auto_420932 ) ) ( not ( = ?auto_420927 ?auto_420933 ) ) ( not ( = ?auto_420927 ?auto_420934 ) ) ( not ( = ?auto_420927 ?auto_420935 ) ) ( not ( = ?auto_420927 ?auto_420936 ) ) ( not ( = ?auto_420927 ?auto_420937 ) ) ( not ( = ?auto_420927 ?auto_420938 ) ) ( not ( = ?auto_420927 ?auto_420939 ) ) ( not ( = ?auto_420927 ?auto_420940 ) ) ( not ( = ?auto_420928 ?auto_420929 ) ) ( not ( = ?auto_420928 ?auto_420930 ) ) ( not ( = ?auto_420928 ?auto_420931 ) ) ( not ( = ?auto_420928 ?auto_420932 ) ) ( not ( = ?auto_420928 ?auto_420933 ) ) ( not ( = ?auto_420928 ?auto_420934 ) ) ( not ( = ?auto_420928 ?auto_420935 ) ) ( not ( = ?auto_420928 ?auto_420936 ) ) ( not ( = ?auto_420928 ?auto_420937 ) ) ( not ( = ?auto_420928 ?auto_420938 ) ) ( not ( = ?auto_420928 ?auto_420939 ) ) ( not ( = ?auto_420928 ?auto_420940 ) ) ( not ( = ?auto_420929 ?auto_420930 ) ) ( not ( = ?auto_420929 ?auto_420931 ) ) ( not ( = ?auto_420929 ?auto_420932 ) ) ( not ( = ?auto_420929 ?auto_420933 ) ) ( not ( = ?auto_420929 ?auto_420934 ) ) ( not ( = ?auto_420929 ?auto_420935 ) ) ( not ( = ?auto_420929 ?auto_420936 ) ) ( not ( = ?auto_420929 ?auto_420937 ) ) ( not ( = ?auto_420929 ?auto_420938 ) ) ( not ( = ?auto_420929 ?auto_420939 ) ) ( not ( = ?auto_420929 ?auto_420940 ) ) ( not ( = ?auto_420930 ?auto_420931 ) ) ( not ( = ?auto_420930 ?auto_420932 ) ) ( not ( = ?auto_420930 ?auto_420933 ) ) ( not ( = ?auto_420930 ?auto_420934 ) ) ( not ( = ?auto_420930 ?auto_420935 ) ) ( not ( = ?auto_420930 ?auto_420936 ) ) ( not ( = ?auto_420930 ?auto_420937 ) ) ( not ( = ?auto_420930 ?auto_420938 ) ) ( not ( = ?auto_420930 ?auto_420939 ) ) ( not ( = ?auto_420930 ?auto_420940 ) ) ( not ( = ?auto_420931 ?auto_420932 ) ) ( not ( = ?auto_420931 ?auto_420933 ) ) ( not ( = ?auto_420931 ?auto_420934 ) ) ( not ( = ?auto_420931 ?auto_420935 ) ) ( not ( = ?auto_420931 ?auto_420936 ) ) ( not ( = ?auto_420931 ?auto_420937 ) ) ( not ( = ?auto_420931 ?auto_420938 ) ) ( not ( = ?auto_420931 ?auto_420939 ) ) ( not ( = ?auto_420931 ?auto_420940 ) ) ( not ( = ?auto_420932 ?auto_420933 ) ) ( not ( = ?auto_420932 ?auto_420934 ) ) ( not ( = ?auto_420932 ?auto_420935 ) ) ( not ( = ?auto_420932 ?auto_420936 ) ) ( not ( = ?auto_420932 ?auto_420937 ) ) ( not ( = ?auto_420932 ?auto_420938 ) ) ( not ( = ?auto_420932 ?auto_420939 ) ) ( not ( = ?auto_420932 ?auto_420940 ) ) ( not ( = ?auto_420933 ?auto_420934 ) ) ( not ( = ?auto_420933 ?auto_420935 ) ) ( not ( = ?auto_420933 ?auto_420936 ) ) ( not ( = ?auto_420933 ?auto_420937 ) ) ( not ( = ?auto_420933 ?auto_420938 ) ) ( not ( = ?auto_420933 ?auto_420939 ) ) ( not ( = ?auto_420933 ?auto_420940 ) ) ( not ( = ?auto_420934 ?auto_420935 ) ) ( not ( = ?auto_420934 ?auto_420936 ) ) ( not ( = ?auto_420934 ?auto_420937 ) ) ( not ( = ?auto_420934 ?auto_420938 ) ) ( not ( = ?auto_420934 ?auto_420939 ) ) ( not ( = ?auto_420934 ?auto_420940 ) ) ( not ( = ?auto_420935 ?auto_420936 ) ) ( not ( = ?auto_420935 ?auto_420937 ) ) ( not ( = ?auto_420935 ?auto_420938 ) ) ( not ( = ?auto_420935 ?auto_420939 ) ) ( not ( = ?auto_420935 ?auto_420940 ) ) ( not ( = ?auto_420936 ?auto_420937 ) ) ( not ( = ?auto_420936 ?auto_420938 ) ) ( not ( = ?auto_420936 ?auto_420939 ) ) ( not ( = ?auto_420936 ?auto_420940 ) ) ( not ( = ?auto_420937 ?auto_420938 ) ) ( not ( = ?auto_420937 ?auto_420939 ) ) ( not ( = ?auto_420937 ?auto_420940 ) ) ( not ( = ?auto_420938 ?auto_420939 ) ) ( not ( = ?auto_420938 ?auto_420940 ) ) ( not ( = ?auto_420939 ?auto_420940 ) ) ( ON ?auto_420938 ?auto_420939 ) ( ON ?auto_420937 ?auto_420938 ) ( CLEAR ?auto_420935 ) ( ON ?auto_420936 ?auto_420937 ) ( CLEAR ?auto_420936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_420927 ?auto_420928 ?auto_420929 ?auto_420930 ?auto_420931 ?auto_420932 ?auto_420933 ?auto_420934 ?auto_420935 ?auto_420936 )
      ( MAKE-13PILE ?auto_420927 ?auto_420928 ?auto_420929 ?auto_420930 ?auto_420931 ?auto_420932 ?auto_420933 ?auto_420934 ?auto_420935 ?auto_420936 ?auto_420937 ?auto_420938 ?auto_420939 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_420981 - BLOCK
      ?auto_420982 - BLOCK
      ?auto_420983 - BLOCK
      ?auto_420984 - BLOCK
      ?auto_420985 - BLOCK
      ?auto_420986 - BLOCK
      ?auto_420987 - BLOCK
      ?auto_420988 - BLOCK
      ?auto_420989 - BLOCK
      ?auto_420990 - BLOCK
      ?auto_420991 - BLOCK
      ?auto_420992 - BLOCK
      ?auto_420993 - BLOCK
    )
    :vars
    (
      ?auto_420994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_420993 ?auto_420994 ) ( ON-TABLE ?auto_420981 ) ( ON ?auto_420982 ?auto_420981 ) ( ON ?auto_420983 ?auto_420982 ) ( ON ?auto_420984 ?auto_420983 ) ( ON ?auto_420985 ?auto_420984 ) ( ON ?auto_420986 ?auto_420985 ) ( ON ?auto_420987 ?auto_420986 ) ( ON ?auto_420988 ?auto_420987 ) ( not ( = ?auto_420981 ?auto_420982 ) ) ( not ( = ?auto_420981 ?auto_420983 ) ) ( not ( = ?auto_420981 ?auto_420984 ) ) ( not ( = ?auto_420981 ?auto_420985 ) ) ( not ( = ?auto_420981 ?auto_420986 ) ) ( not ( = ?auto_420981 ?auto_420987 ) ) ( not ( = ?auto_420981 ?auto_420988 ) ) ( not ( = ?auto_420981 ?auto_420989 ) ) ( not ( = ?auto_420981 ?auto_420990 ) ) ( not ( = ?auto_420981 ?auto_420991 ) ) ( not ( = ?auto_420981 ?auto_420992 ) ) ( not ( = ?auto_420981 ?auto_420993 ) ) ( not ( = ?auto_420981 ?auto_420994 ) ) ( not ( = ?auto_420982 ?auto_420983 ) ) ( not ( = ?auto_420982 ?auto_420984 ) ) ( not ( = ?auto_420982 ?auto_420985 ) ) ( not ( = ?auto_420982 ?auto_420986 ) ) ( not ( = ?auto_420982 ?auto_420987 ) ) ( not ( = ?auto_420982 ?auto_420988 ) ) ( not ( = ?auto_420982 ?auto_420989 ) ) ( not ( = ?auto_420982 ?auto_420990 ) ) ( not ( = ?auto_420982 ?auto_420991 ) ) ( not ( = ?auto_420982 ?auto_420992 ) ) ( not ( = ?auto_420982 ?auto_420993 ) ) ( not ( = ?auto_420982 ?auto_420994 ) ) ( not ( = ?auto_420983 ?auto_420984 ) ) ( not ( = ?auto_420983 ?auto_420985 ) ) ( not ( = ?auto_420983 ?auto_420986 ) ) ( not ( = ?auto_420983 ?auto_420987 ) ) ( not ( = ?auto_420983 ?auto_420988 ) ) ( not ( = ?auto_420983 ?auto_420989 ) ) ( not ( = ?auto_420983 ?auto_420990 ) ) ( not ( = ?auto_420983 ?auto_420991 ) ) ( not ( = ?auto_420983 ?auto_420992 ) ) ( not ( = ?auto_420983 ?auto_420993 ) ) ( not ( = ?auto_420983 ?auto_420994 ) ) ( not ( = ?auto_420984 ?auto_420985 ) ) ( not ( = ?auto_420984 ?auto_420986 ) ) ( not ( = ?auto_420984 ?auto_420987 ) ) ( not ( = ?auto_420984 ?auto_420988 ) ) ( not ( = ?auto_420984 ?auto_420989 ) ) ( not ( = ?auto_420984 ?auto_420990 ) ) ( not ( = ?auto_420984 ?auto_420991 ) ) ( not ( = ?auto_420984 ?auto_420992 ) ) ( not ( = ?auto_420984 ?auto_420993 ) ) ( not ( = ?auto_420984 ?auto_420994 ) ) ( not ( = ?auto_420985 ?auto_420986 ) ) ( not ( = ?auto_420985 ?auto_420987 ) ) ( not ( = ?auto_420985 ?auto_420988 ) ) ( not ( = ?auto_420985 ?auto_420989 ) ) ( not ( = ?auto_420985 ?auto_420990 ) ) ( not ( = ?auto_420985 ?auto_420991 ) ) ( not ( = ?auto_420985 ?auto_420992 ) ) ( not ( = ?auto_420985 ?auto_420993 ) ) ( not ( = ?auto_420985 ?auto_420994 ) ) ( not ( = ?auto_420986 ?auto_420987 ) ) ( not ( = ?auto_420986 ?auto_420988 ) ) ( not ( = ?auto_420986 ?auto_420989 ) ) ( not ( = ?auto_420986 ?auto_420990 ) ) ( not ( = ?auto_420986 ?auto_420991 ) ) ( not ( = ?auto_420986 ?auto_420992 ) ) ( not ( = ?auto_420986 ?auto_420993 ) ) ( not ( = ?auto_420986 ?auto_420994 ) ) ( not ( = ?auto_420987 ?auto_420988 ) ) ( not ( = ?auto_420987 ?auto_420989 ) ) ( not ( = ?auto_420987 ?auto_420990 ) ) ( not ( = ?auto_420987 ?auto_420991 ) ) ( not ( = ?auto_420987 ?auto_420992 ) ) ( not ( = ?auto_420987 ?auto_420993 ) ) ( not ( = ?auto_420987 ?auto_420994 ) ) ( not ( = ?auto_420988 ?auto_420989 ) ) ( not ( = ?auto_420988 ?auto_420990 ) ) ( not ( = ?auto_420988 ?auto_420991 ) ) ( not ( = ?auto_420988 ?auto_420992 ) ) ( not ( = ?auto_420988 ?auto_420993 ) ) ( not ( = ?auto_420988 ?auto_420994 ) ) ( not ( = ?auto_420989 ?auto_420990 ) ) ( not ( = ?auto_420989 ?auto_420991 ) ) ( not ( = ?auto_420989 ?auto_420992 ) ) ( not ( = ?auto_420989 ?auto_420993 ) ) ( not ( = ?auto_420989 ?auto_420994 ) ) ( not ( = ?auto_420990 ?auto_420991 ) ) ( not ( = ?auto_420990 ?auto_420992 ) ) ( not ( = ?auto_420990 ?auto_420993 ) ) ( not ( = ?auto_420990 ?auto_420994 ) ) ( not ( = ?auto_420991 ?auto_420992 ) ) ( not ( = ?auto_420991 ?auto_420993 ) ) ( not ( = ?auto_420991 ?auto_420994 ) ) ( not ( = ?auto_420992 ?auto_420993 ) ) ( not ( = ?auto_420992 ?auto_420994 ) ) ( not ( = ?auto_420993 ?auto_420994 ) ) ( ON ?auto_420992 ?auto_420993 ) ( ON ?auto_420991 ?auto_420992 ) ( ON ?auto_420990 ?auto_420991 ) ( CLEAR ?auto_420988 ) ( ON ?auto_420989 ?auto_420990 ) ( CLEAR ?auto_420989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_420981 ?auto_420982 ?auto_420983 ?auto_420984 ?auto_420985 ?auto_420986 ?auto_420987 ?auto_420988 ?auto_420989 )
      ( MAKE-13PILE ?auto_420981 ?auto_420982 ?auto_420983 ?auto_420984 ?auto_420985 ?auto_420986 ?auto_420987 ?auto_420988 ?auto_420989 ?auto_420990 ?auto_420991 ?auto_420992 ?auto_420993 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_421035 - BLOCK
      ?auto_421036 - BLOCK
      ?auto_421037 - BLOCK
      ?auto_421038 - BLOCK
      ?auto_421039 - BLOCK
      ?auto_421040 - BLOCK
      ?auto_421041 - BLOCK
      ?auto_421042 - BLOCK
      ?auto_421043 - BLOCK
      ?auto_421044 - BLOCK
      ?auto_421045 - BLOCK
      ?auto_421046 - BLOCK
      ?auto_421047 - BLOCK
    )
    :vars
    (
      ?auto_421048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421047 ?auto_421048 ) ( ON-TABLE ?auto_421035 ) ( ON ?auto_421036 ?auto_421035 ) ( ON ?auto_421037 ?auto_421036 ) ( ON ?auto_421038 ?auto_421037 ) ( ON ?auto_421039 ?auto_421038 ) ( ON ?auto_421040 ?auto_421039 ) ( ON ?auto_421041 ?auto_421040 ) ( not ( = ?auto_421035 ?auto_421036 ) ) ( not ( = ?auto_421035 ?auto_421037 ) ) ( not ( = ?auto_421035 ?auto_421038 ) ) ( not ( = ?auto_421035 ?auto_421039 ) ) ( not ( = ?auto_421035 ?auto_421040 ) ) ( not ( = ?auto_421035 ?auto_421041 ) ) ( not ( = ?auto_421035 ?auto_421042 ) ) ( not ( = ?auto_421035 ?auto_421043 ) ) ( not ( = ?auto_421035 ?auto_421044 ) ) ( not ( = ?auto_421035 ?auto_421045 ) ) ( not ( = ?auto_421035 ?auto_421046 ) ) ( not ( = ?auto_421035 ?auto_421047 ) ) ( not ( = ?auto_421035 ?auto_421048 ) ) ( not ( = ?auto_421036 ?auto_421037 ) ) ( not ( = ?auto_421036 ?auto_421038 ) ) ( not ( = ?auto_421036 ?auto_421039 ) ) ( not ( = ?auto_421036 ?auto_421040 ) ) ( not ( = ?auto_421036 ?auto_421041 ) ) ( not ( = ?auto_421036 ?auto_421042 ) ) ( not ( = ?auto_421036 ?auto_421043 ) ) ( not ( = ?auto_421036 ?auto_421044 ) ) ( not ( = ?auto_421036 ?auto_421045 ) ) ( not ( = ?auto_421036 ?auto_421046 ) ) ( not ( = ?auto_421036 ?auto_421047 ) ) ( not ( = ?auto_421036 ?auto_421048 ) ) ( not ( = ?auto_421037 ?auto_421038 ) ) ( not ( = ?auto_421037 ?auto_421039 ) ) ( not ( = ?auto_421037 ?auto_421040 ) ) ( not ( = ?auto_421037 ?auto_421041 ) ) ( not ( = ?auto_421037 ?auto_421042 ) ) ( not ( = ?auto_421037 ?auto_421043 ) ) ( not ( = ?auto_421037 ?auto_421044 ) ) ( not ( = ?auto_421037 ?auto_421045 ) ) ( not ( = ?auto_421037 ?auto_421046 ) ) ( not ( = ?auto_421037 ?auto_421047 ) ) ( not ( = ?auto_421037 ?auto_421048 ) ) ( not ( = ?auto_421038 ?auto_421039 ) ) ( not ( = ?auto_421038 ?auto_421040 ) ) ( not ( = ?auto_421038 ?auto_421041 ) ) ( not ( = ?auto_421038 ?auto_421042 ) ) ( not ( = ?auto_421038 ?auto_421043 ) ) ( not ( = ?auto_421038 ?auto_421044 ) ) ( not ( = ?auto_421038 ?auto_421045 ) ) ( not ( = ?auto_421038 ?auto_421046 ) ) ( not ( = ?auto_421038 ?auto_421047 ) ) ( not ( = ?auto_421038 ?auto_421048 ) ) ( not ( = ?auto_421039 ?auto_421040 ) ) ( not ( = ?auto_421039 ?auto_421041 ) ) ( not ( = ?auto_421039 ?auto_421042 ) ) ( not ( = ?auto_421039 ?auto_421043 ) ) ( not ( = ?auto_421039 ?auto_421044 ) ) ( not ( = ?auto_421039 ?auto_421045 ) ) ( not ( = ?auto_421039 ?auto_421046 ) ) ( not ( = ?auto_421039 ?auto_421047 ) ) ( not ( = ?auto_421039 ?auto_421048 ) ) ( not ( = ?auto_421040 ?auto_421041 ) ) ( not ( = ?auto_421040 ?auto_421042 ) ) ( not ( = ?auto_421040 ?auto_421043 ) ) ( not ( = ?auto_421040 ?auto_421044 ) ) ( not ( = ?auto_421040 ?auto_421045 ) ) ( not ( = ?auto_421040 ?auto_421046 ) ) ( not ( = ?auto_421040 ?auto_421047 ) ) ( not ( = ?auto_421040 ?auto_421048 ) ) ( not ( = ?auto_421041 ?auto_421042 ) ) ( not ( = ?auto_421041 ?auto_421043 ) ) ( not ( = ?auto_421041 ?auto_421044 ) ) ( not ( = ?auto_421041 ?auto_421045 ) ) ( not ( = ?auto_421041 ?auto_421046 ) ) ( not ( = ?auto_421041 ?auto_421047 ) ) ( not ( = ?auto_421041 ?auto_421048 ) ) ( not ( = ?auto_421042 ?auto_421043 ) ) ( not ( = ?auto_421042 ?auto_421044 ) ) ( not ( = ?auto_421042 ?auto_421045 ) ) ( not ( = ?auto_421042 ?auto_421046 ) ) ( not ( = ?auto_421042 ?auto_421047 ) ) ( not ( = ?auto_421042 ?auto_421048 ) ) ( not ( = ?auto_421043 ?auto_421044 ) ) ( not ( = ?auto_421043 ?auto_421045 ) ) ( not ( = ?auto_421043 ?auto_421046 ) ) ( not ( = ?auto_421043 ?auto_421047 ) ) ( not ( = ?auto_421043 ?auto_421048 ) ) ( not ( = ?auto_421044 ?auto_421045 ) ) ( not ( = ?auto_421044 ?auto_421046 ) ) ( not ( = ?auto_421044 ?auto_421047 ) ) ( not ( = ?auto_421044 ?auto_421048 ) ) ( not ( = ?auto_421045 ?auto_421046 ) ) ( not ( = ?auto_421045 ?auto_421047 ) ) ( not ( = ?auto_421045 ?auto_421048 ) ) ( not ( = ?auto_421046 ?auto_421047 ) ) ( not ( = ?auto_421046 ?auto_421048 ) ) ( not ( = ?auto_421047 ?auto_421048 ) ) ( ON ?auto_421046 ?auto_421047 ) ( ON ?auto_421045 ?auto_421046 ) ( ON ?auto_421044 ?auto_421045 ) ( ON ?auto_421043 ?auto_421044 ) ( CLEAR ?auto_421041 ) ( ON ?auto_421042 ?auto_421043 ) ( CLEAR ?auto_421042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_421035 ?auto_421036 ?auto_421037 ?auto_421038 ?auto_421039 ?auto_421040 ?auto_421041 ?auto_421042 )
      ( MAKE-13PILE ?auto_421035 ?auto_421036 ?auto_421037 ?auto_421038 ?auto_421039 ?auto_421040 ?auto_421041 ?auto_421042 ?auto_421043 ?auto_421044 ?auto_421045 ?auto_421046 ?auto_421047 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_421089 - BLOCK
      ?auto_421090 - BLOCK
      ?auto_421091 - BLOCK
      ?auto_421092 - BLOCK
      ?auto_421093 - BLOCK
      ?auto_421094 - BLOCK
      ?auto_421095 - BLOCK
      ?auto_421096 - BLOCK
      ?auto_421097 - BLOCK
      ?auto_421098 - BLOCK
      ?auto_421099 - BLOCK
      ?auto_421100 - BLOCK
      ?auto_421101 - BLOCK
    )
    :vars
    (
      ?auto_421102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421101 ?auto_421102 ) ( ON-TABLE ?auto_421089 ) ( ON ?auto_421090 ?auto_421089 ) ( ON ?auto_421091 ?auto_421090 ) ( ON ?auto_421092 ?auto_421091 ) ( ON ?auto_421093 ?auto_421092 ) ( ON ?auto_421094 ?auto_421093 ) ( not ( = ?auto_421089 ?auto_421090 ) ) ( not ( = ?auto_421089 ?auto_421091 ) ) ( not ( = ?auto_421089 ?auto_421092 ) ) ( not ( = ?auto_421089 ?auto_421093 ) ) ( not ( = ?auto_421089 ?auto_421094 ) ) ( not ( = ?auto_421089 ?auto_421095 ) ) ( not ( = ?auto_421089 ?auto_421096 ) ) ( not ( = ?auto_421089 ?auto_421097 ) ) ( not ( = ?auto_421089 ?auto_421098 ) ) ( not ( = ?auto_421089 ?auto_421099 ) ) ( not ( = ?auto_421089 ?auto_421100 ) ) ( not ( = ?auto_421089 ?auto_421101 ) ) ( not ( = ?auto_421089 ?auto_421102 ) ) ( not ( = ?auto_421090 ?auto_421091 ) ) ( not ( = ?auto_421090 ?auto_421092 ) ) ( not ( = ?auto_421090 ?auto_421093 ) ) ( not ( = ?auto_421090 ?auto_421094 ) ) ( not ( = ?auto_421090 ?auto_421095 ) ) ( not ( = ?auto_421090 ?auto_421096 ) ) ( not ( = ?auto_421090 ?auto_421097 ) ) ( not ( = ?auto_421090 ?auto_421098 ) ) ( not ( = ?auto_421090 ?auto_421099 ) ) ( not ( = ?auto_421090 ?auto_421100 ) ) ( not ( = ?auto_421090 ?auto_421101 ) ) ( not ( = ?auto_421090 ?auto_421102 ) ) ( not ( = ?auto_421091 ?auto_421092 ) ) ( not ( = ?auto_421091 ?auto_421093 ) ) ( not ( = ?auto_421091 ?auto_421094 ) ) ( not ( = ?auto_421091 ?auto_421095 ) ) ( not ( = ?auto_421091 ?auto_421096 ) ) ( not ( = ?auto_421091 ?auto_421097 ) ) ( not ( = ?auto_421091 ?auto_421098 ) ) ( not ( = ?auto_421091 ?auto_421099 ) ) ( not ( = ?auto_421091 ?auto_421100 ) ) ( not ( = ?auto_421091 ?auto_421101 ) ) ( not ( = ?auto_421091 ?auto_421102 ) ) ( not ( = ?auto_421092 ?auto_421093 ) ) ( not ( = ?auto_421092 ?auto_421094 ) ) ( not ( = ?auto_421092 ?auto_421095 ) ) ( not ( = ?auto_421092 ?auto_421096 ) ) ( not ( = ?auto_421092 ?auto_421097 ) ) ( not ( = ?auto_421092 ?auto_421098 ) ) ( not ( = ?auto_421092 ?auto_421099 ) ) ( not ( = ?auto_421092 ?auto_421100 ) ) ( not ( = ?auto_421092 ?auto_421101 ) ) ( not ( = ?auto_421092 ?auto_421102 ) ) ( not ( = ?auto_421093 ?auto_421094 ) ) ( not ( = ?auto_421093 ?auto_421095 ) ) ( not ( = ?auto_421093 ?auto_421096 ) ) ( not ( = ?auto_421093 ?auto_421097 ) ) ( not ( = ?auto_421093 ?auto_421098 ) ) ( not ( = ?auto_421093 ?auto_421099 ) ) ( not ( = ?auto_421093 ?auto_421100 ) ) ( not ( = ?auto_421093 ?auto_421101 ) ) ( not ( = ?auto_421093 ?auto_421102 ) ) ( not ( = ?auto_421094 ?auto_421095 ) ) ( not ( = ?auto_421094 ?auto_421096 ) ) ( not ( = ?auto_421094 ?auto_421097 ) ) ( not ( = ?auto_421094 ?auto_421098 ) ) ( not ( = ?auto_421094 ?auto_421099 ) ) ( not ( = ?auto_421094 ?auto_421100 ) ) ( not ( = ?auto_421094 ?auto_421101 ) ) ( not ( = ?auto_421094 ?auto_421102 ) ) ( not ( = ?auto_421095 ?auto_421096 ) ) ( not ( = ?auto_421095 ?auto_421097 ) ) ( not ( = ?auto_421095 ?auto_421098 ) ) ( not ( = ?auto_421095 ?auto_421099 ) ) ( not ( = ?auto_421095 ?auto_421100 ) ) ( not ( = ?auto_421095 ?auto_421101 ) ) ( not ( = ?auto_421095 ?auto_421102 ) ) ( not ( = ?auto_421096 ?auto_421097 ) ) ( not ( = ?auto_421096 ?auto_421098 ) ) ( not ( = ?auto_421096 ?auto_421099 ) ) ( not ( = ?auto_421096 ?auto_421100 ) ) ( not ( = ?auto_421096 ?auto_421101 ) ) ( not ( = ?auto_421096 ?auto_421102 ) ) ( not ( = ?auto_421097 ?auto_421098 ) ) ( not ( = ?auto_421097 ?auto_421099 ) ) ( not ( = ?auto_421097 ?auto_421100 ) ) ( not ( = ?auto_421097 ?auto_421101 ) ) ( not ( = ?auto_421097 ?auto_421102 ) ) ( not ( = ?auto_421098 ?auto_421099 ) ) ( not ( = ?auto_421098 ?auto_421100 ) ) ( not ( = ?auto_421098 ?auto_421101 ) ) ( not ( = ?auto_421098 ?auto_421102 ) ) ( not ( = ?auto_421099 ?auto_421100 ) ) ( not ( = ?auto_421099 ?auto_421101 ) ) ( not ( = ?auto_421099 ?auto_421102 ) ) ( not ( = ?auto_421100 ?auto_421101 ) ) ( not ( = ?auto_421100 ?auto_421102 ) ) ( not ( = ?auto_421101 ?auto_421102 ) ) ( ON ?auto_421100 ?auto_421101 ) ( ON ?auto_421099 ?auto_421100 ) ( ON ?auto_421098 ?auto_421099 ) ( ON ?auto_421097 ?auto_421098 ) ( ON ?auto_421096 ?auto_421097 ) ( CLEAR ?auto_421094 ) ( ON ?auto_421095 ?auto_421096 ) ( CLEAR ?auto_421095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_421089 ?auto_421090 ?auto_421091 ?auto_421092 ?auto_421093 ?auto_421094 ?auto_421095 )
      ( MAKE-13PILE ?auto_421089 ?auto_421090 ?auto_421091 ?auto_421092 ?auto_421093 ?auto_421094 ?auto_421095 ?auto_421096 ?auto_421097 ?auto_421098 ?auto_421099 ?auto_421100 ?auto_421101 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_421143 - BLOCK
      ?auto_421144 - BLOCK
      ?auto_421145 - BLOCK
      ?auto_421146 - BLOCK
      ?auto_421147 - BLOCK
      ?auto_421148 - BLOCK
      ?auto_421149 - BLOCK
      ?auto_421150 - BLOCK
      ?auto_421151 - BLOCK
      ?auto_421152 - BLOCK
      ?auto_421153 - BLOCK
      ?auto_421154 - BLOCK
      ?auto_421155 - BLOCK
    )
    :vars
    (
      ?auto_421156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421155 ?auto_421156 ) ( ON-TABLE ?auto_421143 ) ( ON ?auto_421144 ?auto_421143 ) ( ON ?auto_421145 ?auto_421144 ) ( ON ?auto_421146 ?auto_421145 ) ( ON ?auto_421147 ?auto_421146 ) ( not ( = ?auto_421143 ?auto_421144 ) ) ( not ( = ?auto_421143 ?auto_421145 ) ) ( not ( = ?auto_421143 ?auto_421146 ) ) ( not ( = ?auto_421143 ?auto_421147 ) ) ( not ( = ?auto_421143 ?auto_421148 ) ) ( not ( = ?auto_421143 ?auto_421149 ) ) ( not ( = ?auto_421143 ?auto_421150 ) ) ( not ( = ?auto_421143 ?auto_421151 ) ) ( not ( = ?auto_421143 ?auto_421152 ) ) ( not ( = ?auto_421143 ?auto_421153 ) ) ( not ( = ?auto_421143 ?auto_421154 ) ) ( not ( = ?auto_421143 ?auto_421155 ) ) ( not ( = ?auto_421143 ?auto_421156 ) ) ( not ( = ?auto_421144 ?auto_421145 ) ) ( not ( = ?auto_421144 ?auto_421146 ) ) ( not ( = ?auto_421144 ?auto_421147 ) ) ( not ( = ?auto_421144 ?auto_421148 ) ) ( not ( = ?auto_421144 ?auto_421149 ) ) ( not ( = ?auto_421144 ?auto_421150 ) ) ( not ( = ?auto_421144 ?auto_421151 ) ) ( not ( = ?auto_421144 ?auto_421152 ) ) ( not ( = ?auto_421144 ?auto_421153 ) ) ( not ( = ?auto_421144 ?auto_421154 ) ) ( not ( = ?auto_421144 ?auto_421155 ) ) ( not ( = ?auto_421144 ?auto_421156 ) ) ( not ( = ?auto_421145 ?auto_421146 ) ) ( not ( = ?auto_421145 ?auto_421147 ) ) ( not ( = ?auto_421145 ?auto_421148 ) ) ( not ( = ?auto_421145 ?auto_421149 ) ) ( not ( = ?auto_421145 ?auto_421150 ) ) ( not ( = ?auto_421145 ?auto_421151 ) ) ( not ( = ?auto_421145 ?auto_421152 ) ) ( not ( = ?auto_421145 ?auto_421153 ) ) ( not ( = ?auto_421145 ?auto_421154 ) ) ( not ( = ?auto_421145 ?auto_421155 ) ) ( not ( = ?auto_421145 ?auto_421156 ) ) ( not ( = ?auto_421146 ?auto_421147 ) ) ( not ( = ?auto_421146 ?auto_421148 ) ) ( not ( = ?auto_421146 ?auto_421149 ) ) ( not ( = ?auto_421146 ?auto_421150 ) ) ( not ( = ?auto_421146 ?auto_421151 ) ) ( not ( = ?auto_421146 ?auto_421152 ) ) ( not ( = ?auto_421146 ?auto_421153 ) ) ( not ( = ?auto_421146 ?auto_421154 ) ) ( not ( = ?auto_421146 ?auto_421155 ) ) ( not ( = ?auto_421146 ?auto_421156 ) ) ( not ( = ?auto_421147 ?auto_421148 ) ) ( not ( = ?auto_421147 ?auto_421149 ) ) ( not ( = ?auto_421147 ?auto_421150 ) ) ( not ( = ?auto_421147 ?auto_421151 ) ) ( not ( = ?auto_421147 ?auto_421152 ) ) ( not ( = ?auto_421147 ?auto_421153 ) ) ( not ( = ?auto_421147 ?auto_421154 ) ) ( not ( = ?auto_421147 ?auto_421155 ) ) ( not ( = ?auto_421147 ?auto_421156 ) ) ( not ( = ?auto_421148 ?auto_421149 ) ) ( not ( = ?auto_421148 ?auto_421150 ) ) ( not ( = ?auto_421148 ?auto_421151 ) ) ( not ( = ?auto_421148 ?auto_421152 ) ) ( not ( = ?auto_421148 ?auto_421153 ) ) ( not ( = ?auto_421148 ?auto_421154 ) ) ( not ( = ?auto_421148 ?auto_421155 ) ) ( not ( = ?auto_421148 ?auto_421156 ) ) ( not ( = ?auto_421149 ?auto_421150 ) ) ( not ( = ?auto_421149 ?auto_421151 ) ) ( not ( = ?auto_421149 ?auto_421152 ) ) ( not ( = ?auto_421149 ?auto_421153 ) ) ( not ( = ?auto_421149 ?auto_421154 ) ) ( not ( = ?auto_421149 ?auto_421155 ) ) ( not ( = ?auto_421149 ?auto_421156 ) ) ( not ( = ?auto_421150 ?auto_421151 ) ) ( not ( = ?auto_421150 ?auto_421152 ) ) ( not ( = ?auto_421150 ?auto_421153 ) ) ( not ( = ?auto_421150 ?auto_421154 ) ) ( not ( = ?auto_421150 ?auto_421155 ) ) ( not ( = ?auto_421150 ?auto_421156 ) ) ( not ( = ?auto_421151 ?auto_421152 ) ) ( not ( = ?auto_421151 ?auto_421153 ) ) ( not ( = ?auto_421151 ?auto_421154 ) ) ( not ( = ?auto_421151 ?auto_421155 ) ) ( not ( = ?auto_421151 ?auto_421156 ) ) ( not ( = ?auto_421152 ?auto_421153 ) ) ( not ( = ?auto_421152 ?auto_421154 ) ) ( not ( = ?auto_421152 ?auto_421155 ) ) ( not ( = ?auto_421152 ?auto_421156 ) ) ( not ( = ?auto_421153 ?auto_421154 ) ) ( not ( = ?auto_421153 ?auto_421155 ) ) ( not ( = ?auto_421153 ?auto_421156 ) ) ( not ( = ?auto_421154 ?auto_421155 ) ) ( not ( = ?auto_421154 ?auto_421156 ) ) ( not ( = ?auto_421155 ?auto_421156 ) ) ( ON ?auto_421154 ?auto_421155 ) ( ON ?auto_421153 ?auto_421154 ) ( ON ?auto_421152 ?auto_421153 ) ( ON ?auto_421151 ?auto_421152 ) ( ON ?auto_421150 ?auto_421151 ) ( ON ?auto_421149 ?auto_421150 ) ( CLEAR ?auto_421147 ) ( ON ?auto_421148 ?auto_421149 ) ( CLEAR ?auto_421148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_421143 ?auto_421144 ?auto_421145 ?auto_421146 ?auto_421147 ?auto_421148 )
      ( MAKE-13PILE ?auto_421143 ?auto_421144 ?auto_421145 ?auto_421146 ?auto_421147 ?auto_421148 ?auto_421149 ?auto_421150 ?auto_421151 ?auto_421152 ?auto_421153 ?auto_421154 ?auto_421155 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_421197 - BLOCK
      ?auto_421198 - BLOCK
      ?auto_421199 - BLOCK
      ?auto_421200 - BLOCK
      ?auto_421201 - BLOCK
      ?auto_421202 - BLOCK
      ?auto_421203 - BLOCK
      ?auto_421204 - BLOCK
      ?auto_421205 - BLOCK
      ?auto_421206 - BLOCK
      ?auto_421207 - BLOCK
      ?auto_421208 - BLOCK
      ?auto_421209 - BLOCK
    )
    :vars
    (
      ?auto_421210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421209 ?auto_421210 ) ( ON-TABLE ?auto_421197 ) ( ON ?auto_421198 ?auto_421197 ) ( ON ?auto_421199 ?auto_421198 ) ( ON ?auto_421200 ?auto_421199 ) ( not ( = ?auto_421197 ?auto_421198 ) ) ( not ( = ?auto_421197 ?auto_421199 ) ) ( not ( = ?auto_421197 ?auto_421200 ) ) ( not ( = ?auto_421197 ?auto_421201 ) ) ( not ( = ?auto_421197 ?auto_421202 ) ) ( not ( = ?auto_421197 ?auto_421203 ) ) ( not ( = ?auto_421197 ?auto_421204 ) ) ( not ( = ?auto_421197 ?auto_421205 ) ) ( not ( = ?auto_421197 ?auto_421206 ) ) ( not ( = ?auto_421197 ?auto_421207 ) ) ( not ( = ?auto_421197 ?auto_421208 ) ) ( not ( = ?auto_421197 ?auto_421209 ) ) ( not ( = ?auto_421197 ?auto_421210 ) ) ( not ( = ?auto_421198 ?auto_421199 ) ) ( not ( = ?auto_421198 ?auto_421200 ) ) ( not ( = ?auto_421198 ?auto_421201 ) ) ( not ( = ?auto_421198 ?auto_421202 ) ) ( not ( = ?auto_421198 ?auto_421203 ) ) ( not ( = ?auto_421198 ?auto_421204 ) ) ( not ( = ?auto_421198 ?auto_421205 ) ) ( not ( = ?auto_421198 ?auto_421206 ) ) ( not ( = ?auto_421198 ?auto_421207 ) ) ( not ( = ?auto_421198 ?auto_421208 ) ) ( not ( = ?auto_421198 ?auto_421209 ) ) ( not ( = ?auto_421198 ?auto_421210 ) ) ( not ( = ?auto_421199 ?auto_421200 ) ) ( not ( = ?auto_421199 ?auto_421201 ) ) ( not ( = ?auto_421199 ?auto_421202 ) ) ( not ( = ?auto_421199 ?auto_421203 ) ) ( not ( = ?auto_421199 ?auto_421204 ) ) ( not ( = ?auto_421199 ?auto_421205 ) ) ( not ( = ?auto_421199 ?auto_421206 ) ) ( not ( = ?auto_421199 ?auto_421207 ) ) ( not ( = ?auto_421199 ?auto_421208 ) ) ( not ( = ?auto_421199 ?auto_421209 ) ) ( not ( = ?auto_421199 ?auto_421210 ) ) ( not ( = ?auto_421200 ?auto_421201 ) ) ( not ( = ?auto_421200 ?auto_421202 ) ) ( not ( = ?auto_421200 ?auto_421203 ) ) ( not ( = ?auto_421200 ?auto_421204 ) ) ( not ( = ?auto_421200 ?auto_421205 ) ) ( not ( = ?auto_421200 ?auto_421206 ) ) ( not ( = ?auto_421200 ?auto_421207 ) ) ( not ( = ?auto_421200 ?auto_421208 ) ) ( not ( = ?auto_421200 ?auto_421209 ) ) ( not ( = ?auto_421200 ?auto_421210 ) ) ( not ( = ?auto_421201 ?auto_421202 ) ) ( not ( = ?auto_421201 ?auto_421203 ) ) ( not ( = ?auto_421201 ?auto_421204 ) ) ( not ( = ?auto_421201 ?auto_421205 ) ) ( not ( = ?auto_421201 ?auto_421206 ) ) ( not ( = ?auto_421201 ?auto_421207 ) ) ( not ( = ?auto_421201 ?auto_421208 ) ) ( not ( = ?auto_421201 ?auto_421209 ) ) ( not ( = ?auto_421201 ?auto_421210 ) ) ( not ( = ?auto_421202 ?auto_421203 ) ) ( not ( = ?auto_421202 ?auto_421204 ) ) ( not ( = ?auto_421202 ?auto_421205 ) ) ( not ( = ?auto_421202 ?auto_421206 ) ) ( not ( = ?auto_421202 ?auto_421207 ) ) ( not ( = ?auto_421202 ?auto_421208 ) ) ( not ( = ?auto_421202 ?auto_421209 ) ) ( not ( = ?auto_421202 ?auto_421210 ) ) ( not ( = ?auto_421203 ?auto_421204 ) ) ( not ( = ?auto_421203 ?auto_421205 ) ) ( not ( = ?auto_421203 ?auto_421206 ) ) ( not ( = ?auto_421203 ?auto_421207 ) ) ( not ( = ?auto_421203 ?auto_421208 ) ) ( not ( = ?auto_421203 ?auto_421209 ) ) ( not ( = ?auto_421203 ?auto_421210 ) ) ( not ( = ?auto_421204 ?auto_421205 ) ) ( not ( = ?auto_421204 ?auto_421206 ) ) ( not ( = ?auto_421204 ?auto_421207 ) ) ( not ( = ?auto_421204 ?auto_421208 ) ) ( not ( = ?auto_421204 ?auto_421209 ) ) ( not ( = ?auto_421204 ?auto_421210 ) ) ( not ( = ?auto_421205 ?auto_421206 ) ) ( not ( = ?auto_421205 ?auto_421207 ) ) ( not ( = ?auto_421205 ?auto_421208 ) ) ( not ( = ?auto_421205 ?auto_421209 ) ) ( not ( = ?auto_421205 ?auto_421210 ) ) ( not ( = ?auto_421206 ?auto_421207 ) ) ( not ( = ?auto_421206 ?auto_421208 ) ) ( not ( = ?auto_421206 ?auto_421209 ) ) ( not ( = ?auto_421206 ?auto_421210 ) ) ( not ( = ?auto_421207 ?auto_421208 ) ) ( not ( = ?auto_421207 ?auto_421209 ) ) ( not ( = ?auto_421207 ?auto_421210 ) ) ( not ( = ?auto_421208 ?auto_421209 ) ) ( not ( = ?auto_421208 ?auto_421210 ) ) ( not ( = ?auto_421209 ?auto_421210 ) ) ( ON ?auto_421208 ?auto_421209 ) ( ON ?auto_421207 ?auto_421208 ) ( ON ?auto_421206 ?auto_421207 ) ( ON ?auto_421205 ?auto_421206 ) ( ON ?auto_421204 ?auto_421205 ) ( ON ?auto_421203 ?auto_421204 ) ( ON ?auto_421202 ?auto_421203 ) ( CLEAR ?auto_421200 ) ( ON ?auto_421201 ?auto_421202 ) ( CLEAR ?auto_421201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_421197 ?auto_421198 ?auto_421199 ?auto_421200 ?auto_421201 )
      ( MAKE-13PILE ?auto_421197 ?auto_421198 ?auto_421199 ?auto_421200 ?auto_421201 ?auto_421202 ?auto_421203 ?auto_421204 ?auto_421205 ?auto_421206 ?auto_421207 ?auto_421208 ?auto_421209 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_421251 - BLOCK
      ?auto_421252 - BLOCK
      ?auto_421253 - BLOCK
      ?auto_421254 - BLOCK
      ?auto_421255 - BLOCK
      ?auto_421256 - BLOCK
      ?auto_421257 - BLOCK
      ?auto_421258 - BLOCK
      ?auto_421259 - BLOCK
      ?auto_421260 - BLOCK
      ?auto_421261 - BLOCK
      ?auto_421262 - BLOCK
      ?auto_421263 - BLOCK
    )
    :vars
    (
      ?auto_421264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421263 ?auto_421264 ) ( ON-TABLE ?auto_421251 ) ( ON ?auto_421252 ?auto_421251 ) ( ON ?auto_421253 ?auto_421252 ) ( not ( = ?auto_421251 ?auto_421252 ) ) ( not ( = ?auto_421251 ?auto_421253 ) ) ( not ( = ?auto_421251 ?auto_421254 ) ) ( not ( = ?auto_421251 ?auto_421255 ) ) ( not ( = ?auto_421251 ?auto_421256 ) ) ( not ( = ?auto_421251 ?auto_421257 ) ) ( not ( = ?auto_421251 ?auto_421258 ) ) ( not ( = ?auto_421251 ?auto_421259 ) ) ( not ( = ?auto_421251 ?auto_421260 ) ) ( not ( = ?auto_421251 ?auto_421261 ) ) ( not ( = ?auto_421251 ?auto_421262 ) ) ( not ( = ?auto_421251 ?auto_421263 ) ) ( not ( = ?auto_421251 ?auto_421264 ) ) ( not ( = ?auto_421252 ?auto_421253 ) ) ( not ( = ?auto_421252 ?auto_421254 ) ) ( not ( = ?auto_421252 ?auto_421255 ) ) ( not ( = ?auto_421252 ?auto_421256 ) ) ( not ( = ?auto_421252 ?auto_421257 ) ) ( not ( = ?auto_421252 ?auto_421258 ) ) ( not ( = ?auto_421252 ?auto_421259 ) ) ( not ( = ?auto_421252 ?auto_421260 ) ) ( not ( = ?auto_421252 ?auto_421261 ) ) ( not ( = ?auto_421252 ?auto_421262 ) ) ( not ( = ?auto_421252 ?auto_421263 ) ) ( not ( = ?auto_421252 ?auto_421264 ) ) ( not ( = ?auto_421253 ?auto_421254 ) ) ( not ( = ?auto_421253 ?auto_421255 ) ) ( not ( = ?auto_421253 ?auto_421256 ) ) ( not ( = ?auto_421253 ?auto_421257 ) ) ( not ( = ?auto_421253 ?auto_421258 ) ) ( not ( = ?auto_421253 ?auto_421259 ) ) ( not ( = ?auto_421253 ?auto_421260 ) ) ( not ( = ?auto_421253 ?auto_421261 ) ) ( not ( = ?auto_421253 ?auto_421262 ) ) ( not ( = ?auto_421253 ?auto_421263 ) ) ( not ( = ?auto_421253 ?auto_421264 ) ) ( not ( = ?auto_421254 ?auto_421255 ) ) ( not ( = ?auto_421254 ?auto_421256 ) ) ( not ( = ?auto_421254 ?auto_421257 ) ) ( not ( = ?auto_421254 ?auto_421258 ) ) ( not ( = ?auto_421254 ?auto_421259 ) ) ( not ( = ?auto_421254 ?auto_421260 ) ) ( not ( = ?auto_421254 ?auto_421261 ) ) ( not ( = ?auto_421254 ?auto_421262 ) ) ( not ( = ?auto_421254 ?auto_421263 ) ) ( not ( = ?auto_421254 ?auto_421264 ) ) ( not ( = ?auto_421255 ?auto_421256 ) ) ( not ( = ?auto_421255 ?auto_421257 ) ) ( not ( = ?auto_421255 ?auto_421258 ) ) ( not ( = ?auto_421255 ?auto_421259 ) ) ( not ( = ?auto_421255 ?auto_421260 ) ) ( not ( = ?auto_421255 ?auto_421261 ) ) ( not ( = ?auto_421255 ?auto_421262 ) ) ( not ( = ?auto_421255 ?auto_421263 ) ) ( not ( = ?auto_421255 ?auto_421264 ) ) ( not ( = ?auto_421256 ?auto_421257 ) ) ( not ( = ?auto_421256 ?auto_421258 ) ) ( not ( = ?auto_421256 ?auto_421259 ) ) ( not ( = ?auto_421256 ?auto_421260 ) ) ( not ( = ?auto_421256 ?auto_421261 ) ) ( not ( = ?auto_421256 ?auto_421262 ) ) ( not ( = ?auto_421256 ?auto_421263 ) ) ( not ( = ?auto_421256 ?auto_421264 ) ) ( not ( = ?auto_421257 ?auto_421258 ) ) ( not ( = ?auto_421257 ?auto_421259 ) ) ( not ( = ?auto_421257 ?auto_421260 ) ) ( not ( = ?auto_421257 ?auto_421261 ) ) ( not ( = ?auto_421257 ?auto_421262 ) ) ( not ( = ?auto_421257 ?auto_421263 ) ) ( not ( = ?auto_421257 ?auto_421264 ) ) ( not ( = ?auto_421258 ?auto_421259 ) ) ( not ( = ?auto_421258 ?auto_421260 ) ) ( not ( = ?auto_421258 ?auto_421261 ) ) ( not ( = ?auto_421258 ?auto_421262 ) ) ( not ( = ?auto_421258 ?auto_421263 ) ) ( not ( = ?auto_421258 ?auto_421264 ) ) ( not ( = ?auto_421259 ?auto_421260 ) ) ( not ( = ?auto_421259 ?auto_421261 ) ) ( not ( = ?auto_421259 ?auto_421262 ) ) ( not ( = ?auto_421259 ?auto_421263 ) ) ( not ( = ?auto_421259 ?auto_421264 ) ) ( not ( = ?auto_421260 ?auto_421261 ) ) ( not ( = ?auto_421260 ?auto_421262 ) ) ( not ( = ?auto_421260 ?auto_421263 ) ) ( not ( = ?auto_421260 ?auto_421264 ) ) ( not ( = ?auto_421261 ?auto_421262 ) ) ( not ( = ?auto_421261 ?auto_421263 ) ) ( not ( = ?auto_421261 ?auto_421264 ) ) ( not ( = ?auto_421262 ?auto_421263 ) ) ( not ( = ?auto_421262 ?auto_421264 ) ) ( not ( = ?auto_421263 ?auto_421264 ) ) ( ON ?auto_421262 ?auto_421263 ) ( ON ?auto_421261 ?auto_421262 ) ( ON ?auto_421260 ?auto_421261 ) ( ON ?auto_421259 ?auto_421260 ) ( ON ?auto_421258 ?auto_421259 ) ( ON ?auto_421257 ?auto_421258 ) ( ON ?auto_421256 ?auto_421257 ) ( ON ?auto_421255 ?auto_421256 ) ( CLEAR ?auto_421253 ) ( ON ?auto_421254 ?auto_421255 ) ( CLEAR ?auto_421254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_421251 ?auto_421252 ?auto_421253 ?auto_421254 )
      ( MAKE-13PILE ?auto_421251 ?auto_421252 ?auto_421253 ?auto_421254 ?auto_421255 ?auto_421256 ?auto_421257 ?auto_421258 ?auto_421259 ?auto_421260 ?auto_421261 ?auto_421262 ?auto_421263 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_421305 - BLOCK
      ?auto_421306 - BLOCK
      ?auto_421307 - BLOCK
      ?auto_421308 - BLOCK
      ?auto_421309 - BLOCK
      ?auto_421310 - BLOCK
      ?auto_421311 - BLOCK
      ?auto_421312 - BLOCK
      ?auto_421313 - BLOCK
      ?auto_421314 - BLOCK
      ?auto_421315 - BLOCK
      ?auto_421316 - BLOCK
      ?auto_421317 - BLOCK
    )
    :vars
    (
      ?auto_421318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421317 ?auto_421318 ) ( ON-TABLE ?auto_421305 ) ( ON ?auto_421306 ?auto_421305 ) ( not ( = ?auto_421305 ?auto_421306 ) ) ( not ( = ?auto_421305 ?auto_421307 ) ) ( not ( = ?auto_421305 ?auto_421308 ) ) ( not ( = ?auto_421305 ?auto_421309 ) ) ( not ( = ?auto_421305 ?auto_421310 ) ) ( not ( = ?auto_421305 ?auto_421311 ) ) ( not ( = ?auto_421305 ?auto_421312 ) ) ( not ( = ?auto_421305 ?auto_421313 ) ) ( not ( = ?auto_421305 ?auto_421314 ) ) ( not ( = ?auto_421305 ?auto_421315 ) ) ( not ( = ?auto_421305 ?auto_421316 ) ) ( not ( = ?auto_421305 ?auto_421317 ) ) ( not ( = ?auto_421305 ?auto_421318 ) ) ( not ( = ?auto_421306 ?auto_421307 ) ) ( not ( = ?auto_421306 ?auto_421308 ) ) ( not ( = ?auto_421306 ?auto_421309 ) ) ( not ( = ?auto_421306 ?auto_421310 ) ) ( not ( = ?auto_421306 ?auto_421311 ) ) ( not ( = ?auto_421306 ?auto_421312 ) ) ( not ( = ?auto_421306 ?auto_421313 ) ) ( not ( = ?auto_421306 ?auto_421314 ) ) ( not ( = ?auto_421306 ?auto_421315 ) ) ( not ( = ?auto_421306 ?auto_421316 ) ) ( not ( = ?auto_421306 ?auto_421317 ) ) ( not ( = ?auto_421306 ?auto_421318 ) ) ( not ( = ?auto_421307 ?auto_421308 ) ) ( not ( = ?auto_421307 ?auto_421309 ) ) ( not ( = ?auto_421307 ?auto_421310 ) ) ( not ( = ?auto_421307 ?auto_421311 ) ) ( not ( = ?auto_421307 ?auto_421312 ) ) ( not ( = ?auto_421307 ?auto_421313 ) ) ( not ( = ?auto_421307 ?auto_421314 ) ) ( not ( = ?auto_421307 ?auto_421315 ) ) ( not ( = ?auto_421307 ?auto_421316 ) ) ( not ( = ?auto_421307 ?auto_421317 ) ) ( not ( = ?auto_421307 ?auto_421318 ) ) ( not ( = ?auto_421308 ?auto_421309 ) ) ( not ( = ?auto_421308 ?auto_421310 ) ) ( not ( = ?auto_421308 ?auto_421311 ) ) ( not ( = ?auto_421308 ?auto_421312 ) ) ( not ( = ?auto_421308 ?auto_421313 ) ) ( not ( = ?auto_421308 ?auto_421314 ) ) ( not ( = ?auto_421308 ?auto_421315 ) ) ( not ( = ?auto_421308 ?auto_421316 ) ) ( not ( = ?auto_421308 ?auto_421317 ) ) ( not ( = ?auto_421308 ?auto_421318 ) ) ( not ( = ?auto_421309 ?auto_421310 ) ) ( not ( = ?auto_421309 ?auto_421311 ) ) ( not ( = ?auto_421309 ?auto_421312 ) ) ( not ( = ?auto_421309 ?auto_421313 ) ) ( not ( = ?auto_421309 ?auto_421314 ) ) ( not ( = ?auto_421309 ?auto_421315 ) ) ( not ( = ?auto_421309 ?auto_421316 ) ) ( not ( = ?auto_421309 ?auto_421317 ) ) ( not ( = ?auto_421309 ?auto_421318 ) ) ( not ( = ?auto_421310 ?auto_421311 ) ) ( not ( = ?auto_421310 ?auto_421312 ) ) ( not ( = ?auto_421310 ?auto_421313 ) ) ( not ( = ?auto_421310 ?auto_421314 ) ) ( not ( = ?auto_421310 ?auto_421315 ) ) ( not ( = ?auto_421310 ?auto_421316 ) ) ( not ( = ?auto_421310 ?auto_421317 ) ) ( not ( = ?auto_421310 ?auto_421318 ) ) ( not ( = ?auto_421311 ?auto_421312 ) ) ( not ( = ?auto_421311 ?auto_421313 ) ) ( not ( = ?auto_421311 ?auto_421314 ) ) ( not ( = ?auto_421311 ?auto_421315 ) ) ( not ( = ?auto_421311 ?auto_421316 ) ) ( not ( = ?auto_421311 ?auto_421317 ) ) ( not ( = ?auto_421311 ?auto_421318 ) ) ( not ( = ?auto_421312 ?auto_421313 ) ) ( not ( = ?auto_421312 ?auto_421314 ) ) ( not ( = ?auto_421312 ?auto_421315 ) ) ( not ( = ?auto_421312 ?auto_421316 ) ) ( not ( = ?auto_421312 ?auto_421317 ) ) ( not ( = ?auto_421312 ?auto_421318 ) ) ( not ( = ?auto_421313 ?auto_421314 ) ) ( not ( = ?auto_421313 ?auto_421315 ) ) ( not ( = ?auto_421313 ?auto_421316 ) ) ( not ( = ?auto_421313 ?auto_421317 ) ) ( not ( = ?auto_421313 ?auto_421318 ) ) ( not ( = ?auto_421314 ?auto_421315 ) ) ( not ( = ?auto_421314 ?auto_421316 ) ) ( not ( = ?auto_421314 ?auto_421317 ) ) ( not ( = ?auto_421314 ?auto_421318 ) ) ( not ( = ?auto_421315 ?auto_421316 ) ) ( not ( = ?auto_421315 ?auto_421317 ) ) ( not ( = ?auto_421315 ?auto_421318 ) ) ( not ( = ?auto_421316 ?auto_421317 ) ) ( not ( = ?auto_421316 ?auto_421318 ) ) ( not ( = ?auto_421317 ?auto_421318 ) ) ( ON ?auto_421316 ?auto_421317 ) ( ON ?auto_421315 ?auto_421316 ) ( ON ?auto_421314 ?auto_421315 ) ( ON ?auto_421313 ?auto_421314 ) ( ON ?auto_421312 ?auto_421313 ) ( ON ?auto_421311 ?auto_421312 ) ( ON ?auto_421310 ?auto_421311 ) ( ON ?auto_421309 ?auto_421310 ) ( ON ?auto_421308 ?auto_421309 ) ( CLEAR ?auto_421306 ) ( ON ?auto_421307 ?auto_421308 ) ( CLEAR ?auto_421307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_421305 ?auto_421306 ?auto_421307 )
      ( MAKE-13PILE ?auto_421305 ?auto_421306 ?auto_421307 ?auto_421308 ?auto_421309 ?auto_421310 ?auto_421311 ?auto_421312 ?auto_421313 ?auto_421314 ?auto_421315 ?auto_421316 ?auto_421317 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_421359 - BLOCK
      ?auto_421360 - BLOCK
      ?auto_421361 - BLOCK
      ?auto_421362 - BLOCK
      ?auto_421363 - BLOCK
      ?auto_421364 - BLOCK
      ?auto_421365 - BLOCK
      ?auto_421366 - BLOCK
      ?auto_421367 - BLOCK
      ?auto_421368 - BLOCK
      ?auto_421369 - BLOCK
      ?auto_421370 - BLOCK
      ?auto_421371 - BLOCK
    )
    :vars
    (
      ?auto_421372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421371 ?auto_421372 ) ( ON-TABLE ?auto_421359 ) ( not ( = ?auto_421359 ?auto_421360 ) ) ( not ( = ?auto_421359 ?auto_421361 ) ) ( not ( = ?auto_421359 ?auto_421362 ) ) ( not ( = ?auto_421359 ?auto_421363 ) ) ( not ( = ?auto_421359 ?auto_421364 ) ) ( not ( = ?auto_421359 ?auto_421365 ) ) ( not ( = ?auto_421359 ?auto_421366 ) ) ( not ( = ?auto_421359 ?auto_421367 ) ) ( not ( = ?auto_421359 ?auto_421368 ) ) ( not ( = ?auto_421359 ?auto_421369 ) ) ( not ( = ?auto_421359 ?auto_421370 ) ) ( not ( = ?auto_421359 ?auto_421371 ) ) ( not ( = ?auto_421359 ?auto_421372 ) ) ( not ( = ?auto_421360 ?auto_421361 ) ) ( not ( = ?auto_421360 ?auto_421362 ) ) ( not ( = ?auto_421360 ?auto_421363 ) ) ( not ( = ?auto_421360 ?auto_421364 ) ) ( not ( = ?auto_421360 ?auto_421365 ) ) ( not ( = ?auto_421360 ?auto_421366 ) ) ( not ( = ?auto_421360 ?auto_421367 ) ) ( not ( = ?auto_421360 ?auto_421368 ) ) ( not ( = ?auto_421360 ?auto_421369 ) ) ( not ( = ?auto_421360 ?auto_421370 ) ) ( not ( = ?auto_421360 ?auto_421371 ) ) ( not ( = ?auto_421360 ?auto_421372 ) ) ( not ( = ?auto_421361 ?auto_421362 ) ) ( not ( = ?auto_421361 ?auto_421363 ) ) ( not ( = ?auto_421361 ?auto_421364 ) ) ( not ( = ?auto_421361 ?auto_421365 ) ) ( not ( = ?auto_421361 ?auto_421366 ) ) ( not ( = ?auto_421361 ?auto_421367 ) ) ( not ( = ?auto_421361 ?auto_421368 ) ) ( not ( = ?auto_421361 ?auto_421369 ) ) ( not ( = ?auto_421361 ?auto_421370 ) ) ( not ( = ?auto_421361 ?auto_421371 ) ) ( not ( = ?auto_421361 ?auto_421372 ) ) ( not ( = ?auto_421362 ?auto_421363 ) ) ( not ( = ?auto_421362 ?auto_421364 ) ) ( not ( = ?auto_421362 ?auto_421365 ) ) ( not ( = ?auto_421362 ?auto_421366 ) ) ( not ( = ?auto_421362 ?auto_421367 ) ) ( not ( = ?auto_421362 ?auto_421368 ) ) ( not ( = ?auto_421362 ?auto_421369 ) ) ( not ( = ?auto_421362 ?auto_421370 ) ) ( not ( = ?auto_421362 ?auto_421371 ) ) ( not ( = ?auto_421362 ?auto_421372 ) ) ( not ( = ?auto_421363 ?auto_421364 ) ) ( not ( = ?auto_421363 ?auto_421365 ) ) ( not ( = ?auto_421363 ?auto_421366 ) ) ( not ( = ?auto_421363 ?auto_421367 ) ) ( not ( = ?auto_421363 ?auto_421368 ) ) ( not ( = ?auto_421363 ?auto_421369 ) ) ( not ( = ?auto_421363 ?auto_421370 ) ) ( not ( = ?auto_421363 ?auto_421371 ) ) ( not ( = ?auto_421363 ?auto_421372 ) ) ( not ( = ?auto_421364 ?auto_421365 ) ) ( not ( = ?auto_421364 ?auto_421366 ) ) ( not ( = ?auto_421364 ?auto_421367 ) ) ( not ( = ?auto_421364 ?auto_421368 ) ) ( not ( = ?auto_421364 ?auto_421369 ) ) ( not ( = ?auto_421364 ?auto_421370 ) ) ( not ( = ?auto_421364 ?auto_421371 ) ) ( not ( = ?auto_421364 ?auto_421372 ) ) ( not ( = ?auto_421365 ?auto_421366 ) ) ( not ( = ?auto_421365 ?auto_421367 ) ) ( not ( = ?auto_421365 ?auto_421368 ) ) ( not ( = ?auto_421365 ?auto_421369 ) ) ( not ( = ?auto_421365 ?auto_421370 ) ) ( not ( = ?auto_421365 ?auto_421371 ) ) ( not ( = ?auto_421365 ?auto_421372 ) ) ( not ( = ?auto_421366 ?auto_421367 ) ) ( not ( = ?auto_421366 ?auto_421368 ) ) ( not ( = ?auto_421366 ?auto_421369 ) ) ( not ( = ?auto_421366 ?auto_421370 ) ) ( not ( = ?auto_421366 ?auto_421371 ) ) ( not ( = ?auto_421366 ?auto_421372 ) ) ( not ( = ?auto_421367 ?auto_421368 ) ) ( not ( = ?auto_421367 ?auto_421369 ) ) ( not ( = ?auto_421367 ?auto_421370 ) ) ( not ( = ?auto_421367 ?auto_421371 ) ) ( not ( = ?auto_421367 ?auto_421372 ) ) ( not ( = ?auto_421368 ?auto_421369 ) ) ( not ( = ?auto_421368 ?auto_421370 ) ) ( not ( = ?auto_421368 ?auto_421371 ) ) ( not ( = ?auto_421368 ?auto_421372 ) ) ( not ( = ?auto_421369 ?auto_421370 ) ) ( not ( = ?auto_421369 ?auto_421371 ) ) ( not ( = ?auto_421369 ?auto_421372 ) ) ( not ( = ?auto_421370 ?auto_421371 ) ) ( not ( = ?auto_421370 ?auto_421372 ) ) ( not ( = ?auto_421371 ?auto_421372 ) ) ( ON ?auto_421370 ?auto_421371 ) ( ON ?auto_421369 ?auto_421370 ) ( ON ?auto_421368 ?auto_421369 ) ( ON ?auto_421367 ?auto_421368 ) ( ON ?auto_421366 ?auto_421367 ) ( ON ?auto_421365 ?auto_421366 ) ( ON ?auto_421364 ?auto_421365 ) ( ON ?auto_421363 ?auto_421364 ) ( ON ?auto_421362 ?auto_421363 ) ( ON ?auto_421361 ?auto_421362 ) ( CLEAR ?auto_421359 ) ( ON ?auto_421360 ?auto_421361 ) ( CLEAR ?auto_421360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_421359 ?auto_421360 )
      ( MAKE-13PILE ?auto_421359 ?auto_421360 ?auto_421361 ?auto_421362 ?auto_421363 ?auto_421364 ?auto_421365 ?auto_421366 ?auto_421367 ?auto_421368 ?auto_421369 ?auto_421370 ?auto_421371 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_421413 - BLOCK
      ?auto_421414 - BLOCK
      ?auto_421415 - BLOCK
      ?auto_421416 - BLOCK
      ?auto_421417 - BLOCK
      ?auto_421418 - BLOCK
      ?auto_421419 - BLOCK
      ?auto_421420 - BLOCK
      ?auto_421421 - BLOCK
      ?auto_421422 - BLOCK
      ?auto_421423 - BLOCK
      ?auto_421424 - BLOCK
      ?auto_421425 - BLOCK
    )
    :vars
    (
      ?auto_421426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421425 ?auto_421426 ) ( not ( = ?auto_421413 ?auto_421414 ) ) ( not ( = ?auto_421413 ?auto_421415 ) ) ( not ( = ?auto_421413 ?auto_421416 ) ) ( not ( = ?auto_421413 ?auto_421417 ) ) ( not ( = ?auto_421413 ?auto_421418 ) ) ( not ( = ?auto_421413 ?auto_421419 ) ) ( not ( = ?auto_421413 ?auto_421420 ) ) ( not ( = ?auto_421413 ?auto_421421 ) ) ( not ( = ?auto_421413 ?auto_421422 ) ) ( not ( = ?auto_421413 ?auto_421423 ) ) ( not ( = ?auto_421413 ?auto_421424 ) ) ( not ( = ?auto_421413 ?auto_421425 ) ) ( not ( = ?auto_421413 ?auto_421426 ) ) ( not ( = ?auto_421414 ?auto_421415 ) ) ( not ( = ?auto_421414 ?auto_421416 ) ) ( not ( = ?auto_421414 ?auto_421417 ) ) ( not ( = ?auto_421414 ?auto_421418 ) ) ( not ( = ?auto_421414 ?auto_421419 ) ) ( not ( = ?auto_421414 ?auto_421420 ) ) ( not ( = ?auto_421414 ?auto_421421 ) ) ( not ( = ?auto_421414 ?auto_421422 ) ) ( not ( = ?auto_421414 ?auto_421423 ) ) ( not ( = ?auto_421414 ?auto_421424 ) ) ( not ( = ?auto_421414 ?auto_421425 ) ) ( not ( = ?auto_421414 ?auto_421426 ) ) ( not ( = ?auto_421415 ?auto_421416 ) ) ( not ( = ?auto_421415 ?auto_421417 ) ) ( not ( = ?auto_421415 ?auto_421418 ) ) ( not ( = ?auto_421415 ?auto_421419 ) ) ( not ( = ?auto_421415 ?auto_421420 ) ) ( not ( = ?auto_421415 ?auto_421421 ) ) ( not ( = ?auto_421415 ?auto_421422 ) ) ( not ( = ?auto_421415 ?auto_421423 ) ) ( not ( = ?auto_421415 ?auto_421424 ) ) ( not ( = ?auto_421415 ?auto_421425 ) ) ( not ( = ?auto_421415 ?auto_421426 ) ) ( not ( = ?auto_421416 ?auto_421417 ) ) ( not ( = ?auto_421416 ?auto_421418 ) ) ( not ( = ?auto_421416 ?auto_421419 ) ) ( not ( = ?auto_421416 ?auto_421420 ) ) ( not ( = ?auto_421416 ?auto_421421 ) ) ( not ( = ?auto_421416 ?auto_421422 ) ) ( not ( = ?auto_421416 ?auto_421423 ) ) ( not ( = ?auto_421416 ?auto_421424 ) ) ( not ( = ?auto_421416 ?auto_421425 ) ) ( not ( = ?auto_421416 ?auto_421426 ) ) ( not ( = ?auto_421417 ?auto_421418 ) ) ( not ( = ?auto_421417 ?auto_421419 ) ) ( not ( = ?auto_421417 ?auto_421420 ) ) ( not ( = ?auto_421417 ?auto_421421 ) ) ( not ( = ?auto_421417 ?auto_421422 ) ) ( not ( = ?auto_421417 ?auto_421423 ) ) ( not ( = ?auto_421417 ?auto_421424 ) ) ( not ( = ?auto_421417 ?auto_421425 ) ) ( not ( = ?auto_421417 ?auto_421426 ) ) ( not ( = ?auto_421418 ?auto_421419 ) ) ( not ( = ?auto_421418 ?auto_421420 ) ) ( not ( = ?auto_421418 ?auto_421421 ) ) ( not ( = ?auto_421418 ?auto_421422 ) ) ( not ( = ?auto_421418 ?auto_421423 ) ) ( not ( = ?auto_421418 ?auto_421424 ) ) ( not ( = ?auto_421418 ?auto_421425 ) ) ( not ( = ?auto_421418 ?auto_421426 ) ) ( not ( = ?auto_421419 ?auto_421420 ) ) ( not ( = ?auto_421419 ?auto_421421 ) ) ( not ( = ?auto_421419 ?auto_421422 ) ) ( not ( = ?auto_421419 ?auto_421423 ) ) ( not ( = ?auto_421419 ?auto_421424 ) ) ( not ( = ?auto_421419 ?auto_421425 ) ) ( not ( = ?auto_421419 ?auto_421426 ) ) ( not ( = ?auto_421420 ?auto_421421 ) ) ( not ( = ?auto_421420 ?auto_421422 ) ) ( not ( = ?auto_421420 ?auto_421423 ) ) ( not ( = ?auto_421420 ?auto_421424 ) ) ( not ( = ?auto_421420 ?auto_421425 ) ) ( not ( = ?auto_421420 ?auto_421426 ) ) ( not ( = ?auto_421421 ?auto_421422 ) ) ( not ( = ?auto_421421 ?auto_421423 ) ) ( not ( = ?auto_421421 ?auto_421424 ) ) ( not ( = ?auto_421421 ?auto_421425 ) ) ( not ( = ?auto_421421 ?auto_421426 ) ) ( not ( = ?auto_421422 ?auto_421423 ) ) ( not ( = ?auto_421422 ?auto_421424 ) ) ( not ( = ?auto_421422 ?auto_421425 ) ) ( not ( = ?auto_421422 ?auto_421426 ) ) ( not ( = ?auto_421423 ?auto_421424 ) ) ( not ( = ?auto_421423 ?auto_421425 ) ) ( not ( = ?auto_421423 ?auto_421426 ) ) ( not ( = ?auto_421424 ?auto_421425 ) ) ( not ( = ?auto_421424 ?auto_421426 ) ) ( not ( = ?auto_421425 ?auto_421426 ) ) ( ON ?auto_421424 ?auto_421425 ) ( ON ?auto_421423 ?auto_421424 ) ( ON ?auto_421422 ?auto_421423 ) ( ON ?auto_421421 ?auto_421422 ) ( ON ?auto_421420 ?auto_421421 ) ( ON ?auto_421419 ?auto_421420 ) ( ON ?auto_421418 ?auto_421419 ) ( ON ?auto_421417 ?auto_421418 ) ( ON ?auto_421416 ?auto_421417 ) ( ON ?auto_421415 ?auto_421416 ) ( ON ?auto_421414 ?auto_421415 ) ( ON ?auto_421413 ?auto_421414 ) ( CLEAR ?auto_421413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_421413 )
      ( MAKE-13PILE ?auto_421413 ?auto_421414 ?auto_421415 ?auto_421416 ?auto_421417 ?auto_421418 ?auto_421419 ?auto_421420 ?auto_421421 ?auto_421422 ?auto_421423 ?auto_421424 ?auto_421425 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_421468 - BLOCK
      ?auto_421469 - BLOCK
      ?auto_421470 - BLOCK
      ?auto_421471 - BLOCK
      ?auto_421472 - BLOCK
      ?auto_421473 - BLOCK
      ?auto_421474 - BLOCK
      ?auto_421475 - BLOCK
      ?auto_421476 - BLOCK
      ?auto_421477 - BLOCK
      ?auto_421478 - BLOCK
      ?auto_421479 - BLOCK
      ?auto_421480 - BLOCK
      ?auto_421481 - BLOCK
    )
    :vars
    (
      ?auto_421482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_421480 ) ( ON ?auto_421481 ?auto_421482 ) ( CLEAR ?auto_421481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_421468 ) ( ON ?auto_421469 ?auto_421468 ) ( ON ?auto_421470 ?auto_421469 ) ( ON ?auto_421471 ?auto_421470 ) ( ON ?auto_421472 ?auto_421471 ) ( ON ?auto_421473 ?auto_421472 ) ( ON ?auto_421474 ?auto_421473 ) ( ON ?auto_421475 ?auto_421474 ) ( ON ?auto_421476 ?auto_421475 ) ( ON ?auto_421477 ?auto_421476 ) ( ON ?auto_421478 ?auto_421477 ) ( ON ?auto_421479 ?auto_421478 ) ( ON ?auto_421480 ?auto_421479 ) ( not ( = ?auto_421468 ?auto_421469 ) ) ( not ( = ?auto_421468 ?auto_421470 ) ) ( not ( = ?auto_421468 ?auto_421471 ) ) ( not ( = ?auto_421468 ?auto_421472 ) ) ( not ( = ?auto_421468 ?auto_421473 ) ) ( not ( = ?auto_421468 ?auto_421474 ) ) ( not ( = ?auto_421468 ?auto_421475 ) ) ( not ( = ?auto_421468 ?auto_421476 ) ) ( not ( = ?auto_421468 ?auto_421477 ) ) ( not ( = ?auto_421468 ?auto_421478 ) ) ( not ( = ?auto_421468 ?auto_421479 ) ) ( not ( = ?auto_421468 ?auto_421480 ) ) ( not ( = ?auto_421468 ?auto_421481 ) ) ( not ( = ?auto_421468 ?auto_421482 ) ) ( not ( = ?auto_421469 ?auto_421470 ) ) ( not ( = ?auto_421469 ?auto_421471 ) ) ( not ( = ?auto_421469 ?auto_421472 ) ) ( not ( = ?auto_421469 ?auto_421473 ) ) ( not ( = ?auto_421469 ?auto_421474 ) ) ( not ( = ?auto_421469 ?auto_421475 ) ) ( not ( = ?auto_421469 ?auto_421476 ) ) ( not ( = ?auto_421469 ?auto_421477 ) ) ( not ( = ?auto_421469 ?auto_421478 ) ) ( not ( = ?auto_421469 ?auto_421479 ) ) ( not ( = ?auto_421469 ?auto_421480 ) ) ( not ( = ?auto_421469 ?auto_421481 ) ) ( not ( = ?auto_421469 ?auto_421482 ) ) ( not ( = ?auto_421470 ?auto_421471 ) ) ( not ( = ?auto_421470 ?auto_421472 ) ) ( not ( = ?auto_421470 ?auto_421473 ) ) ( not ( = ?auto_421470 ?auto_421474 ) ) ( not ( = ?auto_421470 ?auto_421475 ) ) ( not ( = ?auto_421470 ?auto_421476 ) ) ( not ( = ?auto_421470 ?auto_421477 ) ) ( not ( = ?auto_421470 ?auto_421478 ) ) ( not ( = ?auto_421470 ?auto_421479 ) ) ( not ( = ?auto_421470 ?auto_421480 ) ) ( not ( = ?auto_421470 ?auto_421481 ) ) ( not ( = ?auto_421470 ?auto_421482 ) ) ( not ( = ?auto_421471 ?auto_421472 ) ) ( not ( = ?auto_421471 ?auto_421473 ) ) ( not ( = ?auto_421471 ?auto_421474 ) ) ( not ( = ?auto_421471 ?auto_421475 ) ) ( not ( = ?auto_421471 ?auto_421476 ) ) ( not ( = ?auto_421471 ?auto_421477 ) ) ( not ( = ?auto_421471 ?auto_421478 ) ) ( not ( = ?auto_421471 ?auto_421479 ) ) ( not ( = ?auto_421471 ?auto_421480 ) ) ( not ( = ?auto_421471 ?auto_421481 ) ) ( not ( = ?auto_421471 ?auto_421482 ) ) ( not ( = ?auto_421472 ?auto_421473 ) ) ( not ( = ?auto_421472 ?auto_421474 ) ) ( not ( = ?auto_421472 ?auto_421475 ) ) ( not ( = ?auto_421472 ?auto_421476 ) ) ( not ( = ?auto_421472 ?auto_421477 ) ) ( not ( = ?auto_421472 ?auto_421478 ) ) ( not ( = ?auto_421472 ?auto_421479 ) ) ( not ( = ?auto_421472 ?auto_421480 ) ) ( not ( = ?auto_421472 ?auto_421481 ) ) ( not ( = ?auto_421472 ?auto_421482 ) ) ( not ( = ?auto_421473 ?auto_421474 ) ) ( not ( = ?auto_421473 ?auto_421475 ) ) ( not ( = ?auto_421473 ?auto_421476 ) ) ( not ( = ?auto_421473 ?auto_421477 ) ) ( not ( = ?auto_421473 ?auto_421478 ) ) ( not ( = ?auto_421473 ?auto_421479 ) ) ( not ( = ?auto_421473 ?auto_421480 ) ) ( not ( = ?auto_421473 ?auto_421481 ) ) ( not ( = ?auto_421473 ?auto_421482 ) ) ( not ( = ?auto_421474 ?auto_421475 ) ) ( not ( = ?auto_421474 ?auto_421476 ) ) ( not ( = ?auto_421474 ?auto_421477 ) ) ( not ( = ?auto_421474 ?auto_421478 ) ) ( not ( = ?auto_421474 ?auto_421479 ) ) ( not ( = ?auto_421474 ?auto_421480 ) ) ( not ( = ?auto_421474 ?auto_421481 ) ) ( not ( = ?auto_421474 ?auto_421482 ) ) ( not ( = ?auto_421475 ?auto_421476 ) ) ( not ( = ?auto_421475 ?auto_421477 ) ) ( not ( = ?auto_421475 ?auto_421478 ) ) ( not ( = ?auto_421475 ?auto_421479 ) ) ( not ( = ?auto_421475 ?auto_421480 ) ) ( not ( = ?auto_421475 ?auto_421481 ) ) ( not ( = ?auto_421475 ?auto_421482 ) ) ( not ( = ?auto_421476 ?auto_421477 ) ) ( not ( = ?auto_421476 ?auto_421478 ) ) ( not ( = ?auto_421476 ?auto_421479 ) ) ( not ( = ?auto_421476 ?auto_421480 ) ) ( not ( = ?auto_421476 ?auto_421481 ) ) ( not ( = ?auto_421476 ?auto_421482 ) ) ( not ( = ?auto_421477 ?auto_421478 ) ) ( not ( = ?auto_421477 ?auto_421479 ) ) ( not ( = ?auto_421477 ?auto_421480 ) ) ( not ( = ?auto_421477 ?auto_421481 ) ) ( not ( = ?auto_421477 ?auto_421482 ) ) ( not ( = ?auto_421478 ?auto_421479 ) ) ( not ( = ?auto_421478 ?auto_421480 ) ) ( not ( = ?auto_421478 ?auto_421481 ) ) ( not ( = ?auto_421478 ?auto_421482 ) ) ( not ( = ?auto_421479 ?auto_421480 ) ) ( not ( = ?auto_421479 ?auto_421481 ) ) ( not ( = ?auto_421479 ?auto_421482 ) ) ( not ( = ?auto_421480 ?auto_421481 ) ) ( not ( = ?auto_421480 ?auto_421482 ) ) ( not ( = ?auto_421481 ?auto_421482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_421481 ?auto_421482 )
      ( !STACK ?auto_421481 ?auto_421480 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_421526 - BLOCK
      ?auto_421527 - BLOCK
      ?auto_421528 - BLOCK
      ?auto_421529 - BLOCK
      ?auto_421530 - BLOCK
      ?auto_421531 - BLOCK
      ?auto_421532 - BLOCK
      ?auto_421533 - BLOCK
      ?auto_421534 - BLOCK
      ?auto_421535 - BLOCK
      ?auto_421536 - BLOCK
      ?auto_421537 - BLOCK
      ?auto_421538 - BLOCK
      ?auto_421539 - BLOCK
    )
    :vars
    (
      ?auto_421540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421539 ?auto_421540 ) ( ON-TABLE ?auto_421526 ) ( ON ?auto_421527 ?auto_421526 ) ( ON ?auto_421528 ?auto_421527 ) ( ON ?auto_421529 ?auto_421528 ) ( ON ?auto_421530 ?auto_421529 ) ( ON ?auto_421531 ?auto_421530 ) ( ON ?auto_421532 ?auto_421531 ) ( ON ?auto_421533 ?auto_421532 ) ( ON ?auto_421534 ?auto_421533 ) ( ON ?auto_421535 ?auto_421534 ) ( ON ?auto_421536 ?auto_421535 ) ( ON ?auto_421537 ?auto_421536 ) ( not ( = ?auto_421526 ?auto_421527 ) ) ( not ( = ?auto_421526 ?auto_421528 ) ) ( not ( = ?auto_421526 ?auto_421529 ) ) ( not ( = ?auto_421526 ?auto_421530 ) ) ( not ( = ?auto_421526 ?auto_421531 ) ) ( not ( = ?auto_421526 ?auto_421532 ) ) ( not ( = ?auto_421526 ?auto_421533 ) ) ( not ( = ?auto_421526 ?auto_421534 ) ) ( not ( = ?auto_421526 ?auto_421535 ) ) ( not ( = ?auto_421526 ?auto_421536 ) ) ( not ( = ?auto_421526 ?auto_421537 ) ) ( not ( = ?auto_421526 ?auto_421538 ) ) ( not ( = ?auto_421526 ?auto_421539 ) ) ( not ( = ?auto_421526 ?auto_421540 ) ) ( not ( = ?auto_421527 ?auto_421528 ) ) ( not ( = ?auto_421527 ?auto_421529 ) ) ( not ( = ?auto_421527 ?auto_421530 ) ) ( not ( = ?auto_421527 ?auto_421531 ) ) ( not ( = ?auto_421527 ?auto_421532 ) ) ( not ( = ?auto_421527 ?auto_421533 ) ) ( not ( = ?auto_421527 ?auto_421534 ) ) ( not ( = ?auto_421527 ?auto_421535 ) ) ( not ( = ?auto_421527 ?auto_421536 ) ) ( not ( = ?auto_421527 ?auto_421537 ) ) ( not ( = ?auto_421527 ?auto_421538 ) ) ( not ( = ?auto_421527 ?auto_421539 ) ) ( not ( = ?auto_421527 ?auto_421540 ) ) ( not ( = ?auto_421528 ?auto_421529 ) ) ( not ( = ?auto_421528 ?auto_421530 ) ) ( not ( = ?auto_421528 ?auto_421531 ) ) ( not ( = ?auto_421528 ?auto_421532 ) ) ( not ( = ?auto_421528 ?auto_421533 ) ) ( not ( = ?auto_421528 ?auto_421534 ) ) ( not ( = ?auto_421528 ?auto_421535 ) ) ( not ( = ?auto_421528 ?auto_421536 ) ) ( not ( = ?auto_421528 ?auto_421537 ) ) ( not ( = ?auto_421528 ?auto_421538 ) ) ( not ( = ?auto_421528 ?auto_421539 ) ) ( not ( = ?auto_421528 ?auto_421540 ) ) ( not ( = ?auto_421529 ?auto_421530 ) ) ( not ( = ?auto_421529 ?auto_421531 ) ) ( not ( = ?auto_421529 ?auto_421532 ) ) ( not ( = ?auto_421529 ?auto_421533 ) ) ( not ( = ?auto_421529 ?auto_421534 ) ) ( not ( = ?auto_421529 ?auto_421535 ) ) ( not ( = ?auto_421529 ?auto_421536 ) ) ( not ( = ?auto_421529 ?auto_421537 ) ) ( not ( = ?auto_421529 ?auto_421538 ) ) ( not ( = ?auto_421529 ?auto_421539 ) ) ( not ( = ?auto_421529 ?auto_421540 ) ) ( not ( = ?auto_421530 ?auto_421531 ) ) ( not ( = ?auto_421530 ?auto_421532 ) ) ( not ( = ?auto_421530 ?auto_421533 ) ) ( not ( = ?auto_421530 ?auto_421534 ) ) ( not ( = ?auto_421530 ?auto_421535 ) ) ( not ( = ?auto_421530 ?auto_421536 ) ) ( not ( = ?auto_421530 ?auto_421537 ) ) ( not ( = ?auto_421530 ?auto_421538 ) ) ( not ( = ?auto_421530 ?auto_421539 ) ) ( not ( = ?auto_421530 ?auto_421540 ) ) ( not ( = ?auto_421531 ?auto_421532 ) ) ( not ( = ?auto_421531 ?auto_421533 ) ) ( not ( = ?auto_421531 ?auto_421534 ) ) ( not ( = ?auto_421531 ?auto_421535 ) ) ( not ( = ?auto_421531 ?auto_421536 ) ) ( not ( = ?auto_421531 ?auto_421537 ) ) ( not ( = ?auto_421531 ?auto_421538 ) ) ( not ( = ?auto_421531 ?auto_421539 ) ) ( not ( = ?auto_421531 ?auto_421540 ) ) ( not ( = ?auto_421532 ?auto_421533 ) ) ( not ( = ?auto_421532 ?auto_421534 ) ) ( not ( = ?auto_421532 ?auto_421535 ) ) ( not ( = ?auto_421532 ?auto_421536 ) ) ( not ( = ?auto_421532 ?auto_421537 ) ) ( not ( = ?auto_421532 ?auto_421538 ) ) ( not ( = ?auto_421532 ?auto_421539 ) ) ( not ( = ?auto_421532 ?auto_421540 ) ) ( not ( = ?auto_421533 ?auto_421534 ) ) ( not ( = ?auto_421533 ?auto_421535 ) ) ( not ( = ?auto_421533 ?auto_421536 ) ) ( not ( = ?auto_421533 ?auto_421537 ) ) ( not ( = ?auto_421533 ?auto_421538 ) ) ( not ( = ?auto_421533 ?auto_421539 ) ) ( not ( = ?auto_421533 ?auto_421540 ) ) ( not ( = ?auto_421534 ?auto_421535 ) ) ( not ( = ?auto_421534 ?auto_421536 ) ) ( not ( = ?auto_421534 ?auto_421537 ) ) ( not ( = ?auto_421534 ?auto_421538 ) ) ( not ( = ?auto_421534 ?auto_421539 ) ) ( not ( = ?auto_421534 ?auto_421540 ) ) ( not ( = ?auto_421535 ?auto_421536 ) ) ( not ( = ?auto_421535 ?auto_421537 ) ) ( not ( = ?auto_421535 ?auto_421538 ) ) ( not ( = ?auto_421535 ?auto_421539 ) ) ( not ( = ?auto_421535 ?auto_421540 ) ) ( not ( = ?auto_421536 ?auto_421537 ) ) ( not ( = ?auto_421536 ?auto_421538 ) ) ( not ( = ?auto_421536 ?auto_421539 ) ) ( not ( = ?auto_421536 ?auto_421540 ) ) ( not ( = ?auto_421537 ?auto_421538 ) ) ( not ( = ?auto_421537 ?auto_421539 ) ) ( not ( = ?auto_421537 ?auto_421540 ) ) ( not ( = ?auto_421538 ?auto_421539 ) ) ( not ( = ?auto_421538 ?auto_421540 ) ) ( not ( = ?auto_421539 ?auto_421540 ) ) ( CLEAR ?auto_421537 ) ( ON ?auto_421538 ?auto_421539 ) ( CLEAR ?auto_421538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_421526 ?auto_421527 ?auto_421528 ?auto_421529 ?auto_421530 ?auto_421531 ?auto_421532 ?auto_421533 ?auto_421534 ?auto_421535 ?auto_421536 ?auto_421537 ?auto_421538 )
      ( MAKE-14PILE ?auto_421526 ?auto_421527 ?auto_421528 ?auto_421529 ?auto_421530 ?auto_421531 ?auto_421532 ?auto_421533 ?auto_421534 ?auto_421535 ?auto_421536 ?auto_421537 ?auto_421538 ?auto_421539 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_421584 - BLOCK
      ?auto_421585 - BLOCK
      ?auto_421586 - BLOCK
      ?auto_421587 - BLOCK
      ?auto_421588 - BLOCK
      ?auto_421589 - BLOCK
      ?auto_421590 - BLOCK
      ?auto_421591 - BLOCK
      ?auto_421592 - BLOCK
      ?auto_421593 - BLOCK
      ?auto_421594 - BLOCK
      ?auto_421595 - BLOCK
      ?auto_421596 - BLOCK
      ?auto_421597 - BLOCK
    )
    :vars
    (
      ?auto_421598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421597 ?auto_421598 ) ( ON-TABLE ?auto_421584 ) ( ON ?auto_421585 ?auto_421584 ) ( ON ?auto_421586 ?auto_421585 ) ( ON ?auto_421587 ?auto_421586 ) ( ON ?auto_421588 ?auto_421587 ) ( ON ?auto_421589 ?auto_421588 ) ( ON ?auto_421590 ?auto_421589 ) ( ON ?auto_421591 ?auto_421590 ) ( ON ?auto_421592 ?auto_421591 ) ( ON ?auto_421593 ?auto_421592 ) ( ON ?auto_421594 ?auto_421593 ) ( not ( = ?auto_421584 ?auto_421585 ) ) ( not ( = ?auto_421584 ?auto_421586 ) ) ( not ( = ?auto_421584 ?auto_421587 ) ) ( not ( = ?auto_421584 ?auto_421588 ) ) ( not ( = ?auto_421584 ?auto_421589 ) ) ( not ( = ?auto_421584 ?auto_421590 ) ) ( not ( = ?auto_421584 ?auto_421591 ) ) ( not ( = ?auto_421584 ?auto_421592 ) ) ( not ( = ?auto_421584 ?auto_421593 ) ) ( not ( = ?auto_421584 ?auto_421594 ) ) ( not ( = ?auto_421584 ?auto_421595 ) ) ( not ( = ?auto_421584 ?auto_421596 ) ) ( not ( = ?auto_421584 ?auto_421597 ) ) ( not ( = ?auto_421584 ?auto_421598 ) ) ( not ( = ?auto_421585 ?auto_421586 ) ) ( not ( = ?auto_421585 ?auto_421587 ) ) ( not ( = ?auto_421585 ?auto_421588 ) ) ( not ( = ?auto_421585 ?auto_421589 ) ) ( not ( = ?auto_421585 ?auto_421590 ) ) ( not ( = ?auto_421585 ?auto_421591 ) ) ( not ( = ?auto_421585 ?auto_421592 ) ) ( not ( = ?auto_421585 ?auto_421593 ) ) ( not ( = ?auto_421585 ?auto_421594 ) ) ( not ( = ?auto_421585 ?auto_421595 ) ) ( not ( = ?auto_421585 ?auto_421596 ) ) ( not ( = ?auto_421585 ?auto_421597 ) ) ( not ( = ?auto_421585 ?auto_421598 ) ) ( not ( = ?auto_421586 ?auto_421587 ) ) ( not ( = ?auto_421586 ?auto_421588 ) ) ( not ( = ?auto_421586 ?auto_421589 ) ) ( not ( = ?auto_421586 ?auto_421590 ) ) ( not ( = ?auto_421586 ?auto_421591 ) ) ( not ( = ?auto_421586 ?auto_421592 ) ) ( not ( = ?auto_421586 ?auto_421593 ) ) ( not ( = ?auto_421586 ?auto_421594 ) ) ( not ( = ?auto_421586 ?auto_421595 ) ) ( not ( = ?auto_421586 ?auto_421596 ) ) ( not ( = ?auto_421586 ?auto_421597 ) ) ( not ( = ?auto_421586 ?auto_421598 ) ) ( not ( = ?auto_421587 ?auto_421588 ) ) ( not ( = ?auto_421587 ?auto_421589 ) ) ( not ( = ?auto_421587 ?auto_421590 ) ) ( not ( = ?auto_421587 ?auto_421591 ) ) ( not ( = ?auto_421587 ?auto_421592 ) ) ( not ( = ?auto_421587 ?auto_421593 ) ) ( not ( = ?auto_421587 ?auto_421594 ) ) ( not ( = ?auto_421587 ?auto_421595 ) ) ( not ( = ?auto_421587 ?auto_421596 ) ) ( not ( = ?auto_421587 ?auto_421597 ) ) ( not ( = ?auto_421587 ?auto_421598 ) ) ( not ( = ?auto_421588 ?auto_421589 ) ) ( not ( = ?auto_421588 ?auto_421590 ) ) ( not ( = ?auto_421588 ?auto_421591 ) ) ( not ( = ?auto_421588 ?auto_421592 ) ) ( not ( = ?auto_421588 ?auto_421593 ) ) ( not ( = ?auto_421588 ?auto_421594 ) ) ( not ( = ?auto_421588 ?auto_421595 ) ) ( not ( = ?auto_421588 ?auto_421596 ) ) ( not ( = ?auto_421588 ?auto_421597 ) ) ( not ( = ?auto_421588 ?auto_421598 ) ) ( not ( = ?auto_421589 ?auto_421590 ) ) ( not ( = ?auto_421589 ?auto_421591 ) ) ( not ( = ?auto_421589 ?auto_421592 ) ) ( not ( = ?auto_421589 ?auto_421593 ) ) ( not ( = ?auto_421589 ?auto_421594 ) ) ( not ( = ?auto_421589 ?auto_421595 ) ) ( not ( = ?auto_421589 ?auto_421596 ) ) ( not ( = ?auto_421589 ?auto_421597 ) ) ( not ( = ?auto_421589 ?auto_421598 ) ) ( not ( = ?auto_421590 ?auto_421591 ) ) ( not ( = ?auto_421590 ?auto_421592 ) ) ( not ( = ?auto_421590 ?auto_421593 ) ) ( not ( = ?auto_421590 ?auto_421594 ) ) ( not ( = ?auto_421590 ?auto_421595 ) ) ( not ( = ?auto_421590 ?auto_421596 ) ) ( not ( = ?auto_421590 ?auto_421597 ) ) ( not ( = ?auto_421590 ?auto_421598 ) ) ( not ( = ?auto_421591 ?auto_421592 ) ) ( not ( = ?auto_421591 ?auto_421593 ) ) ( not ( = ?auto_421591 ?auto_421594 ) ) ( not ( = ?auto_421591 ?auto_421595 ) ) ( not ( = ?auto_421591 ?auto_421596 ) ) ( not ( = ?auto_421591 ?auto_421597 ) ) ( not ( = ?auto_421591 ?auto_421598 ) ) ( not ( = ?auto_421592 ?auto_421593 ) ) ( not ( = ?auto_421592 ?auto_421594 ) ) ( not ( = ?auto_421592 ?auto_421595 ) ) ( not ( = ?auto_421592 ?auto_421596 ) ) ( not ( = ?auto_421592 ?auto_421597 ) ) ( not ( = ?auto_421592 ?auto_421598 ) ) ( not ( = ?auto_421593 ?auto_421594 ) ) ( not ( = ?auto_421593 ?auto_421595 ) ) ( not ( = ?auto_421593 ?auto_421596 ) ) ( not ( = ?auto_421593 ?auto_421597 ) ) ( not ( = ?auto_421593 ?auto_421598 ) ) ( not ( = ?auto_421594 ?auto_421595 ) ) ( not ( = ?auto_421594 ?auto_421596 ) ) ( not ( = ?auto_421594 ?auto_421597 ) ) ( not ( = ?auto_421594 ?auto_421598 ) ) ( not ( = ?auto_421595 ?auto_421596 ) ) ( not ( = ?auto_421595 ?auto_421597 ) ) ( not ( = ?auto_421595 ?auto_421598 ) ) ( not ( = ?auto_421596 ?auto_421597 ) ) ( not ( = ?auto_421596 ?auto_421598 ) ) ( not ( = ?auto_421597 ?auto_421598 ) ) ( ON ?auto_421596 ?auto_421597 ) ( CLEAR ?auto_421594 ) ( ON ?auto_421595 ?auto_421596 ) ( CLEAR ?auto_421595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_421584 ?auto_421585 ?auto_421586 ?auto_421587 ?auto_421588 ?auto_421589 ?auto_421590 ?auto_421591 ?auto_421592 ?auto_421593 ?auto_421594 ?auto_421595 )
      ( MAKE-14PILE ?auto_421584 ?auto_421585 ?auto_421586 ?auto_421587 ?auto_421588 ?auto_421589 ?auto_421590 ?auto_421591 ?auto_421592 ?auto_421593 ?auto_421594 ?auto_421595 ?auto_421596 ?auto_421597 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_421642 - BLOCK
      ?auto_421643 - BLOCK
      ?auto_421644 - BLOCK
      ?auto_421645 - BLOCK
      ?auto_421646 - BLOCK
      ?auto_421647 - BLOCK
      ?auto_421648 - BLOCK
      ?auto_421649 - BLOCK
      ?auto_421650 - BLOCK
      ?auto_421651 - BLOCK
      ?auto_421652 - BLOCK
      ?auto_421653 - BLOCK
      ?auto_421654 - BLOCK
      ?auto_421655 - BLOCK
    )
    :vars
    (
      ?auto_421656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421655 ?auto_421656 ) ( ON-TABLE ?auto_421642 ) ( ON ?auto_421643 ?auto_421642 ) ( ON ?auto_421644 ?auto_421643 ) ( ON ?auto_421645 ?auto_421644 ) ( ON ?auto_421646 ?auto_421645 ) ( ON ?auto_421647 ?auto_421646 ) ( ON ?auto_421648 ?auto_421647 ) ( ON ?auto_421649 ?auto_421648 ) ( ON ?auto_421650 ?auto_421649 ) ( ON ?auto_421651 ?auto_421650 ) ( not ( = ?auto_421642 ?auto_421643 ) ) ( not ( = ?auto_421642 ?auto_421644 ) ) ( not ( = ?auto_421642 ?auto_421645 ) ) ( not ( = ?auto_421642 ?auto_421646 ) ) ( not ( = ?auto_421642 ?auto_421647 ) ) ( not ( = ?auto_421642 ?auto_421648 ) ) ( not ( = ?auto_421642 ?auto_421649 ) ) ( not ( = ?auto_421642 ?auto_421650 ) ) ( not ( = ?auto_421642 ?auto_421651 ) ) ( not ( = ?auto_421642 ?auto_421652 ) ) ( not ( = ?auto_421642 ?auto_421653 ) ) ( not ( = ?auto_421642 ?auto_421654 ) ) ( not ( = ?auto_421642 ?auto_421655 ) ) ( not ( = ?auto_421642 ?auto_421656 ) ) ( not ( = ?auto_421643 ?auto_421644 ) ) ( not ( = ?auto_421643 ?auto_421645 ) ) ( not ( = ?auto_421643 ?auto_421646 ) ) ( not ( = ?auto_421643 ?auto_421647 ) ) ( not ( = ?auto_421643 ?auto_421648 ) ) ( not ( = ?auto_421643 ?auto_421649 ) ) ( not ( = ?auto_421643 ?auto_421650 ) ) ( not ( = ?auto_421643 ?auto_421651 ) ) ( not ( = ?auto_421643 ?auto_421652 ) ) ( not ( = ?auto_421643 ?auto_421653 ) ) ( not ( = ?auto_421643 ?auto_421654 ) ) ( not ( = ?auto_421643 ?auto_421655 ) ) ( not ( = ?auto_421643 ?auto_421656 ) ) ( not ( = ?auto_421644 ?auto_421645 ) ) ( not ( = ?auto_421644 ?auto_421646 ) ) ( not ( = ?auto_421644 ?auto_421647 ) ) ( not ( = ?auto_421644 ?auto_421648 ) ) ( not ( = ?auto_421644 ?auto_421649 ) ) ( not ( = ?auto_421644 ?auto_421650 ) ) ( not ( = ?auto_421644 ?auto_421651 ) ) ( not ( = ?auto_421644 ?auto_421652 ) ) ( not ( = ?auto_421644 ?auto_421653 ) ) ( not ( = ?auto_421644 ?auto_421654 ) ) ( not ( = ?auto_421644 ?auto_421655 ) ) ( not ( = ?auto_421644 ?auto_421656 ) ) ( not ( = ?auto_421645 ?auto_421646 ) ) ( not ( = ?auto_421645 ?auto_421647 ) ) ( not ( = ?auto_421645 ?auto_421648 ) ) ( not ( = ?auto_421645 ?auto_421649 ) ) ( not ( = ?auto_421645 ?auto_421650 ) ) ( not ( = ?auto_421645 ?auto_421651 ) ) ( not ( = ?auto_421645 ?auto_421652 ) ) ( not ( = ?auto_421645 ?auto_421653 ) ) ( not ( = ?auto_421645 ?auto_421654 ) ) ( not ( = ?auto_421645 ?auto_421655 ) ) ( not ( = ?auto_421645 ?auto_421656 ) ) ( not ( = ?auto_421646 ?auto_421647 ) ) ( not ( = ?auto_421646 ?auto_421648 ) ) ( not ( = ?auto_421646 ?auto_421649 ) ) ( not ( = ?auto_421646 ?auto_421650 ) ) ( not ( = ?auto_421646 ?auto_421651 ) ) ( not ( = ?auto_421646 ?auto_421652 ) ) ( not ( = ?auto_421646 ?auto_421653 ) ) ( not ( = ?auto_421646 ?auto_421654 ) ) ( not ( = ?auto_421646 ?auto_421655 ) ) ( not ( = ?auto_421646 ?auto_421656 ) ) ( not ( = ?auto_421647 ?auto_421648 ) ) ( not ( = ?auto_421647 ?auto_421649 ) ) ( not ( = ?auto_421647 ?auto_421650 ) ) ( not ( = ?auto_421647 ?auto_421651 ) ) ( not ( = ?auto_421647 ?auto_421652 ) ) ( not ( = ?auto_421647 ?auto_421653 ) ) ( not ( = ?auto_421647 ?auto_421654 ) ) ( not ( = ?auto_421647 ?auto_421655 ) ) ( not ( = ?auto_421647 ?auto_421656 ) ) ( not ( = ?auto_421648 ?auto_421649 ) ) ( not ( = ?auto_421648 ?auto_421650 ) ) ( not ( = ?auto_421648 ?auto_421651 ) ) ( not ( = ?auto_421648 ?auto_421652 ) ) ( not ( = ?auto_421648 ?auto_421653 ) ) ( not ( = ?auto_421648 ?auto_421654 ) ) ( not ( = ?auto_421648 ?auto_421655 ) ) ( not ( = ?auto_421648 ?auto_421656 ) ) ( not ( = ?auto_421649 ?auto_421650 ) ) ( not ( = ?auto_421649 ?auto_421651 ) ) ( not ( = ?auto_421649 ?auto_421652 ) ) ( not ( = ?auto_421649 ?auto_421653 ) ) ( not ( = ?auto_421649 ?auto_421654 ) ) ( not ( = ?auto_421649 ?auto_421655 ) ) ( not ( = ?auto_421649 ?auto_421656 ) ) ( not ( = ?auto_421650 ?auto_421651 ) ) ( not ( = ?auto_421650 ?auto_421652 ) ) ( not ( = ?auto_421650 ?auto_421653 ) ) ( not ( = ?auto_421650 ?auto_421654 ) ) ( not ( = ?auto_421650 ?auto_421655 ) ) ( not ( = ?auto_421650 ?auto_421656 ) ) ( not ( = ?auto_421651 ?auto_421652 ) ) ( not ( = ?auto_421651 ?auto_421653 ) ) ( not ( = ?auto_421651 ?auto_421654 ) ) ( not ( = ?auto_421651 ?auto_421655 ) ) ( not ( = ?auto_421651 ?auto_421656 ) ) ( not ( = ?auto_421652 ?auto_421653 ) ) ( not ( = ?auto_421652 ?auto_421654 ) ) ( not ( = ?auto_421652 ?auto_421655 ) ) ( not ( = ?auto_421652 ?auto_421656 ) ) ( not ( = ?auto_421653 ?auto_421654 ) ) ( not ( = ?auto_421653 ?auto_421655 ) ) ( not ( = ?auto_421653 ?auto_421656 ) ) ( not ( = ?auto_421654 ?auto_421655 ) ) ( not ( = ?auto_421654 ?auto_421656 ) ) ( not ( = ?auto_421655 ?auto_421656 ) ) ( ON ?auto_421654 ?auto_421655 ) ( ON ?auto_421653 ?auto_421654 ) ( CLEAR ?auto_421651 ) ( ON ?auto_421652 ?auto_421653 ) ( CLEAR ?auto_421652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_421642 ?auto_421643 ?auto_421644 ?auto_421645 ?auto_421646 ?auto_421647 ?auto_421648 ?auto_421649 ?auto_421650 ?auto_421651 ?auto_421652 )
      ( MAKE-14PILE ?auto_421642 ?auto_421643 ?auto_421644 ?auto_421645 ?auto_421646 ?auto_421647 ?auto_421648 ?auto_421649 ?auto_421650 ?auto_421651 ?auto_421652 ?auto_421653 ?auto_421654 ?auto_421655 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_421700 - BLOCK
      ?auto_421701 - BLOCK
      ?auto_421702 - BLOCK
      ?auto_421703 - BLOCK
      ?auto_421704 - BLOCK
      ?auto_421705 - BLOCK
      ?auto_421706 - BLOCK
      ?auto_421707 - BLOCK
      ?auto_421708 - BLOCK
      ?auto_421709 - BLOCK
      ?auto_421710 - BLOCK
      ?auto_421711 - BLOCK
      ?auto_421712 - BLOCK
      ?auto_421713 - BLOCK
    )
    :vars
    (
      ?auto_421714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421713 ?auto_421714 ) ( ON-TABLE ?auto_421700 ) ( ON ?auto_421701 ?auto_421700 ) ( ON ?auto_421702 ?auto_421701 ) ( ON ?auto_421703 ?auto_421702 ) ( ON ?auto_421704 ?auto_421703 ) ( ON ?auto_421705 ?auto_421704 ) ( ON ?auto_421706 ?auto_421705 ) ( ON ?auto_421707 ?auto_421706 ) ( ON ?auto_421708 ?auto_421707 ) ( not ( = ?auto_421700 ?auto_421701 ) ) ( not ( = ?auto_421700 ?auto_421702 ) ) ( not ( = ?auto_421700 ?auto_421703 ) ) ( not ( = ?auto_421700 ?auto_421704 ) ) ( not ( = ?auto_421700 ?auto_421705 ) ) ( not ( = ?auto_421700 ?auto_421706 ) ) ( not ( = ?auto_421700 ?auto_421707 ) ) ( not ( = ?auto_421700 ?auto_421708 ) ) ( not ( = ?auto_421700 ?auto_421709 ) ) ( not ( = ?auto_421700 ?auto_421710 ) ) ( not ( = ?auto_421700 ?auto_421711 ) ) ( not ( = ?auto_421700 ?auto_421712 ) ) ( not ( = ?auto_421700 ?auto_421713 ) ) ( not ( = ?auto_421700 ?auto_421714 ) ) ( not ( = ?auto_421701 ?auto_421702 ) ) ( not ( = ?auto_421701 ?auto_421703 ) ) ( not ( = ?auto_421701 ?auto_421704 ) ) ( not ( = ?auto_421701 ?auto_421705 ) ) ( not ( = ?auto_421701 ?auto_421706 ) ) ( not ( = ?auto_421701 ?auto_421707 ) ) ( not ( = ?auto_421701 ?auto_421708 ) ) ( not ( = ?auto_421701 ?auto_421709 ) ) ( not ( = ?auto_421701 ?auto_421710 ) ) ( not ( = ?auto_421701 ?auto_421711 ) ) ( not ( = ?auto_421701 ?auto_421712 ) ) ( not ( = ?auto_421701 ?auto_421713 ) ) ( not ( = ?auto_421701 ?auto_421714 ) ) ( not ( = ?auto_421702 ?auto_421703 ) ) ( not ( = ?auto_421702 ?auto_421704 ) ) ( not ( = ?auto_421702 ?auto_421705 ) ) ( not ( = ?auto_421702 ?auto_421706 ) ) ( not ( = ?auto_421702 ?auto_421707 ) ) ( not ( = ?auto_421702 ?auto_421708 ) ) ( not ( = ?auto_421702 ?auto_421709 ) ) ( not ( = ?auto_421702 ?auto_421710 ) ) ( not ( = ?auto_421702 ?auto_421711 ) ) ( not ( = ?auto_421702 ?auto_421712 ) ) ( not ( = ?auto_421702 ?auto_421713 ) ) ( not ( = ?auto_421702 ?auto_421714 ) ) ( not ( = ?auto_421703 ?auto_421704 ) ) ( not ( = ?auto_421703 ?auto_421705 ) ) ( not ( = ?auto_421703 ?auto_421706 ) ) ( not ( = ?auto_421703 ?auto_421707 ) ) ( not ( = ?auto_421703 ?auto_421708 ) ) ( not ( = ?auto_421703 ?auto_421709 ) ) ( not ( = ?auto_421703 ?auto_421710 ) ) ( not ( = ?auto_421703 ?auto_421711 ) ) ( not ( = ?auto_421703 ?auto_421712 ) ) ( not ( = ?auto_421703 ?auto_421713 ) ) ( not ( = ?auto_421703 ?auto_421714 ) ) ( not ( = ?auto_421704 ?auto_421705 ) ) ( not ( = ?auto_421704 ?auto_421706 ) ) ( not ( = ?auto_421704 ?auto_421707 ) ) ( not ( = ?auto_421704 ?auto_421708 ) ) ( not ( = ?auto_421704 ?auto_421709 ) ) ( not ( = ?auto_421704 ?auto_421710 ) ) ( not ( = ?auto_421704 ?auto_421711 ) ) ( not ( = ?auto_421704 ?auto_421712 ) ) ( not ( = ?auto_421704 ?auto_421713 ) ) ( not ( = ?auto_421704 ?auto_421714 ) ) ( not ( = ?auto_421705 ?auto_421706 ) ) ( not ( = ?auto_421705 ?auto_421707 ) ) ( not ( = ?auto_421705 ?auto_421708 ) ) ( not ( = ?auto_421705 ?auto_421709 ) ) ( not ( = ?auto_421705 ?auto_421710 ) ) ( not ( = ?auto_421705 ?auto_421711 ) ) ( not ( = ?auto_421705 ?auto_421712 ) ) ( not ( = ?auto_421705 ?auto_421713 ) ) ( not ( = ?auto_421705 ?auto_421714 ) ) ( not ( = ?auto_421706 ?auto_421707 ) ) ( not ( = ?auto_421706 ?auto_421708 ) ) ( not ( = ?auto_421706 ?auto_421709 ) ) ( not ( = ?auto_421706 ?auto_421710 ) ) ( not ( = ?auto_421706 ?auto_421711 ) ) ( not ( = ?auto_421706 ?auto_421712 ) ) ( not ( = ?auto_421706 ?auto_421713 ) ) ( not ( = ?auto_421706 ?auto_421714 ) ) ( not ( = ?auto_421707 ?auto_421708 ) ) ( not ( = ?auto_421707 ?auto_421709 ) ) ( not ( = ?auto_421707 ?auto_421710 ) ) ( not ( = ?auto_421707 ?auto_421711 ) ) ( not ( = ?auto_421707 ?auto_421712 ) ) ( not ( = ?auto_421707 ?auto_421713 ) ) ( not ( = ?auto_421707 ?auto_421714 ) ) ( not ( = ?auto_421708 ?auto_421709 ) ) ( not ( = ?auto_421708 ?auto_421710 ) ) ( not ( = ?auto_421708 ?auto_421711 ) ) ( not ( = ?auto_421708 ?auto_421712 ) ) ( not ( = ?auto_421708 ?auto_421713 ) ) ( not ( = ?auto_421708 ?auto_421714 ) ) ( not ( = ?auto_421709 ?auto_421710 ) ) ( not ( = ?auto_421709 ?auto_421711 ) ) ( not ( = ?auto_421709 ?auto_421712 ) ) ( not ( = ?auto_421709 ?auto_421713 ) ) ( not ( = ?auto_421709 ?auto_421714 ) ) ( not ( = ?auto_421710 ?auto_421711 ) ) ( not ( = ?auto_421710 ?auto_421712 ) ) ( not ( = ?auto_421710 ?auto_421713 ) ) ( not ( = ?auto_421710 ?auto_421714 ) ) ( not ( = ?auto_421711 ?auto_421712 ) ) ( not ( = ?auto_421711 ?auto_421713 ) ) ( not ( = ?auto_421711 ?auto_421714 ) ) ( not ( = ?auto_421712 ?auto_421713 ) ) ( not ( = ?auto_421712 ?auto_421714 ) ) ( not ( = ?auto_421713 ?auto_421714 ) ) ( ON ?auto_421712 ?auto_421713 ) ( ON ?auto_421711 ?auto_421712 ) ( ON ?auto_421710 ?auto_421711 ) ( CLEAR ?auto_421708 ) ( ON ?auto_421709 ?auto_421710 ) ( CLEAR ?auto_421709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_421700 ?auto_421701 ?auto_421702 ?auto_421703 ?auto_421704 ?auto_421705 ?auto_421706 ?auto_421707 ?auto_421708 ?auto_421709 )
      ( MAKE-14PILE ?auto_421700 ?auto_421701 ?auto_421702 ?auto_421703 ?auto_421704 ?auto_421705 ?auto_421706 ?auto_421707 ?auto_421708 ?auto_421709 ?auto_421710 ?auto_421711 ?auto_421712 ?auto_421713 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_421758 - BLOCK
      ?auto_421759 - BLOCK
      ?auto_421760 - BLOCK
      ?auto_421761 - BLOCK
      ?auto_421762 - BLOCK
      ?auto_421763 - BLOCK
      ?auto_421764 - BLOCK
      ?auto_421765 - BLOCK
      ?auto_421766 - BLOCK
      ?auto_421767 - BLOCK
      ?auto_421768 - BLOCK
      ?auto_421769 - BLOCK
      ?auto_421770 - BLOCK
      ?auto_421771 - BLOCK
    )
    :vars
    (
      ?auto_421772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421771 ?auto_421772 ) ( ON-TABLE ?auto_421758 ) ( ON ?auto_421759 ?auto_421758 ) ( ON ?auto_421760 ?auto_421759 ) ( ON ?auto_421761 ?auto_421760 ) ( ON ?auto_421762 ?auto_421761 ) ( ON ?auto_421763 ?auto_421762 ) ( ON ?auto_421764 ?auto_421763 ) ( ON ?auto_421765 ?auto_421764 ) ( not ( = ?auto_421758 ?auto_421759 ) ) ( not ( = ?auto_421758 ?auto_421760 ) ) ( not ( = ?auto_421758 ?auto_421761 ) ) ( not ( = ?auto_421758 ?auto_421762 ) ) ( not ( = ?auto_421758 ?auto_421763 ) ) ( not ( = ?auto_421758 ?auto_421764 ) ) ( not ( = ?auto_421758 ?auto_421765 ) ) ( not ( = ?auto_421758 ?auto_421766 ) ) ( not ( = ?auto_421758 ?auto_421767 ) ) ( not ( = ?auto_421758 ?auto_421768 ) ) ( not ( = ?auto_421758 ?auto_421769 ) ) ( not ( = ?auto_421758 ?auto_421770 ) ) ( not ( = ?auto_421758 ?auto_421771 ) ) ( not ( = ?auto_421758 ?auto_421772 ) ) ( not ( = ?auto_421759 ?auto_421760 ) ) ( not ( = ?auto_421759 ?auto_421761 ) ) ( not ( = ?auto_421759 ?auto_421762 ) ) ( not ( = ?auto_421759 ?auto_421763 ) ) ( not ( = ?auto_421759 ?auto_421764 ) ) ( not ( = ?auto_421759 ?auto_421765 ) ) ( not ( = ?auto_421759 ?auto_421766 ) ) ( not ( = ?auto_421759 ?auto_421767 ) ) ( not ( = ?auto_421759 ?auto_421768 ) ) ( not ( = ?auto_421759 ?auto_421769 ) ) ( not ( = ?auto_421759 ?auto_421770 ) ) ( not ( = ?auto_421759 ?auto_421771 ) ) ( not ( = ?auto_421759 ?auto_421772 ) ) ( not ( = ?auto_421760 ?auto_421761 ) ) ( not ( = ?auto_421760 ?auto_421762 ) ) ( not ( = ?auto_421760 ?auto_421763 ) ) ( not ( = ?auto_421760 ?auto_421764 ) ) ( not ( = ?auto_421760 ?auto_421765 ) ) ( not ( = ?auto_421760 ?auto_421766 ) ) ( not ( = ?auto_421760 ?auto_421767 ) ) ( not ( = ?auto_421760 ?auto_421768 ) ) ( not ( = ?auto_421760 ?auto_421769 ) ) ( not ( = ?auto_421760 ?auto_421770 ) ) ( not ( = ?auto_421760 ?auto_421771 ) ) ( not ( = ?auto_421760 ?auto_421772 ) ) ( not ( = ?auto_421761 ?auto_421762 ) ) ( not ( = ?auto_421761 ?auto_421763 ) ) ( not ( = ?auto_421761 ?auto_421764 ) ) ( not ( = ?auto_421761 ?auto_421765 ) ) ( not ( = ?auto_421761 ?auto_421766 ) ) ( not ( = ?auto_421761 ?auto_421767 ) ) ( not ( = ?auto_421761 ?auto_421768 ) ) ( not ( = ?auto_421761 ?auto_421769 ) ) ( not ( = ?auto_421761 ?auto_421770 ) ) ( not ( = ?auto_421761 ?auto_421771 ) ) ( not ( = ?auto_421761 ?auto_421772 ) ) ( not ( = ?auto_421762 ?auto_421763 ) ) ( not ( = ?auto_421762 ?auto_421764 ) ) ( not ( = ?auto_421762 ?auto_421765 ) ) ( not ( = ?auto_421762 ?auto_421766 ) ) ( not ( = ?auto_421762 ?auto_421767 ) ) ( not ( = ?auto_421762 ?auto_421768 ) ) ( not ( = ?auto_421762 ?auto_421769 ) ) ( not ( = ?auto_421762 ?auto_421770 ) ) ( not ( = ?auto_421762 ?auto_421771 ) ) ( not ( = ?auto_421762 ?auto_421772 ) ) ( not ( = ?auto_421763 ?auto_421764 ) ) ( not ( = ?auto_421763 ?auto_421765 ) ) ( not ( = ?auto_421763 ?auto_421766 ) ) ( not ( = ?auto_421763 ?auto_421767 ) ) ( not ( = ?auto_421763 ?auto_421768 ) ) ( not ( = ?auto_421763 ?auto_421769 ) ) ( not ( = ?auto_421763 ?auto_421770 ) ) ( not ( = ?auto_421763 ?auto_421771 ) ) ( not ( = ?auto_421763 ?auto_421772 ) ) ( not ( = ?auto_421764 ?auto_421765 ) ) ( not ( = ?auto_421764 ?auto_421766 ) ) ( not ( = ?auto_421764 ?auto_421767 ) ) ( not ( = ?auto_421764 ?auto_421768 ) ) ( not ( = ?auto_421764 ?auto_421769 ) ) ( not ( = ?auto_421764 ?auto_421770 ) ) ( not ( = ?auto_421764 ?auto_421771 ) ) ( not ( = ?auto_421764 ?auto_421772 ) ) ( not ( = ?auto_421765 ?auto_421766 ) ) ( not ( = ?auto_421765 ?auto_421767 ) ) ( not ( = ?auto_421765 ?auto_421768 ) ) ( not ( = ?auto_421765 ?auto_421769 ) ) ( not ( = ?auto_421765 ?auto_421770 ) ) ( not ( = ?auto_421765 ?auto_421771 ) ) ( not ( = ?auto_421765 ?auto_421772 ) ) ( not ( = ?auto_421766 ?auto_421767 ) ) ( not ( = ?auto_421766 ?auto_421768 ) ) ( not ( = ?auto_421766 ?auto_421769 ) ) ( not ( = ?auto_421766 ?auto_421770 ) ) ( not ( = ?auto_421766 ?auto_421771 ) ) ( not ( = ?auto_421766 ?auto_421772 ) ) ( not ( = ?auto_421767 ?auto_421768 ) ) ( not ( = ?auto_421767 ?auto_421769 ) ) ( not ( = ?auto_421767 ?auto_421770 ) ) ( not ( = ?auto_421767 ?auto_421771 ) ) ( not ( = ?auto_421767 ?auto_421772 ) ) ( not ( = ?auto_421768 ?auto_421769 ) ) ( not ( = ?auto_421768 ?auto_421770 ) ) ( not ( = ?auto_421768 ?auto_421771 ) ) ( not ( = ?auto_421768 ?auto_421772 ) ) ( not ( = ?auto_421769 ?auto_421770 ) ) ( not ( = ?auto_421769 ?auto_421771 ) ) ( not ( = ?auto_421769 ?auto_421772 ) ) ( not ( = ?auto_421770 ?auto_421771 ) ) ( not ( = ?auto_421770 ?auto_421772 ) ) ( not ( = ?auto_421771 ?auto_421772 ) ) ( ON ?auto_421770 ?auto_421771 ) ( ON ?auto_421769 ?auto_421770 ) ( ON ?auto_421768 ?auto_421769 ) ( ON ?auto_421767 ?auto_421768 ) ( CLEAR ?auto_421765 ) ( ON ?auto_421766 ?auto_421767 ) ( CLEAR ?auto_421766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_421758 ?auto_421759 ?auto_421760 ?auto_421761 ?auto_421762 ?auto_421763 ?auto_421764 ?auto_421765 ?auto_421766 )
      ( MAKE-14PILE ?auto_421758 ?auto_421759 ?auto_421760 ?auto_421761 ?auto_421762 ?auto_421763 ?auto_421764 ?auto_421765 ?auto_421766 ?auto_421767 ?auto_421768 ?auto_421769 ?auto_421770 ?auto_421771 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_421816 - BLOCK
      ?auto_421817 - BLOCK
      ?auto_421818 - BLOCK
      ?auto_421819 - BLOCK
      ?auto_421820 - BLOCK
      ?auto_421821 - BLOCK
      ?auto_421822 - BLOCK
      ?auto_421823 - BLOCK
      ?auto_421824 - BLOCK
      ?auto_421825 - BLOCK
      ?auto_421826 - BLOCK
      ?auto_421827 - BLOCK
      ?auto_421828 - BLOCK
      ?auto_421829 - BLOCK
    )
    :vars
    (
      ?auto_421830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421829 ?auto_421830 ) ( ON-TABLE ?auto_421816 ) ( ON ?auto_421817 ?auto_421816 ) ( ON ?auto_421818 ?auto_421817 ) ( ON ?auto_421819 ?auto_421818 ) ( ON ?auto_421820 ?auto_421819 ) ( ON ?auto_421821 ?auto_421820 ) ( ON ?auto_421822 ?auto_421821 ) ( not ( = ?auto_421816 ?auto_421817 ) ) ( not ( = ?auto_421816 ?auto_421818 ) ) ( not ( = ?auto_421816 ?auto_421819 ) ) ( not ( = ?auto_421816 ?auto_421820 ) ) ( not ( = ?auto_421816 ?auto_421821 ) ) ( not ( = ?auto_421816 ?auto_421822 ) ) ( not ( = ?auto_421816 ?auto_421823 ) ) ( not ( = ?auto_421816 ?auto_421824 ) ) ( not ( = ?auto_421816 ?auto_421825 ) ) ( not ( = ?auto_421816 ?auto_421826 ) ) ( not ( = ?auto_421816 ?auto_421827 ) ) ( not ( = ?auto_421816 ?auto_421828 ) ) ( not ( = ?auto_421816 ?auto_421829 ) ) ( not ( = ?auto_421816 ?auto_421830 ) ) ( not ( = ?auto_421817 ?auto_421818 ) ) ( not ( = ?auto_421817 ?auto_421819 ) ) ( not ( = ?auto_421817 ?auto_421820 ) ) ( not ( = ?auto_421817 ?auto_421821 ) ) ( not ( = ?auto_421817 ?auto_421822 ) ) ( not ( = ?auto_421817 ?auto_421823 ) ) ( not ( = ?auto_421817 ?auto_421824 ) ) ( not ( = ?auto_421817 ?auto_421825 ) ) ( not ( = ?auto_421817 ?auto_421826 ) ) ( not ( = ?auto_421817 ?auto_421827 ) ) ( not ( = ?auto_421817 ?auto_421828 ) ) ( not ( = ?auto_421817 ?auto_421829 ) ) ( not ( = ?auto_421817 ?auto_421830 ) ) ( not ( = ?auto_421818 ?auto_421819 ) ) ( not ( = ?auto_421818 ?auto_421820 ) ) ( not ( = ?auto_421818 ?auto_421821 ) ) ( not ( = ?auto_421818 ?auto_421822 ) ) ( not ( = ?auto_421818 ?auto_421823 ) ) ( not ( = ?auto_421818 ?auto_421824 ) ) ( not ( = ?auto_421818 ?auto_421825 ) ) ( not ( = ?auto_421818 ?auto_421826 ) ) ( not ( = ?auto_421818 ?auto_421827 ) ) ( not ( = ?auto_421818 ?auto_421828 ) ) ( not ( = ?auto_421818 ?auto_421829 ) ) ( not ( = ?auto_421818 ?auto_421830 ) ) ( not ( = ?auto_421819 ?auto_421820 ) ) ( not ( = ?auto_421819 ?auto_421821 ) ) ( not ( = ?auto_421819 ?auto_421822 ) ) ( not ( = ?auto_421819 ?auto_421823 ) ) ( not ( = ?auto_421819 ?auto_421824 ) ) ( not ( = ?auto_421819 ?auto_421825 ) ) ( not ( = ?auto_421819 ?auto_421826 ) ) ( not ( = ?auto_421819 ?auto_421827 ) ) ( not ( = ?auto_421819 ?auto_421828 ) ) ( not ( = ?auto_421819 ?auto_421829 ) ) ( not ( = ?auto_421819 ?auto_421830 ) ) ( not ( = ?auto_421820 ?auto_421821 ) ) ( not ( = ?auto_421820 ?auto_421822 ) ) ( not ( = ?auto_421820 ?auto_421823 ) ) ( not ( = ?auto_421820 ?auto_421824 ) ) ( not ( = ?auto_421820 ?auto_421825 ) ) ( not ( = ?auto_421820 ?auto_421826 ) ) ( not ( = ?auto_421820 ?auto_421827 ) ) ( not ( = ?auto_421820 ?auto_421828 ) ) ( not ( = ?auto_421820 ?auto_421829 ) ) ( not ( = ?auto_421820 ?auto_421830 ) ) ( not ( = ?auto_421821 ?auto_421822 ) ) ( not ( = ?auto_421821 ?auto_421823 ) ) ( not ( = ?auto_421821 ?auto_421824 ) ) ( not ( = ?auto_421821 ?auto_421825 ) ) ( not ( = ?auto_421821 ?auto_421826 ) ) ( not ( = ?auto_421821 ?auto_421827 ) ) ( not ( = ?auto_421821 ?auto_421828 ) ) ( not ( = ?auto_421821 ?auto_421829 ) ) ( not ( = ?auto_421821 ?auto_421830 ) ) ( not ( = ?auto_421822 ?auto_421823 ) ) ( not ( = ?auto_421822 ?auto_421824 ) ) ( not ( = ?auto_421822 ?auto_421825 ) ) ( not ( = ?auto_421822 ?auto_421826 ) ) ( not ( = ?auto_421822 ?auto_421827 ) ) ( not ( = ?auto_421822 ?auto_421828 ) ) ( not ( = ?auto_421822 ?auto_421829 ) ) ( not ( = ?auto_421822 ?auto_421830 ) ) ( not ( = ?auto_421823 ?auto_421824 ) ) ( not ( = ?auto_421823 ?auto_421825 ) ) ( not ( = ?auto_421823 ?auto_421826 ) ) ( not ( = ?auto_421823 ?auto_421827 ) ) ( not ( = ?auto_421823 ?auto_421828 ) ) ( not ( = ?auto_421823 ?auto_421829 ) ) ( not ( = ?auto_421823 ?auto_421830 ) ) ( not ( = ?auto_421824 ?auto_421825 ) ) ( not ( = ?auto_421824 ?auto_421826 ) ) ( not ( = ?auto_421824 ?auto_421827 ) ) ( not ( = ?auto_421824 ?auto_421828 ) ) ( not ( = ?auto_421824 ?auto_421829 ) ) ( not ( = ?auto_421824 ?auto_421830 ) ) ( not ( = ?auto_421825 ?auto_421826 ) ) ( not ( = ?auto_421825 ?auto_421827 ) ) ( not ( = ?auto_421825 ?auto_421828 ) ) ( not ( = ?auto_421825 ?auto_421829 ) ) ( not ( = ?auto_421825 ?auto_421830 ) ) ( not ( = ?auto_421826 ?auto_421827 ) ) ( not ( = ?auto_421826 ?auto_421828 ) ) ( not ( = ?auto_421826 ?auto_421829 ) ) ( not ( = ?auto_421826 ?auto_421830 ) ) ( not ( = ?auto_421827 ?auto_421828 ) ) ( not ( = ?auto_421827 ?auto_421829 ) ) ( not ( = ?auto_421827 ?auto_421830 ) ) ( not ( = ?auto_421828 ?auto_421829 ) ) ( not ( = ?auto_421828 ?auto_421830 ) ) ( not ( = ?auto_421829 ?auto_421830 ) ) ( ON ?auto_421828 ?auto_421829 ) ( ON ?auto_421827 ?auto_421828 ) ( ON ?auto_421826 ?auto_421827 ) ( ON ?auto_421825 ?auto_421826 ) ( ON ?auto_421824 ?auto_421825 ) ( CLEAR ?auto_421822 ) ( ON ?auto_421823 ?auto_421824 ) ( CLEAR ?auto_421823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_421816 ?auto_421817 ?auto_421818 ?auto_421819 ?auto_421820 ?auto_421821 ?auto_421822 ?auto_421823 )
      ( MAKE-14PILE ?auto_421816 ?auto_421817 ?auto_421818 ?auto_421819 ?auto_421820 ?auto_421821 ?auto_421822 ?auto_421823 ?auto_421824 ?auto_421825 ?auto_421826 ?auto_421827 ?auto_421828 ?auto_421829 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_421874 - BLOCK
      ?auto_421875 - BLOCK
      ?auto_421876 - BLOCK
      ?auto_421877 - BLOCK
      ?auto_421878 - BLOCK
      ?auto_421879 - BLOCK
      ?auto_421880 - BLOCK
      ?auto_421881 - BLOCK
      ?auto_421882 - BLOCK
      ?auto_421883 - BLOCK
      ?auto_421884 - BLOCK
      ?auto_421885 - BLOCK
      ?auto_421886 - BLOCK
      ?auto_421887 - BLOCK
    )
    :vars
    (
      ?auto_421888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421887 ?auto_421888 ) ( ON-TABLE ?auto_421874 ) ( ON ?auto_421875 ?auto_421874 ) ( ON ?auto_421876 ?auto_421875 ) ( ON ?auto_421877 ?auto_421876 ) ( ON ?auto_421878 ?auto_421877 ) ( ON ?auto_421879 ?auto_421878 ) ( not ( = ?auto_421874 ?auto_421875 ) ) ( not ( = ?auto_421874 ?auto_421876 ) ) ( not ( = ?auto_421874 ?auto_421877 ) ) ( not ( = ?auto_421874 ?auto_421878 ) ) ( not ( = ?auto_421874 ?auto_421879 ) ) ( not ( = ?auto_421874 ?auto_421880 ) ) ( not ( = ?auto_421874 ?auto_421881 ) ) ( not ( = ?auto_421874 ?auto_421882 ) ) ( not ( = ?auto_421874 ?auto_421883 ) ) ( not ( = ?auto_421874 ?auto_421884 ) ) ( not ( = ?auto_421874 ?auto_421885 ) ) ( not ( = ?auto_421874 ?auto_421886 ) ) ( not ( = ?auto_421874 ?auto_421887 ) ) ( not ( = ?auto_421874 ?auto_421888 ) ) ( not ( = ?auto_421875 ?auto_421876 ) ) ( not ( = ?auto_421875 ?auto_421877 ) ) ( not ( = ?auto_421875 ?auto_421878 ) ) ( not ( = ?auto_421875 ?auto_421879 ) ) ( not ( = ?auto_421875 ?auto_421880 ) ) ( not ( = ?auto_421875 ?auto_421881 ) ) ( not ( = ?auto_421875 ?auto_421882 ) ) ( not ( = ?auto_421875 ?auto_421883 ) ) ( not ( = ?auto_421875 ?auto_421884 ) ) ( not ( = ?auto_421875 ?auto_421885 ) ) ( not ( = ?auto_421875 ?auto_421886 ) ) ( not ( = ?auto_421875 ?auto_421887 ) ) ( not ( = ?auto_421875 ?auto_421888 ) ) ( not ( = ?auto_421876 ?auto_421877 ) ) ( not ( = ?auto_421876 ?auto_421878 ) ) ( not ( = ?auto_421876 ?auto_421879 ) ) ( not ( = ?auto_421876 ?auto_421880 ) ) ( not ( = ?auto_421876 ?auto_421881 ) ) ( not ( = ?auto_421876 ?auto_421882 ) ) ( not ( = ?auto_421876 ?auto_421883 ) ) ( not ( = ?auto_421876 ?auto_421884 ) ) ( not ( = ?auto_421876 ?auto_421885 ) ) ( not ( = ?auto_421876 ?auto_421886 ) ) ( not ( = ?auto_421876 ?auto_421887 ) ) ( not ( = ?auto_421876 ?auto_421888 ) ) ( not ( = ?auto_421877 ?auto_421878 ) ) ( not ( = ?auto_421877 ?auto_421879 ) ) ( not ( = ?auto_421877 ?auto_421880 ) ) ( not ( = ?auto_421877 ?auto_421881 ) ) ( not ( = ?auto_421877 ?auto_421882 ) ) ( not ( = ?auto_421877 ?auto_421883 ) ) ( not ( = ?auto_421877 ?auto_421884 ) ) ( not ( = ?auto_421877 ?auto_421885 ) ) ( not ( = ?auto_421877 ?auto_421886 ) ) ( not ( = ?auto_421877 ?auto_421887 ) ) ( not ( = ?auto_421877 ?auto_421888 ) ) ( not ( = ?auto_421878 ?auto_421879 ) ) ( not ( = ?auto_421878 ?auto_421880 ) ) ( not ( = ?auto_421878 ?auto_421881 ) ) ( not ( = ?auto_421878 ?auto_421882 ) ) ( not ( = ?auto_421878 ?auto_421883 ) ) ( not ( = ?auto_421878 ?auto_421884 ) ) ( not ( = ?auto_421878 ?auto_421885 ) ) ( not ( = ?auto_421878 ?auto_421886 ) ) ( not ( = ?auto_421878 ?auto_421887 ) ) ( not ( = ?auto_421878 ?auto_421888 ) ) ( not ( = ?auto_421879 ?auto_421880 ) ) ( not ( = ?auto_421879 ?auto_421881 ) ) ( not ( = ?auto_421879 ?auto_421882 ) ) ( not ( = ?auto_421879 ?auto_421883 ) ) ( not ( = ?auto_421879 ?auto_421884 ) ) ( not ( = ?auto_421879 ?auto_421885 ) ) ( not ( = ?auto_421879 ?auto_421886 ) ) ( not ( = ?auto_421879 ?auto_421887 ) ) ( not ( = ?auto_421879 ?auto_421888 ) ) ( not ( = ?auto_421880 ?auto_421881 ) ) ( not ( = ?auto_421880 ?auto_421882 ) ) ( not ( = ?auto_421880 ?auto_421883 ) ) ( not ( = ?auto_421880 ?auto_421884 ) ) ( not ( = ?auto_421880 ?auto_421885 ) ) ( not ( = ?auto_421880 ?auto_421886 ) ) ( not ( = ?auto_421880 ?auto_421887 ) ) ( not ( = ?auto_421880 ?auto_421888 ) ) ( not ( = ?auto_421881 ?auto_421882 ) ) ( not ( = ?auto_421881 ?auto_421883 ) ) ( not ( = ?auto_421881 ?auto_421884 ) ) ( not ( = ?auto_421881 ?auto_421885 ) ) ( not ( = ?auto_421881 ?auto_421886 ) ) ( not ( = ?auto_421881 ?auto_421887 ) ) ( not ( = ?auto_421881 ?auto_421888 ) ) ( not ( = ?auto_421882 ?auto_421883 ) ) ( not ( = ?auto_421882 ?auto_421884 ) ) ( not ( = ?auto_421882 ?auto_421885 ) ) ( not ( = ?auto_421882 ?auto_421886 ) ) ( not ( = ?auto_421882 ?auto_421887 ) ) ( not ( = ?auto_421882 ?auto_421888 ) ) ( not ( = ?auto_421883 ?auto_421884 ) ) ( not ( = ?auto_421883 ?auto_421885 ) ) ( not ( = ?auto_421883 ?auto_421886 ) ) ( not ( = ?auto_421883 ?auto_421887 ) ) ( not ( = ?auto_421883 ?auto_421888 ) ) ( not ( = ?auto_421884 ?auto_421885 ) ) ( not ( = ?auto_421884 ?auto_421886 ) ) ( not ( = ?auto_421884 ?auto_421887 ) ) ( not ( = ?auto_421884 ?auto_421888 ) ) ( not ( = ?auto_421885 ?auto_421886 ) ) ( not ( = ?auto_421885 ?auto_421887 ) ) ( not ( = ?auto_421885 ?auto_421888 ) ) ( not ( = ?auto_421886 ?auto_421887 ) ) ( not ( = ?auto_421886 ?auto_421888 ) ) ( not ( = ?auto_421887 ?auto_421888 ) ) ( ON ?auto_421886 ?auto_421887 ) ( ON ?auto_421885 ?auto_421886 ) ( ON ?auto_421884 ?auto_421885 ) ( ON ?auto_421883 ?auto_421884 ) ( ON ?auto_421882 ?auto_421883 ) ( ON ?auto_421881 ?auto_421882 ) ( CLEAR ?auto_421879 ) ( ON ?auto_421880 ?auto_421881 ) ( CLEAR ?auto_421880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_421874 ?auto_421875 ?auto_421876 ?auto_421877 ?auto_421878 ?auto_421879 ?auto_421880 )
      ( MAKE-14PILE ?auto_421874 ?auto_421875 ?auto_421876 ?auto_421877 ?auto_421878 ?auto_421879 ?auto_421880 ?auto_421881 ?auto_421882 ?auto_421883 ?auto_421884 ?auto_421885 ?auto_421886 ?auto_421887 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_421932 - BLOCK
      ?auto_421933 - BLOCK
      ?auto_421934 - BLOCK
      ?auto_421935 - BLOCK
      ?auto_421936 - BLOCK
      ?auto_421937 - BLOCK
      ?auto_421938 - BLOCK
      ?auto_421939 - BLOCK
      ?auto_421940 - BLOCK
      ?auto_421941 - BLOCK
      ?auto_421942 - BLOCK
      ?auto_421943 - BLOCK
      ?auto_421944 - BLOCK
      ?auto_421945 - BLOCK
    )
    :vars
    (
      ?auto_421946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_421945 ?auto_421946 ) ( ON-TABLE ?auto_421932 ) ( ON ?auto_421933 ?auto_421932 ) ( ON ?auto_421934 ?auto_421933 ) ( ON ?auto_421935 ?auto_421934 ) ( ON ?auto_421936 ?auto_421935 ) ( not ( = ?auto_421932 ?auto_421933 ) ) ( not ( = ?auto_421932 ?auto_421934 ) ) ( not ( = ?auto_421932 ?auto_421935 ) ) ( not ( = ?auto_421932 ?auto_421936 ) ) ( not ( = ?auto_421932 ?auto_421937 ) ) ( not ( = ?auto_421932 ?auto_421938 ) ) ( not ( = ?auto_421932 ?auto_421939 ) ) ( not ( = ?auto_421932 ?auto_421940 ) ) ( not ( = ?auto_421932 ?auto_421941 ) ) ( not ( = ?auto_421932 ?auto_421942 ) ) ( not ( = ?auto_421932 ?auto_421943 ) ) ( not ( = ?auto_421932 ?auto_421944 ) ) ( not ( = ?auto_421932 ?auto_421945 ) ) ( not ( = ?auto_421932 ?auto_421946 ) ) ( not ( = ?auto_421933 ?auto_421934 ) ) ( not ( = ?auto_421933 ?auto_421935 ) ) ( not ( = ?auto_421933 ?auto_421936 ) ) ( not ( = ?auto_421933 ?auto_421937 ) ) ( not ( = ?auto_421933 ?auto_421938 ) ) ( not ( = ?auto_421933 ?auto_421939 ) ) ( not ( = ?auto_421933 ?auto_421940 ) ) ( not ( = ?auto_421933 ?auto_421941 ) ) ( not ( = ?auto_421933 ?auto_421942 ) ) ( not ( = ?auto_421933 ?auto_421943 ) ) ( not ( = ?auto_421933 ?auto_421944 ) ) ( not ( = ?auto_421933 ?auto_421945 ) ) ( not ( = ?auto_421933 ?auto_421946 ) ) ( not ( = ?auto_421934 ?auto_421935 ) ) ( not ( = ?auto_421934 ?auto_421936 ) ) ( not ( = ?auto_421934 ?auto_421937 ) ) ( not ( = ?auto_421934 ?auto_421938 ) ) ( not ( = ?auto_421934 ?auto_421939 ) ) ( not ( = ?auto_421934 ?auto_421940 ) ) ( not ( = ?auto_421934 ?auto_421941 ) ) ( not ( = ?auto_421934 ?auto_421942 ) ) ( not ( = ?auto_421934 ?auto_421943 ) ) ( not ( = ?auto_421934 ?auto_421944 ) ) ( not ( = ?auto_421934 ?auto_421945 ) ) ( not ( = ?auto_421934 ?auto_421946 ) ) ( not ( = ?auto_421935 ?auto_421936 ) ) ( not ( = ?auto_421935 ?auto_421937 ) ) ( not ( = ?auto_421935 ?auto_421938 ) ) ( not ( = ?auto_421935 ?auto_421939 ) ) ( not ( = ?auto_421935 ?auto_421940 ) ) ( not ( = ?auto_421935 ?auto_421941 ) ) ( not ( = ?auto_421935 ?auto_421942 ) ) ( not ( = ?auto_421935 ?auto_421943 ) ) ( not ( = ?auto_421935 ?auto_421944 ) ) ( not ( = ?auto_421935 ?auto_421945 ) ) ( not ( = ?auto_421935 ?auto_421946 ) ) ( not ( = ?auto_421936 ?auto_421937 ) ) ( not ( = ?auto_421936 ?auto_421938 ) ) ( not ( = ?auto_421936 ?auto_421939 ) ) ( not ( = ?auto_421936 ?auto_421940 ) ) ( not ( = ?auto_421936 ?auto_421941 ) ) ( not ( = ?auto_421936 ?auto_421942 ) ) ( not ( = ?auto_421936 ?auto_421943 ) ) ( not ( = ?auto_421936 ?auto_421944 ) ) ( not ( = ?auto_421936 ?auto_421945 ) ) ( not ( = ?auto_421936 ?auto_421946 ) ) ( not ( = ?auto_421937 ?auto_421938 ) ) ( not ( = ?auto_421937 ?auto_421939 ) ) ( not ( = ?auto_421937 ?auto_421940 ) ) ( not ( = ?auto_421937 ?auto_421941 ) ) ( not ( = ?auto_421937 ?auto_421942 ) ) ( not ( = ?auto_421937 ?auto_421943 ) ) ( not ( = ?auto_421937 ?auto_421944 ) ) ( not ( = ?auto_421937 ?auto_421945 ) ) ( not ( = ?auto_421937 ?auto_421946 ) ) ( not ( = ?auto_421938 ?auto_421939 ) ) ( not ( = ?auto_421938 ?auto_421940 ) ) ( not ( = ?auto_421938 ?auto_421941 ) ) ( not ( = ?auto_421938 ?auto_421942 ) ) ( not ( = ?auto_421938 ?auto_421943 ) ) ( not ( = ?auto_421938 ?auto_421944 ) ) ( not ( = ?auto_421938 ?auto_421945 ) ) ( not ( = ?auto_421938 ?auto_421946 ) ) ( not ( = ?auto_421939 ?auto_421940 ) ) ( not ( = ?auto_421939 ?auto_421941 ) ) ( not ( = ?auto_421939 ?auto_421942 ) ) ( not ( = ?auto_421939 ?auto_421943 ) ) ( not ( = ?auto_421939 ?auto_421944 ) ) ( not ( = ?auto_421939 ?auto_421945 ) ) ( not ( = ?auto_421939 ?auto_421946 ) ) ( not ( = ?auto_421940 ?auto_421941 ) ) ( not ( = ?auto_421940 ?auto_421942 ) ) ( not ( = ?auto_421940 ?auto_421943 ) ) ( not ( = ?auto_421940 ?auto_421944 ) ) ( not ( = ?auto_421940 ?auto_421945 ) ) ( not ( = ?auto_421940 ?auto_421946 ) ) ( not ( = ?auto_421941 ?auto_421942 ) ) ( not ( = ?auto_421941 ?auto_421943 ) ) ( not ( = ?auto_421941 ?auto_421944 ) ) ( not ( = ?auto_421941 ?auto_421945 ) ) ( not ( = ?auto_421941 ?auto_421946 ) ) ( not ( = ?auto_421942 ?auto_421943 ) ) ( not ( = ?auto_421942 ?auto_421944 ) ) ( not ( = ?auto_421942 ?auto_421945 ) ) ( not ( = ?auto_421942 ?auto_421946 ) ) ( not ( = ?auto_421943 ?auto_421944 ) ) ( not ( = ?auto_421943 ?auto_421945 ) ) ( not ( = ?auto_421943 ?auto_421946 ) ) ( not ( = ?auto_421944 ?auto_421945 ) ) ( not ( = ?auto_421944 ?auto_421946 ) ) ( not ( = ?auto_421945 ?auto_421946 ) ) ( ON ?auto_421944 ?auto_421945 ) ( ON ?auto_421943 ?auto_421944 ) ( ON ?auto_421942 ?auto_421943 ) ( ON ?auto_421941 ?auto_421942 ) ( ON ?auto_421940 ?auto_421941 ) ( ON ?auto_421939 ?auto_421940 ) ( ON ?auto_421938 ?auto_421939 ) ( CLEAR ?auto_421936 ) ( ON ?auto_421937 ?auto_421938 ) ( CLEAR ?auto_421937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_421932 ?auto_421933 ?auto_421934 ?auto_421935 ?auto_421936 ?auto_421937 )
      ( MAKE-14PILE ?auto_421932 ?auto_421933 ?auto_421934 ?auto_421935 ?auto_421936 ?auto_421937 ?auto_421938 ?auto_421939 ?auto_421940 ?auto_421941 ?auto_421942 ?auto_421943 ?auto_421944 ?auto_421945 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_421990 - BLOCK
      ?auto_421991 - BLOCK
      ?auto_421992 - BLOCK
      ?auto_421993 - BLOCK
      ?auto_421994 - BLOCK
      ?auto_421995 - BLOCK
      ?auto_421996 - BLOCK
      ?auto_421997 - BLOCK
      ?auto_421998 - BLOCK
      ?auto_421999 - BLOCK
      ?auto_422000 - BLOCK
      ?auto_422001 - BLOCK
      ?auto_422002 - BLOCK
      ?auto_422003 - BLOCK
    )
    :vars
    (
      ?auto_422004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422003 ?auto_422004 ) ( ON-TABLE ?auto_421990 ) ( ON ?auto_421991 ?auto_421990 ) ( ON ?auto_421992 ?auto_421991 ) ( ON ?auto_421993 ?auto_421992 ) ( not ( = ?auto_421990 ?auto_421991 ) ) ( not ( = ?auto_421990 ?auto_421992 ) ) ( not ( = ?auto_421990 ?auto_421993 ) ) ( not ( = ?auto_421990 ?auto_421994 ) ) ( not ( = ?auto_421990 ?auto_421995 ) ) ( not ( = ?auto_421990 ?auto_421996 ) ) ( not ( = ?auto_421990 ?auto_421997 ) ) ( not ( = ?auto_421990 ?auto_421998 ) ) ( not ( = ?auto_421990 ?auto_421999 ) ) ( not ( = ?auto_421990 ?auto_422000 ) ) ( not ( = ?auto_421990 ?auto_422001 ) ) ( not ( = ?auto_421990 ?auto_422002 ) ) ( not ( = ?auto_421990 ?auto_422003 ) ) ( not ( = ?auto_421990 ?auto_422004 ) ) ( not ( = ?auto_421991 ?auto_421992 ) ) ( not ( = ?auto_421991 ?auto_421993 ) ) ( not ( = ?auto_421991 ?auto_421994 ) ) ( not ( = ?auto_421991 ?auto_421995 ) ) ( not ( = ?auto_421991 ?auto_421996 ) ) ( not ( = ?auto_421991 ?auto_421997 ) ) ( not ( = ?auto_421991 ?auto_421998 ) ) ( not ( = ?auto_421991 ?auto_421999 ) ) ( not ( = ?auto_421991 ?auto_422000 ) ) ( not ( = ?auto_421991 ?auto_422001 ) ) ( not ( = ?auto_421991 ?auto_422002 ) ) ( not ( = ?auto_421991 ?auto_422003 ) ) ( not ( = ?auto_421991 ?auto_422004 ) ) ( not ( = ?auto_421992 ?auto_421993 ) ) ( not ( = ?auto_421992 ?auto_421994 ) ) ( not ( = ?auto_421992 ?auto_421995 ) ) ( not ( = ?auto_421992 ?auto_421996 ) ) ( not ( = ?auto_421992 ?auto_421997 ) ) ( not ( = ?auto_421992 ?auto_421998 ) ) ( not ( = ?auto_421992 ?auto_421999 ) ) ( not ( = ?auto_421992 ?auto_422000 ) ) ( not ( = ?auto_421992 ?auto_422001 ) ) ( not ( = ?auto_421992 ?auto_422002 ) ) ( not ( = ?auto_421992 ?auto_422003 ) ) ( not ( = ?auto_421992 ?auto_422004 ) ) ( not ( = ?auto_421993 ?auto_421994 ) ) ( not ( = ?auto_421993 ?auto_421995 ) ) ( not ( = ?auto_421993 ?auto_421996 ) ) ( not ( = ?auto_421993 ?auto_421997 ) ) ( not ( = ?auto_421993 ?auto_421998 ) ) ( not ( = ?auto_421993 ?auto_421999 ) ) ( not ( = ?auto_421993 ?auto_422000 ) ) ( not ( = ?auto_421993 ?auto_422001 ) ) ( not ( = ?auto_421993 ?auto_422002 ) ) ( not ( = ?auto_421993 ?auto_422003 ) ) ( not ( = ?auto_421993 ?auto_422004 ) ) ( not ( = ?auto_421994 ?auto_421995 ) ) ( not ( = ?auto_421994 ?auto_421996 ) ) ( not ( = ?auto_421994 ?auto_421997 ) ) ( not ( = ?auto_421994 ?auto_421998 ) ) ( not ( = ?auto_421994 ?auto_421999 ) ) ( not ( = ?auto_421994 ?auto_422000 ) ) ( not ( = ?auto_421994 ?auto_422001 ) ) ( not ( = ?auto_421994 ?auto_422002 ) ) ( not ( = ?auto_421994 ?auto_422003 ) ) ( not ( = ?auto_421994 ?auto_422004 ) ) ( not ( = ?auto_421995 ?auto_421996 ) ) ( not ( = ?auto_421995 ?auto_421997 ) ) ( not ( = ?auto_421995 ?auto_421998 ) ) ( not ( = ?auto_421995 ?auto_421999 ) ) ( not ( = ?auto_421995 ?auto_422000 ) ) ( not ( = ?auto_421995 ?auto_422001 ) ) ( not ( = ?auto_421995 ?auto_422002 ) ) ( not ( = ?auto_421995 ?auto_422003 ) ) ( not ( = ?auto_421995 ?auto_422004 ) ) ( not ( = ?auto_421996 ?auto_421997 ) ) ( not ( = ?auto_421996 ?auto_421998 ) ) ( not ( = ?auto_421996 ?auto_421999 ) ) ( not ( = ?auto_421996 ?auto_422000 ) ) ( not ( = ?auto_421996 ?auto_422001 ) ) ( not ( = ?auto_421996 ?auto_422002 ) ) ( not ( = ?auto_421996 ?auto_422003 ) ) ( not ( = ?auto_421996 ?auto_422004 ) ) ( not ( = ?auto_421997 ?auto_421998 ) ) ( not ( = ?auto_421997 ?auto_421999 ) ) ( not ( = ?auto_421997 ?auto_422000 ) ) ( not ( = ?auto_421997 ?auto_422001 ) ) ( not ( = ?auto_421997 ?auto_422002 ) ) ( not ( = ?auto_421997 ?auto_422003 ) ) ( not ( = ?auto_421997 ?auto_422004 ) ) ( not ( = ?auto_421998 ?auto_421999 ) ) ( not ( = ?auto_421998 ?auto_422000 ) ) ( not ( = ?auto_421998 ?auto_422001 ) ) ( not ( = ?auto_421998 ?auto_422002 ) ) ( not ( = ?auto_421998 ?auto_422003 ) ) ( not ( = ?auto_421998 ?auto_422004 ) ) ( not ( = ?auto_421999 ?auto_422000 ) ) ( not ( = ?auto_421999 ?auto_422001 ) ) ( not ( = ?auto_421999 ?auto_422002 ) ) ( not ( = ?auto_421999 ?auto_422003 ) ) ( not ( = ?auto_421999 ?auto_422004 ) ) ( not ( = ?auto_422000 ?auto_422001 ) ) ( not ( = ?auto_422000 ?auto_422002 ) ) ( not ( = ?auto_422000 ?auto_422003 ) ) ( not ( = ?auto_422000 ?auto_422004 ) ) ( not ( = ?auto_422001 ?auto_422002 ) ) ( not ( = ?auto_422001 ?auto_422003 ) ) ( not ( = ?auto_422001 ?auto_422004 ) ) ( not ( = ?auto_422002 ?auto_422003 ) ) ( not ( = ?auto_422002 ?auto_422004 ) ) ( not ( = ?auto_422003 ?auto_422004 ) ) ( ON ?auto_422002 ?auto_422003 ) ( ON ?auto_422001 ?auto_422002 ) ( ON ?auto_422000 ?auto_422001 ) ( ON ?auto_421999 ?auto_422000 ) ( ON ?auto_421998 ?auto_421999 ) ( ON ?auto_421997 ?auto_421998 ) ( ON ?auto_421996 ?auto_421997 ) ( ON ?auto_421995 ?auto_421996 ) ( CLEAR ?auto_421993 ) ( ON ?auto_421994 ?auto_421995 ) ( CLEAR ?auto_421994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_421990 ?auto_421991 ?auto_421992 ?auto_421993 ?auto_421994 )
      ( MAKE-14PILE ?auto_421990 ?auto_421991 ?auto_421992 ?auto_421993 ?auto_421994 ?auto_421995 ?auto_421996 ?auto_421997 ?auto_421998 ?auto_421999 ?auto_422000 ?auto_422001 ?auto_422002 ?auto_422003 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_422048 - BLOCK
      ?auto_422049 - BLOCK
      ?auto_422050 - BLOCK
      ?auto_422051 - BLOCK
      ?auto_422052 - BLOCK
      ?auto_422053 - BLOCK
      ?auto_422054 - BLOCK
      ?auto_422055 - BLOCK
      ?auto_422056 - BLOCK
      ?auto_422057 - BLOCK
      ?auto_422058 - BLOCK
      ?auto_422059 - BLOCK
      ?auto_422060 - BLOCK
      ?auto_422061 - BLOCK
    )
    :vars
    (
      ?auto_422062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422061 ?auto_422062 ) ( ON-TABLE ?auto_422048 ) ( ON ?auto_422049 ?auto_422048 ) ( ON ?auto_422050 ?auto_422049 ) ( not ( = ?auto_422048 ?auto_422049 ) ) ( not ( = ?auto_422048 ?auto_422050 ) ) ( not ( = ?auto_422048 ?auto_422051 ) ) ( not ( = ?auto_422048 ?auto_422052 ) ) ( not ( = ?auto_422048 ?auto_422053 ) ) ( not ( = ?auto_422048 ?auto_422054 ) ) ( not ( = ?auto_422048 ?auto_422055 ) ) ( not ( = ?auto_422048 ?auto_422056 ) ) ( not ( = ?auto_422048 ?auto_422057 ) ) ( not ( = ?auto_422048 ?auto_422058 ) ) ( not ( = ?auto_422048 ?auto_422059 ) ) ( not ( = ?auto_422048 ?auto_422060 ) ) ( not ( = ?auto_422048 ?auto_422061 ) ) ( not ( = ?auto_422048 ?auto_422062 ) ) ( not ( = ?auto_422049 ?auto_422050 ) ) ( not ( = ?auto_422049 ?auto_422051 ) ) ( not ( = ?auto_422049 ?auto_422052 ) ) ( not ( = ?auto_422049 ?auto_422053 ) ) ( not ( = ?auto_422049 ?auto_422054 ) ) ( not ( = ?auto_422049 ?auto_422055 ) ) ( not ( = ?auto_422049 ?auto_422056 ) ) ( not ( = ?auto_422049 ?auto_422057 ) ) ( not ( = ?auto_422049 ?auto_422058 ) ) ( not ( = ?auto_422049 ?auto_422059 ) ) ( not ( = ?auto_422049 ?auto_422060 ) ) ( not ( = ?auto_422049 ?auto_422061 ) ) ( not ( = ?auto_422049 ?auto_422062 ) ) ( not ( = ?auto_422050 ?auto_422051 ) ) ( not ( = ?auto_422050 ?auto_422052 ) ) ( not ( = ?auto_422050 ?auto_422053 ) ) ( not ( = ?auto_422050 ?auto_422054 ) ) ( not ( = ?auto_422050 ?auto_422055 ) ) ( not ( = ?auto_422050 ?auto_422056 ) ) ( not ( = ?auto_422050 ?auto_422057 ) ) ( not ( = ?auto_422050 ?auto_422058 ) ) ( not ( = ?auto_422050 ?auto_422059 ) ) ( not ( = ?auto_422050 ?auto_422060 ) ) ( not ( = ?auto_422050 ?auto_422061 ) ) ( not ( = ?auto_422050 ?auto_422062 ) ) ( not ( = ?auto_422051 ?auto_422052 ) ) ( not ( = ?auto_422051 ?auto_422053 ) ) ( not ( = ?auto_422051 ?auto_422054 ) ) ( not ( = ?auto_422051 ?auto_422055 ) ) ( not ( = ?auto_422051 ?auto_422056 ) ) ( not ( = ?auto_422051 ?auto_422057 ) ) ( not ( = ?auto_422051 ?auto_422058 ) ) ( not ( = ?auto_422051 ?auto_422059 ) ) ( not ( = ?auto_422051 ?auto_422060 ) ) ( not ( = ?auto_422051 ?auto_422061 ) ) ( not ( = ?auto_422051 ?auto_422062 ) ) ( not ( = ?auto_422052 ?auto_422053 ) ) ( not ( = ?auto_422052 ?auto_422054 ) ) ( not ( = ?auto_422052 ?auto_422055 ) ) ( not ( = ?auto_422052 ?auto_422056 ) ) ( not ( = ?auto_422052 ?auto_422057 ) ) ( not ( = ?auto_422052 ?auto_422058 ) ) ( not ( = ?auto_422052 ?auto_422059 ) ) ( not ( = ?auto_422052 ?auto_422060 ) ) ( not ( = ?auto_422052 ?auto_422061 ) ) ( not ( = ?auto_422052 ?auto_422062 ) ) ( not ( = ?auto_422053 ?auto_422054 ) ) ( not ( = ?auto_422053 ?auto_422055 ) ) ( not ( = ?auto_422053 ?auto_422056 ) ) ( not ( = ?auto_422053 ?auto_422057 ) ) ( not ( = ?auto_422053 ?auto_422058 ) ) ( not ( = ?auto_422053 ?auto_422059 ) ) ( not ( = ?auto_422053 ?auto_422060 ) ) ( not ( = ?auto_422053 ?auto_422061 ) ) ( not ( = ?auto_422053 ?auto_422062 ) ) ( not ( = ?auto_422054 ?auto_422055 ) ) ( not ( = ?auto_422054 ?auto_422056 ) ) ( not ( = ?auto_422054 ?auto_422057 ) ) ( not ( = ?auto_422054 ?auto_422058 ) ) ( not ( = ?auto_422054 ?auto_422059 ) ) ( not ( = ?auto_422054 ?auto_422060 ) ) ( not ( = ?auto_422054 ?auto_422061 ) ) ( not ( = ?auto_422054 ?auto_422062 ) ) ( not ( = ?auto_422055 ?auto_422056 ) ) ( not ( = ?auto_422055 ?auto_422057 ) ) ( not ( = ?auto_422055 ?auto_422058 ) ) ( not ( = ?auto_422055 ?auto_422059 ) ) ( not ( = ?auto_422055 ?auto_422060 ) ) ( not ( = ?auto_422055 ?auto_422061 ) ) ( not ( = ?auto_422055 ?auto_422062 ) ) ( not ( = ?auto_422056 ?auto_422057 ) ) ( not ( = ?auto_422056 ?auto_422058 ) ) ( not ( = ?auto_422056 ?auto_422059 ) ) ( not ( = ?auto_422056 ?auto_422060 ) ) ( not ( = ?auto_422056 ?auto_422061 ) ) ( not ( = ?auto_422056 ?auto_422062 ) ) ( not ( = ?auto_422057 ?auto_422058 ) ) ( not ( = ?auto_422057 ?auto_422059 ) ) ( not ( = ?auto_422057 ?auto_422060 ) ) ( not ( = ?auto_422057 ?auto_422061 ) ) ( not ( = ?auto_422057 ?auto_422062 ) ) ( not ( = ?auto_422058 ?auto_422059 ) ) ( not ( = ?auto_422058 ?auto_422060 ) ) ( not ( = ?auto_422058 ?auto_422061 ) ) ( not ( = ?auto_422058 ?auto_422062 ) ) ( not ( = ?auto_422059 ?auto_422060 ) ) ( not ( = ?auto_422059 ?auto_422061 ) ) ( not ( = ?auto_422059 ?auto_422062 ) ) ( not ( = ?auto_422060 ?auto_422061 ) ) ( not ( = ?auto_422060 ?auto_422062 ) ) ( not ( = ?auto_422061 ?auto_422062 ) ) ( ON ?auto_422060 ?auto_422061 ) ( ON ?auto_422059 ?auto_422060 ) ( ON ?auto_422058 ?auto_422059 ) ( ON ?auto_422057 ?auto_422058 ) ( ON ?auto_422056 ?auto_422057 ) ( ON ?auto_422055 ?auto_422056 ) ( ON ?auto_422054 ?auto_422055 ) ( ON ?auto_422053 ?auto_422054 ) ( ON ?auto_422052 ?auto_422053 ) ( CLEAR ?auto_422050 ) ( ON ?auto_422051 ?auto_422052 ) ( CLEAR ?auto_422051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_422048 ?auto_422049 ?auto_422050 ?auto_422051 )
      ( MAKE-14PILE ?auto_422048 ?auto_422049 ?auto_422050 ?auto_422051 ?auto_422052 ?auto_422053 ?auto_422054 ?auto_422055 ?auto_422056 ?auto_422057 ?auto_422058 ?auto_422059 ?auto_422060 ?auto_422061 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_422106 - BLOCK
      ?auto_422107 - BLOCK
      ?auto_422108 - BLOCK
      ?auto_422109 - BLOCK
      ?auto_422110 - BLOCK
      ?auto_422111 - BLOCK
      ?auto_422112 - BLOCK
      ?auto_422113 - BLOCK
      ?auto_422114 - BLOCK
      ?auto_422115 - BLOCK
      ?auto_422116 - BLOCK
      ?auto_422117 - BLOCK
      ?auto_422118 - BLOCK
      ?auto_422119 - BLOCK
    )
    :vars
    (
      ?auto_422120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422119 ?auto_422120 ) ( ON-TABLE ?auto_422106 ) ( ON ?auto_422107 ?auto_422106 ) ( not ( = ?auto_422106 ?auto_422107 ) ) ( not ( = ?auto_422106 ?auto_422108 ) ) ( not ( = ?auto_422106 ?auto_422109 ) ) ( not ( = ?auto_422106 ?auto_422110 ) ) ( not ( = ?auto_422106 ?auto_422111 ) ) ( not ( = ?auto_422106 ?auto_422112 ) ) ( not ( = ?auto_422106 ?auto_422113 ) ) ( not ( = ?auto_422106 ?auto_422114 ) ) ( not ( = ?auto_422106 ?auto_422115 ) ) ( not ( = ?auto_422106 ?auto_422116 ) ) ( not ( = ?auto_422106 ?auto_422117 ) ) ( not ( = ?auto_422106 ?auto_422118 ) ) ( not ( = ?auto_422106 ?auto_422119 ) ) ( not ( = ?auto_422106 ?auto_422120 ) ) ( not ( = ?auto_422107 ?auto_422108 ) ) ( not ( = ?auto_422107 ?auto_422109 ) ) ( not ( = ?auto_422107 ?auto_422110 ) ) ( not ( = ?auto_422107 ?auto_422111 ) ) ( not ( = ?auto_422107 ?auto_422112 ) ) ( not ( = ?auto_422107 ?auto_422113 ) ) ( not ( = ?auto_422107 ?auto_422114 ) ) ( not ( = ?auto_422107 ?auto_422115 ) ) ( not ( = ?auto_422107 ?auto_422116 ) ) ( not ( = ?auto_422107 ?auto_422117 ) ) ( not ( = ?auto_422107 ?auto_422118 ) ) ( not ( = ?auto_422107 ?auto_422119 ) ) ( not ( = ?auto_422107 ?auto_422120 ) ) ( not ( = ?auto_422108 ?auto_422109 ) ) ( not ( = ?auto_422108 ?auto_422110 ) ) ( not ( = ?auto_422108 ?auto_422111 ) ) ( not ( = ?auto_422108 ?auto_422112 ) ) ( not ( = ?auto_422108 ?auto_422113 ) ) ( not ( = ?auto_422108 ?auto_422114 ) ) ( not ( = ?auto_422108 ?auto_422115 ) ) ( not ( = ?auto_422108 ?auto_422116 ) ) ( not ( = ?auto_422108 ?auto_422117 ) ) ( not ( = ?auto_422108 ?auto_422118 ) ) ( not ( = ?auto_422108 ?auto_422119 ) ) ( not ( = ?auto_422108 ?auto_422120 ) ) ( not ( = ?auto_422109 ?auto_422110 ) ) ( not ( = ?auto_422109 ?auto_422111 ) ) ( not ( = ?auto_422109 ?auto_422112 ) ) ( not ( = ?auto_422109 ?auto_422113 ) ) ( not ( = ?auto_422109 ?auto_422114 ) ) ( not ( = ?auto_422109 ?auto_422115 ) ) ( not ( = ?auto_422109 ?auto_422116 ) ) ( not ( = ?auto_422109 ?auto_422117 ) ) ( not ( = ?auto_422109 ?auto_422118 ) ) ( not ( = ?auto_422109 ?auto_422119 ) ) ( not ( = ?auto_422109 ?auto_422120 ) ) ( not ( = ?auto_422110 ?auto_422111 ) ) ( not ( = ?auto_422110 ?auto_422112 ) ) ( not ( = ?auto_422110 ?auto_422113 ) ) ( not ( = ?auto_422110 ?auto_422114 ) ) ( not ( = ?auto_422110 ?auto_422115 ) ) ( not ( = ?auto_422110 ?auto_422116 ) ) ( not ( = ?auto_422110 ?auto_422117 ) ) ( not ( = ?auto_422110 ?auto_422118 ) ) ( not ( = ?auto_422110 ?auto_422119 ) ) ( not ( = ?auto_422110 ?auto_422120 ) ) ( not ( = ?auto_422111 ?auto_422112 ) ) ( not ( = ?auto_422111 ?auto_422113 ) ) ( not ( = ?auto_422111 ?auto_422114 ) ) ( not ( = ?auto_422111 ?auto_422115 ) ) ( not ( = ?auto_422111 ?auto_422116 ) ) ( not ( = ?auto_422111 ?auto_422117 ) ) ( not ( = ?auto_422111 ?auto_422118 ) ) ( not ( = ?auto_422111 ?auto_422119 ) ) ( not ( = ?auto_422111 ?auto_422120 ) ) ( not ( = ?auto_422112 ?auto_422113 ) ) ( not ( = ?auto_422112 ?auto_422114 ) ) ( not ( = ?auto_422112 ?auto_422115 ) ) ( not ( = ?auto_422112 ?auto_422116 ) ) ( not ( = ?auto_422112 ?auto_422117 ) ) ( not ( = ?auto_422112 ?auto_422118 ) ) ( not ( = ?auto_422112 ?auto_422119 ) ) ( not ( = ?auto_422112 ?auto_422120 ) ) ( not ( = ?auto_422113 ?auto_422114 ) ) ( not ( = ?auto_422113 ?auto_422115 ) ) ( not ( = ?auto_422113 ?auto_422116 ) ) ( not ( = ?auto_422113 ?auto_422117 ) ) ( not ( = ?auto_422113 ?auto_422118 ) ) ( not ( = ?auto_422113 ?auto_422119 ) ) ( not ( = ?auto_422113 ?auto_422120 ) ) ( not ( = ?auto_422114 ?auto_422115 ) ) ( not ( = ?auto_422114 ?auto_422116 ) ) ( not ( = ?auto_422114 ?auto_422117 ) ) ( not ( = ?auto_422114 ?auto_422118 ) ) ( not ( = ?auto_422114 ?auto_422119 ) ) ( not ( = ?auto_422114 ?auto_422120 ) ) ( not ( = ?auto_422115 ?auto_422116 ) ) ( not ( = ?auto_422115 ?auto_422117 ) ) ( not ( = ?auto_422115 ?auto_422118 ) ) ( not ( = ?auto_422115 ?auto_422119 ) ) ( not ( = ?auto_422115 ?auto_422120 ) ) ( not ( = ?auto_422116 ?auto_422117 ) ) ( not ( = ?auto_422116 ?auto_422118 ) ) ( not ( = ?auto_422116 ?auto_422119 ) ) ( not ( = ?auto_422116 ?auto_422120 ) ) ( not ( = ?auto_422117 ?auto_422118 ) ) ( not ( = ?auto_422117 ?auto_422119 ) ) ( not ( = ?auto_422117 ?auto_422120 ) ) ( not ( = ?auto_422118 ?auto_422119 ) ) ( not ( = ?auto_422118 ?auto_422120 ) ) ( not ( = ?auto_422119 ?auto_422120 ) ) ( ON ?auto_422118 ?auto_422119 ) ( ON ?auto_422117 ?auto_422118 ) ( ON ?auto_422116 ?auto_422117 ) ( ON ?auto_422115 ?auto_422116 ) ( ON ?auto_422114 ?auto_422115 ) ( ON ?auto_422113 ?auto_422114 ) ( ON ?auto_422112 ?auto_422113 ) ( ON ?auto_422111 ?auto_422112 ) ( ON ?auto_422110 ?auto_422111 ) ( ON ?auto_422109 ?auto_422110 ) ( CLEAR ?auto_422107 ) ( ON ?auto_422108 ?auto_422109 ) ( CLEAR ?auto_422108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_422106 ?auto_422107 ?auto_422108 )
      ( MAKE-14PILE ?auto_422106 ?auto_422107 ?auto_422108 ?auto_422109 ?auto_422110 ?auto_422111 ?auto_422112 ?auto_422113 ?auto_422114 ?auto_422115 ?auto_422116 ?auto_422117 ?auto_422118 ?auto_422119 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_422164 - BLOCK
      ?auto_422165 - BLOCK
      ?auto_422166 - BLOCK
      ?auto_422167 - BLOCK
      ?auto_422168 - BLOCK
      ?auto_422169 - BLOCK
      ?auto_422170 - BLOCK
      ?auto_422171 - BLOCK
      ?auto_422172 - BLOCK
      ?auto_422173 - BLOCK
      ?auto_422174 - BLOCK
      ?auto_422175 - BLOCK
      ?auto_422176 - BLOCK
      ?auto_422177 - BLOCK
    )
    :vars
    (
      ?auto_422178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422177 ?auto_422178 ) ( ON-TABLE ?auto_422164 ) ( not ( = ?auto_422164 ?auto_422165 ) ) ( not ( = ?auto_422164 ?auto_422166 ) ) ( not ( = ?auto_422164 ?auto_422167 ) ) ( not ( = ?auto_422164 ?auto_422168 ) ) ( not ( = ?auto_422164 ?auto_422169 ) ) ( not ( = ?auto_422164 ?auto_422170 ) ) ( not ( = ?auto_422164 ?auto_422171 ) ) ( not ( = ?auto_422164 ?auto_422172 ) ) ( not ( = ?auto_422164 ?auto_422173 ) ) ( not ( = ?auto_422164 ?auto_422174 ) ) ( not ( = ?auto_422164 ?auto_422175 ) ) ( not ( = ?auto_422164 ?auto_422176 ) ) ( not ( = ?auto_422164 ?auto_422177 ) ) ( not ( = ?auto_422164 ?auto_422178 ) ) ( not ( = ?auto_422165 ?auto_422166 ) ) ( not ( = ?auto_422165 ?auto_422167 ) ) ( not ( = ?auto_422165 ?auto_422168 ) ) ( not ( = ?auto_422165 ?auto_422169 ) ) ( not ( = ?auto_422165 ?auto_422170 ) ) ( not ( = ?auto_422165 ?auto_422171 ) ) ( not ( = ?auto_422165 ?auto_422172 ) ) ( not ( = ?auto_422165 ?auto_422173 ) ) ( not ( = ?auto_422165 ?auto_422174 ) ) ( not ( = ?auto_422165 ?auto_422175 ) ) ( not ( = ?auto_422165 ?auto_422176 ) ) ( not ( = ?auto_422165 ?auto_422177 ) ) ( not ( = ?auto_422165 ?auto_422178 ) ) ( not ( = ?auto_422166 ?auto_422167 ) ) ( not ( = ?auto_422166 ?auto_422168 ) ) ( not ( = ?auto_422166 ?auto_422169 ) ) ( not ( = ?auto_422166 ?auto_422170 ) ) ( not ( = ?auto_422166 ?auto_422171 ) ) ( not ( = ?auto_422166 ?auto_422172 ) ) ( not ( = ?auto_422166 ?auto_422173 ) ) ( not ( = ?auto_422166 ?auto_422174 ) ) ( not ( = ?auto_422166 ?auto_422175 ) ) ( not ( = ?auto_422166 ?auto_422176 ) ) ( not ( = ?auto_422166 ?auto_422177 ) ) ( not ( = ?auto_422166 ?auto_422178 ) ) ( not ( = ?auto_422167 ?auto_422168 ) ) ( not ( = ?auto_422167 ?auto_422169 ) ) ( not ( = ?auto_422167 ?auto_422170 ) ) ( not ( = ?auto_422167 ?auto_422171 ) ) ( not ( = ?auto_422167 ?auto_422172 ) ) ( not ( = ?auto_422167 ?auto_422173 ) ) ( not ( = ?auto_422167 ?auto_422174 ) ) ( not ( = ?auto_422167 ?auto_422175 ) ) ( not ( = ?auto_422167 ?auto_422176 ) ) ( not ( = ?auto_422167 ?auto_422177 ) ) ( not ( = ?auto_422167 ?auto_422178 ) ) ( not ( = ?auto_422168 ?auto_422169 ) ) ( not ( = ?auto_422168 ?auto_422170 ) ) ( not ( = ?auto_422168 ?auto_422171 ) ) ( not ( = ?auto_422168 ?auto_422172 ) ) ( not ( = ?auto_422168 ?auto_422173 ) ) ( not ( = ?auto_422168 ?auto_422174 ) ) ( not ( = ?auto_422168 ?auto_422175 ) ) ( not ( = ?auto_422168 ?auto_422176 ) ) ( not ( = ?auto_422168 ?auto_422177 ) ) ( not ( = ?auto_422168 ?auto_422178 ) ) ( not ( = ?auto_422169 ?auto_422170 ) ) ( not ( = ?auto_422169 ?auto_422171 ) ) ( not ( = ?auto_422169 ?auto_422172 ) ) ( not ( = ?auto_422169 ?auto_422173 ) ) ( not ( = ?auto_422169 ?auto_422174 ) ) ( not ( = ?auto_422169 ?auto_422175 ) ) ( not ( = ?auto_422169 ?auto_422176 ) ) ( not ( = ?auto_422169 ?auto_422177 ) ) ( not ( = ?auto_422169 ?auto_422178 ) ) ( not ( = ?auto_422170 ?auto_422171 ) ) ( not ( = ?auto_422170 ?auto_422172 ) ) ( not ( = ?auto_422170 ?auto_422173 ) ) ( not ( = ?auto_422170 ?auto_422174 ) ) ( not ( = ?auto_422170 ?auto_422175 ) ) ( not ( = ?auto_422170 ?auto_422176 ) ) ( not ( = ?auto_422170 ?auto_422177 ) ) ( not ( = ?auto_422170 ?auto_422178 ) ) ( not ( = ?auto_422171 ?auto_422172 ) ) ( not ( = ?auto_422171 ?auto_422173 ) ) ( not ( = ?auto_422171 ?auto_422174 ) ) ( not ( = ?auto_422171 ?auto_422175 ) ) ( not ( = ?auto_422171 ?auto_422176 ) ) ( not ( = ?auto_422171 ?auto_422177 ) ) ( not ( = ?auto_422171 ?auto_422178 ) ) ( not ( = ?auto_422172 ?auto_422173 ) ) ( not ( = ?auto_422172 ?auto_422174 ) ) ( not ( = ?auto_422172 ?auto_422175 ) ) ( not ( = ?auto_422172 ?auto_422176 ) ) ( not ( = ?auto_422172 ?auto_422177 ) ) ( not ( = ?auto_422172 ?auto_422178 ) ) ( not ( = ?auto_422173 ?auto_422174 ) ) ( not ( = ?auto_422173 ?auto_422175 ) ) ( not ( = ?auto_422173 ?auto_422176 ) ) ( not ( = ?auto_422173 ?auto_422177 ) ) ( not ( = ?auto_422173 ?auto_422178 ) ) ( not ( = ?auto_422174 ?auto_422175 ) ) ( not ( = ?auto_422174 ?auto_422176 ) ) ( not ( = ?auto_422174 ?auto_422177 ) ) ( not ( = ?auto_422174 ?auto_422178 ) ) ( not ( = ?auto_422175 ?auto_422176 ) ) ( not ( = ?auto_422175 ?auto_422177 ) ) ( not ( = ?auto_422175 ?auto_422178 ) ) ( not ( = ?auto_422176 ?auto_422177 ) ) ( not ( = ?auto_422176 ?auto_422178 ) ) ( not ( = ?auto_422177 ?auto_422178 ) ) ( ON ?auto_422176 ?auto_422177 ) ( ON ?auto_422175 ?auto_422176 ) ( ON ?auto_422174 ?auto_422175 ) ( ON ?auto_422173 ?auto_422174 ) ( ON ?auto_422172 ?auto_422173 ) ( ON ?auto_422171 ?auto_422172 ) ( ON ?auto_422170 ?auto_422171 ) ( ON ?auto_422169 ?auto_422170 ) ( ON ?auto_422168 ?auto_422169 ) ( ON ?auto_422167 ?auto_422168 ) ( ON ?auto_422166 ?auto_422167 ) ( CLEAR ?auto_422164 ) ( ON ?auto_422165 ?auto_422166 ) ( CLEAR ?auto_422165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_422164 ?auto_422165 )
      ( MAKE-14PILE ?auto_422164 ?auto_422165 ?auto_422166 ?auto_422167 ?auto_422168 ?auto_422169 ?auto_422170 ?auto_422171 ?auto_422172 ?auto_422173 ?auto_422174 ?auto_422175 ?auto_422176 ?auto_422177 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_422222 - BLOCK
      ?auto_422223 - BLOCK
      ?auto_422224 - BLOCK
      ?auto_422225 - BLOCK
      ?auto_422226 - BLOCK
      ?auto_422227 - BLOCK
      ?auto_422228 - BLOCK
      ?auto_422229 - BLOCK
      ?auto_422230 - BLOCK
      ?auto_422231 - BLOCK
      ?auto_422232 - BLOCK
      ?auto_422233 - BLOCK
      ?auto_422234 - BLOCK
      ?auto_422235 - BLOCK
    )
    :vars
    (
      ?auto_422236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422235 ?auto_422236 ) ( not ( = ?auto_422222 ?auto_422223 ) ) ( not ( = ?auto_422222 ?auto_422224 ) ) ( not ( = ?auto_422222 ?auto_422225 ) ) ( not ( = ?auto_422222 ?auto_422226 ) ) ( not ( = ?auto_422222 ?auto_422227 ) ) ( not ( = ?auto_422222 ?auto_422228 ) ) ( not ( = ?auto_422222 ?auto_422229 ) ) ( not ( = ?auto_422222 ?auto_422230 ) ) ( not ( = ?auto_422222 ?auto_422231 ) ) ( not ( = ?auto_422222 ?auto_422232 ) ) ( not ( = ?auto_422222 ?auto_422233 ) ) ( not ( = ?auto_422222 ?auto_422234 ) ) ( not ( = ?auto_422222 ?auto_422235 ) ) ( not ( = ?auto_422222 ?auto_422236 ) ) ( not ( = ?auto_422223 ?auto_422224 ) ) ( not ( = ?auto_422223 ?auto_422225 ) ) ( not ( = ?auto_422223 ?auto_422226 ) ) ( not ( = ?auto_422223 ?auto_422227 ) ) ( not ( = ?auto_422223 ?auto_422228 ) ) ( not ( = ?auto_422223 ?auto_422229 ) ) ( not ( = ?auto_422223 ?auto_422230 ) ) ( not ( = ?auto_422223 ?auto_422231 ) ) ( not ( = ?auto_422223 ?auto_422232 ) ) ( not ( = ?auto_422223 ?auto_422233 ) ) ( not ( = ?auto_422223 ?auto_422234 ) ) ( not ( = ?auto_422223 ?auto_422235 ) ) ( not ( = ?auto_422223 ?auto_422236 ) ) ( not ( = ?auto_422224 ?auto_422225 ) ) ( not ( = ?auto_422224 ?auto_422226 ) ) ( not ( = ?auto_422224 ?auto_422227 ) ) ( not ( = ?auto_422224 ?auto_422228 ) ) ( not ( = ?auto_422224 ?auto_422229 ) ) ( not ( = ?auto_422224 ?auto_422230 ) ) ( not ( = ?auto_422224 ?auto_422231 ) ) ( not ( = ?auto_422224 ?auto_422232 ) ) ( not ( = ?auto_422224 ?auto_422233 ) ) ( not ( = ?auto_422224 ?auto_422234 ) ) ( not ( = ?auto_422224 ?auto_422235 ) ) ( not ( = ?auto_422224 ?auto_422236 ) ) ( not ( = ?auto_422225 ?auto_422226 ) ) ( not ( = ?auto_422225 ?auto_422227 ) ) ( not ( = ?auto_422225 ?auto_422228 ) ) ( not ( = ?auto_422225 ?auto_422229 ) ) ( not ( = ?auto_422225 ?auto_422230 ) ) ( not ( = ?auto_422225 ?auto_422231 ) ) ( not ( = ?auto_422225 ?auto_422232 ) ) ( not ( = ?auto_422225 ?auto_422233 ) ) ( not ( = ?auto_422225 ?auto_422234 ) ) ( not ( = ?auto_422225 ?auto_422235 ) ) ( not ( = ?auto_422225 ?auto_422236 ) ) ( not ( = ?auto_422226 ?auto_422227 ) ) ( not ( = ?auto_422226 ?auto_422228 ) ) ( not ( = ?auto_422226 ?auto_422229 ) ) ( not ( = ?auto_422226 ?auto_422230 ) ) ( not ( = ?auto_422226 ?auto_422231 ) ) ( not ( = ?auto_422226 ?auto_422232 ) ) ( not ( = ?auto_422226 ?auto_422233 ) ) ( not ( = ?auto_422226 ?auto_422234 ) ) ( not ( = ?auto_422226 ?auto_422235 ) ) ( not ( = ?auto_422226 ?auto_422236 ) ) ( not ( = ?auto_422227 ?auto_422228 ) ) ( not ( = ?auto_422227 ?auto_422229 ) ) ( not ( = ?auto_422227 ?auto_422230 ) ) ( not ( = ?auto_422227 ?auto_422231 ) ) ( not ( = ?auto_422227 ?auto_422232 ) ) ( not ( = ?auto_422227 ?auto_422233 ) ) ( not ( = ?auto_422227 ?auto_422234 ) ) ( not ( = ?auto_422227 ?auto_422235 ) ) ( not ( = ?auto_422227 ?auto_422236 ) ) ( not ( = ?auto_422228 ?auto_422229 ) ) ( not ( = ?auto_422228 ?auto_422230 ) ) ( not ( = ?auto_422228 ?auto_422231 ) ) ( not ( = ?auto_422228 ?auto_422232 ) ) ( not ( = ?auto_422228 ?auto_422233 ) ) ( not ( = ?auto_422228 ?auto_422234 ) ) ( not ( = ?auto_422228 ?auto_422235 ) ) ( not ( = ?auto_422228 ?auto_422236 ) ) ( not ( = ?auto_422229 ?auto_422230 ) ) ( not ( = ?auto_422229 ?auto_422231 ) ) ( not ( = ?auto_422229 ?auto_422232 ) ) ( not ( = ?auto_422229 ?auto_422233 ) ) ( not ( = ?auto_422229 ?auto_422234 ) ) ( not ( = ?auto_422229 ?auto_422235 ) ) ( not ( = ?auto_422229 ?auto_422236 ) ) ( not ( = ?auto_422230 ?auto_422231 ) ) ( not ( = ?auto_422230 ?auto_422232 ) ) ( not ( = ?auto_422230 ?auto_422233 ) ) ( not ( = ?auto_422230 ?auto_422234 ) ) ( not ( = ?auto_422230 ?auto_422235 ) ) ( not ( = ?auto_422230 ?auto_422236 ) ) ( not ( = ?auto_422231 ?auto_422232 ) ) ( not ( = ?auto_422231 ?auto_422233 ) ) ( not ( = ?auto_422231 ?auto_422234 ) ) ( not ( = ?auto_422231 ?auto_422235 ) ) ( not ( = ?auto_422231 ?auto_422236 ) ) ( not ( = ?auto_422232 ?auto_422233 ) ) ( not ( = ?auto_422232 ?auto_422234 ) ) ( not ( = ?auto_422232 ?auto_422235 ) ) ( not ( = ?auto_422232 ?auto_422236 ) ) ( not ( = ?auto_422233 ?auto_422234 ) ) ( not ( = ?auto_422233 ?auto_422235 ) ) ( not ( = ?auto_422233 ?auto_422236 ) ) ( not ( = ?auto_422234 ?auto_422235 ) ) ( not ( = ?auto_422234 ?auto_422236 ) ) ( not ( = ?auto_422235 ?auto_422236 ) ) ( ON ?auto_422234 ?auto_422235 ) ( ON ?auto_422233 ?auto_422234 ) ( ON ?auto_422232 ?auto_422233 ) ( ON ?auto_422231 ?auto_422232 ) ( ON ?auto_422230 ?auto_422231 ) ( ON ?auto_422229 ?auto_422230 ) ( ON ?auto_422228 ?auto_422229 ) ( ON ?auto_422227 ?auto_422228 ) ( ON ?auto_422226 ?auto_422227 ) ( ON ?auto_422225 ?auto_422226 ) ( ON ?auto_422224 ?auto_422225 ) ( ON ?auto_422223 ?auto_422224 ) ( ON ?auto_422222 ?auto_422223 ) ( CLEAR ?auto_422222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_422222 )
      ( MAKE-14PILE ?auto_422222 ?auto_422223 ?auto_422224 ?auto_422225 ?auto_422226 ?auto_422227 ?auto_422228 ?auto_422229 ?auto_422230 ?auto_422231 ?auto_422232 ?auto_422233 ?auto_422234 ?auto_422235 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422281 - BLOCK
      ?auto_422282 - BLOCK
      ?auto_422283 - BLOCK
      ?auto_422284 - BLOCK
      ?auto_422285 - BLOCK
      ?auto_422286 - BLOCK
      ?auto_422287 - BLOCK
      ?auto_422288 - BLOCK
      ?auto_422289 - BLOCK
      ?auto_422290 - BLOCK
      ?auto_422291 - BLOCK
      ?auto_422292 - BLOCK
      ?auto_422293 - BLOCK
      ?auto_422294 - BLOCK
      ?auto_422295 - BLOCK
    )
    :vars
    (
      ?auto_422296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_422294 ) ( ON ?auto_422295 ?auto_422296 ) ( CLEAR ?auto_422295 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_422281 ) ( ON ?auto_422282 ?auto_422281 ) ( ON ?auto_422283 ?auto_422282 ) ( ON ?auto_422284 ?auto_422283 ) ( ON ?auto_422285 ?auto_422284 ) ( ON ?auto_422286 ?auto_422285 ) ( ON ?auto_422287 ?auto_422286 ) ( ON ?auto_422288 ?auto_422287 ) ( ON ?auto_422289 ?auto_422288 ) ( ON ?auto_422290 ?auto_422289 ) ( ON ?auto_422291 ?auto_422290 ) ( ON ?auto_422292 ?auto_422291 ) ( ON ?auto_422293 ?auto_422292 ) ( ON ?auto_422294 ?auto_422293 ) ( not ( = ?auto_422281 ?auto_422282 ) ) ( not ( = ?auto_422281 ?auto_422283 ) ) ( not ( = ?auto_422281 ?auto_422284 ) ) ( not ( = ?auto_422281 ?auto_422285 ) ) ( not ( = ?auto_422281 ?auto_422286 ) ) ( not ( = ?auto_422281 ?auto_422287 ) ) ( not ( = ?auto_422281 ?auto_422288 ) ) ( not ( = ?auto_422281 ?auto_422289 ) ) ( not ( = ?auto_422281 ?auto_422290 ) ) ( not ( = ?auto_422281 ?auto_422291 ) ) ( not ( = ?auto_422281 ?auto_422292 ) ) ( not ( = ?auto_422281 ?auto_422293 ) ) ( not ( = ?auto_422281 ?auto_422294 ) ) ( not ( = ?auto_422281 ?auto_422295 ) ) ( not ( = ?auto_422281 ?auto_422296 ) ) ( not ( = ?auto_422282 ?auto_422283 ) ) ( not ( = ?auto_422282 ?auto_422284 ) ) ( not ( = ?auto_422282 ?auto_422285 ) ) ( not ( = ?auto_422282 ?auto_422286 ) ) ( not ( = ?auto_422282 ?auto_422287 ) ) ( not ( = ?auto_422282 ?auto_422288 ) ) ( not ( = ?auto_422282 ?auto_422289 ) ) ( not ( = ?auto_422282 ?auto_422290 ) ) ( not ( = ?auto_422282 ?auto_422291 ) ) ( not ( = ?auto_422282 ?auto_422292 ) ) ( not ( = ?auto_422282 ?auto_422293 ) ) ( not ( = ?auto_422282 ?auto_422294 ) ) ( not ( = ?auto_422282 ?auto_422295 ) ) ( not ( = ?auto_422282 ?auto_422296 ) ) ( not ( = ?auto_422283 ?auto_422284 ) ) ( not ( = ?auto_422283 ?auto_422285 ) ) ( not ( = ?auto_422283 ?auto_422286 ) ) ( not ( = ?auto_422283 ?auto_422287 ) ) ( not ( = ?auto_422283 ?auto_422288 ) ) ( not ( = ?auto_422283 ?auto_422289 ) ) ( not ( = ?auto_422283 ?auto_422290 ) ) ( not ( = ?auto_422283 ?auto_422291 ) ) ( not ( = ?auto_422283 ?auto_422292 ) ) ( not ( = ?auto_422283 ?auto_422293 ) ) ( not ( = ?auto_422283 ?auto_422294 ) ) ( not ( = ?auto_422283 ?auto_422295 ) ) ( not ( = ?auto_422283 ?auto_422296 ) ) ( not ( = ?auto_422284 ?auto_422285 ) ) ( not ( = ?auto_422284 ?auto_422286 ) ) ( not ( = ?auto_422284 ?auto_422287 ) ) ( not ( = ?auto_422284 ?auto_422288 ) ) ( not ( = ?auto_422284 ?auto_422289 ) ) ( not ( = ?auto_422284 ?auto_422290 ) ) ( not ( = ?auto_422284 ?auto_422291 ) ) ( not ( = ?auto_422284 ?auto_422292 ) ) ( not ( = ?auto_422284 ?auto_422293 ) ) ( not ( = ?auto_422284 ?auto_422294 ) ) ( not ( = ?auto_422284 ?auto_422295 ) ) ( not ( = ?auto_422284 ?auto_422296 ) ) ( not ( = ?auto_422285 ?auto_422286 ) ) ( not ( = ?auto_422285 ?auto_422287 ) ) ( not ( = ?auto_422285 ?auto_422288 ) ) ( not ( = ?auto_422285 ?auto_422289 ) ) ( not ( = ?auto_422285 ?auto_422290 ) ) ( not ( = ?auto_422285 ?auto_422291 ) ) ( not ( = ?auto_422285 ?auto_422292 ) ) ( not ( = ?auto_422285 ?auto_422293 ) ) ( not ( = ?auto_422285 ?auto_422294 ) ) ( not ( = ?auto_422285 ?auto_422295 ) ) ( not ( = ?auto_422285 ?auto_422296 ) ) ( not ( = ?auto_422286 ?auto_422287 ) ) ( not ( = ?auto_422286 ?auto_422288 ) ) ( not ( = ?auto_422286 ?auto_422289 ) ) ( not ( = ?auto_422286 ?auto_422290 ) ) ( not ( = ?auto_422286 ?auto_422291 ) ) ( not ( = ?auto_422286 ?auto_422292 ) ) ( not ( = ?auto_422286 ?auto_422293 ) ) ( not ( = ?auto_422286 ?auto_422294 ) ) ( not ( = ?auto_422286 ?auto_422295 ) ) ( not ( = ?auto_422286 ?auto_422296 ) ) ( not ( = ?auto_422287 ?auto_422288 ) ) ( not ( = ?auto_422287 ?auto_422289 ) ) ( not ( = ?auto_422287 ?auto_422290 ) ) ( not ( = ?auto_422287 ?auto_422291 ) ) ( not ( = ?auto_422287 ?auto_422292 ) ) ( not ( = ?auto_422287 ?auto_422293 ) ) ( not ( = ?auto_422287 ?auto_422294 ) ) ( not ( = ?auto_422287 ?auto_422295 ) ) ( not ( = ?auto_422287 ?auto_422296 ) ) ( not ( = ?auto_422288 ?auto_422289 ) ) ( not ( = ?auto_422288 ?auto_422290 ) ) ( not ( = ?auto_422288 ?auto_422291 ) ) ( not ( = ?auto_422288 ?auto_422292 ) ) ( not ( = ?auto_422288 ?auto_422293 ) ) ( not ( = ?auto_422288 ?auto_422294 ) ) ( not ( = ?auto_422288 ?auto_422295 ) ) ( not ( = ?auto_422288 ?auto_422296 ) ) ( not ( = ?auto_422289 ?auto_422290 ) ) ( not ( = ?auto_422289 ?auto_422291 ) ) ( not ( = ?auto_422289 ?auto_422292 ) ) ( not ( = ?auto_422289 ?auto_422293 ) ) ( not ( = ?auto_422289 ?auto_422294 ) ) ( not ( = ?auto_422289 ?auto_422295 ) ) ( not ( = ?auto_422289 ?auto_422296 ) ) ( not ( = ?auto_422290 ?auto_422291 ) ) ( not ( = ?auto_422290 ?auto_422292 ) ) ( not ( = ?auto_422290 ?auto_422293 ) ) ( not ( = ?auto_422290 ?auto_422294 ) ) ( not ( = ?auto_422290 ?auto_422295 ) ) ( not ( = ?auto_422290 ?auto_422296 ) ) ( not ( = ?auto_422291 ?auto_422292 ) ) ( not ( = ?auto_422291 ?auto_422293 ) ) ( not ( = ?auto_422291 ?auto_422294 ) ) ( not ( = ?auto_422291 ?auto_422295 ) ) ( not ( = ?auto_422291 ?auto_422296 ) ) ( not ( = ?auto_422292 ?auto_422293 ) ) ( not ( = ?auto_422292 ?auto_422294 ) ) ( not ( = ?auto_422292 ?auto_422295 ) ) ( not ( = ?auto_422292 ?auto_422296 ) ) ( not ( = ?auto_422293 ?auto_422294 ) ) ( not ( = ?auto_422293 ?auto_422295 ) ) ( not ( = ?auto_422293 ?auto_422296 ) ) ( not ( = ?auto_422294 ?auto_422295 ) ) ( not ( = ?auto_422294 ?auto_422296 ) ) ( not ( = ?auto_422295 ?auto_422296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_422295 ?auto_422296 )
      ( !STACK ?auto_422295 ?auto_422294 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422312 - BLOCK
      ?auto_422313 - BLOCK
      ?auto_422314 - BLOCK
      ?auto_422315 - BLOCK
      ?auto_422316 - BLOCK
      ?auto_422317 - BLOCK
      ?auto_422318 - BLOCK
      ?auto_422319 - BLOCK
      ?auto_422320 - BLOCK
      ?auto_422321 - BLOCK
      ?auto_422322 - BLOCK
      ?auto_422323 - BLOCK
      ?auto_422324 - BLOCK
      ?auto_422325 - BLOCK
      ?auto_422326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_422325 ) ( ON-TABLE ?auto_422326 ) ( CLEAR ?auto_422326 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_422312 ) ( ON ?auto_422313 ?auto_422312 ) ( ON ?auto_422314 ?auto_422313 ) ( ON ?auto_422315 ?auto_422314 ) ( ON ?auto_422316 ?auto_422315 ) ( ON ?auto_422317 ?auto_422316 ) ( ON ?auto_422318 ?auto_422317 ) ( ON ?auto_422319 ?auto_422318 ) ( ON ?auto_422320 ?auto_422319 ) ( ON ?auto_422321 ?auto_422320 ) ( ON ?auto_422322 ?auto_422321 ) ( ON ?auto_422323 ?auto_422322 ) ( ON ?auto_422324 ?auto_422323 ) ( ON ?auto_422325 ?auto_422324 ) ( not ( = ?auto_422312 ?auto_422313 ) ) ( not ( = ?auto_422312 ?auto_422314 ) ) ( not ( = ?auto_422312 ?auto_422315 ) ) ( not ( = ?auto_422312 ?auto_422316 ) ) ( not ( = ?auto_422312 ?auto_422317 ) ) ( not ( = ?auto_422312 ?auto_422318 ) ) ( not ( = ?auto_422312 ?auto_422319 ) ) ( not ( = ?auto_422312 ?auto_422320 ) ) ( not ( = ?auto_422312 ?auto_422321 ) ) ( not ( = ?auto_422312 ?auto_422322 ) ) ( not ( = ?auto_422312 ?auto_422323 ) ) ( not ( = ?auto_422312 ?auto_422324 ) ) ( not ( = ?auto_422312 ?auto_422325 ) ) ( not ( = ?auto_422312 ?auto_422326 ) ) ( not ( = ?auto_422313 ?auto_422314 ) ) ( not ( = ?auto_422313 ?auto_422315 ) ) ( not ( = ?auto_422313 ?auto_422316 ) ) ( not ( = ?auto_422313 ?auto_422317 ) ) ( not ( = ?auto_422313 ?auto_422318 ) ) ( not ( = ?auto_422313 ?auto_422319 ) ) ( not ( = ?auto_422313 ?auto_422320 ) ) ( not ( = ?auto_422313 ?auto_422321 ) ) ( not ( = ?auto_422313 ?auto_422322 ) ) ( not ( = ?auto_422313 ?auto_422323 ) ) ( not ( = ?auto_422313 ?auto_422324 ) ) ( not ( = ?auto_422313 ?auto_422325 ) ) ( not ( = ?auto_422313 ?auto_422326 ) ) ( not ( = ?auto_422314 ?auto_422315 ) ) ( not ( = ?auto_422314 ?auto_422316 ) ) ( not ( = ?auto_422314 ?auto_422317 ) ) ( not ( = ?auto_422314 ?auto_422318 ) ) ( not ( = ?auto_422314 ?auto_422319 ) ) ( not ( = ?auto_422314 ?auto_422320 ) ) ( not ( = ?auto_422314 ?auto_422321 ) ) ( not ( = ?auto_422314 ?auto_422322 ) ) ( not ( = ?auto_422314 ?auto_422323 ) ) ( not ( = ?auto_422314 ?auto_422324 ) ) ( not ( = ?auto_422314 ?auto_422325 ) ) ( not ( = ?auto_422314 ?auto_422326 ) ) ( not ( = ?auto_422315 ?auto_422316 ) ) ( not ( = ?auto_422315 ?auto_422317 ) ) ( not ( = ?auto_422315 ?auto_422318 ) ) ( not ( = ?auto_422315 ?auto_422319 ) ) ( not ( = ?auto_422315 ?auto_422320 ) ) ( not ( = ?auto_422315 ?auto_422321 ) ) ( not ( = ?auto_422315 ?auto_422322 ) ) ( not ( = ?auto_422315 ?auto_422323 ) ) ( not ( = ?auto_422315 ?auto_422324 ) ) ( not ( = ?auto_422315 ?auto_422325 ) ) ( not ( = ?auto_422315 ?auto_422326 ) ) ( not ( = ?auto_422316 ?auto_422317 ) ) ( not ( = ?auto_422316 ?auto_422318 ) ) ( not ( = ?auto_422316 ?auto_422319 ) ) ( not ( = ?auto_422316 ?auto_422320 ) ) ( not ( = ?auto_422316 ?auto_422321 ) ) ( not ( = ?auto_422316 ?auto_422322 ) ) ( not ( = ?auto_422316 ?auto_422323 ) ) ( not ( = ?auto_422316 ?auto_422324 ) ) ( not ( = ?auto_422316 ?auto_422325 ) ) ( not ( = ?auto_422316 ?auto_422326 ) ) ( not ( = ?auto_422317 ?auto_422318 ) ) ( not ( = ?auto_422317 ?auto_422319 ) ) ( not ( = ?auto_422317 ?auto_422320 ) ) ( not ( = ?auto_422317 ?auto_422321 ) ) ( not ( = ?auto_422317 ?auto_422322 ) ) ( not ( = ?auto_422317 ?auto_422323 ) ) ( not ( = ?auto_422317 ?auto_422324 ) ) ( not ( = ?auto_422317 ?auto_422325 ) ) ( not ( = ?auto_422317 ?auto_422326 ) ) ( not ( = ?auto_422318 ?auto_422319 ) ) ( not ( = ?auto_422318 ?auto_422320 ) ) ( not ( = ?auto_422318 ?auto_422321 ) ) ( not ( = ?auto_422318 ?auto_422322 ) ) ( not ( = ?auto_422318 ?auto_422323 ) ) ( not ( = ?auto_422318 ?auto_422324 ) ) ( not ( = ?auto_422318 ?auto_422325 ) ) ( not ( = ?auto_422318 ?auto_422326 ) ) ( not ( = ?auto_422319 ?auto_422320 ) ) ( not ( = ?auto_422319 ?auto_422321 ) ) ( not ( = ?auto_422319 ?auto_422322 ) ) ( not ( = ?auto_422319 ?auto_422323 ) ) ( not ( = ?auto_422319 ?auto_422324 ) ) ( not ( = ?auto_422319 ?auto_422325 ) ) ( not ( = ?auto_422319 ?auto_422326 ) ) ( not ( = ?auto_422320 ?auto_422321 ) ) ( not ( = ?auto_422320 ?auto_422322 ) ) ( not ( = ?auto_422320 ?auto_422323 ) ) ( not ( = ?auto_422320 ?auto_422324 ) ) ( not ( = ?auto_422320 ?auto_422325 ) ) ( not ( = ?auto_422320 ?auto_422326 ) ) ( not ( = ?auto_422321 ?auto_422322 ) ) ( not ( = ?auto_422321 ?auto_422323 ) ) ( not ( = ?auto_422321 ?auto_422324 ) ) ( not ( = ?auto_422321 ?auto_422325 ) ) ( not ( = ?auto_422321 ?auto_422326 ) ) ( not ( = ?auto_422322 ?auto_422323 ) ) ( not ( = ?auto_422322 ?auto_422324 ) ) ( not ( = ?auto_422322 ?auto_422325 ) ) ( not ( = ?auto_422322 ?auto_422326 ) ) ( not ( = ?auto_422323 ?auto_422324 ) ) ( not ( = ?auto_422323 ?auto_422325 ) ) ( not ( = ?auto_422323 ?auto_422326 ) ) ( not ( = ?auto_422324 ?auto_422325 ) ) ( not ( = ?auto_422324 ?auto_422326 ) ) ( not ( = ?auto_422325 ?auto_422326 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_422326 )
      ( !STACK ?auto_422326 ?auto_422325 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422342 - BLOCK
      ?auto_422343 - BLOCK
      ?auto_422344 - BLOCK
      ?auto_422345 - BLOCK
      ?auto_422346 - BLOCK
      ?auto_422347 - BLOCK
      ?auto_422348 - BLOCK
      ?auto_422349 - BLOCK
      ?auto_422350 - BLOCK
      ?auto_422351 - BLOCK
      ?auto_422352 - BLOCK
      ?auto_422353 - BLOCK
      ?auto_422354 - BLOCK
      ?auto_422355 - BLOCK
      ?auto_422356 - BLOCK
    )
    :vars
    (
      ?auto_422357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422356 ?auto_422357 ) ( ON-TABLE ?auto_422342 ) ( ON ?auto_422343 ?auto_422342 ) ( ON ?auto_422344 ?auto_422343 ) ( ON ?auto_422345 ?auto_422344 ) ( ON ?auto_422346 ?auto_422345 ) ( ON ?auto_422347 ?auto_422346 ) ( ON ?auto_422348 ?auto_422347 ) ( ON ?auto_422349 ?auto_422348 ) ( ON ?auto_422350 ?auto_422349 ) ( ON ?auto_422351 ?auto_422350 ) ( ON ?auto_422352 ?auto_422351 ) ( ON ?auto_422353 ?auto_422352 ) ( ON ?auto_422354 ?auto_422353 ) ( not ( = ?auto_422342 ?auto_422343 ) ) ( not ( = ?auto_422342 ?auto_422344 ) ) ( not ( = ?auto_422342 ?auto_422345 ) ) ( not ( = ?auto_422342 ?auto_422346 ) ) ( not ( = ?auto_422342 ?auto_422347 ) ) ( not ( = ?auto_422342 ?auto_422348 ) ) ( not ( = ?auto_422342 ?auto_422349 ) ) ( not ( = ?auto_422342 ?auto_422350 ) ) ( not ( = ?auto_422342 ?auto_422351 ) ) ( not ( = ?auto_422342 ?auto_422352 ) ) ( not ( = ?auto_422342 ?auto_422353 ) ) ( not ( = ?auto_422342 ?auto_422354 ) ) ( not ( = ?auto_422342 ?auto_422355 ) ) ( not ( = ?auto_422342 ?auto_422356 ) ) ( not ( = ?auto_422342 ?auto_422357 ) ) ( not ( = ?auto_422343 ?auto_422344 ) ) ( not ( = ?auto_422343 ?auto_422345 ) ) ( not ( = ?auto_422343 ?auto_422346 ) ) ( not ( = ?auto_422343 ?auto_422347 ) ) ( not ( = ?auto_422343 ?auto_422348 ) ) ( not ( = ?auto_422343 ?auto_422349 ) ) ( not ( = ?auto_422343 ?auto_422350 ) ) ( not ( = ?auto_422343 ?auto_422351 ) ) ( not ( = ?auto_422343 ?auto_422352 ) ) ( not ( = ?auto_422343 ?auto_422353 ) ) ( not ( = ?auto_422343 ?auto_422354 ) ) ( not ( = ?auto_422343 ?auto_422355 ) ) ( not ( = ?auto_422343 ?auto_422356 ) ) ( not ( = ?auto_422343 ?auto_422357 ) ) ( not ( = ?auto_422344 ?auto_422345 ) ) ( not ( = ?auto_422344 ?auto_422346 ) ) ( not ( = ?auto_422344 ?auto_422347 ) ) ( not ( = ?auto_422344 ?auto_422348 ) ) ( not ( = ?auto_422344 ?auto_422349 ) ) ( not ( = ?auto_422344 ?auto_422350 ) ) ( not ( = ?auto_422344 ?auto_422351 ) ) ( not ( = ?auto_422344 ?auto_422352 ) ) ( not ( = ?auto_422344 ?auto_422353 ) ) ( not ( = ?auto_422344 ?auto_422354 ) ) ( not ( = ?auto_422344 ?auto_422355 ) ) ( not ( = ?auto_422344 ?auto_422356 ) ) ( not ( = ?auto_422344 ?auto_422357 ) ) ( not ( = ?auto_422345 ?auto_422346 ) ) ( not ( = ?auto_422345 ?auto_422347 ) ) ( not ( = ?auto_422345 ?auto_422348 ) ) ( not ( = ?auto_422345 ?auto_422349 ) ) ( not ( = ?auto_422345 ?auto_422350 ) ) ( not ( = ?auto_422345 ?auto_422351 ) ) ( not ( = ?auto_422345 ?auto_422352 ) ) ( not ( = ?auto_422345 ?auto_422353 ) ) ( not ( = ?auto_422345 ?auto_422354 ) ) ( not ( = ?auto_422345 ?auto_422355 ) ) ( not ( = ?auto_422345 ?auto_422356 ) ) ( not ( = ?auto_422345 ?auto_422357 ) ) ( not ( = ?auto_422346 ?auto_422347 ) ) ( not ( = ?auto_422346 ?auto_422348 ) ) ( not ( = ?auto_422346 ?auto_422349 ) ) ( not ( = ?auto_422346 ?auto_422350 ) ) ( not ( = ?auto_422346 ?auto_422351 ) ) ( not ( = ?auto_422346 ?auto_422352 ) ) ( not ( = ?auto_422346 ?auto_422353 ) ) ( not ( = ?auto_422346 ?auto_422354 ) ) ( not ( = ?auto_422346 ?auto_422355 ) ) ( not ( = ?auto_422346 ?auto_422356 ) ) ( not ( = ?auto_422346 ?auto_422357 ) ) ( not ( = ?auto_422347 ?auto_422348 ) ) ( not ( = ?auto_422347 ?auto_422349 ) ) ( not ( = ?auto_422347 ?auto_422350 ) ) ( not ( = ?auto_422347 ?auto_422351 ) ) ( not ( = ?auto_422347 ?auto_422352 ) ) ( not ( = ?auto_422347 ?auto_422353 ) ) ( not ( = ?auto_422347 ?auto_422354 ) ) ( not ( = ?auto_422347 ?auto_422355 ) ) ( not ( = ?auto_422347 ?auto_422356 ) ) ( not ( = ?auto_422347 ?auto_422357 ) ) ( not ( = ?auto_422348 ?auto_422349 ) ) ( not ( = ?auto_422348 ?auto_422350 ) ) ( not ( = ?auto_422348 ?auto_422351 ) ) ( not ( = ?auto_422348 ?auto_422352 ) ) ( not ( = ?auto_422348 ?auto_422353 ) ) ( not ( = ?auto_422348 ?auto_422354 ) ) ( not ( = ?auto_422348 ?auto_422355 ) ) ( not ( = ?auto_422348 ?auto_422356 ) ) ( not ( = ?auto_422348 ?auto_422357 ) ) ( not ( = ?auto_422349 ?auto_422350 ) ) ( not ( = ?auto_422349 ?auto_422351 ) ) ( not ( = ?auto_422349 ?auto_422352 ) ) ( not ( = ?auto_422349 ?auto_422353 ) ) ( not ( = ?auto_422349 ?auto_422354 ) ) ( not ( = ?auto_422349 ?auto_422355 ) ) ( not ( = ?auto_422349 ?auto_422356 ) ) ( not ( = ?auto_422349 ?auto_422357 ) ) ( not ( = ?auto_422350 ?auto_422351 ) ) ( not ( = ?auto_422350 ?auto_422352 ) ) ( not ( = ?auto_422350 ?auto_422353 ) ) ( not ( = ?auto_422350 ?auto_422354 ) ) ( not ( = ?auto_422350 ?auto_422355 ) ) ( not ( = ?auto_422350 ?auto_422356 ) ) ( not ( = ?auto_422350 ?auto_422357 ) ) ( not ( = ?auto_422351 ?auto_422352 ) ) ( not ( = ?auto_422351 ?auto_422353 ) ) ( not ( = ?auto_422351 ?auto_422354 ) ) ( not ( = ?auto_422351 ?auto_422355 ) ) ( not ( = ?auto_422351 ?auto_422356 ) ) ( not ( = ?auto_422351 ?auto_422357 ) ) ( not ( = ?auto_422352 ?auto_422353 ) ) ( not ( = ?auto_422352 ?auto_422354 ) ) ( not ( = ?auto_422352 ?auto_422355 ) ) ( not ( = ?auto_422352 ?auto_422356 ) ) ( not ( = ?auto_422352 ?auto_422357 ) ) ( not ( = ?auto_422353 ?auto_422354 ) ) ( not ( = ?auto_422353 ?auto_422355 ) ) ( not ( = ?auto_422353 ?auto_422356 ) ) ( not ( = ?auto_422353 ?auto_422357 ) ) ( not ( = ?auto_422354 ?auto_422355 ) ) ( not ( = ?auto_422354 ?auto_422356 ) ) ( not ( = ?auto_422354 ?auto_422357 ) ) ( not ( = ?auto_422355 ?auto_422356 ) ) ( not ( = ?auto_422355 ?auto_422357 ) ) ( not ( = ?auto_422356 ?auto_422357 ) ) ( CLEAR ?auto_422354 ) ( ON ?auto_422355 ?auto_422356 ) ( CLEAR ?auto_422355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_422342 ?auto_422343 ?auto_422344 ?auto_422345 ?auto_422346 ?auto_422347 ?auto_422348 ?auto_422349 ?auto_422350 ?auto_422351 ?auto_422352 ?auto_422353 ?auto_422354 ?auto_422355 )
      ( MAKE-15PILE ?auto_422342 ?auto_422343 ?auto_422344 ?auto_422345 ?auto_422346 ?auto_422347 ?auto_422348 ?auto_422349 ?auto_422350 ?auto_422351 ?auto_422352 ?auto_422353 ?auto_422354 ?auto_422355 ?auto_422356 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422373 - BLOCK
      ?auto_422374 - BLOCK
      ?auto_422375 - BLOCK
      ?auto_422376 - BLOCK
      ?auto_422377 - BLOCK
      ?auto_422378 - BLOCK
      ?auto_422379 - BLOCK
      ?auto_422380 - BLOCK
      ?auto_422381 - BLOCK
      ?auto_422382 - BLOCK
      ?auto_422383 - BLOCK
      ?auto_422384 - BLOCK
      ?auto_422385 - BLOCK
      ?auto_422386 - BLOCK
      ?auto_422387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422387 ) ( ON-TABLE ?auto_422373 ) ( ON ?auto_422374 ?auto_422373 ) ( ON ?auto_422375 ?auto_422374 ) ( ON ?auto_422376 ?auto_422375 ) ( ON ?auto_422377 ?auto_422376 ) ( ON ?auto_422378 ?auto_422377 ) ( ON ?auto_422379 ?auto_422378 ) ( ON ?auto_422380 ?auto_422379 ) ( ON ?auto_422381 ?auto_422380 ) ( ON ?auto_422382 ?auto_422381 ) ( ON ?auto_422383 ?auto_422382 ) ( ON ?auto_422384 ?auto_422383 ) ( ON ?auto_422385 ?auto_422384 ) ( not ( = ?auto_422373 ?auto_422374 ) ) ( not ( = ?auto_422373 ?auto_422375 ) ) ( not ( = ?auto_422373 ?auto_422376 ) ) ( not ( = ?auto_422373 ?auto_422377 ) ) ( not ( = ?auto_422373 ?auto_422378 ) ) ( not ( = ?auto_422373 ?auto_422379 ) ) ( not ( = ?auto_422373 ?auto_422380 ) ) ( not ( = ?auto_422373 ?auto_422381 ) ) ( not ( = ?auto_422373 ?auto_422382 ) ) ( not ( = ?auto_422373 ?auto_422383 ) ) ( not ( = ?auto_422373 ?auto_422384 ) ) ( not ( = ?auto_422373 ?auto_422385 ) ) ( not ( = ?auto_422373 ?auto_422386 ) ) ( not ( = ?auto_422373 ?auto_422387 ) ) ( not ( = ?auto_422374 ?auto_422375 ) ) ( not ( = ?auto_422374 ?auto_422376 ) ) ( not ( = ?auto_422374 ?auto_422377 ) ) ( not ( = ?auto_422374 ?auto_422378 ) ) ( not ( = ?auto_422374 ?auto_422379 ) ) ( not ( = ?auto_422374 ?auto_422380 ) ) ( not ( = ?auto_422374 ?auto_422381 ) ) ( not ( = ?auto_422374 ?auto_422382 ) ) ( not ( = ?auto_422374 ?auto_422383 ) ) ( not ( = ?auto_422374 ?auto_422384 ) ) ( not ( = ?auto_422374 ?auto_422385 ) ) ( not ( = ?auto_422374 ?auto_422386 ) ) ( not ( = ?auto_422374 ?auto_422387 ) ) ( not ( = ?auto_422375 ?auto_422376 ) ) ( not ( = ?auto_422375 ?auto_422377 ) ) ( not ( = ?auto_422375 ?auto_422378 ) ) ( not ( = ?auto_422375 ?auto_422379 ) ) ( not ( = ?auto_422375 ?auto_422380 ) ) ( not ( = ?auto_422375 ?auto_422381 ) ) ( not ( = ?auto_422375 ?auto_422382 ) ) ( not ( = ?auto_422375 ?auto_422383 ) ) ( not ( = ?auto_422375 ?auto_422384 ) ) ( not ( = ?auto_422375 ?auto_422385 ) ) ( not ( = ?auto_422375 ?auto_422386 ) ) ( not ( = ?auto_422375 ?auto_422387 ) ) ( not ( = ?auto_422376 ?auto_422377 ) ) ( not ( = ?auto_422376 ?auto_422378 ) ) ( not ( = ?auto_422376 ?auto_422379 ) ) ( not ( = ?auto_422376 ?auto_422380 ) ) ( not ( = ?auto_422376 ?auto_422381 ) ) ( not ( = ?auto_422376 ?auto_422382 ) ) ( not ( = ?auto_422376 ?auto_422383 ) ) ( not ( = ?auto_422376 ?auto_422384 ) ) ( not ( = ?auto_422376 ?auto_422385 ) ) ( not ( = ?auto_422376 ?auto_422386 ) ) ( not ( = ?auto_422376 ?auto_422387 ) ) ( not ( = ?auto_422377 ?auto_422378 ) ) ( not ( = ?auto_422377 ?auto_422379 ) ) ( not ( = ?auto_422377 ?auto_422380 ) ) ( not ( = ?auto_422377 ?auto_422381 ) ) ( not ( = ?auto_422377 ?auto_422382 ) ) ( not ( = ?auto_422377 ?auto_422383 ) ) ( not ( = ?auto_422377 ?auto_422384 ) ) ( not ( = ?auto_422377 ?auto_422385 ) ) ( not ( = ?auto_422377 ?auto_422386 ) ) ( not ( = ?auto_422377 ?auto_422387 ) ) ( not ( = ?auto_422378 ?auto_422379 ) ) ( not ( = ?auto_422378 ?auto_422380 ) ) ( not ( = ?auto_422378 ?auto_422381 ) ) ( not ( = ?auto_422378 ?auto_422382 ) ) ( not ( = ?auto_422378 ?auto_422383 ) ) ( not ( = ?auto_422378 ?auto_422384 ) ) ( not ( = ?auto_422378 ?auto_422385 ) ) ( not ( = ?auto_422378 ?auto_422386 ) ) ( not ( = ?auto_422378 ?auto_422387 ) ) ( not ( = ?auto_422379 ?auto_422380 ) ) ( not ( = ?auto_422379 ?auto_422381 ) ) ( not ( = ?auto_422379 ?auto_422382 ) ) ( not ( = ?auto_422379 ?auto_422383 ) ) ( not ( = ?auto_422379 ?auto_422384 ) ) ( not ( = ?auto_422379 ?auto_422385 ) ) ( not ( = ?auto_422379 ?auto_422386 ) ) ( not ( = ?auto_422379 ?auto_422387 ) ) ( not ( = ?auto_422380 ?auto_422381 ) ) ( not ( = ?auto_422380 ?auto_422382 ) ) ( not ( = ?auto_422380 ?auto_422383 ) ) ( not ( = ?auto_422380 ?auto_422384 ) ) ( not ( = ?auto_422380 ?auto_422385 ) ) ( not ( = ?auto_422380 ?auto_422386 ) ) ( not ( = ?auto_422380 ?auto_422387 ) ) ( not ( = ?auto_422381 ?auto_422382 ) ) ( not ( = ?auto_422381 ?auto_422383 ) ) ( not ( = ?auto_422381 ?auto_422384 ) ) ( not ( = ?auto_422381 ?auto_422385 ) ) ( not ( = ?auto_422381 ?auto_422386 ) ) ( not ( = ?auto_422381 ?auto_422387 ) ) ( not ( = ?auto_422382 ?auto_422383 ) ) ( not ( = ?auto_422382 ?auto_422384 ) ) ( not ( = ?auto_422382 ?auto_422385 ) ) ( not ( = ?auto_422382 ?auto_422386 ) ) ( not ( = ?auto_422382 ?auto_422387 ) ) ( not ( = ?auto_422383 ?auto_422384 ) ) ( not ( = ?auto_422383 ?auto_422385 ) ) ( not ( = ?auto_422383 ?auto_422386 ) ) ( not ( = ?auto_422383 ?auto_422387 ) ) ( not ( = ?auto_422384 ?auto_422385 ) ) ( not ( = ?auto_422384 ?auto_422386 ) ) ( not ( = ?auto_422384 ?auto_422387 ) ) ( not ( = ?auto_422385 ?auto_422386 ) ) ( not ( = ?auto_422385 ?auto_422387 ) ) ( not ( = ?auto_422386 ?auto_422387 ) ) ( CLEAR ?auto_422385 ) ( ON ?auto_422386 ?auto_422387 ) ( CLEAR ?auto_422386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_422373 ?auto_422374 ?auto_422375 ?auto_422376 ?auto_422377 ?auto_422378 ?auto_422379 ?auto_422380 ?auto_422381 ?auto_422382 ?auto_422383 ?auto_422384 ?auto_422385 ?auto_422386 )
      ( MAKE-15PILE ?auto_422373 ?auto_422374 ?auto_422375 ?auto_422376 ?auto_422377 ?auto_422378 ?auto_422379 ?auto_422380 ?auto_422381 ?auto_422382 ?auto_422383 ?auto_422384 ?auto_422385 ?auto_422386 ?auto_422387 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422403 - BLOCK
      ?auto_422404 - BLOCK
      ?auto_422405 - BLOCK
      ?auto_422406 - BLOCK
      ?auto_422407 - BLOCK
      ?auto_422408 - BLOCK
      ?auto_422409 - BLOCK
      ?auto_422410 - BLOCK
      ?auto_422411 - BLOCK
      ?auto_422412 - BLOCK
      ?auto_422413 - BLOCK
      ?auto_422414 - BLOCK
      ?auto_422415 - BLOCK
      ?auto_422416 - BLOCK
      ?auto_422417 - BLOCK
    )
    :vars
    (
      ?auto_422418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422417 ?auto_422418 ) ( ON-TABLE ?auto_422403 ) ( ON ?auto_422404 ?auto_422403 ) ( ON ?auto_422405 ?auto_422404 ) ( ON ?auto_422406 ?auto_422405 ) ( ON ?auto_422407 ?auto_422406 ) ( ON ?auto_422408 ?auto_422407 ) ( ON ?auto_422409 ?auto_422408 ) ( ON ?auto_422410 ?auto_422409 ) ( ON ?auto_422411 ?auto_422410 ) ( ON ?auto_422412 ?auto_422411 ) ( ON ?auto_422413 ?auto_422412 ) ( ON ?auto_422414 ?auto_422413 ) ( not ( = ?auto_422403 ?auto_422404 ) ) ( not ( = ?auto_422403 ?auto_422405 ) ) ( not ( = ?auto_422403 ?auto_422406 ) ) ( not ( = ?auto_422403 ?auto_422407 ) ) ( not ( = ?auto_422403 ?auto_422408 ) ) ( not ( = ?auto_422403 ?auto_422409 ) ) ( not ( = ?auto_422403 ?auto_422410 ) ) ( not ( = ?auto_422403 ?auto_422411 ) ) ( not ( = ?auto_422403 ?auto_422412 ) ) ( not ( = ?auto_422403 ?auto_422413 ) ) ( not ( = ?auto_422403 ?auto_422414 ) ) ( not ( = ?auto_422403 ?auto_422415 ) ) ( not ( = ?auto_422403 ?auto_422416 ) ) ( not ( = ?auto_422403 ?auto_422417 ) ) ( not ( = ?auto_422403 ?auto_422418 ) ) ( not ( = ?auto_422404 ?auto_422405 ) ) ( not ( = ?auto_422404 ?auto_422406 ) ) ( not ( = ?auto_422404 ?auto_422407 ) ) ( not ( = ?auto_422404 ?auto_422408 ) ) ( not ( = ?auto_422404 ?auto_422409 ) ) ( not ( = ?auto_422404 ?auto_422410 ) ) ( not ( = ?auto_422404 ?auto_422411 ) ) ( not ( = ?auto_422404 ?auto_422412 ) ) ( not ( = ?auto_422404 ?auto_422413 ) ) ( not ( = ?auto_422404 ?auto_422414 ) ) ( not ( = ?auto_422404 ?auto_422415 ) ) ( not ( = ?auto_422404 ?auto_422416 ) ) ( not ( = ?auto_422404 ?auto_422417 ) ) ( not ( = ?auto_422404 ?auto_422418 ) ) ( not ( = ?auto_422405 ?auto_422406 ) ) ( not ( = ?auto_422405 ?auto_422407 ) ) ( not ( = ?auto_422405 ?auto_422408 ) ) ( not ( = ?auto_422405 ?auto_422409 ) ) ( not ( = ?auto_422405 ?auto_422410 ) ) ( not ( = ?auto_422405 ?auto_422411 ) ) ( not ( = ?auto_422405 ?auto_422412 ) ) ( not ( = ?auto_422405 ?auto_422413 ) ) ( not ( = ?auto_422405 ?auto_422414 ) ) ( not ( = ?auto_422405 ?auto_422415 ) ) ( not ( = ?auto_422405 ?auto_422416 ) ) ( not ( = ?auto_422405 ?auto_422417 ) ) ( not ( = ?auto_422405 ?auto_422418 ) ) ( not ( = ?auto_422406 ?auto_422407 ) ) ( not ( = ?auto_422406 ?auto_422408 ) ) ( not ( = ?auto_422406 ?auto_422409 ) ) ( not ( = ?auto_422406 ?auto_422410 ) ) ( not ( = ?auto_422406 ?auto_422411 ) ) ( not ( = ?auto_422406 ?auto_422412 ) ) ( not ( = ?auto_422406 ?auto_422413 ) ) ( not ( = ?auto_422406 ?auto_422414 ) ) ( not ( = ?auto_422406 ?auto_422415 ) ) ( not ( = ?auto_422406 ?auto_422416 ) ) ( not ( = ?auto_422406 ?auto_422417 ) ) ( not ( = ?auto_422406 ?auto_422418 ) ) ( not ( = ?auto_422407 ?auto_422408 ) ) ( not ( = ?auto_422407 ?auto_422409 ) ) ( not ( = ?auto_422407 ?auto_422410 ) ) ( not ( = ?auto_422407 ?auto_422411 ) ) ( not ( = ?auto_422407 ?auto_422412 ) ) ( not ( = ?auto_422407 ?auto_422413 ) ) ( not ( = ?auto_422407 ?auto_422414 ) ) ( not ( = ?auto_422407 ?auto_422415 ) ) ( not ( = ?auto_422407 ?auto_422416 ) ) ( not ( = ?auto_422407 ?auto_422417 ) ) ( not ( = ?auto_422407 ?auto_422418 ) ) ( not ( = ?auto_422408 ?auto_422409 ) ) ( not ( = ?auto_422408 ?auto_422410 ) ) ( not ( = ?auto_422408 ?auto_422411 ) ) ( not ( = ?auto_422408 ?auto_422412 ) ) ( not ( = ?auto_422408 ?auto_422413 ) ) ( not ( = ?auto_422408 ?auto_422414 ) ) ( not ( = ?auto_422408 ?auto_422415 ) ) ( not ( = ?auto_422408 ?auto_422416 ) ) ( not ( = ?auto_422408 ?auto_422417 ) ) ( not ( = ?auto_422408 ?auto_422418 ) ) ( not ( = ?auto_422409 ?auto_422410 ) ) ( not ( = ?auto_422409 ?auto_422411 ) ) ( not ( = ?auto_422409 ?auto_422412 ) ) ( not ( = ?auto_422409 ?auto_422413 ) ) ( not ( = ?auto_422409 ?auto_422414 ) ) ( not ( = ?auto_422409 ?auto_422415 ) ) ( not ( = ?auto_422409 ?auto_422416 ) ) ( not ( = ?auto_422409 ?auto_422417 ) ) ( not ( = ?auto_422409 ?auto_422418 ) ) ( not ( = ?auto_422410 ?auto_422411 ) ) ( not ( = ?auto_422410 ?auto_422412 ) ) ( not ( = ?auto_422410 ?auto_422413 ) ) ( not ( = ?auto_422410 ?auto_422414 ) ) ( not ( = ?auto_422410 ?auto_422415 ) ) ( not ( = ?auto_422410 ?auto_422416 ) ) ( not ( = ?auto_422410 ?auto_422417 ) ) ( not ( = ?auto_422410 ?auto_422418 ) ) ( not ( = ?auto_422411 ?auto_422412 ) ) ( not ( = ?auto_422411 ?auto_422413 ) ) ( not ( = ?auto_422411 ?auto_422414 ) ) ( not ( = ?auto_422411 ?auto_422415 ) ) ( not ( = ?auto_422411 ?auto_422416 ) ) ( not ( = ?auto_422411 ?auto_422417 ) ) ( not ( = ?auto_422411 ?auto_422418 ) ) ( not ( = ?auto_422412 ?auto_422413 ) ) ( not ( = ?auto_422412 ?auto_422414 ) ) ( not ( = ?auto_422412 ?auto_422415 ) ) ( not ( = ?auto_422412 ?auto_422416 ) ) ( not ( = ?auto_422412 ?auto_422417 ) ) ( not ( = ?auto_422412 ?auto_422418 ) ) ( not ( = ?auto_422413 ?auto_422414 ) ) ( not ( = ?auto_422413 ?auto_422415 ) ) ( not ( = ?auto_422413 ?auto_422416 ) ) ( not ( = ?auto_422413 ?auto_422417 ) ) ( not ( = ?auto_422413 ?auto_422418 ) ) ( not ( = ?auto_422414 ?auto_422415 ) ) ( not ( = ?auto_422414 ?auto_422416 ) ) ( not ( = ?auto_422414 ?auto_422417 ) ) ( not ( = ?auto_422414 ?auto_422418 ) ) ( not ( = ?auto_422415 ?auto_422416 ) ) ( not ( = ?auto_422415 ?auto_422417 ) ) ( not ( = ?auto_422415 ?auto_422418 ) ) ( not ( = ?auto_422416 ?auto_422417 ) ) ( not ( = ?auto_422416 ?auto_422418 ) ) ( not ( = ?auto_422417 ?auto_422418 ) ) ( ON ?auto_422416 ?auto_422417 ) ( CLEAR ?auto_422414 ) ( ON ?auto_422415 ?auto_422416 ) ( CLEAR ?auto_422415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_422403 ?auto_422404 ?auto_422405 ?auto_422406 ?auto_422407 ?auto_422408 ?auto_422409 ?auto_422410 ?auto_422411 ?auto_422412 ?auto_422413 ?auto_422414 ?auto_422415 )
      ( MAKE-15PILE ?auto_422403 ?auto_422404 ?auto_422405 ?auto_422406 ?auto_422407 ?auto_422408 ?auto_422409 ?auto_422410 ?auto_422411 ?auto_422412 ?auto_422413 ?auto_422414 ?auto_422415 ?auto_422416 ?auto_422417 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422434 - BLOCK
      ?auto_422435 - BLOCK
      ?auto_422436 - BLOCK
      ?auto_422437 - BLOCK
      ?auto_422438 - BLOCK
      ?auto_422439 - BLOCK
      ?auto_422440 - BLOCK
      ?auto_422441 - BLOCK
      ?auto_422442 - BLOCK
      ?auto_422443 - BLOCK
      ?auto_422444 - BLOCK
      ?auto_422445 - BLOCK
      ?auto_422446 - BLOCK
      ?auto_422447 - BLOCK
      ?auto_422448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422448 ) ( ON-TABLE ?auto_422434 ) ( ON ?auto_422435 ?auto_422434 ) ( ON ?auto_422436 ?auto_422435 ) ( ON ?auto_422437 ?auto_422436 ) ( ON ?auto_422438 ?auto_422437 ) ( ON ?auto_422439 ?auto_422438 ) ( ON ?auto_422440 ?auto_422439 ) ( ON ?auto_422441 ?auto_422440 ) ( ON ?auto_422442 ?auto_422441 ) ( ON ?auto_422443 ?auto_422442 ) ( ON ?auto_422444 ?auto_422443 ) ( ON ?auto_422445 ?auto_422444 ) ( not ( = ?auto_422434 ?auto_422435 ) ) ( not ( = ?auto_422434 ?auto_422436 ) ) ( not ( = ?auto_422434 ?auto_422437 ) ) ( not ( = ?auto_422434 ?auto_422438 ) ) ( not ( = ?auto_422434 ?auto_422439 ) ) ( not ( = ?auto_422434 ?auto_422440 ) ) ( not ( = ?auto_422434 ?auto_422441 ) ) ( not ( = ?auto_422434 ?auto_422442 ) ) ( not ( = ?auto_422434 ?auto_422443 ) ) ( not ( = ?auto_422434 ?auto_422444 ) ) ( not ( = ?auto_422434 ?auto_422445 ) ) ( not ( = ?auto_422434 ?auto_422446 ) ) ( not ( = ?auto_422434 ?auto_422447 ) ) ( not ( = ?auto_422434 ?auto_422448 ) ) ( not ( = ?auto_422435 ?auto_422436 ) ) ( not ( = ?auto_422435 ?auto_422437 ) ) ( not ( = ?auto_422435 ?auto_422438 ) ) ( not ( = ?auto_422435 ?auto_422439 ) ) ( not ( = ?auto_422435 ?auto_422440 ) ) ( not ( = ?auto_422435 ?auto_422441 ) ) ( not ( = ?auto_422435 ?auto_422442 ) ) ( not ( = ?auto_422435 ?auto_422443 ) ) ( not ( = ?auto_422435 ?auto_422444 ) ) ( not ( = ?auto_422435 ?auto_422445 ) ) ( not ( = ?auto_422435 ?auto_422446 ) ) ( not ( = ?auto_422435 ?auto_422447 ) ) ( not ( = ?auto_422435 ?auto_422448 ) ) ( not ( = ?auto_422436 ?auto_422437 ) ) ( not ( = ?auto_422436 ?auto_422438 ) ) ( not ( = ?auto_422436 ?auto_422439 ) ) ( not ( = ?auto_422436 ?auto_422440 ) ) ( not ( = ?auto_422436 ?auto_422441 ) ) ( not ( = ?auto_422436 ?auto_422442 ) ) ( not ( = ?auto_422436 ?auto_422443 ) ) ( not ( = ?auto_422436 ?auto_422444 ) ) ( not ( = ?auto_422436 ?auto_422445 ) ) ( not ( = ?auto_422436 ?auto_422446 ) ) ( not ( = ?auto_422436 ?auto_422447 ) ) ( not ( = ?auto_422436 ?auto_422448 ) ) ( not ( = ?auto_422437 ?auto_422438 ) ) ( not ( = ?auto_422437 ?auto_422439 ) ) ( not ( = ?auto_422437 ?auto_422440 ) ) ( not ( = ?auto_422437 ?auto_422441 ) ) ( not ( = ?auto_422437 ?auto_422442 ) ) ( not ( = ?auto_422437 ?auto_422443 ) ) ( not ( = ?auto_422437 ?auto_422444 ) ) ( not ( = ?auto_422437 ?auto_422445 ) ) ( not ( = ?auto_422437 ?auto_422446 ) ) ( not ( = ?auto_422437 ?auto_422447 ) ) ( not ( = ?auto_422437 ?auto_422448 ) ) ( not ( = ?auto_422438 ?auto_422439 ) ) ( not ( = ?auto_422438 ?auto_422440 ) ) ( not ( = ?auto_422438 ?auto_422441 ) ) ( not ( = ?auto_422438 ?auto_422442 ) ) ( not ( = ?auto_422438 ?auto_422443 ) ) ( not ( = ?auto_422438 ?auto_422444 ) ) ( not ( = ?auto_422438 ?auto_422445 ) ) ( not ( = ?auto_422438 ?auto_422446 ) ) ( not ( = ?auto_422438 ?auto_422447 ) ) ( not ( = ?auto_422438 ?auto_422448 ) ) ( not ( = ?auto_422439 ?auto_422440 ) ) ( not ( = ?auto_422439 ?auto_422441 ) ) ( not ( = ?auto_422439 ?auto_422442 ) ) ( not ( = ?auto_422439 ?auto_422443 ) ) ( not ( = ?auto_422439 ?auto_422444 ) ) ( not ( = ?auto_422439 ?auto_422445 ) ) ( not ( = ?auto_422439 ?auto_422446 ) ) ( not ( = ?auto_422439 ?auto_422447 ) ) ( not ( = ?auto_422439 ?auto_422448 ) ) ( not ( = ?auto_422440 ?auto_422441 ) ) ( not ( = ?auto_422440 ?auto_422442 ) ) ( not ( = ?auto_422440 ?auto_422443 ) ) ( not ( = ?auto_422440 ?auto_422444 ) ) ( not ( = ?auto_422440 ?auto_422445 ) ) ( not ( = ?auto_422440 ?auto_422446 ) ) ( not ( = ?auto_422440 ?auto_422447 ) ) ( not ( = ?auto_422440 ?auto_422448 ) ) ( not ( = ?auto_422441 ?auto_422442 ) ) ( not ( = ?auto_422441 ?auto_422443 ) ) ( not ( = ?auto_422441 ?auto_422444 ) ) ( not ( = ?auto_422441 ?auto_422445 ) ) ( not ( = ?auto_422441 ?auto_422446 ) ) ( not ( = ?auto_422441 ?auto_422447 ) ) ( not ( = ?auto_422441 ?auto_422448 ) ) ( not ( = ?auto_422442 ?auto_422443 ) ) ( not ( = ?auto_422442 ?auto_422444 ) ) ( not ( = ?auto_422442 ?auto_422445 ) ) ( not ( = ?auto_422442 ?auto_422446 ) ) ( not ( = ?auto_422442 ?auto_422447 ) ) ( not ( = ?auto_422442 ?auto_422448 ) ) ( not ( = ?auto_422443 ?auto_422444 ) ) ( not ( = ?auto_422443 ?auto_422445 ) ) ( not ( = ?auto_422443 ?auto_422446 ) ) ( not ( = ?auto_422443 ?auto_422447 ) ) ( not ( = ?auto_422443 ?auto_422448 ) ) ( not ( = ?auto_422444 ?auto_422445 ) ) ( not ( = ?auto_422444 ?auto_422446 ) ) ( not ( = ?auto_422444 ?auto_422447 ) ) ( not ( = ?auto_422444 ?auto_422448 ) ) ( not ( = ?auto_422445 ?auto_422446 ) ) ( not ( = ?auto_422445 ?auto_422447 ) ) ( not ( = ?auto_422445 ?auto_422448 ) ) ( not ( = ?auto_422446 ?auto_422447 ) ) ( not ( = ?auto_422446 ?auto_422448 ) ) ( not ( = ?auto_422447 ?auto_422448 ) ) ( ON ?auto_422447 ?auto_422448 ) ( CLEAR ?auto_422445 ) ( ON ?auto_422446 ?auto_422447 ) ( CLEAR ?auto_422446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_422434 ?auto_422435 ?auto_422436 ?auto_422437 ?auto_422438 ?auto_422439 ?auto_422440 ?auto_422441 ?auto_422442 ?auto_422443 ?auto_422444 ?auto_422445 ?auto_422446 )
      ( MAKE-15PILE ?auto_422434 ?auto_422435 ?auto_422436 ?auto_422437 ?auto_422438 ?auto_422439 ?auto_422440 ?auto_422441 ?auto_422442 ?auto_422443 ?auto_422444 ?auto_422445 ?auto_422446 ?auto_422447 ?auto_422448 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422464 - BLOCK
      ?auto_422465 - BLOCK
      ?auto_422466 - BLOCK
      ?auto_422467 - BLOCK
      ?auto_422468 - BLOCK
      ?auto_422469 - BLOCK
      ?auto_422470 - BLOCK
      ?auto_422471 - BLOCK
      ?auto_422472 - BLOCK
      ?auto_422473 - BLOCK
      ?auto_422474 - BLOCK
      ?auto_422475 - BLOCK
      ?auto_422476 - BLOCK
      ?auto_422477 - BLOCK
      ?auto_422478 - BLOCK
    )
    :vars
    (
      ?auto_422479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422478 ?auto_422479 ) ( ON-TABLE ?auto_422464 ) ( ON ?auto_422465 ?auto_422464 ) ( ON ?auto_422466 ?auto_422465 ) ( ON ?auto_422467 ?auto_422466 ) ( ON ?auto_422468 ?auto_422467 ) ( ON ?auto_422469 ?auto_422468 ) ( ON ?auto_422470 ?auto_422469 ) ( ON ?auto_422471 ?auto_422470 ) ( ON ?auto_422472 ?auto_422471 ) ( ON ?auto_422473 ?auto_422472 ) ( ON ?auto_422474 ?auto_422473 ) ( not ( = ?auto_422464 ?auto_422465 ) ) ( not ( = ?auto_422464 ?auto_422466 ) ) ( not ( = ?auto_422464 ?auto_422467 ) ) ( not ( = ?auto_422464 ?auto_422468 ) ) ( not ( = ?auto_422464 ?auto_422469 ) ) ( not ( = ?auto_422464 ?auto_422470 ) ) ( not ( = ?auto_422464 ?auto_422471 ) ) ( not ( = ?auto_422464 ?auto_422472 ) ) ( not ( = ?auto_422464 ?auto_422473 ) ) ( not ( = ?auto_422464 ?auto_422474 ) ) ( not ( = ?auto_422464 ?auto_422475 ) ) ( not ( = ?auto_422464 ?auto_422476 ) ) ( not ( = ?auto_422464 ?auto_422477 ) ) ( not ( = ?auto_422464 ?auto_422478 ) ) ( not ( = ?auto_422464 ?auto_422479 ) ) ( not ( = ?auto_422465 ?auto_422466 ) ) ( not ( = ?auto_422465 ?auto_422467 ) ) ( not ( = ?auto_422465 ?auto_422468 ) ) ( not ( = ?auto_422465 ?auto_422469 ) ) ( not ( = ?auto_422465 ?auto_422470 ) ) ( not ( = ?auto_422465 ?auto_422471 ) ) ( not ( = ?auto_422465 ?auto_422472 ) ) ( not ( = ?auto_422465 ?auto_422473 ) ) ( not ( = ?auto_422465 ?auto_422474 ) ) ( not ( = ?auto_422465 ?auto_422475 ) ) ( not ( = ?auto_422465 ?auto_422476 ) ) ( not ( = ?auto_422465 ?auto_422477 ) ) ( not ( = ?auto_422465 ?auto_422478 ) ) ( not ( = ?auto_422465 ?auto_422479 ) ) ( not ( = ?auto_422466 ?auto_422467 ) ) ( not ( = ?auto_422466 ?auto_422468 ) ) ( not ( = ?auto_422466 ?auto_422469 ) ) ( not ( = ?auto_422466 ?auto_422470 ) ) ( not ( = ?auto_422466 ?auto_422471 ) ) ( not ( = ?auto_422466 ?auto_422472 ) ) ( not ( = ?auto_422466 ?auto_422473 ) ) ( not ( = ?auto_422466 ?auto_422474 ) ) ( not ( = ?auto_422466 ?auto_422475 ) ) ( not ( = ?auto_422466 ?auto_422476 ) ) ( not ( = ?auto_422466 ?auto_422477 ) ) ( not ( = ?auto_422466 ?auto_422478 ) ) ( not ( = ?auto_422466 ?auto_422479 ) ) ( not ( = ?auto_422467 ?auto_422468 ) ) ( not ( = ?auto_422467 ?auto_422469 ) ) ( not ( = ?auto_422467 ?auto_422470 ) ) ( not ( = ?auto_422467 ?auto_422471 ) ) ( not ( = ?auto_422467 ?auto_422472 ) ) ( not ( = ?auto_422467 ?auto_422473 ) ) ( not ( = ?auto_422467 ?auto_422474 ) ) ( not ( = ?auto_422467 ?auto_422475 ) ) ( not ( = ?auto_422467 ?auto_422476 ) ) ( not ( = ?auto_422467 ?auto_422477 ) ) ( not ( = ?auto_422467 ?auto_422478 ) ) ( not ( = ?auto_422467 ?auto_422479 ) ) ( not ( = ?auto_422468 ?auto_422469 ) ) ( not ( = ?auto_422468 ?auto_422470 ) ) ( not ( = ?auto_422468 ?auto_422471 ) ) ( not ( = ?auto_422468 ?auto_422472 ) ) ( not ( = ?auto_422468 ?auto_422473 ) ) ( not ( = ?auto_422468 ?auto_422474 ) ) ( not ( = ?auto_422468 ?auto_422475 ) ) ( not ( = ?auto_422468 ?auto_422476 ) ) ( not ( = ?auto_422468 ?auto_422477 ) ) ( not ( = ?auto_422468 ?auto_422478 ) ) ( not ( = ?auto_422468 ?auto_422479 ) ) ( not ( = ?auto_422469 ?auto_422470 ) ) ( not ( = ?auto_422469 ?auto_422471 ) ) ( not ( = ?auto_422469 ?auto_422472 ) ) ( not ( = ?auto_422469 ?auto_422473 ) ) ( not ( = ?auto_422469 ?auto_422474 ) ) ( not ( = ?auto_422469 ?auto_422475 ) ) ( not ( = ?auto_422469 ?auto_422476 ) ) ( not ( = ?auto_422469 ?auto_422477 ) ) ( not ( = ?auto_422469 ?auto_422478 ) ) ( not ( = ?auto_422469 ?auto_422479 ) ) ( not ( = ?auto_422470 ?auto_422471 ) ) ( not ( = ?auto_422470 ?auto_422472 ) ) ( not ( = ?auto_422470 ?auto_422473 ) ) ( not ( = ?auto_422470 ?auto_422474 ) ) ( not ( = ?auto_422470 ?auto_422475 ) ) ( not ( = ?auto_422470 ?auto_422476 ) ) ( not ( = ?auto_422470 ?auto_422477 ) ) ( not ( = ?auto_422470 ?auto_422478 ) ) ( not ( = ?auto_422470 ?auto_422479 ) ) ( not ( = ?auto_422471 ?auto_422472 ) ) ( not ( = ?auto_422471 ?auto_422473 ) ) ( not ( = ?auto_422471 ?auto_422474 ) ) ( not ( = ?auto_422471 ?auto_422475 ) ) ( not ( = ?auto_422471 ?auto_422476 ) ) ( not ( = ?auto_422471 ?auto_422477 ) ) ( not ( = ?auto_422471 ?auto_422478 ) ) ( not ( = ?auto_422471 ?auto_422479 ) ) ( not ( = ?auto_422472 ?auto_422473 ) ) ( not ( = ?auto_422472 ?auto_422474 ) ) ( not ( = ?auto_422472 ?auto_422475 ) ) ( not ( = ?auto_422472 ?auto_422476 ) ) ( not ( = ?auto_422472 ?auto_422477 ) ) ( not ( = ?auto_422472 ?auto_422478 ) ) ( not ( = ?auto_422472 ?auto_422479 ) ) ( not ( = ?auto_422473 ?auto_422474 ) ) ( not ( = ?auto_422473 ?auto_422475 ) ) ( not ( = ?auto_422473 ?auto_422476 ) ) ( not ( = ?auto_422473 ?auto_422477 ) ) ( not ( = ?auto_422473 ?auto_422478 ) ) ( not ( = ?auto_422473 ?auto_422479 ) ) ( not ( = ?auto_422474 ?auto_422475 ) ) ( not ( = ?auto_422474 ?auto_422476 ) ) ( not ( = ?auto_422474 ?auto_422477 ) ) ( not ( = ?auto_422474 ?auto_422478 ) ) ( not ( = ?auto_422474 ?auto_422479 ) ) ( not ( = ?auto_422475 ?auto_422476 ) ) ( not ( = ?auto_422475 ?auto_422477 ) ) ( not ( = ?auto_422475 ?auto_422478 ) ) ( not ( = ?auto_422475 ?auto_422479 ) ) ( not ( = ?auto_422476 ?auto_422477 ) ) ( not ( = ?auto_422476 ?auto_422478 ) ) ( not ( = ?auto_422476 ?auto_422479 ) ) ( not ( = ?auto_422477 ?auto_422478 ) ) ( not ( = ?auto_422477 ?auto_422479 ) ) ( not ( = ?auto_422478 ?auto_422479 ) ) ( ON ?auto_422477 ?auto_422478 ) ( ON ?auto_422476 ?auto_422477 ) ( CLEAR ?auto_422474 ) ( ON ?auto_422475 ?auto_422476 ) ( CLEAR ?auto_422475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_422464 ?auto_422465 ?auto_422466 ?auto_422467 ?auto_422468 ?auto_422469 ?auto_422470 ?auto_422471 ?auto_422472 ?auto_422473 ?auto_422474 ?auto_422475 )
      ( MAKE-15PILE ?auto_422464 ?auto_422465 ?auto_422466 ?auto_422467 ?auto_422468 ?auto_422469 ?auto_422470 ?auto_422471 ?auto_422472 ?auto_422473 ?auto_422474 ?auto_422475 ?auto_422476 ?auto_422477 ?auto_422478 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422495 - BLOCK
      ?auto_422496 - BLOCK
      ?auto_422497 - BLOCK
      ?auto_422498 - BLOCK
      ?auto_422499 - BLOCK
      ?auto_422500 - BLOCK
      ?auto_422501 - BLOCK
      ?auto_422502 - BLOCK
      ?auto_422503 - BLOCK
      ?auto_422504 - BLOCK
      ?auto_422505 - BLOCK
      ?auto_422506 - BLOCK
      ?auto_422507 - BLOCK
      ?auto_422508 - BLOCK
      ?auto_422509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422509 ) ( ON-TABLE ?auto_422495 ) ( ON ?auto_422496 ?auto_422495 ) ( ON ?auto_422497 ?auto_422496 ) ( ON ?auto_422498 ?auto_422497 ) ( ON ?auto_422499 ?auto_422498 ) ( ON ?auto_422500 ?auto_422499 ) ( ON ?auto_422501 ?auto_422500 ) ( ON ?auto_422502 ?auto_422501 ) ( ON ?auto_422503 ?auto_422502 ) ( ON ?auto_422504 ?auto_422503 ) ( ON ?auto_422505 ?auto_422504 ) ( not ( = ?auto_422495 ?auto_422496 ) ) ( not ( = ?auto_422495 ?auto_422497 ) ) ( not ( = ?auto_422495 ?auto_422498 ) ) ( not ( = ?auto_422495 ?auto_422499 ) ) ( not ( = ?auto_422495 ?auto_422500 ) ) ( not ( = ?auto_422495 ?auto_422501 ) ) ( not ( = ?auto_422495 ?auto_422502 ) ) ( not ( = ?auto_422495 ?auto_422503 ) ) ( not ( = ?auto_422495 ?auto_422504 ) ) ( not ( = ?auto_422495 ?auto_422505 ) ) ( not ( = ?auto_422495 ?auto_422506 ) ) ( not ( = ?auto_422495 ?auto_422507 ) ) ( not ( = ?auto_422495 ?auto_422508 ) ) ( not ( = ?auto_422495 ?auto_422509 ) ) ( not ( = ?auto_422496 ?auto_422497 ) ) ( not ( = ?auto_422496 ?auto_422498 ) ) ( not ( = ?auto_422496 ?auto_422499 ) ) ( not ( = ?auto_422496 ?auto_422500 ) ) ( not ( = ?auto_422496 ?auto_422501 ) ) ( not ( = ?auto_422496 ?auto_422502 ) ) ( not ( = ?auto_422496 ?auto_422503 ) ) ( not ( = ?auto_422496 ?auto_422504 ) ) ( not ( = ?auto_422496 ?auto_422505 ) ) ( not ( = ?auto_422496 ?auto_422506 ) ) ( not ( = ?auto_422496 ?auto_422507 ) ) ( not ( = ?auto_422496 ?auto_422508 ) ) ( not ( = ?auto_422496 ?auto_422509 ) ) ( not ( = ?auto_422497 ?auto_422498 ) ) ( not ( = ?auto_422497 ?auto_422499 ) ) ( not ( = ?auto_422497 ?auto_422500 ) ) ( not ( = ?auto_422497 ?auto_422501 ) ) ( not ( = ?auto_422497 ?auto_422502 ) ) ( not ( = ?auto_422497 ?auto_422503 ) ) ( not ( = ?auto_422497 ?auto_422504 ) ) ( not ( = ?auto_422497 ?auto_422505 ) ) ( not ( = ?auto_422497 ?auto_422506 ) ) ( not ( = ?auto_422497 ?auto_422507 ) ) ( not ( = ?auto_422497 ?auto_422508 ) ) ( not ( = ?auto_422497 ?auto_422509 ) ) ( not ( = ?auto_422498 ?auto_422499 ) ) ( not ( = ?auto_422498 ?auto_422500 ) ) ( not ( = ?auto_422498 ?auto_422501 ) ) ( not ( = ?auto_422498 ?auto_422502 ) ) ( not ( = ?auto_422498 ?auto_422503 ) ) ( not ( = ?auto_422498 ?auto_422504 ) ) ( not ( = ?auto_422498 ?auto_422505 ) ) ( not ( = ?auto_422498 ?auto_422506 ) ) ( not ( = ?auto_422498 ?auto_422507 ) ) ( not ( = ?auto_422498 ?auto_422508 ) ) ( not ( = ?auto_422498 ?auto_422509 ) ) ( not ( = ?auto_422499 ?auto_422500 ) ) ( not ( = ?auto_422499 ?auto_422501 ) ) ( not ( = ?auto_422499 ?auto_422502 ) ) ( not ( = ?auto_422499 ?auto_422503 ) ) ( not ( = ?auto_422499 ?auto_422504 ) ) ( not ( = ?auto_422499 ?auto_422505 ) ) ( not ( = ?auto_422499 ?auto_422506 ) ) ( not ( = ?auto_422499 ?auto_422507 ) ) ( not ( = ?auto_422499 ?auto_422508 ) ) ( not ( = ?auto_422499 ?auto_422509 ) ) ( not ( = ?auto_422500 ?auto_422501 ) ) ( not ( = ?auto_422500 ?auto_422502 ) ) ( not ( = ?auto_422500 ?auto_422503 ) ) ( not ( = ?auto_422500 ?auto_422504 ) ) ( not ( = ?auto_422500 ?auto_422505 ) ) ( not ( = ?auto_422500 ?auto_422506 ) ) ( not ( = ?auto_422500 ?auto_422507 ) ) ( not ( = ?auto_422500 ?auto_422508 ) ) ( not ( = ?auto_422500 ?auto_422509 ) ) ( not ( = ?auto_422501 ?auto_422502 ) ) ( not ( = ?auto_422501 ?auto_422503 ) ) ( not ( = ?auto_422501 ?auto_422504 ) ) ( not ( = ?auto_422501 ?auto_422505 ) ) ( not ( = ?auto_422501 ?auto_422506 ) ) ( not ( = ?auto_422501 ?auto_422507 ) ) ( not ( = ?auto_422501 ?auto_422508 ) ) ( not ( = ?auto_422501 ?auto_422509 ) ) ( not ( = ?auto_422502 ?auto_422503 ) ) ( not ( = ?auto_422502 ?auto_422504 ) ) ( not ( = ?auto_422502 ?auto_422505 ) ) ( not ( = ?auto_422502 ?auto_422506 ) ) ( not ( = ?auto_422502 ?auto_422507 ) ) ( not ( = ?auto_422502 ?auto_422508 ) ) ( not ( = ?auto_422502 ?auto_422509 ) ) ( not ( = ?auto_422503 ?auto_422504 ) ) ( not ( = ?auto_422503 ?auto_422505 ) ) ( not ( = ?auto_422503 ?auto_422506 ) ) ( not ( = ?auto_422503 ?auto_422507 ) ) ( not ( = ?auto_422503 ?auto_422508 ) ) ( not ( = ?auto_422503 ?auto_422509 ) ) ( not ( = ?auto_422504 ?auto_422505 ) ) ( not ( = ?auto_422504 ?auto_422506 ) ) ( not ( = ?auto_422504 ?auto_422507 ) ) ( not ( = ?auto_422504 ?auto_422508 ) ) ( not ( = ?auto_422504 ?auto_422509 ) ) ( not ( = ?auto_422505 ?auto_422506 ) ) ( not ( = ?auto_422505 ?auto_422507 ) ) ( not ( = ?auto_422505 ?auto_422508 ) ) ( not ( = ?auto_422505 ?auto_422509 ) ) ( not ( = ?auto_422506 ?auto_422507 ) ) ( not ( = ?auto_422506 ?auto_422508 ) ) ( not ( = ?auto_422506 ?auto_422509 ) ) ( not ( = ?auto_422507 ?auto_422508 ) ) ( not ( = ?auto_422507 ?auto_422509 ) ) ( not ( = ?auto_422508 ?auto_422509 ) ) ( ON ?auto_422508 ?auto_422509 ) ( ON ?auto_422507 ?auto_422508 ) ( CLEAR ?auto_422505 ) ( ON ?auto_422506 ?auto_422507 ) ( CLEAR ?auto_422506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_422495 ?auto_422496 ?auto_422497 ?auto_422498 ?auto_422499 ?auto_422500 ?auto_422501 ?auto_422502 ?auto_422503 ?auto_422504 ?auto_422505 ?auto_422506 )
      ( MAKE-15PILE ?auto_422495 ?auto_422496 ?auto_422497 ?auto_422498 ?auto_422499 ?auto_422500 ?auto_422501 ?auto_422502 ?auto_422503 ?auto_422504 ?auto_422505 ?auto_422506 ?auto_422507 ?auto_422508 ?auto_422509 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422525 - BLOCK
      ?auto_422526 - BLOCK
      ?auto_422527 - BLOCK
      ?auto_422528 - BLOCK
      ?auto_422529 - BLOCK
      ?auto_422530 - BLOCK
      ?auto_422531 - BLOCK
      ?auto_422532 - BLOCK
      ?auto_422533 - BLOCK
      ?auto_422534 - BLOCK
      ?auto_422535 - BLOCK
      ?auto_422536 - BLOCK
      ?auto_422537 - BLOCK
      ?auto_422538 - BLOCK
      ?auto_422539 - BLOCK
    )
    :vars
    (
      ?auto_422540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422539 ?auto_422540 ) ( ON-TABLE ?auto_422525 ) ( ON ?auto_422526 ?auto_422525 ) ( ON ?auto_422527 ?auto_422526 ) ( ON ?auto_422528 ?auto_422527 ) ( ON ?auto_422529 ?auto_422528 ) ( ON ?auto_422530 ?auto_422529 ) ( ON ?auto_422531 ?auto_422530 ) ( ON ?auto_422532 ?auto_422531 ) ( ON ?auto_422533 ?auto_422532 ) ( ON ?auto_422534 ?auto_422533 ) ( not ( = ?auto_422525 ?auto_422526 ) ) ( not ( = ?auto_422525 ?auto_422527 ) ) ( not ( = ?auto_422525 ?auto_422528 ) ) ( not ( = ?auto_422525 ?auto_422529 ) ) ( not ( = ?auto_422525 ?auto_422530 ) ) ( not ( = ?auto_422525 ?auto_422531 ) ) ( not ( = ?auto_422525 ?auto_422532 ) ) ( not ( = ?auto_422525 ?auto_422533 ) ) ( not ( = ?auto_422525 ?auto_422534 ) ) ( not ( = ?auto_422525 ?auto_422535 ) ) ( not ( = ?auto_422525 ?auto_422536 ) ) ( not ( = ?auto_422525 ?auto_422537 ) ) ( not ( = ?auto_422525 ?auto_422538 ) ) ( not ( = ?auto_422525 ?auto_422539 ) ) ( not ( = ?auto_422525 ?auto_422540 ) ) ( not ( = ?auto_422526 ?auto_422527 ) ) ( not ( = ?auto_422526 ?auto_422528 ) ) ( not ( = ?auto_422526 ?auto_422529 ) ) ( not ( = ?auto_422526 ?auto_422530 ) ) ( not ( = ?auto_422526 ?auto_422531 ) ) ( not ( = ?auto_422526 ?auto_422532 ) ) ( not ( = ?auto_422526 ?auto_422533 ) ) ( not ( = ?auto_422526 ?auto_422534 ) ) ( not ( = ?auto_422526 ?auto_422535 ) ) ( not ( = ?auto_422526 ?auto_422536 ) ) ( not ( = ?auto_422526 ?auto_422537 ) ) ( not ( = ?auto_422526 ?auto_422538 ) ) ( not ( = ?auto_422526 ?auto_422539 ) ) ( not ( = ?auto_422526 ?auto_422540 ) ) ( not ( = ?auto_422527 ?auto_422528 ) ) ( not ( = ?auto_422527 ?auto_422529 ) ) ( not ( = ?auto_422527 ?auto_422530 ) ) ( not ( = ?auto_422527 ?auto_422531 ) ) ( not ( = ?auto_422527 ?auto_422532 ) ) ( not ( = ?auto_422527 ?auto_422533 ) ) ( not ( = ?auto_422527 ?auto_422534 ) ) ( not ( = ?auto_422527 ?auto_422535 ) ) ( not ( = ?auto_422527 ?auto_422536 ) ) ( not ( = ?auto_422527 ?auto_422537 ) ) ( not ( = ?auto_422527 ?auto_422538 ) ) ( not ( = ?auto_422527 ?auto_422539 ) ) ( not ( = ?auto_422527 ?auto_422540 ) ) ( not ( = ?auto_422528 ?auto_422529 ) ) ( not ( = ?auto_422528 ?auto_422530 ) ) ( not ( = ?auto_422528 ?auto_422531 ) ) ( not ( = ?auto_422528 ?auto_422532 ) ) ( not ( = ?auto_422528 ?auto_422533 ) ) ( not ( = ?auto_422528 ?auto_422534 ) ) ( not ( = ?auto_422528 ?auto_422535 ) ) ( not ( = ?auto_422528 ?auto_422536 ) ) ( not ( = ?auto_422528 ?auto_422537 ) ) ( not ( = ?auto_422528 ?auto_422538 ) ) ( not ( = ?auto_422528 ?auto_422539 ) ) ( not ( = ?auto_422528 ?auto_422540 ) ) ( not ( = ?auto_422529 ?auto_422530 ) ) ( not ( = ?auto_422529 ?auto_422531 ) ) ( not ( = ?auto_422529 ?auto_422532 ) ) ( not ( = ?auto_422529 ?auto_422533 ) ) ( not ( = ?auto_422529 ?auto_422534 ) ) ( not ( = ?auto_422529 ?auto_422535 ) ) ( not ( = ?auto_422529 ?auto_422536 ) ) ( not ( = ?auto_422529 ?auto_422537 ) ) ( not ( = ?auto_422529 ?auto_422538 ) ) ( not ( = ?auto_422529 ?auto_422539 ) ) ( not ( = ?auto_422529 ?auto_422540 ) ) ( not ( = ?auto_422530 ?auto_422531 ) ) ( not ( = ?auto_422530 ?auto_422532 ) ) ( not ( = ?auto_422530 ?auto_422533 ) ) ( not ( = ?auto_422530 ?auto_422534 ) ) ( not ( = ?auto_422530 ?auto_422535 ) ) ( not ( = ?auto_422530 ?auto_422536 ) ) ( not ( = ?auto_422530 ?auto_422537 ) ) ( not ( = ?auto_422530 ?auto_422538 ) ) ( not ( = ?auto_422530 ?auto_422539 ) ) ( not ( = ?auto_422530 ?auto_422540 ) ) ( not ( = ?auto_422531 ?auto_422532 ) ) ( not ( = ?auto_422531 ?auto_422533 ) ) ( not ( = ?auto_422531 ?auto_422534 ) ) ( not ( = ?auto_422531 ?auto_422535 ) ) ( not ( = ?auto_422531 ?auto_422536 ) ) ( not ( = ?auto_422531 ?auto_422537 ) ) ( not ( = ?auto_422531 ?auto_422538 ) ) ( not ( = ?auto_422531 ?auto_422539 ) ) ( not ( = ?auto_422531 ?auto_422540 ) ) ( not ( = ?auto_422532 ?auto_422533 ) ) ( not ( = ?auto_422532 ?auto_422534 ) ) ( not ( = ?auto_422532 ?auto_422535 ) ) ( not ( = ?auto_422532 ?auto_422536 ) ) ( not ( = ?auto_422532 ?auto_422537 ) ) ( not ( = ?auto_422532 ?auto_422538 ) ) ( not ( = ?auto_422532 ?auto_422539 ) ) ( not ( = ?auto_422532 ?auto_422540 ) ) ( not ( = ?auto_422533 ?auto_422534 ) ) ( not ( = ?auto_422533 ?auto_422535 ) ) ( not ( = ?auto_422533 ?auto_422536 ) ) ( not ( = ?auto_422533 ?auto_422537 ) ) ( not ( = ?auto_422533 ?auto_422538 ) ) ( not ( = ?auto_422533 ?auto_422539 ) ) ( not ( = ?auto_422533 ?auto_422540 ) ) ( not ( = ?auto_422534 ?auto_422535 ) ) ( not ( = ?auto_422534 ?auto_422536 ) ) ( not ( = ?auto_422534 ?auto_422537 ) ) ( not ( = ?auto_422534 ?auto_422538 ) ) ( not ( = ?auto_422534 ?auto_422539 ) ) ( not ( = ?auto_422534 ?auto_422540 ) ) ( not ( = ?auto_422535 ?auto_422536 ) ) ( not ( = ?auto_422535 ?auto_422537 ) ) ( not ( = ?auto_422535 ?auto_422538 ) ) ( not ( = ?auto_422535 ?auto_422539 ) ) ( not ( = ?auto_422535 ?auto_422540 ) ) ( not ( = ?auto_422536 ?auto_422537 ) ) ( not ( = ?auto_422536 ?auto_422538 ) ) ( not ( = ?auto_422536 ?auto_422539 ) ) ( not ( = ?auto_422536 ?auto_422540 ) ) ( not ( = ?auto_422537 ?auto_422538 ) ) ( not ( = ?auto_422537 ?auto_422539 ) ) ( not ( = ?auto_422537 ?auto_422540 ) ) ( not ( = ?auto_422538 ?auto_422539 ) ) ( not ( = ?auto_422538 ?auto_422540 ) ) ( not ( = ?auto_422539 ?auto_422540 ) ) ( ON ?auto_422538 ?auto_422539 ) ( ON ?auto_422537 ?auto_422538 ) ( ON ?auto_422536 ?auto_422537 ) ( CLEAR ?auto_422534 ) ( ON ?auto_422535 ?auto_422536 ) ( CLEAR ?auto_422535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_422525 ?auto_422526 ?auto_422527 ?auto_422528 ?auto_422529 ?auto_422530 ?auto_422531 ?auto_422532 ?auto_422533 ?auto_422534 ?auto_422535 )
      ( MAKE-15PILE ?auto_422525 ?auto_422526 ?auto_422527 ?auto_422528 ?auto_422529 ?auto_422530 ?auto_422531 ?auto_422532 ?auto_422533 ?auto_422534 ?auto_422535 ?auto_422536 ?auto_422537 ?auto_422538 ?auto_422539 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422556 - BLOCK
      ?auto_422557 - BLOCK
      ?auto_422558 - BLOCK
      ?auto_422559 - BLOCK
      ?auto_422560 - BLOCK
      ?auto_422561 - BLOCK
      ?auto_422562 - BLOCK
      ?auto_422563 - BLOCK
      ?auto_422564 - BLOCK
      ?auto_422565 - BLOCK
      ?auto_422566 - BLOCK
      ?auto_422567 - BLOCK
      ?auto_422568 - BLOCK
      ?auto_422569 - BLOCK
      ?auto_422570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422570 ) ( ON-TABLE ?auto_422556 ) ( ON ?auto_422557 ?auto_422556 ) ( ON ?auto_422558 ?auto_422557 ) ( ON ?auto_422559 ?auto_422558 ) ( ON ?auto_422560 ?auto_422559 ) ( ON ?auto_422561 ?auto_422560 ) ( ON ?auto_422562 ?auto_422561 ) ( ON ?auto_422563 ?auto_422562 ) ( ON ?auto_422564 ?auto_422563 ) ( ON ?auto_422565 ?auto_422564 ) ( not ( = ?auto_422556 ?auto_422557 ) ) ( not ( = ?auto_422556 ?auto_422558 ) ) ( not ( = ?auto_422556 ?auto_422559 ) ) ( not ( = ?auto_422556 ?auto_422560 ) ) ( not ( = ?auto_422556 ?auto_422561 ) ) ( not ( = ?auto_422556 ?auto_422562 ) ) ( not ( = ?auto_422556 ?auto_422563 ) ) ( not ( = ?auto_422556 ?auto_422564 ) ) ( not ( = ?auto_422556 ?auto_422565 ) ) ( not ( = ?auto_422556 ?auto_422566 ) ) ( not ( = ?auto_422556 ?auto_422567 ) ) ( not ( = ?auto_422556 ?auto_422568 ) ) ( not ( = ?auto_422556 ?auto_422569 ) ) ( not ( = ?auto_422556 ?auto_422570 ) ) ( not ( = ?auto_422557 ?auto_422558 ) ) ( not ( = ?auto_422557 ?auto_422559 ) ) ( not ( = ?auto_422557 ?auto_422560 ) ) ( not ( = ?auto_422557 ?auto_422561 ) ) ( not ( = ?auto_422557 ?auto_422562 ) ) ( not ( = ?auto_422557 ?auto_422563 ) ) ( not ( = ?auto_422557 ?auto_422564 ) ) ( not ( = ?auto_422557 ?auto_422565 ) ) ( not ( = ?auto_422557 ?auto_422566 ) ) ( not ( = ?auto_422557 ?auto_422567 ) ) ( not ( = ?auto_422557 ?auto_422568 ) ) ( not ( = ?auto_422557 ?auto_422569 ) ) ( not ( = ?auto_422557 ?auto_422570 ) ) ( not ( = ?auto_422558 ?auto_422559 ) ) ( not ( = ?auto_422558 ?auto_422560 ) ) ( not ( = ?auto_422558 ?auto_422561 ) ) ( not ( = ?auto_422558 ?auto_422562 ) ) ( not ( = ?auto_422558 ?auto_422563 ) ) ( not ( = ?auto_422558 ?auto_422564 ) ) ( not ( = ?auto_422558 ?auto_422565 ) ) ( not ( = ?auto_422558 ?auto_422566 ) ) ( not ( = ?auto_422558 ?auto_422567 ) ) ( not ( = ?auto_422558 ?auto_422568 ) ) ( not ( = ?auto_422558 ?auto_422569 ) ) ( not ( = ?auto_422558 ?auto_422570 ) ) ( not ( = ?auto_422559 ?auto_422560 ) ) ( not ( = ?auto_422559 ?auto_422561 ) ) ( not ( = ?auto_422559 ?auto_422562 ) ) ( not ( = ?auto_422559 ?auto_422563 ) ) ( not ( = ?auto_422559 ?auto_422564 ) ) ( not ( = ?auto_422559 ?auto_422565 ) ) ( not ( = ?auto_422559 ?auto_422566 ) ) ( not ( = ?auto_422559 ?auto_422567 ) ) ( not ( = ?auto_422559 ?auto_422568 ) ) ( not ( = ?auto_422559 ?auto_422569 ) ) ( not ( = ?auto_422559 ?auto_422570 ) ) ( not ( = ?auto_422560 ?auto_422561 ) ) ( not ( = ?auto_422560 ?auto_422562 ) ) ( not ( = ?auto_422560 ?auto_422563 ) ) ( not ( = ?auto_422560 ?auto_422564 ) ) ( not ( = ?auto_422560 ?auto_422565 ) ) ( not ( = ?auto_422560 ?auto_422566 ) ) ( not ( = ?auto_422560 ?auto_422567 ) ) ( not ( = ?auto_422560 ?auto_422568 ) ) ( not ( = ?auto_422560 ?auto_422569 ) ) ( not ( = ?auto_422560 ?auto_422570 ) ) ( not ( = ?auto_422561 ?auto_422562 ) ) ( not ( = ?auto_422561 ?auto_422563 ) ) ( not ( = ?auto_422561 ?auto_422564 ) ) ( not ( = ?auto_422561 ?auto_422565 ) ) ( not ( = ?auto_422561 ?auto_422566 ) ) ( not ( = ?auto_422561 ?auto_422567 ) ) ( not ( = ?auto_422561 ?auto_422568 ) ) ( not ( = ?auto_422561 ?auto_422569 ) ) ( not ( = ?auto_422561 ?auto_422570 ) ) ( not ( = ?auto_422562 ?auto_422563 ) ) ( not ( = ?auto_422562 ?auto_422564 ) ) ( not ( = ?auto_422562 ?auto_422565 ) ) ( not ( = ?auto_422562 ?auto_422566 ) ) ( not ( = ?auto_422562 ?auto_422567 ) ) ( not ( = ?auto_422562 ?auto_422568 ) ) ( not ( = ?auto_422562 ?auto_422569 ) ) ( not ( = ?auto_422562 ?auto_422570 ) ) ( not ( = ?auto_422563 ?auto_422564 ) ) ( not ( = ?auto_422563 ?auto_422565 ) ) ( not ( = ?auto_422563 ?auto_422566 ) ) ( not ( = ?auto_422563 ?auto_422567 ) ) ( not ( = ?auto_422563 ?auto_422568 ) ) ( not ( = ?auto_422563 ?auto_422569 ) ) ( not ( = ?auto_422563 ?auto_422570 ) ) ( not ( = ?auto_422564 ?auto_422565 ) ) ( not ( = ?auto_422564 ?auto_422566 ) ) ( not ( = ?auto_422564 ?auto_422567 ) ) ( not ( = ?auto_422564 ?auto_422568 ) ) ( not ( = ?auto_422564 ?auto_422569 ) ) ( not ( = ?auto_422564 ?auto_422570 ) ) ( not ( = ?auto_422565 ?auto_422566 ) ) ( not ( = ?auto_422565 ?auto_422567 ) ) ( not ( = ?auto_422565 ?auto_422568 ) ) ( not ( = ?auto_422565 ?auto_422569 ) ) ( not ( = ?auto_422565 ?auto_422570 ) ) ( not ( = ?auto_422566 ?auto_422567 ) ) ( not ( = ?auto_422566 ?auto_422568 ) ) ( not ( = ?auto_422566 ?auto_422569 ) ) ( not ( = ?auto_422566 ?auto_422570 ) ) ( not ( = ?auto_422567 ?auto_422568 ) ) ( not ( = ?auto_422567 ?auto_422569 ) ) ( not ( = ?auto_422567 ?auto_422570 ) ) ( not ( = ?auto_422568 ?auto_422569 ) ) ( not ( = ?auto_422568 ?auto_422570 ) ) ( not ( = ?auto_422569 ?auto_422570 ) ) ( ON ?auto_422569 ?auto_422570 ) ( ON ?auto_422568 ?auto_422569 ) ( ON ?auto_422567 ?auto_422568 ) ( CLEAR ?auto_422565 ) ( ON ?auto_422566 ?auto_422567 ) ( CLEAR ?auto_422566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_422556 ?auto_422557 ?auto_422558 ?auto_422559 ?auto_422560 ?auto_422561 ?auto_422562 ?auto_422563 ?auto_422564 ?auto_422565 ?auto_422566 )
      ( MAKE-15PILE ?auto_422556 ?auto_422557 ?auto_422558 ?auto_422559 ?auto_422560 ?auto_422561 ?auto_422562 ?auto_422563 ?auto_422564 ?auto_422565 ?auto_422566 ?auto_422567 ?auto_422568 ?auto_422569 ?auto_422570 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422586 - BLOCK
      ?auto_422587 - BLOCK
      ?auto_422588 - BLOCK
      ?auto_422589 - BLOCK
      ?auto_422590 - BLOCK
      ?auto_422591 - BLOCK
      ?auto_422592 - BLOCK
      ?auto_422593 - BLOCK
      ?auto_422594 - BLOCK
      ?auto_422595 - BLOCK
      ?auto_422596 - BLOCK
      ?auto_422597 - BLOCK
      ?auto_422598 - BLOCK
      ?auto_422599 - BLOCK
      ?auto_422600 - BLOCK
    )
    :vars
    (
      ?auto_422601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422600 ?auto_422601 ) ( ON-TABLE ?auto_422586 ) ( ON ?auto_422587 ?auto_422586 ) ( ON ?auto_422588 ?auto_422587 ) ( ON ?auto_422589 ?auto_422588 ) ( ON ?auto_422590 ?auto_422589 ) ( ON ?auto_422591 ?auto_422590 ) ( ON ?auto_422592 ?auto_422591 ) ( ON ?auto_422593 ?auto_422592 ) ( ON ?auto_422594 ?auto_422593 ) ( not ( = ?auto_422586 ?auto_422587 ) ) ( not ( = ?auto_422586 ?auto_422588 ) ) ( not ( = ?auto_422586 ?auto_422589 ) ) ( not ( = ?auto_422586 ?auto_422590 ) ) ( not ( = ?auto_422586 ?auto_422591 ) ) ( not ( = ?auto_422586 ?auto_422592 ) ) ( not ( = ?auto_422586 ?auto_422593 ) ) ( not ( = ?auto_422586 ?auto_422594 ) ) ( not ( = ?auto_422586 ?auto_422595 ) ) ( not ( = ?auto_422586 ?auto_422596 ) ) ( not ( = ?auto_422586 ?auto_422597 ) ) ( not ( = ?auto_422586 ?auto_422598 ) ) ( not ( = ?auto_422586 ?auto_422599 ) ) ( not ( = ?auto_422586 ?auto_422600 ) ) ( not ( = ?auto_422586 ?auto_422601 ) ) ( not ( = ?auto_422587 ?auto_422588 ) ) ( not ( = ?auto_422587 ?auto_422589 ) ) ( not ( = ?auto_422587 ?auto_422590 ) ) ( not ( = ?auto_422587 ?auto_422591 ) ) ( not ( = ?auto_422587 ?auto_422592 ) ) ( not ( = ?auto_422587 ?auto_422593 ) ) ( not ( = ?auto_422587 ?auto_422594 ) ) ( not ( = ?auto_422587 ?auto_422595 ) ) ( not ( = ?auto_422587 ?auto_422596 ) ) ( not ( = ?auto_422587 ?auto_422597 ) ) ( not ( = ?auto_422587 ?auto_422598 ) ) ( not ( = ?auto_422587 ?auto_422599 ) ) ( not ( = ?auto_422587 ?auto_422600 ) ) ( not ( = ?auto_422587 ?auto_422601 ) ) ( not ( = ?auto_422588 ?auto_422589 ) ) ( not ( = ?auto_422588 ?auto_422590 ) ) ( not ( = ?auto_422588 ?auto_422591 ) ) ( not ( = ?auto_422588 ?auto_422592 ) ) ( not ( = ?auto_422588 ?auto_422593 ) ) ( not ( = ?auto_422588 ?auto_422594 ) ) ( not ( = ?auto_422588 ?auto_422595 ) ) ( not ( = ?auto_422588 ?auto_422596 ) ) ( not ( = ?auto_422588 ?auto_422597 ) ) ( not ( = ?auto_422588 ?auto_422598 ) ) ( not ( = ?auto_422588 ?auto_422599 ) ) ( not ( = ?auto_422588 ?auto_422600 ) ) ( not ( = ?auto_422588 ?auto_422601 ) ) ( not ( = ?auto_422589 ?auto_422590 ) ) ( not ( = ?auto_422589 ?auto_422591 ) ) ( not ( = ?auto_422589 ?auto_422592 ) ) ( not ( = ?auto_422589 ?auto_422593 ) ) ( not ( = ?auto_422589 ?auto_422594 ) ) ( not ( = ?auto_422589 ?auto_422595 ) ) ( not ( = ?auto_422589 ?auto_422596 ) ) ( not ( = ?auto_422589 ?auto_422597 ) ) ( not ( = ?auto_422589 ?auto_422598 ) ) ( not ( = ?auto_422589 ?auto_422599 ) ) ( not ( = ?auto_422589 ?auto_422600 ) ) ( not ( = ?auto_422589 ?auto_422601 ) ) ( not ( = ?auto_422590 ?auto_422591 ) ) ( not ( = ?auto_422590 ?auto_422592 ) ) ( not ( = ?auto_422590 ?auto_422593 ) ) ( not ( = ?auto_422590 ?auto_422594 ) ) ( not ( = ?auto_422590 ?auto_422595 ) ) ( not ( = ?auto_422590 ?auto_422596 ) ) ( not ( = ?auto_422590 ?auto_422597 ) ) ( not ( = ?auto_422590 ?auto_422598 ) ) ( not ( = ?auto_422590 ?auto_422599 ) ) ( not ( = ?auto_422590 ?auto_422600 ) ) ( not ( = ?auto_422590 ?auto_422601 ) ) ( not ( = ?auto_422591 ?auto_422592 ) ) ( not ( = ?auto_422591 ?auto_422593 ) ) ( not ( = ?auto_422591 ?auto_422594 ) ) ( not ( = ?auto_422591 ?auto_422595 ) ) ( not ( = ?auto_422591 ?auto_422596 ) ) ( not ( = ?auto_422591 ?auto_422597 ) ) ( not ( = ?auto_422591 ?auto_422598 ) ) ( not ( = ?auto_422591 ?auto_422599 ) ) ( not ( = ?auto_422591 ?auto_422600 ) ) ( not ( = ?auto_422591 ?auto_422601 ) ) ( not ( = ?auto_422592 ?auto_422593 ) ) ( not ( = ?auto_422592 ?auto_422594 ) ) ( not ( = ?auto_422592 ?auto_422595 ) ) ( not ( = ?auto_422592 ?auto_422596 ) ) ( not ( = ?auto_422592 ?auto_422597 ) ) ( not ( = ?auto_422592 ?auto_422598 ) ) ( not ( = ?auto_422592 ?auto_422599 ) ) ( not ( = ?auto_422592 ?auto_422600 ) ) ( not ( = ?auto_422592 ?auto_422601 ) ) ( not ( = ?auto_422593 ?auto_422594 ) ) ( not ( = ?auto_422593 ?auto_422595 ) ) ( not ( = ?auto_422593 ?auto_422596 ) ) ( not ( = ?auto_422593 ?auto_422597 ) ) ( not ( = ?auto_422593 ?auto_422598 ) ) ( not ( = ?auto_422593 ?auto_422599 ) ) ( not ( = ?auto_422593 ?auto_422600 ) ) ( not ( = ?auto_422593 ?auto_422601 ) ) ( not ( = ?auto_422594 ?auto_422595 ) ) ( not ( = ?auto_422594 ?auto_422596 ) ) ( not ( = ?auto_422594 ?auto_422597 ) ) ( not ( = ?auto_422594 ?auto_422598 ) ) ( not ( = ?auto_422594 ?auto_422599 ) ) ( not ( = ?auto_422594 ?auto_422600 ) ) ( not ( = ?auto_422594 ?auto_422601 ) ) ( not ( = ?auto_422595 ?auto_422596 ) ) ( not ( = ?auto_422595 ?auto_422597 ) ) ( not ( = ?auto_422595 ?auto_422598 ) ) ( not ( = ?auto_422595 ?auto_422599 ) ) ( not ( = ?auto_422595 ?auto_422600 ) ) ( not ( = ?auto_422595 ?auto_422601 ) ) ( not ( = ?auto_422596 ?auto_422597 ) ) ( not ( = ?auto_422596 ?auto_422598 ) ) ( not ( = ?auto_422596 ?auto_422599 ) ) ( not ( = ?auto_422596 ?auto_422600 ) ) ( not ( = ?auto_422596 ?auto_422601 ) ) ( not ( = ?auto_422597 ?auto_422598 ) ) ( not ( = ?auto_422597 ?auto_422599 ) ) ( not ( = ?auto_422597 ?auto_422600 ) ) ( not ( = ?auto_422597 ?auto_422601 ) ) ( not ( = ?auto_422598 ?auto_422599 ) ) ( not ( = ?auto_422598 ?auto_422600 ) ) ( not ( = ?auto_422598 ?auto_422601 ) ) ( not ( = ?auto_422599 ?auto_422600 ) ) ( not ( = ?auto_422599 ?auto_422601 ) ) ( not ( = ?auto_422600 ?auto_422601 ) ) ( ON ?auto_422599 ?auto_422600 ) ( ON ?auto_422598 ?auto_422599 ) ( ON ?auto_422597 ?auto_422598 ) ( ON ?auto_422596 ?auto_422597 ) ( CLEAR ?auto_422594 ) ( ON ?auto_422595 ?auto_422596 ) ( CLEAR ?auto_422595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_422586 ?auto_422587 ?auto_422588 ?auto_422589 ?auto_422590 ?auto_422591 ?auto_422592 ?auto_422593 ?auto_422594 ?auto_422595 )
      ( MAKE-15PILE ?auto_422586 ?auto_422587 ?auto_422588 ?auto_422589 ?auto_422590 ?auto_422591 ?auto_422592 ?auto_422593 ?auto_422594 ?auto_422595 ?auto_422596 ?auto_422597 ?auto_422598 ?auto_422599 ?auto_422600 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422617 - BLOCK
      ?auto_422618 - BLOCK
      ?auto_422619 - BLOCK
      ?auto_422620 - BLOCK
      ?auto_422621 - BLOCK
      ?auto_422622 - BLOCK
      ?auto_422623 - BLOCK
      ?auto_422624 - BLOCK
      ?auto_422625 - BLOCK
      ?auto_422626 - BLOCK
      ?auto_422627 - BLOCK
      ?auto_422628 - BLOCK
      ?auto_422629 - BLOCK
      ?auto_422630 - BLOCK
      ?auto_422631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422631 ) ( ON-TABLE ?auto_422617 ) ( ON ?auto_422618 ?auto_422617 ) ( ON ?auto_422619 ?auto_422618 ) ( ON ?auto_422620 ?auto_422619 ) ( ON ?auto_422621 ?auto_422620 ) ( ON ?auto_422622 ?auto_422621 ) ( ON ?auto_422623 ?auto_422622 ) ( ON ?auto_422624 ?auto_422623 ) ( ON ?auto_422625 ?auto_422624 ) ( not ( = ?auto_422617 ?auto_422618 ) ) ( not ( = ?auto_422617 ?auto_422619 ) ) ( not ( = ?auto_422617 ?auto_422620 ) ) ( not ( = ?auto_422617 ?auto_422621 ) ) ( not ( = ?auto_422617 ?auto_422622 ) ) ( not ( = ?auto_422617 ?auto_422623 ) ) ( not ( = ?auto_422617 ?auto_422624 ) ) ( not ( = ?auto_422617 ?auto_422625 ) ) ( not ( = ?auto_422617 ?auto_422626 ) ) ( not ( = ?auto_422617 ?auto_422627 ) ) ( not ( = ?auto_422617 ?auto_422628 ) ) ( not ( = ?auto_422617 ?auto_422629 ) ) ( not ( = ?auto_422617 ?auto_422630 ) ) ( not ( = ?auto_422617 ?auto_422631 ) ) ( not ( = ?auto_422618 ?auto_422619 ) ) ( not ( = ?auto_422618 ?auto_422620 ) ) ( not ( = ?auto_422618 ?auto_422621 ) ) ( not ( = ?auto_422618 ?auto_422622 ) ) ( not ( = ?auto_422618 ?auto_422623 ) ) ( not ( = ?auto_422618 ?auto_422624 ) ) ( not ( = ?auto_422618 ?auto_422625 ) ) ( not ( = ?auto_422618 ?auto_422626 ) ) ( not ( = ?auto_422618 ?auto_422627 ) ) ( not ( = ?auto_422618 ?auto_422628 ) ) ( not ( = ?auto_422618 ?auto_422629 ) ) ( not ( = ?auto_422618 ?auto_422630 ) ) ( not ( = ?auto_422618 ?auto_422631 ) ) ( not ( = ?auto_422619 ?auto_422620 ) ) ( not ( = ?auto_422619 ?auto_422621 ) ) ( not ( = ?auto_422619 ?auto_422622 ) ) ( not ( = ?auto_422619 ?auto_422623 ) ) ( not ( = ?auto_422619 ?auto_422624 ) ) ( not ( = ?auto_422619 ?auto_422625 ) ) ( not ( = ?auto_422619 ?auto_422626 ) ) ( not ( = ?auto_422619 ?auto_422627 ) ) ( not ( = ?auto_422619 ?auto_422628 ) ) ( not ( = ?auto_422619 ?auto_422629 ) ) ( not ( = ?auto_422619 ?auto_422630 ) ) ( not ( = ?auto_422619 ?auto_422631 ) ) ( not ( = ?auto_422620 ?auto_422621 ) ) ( not ( = ?auto_422620 ?auto_422622 ) ) ( not ( = ?auto_422620 ?auto_422623 ) ) ( not ( = ?auto_422620 ?auto_422624 ) ) ( not ( = ?auto_422620 ?auto_422625 ) ) ( not ( = ?auto_422620 ?auto_422626 ) ) ( not ( = ?auto_422620 ?auto_422627 ) ) ( not ( = ?auto_422620 ?auto_422628 ) ) ( not ( = ?auto_422620 ?auto_422629 ) ) ( not ( = ?auto_422620 ?auto_422630 ) ) ( not ( = ?auto_422620 ?auto_422631 ) ) ( not ( = ?auto_422621 ?auto_422622 ) ) ( not ( = ?auto_422621 ?auto_422623 ) ) ( not ( = ?auto_422621 ?auto_422624 ) ) ( not ( = ?auto_422621 ?auto_422625 ) ) ( not ( = ?auto_422621 ?auto_422626 ) ) ( not ( = ?auto_422621 ?auto_422627 ) ) ( not ( = ?auto_422621 ?auto_422628 ) ) ( not ( = ?auto_422621 ?auto_422629 ) ) ( not ( = ?auto_422621 ?auto_422630 ) ) ( not ( = ?auto_422621 ?auto_422631 ) ) ( not ( = ?auto_422622 ?auto_422623 ) ) ( not ( = ?auto_422622 ?auto_422624 ) ) ( not ( = ?auto_422622 ?auto_422625 ) ) ( not ( = ?auto_422622 ?auto_422626 ) ) ( not ( = ?auto_422622 ?auto_422627 ) ) ( not ( = ?auto_422622 ?auto_422628 ) ) ( not ( = ?auto_422622 ?auto_422629 ) ) ( not ( = ?auto_422622 ?auto_422630 ) ) ( not ( = ?auto_422622 ?auto_422631 ) ) ( not ( = ?auto_422623 ?auto_422624 ) ) ( not ( = ?auto_422623 ?auto_422625 ) ) ( not ( = ?auto_422623 ?auto_422626 ) ) ( not ( = ?auto_422623 ?auto_422627 ) ) ( not ( = ?auto_422623 ?auto_422628 ) ) ( not ( = ?auto_422623 ?auto_422629 ) ) ( not ( = ?auto_422623 ?auto_422630 ) ) ( not ( = ?auto_422623 ?auto_422631 ) ) ( not ( = ?auto_422624 ?auto_422625 ) ) ( not ( = ?auto_422624 ?auto_422626 ) ) ( not ( = ?auto_422624 ?auto_422627 ) ) ( not ( = ?auto_422624 ?auto_422628 ) ) ( not ( = ?auto_422624 ?auto_422629 ) ) ( not ( = ?auto_422624 ?auto_422630 ) ) ( not ( = ?auto_422624 ?auto_422631 ) ) ( not ( = ?auto_422625 ?auto_422626 ) ) ( not ( = ?auto_422625 ?auto_422627 ) ) ( not ( = ?auto_422625 ?auto_422628 ) ) ( not ( = ?auto_422625 ?auto_422629 ) ) ( not ( = ?auto_422625 ?auto_422630 ) ) ( not ( = ?auto_422625 ?auto_422631 ) ) ( not ( = ?auto_422626 ?auto_422627 ) ) ( not ( = ?auto_422626 ?auto_422628 ) ) ( not ( = ?auto_422626 ?auto_422629 ) ) ( not ( = ?auto_422626 ?auto_422630 ) ) ( not ( = ?auto_422626 ?auto_422631 ) ) ( not ( = ?auto_422627 ?auto_422628 ) ) ( not ( = ?auto_422627 ?auto_422629 ) ) ( not ( = ?auto_422627 ?auto_422630 ) ) ( not ( = ?auto_422627 ?auto_422631 ) ) ( not ( = ?auto_422628 ?auto_422629 ) ) ( not ( = ?auto_422628 ?auto_422630 ) ) ( not ( = ?auto_422628 ?auto_422631 ) ) ( not ( = ?auto_422629 ?auto_422630 ) ) ( not ( = ?auto_422629 ?auto_422631 ) ) ( not ( = ?auto_422630 ?auto_422631 ) ) ( ON ?auto_422630 ?auto_422631 ) ( ON ?auto_422629 ?auto_422630 ) ( ON ?auto_422628 ?auto_422629 ) ( ON ?auto_422627 ?auto_422628 ) ( CLEAR ?auto_422625 ) ( ON ?auto_422626 ?auto_422627 ) ( CLEAR ?auto_422626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_422617 ?auto_422618 ?auto_422619 ?auto_422620 ?auto_422621 ?auto_422622 ?auto_422623 ?auto_422624 ?auto_422625 ?auto_422626 )
      ( MAKE-15PILE ?auto_422617 ?auto_422618 ?auto_422619 ?auto_422620 ?auto_422621 ?auto_422622 ?auto_422623 ?auto_422624 ?auto_422625 ?auto_422626 ?auto_422627 ?auto_422628 ?auto_422629 ?auto_422630 ?auto_422631 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422647 - BLOCK
      ?auto_422648 - BLOCK
      ?auto_422649 - BLOCK
      ?auto_422650 - BLOCK
      ?auto_422651 - BLOCK
      ?auto_422652 - BLOCK
      ?auto_422653 - BLOCK
      ?auto_422654 - BLOCK
      ?auto_422655 - BLOCK
      ?auto_422656 - BLOCK
      ?auto_422657 - BLOCK
      ?auto_422658 - BLOCK
      ?auto_422659 - BLOCK
      ?auto_422660 - BLOCK
      ?auto_422661 - BLOCK
    )
    :vars
    (
      ?auto_422662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422661 ?auto_422662 ) ( ON-TABLE ?auto_422647 ) ( ON ?auto_422648 ?auto_422647 ) ( ON ?auto_422649 ?auto_422648 ) ( ON ?auto_422650 ?auto_422649 ) ( ON ?auto_422651 ?auto_422650 ) ( ON ?auto_422652 ?auto_422651 ) ( ON ?auto_422653 ?auto_422652 ) ( ON ?auto_422654 ?auto_422653 ) ( not ( = ?auto_422647 ?auto_422648 ) ) ( not ( = ?auto_422647 ?auto_422649 ) ) ( not ( = ?auto_422647 ?auto_422650 ) ) ( not ( = ?auto_422647 ?auto_422651 ) ) ( not ( = ?auto_422647 ?auto_422652 ) ) ( not ( = ?auto_422647 ?auto_422653 ) ) ( not ( = ?auto_422647 ?auto_422654 ) ) ( not ( = ?auto_422647 ?auto_422655 ) ) ( not ( = ?auto_422647 ?auto_422656 ) ) ( not ( = ?auto_422647 ?auto_422657 ) ) ( not ( = ?auto_422647 ?auto_422658 ) ) ( not ( = ?auto_422647 ?auto_422659 ) ) ( not ( = ?auto_422647 ?auto_422660 ) ) ( not ( = ?auto_422647 ?auto_422661 ) ) ( not ( = ?auto_422647 ?auto_422662 ) ) ( not ( = ?auto_422648 ?auto_422649 ) ) ( not ( = ?auto_422648 ?auto_422650 ) ) ( not ( = ?auto_422648 ?auto_422651 ) ) ( not ( = ?auto_422648 ?auto_422652 ) ) ( not ( = ?auto_422648 ?auto_422653 ) ) ( not ( = ?auto_422648 ?auto_422654 ) ) ( not ( = ?auto_422648 ?auto_422655 ) ) ( not ( = ?auto_422648 ?auto_422656 ) ) ( not ( = ?auto_422648 ?auto_422657 ) ) ( not ( = ?auto_422648 ?auto_422658 ) ) ( not ( = ?auto_422648 ?auto_422659 ) ) ( not ( = ?auto_422648 ?auto_422660 ) ) ( not ( = ?auto_422648 ?auto_422661 ) ) ( not ( = ?auto_422648 ?auto_422662 ) ) ( not ( = ?auto_422649 ?auto_422650 ) ) ( not ( = ?auto_422649 ?auto_422651 ) ) ( not ( = ?auto_422649 ?auto_422652 ) ) ( not ( = ?auto_422649 ?auto_422653 ) ) ( not ( = ?auto_422649 ?auto_422654 ) ) ( not ( = ?auto_422649 ?auto_422655 ) ) ( not ( = ?auto_422649 ?auto_422656 ) ) ( not ( = ?auto_422649 ?auto_422657 ) ) ( not ( = ?auto_422649 ?auto_422658 ) ) ( not ( = ?auto_422649 ?auto_422659 ) ) ( not ( = ?auto_422649 ?auto_422660 ) ) ( not ( = ?auto_422649 ?auto_422661 ) ) ( not ( = ?auto_422649 ?auto_422662 ) ) ( not ( = ?auto_422650 ?auto_422651 ) ) ( not ( = ?auto_422650 ?auto_422652 ) ) ( not ( = ?auto_422650 ?auto_422653 ) ) ( not ( = ?auto_422650 ?auto_422654 ) ) ( not ( = ?auto_422650 ?auto_422655 ) ) ( not ( = ?auto_422650 ?auto_422656 ) ) ( not ( = ?auto_422650 ?auto_422657 ) ) ( not ( = ?auto_422650 ?auto_422658 ) ) ( not ( = ?auto_422650 ?auto_422659 ) ) ( not ( = ?auto_422650 ?auto_422660 ) ) ( not ( = ?auto_422650 ?auto_422661 ) ) ( not ( = ?auto_422650 ?auto_422662 ) ) ( not ( = ?auto_422651 ?auto_422652 ) ) ( not ( = ?auto_422651 ?auto_422653 ) ) ( not ( = ?auto_422651 ?auto_422654 ) ) ( not ( = ?auto_422651 ?auto_422655 ) ) ( not ( = ?auto_422651 ?auto_422656 ) ) ( not ( = ?auto_422651 ?auto_422657 ) ) ( not ( = ?auto_422651 ?auto_422658 ) ) ( not ( = ?auto_422651 ?auto_422659 ) ) ( not ( = ?auto_422651 ?auto_422660 ) ) ( not ( = ?auto_422651 ?auto_422661 ) ) ( not ( = ?auto_422651 ?auto_422662 ) ) ( not ( = ?auto_422652 ?auto_422653 ) ) ( not ( = ?auto_422652 ?auto_422654 ) ) ( not ( = ?auto_422652 ?auto_422655 ) ) ( not ( = ?auto_422652 ?auto_422656 ) ) ( not ( = ?auto_422652 ?auto_422657 ) ) ( not ( = ?auto_422652 ?auto_422658 ) ) ( not ( = ?auto_422652 ?auto_422659 ) ) ( not ( = ?auto_422652 ?auto_422660 ) ) ( not ( = ?auto_422652 ?auto_422661 ) ) ( not ( = ?auto_422652 ?auto_422662 ) ) ( not ( = ?auto_422653 ?auto_422654 ) ) ( not ( = ?auto_422653 ?auto_422655 ) ) ( not ( = ?auto_422653 ?auto_422656 ) ) ( not ( = ?auto_422653 ?auto_422657 ) ) ( not ( = ?auto_422653 ?auto_422658 ) ) ( not ( = ?auto_422653 ?auto_422659 ) ) ( not ( = ?auto_422653 ?auto_422660 ) ) ( not ( = ?auto_422653 ?auto_422661 ) ) ( not ( = ?auto_422653 ?auto_422662 ) ) ( not ( = ?auto_422654 ?auto_422655 ) ) ( not ( = ?auto_422654 ?auto_422656 ) ) ( not ( = ?auto_422654 ?auto_422657 ) ) ( not ( = ?auto_422654 ?auto_422658 ) ) ( not ( = ?auto_422654 ?auto_422659 ) ) ( not ( = ?auto_422654 ?auto_422660 ) ) ( not ( = ?auto_422654 ?auto_422661 ) ) ( not ( = ?auto_422654 ?auto_422662 ) ) ( not ( = ?auto_422655 ?auto_422656 ) ) ( not ( = ?auto_422655 ?auto_422657 ) ) ( not ( = ?auto_422655 ?auto_422658 ) ) ( not ( = ?auto_422655 ?auto_422659 ) ) ( not ( = ?auto_422655 ?auto_422660 ) ) ( not ( = ?auto_422655 ?auto_422661 ) ) ( not ( = ?auto_422655 ?auto_422662 ) ) ( not ( = ?auto_422656 ?auto_422657 ) ) ( not ( = ?auto_422656 ?auto_422658 ) ) ( not ( = ?auto_422656 ?auto_422659 ) ) ( not ( = ?auto_422656 ?auto_422660 ) ) ( not ( = ?auto_422656 ?auto_422661 ) ) ( not ( = ?auto_422656 ?auto_422662 ) ) ( not ( = ?auto_422657 ?auto_422658 ) ) ( not ( = ?auto_422657 ?auto_422659 ) ) ( not ( = ?auto_422657 ?auto_422660 ) ) ( not ( = ?auto_422657 ?auto_422661 ) ) ( not ( = ?auto_422657 ?auto_422662 ) ) ( not ( = ?auto_422658 ?auto_422659 ) ) ( not ( = ?auto_422658 ?auto_422660 ) ) ( not ( = ?auto_422658 ?auto_422661 ) ) ( not ( = ?auto_422658 ?auto_422662 ) ) ( not ( = ?auto_422659 ?auto_422660 ) ) ( not ( = ?auto_422659 ?auto_422661 ) ) ( not ( = ?auto_422659 ?auto_422662 ) ) ( not ( = ?auto_422660 ?auto_422661 ) ) ( not ( = ?auto_422660 ?auto_422662 ) ) ( not ( = ?auto_422661 ?auto_422662 ) ) ( ON ?auto_422660 ?auto_422661 ) ( ON ?auto_422659 ?auto_422660 ) ( ON ?auto_422658 ?auto_422659 ) ( ON ?auto_422657 ?auto_422658 ) ( ON ?auto_422656 ?auto_422657 ) ( CLEAR ?auto_422654 ) ( ON ?auto_422655 ?auto_422656 ) ( CLEAR ?auto_422655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_422647 ?auto_422648 ?auto_422649 ?auto_422650 ?auto_422651 ?auto_422652 ?auto_422653 ?auto_422654 ?auto_422655 )
      ( MAKE-15PILE ?auto_422647 ?auto_422648 ?auto_422649 ?auto_422650 ?auto_422651 ?auto_422652 ?auto_422653 ?auto_422654 ?auto_422655 ?auto_422656 ?auto_422657 ?auto_422658 ?auto_422659 ?auto_422660 ?auto_422661 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422678 - BLOCK
      ?auto_422679 - BLOCK
      ?auto_422680 - BLOCK
      ?auto_422681 - BLOCK
      ?auto_422682 - BLOCK
      ?auto_422683 - BLOCK
      ?auto_422684 - BLOCK
      ?auto_422685 - BLOCK
      ?auto_422686 - BLOCK
      ?auto_422687 - BLOCK
      ?auto_422688 - BLOCK
      ?auto_422689 - BLOCK
      ?auto_422690 - BLOCK
      ?auto_422691 - BLOCK
      ?auto_422692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422692 ) ( ON-TABLE ?auto_422678 ) ( ON ?auto_422679 ?auto_422678 ) ( ON ?auto_422680 ?auto_422679 ) ( ON ?auto_422681 ?auto_422680 ) ( ON ?auto_422682 ?auto_422681 ) ( ON ?auto_422683 ?auto_422682 ) ( ON ?auto_422684 ?auto_422683 ) ( ON ?auto_422685 ?auto_422684 ) ( not ( = ?auto_422678 ?auto_422679 ) ) ( not ( = ?auto_422678 ?auto_422680 ) ) ( not ( = ?auto_422678 ?auto_422681 ) ) ( not ( = ?auto_422678 ?auto_422682 ) ) ( not ( = ?auto_422678 ?auto_422683 ) ) ( not ( = ?auto_422678 ?auto_422684 ) ) ( not ( = ?auto_422678 ?auto_422685 ) ) ( not ( = ?auto_422678 ?auto_422686 ) ) ( not ( = ?auto_422678 ?auto_422687 ) ) ( not ( = ?auto_422678 ?auto_422688 ) ) ( not ( = ?auto_422678 ?auto_422689 ) ) ( not ( = ?auto_422678 ?auto_422690 ) ) ( not ( = ?auto_422678 ?auto_422691 ) ) ( not ( = ?auto_422678 ?auto_422692 ) ) ( not ( = ?auto_422679 ?auto_422680 ) ) ( not ( = ?auto_422679 ?auto_422681 ) ) ( not ( = ?auto_422679 ?auto_422682 ) ) ( not ( = ?auto_422679 ?auto_422683 ) ) ( not ( = ?auto_422679 ?auto_422684 ) ) ( not ( = ?auto_422679 ?auto_422685 ) ) ( not ( = ?auto_422679 ?auto_422686 ) ) ( not ( = ?auto_422679 ?auto_422687 ) ) ( not ( = ?auto_422679 ?auto_422688 ) ) ( not ( = ?auto_422679 ?auto_422689 ) ) ( not ( = ?auto_422679 ?auto_422690 ) ) ( not ( = ?auto_422679 ?auto_422691 ) ) ( not ( = ?auto_422679 ?auto_422692 ) ) ( not ( = ?auto_422680 ?auto_422681 ) ) ( not ( = ?auto_422680 ?auto_422682 ) ) ( not ( = ?auto_422680 ?auto_422683 ) ) ( not ( = ?auto_422680 ?auto_422684 ) ) ( not ( = ?auto_422680 ?auto_422685 ) ) ( not ( = ?auto_422680 ?auto_422686 ) ) ( not ( = ?auto_422680 ?auto_422687 ) ) ( not ( = ?auto_422680 ?auto_422688 ) ) ( not ( = ?auto_422680 ?auto_422689 ) ) ( not ( = ?auto_422680 ?auto_422690 ) ) ( not ( = ?auto_422680 ?auto_422691 ) ) ( not ( = ?auto_422680 ?auto_422692 ) ) ( not ( = ?auto_422681 ?auto_422682 ) ) ( not ( = ?auto_422681 ?auto_422683 ) ) ( not ( = ?auto_422681 ?auto_422684 ) ) ( not ( = ?auto_422681 ?auto_422685 ) ) ( not ( = ?auto_422681 ?auto_422686 ) ) ( not ( = ?auto_422681 ?auto_422687 ) ) ( not ( = ?auto_422681 ?auto_422688 ) ) ( not ( = ?auto_422681 ?auto_422689 ) ) ( not ( = ?auto_422681 ?auto_422690 ) ) ( not ( = ?auto_422681 ?auto_422691 ) ) ( not ( = ?auto_422681 ?auto_422692 ) ) ( not ( = ?auto_422682 ?auto_422683 ) ) ( not ( = ?auto_422682 ?auto_422684 ) ) ( not ( = ?auto_422682 ?auto_422685 ) ) ( not ( = ?auto_422682 ?auto_422686 ) ) ( not ( = ?auto_422682 ?auto_422687 ) ) ( not ( = ?auto_422682 ?auto_422688 ) ) ( not ( = ?auto_422682 ?auto_422689 ) ) ( not ( = ?auto_422682 ?auto_422690 ) ) ( not ( = ?auto_422682 ?auto_422691 ) ) ( not ( = ?auto_422682 ?auto_422692 ) ) ( not ( = ?auto_422683 ?auto_422684 ) ) ( not ( = ?auto_422683 ?auto_422685 ) ) ( not ( = ?auto_422683 ?auto_422686 ) ) ( not ( = ?auto_422683 ?auto_422687 ) ) ( not ( = ?auto_422683 ?auto_422688 ) ) ( not ( = ?auto_422683 ?auto_422689 ) ) ( not ( = ?auto_422683 ?auto_422690 ) ) ( not ( = ?auto_422683 ?auto_422691 ) ) ( not ( = ?auto_422683 ?auto_422692 ) ) ( not ( = ?auto_422684 ?auto_422685 ) ) ( not ( = ?auto_422684 ?auto_422686 ) ) ( not ( = ?auto_422684 ?auto_422687 ) ) ( not ( = ?auto_422684 ?auto_422688 ) ) ( not ( = ?auto_422684 ?auto_422689 ) ) ( not ( = ?auto_422684 ?auto_422690 ) ) ( not ( = ?auto_422684 ?auto_422691 ) ) ( not ( = ?auto_422684 ?auto_422692 ) ) ( not ( = ?auto_422685 ?auto_422686 ) ) ( not ( = ?auto_422685 ?auto_422687 ) ) ( not ( = ?auto_422685 ?auto_422688 ) ) ( not ( = ?auto_422685 ?auto_422689 ) ) ( not ( = ?auto_422685 ?auto_422690 ) ) ( not ( = ?auto_422685 ?auto_422691 ) ) ( not ( = ?auto_422685 ?auto_422692 ) ) ( not ( = ?auto_422686 ?auto_422687 ) ) ( not ( = ?auto_422686 ?auto_422688 ) ) ( not ( = ?auto_422686 ?auto_422689 ) ) ( not ( = ?auto_422686 ?auto_422690 ) ) ( not ( = ?auto_422686 ?auto_422691 ) ) ( not ( = ?auto_422686 ?auto_422692 ) ) ( not ( = ?auto_422687 ?auto_422688 ) ) ( not ( = ?auto_422687 ?auto_422689 ) ) ( not ( = ?auto_422687 ?auto_422690 ) ) ( not ( = ?auto_422687 ?auto_422691 ) ) ( not ( = ?auto_422687 ?auto_422692 ) ) ( not ( = ?auto_422688 ?auto_422689 ) ) ( not ( = ?auto_422688 ?auto_422690 ) ) ( not ( = ?auto_422688 ?auto_422691 ) ) ( not ( = ?auto_422688 ?auto_422692 ) ) ( not ( = ?auto_422689 ?auto_422690 ) ) ( not ( = ?auto_422689 ?auto_422691 ) ) ( not ( = ?auto_422689 ?auto_422692 ) ) ( not ( = ?auto_422690 ?auto_422691 ) ) ( not ( = ?auto_422690 ?auto_422692 ) ) ( not ( = ?auto_422691 ?auto_422692 ) ) ( ON ?auto_422691 ?auto_422692 ) ( ON ?auto_422690 ?auto_422691 ) ( ON ?auto_422689 ?auto_422690 ) ( ON ?auto_422688 ?auto_422689 ) ( ON ?auto_422687 ?auto_422688 ) ( CLEAR ?auto_422685 ) ( ON ?auto_422686 ?auto_422687 ) ( CLEAR ?auto_422686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_422678 ?auto_422679 ?auto_422680 ?auto_422681 ?auto_422682 ?auto_422683 ?auto_422684 ?auto_422685 ?auto_422686 )
      ( MAKE-15PILE ?auto_422678 ?auto_422679 ?auto_422680 ?auto_422681 ?auto_422682 ?auto_422683 ?auto_422684 ?auto_422685 ?auto_422686 ?auto_422687 ?auto_422688 ?auto_422689 ?auto_422690 ?auto_422691 ?auto_422692 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422708 - BLOCK
      ?auto_422709 - BLOCK
      ?auto_422710 - BLOCK
      ?auto_422711 - BLOCK
      ?auto_422712 - BLOCK
      ?auto_422713 - BLOCK
      ?auto_422714 - BLOCK
      ?auto_422715 - BLOCK
      ?auto_422716 - BLOCK
      ?auto_422717 - BLOCK
      ?auto_422718 - BLOCK
      ?auto_422719 - BLOCK
      ?auto_422720 - BLOCK
      ?auto_422721 - BLOCK
      ?auto_422722 - BLOCK
    )
    :vars
    (
      ?auto_422723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422722 ?auto_422723 ) ( ON-TABLE ?auto_422708 ) ( ON ?auto_422709 ?auto_422708 ) ( ON ?auto_422710 ?auto_422709 ) ( ON ?auto_422711 ?auto_422710 ) ( ON ?auto_422712 ?auto_422711 ) ( ON ?auto_422713 ?auto_422712 ) ( ON ?auto_422714 ?auto_422713 ) ( not ( = ?auto_422708 ?auto_422709 ) ) ( not ( = ?auto_422708 ?auto_422710 ) ) ( not ( = ?auto_422708 ?auto_422711 ) ) ( not ( = ?auto_422708 ?auto_422712 ) ) ( not ( = ?auto_422708 ?auto_422713 ) ) ( not ( = ?auto_422708 ?auto_422714 ) ) ( not ( = ?auto_422708 ?auto_422715 ) ) ( not ( = ?auto_422708 ?auto_422716 ) ) ( not ( = ?auto_422708 ?auto_422717 ) ) ( not ( = ?auto_422708 ?auto_422718 ) ) ( not ( = ?auto_422708 ?auto_422719 ) ) ( not ( = ?auto_422708 ?auto_422720 ) ) ( not ( = ?auto_422708 ?auto_422721 ) ) ( not ( = ?auto_422708 ?auto_422722 ) ) ( not ( = ?auto_422708 ?auto_422723 ) ) ( not ( = ?auto_422709 ?auto_422710 ) ) ( not ( = ?auto_422709 ?auto_422711 ) ) ( not ( = ?auto_422709 ?auto_422712 ) ) ( not ( = ?auto_422709 ?auto_422713 ) ) ( not ( = ?auto_422709 ?auto_422714 ) ) ( not ( = ?auto_422709 ?auto_422715 ) ) ( not ( = ?auto_422709 ?auto_422716 ) ) ( not ( = ?auto_422709 ?auto_422717 ) ) ( not ( = ?auto_422709 ?auto_422718 ) ) ( not ( = ?auto_422709 ?auto_422719 ) ) ( not ( = ?auto_422709 ?auto_422720 ) ) ( not ( = ?auto_422709 ?auto_422721 ) ) ( not ( = ?auto_422709 ?auto_422722 ) ) ( not ( = ?auto_422709 ?auto_422723 ) ) ( not ( = ?auto_422710 ?auto_422711 ) ) ( not ( = ?auto_422710 ?auto_422712 ) ) ( not ( = ?auto_422710 ?auto_422713 ) ) ( not ( = ?auto_422710 ?auto_422714 ) ) ( not ( = ?auto_422710 ?auto_422715 ) ) ( not ( = ?auto_422710 ?auto_422716 ) ) ( not ( = ?auto_422710 ?auto_422717 ) ) ( not ( = ?auto_422710 ?auto_422718 ) ) ( not ( = ?auto_422710 ?auto_422719 ) ) ( not ( = ?auto_422710 ?auto_422720 ) ) ( not ( = ?auto_422710 ?auto_422721 ) ) ( not ( = ?auto_422710 ?auto_422722 ) ) ( not ( = ?auto_422710 ?auto_422723 ) ) ( not ( = ?auto_422711 ?auto_422712 ) ) ( not ( = ?auto_422711 ?auto_422713 ) ) ( not ( = ?auto_422711 ?auto_422714 ) ) ( not ( = ?auto_422711 ?auto_422715 ) ) ( not ( = ?auto_422711 ?auto_422716 ) ) ( not ( = ?auto_422711 ?auto_422717 ) ) ( not ( = ?auto_422711 ?auto_422718 ) ) ( not ( = ?auto_422711 ?auto_422719 ) ) ( not ( = ?auto_422711 ?auto_422720 ) ) ( not ( = ?auto_422711 ?auto_422721 ) ) ( not ( = ?auto_422711 ?auto_422722 ) ) ( not ( = ?auto_422711 ?auto_422723 ) ) ( not ( = ?auto_422712 ?auto_422713 ) ) ( not ( = ?auto_422712 ?auto_422714 ) ) ( not ( = ?auto_422712 ?auto_422715 ) ) ( not ( = ?auto_422712 ?auto_422716 ) ) ( not ( = ?auto_422712 ?auto_422717 ) ) ( not ( = ?auto_422712 ?auto_422718 ) ) ( not ( = ?auto_422712 ?auto_422719 ) ) ( not ( = ?auto_422712 ?auto_422720 ) ) ( not ( = ?auto_422712 ?auto_422721 ) ) ( not ( = ?auto_422712 ?auto_422722 ) ) ( not ( = ?auto_422712 ?auto_422723 ) ) ( not ( = ?auto_422713 ?auto_422714 ) ) ( not ( = ?auto_422713 ?auto_422715 ) ) ( not ( = ?auto_422713 ?auto_422716 ) ) ( not ( = ?auto_422713 ?auto_422717 ) ) ( not ( = ?auto_422713 ?auto_422718 ) ) ( not ( = ?auto_422713 ?auto_422719 ) ) ( not ( = ?auto_422713 ?auto_422720 ) ) ( not ( = ?auto_422713 ?auto_422721 ) ) ( not ( = ?auto_422713 ?auto_422722 ) ) ( not ( = ?auto_422713 ?auto_422723 ) ) ( not ( = ?auto_422714 ?auto_422715 ) ) ( not ( = ?auto_422714 ?auto_422716 ) ) ( not ( = ?auto_422714 ?auto_422717 ) ) ( not ( = ?auto_422714 ?auto_422718 ) ) ( not ( = ?auto_422714 ?auto_422719 ) ) ( not ( = ?auto_422714 ?auto_422720 ) ) ( not ( = ?auto_422714 ?auto_422721 ) ) ( not ( = ?auto_422714 ?auto_422722 ) ) ( not ( = ?auto_422714 ?auto_422723 ) ) ( not ( = ?auto_422715 ?auto_422716 ) ) ( not ( = ?auto_422715 ?auto_422717 ) ) ( not ( = ?auto_422715 ?auto_422718 ) ) ( not ( = ?auto_422715 ?auto_422719 ) ) ( not ( = ?auto_422715 ?auto_422720 ) ) ( not ( = ?auto_422715 ?auto_422721 ) ) ( not ( = ?auto_422715 ?auto_422722 ) ) ( not ( = ?auto_422715 ?auto_422723 ) ) ( not ( = ?auto_422716 ?auto_422717 ) ) ( not ( = ?auto_422716 ?auto_422718 ) ) ( not ( = ?auto_422716 ?auto_422719 ) ) ( not ( = ?auto_422716 ?auto_422720 ) ) ( not ( = ?auto_422716 ?auto_422721 ) ) ( not ( = ?auto_422716 ?auto_422722 ) ) ( not ( = ?auto_422716 ?auto_422723 ) ) ( not ( = ?auto_422717 ?auto_422718 ) ) ( not ( = ?auto_422717 ?auto_422719 ) ) ( not ( = ?auto_422717 ?auto_422720 ) ) ( not ( = ?auto_422717 ?auto_422721 ) ) ( not ( = ?auto_422717 ?auto_422722 ) ) ( not ( = ?auto_422717 ?auto_422723 ) ) ( not ( = ?auto_422718 ?auto_422719 ) ) ( not ( = ?auto_422718 ?auto_422720 ) ) ( not ( = ?auto_422718 ?auto_422721 ) ) ( not ( = ?auto_422718 ?auto_422722 ) ) ( not ( = ?auto_422718 ?auto_422723 ) ) ( not ( = ?auto_422719 ?auto_422720 ) ) ( not ( = ?auto_422719 ?auto_422721 ) ) ( not ( = ?auto_422719 ?auto_422722 ) ) ( not ( = ?auto_422719 ?auto_422723 ) ) ( not ( = ?auto_422720 ?auto_422721 ) ) ( not ( = ?auto_422720 ?auto_422722 ) ) ( not ( = ?auto_422720 ?auto_422723 ) ) ( not ( = ?auto_422721 ?auto_422722 ) ) ( not ( = ?auto_422721 ?auto_422723 ) ) ( not ( = ?auto_422722 ?auto_422723 ) ) ( ON ?auto_422721 ?auto_422722 ) ( ON ?auto_422720 ?auto_422721 ) ( ON ?auto_422719 ?auto_422720 ) ( ON ?auto_422718 ?auto_422719 ) ( ON ?auto_422717 ?auto_422718 ) ( ON ?auto_422716 ?auto_422717 ) ( CLEAR ?auto_422714 ) ( ON ?auto_422715 ?auto_422716 ) ( CLEAR ?auto_422715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_422708 ?auto_422709 ?auto_422710 ?auto_422711 ?auto_422712 ?auto_422713 ?auto_422714 ?auto_422715 )
      ( MAKE-15PILE ?auto_422708 ?auto_422709 ?auto_422710 ?auto_422711 ?auto_422712 ?auto_422713 ?auto_422714 ?auto_422715 ?auto_422716 ?auto_422717 ?auto_422718 ?auto_422719 ?auto_422720 ?auto_422721 ?auto_422722 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422739 - BLOCK
      ?auto_422740 - BLOCK
      ?auto_422741 - BLOCK
      ?auto_422742 - BLOCK
      ?auto_422743 - BLOCK
      ?auto_422744 - BLOCK
      ?auto_422745 - BLOCK
      ?auto_422746 - BLOCK
      ?auto_422747 - BLOCK
      ?auto_422748 - BLOCK
      ?auto_422749 - BLOCK
      ?auto_422750 - BLOCK
      ?auto_422751 - BLOCK
      ?auto_422752 - BLOCK
      ?auto_422753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422753 ) ( ON-TABLE ?auto_422739 ) ( ON ?auto_422740 ?auto_422739 ) ( ON ?auto_422741 ?auto_422740 ) ( ON ?auto_422742 ?auto_422741 ) ( ON ?auto_422743 ?auto_422742 ) ( ON ?auto_422744 ?auto_422743 ) ( ON ?auto_422745 ?auto_422744 ) ( not ( = ?auto_422739 ?auto_422740 ) ) ( not ( = ?auto_422739 ?auto_422741 ) ) ( not ( = ?auto_422739 ?auto_422742 ) ) ( not ( = ?auto_422739 ?auto_422743 ) ) ( not ( = ?auto_422739 ?auto_422744 ) ) ( not ( = ?auto_422739 ?auto_422745 ) ) ( not ( = ?auto_422739 ?auto_422746 ) ) ( not ( = ?auto_422739 ?auto_422747 ) ) ( not ( = ?auto_422739 ?auto_422748 ) ) ( not ( = ?auto_422739 ?auto_422749 ) ) ( not ( = ?auto_422739 ?auto_422750 ) ) ( not ( = ?auto_422739 ?auto_422751 ) ) ( not ( = ?auto_422739 ?auto_422752 ) ) ( not ( = ?auto_422739 ?auto_422753 ) ) ( not ( = ?auto_422740 ?auto_422741 ) ) ( not ( = ?auto_422740 ?auto_422742 ) ) ( not ( = ?auto_422740 ?auto_422743 ) ) ( not ( = ?auto_422740 ?auto_422744 ) ) ( not ( = ?auto_422740 ?auto_422745 ) ) ( not ( = ?auto_422740 ?auto_422746 ) ) ( not ( = ?auto_422740 ?auto_422747 ) ) ( not ( = ?auto_422740 ?auto_422748 ) ) ( not ( = ?auto_422740 ?auto_422749 ) ) ( not ( = ?auto_422740 ?auto_422750 ) ) ( not ( = ?auto_422740 ?auto_422751 ) ) ( not ( = ?auto_422740 ?auto_422752 ) ) ( not ( = ?auto_422740 ?auto_422753 ) ) ( not ( = ?auto_422741 ?auto_422742 ) ) ( not ( = ?auto_422741 ?auto_422743 ) ) ( not ( = ?auto_422741 ?auto_422744 ) ) ( not ( = ?auto_422741 ?auto_422745 ) ) ( not ( = ?auto_422741 ?auto_422746 ) ) ( not ( = ?auto_422741 ?auto_422747 ) ) ( not ( = ?auto_422741 ?auto_422748 ) ) ( not ( = ?auto_422741 ?auto_422749 ) ) ( not ( = ?auto_422741 ?auto_422750 ) ) ( not ( = ?auto_422741 ?auto_422751 ) ) ( not ( = ?auto_422741 ?auto_422752 ) ) ( not ( = ?auto_422741 ?auto_422753 ) ) ( not ( = ?auto_422742 ?auto_422743 ) ) ( not ( = ?auto_422742 ?auto_422744 ) ) ( not ( = ?auto_422742 ?auto_422745 ) ) ( not ( = ?auto_422742 ?auto_422746 ) ) ( not ( = ?auto_422742 ?auto_422747 ) ) ( not ( = ?auto_422742 ?auto_422748 ) ) ( not ( = ?auto_422742 ?auto_422749 ) ) ( not ( = ?auto_422742 ?auto_422750 ) ) ( not ( = ?auto_422742 ?auto_422751 ) ) ( not ( = ?auto_422742 ?auto_422752 ) ) ( not ( = ?auto_422742 ?auto_422753 ) ) ( not ( = ?auto_422743 ?auto_422744 ) ) ( not ( = ?auto_422743 ?auto_422745 ) ) ( not ( = ?auto_422743 ?auto_422746 ) ) ( not ( = ?auto_422743 ?auto_422747 ) ) ( not ( = ?auto_422743 ?auto_422748 ) ) ( not ( = ?auto_422743 ?auto_422749 ) ) ( not ( = ?auto_422743 ?auto_422750 ) ) ( not ( = ?auto_422743 ?auto_422751 ) ) ( not ( = ?auto_422743 ?auto_422752 ) ) ( not ( = ?auto_422743 ?auto_422753 ) ) ( not ( = ?auto_422744 ?auto_422745 ) ) ( not ( = ?auto_422744 ?auto_422746 ) ) ( not ( = ?auto_422744 ?auto_422747 ) ) ( not ( = ?auto_422744 ?auto_422748 ) ) ( not ( = ?auto_422744 ?auto_422749 ) ) ( not ( = ?auto_422744 ?auto_422750 ) ) ( not ( = ?auto_422744 ?auto_422751 ) ) ( not ( = ?auto_422744 ?auto_422752 ) ) ( not ( = ?auto_422744 ?auto_422753 ) ) ( not ( = ?auto_422745 ?auto_422746 ) ) ( not ( = ?auto_422745 ?auto_422747 ) ) ( not ( = ?auto_422745 ?auto_422748 ) ) ( not ( = ?auto_422745 ?auto_422749 ) ) ( not ( = ?auto_422745 ?auto_422750 ) ) ( not ( = ?auto_422745 ?auto_422751 ) ) ( not ( = ?auto_422745 ?auto_422752 ) ) ( not ( = ?auto_422745 ?auto_422753 ) ) ( not ( = ?auto_422746 ?auto_422747 ) ) ( not ( = ?auto_422746 ?auto_422748 ) ) ( not ( = ?auto_422746 ?auto_422749 ) ) ( not ( = ?auto_422746 ?auto_422750 ) ) ( not ( = ?auto_422746 ?auto_422751 ) ) ( not ( = ?auto_422746 ?auto_422752 ) ) ( not ( = ?auto_422746 ?auto_422753 ) ) ( not ( = ?auto_422747 ?auto_422748 ) ) ( not ( = ?auto_422747 ?auto_422749 ) ) ( not ( = ?auto_422747 ?auto_422750 ) ) ( not ( = ?auto_422747 ?auto_422751 ) ) ( not ( = ?auto_422747 ?auto_422752 ) ) ( not ( = ?auto_422747 ?auto_422753 ) ) ( not ( = ?auto_422748 ?auto_422749 ) ) ( not ( = ?auto_422748 ?auto_422750 ) ) ( not ( = ?auto_422748 ?auto_422751 ) ) ( not ( = ?auto_422748 ?auto_422752 ) ) ( not ( = ?auto_422748 ?auto_422753 ) ) ( not ( = ?auto_422749 ?auto_422750 ) ) ( not ( = ?auto_422749 ?auto_422751 ) ) ( not ( = ?auto_422749 ?auto_422752 ) ) ( not ( = ?auto_422749 ?auto_422753 ) ) ( not ( = ?auto_422750 ?auto_422751 ) ) ( not ( = ?auto_422750 ?auto_422752 ) ) ( not ( = ?auto_422750 ?auto_422753 ) ) ( not ( = ?auto_422751 ?auto_422752 ) ) ( not ( = ?auto_422751 ?auto_422753 ) ) ( not ( = ?auto_422752 ?auto_422753 ) ) ( ON ?auto_422752 ?auto_422753 ) ( ON ?auto_422751 ?auto_422752 ) ( ON ?auto_422750 ?auto_422751 ) ( ON ?auto_422749 ?auto_422750 ) ( ON ?auto_422748 ?auto_422749 ) ( ON ?auto_422747 ?auto_422748 ) ( CLEAR ?auto_422745 ) ( ON ?auto_422746 ?auto_422747 ) ( CLEAR ?auto_422746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_422739 ?auto_422740 ?auto_422741 ?auto_422742 ?auto_422743 ?auto_422744 ?auto_422745 ?auto_422746 )
      ( MAKE-15PILE ?auto_422739 ?auto_422740 ?auto_422741 ?auto_422742 ?auto_422743 ?auto_422744 ?auto_422745 ?auto_422746 ?auto_422747 ?auto_422748 ?auto_422749 ?auto_422750 ?auto_422751 ?auto_422752 ?auto_422753 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422769 - BLOCK
      ?auto_422770 - BLOCK
      ?auto_422771 - BLOCK
      ?auto_422772 - BLOCK
      ?auto_422773 - BLOCK
      ?auto_422774 - BLOCK
      ?auto_422775 - BLOCK
      ?auto_422776 - BLOCK
      ?auto_422777 - BLOCK
      ?auto_422778 - BLOCK
      ?auto_422779 - BLOCK
      ?auto_422780 - BLOCK
      ?auto_422781 - BLOCK
      ?auto_422782 - BLOCK
      ?auto_422783 - BLOCK
    )
    :vars
    (
      ?auto_422784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422783 ?auto_422784 ) ( ON-TABLE ?auto_422769 ) ( ON ?auto_422770 ?auto_422769 ) ( ON ?auto_422771 ?auto_422770 ) ( ON ?auto_422772 ?auto_422771 ) ( ON ?auto_422773 ?auto_422772 ) ( ON ?auto_422774 ?auto_422773 ) ( not ( = ?auto_422769 ?auto_422770 ) ) ( not ( = ?auto_422769 ?auto_422771 ) ) ( not ( = ?auto_422769 ?auto_422772 ) ) ( not ( = ?auto_422769 ?auto_422773 ) ) ( not ( = ?auto_422769 ?auto_422774 ) ) ( not ( = ?auto_422769 ?auto_422775 ) ) ( not ( = ?auto_422769 ?auto_422776 ) ) ( not ( = ?auto_422769 ?auto_422777 ) ) ( not ( = ?auto_422769 ?auto_422778 ) ) ( not ( = ?auto_422769 ?auto_422779 ) ) ( not ( = ?auto_422769 ?auto_422780 ) ) ( not ( = ?auto_422769 ?auto_422781 ) ) ( not ( = ?auto_422769 ?auto_422782 ) ) ( not ( = ?auto_422769 ?auto_422783 ) ) ( not ( = ?auto_422769 ?auto_422784 ) ) ( not ( = ?auto_422770 ?auto_422771 ) ) ( not ( = ?auto_422770 ?auto_422772 ) ) ( not ( = ?auto_422770 ?auto_422773 ) ) ( not ( = ?auto_422770 ?auto_422774 ) ) ( not ( = ?auto_422770 ?auto_422775 ) ) ( not ( = ?auto_422770 ?auto_422776 ) ) ( not ( = ?auto_422770 ?auto_422777 ) ) ( not ( = ?auto_422770 ?auto_422778 ) ) ( not ( = ?auto_422770 ?auto_422779 ) ) ( not ( = ?auto_422770 ?auto_422780 ) ) ( not ( = ?auto_422770 ?auto_422781 ) ) ( not ( = ?auto_422770 ?auto_422782 ) ) ( not ( = ?auto_422770 ?auto_422783 ) ) ( not ( = ?auto_422770 ?auto_422784 ) ) ( not ( = ?auto_422771 ?auto_422772 ) ) ( not ( = ?auto_422771 ?auto_422773 ) ) ( not ( = ?auto_422771 ?auto_422774 ) ) ( not ( = ?auto_422771 ?auto_422775 ) ) ( not ( = ?auto_422771 ?auto_422776 ) ) ( not ( = ?auto_422771 ?auto_422777 ) ) ( not ( = ?auto_422771 ?auto_422778 ) ) ( not ( = ?auto_422771 ?auto_422779 ) ) ( not ( = ?auto_422771 ?auto_422780 ) ) ( not ( = ?auto_422771 ?auto_422781 ) ) ( not ( = ?auto_422771 ?auto_422782 ) ) ( not ( = ?auto_422771 ?auto_422783 ) ) ( not ( = ?auto_422771 ?auto_422784 ) ) ( not ( = ?auto_422772 ?auto_422773 ) ) ( not ( = ?auto_422772 ?auto_422774 ) ) ( not ( = ?auto_422772 ?auto_422775 ) ) ( not ( = ?auto_422772 ?auto_422776 ) ) ( not ( = ?auto_422772 ?auto_422777 ) ) ( not ( = ?auto_422772 ?auto_422778 ) ) ( not ( = ?auto_422772 ?auto_422779 ) ) ( not ( = ?auto_422772 ?auto_422780 ) ) ( not ( = ?auto_422772 ?auto_422781 ) ) ( not ( = ?auto_422772 ?auto_422782 ) ) ( not ( = ?auto_422772 ?auto_422783 ) ) ( not ( = ?auto_422772 ?auto_422784 ) ) ( not ( = ?auto_422773 ?auto_422774 ) ) ( not ( = ?auto_422773 ?auto_422775 ) ) ( not ( = ?auto_422773 ?auto_422776 ) ) ( not ( = ?auto_422773 ?auto_422777 ) ) ( not ( = ?auto_422773 ?auto_422778 ) ) ( not ( = ?auto_422773 ?auto_422779 ) ) ( not ( = ?auto_422773 ?auto_422780 ) ) ( not ( = ?auto_422773 ?auto_422781 ) ) ( not ( = ?auto_422773 ?auto_422782 ) ) ( not ( = ?auto_422773 ?auto_422783 ) ) ( not ( = ?auto_422773 ?auto_422784 ) ) ( not ( = ?auto_422774 ?auto_422775 ) ) ( not ( = ?auto_422774 ?auto_422776 ) ) ( not ( = ?auto_422774 ?auto_422777 ) ) ( not ( = ?auto_422774 ?auto_422778 ) ) ( not ( = ?auto_422774 ?auto_422779 ) ) ( not ( = ?auto_422774 ?auto_422780 ) ) ( not ( = ?auto_422774 ?auto_422781 ) ) ( not ( = ?auto_422774 ?auto_422782 ) ) ( not ( = ?auto_422774 ?auto_422783 ) ) ( not ( = ?auto_422774 ?auto_422784 ) ) ( not ( = ?auto_422775 ?auto_422776 ) ) ( not ( = ?auto_422775 ?auto_422777 ) ) ( not ( = ?auto_422775 ?auto_422778 ) ) ( not ( = ?auto_422775 ?auto_422779 ) ) ( not ( = ?auto_422775 ?auto_422780 ) ) ( not ( = ?auto_422775 ?auto_422781 ) ) ( not ( = ?auto_422775 ?auto_422782 ) ) ( not ( = ?auto_422775 ?auto_422783 ) ) ( not ( = ?auto_422775 ?auto_422784 ) ) ( not ( = ?auto_422776 ?auto_422777 ) ) ( not ( = ?auto_422776 ?auto_422778 ) ) ( not ( = ?auto_422776 ?auto_422779 ) ) ( not ( = ?auto_422776 ?auto_422780 ) ) ( not ( = ?auto_422776 ?auto_422781 ) ) ( not ( = ?auto_422776 ?auto_422782 ) ) ( not ( = ?auto_422776 ?auto_422783 ) ) ( not ( = ?auto_422776 ?auto_422784 ) ) ( not ( = ?auto_422777 ?auto_422778 ) ) ( not ( = ?auto_422777 ?auto_422779 ) ) ( not ( = ?auto_422777 ?auto_422780 ) ) ( not ( = ?auto_422777 ?auto_422781 ) ) ( not ( = ?auto_422777 ?auto_422782 ) ) ( not ( = ?auto_422777 ?auto_422783 ) ) ( not ( = ?auto_422777 ?auto_422784 ) ) ( not ( = ?auto_422778 ?auto_422779 ) ) ( not ( = ?auto_422778 ?auto_422780 ) ) ( not ( = ?auto_422778 ?auto_422781 ) ) ( not ( = ?auto_422778 ?auto_422782 ) ) ( not ( = ?auto_422778 ?auto_422783 ) ) ( not ( = ?auto_422778 ?auto_422784 ) ) ( not ( = ?auto_422779 ?auto_422780 ) ) ( not ( = ?auto_422779 ?auto_422781 ) ) ( not ( = ?auto_422779 ?auto_422782 ) ) ( not ( = ?auto_422779 ?auto_422783 ) ) ( not ( = ?auto_422779 ?auto_422784 ) ) ( not ( = ?auto_422780 ?auto_422781 ) ) ( not ( = ?auto_422780 ?auto_422782 ) ) ( not ( = ?auto_422780 ?auto_422783 ) ) ( not ( = ?auto_422780 ?auto_422784 ) ) ( not ( = ?auto_422781 ?auto_422782 ) ) ( not ( = ?auto_422781 ?auto_422783 ) ) ( not ( = ?auto_422781 ?auto_422784 ) ) ( not ( = ?auto_422782 ?auto_422783 ) ) ( not ( = ?auto_422782 ?auto_422784 ) ) ( not ( = ?auto_422783 ?auto_422784 ) ) ( ON ?auto_422782 ?auto_422783 ) ( ON ?auto_422781 ?auto_422782 ) ( ON ?auto_422780 ?auto_422781 ) ( ON ?auto_422779 ?auto_422780 ) ( ON ?auto_422778 ?auto_422779 ) ( ON ?auto_422777 ?auto_422778 ) ( ON ?auto_422776 ?auto_422777 ) ( CLEAR ?auto_422774 ) ( ON ?auto_422775 ?auto_422776 ) ( CLEAR ?auto_422775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_422769 ?auto_422770 ?auto_422771 ?auto_422772 ?auto_422773 ?auto_422774 ?auto_422775 )
      ( MAKE-15PILE ?auto_422769 ?auto_422770 ?auto_422771 ?auto_422772 ?auto_422773 ?auto_422774 ?auto_422775 ?auto_422776 ?auto_422777 ?auto_422778 ?auto_422779 ?auto_422780 ?auto_422781 ?auto_422782 ?auto_422783 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422800 - BLOCK
      ?auto_422801 - BLOCK
      ?auto_422802 - BLOCK
      ?auto_422803 - BLOCK
      ?auto_422804 - BLOCK
      ?auto_422805 - BLOCK
      ?auto_422806 - BLOCK
      ?auto_422807 - BLOCK
      ?auto_422808 - BLOCK
      ?auto_422809 - BLOCK
      ?auto_422810 - BLOCK
      ?auto_422811 - BLOCK
      ?auto_422812 - BLOCK
      ?auto_422813 - BLOCK
      ?auto_422814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422814 ) ( ON-TABLE ?auto_422800 ) ( ON ?auto_422801 ?auto_422800 ) ( ON ?auto_422802 ?auto_422801 ) ( ON ?auto_422803 ?auto_422802 ) ( ON ?auto_422804 ?auto_422803 ) ( ON ?auto_422805 ?auto_422804 ) ( not ( = ?auto_422800 ?auto_422801 ) ) ( not ( = ?auto_422800 ?auto_422802 ) ) ( not ( = ?auto_422800 ?auto_422803 ) ) ( not ( = ?auto_422800 ?auto_422804 ) ) ( not ( = ?auto_422800 ?auto_422805 ) ) ( not ( = ?auto_422800 ?auto_422806 ) ) ( not ( = ?auto_422800 ?auto_422807 ) ) ( not ( = ?auto_422800 ?auto_422808 ) ) ( not ( = ?auto_422800 ?auto_422809 ) ) ( not ( = ?auto_422800 ?auto_422810 ) ) ( not ( = ?auto_422800 ?auto_422811 ) ) ( not ( = ?auto_422800 ?auto_422812 ) ) ( not ( = ?auto_422800 ?auto_422813 ) ) ( not ( = ?auto_422800 ?auto_422814 ) ) ( not ( = ?auto_422801 ?auto_422802 ) ) ( not ( = ?auto_422801 ?auto_422803 ) ) ( not ( = ?auto_422801 ?auto_422804 ) ) ( not ( = ?auto_422801 ?auto_422805 ) ) ( not ( = ?auto_422801 ?auto_422806 ) ) ( not ( = ?auto_422801 ?auto_422807 ) ) ( not ( = ?auto_422801 ?auto_422808 ) ) ( not ( = ?auto_422801 ?auto_422809 ) ) ( not ( = ?auto_422801 ?auto_422810 ) ) ( not ( = ?auto_422801 ?auto_422811 ) ) ( not ( = ?auto_422801 ?auto_422812 ) ) ( not ( = ?auto_422801 ?auto_422813 ) ) ( not ( = ?auto_422801 ?auto_422814 ) ) ( not ( = ?auto_422802 ?auto_422803 ) ) ( not ( = ?auto_422802 ?auto_422804 ) ) ( not ( = ?auto_422802 ?auto_422805 ) ) ( not ( = ?auto_422802 ?auto_422806 ) ) ( not ( = ?auto_422802 ?auto_422807 ) ) ( not ( = ?auto_422802 ?auto_422808 ) ) ( not ( = ?auto_422802 ?auto_422809 ) ) ( not ( = ?auto_422802 ?auto_422810 ) ) ( not ( = ?auto_422802 ?auto_422811 ) ) ( not ( = ?auto_422802 ?auto_422812 ) ) ( not ( = ?auto_422802 ?auto_422813 ) ) ( not ( = ?auto_422802 ?auto_422814 ) ) ( not ( = ?auto_422803 ?auto_422804 ) ) ( not ( = ?auto_422803 ?auto_422805 ) ) ( not ( = ?auto_422803 ?auto_422806 ) ) ( not ( = ?auto_422803 ?auto_422807 ) ) ( not ( = ?auto_422803 ?auto_422808 ) ) ( not ( = ?auto_422803 ?auto_422809 ) ) ( not ( = ?auto_422803 ?auto_422810 ) ) ( not ( = ?auto_422803 ?auto_422811 ) ) ( not ( = ?auto_422803 ?auto_422812 ) ) ( not ( = ?auto_422803 ?auto_422813 ) ) ( not ( = ?auto_422803 ?auto_422814 ) ) ( not ( = ?auto_422804 ?auto_422805 ) ) ( not ( = ?auto_422804 ?auto_422806 ) ) ( not ( = ?auto_422804 ?auto_422807 ) ) ( not ( = ?auto_422804 ?auto_422808 ) ) ( not ( = ?auto_422804 ?auto_422809 ) ) ( not ( = ?auto_422804 ?auto_422810 ) ) ( not ( = ?auto_422804 ?auto_422811 ) ) ( not ( = ?auto_422804 ?auto_422812 ) ) ( not ( = ?auto_422804 ?auto_422813 ) ) ( not ( = ?auto_422804 ?auto_422814 ) ) ( not ( = ?auto_422805 ?auto_422806 ) ) ( not ( = ?auto_422805 ?auto_422807 ) ) ( not ( = ?auto_422805 ?auto_422808 ) ) ( not ( = ?auto_422805 ?auto_422809 ) ) ( not ( = ?auto_422805 ?auto_422810 ) ) ( not ( = ?auto_422805 ?auto_422811 ) ) ( not ( = ?auto_422805 ?auto_422812 ) ) ( not ( = ?auto_422805 ?auto_422813 ) ) ( not ( = ?auto_422805 ?auto_422814 ) ) ( not ( = ?auto_422806 ?auto_422807 ) ) ( not ( = ?auto_422806 ?auto_422808 ) ) ( not ( = ?auto_422806 ?auto_422809 ) ) ( not ( = ?auto_422806 ?auto_422810 ) ) ( not ( = ?auto_422806 ?auto_422811 ) ) ( not ( = ?auto_422806 ?auto_422812 ) ) ( not ( = ?auto_422806 ?auto_422813 ) ) ( not ( = ?auto_422806 ?auto_422814 ) ) ( not ( = ?auto_422807 ?auto_422808 ) ) ( not ( = ?auto_422807 ?auto_422809 ) ) ( not ( = ?auto_422807 ?auto_422810 ) ) ( not ( = ?auto_422807 ?auto_422811 ) ) ( not ( = ?auto_422807 ?auto_422812 ) ) ( not ( = ?auto_422807 ?auto_422813 ) ) ( not ( = ?auto_422807 ?auto_422814 ) ) ( not ( = ?auto_422808 ?auto_422809 ) ) ( not ( = ?auto_422808 ?auto_422810 ) ) ( not ( = ?auto_422808 ?auto_422811 ) ) ( not ( = ?auto_422808 ?auto_422812 ) ) ( not ( = ?auto_422808 ?auto_422813 ) ) ( not ( = ?auto_422808 ?auto_422814 ) ) ( not ( = ?auto_422809 ?auto_422810 ) ) ( not ( = ?auto_422809 ?auto_422811 ) ) ( not ( = ?auto_422809 ?auto_422812 ) ) ( not ( = ?auto_422809 ?auto_422813 ) ) ( not ( = ?auto_422809 ?auto_422814 ) ) ( not ( = ?auto_422810 ?auto_422811 ) ) ( not ( = ?auto_422810 ?auto_422812 ) ) ( not ( = ?auto_422810 ?auto_422813 ) ) ( not ( = ?auto_422810 ?auto_422814 ) ) ( not ( = ?auto_422811 ?auto_422812 ) ) ( not ( = ?auto_422811 ?auto_422813 ) ) ( not ( = ?auto_422811 ?auto_422814 ) ) ( not ( = ?auto_422812 ?auto_422813 ) ) ( not ( = ?auto_422812 ?auto_422814 ) ) ( not ( = ?auto_422813 ?auto_422814 ) ) ( ON ?auto_422813 ?auto_422814 ) ( ON ?auto_422812 ?auto_422813 ) ( ON ?auto_422811 ?auto_422812 ) ( ON ?auto_422810 ?auto_422811 ) ( ON ?auto_422809 ?auto_422810 ) ( ON ?auto_422808 ?auto_422809 ) ( ON ?auto_422807 ?auto_422808 ) ( CLEAR ?auto_422805 ) ( ON ?auto_422806 ?auto_422807 ) ( CLEAR ?auto_422806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_422800 ?auto_422801 ?auto_422802 ?auto_422803 ?auto_422804 ?auto_422805 ?auto_422806 )
      ( MAKE-15PILE ?auto_422800 ?auto_422801 ?auto_422802 ?auto_422803 ?auto_422804 ?auto_422805 ?auto_422806 ?auto_422807 ?auto_422808 ?auto_422809 ?auto_422810 ?auto_422811 ?auto_422812 ?auto_422813 ?auto_422814 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422830 - BLOCK
      ?auto_422831 - BLOCK
      ?auto_422832 - BLOCK
      ?auto_422833 - BLOCK
      ?auto_422834 - BLOCK
      ?auto_422835 - BLOCK
      ?auto_422836 - BLOCK
      ?auto_422837 - BLOCK
      ?auto_422838 - BLOCK
      ?auto_422839 - BLOCK
      ?auto_422840 - BLOCK
      ?auto_422841 - BLOCK
      ?auto_422842 - BLOCK
      ?auto_422843 - BLOCK
      ?auto_422844 - BLOCK
    )
    :vars
    (
      ?auto_422845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422844 ?auto_422845 ) ( ON-TABLE ?auto_422830 ) ( ON ?auto_422831 ?auto_422830 ) ( ON ?auto_422832 ?auto_422831 ) ( ON ?auto_422833 ?auto_422832 ) ( ON ?auto_422834 ?auto_422833 ) ( not ( = ?auto_422830 ?auto_422831 ) ) ( not ( = ?auto_422830 ?auto_422832 ) ) ( not ( = ?auto_422830 ?auto_422833 ) ) ( not ( = ?auto_422830 ?auto_422834 ) ) ( not ( = ?auto_422830 ?auto_422835 ) ) ( not ( = ?auto_422830 ?auto_422836 ) ) ( not ( = ?auto_422830 ?auto_422837 ) ) ( not ( = ?auto_422830 ?auto_422838 ) ) ( not ( = ?auto_422830 ?auto_422839 ) ) ( not ( = ?auto_422830 ?auto_422840 ) ) ( not ( = ?auto_422830 ?auto_422841 ) ) ( not ( = ?auto_422830 ?auto_422842 ) ) ( not ( = ?auto_422830 ?auto_422843 ) ) ( not ( = ?auto_422830 ?auto_422844 ) ) ( not ( = ?auto_422830 ?auto_422845 ) ) ( not ( = ?auto_422831 ?auto_422832 ) ) ( not ( = ?auto_422831 ?auto_422833 ) ) ( not ( = ?auto_422831 ?auto_422834 ) ) ( not ( = ?auto_422831 ?auto_422835 ) ) ( not ( = ?auto_422831 ?auto_422836 ) ) ( not ( = ?auto_422831 ?auto_422837 ) ) ( not ( = ?auto_422831 ?auto_422838 ) ) ( not ( = ?auto_422831 ?auto_422839 ) ) ( not ( = ?auto_422831 ?auto_422840 ) ) ( not ( = ?auto_422831 ?auto_422841 ) ) ( not ( = ?auto_422831 ?auto_422842 ) ) ( not ( = ?auto_422831 ?auto_422843 ) ) ( not ( = ?auto_422831 ?auto_422844 ) ) ( not ( = ?auto_422831 ?auto_422845 ) ) ( not ( = ?auto_422832 ?auto_422833 ) ) ( not ( = ?auto_422832 ?auto_422834 ) ) ( not ( = ?auto_422832 ?auto_422835 ) ) ( not ( = ?auto_422832 ?auto_422836 ) ) ( not ( = ?auto_422832 ?auto_422837 ) ) ( not ( = ?auto_422832 ?auto_422838 ) ) ( not ( = ?auto_422832 ?auto_422839 ) ) ( not ( = ?auto_422832 ?auto_422840 ) ) ( not ( = ?auto_422832 ?auto_422841 ) ) ( not ( = ?auto_422832 ?auto_422842 ) ) ( not ( = ?auto_422832 ?auto_422843 ) ) ( not ( = ?auto_422832 ?auto_422844 ) ) ( not ( = ?auto_422832 ?auto_422845 ) ) ( not ( = ?auto_422833 ?auto_422834 ) ) ( not ( = ?auto_422833 ?auto_422835 ) ) ( not ( = ?auto_422833 ?auto_422836 ) ) ( not ( = ?auto_422833 ?auto_422837 ) ) ( not ( = ?auto_422833 ?auto_422838 ) ) ( not ( = ?auto_422833 ?auto_422839 ) ) ( not ( = ?auto_422833 ?auto_422840 ) ) ( not ( = ?auto_422833 ?auto_422841 ) ) ( not ( = ?auto_422833 ?auto_422842 ) ) ( not ( = ?auto_422833 ?auto_422843 ) ) ( not ( = ?auto_422833 ?auto_422844 ) ) ( not ( = ?auto_422833 ?auto_422845 ) ) ( not ( = ?auto_422834 ?auto_422835 ) ) ( not ( = ?auto_422834 ?auto_422836 ) ) ( not ( = ?auto_422834 ?auto_422837 ) ) ( not ( = ?auto_422834 ?auto_422838 ) ) ( not ( = ?auto_422834 ?auto_422839 ) ) ( not ( = ?auto_422834 ?auto_422840 ) ) ( not ( = ?auto_422834 ?auto_422841 ) ) ( not ( = ?auto_422834 ?auto_422842 ) ) ( not ( = ?auto_422834 ?auto_422843 ) ) ( not ( = ?auto_422834 ?auto_422844 ) ) ( not ( = ?auto_422834 ?auto_422845 ) ) ( not ( = ?auto_422835 ?auto_422836 ) ) ( not ( = ?auto_422835 ?auto_422837 ) ) ( not ( = ?auto_422835 ?auto_422838 ) ) ( not ( = ?auto_422835 ?auto_422839 ) ) ( not ( = ?auto_422835 ?auto_422840 ) ) ( not ( = ?auto_422835 ?auto_422841 ) ) ( not ( = ?auto_422835 ?auto_422842 ) ) ( not ( = ?auto_422835 ?auto_422843 ) ) ( not ( = ?auto_422835 ?auto_422844 ) ) ( not ( = ?auto_422835 ?auto_422845 ) ) ( not ( = ?auto_422836 ?auto_422837 ) ) ( not ( = ?auto_422836 ?auto_422838 ) ) ( not ( = ?auto_422836 ?auto_422839 ) ) ( not ( = ?auto_422836 ?auto_422840 ) ) ( not ( = ?auto_422836 ?auto_422841 ) ) ( not ( = ?auto_422836 ?auto_422842 ) ) ( not ( = ?auto_422836 ?auto_422843 ) ) ( not ( = ?auto_422836 ?auto_422844 ) ) ( not ( = ?auto_422836 ?auto_422845 ) ) ( not ( = ?auto_422837 ?auto_422838 ) ) ( not ( = ?auto_422837 ?auto_422839 ) ) ( not ( = ?auto_422837 ?auto_422840 ) ) ( not ( = ?auto_422837 ?auto_422841 ) ) ( not ( = ?auto_422837 ?auto_422842 ) ) ( not ( = ?auto_422837 ?auto_422843 ) ) ( not ( = ?auto_422837 ?auto_422844 ) ) ( not ( = ?auto_422837 ?auto_422845 ) ) ( not ( = ?auto_422838 ?auto_422839 ) ) ( not ( = ?auto_422838 ?auto_422840 ) ) ( not ( = ?auto_422838 ?auto_422841 ) ) ( not ( = ?auto_422838 ?auto_422842 ) ) ( not ( = ?auto_422838 ?auto_422843 ) ) ( not ( = ?auto_422838 ?auto_422844 ) ) ( not ( = ?auto_422838 ?auto_422845 ) ) ( not ( = ?auto_422839 ?auto_422840 ) ) ( not ( = ?auto_422839 ?auto_422841 ) ) ( not ( = ?auto_422839 ?auto_422842 ) ) ( not ( = ?auto_422839 ?auto_422843 ) ) ( not ( = ?auto_422839 ?auto_422844 ) ) ( not ( = ?auto_422839 ?auto_422845 ) ) ( not ( = ?auto_422840 ?auto_422841 ) ) ( not ( = ?auto_422840 ?auto_422842 ) ) ( not ( = ?auto_422840 ?auto_422843 ) ) ( not ( = ?auto_422840 ?auto_422844 ) ) ( not ( = ?auto_422840 ?auto_422845 ) ) ( not ( = ?auto_422841 ?auto_422842 ) ) ( not ( = ?auto_422841 ?auto_422843 ) ) ( not ( = ?auto_422841 ?auto_422844 ) ) ( not ( = ?auto_422841 ?auto_422845 ) ) ( not ( = ?auto_422842 ?auto_422843 ) ) ( not ( = ?auto_422842 ?auto_422844 ) ) ( not ( = ?auto_422842 ?auto_422845 ) ) ( not ( = ?auto_422843 ?auto_422844 ) ) ( not ( = ?auto_422843 ?auto_422845 ) ) ( not ( = ?auto_422844 ?auto_422845 ) ) ( ON ?auto_422843 ?auto_422844 ) ( ON ?auto_422842 ?auto_422843 ) ( ON ?auto_422841 ?auto_422842 ) ( ON ?auto_422840 ?auto_422841 ) ( ON ?auto_422839 ?auto_422840 ) ( ON ?auto_422838 ?auto_422839 ) ( ON ?auto_422837 ?auto_422838 ) ( ON ?auto_422836 ?auto_422837 ) ( CLEAR ?auto_422834 ) ( ON ?auto_422835 ?auto_422836 ) ( CLEAR ?auto_422835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_422830 ?auto_422831 ?auto_422832 ?auto_422833 ?auto_422834 ?auto_422835 )
      ( MAKE-15PILE ?auto_422830 ?auto_422831 ?auto_422832 ?auto_422833 ?auto_422834 ?auto_422835 ?auto_422836 ?auto_422837 ?auto_422838 ?auto_422839 ?auto_422840 ?auto_422841 ?auto_422842 ?auto_422843 ?auto_422844 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422861 - BLOCK
      ?auto_422862 - BLOCK
      ?auto_422863 - BLOCK
      ?auto_422864 - BLOCK
      ?auto_422865 - BLOCK
      ?auto_422866 - BLOCK
      ?auto_422867 - BLOCK
      ?auto_422868 - BLOCK
      ?auto_422869 - BLOCK
      ?auto_422870 - BLOCK
      ?auto_422871 - BLOCK
      ?auto_422872 - BLOCK
      ?auto_422873 - BLOCK
      ?auto_422874 - BLOCK
      ?auto_422875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422875 ) ( ON-TABLE ?auto_422861 ) ( ON ?auto_422862 ?auto_422861 ) ( ON ?auto_422863 ?auto_422862 ) ( ON ?auto_422864 ?auto_422863 ) ( ON ?auto_422865 ?auto_422864 ) ( not ( = ?auto_422861 ?auto_422862 ) ) ( not ( = ?auto_422861 ?auto_422863 ) ) ( not ( = ?auto_422861 ?auto_422864 ) ) ( not ( = ?auto_422861 ?auto_422865 ) ) ( not ( = ?auto_422861 ?auto_422866 ) ) ( not ( = ?auto_422861 ?auto_422867 ) ) ( not ( = ?auto_422861 ?auto_422868 ) ) ( not ( = ?auto_422861 ?auto_422869 ) ) ( not ( = ?auto_422861 ?auto_422870 ) ) ( not ( = ?auto_422861 ?auto_422871 ) ) ( not ( = ?auto_422861 ?auto_422872 ) ) ( not ( = ?auto_422861 ?auto_422873 ) ) ( not ( = ?auto_422861 ?auto_422874 ) ) ( not ( = ?auto_422861 ?auto_422875 ) ) ( not ( = ?auto_422862 ?auto_422863 ) ) ( not ( = ?auto_422862 ?auto_422864 ) ) ( not ( = ?auto_422862 ?auto_422865 ) ) ( not ( = ?auto_422862 ?auto_422866 ) ) ( not ( = ?auto_422862 ?auto_422867 ) ) ( not ( = ?auto_422862 ?auto_422868 ) ) ( not ( = ?auto_422862 ?auto_422869 ) ) ( not ( = ?auto_422862 ?auto_422870 ) ) ( not ( = ?auto_422862 ?auto_422871 ) ) ( not ( = ?auto_422862 ?auto_422872 ) ) ( not ( = ?auto_422862 ?auto_422873 ) ) ( not ( = ?auto_422862 ?auto_422874 ) ) ( not ( = ?auto_422862 ?auto_422875 ) ) ( not ( = ?auto_422863 ?auto_422864 ) ) ( not ( = ?auto_422863 ?auto_422865 ) ) ( not ( = ?auto_422863 ?auto_422866 ) ) ( not ( = ?auto_422863 ?auto_422867 ) ) ( not ( = ?auto_422863 ?auto_422868 ) ) ( not ( = ?auto_422863 ?auto_422869 ) ) ( not ( = ?auto_422863 ?auto_422870 ) ) ( not ( = ?auto_422863 ?auto_422871 ) ) ( not ( = ?auto_422863 ?auto_422872 ) ) ( not ( = ?auto_422863 ?auto_422873 ) ) ( not ( = ?auto_422863 ?auto_422874 ) ) ( not ( = ?auto_422863 ?auto_422875 ) ) ( not ( = ?auto_422864 ?auto_422865 ) ) ( not ( = ?auto_422864 ?auto_422866 ) ) ( not ( = ?auto_422864 ?auto_422867 ) ) ( not ( = ?auto_422864 ?auto_422868 ) ) ( not ( = ?auto_422864 ?auto_422869 ) ) ( not ( = ?auto_422864 ?auto_422870 ) ) ( not ( = ?auto_422864 ?auto_422871 ) ) ( not ( = ?auto_422864 ?auto_422872 ) ) ( not ( = ?auto_422864 ?auto_422873 ) ) ( not ( = ?auto_422864 ?auto_422874 ) ) ( not ( = ?auto_422864 ?auto_422875 ) ) ( not ( = ?auto_422865 ?auto_422866 ) ) ( not ( = ?auto_422865 ?auto_422867 ) ) ( not ( = ?auto_422865 ?auto_422868 ) ) ( not ( = ?auto_422865 ?auto_422869 ) ) ( not ( = ?auto_422865 ?auto_422870 ) ) ( not ( = ?auto_422865 ?auto_422871 ) ) ( not ( = ?auto_422865 ?auto_422872 ) ) ( not ( = ?auto_422865 ?auto_422873 ) ) ( not ( = ?auto_422865 ?auto_422874 ) ) ( not ( = ?auto_422865 ?auto_422875 ) ) ( not ( = ?auto_422866 ?auto_422867 ) ) ( not ( = ?auto_422866 ?auto_422868 ) ) ( not ( = ?auto_422866 ?auto_422869 ) ) ( not ( = ?auto_422866 ?auto_422870 ) ) ( not ( = ?auto_422866 ?auto_422871 ) ) ( not ( = ?auto_422866 ?auto_422872 ) ) ( not ( = ?auto_422866 ?auto_422873 ) ) ( not ( = ?auto_422866 ?auto_422874 ) ) ( not ( = ?auto_422866 ?auto_422875 ) ) ( not ( = ?auto_422867 ?auto_422868 ) ) ( not ( = ?auto_422867 ?auto_422869 ) ) ( not ( = ?auto_422867 ?auto_422870 ) ) ( not ( = ?auto_422867 ?auto_422871 ) ) ( not ( = ?auto_422867 ?auto_422872 ) ) ( not ( = ?auto_422867 ?auto_422873 ) ) ( not ( = ?auto_422867 ?auto_422874 ) ) ( not ( = ?auto_422867 ?auto_422875 ) ) ( not ( = ?auto_422868 ?auto_422869 ) ) ( not ( = ?auto_422868 ?auto_422870 ) ) ( not ( = ?auto_422868 ?auto_422871 ) ) ( not ( = ?auto_422868 ?auto_422872 ) ) ( not ( = ?auto_422868 ?auto_422873 ) ) ( not ( = ?auto_422868 ?auto_422874 ) ) ( not ( = ?auto_422868 ?auto_422875 ) ) ( not ( = ?auto_422869 ?auto_422870 ) ) ( not ( = ?auto_422869 ?auto_422871 ) ) ( not ( = ?auto_422869 ?auto_422872 ) ) ( not ( = ?auto_422869 ?auto_422873 ) ) ( not ( = ?auto_422869 ?auto_422874 ) ) ( not ( = ?auto_422869 ?auto_422875 ) ) ( not ( = ?auto_422870 ?auto_422871 ) ) ( not ( = ?auto_422870 ?auto_422872 ) ) ( not ( = ?auto_422870 ?auto_422873 ) ) ( not ( = ?auto_422870 ?auto_422874 ) ) ( not ( = ?auto_422870 ?auto_422875 ) ) ( not ( = ?auto_422871 ?auto_422872 ) ) ( not ( = ?auto_422871 ?auto_422873 ) ) ( not ( = ?auto_422871 ?auto_422874 ) ) ( not ( = ?auto_422871 ?auto_422875 ) ) ( not ( = ?auto_422872 ?auto_422873 ) ) ( not ( = ?auto_422872 ?auto_422874 ) ) ( not ( = ?auto_422872 ?auto_422875 ) ) ( not ( = ?auto_422873 ?auto_422874 ) ) ( not ( = ?auto_422873 ?auto_422875 ) ) ( not ( = ?auto_422874 ?auto_422875 ) ) ( ON ?auto_422874 ?auto_422875 ) ( ON ?auto_422873 ?auto_422874 ) ( ON ?auto_422872 ?auto_422873 ) ( ON ?auto_422871 ?auto_422872 ) ( ON ?auto_422870 ?auto_422871 ) ( ON ?auto_422869 ?auto_422870 ) ( ON ?auto_422868 ?auto_422869 ) ( ON ?auto_422867 ?auto_422868 ) ( CLEAR ?auto_422865 ) ( ON ?auto_422866 ?auto_422867 ) ( CLEAR ?auto_422866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_422861 ?auto_422862 ?auto_422863 ?auto_422864 ?auto_422865 ?auto_422866 )
      ( MAKE-15PILE ?auto_422861 ?auto_422862 ?auto_422863 ?auto_422864 ?auto_422865 ?auto_422866 ?auto_422867 ?auto_422868 ?auto_422869 ?auto_422870 ?auto_422871 ?auto_422872 ?auto_422873 ?auto_422874 ?auto_422875 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422891 - BLOCK
      ?auto_422892 - BLOCK
      ?auto_422893 - BLOCK
      ?auto_422894 - BLOCK
      ?auto_422895 - BLOCK
      ?auto_422896 - BLOCK
      ?auto_422897 - BLOCK
      ?auto_422898 - BLOCK
      ?auto_422899 - BLOCK
      ?auto_422900 - BLOCK
      ?auto_422901 - BLOCK
      ?auto_422902 - BLOCK
      ?auto_422903 - BLOCK
      ?auto_422904 - BLOCK
      ?auto_422905 - BLOCK
    )
    :vars
    (
      ?auto_422906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422905 ?auto_422906 ) ( ON-TABLE ?auto_422891 ) ( ON ?auto_422892 ?auto_422891 ) ( ON ?auto_422893 ?auto_422892 ) ( ON ?auto_422894 ?auto_422893 ) ( not ( = ?auto_422891 ?auto_422892 ) ) ( not ( = ?auto_422891 ?auto_422893 ) ) ( not ( = ?auto_422891 ?auto_422894 ) ) ( not ( = ?auto_422891 ?auto_422895 ) ) ( not ( = ?auto_422891 ?auto_422896 ) ) ( not ( = ?auto_422891 ?auto_422897 ) ) ( not ( = ?auto_422891 ?auto_422898 ) ) ( not ( = ?auto_422891 ?auto_422899 ) ) ( not ( = ?auto_422891 ?auto_422900 ) ) ( not ( = ?auto_422891 ?auto_422901 ) ) ( not ( = ?auto_422891 ?auto_422902 ) ) ( not ( = ?auto_422891 ?auto_422903 ) ) ( not ( = ?auto_422891 ?auto_422904 ) ) ( not ( = ?auto_422891 ?auto_422905 ) ) ( not ( = ?auto_422891 ?auto_422906 ) ) ( not ( = ?auto_422892 ?auto_422893 ) ) ( not ( = ?auto_422892 ?auto_422894 ) ) ( not ( = ?auto_422892 ?auto_422895 ) ) ( not ( = ?auto_422892 ?auto_422896 ) ) ( not ( = ?auto_422892 ?auto_422897 ) ) ( not ( = ?auto_422892 ?auto_422898 ) ) ( not ( = ?auto_422892 ?auto_422899 ) ) ( not ( = ?auto_422892 ?auto_422900 ) ) ( not ( = ?auto_422892 ?auto_422901 ) ) ( not ( = ?auto_422892 ?auto_422902 ) ) ( not ( = ?auto_422892 ?auto_422903 ) ) ( not ( = ?auto_422892 ?auto_422904 ) ) ( not ( = ?auto_422892 ?auto_422905 ) ) ( not ( = ?auto_422892 ?auto_422906 ) ) ( not ( = ?auto_422893 ?auto_422894 ) ) ( not ( = ?auto_422893 ?auto_422895 ) ) ( not ( = ?auto_422893 ?auto_422896 ) ) ( not ( = ?auto_422893 ?auto_422897 ) ) ( not ( = ?auto_422893 ?auto_422898 ) ) ( not ( = ?auto_422893 ?auto_422899 ) ) ( not ( = ?auto_422893 ?auto_422900 ) ) ( not ( = ?auto_422893 ?auto_422901 ) ) ( not ( = ?auto_422893 ?auto_422902 ) ) ( not ( = ?auto_422893 ?auto_422903 ) ) ( not ( = ?auto_422893 ?auto_422904 ) ) ( not ( = ?auto_422893 ?auto_422905 ) ) ( not ( = ?auto_422893 ?auto_422906 ) ) ( not ( = ?auto_422894 ?auto_422895 ) ) ( not ( = ?auto_422894 ?auto_422896 ) ) ( not ( = ?auto_422894 ?auto_422897 ) ) ( not ( = ?auto_422894 ?auto_422898 ) ) ( not ( = ?auto_422894 ?auto_422899 ) ) ( not ( = ?auto_422894 ?auto_422900 ) ) ( not ( = ?auto_422894 ?auto_422901 ) ) ( not ( = ?auto_422894 ?auto_422902 ) ) ( not ( = ?auto_422894 ?auto_422903 ) ) ( not ( = ?auto_422894 ?auto_422904 ) ) ( not ( = ?auto_422894 ?auto_422905 ) ) ( not ( = ?auto_422894 ?auto_422906 ) ) ( not ( = ?auto_422895 ?auto_422896 ) ) ( not ( = ?auto_422895 ?auto_422897 ) ) ( not ( = ?auto_422895 ?auto_422898 ) ) ( not ( = ?auto_422895 ?auto_422899 ) ) ( not ( = ?auto_422895 ?auto_422900 ) ) ( not ( = ?auto_422895 ?auto_422901 ) ) ( not ( = ?auto_422895 ?auto_422902 ) ) ( not ( = ?auto_422895 ?auto_422903 ) ) ( not ( = ?auto_422895 ?auto_422904 ) ) ( not ( = ?auto_422895 ?auto_422905 ) ) ( not ( = ?auto_422895 ?auto_422906 ) ) ( not ( = ?auto_422896 ?auto_422897 ) ) ( not ( = ?auto_422896 ?auto_422898 ) ) ( not ( = ?auto_422896 ?auto_422899 ) ) ( not ( = ?auto_422896 ?auto_422900 ) ) ( not ( = ?auto_422896 ?auto_422901 ) ) ( not ( = ?auto_422896 ?auto_422902 ) ) ( not ( = ?auto_422896 ?auto_422903 ) ) ( not ( = ?auto_422896 ?auto_422904 ) ) ( not ( = ?auto_422896 ?auto_422905 ) ) ( not ( = ?auto_422896 ?auto_422906 ) ) ( not ( = ?auto_422897 ?auto_422898 ) ) ( not ( = ?auto_422897 ?auto_422899 ) ) ( not ( = ?auto_422897 ?auto_422900 ) ) ( not ( = ?auto_422897 ?auto_422901 ) ) ( not ( = ?auto_422897 ?auto_422902 ) ) ( not ( = ?auto_422897 ?auto_422903 ) ) ( not ( = ?auto_422897 ?auto_422904 ) ) ( not ( = ?auto_422897 ?auto_422905 ) ) ( not ( = ?auto_422897 ?auto_422906 ) ) ( not ( = ?auto_422898 ?auto_422899 ) ) ( not ( = ?auto_422898 ?auto_422900 ) ) ( not ( = ?auto_422898 ?auto_422901 ) ) ( not ( = ?auto_422898 ?auto_422902 ) ) ( not ( = ?auto_422898 ?auto_422903 ) ) ( not ( = ?auto_422898 ?auto_422904 ) ) ( not ( = ?auto_422898 ?auto_422905 ) ) ( not ( = ?auto_422898 ?auto_422906 ) ) ( not ( = ?auto_422899 ?auto_422900 ) ) ( not ( = ?auto_422899 ?auto_422901 ) ) ( not ( = ?auto_422899 ?auto_422902 ) ) ( not ( = ?auto_422899 ?auto_422903 ) ) ( not ( = ?auto_422899 ?auto_422904 ) ) ( not ( = ?auto_422899 ?auto_422905 ) ) ( not ( = ?auto_422899 ?auto_422906 ) ) ( not ( = ?auto_422900 ?auto_422901 ) ) ( not ( = ?auto_422900 ?auto_422902 ) ) ( not ( = ?auto_422900 ?auto_422903 ) ) ( not ( = ?auto_422900 ?auto_422904 ) ) ( not ( = ?auto_422900 ?auto_422905 ) ) ( not ( = ?auto_422900 ?auto_422906 ) ) ( not ( = ?auto_422901 ?auto_422902 ) ) ( not ( = ?auto_422901 ?auto_422903 ) ) ( not ( = ?auto_422901 ?auto_422904 ) ) ( not ( = ?auto_422901 ?auto_422905 ) ) ( not ( = ?auto_422901 ?auto_422906 ) ) ( not ( = ?auto_422902 ?auto_422903 ) ) ( not ( = ?auto_422902 ?auto_422904 ) ) ( not ( = ?auto_422902 ?auto_422905 ) ) ( not ( = ?auto_422902 ?auto_422906 ) ) ( not ( = ?auto_422903 ?auto_422904 ) ) ( not ( = ?auto_422903 ?auto_422905 ) ) ( not ( = ?auto_422903 ?auto_422906 ) ) ( not ( = ?auto_422904 ?auto_422905 ) ) ( not ( = ?auto_422904 ?auto_422906 ) ) ( not ( = ?auto_422905 ?auto_422906 ) ) ( ON ?auto_422904 ?auto_422905 ) ( ON ?auto_422903 ?auto_422904 ) ( ON ?auto_422902 ?auto_422903 ) ( ON ?auto_422901 ?auto_422902 ) ( ON ?auto_422900 ?auto_422901 ) ( ON ?auto_422899 ?auto_422900 ) ( ON ?auto_422898 ?auto_422899 ) ( ON ?auto_422897 ?auto_422898 ) ( ON ?auto_422896 ?auto_422897 ) ( CLEAR ?auto_422894 ) ( ON ?auto_422895 ?auto_422896 ) ( CLEAR ?auto_422895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_422891 ?auto_422892 ?auto_422893 ?auto_422894 ?auto_422895 )
      ( MAKE-15PILE ?auto_422891 ?auto_422892 ?auto_422893 ?auto_422894 ?auto_422895 ?auto_422896 ?auto_422897 ?auto_422898 ?auto_422899 ?auto_422900 ?auto_422901 ?auto_422902 ?auto_422903 ?auto_422904 ?auto_422905 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422922 - BLOCK
      ?auto_422923 - BLOCK
      ?auto_422924 - BLOCK
      ?auto_422925 - BLOCK
      ?auto_422926 - BLOCK
      ?auto_422927 - BLOCK
      ?auto_422928 - BLOCK
      ?auto_422929 - BLOCK
      ?auto_422930 - BLOCK
      ?auto_422931 - BLOCK
      ?auto_422932 - BLOCK
      ?auto_422933 - BLOCK
      ?auto_422934 - BLOCK
      ?auto_422935 - BLOCK
      ?auto_422936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422936 ) ( ON-TABLE ?auto_422922 ) ( ON ?auto_422923 ?auto_422922 ) ( ON ?auto_422924 ?auto_422923 ) ( ON ?auto_422925 ?auto_422924 ) ( not ( = ?auto_422922 ?auto_422923 ) ) ( not ( = ?auto_422922 ?auto_422924 ) ) ( not ( = ?auto_422922 ?auto_422925 ) ) ( not ( = ?auto_422922 ?auto_422926 ) ) ( not ( = ?auto_422922 ?auto_422927 ) ) ( not ( = ?auto_422922 ?auto_422928 ) ) ( not ( = ?auto_422922 ?auto_422929 ) ) ( not ( = ?auto_422922 ?auto_422930 ) ) ( not ( = ?auto_422922 ?auto_422931 ) ) ( not ( = ?auto_422922 ?auto_422932 ) ) ( not ( = ?auto_422922 ?auto_422933 ) ) ( not ( = ?auto_422922 ?auto_422934 ) ) ( not ( = ?auto_422922 ?auto_422935 ) ) ( not ( = ?auto_422922 ?auto_422936 ) ) ( not ( = ?auto_422923 ?auto_422924 ) ) ( not ( = ?auto_422923 ?auto_422925 ) ) ( not ( = ?auto_422923 ?auto_422926 ) ) ( not ( = ?auto_422923 ?auto_422927 ) ) ( not ( = ?auto_422923 ?auto_422928 ) ) ( not ( = ?auto_422923 ?auto_422929 ) ) ( not ( = ?auto_422923 ?auto_422930 ) ) ( not ( = ?auto_422923 ?auto_422931 ) ) ( not ( = ?auto_422923 ?auto_422932 ) ) ( not ( = ?auto_422923 ?auto_422933 ) ) ( not ( = ?auto_422923 ?auto_422934 ) ) ( not ( = ?auto_422923 ?auto_422935 ) ) ( not ( = ?auto_422923 ?auto_422936 ) ) ( not ( = ?auto_422924 ?auto_422925 ) ) ( not ( = ?auto_422924 ?auto_422926 ) ) ( not ( = ?auto_422924 ?auto_422927 ) ) ( not ( = ?auto_422924 ?auto_422928 ) ) ( not ( = ?auto_422924 ?auto_422929 ) ) ( not ( = ?auto_422924 ?auto_422930 ) ) ( not ( = ?auto_422924 ?auto_422931 ) ) ( not ( = ?auto_422924 ?auto_422932 ) ) ( not ( = ?auto_422924 ?auto_422933 ) ) ( not ( = ?auto_422924 ?auto_422934 ) ) ( not ( = ?auto_422924 ?auto_422935 ) ) ( not ( = ?auto_422924 ?auto_422936 ) ) ( not ( = ?auto_422925 ?auto_422926 ) ) ( not ( = ?auto_422925 ?auto_422927 ) ) ( not ( = ?auto_422925 ?auto_422928 ) ) ( not ( = ?auto_422925 ?auto_422929 ) ) ( not ( = ?auto_422925 ?auto_422930 ) ) ( not ( = ?auto_422925 ?auto_422931 ) ) ( not ( = ?auto_422925 ?auto_422932 ) ) ( not ( = ?auto_422925 ?auto_422933 ) ) ( not ( = ?auto_422925 ?auto_422934 ) ) ( not ( = ?auto_422925 ?auto_422935 ) ) ( not ( = ?auto_422925 ?auto_422936 ) ) ( not ( = ?auto_422926 ?auto_422927 ) ) ( not ( = ?auto_422926 ?auto_422928 ) ) ( not ( = ?auto_422926 ?auto_422929 ) ) ( not ( = ?auto_422926 ?auto_422930 ) ) ( not ( = ?auto_422926 ?auto_422931 ) ) ( not ( = ?auto_422926 ?auto_422932 ) ) ( not ( = ?auto_422926 ?auto_422933 ) ) ( not ( = ?auto_422926 ?auto_422934 ) ) ( not ( = ?auto_422926 ?auto_422935 ) ) ( not ( = ?auto_422926 ?auto_422936 ) ) ( not ( = ?auto_422927 ?auto_422928 ) ) ( not ( = ?auto_422927 ?auto_422929 ) ) ( not ( = ?auto_422927 ?auto_422930 ) ) ( not ( = ?auto_422927 ?auto_422931 ) ) ( not ( = ?auto_422927 ?auto_422932 ) ) ( not ( = ?auto_422927 ?auto_422933 ) ) ( not ( = ?auto_422927 ?auto_422934 ) ) ( not ( = ?auto_422927 ?auto_422935 ) ) ( not ( = ?auto_422927 ?auto_422936 ) ) ( not ( = ?auto_422928 ?auto_422929 ) ) ( not ( = ?auto_422928 ?auto_422930 ) ) ( not ( = ?auto_422928 ?auto_422931 ) ) ( not ( = ?auto_422928 ?auto_422932 ) ) ( not ( = ?auto_422928 ?auto_422933 ) ) ( not ( = ?auto_422928 ?auto_422934 ) ) ( not ( = ?auto_422928 ?auto_422935 ) ) ( not ( = ?auto_422928 ?auto_422936 ) ) ( not ( = ?auto_422929 ?auto_422930 ) ) ( not ( = ?auto_422929 ?auto_422931 ) ) ( not ( = ?auto_422929 ?auto_422932 ) ) ( not ( = ?auto_422929 ?auto_422933 ) ) ( not ( = ?auto_422929 ?auto_422934 ) ) ( not ( = ?auto_422929 ?auto_422935 ) ) ( not ( = ?auto_422929 ?auto_422936 ) ) ( not ( = ?auto_422930 ?auto_422931 ) ) ( not ( = ?auto_422930 ?auto_422932 ) ) ( not ( = ?auto_422930 ?auto_422933 ) ) ( not ( = ?auto_422930 ?auto_422934 ) ) ( not ( = ?auto_422930 ?auto_422935 ) ) ( not ( = ?auto_422930 ?auto_422936 ) ) ( not ( = ?auto_422931 ?auto_422932 ) ) ( not ( = ?auto_422931 ?auto_422933 ) ) ( not ( = ?auto_422931 ?auto_422934 ) ) ( not ( = ?auto_422931 ?auto_422935 ) ) ( not ( = ?auto_422931 ?auto_422936 ) ) ( not ( = ?auto_422932 ?auto_422933 ) ) ( not ( = ?auto_422932 ?auto_422934 ) ) ( not ( = ?auto_422932 ?auto_422935 ) ) ( not ( = ?auto_422932 ?auto_422936 ) ) ( not ( = ?auto_422933 ?auto_422934 ) ) ( not ( = ?auto_422933 ?auto_422935 ) ) ( not ( = ?auto_422933 ?auto_422936 ) ) ( not ( = ?auto_422934 ?auto_422935 ) ) ( not ( = ?auto_422934 ?auto_422936 ) ) ( not ( = ?auto_422935 ?auto_422936 ) ) ( ON ?auto_422935 ?auto_422936 ) ( ON ?auto_422934 ?auto_422935 ) ( ON ?auto_422933 ?auto_422934 ) ( ON ?auto_422932 ?auto_422933 ) ( ON ?auto_422931 ?auto_422932 ) ( ON ?auto_422930 ?auto_422931 ) ( ON ?auto_422929 ?auto_422930 ) ( ON ?auto_422928 ?auto_422929 ) ( ON ?auto_422927 ?auto_422928 ) ( CLEAR ?auto_422925 ) ( ON ?auto_422926 ?auto_422927 ) ( CLEAR ?auto_422926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_422922 ?auto_422923 ?auto_422924 ?auto_422925 ?auto_422926 )
      ( MAKE-15PILE ?auto_422922 ?auto_422923 ?auto_422924 ?auto_422925 ?auto_422926 ?auto_422927 ?auto_422928 ?auto_422929 ?auto_422930 ?auto_422931 ?auto_422932 ?auto_422933 ?auto_422934 ?auto_422935 ?auto_422936 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422952 - BLOCK
      ?auto_422953 - BLOCK
      ?auto_422954 - BLOCK
      ?auto_422955 - BLOCK
      ?auto_422956 - BLOCK
      ?auto_422957 - BLOCK
      ?auto_422958 - BLOCK
      ?auto_422959 - BLOCK
      ?auto_422960 - BLOCK
      ?auto_422961 - BLOCK
      ?auto_422962 - BLOCK
      ?auto_422963 - BLOCK
      ?auto_422964 - BLOCK
      ?auto_422965 - BLOCK
      ?auto_422966 - BLOCK
    )
    :vars
    (
      ?auto_422967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_422966 ?auto_422967 ) ( ON-TABLE ?auto_422952 ) ( ON ?auto_422953 ?auto_422952 ) ( ON ?auto_422954 ?auto_422953 ) ( not ( = ?auto_422952 ?auto_422953 ) ) ( not ( = ?auto_422952 ?auto_422954 ) ) ( not ( = ?auto_422952 ?auto_422955 ) ) ( not ( = ?auto_422952 ?auto_422956 ) ) ( not ( = ?auto_422952 ?auto_422957 ) ) ( not ( = ?auto_422952 ?auto_422958 ) ) ( not ( = ?auto_422952 ?auto_422959 ) ) ( not ( = ?auto_422952 ?auto_422960 ) ) ( not ( = ?auto_422952 ?auto_422961 ) ) ( not ( = ?auto_422952 ?auto_422962 ) ) ( not ( = ?auto_422952 ?auto_422963 ) ) ( not ( = ?auto_422952 ?auto_422964 ) ) ( not ( = ?auto_422952 ?auto_422965 ) ) ( not ( = ?auto_422952 ?auto_422966 ) ) ( not ( = ?auto_422952 ?auto_422967 ) ) ( not ( = ?auto_422953 ?auto_422954 ) ) ( not ( = ?auto_422953 ?auto_422955 ) ) ( not ( = ?auto_422953 ?auto_422956 ) ) ( not ( = ?auto_422953 ?auto_422957 ) ) ( not ( = ?auto_422953 ?auto_422958 ) ) ( not ( = ?auto_422953 ?auto_422959 ) ) ( not ( = ?auto_422953 ?auto_422960 ) ) ( not ( = ?auto_422953 ?auto_422961 ) ) ( not ( = ?auto_422953 ?auto_422962 ) ) ( not ( = ?auto_422953 ?auto_422963 ) ) ( not ( = ?auto_422953 ?auto_422964 ) ) ( not ( = ?auto_422953 ?auto_422965 ) ) ( not ( = ?auto_422953 ?auto_422966 ) ) ( not ( = ?auto_422953 ?auto_422967 ) ) ( not ( = ?auto_422954 ?auto_422955 ) ) ( not ( = ?auto_422954 ?auto_422956 ) ) ( not ( = ?auto_422954 ?auto_422957 ) ) ( not ( = ?auto_422954 ?auto_422958 ) ) ( not ( = ?auto_422954 ?auto_422959 ) ) ( not ( = ?auto_422954 ?auto_422960 ) ) ( not ( = ?auto_422954 ?auto_422961 ) ) ( not ( = ?auto_422954 ?auto_422962 ) ) ( not ( = ?auto_422954 ?auto_422963 ) ) ( not ( = ?auto_422954 ?auto_422964 ) ) ( not ( = ?auto_422954 ?auto_422965 ) ) ( not ( = ?auto_422954 ?auto_422966 ) ) ( not ( = ?auto_422954 ?auto_422967 ) ) ( not ( = ?auto_422955 ?auto_422956 ) ) ( not ( = ?auto_422955 ?auto_422957 ) ) ( not ( = ?auto_422955 ?auto_422958 ) ) ( not ( = ?auto_422955 ?auto_422959 ) ) ( not ( = ?auto_422955 ?auto_422960 ) ) ( not ( = ?auto_422955 ?auto_422961 ) ) ( not ( = ?auto_422955 ?auto_422962 ) ) ( not ( = ?auto_422955 ?auto_422963 ) ) ( not ( = ?auto_422955 ?auto_422964 ) ) ( not ( = ?auto_422955 ?auto_422965 ) ) ( not ( = ?auto_422955 ?auto_422966 ) ) ( not ( = ?auto_422955 ?auto_422967 ) ) ( not ( = ?auto_422956 ?auto_422957 ) ) ( not ( = ?auto_422956 ?auto_422958 ) ) ( not ( = ?auto_422956 ?auto_422959 ) ) ( not ( = ?auto_422956 ?auto_422960 ) ) ( not ( = ?auto_422956 ?auto_422961 ) ) ( not ( = ?auto_422956 ?auto_422962 ) ) ( not ( = ?auto_422956 ?auto_422963 ) ) ( not ( = ?auto_422956 ?auto_422964 ) ) ( not ( = ?auto_422956 ?auto_422965 ) ) ( not ( = ?auto_422956 ?auto_422966 ) ) ( not ( = ?auto_422956 ?auto_422967 ) ) ( not ( = ?auto_422957 ?auto_422958 ) ) ( not ( = ?auto_422957 ?auto_422959 ) ) ( not ( = ?auto_422957 ?auto_422960 ) ) ( not ( = ?auto_422957 ?auto_422961 ) ) ( not ( = ?auto_422957 ?auto_422962 ) ) ( not ( = ?auto_422957 ?auto_422963 ) ) ( not ( = ?auto_422957 ?auto_422964 ) ) ( not ( = ?auto_422957 ?auto_422965 ) ) ( not ( = ?auto_422957 ?auto_422966 ) ) ( not ( = ?auto_422957 ?auto_422967 ) ) ( not ( = ?auto_422958 ?auto_422959 ) ) ( not ( = ?auto_422958 ?auto_422960 ) ) ( not ( = ?auto_422958 ?auto_422961 ) ) ( not ( = ?auto_422958 ?auto_422962 ) ) ( not ( = ?auto_422958 ?auto_422963 ) ) ( not ( = ?auto_422958 ?auto_422964 ) ) ( not ( = ?auto_422958 ?auto_422965 ) ) ( not ( = ?auto_422958 ?auto_422966 ) ) ( not ( = ?auto_422958 ?auto_422967 ) ) ( not ( = ?auto_422959 ?auto_422960 ) ) ( not ( = ?auto_422959 ?auto_422961 ) ) ( not ( = ?auto_422959 ?auto_422962 ) ) ( not ( = ?auto_422959 ?auto_422963 ) ) ( not ( = ?auto_422959 ?auto_422964 ) ) ( not ( = ?auto_422959 ?auto_422965 ) ) ( not ( = ?auto_422959 ?auto_422966 ) ) ( not ( = ?auto_422959 ?auto_422967 ) ) ( not ( = ?auto_422960 ?auto_422961 ) ) ( not ( = ?auto_422960 ?auto_422962 ) ) ( not ( = ?auto_422960 ?auto_422963 ) ) ( not ( = ?auto_422960 ?auto_422964 ) ) ( not ( = ?auto_422960 ?auto_422965 ) ) ( not ( = ?auto_422960 ?auto_422966 ) ) ( not ( = ?auto_422960 ?auto_422967 ) ) ( not ( = ?auto_422961 ?auto_422962 ) ) ( not ( = ?auto_422961 ?auto_422963 ) ) ( not ( = ?auto_422961 ?auto_422964 ) ) ( not ( = ?auto_422961 ?auto_422965 ) ) ( not ( = ?auto_422961 ?auto_422966 ) ) ( not ( = ?auto_422961 ?auto_422967 ) ) ( not ( = ?auto_422962 ?auto_422963 ) ) ( not ( = ?auto_422962 ?auto_422964 ) ) ( not ( = ?auto_422962 ?auto_422965 ) ) ( not ( = ?auto_422962 ?auto_422966 ) ) ( not ( = ?auto_422962 ?auto_422967 ) ) ( not ( = ?auto_422963 ?auto_422964 ) ) ( not ( = ?auto_422963 ?auto_422965 ) ) ( not ( = ?auto_422963 ?auto_422966 ) ) ( not ( = ?auto_422963 ?auto_422967 ) ) ( not ( = ?auto_422964 ?auto_422965 ) ) ( not ( = ?auto_422964 ?auto_422966 ) ) ( not ( = ?auto_422964 ?auto_422967 ) ) ( not ( = ?auto_422965 ?auto_422966 ) ) ( not ( = ?auto_422965 ?auto_422967 ) ) ( not ( = ?auto_422966 ?auto_422967 ) ) ( ON ?auto_422965 ?auto_422966 ) ( ON ?auto_422964 ?auto_422965 ) ( ON ?auto_422963 ?auto_422964 ) ( ON ?auto_422962 ?auto_422963 ) ( ON ?auto_422961 ?auto_422962 ) ( ON ?auto_422960 ?auto_422961 ) ( ON ?auto_422959 ?auto_422960 ) ( ON ?auto_422958 ?auto_422959 ) ( ON ?auto_422957 ?auto_422958 ) ( ON ?auto_422956 ?auto_422957 ) ( CLEAR ?auto_422954 ) ( ON ?auto_422955 ?auto_422956 ) ( CLEAR ?auto_422955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_422952 ?auto_422953 ?auto_422954 ?auto_422955 )
      ( MAKE-15PILE ?auto_422952 ?auto_422953 ?auto_422954 ?auto_422955 ?auto_422956 ?auto_422957 ?auto_422958 ?auto_422959 ?auto_422960 ?auto_422961 ?auto_422962 ?auto_422963 ?auto_422964 ?auto_422965 ?auto_422966 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_422983 - BLOCK
      ?auto_422984 - BLOCK
      ?auto_422985 - BLOCK
      ?auto_422986 - BLOCK
      ?auto_422987 - BLOCK
      ?auto_422988 - BLOCK
      ?auto_422989 - BLOCK
      ?auto_422990 - BLOCK
      ?auto_422991 - BLOCK
      ?auto_422992 - BLOCK
      ?auto_422993 - BLOCK
      ?auto_422994 - BLOCK
      ?auto_422995 - BLOCK
      ?auto_422996 - BLOCK
      ?auto_422997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_422997 ) ( ON-TABLE ?auto_422983 ) ( ON ?auto_422984 ?auto_422983 ) ( ON ?auto_422985 ?auto_422984 ) ( not ( = ?auto_422983 ?auto_422984 ) ) ( not ( = ?auto_422983 ?auto_422985 ) ) ( not ( = ?auto_422983 ?auto_422986 ) ) ( not ( = ?auto_422983 ?auto_422987 ) ) ( not ( = ?auto_422983 ?auto_422988 ) ) ( not ( = ?auto_422983 ?auto_422989 ) ) ( not ( = ?auto_422983 ?auto_422990 ) ) ( not ( = ?auto_422983 ?auto_422991 ) ) ( not ( = ?auto_422983 ?auto_422992 ) ) ( not ( = ?auto_422983 ?auto_422993 ) ) ( not ( = ?auto_422983 ?auto_422994 ) ) ( not ( = ?auto_422983 ?auto_422995 ) ) ( not ( = ?auto_422983 ?auto_422996 ) ) ( not ( = ?auto_422983 ?auto_422997 ) ) ( not ( = ?auto_422984 ?auto_422985 ) ) ( not ( = ?auto_422984 ?auto_422986 ) ) ( not ( = ?auto_422984 ?auto_422987 ) ) ( not ( = ?auto_422984 ?auto_422988 ) ) ( not ( = ?auto_422984 ?auto_422989 ) ) ( not ( = ?auto_422984 ?auto_422990 ) ) ( not ( = ?auto_422984 ?auto_422991 ) ) ( not ( = ?auto_422984 ?auto_422992 ) ) ( not ( = ?auto_422984 ?auto_422993 ) ) ( not ( = ?auto_422984 ?auto_422994 ) ) ( not ( = ?auto_422984 ?auto_422995 ) ) ( not ( = ?auto_422984 ?auto_422996 ) ) ( not ( = ?auto_422984 ?auto_422997 ) ) ( not ( = ?auto_422985 ?auto_422986 ) ) ( not ( = ?auto_422985 ?auto_422987 ) ) ( not ( = ?auto_422985 ?auto_422988 ) ) ( not ( = ?auto_422985 ?auto_422989 ) ) ( not ( = ?auto_422985 ?auto_422990 ) ) ( not ( = ?auto_422985 ?auto_422991 ) ) ( not ( = ?auto_422985 ?auto_422992 ) ) ( not ( = ?auto_422985 ?auto_422993 ) ) ( not ( = ?auto_422985 ?auto_422994 ) ) ( not ( = ?auto_422985 ?auto_422995 ) ) ( not ( = ?auto_422985 ?auto_422996 ) ) ( not ( = ?auto_422985 ?auto_422997 ) ) ( not ( = ?auto_422986 ?auto_422987 ) ) ( not ( = ?auto_422986 ?auto_422988 ) ) ( not ( = ?auto_422986 ?auto_422989 ) ) ( not ( = ?auto_422986 ?auto_422990 ) ) ( not ( = ?auto_422986 ?auto_422991 ) ) ( not ( = ?auto_422986 ?auto_422992 ) ) ( not ( = ?auto_422986 ?auto_422993 ) ) ( not ( = ?auto_422986 ?auto_422994 ) ) ( not ( = ?auto_422986 ?auto_422995 ) ) ( not ( = ?auto_422986 ?auto_422996 ) ) ( not ( = ?auto_422986 ?auto_422997 ) ) ( not ( = ?auto_422987 ?auto_422988 ) ) ( not ( = ?auto_422987 ?auto_422989 ) ) ( not ( = ?auto_422987 ?auto_422990 ) ) ( not ( = ?auto_422987 ?auto_422991 ) ) ( not ( = ?auto_422987 ?auto_422992 ) ) ( not ( = ?auto_422987 ?auto_422993 ) ) ( not ( = ?auto_422987 ?auto_422994 ) ) ( not ( = ?auto_422987 ?auto_422995 ) ) ( not ( = ?auto_422987 ?auto_422996 ) ) ( not ( = ?auto_422987 ?auto_422997 ) ) ( not ( = ?auto_422988 ?auto_422989 ) ) ( not ( = ?auto_422988 ?auto_422990 ) ) ( not ( = ?auto_422988 ?auto_422991 ) ) ( not ( = ?auto_422988 ?auto_422992 ) ) ( not ( = ?auto_422988 ?auto_422993 ) ) ( not ( = ?auto_422988 ?auto_422994 ) ) ( not ( = ?auto_422988 ?auto_422995 ) ) ( not ( = ?auto_422988 ?auto_422996 ) ) ( not ( = ?auto_422988 ?auto_422997 ) ) ( not ( = ?auto_422989 ?auto_422990 ) ) ( not ( = ?auto_422989 ?auto_422991 ) ) ( not ( = ?auto_422989 ?auto_422992 ) ) ( not ( = ?auto_422989 ?auto_422993 ) ) ( not ( = ?auto_422989 ?auto_422994 ) ) ( not ( = ?auto_422989 ?auto_422995 ) ) ( not ( = ?auto_422989 ?auto_422996 ) ) ( not ( = ?auto_422989 ?auto_422997 ) ) ( not ( = ?auto_422990 ?auto_422991 ) ) ( not ( = ?auto_422990 ?auto_422992 ) ) ( not ( = ?auto_422990 ?auto_422993 ) ) ( not ( = ?auto_422990 ?auto_422994 ) ) ( not ( = ?auto_422990 ?auto_422995 ) ) ( not ( = ?auto_422990 ?auto_422996 ) ) ( not ( = ?auto_422990 ?auto_422997 ) ) ( not ( = ?auto_422991 ?auto_422992 ) ) ( not ( = ?auto_422991 ?auto_422993 ) ) ( not ( = ?auto_422991 ?auto_422994 ) ) ( not ( = ?auto_422991 ?auto_422995 ) ) ( not ( = ?auto_422991 ?auto_422996 ) ) ( not ( = ?auto_422991 ?auto_422997 ) ) ( not ( = ?auto_422992 ?auto_422993 ) ) ( not ( = ?auto_422992 ?auto_422994 ) ) ( not ( = ?auto_422992 ?auto_422995 ) ) ( not ( = ?auto_422992 ?auto_422996 ) ) ( not ( = ?auto_422992 ?auto_422997 ) ) ( not ( = ?auto_422993 ?auto_422994 ) ) ( not ( = ?auto_422993 ?auto_422995 ) ) ( not ( = ?auto_422993 ?auto_422996 ) ) ( not ( = ?auto_422993 ?auto_422997 ) ) ( not ( = ?auto_422994 ?auto_422995 ) ) ( not ( = ?auto_422994 ?auto_422996 ) ) ( not ( = ?auto_422994 ?auto_422997 ) ) ( not ( = ?auto_422995 ?auto_422996 ) ) ( not ( = ?auto_422995 ?auto_422997 ) ) ( not ( = ?auto_422996 ?auto_422997 ) ) ( ON ?auto_422996 ?auto_422997 ) ( ON ?auto_422995 ?auto_422996 ) ( ON ?auto_422994 ?auto_422995 ) ( ON ?auto_422993 ?auto_422994 ) ( ON ?auto_422992 ?auto_422993 ) ( ON ?auto_422991 ?auto_422992 ) ( ON ?auto_422990 ?auto_422991 ) ( ON ?auto_422989 ?auto_422990 ) ( ON ?auto_422988 ?auto_422989 ) ( ON ?auto_422987 ?auto_422988 ) ( CLEAR ?auto_422985 ) ( ON ?auto_422986 ?auto_422987 ) ( CLEAR ?auto_422986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_422983 ?auto_422984 ?auto_422985 ?auto_422986 )
      ( MAKE-15PILE ?auto_422983 ?auto_422984 ?auto_422985 ?auto_422986 ?auto_422987 ?auto_422988 ?auto_422989 ?auto_422990 ?auto_422991 ?auto_422992 ?auto_422993 ?auto_422994 ?auto_422995 ?auto_422996 ?auto_422997 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_423013 - BLOCK
      ?auto_423014 - BLOCK
      ?auto_423015 - BLOCK
      ?auto_423016 - BLOCK
      ?auto_423017 - BLOCK
      ?auto_423018 - BLOCK
      ?auto_423019 - BLOCK
      ?auto_423020 - BLOCK
      ?auto_423021 - BLOCK
      ?auto_423022 - BLOCK
      ?auto_423023 - BLOCK
      ?auto_423024 - BLOCK
      ?auto_423025 - BLOCK
      ?auto_423026 - BLOCK
      ?auto_423027 - BLOCK
    )
    :vars
    (
      ?auto_423028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423027 ?auto_423028 ) ( ON-TABLE ?auto_423013 ) ( ON ?auto_423014 ?auto_423013 ) ( not ( = ?auto_423013 ?auto_423014 ) ) ( not ( = ?auto_423013 ?auto_423015 ) ) ( not ( = ?auto_423013 ?auto_423016 ) ) ( not ( = ?auto_423013 ?auto_423017 ) ) ( not ( = ?auto_423013 ?auto_423018 ) ) ( not ( = ?auto_423013 ?auto_423019 ) ) ( not ( = ?auto_423013 ?auto_423020 ) ) ( not ( = ?auto_423013 ?auto_423021 ) ) ( not ( = ?auto_423013 ?auto_423022 ) ) ( not ( = ?auto_423013 ?auto_423023 ) ) ( not ( = ?auto_423013 ?auto_423024 ) ) ( not ( = ?auto_423013 ?auto_423025 ) ) ( not ( = ?auto_423013 ?auto_423026 ) ) ( not ( = ?auto_423013 ?auto_423027 ) ) ( not ( = ?auto_423013 ?auto_423028 ) ) ( not ( = ?auto_423014 ?auto_423015 ) ) ( not ( = ?auto_423014 ?auto_423016 ) ) ( not ( = ?auto_423014 ?auto_423017 ) ) ( not ( = ?auto_423014 ?auto_423018 ) ) ( not ( = ?auto_423014 ?auto_423019 ) ) ( not ( = ?auto_423014 ?auto_423020 ) ) ( not ( = ?auto_423014 ?auto_423021 ) ) ( not ( = ?auto_423014 ?auto_423022 ) ) ( not ( = ?auto_423014 ?auto_423023 ) ) ( not ( = ?auto_423014 ?auto_423024 ) ) ( not ( = ?auto_423014 ?auto_423025 ) ) ( not ( = ?auto_423014 ?auto_423026 ) ) ( not ( = ?auto_423014 ?auto_423027 ) ) ( not ( = ?auto_423014 ?auto_423028 ) ) ( not ( = ?auto_423015 ?auto_423016 ) ) ( not ( = ?auto_423015 ?auto_423017 ) ) ( not ( = ?auto_423015 ?auto_423018 ) ) ( not ( = ?auto_423015 ?auto_423019 ) ) ( not ( = ?auto_423015 ?auto_423020 ) ) ( not ( = ?auto_423015 ?auto_423021 ) ) ( not ( = ?auto_423015 ?auto_423022 ) ) ( not ( = ?auto_423015 ?auto_423023 ) ) ( not ( = ?auto_423015 ?auto_423024 ) ) ( not ( = ?auto_423015 ?auto_423025 ) ) ( not ( = ?auto_423015 ?auto_423026 ) ) ( not ( = ?auto_423015 ?auto_423027 ) ) ( not ( = ?auto_423015 ?auto_423028 ) ) ( not ( = ?auto_423016 ?auto_423017 ) ) ( not ( = ?auto_423016 ?auto_423018 ) ) ( not ( = ?auto_423016 ?auto_423019 ) ) ( not ( = ?auto_423016 ?auto_423020 ) ) ( not ( = ?auto_423016 ?auto_423021 ) ) ( not ( = ?auto_423016 ?auto_423022 ) ) ( not ( = ?auto_423016 ?auto_423023 ) ) ( not ( = ?auto_423016 ?auto_423024 ) ) ( not ( = ?auto_423016 ?auto_423025 ) ) ( not ( = ?auto_423016 ?auto_423026 ) ) ( not ( = ?auto_423016 ?auto_423027 ) ) ( not ( = ?auto_423016 ?auto_423028 ) ) ( not ( = ?auto_423017 ?auto_423018 ) ) ( not ( = ?auto_423017 ?auto_423019 ) ) ( not ( = ?auto_423017 ?auto_423020 ) ) ( not ( = ?auto_423017 ?auto_423021 ) ) ( not ( = ?auto_423017 ?auto_423022 ) ) ( not ( = ?auto_423017 ?auto_423023 ) ) ( not ( = ?auto_423017 ?auto_423024 ) ) ( not ( = ?auto_423017 ?auto_423025 ) ) ( not ( = ?auto_423017 ?auto_423026 ) ) ( not ( = ?auto_423017 ?auto_423027 ) ) ( not ( = ?auto_423017 ?auto_423028 ) ) ( not ( = ?auto_423018 ?auto_423019 ) ) ( not ( = ?auto_423018 ?auto_423020 ) ) ( not ( = ?auto_423018 ?auto_423021 ) ) ( not ( = ?auto_423018 ?auto_423022 ) ) ( not ( = ?auto_423018 ?auto_423023 ) ) ( not ( = ?auto_423018 ?auto_423024 ) ) ( not ( = ?auto_423018 ?auto_423025 ) ) ( not ( = ?auto_423018 ?auto_423026 ) ) ( not ( = ?auto_423018 ?auto_423027 ) ) ( not ( = ?auto_423018 ?auto_423028 ) ) ( not ( = ?auto_423019 ?auto_423020 ) ) ( not ( = ?auto_423019 ?auto_423021 ) ) ( not ( = ?auto_423019 ?auto_423022 ) ) ( not ( = ?auto_423019 ?auto_423023 ) ) ( not ( = ?auto_423019 ?auto_423024 ) ) ( not ( = ?auto_423019 ?auto_423025 ) ) ( not ( = ?auto_423019 ?auto_423026 ) ) ( not ( = ?auto_423019 ?auto_423027 ) ) ( not ( = ?auto_423019 ?auto_423028 ) ) ( not ( = ?auto_423020 ?auto_423021 ) ) ( not ( = ?auto_423020 ?auto_423022 ) ) ( not ( = ?auto_423020 ?auto_423023 ) ) ( not ( = ?auto_423020 ?auto_423024 ) ) ( not ( = ?auto_423020 ?auto_423025 ) ) ( not ( = ?auto_423020 ?auto_423026 ) ) ( not ( = ?auto_423020 ?auto_423027 ) ) ( not ( = ?auto_423020 ?auto_423028 ) ) ( not ( = ?auto_423021 ?auto_423022 ) ) ( not ( = ?auto_423021 ?auto_423023 ) ) ( not ( = ?auto_423021 ?auto_423024 ) ) ( not ( = ?auto_423021 ?auto_423025 ) ) ( not ( = ?auto_423021 ?auto_423026 ) ) ( not ( = ?auto_423021 ?auto_423027 ) ) ( not ( = ?auto_423021 ?auto_423028 ) ) ( not ( = ?auto_423022 ?auto_423023 ) ) ( not ( = ?auto_423022 ?auto_423024 ) ) ( not ( = ?auto_423022 ?auto_423025 ) ) ( not ( = ?auto_423022 ?auto_423026 ) ) ( not ( = ?auto_423022 ?auto_423027 ) ) ( not ( = ?auto_423022 ?auto_423028 ) ) ( not ( = ?auto_423023 ?auto_423024 ) ) ( not ( = ?auto_423023 ?auto_423025 ) ) ( not ( = ?auto_423023 ?auto_423026 ) ) ( not ( = ?auto_423023 ?auto_423027 ) ) ( not ( = ?auto_423023 ?auto_423028 ) ) ( not ( = ?auto_423024 ?auto_423025 ) ) ( not ( = ?auto_423024 ?auto_423026 ) ) ( not ( = ?auto_423024 ?auto_423027 ) ) ( not ( = ?auto_423024 ?auto_423028 ) ) ( not ( = ?auto_423025 ?auto_423026 ) ) ( not ( = ?auto_423025 ?auto_423027 ) ) ( not ( = ?auto_423025 ?auto_423028 ) ) ( not ( = ?auto_423026 ?auto_423027 ) ) ( not ( = ?auto_423026 ?auto_423028 ) ) ( not ( = ?auto_423027 ?auto_423028 ) ) ( ON ?auto_423026 ?auto_423027 ) ( ON ?auto_423025 ?auto_423026 ) ( ON ?auto_423024 ?auto_423025 ) ( ON ?auto_423023 ?auto_423024 ) ( ON ?auto_423022 ?auto_423023 ) ( ON ?auto_423021 ?auto_423022 ) ( ON ?auto_423020 ?auto_423021 ) ( ON ?auto_423019 ?auto_423020 ) ( ON ?auto_423018 ?auto_423019 ) ( ON ?auto_423017 ?auto_423018 ) ( ON ?auto_423016 ?auto_423017 ) ( CLEAR ?auto_423014 ) ( ON ?auto_423015 ?auto_423016 ) ( CLEAR ?auto_423015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_423013 ?auto_423014 ?auto_423015 )
      ( MAKE-15PILE ?auto_423013 ?auto_423014 ?auto_423015 ?auto_423016 ?auto_423017 ?auto_423018 ?auto_423019 ?auto_423020 ?auto_423021 ?auto_423022 ?auto_423023 ?auto_423024 ?auto_423025 ?auto_423026 ?auto_423027 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_423044 - BLOCK
      ?auto_423045 - BLOCK
      ?auto_423046 - BLOCK
      ?auto_423047 - BLOCK
      ?auto_423048 - BLOCK
      ?auto_423049 - BLOCK
      ?auto_423050 - BLOCK
      ?auto_423051 - BLOCK
      ?auto_423052 - BLOCK
      ?auto_423053 - BLOCK
      ?auto_423054 - BLOCK
      ?auto_423055 - BLOCK
      ?auto_423056 - BLOCK
      ?auto_423057 - BLOCK
      ?auto_423058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_423058 ) ( ON-TABLE ?auto_423044 ) ( ON ?auto_423045 ?auto_423044 ) ( not ( = ?auto_423044 ?auto_423045 ) ) ( not ( = ?auto_423044 ?auto_423046 ) ) ( not ( = ?auto_423044 ?auto_423047 ) ) ( not ( = ?auto_423044 ?auto_423048 ) ) ( not ( = ?auto_423044 ?auto_423049 ) ) ( not ( = ?auto_423044 ?auto_423050 ) ) ( not ( = ?auto_423044 ?auto_423051 ) ) ( not ( = ?auto_423044 ?auto_423052 ) ) ( not ( = ?auto_423044 ?auto_423053 ) ) ( not ( = ?auto_423044 ?auto_423054 ) ) ( not ( = ?auto_423044 ?auto_423055 ) ) ( not ( = ?auto_423044 ?auto_423056 ) ) ( not ( = ?auto_423044 ?auto_423057 ) ) ( not ( = ?auto_423044 ?auto_423058 ) ) ( not ( = ?auto_423045 ?auto_423046 ) ) ( not ( = ?auto_423045 ?auto_423047 ) ) ( not ( = ?auto_423045 ?auto_423048 ) ) ( not ( = ?auto_423045 ?auto_423049 ) ) ( not ( = ?auto_423045 ?auto_423050 ) ) ( not ( = ?auto_423045 ?auto_423051 ) ) ( not ( = ?auto_423045 ?auto_423052 ) ) ( not ( = ?auto_423045 ?auto_423053 ) ) ( not ( = ?auto_423045 ?auto_423054 ) ) ( not ( = ?auto_423045 ?auto_423055 ) ) ( not ( = ?auto_423045 ?auto_423056 ) ) ( not ( = ?auto_423045 ?auto_423057 ) ) ( not ( = ?auto_423045 ?auto_423058 ) ) ( not ( = ?auto_423046 ?auto_423047 ) ) ( not ( = ?auto_423046 ?auto_423048 ) ) ( not ( = ?auto_423046 ?auto_423049 ) ) ( not ( = ?auto_423046 ?auto_423050 ) ) ( not ( = ?auto_423046 ?auto_423051 ) ) ( not ( = ?auto_423046 ?auto_423052 ) ) ( not ( = ?auto_423046 ?auto_423053 ) ) ( not ( = ?auto_423046 ?auto_423054 ) ) ( not ( = ?auto_423046 ?auto_423055 ) ) ( not ( = ?auto_423046 ?auto_423056 ) ) ( not ( = ?auto_423046 ?auto_423057 ) ) ( not ( = ?auto_423046 ?auto_423058 ) ) ( not ( = ?auto_423047 ?auto_423048 ) ) ( not ( = ?auto_423047 ?auto_423049 ) ) ( not ( = ?auto_423047 ?auto_423050 ) ) ( not ( = ?auto_423047 ?auto_423051 ) ) ( not ( = ?auto_423047 ?auto_423052 ) ) ( not ( = ?auto_423047 ?auto_423053 ) ) ( not ( = ?auto_423047 ?auto_423054 ) ) ( not ( = ?auto_423047 ?auto_423055 ) ) ( not ( = ?auto_423047 ?auto_423056 ) ) ( not ( = ?auto_423047 ?auto_423057 ) ) ( not ( = ?auto_423047 ?auto_423058 ) ) ( not ( = ?auto_423048 ?auto_423049 ) ) ( not ( = ?auto_423048 ?auto_423050 ) ) ( not ( = ?auto_423048 ?auto_423051 ) ) ( not ( = ?auto_423048 ?auto_423052 ) ) ( not ( = ?auto_423048 ?auto_423053 ) ) ( not ( = ?auto_423048 ?auto_423054 ) ) ( not ( = ?auto_423048 ?auto_423055 ) ) ( not ( = ?auto_423048 ?auto_423056 ) ) ( not ( = ?auto_423048 ?auto_423057 ) ) ( not ( = ?auto_423048 ?auto_423058 ) ) ( not ( = ?auto_423049 ?auto_423050 ) ) ( not ( = ?auto_423049 ?auto_423051 ) ) ( not ( = ?auto_423049 ?auto_423052 ) ) ( not ( = ?auto_423049 ?auto_423053 ) ) ( not ( = ?auto_423049 ?auto_423054 ) ) ( not ( = ?auto_423049 ?auto_423055 ) ) ( not ( = ?auto_423049 ?auto_423056 ) ) ( not ( = ?auto_423049 ?auto_423057 ) ) ( not ( = ?auto_423049 ?auto_423058 ) ) ( not ( = ?auto_423050 ?auto_423051 ) ) ( not ( = ?auto_423050 ?auto_423052 ) ) ( not ( = ?auto_423050 ?auto_423053 ) ) ( not ( = ?auto_423050 ?auto_423054 ) ) ( not ( = ?auto_423050 ?auto_423055 ) ) ( not ( = ?auto_423050 ?auto_423056 ) ) ( not ( = ?auto_423050 ?auto_423057 ) ) ( not ( = ?auto_423050 ?auto_423058 ) ) ( not ( = ?auto_423051 ?auto_423052 ) ) ( not ( = ?auto_423051 ?auto_423053 ) ) ( not ( = ?auto_423051 ?auto_423054 ) ) ( not ( = ?auto_423051 ?auto_423055 ) ) ( not ( = ?auto_423051 ?auto_423056 ) ) ( not ( = ?auto_423051 ?auto_423057 ) ) ( not ( = ?auto_423051 ?auto_423058 ) ) ( not ( = ?auto_423052 ?auto_423053 ) ) ( not ( = ?auto_423052 ?auto_423054 ) ) ( not ( = ?auto_423052 ?auto_423055 ) ) ( not ( = ?auto_423052 ?auto_423056 ) ) ( not ( = ?auto_423052 ?auto_423057 ) ) ( not ( = ?auto_423052 ?auto_423058 ) ) ( not ( = ?auto_423053 ?auto_423054 ) ) ( not ( = ?auto_423053 ?auto_423055 ) ) ( not ( = ?auto_423053 ?auto_423056 ) ) ( not ( = ?auto_423053 ?auto_423057 ) ) ( not ( = ?auto_423053 ?auto_423058 ) ) ( not ( = ?auto_423054 ?auto_423055 ) ) ( not ( = ?auto_423054 ?auto_423056 ) ) ( not ( = ?auto_423054 ?auto_423057 ) ) ( not ( = ?auto_423054 ?auto_423058 ) ) ( not ( = ?auto_423055 ?auto_423056 ) ) ( not ( = ?auto_423055 ?auto_423057 ) ) ( not ( = ?auto_423055 ?auto_423058 ) ) ( not ( = ?auto_423056 ?auto_423057 ) ) ( not ( = ?auto_423056 ?auto_423058 ) ) ( not ( = ?auto_423057 ?auto_423058 ) ) ( ON ?auto_423057 ?auto_423058 ) ( ON ?auto_423056 ?auto_423057 ) ( ON ?auto_423055 ?auto_423056 ) ( ON ?auto_423054 ?auto_423055 ) ( ON ?auto_423053 ?auto_423054 ) ( ON ?auto_423052 ?auto_423053 ) ( ON ?auto_423051 ?auto_423052 ) ( ON ?auto_423050 ?auto_423051 ) ( ON ?auto_423049 ?auto_423050 ) ( ON ?auto_423048 ?auto_423049 ) ( ON ?auto_423047 ?auto_423048 ) ( CLEAR ?auto_423045 ) ( ON ?auto_423046 ?auto_423047 ) ( CLEAR ?auto_423046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_423044 ?auto_423045 ?auto_423046 )
      ( MAKE-15PILE ?auto_423044 ?auto_423045 ?auto_423046 ?auto_423047 ?auto_423048 ?auto_423049 ?auto_423050 ?auto_423051 ?auto_423052 ?auto_423053 ?auto_423054 ?auto_423055 ?auto_423056 ?auto_423057 ?auto_423058 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_423074 - BLOCK
      ?auto_423075 - BLOCK
      ?auto_423076 - BLOCK
      ?auto_423077 - BLOCK
      ?auto_423078 - BLOCK
      ?auto_423079 - BLOCK
      ?auto_423080 - BLOCK
      ?auto_423081 - BLOCK
      ?auto_423082 - BLOCK
      ?auto_423083 - BLOCK
      ?auto_423084 - BLOCK
      ?auto_423085 - BLOCK
      ?auto_423086 - BLOCK
      ?auto_423087 - BLOCK
      ?auto_423088 - BLOCK
    )
    :vars
    (
      ?auto_423089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423088 ?auto_423089 ) ( ON-TABLE ?auto_423074 ) ( not ( = ?auto_423074 ?auto_423075 ) ) ( not ( = ?auto_423074 ?auto_423076 ) ) ( not ( = ?auto_423074 ?auto_423077 ) ) ( not ( = ?auto_423074 ?auto_423078 ) ) ( not ( = ?auto_423074 ?auto_423079 ) ) ( not ( = ?auto_423074 ?auto_423080 ) ) ( not ( = ?auto_423074 ?auto_423081 ) ) ( not ( = ?auto_423074 ?auto_423082 ) ) ( not ( = ?auto_423074 ?auto_423083 ) ) ( not ( = ?auto_423074 ?auto_423084 ) ) ( not ( = ?auto_423074 ?auto_423085 ) ) ( not ( = ?auto_423074 ?auto_423086 ) ) ( not ( = ?auto_423074 ?auto_423087 ) ) ( not ( = ?auto_423074 ?auto_423088 ) ) ( not ( = ?auto_423074 ?auto_423089 ) ) ( not ( = ?auto_423075 ?auto_423076 ) ) ( not ( = ?auto_423075 ?auto_423077 ) ) ( not ( = ?auto_423075 ?auto_423078 ) ) ( not ( = ?auto_423075 ?auto_423079 ) ) ( not ( = ?auto_423075 ?auto_423080 ) ) ( not ( = ?auto_423075 ?auto_423081 ) ) ( not ( = ?auto_423075 ?auto_423082 ) ) ( not ( = ?auto_423075 ?auto_423083 ) ) ( not ( = ?auto_423075 ?auto_423084 ) ) ( not ( = ?auto_423075 ?auto_423085 ) ) ( not ( = ?auto_423075 ?auto_423086 ) ) ( not ( = ?auto_423075 ?auto_423087 ) ) ( not ( = ?auto_423075 ?auto_423088 ) ) ( not ( = ?auto_423075 ?auto_423089 ) ) ( not ( = ?auto_423076 ?auto_423077 ) ) ( not ( = ?auto_423076 ?auto_423078 ) ) ( not ( = ?auto_423076 ?auto_423079 ) ) ( not ( = ?auto_423076 ?auto_423080 ) ) ( not ( = ?auto_423076 ?auto_423081 ) ) ( not ( = ?auto_423076 ?auto_423082 ) ) ( not ( = ?auto_423076 ?auto_423083 ) ) ( not ( = ?auto_423076 ?auto_423084 ) ) ( not ( = ?auto_423076 ?auto_423085 ) ) ( not ( = ?auto_423076 ?auto_423086 ) ) ( not ( = ?auto_423076 ?auto_423087 ) ) ( not ( = ?auto_423076 ?auto_423088 ) ) ( not ( = ?auto_423076 ?auto_423089 ) ) ( not ( = ?auto_423077 ?auto_423078 ) ) ( not ( = ?auto_423077 ?auto_423079 ) ) ( not ( = ?auto_423077 ?auto_423080 ) ) ( not ( = ?auto_423077 ?auto_423081 ) ) ( not ( = ?auto_423077 ?auto_423082 ) ) ( not ( = ?auto_423077 ?auto_423083 ) ) ( not ( = ?auto_423077 ?auto_423084 ) ) ( not ( = ?auto_423077 ?auto_423085 ) ) ( not ( = ?auto_423077 ?auto_423086 ) ) ( not ( = ?auto_423077 ?auto_423087 ) ) ( not ( = ?auto_423077 ?auto_423088 ) ) ( not ( = ?auto_423077 ?auto_423089 ) ) ( not ( = ?auto_423078 ?auto_423079 ) ) ( not ( = ?auto_423078 ?auto_423080 ) ) ( not ( = ?auto_423078 ?auto_423081 ) ) ( not ( = ?auto_423078 ?auto_423082 ) ) ( not ( = ?auto_423078 ?auto_423083 ) ) ( not ( = ?auto_423078 ?auto_423084 ) ) ( not ( = ?auto_423078 ?auto_423085 ) ) ( not ( = ?auto_423078 ?auto_423086 ) ) ( not ( = ?auto_423078 ?auto_423087 ) ) ( not ( = ?auto_423078 ?auto_423088 ) ) ( not ( = ?auto_423078 ?auto_423089 ) ) ( not ( = ?auto_423079 ?auto_423080 ) ) ( not ( = ?auto_423079 ?auto_423081 ) ) ( not ( = ?auto_423079 ?auto_423082 ) ) ( not ( = ?auto_423079 ?auto_423083 ) ) ( not ( = ?auto_423079 ?auto_423084 ) ) ( not ( = ?auto_423079 ?auto_423085 ) ) ( not ( = ?auto_423079 ?auto_423086 ) ) ( not ( = ?auto_423079 ?auto_423087 ) ) ( not ( = ?auto_423079 ?auto_423088 ) ) ( not ( = ?auto_423079 ?auto_423089 ) ) ( not ( = ?auto_423080 ?auto_423081 ) ) ( not ( = ?auto_423080 ?auto_423082 ) ) ( not ( = ?auto_423080 ?auto_423083 ) ) ( not ( = ?auto_423080 ?auto_423084 ) ) ( not ( = ?auto_423080 ?auto_423085 ) ) ( not ( = ?auto_423080 ?auto_423086 ) ) ( not ( = ?auto_423080 ?auto_423087 ) ) ( not ( = ?auto_423080 ?auto_423088 ) ) ( not ( = ?auto_423080 ?auto_423089 ) ) ( not ( = ?auto_423081 ?auto_423082 ) ) ( not ( = ?auto_423081 ?auto_423083 ) ) ( not ( = ?auto_423081 ?auto_423084 ) ) ( not ( = ?auto_423081 ?auto_423085 ) ) ( not ( = ?auto_423081 ?auto_423086 ) ) ( not ( = ?auto_423081 ?auto_423087 ) ) ( not ( = ?auto_423081 ?auto_423088 ) ) ( not ( = ?auto_423081 ?auto_423089 ) ) ( not ( = ?auto_423082 ?auto_423083 ) ) ( not ( = ?auto_423082 ?auto_423084 ) ) ( not ( = ?auto_423082 ?auto_423085 ) ) ( not ( = ?auto_423082 ?auto_423086 ) ) ( not ( = ?auto_423082 ?auto_423087 ) ) ( not ( = ?auto_423082 ?auto_423088 ) ) ( not ( = ?auto_423082 ?auto_423089 ) ) ( not ( = ?auto_423083 ?auto_423084 ) ) ( not ( = ?auto_423083 ?auto_423085 ) ) ( not ( = ?auto_423083 ?auto_423086 ) ) ( not ( = ?auto_423083 ?auto_423087 ) ) ( not ( = ?auto_423083 ?auto_423088 ) ) ( not ( = ?auto_423083 ?auto_423089 ) ) ( not ( = ?auto_423084 ?auto_423085 ) ) ( not ( = ?auto_423084 ?auto_423086 ) ) ( not ( = ?auto_423084 ?auto_423087 ) ) ( not ( = ?auto_423084 ?auto_423088 ) ) ( not ( = ?auto_423084 ?auto_423089 ) ) ( not ( = ?auto_423085 ?auto_423086 ) ) ( not ( = ?auto_423085 ?auto_423087 ) ) ( not ( = ?auto_423085 ?auto_423088 ) ) ( not ( = ?auto_423085 ?auto_423089 ) ) ( not ( = ?auto_423086 ?auto_423087 ) ) ( not ( = ?auto_423086 ?auto_423088 ) ) ( not ( = ?auto_423086 ?auto_423089 ) ) ( not ( = ?auto_423087 ?auto_423088 ) ) ( not ( = ?auto_423087 ?auto_423089 ) ) ( not ( = ?auto_423088 ?auto_423089 ) ) ( ON ?auto_423087 ?auto_423088 ) ( ON ?auto_423086 ?auto_423087 ) ( ON ?auto_423085 ?auto_423086 ) ( ON ?auto_423084 ?auto_423085 ) ( ON ?auto_423083 ?auto_423084 ) ( ON ?auto_423082 ?auto_423083 ) ( ON ?auto_423081 ?auto_423082 ) ( ON ?auto_423080 ?auto_423081 ) ( ON ?auto_423079 ?auto_423080 ) ( ON ?auto_423078 ?auto_423079 ) ( ON ?auto_423077 ?auto_423078 ) ( ON ?auto_423076 ?auto_423077 ) ( CLEAR ?auto_423074 ) ( ON ?auto_423075 ?auto_423076 ) ( CLEAR ?auto_423075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423074 ?auto_423075 )
      ( MAKE-15PILE ?auto_423074 ?auto_423075 ?auto_423076 ?auto_423077 ?auto_423078 ?auto_423079 ?auto_423080 ?auto_423081 ?auto_423082 ?auto_423083 ?auto_423084 ?auto_423085 ?auto_423086 ?auto_423087 ?auto_423088 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_423105 - BLOCK
      ?auto_423106 - BLOCK
      ?auto_423107 - BLOCK
      ?auto_423108 - BLOCK
      ?auto_423109 - BLOCK
      ?auto_423110 - BLOCK
      ?auto_423111 - BLOCK
      ?auto_423112 - BLOCK
      ?auto_423113 - BLOCK
      ?auto_423114 - BLOCK
      ?auto_423115 - BLOCK
      ?auto_423116 - BLOCK
      ?auto_423117 - BLOCK
      ?auto_423118 - BLOCK
      ?auto_423119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_423119 ) ( ON-TABLE ?auto_423105 ) ( not ( = ?auto_423105 ?auto_423106 ) ) ( not ( = ?auto_423105 ?auto_423107 ) ) ( not ( = ?auto_423105 ?auto_423108 ) ) ( not ( = ?auto_423105 ?auto_423109 ) ) ( not ( = ?auto_423105 ?auto_423110 ) ) ( not ( = ?auto_423105 ?auto_423111 ) ) ( not ( = ?auto_423105 ?auto_423112 ) ) ( not ( = ?auto_423105 ?auto_423113 ) ) ( not ( = ?auto_423105 ?auto_423114 ) ) ( not ( = ?auto_423105 ?auto_423115 ) ) ( not ( = ?auto_423105 ?auto_423116 ) ) ( not ( = ?auto_423105 ?auto_423117 ) ) ( not ( = ?auto_423105 ?auto_423118 ) ) ( not ( = ?auto_423105 ?auto_423119 ) ) ( not ( = ?auto_423106 ?auto_423107 ) ) ( not ( = ?auto_423106 ?auto_423108 ) ) ( not ( = ?auto_423106 ?auto_423109 ) ) ( not ( = ?auto_423106 ?auto_423110 ) ) ( not ( = ?auto_423106 ?auto_423111 ) ) ( not ( = ?auto_423106 ?auto_423112 ) ) ( not ( = ?auto_423106 ?auto_423113 ) ) ( not ( = ?auto_423106 ?auto_423114 ) ) ( not ( = ?auto_423106 ?auto_423115 ) ) ( not ( = ?auto_423106 ?auto_423116 ) ) ( not ( = ?auto_423106 ?auto_423117 ) ) ( not ( = ?auto_423106 ?auto_423118 ) ) ( not ( = ?auto_423106 ?auto_423119 ) ) ( not ( = ?auto_423107 ?auto_423108 ) ) ( not ( = ?auto_423107 ?auto_423109 ) ) ( not ( = ?auto_423107 ?auto_423110 ) ) ( not ( = ?auto_423107 ?auto_423111 ) ) ( not ( = ?auto_423107 ?auto_423112 ) ) ( not ( = ?auto_423107 ?auto_423113 ) ) ( not ( = ?auto_423107 ?auto_423114 ) ) ( not ( = ?auto_423107 ?auto_423115 ) ) ( not ( = ?auto_423107 ?auto_423116 ) ) ( not ( = ?auto_423107 ?auto_423117 ) ) ( not ( = ?auto_423107 ?auto_423118 ) ) ( not ( = ?auto_423107 ?auto_423119 ) ) ( not ( = ?auto_423108 ?auto_423109 ) ) ( not ( = ?auto_423108 ?auto_423110 ) ) ( not ( = ?auto_423108 ?auto_423111 ) ) ( not ( = ?auto_423108 ?auto_423112 ) ) ( not ( = ?auto_423108 ?auto_423113 ) ) ( not ( = ?auto_423108 ?auto_423114 ) ) ( not ( = ?auto_423108 ?auto_423115 ) ) ( not ( = ?auto_423108 ?auto_423116 ) ) ( not ( = ?auto_423108 ?auto_423117 ) ) ( not ( = ?auto_423108 ?auto_423118 ) ) ( not ( = ?auto_423108 ?auto_423119 ) ) ( not ( = ?auto_423109 ?auto_423110 ) ) ( not ( = ?auto_423109 ?auto_423111 ) ) ( not ( = ?auto_423109 ?auto_423112 ) ) ( not ( = ?auto_423109 ?auto_423113 ) ) ( not ( = ?auto_423109 ?auto_423114 ) ) ( not ( = ?auto_423109 ?auto_423115 ) ) ( not ( = ?auto_423109 ?auto_423116 ) ) ( not ( = ?auto_423109 ?auto_423117 ) ) ( not ( = ?auto_423109 ?auto_423118 ) ) ( not ( = ?auto_423109 ?auto_423119 ) ) ( not ( = ?auto_423110 ?auto_423111 ) ) ( not ( = ?auto_423110 ?auto_423112 ) ) ( not ( = ?auto_423110 ?auto_423113 ) ) ( not ( = ?auto_423110 ?auto_423114 ) ) ( not ( = ?auto_423110 ?auto_423115 ) ) ( not ( = ?auto_423110 ?auto_423116 ) ) ( not ( = ?auto_423110 ?auto_423117 ) ) ( not ( = ?auto_423110 ?auto_423118 ) ) ( not ( = ?auto_423110 ?auto_423119 ) ) ( not ( = ?auto_423111 ?auto_423112 ) ) ( not ( = ?auto_423111 ?auto_423113 ) ) ( not ( = ?auto_423111 ?auto_423114 ) ) ( not ( = ?auto_423111 ?auto_423115 ) ) ( not ( = ?auto_423111 ?auto_423116 ) ) ( not ( = ?auto_423111 ?auto_423117 ) ) ( not ( = ?auto_423111 ?auto_423118 ) ) ( not ( = ?auto_423111 ?auto_423119 ) ) ( not ( = ?auto_423112 ?auto_423113 ) ) ( not ( = ?auto_423112 ?auto_423114 ) ) ( not ( = ?auto_423112 ?auto_423115 ) ) ( not ( = ?auto_423112 ?auto_423116 ) ) ( not ( = ?auto_423112 ?auto_423117 ) ) ( not ( = ?auto_423112 ?auto_423118 ) ) ( not ( = ?auto_423112 ?auto_423119 ) ) ( not ( = ?auto_423113 ?auto_423114 ) ) ( not ( = ?auto_423113 ?auto_423115 ) ) ( not ( = ?auto_423113 ?auto_423116 ) ) ( not ( = ?auto_423113 ?auto_423117 ) ) ( not ( = ?auto_423113 ?auto_423118 ) ) ( not ( = ?auto_423113 ?auto_423119 ) ) ( not ( = ?auto_423114 ?auto_423115 ) ) ( not ( = ?auto_423114 ?auto_423116 ) ) ( not ( = ?auto_423114 ?auto_423117 ) ) ( not ( = ?auto_423114 ?auto_423118 ) ) ( not ( = ?auto_423114 ?auto_423119 ) ) ( not ( = ?auto_423115 ?auto_423116 ) ) ( not ( = ?auto_423115 ?auto_423117 ) ) ( not ( = ?auto_423115 ?auto_423118 ) ) ( not ( = ?auto_423115 ?auto_423119 ) ) ( not ( = ?auto_423116 ?auto_423117 ) ) ( not ( = ?auto_423116 ?auto_423118 ) ) ( not ( = ?auto_423116 ?auto_423119 ) ) ( not ( = ?auto_423117 ?auto_423118 ) ) ( not ( = ?auto_423117 ?auto_423119 ) ) ( not ( = ?auto_423118 ?auto_423119 ) ) ( ON ?auto_423118 ?auto_423119 ) ( ON ?auto_423117 ?auto_423118 ) ( ON ?auto_423116 ?auto_423117 ) ( ON ?auto_423115 ?auto_423116 ) ( ON ?auto_423114 ?auto_423115 ) ( ON ?auto_423113 ?auto_423114 ) ( ON ?auto_423112 ?auto_423113 ) ( ON ?auto_423111 ?auto_423112 ) ( ON ?auto_423110 ?auto_423111 ) ( ON ?auto_423109 ?auto_423110 ) ( ON ?auto_423108 ?auto_423109 ) ( ON ?auto_423107 ?auto_423108 ) ( CLEAR ?auto_423105 ) ( ON ?auto_423106 ?auto_423107 ) ( CLEAR ?auto_423106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_423105 ?auto_423106 )
      ( MAKE-15PILE ?auto_423105 ?auto_423106 ?auto_423107 ?auto_423108 ?auto_423109 ?auto_423110 ?auto_423111 ?auto_423112 ?auto_423113 ?auto_423114 ?auto_423115 ?auto_423116 ?auto_423117 ?auto_423118 ?auto_423119 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_423135 - BLOCK
      ?auto_423136 - BLOCK
      ?auto_423137 - BLOCK
      ?auto_423138 - BLOCK
      ?auto_423139 - BLOCK
      ?auto_423140 - BLOCK
      ?auto_423141 - BLOCK
      ?auto_423142 - BLOCK
      ?auto_423143 - BLOCK
      ?auto_423144 - BLOCK
      ?auto_423145 - BLOCK
      ?auto_423146 - BLOCK
      ?auto_423147 - BLOCK
      ?auto_423148 - BLOCK
      ?auto_423149 - BLOCK
    )
    :vars
    (
      ?auto_423150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_423149 ?auto_423150 ) ( not ( = ?auto_423135 ?auto_423136 ) ) ( not ( = ?auto_423135 ?auto_423137 ) ) ( not ( = ?auto_423135 ?auto_423138 ) ) ( not ( = ?auto_423135 ?auto_423139 ) ) ( not ( = ?auto_423135 ?auto_423140 ) ) ( not ( = ?auto_423135 ?auto_423141 ) ) ( not ( = ?auto_423135 ?auto_423142 ) ) ( not ( = ?auto_423135 ?auto_423143 ) ) ( not ( = ?auto_423135 ?auto_423144 ) ) ( not ( = ?auto_423135 ?auto_423145 ) ) ( not ( = ?auto_423135 ?auto_423146 ) ) ( not ( = ?auto_423135 ?auto_423147 ) ) ( not ( = ?auto_423135 ?auto_423148 ) ) ( not ( = ?auto_423135 ?auto_423149 ) ) ( not ( = ?auto_423135 ?auto_423150 ) ) ( not ( = ?auto_423136 ?auto_423137 ) ) ( not ( = ?auto_423136 ?auto_423138 ) ) ( not ( = ?auto_423136 ?auto_423139 ) ) ( not ( = ?auto_423136 ?auto_423140 ) ) ( not ( = ?auto_423136 ?auto_423141 ) ) ( not ( = ?auto_423136 ?auto_423142 ) ) ( not ( = ?auto_423136 ?auto_423143 ) ) ( not ( = ?auto_423136 ?auto_423144 ) ) ( not ( = ?auto_423136 ?auto_423145 ) ) ( not ( = ?auto_423136 ?auto_423146 ) ) ( not ( = ?auto_423136 ?auto_423147 ) ) ( not ( = ?auto_423136 ?auto_423148 ) ) ( not ( = ?auto_423136 ?auto_423149 ) ) ( not ( = ?auto_423136 ?auto_423150 ) ) ( not ( = ?auto_423137 ?auto_423138 ) ) ( not ( = ?auto_423137 ?auto_423139 ) ) ( not ( = ?auto_423137 ?auto_423140 ) ) ( not ( = ?auto_423137 ?auto_423141 ) ) ( not ( = ?auto_423137 ?auto_423142 ) ) ( not ( = ?auto_423137 ?auto_423143 ) ) ( not ( = ?auto_423137 ?auto_423144 ) ) ( not ( = ?auto_423137 ?auto_423145 ) ) ( not ( = ?auto_423137 ?auto_423146 ) ) ( not ( = ?auto_423137 ?auto_423147 ) ) ( not ( = ?auto_423137 ?auto_423148 ) ) ( not ( = ?auto_423137 ?auto_423149 ) ) ( not ( = ?auto_423137 ?auto_423150 ) ) ( not ( = ?auto_423138 ?auto_423139 ) ) ( not ( = ?auto_423138 ?auto_423140 ) ) ( not ( = ?auto_423138 ?auto_423141 ) ) ( not ( = ?auto_423138 ?auto_423142 ) ) ( not ( = ?auto_423138 ?auto_423143 ) ) ( not ( = ?auto_423138 ?auto_423144 ) ) ( not ( = ?auto_423138 ?auto_423145 ) ) ( not ( = ?auto_423138 ?auto_423146 ) ) ( not ( = ?auto_423138 ?auto_423147 ) ) ( not ( = ?auto_423138 ?auto_423148 ) ) ( not ( = ?auto_423138 ?auto_423149 ) ) ( not ( = ?auto_423138 ?auto_423150 ) ) ( not ( = ?auto_423139 ?auto_423140 ) ) ( not ( = ?auto_423139 ?auto_423141 ) ) ( not ( = ?auto_423139 ?auto_423142 ) ) ( not ( = ?auto_423139 ?auto_423143 ) ) ( not ( = ?auto_423139 ?auto_423144 ) ) ( not ( = ?auto_423139 ?auto_423145 ) ) ( not ( = ?auto_423139 ?auto_423146 ) ) ( not ( = ?auto_423139 ?auto_423147 ) ) ( not ( = ?auto_423139 ?auto_423148 ) ) ( not ( = ?auto_423139 ?auto_423149 ) ) ( not ( = ?auto_423139 ?auto_423150 ) ) ( not ( = ?auto_423140 ?auto_423141 ) ) ( not ( = ?auto_423140 ?auto_423142 ) ) ( not ( = ?auto_423140 ?auto_423143 ) ) ( not ( = ?auto_423140 ?auto_423144 ) ) ( not ( = ?auto_423140 ?auto_423145 ) ) ( not ( = ?auto_423140 ?auto_423146 ) ) ( not ( = ?auto_423140 ?auto_423147 ) ) ( not ( = ?auto_423140 ?auto_423148 ) ) ( not ( = ?auto_423140 ?auto_423149 ) ) ( not ( = ?auto_423140 ?auto_423150 ) ) ( not ( = ?auto_423141 ?auto_423142 ) ) ( not ( = ?auto_423141 ?auto_423143 ) ) ( not ( = ?auto_423141 ?auto_423144 ) ) ( not ( = ?auto_423141 ?auto_423145 ) ) ( not ( = ?auto_423141 ?auto_423146 ) ) ( not ( = ?auto_423141 ?auto_423147 ) ) ( not ( = ?auto_423141 ?auto_423148 ) ) ( not ( = ?auto_423141 ?auto_423149 ) ) ( not ( = ?auto_423141 ?auto_423150 ) ) ( not ( = ?auto_423142 ?auto_423143 ) ) ( not ( = ?auto_423142 ?auto_423144 ) ) ( not ( = ?auto_423142 ?auto_423145 ) ) ( not ( = ?auto_423142 ?auto_423146 ) ) ( not ( = ?auto_423142 ?auto_423147 ) ) ( not ( = ?auto_423142 ?auto_423148 ) ) ( not ( = ?auto_423142 ?auto_423149 ) ) ( not ( = ?auto_423142 ?auto_423150 ) ) ( not ( = ?auto_423143 ?auto_423144 ) ) ( not ( = ?auto_423143 ?auto_423145 ) ) ( not ( = ?auto_423143 ?auto_423146 ) ) ( not ( = ?auto_423143 ?auto_423147 ) ) ( not ( = ?auto_423143 ?auto_423148 ) ) ( not ( = ?auto_423143 ?auto_423149 ) ) ( not ( = ?auto_423143 ?auto_423150 ) ) ( not ( = ?auto_423144 ?auto_423145 ) ) ( not ( = ?auto_423144 ?auto_423146 ) ) ( not ( = ?auto_423144 ?auto_423147 ) ) ( not ( = ?auto_423144 ?auto_423148 ) ) ( not ( = ?auto_423144 ?auto_423149 ) ) ( not ( = ?auto_423144 ?auto_423150 ) ) ( not ( = ?auto_423145 ?auto_423146 ) ) ( not ( = ?auto_423145 ?auto_423147 ) ) ( not ( = ?auto_423145 ?auto_423148 ) ) ( not ( = ?auto_423145 ?auto_423149 ) ) ( not ( = ?auto_423145 ?auto_423150 ) ) ( not ( = ?auto_423146 ?auto_423147 ) ) ( not ( = ?auto_423146 ?auto_423148 ) ) ( not ( = ?auto_423146 ?auto_423149 ) ) ( not ( = ?auto_423146 ?auto_423150 ) ) ( not ( = ?auto_423147 ?auto_423148 ) ) ( not ( = ?auto_423147 ?auto_423149 ) ) ( not ( = ?auto_423147 ?auto_423150 ) ) ( not ( = ?auto_423148 ?auto_423149 ) ) ( not ( = ?auto_423148 ?auto_423150 ) ) ( not ( = ?auto_423149 ?auto_423150 ) ) ( ON ?auto_423148 ?auto_423149 ) ( ON ?auto_423147 ?auto_423148 ) ( ON ?auto_423146 ?auto_423147 ) ( ON ?auto_423145 ?auto_423146 ) ( ON ?auto_423144 ?auto_423145 ) ( ON ?auto_423143 ?auto_423144 ) ( ON ?auto_423142 ?auto_423143 ) ( ON ?auto_423141 ?auto_423142 ) ( ON ?auto_423140 ?auto_423141 ) ( ON ?auto_423139 ?auto_423140 ) ( ON ?auto_423138 ?auto_423139 ) ( ON ?auto_423137 ?auto_423138 ) ( ON ?auto_423136 ?auto_423137 ) ( ON ?auto_423135 ?auto_423136 ) ( CLEAR ?auto_423135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423135 )
      ( MAKE-15PILE ?auto_423135 ?auto_423136 ?auto_423137 ?auto_423138 ?auto_423139 ?auto_423140 ?auto_423141 ?auto_423142 ?auto_423143 ?auto_423144 ?auto_423145 ?auto_423146 ?auto_423147 ?auto_423148 ?auto_423149 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_423166 - BLOCK
      ?auto_423167 - BLOCK
      ?auto_423168 - BLOCK
      ?auto_423169 - BLOCK
      ?auto_423170 - BLOCK
      ?auto_423171 - BLOCK
      ?auto_423172 - BLOCK
      ?auto_423173 - BLOCK
      ?auto_423174 - BLOCK
      ?auto_423175 - BLOCK
      ?auto_423176 - BLOCK
      ?auto_423177 - BLOCK
      ?auto_423178 - BLOCK
      ?auto_423179 - BLOCK
      ?auto_423180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_423180 ) ( not ( = ?auto_423166 ?auto_423167 ) ) ( not ( = ?auto_423166 ?auto_423168 ) ) ( not ( = ?auto_423166 ?auto_423169 ) ) ( not ( = ?auto_423166 ?auto_423170 ) ) ( not ( = ?auto_423166 ?auto_423171 ) ) ( not ( = ?auto_423166 ?auto_423172 ) ) ( not ( = ?auto_423166 ?auto_423173 ) ) ( not ( = ?auto_423166 ?auto_423174 ) ) ( not ( = ?auto_423166 ?auto_423175 ) ) ( not ( = ?auto_423166 ?auto_423176 ) ) ( not ( = ?auto_423166 ?auto_423177 ) ) ( not ( = ?auto_423166 ?auto_423178 ) ) ( not ( = ?auto_423166 ?auto_423179 ) ) ( not ( = ?auto_423166 ?auto_423180 ) ) ( not ( = ?auto_423167 ?auto_423168 ) ) ( not ( = ?auto_423167 ?auto_423169 ) ) ( not ( = ?auto_423167 ?auto_423170 ) ) ( not ( = ?auto_423167 ?auto_423171 ) ) ( not ( = ?auto_423167 ?auto_423172 ) ) ( not ( = ?auto_423167 ?auto_423173 ) ) ( not ( = ?auto_423167 ?auto_423174 ) ) ( not ( = ?auto_423167 ?auto_423175 ) ) ( not ( = ?auto_423167 ?auto_423176 ) ) ( not ( = ?auto_423167 ?auto_423177 ) ) ( not ( = ?auto_423167 ?auto_423178 ) ) ( not ( = ?auto_423167 ?auto_423179 ) ) ( not ( = ?auto_423167 ?auto_423180 ) ) ( not ( = ?auto_423168 ?auto_423169 ) ) ( not ( = ?auto_423168 ?auto_423170 ) ) ( not ( = ?auto_423168 ?auto_423171 ) ) ( not ( = ?auto_423168 ?auto_423172 ) ) ( not ( = ?auto_423168 ?auto_423173 ) ) ( not ( = ?auto_423168 ?auto_423174 ) ) ( not ( = ?auto_423168 ?auto_423175 ) ) ( not ( = ?auto_423168 ?auto_423176 ) ) ( not ( = ?auto_423168 ?auto_423177 ) ) ( not ( = ?auto_423168 ?auto_423178 ) ) ( not ( = ?auto_423168 ?auto_423179 ) ) ( not ( = ?auto_423168 ?auto_423180 ) ) ( not ( = ?auto_423169 ?auto_423170 ) ) ( not ( = ?auto_423169 ?auto_423171 ) ) ( not ( = ?auto_423169 ?auto_423172 ) ) ( not ( = ?auto_423169 ?auto_423173 ) ) ( not ( = ?auto_423169 ?auto_423174 ) ) ( not ( = ?auto_423169 ?auto_423175 ) ) ( not ( = ?auto_423169 ?auto_423176 ) ) ( not ( = ?auto_423169 ?auto_423177 ) ) ( not ( = ?auto_423169 ?auto_423178 ) ) ( not ( = ?auto_423169 ?auto_423179 ) ) ( not ( = ?auto_423169 ?auto_423180 ) ) ( not ( = ?auto_423170 ?auto_423171 ) ) ( not ( = ?auto_423170 ?auto_423172 ) ) ( not ( = ?auto_423170 ?auto_423173 ) ) ( not ( = ?auto_423170 ?auto_423174 ) ) ( not ( = ?auto_423170 ?auto_423175 ) ) ( not ( = ?auto_423170 ?auto_423176 ) ) ( not ( = ?auto_423170 ?auto_423177 ) ) ( not ( = ?auto_423170 ?auto_423178 ) ) ( not ( = ?auto_423170 ?auto_423179 ) ) ( not ( = ?auto_423170 ?auto_423180 ) ) ( not ( = ?auto_423171 ?auto_423172 ) ) ( not ( = ?auto_423171 ?auto_423173 ) ) ( not ( = ?auto_423171 ?auto_423174 ) ) ( not ( = ?auto_423171 ?auto_423175 ) ) ( not ( = ?auto_423171 ?auto_423176 ) ) ( not ( = ?auto_423171 ?auto_423177 ) ) ( not ( = ?auto_423171 ?auto_423178 ) ) ( not ( = ?auto_423171 ?auto_423179 ) ) ( not ( = ?auto_423171 ?auto_423180 ) ) ( not ( = ?auto_423172 ?auto_423173 ) ) ( not ( = ?auto_423172 ?auto_423174 ) ) ( not ( = ?auto_423172 ?auto_423175 ) ) ( not ( = ?auto_423172 ?auto_423176 ) ) ( not ( = ?auto_423172 ?auto_423177 ) ) ( not ( = ?auto_423172 ?auto_423178 ) ) ( not ( = ?auto_423172 ?auto_423179 ) ) ( not ( = ?auto_423172 ?auto_423180 ) ) ( not ( = ?auto_423173 ?auto_423174 ) ) ( not ( = ?auto_423173 ?auto_423175 ) ) ( not ( = ?auto_423173 ?auto_423176 ) ) ( not ( = ?auto_423173 ?auto_423177 ) ) ( not ( = ?auto_423173 ?auto_423178 ) ) ( not ( = ?auto_423173 ?auto_423179 ) ) ( not ( = ?auto_423173 ?auto_423180 ) ) ( not ( = ?auto_423174 ?auto_423175 ) ) ( not ( = ?auto_423174 ?auto_423176 ) ) ( not ( = ?auto_423174 ?auto_423177 ) ) ( not ( = ?auto_423174 ?auto_423178 ) ) ( not ( = ?auto_423174 ?auto_423179 ) ) ( not ( = ?auto_423174 ?auto_423180 ) ) ( not ( = ?auto_423175 ?auto_423176 ) ) ( not ( = ?auto_423175 ?auto_423177 ) ) ( not ( = ?auto_423175 ?auto_423178 ) ) ( not ( = ?auto_423175 ?auto_423179 ) ) ( not ( = ?auto_423175 ?auto_423180 ) ) ( not ( = ?auto_423176 ?auto_423177 ) ) ( not ( = ?auto_423176 ?auto_423178 ) ) ( not ( = ?auto_423176 ?auto_423179 ) ) ( not ( = ?auto_423176 ?auto_423180 ) ) ( not ( = ?auto_423177 ?auto_423178 ) ) ( not ( = ?auto_423177 ?auto_423179 ) ) ( not ( = ?auto_423177 ?auto_423180 ) ) ( not ( = ?auto_423178 ?auto_423179 ) ) ( not ( = ?auto_423178 ?auto_423180 ) ) ( not ( = ?auto_423179 ?auto_423180 ) ) ( ON ?auto_423179 ?auto_423180 ) ( ON ?auto_423178 ?auto_423179 ) ( ON ?auto_423177 ?auto_423178 ) ( ON ?auto_423176 ?auto_423177 ) ( ON ?auto_423175 ?auto_423176 ) ( ON ?auto_423174 ?auto_423175 ) ( ON ?auto_423173 ?auto_423174 ) ( ON ?auto_423172 ?auto_423173 ) ( ON ?auto_423171 ?auto_423172 ) ( ON ?auto_423170 ?auto_423171 ) ( ON ?auto_423169 ?auto_423170 ) ( ON ?auto_423168 ?auto_423169 ) ( ON ?auto_423167 ?auto_423168 ) ( ON ?auto_423166 ?auto_423167 ) ( CLEAR ?auto_423166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_423166 )
      ( MAKE-15PILE ?auto_423166 ?auto_423167 ?auto_423168 ?auto_423169 ?auto_423170 ?auto_423171 ?auto_423172 ?auto_423173 ?auto_423174 ?auto_423175 ?auto_423176 ?auto_423177 ?auto_423178 ?auto_423179 ?auto_423180 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_423196 - BLOCK
      ?auto_423197 - BLOCK
      ?auto_423198 - BLOCK
      ?auto_423199 - BLOCK
      ?auto_423200 - BLOCK
      ?auto_423201 - BLOCK
      ?auto_423202 - BLOCK
      ?auto_423203 - BLOCK
      ?auto_423204 - BLOCK
      ?auto_423205 - BLOCK
      ?auto_423206 - BLOCK
      ?auto_423207 - BLOCK
      ?auto_423208 - BLOCK
      ?auto_423209 - BLOCK
      ?auto_423210 - BLOCK
    )
    :vars
    (
      ?auto_423211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_423196 ?auto_423197 ) ) ( not ( = ?auto_423196 ?auto_423198 ) ) ( not ( = ?auto_423196 ?auto_423199 ) ) ( not ( = ?auto_423196 ?auto_423200 ) ) ( not ( = ?auto_423196 ?auto_423201 ) ) ( not ( = ?auto_423196 ?auto_423202 ) ) ( not ( = ?auto_423196 ?auto_423203 ) ) ( not ( = ?auto_423196 ?auto_423204 ) ) ( not ( = ?auto_423196 ?auto_423205 ) ) ( not ( = ?auto_423196 ?auto_423206 ) ) ( not ( = ?auto_423196 ?auto_423207 ) ) ( not ( = ?auto_423196 ?auto_423208 ) ) ( not ( = ?auto_423196 ?auto_423209 ) ) ( not ( = ?auto_423196 ?auto_423210 ) ) ( not ( = ?auto_423197 ?auto_423198 ) ) ( not ( = ?auto_423197 ?auto_423199 ) ) ( not ( = ?auto_423197 ?auto_423200 ) ) ( not ( = ?auto_423197 ?auto_423201 ) ) ( not ( = ?auto_423197 ?auto_423202 ) ) ( not ( = ?auto_423197 ?auto_423203 ) ) ( not ( = ?auto_423197 ?auto_423204 ) ) ( not ( = ?auto_423197 ?auto_423205 ) ) ( not ( = ?auto_423197 ?auto_423206 ) ) ( not ( = ?auto_423197 ?auto_423207 ) ) ( not ( = ?auto_423197 ?auto_423208 ) ) ( not ( = ?auto_423197 ?auto_423209 ) ) ( not ( = ?auto_423197 ?auto_423210 ) ) ( not ( = ?auto_423198 ?auto_423199 ) ) ( not ( = ?auto_423198 ?auto_423200 ) ) ( not ( = ?auto_423198 ?auto_423201 ) ) ( not ( = ?auto_423198 ?auto_423202 ) ) ( not ( = ?auto_423198 ?auto_423203 ) ) ( not ( = ?auto_423198 ?auto_423204 ) ) ( not ( = ?auto_423198 ?auto_423205 ) ) ( not ( = ?auto_423198 ?auto_423206 ) ) ( not ( = ?auto_423198 ?auto_423207 ) ) ( not ( = ?auto_423198 ?auto_423208 ) ) ( not ( = ?auto_423198 ?auto_423209 ) ) ( not ( = ?auto_423198 ?auto_423210 ) ) ( not ( = ?auto_423199 ?auto_423200 ) ) ( not ( = ?auto_423199 ?auto_423201 ) ) ( not ( = ?auto_423199 ?auto_423202 ) ) ( not ( = ?auto_423199 ?auto_423203 ) ) ( not ( = ?auto_423199 ?auto_423204 ) ) ( not ( = ?auto_423199 ?auto_423205 ) ) ( not ( = ?auto_423199 ?auto_423206 ) ) ( not ( = ?auto_423199 ?auto_423207 ) ) ( not ( = ?auto_423199 ?auto_423208 ) ) ( not ( = ?auto_423199 ?auto_423209 ) ) ( not ( = ?auto_423199 ?auto_423210 ) ) ( not ( = ?auto_423200 ?auto_423201 ) ) ( not ( = ?auto_423200 ?auto_423202 ) ) ( not ( = ?auto_423200 ?auto_423203 ) ) ( not ( = ?auto_423200 ?auto_423204 ) ) ( not ( = ?auto_423200 ?auto_423205 ) ) ( not ( = ?auto_423200 ?auto_423206 ) ) ( not ( = ?auto_423200 ?auto_423207 ) ) ( not ( = ?auto_423200 ?auto_423208 ) ) ( not ( = ?auto_423200 ?auto_423209 ) ) ( not ( = ?auto_423200 ?auto_423210 ) ) ( not ( = ?auto_423201 ?auto_423202 ) ) ( not ( = ?auto_423201 ?auto_423203 ) ) ( not ( = ?auto_423201 ?auto_423204 ) ) ( not ( = ?auto_423201 ?auto_423205 ) ) ( not ( = ?auto_423201 ?auto_423206 ) ) ( not ( = ?auto_423201 ?auto_423207 ) ) ( not ( = ?auto_423201 ?auto_423208 ) ) ( not ( = ?auto_423201 ?auto_423209 ) ) ( not ( = ?auto_423201 ?auto_423210 ) ) ( not ( = ?auto_423202 ?auto_423203 ) ) ( not ( = ?auto_423202 ?auto_423204 ) ) ( not ( = ?auto_423202 ?auto_423205 ) ) ( not ( = ?auto_423202 ?auto_423206 ) ) ( not ( = ?auto_423202 ?auto_423207 ) ) ( not ( = ?auto_423202 ?auto_423208 ) ) ( not ( = ?auto_423202 ?auto_423209 ) ) ( not ( = ?auto_423202 ?auto_423210 ) ) ( not ( = ?auto_423203 ?auto_423204 ) ) ( not ( = ?auto_423203 ?auto_423205 ) ) ( not ( = ?auto_423203 ?auto_423206 ) ) ( not ( = ?auto_423203 ?auto_423207 ) ) ( not ( = ?auto_423203 ?auto_423208 ) ) ( not ( = ?auto_423203 ?auto_423209 ) ) ( not ( = ?auto_423203 ?auto_423210 ) ) ( not ( = ?auto_423204 ?auto_423205 ) ) ( not ( = ?auto_423204 ?auto_423206 ) ) ( not ( = ?auto_423204 ?auto_423207 ) ) ( not ( = ?auto_423204 ?auto_423208 ) ) ( not ( = ?auto_423204 ?auto_423209 ) ) ( not ( = ?auto_423204 ?auto_423210 ) ) ( not ( = ?auto_423205 ?auto_423206 ) ) ( not ( = ?auto_423205 ?auto_423207 ) ) ( not ( = ?auto_423205 ?auto_423208 ) ) ( not ( = ?auto_423205 ?auto_423209 ) ) ( not ( = ?auto_423205 ?auto_423210 ) ) ( not ( = ?auto_423206 ?auto_423207 ) ) ( not ( = ?auto_423206 ?auto_423208 ) ) ( not ( = ?auto_423206 ?auto_423209 ) ) ( not ( = ?auto_423206 ?auto_423210 ) ) ( not ( = ?auto_423207 ?auto_423208 ) ) ( not ( = ?auto_423207 ?auto_423209 ) ) ( not ( = ?auto_423207 ?auto_423210 ) ) ( not ( = ?auto_423208 ?auto_423209 ) ) ( not ( = ?auto_423208 ?auto_423210 ) ) ( not ( = ?auto_423209 ?auto_423210 ) ) ( ON ?auto_423196 ?auto_423211 ) ( not ( = ?auto_423210 ?auto_423211 ) ) ( not ( = ?auto_423209 ?auto_423211 ) ) ( not ( = ?auto_423208 ?auto_423211 ) ) ( not ( = ?auto_423207 ?auto_423211 ) ) ( not ( = ?auto_423206 ?auto_423211 ) ) ( not ( = ?auto_423205 ?auto_423211 ) ) ( not ( = ?auto_423204 ?auto_423211 ) ) ( not ( = ?auto_423203 ?auto_423211 ) ) ( not ( = ?auto_423202 ?auto_423211 ) ) ( not ( = ?auto_423201 ?auto_423211 ) ) ( not ( = ?auto_423200 ?auto_423211 ) ) ( not ( = ?auto_423199 ?auto_423211 ) ) ( not ( = ?auto_423198 ?auto_423211 ) ) ( not ( = ?auto_423197 ?auto_423211 ) ) ( not ( = ?auto_423196 ?auto_423211 ) ) ( ON ?auto_423197 ?auto_423196 ) ( ON ?auto_423198 ?auto_423197 ) ( ON ?auto_423199 ?auto_423198 ) ( ON ?auto_423200 ?auto_423199 ) ( ON ?auto_423201 ?auto_423200 ) ( ON ?auto_423202 ?auto_423201 ) ( ON ?auto_423203 ?auto_423202 ) ( ON ?auto_423204 ?auto_423203 ) ( ON ?auto_423205 ?auto_423204 ) ( ON ?auto_423206 ?auto_423205 ) ( ON ?auto_423207 ?auto_423206 ) ( ON ?auto_423208 ?auto_423207 ) ( ON ?auto_423209 ?auto_423208 ) ( ON ?auto_423210 ?auto_423209 ) ( CLEAR ?auto_423210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_423210 ?auto_423209 ?auto_423208 ?auto_423207 ?auto_423206 ?auto_423205 ?auto_423204 ?auto_423203 ?auto_423202 ?auto_423201 ?auto_423200 ?auto_423199 ?auto_423198 ?auto_423197 ?auto_423196 )
      ( MAKE-15PILE ?auto_423196 ?auto_423197 ?auto_423198 ?auto_423199 ?auto_423200 ?auto_423201 ?auto_423202 ?auto_423203 ?auto_423204 ?auto_423205 ?auto_423206 ?auto_423207 ?auto_423208 ?auto_423209 ?auto_423210 ) )
  )

)

