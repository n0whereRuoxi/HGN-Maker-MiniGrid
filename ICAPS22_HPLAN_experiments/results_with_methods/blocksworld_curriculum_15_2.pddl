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
      ?auto_371053 - BLOCK
    )
    :vars
    (
      ?auto_371054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371053 ?auto_371054 ) ( CLEAR ?auto_371053 ) ( HAND-EMPTY ) ( not ( = ?auto_371053 ?auto_371054 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371053 ?auto_371054 )
      ( !PUTDOWN ?auto_371053 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_371056 - BLOCK
    )
    :vars
    (
      ?auto_371057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371056 ?auto_371057 ) ( CLEAR ?auto_371056 ) ( HAND-EMPTY ) ( not ( = ?auto_371056 ?auto_371057 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371056 ?auto_371057 )
      ( !PUTDOWN ?auto_371056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_371060 - BLOCK
      ?auto_371061 - BLOCK
    )
    :vars
    (
      ?auto_371062 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371060 ) ( ON ?auto_371061 ?auto_371062 ) ( CLEAR ?auto_371061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371060 ) ( not ( = ?auto_371060 ?auto_371061 ) ) ( not ( = ?auto_371060 ?auto_371062 ) ) ( not ( = ?auto_371061 ?auto_371062 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371061 ?auto_371062 )
      ( !STACK ?auto_371061 ?auto_371060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_371065 - BLOCK
      ?auto_371066 - BLOCK
    )
    :vars
    (
      ?auto_371067 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371065 ) ( ON ?auto_371066 ?auto_371067 ) ( CLEAR ?auto_371066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371065 ) ( not ( = ?auto_371065 ?auto_371066 ) ) ( not ( = ?auto_371065 ?auto_371067 ) ) ( not ( = ?auto_371066 ?auto_371067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371066 ?auto_371067 )
      ( !STACK ?auto_371066 ?auto_371065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_371070 - BLOCK
      ?auto_371071 - BLOCK
    )
    :vars
    (
      ?auto_371072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371071 ?auto_371072 ) ( not ( = ?auto_371070 ?auto_371071 ) ) ( not ( = ?auto_371070 ?auto_371072 ) ) ( not ( = ?auto_371071 ?auto_371072 ) ) ( ON ?auto_371070 ?auto_371071 ) ( CLEAR ?auto_371070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371070 )
      ( MAKE-2PILE ?auto_371070 ?auto_371071 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_371075 - BLOCK
      ?auto_371076 - BLOCK
    )
    :vars
    (
      ?auto_371077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371076 ?auto_371077 ) ( not ( = ?auto_371075 ?auto_371076 ) ) ( not ( = ?auto_371075 ?auto_371077 ) ) ( not ( = ?auto_371076 ?auto_371077 ) ) ( ON ?auto_371075 ?auto_371076 ) ( CLEAR ?auto_371075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371075 )
      ( MAKE-2PILE ?auto_371075 ?auto_371076 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_371081 - BLOCK
      ?auto_371082 - BLOCK
      ?auto_371083 - BLOCK
    )
    :vars
    (
      ?auto_371084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371082 ) ( ON ?auto_371083 ?auto_371084 ) ( CLEAR ?auto_371083 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371081 ) ( ON ?auto_371082 ?auto_371081 ) ( not ( = ?auto_371081 ?auto_371082 ) ) ( not ( = ?auto_371081 ?auto_371083 ) ) ( not ( = ?auto_371081 ?auto_371084 ) ) ( not ( = ?auto_371082 ?auto_371083 ) ) ( not ( = ?auto_371082 ?auto_371084 ) ) ( not ( = ?auto_371083 ?auto_371084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371083 ?auto_371084 )
      ( !STACK ?auto_371083 ?auto_371082 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_371088 - BLOCK
      ?auto_371089 - BLOCK
      ?auto_371090 - BLOCK
    )
    :vars
    (
      ?auto_371091 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371089 ) ( ON ?auto_371090 ?auto_371091 ) ( CLEAR ?auto_371090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371088 ) ( ON ?auto_371089 ?auto_371088 ) ( not ( = ?auto_371088 ?auto_371089 ) ) ( not ( = ?auto_371088 ?auto_371090 ) ) ( not ( = ?auto_371088 ?auto_371091 ) ) ( not ( = ?auto_371089 ?auto_371090 ) ) ( not ( = ?auto_371089 ?auto_371091 ) ) ( not ( = ?auto_371090 ?auto_371091 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371090 ?auto_371091 )
      ( !STACK ?auto_371090 ?auto_371089 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_371095 - BLOCK
      ?auto_371096 - BLOCK
      ?auto_371097 - BLOCK
    )
    :vars
    (
      ?auto_371098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371097 ?auto_371098 ) ( ON-TABLE ?auto_371095 ) ( not ( = ?auto_371095 ?auto_371096 ) ) ( not ( = ?auto_371095 ?auto_371097 ) ) ( not ( = ?auto_371095 ?auto_371098 ) ) ( not ( = ?auto_371096 ?auto_371097 ) ) ( not ( = ?auto_371096 ?auto_371098 ) ) ( not ( = ?auto_371097 ?auto_371098 ) ) ( CLEAR ?auto_371095 ) ( ON ?auto_371096 ?auto_371097 ) ( CLEAR ?auto_371096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371095 ?auto_371096 )
      ( MAKE-3PILE ?auto_371095 ?auto_371096 ?auto_371097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_371102 - BLOCK
      ?auto_371103 - BLOCK
      ?auto_371104 - BLOCK
    )
    :vars
    (
      ?auto_371105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371104 ?auto_371105 ) ( ON-TABLE ?auto_371102 ) ( not ( = ?auto_371102 ?auto_371103 ) ) ( not ( = ?auto_371102 ?auto_371104 ) ) ( not ( = ?auto_371102 ?auto_371105 ) ) ( not ( = ?auto_371103 ?auto_371104 ) ) ( not ( = ?auto_371103 ?auto_371105 ) ) ( not ( = ?auto_371104 ?auto_371105 ) ) ( CLEAR ?auto_371102 ) ( ON ?auto_371103 ?auto_371104 ) ( CLEAR ?auto_371103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371102 ?auto_371103 )
      ( MAKE-3PILE ?auto_371102 ?auto_371103 ?auto_371104 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_371109 - BLOCK
      ?auto_371110 - BLOCK
      ?auto_371111 - BLOCK
    )
    :vars
    (
      ?auto_371112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371111 ?auto_371112 ) ( not ( = ?auto_371109 ?auto_371110 ) ) ( not ( = ?auto_371109 ?auto_371111 ) ) ( not ( = ?auto_371109 ?auto_371112 ) ) ( not ( = ?auto_371110 ?auto_371111 ) ) ( not ( = ?auto_371110 ?auto_371112 ) ) ( not ( = ?auto_371111 ?auto_371112 ) ) ( ON ?auto_371110 ?auto_371111 ) ( ON ?auto_371109 ?auto_371110 ) ( CLEAR ?auto_371109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371109 )
      ( MAKE-3PILE ?auto_371109 ?auto_371110 ?auto_371111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_371116 - BLOCK
      ?auto_371117 - BLOCK
      ?auto_371118 - BLOCK
    )
    :vars
    (
      ?auto_371119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371118 ?auto_371119 ) ( not ( = ?auto_371116 ?auto_371117 ) ) ( not ( = ?auto_371116 ?auto_371118 ) ) ( not ( = ?auto_371116 ?auto_371119 ) ) ( not ( = ?auto_371117 ?auto_371118 ) ) ( not ( = ?auto_371117 ?auto_371119 ) ) ( not ( = ?auto_371118 ?auto_371119 ) ) ( ON ?auto_371117 ?auto_371118 ) ( ON ?auto_371116 ?auto_371117 ) ( CLEAR ?auto_371116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371116 )
      ( MAKE-3PILE ?auto_371116 ?auto_371117 ?auto_371118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371124 - BLOCK
      ?auto_371125 - BLOCK
      ?auto_371126 - BLOCK
      ?auto_371127 - BLOCK
    )
    :vars
    (
      ?auto_371128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371126 ) ( ON ?auto_371127 ?auto_371128 ) ( CLEAR ?auto_371127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371124 ) ( ON ?auto_371125 ?auto_371124 ) ( ON ?auto_371126 ?auto_371125 ) ( not ( = ?auto_371124 ?auto_371125 ) ) ( not ( = ?auto_371124 ?auto_371126 ) ) ( not ( = ?auto_371124 ?auto_371127 ) ) ( not ( = ?auto_371124 ?auto_371128 ) ) ( not ( = ?auto_371125 ?auto_371126 ) ) ( not ( = ?auto_371125 ?auto_371127 ) ) ( not ( = ?auto_371125 ?auto_371128 ) ) ( not ( = ?auto_371126 ?auto_371127 ) ) ( not ( = ?auto_371126 ?auto_371128 ) ) ( not ( = ?auto_371127 ?auto_371128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371127 ?auto_371128 )
      ( !STACK ?auto_371127 ?auto_371126 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371133 - BLOCK
      ?auto_371134 - BLOCK
      ?auto_371135 - BLOCK
      ?auto_371136 - BLOCK
    )
    :vars
    (
      ?auto_371137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371135 ) ( ON ?auto_371136 ?auto_371137 ) ( CLEAR ?auto_371136 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371133 ) ( ON ?auto_371134 ?auto_371133 ) ( ON ?auto_371135 ?auto_371134 ) ( not ( = ?auto_371133 ?auto_371134 ) ) ( not ( = ?auto_371133 ?auto_371135 ) ) ( not ( = ?auto_371133 ?auto_371136 ) ) ( not ( = ?auto_371133 ?auto_371137 ) ) ( not ( = ?auto_371134 ?auto_371135 ) ) ( not ( = ?auto_371134 ?auto_371136 ) ) ( not ( = ?auto_371134 ?auto_371137 ) ) ( not ( = ?auto_371135 ?auto_371136 ) ) ( not ( = ?auto_371135 ?auto_371137 ) ) ( not ( = ?auto_371136 ?auto_371137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371136 ?auto_371137 )
      ( !STACK ?auto_371136 ?auto_371135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371142 - BLOCK
      ?auto_371143 - BLOCK
      ?auto_371144 - BLOCK
      ?auto_371145 - BLOCK
    )
    :vars
    (
      ?auto_371146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371145 ?auto_371146 ) ( ON-TABLE ?auto_371142 ) ( ON ?auto_371143 ?auto_371142 ) ( not ( = ?auto_371142 ?auto_371143 ) ) ( not ( = ?auto_371142 ?auto_371144 ) ) ( not ( = ?auto_371142 ?auto_371145 ) ) ( not ( = ?auto_371142 ?auto_371146 ) ) ( not ( = ?auto_371143 ?auto_371144 ) ) ( not ( = ?auto_371143 ?auto_371145 ) ) ( not ( = ?auto_371143 ?auto_371146 ) ) ( not ( = ?auto_371144 ?auto_371145 ) ) ( not ( = ?auto_371144 ?auto_371146 ) ) ( not ( = ?auto_371145 ?auto_371146 ) ) ( CLEAR ?auto_371143 ) ( ON ?auto_371144 ?auto_371145 ) ( CLEAR ?auto_371144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371142 ?auto_371143 ?auto_371144 )
      ( MAKE-4PILE ?auto_371142 ?auto_371143 ?auto_371144 ?auto_371145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371151 - BLOCK
      ?auto_371152 - BLOCK
      ?auto_371153 - BLOCK
      ?auto_371154 - BLOCK
    )
    :vars
    (
      ?auto_371155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371154 ?auto_371155 ) ( ON-TABLE ?auto_371151 ) ( ON ?auto_371152 ?auto_371151 ) ( not ( = ?auto_371151 ?auto_371152 ) ) ( not ( = ?auto_371151 ?auto_371153 ) ) ( not ( = ?auto_371151 ?auto_371154 ) ) ( not ( = ?auto_371151 ?auto_371155 ) ) ( not ( = ?auto_371152 ?auto_371153 ) ) ( not ( = ?auto_371152 ?auto_371154 ) ) ( not ( = ?auto_371152 ?auto_371155 ) ) ( not ( = ?auto_371153 ?auto_371154 ) ) ( not ( = ?auto_371153 ?auto_371155 ) ) ( not ( = ?auto_371154 ?auto_371155 ) ) ( CLEAR ?auto_371152 ) ( ON ?auto_371153 ?auto_371154 ) ( CLEAR ?auto_371153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371151 ?auto_371152 ?auto_371153 )
      ( MAKE-4PILE ?auto_371151 ?auto_371152 ?auto_371153 ?auto_371154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371160 - BLOCK
      ?auto_371161 - BLOCK
      ?auto_371162 - BLOCK
      ?auto_371163 - BLOCK
    )
    :vars
    (
      ?auto_371164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371163 ?auto_371164 ) ( ON-TABLE ?auto_371160 ) ( not ( = ?auto_371160 ?auto_371161 ) ) ( not ( = ?auto_371160 ?auto_371162 ) ) ( not ( = ?auto_371160 ?auto_371163 ) ) ( not ( = ?auto_371160 ?auto_371164 ) ) ( not ( = ?auto_371161 ?auto_371162 ) ) ( not ( = ?auto_371161 ?auto_371163 ) ) ( not ( = ?auto_371161 ?auto_371164 ) ) ( not ( = ?auto_371162 ?auto_371163 ) ) ( not ( = ?auto_371162 ?auto_371164 ) ) ( not ( = ?auto_371163 ?auto_371164 ) ) ( ON ?auto_371162 ?auto_371163 ) ( CLEAR ?auto_371160 ) ( ON ?auto_371161 ?auto_371162 ) ( CLEAR ?auto_371161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371160 ?auto_371161 )
      ( MAKE-4PILE ?auto_371160 ?auto_371161 ?auto_371162 ?auto_371163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371169 - BLOCK
      ?auto_371170 - BLOCK
      ?auto_371171 - BLOCK
      ?auto_371172 - BLOCK
    )
    :vars
    (
      ?auto_371173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371172 ?auto_371173 ) ( ON-TABLE ?auto_371169 ) ( not ( = ?auto_371169 ?auto_371170 ) ) ( not ( = ?auto_371169 ?auto_371171 ) ) ( not ( = ?auto_371169 ?auto_371172 ) ) ( not ( = ?auto_371169 ?auto_371173 ) ) ( not ( = ?auto_371170 ?auto_371171 ) ) ( not ( = ?auto_371170 ?auto_371172 ) ) ( not ( = ?auto_371170 ?auto_371173 ) ) ( not ( = ?auto_371171 ?auto_371172 ) ) ( not ( = ?auto_371171 ?auto_371173 ) ) ( not ( = ?auto_371172 ?auto_371173 ) ) ( ON ?auto_371171 ?auto_371172 ) ( CLEAR ?auto_371169 ) ( ON ?auto_371170 ?auto_371171 ) ( CLEAR ?auto_371170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371169 ?auto_371170 )
      ( MAKE-4PILE ?auto_371169 ?auto_371170 ?auto_371171 ?auto_371172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371178 - BLOCK
      ?auto_371179 - BLOCK
      ?auto_371180 - BLOCK
      ?auto_371181 - BLOCK
    )
    :vars
    (
      ?auto_371182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371181 ?auto_371182 ) ( not ( = ?auto_371178 ?auto_371179 ) ) ( not ( = ?auto_371178 ?auto_371180 ) ) ( not ( = ?auto_371178 ?auto_371181 ) ) ( not ( = ?auto_371178 ?auto_371182 ) ) ( not ( = ?auto_371179 ?auto_371180 ) ) ( not ( = ?auto_371179 ?auto_371181 ) ) ( not ( = ?auto_371179 ?auto_371182 ) ) ( not ( = ?auto_371180 ?auto_371181 ) ) ( not ( = ?auto_371180 ?auto_371182 ) ) ( not ( = ?auto_371181 ?auto_371182 ) ) ( ON ?auto_371180 ?auto_371181 ) ( ON ?auto_371179 ?auto_371180 ) ( ON ?auto_371178 ?auto_371179 ) ( CLEAR ?auto_371178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371178 )
      ( MAKE-4PILE ?auto_371178 ?auto_371179 ?auto_371180 ?auto_371181 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_371187 - BLOCK
      ?auto_371188 - BLOCK
      ?auto_371189 - BLOCK
      ?auto_371190 - BLOCK
    )
    :vars
    (
      ?auto_371191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371190 ?auto_371191 ) ( not ( = ?auto_371187 ?auto_371188 ) ) ( not ( = ?auto_371187 ?auto_371189 ) ) ( not ( = ?auto_371187 ?auto_371190 ) ) ( not ( = ?auto_371187 ?auto_371191 ) ) ( not ( = ?auto_371188 ?auto_371189 ) ) ( not ( = ?auto_371188 ?auto_371190 ) ) ( not ( = ?auto_371188 ?auto_371191 ) ) ( not ( = ?auto_371189 ?auto_371190 ) ) ( not ( = ?auto_371189 ?auto_371191 ) ) ( not ( = ?auto_371190 ?auto_371191 ) ) ( ON ?auto_371189 ?auto_371190 ) ( ON ?auto_371188 ?auto_371189 ) ( ON ?auto_371187 ?auto_371188 ) ( CLEAR ?auto_371187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371187 )
      ( MAKE-4PILE ?auto_371187 ?auto_371188 ?auto_371189 ?auto_371190 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371197 - BLOCK
      ?auto_371198 - BLOCK
      ?auto_371199 - BLOCK
      ?auto_371200 - BLOCK
      ?auto_371201 - BLOCK
    )
    :vars
    (
      ?auto_371202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371200 ) ( ON ?auto_371201 ?auto_371202 ) ( CLEAR ?auto_371201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371197 ) ( ON ?auto_371198 ?auto_371197 ) ( ON ?auto_371199 ?auto_371198 ) ( ON ?auto_371200 ?auto_371199 ) ( not ( = ?auto_371197 ?auto_371198 ) ) ( not ( = ?auto_371197 ?auto_371199 ) ) ( not ( = ?auto_371197 ?auto_371200 ) ) ( not ( = ?auto_371197 ?auto_371201 ) ) ( not ( = ?auto_371197 ?auto_371202 ) ) ( not ( = ?auto_371198 ?auto_371199 ) ) ( not ( = ?auto_371198 ?auto_371200 ) ) ( not ( = ?auto_371198 ?auto_371201 ) ) ( not ( = ?auto_371198 ?auto_371202 ) ) ( not ( = ?auto_371199 ?auto_371200 ) ) ( not ( = ?auto_371199 ?auto_371201 ) ) ( not ( = ?auto_371199 ?auto_371202 ) ) ( not ( = ?auto_371200 ?auto_371201 ) ) ( not ( = ?auto_371200 ?auto_371202 ) ) ( not ( = ?auto_371201 ?auto_371202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371201 ?auto_371202 )
      ( !STACK ?auto_371201 ?auto_371200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371208 - BLOCK
      ?auto_371209 - BLOCK
      ?auto_371210 - BLOCK
      ?auto_371211 - BLOCK
      ?auto_371212 - BLOCK
    )
    :vars
    (
      ?auto_371213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371211 ) ( ON ?auto_371212 ?auto_371213 ) ( CLEAR ?auto_371212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371208 ) ( ON ?auto_371209 ?auto_371208 ) ( ON ?auto_371210 ?auto_371209 ) ( ON ?auto_371211 ?auto_371210 ) ( not ( = ?auto_371208 ?auto_371209 ) ) ( not ( = ?auto_371208 ?auto_371210 ) ) ( not ( = ?auto_371208 ?auto_371211 ) ) ( not ( = ?auto_371208 ?auto_371212 ) ) ( not ( = ?auto_371208 ?auto_371213 ) ) ( not ( = ?auto_371209 ?auto_371210 ) ) ( not ( = ?auto_371209 ?auto_371211 ) ) ( not ( = ?auto_371209 ?auto_371212 ) ) ( not ( = ?auto_371209 ?auto_371213 ) ) ( not ( = ?auto_371210 ?auto_371211 ) ) ( not ( = ?auto_371210 ?auto_371212 ) ) ( not ( = ?auto_371210 ?auto_371213 ) ) ( not ( = ?auto_371211 ?auto_371212 ) ) ( not ( = ?auto_371211 ?auto_371213 ) ) ( not ( = ?auto_371212 ?auto_371213 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371212 ?auto_371213 )
      ( !STACK ?auto_371212 ?auto_371211 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371219 - BLOCK
      ?auto_371220 - BLOCK
      ?auto_371221 - BLOCK
      ?auto_371222 - BLOCK
      ?auto_371223 - BLOCK
    )
    :vars
    (
      ?auto_371224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371223 ?auto_371224 ) ( ON-TABLE ?auto_371219 ) ( ON ?auto_371220 ?auto_371219 ) ( ON ?auto_371221 ?auto_371220 ) ( not ( = ?auto_371219 ?auto_371220 ) ) ( not ( = ?auto_371219 ?auto_371221 ) ) ( not ( = ?auto_371219 ?auto_371222 ) ) ( not ( = ?auto_371219 ?auto_371223 ) ) ( not ( = ?auto_371219 ?auto_371224 ) ) ( not ( = ?auto_371220 ?auto_371221 ) ) ( not ( = ?auto_371220 ?auto_371222 ) ) ( not ( = ?auto_371220 ?auto_371223 ) ) ( not ( = ?auto_371220 ?auto_371224 ) ) ( not ( = ?auto_371221 ?auto_371222 ) ) ( not ( = ?auto_371221 ?auto_371223 ) ) ( not ( = ?auto_371221 ?auto_371224 ) ) ( not ( = ?auto_371222 ?auto_371223 ) ) ( not ( = ?auto_371222 ?auto_371224 ) ) ( not ( = ?auto_371223 ?auto_371224 ) ) ( CLEAR ?auto_371221 ) ( ON ?auto_371222 ?auto_371223 ) ( CLEAR ?auto_371222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371219 ?auto_371220 ?auto_371221 ?auto_371222 )
      ( MAKE-5PILE ?auto_371219 ?auto_371220 ?auto_371221 ?auto_371222 ?auto_371223 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371230 - BLOCK
      ?auto_371231 - BLOCK
      ?auto_371232 - BLOCK
      ?auto_371233 - BLOCK
      ?auto_371234 - BLOCK
    )
    :vars
    (
      ?auto_371235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371234 ?auto_371235 ) ( ON-TABLE ?auto_371230 ) ( ON ?auto_371231 ?auto_371230 ) ( ON ?auto_371232 ?auto_371231 ) ( not ( = ?auto_371230 ?auto_371231 ) ) ( not ( = ?auto_371230 ?auto_371232 ) ) ( not ( = ?auto_371230 ?auto_371233 ) ) ( not ( = ?auto_371230 ?auto_371234 ) ) ( not ( = ?auto_371230 ?auto_371235 ) ) ( not ( = ?auto_371231 ?auto_371232 ) ) ( not ( = ?auto_371231 ?auto_371233 ) ) ( not ( = ?auto_371231 ?auto_371234 ) ) ( not ( = ?auto_371231 ?auto_371235 ) ) ( not ( = ?auto_371232 ?auto_371233 ) ) ( not ( = ?auto_371232 ?auto_371234 ) ) ( not ( = ?auto_371232 ?auto_371235 ) ) ( not ( = ?auto_371233 ?auto_371234 ) ) ( not ( = ?auto_371233 ?auto_371235 ) ) ( not ( = ?auto_371234 ?auto_371235 ) ) ( CLEAR ?auto_371232 ) ( ON ?auto_371233 ?auto_371234 ) ( CLEAR ?auto_371233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371230 ?auto_371231 ?auto_371232 ?auto_371233 )
      ( MAKE-5PILE ?auto_371230 ?auto_371231 ?auto_371232 ?auto_371233 ?auto_371234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371241 - BLOCK
      ?auto_371242 - BLOCK
      ?auto_371243 - BLOCK
      ?auto_371244 - BLOCK
      ?auto_371245 - BLOCK
    )
    :vars
    (
      ?auto_371246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371245 ?auto_371246 ) ( ON-TABLE ?auto_371241 ) ( ON ?auto_371242 ?auto_371241 ) ( not ( = ?auto_371241 ?auto_371242 ) ) ( not ( = ?auto_371241 ?auto_371243 ) ) ( not ( = ?auto_371241 ?auto_371244 ) ) ( not ( = ?auto_371241 ?auto_371245 ) ) ( not ( = ?auto_371241 ?auto_371246 ) ) ( not ( = ?auto_371242 ?auto_371243 ) ) ( not ( = ?auto_371242 ?auto_371244 ) ) ( not ( = ?auto_371242 ?auto_371245 ) ) ( not ( = ?auto_371242 ?auto_371246 ) ) ( not ( = ?auto_371243 ?auto_371244 ) ) ( not ( = ?auto_371243 ?auto_371245 ) ) ( not ( = ?auto_371243 ?auto_371246 ) ) ( not ( = ?auto_371244 ?auto_371245 ) ) ( not ( = ?auto_371244 ?auto_371246 ) ) ( not ( = ?auto_371245 ?auto_371246 ) ) ( ON ?auto_371244 ?auto_371245 ) ( CLEAR ?auto_371242 ) ( ON ?auto_371243 ?auto_371244 ) ( CLEAR ?auto_371243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371241 ?auto_371242 ?auto_371243 )
      ( MAKE-5PILE ?auto_371241 ?auto_371242 ?auto_371243 ?auto_371244 ?auto_371245 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371252 - BLOCK
      ?auto_371253 - BLOCK
      ?auto_371254 - BLOCK
      ?auto_371255 - BLOCK
      ?auto_371256 - BLOCK
    )
    :vars
    (
      ?auto_371257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371256 ?auto_371257 ) ( ON-TABLE ?auto_371252 ) ( ON ?auto_371253 ?auto_371252 ) ( not ( = ?auto_371252 ?auto_371253 ) ) ( not ( = ?auto_371252 ?auto_371254 ) ) ( not ( = ?auto_371252 ?auto_371255 ) ) ( not ( = ?auto_371252 ?auto_371256 ) ) ( not ( = ?auto_371252 ?auto_371257 ) ) ( not ( = ?auto_371253 ?auto_371254 ) ) ( not ( = ?auto_371253 ?auto_371255 ) ) ( not ( = ?auto_371253 ?auto_371256 ) ) ( not ( = ?auto_371253 ?auto_371257 ) ) ( not ( = ?auto_371254 ?auto_371255 ) ) ( not ( = ?auto_371254 ?auto_371256 ) ) ( not ( = ?auto_371254 ?auto_371257 ) ) ( not ( = ?auto_371255 ?auto_371256 ) ) ( not ( = ?auto_371255 ?auto_371257 ) ) ( not ( = ?auto_371256 ?auto_371257 ) ) ( ON ?auto_371255 ?auto_371256 ) ( CLEAR ?auto_371253 ) ( ON ?auto_371254 ?auto_371255 ) ( CLEAR ?auto_371254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371252 ?auto_371253 ?auto_371254 )
      ( MAKE-5PILE ?auto_371252 ?auto_371253 ?auto_371254 ?auto_371255 ?auto_371256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371263 - BLOCK
      ?auto_371264 - BLOCK
      ?auto_371265 - BLOCK
      ?auto_371266 - BLOCK
      ?auto_371267 - BLOCK
    )
    :vars
    (
      ?auto_371268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371267 ?auto_371268 ) ( ON-TABLE ?auto_371263 ) ( not ( = ?auto_371263 ?auto_371264 ) ) ( not ( = ?auto_371263 ?auto_371265 ) ) ( not ( = ?auto_371263 ?auto_371266 ) ) ( not ( = ?auto_371263 ?auto_371267 ) ) ( not ( = ?auto_371263 ?auto_371268 ) ) ( not ( = ?auto_371264 ?auto_371265 ) ) ( not ( = ?auto_371264 ?auto_371266 ) ) ( not ( = ?auto_371264 ?auto_371267 ) ) ( not ( = ?auto_371264 ?auto_371268 ) ) ( not ( = ?auto_371265 ?auto_371266 ) ) ( not ( = ?auto_371265 ?auto_371267 ) ) ( not ( = ?auto_371265 ?auto_371268 ) ) ( not ( = ?auto_371266 ?auto_371267 ) ) ( not ( = ?auto_371266 ?auto_371268 ) ) ( not ( = ?auto_371267 ?auto_371268 ) ) ( ON ?auto_371266 ?auto_371267 ) ( ON ?auto_371265 ?auto_371266 ) ( CLEAR ?auto_371263 ) ( ON ?auto_371264 ?auto_371265 ) ( CLEAR ?auto_371264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371263 ?auto_371264 )
      ( MAKE-5PILE ?auto_371263 ?auto_371264 ?auto_371265 ?auto_371266 ?auto_371267 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371274 - BLOCK
      ?auto_371275 - BLOCK
      ?auto_371276 - BLOCK
      ?auto_371277 - BLOCK
      ?auto_371278 - BLOCK
    )
    :vars
    (
      ?auto_371279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371278 ?auto_371279 ) ( ON-TABLE ?auto_371274 ) ( not ( = ?auto_371274 ?auto_371275 ) ) ( not ( = ?auto_371274 ?auto_371276 ) ) ( not ( = ?auto_371274 ?auto_371277 ) ) ( not ( = ?auto_371274 ?auto_371278 ) ) ( not ( = ?auto_371274 ?auto_371279 ) ) ( not ( = ?auto_371275 ?auto_371276 ) ) ( not ( = ?auto_371275 ?auto_371277 ) ) ( not ( = ?auto_371275 ?auto_371278 ) ) ( not ( = ?auto_371275 ?auto_371279 ) ) ( not ( = ?auto_371276 ?auto_371277 ) ) ( not ( = ?auto_371276 ?auto_371278 ) ) ( not ( = ?auto_371276 ?auto_371279 ) ) ( not ( = ?auto_371277 ?auto_371278 ) ) ( not ( = ?auto_371277 ?auto_371279 ) ) ( not ( = ?auto_371278 ?auto_371279 ) ) ( ON ?auto_371277 ?auto_371278 ) ( ON ?auto_371276 ?auto_371277 ) ( CLEAR ?auto_371274 ) ( ON ?auto_371275 ?auto_371276 ) ( CLEAR ?auto_371275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371274 ?auto_371275 )
      ( MAKE-5PILE ?auto_371274 ?auto_371275 ?auto_371276 ?auto_371277 ?auto_371278 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371285 - BLOCK
      ?auto_371286 - BLOCK
      ?auto_371287 - BLOCK
      ?auto_371288 - BLOCK
      ?auto_371289 - BLOCK
    )
    :vars
    (
      ?auto_371290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371289 ?auto_371290 ) ( not ( = ?auto_371285 ?auto_371286 ) ) ( not ( = ?auto_371285 ?auto_371287 ) ) ( not ( = ?auto_371285 ?auto_371288 ) ) ( not ( = ?auto_371285 ?auto_371289 ) ) ( not ( = ?auto_371285 ?auto_371290 ) ) ( not ( = ?auto_371286 ?auto_371287 ) ) ( not ( = ?auto_371286 ?auto_371288 ) ) ( not ( = ?auto_371286 ?auto_371289 ) ) ( not ( = ?auto_371286 ?auto_371290 ) ) ( not ( = ?auto_371287 ?auto_371288 ) ) ( not ( = ?auto_371287 ?auto_371289 ) ) ( not ( = ?auto_371287 ?auto_371290 ) ) ( not ( = ?auto_371288 ?auto_371289 ) ) ( not ( = ?auto_371288 ?auto_371290 ) ) ( not ( = ?auto_371289 ?auto_371290 ) ) ( ON ?auto_371288 ?auto_371289 ) ( ON ?auto_371287 ?auto_371288 ) ( ON ?auto_371286 ?auto_371287 ) ( ON ?auto_371285 ?auto_371286 ) ( CLEAR ?auto_371285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371285 )
      ( MAKE-5PILE ?auto_371285 ?auto_371286 ?auto_371287 ?auto_371288 ?auto_371289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_371296 - BLOCK
      ?auto_371297 - BLOCK
      ?auto_371298 - BLOCK
      ?auto_371299 - BLOCK
      ?auto_371300 - BLOCK
    )
    :vars
    (
      ?auto_371301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371300 ?auto_371301 ) ( not ( = ?auto_371296 ?auto_371297 ) ) ( not ( = ?auto_371296 ?auto_371298 ) ) ( not ( = ?auto_371296 ?auto_371299 ) ) ( not ( = ?auto_371296 ?auto_371300 ) ) ( not ( = ?auto_371296 ?auto_371301 ) ) ( not ( = ?auto_371297 ?auto_371298 ) ) ( not ( = ?auto_371297 ?auto_371299 ) ) ( not ( = ?auto_371297 ?auto_371300 ) ) ( not ( = ?auto_371297 ?auto_371301 ) ) ( not ( = ?auto_371298 ?auto_371299 ) ) ( not ( = ?auto_371298 ?auto_371300 ) ) ( not ( = ?auto_371298 ?auto_371301 ) ) ( not ( = ?auto_371299 ?auto_371300 ) ) ( not ( = ?auto_371299 ?auto_371301 ) ) ( not ( = ?auto_371300 ?auto_371301 ) ) ( ON ?auto_371299 ?auto_371300 ) ( ON ?auto_371298 ?auto_371299 ) ( ON ?auto_371297 ?auto_371298 ) ( ON ?auto_371296 ?auto_371297 ) ( CLEAR ?auto_371296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371296 )
      ( MAKE-5PILE ?auto_371296 ?auto_371297 ?auto_371298 ?auto_371299 ?auto_371300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371308 - BLOCK
      ?auto_371309 - BLOCK
      ?auto_371310 - BLOCK
      ?auto_371311 - BLOCK
      ?auto_371312 - BLOCK
      ?auto_371313 - BLOCK
    )
    :vars
    (
      ?auto_371314 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371312 ) ( ON ?auto_371313 ?auto_371314 ) ( CLEAR ?auto_371313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371308 ) ( ON ?auto_371309 ?auto_371308 ) ( ON ?auto_371310 ?auto_371309 ) ( ON ?auto_371311 ?auto_371310 ) ( ON ?auto_371312 ?auto_371311 ) ( not ( = ?auto_371308 ?auto_371309 ) ) ( not ( = ?auto_371308 ?auto_371310 ) ) ( not ( = ?auto_371308 ?auto_371311 ) ) ( not ( = ?auto_371308 ?auto_371312 ) ) ( not ( = ?auto_371308 ?auto_371313 ) ) ( not ( = ?auto_371308 ?auto_371314 ) ) ( not ( = ?auto_371309 ?auto_371310 ) ) ( not ( = ?auto_371309 ?auto_371311 ) ) ( not ( = ?auto_371309 ?auto_371312 ) ) ( not ( = ?auto_371309 ?auto_371313 ) ) ( not ( = ?auto_371309 ?auto_371314 ) ) ( not ( = ?auto_371310 ?auto_371311 ) ) ( not ( = ?auto_371310 ?auto_371312 ) ) ( not ( = ?auto_371310 ?auto_371313 ) ) ( not ( = ?auto_371310 ?auto_371314 ) ) ( not ( = ?auto_371311 ?auto_371312 ) ) ( not ( = ?auto_371311 ?auto_371313 ) ) ( not ( = ?auto_371311 ?auto_371314 ) ) ( not ( = ?auto_371312 ?auto_371313 ) ) ( not ( = ?auto_371312 ?auto_371314 ) ) ( not ( = ?auto_371313 ?auto_371314 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371313 ?auto_371314 )
      ( !STACK ?auto_371313 ?auto_371312 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371321 - BLOCK
      ?auto_371322 - BLOCK
      ?auto_371323 - BLOCK
      ?auto_371324 - BLOCK
      ?auto_371325 - BLOCK
      ?auto_371326 - BLOCK
    )
    :vars
    (
      ?auto_371327 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371325 ) ( ON ?auto_371326 ?auto_371327 ) ( CLEAR ?auto_371326 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371321 ) ( ON ?auto_371322 ?auto_371321 ) ( ON ?auto_371323 ?auto_371322 ) ( ON ?auto_371324 ?auto_371323 ) ( ON ?auto_371325 ?auto_371324 ) ( not ( = ?auto_371321 ?auto_371322 ) ) ( not ( = ?auto_371321 ?auto_371323 ) ) ( not ( = ?auto_371321 ?auto_371324 ) ) ( not ( = ?auto_371321 ?auto_371325 ) ) ( not ( = ?auto_371321 ?auto_371326 ) ) ( not ( = ?auto_371321 ?auto_371327 ) ) ( not ( = ?auto_371322 ?auto_371323 ) ) ( not ( = ?auto_371322 ?auto_371324 ) ) ( not ( = ?auto_371322 ?auto_371325 ) ) ( not ( = ?auto_371322 ?auto_371326 ) ) ( not ( = ?auto_371322 ?auto_371327 ) ) ( not ( = ?auto_371323 ?auto_371324 ) ) ( not ( = ?auto_371323 ?auto_371325 ) ) ( not ( = ?auto_371323 ?auto_371326 ) ) ( not ( = ?auto_371323 ?auto_371327 ) ) ( not ( = ?auto_371324 ?auto_371325 ) ) ( not ( = ?auto_371324 ?auto_371326 ) ) ( not ( = ?auto_371324 ?auto_371327 ) ) ( not ( = ?auto_371325 ?auto_371326 ) ) ( not ( = ?auto_371325 ?auto_371327 ) ) ( not ( = ?auto_371326 ?auto_371327 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371326 ?auto_371327 )
      ( !STACK ?auto_371326 ?auto_371325 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371334 - BLOCK
      ?auto_371335 - BLOCK
      ?auto_371336 - BLOCK
      ?auto_371337 - BLOCK
      ?auto_371338 - BLOCK
      ?auto_371339 - BLOCK
    )
    :vars
    (
      ?auto_371340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371339 ?auto_371340 ) ( ON-TABLE ?auto_371334 ) ( ON ?auto_371335 ?auto_371334 ) ( ON ?auto_371336 ?auto_371335 ) ( ON ?auto_371337 ?auto_371336 ) ( not ( = ?auto_371334 ?auto_371335 ) ) ( not ( = ?auto_371334 ?auto_371336 ) ) ( not ( = ?auto_371334 ?auto_371337 ) ) ( not ( = ?auto_371334 ?auto_371338 ) ) ( not ( = ?auto_371334 ?auto_371339 ) ) ( not ( = ?auto_371334 ?auto_371340 ) ) ( not ( = ?auto_371335 ?auto_371336 ) ) ( not ( = ?auto_371335 ?auto_371337 ) ) ( not ( = ?auto_371335 ?auto_371338 ) ) ( not ( = ?auto_371335 ?auto_371339 ) ) ( not ( = ?auto_371335 ?auto_371340 ) ) ( not ( = ?auto_371336 ?auto_371337 ) ) ( not ( = ?auto_371336 ?auto_371338 ) ) ( not ( = ?auto_371336 ?auto_371339 ) ) ( not ( = ?auto_371336 ?auto_371340 ) ) ( not ( = ?auto_371337 ?auto_371338 ) ) ( not ( = ?auto_371337 ?auto_371339 ) ) ( not ( = ?auto_371337 ?auto_371340 ) ) ( not ( = ?auto_371338 ?auto_371339 ) ) ( not ( = ?auto_371338 ?auto_371340 ) ) ( not ( = ?auto_371339 ?auto_371340 ) ) ( CLEAR ?auto_371337 ) ( ON ?auto_371338 ?auto_371339 ) ( CLEAR ?auto_371338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_371334 ?auto_371335 ?auto_371336 ?auto_371337 ?auto_371338 )
      ( MAKE-6PILE ?auto_371334 ?auto_371335 ?auto_371336 ?auto_371337 ?auto_371338 ?auto_371339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371347 - BLOCK
      ?auto_371348 - BLOCK
      ?auto_371349 - BLOCK
      ?auto_371350 - BLOCK
      ?auto_371351 - BLOCK
      ?auto_371352 - BLOCK
    )
    :vars
    (
      ?auto_371353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371352 ?auto_371353 ) ( ON-TABLE ?auto_371347 ) ( ON ?auto_371348 ?auto_371347 ) ( ON ?auto_371349 ?auto_371348 ) ( ON ?auto_371350 ?auto_371349 ) ( not ( = ?auto_371347 ?auto_371348 ) ) ( not ( = ?auto_371347 ?auto_371349 ) ) ( not ( = ?auto_371347 ?auto_371350 ) ) ( not ( = ?auto_371347 ?auto_371351 ) ) ( not ( = ?auto_371347 ?auto_371352 ) ) ( not ( = ?auto_371347 ?auto_371353 ) ) ( not ( = ?auto_371348 ?auto_371349 ) ) ( not ( = ?auto_371348 ?auto_371350 ) ) ( not ( = ?auto_371348 ?auto_371351 ) ) ( not ( = ?auto_371348 ?auto_371352 ) ) ( not ( = ?auto_371348 ?auto_371353 ) ) ( not ( = ?auto_371349 ?auto_371350 ) ) ( not ( = ?auto_371349 ?auto_371351 ) ) ( not ( = ?auto_371349 ?auto_371352 ) ) ( not ( = ?auto_371349 ?auto_371353 ) ) ( not ( = ?auto_371350 ?auto_371351 ) ) ( not ( = ?auto_371350 ?auto_371352 ) ) ( not ( = ?auto_371350 ?auto_371353 ) ) ( not ( = ?auto_371351 ?auto_371352 ) ) ( not ( = ?auto_371351 ?auto_371353 ) ) ( not ( = ?auto_371352 ?auto_371353 ) ) ( CLEAR ?auto_371350 ) ( ON ?auto_371351 ?auto_371352 ) ( CLEAR ?auto_371351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_371347 ?auto_371348 ?auto_371349 ?auto_371350 ?auto_371351 )
      ( MAKE-6PILE ?auto_371347 ?auto_371348 ?auto_371349 ?auto_371350 ?auto_371351 ?auto_371352 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371360 - BLOCK
      ?auto_371361 - BLOCK
      ?auto_371362 - BLOCK
      ?auto_371363 - BLOCK
      ?auto_371364 - BLOCK
      ?auto_371365 - BLOCK
    )
    :vars
    (
      ?auto_371366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371365 ?auto_371366 ) ( ON-TABLE ?auto_371360 ) ( ON ?auto_371361 ?auto_371360 ) ( ON ?auto_371362 ?auto_371361 ) ( not ( = ?auto_371360 ?auto_371361 ) ) ( not ( = ?auto_371360 ?auto_371362 ) ) ( not ( = ?auto_371360 ?auto_371363 ) ) ( not ( = ?auto_371360 ?auto_371364 ) ) ( not ( = ?auto_371360 ?auto_371365 ) ) ( not ( = ?auto_371360 ?auto_371366 ) ) ( not ( = ?auto_371361 ?auto_371362 ) ) ( not ( = ?auto_371361 ?auto_371363 ) ) ( not ( = ?auto_371361 ?auto_371364 ) ) ( not ( = ?auto_371361 ?auto_371365 ) ) ( not ( = ?auto_371361 ?auto_371366 ) ) ( not ( = ?auto_371362 ?auto_371363 ) ) ( not ( = ?auto_371362 ?auto_371364 ) ) ( not ( = ?auto_371362 ?auto_371365 ) ) ( not ( = ?auto_371362 ?auto_371366 ) ) ( not ( = ?auto_371363 ?auto_371364 ) ) ( not ( = ?auto_371363 ?auto_371365 ) ) ( not ( = ?auto_371363 ?auto_371366 ) ) ( not ( = ?auto_371364 ?auto_371365 ) ) ( not ( = ?auto_371364 ?auto_371366 ) ) ( not ( = ?auto_371365 ?auto_371366 ) ) ( ON ?auto_371364 ?auto_371365 ) ( CLEAR ?auto_371362 ) ( ON ?auto_371363 ?auto_371364 ) ( CLEAR ?auto_371363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371360 ?auto_371361 ?auto_371362 ?auto_371363 )
      ( MAKE-6PILE ?auto_371360 ?auto_371361 ?auto_371362 ?auto_371363 ?auto_371364 ?auto_371365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371373 - BLOCK
      ?auto_371374 - BLOCK
      ?auto_371375 - BLOCK
      ?auto_371376 - BLOCK
      ?auto_371377 - BLOCK
      ?auto_371378 - BLOCK
    )
    :vars
    (
      ?auto_371379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371378 ?auto_371379 ) ( ON-TABLE ?auto_371373 ) ( ON ?auto_371374 ?auto_371373 ) ( ON ?auto_371375 ?auto_371374 ) ( not ( = ?auto_371373 ?auto_371374 ) ) ( not ( = ?auto_371373 ?auto_371375 ) ) ( not ( = ?auto_371373 ?auto_371376 ) ) ( not ( = ?auto_371373 ?auto_371377 ) ) ( not ( = ?auto_371373 ?auto_371378 ) ) ( not ( = ?auto_371373 ?auto_371379 ) ) ( not ( = ?auto_371374 ?auto_371375 ) ) ( not ( = ?auto_371374 ?auto_371376 ) ) ( not ( = ?auto_371374 ?auto_371377 ) ) ( not ( = ?auto_371374 ?auto_371378 ) ) ( not ( = ?auto_371374 ?auto_371379 ) ) ( not ( = ?auto_371375 ?auto_371376 ) ) ( not ( = ?auto_371375 ?auto_371377 ) ) ( not ( = ?auto_371375 ?auto_371378 ) ) ( not ( = ?auto_371375 ?auto_371379 ) ) ( not ( = ?auto_371376 ?auto_371377 ) ) ( not ( = ?auto_371376 ?auto_371378 ) ) ( not ( = ?auto_371376 ?auto_371379 ) ) ( not ( = ?auto_371377 ?auto_371378 ) ) ( not ( = ?auto_371377 ?auto_371379 ) ) ( not ( = ?auto_371378 ?auto_371379 ) ) ( ON ?auto_371377 ?auto_371378 ) ( CLEAR ?auto_371375 ) ( ON ?auto_371376 ?auto_371377 ) ( CLEAR ?auto_371376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371373 ?auto_371374 ?auto_371375 ?auto_371376 )
      ( MAKE-6PILE ?auto_371373 ?auto_371374 ?auto_371375 ?auto_371376 ?auto_371377 ?auto_371378 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371386 - BLOCK
      ?auto_371387 - BLOCK
      ?auto_371388 - BLOCK
      ?auto_371389 - BLOCK
      ?auto_371390 - BLOCK
      ?auto_371391 - BLOCK
    )
    :vars
    (
      ?auto_371392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371391 ?auto_371392 ) ( ON-TABLE ?auto_371386 ) ( ON ?auto_371387 ?auto_371386 ) ( not ( = ?auto_371386 ?auto_371387 ) ) ( not ( = ?auto_371386 ?auto_371388 ) ) ( not ( = ?auto_371386 ?auto_371389 ) ) ( not ( = ?auto_371386 ?auto_371390 ) ) ( not ( = ?auto_371386 ?auto_371391 ) ) ( not ( = ?auto_371386 ?auto_371392 ) ) ( not ( = ?auto_371387 ?auto_371388 ) ) ( not ( = ?auto_371387 ?auto_371389 ) ) ( not ( = ?auto_371387 ?auto_371390 ) ) ( not ( = ?auto_371387 ?auto_371391 ) ) ( not ( = ?auto_371387 ?auto_371392 ) ) ( not ( = ?auto_371388 ?auto_371389 ) ) ( not ( = ?auto_371388 ?auto_371390 ) ) ( not ( = ?auto_371388 ?auto_371391 ) ) ( not ( = ?auto_371388 ?auto_371392 ) ) ( not ( = ?auto_371389 ?auto_371390 ) ) ( not ( = ?auto_371389 ?auto_371391 ) ) ( not ( = ?auto_371389 ?auto_371392 ) ) ( not ( = ?auto_371390 ?auto_371391 ) ) ( not ( = ?auto_371390 ?auto_371392 ) ) ( not ( = ?auto_371391 ?auto_371392 ) ) ( ON ?auto_371390 ?auto_371391 ) ( ON ?auto_371389 ?auto_371390 ) ( CLEAR ?auto_371387 ) ( ON ?auto_371388 ?auto_371389 ) ( CLEAR ?auto_371388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371386 ?auto_371387 ?auto_371388 )
      ( MAKE-6PILE ?auto_371386 ?auto_371387 ?auto_371388 ?auto_371389 ?auto_371390 ?auto_371391 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371399 - BLOCK
      ?auto_371400 - BLOCK
      ?auto_371401 - BLOCK
      ?auto_371402 - BLOCK
      ?auto_371403 - BLOCK
      ?auto_371404 - BLOCK
    )
    :vars
    (
      ?auto_371405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371404 ?auto_371405 ) ( ON-TABLE ?auto_371399 ) ( ON ?auto_371400 ?auto_371399 ) ( not ( = ?auto_371399 ?auto_371400 ) ) ( not ( = ?auto_371399 ?auto_371401 ) ) ( not ( = ?auto_371399 ?auto_371402 ) ) ( not ( = ?auto_371399 ?auto_371403 ) ) ( not ( = ?auto_371399 ?auto_371404 ) ) ( not ( = ?auto_371399 ?auto_371405 ) ) ( not ( = ?auto_371400 ?auto_371401 ) ) ( not ( = ?auto_371400 ?auto_371402 ) ) ( not ( = ?auto_371400 ?auto_371403 ) ) ( not ( = ?auto_371400 ?auto_371404 ) ) ( not ( = ?auto_371400 ?auto_371405 ) ) ( not ( = ?auto_371401 ?auto_371402 ) ) ( not ( = ?auto_371401 ?auto_371403 ) ) ( not ( = ?auto_371401 ?auto_371404 ) ) ( not ( = ?auto_371401 ?auto_371405 ) ) ( not ( = ?auto_371402 ?auto_371403 ) ) ( not ( = ?auto_371402 ?auto_371404 ) ) ( not ( = ?auto_371402 ?auto_371405 ) ) ( not ( = ?auto_371403 ?auto_371404 ) ) ( not ( = ?auto_371403 ?auto_371405 ) ) ( not ( = ?auto_371404 ?auto_371405 ) ) ( ON ?auto_371403 ?auto_371404 ) ( ON ?auto_371402 ?auto_371403 ) ( CLEAR ?auto_371400 ) ( ON ?auto_371401 ?auto_371402 ) ( CLEAR ?auto_371401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371399 ?auto_371400 ?auto_371401 )
      ( MAKE-6PILE ?auto_371399 ?auto_371400 ?auto_371401 ?auto_371402 ?auto_371403 ?auto_371404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371412 - BLOCK
      ?auto_371413 - BLOCK
      ?auto_371414 - BLOCK
      ?auto_371415 - BLOCK
      ?auto_371416 - BLOCK
      ?auto_371417 - BLOCK
    )
    :vars
    (
      ?auto_371418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371417 ?auto_371418 ) ( ON-TABLE ?auto_371412 ) ( not ( = ?auto_371412 ?auto_371413 ) ) ( not ( = ?auto_371412 ?auto_371414 ) ) ( not ( = ?auto_371412 ?auto_371415 ) ) ( not ( = ?auto_371412 ?auto_371416 ) ) ( not ( = ?auto_371412 ?auto_371417 ) ) ( not ( = ?auto_371412 ?auto_371418 ) ) ( not ( = ?auto_371413 ?auto_371414 ) ) ( not ( = ?auto_371413 ?auto_371415 ) ) ( not ( = ?auto_371413 ?auto_371416 ) ) ( not ( = ?auto_371413 ?auto_371417 ) ) ( not ( = ?auto_371413 ?auto_371418 ) ) ( not ( = ?auto_371414 ?auto_371415 ) ) ( not ( = ?auto_371414 ?auto_371416 ) ) ( not ( = ?auto_371414 ?auto_371417 ) ) ( not ( = ?auto_371414 ?auto_371418 ) ) ( not ( = ?auto_371415 ?auto_371416 ) ) ( not ( = ?auto_371415 ?auto_371417 ) ) ( not ( = ?auto_371415 ?auto_371418 ) ) ( not ( = ?auto_371416 ?auto_371417 ) ) ( not ( = ?auto_371416 ?auto_371418 ) ) ( not ( = ?auto_371417 ?auto_371418 ) ) ( ON ?auto_371416 ?auto_371417 ) ( ON ?auto_371415 ?auto_371416 ) ( ON ?auto_371414 ?auto_371415 ) ( CLEAR ?auto_371412 ) ( ON ?auto_371413 ?auto_371414 ) ( CLEAR ?auto_371413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371412 ?auto_371413 )
      ( MAKE-6PILE ?auto_371412 ?auto_371413 ?auto_371414 ?auto_371415 ?auto_371416 ?auto_371417 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371425 - BLOCK
      ?auto_371426 - BLOCK
      ?auto_371427 - BLOCK
      ?auto_371428 - BLOCK
      ?auto_371429 - BLOCK
      ?auto_371430 - BLOCK
    )
    :vars
    (
      ?auto_371431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371430 ?auto_371431 ) ( ON-TABLE ?auto_371425 ) ( not ( = ?auto_371425 ?auto_371426 ) ) ( not ( = ?auto_371425 ?auto_371427 ) ) ( not ( = ?auto_371425 ?auto_371428 ) ) ( not ( = ?auto_371425 ?auto_371429 ) ) ( not ( = ?auto_371425 ?auto_371430 ) ) ( not ( = ?auto_371425 ?auto_371431 ) ) ( not ( = ?auto_371426 ?auto_371427 ) ) ( not ( = ?auto_371426 ?auto_371428 ) ) ( not ( = ?auto_371426 ?auto_371429 ) ) ( not ( = ?auto_371426 ?auto_371430 ) ) ( not ( = ?auto_371426 ?auto_371431 ) ) ( not ( = ?auto_371427 ?auto_371428 ) ) ( not ( = ?auto_371427 ?auto_371429 ) ) ( not ( = ?auto_371427 ?auto_371430 ) ) ( not ( = ?auto_371427 ?auto_371431 ) ) ( not ( = ?auto_371428 ?auto_371429 ) ) ( not ( = ?auto_371428 ?auto_371430 ) ) ( not ( = ?auto_371428 ?auto_371431 ) ) ( not ( = ?auto_371429 ?auto_371430 ) ) ( not ( = ?auto_371429 ?auto_371431 ) ) ( not ( = ?auto_371430 ?auto_371431 ) ) ( ON ?auto_371429 ?auto_371430 ) ( ON ?auto_371428 ?auto_371429 ) ( ON ?auto_371427 ?auto_371428 ) ( CLEAR ?auto_371425 ) ( ON ?auto_371426 ?auto_371427 ) ( CLEAR ?auto_371426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371425 ?auto_371426 )
      ( MAKE-6PILE ?auto_371425 ?auto_371426 ?auto_371427 ?auto_371428 ?auto_371429 ?auto_371430 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371438 - BLOCK
      ?auto_371439 - BLOCK
      ?auto_371440 - BLOCK
      ?auto_371441 - BLOCK
      ?auto_371442 - BLOCK
      ?auto_371443 - BLOCK
    )
    :vars
    (
      ?auto_371444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371443 ?auto_371444 ) ( not ( = ?auto_371438 ?auto_371439 ) ) ( not ( = ?auto_371438 ?auto_371440 ) ) ( not ( = ?auto_371438 ?auto_371441 ) ) ( not ( = ?auto_371438 ?auto_371442 ) ) ( not ( = ?auto_371438 ?auto_371443 ) ) ( not ( = ?auto_371438 ?auto_371444 ) ) ( not ( = ?auto_371439 ?auto_371440 ) ) ( not ( = ?auto_371439 ?auto_371441 ) ) ( not ( = ?auto_371439 ?auto_371442 ) ) ( not ( = ?auto_371439 ?auto_371443 ) ) ( not ( = ?auto_371439 ?auto_371444 ) ) ( not ( = ?auto_371440 ?auto_371441 ) ) ( not ( = ?auto_371440 ?auto_371442 ) ) ( not ( = ?auto_371440 ?auto_371443 ) ) ( not ( = ?auto_371440 ?auto_371444 ) ) ( not ( = ?auto_371441 ?auto_371442 ) ) ( not ( = ?auto_371441 ?auto_371443 ) ) ( not ( = ?auto_371441 ?auto_371444 ) ) ( not ( = ?auto_371442 ?auto_371443 ) ) ( not ( = ?auto_371442 ?auto_371444 ) ) ( not ( = ?auto_371443 ?auto_371444 ) ) ( ON ?auto_371442 ?auto_371443 ) ( ON ?auto_371441 ?auto_371442 ) ( ON ?auto_371440 ?auto_371441 ) ( ON ?auto_371439 ?auto_371440 ) ( ON ?auto_371438 ?auto_371439 ) ( CLEAR ?auto_371438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371438 )
      ( MAKE-6PILE ?auto_371438 ?auto_371439 ?auto_371440 ?auto_371441 ?auto_371442 ?auto_371443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_371451 - BLOCK
      ?auto_371452 - BLOCK
      ?auto_371453 - BLOCK
      ?auto_371454 - BLOCK
      ?auto_371455 - BLOCK
      ?auto_371456 - BLOCK
    )
    :vars
    (
      ?auto_371457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371456 ?auto_371457 ) ( not ( = ?auto_371451 ?auto_371452 ) ) ( not ( = ?auto_371451 ?auto_371453 ) ) ( not ( = ?auto_371451 ?auto_371454 ) ) ( not ( = ?auto_371451 ?auto_371455 ) ) ( not ( = ?auto_371451 ?auto_371456 ) ) ( not ( = ?auto_371451 ?auto_371457 ) ) ( not ( = ?auto_371452 ?auto_371453 ) ) ( not ( = ?auto_371452 ?auto_371454 ) ) ( not ( = ?auto_371452 ?auto_371455 ) ) ( not ( = ?auto_371452 ?auto_371456 ) ) ( not ( = ?auto_371452 ?auto_371457 ) ) ( not ( = ?auto_371453 ?auto_371454 ) ) ( not ( = ?auto_371453 ?auto_371455 ) ) ( not ( = ?auto_371453 ?auto_371456 ) ) ( not ( = ?auto_371453 ?auto_371457 ) ) ( not ( = ?auto_371454 ?auto_371455 ) ) ( not ( = ?auto_371454 ?auto_371456 ) ) ( not ( = ?auto_371454 ?auto_371457 ) ) ( not ( = ?auto_371455 ?auto_371456 ) ) ( not ( = ?auto_371455 ?auto_371457 ) ) ( not ( = ?auto_371456 ?auto_371457 ) ) ( ON ?auto_371455 ?auto_371456 ) ( ON ?auto_371454 ?auto_371455 ) ( ON ?auto_371453 ?auto_371454 ) ( ON ?auto_371452 ?auto_371453 ) ( ON ?auto_371451 ?auto_371452 ) ( CLEAR ?auto_371451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371451 )
      ( MAKE-6PILE ?auto_371451 ?auto_371452 ?auto_371453 ?auto_371454 ?auto_371455 ?auto_371456 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371465 - BLOCK
      ?auto_371466 - BLOCK
      ?auto_371467 - BLOCK
      ?auto_371468 - BLOCK
      ?auto_371469 - BLOCK
      ?auto_371470 - BLOCK
      ?auto_371471 - BLOCK
    )
    :vars
    (
      ?auto_371472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371470 ) ( ON ?auto_371471 ?auto_371472 ) ( CLEAR ?auto_371471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371465 ) ( ON ?auto_371466 ?auto_371465 ) ( ON ?auto_371467 ?auto_371466 ) ( ON ?auto_371468 ?auto_371467 ) ( ON ?auto_371469 ?auto_371468 ) ( ON ?auto_371470 ?auto_371469 ) ( not ( = ?auto_371465 ?auto_371466 ) ) ( not ( = ?auto_371465 ?auto_371467 ) ) ( not ( = ?auto_371465 ?auto_371468 ) ) ( not ( = ?auto_371465 ?auto_371469 ) ) ( not ( = ?auto_371465 ?auto_371470 ) ) ( not ( = ?auto_371465 ?auto_371471 ) ) ( not ( = ?auto_371465 ?auto_371472 ) ) ( not ( = ?auto_371466 ?auto_371467 ) ) ( not ( = ?auto_371466 ?auto_371468 ) ) ( not ( = ?auto_371466 ?auto_371469 ) ) ( not ( = ?auto_371466 ?auto_371470 ) ) ( not ( = ?auto_371466 ?auto_371471 ) ) ( not ( = ?auto_371466 ?auto_371472 ) ) ( not ( = ?auto_371467 ?auto_371468 ) ) ( not ( = ?auto_371467 ?auto_371469 ) ) ( not ( = ?auto_371467 ?auto_371470 ) ) ( not ( = ?auto_371467 ?auto_371471 ) ) ( not ( = ?auto_371467 ?auto_371472 ) ) ( not ( = ?auto_371468 ?auto_371469 ) ) ( not ( = ?auto_371468 ?auto_371470 ) ) ( not ( = ?auto_371468 ?auto_371471 ) ) ( not ( = ?auto_371468 ?auto_371472 ) ) ( not ( = ?auto_371469 ?auto_371470 ) ) ( not ( = ?auto_371469 ?auto_371471 ) ) ( not ( = ?auto_371469 ?auto_371472 ) ) ( not ( = ?auto_371470 ?auto_371471 ) ) ( not ( = ?auto_371470 ?auto_371472 ) ) ( not ( = ?auto_371471 ?auto_371472 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371471 ?auto_371472 )
      ( !STACK ?auto_371471 ?auto_371470 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371480 - BLOCK
      ?auto_371481 - BLOCK
      ?auto_371482 - BLOCK
      ?auto_371483 - BLOCK
      ?auto_371484 - BLOCK
      ?auto_371485 - BLOCK
      ?auto_371486 - BLOCK
    )
    :vars
    (
      ?auto_371487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371485 ) ( ON ?auto_371486 ?auto_371487 ) ( CLEAR ?auto_371486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371480 ) ( ON ?auto_371481 ?auto_371480 ) ( ON ?auto_371482 ?auto_371481 ) ( ON ?auto_371483 ?auto_371482 ) ( ON ?auto_371484 ?auto_371483 ) ( ON ?auto_371485 ?auto_371484 ) ( not ( = ?auto_371480 ?auto_371481 ) ) ( not ( = ?auto_371480 ?auto_371482 ) ) ( not ( = ?auto_371480 ?auto_371483 ) ) ( not ( = ?auto_371480 ?auto_371484 ) ) ( not ( = ?auto_371480 ?auto_371485 ) ) ( not ( = ?auto_371480 ?auto_371486 ) ) ( not ( = ?auto_371480 ?auto_371487 ) ) ( not ( = ?auto_371481 ?auto_371482 ) ) ( not ( = ?auto_371481 ?auto_371483 ) ) ( not ( = ?auto_371481 ?auto_371484 ) ) ( not ( = ?auto_371481 ?auto_371485 ) ) ( not ( = ?auto_371481 ?auto_371486 ) ) ( not ( = ?auto_371481 ?auto_371487 ) ) ( not ( = ?auto_371482 ?auto_371483 ) ) ( not ( = ?auto_371482 ?auto_371484 ) ) ( not ( = ?auto_371482 ?auto_371485 ) ) ( not ( = ?auto_371482 ?auto_371486 ) ) ( not ( = ?auto_371482 ?auto_371487 ) ) ( not ( = ?auto_371483 ?auto_371484 ) ) ( not ( = ?auto_371483 ?auto_371485 ) ) ( not ( = ?auto_371483 ?auto_371486 ) ) ( not ( = ?auto_371483 ?auto_371487 ) ) ( not ( = ?auto_371484 ?auto_371485 ) ) ( not ( = ?auto_371484 ?auto_371486 ) ) ( not ( = ?auto_371484 ?auto_371487 ) ) ( not ( = ?auto_371485 ?auto_371486 ) ) ( not ( = ?auto_371485 ?auto_371487 ) ) ( not ( = ?auto_371486 ?auto_371487 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371486 ?auto_371487 )
      ( !STACK ?auto_371486 ?auto_371485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371495 - BLOCK
      ?auto_371496 - BLOCK
      ?auto_371497 - BLOCK
      ?auto_371498 - BLOCK
      ?auto_371499 - BLOCK
      ?auto_371500 - BLOCK
      ?auto_371501 - BLOCK
    )
    :vars
    (
      ?auto_371502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371501 ?auto_371502 ) ( ON-TABLE ?auto_371495 ) ( ON ?auto_371496 ?auto_371495 ) ( ON ?auto_371497 ?auto_371496 ) ( ON ?auto_371498 ?auto_371497 ) ( ON ?auto_371499 ?auto_371498 ) ( not ( = ?auto_371495 ?auto_371496 ) ) ( not ( = ?auto_371495 ?auto_371497 ) ) ( not ( = ?auto_371495 ?auto_371498 ) ) ( not ( = ?auto_371495 ?auto_371499 ) ) ( not ( = ?auto_371495 ?auto_371500 ) ) ( not ( = ?auto_371495 ?auto_371501 ) ) ( not ( = ?auto_371495 ?auto_371502 ) ) ( not ( = ?auto_371496 ?auto_371497 ) ) ( not ( = ?auto_371496 ?auto_371498 ) ) ( not ( = ?auto_371496 ?auto_371499 ) ) ( not ( = ?auto_371496 ?auto_371500 ) ) ( not ( = ?auto_371496 ?auto_371501 ) ) ( not ( = ?auto_371496 ?auto_371502 ) ) ( not ( = ?auto_371497 ?auto_371498 ) ) ( not ( = ?auto_371497 ?auto_371499 ) ) ( not ( = ?auto_371497 ?auto_371500 ) ) ( not ( = ?auto_371497 ?auto_371501 ) ) ( not ( = ?auto_371497 ?auto_371502 ) ) ( not ( = ?auto_371498 ?auto_371499 ) ) ( not ( = ?auto_371498 ?auto_371500 ) ) ( not ( = ?auto_371498 ?auto_371501 ) ) ( not ( = ?auto_371498 ?auto_371502 ) ) ( not ( = ?auto_371499 ?auto_371500 ) ) ( not ( = ?auto_371499 ?auto_371501 ) ) ( not ( = ?auto_371499 ?auto_371502 ) ) ( not ( = ?auto_371500 ?auto_371501 ) ) ( not ( = ?auto_371500 ?auto_371502 ) ) ( not ( = ?auto_371501 ?auto_371502 ) ) ( CLEAR ?auto_371499 ) ( ON ?auto_371500 ?auto_371501 ) ( CLEAR ?auto_371500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_371495 ?auto_371496 ?auto_371497 ?auto_371498 ?auto_371499 ?auto_371500 )
      ( MAKE-7PILE ?auto_371495 ?auto_371496 ?auto_371497 ?auto_371498 ?auto_371499 ?auto_371500 ?auto_371501 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371510 - BLOCK
      ?auto_371511 - BLOCK
      ?auto_371512 - BLOCK
      ?auto_371513 - BLOCK
      ?auto_371514 - BLOCK
      ?auto_371515 - BLOCK
      ?auto_371516 - BLOCK
    )
    :vars
    (
      ?auto_371517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371516 ?auto_371517 ) ( ON-TABLE ?auto_371510 ) ( ON ?auto_371511 ?auto_371510 ) ( ON ?auto_371512 ?auto_371511 ) ( ON ?auto_371513 ?auto_371512 ) ( ON ?auto_371514 ?auto_371513 ) ( not ( = ?auto_371510 ?auto_371511 ) ) ( not ( = ?auto_371510 ?auto_371512 ) ) ( not ( = ?auto_371510 ?auto_371513 ) ) ( not ( = ?auto_371510 ?auto_371514 ) ) ( not ( = ?auto_371510 ?auto_371515 ) ) ( not ( = ?auto_371510 ?auto_371516 ) ) ( not ( = ?auto_371510 ?auto_371517 ) ) ( not ( = ?auto_371511 ?auto_371512 ) ) ( not ( = ?auto_371511 ?auto_371513 ) ) ( not ( = ?auto_371511 ?auto_371514 ) ) ( not ( = ?auto_371511 ?auto_371515 ) ) ( not ( = ?auto_371511 ?auto_371516 ) ) ( not ( = ?auto_371511 ?auto_371517 ) ) ( not ( = ?auto_371512 ?auto_371513 ) ) ( not ( = ?auto_371512 ?auto_371514 ) ) ( not ( = ?auto_371512 ?auto_371515 ) ) ( not ( = ?auto_371512 ?auto_371516 ) ) ( not ( = ?auto_371512 ?auto_371517 ) ) ( not ( = ?auto_371513 ?auto_371514 ) ) ( not ( = ?auto_371513 ?auto_371515 ) ) ( not ( = ?auto_371513 ?auto_371516 ) ) ( not ( = ?auto_371513 ?auto_371517 ) ) ( not ( = ?auto_371514 ?auto_371515 ) ) ( not ( = ?auto_371514 ?auto_371516 ) ) ( not ( = ?auto_371514 ?auto_371517 ) ) ( not ( = ?auto_371515 ?auto_371516 ) ) ( not ( = ?auto_371515 ?auto_371517 ) ) ( not ( = ?auto_371516 ?auto_371517 ) ) ( CLEAR ?auto_371514 ) ( ON ?auto_371515 ?auto_371516 ) ( CLEAR ?auto_371515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_371510 ?auto_371511 ?auto_371512 ?auto_371513 ?auto_371514 ?auto_371515 )
      ( MAKE-7PILE ?auto_371510 ?auto_371511 ?auto_371512 ?auto_371513 ?auto_371514 ?auto_371515 ?auto_371516 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371525 - BLOCK
      ?auto_371526 - BLOCK
      ?auto_371527 - BLOCK
      ?auto_371528 - BLOCK
      ?auto_371529 - BLOCK
      ?auto_371530 - BLOCK
      ?auto_371531 - BLOCK
    )
    :vars
    (
      ?auto_371532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371531 ?auto_371532 ) ( ON-TABLE ?auto_371525 ) ( ON ?auto_371526 ?auto_371525 ) ( ON ?auto_371527 ?auto_371526 ) ( ON ?auto_371528 ?auto_371527 ) ( not ( = ?auto_371525 ?auto_371526 ) ) ( not ( = ?auto_371525 ?auto_371527 ) ) ( not ( = ?auto_371525 ?auto_371528 ) ) ( not ( = ?auto_371525 ?auto_371529 ) ) ( not ( = ?auto_371525 ?auto_371530 ) ) ( not ( = ?auto_371525 ?auto_371531 ) ) ( not ( = ?auto_371525 ?auto_371532 ) ) ( not ( = ?auto_371526 ?auto_371527 ) ) ( not ( = ?auto_371526 ?auto_371528 ) ) ( not ( = ?auto_371526 ?auto_371529 ) ) ( not ( = ?auto_371526 ?auto_371530 ) ) ( not ( = ?auto_371526 ?auto_371531 ) ) ( not ( = ?auto_371526 ?auto_371532 ) ) ( not ( = ?auto_371527 ?auto_371528 ) ) ( not ( = ?auto_371527 ?auto_371529 ) ) ( not ( = ?auto_371527 ?auto_371530 ) ) ( not ( = ?auto_371527 ?auto_371531 ) ) ( not ( = ?auto_371527 ?auto_371532 ) ) ( not ( = ?auto_371528 ?auto_371529 ) ) ( not ( = ?auto_371528 ?auto_371530 ) ) ( not ( = ?auto_371528 ?auto_371531 ) ) ( not ( = ?auto_371528 ?auto_371532 ) ) ( not ( = ?auto_371529 ?auto_371530 ) ) ( not ( = ?auto_371529 ?auto_371531 ) ) ( not ( = ?auto_371529 ?auto_371532 ) ) ( not ( = ?auto_371530 ?auto_371531 ) ) ( not ( = ?auto_371530 ?auto_371532 ) ) ( not ( = ?auto_371531 ?auto_371532 ) ) ( ON ?auto_371530 ?auto_371531 ) ( CLEAR ?auto_371528 ) ( ON ?auto_371529 ?auto_371530 ) ( CLEAR ?auto_371529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_371525 ?auto_371526 ?auto_371527 ?auto_371528 ?auto_371529 )
      ( MAKE-7PILE ?auto_371525 ?auto_371526 ?auto_371527 ?auto_371528 ?auto_371529 ?auto_371530 ?auto_371531 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371540 - BLOCK
      ?auto_371541 - BLOCK
      ?auto_371542 - BLOCK
      ?auto_371543 - BLOCK
      ?auto_371544 - BLOCK
      ?auto_371545 - BLOCK
      ?auto_371546 - BLOCK
    )
    :vars
    (
      ?auto_371547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371546 ?auto_371547 ) ( ON-TABLE ?auto_371540 ) ( ON ?auto_371541 ?auto_371540 ) ( ON ?auto_371542 ?auto_371541 ) ( ON ?auto_371543 ?auto_371542 ) ( not ( = ?auto_371540 ?auto_371541 ) ) ( not ( = ?auto_371540 ?auto_371542 ) ) ( not ( = ?auto_371540 ?auto_371543 ) ) ( not ( = ?auto_371540 ?auto_371544 ) ) ( not ( = ?auto_371540 ?auto_371545 ) ) ( not ( = ?auto_371540 ?auto_371546 ) ) ( not ( = ?auto_371540 ?auto_371547 ) ) ( not ( = ?auto_371541 ?auto_371542 ) ) ( not ( = ?auto_371541 ?auto_371543 ) ) ( not ( = ?auto_371541 ?auto_371544 ) ) ( not ( = ?auto_371541 ?auto_371545 ) ) ( not ( = ?auto_371541 ?auto_371546 ) ) ( not ( = ?auto_371541 ?auto_371547 ) ) ( not ( = ?auto_371542 ?auto_371543 ) ) ( not ( = ?auto_371542 ?auto_371544 ) ) ( not ( = ?auto_371542 ?auto_371545 ) ) ( not ( = ?auto_371542 ?auto_371546 ) ) ( not ( = ?auto_371542 ?auto_371547 ) ) ( not ( = ?auto_371543 ?auto_371544 ) ) ( not ( = ?auto_371543 ?auto_371545 ) ) ( not ( = ?auto_371543 ?auto_371546 ) ) ( not ( = ?auto_371543 ?auto_371547 ) ) ( not ( = ?auto_371544 ?auto_371545 ) ) ( not ( = ?auto_371544 ?auto_371546 ) ) ( not ( = ?auto_371544 ?auto_371547 ) ) ( not ( = ?auto_371545 ?auto_371546 ) ) ( not ( = ?auto_371545 ?auto_371547 ) ) ( not ( = ?auto_371546 ?auto_371547 ) ) ( ON ?auto_371545 ?auto_371546 ) ( CLEAR ?auto_371543 ) ( ON ?auto_371544 ?auto_371545 ) ( CLEAR ?auto_371544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_371540 ?auto_371541 ?auto_371542 ?auto_371543 ?auto_371544 )
      ( MAKE-7PILE ?auto_371540 ?auto_371541 ?auto_371542 ?auto_371543 ?auto_371544 ?auto_371545 ?auto_371546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371555 - BLOCK
      ?auto_371556 - BLOCK
      ?auto_371557 - BLOCK
      ?auto_371558 - BLOCK
      ?auto_371559 - BLOCK
      ?auto_371560 - BLOCK
      ?auto_371561 - BLOCK
    )
    :vars
    (
      ?auto_371562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371561 ?auto_371562 ) ( ON-TABLE ?auto_371555 ) ( ON ?auto_371556 ?auto_371555 ) ( ON ?auto_371557 ?auto_371556 ) ( not ( = ?auto_371555 ?auto_371556 ) ) ( not ( = ?auto_371555 ?auto_371557 ) ) ( not ( = ?auto_371555 ?auto_371558 ) ) ( not ( = ?auto_371555 ?auto_371559 ) ) ( not ( = ?auto_371555 ?auto_371560 ) ) ( not ( = ?auto_371555 ?auto_371561 ) ) ( not ( = ?auto_371555 ?auto_371562 ) ) ( not ( = ?auto_371556 ?auto_371557 ) ) ( not ( = ?auto_371556 ?auto_371558 ) ) ( not ( = ?auto_371556 ?auto_371559 ) ) ( not ( = ?auto_371556 ?auto_371560 ) ) ( not ( = ?auto_371556 ?auto_371561 ) ) ( not ( = ?auto_371556 ?auto_371562 ) ) ( not ( = ?auto_371557 ?auto_371558 ) ) ( not ( = ?auto_371557 ?auto_371559 ) ) ( not ( = ?auto_371557 ?auto_371560 ) ) ( not ( = ?auto_371557 ?auto_371561 ) ) ( not ( = ?auto_371557 ?auto_371562 ) ) ( not ( = ?auto_371558 ?auto_371559 ) ) ( not ( = ?auto_371558 ?auto_371560 ) ) ( not ( = ?auto_371558 ?auto_371561 ) ) ( not ( = ?auto_371558 ?auto_371562 ) ) ( not ( = ?auto_371559 ?auto_371560 ) ) ( not ( = ?auto_371559 ?auto_371561 ) ) ( not ( = ?auto_371559 ?auto_371562 ) ) ( not ( = ?auto_371560 ?auto_371561 ) ) ( not ( = ?auto_371560 ?auto_371562 ) ) ( not ( = ?auto_371561 ?auto_371562 ) ) ( ON ?auto_371560 ?auto_371561 ) ( ON ?auto_371559 ?auto_371560 ) ( CLEAR ?auto_371557 ) ( ON ?auto_371558 ?auto_371559 ) ( CLEAR ?auto_371558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371555 ?auto_371556 ?auto_371557 ?auto_371558 )
      ( MAKE-7PILE ?auto_371555 ?auto_371556 ?auto_371557 ?auto_371558 ?auto_371559 ?auto_371560 ?auto_371561 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371570 - BLOCK
      ?auto_371571 - BLOCK
      ?auto_371572 - BLOCK
      ?auto_371573 - BLOCK
      ?auto_371574 - BLOCK
      ?auto_371575 - BLOCK
      ?auto_371576 - BLOCK
    )
    :vars
    (
      ?auto_371577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371576 ?auto_371577 ) ( ON-TABLE ?auto_371570 ) ( ON ?auto_371571 ?auto_371570 ) ( ON ?auto_371572 ?auto_371571 ) ( not ( = ?auto_371570 ?auto_371571 ) ) ( not ( = ?auto_371570 ?auto_371572 ) ) ( not ( = ?auto_371570 ?auto_371573 ) ) ( not ( = ?auto_371570 ?auto_371574 ) ) ( not ( = ?auto_371570 ?auto_371575 ) ) ( not ( = ?auto_371570 ?auto_371576 ) ) ( not ( = ?auto_371570 ?auto_371577 ) ) ( not ( = ?auto_371571 ?auto_371572 ) ) ( not ( = ?auto_371571 ?auto_371573 ) ) ( not ( = ?auto_371571 ?auto_371574 ) ) ( not ( = ?auto_371571 ?auto_371575 ) ) ( not ( = ?auto_371571 ?auto_371576 ) ) ( not ( = ?auto_371571 ?auto_371577 ) ) ( not ( = ?auto_371572 ?auto_371573 ) ) ( not ( = ?auto_371572 ?auto_371574 ) ) ( not ( = ?auto_371572 ?auto_371575 ) ) ( not ( = ?auto_371572 ?auto_371576 ) ) ( not ( = ?auto_371572 ?auto_371577 ) ) ( not ( = ?auto_371573 ?auto_371574 ) ) ( not ( = ?auto_371573 ?auto_371575 ) ) ( not ( = ?auto_371573 ?auto_371576 ) ) ( not ( = ?auto_371573 ?auto_371577 ) ) ( not ( = ?auto_371574 ?auto_371575 ) ) ( not ( = ?auto_371574 ?auto_371576 ) ) ( not ( = ?auto_371574 ?auto_371577 ) ) ( not ( = ?auto_371575 ?auto_371576 ) ) ( not ( = ?auto_371575 ?auto_371577 ) ) ( not ( = ?auto_371576 ?auto_371577 ) ) ( ON ?auto_371575 ?auto_371576 ) ( ON ?auto_371574 ?auto_371575 ) ( CLEAR ?auto_371572 ) ( ON ?auto_371573 ?auto_371574 ) ( CLEAR ?auto_371573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371570 ?auto_371571 ?auto_371572 ?auto_371573 )
      ( MAKE-7PILE ?auto_371570 ?auto_371571 ?auto_371572 ?auto_371573 ?auto_371574 ?auto_371575 ?auto_371576 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371585 - BLOCK
      ?auto_371586 - BLOCK
      ?auto_371587 - BLOCK
      ?auto_371588 - BLOCK
      ?auto_371589 - BLOCK
      ?auto_371590 - BLOCK
      ?auto_371591 - BLOCK
    )
    :vars
    (
      ?auto_371592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371591 ?auto_371592 ) ( ON-TABLE ?auto_371585 ) ( ON ?auto_371586 ?auto_371585 ) ( not ( = ?auto_371585 ?auto_371586 ) ) ( not ( = ?auto_371585 ?auto_371587 ) ) ( not ( = ?auto_371585 ?auto_371588 ) ) ( not ( = ?auto_371585 ?auto_371589 ) ) ( not ( = ?auto_371585 ?auto_371590 ) ) ( not ( = ?auto_371585 ?auto_371591 ) ) ( not ( = ?auto_371585 ?auto_371592 ) ) ( not ( = ?auto_371586 ?auto_371587 ) ) ( not ( = ?auto_371586 ?auto_371588 ) ) ( not ( = ?auto_371586 ?auto_371589 ) ) ( not ( = ?auto_371586 ?auto_371590 ) ) ( not ( = ?auto_371586 ?auto_371591 ) ) ( not ( = ?auto_371586 ?auto_371592 ) ) ( not ( = ?auto_371587 ?auto_371588 ) ) ( not ( = ?auto_371587 ?auto_371589 ) ) ( not ( = ?auto_371587 ?auto_371590 ) ) ( not ( = ?auto_371587 ?auto_371591 ) ) ( not ( = ?auto_371587 ?auto_371592 ) ) ( not ( = ?auto_371588 ?auto_371589 ) ) ( not ( = ?auto_371588 ?auto_371590 ) ) ( not ( = ?auto_371588 ?auto_371591 ) ) ( not ( = ?auto_371588 ?auto_371592 ) ) ( not ( = ?auto_371589 ?auto_371590 ) ) ( not ( = ?auto_371589 ?auto_371591 ) ) ( not ( = ?auto_371589 ?auto_371592 ) ) ( not ( = ?auto_371590 ?auto_371591 ) ) ( not ( = ?auto_371590 ?auto_371592 ) ) ( not ( = ?auto_371591 ?auto_371592 ) ) ( ON ?auto_371590 ?auto_371591 ) ( ON ?auto_371589 ?auto_371590 ) ( ON ?auto_371588 ?auto_371589 ) ( CLEAR ?auto_371586 ) ( ON ?auto_371587 ?auto_371588 ) ( CLEAR ?auto_371587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371585 ?auto_371586 ?auto_371587 )
      ( MAKE-7PILE ?auto_371585 ?auto_371586 ?auto_371587 ?auto_371588 ?auto_371589 ?auto_371590 ?auto_371591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371600 - BLOCK
      ?auto_371601 - BLOCK
      ?auto_371602 - BLOCK
      ?auto_371603 - BLOCK
      ?auto_371604 - BLOCK
      ?auto_371605 - BLOCK
      ?auto_371606 - BLOCK
    )
    :vars
    (
      ?auto_371607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371606 ?auto_371607 ) ( ON-TABLE ?auto_371600 ) ( ON ?auto_371601 ?auto_371600 ) ( not ( = ?auto_371600 ?auto_371601 ) ) ( not ( = ?auto_371600 ?auto_371602 ) ) ( not ( = ?auto_371600 ?auto_371603 ) ) ( not ( = ?auto_371600 ?auto_371604 ) ) ( not ( = ?auto_371600 ?auto_371605 ) ) ( not ( = ?auto_371600 ?auto_371606 ) ) ( not ( = ?auto_371600 ?auto_371607 ) ) ( not ( = ?auto_371601 ?auto_371602 ) ) ( not ( = ?auto_371601 ?auto_371603 ) ) ( not ( = ?auto_371601 ?auto_371604 ) ) ( not ( = ?auto_371601 ?auto_371605 ) ) ( not ( = ?auto_371601 ?auto_371606 ) ) ( not ( = ?auto_371601 ?auto_371607 ) ) ( not ( = ?auto_371602 ?auto_371603 ) ) ( not ( = ?auto_371602 ?auto_371604 ) ) ( not ( = ?auto_371602 ?auto_371605 ) ) ( not ( = ?auto_371602 ?auto_371606 ) ) ( not ( = ?auto_371602 ?auto_371607 ) ) ( not ( = ?auto_371603 ?auto_371604 ) ) ( not ( = ?auto_371603 ?auto_371605 ) ) ( not ( = ?auto_371603 ?auto_371606 ) ) ( not ( = ?auto_371603 ?auto_371607 ) ) ( not ( = ?auto_371604 ?auto_371605 ) ) ( not ( = ?auto_371604 ?auto_371606 ) ) ( not ( = ?auto_371604 ?auto_371607 ) ) ( not ( = ?auto_371605 ?auto_371606 ) ) ( not ( = ?auto_371605 ?auto_371607 ) ) ( not ( = ?auto_371606 ?auto_371607 ) ) ( ON ?auto_371605 ?auto_371606 ) ( ON ?auto_371604 ?auto_371605 ) ( ON ?auto_371603 ?auto_371604 ) ( CLEAR ?auto_371601 ) ( ON ?auto_371602 ?auto_371603 ) ( CLEAR ?auto_371602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371600 ?auto_371601 ?auto_371602 )
      ( MAKE-7PILE ?auto_371600 ?auto_371601 ?auto_371602 ?auto_371603 ?auto_371604 ?auto_371605 ?auto_371606 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371615 - BLOCK
      ?auto_371616 - BLOCK
      ?auto_371617 - BLOCK
      ?auto_371618 - BLOCK
      ?auto_371619 - BLOCK
      ?auto_371620 - BLOCK
      ?auto_371621 - BLOCK
    )
    :vars
    (
      ?auto_371622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371621 ?auto_371622 ) ( ON-TABLE ?auto_371615 ) ( not ( = ?auto_371615 ?auto_371616 ) ) ( not ( = ?auto_371615 ?auto_371617 ) ) ( not ( = ?auto_371615 ?auto_371618 ) ) ( not ( = ?auto_371615 ?auto_371619 ) ) ( not ( = ?auto_371615 ?auto_371620 ) ) ( not ( = ?auto_371615 ?auto_371621 ) ) ( not ( = ?auto_371615 ?auto_371622 ) ) ( not ( = ?auto_371616 ?auto_371617 ) ) ( not ( = ?auto_371616 ?auto_371618 ) ) ( not ( = ?auto_371616 ?auto_371619 ) ) ( not ( = ?auto_371616 ?auto_371620 ) ) ( not ( = ?auto_371616 ?auto_371621 ) ) ( not ( = ?auto_371616 ?auto_371622 ) ) ( not ( = ?auto_371617 ?auto_371618 ) ) ( not ( = ?auto_371617 ?auto_371619 ) ) ( not ( = ?auto_371617 ?auto_371620 ) ) ( not ( = ?auto_371617 ?auto_371621 ) ) ( not ( = ?auto_371617 ?auto_371622 ) ) ( not ( = ?auto_371618 ?auto_371619 ) ) ( not ( = ?auto_371618 ?auto_371620 ) ) ( not ( = ?auto_371618 ?auto_371621 ) ) ( not ( = ?auto_371618 ?auto_371622 ) ) ( not ( = ?auto_371619 ?auto_371620 ) ) ( not ( = ?auto_371619 ?auto_371621 ) ) ( not ( = ?auto_371619 ?auto_371622 ) ) ( not ( = ?auto_371620 ?auto_371621 ) ) ( not ( = ?auto_371620 ?auto_371622 ) ) ( not ( = ?auto_371621 ?auto_371622 ) ) ( ON ?auto_371620 ?auto_371621 ) ( ON ?auto_371619 ?auto_371620 ) ( ON ?auto_371618 ?auto_371619 ) ( ON ?auto_371617 ?auto_371618 ) ( CLEAR ?auto_371615 ) ( ON ?auto_371616 ?auto_371617 ) ( CLEAR ?auto_371616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371615 ?auto_371616 )
      ( MAKE-7PILE ?auto_371615 ?auto_371616 ?auto_371617 ?auto_371618 ?auto_371619 ?auto_371620 ?auto_371621 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371630 - BLOCK
      ?auto_371631 - BLOCK
      ?auto_371632 - BLOCK
      ?auto_371633 - BLOCK
      ?auto_371634 - BLOCK
      ?auto_371635 - BLOCK
      ?auto_371636 - BLOCK
    )
    :vars
    (
      ?auto_371637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371636 ?auto_371637 ) ( ON-TABLE ?auto_371630 ) ( not ( = ?auto_371630 ?auto_371631 ) ) ( not ( = ?auto_371630 ?auto_371632 ) ) ( not ( = ?auto_371630 ?auto_371633 ) ) ( not ( = ?auto_371630 ?auto_371634 ) ) ( not ( = ?auto_371630 ?auto_371635 ) ) ( not ( = ?auto_371630 ?auto_371636 ) ) ( not ( = ?auto_371630 ?auto_371637 ) ) ( not ( = ?auto_371631 ?auto_371632 ) ) ( not ( = ?auto_371631 ?auto_371633 ) ) ( not ( = ?auto_371631 ?auto_371634 ) ) ( not ( = ?auto_371631 ?auto_371635 ) ) ( not ( = ?auto_371631 ?auto_371636 ) ) ( not ( = ?auto_371631 ?auto_371637 ) ) ( not ( = ?auto_371632 ?auto_371633 ) ) ( not ( = ?auto_371632 ?auto_371634 ) ) ( not ( = ?auto_371632 ?auto_371635 ) ) ( not ( = ?auto_371632 ?auto_371636 ) ) ( not ( = ?auto_371632 ?auto_371637 ) ) ( not ( = ?auto_371633 ?auto_371634 ) ) ( not ( = ?auto_371633 ?auto_371635 ) ) ( not ( = ?auto_371633 ?auto_371636 ) ) ( not ( = ?auto_371633 ?auto_371637 ) ) ( not ( = ?auto_371634 ?auto_371635 ) ) ( not ( = ?auto_371634 ?auto_371636 ) ) ( not ( = ?auto_371634 ?auto_371637 ) ) ( not ( = ?auto_371635 ?auto_371636 ) ) ( not ( = ?auto_371635 ?auto_371637 ) ) ( not ( = ?auto_371636 ?auto_371637 ) ) ( ON ?auto_371635 ?auto_371636 ) ( ON ?auto_371634 ?auto_371635 ) ( ON ?auto_371633 ?auto_371634 ) ( ON ?auto_371632 ?auto_371633 ) ( CLEAR ?auto_371630 ) ( ON ?auto_371631 ?auto_371632 ) ( CLEAR ?auto_371631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371630 ?auto_371631 )
      ( MAKE-7PILE ?auto_371630 ?auto_371631 ?auto_371632 ?auto_371633 ?auto_371634 ?auto_371635 ?auto_371636 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371645 - BLOCK
      ?auto_371646 - BLOCK
      ?auto_371647 - BLOCK
      ?auto_371648 - BLOCK
      ?auto_371649 - BLOCK
      ?auto_371650 - BLOCK
      ?auto_371651 - BLOCK
    )
    :vars
    (
      ?auto_371652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371651 ?auto_371652 ) ( not ( = ?auto_371645 ?auto_371646 ) ) ( not ( = ?auto_371645 ?auto_371647 ) ) ( not ( = ?auto_371645 ?auto_371648 ) ) ( not ( = ?auto_371645 ?auto_371649 ) ) ( not ( = ?auto_371645 ?auto_371650 ) ) ( not ( = ?auto_371645 ?auto_371651 ) ) ( not ( = ?auto_371645 ?auto_371652 ) ) ( not ( = ?auto_371646 ?auto_371647 ) ) ( not ( = ?auto_371646 ?auto_371648 ) ) ( not ( = ?auto_371646 ?auto_371649 ) ) ( not ( = ?auto_371646 ?auto_371650 ) ) ( not ( = ?auto_371646 ?auto_371651 ) ) ( not ( = ?auto_371646 ?auto_371652 ) ) ( not ( = ?auto_371647 ?auto_371648 ) ) ( not ( = ?auto_371647 ?auto_371649 ) ) ( not ( = ?auto_371647 ?auto_371650 ) ) ( not ( = ?auto_371647 ?auto_371651 ) ) ( not ( = ?auto_371647 ?auto_371652 ) ) ( not ( = ?auto_371648 ?auto_371649 ) ) ( not ( = ?auto_371648 ?auto_371650 ) ) ( not ( = ?auto_371648 ?auto_371651 ) ) ( not ( = ?auto_371648 ?auto_371652 ) ) ( not ( = ?auto_371649 ?auto_371650 ) ) ( not ( = ?auto_371649 ?auto_371651 ) ) ( not ( = ?auto_371649 ?auto_371652 ) ) ( not ( = ?auto_371650 ?auto_371651 ) ) ( not ( = ?auto_371650 ?auto_371652 ) ) ( not ( = ?auto_371651 ?auto_371652 ) ) ( ON ?auto_371650 ?auto_371651 ) ( ON ?auto_371649 ?auto_371650 ) ( ON ?auto_371648 ?auto_371649 ) ( ON ?auto_371647 ?auto_371648 ) ( ON ?auto_371646 ?auto_371647 ) ( ON ?auto_371645 ?auto_371646 ) ( CLEAR ?auto_371645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371645 )
      ( MAKE-7PILE ?auto_371645 ?auto_371646 ?auto_371647 ?auto_371648 ?auto_371649 ?auto_371650 ?auto_371651 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_371660 - BLOCK
      ?auto_371661 - BLOCK
      ?auto_371662 - BLOCK
      ?auto_371663 - BLOCK
      ?auto_371664 - BLOCK
      ?auto_371665 - BLOCK
      ?auto_371666 - BLOCK
    )
    :vars
    (
      ?auto_371667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371666 ?auto_371667 ) ( not ( = ?auto_371660 ?auto_371661 ) ) ( not ( = ?auto_371660 ?auto_371662 ) ) ( not ( = ?auto_371660 ?auto_371663 ) ) ( not ( = ?auto_371660 ?auto_371664 ) ) ( not ( = ?auto_371660 ?auto_371665 ) ) ( not ( = ?auto_371660 ?auto_371666 ) ) ( not ( = ?auto_371660 ?auto_371667 ) ) ( not ( = ?auto_371661 ?auto_371662 ) ) ( not ( = ?auto_371661 ?auto_371663 ) ) ( not ( = ?auto_371661 ?auto_371664 ) ) ( not ( = ?auto_371661 ?auto_371665 ) ) ( not ( = ?auto_371661 ?auto_371666 ) ) ( not ( = ?auto_371661 ?auto_371667 ) ) ( not ( = ?auto_371662 ?auto_371663 ) ) ( not ( = ?auto_371662 ?auto_371664 ) ) ( not ( = ?auto_371662 ?auto_371665 ) ) ( not ( = ?auto_371662 ?auto_371666 ) ) ( not ( = ?auto_371662 ?auto_371667 ) ) ( not ( = ?auto_371663 ?auto_371664 ) ) ( not ( = ?auto_371663 ?auto_371665 ) ) ( not ( = ?auto_371663 ?auto_371666 ) ) ( not ( = ?auto_371663 ?auto_371667 ) ) ( not ( = ?auto_371664 ?auto_371665 ) ) ( not ( = ?auto_371664 ?auto_371666 ) ) ( not ( = ?auto_371664 ?auto_371667 ) ) ( not ( = ?auto_371665 ?auto_371666 ) ) ( not ( = ?auto_371665 ?auto_371667 ) ) ( not ( = ?auto_371666 ?auto_371667 ) ) ( ON ?auto_371665 ?auto_371666 ) ( ON ?auto_371664 ?auto_371665 ) ( ON ?auto_371663 ?auto_371664 ) ( ON ?auto_371662 ?auto_371663 ) ( ON ?auto_371661 ?auto_371662 ) ( ON ?auto_371660 ?auto_371661 ) ( CLEAR ?auto_371660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371660 )
      ( MAKE-7PILE ?auto_371660 ?auto_371661 ?auto_371662 ?auto_371663 ?auto_371664 ?auto_371665 ?auto_371666 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371676 - BLOCK
      ?auto_371677 - BLOCK
      ?auto_371678 - BLOCK
      ?auto_371679 - BLOCK
      ?auto_371680 - BLOCK
      ?auto_371681 - BLOCK
      ?auto_371682 - BLOCK
      ?auto_371683 - BLOCK
    )
    :vars
    (
      ?auto_371684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371682 ) ( ON ?auto_371683 ?auto_371684 ) ( CLEAR ?auto_371683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371676 ) ( ON ?auto_371677 ?auto_371676 ) ( ON ?auto_371678 ?auto_371677 ) ( ON ?auto_371679 ?auto_371678 ) ( ON ?auto_371680 ?auto_371679 ) ( ON ?auto_371681 ?auto_371680 ) ( ON ?auto_371682 ?auto_371681 ) ( not ( = ?auto_371676 ?auto_371677 ) ) ( not ( = ?auto_371676 ?auto_371678 ) ) ( not ( = ?auto_371676 ?auto_371679 ) ) ( not ( = ?auto_371676 ?auto_371680 ) ) ( not ( = ?auto_371676 ?auto_371681 ) ) ( not ( = ?auto_371676 ?auto_371682 ) ) ( not ( = ?auto_371676 ?auto_371683 ) ) ( not ( = ?auto_371676 ?auto_371684 ) ) ( not ( = ?auto_371677 ?auto_371678 ) ) ( not ( = ?auto_371677 ?auto_371679 ) ) ( not ( = ?auto_371677 ?auto_371680 ) ) ( not ( = ?auto_371677 ?auto_371681 ) ) ( not ( = ?auto_371677 ?auto_371682 ) ) ( not ( = ?auto_371677 ?auto_371683 ) ) ( not ( = ?auto_371677 ?auto_371684 ) ) ( not ( = ?auto_371678 ?auto_371679 ) ) ( not ( = ?auto_371678 ?auto_371680 ) ) ( not ( = ?auto_371678 ?auto_371681 ) ) ( not ( = ?auto_371678 ?auto_371682 ) ) ( not ( = ?auto_371678 ?auto_371683 ) ) ( not ( = ?auto_371678 ?auto_371684 ) ) ( not ( = ?auto_371679 ?auto_371680 ) ) ( not ( = ?auto_371679 ?auto_371681 ) ) ( not ( = ?auto_371679 ?auto_371682 ) ) ( not ( = ?auto_371679 ?auto_371683 ) ) ( not ( = ?auto_371679 ?auto_371684 ) ) ( not ( = ?auto_371680 ?auto_371681 ) ) ( not ( = ?auto_371680 ?auto_371682 ) ) ( not ( = ?auto_371680 ?auto_371683 ) ) ( not ( = ?auto_371680 ?auto_371684 ) ) ( not ( = ?auto_371681 ?auto_371682 ) ) ( not ( = ?auto_371681 ?auto_371683 ) ) ( not ( = ?auto_371681 ?auto_371684 ) ) ( not ( = ?auto_371682 ?auto_371683 ) ) ( not ( = ?auto_371682 ?auto_371684 ) ) ( not ( = ?auto_371683 ?auto_371684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371683 ?auto_371684 )
      ( !STACK ?auto_371683 ?auto_371682 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371693 - BLOCK
      ?auto_371694 - BLOCK
      ?auto_371695 - BLOCK
      ?auto_371696 - BLOCK
      ?auto_371697 - BLOCK
      ?auto_371698 - BLOCK
      ?auto_371699 - BLOCK
      ?auto_371700 - BLOCK
    )
    :vars
    (
      ?auto_371701 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371699 ) ( ON ?auto_371700 ?auto_371701 ) ( CLEAR ?auto_371700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371693 ) ( ON ?auto_371694 ?auto_371693 ) ( ON ?auto_371695 ?auto_371694 ) ( ON ?auto_371696 ?auto_371695 ) ( ON ?auto_371697 ?auto_371696 ) ( ON ?auto_371698 ?auto_371697 ) ( ON ?auto_371699 ?auto_371698 ) ( not ( = ?auto_371693 ?auto_371694 ) ) ( not ( = ?auto_371693 ?auto_371695 ) ) ( not ( = ?auto_371693 ?auto_371696 ) ) ( not ( = ?auto_371693 ?auto_371697 ) ) ( not ( = ?auto_371693 ?auto_371698 ) ) ( not ( = ?auto_371693 ?auto_371699 ) ) ( not ( = ?auto_371693 ?auto_371700 ) ) ( not ( = ?auto_371693 ?auto_371701 ) ) ( not ( = ?auto_371694 ?auto_371695 ) ) ( not ( = ?auto_371694 ?auto_371696 ) ) ( not ( = ?auto_371694 ?auto_371697 ) ) ( not ( = ?auto_371694 ?auto_371698 ) ) ( not ( = ?auto_371694 ?auto_371699 ) ) ( not ( = ?auto_371694 ?auto_371700 ) ) ( not ( = ?auto_371694 ?auto_371701 ) ) ( not ( = ?auto_371695 ?auto_371696 ) ) ( not ( = ?auto_371695 ?auto_371697 ) ) ( not ( = ?auto_371695 ?auto_371698 ) ) ( not ( = ?auto_371695 ?auto_371699 ) ) ( not ( = ?auto_371695 ?auto_371700 ) ) ( not ( = ?auto_371695 ?auto_371701 ) ) ( not ( = ?auto_371696 ?auto_371697 ) ) ( not ( = ?auto_371696 ?auto_371698 ) ) ( not ( = ?auto_371696 ?auto_371699 ) ) ( not ( = ?auto_371696 ?auto_371700 ) ) ( not ( = ?auto_371696 ?auto_371701 ) ) ( not ( = ?auto_371697 ?auto_371698 ) ) ( not ( = ?auto_371697 ?auto_371699 ) ) ( not ( = ?auto_371697 ?auto_371700 ) ) ( not ( = ?auto_371697 ?auto_371701 ) ) ( not ( = ?auto_371698 ?auto_371699 ) ) ( not ( = ?auto_371698 ?auto_371700 ) ) ( not ( = ?auto_371698 ?auto_371701 ) ) ( not ( = ?auto_371699 ?auto_371700 ) ) ( not ( = ?auto_371699 ?auto_371701 ) ) ( not ( = ?auto_371700 ?auto_371701 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371700 ?auto_371701 )
      ( !STACK ?auto_371700 ?auto_371699 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371710 - BLOCK
      ?auto_371711 - BLOCK
      ?auto_371712 - BLOCK
      ?auto_371713 - BLOCK
      ?auto_371714 - BLOCK
      ?auto_371715 - BLOCK
      ?auto_371716 - BLOCK
      ?auto_371717 - BLOCK
    )
    :vars
    (
      ?auto_371718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371717 ?auto_371718 ) ( ON-TABLE ?auto_371710 ) ( ON ?auto_371711 ?auto_371710 ) ( ON ?auto_371712 ?auto_371711 ) ( ON ?auto_371713 ?auto_371712 ) ( ON ?auto_371714 ?auto_371713 ) ( ON ?auto_371715 ?auto_371714 ) ( not ( = ?auto_371710 ?auto_371711 ) ) ( not ( = ?auto_371710 ?auto_371712 ) ) ( not ( = ?auto_371710 ?auto_371713 ) ) ( not ( = ?auto_371710 ?auto_371714 ) ) ( not ( = ?auto_371710 ?auto_371715 ) ) ( not ( = ?auto_371710 ?auto_371716 ) ) ( not ( = ?auto_371710 ?auto_371717 ) ) ( not ( = ?auto_371710 ?auto_371718 ) ) ( not ( = ?auto_371711 ?auto_371712 ) ) ( not ( = ?auto_371711 ?auto_371713 ) ) ( not ( = ?auto_371711 ?auto_371714 ) ) ( not ( = ?auto_371711 ?auto_371715 ) ) ( not ( = ?auto_371711 ?auto_371716 ) ) ( not ( = ?auto_371711 ?auto_371717 ) ) ( not ( = ?auto_371711 ?auto_371718 ) ) ( not ( = ?auto_371712 ?auto_371713 ) ) ( not ( = ?auto_371712 ?auto_371714 ) ) ( not ( = ?auto_371712 ?auto_371715 ) ) ( not ( = ?auto_371712 ?auto_371716 ) ) ( not ( = ?auto_371712 ?auto_371717 ) ) ( not ( = ?auto_371712 ?auto_371718 ) ) ( not ( = ?auto_371713 ?auto_371714 ) ) ( not ( = ?auto_371713 ?auto_371715 ) ) ( not ( = ?auto_371713 ?auto_371716 ) ) ( not ( = ?auto_371713 ?auto_371717 ) ) ( not ( = ?auto_371713 ?auto_371718 ) ) ( not ( = ?auto_371714 ?auto_371715 ) ) ( not ( = ?auto_371714 ?auto_371716 ) ) ( not ( = ?auto_371714 ?auto_371717 ) ) ( not ( = ?auto_371714 ?auto_371718 ) ) ( not ( = ?auto_371715 ?auto_371716 ) ) ( not ( = ?auto_371715 ?auto_371717 ) ) ( not ( = ?auto_371715 ?auto_371718 ) ) ( not ( = ?auto_371716 ?auto_371717 ) ) ( not ( = ?auto_371716 ?auto_371718 ) ) ( not ( = ?auto_371717 ?auto_371718 ) ) ( CLEAR ?auto_371715 ) ( ON ?auto_371716 ?auto_371717 ) ( CLEAR ?auto_371716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_371710 ?auto_371711 ?auto_371712 ?auto_371713 ?auto_371714 ?auto_371715 ?auto_371716 )
      ( MAKE-8PILE ?auto_371710 ?auto_371711 ?auto_371712 ?auto_371713 ?auto_371714 ?auto_371715 ?auto_371716 ?auto_371717 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371727 - BLOCK
      ?auto_371728 - BLOCK
      ?auto_371729 - BLOCK
      ?auto_371730 - BLOCK
      ?auto_371731 - BLOCK
      ?auto_371732 - BLOCK
      ?auto_371733 - BLOCK
      ?auto_371734 - BLOCK
    )
    :vars
    (
      ?auto_371735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371734 ?auto_371735 ) ( ON-TABLE ?auto_371727 ) ( ON ?auto_371728 ?auto_371727 ) ( ON ?auto_371729 ?auto_371728 ) ( ON ?auto_371730 ?auto_371729 ) ( ON ?auto_371731 ?auto_371730 ) ( ON ?auto_371732 ?auto_371731 ) ( not ( = ?auto_371727 ?auto_371728 ) ) ( not ( = ?auto_371727 ?auto_371729 ) ) ( not ( = ?auto_371727 ?auto_371730 ) ) ( not ( = ?auto_371727 ?auto_371731 ) ) ( not ( = ?auto_371727 ?auto_371732 ) ) ( not ( = ?auto_371727 ?auto_371733 ) ) ( not ( = ?auto_371727 ?auto_371734 ) ) ( not ( = ?auto_371727 ?auto_371735 ) ) ( not ( = ?auto_371728 ?auto_371729 ) ) ( not ( = ?auto_371728 ?auto_371730 ) ) ( not ( = ?auto_371728 ?auto_371731 ) ) ( not ( = ?auto_371728 ?auto_371732 ) ) ( not ( = ?auto_371728 ?auto_371733 ) ) ( not ( = ?auto_371728 ?auto_371734 ) ) ( not ( = ?auto_371728 ?auto_371735 ) ) ( not ( = ?auto_371729 ?auto_371730 ) ) ( not ( = ?auto_371729 ?auto_371731 ) ) ( not ( = ?auto_371729 ?auto_371732 ) ) ( not ( = ?auto_371729 ?auto_371733 ) ) ( not ( = ?auto_371729 ?auto_371734 ) ) ( not ( = ?auto_371729 ?auto_371735 ) ) ( not ( = ?auto_371730 ?auto_371731 ) ) ( not ( = ?auto_371730 ?auto_371732 ) ) ( not ( = ?auto_371730 ?auto_371733 ) ) ( not ( = ?auto_371730 ?auto_371734 ) ) ( not ( = ?auto_371730 ?auto_371735 ) ) ( not ( = ?auto_371731 ?auto_371732 ) ) ( not ( = ?auto_371731 ?auto_371733 ) ) ( not ( = ?auto_371731 ?auto_371734 ) ) ( not ( = ?auto_371731 ?auto_371735 ) ) ( not ( = ?auto_371732 ?auto_371733 ) ) ( not ( = ?auto_371732 ?auto_371734 ) ) ( not ( = ?auto_371732 ?auto_371735 ) ) ( not ( = ?auto_371733 ?auto_371734 ) ) ( not ( = ?auto_371733 ?auto_371735 ) ) ( not ( = ?auto_371734 ?auto_371735 ) ) ( CLEAR ?auto_371732 ) ( ON ?auto_371733 ?auto_371734 ) ( CLEAR ?auto_371733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_371727 ?auto_371728 ?auto_371729 ?auto_371730 ?auto_371731 ?auto_371732 ?auto_371733 )
      ( MAKE-8PILE ?auto_371727 ?auto_371728 ?auto_371729 ?auto_371730 ?auto_371731 ?auto_371732 ?auto_371733 ?auto_371734 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371744 - BLOCK
      ?auto_371745 - BLOCK
      ?auto_371746 - BLOCK
      ?auto_371747 - BLOCK
      ?auto_371748 - BLOCK
      ?auto_371749 - BLOCK
      ?auto_371750 - BLOCK
      ?auto_371751 - BLOCK
    )
    :vars
    (
      ?auto_371752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371751 ?auto_371752 ) ( ON-TABLE ?auto_371744 ) ( ON ?auto_371745 ?auto_371744 ) ( ON ?auto_371746 ?auto_371745 ) ( ON ?auto_371747 ?auto_371746 ) ( ON ?auto_371748 ?auto_371747 ) ( not ( = ?auto_371744 ?auto_371745 ) ) ( not ( = ?auto_371744 ?auto_371746 ) ) ( not ( = ?auto_371744 ?auto_371747 ) ) ( not ( = ?auto_371744 ?auto_371748 ) ) ( not ( = ?auto_371744 ?auto_371749 ) ) ( not ( = ?auto_371744 ?auto_371750 ) ) ( not ( = ?auto_371744 ?auto_371751 ) ) ( not ( = ?auto_371744 ?auto_371752 ) ) ( not ( = ?auto_371745 ?auto_371746 ) ) ( not ( = ?auto_371745 ?auto_371747 ) ) ( not ( = ?auto_371745 ?auto_371748 ) ) ( not ( = ?auto_371745 ?auto_371749 ) ) ( not ( = ?auto_371745 ?auto_371750 ) ) ( not ( = ?auto_371745 ?auto_371751 ) ) ( not ( = ?auto_371745 ?auto_371752 ) ) ( not ( = ?auto_371746 ?auto_371747 ) ) ( not ( = ?auto_371746 ?auto_371748 ) ) ( not ( = ?auto_371746 ?auto_371749 ) ) ( not ( = ?auto_371746 ?auto_371750 ) ) ( not ( = ?auto_371746 ?auto_371751 ) ) ( not ( = ?auto_371746 ?auto_371752 ) ) ( not ( = ?auto_371747 ?auto_371748 ) ) ( not ( = ?auto_371747 ?auto_371749 ) ) ( not ( = ?auto_371747 ?auto_371750 ) ) ( not ( = ?auto_371747 ?auto_371751 ) ) ( not ( = ?auto_371747 ?auto_371752 ) ) ( not ( = ?auto_371748 ?auto_371749 ) ) ( not ( = ?auto_371748 ?auto_371750 ) ) ( not ( = ?auto_371748 ?auto_371751 ) ) ( not ( = ?auto_371748 ?auto_371752 ) ) ( not ( = ?auto_371749 ?auto_371750 ) ) ( not ( = ?auto_371749 ?auto_371751 ) ) ( not ( = ?auto_371749 ?auto_371752 ) ) ( not ( = ?auto_371750 ?auto_371751 ) ) ( not ( = ?auto_371750 ?auto_371752 ) ) ( not ( = ?auto_371751 ?auto_371752 ) ) ( ON ?auto_371750 ?auto_371751 ) ( CLEAR ?auto_371748 ) ( ON ?auto_371749 ?auto_371750 ) ( CLEAR ?auto_371749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_371744 ?auto_371745 ?auto_371746 ?auto_371747 ?auto_371748 ?auto_371749 )
      ( MAKE-8PILE ?auto_371744 ?auto_371745 ?auto_371746 ?auto_371747 ?auto_371748 ?auto_371749 ?auto_371750 ?auto_371751 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371761 - BLOCK
      ?auto_371762 - BLOCK
      ?auto_371763 - BLOCK
      ?auto_371764 - BLOCK
      ?auto_371765 - BLOCK
      ?auto_371766 - BLOCK
      ?auto_371767 - BLOCK
      ?auto_371768 - BLOCK
    )
    :vars
    (
      ?auto_371769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371768 ?auto_371769 ) ( ON-TABLE ?auto_371761 ) ( ON ?auto_371762 ?auto_371761 ) ( ON ?auto_371763 ?auto_371762 ) ( ON ?auto_371764 ?auto_371763 ) ( ON ?auto_371765 ?auto_371764 ) ( not ( = ?auto_371761 ?auto_371762 ) ) ( not ( = ?auto_371761 ?auto_371763 ) ) ( not ( = ?auto_371761 ?auto_371764 ) ) ( not ( = ?auto_371761 ?auto_371765 ) ) ( not ( = ?auto_371761 ?auto_371766 ) ) ( not ( = ?auto_371761 ?auto_371767 ) ) ( not ( = ?auto_371761 ?auto_371768 ) ) ( not ( = ?auto_371761 ?auto_371769 ) ) ( not ( = ?auto_371762 ?auto_371763 ) ) ( not ( = ?auto_371762 ?auto_371764 ) ) ( not ( = ?auto_371762 ?auto_371765 ) ) ( not ( = ?auto_371762 ?auto_371766 ) ) ( not ( = ?auto_371762 ?auto_371767 ) ) ( not ( = ?auto_371762 ?auto_371768 ) ) ( not ( = ?auto_371762 ?auto_371769 ) ) ( not ( = ?auto_371763 ?auto_371764 ) ) ( not ( = ?auto_371763 ?auto_371765 ) ) ( not ( = ?auto_371763 ?auto_371766 ) ) ( not ( = ?auto_371763 ?auto_371767 ) ) ( not ( = ?auto_371763 ?auto_371768 ) ) ( not ( = ?auto_371763 ?auto_371769 ) ) ( not ( = ?auto_371764 ?auto_371765 ) ) ( not ( = ?auto_371764 ?auto_371766 ) ) ( not ( = ?auto_371764 ?auto_371767 ) ) ( not ( = ?auto_371764 ?auto_371768 ) ) ( not ( = ?auto_371764 ?auto_371769 ) ) ( not ( = ?auto_371765 ?auto_371766 ) ) ( not ( = ?auto_371765 ?auto_371767 ) ) ( not ( = ?auto_371765 ?auto_371768 ) ) ( not ( = ?auto_371765 ?auto_371769 ) ) ( not ( = ?auto_371766 ?auto_371767 ) ) ( not ( = ?auto_371766 ?auto_371768 ) ) ( not ( = ?auto_371766 ?auto_371769 ) ) ( not ( = ?auto_371767 ?auto_371768 ) ) ( not ( = ?auto_371767 ?auto_371769 ) ) ( not ( = ?auto_371768 ?auto_371769 ) ) ( ON ?auto_371767 ?auto_371768 ) ( CLEAR ?auto_371765 ) ( ON ?auto_371766 ?auto_371767 ) ( CLEAR ?auto_371766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_371761 ?auto_371762 ?auto_371763 ?auto_371764 ?auto_371765 ?auto_371766 )
      ( MAKE-8PILE ?auto_371761 ?auto_371762 ?auto_371763 ?auto_371764 ?auto_371765 ?auto_371766 ?auto_371767 ?auto_371768 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371778 - BLOCK
      ?auto_371779 - BLOCK
      ?auto_371780 - BLOCK
      ?auto_371781 - BLOCK
      ?auto_371782 - BLOCK
      ?auto_371783 - BLOCK
      ?auto_371784 - BLOCK
      ?auto_371785 - BLOCK
    )
    :vars
    (
      ?auto_371786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371785 ?auto_371786 ) ( ON-TABLE ?auto_371778 ) ( ON ?auto_371779 ?auto_371778 ) ( ON ?auto_371780 ?auto_371779 ) ( ON ?auto_371781 ?auto_371780 ) ( not ( = ?auto_371778 ?auto_371779 ) ) ( not ( = ?auto_371778 ?auto_371780 ) ) ( not ( = ?auto_371778 ?auto_371781 ) ) ( not ( = ?auto_371778 ?auto_371782 ) ) ( not ( = ?auto_371778 ?auto_371783 ) ) ( not ( = ?auto_371778 ?auto_371784 ) ) ( not ( = ?auto_371778 ?auto_371785 ) ) ( not ( = ?auto_371778 ?auto_371786 ) ) ( not ( = ?auto_371779 ?auto_371780 ) ) ( not ( = ?auto_371779 ?auto_371781 ) ) ( not ( = ?auto_371779 ?auto_371782 ) ) ( not ( = ?auto_371779 ?auto_371783 ) ) ( not ( = ?auto_371779 ?auto_371784 ) ) ( not ( = ?auto_371779 ?auto_371785 ) ) ( not ( = ?auto_371779 ?auto_371786 ) ) ( not ( = ?auto_371780 ?auto_371781 ) ) ( not ( = ?auto_371780 ?auto_371782 ) ) ( not ( = ?auto_371780 ?auto_371783 ) ) ( not ( = ?auto_371780 ?auto_371784 ) ) ( not ( = ?auto_371780 ?auto_371785 ) ) ( not ( = ?auto_371780 ?auto_371786 ) ) ( not ( = ?auto_371781 ?auto_371782 ) ) ( not ( = ?auto_371781 ?auto_371783 ) ) ( not ( = ?auto_371781 ?auto_371784 ) ) ( not ( = ?auto_371781 ?auto_371785 ) ) ( not ( = ?auto_371781 ?auto_371786 ) ) ( not ( = ?auto_371782 ?auto_371783 ) ) ( not ( = ?auto_371782 ?auto_371784 ) ) ( not ( = ?auto_371782 ?auto_371785 ) ) ( not ( = ?auto_371782 ?auto_371786 ) ) ( not ( = ?auto_371783 ?auto_371784 ) ) ( not ( = ?auto_371783 ?auto_371785 ) ) ( not ( = ?auto_371783 ?auto_371786 ) ) ( not ( = ?auto_371784 ?auto_371785 ) ) ( not ( = ?auto_371784 ?auto_371786 ) ) ( not ( = ?auto_371785 ?auto_371786 ) ) ( ON ?auto_371784 ?auto_371785 ) ( ON ?auto_371783 ?auto_371784 ) ( CLEAR ?auto_371781 ) ( ON ?auto_371782 ?auto_371783 ) ( CLEAR ?auto_371782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_371778 ?auto_371779 ?auto_371780 ?auto_371781 ?auto_371782 )
      ( MAKE-8PILE ?auto_371778 ?auto_371779 ?auto_371780 ?auto_371781 ?auto_371782 ?auto_371783 ?auto_371784 ?auto_371785 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371795 - BLOCK
      ?auto_371796 - BLOCK
      ?auto_371797 - BLOCK
      ?auto_371798 - BLOCK
      ?auto_371799 - BLOCK
      ?auto_371800 - BLOCK
      ?auto_371801 - BLOCK
      ?auto_371802 - BLOCK
    )
    :vars
    (
      ?auto_371803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371802 ?auto_371803 ) ( ON-TABLE ?auto_371795 ) ( ON ?auto_371796 ?auto_371795 ) ( ON ?auto_371797 ?auto_371796 ) ( ON ?auto_371798 ?auto_371797 ) ( not ( = ?auto_371795 ?auto_371796 ) ) ( not ( = ?auto_371795 ?auto_371797 ) ) ( not ( = ?auto_371795 ?auto_371798 ) ) ( not ( = ?auto_371795 ?auto_371799 ) ) ( not ( = ?auto_371795 ?auto_371800 ) ) ( not ( = ?auto_371795 ?auto_371801 ) ) ( not ( = ?auto_371795 ?auto_371802 ) ) ( not ( = ?auto_371795 ?auto_371803 ) ) ( not ( = ?auto_371796 ?auto_371797 ) ) ( not ( = ?auto_371796 ?auto_371798 ) ) ( not ( = ?auto_371796 ?auto_371799 ) ) ( not ( = ?auto_371796 ?auto_371800 ) ) ( not ( = ?auto_371796 ?auto_371801 ) ) ( not ( = ?auto_371796 ?auto_371802 ) ) ( not ( = ?auto_371796 ?auto_371803 ) ) ( not ( = ?auto_371797 ?auto_371798 ) ) ( not ( = ?auto_371797 ?auto_371799 ) ) ( not ( = ?auto_371797 ?auto_371800 ) ) ( not ( = ?auto_371797 ?auto_371801 ) ) ( not ( = ?auto_371797 ?auto_371802 ) ) ( not ( = ?auto_371797 ?auto_371803 ) ) ( not ( = ?auto_371798 ?auto_371799 ) ) ( not ( = ?auto_371798 ?auto_371800 ) ) ( not ( = ?auto_371798 ?auto_371801 ) ) ( not ( = ?auto_371798 ?auto_371802 ) ) ( not ( = ?auto_371798 ?auto_371803 ) ) ( not ( = ?auto_371799 ?auto_371800 ) ) ( not ( = ?auto_371799 ?auto_371801 ) ) ( not ( = ?auto_371799 ?auto_371802 ) ) ( not ( = ?auto_371799 ?auto_371803 ) ) ( not ( = ?auto_371800 ?auto_371801 ) ) ( not ( = ?auto_371800 ?auto_371802 ) ) ( not ( = ?auto_371800 ?auto_371803 ) ) ( not ( = ?auto_371801 ?auto_371802 ) ) ( not ( = ?auto_371801 ?auto_371803 ) ) ( not ( = ?auto_371802 ?auto_371803 ) ) ( ON ?auto_371801 ?auto_371802 ) ( ON ?auto_371800 ?auto_371801 ) ( CLEAR ?auto_371798 ) ( ON ?auto_371799 ?auto_371800 ) ( CLEAR ?auto_371799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_371795 ?auto_371796 ?auto_371797 ?auto_371798 ?auto_371799 )
      ( MAKE-8PILE ?auto_371795 ?auto_371796 ?auto_371797 ?auto_371798 ?auto_371799 ?auto_371800 ?auto_371801 ?auto_371802 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371812 - BLOCK
      ?auto_371813 - BLOCK
      ?auto_371814 - BLOCK
      ?auto_371815 - BLOCK
      ?auto_371816 - BLOCK
      ?auto_371817 - BLOCK
      ?auto_371818 - BLOCK
      ?auto_371819 - BLOCK
    )
    :vars
    (
      ?auto_371820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371819 ?auto_371820 ) ( ON-TABLE ?auto_371812 ) ( ON ?auto_371813 ?auto_371812 ) ( ON ?auto_371814 ?auto_371813 ) ( not ( = ?auto_371812 ?auto_371813 ) ) ( not ( = ?auto_371812 ?auto_371814 ) ) ( not ( = ?auto_371812 ?auto_371815 ) ) ( not ( = ?auto_371812 ?auto_371816 ) ) ( not ( = ?auto_371812 ?auto_371817 ) ) ( not ( = ?auto_371812 ?auto_371818 ) ) ( not ( = ?auto_371812 ?auto_371819 ) ) ( not ( = ?auto_371812 ?auto_371820 ) ) ( not ( = ?auto_371813 ?auto_371814 ) ) ( not ( = ?auto_371813 ?auto_371815 ) ) ( not ( = ?auto_371813 ?auto_371816 ) ) ( not ( = ?auto_371813 ?auto_371817 ) ) ( not ( = ?auto_371813 ?auto_371818 ) ) ( not ( = ?auto_371813 ?auto_371819 ) ) ( not ( = ?auto_371813 ?auto_371820 ) ) ( not ( = ?auto_371814 ?auto_371815 ) ) ( not ( = ?auto_371814 ?auto_371816 ) ) ( not ( = ?auto_371814 ?auto_371817 ) ) ( not ( = ?auto_371814 ?auto_371818 ) ) ( not ( = ?auto_371814 ?auto_371819 ) ) ( not ( = ?auto_371814 ?auto_371820 ) ) ( not ( = ?auto_371815 ?auto_371816 ) ) ( not ( = ?auto_371815 ?auto_371817 ) ) ( not ( = ?auto_371815 ?auto_371818 ) ) ( not ( = ?auto_371815 ?auto_371819 ) ) ( not ( = ?auto_371815 ?auto_371820 ) ) ( not ( = ?auto_371816 ?auto_371817 ) ) ( not ( = ?auto_371816 ?auto_371818 ) ) ( not ( = ?auto_371816 ?auto_371819 ) ) ( not ( = ?auto_371816 ?auto_371820 ) ) ( not ( = ?auto_371817 ?auto_371818 ) ) ( not ( = ?auto_371817 ?auto_371819 ) ) ( not ( = ?auto_371817 ?auto_371820 ) ) ( not ( = ?auto_371818 ?auto_371819 ) ) ( not ( = ?auto_371818 ?auto_371820 ) ) ( not ( = ?auto_371819 ?auto_371820 ) ) ( ON ?auto_371818 ?auto_371819 ) ( ON ?auto_371817 ?auto_371818 ) ( ON ?auto_371816 ?auto_371817 ) ( CLEAR ?auto_371814 ) ( ON ?auto_371815 ?auto_371816 ) ( CLEAR ?auto_371815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371812 ?auto_371813 ?auto_371814 ?auto_371815 )
      ( MAKE-8PILE ?auto_371812 ?auto_371813 ?auto_371814 ?auto_371815 ?auto_371816 ?auto_371817 ?auto_371818 ?auto_371819 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371829 - BLOCK
      ?auto_371830 - BLOCK
      ?auto_371831 - BLOCK
      ?auto_371832 - BLOCK
      ?auto_371833 - BLOCK
      ?auto_371834 - BLOCK
      ?auto_371835 - BLOCK
      ?auto_371836 - BLOCK
    )
    :vars
    (
      ?auto_371837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371836 ?auto_371837 ) ( ON-TABLE ?auto_371829 ) ( ON ?auto_371830 ?auto_371829 ) ( ON ?auto_371831 ?auto_371830 ) ( not ( = ?auto_371829 ?auto_371830 ) ) ( not ( = ?auto_371829 ?auto_371831 ) ) ( not ( = ?auto_371829 ?auto_371832 ) ) ( not ( = ?auto_371829 ?auto_371833 ) ) ( not ( = ?auto_371829 ?auto_371834 ) ) ( not ( = ?auto_371829 ?auto_371835 ) ) ( not ( = ?auto_371829 ?auto_371836 ) ) ( not ( = ?auto_371829 ?auto_371837 ) ) ( not ( = ?auto_371830 ?auto_371831 ) ) ( not ( = ?auto_371830 ?auto_371832 ) ) ( not ( = ?auto_371830 ?auto_371833 ) ) ( not ( = ?auto_371830 ?auto_371834 ) ) ( not ( = ?auto_371830 ?auto_371835 ) ) ( not ( = ?auto_371830 ?auto_371836 ) ) ( not ( = ?auto_371830 ?auto_371837 ) ) ( not ( = ?auto_371831 ?auto_371832 ) ) ( not ( = ?auto_371831 ?auto_371833 ) ) ( not ( = ?auto_371831 ?auto_371834 ) ) ( not ( = ?auto_371831 ?auto_371835 ) ) ( not ( = ?auto_371831 ?auto_371836 ) ) ( not ( = ?auto_371831 ?auto_371837 ) ) ( not ( = ?auto_371832 ?auto_371833 ) ) ( not ( = ?auto_371832 ?auto_371834 ) ) ( not ( = ?auto_371832 ?auto_371835 ) ) ( not ( = ?auto_371832 ?auto_371836 ) ) ( not ( = ?auto_371832 ?auto_371837 ) ) ( not ( = ?auto_371833 ?auto_371834 ) ) ( not ( = ?auto_371833 ?auto_371835 ) ) ( not ( = ?auto_371833 ?auto_371836 ) ) ( not ( = ?auto_371833 ?auto_371837 ) ) ( not ( = ?auto_371834 ?auto_371835 ) ) ( not ( = ?auto_371834 ?auto_371836 ) ) ( not ( = ?auto_371834 ?auto_371837 ) ) ( not ( = ?auto_371835 ?auto_371836 ) ) ( not ( = ?auto_371835 ?auto_371837 ) ) ( not ( = ?auto_371836 ?auto_371837 ) ) ( ON ?auto_371835 ?auto_371836 ) ( ON ?auto_371834 ?auto_371835 ) ( ON ?auto_371833 ?auto_371834 ) ( CLEAR ?auto_371831 ) ( ON ?auto_371832 ?auto_371833 ) ( CLEAR ?auto_371832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_371829 ?auto_371830 ?auto_371831 ?auto_371832 )
      ( MAKE-8PILE ?auto_371829 ?auto_371830 ?auto_371831 ?auto_371832 ?auto_371833 ?auto_371834 ?auto_371835 ?auto_371836 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371846 - BLOCK
      ?auto_371847 - BLOCK
      ?auto_371848 - BLOCK
      ?auto_371849 - BLOCK
      ?auto_371850 - BLOCK
      ?auto_371851 - BLOCK
      ?auto_371852 - BLOCK
      ?auto_371853 - BLOCK
    )
    :vars
    (
      ?auto_371854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371853 ?auto_371854 ) ( ON-TABLE ?auto_371846 ) ( ON ?auto_371847 ?auto_371846 ) ( not ( = ?auto_371846 ?auto_371847 ) ) ( not ( = ?auto_371846 ?auto_371848 ) ) ( not ( = ?auto_371846 ?auto_371849 ) ) ( not ( = ?auto_371846 ?auto_371850 ) ) ( not ( = ?auto_371846 ?auto_371851 ) ) ( not ( = ?auto_371846 ?auto_371852 ) ) ( not ( = ?auto_371846 ?auto_371853 ) ) ( not ( = ?auto_371846 ?auto_371854 ) ) ( not ( = ?auto_371847 ?auto_371848 ) ) ( not ( = ?auto_371847 ?auto_371849 ) ) ( not ( = ?auto_371847 ?auto_371850 ) ) ( not ( = ?auto_371847 ?auto_371851 ) ) ( not ( = ?auto_371847 ?auto_371852 ) ) ( not ( = ?auto_371847 ?auto_371853 ) ) ( not ( = ?auto_371847 ?auto_371854 ) ) ( not ( = ?auto_371848 ?auto_371849 ) ) ( not ( = ?auto_371848 ?auto_371850 ) ) ( not ( = ?auto_371848 ?auto_371851 ) ) ( not ( = ?auto_371848 ?auto_371852 ) ) ( not ( = ?auto_371848 ?auto_371853 ) ) ( not ( = ?auto_371848 ?auto_371854 ) ) ( not ( = ?auto_371849 ?auto_371850 ) ) ( not ( = ?auto_371849 ?auto_371851 ) ) ( not ( = ?auto_371849 ?auto_371852 ) ) ( not ( = ?auto_371849 ?auto_371853 ) ) ( not ( = ?auto_371849 ?auto_371854 ) ) ( not ( = ?auto_371850 ?auto_371851 ) ) ( not ( = ?auto_371850 ?auto_371852 ) ) ( not ( = ?auto_371850 ?auto_371853 ) ) ( not ( = ?auto_371850 ?auto_371854 ) ) ( not ( = ?auto_371851 ?auto_371852 ) ) ( not ( = ?auto_371851 ?auto_371853 ) ) ( not ( = ?auto_371851 ?auto_371854 ) ) ( not ( = ?auto_371852 ?auto_371853 ) ) ( not ( = ?auto_371852 ?auto_371854 ) ) ( not ( = ?auto_371853 ?auto_371854 ) ) ( ON ?auto_371852 ?auto_371853 ) ( ON ?auto_371851 ?auto_371852 ) ( ON ?auto_371850 ?auto_371851 ) ( ON ?auto_371849 ?auto_371850 ) ( CLEAR ?auto_371847 ) ( ON ?auto_371848 ?auto_371849 ) ( CLEAR ?auto_371848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371846 ?auto_371847 ?auto_371848 )
      ( MAKE-8PILE ?auto_371846 ?auto_371847 ?auto_371848 ?auto_371849 ?auto_371850 ?auto_371851 ?auto_371852 ?auto_371853 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371863 - BLOCK
      ?auto_371864 - BLOCK
      ?auto_371865 - BLOCK
      ?auto_371866 - BLOCK
      ?auto_371867 - BLOCK
      ?auto_371868 - BLOCK
      ?auto_371869 - BLOCK
      ?auto_371870 - BLOCK
    )
    :vars
    (
      ?auto_371871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371870 ?auto_371871 ) ( ON-TABLE ?auto_371863 ) ( ON ?auto_371864 ?auto_371863 ) ( not ( = ?auto_371863 ?auto_371864 ) ) ( not ( = ?auto_371863 ?auto_371865 ) ) ( not ( = ?auto_371863 ?auto_371866 ) ) ( not ( = ?auto_371863 ?auto_371867 ) ) ( not ( = ?auto_371863 ?auto_371868 ) ) ( not ( = ?auto_371863 ?auto_371869 ) ) ( not ( = ?auto_371863 ?auto_371870 ) ) ( not ( = ?auto_371863 ?auto_371871 ) ) ( not ( = ?auto_371864 ?auto_371865 ) ) ( not ( = ?auto_371864 ?auto_371866 ) ) ( not ( = ?auto_371864 ?auto_371867 ) ) ( not ( = ?auto_371864 ?auto_371868 ) ) ( not ( = ?auto_371864 ?auto_371869 ) ) ( not ( = ?auto_371864 ?auto_371870 ) ) ( not ( = ?auto_371864 ?auto_371871 ) ) ( not ( = ?auto_371865 ?auto_371866 ) ) ( not ( = ?auto_371865 ?auto_371867 ) ) ( not ( = ?auto_371865 ?auto_371868 ) ) ( not ( = ?auto_371865 ?auto_371869 ) ) ( not ( = ?auto_371865 ?auto_371870 ) ) ( not ( = ?auto_371865 ?auto_371871 ) ) ( not ( = ?auto_371866 ?auto_371867 ) ) ( not ( = ?auto_371866 ?auto_371868 ) ) ( not ( = ?auto_371866 ?auto_371869 ) ) ( not ( = ?auto_371866 ?auto_371870 ) ) ( not ( = ?auto_371866 ?auto_371871 ) ) ( not ( = ?auto_371867 ?auto_371868 ) ) ( not ( = ?auto_371867 ?auto_371869 ) ) ( not ( = ?auto_371867 ?auto_371870 ) ) ( not ( = ?auto_371867 ?auto_371871 ) ) ( not ( = ?auto_371868 ?auto_371869 ) ) ( not ( = ?auto_371868 ?auto_371870 ) ) ( not ( = ?auto_371868 ?auto_371871 ) ) ( not ( = ?auto_371869 ?auto_371870 ) ) ( not ( = ?auto_371869 ?auto_371871 ) ) ( not ( = ?auto_371870 ?auto_371871 ) ) ( ON ?auto_371869 ?auto_371870 ) ( ON ?auto_371868 ?auto_371869 ) ( ON ?auto_371867 ?auto_371868 ) ( ON ?auto_371866 ?auto_371867 ) ( CLEAR ?auto_371864 ) ( ON ?auto_371865 ?auto_371866 ) ( CLEAR ?auto_371865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_371863 ?auto_371864 ?auto_371865 )
      ( MAKE-8PILE ?auto_371863 ?auto_371864 ?auto_371865 ?auto_371866 ?auto_371867 ?auto_371868 ?auto_371869 ?auto_371870 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371880 - BLOCK
      ?auto_371881 - BLOCK
      ?auto_371882 - BLOCK
      ?auto_371883 - BLOCK
      ?auto_371884 - BLOCK
      ?auto_371885 - BLOCK
      ?auto_371886 - BLOCK
      ?auto_371887 - BLOCK
    )
    :vars
    (
      ?auto_371888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371887 ?auto_371888 ) ( ON-TABLE ?auto_371880 ) ( not ( = ?auto_371880 ?auto_371881 ) ) ( not ( = ?auto_371880 ?auto_371882 ) ) ( not ( = ?auto_371880 ?auto_371883 ) ) ( not ( = ?auto_371880 ?auto_371884 ) ) ( not ( = ?auto_371880 ?auto_371885 ) ) ( not ( = ?auto_371880 ?auto_371886 ) ) ( not ( = ?auto_371880 ?auto_371887 ) ) ( not ( = ?auto_371880 ?auto_371888 ) ) ( not ( = ?auto_371881 ?auto_371882 ) ) ( not ( = ?auto_371881 ?auto_371883 ) ) ( not ( = ?auto_371881 ?auto_371884 ) ) ( not ( = ?auto_371881 ?auto_371885 ) ) ( not ( = ?auto_371881 ?auto_371886 ) ) ( not ( = ?auto_371881 ?auto_371887 ) ) ( not ( = ?auto_371881 ?auto_371888 ) ) ( not ( = ?auto_371882 ?auto_371883 ) ) ( not ( = ?auto_371882 ?auto_371884 ) ) ( not ( = ?auto_371882 ?auto_371885 ) ) ( not ( = ?auto_371882 ?auto_371886 ) ) ( not ( = ?auto_371882 ?auto_371887 ) ) ( not ( = ?auto_371882 ?auto_371888 ) ) ( not ( = ?auto_371883 ?auto_371884 ) ) ( not ( = ?auto_371883 ?auto_371885 ) ) ( not ( = ?auto_371883 ?auto_371886 ) ) ( not ( = ?auto_371883 ?auto_371887 ) ) ( not ( = ?auto_371883 ?auto_371888 ) ) ( not ( = ?auto_371884 ?auto_371885 ) ) ( not ( = ?auto_371884 ?auto_371886 ) ) ( not ( = ?auto_371884 ?auto_371887 ) ) ( not ( = ?auto_371884 ?auto_371888 ) ) ( not ( = ?auto_371885 ?auto_371886 ) ) ( not ( = ?auto_371885 ?auto_371887 ) ) ( not ( = ?auto_371885 ?auto_371888 ) ) ( not ( = ?auto_371886 ?auto_371887 ) ) ( not ( = ?auto_371886 ?auto_371888 ) ) ( not ( = ?auto_371887 ?auto_371888 ) ) ( ON ?auto_371886 ?auto_371887 ) ( ON ?auto_371885 ?auto_371886 ) ( ON ?auto_371884 ?auto_371885 ) ( ON ?auto_371883 ?auto_371884 ) ( ON ?auto_371882 ?auto_371883 ) ( CLEAR ?auto_371880 ) ( ON ?auto_371881 ?auto_371882 ) ( CLEAR ?auto_371881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371880 ?auto_371881 )
      ( MAKE-8PILE ?auto_371880 ?auto_371881 ?auto_371882 ?auto_371883 ?auto_371884 ?auto_371885 ?auto_371886 ?auto_371887 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371897 - BLOCK
      ?auto_371898 - BLOCK
      ?auto_371899 - BLOCK
      ?auto_371900 - BLOCK
      ?auto_371901 - BLOCK
      ?auto_371902 - BLOCK
      ?auto_371903 - BLOCK
      ?auto_371904 - BLOCK
    )
    :vars
    (
      ?auto_371905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371904 ?auto_371905 ) ( ON-TABLE ?auto_371897 ) ( not ( = ?auto_371897 ?auto_371898 ) ) ( not ( = ?auto_371897 ?auto_371899 ) ) ( not ( = ?auto_371897 ?auto_371900 ) ) ( not ( = ?auto_371897 ?auto_371901 ) ) ( not ( = ?auto_371897 ?auto_371902 ) ) ( not ( = ?auto_371897 ?auto_371903 ) ) ( not ( = ?auto_371897 ?auto_371904 ) ) ( not ( = ?auto_371897 ?auto_371905 ) ) ( not ( = ?auto_371898 ?auto_371899 ) ) ( not ( = ?auto_371898 ?auto_371900 ) ) ( not ( = ?auto_371898 ?auto_371901 ) ) ( not ( = ?auto_371898 ?auto_371902 ) ) ( not ( = ?auto_371898 ?auto_371903 ) ) ( not ( = ?auto_371898 ?auto_371904 ) ) ( not ( = ?auto_371898 ?auto_371905 ) ) ( not ( = ?auto_371899 ?auto_371900 ) ) ( not ( = ?auto_371899 ?auto_371901 ) ) ( not ( = ?auto_371899 ?auto_371902 ) ) ( not ( = ?auto_371899 ?auto_371903 ) ) ( not ( = ?auto_371899 ?auto_371904 ) ) ( not ( = ?auto_371899 ?auto_371905 ) ) ( not ( = ?auto_371900 ?auto_371901 ) ) ( not ( = ?auto_371900 ?auto_371902 ) ) ( not ( = ?auto_371900 ?auto_371903 ) ) ( not ( = ?auto_371900 ?auto_371904 ) ) ( not ( = ?auto_371900 ?auto_371905 ) ) ( not ( = ?auto_371901 ?auto_371902 ) ) ( not ( = ?auto_371901 ?auto_371903 ) ) ( not ( = ?auto_371901 ?auto_371904 ) ) ( not ( = ?auto_371901 ?auto_371905 ) ) ( not ( = ?auto_371902 ?auto_371903 ) ) ( not ( = ?auto_371902 ?auto_371904 ) ) ( not ( = ?auto_371902 ?auto_371905 ) ) ( not ( = ?auto_371903 ?auto_371904 ) ) ( not ( = ?auto_371903 ?auto_371905 ) ) ( not ( = ?auto_371904 ?auto_371905 ) ) ( ON ?auto_371903 ?auto_371904 ) ( ON ?auto_371902 ?auto_371903 ) ( ON ?auto_371901 ?auto_371902 ) ( ON ?auto_371900 ?auto_371901 ) ( ON ?auto_371899 ?auto_371900 ) ( CLEAR ?auto_371897 ) ( ON ?auto_371898 ?auto_371899 ) ( CLEAR ?auto_371898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_371897 ?auto_371898 )
      ( MAKE-8PILE ?auto_371897 ?auto_371898 ?auto_371899 ?auto_371900 ?auto_371901 ?auto_371902 ?auto_371903 ?auto_371904 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371914 - BLOCK
      ?auto_371915 - BLOCK
      ?auto_371916 - BLOCK
      ?auto_371917 - BLOCK
      ?auto_371918 - BLOCK
      ?auto_371919 - BLOCK
      ?auto_371920 - BLOCK
      ?auto_371921 - BLOCK
    )
    :vars
    (
      ?auto_371922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371921 ?auto_371922 ) ( not ( = ?auto_371914 ?auto_371915 ) ) ( not ( = ?auto_371914 ?auto_371916 ) ) ( not ( = ?auto_371914 ?auto_371917 ) ) ( not ( = ?auto_371914 ?auto_371918 ) ) ( not ( = ?auto_371914 ?auto_371919 ) ) ( not ( = ?auto_371914 ?auto_371920 ) ) ( not ( = ?auto_371914 ?auto_371921 ) ) ( not ( = ?auto_371914 ?auto_371922 ) ) ( not ( = ?auto_371915 ?auto_371916 ) ) ( not ( = ?auto_371915 ?auto_371917 ) ) ( not ( = ?auto_371915 ?auto_371918 ) ) ( not ( = ?auto_371915 ?auto_371919 ) ) ( not ( = ?auto_371915 ?auto_371920 ) ) ( not ( = ?auto_371915 ?auto_371921 ) ) ( not ( = ?auto_371915 ?auto_371922 ) ) ( not ( = ?auto_371916 ?auto_371917 ) ) ( not ( = ?auto_371916 ?auto_371918 ) ) ( not ( = ?auto_371916 ?auto_371919 ) ) ( not ( = ?auto_371916 ?auto_371920 ) ) ( not ( = ?auto_371916 ?auto_371921 ) ) ( not ( = ?auto_371916 ?auto_371922 ) ) ( not ( = ?auto_371917 ?auto_371918 ) ) ( not ( = ?auto_371917 ?auto_371919 ) ) ( not ( = ?auto_371917 ?auto_371920 ) ) ( not ( = ?auto_371917 ?auto_371921 ) ) ( not ( = ?auto_371917 ?auto_371922 ) ) ( not ( = ?auto_371918 ?auto_371919 ) ) ( not ( = ?auto_371918 ?auto_371920 ) ) ( not ( = ?auto_371918 ?auto_371921 ) ) ( not ( = ?auto_371918 ?auto_371922 ) ) ( not ( = ?auto_371919 ?auto_371920 ) ) ( not ( = ?auto_371919 ?auto_371921 ) ) ( not ( = ?auto_371919 ?auto_371922 ) ) ( not ( = ?auto_371920 ?auto_371921 ) ) ( not ( = ?auto_371920 ?auto_371922 ) ) ( not ( = ?auto_371921 ?auto_371922 ) ) ( ON ?auto_371920 ?auto_371921 ) ( ON ?auto_371919 ?auto_371920 ) ( ON ?auto_371918 ?auto_371919 ) ( ON ?auto_371917 ?auto_371918 ) ( ON ?auto_371916 ?auto_371917 ) ( ON ?auto_371915 ?auto_371916 ) ( ON ?auto_371914 ?auto_371915 ) ( CLEAR ?auto_371914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371914 )
      ( MAKE-8PILE ?auto_371914 ?auto_371915 ?auto_371916 ?auto_371917 ?auto_371918 ?auto_371919 ?auto_371920 ?auto_371921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_371931 - BLOCK
      ?auto_371932 - BLOCK
      ?auto_371933 - BLOCK
      ?auto_371934 - BLOCK
      ?auto_371935 - BLOCK
      ?auto_371936 - BLOCK
      ?auto_371937 - BLOCK
      ?auto_371938 - BLOCK
    )
    :vars
    (
      ?auto_371939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371938 ?auto_371939 ) ( not ( = ?auto_371931 ?auto_371932 ) ) ( not ( = ?auto_371931 ?auto_371933 ) ) ( not ( = ?auto_371931 ?auto_371934 ) ) ( not ( = ?auto_371931 ?auto_371935 ) ) ( not ( = ?auto_371931 ?auto_371936 ) ) ( not ( = ?auto_371931 ?auto_371937 ) ) ( not ( = ?auto_371931 ?auto_371938 ) ) ( not ( = ?auto_371931 ?auto_371939 ) ) ( not ( = ?auto_371932 ?auto_371933 ) ) ( not ( = ?auto_371932 ?auto_371934 ) ) ( not ( = ?auto_371932 ?auto_371935 ) ) ( not ( = ?auto_371932 ?auto_371936 ) ) ( not ( = ?auto_371932 ?auto_371937 ) ) ( not ( = ?auto_371932 ?auto_371938 ) ) ( not ( = ?auto_371932 ?auto_371939 ) ) ( not ( = ?auto_371933 ?auto_371934 ) ) ( not ( = ?auto_371933 ?auto_371935 ) ) ( not ( = ?auto_371933 ?auto_371936 ) ) ( not ( = ?auto_371933 ?auto_371937 ) ) ( not ( = ?auto_371933 ?auto_371938 ) ) ( not ( = ?auto_371933 ?auto_371939 ) ) ( not ( = ?auto_371934 ?auto_371935 ) ) ( not ( = ?auto_371934 ?auto_371936 ) ) ( not ( = ?auto_371934 ?auto_371937 ) ) ( not ( = ?auto_371934 ?auto_371938 ) ) ( not ( = ?auto_371934 ?auto_371939 ) ) ( not ( = ?auto_371935 ?auto_371936 ) ) ( not ( = ?auto_371935 ?auto_371937 ) ) ( not ( = ?auto_371935 ?auto_371938 ) ) ( not ( = ?auto_371935 ?auto_371939 ) ) ( not ( = ?auto_371936 ?auto_371937 ) ) ( not ( = ?auto_371936 ?auto_371938 ) ) ( not ( = ?auto_371936 ?auto_371939 ) ) ( not ( = ?auto_371937 ?auto_371938 ) ) ( not ( = ?auto_371937 ?auto_371939 ) ) ( not ( = ?auto_371938 ?auto_371939 ) ) ( ON ?auto_371937 ?auto_371938 ) ( ON ?auto_371936 ?auto_371937 ) ( ON ?auto_371935 ?auto_371936 ) ( ON ?auto_371934 ?auto_371935 ) ( ON ?auto_371933 ?auto_371934 ) ( ON ?auto_371932 ?auto_371933 ) ( ON ?auto_371931 ?auto_371932 ) ( CLEAR ?auto_371931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_371931 )
      ( MAKE-8PILE ?auto_371931 ?auto_371932 ?auto_371933 ?auto_371934 ?auto_371935 ?auto_371936 ?auto_371937 ?auto_371938 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_371949 - BLOCK
      ?auto_371950 - BLOCK
      ?auto_371951 - BLOCK
      ?auto_371952 - BLOCK
      ?auto_371953 - BLOCK
      ?auto_371954 - BLOCK
      ?auto_371955 - BLOCK
      ?auto_371956 - BLOCK
      ?auto_371957 - BLOCK
    )
    :vars
    (
      ?auto_371958 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371956 ) ( ON ?auto_371957 ?auto_371958 ) ( CLEAR ?auto_371957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371949 ) ( ON ?auto_371950 ?auto_371949 ) ( ON ?auto_371951 ?auto_371950 ) ( ON ?auto_371952 ?auto_371951 ) ( ON ?auto_371953 ?auto_371952 ) ( ON ?auto_371954 ?auto_371953 ) ( ON ?auto_371955 ?auto_371954 ) ( ON ?auto_371956 ?auto_371955 ) ( not ( = ?auto_371949 ?auto_371950 ) ) ( not ( = ?auto_371949 ?auto_371951 ) ) ( not ( = ?auto_371949 ?auto_371952 ) ) ( not ( = ?auto_371949 ?auto_371953 ) ) ( not ( = ?auto_371949 ?auto_371954 ) ) ( not ( = ?auto_371949 ?auto_371955 ) ) ( not ( = ?auto_371949 ?auto_371956 ) ) ( not ( = ?auto_371949 ?auto_371957 ) ) ( not ( = ?auto_371949 ?auto_371958 ) ) ( not ( = ?auto_371950 ?auto_371951 ) ) ( not ( = ?auto_371950 ?auto_371952 ) ) ( not ( = ?auto_371950 ?auto_371953 ) ) ( not ( = ?auto_371950 ?auto_371954 ) ) ( not ( = ?auto_371950 ?auto_371955 ) ) ( not ( = ?auto_371950 ?auto_371956 ) ) ( not ( = ?auto_371950 ?auto_371957 ) ) ( not ( = ?auto_371950 ?auto_371958 ) ) ( not ( = ?auto_371951 ?auto_371952 ) ) ( not ( = ?auto_371951 ?auto_371953 ) ) ( not ( = ?auto_371951 ?auto_371954 ) ) ( not ( = ?auto_371951 ?auto_371955 ) ) ( not ( = ?auto_371951 ?auto_371956 ) ) ( not ( = ?auto_371951 ?auto_371957 ) ) ( not ( = ?auto_371951 ?auto_371958 ) ) ( not ( = ?auto_371952 ?auto_371953 ) ) ( not ( = ?auto_371952 ?auto_371954 ) ) ( not ( = ?auto_371952 ?auto_371955 ) ) ( not ( = ?auto_371952 ?auto_371956 ) ) ( not ( = ?auto_371952 ?auto_371957 ) ) ( not ( = ?auto_371952 ?auto_371958 ) ) ( not ( = ?auto_371953 ?auto_371954 ) ) ( not ( = ?auto_371953 ?auto_371955 ) ) ( not ( = ?auto_371953 ?auto_371956 ) ) ( not ( = ?auto_371953 ?auto_371957 ) ) ( not ( = ?auto_371953 ?auto_371958 ) ) ( not ( = ?auto_371954 ?auto_371955 ) ) ( not ( = ?auto_371954 ?auto_371956 ) ) ( not ( = ?auto_371954 ?auto_371957 ) ) ( not ( = ?auto_371954 ?auto_371958 ) ) ( not ( = ?auto_371955 ?auto_371956 ) ) ( not ( = ?auto_371955 ?auto_371957 ) ) ( not ( = ?auto_371955 ?auto_371958 ) ) ( not ( = ?auto_371956 ?auto_371957 ) ) ( not ( = ?auto_371956 ?auto_371958 ) ) ( not ( = ?auto_371957 ?auto_371958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371957 ?auto_371958 )
      ( !STACK ?auto_371957 ?auto_371956 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_371968 - BLOCK
      ?auto_371969 - BLOCK
      ?auto_371970 - BLOCK
      ?auto_371971 - BLOCK
      ?auto_371972 - BLOCK
      ?auto_371973 - BLOCK
      ?auto_371974 - BLOCK
      ?auto_371975 - BLOCK
      ?auto_371976 - BLOCK
    )
    :vars
    (
      ?auto_371977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_371975 ) ( ON ?auto_371976 ?auto_371977 ) ( CLEAR ?auto_371976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_371968 ) ( ON ?auto_371969 ?auto_371968 ) ( ON ?auto_371970 ?auto_371969 ) ( ON ?auto_371971 ?auto_371970 ) ( ON ?auto_371972 ?auto_371971 ) ( ON ?auto_371973 ?auto_371972 ) ( ON ?auto_371974 ?auto_371973 ) ( ON ?auto_371975 ?auto_371974 ) ( not ( = ?auto_371968 ?auto_371969 ) ) ( not ( = ?auto_371968 ?auto_371970 ) ) ( not ( = ?auto_371968 ?auto_371971 ) ) ( not ( = ?auto_371968 ?auto_371972 ) ) ( not ( = ?auto_371968 ?auto_371973 ) ) ( not ( = ?auto_371968 ?auto_371974 ) ) ( not ( = ?auto_371968 ?auto_371975 ) ) ( not ( = ?auto_371968 ?auto_371976 ) ) ( not ( = ?auto_371968 ?auto_371977 ) ) ( not ( = ?auto_371969 ?auto_371970 ) ) ( not ( = ?auto_371969 ?auto_371971 ) ) ( not ( = ?auto_371969 ?auto_371972 ) ) ( not ( = ?auto_371969 ?auto_371973 ) ) ( not ( = ?auto_371969 ?auto_371974 ) ) ( not ( = ?auto_371969 ?auto_371975 ) ) ( not ( = ?auto_371969 ?auto_371976 ) ) ( not ( = ?auto_371969 ?auto_371977 ) ) ( not ( = ?auto_371970 ?auto_371971 ) ) ( not ( = ?auto_371970 ?auto_371972 ) ) ( not ( = ?auto_371970 ?auto_371973 ) ) ( not ( = ?auto_371970 ?auto_371974 ) ) ( not ( = ?auto_371970 ?auto_371975 ) ) ( not ( = ?auto_371970 ?auto_371976 ) ) ( not ( = ?auto_371970 ?auto_371977 ) ) ( not ( = ?auto_371971 ?auto_371972 ) ) ( not ( = ?auto_371971 ?auto_371973 ) ) ( not ( = ?auto_371971 ?auto_371974 ) ) ( not ( = ?auto_371971 ?auto_371975 ) ) ( not ( = ?auto_371971 ?auto_371976 ) ) ( not ( = ?auto_371971 ?auto_371977 ) ) ( not ( = ?auto_371972 ?auto_371973 ) ) ( not ( = ?auto_371972 ?auto_371974 ) ) ( not ( = ?auto_371972 ?auto_371975 ) ) ( not ( = ?auto_371972 ?auto_371976 ) ) ( not ( = ?auto_371972 ?auto_371977 ) ) ( not ( = ?auto_371973 ?auto_371974 ) ) ( not ( = ?auto_371973 ?auto_371975 ) ) ( not ( = ?auto_371973 ?auto_371976 ) ) ( not ( = ?auto_371973 ?auto_371977 ) ) ( not ( = ?auto_371974 ?auto_371975 ) ) ( not ( = ?auto_371974 ?auto_371976 ) ) ( not ( = ?auto_371974 ?auto_371977 ) ) ( not ( = ?auto_371975 ?auto_371976 ) ) ( not ( = ?auto_371975 ?auto_371977 ) ) ( not ( = ?auto_371976 ?auto_371977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_371976 ?auto_371977 )
      ( !STACK ?auto_371976 ?auto_371975 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_371987 - BLOCK
      ?auto_371988 - BLOCK
      ?auto_371989 - BLOCK
      ?auto_371990 - BLOCK
      ?auto_371991 - BLOCK
      ?auto_371992 - BLOCK
      ?auto_371993 - BLOCK
      ?auto_371994 - BLOCK
      ?auto_371995 - BLOCK
    )
    :vars
    (
      ?auto_371996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_371995 ?auto_371996 ) ( ON-TABLE ?auto_371987 ) ( ON ?auto_371988 ?auto_371987 ) ( ON ?auto_371989 ?auto_371988 ) ( ON ?auto_371990 ?auto_371989 ) ( ON ?auto_371991 ?auto_371990 ) ( ON ?auto_371992 ?auto_371991 ) ( ON ?auto_371993 ?auto_371992 ) ( not ( = ?auto_371987 ?auto_371988 ) ) ( not ( = ?auto_371987 ?auto_371989 ) ) ( not ( = ?auto_371987 ?auto_371990 ) ) ( not ( = ?auto_371987 ?auto_371991 ) ) ( not ( = ?auto_371987 ?auto_371992 ) ) ( not ( = ?auto_371987 ?auto_371993 ) ) ( not ( = ?auto_371987 ?auto_371994 ) ) ( not ( = ?auto_371987 ?auto_371995 ) ) ( not ( = ?auto_371987 ?auto_371996 ) ) ( not ( = ?auto_371988 ?auto_371989 ) ) ( not ( = ?auto_371988 ?auto_371990 ) ) ( not ( = ?auto_371988 ?auto_371991 ) ) ( not ( = ?auto_371988 ?auto_371992 ) ) ( not ( = ?auto_371988 ?auto_371993 ) ) ( not ( = ?auto_371988 ?auto_371994 ) ) ( not ( = ?auto_371988 ?auto_371995 ) ) ( not ( = ?auto_371988 ?auto_371996 ) ) ( not ( = ?auto_371989 ?auto_371990 ) ) ( not ( = ?auto_371989 ?auto_371991 ) ) ( not ( = ?auto_371989 ?auto_371992 ) ) ( not ( = ?auto_371989 ?auto_371993 ) ) ( not ( = ?auto_371989 ?auto_371994 ) ) ( not ( = ?auto_371989 ?auto_371995 ) ) ( not ( = ?auto_371989 ?auto_371996 ) ) ( not ( = ?auto_371990 ?auto_371991 ) ) ( not ( = ?auto_371990 ?auto_371992 ) ) ( not ( = ?auto_371990 ?auto_371993 ) ) ( not ( = ?auto_371990 ?auto_371994 ) ) ( not ( = ?auto_371990 ?auto_371995 ) ) ( not ( = ?auto_371990 ?auto_371996 ) ) ( not ( = ?auto_371991 ?auto_371992 ) ) ( not ( = ?auto_371991 ?auto_371993 ) ) ( not ( = ?auto_371991 ?auto_371994 ) ) ( not ( = ?auto_371991 ?auto_371995 ) ) ( not ( = ?auto_371991 ?auto_371996 ) ) ( not ( = ?auto_371992 ?auto_371993 ) ) ( not ( = ?auto_371992 ?auto_371994 ) ) ( not ( = ?auto_371992 ?auto_371995 ) ) ( not ( = ?auto_371992 ?auto_371996 ) ) ( not ( = ?auto_371993 ?auto_371994 ) ) ( not ( = ?auto_371993 ?auto_371995 ) ) ( not ( = ?auto_371993 ?auto_371996 ) ) ( not ( = ?auto_371994 ?auto_371995 ) ) ( not ( = ?auto_371994 ?auto_371996 ) ) ( not ( = ?auto_371995 ?auto_371996 ) ) ( CLEAR ?auto_371993 ) ( ON ?auto_371994 ?auto_371995 ) ( CLEAR ?auto_371994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_371987 ?auto_371988 ?auto_371989 ?auto_371990 ?auto_371991 ?auto_371992 ?auto_371993 ?auto_371994 )
      ( MAKE-9PILE ?auto_371987 ?auto_371988 ?auto_371989 ?auto_371990 ?auto_371991 ?auto_371992 ?auto_371993 ?auto_371994 ?auto_371995 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372006 - BLOCK
      ?auto_372007 - BLOCK
      ?auto_372008 - BLOCK
      ?auto_372009 - BLOCK
      ?auto_372010 - BLOCK
      ?auto_372011 - BLOCK
      ?auto_372012 - BLOCK
      ?auto_372013 - BLOCK
      ?auto_372014 - BLOCK
    )
    :vars
    (
      ?auto_372015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372014 ?auto_372015 ) ( ON-TABLE ?auto_372006 ) ( ON ?auto_372007 ?auto_372006 ) ( ON ?auto_372008 ?auto_372007 ) ( ON ?auto_372009 ?auto_372008 ) ( ON ?auto_372010 ?auto_372009 ) ( ON ?auto_372011 ?auto_372010 ) ( ON ?auto_372012 ?auto_372011 ) ( not ( = ?auto_372006 ?auto_372007 ) ) ( not ( = ?auto_372006 ?auto_372008 ) ) ( not ( = ?auto_372006 ?auto_372009 ) ) ( not ( = ?auto_372006 ?auto_372010 ) ) ( not ( = ?auto_372006 ?auto_372011 ) ) ( not ( = ?auto_372006 ?auto_372012 ) ) ( not ( = ?auto_372006 ?auto_372013 ) ) ( not ( = ?auto_372006 ?auto_372014 ) ) ( not ( = ?auto_372006 ?auto_372015 ) ) ( not ( = ?auto_372007 ?auto_372008 ) ) ( not ( = ?auto_372007 ?auto_372009 ) ) ( not ( = ?auto_372007 ?auto_372010 ) ) ( not ( = ?auto_372007 ?auto_372011 ) ) ( not ( = ?auto_372007 ?auto_372012 ) ) ( not ( = ?auto_372007 ?auto_372013 ) ) ( not ( = ?auto_372007 ?auto_372014 ) ) ( not ( = ?auto_372007 ?auto_372015 ) ) ( not ( = ?auto_372008 ?auto_372009 ) ) ( not ( = ?auto_372008 ?auto_372010 ) ) ( not ( = ?auto_372008 ?auto_372011 ) ) ( not ( = ?auto_372008 ?auto_372012 ) ) ( not ( = ?auto_372008 ?auto_372013 ) ) ( not ( = ?auto_372008 ?auto_372014 ) ) ( not ( = ?auto_372008 ?auto_372015 ) ) ( not ( = ?auto_372009 ?auto_372010 ) ) ( not ( = ?auto_372009 ?auto_372011 ) ) ( not ( = ?auto_372009 ?auto_372012 ) ) ( not ( = ?auto_372009 ?auto_372013 ) ) ( not ( = ?auto_372009 ?auto_372014 ) ) ( not ( = ?auto_372009 ?auto_372015 ) ) ( not ( = ?auto_372010 ?auto_372011 ) ) ( not ( = ?auto_372010 ?auto_372012 ) ) ( not ( = ?auto_372010 ?auto_372013 ) ) ( not ( = ?auto_372010 ?auto_372014 ) ) ( not ( = ?auto_372010 ?auto_372015 ) ) ( not ( = ?auto_372011 ?auto_372012 ) ) ( not ( = ?auto_372011 ?auto_372013 ) ) ( not ( = ?auto_372011 ?auto_372014 ) ) ( not ( = ?auto_372011 ?auto_372015 ) ) ( not ( = ?auto_372012 ?auto_372013 ) ) ( not ( = ?auto_372012 ?auto_372014 ) ) ( not ( = ?auto_372012 ?auto_372015 ) ) ( not ( = ?auto_372013 ?auto_372014 ) ) ( not ( = ?auto_372013 ?auto_372015 ) ) ( not ( = ?auto_372014 ?auto_372015 ) ) ( CLEAR ?auto_372012 ) ( ON ?auto_372013 ?auto_372014 ) ( CLEAR ?auto_372013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_372006 ?auto_372007 ?auto_372008 ?auto_372009 ?auto_372010 ?auto_372011 ?auto_372012 ?auto_372013 )
      ( MAKE-9PILE ?auto_372006 ?auto_372007 ?auto_372008 ?auto_372009 ?auto_372010 ?auto_372011 ?auto_372012 ?auto_372013 ?auto_372014 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372025 - BLOCK
      ?auto_372026 - BLOCK
      ?auto_372027 - BLOCK
      ?auto_372028 - BLOCK
      ?auto_372029 - BLOCK
      ?auto_372030 - BLOCK
      ?auto_372031 - BLOCK
      ?auto_372032 - BLOCK
      ?auto_372033 - BLOCK
    )
    :vars
    (
      ?auto_372034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372033 ?auto_372034 ) ( ON-TABLE ?auto_372025 ) ( ON ?auto_372026 ?auto_372025 ) ( ON ?auto_372027 ?auto_372026 ) ( ON ?auto_372028 ?auto_372027 ) ( ON ?auto_372029 ?auto_372028 ) ( ON ?auto_372030 ?auto_372029 ) ( not ( = ?auto_372025 ?auto_372026 ) ) ( not ( = ?auto_372025 ?auto_372027 ) ) ( not ( = ?auto_372025 ?auto_372028 ) ) ( not ( = ?auto_372025 ?auto_372029 ) ) ( not ( = ?auto_372025 ?auto_372030 ) ) ( not ( = ?auto_372025 ?auto_372031 ) ) ( not ( = ?auto_372025 ?auto_372032 ) ) ( not ( = ?auto_372025 ?auto_372033 ) ) ( not ( = ?auto_372025 ?auto_372034 ) ) ( not ( = ?auto_372026 ?auto_372027 ) ) ( not ( = ?auto_372026 ?auto_372028 ) ) ( not ( = ?auto_372026 ?auto_372029 ) ) ( not ( = ?auto_372026 ?auto_372030 ) ) ( not ( = ?auto_372026 ?auto_372031 ) ) ( not ( = ?auto_372026 ?auto_372032 ) ) ( not ( = ?auto_372026 ?auto_372033 ) ) ( not ( = ?auto_372026 ?auto_372034 ) ) ( not ( = ?auto_372027 ?auto_372028 ) ) ( not ( = ?auto_372027 ?auto_372029 ) ) ( not ( = ?auto_372027 ?auto_372030 ) ) ( not ( = ?auto_372027 ?auto_372031 ) ) ( not ( = ?auto_372027 ?auto_372032 ) ) ( not ( = ?auto_372027 ?auto_372033 ) ) ( not ( = ?auto_372027 ?auto_372034 ) ) ( not ( = ?auto_372028 ?auto_372029 ) ) ( not ( = ?auto_372028 ?auto_372030 ) ) ( not ( = ?auto_372028 ?auto_372031 ) ) ( not ( = ?auto_372028 ?auto_372032 ) ) ( not ( = ?auto_372028 ?auto_372033 ) ) ( not ( = ?auto_372028 ?auto_372034 ) ) ( not ( = ?auto_372029 ?auto_372030 ) ) ( not ( = ?auto_372029 ?auto_372031 ) ) ( not ( = ?auto_372029 ?auto_372032 ) ) ( not ( = ?auto_372029 ?auto_372033 ) ) ( not ( = ?auto_372029 ?auto_372034 ) ) ( not ( = ?auto_372030 ?auto_372031 ) ) ( not ( = ?auto_372030 ?auto_372032 ) ) ( not ( = ?auto_372030 ?auto_372033 ) ) ( not ( = ?auto_372030 ?auto_372034 ) ) ( not ( = ?auto_372031 ?auto_372032 ) ) ( not ( = ?auto_372031 ?auto_372033 ) ) ( not ( = ?auto_372031 ?auto_372034 ) ) ( not ( = ?auto_372032 ?auto_372033 ) ) ( not ( = ?auto_372032 ?auto_372034 ) ) ( not ( = ?auto_372033 ?auto_372034 ) ) ( ON ?auto_372032 ?auto_372033 ) ( CLEAR ?auto_372030 ) ( ON ?auto_372031 ?auto_372032 ) ( CLEAR ?auto_372031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_372025 ?auto_372026 ?auto_372027 ?auto_372028 ?auto_372029 ?auto_372030 ?auto_372031 )
      ( MAKE-9PILE ?auto_372025 ?auto_372026 ?auto_372027 ?auto_372028 ?auto_372029 ?auto_372030 ?auto_372031 ?auto_372032 ?auto_372033 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372044 - BLOCK
      ?auto_372045 - BLOCK
      ?auto_372046 - BLOCK
      ?auto_372047 - BLOCK
      ?auto_372048 - BLOCK
      ?auto_372049 - BLOCK
      ?auto_372050 - BLOCK
      ?auto_372051 - BLOCK
      ?auto_372052 - BLOCK
    )
    :vars
    (
      ?auto_372053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372052 ?auto_372053 ) ( ON-TABLE ?auto_372044 ) ( ON ?auto_372045 ?auto_372044 ) ( ON ?auto_372046 ?auto_372045 ) ( ON ?auto_372047 ?auto_372046 ) ( ON ?auto_372048 ?auto_372047 ) ( ON ?auto_372049 ?auto_372048 ) ( not ( = ?auto_372044 ?auto_372045 ) ) ( not ( = ?auto_372044 ?auto_372046 ) ) ( not ( = ?auto_372044 ?auto_372047 ) ) ( not ( = ?auto_372044 ?auto_372048 ) ) ( not ( = ?auto_372044 ?auto_372049 ) ) ( not ( = ?auto_372044 ?auto_372050 ) ) ( not ( = ?auto_372044 ?auto_372051 ) ) ( not ( = ?auto_372044 ?auto_372052 ) ) ( not ( = ?auto_372044 ?auto_372053 ) ) ( not ( = ?auto_372045 ?auto_372046 ) ) ( not ( = ?auto_372045 ?auto_372047 ) ) ( not ( = ?auto_372045 ?auto_372048 ) ) ( not ( = ?auto_372045 ?auto_372049 ) ) ( not ( = ?auto_372045 ?auto_372050 ) ) ( not ( = ?auto_372045 ?auto_372051 ) ) ( not ( = ?auto_372045 ?auto_372052 ) ) ( not ( = ?auto_372045 ?auto_372053 ) ) ( not ( = ?auto_372046 ?auto_372047 ) ) ( not ( = ?auto_372046 ?auto_372048 ) ) ( not ( = ?auto_372046 ?auto_372049 ) ) ( not ( = ?auto_372046 ?auto_372050 ) ) ( not ( = ?auto_372046 ?auto_372051 ) ) ( not ( = ?auto_372046 ?auto_372052 ) ) ( not ( = ?auto_372046 ?auto_372053 ) ) ( not ( = ?auto_372047 ?auto_372048 ) ) ( not ( = ?auto_372047 ?auto_372049 ) ) ( not ( = ?auto_372047 ?auto_372050 ) ) ( not ( = ?auto_372047 ?auto_372051 ) ) ( not ( = ?auto_372047 ?auto_372052 ) ) ( not ( = ?auto_372047 ?auto_372053 ) ) ( not ( = ?auto_372048 ?auto_372049 ) ) ( not ( = ?auto_372048 ?auto_372050 ) ) ( not ( = ?auto_372048 ?auto_372051 ) ) ( not ( = ?auto_372048 ?auto_372052 ) ) ( not ( = ?auto_372048 ?auto_372053 ) ) ( not ( = ?auto_372049 ?auto_372050 ) ) ( not ( = ?auto_372049 ?auto_372051 ) ) ( not ( = ?auto_372049 ?auto_372052 ) ) ( not ( = ?auto_372049 ?auto_372053 ) ) ( not ( = ?auto_372050 ?auto_372051 ) ) ( not ( = ?auto_372050 ?auto_372052 ) ) ( not ( = ?auto_372050 ?auto_372053 ) ) ( not ( = ?auto_372051 ?auto_372052 ) ) ( not ( = ?auto_372051 ?auto_372053 ) ) ( not ( = ?auto_372052 ?auto_372053 ) ) ( ON ?auto_372051 ?auto_372052 ) ( CLEAR ?auto_372049 ) ( ON ?auto_372050 ?auto_372051 ) ( CLEAR ?auto_372050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_372044 ?auto_372045 ?auto_372046 ?auto_372047 ?auto_372048 ?auto_372049 ?auto_372050 )
      ( MAKE-9PILE ?auto_372044 ?auto_372045 ?auto_372046 ?auto_372047 ?auto_372048 ?auto_372049 ?auto_372050 ?auto_372051 ?auto_372052 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372063 - BLOCK
      ?auto_372064 - BLOCK
      ?auto_372065 - BLOCK
      ?auto_372066 - BLOCK
      ?auto_372067 - BLOCK
      ?auto_372068 - BLOCK
      ?auto_372069 - BLOCK
      ?auto_372070 - BLOCK
      ?auto_372071 - BLOCK
    )
    :vars
    (
      ?auto_372072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372071 ?auto_372072 ) ( ON-TABLE ?auto_372063 ) ( ON ?auto_372064 ?auto_372063 ) ( ON ?auto_372065 ?auto_372064 ) ( ON ?auto_372066 ?auto_372065 ) ( ON ?auto_372067 ?auto_372066 ) ( not ( = ?auto_372063 ?auto_372064 ) ) ( not ( = ?auto_372063 ?auto_372065 ) ) ( not ( = ?auto_372063 ?auto_372066 ) ) ( not ( = ?auto_372063 ?auto_372067 ) ) ( not ( = ?auto_372063 ?auto_372068 ) ) ( not ( = ?auto_372063 ?auto_372069 ) ) ( not ( = ?auto_372063 ?auto_372070 ) ) ( not ( = ?auto_372063 ?auto_372071 ) ) ( not ( = ?auto_372063 ?auto_372072 ) ) ( not ( = ?auto_372064 ?auto_372065 ) ) ( not ( = ?auto_372064 ?auto_372066 ) ) ( not ( = ?auto_372064 ?auto_372067 ) ) ( not ( = ?auto_372064 ?auto_372068 ) ) ( not ( = ?auto_372064 ?auto_372069 ) ) ( not ( = ?auto_372064 ?auto_372070 ) ) ( not ( = ?auto_372064 ?auto_372071 ) ) ( not ( = ?auto_372064 ?auto_372072 ) ) ( not ( = ?auto_372065 ?auto_372066 ) ) ( not ( = ?auto_372065 ?auto_372067 ) ) ( not ( = ?auto_372065 ?auto_372068 ) ) ( not ( = ?auto_372065 ?auto_372069 ) ) ( not ( = ?auto_372065 ?auto_372070 ) ) ( not ( = ?auto_372065 ?auto_372071 ) ) ( not ( = ?auto_372065 ?auto_372072 ) ) ( not ( = ?auto_372066 ?auto_372067 ) ) ( not ( = ?auto_372066 ?auto_372068 ) ) ( not ( = ?auto_372066 ?auto_372069 ) ) ( not ( = ?auto_372066 ?auto_372070 ) ) ( not ( = ?auto_372066 ?auto_372071 ) ) ( not ( = ?auto_372066 ?auto_372072 ) ) ( not ( = ?auto_372067 ?auto_372068 ) ) ( not ( = ?auto_372067 ?auto_372069 ) ) ( not ( = ?auto_372067 ?auto_372070 ) ) ( not ( = ?auto_372067 ?auto_372071 ) ) ( not ( = ?auto_372067 ?auto_372072 ) ) ( not ( = ?auto_372068 ?auto_372069 ) ) ( not ( = ?auto_372068 ?auto_372070 ) ) ( not ( = ?auto_372068 ?auto_372071 ) ) ( not ( = ?auto_372068 ?auto_372072 ) ) ( not ( = ?auto_372069 ?auto_372070 ) ) ( not ( = ?auto_372069 ?auto_372071 ) ) ( not ( = ?auto_372069 ?auto_372072 ) ) ( not ( = ?auto_372070 ?auto_372071 ) ) ( not ( = ?auto_372070 ?auto_372072 ) ) ( not ( = ?auto_372071 ?auto_372072 ) ) ( ON ?auto_372070 ?auto_372071 ) ( ON ?auto_372069 ?auto_372070 ) ( CLEAR ?auto_372067 ) ( ON ?auto_372068 ?auto_372069 ) ( CLEAR ?auto_372068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_372063 ?auto_372064 ?auto_372065 ?auto_372066 ?auto_372067 ?auto_372068 )
      ( MAKE-9PILE ?auto_372063 ?auto_372064 ?auto_372065 ?auto_372066 ?auto_372067 ?auto_372068 ?auto_372069 ?auto_372070 ?auto_372071 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372082 - BLOCK
      ?auto_372083 - BLOCK
      ?auto_372084 - BLOCK
      ?auto_372085 - BLOCK
      ?auto_372086 - BLOCK
      ?auto_372087 - BLOCK
      ?auto_372088 - BLOCK
      ?auto_372089 - BLOCK
      ?auto_372090 - BLOCK
    )
    :vars
    (
      ?auto_372091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372090 ?auto_372091 ) ( ON-TABLE ?auto_372082 ) ( ON ?auto_372083 ?auto_372082 ) ( ON ?auto_372084 ?auto_372083 ) ( ON ?auto_372085 ?auto_372084 ) ( ON ?auto_372086 ?auto_372085 ) ( not ( = ?auto_372082 ?auto_372083 ) ) ( not ( = ?auto_372082 ?auto_372084 ) ) ( not ( = ?auto_372082 ?auto_372085 ) ) ( not ( = ?auto_372082 ?auto_372086 ) ) ( not ( = ?auto_372082 ?auto_372087 ) ) ( not ( = ?auto_372082 ?auto_372088 ) ) ( not ( = ?auto_372082 ?auto_372089 ) ) ( not ( = ?auto_372082 ?auto_372090 ) ) ( not ( = ?auto_372082 ?auto_372091 ) ) ( not ( = ?auto_372083 ?auto_372084 ) ) ( not ( = ?auto_372083 ?auto_372085 ) ) ( not ( = ?auto_372083 ?auto_372086 ) ) ( not ( = ?auto_372083 ?auto_372087 ) ) ( not ( = ?auto_372083 ?auto_372088 ) ) ( not ( = ?auto_372083 ?auto_372089 ) ) ( not ( = ?auto_372083 ?auto_372090 ) ) ( not ( = ?auto_372083 ?auto_372091 ) ) ( not ( = ?auto_372084 ?auto_372085 ) ) ( not ( = ?auto_372084 ?auto_372086 ) ) ( not ( = ?auto_372084 ?auto_372087 ) ) ( not ( = ?auto_372084 ?auto_372088 ) ) ( not ( = ?auto_372084 ?auto_372089 ) ) ( not ( = ?auto_372084 ?auto_372090 ) ) ( not ( = ?auto_372084 ?auto_372091 ) ) ( not ( = ?auto_372085 ?auto_372086 ) ) ( not ( = ?auto_372085 ?auto_372087 ) ) ( not ( = ?auto_372085 ?auto_372088 ) ) ( not ( = ?auto_372085 ?auto_372089 ) ) ( not ( = ?auto_372085 ?auto_372090 ) ) ( not ( = ?auto_372085 ?auto_372091 ) ) ( not ( = ?auto_372086 ?auto_372087 ) ) ( not ( = ?auto_372086 ?auto_372088 ) ) ( not ( = ?auto_372086 ?auto_372089 ) ) ( not ( = ?auto_372086 ?auto_372090 ) ) ( not ( = ?auto_372086 ?auto_372091 ) ) ( not ( = ?auto_372087 ?auto_372088 ) ) ( not ( = ?auto_372087 ?auto_372089 ) ) ( not ( = ?auto_372087 ?auto_372090 ) ) ( not ( = ?auto_372087 ?auto_372091 ) ) ( not ( = ?auto_372088 ?auto_372089 ) ) ( not ( = ?auto_372088 ?auto_372090 ) ) ( not ( = ?auto_372088 ?auto_372091 ) ) ( not ( = ?auto_372089 ?auto_372090 ) ) ( not ( = ?auto_372089 ?auto_372091 ) ) ( not ( = ?auto_372090 ?auto_372091 ) ) ( ON ?auto_372089 ?auto_372090 ) ( ON ?auto_372088 ?auto_372089 ) ( CLEAR ?auto_372086 ) ( ON ?auto_372087 ?auto_372088 ) ( CLEAR ?auto_372087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_372082 ?auto_372083 ?auto_372084 ?auto_372085 ?auto_372086 ?auto_372087 )
      ( MAKE-9PILE ?auto_372082 ?auto_372083 ?auto_372084 ?auto_372085 ?auto_372086 ?auto_372087 ?auto_372088 ?auto_372089 ?auto_372090 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372101 - BLOCK
      ?auto_372102 - BLOCK
      ?auto_372103 - BLOCK
      ?auto_372104 - BLOCK
      ?auto_372105 - BLOCK
      ?auto_372106 - BLOCK
      ?auto_372107 - BLOCK
      ?auto_372108 - BLOCK
      ?auto_372109 - BLOCK
    )
    :vars
    (
      ?auto_372110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372109 ?auto_372110 ) ( ON-TABLE ?auto_372101 ) ( ON ?auto_372102 ?auto_372101 ) ( ON ?auto_372103 ?auto_372102 ) ( ON ?auto_372104 ?auto_372103 ) ( not ( = ?auto_372101 ?auto_372102 ) ) ( not ( = ?auto_372101 ?auto_372103 ) ) ( not ( = ?auto_372101 ?auto_372104 ) ) ( not ( = ?auto_372101 ?auto_372105 ) ) ( not ( = ?auto_372101 ?auto_372106 ) ) ( not ( = ?auto_372101 ?auto_372107 ) ) ( not ( = ?auto_372101 ?auto_372108 ) ) ( not ( = ?auto_372101 ?auto_372109 ) ) ( not ( = ?auto_372101 ?auto_372110 ) ) ( not ( = ?auto_372102 ?auto_372103 ) ) ( not ( = ?auto_372102 ?auto_372104 ) ) ( not ( = ?auto_372102 ?auto_372105 ) ) ( not ( = ?auto_372102 ?auto_372106 ) ) ( not ( = ?auto_372102 ?auto_372107 ) ) ( not ( = ?auto_372102 ?auto_372108 ) ) ( not ( = ?auto_372102 ?auto_372109 ) ) ( not ( = ?auto_372102 ?auto_372110 ) ) ( not ( = ?auto_372103 ?auto_372104 ) ) ( not ( = ?auto_372103 ?auto_372105 ) ) ( not ( = ?auto_372103 ?auto_372106 ) ) ( not ( = ?auto_372103 ?auto_372107 ) ) ( not ( = ?auto_372103 ?auto_372108 ) ) ( not ( = ?auto_372103 ?auto_372109 ) ) ( not ( = ?auto_372103 ?auto_372110 ) ) ( not ( = ?auto_372104 ?auto_372105 ) ) ( not ( = ?auto_372104 ?auto_372106 ) ) ( not ( = ?auto_372104 ?auto_372107 ) ) ( not ( = ?auto_372104 ?auto_372108 ) ) ( not ( = ?auto_372104 ?auto_372109 ) ) ( not ( = ?auto_372104 ?auto_372110 ) ) ( not ( = ?auto_372105 ?auto_372106 ) ) ( not ( = ?auto_372105 ?auto_372107 ) ) ( not ( = ?auto_372105 ?auto_372108 ) ) ( not ( = ?auto_372105 ?auto_372109 ) ) ( not ( = ?auto_372105 ?auto_372110 ) ) ( not ( = ?auto_372106 ?auto_372107 ) ) ( not ( = ?auto_372106 ?auto_372108 ) ) ( not ( = ?auto_372106 ?auto_372109 ) ) ( not ( = ?auto_372106 ?auto_372110 ) ) ( not ( = ?auto_372107 ?auto_372108 ) ) ( not ( = ?auto_372107 ?auto_372109 ) ) ( not ( = ?auto_372107 ?auto_372110 ) ) ( not ( = ?auto_372108 ?auto_372109 ) ) ( not ( = ?auto_372108 ?auto_372110 ) ) ( not ( = ?auto_372109 ?auto_372110 ) ) ( ON ?auto_372108 ?auto_372109 ) ( ON ?auto_372107 ?auto_372108 ) ( ON ?auto_372106 ?auto_372107 ) ( CLEAR ?auto_372104 ) ( ON ?auto_372105 ?auto_372106 ) ( CLEAR ?auto_372105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_372101 ?auto_372102 ?auto_372103 ?auto_372104 ?auto_372105 )
      ( MAKE-9PILE ?auto_372101 ?auto_372102 ?auto_372103 ?auto_372104 ?auto_372105 ?auto_372106 ?auto_372107 ?auto_372108 ?auto_372109 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372120 - BLOCK
      ?auto_372121 - BLOCK
      ?auto_372122 - BLOCK
      ?auto_372123 - BLOCK
      ?auto_372124 - BLOCK
      ?auto_372125 - BLOCK
      ?auto_372126 - BLOCK
      ?auto_372127 - BLOCK
      ?auto_372128 - BLOCK
    )
    :vars
    (
      ?auto_372129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372128 ?auto_372129 ) ( ON-TABLE ?auto_372120 ) ( ON ?auto_372121 ?auto_372120 ) ( ON ?auto_372122 ?auto_372121 ) ( ON ?auto_372123 ?auto_372122 ) ( not ( = ?auto_372120 ?auto_372121 ) ) ( not ( = ?auto_372120 ?auto_372122 ) ) ( not ( = ?auto_372120 ?auto_372123 ) ) ( not ( = ?auto_372120 ?auto_372124 ) ) ( not ( = ?auto_372120 ?auto_372125 ) ) ( not ( = ?auto_372120 ?auto_372126 ) ) ( not ( = ?auto_372120 ?auto_372127 ) ) ( not ( = ?auto_372120 ?auto_372128 ) ) ( not ( = ?auto_372120 ?auto_372129 ) ) ( not ( = ?auto_372121 ?auto_372122 ) ) ( not ( = ?auto_372121 ?auto_372123 ) ) ( not ( = ?auto_372121 ?auto_372124 ) ) ( not ( = ?auto_372121 ?auto_372125 ) ) ( not ( = ?auto_372121 ?auto_372126 ) ) ( not ( = ?auto_372121 ?auto_372127 ) ) ( not ( = ?auto_372121 ?auto_372128 ) ) ( not ( = ?auto_372121 ?auto_372129 ) ) ( not ( = ?auto_372122 ?auto_372123 ) ) ( not ( = ?auto_372122 ?auto_372124 ) ) ( not ( = ?auto_372122 ?auto_372125 ) ) ( not ( = ?auto_372122 ?auto_372126 ) ) ( not ( = ?auto_372122 ?auto_372127 ) ) ( not ( = ?auto_372122 ?auto_372128 ) ) ( not ( = ?auto_372122 ?auto_372129 ) ) ( not ( = ?auto_372123 ?auto_372124 ) ) ( not ( = ?auto_372123 ?auto_372125 ) ) ( not ( = ?auto_372123 ?auto_372126 ) ) ( not ( = ?auto_372123 ?auto_372127 ) ) ( not ( = ?auto_372123 ?auto_372128 ) ) ( not ( = ?auto_372123 ?auto_372129 ) ) ( not ( = ?auto_372124 ?auto_372125 ) ) ( not ( = ?auto_372124 ?auto_372126 ) ) ( not ( = ?auto_372124 ?auto_372127 ) ) ( not ( = ?auto_372124 ?auto_372128 ) ) ( not ( = ?auto_372124 ?auto_372129 ) ) ( not ( = ?auto_372125 ?auto_372126 ) ) ( not ( = ?auto_372125 ?auto_372127 ) ) ( not ( = ?auto_372125 ?auto_372128 ) ) ( not ( = ?auto_372125 ?auto_372129 ) ) ( not ( = ?auto_372126 ?auto_372127 ) ) ( not ( = ?auto_372126 ?auto_372128 ) ) ( not ( = ?auto_372126 ?auto_372129 ) ) ( not ( = ?auto_372127 ?auto_372128 ) ) ( not ( = ?auto_372127 ?auto_372129 ) ) ( not ( = ?auto_372128 ?auto_372129 ) ) ( ON ?auto_372127 ?auto_372128 ) ( ON ?auto_372126 ?auto_372127 ) ( ON ?auto_372125 ?auto_372126 ) ( CLEAR ?auto_372123 ) ( ON ?auto_372124 ?auto_372125 ) ( CLEAR ?auto_372124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_372120 ?auto_372121 ?auto_372122 ?auto_372123 ?auto_372124 )
      ( MAKE-9PILE ?auto_372120 ?auto_372121 ?auto_372122 ?auto_372123 ?auto_372124 ?auto_372125 ?auto_372126 ?auto_372127 ?auto_372128 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372139 - BLOCK
      ?auto_372140 - BLOCK
      ?auto_372141 - BLOCK
      ?auto_372142 - BLOCK
      ?auto_372143 - BLOCK
      ?auto_372144 - BLOCK
      ?auto_372145 - BLOCK
      ?auto_372146 - BLOCK
      ?auto_372147 - BLOCK
    )
    :vars
    (
      ?auto_372148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372147 ?auto_372148 ) ( ON-TABLE ?auto_372139 ) ( ON ?auto_372140 ?auto_372139 ) ( ON ?auto_372141 ?auto_372140 ) ( not ( = ?auto_372139 ?auto_372140 ) ) ( not ( = ?auto_372139 ?auto_372141 ) ) ( not ( = ?auto_372139 ?auto_372142 ) ) ( not ( = ?auto_372139 ?auto_372143 ) ) ( not ( = ?auto_372139 ?auto_372144 ) ) ( not ( = ?auto_372139 ?auto_372145 ) ) ( not ( = ?auto_372139 ?auto_372146 ) ) ( not ( = ?auto_372139 ?auto_372147 ) ) ( not ( = ?auto_372139 ?auto_372148 ) ) ( not ( = ?auto_372140 ?auto_372141 ) ) ( not ( = ?auto_372140 ?auto_372142 ) ) ( not ( = ?auto_372140 ?auto_372143 ) ) ( not ( = ?auto_372140 ?auto_372144 ) ) ( not ( = ?auto_372140 ?auto_372145 ) ) ( not ( = ?auto_372140 ?auto_372146 ) ) ( not ( = ?auto_372140 ?auto_372147 ) ) ( not ( = ?auto_372140 ?auto_372148 ) ) ( not ( = ?auto_372141 ?auto_372142 ) ) ( not ( = ?auto_372141 ?auto_372143 ) ) ( not ( = ?auto_372141 ?auto_372144 ) ) ( not ( = ?auto_372141 ?auto_372145 ) ) ( not ( = ?auto_372141 ?auto_372146 ) ) ( not ( = ?auto_372141 ?auto_372147 ) ) ( not ( = ?auto_372141 ?auto_372148 ) ) ( not ( = ?auto_372142 ?auto_372143 ) ) ( not ( = ?auto_372142 ?auto_372144 ) ) ( not ( = ?auto_372142 ?auto_372145 ) ) ( not ( = ?auto_372142 ?auto_372146 ) ) ( not ( = ?auto_372142 ?auto_372147 ) ) ( not ( = ?auto_372142 ?auto_372148 ) ) ( not ( = ?auto_372143 ?auto_372144 ) ) ( not ( = ?auto_372143 ?auto_372145 ) ) ( not ( = ?auto_372143 ?auto_372146 ) ) ( not ( = ?auto_372143 ?auto_372147 ) ) ( not ( = ?auto_372143 ?auto_372148 ) ) ( not ( = ?auto_372144 ?auto_372145 ) ) ( not ( = ?auto_372144 ?auto_372146 ) ) ( not ( = ?auto_372144 ?auto_372147 ) ) ( not ( = ?auto_372144 ?auto_372148 ) ) ( not ( = ?auto_372145 ?auto_372146 ) ) ( not ( = ?auto_372145 ?auto_372147 ) ) ( not ( = ?auto_372145 ?auto_372148 ) ) ( not ( = ?auto_372146 ?auto_372147 ) ) ( not ( = ?auto_372146 ?auto_372148 ) ) ( not ( = ?auto_372147 ?auto_372148 ) ) ( ON ?auto_372146 ?auto_372147 ) ( ON ?auto_372145 ?auto_372146 ) ( ON ?auto_372144 ?auto_372145 ) ( ON ?auto_372143 ?auto_372144 ) ( CLEAR ?auto_372141 ) ( ON ?auto_372142 ?auto_372143 ) ( CLEAR ?auto_372142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_372139 ?auto_372140 ?auto_372141 ?auto_372142 )
      ( MAKE-9PILE ?auto_372139 ?auto_372140 ?auto_372141 ?auto_372142 ?auto_372143 ?auto_372144 ?auto_372145 ?auto_372146 ?auto_372147 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372158 - BLOCK
      ?auto_372159 - BLOCK
      ?auto_372160 - BLOCK
      ?auto_372161 - BLOCK
      ?auto_372162 - BLOCK
      ?auto_372163 - BLOCK
      ?auto_372164 - BLOCK
      ?auto_372165 - BLOCK
      ?auto_372166 - BLOCK
    )
    :vars
    (
      ?auto_372167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372166 ?auto_372167 ) ( ON-TABLE ?auto_372158 ) ( ON ?auto_372159 ?auto_372158 ) ( ON ?auto_372160 ?auto_372159 ) ( not ( = ?auto_372158 ?auto_372159 ) ) ( not ( = ?auto_372158 ?auto_372160 ) ) ( not ( = ?auto_372158 ?auto_372161 ) ) ( not ( = ?auto_372158 ?auto_372162 ) ) ( not ( = ?auto_372158 ?auto_372163 ) ) ( not ( = ?auto_372158 ?auto_372164 ) ) ( not ( = ?auto_372158 ?auto_372165 ) ) ( not ( = ?auto_372158 ?auto_372166 ) ) ( not ( = ?auto_372158 ?auto_372167 ) ) ( not ( = ?auto_372159 ?auto_372160 ) ) ( not ( = ?auto_372159 ?auto_372161 ) ) ( not ( = ?auto_372159 ?auto_372162 ) ) ( not ( = ?auto_372159 ?auto_372163 ) ) ( not ( = ?auto_372159 ?auto_372164 ) ) ( not ( = ?auto_372159 ?auto_372165 ) ) ( not ( = ?auto_372159 ?auto_372166 ) ) ( not ( = ?auto_372159 ?auto_372167 ) ) ( not ( = ?auto_372160 ?auto_372161 ) ) ( not ( = ?auto_372160 ?auto_372162 ) ) ( not ( = ?auto_372160 ?auto_372163 ) ) ( not ( = ?auto_372160 ?auto_372164 ) ) ( not ( = ?auto_372160 ?auto_372165 ) ) ( not ( = ?auto_372160 ?auto_372166 ) ) ( not ( = ?auto_372160 ?auto_372167 ) ) ( not ( = ?auto_372161 ?auto_372162 ) ) ( not ( = ?auto_372161 ?auto_372163 ) ) ( not ( = ?auto_372161 ?auto_372164 ) ) ( not ( = ?auto_372161 ?auto_372165 ) ) ( not ( = ?auto_372161 ?auto_372166 ) ) ( not ( = ?auto_372161 ?auto_372167 ) ) ( not ( = ?auto_372162 ?auto_372163 ) ) ( not ( = ?auto_372162 ?auto_372164 ) ) ( not ( = ?auto_372162 ?auto_372165 ) ) ( not ( = ?auto_372162 ?auto_372166 ) ) ( not ( = ?auto_372162 ?auto_372167 ) ) ( not ( = ?auto_372163 ?auto_372164 ) ) ( not ( = ?auto_372163 ?auto_372165 ) ) ( not ( = ?auto_372163 ?auto_372166 ) ) ( not ( = ?auto_372163 ?auto_372167 ) ) ( not ( = ?auto_372164 ?auto_372165 ) ) ( not ( = ?auto_372164 ?auto_372166 ) ) ( not ( = ?auto_372164 ?auto_372167 ) ) ( not ( = ?auto_372165 ?auto_372166 ) ) ( not ( = ?auto_372165 ?auto_372167 ) ) ( not ( = ?auto_372166 ?auto_372167 ) ) ( ON ?auto_372165 ?auto_372166 ) ( ON ?auto_372164 ?auto_372165 ) ( ON ?auto_372163 ?auto_372164 ) ( ON ?auto_372162 ?auto_372163 ) ( CLEAR ?auto_372160 ) ( ON ?auto_372161 ?auto_372162 ) ( CLEAR ?auto_372161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_372158 ?auto_372159 ?auto_372160 ?auto_372161 )
      ( MAKE-9PILE ?auto_372158 ?auto_372159 ?auto_372160 ?auto_372161 ?auto_372162 ?auto_372163 ?auto_372164 ?auto_372165 ?auto_372166 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372177 - BLOCK
      ?auto_372178 - BLOCK
      ?auto_372179 - BLOCK
      ?auto_372180 - BLOCK
      ?auto_372181 - BLOCK
      ?auto_372182 - BLOCK
      ?auto_372183 - BLOCK
      ?auto_372184 - BLOCK
      ?auto_372185 - BLOCK
    )
    :vars
    (
      ?auto_372186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372185 ?auto_372186 ) ( ON-TABLE ?auto_372177 ) ( ON ?auto_372178 ?auto_372177 ) ( not ( = ?auto_372177 ?auto_372178 ) ) ( not ( = ?auto_372177 ?auto_372179 ) ) ( not ( = ?auto_372177 ?auto_372180 ) ) ( not ( = ?auto_372177 ?auto_372181 ) ) ( not ( = ?auto_372177 ?auto_372182 ) ) ( not ( = ?auto_372177 ?auto_372183 ) ) ( not ( = ?auto_372177 ?auto_372184 ) ) ( not ( = ?auto_372177 ?auto_372185 ) ) ( not ( = ?auto_372177 ?auto_372186 ) ) ( not ( = ?auto_372178 ?auto_372179 ) ) ( not ( = ?auto_372178 ?auto_372180 ) ) ( not ( = ?auto_372178 ?auto_372181 ) ) ( not ( = ?auto_372178 ?auto_372182 ) ) ( not ( = ?auto_372178 ?auto_372183 ) ) ( not ( = ?auto_372178 ?auto_372184 ) ) ( not ( = ?auto_372178 ?auto_372185 ) ) ( not ( = ?auto_372178 ?auto_372186 ) ) ( not ( = ?auto_372179 ?auto_372180 ) ) ( not ( = ?auto_372179 ?auto_372181 ) ) ( not ( = ?auto_372179 ?auto_372182 ) ) ( not ( = ?auto_372179 ?auto_372183 ) ) ( not ( = ?auto_372179 ?auto_372184 ) ) ( not ( = ?auto_372179 ?auto_372185 ) ) ( not ( = ?auto_372179 ?auto_372186 ) ) ( not ( = ?auto_372180 ?auto_372181 ) ) ( not ( = ?auto_372180 ?auto_372182 ) ) ( not ( = ?auto_372180 ?auto_372183 ) ) ( not ( = ?auto_372180 ?auto_372184 ) ) ( not ( = ?auto_372180 ?auto_372185 ) ) ( not ( = ?auto_372180 ?auto_372186 ) ) ( not ( = ?auto_372181 ?auto_372182 ) ) ( not ( = ?auto_372181 ?auto_372183 ) ) ( not ( = ?auto_372181 ?auto_372184 ) ) ( not ( = ?auto_372181 ?auto_372185 ) ) ( not ( = ?auto_372181 ?auto_372186 ) ) ( not ( = ?auto_372182 ?auto_372183 ) ) ( not ( = ?auto_372182 ?auto_372184 ) ) ( not ( = ?auto_372182 ?auto_372185 ) ) ( not ( = ?auto_372182 ?auto_372186 ) ) ( not ( = ?auto_372183 ?auto_372184 ) ) ( not ( = ?auto_372183 ?auto_372185 ) ) ( not ( = ?auto_372183 ?auto_372186 ) ) ( not ( = ?auto_372184 ?auto_372185 ) ) ( not ( = ?auto_372184 ?auto_372186 ) ) ( not ( = ?auto_372185 ?auto_372186 ) ) ( ON ?auto_372184 ?auto_372185 ) ( ON ?auto_372183 ?auto_372184 ) ( ON ?auto_372182 ?auto_372183 ) ( ON ?auto_372181 ?auto_372182 ) ( ON ?auto_372180 ?auto_372181 ) ( CLEAR ?auto_372178 ) ( ON ?auto_372179 ?auto_372180 ) ( CLEAR ?auto_372179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_372177 ?auto_372178 ?auto_372179 )
      ( MAKE-9PILE ?auto_372177 ?auto_372178 ?auto_372179 ?auto_372180 ?auto_372181 ?auto_372182 ?auto_372183 ?auto_372184 ?auto_372185 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372196 - BLOCK
      ?auto_372197 - BLOCK
      ?auto_372198 - BLOCK
      ?auto_372199 - BLOCK
      ?auto_372200 - BLOCK
      ?auto_372201 - BLOCK
      ?auto_372202 - BLOCK
      ?auto_372203 - BLOCK
      ?auto_372204 - BLOCK
    )
    :vars
    (
      ?auto_372205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372204 ?auto_372205 ) ( ON-TABLE ?auto_372196 ) ( ON ?auto_372197 ?auto_372196 ) ( not ( = ?auto_372196 ?auto_372197 ) ) ( not ( = ?auto_372196 ?auto_372198 ) ) ( not ( = ?auto_372196 ?auto_372199 ) ) ( not ( = ?auto_372196 ?auto_372200 ) ) ( not ( = ?auto_372196 ?auto_372201 ) ) ( not ( = ?auto_372196 ?auto_372202 ) ) ( not ( = ?auto_372196 ?auto_372203 ) ) ( not ( = ?auto_372196 ?auto_372204 ) ) ( not ( = ?auto_372196 ?auto_372205 ) ) ( not ( = ?auto_372197 ?auto_372198 ) ) ( not ( = ?auto_372197 ?auto_372199 ) ) ( not ( = ?auto_372197 ?auto_372200 ) ) ( not ( = ?auto_372197 ?auto_372201 ) ) ( not ( = ?auto_372197 ?auto_372202 ) ) ( not ( = ?auto_372197 ?auto_372203 ) ) ( not ( = ?auto_372197 ?auto_372204 ) ) ( not ( = ?auto_372197 ?auto_372205 ) ) ( not ( = ?auto_372198 ?auto_372199 ) ) ( not ( = ?auto_372198 ?auto_372200 ) ) ( not ( = ?auto_372198 ?auto_372201 ) ) ( not ( = ?auto_372198 ?auto_372202 ) ) ( not ( = ?auto_372198 ?auto_372203 ) ) ( not ( = ?auto_372198 ?auto_372204 ) ) ( not ( = ?auto_372198 ?auto_372205 ) ) ( not ( = ?auto_372199 ?auto_372200 ) ) ( not ( = ?auto_372199 ?auto_372201 ) ) ( not ( = ?auto_372199 ?auto_372202 ) ) ( not ( = ?auto_372199 ?auto_372203 ) ) ( not ( = ?auto_372199 ?auto_372204 ) ) ( not ( = ?auto_372199 ?auto_372205 ) ) ( not ( = ?auto_372200 ?auto_372201 ) ) ( not ( = ?auto_372200 ?auto_372202 ) ) ( not ( = ?auto_372200 ?auto_372203 ) ) ( not ( = ?auto_372200 ?auto_372204 ) ) ( not ( = ?auto_372200 ?auto_372205 ) ) ( not ( = ?auto_372201 ?auto_372202 ) ) ( not ( = ?auto_372201 ?auto_372203 ) ) ( not ( = ?auto_372201 ?auto_372204 ) ) ( not ( = ?auto_372201 ?auto_372205 ) ) ( not ( = ?auto_372202 ?auto_372203 ) ) ( not ( = ?auto_372202 ?auto_372204 ) ) ( not ( = ?auto_372202 ?auto_372205 ) ) ( not ( = ?auto_372203 ?auto_372204 ) ) ( not ( = ?auto_372203 ?auto_372205 ) ) ( not ( = ?auto_372204 ?auto_372205 ) ) ( ON ?auto_372203 ?auto_372204 ) ( ON ?auto_372202 ?auto_372203 ) ( ON ?auto_372201 ?auto_372202 ) ( ON ?auto_372200 ?auto_372201 ) ( ON ?auto_372199 ?auto_372200 ) ( CLEAR ?auto_372197 ) ( ON ?auto_372198 ?auto_372199 ) ( CLEAR ?auto_372198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_372196 ?auto_372197 ?auto_372198 )
      ( MAKE-9PILE ?auto_372196 ?auto_372197 ?auto_372198 ?auto_372199 ?auto_372200 ?auto_372201 ?auto_372202 ?auto_372203 ?auto_372204 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372215 - BLOCK
      ?auto_372216 - BLOCK
      ?auto_372217 - BLOCK
      ?auto_372218 - BLOCK
      ?auto_372219 - BLOCK
      ?auto_372220 - BLOCK
      ?auto_372221 - BLOCK
      ?auto_372222 - BLOCK
      ?auto_372223 - BLOCK
    )
    :vars
    (
      ?auto_372224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372223 ?auto_372224 ) ( ON-TABLE ?auto_372215 ) ( not ( = ?auto_372215 ?auto_372216 ) ) ( not ( = ?auto_372215 ?auto_372217 ) ) ( not ( = ?auto_372215 ?auto_372218 ) ) ( not ( = ?auto_372215 ?auto_372219 ) ) ( not ( = ?auto_372215 ?auto_372220 ) ) ( not ( = ?auto_372215 ?auto_372221 ) ) ( not ( = ?auto_372215 ?auto_372222 ) ) ( not ( = ?auto_372215 ?auto_372223 ) ) ( not ( = ?auto_372215 ?auto_372224 ) ) ( not ( = ?auto_372216 ?auto_372217 ) ) ( not ( = ?auto_372216 ?auto_372218 ) ) ( not ( = ?auto_372216 ?auto_372219 ) ) ( not ( = ?auto_372216 ?auto_372220 ) ) ( not ( = ?auto_372216 ?auto_372221 ) ) ( not ( = ?auto_372216 ?auto_372222 ) ) ( not ( = ?auto_372216 ?auto_372223 ) ) ( not ( = ?auto_372216 ?auto_372224 ) ) ( not ( = ?auto_372217 ?auto_372218 ) ) ( not ( = ?auto_372217 ?auto_372219 ) ) ( not ( = ?auto_372217 ?auto_372220 ) ) ( not ( = ?auto_372217 ?auto_372221 ) ) ( not ( = ?auto_372217 ?auto_372222 ) ) ( not ( = ?auto_372217 ?auto_372223 ) ) ( not ( = ?auto_372217 ?auto_372224 ) ) ( not ( = ?auto_372218 ?auto_372219 ) ) ( not ( = ?auto_372218 ?auto_372220 ) ) ( not ( = ?auto_372218 ?auto_372221 ) ) ( not ( = ?auto_372218 ?auto_372222 ) ) ( not ( = ?auto_372218 ?auto_372223 ) ) ( not ( = ?auto_372218 ?auto_372224 ) ) ( not ( = ?auto_372219 ?auto_372220 ) ) ( not ( = ?auto_372219 ?auto_372221 ) ) ( not ( = ?auto_372219 ?auto_372222 ) ) ( not ( = ?auto_372219 ?auto_372223 ) ) ( not ( = ?auto_372219 ?auto_372224 ) ) ( not ( = ?auto_372220 ?auto_372221 ) ) ( not ( = ?auto_372220 ?auto_372222 ) ) ( not ( = ?auto_372220 ?auto_372223 ) ) ( not ( = ?auto_372220 ?auto_372224 ) ) ( not ( = ?auto_372221 ?auto_372222 ) ) ( not ( = ?auto_372221 ?auto_372223 ) ) ( not ( = ?auto_372221 ?auto_372224 ) ) ( not ( = ?auto_372222 ?auto_372223 ) ) ( not ( = ?auto_372222 ?auto_372224 ) ) ( not ( = ?auto_372223 ?auto_372224 ) ) ( ON ?auto_372222 ?auto_372223 ) ( ON ?auto_372221 ?auto_372222 ) ( ON ?auto_372220 ?auto_372221 ) ( ON ?auto_372219 ?auto_372220 ) ( ON ?auto_372218 ?auto_372219 ) ( ON ?auto_372217 ?auto_372218 ) ( CLEAR ?auto_372215 ) ( ON ?auto_372216 ?auto_372217 ) ( CLEAR ?auto_372216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_372215 ?auto_372216 )
      ( MAKE-9PILE ?auto_372215 ?auto_372216 ?auto_372217 ?auto_372218 ?auto_372219 ?auto_372220 ?auto_372221 ?auto_372222 ?auto_372223 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372234 - BLOCK
      ?auto_372235 - BLOCK
      ?auto_372236 - BLOCK
      ?auto_372237 - BLOCK
      ?auto_372238 - BLOCK
      ?auto_372239 - BLOCK
      ?auto_372240 - BLOCK
      ?auto_372241 - BLOCK
      ?auto_372242 - BLOCK
    )
    :vars
    (
      ?auto_372243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372242 ?auto_372243 ) ( ON-TABLE ?auto_372234 ) ( not ( = ?auto_372234 ?auto_372235 ) ) ( not ( = ?auto_372234 ?auto_372236 ) ) ( not ( = ?auto_372234 ?auto_372237 ) ) ( not ( = ?auto_372234 ?auto_372238 ) ) ( not ( = ?auto_372234 ?auto_372239 ) ) ( not ( = ?auto_372234 ?auto_372240 ) ) ( not ( = ?auto_372234 ?auto_372241 ) ) ( not ( = ?auto_372234 ?auto_372242 ) ) ( not ( = ?auto_372234 ?auto_372243 ) ) ( not ( = ?auto_372235 ?auto_372236 ) ) ( not ( = ?auto_372235 ?auto_372237 ) ) ( not ( = ?auto_372235 ?auto_372238 ) ) ( not ( = ?auto_372235 ?auto_372239 ) ) ( not ( = ?auto_372235 ?auto_372240 ) ) ( not ( = ?auto_372235 ?auto_372241 ) ) ( not ( = ?auto_372235 ?auto_372242 ) ) ( not ( = ?auto_372235 ?auto_372243 ) ) ( not ( = ?auto_372236 ?auto_372237 ) ) ( not ( = ?auto_372236 ?auto_372238 ) ) ( not ( = ?auto_372236 ?auto_372239 ) ) ( not ( = ?auto_372236 ?auto_372240 ) ) ( not ( = ?auto_372236 ?auto_372241 ) ) ( not ( = ?auto_372236 ?auto_372242 ) ) ( not ( = ?auto_372236 ?auto_372243 ) ) ( not ( = ?auto_372237 ?auto_372238 ) ) ( not ( = ?auto_372237 ?auto_372239 ) ) ( not ( = ?auto_372237 ?auto_372240 ) ) ( not ( = ?auto_372237 ?auto_372241 ) ) ( not ( = ?auto_372237 ?auto_372242 ) ) ( not ( = ?auto_372237 ?auto_372243 ) ) ( not ( = ?auto_372238 ?auto_372239 ) ) ( not ( = ?auto_372238 ?auto_372240 ) ) ( not ( = ?auto_372238 ?auto_372241 ) ) ( not ( = ?auto_372238 ?auto_372242 ) ) ( not ( = ?auto_372238 ?auto_372243 ) ) ( not ( = ?auto_372239 ?auto_372240 ) ) ( not ( = ?auto_372239 ?auto_372241 ) ) ( not ( = ?auto_372239 ?auto_372242 ) ) ( not ( = ?auto_372239 ?auto_372243 ) ) ( not ( = ?auto_372240 ?auto_372241 ) ) ( not ( = ?auto_372240 ?auto_372242 ) ) ( not ( = ?auto_372240 ?auto_372243 ) ) ( not ( = ?auto_372241 ?auto_372242 ) ) ( not ( = ?auto_372241 ?auto_372243 ) ) ( not ( = ?auto_372242 ?auto_372243 ) ) ( ON ?auto_372241 ?auto_372242 ) ( ON ?auto_372240 ?auto_372241 ) ( ON ?auto_372239 ?auto_372240 ) ( ON ?auto_372238 ?auto_372239 ) ( ON ?auto_372237 ?auto_372238 ) ( ON ?auto_372236 ?auto_372237 ) ( CLEAR ?auto_372234 ) ( ON ?auto_372235 ?auto_372236 ) ( CLEAR ?auto_372235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_372234 ?auto_372235 )
      ( MAKE-9PILE ?auto_372234 ?auto_372235 ?auto_372236 ?auto_372237 ?auto_372238 ?auto_372239 ?auto_372240 ?auto_372241 ?auto_372242 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372253 - BLOCK
      ?auto_372254 - BLOCK
      ?auto_372255 - BLOCK
      ?auto_372256 - BLOCK
      ?auto_372257 - BLOCK
      ?auto_372258 - BLOCK
      ?auto_372259 - BLOCK
      ?auto_372260 - BLOCK
      ?auto_372261 - BLOCK
    )
    :vars
    (
      ?auto_372262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372261 ?auto_372262 ) ( not ( = ?auto_372253 ?auto_372254 ) ) ( not ( = ?auto_372253 ?auto_372255 ) ) ( not ( = ?auto_372253 ?auto_372256 ) ) ( not ( = ?auto_372253 ?auto_372257 ) ) ( not ( = ?auto_372253 ?auto_372258 ) ) ( not ( = ?auto_372253 ?auto_372259 ) ) ( not ( = ?auto_372253 ?auto_372260 ) ) ( not ( = ?auto_372253 ?auto_372261 ) ) ( not ( = ?auto_372253 ?auto_372262 ) ) ( not ( = ?auto_372254 ?auto_372255 ) ) ( not ( = ?auto_372254 ?auto_372256 ) ) ( not ( = ?auto_372254 ?auto_372257 ) ) ( not ( = ?auto_372254 ?auto_372258 ) ) ( not ( = ?auto_372254 ?auto_372259 ) ) ( not ( = ?auto_372254 ?auto_372260 ) ) ( not ( = ?auto_372254 ?auto_372261 ) ) ( not ( = ?auto_372254 ?auto_372262 ) ) ( not ( = ?auto_372255 ?auto_372256 ) ) ( not ( = ?auto_372255 ?auto_372257 ) ) ( not ( = ?auto_372255 ?auto_372258 ) ) ( not ( = ?auto_372255 ?auto_372259 ) ) ( not ( = ?auto_372255 ?auto_372260 ) ) ( not ( = ?auto_372255 ?auto_372261 ) ) ( not ( = ?auto_372255 ?auto_372262 ) ) ( not ( = ?auto_372256 ?auto_372257 ) ) ( not ( = ?auto_372256 ?auto_372258 ) ) ( not ( = ?auto_372256 ?auto_372259 ) ) ( not ( = ?auto_372256 ?auto_372260 ) ) ( not ( = ?auto_372256 ?auto_372261 ) ) ( not ( = ?auto_372256 ?auto_372262 ) ) ( not ( = ?auto_372257 ?auto_372258 ) ) ( not ( = ?auto_372257 ?auto_372259 ) ) ( not ( = ?auto_372257 ?auto_372260 ) ) ( not ( = ?auto_372257 ?auto_372261 ) ) ( not ( = ?auto_372257 ?auto_372262 ) ) ( not ( = ?auto_372258 ?auto_372259 ) ) ( not ( = ?auto_372258 ?auto_372260 ) ) ( not ( = ?auto_372258 ?auto_372261 ) ) ( not ( = ?auto_372258 ?auto_372262 ) ) ( not ( = ?auto_372259 ?auto_372260 ) ) ( not ( = ?auto_372259 ?auto_372261 ) ) ( not ( = ?auto_372259 ?auto_372262 ) ) ( not ( = ?auto_372260 ?auto_372261 ) ) ( not ( = ?auto_372260 ?auto_372262 ) ) ( not ( = ?auto_372261 ?auto_372262 ) ) ( ON ?auto_372260 ?auto_372261 ) ( ON ?auto_372259 ?auto_372260 ) ( ON ?auto_372258 ?auto_372259 ) ( ON ?auto_372257 ?auto_372258 ) ( ON ?auto_372256 ?auto_372257 ) ( ON ?auto_372255 ?auto_372256 ) ( ON ?auto_372254 ?auto_372255 ) ( ON ?auto_372253 ?auto_372254 ) ( CLEAR ?auto_372253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_372253 )
      ( MAKE-9PILE ?auto_372253 ?auto_372254 ?auto_372255 ?auto_372256 ?auto_372257 ?auto_372258 ?auto_372259 ?auto_372260 ?auto_372261 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_372272 - BLOCK
      ?auto_372273 - BLOCK
      ?auto_372274 - BLOCK
      ?auto_372275 - BLOCK
      ?auto_372276 - BLOCK
      ?auto_372277 - BLOCK
      ?auto_372278 - BLOCK
      ?auto_372279 - BLOCK
      ?auto_372280 - BLOCK
    )
    :vars
    (
      ?auto_372281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372280 ?auto_372281 ) ( not ( = ?auto_372272 ?auto_372273 ) ) ( not ( = ?auto_372272 ?auto_372274 ) ) ( not ( = ?auto_372272 ?auto_372275 ) ) ( not ( = ?auto_372272 ?auto_372276 ) ) ( not ( = ?auto_372272 ?auto_372277 ) ) ( not ( = ?auto_372272 ?auto_372278 ) ) ( not ( = ?auto_372272 ?auto_372279 ) ) ( not ( = ?auto_372272 ?auto_372280 ) ) ( not ( = ?auto_372272 ?auto_372281 ) ) ( not ( = ?auto_372273 ?auto_372274 ) ) ( not ( = ?auto_372273 ?auto_372275 ) ) ( not ( = ?auto_372273 ?auto_372276 ) ) ( not ( = ?auto_372273 ?auto_372277 ) ) ( not ( = ?auto_372273 ?auto_372278 ) ) ( not ( = ?auto_372273 ?auto_372279 ) ) ( not ( = ?auto_372273 ?auto_372280 ) ) ( not ( = ?auto_372273 ?auto_372281 ) ) ( not ( = ?auto_372274 ?auto_372275 ) ) ( not ( = ?auto_372274 ?auto_372276 ) ) ( not ( = ?auto_372274 ?auto_372277 ) ) ( not ( = ?auto_372274 ?auto_372278 ) ) ( not ( = ?auto_372274 ?auto_372279 ) ) ( not ( = ?auto_372274 ?auto_372280 ) ) ( not ( = ?auto_372274 ?auto_372281 ) ) ( not ( = ?auto_372275 ?auto_372276 ) ) ( not ( = ?auto_372275 ?auto_372277 ) ) ( not ( = ?auto_372275 ?auto_372278 ) ) ( not ( = ?auto_372275 ?auto_372279 ) ) ( not ( = ?auto_372275 ?auto_372280 ) ) ( not ( = ?auto_372275 ?auto_372281 ) ) ( not ( = ?auto_372276 ?auto_372277 ) ) ( not ( = ?auto_372276 ?auto_372278 ) ) ( not ( = ?auto_372276 ?auto_372279 ) ) ( not ( = ?auto_372276 ?auto_372280 ) ) ( not ( = ?auto_372276 ?auto_372281 ) ) ( not ( = ?auto_372277 ?auto_372278 ) ) ( not ( = ?auto_372277 ?auto_372279 ) ) ( not ( = ?auto_372277 ?auto_372280 ) ) ( not ( = ?auto_372277 ?auto_372281 ) ) ( not ( = ?auto_372278 ?auto_372279 ) ) ( not ( = ?auto_372278 ?auto_372280 ) ) ( not ( = ?auto_372278 ?auto_372281 ) ) ( not ( = ?auto_372279 ?auto_372280 ) ) ( not ( = ?auto_372279 ?auto_372281 ) ) ( not ( = ?auto_372280 ?auto_372281 ) ) ( ON ?auto_372279 ?auto_372280 ) ( ON ?auto_372278 ?auto_372279 ) ( ON ?auto_372277 ?auto_372278 ) ( ON ?auto_372276 ?auto_372277 ) ( ON ?auto_372275 ?auto_372276 ) ( ON ?auto_372274 ?auto_372275 ) ( ON ?auto_372273 ?auto_372274 ) ( ON ?auto_372272 ?auto_372273 ) ( CLEAR ?auto_372272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_372272 )
      ( MAKE-9PILE ?auto_372272 ?auto_372273 ?auto_372274 ?auto_372275 ?auto_372276 ?auto_372277 ?auto_372278 ?auto_372279 ?auto_372280 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372292 - BLOCK
      ?auto_372293 - BLOCK
      ?auto_372294 - BLOCK
      ?auto_372295 - BLOCK
      ?auto_372296 - BLOCK
      ?auto_372297 - BLOCK
      ?auto_372298 - BLOCK
      ?auto_372299 - BLOCK
      ?auto_372300 - BLOCK
      ?auto_372301 - BLOCK
    )
    :vars
    (
      ?auto_372302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_372300 ) ( ON ?auto_372301 ?auto_372302 ) ( CLEAR ?auto_372301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_372292 ) ( ON ?auto_372293 ?auto_372292 ) ( ON ?auto_372294 ?auto_372293 ) ( ON ?auto_372295 ?auto_372294 ) ( ON ?auto_372296 ?auto_372295 ) ( ON ?auto_372297 ?auto_372296 ) ( ON ?auto_372298 ?auto_372297 ) ( ON ?auto_372299 ?auto_372298 ) ( ON ?auto_372300 ?auto_372299 ) ( not ( = ?auto_372292 ?auto_372293 ) ) ( not ( = ?auto_372292 ?auto_372294 ) ) ( not ( = ?auto_372292 ?auto_372295 ) ) ( not ( = ?auto_372292 ?auto_372296 ) ) ( not ( = ?auto_372292 ?auto_372297 ) ) ( not ( = ?auto_372292 ?auto_372298 ) ) ( not ( = ?auto_372292 ?auto_372299 ) ) ( not ( = ?auto_372292 ?auto_372300 ) ) ( not ( = ?auto_372292 ?auto_372301 ) ) ( not ( = ?auto_372292 ?auto_372302 ) ) ( not ( = ?auto_372293 ?auto_372294 ) ) ( not ( = ?auto_372293 ?auto_372295 ) ) ( not ( = ?auto_372293 ?auto_372296 ) ) ( not ( = ?auto_372293 ?auto_372297 ) ) ( not ( = ?auto_372293 ?auto_372298 ) ) ( not ( = ?auto_372293 ?auto_372299 ) ) ( not ( = ?auto_372293 ?auto_372300 ) ) ( not ( = ?auto_372293 ?auto_372301 ) ) ( not ( = ?auto_372293 ?auto_372302 ) ) ( not ( = ?auto_372294 ?auto_372295 ) ) ( not ( = ?auto_372294 ?auto_372296 ) ) ( not ( = ?auto_372294 ?auto_372297 ) ) ( not ( = ?auto_372294 ?auto_372298 ) ) ( not ( = ?auto_372294 ?auto_372299 ) ) ( not ( = ?auto_372294 ?auto_372300 ) ) ( not ( = ?auto_372294 ?auto_372301 ) ) ( not ( = ?auto_372294 ?auto_372302 ) ) ( not ( = ?auto_372295 ?auto_372296 ) ) ( not ( = ?auto_372295 ?auto_372297 ) ) ( not ( = ?auto_372295 ?auto_372298 ) ) ( not ( = ?auto_372295 ?auto_372299 ) ) ( not ( = ?auto_372295 ?auto_372300 ) ) ( not ( = ?auto_372295 ?auto_372301 ) ) ( not ( = ?auto_372295 ?auto_372302 ) ) ( not ( = ?auto_372296 ?auto_372297 ) ) ( not ( = ?auto_372296 ?auto_372298 ) ) ( not ( = ?auto_372296 ?auto_372299 ) ) ( not ( = ?auto_372296 ?auto_372300 ) ) ( not ( = ?auto_372296 ?auto_372301 ) ) ( not ( = ?auto_372296 ?auto_372302 ) ) ( not ( = ?auto_372297 ?auto_372298 ) ) ( not ( = ?auto_372297 ?auto_372299 ) ) ( not ( = ?auto_372297 ?auto_372300 ) ) ( not ( = ?auto_372297 ?auto_372301 ) ) ( not ( = ?auto_372297 ?auto_372302 ) ) ( not ( = ?auto_372298 ?auto_372299 ) ) ( not ( = ?auto_372298 ?auto_372300 ) ) ( not ( = ?auto_372298 ?auto_372301 ) ) ( not ( = ?auto_372298 ?auto_372302 ) ) ( not ( = ?auto_372299 ?auto_372300 ) ) ( not ( = ?auto_372299 ?auto_372301 ) ) ( not ( = ?auto_372299 ?auto_372302 ) ) ( not ( = ?auto_372300 ?auto_372301 ) ) ( not ( = ?auto_372300 ?auto_372302 ) ) ( not ( = ?auto_372301 ?auto_372302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_372301 ?auto_372302 )
      ( !STACK ?auto_372301 ?auto_372300 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372313 - BLOCK
      ?auto_372314 - BLOCK
      ?auto_372315 - BLOCK
      ?auto_372316 - BLOCK
      ?auto_372317 - BLOCK
      ?auto_372318 - BLOCK
      ?auto_372319 - BLOCK
      ?auto_372320 - BLOCK
      ?auto_372321 - BLOCK
      ?auto_372322 - BLOCK
    )
    :vars
    (
      ?auto_372323 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_372321 ) ( ON ?auto_372322 ?auto_372323 ) ( CLEAR ?auto_372322 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_372313 ) ( ON ?auto_372314 ?auto_372313 ) ( ON ?auto_372315 ?auto_372314 ) ( ON ?auto_372316 ?auto_372315 ) ( ON ?auto_372317 ?auto_372316 ) ( ON ?auto_372318 ?auto_372317 ) ( ON ?auto_372319 ?auto_372318 ) ( ON ?auto_372320 ?auto_372319 ) ( ON ?auto_372321 ?auto_372320 ) ( not ( = ?auto_372313 ?auto_372314 ) ) ( not ( = ?auto_372313 ?auto_372315 ) ) ( not ( = ?auto_372313 ?auto_372316 ) ) ( not ( = ?auto_372313 ?auto_372317 ) ) ( not ( = ?auto_372313 ?auto_372318 ) ) ( not ( = ?auto_372313 ?auto_372319 ) ) ( not ( = ?auto_372313 ?auto_372320 ) ) ( not ( = ?auto_372313 ?auto_372321 ) ) ( not ( = ?auto_372313 ?auto_372322 ) ) ( not ( = ?auto_372313 ?auto_372323 ) ) ( not ( = ?auto_372314 ?auto_372315 ) ) ( not ( = ?auto_372314 ?auto_372316 ) ) ( not ( = ?auto_372314 ?auto_372317 ) ) ( not ( = ?auto_372314 ?auto_372318 ) ) ( not ( = ?auto_372314 ?auto_372319 ) ) ( not ( = ?auto_372314 ?auto_372320 ) ) ( not ( = ?auto_372314 ?auto_372321 ) ) ( not ( = ?auto_372314 ?auto_372322 ) ) ( not ( = ?auto_372314 ?auto_372323 ) ) ( not ( = ?auto_372315 ?auto_372316 ) ) ( not ( = ?auto_372315 ?auto_372317 ) ) ( not ( = ?auto_372315 ?auto_372318 ) ) ( not ( = ?auto_372315 ?auto_372319 ) ) ( not ( = ?auto_372315 ?auto_372320 ) ) ( not ( = ?auto_372315 ?auto_372321 ) ) ( not ( = ?auto_372315 ?auto_372322 ) ) ( not ( = ?auto_372315 ?auto_372323 ) ) ( not ( = ?auto_372316 ?auto_372317 ) ) ( not ( = ?auto_372316 ?auto_372318 ) ) ( not ( = ?auto_372316 ?auto_372319 ) ) ( not ( = ?auto_372316 ?auto_372320 ) ) ( not ( = ?auto_372316 ?auto_372321 ) ) ( not ( = ?auto_372316 ?auto_372322 ) ) ( not ( = ?auto_372316 ?auto_372323 ) ) ( not ( = ?auto_372317 ?auto_372318 ) ) ( not ( = ?auto_372317 ?auto_372319 ) ) ( not ( = ?auto_372317 ?auto_372320 ) ) ( not ( = ?auto_372317 ?auto_372321 ) ) ( not ( = ?auto_372317 ?auto_372322 ) ) ( not ( = ?auto_372317 ?auto_372323 ) ) ( not ( = ?auto_372318 ?auto_372319 ) ) ( not ( = ?auto_372318 ?auto_372320 ) ) ( not ( = ?auto_372318 ?auto_372321 ) ) ( not ( = ?auto_372318 ?auto_372322 ) ) ( not ( = ?auto_372318 ?auto_372323 ) ) ( not ( = ?auto_372319 ?auto_372320 ) ) ( not ( = ?auto_372319 ?auto_372321 ) ) ( not ( = ?auto_372319 ?auto_372322 ) ) ( not ( = ?auto_372319 ?auto_372323 ) ) ( not ( = ?auto_372320 ?auto_372321 ) ) ( not ( = ?auto_372320 ?auto_372322 ) ) ( not ( = ?auto_372320 ?auto_372323 ) ) ( not ( = ?auto_372321 ?auto_372322 ) ) ( not ( = ?auto_372321 ?auto_372323 ) ) ( not ( = ?auto_372322 ?auto_372323 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_372322 ?auto_372323 )
      ( !STACK ?auto_372322 ?auto_372321 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372334 - BLOCK
      ?auto_372335 - BLOCK
      ?auto_372336 - BLOCK
      ?auto_372337 - BLOCK
      ?auto_372338 - BLOCK
      ?auto_372339 - BLOCK
      ?auto_372340 - BLOCK
      ?auto_372341 - BLOCK
      ?auto_372342 - BLOCK
      ?auto_372343 - BLOCK
    )
    :vars
    (
      ?auto_372344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372343 ?auto_372344 ) ( ON-TABLE ?auto_372334 ) ( ON ?auto_372335 ?auto_372334 ) ( ON ?auto_372336 ?auto_372335 ) ( ON ?auto_372337 ?auto_372336 ) ( ON ?auto_372338 ?auto_372337 ) ( ON ?auto_372339 ?auto_372338 ) ( ON ?auto_372340 ?auto_372339 ) ( ON ?auto_372341 ?auto_372340 ) ( not ( = ?auto_372334 ?auto_372335 ) ) ( not ( = ?auto_372334 ?auto_372336 ) ) ( not ( = ?auto_372334 ?auto_372337 ) ) ( not ( = ?auto_372334 ?auto_372338 ) ) ( not ( = ?auto_372334 ?auto_372339 ) ) ( not ( = ?auto_372334 ?auto_372340 ) ) ( not ( = ?auto_372334 ?auto_372341 ) ) ( not ( = ?auto_372334 ?auto_372342 ) ) ( not ( = ?auto_372334 ?auto_372343 ) ) ( not ( = ?auto_372334 ?auto_372344 ) ) ( not ( = ?auto_372335 ?auto_372336 ) ) ( not ( = ?auto_372335 ?auto_372337 ) ) ( not ( = ?auto_372335 ?auto_372338 ) ) ( not ( = ?auto_372335 ?auto_372339 ) ) ( not ( = ?auto_372335 ?auto_372340 ) ) ( not ( = ?auto_372335 ?auto_372341 ) ) ( not ( = ?auto_372335 ?auto_372342 ) ) ( not ( = ?auto_372335 ?auto_372343 ) ) ( not ( = ?auto_372335 ?auto_372344 ) ) ( not ( = ?auto_372336 ?auto_372337 ) ) ( not ( = ?auto_372336 ?auto_372338 ) ) ( not ( = ?auto_372336 ?auto_372339 ) ) ( not ( = ?auto_372336 ?auto_372340 ) ) ( not ( = ?auto_372336 ?auto_372341 ) ) ( not ( = ?auto_372336 ?auto_372342 ) ) ( not ( = ?auto_372336 ?auto_372343 ) ) ( not ( = ?auto_372336 ?auto_372344 ) ) ( not ( = ?auto_372337 ?auto_372338 ) ) ( not ( = ?auto_372337 ?auto_372339 ) ) ( not ( = ?auto_372337 ?auto_372340 ) ) ( not ( = ?auto_372337 ?auto_372341 ) ) ( not ( = ?auto_372337 ?auto_372342 ) ) ( not ( = ?auto_372337 ?auto_372343 ) ) ( not ( = ?auto_372337 ?auto_372344 ) ) ( not ( = ?auto_372338 ?auto_372339 ) ) ( not ( = ?auto_372338 ?auto_372340 ) ) ( not ( = ?auto_372338 ?auto_372341 ) ) ( not ( = ?auto_372338 ?auto_372342 ) ) ( not ( = ?auto_372338 ?auto_372343 ) ) ( not ( = ?auto_372338 ?auto_372344 ) ) ( not ( = ?auto_372339 ?auto_372340 ) ) ( not ( = ?auto_372339 ?auto_372341 ) ) ( not ( = ?auto_372339 ?auto_372342 ) ) ( not ( = ?auto_372339 ?auto_372343 ) ) ( not ( = ?auto_372339 ?auto_372344 ) ) ( not ( = ?auto_372340 ?auto_372341 ) ) ( not ( = ?auto_372340 ?auto_372342 ) ) ( not ( = ?auto_372340 ?auto_372343 ) ) ( not ( = ?auto_372340 ?auto_372344 ) ) ( not ( = ?auto_372341 ?auto_372342 ) ) ( not ( = ?auto_372341 ?auto_372343 ) ) ( not ( = ?auto_372341 ?auto_372344 ) ) ( not ( = ?auto_372342 ?auto_372343 ) ) ( not ( = ?auto_372342 ?auto_372344 ) ) ( not ( = ?auto_372343 ?auto_372344 ) ) ( CLEAR ?auto_372341 ) ( ON ?auto_372342 ?auto_372343 ) ( CLEAR ?auto_372342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_372334 ?auto_372335 ?auto_372336 ?auto_372337 ?auto_372338 ?auto_372339 ?auto_372340 ?auto_372341 ?auto_372342 )
      ( MAKE-10PILE ?auto_372334 ?auto_372335 ?auto_372336 ?auto_372337 ?auto_372338 ?auto_372339 ?auto_372340 ?auto_372341 ?auto_372342 ?auto_372343 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372355 - BLOCK
      ?auto_372356 - BLOCK
      ?auto_372357 - BLOCK
      ?auto_372358 - BLOCK
      ?auto_372359 - BLOCK
      ?auto_372360 - BLOCK
      ?auto_372361 - BLOCK
      ?auto_372362 - BLOCK
      ?auto_372363 - BLOCK
      ?auto_372364 - BLOCK
    )
    :vars
    (
      ?auto_372365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372364 ?auto_372365 ) ( ON-TABLE ?auto_372355 ) ( ON ?auto_372356 ?auto_372355 ) ( ON ?auto_372357 ?auto_372356 ) ( ON ?auto_372358 ?auto_372357 ) ( ON ?auto_372359 ?auto_372358 ) ( ON ?auto_372360 ?auto_372359 ) ( ON ?auto_372361 ?auto_372360 ) ( ON ?auto_372362 ?auto_372361 ) ( not ( = ?auto_372355 ?auto_372356 ) ) ( not ( = ?auto_372355 ?auto_372357 ) ) ( not ( = ?auto_372355 ?auto_372358 ) ) ( not ( = ?auto_372355 ?auto_372359 ) ) ( not ( = ?auto_372355 ?auto_372360 ) ) ( not ( = ?auto_372355 ?auto_372361 ) ) ( not ( = ?auto_372355 ?auto_372362 ) ) ( not ( = ?auto_372355 ?auto_372363 ) ) ( not ( = ?auto_372355 ?auto_372364 ) ) ( not ( = ?auto_372355 ?auto_372365 ) ) ( not ( = ?auto_372356 ?auto_372357 ) ) ( not ( = ?auto_372356 ?auto_372358 ) ) ( not ( = ?auto_372356 ?auto_372359 ) ) ( not ( = ?auto_372356 ?auto_372360 ) ) ( not ( = ?auto_372356 ?auto_372361 ) ) ( not ( = ?auto_372356 ?auto_372362 ) ) ( not ( = ?auto_372356 ?auto_372363 ) ) ( not ( = ?auto_372356 ?auto_372364 ) ) ( not ( = ?auto_372356 ?auto_372365 ) ) ( not ( = ?auto_372357 ?auto_372358 ) ) ( not ( = ?auto_372357 ?auto_372359 ) ) ( not ( = ?auto_372357 ?auto_372360 ) ) ( not ( = ?auto_372357 ?auto_372361 ) ) ( not ( = ?auto_372357 ?auto_372362 ) ) ( not ( = ?auto_372357 ?auto_372363 ) ) ( not ( = ?auto_372357 ?auto_372364 ) ) ( not ( = ?auto_372357 ?auto_372365 ) ) ( not ( = ?auto_372358 ?auto_372359 ) ) ( not ( = ?auto_372358 ?auto_372360 ) ) ( not ( = ?auto_372358 ?auto_372361 ) ) ( not ( = ?auto_372358 ?auto_372362 ) ) ( not ( = ?auto_372358 ?auto_372363 ) ) ( not ( = ?auto_372358 ?auto_372364 ) ) ( not ( = ?auto_372358 ?auto_372365 ) ) ( not ( = ?auto_372359 ?auto_372360 ) ) ( not ( = ?auto_372359 ?auto_372361 ) ) ( not ( = ?auto_372359 ?auto_372362 ) ) ( not ( = ?auto_372359 ?auto_372363 ) ) ( not ( = ?auto_372359 ?auto_372364 ) ) ( not ( = ?auto_372359 ?auto_372365 ) ) ( not ( = ?auto_372360 ?auto_372361 ) ) ( not ( = ?auto_372360 ?auto_372362 ) ) ( not ( = ?auto_372360 ?auto_372363 ) ) ( not ( = ?auto_372360 ?auto_372364 ) ) ( not ( = ?auto_372360 ?auto_372365 ) ) ( not ( = ?auto_372361 ?auto_372362 ) ) ( not ( = ?auto_372361 ?auto_372363 ) ) ( not ( = ?auto_372361 ?auto_372364 ) ) ( not ( = ?auto_372361 ?auto_372365 ) ) ( not ( = ?auto_372362 ?auto_372363 ) ) ( not ( = ?auto_372362 ?auto_372364 ) ) ( not ( = ?auto_372362 ?auto_372365 ) ) ( not ( = ?auto_372363 ?auto_372364 ) ) ( not ( = ?auto_372363 ?auto_372365 ) ) ( not ( = ?auto_372364 ?auto_372365 ) ) ( CLEAR ?auto_372362 ) ( ON ?auto_372363 ?auto_372364 ) ( CLEAR ?auto_372363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_372355 ?auto_372356 ?auto_372357 ?auto_372358 ?auto_372359 ?auto_372360 ?auto_372361 ?auto_372362 ?auto_372363 )
      ( MAKE-10PILE ?auto_372355 ?auto_372356 ?auto_372357 ?auto_372358 ?auto_372359 ?auto_372360 ?auto_372361 ?auto_372362 ?auto_372363 ?auto_372364 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372376 - BLOCK
      ?auto_372377 - BLOCK
      ?auto_372378 - BLOCK
      ?auto_372379 - BLOCK
      ?auto_372380 - BLOCK
      ?auto_372381 - BLOCK
      ?auto_372382 - BLOCK
      ?auto_372383 - BLOCK
      ?auto_372384 - BLOCK
      ?auto_372385 - BLOCK
    )
    :vars
    (
      ?auto_372386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372385 ?auto_372386 ) ( ON-TABLE ?auto_372376 ) ( ON ?auto_372377 ?auto_372376 ) ( ON ?auto_372378 ?auto_372377 ) ( ON ?auto_372379 ?auto_372378 ) ( ON ?auto_372380 ?auto_372379 ) ( ON ?auto_372381 ?auto_372380 ) ( ON ?auto_372382 ?auto_372381 ) ( not ( = ?auto_372376 ?auto_372377 ) ) ( not ( = ?auto_372376 ?auto_372378 ) ) ( not ( = ?auto_372376 ?auto_372379 ) ) ( not ( = ?auto_372376 ?auto_372380 ) ) ( not ( = ?auto_372376 ?auto_372381 ) ) ( not ( = ?auto_372376 ?auto_372382 ) ) ( not ( = ?auto_372376 ?auto_372383 ) ) ( not ( = ?auto_372376 ?auto_372384 ) ) ( not ( = ?auto_372376 ?auto_372385 ) ) ( not ( = ?auto_372376 ?auto_372386 ) ) ( not ( = ?auto_372377 ?auto_372378 ) ) ( not ( = ?auto_372377 ?auto_372379 ) ) ( not ( = ?auto_372377 ?auto_372380 ) ) ( not ( = ?auto_372377 ?auto_372381 ) ) ( not ( = ?auto_372377 ?auto_372382 ) ) ( not ( = ?auto_372377 ?auto_372383 ) ) ( not ( = ?auto_372377 ?auto_372384 ) ) ( not ( = ?auto_372377 ?auto_372385 ) ) ( not ( = ?auto_372377 ?auto_372386 ) ) ( not ( = ?auto_372378 ?auto_372379 ) ) ( not ( = ?auto_372378 ?auto_372380 ) ) ( not ( = ?auto_372378 ?auto_372381 ) ) ( not ( = ?auto_372378 ?auto_372382 ) ) ( not ( = ?auto_372378 ?auto_372383 ) ) ( not ( = ?auto_372378 ?auto_372384 ) ) ( not ( = ?auto_372378 ?auto_372385 ) ) ( not ( = ?auto_372378 ?auto_372386 ) ) ( not ( = ?auto_372379 ?auto_372380 ) ) ( not ( = ?auto_372379 ?auto_372381 ) ) ( not ( = ?auto_372379 ?auto_372382 ) ) ( not ( = ?auto_372379 ?auto_372383 ) ) ( not ( = ?auto_372379 ?auto_372384 ) ) ( not ( = ?auto_372379 ?auto_372385 ) ) ( not ( = ?auto_372379 ?auto_372386 ) ) ( not ( = ?auto_372380 ?auto_372381 ) ) ( not ( = ?auto_372380 ?auto_372382 ) ) ( not ( = ?auto_372380 ?auto_372383 ) ) ( not ( = ?auto_372380 ?auto_372384 ) ) ( not ( = ?auto_372380 ?auto_372385 ) ) ( not ( = ?auto_372380 ?auto_372386 ) ) ( not ( = ?auto_372381 ?auto_372382 ) ) ( not ( = ?auto_372381 ?auto_372383 ) ) ( not ( = ?auto_372381 ?auto_372384 ) ) ( not ( = ?auto_372381 ?auto_372385 ) ) ( not ( = ?auto_372381 ?auto_372386 ) ) ( not ( = ?auto_372382 ?auto_372383 ) ) ( not ( = ?auto_372382 ?auto_372384 ) ) ( not ( = ?auto_372382 ?auto_372385 ) ) ( not ( = ?auto_372382 ?auto_372386 ) ) ( not ( = ?auto_372383 ?auto_372384 ) ) ( not ( = ?auto_372383 ?auto_372385 ) ) ( not ( = ?auto_372383 ?auto_372386 ) ) ( not ( = ?auto_372384 ?auto_372385 ) ) ( not ( = ?auto_372384 ?auto_372386 ) ) ( not ( = ?auto_372385 ?auto_372386 ) ) ( ON ?auto_372384 ?auto_372385 ) ( CLEAR ?auto_372382 ) ( ON ?auto_372383 ?auto_372384 ) ( CLEAR ?auto_372383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_372376 ?auto_372377 ?auto_372378 ?auto_372379 ?auto_372380 ?auto_372381 ?auto_372382 ?auto_372383 )
      ( MAKE-10PILE ?auto_372376 ?auto_372377 ?auto_372378 ?auto_372379 ?auto_372380 ?auto_372381 ?auto_372382 ?auto_372383 ?auto_372384 ?auto_372385 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372397 - BLOCK
      ?auto_372398 - BLOCK
      ?auto_372399 - BLOCK
      ?auto_372400 - BLOCK
      ?auto_372401 - BLOCK
      ?auto_372402 - BLOCK
      ?auto_372403 - BLOCK
      ?auto_372404 - BLOCK
      ?auto_372405 - BLOCK
      ?auto_372406 - BLOCK
    )
    :vars
    (
      ?auto_372407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372406 ?auto_372407 ) ( ON-TABLE ?auto_372397 ) ( ON ?auto_372398 ?auto_372397 ) ( ON ?auto_372399 ?auto_372398 ) ( ON ?auto_372400 ?auto_372399 ) ( ON ?auto_372401 ?auto_372400 ) ( ON ?auto_372402 ?auto_372401 ) ( ON ?auto_372403 ?auto_372402 ) ( not ( = ?auto_372397 ?auto_372398 ) ) ( not ( = ?auto_372397 ?auto_372399 ) ) ( not ( = ?auto_372397 ?auto_372400 ) ) ( not ( = ?auto_372397 ?auto_372401 ) ) ( not ( = ?auto_372397 ?auto_372402 ) ) ( not ( = ?auto_372397 ?auto_372403 ) ) ( not ( = ?auto_372397 ?auto_372404 ) ) ( not ( = ?auto_372397 ?auto_372405 ) ) ( not ( = ?auto_372397 ?auto_372406 ) ) ( not ( = ?auto_372397 ?auto_372407 ) ) ( not ( = ?auto_372398 ?auto_372399 ) ) ( not ( = ?auto_372398 ?auto_372400 ) ) ( not ( = ?auto_372398 ?auto_372401 ) ) ( not ( = ?auto_372398 ?auto_372402 ) ) ( not ( = ?auto_372398 ?auto_372403 ) ) ( not ( = ?auto_372398 ?auto_372404 ) ) ( not ( = ?auto_372398 ?auto_372405 ) ) ( not ( = ?auto_372398 ?auto_372406 ) ) ( not ( = ?auto_372398 ?auto_372407 ) ) ( not ( = ?auto_372399 ?auto_372400 ) ) ( not ( = ?auto_372399 ?auto_372401 ) ) ( not ( = ?auto_372399 ?auto_372402 ) ) ( not ( = ?auto_372399 ?auto_372403 ) ) ( not ( = ?auto_372399 ?auto_372404 ) ) ( not ( = ?auto_372399 ?auto_372405 ) ) ( not ( = ?auto_372399 ?auto_372406 ) ) ( not ( = ?auto_372399 ?auto_372407 ) ) ( not ( = ?auto_372400 ?auto_372401 ) ) ( not ( = ?auto_372400 ?auto_372402 ) ) ( not ( = ?auto_372400 ?auto_372403 ) ) ( not ( = ?auto_372400 ?auto_372404 ) ) ( not ( = ?auto_372400 ?auto_372405 ) ) ( not ( = ?auto_372400 ?auto_372406 ) ) ( not ( = ?auto_372400 ?auto_372407 ) ) ( not ( = ?auto_372401 ?auto_372402 ) ) ( not ( = ?auto_372401 ?auto_372403 ) ) ( not ( = ?auto_372401 ?auto_372404 ) ) ( not ( = ?auto_372401 ?auto_372405 ) ) ( not ( = ?auto_372401 ?auto_372406 ) ) ( not ( = ?auto_372401 ?auto_372407 ) ) ( not ( = ?auto_372402 ?auto_372403 ) ) ( not ( = ?auto_372402 ?auto_372404 ) ) ( not ( = ?auto_372402 ?auto_372405 ) ) ( not ( = ?auto_372402 ?auto_372406 ) ) ( not ( = ?auto_372402 ?auto_372407 ) ) ( not ( = ?auto_372403 ?auto_372404 ) ) ( not ( = ?auto_372403 ?auto_372405 ) ) ( not ( = ?auto_372403 ?auto_372406 ) ) ( not ( = ?auto_372403 ?auto_372407 ) ) ( not ( = ?auto_372404 ?auto_372405 ) ) ( not ( = ?auto_372404 ?auto_372406 ) ) ( not ( = ?auto_372404 ?auto_372407 ) ) ( not ( = ?auto_372405 ?auto_372406 ) ) ( not ( = ?auto_372405 ?auto_372407 ) ) ( not ( = ?auto_372406 ?auto_372407 ) ) ( ON ?auto_372405 ?auto_372406 ) ( CLEAR ?auto_372403 ) ( ON ?auto_372404 ?auto_372405 ) ( CLEAR ?auto_372404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_372397 ?auto_372398 ?auto_372399 ?auto_372400 ?auto_372401 ?auto_372402 ?auto_372403 ?auto_372404 )
      ( MAKE-10PILE ?auto_372397 ?auto_372398 ?auto_372399 ?auto_372400 ?auto_372401 ?auto_372402 ?auto_372403 ?auto_372404 ?auto_372405 ?auto_372406 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372418 - BLOCK
      ?auto_372419 - BLOCK
      ?auto_372420 - BLOCK
      ?auto_372421 - BLOCK
      ?auto_372422 - BLOCK
      ?auto_372423 - BLOCK
      ?auto_372424 - BLOCK
      ?auto_372425 - BLOCK
      ?auto_372426 - BLOCK
      ?auto_372427 - BLOCK
    )
    :vars
    (
      ?auto_372428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372427 ?auto_372428 ) ( ON-TABLE ?auto_372418 ) ( ON ?auto_372419 ?auto_372418 ) ( ON ?auto_372420 ?auto_372419 ) ( ON ?auto_372421 ?auto_372420 ) ( ON ?auto_372422 ?auto_372421 ) ( ON ?auto_372423 ?auto_372422 ) ( not ( = ?auto_372418 ?auto_372419 ) ) ( not ( = ?auto_372418 ?auto_372420 ) ) ( not ( = ?auto_372418 ?auto_372421 ) ) ( not ( = ?auto_372418 ?auto_372422 ) ) ( not ( = ?auto_372418 ?auto_372423 ) ) ( not ( = ?auto_372418 ?auto_372424 ) ) ( not ( = ?auto_372418 ?auto_372425 ) ) ( not ( = ?auto_372418 ?auto_372426 ) ) ( not ( = ?auto_372418 ?auto_372427 ) ) ( not ( = ?auto_372418 ?auto_372428 ) ) ( not ( = ?auto_372419 ?auto_372420 ) ) ( not ( = ?auto_372419 ?auto_372421 ) ) ( not ( = ?auto_372419 ?auto_372422 ) ) ( not ( = ?auto_372419 ?auto_372423 ) ) ( not ( = ?auto_372419 ?auto_372424 ) ) ( not ( = ?auto_372419 ?auto_372425 ) ) ( not ( = ?auto_372419 ?auto_372426 ) ) ( not ( = ?auto_372419 ?auto_372427 ) ) ( not ( = ?auto_372419 ?auto_372428 ) ) ( not ( = ?auto_372420 ?auto_372421 ) ) ( not ( = ?auto_372420 ?auto_372422 ) ) ( not ( = ?auto_372420 ?auto_372423 ) ) ( not ( = ?auto_372420 ?auto_372424 ) ) ( not ( = ?auto_372420 ?auto_372425 ) ) ( not ( = ?auto_372420 ?auto_372426 ) ) ( not ( = ?auto_372420 ?auto_372427 ) ) ( not ( = ?auto_372420 ?auto_372428 ) ) ( not ( = ?auto_372421 ?auto_372422 ) ) ( not ( = ?auto_372421 ?auto_372423 ) ) ( not ( = ?auto_372421 ?auto_372424 ) ) ( not ( = ?auto_372421 ?auto_372425 ) ) ( not ( = ?auto_372421 ?auto_372426 ) ) ( not ( = ?auto_372421 ?auto_372427 ) ) ( not ( = ?auto_372421 ?auto_372428 ) ) ( not ( = ?auto_372422 ?auto_372423 ) ) ( not ( = ?auto_372422 ?auto_372424 ) ) ( not ( = ?auto_372422 ?auto_372425 ) ) ( not ( = ?auto_372422 ?auto_372426 ) ) ( not ( = ?auto_372422 ?auto_372427 ) ) ( not ( = ?auto_372422 ?auto_372428 ) ) ( not ( = ?auto_372423 ?auto_372424 ) ) ( not ( = ?auto_372423 ?auto_372425 ) ) ( not ( = ?auto_372423 ?auto_372426 ) ) ( not ( = ?auto_372423 ?auto_372427 ) ) ( not ( = ?auto_372423 ?auto_372428 ) ) ( not ( = ?auto_372424 ?auto_372425 ) ) ( not ( = ?auto_372424 ?auto_372426 ) ) ( not ( = ?auto_372424 ?auto_372427 ) ) ( not ( = ?auto_372424 ?auto_372428 ) ) ( not ( = ?auto_372425 ?auto_372426 ) ) ( not ( = ?auto_372425 ?auto_372427 ) ) ( not ( = ?auto_372425 ?auto_372428 ) ) ( not ( = ?auto_372426 ?auto_372427 ) ) ( not ( = ?auto_372426 ?auto_372428 ) ) ( not ( = ?auto_372427 ?auto_372428 ) ) ( ON ?auto_372426 ?auto_372427 ) ( ON ?auto_372425 ?auto_372426 ) ( CLEAR ?auto_372423 ) ( ON ?auto_372424 ?auto_372425 ) ( CLEAR ?auto_372424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_372418 ?auto_372419 ?auto_372420 ?auto_372421 ?auto_372422 ?auto_372423 ?auto_372424 )
      ( MAKE-10PILE ?auto_372418 ?auto_372419 ?auto_372420 ?auto_372421 ?auto_372422 ?auto_372423 ?auto_372424 ?auto_372425 ?auto_372426 ?auto_372427 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372439 - BLOCK
      ?auto_372440 - BLOCK
      ?auto_372441 - BLOCK
      ?auto_372442 - BLOCK
      ?auto_372443 - BLOCK
      ?auto_372444 - BLOCK
      ?auto_372445 - BLOCK
      ?auto_372446 - BLOCK
      ?auto_372447 - BLOCK
      ?auto_372448 - BLOCK
    )
    :vars
    (
      ?auto_372449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372448 ?auto_372449 ) ( ON-TABLE ?auto_372439 ) ( ON ?auto_372440 ?auto_372439 ) ( ON ?auto_372441 ?auto_372440 ) ( ON ?auto_372442 ?auto_372441 ) ( ON ?auto_372443 ?auto_372442 ) ( ON ?auto_372444 ?auto_372443 ) ( not ( = ?auto_372439 ?auto_372440 ) ) ( not ( = ?auto_372439 ?auto_372441 ) ) ( not ( = ?auto_372439 ?auto_372442 ) ) ( not ( = ?auto_372439 ?auto_372443 ) ) ( not ( = ?auto_372439 ?auto_372444 ) ) ( not ( = ?auto_372439 ?auto_372445 ) ) ( not ( = ?auto_372439 ?auto_372446 ) ) ( not ( = ?auto_372439 ?auto_372447 ) ) ( not ( = ?auto_372439 ?auto_372448 ) ) ( not ( = ?auto_372439 ?auto_372449 ) ) ( not ( = ?auto_372440 ?auto_372441 ) ) ( not ( = ?auto_372440 ?auto_372442 ) ) ( not ( = ?auto_372440 ?auto_372443 ) ) ( not ( = ?auto_372440 ?auto_372444 ) ) ( not ( = ?auto_372440 ?auto_372445 ) ) ( not ( = ?auto_372440 ?auto_372446 ) ) ( not ( = ?auto_372440 ?auto_372447 ) ) ( not ( = ?auto_372440 ?auto_372448 ) ) ( not ( = ?auto_372440 ?auto_372449 ) ) ( not ( = ?auto_372441 ?auto_372442 ) ) ( not ( = ?auto_372441 ?auto_372443 ) ) ( not ( = ?auto_372441 ?auto_372444 ) ) ( not ( = ?auto_372441 ?auto_372445 ) ) ( not ( = ?auto_372441 ?auto_372446 ) ) ( not ( = ?auto_372441 ?auto_372447 ) ) ( not ( = ?auto_372441 ?auto_372448 ) ) ( not ( = ?auto_372441 ?auto_372449 ) ) ( not ( = ?auto_372442 ?auto_372443 ) ) ( not ( = ?auto_372442 ?auto_372444 ) ) ( not ( = ?auto_372442 ?auto_372445 ) ) ( not ( = ?auto_372442 ?auto_372446 ) ) ( not ( = ?auto_372442 ?auto_372447 ) ) ( not ( = ?auto_372442 ?auto_372448 ) ) ( not ( = ?auto_372442 ?auto_372449 ) ) ( not ( = ?auto_372443 ?auto_372444 ) ) ( not ( = ?auto_372443 ?auto_372445 ) ) ( not ( = ?auto_372443 ?auto_372446 ) ) ( not ( = ?auto_372443 ?auto_372447 ) ) ( not ( = ?auto_372443 ?auto_372448 ) ) ( not ( = ?auto_372443 ?auto_372449 ) ) ( not ( = ?auto_372444 ?auto_372445 ) ) ( not ( = ?auto_372444 ?auto_372446 ) ) ( not ( = ?auto_372444 ?auto_372447 ) ) ( not ( = ?auto_372444 ?auto_372448 ) ) ( not ( = ?auto_372444 ?auto_372449 ) ) ( not ( = ?auto_372445 ?auto_372446 ) ) ( not ( = ?auto_372445 ?auto_372447 ) ) ( not ( = ?auto_372445 ?auto_372448 ) ) ( not ( = ?auto_372445 ?auto_372449 ) ) ( not ( = ?auto_372446 ?auto_372447 ) ) ( not ( = ?auto_372446 ?auto_372448 ) ) ( not ( = ?auto_372446 ?auto_372449 ) ) ( not ( = ?auto_372447 ?auto_372448 ) ) ( not ( = ?auto_372447 ?auto_372449 ) ) ( not ( = ?auto_372448 ?auto_372449 ) ) ( ON ?auto_372447 ?auto_372448 ) ( ON ?auto_372446 ?auto_372447 ) ( CLEAR ?auto_372444 ) ( ON ?auto_372445 ?auto_372446 ) ( CLEAR ?auto_372445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_372439 ?auto_372440 ?auto_372441 ?auto_372442 ?auto_372443 ?auto_372444 ?auto_372445 )
      ( MAKE-10PILE ?auto_372439 ?auto_372440 ?auto_372441 ?auto_372442 ?auto_372443 ?auto_372444 ?auto_372445 ?auto_372446 ?auto_372447 ?auto_372448 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372460 - BLOCK
      ?auto_372461 - BLOCK
      ?auto_372462 - BLOCK
      ?auto_372463 - BLOCK
      ?auto_372464 - BLOCK
      ?auto_372465 - BLOCK
      ?auto_372466 - BLOCK
      ?auto_372467 - BLOCK
      ?auto_372468 - BLOCK
      ?auto_372469 - BLOCK
    )
    :vars
    (
      ?auto_372470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372469 ?auto_372470 ) ( ON-TABLE ?auto_372460 ) ( ON ?auto_372461 ?auto_372460 ) ( ON ?auto_372462 ?auto_372461 ) ( ON ?auto_372463 ?auto_372462 ) ( ON ?auto_372464 ?auto_372463 ) ( not ( = ?auto_372460 ?auto_372461 ) ) ( not ( = ?auto_372460 ?auto_372462 ) ) ( not ( = ?auto_372460 ?auto_372463 ) ) ( not ( = ?auto_372460 ?auto_372464 ) ) ( not ( = ?auto_372460 ?auto_372465 ) ) ( not ( = ?auto_372460 ?auto_372466 ) ) ( not ( = ?auto_372460 ?auto_372467 ) ) ( not ( = ?auto_372460 ?auto_372468 ) ) ( not ( = ?auto_372460 ?auto_372469 ) ) ( not ( = ?auto_372460 ?auto_372470 ) ) ( not ( = ?auto_372461 ?auto_372462 ) ) ( not ( = ?auto_372461 ?auto_372463 ) ) ( not ( = ?auto_372461 ?auto_372464 ) ) ( not ( = ?auto_372461 ?auto_372465 ) ) ( not ( = ?auto_372461 ?auto_372466 ) ) ( not ( = ?auto_372461 ?auto_372467 ) ) ( not ( = ?auto_372461 ?auto_372468 ) ) ( not ( = ?auto_372461 ?auto_372469 ) ) ( not ( = ?auto_372461 ?auto_372470 ) ) ( not ( = ?auto_372462 ?auto_372463 ) ) ( not ( = ?auto_372462 ?auto_372464 ) ) ( not ( = ?auto_372462 ?auto_372465 ) ) ( not ( = ?auto_372462 ?auto_372466 ) ) ( not ( = ?auto_372462 ?auto_372467 ) ) ( not ( = ?auto_372462 ?auto_372468 ) ) ( not ( = ?auto_372462 ?auto_372469 ) ) ( not ( = ?auto_372462 ?auto_372470 ) ) ( not ( = ?auto_372463 ?auto_372464 ) ) ( not ( = ?auto_372463 ?auto_372465 ) ) ( not ( = ?auto_372463 ?auto_372466 ) ) ( not ( = ?auto_372463 ?auto_372467 ) ) ( not ( = ?auto_372463 ?auto_372468 ) ) ( not ( = ?auto_372463 ?auto_372469 ) ) ( not ( = ?auto_372463 ?auto_372470 ) ) ( not ( = ?auto_372464 ?auto_372465 ) ) ( not ( = ?auto_372464 ?auto_372466 ) ) ( not ( = ?auto_372464 ?auto_372467 ) ) ( not ( = ?auto_372464 ?auto_372468 ) ) ( not ( = ?auto_372464 ?auto_372469 ) ) ( not ( = ?auto_372464 ?auto_372470 ) ) ( not ( = ?auto_372465 ?auto_372466 ) ) ( not ( = ?auto_372465 ?auto_372467 ) ) ( not ( = ?auto_372465 ?auto_372468 ) ) ( not ( = ?auto_372465 ?auto_372469 ) ) ( not ( = ?auto_372465 ?auto_372470 ) ) ( not ( = ?auto_372466 ?auto_372467 ) ) ( not ( = ?auto_372466 ?auto_372468 ) ) ( not ( = ?auto_372466 ?auto_372469 ) ) ( not ( = ?auto_372466 ?auto_372470 ) ) ( not ( = ?auto_372467 ?auto_372468 ) ) ( not ( = ?auto_372467 ?auto_372469 ) ) ( not ( = ?auto_372467 ?auto_372470 ) ) ( not ( = ?auto_372468 ?auto_372469 ) ) ( not ( = ?auto_372468 ?auto_372470 ) ) ( not ( = ?auto_372469 ?auto_372470 ) ) ( ON ?auto_372468 ?auto_372469 ) ( ON ?auto_372467 ?auto_372468 ) ( ON ?auto_372466 ?auto_372467 ) ( CLEAR ?auto_372464 ) ( ON ?auto_372465 ?auto_372466 ) ( CLEAR ?auto_372465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_372460 ?auto_372461 ?auto_372462 ?auto_372463 ?auto_372464 ?auto_372465 )
      ( MAKE-10PILE ?auto_372460 ?auto_372461 ?auto_372462 ?auto_372463 ?auto_372464 ?auto_372465 ?auto_372466 ?auto_372467 ?auto_372468 ?auto_372469 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372481 - BLOCK
      ?auto_372482 - BLOCK
      ?auto_372483 - BLOCK
      ?auto_372484 - BLOCK
      ?auto_372485 - BLOCK
      ?auto_372486 - BLOCK
      ?auto_372487 - BLOCK
      ?auto_372488 - BLOCK
      ?auto_372489 - BLOCK
      ?auto_372490 - BLOCK
    )
    :vars
    (
      ?auto_372491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372490 ?auto_372491 ) ( ON-TABLE ?auto_372481 ) ( ON ?auto_372482 ?auto_372481 ) ( ON ?auto_372483 ?auto_372482 ) ( ON ?auto_372484 ?auto_372483 ) ( ON ?auto_372485 ?auto_372484 ) ( not ( = ?auto_372481 ?auto_372482 ) ) ( not ( = ?auto_372481 ?auto_372483 ) ) ( not ( = ?auto_372481 ?auto_372484 ) ) ( not ( = ?auto_372481 ?auto_372485 ) ) ( not ( = ?auto_372481 ?auto_372486 ) ) ( not ( = ?auto_372481 ?auto_372487 ) ) ( not ( = ?auto_372481 ?auto_372488 ) ) ( not ( = ?auto_372481 ?auto_372489 ) ) ( not ( = ?auto_372481 ?auto_372490 ) ) ( not ( = ?auto_372481 ?auto_372491 ) ) ( not ( = ?auto_372482 ?auto_372483 ) ) ( not ( = ?auto_372482 ?auto_372484 ) ) ( not ( = ?auto_372482 ?auto_372485 ) ) ( not ( = ?auto_372482 ?auto_372486 ) ) ( not ( = ?auto_372482 ?auto_372487 ) ) ( not ( = ?auto_372482 ?auto_372488 ) ) ( not ( = ?auto_372482 ?auto_372489 ) ) ( not ( = ?auto_372482 ?auto_372490 ) ) ( not ( = ?auto_372482 ?auto_372491 ) ) ( not ( = ?auto_372483 ?auto_372484 ) ) ( not ( = ?auto_372483 ?auto_372485 ) ) ( not ( = ?auto_372483 ?auto_372486 ) ) ( not ( = ?auto_372483 ?auto_372487 ) ) ( not ( = ?auto_372483 ?auto_372488 ) ) ( not ( = ?auto_372483 ?auto_372489 ) ) ( not ( = ?auto_372483 ?auto_372490 ) ) ( not ( = ?auto_372483 ?auto_372491 ) ) ( not ( = ?auto_372484 ?auto_372485 ) ) ( not ( = ?auto_372484 ?auto_372486 ) ) ( not ( = ?auto_372484 ?auto_372487 ) ) ( not ( = ?auto_372484 ?auto_372488 ) ) ( not ( = ?auto_372484 ?auto_372489 ) ) ( not ( = ?auto_372484 ?auto_372490 ) ) ( not ( = ?auto_372484 ?auto_372491 ) ) ( not ( = ?auto_372485 ?auto_372486 ) ) ( not ( = ?auto_372485 ?auto_372487 ) ) ( not ( = ?auto_372485 ?auto_372488 ) ) ( not ( = ?auto_372485 ?auto_372489 ) ) ( not ( = ?auto_372485 ?auto_372490 ) ) ( not ( = ?auto_372485 ?auto_372491 ) ) ( not ( = ?auto_372486 ?auto_372487 ) ) ( not ( = ?auto_372486 ?auto_372488 ) ) ( not ( = ?auto_372486 ?auto_372489 ) ) ( not ( = ?auto_372486 ?auto_372490 ) ) ( not ( = ?auto_372486 ?auto_372491 ) ) ( not ( = ?auto_372487 ?auto_372488 ) ) ( not ( = ?auto_372487 ?auto_372489 ) ) ( not ( = ?auto_372487 ?auto_372490 ) ) ( not ( = ?auto_372487 ?auto_372491 ) ) ( not ( = ?auto_372488 ?auto_372489 ) ) ( not ( = ?auto_372488 ?auto_372490 ) ) ( not ( = ?auto_372488 ?auto_372491 ) ) ( not ( = ?auto_372489 ?auto_372490 ) ) ( not ( = ?auto_372489 ?auto_372491 ) ) ( not ( = ?auto_372490 ?auto_372491 ) ) ( ON ?auto_372489 ?auto_372490 ) ( ON ?auto_372488 ?auto_372489 ) ( ON ?auto_372487 ?auto_372488 ) ( CLEAR ?auto_372485 ) ( ON ?auto_372486 ?auto_372487 ) ( CLEAR ?auto_372486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_372481 ?auto_372482 ?auto_372483 ?auto_372484 ?auto_372485 ?auto_372486 )
      ( MAKE-10PILE ?auto_372481 ?auto_372482 ?auto_372483 ?auto_372484 ?auto_372485 ?auto_372486 ?auto_372487 ?auto_372488 ?auto_372489 ?auto_372490 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372502 - BLOCK
      ?auto_372503 - BLOCK
      ?auto_372504 - BLOCK
      ?auto_372505 - BLOCK
      ?auto_372506 - BLOCK
      ?auto_372507 - BLOCK
      ?auto_372508 - BLOCK
      ?auto_372509 - BLOCK
      ?auto_372510 - BLOCK
      ?auto_372511 - BLOCK
    )
    :vars
    (
      ?auto_372512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372511 ?auto_372512 ) ( ON-TABLE ?auto_372502 ) ( ON ?auto_372503 ?auto_372502 ) ( ON ?auto_372504 ?auto_372503 ) ( ON ?auto_372505 ?auto_372504 ) ( not ( = ?auto_372502 ?auto_372503 ) ) ( not ( = ?auto_372502 ?auto_372504 ) ) ( not ( = ?auto_372502 ?auto_372505 ) ) ( not ( = ?auto_372502 ?auto_372506 ) ) ( not ( = ?auto_372502 ?auto_372507 ) ) ( not ( = ?auto_372502 ?auto_372508 ) ) ( not ( = ?auto_372502 ?auto_372509 ) ) ( not ( = ?auto_372502 ?auto_372510 ) ) ( not ( = ?auto_372502 ?auto_372511 ) ) ( not ( = ?auto_372502 ?auto_372512 ) ) ( not ( = ?auto_372503 ?auto_372504 ) ) ( not ( = ?auto_372503 ?auto_372505 ) ) ( not ( = ?auto_372503 ?auto_372506 ) ) ( not ( = ?auto_372503 ?auto_372507 ) ) ( not ( = ?auto_372503 ?auto_372508 ) ) ( not ( = ?auto_372503 ?auto_372509 ) ) ( not ( = ?auto_372503 ?auto_372510 ) ) ( not ( = ?auto_372503 ?auto_372511 ) ) ( not ( = ?auto_372503 ?auto_372512 ) ) ( not ( = ?auto_372504 ?auto_372505 ) ) ( not ( = ?auto_372504 ?auto_372506 ) ) ( not ( = ?auto_372504 ?auto_372507 ) ) ( not ( = ?auto_372504 ?auto_372508 ) ) ( not ( = ?auto_372504 ?auto_372509 ) ) ( not ( = ?auto_372504 ?auto_372510 ) ) ( not ( = ?auto_372504 ?auto_372511 ) ) ( not ( = ?auto_372504 ?auto_372512 ) ) ( not ( = ?auto_372505 ?auto_372506 ) ) ( not ( = ?auto_372505 ?auto_372507 ) ) ( not ( = ?auto_372505 ?auto_372508 ) ) ( not ( = ?auto_372505 ?auto_372509 ) ) ( not ( = ?auto_372505 ?auto_372510 ) ) ( not ( = ?auto_372505 ?auto_372511 ) ) ( not ( = ?auto_372505 ?auto_372512 ) ) ( not ( = ?auto_372506 ?auto_372507 ) ) ( not ( = ?auto_372506 ?auto_372508 ) ) ( not ( = ?auto_372506 ?auto_372509 ) ) ( not ( = ?auto_372506 ?auto_372510 ) ) ( not ( = ?auto_372506 ?auto_372511 ) ) ( not ( = ?auto_372506 ?auto_372512 ) ) ( not ( = ?auto_372507 ?auto_372508 ) ) ( not ( = ?auto_372507 ?auto_372509 ) ) ( not ( = ?auto_372507 ?auto_372510 ) ) ( not ( = ?auto_372507 ?auto_372511 ) ) ( not ( = ?auto_372507 ?auto_372512 ) ) ( not ( = ?auto_372508 ?auto_372509 ) ) ( not ( = ?auto_372508 ?auto_372510 ) ) ( not ( = ?auto_372508 ?auto_372511 ) ) ( not ( = ?auto_372508 ?auto_372512 ) ) ( not ( = ?auto_372509 ?auto_372510 ) ) ( not ( = ?auto_372509 ?auto_372511 ) ) ( not ( = ?auto_372509 ?auto_372512 ) ) ( not ( = ?auto_372510 ?auto_372511 ) ) ( not ( = ?auto_372510 ?auto_372512 ) ) ( not ( = ?auto_372511 ?auto_372512 ) ) ( ON ?auto_372510 ?auto_372511 ) ( ON ?auto_372509 ?auto_372510 ) ( ON ?auto_372508 ?auto_372509 ) ( ON ?auto_372507 ?auto_372508 ) ( CLEAR ?auto_372505 ) ( ON ?auto_372506 ?auto_372507 ) ( CLEAR ?auto_372506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_372502 ?auto_372503 ?auto_372504 ?auto_372505 ?auto_372506 )
      ( MAKE-10PILE ?auto_372502 ?auto_372503 ?auto_372504 ?auto_372505 ?auto_372506 ?auto_372507 ?auto_372508 ?auto_372509 ?auto_372510 ?auto_372511 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372523 - BLOCK
      ?auto_372524 - BLOCK
      ?auto_372525 - BLOCK
      ?auto_372526 - BLOCK
      ?auto_372527 - BLOCK
      ?auto_372528 - BLOCK
      ?auto_372529 - BLOCK
      ?auto_372530 - BLOCK
      ?auto_372531 - BLOCK
      ?auto_372532 - BLOCK
    )
    :vars
    (
      ?auto_372533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372532 ?auto_372533 ) ( ON-TABLE ?auto_372523 ) ( ON ?auto_372524 ?auto_372523 ) ( ON ?auto_372525 ?auto_372524 ) ( ON ?auto_372526 ?auto_372525 ) ( not ( = ?auto_372523 ?auto_372524 ) ) ( not ( = ?auto_372523 ?auto_372525 ) ) ( not ( = ?auto_372523 ?auto_372526 ) ) ( not ( = ?auto_372523 ?auto_372527 ) ) ( not ( = ?auto_372523 ?auto_372528 ) ) ( not ( = ?auto_372523 ?auto_372529 ) ) ( not ( = ?auto_372523 ?auto_372530 ) ) ( not ( = ?auto_372523 ?auto_372531 ) ) ( not ( = ?auto_372523 ?auto_372532 ) ) ( not ( = ?auto_372523 ?auto_372533 ) ) ( not ( = ?auto_372524 ?auto_372525 ) ) ( not ( = ?auto_372524 ?auto_372526 ) ) ( not ( = ?auto_372524 ?auto_372527 ) ) ( not ( = ?auto_372524 ?auto_372528 ) ) ( not ( = ?auto_372524 ?auto_372529 ) ) ( not ( = ?auto_372524 ?auto_372530 ) ) ( not ( = ?auto_372524 ?auto_372531 ) ) ( not ( = ?auto_372524 ?auto_372532 ) ) ( not ( = ?auto_372524 ?auto_372533 ) ) ( not ( = ?auto_372525 ?auto_372526 ) ) ( not ( = ?auto_372525 ?auto_372527 ) ) ( not ( = ?auto_372525 ?auto_372528 ) ) ( not ( = ?auto_372525 ?auto_372529 ) ) ( not ( = ?auto_372525 ?auto_372530 ) ) ( not ( = ?auto_372525 ?auto_372531 ) ) ( not ( = ?auto_372525 ?auto_372532 ) ) ( not ( = ?auto_372525 ?auto_372533 ) ) ( not ( = ?auto_372526 ?auto_372527 ) ) ( not ( = ?auto_372526 ?auto_372528 ) ) ( not ( = ?auto_372526 ?auto_372529 ) ) ( not ( = ?auto_372526 ?auto_372530 ) ) ( not ( = ?auto_372526 ?auto_372531 ) ) ( not ( = ?auto_372526 ?auto_372532 ) ) ( not ( = ?auto_372526 ?auto_372533 ) ) ( not ( = ?auto_372527 ?auto_372528 ) ) ( not ( = ?auto_372527 ?auto_372529 ) ) ( not ( = ?auto_372527 ?auto_372530 ) ) ( not ( = ?auto_372527 ?auto_372531 ) ) ( not ( = ?auto_372527 ?auto_372532 ) ) ( not ( = ?auto_372527 ?auto_372533 ) ) ( not ( = ?auto_372528 ?auto_372529 ) ) ( not ( = ?auto_372528 ?auto_372530 ) ) ( not ( = ?auto_372528 ?auto_372531 ) ) ( not ( = ?auto_372528 ?auto_372532 ) ) ( not ( = ?auto_372528 ?auto_372533 ) ) ( not ( = ?auto_372529 ?auto_372530 ) ) ( not ( = ?auto_372529 ?auto_372531 ) ) ( not ( = ?auto_372529 ?auto_372532 ) ) ( not ( = ?auto_372529 ?auto_372533 ) ) ( not ( = ?auto_372530 ?auto_372531 ) ) ( not ( = ?auto_372530 ?auto_372532 ) ) ( not ( = ?auto_372530 ?auto_372533 ) ) ( not ( = ?auto_372531 ?auto_372532 ) ) ( not ( = ?auto_372531 ?auto_372533 ) ) ( not ( = ?auto_372532 ?auto_372533 ) ) ( ON ?auto_372531 ?auto_372532 ) ( ON ?auto_372530 ?auto_372531 ) ( ON ?auto_372529 ?auto_372530 ) ( ON ?auto_372528 ?auto_372529 ) ( CLEAR ?auto_372526 ) ( ON ?auto_372527 ?auto_372528 ) ( CLEAR ?auto_372527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_372523 ?auto_372524 ?auto_372525 ?auto_372526 ?auto_372527 )
      ( MAKE-10PILE ?auto_372523 ?auto_372524 ?auto_372525 ?auto_372526 ?auto_372527 ?auto_372528 ?auto_372529 ?auto_372530 ?auto_372531 ?auto_372532 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372544 - BLOCK
      ?auto_372545 - BLOCK
      ?auto_372546 - BLOCK
      ?auto_372547 - BLOCK
      ?auto_372548 - BLOCK
      ?auto_372549 - BLOCK
      ?auto_372550 - BLOCK
      ?auto_372551 - BLOCK
      ?auto_372552 - BLOCK
      ?auto_372553 - BLOCK
    )
    :vars
    (
      ?auto_372554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372553 ?auto_372554 ) ( ON-TABLE ?auto_372544 ) ( ON ?auto_372545 ?auto_372544 ) ( ON ?auto_372546 ?auto_372545 ) ( not ( = ?auto_372544 ?auto_372545 ) ) ( not ( = ?auto_372544 ?auto_372546 ) ) ( not ( = ?auto_372544 ?auto_372547 ) ) ( not ( = ?auto_372544 ?auto_372548 ) ) ( not ( = ?auto_372544 ?auto_372549 ) ) ( not ( = ?auto_372544 ?auto_372550 ) ) ( not ( = ?auto_372544 ?auto_372551 ) ) ( not ( = ?auto_372544 ?auto_372552 ) ) ( not ( = ?auto_372544 ?auto_372553 ) ) ( not ( = ?auto_372544 ?auto_372554 ) ) ( not ( = ?auto_372545 ?auto_372546 ) ) ( not ( = ?auto_372545 ?auto_372547 ) ) ( not ( = ?auto_372545 ?auto_372548 ) ) ( not ( = ?auto_372545 ?auto_372549 ) ) ( not ( = ?auto_372545 ?auto_372550 ) ) ( not ( = ?auto_372545 ?auto_372551 ) ) ( not ( = ?auto_372545 ?auto_372552 ) ) ( not ( = ?auto_372545 ?auto_372553 ) ) ( not ( = ?auto_372545 ?auto_372554 ) ) ( not ( = ?auto_372546 ?auto_372547 ) ) ( not ( = ?auto_372546 ?auto_372548 ) ) ( not ( = ?auto_372546 ?auto_372549 ) ) ( not ( = ?auto_372546 ?auto_372550 ) ) ( not ( = ?auto_372546 ?auto_372551 ) ) ( not ( = ?auto_372546 ?auto_372552 ) ) ( not ( = ?auto_372546 ?auto_372553 ) ) ( not ( = ?auto_372546 ?auto_372554 ) ) ( not ( = ?auto_372547 ?auto_372548 ) ) ( not ( = ?auto_372547 ?auto_372549 ) ) ( not ( = ?auto_372547 ?auto_372550 ) ) ( not ( = ?auto_372547 ?auto_372551 ) ) ( not ( = ?auto_372547 ?auto_372552 ) ) ( not ( = ?auto_372547 ?auto_372553 ) ) ( not ( = ?auto_372547 ?auto_372554 ) ) ( not ( = ?auto_372548 ?auto_372549 ) ) ( not ( = ?auto_372548 ?auto_372550 ) ) ( not ( = ?auto_372548 ?auto_372551 ) ) ( not ( = ?auto_372548 ?auto_372552 ) ) ( not ( = ?auto_372548 ?auto_372553 ) ) ( not ( = ?auto_372548 ?auto_372554 ) ) ( not ( = ?auto_372549 ?auto_372550 ) ) ( not ( = ?auto_372549 ?auto_372551 ) ) ( not ( = ?auto_372549 ?auto_372552 ) ) ( not ( = ?auto_372549 ?auto_372553 ) ) ( not ( = ?auto_372549 ?auto_372554 ) ) ( not ( = ?auto_372550 ?auto_372551 ) ) ( not ( = ?auto_372550 ?auto_372552 ) ) ( not ( = ?auto_372550 ?auto_372553 ) ) ( not ( = ?auto_372550 ?auto_372554 ) ) ( not ( = ?auto_372551 ?auto_372552 ) ) ( not ( = ?auto_372551 ?auto_372553 ) ) ( not ( = ?auto_372551 ?auto_372554 ) ) ( not ( = ?auto_372552 ?auto_372553 ) ) ( not ( = ?auto_372552 ?auto_372554 ) ) ( not ( = ?auto_372553 ?auto_372554 ) ) ( ON ?auto_372552 ?auto_372553 ) ( ON ?auto_372551 ?auto_372552 ) ( ON ?auto_372550 ?auto_372551 ) ( ON ?auto_372549 ?auto_372550 ) ( ON ?auto_372548 ?auto_372549 ) ( CLEAR ?auto_372546 ) ( ON ?auto_372547 ?auto_372548 ) ( CLEAR ?auto_372547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_372544 ?auto_372545 ?auto_372546 ?auto_372547 )
      ( MAKE-10PILE ?auto_372544 ?auto_372545 ?auto_372546 ?auto_372547 ?auto_372548 ?auto_372549 ?auto_372550 ?auto_372551 ?auto_372552 ?auto_372553 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372565 - BLOCK
      ?auto_372566 - BLOCK
      ?auto_372567 - BLOCK
      ?auto_372568 - BLOCK
      ?auto_372569 - BLOCK
      ?auto_372570 - BLOCK
      ?auto_372571 - BLOCK
      ?auto_372572 - BLOCK
      ?auto_372573 - BLOCK
      ?auto_372574 - BLOCK
    )
    :vars
    (
      ?auto_372575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372574 ?auto_372575 ) ( ON-TABLE ?auto_372565 ) ( ON ?auto_372566 ?auto_372565 ) ( ON ?auto_372567 ?auto_372566 ) ( not ( = ?auto_372565 ?auto_372566 ) ) ( not ( = ?auto_372565 ?auto_372567 ) ) ( not ( = ?auto_372565 ?auto_372568 ) ) ( not ( = ?auto_372565 ?auto_372569 ) ) ( not ( = ?auto_372565 ?auto_372570 ) ) ( not ( = ?auto_372565 ?auto_372571 ) ) ( not ( = ?auto_372565 ?auto_372572 ) ) ( not ( = ?auto_372565 ?auto_372573 ) ) ( not ( = ?auto_372565 ?auto_372574 ) ) ( not ( = ?auto_372565 ?auto_372575 ) ) ( not ( = ?auto_372566 ?auto_372567 ) ) ( not ( = ?auto_372566 ?auto_372568 ) ) ( not ( = ?auto_372566 ?auto_372569 ) ) ( not ( = ?auto_372566 ?auto_372570 ) ) ( not ( = ?auto_372566 ?auto_372571 ) ) ( not ( = ?auto_372566 ?auto_372572 ) ) ( not ( = ?auto_372566 ?auto_372573 ) ) ( not ( = ?auto_372566 ?auto_372574 ) ) ( not ( = ?auto_372566 ?auto_372575 ) ) ( not ( = ?auto_372567 ?auto_372568 ) ) ( not ( = ?auto_372567 ?auto_372569 ) ) ( not ( = ?auto_372567 ?auto_372570 ) ) ( not ( = ?auto_372567 ?auto_372571 ) ) ( not ( = ?auto_372567 ?auto_372572 ) ) ( not ( = ?auto_372567 ?auto_372573 ) ) ( not ( = ?auto_372567 ?auto_372574 ) ) ( not ( = ?auto_372567 ?auto_372575 ) ) ( not ( = ?auto_372568 ?auto_372569 ) ) ( not ( = ?auto_372568 ?auto_372570 ) ) ( not ( = ?auto_372568 ?auto_372571 ) ) ( not ( = ?auto_372568 ?auto_372572 ) ) ( not ( = ?auto_372568 ?auto_372573 ) ) ( not ( = ?auto_372568 ?auto_372574 ) ) ( not ( = ?auto_372568 ?auto_372575 ) ) ( not ( = ?auto_372569 ?auto_372570 ) ) ( not ( = ?auto_372569 ?auto_372571 ) ) ( not ( = ?auto_372569 ?auto_372572 ) ) ( not ( = ?auto_372569 ?auto_372573 ) ) ( not ( = ?auto_372569 ?auto_372574 ) ) ( not ( = ?auto_372569 ?auto_372575 ) ) ( not ( = ?auto_372570 ?auto_372571 ) ) ( not ( = ?auto_372570 ?auto_372572 ) ) ( not ( = ?auto_372570 ?auto_372573 ) ) ( not ( = ?auto_372570 ?auto_372574 ) ) ( not ( = ?auto_372570 ?auto_372575 ) ) ( not ( = ?auto_372571 ?auto_372572 ) ) ( not ( = ?auto_372571 ?auto_372573 ) ) ( not ( = ?auto_372571 ?auto_372574 ) ) ( not ( = ?auto_372571 ?auto_372575 ) ) ( not ( = ?auto_372572 ?auto_372573 ) ) ( not ( = ?auto_372572 ?auto_372574 ) ) ( not ( = ?auto_372572 ?auto_372575 ) ) ( not ( = ?auto_372573 ?auto_372574 ) ) ( not ( = ?auto_372573 ?auto_372575 ) ) ( not ( = ?auto_372574 ?auto_372575 ) ) ( ON ?auto_372573 ?auto_372574 ) ( ON ?auto_372572 ?auto_372573 ) ( ON ?auto_372571 ?auto_372572 ) ( ON ?auto_372570 ?auto_372571 ) ( ON ?auto_372569 ?auto_372570 ) ( CLEAR ?auto_372567 ) ( ON ?auto_372568 ?auto_372569 ) ( CLEAR ?auto_372568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_372565 ?auto_372566 ?auto_372567 ?auto_372568 )
      ( MAKE-10PILE ?auto_372565 ?auto_372566 ?auto_372567 ?auto_372568 ?auto_372569 ?auto_372570 ?auto_372571 ?auto_372572 ?auto_372573 ?auto_372574 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372586 - BLOCK
      ?auto_372587 - BLOCK
      ?auto_372588 - BLOCK
      ?auto_372589 - BLOCK
      ?auto_372590 - BLOCK
      ?auto_372591 - BLOCK
      ?auto_372592 - BLOCK
      ?auto_372593 - BLOCK
      ?auto_372594 - BLOCK
      ?auto_372595 - BLOCK
    )
    :vars
    (
      ?auto_372596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372595 ?auto_372596 ) ( ON-TABLE ?auto_372586 ) ( ON ?auto_372587 ?auto_372586 ) ( not ( = ?auto_372586 ?auto_372587 ) ) ( not ( = ?auto_372586 ?auto_372588 ) ) ( not ( = ?auto_372586 ?auto_372589 ) ) ( not ( = ?auto_372586 ?auto_372590 ) ) ( not ( = ?auto_372586 ?auto_372591 ) ) ( not ( = ?auto_372586 ?auto_372592 ) ) ( not ( = ?auto_372586 ?auto_372593 ) ) ( not ( = ?auto_372586 ?auto_372594 ) ) ( not ( = ?auto_372586 ?auto_372595 ) ) ( not ( = ?auto_372586 ?auto_372596 ) ) ( not ( = ?auto_372587 ?auto_372588 ) ) ( not ( = ?auto_372587 ?auto_372589 ) ) ( not ( = ?auto_372587 ?auto_372590 ) ) ( not ( = ?auto_372587 ?auto_372591 ) ) ( not ( = ?auto_372587 ?auto_372592 ) ) ( not ( = ?auto_372587 ?auto_372593 ) ) ( not ( = ?auto_372587 ?auto_372594 ) ) ( not ( = ?auto_372587 ?auto_372595 ) ) ( not ( = ?auto_372587 ?auto_372596 ) ) ( not ( = ?auto_372588 ?auto_372589 ) ) ( not ( = ?auto_372588 ?auto_372590 ) ) ( not ( = ?auto_372588 ?auto_372591 ) ) ( not ( = ?auto_372588 ?auto_372592 ) ) ( not ( = ?auto_372588 ?auto_372593 ) ) ( not ( = ?auto_372588 ?auto_372594 ) ) ( not ( = ?auto_372588 ?auto_372595 ) ) ( not ( = ?auto_372588 ?auto_372596 ) ) ( not ( = ?auto_372589 ?auto_372590 ) ) ( not ( = ?auto_372589 ?auto_372591 ) ) ( not ( = ?auto_372589 ?auto_372592 ) ) ( not ( = ?auto_372589 ?auto_372593 ) ) ( not ( = ?auto_372589 ?auto_372594 ) ) ( not ( = ?auto_372589 ?auto_372595 ) ) ( not ( = ?auto_372589 ?auto_372596 ) ) ( not ( = ?auto_372590 ?auto_372591 ) ) ( not ( = ?auto_372590 ?auto_372592 ) ) ( not ( = ?auto_372590 ?auto_372593 ) ) ( not ( = ?auto_372590 ?auto_372594 ) ) ( not ( = ?auto_372590 ?auto_372595 ) ) ( not ( = ?auto_372590 ?auto_372596 ) ) ( not ( = ?auto_372591 ?auto_372592 ) ) ( not ( = ?auto_372591 ?auto_372593 ) ) ( not ( = ?auto_372591 ?auto_372594 ) ) ( not ( = ?auto_372591 ?auto_372595 ) ) ( not ( = ?auto_372591 ?auto_372596 ) ) ( not ( = ?auto_372592 ?auto_372593 ) ) ( not ( = ?auto_372592 ?auto_372594 ) ) ( not ( = ?auto_372592 ?auto_372595 ) ) ( not ( = ?auto_372592 ?auto_372596 ) ) ( not ( = ?auto_372593 ?auto_372594 ) ) ( not ( = ?auto_372593 ?auto_372595 ) ) ( not ( = ?auto_372593 ?auto_372596 ) ) ( not ( = ?auto_372594 ?auto_372595 ) ) ( not ( = ?auto_372594 ?auto_372596 ) ) ( not ( = ?auto_372595 ?auto_372596 ) ) ( ON ?auto_372594 ?auto_372595 ) ( ON ?auto_372593 ?auto_372594 ) ( ON ?auto_372592 ?auto_372593 ) ( ON ?auto_372591 ?auto_372592 ) ( ON ?auto_372590 ?auto_372591 ) ( ON ?auto_372589 ?auto_372590 ) ( CLEAR ?auto_372587 ) ( ON ?auto_372588 ?auto_372589 ) ( CLEAR ?auto_372588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_372586 ?auto_372587 ?auto_372588 )
      ( MAKE-10PILE ?auto_372586 ?auto_372587 ?auto_372588 ?auto_372589 ?auto_372590 ?auto_372591 ?auto_372592 ?auto_372593 ?auto_372594 ?auto_372595 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372607 - BLOCK
      ?auto_372608 - BLOCK
      ?auto_372609 - BLOCK
      ?auto_372610 - BLOCK
      ?auto_372611 - BLOCK
      ?auto_372612 - BLOCK
      ?auto_372613 - BLOCK
      ?auto_372614 - BLOCK
      ?auto_372615 - BLOCK
      ?auto_372616 - BLOCK
    )
    :vars
    (
      ?auto_372617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372616 ?auto_372617 ) ( ON-TABLE ?auto_372607 ) ( ON ?auto_372608 ?auto_372607 ) ( not ( = ?auto_372607 ?auto_372608 ) ) ( not ( = ?auto_372607 ?auto_372609 ) ) ( not ( = ?auto_372607 ?auto_372610 ) ) ( not ( = ?auto_372607 ?auto_372611 ) ) ( not ( = ?auto_372607 ?auto_372612 ) ) ( not ( = ?auto_372607 ?auto_372613 ) ) ( not ( = ?auto_372607 ?auto_372614 ) ) ( not ( = ?auto_372607 ?auto_372615 ) ) ( not ( = ?auto_372607 ?auto_372616 ) ) ( not ( = ?auto_372607 ?auto_372617 ) ) ( not ( = ?auto_372608 ?auto_372609 ) ) ( not ( = ?auto_372608 ?auto_372610 ) ) ( not ( = ?auto_372608 ?auto_372611 ) ) ( not ( = ?auto_372608 ?auto_372612 ) ) ( not ( = ?auto_372608 ?auto_372613 ) ) ( not ( = ?auto_372608 ?auto_372614 ) ) ( not ( = ?auto_372608 ?auto_372615 ) ) ( not ( = ?auto_372608 ?auto_372616 ) ) ( not ( = ?auto_372608 ?auto_372617 ) ) ( not ( = ?auto_372609 ?auto_372610 ) ) ( not ( = ?auto_372609 ?auto_372611 ) ) ( not ( = ?auto_372609 ?auto_372612 ) ) ( not ( = ?auto_372609 ?auto_372613 ) ) ( not ( = ?auto_372609 ?auto_372614 ) ) ( not ( = ?auto_372609 ?auto_372615 ) ) ( not ( = ?auto_372609 ?auto_372616 ) ) ( not ( = ?auto_372609 ?auto_372617 ) ) ( not ( = ?auto_372610 ?auto_372611 ) ) ( not ( = ?auto_372610 ?auto_372612 ) ) ( not ( = ?auto_372610 ?auto_372613 ) ) ( not ( = ?auto_372610 ?auto_372614 ) ) ( not ( = ?auto_372610 ?auto_372615 ) ) ( not ( = ?auto_372610 ?auto_372616 ) ) ( not ( = ?auto_372610 ?auto_372617 ) ) ( not ( = ?auto_372611 ?auto_372612 ) ) ( not ( = ?auto_372611 ?auto_372613 ) ) ( not ( = ?auto_372611 ?auto_372614 ) ) ( not ( = ?auto_372611 ?auto_372615 ) ) ( not ( = ?auto_372611 ?auto_372616 ) ) ( not ( = ?auto_372611 ?auto_372617 ) ) ( not ( = ?auto_372612 ?auto_372613 ) ) ( not ( = ?auto_372612 ?auto_372614 ) ) ( not ( = ?auto_372612 ?auto_372615 ) ) ( not ( = ?auto_372612 ?auto_372616 ) ) ( not ( = ?auto_372612 ?auto_372617 ) ) ( not ( = ?auto_372613 ?auto_372614 ) ) ( not ( = ?auto_372613 ?auto_372615 ) ) ( not ( = ?auto_372613 ?auto_372616 ) ) ( not ( = ?auto_372613 ?auto_372617 ) ) ( not ( = ?auto_372614 ?auto_372615 ) ) ( not ( = ?auto_372614 ?auto_372616 ) ) ( not ( = ?auto_372614 ?auto_372617 ) ) ( not ( = ?auto_372615 ?auto_372616 ) ) ( not ( = ?auto_372615 ?auto_372617 ) ) ( not ( = ?auto_372616 ?auto_372617 ) ) ( ON ?auto_372615 ?auto_372616 ) ( ON ?auto_372614 ?auto_372615 ) ( ON ?auto_372613 ?auto_372614 ) ( ON ?auto_372612 ?auto_372613 ) ( ON ?auto_372611 ?auto_372612 ) ( ON ?auto_372610 ?auto_372611 ) ( CLEAR ?auto_372608 ) ( ON ?auto_372609 ?auto_372610 ) ( CLEAR ?auto_372609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_372607 ?auto_372608 ?auto_372609 )
      ( MAKE-10PILE ?auto_372607 ?auto_372608 ?auto_372609 ?auto_372610 ?auto_372611 ?auto_372612 ?auto_372613 ?auto_372614 ?auto_372615 ?auto_372616 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372628 - BLOCK
      ?auto_372629 - BLOCK
      ?auto_372630 - BLOCK
      ?auto_372631 - BLOCK
      ?auto_372632 - BLOCK
      ?auto_372633 - BLOCK
      ?auto_372634 - BLOCK
      ?auto_372635 - BLOCK
      ?auto_372636 - BLOCK
      ?auto_372637 - BLOCK
    )
    :vars
    (
      ?auto_372638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372637 ?auto_372638 ) ( ON-TABLE ?auto_372628 ) ( not ( = ?auto_372628 ?auto_372629 ) ) ( not ( = ?auto_372628 ?auto_372630 ) ) ( not ( = ?auto_372628 ?auto_372631 ) ) ( not ( = ?auto_372628 ?auto_372632 ) ) ( not ( = ?auto_372628 ?auto_372633 ) ) ( not ( = ?auto_372628 ?auto_372634 ) ) ( not ( = ?auto_372628 ?auto_372635 ) ) ( not ( = ?auto_372628 ?auto_372636 ) ) ( not ( = ?auto_372628 ?auto_372637 ) ) ( not ( = ?auto_372628 ?auto_372638 ) ) ( not ( = ?auto_372629 ?auto_372630 ) ) ( not ( = ?auto_372629 ?auto_372631 ) ) ( not ( = ?auto_372629 ?auto_372632 ) ) ( not ( = ?auto_372629 ?auto_372633 ) ) ( not ( = ?auto_372629 ?auto_372634 ) ) ( not ( = ?auto_372629 ?auto_372635 ) ) ( not ( = ?auto_372629 ?auto_372636 ) ) ( not ( = ?auto_372629 ?auto_372637 ) ) ( not ( = ?auto_372629 ?auto_372638 ) ) ( not ( = ?auto_372630 ?auto_372631 ) ) ( not ( = ?auto_372630 ?auto_372632 ) ) ( not ( = ?auto_372630 ?auto_372633 ) ) ( not ( = ?auto_372630 ?auto_372634 ) ) ( not ( = ?auto_372630 ?auto_372635 ) ) ( not ( = ?auto_372630 ?auto_372636 ) ) ( not ( = ?auto_372630 ?auto_372637 ) ) ( not ( = ?auto_372630 ?auto_372638 ) ) ( not ( = ?auto_372631 ?auto_372632 ) ) ( not ( = ?auto_372631 ?auto_372633 ) ) ( not ( = ?auto_372631 ?auto_372634 ) ) ( not ( = ?auto_372631 ?auto_372635 ) ) ( not ( = ?auto_372631 ?auto_372636 ) ) ( not ( = ?auto_372631 ?auto_372637 ) ) ( not ( = ?auto_372631 ?auto_372638 ) ) ( not ( = ?auto_372632 ?auto_372633 ) ) ( not ( = ?auto_372632 ?auto_372634 ) ) ( not ( = ?auto_372632 ?auto_372635 ) ) ( not ( = ?auto_372632 ?auto_372636 ) ) ( not ( = ?auto_372632 ?auto_372637 ) ) ( not ( = ?auto_372632 ?auto_372638 ) ) ( not ( = ?auto_372633 ?auto_372634 ) ) ( not ( = ?auto_372633 ?auto_372635 ) ) ( not ( = ?auto_372633 ?auto_372636 ) ) ( not ( = ?auto_372633 ?auto_372637 ) ) ( not ( = ?auto_372633 ?auto_372638 ) ) ( not ( = ?auto_372634 ?auto_372635 ) ) ( not ( = ?auto_372634 ?auto_372636 ) ) ( not ( = ?auto_372634 ?auto_372637 ) ) ( not ( = ?auto_372634 ?auto_372638 ) ) ( not ( = ?auto_372635 ?auto_372636 ) ) ( not ( = ?auto_372635 ?auto_372637 ) ) ( not ( = ?auto_372635 ?auto_372638 ) ) ( not ( = ?auto_372636 ?auto_372637 ) ) ( not ( = ?auto_372636 ?auto_372638 ) ) ( not ( = ?auto_372637 ?auto_372638 ) ) ( ON ?auto_372636 ?auto_372637 ) ( ON ?auto_372635 ?auto_372636 ) ( ON ?auto_372634 ?auto_372635 ) ( ON ?auto_372633 ?auto_372634 ) ( ON ?auto_372632 ?auto_372633 ) ( ON ?auto_372631 ?auto_372632 ) ( ON ?auto_372630 ?auto_372631 ) ( CLEAR ?auto_372628 ) ( ON ?auto_372629 ?auto_372630 ) ( CLEAR ?auto_372629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_372628 ?auto_372629 )
      ( MAKE-10PILE ?auto_372628 ?auto_372629 ?auto_372630 ?auto_372631 ?auto_372632 ?auto_372633 ?auto_372634 ?auto_372635 ?auto_372636 ?auto_372637 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372649 - BLOCK
      ?auto_372650 - BLOCK
      ?auto_372651 - BLOCK
      ?auto_372652 - BLOCK
      ?auto_372653 - BLOCK
      ?auto_372654 - BLOCK
      ?auto_372655 - BLOCK
      ?auto_372656 - BLOCK
      ?auto_372657 - BLOCK
      ?auto_372658 - BLOCK
    )
    :vars
    (
      ?auto_372659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372658 ?auto_372659 ) ( ON-TABLE ?auto_372649 ) ( not ( = ?auto_372649 ?auto_372650 ) ) ( not ( = ?auto_372649 ?auto_372651 ) ) ( not ( = ?auto_372649 ?auto_372652 ) ) ( not ( = ?auto_372649 ?auto_372653 ) ) ( not ( = ?auto_372649 ?auto_372654 ) ) ( not ( = ?auto_372649 ?auto_372655 ) ) ( not ( = ?auto_372649 ?auto_372656 ) ) ( not ( = ?auto_372649 ?auto_372657 ) ) ( not ( = ?auto_372649 ?auto_372658 ) ) ( not ( = ?auto_372649 ?auto_372659 ) ) ( not ( = ?auto_372650 ?auto_372651 ) ) ( not ( = ?auto_372650 ?auto_372652 ) ) ( not ( = ?auto_372650 ?auto_372653 ) ) ( not ( = ?auto_372650 ?auto_372654 ) ) ( not ( = ?auto_372650 ?auto_372655 ) ) ( not ( = ?auto_372650 ?auto_372656 ) ) ( not ( = ?auto_372650 ?auto_372657 ) ) ( not ( = ?auto_372650 ?auto_372658 ) ) ( not ( = ?auto_372650 ?auto_372659 ) ) ( not ( = ?auto_372651 ?auto_372652 ) ) ( not ( = ?auto_372651 ?auto_372653 ) ) ( not ( = ?auto_372651 ?auto_372654 ) ) ( not ( = ?auto_372651 ?auto_372655 ) ) ( not ( = ?auto_372651 ?auto_372656 ) ) ( not ( = ?auto_372651 ?auto_372657 ) ) ( not ( = ?auto_372651 ?auto_372658 ) ) ( not ( = ?auto_372651 ?auto_372659 ) ) ( not ( = ?auto_372652 ?auto_372653 ) ) ( not ( = ?auto_372652 ?auto_372654 ) ) ( not ( = ?auto_372652 ?auto_372655 ) ) ( not ( = ?auto_372652 ?auto_372656 ) ) ( not ( = ?auto_372652 ?auto_372657 ) ) ( not ( = ?auto_372652 ?auto_372658 ) ) ( not ( = ?auto_372652 ?auto_372659 ) ) ( not ( = ?auto_372653 ?auto_372654 ) ) ( not ( = ?auto_372653 ?auto_372655 ) ) ( not ( = ?auto_372653 ?auto_372656 ) ) ( not ( = ?auto_372653 ?auto_372657 ) ) ( not ( = ?auto_372653 ?auto_372658 ) ) ( not ( = ?auto_372653 ?auto_372659 ) ) ( not ( = ?auto_372654 ?auto_372655 ) ) ( not ( = ?auto_372654 ?auto_372656 ) ) ( not ( = ?auto_372654 ?auto_372657 ) ) ( not ( = ?auto_372654 ?auto_372658 ) ) ( not ( = ?auto_372654 ?auto_372659 ) ) ( not ( = ?auto_372655 ?auto_372656 ) ) ( not ( = ?auto_372655 ?auto_372657 ) ) ( not ( = ?auto_372655 ?auto_372658 ) ) ( not ( = ?auto_372655 ?auto_372659 ) ) ( not ( = ?auto_372656 ?auto_372657 ) ) ( not ( = ?auto_372656 ?auto_372658 ) ) ( not ( = ?auto_372656 ?auto_372659 ) ) ( not ( = ?auto_372657 ?auto_372658 ) ) ( not ( = ?auto_372657 ?auto_372659 ) ) ( not ( = ?auto_372658 ?auto_372659 ) ) ( ON ?auto_372657 ?auto_372658 ) ( ON ?auto_372656 ?auto_372657 ) ( ON ?auto_372655 ?auto_372656 ) ( ON ?auto_372654 ?auto_372655 ) ( ON ?auto_372653 ?auto_372654 ) ( ON ?auto_372652 ?auto_372653 ) ( ON ?auto_372651 ?auto_372652 ) ( CLEAR ?auto_372649 ) ( ON ?auto_372650 ?auto_372651 ) ( CLEAR ?auto_372650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_372649 ?auto_372650 )
      ( MAKE-10PILE ?auto_372649 ?auto_372650 ?auto_372651 ?auto_372652 ?auto_372653 ?auto_372654 ?auto_372655 ?auto_372656 ?auto_372657 ?auto_372658 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372670 - BLOCK
      ?auto_372671 - BLOCK
      ?auto_372672 - BLOCK
      ?auto_372673 - BLOCK
      ?auto_372674 - BLOCK
      ?auto_372675 - BLOCK
      ?auto_372676 - BLOCK
      ?auto_372677 - BLOCK
      ?auto_372678 - BLOCK
      ?auto_372679 - BLOCK
    )
    :vars
    (
      ?auto_372680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372679 ?auto_372680 ) ( not ( = ?auto_372670 ?auto_372671 ) ) ( not ( = ?auto_372670 ?auto_372672 ) ) ( not ( = ?auto_372670 ?auto_372673 ) ) ( not ( = ?auto_372670 ?auto_372674 ) ) ( not ( = ?auto_372670 ?auto_372675 ) ) ( not ( = ?auto_372670 ?auto_372676 ) ) ( not ( = ?auto_372670 ?auto_372677 ) ) ( not ( = ?auto_372670 ?auto_372678 ) ) ( not ( = ?auto_372670 ?auto_372679 ) ) ( not ( = ?auto_372670 ?auto_372680 ) ) ( not ( = ?auto_372671 ?auto_372672 ) ) ( not ( = ?auto_372671 ?auto_372673 ) ) ( not ( = ?auto_372671 ?auto_372674 ) ) ( not ( = ?auto_372671 ?auto_372675 ) ) ( not ( = ?auto_372671 ?auto_372676 ) ) ( not ( = ?auto_372671 ?auto_372677 ) ) ( not ( = ?auto_372671 ?auto_372678 ) ) ( not ( = ?auto_372671 ?auto_372679 ) ) ( not ( = ?auto_372671 ?auto_372680 ) ) ( not ( = ?auto_372672 ?auto_372673 ) ) ( not ( = ?auto_372672 ?auto_372674 ) ) ( not ( = ?auto_372672 ?auto_372675 ) ) ( not ( = ?auto_372672 ?auto_372676 ) ) ( not ( = ?auto_372672 ?auto_372677 ) ) ( not ( = ?auto_372672 ?auto_372678 ) ) ( not ( = ?auto_372672 ?auto_372679 ) ) ( not ( = ?auto_372672 ?auto_372680 ) ) ( not ( = ?auto_372673 ?auto_372674 ) ) ( not ( = ?auto_372673 ?auto_372675 ) ) ( not ( = ?auto_372673 ?auto_372676 ) ) ( not ( = ?auto_372673 ?auto_372677 ) ) ( not ( = ?auto_372673 ?auto_372678 ) ) ( not ( = ?auto_372673 ?auto_372679 ) ) ( not ( = ?auto_372673 ?auto_372680 ) ) ( not ( = ?auto_372674 ?auto_372675 ) ) ( not ( = ?auto_372674 ?auto_372676 ) ) ( not ( = ?auto_372674 ?auto_372677 ) ) ( not ( = ?auto_372674 ?auto_372678 ) ) ( not ( = ?auto_372674 ?auto_372679 ) ) ( not ( = ?auto_372674 ?auto_372680 ) ) ( not ( = ?auto_372675 ?auto_372676 ) ) ( not ( = ?auto_372675 ?auto_372677 ) ) ( not ( = ?auto_372675 ?auto_372678 ) ) ( not ( = ?auto_372675 ?auto_372679 ) ) ( not ( = ?auto_372675 ?auto_372680 ) ) ( not ( = ?auto_372676 ?auto_372677 ) ) ( not ( = ?auto_372676 ?auto_372678 ) ) ( not ( = ?auto_372676 ?auto_372679 ) ) ( not ( = ?auto_372676 ?auto_372680 ) ) ( not ( = ?auto_372677 ?auto_372678 ) ) ( not ( = ?auto_372677 ?auto_372679 ) ) ( not ( = ?auto_372677 ?auto_372680 ) ) ( not ( = ?auto_372678 ?auto_372679 ) ) ( not ( = ?auto_372678 ?auto_372680 ) ) ( not ( = ?auto_372679 ?auto_372680 ) ) ( ON ?auto_372678 ?auto_372679 ) ( ON ?auto_372677 ?auto_372678 ) ( ON ?auto_372676 ?auto_372677 ) ( ON ?auto_372675 ?auto_372676 ) ( ON ?auto_372674 ?auto_372675 ) ( ON ?auto_372673 ?auto_372674 ) ( ON ?auto_372672 ?auto_372673 ) ( ON ?auto_372671 ?auto_372672 ) ( ON ?auto_372670 ?auto_372671 ) ( CLEAR ?auto_372670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_372670 )
      ( MAKE-10PILE ?auto_372670 ?auto_372671 ?auto_372672 ?auto_372673 ?auto_372674 ?auto_372675 ?auto_372676 ?auto_372677 ?auto_372678 ?auto_372679 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_372691 - BLOCK
      ?auto_372692 - BLOCK
      ?auto_372693 - BLOCK
      ?auto_372694 - BLOCK
      ?auto_372695 - BLOCK
      ?auto_372696 - BLOCK
      ?auto_372697 - BLOCK
      ?auto_372698 - BLOCK
      ?auto_372699 - BLOCK
      ?auto_372700 - BLOCK
    )
    :vars
    (
      ?auto_372701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372700 ?auto_372701 ) ( not ( = ?auto_372691 ?auto_372692 ) ) ( not ( = ?auto_372691 ?auto_372693 ) ) ( not ( = ?auto_372691 ?auto_372694 ) ) ( not ( = ?auto_372691 ?auto_372695 ) ) ( not ( = ?auto_372691 ?auto_372696 ) ) ( not ( = ?auto_372691 ?auto_372697 ) ) ( not ( = ?auto_372691 ?auto_372698 ) ) ( not ( = ?auto_372691 ?auto_372699 ) ) ( not ( = ?auto_372691 ?auto_372700 ) ) ( not ( = ?auto_372691 ?auto_372701 ) ) ( not ( = ?auto_372692 ?auto_372693 ) ) ( not ( = ?auto_372692 ?auto_372694 ) ) ( not ( = ?auto_372692 ?auto_372695 ) ) ( not ( = ?auto_372692 ?auto_372696 ) ) ( not ( = ?auto_372692 ?auto_372697 ) ) ( not ( = ?auto_372692 ?auto_372698 ) ) ( not ( = ?auto_372692 ?auto_372699 ) ) ( not ( = ?auto_372692 ?auto_372700 ) ) ( not ( = ?auto_372692 ?auto_372701 ) ) ( not ( = ?auto_372693 ?auto_372694 ) ) ( not ( = ?auto_372693 ?auto_372695 ) ) ( not ( = ?auto_372693 ?auto_372696 ) ) ( not ( = ?auto_372693 ?auto_372697 ) ) ( not ( = ?auto_372693 ?auto_372698 ) ) ( not ( = ?auto_372693 ?auto_372699 ) ) ( not ( = ?auto_372693 ?auto_372700 ) ) ( not ( = ?auto_372693 ?auto_372701 ) ) ( not ( = ?auto_372694 ?auto_372695 ) ) ( not ( = ?auto_372694 ?auto_372696 ) ) ( not ( = ?auto_372694 ?auto_372697 ) ) ( not ( = ?auto_372694 ?auto_372698 ) ) ( not ( = ?auto_372694 ?auto_372699 ) ) ( not ( = ?auto_372694 ?auto_372700 ) ) ( not ( = ?auto_372694 ?auto_372701 ) ) ( not ( = ?auto_372695 ?auto_372696 ) ) ( not ( = ?auto_372695 ?auto_372697 ) ) ( not ( = ?auto_372695 ?auto_372698 ) ) ( not ( = ?auto_372695 ?auto_372699 ) ) ( not ( = ?auto_372695 ?auto_372700 ) ) ( not ( = ?auto_372695 ?auto_372701 ) ) ( not ( = ?auto_372696 ?auto_372697 ) ) ( not ( = ?auto_372696 ?auto_372698 ) ) ( not ( = ?auto_372696 ?auto_372699 ) ) ( not ( = ?auto_372696 ?auto_372700 ) ) ( not ( = ?auto_372696 ?auto_372701 ) ) ( not ( = ?auto_372697 ?auto_372698 ) ) ( not ( = ?auto_372697 ?auto_372699 ) ) ( not ( = ?auto_372697 ?auto_372700 ) ) ( not ( = ?auto_372697 ?auto_372701 ) ) ( not ( = ?auto_372698 ?auto_372699 ) ) ( not ( = ?auto_372698 ?auto_372700 ) ) ( not ( = ?auto_372698 ?auto_372701 ) ) ( not ( = ?auto_372699 ?auto_372700 ) ) ( not ( = ?auto_372699 ?auto_372701 ) ) ( not ( = ?auto_372700 ?auto_372701 ) ) ( ON ?auto_372699 ?auto_372700 ) ( ON ?auto_372698 ?auto_372699 ) ( ON ?auto_372697 ?auto_372698 ) ( ON ?auto_372696 ?auto_372697 ) ( ON ?auto_372695 ?auto_372696 ) ( ON ?auto_372694 ?auto_372695 ) ( ON ?auto_372693 ?auto_372694 ) ( ON ?auto_372692 ?auto_372693 ) ( ON ?auto_372691 ?auto_372692 ) ( CLEAR ?auto_372691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_372691 )
      ( MAKE-10PILE ?auto_372691 ?auto_372692 ?auto_372693 ?auto_372694 ?auto_372695 ?auto_372696 ?auto_372697 ?auto_372698 ?auto_372699 ?auto_372700 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372713 - BLOCK
      ?auto_372714 - BLOCK
      ?auto_372715 - BLOCK
      ?auto_372716 - BLOCK
      ?auto_372717 - BLOCK
      ?auto_372718 - BLOCK
      ?auto_372719 - BLOCK
      ?auto_372720 - BLOCK
      ?auto_372721 - BLOCK
      ?auto_372722 - BLOCK
      ?auto_372723 - BLOCK
    )
    :vars
    (
      ?auto_372724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_372722 ) ( ON ?auto_372723 ?auto_372724 ) ( CLEAR ?auto_372723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_372713 ) ( ON ?auto_372714 ?auto_372713 ) ( ON ?auto_372715 ?auto_372714 ) ( ON ?auto_372716 ?auto_372715 ) ( ON ?auto_372717 ?auto_372716 ) ( ON ?auto_372718 ?auto_372717 ) ( ON ?auto_372719 ?auto_372718 ) ( ON ?auto_372720 ?auto_372719 ) ( ON ?auto_372721 ?auto_372720 ) ( ON ?auto_372722 ?auto_372721 ) ( not ( = ?auto_372713 ?auto_372714 ) ) ( not ( = ?auto_372713 ?auto_372715 ) ) ( not ( = ?auto_372713 ?auto_372716 ) ) ( not ( = ?auto_372713 ?auto_372717 ) ) ( not ( = ?auto_372713 ?auto_372718 ) ) ( not ( = ?auto_372713 ?auto_372719 ) ) ( not ( = ?auto_372713 ?auto_372720 ) ) ( not ( = ?auto_372713 ?auto_372721 ) ) ( not ( = ?auto_372713 ?auto_372722 ) ) ( not ( = ?auto_372713 ?auto_372723 ) ) ( not ( = ?auto_372713 ?auto_372724 ) ) ( not ( = ?auto_372714 ?auto_372715 ) ) ( not ( = ?auto_372714 ?auto_372716 ) ) ( not ( = ?auto_372714 ?auto_372717 ) ) ( not ( = ?auto_372714 ?auto_372718 ) ) ( not ( = ?auto_372714 ?auto_372719 ) ) ( not ( = ?auto_372714 ?auto_372720 ) ) ( not ( = ?auto_372714 ?auto_372721 ) ) ( not ( = ?auto_372714 ?auto_372722 ) ) ( not ( = ?auto_372714 ?auto_372723 ) ) ( not ( = ?auto_372714 ?auto_372724 ) ) ( not ( = ?auto_372715 ?auto_372716 ) ) ( not ( = ?auto_372715 ?auto_372717 ) ) ( not ( = ?auto_372715 ?auto_372718 ) ) ( not ( = ?auto_372715 ?auto_372719 ) ) ( not ( = ?auto_372715 ?auto_372720 ) ) ( not ( = ?auto_372715 ?auto_372721 ) ) ( not ( = ?auto_372715 ?auto_372722 ) ) ( not ( = ?auto_372715 ?auto_372723 ) ) ( not ( = ?auto_372715 ?auto_372724 ) ) ( not ( = ?auto_372716 ?auto_372717 ) ) ( not ( = ?auto_372716 ?auto_372718 ) ) ( not ( = ?auto_372716 ?auto_372719 ) ) ( not ( = ?auto_372716 ?auto_372720 ) ) ( not ( = ?auto_372716 ?auto_372721 ) ) ( not ( = ?auto_372716 ?auto_372722 ) ) ( not ( = ?auto_372716 ?auto_372723 ) ) ( not ( = ?auto_372716 ?auto_372724 ) ) ( not ( = ?auto_372717 ?auto_372718 ) ) ( not ( = ?auto_372717 ?auto_372719 ) ) ( not ( = ?auto_372717 ?auto_372720 ) ) ( not ( = ?auto_372717 ?auto_372721 ) ) ( not ( = ?auto_372717 ?auto_372722 ) ) ( not ( = ?auto_372717 ?auto_372723 ) ) ( not ( = ?auto_372717 ?auto_372724 ) ) ( not ( = ?auto_372718 ?auto_372719 ) ) ( not ( = ?auto_372718 ?auto_372720 ) ) ( not ( = ?auto_372718 ?auto_372721 ) ) ( not ( = ?auto_372718 ?auto_372722 ) ) ( not ( = ?auto_372718 ?auto_372723 ) ) ( not ( = ?auto_372718 ?auto_372724 ) ) ( not ( = ?auto_372719 ?auto_372720 ) ) ( not ( = ?auto_372719 ?auto_372721 ) ) ( not ( = ?auto_372719 ?auto_372722 ) ) ( not ( = ?auto_372719 ?auto_372723 ) ) ( not ( = ?auto_372719 ?auto_372724 ) ) ( not ( = ?auto_372720 ?auto_372721 ) ) ( not ( = ?auto_372720 ?auto_372722 ) ) ( not ( = ?auto_372720 ?auto_372723 ) ) ( not ( = ?auto_372720 ?auto_372724 ) ) ( not ( = ?auto_372721 ?auto_372722 ) ) ( not ( = ?auto_372721 ?auto_372723 ) ) ( not ( = ?auto_372721 ?auto_372724 ) ) ( not ( = ?auto_372722 ?auto_372723 ) ) ( not ( = ?auto_372722 ?auto_372724 ) ) ( not ( = ?auto_372723 ?auto_372724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_372723 ?auto_372724 )
      ( !STACK ?auto_372723 ?auto_372722 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372736 - BLOCK
      ?auto_372737 - BLOCK
      ?auto_372738 - BLOCK
      ?auto_372739 - BLOCK
      ?auto_372740 - BLOCK
      ?auto_372741 - BLOCK
      ?auto_372742 - BLOCK
      ?auto_372743 - BLOCK
      ?auto_372744 - BLOCK
      ?auto_372745 - BLOCK
      ?auto_372746 - BLOCK
    )
    :vars
    (
      ?auto_372747 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_372745 ) ( ON ?auto_372746 ?auto_372747 ) ( CLEAR ?auto_372746 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_372736 ) ( ON ?auto_372737 ?auto_372736 ) ( ON ?auto_372738 ?auto_372737 ) ( ON ?auto_372739 ?auto_372738 ) ( ON ?auto_372740 ?auto_372739 ) ( ON ?auto_372741 ?auto_372740 ) ( ON ?auto_372742 ?auto_372741 ) ( ON ?auto_372743 ?auto_372742 ) ( ON ?auto_372744 ?auto_372743 ) ( ON ?auto_372745 ?auto_372744 ) ( not ( = ?auto_372736 ?auto_372737 ) ) ( not ( = ?auto_372736 ?auto_372738 ) ) ( not ( = ?auto_372736 ?auto_372739 ) ) ( not ( = ?auto_372736 ?auto_372740 ) ) ( not ( = ?auto_372736 ?auto_372741 ) ) ( not ( = ?auto_372736 ?auto_372742 ) ) ( not ( = ?auto_372736 ?auto_372743 ) ) ( not ( = ?auto_372736 ?auto_372744 ) ) ( not ( = ?auto_372736 ?auto_372745 ) ) ( not ( = ?auto_372736 ?auto_372746 ) ) ( not ( = ?auto_372736 ?auto_372747 ) ) ( not ( = ?auto_372737 ?auto_372738 ) ) ( not ( = ?auto_372737 ?auto_372739 ) ) ( not ( = ?auto_372737 ?auto_372740 ) ) ( not ( = ?auto_372737 ?auto_372741 ) ) ( not ( = ?auto_372737 ?auto_372742 ) ) ( not ( = ?auto_372737 ?auto_372743 ) ) ( not ( = ?auto_372737 ?auto_372744 ) ) ( not ( = ?auto_372737 ?auto_372745 ) ) ( not ( = ?auto_372737 ?auto_372746 ) ) ( not ( = ?auto_372737 ?auto_372747 ) ) ( not ( = ?auto_372738 ?auto_372739 ) ) ( not ( = ?auto_372738 ?auto_372740 ) ) ( not ( = ?auto_372738 ?auto_372741 ) ) ( not ( = ?auto_372738 ?auto_372742 ) ) ( not ( = ?auto_372738 ?auto_372743 ) ) ( not ( = ?auto_372738 ?auto_372744 ) ) ( not ( = ?auto_372738 ?auto_372745 ) ) ( not ( = ?auto_372738 ?auto_372746 ) ) ( not ( = ?auto_372738 ?auto_372747 ) ) ( not ( = ?auto_372739 ?auto_372740 ) ) ( not ( = ?auto_372739 ?auto_372741 ) ) ( not ( = ?auto_372739 ?auto_372742 ) ) ( not ( = ?auto_372739 ?auto_372743 ) ) ( not ( = ?auto_372739 ?auto_372744 ) ) ( not ( = ?auto_372739 ?auto_372745 ) ) ( not ( = ?auto_372739 ?auto_372746 ) ) ( not ( = ?auto_372739 ?auto_372747 ) ) ( not ( = ?auto_372740 ?auto_372741 ) ) ( not ( = ?auto_372740 ?auto_372742 ) ) ( not ( = ?auto_372740 ?auto_372743 ) ) ( not ( = ?auto_372740 ?auto_372744 ) ) ( not ( = ?auto_372740 ?auto_372745 ) ) ( not ( = ?auto_372740 ?auto_372746 ) ) ( not ( = ?auto_372740 ?auto_372747 ) ) ( not ( = ?auto_372741 ?auto_372742 ) ) ( not ( = ?auto_372741 ?auto_372743 ) ) ( not ( = ?auto_372741 ?auto_372744 ) ) ( not ( = ?auto_372741 ?auto_372745 ) ) ( not ( = ?auto_372741 ?auto_372746 ) ) ( not ( = ?auto_372741 ?auto_372747 ) ) ( not ( = ?auto_372742 ?auto_372743 ) ) ( not ( = ?auto_372742 ?auto_372744 ) ) ( not ( = ?auto_372742 ?auto_372745 ) ) ( not ( = ?auto_372742 ?auto_372746 ) ) ( not ( = ?auto_372742 ?auto_372747 ) ) ( not ( = ?auto_372743 ?auto_372744 ) ) ( not ( = ?auto_372743 ?auto_372745 ) ) ( not ( = ?auto_372743 ?auto_372746 ) ) ( not ( = ?auto_372743 ?auto_372747 ) ) ( not ( = ?auto_372744 ?auto_372745 ) ) ( not ( = ?auto_372744 ?auto_372746 ) ) ( not ( = ?auto_372744 ?auto_372747 ) ) ( not ( = ?auto_372745 ?auto_372746 ) ) ( not ( = ?auto_372745 ?auto_372747 ) ) ( not ( = ?auto_372746 ?auto_372747 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_372746 ?auto_372747 )
      ( !STACK ?auto_372746 ?auto_372745 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372759 - BLOCK
      ?auto_372760 - BLOCK
      ?auto_372761 - BLOCK
      ?auto_372762 - BLOCK
      ?auto_372763 - BLOCK
      ?auto_372764 - BLOCK
      ?auto_372765 - BLOCK
      ?auto_372766 - BLOCK
      ?auto_372767 - BLOCK
      ?auto_372768 - BLOCK
      ?auto_372769 - BLOCK
    )
    :vars
    (
      ?auto_372770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372769 ?auto_372770 ) ( ON-TABLE ?auto_372759 ) ( ON ?auto_372760 ?auto_372759 ) ( ON ?auto_372761 ?auto_372760 ) ( ON ?auto_372762 ?auto_372761 ) ( ON ?auto_372763 ?auto_372762 ) ( ON ?auto_372764 ?auto_372763 ) ( ON ?auto_372765 ?auto_372764 ) ( ON ?auto_372766 ?auto_372765 ) ( ON ?auto_372767 ?auto_372766 ) ( not ( = ?auto_372759 ?auto_372760 ) ) ( not ( = ?auto_372759 ?auto_372761 ) ) ( not ( = ?auto_372759 ?auto_372762 ) ) ( not ( = ?auto_372759 ?auto_372763 ) ) ( not ( = ?auto_372759 ?auto_372764 ) ) ( not ( = ?auto_372759 ?auto_372765 ) ) ( not ( = ?auto_372759 ?auto_372766 ) ) ( not ( = ?auto_372759 ?auto_372767 ) ) ( not ( = ?auto_372759 ?auto_372768 ) ) ( not ( = ?auto_372759 ?auto_372769 ) ) ( not ( = ?auto_372759 ?auto_372770 ) ) ( not ( = ?auto_372760 ?auto_372761 ) ) ( not ( = ?auto_372760 ?auto_372762 ) ) ( not ( = ?auto_372760 ?auto_372763 ) ) ( not ( = ?auto_372760 ?auto_372764 ) ) ( not ( = ?auto_372760 ?auto_372765 ) ) ( not ( = ?auto_372760 ?auto_372766 ) ) ( not ( = ?auto_372760 ?auto_372767 ) ) ( not ( = ?auto_372760 ?auto_372768 ) ) ( not ( = ?auto_372760 ?auto_372769 ) ) ( not ( = ?auto_372760 ?auto_372770 ) ) ( not ( = ?auto_372761 ?auto_372762 ) ) ( not ( = ?auto_372761 ?auto_372763 ) ) ( not ( = ?auto_372761 ?auto_372764 ) ) ( not ( = ?auto_372761 ?auto_372765 ) ) ( not ( = ?auto_372761 ?auto_372766 ) ) ( not ( = ?auto_372761 ?auto_372767 ) ) ( not ( = ?auto_372761 ?auto_372768 ) ) ( not ( = ?auto_372761 ?auto_372769 ) ) ( not ( = ?auto_372761 ?auto_372770 ) ) ( not ( = ?auto_372762 ?auto_372763 ) ) ( not ( = ?auto_372762 ?auto_372764 ) ) ( not ( = ?auto_372762 ?auto_372765 ) ) ( not ( = ?auto_372762 ?auto_372766 ) ) ( not ( = ?auto_372762 ?auto_372767 ) ) ( not ( = ?auto_372762 ?auto_372768 ) ) ( not ( = ?auto_372762 ?auto_372769 ) ) ( not ( = ?auto_372762 ?auto_372770 ) ) ( not ( = ?auto_372763 ?auto_372764 ) ) ( not ( = ?auto_372763 ?auto_372765 ) ) ( not ( = ?auto_372763 ?auto_372766 ) ) ( not ( = ?auto_372763 ?auto_372767 ) ) ( not ( = ?auto_372763 ?auto_372768 ) ) ( not ( = ?auto_372763 ?auto_372769 ) ) ( not ( = ?auto_372763 ?auto_372770 ) ) ( not ( = ?auto_372764 ?auto_372765 ) ) ( not ( = ?auto_372764 ?auto_372766 ) ) ( not ( = ?auto_372764 ?auto_372767 ) ) ( not ( = ?auto_372764 ?auto_372768 ) ) ( not ( = ?auto_372764 ?auto_372769 ) ) ( not ( = ?auto_372764 ?auto_372770 ) ) ( not ( = ?auto_372765 ?auto_372766 ) ) ( not ( = ?auto_372765 ?auto_372767 ) ) ( not ( = ?auto_372765 ?auto_372768 ) ) ( not ( = ?auto_372765 ?auto_372769 ) ) ( not ( = ?auto_372765 ?auto_372770 ) ) ( not ( = ?auto_372766 ?auto_372767 ) ) ( not ( = ?auto_372766 ?auto_372768 ) ) ( not ( = ?auto_372766 ?auto_372769 ) ) ( not ( = ?auto_372766 ?auto_372770 ) ) ( not ( = ?auto_372767 ?auto_372768 ) ) ( not ( = ?auto_372767 ?auto_372769 ) ) ( not ( = ?auto_372767 ?auto_372770 ) ) ( not ( = ?auto_372768 ?auto_372769 ) ) ( not ( = ?auto_372768 ?auto_372770 ) ) ( not ( = ?auto_372769 ?auto_372770 ) ) ( CLEAR ?auto_372767 ) ( ON ?auto_372768 ?auto_372769 ) ( CLEAR ?auto_372768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_372759 ?auto_372760 ?auto_372761 ?auto_372762 ?auto_372763 ?auto_372764 ?auto_372765 ?auto_372766 ?auto_372767 ?auto_372768 )
      ( MAKE-11PILE ?auto_372759 ?auto_372760 ?auto_372761 ?auto_372762 ?auto_372763 ?auto_372764 ?auto_372765 ?auto_372766 ?auto_372767 ?auto_372768 ?auto_372769 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372782 - BLOCK
      ?auto_372783 - BLOCK
      ?auto_372784 - BLOCK
      ?auto_372785 - BLOCK
      ?auto_372786 - BLOCK
      ?auto_372787 - BLOCK
      ?auto_372788 - BLOCK
      ?auto_372789 - BLOCK
      ?auto_372790 - BLOCK
      ?auto_372791 - BLOCK
      ?auto_372792 - BLOCK
    )
    :vars
    (
      ?auto_372793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372792 ?auto_372793 ) ( ON-TABLE ?auto_372782 ) ( ON ?auto_372783 ?auto_372782 ) ( ON ?auto_372784 ?auto_372783 ) ( ON ?auto_372785 ?auto_372784 ) ( ON ?auto_372786 ?auto_372785 ) ( ON ?auto_372787 ?auto_372786 ) ( ON ?auto_372788 ?auto_372787 ) ( ON ?auto_372789 ?auto_372788 ) ( ON ?auto_372790 ?auto_372789 ) ( not ( = ?auto_372782 ?auto_372783 ) ) ( not ( = ?auto_372782 ?auto_372784 ) ) ( not ( = ?auto_372782 ?auto_372785 ) ) ( not ( = ?auto_372782 ?auto_372786 ) ) ( not ( = ?auto_372782 ?auto_372787 ) ) ( not ( = ?auto_372782 ?auto_372788 ) ) ( not ( = ?auto_372782 ?auto_372789 ) ) ( not ( = ?auto_372782 ?auto_372790 ) ) ( not ( = ?auto_372782 ?auto_372791 ) ) ( not ( = ?auto_372782 ?auto_372792 ) ) ( not ( = ?auto_372782 ?auto_372793 ) ) ( not ( = ?auto_372783 ?auto_372784 ) ) ( not ( = ?auto_372783 ?auto_372785 ) ) ( not ( = ?auto_372783 ?auto_372786 ) ) ( not ( = ?auto_372783 ?auto_372787 ) ) ( not ( = ?auto_372783 ?auto_372788 ) ) ( not ( = ?auto_372783 ?auto_372789 ) ) ( not ( = ?auto_372783 ?auto_372790 ) ) ( not ( = ?auto_372783 ?auto_372791 ) ) ( not ( = ?auto_372783 ?auto_372792 ) ) ( not ( = ?auto_372783 ?auto_372793 ) ) ( not ( = ?auto_372784 ?auto_372785 ) ) ( not ( = ?auto_372784 ?auto_372786 ) ) ( not ( = ?auto_372784 ?auto_372787 ) ) ( not ( = ?auto_372784 ?auto_372788 ) ) ( not ( = ?auto_372784 ?auto_372789 ) ) ( not ( = ?auto_372784 ?auto_372790 ) ) ( not ( = ?auto_372784 ?auto_372791 ) ) ( not ( = ?auto_372784 ?auto_372792 ) ) ( not ( = ?auto_372784 ?auto_372793 ) ) ( not ( = ?auto_372785 ?auto_372786 ) ) ( not ( = ?auto_372785 ?auto_372787 ) ) ( not ( = ?auto_372785 ?auto_372788 ) ) ( not ( = ?auto_372785 ?auto_372789 ) ) ( not ( = ?auto_372785 ?auto_372790 ) ) ( not ( = ?auto_372785 ?auto_372791 ) ) ( not ( = ?auto_372785 ?auto_372792 ) ) ( not ( = ?auto_372785 ?auto_372793 ) ) ( not ( = ?auto_372786 ?auto_372787 ) ) ( not ( = ?auto_372786 ?auto_372788 ) ) ( not ( = ?auto_372786 ?auto_372789 ) ) ( not ( = ?auto_372786 ?auto_372790 ) ) ( not ( = ?auto_372786 ?auto_372791 ) ) ( not ( = ?auto_372786 ?auto_372792 ) ) ( not ( = ?auto_372786 ?auto_372793 ) ) ( not ( = ?auto_372787 ?auto_372788 ) ) ( not ( = ?auto_372787 ?auto_372789 ) ) ( not ( = ?auto_372787 ?auto_372790 ) ) ( not ( = ?auto_372787 ?auto_372791 ) ) ( not ( = ?auto_372787 ?auto_372792 ) ) ( not ( = ?auto_372787 ?auto_372793 ) ) ( not ( = ?auto_372788 ?auto_372789 ) ) ( not ( = ?auto_372788 ?auto_372790 ) ) ( not ( = ?auto_372788 ?auto_372791 ) ) ( not ( = ?auto_372788 ?auto_372792 ) ) ( not ( = ?auto_372788 ?auto_372793 ) ) ( not ( = ?auto_372789 ?auto_372790 ) ) ( not ( = ?auto_372789 ?auto_372791 ) ) ( not ( = ?auto_372789 ?auto_372792 ) ) ( not ( = ?auto_372789 ?auto_372793 ) ) ( not ( = ?auto_372790 ?auto_372791 ) ) ( not ( = ?auto_372790 ?auto_372792 ) ) ( not ( = ?auto_372790 ?auto_372793 ) ) ( not ( = ?auto_372791 ?auto_372792 ) ) ( not ( = ?auto_372791 ?auto_372793 ) ) ( not ( = ?auto_372792 ?auto_372793 ) ) ( CLEAR ?auto_372790 ) ( ON ?auto_372791 ?auto_372792 ) ( CLEAR ?auto_372791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_372782 ?auto_372783 ?auto_372784 ?auto_372785 ?auto_372786 ?auto_372787 ?auto_372788 ?auto_372789 ?auto_372790 ?auto_372791 )
      ( MAKE-11PILE ?auto_372782 ?auto_372783 ?auto_372784 ?auto_372785 ?auto_372786 ?auto_372787 ?auto_372788 ?auto_372789 ?auto_372790 ?auto_372791 ?auto_372792 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372805 - BLOCK
      ?auto_372806 - BLOCK
      ?auto_372807 - BLOCK
      ?auto_372808 - BLOCK
      ?auto_372809 - BLOCK
      ?auto_372810 - BLOCK
      ?auto_372811 - BLOCK
      ?auto_372812 - BLOCK
      ?auto_372813 - BLOCK
      ?auto_372814 - BLOCK
      ?auto_372815 - BLOCK
    )
    :vars
    (
      ?auto_372816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372815 ?auto_372816 ) ( ON-TABLE ?auto_372805 ) ( ON ?auto_372806 ?auto_372805 ) ( ON ?auto_372807 ?auto_372806 ) ( ON ?auto_372808 ?auto_372807 ) ( ON ?auto_372809 ?auto_372808 ) ( ON ?auto_372810 ?auto_372809 ) ( ON ?auto_372811 ?auto_372810 ) ( ON ?auto_372812 ?auto_372811 ) ( not ( = ?auto_372805 ?auto_372806 ) ) ( not ( = ?auto_372805 ?auto_372807 ) ) ( not ( = ?auto_372805 ?auto_372808 ) ) ( not ( = ?auto_372805 ?auto_372809 ) ) ( not ( = ?auto_372805 ?auto_372810 ) ) ( not ( = ?auto_372805 ?auto_372811 ) ) ( not ( = ?auto_372805 ?auto_372812 ) ) ( not ( = ?auto_372805 ?auto_372813 ) ) ( not ( = ?auto_372805 ?auto_372814 ) ) ( not ( = ?auto_372805 ?auto_372815 ) ) ( not ( = ?auto_372805 ?auto_372816 ) ) ( not ( = ?auto_372806 ?auto_372807 ) ) ( not ( = ?auto_372806 ?auto_372808 ) ) ( not ( = ?auto_372806 ?auto_372809 ) ) ( not ( = ?auto_372806 ?auto_372810 ) ) ( not ( = ?auto_372806 ?auto_372811 ) ) ( not ( = ?auto_372806 ?auto_372812 ) ) ( not ( = ?auto_372806 ?auto_372813 ) ) ( not ( = ?auto_372806 ?auto_372814 ) ) ( not ( = ?auto_372806 ?auto_372815 ) ) ( not ( = ?auto_372806 ?auto_372816 ) ) ( not ( = ?auto_372807 ?auto_372808 ) ) ( not ( = ?auto_372807 ?auto_372809 ) ) ( not ( = ?auto_372807 ?auto_372810 ) ) ( not ( = ?auto_372807 ?auto_372811 ) ) ( not ( = ?auto_372807 ?auto_372812 ) ) ( not ( = ?auto_372807 ?auto_372813 ) ) ( not ( = ?auto_372807 ?auto_372814 ) ) ( not ( = ?auto_372807 ?auto_372815 ) ) ( not ( = ?auto_372807 ?auto_372816 ) ) ( not ( = ?auto_372808 ?auto_372809 ) ) ( not ( = ?auto_372808 ?auto_372810 ) ) ( not ( = ?auto_372808 ?auto_372811 ) ) ( not ( = ?auto_372808 ?auto_372812 ) ) ( not ( = ?auto_372808 ?auto_372813 ) ) ( not ( = ?auto_372808 ?auto_372814 ) ) ( not ( = ?auto_372808 ?auto_372815 ) ) ( not ( = ?auto_372808 ?auto_372816 ) ) ( not ( = ?auto_372809 ?auto_372810 ) ) ( not ( = ?auto_372809 ?auto_372811 ) ) ( not ( = ?auto_372809 ?auto_372812 ) ) ( not ( = ?auto_372809 ?auto_372813 ) ) ( not ( = ?auto_372809 ?auto_372814 ) ) ( not ( = ?auto_372809 ?auto_372815 ) ) ( not ( = ?auto_372809 ?auto_372816 ) ) ( not ( = ?auto_372810 ?auto_372811 ) ) ( not ( = ?auto_372810 ?auto_372812 ) ) ( not ( = ?auto_372810 ?auto_372813 ) ) ( not ( = ?auto_372810 ?auto_372814 ) ) ( not ( = ?auto_372810 ?auto_372815 ) ) ( not ( = ?auto_372810 ?auto_372816 ) ) ( not ( = ?auto_372811 ?auto_372812 ) ) ( not ( = ?auto_372811 ?auto_372813 ) ) ( not ( = ?auto_372811 ?auto_372814 ) ) ( not ( = ?auto_372811 ?auto_372815 ) ) ( not ( = ?auto_372811 ?auto_372816 ) ) ( not ( = ?auto_372812 ?auto_372813 ) ) ( not ( = ?auto_372812 ?auto_372814 ) ) ( not ( = ?auto_372812 ?auto_372815 ) ) ( not ( = ?auto_372812 ?auto_372816 ) ) ( not ( = ?auto_372813 ?auto_372814 ) ) ( not ( = ?auto_372813 ?auto_372815 ) ) ( not ( = ?auto_372813 ?auto_372816 ) ) ( not ( = ?auto_372814 ?auto_372815 ) ) ( not ( = ?auto_372814 ?auto_372816 ) ) ( not ( = ?auto_372815 ?auto_372816 ) ) ( ON ?auto_372814 ?auto_372815 ) ( CLEAR ?auto_372812 ) ( ON ?auto_372813 ?auto_372814 ) ( CLEAR ?auto_372813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_372805 ?auto_372806 ?auto_372807 ?auto_372808 ?auto_372809 ?auto_372810 ?auto_372811 ?auto_372812 ?auto_372813 )
      ( MAKE-11PILE ?auto_372805 ?auto_372806 ?auto_372807 ?auto_372808 ?auto_372809 ?auto_372810 ?auto_372811 ?auto_372812 ?auto_372813 ?auto_372814 ?auto_372815 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372828 - BLOCK
      ?auto_372829 - BLOCK
      ?auto_372830 - BLOCK
      ?auto_372831 - BLOCK
      ?auto_372832 - BLOCK
      ?auto_372833 - BLOCK
      ?auto_372834 - BLOCK
      ?auto_372835 - BLOCK
      ?auto_372836 - BLOCK
      ?auto_372837 - BLOCK
      ?auto_372838 - BLOCK
    )
    :vars
    (
      ?auto_372839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372838 ?auto_372839 ) ( ON-TABLE ?auto_372828 ) ( ON ?auto_372829 ?auto_372828 ) ( ON ?auto_372830 ?auto_372829 ) ( ON ?auto_372831 ?auto_372830 ) ( ON ?auto_372832 ?auto_372831 ) ( ON ?auto_372833 ?auto_372832 ) ( ON ?auto_372834 ?auto_372833 ) ( ON ?auto_372835 ?auto_372834 ) ( not ( = ?auto_372828 ?auto_372829 ) ) ( not ( = ?auto_372828 ?auto_372830 ) ) ( not ( = ?auto_372828 ?auto_372831 ) ) ( not ( = ?auto_372828 ?auto_372832 ) ) ( not ( = ?auto_372828 ?auto_372833 ) ) ( not ( = ?auto_372828 ?auto_372834 ) ) ( not ( = ?auto_372828 ?auto_372835 ) ) ( not ( = ?auto_372828 ?auto_372836 ) ) ( not ( = ?auto_372828 ?auto_372837 ) ) ( not ( = ?auto_372828 ?auto_372838 ) ) ( not ( = ?auto_372828 ?auto_372839 ) ) ( not ( = ?auto_372829 ?auto_372830 ) ) ( not ( = ?auto_372829 ?auto_372831 ) ) ( not ( = ?auto_372829 ?auto_372832 ) ) ( not ( = ?auto_372829 ?auto_372833 ) ) ( not ( = ?auto_372829 ?auto_372834 ) ) ( not ( = ?auto_372829 ?auto_372835 ) ) ( not ( = ?auto_372829 ?auto_372836 ) ) ( not ( = ?auto_372829 ?auto_372837 ) ) ( not ( = ?auto_372829 ?auto_372838 ) ) ( not ( = ?auto_372829 ?auto_372839 ) ) ( not ( = ?auto_372830 ?auto_372831 ) ) ( not ( = ?auto_372830 ?auto_372832 ) ) ( not ( = ?auto_372830 ?auto_372833 ) ) ( not ( = ?auto_372830 ?auto_372834 ) ) ( not ( = ?auto_372830 ?auto_372835 ) ) ( not ( = ?auto_372830 ?auto_372836 ) ) ( not ( = ?auto_372830 ?auto_372837 ) ) ( not ( = ?auto_372830 ?auto_372838 ) ) ( not ( = ?auto_372830 ?auto_372839 ) ) ( not ( = ?auto_372831 ?auto_372832 ) ) ( not ( = ?auto_372831 ?auto_372833 ) ) ( not ( = ?auto_372831 ?auto_372834 ) ) ( not ( = ?auto_372831 ?auto_372835 ) ) ( not ( = ?auto_372831 ?auto_372836 ) ) ( not ( = ?auto_372831 ?auto_372837 ) ) ( not ( = ?auto_372831 ?auto_372838 ) ) ( not ( = ?auto_372831 ?auto_372839 ) ) ( not ( = ?auto_372832 ?auto_372833 ) ) ( not ( = ?auto_372832 ?auto_372834 ) ) ( not ( = ?auto_372832 ?auto_372835 ) ) ( not ( = ?auto_372832 ?auto_372836 ) ) ( not ( = ?auto_372832 ?auto_372837 ) ) ( not ( = ?auto_372832 ?auto_372838 ) ) ( not ( = ?auto_372832 ?auto_372839 ) ) ( not ( = ?auto_372833 ?auto_372834 ) ) ( not ( = ?auto_372833 ?auto_372835 ) ) ( not ( = ?auto_372833 ?auto_372836 ) ) ( not ( = ?auto_372833 ?auto_372837 ) ) ( not ( = ?auto_372833 ?auto_372838 ) ) ( not ( = ?auto_372833 ?auto_372839 ) ) ( not ( = ?auto_372834 ?auto_372835 ) ) ( not ( = ?auto_372834 ?auto_372836 ) ) ( not ( = ?auto_372834 ?auto_372837 ) ) ( not ( = ?auto_372834 ?auto_372838 ) ) ( not ( = ?auto_372834 ?auto_372839 ) ) ( not ( = ?auto_372835 ?auto_372836 ) ) ( not ( = ?auto_372835 ?auto_372837 ) ) ( not ( = ?auto_372835 ?auto_372838 ) ) ( not ( = ?auto_372835 ?auto_372839 ) ) ( not ( = ?auto_372836 ?auto_372837 ) ) ( not ( = ?auto_372836 ?auto_372838 ) ) ( not ( = ?auto_372836 ?auto_372839 ) ) ( not ( = ?auto_372837 ?auto_372838 ) ) ( not ( = ?auto_372837 ?auto_372839 ) ) ( not ( = ?auto_372838 ?auto_372839 ) ) ( ON ?auto_372837 ?auto_372838 ) ( CLEAR ?auto_372835 ) ( ON ?auto_372836 ?auto_372837 ) ( CLEAR ?auto_372836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_372828 ?auto_372829 ?auto_372830 ?auto_372831 ?auto_372832 ?auto_372833 ?auto_372834 ?auto_372835 ?auto_372836 )
      ( MAKE-11PILE ?auto_372828 ?auto_372829 ?auto_372830 ?auto_372831 ?auto_372832 ?auto_372833 ?auto_372834 ?auto_372835 ?auto_372836 ?auto_372837 ?auto_372838 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372851 - BLOCK
      ?auto_372852 - BLOCK
      ?auto_372853 - BLOCK
      ?auto_372854 - BLOCK
      ?auto_372855 - BLOCK
      ?auto_372856 - BLOCK
      ?auto_372857 - BLOCK
      ?auto_372858 - BLOCK
      ?auto_372859 - BLOCK
      ?auto_372860 - BLOCK
      ?auto_372861 - BLOCK
    )
    :vars
    (
      ?auto_372862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372861 ?auto_372862 ) ( ON-TABLE ?auto_372851 ) ( ON ?auto_372852 ?auto_372851 ) ( ON ?auto_372853 ?auto_372852 ) ( ON ?auto_372854 ?auto_372853 ) ( ON ?auto_372855 ?auto_372854 ) ( ON ?auto_372856 ?auto_372855 ) ( ON ?auto_372857 ?auto_372856 ) ( not ( = ?auto_372851 ?auto_372852 ) ) ( not ( = ?auto_372851 ?auto_372853 ) ) ( not ( = ?auto_372851 ?auto_372854 ) ) ( not ( = ?auto_372851 ?auto_372855 ) ) ( not ( = ?auto_372851 ?auto_372856 ) ) ( not ( = ?auto_372851 ?auto_372857 ) ) ( not ( = ?auto_372851 ?auto_372858 ) ) ( not ( = ?auto_372851 ?auto_372859 ) ) ( not ( = ?auto_372851 ?auto_372860 ) ) ( not ( = ?auto_372851 ?auto_372861 ) ) ( not ( = ?auto_372851 ?auto_372862 ) ) ( not ( = ?auto_372852 ?auto_372853 ) ) ( not ( = ?auto_372852 ?auto_372854 ) ) ( not ( = ?auto_372852 ?auto_372855 ) ) ( not ( = ?auto_372852 ?auto_372856 ) ) ( not ( = ?auto_372852 ?auto_372857 ) ) ( not ( = ?auto_372852 ?auto_372858 ) ) ( not ( = ?auto_372852 ?auto_372859 ) ) ( not ( = ?auto_372852 ?auto_372860 ) ) ( not ( = ?auto_372852 ?auto_372861 ) ) ( not ( = ?auto_372852 ?auto_372862 ) ) ( not ( = ?auto_372853 ?auto_372854 ) ) ( not ( = ?auto_372853 ?auto_372855 ) ) ( not ( = ?auto_372853 ?auto_372856 ) ) ( not ( = ?auto_372853 ?auto_372857 ) ) ( not ( = ?auto_372853 ?auto_372858 ) ) ( not ( = ?auto_372853 ?auto_372859 ) ) ( not ( = ?auto_372853 ?auto_372860 ) ) ( not ( = ?auto_372853 ?auto_372861 ) ) ( not ( = ?auto_372853 ?auto_372862 ) ) ( not ( = ?auto_372854 ?auto_372855 ) ) ( not ( = ?auto_372854 ?auto_372856 ) ) ( not ( = ?auto_372854 ?auto_372857 ) ) ( not ( = ?auto_372854 ?auto_372858 ) ) ( not ( = ?auto_372854 ?auto_372859 ) ) ( not ( = ?auto_372854 ?auto_372860 ) ) ( not ( = ?auto_372854 ?auto_372861 ) ) ( not ( = ?auto_372854 ?auto_372862 ) ) ( not ( = ?auto_372855 ?auto_372856 ) ) ( not ( = ?auto_372855 ?auto_372857 ) ) ( not ( = ?auto_372855 ?auto_372858 ) ) ( not ( = ?auto_372855 ?auto_372859 ) ) ( not ( = ?auto_372855 ?auto_372860 ) ) ( not ( = ?auto_372855 ?auto_372861 ) ) ( not ( = ?auto_372855 ?auto_372862 ) ) ( not ( = ?auto_372856 ?auto_372857 ) ) ( not ( = ?auto_372856 ?auto_372858 ) ) ( not ( = ?auto_372856 ?auto_372859 ) ) ( not ( = ?auto_372856 ?auto_372860 ) ) ( not ( = ?auto_372856 ?auto_372861 ) ) ( not ( = ?auto_372856 ?auto_372862 ) ) ( not ( = ?auto_372857 ?auto_372858 ) ) ( not ( = ?auto_372857 ?auto_372859 ) ) ( not ( = ?auto_372857 ?auto_372860 ) ) ( not ( = ?auto_372857 ?auto_372861 ) ) ( not ( = ?auto_372857 ?auto_372862 ) ) ( not ( = ?auto_372858 ?auto_372859 ) ) ( not ( = ?auto_372858 ?auto_372860 ) ) ( not ( = ?auto_372858 ?auto_372861 ) ) ( not ( = ?auto_372858 ?auto_372862 ) ) ( not ( = ?auto_372859 ?auto_372860 ) ) ( not ( = ?auto_372859 ?auto_372861 ) ) ( not ( = ?auto_372859 ?auto_372862 ) ) ( not ( = ?auto_372860 ?auto_372861 ) ) ( not ( = ?auto_372860 ?auto_372862 ) ) ( not ( = ?auto_372861 ?auto_372862 ) ) ( ON ?auto_372860 ?auto_372861 ) ( ON ?auto_372859 ?auto_372860 ) ( CLEAR ?auto_372857 ) ( ON ?auto_372858 ?auto_372859 ) ( CLEAR ?auto_372858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_372851 ?auto_372852 ?auto_372853 ?auto_372854 ?auto_372855 ?auto_372856 ?auto_372857 ?auto_372858 )
      ( MAKE-11PILE ?auto_372851 ?auto_372852 ?auto_372853 ?auto_372854 ?auto_372855 ?auto_372856 ?auto_372857 ?auto_372858 ?auto_372859 ?auto_372860 ?auto_372861 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372874 - BLOCK
      ?auto_372875 - BLOCK
      ?auto_372876 - BLOCK
      ?auto_372877 - BLOCK
      ?auto_372878 - BLOCK
      ?auto_372879 - BLOCK
      ?auto_372880 - BLOCK
      ?auto_372881 - BLOCK
      ?auto_372882 - BLOCK
      ?auto_372883 - BLOCK
      ?auto_372884 - BLOCK
    )
    :vars
    (
      ?auto_372885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372884 ?auto_372885 ) ( ON-TABLE ?auto_372874 ) ( ON ?auto_372875 ?auto_372874 ) ( ON ?auto_372876 ?auto_372875 ) ( ON ?auto_372877 ?auto_372876 ) ( ON ?auto_372878 ?auto_372877 ) ( ON ?auto_372879 ?auto_372878 ) ( ON ?auto_372880 ?auto_372879 ) ( not ( = ?auto_372874 ?auto_372875 ) ) ( not ( = ?auto_372874 ?auto_372876 ) ) ( not ( = ?auto_372874 ?auto_372877 ) ) ( not ( = ?auto_372874 ?auto_372878 ) ) ( not ( = ?auto_372874 ?auto_372879 ) ) ( not ( = ?auto_372874 ?auto_372880 ) ) ( not ( = ?auto_372874 ?auto_372881 ) ) ( not ( = ?auto_372874 ?auto_372882 ) ) ( not ( = ?auto_372874 ?auto_372883 ) ) ( not ( = ?auto_372874 ?auto_372884 ) ) ( not ( = ?auto_372874 ?auto_372885 ) ) ( not ( = ?auto_372875 ?auto_372876 ) ) ( not ( = ?auto_372875 ?auto_372877 ) ) ( not ( = ?auto_372875 ?auto_372878 ) ) ( not ( = ?auto_372875 ?auto_372879 ) ) ( not ( = ?auto_372875 ?auto_372880 ) ) ( not ( = ?auto_372875 ?auto_372881 ) ) ( not ( = ?auto_372875 ?auto_372882 ) ) ( not ( = ?auto_372875 ?auto_372883 ) ) ( not ( = ?auto_372875 ?auto_372884 ) ) ( not ( = ?auto_372875 ?auto_372885 ) ) ( not ( = ?auto_372876 ?auto_372877 ) ) ( not ( = ?auto_372876 ?auto_372878 ) ) ( not ( = ?auto_372876 ?auto_372879 ) ) ( not ( = ?auto_372876 ?auto_372880 ) ) ( not ( = ?auto_372876 ?auto_372881 ) ) ( not ( = ?auto_372876 ?auto_372882 ) ) ( not ( = ?auto_372876 ?auto_372883 ) ) ( not ( = ?auto_372876 ?auto_372884 ) ) ( not ( = ?auto_372876 ?auto_372885 ) ) ( not ( = ?auto_372877 ?auto_372878 ) ) ( not ( = ?auto_372877 ?auto_372879 ) ) ( not ( = ?auto_372877 ?auto_372880 ) ) ( not ( = ?auto_372877 ?auto_372881 ) ) ( not ( = ?auto_372877 ?auto_372882 ) ) ( not ( = ?auto_372877 ?auto_372883 ) ) ( not ( = ?auto_372877 ?auto_372884 ) ) ( not ( = ?auto_372877 ?auto_372885 ) ) ( not ( = ?auto_372878 ?auto_372879 ) ) ( not ( = ?auto_372878 ?auto_372880 ) ) ( not ( = ?auto_372878 ?auto_372881 ) ) ( not ( = ?auto_372878 ?auto_372882 ) ) ( not ( = ?auto_372878 ?auto_372883 ) ) ( not ( = ?auto_372878 ?auto_372884 ) ) ( not ( = ?auto_372878 ?auto_372885 ) ) ( not ( = ?auto_372879 ?auto_372880 ) ) ( not ( = ?auto_372879 ?auto_372881 ) ) ( not ( = ?auto_372879 ?auto_372882 ) ) ( not ( = ?auto_372879 ?auto_372883 ) ) ( not ( = ?auto_372879 ?auto_372884 ) ) ( not ( = ?auto_372879 ?auto_372885 ) ) ( not ( = ?auto_372880 ?auto_372881 ) ) ( not ( = ?auto_372880 ?auto_372882 ) ) ( not ( = ?auto_372880 ?auto_372883 ) ) ( not ( = ?auto_372880 ?auto_372884 ) ) ( not ( = ?auto_372880 ?auto_372885 ) ) ( not ( = ?auto_372881 ?auto_372882 ) ) ( not ( = ?auto_372881 ?auto_372883 ) ) ( not ( = ?auto_372881 ?auto_372884 ) ) ( not ( = ?auto_372881 ?auto_372885 ) ) ( not ( = ?auto_372882 ?auto_372883 ) ) ( not ( = ?auto_372882 ?auto_372884 ) ) ( not ( = ?auto_372882 ?auto_372885 ) ) ( not ( = ?auto_372883 ?auto_372884 ) ) ( not ( = ?auto_372883 ?auto_372885 ) ) ( not ( = ?auto_372884 ?auto_372885 ) ) ( ON ?auto_372883 ?auto_372884 ) ( ON ?auto_372882 ?auto_372883 ) ( CLEAR ?auto_372880 ) ( ON ?auto_372881 ?auto_372882 ) ( CLEAR ?auto_372881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_372874 ?auto_372875 ?auto_372876 ?auto_372877 ?auto_372878 ?auto_372879 ?auto_372880 ?auto_372881 )
      ( MAKE-11PILE ?auto_372874 ?auto_372875 ?auto_372876 ?auto_372877 ?auto_372878 ?auto_372879 ?auto_372880 ?auto_372881 ?auto_372882 ?auto_372883 ?auto_372884 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372897 - BLOCK
      ?auto_372898 - BLOCK
      ?auto_372899 - BLOCK
      ?auto_372900 - BLOCK
      ?auto_372901 - BLOCK
      ?auto_372902 - BLOCK
      ?auto_372903 - BLOCK
      ?auto_372904 - BLOCK
      ?auto_372905 - BLOCK
      ?auto_372906 - BLOCK
      ?auto_372907 - BLOCK
    )
    :vars
    (
      ?auto_372908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372907 ?auto_372908 ) ( ON-TABLE ?auto_372897 ) ( ON ?auto_372898 ?auto_372897 ) ( ON ?auto_372899 ?auto_372898 ) ( ON ?auto_372900 ?auto_372899 ) ( ON ?auto_372901 ?auto_372900 ) ( ON ?auto_372902 ?auto_372901 ) ( not ( = ?auto_372897 ?auto_372898 ) ) ( not ( = ?auto_372897 ?auto_372899 ) ) ( not ( = ?auto_372897 ?auto_372900 ) ) ( not ( = ?auto_372897 ?auto_372901 ) ) ( not ( = ?auto_372897 ?auto_372902 ) ) ( not ( = ?auto_372897 ?auto_372903 ) ) ( not ( = ?auto_372897 ?auto_372904 ) ) ( not ( = ?auto_372897 ?auto_372905 ) ) ( not ( = ?auto_372897 ?auto_372906 ) ) ( not ( = ?auto_372897 ?auto_372907 ) ) ( not ( = ?auto_372897 ?auto_372908 ) ) ( not ( = ?auto_372898 ?auto_372899 ) ) ( not ( = ?auto_372898 ?auto_372900 ) ) ( not ( = ?auto_372898 ?auto_372901 ) ) ( not ( = ?auto_372898 ?auto_372902 ) ) ( not ( = ?auto_372898 ?auto_372903 ) ) ( not ( = ?auto_372898 ?auto_372904 ) ) ( not ( = ?auto_372898 ?auto_372905 ) ) ( not ( = ?auto_372898 ?auto_372906 ) ) ( not ( = ?auto_372898 ?auto_372907 ) ) ( not ( = ?auto_372898 ?auto_372908 ) ) ( not ( = ?auto_372899 ?auto_372900 ) ) ( not ( = ?auto_372899 ?auto_372901 ) ) ( not ( = ?auto_372899 ?auto_372902 ) ) ( not ( = ?auto_372899 ?auto_372903 ) ) ( not ( = ?auto_372899 ?auto_372904 ) ) ( not ( = ?auto_372899 ?auto_372905 ) ) ( not ( = ?auto_372899 ?auto_372906 ) ) ( not ( = ?auto_372899 ?auto_372907 ) ) ( not ( = ?auto_372899 ?auto_372908 ) ) ( not ( = ?auto_372900 ?auto_372901 ) ) ( not ( = ?auto_372900 ?auto_372902 ) ) ( not ( = ?auto_372900 ?auto_372903 ) ) ( not ( = ?auto_372900 ?auto_372904 ) ) ( not ( = ?auto_372900 ?auto_372905 ) ) ( not ( = ?auto_372900 ?auto_372906 ) ) ( not ( = ?auto_372900 ?auto_372907 ) ) ( not ( = ?auto_372900 ?auto_372908 ) ) ( not ( = ?auto_372901 ?auto_372902 ) ) ( not ( = ?auto_372901 ?auto_372903 ) ) ( not ( = ?auto_372901 ?auto_372904 ) ) ( not ( = ?auto_372901 ?auto_372905 ) ) ( not ( = ?auto_372901 ?auto_372906 ) ) ( not ( = ?auto_372901 ?auto_372907 ) ) ( not ( = ?auto_372901 ?auto_372908 ) ) ( not ( = ?auto_372902 ?auto_372903 ) ) ( not ( = ?auto_372902 ?auto_372904 ) ) ( not ( = ?auto_372902 ?auto_372905 ) ) ( not ( = ?auto_372902 ?auto_372906 ) ) ( not ( = ?auto_372902 ?auto_372907 ) ) ( not ( = ?auto_372902 ?auto_372908 ) ) ( not ( = ?auto_372903 ?auto_372904 ) ) ( not ( = ?auto_372903 ?auto_372905 ) ) ( not ( = ?auto_372903 ?auto_372906 ) ) ( not ( = ?auto_372903 ?auto_372907 ) ) ( not ( = ?auto_372903 ?auto_372908 ) ) ( not ( = ?auto_372904 ?auto_372905 ) ) ( not ( = ?auto_372904 ?auto_372906 ) ) ( not ( = ?auto_372904 ?auto_372907 ) ) ( not ( = ?auto_372904 ?auto_372908 ) ) ( not ( = ?auto_372905 ?auto_372906 ) ) ( not ( = ?auto_372905 ?auto_372907 ) ) ( not ( = ?auto_372905 ?auto_372908 ) ) ( not ( = ?auto_372906 ?auto_372907 ) ) ( not ( = ?auto_372906 ?auto_372908 ) ) ( not ( = ?auto_372907 ?auto_372908 ) ) ( ON ?auto_372906 ?auto_372907 ) ( ON ?auto_372905 ?auto_372906 ) ( ON ?auto_372904 ?auto_372905 ) ( CLEAR ?auto_372902 ) ( ON ?auto_372903 ?auto_372904 ) ( CLEAR ?auto_372903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_372897 ?auto_372898 ?auto_372899 ?auto_372900 ?auto_372901 ?auto_372902 ?auto_372903 )
      ( MAKE-11PILE ?auto_372897 ?auto_372898 ?auto_372899 ?auto_372900 ?auto_372901 ?auto_372902 ?auto_372903 ?auto_372904 ?auto_372905 ?auto_372906 ?auto_372907 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372920 - BLOCK
      ?auto_372921 - BLOCK
      ?auto_372922 - BLOCK
      ?auto_372923 - BLOCK
      ?auto_372924 - BLOCK
      ?auto_372925 - BLOCK
      ?auto_372926 - BLOCK
      ?auto_372927 - BLOCK
      ?auto_372928 - BLOCK
      ?auto_372929 - BLOCK
      ?auto_372930 - BLOCK
    )
    :vars
    (
      ?auto_372931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372930 ?auto_372931 ) ( ON-TABLE ?auto_372920 ) ( ON ?auto_372921 ?auto_372920 ) ( ON ?auto_372922 ?auto_372921 ) ( ON ?auto_372923 ?auto_372922 ) ( ON ?auto_372924 ?auto_372923 ) ( ON ?auto_372925 ?auto_372924 ) ( not ( = ?auto_372920 ?auto_372921 ) ) ( not ( = ?auto_372920 ?auto_372922 ) ) ( not ( = ?auto_372920 ?auto_372923 ) ) ( not ( = ?auto_372920 ?auto_372924 ) ) ( not ( = ?auto_372920 ?auto_372925 ) ) ( not ( = ?auto_372920 ?auto_372926 ) ) ( not ( = ?auto_372920 ?auto_372927 ) ) ( not ( = ?auto_372920 ?auto_372928 ) ) ( not ( = ?auto_372920 ?auto_372929 ) ) ( not ( = ?auto_372920 ?auto_372930 ) ) ( not ( = ?auto_372920 ?auto_372931 ) ) ( not ( = ?auto_372921 ?auto_372922 ) ) ( not ( = ?auto_372921 ?auto_372923 ) ) ( not ( = ?auto_372921 ?auto_372924 ) ) ( not ( = ?auto_372921 ?auto_372925 ) ) ( not ( = ?auto_372921 ?auto_372926 ) ) ( not ( = ?auto_372921 ?auto_372927 ) ) ( not ( = ?auto_372921 ?auto_372928 ) ) ( not ( = ?auto_372921 ?auto_372929 ) ) ( not ( = ?auto_372921 ?auto_372930 ) ) ( not ( = ?auto_372921 ?auto_372931 ) ) ( not ( = ?auto_372922 ?auto_372923 ) ) ( not ( = ?auto_372922 ?auto_372924 ) ) ( not ( = ?auto_372922 ?auto_372925 ) ) ( not ( = ?auto_372922 ?auto_372926 ) ) ( not ( = ?auto_372922 ?auto_372927 ) ) ( not ( = ?auto_372922 ?auto_372928 ) ) ( not ( = ?auto_372922 ?auto_372929 ) ) ( not ( = ?auto_372922 ?auto_372930 ) ) ( not ( = ?auto_372922 ?auto_372931 ) ) ( not ( = ?auto_372923 ?auto_372924 ) ) ( not ( = ?auto_372923 ?auto_372925 ) ) ( not ( = ?auto_372923 ?auto_372926 ) ) ( not ( = ?auto_372923 ?auto_372927 ) ) ( not ( = ?auto_372923 ?auto_372928 ) ) ( not ( = ?auto_372923 ?auto_372929 ) ) ( not ( = ?auto_372923 ?auto_372930 ) ) ( not ( = ?auto_372923 ?auto_372931 ) ) ( not ( = ?auto_372924 ?auto_372925 ) ) ( not ( = ?auto_372924 ?auto_372926 ) ) ( not ( = ?auto_372924 ?auto_372927 ) ) ( not ( = ?auto_372924 ?auto_372928 ) ) ( not ( = ?auto_372924 ?auto_372929 ) ) ( not ( = ?auto_372924 ?auto_372930 ) ) ( not ( = ?auto_372924 ?auto_372931 ) ) ( not ( = ?auto_372925 ?auto_372926 ) ) ( not ( = ?auto_372925 ?auto_372927 ) ) ( not ( = ?auto_372925 ?auto_372928 ) ) ( not ( = ?auto_372925 ?auto_372929 ) ) ( not ( = ?auto_372925 ?auto_372930 ) ) ( not ( = ?auto_372925 ?auto_372931 ) ) ( not ( = ?auto_372926 ?auto_372927 ) ) ( not ( = ?auto_372926 ?auto_372928 ) ) ( not ( = ?auto_372926 ?auto_372929 ) ) ( not ( = ?auto_372926 ?auto_372930 ) ) ( not ( = ?auto_372926 ?auto_372931 ) ) ( not ( = ?auto_372927 ?auto_372928 ) ) ( not ( = ?auto_372927 ?auto_372929 ) ) ( not ( = ?auto_372927 ?auto_372930 ) ) ( not ( = ?auto_372927 ?auto_372931 ) ) ( not ( = ?auto_372928 ?auto_372929 ) ) ( not ( = ?auto_372928 ?auto_372930 ) ) ( not ( = ?auto_372928 ?auto_372931 ) ) ( not ( = ?auto_372929 ?auto_372930 ) ) ( not ( = ?auto_372929 ?auto_372931 ) ) ( not ( = ?auto_372930 ?auto_372931 ) ) ( ON ?auto_372929 ?auto_372930 ) ( ON ?auto_372928 ?auto_372929 ) ( ON ?auto_372927 ?auto_372928 ) ( CLEAR ?auto_372925 ) ( ON ?auto_372926 ?auto_372927 ) ( CLEAR ?auto_372926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_372920 ?auto_372921 ?auto_372922 ?auto_372923 ?auto_372924 ?auto_372925 ?auto_372926 )
      ( MAKE-11PILE ?auto_372920 ?auto_372921 ?auto_372922 ?auto_372923 ?auto_372924 ?auto_372925 ?auto_372926 ?auto_372927 ?auto_372928 ?auto_372929 ?auto_372930 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372943 - BLOCK
      ?auto_372944 - BLOCK
      ?auto_372945 - BLOCK
      ?auto_372946 - BLOCK
      ?auto_372947 - BLOCK
      ?auto_372948 - BLOCK
      ?auto_372949 - BLOCK
      ?auto_372950 - BLOCK
      ?auto_372951 - BLOCK
      ?auto_372952 - BLOCK
      ?auto_372953 - BLOCK
    )
    :vars
    (
      ?auto_372954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372953 ?auto_372954 ) ( ON-TABLE ?auto_372943 ) ( ON ?auto_372944 ?auto_372943 ) ( ON ?auto_372945 ?auto_372944 ) ( ON ?auto_372946 ?auto_372945 ) ( ON ?auto_372947 ?auto_372946 ) ( not ( = ?auto_372943 ?auto_372944 ) ) ( not ( = ?auto_372943 ?auto_372945 ) ) ( not ( = ?auto_372943 ?auto_372946 ) ) ( not ( = ?auto_372943 ?auto_372947 ) ) ( not ( = ?auto_372943 ?auto_372948 ) ) ( not ( = ?auto_372943 ?auto_372949 ) ) ( not ( = ?auto_372943 ?auto_372950 ) ) ( not ( = ?auto_372943 ?auto_372951 ) ) ( not ( = ?auto_372943 ?auto_372952 ) ) ( not ( = ?auto_372943 ?auto_372953 ) ) ( not ( = ?auto_372943 ?auto_372954 ) ) ( not ( = ?auto_372944 ?auto_372945 ) ) ( not ( = ?auto_372944 ?auto_372946 ) ) ( not ( = ?auto_372944 ?auto_372947 ) ) ( not ( = ?auto_372944 ?auto_372948 ) ) ( not ( = ?auto_372944 ?auto_372949 ) ) ( not ( = ?auto_372944 ?auto_372950 ) ) ( not ( = ?auto_372944 ?auto_372951 ) ) ( not ( = ?auto_372944 ?auto_372952 ) ) ( not ( = ?auto_372944 ?auto_372953 ) ) ( not ( = ?auto_372944 ?auto_372954 ) ) ( not ( = ?auto_372945 ?auto_372946 ) ) ( not ( = ?auto_372945 ?auto_372947 ) ) ( not ( = ?auto_372945 ?auto_372948 ) ) ( not ( = ?auto_372945 ?auto_372949 ) ) ( not ( = ?auto_372945 ?auto_372950 ) ) ( not ( = ?auto_372945 ?auto_372951 ) ) ( not ( = ?auto_372945 ?auto_372952 ) ) ( not ( = ?auto_372945 ?auto_372953 ) ) ( not ( = ?auto_372945 ?auto_372954 ) ) ( not ( = ?auto_372946 ?auto_372947 ) ) ( not ( = ?auto_372946 ?auto_372948 ) ) ( not ( = ?auto_372946 ?auto_372949 ) ) ( not ( = ?auto_372946 ?auto_372950 ) ) ( not ( = ?auto_372946 ?auto_372951 ) ) ( not ( = ?auto_372946 ?auto_372952 ) ) ( not ( = ?auto_372946 ?auto_372953 ) ) ( not ( = ?auto_372946 ?auto_372954 ) ) ( not ( = ?auto_372947 ?auto_372948 ) ) ( not ( = ?auto_372947 ?auto_372949 ) ) ( not ( = ?auto_372947 ?auto_372950 ) ) ( not ( = ?auto_372947 ?auto_372951 ) ) ( not ( = ?auto_372947 ?auto_372952 ) ) ( not ( = ?auto_372947 ?auto_372953 ) ) ( not ( = ?auto_372947 ?auto_372954 ) ) ( not ( = ?auto_372948 ?auto_372949 ) ) ( not ( = ?auto_372948 ?auto_372950 ) ) ( not ( = ?auto_372948 ?auto_372951 ) ) ( not ( = ?auto_372948 ?auto_372952 ) ) ( not ( = ?auto_372948 ?auto_372953 ) ) ( not ( = ?auto_372948 ?auto_372954 ) ) ( not ( = ?auto_372949 ?auto_372950 ) ) ( not ( = ?auto_372949 ?auto_372951 ) ) ( not ( = ?auto_372949 ?auto_372952 ) ) ( not ( = ?auto_372949 ?auto_372953 ) ) ( not ( = ?auto_372949 ?auto_372954 ) ) ( not ( = ?auto_372950 ?auto_372951 ) ) ( not ( = ?auto_372950 ?auto_372952 ) ) ( not ( = ?auto_372950 ?auto_372953 ) ) ( not ( = ?auto_372950 ?auto_372954 ) ) ( not ( = ?auto_372951 ?auto_372952 ) ) ( not ( = ?auto_372951 ?auto_372953 ) ) ( not ( = ?auto_372951 ?auto_372954 ) ) ( not ( = ?auto_372952 ?auto_372953 ) ) ( not ( = ?auto_372952 ?auto_372954 ) ) ( not ( = ?auto_372953 ?auto_372954 ) ) ( ON ?auto_372952 ?auto_372953 ) ( ON ?auto_372951 ?auto_372952 ) ( ON ?auto_372950 ?auto_372951 ) ( ON ?auto_372949 ?auto_372950 ) ( CLEAR ?auto_372947 ) ( ON ?auto_372948 ?auto_372949 ) ( CLEAR ?auto_372948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_372943 ?auto_372944 ?auto_372945 ?auto_372946 ?auto_372947 ?auto_372948 )
      ( MAKE-11PILE ?auto_372943 ?auto_372944 ?auto_372945 ?auto_372946 ?auto_372947 ?auto_372948 ?auto_372949 ?auto_372950 ?auto_372951 ?auto_372952 ?auto_372953 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372966 - BLOCK
      ?auto_372967 - BLOCK
      ?auto_372968 - BLOCK
      ?auto_372969 - BLOCK
      ?auto_372970 - BLOCK
      ?auto_372971 - BLOCK
      ?auto_372972 - BLOCK
      ?auto_372973 - BLOCK
      ?auto_372974 - BLOCK
      ?auto_372975 - BLOCK
      ?auto_372976 - BLOCK
    )
    :vars
    (
      ?auto_372977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372976 ?auto_372977 ) ( ON-TABLE ?auto_372966 ) ( ON ?auto_372967 ?auto_372966 ) ( ON ?auto_372968 ?auto_372967 ) ( ON ?auto_372969 ?auto_372968 ) ( ON ?auto_372970 ?auto_372969 ) ( not ( = ?auto_372966 ?auto_372967 ) ) ( not ( = ?auto_372966 ?auto_372968 ) ) ( not ( = ?auto_372966 ?auto_372969 ) ) ( not ( = ?auto_372966 ?auto_372970 ) ) ( not ( = ?auto_372966 ?auto_372971 ) ) ( not ( = ?auto_372966 ?auto_372972 ) ) ( not ( = ?auto_372966 ?auto_372973 ) ) ( not ( = ?auto_372966 ?auto_372974 ) ) ( not ( = ?auto_372966 ?auto_372975 ) ) ( not ( = ?auto_372966 ?auto_372976 ) ) ( not ( = ?auto_372966 ?auto_372977 ) ) ( not ( = ?auto_372967 ?auto_372968 ) ) ( not ( = ?auto_372967 ?auto_372969 ) ) ( not ( = ?auto_372967 ?auto_372970 ) ) ( not ( = ?auto_372967 ?auto_372971 ) ) ( not ( = ?auto_372967 ?auto_372972 ) ) ( not ( = ?auto_372967 ?auto_372973 ) ) ( not ( = ?auto_372967 ?auto_372974 ) ) ( not ( = ?auto_372967 ?auto_372975 ) ) ( not ( = ?auto_372967 ?auto_372976 ) ) ( not ( = ?auto_372967 ?auto_372977 ) ) ( not ( = ?auto_372968 ?auto_372969 ) ) ( not ( = ?auto_372968 ?auto_372970 ) ) ( not ( = ?auto_372968 ?auto_372971 ) ) ( not ( = ?auto_372968 ?auto_372972 ) ) ( not ( = ?auto_372968 ?auto_372973 ) ) ( not ( = ?auto_372968 ?auto_372974 ) ) ( not ( = ?auto_372968 ?auto_372975 ) ) ( not ( = ?auto_372968 ?auto_372976 ) ) ( not ( = ?auto_372968 ?auto_372977 ) ) ( not ( = ?auto_372969 ?auto_372970 ) ) ( not ( = ?auto_372969 ?auto_372971 ) ) ( not ( = ?auto_372969 ?auto_372972 ) ) ( not ( = ?auto_372969 ?auto_372973 ) ) ( not ( = ?auto_372969 ?auto_372974 ) ) ( not ( = ?auto_372969 ?auto_372975 ) ) ( not ( = ?auto_372969 ?auto_372976 ) ) ( not ( = ?auto_372969 ?auto_372977 ) ) ( not ( = ?auto_372970 ?auto_372971 ) ) ( not ( = ?auto_372970 ?auto_372972 ) ) ( not ( = ?auto_372970 ?auto_372973 ) ) ( not ( = ?auto_372970 ?auto_372974 ) ) ( not ( = ?auto_372970 ?auto_372975 ) ) ( not ( = ?auto_372970 ?auto_372976 ) ) ( not ( = ?auto_372970 ?auto_372977 ) ) ( not ( = ?auto_372971 ?auto_372972 ) ) ( not ( = ?auto_372971 ?auto_372973 ) ) ( not ( = ?auto_372971 ?auto_372974 ) ) ( not ( = ?auto_372971 ?auto_372975 ) ) ( not ( = ?auto_372971 ?auto_372976 ) ) ( not ( = ?auto_372971 ?auto_372977 ) ) ( not ( = ?auto_372972 ?auto_372973 ) ) ( not ( = ?auto_372972 ?auto_372974 ) ) ( not ( = ?auto_372972 ?auto_372975 ) ) ( not ( = ?auto_372972 ?auto_372976 ) ) ( not ( = ?auto_372972 ?auto_372977 ) ) ( not ( = ?auto_372973 ?auto_372974 ) ) ( not ( = ?auto_372973 ?auto_372975 ) ) ( not ( = ?auto_372973 ?auto_372976 ) ) ( not ( = ?auto_372973 ?auto_372977 ) ) ( not ( = ?auto_372974 ?auto_372975 ) ) ( not ( = ?auto_372974 ?auto_372976 ) ) ( not ( = ?auto_372974 ?auto_372977 ) ) ( not ( = ?auto_372975 ?auto_372976 ) ) ( not ( = ?auto_372975 ?auto_372977 ) ) ( not ( = ?auto_372976 ?auto_372977 ) ) ( ON ?auto_372975 ?auto_372976 ) ( ON ?auto_372974 ?auto_372975 ) ( ON ?auto_372973 ?auto_372974 ) ( ON ?auto_372972 ?auto_372973 ) ( CLEAR ?auto_372970 ) ( ON ?auto_372971 ?auto_372972 ) ( CLEAR ?auto_372971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_372966 ?auto_372967 ?auto_372968 ?auto_372969 ?auto_372970 ?auto_372971 )
      ( MAKE-11PILE ?auto_372966 ?auto_372967 ?auto_372968 ?auto_372969 ?auto_372970 ?auto_372971 ?auto_372972 ?auto_372973 ?auto_372974 ?auto_372975 ?auto_372976 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_372989 - BLOCK
      ?auto_372990 - BLOCK
      ?auto_372991 - BLOCK
      ?auto_372992 - BLOCK
      ?auto_372993 - BLOCK
      ?auto_372994 - BLOCK
      ?auto_372995 - BLOCK
      ?auto_372996 - BLOCK
      ?auto_372997 - BLOCK
      ?auto_372998 - BLOCK
      ?auto_372999 - BLOCK
    )
    :vars
    (
      ?auto_373000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_372999 ?auto_373000 ) ( ON-TABLE ?auto_372989 ) ( ON ?auto_372990 ?auto_372989 ) ( ON ?auto_372991 ?auto_372990 ) ( ON ?auto_372992 ?auto_372991 ) ( not ( = ?auto_372989 ?auto_372990 ) ) ( not ( = ?auto_372989 ?auto_372991 ) ) ( not ( = ?auto_372989 ?auto_372992 ) ) ( not ( = ?auto_372989 ?auto_372993 ) ) ( not ( = ?auto_372989 ?auto_372994 ) ) ( not ( = ?auto_372989 ?auto_372995 ) ) ( not ( = ?auto_372989 ?auto_372996 ) ) ( not ( = ?auto_372989 ?auto_372997 ) ) ( not ( = ?auto_372989 ?auto_372998 ) ) ( not ( = ?auto_372989 ?auto_372999 ) ) ( not ( = ?auto_372989 ?auto_373000 ) ) ( not ( = ?auto_372990 ?auto_372991 ) ) ( not ( = ?auto_372990 ?auto_372992 ) ) ( not ( = ?auto_372990 ?auto_372993 ) ) ( not ( = ?auto_372990 ?auto_372994 ) ) ( not ( = ?auto_372990 ?auto_372995 ) ) ( not ( = ?auto_372990 ?auto_372996 ) ) ( not ( = ?auto_372990 ?auto_372997 ) ) ( not ( = ?auto_372990 ?auto_372998 ) ) ( not ( = ?auto_372990 ?auto_372999 ) ) ( not ( = ?auto_372990 ?auto_373000 ) ) ( not ( = ?auto_372991 ?auto_372992 ) ) ( not ( = ?auto_372991 ?auto_372993 ) ) ( not ( = ?auto_372991 ?auto_372994 ) ) ( not ( = ?auto_372991 ?auto_372995 ) ) ( not ( = ?auto_372991 ?auto_372996 ) ) ( not ( = ?auto_372991 ?auto_372997 ) ) ( not ( = ?auto_372991 ?auto_372998 ) ) ( not ( = ?auto_372991 ?auto_372999 ) ) ( not ( = ?auto_372991 ?auto_373000 ) ) ( not ( = ?auto_372992 ?auto_372993 ) ) ( not ( = ?auto_372992 ?auto_372994 ) ) ( not ( = ?auto_372992 ?auto_372995 ) ) ( not ( = ?auto_372992 ?auto_372996 ) ) ( not ( = ?auto_372992 ?auto_372997 ) ) ( not ( = ?auto_372992 ?auto_372998 ) ) ( not ( = ?auto_372992 ?auto_372999 ) ) ( not ( = ?auto_372992 ?auto_373000 ) ) ( not ( = ?auto_372993 ?auto_372994 ) ) ( not ( = ?auto_372993 ?auto_372995 ) ) ( not ( = ?auto_372993 ?auto_372996 ) ) ( not ( = ?auto_372993 ?auto_372997 ) ) ( not ( = ?auto_372993 ?auto_372998 ) ) ( not ( = ?auto_372993 ?auto_372999 ) ) ( not ( = ?auto_372993 ?auto_373000 ) ) ( not ( = ?auto_372994 ?auto_372995 ) ) ( not ( = ?auto_372994 ?auto_372996 ) ) ( not ( = ?auto_372994 ?auto_372997 ) ) ( not ( = ?auto_372994 ?auto_372998 ) ) ( not ( = ?auto_372994 ?auto_372999 ) ) ( not ( = ?auto_372994 ?auto_373000 ) ) ( not ( = ?auto_372995 ?auto_372996 ) ) ( not ( = ?auto_372995 ?auto_372997 ) ) ( not ( = ?auto_372995 ?auto_372998 ) ) ( not ( = ?auto_372995 ?auto_372999 ) ) ( not ( = ?auto_372995 ?auto_373000 ) ) ( not ( = ?auto_372996 ?auto_372997 ) ) ( not ( = ?auto_372996 ?auto_372998 ) ) ( not ( = ?auto_372996 ?auto_372999 ) ) ( not ( = ?auto_372996 ?auto_373000 ) ) ( not ( = ?auto_372997 ?auto_372998 ) ) ( not ( = ?auto_372997 ?auto_372999 ) ) ( not ( = ?auto_372997 ?auto_373000 ) ) ( not ( = ?auto_372998 ?auto_372999 ) ) ( not ( = ?auto_372998 ?auto_373000 ) ) ( not ( = ?auto_372999 ?auto_373000 ) ) ( ON ?auto_372998 ?auto_372999 ) ( ON ?auto_372997 ?auto_372998 ) ( ON ?auto_372996 ?auto_372997 ) ( ON ?auto_372995 ?auto_372996 ) ( ON ?auto_372994 ?auto_372995 ) ( CLEAR ?auto_372992 ) ( ON ?auto_372993 ?auto_372994 ) ( CLEAR ?auto_372993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_372989 ?auto_372990 ?auto_372991 ?auto_372992 ?auto_372993 )
      ( MAKE-11PILE ?auto_372989 ?auto_372990 ?auto_372991 ?auto_372992 ?auto_372993 ?auto_372994 ?auto_372995 ?auto_372996 ?auto_372997 ?auto_372998 ?auto_372999 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373012 - BLOCK
      ?auto_373013 - BLOCK
      ?auto_373014 - BLOCK
      ?auto_373015 - BLOCK
      ?auto_373016 - BLOCK
      ?auto_373017 - BLOCK
      ?auto_373018 - BLOCK
      ?auto_373019 - BLOCK
      ?auto_373020 - BLOCK
      ?auto_373021 - BLOCK
      ?auto_373022 - BLOCK
    )
    :vars
    (
      ?auto_373023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373022 ?auto_373023 ) ( ON-TABLE ?auto_373012 ) ( ON ?auto_373013 ?auto_373012 ) ( ON ?auto_373014 ?auto_373013 ) ( ON ?auto_373015 ?auto_373014 ) ( not ( = ?auto_373012 ?auto_373013 ) ) ( not ( = ?auto_373012 ?auto_373014 ) ) ( not ( = ?auto_373012 ?auto_373015 ) ) ( not ( = ?auto_373012 ?auto_373016 ) ) ( not ( = ?auto_373012 ?auto_373017 ) ) ( not ( = ?auto_373012 ?auto_373018 ) ) ( not ( = ?auto_373012 ?auto_373019 ) ) ( not ( = ?auto_373012 ?auto_373020 ) ) ( not ( = ?auto_373012 ?auto_373021 ) ) ( not ( = ?auto_373012 ?auto_373022 ) ) ( not ( = ?auto_373012 ?auto_373023 ) ) ( not ( = ?auto_373013 ?auto_373014 ) ) ( not ( = ?auto_373013 ?auto_373015 ) ) ( not ( = ?auto_373013 ?auto_373016 ) ) ( not ( = ?auto_373013 ?auto_373017 ) ) ( not ( = ?auto_373013 ?auto_373018 ) ) ( not ( = ?auto_373013 ?auto_373019 ) ) ( not ( = ?auto_373013 ?auto_373020 ) ) ( not ( = ?auto_373013 ?auto_373021 ) ) ( not ( = ?auto_373013 ?auto_373022 ) ) ( not ( = ?auto_373013 ?auto_373023 ) ) ( not ( = ?auto_373014 ?auto_373015 ) ) ( not ( = ?auto_373014 ?auto_373016 ) ) ( not ( = ?auto_373014 ?auto_373017 ) ) ( not ( = ?auto_373014 ?auto_373018 ) ) ( not ( = ?auto_373014 ?auto_373019 ) ) ( not ( = ?auto_373014 ?auto_373020 ) ) ( not ( = ?auto_373014 ?auto_373021 ) ) ( not ( = ?auto_373014 ?auto_373022 ) ) ( not ( = ?auto_373014 ?auto_373023 ) ) ( not ( = ?auto_373015 ?auto_373016 ) ) ( not ( = ?auto_373015 ?auto_373017 ) ) ( not ( = ?auto_373015 ?auto_373018 ) ) ( not ( = ?auto_373015 ?auto_373019 ) ) ( not ( = ?auto_373015 ?auto_373020 ) ) ( not ( = ?auto_373015 ?auto_373021 ) ) ( not ( = ?auto_373015 ?auto_373022 ) ) ( not ( = ?auto_373015 ?auto_373023 ) ) ( not ( = ?auto_373016 ?auto_373017 ) ) ( not ( = ?auto_373016 ?auto_373018 ) ) ( not ( = ?auto_373016 ?auto_373019 ) ) ( not ( = ?auto_373016 ?auto_373020 ) ) ( not ( = ?auto_373016 ?auto_373021 ) ) ( not ( = ?auto_373016 ?auto_373022 ) ) ( not ( = ?auto_373016 ?auto_373023 ) ) ( not ( = ?auto_373017 ?auto_373018 ) ) ( not ( = ?auto_373017 ?auto_373019 ) ) ( not ( = ?auto_373017 ?auto_373020 ) ) ( not ( = ?auto_373017 ?auto_373021 ) ) ( not ( = ?auto_373017 ?auto_373022 ) ) ( not ( = ?auto_373017 ?auto_373023 ) ) ( not ( = ?auto_373018 ?auto_373019 ) ) ( not ( = ?auto_373018 ?auto_373020 ) ) ( not ( = ?auto_373018 ?auto_373021 ) ) ( not ( = ?auto_373018 ?auto_373022 ) ) ( not ( = ?auto_373018 ?auto_373023 ) ) ( not ( = ?auto_373019 ?auto_373020 ) ) ( not ( = ?auto_373019 ?auto_373021 ) ) ( not ( = ?auto_373019 ?auto_373022 ) ) ( not ( = ?auto_373019 ?auto_373023 ) ) ( not ( = ?auto_373020 ?auto_373021 ) ) ( not ( = ?auto_373020 ?auto_373022 ) ) ( not ( = ?auto_373020 ?auto_373023 ) ) ( not ( = ?auto_373021 ?auto_373022 ) ) ( not ( = ?auto_373021 ?auto_373023 ) ) ( not ( = ?auto_373022 ?auto_373023 ) ) ( ON ?auto_373021 ?auto_373022 ) ( ON ?auto_373020 ?auto_373021 ) ( ON ?auto_373019 ?auto_373020 ) ( ON ?auto_373018 ?auto_373019 ) ( ON ?auto_373017 ?auto_373018 ) ( CLEAR ?auto_373015 ) ( ON ?auto_373016 ?auto_373017 ) ( CLEAR ?auto_373016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_373012 ?auto_373013 ?auto_373014 ?auto_373015 ?auto_373016 )
      ( MAKE-11PILE ?auto_373012 ?auto_373013 ?auto_373014 ?auto_373015 ?auto_373016 ?auto_373017 ?auto_373018 ?auto_373019 ?auto_373020 ?auto_373021 ?auto_373022 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373035 - BLOCK
      ?auto_373036 - BLOCK
      ?auto_373037 - BLOCK
      ?auto_373038 - BLOCK
      ?auto_373039 - BLOCK
      ?auto_373040 - BLOCK
      ?auto_373041 - BLOCK
      ?auto_373042 - BLOCK
      ?auto_373043 - BLOCK
      ?auto_373044 - BLOCK
      ?auto_373045 - BLOCK
    )
    :vars
    (
      ?auto_373046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373045 ?auto_373046 ) ( ON-TABLE ?auto_373035 ) ( ON ?auto_373036 ?auto_373035 ) ( ON ?auto_373037 ?auto_373036 ) ( not ( = ?auto_373035 ?auto_373036 ) ) ( not ( = ?auto_373035 ?auto_373037 ) ) ( not ( = ?auto_373035 ?auto_373038 ) ) ( not ( = ?auto_373035 ?auto_373039 ) ) ( not ( = ?auto_373035 ?auto_373040 ) ) ( not ( = ?auto_373035 ?auto_373041 ) ) ( not ( = ?auto_373035 ?auto_373042 ) ) ( not ( = ?auto_373035 ?auto_373043 ) ) ( not ( = ?auto_373035 ?auto_373044 ) ) ( not ( = ?auto_373035 ?auto_373045 ) ) ( not ( = ?auto_373035 ?auto_373046 ) ) ( not ( = ?auto_373036 ?auto_373037 ) ) ( not ( = ?auto_373036 ?auto_373038 ) ) ( not ( = ?auto_373036 ?auto_373039 ) ) ( not ( = ?auto_373036 ?auto_373040 ) ) ( not ( = ?auto_373036 ?auto_373041 ) ) ( not ( = ?auto_373036 ?auto_373042 ) ) ( not ( = ?auto_373036 ?auto_373043 ) ) ( not ( = ?auto_373036 ?auto_373044 ) ) ( not ( = ?auto_373036 ?auto_373045 ) ) ( not ( = ?auto_373036 ?auto_373046 ) ) ( not ( = ?auto_373037 ?auto_373038 ) ) ( not ( = ?auto_373037 ?auto_373039 ) ) ( not ( = ?auto_373037 ?auto_373040 ) ) ( not ( = ?auto_373037 ?auto_373041 ) ) ( not ( = ?auto_373037 ?auto_373042 ) ) ( not ( = ?auto_373037 ?auto_373043 ) ) ( not ( = ?auto_373037 ?auto_373044 ) ) ( not ( = ?auto_373037 ?auto_373045 ) ) ( not ( = ?auto_373037 ?auto_373046 ) ) ( not ( = ?auto_373038 ?auto_373039 ) ) ( not ( = ?auto_373038 ?auto_373040 ) ) ( not ( = ?auto_373038 ?auto_373041 ) ) ( not ( = ?auto_373038 ?auto_373042 ) ) ( not ( = ?auto_373038 ?auto_373043 ) ) ( not ( = ?auto_373038 ?auto_373044 ) ) ( not ( = ?auto_373038 ?auto_373045 ) ) ( not ( = ?auto_373038 ?auto_373046 ) ) ( not ( = ?auto_373039 ?auto_373040 ) ) ( not ( = ?auto_373039 ?auto_373041 ) ) ( not ( = ?auto_373039 ?auto_373042 ) ) ( not ( = ?auto_373039 ?auto_373043 ) ) ( not ( = ?auto_373039 ?auto_373044 ) ) ( not ( = ?auto_373039 ?auto_373045 ) ) ( not ( = ?auto_373039 ?auto_373046 ) ) ( not ( = ?auto_373040 ?auto_373041 ) ) ( not ( = ?auto_373040 ?auto_373042 ) ) ( not ( = ?auto_373040 ?auto_373043 ) ) ( not ( = ?auto_373040 ?auto_373044 ) ) ( not ( = ?auto_373040 ?auto_373045 ) ) ( not ( = ?auto_373040 ?auto_373046 ) ) ( not ( = ?auto_373041 ?auto_373042 ) ) ( not ( = ?auto_373041 ?auto_373043 ) ) ( not ( = ?auto_373041 ?auto_373044 ) ) ( not ( = ?auto_373041 ?auto_373045 ) ) ( not ( = ?auto_373041 ?auto_373046 ) ) ( not ( = ?auto_373042 ?auto_373043 ) ) ( not ( = ?auto_373042 ?auto_373044 ) ) ( not ( = ?auto_373042 ?auto_373045 ) ) ( not ( = ?auto_373042 ?auto_373046 ) ) ( not ( = ?auto_373043 ?auto_373044 ) ) ( not ( = ?auto_373043 ?auto_373045 ) ) ( not ( = ?auto_373043 ?auto_373046 ) ) ( not ( = ?auto_373044 ?auto_373045 ) ) ( not ( = ?auto_373044 ?auto_373046 ) ) ( not ( = ?auto_373045 ?auto_373046 ) ) ( ON ?auto_373044 ?auto_373045 ) ( ON ?auto_373043 ?auto_373044 ) ( ON ?auto_373042 ?auto_373043 ) ( ON ?auto_373041 ?auto_373042 ) ( ON ?auto_373040 ?auto_373041 ) ( ON ?auto_373039 ?auto_373040 ) ( CLEAR ?auto_373037 ) ( ON ?auto_373038 ?auto_373039 ) ( CLEAR ?auto_373038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_373035 ?auto_373036 ?auto_373037 ?auto_373038 )
      ( MAKE-11PILE ?auto_373035 ?auto_373036 ?auto_373037 ?auto_373038 ?auto_373039 ?auto_373040 ?auto_373041 ?auto_373042 ?auto_373043 ?auto_373044 ?auto_373045 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373058 - BLOCK
      ?auto_373059 - BLOCK
      ?auto_373060 - BLOCK
      ?auto_373061 - BLOCK
      ?auto_373062 - BLOCK
      ?auto_373063 - BLOCK
      ?auto_373064 - BLOCK
      ?auto_373065 - BLOCK
      ?auto_373066 - BLOCK
      ?auto_373067 - BLOCK
      ?auto_373068 - BLOCK
    )
    :vars
    (
      ?auto_373069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373068 ?auto_373069 ) ( ON-TABLE ?auto_373058 ) ( ON ?auto_373059 ?auto_373058 ) ( ON ?auto_373060 ?auto_373059 ) ( not ( = ?auto_373058 ?auto_373059 ) ) ( not ( = ?auto_373058 ?auto_373060 ) ) ( not ( = ?auto_373058 ?auto_373061 ) ) ( not ( = ?auto_373058 ?auto_373062 ) ) ( not ( = ?auto_373058 ?auto_373063 ) ) ( not ( = ?auto_373058 ?auto_373064 ) ) ( not ( = ?auto_373058 ?auto_373065 ) ) ( not ( = ?auto_373058 ?auto_373066 ) ) ( not ( = ?auto_373058 ?auto_373067 ) ) ( not ( = ?auto_373058 ?auto_373068 ) ) ( not ( = ?auto_373058 ?auto_373069 ) ) ( not ( = ?auto_373059 ?auto_373060 ) ) ( not ( = ?auto_373059 ?auto_373061 ) ) ( not ( = ?auto_373059 ?auto_373062 ) ) ( not ( = ?auto_373059 ?auto_373063 ) ) ( not ( = ?auto_373059 ?auto_373064 ) ) ( not ( = ?auto_373059 ?auto_373065 ) ) ( not ( = ?auto_373059 ?auto_373066 ) ) ( not ( = ?auto_373059 ?auto_373067 ) ) ( not ( = ?auto_373059 ?auto_373068 ) ) ( not ( = ?auto_373059 ?auto_373069 ) ) ( not ( = ?auto_373060 ?auto_373061 ) ) ( not ( = ?auto_373060 ?auto_373062 ) ) ( not ( = ?auto_373060 ?auto_373063 ) ) ( not ( = ?auto_373060 ?auto_373064 ) ) ( not ( = ?auto_373060 ?auto_373065 ) ) ( not ( = ?auto_373060 ?auto_373066 ) ) ( not ( = ?auto_373060 ?auto_373067 ) ) ( not ( = ?auto_373060 ?auto_373068 ) ) ( not ( = ?auto_373060 ?auto_373069 ) ) ( not ( = ?auto_373061 ?auto_373062 ) ) ( not ( = ?auto_373061 ?auto_373063 ) ) ( not ( = ?auto_373061 ?auto_373064 ) ) ( not ( = ?auto_373061 ?auto_373065 ) ) ( not ( = ?auto_373061 ?auto_373066 ) ) ( not ( = ?auto_373061 ?auto_373067 ) ) ( not ( = ?auto_373061 ?auto_373068 ) ) ( not ( = ?auto_373061 ?auto_373069 ) ) ( not ( = ?auto_373062 ?auto_373063 ) ) ( not ( = ?auto_373062 ?auto_373064 ) ) ( not ( = ?auto_373062 ?auto_373065 ) ) ( not ( = ?auto_373062 ?auto_373066 ) ) ( not ( = ?auto_373062 ?auto_373067 ) ) ( not ( = ?auto_373062 ?auto_373068 ) ) ( not ( = ?auto_373062 ?auto_373069 ) ) ( not ( = ?auto_373063 ?auto_373064 ) ) ( not ( = ?auto_373063 ?auto_373065 ) ) ( not ( = ?auto_373063 ?auto_373066 ) ) ( not ( = ?auto_373063 ?auto_373067 ) ) ( not ( = ?auto_373063 ?auto_373068 ) ) ( not ( = ?auto_373063 ?auto_373069 ) ) ( not ( = ?auto_373064 ?auto_373065 ) ) ( not ( = ?auto_373064 ?auto_373066 ) ) ( not ( = ?auto_373064 ?auto_373067 ) ) ( not ( = ?auto_373064 ?auto_373068 ) ) ( not ( = ?auto_373064 ?auto_373069 ) ) ( not ( = ?auto_373065 ?auto_373066 ) ) ( not ( = ?auto_373065 ?auto_373067 ) ) ( not ( = ?auto_373065 ?auto_373068 ) ) ( not ( = ?auto_373065 ?auto_373069 ) ) ( not ( = ?auto_373066 ?auto_373067 ) ) ( not ( = ?auto_373066 ?auto_373068 ) ) ( not ( = ?auto_373066 ?auto_373069 ) ) ( not ( = ?auto_373067 ?auto_373068 ) ) ( not ( = ?auto_373067 ?auto_373069 ) ) ( not ( = ?auto_373068 ?auto_373069 ) ) ( ON ?auto_373067 ?auto_373068 ) ( ON ?auto_373066 ?auto_373067 ) ( ON ?auto_373065 ?auto_373066 ) ( ON ?auto_373064 ?auto_373065 ) ( ON ?auto_373063 ?auto_373064 ) ( ON ?auto_373062 ?auto_373063 ) ( CLEAR ?auto_373060 ) ( ON ?auto_373061 ?auto_373062 ) ( CLEAR ?auto_373061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_373058 ?auto_373059 ?auto_373060 ?auto_373061 )
      ( MAKE-11PILE ?auto_373058 ?auto_373059 ?auto_373060 ?auto_373061 ?auto_373062 ?auto_373063 ?auto_373064 ?auto_373065 ?auto_373066 ?auto_373067 ?auto_373068 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373081 - BLOCK
      ?auto_373082 - BLOCK
      ?auto_373083 - BLOCK
      ?auto_373084 - BLOCK
      ?auto_373085 - BLOCK
      ?auto_373086 - BLOCK
      ?auto_373087 - BLOCK
      ?auto_373088 - BLOCK
      ?auto_373089 - BLOCK
      ?auto_373090 - BLOCK
      ?auto_373091 - BLOCK
    )
    :vars
    (
      ?auto_373092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373091 ?auto_373092 ) ( ON-TABLE ?auto_373081 ) ( ON ?auto_373082 ?auto_373081 ) ( not ( = ?auto_373081 ?auto_373082 ) ) ( not ( = ?auto_373081 ?auto_373083 ) ) ( not ( = ?auto_373081 ?auto_373084 ) ) ( not ( = ?auto_373081 ?auto_373085 ) ) ( not ( = ?auto_373081 ?auto_373086 ) ) ( not ( = ?auto_373081 ?auto_373087 ) ) ( not ( = ?auto_373081 ?auto_373088 ) ) ( not ( = ?auto_373081 ?auto_373089 ) ) ( not ( = ?auto_373081 ?auto_373090 ) ) ( not ( = ?auto_373081 ?auto_373091 ) ) ( not ( = ?auto_373081 ?auto_373092 ) ) ( not ( = ?auto_373082 ?auto_373083 ) ) ( not ( = ?auto_373082 ?auto_373084 ) ) ( not ( = ?auto_373082 ?auto_373085 ) ) ( not ( = ?auto_373082 ?auto_373086 ) ) ( not ( = ?auto_373082 ?auto_373087 ) ) ( not ( = ?auto_373082 ?auto_373088 ) ) ( not ( = ?auto_373082 ?auto_373089 ) ) ( not ( = ?auto_373082 ?auto_373090 ) ) ( not ( = ?auto_373082 ?auto_373091 ) ) ( not ( = ?auto_373082 ?auto_373092 ) ) ( not ( = ?auto_373083 ?auto_373084 ) ) ( not ( = ?auto_373083 ?auto_373085 ) ) ( not ( = ?auto_373083 ?auto_373086 ) ) ( not ( = ?auto_373083 ?auto_373087 ) ) ( not ( = ?auto_373083 ?auto_373088 ) ) ( not ( = ?auto_373083 ?auto_373089 ) ) ( not ( = ?auto_373083 ?auto_373090 ) ) ( not ( = ?auto_373083 ?auto_373091 ) ) ( not ( = ?auto_373083 ?auto_373092 ) ) ( not ( = ?auto_373084 ?auto_373085 ) ) ( not ( = ?auto_373084 ?auto_373086 ) ) ( not ( = ?auto_373084 ?auto_373087 ) ) ( not ( = ?auto_373084 ?auto_373088 ) ) ( not ( = ?auto_373084 ?auto_373089 ) ) ( not ( = ?auto_373084 ?auto_373090 ) ) ( not ( = ?auto_373084 ?auto_373091 ) ) ( not ( = ?auto_373084 ?auto_373092 ) ) ( not ( = ?auto_373085 ?auto_373086 ) ) ( not ( = ?auto_373085 ?auto_373087 ) ) ( not ( = ?auto_373085 ?auto_373088 ) ) ( not ( = ?auto_373085 ?auto_373089 ) ) ( not ( = ?auto_373085 ?auto_373090 ) ) ( not ( = ?auto_373085 ?auto_373091 ) ) ( not ( = ?auto_373085 ?auto_373092 ) ) ( not ( = ?auto_373086 ?auto_373087 ) ) ( not ( = ?auto_373086 ?auto_373088 ) ) ( not ( = ?auto_373086 ?auto_373089 ) ) ( not ( = ?auto_373086 ?auto_373090 ) ) ( not ( = ?auto_373086 ?auto_373091 ) ) ( not ( = ?auto_373086 ?auto_373092 ) ) ( not ( = ?auto_373087 ?auto_373088 ) ) ( not ( = ?auto_373087 ?auto_373089 ) ) ( not ( = ?auto_373087 ?auto_373090 ) ) ( not ( = ?auto_373087 ?auto_373091 ) ) ( not ( = ?auto_373087 ?auto_373092 ) ) ( not ( = ?auto_373088 ?auto_373089 ) ) ( not ( = ?auto_373088 ?auto_373090 ) ) ( not ( = ?auto_373088 ?auto_373091 ) ) ( not ( = ?auto_373088 ?auto_373092 ) ) ( not ( = ?auto_373089 ?auto_373090 ) ) ( not ( = ?auto_373089 ?auto_373091 ) ) ( not ( = ?auto_373089 ?auto_373092 ) ) ( not ( = ?auto_373090 ?auto_373091 ) ) ( not ( = ?auto_373090 ?auto_373092 ) ) ( not ( = ?auto_373091 ?auto_373092 ) ) ( ON ?auto_373090 ?auto_373091 ) ( ON ?auto_373089 ?auto_373090 ) ( ON ?auto_373088 ?auto_373089 ) ( ON ?auto_373087 ?auto_373088 ) ( ON ?auto_373086 ?auto_373087 ) ( ON ?auto_373085 ?auto_373086 ) ( ON ?auto_373084 ?auto_373085 ) ( CLEAR ?auto_373082 ) ( ON ?auto_373083 ?auto_373084 ) ( CLEAR ?auto_373083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_373081 ?auto_373082 ?auto_373083 )
      ( MAKE-11PILE ?auto_373081 ?auto_373082 ?auto_373083 ?auto_373084 ?auto_373085 ?auto_373086 ?auto_373087 ?auto_373088 ?auto_373089 ?auto_373090 ?auto_373091 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373104 - BLOCK
      ?auto_373105 - BLOCK
      ?auto_373106 - BLOCK
      ?auto_373107 - BLOCK
      ?auto_373108 - BLOCK
      ?auto_373109 - BLOCK
      ?auto_373110 - BLOCK
      ?auto_373111 - BLOCK
      ?auto_373112 - BLOCK
      ?auto_373113 - BLOCK
      ?auto_373114 - BLOCK
    )
    :vars
    (
      ?auto_373115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373114 ?auto_373115 ) ( ON-TABLE ?auto_373104 ) ( ON ?auto_373105 ?auto_373104 ) ( not ( = ?auto_373104 ?auto_373105 ) ) ( not ( = ?auto_373104 ?auto_373106 ) ) ( not ( = ?auto_373104 ?auto_373107 ) ) ( not ( = ?auto_373104 ?auto_373108 ) ) ( not ( = ?auto_373104 ?auto_373109 ) ) ( not ( = ?auto_373104 ?auto_373110 ) ) ( not ( = ?auto_373104 ?auto_373111 ) ) ( not ( = ?auto_373104 ?auto_373112 ) ) ( not ( = ?auto_373104 ?auto_373113 ) ) ( not ( = ?auto_373104 ?auto_373114 ) ) ( not ( = ?auto_373104 ?auto_373115 ) ) ( not ( = ?auto_373105 ?auto_373106 ) ) ( not ( = ?auto_373105 ?auto_373107 ) ) ( not ( = ?auto_373105 ?auto_373108 ) ) ( not ( = ?auto_373105 ?auto_373109 ) ) ( not ( = ?auto_373105 ?auto_373110 ) ) ( not ( = ?auto_373105 ?auto_373111 ) ) ( not ( = ?auto_373105 ?auto_373112 ) ) ( not ( = ?auto_373105 ?auto_373113 ) ) ( not ( = ?auto_373105 ?auto_373114 ) ) ( not ( = ?auto_373105 ?auto_373115 ) ) ( not ( = ?auto_373106 ?auto_373107 ) ) ( not ( = ?auto_373106 ?auto_373108 ) ) ( not ( = ?auto_373106 ?auto_373109 ) ) ( not ( = ?auto_373106 ?auto_373110 ) ) ( not ( = ?auto_373106 ?auto_373111 ) ) ( not ( = ?auto_373106 ?auto_373112 ) ) ( not ( = ?auto_373106 ?auto_373113 ) ) ( not ( = ?auto_373106 ?auto_373114 ) ) ( not ( = ?auto_373106 ?auto_373115 ) ) ( not ( = ?auto_373107 ?auto_373108 ) ) ( not ( = ?auto_373107 ?auto_373109 ) ) ( not ( = ?auto_373107 ?auto_373110 ) ) ( not ( = ?auto_373107 ?auto_373111 ) ) ( not ( = ?auto_373107 ?auto_373112 ) ) ( not ( = ?auto_373107 ?auto_373113 ) ) ( not ( = ?auto_373107 ?auto_373114 ) ) ( not ( = ?auto_373107 ?auto_373115 ) ) ( not ( = ?auto_373108 ?auto_373109 ) ) ( not ( = ?auto_373108 ?auto_373110 ) ) ( not ( = ?auto_373108 ?auto_373111 ) ) ( not ( = ?auto_373108 ?auto_373112 ) ) ( not ( = ?auto_373108 ?auto_373113 ) ) ( not ( = ?auto_373108 ?auto_373114 ) ) ( not ( = ?auto_373108 ?auto_373115 ) ) ( not ( = ?auto_373109 ?auto_373110 ) ) ( not ( = ?auto_373109 ?auto_373111 ) ) ( not ( = ?auto_373109 ?auto_373112 ) ) ( not ( = ?auto_373109 ?auto_373113 ) ) ( not ( = ?auto_373109 ?auto_373114 ) ) ( not ( = ?auto_373109 ?auto_373115 ) ) ( not ( = ?auto_373110 ?auto_373111 ) ) ( not ( = ?auto_373110 ?auto_373112 ) ) ( not ( = ?auto_373110 ?auto_373113 ) ) ( not ( = ?auto_373110 ?auto_373114 ) ) ( not ( = ?auto_373110 ?auto_373115 ) ) ( not ( = ?auto_373111 ?auto_373112 ) ) ( not ( = ?auto_373111 ?auto_373113 ) ) ( not ( = ?auto_373111 ?auto_373114 ) ) ( not ( = ?auto_373111 ?auto_373115 ) ) ( not ( = ?auto_373112 ?auto_373113 ) ) ( not ( = ?auto_373112 ?auto_373114 ) ) ( not ( = ?auto_373112 ?auto_373115 ) ) ( not ( = ?auto_373113 ?auto_373114 ) ) ( not ( = ?auto_373113 ?auto_373115 ) ) ( not ( = ?auto_373114 ?auto_373115 ) ) ( ON ?auto_373113 ?auto_373114 ) ( ON ?auto_373112 ?auto_373113 ) ( ON ?auto_373111 ?auto_373112 ) ( ON ?auto_373110 ?auto_373111 ) ( ON ?auto_373109 ?auto_373110 ) ( ON ?auto_373108 ?auto_373109 ) ( ON ?auto_373107 ?auto_373108 ) ( CLEAR ?auto_373105 ) ( ON ?auto_373106 ?auto_373107 ) ( CLEAR ?auto_373106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_373104 ?auto_373105 ?auto_373106 )
      ( MAKE-11PILE ?auto_373104 ?auto_373105 ?auto_373106 ?auto_373107 ?auto_373108 ?auto_373109 ?auto_373110 ?auto_373111 ?auto_373112 ?auto_373113 ?auto_373114 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373127 - BLOCK
      ?auto_373128 - BLOCK
      ?auto_373129 - BLOCK
      ?auto_373130 - BLOCK
      ?auto_373131 - BLOCK
      ?auto_373132 - BLOCK
      ?auto_373133 - BLOCK
      ?auto_373134 - BLOCK
      ?auto_373135 - BLOCK
      ?auto_373136 - BLOCK
      ?auto_373137 - BLOCK
    )
    :vars
    (
      ?auto_373138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373137 ?auto_373138 ) ( ON-TABLE ?auto_373127 ) ( not ( = ?auto_373127 ?auto_373128 ) ) ( not ( = ?auto_373127 ?auto_373129 ) ) ( not ( = ?auto_373127 ?auto_373130 ) ) ( not ( = ?auto_373127 ?auto_373131 ) ) ( not ( = ?auto_373127 ?auto_373132 ) ) ( not ( = ?auto_373127 ?auto_373133 ) ) ( not ( = ?auto_373127 ?auto_373134 ) ) ( not ( = ?auto_373127 ?auto_373135 ) ) ( not ( = ?auto_373127 ?auto_373136 ) ) ( not ( = ?auto_373127 ?auto_373137 ) ) ( not ( = ?auto_373127 ?auto_373138 ) ) ( not ( = ?auto_373128 ?auto_373129 ) ) ( not ( = ?auto_373128 ?auto_373130 ) ) ( not ( = ?auto_373128 ?auto_373131 ) ) ( not ( = ?auto_373128 ?auto_373132 ) ) ( not ( = ?auto_373128 ?auto_373133 ) ) ( not ( = ?auto_373128 ?auto_373134 ) ) ( not ( = ?auto_373128 ?auto_373135 ) ) ( not ( = ?auto_373128 ?auto_373136 ) ) ( not ( = ?auto_373128 ?auto_373137 ) ) ( not ( = ?auto_373128 ?auto_373138 ) ) ( not ( = ?auto_373129 ?auto_373130 ) ) ( not ( = ?auto_373129 ?auto_373131 ) ) ( not ( = ?auto_373129 ?auto_373132 ) ) ( not ( = ?auto_373129 ?auto_373133 ) ) ( not ( = ?auto_373129 ?auto_373134 ) ) ( not ( = ?auto_373129 ?auto_373135 ) ) ( not ( = ?auto_373129 ?auto_373136 ) ) ( not ( = ?auto_373129 ?auto_373137 ) ) ( not ( = ?auto_373129 ?auto_373138 ) ) ( not ( = ?auto_373130 ?auto_373131 ) ) ( not ( = ?auto_373130 ?auto_373132 ) ) ( not ( = ?auto_373130 ?auto_373133 ) ) ( not ( = ?auto_373130 ?auto_373134 ) ) ( not ( = ?auto_373130 ?auto_373135 ) ) ( not ( = ?auto_373130 ?auto_373136 ) ) ( not ( = ?auto_373130 ?auto_373137 ) ) ( not ( = ?auto_373130 ?auto_373138 ) ) ( not ( = ?auto_373131 ?auto_373132 ) ) ( not ( = ?auto_373131 ?auto_373133 ) ) ( not ( = ?auto_373131 ?auto_373134 ) ) ( not ( = ?auto_373131 ?auto_373135 ) ) ( not ( = ?auto_373131 ?auto_373136 ) ) ( not ( = ?auto_373131 ?auto_373137 ) ) ( not ( = ?auto_373131 ?auto_373138 ) ) ( not ( = ?auto_373132 ?auto_373133 ) ) ( not ( = ?auto_373132 ?auto_373134 ) ) ( not ( = ?auto_373132 ?auto_373135 ) ) ( not ( = ?auto_373132 ?auto_373136 ) ) ( not ( = ?auto_373132 ?auto_373137 ) ) ( not ( = ?auto_373132 ?auto_373138 ) ) ( not ( = ?auto_373133 ?auto_373134 ) ) ( not ( = ?auto_373133 ?auto_373135 ) ) ( not ( = ?auto_373133 ?auto_373136 ) ) ( not ( = ?auto_373133 ?auto_373137 ) ) ( not ( = ?auto_373133 ?auto_373138 ) ) ( not ( = ?auto_373134 ?auto_373135 ) ) ( not ( = ?auto_373134 ?auto_373136 ) ) ( not ( = ?auto_373134 ?auto_373137 ) ) ( not ( = ?auto_373134 ?auto_373138 ) ) ( not ( = ?auto_373135 ?auto_373136 ) ) ( not ( = ?auto_373135 ?auto_373137 ) ) ( not ( = ?auto_373135 ?auto_373138 ) ) ( not ( = ?auto_373136 ?auto_373137 ) ) ( not ( = ?auto_373136 ?auto_373138 ) ) ( not ( = ?auto_373137 ?auto_373138 ) ) ( ON ?auto_373136 ?auto_373137 ) ( ON ?auto_373135 ?auto_373136 ) ( ON ?auto_373134 ?auto_373135 ) ( ON ?auto_373133 ?auto_373134 ) ( ON ?auto_373132 ?auto_373133 ) ( ON ?auto_373131 ?auto_373132 ) ( ON ?auto_373130 ?auto_373131 ) ( ON ?auto_373129 ?auto_373130 ) ( CLEAR ?auto_373127 ) ( ON ?auto_373128 ?auto_373129 ) ( CLEAR ?auto_373128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_373127 ?auto_373128 )
      ( MAKE-11PILE ?auto_373127 ?auto_373128 ?auto_373129 ?auto_373130 ?auto_373131 ?auto_373132 ?auto_373133 ?auto_373134 ?auto_373135 ?auto_373136 ?auto_373137 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373150 - BLOCK
      ?auto_373151 - BLOCK
      ?auto_373152 - BLOCK
      ?auto_373153 - BLOCK
      ?auto_373154 - BLOCK
      ?auto_373155 - BLOCK
      ?auto_373156 - BLOCK
      ?auto_373157 - BLOCK
      ?auto_373158 - BLOCK
      ?auto_373159 - BLOCK
      ?auto_373160 - BLOCK
    )
    :vars
    (
      ?auto_373161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373160 ?auto_373161 ) ( ON-TABLE ?auto_373150 ) ( not ( = ?auto_373150 ?auto_373151 ) ) ( not ( = ?auto_373150 ?auto_373152 ) ) ( not ( = ?auto_373150 ?auto_373153 ) ) ( not ( = ?auto_373150 ?auto_373154 ) ) ( not ( = ?auto_373150 ?auto_373155 ) ) ( not ( = ?auto_373150 ?auto_373156 ) ) ( not ( = ?auto_373150 ?auto_373157 ) ) ( not ( = ?auto_373150 ?auto_373158 ) ) ( not ( = ?auto_373150 ?auto_373159 ) ) ( not ( = ?auto_373150 ?auto_373160 ) ) ( not ( = ?auto_373150 ?auto_373161 ) ) ( not ( = ?auto_373151 ?auto_373152 ) ) ( not ( = ?auto_373151 ?auto_373153 ) ) ( not ( = ?auto_373151 ?auto_373154 ) ) ( not ( = ?auto_373151 ?auto_373155 ) ) ( not ( = ?auto_373151 ?auto_373156 ) ) ( not ( = ?auto_373151 ?auto_373157 ) ) ( not ( = ?auto_373151 ?auto_373158 ) ) ( not ( = ?auto_373151 ?auto_373159 ) ) ( not ( = ?auto_373151 ?auto_373160 ) ) ( not ( = ?auto_373151 ?auto_373161 ) ) ( not ( = ?auto_373152 ?auto_373153 ) ) ( not ( = ?auto_373152 ?auto_373154 ) ) ( not ( = ?auto_373152 ?auto_373155 ) ) ( not ( = ?auto_373152 ?auto_373156 ) ) ( not ( = ?auto_373152 ?auto_373157 ) ) ( not ( = ?auto_373152 ?auto_373158 ) ) ( not ( = ?auto_373152 ?auto_373159 ) ) ( not ( = ?auto_373152 ?auto_373160 ) ) ( not ( = ?auto_373152 ?auto_373161 ) ) ( not ( = ?auto_373153 ?auto_373154 ) ) ( not ( = ?auto_373153 ?auto_373155 ) ) ( not ( = ?auto_373153 ?auto_373156 ) ) ( not ( = ?auto_373153 ?auto_373157 ) ) ( not ( = ?auto_373153 ?auto_373158 ) ) ( not ( = ?auto_373153 ?auto_373159 ) ) ( not ( = ?auto_373153 ?auto_373160 ) ) ( not ( = ?auto_373153 ?auto_373161 ) ) ( not ( = ?auto_373154 ?auto_373155 ) ) ( not ( = ?auto_373154 ?auto_373156 ) ) ( not ( = ?auto_373154 ?auto_373157 ) ) ( not ( = ?auto_373154 ?auto_373158 ) ) ( not ( = ?auto_373154 ?auto_373159 ) ) ( not ( = ?auto_373154 ?auto_373160 ) ) ( not ( = ?auto_373154 ?auto_373161 ) ) ( not ( = ?auto_373155 ?auto_373156 ) ) ( not ( = ?auto_373155 ?auto_373157 ) ) ( not ( = ?auto_373155 ?auto_373158 ) ) ( not ( = ?auto_373155 ?auto_373159 ) ) ( not ( = ?auto_373155 ?auto_373160 ) ) ( not ( = ?auto_373155 ?auto_373161 ) ) ( not ( = ?auto_373156 ?auto_373157 ) ) ( not ( = ?auto_373156 ?auto_373158 ) ) ( not ( = ?auto_373156 ?auto_373159 ) ) ( not ( = ?auto_373156 ?auto_373160 ) ) ( not ( = ?auto_373156 ?auto_373161 ) ) ( not ( = ?auto_373157 ?auto_373158 ) ) ( not ( = ?auto_373157 ?auto_373159 ) ) ( not ( = ?auto_373157 ?auto_373160 ) ) ( not ( = ?auto_373157 ?auto_373161 ) ) ( not ( = ?auto_373158 ?auto_373159 ) ) ( not ( = ?auto_373158 ?auto_373160 ) ) ( not ( = ?auto_373158 ?auto_373161 ) ) ( not ( = ?auto_373159 ?auto_373160 ) ) ( not ( = ?auto_373159 ?auto_373161 ) ) ( not ( = ?auto_373160 ?auto_373161 ) ) ( ON ?auto_373159 ?auto_373160 ) ( ON ?auto_373158 ?auto_373159 ) ( ON ?auto_373157 ?auto_373158 ) ( ON ?auto_373156 ?auto_373157 ) ( ON ?auto_373155 ?auto_373156 ) ( ON ?auto_373154 ?auto_373155 ) ( ON ?auto_373153 ?auto_373154 ) ( ON ?auto_373152 ?auto_373153 ) ( CLEAR ?auto_373150 ) ( ON ?auto_373151 ?auto_373152 ) ( CLEAR ?auto_373151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_373150 ?auto_373151 )
      ( MAKE-11PILE ?auto_373150 ?auto_373151 ?auto_373152 ?auto_373153 ?auto_373154 ?auto_373155 ?auto_373156 ?auto_373157 ?auto_373158 ?auto_373159 ?auto_373160 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373173 - BLOCK
      ?auto_373174 - BLOCK
      ?auto_373175 - BLOCK
      ?auto_373176 - BLOCK
      ?auto_373177 - BLOCK
      ?auto_373178 - BLOCK
      ?auto_373179 - BLOCK
      ?auto_373180 - BLOCK
      ?auto_373181 - BLOCK
      ?auto_373182 - BLOCK
      ?auto_373183 - BLOCK
    )
    :vars
    (
      ?auto_373184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373183 ?auto_373184 ) ( not ( = ?auto_373173 ?auto_373174 ) ) ( not ( = ?auto_373173 ?auto_373175 ) ) ( not ( = ?auto_373173 ?auto_373176 ) ) ( not ( = ?auto_373173 ?auto_373177 ) ) ( not ( = ?auto_373173 ?auto_373178 ) ) ( not ( = ?auto_373173 ?auto_373179 ) ) ( not ( = ?auto_373173 ?auto_373180 ) ) ( not ( = ?auto_373173 ?auto_373181 ) ) ( not ( = ?auto_373173 ?auto_373182 ) ) ( not ( = ?auto_373173 ?auto_373183 ) ) ( not ( = ?auto_373173 ?auto_373184 ) ) ( not ( = ?auto_373174 ?auto_373175 ) ) ( not ( = ?auto_373174 ?auto_373176 ) ) ( not ( = ?auto_373174 ?auto_373177 ) ) ( not ( = ?auto_373174 ?auto_373178 ) ) ( not ( = ?auto_373174 ?auto_373179 ) ) ( not ( = ?auto_373174 ?auto_373180 ) ) ( not ( = ?auto_373174 ?auto_373181 ) ) ( not ( = ?auto_373174 ?auto_373182 ) ) ( not ( = ?auto_373174 ?auto_373183 ) ) ( not ( = ?auto_373174 ?auto_373184 ) ) ( not ( = ?auto_373175 ?auto_373176 ) ) ( not ( = ?auto_373175 ?auto_373177 ) ) ( not ( = ?auto_373175 ?auto_373178 ) ) ( not ( = ?auto_373175 ?auto_373179 ) ) ( not ( = ?auto_373175 ?auto_373180 ) ) ( not ( = ?auto_373175 ?auto_373181 ) ) ( not ( = ?auto_373175 ?auto_373182 ) ) ( not ( = ?auto_373175 ?auto_373183 ) ) ( not ( = ?auto_373175 ?auto_373184 ) ) ( not ( = ?auto_373176 ?auto_373177 ) ) ( not ( = ?auto_373176 ?auto_373178 ) ) ( not ( = ?auto_373176 ?auto_373179 ) ) ( not ( = ?auto_373176 ?auto_373180 ) ) ( not ( = ?auto_373176 ?auto_373181 ) ) ( not ( = ?auto_373176 ?auto_373182 ) ) ( not ( = ?auto_373176 ?auto_373183 ) ) ( not ( = ?auto_373176 ?auto_373184 ) ) ( not ( = ?auto_373177 ?auto_373178 ) ) ( not ( = ?auto_373177 ?auto_373179 ) ) ( not ( = ?auto_373177 ?auto_373180 ) ) ( not ( = ?auto_373177 ?auto_373181 ) ) ( not ( = ?auto_373177 ?auto_373182 ) ) ( not ( = ?auto_373177 ?auto_373183 ) ) ( not ( = ?auto_373177 ?auto_373184 ) ) ( not ( = ?auto_373178 ?auto_373179 ) ) ( not ( = ?auto_373178 ?auto_373180 ) ) ( not ( = ?auto_373178 ?auto_373181 ) ) ( not ( = ?auto_373178 ?auto_373182 ) ) ( not ( = ?auto_373178 ?auto_373183 ) ) ( not ( = ?auto_373178 ?auto_373184 ) ) ( not ( = ?auto_373179 ?auto_373180 ) ) ( not ( = ?auto_373179 ?auto_373181 ) ) ( not ( = ?auto_373179 ?auto_373182 ) ) ( not ( = ?auto_373179 ?auto_373183 ) ) ( not ( = ?auto_373179 ?auto_373184 ) ) ( not ( = ?auto_373180 ?auto_373181 ) ) ( not ( = ?auto_373180 ?auto_373182 ) ) ( not ( = ?auto_373180 ?auto_373183 ) ) ( not ( = ?auto_373180 ?auto_373184 ) ) ( not ( = ?auto_373181 ?auto_373182 ) ) ( not ( = ?auto_373181 ?auto_373183 ) ) ( not ( = ?auto_373181 ?auto_373184 ) ) ( not ( = ?auto_373182 ?auto_373183 ) ) ( not ( = ?auto_373182 ?auto_373184 ) ) ( not ( = ?auto_373183 ?auto_373184 ) ) ( ON ?auto_373182 ?auto_373183 ) ( ON ?auto_373181 ?auto_373182 ) ( ON ?auto_373180 ?auto_373181 ) ( ON ?auto_373179 ?auto_373180 ) ( ON ?auto_373178 ?auto_373179 ) ( ON ?auto_373177 ?auto_373178 ) ( ON ?auto_373176 ?auto_373177 ) ( ON ?auto_373175 ?auto_373176 ) ( ON ?auto_373174 ?auto_373175 ) ( ON ?auto_373173 ?auto_373174 ) ( CLEAR ?auto_373173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_373173 )
      ( MAKE-11PILE ?auto_373173 ?auto_373174 ?auto_373175 ?auto_373176 ?auto_373177 ?auto_373178 ?auto_373179 ?auto_373180 ?auto_373181 ?auto_373182 ?auto_373183 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_373196 - BLOCK
      ?auto_373197 - BLOCK
      ?auto_373198 - BLOCK
      ?auto_373199 - BLOCK
      ?auto_373200 - BLOCK
      ?auto_373201 - BLOCK
      ?auto_373202 - BLOCK
      ?auto_373203 - BLOCK
      ?auto_373204 - BLOCK
      ?auto_373205 - BLOCK
      ?auto_373206 - BLOCK
    )
    :vars
    (
      ?auto_373207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373206 ?auto_373207 ) ( not ( = ?auto_373196 ?auto_373197 ) ) ( not ( = ?auto_373196 ?auto_373198 ) ) ( not ( = ?auto_373196 ?auto_373199 ) ) ( not ( = ?auto_373196 ?auto_373200 ) ) ( not ( = ?auto_373196 ?auto_373201 ) ) ( not ( = ?auto_373196 ?auto_373202 ) ) ( not ( = ?auto_373196 ?auto_373203 ) ) ( not ( = ?auto_373196 ?auto_373204 ) ) ( not ( = ?auto_373196 ?auto_373205 ) ) ( not ( = ?auto_373196 ?auto_373206 ) ) ( not ( = ?auto_373196 ?auto_373207 ) ) ( not ( = ?auto_373197 ?auto_373198 ) ) ( not ( = ?auto_373197 ?auto_373199 ) ) ( not ( = ?auto_373197 ?auto_373200 ) ) ( not ( = ?auto_373197 ?auto_373201 ) ) ( not ( = ?auto_373197 ?auto_373202 ) ) ( not ( = ?auto_373197 ?auto_373203 ) ) ( not ( = ?auto_373197 ?auto_373204 ) ) ( not ( = ?auto_373197 ?auto_373205 ) ) ( not ( = ?auto_373197 ?auto_373206 ) ) ( not ( = ?auto_373197 ?auto_373207 ) ) ( not ( = ?auto_373198 ?auto_373199 ) ) ( not ( = ?auto_373198 ?auto_373200 ) ) ( not ( = ?auto_373198 ?auto_373201 ) ) ( not ( = ?auto_373198 ?auto_373202 ) ) ( not ( = ?auto_373198 ?auto_373203 ) ) ( not ( = ?auto_373198 ?auto_373204 ) ) ( not ( = ?auto_373198 ?auto_373205 ) ) ( not ( = ?auto_373198 ?auto_373206 ) ) ( not ( = ?auto_373198 ?auto_373207 ) ) ( not ( = ?auto_373199 ?auto_373200 ) ) ( not ( = ?auto_373199 ?auto_373201 ) ) ( not ( = ?auto_373199 ?auto_373202 ) ) ( not ( = ?auto_373199 ?auto_373203 ) ) ( not ( = ?auto_373199 ?auto_373204 ) ) ( not ( = ?auto_373199 ?auto_373205 ) ) ( not ( = ?auto_373199 ?auto_373206 ) ) ( not ( = ?auto_373199 ?auto_373207 ) ) ( not ( = ?auto_373200 ?auto_373201 ) ) ( not ( = ?auto_373200 ?auto_373202 ) ) ( not ( = ?auto_373200 ?auto_373203 ) ) ( not ( = ?auto_373200 ?auto_373204 ) ) ( not ( = ?auto_373200 ?auto_373205 ) ) ( not ( = ?auto_373200 ?auto_373206 ) ) ( not ( = ?auto_373200 ?auto_373207 ) ) ( not ( = ?auto_373201 ?auto_373202 ) ) ( not ( = ?auto_373201 ?auto_373203 ) ) ( not ( = ?auto_373201 ?auto_373204 ) ) ( not ( = ?auto_373201 ?auto_373205 ) ) ( not ( = ?auto_373201 ?auto_373206 ) ) ( not ( = ?auto_373201 ?auto_373207 ) ) ( not ( = ?auto_373202 ?auto_373203 ) ) ( not ( = ?auto_373202 ?auto_373204 ) ) ( not ( = ?auto_373202 ?auto_373205 ) ) ( not ( = ?auto_373202 ?auto_373206 ) ) ( not ( = ?auto_373202 ?auto_373207 ) ) ( not ( = ?auto_373203 ?auto_373204 ) ) ( not ( = ?auto_373203 ?auto_373205 ) ) ( not ( = ?auto_373203 ?auto_373206 ) ) ( not ( = ?auto_373203 ?auto_373207 ) ) ( not ( = ?auto_373204 ?auto_373205 ) ) ( not ( = ?auto_373204 ?auto_373206 ) ) ( not ( = ?auto_373204 ?auto_373207 ) ) ( not ( = ?auto_373205 ?auto_373206 ) ) ( not ( = ?auto_373205 ?auto_373207 ) ) ( not ( = ?auto_373206 ?auto_373207 ) ) ( ON ?auto_373205 ?auto_373206 ) ( ON ?auto_373204 ?auto_373205 ) ( ON ?auto_373203 ?auto_373204 ) ( ON ?auto_373202 ?auto_373203 ) ( ON ?auto_373201 ?auto_373202 ) ( ON ?auto_373200 ?auto_373201 ) ( ON ?auto_373199 ?auto_373200 ) ( ON ?auto_373198 ?auto_373199 ) ( ON ?auto_373197 ?auto_373198 ) ( ON ?auto_373196 ?auto_373197 ) ( CLEAR ?auto_373196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_373196 )
      ( MAKE-11PILE ?auto_373196 ?auto_373197 ?auto_373198 ?auto_373199 ?auto_373200 ?auto_373201 ?auto_373202 ?auto_373203 ?auto_373204 ?auto_373205 ?auto_373206 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373220 - BLOCK
      ?auto_373221 - BLOCK
      ?auto_373222 - BLOCK
      ?auto_373223 - BLOCK
      ?auto_373224 - BLOCK
      ?auto_373225 - BLOCK
      ?auto_373226 - BLOCK
      ?auto_373227 - BLOCK
      ?auto_373228 - BLOCK
      ?auto_373229 - BLOCK
      ?auto_373230 - BLOCK
      ?auto_373231 - BLOCK
    )
    :vars
    (
      ?auto_373232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_373230 ) ( ON ?auto_373231 ?auto_373232 ) ( CLEAR ?auto_373231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_373220 ) ( ON ?auto_373221 ?auto_373220 ) ( ON ?auto_373222 ?auto_373221 ) ( ON ?auto_373223 ?auto_373222 ) ( ON ?auto_373224 ?auto_373223 ) ( ON ?auto_373225 ?auto_373224 ) ( ON ?auto_373226 ?auto_373225 ) ( ON ?auto_373227 ?auto_373226 ) ( ON ?auto_373228 ?auto_373227 ) ( ON ?auto_373229 ?auto_373228 ) ( ON ?auto_373230 ?auto_373229 ) ( not ( = ?auto_373220 ?auto_373221 ) ) ( not ( = ?auto_373220 ?auto_373222 ) ) ( not ( = ?auto_373220 ?auto_373223 ) ) ( not ( = ?auto_373220 ?auto_373224 ) ) ( not ( = ?auto_373220 ?auto_373225 ) ) ( not ( = ?auto_373220 ?auto_373226 ) ) ( not ( = ?auto_373220 ?auto_373227 ) ) ( not ( = ?auto_373220 ?auto_373228 ) ) ( not ( = ?auto_373220 ?auto_373229 ) ) ( not ( = ?auto_373220 ?auto_373230 ) ) ( not ( = ?auto_373220 ?auto_373231 ) ) ( not ( = ?auto_373220 ?auto_373232 ) ) ( not ( = ?auto_373221 ?auto_373222 ) ) ( not ( = ?auto_373221 ?auto_373223 ) ) ( not ( = ?auto_373221 ?auto_373224 ) ) ( not ( = ?auto_373221 ?auto_373225 ) ) ( not ( = ?auto_373221 ?auto_373226 ) ) ( not ( = ?auto_373221 ?auto_373227 ) ) ( not ( = ?auto_373221 ?auto_373228 ) ) ( not ( = ?auto_373221 ?auto_373229 ) ) ( not ( = ?auto_373221 ?auto_373230 ) ) ( not ( = ?auto_373221 ?auto_373231 ) ) ( not ( = ?auto_373221 ?auto_373232 ) ) ( not ( = ?auto_373222 ?auto_373223 ) ) ( not ( = ?auto_373222 ?auto_373224 ) ) ( not ( = ?auto_373222 ?auto_373225 ) ) ( not ( = ?auto_373222 ?auto_373226 ) ) ( not ( = ?auto_373222 ?auto_373227 ) ) ( not ( = ?auto_373222 ?auto_373228 ) ) ( not ( = ?auto_373222 ?auto_373229 ) ) ( not ( = ?auto_373222 ?auto_373230 ) ) ( not ( = ?auto_373222 ?auto_373231 ) ) ( not ( = ?auto_373222 ?auto_373232 ) ) ( not ( = ?auto_373223 ?auto_373224 ) ) ( not ( = ?auto_373223 ?auto_373225 ) ) ( not ( = ?auto_373223 ?auto_373226 ) ) ( not ( = ?auto_373223 ?auto_373227 ) ) ( not ( = ?auto_373223 ?auto_373228 ) ) ( not ( = ?auto_373223 ?auto_373229 ) ) ( not ( = ?auto_373223 ?auto_373230 ) ) ( not ( = ?auto_373223 ?auto_373231 ) ) ( not ( = ?auto_373223 ?auto_373232 ) ) ( not ( = ?auto_373224 ?auto_373225 ) ) ( not ( = ?auto_373224 ?auto_373226 ) ) ( not ( = ?auto_373224 ?auto_373227 ) ) ( not ( = ?auto_373224 ?auto_373228 ) ) ( not ( = ?auto_373224 ?auto_373229 ) ) ( not ( = ?auto_373224 ?auto_373230 ) ) ( not ( = ?auto_373224 ?auto_373231 ) ) ( not ( = ?auto_373224 ?auto_373232 ) ) ( not ( = ?auto_373225 ?auto_373226 ) ) ( not ( = ?auto_373225 ?auto_373227 ) ) ( not ( = ?auto_373225 ?auto_373228 ) ) ( not ( = ?auto_373225 ?auto_373229 ) ) ( not ( = ?auto_373225 ?auto_373230 ) ) ( not ( = ?auto_373225 ?auto_373231 ) ) ( not ( = ?auto_373225 ?auto_373232 ) ) ( not ( = ?auto_373226 ?auto_373227 ) ) ( not ( = ?auto_373226 ?auto_373228 ) ) ( not ( = ?auto_373226 ?auto_373229 ) ) ( not ( = ?auto_373226 ?auto_373230 ) ) ( not ( = ?auto_373226 ?auto_373231 ) ) ( not ( = ?auto_373226 ?auto_373232 ) ) ( not ( = ?auto_373227 ?auto_373228 ) ) ( not ( = ?auto_373227 ?auto_373229 ) ) ( not ( = ?auto_373227 ?auto_373230 ) ) ( not ( = ?auto_373227 ?auto_373231 ) ) ( not ( = ?auto_373227 ?auto_373232 ) ) ( not ( = ?auto_373228 ?auto_373229 ) ) ( not ( = ?auto_373228 ?auto_373230 ) ) ( not ( = ?auto_373228 ?auto_373231 ) ) ( not ( = ?auto_373228 ?auto_373232 ) ) ( not ( = ?auto_373229 ?auto_373230 ) ) ( not ( = ?auto_373229 ?auto_373231 ) ) ( not ( = ?auto_373229 ?auto_373232 ) ) ( not ( = ?auto_373230 ?auto_373231 ) ) ( not ( = ?auto_373230 ?auto_373232 ) ) ( not ( = ?auto_373231 ?auto_373232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_373231 ?auto_373232 )
      ( !STACK ?auto_373231 ?auto_373230 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373245 - BLOCK
      ?auto_373246 - BLOCK
      ?auto_373247 - BLOCK
      ?auto_373248 - BLOCK
      ?auto_373249 - BLOCK
      ?auto_373250 - BLOCK
      ?auto_373251 - BLOCK
      ?auto_373252 - BLOCK
      ?auto_373253 - BLOCK
      ?auto_373254 - BLOCK
      ?auto_373255 - BLOCK
      ?auto_373256 - BLOCK
    )
    :vars
    (
      ?auto_373257 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_373255 ) ( ON ?auto_373256 ?auto_373257 ) ( CLEAR ?auto_373256 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_373245 ) ( ON ?auto_373246 ?auto_373245 ) ( ON ?auto_373247 ?auto_373246 ) ( ON ?auto_373248 ?auto_373247 ) ( ON ?auto_373249 ?auto_373248 ) ( ON ?auto_373250 ?auto_373249 ) ( ON ?auto_373251 ?auto_373250 ) ( ON ?auto_373252 ?auto_373251 ) ( ON ?auto_373253 ?auto_373252 ) ( ON ?auto_373254 ?auto_373253 ) ( ON ?auto_373255 ?auto_373254 ) ( not ( = ?auto_373245 ?auto_373246 ) ) ( not ( = ?auto_373245 ?auto_373247 ) ) ( not ( = ?auto_373245 ?auto_373248 ) ) ( not ( = ?auto_373245 ?auto_373249 ) ) ( not ( = ?auto_373245 ?auto_373250 ) ) ( not ( = ?auto_373245 ?auto_373251 ) ) ( not ( = ?auto_373245 ?auto_373252 ) ) ( not ( = ?auto_373245 ?auto_373253 ) ) ( not ( = ?auto_373245 ?auto_373254 ) ) ( not ( = ?auto_373245 ?auto_373255 ) ) ( not ( = ?auto_373245 ?auto_373256 ) ) ( not ( = ?auto_373245 ?auto_373257 ) ) ( not ( = ?auto_373246 ?auto_373247 ) ) ( not ( = ?auto_373246 ?auto_373248 ) ) ( not ( = ?auto_373246 ?auto_373249 ) ) ( not ( = ?auto_373246 ?auto_373250 ) ) ( not ( = ?auto_373246 ?auto_373251 ) ) ( not ( = ?auto_373246 ?auto_373252 ) ) ( not ( = ?auto_373246 ?auto_373253 ) ) ( not ( = ?auto_373246 ?auto_373254 ) ) ( not ( = ?auto_373246 ?auto_373255 ) ) ( not ( = ?auto_373246 ?auto_373256 ) ) ( not ( = ?auto_373246 ?auto_373257 ) ) ( not ( = ?auto_373247 ?auto_373248 ) ) ( not ( = ?auto_373247 ?auto_373249 ) ) ( not ( = ?auto_373247 ?auto_373250 ) ) ( not ( = ?auto_373247 ?auto_373251 ) ) ( not ( = ?auto_373247 ?auto_373252 ) ) ( not ( = ?auto_373247 ?auto_373253 ) ) ( not ( = ?auto_373247 ?auto_373254 ) ) ( not ( = ?auto_373247 ?auto_373255 ) ) ( not ( = ?auto_373247 ?auto_373256 ) ) ( not ( = ?auto_373247 ?auto_373257 ) ) ( not ( = ?auto_373248 ?auto_373249 ) ) ( not ( = ?auto_373248 ?auto_373250 ) ) ( not ( = ?auto_373248 ?auto_373251 ) ) ( not ( = ?auto_373248 ?auto_373252 ) ) ( not ( = ?auto_373248 ?auto_373253 ) ) ( not ( = ?auto_373248 ?auto_373254 ) ) ( not ( = ?auto_373248 ?auto_373255 ) ) ( not ( = ?auto_373248 ?auto_373256 ) ) ( not ( = ?auto_373248 ?auto_373257 ) ) ( not ( = ?auto_373249 ?auto_373250 ) ) ( not ( = ?auto_373249 ?auto_373251 ) ) ( not ( = ?auto_373249 ?auto_373252 ) ) ( not ( = ?auto_373249 ?auto_373253 ) ) ( not ( = ?auto_373249 ?auto_373254 ) ) ( not ( = ?auto_373249 ?auto_373255 ) ) ( not ( = ?auto_373249 ?auto_373256 ) ) ( not ( = ?auto_373249 ?auto_373257 ) ) ( not ( = ?auto_373250 ?auto_373251 ) ) ( not ( = ?auto_373250 ?auto_373252 ) ) ( not ( = ?auto_373250 ?auto_373253 ) ) ( not ( = ?auto_373250 ?auto_373254 ) ) ( not ( = ?auto_373250 ?auto_373255 ) ) ( not ( = ?auto_373250 ?auto_373256 ) ) ( not ( = ?auto_373250 ?auto_373257 ) ) ( not ( = ?auto_373251 ?auto_373252 ) ) ( not ( = ?auto_373251 ?auto_373253 ) ) ( not ( = ?auto_373251 ?auto_373254 ) ) ( not ( = ?auto_373251 ?auto_373255 ) ) ( not ( = ?auto_373251 ?auto_373256 ) ) ( not ( = ?auto_373251 ?auto_373257 ) ) ( not ( = ?auto_373252 ?auto_373253 ) ) ( not ( = ?auto_373252 ?auto_373254 ) ) ( not ( = ?auto_373252 ?auto_373255 ) ) ( not ( = ?auto_373252 ?auto_373256 ) ) ( not ( = ?auto_373252 ?auto_373257 ) ) ( not ( = ?auto_373253 ?auto_373254 ) ) ( not ( = ?auto_373253 ?auto_373255 ) ) ( not ( = ?auto_373253 ?auto_373256 ) ) ( not ( = ?auto_373253 ?auto_373257 ) ) ( not ( = ?auto_373254 ?auto_373255 ) ) ( not ( = ?auto_373254 ?auto_373256 ) ) ( not ( = ?auto_373254 ?auto_373257 ) ) ( not ( = ?auto_373255 ?auto_373256 ) ) ( not ( = ?auto_373255 ?auto_373257 ) ) ( not ( = ?auto_373256 ?auto_373257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_373256 ?auto_373257 )
      ( !STACK ?auto_373256 ?auto_373255 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373270 - BLOCK
      ?auto_373271 - BLOCK
      ?auto_373272 - BLOCK
      ?auto_373273 - BLOCK
      ?auto_373274 - BLOCK
      ?auto_373275 - BLOCK
      ?auto_373276 - BLOCK
      ?auto_373277 - BLOCK
      ?auto_373278 - BLOCK
      ?auto_373279 - BLOCK
      ?auto_373280 - BLOCK
      ?auto_373281 - BLOCK
    )
    :vars
    (
      ?auto_373282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373281 ?auto_373282 ) ( ON-TABLE ?auto_373270 ) ( ON ?auto_373271 ?auto_373270 ) ( ON ?auto_373272 ?auto_373271 ) ( ON ?auto_373273 ?auto_373272 ) ( ON ?auto_373274 ?auto_373273 ) ( ON ?auto_373275 ?auto_373274 ) ( ON ?auto_373276 ?auto_373275 ) ( ON ?auto_373277 ?auto_373276 ) ( ON ?auto_373278 ?auto_373277 ) ( ON ?auto_373279 ?auto_373278 ) ( not ( = ?auto_373270 ?auto_373271 ) ) ( not ( = ?auto_373270 ?auto_373272 ) ) ( not ( = ?auto_373270 ?auto_373273 ) ) ( not ( = ?auto_373270 ?auto_373274 ) ) ( not ( = ?auto_373270 ?auto_373275 ) ) ( not ( = ?auto_373270 ?auto_373276 ) ) ( not ( = ?auto_373270 ?auto_373277 ) ) ( not ( = ?auto_373270 ?auto_373278 ) ) ( not ( = ?auto_373270 ?auto_373279 ) ) ( not ( = ?auto_373270 ?auto_373280 ) ) ( not ( = ?auto_373270 ?auto_373281 ) ) ( not ( = ?auto_373270 ?auto_373282 ) ) ( not ( = ?auto_373271 ?auto_373272 ) ) ( not ( = ?auto_373271 ?auto_373273 ) ) ( not ( = ?auto_373271 ?auto_373274 ) ) ( not ( = ?auto_373271 ?auto_373275 ) ) ( not ( = ?auto_373271 ?auto_373276 ) ) ( not ( = ?auto_373271 ?auto_373277 ) ) ( not ( = ?auto_373271 ?auto_373278 ) ) ( not ( = ?auto_373271 ?auto_373279 ) ) ( not ( = ?auto_373271 ?auto_373280 ) ) ( not ( = ?auto_373271 ?auto_373281 ) ) ( not ( = ?auto_373271 ?auto_373282 ) ) ( not ( = ?auto_373272 ?auto_373273 ) ) ( not ( = ?auto_373272 ?auto_373274 ) ) ( not ( = ?auto_373272 ?auto_373275 ) ) ( not ( = ?auto_373272 ?auto_373276 ) ) ( not ( = ?auto_373272 ?auto_373277 ) ) ( not ( = ?auto_373272 ?auto_373278 ) ) ( not ( = ?auto_373272 ?auto_373279 ) ) ( not ( = ?auto_373272 ?auto_373280 ) ) ( not ( = ?auto_373272 ?auto_373281 ) ) ( not ( = ?auto_373272 ?auto_373282 ) ) ( not ( = ?auto_373273 ?auto_373274 ) ) ( not ( = ?auto_373273 ?auto_373275 ) ) ( not ( = ?auto_373273 ?auto_373276 ) ) ( not ( = ?auto_373273 ?auto_373277 ) ) ( not ( = ?auto_373273 ?auto_373278 ) ) ( not ( = ?auto_373273 ?auto_373279 ) ) ( not ( = ?auto_373273 ?auto_373280 ) ) ( not ( = ?auto_373273 ?auto_373281 ) ) ( not ( = ?auto_373273 ?auto_373282 ) ) ( not ( = ?auto_373274 ?auto_373275 ) ) ( not ( = ?auto_373274 ?auto_373276 ) ) ( not ( = ?auto_373274 ?auto_373277 ) ) ( not ( = ?auto_373274 ?auto_373278 ) ) ( not ( = ?auto_373274 ?auto_373279 ) ) ( not ( = ?auto_373274 ?auto_373280 ) ) ( not ( = ?auto_373274 ?auto_373281 ) ) ( not ( = ?auto_373274 ?auto_373282 ) ) ( not ( = ?auto_373275 ?auto_373276 ) ) ( not ( = ?auto_373275 ?auto_373277 ) ) ( not ( = ?auto_373275 ?auto_373278 ) ) ( not ( = ?auto_373275 ?auto_373279 ) ) ( not ( = ?auto_373275 ?auto_373280 ) ) ( not ( = ?auto_373275 ?auto_373281 ) ) ( not ( = ?auto_373275 ?auto_373282 ) ) ( not ( = ?auto_373276 ?auto_373277 ) ) ( not ( = ?auto_373276 ?auto_373278 ) ) ( not ( = ?auto_373276 ?auto_373279 ) ) ( not ( = ?auto_373276 ?auto_373280 ) ) ( not ( = ?auto_373276 ?auto_373281 ) ) ( not ( = ?auto_373276 ?auto_373282 ) ) ( not ( = ?auto_373277 ?auto_373278 ) ) ( not ( = ?auto_373277 ?auto_373279 ) ) ( not ( = ?auto_373277 ?auto_373280 ) ) ( not ( = ?auto_373277 ?auto_373281 ) ) ( not ( = ?auto_373277 ?auto_373282 ) ) ( not ( = ?auto_373278 ?auto_373279 ) ) ( not ( = ?auto_373278 ?auto_373280 ) ) ( not ( = ?auto_373278 ?auto_373281 ) ) ( not ( = ?auto_373278 ?auto_373282 ) ) ( not ( = ?auto_373279 ?auto_373280 ) ) ( not ( = ?auto_373279 ?auto_373281 ) ) ( not ( = ?auto_373279 ?auto_373282 ) ) ( not ( = ?auto_373280 ?auto_373281 ) ) ( not ( = ?auto_373280 ?auto_373282 ) ) ( not ( = ?auto_373281 ?auto_373282 ) ) ( CLEAR ?auto_373279 ) ( ON ?auto_373280 ?auto_373281 ) ( CLEAR ?auto_373280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_373270 ?auto_373271 ?auto_373272 ?auto_373273 ?auto_373274 ?auto_373275 ?auto_373276 ?auto_373277 ?auto_373278 ?auto_373279 ?auto_373280 )
      ( MAKE-12PILE ?auto_373270 ?auto_373271 ?auto_373272 ?auto_373273 ?auto_373274 ?auto_373275 ?auto_373276 ?auto_373277 ?auto_373278 ?auto_373279 ?auto_373280 ?auto_373281 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373295 - BLOCK
      ?auto_373296 - BLOCK
      ?auto_373297 - BLOCK
      ?auto_373298 - BLOCK
      ?auto_373299 - BLOCK
      ?auto_373300 - BLOCK
      ?auto_373301 - BLOCK
      ?auto_373302 - BLOCK
      ?auto_373303 - BLOCK
      ?auto_373304 - BLOCK
      ?auto_373305 - BLOCK
      ?auto_373306 - BLOCK
    )
    :vars
    (
      ?auto_373307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373306 ?auto_373307 ) ( ON-TABLE ?auto_373295 ) ( ON ?auto_373296 ?auto_373295 ) ( ON ?auto_373297 ?auto_373296 ) ( ON ?auto_373298 ?auto_373297 ) ( ON ?auto_373299 ?auto_373298 ) ( ON ?auto_373300 ?auto_373299 ) ( ON ?auto_373301 ?auto_373300 ) ( ON ?auto_373302 ?auto_373301 ) ( ON ?auto_373303 ?auto_373302 ) ( ON ?auto_373304 ?auto_373303 ) ( not ( = ?auto_373295 ?auto_373296 ) ) ( not ( = ?auto_373295 ?auto_373297 ) ) ( not ( = ?auto_373295 ?auto_373298 ) ) ( not ( = ?auto_373295 ?auto_373299 ) ) ( not ( = ?auto_373295 ?auto_373300 ) ) ( not ( = ?auto_373295 ?auto_373301 ) ) ( not ( = ?auto_373295 ?auto_373302 ) ) ( not ( = ?auto_373295 ?auto_373303 ) ) ( not ( = ?auto_373295 ?auto_373304 ) ) ( not ( = ?auto_373295 ?auto_373305 ) ) ( not ( = ?auto_373295 ?auto_373306 ) ) ( not ( = ?auto_373295 ?auto_373307 ) ) ( not ( = ?auto_373296 ?auto_373297 ) ) ( not ( = ?auto_373296 ?auto_373298 ) ) ( not ( = ?auto_373296 ?auto_373299 ) ) ( not ( = ?auto_373296 ?auto_373300 ) ) ( not ( = ?auto_373296 ?auto_373301 ) ) ( not ( = ?auto_373296 ?auto_373302 ) ) ( not ( = ?auto_373296 ?auto_373303 ) ) ( not ( = ?auto_373296 ?auto_373304 ) ) ( not ( = ?auto_373296 ?auto_373305 ) ) ( not ( = ?auto_373296 ?auto_373306 ) ) ( not ( = ?auto_373296 ?auto_373307 ) ) ( not ( = ?auto_373297 ?auto_373298 ) ) ( not ( = ?auto_373297 ?auto_373299 ) ) ( not ( = ?auto_373297 ?auto_373300 ) ) ( not ( = ?auto_373297 ?auto_373301 ) ) ( not ( = ?auto_373297 ?auto_373302 ) ) ( not ( = ?auto_373297 ?auto_373303 ) ) ( not ( = ?auto_373297 ?auto_373304 ) ) ( not ( = ?auto_373297 ?auto_373305 ) ) ( not ( = ?auto_373297 ?auto_373306 ) ) ( not ( = ?auto_373297 ?auto_373307 ) ) ( not ( = ?auto_373298 ?auto_373299 ) ) ( not ( = ?auto_373298 ?auto_373300 ) ) ( not ( = ?auto_373298 ?auto_373301 ) ) ( not ( = ?auto_373298 ?auto_373302 ) ) ( not ( = ?auto_373298 ?auto_373303 ) ) ( not ( = ?auto_373298 ?auto_373304 ) ) ( not ( = ?auto_373298 ?auto_373305 ) ) ( not ( = ?auto_373298 ?auto_373306 ) ) ( not ( = ?auto_373298 ?auto_373307 ) ) ( not ( = ?auto_373299 ?auto_373300 ) ) ( not ( = ?auto_373299 ?auto_373301 ) ) ( not ( = ?auto_373299 ?auto_373302 ) ) ( not ( = ?auto_373299 ?auto_373303 ) ) ( not ( = ?auto_373299 ?auto_373304 ) ) ( not ( = ?auto_373299 ?auto_373305 ) ) ( not ( = ?auto_373299 ?auto_373306 ) ) ( not ( = ?auto_373299 ?auto_373307 ) ) ( not ( = ?auto_373300 ?auto_373301 ) ) ( not ( = ?auto_373300 ?auto_373302 ) ) ( not ( = ?auto_373300 ?auto_373303 ) ) ( not ( = ?auto_373300 ?auto_373304 ) ) ( not ( = ?auto_373300 ?auto_373305 ) ) ( not ( = ?auto_373300 ?auto_373306 ) ) ( not ( = ?auto_373300 ?auto_373307 ) ) ( not ( = ?auto_373301 ?auto_373302 ) ) ( not ( = ?auto_373301 ?auto_373303 ) ) ( not ( = ?auto_373301 ?auto_373304 ) ) ( not ( = ?auto_373301 ?auto_373305 ) ) ( not ( = ?auto_373301 ?auto_373306 ) ) ( not ( = ?auto_373301 ?auto_373307 ) ) ( not ( = ?auto_373302 ?auto_373303 ) ) ( not ( = ?auto_373302 ?auto_373304 ) ) ( not ( = ?auto_373302 ?auto_373305 ) ) ( not ( = ?auto_373302 ?auto_373306 ) ) ( not ( = ?auto_373302 ?auto_373307 ) ) ( not ( = ?auto_373303 ?auto_373304 ) ) ( not ( = ?auto_373303 ?auto_373305 ) ) ( not ( = ?auto_373303 ?auto_373306 ) ) ( not ( = ?auto_373303 ?auto_373307 ) ) ( not ( = ?auto_373304 ?auto_373305 ) ) ( not ( = ?auto_373304 ?auto_373306 ) ) ( not ( = ?auto_373304 ?auto_373307 ) ) ( not ( = ?auto_373305 ?auto_373306 ) ) ( not ( = ?auto_373305 ?auto_373307 ) ) ( not ( = ?auto_373306 ?auto_373307 ) ) ( CLEAR ?auto_373304 ) ( ON ?auto_373305 ?auto_373306 ) ( CLEAR ?auto_373305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_373295 ?auto_373296 ?auto_373297 ?auto_373298 ?auto_373299 ?auto_373300 ?auto_373301 ?auto_373302 ?auto_373303 ?auto_373304 ?auto_373305 )
      ( MAKE-12PILE ?auto_373295 ?auto_373296 ?auto_373297 ?auto_373298 ?auto_373299 ?auto_373300 ?auto_373301 ?auto_373302 ?auto_373303 ?auto_373304 ?auto_373305 ?auto_373306 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373320 - BLOCK
      ?auto_373321 - BLOCK
      ?auto_373322 - BLOCK
      ?auto_373323 - BLOCK
      ?auto_373324 - BLOCK
      ?auto_373325 - BLOCK
      ?auto_373326 - BLOCK
      ?auto_373327 - BLOCK
      ?auto_373328 - BLOCK
      ?auto_373329 - BLOCK
      ?auto_373330 - BLOCK
      ?auto_373331 - BLOCK
    )
    :vars
    (
      ?auto_373332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373331 ?auto_373332 ) ( ON-TABLE ?auto_373320 ) ( ON ?auto_373321 ?auto_373320 ) ( ON ?auto_373322 ?auto_373321 ) ( ON ?auto_373323 ?auto_373322 ) ( ON ?auto_373324 ?auto_373323 ) ( ON ?auto_373325 ?auto_373324 ) ( ON ?auto_373326 ?auto_373325 ) ( ON ?auto_373327 ?auto_373326 ) ( ON ?auto_373328 ?auto_373327 ) ( not ( = ?auto_373320 ?auto_373321 ) ) ( not ( = ?auto_373320 ?auto_373322 ) ) ( not ( = ?auto_373320 ?auto_373323 ) ) ( not ( = ?auto_373320 ?auto_373324 ) ) ( not ( = ?auto_373320 ?auto_373325 ) ) ( not ( = ?auto_373320 ?auto_373326 ) ) ( not ( = ?auto_373320 ?auto_373327 ) ) ( not ( = ?auto_373320 ?auto_373328 ) ) ( not ( = ?auto_373320 ?auto_373329 ) ) ( not ( = ?auto_373320 ?auto_373330 ) ) ( not ( = ?auto_373320 ?auto_373331 ) ) ( not ( = ?auto_373320 ?auto_373332 ) ) ( not ( = ?auto_373321 ?auto_373322 ) ) ( not ( = ?auto_373321 ?auto_373323 ) ) ( not ( = ?auto_373321 ?auto_373324 ) ) ( not ( = ?auto_373321 ?auto_373325 ) ) ( not ( = ?auto_373321 ?auto_373326 ) ) ( not ( = ?auto_373321 ?auto_373327 ) ) ( not ( = ?auto_373321 ?auto_373328 ) ) ( not ( = ?auto_373321 ?auto_373329 ) ) ( not ( = ?auto_373321 ?auto_373330 ) ) ( not ( = ?auto_373321 ?auto_373331 ) ) ( not ( = ?auto_373321 ?auto_373332 ) ) ( not ( = ?auto_373322 ?auto_373323 ) ) ( not ( = ?auto_373322 ?auto_373324 ) ) ( not ( = ?auto_373322 ?auto_373325 ) ) ( not ( = ?auto_373322 ?auto_373326 ) ) ( not ( = ?auto_373322 ?auto_373327 ) ) ( not ( = ?auto_373322 ?auto_373328 ) ) ( not ( = ?auto_373322 ?auto_373329 ) ) ( not ( = ?auto_373322 ?auto_373330 ) ) ( not ( = ?auto_373322 ?auto_373331 ) ) ( not ( = ?auto_373322 ?auto_373332 ) ) ( not ( = ?auto_373323 ?auto_373324 ) ) ( not ( = ?auto_373323 ?auto_373325 ) ) ( not ( = ?auto_373323 ?auto_373326 ) ) ( not ( = ?auto_373323 ?auto_373327 ) ) ( not ( = ?auto_373323 ?auto_373328 ) ) ( not ( = ?auto_373323 ?auto_373329 ) ) ( not ( = ?auto_373323 ?auto_373330 ) ) ( not ( = ?auto_373323 ?auto_373331 ) ) ( not ( = ?auto_373323 ?auto_373332 ) ) ( not ( = ?auto_373324 ?auto_373325 ) ) ( not ( = ?auto_373324 ?auto_373326 ) ) ( not ( = ?auto_373324 ?auto_373327 ) ) ( not ( = ?auto_373324 ?auto_373328 ) ) ( not ( = ?auto_373324 ?auto_373329 ) ) ( not ( = ?auto_373324 ?auto_373330 ) ) ( not ( = ?auto_373324 ?auto_373331 ) ) ( not ( = ?auto_373324 ?auto_373332 ) ) ( not ( = ?auto_373325 ?auto_373326 ) ) ( not ( = ?auto_373325 ?auto_373327 ) ) ( not ( = ?auto_373325 ?auto_373328 ) ) ( not ( = ?auto_373325 ?auto_373329 ) ) ( not ( = ?auto_373325 ?auto_373330 ) ) ( not ( = ?auto_373325 ?auto_373331 ) ) ( not ( = ?auto_373325 ?auto_373332 ) ) ( not ( = ?auto_373326 ?auto_373327 ) ) ( not ( = ?auto_373326 ?auto_373328 ) ) ( not ( = ?auto_373326 ?auto_373329 ) ) ( not ( = ?auto_373326 ?auto_373330 ) ) ( not ( = ?auto_373326 ?auto_373331 ) ) ( not ( = ?auto_373326 ?auto_373332 ) ) ( not ( = ?auto_373327 ?auto_373328 ) ) ( not ( = ?auto_373327 ?auto_373329 ) ) ( not ( = ?auto_373327 ?auto_373330 ) ) ( not ( = ?auto_373327 ?auto_373331 ) ) ( not ( = ?auto_373327 ?auto_373332 ) ) ( not ( = ?auto_373328 ?auto_373329 ) ) ( not ( = ?auto_373328 ?auto_373330 ) ) ( not ( = ?auto_373328 ?auto_373331 ) ) ( not ( = ?auto_373328 ?auto_373332 ) ) ( not ( = ?auto_373329 ?auto_373330 ) ) ( not ( = ?auto_373329 ?auto_373331 ) ) ( not ( = ?auto_373329 ?auto_373332 ) ) ( not ( = ?auto_373330 ?auto_373331 ) ) ( not ( = ?auto_373330 ?auto_373332 ) ) ( not ( = ?auto_373331 ?auto_373332 ) ) ( ON ?auto_373330 ?auto_373331 ) ( CLEAR ?auto_373328 ) ( ON ?auto_373329 ?auto_373330 ) ( CLEAR ?auto_373329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_373320 ?auto_373321 ?auto_373322 ?auto_373323 ?auto_373324 ?auto_373325 ?auto_373326 ?auto_373327 ?auto_373328 ?auto_373329 )
      ( MAKE-12PILE ?auto_373320 ?auto_373321 ?auto_373322 ?auto_373323 ?auto_373324 ?auto_373325 ?auto_373326 ?auto_373327 ?auto_373328 ?auto_373329 ?auto_373330 ?auto_373331 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373345 - BLOCK
      ?auto_373346 - BLOCK
      ?auto_373347 - BLOCK
      ?auto_373348 - BLOCK
      ?auto_373349 - BLOCK
      ?auto_373350 - BLOCK
      ?auto_373351 - BLOCK
      ?auto_373352 - BLOCK
      ?auto_373353 - BLOCK
      ?auto_373354 - BLOCK
      ?auto_373355 - BLOCK
      ?auto_373356 - BLOCK
    )
    :vars
    (
      ?auto_373357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373356 ?auto_373357 ) ( ON-TABLE ?auto_373345 ) ( ON ?auto_373346 ?auto_373345 ) ( ON ?auto_373347 ?auto_373346 ) ( ON ?auto_373348 ?auto_373347 ) ( ON ?auto_373349 ?auto_373348 ) ( ON ?auto_373350 ?auto_373349 ) ( ON ?auto_373351 ?auto_373350 ) ( ON ?auto_373352 ?auto_373351 ) ( ON ?auto_373353 ?auto_373352 ) ( not ( = ?auto_373345 ?auto_373346 ) ) ( not ( = ?auto_373345 ?auto_373347 ) ) ( not ( = ?auto_373345 ?auto_373348 ) ) ( not ( = ?auto_373345 ?auto_373349 ) ) ( not ( = ?auto_373345 ?auto_373350 ) ) ( not ( = ?auto_373345 ?auto_373351 ) ) ( not ( = ?auto_373345 ?auto_373352 ) ) ( not ( = ?auto_373345 ?auto_373353 ) ) ( not ( = ?auto_373345 ?auto_373354 ) ) ( not ( = ?auto_373345 ?auto_373355 ) ) ( not ( = ?auto_373345 ?auto_373356 ) ) ( not ( = ?auto_373345 ?auto_373357 ) ) ( not ( = ?auto_373346 ?auto_373347 ) ) ( not ( = ?auto_373346 ?auto_373348 ) ) ( not ( = ?auto_373346 ?auto_373349 ) ) ( not ( = ?auto_373346 ?auto_373350 ) ) ( not ( = ?auto_373346 ?auto_373351 ) ) ( not ( = ?auto_373346 ?auto_373352 ) ) ( not ( = ?auto_373346 ?auto_373353 ) ) ( not ( = ?auto_373346 ?auto_373354 ) ) ( not ( = ?auto_373346 ?auto_373355 ) ) ( not ( = ?auto_373346 ?auto_373356 ) ) ( not ( = ?auto_373346 ?auto_373357 ) ) ( not ( = ?auto_373347 ?auto_373348 ) ) ( not ( = ?auto_373347 ?auto_373349 ) ) ( not ( = ?auto_373347 ?auto_373350 ) ) ( not ( = ?auto_373347 ?auto_373351 ) ) ( not ( = ?auto_373347 ?auto_373352 ) ) ( not ( = ?auto_373347 ?auto_373353 ) ) ( not ( = ?auto_373347 ?auto_373354 ) ) ( not ( = ?auto_373347 ?auto_373355 ) ) ( not ( = ?auto_373347 ?auto_373356 ) ) ( not ( = ?auto_373347 ?auto_373357 ) ) ( not ( = ?auto_373348 ?auto_373349 ) ) ( not ( = ?auto_373348 ?auto_373350 ) ) ( not ( = ?auto_373348 ?auto_373351 ) ) ( not ( = ?auto_373348 ?auto_373352 ) ) ( not ( = ?auto_373348 ?auto_373353 ) ) ( not ( = ?auto_373348 ?auto_373354 ) ) ( not ( = ?auto_373348 ?auto_373355 ) ) ( not ( = ?auto_373348 ?auto_373356 ) ) ( not ( = ?auto_373348 ?auto_373357 ) ) ( not ( = ?auto_373349 ?auto_373350 ) ) ( not ( = ?auto_373349 ?auto_373351 ) ) ( not ( = ?auto_373349 ?auto_373352 ) ) ( not ( = ?auto_373349 ?auto_373353 ) ) ( not ( = ?auto_373349 ?auto_373354 ) ) ( not ( = ?auto_373349 ?auto_373355 ) ) ( not ( = ?auto_373349 ?auto_373356 ) ) ( not ( = ?auto_373349 ?auto_373357 ) ) ( not ( = ?auto_373350 ?auto_373351 ) ) ( not ( = ?auto_373350 ?auto_373352 ) ) ( not ( = ?auto_373350 ?auto_373353 ) ) ( not ( = ?auto_373350 ?auto_373354 ) ) ( not ( = ?auto_373350 ?auto_373355 ) ) ( not ( = ?auto_373350 ?auto_373356 ) ) ( not ( = ?auto_373350 ?auto_373357 ) ) ( not ( = ?auto_373351 ?auto_373352 ) ) ( not ( = ?auto_373351 ?auto_373353 ) ) ( not ( = ?auto_373351 ?auto_373354 ) ) ( not ( = ?auto_373351 ?auto_373355 ) ) ( not ( = ?auto_373351 ?auto_373356 ) ) ( not ( = ?auto_373351 ?auto_373357 ) ) ( not ( = ?auto_373352 ?auto_373353 ) ) ( not ( = ?auto_373352 ?auto_373354 ) ) ( not ( = ?auto_373352 ?auto_373355 ) ) ( not ( = ?auto_373352 ?auto_373356 ) ) ( not ( = ?auto_373352 ?auto_373357 ) ) ( not ( = ?auto_373353 ?auto_373354 ) ) ( not ( = ?auto_373353 ?auto_373355 ) ) ( not ( = ?auto_373353 ?auto_373356 ) ) ( not ( = ?auto_373353 ?auto_373357 ) ) ( not ( = ?auto_373354 ?auto_373355 ) ) ( not ( = ?auto_373354 ?auto_373356 ) ) ( not ( = ?auto_373354 ?auto_373357 ) ) ( not ( = ?auto_373355 ?auto_373356 ) ) ( not ( = ?auto_373355 ?auto_373357 ) ) ( not ( = ?auto_373356 ?auto_373357 ) ) ( ON ?auto_373355 ?auto_373356 ) ( CLEAR ?auto_373353 ) ( ON ?auto_373354 ?auto_373355 ) ( CLEAR ?auto_373354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_373345 ?auto_373346 ?auto_373347 ?auto_373348 ?auto_373349 ?auto_373350 ?auto_373351 ?auto_373352 ?auto_373353 ?auto_373354 )
      ( MAKE-12PILE ?auto_373345 ?auto_373346 ?auto_373347 ?auto_373348 ?auto_373349 ?auto_373350 ?auto_373351 ?auto_373352 ?auto_373353 ?auto_373354 ?auto_373355 ?auto_373356 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373370 - BLOCK
      ?auto_373371 - BLOCK
      ?auto_373372 - BLOCK
      ?auto_373373 - BLOCK
      ?auto_373374 - BLOCK
      ?auto_373375 - BLOCK
      ?auto_373376 - BLOCK
      ?auto_373377 - BLOCK
      ?auto_373378 - BLOCK
      ?auto_373379 - BLOCK
      ?auto_373380 - BLOCK
      ?auto_373381 - BLOCK
    )
    :vars
    (
      ?auto_373382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373381 ?auto_373382 ) ( ON-TABLE ?auto_373370 ) ( ON ?auto_373371 ?auto_373370 ) ( ON ?auto_373372 ?auto_373371 ) ( ON ?auto_373373 ?auto_373372 ) ( ON ?auto_373374 ?auto_373373 ) ( ON ?auto_373375 ?auto_373374 ) ( ON ?auto_373376 ?auto_373375 ) ( ON ?auto_373377 ?auto_373376 ) ( not ( = ?auto_373370 ?auto_373371 ) ) ( not ( = ?auto_373370 ?auto_373372 ) ) ( not ( = ?auto_373370 ?auto_373373 ) ) ( not ( = ?auto_373370 ?auto_373374 ) ) ( not ( = ?auto_373370 ?auto_373375 ) ) ( not ( = ?auto_373370 ?auto_373376 ) ) ( not ( = ?auto_373370 ?auto_373377 ) ) ( not ( = ?auto_373370 ?auto_373378 ) ) ( not ( = ?auto_373370 ?auto_373379 ) ) ( not ( = ?auto_373370 ?auto_373380 ) ) ( not ( = ?auto_373370 ?auto_373381 ) ) ( not ( = ?auto_373370 ?auto_373382 ) ) ( not ( = ?auto_373371 ?auto_373372 ) ) ( not ( = ?auto_373371 ?auto_373373 ) ) ( not ( = ?auto_373371 ?auto_373374 ) ) ( not ( = ?auto_373371 ?auto_373375 ) ) ( not ( = ?auto_373371 ?auto_373376 ) ) ( not ( = ?auto_373371 ?auto_373377 ) ) ( not ( = ?auto_373371 ?auto_373378 ) ) ( not ( = ?auto_373371 ?auto_373379 ) ) ( not ( = ?auto_373371 ?auto_373380 ) ) ( not ( = ?auto_373371 ?auto_373381 ) ) ( not ( = ?auto_373371 ?auto_373382 ) ) ( not ( = ?auto_373372 ?auto_373373 ) ) ( not ( = ?auto_373372 ?auto_373374 ) ) ( not ( = ?auto_373372 ?auto_373375 ) ) ( not ( = ?auto_373372 ?auto_373376 ) ) ( not ( = ?auto_373372 ?auto_373377 ) ) ( not ( = ?auto_373372 ?auto_373378 ) ) ( not ( = ?auto_373372 ?auto_373379 ) ) ( not ( = ?auto_373372 ?auto_373380 ) ) ( not ( = ?auto_373372 ?auto_373381 ) ) ( not ( = ?auto_373372 ?auto_373382 ) ) ( not ( = ?auto_373373 ?auto_373374 ) ) ( not ( = ?auto_373373 ?auto_373375 ) ) ( not ( = ?auto_373373 ?auto_373376 ) ) ( not ( = ?auto_373373 ?auto_373377 ) ) ( not ( = ?auto_373373 ?auto_373378 ) ) ( not ( = ?auto_373373 ?auto_373379 ) ) ( not ( = ?auto_373373 ?auto_373380 ) ) ( not ( = ?auto_373373 ?auto_373381 ) ) ( not ( = ?auto_373373 ?auto_373382 ) ) ( not ( = ?auto_373374 ?auto_373375 ) ) ( not ( = ?auto_373374 ?auto_373376 ) ) ( not ( = ?auto_373374 ?auto_373377 ) ) ( not ( = ?auto_373374 ?auto_373378 ) ) ( not ( = ?auto_373374 ?auto_373379 ) ) ( not ( = ?auto_373374 ?auto_373380 ) ) ( not ( = ?auto_373374 ?auto_373381 ) ) ( not ( = ?auto_373374 ?auto_373382 ) ) ( not ( = ?auto_373375 ?auto_373376 ) ) ( not ( = ?auto_373375 ?auto_373377 ) ) ( not ( = ?auto_373375 ?auto_373378 ) ) ( not ( = ?auto_373375 ?auto_373379 ) ) ( not ( = ?auto_373375 ?auto_373380 ) ) ( not ( = ?auto_373375 ?auto_373381 ) ) ( not ( = ?auto_373375 ?auto_373382 ) ) ( not ( = ?auto_373376 ?auto_373377 ) ) ( not ( = ?auto_373376 ?auto_373378 ) ) ( not ( = ?auto_373376 ?auto_373379 ) ) ( not ( = ?auto_373376 ?auto_373380 ) ) ( not ( = ?auto_373376 ?auto_373381 ) ) ( not ( = ?auto_373376 ?auto_373382 ) ) ( not ( = ?auto_373377 ?auto_373378 ) ) ( not ( = ?auto_373377 ?auto_373379 ) ) ( not ( = ?auto_373377 ?auto_373380 ) ) ( not ( = ?auto_373377 ?auto_373381 ) ) ( not ( = ?auto_373377 ?auto_373382 ) ) ( not ( = ?auto_373378 ?auto_373379 ) ) ( not ( = ?auto_373378 ?auto_373380 ) ) ( not ( = ?auto_373378 ?auto_373381 ) ) ( not ( = ?auto_373378 ?auto_373382 ) ) ( not ( = ?auto_373379 ?auto_373380 ) ) ( not ( = ?auto_373379 ?auto_373381 ) ) ( not ( = ?auto_373379 ?auto_373382 ) ) ( not ( = ?auto_373380 ?auto_373381 ) ) ( not ( = ?auto_373380 ?auto_373382 ) ) ( not ( = ?auto_373381 ?auto_373382 ) ) ( ON ?auto_373380 ?auto_373381 ) ( ON ?auto_373379 ?auto_373380 ) ( CLEAR ?auto_373377 ) ( ON ?auto_373378 ?auto_373379 ) ( CLEAR ?auto_373378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_373370 ?auto_373371 ?auto_373372 ?auto_373373 ?auto_373374 ?auto_373375 ?auto_373376 ?auto_373377 ?auto_373378 )
      ( MAKE-12PILE ?auto_373370 ?auto_373371 ?auto_373372 ?auto_373373 ?auto_373374 ?auto_373375 ?auto_373376 ?auto_373377 ?auto_373378 ?auto_373379 ?auto_373380 ?auto_373381 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373395 - BLOCK
      ?auto_373396 - BLOCK
      ?auto_373397 - BLOCK
      ?auto_373398 - BLOCK
      ?auto_373399 - BLOCK
      ?auto_373400 - BLOCK
      ?auto_373401 - BLOCK
      ?auto_373402 - BLOCK
      ?auto_373403 - BLOCK
      ?auto_373404 - BLOCK
      ?auto_373405 - BLOCK
      ?auto_373406 - BLOCK
    )
    :vars
    (
      ?auto_373407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373406 ?auto_373407 ) ( ON-TABLE ?auto_373395 ) ( ON ?auto_373396 ?auto_373395 ) ( ON ?auto_373397 ?auto_373396 ) ( ON ?auto_373398 ?auto_373397 ) ( ON ?auto_373399 ?auto_373398 ) ( ON ?auto_373400 ?auto_373399 ) ( ON ?auto_373401 ?auto_373400 ) ( ON ?auto_373402 ?auto_373401 ) ( not ( = ?auto_373395 ?auto_373396 ) ) ( not ( = ?auto_373395 ?auto_373397 ) ) ( not ( = ?auto_373395 ?auto_373398 ) ) ( not ( = ?auto_373395 ?auto_373399 ) ) ( not ( = ?auto_373395 ?auto_373400 ) ) ( not ( = ?auto_373395 ?auto_373401 ) ) ( not ( = ?auto_373395 ?auto_373402 ) ) ( not ( = ?auto_373395 ?auto_373403 ) ) ( not ( = ?auto_373395 ?auto_373404 ) ) ( not ( = ?auto_373395 ?auto_373405 ) ) ( not ( = ?auto_373395 ?auto_373406 ) ) ( not ( = ?auto_373395 ?auto_373407 ) ) ( not ( = ?auto_373396 ?auto_373397 ) ) ( not ( = ?auto_373396 ?auto_373398 ) ) ( not ( = ?auto_373396 ?auto_373399 ) ) ( not ( = ?auto_373396 ?auto_373400 ) ) ( not ( = ?auto_373396 ?auto_373401 ) ) ( not ( = ?auto_373396 ?auto_373402 ) ) ( not ( = ?auto_373396 ?auto_373403 ) ) ( not ( = ?auto_373396 ?auto_373404 ) ) ( not ( = ?auto_373396 ?auto_373405 ) ) ( not ( = ?auto_373396 ?auto_373406 ) ) ( not ( = ?auto_373396 ?auto_373407 ) ) ( not ( = ?auto_373397 ?auto_373398 ) ) ( not ( = ?auto_373397 ?auto_373399 ) ) ( not ( = ?auto_373397 ?auto_373400 ) ) ( not ( = ?auto_373397 ?auto_373401 ) ) ( not ( = ?auto_373397 ?auto_373402 ) ) ( not ( = ?auto_373397 ?auto_373403 ) ) ( not ( = ?auto_373397 ?auto_373404 ) ) ( not ( = ?auto_373397 ?auto_373405 ) ) ( not ( = ?auto_373397 ?auto_373406 ) ) ( not ( = ?auto_373397 ?auto_373407 ) ) ( not ( = ?auto_373398 ?auto_373399 ) ) ( not ( = ?auto_373398 ?auto_373400 ) ) ( not ( = ?auto_373398 ?auto_373401 ) ) ( not ( = ?auto_373398 ?auto_373402 ) ) ( not ( = ?auto_373398 ?auto_373403 ) ) ( not ( = ?auto_373398 ?auto_373404 ) ) ( not ( = ?auto_373398 ?auto_373405 ) ) ( not ( = ?auto_373398 ?auto_373406 ) ) ( not ( = ?auto_373398 ?auto_373407 ) ) ( not ( = ?auto_373399 ?auto_373400 ) ) ( not ( = ?auto_373399 ?auto_373401 ) ) ( not ( = ?auto_373399 ?auto_373402 ) ) ( not ( = ?auto_373399 ?auto_373403 ) ) ( not ( = ?auto_373399 ?auto_373404 ) ) ( not ( = ?auto_373399 ?auto_373405 ) ) ( not ( = ?auto_373399 ?auto_373406 ) ) ( not ( = ?auto_373399 ?auto_373407 ) ) ( not ( = ?auto_373400 ?auto_373401 ) ) ( not ( = ?auto_373400 ?auto_373402 ) ) ( not ( = ?auto_373400 ?auto_373403 ) ) ( not ( = ?auto_373400 ?auto_373404 ) ) ( not ( = ?auto_373400 ?auto_373405 ) ) ( not ( = ?auto_373400 ?auto_373406 ) ) ( not ( = ?auto_373400 ?auto_373407 ) ) ( not ( = ?auto_373401 ?auto_373402 ) ) ( not ( = ?auto_373401 ?auto_373403 ) ) ( not ( = ?auto_373401 ?auto_373404 ) ) ( not ( = ?auto_373401 ?auto_373405 ) ) ( not ( = ?auto_373401 ?auto_373406 ) ) ( not ( = ?auto_373401 ?auto_373407 ) ) ( not ( = ?auto_373402 ?auto_373403 ) ) ( not ( = ?auto_373402 ?auto_373404 ) ) ( not ( = ?auto_373402 ?auto_373405 ) ) ( not ( = ?auto_373402 ?auto_373406 ) ) ( not ( = ?auto_373402 ?auto_373407 ) ) ( not ( = ?auto_373403 ?auto_373404 ) ) ( not ( = ?auto_373403 ?auto_373405 ) ) ( not ( = ?auto_373403 ?auto_373406 ) ) ( not ( = ?auto_373403 ?auto_373407 ) ) ( not ( = ?auto_373404 ?auto_373405 ) ) ( not ( = ?auto_373404 ?auto_373406 ) ) ( not ( = ?auto_373404 ?auto_373407 ) ) ( not ( = ?auto_373405 ?auto_373406 ) ) ( not ( = ?auto_373405 ?auto_373407 ) ) ( not ( = ?auto_373406 ?auto_373407 ) ) ( ON ?auto_373405 ?auto_373406 ) ( ON ?auto_373404 ?auto_373405 ) ( CLEAR ?auto_373402 ) ( ON ?auto_373403 ?auto_373404 ) ( CLEAR ?auto_373403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_373395 ?auto_373396 ?auto_373397 ?auto_373398 ?auto_373399 ?auto_373400 ?auto_373401 ?auto_373402 ?auto_373403 )
      ( MAKE-12PILE ?auto_373395 ?auto_373396 ?auto_373397 ?auto_373398 ?auto_373399 ?auto_373400 ?auto_373401 ?auto_373402 ?auto_373403 ?auto_373404 ?auto_373405 ?auto_373406 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373420 - BLOCK
      ?auto_373421 - BLOCK
      ?auto_373422 - BLOCK
      ?auto_373423 - BLOCK
      ?auto_373424 - BLOCK
      ?auto_373425 - BLOCK
      ?auto_373426 - BLOCK
      ?auto_373427 - BLOCK
      ?auto_373428 - BLOCK
      ?auto_373429 - BLOCK
      ?auto_373430 - BLOCK
      ?auto_373431 - BLOCK
    )
    :vars
    (
      ?auto_373432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373431 ?auto_373432 ) ( ON-TABLE ?auto_373420 ) ( ON ?auto_373421 ?auto_373420 ) ( ON ?auto_373422 ?auto_373421 ) ( ON ?auto_373423 ?auto_373422 ) ( ON ?auto_373424 ?auto_373423 ) ( ON ?auto_373425 ?auto_373424 ) ( ON ?auto_373426 ?auto_373425 ) ( not ( = ?auto_373420 ?auto_373421 ) ) ( not ( = ?auto_373420 ?auto_373422 ) ) ( not ( = ?auto_373420 ?auto_373423 ) ) ( not ( = ?auto_373420 ?auto_373424 ) ) ( not ( = ?auto_373420 ?auto_373425 ) ) ( not ( = ?auto_373420 ?auto_373426 ) ) ( not ( = ?auto_373420 ?auto_373427 ) ) ( not ( = ?auto_373420 ?auto_373428 ) ) ( not ( = ?auto_373420 ?auto_373429 ) ) ( not ( = ?auto_373420 ?auto_373430 ) ) ( not ( = ?auto_373420 ?auto_373431 ) ) ( not ( = ?auto_373420 ?auto_373432 ) ) ( not ( = ?auto_373421 ?auto_373422 ) ) ( not ( = ?auto_373421 ?auto_373423 ) ) ( not ( = ?auto_373421 ?auto_373424 ) ) ( not ( = ?auto_373421 ?auto_373425 ) ) ( not ( = ?auto_373421 ?auto_373426 ) ) ( not ( = ?auto_373421 ?auto_373427 ) ) ( not ( = ?auto_373421 ?auto_373428 ) ) ( not ( = ?auto_373421 ?auto_373429 ) ) ( not ( = ?auto_373421 ?auto_373430 ) ) ( not ( = ?auto_373421 ?auto_373431 ) ) ( not ( = ?auto_373421 ?auto_373432 ) ) ( not ( = ?auto_373422 ?auto_373423 ) ) ( not ( = ?auto_373422 ?auto_373424 ) ) ( not ( = ?auto_373422 ?auto_373425 ) ) ( not ( = ?auto_373422 ?auto_373426 ) ) ( not ( = ?auto_373422 ?auto_373427 ) ) ( not ( = ?auto_373422 ?auto_373428 ) ) ( not ( = ?auto_373422 ?auto_373429 ) ) ( not ( = ?auto_373422 ?auto_373430 ) ) ( not ( = ?auto_373422 ?auto_373431 ) ) ( not ( = ?auto_373422 ?auto_373432 ) ) ( not ( = ?auto_373423 ?auto_373424 ) ) ( not ( = ?auto_373423 ?auto_373425 ) ) ( not ( = ?auto_373423 ?auto_373426 ) ) ( not ( = ?auto_373423 ?auto_373427 ) ) ( not ( = ?auto_373423 ?auto_373428 ) ) ( not ( = ?auto_373423 ?auto_373429 ) ) ( not ( = ?auto_373423 ?auto_373430 ) ) ( not ( = ?auto_373423 ?auto_373431 ) ) ( not ( = ?auto_373423 ?auto_373432 ) ) ( not ( = ?auto_373424 ?auto_373425 ) ) ( not ( = ?auto_373424 ?auto_373426 ) ) ( not ( = ?auto_373424 ?auto_373427 ) ) ( not ( = ?auto_373424 ?auto_373428 ) ) ( not ( = ?auto_373424 ?auto_373429 ) ) ( not ( = ?auto_373424 ?auto_373430 ) ) ( not ( = ?auto_373424 ?auto_373431 ) ) ( not ( = ?auto_373424 ?auto_373432 ) ) ( not ( = ?auto_373425 ?auto_373426 ) ) ( not ( = ?auto_373425 ?auto_373427 ) ) ( not ( = ?auto_373425 ?auto_373428 ) ) ( not ( = ?auto_373425 ?auto_373429 ) ) ( not ( = ?auto_373425 ?auto_373430 ) ) ( not ( = ?auto_373425 ?auto_373431 ) ) ( not ( = ?auto_373425 ?auto_373432 ) ) ( not ( = ?auto_373426 ?auto_373427 ) ) ( not ( = ?auto_373426 ?auto_373428 ) ) ( not ( = ?auto_373426 ?auto_373429 ) ) ( not ( = ?auto_373426 ?auto_373430 ) ) ( not ( = ?auto_373426 ?auto_373431 ) ) ( not ( = ?auto_373426 ?auto_373432 ) ) ( not ( = ?auto_373427 ?auto_373428 ) ) ( not ( = ?auto_373427 ?auto_373429 ) ) ( not ( = ?auto_373427 ?auto_373430 ) ) ( not ( = ?auto_373427 ?auto_373431 ) ) ( not ( = ?auto_373427 ?auto_373432 ) ) ( not ( = ?auto_373428 ?auto_373429 ) ) ( not ( = ?auto_373428 ?auto_373430 ) ) ( not ( = ?auto_373428 ?auto_373431 ) ) ( not ( = ?auto_373428 ?auto_373432 ) ) ( not ( = ?auto_373429 ?auto_373430 ) ) ( not ( = ?auto_373429 ?auto_373431 ) ) ( not ( = ?auto_373429 ?auto_373432 ) ) ( not ( = ?auto_373430 ?auto_373431 ) ) ( not ( = ?auto_373430 ?auto_373432 ) ) ( not ( = ?auto_373431 ?auto_373432 ) ) ( ON ?auto_373430 ?auto_373431 ) ( ON ?auto_373429 ?auto_373430 ) ( ON ?auto_373428 ?auto_373429 ) ( CLEAR ?auto_373426 ) ( ON ?auto_373427 ?auto_373428 ) ( CLEAR ?auto_373427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_373420 ?auto_373421 ?auto_373422 ?auto_373423 ?auto_373424 ?auto_373425 ?auto_373426 ?auto_373427 )
      ( MAKE-12PILE ?auto_373420 ?auto_373421 ?auto_373422 ?auto_373423 ?auto_373424 ?auto_373425 ?auto_373426 ?auto_373427 ?auto_373428 ?auto_373429 ?auto_373430 ?auto_373431 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373445 - BLOCK
      ?auto_373446 - BLOCK
      ?auto_373447 - BLOCK
      ?auto_373448 - BLOCK
      ?auto_373449 - BLOCK
      ?auto_373450 - BLOCK
      ?auto_373451 - BLOCK
      ?auto_373452 - BLOCK
      ?auto_373453 - BLOCK
      ?auto_373454 - BLOCK
      ?auto_373455 - BLOCK
      ?auto_373456 - BLOCK
    )
    :vars
    (
      ?auto_373457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373456 ?auto_373457 ) ( ON-TABLE ?auto_373445 ) ( ON ?auto_373446 ?auto_373445 ) ( ON ?auto_373447 ?auto_373446 ) ( ON ?auto_373448 ?auto_373447 ) ( ON ?auto_373449 ?auto_373448 ) ( ON ?auto_373450 ?auto_373449 ) ( ON ?auto_373451 ?auto_373450 ) ( not ( = ?auto_373445 ?auto_373446 ) ) ( not ( = ?auto_373445 ?auto_373447 ) ) ( not ( = ?auto_373445 ?auto_373448 ) ) ( not ( = ?auto_373445 ?auto_373449 ) ) ( not ( = ?auto_373445 ?auto_373450 ) ) ( not ( = ?auto_373445 ?auto_373451 ) ) ( not ( = ?auto_373445 ?auto_373452 ) ) ( not ( = ?auto_373445 ?auto_373453 ) ) ( not ( = ?auto_373445 ?auto_373454 ) ) ( not ( = ?auto_373445 ?auto_373455 ) ) ( not ( = ?auto_373445 ?auto_373456 ) ) ( not ( = ?auto_373445 ?auto_373457 ) ) ( not ( = ?auto_373446 ?auto_373447 ) ) ( not ( = ?auto_373446 ?auto_373448 ) ) ( not ( = ?auto_373446 ?auto_373449 ) ) ( not ( = ?auto_373446 ?auto_373450 ) ) ( not ( = ?auto_373446 ?auto_373451 ) ) ( not ( = ?auto_373446 ?auto_373452 ) ) ( not ( = ?auto_373446 ?auto_373453 ) ) ( not ( = ?auto_373446 ?auto_373454 ) ) ( not ( = ?auto_373446 ?auto_373455 ) ) ( not ( = ?auto_373446 ?auto_373456 ) ) ( not ( = ?auto_373446 ?auto_373457 ) ) ( not ( = ?auto_373447 ?auto_373448 ) ) ( not ( = ?auto_373447 ?auto_373449 ) ) ( not ( = ?auto_373447 ?auto_373450 ) ) ( not ( = ?auto_373447 ?auto_373451 ) ) ( not ( = ?auto_373447 ?auto_373452 ) ) ( not ( = ?auto_373447 ?auto_373453 ) ) ( not ( = ?auto_373447 ?auto_373454 ) ) ( not ( = ?auto_373447 ?auto_373455 ) ) ( not ( = ?auto_373447 ?auto_373456 ) ) ( not ( = ?auto_373447 ?auto_373457 ) ) ( not ( = ?auto_373448 ?auto_373449 ) ) ( not ( = ?auto_373448 ?auto_373450 ) ) ( not ( = ?auto_373448 ?auto_373451 ) ) ( not ( = ?auto_373448 ?auto_373452 ) ) ( not ( = ?auto_373448 ?auto_373453 ) ) ( not ( = ?auto_373448 ?auto_373454 ) ) ( not ( = ?auto_373448 ?auto_373455 ) ) ( not ( = ?auto_373448 ?auto_373456 ) ) ( not ( = ?auto_373448 ?auto_373457 ) ) ( not ( = ?auto_373449 ?auto_373450 ) ) ( not ( = ?auto_373449 ?auto_373451 ) ) ( not ( = ?auto_373449 ?auto_373452 ) ) ( not ( = ?auto_373449 ?auto_373453 ) ) ( not ( = ?auto_373449 ?auto_373454 ) ) ( not ( = ?auto_373449 ?auto_373455 ) ) ( not ( = ?auto_373449 ?auto_373456 ) ) ( not ( = ?auto_373449 ?auto_373457 ) ) ( not ( = ?auto_373450 ?auto_373451 ) ) ( not ( = ?auto_373450 ?auto_373452 ) ) ( not ( = ?auto_373450 ?auto_373453 ) ) ( not ( = ?auto_373450 ?auto_373454 ) ) ( not ( = ?auto_373450 ?auto_373455 ) ) ( not ( = ?auto_373450 ?auto_373456 ) ) ( not ( = ?auto_373450 ?auto_373457 ) ) ( not ( = ?auto_373451 ?auto_373452 ) ) ( not ( = ?auto_373451 ?auto_373453 ) ) ( not ( = ?auto_373451 ?auto_373454 ) ) ( not ( = ?auto_373451 ?auto_373455 ) ) ( not ( = ?auto_373451 ?auto_373456 ) ) ( not ( = ?auto_373451 ?auto_373457 ) ) ( not ( = ?auto_373452 ?auto_373453 ) ) ( not ( = ?auto_373452 ?auto_373454 ) ) ( not ( = ?auto_373452 ?auto_373455 ) ) ( not ( = ?auto_373452 ?auto_373456 ) ) ( not ( = ?auto_373452 ?auto_373457 ) ) ( not ( = ?auto_373453 ?auto_373454 ) ) ( not ( = ?auto_373453 ?auto_373455 ) ) ( not ( = ?auto_373453 ?auto_373456 ) ) ( not ( = ?auto_373453 ?auto_373457 ) ) ( not ( = ?auto_373454 ?auto_373455 ) ) ( not ( = ?auto_373454 ?auto_373456 ) ) ( not ( = ?auto_373454 ?auto_373457 ) ) ( not ( = ?auto_373455 ?auto_373456 ) ) ( not ( = ?auto_373455 ?auto_373457 ) ) ( not ( = ?auto_373456 ?auto_373457 ) ) ( ON ?auto_373455 ?auto_373456 ) ( ON ?auto_373454 ?auto_373455 ) ( ON ?auto_373453 ?auto_373454 ) ( CLEAR ?auto_373451 ) ( ON ?auto_373452 ?auto_373453 ) ( CLEAR ?auto_373452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_373445 ?auto_373446 ?auto_373447 ?auto_373448 ?auto_373449 ?auto_373450 ?auto_373451 ?auto_373452 )
      ( MAKE-12PILE ?auto_373445 ?auto_373446 ?auto_373447 ?auto_373448 ?auto_373449 ?auto_373450 ?auto_373451 ?auto_373452 ?auto_373453 ?auto_373454 ?auto_373455 ?auto_373456 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373470 - BLOCK
      ?auto_373471 - BLOCK
      ?auto_373472 - BLOCK
      ?auto_373473 - BLOCK
      ?auto_373474 - BLOCK
      ?auto_373475 - BLOCK
      ?auto_373476 - BLOCK
      ?auto_373477 - BLOCK
      ?auto_373478 - BLOCK
      ?auto_373479 - BLOCK
      ?auto_373480 - BLOCK
      ?auto_373481 - BLOCK
    )
    :vars
    (
      ?auto_373482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373481 ?auto_373482 ) ( ON-TABLE ?auto_373470 ) ( ON ?auto_373471 ?auto_373470 ) ( ON ?auto_373472 ?auto_373471 ) ( ON ?auto_373473 ?auto_373472 ) ( ON ?auto_373474 ?auto_373473 ) ( ON ?auto_373475 ?auto_373474 ) ( not ( = ?auto_373470 ?auto_373471 ) ) ( not ( = ?auto_373470 ?auto_373472 ) ) ( not ( = ?auto_373470 ?auto_373473 ) ) ( not ( = ?auto_373470 ?auto_373474 ) ) ( not ( = ?auto_373470 ?auto_373475 ) ) ( not ( = ?auto_373470 ?auto_373476 ) ) ( not ( = ?auto_373470 ?auto_373477 ) ) ( not ( = ?auto_373470 ?auto_373478 ) ) ( not ( = ?auto_373470 ?auto_373479 ) ) ( not ( = ?auto_373470 ?auto_373480 ) ) ( not ( = ?auto_373470 ?auto_373481 ) ) ( not ( = ?auto_373470 ?auto_373482 ) ) ( not ( = ?auto_373471 ?auto_373472 ) ) ( not ( = ?auto_373471 ?auto_373473 ) ) ( not ( = ?auto_373471 ?auto_373474 ) ) ( not ( = ?auto_373471 ?auto_373475 ) ) ( not ( = ?auto_373471 ?auto_373476 ) ) ( not ( = ?auto_373471 ?auto_373477 ) ) ( not ( = ?auto_373471 ?auto_373478 ) ) ( not ( = ?auto_373471 ?auto_373479 ) ) ( not ( = ?auto_373471 ?auto_373480 ) ) ( not ( = ?auto_373471 ?auto_373481 ) ) ( not ( = ?auto_373471 ?auto_373482 ) ) ( not ( = ?auto_373472 ?auto_373473 ) ) ( not ( = ?auto_373472 ?auto_373474 ) ) ( not ( = ?auto_373472 ?auto_373475 ) ) ( not ( = ?auto_373472 ?auto_373476 ) ) ( not ( = ?auto_373472 ?auto_373477 ) ) ( not ( = ?auto_373472 ?auto_373478 ) ) ( not ( = ?auto_373472 ?auto_373479 ) ) ( not ( = ?auto_373472 ?auto_373480 ) ) ( not ( = ?auto_373472 ?auto_373481 ) ) ( not ( = ?auto_373472 ?auto_373482 ) ) ( not ( = ?auto_373473 ?auto_373474 ) ) ( not ( = ?auto_373473 ?auto_373475 ) ) ( not ( = ?auto_373473 ?auto_373476 ) ) ( not ( = ?auto_373473 ?auto_373477 ) ) ( not ( = ?auto_373473 ?auto_373478 ) ) ( not ( = ?auto_373473 ?auto_373479 ) ) ( not ( = ?auto_373473 ?auto_373480 ) ) ( not ( = ?auto_373473 ?auto_373481 ) ) ( not ( = ?auto_373473 ?auto_373482 ) ) ( not ( = ?auto_373474 ?auto_373475 ) ) ( not ( = ?auto_373474 ?auto_373476 ) ) ( not ( = ?auto_373474 ?auto_373477 ) ) ( not ( = ?auto_373474 ?auto_373478 ) ) ( not ( = ?auto_373474 ?auto_373479 ) ) ( not ( = ?auto_373474 ?auto_373480 ) ) ( not ( = ?auto_373474 ?auto_373481 ) ) ( not ( = ?auto_373474 ?auto_373482 ) ) ( not ( = ?auto_373475 ?auto_373476 ) ) ( not ( = ?auto_373475 ?auto_373477 ) ) ( not ( = ?auto_373475 ?auto_373478 ) ) ( not ( = ?auto_373475 ?auto_373479 ) ) ( not ( = ?auto_373475 ?auto_373480 ) ) ( not ( = ?auto_373475 ?auto_373481 ) ) ( not ( = ?auto_373475 ?auto_373482 ) ) ( not ( = ?auto_373476 ?auto_373477 ) ) ( not ( = ?auto_373476 ?auto_373478 ) ) ( not ( = ?auto_373476 ?auto_373479 ) ) ( not ( = ?auto_373476 ?auto_373480 ) ) ( not ( = ?auto_373476 ?auto_373481 ) ) ( not ( = ?auto_373476 ?auto_373482 ) ) ( not ( = ?auto_373477 ?auto_373478 ) ) ( not ( = ?auto_373477 ?auto_373479 ) ) ( not ( = ?auto_373477 ?auto_373480 ) ) ( not ( = ?auto_373477 ?auto_373481 ) ) ( not ( = ?auto_373477 ?auto_373482 ) ) ( not ( = ?auto_373478 ?auto_373479 ) ) ( not ( = ?auto_373478 ?auto_373480 ) ) ( not ( = ?auto_373478 ?auto_373481 ) ) ( not ( = ?auto_373478 ?auto_373482 ) ) ( not ( = ?auto_373479 ?auto_373480 ) ) ( not ( = ?auto_373479 ?auto_373481 ) ) ( not ( = ?auto_373479 ?auto_373482 ) ) ( not ( = ?auto_373480 ?auto_373481 ) ) ( not ( = ?auto_373480 ?auto_373482 ) ) ( not ( = ?auto_373481 ?auto_373482 ) ) ( ON ?auto_373480 ?auto_373481 ) ( ON ?auto_373479 ?auto_373480 ) ( ON ?auto_373478 ?auto_373479 ) ( ON ?auto_373477 ?auto_373478 ) ( CLEAR ?auto_373475 ) ( ON ?auto_373476 ?auto_373477 ) ( CLEAR ?auto_373476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_373470 ?auto_373471 ?auto_373472 ?auto_373473 ?auto_373474 ?auto_373475 ?auto_373476 )
      ( MAKE-12PILE ?auto_373470 ?auto_373471 ?auto_373472 ?auto_373473 ?auto_373474 ?auto_373475 ?auto_373476 ?auto_373477 ?auto_373478 ?auto_373479 ?auto_373480 ?auto_373481 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373495 - BLOCK
      ?auto_373496 - BLOCK
      ?auto_373497 - BLOCK
      ?auto_373498 - BLOCK
      ?auto_373499 - BLOCK
      ?auto_373500 - BLOCK
      ?auto_373501 - BLOCK
      ?auto_373502 - BLOCK
      ?auto_373503 - BLOCK
      ?auto_373504 - BLOCK
      ?auto_373505 - BLOCK
      ?auto_373506 - BLOCK
    )
    :vars
    (
      ?auto_373507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373506 ?auto_373507 ) ( ON-TABLE ?auto_373495 ) ( ON ?auto_373496 ?auto_373495 ) ( ON ?auto_373497 ?auto_373496 ) ( ON ?auto_373498 ?auto_373497 ) ( ON ?auto_373499 ?auto_373498 ) ( ON ?auto_373500 ?auto_373499 ) ( not ( = ?auto_373495 ?auto_373496 ) ) ( not ( = ?auto_373495 ?auto_373497 ) ) ( not ( = ?auto_373495 ?auto_373498 ) ) ( not ( = ?auto_373495 ?auto_373499 ) ) ( not ( = ?auto_373495 ?auto_373500 ) ) ( not ( = ?auto_373495 ?auto_373501 ) ) ( not ( = ?auto_373495 ?auto_373502 ) ) ( not ( = ?auto_373495 ?auto_373503 ) ) ( not ( = ?auto_373495 ?auto_373504 ) ) ( not ( = ?auto_373495 ?auto_373505 ) ) ( not ( = ?auto_373495 ?auto_373506 ) ) ( not ( = ?auto_373495 ?auto_373507 ) ) ( not ( = ?auto_373496 ?auto_373497 ) ) ( not ( = ?auto_373496 ?auto_373498 ) ) ( not ( = ?auto_373496 ?auto_373499 ) ) ( not ( = ?auto_373496 ?auto_373500 ) ) ( not ( = ?auto_373496 ?auto_373501 ) ) ( not ( = ?auto_373496 ?auto_373502 ) ) ( not ( = ?auto_373496 ?auto_373503 ) ) ( not ( = ?auto_373496 ?auto_373504 ) ) ( not ( = ?auto_373496 ?auto_373505 ) ) ( not ( = ?auto_373496 ?auto_373506 ) ) ( not ( = ?auto_373496 ?auto_373507 ) ) ( not ( = ?auto_373497 ?auto_373498 ) ) ( not ( = ?auto_373497 ?auto_373499 ) ) ( not ( = ?auto_373497 ?auto_373500 ) ) ( not ( = ?auto_373497 ?auto_373501 ) ) ( not ( = ?auto_373497 ?auto_373502 ) ) ( not ( = ?auto_373497 ?auto_373503 ) ) ( not ( = ?auto_373497 ?auto_373504 ) ) ( not ( = ?auto_373497 ?auto_373505 ) ) ( not ( = ?auto_373497 ?auto_373506 ) ) ( not ( = ?auto_373497 ?auto_373507 ) ) ( not ( = ?auto_373498 ?auto_373499 ) ) ( not ( = ?auto_373498 ?auto_373500 ) ) ( not ( = ?auto_373498 ?auto_373501 ) ) ( not ( = ?auto_373498 ?auto_373502 ) ) ( not ( = ?auto_373498 ?auto_373503 ) ) ( not ( = ?auto_373498 ?auto_373504 ) ) ( not ( = ?auto_373498 ?auto_373505 ) ) ( not ( = ?auto_373498 ?auto_373506 ) ) ( not ( = ?auto_373498 ?auto_373507 ) ) ( not ( = ?auto_373499 ?auto_373500 ) ) ( not ( = ?auto_373499 ?auto_373501 ) ) ( not ( = ?auto_373499 ?auto_373502 ) ) ( not ( = ?auto_373499 ?auto_373503 ) ) ( not ( = ?auto_373499 ?auto_373504 ) ) ( not ( = ?auto_373499 ?auto_373505 ) ) ( not ( = ?auto_373499 ?auto_373506 ) ) ( not ( = ?auto_373499 ?auto_373507 ) ) ( not ( = ?auto_373500 ?auto_373501 ) ) ( not ( = ?auto_373500 ?auto_373502 ) ) ( not ( = ?auto_373500 ?auto_373503 ) ) ( not ( = ?auto_373500 ?auto_373504 ) ) ( not ( = ?auto_373500 ?auto_373505 ) ) ( not ( = ?auto_373500 ?auto_373506 ) ) ( not ( = ?auto_373500 ?auto_373507 ) ) ( not ( = ?auto_373501 ?auto_373502 ) ) ( not ( = ?auto_373501 ?auto_373503 ) ) ( not ( = ?auto_373501 ?auto_373504 ) ) ( not ( = ?auto_373501 ?auto_373505 ) ) ( not ( = ?auto_373501 ?auto_373506 ) ) ( not ( = ?auto_373501 ?auto_373507 ) ) ( not ( = ?auto_373502 ?auto_373503 ) ) ( not ( = ?auto_373502 ?auto_373504 ) ) ( not ( = ?auto_373502 ?auto_373505 ) ) ( not ( = ?auto_373502 ?auto_373506 ) ) ( not ( = ?auto_373502 ?auto_373507 ) ) ( not ( = ?auto_373503 ?auto_373504 ) ) ( not ( = ?auto_373503 ?auto_373505 ) ) ( not ( = ?auto_373503 ?auto_373506 ) ) ( not ( = ?auto_373503 ?auto_373507 ) ) ( not ( = ?auto_373504 ?auto_373505 ) ) ( not ( = ?auto_373504 ?auto_373506 ) ) ( not ( = ?auto_373504 ?auto_373507 ) ) ( not ( = ?auto_373505 ?auto_373506 ) ) ( not ( = ?auto_373505 ?auto_373507 ) ) ( not ( = ?auto_373506 ?auto_373507 ) ) ( ON ?auto_373505 ?auto_373506 ) ( ON ?auto_373504 ?auto_373505 ) ( ON ?auto_373503 ?auto_373504 ) ( ON ?auto_373502 ?auto_373503 ) ( CLEAR ?auto_373500 ) ( ON ?auto_373501 ?auto_373502 ) ( CLEAR ?auto_373501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_373495 ?auto_373496 ?auto_373497 ?auto_373498 ?auto_373499 ?auto_373500 ?auto_373501 )
      ( MAKE-12PILE ?auto_373495 ?auto_373496 ?auto_373497 ?auto_373498 ?auto_373499 ?auto_373500 ?auto_373501 ?auto_373502 ?auto_373503 ?auto_373504 ?auto_373505 ?auto_373506 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373520 - BLOCK
      ?auto_373521 - BLOCK
      ?auto_373522 - BLOCK
      ?auto_373523 - BLOCK
      ?auto_373524 - BLOCK
      ?auto_373525 - BLOCK
      ?auto_373526 - BLOCK
      ?auto_373527 - BLOCK
      ?auto_373528 - BLOCK
      ?auto_373529 - BLOCK
      ?auto_373530 - BLOCK
      ?auto_373531 - BLOCK
    )
    :vars
    (
      ?auto_373532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373531 ?auto_373532 ) ( ON-TABLE ?auto_373520 ) ( ON ?auto_373521 ?auto_373520 ) ( ON ?auto_373522 ?auto_373521 ) ( ON ?auto_373523 ?auto_373522 ) ( ON ?auto_373524 ?auto_373523 ) ( not ( = ?auto_373520 ?auto_373521 ) ) ( not ( = ?auto_373520 ?auto_373522 ) ) ( not ( = ?auto_373520 ?auto_373523 ) ) ( not ( = ?auto_373520 ?auto_373524 ) ) ( not ( = ?auto_373520 ?auto_373525 ) ) ( not ( = ?auto_373520 ?auto_373526 ) ) ( not ( = ?auto_373520 ?auto_373527 ) ) ( not ( = ?auto_373520 ?auto_373528 ) ) ( not ( = ?auto_373520 ?auto_373529 ) ) ( not ( = ?auto_373520 ?auto_373530 ) ) ( not ( = ?auto_373520 ?auto_373531 ) ) ( not ( = ?auto_373520 ?auto_373532 ) ) ( not ( = ?auto_373521 ?auto_373522 ) ) ( not ( = ?auto_373521 ?auto_373523 ) ) ( not ( = ?auto_373521 ?auto_373524 ) ) ( not ( = ?auto_373521 ?auto_373525 ) ) ( not ( = ?auto_373521 ?auto_373526 ) ) ( not ( = ?auto_373521 ?auto_373527 ) ) ( not ( = ?auto_373521 ?auto_373528 ) ) ( not ( = ?auto_373521 ?auto_373529 ) ) ( not ( = ?auto_373521 ?auto_373530 ) ) ( not ( = ?auto_373521 ?auto_373531 ) ) ( not ( = ?auto_373521 ?auto_373532 ) ) ( not ( = ?auto_373522 ?auto_373523 ) ) ( not ( = ?auto_373522 ?auto_373524 ) ) ( not ( = ?auto_373522 ?auto_373525 ) ) ( not ( = ?auto_373522 ?auto_373526 ) ) ( not ( = ?auto_373522 ?auto_373527 ) ) ( not ( = ?auto_373522 ?auto_373528 ) ) ( not ( = ?auto_373522 ?auto_373529 ) ) ( not ( = ?auto_373522 ?auto_373530 ) ) ( not ( = ?auto_373522 ?auto_373531 ) ) ( not ( = ?auto_373522 ?auto_373532 ) ) ( not ( = ?auto_373523 ?auto_373524 ) ) ( not ( = ?auto_373523 ?auto_373525 ) ) ( not ( = ?auto_373523 ?auto_373526 ) ) ( not ( = ?auto_373523 ?auto_373527 ) ) ( not ( = ?auto_373523 ?auto_373528 ) ) ( not ( = ?auto_373523 ?auto_373529 ) ) ( not ( = ?auto_373523 ?auto_373530 ) ) ( not ( = ?auto_373523 ?auto_373531 ) ) ( not ( = ?auto_373523 ?auto_373532 ) ) ( not ( = ?auto_373524 ?auto_373525 ) ) ( not ( = ?auto_373524 ?auto_373526 ) ) ( not ( = ?auto_373524 ?auto_373527 ) ) ( not ( = ?auto_373524 ?auto_373528 ) ) ( not ( = ?auto_373524 ?auto_373529 ) ) ( not ( = ?auto_373524 ?auto_373530 ) ) ( not ( = ?auto_373524 ?auto_373531 ) ) ( not ( = ?auto_373524 ?auto_373532 ) ) ( not ( = ?auto_373525 ?auto_373526 ) ) ( not ( = ?auto_373525 ?auto_373527 ) ) ( not ( = ?auto_373525 ?auto_373528 ) ) ( not ( = ?auto_373525 ?auto_373529 ) ) ( not ( = ?auto_373525 ?auto_373530 ) ) ( not ( = ?auto_373525 ?auto_373531 ) ) ( not ( = ?auto_373525 ?auto_373532 ) ) ( not ( = ?auto_373526 ?auto_373527 ) ) ( not ( = ?auto_373526 ?auto_373528 ) ) ( not ( = ?auto_373526 ?auto_373529 ) ) ( not ( = ?auto_373526 ?auto_373530 ) ) ( not ( = ?auto_373526 ?auto_373531 ) ) ( not ( = ?auto_373526 ?auto_373532 ) ) ( not ( = ?auto_373527 ?auto_373528 ) ) ( not ( = ?auto_373527 ?auto_373529 ) ) ( not ( = ?auto_373527 ?auto_373530 ) ) ( not ( = ?auto_373527 ?auto_373531 ) ) ( not ( = ?auto_373527 ?auto_373532 ) ) ( not ( = ?auto_373528 ?auto_373529 ) ) ( not ( = ?auto_373528 ?auto_373530 ) ) ( not ( = ?auto_373528 ?auto_373531 ) ) ( not ( = ?auto_373528 ?auto_373532 ) ) ( not ( = ?auto_373529 ?auto_373530 ) ) ( not ( = ?auto_373529 ?auto_373531 ) ) ( not ( = ?auto_373529 ?auto_373532 ) ) ( not ( = ?auto_373530 ?auto_373531 ) ) ( not ( = ?auto_373530 ?auto_373532 ) ) ( not ( = ?auto_373531 ?auto_373532 ) ) ( ON ?auto_373530 ?auto_373531 ) ( ON ?auto_373529 ?auto_373530 ) ( ON ?auto_373528 ?auto_373529 ) ( ON ?auto_373527 ?auto_373528 ) ( ON ?auto_373526 ?auto_373527 ) ( CLEAR ?auto_373524 ) ( ON ?auto_373525 ?auto_373526 ) ( CLEAR ?auto_373525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_373520 ?auto_373521 ?auto_373522 ?auto_373523 ?auto_373524 ?auto_373525 )
      ( MAKE-12PILE ?auto_373520 ?auto_373521 ?auto_373522 ?auto_373523 ?auto_373524 ?auto_373525 ?auto_373526 ?auto_373527 ?auto_373528 ?auto_373529 ?auto_373530 ?auto_373531 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373545 - BLOCK
      ?auto_373546 - BLOCK
      ?auto_373547 - BLOCK
      ?auto_373548 - BLOCK
      ?auto_373549 - BLOCK
      ?auto_373550 - BLOCK
      ?auto_373551 - BLOCK
      ?auto_373552 - BLOCK
      ?auto_373553 - BLOCK
      ?auto_373554 - BLOCK
      ?auto_373555 - BLOCK
      ?auto_373556 - BLOCK
    )
    :vars
    (
      ?auto_373557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373556 ?auto_373557 ) ( ON-TABLE ?auto_373545 ) ( ON ?auto_373546 ?auto_373545 ) ( ON ?auto_373547 ?auto_373546 ) ( ON ?auto_373548 ?auto_373547 ) ( ON ?auto_373549 ?auto_373548 ) ( not ( = ?auto_373545 ?auto_373546 ) ) ( not ( = ?auto_373545 ?auto_373547 ) ) ( not ( = ?auto_373545 ?auto_373548 ) ) ( not ( = ?auto_373545 ?auto_373549 ) ) ( not ( = ?auto_373545 ?auto_373550 ) ) ( not ( = ?auto_373545 ?auto_373551 ) ) ( not ( = ?auto_373545 ?auto_373552 ) ) ( not ( = ?auto_373545 ?auto_373553 ) ) ( not ( = ?auto_373545 ?auto_373554 ) ) ( not ( = ?auto_373545 ?auto_373555 ) ) ( not ( = ?auto_373545 ?auto_373556 ) ) ( not ( = ?auto_373545 ?auto_373557 ) ) ( not ( = ?auto_373546 ?auto_373547 ) ) ( not ( = ?auto_373546 ?auto_373548 ) ) ( not ( = ?auto_373546 ?auto_373549 ) ) ( not ( = ?auto_373546 ?auto_373550 ) ) ( not ( = ?auto_373546 ?auto_373551 ) ) ( not ( = ?auto_373546 ?auto_373552 ) ) ( not ( = ?auto_373546 ?auto_373553 ) ) ( not ( = ?auto_373546 ?auto_373554 ) ) ( not ( = ?auto_373546 ?auto_373555 ) ) ( not ( = ?auto_373546 ?auto_373556 ) ) ( not ( = ?auto_373546 ?auto_373557 ) ) ( not ( = ?auto_373547 ?auto_373548 ) ) ( not ( = ?auto_373547 ?auto_373549 ) ) ( not ( = ?auto_373547 ?auto_373550 ) ) ( not ( = ?auto_373547 ?auto_373551 ) ) ( not ( = ?auto_373547 ?auto_373552 ) ) ( not ( = ?auto_373547 ?auto_373553 ) ) ( not ( = ?auto_373547 ?auto_373554 ) ) ( not ( = ?auto_373547 ?auto_373555 ) ) ( not ( = ?auto_373547 ?auto_373556 ) ) ( not ( = ?auto_373547 ?auto_373557 ) ) ( not ( = ?auto_373548 ?auto_373549 ) ) ( not ( = ?auto_373548 ?auto_373550 ) ) ( not ( = ?auto_373548 ?auto_373551 ) ) ( not ( = ?auto_373548 ?auto_373552 ) ) ( not ( = ?auto_373548 ?auto_373553 ) ) ( not ( = ?auto_373548 ?auto_373554 ) ) ( not ( = ?auto_373548 ?auto_373555 ) ) ( not ( = ?auto_373548 ?auto_373556 ) ) ( not ( = ?auto_373548 ?auto_373557 ) ) ( not ( = ?auto_373549 ?auto_373550 ) ) ( not ( = ?auto_373549 ?auto_373551 ) ) ( not ( = ?auto_373549 ?auto_373552 ) ) ( not ( = ?auto_373549 ?auto_373553 ) ) ( not ( = ?auto_373549 ?auto_373554 ) ) ( not ( = ?auto_373549 ?auto_373555 ) ) ( not ( = ?auto_373549 ?auto_373556 ) ) ( not ( = ?auto_373549 ?auto_373557 ) ) ( not ( = ?auto_373550 ?auto_373551 ) ) ( not ( = ?auto_373550 ?auto_373552 ) ) ( not ( = ?auto_373550 ?auto_373553 ) ) ( not ( = ?auto_373550 ?auto_373554 ) ) ( not ( = ?auto_373550 ?auto_373555 ) ) ( not ( = ?auto_373550 ?auto_373556 ) ) ( not ( = ?auto_373550 ?auto_373557 ) ) ( not ( = ?auto_373551 ?auto_373552 ) ) ( not ( = ?auto_373551 ?auto_373553 ) ) ( not ( = ?auto_373551 ?auto_373554 ) ) ( not ( = ?auto_373551 ?auto_373555 ) ) ( not ( = ?auto_373551 ?auto_373556 ) ) ( not ( = ?auto_373551 ?auto_373557 ) ) ( not ( = ?auto_373552 ?auto_373553 ) ) ( not ( = ?auto_373552 ?auto_373554 ) ) ( not ( = ?auto_373552 ?auto_373555 ) ) ( not ( = ?auto_373552 ?auto_373556 ) ) ( not ( = ?auto_373552 ?auto_373557 ) ) ( not ( = ?auto_373553 ?auto_373554 ) ) ( not ( = ?auto_373553 ?auto_373555 ) ) ( not ( = ?auto_373553 ?auto_373556 ) ) ( not ( = ?auto_373553 ?auto_373557 ) ) ( not ( = ?auto_373554 ?auto_373555 ) ) ( not ( = ?auto_373554 ?auto_373556 ) ) ( not ( = ?auto_373554 ?auto_373557 ) ) ( not ( = ?auto_373555 ?auto_373556 ) ) ( not ( = ?auto_373555 ?auto_373557 ) ) ( not ( = ?auto_373556 ?auto_373557 ) ) ( ON ?auto_373555 ?auto_373556 ) ( ON ?auto_373554 ?auto_373555 ) ( ON ?auto_373553 ?auto_373554 ) ( ON ?auto_373552 ?auto_373553 ) ( ON ?auto_373551 ?auto_373552 ) ( CLEAR ?auto_373549 ) ( ON ?auto_373550 ?auto_373551 ) ( CLEAR ?auto_373550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_373545 ?auto_373546 ?auto_373547 ?auto_373548 ?auto_373549 ?auto_373550 )
      ( MAKE-12PILE ?auto_373545 ?auto_373546 ?auto_373547 ?auto_373548 ?auto_373549 ?auto_373550 ?auto_373551 ?auto_373552 ?auto_373553 ?auto_373554 ?auto_373555 ?auto_373556 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373570 - BLOCK
      ?auto_373571 - BLOCK
      ?auto_373572 - BLOCK
      ?auto_373573 - BLOCK
      ?auto_373574 - BLOCK
      ?auto_373575 - BLOCK
      ?auto_373576 - BLOCK
      ?auto_373577 - BLOCK
      ?auto_373578 - BLOCK
      ?auto_373579 - BLOCK
      ?auto_373580 - BLOCK
      ?auto_373581 - BLOCK
    )
    :vars
    (
      ?auto_373582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373581 ?auto_373582 ) ( ON-TABLE ?auto_373570 ) ( ON ?auto_373571 ?auto_373570 ) ( ON ?auto_373572 ?auto_373571 ) ( ON ?auto_373573 ?auto_373572 ) ( not ( = ?auto_373570 ?auto_373571 ) ) ( not ( = ?auto_373570 ?auto_373572 ) ) ( not ( = ?auto_373570 ?auto_373573 ) ) ( not ( = ?auto_373570 ?auto_373574 ) ) ( not ( = ?auto_373570 ?auto_373575 ) ) ( not ( = ?auto_373570 ?auto_373576 ) ) ( not ( = ?auto_373570 ?auto_373577 ) ) ( not ( = ?auto_373570 ?auto_373578 ) ) ( not ( = ?auto_373570 ?auto_373579 ) ) ( not ( = ?auto_373570 ?auto_373580 ) ) ( not ( = ?auto_373570 ?auto_373581 ) ) ( not ( = ?auto_373570 ?auto_373582 ) ) ( not ( = ?auto_373571 ?auto_373572 ) ) ( not ( = ?auto_373571 ?auto_373573 ) ) ( not ( = ?auto_373571 ?auto_373574 ) ) ( not ( = ?auto_373571 ?auto_373575 ) ) ( not ( = ?auto_373571 ?auto_373576 ) ) ( not ( = ?auto_373571 ?auto_373577 ) ) ( not ( = ?auto_373571 ?auto_373578 ) ) ( not ( = ?auto_373571 ?auto_373579 ) ) ( not ( = ?auto_373571 ?auto_373580 ) ) ( not ( = ?auto_373571 ?auto_373581 ) ) ( not ( = ?auto_373571 ?auto_373582 ) ) ( not ( = ?auto_373572 ?auto_373573 ) ) ( not ( = ?auto_373572 ?auto_373574 ) ) ( not ( = ?auto_373572 ?auto_373575 ) ) ( not ( = ?auto_373572 ?auto_373576 ) ) ( not ( = ?auto_373572 ?auto_373577 ) ) ( not ( = ?auto_373572 ?auto_373578 ) ) ( not ( = ?auto_373572 ?auto_373579 ) ) ( not ( = ?auto_373572 ?auto_373580 ) ) ( not ( = ?auto_373572 ?auto_373581 ) ) ( not ( = ?auto_373572 ?auto_373582 ) ) ( not ( = ?auto_373573 ?auto_373574 ) ) ( not ( = ?auto_373573 ?auto_373575 ) ) ( not ( = ?auto_373573 ?auto_373576 ) ) ( not ( = ?auto_373573 ?auto_373577 ) ) ( not ( = ?auto_373573 ?auto_373578 ) ) ( not ( = ?auto_373573 ?auto_373579 ) ) ( not ( = ?auto_373573 ?auto_373580 ) ) ( not ( = ?auto_373573 ?auto_373581 ) ) ( not ( = ?auto_373573 ?auto_373582 ) ) ( not ( = ?auto_373574 ?auto_373575 ) ) ( not ( = ?auto_373574 ?auto_373576 ) ) ( not ( = ?auto_373574 ?auto_373577 ) ) ( not ( = ?auto_373574 ?auto_373578 ) ) ( not ( = ?auto_373574 ?auto_373579 ) ) ( not ( = ?auto_373574 ?auto_373580 ) ) ( not ( = ?auto_373574 ?auto_373581 ) ) ( not ( = ?auto_373574 ?auto_373582 ) ) ( not ( = ?auto_373575 ?auto_373576 ) ) ( not ( = ?auto_373575 ?auto_373577 ) ) ( not ( = ?auto_373575 ?auto_373578 ) ) ( not ( = ?auto_373575 ?auto_373579 ) ) ( not ( = ?auto_373575 ?auto_373580 ) ) ( not ( = ?auto_373575 ?auto_373581 ) ) ( not ( = ?auto_373575 ?auto_373582 ) ) ( not ( = ?auto_373576 ?auto_373577 ) ) ( not ( = ?auto_373576 ?auto_373578 ) ) ( not ( = ?auto_373576 ?auto_373579 ) ) ( not ( = ?auto_373576 ?auto_373580 ) ) ( not ( = ?auto_373576 ?auto_373581 ) ) ( not ( = ?auto_373576 ?auto_373582 ) ) ( not ( = ?auto_373577 ?auto_373578 ) ) ( not ( = ?auto_373577 ?auto_373579 ) ) ( not ( = ?auto_373577 ?auto_373580 ) ) ( not ( = ?auto_373577 ?auto_373581 ) ) ( not ( = ?auto_373577 ?auto_373582 ) ) ( not ( = ?auto_373578 ?auto_373579 ) ) ( not ( = ?auto_373578 ?auto_373580 ) ) ( not ( = ?auto_373578 ?auto_373581 ) ) ( not ( = ?auto_373578 ?auto_373582 ) ) ( not ( = ?auto_373579 ?auto_373580 ) ) ( not ( = ?auto_373579 ?auto_373581 ) ) ( not ( = ?auto_373579 ?auto_373582 ) ) ( not ( = ?auto_373580 ?auto_373581 ) ) ( not ( = ?auto_373580 ?auto_373582 ) ) ( not ( = ?auto_373581 ?auto_373582 ) ) ( ON ?auto_373580 ?auto_373581 ) ( ON ?auto_373579 ?auto_373580 ) ( ON ?auto_373578 ?auto_373579 ) ( ON ?auto_373577 ?auto_373578 ) ( ON ?auto_373576 ?auto_373577 ) ( ON ?auto_373575 ?auto_373576 ) ( CLEAR ?auto_373573 ) ( ON ?auto_373574 ?auto_373575 ) ( CLEAR ?auto_373574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_373570 ?auto_373571 ?auto_373572 ?auto_373573 ?auto_373574 )
      ( MAKE-12PILE ?auto_373570 ?auto_373571 ?auto_373572 ?auto_373573 ?auto_373574 ?auto_373575 ?auto_373576 ?auto_373577 ?auto_373578 ?auto_373579 ?auto_373580 ?auto_373581 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373595 - BLOCK
      ?auto_373596 - BLOCK
      ?auto_373597 - BLOCK
      ?auto_373598 - BLOCK
      ?auto_373599 - BLOCK
      ?auto_373600 - BLOCK
      ?auto_373601 - BLOCK
      ?auto_373602 - BLOCK
      ?auto_373603 - BLOCK
      ?auto_373604 - BLOCK
      ?auto_373605 - BLOCK
      ?auto_373606 - BLOCK
    )
    :vars
    (
      ?auto_373607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373606 ?auto_373607 ) ( ON-TABLE ?auto_373595 ) ( ON ?auto_373596 ?auto_373595 ) ( ON ?auto_373597 ?auto_373596 ) ( ON ?auto_373598 ?auto_373597 ) ( not ( = ?auto_373595 ?auto_373596 ) ) ( not ( = ?auto_373595 ?auto_373597 ) ) ( not ( = ?auto_373595 ?auto_373598 ) ) ( not ( = ?auto_373595 ?auto_373599 ) ) ( not ( = ?auto_373595 ?auto_373600 ) ) ( not ( = ?auto_373595 ?auto_373601 ) ) ( not ( = ?auto_373595 ?auto_373602 ) ) ( not ( = ?auto_373595 ?auto_373603 ) ) ( not ( = ?auto_373595 ?auto_373604 ) ) ( not ( = ?auto_373595 ?auto_373605 ) ) ( not ( = ?auto_373595 ?auto_373606 ) ) ( not ( = ?auto_373595 ?auto_373607 ) ) ( not ( = ?auto_373596 ?auto_373597 ) ) ( not ( = ?auto_373596 ?auto_373598 ) ) ( not ( = ?auto_373596 ?auto_373599 ) ) ( not ( = ?auto_373596 ?auto_373600 ) ) ( not ( = ?auto_373596 ?auto_373601 ) ) ( not ( = ?auto_373596 ?auto_373602 ) ) ( not ( = ?auto_373596 ?auto_373603 ) ) ( not ( = ?auto_373596 ?auto_373604 ) ) ( not ( = ?auto_373596 ?auto_373605 ) ) ( not ( = ?auto_373596 ?auto_373606 ) ) ( not ( = ?auto_373596 ?auto_373607 ) ) ( not ( = ?auto_373597 ?auto_373598 ) ) ( not ( = ?auto_373597 ?auto_373599 ) ) ( not ( = ?auto_373597 ?auto_373600 ) ) ( not ( = ?auto_373597 ?auto_373601 ) ) ( not ( = ?auto_373597 ?auto_373602 ) ) ( not ( = ?auto_373597 ?auto_373603 ) ) ( not ( = ?auto_373597 ?auto_373604 ) ) ( not ( = ?auto_373597 ?auto_373605 ) ) ( not ( = ?auto_373597 ?auto_373606 ) ) ( not ( = ?auto_373597 ?auto_373607 ) ) ( not ( = ?auto_373598 ?auto_373599 ) ) ( not ( = ?auto_373598 ?auto_373600 ) ) ( not ( = ?auto_373598 ?auto_373601 ) ) ( not ( = ?auto_373598 ?auto_373602 ) ) ( not ( = ?auto_373598 ?auto_373603 ) ) ( not ( = ?auto_373598 ?auto_373604 ) ) ( not ( = ?auto_373598 ?auto_373605 ) ) ( not ( = ?auto_373598 ?auto_373606 ) ) ( not ( = ?auto_373598 ?auto_373607 ) ) ( not ( = ?auto_373599 ?auto_373600 ) ) ( not ( = ?auto_373599 ?auto_373601 ) ) ( not ( = ?auto_373599 ?auto_373602 ) ) ( not ( = ?auto_373599 ?auto_373603 ) ) ( not ( = ?auto_373599 ?auto_373604 ) ) ( not ( = ?auto_373599 ?auto_373605 ) ) ( not ( = ?auto_373599 ?auto_373606 ) ) ( not ( = ?auto_373599 ?auto_373607 ) ) ( not ( = ?auto_373600 ?auto_373601 ) ) ( not ( = ?auto_373600 ?auto_373602 ) ) ( not ( = ?auto_373600 ?auto_373603 ) ) ( not ( = ?auto_373600 ?auto_373604 ) ) ( not ( = ?auto_373600 ?auto_373605 ) ) ( not ( = ?auto_373600 ?auto_373606 ) ) ( not ( = ?auto_373600 ?auto_373607 ) ) ( not ( = ?auto_373601 ?auto_373602 ) ) ( not ( = ?auto_373601 ?auto_373603 ) ) ( not ( = ?auto_373601 ?auto_373604 ) ) ( not ( = ?auto_373601 ?auto_373605 ) ) ( not ( = ?auto_373601 ?auto_373606 ) ) ( not ( = ?auto_373601 ?auto_373607 ) ) ( not ( = ?auto_373602 ?auto_373603 ) ) ( not ( = ?auto_373602 ?auto_373604 ) ) ( not ( = ?auto_373602 ?auto_373605 ) ) ( not ( = ?auto_373602 ?auto_373606 ) ) ( not ( = ?auto_373602 ?auto_373607 ) ) ( not ( = ?auto_373603 ?auto_373604 ) ) ( not ( = ?auto_373603 ?auto_373605 ) ) ( not ( = ?auto_373603 ?auto_373606 ) ) ( not ( = ?auto_373603 ?auto_373607 ) ) ( not ( = ?auto_373604 ?auto_373605 ) ) ( not ( = ?auto_373604 ?auto_373606 ) ) ( not ( = ?auto_373604 ?auto_373607 ) ) ( not ( = ?auto_373605 ?auto_373606 ) ) ( not ( = ?auto_373605 ?auto_373607 ) ) ( not ( = ?auto_373606 ?auto_373607 ) ) ( ON ?auto_373605 ?auto_373606 ) ( ON ?auto_373604 ?auto_373605 ) ( ON ?auto_373603 ?auto_373604 ) ( ON ?auto_373602 ?auto_373603 ) ( ON ?auto_373601 ?auto_373602 ) ( ON ?auto_373600 ?auto_373601 ) ( CLEAR ?auto_373598 ) ( ON ?auto_373599 ?auto_373600 ) ( CLEAR ?auto_373599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_373595 ?auto_373596 ?auto_373597 ?auto_373598 ?auto_373599 )
      ( MAKE-12PILE ?auto_373595 ?auto_373596 ?auto_373597 ?auto_373598 ?auto_373599 ?auto_373600 ?auto_373601 ?auto_373602 ?auto_373603 ?auto_373604 ?auto_373605 ?auto_373606 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373620 - BLOCK
      ?auto_373621 - BLOCK
      ?auto_373622 - BLOCK
      ?auto_373623 - BLOCK
      ?auto_373624 - BLOCK
      ?auto_373625 - BLOCK
      ?auto_373626 - BLOCK
      ?auto_373627 - BLOCK
      ?auto_373628 - BLOCK
      ?auto_373629 - BLOCK
      ?auto_373630 - BLOCK
      ?auto_373631 - BLOCK
    )
    :vars
    (
      ?auto_373632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373631 ?auto_373632 ) ( ON-TABLE ?auto_373620 ) ( ON ?auto_373621 ?auto_373620 ) ( ON ?auto_373622 ?auto_373621 ) ( not ( = ?auto_373620 ?auto_373621 ) ) ( not ( = ?auto_373620 ?auto_373622 ) ) ( not ( = ?auto_373620 ?auto_373623 ) ) ( not ( = ?auto_373620 ?auto_373624 ) ) ( not ( = ?auto_373620 ?auto_373625 ) ) ( not ( = ?auto_373620 ?auto_373626 ) ) ( not ( = ?auto_373620 ?auto_373627 ) ) ( not ( = ?auto_373620 ?auto_373628 ) ) ( not ( = ?auto_373620 ?auto_373629 ) ) ( not ( = ?auto_373620 ?auto_373630 ) ) ( not ( = ?auto_373620 ?auto_373631 ) ) ( not ( = ?auto_373620 ?auto_373632 ) ) ( not ( = ?auto_373621 ?auto_373622 ) ) ( not ( = ?auto_373621 ?auto_373623 ) ) ( not ( = ?auto_373621 ?auto_373624 ) ) ( not ( = ?auto_373621 ?auto_373625 ) ) ( not ( = ?auto_373621 ?auto_373626 ) ) ( not ( = ?auto_373621 ?auto_373627 ) ) ( not ( = ?auto_373621 ?auto_373628 ) ) ( not ( = ?auto_373621 ?auto_373629 ) ) ( not ( = ?auto_373621 ?auto_373630 ) ) ( not ( = ?auto_373621 ?auto_373631 ) ) ( not ( = ?auto_373621 ?auto_373632 ) ) ( not ( = ?auto_373622 ?auto_373623 ) ) ( not ( = ?auto_373622 ?auto_373624 ) ) ( not ( = ?auto_373622 ?auto_373625 ) ) ( not ( = ?auto_373622 ?auto_373626 ) ) ( not ( = ?auto_373622 ?auto_373627 ) ) ( not ( = ?auto_373622 ?auto_373628 ) ) ( not ( = ?auto_373622 ?auto_373629 ) ) ( not ( = ?auto_373622 ?auto_373630 ) ) ( not ( = ?auto_373622 ?auto_373631 ) ) ( not ( = ?auto_373622 ?auto_373632 ) ) ( not ( = ?auto_373623 ?auto_373624 ) ) ( not ( = ?auto_373623 ?auto_373625 ) ) ( not ( = ?auto_373623 ?auto_373626 ) ) ( not ( = ?auto_373623 ?auto_373627 ) ) ( not ( = ?auto_373623 ?auto_373628 ) ) ( not ( = ?auto_373623 ?auto_373629 ) ) ( not ( = ?auto_373623 ?auto_373630 ) ) ( not ( = ?auto_373623 ?auto_373631 ) ) ( not ( = ?auto_373623 ?auto_373632 ) ) ( not ( = ?auto_373624 ?auto_373625 ) ) ( not ( = ?auto_373624 ?auto_373626 ) ) ( not ( = ?auto_373624 ?auto_373627 ) ) ( not ( = ?auto_373624 ?auto_373628 ) ) ( not ( = ?auto_373624 ?auto_373629 ) ) ( not ( = ?auto_373624 ?auto_373630 ) ) ( not ( = ?auto_373624 ?auto_373631 ) ) ( not ( = ?auto_373624 ?auto_373632 ) ) ( not ( = ?auto_373625 ?auto_373626 ) ) ( not ( = ?auto_373625 ?auto_373627 ) ) ( not ( = ?auto_373625 ?auto_373628 ) ) ( not ( = ?auto_373625 ?auto_373629 ) ) ( not ( = ?auto_373625 ?auto_373630 ) ) ( not ( = ?auto_373625 ?auto_373631 ) ) ( not ( = ?auto_373625 ?auto_373632 ) ) ( not ( = ?auto_373626 ?auto_373627 ) ) ( not ( = ?auto_373626 ?auto_373628 ) ) ( not ( = ?auto_373626 ?auto_373629 ) ) ( not ( = ?auto_373626 ?auto_373630 ) ) ( not ( = ?auto_373626 ?auto_373631 ) ) ( not ( = ?auto_373626 ?auto_373632 ) ) ( not ( = ?auto_373627 ?auto_373628 ) ) ( not ( = ?auto_373627 ?auto_373629 ) ) ( not ( = ?auto_373627 ?auto_373630 ) ) ( not ( = ?auto_373627 ?auto_373631 ) ) ( not ( = ?auto_373627 ?auto_373632 ) ) ( not ( = ?auto_373628 ?auto_373629 ) ) ( not ( = ?auto_373628 ?auto_373630 ) ) ( not ( = ?auto_373628 ?auto_373631 ) ) ( not ( = ?auto_373628 ?auto_373632 ) ) ( not ( = ?auto_373629 ?auto_373630 ) ) ( not ( = ?auto_373629 ?auto_373631 ) ) ( not ( = ?auto_373629 ?auto_373632 ) ) ( not ( = ?auto_373630 ?auto_373631 ) ) ( not ( = ?auto_373630 ?auto_373632 ) ) ( not ( = ?auto_373631 ?auto_373632 ) ) ( ON ?auto_373630 ?auto_373631 ) ( ON ?auto_373629 ?auto_373630 ) ( ON ?auto_373628 ?auto_373629 ) ( ON ?auto_373627 ?auto_373628 ) ( ON ?auto_373626 ?auto_373627 ) ( ON ?auto_373625 ?auto_373626 ) ( ON ?auto_373624 ?auto_373625 ) ( CLEAR ?auto_373622 ) ( ON ?auto_373623 ?auto_373624 ) ( CLEAR ?auto_373623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_373620 ?auto_373621 ?auto_373622 ?auto_373623 )
      ( MAKE-12PILE ?auto_373620 ?auto_373621 ?auto_373622 ?auto_373623 ?auto_373624 ?auto_373625 ?auto_373626 ?auto_373627 ?auto_373628 ?auto_373629 ?auto_373630 ?auto_373631 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373645 - BLOCK
      ?auto_373646 - BLOCK
      ?auto_373647 - BLOCK
      ?auto_373648 - BLOCK
      ?auto_373649 - BLOCK
      ?auto_373650 - BLOCK
      ?auto_373651 - BLOCK
      ?auto_373652 - BLOCK
      ?auto_373653 - BLOCK
      ?auto_373654 - BLOCK
      ?auto_373655 - BLOCK
      ?auto_373656 - BLOCK
    )
    :vars
    (
      ?auto_373657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373656 ?auto_373657 ) ( ON-TABLE ?auto_373645 ) ( ON ?auto_373646 ?auto_373645 ) ( ON ?auto_373647 ?auto_373646 ) ( not ( = ?auto_373645 ?auto_373646 ) ) ( not ( = ?auto_373645 ?auto_373647 ) ) ( not ( = ?auto_373645 ?auto_373648 ) ) ( not ( = ?auto_373645 ?auto_373649 ) ) ( not ( = ?auto_373645 ?auto_373650 ) ) ( not ( = ?auto_373645 ?auto_373651 ) ) ( not ( = ?auto_373645 ?auto_373652 ) ) ( not ( = ?auto_373645 ?auto_373653 ) ) ( not ( = ?auto_373645 ?auto_373654 ) ) ( not ( = ?auto_373645 ?auto_373655 ) ) ( not ( = ?auto_373645 ?auto_373656 ) ) ( not ( = ?auto_373645 ?auto_373657 ) ) ( not ( = ?auto_373646 ?auto_373647 ) ) ( not ( = ?auto_373646 ?auto_373648 ) ) ( not ( = ?auto_373646 ?auto_373649 ) ) ( not ( = ?auto_373646 ?auto_373650 ) ) ( not ( = ?auto_373646 ?auto_373651 ) ) ( not ( = ?auto_373646 ?auto_373652 ) ) ( not ( = ?auto_373646 ?auto_373653 ) ) ( not ( = ?auto_373646 ?auto_373654 ) ) ( not ( = ?auto_373646 ?auto_373655 ) ) ( not ( = ?auto_373646 ?auto_373656 ) ) ( not ( = ?auto_373646 ?auto_373657 ) ) ( not ( = ?auto_373647 ?auto_373648 ) ) ( not ( = ?auto_373647 ?auto_373649 ) ) ( not ( = ?auto_373647 ?auto_373650 ) ) ( not ( = ?auto_373647 ?auto_373651 ) ) ( not ( = ?auto_373647 ?auto_373652 ) ) ( not ( = ?auto_373647 ?auto_373653 ) ) ( not ( = ?auto_373647 ?auto_373654 ) ) ( not ( = ?auto_373647 ?auto_373655 ) ) ( not ( = ?auto_373647 ?auto_373656 ) ) ( not ( = ?auto_373647 ?auto_373657 ) ) ( not ( = ?auto_373648 ?auto_373649 ) ) ( not ( = ?auto_373648 ?auto_373650 ) ) ( not ( = ?auto_373648 ?auto_373651 ) ) ( not ( = ?auto_373648 ?auto_373652 ) ) ( not ( = ?auto_373648 ?auto_373653 ) ) ( not ( = ?auto_373648 ?auto_373654 ) ) ( not ( = ?auto_373648 ?auto_373655 ) ) ( not ( = ?auto_373648 ?auto_373656 ) ) ( not ( = ?auto_373648 ?auto_373657 ) ) ( not ( = ?auto_373649 ?auto_373650 ) ) ( not ( = ?auto_373649 ?auto_373651 ) ) ( not ( = ?auto_373649 ?auto_373652 ) ) ( not ( = ?auto_373649 ?auto_373653 ) ) ( not ( = ?auto_373649 ?auto_373654 ) ) ( not ( = ?auto_373649 ?auto_373655 ) ) ( not ( = ?auto_373649 ?auto_373656 ) ) ( not ( = ?auto_373649 ?auto_373657 ) ) ( not ( = ?auto_373650 ?auto_373651 ) ) ( not ( = ?auto_373650 ?auto_373652 ) ) ( not ( = ?auto_373650 ?auto_373653 ) ) ( not ( = ?auto_373650 ?auto_373654 ) ) ( not ( = ?auto_373650 ?auto_373655 ) ) ( not ( = ?auto_373650 ?auto_373656 ) ) ( not ( = ?auto_373650 ?auto_373657 ) ) ( not ( = ?auto_373651 ?auto_373652 ) ) ( not ( = ?auto_373651 ?auto_373653 ) ) ( not ( = ?auto_373651 ?auto_373654 ) ) ( not ( = ?auto_373651 ?auto_373655 ) ) ( not ( = ?auto_373651 ?auto_373656 ) ) ( not ( = ?auto_373651 ?auto_373657 ) ) ( not ( = ?auto_373652 ?auto_373653 ) ) ( not ( = ?auto_373652 ?auto_373654 ) ) ( not ( = ?auto_373652 ?auto_373655 ) ) ( not ( = ?auto_373652 ?auto_373656 ) ) ( not ( = ?auto_373652 ?auto_373657 ) ) ( not ( = ?auto_373653 ?auto_373654 ) ) ( not ( = ?auto_373653 ?auto_373655 ) ) ( not ( = ?auto_373653 ?auto_373656 ) ) ( not ( = ?auto_373653 ?auto_373657 ) ) ( not ( = ?auto_373654 ?auto_373655 ) ) ( not ( = ?auto_373654 ?auto_373656 ) ) ( not ( = ?auto_373654 ?auto_373657 ) ) ( not ( = ?auto_373655 ?auto_373656 ) ) ( not ( = ?auto_373655 ?auto_373657 ) ) ( not ( = ?auto_373656 ?auto_373657 ) ) ( ON ?auto_373655 ?auto_373656 ) ( ON ?auto_373654 ?auto_373655 ) ( ON ?auto_373653 ?auto_373654 ) ( ON ?auto_373652 ?auto_373653 ) ( ON ?auto_373651 ?auto_373652 ) ( ON ?auto_373650 ?auto_373651 ) ( ON ?auto_373649 ?auto_373650 ) ( CLEAR ?auto_373647 ) ( ON ?auto_373648 ?auto_373649 ) ( CLEAR ?auto_373648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_373645 ?auto_373646 ?auto_373647 ?auto_373648 )
      ( MAKE-12PILE ?auto_373645 ?auto_373646 ?auto_373647 ?auto_373648 ?auto_373649 ?auto_373650 ?auto_373651 ?auto_373652 ?auto_373653 ?auto_373654 ?auto_373655 ?auto_373656 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373670 - BLOCK
      ?auto_373671 - BLOCK
      ?auto_373672 - BLOCK
      ?auto_373673 - BLOCK
      ?auto_373674 - BLOCK
      ?auto_373675 - BLOCK
      ?auto_373676 - BLOCK
      ?auto_373677 - BLOCK
      ?auto_373678 - BLOCK
      ?auto_373679 - BLOCK
      ?auto_373680 - BLOCK
      ?auto_373681 - BLOCK
    )
    :vars
    (
      ?auto_373682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373681 ?auto_373682 ) ( ON-TABLE ?auto_373670 ) ( ON ?auto_373671 ?auto_373670 ) ( not ( = ?auto_373670 ?auto_373671 ) ) ( not ( = ?auto_373670 ?auto_373672 ) ) ( not ( = ?auto_373670 ?auto_373673 ) ) ( not ( = ?auto_373670 ?auto_373674 ) ) ( not ( = ?auto_373670 ?auto_373675 ) ) ( not ( = ?auto_373670 ?auto_373676 ) ) ( not ( = ?auto_373670 ?auto_373677 ) ) ( not ( = ?auto_373670 ?auto_373678 ) ) ( not ( = ?auto_373670 ?auto_373679 ) ) ( not ( = ?auto_373670 ?auto_373680 ) ) ( not ( = ?auto_373670 ?auto_373681 ) ) ( not ( = ?auto_373670 ?auto_373682 ) ) ( not ( = ?auto_373671 ?auto_373672 ) ) ( not ( = ?auto_373671 ?auto_373673 ) ) ( not ( = ?auto_373671 ?auto_373674 ) ) ( not ( = ?auto_373671 ?auto_373675 ) ) ( not ( = ?auto_373671 ?auto_373676 ) ) ( not ( = ?auto_373671 ?auto_373677 ) ) ( not ( = ?auto_373671 ?auto_373678 ) ) ( not ( = ?auto_373671 ?auto_373679 ) ) ( not ( = ?auto_373671 ?auto_373680 ) ) ( not ( = ?auto_373671 ?auto_373681 ) ) ( not ( = ?auto_373671 ?auto_373682 ) ) ( not ( = ?auto_373672 ?auto_373673 ) ) ( not ( = ?auto_373672 ?auto_373674 ) ) ( not ( = ?auto_373672 ?auto_373675 ) ) ( not ( = ?auto_373672 ?auto_373676 ) ) ( not ( = ?auto_373672 ?auto_373677 ) ) ( not ( = ?auto_373672 ?auto_373678 ) ) ( not ( = ?auto_373672 ?auto_373679 ) ) ( not ( = ?auto_373672 ?auto_373680 ) ) ( not ( = ?auto_373672 ?auto_373681 ) ) ( not ( = ?auto_373672 ?auto_373682 ) ) ( not ( = ?auto_373673 ?auto_373674 ) ) ( not ( = ?auto_373673 ?auto_373675 ) ) ( not ( = ?auto_373673 ?auto_373676 ) ) ( not ( = ?auto_373673 ?auto_373677 ) ) ( not ( = ?auto_373673 ?auto_373678 ) ) ( not ( = ?auto_373673 ?auto_373679 ) ) ( not ( = ?auto_373673 ?auto_373680 ) ) ( not ( = ?auto_373673 ?auto_373681 ) ) ( not ( = ?auto_373673 ?auto_373682 ) ) ( not ( = ?auto_373674 ?auto_373675 ) ) ( not ( = ?auto_373674 ?auto_373676 ) ) ( not ( = ?auto_373674 ?auto_373677 ) ) ( not ( = ?auto_373674 ?auto_373678 ) ) ( not ( = ?auto_373674 ?auto_373679 ) ) ( not ( = ?auto_373674 ?auto_373680 ) ) ( not ( = ?auto_373674 ?auto_373681 ) ) ( not ( = ?auto_373674 ?auto_373682 ) ) ( not ( = ?auto_373675 ?auto_373676 ) ) ( not ( = ?auto_373675 ?auto_373677 ) ) ( not ( = ?auto_373675 ?auto_373678 ) ) ( not ( = ?auto_373675 ?auto_373679 ) ) ( not ( = ?auto_373675 ?auto_373680 ) ) ( not ( = ?auto_373675 ?auto_373681 ) ) ( not ( = ?auto_373675 ?auto_373682 ) ) ( not ( = ?auto_373676 ?auto_373677 ) ) ( not ( = ?auto_373676 ?auto_373678 ) ) ( not ( = ?auto_373676 ?auto_373679 ) ) ( not ( = ?auto_373676 ?auto_373680 ) ) ( not ( = ?auto_373676 ?auto_373681 ) ) ( not ( = ?auto_373676 ?auto_373682 ) ) ( not ( = ?auto_373677 ?auto_373678 ) ) ( not ( = ?auto_373677 ?auto_373679 ) ) ( not ( = ?auto_373677 ?auto_373680 ) ) ( not ( = ?auto_373677 ?auto_373681 ) ) ( not ( = ?auto_373677 ?auto_373682 ) ) ( not ( = ?auto_373678 ?auto_373679 ) ) ( not ( = ?auto_373678 ?auto_373680 ) ) ( not ( = ?auto_373678 ?auto_373681 ) ) ( not ( = ?auto_373678 ?auto_373682 ) ) ( not ( = ?auto_373679 ?auto_373680 ) ) ( not ( = ?auto_373679 ?auto_373681 ) ) ( not ( = ?auto_373679 ?auto_373682 ) ) ( not ( = ?auto_373680 ?auto_373681 ) ) ( not ( = ?auto_373680 ?auto_373682 ) ) ( not ( = ?auto_373681 ?auto_373682 ) ) ( ON ?auto_373680 ?auto_373681 ) ( ON ?auto_373679 ?auto_373680 ) ( ON ?auto_373678 ?auto_373679 ) ( ON ?auto_373677 ?auto_373678 ) ( ON ?auto_373676 ?auto_373677 ) ( ON ?auto_373675 ?auto_373676 ) ( ON ?auto_373674 ?auto_373675 ) ( ON ?auto_373673 ?auto_373674 ) ( CLEAR ?auto_373671 ) ( ON ?auto_373672 ?auto_373673 ) ( CLEAR ?auto_373672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_373670 ?auto_373671 ?auto_373672 )
      ( MAKE-12PILE ?auto_373670 ?auto_373671 ?auto_373672 ?auto_373673 ?auto_373674 ?auto_373675 ?auto_373676 ?auto_373677 ?auto_373678 ?auto_373679 ?auto_373680 ?auto_373681 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373695 - BLOCK
      ?auto_373696 - BLOCK
      ?auto_373697 - BLOCK
      ?auto_373698 - BLOCK
      ?auto_373699 - BLOCK
      ?auto_373700 - BLOCK
      ?auto_373701 - BLOCK
      ?auto_373702 - BLOCK
      ?auto_373703 - BLOCK
      ?auto_373704 - BLOCK
      ?auto_373705 - BLOCK
      ?auto_373706 - BLOCK
    )
    :vars
    (
      ?auto_373707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373706 ?auto_373707 ) ( ON-TABLE ?auto_373695 ) ( ON ?auto_373696 ?auto_373695 ) ( not ( = ?auto_373695 ?auto_373696 ) ) ( not ( = ?auto_373695 ?auto_373697 ) ) ( not ( = ?auto_373695 ?auto_373698 ) ) ( not ( = ?auto_373695 ?auto_373699 ) ) ( not ( = ?auto_373695 ?auto_373700 ) ) ( not ( = ?auto_373695 ?auto_373701 ) ) ( not ( = ?auto_373695 ?auto_373702 ) ) ( not ( = ?auto_373695 ?auto_373703 ) ) ( not ( = ?auto_373695 ?auto_373704 ) ) ( not ( = ?auto_373695 ?auto_373705 ) ) ( not ( = ?auto_373695 ?auto_373706 ) ) ( not ( = ?auto_373695 ?auto_373707 ) ) ( not ( = ?auto_373696 ?auto_373697 ) ) ( not ( = ?auto_373696 ?auto_373698 ) ) ( not ( = ?auto_373696 ?auto_373699 ) ) ( not ( = ?auto_373696 ?auto_373700 ) ) ( not ( = ?auto_373696 ?auto_373701 ) ) ( not ( = ?auto_373696 ?auto_373702 ) ) ( not ( = ?auto_373696 ?auto_373703 ) ) ( not ( = ?auto_373696 ?auto_373704 ) ) ( not ( = ?auto_373696 ?auto_373705 ) ) ( not ( = ?auto_373696 ?auto_373706 ) ) ( not ( = ?auto_373696 ?auto_373707 ) ) ( not ( = ?auto_373697 ?auto_373698 ) ) ( not ( = ?auto_373697 ?auto_373699 ) ) ( not ( = ?auto_373697 ?auto_373700 ) ) ( not ( = ?auto_373697 ?auto_373701 ) ) ( not ( = ?auto_373697 ?auto_373702 ) ) ( not ( = ?auto_373697 ?auto_373703 ) ) ( not ( = ?auto_373697 ?auto_373704 ) ) ( not ( = ?auto_373697 ?auto_373705 ) ) ( not ( = ?auto_373697 ?auto_373706 ) ) ( not ( = ?auto_373697 ?auto_373707 ) ) ( not ( = ?auto_373698 ?auto_373699 ) ) ( not ( = ?auto_373698 ?auto_373700 ) ) ( not ( = ?auto_373698 ?auto_373701 ) ) ( not ( = ?auto_373698 ?auto_373702 ) ) ( not ( = ?auto_373698 ?auto_373703 ) ) ( not ( = ?auto_373698 ?auto_373704 ) ) ( not ( = ?auto_373698 ?auto_373705 ) ) ( not ( = ?auto_373698 ?auto_373706 ) ) ( not ( = ?auto_373698 ?auto_373707 ) ) ( not ( = ?auto_373699 ?auto_373700 ) ) ( not ( = ?auto_373699 ?auto_373701 ) ) ( not ( = ?auto_373699 ?auto_373702 ) ) ( not ( = ?auto_373699 ?auto_373703 ) ) ( not ( = ?auto_373699 ?auto_373704 ) ) ( not ( = ?auto_373699 ?auto_373705 ) ) ( not ( = ?auto_373699 ?auto_373706 ) ) ( not ( = ?auto_373699 ?auto_373707 ) ) ( not ( = ?auto_373700 ?auto_373701 ) ) ( not ( = ?auto_373700 ?auto_373702 ) ) ( not ( = ?auto_373700 ?auto_373703 ) ) ( not ( = ?auto_373700 ?auto_373704 ) ) ( not ( = ?auto_373700 ?auto_373705 ) ) ( not ( = ?auto_373700 ?auto_373706 ) ) ( not ( = ?auto_373700 ?auto_373707 ) ) ( not ( = ?auto_373701 ?auto_373702 ) ) ( not ( = ?auto_373701 ?auto_373703 ) ) ( not ( = ?auto_373701 ?auto_373704 ) ) ( not ( = ?auto_373701 ?auto_373705 ) ) ( not ( = ?auto_373701 ?auto_373706 ) ) ( not ( = ?auto_373701 ?auto_373707 ) ) ( not ( = ?auto_373702 ?auto_373703 ) ) ( not ( = ?auto_373702 ?auto_373704 ) ) ( not ( = ?auto_373702 ?auto_373705 ) ) ( not ( = ?auto_373702 ?auto_373706 ) ) ( not ( = ?auto_373702 ?auto_373707 ) ) ( not ( = ?auto_373703 ?auto_373704 ) ) ( not ( = ?auto_373703 ?auto_373705 ) ) ( not ( = ?auto_373703 ?auto_373706 ) ) ( not ( = ?auto_373703 ?auto_373707 ) ) ( not ( = ?auto_373704 ?auto_373705 ) ) ( not ( = ?auto_373704 ?auto_373706 ) ) ( not ( = ?auto_373704 ?auto_373707 ) ) ( not ( = ?auto_373705 ?auto_373706 ) ) ( not ( = ?auto_373705 ?auto_373707 ) ) ( not ( = ?auto_373706 ?auto_373707 ) ) ( ON ?auto_373705 ?auto_373706 ) ( ON ?auto_373704 ?auto_373705 ) ( ON ?auto_373703 ?auto_373704 ) ( ON ?auto_373702 ?auto_373703 ) ( ON ?auto_373701 ?auto_373702 ) ( ON ?auto_373700 ?auto_373701 ) ( ON ?auto_373699 ?auto_373700 ) ( ON ?auto_373698 ?auto_373699 ) ( CLEAR ?auto_373696 ) ( ON ?auto_373697 ?auto_373698 ) ( CLEAR ?auto_373697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_373695 ?auto_373696 ?auto_373697 )
      ( MAKE-12PILE ?auto_373695 ?auto_373696 ?auto_373697 ?auto_373698 ?auto_373699 ?auto_373700 ?auto_373701 ?auto_373702 ?auto_373703 ?auto_373704 ?auto_373705 ?auto_373706 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373720 - BLOCK
      ?auto_373721 - BLOCK
      ?auto_373722 - BLOCK
      ?auto_373723 - BLOCK
      ?auto_373724 - BLOCK
      ?auto_373725 - BLOCK
      ?auto_373726 - BLOCK
      ?auto_373727 - BLOCK
      ?auto_373728 - BLOCK
      ?auto_373729 - BLOCK
      ?auto_373730 - BLOCK
      ?auto_373731 - BLOCK
    )
    :vars
    (
      ?auto_373732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373731 ?auto_373732 ) ( ON-TABLE ?auto_373720 ) ( not ( = ?auto_373720 ?auto_373721 ) ) ( not ( = ?auto_373720 ?auto_373722 ) ) ( not ( = ?auto_373720 ?auto_373723 ) ) ( not ( = ?auto_373720 ?auto_373724 ) ) ( not ( = ?auto_373720 ?auto_373725 ) ) ( not ( = ?auto_373720 ?auto_373726 ) ) ( not ( = ?auto_373720 ?auto_373727 ) ) ( not ( = ?auto_373720 ?auto_373728 ) ) ( not ( = ?auto_373720 ?auto_373729 ) ) ( not ( = ?auto_373720 ?auto_373730 ) ) ( not ( = ?auto_373720 ?auto_373731 ) ) ( not ( = ?auto_373720 ?auto_373732 ) ) ( not ( = ?auto_373721 ?auto_373722 ) ) ( not ( = ?auto_373721 ?auto_373723 ) ) ( not ( = ?auto_373721 ?auto_373724 ) ) ( not ( = ?auto_373721 ?auto_373725 ) ) ( not ( = ?auto_373721 ?auto_373726 ) ) ( not ( = ?auto_373721 ?auto_373727 ) ) ( not ( = ?auto_373721 ?auto_373728 ) ) ( not ( = ?auto_373721 ?auto_373729 ) ) ( not ( = ?auto_373721 ?auto_373730 ) ) ( not ( = ?auto_373721 ?auto_373731 ) ) ( not ( = ?auto_373721 ?auto_373732 ) ) ( not ( = ?auto_373722 ?auto_373723 ) ) ( not ( = ?auto_373722 ?auto_373724 ) ) ( not ( = ?auto_373722 ?auto_373725 ) ) ( not ( = ?auto_373722 ?auto_373726 ) ) ( not ( = ?auto_373722 ?auto_373727 ) ) ( not ( = ?auto_373722 ?auto_373728 ) ) ( not ( = ?auto_373722 ?auto_373729 ) ) ( not ( = ?auto_373722 ?auto_373730 ) ) ( not ( = ?auto_373722 ?auto_373731 ) ) ( not ( = ?auto_373722 ?auto_373732 ) ) ( not ( = ?auto_373723 ?auto_373724 ) ) ( not ( = ?auto_373723 ?auto_373725 ) ) ( not ( = ?auto_373723 ?auto_373726 ) ) ( not ( = ?auto_373723 ?auto_373727 ) ) ( not ( = ?auto_373723 ?auto_373728 ) ) ( not ( = ?auto_373723 ?auto_373729 ) ) ( not ( = ?auto_373723 ?auto_373730 ) ) ( not ( = ?auto_373723 ?auto_373731 ) ) ( not ( = ?auto_373723 ?auto_373732 ) ) ( not ( = ?auto_373724 ?auto_373725 ) ) ( not ( = ?auto_373724 ?auto_373726 ) ) ( not ( = ?auto_373724 ?auto_373727 ) ) ( not ( = ?auto_373724 ?auto_373728 ) ) ( not ( = ?auto_373724 ?auto_373729 ) ) ( not ( = ?auto_373724 ?auto_373730 ) ) ( not ( = ?auto_373724 ?auto_373731 ) ) ( not ( = ?auto_373724 ?auto_373732 ) ) ( not ( = ?auto_373725 ?auto_373726 ) ) ( not ( = ?auto_373725 ?auto_373727 ) ) ( not ( = ?auto_373725 ?auto_373728 ) ) ( not ( = ?auto_373725 ?auto_373729 ) ) ( not ( = ?auto_373725 ?auto_373730 ) ) ( not ( = ?auto_373725 ?auto_373731 ) ) ( not ( = ?auto_373725 ?auto_373732 ) ) ( not ( = ?auto_373726 ?auto_373727 ) ) ( not ( = ?auto_373726 ?auto_373728 ) ) ( not ( = ?auto_373726 ?auto_373729 ) ) ( not ( = ?auto_373726 ?auto_373730 ) ) ( not ( = ?auto_373726 ?auto_373731 ) ) ( not ( = ?auto_373726 ?auto_373732 ) ) ( not ( = ?auto_373727 ?auto_373728 ) ) ( not ( = ?auto_373727 ?auto_373729 ) ) ( not ( = ?auto_373727 ?auto_373730 ) ) ( not ( = ?auto_373727 ?auto_373731 ) ) ( not ( = ?auto_373727 ?auto_373732 ) ) ( not ( = ?auto_373728 ?auto_373729 ) ) ( not ( = ?auto_373728 ?auto_373730 ) ) ( not ( = ?auto_373728 ?auto_373731 ) ) ( not ( = ?auto_373728 ?auto_373732 ) ) ( not ( = ?auto_373729 ?auto_373730 ) ) ( not ( = ?auto_373729 ?auto_373731 ) ) ( not ( = ?auto_373729 ?auto_373732 ) ) ( not ( = ?auto_373730 ?auto_373731 ) ) ( not ( = ?auto_373730 ?auto_373732 ) ) ( not ( = ?auto_373731 ?auto_373732 ) ) ( ON ?auto_373730 ?auto_373731 ) ( ON ?auto_373729 ?auto_373730 ) ( ON ?auto_373728 ?auto_373729 ) ( ON ?auto_373727 ?auto_373728 ) ( ON ?auto_373726 ?auto_373727 ) ( ON ?auto_373725 ?auto_373726 ) ( ON ?auto_373724 ?auto_373725 ) ( ON ?auto_373723 ?auto_373724 ) ( ON ?auto_373722 ?auto_373723 ) ( CLEAR ?auto_373720 ) ( ON ?auto_373721 ?auto_373722 ) ( CLEAR ?auto_373721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_373720 ?auto_373721 )
      ( MAKE-12PILE ?auto_373720 ?auto_373721 ?auto_373722 ?auto_373723 ?auto_373724 ?auto_373725 ?auto_373726 ?auto_373727 ?auto_373728 ?auto_373729 ?auto_373730 ?auto_373731 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373745 - BLOCK
      ?auto_373746 - BLOCK
      ?auto_373747 - BLOCK
      ?auto_373748 - BLOCK
      ?auto_373749 - BLOCK
      ?auto_373750 - BLOCK
      ?auto_373751 - BLOCK
      ?auto_373752 - BLOCK
      ?auto_373753 - BLOCK
      ?auto_373754 - BLOCK
      ?auto_373755 - BLOCK
      ?auto_373756 - BLOCK
    )
    :vars
    (
      ?auto_373757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373756 ?auto_373757 ) ( ON-TABLE ?auto_373745 ) ( not ( = ?auto_373745 ?auto_373746 ) ) ( not ( = ?auto_373745 ?auto_373747 ) ) ( not ( = ?auto_373745 ?auto_373748 ) ) ( not ( = ?auto_373745 ?auto_373749 ) ) ( not ( = ?auto_373745 ?auto_373750 ) ) ( not ( = ?auto_373745 ?auto_373751 ) ) ( not ( = ?auto_373745 ?auto_373752 ) ) ( not ( = ?auto_373745 ?auto_373753 ) ) ( not ( = ?auto_373745 ?auto_373754 ) ) ( not ( = ?auto_373745 ?auto_373755 ) ) ( not ( = ?auto_373745 ?auto_373756 ) ) ( not ( = ?auto_373745 ?auto_373757 ) ) ( not ( = ?auto_373746 ?auto_373747 ) ) ( not ( = ?auto_373746 ?auto_373748 ) ) ( not ( = ?auto_373746 ?auto_373749 ) ) ( not ( = ?auto_373746 ?auto_373750 ) ) ( not ( = ?auto_373746 ?auto_373751 ) ) ( not ( = ?auto_373746 ?auto_373752 ) ) ( not ( = ?auto_373746 ?auto_373753 ) ) ( not ( = ?auto_373746 ?auto_373754 ) ) ( not ( = ?auto_373746 ?auto_373755 ) ) ( not ( = ?auto_373746 ?auto_373756 ) ) ( not ( = ?auto_373746 ?auto_373757 ) ) ( not ( = ?auto_373747 ?auto_373748 ) ) ( not ( = ?auto_373747 ?auto_373749 ) ) ( not ( = ?auto_373747 ?auto_373750 ) ) ( not ( = ?auto_373747 ?auto_373751 ) ) ( not ( = ?auto_373747 ?auto_373752 ) ) ( not ( = ?auto_373747 ?auto_373753 ) ) ( not ( = ?auto_373747 ?auto_373754 ) ) ( not ( = ?auto_373747 ?auto_373755 ) ) ( not ( = ?auto_373747 ?auto_373756 ) ) ( not ( = ?auto_373747 ?auto_373757 ) ) ( not ( = ?auto_373748 ?auto_373749 ) ) ( not ( = ?auto_373748 ?auto_373750 ) ) ( not ( = ?auto_373748 ?auto_373751 ) ) ( not ( = ?auto_373748 ?auto_373752 ) ) ( not ( = ?auto_373748 ?auto_373753 ) ) ( not ( = ?auto_373748 ?auto_373754 ) ) ( not ( = ?auto_373748 ?auto_373755 ) ) ( not ( = ?auto_373748 ?auto_373756 ) ) ( not ( = ?auto_373748 ?auto_373757 ) ) ( not ( = ?auto_373749 ?auto_373750 ) ) ( not ( = ?auto_373749 ?auto_373751 ) ) ( not ( = ?auto_373749 ?auto_373752 ) ) ( not ( = ?auto_373749 ?auto_373753 ) ) ( not ( = ?auto_373749 ?auto_373754 ) ) ( not ( = ?auto_373749 ?auto_373755 ) ) ( not ( = ?auto_373749 ?auto_373756 ) ) ( not ( = ?auto_373749 ?auto_373757 ) ) ( not ( = ?auto_373750 ?auto_373751 ) ) ( not ( = ?auto_373750 ?auto_373752 ) ) ( not ( = ?auto_373750 ?auto_373753 ) ) ( not ( = ?auto_373750 ?auto_373754 ) ) ( not ( = ?auto_373750 ?auto_373755 ) ) ( not ( = ?auto_373750 ?auto_373756 ) ) ( not ( = ?auto_373750 ?auto_373757 ) ) ( not ( = ?auto_373751 ?auto_373752 ) ) ( not ( = ?auto_373751 ?auto_373753 ) ) ( not ( = ?auto_373751 ?auto_373754 ) ) ( not ( = ?auto_373751 ?auto_373755 ) ) ( not ( = ?auto_373751 ?auto_373756 ) ) ( not ( = ?auto_373751 ?auto_373757 ) ) ( not ( = ?auto_373752 ?auto_373753 ) ) ( not ( = ?auto_373752 ?auto_373754 ) ) ( not ( = ?auto_373752 ?auto_373755 ) ) ( not ( = ?auto_373752 ?auto_373756 ) ) ( not ( = ?auto_373752 ?auto_373757 ) ) ( not ( = ?auto_373753 ?auto_373754 ) ) ( not ( = ?auto_373753 ?auto_373755 ) ) ( not ( = ?auto_373753 ?auto_373756 ) ) ( not ( = ?auto_373753 ?auto_373757 ) ) ( not ( = ?auto_373754 ?auto_373755 ) ) ( not ( = ?auto_373754 ?auto_373756 ) ) ( not ( = ?auto_373754 ?auto_373757 ) ) ( not ( = ?auto_373755 ?auto_373756 ) ) ( not ( = ?auto_373755 ?auto_373757 ) ) ( not ( = ?auto_373756 ?auto_373757 ) ) ( ON ?auto_373755 ?auto_373756 ) ( ON ?auto_373754 ?auto_373755 ) ( ON ?auto_373753 ?auto_373754 ) ( ON ?auto_373752 ?auto_373753 ) ( ON ?auto_373751 ?auto_373752 ) ( ON ?auto_373750 ?auto_373751 ) ( ON ?auto_373749 ?auto_373750 ) ( ON ?auto_373748 ?auto_373749 ) ( ON ?auto_373747 ?auto_373748 ) ( CLEAR ?auto_373745 ) ( ON ?auto_373746 ?auto_373747 ) ( CLEAR ?auto_373746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_373745 ?auto_373746 )
      ( MAKE-12PILE ?auto_373745 ?auto_373746 ?auto_373747 ?auto_373748 ?auto_373749 ?auto_373750 ?auto_373751 ?auto_373752 ?auto_373753 ?auto_373754 ?auto_373755 ?auto_373756 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373770 - BLOCK
      ?auto_373771 - BLOCK
      ?auto_373772 - BLOCK
      ?auto_373773 - BLOCK
      ?auto_373774 - BLOCK
      ?auto_373775 - BLOCK
      ?auto_373776 - BLOCK
      ?auto_373777 - BLOCK
      ?auto_373778 - BLOCK
      ?auto_373779 - BLOCK
      ?auto_373780 - BLOCK
      ?auto_373781 - BLOCK
    )
    :vars
    (
      ?auto_373782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373781 ?auto_373782 ) ( not ( = ?auto_373770 ?auto_373771 ) ) ( not ( = ?auto_373770 ?auto_373772 ) ) ( not ( = ?auto_373770 ?auto_373773 ) ) ( not ( = ?auto_373770 ?auto_373774 ) ) ( not ( = ?auto_373770 ?auto_373775 ) ) ( not ( = ?auto_373770 ?auto_373776 ) ) ( not ( = ?auto_373770 ?auto_373777 ) ) ( not ( = ?auto_373770 ?auto_373778 ) ) ( not ( = ?auto_373770 ?auto_373779 ) ) ( not ( = ?auto_373770 ?auto_373780 ) ) ( not ( = ?auto_373770 ?auto_373781 ) ) ( not ( = ?auto_373770 ?auto_373782 ) ) ( not ( = ?auto_373771 ?auto_373772 ) ) ( not ( = ?auto_373771 ?auto_373773 ) ) ( not ( = ?auto_373771 ?auto_373774 ) ) ( not ( = ?auto_373771 ?auto_373775 ) ) ( not ( = ?auto_373771 ?auto_373776 ) ) ( not ( = ?auto_373771 ?auto_373777 ) ) ( not ( = ?auto_373771 ?auto_373778 ) ) ( not ( = ?auto_373771 ?auto_373779 ) ) ( not ( = ?auto_373771 ?auto_373780 ) ) ( not ( = ?auto_373771 ?auto_373781 ) ) ( not ( = ?auto_373771 ?auto_373782 ) ) ( not ( = ?auto_373772 ?auto_373773 ) ) ( not ( = ?auto_373772 ?auto_373774 ) ) ( not ( = ?auto_373772 ?auto_373775 ) ) ( not ( = ?auto_373772 ?auto_373776 ) ) ( not ( = ?auto_373772 ?auto_373777 ) ) ( not ( = ?auto_373772 ?auto_373778 ) ) ( not ( = ?auto_373772 ?auto_373779 ) ) ( not ( = ?auto_373772 ?auto_373780 ) ) ( not ( = ?auto_373772 ?auto_373781 ) ) ( not ( = ?auto_373772 ?auto_373782 ) ) ( not ( = ?auto_373773 ?auto_373774 ) ) ( not ( = ?auto_373773 ?auto_373775 ) ) ( not ( = ?auto_373773 ?auto_373776 ) ) ( not ( = ?auto_373773 ?auto_373777 ) ) ( not ( = ?auto_373773 ?auto_373778 ) ) ( not ( = ?auto_373773 ?auto_373779 ) ) ( not ( = ?auto_373773 ?auto_373780 ) ) ( not ( = ?auto_373773 ?auto_373781 ) ) ( not ( = ?auto_373773 ?auto_373782 ) ) ( not ( = ?auto_373774 ?auto_373775 ) ) ( not ( = ?auto_373774 ?auto_373776 ) ) ( not ( = ?auto_373774 ?auto_373777 ) ) ( not ( = ?auto_373774 ?auto_373778 ) ) ( not ( = ?auto_373774 ?auto_373779 ) ) ( not ( = ?auto_373774 ?auto_373780 ) ) ( not ( = ?auto_373774 ?auto_373781 ) ) ( not ( = ?auto_373774 ?auto_373782 ) ) ( not ( = ?auto_373775 ?auto_373776 ) ) ( not ( = ?auto_373775 ?auto_373777 ) ) ( not ( = ?auto_373775 ?auto_373778 ) ) ( not ( = ?auto_373775 ?auto_373779 ) ) ( not ( = ?auto_373775 ?auto_373780 ) ) ( not ( = ?auto_373775 ?auto_373781 ) ) ( not ( = ?auto_373775 ?auto_373782 ) ) ( not ( = ?auto_373776 ?auto_373777 ) ) ( not ( = ?auto_373776 ?auto_373778 ) ) ( not ( = ?auto_373776 ?auto_373779 ) ) ( not ( = ?auto_373776 ?auto_373780 ) ) ( not ( = ?auto_373776 ?auto_373781 ) ) ( not ( = ?auto_373776 ?auto_373782 ) ) ( not ( = ?auto_373777 ?auto_373778 ) ) ( not ( = ?auto_373777 ?auto_373779 ) ) ( not ( = ?auto_373777 ?auto_373780 ) ) ( not ( = ?auto_373777 ?auto_373781 ) ) ( not ( = ?auto_373777 ?auto_373782 ) ) ( not ( = ?auto_373778 ?auto_373779 ) ) ( not ( = ?auto_373778 ?auto_373780 ) ) ( not ( = ?auto_373778 ?auto_373781 ) ) ( not ( = ?auto_373778 ?auto_373782 ) ) ( not ( = ?auto_373779 ?auto_373780 ) ) ( not ( = ?auto_373779 ?auto_373781 ) ) ( not ( = ?auto_373779 ?auto_373782 ) ) ( not ( = ?auto_373780 ?auto_373781 ) ) ( not ( = ?auto_373780 ?auto_373782 ) ) ( not ( = ?auto_373781 ?auto_373782 ) ) ( ON ?auto_373780 ?auto_373781 ) ( ON ?auto_373779 ?auto_373780 ) ( ON ?auto_373778 ?auto_373779 ) ( ON ?auto_373777 ?auto_373778 ) ( ON ?auto_373776 ?auto_373777 ) ( ON ?auto_373775 ?auto_373776 ) ( ON ?auto_373774 ?auto_373775 ) ( ON ?auto_373773 ?auto_373774 ) ( ON ?auto_373772 ?auto_373773 ) ( ON ?auto_373771 ?auto_373772 ) ( ON ?auto_373770 ?auto_373771 ) ( CLEAR ?auto_373770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_373770 )
      ( MAKE-12PILE ?auto_373770 ?auto_373771 ?auto_373772 ?auto_373773 ?auto_373774 ?auto_373775 ?auto_373776 ?auto_373777 ?auto_373778 ?auto_373779 ?auto_373780 ?auto_373781 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_373795 - BLOCK
      ?auto_373796 - BLOCK
      ?auto_373797 - BLOCK
      ?auto_373798 - BLOCK
      ?auto_373799 - BLOCK
      ?auto_373800 - BLOCK
      ?auto_373801 - BLOCK
      ?auto_373802 - BLOCK
      ?auto_373803 - BLOCK
      ?auto_373804 - BLOCK
      ?auto_373805 - BLOCK
      ?auto_373806 - BLOCK
    )
    :vars
    (
      ?auto_373807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373806 ?auto_373807 ) ( not ( = ?auto_373795 ?auto_373796 ) ) ( not ( = ?auto_373795 ?auto_373797 ) ) ( not ( = ?auto_373795 ?auto_373798 ) ) ( not ( = ?auto_373795 ?auto_373799 ) ) ( not ( = ?auto_373795 ?auto_373800 ) ) ( not ( = ?auto_373795 ?auto_373801 ) ) ( not ( = ?auto_373795 ?auto_373802 ) ) ( not ( = ?auto_373795 ?auto_373803 ) ) ( not ( = ?auto_373795 ?auto_373804 ) ) ( not ( = ?auto_373795 ?auto_373805 ) ) ( not ( = ?auto_373795 ?auto_373806 ) ) ( not ( = ?auto_373795 ?auto_373807 ) ) ( not ( = ?auto_373796 ?auto_373797 ) ) ( not ( = ?auto_373796 ?auto_373798 ) ) ( not ( = ?auto_373796 ?auto_373799 ) ) ( not ( = ?auto_373796 ?auto_373800 ) ) ( not ( = ?auto_373796 ?auto_373801 ) ) ( not ( = ?auto_373796 ?auto_373802 ) ) ( not ( = ?auto_373796 ?auto_373803 ) ) ( not ( = ?auto_373796 ?auto_373804 ) ) ( not ( = ?auto_373796 ?auto_373805 ) ) ( not ( = ?auto_373796 ?auto_373806 ) ) ( not ( = ?auto_373796 ?auto_373807 ) ) ( not ( = ?auto_373797 ?auto_373798 ) ) ( not ( = ?auto_373797 ?auto_373799 ) ) ( not ( = ?auto_373797 ?auto_373800 ) ) ( not ( = ?auto_373797 ?auto_373801 ) ) ( not ( = ?auto_373797 ?auto_373802 ) ) ( not ( = ?auto_373797 ?auto_373803 ) ) ( not ( = ?auto_373797 ?auto_373804 ) ) ( not ( = ?auto_373797 ?auto_373805 ) ) ( not ( = ?auto_373797 ?auto_373806 ) ) ( not ( = ?auto_373797 ?auto_373807 ) ) ( not ( = ?auto_373798 ?auto_373799 ) ) ( not ( = ?auto_373798 ?auto_373800 ) ) ( not ( = ?auto_373798 ?auto_373801 ) ) ( not ( = ?auto_373798 ?auto_373802 ) ) ( not ( = ?auto_373798 ?auto_373803 ) ) ( not ( = ?auto_373798 ?auto_373804 ) ) ( not ( = ?auto_373798 ?auto_373805 ) ) ( not ( = ?auto_373798 ?auto_373806 ) ) ( not ( = ?auto_373798 ?auto_373807 ) ) ( not ( = ?auto_373799 ?auto_373800 ) ) ( not ( = ?auto_373799 ?auto_373801 ) ) ( not ( = ?auto_373799 ?auto_373802 ) ) ( not ( = ?auto_373799 ?auto_373803 ) ) ( not ( = ?auto_373799 ?auto_373804 ) ) ( not ( = ?auto_373799 ?auto_373805 ) ) ( not ( = ?auto_373799 ?auto_373806 ) ) ( not ( = ?auto_373799 ?auto_373807 ) ) ( not ( = ?auto_373800 ?auto_373801 ) ) ( not ( = ?auto_373800 ?auto_373802 ) ) ( not ( = ?auto_373800 ?auto_373803 ) ) ( not ( = ?auto_373800 ?auto_373804 ) ) ( not ( = ?auto_373800 ?auto_373805 ) ) ( not ( = ?auto_373800 ?auto_373806 ) ) ( not ( = ?auto_373800 ?auto_373807 ) ) ( not ( = ?auto_373801 ?auto_373802 ) ) ( not ( = ?auto_373801 ?auto_373803 ) ) ( not ( = ?auto_373801 ?auto_373804 ) ) ( not ( = ?auto_373801 ?auto_373805 ) ) ( not ( = ?auto_373801 ?auto_373806 ) ) ( not ( = ?auto_373801 ?auto_373807 ) ) ( not ( = ?auto_373802 ?auto_373803 ) ) ( not ( = ?auto_373802 ?auto_373804 ) ) ( not ( = ?auto_373802 ?auto_373805 ) ) ( not ( = ?auto_373802 ?auto_373806 ) ) ( not ( = ?auto_373802 ?auto_373807 ) ) ( not ( = ?auto_373803 ?auto_373804 ) ) ( not ( = ?auto_373803 ?auto_373805 ) ) ( not ( = ?auto_373803 ?auto_373806 ) ) ( not ( = ?auto_373803 ?auto_373807 ) ) ( not ( = ?auto_373804 ?auto_373805 ) ) ( not ( = ?auto_373804 ?auto_373806 ) ) ( not ( = ?auto_373804 ?auto_373807 ) ) ( not ( = ?auto_373805 ?auto_373806 ) ) ( not ( = ?auto_373805 ?auto_373807 ) ) ( not ( = ?auto_373806 ?auto_373807 ) ) ( ON ?auto_373805 ?auto_373806 ) ( ON ?auto_373804 ?auto_373805 ) ( ON ?auto_373803 ?auto_373804 ) ( ON ?auto_373802 ?auto_373803 ) ( ON ?auto_373801 ?auto_373802 ) ( ON ?auto_373800 ?auto_373801 ) ( ON ?auto_373799 ?auto_373800 ) ( ON ?auto_373798 ?auto_373799 ) ( ON ?auto_373797 ?auto_373798 ) ( ON ?auto_373796 ?auto_373797 ) ( ON ?auto_373795 ?auto_373796 ) ( CLEAR ?auto_373795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_373795 )
      ( MAKE-12PILE ?auto_373795 ?auto_373796 ?auto_373797 ?auto_373798 ?auto_373799 ?auto_373800 ?auto_373801 ?auto_373802 ?auto_373803 ?auto_373804 ?auto_373805 ?auto_373806 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373821 - BLOCK
      ?auto_373822 - BLOCK
      ?auto_373823 - BLOCK
      ?auto_373824 - BLOCK
      ?auto_373825 - BLOCK
      ?auto_373826 - BLOCK
      ?auto_373827 - BLOCK
      ?auto_373828 - BLOCK
      ?auto_373829 - BLOCK
      ?auto_373830 - BLOCK
      ?auto_373831 - BLOCK
      ?auto_373832 - BLOCK
      ?auto_373833 - BLOCK
    )
    :vars
    (
      ?auto_373834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_373832 ) ( ON ?auto_373833 ?auto_373834 ) ( CLEAR ?auto_373833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_373821 ) ( ON ?auto_373822 ?auto_373821 ) ( ON ?auto_373823 ?auto_373822 ) ( ON ?auto_373824 ?auto_373823 ) ( ON ?auto_373825 ?auto_373824 ) ( ON ?auto_373826 ?auto_373825 ) ( ON ?auto_373827 ?auto_373826 ) ( ON ?auto_373828 ?auto_373827 ) ( ON ?auto_373829 ?auto_373828 ) ( ON ?auto_373830 ?auto_373829 ) ( ON ?auto_373831 ?auto_373830 ) ( ON ?auto_373832 ?auto_373831 ) ( not ( = ?auto_373821 ?auto_373822 ) ) ( not ( = ?auto_373821 ?auto_373823 ) ) ( not ( = ?auto_373821 ?auto_373824 ) ) ( not ( = ?auto_373821 ?auto_373825 ) ) ( not ( = ?auto_373821 ?auto_373826 ) ) ( not ( = ?auto_373821 ?auto_373827 ) ) ( not ( = ?auto_373821 ?auto_373828 ) ) ( not ( = ?auto_373821 ?auto_373829 ) ) ( not ( = ?auto_373821 ?auto_373830 ) ) ( not ( = ?auto_373821 ?auto_373831 ) ) ( not ( = ?auto_373821 ?auto_373832 ) ) ( not ( = ?auto_373821 ?auto_373833 ) ) ( not ( = ?auto_373821 ?auto_373834 ) ) ( not ( = ?auto_373822 ?auto_373823 ) ) ( not ( = ?auto_373822 ?auto_373824 ) ) ( not ( = ?auto_373822 ?auto_373825 ) ) ( not ( = ?auto_373822 ?auto_373826 ) ) ( not ( = ?auto_373822 ?auto_373827 ) ) ( not ( = ?auto_373822 ?auto_373828 ) ) ( not ( = ?auto_373822 ?auto_373829 ) ) ( not ( = ?auto_373822 ?auto_373830 ) ) ( not ( = ?auto_373822 ?auto_373831 ) ) ( not ( = ?auto_373822 ?auto_373832 ) ) ( not ( = ?auto_373822 ?auto_373833 ) ) ( not ( = ?auto_373822 ?auto_373834 ) ) ( not ( = ?auto_373823 ?auto_373824 ) ) ( not ( = ?auto_373823 ?auto_373825 ) ) ( not ( = ?auto_373823 ?auto_373826 ) ) ( not ( = ?auto_373823 ?auto_373827 ) ) ( not ( = ?auto_373823 ?auto_373828 ) ) ( not ( = ?auto_373823 ?auto_373829 ) ) ( not ( = ?auto_373823 ?auto_373830 ) ) ( not ( = ?auto_373823 ?auto_373831 ) ) ( not ( = ?auto_373823 ?auto_373832 ) ) ( not ( = ?auto_373823 ?auto_373833 ) ) ( not ( = ?auto_373823 ?auto_373834 ) ) ( not ( = ?auto_373824 ?auto_373825 ) ) ( not ( = ?auto_373824 ?auto_373826 ) ) ( not ( = ?auto_373824 ?auto_373827 ) ) ( not ( = ?auto_373824 ?auto_373828 ) ) ( not ( = ?auto_373824 ?auto_373829 ) ) ( not ( = ?auto_373824 ?auto_373830 ) ) ( not ( = ?auto_373824 ?auto_373831 ) ) ( not ( = ?auto_373824 ?auto_373832 ) ) ( not ( = ?auto_373824 ?auto_373833 ) ) ( not ( = ?auto_373824 ?auto_373834 ) ) ( not ( = ?auto_373825 ?auto_373826 ) ) ( not ( = ?auto_373825 ?auto_373827 ) ) ( not ( = ?auto_373825 ?auto_373828 ) ) ( not ( = ?auto_373825 ?auto_373829 ) ) ( not ( = ?auto_373825 ?auto_373830 ) ) ( not ( = ?auto_373825 ?auto_373831 ) ) ( not ( = ?auto_373825 ?auto_373832 ) ) ( not ( = ?auto_373825 ?auto_373833 ) ) ( not ( = ?auto_373825 ?auto_373834 ) ) ( not ( = ?auto_373826 ?auto_373827 ) ) ( not ( = ?auto_373826 ?auto_373828 ) ) ( not ( = ?auto_373826 ?auto_373829 ) ) ( not ( = ?auto_373826 ?auto_373830 ) ) ( not ( = ?auto_373826 ?auto_373831 ) ) ( not ( = ?auto_373826 ?auto_373832 ) ) ( not ( = ?auto_373826 ?auto_373833 ) ) ( not ( = ?auto_373826 ?auto_373834 ) ) ( not ( = ?auto_373827 ?auto_373828 ) ) ( not ( = ?auto_373827 ?auto_373829 ) ) ( not ( = ?auto_373827 ?auto_373830 ) ) ( not ( = ?auto_373827 ?auto_373831 ) ) ( not ( = ?auto_373827 ?auto_373832 ) ) ( not ( = ?auto_373827 ?auto_373833 ) ) ( not ( = ?auto_373827 ?auto_373834 ) ) ( not ( = ?auto_373828 ?auto_373829 ) ) ( not ( = ?auto_373828 ?auto_373830 ) ) ( not ( = ?auto_373828 ?auto_373831 ) ) ( not ( = ?auto_373828 ?auto_373832 ) ) ( not ( = ?auto_373828 ?auto_373833 ) ) ( not ( = ?auto_373828 ?auto_373834 ) ) ( not ( = ?auto_373829 ?auto_373830 ) ) ( not ( = ?auto_373829 ?auto_373831 ) ) ( not ( = ?auto_373829 ?auto_373832 ) ) ( not ( = ?auto_373829 ?auto_373833 ) ) ( not ( = ?auto_373829 ?auto_373834 ) ) ( not ( = ?auto_373830 ?auto_373831 ) ) ( not ( = ?auto_373830 ?auto_373832 ) ) ( not ( = ?auto_373830 ?auto_373833 ) ) ( not ( = ?auto_373830 ?auto_373834 ) ) ( not ( = ?auto_373831 ?auto_373832 ) ) ( not ( = ?auto_373831 ?auto_373833 ) ) ( not ( = ?auto_373831 ?auto_373834 ) ) ( not ( = ?auto_373832 ?auto_373833 ) ) ( not ( = ?auto_373832 ?auto_373834 ) ) ( not ( = ?auto_373833 ?auto_373834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_373833 ?auto_373834 )
      ( !STACK ?auto_373833 ?auto_373832 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373848 - BLOCK
      ?auto_373849 - BLOCK
      ?auto_373850 - BLOCK
      ?auto_373851 - BLOCK
      ?auto_373852 - BLOCK
      ?auto_373853 - BLOCK
      ?auto_373854 - BLOCK
      ?auto_373855 - BLOCK
      ?auto_373856 - BLOCK
      ?auto_373857 - BLOCK
      ?auto_373858 - BLOCK
      ?auto_373859 - BLOCK
      ?auto_373860 - BLOCK
    )
    :vars
    (
      ?auto_373861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_373859 ) ( ON ?auto_373860 ?auto_373861 ) ( CLEAR ?auto_373860 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_373848 ) ( ON ?auto_373849 ?auto_373848 ) ( ON ?auto_373850 ?auto_373849 ) ( ON ?auto_373851 ?auto_373850 ) ( ON ?auto_373852 ?auto_373851 ) ( ON ?auto_373853 ?auto_373852 ) ( ON ?auto_373854 ?auto_373853 ) ( ON ?auto_373855 ?auto_373854 ) ( ON ?auto_373856 ?auto_373855 ) ( ON ?auto_373857 ?auto_373856 ) ( ON ?auto_373858 ?auto_373857 ) ( ON ?auto_373859 ?auto_373858 ) ( not ( = ?auto_373848 ?auto_373849 ) ) ( not ( = ?auto_373848 ?auto_373850 ) ) ( not ( = ?auto_373848 ?auto_373851 ) ) ( not ( = ?auto_373848 ?auto_373852 ) ) ( not ( = ?auto_373848 ?auto_373853 ) ) ( not ( = ?auto_373848 ?auto_373854 ) ) ( not ( = ?auto_373848 ?auto_373855 ) ) ( not ( = ?auto_373848 ?auto_373856 ) ) ( not ( = ?auto_373848 ?auto_373857 ) ) ( not ( = ?auto_373848 ?auto_373858 ) ) ( not ( = ?auto_373848 ?auto_373859 ) ) ( not ( = ?auto_373848 ?auto_373860 ) ) ( not ( = ?auto_373848 ?auto_373861 ) ) ( not ( = ?auto_373849 ?auto_373850 ) ) ( not ( = ?auto_373849 ?auto_373851 ) ) ( not ( = ?auto_373849 ?auto_373852 ) ) ( not ( = ?auto_373849 ?auto_373853 ) ) ( not ( = ?auto_373849 ?auto_373854 ) ) ( not ( = ?auto_373849 ?auto_373855 ) ) ( not ( = ?auto_373849 ?auto_373856 ) ) ( not ( = ?auto_373849 ?auto_373857 ) ) ( not ( = ?auto_373849 ?auto_373858 ) ) ( not ( = ?auto_373849 ?auto_373859 ) ) ( not ( = ?auto_373849 ?auto_373860 ) ) ( not ( = ?auto_373849 ?auto_373861 ) ) ( not ( = ?auto_373850 ?auto_373851 ) ) ( not ( = ?auto_373850 ?auto_373852 ) ) ( not ( = ?auto_373850 ?auto_373853 ) ) ( not ( = ?auto_373850 ?auto_373854 ) ) ( not ( = ?auto_373850 ?auto_373855 ) ) ( not ( = ?auto_373850 ?auto_373856 ) ) ( not ( = ?auto_373850 ?auto_373857 ) ) ( not ( = ?auto_373850 ?auto_373858 ) ) ( not ( = ?auto_373850 ?auto_373859 ) ) ( not ( = ?auto_373850 ?auto_373860 ) ) ( not ( = ?auto_373850 ?auto_373861 ) ) ( not ( = ?auto_373851 ?auto_373852 ) ) ( not ( = ?auto_373851 ?auto_373853 ) ) ( not ( = ?auto_373851 ?auto_373854 ) ) ( not ( = ?auto_373851 ?auto_373855 ) ) ( not ( = ?auto_373851 ?auto_373856 ) ) ( not ( = ?auto_373851 ?auto_373857 ) ) ( not ( = ?auto_373851 ?auto_373858 ) ) ( not ( = ?auto_373851 ?auto_373859 ) ) ( not ( = ?auto_373851 ?auto_373860 ) ) ( not ( = ?auto_373851 ?auto_373861 ) ) ( not ( = ?auto_373852 ?auto_373853 ) ) ( not ( = ?auto_373852 ?auto_373854 ) ) ( not ( = ?auto_373852 ?auto_373855 ) ) ( not ( = ?auto_373852 ?auto_373856 ) ) ( not ( = ?auto_373852 ?auto_373857 ) ) ( not ( = ?auto_373852 ?auto_373858 ) ) ( not ( = ?auto_373852 ?auto_373859 ) ) ( not ( = ?auto_373852 ?auto_373860 ) ) ( not ( = ?auto_373852 ?auto_373861 ) ) ( not ( = ?auto_373853 ?auto_373854 ) ) ( not ( = ?auto_373853 ?auto_373855 ) ) ( not ( = ?auto_373853 ?auto_373856 ) ) ( not ( = ?auto_373853 ?auto_373857 ) ) ( not ( = ?auto_373853 ?auto_373858 ) ) ( not ( = ?auto_373853 ?auto_373859 ) ) ( not ( = ?auto_373853 ?auto_373860 ) ) ( not ( = ?auto_373853 ?auto_373861 ) ) ( not ( = ?auto_373854 ?auto_373855 ) ) ( not ( = ?auto_373854 ?auto_373856 ) ) ( not ( = ?auto_373854 ?auto_373857 ) ) ( not ( = ?auto_373854 ?auto_373858 ) ) ( not ( = ?auto_373854 ?auto_373859 ) ) ( not ( = ?auto_373854 ?auto_373860 ) ) ( not ( = ?auto_373854 ?auto_373861 ) ) ( not ( = ?auto_373855 ?auto_373856 ) ) ( not ( = ?auto_373855 ?auto_373857 ) ) ( not ( = ?auto_373855 ?auto_373858 ) ) ( not ( = ?auto_373855 ?auto_373859 ) ) ( not ( = ?auto_373855 ?auto_373860 ) ) ( not ( = ?auto_373855 ?auto_373861 ) ) ( not ( = ?auto_373856 ?auto_373857 ) ) ( not ( = ?auto_373856 ?auto_373858 ) ) ( not ( = ?auto_373856 ?auto_373859 ) ) ( not ( = ?auto_373856 ?auto_373860 ) ) ( not ( = ?auto_373856 ?auto_373861 ) ) ( not ( = ?auto_373857 ?auto_373858 ) ) ( not ( = ?auto_373857 ?auto_373859 ) ) ( not ( = ?auto_373857 ?auto_373860 ) ) ( not ( = ?auto_373857 ?auto_373861 ) ) ( not ( = ?auto_373858 ?auto_373859 ) ) ( not ( = ?auto_373858 ?auto_373860 ) ) ( not ( = ?auto_373858 ?auto_373861 ) ) ( not ( = ?auto_373859 ?auto_373860 ) ) ( not ( = ?auto_373859 ?auto_373861 ) ) ( not ( = ?auto_373860 ?auto_373861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_373860 ?auto_373861 )
      ( !STACK ?auto_373860 ?auto_373859 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373875 - BLOCK
      ?auto_373876 - BLOCK
      ?auto_373877 - BLOCK
      ?auto_373878 - BLOCK
      ?auto_373879 - BLOCK
      ?auto_373880 - BLOCK
      ?auto_373881 - BLOCK
      ?auto_373882 - BLOCK
      ?auto_373883 - BLOCK
      ?auto_373884 - BLOCK
      ?auto_373885 - BLOCK
      ?auto_373886 - BLOCK
      ?auto_373887 - BLOCK
    )
    :vars
    (
      ?auto_373888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373887 ?auto_373888 ) ( ON-TABLE ?auto_373875 ) ( ON ?auto_373876 ?auto_373875 ) ( ON ?auto_373877 ?auto_373876 ) ( ON ?auto_373878 ?auto_373877 ) ( ON ?auto_373879 ?auto_373878 ) ( ON ?auto_373880 ?auto_373879 ) ( ON ?auto_373881 ?auto_373880 ) ( ON ?auto_373882 ?auto_373881 ) ( ON ?auto_373883 ?auto_373882 ) ( ON ?auto_373884 ?auto_373883 ) ( ON ?auto_373885 ?auto_373884 ) ( not ( = ?auto_373875 ?auto_373876 ) ) ( not ( = ?auto_373875 ?auto_373877 ) ) ( not ( = ?auto_373875 ?auto_373878 ) ) ( not ( = ?auto_373875 ?auto_373879 ) ) ( not ( = ?auto_373875 ?auto_373880 ) ) ( not ( = ?auto_373875 ?auto_373881 ) ) ( not ( = ?auto_373875 ?auto_373882 ) ) ( not ( = ?auto_373875 ?auto_373883 ) ) ( not ( = ?auto_373875 ?auto_373884 ) ) ( not ( = ?auto_373875 ?auto_373885 ) ) ( not ( = ?auto_373875 ?auto_373886 ) ) ( not ( = ?auto_373875 ?auto_373887 ) ) ( not ( = ?auto_373875 ?auto_373888 ) ) ( not ( = ?auto_373876 ?auto_373877 ) ) ( not ( = ?auto_373876 ?auto_373878 ) ) ( not ( = ?auto_373876 ?auto_373879 ) ) ( not ( = ?auto_373876 ?auto_373880 ) ) ( not ( = ?auto_373876 ?auto_373881 ) ) ( not ( = ?auto_373876 ?auto_373882 ) ) ( not ( = ?auto_373876 ?auto_373883 ) ) ( not ( = ?auto_373876 ?auto_373884 ) ) ( not ( = ?auto_373876 ?auto_373885 ) ) ( not ( = ?auto_373876 ?auto_373886 ) ) ( not ( = ?auto_373876 ?auto_373887 ) ) ( not ( = ?auto_373876 ?auto_373888 ) ) ( not ( = ?auto_373877 ?auto_373878 ) ) ( not ( = ?auto_373877 ?auto_373879 ) ) ( not ( = ?auto_373877 ?auto_373880 ) ) ( not ( = ?auto_373877 ?auto_373881 ) ) ( not ( = ?auto_373877 ?auto_373882 ) ) ( not ( = ?auto_373877 ?auto_373883 ) ) ( not ( = ?auto_373877 ?auto_373884 ) ) ( not ( = ?auto_373877 ?auto_373885 ) ) ( not ( = ?auto_373877 ?auto_373886 ) ) ( not ( = ?auto_373877 ?auto_373887 ) ) ( not ( = ?auto_373877 ?auto_373888 ) ) ( not ( = ?auto_373878 ?auto_373879 ) ) ( not ( = ?auto_373878 ?auto_373880 ) ) ( not ( = ?auto_373878 ?auto_373881 ) ) ( not ( = ?auto_373878 ?auto_373882 ) ) ( not ( = ?auto_373878 ?auto_373883 ) ) ( not ( = ?auto_373878 ?auto_373884 ) ) ( not ( = ?auto_373878 ?auto_373885 ) ) ( not ( = ?auto_373878 ?auto_373886 ) ) ( not ( = ?auto_373878 ?auto_373887 ) ) ( not ( = ?auto_373878 ?auto_373888 ) ) ( not ( = ?auto_373879 ?auto_373880 ) ) ( not ( = ?auto_373879 ?auto_373881 ) ) ( not ( = ?auto_373879 ?auto_373882 ) ) ( not ( = ?auto_373879 ?auto_373883 ) ) ( not ( = ?auto_373879 ?auto_373884 ) ) ( not ( = ?auto_373879 ?auto_373885 ) ) ( not ( = ?auto_373879 ?auto_373886 ) ) ( not ( = ?auto_373879 ?auto_373887 ) ) ( not ( = ?auto_373879 ?auto_373888 ) ) ( not ( = ?auto_373880 ?auto_373881 ) ) ( not ( = ?auto_373880 ?auto_373882 ) ) ( not ( = ?auto_373880 ?auto_373883 ) ) ( not ( = ?auto_373880 ?auto_373884 ) ) ( not ( = ?auto_373880 ?auto_373885 ) ) ( not ( = ?auto_373880 ?auto_373886 ) ) ( not ( = ?auto_373880 ?auto_373887 ) ) ( not ( = ?auto_373880 ?auto_373888 ) ) ( not ( = ?auto_373881 ?auto_373882 ) ) ( not ( = ?auto_373881 ?auto_373883 ) ) ( not ( = ?auto_373881 ?auto_373884 ) ) ( not ( = ?auto_373881 ?auto_373885 ) ) ( not ( = ?auto_373881 ?auto_373886 ) ) ( not ( = ?auto_373881 ?auto_373887 ) ) ( not ( = ?auto_373881 ?auto_373888 ) ) ( not ( = ?auto_373882 ?auto_373883 ) ) ( not ( = ?auto_373882 ?auto_373884 ) ) ( not ( = ?auto_373882 ?auto_373885 ) ) ( not ( = ?auto_373882 ?auto_373886 ) ) ( not ( = ?auto_373882 ?auto_373887 ) ) ( not ( = ?auto_373882 ?auto_373888 ) ) ( not ( = ?auto_373883 ?auto_373884 ) ) ( not ( = ?auto_373883 ?auto_373885 ) ) ( not ( = ?auto_373883 ?auto_373886 ) ) ( not ( = ?auto_373883 ?auto_373887 ) ) ( not ( = ?auto_373883 ?auto_373888 ) ) ( not ( = ?auto_373884 ?auto_373885 ) ) ( not ( = ?auto_373884 ?auto_373886 ) ) ( not ( = ?auto_373884 ?auto_373887 ) ) ( not ( = ?auto_373884 ?auto_373888 ) ) ( not ( = ?auto_373885 ?auto_373886 ) ) ( not ( = ?auto_373885 ?auto_373887 ) ) ( not ( = ?auto_373885 ?auto_373888 ) ) ( not ( = ?auto_373886 ?auto_373887 ) ) ( not ( = ?auto_373886 ?auto_373888 ) ) ( not ( = ?auto_373887 ?auto_373888 ) ) ( CLEAR ?auto_373885 ) ( ON ?auto_373886 ?auto_373887 ) ( CLEAR ?auto_373886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_373875 ?auto_373876 ?auto_373877 ?auto_373878 ?auto_373879 ?auto_373880 ?auto_373881 ?auto_373882 ?auto_373883 ?auto_373884 ?auto_373885 ?auto_373886 )
      ( MAKE-13PILE ?auto_373875 ?auto_373876 ?auto_373877 ?auto_373878 ?auto_373879 ?auto_373880 ?auto_373881 ?auto_373882 ?auto_373883 ?auto_373884 ?auto_373885 ?auto_373886 ?auto_373887 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373902 - BLOCK
      ?auto_373903 - BLOCK
      ?auto_373904 - BLOCK
      ?auto_373905 - BLOCK
      ?auto_373906 - BLOCK
      ?auto_373907 - BLOCK
      ?auto_373908 - BLOCK
      ?auto_373909 - BLOCK
      ?auto_373910 - BLOCK
      ?auto_373911 - BLOCK
      ?auto_373912 - BLOCK
      ?auto_373913 - BLOCK
      ?auto_373914 - BLOCK
    )
    :vars
    (
      ?auto_373915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373914 ?auto_373915 ) ( ON-TABLE ?auto_373902 ) ( ON ?auto_373903 ?auto_373902 ) ( ON ?auto_373904 ?auto_373903 ) ( ON ?auto_373905 ?auto_373904 ) ( ON ?auto_373906 ?auto_373905 ) ( ON ?auto_373907 ?auto_373906 ) ( ON ?auto_373908 ?auto_373907 ) ( ON ?auto_373909 ?auto_373908 ) ( ON ?auto_373910 ?auto_373909 ) ( ON ?auto_373911 ?auto_373910 ) ( ON ?auto_373912 ?auto_373911 ) ( not ( = ?auto_373902 ?auto_373903 ) ) ( not ( = ?auto_373902 ?auto_373904 ) ) ( not ( = ?auto_373902 ?auto_373905 ) ) ( not ( = ?auto_373902 ?auto_373906 ) ) ( not ( = ?auto_373902 ?auto_373907 ) ) ( not ( = ?auto_373902 ?auto_373908 ) ) ( not ( = ?auto_373902 ?auto_373909 ) ) ( not ( = ?auto_373902 ?auto_373910 ) ) ( not ( = ?auto_373902 ?auto_373911 ) ) ( not ( = ?auto_373902 ?auto_373912 ) ) ( not ( = ?auto_373902 ?auto_373913 ) ) ( not ( = ?auto_373902 ?auto_373914 ) ) ( not ( = ?auto_373902 ?auto_373915 ) ) ( not ( = ?auto_373903 ?auto_373904 ) ) ( not ( = ?auto_373903 ?auto_373905 ) ) ( not ( = ?auto_373903 ?auto_373906 ) ) ( not ( = ?auto_373903 ?auto_373907 ) ) ( not ( = ?auto_373903 ?auto_373908 ) ) ( not ( = ?auto_373903 ?auto_373909 ) ) ( not ( = ?auto_373903 ?auto_373910 ) ) ( not ( = ?auto_373903 ?auto_373911 ) ) ( not ( = ?auto_373903 ?auto_373912 ) ) ( not ( = ?auto_373903 ?auto_373913 ) ) ( not ( = ?auto_373903 ?auto_373914 ) ) ( not ( = ?auto_373903 ?auto_373915 ) ) ( not ( = ?auto_373904 ?auto_373905 ) ) ( not ( = ?auto_373904 ?auto_373906 ) ) ( not ( = ?auto_373904 ?auto_373907 ) ) ( not ( = ?auto_373904 ?auto_373908 ) ) ( not ( = ?auto_373904 ?auto_373909 ) ) ( not ( = ?auto_373904 ?auto_373910 ) ) ( not ( = ?auto_373904 ?auto_373911 ) ) ( not ( = ?auto_373904 ?auto_373912 ) ) ( not ( = ?auto_373904 ?auto_373913 ) ) ( not ( = ?auto_373904 ?auto_373914 ) ) ( not ( = ?auto_373904 ?auto_373915 ) ) ( not ( = ?auto_373905 ?auto_373906 ) ) ( not ( = ?auto_373905 ?auto_373907 ) ) ( not ( = ?auto_373905 ?auto_373908 ) ) ( not ( = ?auto_373905 ?auto_373909 ) ) ( not ( = ?auto_373905 ?auto_373910 ) ) ( not ( = ?auto_373905 ?auto_373911 ) ) ( not ( = ?auto_373905 ?auto_373912 ) ) ( not ( = ?auto_373905 ?auto_373913 ) ) ( not ( = ?auto_373905 ?auto_373914 ) ) ( not ( = ?auto_373905 ?auto_373915 ) ) ( not ( = ?auto_373906 ?auto_373907 ) ) ( not ( = ?auto_373906 ?auto_373908 ) ) ( not ( = ?auto_373906 ?auto_373909 ) ) ( not ( = ?auto_373906 ?auto_373910 ) ) ( not ( = ?auto_373906 ?auto_373911 ) ) ( not ( = ?auto_373906 ?auto_373912 ) ) ( not ( = ?auto_373906 ?auto_373913 ) ) ( not ( = ?auto_373906 ?auto_373914 ) ) ( not ( = ?auto_373906 ?auto_373915 ) ) ( not ( = ?auto_373907 ?auto_373908 ) ) ( not ( = ?auto_373907 ?auto_373909 ) ) ( not ( = ?auto_373907 ?auto_373910 ) ) ( not ( = ?auto_373907 ?auto_373911 ) ) ( not ( = ?auto_373907 ?auto_373912 ) ) ( not ( = ?auto_373907 ?auto_373913 ) ) ( not ( = ?auto_373907 ?auto_373914 ) ) ( not ( = ?auto_373907 ?auto_373915 ) ) ( not ( = ?auto_373908 ?auto_373909 ) ) ( not ( = ?auto_373908 ?auto_373910 ) ) ( not ( = ?auto_373908 ?auto_373911 ) ) ( not ( = ?auto_373908 ?auto_373912 ) ) ( not ( = ?auto_373908 ?auto_373913 ) ) ( not ( = ?auto_373908 ?auto_373914 ) ) ( not ( = ?auto_373908 ?auto_373915 ) ) ( not ( = ?auto_373909 ?auto_373910 ) ) ( not ( = ?auto_373909 ?auto_373911 ) ) ( not ( = ?auto_373909 ?auto_373912 ) ) ( not ( = ?auto_373909 ?auto_373913 ) ) ( not ( = ?auto_373909 ?auto_373914 ) ) ( not ( = ?auto_373909 ?auto_373915 ) ) ( not ( = ?auto_373910 ?auto_373911 ) ) ( not ( = ?auto_373910 ?auto_373912 ) ) ( not ( = ?auto_373910 ?auto_373913 ) ) ( not ( = ?auto_373910 ?auto_373914 ) ) ( not ( = ?auto_373910 ?auto_373915 ) ) ( not ( = ?auto_373911 ?auto_373912 ) ) ( not ( = ?auto_373911 ?auto_373913 ) ) ( not ( = ?auto_373911 ?auto_373914 ) ) ( not ( = ?auto_373911 ?auto_373915 ) ) ( not ( = ?auto_373912 ?auto_373913 ) ) ( not ( = ?auto_373912 ?auto_373914 ) ) ( not ( = ?auto_373912 ?auto_373915 ) ) ( not ( = ?auto_373913 ?auto_373914 ) ) ( not ( = ?auto_373913 ?auto_373915 ) ) ( not ( = ?auto_373914 ?auto_373915 ) ) ( CLEAR ?auto_373912 ) ( ON ?auto_373913 ?auto_373914 ) ( CLEAR ?auto_373913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_373902 ?auto_373903 ?auto_373904 ?auto_373905 ?auto_373906 ?auto_373907 ?auto_373908 ?auto_373909 ?auto_373910 ?auto_373911 ?auto_373912 ?auto_373913 )
      ( MAKE-13PILE ?auto_373902 ?auto_373903 ?auto_373904 ?auto_373905 ?auto_373906 ?auto_373907 ?auto_373908 ?auto_373909 ?auto_373910 ?auto_373911 ?auto_373912 ?auto_373913 ?auto_373914 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373929 - BLOCK
      ?auto_373930 - BLOCK
      ?auto_373931 - BLOCK
      ?auto_373932 - BLOCK
      ?auto_373933 - BLOCK
      ?auto_373934 - BLOCK
      ?auto_373935 - BLOCK
      ?auto_373936 - BLOCK
      ?auto_373937 - BLOCK
      ?auto_373938 - BLOCK
      ?auto_373939 - BLOCK
      ?auto_373940 - BLOCK
      ?auto_373941 - BLOCK
    )
    :vars
    (
      ?auto_373942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373941 ?auto_373942 ) ( ON-TABLE ?auto_373929 ) ( ON ?auto_373930 ?auto_373929 ) ( ON ?auto_373931 ?auto_373930 ) ( ON ?auto_373932 ?auto_373931 ) ( ON ?auto_373933 ?auto_373932 ) ( ON ?auto_373934 ?auto_373933 ) ( ON ?auto_373935 ?auto_373934 ) ( ON ?auto_373936 ?auto_373935 ) ( ON ?auto_373937 ?auto_373936 ) ( ON ?auto_373938 ?auto_373937 ) ( not ( = ?auto_373929 ?auto_373930 ) ) ( not ( = ?auto_373929 ?auto_373931 ) ) ( not ( = ?auto_373929 ?auto_373932 ) ) ( not ( = ?auto_373929 ?auto_373933 ) ) ( not ( = ?auto_373929 ?auto_373934 ) ) ( not ( = ?auto_373929 ?auto_373935 ) ) ( not ( = ?auto_373929 ?auto_373936 ) ) ( not ( = ?auto_373929 ?auto_373937 ) ) ( not ( = ?auto_373929 ?auto_373938 ) ) ( not ( = ?auto_373929 ?auto_373939 ) ) ( not ( = ?auto_373929 ?auto_373940 ) ) ( not ( = ?auto_373929 ?auto_373941 ) ) ( not ( = ?auto_373929 ?auto_373942 ) ) ( not ( = ?auto_373930 ?auto_373931 ) ) ( not ( = ?auto_373930 ?auto_373932 ) ) ( not ( = ?auto_373930 ?auto_373933 ) ) ( not ( = ?auto_373930 ?auto_373934 ) ) ( not ( = ?auto_373930 ?auto_373935 ) ) ( not ( = ?auto_373930 ?auto_373936 ) ) ( not ( = ?auto_373930 ?auto_373937 ) ) ( not ( = ?auto_373930 ?auto_373938 ) ) ( not ( = ?auto_373930 ?auto_373939 ) ) ( not ( = ?auto_373930 ?auto_373940 ) ) ( not ( = ?auto_373930 ?auto_373941 ) ) ( not ( = ?auto_373930 ?auto_373942 ) ) ( not ( = ?auto_373931 ?auto_373932 ) ) ( not ( = ?auto_373931 ?auto_373933 ) ) ( not ( = ?auto_373931 ?auto_373934 ) ) ( not ( = ?auto_373931 ?auto_373935 ) ) ( not ( = ?auto_373931 ?auto_373936 ) ) ( not ( = ?auto_373931 ?auto_373937 ) ) ( not ( = ?auto_373931 ?auto_373938 ) ) ( not ( = ?auto_373931 ?auto_373939 ) ) ( not ( = ?auto_373931 ?auto_373940 ) ) ( not ( = ?auto_373931 ?auto_373941 ) ) ( not ( = ?auto_373931 ?auto_373942 ) ) ( not ( = ?auto_373932 ?auto_373933 ) ) ( not ( = ?auto_373932 ?auto_373934 ) ) ( not ( = ?auto_373932 ?auto_373935 ) ) ( not ( = ?auto_373932 ?auto_373936 ) ) ( not ( = ?auto_373932 ?auto_373937 ) ) ( not ( = ?auto_373932 ?auto_373938 ) ) ( not ( = ?auto_373932 ?auto_373939 ) ) ( not ( = ?auto_373932 ?auto_373940 ) ) ( not ( = ?auto_373932 ?auto_373941 ) ) ( not ( = ?auto_373932 ?auto_373942 ) ) ( not ( = ?auto_373933 ?auto_373934 ) ) ( not ( = ?auto_373933 ?auto_373935 ) ) ( not ( = ?auto_373933 ?auto_373936 ) ) ( not ( = ?auto_373933 ?auto_373937 ) ) ( not ( = ?auto_373933 ?auto_373938 ) ) ( not ( = ?auto_373933 ?auto_373939 ) ) ( not ( = ?auto_373933 ?auto_373940 ) ) ( not ( = ?auto_373933 ?auto_373941 ) ) ( not ( = ?auto_373933 ?auto_373942 ) ) ( not ( = ?auto_373934 ?auto_373935 ) ) ( not ( = ?auto_373934 ?auto_373936 ) ) ( not ( = ?auto_373934 ?auto_373937 ) ) ( not ( = ?auto_373934 ?auto_373938 ) ) ( not ( = ?auto_373934 ?auto_373939 ) ) ( not ( = ?auto_373934 ?auto_373940 ) ) ( not ( = ?auto_373934 ?auto_373941 ) ) ( not ( = ?auto_373934 ?auto_373942 ) ) ( not ( = ?auto_373935 ?auto_373936 ) ) ( not ( = ?auto_373935 ?auto_373937 ) ) ( not ( = ?auto_373935 ?auto_373938 ) ) ( not ( = ?auto_373935 ?auto_373939 ) ) ( not ( = ?auto_373935 ?auto_373940 ) ) ( not ( = ?auto_373935 ?auto_373941 ) ) ( not ( = ?auto_373935 ?auto_373942 ) ) ( not ( = ?auto_373936 ?auto_373937 ) ) ( not ( = ?auto_373936 ?auto_373938 ) ) ( not ( = ?auto_373936 ?auto_373939 ) ) ( not ( = ?auto_373936 ?auto_373940 ) ) ( not ( = ?auto_373936 ?auto_373941 ) ) ( not ( = ?auto_373936 ?auto_373942 ) ) ( not ( = ?auto_373937 ?auto_373938 ) ) ( not ( = ?auto_373937 ?auto_373939 ) ) ( not ( = ?auto_373937 ?auto_373940 ) ) ( not ( = ?auto_373937 ?auto_373941 ) ) ( not ( = ?auto_373937 ?auto_373942 ) ) ( not ( = ?auto_373938 ?auto_373939 ) ) ( not ( = ?auto_373938 ?auto_373940 ) ) ( not ( = ?auto_373938 ?auto_373941 ) ) ( not ( = ?auto_373938 ?auto_373942 ) ) ( not ( = ?auto_373939 ?auto_373940 ) ) ( not ( = ?auto_373939 ?auto_373941 ) ) ( not ( = ?auto_373939 ?auto_373942 ) ) ( not ( = ?auto_373940 ?auto_373941 ) ) ( not ( = ?auto_373940 ?auto_373942 ) ) ( not ( = ?auto_373941 ?auto_373942 ) ) ( ON ?auto_373940 ?auto_373941 ) ( CLEAR ?auto_373938 ) ( ON ?auto_373939 ?auto_373940 ) ( CLEAR ?auto_373939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_373929 ?auto_373930 ?auto_373931 ?auto_373932 ?auto_373933 ?auto_373934 ?auto_373935 ?auto_373936 ?auto_373937 ?auto_373938 ?auto_373939 )
      ( MAKE-13PILE ?auto_373929 ?auto_373930 ?auto_373931 ?auto_373932 ?auto_373933 ?auto_373934 ?auto_373935 ?auto_373936 ?auto_373937 ?auto_373938 ?auto_373939 ?auto_373940 ?auto_373941 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373956 - BLOCK
      ?auto_373957 - BLOCK
      ?auto_373958 - BLOCK
      ?auto_373959 - BLOCK
      ?auto_373960 - BLOCK
      ?auto_373961 - BLOCK
      ?auto_373962 - BLOCK
      ?auto_373963 - BLOCK
      ?auto_373964 - BLOCK
      ?auto_373965 - BLOCK
      ?auto_373966 - BLOCK
      ?auto_373967 - BLOCK
      ?auto_373968 - BLOCK
    )
    :vars
    (
      ?auto_373969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373968 ?auto_373969 ) ( ON-TABLE ?auto_373956 ) ( ON ?auto_373957 ?auto_373956 ) ( ON ?auto_373958 ?auto_373957 ) ( ON ?auto_373959 ?auto_373958 ) ( ON ?auto_373960 ?auto_373959 ) ( ON ?auto_373961 ?auto_373960 ) ( ON ?auto_373962 ?auto_373961 ) ( ON ?auto_373963 ?auto_373962 ) ( ON ?auto_373964 ?auto_373963 ) ( ON ?auto_373965 ?auto_373964 ) ( not ( = ?auto_373956 ?auto_373957 ) ) ( not ( = ?auto_373956 ?auto_373958 ) ) ( not ( = ?auto_373956 ?auto_373959 ) ) ( not ( = ?auto_373956 ?auto_373960 ) ) ( not ( = ?auto_373956 ?auto_373961 ) ) ( not ( = ?auto_373956 ?auto_373962 ) ) ( not ( = ?auto_373956 ?auto_373963 ) ) ( not ( = ?auto_373956 ?auto_373964 ) ) ( not ( = ?auto_373956 ?auto_373965 ) ) ( not ( = ?auto_373956 ?auto_373966 ) ) ( not ( = ?auto_373956 ?auto_373967 ) ) ( not ( = ?auto_373956 ?auto_373968 ) ) ( not ( = ?auto_373956 ?auto_373969 ) ) ( not ( = ?auto_373957 ?auto_373958 ) ) ( not ( = ?auto_373957 ?auto_373959 ) ) ( not ( = ?auto_373957 ?auto_373960 ) ) ( not ( = ?auto_373957 ?auto_373961 ) ) ( not ( = ?auto_373957 ?auto_373962 ) ) ( not ( = ?auto_373957 ?auto_373963 ) ) ( not ( = ?auto_373957 ?auto_373964 ) ) ( not ( = ?auto_373957 ?auto_373965 ) ) ( not ( = ?auto_373957 ?auto_373966 ) ) ( not ( = ?auto_373957 ?auto_373967 ) ) ( not ( = ?auto_373957 ?auto_373968 ) ) ( not ( = ?auto_373957 ?auto_373969 ) ) ( not ( = ?auto_373958 ?auto_373959 ) ) ( not ( = ?auto_373958 ?auto_373960 ) ) ( not ( = ?auto_373958 ?auto_373961 ) ) ( not ( = ?auto_373958 ?auto_373962 ) ) ( not ( = ?auto_373958 ?auto_373963 ) ) ( not ( = ?auto_373958 ?auto_373964 ) ) ( not ( = ?auto_373958 ?auto_373965 ) ) ( not ( = ?auto_373958 ?auto_373966 ) ) ( not ( = ?auto_373958 ?auto_373967 ) ) ( not ( = ?auto_373958 ?auto_373968 ) ) ( not ( = ?auto_373958 ?auto_373969 ) ) ( not ( = ?auto_373959 ?auto_373960 ) ) ( not ( = ?auto_373959 ?auto_373961 ) ) ( not ( = ?auto_373959 ?auto_373962 ) ) ( not ( = ?auto_373959 ?auto_373963 ) ) ( not ( = ?auto_373959 ?auto_373964 ) ) ( not ( = ?auto_373959 ?auto_373965 ) ) ( not ( = ?auto_373959 ?auto_373966 ) ) ( not ( = ?auto_373959 ?auto_373967 ) ) ( not ( = ?auto_373959 ?auto_373968 ) ) ( not ( = ?auto_373959 ?auto_373969 ) ) ( not ( = ?auto_373960 ?auto_373961 ) ) ( not ( = ?auto_373960 ?auto_373962 ) ) ( not ( = ?auto_373960 ?auto_373963 ) ) ( not ( = ?auto_373960 ?auto_373964 ) ) ( not ( = ?auto_373960 ?auto_373965 ) ) ( not ( = ?auto_373960 ?auto_373966 ) ) ( not ( = ?auto_373960 ?auto_373967 ) ) ( not ( = ?auto_373960 ?auto_373968 ) ) ( not ( = ?auto_373960 ?auto_373969 ) ) ( not ( = ?auto_373961 ?auto_373962 ) ) ( not ( = ?auto_373961 ?auto_373963 ) ) ( not ( = ?auto_373961 ?auto_373964 ) ) ( not ( = ?auto_373961 ?auto_373965 ) ) ( not ( = ?auto_373961 ?auto_373966 ) ) ( not ( = ?auto_373961 ?auto_373967 ) ) ( not ( = ?auto_373961 ?auto_373968 ) ) ( not ( = ?auto_373961 ?auto_373969 ) ) ( not ( = ?auto_373962 ?auto_373963 ) ) ( not ( = ?auto_373962 ?auto_373964 ) ) ( not ( = ?auto_373962 ?auto_373965 ) ) ( not ( = ?auto_373962 ?auto_373966 ) ) ( not ( = ?auto_373962 ?auto_373967 ) ) ( not ( = ?auto_373962 ?auto_373968 ) ) ( not ( = ?auto_373962 ?auto_373969 ) ) ( not ( = ?auto_373963 ?auto_373964 ) ) ( not ( = ?auto_373963 ?auto_373965 ) ) ( not ( = ?auto_373963 ?auto_373966 ) ) ( not ( = ?auto_373963 ?auto_373967 ) ) ( not ( = ?auto_373963 ?auto_373968 ) ) ( not ( = ?auto_373963 ?auto_373969 ) ) ( not ( = ?auto_373964 ?auto_373965 ) ) ( not ( = ?auto_373964 ?auto_373966 ) ) ( not ( = ?auto_373964 ?auto_373967 ) ) ( not ( = ?auto_373964 ?auto_373968 ) ) ( not ( = ?auto_373964 ?auto_373969 ) ) ( not ( = ?auto_373965 ?auto_373966 ) ) ( not ( = ?auto_373965 ?auto_373967 ) ) ( not ( = ?auto_373965 ?auto_373968 ) ) ( not ( = ?auto_373965 ?auto_373969 ) ) ( not ( = ?auto_373966 ?auto_373967 ) ) ( not ( = ?auto_373966 ?auto_373968 ) ) ( not ( = ?auto_373966 ?auto_373969 ) ) ( not ( = ?auto_373967 ?auto_373968 ) ) ( not ( = ?auto_373967 ?auto_373969 ) ) ( not ( = ?auto_373968 ?auto_373969 ) ) ( ON ?auto_373967 ?auto_373968 ) ( CLEAR ?auto_373965 ) ( ON ?auto_373966 ?auto_373967 ) ( CLEAR ?auto_373966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_373956 ?auto_373957 ?auto_373958 ?auto_373959 ?auto_373960 ?auto_373961 ?auto_373962 ?auto_373963 ?auto_373964 ?auto_373965 ?auto_373966 )
      ( MAKE-13PILE ?auto_373956 ?auto_373957 ?auto_373958 ?auto_373959 ?auto_373960 ?auto_373961 ?auto_373962 ?auto_373963 ?auto_373964 ?auto_373965 ?auto_373966 ?auto_373967 ?auto_373968 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_373983 - BLOCK
      ?auto_373984 - BLOCK
      ?auto_373985 - BLOCK
      ?auto_373986 - BLOCK
      ?auto_373987 - BLOCK
      ?auto_373988 - BLOCK
      ?auto_373989 - BLOCK
      ?auto_373990 - BLOCK
      ?auto_373991 - BLOCK
      ?auto_373992 - BLOCK
      ?auto_373993 - BLOCK
      ?auto_373994 - BLOCK
      ?auto_373995 - BLOCK
    )
    :vars
    (
      ?auto_373996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_373995 ?auto_373996 ) ( ON-TABLE ?auto_373983 ) ( ON ?auto_373984 ?auto_373983 ) ( ON ?auto_373985 ?auto_373984 ) ( ON ?auto_373986 ?auto_373985 ) ( ON ?auto_373987 ?auto_373986 ) ( ON ?auto_373988 ?auto_373987 ) ( ON ?auto_373989 ?auto_373988 ) ( ON ?auto_373990 ?auto_373989 ) ( ON ?auto_373991 ?auto_373990 ) ( not ( = ?auto_373983 ?auto_373984 ) ) ( not ( = ?auto_373983 ?auto_373985 ) ) ( not ( = ?auto_373983 ?auto_373986 ) ) ( not ( = ?auto_373983 ?auto_373987 ) ) ( not ( = ?auto_373983 ?auto_373988 ) ) ( not ( = ?auto_373983 ?auto_373989 ) ) ( not ( = ?auto_373983 ?auto_373990 ) ) ( not ( = ?auto_373983 ?auto_373991 ) ) ( not ( = ?auto_373983 ?auto_373992 ) ) ( not ( = ?auto_373983 ?auto_373993 ) ) ( not ( = ?auto_373983 ?auto_373994 ) ) ( not ( = ?auto_373983 ?auto_373995 ) ) ( not ( = ?auto_373983 ?auto_373996 ) ) ( not ( = ?auto_373984 ?auto_373985 ) ) ( not ( = ?auto_373984 ?auto_373986 ) ) ( not ( = ?auto_373984 ?auto_373987 ) ) ( not ( = ?auto_373984 ?auto_373988 ) ) ( not ( = ?auto_373984 ?auto_373989 ) ) ( not ( = ?auto_373984 ?auto_373990 ) ) ( not ( = ?auto_373984 ?auto_373991 ) ) ( not ( = ?auto_373984 ?auto_373992 ) ) ( not ( = ?auto_373984 ?auto_373993 ) ) ( not ( = ?auto_373984 ?auto_373994 ) ) ( not ( = ?auto_373984 ?auto_373995 ) ) ( not ( = ?auto_373984 ?auto_373996 ) ) ( not ( = ?auto_373985 ?auto_373986 ) ) ( not ( = ?auto_373985 ?auto_373987 ) ) ( not ( = ?auto_373985 ?auto_373988 ) ) ( not ( = ?auto_373985 ?auto_373989 ) ) ( not ( = ?auto_373985 ?auto_373990 ) ) ( not ( = ?auto_373985 ?auto_373991 ) ) ( not ( = ?auto_373985 ?auto_373992 ) ) ( not ( = ?auto_373985 ?auto_373993 ) ) ( not ( = ?auto_373985 ?auto_373994 ) ) ( not ( = ?auto_373985 ?auto_373995 ) ) ( not ( = ?auto_373985 ?auto_373996 ) ) ( not ( = ?auto_373986 ?auto_373987 ) ) ( not ( = ?auto_373986 ?auto_373988 ) ) ( not ( = ?auto_373986 ?auto_373989 ) ) ( not ( = ?auto_373986 ?auto_373990 ) ) ( not ( = ?auto_373986 ?auto_373991 ) ) ( not ( = ?auto_373986 ?auto_373992 ) ) ( not ( = ?auto_373986 ?auto_373993 ) ) ( not ( = ?auto_373986 ?auto_373994 ) ) ( not ( = ?auto_373986 ?auto_373995 ) ) ( not ( = ?auto_373986 ?auto_373996 ) ) ( not ( = ?auto_373987 ?auto_373988 ) ) ( not ( = ?auto_373987 ?auto_373989 ) ) ( not ( = ?auto_373987 ?auto_373990 ) ) ( not ( = ?auto_373987 ?auto_373991 ) ) ( not ( = ?auto_373987 ?auto_373992 ) ) ( not ( = ?auto_373987 ?auto_373993 ) ) ( not ( = ?auto_373987 ?auto_373994 ) ) ( not ( = ?auto_373987 ?auto_373995 ) ) ( not ( = ?auto_373987 ?auto_373996 ) ) ( not ( = ?auto_373988 ?auto_373989 ) ) ( not ( = ?auto_373988 ?auto_373990 ) ) ( not ( = ?auto_373988 ?auto_373991 ) ) ( not ( = ?auto_373988 ?auto_373992 ) ) ( not ( = ?auto_373988 ?auto_373993 ) ) ( not ( = ?auto_373988 ?auto_373994 ) ) ( not ( = ?auto_373988 ?auto_373995 ) ) ( not ( = ?auto_373988 ?auto_373996 ) ) ( not ( = ?auto_373989 ?auto_373990 ) ) ( not ( = ?auto_373989 ?auto_373991 ) ) ( not ( = ?auto_373989 ?auto_373992 ) ) ( not ( = ?auto_373989 ?auto_373993 ) ) ( not ( = ?auto_373989 ?auto_373994 ) ) ( not ( = ?auto_373989 ?auto_373995 ) ) ( not ( = ?auto_373989 ?auto_373996 ) ) ( not ( = ?auto_373990 ?auto_373991 ) ) ( not ( = ?auto_373990 ?auto_373992 ) ) ( not ( = ?auto_373990 ?auto_373993 ) ) ( not ( = ?auto_373990 ?auto_373994 ) ) ( not ( = ?auto_373990 ?auto_373995 ) ) ( not ( = ?auto_373990 ?auto_373996 ) ) ( not ( = ?auto_373991 ?auto_373992 ) ) ( not ( = ?auto_373991 ?auto_373993 ) ) ( not ( = ?auto_373991 ?auto_373994 ) ) ( not ( = ?auto_373991 ?auto_373995 ) ) ( not ( = ?auto_373991 ?auto_373996 ) ) ( not ( = ?auto_373992 ?auto_373993 ) ) ( not ( = ?auto_373992 ?auto_373994 ) ) ( not ( = ?auto_373992 ?auto_373995 ) ) ( not ( = ?auto_373992 ?auto_373996 ) ) ( not ( = ?auto_373993 ?auto_373994 ) ) ( not ( = ?auto_373993 ?auto_373995 ) ) ( not ( = ?auto_373993 ?auto_373996 ) ) ( not ( = ?auto_373994 ?auto_373995 ) ) ( not ( = ?auto_373994 ?auto_373996 ) ) ( not ( = ?auto_373995 ?auto_373996 ) ) ( ON ?auto_373994 ?auto_373995 ) ( ON ?auto_373993 ?auto_373994 ) ( CLEAR ?auto_373991 ) ( ON ?auto_373992 ?auto_373993 ) ( CLEAR ?auto_373992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_373983 ?auto_373984 ?auto_373985 ?auto_373986 ?auto_373987 ?auto_373988 ?auto_373989 ?auto_373990 ?auto_373991 ?auto_373992 )
      ( MAKE-13PILE ?auto_373983 ?auto_373984 ?auto_373985 ?auto_373986 ?auto_373987 ?auto_373988 ?auto_373989 ?auto_373990 ?auto_373991 ?auto_373992 ?auto_373993 ?auto_373994 ?auto_373995 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374010 - BLOCK
      ?auto_374011 - BLOCK
      ?auto_374012 - BLOCK
      ?auto_374013 - BLOCK
      ?auto_374014 - BLOCK
      ?auto_374015 - BLOCK
      ?auto_374016 - BLOCK
      ?auto_374017 - BLOCK
      ?auto_374018 - BLOCK
      ?auto_374019 - BLOCK
      ?auto_374020 - BLOCK
      ?auto_374021 - BLOCK
      ?auto_374022 - BLOCK
    )
    :vars
    (
      ?auto_374023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374022 ?auto_374023 ) ( ON-TABLE ?auto_374010 ) ( ON ?auto_374011 ?auto_374010 ) ( ON ?auto_374012 ?auto_374011 ) ( ON ?auto_374013 ?auto_374012 ) ( ON ?auto_374014 ?auto_374013 ) ( ON ?auto_374015 ?auto_374014 ) ( ON ?auto_374016 ?auto_374015 ) ( ON ?auto_374017 ?auto_374016 ) ( ON ?auto_374018 ?auto_374017 ) ( not ( = ?auto_374010 ?auto_374011 ) ) ( not ( = ?auto_374010 ?auto_374012 ) ) ( not ( = ?auto_374010 ?auto_374013 ) ) ( not ( = ?auto_374010 ?auto_374014 ) ) ( not ( = ?auto_374010 ?auto_374015 ) ) ( not ( = ?auto_374010 ?auto_374016 ) ) ( not ( = ?auto_374010 ?auto_374017 ) ) ( not ( = ?auto_374010 ?auto_374018 ) ) ( not ( = ?auto_374010 ?auto_374019 ) ) ( not ( = ?auto_374010 ?auto_374020 ) ) ( not ( = ?auto_374010 ?auto_374021 ) ) ( not ( = ?auto_374010 ?auto_374022 ) ) ( not ( = ?auto_374010 ?auto_374023 ) ) ( not ( = ?auto_374011 ?auto_374012 ) ) ( not ( = ?auto_374011 ?auto_374013 ) ) ( not ( = ?auto_374011 ?auto_374014 ) ) ( not ( = ?auto_374011 ?auto_374015 ) ) ( not ( = ?auto_374011 ?auto_374016 ) ) ( not ( = ?auto_374011 ?auto_374017 ) ) ( not ( = ?auto_374011 ?auto_374018 ) ) ( not ( = ?auto_374011 ?auto_374019 ) ) ( not ( = ?auto_374011 ?auto_374020 ) ) ( not ( = ?auto_374011 ?auto_374021 ) ) ( not ( = ?auto_374011 ?auto_374022 ) ) ( not ( = ?auto_374011 ?auto_374023 ) ) ( not ( = ?auto_374012 ?auto_374013 ) ) ( not ( = ?auto_374012 ?auto_374014 ) ) ( not ( = ?auto_374012 ?auto_374015 ) ) ( not ( = ?auto_374012 ?auto_374016 ) ) ( not ( = ?auto_374012 ?auto_374017 ) ) ( not ( = ?auto_374012 ?auto_374018 ) ) ( not ( = ?auto_374012 ?auto_374019 ) ) ( not ( = ?auto_374012 ?auto_374020 ) ) ( not ( = ?auto_374012 ?auto_374021 ) ) ( not ( = ?auto_374012 ?auto_374022 ) ) ( not ( = ?auto_374012 ?auto_374023 ) ) ( not ( = ?auto_374013 ?auto_374014 ) ) ( not ( = ?auto_374013 ?auto_374015 ) ) ( not ( = ?auto_374013 ?auto_374016 ) ) ( not ( = ?auto_374013 ?auto_374017 ) ) ( not ( = ?auto_374013 ?auto_374018 ) ) ( not ( = ?auto_374013 ?auto_374019 ) ) ( not ( = ?auto_374013 ?auto_374020 ) ) ( not ( = ?auto_374013 ?auto_374021 ) ) ( not ( = ?auto_374013 ?auto_374022 ) ) ( not ( = ?auto_374013 ?auto_374023 ) ) ( not ( = ?auto_374014 ?auto_374015 ) ) ( not ( = ?auto_374014 ?auto_374016 ) ) ( not ( = ?auto_374014 ?auto_374017 ) ) ( not ( = ?auto_374014 ?auto_374018 ) ) ( not ( = ?auto_374014 ?auto_374019 ) ) ( not ( = ?auto_374014 ?auto_374020 ) ) ( not ( = ?auto_374014 ?auto_374021 ) ) ( not ( = ?auto_374014 ?auto_374022 ) ) ( not ( = ?auto_374014 ?auto_374023 ) ) ( not ( = ?auto_374015 ?auto_374016 ) ) ( not ( = ?auto_374015 ?auto_374017 ) ) ( not ( = ?auto_374015 ?auto_374018 ) ) ( not ( = ?auto_374015 ?auto_374019 ) ) ( not ( = ?auto_374015 ?auto_374020 ) ) ( not ( = ?auto_374015 ?auto_374021 ) ) ( not ( = ?auto_374015 ?auto_374022 ) ) ( not ( = ?auto_374015 ?auto_374023 ) ) ( not ( = ?auto_374016 ?auto_374017 ) ) ( not ( = ?auto_374016 ?auto_374018 ) ) ( not ( = ?auto_374016 ?auto_374019 ) ) ( not ( = ?auto_374016 ?auto_374020 ) ) ( not ( = ?auto_374016 ?auto_374021 ) ) ( not ( = ?auto_374016 ?auto_374022 ) ) ( not ( = ?auto_374016 ?auto_374023 ) ) ( not ( = ?auto_374017 ?auto_374018 ) ) ( not ( = ?auto_374017 ?auto_374019 ) ) ( not ( = ?auto_374017 ?auto_374020 ) ) ( not ( = ?auto_374017 ?auto_374021 ) ) ( not ( = ?auto_374017 ?auto_374022 ) ) ( not ( = ?auto_374017 ?auto_374023 ) ) ( not ( = ?auto_374018 ?auto_374019 ) ) ( not ( = ?auto_374018 ?auto_374020 ) ) ( not ( = ?auto_374018 ?auto_374021 ) ) ( not ( = ?auto_374018 ?auto_374022 ) ) ( not ( = ?auto_374018 ?auto_374023 ) ) ( not ( = ?auto_374019 ?auto_374020 ) ) ( not ( = ?auto_374019 ?auto_374021 ) ) ( not ( = ?auto_374019 ?auto_374022 ) ) ( not ( = ?auto_374019 ?auto_374023 ) ) ( not ( = ?auto_374020 ?auto_374021 ) ) ( not ( = ?auto_374020 ?auto_374022 ) ) ( not ( = ?auto_374020 ?auto_374023 ) ) ( not ( = ?auto_374021 ?auto_374022 ) ) ( not ( = ?auto_374021 ?auto_374023 ) ) ( not ( = ?auto_374022 ?auto_374023 ) ) ( ON ?auto_374021 ?auto_374022 ) ( ON ?auto_374020 ?auto_374021 ) ( CLEAR ?auto_374018 ) ( ON ?auto_374019 ?auto_374020 ) ( CLEAR ?auto_374019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_374010 ?auto_374011 ?auto_374012 ?auto_374013 ?auto_374014 ?auto_374015 ?auto_374016 ?auto_374017 ?auto_374018 ?auto_374019 )
      ( MAKE-13PILE ?auto_374010 ?auto_374011 ?auto_374012 ?auto_374013 ?auto_374014 ?auto_374015 ?auto_374016 ?auto_374017 ?auto_374018 ?auto_374019 ?auto_374020 ?auto_374021 ?auto_374022 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374037 - BLOCK
      ?auto_374038 - BLOCK
      ?auto_374039 - BLOCK
      ?auto_374040 - BLOCK
      ?auto_374041 - BLOCK
      ?auto_374042 - BLOCK
      ?auto_374043 - BLOCK
      ?auto_374044 - BLOCK
      ?auto_374045 - BLOCK
      ?auto_374046 - BLOCK
      ?auto_374047 - BLOCK
      ?auto_374048 - BLOCK
      ?auto_374049 - BLOCK
    )
    :vars
    (
      ?auto_374050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374049 ?auto_374050 ) ( ON-TABLE ?auto_374037 ) ( ON ?auto_374038 ?auto_374037 ) ( ON ?auto_374039 ?auto_374038 ) ( ON ?auto_374040 ?auto_374039 ) ( ON ?auto_374041 ?auto_374040 ) ( ON ?auto_374042 ?auto_374041 ) ( ON ?auto_374043 ?auto_374042 ) ( ON ?auto_374044 ?auto_374043 ) ( not ( = ?auto_374037 ?auto_374038 ) ) ( not ( = ?auto_374037 ?auto_374039 ) ) ( not ( = ?auto_374037 ?auto_374040 ) ) ( not ( = ?auto_374037 ?auto_374041 ) ) ( not ( = ?auto_374037 ?auto_374042 ) ) ( not ( = ?auto_374037 ?auto_374043 ) ) ( not ( = ?auto_374037 ?auto_374044 ) ) ( not ( = ?auto_374037 ?auto_374045 ) ) ( not ( = ?auto_374037 ?auto_374046 ) ) ( not ( = ?auto_374037 ?auto_374047 ) ) ( not ( = ?auto_374037 ?auto_374048 ) ) ( not ( = ?auto_374037 ?auto_374049 ) ) ( not ( = ?auto_374037 ?auto_374050 ) ) ( not ( = ?auto_374038 ?auto_374039 ) ) ( not ( = ?auto_374038 ?auto_374040 ) ) ( not ( = ?auto_374038 ?auto_374041 ) ) ( not ( = ?auto_374038 ?auto_374042 ) ) ( not ( = ?auto_374038 ?auto_374043 ) ) ( not ( = ?auto_374038 ?auto_374044 ) ) ( not ( = ?auto_374038 ?auto_374045 ) ) ( not ( = ?auto_374038 ?auto_374046 ) ) ( not ( = ?auto_374038 ?auto_374047 ) ) ( not ( = ?auto_374038 ?auto_374048 ) ) ( not ( = ?auto_374038 ?auto_374049 ) ) ( not ( = ?auto_374038 ?auto_374050 ) ) ( not ( = ?auto_374039 ?auto_374040 ) ) ( not ( = ?auto_374039 ?auto_374041 ) ) ( not ( = ?auto_374039 ?auto_374042 ) ) ( not ( = ?auto_374039 ?auto_374043 ) ) ( not ( = ?auto_374039 ?auto_374044 ) ) ( not ( = ?auto_374039 ?auto_374045 ) ) ( not ( = ?auto_374039 ?auto_374046 ) ) ( not ( = ?auto_374039 ?auto_374047 ) ) ( not ( = ?auto_374039 ?auto_374048 ) ) ( not ( = ?auto_374039 ?auto_374049 ) ) ( not ( = ?auto_374039 ?auto_374050 ) ) ( not ( = ?auto_374040 ?auto_374041 ) ) ( not ( = ?auto_374040 ?auto_374042 ) ) ( not ( = ?auto_374040 ?auto_374043 ) ) ( not ( = ?auto_374040 ?auto_374044 ) ) ( not ( = ?auto_374040 ?auto_374045 ) ) ( not ( = ?auto_374040 ?auto_374046 ) ) ( not ( = ?auto_374040 ?auto_374047 ) ) ( not ( = ?auto_374040 ?auto_374048 ) ) ( not ( = ?auto_374040 ?auto_374049 ) ) ( not ( = ?auto_374040 ?auto_374050 ) ) ( not ( = ?auto_374041 ?auto_374042 ) ) ( not ( = ?auto_374041 ?auto_374043 ) ) ( not ( = ?auto_374041 ?auto_374044 ) ) ( not ( = ?auto_374041 ?auto_374045 ) ) ( not ( = ?auto_374041 ?auto_374046 ) ) ( not ( = ?auto_374041 ?auto_374047 ) ) ( not ( = ?auto_374041 ?auto_374048 ) ) ( not ( = ?auto_374041 ?auto_374049 ) ) ( not ( = ?auto_374041 ?auto_374050 ) ) ( not ( = ?auto_374042 ?auto_374043 ) ) ( not ( = ?auto_374042 ?auto_374044 ) ) ( not ( = ?auto_374042 ?auto_374045 ) ) ( not ( = ?auto_374042 ?auto_374046 ) ) ( not ( = ?auto_374042 ?auto_374047 ) ) ( not ( = ?auto_374042 ?auto_374048 ) ) ( not ( = ?auto_374042 ?auto_374049 ) ) ( not ( = ?auto_374042 ?auto_374050 ) ) ( not ( = ?auto_374043 ?auto_374044 ) ) ( not ( = ?auto_374043 ?auto_374045 ) ) ( not ( = ?auto_374043 ?auto_374046 ) ) ( not ( = ?auto_374043 ?auto_374047 ) ) ( not ( = ?auto_374043 ?auto_374048 ) ) ( not ( = ?auto_374043 ?auto_374049 ) ) ( not ( = ?auto_374043 ?auto_374050 ) ) ( not ( = ?auto_374044 ?auto_374045 ) ) ( not ( = ?auto_374044 ?auto_374046 ) ) ( not ( = ?auto_374044 ?auto_374047 ) ) ( not ( = ?auto_374044 ?auto_374048 ) ) ( not ( = ?auto_374044 ?auto_374049 ) ) ( not ( = ?auto_374044 ?auto_374050 ) ) ( not ( = ?auto_374045 ?auto_374046 ) ) ( not ( = ?auto_374045 ?auto_374047 ) ) ( not ( = ?auto_374045 ?auto_374048 ) ) ( not ( = ?auto_374045 ?auto_374049 ) ) ( not ( = ?auto_374045 ?auto_374050 ) ) ( not ( = ?auto_374046 ?auto_374047 ) ) ( not ( = ?auto_374046 ?auto_374048 ) ) ( not ( = ?auto_374046 ?auto_374049 ) ) ( not ( = ?auto_374046 ?auto_374050 ) ) ( not ( = ?auto_374047 ?auto_374048 ) ) ( not ( = ?auto_374047 ?auto_374049 ) ) ( not ( = ?auto_374047 ?auto_374050 ) ) ( not ( = ?auto_374048 ?auto_374049 ) ) ( not ( = ?auto_374048 ?auto_374050 ) ) ( not ( = ?auto_374049 ?auto_374050 ) ) ( ON ?auto_374048 ?auto_374049 ) ( ON ?auto_374047 ?auto_374048 ) ( ON ?auto_374046 ?auto_374047 ) ( CLEAR ?auto_374044 ) ( ON ?auto_374045 ?auto_374046 ) ( CLEAR ?auto_374045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_374037 ?auto_374038 ?auto_374039 ?auto_374040 ?auto_374041 ?auto_374042 ?auto_374043 ?auto_374044 ?auto_374045 )
      ( MAKE-13PILE ?auto_374037 ?auto_374038 ?auto_374039 ?auto_374040 ?auto_374041 ?auto_374042 ?auto_374043 ?auto_374044 ?auto_374045 ?auto_374046 ?auto_374047 ?auto_374048 ?auto_374049 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374064 - BLOCK
      ?auto_374065 - BLOCK
      ?auto_374066 - BLOCK
      ?auto_374067 - BLOCK
      ?auto_374068 - BLOCK
      ?auto_374069 - BLOCK
      ?auto_374070 - BLOCK
      ?auto_374071 - BLOCK
      ?auto_374072 - BLOCK
      ?auto_374073 - BLOCK
      ?auto_374074 - BLOCK
      ?auto_374075 - BLOCK
      ?auto_374076 - BLOCK
    )
    :vars
    (
      ?auto_374077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374076 ?auto_374077 ) ( ON-TABLE ?auto_374064 ) ( ON ?auto_374065 ?auto_374064 ) ( ON ?auto_374066 ?auto_374065 ) ( ON ?auto_374067 ?auto_374066 ) ( ON ?auto_374068 ?auto_374067 ) ( ON ?auto_374069 ?auto_374068 ) ( ON ?auto_374070 ?auto_374069 ) ( ON ?auto_374071 ?auto_374070 ) ( not ( = ?auto_374064 ?auto_374065 ) ) ( not ( = ?auto_374064 ?auto_374066 ) ) ( not ( = ?auto_374064 ?auto_374067 ) ) ( not ( = ?auto_374064 ?auto_374068 ) ) ( not ( = ?auto_374064 ?auto_374069 ) ) ( not ( = ?auto_374064 ?auto_374070 ) ) ( not ( = ?auto_374064 ?auto_374071 ) ) ( not ( = ?auto_374064 ?auto_374072 ) ) ( not ( = ?auto_374064 ?auto_374073 ) ) ( not ( = ?auto_374064 ?auto_374074 ) ) ( not ( = ?auto_374064 ?auto_374075 ) ) ( not ( = ?auto_374064 ?auto_374076 ) ) ( not ( = ?auto_374064 ?auto_374077 ) ) ( not ( = ?auto_374065 ?auto_374066 ) ) ( not ( = ?auto_374065 ?auto_374067 ) ) ( not ( = ?auto_374065 ?auto_374068 ) ) ( not ( = ?auto_374065 ?auto_374069 ) ) ( not ( = ?auto_374065 ?auto_374070 ) ) ( not ( = ?auto_374065 ?auto_374071 ) ) ( not ( = ?auto_374065 ?auto_374072 ) ) ( not ( = ?auto_374065 ?auto_374073 ) ) ( not ( = ?auto_374065 ?auto_374074 ) ) ( not ( = ?auto_374065 ?auto_374075 ) ) ( not ( = ?auto_374065 ?auto_374076 ) ) ( not ( = ?auto_374065 ?auto_374077 ) ) ( not ( = ?auto_374066 ?auto_374067 ) ) ( not ( = ?auto_374066 ?auto_374068 ) ) ( not ( = ?auto_374066 ?auto_374069 ) ) ( not ( = ?auto_374066 ?auto_374070 ) ) ( not ( = ?auto_374066 ?auto_374071 ) ) ( not ( = ?auto_374066 ?auto_374072 ) ) ( not ( = ?auto_374066 ?auto_374073 ) ) ( not ( = ?auto_374066 ?auto_374074 ) ) ( not ( = ?auto_374066 ?auto_374075 ) ) ( not ( = ?auto_374066 ?auto_374076 ) ) ( not ( = ?auto_374066 ?auto_374077 ) ) ( not ( = ?auto_374067 ?auto_374068 ) ) ( not ( = ?auto_374067 ?auto_374069 ) ) ( not ( = ?auto_374067 ?auto_374070 ) ) ( not ( = ?auto_374067 ?auto_374071 ) ) ( not ( = ?auto_374067 ?auto_374072 ) ) ( not ( = ?auto_374067 ?auto_374073 ) ) ( not ( = ?auto_374067 ?auto_374074 ) ) ( not ( = ?auto_374067 ?auto_374075 ) ) ( not ( = ?auto_374067 ?auto_374076 ) ) ( not ( = ?auto_374067 ?auto_374077 ) ) ( not ( = ?auto_374068 ?auto_374069 ) ) ( not ( = ?auto_374068 ?auto_374070 ) ) ( not ( = ?auto_374068 ?auto_374071 ) ) ( not ( = ?auto_374068 ?auto_374072 ) ) ( not ( = ?auto_374068 ?auto_374073 ) ) ( not ( = ?auto_374068 ?auto_374074 ) ) ( not ( = ?auto_374068 ?auto_374075 ) ) ( not ( = ?auto_374068 ?auto_374076 ) ) ( not ( = ?auto_374068 ?auto_374077 ) ) ( not ( = ?auto_374069 ?auto_374070 ) ) ( not ( = ?auto_374069 ?auto_374071 ) ) ( not ( = ?auto_374069 ?auto_374072 ) ) ( not ( = ?auto_374069 ?auto_374073 ) ) ( not ( = ?auto_374069 ?auto_374074 ) ) ( not ( = ?auto_374069 ?auto_374075 ) ) ( not ( = ?auto_374069 ?auto_374076 ) ) ( not ( = ?auto_374069 ?auto_374077 ) ) ( not ( = ?auto_374070 ?auto_374071 ) ) ( not ( = ?auto_374070 ?auto_374072 ) ) ( not ( = ?auto_374070 ?auto_374073 ) ) ( not ( = ?auto_374070 ?auto_374074 ) ) ( not ( = ?auto_374070 ?auto_374075 ) ) ( not ( = ?auto_374070 ?auto_374076 ) ) ( not ( = ?auto_374070 ?auto_374077 ) ) ( not ( = ?auto_374071 ?auto_374072 ) ) ( not ( = ?auto_374071 ?auto_374073 ) ) ( not ( = ?auto_374071 ?auto_374074 ) ) ( not ( = ?auto_374071 ?auto_374075 ) ) ( not ( = ?auto_374071 ?auto_374076 ) ) ( not ( = ?auto_374071 ?auto_374077 ) ) ( not ( = ?auto_374072 ?auto_374073 ) ) ( not ( = ?auto_374072 ?auto_374074 ) ) ( not ( = ?auto_374072 ?auto_374075 ) ) ( not ( = ?auto_374072 ?auto_374076 ) ) ( not ( = ?auto_374072 ?auto_374077 ) ) ( not ( = ?auto_374073 ?auto_374074 ) ) ( not ( = ?auto_374073 ?auto_374075 ) ) ( not ( = ?auto_374073 ?auto_374076 ) ) ( not ( = ?auto_374073 ?auto_374077 ) ) ( not ( = ?auto_374074 ?auto_374075 ) ) ( not ( = ?auto_374074 ?auto_374076 ) ) ( not ( = ?auto_374074 ?auto_374077 ) ) ( not ( = ?auto_374075 ?auto_374076 ) ) ( not ( = ?auto_374075 ?auto_374077 ) ) ( not ( = ?auto_374076 ?auto_374077 ) ) ( ON ?auto_374075 ?auto_374076 ) ( ON ?auto_374074 ?auto_374075 ) ( ON ?auto_374073 ?auto_374074 ) ( CLEAR ?auto_374071 ) ( ON ?auto_374072 ?auto_374073 ) ( CLEAR ?auto_374072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_374064 ?auto_374065 ?auto_374066 ?auto_374067 ?auto_374068 ?auto_374069 ?auto_374070 ?auto_374071 ?auto_374072 )
      ( MAKE-13PILE ?auto_374064 ?auto_374065 ?auto_374066 ?auto_374067 ?auto_374068 ?auto_374069 ?auto_374070 ?auto_374071 ?auto_374072 ?auto_374073 ?auto_374074 ?auto_374075 ?auto_374076 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374091 - BLOCK
      ?auto_374092 - BLOCK
      ?auto_374093 - BLOCK
      ?auto_374094 - BLOCK
      ?auto_374095 - BLOCK
      ?auto_374096 - BLOCK
      ?auto_374097 - BLOCK
      ?auto_374098 - BLOCK
      ?auto_374099 - BLOCK
      ?auto_374100 - BLOCK
      ?auto_374101 - BLOCK
      ?auto_374102 - BLOCK
      ?auto_374103 - BLOCK
    )
    :vars
    (
      ?auto_374104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374103 ?auto_374104 ) ( ON-TABLE ?auto_374091 ) ( ON ?auto_374092 ?auto_374091 ) ( ON ?auto_374093 ?auto_374092 ) ( ON ?auto_374094 ?auto_374093 ) ( ON ?auto_374095 ?auto_374094 ) ( ON ?auto_374096 ?auto_374095 ) ( ON ?auto_374097 ?auto_374096 ) ( not ( = ?auto_374091 ?auto_374092 ) ) ( not ( = ?auto_374091 ?auto_374093 ) ) ( not ( = ?auto_374091 ?auto_374094 ) ) ( not ( = ?auto_374091 ?auto_374095 ) ) ( not ( = ?auto_374091 ?auto_374096 ) ) ( not ( = ?auto_374091 ?auto_374097 ) ) ( not ( = ?auto_374091 ?auto_374098 ) ) ( not ( = ?auto_374091 ?auto_374099 ) ) ( not ( = ?auto_374091 ?auto_374100 ) ) ( not ( = ?auto_374091 ?auto_374101 ) ) ( not ( = ?auto_374091 ?auto_374102 ) ) ( not ( = ?auto_374091 ?auto_374103 ) ) ( not ( = ?auto_374091 ?auto_374104 ) ) ( not ( = ?auto_374092 ?auto_374093 ) ) ( not ( = ?auto_374092 ?auto_374094 ) ) ( not ( = ?auto_374092 ?auto_374095 ) ) ( not ( = ?auto_374092 ?auto_374096 ) ) ( not ( = ?auto_374092 ?auto_374097 ) ) ( not ( = ?auto_374092 ?auto_374098 ) ) ( not ( = ?auto_374092 ?auto_374099 ) ) ( not ( = ?auto_374092 ?auto_374100 ) ) ( not ( = ?auto_374092 ?auto_374101 ) ) ( not ( = ?auto_374092 ?auto_374102 ) ) ( not ( = ?auto_374092 ?auto_374103 ) ) ( not ( = ?auto_374092 ?auto_374104 ) ) ( not ( = ?auto_374093 ?auto_374094 ) ) ( not ( = ?auto_374093 ?auto_374095 ) ) ( not ( = ?auto_374093 ?auto_374096 ) ) ( not ( = ?auto_374093 ?auto_374097 ) ) ( not ( = ?auto_374093 ?auto_374098 ) ) ( not ( = ?auto_374093 ?auto_374099 ) ) ( not ( = ?auto_374093 ?auto_374100 ) ) ( not ( = ?auto_374093 ?auto_374101 ) ) ( not ( = ?auto_374093 ?auto_374102 ) ) ( not ( = ?auto_374093 ?auto_374103 ) ) ( not ( = ?auto_374093 ?auto_374104 ) ) ( not ( = ?auto_374094 ?auto_374095 ) ) ( not ( = ?auto_374094 ?auto_374096 ) ) ( not ( = ?auto_374094 ?auto_374097 ) ) ( not ( = ?auto_374094 ?auto_374098 ) ) ( not ( = ?auto_374094 ?auto_374099 ) ) ( not ( = ?auto_374094 ?auto_374100 ) ) ( not ( = ?auto_374094 ?auto_374101 ) ) ( not ( = ?auto_374094 ?auto_374102 ) ) ( not ( = ?auto_374094 ?auto_374103 ) ) ( not ( = ?auto_374094 ?auto_374104 ) ) ( not ( = ?auto_374095 ?auto_374096 ) ) ( not ( = ?auto_374095 ?auto_374097 ) ) ( not ( = ?auto_374095 ?auto_374098 ) ) ( not ( = ?auto_374095 ?auto_374099 ) ) ( not ( = ?auto_374095 ?auto_374100 ) ) ( not ( = ?auto_374095 ?auto_374101 ) ) ( not ( = ?auto_374095 ?auto_374102 ) ) ( not ( = ?auto_374095 ?auto_374103 ) ) ( not ( = ?auto_374095 ?auto_374104 ) ) ( not ( = ?auto_374096 ?auto_374097 ) ) ( not ( = ?auto_374096 ?auto_374098 ) ) ( not ( = ?auto_374096 ?auto_374099 ) ) ( not ( = ?auto_374096 ?auto_374100 ) ) ( not ( = ?auto_374096 ?auto_374101 ) ) ( not ( = ?auto_374096 ?auto_374102 ) ) ( not ( = ?auto_374096 ?auto_374103 ) ) ( not ( = ?auto_374096 ?auto_374104 ) ) ( not ( = ?auto_374097 ?auto_374098 ) ) ( not ( = ?auto_374097 ?auto_374099 ) ) ( not ( = ?auto_374097 ?auto_374100 ) ) ( not ( = ?auto_374097 ?auto_374101 ) ) ( not ( = ?auto_374097 ?auto_374102 ) ) ( not ( = ?auto_374097 ?auto_374103 ) ) ( not ( = ?auto_374097 ?auto_374104 ) ) ( not ( = ?auto_374098 ?auto_374099 ) ) ( not ( = ?auto_374098 ?auto_374100 ) ) ( not ( = ?auto_374098 ?auto_374101 ) ) ( not ( = ?auto_374098 ?auto_374102 ) ) ( not ( = ?auto_374098 ?auto_374103 ) ) ( not ( = ?auto_374098 ?auto_374104 ) ) ( not ( = ?auto_374099 ?auto_374100 ) ) ( not ( = ?auto_374099 ?auto_374101 ) ) ( not ( = ?auto_374099 ?auto_374102 ) ) ( not ( = ?auto_374099 ?auto_374103 ) ) ( not ( = ?auto_374099 ?auto_374104 ) ) ( not ( = ?auto_374100 ?auto_374101 ) ) ( not ( = ?auto_374100 ?auto_374102 ) ) ( not ( = ?auto_374100 ?auto_374103 ) ) ( not ( = ?auto_374100 ?auto_374104 ) ) ( not ( = ?auto_374101 ?auto_374102 ) ) ( not ( = ?auto_374101 ?auto_374103 ) ) ( not ( = ?auto_374101 ?auto_374104 ) ) ( not ( = ?auto_374102 ?auto_374103 ) ) ( not ( = ?auto_374102 ?auto_374104 ) ) ( not ( = ?auto_374103 ?auto_374104 ) ) ( ON ?auto_374102 ?auto_374103 ) ( ON ?auto_374101 ?auto_374102 ) ( ON ?auto_374100 ?auto_374101 ) ( ON ?auto_374099 ?auto_374100 ) ( CLEAR ?auto_374097 ) ( ON ?auto_374098 ?auto_374099 ) ( CLEAR ?auto_374098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_374091 ?auto_374092 ?auto_374093 ?auto_374094 ?auto_374095 ?auto_374096 ?auto_374097 ?auto_374098 )
      ( MAKE-13PILE ?auto_374091 ?auto_374092 ?auto_374093 ?auto_374094 ?auto_374095 ?auto_374096 ?auto_374097 ?auto_374098 ?auto_374099 ?auto_374100 ?auto_374101 ?auto_374102 ?auto_374103 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374118 - BLOCK
      ?auto_374119 - BLOCK
      ?auto_374120 - BLOCK
      ?auto_374121 - BLOCK
      ?auto_374122 - BLOCK
      ?auto_374123 - BLOCK
      ?auto_374124 - BLOCK
      ?auto_374125 - BLOCK
      ?auto_374126 - BLOCK
      ?auto_374127 - BLOCK
      ?auto_374128 - BLOCK
      ?auto_374129 - BLOCK
      ?auto_374130 - BLOCK
    )
    :vars
    (
      ?auto_374131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374130 ?auto_374131 ) ( ON-TABLE ?auto_374118 ) ( ON ?auto_374119 ?auto_374118 ) ( ON ?auto_374120 ?auto_374119 ) ( ON ?auto_374121 ?auto_374120 ) ( ON ?auto_374122 ?auto_374121 ) ( ON ?auto_374123 ?auto_374122 ) ( ON ?auto_374124 ?auto_374123 ) ( not ( = ?auto_374118 ?auto_374119 ) ) ( not ( = ?auto_374118 ?auto_374120 ) ) ( not ( = ?auto_374118 ?auto_374121 ) ) ( not ( = ?auto_374118 ?auto_374122 ) ) ( not ( = ?auto_374118 ?auto_374123 ) ) ( not ( = ?auto_374118 ?auto_374124 ) ) ( not ( = ?auto_374118 ?auto_374125 ) ) ( not ( = ?auto_374118 ?auto_374126 ) ) ( not ( = ?auto_374118 ?auto_374127 ) ) ( not ( = ?auto_374118 ?auto_374128 ) ) ( not ( = ?auto_374118 ?auto_374129 ) ) ( not ( = ?auto_374118 ?auto_374130 ) ) ( not ( = ?auto_374118 ?auto_374131 ) ) ( not ( = ?auto_374119 ?auto_374120 ) ) ( not ( = ?auto_374119 ?auto_374121 ) ) ( not ( = ?auto_374119 ?auto_374122 ) ) ( not ( = ?auto_374119 ?auto_374123 ) ) ( not ( = ?auto_374119 ?auto_374124 ) ) ( not ( = ?auto_374119 ?auto_374125 ) ) ( not ( = ?auto_374119 ?auto_374126 ) ) ( not ( = ?auto_374119 ?auto_374127 ) ) ( not ( = ?auto_374119 ?auto_374128 ) ) ( not ( = ?auto_374119 ?auto_374129 ) ) ( not ( = ?auto_374119 ?auto_374130 ) ) ( not ( = ?auto_374119 ?auto_374131 ) ) ( not ( = ?auto_374120 ?auto_374121 ) ) ( not ( = ?auto_374120 ?auto_374122 ) ) ( not ( = ?auto_374120 ?auto_374123 ) ) ( not ( = ?auto_374120 ?auto_374124 ) ) ( not ( = ?auto_374120 ?auto_374125 ) ) ( not ( = ?auto_374120 ?auto_374126 ) ) ( not ( = ?auto_374120 ?auto_374127 ) ) ( not ( = ?auto_374120 ?auto_374128 ) ) ( not ( = ?auto_374120 ?auto_374129 ) ) ( not ( = ?auto_374120 ?auto_374130 ) ) ( not ( = ?auto_374120 ?auto_374131 ) ) ( not ( = ?auto_374121 ?auto_374122 ) ) ( not ( = ?auto_374121 ?auto_374123 ) ) ( not ( = ?auto_374121 ?auto_374124 ) ) ( not ( = ?auto_374121 ?auto_374125 ) ) ( not ( = ?auto_374121 ?auto_374126 ) ) ( not ( = ?auto_374121 ?auto_374127 ) ) ( not ( = ?auto_374121 ?auto_374128 ) ) ( not ( = ?auto_374121 ?auto_374129 ) ) ( not ( = ?auto_374121 ?auto_374130 ) ) ( not ( = ?auto_374121 ?auto_374131 ) ) ( not ( = ?auto_374122 ?auto_374123 ) ) ( not ( = ?auto_374122 ?auto_374124 ) ) ( not ( = ?auto_374122 ?auto_374125 ) ) ( not ( = ?auto_374122 ?auto_374126 ) ) ( not ( = ?auto_374122 ?auto_374127 ) ) ( not ( = ?auto_374122 ?auto_374128 ) ) ( not ( = ?auto_374122 ?auto_374129 ) ) ( not ( = ?auto_374122 ?auto_374130 ) ) ( not ( = ?auto_374122 ?auto_374131 ) ) ( not ( = ?auto_374123 ?auto_374124 ) ) ( not ( = ?auto_374123 ?auto_374125 ) ) ( not ( = ?auto_374123 ?auto_374126 ) ) ( not ( = ?auto_374123 ?auto_374127 ) ) ( not ( = ?auto_374123 ?auto_374128 ) ) ( not ( = ?auto_374123 ?auto_374129 ) ) ( not ( = ?auto_374123 ?auto_374130 ) ) ( not ( = ?auto_374123 ?auto_374131 ) ) ( not ( = ?auto_374124 ?auto_374125 ) ) ( not ( = ?auto_374124 ?auto_374126 ) ) ( not ( = ?auto_374124 ?auto_374127 ) ) ( not ( = ?auto_374124 ?auto_374128 ) ) ( not ( = ?auto_374124 ?auto_374129 ) ) ( not ( = ?auto_374124 ?auto_374130 ) ) ( not ( = ?auto_374124 ?auto_374131 ) ) ( not ( = ?auto_374125 ?auto_374126 ) ) ( not ( = ?auto_374125 ?auto_374127 ) ) ( not ( = ?auto_374125 ?auto_374128 ) ) ( not ( = ?auto_374125 ?auto_374129 ) ) ( not ( = ?auto_374125 ?auto_374130 ) ) ( not ( = ?auto_374125 ?auto_374131 ) ) ( not ( = ?auto_374126 ?auto_374127 ) ) ( not ( = ?auto_374126 ?auto_374128 ) ) ( not ( = ?auto_374126 ?auto_374129 ) ) ( not ( = ?auto_374126 ?auto_374130 ) ) ( not ( = ?auto_374126 ?auto_374131 ) ) ( not ( = ?auto_374127 ?auto_374128 ) ) ( not ( = ?auto_374127 ?auto_374129 ) ) ( not ( = ?auto_374127 ?auto_374130 ) ) ( not ( = ?auto_374127 ?auto_374131 ) ) ( not ( = ?auto_374128 ?auto_374129 ) ) ( not ( = ?auto_374128 ?auto_374130 ) ) ( not ( = ?auto_374128 ?auto_374131 ) ) ( not ( = ?auto_374129 ?auto_374130 ) ) ( not ( = ?auto_374129 ?auto_374131 ) ) ( not ( = ?auto_374130 ?auto_374131 ) ) ( ON ?auto_374129 ?auto_374130 ) ( ON ?auto_374128 ?auto_374129 ) ( ON ?auto_374127 ?auto_374128 ) ( ON ?auto_374126 ?auto_374127 ) ( CLEAR ?auto_374124 ) ( ON ?auto_374125 ?auto_374126 ) ( CLEAR ?auto_374125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_374118 ?auto_374119 ?auto_374120 ?auto_374121 ?auto_374122 ?auto_374123 ?auto_374124 ?auto_374125 )
      ( MAKE-13PILE ?auto_374118 ?auto_374119 ?auto_374120 ?auto_374121 ?auto_374122 ?auto_374123 ?auto_374124 ?auto_374125 ?auto_374126 ?auto_374127 ?auto_374128 ?auto_374129 ?auto_374130 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374145 - BLOCK
      ?auto_374146 - BLOCK
      ?auto_374147 - BLOCK
      ?auto_374148 - BLOCK
      ?auto_374149 - BLOCK
      ?auto_374150 - BLOCK
      ?auto_374151 - BLOCK
      ?auto_374152 - BLOCK
      ?auto_374153 - BLOCK
      ?auto_374154 - BLOCK
      ?auto_374155 - BLOCK
      ?auto_374156 - BLOCK
      ?auto_374157 - BLOCK
    )
    :vars
    (
      ?auto_374158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374157 ?auto_374158 ) ( ON-TABLE ?auto_374145 ) ( ON ?auto_374146 ?auto_374145 ) ( ON ?auto_374147 ?auto_374146 ) ( ON ?auto_374148 ?auto_374147 ) ( ON ?auto_374149 ?auto_374148 ) ( ON ?auto_374150 ?auto_374149 ) ( not ( = ?auto_374145 ?auto_374146 ) ) ( not ( = ?auto_374145 ?auto_374147 ) ) ( not ( = ?auto_374145 ?auto_374148 ) ) ( not ( = ?auto_374145 ?auto_374149 ) ) ( not ( = ?auto_374145 ?auto_374150 ) ) ( not ( = ?auto_374145 ?auto_374151 ) ) ( not ( = ?auto_374145 ?auto_374152 ) ) ( not ( = ?auto_374145 ?auto_374153 ) ) ( not ( = ?auto_374145 ?auto_374154 ) ) ( not ( = ?auto_374145 ?auto_374155 ) ) ( not ( = ?auto_374145 ?auto_374156 ) ) ( not ( = ?auto_374145 ?auto_374157 ) ) ( not ( = ?auto_374145 ?auto_374158 ) ) ( not ( = ?auto_374146 ?auto_374147 ) ) ( not ( = ?auto_374146 ?auto_374148 ) ) ( not ( = ?auto_374146 ?auto_374149 ) ) ( not ( = ?auto_374146 ?auto_374150 ) ) ( not ( = ?auto_374146 ?auto_374151 ) ) ( not ( = ?auto_374146 ?auto_374152 ) ) ( not ( = ?auto_374146 ?auto_374153 ) ) ( not ( = ?auto_374146 ?auto_374154 ) ) ( not ( = ?auto_374146 ?auto_374155 ) ) ( not ( = ?auto_374146 ?auto_374156 ) ) ( not ( = ?auto_374146 ?auto_374157 ) ) ( not ( = ?auto_374146 ?auto_374158 ) ) ( not ( = ?auto_374147 ?auto_374148 ) ) ( not ( = ?auto_374147 ?auto_374149 ) ) ( not ( = ?auto_374147 ?auto_374150 ) ) ( not ( = ?auto_374147 ?auto_374151 ) ) ( not ( = ?auto_374147 ?auto_374152 ) ) ( not ( = ?auto_374147 ?auto_374153 ) ) ( not ( = ?auto_374147 ?auto_374154 ) ) ( not ( = ?auto_374147 ?auto_374155 ) ) ( not ( = ?auto_374147 ?auto_374156 ) ) ( not ( = ?auto_374147 ?auto_374157 ) ) ( not ( = ?auto_374147 ?auto_374158 ) ) ( not ( = ?auto_374148 ?auto_374149 ) ) ( not ( = ?auto_374148 ?auto_374150 ) ) ( not ( = ?auto_374148 ?auto_374151 ) ) ( not ( = ?auto_374148 ?auto_374152 ) ) ( not ( = ?auto_374148 ?auto_374153 ) ) ( not ( = ?auto_374148 ?auto_374154 ) ) ( not ( = ?auto_374148 ?auto_374155 ) ) ( not ( = ?auto_374148 ?auto_374156 ) ) ( not ( = ?auto_374148 ?auto_374157 ) ) ( not ( = ?auto_374148 ?auto_374158 ) ) ( not ( = ?auto_374149 ?auto_374150 ) ) ( not ( = ?auto_374149 ?auto_374151 ) ) ( not ( = ?auto_374149 ?auto_374152 ) ) ( not ( = ?auto_374149 ?auto_374153 ) ) ( not ( = ?auto_374149 ?auto_374154 ) ) ( not ( = ?auto_374149 ?auto_374155 ) ) ( not ( = ?auto_374149 ?auto_374156 ) ) ( not ( = ?auto_374149 ?auto_374157 ) ) ( not ( = ?auto_374149 ?auto_374158 ) ) ( not ( = ?auto_374150 ?auto_374151 ) ) ( not ( = ?auto_374150 ?auto_374152 ) ) ( not ( = ?auto_374150 ?auto_374153 ) ) ( not ( = ?auto_374150 ?auto_374154 ) ) ( not ( = ?auto_374150 ?auto_374155 ) ) ( not ( = ?auto_374150 ?auto_374156 ) ) ( not ( = ?auto_374150 ?auto_374157 ) ) ( not ( = ?auto_374150 ?auto_374158 ) ) ( not ( = ?auto_374151 ?auto_374152 ) ) ( not ( = ?auto_374151 ?auto_374153 ) ) ( not ( = ?auto_374151 ?auto_374154 ) ) ( not ( = ?auto_374151 ?auto_374155 ) ) ( not ( = ?auto_374151 ?auto_374156 ) ) ( not ( = ?auto_374151 ?auto_374157 ) ) ( not ( = ?auto_374151 ?auto_374158 ) ) ( not ( = ?auto_374152 ?auto_374153 ) ) ( not ( = ?auto_374152 ?auto_374154 ) ) ( not ( = ?auto_374152 ?auto_374155 ) ) ( not ( = ?auto_374152 ?auto_374156 ) ) ( not ( = ?auto_374152 ?auto_374157 ) ) ( not ( = ?auto_374152 ?auto_374158 ) ) ( not ( = ?auto_374153 ?auto_374154 ) ) ( not ( = ?auto_374153 ?auto_374155 ) ) ( not ( = ?auto_374153 ?auto_374156 ) ) ( not ( = ?auto_374153 ?auto_374157 ) ) ( not ( = ?auto_374153 ?auto_374158 ) ) ( not ( = ?auto_374154 ?auto_374155 ) ) ( not ( = ?auto_374154 ?auto_374156 ) ) ( not ( = ?auto_374154 ?auto_374157 ) ) ( not ( = ?auto_374154 ?auto_374158 ) ) ( not ( = ?auto_374155 ?auto_374156 ) ) ( not ( = ?auto_374155 ?auto_374157 ) ) ( not ( = ?auto_374155 ?auto_374158 ) ) ( not ( = ?auto_374156 ?auto_374157 ) ) ( not ( = ?auto_374156 ?auto_374158 ) ) ( not ( = ?auto_374157 ?auto_374158 ) ) ( ON ?auto_374156 ?auto_374157 ) ( ON ?auto_374155 ?auto_374156 ) ( ON ?auto_374154 ?auto_374155 ) ( ON ?auto_374153 ?auto_374154 ) ( ON ?auto_374152 ?auto_374153 ) ( CLEAR ?auto_374150 ) ( ON ?auto_374151 ?auto_374152 ) ( CLEAR ?auto_374151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_374145 ?auto_374146 ?auto_374147 ?auto_374148 ?auto_374149 ?auto_374150 ?auto_374151 )
      ( MAKE-13PILE ?auto_374145 ?auto_374146 ?auto_374147 ?auto_374148 ?auto_374149 ?auto_374150 ?auto_374151 ?auto_374152 ?auto_374153 ?auto_374154 ?auto_374155 ?auto_374156 ?auto_374157 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374172 - BLOCK
      ?auto_374173 - BLOCK
      ?auto_374174 - BLOCK
      ?auto_374175 - BLOCK
      ?auto_374176 - BLOCK
      ?auto_374177 - BLOCK
      ?auto_374178 - BLOCK
      ?auto_374179 - BLOCK
      ?auto_374180 - BLOCK
      ?auto_374181 - BLOCK
      ?auto_374182 - BLOCK
      ?auto_374183 - BLOCK
      ?auto_374184 - BLOCK
    )
    :vars
    (
      ?auto_374185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374184 ?auto_374185 ) ( ON-TABLE ?auto_374172 ) ( ON ?auto_374173 ?auto_374172 ) ( ON ?auto_374174 ?auto_374173 ) ( ON ?auto_374175 ?auto_374174 ) ( ON ?auto_374176 ?auto_374175 ) ( ON ?auto_374177 ?auto_374176 ) ( not ( = ?auto_374172 ?auto_374173 ) ) ( not ( = ?auto_374172 ?auto_374174 ) ) ( not ( = ?auto_374172 ?auto_374175 ) ) ( not ( = ?auto_374172 ?auto_374176 ) ) ( not ( = ?auto_374172 ?auto_374177 ) ) ( not ( = ?auto_374172 ?auto_374178 ) ) ( not ( = ?auto_374172 ?auto_374179 ) ) ( not ( = ?auto_374172 ?auto_374180 ) ) ( not ( = ?auto_374172 ?auto_374181 ) ) ( not ( = ?auto_374172 ?auto_374182 ) ) ( not ( = ?auto_374172 ?auto_374183 ) ) ( not ( = ?auto_374172 ?auto_374184 ) ) ( not ( = ?auto_374172 ?auto_374185 ) ) ( not ( = ?auto_374173 ?auto_374174 ) ) ( not ( = ?auto_374173 ?auto_374175 ) ) ( not ( = ?auto_374173 ?auto_374176 ) ) ( not ( = ?auto_374173 ?auto_374177 ) ) ( not ( = ?auto_374173 ?auto_374178 ) ) ( not ( = ?auto_374173 ?auto_374179 ) ) ( not ( = ?auto_374173 ?auto_374180 ) ) ( not ( = ?auto_374173 ?auto_374181 ) ) ( not ( = ?auto_374173 ?auto_374182 ) ) ( not ( = ?auto_374173 ?auto_374183 ) ) ( not ( = ?auto_374173 ?auto_374184 ) ) ( not ( = ?auto_374173 ?auto_374185 ) ) ( not ( = ?auto_374174 ?auto_374175 ) ) ( not ( = ?auto_374174 ?auto_374176 ) ) ( not ( = ?auto_374174 ?auto_374177 ) ) ( not ( = ?auto_374174 ?auto_374178 ) ) ( not ( = ?auto_374174 ?auto_374179 ) ) ( not ( = ?auto_374174 ?auto_374180 ) ) ( not ( = ?auto_374174 ?auto_374181 ) ) ( not ( = ?auto_374174 ?auto_374182 ) ) ( not ( = ?auto_374174 ?auto_374183 ) ) ( not ( = ?auto_374174 ?auto_374184 ) ) ( not ( = ?auto_374174 ?auto_374185 ) ) ( not ( = ?auto_374175 ?auto_374176 ) ) ( not ( = ?auto_374175 ?auto_374177 ) ) ( not ( = ?auto_374175 ?auto_374178 ) ) ( not ( = ?auto_374175 ?auto_374179 ) ) ( not ( = ?auto_374175 ?auto_374180 ) ) ( not ( = ?auto_374175 ?auto_374181 ) ) ( not ( = ?auto_374175 ?auto_374182 ) ) ( not ( = ?auto_374175 ?auto_374183 ) ) ( not ( = ?auto_374175 ?auto_374184 ) ) ( not ( = ?auto_374175 ?auto_374185 ) ) ( not ( = ?auto_374176 ?auto_374177 ) ) ( not ( = ?auto_374176 ?auto_374178 ) ) ( not ( = ?auto_374176 ?auto_374179 ) ) ( not ( = ?auto_374176 ?auto_374180 ) ) ( not ( = ?auto_374176 ?auto_374181 ) ) ( not ( = ?auto_374176 ?auto_374182 ) ) ( not ( = ?auto_374176 ?auto_374183 ) ) ( not ( = ?auto_374176 ?auto_374184 ) ) ( not ( = ?auto_374176 ?auto_374185 ) ) ( not ( = ?auto_374177 ?auto_374178 ) ) ( not ( = ?auto_374177 ?auto_374179 ) ) ( not ( = ?auto_374177 ?auto_374180 ) ) ( not ( = ?auto_374177 ?auto_374181 ) ) ( not ( = ?auto_374177 ?auto_374182 ) ) ( not ( = ?auto_374177 ?auto_374183 ) ) ( not ( = ?auto_374177 ?auto_374184 ) ) ( not ( = ?auto_374177 ?auto_374185 ) ) ( not ( = ?auto_374178 ?auto_374179 ) ) ( not ( = ?auto_374178 ?auto_374180 ) ) ( not ( = ?auto_374178 ?auto_374181 ) ) ( not ( = ?auto_374178 ?auto_374182 ) ) ( not ( = ?auto_374178 ?auto_374183 ) ) ( not ( = ?auto_374178 ?auto_374184 ) ) ( not ( = ?auto_374178 ?auto_374185 ) ) ( not ( = ?auto_374179 ?auto_374180 ) ) ( not ( = ?auto_374179 ?auto_374181 ) ) ( not ( = ?auto_374179 ?auto_374182 ) ) ( not ( = ?auto_374179 ?auto_374183 ) ) ( not ( = ?auto_374179 ?auto_374184 ) ) ( not ( = ?auto_374179 ?auto_374185 ) ) ( not ( = ?auto_374180 ?auto_374181 ) ) ( not ( = ?auto_374180 ?auto_374182 ) ) ( not ( = ?auto_374180 ?auto_374183 ) ) ( not ( = ?auto_374180 ?auto_374184 ) ) ( not ( = ?auto_374180 ?auto_374185 ) ) ( not ( = ?auto_374181 ?auto_374182 ) ) ( not ( = ?auto_374181 ?auto_374183 ) ) ( not ( = ?auto_374181 ?auto_374184 ) ) ( not ( = ?auto_374181 ?auto_374185 ) ) ( not ( = ?auto_374182 ?auto_374183 ) ) ( not ( = ?auto_374182 ?auto_374184 ) ) ( not ( = ?auto_374182 ?auto_374185 ) ) ( not ( = ?auto_374183 ?auto_374184 ) ) ( not ( = ?auto_374183 ?auto_374185 ) ) ( not ( = ?auto_374184 ?auto_374185 ) ) ( ON ?auto_374183 ?auto_374184 ) ( ON ?auto_374182 ?auto_374183 ) ( ON ?auto_374181 ?auto_374182 ) ( ON ?auto_374180 ?auto_374181 ) ( ON ?auto_374179 ?auto_374180 ) ( CLEAR ?auto_374177 ) ( ON ?auto_374178 ?auto_374179 ) ( CLEAR ?auto_374178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_374172 ?auto_374173 ?auto_374174 ?auto_374175 ?auto_374176 ?auto_374177 ?auto_374178 )
      ( MAKE-13PILE ?auto_374172 ?auto_374173 ?auto_374174 ?auto_374175 ?auto_374176 ?auto_374177 ?auto_374178 ?auto_374179 ?auto_374180 ?auto_374181 ?auto_374182 ?auto_374183 ?auto_374184 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374199 - BLOCK
      ?auto_374200 - BLOCK
      ?auto_374201 - BLOCK
      ?auto_374202 - BLOCK
      ?auto_374203 - BLOCK
      ?auto_374204 - BLOCK
      ?auto_374205 - BLOCK
      ?auto_374206 - BLOCK
      ?auto_374207 - BLOCK
      ?auto_374208 - BLOCK
      ?auto_374209 - BLOCK
      ?auto_374210 - BLOCK
      ?auto_374211 - BLOCK
    )
    :vars
    (
      ?auto_374212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374211 ?auto_374212 ) ( ON-TABLE ?auto_374199 ) ( ON ?auto_374200 ?auto_374199 ) ( ON ?auto_374201 ?auto_374200 ) ( ON ?auto_374202 ?auto_374201 ) ( ON ?auto_374203 ?auto_374202 ) ( not ( = ?auto_374199 ?auto_374200 ) ) ( not ( = ?auto_374199 ?auto_374201 ) ) ( not ( = ?auto_374199 ?auto_374202 ) ) ( not ( = ?auto_374199 ?auto_374203 ) ) ( not ( = ?auto_374199 ?auto_374204 ) ) ( not ( = ?auto_374199 ?auto_374205 ) ) ( not ( = ?auto_374199 ?auto_374206 ) ) ( not ( = ?auto_374199 ?auto_374207 ) ) ( not ( = ?auto_374199 ?auto_374208 ) ) ( not ( = ?auto_374199 ?auto_374209 ) ) ( not ( = ?auto_374199 ?auto_374210 ) ) ( not ( = ?auto_374199 ?auto_374211 ) ) ( not ( = ?auto_374199 ?auto_374212 ) ) ( not ( = ?auto_374200 ?auto_374201 ) ) ( not ( = ?auto_374200 ?auto_374202 ) ) ( not ( = ?auto_374200 ?auto_374203 ) ) ( not ( = ?auto_374200 ?auto_374204 ) ) ( not ( = ?auto_374200 ?auto_374205 ) ) ( not ( = ?auto_374200 ?auto_374206 ) ) ( not ( = ?auto_374200 ?auto_374207 ) ) ( not ( = ?auto_374200 ?auto_374208 ) ) ( not ( = ?auto_374200 ?auto_374209 ) ) ( not ( = ?auto_374200 ?auto_374210 ) ) ( not ( = ?auto_374200 ?auto_374211 ) ) ( not ( = ?auto_374200 ?auto_374212 ) ) ( not ( = ?auto_374201 ?auto_374202 ) ) ( not ( = ?auto_374201 ?auto_374203 ) ) ( not ( = ?auto_374201 ?auto_374204 ) ) ( not ( = ?auto_374201 ?auto_374205 ) ) ( not ( = ?auto_374201 ?auto_374206 ) ) ( not ( = ?auto_374201 ?auto_374207 ) ) ( not ( = ?auto_374201 ?auto_374208 ) ) ( not ( = ?auto_374201 ?auto_374209 ) ) ( not ( = ?auto_374201 ?auto_374210 ) ) ( not ( = ?auto_374201 ?auto_374211 ) ) ( not ( = ?auto_374201 ?auto_374212 ) ) ( not ( = ?auto_374202 ?auto_374203 ) ) ( not ( = ?auto_374202 ?auto_374204 ) ) ( not ( = ?auto_374202 ?auto_374205 ) ) ( not ( = ?auto_374202 ?auto_374206 ) ) ( not ( = ?auto_374202 ?auto_374207 ) ) ( not ( = ?auto_374202 ?auto_374208 ) ) ( not ( = ?auto_374202 ?auto_374209 ) ) ( not ( = ?auto_374202 ?auto_374210 ) ) ( not ( = ?auto_374202 ?auto_374211 ) ) ( not ( = ?auto_374202 ?auto_374212 ) ) ( not ( = ?auto_374203 ?auto_374204 ) ) ( not ( = ?auto_374203 ?auto_374205 ) ) ( not ( = ?auto_374203 ?auto_374206 ) ) ( not ( = ?auto_374203 ?auto_374207 ) ) ( not ( = ?auto_374203 ?auto_374208 ) ) ( not ( = ?auto_374203 ?auto_374209 ) ) ( not ( = ?auto_374203 ?auto_374210 ) ) ( not ( = ?auto_374203 ?auto_374211 ) ) ( not ( = ?auto_374203 ?auto_374212 ) ) ( not ( = ?auto_374204 ?auto_374205 ) ) ( not ( = ?auto_374204 ?auto_374206 ) ) ( not ( = ?auto_374204 ?auto_374207 ) ) ( not ( = ?auto_374204 ?auto_374208 ) ) ( not ( = ?auto_374204 ?auto_374209 ) ) ( not ( = ?auto_374204 ?auto_374210 ) ) ( not ( = ?auto_374204 ?auto_374211 ) ) ( not ( = ?auto_374204 ?auto_374212 ) ) ( not ( = ?auto_374205 ?auto_374206 ) ) ( not ( = ?auto_374205 ?auto_374207 ) ) ( not ( = ?auto_374205 ?auto_374208 ) ) ( not ( = ?auto_374205 ?auto_374209 ) ) ( not ( = ?auto_374205 ?auto_374210 ) ) ( not ( = ?auto_374205 ?auto_374211 ) ) ( not ( = ?auto_374205 ?auto_374212 ) ) ( not ( = ?auto_374206 ?auto_374207 ) ) ( not ( = ?auto_374206 ?auto_374208 ) ) ( not ( = ?auto_374206 ?auto_374209 ) ) ( not ( = ?auto_374206 ?auto_374210 ) ) ( not ( = ?auto_374206 ?auto_374211 ) ) ( not ( = ?auto_374206 ?auto_374212 ) ) ( not ( = ?auto_374207 ?auto_374208 ) ) ( not ( = ?auto_374207 ?auto_374209 ) ) ( not ( = ?auto_374207 ?auto_374210 ) ) ( not ( = ?auto_374207 ?auto_374211 ) ) ( not ( = ?auto_374207 ?auto_374212 ) ) ( not ( = ?auto_374208 ?auto_374209 ) ) ( not ( = ?auto_374208 ?auto_374210 ) ) ( not ( = ?auto_374208 ?auto_374211 ) ) ( not ( = ?auto_374208 ?auto_374212 ) ) ( not ( = ?auto_374209 ?auto_374210 ) ) ( not ( = ?auto_374209 ?auto_374211 ) ) ( not ( = ?auto_374209 ?auto_374212 ) ) ( not ( = ?auto_374210 ?auto_374211 ) ) ( not ( = ?auto_374210 ?auto_374212 ) ) ( not ( = ?auto_374211 ?auto_374212 ) ) ( ON ?auto_374210 ?auto_374211 ) ( ON ?auto_374209 ?auto_374210 ) ( ON ?auto_374208 ?auto_374209 ) ( ON ?auto_374207 ?auto_374208 ) ( ON ?auto_374206 ?auto_374207 ) ( ON ?auto_374205 ?auto_374206 ) ( CLEAR ?auto_374203 ) ( ON ?auto_374204 ?auto_374205 ) ( CLEAR ?auto_374204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_374199 ?auto_374200 ?auto_374201 ?auto_374202 ?auto_374203 ?auto_374204 )
      ( MAKE-13PILE ?auto_374199 ?auto_374200 ?auto_374201 ?auto_374202 ?auto_374203 ?auto_374204 ?auto_374205 ?auto_374206 ?auto_374207 ?auto_374208 ?auto_374209 ?auto_374210 ?auto_374211 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374226 - BLOCK
      ?auto_374227 - BLOCK
      ?auto_374228 - BLOCK
      ?auto_374229 - BLOCK
      ?auto_374230 - BLOCK
      ?auto_374231 - BLOCK
      ?auto_374232 - BLOCK
      ?auto_374233 - BLOCK
      ?auto_374234 - BLOCK
      ?auto_374235 - BLOCK
      ?auto_374236 - BLOCK
      ?auto_374237 - BLOCK
      ?auto_374238 - BLOCK
    )
    :vars
    (
      ?auto_374239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374238 ?auto_374239 ) ( ON-TABLE ?auto_374226 ) ( ON ?auto_374227 ?auto_374226 ) ( ON ?auto_374228 ?auto_374227 ) ( ON ?auto_374229 ?auto_374228 ) ( ON ?auto_374230 ?auto_374229 ) ( not ( = ?auto_374226 ?auto_374227 ) ) ( not ( = ?auto_374226 ?auto_374228 ) ) ( not ( = ?auto_374226 ?auto_374229 ) ) ( not ( = ?auto_374226 ?auto_374230 ) ) ( not ( = ?auto_374226 ?auto_374231 ) ) ( not ( = ?auto_374226 ?auto_374232 ) ) ( not ( = ?auto_374226 ?auto_374233 ) ) ( not ( = ?auto_374226 ?auto_374234 ) ) ( not ( = ?auto_374226 ?auto_374235 ) ) ( not ( = ?auto_374226 ?auto_374236 ) ) ( not ( = ?auto_374226 ?auto_374237 ) ) ( not ( = ?auto_374226 ?auto_374238 ) ) ( not ( = ?auto_374226 ?auto_374239 ) ) ( not ( = ?auto_374227 ?auto_374228 ) ) ( not ( = ?auto_374227 ?auto_374229 ) ) ( not ( = ?auto_374227 ?auto_374230 ) ) ( not ( = ?auto_374227 ?auto_374231 ) ) ( not ( = ?auto_374227 ?auto_374232 ) ) ( not ( = ?auto_374227 ?auto_374233 ) ) ( not ( = ?auto_374227 ?auto_374234 ) ) ( not ( = ?auto_374227 ?auto_374235 ) ) ( not ( = ?auto_374227 ?auto_374236 ) ) ( not ( = ?auto_374227 ?auto_374237 ) ) ( not ( = ?auto_374227 ?auto_374238 ) ) ( not ( = ?auto_374227 ?auto_374239 ) ) ( not ( = ?auto_374228 ?auto_374229 ) ) ( not ( = ?auto_374228 ?auto_374230 ) ) ( not ( = ?auto_374228 ?auto_374231 ) ) ( not ( = ?auto_374228 ?auto_374232 ) ) ( not ( = ?auto_374228 ?auto_374233 ) ) ( not ( = ?auto_374228 ?auto_374234 ) ) ( not ( = ?auto_374228 ?auto_374235 ) ) ( not ( = ?auto_374228 ?auto_374236 ) ) ( not ( = ?auto_374228 ?auto_374237 ) ) ( not ( = ?auto_374228 ?auto_374238 ) ) ( not ( = ?auto_374228 ?auto_374239 ) ) ( not ( = ?auto_374229 ?auto_374230 ) ) ( not ( = ?auto_374229 ?auto_374231 ) ) ( not ( = ?auto_374229 ?auto_374232 ) ) ( not ( = ?auto_374229 ?auto_374233 ) ) ( not ( = ?auto_374229 ?auto_374234 ) ) ( not ( = ?auto_374229 ?auto_374235 ) ) ( not ( = ?auto_374229 ?auto_374236 ) ) ( not ( = ?auto_374229 ?auto_374237 ) ) ( not ( = ?auto_374229 ?auto_374238 ) ) ( not ( = ?auto_374229 ?auto_374239 ) ) ( not ( = ?auto_374230 ?auto_374231 ) ) ( not ( = ?auto_374230 ?auto_374232 ) ) ( not ( = ?auto_374230 ?auto_374233 ) ) ( not ( = ?auto_374230 ?auto_374234 ) ) ( not ( = ?auto_374230 ?auto_374235 ) ) ( not ( = ?auto_374230 ?auto_374236 ) ) ( not ( = ?auto_374230 ?auto_374237 ) ) ( not ( = ?auto_374230 ?auto_374238 ) ) ( not ( = ?auto_374230 ?auto_374239 ) ) ( not ( = ?auto_374231 ?auto_374232 ) ) ( not ( = ?auto_374231 ?auto_374233 ) ) ( not ( = ?auto_374231 ?auto_374234 ) ) ( not ( = ?auto_374231 ?auto_374235 ) ) ( not ( = ?auto_374231 ?auto_374236 ) ) ( not ( = ?auto_374231 ?auto_374237 ) ) ( not ( = ?auto_374231 ?auto_374238 ) ) ( not ( = ?auto_374231 ?auto_374239 ) ) ( not ( = ?auto_374232 ?auto_374233 ) ) ( not ( = ?auto_374232 ?auto_374234 ) ) ( not ( = ?auto_374232 ?auto_374235 ) ) ( not ( = ?auto_374232 ?auto_374236 ) ) ( not ( = ?auto_374232 ?auto_374237 ) ) ( not ( = ?auto_374232 ?auto_374238 ) ) ( not ( = ?auto_374232 ?auto_374239 ) ) ( not ( = ?auto_374233 ?auto_374234 ) ) ( not ( = ?auto_374233 ?auto_374235 ) ) ( not ( = ?auto_374233 ?auto_374236 ) ) ( not ( = ?auto_374233 ?auto_374237 ) ) ( not ( = ?auto_374233 ?auto_374238 ) ) ( not ( = ?auto_374233 ?auto_374239 ) ) ( not ( = ?auto_374234 ?auto_374235 ) ) ( not ( = ?auto_374234 ?auto_374236 ) ) ( not ( = ?auto_374234 ?auto_374237 ) ) ( not ( = ?auto_374234 ?auto_374238 ) ) ( not ( = ?auto_374234 ?auto_374239 ) ) ( not ( = ?auto_374235 ?auto_374236 ) ) ( not ( = ?auto_374235 ?auto_374237 ) ) ( not ( = ?auto_374235 ?auto_374238 ) ) ( not ( = ?auto_374235 ?auto_374239 ) ) ( not ( = ?auto_374236 ?auto_374237 ) ) ( not ( = ?auto_374236 ?auto_374238 ) ) ( not ( = ?auto_374236 ?auto_374239 ) ) ( not ( = ?auto_374237 ?auto_374238 ) ) ( not ( = ?auto_374237 ?auto_374239 ) ) ( not ( = ?auto_374238 ?auto_374239 ) ) ( ON ?auto_374237 ?auto_374238 ) ( ON ?auto_374236 ?auto_374237 ) ( ON ?auto_374235 ?auto_374236 ) ( ON ?auto_374234 ?auto_374235 ) ( ON ?auto_374233 ?auto_374234 ) ( ON ?auto_374232 ?auto_374233 ) ( CLEAR ?auto_374230 ) ( ON ?auto_374231 ?auto_374232 ) ( CLEAR ?auto_374231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_374226 ?auto_374227 ?auto_374228 ?auto_374229 ?auto_374230 ?auto_374231 )
      ( MAKE-13PILE ?auto_374226 ?auto_374227 ?auto_374228 ?auto_374229 ?auto_374230 ?auto_374231 ?auto_374232 ?auto_374233 ?auto_374234 ?auto_374235 ?auto_374236 ?auto_374237 ?auto_374238 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374253 - BLOCK
      ?auto_374254 - BLOCK
      ?auto_374255 - BLOCK
      ?auto_374256 - BLOCK
      ?auto_374257 - BLOCK
      ?auto_374258 - BLOCK
      ?auto_374259 - BLOCK
      ?auto_374260 - BLOCK
      ?auto_374261 - BLOCK
      ?auto_374262 - BLOCK
      ?auto_374263 - BLOCK
      ?auto_374264 - BLOCK
      ?auto_374265 - BLOCK
    )
    :vars
    (
      ?auto_374266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374265 ?auto_374266 ) ( ON-TABLE ?auto_374253 ) ( ON ?auto_374254 ?auto_374253 ) ( ON ?auto_374255 ?auto_374254 ) ( ON ?auto_374256 ?auto_374255 ) ( not ( = ?auto_374253 ?auto_374254 ) ) ( not ( = ?auto_374253 ?auto_374255 ) ) ( not ( = ?auto_374253 ?auto_374256 ) ) ( not ( = ?auto_374253 ?auto_374257 ) ) ( not ( = ?auto_374253 ?auto_374258 ) ) ( not ( = ?auto_374253 ?auto_374259 ) ) ( not ( = ?auto_374253 ?auto_374260 ) ) ( not ( = ?auto_374253 ?auto_374261 ) ) ( not ( = ?auto_374253 ?auto_374262 ) ) ( not ( = ?auto_374253 ?auto_374263 ) ) ( not ( = ?auto_374253 ?auto_374264 ) ) ( not ( = ?auto_374253 ?auto_374265 ) ) ( not ( = ?auto_374253 ?auto_374266 ) ) ( not ( = ?auto_374254 ?auto_374255 ) ) ( not ( = ?auto_374254 ?auto_374256 ) ) ( not ( = ?auto_374254 ?auto_374257 ) ) ( not ( = ?auto_374254 ?auto_374258 ) ) ( not ( = ?auto_374254 ?auto_374259 ) ) ( not ( = ?auto_374254 ?auto_374260 ) ) ( not ( = ?auto_374254 ?auto_374261 ) ) ( not ( = ?auto_374254 ?auto_374262 ) ) ( not ( = ?auto_374254 ?auto_374263 ) ) ( not ( = ?auto_374254 ?auto_374264 ) ) ( not ( = ?auto_374254 ?auto_374265 ) ) ( not ( = ?auto_374254 ?auto_374266 ) ) ( not ( = ?auto_374255 ?auto_374256 ) ) ( not ( = ?auto_374255 ?auto_374257 ) ) ( not ( = ?auto_374255 ?auto_374258 ) ) ( not ( = ?auto_374255 ?auto_374259 ) ) ( not ( = ?auto_374255 ?auto_374260 ) ) ( not ( = ?auto_374255 ?auto_374261 ) ) ( not ( = ?auto_374255 ?auto_374262 ) ) ( not ( = ?auto_374255 ?auto_374263 ) ) ( not ( = ?auto_374255 ?auto_374264 ) ) ( not ( = ?auto_374255 ?auto_374265 ) ) ( not ( = ?auto_374255 ?auto_374266 ) ) ( not ( = ?auto_374256 ?auto_374257 ) ) ( not ( = ?auto_374256 ?auto_374258 ) ) ( not ( = ?auto_374256 ?auto_374259 ) ) ( not ( = ?auto_374256 ?auto_374260 ) ) ( not ( = ?auto_374256 ?auto_374261 ) ) ( not ( = ?auto_374256 ?auto_374262 ) ) ( not ( = ?auto_374256 ?auto_374263 ) ) ( not ( = ?auto_374256 ?auto_374264 ) ) ( not ( = ?auto_374256 ?auto_374265 ) ) ( not ( = ?auto_374256 ?auto_374266 ) ) ( not ( = ?auto_374257 ?auto_374258 ) ) ( not ( = ?auto_374257 ?auto_374259 ) ) ( not ( = ?auto_374257 ?auto_374260 ) ) ( not ( = ?auto_374257 ?auto_374261 ) ) ( not ( = ?auto_374257 ?auto_374262 ) ) ( not ( = ?auto_374257 ?auto_374263 ) ) ( not ( = ?auto_374257 ?auto_374264 ) ) ( not ( = ?auto_374257 ?auto_374265 ) ) ( not ( = ?auto_374257 ?auto_374266 ) ) ( not ( = ?auto_374258 ?auto_374259 ) ) ( not ( = ?auto_374258 ?auto_374260 ) ) ( not ( = ?auto_374258 ?auto_374261 ) ) ( not ( = ?auto_374258 ?auto_374262 ) ) ( not ( = ?auto_374258 ?auto_374263 ) ) ( not ( = ?auto_374258 ?auto_374264 ) ) ( not ( = ?auto_374258 ?auto_374265 ) ) ( not ( = ?auto_374258 ?auto_374266 ) ) ( not ( = ?auto_374259 ?auto_374260 ) ) ( not ( = ?auto_374259 ?auto_374261 ) ) ( not ( = ?auto_374259 ?auto_374262 ) ) ( not ( = ?auto_374259 ?auto_374263 ) ) ( not ( = ?auto_374259 ?auto_374264 ) ) ( not ( = ?auto_374259 ?auto_374265 ) ) ( not ( = ?auto_374259 ?auto_374266 ) ) ( not ( = ?auto_374260 ?auto_374261 ) ) ( not ( = ?auto_374260 ?auto_374262 ) ) ( not ( = ?auto_374260 ?auto_374263 ) ) ( not ( = ?auto_374260 ?auto_374264 ) ) ( not ( = ?auto_374260 ?auto_374265 ) ) ( not ( = ?auto_374260 ?auto_374266 ) ) ( not ( = ?auto_374261 ?auto_374262 ) ) ( not ( = ?auto_374261 ?auto_374263 ) ) ( not ( = ?auto_374261 ?auto_374264 ) ) ( not ( = ?auto_374261 ?auto_374265 ) ) ( not ( = ?auto_374261 ?auto_374266 ) ) ( not ( = ?auto_374262 ?auto_374263 ) ) ( not ( = ?auto_374262 ?auto_374264 ) ) ( not ( = ?auto_374262 ?auto_374265 ) ) ( not ( = ?auto_374262 ?auto_374266 ) ) ( not ( = ?auto_374263 ?auto_374264 ) ) ( not ( = ?auto_374263 ?auto_374265 ) ) ( not ( = ?auto_374263 ?auto_374266 ) ) ( not ( = ?auto_374264 ?auto_374265 ) ) ( not ( = ?auto_374264 ?auto_374266 ) ) ( not ( = ?auto_374265 ?auto_374266 ) ) ( ON ?auto_374264 ?auto_374265 ) ( ON ?auto_374263 ?auto_374264 ) ( ON ?auto_374262 ?auto_374263 ) ( ON ?auto_374261 ?auto_374262 ) ( ON ?auto_374260 ?auto_374261 ) ( ON ?auto_374259 ?auto_374260 ) ( ON ?auto_374258 ?auto_374259 ) ( CLEAR ?auto_374256 ) ( ON ?auto_374257 ?auto_374258 ) ( CLEAR ?auto_374257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_374253 ?auto_374254 ?auto_374255 ?auto_374256 ?auto_374257 )
      ( MAKE-13PILE ?auto_374253 ?auto_374254 ?auto_374255 ?auto_374256 ?auto_374257 ?auto_374258 ?auto_374259 ?auto_374260 ?auto_374261 ?auto_374262 ?auto_374263 ?auto_374264 ?auto_374265 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374280 - BLOCK
      ?auto_374281 - BLOCK
      ?auto_374282 - BLOCK
      ?auto_374283 - BLOCK
      ?auto_374284 - BLOCK
      ?auto_374285 - BLOCK
      ?auto_374286 - BLOCK
      ?auto_374287 - BLOCK
      ?auto_374288 - BLOCK
      ?auto_374289 - BLOCK
      ?auto_374290 - BLOCK
      ?auto_374291 - BLOCK
      ?auto_374292 - BLOCK
    )
    :vars
    (
      ?auto_374293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374292 ?auto_374293 ) ( ON-TABLE ?auto_374280 ) ( ON ?auto_374281 ?auto_374280 ) ( ON ?auto_374282 ?auto_374281 ) ( ON ?auto_374283 ?auto_374282 ) ( not ( = ?auto_374280 ?auto_374281 ) ) ( not ( = ?auto_374280 ?auto_374282 ) ) ( not ( = ?auto_374280 ?auto_374283 ) ) ( not ( = ?auto_374280 ?auto_374284 ) ) ( not ( = ?auto_374280 ?auto_374285 ) ) ( not ( = ?auto_374280 ?auto_374286 ) ) ( not ( = ?auto_374280 ?auto_374287 ) ) ( not ( = ?auto_374280 ?auto_374288 ) ) ( not ( = ?auto_374280 ?auto_374289 ) ) ( not ( = ?auto_374280 ?auto_374290 ) ) ( not ( = ?auto_374280 ?auto_374291 ) ) ( not ( = ?auto_374280 ?auto_374292 ) ) ( not ( = ?auto_374280 ?auto_374293 ) ) ( not ( = ?auto_374281 ?auto_374282 ) ) ( not ( = ?auto_374281 ?auto_374283 ) ) ( not ( = ?auto_374281 ?auto_374284 ) ) ( not ( = ?auto_374281 ?auto_374285 ) ) ( not ( = ?auto_374281 ?auto_374286 ) ) ( not ( = ?auto_374281 ?auto_374287 ) ) ( not ( = ?auto_374281 ?auto_374288 ) ) ( not ( = ?auto_374281 ?auto_374289 ) ) ( not ( = ?auto_374281 ?auto_374290 ) ) ( not ( = ?auto_374281 ?auto_374291 ) ) ( not ( = ?auto_374281 ?auto_374292 ) ) ( not ( = ?auto_374281 ?auto_374293 ) ) ( not ( = ?auto_374282 ?auto_374283 ) ) ( not ( = ?auto_374282 ?auto_374284 ) ) ( not ( = ?auto_374282 ?auto_374285 ) ) ( not ( = ?auto_374282 ?auto_374286 ) ) ( not ( = ?auto_374282 ?auto_374287 ) ) ( not ( = ?auto_374282 ?auto_374288 ) ) ( not ( = ?auto_374282 ?auto_374289 ) ) ( not ( = ?auto_374282 ?auto_374290 ) ) ( not ( = ?auto_374282 ?auto_374291 ) ) ( not ( = ?auto_374282 ?auto_374292 ) ) ( not ( = ?auto_374282 ?auto_374293 ) ) ( not ( = ?auto_374283 ?auto_374284 ) ) ( not ( = ?auto_374283 ?auto_374285 ) ) ( not ( = ?auto_374283 ?auto_374286 ) ) ( not ( = ?auto_374283 ?auto_374287 ) ) ( not ( = ?auto_374283 ?auto_374288 ) ) ( not ( = ?auto_374283 ?auto_374289 ) ) ( not ( = ?auto_374283 ?auto_374290 ) ) ( not ( = ?auto_374283 ?auto_374291 ) ) ( not ( = ?auto_374283 ?auto_374292 ) ) ( not ( = ?auto_374283 ?auto_374293 ) ) ( not ( = ?auto_374284 ?auto_374285 ) ) ( not ( = ?auto_374284 ?auto_374286 ) ) ( not ( = ?auto_374284 ?auto_374287 ) ) ( not ( = ?auto_374284 ?auto_374288 ) ) ( not ( = ?auto_374284 ?auto_374289 ) ) ( not ( = ?auto_374284 ?auto_374290 ) ) ( not ( = ?auto_374284 ?auto_374291 ) ) ( not ( = ?auto_374284 ?auto_374292 ) ) ( not ( = ?auto_374284 ?auto_374293 ) ) ( not ( = ?auto_374285 ?auto_374286 ) ) ( not ( = ?auto_374285 ?auto_374287 ) ) ( not ( = ?auto_374285 ?auto_374288 ) ) ( not ( = ?auto_374285 ?auto_374289 ) ) ( not ( = ?auto_374285 ?auto_374290 ) ) ( not ( = ?auto_374285 ?auto_374291 ) ) ( not ( = ?auto_374285 ?auto_374292 ) ) ( not ( = ?auto_374285 ?auto_374293 ) ) ( not ( = ?auto_374286 ?auto_374287 ) ) ( not ( = ?auto_374286 ?auto_374288 ) ) ( not ( = ?auto_374286 ?auto_374289 ) ) ( not ( = ?auto_374286 ?auto_374290 ) ) ( not ( = ?auto_374286 ?auto_374291 ) ) ( not ( = ?auto_374286 ?auto_374292 ) ) ( not ( = ?auto_374286 ?auto_374293 ) ) ( not ( = ?auto_374287 ?auto_374288 ) ) ( not ( = ?auto_374287 ?auto_374289 ) ) ( not ( = ?auto_374287 ?auto_374290 ) ) ( not ( = ?auto_374287 ?auto_374291 ) ) ( not ( = ?auto_374287 ?auto_374292 ) ) ( not ( = ?auto_374287 ?auto_374293 ) ) ( not ( = ?auto_374288 ?auto_374289 ) ) ( not ( = ?auto_374288 ?auto_374290 ) ) ( not ( = ?auto_374288 ?auto_374291 ) ) ( not ( = ?auto_374288 ?auto_374292 ) ) ( not ( = ?auto_374288 ?auto_374293 ) ) ( not ( = ?auto_374289 ?auto_374290 ) ) ( not ( = ?auto_374289 ?auto_374291 ) ) ( not ( = ?auto_374289 ?auto_374292 ) ) ( not ( = ?auto_374289 ?auto_374293 ) ) ( not ( = ?auto_374290 ?auto_374291 ) ) ( not ( = ?auto_374290 ?auto_374292 ) ) ( not ( = ?auto_374290 ?auto_374293 ) ) ( not ( = ?auto_374291 ?auto_374292 ) ) ( not ( = ?auto_374291 ?auto_374293 ) ) ( not ( = ?auto_374292 ?auto_374293 ) ) ( ON ?auto_374291 ?auto_374292 ) ( ON ?auto_374290 ?auto_374291 ) ( ON ?auto_374289 ?auto_374290 ) ( ON ?auto_374288 ?auto_374289 ) ( ON ?auto_374287 ?auto_374288 ) ( ON ?auto_374286 ?auto_374287 ) ( ON ?auto_374285 ?auto_374286 ) ( CLEAR ?auto_374283 ) ( ON ?auto_374284 ?auto_374285 ) ( CLEAR ?auto_374284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_374280 ?auto_374281 ?auto_374282 ?auto_374283 ?auto_374284 )
      ( MAKE-13PILE ?auto_374280 ?auto_374281 ?auto_374282 ?auto_374283 ?auto_374284 ?auto_374285 ?auto_374286 ?auto_374287 ?auto_374288 ?auto_374289 ?auto_374290 ?auto_374291 ?auto_374292 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374307 - BLOCK
      ?auto_374308 - BLOCK
      ?auto_374309 - BLOCK
      ?auto_374310 - BLOCK
      ?auto_374311 - BLOCK
      ?auto_374312 - BLOCK
      ?auto_374313 - BLOCK
      ?auto_374314 - BLOCK
      ?auto_374315 - BLOCK
      ?auto_374316 - BLOCK
      ?auto_374317 - BLOCK
      ?auto_374318 - BLOCK
      ?auto_374319 - BLOCK
    )
    :vars
    (
      ?auto_374320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374319 ?auto_374320 ) ( ON-TABLE ?auto_374307 ) ( ON ?auto_374308 ?auto_374307 ) ( ON ?auto_374309 ?auto_374308 ) ( not ( = ?auto_374307 ?auto_374308 ) ) ( not ( = ?auto_374307 ?auto_374309 ) ) ( not ( = ?auto_374307 ?auto_374310 ) ) ( not ( = ?auto_374307 ?auto_374311 ) ) ( not ( = ?auto_374307 ?auto_374312 ) ) ( not ( = ?auto_374307 ?auto_374313 ) ) ( not ( = ?auto_374307 ?auto_374314 ) ) ( not ( = ?auto_374307 ?auto_374315 ) ) ( not ( = ?auto_374307 ?auto_374316 ) ) ( not ( = ?auto_374307 ?auto_374317 ) ) ( not ( = ?auto_374307 ?auto_374318 ) ) ( not ( = ?auto_374307 ?auto_374319 ) ) ( not ( = ?auto_374307 ?auto_374320 ) ) ( not ( = ?auto_374308 ?auto_374309 ) ) ( not ( = ?auto_374308 ?auto_374310 ) ) ( not ( = ?auto_374308 ?auto_374311 ) ) ( not ( = ?auto_374308 ?auto_374312 ) ) ( not ( = ?auto_374308 ?auto_374313 ) ) ( not ( = ?auto_374308 ?auto_374314 ) ) ( not ( = ?auto_374308 ?auto_374315 ) ) ( not ( = ?auto_374308 ?auto_374316 ) ) ( not ( = ?auto_374308 ?auto_374317 ) ) ( not ( = ?auto_374308 ?auto_374318 ) ) ( not ( = ?auto_374308 ?auto_374319 ) ) ( not ( = ?auto_374308 ?auto_374320 ) ) ( not ( = ?auto_374309 ?auto_374310 ) ) ( not ( = ?auto_374309 ?auto_374311 ) ) ( not ( = ?auto_374309 ?auto_374312 ) ) ( not ( = ?auto_374309 ?auto_374313 ) ) ( not ( = ?auto_374309 ?auto_374314 ) ) ( not ( = ?auto_374309 ?auto_374315 ) ) ( not ( = ?auto_374309 ?auto_374316 ) ) ( not ( = ?auto_374309 ?auto_374317 ) ) ( not ( = ?auto_374309 ?auto_374318 ) ) ( not ( = ?auto_374309 ?auto_374319 ) ) ( not ( = ?auto_374309 ?auto_374320 ) ) ( not ( = ?auto_374310 ?auto_374311 ) ) ( not ( = ?auto_374310 ?auto_374312 ) ) ( not ( = ?auto_374310 ?auto_374313 ) ) ( not ( = ?auto_374310 ?auto_374314 ) ) ( not ( = ?auto_374310 ?auto_374315 ) ) ( not ( = ?auto_374310 ?auto_374316 ) ) ( not ( = ?auto_374310 ?auto_374317 ) ) ( not ( = ?auto_374310 ?auto_374318 ) ) ( not ( = ?auto_374310 ?auto_374319 ) ) ( not ( = ?auto_374310 ?auto_374320 ) ) ( not ( = ?auto_374311 ?auto_374312 ) ) ( not ( = ?auto_374311 ?auto_374313 ) ) ( not ( = ?auto_374311 ?auto_374314 ) ) ( not ( = ?auto_374311 ?auto_374315 ) ) ( not ( = ?auto_374311 ?auto_374316 ) ) ( not ( = ?auto_374311 ?auto_374317 ) ) ( not ( = ?auto_374311 ?auto_374318 ) ) ( not ( = ?auto_374311 ?auto_374319 ) ) ( not ( = ?auto_374311 ?auto_374320 ) ) ( not ( = ?auto_374312 ?auto_374313 ) ) ( not ( = ?auto_374312 ?auto_374314 ) ) ( not ( = ?auto_374312 ?auto_374315 ) ) ( not ( = ?auto_374312 ?auto_374316 ) ) ( not ( = ?auto_374312 ?auto_374317 ) ) ( not ( = ?auto_374312 ?auto_374318 ) ) ( not ( = ?auto_374312 ?auto_374319 ) ) ( not ( = ?auto_374312 ?auto_374320 ) ) ( not ( = ?auto_374313 ?auto_374314 ) ) ( not ( = ?auto_374313 ?auto_374315 ) ) ( not ( = ?auto_374313 ?auto_374316 ) ) ( not ( = ?auto_374313 ?auto_374317 ) ) ( not ( = ?auto_374313 ?auto_374318 ) ) ( not ( = ?auto_374313 ?auto_374319 ) ) ( not ( = ?auto_374313 ?auto_374320 ) ) ( not ( = ?auto_374314 ?auto_374315 ) ) ( not ( = ?auto_374314 ?auto_374316 ) ) ( not ( = ?auto_374314 ?auto_374317 ) ) ( not ( = ?auto_374314 ?auto_374318 ) ) ( not ( = ?auto_374314 ?auto_374319 ) ) ( not ( = ?auto_374314 ?auto_374320 ) ) ( not ( = ?auto_374315 ?auto_374316 ) ) ( not ( = ?auto_374315 ?auto_374317 ) ) ( not ( = ?auto_374315 ?auto_374318 ) ) ( not ( = ?auto_374315 ?auto_374319 ) ) ( not ( = ?auto_374315 ?auto_374320 ) ) ( not ( = ?auto_374316 ?auto_374317 ) ) ( not ( = ?auto_374316 ?auto_374318 ) ) ( not ( = ?auto_374316 ?auto_374319 ) ) ( not ( = ?auto_374316 ?auto_374320 ) ) ( not ( = ?auto_374317 ?auto_374318 ) ) ( not ( = ?auto_374317 ?auto_374319 ) ) ( not ( = ?auto_374317 ?auto_374320 ) ) ( not ( = ?auto_374318 ?auto_374319 ) ) ( not ( = ?auto_374318 ?auto_374320 ) ) ( not ( = ?auto_374319 ?auto_374320 ) ) ( ON ?auto_374318 ?auto_374319 ) ( ON ?auto_374317 ?auto_374318 ) ( ON ?auto_374316 ?auto_374317 ) ( ON ?auto_374315 ?auto_374316 ) ( ON ?auto_374314 ?auto_374315 ) ( ON ?auto_374313 ?auto_374314 ) ( ON ?auto_374312 ?auto_374313 ) ( ON ?auto_374311 ?auto_374312 ) ( CLEAR ?auto_374309 ) ( ON ?auto_374310 ?auto_374311 ) ( CLEAR ?auto_374310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_374307 ?auto_374308 ?auto_374309 ?auto_374310 )
      ( MAKE-13PILE ?auto_374307 ?auto_374308 ?auto_374309 ?auto_374310 ?auto_374311 ?auto_374312 ?auto_374313 ?auto_374314 ?auto_374315 ?auto_374316 ?auto_374317 ?auto_374318 ?auto_374319 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374334 - BLOCK
      ?auto_374335 - BLOCK
      ?auto_374336 - BLOCK
      ?auto_374337 - BLOCK
      ?auto_374338 - BLOCK
      ?auto_374339 - BLOCK
      ?auto_374340 - BLOCK
      ?auto_374341 - BLOCK
      ?auto_374342 - BLOCK
      ?auto_374343 - BLOCK
      ?auto_374344 - BLOCK
      ?auto_374345 - BLOCK
      ?auto_374346 - BLOCK
    )
    :vars
    (
      ?auto_374347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374346 ?auto_374347 ) ( ON-TABLE ?auto_374334 ) ( ON ?auto_374335 ?auto_374334 ) ( ON ?auto_374336 ?auto_374335 ) ( not ( = ?auto_374334 ?auto_374335 ) ) ( not ( = ?auto_374334 ?auto_374336 ) ) ( not ( = ?auto_374334 ?auto_374337 ) ) ( not ( = ?auto_374334 ?auto_374338 ) ) ( not ( = ?auto_374334 ?auto_374339 ) ) ( not ( = ?auto_374334 ?auto_374340 ) ) ( not ( = ?auto_374334 ?auto_374341 ) ) ( not ( = ?auto_374334 ?auto_374342 ) ) ( not ( = ?auto_374334 ?auto_374343 ) ) ( not ( = ?auto_374334 ?auto_374344 ) ) ( not ( = ?auto_374334 ?auto_374345 ) ) ( not ( = ?auto_374334 ?auto_374346 ) ) ( not ( = ?auto_374334 ?auto_374347 ) ) ( not ( = ?auto_374335 ?auto_374336 ) ) ( not ( = ?auto_374335 ?auto_374337 ) ) ( not ( = ?auto_374335 ?auto_374338 ) ) ( not ( = ?auto_374335 ?auto_374339 ) ) ( not ( = ?auto_374335 ?auto_374340 ) ) ( not ( = ?auto_374335 ?auto_374341 ) ) ( not ( = ?auto_374335 ?auto_374342 ) ) ( not ( = ?auto_374335 ?auto_374343 ) ) ( not ( = ?auto_374335 ?auto_374344 ) ) ( not ( = ?auto_374335 ?auto_374345 ) ) ( not ( = ?auto_374335 ?auto_374346 ) ) ( not ( = ?auto_374335 ?auto_374347 ) ) ( not ( = ?auto_374336 ?auto_374337 ) ) ( not ( = ?auto_374336 ?auto_374338 ) ) ( not ( = ?auto_374336 ?auto_374339 ) ) ( not ( = ?auto_374336 ?auto_374340 ) ) ( not ( = ?auto_374336 ?auto_374341 ) ) ( not ( = ?auto_374336 ?auto_374342 ) ) ( not ( = ?auto_374336 ?auto_374343 ) ) ( not ( = ?auto_374336 ?auto_374344 ) ) ( not ( = ?auto_374336 ?auto_374345 ) ) ( not ( = ?auto_374336 ?auto_374346 ) ) ( not ( = ?auto_374336 ?auto_374347 ) ) ( not ( = ?auto_374337 ?auto_374338 ) ) ( not ( = ?auto_374337 ?auto_374339 ) ) ( not ( = ?auto_374337 ?auto_374340 ) ) ( not ( = ?auto_374337 ?auto_374341 ) ) ( not ( = ?auto_374337 ?auto_374342 ) ) ( not ( = ?auto_374337 ?auto_374343 ) ) ( not ( = ?auto_374337 ?auto_374344 ) ) ( not ( = ?auto_374337 ?auto_374345 ) ) ( not ( = ?auto_374337 ?auto_374346 ) ) ( not ( = ?auto_374337 ?auto_374347 ) ) ( not ( = ?auto_374338 ?auto_374339 ) ) ( not ( = ?auto_374338 ?auto_374340 ) ) ( not ( = ?auto_374338 ?auto_374341 ) ) ( not ( = ?auto_374338 ?auto_374342 ) ) ( not ( = ?auto_374338 ?auto_374343 ) ) ( not ( = ?auto_374338 ?auto_374344 ) ) ( not ( = ?auto_374338 ?auto_374345 ) ) ( not ( = ?auto_374338 ?auto_374346 ) ) ( not ( = ?auto_374338 ?auto_374347 ) ) ( not ( = ?auto_374339 ?auto_374340 ) ) ( not ( = ?auto_374339 ?auto_374341 ) ) ( not ( = ?auto_374339 ?auto_374342 ) ) ( not ( = ?auto_374339 ?auto_374343 ) ) ( not ( = ?auto_374339 ?auto_374344 ) ) ( not ( = ?auto_374339 ?auto_374345 ) ) ( not ( = ?auto_374339 ?auto_374346 ) ) ( not ( = ?auto_374339 ?auto_374347 ) ) ( not ( = ?auto_374340 ?auto_374341 ) ) ( not ( = ?auto_374340 ?auto_374342 ) ) ( not ( = ?auto_374340 ?auto_374343 ) ) ( not ( = ?auto_374340 ?auto_374344 ) ) ( not ( = ?auto_374340 ?auto_374345 ) ) ( not ( = ?auto_374340 ?auto_374346 ) ) ( not ( = ?auto_374340 ?auto_374347 ) ) ( not ( = ?auto_374341 ?auto_374342 ) ) ( not ( = ?auto_374341 ?auto_374343 ) ) ( not ( = ?auto_374341 ?auto_374344 ) ) ( not ( = ?auto_374341 ?auto_374345 ) ) ( not ( = ?auto_374341 ?auto_374346 ) ) ( not ( = ?auto_374341 ?auto_374347 ) ) ( not ( = ?auto_374342 ?auto_374343 ) ) ( not ( = ?auto_374342 ?auto_374344 ) ) ( not ( = ?auto_374342 ?auto_374345 ) ) ( not ( = ?auto_374342 ?auto_374346 ) ) ( not ( = ?auto_374342 ?auto_374347 ) ) ( not ( = ?auto_374343 ?auto_374344 ) ) ( not ( = ?auto_374343 ?auto_374345 ) ) ( not ( = ?auto_374343 ?auto_374346 ) ) ( not ( = ?auto_374343 ?auto_374347 ) ) ( not ( = ?auto_374344 ?auto_374345 ) ) ( not ( = ?auto_374344 ?auto_374346 ) ) ( not ( = ?auto_374344 ?auto_374347 ) ) ( not ( = ?auto_374345 ?auto_374346 ) ) ( not ( = ?auto_374345 ?auto_374347 ) ) ( not ( = ?auto_374346 ?auto_374347 ) ) ( ON ?auto_374345 ?auto_374346 ) ( ON ?auto_374344 ?auto_374345 ) ( ON ?auto_374343 ?auto_374344 ) ( ON ?auto_374342 ?auto_374343 ) ( ON ?auto_374341 ?auto_374342 ) ( ON ?auto_374340 ?auto_374341 ) ( ON ?auto_374339 ?auto_374340 ) ( ON ?auto_374338 ?auto_374339 ) ( CLEAR ?auto_374336 ) ( ON ?auto_374337 ?auto_374338 ) ( CLEAR ?auto_374337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_374334 ?auto_374335 ?auto_374336 ?auto_374337 )
      ( MAKE-13PILE ?auto_374334 ?auto_374335 ?auto_374336 ?auto_374337 ?auto_374338 ?auto_374339 ?auto_374340 ?auto_374341 ?auto_374342 ?auto_374343 ?auto_374344 ?auto_374345 ?auto_374346 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374361 - BLOCK
      ?auto_374362 - BLOCK
      ?auto_374363 - BLOCK
      ?auto_374364 - BLOCK
      ?auto_374365 - BLOCK
      ?auto_374366 - BLOCK
      ?auto_374367 - BLOCK
      ?auto_374368 - BLOCK
      ?auto_374369 - BLOCK
      ?auto_374370 - BLOCK
      ?auto_374371 - BLOCK
      ?auto_374372 - BLOCK
      ?auto_374373 - BLOCK
    )
    :vars
    (
      ?auto_374374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374373 ?auto_374374 ) ( ON-TABLE ?auto_374361 ) ( ON ?auto_374362 ?auto_374361 ) ( not ( = ?auto_374361 ?auto_374362 ) ) ( not ( = ?auto_374361 ?auto_374363 ) ) ( not ( = ?auto_374361 ?auto_374364 ) ) ( not ( = ?auto_374361 ?auto_374365 ) ) ( not ( = ?auto_374361 ?auto_374366 ) ) ( not ( = ?auto_374361 ?auto_374367 ) ) ( not ( = ?auto_374361 ?auto_374368 ) ) ( not ( = ?auto_374361 ?auto_374369 ) ) ( not ( = ?auto_374361 ?auto_374370 ) ) ( not ( = ?auto_374361 ?auto_374371 ) ) ( not ( = ?auto_374361 ?auto_374372 ) ) ( not ( = ?auto_374361 ?auto_374373 ) ) ( not ( = ?auto_374361 ?auto_374374 ) ) ( not ( = ?auto_374362 ?auto_374363 ) ) ( not ( = ?auto_374362 ?auto_374364 ) ) ( not ( = ?auto_374362 ?auto_374365 ) ) ( not ( = ?auto_374362 ?auto_374366 ) ) ( not ( = ?auto_374362 ?auto_374367 ) ) ( not ( = ?auto_374362 ?auto_374368 ) ) ( not ( = ?auto_374362 ?auto_374369 ) ) ( not ( = ?auto_374362 ?auto_374370 ) ) ( not ( = ?auto_374362 ?auto_374371 ) ) ( not ( = ?auto_374362 ?auto_374372 ) ) ( not ( = ?auto_374362 ?auto_374373 ) ) ( not ( = ?auto_374362 ?auto_374374 ) ) ( not ( = ?auto_374363 ?auto_374364 ) ) ( not ( = ?auto_374363 ?auto_374365 ) ) ( not ( = ?auto_374363 ?auto_374366 ) ) ( not ( = ?auto_374363 ?auto_374367 ) ) ( not ( = ?auto_374363 ?auto_374368 ) ) ( not ( = ?auto_374363 ?auto_374369 ) ) ( not ( = ?auto_374363 ?auto_374370 ) ) ( not ( = ?auto_374363 ?auto_374371 ) ) ( not ( = ?auto_374363 ?auto_374372 ) ) ( not ( = ?auto_374363 ?auto_374373 ) ) ( not ( = ?auto_374363 ?auto_374374 ) ) ( not ( = ?auto_374364 ?auto_374365 ) ) ( not ( = ?auto_374364 ?auto_374366 ) ) ( not ( = ?auto_374364 ?auto_374367 ) ) ( not ( = ?auto_374364 ?auto_374368 ) ) ( not ( = ?auto_374364 ?auto_374369 ) ) ( not ( = ?auto_374364 ?auto_374370 ) ) ( not ( = ?auto_374364 ?auto_374371 ) ) ( not ( = ?auto_374364 ?auto_374372 ) ) ( not ( = ?auto_374364 ?auto_374373 ) ) ( not ( = ?auto_374364 ?auto_374374 ) ) ( not ( = ?auto_374365 ?auto_374366 ) ) ( not ( = ?auto_374365 ?auto_374367 ) ) ( not ( = ?auto_374365 ?auto_374368 ) ) ( not ( = ?auto_374365 ?auto_374369 ) ) ( not ( = ?auto_374365 ?auto_374370 ) ) ( not ( = ?auto_374365 ?auto_374371 ) ) ( not ( = ?auto_374365 ?auto_374372 ) ) ( not ( = ?auto_374365 ?auto_374373 ) ) ( not ( = ?auto_374365 ?auto_374374 ) ) ( not ( = ?auto_374366 ?auto_374367 ) ) ( not ( = ?auto_374366 ?auto_374368 ) ) ( not ( = ?auto_374366 ?auto_374369 ) ) ( not ( = ?auto_374366 ?auto_374370 ) ) ( not ( = ?auto_374366 ?auto_374371 ) ) ( not ( = ?auto_374366 ?auto_374372 ) ) ( not ( = ?auto_374366 ?auto_374373 ) ) ( not ( = ?auto_374366 ?auto_374374 ) ) ( not ( = ?auto_374367 ?auto_374368 ) ) ( not ( = ?auto_374367 ?auto_374369 ) ) ( not ( = ?auto_374367 ?auto_374370 ) ) ( not ( = ?auto_374367 ?auto_374371 ) ) ( not ( = ?auto_374367 ?auto_374372 ) ) ( not ( = ?auto_374367 ?auto_374373 ) ) ( not ( = ?auto_374367 ?auto_374374 ) ) ( not ( = ?auto_374368 ?auto_374369 ) ) ( not ( = ?auto_374368 ?auto_374370 ) ) ( not ( = ?auto_374368 ?auto_374371 ) ) ( not ( = ?auto_374368 ?auto_374372 ) ) ( not ( = ?auto_374368 ?auto_374373 ) ) ( not ( = ?auto_374368 ?auto_374374 ) ) ( not ( = ?auto_374369 ?auto_374370 ) ) ( not ( = ?auto_374369 ?auto_374371 ) ) ( not ( = ?auto_374369 ?auto_374372 ) ) ( not ( = ?auto_374369 ?auto_374373 ) ) ( not ( = ?auto_374369 ?auto_374374 ) ) ( not ( = ?auto_374370 ?auto_374371 ) ) ( not ( = ?auto_374370 ?auto_374372 ) ) ( not ( = ?auto_374370 ?auto_374373 ) ) ( not ( = ?auto_374370 ?auto_374374 ) ) ( not ( = ?auto_374371 ?auto_374372 ) ) ( not ( = ?auto_374371 ?auto_374373 ) ) ( not ( = ?auto_374371 ?auto_374374 ) ) ( not ( = ?auto_374372 ?auto_374373 ) ) ( not ( = ?auto_374372 ?auto_374374 ) ) ( not ( = ?auto_374373 ?auto_374374 ) ) ( ON ?auto_374372 ?auto_374373 ) ( ON ?auto_374371 ?auto_374372 ) ( ON ?auto_374370 ?auto_374371 ) ( ON ?auto_374369 ?auto_374370 ) ( ON ?auto_374368 ?auto_374369 ) ( ON ?auto_374367 ?auto_374368 ) ( ON ?auto_374366 ?auto_374367 ) ( ON ?auto_374365 ?auto_374366 ) ( ON ?auto_374364 ?auto_374365 ) ( CLEAR ?auto_374362 ) ( ON ?auto_374363 ?auto_374364 ) ( CLEAR ?auto_374363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_374361 ?auto_374362 ?auto_374363 )
      ( MAKE-13PILE ?auto_374361 ?auto_374362 ?auto_374363 ?auto_374364 ?auto_374365 ?auto_374366 ?auto_374367 ?auto_374368 ?auto_374369 ?auto_374370 ?auto_374371 ?auto_374372 ?auto_374373 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374388 - BLOCK
      ?auto_374389 - BLOCK
      ?auto_374390 - BLOCK
      ?auto_374391 - BLOCK
      ?auto_374392 - BLOCK
      ?auto_374393 - BLOCK
      ?auto_374394 - BLOCK
      ?auto_374395 - BLOCK
      ?auto_374396 - BLOCK
      ?auto_374397 - BLOCK
      ?auto_374398 - BLOCK
      ?auto_374399 - BLOCK
      ?auto_374400 - BLOCK
    )
    :vars
    (
      ?auto_374401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374400 ?auto_374401 ) ( ON-TABLE ?auto_374388 ) ( ON ?auto_374389 ?auto_374388 ) ( not ( = ?auto_374388 ?auto_374389 ) ) ( not ( = ?auto_374388 ?auto_374390 ) ) ( not ( = ?auto_374388 ?auto_374391 ) ) ( not ( = ?auto_374388 ?auto_374392 ) ) ( not ( = ?auto_374388 ?auto_374393 ) ) ( not ( = ?auto_374388 ?auto_374394 ) ) ( not ( = ?auto_374388 ?auto_374395 ) ) ( not ( = ?auto_374388 ?auto_374396 ) ) ( not ( = ?auto_374388 ?auto_374397 ) ) ( not ( = ?auto_374388 ?auto_374398 ) ) ( not ( = ?auto_374388 ?auto_374399 ) ) ( not ( = ?auto_374388 ?auto_374400 ) ) ( not ( = ?auto_374388 ?auto_374401 ) ) ( not ( = ?auto_374389 ?auto_374390 ) ) ( not ( = ?auto_374389 ?auto_374391 ) ) ( not ( = ?auto_374389 ?auto_374392 ) ) ( not ( = ?auto_374389 ?auto_374393 ) ) ( not ( = ?auto_374389 ?auto_374394 ) ) ( not ( = ?auto_374389 ?auto_374395 ) ) ( not ( = ?auto_374389 ?auto_374396 ) ) ( not ( = ?auto_374389 ?auto_374397 ) ) ( not ( = ?auto_374389 ?auto_374398 ) ) ( not ( = ?auto_374389 ?auto_374399 ) ) ( not ( = ?auto_374389 ?auto_374400 ) ) ( not ( = ?auto_374389 ?auto_374401 ) ) ( not ( = ?auto_374390 ?auto_374391 ) ) ( not ( = ?auto_374390 ?auto_374392 ) ) ( not ( = ?auto_374390 ?auto_374393 ) ) ( not ( = ?auto_374390 ?auto_374394 ) ) ( not ( = ?auto_374390 ?auto_374395 ) ) ( not ( = ?auto_374390 ?auto_374396 ) ) ( not ( = ?auto_374390 ?auto_374397 ) ) ( not ( = ?auto_374390 ?auto_374398 ) ) ( not ( = ?auto_374390 ?auto_374399 ) ) ( not ( = ?auto_374390 ?auto_374400 ) ) ( not ( = ?auto_374390 ?auto_374401 ) ) ( not ( = ?auto_374391 ?auto_374392 ) ) ( not ( = ?auto_374391 ?auto_374393 ) ) ( not ( = ?auto_374391 ?auto_374394 ) ) ( not ( = ?auto_374391 ?auto_374395 ) ) ( not ( = ?auto_374391 ?auto_374396 ) ) ( not ( = ?auto_374391 ?auto_374397 ) ) ( not ( = ?auto_374391 ?auto_374398 ) ) ( not ( = ?auto_374391 ?auto_374399 ) ) ( not ( = ?auto_374391 ?auto_374400 ) ) ( not ( = ?auto_374391 ?auto_374401 ) ) ( not ( = ?auto_374392 ?auto_374393 ) ) ( not ( = ?auto_374392 ?auto_374394 ) ) ( not ( = ?auto_374392 ?auto_374395 ) ) ( not ( = ?auto_374392 ?auto_374396 ) ) ( not ( = ?auto_374392 ?auto_374397 ) ) ( not ( = ?auto_374392 ?auto_374398 ) ) ( not ( = ?auto_374392 ?auto_374399 ) ) ( not ( = ?auto_374392 ?auto_374400 ) ) ( not ( = ?auto_374392 ?auto_374401 ) ) ( not ( = ?auto_374393 ?auto_374394 ) ) ( not ( = ?auto_374393 ?auto_374395 ) ) ( not ( = ?auto_374393 ?auto_374396 ) ) ( not ( = ?auto_374393 ?auto_374397 ) ) ( not ( = ?auto_374393 ?auto_374398 ) ) ( not ( = ?auto_374393 ?auto_374399 ) ) ( not ( = ?auto_374393 ?auto_374400 ) ) ( not ( = ?auto_374393 ?auto_374401 ) ) ( not ( = ?auto_374394 ?auto_374395 ) ) ( not ( = ?auto_374394 ?auto_374396 ) ) ( not ( = ?auto_374394 ?auto_374397 ) ) ( not ( = ?auto_374394 ?auto_374398 ) ) ( not ( = ?auto_374394 ?auto_374399 ) ) ( not ( = ?auto_374394 ?auto_374400 ) ) ( not ( = ?auto_374394 ?auto_374401 ) ) ( not ( = ?auto_374395 ?auto_374396 ) ) ( not ( = ?auto_374395 ?auto_374397 ) ) ( not ( = ?auto_374395 ?auto_374398 ) ) ( not ( = ?auto_374395 ?auto_374399 ) ) ( not ( = ?auto_374395 ?auto_374400 ) ) ( not ( = ?auto_374395 ?auto_374401 ) ) ( not ( = ?auto_374396 ?auto_374397 ) ) ( not ( = ?auto_374396 ?auto_374398 ) ) ( not ( = ?auto_374396 ?auto_374399 ) ) ( not ( = ?auto_374396 ?auto_374400 ) ) ( not ( = ?auto_374396 ?auto_374401 ) ) ( not ( = ?auto_374397 ?auto_374398 ) ) ( not ( = ?auto_374397 ?auto_374399 ) ) ( not ( = ?auto_374397 ?auto_374400 ) ) ( not ( = ?auto_374397 ?auto_374401 ) ) ( not ( = ?auto_374398 ?auto_374399 ) ) ( not ( = ?auto_374398 ?auto_374400 ) ) ( not ( = ?auto_374398 ?auto_374401 ) ) ( not ( = ?auto_374399 ?auto_374400 ) ) ( not ( = ?auto_374399 ?auto_374401 ) ) ( not ( = ?auto_374400 ?auto_374401 ) ) ( ON ?auto_374399 ?auto_374400 ) ( ON ?auto_374398 ?auto_374399 ) ( ON ?auto_374397 ?auto_374398 ) ( ON ?auto_374396 ?auto_374397 ) ( ON ?auto_374395 ?auto_374396 ) ( ON ?auto_374394 ?auto_374395 ) ( ON ?auto_374393 ?auto_374394 ) ( ON ?auto_374392 ?auto_374393 ) ( ON ?auto_374391 ?auto_374392 ) ( CLEAR ?auto_374389 ) ( ON ?auto_374390 ?auto_374391 ) ( CLEAR ?auto_374390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_374388 ?auto_374389 ?auto_374390 )
      ( MAKE-13PILE ?auto_374388 ?auto_374389 ?auto_374390 ?auto_374391 ?auto_374392 ?auto_374393 ?auto_374394 ?auto_374395 ?auto_374396 ?auto_374397 ?auto_374398 ?auto_374399 ?auto_374400 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374415 - BLOCK
      ?auto_374416 - BLOCK
      ?auto_374417 - BLOCK
      ?auto_374418 - BLOCK
      ?auto_374419 - BLOCK
      ?auto_374420 - BLOCK
      ?auto_374421 - BLOCK
      ?auto_374422 - BLOCK
      ?auto_374423 - BLOCK
      ?auto_374424 - BLOCK
      ?auto_374425 - BLOCK
      ?auto_374426 - BLOCK
      ?auto_374427 - BLOCK
    )
    :vars
    (
      ?auto_374428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374427 ?auto_374428 ) ( ON-TABLE ?auto_374415 ) ( not ( = ?auto_374415 ?auto_374416 ) ) ( not ( = ?auto_374415 ?auto_374417 ) ) ( not ( = ?auto_374415 ?auto_374418 ) ) ( not ( = ?auto_374415 ?auto_374419 ) ) ( not ( = ?auto_374415 ?auto_374420 ) ) ( not ( = ?auto_374415 ?auto_374421 ) ) ( not ( = ?auto_374415 ?auto_374422 ) ) ( not ( = ?auto_374415 ?auto_374423 ) ) ( not ( = ?auto_374415 ?auto_374424 ) ) ( not ( = ?auto_374415 ?auto_374425 ) ) ( not ( = ?auto_374415 ?auto_374426 ) ) ( not ( = ?auto_374415 ?auto_374427 ) ) ( not ( = ?auto_374415 ?auto_374428 ) ) ( not ( = ?auto_374416 ?auto_374417 ) ) ( not ( = ?auto_374416 ?auto_374418 ) ) ( not ( = ?auto_374416 ?auto_374419 ) ) ( not ( = ?auto_374416 ?auto_374420 ) ) ( not ( = ?auto_374416 ?auto_374421 ) ) ( not ( = ?auto_374416 ?auto_374422 ) ) ( not ( = ?auto_374416 ?auto_374423 ) ) ( not ( = ?auto_374416 ?auto_374424 ) ) ( not ( = ?auto_374416 ?auto_374425 ) ) ( not ( = ?auto_374416 ?auto_374426 ) ) ( not ( = ?auto_374416 ?auto_374427 ) ) ( not ( = ?auto_374416 ?auto_374428 ) ) ( not ( = ?auto_374417 ?auto_374418 ) ) ( not ( = ?auto_374417 ?auto_374419 ) ) ( not ( = ?auto_374417 ?auto_374420 ) ) ( not ( = ?auto_374417 ?auto_374421 ) ) ( not ( = ?auto_374417 ?auto_374422 ) ) ( not ( = ?auto_374417 ?auto_374423 ) ) ( not ( = ?auto_374417 ?auto_374424 ) ) ( not ( = ?auto_374417 ?auto_374425 ) ) ( not ( = ?auto_374417 ?auto_374426 ) ) ( not ( = ?auto_374417 ?auto_374427 ) ) ( not ( = ?auto_374417 ?auto_374428 ) ) ( not ( = ?auto_374418 ?auto_374419 ) ) ( not ( = ?auto_374418 ?auto_374420 ) ) ( not ( = ?auto_374418 ?auto_374421 ) ) ( not ( = ?auto_374418 ?auto_374422 ) ) ( not ( = ?auto_374418 ?auto_374423 ) ) ( not ( = ?auto_374418 ?auto_374424 ) ) ( not ( = ?auto_374418 ?auto_374425 ) ) ( not ( = ?auto_374418 ?auto_374426 ) ) ( not ( = ?auto_374418 ?auto_374427 ) ) ( not ( = ?auto_374418 ?auto_374428 ) ) ( not ( = ?auto_374419 ?auto_374420 ) ) ( not ( = ?auto_374419 ?auto_374421 ) ) ( not ( = ?auto_374419 ?auto_374422 ) ) ( not ( = ?auto_374419 ?auto_374423 ) ) ( not ( = ?auto_374419 ?auto_374424 ) ) ( not ( = ?auto_374419 ?auto_374425 ) ) ( not ( = ?auto_374419 ?auto_374426 ) ) ( not ( = ?auto_374419 ?auto_374427 ) ) ( not ( = ?auto_374419 ?auto_374428 ) ) ( not ( = ?auto_374420 ?auto_374421 ) ) ( not ( = ?auto_374420 ?auto_374422 ) ) ( not ( = ?auto_374420 ?auto_374423 ) ) ( not ( = ?auto_374420 ?auto_374424 ) ) ( not ( = ?auto_374420 ?auto_374425 ) ) ( not ( = ?auto_374420 ?auto_374426 ) ) ( not ( = ?auto_374420 ?auto_374427 ) ) ( not ( = ?auto_374420 ?auto_374428 ) ) ( not ( = ?auto_374421 ?auto_374422 ) ) ( not ( = ?auto_374421 ?auto_374423 ) ) ( not ( = ?auto_374421 ?auto_374424 ) ) ( not ( = ?auto_374421 ?auto_374425 ) ) ( not ( = ?auto_374421 ?auto_374426 ) ) ( not ( = ?auto_374421 ?auto_374427 ) ) ( not ( = ?auto_374421 ?auto_374428 ) ) ( not ( = ?auto_374422 ?auto_374423 ) ) ( not ( = ?auto_374422 ?auto_374424 ) ) ( not ( = ?auto_374422 ?auto_374425 ) ) ( not ( = ?auto_374422 ?auto_374426 ) ) ( not ( = ?auto_374422 ?auto_374427 ) ) ( not ( = ?auto_374422 ?auto_374428 ) ) ( not ( = ?auto_374423 ?auto_374424 ) ) ( not ( = ?auto_374423 ?auto_374425 ) ) ( not ( = ?auto_374423 ?auto_374426 ) ) ( not ( = ?auto_374423 ?auto_374427 ) ) ( not ( = ?auto_374423 ?auto_374428 ) ) ( not ( = ?auto_374424 ?auto_374425 ) ) ( not ( = ?auto_374424 ?auto_374426 ) ) ( not ( = ?auto_374424 ?auto_374427 ) ) ( not ( = ?auto_374424 ?auto_374428 ) ) ( not ( = ?auto_374425 ?auto_374426 ) ) ( not ( = ?auto_374425 ?auto_374427 ) ) ( not ( = ?auto_374425 ?auto_374428 ) ) ( not ( = ?auto_374426 ?auto_374427 ) ) ( not ( = ?auto_374426 ?auto_374428 ) ) ( not ( = ?auto_374427 ?auto_374428 ) ) ( ON ?auto_374426 ?auto_374427 ) ( ON ?auto_374425 ?auto_374426 ) ( ON ?auto_374424 ?auto_374425 ) ( ON ?auto_374423 ?auto_374424 ) ( ON ?auto_374422 ?auto_374423 ) ( ON ?auto_374421 ?auto_374422 ) ( ON ?auto_374420 ?auto_374421 ) ( ON ?auto_374419 ?auto_374420 ) ( ON ?auto_374418 ?auto_374419 ) ( ON ?auto_374417 ?auto_374418 ) ( CLEAR ?auto_374415 ) ( ON ?auto_374416 ?auto_374417 ) ( CLEAR ?auto_374416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_374415 ?auto_374416 )
      ( MAKE-13PILE ?auto_374415 ?auto_374416 ?auto_374417 ?auto_374418 ?auto_374419 ?auto_374420 ?auto_374421 ?auto_374422 ?auto_374423 ?auto_374424 ?auto_374425 ?auto_374426 ?auto_374427 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374442 - BLOCK
      ?auto_374443 - BLOCK
      ?auto_374444 - BLOCK
      ?auto_374445 - BLOCK
      ?auto_374446 - BLOCK
      ?auto_374447 - BLOCK
      ?auto_374448 - BLOCK
      ?auto_374449 - BLOCK
      ?auto_374450 - BLOCK
      ?auto_374451 - BLOCK
      ?auto_374452 - BLOCK
      ?auto_374453 - BLOCK
      ?auto_374454 - BLOCK
    )
    :vars
    (
      ?auto_374455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374454 ?auto_374455 ) ( ON-TABLE ?auto_374442 ) ( not ( = ?auto_374442 ?auto_374443 ) ) ( not ( = ?auto_374442 ?auto_374444 ) ) ( not ( = ?auto_374442 ?auto_374445 ) ) ( not ( = ?auto_374442 ?auto_374446 ) ) ( not ( = ?auto_374442 ?auto_374447 ) ) ( not ( = ?auto_374442 ?auto_374448 ) ) ( not ( = ?auto_374442 ?auto_374449 ) ) ( not ( = ?auto_374442 ?auto_374450 ) ) ( not ( = ?auto_374442 ?auto_374451 ) ) ( not ( = ?auto_374442 ?auto_374452 ) ) ( not ( = ?auto_374442 ?auto_374453 ) ) ( not ( = ?auto_374442 ?auto_374454 ) ) ( not ( = ?auto_374442 ?auto_374455 ) ) ( not ( = ?auto_374443 ?auto_374444 ) ) ( not ( = ?auto_374443 ?auto_374445 ) ) ( not ( = ?auto_374443 ?auto_374446 ) ) ( not ( = ?auto_374443 ?auto_374447 ) ) ( not ( = ?auto_374443 ?auto_374448 ) ) ( not ( = ?auto_374443 ?auto_374449 ) ) ( not ( = ?auto_374443 ?auto_374450 ) ) ( not ( = ?auto_374443 ?auto_374451 ) ) ( not ( = ?auto_374443 ?auto_374452 ) ) ( not ( = ?auto_374443 ?auto_374453 ) ) ( not ( = ?auto_374443 ?auto_374454 ) ) ( not ( = ?auto_374443 ?auto_374455 ) ) ( not ( = ?auto_374444 ?auto_374445 ) ) ( not ( = ?auto_374444 ?auto_374446 ) ) ( not ( = ?auto_374444 ?auto_374447 ) ) ( not ( = ?auto_374444 ?auto_374448 ) ) ( not ( = ?auto_374444 ?auto_374449 ) ) ( not ( = ?auto_374444 ?auto_374450 ) ) ( not ( = ?auto_374444 ?auto_374451 ) ) ( not ( = ?auto_374444 ?auto_374452 ) ) ( not ( = ?auto_374444 ?auto_374453 ) ) ( not ( = ?auto_374444 ?auto_374454 ) ) ( not ( = ?auto_374444 ?auto_374455 ) ) ( not ( = ?auto_374445 ?auto_374446 ) ) ( not ( = ?auto_374445 ?auto_374447 ) ) ( not ( = ?auto_374445 ?auto_374448 ) ) ( not ( = ?auto_374445 ?auto_374449 ) ) ( not ( = ?auto_374445 ?auto_374450 ) ) ( not ( = ?auto_374445 ?auto_374451 ) ) ( not ( = ?auto_374445 ?auto_374452 ) ) ( not ( = ?auto_374445 ?auto_374453 ) ) ( not ( = ?auto_374445 ?auto_374454 ) ) ( not ( = ?auto_374445 ?auto_374455 ) ) ( not ( = ?auto_374446 ?auto_374447 ) ) ( not ( = ?auto_374446 ?auto_374448 ) ) ( not ( = ?auto_374446 ?auto_374449 ) ) ( not ( = ?auto_374446 ?auto_374450 ) ) ( not ( = ?auto_374446 ?auto_374451 ) ) ( not ( = ?auto_374446 ?auto_374452 ) ) ( not ( = ?auto_374446 ?auto_374453 ) ) ( not ( = ?auto_374446 ?auto_374454 ) ) ( not ( = ?auto_374446 ?auto_374455 ) ) ( not ( = ?auto_374447 ?auto_374448 ) ) ( not ( = ?auto_374447 ?auto_374449 ) ) ( not ( = ?auto_374447 ?auto_374450 ) ) ( not ( = ?auto_374447 ?auto_374451 ) ) ( not ( = ?auto_374447 ?auto_374452 ) ) ( not ( = ?auto_374447 ?auto_374453 ) ) ( not ( = ?auto_374447 ?auto_374454 ) ) ( not ( = ?auto_374447 ?auto_374455 ) ) ( not ( = ?auto_374448 ?auto_374449 ) ) ( not ( = ?auto_374448 ?auto_374450 ) ) ( not ( = ?auto_374448 ?auto_374451 ) ) ( not ( = ?auto_374448 ?auto_374452 ) ) ( not ( = ?auto_374448 ?auto_374453 ) ) ( not ( = ?auto_374448 ?auto_374454 ) ) ( not ( = ?auto_374448 ?auto_374455 ) ) ( not ( = ?auto_374449 ?auto_374450 ) ) ( not ( = ?auto_374449 ?auto_374451 ) ) ( not ( = ?auto_374449 ?auto_374452 ) ) ( not ( = ?auto_374449 ?auto_374453 ) ) ( not ( = ?auto_374449 ?auto_374454 ) ) ( not ( = ?auto_374449 ?auto_374455 ) ) ( not ( = ?auto_374450 ?auto_374451 ) ) ( not ( = ?auto_374450 ?auto_374452 ) ) ( not ( = ?auto_374450 ?auto_374453 ) ) ( not ( = ?auto_374450 ?auto_374454 ) ) ( not ( = ?auto_374450 ?auto_374455 ) ) ( not ( = ?auto_374451 ?auto_374452 ) ) ( not ( = ?auto_374451 ?auto_374453 ) ) ( not ( = ?auto_374451 ?auto_374454 ) ) ( not ( = ?auto_374451 ?auto_374455 ) ) ( not ( = ?auto_374452 ?auto_374453 ) ) ( not ( = ?auto_374452 ?auto_374454 ) ) ( not ( = ?auto_374452 ?auto_374455 ) ) ( not ( = ?auto_374453 ?auto_374454 ) ) ( not ( = ?auto_374453 ?auto_374455 ) ) ( not ( = ?auto_374454 ?auto_374455 ) ) ( ON ?auto_374453 ?auto_374454 ) ( ON ?auto_374452 ?auto_374453 ) ( ON ?auto_374451 ?auto_374452 ) ( ON ?auto_374450 ?auto_374451 ) ( ON ?auto_374449 ?auto_374450 ) ( ON ?auto_374448 ?auto_374449 ) ( ON ?auto_374447 ?auto_374448 ) ( ON ?auto_374446 ?auto_374447 ) ( ON ?auto_374445 ?auto_374446 ) ( ON ?auto_374444 ?auto_374445 ) ( CLEAR ?auto_374442 ) ( ON ?auto_374443 ?auto_374444 ) ( CLEAR ?auto_374443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_374442 ?auto_374443 )
      ( MAKE-13PILE ?auto_374442 ?auto_374443 ?auto_374444 ?auto_374445 ?auto_374446 ?auto_374447 ?auto_374448 ?auto_374449 ?auto_374450 ?auto_374451 ?auto_374452 ?auto_374453 ?auto_374454 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374469 - BLOCK
      ?auto_374470 - BLOCK
      ?auto_374471 - BLOCK
      ?auto_374472 - BLOCK
      ?auto_374473 - BLOCK
      ?auto_374474 - BLOCK
      ?auto_374475 - BLOCK
      ?auto_374476 - BLOCK
      ?auto_374477 - BLOCK
      ?auto_374478 - BLOCK
      ?auto_374479 - BLOCK
      ?auto_374480 - BLOCK
      ?auto_374481 - BLOCK
    )
    :vars
    (
      ?auto_374482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374481 ?auto_374482 ) ( not ( = ?auto_374469 ?auto_374470 ) ) ( not ( = ?auto_374469 ?auto_374471 ) ) ( not ( = ?auto_374469 ?auto_374472 ) ) ( not ( = ?auto_374469 ?auto_374473 ) ) ( not ( = ?auto_374469 ?auto_374474 ) ) ( not ( = ?auto_374469 ?auto_374475 ) ) ( not ( = ?auto_374469 ?auto_374476 ) ) ( not ( = ?auto_374469 ?auto_374477 ) ) ( not ( = ?auto_374469 ?auto_374478 ) ) ( not ( = ?auto_374469 ?auto_374479 ) ) ( not ( = ?auto_374469 ?auto_374480 ) ) ( not ( = ?auto_374469 ?auto_374481 ) ) ( not ( = ?auto_374469 ?auto_374482 ) ) ( not ( = ?auto_374470 ?auto_374471 ) ) ( not ( = ?auto_374470 ?auto_374472 ) ) ( not ( = ?auto_374470 ?auto_374473 ) ) ( not ( = ?auto_374470 ?auto_374474 ) ) ( not ( = ?auto_374470 ?auto_374475 ) ) ( not ( = ?auto_374470 ?auto_374476 ) ) ( not ( = ?auto_374470 ?auto_374477 ) ) ( not ( = ?auto_374470 ?auto_374478 ) ) ( not ( = ?auto_374470 ?auto_374479 ) ) ( not ( = ?auto_374470 ?auto_374480 ) ) ( not ( = ?auto_374470 ?auto_374481 ) ) ( not ( = ?auto_374470 ?auto_374482 ) ) ( not ( = ?auto_374471 ?auto_374472 ) ) ( not ( = ?auto_374471 ?auto_374473 ) ) ( not ( = ?auto_374471 ?auto_374474 ) ) ( not ( = ?auto_374471 ?auto_374475 ) ) ( not ( = ?auto_374471 ?auto_374476 ) ) ( not ( = ?auto_374471 ?auto_374477 ) ) ( not ( = ?auto_374471 ?auto_374478 ) ) ( not ( = ?auto_374471 ?auto_374479 ) ) ( not ( = ?auto_374471 ?auto_374480 ) ) ( not ( = ?auto_374471 ?auto_374481 ) ) ( not ( = ?auto_374471 ?auto_374482 ) ) ( not ( = ?auto_374472 ?auto_374473 ) ) ( not ( = ?auto_374472 ?auto_374474 ) ) ( not ( = ?auto_374472 ?auto_374475 ) ) ( not ( = ?auto_374472 ?auto_374476 ) ) ( not ( = ?auto_374472 ?auto_374477 ) ) ( not ( = ?auto_374472 ?auto_374478 ) ) ( not ( = ?auto_374472 ?auto_374479 ) ) ( not ( = ?auto_374472 ?auto_374480 ) ) ( not ( = ?auto_374472 ?auto_374481 ) ) ( not ( = ?auto_374472 ?auto_374482 ) ) ( not ( = ?auto_374473 ?auto_374474 ) ) ( not ( = ?auto_374473 ?auto_374475 ) ) ( not ( = ?auto_374473 ?auto_374476 ) ) ( not ( = ?auto_374473 ?auto_374477 ) ) ( not ( = ?auto_374473 ?auto_374478 ) ) ( not ( = ?auto_374473 ?auto_374479 ) ) ( not ( = ?auto_374473 ?auto_374480 ) ) ( not ( = ?auto_374473 ?auto_374481 ) ) ( not ( = ?auto_374473 ?auto_374482 ) ) ( not ( = ?auto_374474 ?auto_374475 ) ) ( not ( = ?auto_374474 ?auto_374476 ) ) ( not ( = ?auto_374474 ?auto_374477 ) ) ( not ( = ?auto_374474 ?auto_374478 ) ) ( not ( = ?auto_374474 ?auto_374479 ) ) ( not ( = ?auto_374474 ?auto_374480 ) ) ( not ( = ?auto_374474 ?auto_374481 ) ) ( not ( = ?auto_374474 ?auto_374482 ) ) ( not ( = ?auto_374475 ?auto_374476 ) ) ( not ( = ?auto_374475 ?auto_374477 ) ) ( not ( = ?auto_374475 ?auto_374478 ) ) ( not ( = ?auto_374475 ?auto_374479 ) ) ( not ( = ?auto_374475 ?auto_374480 ) ) ( not ( = ?auto_374475 ?auto_374481 ) ) ( not ( = ?auto_374475 ?auto_374482 ) ) ( not ( = ?auto_374476 ?auto_374477 ) ) ( not ( = ?auto_374476 ?auto_374478 ) ) ( not ( = ?auto_374476 ?auto_374479 ) ) ( not ( = ?auto_374476 ?auto_374480 ) ) ( not ( = ?auto_374476 ?auto_374481 ) ) ( not ( = ?auto_374476 ?auto_374482 ) ) ( not ( = ?auto_374477 ?auto_374478 ) ) ( not ( = ?auto_374477 ?auto_374479 ) ) ( not ( = ?auto_374477 ?auto_374480 ) ) ( not ( = ?auto_374477 ?auto_374481 ) ) ( not ( = ?auto_374477 ?auto_374482 ) ) ( not ( = ?auto_374478 ?auto_374479 ) ) ( not ( = ?auto_374478 ?auto_374480 ) ) ( not ( = ?auto_374478 ?auto_374481 ) ) ( not ( = ?auto_374478 ?auto_374482 ) ) ( not ( = ?auto_374479 ?auto_374480 ) ) ( not ( = ?auto_374479 ?auto_374481 ) ) ( not ( = ?auto_374479 ?auto_374482 ) ) ( not ( = ?auto_374480 ?auto_374481 ) ) ( not ( = ?auto_374480 ?auto_374482 ) ) ( not ( = ?auto_374481 ?auto_374482 ) ) ( ON ?auto_374480 ?auto_374481 ) ( ON ?auto_374479 ?auto_374480 ) ( ON ?auto_374478 ?auto_374479 ) ( ON ?auto_374477 ?auto_374478 ) ( ON ?auto_374476 ?auto_374477 ) ( ON ?auto_374475 ?auto_374476 ) ( ON ?auto_374474 ?auto_374475 ) ( ON ?auto_374473 ?auto_374474 ) ( ON ?auto_374472 ?auto_374473 ) ( ON ?auto_374471 ?auto_374472 ) ( ON ?auto_374470 ?auto_374471 ) ( ON ?auto_374469 ?auto_374470 ) ( CLEAR ?auto_374469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_374469 )
      ( MAKE-13PILE ?auto_374469 ?auto_374470 ?auto_374471 ?auto_374472 ?auto_374473 ?auto_374474 ?auto_374475 ?auto_374476 ?auto_374477 ?auto_374478 ?auto_374479 ?auto_374480 ?auto_374481 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_374496 - BLOCK
      ?auto_374497 - BLOCK
      ?auto_374498 - BLOCK
      ?auto_374499 - BLOCK
      ?auto_374500 - BLOCK
      ?auto_374501 - BLOCK
      ?auto_374502 - BLOCK
      ?auto_374503 - BLOCK
      ?auto_374504 - BLOCK
      ?auto_374505 - BLOCK
      ?auto_374506 - BLOCK
      ?auto_374507 - BLOCK
      ?auto_374508 - BLOCK
    )
    :vars
    (
      ?auto_374509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374508 ?auto_374509 ) ( not ( = ?auto_374496 ?auto_374497 ) ) ( not ( = ?auto_374496 ?auto_374498 ) ) ( not ( = ?auto_374496 ?auto_374499 ) ) ( not ( = ?auto_374496 ?auto_374500 ) ) ( not ( = ?auto_374496 ?auto_374501 ) ) ( not ( = ?auto_374496 ?auto_374502 ) ) ( not ( = ?auto_374496 ?auto_374503 ) ) ( not ( = ?auto_374496 ?auto_374504 ) ) ( not ( = ?auto_374496 ?auto_374505 ) ) ( not ( = ?auto_374496 ?auto_374506 ) ) ( not ( = ?auto_374496 ?auto_374507 ) ) ( not ( = ?auto_374496 ?auto_374508 ) ) ( not ( = ?auto_374496 ?auto_374509 ) ) ( not ( = ?auto_374497 ?auto_374498 ) ) ( not ( = ?auto_374497 ?auto_374499 ) ) ( not ( = ?auto_374497 ?auto_374500 ) ) ( not ( = ?auto_374497 ?auto_374501 ) ) ( not ( = ?auto_374497 ?auto_374502 ) ) ( not ( = ?auto_374497 ?auto_374503 ) ) ( not ( = ?auto_374497 ?auto_374504 ) ) ( not ( = ?auto_374497 ?auto_374505 ) ) ( not ( = ?auto_374497 ?auto_374506 ) ) ( not ( = ?auto_374497 ?auto_374507 ) ) ( not ( = ?auto_374497 ?auto_374508 ) ) ( not ( = ?auto_374497 ?auto_374509 ) ) ( not ( = ?auto_374498 ?auto_374499 ) ) ( not ( = ?auto_374498 ?auto_374500 ) ) ( not ( = ?auto_374498 ?auto_374501 ) ) ( not ( = ?auto_374498 ?auto_374502 ) ) ( not ( = ?auto_374498 ?auto_374503 ) ) ( not ( = ?auto_374498 ?auto_374504 ) ) ( not ( = ?auto_374498 ?auto_374505 ) ) ( not ( = ?auto_374498 ?auto_374506 ) ) ( not ( = ?auto_374498 ?auto_374507 ) ) ( not ( = ?auto_374498 ?auto_374508 ) ) ( not ( = ?auto_374498 ?auto_374509 ) ) ( not ( = ?auto_374499 ?auto_374500 ) ) ( not ( = ?auto_374499 ?auto_374501 ) ) ( not ( = ?auto_374499 ?auto_374502 ) ) ( not ( = ?auto_374499 ?auto_374503 ) ) ( not ( = ?auto_374499 ?auto_374504 ) ) ( not ( = ?auto_374499 ?auto_374505 ) ) ( not ( = ?auto_374499 ?auto_374506 ) ) ( not ( = ?auto_374499 ?auto_374507 ) ) ( not ( = ?auto_374499 ?auto_374508 ) ) ( not ( = ?auto_374499 ?auto_374509 ) ) ( not ( = ?auto_374500 ?auto_374501 ) ) ( not ( = ?auto_374500 ?auto_374502 ) ) ( not ( = ?auto_374500 ?auto_374503 ) ) ( not ( = ?auto_374500 ?auto_374504 ) ) ( not ( = ?auto_374500 ?auto_374505 ) ) ( not ( = ?auto_374500 ?auto_374506 ) ) ( not ( = ?auto_374500 ?auto_374507 ) ) ( not ( = ?auto_374500 ?auto_374508 ) ) ( not ( = ?auto_374500 ?auto_374509 ) ) ( not ( = ?auto_374501 ?auto_374502 ) ) ( not ( = ?auto_374501 ?auto_374503 ) ) ( not ( = ?auto_374501 ?auto_374504 ) ) ( not ( = ?auto_374501 ?auto_374505 ) ) ( not ( = ?auto_374501 ?auto_374506 ) ) ( not ( = ?auto_374501 ?auto_374507 ) ) ( not ( = ?auto_374501 ?auto_374508 ) ) ( not ( = ?auto_374501 ?auto_374509 ) ) ( not ( = ?auto_374502 ?auto_374503 ) ) ( not ( = ?auto_374502 ?auto_374504 ) ) ( not ( = ?auto_374502 ?auto_374505 ) ) ( not ( = ?auto_374502 ?auto_374506 ) ) ( not ( = ?auto_374502 ?auto_374507 ) ) ( not ( = ?auto_374502 ?auto_374508 ) ) ( not ( = ?auto_374502 ?auto_374509 ) ) ( not ( = ?auto_374503 ?auto_374504 ) ) ( not ( = ?auto_374503 ?auto_374505 ) ) ( not ( = ?auto_374503 ?auto_374506 ) ) ( not ( = ?auto_374503 ?auto_374507 ) ) ( not ( = ?auto_374503 ?auto_374508 ) ) ( not ( = ?auto_374503 ?auto_374509 ) ) ( not ( = ?auto_374504 ?auto_374505 ) ) ( not ( = ?auto_374504 ?auto_374506 ) ) ( not ( = ?auto_374504 ?auto_374507 ) ) ( not ( = ?auto_374504 ?auto_374508 ) ) ( not ( = ?auto_374504 ?auto_374509 ) ) ( not ( = ?auto_374505 ?auto_374506 ) ) ( not ( = ?auto_374505 ?auto_374507 ) ) ( not ( = ?auto_374505 ?auto_374508 ) ) ( not ( = ?auto_374505 ?auto_374509 ) ) ( not ( = ?auto_374506 ?auto_374507 ) ) ( not ( = ?auto_374506 ?auto_374508 ) ) ( not ( = ?auto_374506 ?auto_374509 ) ) ( not ( = ?auto_374507 ?auto_374508 ) ) ( not ( = ?auto_374507 ?auto_374509 ) ) ( not ( = ?auto_374508 ?auto_374509 ) ) ( ON ?auto_374507 ?auto_374508 ) ( ON ?auto_374506 ?auto_374507 ) ( ON ?auto_374505 ?auto_374506 ) ( ON ?auto_374504 ?auto_374505 ) ( ON ?auto_374503 ?auto_374504 ) ( ON ?auto_374502 ?auto_374503 ) ( ON ?auto_374501 ?auto_374502 ) ( ON ?auto_374500 ?auto_374501 ) ( ON ?auto_374499 ?auto_374500 ) ( ON ?auto_374498 ?auto_374499 ) ( ON ?auto_374497 ?auto_374498 ) ( ON ?auto_374496 ?auto_374497 ) ( CLEAR ?auto_374496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_374496 )
      ( MAKE-13PILE ?auto_374496 ?auto_374497 ?auto_374498 ?auto_374499 ?auto_374500 ?auto_374501 ?auto_374502 ?auto_374503 ?auto_374504 ?auto_374505 ?auto_374506 ?auto_374507 ?auto_374508 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374524 - BLOCK
      ?auto_374525 - BLOCK
      ?auto_374526 - BLOCK
      ?auto_374527 - BLOCK
      ?auto_374528 - BLOCK
      ?auto_374529 - BLOCK
      ?auto_374530 - BLOCK
      ?auto_374531 - BLOCK
      ?auto_374532 - BLOCK
      ?auto_374533 - BLOCK
      ?auto_374534 - BLOCK
      ?auto_374535 - BLOCK
      ?auto_374536 - BLOCK
      ?auto_374537 - BLOCK
    )
    :vars
    (
      ?auto_374538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_374536 ) ( ON ?auto_374537 ?auto_374538 ) ( CLEAR ?auto_374537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_374524 ) ( ON ?auto_374525 ?auto_374524 ) ( ON ?auto_374526 ?auto_374525 ) ( ON ?auto_374527 ?auto_374526 ) ( ON ?auto_374528 ?auto_374527 ) ( ON ?auto_374529 ?auto_374528 ) ( ON ?auto_374530 ?auto_374529 ) ( ON ?auto_374531 ?auto_374530 ) ( ON ?auto_374532 ?auto_374531 ) ( ON ?auto_374533 ?auto_374532 ) ( ON ?auto_374534 ?auto_374533 ) ( ON ?auto_374535 ?auto_374534 ) ( ON ?auto_374536 ?auto_374535 ) ( not ( = ?auto_374524 ?auto_374525 ) ) ( not ( = ?auto_374524 ?auto_374526 ) ) ( not ( = ?auto_374524 ?auto_374527 ) ) ( not ( = ?auto_374524 ?auto_374528 ) ) ( not ( = ?auto_374524 ?auto_374529 ) ) ( not ( = ?auto_374524 ?auto_374530 ) ) ( not ( = ?auto_374524 ?auto_374531 ) ) ( not ( = ?auto_374524 ?auto_374532 ) ) ( not ( = ?auto_374524 ?auto_374533 ) ) ( not ( = ?auto_374524 ?auto_374534 ) ) ( not ( = ?auto_374524 ?auto_374535 ) ) ( not ( = ?auto_374524 ?auto_374536 ) ) ( not ( = ?auto_374524 ?auto_374537 ) ) ( not ( = ?auto_374524 ?auto_374538 ) ) ( not ( = ?auto_374525 ?auto_374526 ) ) ( not ( = ?auto_374525 ?auto_374527 ) ) ( not ( = ?auto_374525 ?auto_374528 ) ) ( not ( = ?auto_374525 ?auto_374529 ) ) ( not ( = ?auto_374525 ?auto_374530 ) ) ( not ( = ?auto_374525 ?auto_374531 ) ) ( not ( = ?auto_374525 ?auto_374532 ) ) ( not ( = ?auto_374525 ?auto_374533 ) ) ( not ( = ?auto_374525 ?auto_374534 ) ) ( not ( = ?auto_374525 ?auto_374535 ) ) ( not ( = ?auto_374525 ?auto_374536 ) ) ( not ( = ?auto_374525 ?auto_374537 ) ) ( not ( = ?auto_374525 ?auto_374538 ) ) ( not ( = ?auto_374526 ?auto_374527 ) ) ( not ( = ?auto_374526 ?auto_374528 ) ) ( not ( = ?auto_374526 ?auto_374529 ) ) ( not ( = ?auto_374526 ?auto_374530 ) ) ( not ( = ?auto_374526 ?auto_374531 ) ) ( not ( = ?auto_374526 ?auto_374532 ) ) ( not ( = ?auto_374526 ?auto_374533 ) ) ( not ( = ?auto_374526 ?auto_374534 ) ) ( not ( = ?auto_374526 ?auto_374535 ) ) ( not ( = ?auto_374526 ?auto_374536 ) ) ( not ( = ?auto_374526 ?auto_374537 ) ) ( not ( = ?auto_374526 ?auto_374538 ) ) ( not ( = ?auto_374527 ?auto_374528 ) ) ( not ( = ?auto_374527 ?auto_374529 ) ) ( not ( = ?auto_374527 ?auto_374530 ) ) ( not ( = ?auto_374527 ?auto_374531 ) ) ( not ( = ?auto_374527 ?auto_374532 ) ) ( not ( = ?auto_374527 ?auto_374533 ) ) ( not ( = ?auto_374527 ?auto_374534 ) ) ( not ( = ?auto_374527 ?auto_374535 ) ) ( not ( = ?auto_374527 ?auto_374536 ) ) ( not ( = ?auto_374527 ?auto_374537 ) ) ( not ( = ?auto_374527 ?auto_374538 ) ) ( not ( = ?auto_374528 ?auto_374529 ) ) ( not ( = ?auto_374528 ?auto_374530 ) ) ( not ( = ?auto_374528 ?auto_374531 ) ) ( not ( = ?auto_374528 ?auto_374532 ) ) ( not ( = ?auto_374528 ?auto_374533 ) ) ( not ( = ?auto_374528 ?auto_374534 ) ) ( not ( = ?auto_374528 ?auto_374535 ) ) ( not ( = ?auto_374528 ?auto_374536 ) ) ( not ( = ?auto_374528 ?auto_374537 ) ) ( not ( = ?auto_374528 ?auto_374538 ) ) ( not ( = ?auto_374529 ?auto_374530 ) ) ( not ( = ?auto_374529 ?auto_374531 ) ) ( not ( = ?auto_374529 ?auto_374532 ) ) ( not ( = ?auto_374529 ?auto_374533 ) ) ( not ( = ?auto_374529 ?auto_374534 ) ) ( not ( = ?auto_374529 ?auto_374535 ) ) ( not ( = ?auto_374529 ?auto_374536 ) ) ( not ( = ?auto_374529 ?auto_374537 ) ) ( not ( = ?auto_374529 ?auto_374538 ) ) ( not ( = ?auto_374530 ?auto_374531 ) ) ( not ( = ?auto_374530 ?auto_374532 ) ) ( not ( = ?auto_374530 ?auto_374533 ) ) ( not ( = ?auto_374530 ?auto_374534 ) ) ( not ( = ?auto_374530 ?auto_374535 ) ) ( not ( = ?auto_374530 ?auto_374536 ) ) ( not ( = ?auto_374530 ?auto_374537 ) ) ( not ( = ?auto_374530 ?auto_374538 ) ) ( not ( = ?auto_374531 ?auto_374532 ) ) ( not ( = ?auto_374531 ?auto_374533 ) ) ( not ( = ?auto_374531 ?auto_374534 ) ) ( not ( = ?auto_374531 ?auto_374535 ) ) ( not ( = ?auto_374531 ?auto_374536 ) ) ( not ( = ?auto_374531 ?auto_374537 ) ) ( not ( = ?auto_374531 ?auto_374538 ) ) ( not ( = ?auto_374532 ?auto_374533 ) ) ( not ( = ?auto_374532 ?auto_374534 ) ) ( not ( = ?auto_374532 ?auto_374535 ) ) ( not ( = ?auto_374532 ?auto_374536 ) ) ( not ( = ?auto_374532 ?auto_374537 ) ) ( not ( = ?auto_374532 ?auto_374538 ) ) ( not ( = ?auto_374533 ?auto_374534 ) ) ( not ( = ?auto_374533 ?auto_374535 ) ) ( not ( = ?auto_374533 ?auto_374536 ) ) ( not ( = ?auto_374533 ?auto_374537 ) ) ( not ( = ?auto_374533 ?auto_374538 ) ) ( not ( = ?auto_374534 ?auto_374535 ) ) ( not ( = ?auto_374534 ?auto_374536 ) ) ( not ( = ?auto_374534 ?auto_374537 ) ) ( not ( = ?auto_374534 ?auto_374538 ) ) ( not ( = ?auto_374535 ?auto_374536 ) ) ( not ( = ?auto_374535 ?auto_374537 ) ) ( not ( = ?auto_374535 ?auto_374538 ) ) ( not ( = ?auto_374536 ?auto_374537 ) ) ( not ( = ?auto_374536 ?auto_374538 ) ) ( not ( = ?auto_374537 ?auto_374538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_374537 ?auto_374538 )
      ( !STACK ?auto_374537 ?auto_374536 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374553 - BLOCK
      ?auto_374554 - BLOCK
      ?auto_374555 - BLOCK
      ?auto_374556 - BLOCK
      ?auto_374557 - BLOCK
      ?auto_374558 - BLOCK
      ?auto_374559 - BLOCK
      ?auto_374560 - BLOCK
      ?auto_374561 - BLOCK
      ?auto_374562 - BLOCK
      ?auto_374563 - BLOCK
      ?auto_374564 - BLOCK
      ?auto_374565 - BLOCK
      ?auto_374566 - BLOCK
    )
    :vars
    (
      ?auto_374567 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_374565 ) ( ON ?auto_374566 ?auto_374567 ) ( CLEAR ?auto_374566 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_374553 ) ( ON ?auto_374554 ?auto_374553 ) ( ON ?auto_374555 ?auto_374554 ) ( ON ?auto_374556 ?auto_374555 ) ( ON ?auto_374557 ?auto_374556 ) ( ON ?auto_374558 ?auto_374557 ) ( ON ?auto_374559 ?auto_374558 ) ( ON ?auto_374560 ?auto_374559 ) ( ON ?auto_374561 ?auto_374560 ) ( ON ?auto_374562 ?auto_374561 ) ( ON ?auto_374563 ?auto_374562 ) ( ON ?auto_374564 ?auto_374563 ) ( ON ?auto_374565 ?auto_374564 ) ( not ( = ?auto_374553 ?auto_374554 ) ) ( not ( = ?auto_374553 ?auto_374555 ) ) ( not ( = ?auto_374553 ?auto_374556 ) ) ( not ( = ?auto_374553 ?auto_374557 ) ) ( not ( = ?auto_374553 ?auto_374558 ) ) ( not ( = ?auto_374553 ?auto_374559 ) ) ( not ( = ?auto_374553 ?auto_374560 ) ) ( not ( = ?auto_374553 ?auto_374561 ) ) ( not ( = ?auto_374553 ?auto_374562 ) ) ( not ( = ?auto_374553 ?auto_374563 ) ) ( not ( = ?auto_374553 ?auto_374564 ) ) ( not ( = ?auto_374553 ?auto_374565 ) ) ( not ( = ?auto_374553 ?auto_374566 ) ) ( not ( = ?auto_374553 ?auto_374567 ) ) ( not ( = ?auto_374554 ?auto_374555 ) ) ( not ( = ?auto_374554 ?auto_374556 ) ) ( not ( = ?auto_374554 ?auto_374557 ) ) ( not ( = ?auto_374554 ?auto_374558 ) ) ( not ( = ?auto_374554 ?auto_374559 ) ) ( not ( = ?auto_374554 ?auto_374560 ) ) ( not ( = ?auto_374554 ?auto_374561 ) ) ( not ( = ?auto_374554 ?auto_374562 ) ) ( not ( = ?auto_374554 ?auto_374563 ) ) ( not ( = ?auto_374554 ?auto_374564 ) ) ( not ( = ?auto_374554 ?auto_374565 ) ) ( not ( = ?auto_374554 ?auto_374566 ) ) ( not ( = ?auto_374554 ?auto_374567 ) ) ( not ( = ?auto_374555 ?auto_374556 ) ) ( not ( = ?auto_374555 ?auto_374557 ) ) ( not ( = ?auto_374555 ?auto_374558 ) ) ( not ( = ?auto_374555 ?auto_374559 ) ) ( not ( = ?auto_374555 ?auto_374560 ) ) ( not ( = ?auto_374555 ?auto_374561 ) ) ( not ( = ?auto_374555 ?auto_374562 ) ) ( not ( = ?auto_374555 ?auto_374563 ) ) ( not ( = ?auto_374555 ?auto_374564 ) ) ( not ( = ?auto_374555 ?auto_374565 ) ) ( not ( = ?auto_374555 ?auto_374566 ) ) ( not ( = ?auto_374555 ?auto_374567 ) ) ( not ( = ?auto_374556 ?auto_374557 ) ) ( not ( = ?auto_374556 ?auto_374558 ) ) ( not ( = ?auto_374556 ?auto_374559 ) ) ( not ( = ?auto_374556 ?auto_374560 ) ) ( not ( = ?auto_374556 ?auto_374561 ) ) ( not ( = ?auto_374556 ?auto_374562 ) ) ( not ( = ?auto_374556 ?auto_374563 ) ) ( not ( = ?auto_374556 ?auto_374564 ) ) ( not ( = ?auto_374556 ?auto_374565 ) ) ( not ( = ?auto_374556 ?auto_374566 ) ) ( not ( = ?auto_374556 ?auto_374567 ) ) ( not ( = ?auto_374557 ?auto_374558 ) ) ( not ( = ?auto_374557 ?auto_374559 ) ) ( not ( = ?auto_374557 ?auto_374560 ) ) ( not ( = ?auto_374557 ?auto_374561 ) ) ( not ( = ?auto_374557 ?auto_374562 ) ) ( not ( = ?auto_374557 ?auto_374563 ) ) ( not ( = ?auto_374557 ?auto_374564 ) ) ( not ( = ?auto_374557 ?auto_374565 ) ) ( not ( = ?auto_374557 ?auto_374566 ) ) ( not ( = ?auto_374557 ?auto_374567 ) ) ( not ( = ?auto_374558 ?auto_374559 ) ) ( not ( = ?auto_374558 ?auto_374560 ) ) ( not ( = ?auto_374558 ?auto_374561 ) ) ( not ( = ?auto_374558 ?auto_374562 ) ) ( not ( = ?auto_374558 ?auto_374563 ) ) ( not ( = ?auto_374558 ?auto_374564 ) ) ( not ( = ?auto_374558 ?auto_374565 ) ) ( not ( = ?auto_374558 ?auto_374566 ) ) ( not ( = ?auto_374558 ?auto_374567 ) ) ( not ( = ?auto_374559 ?auto_374560 ) ) ( not ( = ?auto_374559 ?auto_374561 ) ) ( not ( = ?auto_374559 ?auto_374562 ) ) ( not ( = ?auto_374559 ?auto_374563 ) ) ( not ( = ?auto_374559 ?auto_374564 ) ) ( not ( = ?auto_374559 ?auto_374565 ) ) ( not ( = ?auto_374559 ?auto_374566 ) ) ( not ( = ?auto_374559 ?auto_374567 ) ) ( not ( = ?auto_374560 ?auto_374561 ) ) ( not ( = ?auto_374560 ?auto_374562 ) ) ( not ( = ?auto_374560 ?auto_374563 ) ) ( not ( = ?auto_374560 ?auto_374564 ) ) ( not ( = ?auto_374560 ?auto_374565 ) ) ( not ( = ?auto_374560 ?auto_374566 ) ) ( not ( = ?auto_374560 ?auto_374567 ) ) ( not ( = ?auto_374561 ?auto_374562 ) ) ( not ( = ?auto_374561 ?auto_374563 ) ) ( not ( = ?auto_374561 ?auto_374564 ) ) ( not ( = ?auto_374561 ?auto_374565 ) ) ( not ( = ?auto_374561 ?auto_374566 ) ) ( not ( = ?auto_374561 ?auto_374567 ) ) ( not ( = ?auto_374562 ?auto_374563 ) ) ( not ( = ?auto_374562 ?auto_374564 ) ) ( not ( = ?auto_374562 ?auto_374565 ) ) ( not ( = ?auto_374562 ?auto_374566 ) ) ( not ( = ?auto_374562 ?auto_374567 ) ) ( not ( = ?auto_374563 ?auto_374564 ) ) ( not ( = ?auto_374563 ?auto_374565 ) ) ( not ( = ?auto_374563 ?auto_374566 ) ) ( not ( = ?auto_374563 ?auto_374567 ) ) ( not ( = ?auto_374564 ?auto_374565 ) ) ( not ( = ?auto_374564 ?auto_374566 ) ) ( not ( = ?auto_374564 ?auto_374567 ) ) ( not ( = ?auto_374565 ?auto_374566 ) ) ( not ( = ?auto_374565 ?auto_374567 ) ) ( not ( = ?auto_374566 ?auto_374567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_374566 ?auto_374567 )
      ( !STACK ?auto_374566 ?auto_374565 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374582 - BLOCK
      ?auto_374583 - BLOCK
      ?auto_374584 - BLOCK
      ?auto_374585 - BLOCK
      ?auto_374586 - BLOCK
      ?auto_374587 - BLOCK
      ?auto_374588 - BLOCK
      ?auto_374589 - BLOCK
      ?auto_374590 - BLOCK
      ?auto_374591 - BLOCK
      ?auto_374592 - BLOCK
      ?auto_374593 - BLOCK
      ?auto_374594 - BLOCK
      ?auto_374595 - BLOCK
    )
    :vars
    (
      ?auto_374596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374595 ?auto_374596 ) ( ON-TABLE ?auto_374582 ) ( ON ?auto_374583 ?auto_374582 ) ( ON ?auto_374584 ?auto_374583 ) ( ON ?auto_374585 ?auto_374584 ) ( ON ?auto_374586 ?auto_374585 ) ( ON ?auto_374587 ?auto_374586 ) ( ON ?auto_374588 ?auto_374587 ) ( ON ?auto_374589 ?auto_374588 ) ( ON ?auto_374590 ?auto_374589 ) ( ON ?auto_374591 ?auto_374590 ) ( ON ?auto_374592 ?auto_374591 ) ( ON ?auto_374593 ?auto_374592 ) ( not ( = ?auto_374582 ?auto_374583 ) ) ( not ( = ?auto_374582 ?auto_374584 ) ) ( not ( = ?auto_374582 ?auto_374585 ) ) ( not ( = ?auto_374582 ?auto_374586 ) ) ( not ( = ?auto_374582 ?auto_374587 ) ) ( not ( = ?auto_374582 ?auto_374588 ) ) ( not ( = ?auto_374582 ?auto_374589 ) ) ( not ( = ?auto_374582 ?auto_374590 ) ) ( not ( = ?auto_374582 ?auto_374591 ) ) ( not ( = ?auto_374582 ?auto_374592 ) ) ( not ( = ?auto_374582 ?auto_374593 ) ) ( not ( = ?auto_374582 ?auto_374594 ) ) ( not ( = ?auto_374582 ?auto_374595 ) ) ( not ( = ?auto_374582 ?auto_374596 ) ) ( not ( = ?auto_374583 ?auto_374584 ) ) ( not ( = ?auto_374583 ?auto_374585 ) ) ( not ( = ?auto_374583 ?auto_374586 ) ) ( not ( = ?auto_374583 ?auto_374587 ) ) ( not ( = ?auto_374583 ?auto_374588 ) ) ( not ( = ?auto_374583 ?auto_374589 ) ) ( not ( = ?auto_374583 ?auto_374590 ) ) ( not ( = ?auto_374583 ?auto_374591 ) ) ( not ( = ?auto_374583 ?auto_374592 ) ) ( not ( = ?auto_374583 ?auto_374593 ) ) ( not ( = ?auto_374583 ?auto_374594 ) ) ( not ( = ?auto_374583 ?auto_374595 ) ) ( not ( = ?auto_374583 ?auto_374596 ) ) ( not ( = ?auto_374584 ?auto_374585 ) ) ( not ( = ?auto_374584 ?auto_374586 ) ) ( not ( = ?auto_374584 ?auto_374587 ) ) ( not ( = ?auto_374584 ?auto_374588 ) ) ( not ( = ?auto_374584 ?auto_374589 ) ) ( not ( = ?auto_374584 ?auto_374590 ) ) ( not ( = ?auto_374584 ?auto_374591 ) ) ( not ( = ?auto_374584 ?auto_374592 ) ) ( not ( = ?auto_374584 ?auto_374593 ) ) ( not ( = ?auto_374584 ?auto_374594 ) ) ( not ( = ?auto_374584 ?auto_374595 ) ) ( not ( = ?auto_374584 ?auto_374596 ) ) ( not ( = ?auto_374585 ?auto_374586 ) ) ( not ( = ?auto_374585 ?auto_374587 ) ) ( not ( = ?auto_374585 ?auto_374588 ) ) ( not ( = ?auto_374585 ?auto_374589 ) ) ( not ( = ?auto_374585 ?auto_374590 ) ) ( not ( = ?auto_374585 ?auto_374591 ) ) ( not ( = ?auto_374585 ?auto_374592 ) ) ( not ( = ?auto_374585 ?auto_374593 ) ) ( not ( = ?auto_374585 ?auto_374594 ) ) ( not ( = ?auto_374585 ?auto_374595 ) ) ( not ( = ?auto_374585 ?auto_374596 ) ) ( not ( = ?auto_374586 ?auto_374587 ) ) ( not ( = ?auto_374586 ?auto_374588 ) ) ( not ( = ?auto_374586 ?auto_374589 ) ) ( not ( = ?auto_374586 ?auto_374590 ) ) ( not ( = ?auto_374586 ?auto_374591 ) ) ( not ( = ?auto_374586 ?auto_374592 ) ) ( not ( = ?auto_374586 ?auto_374593 ) ) ( not ( = ?auto_374586 ?auto_374594 ) ) ( not ( = ?auto_374586 ?auto_374595 ) ) ( not ( = ?auto_374586 ?auto_374596 ) ) ( not ( = ?auto_374587 ?auto_374588 ) ) ( not ( = ?auto_374587 ?auto_374589 ) ) ( not ( = ?auto_374587 ?auto_374590 ) ) ( not ( = ?auto_374587 ?auto_374591 ) ) ( not ( = ?auto_374587 ?auto_374592 ) ) ( not ( = ?auto_374587 ?auto_374593 ) ) ( not ( = ?auto_374587 ?auto_374594 ) ) ( not ( = ?auto_374587 ?auto_374595 ) ) ( not ( = ?auto_374587 ?auto_374596 ) ) ( not ( = ?auto_374588 ?auto_374589 ) ) ( not ( = ?auto_374588 ?auto_374590 ) ) ( not ( = ?auto_374588 ?auto_374591 ) ) ( not ( = ?auto_374588 ?auto_374592 ) ) ( not ( = ?auto_374588 ?auto_374593 ) ) ( not ( = ?auto_374588 ?auto_374594 ) ) ( not ( = ?auto_374588 ?auto_374595 ) ) ( not ( = ?auto_374588 ?auto_374596 ) ) ( not ( = ?auto_374589 ?auto_374590 ) ) ( not ( = ?auto_374589 ?auto_374591 ) ) ( not ( = ?auto_374589 ?auto_374592 ) ) ( not ( = ?auto_374589 ?auto_374593 ) ) ( not ( = ?auto_374589 ?auto_374594 ) ) ( not ( = ?auto_374589 ?auto_374595 ) ) ( not ( = ?auto_374589 ?auto_374596 ) ) ( not ( = ?auto_374590 ?auto_374591 ) ) ( not ( = ?auto_374590 ?auto_374592 ) ) ( not ( = ?auto_374590 ?auto_374593 ) ) ( not ( = ?auto_374590 ?auto_374594 ) ) ( not ( = ?auto_374590 ?auto_374595 ) ) ( not ( = ?auto_374590 ?auto_374596 ) ) ( not ( = ?auto_374591 ?auto_374592 ) ) ( not ( = ?auto_374591 ?auto_374593 ) ) ( not ( = ?auto_374591 ?auto_374594 ) ) ( not ( = ?auto_374591 ?auto_374595 ) ) ( not ( = ?auto_374591 ?auto_374596 ) ) ( not ( = ?auto_374592 ?auto_374593 ) ) ( not ( = ?auto_374592 ?auto_374594 ) ) ( not ( = ?auto_374592 ?auto_374595 ) ) ( not ( = ?auto_374592 ?auto_374596 ) ) ( not ( = ?auto_374593 ?auto_374594 ) ) ( not ( = ?auto_374593 ?auto_374595 ) ) ( not ( = ?auto_374593 ?auto_374596 ) ) ( not ( = ?auto_374594 ?auto_374595 ) ) ( not ( = ?auto_374594 ?auto_374596 ) ) ( not ( = ?auto_374595 ?auto_374596 ) ) ( CLEAR ?auto_374593 ) ( ON ?auto_374594 ?auto_374595 ) ( CLEAR ?auto_374594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_374582 ?auto_374583 ?auto_374584 ?auto_374585 ?auto_374586 ?auto_374587 ?auto_374588 ?auto_374589 ?auto_374590 ?auto_374591 ?auto_374592 ?auto_374593 ?auto_374594 )
      ( MAKE-14PILE ?auto_374582 ?auto_374583 ?auto_374584 ?auto_374585 ?auto_374586 ?auto_374587 ?auto_374588 ?auto_374589 ?auto_374590 ?auto_374591 ?auto_374592 ?auto_374593 ?auto_374594 ?auto_374595 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374611 - BLOCK
      ?auto_374612 - BLOCK
      ?auto_374613 - BLOCK
      ?auto_374614 - BLOCK
      ?auto_374615 - BLOCK
      ?auto_374616 - BLOCK
      ?auto_374617 - BLOCK
      ?auto_374618 - BLOCK
      ?auto_374619 - BLOCK
      ?auto_374620 - BLOCK
      ?auto_374621 - BLOCK
      ?auto_374622 - BLOCK
      ?auto_374623 - BLOCK
      ?auto_374624 - BLOCK
    )
    :vars
    (
      ?auto_374625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374624 ?auto_374625 ) ( ON-TABLE ?auto_374611 ) ( ON ?auto_374612 ?auto_374611 ) ( ON ?auto_374613 ?auto_374612 ) ( ON ?auto_374614 ?auto_374613 ) ( ON ?auto_374615 ?auto_374614 ) ( ON ?auto_374616 ?auto_374615 ) ( ON ?auto_374617 ?auto_374616 ) ( ON ?auto_374618 ?auto_374617 ) ( ON ?auto_374619 ?auto_374618 ) ( ON ?auto_374620 ?auto_374619 ) ( ON ?auto_374621 ?auto_374620 ) ( ON ?auto_374622 ?auto_374621 ) ( not ( = ?auto_374611 ?auto_374612 ) ) ( not ( = ?auto_374611 ?auto_374613 ) ) ( not ( = ?auto_374611 ?auto_374614 ) ) ( not ( = ?auto_374611 ?auto_374615 ) ) ( not ( = ?auto_374611 ?auto_374616 ) ) ( not ( = ?auto_374611 ?auto_374617 ) ) ( not ( = ?auto_374611 ?auto_374618 ) ) ( not ( = ?auto_374611 ?auto_374619 ) ) ( not ( = ?auto_374611 ?auto_374620 ) ) ( not ( = ?auto_374611 ?auto_374621 ) ) ( not ( = ?auto_374611 ?auto_374622 ) ) ( not ( = ?auto_374611 ?auto_374623 ) ) ( not ( = ?auto_374611 ?auto_374624 ) ) ( not ( = ?auto_374611 ?auto_374625 ) ) ( not ( = ?auto_374612 ?auto_374613 ) ) ( not ( = ?auto_374612 ?auto_374614 ) ) ( not ( = ?auto_374612 ?auto_374615 ) ) ( not ( = ?auto_374612 ?auto_374616 ) ) ( not ( = ?auto_374612 ?auto_374617 ) ) ( not ( = ?auto_374612 ?auto_374618 ) ) ( not ( = ?auto_374612 ?auto_374619 ) ) ( not ( = ?auto_374612 ?auto_374620 ) ) ( not ( = ?auto_374612 ?auto_374621 ) ) ( not ( = ?auto_374612 ?auto_374622 ) ) ( not ( = ?auto_374612 ?auto_374623 ) ) ( not ( = ?auto_374612 ?auto_374624 ) ) ( not ( = ?auto_374612 ?auto_374625 ) ) ( not ( = ?auto_374613 ?auto_374614 ) ) ( not ( = ?auto_374613 ?auto_374615 ) ) ( not ( = ?auto_374613 ?auto_374616 ) ) ( not ( = ?auto_374613 ?auto_374617 ) ) ( not ( = ?auto_374613 ?auto_374618 ) ) ( not ( = ?auto_374613 ?auto_374619 ) ) ( not ( = ?auto_374613 ?auto_374620 ) ) ( not ( = ?auto_374613 ?auto_374621 ) ) ( not ( = ?auto_374613 ?auto_374622 ) ) ( not ( = ?auto_374613 ?auto_374623 ) ) ( not ( = ?auto_374613 ?auto_374624 ) ) ( not ( = ?auto_374613 ?auto_374625 ) ) ( not ( = ?auto_374614 ?auto_374615 ) ) ( not ( = ?auto_374614 ?auto_374616 ) ) ( not ( = ?auto_374614 ?auto_374617 ) ) ( not ( = ?auto_374614 ?auto_374618 ) ) ( not ( = ?auto_374614 ?auto_374619 ) ) ( not ( = ?auto_374614 ?auto_374620 ) ) ( not ( = ?auto_374614 ?auto_374621 ) ) ( not ( = ?auto_374614 ?auto_374622 ) ) ( not ( = ?auto_374614 ?auto_374623 ) ) ( not ( = ?auto_374614 ?auto_374624 ) ) ( not ( = ?auto_374614 ?auto_374625 ) ) ( not ( = ?auto_374615 ?auto_374616 ) ) ( not ( = ?auto_374615 ?auto_374617 ) ) ( not ( = ?auto_374615 ?auto_374618 ) ) ( not ( = ?auto_374615 ?auto_374619 ) ) ( not ( = ?auto_374615 ?auto_374620 ) ) ( not ( = ?auto_374615 ?auto_374621 ) ) ( not ( = ?auto_374615 ?auto_374622 ) ) ( not ( = ?auto_374615 ?auto_374623 ) ) ( not ( = ?auto_374615 ?auto_374624 ) ) ( not ( = ?auto_374615 ?auto_374625 ) ) ( not ( = ?auto_374616 ?auto_374617 ) ) ( not ( = ?auto_374616 ?auto_374618 ) ) ( not ( = ?auto_374616 ?auto_374619 ) ) ( not ( = ?auto_374616 ?auto_374620 ) ) ( not ( = ?auto_374616 ?auto_374621 ) ) ( not ( = ?auto_374616 ?auto_374622 ) ) ( not ( = ?auto_374616 ?auto_374623 ) ) ( not ( = ?auto_374616 ?auto_374624 ) ) ( not ( = ?auto_374616 ?auto_374625 ) ) ( not ( = ?auto_374617 ?auto_374618 ) ) ( not ( = ?auto_374617 ?auto_374619 ) ) ( not ( = ?auto_374617 ?auto_374620 ) ) ( not ( = ?auto_374617 ?auto_374621 ) ) ( not ( = ?auto_374617 ?auto_374622 ) ) ( not ( = ?auto_374617 ?auto_374623 ) ) ( not ( = ?auto_374617 ?auto_374624 ) ) ( not ( = ?auto_374617 ?auto_374625 ) ) ( not ( = ?auto_374618 ?auto_374619 ) ) ( not ( = ?auto_374618 ?auto_374620 ) ) ( not ( = ?auto_374618 ?auto_374621 ) ) ( not ( = ?auto_374618 ?auto_374622 ) ) ( not ( = ?auto_374618 ?auto_374623 ) ) ( not ( = ?auto_374618 ?auto_374624 ) ) ( not ( = ?auto_374618 ?auto_374625 ) ) ( not ( = ?auto_374619 ?auto_374620 ) ) ( not ( = ?auto_374619 ?auto_374621 ) ) ( not ( = ?auto_374619 ?auto_374622 ) ) ( not ( = ?auto_374619 ?auto_374623 ) ) ( not ( = ?auto_374619 ?auto_374624 ) ) ( not ( = ?auto_374619 ?auto_374625 ) ) ( not ( = ?auto_374620 ?auto_374621 ) ) ( not ( = ?auto_374620 ?auto_374622 ) ) ( not ( = ?auto_374620 ?auto_374623 ) ) ( not ( = ?auto_374620 ?auto_374624 ) ) ( not ( = ?auto_374620 ?auto_374625 ) ) ( not ( = ?auto_374621 ?auto_374622 ) ) ( not ( = ?auto_374621 ?auto_374623 ) ) ( not ( = ?auto_374621 ?auto_374624 ) ) ( not ( = ?auto_374621 ?auto_374625 ) ) ( not ( = ?auto_374622 ?auto_374623 ) ) ( not ( = ?auto_374622 ?auto_374624 ) ) ( not ( = ?auto_374622 ?auto_374625 ) ) ( not ( = ?auto_374623 ?auto_374624 ) ) ( not ( = ?auto_374623 ?auto_374625 ) ) ( not ( = ?auto_374624 ?auto_374625 ) ) ( CLEAR ?auto_374622 ) ( ON ?auto_374623 ?auto_374624 ) ( CLEAR ?auto_374623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_374611 ?auto_374612 ?auto_374613 ?auto_374614 ?auto_374615 ?auto_374616 ?auto_374617 ?auto_374618 ?auto_374619 ?auto_374620 ?auto_374621 ?auto_374622 ?auto_374623 )
      ( MAKE-14PILE ?auto_374611 ?auto_374612 ?auto_374613 ?auto_374614 ?auto_374615 ?auto_374616 ?auto_374617 ?auto_374618 ?auto_374619 ?auto_374620 ?auto_374621 ?auto_374622 ?auto_374623 ?auto_374624 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374640 - BLOCK
      ?auto_374641 - BLOCK
      ?auto_374642 - BLOCK
      ?auto_374643 - BLOCK
      ?auto_374644 - BLOCK
      ?auto_374645 - BLOCK
      ?auto_374646 - BLOCK
      ?auto_374647 - BLOCK
      ?auto_374648 - BLOCK
      ?auto_374649 - BLOCK
      ?auto_374650 - BLOCK
      ?auto_374651 - BLOCK
      ?auto_374652 - BLOCK
      ?auto_374653 - BLOCK
    )
    :vars
    (
      ?auto_374654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374653 ?auto_374654 ) ( ON-TABLE ?auto_374640 ) ( ON ?auto_374641 ?auto_374640 ) ( ON ?auto_374642 ?auto_374641 ) ( ON ?auto_374643 ?auto_374642 ) ( ON ?auto_374644 ?auto_374643 ) ( ON ?auto_374645 ?auto_374644 ) ( ON ?auto_374646 ?auto_374645 ) ( ON ?auto_374647 ?auto_374646 ) ( ON ?auto_374648 ?auto_374647 ) ( ON ?auto_374649 ?auto_374648 ) ( ON ?auto_374650 ?auto_374649 ) ( not ( = ?auto_374640 ?auto_374641 ) ) ( not ( = ?auto_374640 ?auto_374642 ) ) ( not ( = ?auto_374640 ?auto_374643 ) ) ( not ( = ?auto_374640 ?auto_374644 ) ) ( not ( = ?auto_374640 ?auto_374645 ) ) ( not ( = ?auto_374640 ?auto_374646 ) ) ( not ( = ?auto_374640 ?auto_374647 ) ) ( not ( = ?auto_374640 ?auto_374648 ) ) ( not ( = ?auto_374640 ?auto_374649 ) ) ( not ( = ?auto_374640 ?auto_374650 ) ) ( not ( = ?auto_374640 ?auto_374651 ) ) ( not ( = ?auto_374640 ?auto_374652 ) ) ( not ( = ?auto_374640 ?auto_374653 ) ) ( not ( = ?auto_374640 ?auto_374654 ) ) ( not ( = ?auto_374641 ?auto_374642 ) ) ( not ( = ?auto_374641 ?auto_374643 ) ) ( not ( = ?auto_374641 ?auto_374644 ) ) ( not ( = ?auto_374641 ?auto_374645 ) ) ( not ( = ?auto_374641 ?auto_374646 ) ) ( not ( = ?auto_374641 ?auto_374647 ) ) ( not ( = ?auto_374641 ?auto_374648 ) ) ( not ( = ?auto_374641 ?auto_374649 ) ) ( not ( = ?auto_374641 ?auto_374650 ) ) ( not ( = ?auto_374641 ?auto_374651 ) ) ( not ( = ?auto_374641 ?auto_374652 ) ) ( not ( = ?auto_374641 ?auto_374653 ) ) ( not ( = ?auto_374641 ?auto_374654 ) ) ( not ( = ?auto_374642 ?auto_374643 ) ) ( not ( = ?auto_374642 ?auto_374644 ) ) ( not ( = ?auto_374642 ?auto_374645 ) ) ( not ( = ?auto_374642 ?auto_374646 ) ) ( not ( = ?auto_374642 ?auto_374647 ) ) ( not ( = ?auto_374642 ?auto_374648 ) ) ( not ( = ?auto_374642 ?auto_374649 ) ) ( not ( = ?auto_374642 ?auto_374650 ) ) ( not ( = ?auto_374642 ?auto_374651 ) ) ( not ( = ?auto_374642 ?auto_374652 ) ) ( not ( = ?auto_374642 ?auto_374653 ) ) ( not ( = ?auto_374642 ?auto_374654 ) ) ( not ( = ?auto_374643 ?auto_374644 ) ) ( not ( = ?auto_374643 ?auto_374645 ) ) ( not ( = ?auto_374643 ?auto_374646 ) ) ( not ( = ?auto_374643 ?auto_374647 ) ) ( not ( = ?auto_374643 ?auto_374648 ) ) ( not ( = ?auto_374643 ?auto_374649 ) ) ( not ( = ?auto_374643 ?auto_374650 ) ) ( not ( = ?auto_374643 ?auto_374651 ) ) ( not ( = ?auto_374643 ?auto_374652 ) ) ( not ( = ?auto_374643 ?auto_374653 ) ) ( not ( = ?auto_374643 ?auto_374654 ) ) ( not ( = ?auto_374644 ?auto_374645 ) ) ( not ( = ?auto_374644 ?auto_374646 ) ) ( not ( = ?auto_374644 ?auto_374647 ) ) ( not ( = ?auto_374644 ?auto_374648 ) ) ( not ( = ?auto_374644 ?auto_374649 ) ) ( not ( = ?auto_374644 ?auto_374650 ) ) ( not ( = ?auto_374644 ?auto_374651 ) ) ( not ( = ?auto_374644 ?auto_374652 ) ) ( not ( = ?auto_374644 ?auto_374653 ) ) ( not ( = ?auto_374644 ?auto_374654 ) ) ( not ( = ?auto_374645 ?auto_374646 ) ) ( not ( = ?auto_374645 ?auto_374647 ) ) ( not ( = ?auto_374645 ?auto_374648 ) ) ( not ( = ?auto_374645 ?auto_374649 ) ) ( not ( = ?auto_374645 ?auto_374650 ) ) ( not ( = ?auto_374645 ?auto_374651 ) ) ( not ( = ?auto_374645 ?auto_374652 ) ) ( not ( = ?auto_374645 ?auto_374653 ) ) ( not ( = ?auto_374645 ?auto_374654 ) ) ( not ( = ?auto_374646 ?auto_374647 ) ) ( not ( = ?auto_374646 ?auto_374648 ) ) ( not ( = ?auto_374646 ?auto_374649 ) ) ( not ( = ?auto_374646 ?auto_374650 ) ) ( not ( = ?auto_374646 ?auto_374651 ) ) ( not ( = ?auto_374646 ?auto_374652 ) ) ( not ( = ?auto_374646 ?auto_374653 ) ) ( not ( = ?auto_374646 ?auto_374654 ) ) ( not ( = ?auto_374647 ?auto_374648 ) ) ( not ( = ?auto_374647 ?auto_374649 ) ) ( not ( = ?auto_374647 ?auto_374650 ) ) ( not ( = ?auto_374647 ?auto_374651 ) ) ( not ( = ?auto_374647 ?auto_374652 ) ) ( not ( = ?auto_374647 ?auto_374653 ) ) ( not ( = ?auto_374647 ?auto_374654 ) ) ( not ( = ?auto_374648 ?auto_374649 ) ) ( not ( = ?auto_374648 ?auto_374650 ) ) ( not ( = ?auto_374648 ?auto_374651 ) ) ( not ( = ?auto_374648 ?auto_374652 ) ) ( not ( = ?auto_374648 ?auto_374653 ) ) ( not ( = ?auto_374648 ?auto_374654 ) ) ( not ( = ?auto_374649 ?auto_374650 ) ) ( not ( = ?auto_374649 ?auto_374651 ) ) ( not ( = ?auto_374649 ?auto_374652 ) ) ( not ( = ?auto_374649 ?auto_374653 ) ) ( not ( = ?auto_374649 ?auto_374654 ) ) ( not ( = ?auto_374650 ?auto_374651 ) ) ( not ( = ?auto_374650 ?auto_374652 ) ) ( not ( = ?auto_374650 ?auto_374653 ) ) ( not ( = ?auto_374650 ?auto_374654 ) ) ( not ( = ?auto_374651 ?auto_374652 ) ) ( not ( = ?auto_374651 ?auto_374653 ) ) ( not ( = ?auto_374651 ?auto_374654 ) ) ( not ( = ?auto_374652 ?auto_374653 ) ) ( not ( = ?auto_374652 ?auto_374654 ) ) ( not ( = ?auto_374653 ?auto_374654 ) ) ( ON ?auto_374652 ?auto_374653 ) ( CLEAR ?auto_374650 ) ( ON ?auto_374651 ?auto_374652 ) ( CLEAR ?auto_374651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_374640 ?auto_374641 ?auto_374642 ?auto_374643 ?auto_374644 ?auto_374645 ?auto_374646 ?auto_374647 ?auto_374648 ?auto_374649 ?auto_374650 ?auto_374651 )
      ( MAKE-14PILE ?auto_374640 ?auto_374641 ?auto_374642 ?auto_374643 ?auto_374644 ?auto_374645 ?auto_374646 ?auto_374647 ?auto_374648 ?auto_374649 ?auto_374650 ?auto_374651 ?auto_374652 ?auto_374653 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374669 - BLOCK
      ?auto_374670 - BLOCK
      ?auto_374671 - BLOCK
      ?auto_374672 - BLOCK
      ?auto_374673 - BLOCK
      ?auto_374674 - BLOCK
      ?auto_374675 - BLOCK
      ?auto_374676 - BLOCK
      ?auto_374677 - BLOCK
      ?auto_374678 - BLOCK
      ?auto_374679 - BLOCK
      ?auto_374680 - BLOCK
      ?auto_374681 - BLOCK
      ?auto_374682 - BLOCK
    )
    :vars
    (
      ?auto_374683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374682 ?auto_374683 ) ( ON-TABLE ?auto_374669 ) ( ON ?auto_374670 ?auto_374669 ) ( ON ?auto_374671 ?auto_374670 ) ( ON ?auto_374672 ?auto_374671 ) ( ON ?auto_374673 ?auto_374672 ) ( ON ?auto_374674 ?auto_374673 ) ( ON ?auto_374675 ?auto_374674 ) ( ON ?auto_374676 ?auto_374675 ) ( ON ?auto_374677 ?auto_374676 ) ( ON ?auto_374678 ?auto_374677 ) ( ON ?auto_374679 ?auto_374678 ) ( not ( = ?auto_374669 ?auto_374670 ) ) ( not ( = ?auto_374669 ?auto_374671 ) ) ( not ( = ?auto_374669 ?auto_374672 ) ) ( not ( = ?auto_374669 ?auto_374673 ) ) ( not ( = ?auto_374669 ?auto_374674 ) ) ( not ( = ?auto_374669 ?auto_374675 ) ) ( not ( = ?auto_374669 ?auto_374676 ) ) ( not ( = ?auto_374669 ?auto_374677 ) ) ( not ( = ?auto_374669 ?auto_374678 ) ) ( not ( = ?auto_374669 ?auto_374679 ) ) ( not ( = ?auto_374669 ?auto_374680 ) ) ( not ( = ?auto_374669 ?auto_374681 ) ) ( not ( = ?auto_374669 ?auto_374682 ) ) ( not ( = ?auto_374669 ?auto_374683 ) ) ( not ( = ?auto_374670 ?auto_374671 ) ) ( not ( = ?auto_374670 ?auto_374672 ) ) ( not ( = ?auto_374670 ?auto_374673 ) ) ( not ( = ?auto_374670 ?auto_374674 ) ) ( not ( = ?auto_374670 ?auto_374675 ) ) ( not ( = ?auto_374670 ?auto_374676 ) ) ( not ( = ?auto_374670 ?auto_374677 ) ) ( not ( = ?auto_374670 ?auto_374678 ) ) ( not ( = ?auto_374670 ?auto_374679 ) ) ( not ( = ?auto_374670 ?auto_374680 ) ) ( not ( = ?auto_374670 ?auto_374681 ) ) ( not ( = ?auto_374670 ?auto_374682 ) ) ( not ( = ?auto_374670 ?auto_374683 ) ) ( not ( = ?auto_374671 ?auto_374672 ) ) ( not ( = ?auto_374671 ?auto_374673 ) ) ( not ( = ?auto_374671 ?auto_374674 ) ) ( not ( = ?auto_374671 ?auto_374675 ) ) ( not ( = ?auto_374671 ?auto_374676 ) ) ( not ( = ?auto_374671 ?auto_374677 ) ) ( not ( = ?auto_374671 ?auto_374678 ) ) ( not ( = ?auto_374671 ?auto_374679 ) ) ( not ( = ?auto_374671 ?auto_374680 ) ) ( not ( = ?auto_374671 ?auto_374681 ) ) ( not ( = ?auto_374671 ?auto_374682 ) ) ( not ( = ?auto_374671 ?auto_374683 ) ) ( not ( = ?auto_374672 ?auto_374673 ) ) ( not ( = ?auto_374672 ?auto_374674 ) ) ( not ( = ?auto_374672 ?auto_374675 ) ) ( not ( = ?auto_374672 ?auto_374676 ) ) ( not ( = ?auto_374672 ?auto_374677 ) ) ( not ( = ?auto_374672 ?auto_374678 ) ) ( not ( = ?auto_374672 ?auto_374679 ) ) ( not ( = ?auto_374672 ?auto_374680 ) ) ( not ( = ?auto_374672 ?auto_374681 ) ) ( not ( = ?auto_374672 ?auto_374682 ) ) ( not ( = ?auto_374672 ?auto_374683 ) ) ( not ( = ?auto_374673 ?auto_374674 ) ) ( not ( = ?auto_374673 ?auto_374675 ) ) ( not ( = ?auto_374673 ?auto_374676 ) ) ( not ( = ?auto_374673 ?auto_374677 ) ) ( not ( = ?auto_374673 ?auto_374678 ) ) ( not ( = ?auto_374673 ?auto_374679 ) ) ( not ( = ?auto_374673 ?auto_374680 ) ) ( not ( = ?auto_374673 ?auto_374681 ) ) ( not ( = ?auto_374673 ?auto_374682 ) ) ( not ( = ?auto_374673 ?auto_374683 ) ) ( not ( = ?auto_374674 ?auto_374675 ) ) ( not ( = ?auto_374674 ?auto_374676 ) ) ( not ( = ?auto_374674 ?auto_374677 ) ) ( not ( = ?auto_374674 ?auto_374678 ) ) ( not ( = ?auto_374674 ?auto_374679 ) ) ( not ( = ?auto_374674 ?auto_374680 ) ) ( not ( = ?auto_374674 ?auto_374681 ) ) ( not ( = ?auto_374674 ?auto_374682 ) ) ( not ( = ?auto_374674 ?auto_374683 ) ) ( not ( = ?auto_374675 ?auto_374676 ) ) ( not ( = ?auto_374675 ?auto_374677 ) ) ( not ( = ?auto_374675 ?auto_374678 ) ) ( not ( = ?auto_374675 ?auto_374679 ) ) ( not ( = ?auto_374675 ?auto_374680 ) ) ( not ( = ?auto_374675 ?auto_374681 ) ) ( not ( = ?auto_374675 ?auto_374682 ) ) ( not ( = ?auto_374675 ?auto_374683 ) ) ( not ( = ?auto_374676 ?auto_374677 ) ) ( not ( = ?auto_374676 ?auto_374678 ) ) ( not ( = ?auto_374676 ?auto_374679 ) ) ( not ( = ?auto_374676 ?auto_374680 ) ) ( not ( = ?auto_374676 ?auto_374681 ) ) ( not ( = ?auto_374676 ?auto_374682 ) ) ( not ( = ?auto_374676 ?auto_374683 ) ) ( not ( = ?auto_374677 ?auto_374678 ) ) ( not ( = ?auto_374677 ?auto_374679 ) ) ( not ( = ?auto_374677 ?auto_374680 ) ) ( not ( = ?auto_374677 ?auto_374681 ) ) ( not ( = ?auto_374677 ?auto_374682 ) ) ( not ( = ?auto_374677 ?auto_374683 ) ) ( not ( = ?auto_374678 ?auto_374679 ) ) ( not ( = ?auto_374678 ?auto_374680 ) ) ( not ( = ?auto_374678 ?auto_374681 ) ) ( not ( = ?auto_374678 ?auto_374682 ) ) ( not ( = ?auto_374678 ?auto_374683 ) ) ( not ( = ?auto_374679 ?auto_374680 ) ) ( not ( = ?auto_374679 ?auto_374681 ) ) ( not ( = ?auto_374679 ?auto_374682 ) ) ( not ( = ?auto_374679 ?auto_374683 ) ) ( not ( = ?auto_374680 ?auto_374681 ) ) ( not ( = ?auto_374680 ?auto_374682 ) ) ( not ( = ?auto_374680 ?auto_374683 ) ) ( not ( = ?auto_374681 ?auto_374682 ) ) ( not ( = ?auto_374681 ?auto_374683 ) ) ( not ( = ?auto_374682 ?auto_374683 ) ) ( ON ?auto_374681 ?auto_374682 ) ( CLEAR ?auto_374679 ) ( ON ?auto_374680 ?auto_374681 ) ( CLEAR ?auto_374680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_374669 ?auto_374670 ?auto_374671 ?auto_374672 ?auto_374673 ?auto_374674 ?auto_374675 ?auto_374676 ?auto_374677 ?auto_374678 ?auto_374679 ?auto_374680 )
      ( MAKE-14PILE ?auto_374669 ?auto_374670 ?auto_374671 ?auto_374672 ?auto_374673 ?auto_374674 ?auto_374675 ?auto_374676 ?auto_374677 ?auto_374678 ?auto_374679 ?auto_374680 ?auto_374681 ?auto_374682 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374698 - BLOCK
      ?auto_374699 - BLOCK
      ?auto_374700 - BLOCK
      ?auto_374701 - BLOCK
      ?auto_374702 - BLOCK
      ?auto_374703 - BLOCK
      ?auto_374704 - BLOCK
      ?auto_374705 - BLOCK
      ?auto_374706 - BLOCK
      ?auto_374707 - BLOCK
      ?auto_374708 - BLOCK
      ?auto_374709 - BLOCK
      ?auto_374710 - BLOCK
      ?auto_374711 - BLOCK
    )
    :vars
    (
      ?auto_374712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374711 ?auto_374712 ) ( ON-TABLE ?auto_374698 ) ( ON ?auto_374699 ?auto_374698 ) ( ON ?auto_374700 ?auto_374699 ) ( ON ?auto_374701 ?auto_374700 ) ( ON ?auto_374702 ?auto_374701 ) ( ON ?auto_374703 ?auto_374702 ) ( ON ?auto_374704 ?auto_374703 ) ( ON ?auto_374705 ?auto_374704 ) ( ON ?auto_374706 ?auto_374705 ) ( ON ?auto_374707 ?auto_374706 ) ( not ( = ?auto_374698 ?auto_374699 ) ) ( not ( = ?auto_374698 ?auto_374700 ) ) ( not ( = ?auto_374698 ?auto_374701 ) ) ( not ( = ?auto_374698 ?auto_374702 ) ) ( not ( = ?auto_374698 ?auto_374703 ) ) ( not ( = ?auto_374698 ?auto_374704 ) ) ( not ( = ?auto_374698 ?auto_374705 ) ) ( not ( = ?auto_374698 ?auto_374706 ) ) ( not ( = ?auto_374698 ?auto_374707 ) ) ( not ( = ?auto_374698 ?auto_374708 ) ) ( not ( = ?auto_374698 ?auto_374709 ) ) ( not ( = ?auto_374698 ?auto_374710 ) ) ( not ( = ?auto_374698 ?auto_374711 ) ) ( not ( = ?auto_374698 ?auto_374712 ) ) ( not ( = ?auto_374699 ?auto_374700 ) ) ( not ( = ?auto_374699 ?auto_374701 ) ) ( not ( = ?auto_374699 ?auto_374702 ) ) ( not ( = ?auto_374699 ?auto_374703 ) ) ( not ( = ?auto_374699 ?auto_374704 ) ) ( not ( = ?auto_374699 ?auto_374705 ) ) ( not ( = ?auto_374699 ?auto_374706 ) ) ( not ( = ?auto_374699 ?auto_374707 ) ) ( not ( = ?auto_374699 ?auto_374708 ) ) ( not ( = ?auto_374699 ?auto_374709 ) ) ( not ( = ?auto_374699 ?auto_374710 ) ) ( not ( = ?auto_374699 ?auto_374711 ) ) ( not ( = ?auto_374699 ?auto_374712 ) ) ( not ( = ?auto_374700 ?auto_374701 ) ) ( not ( = ?auto_374700 ?auto_374702 ) ) ( not ( = ?auto_374700 ?auto_374703 ) ) ( not ( = ?auto_374700 ?auto_374704 ) ) ( not ( = ?auto_374700 ?auto_374705 ) ) ( not ( = ?auto_374700 ?auto_374706 ) ) ( not ( = ?auto_374700 ?auto_374707 ) ) ( not ( = ?auto_374700 ?auto_374708 ) ) ( not ( = ?auto_374700 ?auto_374709 ) ) ( not ( = ?auto_374700 ?auto_374710 ) ) ( not ( = ?auto_374700 ?auto_374711 ) ) ( not ( = ?auto_374700 ?auto_374712 ) ) ( not ( = ?auto_374701 ?auto_374702 ) ) ( not ( = ?auto_374701 ?auto_374703 ) ) ( not ( = ?auto_374701 ?auto_374704 ) ) ( not ( = ?auto_374701 ?auto_374705 ) ) ( not ( = ?auto_374701 ?auto_374706 ) ) ( not ( = ?auto_374701 ?auto_374707 ) ) ( not ( = ?auto_374701 ?auto_374708 ) ) ( not ( = ?auto_374701 ?auto_374709 ) ) ( not ( = ?auto_374701 ?auto_374710 ) ) ( not ( = ?auto_374701 ?auto_374711 ) ) ( not ( = ?auto_374701 ?auto_374712 ) ) ( not ( = ?auto_374702 ?auto_374703 ) ) ( not ( = ?auto_374702 ?auto_374704 ) ) ( not ( = ?auto_374702 ?auto_374705 ) ) ( not ( = ?auto_374702 ?auto_374706 ) ) ( not ( = ?auto_374702 ?auto_374707 ) ) ( not ( = ?auto_374702 ?auto_374708 ) ) ( not ( = ?auto_374702 ?auto_374709 ) ) ( not ( = ?auto_374702 ?auto_374710 ) ) ( not ( = ?auto_374702 ?auto_374711 ) ) ( not ( = ?auto_374702 ?auto_374712 ) ) ( not ( = ?auto_374703 ?auto_374704 ) ) ( not ( = ?auto_374703 ?auto_374705 ) ) ( not ( = ?auto_374703 ?auto_374706 ) ) ( not ( = ?auto_374703 ?auto_374707 ) ) ( not ( = ?auto_374703 ?auto_374708 ) ) ( not ( = ?auto_374703 ?auto_374709 ) ) ( not ( = ?auto_374703 ?auto_374710 ) ) ( not ( = ?auto_374703 ?auto_374711 ) ) ( not ( = ?auto_374703 ?auto_374712 ) ) ( not ( = ?auto_374704 ?auto_374705 ) ) ( not ( = ?auto_374704 ?auto_374706 ) ) ( not ( = ?auto_374704 ?auto_374707 ) ) ( not ( = ?auto_374704 ?auto_374708 ) ) ( not ( = ?auto_374704 ?auto_374709 ) ) ( not ( = ?auto_374704 ?auto_374710 ) ) ( not ( = ?auto_374704 ?auto_374711 ) ) ( not ( = ?auto_374704 ?auto_374712 ) ) ( not ( = ?auto_374705 ?auto_374706 ) ) ( not ( = ?auto_374705 ?auto_374707 ) ) ( not ( = ?auto_374705 ?auto_374708 ) ) ( not ( = ?auto_374705 ?auto_374709 ) ) ( not ( = ?auto_374705 ?auto_374710 ) ) ( not ( = ?auto_374705 ?auto_374711 ) ) ( not ( = ?auto_374705 ?auto_374712 ) ) ( not ( = ?auto_374706 ?auto_374707 ) ) ( not ( = ?auto_374706 ?auto_374708 ) ) ( not ( = ?auto_374706 ?auto_374709 ) ) ( not ( = ?auto_374706 ?auto_374710 ) ) ( not ( = ?auto_374706 ?auto_374711 ) ) ( not ( = ?auto_374706 ?auto_374712 ) ) ( not ( = ?auto_374707 ?auto_374708 ) ) ( not ( = ?auto_374707 ?auto_374709 ) ) ( not ( = ?auto_374707 ?auto_374710 ) ) ( not ( = ?auto_374707 ?auto_374711 ) ) ( not ( = ?auto_374707 ?auto_374712 ) ) ( not ( = ?auto_374708 ?auto_374709 ) ) ( not ( = ?auto_374708 ?auto_374710 ) ) ( not ( = ?auto_374708 ?auto_374711 ) ) ( not ( = ?auto_374708 ?auto_374712 ) ) ( not ( = ?auto_374709 ?auto_374710 ) ) ( not ( = ?auto_374709 ?auto_374711 ) ) ( not ( = ?auto_374709 ?auto_374712 ) ) ( not ( = ?auto_374710 ?auto_374711 ) ) ( not ( = ?auto_374710 ?auto_374712 ) ) ( not ( = ?auto_374711 ?auto_374712 ) ) ( ON ?auto_374710 ?auto_374711 ) ( ON ?auto_374709 ?auto_374710 ) ( CLEAR ?auto_374707 ) ( ON ?auto_374708 ?auto_374709 ) ( CLEAR ?auto_374708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_374698 ?auto_374699 ?auto_374700 ?auto_374701 ?auto_374702 ?auto_374703 ?auto_374704 ?auto_374705 ?auto_374706 ?auto_374707 ?auto_374708 )
      ( MAKE-14PILE ?auto_374698 ?auto_374699 ?auto_374700 ?auto_374701 ?auto_374702 ?auto_374703 ?auto_374704 ?auto_374705 ?auto_374706 ?auto_374707 ?auto_374708 ?auto_374709 ?auto_374710 ?auto_374711 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374727 - BLOCK
      ?auto_374728 - BLOCK
      ?auto_374729 - BLOCK
      ?auto_374730 - BLOCK
      ?auto_374731 - BLOCK
      ?auto_374732 - BLOCK
      ?auto_374733 - BLOCK
      ?auto_374734 - BLOCK
      ?auto_374735 - BLOCK
      ?auto_374736 - BLOCK
      ?auto_374737 - BLOCK
      ?auto_374738 - BLOCK
      ?auto_374739 - BLOCK
      ?auto_374740 - BLOCK
    )
    :vars
    (
      ?auto_374741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374740 ?auto_374741 ) ( ON-TABLE ?auto_374727 ) ( ON ?auto_374728 ?auto_374727 ) ( ON ?auto_374729 ?auto_374728 ) ( ON ?auto_374730 ?auto_374729 ) ( ON ?auto_374731 ?auto_374730 ) ( ON ?auto_374732 ?auto_374731 ) ( ON ?auto_374733 ?auto_374732 ) ( ON ?auto_374734 ?auto_374733 ) ( ON ?auto_374735 ?auto_374734 ) ( ON ?auto_374736 ?auto_374735 ) ( not ( = ?auto_374727 ?auto_374728 ) ) ( not ( = ?auto_374727 ?auto_374729 ) ) ( not ( = ?auto_374727 ?auto_374730 ) ) ( not ( = ?auto_374727 ?auto_374731 ) ) ( not ( = ?auto_374727 ?auto_374732 ) ) ( not ( = ?auto_374727 ?auto_374733 ) ) ( not ( = ?auto_374727 ?auto_374734 ) ) ( not ( = ?auto_374727 ?auto_374735 ) ) ( not ( = ?auto_374727 ?auto_374736 ) ) ( not ( = ?auto_374727 ?auto_374737 ) ) ( not ( = ?auto_374727 ?auto_374738 ) ) ( not ( = ?auto_374727 ?auto_374739 ) ) ( not ( = ?auto_374727 ?auto_374740 ) ) ( not ( = ?auto_374727 ?auto_374741 ) ) ( not ( = ?auto_374728 ?auto_374729 ) ) ( not ( = ?auto_374728 ?auto_374730 ) ) ( not ( = ?auto_374728 ?auto_374731 ) ) ( not ( = ?auto_374728 ?auto_374732 ) ) ( not ( = ?auto_374728 ?auto_374733 ) ) ( not ( = ?auto_374728 ?auto_374734 ) ) ( not ( = ?auto_374728 ?auto_374735 ) ) ( not ( = ?auto_374728 ?auto_374736 ) ) ( not ( = ?auto_374728 ?auto_374737 ) ) ( not ( = ?auto_374728 ?auto_374738 ) ) ( not ( = ?auto_374728 ?auto_374739 ) ) ( not ( = ?auto_374728 ?auto_374740 ) ) ( not ( = ?auto_374728 ?auto_374741 ) ) ( not ( = ?auto_374729 ?auto_374730 ) ) ( not ( = ?auto_374729 ?auto_374731 ) ) ( not ( = ?auto_374729 ?auto_374732 ) ) ( not ( = ?auto_374729 ?auto_374733 ) ) ( not ( = ?auto_374729 ?auto_374734 ) ) ( not ( = ?auto_374729 ?auto_374735 ) ) ( not ( = ?auto_374729 ?auto_374736 ) ) ( not ( = ?auto_374729 ?auto_374737 ) ) ( not ( = ?auto_374729 ?auto_374738 ) ) ( not ( = ?auto_374729 ?auto_374739 ) ) ( not ( = ?auto_374729 ?auto_374740 ) ) ( not ( = ?auto_374729 ?auto_374741 ) ) ( not ( = ?auto_374730 ?auto_374731 ) ) ( not ( = ?auto_374730 ?auto_374732 ) ) ( not ( = ?auto_374730 ?auto_374733 ) ) ( not ( = ?auto_374730 ?auto_374734 ) ) ( not ( = ?auto_374730 ?auto_374735 ) ) ( not ( = ?auto_374730 ?auto_374736 ) ) ( not ( = ?auto_374730 ?auto_374737 ) ) ( not ( = ?auto_374730 ?auto_374738 ) ) ( not ( = ?auto_374730 ?auto_374739 ) ) ( not ( = ?auto_374730 ?auto_374740 ) ) ( not ( = ?auto_374730 ?auto_374741 ) ) ( not ( = ?auto_374731 ?auto_374732 ) ) ( not ( = ?auto_374731 ?auto_374733 ) ) ( not ( = ?auto_374731 ?auto_374734 ) ) ( not ( = ?auto_374731 ?auto_374735 ) ) ( not ( = ?auto_374731 ?auto_374736 ) ) ( not ( = ?auto_374731 ?auto_374737 ) ) ( not ( = ?auto_374731 ?auto_374738 ) ) ( not ( = ?auto_374731 ?auto_374739 ) ) ( not ( = ?auto_374731 ?auto_374740 ) ) ( not ( = ?auto_374731 ?auto_374741 ) ) ( not ( = ?auto_374732 ?auto_374733 ) ) ( not ( = ?auto_374732 ?auto_374734 ) ) ( not ( = ?auto_374732 ?auto_374735 ) ) ( not ( = ?auto_374732 ?auto_374736 ) ) ( not ( = ?auto_374732 ?auto_374737 ) ) ( not ( = ?auto_374732 ?auto_374738 ) ) ( not ( = ?auto_374732 ?auto_374739 ) ) ( not ( = ?auto_374732 ?auto_374740 ) ) ( not ( = ?auto_374732 ?auto_374741 ) ) ( not ( = ?auto_374733 ?auto_374734 ) ) ( not ( = ?auto_374733 ?auto_374735 ) ) ( not ( = ?auto_374733 ?auto_374736 ) ) ( not ( = ?auto_374733 ?auto_374737 ) ) ( not ( = ?auto_374733 ?auto_374738 ) ) ( not ( = ?auto_374733 ?auto_374739 ) ) ( not ( = ?auto_374733 ?auto_374740 ) ) ( not ( = ?auto_374733 ?auto_374741 ) ) ( not ( = ?auto_374734 ?auto_374735 ) ) ( not ( = ?auto_374734 ?auto_374736 ) ) ( not ( = ?auto_374734 ?auto_374737 ) ) ( not ( = ?auto_374734 ?auto_374738 ) ) ( not ( = ?auto_374734 ?auto_374739 ) ) ( not ( = ?auto_374734 ?auto_374740 ) ) ( not ( = ?auto_374734 ?auto_374741 ) ) ( not ( = ?auto_374735 ?auto_374736 ) ) ( not ( = ?auto_374735 ?auto_374737 ) ) ( not ( = ?auto_374735 ?auto_374738 ) ) ( not ( = ?auto_374735 ?auto_374739 ) ) ( not ( = ?auto_374735 ?auto_374740 ) ) ( not ( = ?auto_374735 ?auto_374741 ) ) ( not ( = ?auto_374736 ?auto_374737 ) ) ( not ( = ?auto_374736 ?auto_374738 ) ) ( not ( = ?auto_374736 ?auto_374739 ) ) ( not ( = ?auto_374736 ?auto_374740 ) ) ( not ( = ?auto_374736 ?auto_374741 ) ) ( not ( = ?auto_374737 ?auto_374738 ) ) ( not ( = ?auto_374737 ?auto_374739 ) ) ( not ( = ?auto_374737 ?auto_374740 ) ) ( not ( = ?auto_374737 ?auto_374741 ) ) ( not ( = ?auto_374738 ?auto_374739 ) ) ( not ( = ?auto_374738 ?auto_374740 ) ) ( not ( = ?auto_374738 ?auto_374741 ) ) ( not ( = ?auto_374739 ?auto_374740 ) ) ( not ( = ?auto_374739 ?auto_374741 ) ) ( not ( = ?auto_374740 ?auto_374741 ) ) ( ON ?auto_374739 ?auto_374740 ) ( ON ?auto_374738 ?auto_374739 ) ( CLEAR ?auto_374736 ) ( ON ?auto_374737 ?auto_374738 ) ( CLEAR ?auto_374737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_374727 ?auto_374728 ?auto_374729 ?auto_374730 ?auto_374731 ?auto_374732 ?auto_374733 ?auto_374734 ?auto_374735 ?auto_374736 ?auto_374737 )
      ( MAKE-14PILE ?auto_374727 ?auto_374728 ?auto_374729 ?auto_374730 ?auto_374731 ?auto_374732 ?auto_374733 ?auto_374734 ?auto_374735 ?auto_374736 ?auto_374737 ?auto_374738 ?auto_374739 ?auto_374740 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374756 - BLOCK
      ?auto_374757 - BLOCK
      ?auto_374758 - BLOCK
      ?auto_374759 - BLOCK
      ?auto_374760 - BLOCK
      ?auto_374761 - BLOCK
      ?auto_374762 - BLOCK
      ?auto_374763 - BLOCK
      ?auto_374764 - BLOCK
      ?auto_374765 - BLOCK
      ?auto_374766 - BLOCK
      ?auto_374767 - BLOCK
      ?auto_374768 - BLOCK
      ?auto_374769 - BLOCK
    )
    :vars
    (
      ?auto_374770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374769 ?auto_374770 ) ( ON-TABLE ?auto_374756 ) ( ON ?auto_374757 ?auto_374756 ) ( ON ?auto_374758 ?auto_374757 ) ( ON ?auto_374759 ?auto_374758 ) ( ON ?auto_374760 ?auto_374759 ) ( ON ?auto_374761 ?auto_374760 ) ( ON ?auto_374762 ?auto_374761 ) ( ON ?auto_374763 ?auto_374762 ) ( ON ?auto_374764 ?auto_374763 ) ( not ( = ?auto_374756 ?auto_374757 ) ) ( not ( = ?auto_374756 ?auto_374758 ) ) ( not ( = ?auto_374756 ?auto_374759 ) ) ( not ( = ?auto_374756 ?auto_374760 ) ) ( not ( = ?auto_374756 ?auto_374761 ) ) ( not ( = ?auto_374756 ?auto_374762 ) ) ( not ( = ?auto_374756 ?auto_374763 ) ) ( not ( = ?auto_374756 ?auto_374764 ) ) ( not ( = ?auto_374756 ?auto_374765 ) ) ( not ( = ?auto_374756 ?auto_374766 ) ) ( not ( = ?auto_374756 ?auto_374767 ) ) ( not ( = ?auto_374756 ?auto_374768 ) ) ( not ( = ?auto_374756 ?auto_374769 ) ) ( not ( = ?auto_374756 ?auto_374770 ) ) ( not ( = ?auto_374757 ?auto_374758 ) ) ( not ( = ?auto_374757 ?auto_374759 ) ) ( not ( = ?auto_374757 ?auto_374760 ) ) ( not ( = ?auto_374757 ?auto_374761 ) ) ( not ( = ?auto_374757 ?auto_374762 ) ) ( not ( = ?auto_374757 ?auto_374763 ) ) ( not ( = ?auto_374757 ?auto_374764 ) ) ( not ( = ?auto_374757 ?auto_374765 ) ) ( not ( = ?auto_374757 ?auto_374766 ) ) ( not ( = ?auto_374757 ?auto_374767 ) ) ( not ( = ?auto_374757 ?auto_374768 ) ) ( not ( = ?auto_374757 ?auto_374769 ) ) ( not ( = ?auto_374757 ?auto_374770 ) ) ( not ( = ?auto_374758 ?auto_374759 ) ) ( not ( = ?auto_374758 ?auto_374760 ) ) ( not ( = ?auto_374758 ?auto_374761 ) ) ( not ( = ?auto_374758 ?auto_374762 ) ) ( not ( = ?auto_374758 ?auto_374763 ) ) ( not ( = ?auto_374758 ?auto_374764 ) ) ( not ( = ?auto_374758 ?auto_374765 ) ) ( not ( = ?auto_374758 ?auto_374766 ) ) ( not ( = ?auto_374758 ?auto_374767 ) ) ( not ( = ?auto_374758 ?auto_374768 ) ) ( not ( = ?auto_374758 ?auto_374769 ) ) ( not ( = ?auto_374758 ?auto_374770 ) ) ( not ( = ?auto_374759 ?auto_374760 ) ) ( not ( = ?auto_374759 ?auto_374761 ) ) ( not ( = ?auto_374759 ?auto_374762 ) ) ( not ( = ?auto_374759 ?auto_374763 ) ) ( not ( = ?auto_374759 ?auto_374764 ) ) ( not ( = ?auto_374759 ?auto_374765 ) ) ( not ( = ?auto_374759 ?auto_374766 ) ) ( not ( = ?auto_374759 ?auto_374767 ) ) ( not ( = ?auto_374759 ?auto_374768 ) ) ( not ( = ?auto_374759 ?auto_374769 ) ) ( not ( = ?auto_374759 ?auto_374770 ) ) ( not ( = ?auto_374760 ?auto_374761 ) ) ( not ( = ?auto_374760 ?auto_374762 ) ) ( not ( = ?auto_374760 ?auto_374763 ) ) ( not ( = ?auto_374760 ?auto_374764 ) ) ( not ( = ?auto_374760 ?auto_374765 ) ) ( not ( = ?auto_374760 ?auto_374766 ) ) ( not ( = ?auto_374760 ?auto_374767 ) ) ( not ( = ?auto_374760 ?auto_374768 ) ) ( not ( = ?auto_374760 ?auto_374769 ) ) ( not ( = ?auto_374760 ?auto_374770 ) ) ( not ( = ?auto_374761 ?auto_374762 ) ) ( not ( = ?auto_374761 ?auto_374763 ) ) ( not ( = ?auto_374761 ?auto_374764 ) ) ( not ( = ?auto_374761 ?auto_374765 ) ) ( not ( = ?auto_374761 ?auto_374766 ) ) ( not ( = ?auto_374761 ?auto_374767 ) ) ( not ( = ?auto_374761 ?auto_374768 ) ) ( not ( = ?auto_374761 ?auto_374769 ) ) ( not ( = ?auto_374761 ?auto_374770 ) ) ( not ( = ?auto_374762 ?auto_374763 ) ) ( not ( = ?auto_374762 ?auto_374764 ) ) ( not ( = ?auto_374762 ?auto_374765 ) ) ( not ( = ?auto_374762 ?auto_374766 ) ) ( not ( = ?auto_374762 ?auto_374767 ) ) ( not ( = ?auto_374762 ?auto_374768 ) ) ( not ( = ?auto_374762 ?auto_374769 ) ) ( not ( = ?auto_374762 ?auto_374770 ) ) ( not ( = ?auto_374763 ?auto_374764 ) ) ( not ( = ?auto_374763 ?auto_374765 ) ) ( not ( = ?auto_374763 ?auto_374766 ) ) ( not ( = ?auto_374763 ?auto_374767 ) ) ( not ( = ?auto_374763 ?auto_374768 ) ) ( not ( = ?auto_374763 ?auto_374769 ) ) ( not ( = ?auto_374763 ?auto_374770 ) ) ( not ( = ?auto_374764 ?auto_374765 ) ) ( not ( = ?auto_374764 ?auto_374766 ) ) ( not ( = ?auto_374764 ?auto_374767 ) ) ( not ( = ?auto_374764 ?auto_374768 ) ) ( not ( = ?auto_374764 ?auto_374769 ) ) ( not ( = ?auto_374764 ?auto_374770 ) ) ( not ( = ?auto_374765 ?auto_374766 ) ) ( not ( = ?auto_374765 ?auto_374767 ) ) ( not ( = ?auto_374765 ?auto_374768 ) ) ( not ( = ?auto_374765 ?auto_374769 ) ) ( not ( = ?auto_374765 ?auto_374770 ) ) ( not ( = ?auto_374766 ?auto_374767 ) ) ( not ( = ?auto_374766 ?auto_374768 ) ) ( not ( = ?auto_374766 ?auto_374769 ) ) ( not ( = ?auto_374766 ?auto_374770 ) ) ( not ( = ?auto_374767 ?auto_374768 ) ) ( not ( = ?auto_374767 ?auto_374769 ) ) ( not ( = ?auto_374767 ?auto_374770 ) ) ( not ( = ?auto_374768 ?auto_374769 ) ) ( not ( = ?auto_374768 ?auto_374770 ) ) ( not ( = ?auto_374769 ?auto_374770 ) ) ( ON ?auto_374768 ?auto_374769 ) ( ON ?auto_374767 ?auto_374768 ) ( ON ?auto_374766 ?auto_374767 ) ( CLEAR ?auto_374764 ) ( ON ?auto_374765 ?auto_374766 ) ( CLEAR ?auto_374765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_374756 ?auto_374757 ?auto_374758 ?auto_374759 ?auto_374760 ?auto_374761 ?auto_374762 ?auto_374763 ?auto_374764 ?auto_374765 )
      ( MAKE-14PILE ?auto_374756 ?auto_374757 ?auto_374758 ?auto_374759 ?auto_374760 ?auto_374761 ?auto_374762 ?auto_374763 ?auto_374764 ?auto_374765 ?auto_374766 ?auto_374767 ?auto_374768 ?auto_374769 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374785 - BLOCK
      ?auto_374786 - BLOCK
      ?auto_374787 - BLOCK
      ?auto_374788 - BLOCK
      ?auto_374789 - BLOCK
      ?auto_374790 - BLOCK
      ?auto_374791 - BLOCK
      ?auto_374792 - BLOCK
      ?auto_374793 - BLOCK
      ?auto_374794 - BLOCK
      ?auto_374795 - BLOCK
      ?auto_374796 - BLOCK
      ?auto_374797 - BLOCK
      ?auto_374798 - BLOCK
    )
    :vars
    (
      ?auto_374799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374798 ?auto_374799 ) ( ON-TABLE ?auto_374785 ) ( ON ?auto_374786 ?auto_374785 ) ( ON ?auto_374787 ?auto_374786 ) ( ON ?auto_374788 ?auto_374787 ) ( ON ?auto_374789 ?auto_374788 ) ( ON ?auto_374790 ?auto_374789 ) ( ON ?auto_374791 ?auto_374790 ) ( ON ?auto_374792 ?auto_374791 ) ( ON ?auto_374793 ?auto_374792 ) ( not ( = ?auto_374785 ?auto_374786 ) ) ( not ( = ?auto_374785 ?auto_374787 ) ) ( not ( = ?auto_374785 ?auto_374788 ) ) ( not ( = ?auto_374785 ?auto_374789 ) ) ( not ( = ?auto_374785 ?auto_374790 ) ) ( not ( = ?auto_374785 ?auto_374791 ) ) ( not ( = ?auto_374785 ?auto_374792 ) ) ( not ( = ?auto_374785 ?auto_374793 ) ) ( not ( = ?auto_374785 ?auto_374794 ) ) ( not ( = ?auto_374785 ?auto_374795 ) ) ( not ( = ?auto_374785 ?auto_374796 ) ) ( not ( = ?auto_374785 ?auto_374797 ) ) ( not ( = ?auto_374785 ?auto_374798 ) ) ( not ( = ?auto_374785 ?auto_374799 ) ) ( not ( = ?auto_374786 ?auto_374787 ) ) ( not ( = ?auto_374786 ?auto_374788 ) ) ( not ( = ?auto_374786 ?auto_374789 ) ) ( not ( = ?auto_374786 ?auto_374790 ) ) ( not ( = ?auto_374786 ?auto_374791 ) ) ( not ( = ?auto_374786 ?auto_374792 ) ) ( not ( = ?auto_374786 ?auto_374793 ) ) ( not ( = ?auto_374786 ?auto_374794 ) ) ( not ( = ?auto_374786 ?auto_374795 ) ) ( not ( = ?auto_374786 ?auto_374796 ) ) ( not ( = ?auto_374786 ?auto_374797 ) ) ( not ( = ?auto_374786 ?auto_374798 ) ) ( not ( = ?auto_374786 ?auto_374799 ) ) ( not ( = ?auto_374787 ?auto_374788 ) ) ( not ( = ?auto_374787 ?auto_374789 ) ) ( not ( = ?auto_374787 ?auto_374790 ) ) ( not ( = ?auto_374787 ?auto_374791 ) ) ( not ( = ?auto_374787 ?auto_374792 ) ) ( not ( = ?auto_374787 ?auto_374793 ) ) ( not ( = ?auto_374787 ?auto_374794 ) ) ( not ( = ?auto_374787 ?auto_374795 ) ) ( not ( = ?auto_374787 ?auto_374796 ) ) ( not ( = ?auto_374787 ?auto_374797 ) ) ( not ( = ?auto_374787 ?auto_374798 ) ) ( not ( = ?auto_374787 ?auto_374799 ) ) ( not ( = ?auto_374788 ?auto_374789 ) ) ( not ( = ?auto_374788 ?auto_374790 ) ) ( not ( = ?auto_374788 ?auto_374791 ) ) ( not ( = ?auto_374788 ?auto_374792 ) ) ( not ( = ?auto_374788 ?auto_374793 ) ) ( not ( = ?auto_374788 ?auto_374794 ) ) ( not ( = ?auto_374788 ?auto_374795 ) ) ( not ( = ?auto_374788 ?auto_374796 ) ) ( not ( = ?auto_374788 ?auto_374797 ) ) ( not ( = ?auto_374788 ?auto_374798 ) ) ( not ( = ?auto_374788 ?auto_374799 ) ) ( not ( = ?auto_374789 ?auto_374790 ) ) ( not ( = ?auto_374789 ?auto_374791 ) ) ( not ( = ?auto_374789 ?auto_374792 ) ) ( not ( = ?auto_374789 ?auto_374793 ) ) ( not ( = ?auto_374789 ?auto_374794 ) ) ( not ( = ?auto_374789 ?auto_374795 ) ) ( not ( = ?auto_374789 ?auto_374796 ) ) ( not ( = ?auto_374789 ?auto_374797 ) ) ( not ( = ?auto_374789 ?auto_374798 ) ) ( not ( = ?auto_374789 ?auto_374799 ) ) ( not ( = ?auto_374790 ?auto_374791 ) ) ( not ( = ?auto_374790 ?auto_374792 ) ) ( not ( = ?auto_374790 ?auto_374793 ) ) ( not ( = ?auto_374790 ?auto_374794 ) ) ( not ( = ?auto_374790 ?auto_374795 ) ) ( not ( = ?auto_374790 ?auto_374796 ) ) ( not ( = ?auto_374790 ?auto_374797 ) ) ( not ( = ?auto_374790 ?auto_374798 ) ) ( not ( = ?auto_374790 ?auto_374799 ) ) ( not ( = ?auto_374791 ?auto_374792 ) ) ( not ( = ?auto_374791 ?auto_374793 ) ) ( not ( = ?auto_374791 ?auto_374794 ) ) ( not ( = ?auto_374791 ?auto_374795 ) ) ( not ( = ?auto_374791 ?auto_374796 ) ) ( not ( = ?auto_374791 ?auto_374797 ) ) ( not ( = ?auto_374791 ?auto_374798 ) ) ( not ( = ?auto_374791 ?auto_374799 ) ) ( not ( = ?auto_374792 ?auto_374793 ) ) ( not ( = ?auto_374792 ?auto_374794 ) ) ( not ( = ?auto_374792 ?auto_374795 ) ) ( not ( = ?auto_374792 ?auto_374796 ) ) ( not ( = ?auto_374792 ?auto_374797 ) ) ( not ( = ?auto_374792 ?auto_374798 ) ) ( not ( = ?auto_374792 ?auto_374799 ) ) ( not ( = ?auto_374793 ?auto_374794 ) ) ( not ( = ?auto_374793 ?auto_374795 ) ) ( not ( = ?auto_374793 ?auto_374796 ) ) ( not ( = ?auto_374793 ?auto_374797 ) ) ( not ( = ?auto_374793 ?auto_374798 ) ) ( not ( = ?auto_374793 ?auto_374799 ) ) ( not ( = ?auto_374794 ?auto_374795 ) ) ( not ( = ?auto_374794 ?auto_374796 ) ) ( not ( = ?auto_374794 ?auto_374797 ) ) ( not ( = ?auto_374794 ?auto_374798 ) ) ( not ( = ?auto_374794 ?auto_374799 ) ) ( not ( = ?auto_374795 ?auto_374796 ) ) ( not ( = ?auto_374795 ?auto_374797 ) ) ( not ( = ?auto_374795 ?auto_374798 ) ) ( not ( = ?auto_374795 ?auto_374799 ) ) ( not ( = ?auto_374796 ?auto_374797 ) ) ( not ( = ?auto_374796 ?auto_374798 ) ) ( not ( = ?auto_374796 ?auto_374799 ) ) ( not ( = ?auto_374797 ?auto_374798 ) ) ( not ( = ?auto_374797 ?auto_374799 ) ) ( not ( = ?auto_374798 ?auto_374799 ) ) ( ON ?auto_374797 ?auto_374798 ) ( ON ?auto_374796 ?auto_374797 ) ( ON ?auto_374795 ?auto_374796 ) ( CLEAR ?auto_374793 ) ( ON ?auto_374794 ?auto_374795 ) ( CLEAR ?auto_374794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_374785 ?auto_374786 ?auto_374787 ?auto_374788 ?auto_374789 ?auto_374790 ?auto_374791 ?auto_374792 ?auto_374793 ?auto_374794 )
      ( MAKE-14PILE ?auto_374785 ?auto_374786 ?auto_374787 ?auto_374788 ?auto_374789 ?auto_374790 ?auto_374791 ?auto_374792 ?auto_374793 ?auto_374794 ?auto_374795 ?auto_374796 ?auto_374797 ?auto_374798 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374814 - BLOCK
      ?auto_374815 - BLOCK
      ?auto_374816 - BLOCK
      ?auto_374817 - BLOCK
      ?auto_374818 - BLOCK
      ?auto_374819 - BLOCK
      ?auto_374820 - BLOCK
      ?auto_374821 - BLOCK
      ?auto_374822 - BLOCK
      ?auto_374823 - BLOCK
      ?auto_374824 - BLOCK
      ?auto_374825 - BLOCK
      ?auto_374826 - BLOCK
      ?auto_374827 - BLOCK
    )
    :vars
    (
      ?auto_374828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374827 ?auto_374828 ) ( ON-TABLE ?auto_374814 ) ( ON ?auto_374815 ?auto_374814 ) ( ON ?auto_374816 ?auto_374815 ) ( ON ?auto_374817 ?auto_374816 ) ( ON ?auto_374818 ?auto_374817 ) ( ON ?auto_374819 ?auto_374818 ) ( ON ?auto_374820 ?auto_374819 ) ( ON ?auto_374821 ?auto_374820 ) ( not ( = ?auto_374814 ?auto_374815 ) ) ( not ( = ?auto_374814 ?auto_374816 ) ) ( not ( = ?auto_374814 ?auto_374817 ) ) ( not ( = ?auto_374814 ?auto_374818 ) ) ( not ( = ?auto_374814 ?auto_374819 ) ) ( not ( = ?auto_374814 ?auto_374820 ) ) ( not ( = ?auto_374814 ?auto_374821 ) ) ( not ( = ?auto_374814 ?auto_374822 ) ) ( not ( = ?auto_374814 ?auto_374823 ) ) ( not ( = ?auto_374814 ?auto_374824 ) ) ( not ( = ?auto_374814 ?auto_374825 ) ) ( not ( = ?auto_374814 ?auto_374826 ) ) ( not ( = ?auto_374814 ?auto_374827 ) ) ( not ( = ?auto_374814 ?auto_374828 ) ) ( not ( = ?auto_374815 ?auto_374816 ) ) ( not ( = ?auto_374815 ?auto_374817 ) ) ( not ( = ?auto_374815 ?auto_374818 ) ) ( not ( = ?auto_374815 ?auto_374819 ) ) ( not ( = ?auto_374815 ?auto_374820 ) ) ( not ( = ?auto_374815 ?auto_374821 ) ) ( not ( = ?auto_374815 ?auto_374822 ) ) ( not ( = ?auto_374815 ?auto_374823 ) ) ( not ( = ?auto_374815 ?auto_374824 ) ) ( not ( = ?auto_374815 ?auto_374825 ) ) ( not ( = ?auto_374815 ?auto_374826 ) ) ( not ( = ?auto_374815 ?auto_374827 ) ) ( not ( = ?auto_374815 ?auto_374828 ) ) ( not ( = ?auto_374816 ?auto_374817 ) ) ( not ( = ?auto_374816 ?auto_374818 ) ) ( not ( = ?auto_374816 ?auto_374819 ) ) ( not ( = ?auto_374816 ?auto_374820 ) ) ( not ( = ?auto_374816 ?auto_374821 ) ) ( not ( = ?auto_374816 ?auto_374822 ) ) ( not ( = ?auto_374816 ?auto_374823 ) ) ( not ( = ?auto_374816 ?auto_374824 ) ) ( not ( = ?auto_374816 ?auto_374825 ) ) ( not ( = ?auto_374816 ?auto_374826 ) ) ( not ( = ?auto_374816 ?auto_374827 ) ) ( not ( = ?auto_374816 ?auto_374828 ) ) ( not ( = ?auto_374817 ?auto_374818 ) ) ( not ( = ?auto_374817 ?auto_374819 ) ) ( not ( = ?auto_374817 ?auto_374820 ) ) ( not ( = ?auto_374817 ?auto_374821 ) ) ( not ( = ?auto_374817 ?auto_374822 ) ) ( not ( = ?auto_374817 ?auto_374823 ) ) ( not ( = ?auto_374817 ?auto_374824 ) ) ( not ( = ?auto_374817 ?auto_374825 ) ) ( not ( = ?auto_374817 ?auto_374826 ) ) ( not ( = ?auto_374817 ?auto_374827 ) ) ( not ( = ?auto_374817 ?auto_374828 ) ) ( not ( = ?auto_374818 ?auto_374819 ) ) ( not ( = ?auto_374818 ?auto_374820 ) ) ( not ( = ?auto_374818 ?auto_374821 ) ) ( not ( = ?auto_374818 ?auto_374822 ) ) ( not ( = ?auto_374818 ?auto_374823 ) ) ( not ( = ?auto_374818 ?auto_374824 ) ) ( not ( = ?auto_374818 ?auto_374825 ) ) ( not ( = ?auto_374818 ?auto_374826 ) ) ( not ( = ?auto_374818 ?auto_374827 ) ) ( not ( = ?auto_374818 ?auto_374828 ) ) ( not ( = ?auto_374819 ?auto_374820 ) ) ( not ( = ?auto_374819 ?auto_374821 ) ) ( not ( = ?auto_374819 ?auto_374822 ) ) ( not ( = ?auto_374819 ?auto_374823 ) ) ( not ( = ?auto_374819 ?auto_374824 ) ) ( not ( = ?auto_374819 ?auto_374825 ) ) ( not ( = ?auto_374819 ?auto_374826 ) ) ( not ( = ?auto_374819 ?auto_374827 ) ) ( not ( = ?auto_374819 ?auto_374828 ) ) ( not ( = ?auto_374820 ?auto_374821 ) ) ( not ( = ?auto_374820 ?auto_374822 ) ) ( not ( = ?auto_374820 ?auto_374823 ) ) ( not ( = ?auto_374820 ?auto_374824 ) ) ( not ( = ?auto_374820 ?auto_374825 ) ) ( not ( = ?auto_374820 ?auto_374826 ) ) ( not ( = ?auto_374820 ?auto_374827 ) ) ( not ( = ?auto_374820 ?auto_374828 ) ) ( not ( = ?auto_374821 ?auto_374822 ) ) ( not ( = ?auto_374821 ?auto_374823 ) ) ( not ( = ?auto_374821 ?auto_374824 ) ) ( not ( = ?auto_374821 ?auto_374825 ) ) ( not ( = ?auto_374821 ?auto_374826 ) ) ( not ( = ?auto_374821 ?auto_374827 ) ) ( not ( = ?auto_374821 ?auto_374828 ) ) ( not ( = ?auto_374822 ?auto_374823 ) ) ( not ( = ?auto_374822 ?auto_374824 ) ) ( not ( = ?auto_374822 ?auto_374825 ) ) ( not ( = ?auto_374822 ?auto_374826 ) ) ( not ( = ?auto_374822 ?auto_374827 ) ) ( not ( = ?auto_374822 ?auto_374828 ) ) ( not ( = ?auto_374823 ?auto_374824 ) ) ( not ( = ?auto_374823 ?auto_374825 ) ) ( not ( = ?auto_374823 ?auto_374826 ) ) ( not ( = ?auto_374823 ?auto_374827 ) ) ( not ( = ?auto_374823 ?auto_374828 ) ) ( not ( = ?auto_374824 ?auto_374825 ) ) ( not ( = ?auto_374824 ?auto_374826 ) ) ( not ( = ?auto_374824 ?auto_374827 ) ) ( not ( = ?auto_374824 ?auto_374828 ) ) ( not ( = ?auto_374825 ?auto_374826 ) ) ( not ( = ?auto_374825 ?auto_374827 ) ) ( not ( = ?auto_374825 ?auto_374828 ) ) ( not ( = ?auto_374826 ?auto_374827 ) ) ( not ( = ?auto_374826 ?auto_374828 ) ) ( not ( = ?auto_374827 ?auto_374828 ) ) ( ON ?auto_374826 ?auto_374827 ) ( ON ?auto_374825 ?auto_374826 ) ( ON ?auto_374824 ?auto_374825 ) ( ON ?auto_374823 ?auto_374824 ) ( CLEAR ?auto_374821 ) ( ON ?auto_374822 ?auto_374823 ) ( CLEAR ?auto_374822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_374814 ?auto_374815 ?auto_374816 ?auto_374817 ?auto_374818 ?auto_374819 ?auto_374820 ?auto_374821 ?auto_374822 )
      ( MAKE-14PILE ?auto_374814 ?auto_374815 ?auto_374816 ?auto_374817 ?auto_374818 ?auto_374819 ?auto_374820 ?auto_374821 ?auto_374822 ?auto_374823 ?auto_374824 ?auto_374825 ?auto_374826 ?auto_374827 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374843 - BLOCK
      ?auto_374844 - BLOCK
      ?auto_374845 - BLOCK
      ?auto_374846 - BLOCK
      ?auto_374847 - BLOCK
      ?auto_374848 - BLOCK
      ?auto_374849 - BLOCK
      ?auto_374850 - BLOCK
      ?auto_374851 - BLOCK
      ?auto_374852 - BLOCK
      ?auto_374853 - BLOCK
      ?auto_374854 - BLOCK
      ?auto_374855 - BLOCK
      ?auto_374856 - BLOCK
    )
    :vars
    (
      ?auto_374857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374856 ?auto_374857 ) ( ON-TABLE ?auto_374843 ) ( ON ?auto_374844 ?auto_374843 ) ( ON ?auto_374845 ?auto_374844 ) ( ON ?auto_374846 ?auto_374845 ) ( ON ?auto_374847 ?auto_374846 ) ( ON ?auto_374848 ?auto_374847 ) ( ON ?auto_374849 ?auto_374848 ) ( ON ?auto_374850 ?auto_374849 ) ( not ( = ?auto_374843 ?auto_374844 ) ) ( not ( = ?auto_374843 ?auto_374845 ) ) ( not ( = ?auto_374843 ?auto_374846 ) ) ( not ( = ?auto_374843 ?auto_374847 ) ) ( not ( = ?auto_374843 ?auto_374848 ) ) ( not ( = ?auto_374843 ?auto_374849 ) ) ( not ( = ?auto_374843 ?auto_374850 ) ) ( not ( = ?auto_374843 ?auto_374851 ) ) ( not ( = ?auto_374843 ?auto_374852 ) ) ( not ( = ?auto_374843 ?auto_374853 ) ) ( not ( = ?auto_374843 ?auto_374854 ) ) ( not ( = ?auto_374843 ?auto_374855 ) ) ( not ( = ?auto_374843 ?auto_374856 ) ) ( not ( = ?auto_374843 ?auto_374857 ) ) ( not ( = ?auto_374844 ?auto_374845 ) ) ( not ( = ?auto_374844 ?auto_374846 ) ) ( not ( = ?auto_374844 ?auto_374847 ) ) ( not ( = ?auto_374844 ?auto_374848 ) ) ( not ( = ?auto_374844 ?auto_374849 ) ) ( not ( = ?auto_374844 ?auto_374850 ) ) ( not ( = ?auto_374844 ?auto_374851 ) ) ( not ( = ?auto_374844 ?auto_374852 ) ) ( not ( = ?auto_374844 ?auto_374853 ) ) ( not ( = ?auto_374844 ?auto_374854 ) ) ( not ( = ?auto_374844 ?auto_374855 ) ) ( not ( = ?auto_374844 ?auto_374856 ) ) ( not ( = ?auto_374844 ?auto_374857 ) ) ( not ( = ?auto_374845 ?auto_374846 ) ) ( not ( = ?auto_374845 ?auto_374847 ) ) ( not ( = ?auto_374845 ?auto_374848 ) ) ( not ( = ?auto_374845 ?auto_374849 ) ) ( not ( = ?auto_374845 ?auto_374850 ) ) ( not ( = ?auto_374845 ?auto_374851 ) ) ( not ( = ?auto_374845 ?auto_374852 ) ) ( not ( = ?auto_374845 ?auto_374853 ) ) ( not ( = ?auto_374845 ?auto_374854 ) ) ( not ( = ?auto_374845 ?auto_374855 ) ) ( not ( = ?auto_374845 ?auto_374856 ) ) ( not ( = ?auto_374845 ?auto_374857 ) ) ( not ( = ?auto_374846 ?auto_374847 ) ) ( not ( = ?auto_374846 ?auto_374848 ) ) ( not ( = ?auto_374846 ?auto_374849 ) ) ( not ( = ?auto_374846 ?auto_374850 ) ) ( not ( = ?auto_374846 ?auto_374851 ) ) ( not ( = ?auto_374846 ?auto_374852 ) ) ( not ( = ?auto_374846 ?auto_374853 ) ) ( not ( = ?auto_374846 ?auto_374854 ) ) ( not ( = ?auto_374846 ?auto_374855 ) ) ( not ( = ?auto_374846 ?auto_374856 ) ) ( not ( = ?auto_374846 ?auto_374857 ) ) ( not ( = ?auto_374847 ?auto_374848 ) ) ( not ( = ?auto_374847 ?auto_374849 ) ) ( not ( = ?auto_374847 ?auto_374850 ) ) ( not ( = ?auto_374847 ?auto_374851 ) ) ( not ( = ?auto_374847 ?auto_374852 ) ) ( not ( = ?auto_374847 ?auto_374853 ) ) ( not ( = ?auto_374847 ?auto_374854 ) ) ( not ( = ?auto_374847 ?auto_374855 ) ) ( not ( = ?auto_374847 ?auto_374856 ) ) ( not ( = ?auto_374847 ?auto_374857 ) ) ( not ( = ?auto_374848 ?auto_374849 ) ) ( not ( = ?auto_374848 ?auto_374850 ) ) ( not ( = ?auto_374848 ?auto_374851 ) ) ( not ( = ?auto_374848 ?auto_374852 ) ) ( not ( = ?auto_374848 ?auto_374853 ) ) ( not ( = ?auto_374848 ?auto_374854 ) ) ( not ( = ?auto_374848 ?auto_374855 ) ) ( not ( = ?auto_374848 ?auto_374856 ) ) ( not ( = ?auto_374848 ?auto_374857 ) ) ( not ( = ?auto_374849 ?auto_374850 ) ) ( not ( = ?auto_374849 ?auto_374851 ) ) ( not ( = ?auto_374849 ?auto_374852 ) ) ( not ( = ?auto_374849 ?auto_374853 ) ) ( not ( = ?auto_374849 ?auto_374854 ) ) ( not ( = ?auto_374849 ?auto_374855 ) ) ( not ( = ?auto_374849 ?auto_374856 ) ) ( not ( = ?auto_374849 ?auto_374857 ) ) ( not ( = ?auto_374850 ?auto_374851 ) ) ( not ( = ?auto_374850 ?auto_374852 ) ) ( not ( = ?auto_374850 ?auto_374853 ) ) ( not ( = ?auto_374850 ?auto_374854 ) ) ( not ( = ?auto_374850 ?auto_374855 ) ) ( not ( = ?auto_374850 ?auto_374856 ) ) ( not ( = ?auto_374850 ?auto_374857 ) ) ( not ( = ?auto_374851 ?auto_374852 ) ) ( not ( = ?auto_374851 ?auto_374853 ) ) ( not ( = ?auto_374851 ?auto_374854 ) ) ( not ( = ?auto_374851 ?auto_374855 ) ) ( not ( = ?auto_374851 ?auto_374856 ) ) ( not ( = ?auto_374851 ?auto_374857 ) ) ( not ( = ?auto_374852 ?auto_374853 ) ) ( not ( = ?auto_374852 ?auto_374854 ) ) ( not ( = ?auto_374852 ?auto_374855 ) ) ( not ( = ?auto_374852 ?auto_374856 ) ) ( not ( = ?auto_374852 ?auto_374857 ) ) ( not ( = ?auto_374853 ?auto_374854 ) ) ( not ( = ?auto_374853 ?auto_374855 ) ) ( not ( = ?auto_374853 ?auto_374856 ) ) ( not ( = ?auto_374853 ?auto_374857 ) ) ( not ( = ?auto_374854 ?auto_374855 ) ) ( not ( = ?auto_374854 ?auto_374856 ) ) ( not ( = ?auto_374854 ?auto_374857 ) ) ( not ( = ?auto_374855 ?auto_374856 ) ) ( not ( = ?auto_374855 ?auto_374857 ) ) ( not ( = ?auto_374856 ?auto_374857 ) ) ( ON ?auto_374855 ?auto_374856 ) ( ON ?auto_374854 ?auto_374855 ) ( ON ?auto_374853 ?auto_374854 ) ( ON ?auto_374852 ?auto_374853 ) ( CLEAR ?auto_374850 ) ( ON ?auto_374851 ?auto_374852 ) ( CLEAR ?auto_374851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_374843 ?auto_374844 ?auto_374845 ?auto_374846 ?auto_374847 ?auto_374848 ?auto_374849 ?auto_374850 ?auto_374851 )
      ( MAKE-14PILE ?auto_374843 ?auto_374844 ?auto_374845 ?auto_374846 ?auto_374847 ?auto_374848 ?auto_374849 ?auto_374850 ?auto_374851 ?auto_374852 ?auto_374853 ?auto_374854 ?auto_374855 ?auto_374856 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374872 - BLOCK
      ?auto_374873 - BLOCK
      ?auto_374874 - BLOCK
      ?auto_374875 - BLOCK
      ?auto_374876 - BLOCK
      ?auto_374877 - BLOCK
      ?auto_374878 - BLOCK
      ?auto_374879 - BLOCK
      ?auto_374880 - BLOCK
      ?auto_374881 - BLOCK
      ?auto_374882 - BLOCK
      ?auto_374883 - BLOCK
      ?auto_374884 - BLOCK
      ?auto_374885 - BLOCK
    )
    :vars
    (
      ?auto_374886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374885 ?auto_374886 ) ( ON-TABLE ?auto_374872 ) ( ON ?auto_374873 ?auto_374872 ) ( ON ?auto_374874 ?auto_374873 ) ( ON ?auto_374875 ?auto_374874 ) ( ON ?auto_374876 ?auto_374875 ) ( ON ?auto_374877 ?auto_374876 ) ( ON ?auto_374878 ?auto_374877 ) ( not ( = ?auto_374872 ?auto_374873 ) ) ( not ( = ?auto_374872 ?auto_374874 ) ) ( not ( = ?auto_374872 ?auto_374875 ) ) ( not ( = ?auto_374872 ?auto_374876 ) ) ( not ( = ?auto_374872 ?auto_374877 ) ) ( not ( = ?auto_374872 ?auto_374878 ) ) ( not ( = ?auto_374872 ?auto_374879 ) ) ( not ( = ?auto_374872 ?auto_374880 ) ) ( not ( = ?auto_374872 ?auto_374881 ) ) ( not ( = ?auto_374872 ?auto_374882 ) ) ( not ( = ?auto_374872 ?auto_374883 ) ) ( not ( = ?auto_374872 ?auto_374884 ) ) ( not ( = ?auto_374872 ?auto_374885 ) ) ( not ( = ?auto_374872 ?auto_374886 ) ) ( not ( = ?auto_374873 ?auto_374874 ) ) ( not ( = ?auto_374873 ?auto_374875 ) ) ( not ( = ?auto_374873 ?auto_374876 ) ) ( not ( = ?auto_374873 ?auto_374877 ) ) ( not ( = ?auto_374873 ?auto_374878 ) ) ( not ( = ?auto_374873 ?auto_374879 ) ) ( not ( = ?auto_374873 ?auto_374880 ) ) ( not ( = ?auto_374873 ?auto_374881 ) ) ( not ( = ?auto_374873 ?auto_374882 ) ) ( not ( = ?auto_374873 ?auto_374883 ) ) ( not ( = ?auto_374873 ?auto_374884 ) ) ( not ( = ?auto_374873 ?auto_374885 ) ) ( not ( = ?auto_374873 ?auto_374886 ) ) ( not ( = ?auto_374874 ?auto_374875 ) ) ( not ( = ?auto_374874 ?auto_374876 ) ) ( not ( = ?auto_374874 ?auto_374877 ) ) ( not ( = ?auto_374874 ?auto_374878 ) ) ( not ( = ?auto_374874 ?auto_374879 ) ) ( not ( = ?auto_374874 ?auto_374880 ) ) ( not ( = ?auto_374874 ?auto_374881 ) ) ( not ( = ?auto_374874 ?auto_374882 ) ) ( not ( = ?auto_374874 ?auto_374883 ) ) ( not ( = ?auto_374874 ?auto_374884 ) ) ( not ( = ?auto_374874 ?auto_374885 ) ) ( not ( = ?auto_374874 ?auto_374886 ) ) ( not ( = ?auto_374875 ?auto_374876 ) ) ( not ( = ?auto_374875 ?auto_374877 ) ) ( not ( = ?auto_374875 ?auto_374878 ) ) ( not ( = ?auto_374875 ?auto_374879 ) ) ( not ( = ?auto_374875 ?auto_374880 ) ) ( not ( = ?auto_374875 ?auto_374881 ) ) ( not ( = ?auto_374875 ?auto_374882 ) ) ( not ( = ?auto_374875 ?auto_374883 ) ) ( not ( = ?auto_374875 ?auto_374884 ) ) ( not ( = ?auto_374875 ?auto_374885 ) ) ( not ( = ?auto_374875 ?auto_374886 ) ) ( not ( = ?auto_374876 ?auto_374877 ) ) ( not ( = ?auto_374876 ?auto_374878 ) ) ( not ( = ?auto_374876 ?auto_374879 ) ) ( not ( = ?auto_374876 ?auto_374880 ) ) ( not ( = ?auto_374876 ?auto_374881 ) ) ( not ( = ?auto_374876 ?auto_374882 ) ) ( not ( = ?auto_374876 ?auto_374883 ) ) ( not ( = ?auto_374876 ?auto_374884 ) ) ( not ( = ?auto_374876 ?auto_374885 ) ) ( not ( = ?auto_374876 ?auto_374886 ) ) ( not ( = ?auto_374877 ?auto_374878 ) ) ( not ( = ?auto_374877 ?auto_374879 ) ) ( not ( = ?auto_374877 ?auto_374880 ) ) ( not ( = ?auto_374877 ?auto_374881 ) ) ( not ( = ?auto_374877 ?auto_374882 ) ) ( not ( = ?auto_374877 ?auto_374883 ) ) ( not ( = ?auto_374877 ?auto_374884 ) ) ( not ( = ?auto_374877 ?auto_374885 ) ) ( not ( = ?auto_374877 ?auto_374886 ) ) ( not ( = ?auto_374878 ?auto_374879 ) ) ( not ( = ?auto_374878 ?auto_374880 ) ) ( not ( = ?auto_374878 ?auto_374881 ) ) ( not ( = ?auto_374878 ?auto_374882 ) ) ( not ( = ?auto_374878 ?auto_374883 ) ) ( not ( = ?auto_374878 ?auto_374884 ) ) ( not ( = ?auto_374878 ?auto_374885 ) ) ( not ( = ?auto_374878 ?auto_374886 ) ) ( not ( = ?auto_374879 ?auto_374880 ) ) ( not ( = ?auto_374879 ?auto_374881 ) ) ( not ( = ?auto_374879 ?auto_374882 ) ) ( not ( = ?auto_374879 ?auto_374883 ) ) ( not ( = ?auto_374879 ?auto_374884 ) ) ( not ( = ?auto_374879 ?auto_374885 ) ) ( not ( = ?auto_374879 ?auto_374886 ) ) ( not ( = ?auto_374880 ?auto_374881 ) ) ( not ( = ?auto_374880 ?auto_374882 ) ) ( not ( = ?auto_374880 ?auto_374883 ) ) ( not ( = ?auto_374880 ?auto_374884 ) ) ( not ( = ?auto_374880 ?auto_374885 ) ) ( not ( = ?auto_374880 ?auto_374886 ) ) ( not ( = ?auto_374881 ?auto_374882 ) ) ( not ( = ?auto_374881 ?auto_374883 ) ) ( not ( = ?auto_374881 ?auto_374884 ) ) ( not ( = ?auto_374881 ?auto_374885 ) ) ( not ( = ?auto_374881 ?auto_374886 ) ) ( not ( = ?auto_374882 ?auto_374883 ) ) ( not ( = ?auto_374882 ?auto_374884 ) ) ( not ( = ?auto_374882 ?auto_374885 ) ) ( not ( = ?auto_374882 ?auto_374886 ) ) ( not ( = ?auto_374883 ?auto_374884 ) ) ( not ( = ?auto_374883 ?auto_374885 ) ) ( not ( = ?auto_374883 ?auto_374886 ) ) ( not ( = ?auto_374884 ?auto_374885 ) ) ( not ( = ?auto_374884 ?auto_374886 ) ) ( not ( = ?auto_374885 ?auto_374886 ) ) ( ON ?auto_374884 ?auto_374885 ) ( ON ?auto_374883 ?auto_374884 ) ( ON ?auto_374882 ?auto_374883 ) ( ON ?auto_374881 ?auto_374882 ) ( ON ?auto_374880 ?auto_374881 ) ( CLEAR ?auto_374878 ) ( ON ?auto_374879 ?auto_374880 ) ( CLEAR ?auto_374879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_374872 ?auto_374873 ?auto_374874 ?auto_374875 ?auto_374876 ?auto_374877 ?auto_374878 ?auto_374879 )
      ( MAKE-14PILE ?auto_374872 ?auto_374873 ?auto_374874 ?auto_374875 ?auto_374876 ?auto_374877 ?auto_374878 ?auto_374879 ?auto_374880 ?auto_374881 ?auto_374882 ?auto_374883 ?auto_374884 ?auto_374885 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374901 - BLOCK
      ?auto_374902 - BLOCK
      ?auto_374903 - BLOCK
      ?auto_374904 - BLOCK
      ?auto_374905 - BLOCK
      ?auto_374906 - BLOCK
      ?auto_374907 - BLOCK
      ?auto_374908 - BLOCK
      ?auto_374909 - BLOCK
      ?auto_374910 - BLOCK
      ?auto_374911 - BLOCK
      ?auto_374912 - BLOCK
      ?auto_374913 - BLOCK
      ?auto_374914 - BLOCK
    )
    :vars
    (
      ?auto_374915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374914 ?auto_374915 ) ( ON-TABLE ?auto_374901 ) ( ON ?auto_374902 ?auto_374901 ) ( ON ?auto_374903 ?auto_374902 ) ( ON ?auto_374904 ?auto_374903 ) ( ON ?auto_374905 ?auto_374904 ) ( ON ?auto_374906 ?auto_374905 ) ( ON ?auto_374907 ?auto_374906 ) ( not ( = ?auto_374901 ?auto_374902 ) ) ( not ( = ?auto_374901 ?auto_374903 ) ) ( not ( = ?auto_374901 ?auto_374904 ) ) ( not ( = ?auto_374901 ?auto_374905 ) ) ( not ( = ?auto_374901 ?auto_374906 ) ) ( not ( = ?auto_374901 ?auto_374907 ) ) ( not ( = ?auto_374901 ?auto_374908 ) ) ( not ( = ?auto_374901 ?auto_374909 ) ) ( not ( = ?auto_374901 ?auto_374910 ) ) ( not ( = ?auto_374901 ?auto_374911 ) ) ( not ( = ?auto_374901 ?auto_374912 ) ) ( not ( = ?auto_374901 ?auto_374913 ) ) ( not ( = ?auto_374901 ?auto_374914 ) ) ( not ( = ?auto_374901 ?auto_374915 ) ) ( not ( = ?auto_374902 ?auto_374903 ) ) ( not ( = ?auto_374902 ?auto_374904 ) ) ( not ( = ?auto_374902 ?auto_374905 ) ) ( not ( = ?auto_374902 ?auto_374906 ) ) ( not ( = ?auto_374902 ?auto_374907 ) ) ( not ( = ?auto_374902 ?auto_374908 ) ) ( not ( = ?auto_374902 ?auto_374909 ) ) ( not ( = ?auto_374902 ?auto_374910 ) ) ( not ( = ?auto_374902 ?auto_374911 ) ) ( not ( = ?auto_374902 ?auto_374912 ) ) ( not ( = ?auto_374902 ?auto_374913 ) ) ( not ( = ?auto_374902 ?auto_374914 ) ) ( not ( = ?auto_374902 ?auto_374915 ) ) ( not ( = ?auto_374903 ?auto_374904 ) ) ( not ( = ?auto_374903 ?auto_374905 ) ) ( not ( = ?auto_374903 ?auto_374906 ) ) ( not ( = ?auto_374903 ?auto_374907 ) ) ( not ( = ?auto_374903 ?auto_374908 ) ) ( not ( = ?auto_374903 ?auto_374909 ) ) ( not ( = ?auto_374903 ?auto_374910 ) ) ( not ( = ?auto_374903 ?auto_374911 ) ) ( not ( = ?auto_374903 ?auto_374912 ) ) ( not ( = ?auto_374903 ?auto_374913 ) ) ( not ( = ?auto_374903 ?auto_374914 ) ) ( not ( = ?auto_374903 ?auto_374915 ) ) ( not ( = ?auto_374904 ?auto_374905 ) ) ( not ( = ?auto_374904 ?auto_374906 ) ) ( not ( = ?auto_374904 ?auto_374907 ) ) ( not ( = ?auto_374904 ?auto_374908 ) ) ( not ( = ?auto_374904 ?auto_374909 ) ) ( not ( = ?auto_374904 ?auto_374910 ) ) ( not ( = ?auto_374904 ?auto_374911 ) ) ( not ( = ?auto_374904 ?auto_374912 ) ) ( not ( = ?auto_374904 ?auto_374913 ) ) ( not ( = ?auto_374904 ?auto_374914 ) ) ( not ( = ?auto_374904 ?auto_374915 ) ) ( not ( = ?auto_374905 ?auto_374906 ) ) ( not ( = ?auto_374905 ?auto_374907 ) ) ( not ( = ?auto_374905 ?auto_374908 ) ) ( not ( = ?auto_374905 ?auto_374909 ) ) ( not ( = ?auto_374905 ?auto_374910 ) ) ( not ( = ?auto_374905 ?auto_374911 ) ) ( not ( = ?auto_374905 ?auto_374912 ) ) ( not ( = ?auto_374905 ?auto_374913 ) ) ( not ( = ?auto_374905 ?auto_374914 ) ) ( not ( = ?auto_374905 ?auto_374915 ) ) ( not ( = ?auto_374906 ?auto_374907 ) ) ( not ( = ?auto_374906 ?auto_374908 ) ) ( not ( = ?auto_374906 ?auto_374909 ) ) ( not ( = ?auto_374906 ?auto_374910 ) ) ( not ( = ?auto_374906 ?auto_374911 ) ) ( not ( = ?auto_374906 ?auto_374912 ) ) ( not ( = ?auto_374906 ?auto_374913 ) ) ( not ( = ?auto_374906 ?auto_374914 ) ) ( not ( = ?auto_374906 ?auto_374915 ) ) ( not ( = ?auto_374907 ?auto_374908 ) ) ( not ( = ?auto_374907 ?auto_374909 ) ) ( not ( = ?auto_374907 ?auto_374910 ) ) ( not ( = ?auto_374907 ?auto_374911 ) ) ( not ( = ?auto_374907 ?auto_374912 ) ) ( not ( = ?auto_374907 ?auto_374913 ) ) ( not ( = ?auto_374907 ?auto_374914 ) ) ( not ( = ?auto_374907 ?auto_374915 ) ) ( not ( = ?auto_374908 ?auto_374909 ) ) ( not ( = ?auto_374908 ?auto_374910 ) ) ( not ( = ?auto_374908 ?auto_374911 ) ) ( not ( = ?auto_374908 ?auto_374912 ) ) ( not ( = ?auto_374908 ?auto_374913 ) ) ( not ( = ?auto_374908 ?auto_374914 ) ) ( not ( = ?auto_374908 ?auto_374915 ) ) ( not ( = ?auto_374909 ?auto_374910 ) ) ( not ( = ?auto_374909 ?auto_374911 ) ) ( not ( = ?auto_374909 ?auto_374912 ) ) ( not ( = ?auto_374909 ?auto_374913 ) ) ( not ( = ?auto_374909 ?auto_374914 ) ) ( not ( = ?auto_374909 ?auto_374915 ) ) ( not ( = ?auto_374910 ?auto_374911 ) ) ( not ( = ?auto_374910 ?auto_374912 ) ) ( not ( = ?auto_374910 ?auto_374913 ) ) ( not ( = ?auto_374910 ?auto_374914 ) ) ( not ( = ?auto_374910 ?auto_374915 ) ) ( not ( = ?auto_374911 ?auto_374912 ) ) ( not ( = ?auto_374911 ?auto_374913 ) ) ( not ( = ?auto_374911 ?auto_374914 ) ) ( not ( = ?auto_374911 ?auto_374915 ) ) ( not ( = ?auto_374912 ?auto_374913 ) ) ( not ( = ?auto_374912 ?auto_374914 ) ) ( not ( = ?auto_374912 ?auto_374915 ) ) ( not ( = ?auto_374913 ?auto_374914 ) ) ( not ( = ?auto_374913 ?auto_374915 ) ) ( not ( = ?auto_374914 ?auto_374915 ) ) ( ON ?auto_374913 ?auto_374914 ) ( ON ?auto_374912 ?auto_374913 ) ( ON ?auto_374911 ?auto_374912 ) ( ON ?auto_374910 ?auto_374911 ) ( ON ?auto_374909 ?auto_374910 ) ( CLEAR ?auto_374907 ) ( ON ?auto_374908 ?auto_374909 ) ( CLEAR ?auto_374908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_374901 ?auto_374902 ?auto_374903 ?auto_374904 ?auto_374905 ?auto_374906 ?auto_374907 ?auto_374908 )
      ( MAKE-14PILE ?auto_374901 ?auto_374902 ?auto_374903 ?auto_374904 ?auto_374905 ?auto_374906 ?auto_374907 ?auto_374908 ?auto_374909 ?auto_374910 ?auto_374911 ?auto_374912 ?auto_374913 ?auto_374914 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374930 - BLOCK
      ?auto_374931 - BLOCK
      ?auto_374932 - BLOCK
      ?auto_374933 - BLOCK
      ?auto_374934 - BLOCK
      ?auto_374935 - BLOCK
      ?auto_374936 - BLOCK
      ?auto_374937 - BLOCK
      ?auto_374938 - BLOCK
      ?auto_374939 - BLOCK
      ?auto_374940 - BLOCK
      ?auto_374941 - BLOCK
      ?auto_374942 - BLOCK
      ?auto_374943 - BLOCK
    )
    :vars
    (
      ?auto_374944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374943 ?auto_374944 ) ( ON-TABLE ?auto_374930 ) ( ON ?auto_374931 ?auto_374930 ) ( ON ?auto_374932 ?auto_374931 ) ( ON ?auto_374933 ?auto_374932 ) ( ON ?auto_374934 ?auto_374933 ) ( ON ?auto_374935 ?auto_374934 ) ( not ( = ?auto_374930 ?auto_374931 ) ) ( not ( = ?auto_374930 ?auto_374932 ) ) ( not ( = ?auto_374930 ?auto_374933 ) ) ( not ( = ?auto_374930 ?auto_374934 ) ) ( not ( = ?auto_374930 ?auto_374935 ) ) ( not ( = ?auto_374930 ?auto_374936 ) ) ( not ( = ?auto_374930 ?auto_374937 ) ) ( not ( = ?auto_374930 ?auto_374938 ) ) ( not ( = ?auto_374930 ?auto_374939 ) ) ( not ( = ?auto_374930 ?auto_374940 ) ) ( not ( = ?auto_374930 ?auto_374941 ) ) ( not ( = ?auto_374930 ?auto_374942 ) ) ( not ( = ?auto_374930 ?auto_374943 ) ) ( not ( = ?auto_374930 ?auto_374944 ) ) ( not ( = ?auto_374931 ?auto_374932 ) ) ( not ( = ?auto_374931 ?auto_374933 ) ) ( not ( = ?auto_374931 ?auto_374934 ) ) ( not ( = ?auto_374931 ?auto_374935 ) ) ( not ( = ?auto_374931 ?auto_374936 ) ) ( not ( = ?auto_374931 ?auto_374937 ) ) ( not ( = ?auto_374931 ?auto_374938 ) ) ( not ( = ?auto_374931 ?auto_374939 ) ) ( not ( = ?auto_374931 ?auto_374940 ) ) ( not ( = ?auto_374931 ?auto_374941 ) ) ( not ( = ?auto_374931 ?auto_374942 ) ) ( not ( = ?auto_374931 ?auto_374943 ) ) ( not ( = ?auto_374931 ?auto_374944 ) ) ( not ( = ?auto_374932 ?auto_374933 ) ) ( not ( = ?auto_374932 ?auto_374934 ) ) ( not ( = ?auto_374932 ?auto_374935 ) ) ( not ( = ?auto_374932 ?auto_374936 ) ) ( not ( = ?auto_374932 ?auto_374937 ) ) ( not ( = ?auto_374932 ?auto_374938 ) ) ( not ( = ?auto_374932 ?auto_374939 ) ) ( not ( = ?auto_374932 ?auto_374940 ) ) ( not ( = ?auto_374932 ?auto_374941 ) ) ( not ( = ?auto_374932 ?auto_374942 ) ) ( not ( = ?auto_374932 ?auto_374943 ) ) ( not ( = ?auto_374932 ?auto_374944 ) ) ( not ( = ?auto_374933 ?auto_374934 ) ) ( not ( = ?auto_374933 ?auto_374935 ) ) ( not ( = ?auto_374933 ?auto_374936 ) ) ( not ( = ?auto_374933 ?auto_374937 ) ) ( not ( = ?auto_374933 ?auto_374938 ) ) ( not ( = ?auto_374933 ?auto_374939 ) ) ( not ( = ?auto_374933 ?auto_374940 ) ) ( not ( = ?auto_374933 ?auto_374941 ) ) ( not ( = ?auto_374933 ?auto_374942 ) ) ( not ( = ?auto_374933 ?auto_374943 ) ) ( not ( = ?auto_374933 ?auto_374944 ) ) ( not ( = ?auto_374934 ?auto_374935 ) ) ( not ( = ?auto_374934 ?auto_374936 ) ) ( not ( = ?auto_374934 ?auto_374937 ) ) ( not ( = ?auto_374934 ?auto_374938 ) ) ( not ( = ?auto_374934 ?auto_374939 ) ) ( not ( = ?auto_374934 ?auto_374940 ) ) ( not ( = ?auto_374934 ?auto_374941 ) ) ( not ( = ?auto_374934 ?auto_374942 ) ) ( not ( = ?auto_374934 ?auto_374943 ) ) ( not ( = ?auto_374934 ?auto_374944 ) ) ( not ( = ?auto_374935 ?auto_374936 ) ) ( not ( = ?auto_374935 ?auto_374937 ) ) ( not ( = ?auto_374935 ?auto_374938 ) ) ( not ( = ?auto_374935 ?auto_374939 ) ) ( not ( = ?auto_374935 ?auto_374940 ) ) ( not ( = ?auto_374935 ?auto_374941 ) ) ( not ( = ?auto_374935 ?auto_374942 ) ) ( not ( = ?auto_374935 ?auto_374943 ) ) ( not ( = ?auto_374935 ?auto_374944 ) ) ( not ( = ?auto_374936 ?auto_374937 ) ) ( not ( = ?auto_374936 ?auto_374938 ) ) ( not ( = ?auto_374936 ?auto_374939 ) ) ( not ( = ?auto_374936 ?auto_374940 ) ) ( not ( = ?auto_374936 ?auto_374941 ) ) ( not ( = ?auto_374936 ?auto_374942 ) ) ( not ( = ?auto_374936 ?auto_374943 ) ) ( not ( = ?auto_374936 ?auto_374944 ) ) ( not ( = ?auto_374937 ?auto_374938 ) ) ( not ( = ?auto_374937 ?auto_374939 ) ) ( not ( = ?auto_374937 ?auto_374940 ) ) ( not ( = ?auto_374937 ?auto_374941 ) ) ( not ( = ?auto_374937 ?auto_374942 ) ) ( not ( = ?auto_374937 ?auto_374943 ) ) ( not ( = ?auto_374937 ?auto_374944 ) ) ( not ( = ?auto_374938 ?auto_374939 ) ) ( not ( = ?auto_374938 ?auto_374940 ) ) ( not ( = ?auto_374938 ?auto_374941 ) ) ( not ( = ?auto_374938 ?auto_374942 ) ) ( not ( = ?auto_374938 ?auto_374943 ) ) ( not ( = ?auto_374938 ?auto_374944 ) ) ( not ( = ?auto_374939 ?auto_374940 ) ) ( not ( = ?auto_374939 ?auto_374941 ) ) ( not ( = ?auto_374939 ?auto_374942 ) ) ( not ( = ?auto_374939 ?auto_374943 ) ) ( not ( = ?auto_374939 ?auto_374944 ) ) ( not ( = ?auto_374940 ?auto_374941 ) ) ( not ( = ?auto_374940 ?auto_374942 ) ) ( not ( = ?auto_374940 ?auto_374943 ) ) ( not ( = ?auto_374940 ?auto_374944 ) ) ( not ( = ?auto_374941 ?auto_374942 ) ) ( not ( = ?auto_374941 ?auto_374943 ) ) ( not ( = ?auto_374941 ?auto_374944 ) ) ( not ( = ?auto_374942 ?auto_374943 ) ) ( not ( = ?auto_374942 ?auto_374944 ) ) ( not ( = ?auto_374943 ?auto_374944 ) ) ( ON ?auto_374942 ?auto_374943 ) ( ON ?auto_374941 ?auto_374942 ) ( ON ?auto_374940 ?auto_374941 ) ( ON ?auto_374939 ?auto_374940 ) ( ON ?auto_374938 ?auto_374939 ) ( ON ?auto_374937 ?auto_374938 ) ( CLEAR ?auto_374935 ) ( ON ?auto_374936 ?auto_374937 ) ( CLEAR ?auto_374936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_374930 ?auto_374931 ?auto_374932 ?auto_374933 ?auto_374934 ?auto_374935 ?auto_374936 )
      ( MAKE-14PILE ?auto_374930 ?auto_374931 ?auto_374932 ?auto_374933 ?auto_374934 ?auto_374935 ?auto_374936 ?auto_374937 ?auto_374938 ?auto_374939 ?auto_374940 ?auto_374941 ?auto_374942 ?auto_374943 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374959 - BLOCK
      ?auto_374960 - BLOCK
      ?auto_374961 - BLOCK
      ?auto_374962 - BLOCK
      ?auto_374963 - BLOCK
      ?auto_374964 - BLOCK
      ?auto_374965 - BLOCK
      ?auto_374966 - BLOCK
      ?auto_374967 - BLOCK
      ?auto_374968 - BLOCK
      ?auto_374969 - BLOCK
      ?auto_374970 - BLOCK
      ?auto_374971 - BLOCK
      ?auto_374972 - BLOCK
    )
    :vars
    (
      ?auto_374973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_374972 ?auto_374973 ) ( ON-TABLE ?auto_374959 ) ( ON ?auto_374960 ?auto_374959 ) ( ON ?auto_374961 ?auto_374960 ) ( ON ?auto_374962 ?auto_374961 ) ( ON ?auto_374963 ?auto_374962 ) ( ON ?auto_374964 ?auto_374963 ) ( not ( = ?auto_374959 ?auto_374960 ) ) ( not ( = ?auto_374959 ?auto_374961 ) ) ( not ( = ?auto_374959 ?auto_374962 ) ) ( not ( = ?auto_374959 ?auto_374963 ) ) ( not ( = ?auto_374959 ?auto_374964 ) ) ( not ( = ?auto_374959 ?auto_374965 ) ) ( not ( = ?auto_374959 ?auto_374966 ) ) ( not ( = ?auto_374959 ?auto_374967 ) ) ( not ( = ?auto_374959 ?auto_374968 ) ) ( not ( = ?auto_374959 ?auto_374969 ) ) ( not ( = ?auto_374959 ?auto_374970 ) ) ( not ( = ?auto_374959 ?auto_374971 ) ) ( not ( = ?auto_374959 ?auto_374972 ) ) ( not ( = ?auto_374959 ?auto_374973 ) ) ( not ( = ?auto_374960 ?auto_374961 ) ) ( not ( = ?auto_374960 ?auto_374962 ) ) ( not ( = ?auto_374960 ?auto_374963 ) ) ( not ( = ?auto_374960 ?auto_374964 ) ) ( not ( = ?auto_374960 ?auto_374965 ) ) ( not ( = ?auto_374960 ?auto_374966 ) ) ( not ( = ?auto_374960 ?auto_374967 ) ) ( not ( = ?auto_374960 ?auto_374968 ) ) ( not ( = ?auto_374960 ?auto_374969 ) ) ( not ( = ?auto_374960 ?auto_374970 ) ) ( not ( = ?auto_374960 ?auto_374971 ) ) ( not ( = ?auto_374960 ?auto_374972 ) ) ( not ( = ?auto_374960 ?auto_374973 ) ) ( not ( = ?auto_374961 ?auto_374962 ) ) ( not ( = ?auto_374961 ?auto_374963 ) ) ( not ( = ?auto_374961 ?auto_374964 ) ) ( not ( = ?auto_374961 ?auto_374965 ) ) ( not ( = ?auto_374961 ?auto_374966 ) ) ( not ( = ?auto_374961 ?auto_374967 ) ) ( not ( = ?auto_374961 ?auto_374968 ) ) ( not ( = ?auto_374961 ?auto_374969 ) ) ( not ( = ?auto_374961 ?auto_374970 ) ) ( not ( = ?auto_374961 ?auto_374971 ) ) ( not ( = ?auto_374961 ?auto_374972 ) ) ( not ( = ?auto_374961 ?auto_374973 ) ) ( not ( = ?auto_374962 ?auto_374963 ) ) ( not ( = ?auto_374962 ?auto_374964 ) ) ( not ( = ?auto_374962 ?auto_374965 ) ) ( not ( = ?auto_374962 ?auto_374966 ) ) ( not ( = ?auto_374962 ?auto_374967 ) ) ( not ( = ?auto_374962 ?auto_374968 ) ) ( not ( = ?auto_374962 ?auto_374969 ) ) ( not ( = ?auto_374962 ?auto_374970 ) ) ( not ( = ?auto_374962 ?auto_374971 ) ) ( not ( = ?auto_374962 ?auto_374972 ) ) ( not ( = ?auto_374962 ?auto_374973 ) ) ( not ( = ?auto_374963 ?auto_374964 ) ) ( not ( = ?auto_374963 ?auto_374965 ) ) ( not ( = ?auto_374963 ?auto_374966 ) ) ( not ( = ?auto_374963 ?auto_374967 ) ) ( not ( = ?auto_374963 ?auto_374968 ) ) ( not ( = ?auto_374963 ?auto_374969 ) ) ( not ( = ?auto_374963 ?auto_374970 ) ) ( not ( = ?auto_374963 ?auto_374971 ) ) ( not ( = ?auto_374963 ?auto_374972 ) ) ( not ( = ?auto_374963 ?auto_374973 ) ) ( not ( = ?auto_374964 ?auto_374965 ) ) ( not ( = ?auto_374964 ?auto_374966 ) ) ( not ( = ?auto_374964 ?auto_374967 ) ) ( not ( = ?auto_374964 ?auto_374968 ) ) ( not ( = ?auto_374964 ?auto_374969 ) ) ( not ( = ?auto_374964 ?auto_374970 ) ) ( not ( = ?auto_374964 ?auto_374971 ) ) ( not ( = ?auto_374964 ?auto_374972 ) ) ( not ( = ?auto_374964 ?auto_374973 ) ) ( not ( = ?auto_374965 ?auto_374966 ) ) ( not ( = ?auto_374965 ?auto_374967 ) ) ( not ( = ?auto_374965 ?auto_374968 ) ) ( not ( = ?auto_374965 ?auto_374969 ) ) ( not ( = ?auto_374965 ?auto_374970 ) ) ( not ( = ?auto_374965 ?auto_374971 ) ) ( not ( = ?auto_374965 ?auto_374972 ) ) ( not ( = ?auto_374965 ?auto_374973 ) ) ( not ( = ?auto_374966 ?auto_374967 ) ) ( not ( = ?auto_374966 ?auto_374968 ) ) ( not ( = ?auto_374966 ?auto_374969 ) ) ( not ( = ?auto_374966 ?auto_374970 ) ) ( not ( = ?auto_374966 ?auto_374971 ) ) ( not ( = ?auto_374966 ?auto_374972 ) ) ( not ( = ?auto_374966 ?auto_374973 ) ) ( not ( = ?auto_374967 ?auto_374968 ) ) ( not ( = ?auto_374967 ?auto_374969 ) ) ( not ( = ?auto_374967 ?auto_374970 ) ) ( not ( = ?auto_374967 ?auto_374971 ) ) ( not ( = ?auto_374967 ?auto_374972 ) ) ( not ( = ?auto_374967 ?auto_374973 ) ) ( not ( = ?auto_374968 ?auto_374969 ) ) ( not ( = ?auto_374968 ?auto_374970 ) ) ( not ( = ?auto_374968 ?auto_374971 ) ) ( not ( = ?auto_374968 ?auto_374972 ) ) ( not ( = ?auto_374968 ?auto_374973 ) ) ( not ( = ?auto_374969 ?auto_374970 ) ) ( not ( = ?auto_374969 ?auto_374971 ) ) ( not ( = ?auto_374969 ?auto_374972 ) ) ( not ( = ?auto_374969 ?auto_374973 ) ) ( not ( = ?auto_374970 ?auto_374971 ) ) ( not ( = ?auto_374970 ?auto_374972 ) ) ( not ( = ?auto_374970 ?auto_374973 ) ) ( not ( = ?auto_374971 ?auto_374972 ) ) ( not ( = ?auto_374971 ?auto_374973 ) ) ( not ( = ?auto_374972 ?auto_374973 ) ) ( ON ?auto_374971 ?auto_374972 ) ( ON ?auto_374970 ?auto_374971 ) ( ON ?auto_374969 ?auto_374970 ) ( ON ?auto_374968 ?auto_374969 ) ( ON ?auto_374967 ?auto_374968 ) ( ON ?auto_374966 ?auto_374967 ) ( CLEAR ?auto_374964 ) ( ON ?auto_374965 ?auto_374966 ) ( CLEAR ?auto_374965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_374959 ?auto_374960 ?auto_374961 ?auto_374962 ?auto_374963 ?auto_374964 ?auto_374965 )
      ( MAKE-14PILE ?auto_374959 ?auto_374960 ?auto_374961 ?auto_374962 ?auto_374963 ?auto_374964 ?auto_374965 ?auto_374966 ?auto_374967 ?auto_374968 ?auto_374969 ?auto_374970 ?auto_374971 ?auto_374972 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_374988 - BLOCK
      ?auto_374989 - BLOCK
      ?auto_374990 - BLOCK
      ?auto_374991 - BLOCK
      ?auto_374992 - BLOCK
      ?auto_374993 - BLOCK
      ?auto_374994 - BLOCK
      ?auto_374995 - BLOCK
      ?auto_374996 - BLOCK
      ?auto_374997 - BLOCK
      ?auto_374998 - BLOCK
      ?auto_374999 - BLOCK
      ?auto_375000 - BLOCK
      ?auto_375001 - BLOCK
    )
    :vars
    (
      ?auto_375002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375001 ?auto_375002 ) ( ON-TABLE ?auto_374988 ) ( ON ?auto_374989 ?auto_374988 ) ( ON ?auto_374990 ?auto_374989 ) ( ON ?auto_374991 ?auto_374990 ) ( ON ?auto_374992 ?auto_374991 ) ( not ( = ?auto_374988 ?auto_374989 ) ) ( not ( = ?auto_374988 ?auto_374990 ) ) ( not ( = ?auto_374988 ?auto_374991 ) ) ( not ( = ?auto_374988 ?auto_374992 ) ) ( not ( = ?auto_374988 ?auto_374993 ) ) ( not ( = ?auto_374988 ?auto_374994 ) ) ( not ( = ?auto_374988 ?auto_374995 ) ) ( not ( = ?auto_374988 ?auto_374996 ) ) ( not ( = ?auto_374988 ?auto_374997 ) ) ( not ( = ?auto_374988 ?auto_374998 ) ) ( not ( = ?auto_374988 ?auto_374999 ) ) ( not ( = ?auto_374988 ?auto_375000 ) ) ( not ( = ?auto_374988 ?auto_375001 ) ) ( not ( = ?auto_374988 ?auto_375002 ) ) ( not ( = ?auto_374989 ?auto_374990 ) ) ( not ( = ?auto_374989 ?auto_374991 ) ) ( not ( = ?auto_374989 ?auto_374992 ) ) ( not ( = ?auto_374989 ?auto_374993 ) ) ( not ( = ?auto_374989 ?auto_374994 ) ) ( not ( = ?auto_374989 ?auto_374995 ) ) ( not ( = ?auto_374989 ?auto_374996 ) ) ( not ( = ?auto_374989 ?auto_374997 ) ) ( not ( = ?auto_374989 ?auto_374998 ) ) ( not ( = ?auto_374989 ?auto_374999 ) ) ( not ( = ?auto_374989 ?auto_375000 ) ) ( not ( = ?auto_374989 ?auto_375001 ) ) ( not ( = ?auto_374989 ?auto_375002 ) ) ( not ( = ?auto_374990 ?auto_374991 ) ) ( not ( = ?auto_374990 ?auto_374992 ) ) ( not ( = ?auto_374990 ?auto_374993 ) ) ( not ( = ?auto_374990 ?auto_374994 ) ) ( not ( = ?auto_374990 ?auto_374995 ) ) ( not ( = ?auto_374990 ?auto_374996 ) ) ( not ( = ?auto_374990 ?auto_374997 ) ) ( not ( = ?auto_374990 ?auto_374998 ) ) ( not ( = ?auto_374990 ?auto_374999 ) ) ( not ( = ?auto_374990 ?auto_375000 ) ) ( not ( = ?auto_374990 ?auto_375001 ) ) ( not ( = ?auto_374990 ?auto_375002 ) ) ( not ( = ?auto_374991 ?auto_374992 ) ) ( not ( = ?auto_374991 ?auto_374993 ) ) ( not ( = ?auto_374991 ?auto_374994 ) ) ( not ( = ?auto_374991 ?auto_374995 ) ) ( not ( = ?auto_374991 ?auto_374996 ) ) ( not ( = ?auto_374991 ?auto_374997 ) ) ( not ( = ?auto_374991 ?auto_374998 ) ) ( not ( = ?auto_374991 ?auto_374999 ) ) ( not ( = ?auto_374991 ?auto_375000 ) ) ( not ( = ?auto_374991 ?auto_375001 ) ) ( not ( = ?auto_374991 ?auto_375002 ) ) ( not ( = ?auto_374992 ?auto_374993 ) ) ( not ( = ?auto_374992 ?auto_374994 ) ) ( not ( = ?auto_374992 ?auto_374995 ) ) ( not ( = ?auto_374992 ?auto_374996 ) ) ( not ( = ?auto_374992 ?auto_374997 ) ) ( not ( = ?auto_374992 ?auto_374998 ) ) ( not ( = ?auto_374992 ?auto_374999 ) ) ( not ( = ?auto_374992 ?auto_375000 ) ) ( not ( = ?auto_374992 ?auto_375001 ) ) ( not ( = ?auto_374992 ?auto_375002 ) ) ( not ( = ?auto_374993 ?auto_374994 ) ) ( not ( = ?auto_374993 ?auto_374995 ) ) ( not ( = ?auto_374993 ?auto_374996 ) ) ( not ( = ?auto_374993 ?auto_374997 ) ) ( not ( = ?auto_374993 ?auto_374998 ) ) ( not ( = ?auto_374993 ?auto_374999 ) ) ( not ( = ?auto_374993 ?auto_375000 ) ) ( not ( = ?auto_374993 ?auto_375001 ) ) ( not ( = ?auto_374993 ?auto_375002 ) ) ( not ( = ?auto_374994 ?auto_374995 ) ) ( not ( = ?auto_374994 ?auto_374996 ) ) ( not ( = ?auto_374994 ?auto_374997 ) ) ( not ( = ?auto_374994 ?auto_374998 ) ) ( not ( = ?auto_374994 ?auto_374999 ) ) ( not ( = ?auto_374994 ?auto_375000 ) ) ( not ( = ?auto_374994 ?auto_375001 ) ) ( not ( = ?auto_374994 ?auto_375002 ) ) ( not ( = ?auto_374995 ?auto_374996 ) ) ( not ( = ?auto_374995 ?auto_374997 ) ) ( not ( = ?auto_374995 ?auto_374998 ) ) ( not ( = ?auto_374995 ?auto_374999 ) ) ( not ( = ?auto_374995 ?auto_375000 ) ) ( not ( = ?auto_374995 ?auto_375001 ) ) ( not ( = ?auto_374995 ?auto_375002 ) ) ( not ( = ?auto_374996 ?auto_374997 ) ) ( not ( = ?auto_374996 ?auto_374998 ) ) ( not ( = ?auto_374996 ?auto_374999 ) ) ( not ( = ?auto_374996 ?auto_375000 ) ) ( not ( = ?auto_374996 ?auto_375001 ) ) ( not ( = ?auto_374996 ?auto_375002 ) ) ( not ( = ?auto_374997 ?auto_374998 ) ) ( not ( = ?auto_374997 ?auto_374999 ) ) ( not ( = ?auto_374997 ?auto_375000 ) ) ( not ( = ?auto_374997 ?auto_375001 ) ) ( not ( = ?auto_374997 ?auto_375002 ) ) ( not ( = ?auto_374998 ?auto_374999 ) ) ( not ( = ?auto_374998 ?auto_375000 ) ) ( not ( = ?auto_374998 ?auto_375001 ) ) ( not ( = ?auto_374998 ?auto_375002 ) ) ( not ( = ?auto_374999 ?auto_375000 ) ) ( not ( = ?auto_374999 ?auto_375001 ) ) ( not ( = ?auto_374999 ?auto_375002 ) ) ( not ( = ?auto_375000 ?auto_375001 ) ) ( not ( = ?auto_375000 ?auto_375002 ) ) ( not ( = ?auto_375001 ?auto_375002 ) ) ( ON ?auto_375000 ?auto_375001 ) ( ON ?auto_374999 ?auto_375000 ) ( ON ?auto_374998 ?auto_374999 ) ( ON ?auto_374997 ?auto_374998 ) ( ON ?auto_374996 ?auto_374997 ) ( ON ?auto_374995 ?auto_374996 ) ( ON ?auto_374994 ?auto_374995 ) ( CLEAR ?auto_374992 ) ( ON ?auto_374993 ?auto_374994 ) ( CLEAR ?auto_374993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_374988 ?auto_374989 ?auto_374990 ?auto_374991 ?auto_374992 ?auto_374993 )
      ( MAKE-14PILE ?auto_374988 ?auto_374989 ?auto_374990 ?auto_374991 ?auto_374992 ?auto_374993 ?auto_374994 ?auto_374995 ?auto_374996 ?auto_374997 ?auto_374998 ?auto_374999 ?auto_375000 ?auto_375001 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375017 - BLOCK
      ?auto_375018 - BLOCK
      ?auto_375019 - BLOCK
      ?auto_375020 - BLOCK
      ?auto_375021 - BLOCK
      ?auto_375022 - BLOCK
      ?auto_375023 - BLOCK
      ?auto_375024 - BLOCK
      ?auto_375025 - BLOCK
      ?auto_375026 - BLOCK
      ?auto_375027 - BLOCK
      ?auto_375028 - BLOCK
      ?auto_375029 - BLOCK
      ?auto_375030 - BLOCK
    )
    :vars
    (
      ?auto_375031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375030 ?auto_375031 ) ( ON-TABLE ?auto_375017 ) ( ON ?auto_375018 ?auto_375017 ) ( ON ?auto_375019 ?auto_375018 ) ( ON ?auto_375020 ?auto_375019 ) ( ON ?auto_375021 ?auto_375020 ) ( not ( = ?auto_375017 ?auto_375018 ) ) ( not ( = ?auto_375017 ?auto_375019 ) ) ( not ( = ?auto_375017 ?auto_375020 ) ) ( not ( = ?auto_375017 ?auto_375021 ) ) ( not ( = ?auto_375017 ?auto_375022 ) ) ( not ( = ?auto_375017 ?auto_375023 ) ) ( not ( = ?auto_375017 ?auto_375024 ) ) ( not ( = ?auto_375017 ?auto_375025 ) ) ( not ( = ?auto_375017 ?auto_375026 ) ) ( not ( = ?auto_375017 ?auto_375027 ) ) ( not ( = ?auto_375017 ?auto_375028 ) ) ( not ( = ?auto_375017 ?auto_375029 ) ) ( not ( = ?auto_375017 ?auto_375030 ) ) ( not ( = ?auto_375017 ?auto_375031 ) ) ( not ( = ?auto_375018 ?auto_375019 ) ) ( not ( = ?auto_375018 ?auto_375020 ) ) ( not ( = ?auto_375018 ?auto_375021 ) ) ( not ( = ?auto_375018 ?auto_375022 ) ) ( not ( = ?auto_375018 ?auto_375023 ) ) ( not ( = ?auto_375018 ?auto_375024 ) ) ( not ( = ?auto_375018 ?auto_375025 ) ) ( not ( = ?auto_375018 ?auto_375026 ) ) ( not ( = ?auto_375018 ?auto_375027 ) ) ( not ( = ?auto_375018 ?auto_375028 ) ) ( not ( = ?auto_375018 ?auto_375029 ) ) ( not ( = ?auto_375018 ?auto_375030 ) ) ( not ( = ?auto_375018 ?auto_375031 ) ) ( not ( = ?auto_375019 ?auto_375020 ) ) ( not ( = ?auto_375019 ?auto_375021 ) ) ( not ( = ?auto_375019 ?auto_375022 ) ) ( not ( = ?auto_375019 ?auto_375023 ) ) ( not ( = ?auto_375019 ?auto_375024 ) ) ( not ( = ?auto_375019 ?auto_375025 ) ) ( not ( = ?auto_375019 ?auto_375026 ) ) ( not ( = ?auto_375019 ?auto_375027 ) ) ( not ( = ?auto_375019 ?auto_375028 ) ) ( not ( = ?auto_375019 ?auto_375029 ) ) ( not ( = ?auto_375019 ?auto_375030 ) ) ( not ( = ?auto_375019 ?auto_375031 ) ) ( not ( = ?auto_375020 ?auto_375021 ) ) ( not ( = ?auto_375020 ?auto_375022 ) ) ( not ( = ?auto_375020 ?auto_375023 ) ) ( not ( = ?auto_375020 ?auto_375024 ) ) ( not ( = ?auto_375020 ?auto_375025 ) ) ( not ( = ?auto_375020 ?auto_375026 ) ) ( not ( = ?auto_375020 ?auto_375027 ) ) ( not ( = ?auto_375020 ?auto_375028 ) ) ( not ( = ?auto_375020 ?auto_375029 ) ) ( not ( = ?auto_375020 ?auto_375030 ) ) ( not ( = ?auto_375020 ?auto_375031 ) ) ( not ( = ?auto_375021 ?auto_375022 ) ) ( not ( = ?auto_375021 ?auto_375023 ) ) ( not ( = ?auto_375021 ?auto_375024 ) ) ( not ( = ?auto_375021 ?auto_375025 ) ) ( not ( = ?auto_375021 ?auto_375026 ) ) ( not ( = ?auto_375021 ?auto_375027 ) ) ( not ( = ?auto_375021 ?auto_375028 ) ) ( not ( = ?auto_375021 ?auto_375029 ) ) ( not ( = ?auto_375021 ?auto_375030 ) ) ( not ( = ?auto_375021 ?auto_375031 ) ) ( not ( = ?auto_375022 ?auto_375023 ) ) ( not ( = ?auto_375022 ?auto_375024 ) ) ( not ( = ?auto_375022 ?auto_375025 ) ) ( not ( = ?auto_375022 ?auto_375026 ) ) ( not ( = ?auto_375022 ?auto_375027 ) ) ( not ( = ?auto_375022 ?auto_375028 ) ) ( not ( = ?auto_375022 ?auto_375029 ) ) ( not ( = ?auto_375022 ?auto_375030 ) ) ( not ( = ?auto_375022 ?auto_375031 ) ) ( not ( = ?auto_375023 ?auto_375024 ) ) ( not ( = ?auto_375023 ?auto_375025 ) ) ( not ( = ?auto_375023 ?auto_375026 ) ) ( not ( = ?auto_375023 ?auto_375027 ) ) ( not ( = ?auto_375023 ?auto_375028 ) ) ( not ( = ?auto_375023 ?auto_375029 ) ) ( not ( = ?auto_375023 ?auto_375030 ) ) ( not ( = ?auto_375023 ?auto_375031 ) ) ( not ( = ?auto_375024 ?auto_375025 ) ) ( not ( = ?auto_375024 ?auto_375026 ) ) ( not ( = ?auto_375024 ?auto_375027 ) ) ( not ( = ?auto_375024 ?auto_375028 ) ) ( not ( = ?auto_375024 ?auto_375029 ) ) ( not ( = ?auto_375024 ?auto_375030 ) ) ( not ( = ?auto_375024 ?auto_375031 ) ) ( not ( = ?auto_375025 ?auto_375026 ) ) ( not ( = ?auto_375025 ?auto_375027 ) ) ( not ( = ?auto_375025 ?auto_375028 ) ) ( not ( = ?auto_375025 ?auto_375029 ) ) ( not ( = ?auto_375025 ?auto_375030 ) ) ( not ( = ?auto_375025 ?auto_375031 ) ) ( not ( = ?auto_375026 ?auto_375027 ) ) ( not ( = ?auto_375026 ?auto_375028 ) ) ( not ( = ?auto_375026 ?auto_375029 ) ) ( not ( = ?auto_375026 ?auto_375030 ) ) ( not ( = ?auto_375026 ?auto_375031 ) ) ( not ( = ?auto_375027 ?auto_375028 ) ) ( not ( = ?auto_375027 ?auto_375029 ) ) ( not ( = ?auto_375027 ?auto_375030 ) ) ( not ( = ?auto_375027 ?auto_375031 ) ) ( not ( = ?auto_375028 ?auto_375029 ) ) ( not ( = ?auto_375028 ?auto_375030 ) ) ( not ( = ?auto_375028 ?auto_375031 ) ) ( not ( = ?auto_375029 ?auto_375030 ) ) ( not ( = ?auto_375029 ?auto_375031 ) ) ( not ( = ?auto_375030 ?auto_375031 ) ) ( ON ?auto_375029 ?auto_375030 ) ( ON ?auto_375028 ?auto_375029 ) ( ON ?auto_375027 ?auto_375028 ) ( ON ?auto_375026 ?auto_375027 ) ( ON ?auto_375025 ?auto_375026 ) ( ON ?auto_375024 ?auto_375025 ) ( ON ?auto_375023 ?auto_375024 ) ( CLEAR ?auto_375021 ) ( ON ?auto_375022 ?auto_375023 ) ( CLEAR ?auto_375022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_375017 ?auto_375018 ?auto_375019 ?auto_375020 ?auto_375021 ?auto_375022 )
      ( MAKE-14PILE ?auto_375017 ?auto_375018 ?auto_375019 ?auto_375020 ?auto_375021 ?auto_375022 ?auto_375023 ?auto_375024 ?auto_375025 ?auto_375026 ?auto_375027 ?auto_375028 ?auto_375029 ?auto_375030 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375046 - BLOCK
      ?auto_375047 - BLOCK
      ?auto_375048 - BLOCK
      ?auto_375049 - BLOCK
      ?auto_375050 - BLOCK
      ?auto_375051 - BLOCK
      ?auto_375052 - BLOCK
      ?auto_375053 - BLOCK
      ?auto_375054 - BLOCK
      ?auto_375055 - BLOCK
      ?auto_375056 - BLOCK
      ?auto_375057 - BLOCK
      ?auto_375058 - BLOCK
      ?auto_375059 - BLOCK
    )
    :vars
    (
      ?auto_375060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375059 ?auto_375060 ) ( ON-TABLE ?auto_375046 ) ( ON ?auto_375047 ?auto_375046 ) ( ON ?auto_375048 ?auto_375047 ) ( ON ?auto_375049 ?auto_375048 ) ( not ( = ?auto_375046 ?auto_375047 ) ) ( not ( = ?auto_375046 ?auto_375048 ) ) ( not ( = ?auto_375046 ?auto_375049 ) ) ( not ( = ?auto_375046 ?auto_375050 ) ) ( not ( = ?auto_375046 ?auto_375051 ) ) ( not ( = ?auto_375046 ?auto_375052 ) ) ( not ( = ?auto_375046 ?auto_375053 ) ) ( not ( = ?auto_375046 ?auto_375054 ) ) ( not ( = ?auto_375046 ?auto_375055 ) ) ( not ( = ?auto_375046 ?auto_375056 ) ) ( not ( = ?auto_375046 ?auto_375057 ) ) ( not ( = ?auto_375046 ?auto_375058 ) ) ( not ( = ?auto_375046 ?auto_375059 ) ) ( not ( = ?auto_375046 ?auto_375060 ) ) ( not ( = ?auto_375047 ?auto_375048 ) ) ( not ( = ?auto_375047 ?auto_375049 ) ) ( not ( = ?auto_375047 ?auto_375050 ) ) ( not ( = ?auto_375047 ?auto_375051 ) ) ( not ( = ?auto_375047 ?auto_375052 ) ) ( not ( = ?auto_375047 ?auto_375053 ) ) ( not ( = ?auto_375047 ?auto_375054 ) ) ( not ( = ?auto_375047 ?auto_375055 ) ) ( not ( = ?auto_375047 ?auto_375056 ) ) ( not ( = ?auto_375047 ?auto_375057 ) ) ( not ( = ?auto_375047 ?auto_375058 ) ) ( not ( = ?auto_375047 ?auto_375059 ) ) ( not ( = ?auto_375047 ?auto_375060 ) ) ( not ( = ?auto_375048 ?auto_375049 ) ) ( not ( = ?auto_375048 ?auto_375050 ) ) ( not ( = ?auto_375048 ?auto_375051 ) ) ( not ( = ?auto_375048 ?auto_375052 ) ) ( not ( = ?auto_375048 ?auto_375053 ) ) ( not ( = ?auto_375048 ?auto_375054 ) ) ( not ( = ?auto_375048 ?auto_375055 ) ) ( not ( = ?auto_375048 ?auto_375056 ) ) ( not ( = ?auto_375048 ?auto_375057 ) ) ( not ( = ?auto_375048 ?auto_375058 ) ) ( not ( = ?auto_375048 ?auto_375059 ) ) ( not ( = ?auto_375048 ?auto_375060 ) ) ( not ( = ?auto_375049 ?auto_375050 ) ) ( not ( = ?auto_375049 ?auto_375051 ) ) ( not ( = ?auto_375049 ?auto_375052 ) ) ( not ( = ?auto_375049 ?auto_375053 ) ) ( not ( = ?auto_375049 ?auto_375054 ) ) ( not ( = ?auto_375049 ?auto_375055 ) ) ( not ( = ?auto_375049 ?auto_375056 ) ) ( not ( = ?auto_375049 ?auto_375057 ) ) ( not ( = ?auto_375049 ?auto_375058 ) ) ( not ( = ?auto_375049 ?auto_375059 ) ) ( not ( = ?auto_375049 ?auto_375060 ) ) ( not ( = ?auto_375050 ?auto_375051 ) ) ( not ( = ?auto_375050 ?auto_375052 ) ) ( not ( = ?auto_375050 ?auto_375053 ) ) ( not ( = ?auto_375050 ?auto_375054 ) ) ( not ( = ?auto_375050 ?auto_375055 ) ) ( not ( = ?auto_375050 ?auto_375056 ) ) ( not ( = ?auto_375050 ?auto_375057 ) ) ( not ( = ?auto_375050 ?auto_375058 ) ) ( not ( = ?auto_375050 ?auto_375059 ) ) ( not ( = ?auto_375050 ?auto_375060 ) ) ( not ( = ?auto_375051 ?auto_375052 ) ) ( not ( = ?auto_375051 ?auto_375053 ) ) ( not ( = ?auto_375051 ?auto_375054 ) ) ( not ( = ?auto_375051 ?auto_375055 ) ) ( not ( = ?auto_375051 ?auto_375056 ) ) ( not ( = ?auto_375051 ?auto_375057 ) ) ( not ( = ?auto_375051 ?auto_375058 ) ) ( not ( = ?auto_375051 ?auto_375059 ) ) ( not ( = ?auto_375051 ?auto_375060 ) ) ( not ( = ?auto_375052 ?auto_375053 ) ) ( not ( = ?auto_375052 ?auto_375054 ) ) ( not ( = ?auto_375052 ?auto_375055 ) ) ( not ( = ?auto_375052 ?auto_375056 ) ) ( not ( = ?auto_375052 ?auto_375057 ) ) ( not ( = ?auto_375052 ?auto_375058 ) ) ( not ( = ?auto_375052 ?auto_375059 ) ) ( not ( = ?auto_375052 ?auto_375060 ) ) ( not ( = ?auto_375053 ?auto_375054 ) ) ( not ( = ?auto_375053 ?auto_375055 ) ) ( not ( = ?auto_375053 ?auto_375056 ) ) ( not ( = ?auto_375053 ?auto_375057 ) ) ( not ( = ?auto_375053 ?auto_375058 ) ) ( not ( = ?auto_375053 ?auto_375059 ) ) ( not ( = ?auto_375053 ?auto_375060 ) ) ( not ( = ?auto_375054 ?auto_375055 ) ) ( not ( = ?auto_375054 ?auto_375056 ) ) ( not ( = ?auto_375054 ?auto_375057 ) ) ( not ( = ?auto_375054 ?auto_375058 ) ) ( not ( = ?auto_375054 ?auto_375059 ) ) ( not ( = ?auto_375054 ?auto_375060 ) ) ( not ( = ?auto_375055 ?auto_375056 ) ) ( not ( = ?auto_375055 ?auto_375057 ) ) ( not ( = ?auto_375055 ?auto_375058 ) ) ( not ( = ?auto_375055 ?auto_375059 ) ) ( not ( = ?auto_375055 ?auto_375060 ) ) ( not ( = ?auto_375056 ?auto_375057 ) ) ( not ( = ?auto_375056 ?auto_375058 ) ) ( not ( = ?auto_375056 ?auto_375059 ) ) ( not ( = ?auto_375056 ?auto_375060 ) ) ( not ( = ?auto_375057 ?auto_375058 ) ) ( not ( = ?auto_375057 ?auto_375059 ) ) ( not ( = ?auto_375057 ?auto_375060 ) ) ( not ( = ?auto_375058 ?auto_375059 ) ) ( not ( = ?auto_375058 ?auto_375060 ) ) ( not ( = ?auto_375059 ?auto_375060 ) ) ( ON ?auto_375058 ?auto_375059 ) ( ON ?auto_375057 ?auto_375058 ) ( ON ?auto_375056 ?auto_375057 ) ( ON ?auto_375055 ?auto_375056 ) ( ON ?auto_375054 ?auto_375055 ) ( ON ?auto_375053 ?auto_375054 ) ( ON ?auto_375052 ?auto_375053 ) ( ON ?auto_375051 ?auto_375052 ) ( CLEAR ?auto_375049 ) ( ON ?auto_375050 ?auto_375051 ) ( CLEAR ?auto_375050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_375046 ?auto_375047 ?auto_375048 ?auto_375049 ?auto_375050 )
      ( MAKE-14PILE ?auto_375046 ?auto_375047 ?auto_375048 ?auto_375049 ?auto_375050 ?auto_375051 ?auto_375052 ?auto_375053 ?auto_375054 ?auto_375055 ?auto_375056 ?auto_375057 ?auto_375058 ?auto_375059 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375075 - BLOCK
      ?auto_375076 - BLOCK
      ?auto_375077 - BLOCK
      ?auto_375078 - BLOCK
      ?auto_375079 - BLOCK
      ?auto_375080 - BLOCK
      ?auto_375081 - BLOCK
      ?auto_375082 - BLOCK
      ?auto_375083 - BLOCK
      ?auto_375084 - BLOCK
      ?auto_375085 - BLOCK
      ?auto_375086 - BLOCK
      ?auto_375087 - BLOCK
      ?auto_375088 - BLOCK
    )
    :vars
    (
      ?auto_375089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375088 ?auto_375089 ) ( ON-TABLE ?auto_375075 ) ( ON ?auto_375076 ?auto_375075 ) ( ON ?auto_375077 ?auto_375076 ) ( ON ?auto_375078 ?auto_375077 ) ( not ( = ?auto_375075 ?auto_375076 ) ) ( not ( = ?auto_375075 ?auto_375077 ) ) ( not ( = ?auto_375075 ?auto_375078 ) ) ( not ( = ?auto_375075 ?auto_375079 ) ) ( not ( = ?auto_375075 ?auto_375080 ) ) ( not ( = ?auto_375075 ?auto_375081 ) ) ( not ( = ?auto_375075 ?auto_375082 ) ) ( not ( = ?auto_375075 ?auto_375083 ) ) ( not ( = ?auto_375075 ?auto_375084 ) ) ( not ( = ?auto_375075 ?auto_375085 ) ) ( not ( = ?auto_375075 ?auto_375086 ) ) ( not ( = ?auto_375075 ?auto_375087 ) ) ( not ( = ?auto_375075 ?auto_375088 ) ) ( not ( = ?auto_375075 ?auto_375089 ) ) ( not ( = ?auto_375076 ?auto_375077 ) ) ( not ( = ?auto_375076 ?auto_375078 ) ) ( not ( = ?auto_375076 ?auto_375079 ) ) ( not ( = ?auto_375076 ?auto_375080 ) ) ( not ( = ?auto_375076 ?auto_375081 ) ) ( not ( = ?auto_375076 ?auto_375082 ) ) ( not ( = ?auto_375076 ?auto_375083 ) ) ( not ( = ?auto_375076 ?auto_375084 ) ) ( not ( = ?auto_375076 ?auto_375085 ) ) ( not ( = ?auto_375076 ?auto_375086 ) ) ( not ( = ?auto_375076 ?auto_375087 ) ) ( not ( = ?auto_375076 ?auto_375088 ) ) ( not ( = ?auto_375076 ?auto_375089 ) ) ( not ( = ?auto_375077 ?auto_375078 ) ) ( not ( = ?auto_375077 ?auto_375079 ) ) ( not ( = ?auto_375077 ?auto_375080 ) ) ( not ( = ?auto_375077 ?auto_375081 ) ) ( not ( = ?auto_375077 ?auto_375082 ) ) ( not ( = ?auto_375077 ?auto_375083 ) ) ( not ( = ?auto_375077 ?auto_375084 ) ) ( not ( = ?auto_375077 ?auto_375085 ) ) ( not ( = ?auto_375077 ?auto_375086 ) ) ( not ( = ?auto_375077 ?auto_375087 ) ) ( not ( = ?auto_375077 ?auto_375088 ) ) ( not ( = ?auto_375077 ?auto_375089 ) ) ( not ( = ?auto_375078 ?auto_375079 ) ) ( not ( = ?auto_375078 ?auto_375080 ) ) ( not ( = ?auto_375078 ?auto_375081 ) ) ( not ( = ?auto_375078 ?auto_375082 ) ) ( not ( = ?auto_375078 ?auto_375083 ) ) ( not ( = ?auto_375078 ?auto_375084 ) ) ( not ( = ?auto_375078 ?auto_375085 ) ) ( not ( = ?auto_375078 ?auto_375086 ) ) ( not ( = ?auto_375078 ?auto_375087 ) ) ( not ( = ?auto_375078 ?auto_375088 ) ) ( not ( = ?auto_375078 ?auto_375089 ) ) ( not ( = ?auto_375079 ?auto_375080 ) ) ( not ( = ?auto_375079 ?auto_375081 ) ) ( not ( = ?auto_375079 ?auto_375082 ) ) ( not ( = ?auto_375079 ?auto_375083 ) ) ( not ( = ?auto_375079 ?auto_375084 ) ) ( not ( = ?auto_375079 ?auto_375085 ) ) ( not ( = ?auto_375079 ?auto_375086 ) ) ( not ( = ?auto_375079 ?auto_375087 ) ) ( not ( = ?auto_375079 ?auto_375088 ) ) ( not ( = ?auto_375079 ?auto_375089 ) ) ( not ( = ?auto_375080 ?auto_375081 ) ) ( not ( = ?auto_375080 ?auto_375082 ) ) ( not ( = ?auto_375080 ?auto_375083 ) ) ( not ( = ?auto_375080 ?auto_375084 ) ) ( not ( = ?auto_375080 ?auto_375085 ) ) ( not ( = ?auto_375080 ?auto_375086 ) ) ( not ( = ?auto_375080 ?auto_375087 ) ) ( not ( = ?auto_375080 ?auto_375088 ) ) ( not ( = ?auto_375080 ?auto_375089 ) ) ( not ( = ?auto_375081 ?auto_375082 ) ) ( not ( = ?auto_375081 ?auto_375083 ) ) ( not ( = ?auto_375081 ?auto_375084 ) ) ( not ( = ?auto_375081 ?auto_375085 ) ) ( not ( = ?auto_375081 ?auto_375086 ) ) ( not ( = ?auto_375081 ?auto_375087 ) ) ( not ( = ?auto_375081 ?auto_375088 ) ) ( not ( = ?auto_375081 ?auto_375089 ) ) ( not ( = ?auto_375082 ?auto_375083 ) ) ( not ( = ?auto_375082 ?auto_375084 ) ) ( not ( = ?auto_375082 ?auto_375085 ) ) ( not ( = ?auto_375082 ?auto_375086 ) ) ( not ( = ?auto_375082 ?auto_375087 ) ) ( not ( = ?auto_375082 ?auto_375088 ) ) ( not ( = ?auto_375082 ?auto_375089 ) ) ( not ( = ?auto_375083 ?auto_375084 ) ) ( not ( = ?auto_375083 ?auto_375085 ) ) ( not ( = ?auto_375083 ?auto_375086 ) ) ( not ( = ?auto_375083 ?auto_375087 ) ) ( not ( = ?auto_375083 ?auto_375088 ) ) ( not ( = ?auto_375083 ?auto_375089 ) ) ( not ( = ?auto_375084 ?auto_375085 ) ) ( not ( = ?auto_375084 ?auto_375086 ) ) ( not ( = ?auto_375084 ?auto_375087 ) ) ( not ( = ?auto_375084 ?auto_375088 ) ) ( not ( = ?auto_375084 ?auto_375089 ) ) ( not ( = ?auto_375085 ?auto_375086 ) ) ( not ( = ?auto_375085 ?auto_375087 ) ) ( not ( = ?auto_375085 ?auto_375088 ) ) ( not ( = ?auto_375085 ?auto_375089 ) ) ( not ( = ?auto_375086 ?auto_375087 ) ) ( not ( = ?auto_375086 ?auto_375088 ) ) ( not ( = ?auto_375086 ?auto_375089 ) ) ( not ( = ?auto_375087 ?auto_375088 ) ) ( not ( = ?auto_375087 ?auto_375089 ) ) ( not ( = ?auto_375088 ?auto_375089 ) ) ( ON ?auto_375087 ?auto_375088 ) ( ON ?auto_375086 ?auto_375087 ) ( ON ?auto_375085 ?auto_375086 ) ( ON ?auto_375084 ?auto_375085 ) ( ON ?auto_375083 ?auto_375084 ) ( ON ?auto_375082 ?auto_375083 ) ( ON ?auto_375081 ?auto_375082 ) ( ON ?auto_375080 ?auto_375081 ) ( CLEAR ?auto_375078 ) ( ON ?auto_375079 ?auto_375080 ) ( CLEAR ?auto_375079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_375075 ?auto_375076 ?auto_375077 ?auto_375078 ?auto_375079 )
      ( MAKE-14PILE ?auto_375075 ?auto_375076 ?auto_375077 ?auto_375078 ?auto_375079 ?auto_375080 ?auto_375081 ?auto_375082 ?auto_375083 ?auto_375084 ?auto_375085 ?auto_375086 ?auto_375087 ?auto_375088 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375104 - BLOCK
      ?auto_375105 - BLOCK
      ?auto_375106 - BLOCK
      ?auto_375107 - BLOCK
      ?auto_375108 - BLOCK
      ?auto_375109 - BLOCK
      ?auto_375110 - BLOCK
      ?auto_375111 - BLOCK
      ?auto_375112 - BLOCK
      ?auto_375113 - BLOCK
      ?auto_375114 - BLOCK
      ?auto_375115 - BLOCK
      ?auto_375116 - BLOCK
      ?auto_375117 - BLOCK
    )
    :vars
    (
      ?auto_375118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375117 ?auto_375118 ) ( ON-TABLE ?auto_375104 ) ( ON ?auto_375105 ?auto_375104 ) ( ON ?auto_375106 ?auto_375105 ) ( not ( = ?auto_375104 ?auto_375105 ) ) ( not ( = ?auto_375104 ?auto_375106 ) ) ( not ( = ?auto_375104 ?auto_375107 ) ) ( not ( = ?auto_375104 ?auto_375108 ) ) ( not ( = ?auto_375104 ?auto_375109 ) ) ( not ( = ?auto_375104 ?auto_375110 ) ) ( not ( = ?auto_375104 ?auto_375111 ) ) ( not ( = ?auto_375104 ?auto_375112 ) ) ( not ( = ?auto_375104 ?auto_375113 ) ) ( not ( = ?auto_375104 ?auto_375114 ) ) ( not ( = ?auto_375104 ?auto_375115 ) ) ( not ( = ?auto_375104 ?auto_375116 ) ) ( not ( = ?auto_375104 ?auto_375117 ) ) ( not ( = ?auto_375104 ?auto_375118 ) ) ( not ( = ?auto_375105 ?auto_375106 ) ) ( not ( = ?auto_375105 ?auto_375107 ) ) ( not ( = ?auto_375105 ?auto_375108 ) ) ( not ( = ?auto_375105 ?auto_375109 ) ) ( not ( = ?auto_375105 ?auto_375110 ) ) ( not ( = ?auto_375105 ?auto_375111 ) ) ( not ( = ?auto_375105 ?auto_375112 ) ) ( not ( = ?auto_375105 ?auto_375113 ) ) ( not ( = ?auto_375105 ?auto_375114 ) ) ( not ( = ?auto_375105 ?auto_375115 ) ) ( not ( = ?auto_375105 ?auto_375116 ) ) ( not ( = ?auto_375105 ?auto_375117 ) ) ( not ( = ?auto_375105 ?auto_375118 ) ) ( not ( = ?auto_375106 ?auto_375107 ) ) ( not ( = ?auto_375106 ?auto_375108 ) ) ( not ( = ?auto_375106 ?auto_375109 ) ) ( not ( = ?auto_375106 ?auto_375110 ) ) ( not ( = ?auto_375106 ?auto_375111 ) ) ( not ( = ?auto_375106 ?auto_375112 ) ) ( not ( = ?auto_375106 ?auto_375113 ) ) ( not ( = ?auto_375106 ?auto_375114 ) ) ( not ( = ?auto_375106 ?auto_375115 ) ) ( not ( = ?auto_375106 ?auto_375116 ) ) ( not ( = ?auto_375106 ?auto_375117 ) ) ( not ( = ?auto_375106 ?auto_375118 ) ) ( not ( = ?auto_375107 ?auto_375108 ) ) ( not ( = ?auto_375107 ?auto_375109 ) ) ( not ( = ?auto_375107 ?auto_375110 ) ) ( not ( = ?auto_375107 ?auto_375111 ) ) ( not ( = ?auto_375107 ?auto_375112 ) ) ( not ( = ?auto_375107 ?auto_375113 ) ) ( not ( = ?auto_375107 ?auto_375114 ) ) ( not ( = ?auto_375107 ?auto_375115 ) ) ( not ( = ?auto_375107 ?auto_375116 ) ) ( not ( = ?auto_375107 ?auto_375117 ) ) ( not ( = ?auto_375107 ?auto_375118 ) ) ( not ( = ?auto_375108 ?auto_375109 ) ) ( not ( = ?auto_375108 ?auto_375110 ) ) ( not ( = ?auto_375108 ?auto_375111 ) ) ( not ( = ?auto_375108 ?auto_375112 ) ) ( not ( = ?auto_375108 ?auto_375113 ) ) ( not ( = ?auto_375108 ?auto_375114 ) ) ( not ( = ?auto_375108 ?auto_375115 ) ) ( not ( = ?auto_375108 ?auto_375116 ) ) ( not ( = ?auto_375108 ?auto_375117 ) ) ( not ( = ?auto_375108 ?auto_375118 ) ) ( not ( = ?auto_375109 ?auto_375110 ) ) ( not ( = ?auto_375109 ?auto_375111 ) ) ( not ( = ?auto_375109 ?auto_375112 ) ) ( not ( = ?auto_375109 ?auto_375113 ) ) ( not ( = ?auto_375109 ?auto_375114 ) ) ( not ( = ?auto_375109 ?auto_375115 ) ) ( not ( = ?auto_375109 ?auto_375116 ) ) ( not ( = ?auto_375109 ?auto_375117 ) ) ( not ( = ?auto_375109 ?auto_375118 ) ) ( not ( = ?auto_375110 ?auto_375111 ) ) ( not ( = ?auto_375110 ?auto_375112 ) ) ( not ( = ?auto_375110 ?auto_375113 ) ) ( not ( = ?auto_375110 ?auto_375114 ) ) ( not ( = ?auto_375110 ?auto_375115 ) ) ( not ( = ?auto_375110 ?auto_375116 ) ) ( not ( = ?auto_375110 ?auto_375117 ) ) ( not ( = ?auto_375110 ?auto_375118 ) ) ( not ( = ?auto_375111 ?auto_375112 ) ) ( not ( = ?auto_375111 ?auto_375113 ) ) ( not ( = ?auto_375111 ?auto_375114 ) ) ( not ( = ?auto_375111 ?auto_375115 ) ) ( not ( = ?auto_375111 ?auto_375116 ) ) ( not ( = ?auto_375111 ?auto_375117 ) ) ( not ( = ?auto_375111 ?auto_375118 ) ) ( not ( = ?auto_375112 ?auto_375113 ) ) ( not ( = ?auto_375112 ?auto_375114 ) ) ( not ( = ?auto_375112 ?auto_375115 ) ) ( not ( = ?auto_375112 ?auto_375116 ) ) ( not ( = ?auto_375112 ?auto_375117 ) ) ( not ( = ?auto_375112 ?auto_375118 ) ) ( not ( = ?auto_375113 ?auto_375114 ) ) ( not ( = ?auto_375113 ?auto_375115 ) ) ( not ( = ?auto_375113 ?auto_375116 ) ) ( not ( = ?auto_375113 ?auto_375117 ) ) ( not ( = ?auto_375113 ?auto_375118 ) ) ( not ( = ?auto_375114 ?auto_375115 ) ) ( not ( = ?auto_375114 ?auto_375116 ) ) ( not ( = ?auto_375114 ?auto_375117 ) ) ( not ( = ?auto_375114 ?auto_375118 ) ) ( not ( = ?auto_375115 ?auto_375116 ) ) ( not ( = ?auto_375115 ?auto_375117 ) ) ( not ( = ?auto_375115 ?auto_375118 ) ) ( not ( = ?auto_375116 ?auto_375117 ) ) ( not ( = ?auto_375116 ?auto_375118 ) ) ( not ( = ?auto_375117 ?auto_375118 ) ) ( ON ?auto_375116 ?auto_375117 ) ( ON ?auto_375115 ?auto_375116 ) ( ON ?auto_375114 ?auto_375115 ) ( ON ?auto_375113 ?auto_375114 ) ( ON ?auto_375112 ?auto_375113 ) ( ON ?auto_375111 ?auto_375112 ) ( ON ?auto_375110 ?auto_375111 ) ( ON ?auto_375109 ?auto_375110 ) ( ON ?auto_375108 ?auto_375109 ) ( CLEAR ?auto_375106 ) ( ON ?auto_375107 ?auto_375108 ) ( CLEAR ?auto_375107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_375104 ?auto_375105 ?auto_375106 ?auto_375107 )
      ( MAKE-14PILE ?auto_375104 ?auto_375105 ?auto_375106 ?auto_375107 ?auto_375108 ?auto_375109 ?auto_375110 ?auto_375111 ?auto_375112 ?auto_375113 ?auto_375114 ?auto_375115 ?auto_375116 ?auto_375117 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375133 - BLOCK
      ?auto_375134 - BLOCK
      ?auto_375135 - BLOCK
      ?auto_375136 - BLOCK
      ?auto_375137 - BLOCK
      ?auto_375138 - BLOCK
      ?auto_375139 - BLOCK
      ?auto_375140 - BLOCK
      ?auto_375141 - BLOCK
      ?auto_375142 - BLOCK
      ?auto_375143 - BLOCK
      ?auto_375144 - BLOCK
      ?auto_375145 - BLOCK
      ?auto_375146 - BLOCK
    )
    :vars
    (
      ?auto_375147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375146 ?auto_375147 ) ( ON-TABLE ?auto_375133 ) ( ON ?auto_375134 ?auto_375133 ) ( ON ?auto_375135 ?auto_375134 ) ( not ( = ?auto_375133 ?auto_375134 ) ) ( not ( = ?auto_375133 ?auto_375135 ) ) ( not ( = ?auto_375133 ?auto_375136 ) ) ( not ( = ?auto_375133 ?auto_375137 ) ) ( not ( = ?auto_375133 ?auto_375138 ) ) ( not ( = ?auto_375133 ?auto_375139 ) ) ( not ( = ?auto_375133 ?auto_375140 ) ) ( not ( = ?auto_375133 ?auto_375141 ) ) ( not ( = ?auto_375133 ?auto_375142 ) ) ( not ( = ?auto_375133 ?auto_375143 ) ) ( not ( = ?auto_375133 ?auto_375144 ) ) ( not ( = ?auto_375133 ?auto_375145 ) ) ( not ( = ?auto_375133 ?auto_375146 ) ) ( not ( = ?auto_375133 ?auto_375147 ) ) ( not ( = ?auto_375134 ?auto_375135 ) ) ( not ( = ?auto_375134 ?auto_375136 ) ) ( not ( = ?auto_375134 ?auto_375137 ) ) ( not ( = ?auto_375134 ?auto_375138 ) ) ( not ( = ?auto_375134 ?auto_375139 ) ) ( not ( = ?auto_375134 ?auto_375140 ) ) ( not ( = ?auto_375134 ?auto_375141 ) ) ( not ( = ?auto_375134 ?auto_375142 ) ) ( not ( = ?auto_375134 ?auto_375143 ) ) ( not ( = ?auto_375134 ?auto_375144 ) ) ( not ( = ?auto_375134 ?auto_375145 ) ) ( not ( = ?auto_375134 ?auto_375146 ) ) ( not ( = ?auto_375134 ?auto_375147 ) ) ( not ( = ?auto_375135 ?auto_375136 ) ) ( not ( = ?auto_375135 ?auto_375137 ) ) ( not ( = ?auto_375135 ?auto_375138 ) ) ( not ( = ?auto_375135 ?auto_375139 ) ) ( not ( = ?auto_375135 ?auto_375140 ) ) ( not ( = ?auto_375135 ?auto_375141 ) ) ( not ( = ?auto_375135 ?auto_375142 ) ) ( not ( = ?auto_375135 ?auto_375143 ) ) ( not ( = ?auto_375135 ?auto_375144 ) ) ( not ( = ?auto_375135 ?auto_375145 ) ) ( not ( = ?auto_375135 ?auto_375146 ) ) ( not ( = ?auto_375135 ?auto_375147 ) ) ( not ( = ?auto_375136 ?auto_375137 ) ) ( not ( = ?auto_375136 ?auto_375138 ) ) ( not ( = ?auto_375136 ?auto_375139 ) ) ( not ( = ?auto_375136 ?auto_375140 ) ) ( not ( = ?auto_375136 ?auto_375141 ) ) ( not ( = ?auto_375136 ?auto_375142 ) ) ( not ( = ?auto_375136 ?auto_375143 ) ) ( not ( = ?auto_375136 ?auto_375144 ) ) ( not ( = ?auto_375136 ?auto_375145 ) ) ( not ( = ?auto_375136 ?auto_375146 ) ) ( not ( = ?auto_375136 ?auto_375147 ) ) ( not ( = ?auto_375137 ?auto_375138 ) ) ( not ( = ?auto_375137 ?auto_375139 ) ) ( not ( = ?auto_375137 ?auto_375140 ) ) ( not ( = ?auto_375137 ?auto_375141 ) ) ( not ( = ?auto_375137 ?auto_375142 ) ) ( not ( = ?auto_375137 ?auto_375143 ) ) ( not ( = ?auto_375137 ?auto_375144 ) ) ( not ( = ?auto_375137 ?auto_375145 ) ) ( not ( = ?auto_375137 ?auto_375146 ) ) ( not ( = ?auto_375137 ?auto_375147 ) ) ( not ( = ?auto_375138 ?auto_375139 ) ) ( not ( = ?auto_375138 ?auto_375140 ) ) ( not ( = ?auto_375138 ?auto_375141 ) ) ( not ( = ?auto_375138 ?auto_375142 ) ) ( not ( = ?auto_375138 ?auto_375143 ) ) ( not ( = ?auto_375138 ?auto_375144 ) ) ( not ( = ?auto_375138 ?auto_375145 ) ) ( not ( = ?auto_375138 ?auto_375146 ) ) ( not ( = ?auto_375138 ?auto_375147 ) ) ( not ( = ?auto_375139 ?auto_375140 ) ) ( not ( = ?auto_375139 ?auto_375141 ) ) ( not ( = ?auto_375139 ?auto_375142 ) ) ( not ( = ?auto_375139 ?auto_375143 ) ) ( not ( = ?auto_375139 ?auto_375144 ) ) ( not ( = ?auto_375139 ?auto_375145 ) ) ( not ( = ?auto_375139 ?auto_375146 ) ) ( not ( = ?auto_375139 ?auto_375147 ) ) ( not ( = ?auto_375140 ?auto_375141 ) ) ( not ( = ?auto_375140 ?auto_375142 ) ) ( not ( = ?auto_375140 ?auto_375143 ) ) ( not ( = ?auto_375140 ?auto_375144 ) ) ( not ( = ?auto_375140 ?auto_375145 ) ) ( not ( = ?auto_375140 ?auto_375146 ) ) ( not ( = ?auto_375140 ?auto_375147 ) ) ( not ( = ?auto_375141 ?auto_375142 ) ) ( not ( = ?auto_375141 ?auto_375143 ) ) ( not ( = ?auto_375141 ?auto_375144 ) ) ( not ( = ?auto_375141 ?auto_375145 ) ) ( not ( = ?auto_375141 ?auto_375146 ) ) ( not ( = ?auto_375141 ?auto_375147 ) ) ( not ( = ?auto_375142 ?auto_375143 ) ) ( not ( = ?auto_375142 ?auto_375144 ) ) ( not ( = ?auto_375142 ?auto_375145 ) ) ( not ( = ?auto_375142 ?auto_375146 ) ) ( not ( = ?auto_375142 ?auto_375147 ) ) ( not ( = ?auto_375143 ?auto_375144 ) ) ( not ( = ?auto_375143 ?auto_375145 ) ) ( not ( = ?auto_375143 ?auto_375146 ) ) ( not ( = ?auto_375143 ?auto_375147 ) ) ( not ( = ?auto_375144 ?auto_375145 ) ) ( not ( = ?auto_375144 ?auto_375146 ) ) ( not ( = ?auto_375144 ?auto_375147 ) ) ( not ( = ?auto_375145 ?auto_375146 ) ) ( not ( = ?auto_375145 ?auto_375147 ) ) ( not ( = ?auto_375146 ?auto_375147 ) ) ( ON ?auto_375145 ?auto_375146 ) ( ON ?auto_375144 ?auto_375145 ) ( ON ?auto_375143 ?auto_375144 ) ( ON ?auto_375142 ?auto_375143 ) ( ON ?auto_375141 ?auto_375142 ) ( ON ?auto_375140 ?auto_375141 ) ( ON ?auto_375139 ?auto_375140 ) ( ON ?auto_375138 ?auto_375139 ) ( ON ?auto_375137 ?auto_375138 ) ( CLEAR ?auto_375135 ) ( ON ?auto_375136 ?auto_375137 ) ( CLEAR ?auto_375136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_375133 ?auto_375134 ?auto_375135 ?auto_375136 )
      ( MAKE-14PILE ?auto_375133 ?auto_375134 ?auto_375135 ?auto_375136 ?auto_375137 ?auto_375138 ?auto_375139 ?auto_375140 ?auto_375141 ?auto_375142 ?auto_375143 ?auto_375144 ?auto_375145 ?auto_375146 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375162 - BLOCK
      ?auto_375163 - BLOCK
      ?auto_375164 - BLOCK
      ?auto_375165 - BLOCK
      ?auto_375166 - BLOCK
      ?auto_375167 - BLOCK
      ?auto_375168 - BLOCK
      ?auto_375169 - BLOCK
      ?auto_375170 - BLOCK
      ?auto_375171 - BLOCK
      ?auto_375172 - BLOCK
      ?auto_375173 - BLOCK
      ?auto_375174 - BLOCK
      ?auto_375175 - BLOCK
    )
    :vars
    (
      ?auto_375176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375175 ?auto_375176 ) ( ON-TABLE ?auto_375162 ) ( ON ?auto_375163 ?auto_375162 ) ( not ( = ?auto_375162 ?auto_375163 ) ) ( not ( = ?auto_375162 ?auto_375164 ) ) ( not ( = ?auto_375162 ?auto_375165 ) ) ( not ( = ?auto_375162 ?auto_375166 ) ) ( not ( = ?auto_375162 ?auto_375167 ) ) ( not ( = ?auto_375162 ?auto_375168 ) ) ( not ( = ?auto_375162 ?auto_375169 ) ) ( not ( = ?auto_375162 ?auto_375170 ) ) ( not ( = ?auto_375162 ?auto_375171 ) ) ( not ( = ?auto_375162 ?auto_375172 ) ) ( not ( = ?auto_375162 ?auto_375173 ) ) ( not ( = ?auto_375162 ?auto_375174 ) ) ( not ( = ?auto_375162 ?auto_375175 ) ) ( not ( = ?auto_375162 ?auto_375176 ) ) ( not ( = ?auto_375163 ?auto_375164 ) ) ( not ( = ?auto_375163 ?auto_375165 ) ) ( not ( = ?auto_375163 ?auto_375166 ) ) ( not ( = ?auto_375163 ?auto_375167 ) ) ( not ( = ?auto_375163 ?auto_375168 ) ) ( not ( = ?auto_375163 ?auto_375169 ) ) ( not ( = ?auto_375163 ?auto_375170 ) ) ( not ( = ?auto_375163 ?auto_375171 ) ) ( not ( = ?auto_375163 ?auto_375172 ) ) ( not ( = ?auto_375163 ?auto_375173 ) ) ( not ( = ?auto_375163 ?auto_375174 ) ) ( not ( = ?auto_375163 ?auto_375175 ) ) ( not ( = ?auto_375163 ?auto_375176 ) ) ( not ( = ?auto_375164 ?auto_375165 ) ) ( not ( = ?auto_375164 ?auto_375166 ) ) ( not ( = ?auto_375164 ?auto_375167 ) ) ( not ( = ?auto_375164 ?auto_375168 ) ) ( not ( = ?auto_375164 ?auto_375169 ) ) ( not ( = ?auto_375164 ?auto_375170 ) ) ( not ( = ?auto_375164 ?auto_375171 ) ) ( not ( = ?auto_375164 ?auto_375172 ) ) ( not ( = ?auto_375164 ?auto_375173 ) ) ( not ( = ?auto_375164 ?auto_375174 ) ) ( not ( = ?auto_375164 ?auto_375175 ) ) ( not ( = ?auto_375164 ?auto_375176 ) ) ( not ( = ?auto_375165 ?auto_375166 ) ) ( not ( = ?auto_375165 ?auto_375167 ) ) ( not ( = ?auto_375165 ?auto_375168 ) ) ( not ( = ?auto_375165 ?auto_375169 ) ) ( not ( = ?auto_375165 ?auto_375170 ) ) ( not ( = ?auto_375165 ?auto_375171 ) ) ( not ( = ?auto_375165 ?auto_375172 ) ) ( not ( = ?auto_375165 ?auto_375173 ) ) ( not ( = ?auto_375165 ?auto_375174 ) ) ( not ( = ?auto_375165 ?auto_375175 ) ) ( not ( = ?auto_375165 ?auto_375176 ) ) ( not ( = ?auto_375166 ?auto_375167 ) ) ( not ( = ?auto_375166 ?auto_375168 ) ) ( not ( = ?auto_375166 ?auto_375169 ) ) ( not ( = ?auto_375166 ?auto_375170 ) ) ( not ( = ?auto_375166 ?auto_375171 ) ) ( not ( = ?auto_375166 ?auto_375172 ) ) ( not ( = ?auto_375166 ?auto_375173 ) ) ( not ( = ?auto_375166 ?auto_375174 ) ) ( not ( = ?auto_375166 ?auto_375175 ) ) ( not ( = ?auto_375166 ?auto_375176 ) ) ( not ( = ?auto_375167 ?auto_375168 ) ) ( not ( = ?auto_375167 ?auto_375169 ) ) ( not ( = ?auto_375167 ?auto_375170 ) ) ( not ( = ?auto_375167 ?auto_375171 ) ) ( not ( = ?auto_375167 ?auto_375172 ) ) ( not ( = ?auto_375167 ?auto_375173 ) ) ( not ( = ?auto_375167 ?auto_375174 ) ) ( not ( = ?auto_375167 ?auto_375175 ) ) ( not ( = ?auto_375167 ?auto_375176 ) ) ( not ( = ?auto_375168 ?auto_375169 ) ) ( not ( = ?auto_375168 ?auto_375170 ) ) ( not ( = ?auto_375168 ?auto_375171 ) ) ( not ( = ?auto_375168 ?auto_375172 ) ) ( not ( = ?auto_375168 ?auto_375173 ) ) ( not ( = ?auto_375168 ?auto_375174 ) ) ( not ( = ?auto_375168 ?auto_375175 ) ) ( not ( = ?auto_375168 ?auto_375176 ) ) ( not ( = ?auto_375169 ?auto_375170 ) ) ( not ( = ?auto_375169 ?auto_375171 ) ) ( not ( = ?auto_375169 ?auto_375172 ) ) ( not ( = ?auto_375169 ?auto_375173 ) ) ( not ( = ?auto_375169 ?auto_375174 ) ) ( not ( = ?auto_375169 ?auto_375175 ) ) ( not ( = ?auto_375169 ?auto_375176 ) ) ( not ( = ?auto_375170 ?auto_375171 ) ) ( not ( = ?auto_375170 ?auto_375172 ) ) ( not ( = ?auto_375170 ?auto_375173 ) ) ( not ( = ?auto_375170 ?auto_375174 ) ) ( not ( = ?auto_375170 ?auto_375175 ) ) ( not ( = ?auto_375170 ?auto_375176 ) ) ( not ( = ?auto_375171 ?auto_375172 ) ) ( not ( = ?auto_375171 ?auto_375173 ) ) ( not ( = ?auto_375171 ?auto_375174 ) ) ( not ( = ?auto_375171 ?auto_375175 ) ) ( not ( = ?auto_375171 ?auto_375176 ) ) ( not ( = ?auto_375172 ?auto_375173 ) ) ( not ( = ?auto_375172 ?auto_375174 ) ) ( not ( = ?auto_375172 ?auto_375175 ) ) ( not ( = ?auto_375172 ?auto_375176 ) ) ( not ( = ?auto_375173 ?auto_375174 ) ) ( not ( = ?auto_375173 ?auto_375175 ) ) ( not ( = ?auto_375173 ?auto_375176 ) ) ( not ( = ?auto_375174 ?auto_375175 ) ) ( not ( = ?auto_375174 ?auto_375176 ) ) ( not ( = ?auto_375175 ?auto_375176 ) ) ( ON ?auto_375174 ?auto_375175 ) ( ON ?auto_375173 ?auto_375174 ) ( ON ?auto_375172 ?auto_375173 ) ( ON ?auto_375171 ?auto_375172 ) ( ON ?auto_375170 ?auto_375171 ) ( ON ?auto_375169 ?auto_375170 ) ( ON ?auto_375168 ?auto_375169 ) ( ON ?auto_375167 ?auto_375168 ) ( ON ?auto_375166 ?auto_375167 ) ( ON ?auto_375165 ?auto_375166 ) ( CLEAR ?auto_375163 ) ( ON ?auto_375164 ?auto_375165 ) ( CLEAR ?auto_375164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_375162 ?auto_375163 ?auto_375164 )
      ( MAKE-14PILE ?auto_375162 ?auto_375163 ?auto_375164 ?auto_375165 ?auto_375166 ?auto_375167 ?auto_375168 ?auto_375169 ?auto_375170 ?auto_375171 ?auto_375172 ?auto_375173 ?auto_375174 ?auto_375175 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375191 - BLOCK
      ?auto_375192 - BLOCK
      ?auto_375193 - BLOCK
      ?auto_375194 - BLOCK
      ?auto_375195 - BLOCK
      ?auto_375196 - BLOCK
      ?auto_375197 - BLOCK
      ?auto_375198 - BLOCK
      ?auto_375199 - BLOCK
      ?auto_375200 - BLOCK
      ?auto_375201 - BLOCK
      ?auto_375202 - BLOCK
      ?auto_375203 - BLOCK
      ?auto_375204 - BLOCK
    )
    :vars
    (
      ?auto_375205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375204 ?auto_375205 ) ( ON-TABLE ?auto_375191 ) ( ON ?auto_375192 ?auto_375191 ) ( not ( = ?auto_375191 ?auto_375192 ) ) ( not ( = ?auto_375191 ?auto_375193 ) ) ( not ( = ?auto_375191 ?auto_375194 ) ) ( not ( = ?auto_375191 ?auto_375195 ) ) ( not ( = ?auto_375191 ?auto_375196 ) ) ( not ( = ?auto_375191 ?auto_375197 ) ) ( not ( = ?auto_375191 ?auto_375198 ) ) ( not ( = ?auto_375191 ?auto_375199 ) ) ( not ( = ?auto_375191 ?auto_375200 ) ) ( not ( = ?auto_375191 ?auto_375201 ) ) ( not ( = ?auto_375191 ?auto_375202 ) ) ( not ( = ?auto_375191 ?auto_375203 ) ) ( not ( = ?auto_375191 ?auto_375204 ) ) ( not ( = ?auto_375191 ?auto_375205 ) ) ( not ( = ?auto_375192 ?auto_375193 ) ) ( not ( = ?auto_375192 ?auto_375194 ) ) ( not ( = ?auto_375192 ?auto_375195 ) ) ( not ( = ?auto_375192 ?auto_375196 ) ) ( not ( = ?auto_375192 ?auto_375197 ) ) ( not ( = ?auto_375192 ?auto_375198 ) ) ( not ( = ?auto_375192 ?auto_375199 ) ) ( not ( = ?auto_375192 ?auto_375200 ) ) ( not ( = ?auto_375192 ?auto_375201 ) ) ( not ( = ?auto_375192 ?auto_375202 ) ) ( not ( = ?auto_375192 ?auto_375203 ) ) ( not ( = ?auto_375192 ?auto_375204 ) ) ( not ( = ?auto_375192 ?auto_375205 ) ) ( not ( = ?auto_375193 ?auto_375194 ) ) ( not ( = ?auto_375193 ?auto_375195 ) ) ( not ( = ?auto_375193 ?auto_375196 ) ) ( not ( = ?auto_375193 ?auto_375197 ) ) ( not ( = ?auto_375193 ?auto_375198 ) ) ( not ( = ?auto_375193 ?auto_375199 ) ) ( not ( = ?auto_375193 ?auto_375200 ) ) ( not ( = ?auto_375193 ?auto_375201 ) ) ( not ( = ?auto_375193 ?auto_375202 ) ) ( not ( = ?auto_375193 ?auto_375203 ) ) ( not ( = ?auto_375193 ?auto_375204 ) ) ( not ( = ?auto_375193 ?auto_375205 ) ) ( not ( = ?auto_375194 ?auto_375195 ) ) ( not ( = ?auto_375194 ?auto_375196 ) ) ( not ( = ?auto_375194 ?auto_375197 ) ) ( not ( = ?auto_375194 ?auto_375198 ) ) ( not ( = ?auto_375194 ?auto_375199 ) ) ( not ( = ?auto_375194 ?auto_375200 ) ) ( not ( = ?auto_375194 ?auto_375201 ) ) ( not ( = ?auto_375194 ?auto_375202 ) ) ( not ( = ?auto_375194 ?auto_375203 ) ) ( not ( = ?auto_375194 ?auto_375204 ) ) ( not ( = ?auto_375194 ?auto_375205 ) ) ( not ( = ?auto_375195 ?auto_375196 ) ) ( not ( = ?auto_375195 ?auto_375197 ) ) ( not ( = ?auto_375195 ?auto_375198 ) ) ( not ( = ?auto_375195 ?auto_375199 ) ) ( not ( = ?auto_375195 ?auto_375200 ) ) ( not ( = ?auto_375195 ?auto_375201 ) ) ( not ( = ?auto_375195 ?auto_375202 ) ) ( not ( = ?auto_375195 ?auto_375203 ) ) ( not ( = ?auto_375195 ?auto_375204 ) ) ( not ( = ?auto_375195 ?auto_375205 ) ) ( not ( = ?auto_375196 ?auto_375197 ) ) ( not ( = ?auto_375196 ?auto_375198 ) ) ( not ( = ?auto_375196 ?auto_375199 ) ) ( not ( = ?auto_375196 ?auto_375200 ) ) ( not ( = ?auto_375196 ?auto_375201 ) ) ( not ( = ?auto_375196 ?auto_375202 ) ) ( not ( = ?auto_375196 ?auto_375203 ) ) ( not ( = ?auto_375196 ?auto_375204 ) ) ( not ( = ?auto_375196 ?auto_375205 ) ) ( not ( = ?auto_375197 ?auto_375198 ) ) ( not ( = ?auto_375197 ?auto_375199 ) ) ( not ( = ?auto_375197 ?auto_375200 ) ) ( not ( = ?auto_375197 ?auto_375201 ) ) ( not ( = ?auto_375197 ?auto_375202 ) ) ( not ( = ?auto_375197 ?auto_375203 ) ) ( not ( = ?auto_375197 ?auto_375204 ) ) ( not ( = ?auto_375197 ?auto_375205 ) ) ( not ( = ?auto_375198 ?auto_375199 ) ) ( not ( = ?auto_375198 ?auto_375200 ) ) ( not ( = ?auto_375198 ?auto_375201 ) ) ( not ( = ?auto_375198 ?auto_375202 ) ) ( not ( = ?auto_375198 ?auto_375203 ) ) ( not ( = ?auto_375198 ?auto_375204 ) ) ( not ( = ?auto_375198 ?auto_375205 ) ) ( not ( = ?auto_375199 ?auto_375200 ) ) ( not ( = ?auto_375199 ?auto_375201 ) ) ( not ( = ?auto_375199 ?auto_375202 ) ) ( not ( = ?auto_375199 ?auto_375203 ) ) ( not ( = ?auto_375199 ?auto_375204 ) ) ( not ( = ?auto_375199 ?auto_375205 ) ) ( not ( = ?auto_375200 ?auto_375201 ) ) ( not ( = ?auto_375200 ?auto_375202 ) ) ( not ( = ?auto_375200 ?auto_375203 ) ) ( not ( = ?auto_375200 ?auto_375204 ) ) ( not ( = ?auto_375200 ?auto_375205 ) ) ( not ( = ?auto_375201 ?auto_375202 ) ) ( not ( = ?auto_375201 ?auto_375203 ) ) ( not ( = ?auto_375201 ?auto_375204 ) ) ( not ( = ?auto_375201 ?auto_375205 ) ) ( not ( = ?auto_375202 ?auto_375203 ) ) ( not ( = ?auto_375202 ?auto_375204 ) ) ( not ( = ?auto_375202 ?auto_375205 ) ) ( not ( = ?auto_375203 ?auto_375204 ) ) ( not ( = ?auto_375203 ?auto_375205 ) ) ( not ( = ?auto_375204 ?auto_375205 ) ) ( ON ?auto_375203 ?auto_375204 ) ( ON ?auto_375202 ?auto_375203 ) ( ON ?auto_375201 ?auto_375202 ) ( ON ?auto_375200 ?auto_375201 ) ( ON ?auto_375199 ?auto_375200 ) ( ON ?auto_375198 ?auto_375199 ) ( ON ?auto_375197 ?auto_375198 ) ( ON ?auto_375196 ?auto_375197 ) ( ON ?auto_375195 ?auto_375196 ) ( ON ?auto_375194 ?auto_375195 ) ( CLEAR ?auto_375192 ) ( ON ?auto_375193 ?auto_375194 ) ( CLEAR ?auto_375193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_375191 ?auto_375192 ?auto_375193 )
      ( MAKE-14PILE ?auto_375191 ?auto_375192 ?auto_375193 ?auto_375194 ?auto_375195 ?auto_375196 ?auto_375197 ?auto_375198 ?auto_375199 ?auto_375200 ?auto_375201 ?auto_375202 ?auto_375203 ?auto_375204 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375220 - BLOCK
      ?auto_375221 - BLOCK
      ?auto_375222 - BLOCK
      ?auto_375223 - BLOCK
      ?auto_375224 - BLOCK
      ?auto_375225 - BLOCK
      ?auto_375226 - BLOCK
      ?auto_375227 - BLOCK
      ?auto_375228 - BLOCK
      ?auto_375229 - BLOCK
      ?auto_375230 - BLOCK
      ?auto_375231 - BLOCK
      ?auto_375232 - BLOCK
      ?auto_375233 - BLOCK
    )
    :vars
    (
      ?auto_375234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375233 ?auto_375234 ) ( ON-TABLE ?auto_375220 ) ( not ( = ?auto_375220 ?auto_375221 ) ) ( not ( = ?auto_375220 ?auto_375222 ) ) ( not ( = ?auto_375220 ?auto_375223 ) ) ( not ( = ?auto_375220 ?auto_375224 ) ) ( not ( = ?auto_375220 ?auto_375225 ) ) ( not ( = ?auto_375220 ?auto_375226 ) ) ( not ( = ?auto_375220 ?auto_375227 ) ) ( not ( = ?auto_375220 ?auto_375228 ) ) ( not ( = ?auto_375220 ?auto_375229 ) ) ( not ( = ?auto_375220 ?auto_375230 ) ) ( not ( = ?auto_375220 ?auto_375231 ) ) ( not ( = ?auto_375220 ?auto_375232 ) ) ( not ( = ?auto_375220 ?auto_375233 ) ) ( not ( = ?auto_375220 ?auto_375234 ) ) ( not ( = ?auto_375221 ?auto_375222 ) ) ( not ( = ?auto_375221 ?auto_375223 ) ) ( not ( = ?auto_375221 ?auto_375224 ) ) ( not ( = ?auto_375221 ?auto_375225 ) ) ( not ( = ?auto_375221 ?auto_375226 ) ) ( not ( = ?auto_375221 ?auto_375227 ) ) ( not ( = ?auto_375221 ?auto_375228 ) ) ( not ( = ?auto_375221 ?auto_375229 ) ) ( not ( = ?auto_375221 ?auto_375230 ) ) ( not ( = ?auto_375221 ?auto_375231 ) ) ( not ( = ?auto_375221 ?auto_375232 ) ) ( not ( = ?auto_375221 ?auto_375233 ) ) ( not ( = ?auto_375221 ?auto_375234 ) ) ( not ( = ?auto_375222 ?auto_375223 ) ) ( not ( = ?auto_375222 ?auto_375224 ) ) ( not ( = ?auto_375222 ?auto_375225 ) ) ( not ( = ?auto_375222 ?auto_375226 ) ) ( not ( = ?auto_375222 ?auto_375227 ) ) ( not ( = ?auto_375222 ?auto_375228 ) ) ( not ( = ?auto_375222 ?auto_375229 ) ) ( not ( = ?auto_375222 ?auto_375230 ) ) ( not ( = ?auto_375222 ?auto_375231 ) ) ( not ( = ?auto_375222 ?auto_375232 ) ) ( not ( = ?auto_375222 ?auto_375233 ) ) ( not ( = ?auto_375222 ?auto_375234 ) ) ( not ( = ?auto_375223 ?auto_375224 ) ) ( not ( = ?auto_375223 ?auto_375225 ) ) ( not ( = ?auto_375223 ?auto_375226 ) ) ( not ( = ?auto_375223 ?auto_375227 ) ) ( not ( = ?auto_375223 ?auto_375228 ) ) ( not ( = ?auto_375223 ?auto_375229 ) ) ( not ( = ?auto_375223 ?auto_375230 ) ) ( not ( = ?auto_375223 ?auto_375231 ) ) ( not ( = ?auto_375223 ?auto_375232 ) ) ( not ( = ?auto_375223 ?auto_375233 ) ) ( not ( = ?auto_375223 ?auto_375234 ) ) ( not ( = ?auto_375224 ?auto_375225 ) ) ( not ( = ?auto_375224 ?auto_375226 ) ) ( not ( = ?auto_375224 ?auto_375227 ) ) ( not ( = ?auto_375224 ?auto_375228 ) ) ( not ( = ?auto_375224 ?auto_375229 ) ) ( not ( = ?auto_375224 ?auto_375230 ) ) ( not ( = ?auto_375224 ?auto_375231 ) ) ( not ( = ?auto_375224 ?auto_375232 ) ) ( not ( = ?auto_375224 ?auto_375233 ) ) ( not ( = ?auto_375224 ?auto_375234 ) ) ( not ( = ?auto_375225 ?auto_375226 ) ) ( not ( = ?auto_375225 ?auto_375227 ) ) ( not ( = ?auto_375225 ?auto_375228 ) ) ( not ( = ?auto_375225 ?auto_375229 ) ) ( not ( = ?auto_375225 ?auto_375230 ) ) ( not ( = ?auto_375225 ?auto_375231 ) ) ( not ( = ?auto_375225 ?auto_375232 ) ) ( not ( = ?auto_375225 ?auto_375233 ) ) ( not ( = ?auto_375225 ?auto_375234 ) ) ( not ( = ?auto_375226 ?auto_375227 ) ) ( not ( = ?auto_375226 ?auto_375228 ) ) ( not ( = ?auto_375226 ?auto_375229 ) ) ( not ( = ?auto_375226 ?auto_375230 ) ) ( not ( = ?auto_375226 ?auto_375231 ) ) ( not ( = ?auto_375226 ?auto_375232 ) ) ( not ( = ?auto_375226 ?auto_375233 ) ) ( not ( = ?auto_375226 ?auto_375234 ) ) ( not ( = ?auto_375227 ?auto_375228 ) ) ( not ( = ?auto_375227 ?auto_375229 ) ) ( not ( = ?auto_375227 ?auto_375230 ) ) ( not ( = ?auto_375227 ?auto_375231 ) ) ( not ( = ?auto_375227 ?auto_375232 ) ) ( not ( = ?auto_375227 ?auto_375233 ) ) ( not ( = ?auto_375227 ?auto_375234 ) ) ( not ( = ?auto_375228 ?auto_375229 ) ) ( not ( = ?auto_375228 ?auto_375230 ) ) ( not ( = ?auto_375228 ?auto_375231 ) ) ( not ( = ?auto_375228 ?auto_375232 ) ) ( not ( = ?auto_375228 ?auto_375233 ) ) ( not ( = ?auto_375228 ?auto_375234 ) ) ( not ( = ?auto_375229 ?auto_375230 ) ) ( not ( = ?auto_375229 ?auto_375231 ) ) ( not ( = ?auto_375229 ?auto_375232 ) ) ( not ( = ?auto_375229 ?auto_375233 ) ) ( not ( = ?auto_375229 ?auto_375234 ) ) ( not ( = ?auto_375230 ?auto_375231 ) ) ( not ( = ?auto_375230 ?auto_375232 ) ) ( not ( = ?auto_375230 ?auto_375233 ) ) ( not ( = ?auto_375230 ?auto_375234 ) ) ( not ( = ?auto_375231 ?auto_375232 ) ) ( not ( = ?auto_375231 ?auto_375233 ) ) ( not ( = ?auto_375231 ?auto_375234 ) ) ( not ( = ?auto_375232 ?auto_375233 ) ) ( not ( = ?auto_375232 ?auto_375234 ) ) ( not ( = ?auto_375233 ?auto_375234 ) ) ( ON ?auto_375232 ?auto_375233 ) ( ON ?auto_375231 ?auto_375232 ) ( ON ?auto_375230 ?auto_375231 ) ( ON ?auto_375229 ?auto_375230 ) ( ON ?auto_375228 ?auto_375229 ) ( ON ?auto_375227 ?auto_375228 ) ( ON ?auto_375226 ?auto_375227 ) ( ON ?auto_375225 ?auto_375226 ) ( ON ?auto_375224 ?auto_375225 ) ( ON ?auto_375223 ?auto_375224 ) ( ON ?auto_375222 ?auto_375223 ) ( CLEAR ?auto_375220 ) ( ON ?auto_375221 ?auto_375222 ) ( CLEAR ?auto_375221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_375220 ?auto_375221 )
      ( MAKE-14PILE ?auto_375220 ?auto_375221 ?auto_375222 ?auto_375223 ?auto_375224 ?auto_375225 ?auto_375226 ?auto_375227 ?auto_375228 ?auto_375229 ?auto_375230 ?auto_375231 ?auto_375232 ?auto_375233 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375249 - BLOCK
      ?auto_375250 - BLOCK
      ?auto_375251 - BLOCK
      ?auto_375252 - BLOCK
      ?auto_375253 - BLOCK
      ?auto_375254 - BLOCK
      ?auto_375255 - BLOCK
      ?auto_375256 - BLOCK
      ?auto_375257 - BLOCK
      ?auto_375258 - BLOCK
      ?auto_375259 - BLOCK
      ?auto_375260 - BLOCK
      ?auto_375261 - BLOCK
      ?auto_375262 - BLOCK
    )
    :vars
    (
      ?auto_375263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375262 ?auto_375263 ) ( ON-TABLE ?auto_375249 ) ( not ( = ?auto_375249 ?auto_375250 ) ) ( not ( = ?auto_375249 ?auto_375251 ) ) ( not ( = ?auto_375249 ?auto_375252 ) ) ( not ( = ?auto_375249 ?auto_375253 ) ) ( not ( = ?auto_375249 ?auto_375254 ) ) ( not ( = ?auto_375249 ?auto_375255 ) ) ( not ( = ?auto_375249 ?auto_375256 ) ) ( not ( = ?auto_375249 ?auto_375257 ) ) ( not ( = ?auto_375249 ?auto_375258 ) ) ( not ( = ?auto_375249 ?auto_375259 ) ) ( not ( = ?auto_375249 ?auto_375260 ) ) ( not ( = ?auto_375249 ?auto_375261 ) ) ( not ( = ?auto_375249 ?auto_375262 ) ) ( not ( = ?auto_375249 ?auto_375263 ) ) ( not ( = ?auto_375250 ?auto_375251 ) ) ( not ( = ?auto_375250 ?auto_375252 ) ) ( not ( = ?auto_375250 ?auto_375253 ) ) ( not ( = ?auto_375250 ?auto_375254 ) ) ( not ( = ?auto_375250 ?auto_375255 ) ) ( not ( = ?auto_375250 ?auto_375256 ) ) ( not ( = ?auto_375250 ?auto_375257 ) ) ( not ( = ?auto_375250 ?auto_375258 ) ) ( not ( = ?auto_375250 ?auto_375259 ) ) ( not ( = ?auto_375250 ?auto_375260 ) ) ( not ( = ?auto_375250 ?auto_375261 ) ) ( not ( = ?auto_375250 ?auto_375262 ) ) ( not ( = ?auto_375250 ?auto_375263 ) ) ( not ( = ?auto_375251 ?auto_375252 ) ) ( not ( = ?auto_375251 ?auto_375253 ) ) ( not ( = ?auto_375251 ?auto_375254 ) ) ( not ( = ?auto_375251 ?auto_375255 ) ) ( not ( = ?auto_375251 ?auto_375256 ) ) ( not ( = ?auto_375251 ?auto_375257 ) ) ( not ( = ?auto_375251 ?auto_375258 ) ) ( not ( = ?auto_375251 ?auto_375259 ) ) ( not ( = ?auto_375251 ?auto_375260 ) ) ( not ( = ?auto_375251 ?auto_375261 ) ) ( not ( = ?auto_375251 ?auto_375262 ) ) ( not ( = ?auto_375251 ?auto_375263 ) ) ( not ( = ?auto_375252 ?auto_375253 ) ) ( not ( = ?auto_375252 ?auto_375254 ) ) ( not ( = ?auto_375252 ?auto_375255 ) ) ( not ( = ?auto_375252 ?auto_375256 ) ) ( not ( = ?auto_375252 ?auto_375257 ) ) ( not ( = ?auto_375252 ?auto_375258 ) ) ( not ( = ?auto_375252 ?auto_375259 ) ) ( not ( = ?auto_375252 ?auto_375260 ) ) ( not ( = ?auto_375252 ?auto_375261 ) ) ( not ( = ?auto_375252 ?auto_375262 ) ) ( not ( = ?auto_375252 ?auto_375263 ) ) ( not ( = ?auto_375253 ?auto_375254 ) ) ( not ( = ?auto_375253 ?auto_375255 ) ) ( not ( = ?auto_375253 ?auto_375256 ) ) ( not ( = ?auto_375253 ?auto_375257 ) ) ( not ( = ?auto_375253 ?auto_375258 ) ) ( not ( = ?auto_375253 ?auto_375259 ) ) ( not ( = ?auto_375253 ?auto_375260 ) ) ( not ( = ?auto_375253 ?auto_375261 ) ) ( not ( = ?auto_375253 ?auto_375262 ) ) ( not ( = ?auto_375253 ?auto_375263 ) ) ( not ( = ?auto_375254 ?auto_375255 ) ) ( not ( = ?auto_375254 ?auto_375256 ) ) ( not ( = ?auto_375254 ?auto_375257 ) ) ( not ( = ?auto_375254 ?auto_375258 ) ) ( not ( = ?auto_375254 ?auto_375259 ) ) ( not ( = ?auto_375254 ?auto_375260 ) ) ( not ( = ?auto_375254 ?auto_375261 ) ) ( not ( = ?auto_375254 ?auto_375262 ) ) ( not ( = ?auto_375254 ?auto_375263 ) ) ( not ( = ?auto_375255 ?auto_375256 ) ) ( not ( = ?auto_375255 ?auto_375257 ) ) ( not ( = ?auto_375255 ?auto_375258 ) ) ( not ( = ?auto_375255 ?auto_375259 ) ) ( not ( = ?auto_375255 ?auto_375260 ) ) ( not ( = ?auto_375255 ?auto_375261 ) ) ( not ( = ?auto_375255 ?auto_375262 ) ) ( not ( = ?auto_375255 ?auto_375263 ) ) ( not ( = ?auto_375256 ?auto_375257 ) ) ( not ( = ?auto_375256 ?auto_375258 ) ) ( not ( = ?auto_375256 ?auto_375259 ) ) ( not ( = ?auto_375256 ?auto_375260 ) ) ( not ( = ?auto_375256 ?auto_375261 ) ) ( not ( = ?auto_375256 ?auto_375262 ) ) ( not ( = ?auto_375256 ?auto_375263 ) ) ( not ( = ?auto_375257 ?auto_375258 ) ) ( not ( = ?auto_375257 ?auto_375259 ) ) ( not ( = ?auto_375257 ?auto_375260 ) ) ( not ( = ?auto_375257 ?auto_375261 ) ) ( not ( = ?auto_375257 ?auto_375262 ) ) ( not ( = ?auto_375257 ?auto_375263 ) ) ( not ( = ?auto_375258 ?auto_375259 ) ) ( not ( = ?auto_375258 ?auto_375260 ) ) ( not ( = ?auto_375258 ?auto_375261 ) ) ( not ( = ?auto_375258 ?auto_375262 ) ) ( not ( = ?auto_375258 ?auto_375263 ) ) ( not ( = ?auto_375259 ?auto_375260 ) ) ( not ( = ?auto_375259 ?auto_375261 ) ) ( not ( = ?auto_375259 ?auto_375262 ) ) ( not ( = ?auto_375259 ?auto_375263 ) ) ( not ( = ?auto_375260 ?auto_375261 ) ) ( not ( = ?auto_375260 ?auto_375262 ) ) ( not ( = ?auto_375260 ?auto_375263 ) ) ( not ( = ?auto_375261 ?auto_375262 ) ) ( not ( = ?auto_375261 ?auto_375263 ) ) ( not ( = ?auto_375262 ?auto_375263 ) ) ( ON ?auto_375261 ?auto_375262 ) ( ON ?auto_375260 ?auto_375261 ) ( ON ?auto_375259 ?auto_375260 ) ( ON ?auto_375258 ?auto_375259 ) ( ON ?auto_375257 ?auto_375258 ) ( ON ?auto_375256 ?auto_375257 ) ( ON ?auto_375255 ?auto_375256 ) ( ON ?auto_375254 ?auto_375255 ) ( ON ?auto_375253 ?auto_375254 ) ( ON ?auto_375252 ?auto_375253 ) ( ON ?auto_375251 ?auto_375252 ) ( CLEAR ?auto_375249 ) ( ON ?auto_375250 ?auto_375251 ) ( CLEAR ?auto_375250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_375249 ?auto_375250 )
      ( MAKE-14PILE ?auto_375249 ?auto_375250 ?auto_375251 ?auto_375252 ?auto_375253 ?auto_375254 ?auto_375255 ?auto_375256 ?auto_375257 ?auto_375258 ?auto_375259 ?auto_375260 ?auto_375261 ?auto_375262 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375278 - BLOCK
      ?auto_375279 - BLOCK
      ?auto_375280 - BLOCK
      ?auto_375281 - BLOCK
      ?auto_375282 - BLOCK
      ?auto_375283 - BLOCK
      ?auto_375284 - BLOCK
      ?auto_375285 - BLOCK
      ?auto_375286 - BLOCK
      ?auto_375287 - BLOCK
      ?auto_375288 - BLOCK
      ?auto_375289 - BLOCK
      ?auto_375290 - BLOCK
      ?auto_375291 - BLOCK
    )
    :vars
    (
      ?auto_375292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375291 ?auto_375292 ) ( not ( = ?auto_375278 ?auto_375279 ) ) ( not ( = ?auto_375278 ?auto_375280 ) ) ( not ( = ?auto_375278 ?auto_375281 ) ) ( not ( = ?auto_375278 ?auto_375282 ) ) ( not ( = ?auto_375278 ?auto_375283 ) ) ( not ( = ?auto_375278 ?auto_375284 ) ) ( not ( = ?auto_375278 ?auto_375285 ) ) ( not ( = ?auto_375278 ?auto_375286 ) ) ( not ( = ?auto_375278 ?auto_375287 ) ) ( not ( = ?auto_375278 ?auto_375288 ) ) ( not ( = ?auto_375278 ?auto_375289 ) ) ( not ( = ?auto_375278 ?auto_375290 ) ) ( not ( = ?auto_375278 ?auto_375291 ) ) ( not ( = ?auto_375278 ?auto_375292 ) ) ( not ( = ?auto_375279 ?auto_375280 ) ) ( not ( = ?auto_375279 ?auto_375281 ) ) ( not ( = ?auto_375279 ?auto_375282 ) ) ( not ( = ?auto_375279 ?auto_375283 ) ) ( not ( = ?auto_375279 ?auto_375284 ) ) ( not ( = ?auto_375279 ?auto_375285 ) ) ( not ( = ?auto_375279 ?auto_375286 ) ) ( not ( = ?auto_375279 ?auto_375287 ) ) ( not ( = ?auto_375279 ?auto_375288 ) ) ( not ( = ?auto_375279 ?auto_375289 ) ) ( not ( = ?auto_375279 ?auto_375290 ) ) ( not ( = ?auto_375279 ?auto_375291 ) ) ( not ( = ?auto_375279 ?auto_375292 ) ) ( not ( = ?auto_375280 ?auto_375281 ) ) ( not ( = ?auto_375280 ?auto_375282 ) ) ( not ( = ?auto_375280 ?auto_375283 ) ) ( not ( = ?auto_375280 ?auto_375284 ) ) ( not ( = ?auto_375280 ?auto_375285 ) ) ( not ( = ?auto_375280 ?auto_375286 ) ) ( not ( = ?auto_375280 ?auto_375287 ) ) ( not ( = ?auto_375280 ?auto_375288 ) ) ( not ( = ?auto_375280 ?auto_375289 ) ) ( not ( = ?auto_375280 ?auto_375290 ) ) ( not ( = ?auto_375280 ?auto_375291 ) ) ( not ( = ?auto_375280 ?auto_375292 ) ) ( not ( = ?auto_375281 ?auto_375282 ) ) ( not ( = ?auto_375281 ?auto_375283 ) ) ( not ( = ?auto_375281 ?auto_375284 ) ) ( not ( = ?auto_375281 ?auto_375285 ) ) ( not ( = ?auto_375281 ?auto_375286 ) ) ( not ( = ?auto_375281 ?auto_375287 ) ) ( not ( = ?auto_375281 ?auto_375288 ) ) ( not ( = ?auto_375281 ?auto_375289 ) ) ( not ( = ?auto_375281 ?auto_375290 ) ) ( not ( = ?auto_375281 ?auto_375291 ) ) ( not ( = ?auto_375281 ?auto_375292 ) ) ( not ( = ?auto_375282 ?auto_375283 ) ) ( not ( = ?auto_375282 ?auto_375284 ) ) ( not ( = ?auto_375282 ?auto_375285 ) ) ( not ( = ?auto_375282 ?auto_375286 ) ) ( not ( = ?auto_375282 ?auto_375287 ) ) ( not ( = ?auto_375282 ?auto_375288 ) ) ( not ( = ?auto_375282 ?auto_375289 ) ) ( not ( = ?auto_375282 ?auto_375290 ) ) ( not ( = ?auto_375282 ?auto_375291 ) ) ( not ( = ?auto_375282 ?auto_375292 ) ) ( not ( = ?auto_375283 ?auto_375284 ) ) ( not ( = ?auto_375283 ?auto_375285 ) ) ( not ( = ?auto_375283 ?auto_375286 ) ) ( not ( = ?auto_375283 ?auto_375287 ) ) ( not ( = ?auto_375283 ?auto_375288 ) ) ( not ( = ?auto_375283 ?auto_375289 ) ) ( not ( = ?auto_375283 ?auto_375290 ) ) ( not ( = ?auto_375283 ?auto_375291 ) ) ( not ( = ?auto_375283 ?auto_375292 ) ) ( not ( = ?auto_375284 ?auto_375285 ) ) ( not ( = ?auto_375284 ?auto_375286 ) ) ( not ( = ?auto_375284 ?auto_375287 ) ) ( not ( = ?auto_375284 ?auto_375288 ) ) ( not ( = ?auto_375284 ?auto_375289 ) ) ( not ( = ?auto_375284 ?auto_375290 ) ) ( not ( = ?auto_375284 ?auto_375291 ) ) ( not ( = ?auto_375284 ?auto_375292 ) ) ( not ( = ?auto_375285 ?auto_375286 ) ) ( not ( = ?auto_375285 ?auto_375287 ) ) ( not ( = ?auto_375285 ?auto_375288 ) ) ( not ( = ?auto_375285 ?auto_375289 ) ) ( not ( = ?auto_375285 ?auto_375290 ) ) ( not ( = ?auto_375285 ?auto_375291 ) ) ( not ( = ?auto_375285 ?auto_375292 ) ) ( not ( = ?auto_375286 ?auto_375287 ) ) ( not ( = ?auto_375286 ?auto_375288 ) ) ( not ( = ?auto_375286 ?auto_375289 ) ) ( not ( = ?auto_375286 ?auto_375290 ) ) ( not ( = ?auto_375286 ?auto_375291 ) ) ( not ( = ?auto_375286 ?auto_375292 ) ) ( not ( = ?auto_375287 ?auto_375288 ) ) ( not ( = ?auto_375287 ?auto_375289 ) ) ( not ( = ?auto_375287 ?auto_375290 ) ) ( not ( = ?auto_375287 ?auto_375291 ) ) ( not ( = ?auto_375287 ?auto_375292 ) ) ( not ( = ?auto_375288 ?auto_375289 ) ) ( not ( = ?auto_375288 ?auto_375290 ) ) ( not ( = ?auto_375288 ?auto_375291 ) ) ( not ( = ?auto_375288 ?auto_375292 ) ) ( not ( = ?auto_375289 ?auto_375290 ) ) ( not ( = ?auto_375289 ?auto_375291 ) ) ( not ( = ?auto_375289 ?auto_375292 ) ) ( not ( = ?auto_375290 ?auto_375291 ) ) ( not ( = ?auto_375290 ?auto_375292 ) ) ( not ( = ?auto_375291 ?auto_375292 ) ) ( ON ?auto_375290 ?auto_375291 ) ( ON ?auto_375289 ?auto_375290 ) ( ON ?auto_375288 ?auto_375289 ) ( ON ?auto_375287 ?auto_375288 ) ( ON ?auto_375286 ?auto_375287 ) ( ON ?auto_375285 ?auto_375286 ) ( ON ?auto_375284 ?auto_375285 ) ( ON ?auto_375283 ?auto_375284 ) ( ON ?auto_375282 ?auto_375283 ) ( ON ?auto_375281 ?auto_375282 ) ( ON ?auto_375280 ?auto_375281 ) ( ON ?auto_375279 ?auto_375280 ) ( ON ?auto_375278 ?auto_375279 ) ( CLEAR ?auto_375278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_375278 )
      ( MAKE-14PILE ?auto_375278 ?auto_375279 ?auto_375280 ?auto_375281 ?auto_375282 ?auto_375283 ?auto_375284 ?auto_375285 ?auto_375286 ?auto_375287 ?auto_375288 ?auto_375289 ?auto_375290 ?auto_375291 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_375307 - BLOCK
      ?auto_375308 - BLOCK
      ?auto_375309 - BLOCK
      ?auto_375310 - BLOCK
      ?auto_375311 - BLOCK
      ?auto_375312 - BLOCK
      ?auto_375313 - BLOCK
      ?auto_375314 - BLOCK
      ?auto_375315 - BLOCK
      ?auto_375316 - BLOCK
      ?auto_375317 - BLOCK
      ?auto_375318 - BLOCK
      ?auto_375319 - BLOCK
      ?auto_375320 - BLOCK
    )
    :vars
    (
      ?auto_375321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375320 ?auto_375321 ) ( not ( = ?auto_375307 ?auto_375308 ) ) ( not ( = ?auto_375307 ?auto_375309 ) ) ( not ( = ?auto_375307 ?auto_375310 ) ) ( not ( = ?auto_375307 ?auto_375311 ) ) ( not ( = ?auto_375307 ?auto_375312 ) ) ( not ( = ?auto_375307 ?auto_375313 ) ) ( not ( = ?auto_375307 ?auto_375314 ) ) ( not ( = ?auto_375307 ?auto_375315 ) ) ( not ( = ?auto_375307 ?auto_375316 ) ) ( not ( = ?auto_375307 ?auto_375317 ) ) ( not ( = ?auto_375307 ?auto_375318 ) ) ( not ( = ?auto_375307 ?auto_375319 ) ) ( not ( = ?auto_375307 ?auto_375320 ) ) ( not ( = ?auto_375307 ?auto_375321 ) ) ( not ( = ?auto_375308 ?auto_375309 ) ) ( not ( = ?auto_375308 ?auto_375310 ) ) ( not ( = ?auto_375308 ?auto_375311 ) ) ( not ( = ?auto_375308 ?auto_375312 ) ) ( not ( = ?auto_375308 ?auto_375313 ) ) ( not ( = ?auto_375308 ?auto_375314 ) ) ( not ( = ?auto_375308 ?auto_375315 ) ) ( not ( = ?auto_375308 ?auto_375316 ) ) ( not ( = ?auto_375308 ?auto_375317 ) ) ( not ( = ?auto_375308 ?auto_375318 ) ) ( not ( = ?auto_375308 ?auto_375319 ) ) ( not ( = ?auto_375308 ?auto_375320 ) ) ( not ( = ?auto_375308 ?auto_375321 ) ) ( not ( = ?auto_375309 ?auto_375310 ) ) ( not ( = ?auto_375309 ?auto_375311 ) ) ( not ( = ?auto_375309 ?auto_375312 ) ) ( not ( = ?auto_375309 ?auto_375313 ) ) ( not ( = ?auto_375309 ?auto_375314 ) ) ( not ( = ?auto_375309 ?auto_375315 ) ) ( not ( = ?auto_375309 ?auto_375316 ) ) ( not ( = ?auto_375309 ?auto_375317 ) ) ( not ( = ?auto_375309 ?auto_375318 ) ) ( not ( = ?auto_375309 ?auto_375319 ) ) ( not ( = ?auto_375309 ?auto_375320 ) ) ( not ( = ?auto_375309 ?auto_375321 ) ) ( not ( = ?auto_375310 ?auto_375311 ) ) ( not ( = ?auto_375310 ?auto_375312 ) ) ( not ( = ?auto_375310 ?auto_375313 ) ) ( not ( = ?auto_375310 ?auto_375314 ) ) ( not ( = ?auto_375310 ?auto_375315 ) ) ( not ( = ?auto_375310 ?auto_375316 ) ) ( not ( = ?auto_375310 ?auto_375317 ) ) ( not ( = ?auto_375310 ?auto_375318 ) ) ( not ( = ?auto_375310 ?auto_375319 ) ) ( not ( = ?auto_375310 ?auto_375320 ) ) ( not ( = ?auto_375310 ?auto_375321 ) ) ( not ( = ?auto_375311 ?auto_375312 ) ) ( not ( = ?auto_375311 ?auto_375313 ) ) ( not ( = ?auto_375311 ?auto_375314 ) ) ( not ( = ?auto_375311 ?auto_375315 ) ) ( not ( = ?auto_375311 ?auto_375316 ) ) ( not ( = ?auto_375311 ?auto_375317 ) ) ( not ( = ?auto_375311 ?auto_375318 ) ) ( not ( = ?auto_375311 ?auto_375319 ) ) ( not ( = ?auto_375311 ?auto_375320 ) ) ( not ( = ?auto_375311 ?auto_375321 ) ) ( not ( = ?auto_375312 ?auto_375313 ) ) ( not ( = ?auto_375312 ?auto_375314 ) ) ( not ( = ?auto_375312 ?auto_375315 ) ) ( not ( = ?auto_375312 ?auto_375316 ) ) ( not ( = ?auto_375312 ?auto_375317 ) ) ( not ( = ?auto_375312 ?auto_375318 ) ) ( not ( = ?auto_375312 ?auto_375319 ) ) ( not ( = ?auto_375312 ?auto_375320 ) ) ( not ( = ?auto_375312 ?auto_375321 ) ) ( not ( = ?auto_375313 ?auto_375314 ) ) ( not ( = ?auto_375313 ?auto_375315 ) ) ( not ( = ?auto_375313 ?auto_375316 ) ) ( not ( = ?auto_375313 ?auto_375317 ) ) ( not ( = ?auto_375313 ?auto_375318 ) ) ( not ( = ?auto_375313 ?auto_375319 ) ) ( not ( = ?auto_375313 ?auto_375320 ) ) ( not ( = ?auto_375313 ?auto_375321 ) ) ( not ( = ?auto_375314 ?auto_375315 ) ) ( not ( = ?auto_375314 ?auto_375316 ) ) ( not ( = ?auto_375314 ?auto_375317 ) ) ( not ( = ?auto_375314 ?auto_375318 ) ) ( not ( = ?auto_375314 ?auto_375319 ) ) ( not ( = ?auto_375314 ?auto_375320 ) ) ( not ( = ?auto_375314 ?auto_375321 ) ) ( not ( = ?auto_375315 ?auto_375316 ) ) ( not ( = ?auto_375315 ?auto_375317 ) ) ( not ( = ?auto_375315 ?auto_375318 ) ) ( not ( = ?auto_375315 ?auto_375319 ) ) ( not ( = ?auto_375315 ?auto_375320 ) ) ( not ( = ?auto_375315 ?auto_375321 ) ) ( not ( = ?auto_375316 ?auto_375317 ) ) ( not ( = ?auto_375316 ?auto_375318 ) ) ( not ( = ?auto_375316 ?auto_375319 ) ) ( not ( = ?auto_375316 ?auto_375320 ) ) ( not ( = ?auto_375316 ?auto_375321 ) ) ( not ( = ?auto_375317 ?auto_375318 ) ) ( not ( = ?auto_375317 ?auto_375319 ) ) ( not ( = ?auto_375317 ?auto_375320 ) ) ( not ( = ?auto_375317 ?auto_375321 ) ) ( not ( = ?auto_375318 ?auto_375319 ) ) ( not ( = ?auto_375318 ?auto_375320 ) ) ( not ( = ?auto_375318 ?auto_375321 ) ) ( not ( = ?auto_375319 ?auto_375320 ) ) ( not ( = ?auto_375319 ?auto_375321 ) ) ( not ( = ?auto_375320 ?auto_375321 ) ) ( ON ?auto_375319 ?auto_375320 ) ( ON ?auto_375318 ?auto_375319 ) ( ON ?auto_375317 ?auto_375318 ) ( ON ?auto_375316 ?auto_375317 ) ( ON ?auto_375315 ?auto_375316 ) ( ON ?auto_375314 ?auto_375315 ) ( ON ?auto_375313 ?auto_375314 ) ( ON ?auto_375312 ?auto_375313 ) ( ON ?auto_375311 ?auto_375312 ) ( ON ?auto_375310 ?auto_375311 ) ( ON ?auto_375309 ?auto_375310 ) ( ON ?auto_375308 ?auto_375309 ) ( ON ?auto_375307 ?auto_375308 ) ( CLEAR ?auto_375307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_375307 )
      ( MAKE-14PILE ?auto_375307 ?auto_375308 ?auto_375309 ?auto_375310 ?auto_375311 ?auto_375312 ?auto_375313 ?auto_375314 ?auto_375315 ?auto_375316 ?auto_375317 ?auto_375318 ?auto_375319 ?auto_375320 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375337 - BLOCK
      ?auto_375338 - BLOCK
      ?auto_375339 - BLOCK
      ?auto_375340 - BLOCK
      ?auto_375341 - BLOCK
      ?auto_375342 - BLOCK
      ?auto_375343 - BLOCK
      ?auto_375344 - BLOCK
      ?auto_375345 - BLOCK
      ?auto_375346 - BLOCK
      ?auto_375347 - BLOCK
      ?auto_375348 - BLOCK
      ?auto_375349 - BLOCK
      ?auto_375350 - BLOCK
      ?auto_375351 - BLOCK
    )
    :vars
    (
      ?auto_375352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_375350 ) ( ON ?auto_375351 ?auto_375352 ) ( CLEAR ?auto_375351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_375337 ) ( ON ?auto_375338 ?auto_375337 ) ( ON ?auto_375339 ?auto_375338 ) ( ON ?auto_375340 ?auto_375339 ) ( ON ?auto_375341 ?auto_375340 ) ( ON ?auto_375342 ?auto_375341 ) ( ON ?auto_375343 ?auto_375342 ) ( ON ?auto_375344 ?auto_375343 ) ( ON ?auto_375345 ?auto_375344 ) ( ON ?auto_375346 ?auto_375345 ) ( ON ?auto_375347 ?auto_375346 ) ( ON ?auto_375348 ?auto_375347 ) ( ON ?auto_375349 ?auto_375348 ) ( ON ?auto_375350 ?auto_375349 ) ( not ( = ?auto_375337 ?auto_375338 ) ) ( not ( = ?auto_375337 ?auto_375339 ) ) ( not ( = ?auto_375337 ?auto_375340 ) ) ( not ( = ?auto_375337 ?auto_375341 ) ) ( not ( = ?auto_375337 ?auto_375342 ) ) ( not ( = ?auto_375337 ?auto_375343 ) ) ( not ( = ?auto_375337 ?auto_375344 ) ) ( not ( = ?auto_375337 ?auto_375345 ) ) ( not ( = ?auto_375337 ?auto_375346 ) ) ( not ( = ?auto_375337 ?auto_375347 ) ) ( not ( = ?auto_375337 ?auto_375348 ) ) ( not ( = ?auto_375337 ?auto_375349 ) ) ( not ( = ?auto_375337 ?auto_375350 ) ) ( not ( = ?auto_375337 ?auto_375351 ) ) ( not ( = ?auto_375337 ?auto_375352 ) ) ( not ( = ?auto_375338 ?auto_375339 ) ) ( not ( = ?auto_375338 ?auto_375340 ) ) ( not ( = ?auto_375338 ?auto_375341 ) ) ( not ( = ?auto_375338 ?auto_375342 ) ) ( not ( = ?auto_375338 ?auto_375343 ) ) ( not ( = ?auto_375338 ?auto_375344 ) ) ( not ( = ?auto_375338 ?auto_375345 ) ) ( not ( = ?auto_375338 ?auto_375346 ) ) ( not ( = ?auto_375338 ?auto_375347 ) ) ( not ( = ?auto_375338 ?auto_375348 ) ) ( not ( = ?auto_375338 ?auto_375349 ) ) ( not ( = ?auto_375338 ?auto_375350 ) ) ( not ( = ?auto_375338 ?auto_375351 ) ) ( not ( = ?auto_375338 ?auto_375352 ) ) ( not ( = ?auto_375339 ?auto_375340 ) ) ( not ( = ?auto_375339 ?auto_375341 ) ) ( not ( = ?auto_375339 ?auto_375342 ) ) ( not ( = ?auto_375339 ?auto_375343 ) ) ( not ( = ?auto_375339 ?auto_375344 ) ) ( not ( = ?auto_375339 ?auto_375345 ) ) ( not ( = ?auto_375339 ?auto_375346 ) ) ( not ( = ?auto_375339 ?auto_375347 ) ) ( not ( = ?auto_375339 ?auto_375348 ) ) ( not ( = ?auto_375339 ?auto_375349 ) ) ( not ( = ?auto_375339 ?auto_375350 ) ) ( not ( = ?auto_375339 ?auto_375351 ) ) ( not ( = ?auto_375339 ?auto_375352 ) ) ( not ( = ?auto_375340 ?auto_375341 ) ) ( not ( = ?auto_375340 ?auto_375342 ) ) ( not ( = ?auto_375340 ?auto_375343 ) ) ( not ( = ?auto_375340 ?auto_375344 ) ) ( not ( = ?auto_375340 ?auto_375345 ) ) ( not ( = ?auto_375340 ?auto_375346 ) ) ( not ( = ?auto_375340 ?auto_375347 ) ) ( not ( = ?auto_375340 ?auto_375348 ) ) ( not ( = ?auto_375340 ?auto_375349 ) ) ( not ( = ?auto_375340 ?auto_375350 ) ) ( not ( = ?auto_375340 ?auto_375351 ) ) ( not ( = ?auto_375340 ?auto_375352 ) ) ( not ( = ?auto_375341 ?auto_375342 ) ) ( not ( = ?auto_375341 ?auto_375343 ) ) ( not ( = ?auto_375341 ?auto_375344 ) ) ( not ( = ?auto_375341 ?auto_375345 ) ) ( not ( = ?auto_375341 ?auto_375346 ) ) ( not ( = ?auto_375341 ?auto_375347 ) ) ( not ( = ?auto_375341 ?auto_375348 ) ) ( not ( = ?auto_375341 ?auto_375349 ) ) ( not ( = ?auto_375341 ?auto_375350 ) ) ( not ( = ?auto_375341 ?auto_375351 ) ) ( not ( = ?auto_375341 ?auto_375352 ) ) ( not ( = ?auto_375342 ?auto_375343 ) ) ( not ( = ?auto_375342 ?auto_375344 ) ) ( not ( = ?auto_375342 ?auto_375345 ) ) ( not ( = ?auto_375342 ?auto_375346 ) ) ( not ( = ?auto_375342 ?auto_375347 ) ) ( not ( = ?auto_375342 ?auto_375348 ) ) ( not ( = ?auto_375342 ?auto_375349 ) ) ( not ( = ?auto_375342 ?auto_375350 ) ) ( not ( = ?auto_375342 ?auto_375351 ) ) ( not ( = ?auto_375342 ?auto_375352 ) ) ( not ( = ?auto_375343 ?auto_375344 ) ) ( not ( = ?auto_375343 ?auto_375345 ) ) ( not ( = ?auto_375343 ?auto_375346 ) ) ( not ( = ?auto_375343 ?auto_375347 ) ) ( not ( = ?auto_375343 ?auto_375348 ) ) ( not ( = ?auto_375343 ?auto_375349 ) ) ( not ( = ?auto_375343 ?auto_375350 ) ) ( not ( = ?auto_375343 ?auto_375351 ) ) ( not ( = ?auto_375343 ?auto_375352 ) ) ( not ( = ?auto_375344 ?auto_375345 ) ) ( not ( = ?auto_375344 ?auto_375346 ) ) ( not ( = ?auto_375344 ?auto_375347 ) ) ( not ( = ?auto_375344 ?auto_375348 ) ) ( not ( = ?auto_375344 ?auto_375349 ) ) ( not ( = ?auto_375344 ?auto_375350 ) ) ( not ( = ?auto_375344 ?auto_375351 ) ) ( not ( = ?auto_375344 ?auto_375352 ) ) ( not ( = ?auto_375345 ?auto_375346 ) ) ( not ( = ?auto_375345 ?auto_375347 ) ) ( not ( = ?auto_375345 ?auto_375348 ) ) ( not ( = ?auto_375345 ?auto_375349 ) ) ( not ( = ?auto_375345 ?auto_375350 ) ) ( not ( = ?auto_375345 ?auto_375351 ) ) ( not ( = ?auto_375345 ?auto_375352 ) ) ( not ( = ?auto_375346 ?auto_375347 ) ) ( not ( = ?auto_375346 ?auto_375348 ) ) ( not ( = ?auto_375346 ?auto_375349 ) ) ( not ( = ?auto_375346 ?auto_375350 ) ) ( not ( = ?auto_375346 ?auto_375351 ) ) ( not ( = ?auto_375346 ?auto_375352 ) ) ( not ( = ?auto_375347 ?auto_375348 ) ) ( not ( = ?auto_375347 ?auto_375349 ) ) ( not ( = ?auto_375347 ?auto_375350 ) ) ( not ( = ?auto_375347 ?auto_375351 ) ) ( not ( = ?auto_375347 ?auto_375352 ) ) ( not ( = ?auto_375348 ?auto_375349 ) ) ( not ( = ?auto_375348 ?auto_375350 ) ) ( not ( = ?auto_375348 ?auto_375351 ) ) ( not ( = ?auto_375348 ?auto_375352 ) ) ( not ( = ?auto_375349 ?auto_375350 ) ) ( not ( = ?auto_375349 ?auto_375351 ) ) ( not ( = ?auto_375349 ?auto_375352 ) ) ( not ( = ?auto_375350 ?auto_375351 ) ) ( not ( = ?auto_375350 ?auto_375352 ) ) ( not ( = ?auto_375351 ?auto_375352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_375351 ?auto_375352 )
      ( !STACK ?auto_375351 ?auto_375350 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375368 - BLOCK
      ?auto_375369 - BLOCK
      ?auto_375370 - BLOCK
      ?auto_375371 - BLOCK
      ?auto_375372 - BLOCK
      ?auto_375373 - BLOCK
      ?auto_375374 - BLOCK
      ?auto_375375 - BLOCK
      ?auto_375376 - BLOCK
      ?auto_375377 - BLOCK
      ?auto_375378 - BLOCK
      ?auto_375379 - BLOCK
      ?auto_375380 - BLOCK
      ?auto_375381 - BLOCK
      ?auto_375382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_375381 ) ( ON-TABLE ?auto_375382 ) ( CLEAR ?auto_375382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_375368 ) ( ON ?auto_375369 ?auto_375368 ) ( ON ?auto_375370 ?auto_375369 ) ( ON ?auto_375371 ?auto_375370 ) ( ON ?auto_375372 ?auto_375371 ) ( ON ?auto_375373 ?auto_375372 ) ( ON ?auto_375374 ?auto_375373 ) ( ON ?auto_375375 ?auto_375374 ) ( ON ?auto_375376 ?auto_375375 ) ( ON ?auto_375377 ?auto_375376 ) ( ON ?auto_375378 ?auto_375377 ) ( ON ?auto_375379 ?auto_375378 ) ( ON ?auto_375380 ?auto_375379 ) ( ON ?auto_375381 ?auto_375380 ) ( not ( = ?auto_375368 ?auto_375369 ) ) ( not ( = ?auto_375368 ?auto_375370 ) ) ( not ( = ?auto_375368 ?auto_375371 ) ) ( not ( = ?auto_375368 ?auto_375372 ) ) ( not ( = ?auto_375368 ?auto_375373 ) ) ( not ( = ?auto_375368 ?auto_375374 ) ) ( not ( = ?auto_375368 ?auto_375375 ) ) ( not ( = ?auto_375368 ?auto_375376 ) ) ( not ( = ?auto_375368 ?auto_375377 ) ) ( not ( = ?auto_375368 ?auto_375378 ) ) ( not ( = ?auto_375368 ?auto_375379 ) ) ( not ( = ?auto_375368 ?auto_375380 ) ) ( not ( = ?auto_375368 ?auto_375381 ) ) ( not ( = ?auto_375368 ?auto_375382 ) ) ( not ( = ?auto_375369 ?auto_375370 ) ) ( not ( = ?auto_375369 ?auto_375371 ) ) ( not ( = ?auto_375369 ?auto_375372 ) ) ( not ( = ?auto_375369 ?auto_375373 ) ) ( not ( = ?auto_375369 ?auto_375374 ) ) ( not ( = ?auto_375369 ?auto_375375 ) ) ( not ( = ?auto_375369 ?auto_375376 ) ) ( not ( = ?auto_375369 ?auto_375377 ) ) ( not ( = ?auto_375369 ?auto_375378 ) ) ( not ( = ?auto_375369 ?auto_375379 ) ) ( not ( = ?auto_375369 ?auto_375380 ) ) ( not ( = ?auto_375369 ?auto_375381 ) ) ( not ( = ?auto_375369 ?auto_375382 ) ) ( not ( = ?auto_375370 ?auto_375371 ) ) ( not ( = ?auto_375370 ?auto_375372 ) ) ( not ( = ?auto_375370 ?auto_375373 ) ) ( not ( = ?auto_375370 ?auto_375374 ) ) ( not ( = ?auto_375370 ?auto_375375 ) ) ( not ( = ?auto_375370 ?auto_375376 ) ) ( not ( = ?auto_375370 ?auto_375377 ) ) ( not ( = ?auto_375370 ?auto_375378 ) ) ( not ( = ?auto_375370 ?auto_375379 ) ) ( not ( = ?auto_375370 ?auto_375380 ) ) ( not ( = ?auto_375370 ?auto_375381 ) ) ( not ( = ?auto_375370 ?auto_375382 ) ) ( not ( = ?auto_375371 ?auto_375372 ) ) ( not ( = ?auto_375371 ?auto_375373 ) ) ( not ( = ?auto_375371 ?auto_375374 ) ) ( not ( = ?auto_375371 ?auto_375375 ) ) ( not ( = ?auto_375371 ?auto_375376 ) ) ( not ( = ?auto_375371 ?auto_375377 ) ) ( not ( = ?auto_375371 ?auto_375378 ) ) ( not ( = ?auto_375371 ?auto_375379 ) ) ( not ( = ?auto_375371 ?auto_375380 ) ) ( not ( = ?auto_375371 ?auto_375381 ) ) ( not ( = ?auto_375371 ?auto_375382 ) ) ( not ( = ?auto_375372 ?auto_375373 ) ) ( not ( = ?auto_375372 ?auto_375374 ) ) ( not ( = ?auto_375372 ?auto_375375 ) ) ( not ( = ?auto_375372 ?auto_375376 ) ) ( not ( = ?auto_375372 ?auto_375377 ) ) ( not ( = ?auto_375372 ?auto_375378 ) ) ( not ( = ?auto_375372 ?auto_375379 ) ) ( not ( = ?auto_375372 ?auto_375380 ) ) ( not ( = ?auto_375372 ?auto_375381 ) ) ( not ( = ?auto_375372 ?auto_375382 ) ) ( not ( = ?auto_375373 ?auto_375374 ) ) ( not ( = ?auto_375373 ?auto_375375 ) ) ( not ( = ?auto_375373 ?auto_375376 ) ) ( not ( = ?auto_375373 ?auto_375377 ) ) ( not ( = ?auto_375373 ?auto_375378 ) ) ( not ( = ?auto_375373 ?auto_375379 ) ) ( not ( = ?auto_375373 ?auto_375380 ) ) ( not ( = ?auto_375373 ?auto_375381 ) ) ( not ( = ?auto_375373 ?auto_375382 ) ) ( not ( = ?auto_375374 ?auto_375375 ) ) ( not ( = ?auto_375374 ?auto_375376 ) ) ( not ( = ?auto_375374 ?auto_375377 ) ) ( not ( = ?auto_375374 ?auto_375378 ) ) ( not ( = ?auto_375374 ?auto_375379 ) ) ( not ( = ?auto_375374 ?auto_375380 ) ) ( not ( = ?auto_375374 ?auto_375381 ) ) ( not ( = ?auto_375374 ?auto_375382 ) ) ( not ( = ?auto_375375 ?auto_375376 ) ) ( not ( = ?auto_375375 ?auto_375377 ) ) ( not ( = ?auto_375375 ?auto_375378 ) ) ( not ( = ?auto_375375 ?auto_375379 ) ) ( not ( = ?auto_375375 ?auto_375380 ) ) ( not ( = ?auto_375375 ?auto_375381 ) ) ( not ( = ?auto_375375 ?auto_375382 ) ) ( not ( = ?auto_375376 ?auto_375377 ) ) ( not ( = ?auto_375376 ?auto_375378 ) ) ( not ( = ?auto_375376 ?auto_375379 ) ) ( not ( = ?auto_375376 ?auto_375380 ) ) ( not ( = ?auto_375376 ?auto_375381 ) ) ( not ( = ?auto_375376 ?auto_375382 ) ) ( not ( = ?auto_375377 ?auto_375378 ) ) ( not ( = ?auto_375377 ?auto_375379 ) ) ( not ( = ?auto_375377 ?auto_375380 ) ) ( not ( = ?auto_375377 ?auto_375381 ) ) ( not ( = ?auto_375377 ?auto_375382 ) ) ( not ( = ?auto_375378 ?auto_375379 ) ) ( not ( = ?auto_375378 ?auto_375380 ) ) ( not ( = ?auto_375378 ?auto_375381 ) ) ( not ( = ?auto_375378 ?auto_375382 ) ) ( not ( = ?auto_375379 ?auto_375380 ) ) ( not ( = ?auto_375379 ?auto_375381 ) ) ( not ( = ?auto_375379 ?auto_375382 ) ) ( not ( = ?auto_375380 ?auto_375381 ) ) ( not ( = ?auto_375380 ?auto_375382 ) ) ( not ( = ?auto_375381 ?auto_375382 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_375382 )
      ( !STACK ?auto_375382 ?auto_375381 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375398 - BLOCK
      ?auto_375399 - BLOCK
      ?auto_375400 - BLOCK
      ?auto_375401 - BLOCK
      ?auto_375402 - BLOCK
      ?auto_375403 - BLOCK
      ?auto_375404 - BLOCK
      ?auto_375405 - BLOCK
      ?auto_375406 - BLOCK
      ?auto_375407 - BLOCK
      ?auto_375408 - BLOCK
      ?auto_375409 - BLOCK
      ?auto_375410 - BLOCK
      ?auto_375411 - BLOCK
      ?auto_375412 - BLOCK
    )
    :vars
    (
      ?auto_375413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375412 ?auto_375413 ) ( ON-TABLE ?auto_375398 ) ( ON ?auto_375399 ?auto_375398 ) ( ON ?auto_375400 ?auto_375399 ) ( ON ?auto_375401 ?auto_375400 ) ( ON ?auto_375402 ?auto_375401 ) ( ON ?auto_375403 ?auto_375402 ) ( ON ?auto_375404 ?auto_375403 ) ( ON ?auto_375405 ?auto_375404 ) ( ON ?auto_375406 ?auto_375405 ) ( ON ?auto_375407 ?auto_375406 ) ( ON ?auto_375408 ?auto_375407 ) ( ON ?auto_375409 ?auto_375408 ) ( ON ?auto_375410 ?auto_375409 ) ( not ( = ?auto_375398 ?auto_375399 ) ) ( not ( = ?auto_375398 ?auto_375400 ) ) ( not ( = ?auto_375398 ?auto_375401 ) ) ( not ( = ?auto_375398 ?auto_375402 ) ) ( not ( = ?auto_375398 ?auto_375403 ) ) ( not ( = ?auto_375398 ?auto_375404 ) ) ( not ( = ?auto_375398 ?auto_375405 ) ) ( not ( = ?auto_375398 ?auto_375406 ) ) ( not ( = ?auto_375398 ?auto_375407 ) ) ( not ( = ?auto_375398 ?auto_375408 ) ) ( not ( = ?auto_375398 ?auto_375409 ) ) ( not ( = ?auto_375398 ?auto_375410 ) ) ( not ( = ?auto_375398 ?auto_375411 ) ) ( not ( = ?auto_375398 ?auto_375412 ) ) ( not ( = ?auto_375398 ?auto_375413 ) ) ( not ( = ?auto_375399 ?auto_375400 ) ) ( not ( = ?auto_375399 ?auto_375401 ) ) ( not ( = ?auto_375399 ?auto_375402 ) ) ( not ( = ?auto_375399 ?auto_375403 ) ) ( not ( = ?auto_375399 ?auto_375404 ) ) ( not ( = ?auto_375399 ?auto_375405 ) ) ( not ( = ?auto_375399 ?auto_375406 ) ) ( not ( = ?auto_375399 ?auto_375407 ) ) ( not ( = ?auto_375399 ?auto_375408 ) ) ( not ( = ?auto_375399 ?auto_375409 ) ) ( not ( = ?auto_375399 ?auto_375410 ) ) ( not ( = ?auto_375399 ?auto_375411 ) ) ( not ( = ?auto_375399 ?auto_375412 ) ) ( not ( = ?auto_375399 ?auto_375413 ) ) ( not ( = ?auto_375400 ?auto_375401 ) ) ( not ( = ?auto_375400 ?auto_375402 ) ) ( not ( = ?auto_375400 ?auto_375403 ) ) ( not ( = ?auto_375400 ?auto_375404 ) ) ( not ( = ?auto_375400 ?auto_375405 ) ) ( not ( = ?auto_375400 ?auto_375406 ) ) ( not ( = ?auto_375400 ?auto_375407 ) ) ( not ( = ?auto_375400 ?auto_375408 ) ) ( not ( = ?auto_375400 ?auto_375409 ) ) ( not ( = ?auto_375400 ?auto_375410 ) ) ( not ( = ?auto_375400 ?auto_375411 ) ) ( not ( = ?auto_375400 ?auto_375412 ) ) ( not ( = ?auto_375400 ?auto_375413 ) ) ( not ( = ?auto_375401 ?auto_375402 ) ) ( not ( = ?auto_375401 ?auto_375403 ) ) ( not ( = ?auto_375401 ?auto_375404 ) ) ( not ( = ?auto_375401 ?auto_375405 ) ) ( not ( = ?auto_375401 ?auto_375406 ) ) ( not ( = ?auto_375401 ?auto_375407 ) ) ( not ( = ?auto_375401 ?auto_375408 ) ) ( not ( = ?auto_375401 ?auto_375409 ) ) ( not ( = ?auto_375401 ?auto_375410 ) ) ( not ( = ?auto_375401 ?auto_375411 ) ) ( not ( = ?auto_375401 ?auto_375412 ) ) ( not ( = ?auto_375401 ?auto_375413 ) ) ( not ( = ?auto_375402 ?auto_375403 ) ) ( not ( = ?auto_375402 ?auto_375404 ) ) ( not ( = ?auto_375402 ?auto_375405 ) ) ( not ( = ?auto_375402 ?auto_375406 ) ) ( not ( = ?auto_375402 ?auto_375407 ) ) ( not ( = ?auto_375402 ?auto_375408 ) ) ( not ( = ?auto_375402 ?auto_375409 ) ) ( not ( = ?auto_375402 ?auto_375410 ) ) ( not ( = ?auto_375402 ?auto_375411 ) ) ( not ( = ?auto_375402 ?auto_375412 ) ) ( not ( = ?auto_375402 ?auto_375413 ) ) ( not ( = ?auto_375403 ?auto_375404 ) ) ( not ( = ?auto_375403 ?auto_375405 ) ) ( not ( = ?auto_375403 ?auto_375406 ) ) ( not ( = ?auto_375403 ?auto_375407 ) ) ( not ( = ?auto_375403 ?auto_375408 ) ) ( not ( = ?auto_375403 ?auto_375409 ) ) ( not ( = ?auto_375403 ?auto_375410 ) ) ( not ( = ?auto_375403 ?auto_375411 ) ) ( not ( = ?auto_375403 ?auto_375412 ) ) ( not ( = ?auto_375403 ?auto_375413 ) ) ( not ( = ?auto_375404 ?auto_375405 ) ) ( not ( = ?auto_375404 ?auto_375406 ) ) ( not ( = ?auto_375404 ?auto_375407 ) ) ( not ( = ?auto_375404 ?auto_375408 ) ) ( not ( = ?auto_375404 ?auto_375409 ) ) ( not ( = ?auto_375404 ?auto_375410 ) ) ( not ( = ?auto_375404 ?auto_375411 ) ) ( not ( = ?auto_375404 ?auto_375412 ) ) ( not ( = ?auto_375404 ?auto_375413 ) ) ( not ( = ?auto_375405 ?auto_375406 ) ) ( not ( = ?auto_375405 ?auto_375407 ) ) ( not ( = ?auto_375405 ?auto_375408 ) ) ( not ( = ?auto_375405 ?auto_375409 ) ) ( not ( = ?auto_375405 ?auto_375410 ) ) ( not ( = ?auto_375405 ?auto_375411 ) ) ( not ( = ?auto_375405 ?auto_375412 ) ) ( not ( = ?auto_375405 ?auto_375413 ) ) ( not ( = ?auto_375406 ?auto_375407 ) ) ( not ( = ?auto_375406 ?auto_375408 ) ) ( not ( = ?auto_375406 ?auto_375409 ) ) ( not ( = ?auto_375406 ?auto_375410 ) ) ( not ( = ?auto_375406 ?auto_375411 ) ) ( not ( = ?auto_375406 ?auto_375412 ) ) ( not ( = ?auto_375406 ?auto_375413 ) ) ( not ( = ?auto_375407 ?auto_375408 ) ) ( not ( = ?auto_375407 ?auto_375409 ) ) ( not ( = ?auto_375407 ?auto_375410 ) ) ( not ( = ?auto_375407 ?auto_375411 ) ) ( not ( = ?auto_375407 ?auto_375412 ) ) ( not ( = ?auto_375407 ?auto_375413 ) ) ( not ( = ?auto_375408 ?auto_375409 ) ) ( not ( = ?auto_375408 ?auto_375410 ) ) ( not ( = ?auto_375408 ?auto_375411 ) ) ( not ( = ?auto_375408 ?auto_375412 ) ) ( not ( = ?auto_375408 ?auto_375413 ) ) ( not ( = ?auto_375409 ?auto_375410 ) ) ( not ( = ?auto_375409 ?auto_375411 ) ) ( not ( = ?auto_375409 ?auto_375412 ) ) ( not ( = ?auto_375409 ?auto_375413 ) ) ( not ( = ?auto_375410 ?auto_375411 ) ) ( not ( = ?auto_375410 ?auto_375412 ) ) ( not ( = ?auto_375410 ?auto_375413 ) ) ( not ( = ?auto_375411 ?auto_375412 ) ) ( not ( = ?auto_375411 ?auto_375413 ) ) ( not ( = ?auto_375412 ?auto_375413 ) ) ( CLEAR ?auto_375410 ) ( ON ?auto_375411 ?auto_375412 ) ( CLEAR ?auto_375411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_375398 ?auto_375399 ?auto_375400 ?auto_375401 ?auto_375402 ?auto_375403 ?auto_375404 ?auto_375405 ?auto_375406 ?auto_375407 ?auto_375408 ?auto_375409 ?auto_375410 ?auto_375411 )
      ( MAKE-15PILE ?auto_375398 ?auto_375399 ?auto_375400 ?auto_375401 ?auto_375402 ?auto_375403 ?auto_375404 ?auto_375405 ?auto_375406 ?auto_375407 ?auto_375408 ?auto_375409 ?auto_375410 ?auto_375411 ?auto_375412 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375429 - BLOCK
      ?auto_375430 - BLOCK
      ?auto_375431 - BLOCK
      ?auto_375432 - BLOCK
      ?auto_375433 - BLOCK
      ?auto_375434 - BLOCK
      ?auto_375435 - BLOCK
      ?auto_375436 - BLOCK
      ?auto_375437 - BLOCK
      ?auto_375438 - BLOCK
      ?auto_375439 - BLOCK
      ?auto_375440 - BLOCK
      ?auto_375441 - BLOCK
      ?auto_375442 - BLOCK
      ?auto_375443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375443 ) ( ON-TABLE ?auto_375429 ) ( ON ?auto_375430 ?auto_375429 ) ( ON ?auto_375431 ?auto_375430 ) ( ON ?auto_375432 ?auto_375431 ) ( ON ?auto_375433 ?auto_375432 ) ( ON ?auto_375434 ?auto_375433 ) ( ON ?auto_375435 ?auto_375434 ) ( ON ?auto_375436 ?auto_375435 ) ( ON ?auto_375437 ?auto_375436 ) ( ON ?auto_375438 ?auto_375437 ) ( ON ?auto_375439 ?auto_375438 ) ( ON ?auto_375440 ?auto_375439 ) ( ON ?auto_375441 ?auto_375440 ) ( not ( = ?auto_375429 ?auto_375430 ) ) ( not ( = ?auto_375429 ?auto_375431 ) ) ( not ( = ?auto_375429 ?auto_375432 ) ) ( not ( = ?auto_375429 ?auto_375433 ) ) ( not ( = ?auto_375429 ?auto_375434 ) ) ( not ( = ?auto_375429 ?auto_375435 ) ) ( not ( = ?auto_375429 ?auto_375436 ) ) ( not ( = ?auto_375429 ?auto_375437 ) ) ( not ( = ?auto_375429 ?auto_375438 ) ) ( not ( = ?auto_375429 ?auto_375439 ) ) ( not ( = ?auto_375429 ?auto_375440 ) ) ( not ( = ?auto_375429 ?auto_375441 ) ) ( not ( = ?auto_375429 ?auto_375442 ) ) ( not ( = ?auto_375429 ?auto_375443 ) ) ( not ( = ?auto_375430 ?auto_375431 ) ) ( not ( = ?auto_375430 ?auto_375432 ) ) ( not ( = ?auto_375430 ?auto_375433 ) ) ( not ( = ?auto_375430 ?auto_375434 ) ) ( not ( = ?auto_375430 ?auto_375435 ) ) ( not ( = ?auto_375430 ?auto_375436 ) ) ( not ( = ?auto_375430 ?auto_375437 ) ) ( not ( = ?auto_375430 ?auto_375438 ) ) ( not ( = ?auto_375430 ?auto_375439 ) ) ( not ( = ?auto_375430 ?auto_375440 ) ) ( not ( = ?auto_375430 ?auto_375441 ) ) ( not ( = ?auto_375430 ?auto_375442 ) ) ( not ( = ?auto_375430 ?auto_375443 ) ) ( not ( = ?auto_375431 ?auto_375432 ) ) ( not ( = ?auto_375431 ?auto_375433 ) ) ( not ( = ?auto_375431 ?auto_375434 ) ) ( not ( = ?auto_375431 ?auto_375435 ) ) ( not ( = ?auto_375431 ?auto_375436 ) ) ( not ( = ?auto_375431 ?auto_375437 ) ) ( not ( = ?auto_375431 ?auto_375438 ) ) ( not ( = ?auto_375431 ?auto_375439 ) ) ( not ( = ?auto_375431 ?auto_375440 ) ) ( not ( = ?auto_375431 ?auto_375441 ) ) ( not ( = ?auto_375431 ?auto_375442 ) ) ( not ( = ?auto_375431 ?auto_375443 ) ) ( not ( = ?auto_375432 ?auto_375433 ) ) ( not ( = ?auto_375432 ?auto_375434 ) ) ( not ( = ?auto_375432 ?auto_375435 ) ) ( not ( = ?auto_375432 ?auto_375436 ) ) ( not ( = ?auto_375432 ?auto_375437 ) ) ( not ( = ?auto_375432 ?auto_375438 ) ) ( not ( = ?auto_375432 ?auto_375439 ) ) ( not ( = ?auto_375432 ?auto_375440 ) ) ( not ( = ?auto_375432 ?auto_375441 ) ) ( not ( = ?auto_375432 ?auto_375442 ) ) ( not ( = ?auto_375432 ?auto_375443 ) ) ( not ( = ?auto_375433 ?auto_375434 ) ) ( not ( = ?auto_375433 ?auto_375435 ) ) ( not ( = ?auto_375433 ?auto_375436 ) ) ( not ( = ?auto_375433 ?auto_375437 ) ) ( not ( = ?auto_375433 ?auto_375438 ) ) ( not ( = ?auto_375433 ?auto_375439 ) ) ( not ( = ?auto_375433 ?auto_375440 ) ) ( not ( = ?auto_375433 ?auto_375441 ) ) ( not ( = ?auto_375433 ?auto_375442 ) ) ( not ( = ?auto_375433 ?auto_375443 ) ) ( not ( = ?auto_375434 ?auto_375435 ) ) ( not ( = ?auto_375434 ?auto_375436 ) ) ( not ( = ?auto_375434 ?auto_375437 ) ) ( not ( = ?auto_375434 ?auto_375438 ) ) ( not ( = ?auto_375434 ?auto_375439 ) ) ( not ( = ?auto_375434 ?auto_375440 ) ) ( not ( = ?auto_375434 ?auto_375441 ) ) ( not ( = ?auto_375434 ?auto_375442 ) ) ( not ( = ?auto_375434 ?auto_375443 ) ) ( not ( = ?auto_375435 ?auto_375436 ) ) ( not ( = ?auto_375435 ?auto_375437 ) ) ( not ( = ?auto_375435 ?auto_375438 ) ) ( not ( = ?auto_375435 ?auto_375439 ) ) ( not ( = ?auto_375435 ?auto_375440 ) ) ( not ( = ?auto_375435 ?auto_375441 ) ) ( not ( = ?auto_375435 ?auto_375442 ) ) ( not ( = ?auto_375435 ?auto_375443 ) ) ( not ( = ?auto_375436 ?auto_375437 ) ) ( not ( = ?auto_375436 ?auto_375438 ) ) ( not ( = ?auto_375436 ?auto_375439 ) ) ( not ( = ?auto_375436 ?auto_375440 ) ) ( not ( = ?auto_375436 ?auto_375441 ) ) ( not ( = ?auto_375436 ?auto_375442 ) ) ( not ( = ?auto_375436 ?auto_375443 ) ) ( not ( = ?auto_375437 ?auto_375438 ) ) ( not ( = ?auto_375437 ?auto_375439 ) ) ( not ( = ?auto_375437 ?auto_375440 ) ) ( not ( = ?auto_375437 ?auto_375441 ) ) ( not ( = ?auto_375437 ?auto_375442 ) ) ( not ( = ?auto_375437 ?auto_375443 ) ) ( not ( = ?auto_375438 ?auto_375439 ) ) ( not ( = ?auto_375438 ?auto_375440 ) ) ( not ( = ?auto_375438 ?auto_375441 ) ) ( not ( = ?auto_375438 ?auto_375442 ) ) ( not ( = ?auto_375438 ?auto_375443 ) ) ( not ( = ?auto_375439 ?auto_375440 ) ) ( not ( = ?auto_375439 ?auto_375441 ) ) ( not ( = ?auto_375439 ?auto_375442 ) ) ( not ( = ?auto_375439 ?auto_375443 ) ) ( not ( = ?auto_375440 ?auto_375441 ) ) ( not ( = ?auto_375440 ?auto_375442 ) ) ( not ( = ?auto_375440 ?auto_375443 ) ) ( not ( = ?auto_375441 ?auto_375442 ) ) ( not ( = ?auto_375441 ?auto_375443 ) ) ( not ( = ?auto_375442 ?auto_375443 ) ) ( CLEAR ?auto_375441 ) ( ON ?auto_375442 ?auto_375443 ) ( CLEAR ?auto_375442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_375429 ?auto_375430 ?auto_375431 ?auto_375432 ?auto_375433 ?auto_375434 ?auto_375435 ?auto_375436 ?auto_375437 ?auto_375438 ?auto_375439 ?auto_375440 ?auto_375441 ?auto_375442 )
      ( MAKE-15PILE ?auto_375429 ?auto_375430 ?auto_375431 ?auto_375432 ?auto_375433 ?auto_375434 ?auto_375435 ?auto_375436 ?auto_375437 ?auto_375438 ?auto_375439 ?auto_375440 ?auto_375441 ?auto_375442 ?auto_375443 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375459 - BLOCK
      ?auto_375460 - BLOCK
      ?auto_375461 - BLOCK
      ?auto_375462 - BLOCK
      ?auto_375463 - BLOCK
      ?auto_375464 - BLOCK
      ?auto_375465 - BLOCK
      ?auto_375466 - BLOCK
      ?auto_375467 - BLOCK
      ?auto_375468 - BLOCK
      ?auto_375469 - BLOCK
      ?auto_375470 - BLOCK
      ?auto_375471 - BLOCK
      ?auto_375472 - BLOCK
      ?auto_375473 - BLOCK
    )
    :vars
    (
      ?auto_375474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375473 ?auto_375474 ) ( ON-TABLE ?auto_375459 ) ( ON ?auto_375460 ?auto_375459 ) ( ON ?auto_375461 ?auto_375460 ) ( ON ?auto_375462 ?auto_375461 ) ( ON ?auto_375463 ?auto_375462 ) ( ON ?auto_375464 ?auto_375463 ) ( ON ?auto_375465 ?auto_375464 ) ( ON ?auto_375466 ?auto_375465 ) ( ON ?auto_375467 ?auto_375466 ) ( ON ?auto_375468 ?auto_375467 ) ( ON ?auto_375469 ?auto_375468 ) ( ON ?auto_375470 ?auto_375469 ) ( not ( = ?auto_375459 ?auto_375460 ) ) ( not ( = ?auto_375459 ?auto_375461 ) ) ( not ( = ?auto_375459 ?auto_375462 ) ) ( not ( = ?auto_375459 ?auto_375463 ) ) ( not ( = ?auto_375459 ?auto_375464 ) ) ( not ( = ?auto_375459 ?auto_375465 ) ) ( not ( = ?auto_375459 ?auto_375466 ) ) ( not ( = ?auto_375459 ?auto_375467 ) ) ( not ( = ?auto_375459 ?auto_375468 ) ) ( not ( = ?auto_375459 ?auto_375469 ) ) ( not ( = ?auto_375459 ?auto_375470 ) ) ( not ( = ?auto_375459 ?auto_375471 ) ) ( not ( = ?auto_375459 ?auto_375472 ) ) ( not ( = ?auto_375459 ?auto_375473 ) ) ( not ( = ?auto_375459 ?auto_375474 ) ) ( not ( = ?auto_375460 ?auto_375461 ) ) ( not ( = ?auto_375460 ?auto_375462 ) ) ( not ( = ?auto_375460 ?auto_375463 ) ) ( not ( = ?auto_375460 ?auto_375464 ) ) ( not ( = ?auto_375460 ?auto_375465 ) ) ( not ( = ?auto_375460 ?auto_375466 ) ) ( not ( = ?auto_375460 ?auto_375467 ) ) ( not ( = ?auto_375460 ?auto_375468 ) ) ( not ( = ?auto_375460 ?auto_375469 ) ) ( not ( = ?auto_375460 ?auto_375470 ) ) ( not ( = ?auto_375460 ?auto_375471 ) ) ( not ( = ?auto_375460 ?auto_375472 ) ) ( not ( = ?auto_375460 ?auto_375473 ) ) ( not ( = ?auto_375460 ?auto_375474 ) ) ( not ( = ?auto_375461 ?auto_375462 ) ) ( not ( = ?auto_375461 ?auto_375463 ) ) ( not ( = ?auto_375461 ?auto_375464 ) ) ( not ( = ?auto_375461 ?auto_375465 ) ) ( not ( = ?auto_375461 ?auto_375466 ) ) ( not ( = ?auto_375461 ?auto_375467 ) ) ( not ( = ?auto_375461 ?auto_375468 ) ) ( not ( = ?auto_375461 ?auto_375469 ) ) ( not ( = ?auto_375461 ?auto_375470 ) ) ( not ( = ?auto_375461 ?auto_375471 ) ) ( not ( = ?auto_375461 ?auto_375472 ) ) ( not ( = ?auto_375461 ?auto_375473 ) ) ( not ( = ?auto_375461 ?auto_375474 ) ) ( not ( = ?auto_375462 ?auto_375463 ) ) ( not ( = ?auto_375462 ?auto_375464 ) ) ( not ( = ?auto_375462 ?auto_375465 ) ) ( not ( = ?auto_375462 ?auto_375466 ) ) ( not ( = ?auto_375462 ?auto_375467 ) ) ( not ( = ?auto_375462 ?auto_375468 ) ) ( not ( = ?auto_375462 ?auto_375469 ) ) ( not ( = ?auto_375462 ?auto_375470 ) ) ( not ( = ?auto_375462 ?auto_375471 ) ) ( not ( = ?auto_375462 ?auto_375472 ) ) ( not ( = ?auto_375462 ?auto_375473 ) ) ( not ( = ?auto_375462 ?auto_375474 ) ) ( not ( = ?auto_375463 ?auto_375464 ) ) ( not ( = ?auto_375463 ?auto_375465 ) ) ( not ( = ?auto_375463 ?auto_375466 ) ) ( not ( = ?auto_375463 ?auto_375467 ) ) ( not ( = ?auto_375463 ?auto_375468 ) ) ( not ( = ?auto_375463 ?auto_375469 ) ) ( not ( = ?auto_375463 ?auto_375470 ) ) ( not ( = ?auto_375463 ?auto_375471 ) ) ( not ( = ?auto_375463 ?auto_375472 ) ) ( not ( = ?auto_375463 ?auto_375473 ) ) ( not ( = ?auto_375463 ?auto_375474 ) ) ( not ( = ?auto_375464 ?auto_375465 ) ) ( not ( = ?auto_375464 ?auto_375466 ) ) ( not ( = ?auto_375464 ?auto_375467 ) ) ( not ( = ?auto_375464 ?auto_375468 ) ) ( not ( = ?auto_375464 ?auto_375469 ) ) ( not ( = ?auto_375464 ?auto_375470 ) ) ( not ( = ?auto_375464 ?auto_375471 ) ) ( not ( = ?auto_375464 ?auto_375472 ) ) ( not ( = ?auto_375464 ?auto_375473 ) ) ( not ( = ?auto_375464 ?auto_375474 ) ) ( not ( = ?auto_375465 ?auto_375466 ) ) ( not ( = ?auto_375465 ?auto_375467 ) ) ( not ( = ?auto_375465 ?auto_375468 ) ) ( not ( = ?auto_375465 ?auto_375469 ) ) ( not ( = ?auto_375465 ?auto_375470 ) ) ( not ( = ?auto_375465 ?auto_375471 ) ) ( not ( = ?auto_375465 ?auto_375472 ) ) ( not ( = ?auto_375465 ?auto_375473 ) ) ( not ( = ?auto_375465 ?auto_375474 ) ) ( not ( = ?auto_375466 ?auto_375467 ) ) ( not ( = ?auto_375466 ?auto_375468 ) ) ( not ( = ?auto_375466 ?auto_375469 ) ) ( not ( = ?auto_375466 ?auto_375470 ) ) ( not ( = ?auto_375466 ?auto_375471 ) ) ( not ( = ?auto_375466 ?auto_375472 ) ) ( not ( = ?auto_375466 ?auto_375473 ) ) ( not ( = ?auto_375466 ?auto_375474 ) ) ( not ( = ?auto_375467 ?auto_375468 ) ) ( not ( = ?auto_375467 ?auto_375469 ) ) ( not ( = ?auto_375467 ?auto_375470 ) ) ( not ( = ?auto_375467 ?auto_375471 ) ) ( not ( = ?auto_375467 ?auto_375472 ) ) ( not ( = ?auto_375467 ?auto_375473 ) ) ( not ( = ?auto_375467 ?auto_375474 ) ) ( not ( = ?auto_375468 ?auto_375469 ) ) ( not ( = ?auto_375468 ?auto_375470 ) ) ( not ( = ?auto_375468 ?auto_375471 ) ) ( not ( = ?auto_375468 ?auto_375472 ) ) ( not ( = ?auto_375468 ?auto_375473 ) ) ( not ( = ?auto_375468 ?auto_375474 ) ) ( not ( = ?auto_375469 ?auto_375470 ) ) ( not ( = ?auto_375469 ?auto_375471 ) ) ( not ( = ?auto_375469 ?auto_375472 ) ) ( not ( = ?auto_375469 ?auto_375473 ) ) ( not ( = ?auto_375469 ?auto_375474 ) ) ( not ( = ?auto_375470 ?auto_375471 ) ) ( not ( = ?auto_375470 ?auto_375472 ) ) ( not ( = ?auto_375470 ?auto_375473 ) ) ( not ( = ?auto_375470 ?auto_375474 ) ) ( not ( = ?auto_375471 ?auto_375472 ) ) ( not ( = ?auto_375471 ?auto_375473 ) ) ( not ( = ?auto_375471 ?auto_375474 ) ) ( not ( = ?auto_375472 ?auto_375473 ) ) ( not ( = ?auto_375472 ?auto_375474 ) ) ( not ( = ?auto_375473 ?auto_375474 ) ) ( ON ?auto_375472 ?auto_375473 ) ( CLEAR ?auto_375470 ) ( ON ?auto_375471 ?auto_375472 ) ( CLEAR ?auto_375471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_375459 ?auto_375460 ?auto_375461 ?auto_375462 ?auto_375463 ?auto_375464 ?auto_375465 ?auto_375466 ?auto_375467 ?auto_375468 ?auto_375469 ?auto_375470 ?auto_375471 )
      ( MAKE-15PILE ?auto_375459 ?auto_375460 ?auto_375461 ?auto_375462 ?auto_375463 ?auto_375464 ?auto_375465 ?auto_375466 ?auto_375467 ?auto_375468 ?auto_375469 ?auto_375470 ?auto_375471 ?auto_375472 ?auto_375473 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375490 - BLOCK
      ?auto_375491 - BLOCK
      ?auto_375492 - BLOCK
      ?auto_375493 - BLOCK
      ?auto_375494 - BLOCK
      ?auto_375495 - BLOCK
      ?auto_375496 - BLOCK
      ?auto_375497 - BLOCK
      ?auto_375498 - BLOCK
      ?auto_375499 - BLOCK
      ?auto_375500 - BLOCK
      ?auto_375501 - BLOCK
      ?auto_375502 - BLOCK
      ?auto_375503 - BLOCK
      ?auto_375504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375504 ) ( ON-TABLE ?auto_375490 ) ( ON ?auto_375491 ?auto_375490 ) ( ON ?auto_375492 ?auto_375491 ) ( ON ?auto_375493 ?auto_375492 ) ( ON ?auto_375494 ?auto_375493 ) ( ON ?auto_375495 ?auto_375494 ) ( ON ?auto_375496 ?auto_375495 ) ( ON ?auto_375497 ?auto_375496 ) ( ON ?auto_375498 ?auto_375497 ) ( ON ?auto_375499 ?auto_375498 ) ( ON ?auto_375500 ?auto_375499 ) ( ON ?auto_375501 ?auto_375500 ) ( not ( = ?auto_375490 ?auto_375491 ) ) ( not ( = ?auto_375490 ?auto_375492 ) ) ( not ( = ?auto_375490 ?auto_375493 ) ) ( not ( = ?auto_375490 ?auto_375494 ) ) ( not ( = ?auto_375490 ?auto_375495 ) ) ( not ( = ?auto_375490 ?auto_375496 ) ) ( not ( = ?auto_375490 ?auto_375497 ) ) ( not ( = ?auto_375490 ?auto_375498 ) ) ( not ( = ?auto_375490 ?auto_375499 ) ) ( not ( = ?auto_375490 ?auto_375500 ) ) ( not ( = ?auto_375490 ?auto_375501 ) ) ( not ( = ?auto_375490 ?auto_375502 ) ) ( not ( = ?auto_375490 ?auto_375503 ) ) ( not ( = ?auto_375490 ?auto_375504 ) ) ( not ( = ?auto_375491 ?auto_375492 ) ) ( not ( = ?auto_375491 ?auto_375493 ) ) ( not ( = ?auto_375491 ?auto_375494 ) ) ( not ( = ?auto_375491 ?auto_375495 ) ) ( not ( = ?auto_375491 ?auto_375496 ) ) ( not ( = ?auto_375491 ?auto_375497 ) ) ( not ( = ?auto_375491 ?auto_375498 ) ) ( not ( = ?auto_375491 ?auto_375499 ) ) ( not ( = ?auto_375491 ?auto_375500 ) ) ( not ( = ?auto_375491 ?auto_375501 ) ) ( not ( = ?auto_375491 ?auto_375502 ) ) ( not ( = ?auto_375491 ?auto_375503 ) ) ( not ( = ?auto_375491 ?auto_375504 ) ) ( not ( = ?auto_375492 ?auto_375493 ) ) ( not ( = ?auto_375492 ?auto_375494 ) ) ( not ( = ?auto_375492 ?auto_375495 ) ) ( not ( = ?auto_375492 ?auto_375496 ) ) ( not ( = ?auto_375492 ?auto_375497 ) ) ( not ( = ?auto_375492 ?auto_375498 ) ) ( not ( = ?auto_375492 ?auto_375499 ) ) ( not ( = ?auto_375492 ?auto_375500 ) ) ( not ( = ?auto_375492 ?auto_375501 ) ) ( not ( = ?auto_375492 ?auto_375502 ) ) ( not ( = ?auto_375492 ?auto_375503 ) ) ( not ( = ?auto_375492 ?auto_375504 ) ) ( not ( = ?auto_375493 ?auto_375494 ) ) ( not ( = ?auto_375493 ?auto_375495 ) ) ( not ( = ?auto_375493 ?auto_375496 ) ) ( not ( = ?auto_375493 ?auto_375497 ) ) ( not ( = ?auto_375493 ?auto_375498 ) ) ( not ( = ?auto_375493 ?auto_375499 ) ) ( not ( = ?auto_375493 ?auto_375500 ) ) ( not ( = ?auto_375493 ?auto_375501 ) ) ( not ( = ?auto_375493 ?auto_375502 ) ) ( not ( = ?auto_375493 ?auto_375503 ) ) ( not ( = ?auto_375493 ?auto_375504 ) ) ( not ( = ?auto_375494 ?auto_375495 ) ) ( not ( = ?auto_375494 ?auto_375496 ) ) ( not ( = ?auto_375494 ?auto_375497 ) ) ( not ( = ?auto_375494 ?auto_375498 ) ) ( not ( = ?auto_375494 ?auto_375499 ) ) ( not ( = ?auto_375494 ?auto_375500 ) ) ( not ( = ?auto_375494 ?auto_375501 ) ) ( not ( = ?auto_375494 ?auto_375502 ) ) ( not ( = ?auto_375494 ?auto_375503 ) ) ( not ( = ?auto_375494 ?auto_375504 ) ) ( not ( = ?auto_375495 ?auto_375496 ) ) ( not ( = ?auto_375495 ?auto_375497 ) ) ( not ( = ?auto_375495 ?auto_375498 ) ) ( not ( = ?auto_375495 ?auto_375499 ) ) ( not ( = ?auto_375495 ?auto_375500 ) ) ( not ( = ?auto_375495 ?auto_375501 ) ) ( not ( = ?auto_375495 ?auto_375502 ) ) ( not ( = ?auto_375495 ?auto_375503 ) ) ( not ( = ?auto_375495 ?auto_375504 ) ) ( not ( = ?auto_375496 ?auto_375497 ) ) ( not ( = ?auto_375496 ?auto_375498 ) ) ( not ( = ?auto_375496 ?auto_375499 ) ) ( not ( = ?auto_375496 ?auto_375500 ) ) ( not ( = ?auto_375496 ?auto_375501 ) ) ( not ( = ?auto_375496 ?auto_375502 ) ) ( not ( = ?auto_375496 ?auto_375503 ) ) ( not ( = ?auto_375496 ?auto_375504 ) ) ( not ( = ?auto_375497 ?auto_375498 ) ) ( not ( = ?auto_375497 ?auto_375499 ) ) ( not ( = ?auto_375497 ?auto_375500 ) ) ( not ( = ?auto_375497 ?auto_375501 ) ) ( not ( = ?auto_375497 ?auto_375502 ) ) ( not ( = ?auto_375497 ?auto_375503 ) ) ( not ( = ?auto_375497 ?auto_375504 ) ) ( not ( = ?auto_375498 ?auto_375499 ) ) ( not ( = ?auto_375498 ?auto_375500 ) ) ( not ( = ?auto_375498 ?auto_375501 ) ) ( not ( = ?auto_375498 ?auto_375502 ) ) ( not ( = ?auto_375498 ?auto_375503 ) ) ( not ( = ?auto_375498 ?auto_375504 ) ) ( not ( = ?auto_375499 ?auto_375500 ) ) ( not ( = ?auto_375499 ?auto_375501 ) ) ( not ( = ?auto_375499 ?auto_375502 ) ) ( not ( = ?auto_375499 ?auto_375503 ) ) ( not ( = ?auto_375499 ?auto_375504 ) ) ( not ( = ?auto_375500 ?auto_375501 ) ) ( not ( = ?auto_375500 ?auto_375502 ) ) ( not ( = ?auto_375500 ?auto_375503 ) ) ( not ( = ?auto_375500 ?auto_375504 ) ) ( not ( = ?auto_375501 ?auto_375502 ) ) ( not ( = ?auto_375501 ?auto_375503 ) ) ( not ( = ?auto_375501 ?auto_375504 ) ) ( not ( = ?auto_375502 ?auto_375503 ) ) ( not ( = ?auto_375502 ?auto_375504 ) ) ( not ( = ?auto_375503 ?auto_375504 ) ) ( ON ?auto_375503 ?auto_375504 ) ( CLEAR ?auto_375501 ) ( ON ?auto_375502 ?auto_375503 ) ( CLEAR ?auto_375502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_375490 ?auto_375491 ?auto_375492 ?auto_375493 ?auto_375494 ?auto_375495 ?auto_375496 ?auto_375497 ?auto_375498 ?auto_375499 ?auto_375500 ?auto_375501 ?auto_375502 )
      ( MAKE-15PILE ?auto_375490 ?auto_375491 ?auto_375492 ?auto_375493 ?auto_375494 ?auto_375495 ?auto_375496 ?auto_375497 ?auto_375498 ?auto_375499 ?auto_375500 ?auto_375501 ?auto_375502 ?auto_375503 ?auto_375504 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375520 - BLOCK
      ?auto_375521 - BLOCK
      ?auto_375522 - BLOCK
      ?auto_375523 - BLOCK
      ?auto_375524 - BLOCK
      ?auto_375525 - BLOCK
      ?auto_375526 - BLOCK
      ?auto_375527 - BLOCK
      ?auto_375528 - BLOCK
      ?auto_375529 - BLOCK
      ?auto_375530 - BLOCK
      ?auto_375531 - BLOCK
      ?auto_375532 - BLOCK
      ?auto_375533 - BLOCK
      ?auto_375534 - BLOCK
    )
    :vars
    (
      ?auto_375535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375534 ?auto_375535 ) ( ON-TABLE ?auto_375520 ) ( ON ?auto_375521 ?auto_375520 ) ( ON ?auto_375522 ?auto_375521 ) ( ON ?auto_375523 ?auto_375522 ) ( ON ?auto_375524 ?auto_375523 ) ( ON ?auto_375525 ?auto_375524 ) ( ON ?auto_375526 ?auto_375525 ) ( ON ?auto_375527 ?auto_375526 ) ( ON ?auto_375528 ?auto_375527 ) ( ON ?auto_375529 ?auto_375528 ) ( ON ?auto_375530 ?auto_375529 ) ( not ( = ?auto_375520 ?auto_375521 ) ) ( not ( = ?auto_375520 ?auto_375522 ) ) ( not ( = ?auto_375520 ?auto_375523 ) ) ( not ( = ?auto_375520 ?auto_375524 ) ) ( not ( = ?auto_375520 ?auto_375525 ) ) ( not ( = ?auto_375520 ?auto_375526 ) ) ( not ( = ?auto_375520 ?auto_375527 ) ) ( not ( = ?auto_375520 ?auto_375528 ) ) ( not ( = ?auto_375520 ?auto_375529 ) ) ( not ( = ?auto_375520 ?auto_375530 ) ) ( not ( = ?auto_375520 ?auto_375531 ) ) ( not ( = ?auto_375520 ?auto_375532 ) ) ( not ( = ?auto_375520 ?auto_375533 ) ) ( not ( = ?auto_375520 ?auto_375534 ) ) ( not ( = ?auto_375520 ?auto_375535 ) ) ( not ( = ?auto_375521 ?auto_375522 ) ) ( not ( = ?auto_375521 ?auto_375523 ) ) ( not ( = ?auto_375521 ?auto_375524 ) ) ( not ( = ?auto_375521 ?auto_375525 ) ) ( not ( = ?auto_375521 ?auto_375526 ) ) ( not ( = ?auto_375521 ?auto_375527 ) ) ( not ( = ?auto_375521 ?auto_375528 ) ) ( not ( = ?auto_375521 ?auto_375529 ) ) ( not ( = ?auto_375521 ?auto_375530 ) ) ( not ( = ?auto_375521 ?auto_375531 ) ) ( not ( = ?auto_375521 ?auto_375532 ) ) ( not ( = ?auto_375521 ?auto_375533 ) ) ( not ( = ?auto_375521 ?auto_375534 ) ) ( not ( = ?auto_375521 ?auto_375535 ) ) ( not ( = ?auto_375522 ?auto_375523 ) ) ( not ( = ?auto_375522 ?auto_375524 ) ) ( not ( = ?auto_375522 ?auto_375525 ) ) ( not ( = ?auto_375522 ?auto_375526 ) ) ( not ( = ?auto_375522 ?auto_375527 ) ) ( not ( = ?auto_375522 ?auto_375528 ) ) ( not ( = ?auto_375522 ?auto_375529 ) ) ( not ( = ?auto_375522 ?auto_375530 ) ) ( not ( = ?auto_375522 ?auto_375531 ) ) ( not ( = ?auto_375522 ?auto_375532 ) ) ( not ( = ?auto_375522 ?auto_375533 ) ) ( not ( = ?auto_375522 ?auto_375534 ) ) ( not ( = ?auto_375522 ?auto_375535 ) ) ( not ( = ?auto_375523 ?auto_375524 ) ) ( not ( = ?auto_375523 ?auto_375525 ) ) ( not ( = ?auto_375523 ?auto_375526 ) ) ( not ( = ?auto_375523 ?auto_375527 ) ) ( not ( = ?auto_375523 ?auto_375528 ) ) ( not ( = ?auto_375523 ?auto_375529 ) ) ( not ( = ?auto_375523 ?auto_375530 ) ) ( not ( = ?auto_375523 ?auto_375531 ) ) ( not ( = ?auto_375523 ?auto_375532 ) ) ( not ( = ?auto_375523 ?auto_375533 ) ) ( not ( = ?auto_375523 ?auto_375534 ) ) ( not ( = ?auto_375523 ?auto_375535 ) ) ( not ( = ?auto_375524 ?auto_375525 ) ) ( not ( = ?auto_375524 ?auto_375526 ) ) ( not ( = ?auto_375524 ?auto_375527 ) ) ( not ( = ?auto_375524 ?auto_375528 ) ) ( not ( = ?auto_375524 ?auto_375529 ) ) ( not ( = ?auto_375524 ?auto_375530 ) ) ( not ( = ?auto_375524 ?auto_375531 ) ) ( not ( = ?auto_375524 ?auto_375532 ) ) ( not ( = ?auto_375524 ?auto_375533 ) ) ( not ( = ?auto_375524 ?auto_375534 ) ) ( not ( = ?auto_375524 ?auto_375535 ) ) ( not ( = ?auto_375525 ?auto_375526 ) ) ( not ( = ?auto_375525 ?auto_375527 ) ) ( not ( = ?auto_375525 ?auto_375528 ) ) ( not ( = ?auto_375525 ?auto_375529 ) ) ( not ( = ?auto_375525 ?auto_375530 ) ) ( not ( = ?auto_375525 ?auto_375531 ) ) ( not ( = ?auto_375525 ?auto_375532 ) ) ( not ( = ?auto_375525 ?auto_375533 ) ) ( not ( = ?auto_375525 ?auto_375534 ) ) ( not ( = ?auto_375525 ?auto_375535 ) ) ( not ( = ?auto_375526 ?auto_375527 ) ) ( not ( = ?auto_375526 ?auto_375528 ) ) ( not ( = ?auto_375526 ?auto_375529 ) ) ( not ( = ?auto_375526 ?auto_375530 ) ) ( not ( = ?auto_375526 ?auto_375531 ) ) ( not ( = ?auto_375526 ?auto_375532 ) ) ( not ( = ?auto_375526 ?auto_375533 ) ) ( not ( = ?auto_375526 ?auto_375534 ) ) ( not ( = ?auto_375526 ?auto_375535 ) ) ( not ( = ?auto_375527 ?auto_375528 ) ) ( not ( = ?auto_375527 ?auto_375529 ) ) ( not ( = ?auto_375527 ?auto_375530 ) ) ( not ( = ?auto_375527 ?auto_375531 ) ) ( not ( = ?auto_375527 ?auto_375532 ) ) ( not ( = ?auto_375527 ?auto_375533 ) ) ( not ( = ?auto_375527 ?auto_375534 ) ) ( not ( = ?auto_375527 ?auto_375535 ) ) ( not ( = ?auto_375528 ?auto_375529 ) ) ( not ( = ?auto_375528 ?auto_375530 ) ) ( not ( = ?auto_375528 ?auto_375531 ) ) ( not ( = ?auto_375528 ?auto_375532 ) ) ( not ( = ?auto_375528 ?auto_375533 ) ) ( not ( = ?auto_375528 ?auto_375534 ) ) ( not ( = ?auto_375528 ?auto_375535 ) ) ( not ( = ?auto_375529 ?auto_375530 ) ) ( not ( = ?auto_375529 ?auto_375531 ) ) ( not ( = ?auto_375529 ?auto_375532 ) ) ( not ( = ?auto_375529 ?auto_375533 ) ) ( not ( = ?auto_375529 ?auto_375534 ) ) ( not ( = ?auto_375529 ?auto_375535 ) ) ( not ( = ?auto_375530 ?auto_375531 ) ) ( not ( = ?auto_375530 ?auto_375532 ) ) ( not ( = ?auto_375530 ?auto_375533 ) ) ( not ( = ?auto_375530 ?auto_375534 ) ) ( not ( = ?auto_375530 ?auto_375535 ) ) ( not ( = ?auto_375531 ?auto_375532 ) ) ( not ( = ?auto_375531 ?auto_375533 ) ) ( not ( = ?auto_375531 ?auto_375534 ) ) ( not ( = ?auto_375531 ?auto_375535 ) ) ( not ( = ?auto_375532 ?auto_375533 ) ) ( not ( = ?auto_375532 ?auto_375534 ) ) ( not ( = ?auto_375532 ?auto_375535 ) ) ( not ( = ?auto_375533 ?auto_375534 ) ) ( not ( = ?auto_375533 ?auto_375535 ) ) ( not ( = ?auto_375534 ?auto_375535 ) ) ( ON ?auto_375533 ?auto_375534 ) ( ON ?auto_375532 ?auto_375533 ) ( CLEAR ?auto_375530 ) ( ON ?auto_375531 ?auto_375532 ) ( CLEAR ?auto_375531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_375520 ?auto_375521 ?auto_375522 ?auto_375523 ?auto_375524 ?auto_375525 ?auto_375526 ?auto_375527 ?auto_375528 ?auto_375529 ?auto_375530 ?auto_375531 )
      ( MAKE-15PILE ?auto_375520 ?auto_375521 ?auto_375522 ?auto_375523 ?auto_375524 ?auto_375525 ?auto_375526 ?auto_375527 ?auto_375528 ?auto_375529 ?auto_375530 ?auto_375531 ?auto_375532 ?auto_375533 ?auto_375534 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375551 - BLOCK
      ?auto_375552 - BLOCK
      ?auto_375553 - BLOCK
      ?auto_375554 - BLOCK
      ?auto_375555 - BLOCK
      ?auto_375556 - BLOCK
      ?auto_375557 - BLOCK
      ?auto_375558 - BLOCK
      ?auto_375559 - BLOCK
      ?auto_375560 - BLOCK
      ?auto_375561 - BLOCK
      ?auto_375562 - BLOCK
      ?auto_375563 - BLOCK
      ?auto_375564 - BLOCK
      ?auto_375565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375565 ) ( ON-TABLE ?auto_375551 ) ( ON ?auto_375552 ?auto_375551 ) ( ON ?auto_375553 ?auto_375552 ) ( ON ?auto_375554 ?auto_375553 ) ( ON ?auto_375555 ?auto_375554 ) ( ON ?auto_375556 ?auto_375555 ) ( ON ?auto_375557 ?auto_375556 ) ( ON ?auto_375558 ?auto_375557 ) ( ON ?auto_375559 ?auto_375558 ) ( ON ?auto_375560 ?auto_375559 ) ( ON ?auto_375561 ?auto_375560 ) ( not ( = ?auto_375551 ?auto_375552 ) ) ( not ( = ?auto_375551 ?auto_375553 ) ) ( not ( = ?auto_375551 ?auto_375554 ) ) ( not ( = ?auto_375551 ?auto_375555 ) ) ( not ( = ?auto_375551 ?auto_375556 ) ) ( not ( = ?auto_375551 ?auto_375557 ) ) ( not ( = ?auto_375551 ?auto_375558 ) ) ( not ( = ?auto_375551 ?auto_375559 ) ) ( not ( = ?auto_375551 ?auto_375560 ) ) ( not ( = ?auto_375551 ?auto_375561 ) ) ( not ( = ?auto_375551 ?auto_375562 ) ) ( not ( = ?auto_375551 ?auto_375563 ) ) ( not ( = ?auto_375551 ?auto_375564 ) ) ( not ( = ?auto_375551 ?auto_375565 ) ) ( not ( = ?auto_375552 ?auto_375553 ) ) ( not ( = ?auto_375552 ?auto_375554 ) ) ( not ( = ?auto_375552 ?auto_375555 ) ) ( not ( = ?auto_375552 ?auto_375556 ) ) ( not ( = ?auto_375552 ?auto_375557 ) ) ( not ( = ?auto_375552 ?auto_375558 ) ) ( not ( = ?auto_375552 ?auto_375559 ) ) ( not ( = ?auto_375552 ?auto_375560 ) ) ( not ( = ?auto_375552 ?auto_375561 ) ) ( not ( = ?auto_375552 ?auto_375562 ) ) ( not ( = ?auto_375552 ?auto_375563 ) ) ( not ( = ?auto_375552 ?auto_375564 ) ) ( not ( = ?auto_375552 ?auto_375565 ) ) ( not ( = ?auto_375553 ?auto_375554 ) ) ( not ( = ?auto_375553 ?auto_375555 ) ) ( not ( = ?auto_375553 ?auto_375556 ) ) ( not ( = ?auto_375553 ?auto_375557 ) ) ( not ( = ?auto_375553 ?auto_375558 ) ) ( not ( = ?auto_375553 ?auto_375559 ) ) ( not ( = ?auto_375553 ?auto_375560 ) ) ( not ( = ?auto_375553 ?auto_375561 ) ) ( not ( = ?auto_375553 ?auto_375562 ) ) ( not ( = ?auto_375553 ?auto_375563 ) ) ( not ( = ?auto_375553 ?auto_375564 ) ) ( not ( = ?auto_375553 ?auto_375565 ) ) ( not ( = ?auto_375554 ?auto_375555 ) ) ( not ( = ?auto_375554 ?auto_375556 ) ) ( not ( = ?auto_375554 ?auto_375557 ) ) ( not ( = ?auto_375554 ?auto_375558 ) ) ( not ( = ?auto_375554 ?auto_375559 ) ) ( not ( = ?auto_375554 ?auto_375560 ) ) ( not ( = ?auto_375554 ?auto_375561 ) ) ( not ( = ?auto_375554 ?auto_375562 ) ) ( not ( = ?auto_375554 ?auto_375563 ) ) ( not ( = ?auto_375554 ?auto_375564 ) ) ( not ( = ?auto_375554 ?auto_375565 ) ) ( not ( = ?auto_375555 ?auto_375556 ) ) ( not ( = ?auto_375555 ?auto_375557 ) ) ( not ( = ?auto_375555 ?auto_375558 ) ) ( not ( = ?auto_375555 ?auto_375559 ) ) ( not ( = ?auto_375555 ?auto_375560 ) ) ( not ( = ?auto_375555 ?auto_375561 ) ) ( not ( = ?auto_375555 ?auto_375562 ) ) ( not ( = ?auto_375555 ?auto_375563 ) ) ( not ( = ?auto_375555 ?auto_375564 ) ) ( not ( = ?auto_375555 ?auto_375565 ) ) ( not ( = ?auto_375556 ?auto_375557 ) ) ( not ( = ?auto_375556 ?auto_375558 ) ) ( not ( = ?auto_375556 ?auto_375559 ) ) ( not ( = ?auto_375556 ?auto_375560 ) ) ( not ( = ?auto_375556 ?auto_375561 ) ) ( not ( = ?auto_375556 ?auto_375562 ) ) ( not ( = ?auto_375556 ?auto_375563 ) ) ( not ( = ?auto_375556 ?auto_375564 ) ) ( not ( = ?auto_375556 ?auto_375565 ) ) ( not ( = ?auto_375557 ?auto_375558 ) ) ( not ( = ?auto_375557 ?auto_375559 ) ) ( not ( = ?auto_375557 ?auto_375560 ) ) ( not ( = ?auto_375557 ?auto_375561 ) ) ( not ( = ?auto_375557 ?auto_375562 ) ) ( not ( = ?auto_375557 ?auto_375563 ) ) ( not ( = ?auto_375557 ?auto_375564 ) ) ( not ( = ?auto_375557 ?auto_375565 ) ) ( not ( = ?auto_375558 ?auto_375559 ) ) ( not ( = ?auto_375558 ?auto_375560 ) ) ( not ( = ?auto_375558 ?auto_375561 ) ) ( not ( = ?auto_375558 ?auto_375562 ) ) ( not ( = ?auto_375558 ?auto_375563 ) ) ( not ( = ?auto_375558 ?auto_375564 ) ) ( not ( = ?auto_375558 ?auto_375565 ) ) ( not ( = ?auto_375559 ?auto_375560 ) ) ( not ( = ?auto_375559 ?auto_375561 ) ) ( not ( = ?auto_375559 ?auto_375562 ) ) ( not ( = ?auto_375559 ?auto_375563 ) ) ( not ( = ?auto_375559 ?auto_375564 ) ) ( not ( = ?auto_375559 ?auto_375565 ) ) ( not ( = ?auto_375560 ?auto_375561 ) ) ( not ( = ?auto_375560 ?auto_375562 ) ) ( not ( = ?auto_375560 ?auto_375563 ) ) ( not ( = ?auto_375560 ?auto_375564 ) ) ( not ( = ?auto_375560 ?auto_375565 ) ) ( not ( = ?auto_375561 ?auto_375562 ) ) ( not ( = ?auto_375561 ?auto_375563 ) ) ( not ( = ?auto_375561 ?auto_375564 ) ) ( not ( = ?auto_375561 ?auto_375565 ) ) ( not ( = ?auto_375562 ?auto_375563 ) ) ( not ( = ?auto_375562 ?auto_375564 ) ) ( not ( = ?auto_375562 ?auto_375565 ) ) ( not ( = ?auto_375563 ?auto_375564 ) ) ( not ( = ?auto_375563 ?auto_375565 ) ) ( not ( = ?auto_375564 ?auto_375565 ) ) ( ON ?auto_375564 ?auto_375565 ) ( ON ?auto_375563 ?auto_375564 ) ( CLEAR ?auto_375561 ) ( ON ?auto_375562 ?auto_375563 ) ( CLEAR ?auto_375562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_375551 ?auto_375552 ?auto_375553 ?auto_375554 ?auto_375555 ?auto_375556 ?auto_375557 ?auto_375558 ?auto_375559 ?auto_375560 ?auto_375561 ?auto_375562 )
      ( MAKE-15PILE ?auto_375551 ?auto_375552 ?auto_375553 ?auto_375554 ?auto_375555 ?auto_375556 ?auto_375557 ?auto_375558 ?auto_375559 ?auto_375560 ?auto_375561 ?auto_375562 ?auto_375563 ?auto_375564 ?auto_375565 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375581 - BLOCK
      ?auto_375582 - BLOCK
      ?auto_375583 - BLOCK
      ?auto_375584 - BLOCK
      ?auto_375585 - BLOCK
      ?auto_375586 - BLOCK
      ?auto_375587 - BLOCK
      ?auto_375588 - BLOCK
      ?auto_375589 - BLOCK
      ?auto_375590 - BLOCK
      ?auto_375591 - BLOCK
      ?auto_375592 - BLOCK
      ?auto_375593 - BLOCK
      ?auto_375594 - BLOCK
      ?auto_375595 - BLOCK
    )
    :vars
    (
      ?auto_375596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375595 ?auto_375596 ) ( ON-TABLE ?auto_375581 ) ( ON ?auto_375582 ?auto_375581 ) ( ON ?auto_375583 ?auto_375582 ) ( ON ?auto_375584 ?auto_375583 ) ( ON ?auto_375585 ?auto_375584 ) ( ON ?auto_375586 ?auto_375585 ) ( ON ?auto_375587 ?auto_375586 ) ( ON ?auto_375588 ?auto_375587 ) ( ON ?auto_375589 ?auto_375588 ) ( ON ?auto_375590 ?auto_375589 ) ( not ( = ?auto_375581 ?auto_375582 ) ) ( not ( = ?auto_375581 ?auto_375583 ) ) ( not ( = ?auto_375581 ?auto_375584 ) ) ( not ( = ?auto_375581 ?auto_375585 ) ) ( not ( = ?auto_375581 ?auto_375586 ) ) ( not ( = ?auto_375581 ?auto_375587 ) ) ( not ( = ?auto_375581 ?auto_375588 ) ) ( not ( = ?auto_375581 ?auto_375589 ) ) ( not ( = ?auto_375581 ?auto_375590 ) ) ( not ( = ?auto_375581 ?auto_375591 ) ) ( not ( = ?auto_375581 ?auto_375592 ) ) ( not ( = ?auto_375581 ?auto_375593 ) ) ( not ( = ?auto_375581 ?auto_375594 ) ) ( not ( = ?auto_375581 ?auto_375595 ) ) ( not ( = ?auto_375581 ?auto_375596 ) ) ( not ( = ?auto_375582 ?auto_375583 ) ) ( not ( = ?auto_375582 ?auto_375584 ) ) ( not ( = ?auto_375582 ?auto_375585 ) ) ( not ( = ?auto_375582 ?auto_375586 ) ) ( not ( = ?auto_375582 ?auto_375587 ) ) ( not ( = ?auto_375582 ?auto_375588 ) ) ( not ( = ?auto_375582 ?auto_375589 ) ) ( not ( = ?auto_375582 ?auto_375590 ) ) ( not ( = ?auto_375582 ?auto_375591 ) ) ( not ( = ?auto_375582 ?auto_375592 ) ) ( not ( = ?auto_375582 ?auto_375593 ) ) ( not ( = ?auto_375582 ?auto_375594 ) ) ( not ( = ?auto_375582 ?auto_375595 ) ) ( not ( = ?auto_375582 ?auto_375596 ) ) ( not ( = ?auto_375583 ?auto_375584 ) ) ( not ( = ?auto_375583 ?auto_375585 ) ) ( not ( = ?auto_375583 ?auto_375586 ) ) ( not ( = ?auto_375583 ?auto_375587 ) ) ( not ( = ?auto_375583 ?auto_375588 ) ) ( not ( = ?auto_375583 ?auto_375589 ) ) ( not ( = ?auto_375583 ?auto_375590 ) ) ( not ( = ?auto_375583 ?auto_375591 ) ) ( not ( = ?auto_375583 ?auto_375592 ) ) ( not ( = ?auto_375583 ?auto_375593 ) ) ( not ( = ?auto_375583 ?auto_375594 ) ) ( not ( = ?auto_375583 ?auto_375595 ) ) ( not ( = ?auto_375583 ?auto_375596 ) ) ( not ( = ?auto_375584 ?auto_375585 ) ) ( not ( = ?auto_375584 ?auto_375586 ) ) ( not ( = ?auto_375584 ?auto_375587 ) ) ( not ( = ?auto_375584 ?auto_375588 ) ) ( not ( = ?auto_375584 ?auto_375589 ) ) ( not ( = ?auto_375584 ?auto_375590 ) ) ( not ( = ?auto_375584 ?auto_375591 ) ) ( not ( = ?auto_375584 ?auto_375592 ) ) ( not ( = ?auto_375584 ?auto_375593 ) ) ( not ( = ?auto_375584 ?auto_375594 ) ) ( not ( = ?auto_375584 ?auto_375595 ) ) ( not ( = ?auto_375584 ?auto_375596 ) ) ( not ( = ?auto_375585 ?auto_375586 ) ) ( not ( = ?auto_375585 ?auto_375587 ) ) ( not ( = ?auto_375585 ?auto_375588 ) ) ( not ( = ?auto_375585 ?auto_375589 ) ) ( not ( = ?auto_375585 ?auto_375590 ) ) ( not ( = ?auto_375585 ?auto_375591 ) ) ( not ( = ?auto_375585 ?auto_375592 ) ) ( not ( = ?auto_375585 ?auto_375593 ) ) ( not ( = ?auto_375585 ?auto_375594 ) ) ( not ( = ?auto_375585 ?auto_375595 ) ) ( not ( = ?auto_375585 ?auto_375596 ) ) ( not ( = ?auto_375586 ?auto_375587 ) ) ( not ( = ?auto_375586 ?auto_375588 ) ) ( not ( = ?auto_375586 ?auto_375589 ) ) ( not ( = ?auto_375586 ?auto_375590 ) ) ( not ( = ?auto_375586 ?auto_375591 ) ) ( not ( = ?auto_375586 ?auto_375592 ) ) ( not ( = ?auto_375586 ?auto_375593 ) ) ( not ( = ?auto_375586 ?auto_375594 ) ) ( not ( = ?auto_375586 ?auto_375595 ) ) ( not ( = ?auto_375586 ?auto_375596 ) ) ( not ( = ?auto_375587 ?auto_375588 ) ) ( not ( = ?auto_375587 ?auto_375589 ) ) ( not ( = ?auto_375587 ?auto_375590 ) ) ( not ( = ?auto_375587 ?auto_375591 ) ) ( not ( = ?auto_375587 ?auto_375592 ) ) ( not ( = ?auto_375587 ?auto_375593 ) ) ( not ( = ?auto_375587 ?auto_375594 ) ) ( not ( = ?auto_375587 ?auto_375595 ) ) ( not ( = ?auto_375587 ?auto_375596 ) ) ( not ( = ?auto_375588 ?auto_375589 ) ) ( not ( = ?auto_375588 ?auto_375590 ) ) ( not ( = ?auto_375588 ?auto_375591 ) ) ( not ( = ?auto_375588 ?auto_375592 ) ) ( not ( = ?auto_375588 ?auto_375593 ) ) ( not ( = ?auto_375588 ?auto_375594 ) ) ( not ( = ?auto_375588 ?auto_375595 ) ) ( not ( = ?auto_375588 ?auto_375596 ) ) ( not ( = ?auto_375589 ?auto_375590 ) ) ( not ( = ?auto_375589 ?auto_375591 ) ) ( not ( = ?auto_375589 ?auto_375592 ) ) ( not ( = ?auto_375589 ?auto_375593 ) ) ( not ( = ?auto_375589 ?auto_375594 ) ) ( not ( = ?auto_375589 ?auto_375595 ) ) ( not ( = ?auto_375589 ?auto_375596 ) ) ( not ( = ?auto_375590 ?auto_375591 ) ) ( not ( = ?auto_375590 ?auto_375592 ) ) ( not ( = ?auto_375590 ?auto_375593 ) ) ( not ( = ?auto_375590 ?auto_375594 ) ) ( not ( = ?auto_375590 ?auto_375595 ) ) ( not ( = ?auto_375590 ?auto_375596 ) ) ( not ( = ?auto_375591 ?auto_375592 ) ) ( not ( = ?auto_375591 ?auto_375593 ) ) ( not ( = ?auto_375591 ?auto_375594 ) ) ( not ( = ?auto_375591 ?auto_375595 ) ) ( not ( = ?auto_375591 ?auto_375596 ) ) ( not ( = ?auto_375592 ?auto_375593 ) ) ( not ( = ?auto_375592 ?auto_375594 ) ) ( not ( = ?auto_375592 ?auto_375595 ) ) ( not ( = ?auto_375592 ?auto_375596 ) ) ( not ( = ?auto_375593 ?auto_375594 ) ) ( not ( = ?auto_375593 ?auto_375595 ) ) ( not ( = ?auto_375593 ?auto_375596 ) ) ( not ( = ?auto_375594 ?auto_375595 ) ) ( not ( = ?auto_375594 ?auto_375596 ) ) ( not ( = ?auto_375595 ?auto_375596 ) ) ( ON ?auto_375594 ?auto_375595 ) ( ON ?auto_375593 ?auto_375594 ) ( ON ?auto_375592 ?auto_375593 ) ( CLEAR ?auto_375590 ) ( ON ?auto_375591 ?auto_375592 ) ( CLEAR ?auto_375591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_375581 ?auto_375582 ?auto_375583 ?auto_375584 ?auto_375585 ?auto_375586 ?auto_375587 ?auto_375588 ?auto_375589 ?auto_375590 ?auto_375591 )
      ( MAKE-15PILE ?auto_375581 ?auto_375582 ?auto_375583 ?auto_375584 ?auto_375585 ?auto_375586 ?auto_375587 ?auto_375588 ?auto_375589 ?auto_375590 ?auto_375591 ?auto_375592 ?auto_375593 ?auto_375594 ?auto_375595 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375612 - BLOCK
      ?auto_375613 - BLOCK
      ?auto_375614 - BLOCK
      ?auto_375615 - BLOCK
      ?auto_375616 - BLOCK
      ?auto_375617 - BLOCK
      ?auto_375618 - BLOCK
      ?auto_375619 - BLOCK
      ?auto_375620 - BLOCK
      ?auto_375621 - BLOCK
      ?auto_375622 - BLOCK
      ?auto_375623 - BLOCK
      ?auto_375624 - BLOCK
      ?auto_375625 - BLOCK
      ?auto_375626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375626 ) ( ON-TABLE ?auto_375612 ) ( ON ?auto_375613 ?auto_375612 ) ( ON ?auto_375614 ?auto_375613 ) ( ON ?auto_375615 ?auto_375614 ) ( ON ?auto_375616 ?auto_375615 ) ( ON ?auto_375617 ?auto_375616 ) ( ON ?auto_375618 ?auto_375617 ) ( ON ?auto_375619 ?auto_375618 ) ( ON ?auto_375620 ?auto_375619 ) ( ON ?auto_375621 ?auto_375620 ) ( not ( = ?auto_375612 ?auto_375613 ) ) ( not ( = ?auto_375612 ?auto_375614 ) ) ( not ( = ?auto_375612 ?auto_375615 ) ) ( not ( = ?auto_375612 ?auto_375616 ) ) ( not ( = ?auto_375612 ?auto_375617 ) ) ( not ( = ?auto_375612 ?auto_375618 ) ) ( not ( = ?auto_375612 ?auto_375619 ) ) ( not ( = ?auto_375612 ?auto_375620 ) ) ( not ( = ?auto_375612 ?auto_375621 ) ) ( not ( = ?auto_375612 ?auto_375622 ) ) ( not ( = ?auto_375612 ?auto_375623 ) ) ( not ( = ?auto_375612 ?auto_375624 ) ) ( not ( = ?auto_375612 ?auto_375625 ) ) ( not ( = ?auto_375612 ?auto_375626 ) ) ( not ( = ?auto_375613 ?auto_375614 ) ) ( not ( = ?auto_375613 ?auto_375615 ) ) ( not ( = ?auto_375613 ?auto_375616 ) ) ( not ( = ?auto_375613 ?auto_375617 ) ) ( not ( = ?auto_375613 ?auto_375618 ) ) ( not ( = ?auto_375613 ?auto_375619 ) ) ( not ( = ?auto_375613 ?auto_375620 ) ) ( not ( = ?auto_375613 ?auto_375621 ) ) ( not ( = ?auto_375613 ?auto_375622 ) ) ( not ( = ?auto_375613 ?auto_375623 ) ) ( not ( = ?auto_375613 ?auto_375624 ) ) ( not ( = ?auto_375613 ?auto_375625 ) ) ( not ( = ?auto_375613 ?auto_375626 ) ) ( not ( = ?auto_375614 ?auto_375615 ) ) ( not ( = ?auto_375614 ?auto_375616 ) ) ( not ( = ?auto_375614 ?auto_375617 ) ) ( not ( = ?auto_375614 ?auto_375618 ) ) ( not ( = ?auto_375614 ?auto_375619 ) ) ( not ( = ?auto_375614 ?auto_375620 ) ) ( not ( = ?auto_375614 ?auto_375621 ) ) ( not ( = ?auto_375614 ?auto_375622 ) ) ( not ( = ?auto_375614 ?auto_375623 ) ) ( not ( = ?auto_375614 ?auto_375624 ) ) ( not ( = ?auto_375614 ?auto_375625 ) ) ( not ( = ?auto_375614 ?auto_375626 ) ) ( not ( = ?auto_375615 ?auto_375616 ) ) ( not ( = ?auto_375615 ?auto_375617 ) ) ( not ( = ?auto_375615 ?auto_375618 ) ) ( not ( = ?auto_375615 ?auto_375619 ) ) ( not ( = ?auto_375615 ?auto_375620 ) ) ( not ( = ?auto_375615 ?auto_375621 ) ) ( not ( = ?auto_375615 ?auto_375622 ) ) ( not ( = ?auto_375615 ?auto_375623 ) ) ( not ( = ?auto_375615 ?auto_375624 ) ) ( not ( = ?auto_375615 ?auto_375625 ) ) ( not ( = ?auto_375615 ?auto_375626 ) ) ( not ( = ?auto_375616 ?auto_375617 ) ) ( not ( = ?auto_375616 ?auto_375618 ) ) ( not ( = ?auto_375616 ?auto_375619 ) ) ( not ( = ?auto_375616 ?auto_375620 ) ) ( not ( = ?auto_375616 ?auto_375621 ) ) ( not ( = ?auto_375616 ?auto_375622 ) ) ( not ( = ?auto_375616 ?auto_375623 ) ) ( not ( = ?auto_375616 ?auto_375624 ) ) ( not ( = ?auto_375616 ?auto_375625 ) ) ( not ( = ?auto_375616 ?auto_375626 ) ) ( not ( = ?auto_375617 ?auto_375618 ) ) ( not ( = ?auto_375617 ?auto_375619 ) ) ( not ( = ?auto_375617 ?auto_375620 ) ) ( not ( = ?auto_375617 ?auto_375621 ) ) ( not ( = ?auto_375617 ?auto_375622 ) ) ( not ( = ?auto_375617 ?auto_375623 ) ) ( not ( = ?auto_375617 ?auto_375624 ) ) ( not ( = ?auto_375617 ?auto_375625 ) ) ( not ( = ?auto_375617 ?auto_375626 ) ) ( not ( = ?auto_375618 ?auto_375619 ) ) ( not ( = ?auto_375618 ?auto_375620 ) ) ( not ( = ?auto_375618 ?auto_375621 ) ) ( not ( = ?auto_375618 ?auto_375622 ) ) ( not ( = ?auto_375618 ?auto_375623 ) ) ( not ( = ?auto_375618 ?auto_375624 ) ) ( not ( = ?auto_375618 ?auto_375625 ) ) ( not ( = ?auto_375618 ?auto_375626 ) ) ( not ( = ?auto_375619 ?auto_375620 ) ) ( not ( = ?auto_375619 ?auto_375621 ) ) ( not ( = ?auto_375619 ?auto_375622 ) ) ( not ( = ?auto_375619 ?auto_375623 ) ) ( not ( = ?auto_375619 ?auto_375624 ) ) ( not ( = ?auto_375619 ?auto_375625 ) ) ( not ( = ?auto_375619 ?auto_375626 ) ) ( not ( = ?auto_375620 ?auto_375621 ) ) ( not ( = ?auto_375620 ?auto_375622 ) ) ( not ( = ?auto_375620 ?auto_375623 ) ) ( not ( = ?auto_375620 ?auto_375624 ) ) ( not ( = ?auto_375620 ?auto_375625 ) ) ( not ( = ?auto_375620 ?auto_375626 ) ) ( not ( = ?auto_375621 ?auto_375622 ) ) ( not ( = ?auto_375621 ?auto_375623 ) ) ( not ( = ?auto_375621 ?auto_375624 ) ) ( not ( = ?auto_375621 ?auto_375625 ) ) ( not ( = ?auto_375621 ?auto_375626 ) ) ( not ( = ?auto_375622 ?auto_375623 ) ) ( not ( = ?auto_375622 ?auto_375624 ) ) ( not ( = ?auto_375622 ?auto_375625 ) ) ( not ( = ?auto_375622 ?auto_375626 ) ) ( not ( = ?auto_375623 ?auto_375624 ) ) ( not ( = ?auto_375623 ?auto_375625 ) ) ( not ( = ?auto_375623 ?auto_375626 ) ) ( not ( = ?auto_375624 ?auto_375625 ) ) ( not ( = ?auto_375624 ?auto_375626 ) ) ( not ( = ?auto_375625 ?auto_375626 ) ) ( ON ?auto_375625 ?auto_375626 ) ( ON ?auto_375624 ?auto_375625 ) ( ON ?auto_375623 ?auto_375624 ) ( CLEAR ?auto_375621 ) ( ON ?auto_375622 ?auto_375623 ) ( CLEAR ?auto_375622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_375612 ?auto_375613 ?auto_375614 ?auto_375615 ?auto_375616 ?auto_375617 ?auto_375618 ?auto_375619 ?auto_375620 ?auto_375621 ?auto_375622 )
      ( MAKE-15PILE ?auto_375612 ?auto_375613 ?auto_375614 ?auto_375615 ?auto_375616 ?auto_375617 ?auto_375618 ?auto_375619 ?auto_375620 ?auto_375621 ?auto_375622 ?auto_375623 ?auto_375624 ?auto_375625 ?auto_375626 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375642 - BLOCK
      ?auto_375643 - BLOCK
      ?auto_375644 - BLOCK
      ?auto_375645 - BLOCK
      ?auto_375646 - BLOCK
      ?auto_375647 - BLOCK
      ?auto_375648 - BLOCK
      ?auto_375649 - BLOCK
      ?auto_375650 - BLOCK
      ?auto_375651 - BLOCK
      ?auto_375652 - BLOCK
      ?auto_375653 - BLOCK
      ?auto_375654 - BLOCK
      ?auto_375655 - BLOCK
      ?auto_375656 - BLOCK
    )
    :vars
    (
      ?auto_375657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375656 ?auto_375657 ) ( ON-TABLE ?auto_375642 ) ( ON ?auto_375643 ?auto_375642 ) ( ON ?auto_375644 ?auto_375643 ) ( ON ?auto_375645 ?auto_375644 ) ( ON ?auto_375646 ?auto_375645 ) ( ON ?auto_375647 ?auto_375646 ) ( ON ?auto_375648 ?auto_375647 ) ( ON ?auto_375649 ?auto_375648 ) ( ON ?auto_375650 ?auto_375649 ) ( not ( = ?auto_375642 ?auto_375643 ) ) ( not ( = ?auto_375642 ?auto_375644 ) ) ( not ( = ?auto_375642 ?auto_375645 ) ) ( not ( = ?auto_375642 ?auto_375646 ) ) ( not ( = ?auto_375642 ?auto_375647 ) ) ( not ( = ?auto_375642 ?auto_375648 ) ) ( not ( = ?auto_375642 ?auto_375649 ) ) ( not ( = ?auto_375642 ?auto_375650 ) ) ( not ( = ?auto_375642 ?auto_375651 ) ) ( not ( = ?auto_375642 ?auto_375652 ) ) ( not ( = ?auto_375642 ?auto_375653 ) ) ( not ( = ?auto_375642 ?auto_375654 ) ) ( not ( = ?auto_375642 ?auto_375655 ) ) ( not ( = ?auto_375642 ?auto_375656 ) ) ( not ( = ?auto_375642 ?auto_375657 ) ) ( not ( = ?auto_375643 ?auto_375644 ) ) ( not ( = ?auto_375643 ?auto_375645 ) ) ( not ( = ?auto_375643 ?auto_375646 ) ) ( not ( = ?auto_375643 ?auto_375647 ) ) ( not ( = ?auto_375643 ?auto_375648 ) ) ( not ( = ?auto_375643 ?auto_375649 ) ) ( not ( = ?auto_375643 ?auto_375650 ) ) ( not ( = ?auto_375643 ?auto_375651 ) ) ( not ( = ?auto_375643 ?auto_375652 ) ) ( not ( = ?auto_375643 ?auto_375653 ) ) ( not ( = ?auto_375643 ?auto_375654 ) ) ( not ( = ?auto_375643 ?auto_375655 ) ) ( not ( = ?auto_375643 ?auto_375656 ) ) ( not ( = ?auto_375643 ?auto_375657 ) ) ( not ( = ?auto_375644 ?auto_375645 ) ) ( not ( = ?auto_375644 ?auto_375646 ) ) ( not ( = ?auto_375644 ?auto_375647 ) ) ( not ( = ?auto_375644 ?auto_375648 ) ) ( not ( = ?auto_375644 ?auto_375649 ) ) ( not ( = ?auto_375644 ?auto_375650 ) ) ( not ( = ?auto_375644 ?auto_375651 ) ) ( not ( = ?auto_375644 ?auto_375652 ) ) ( not ( = ?auto_375644 ?auto_375653 ) ) ( not ( = ?auto_375644 ?auto_375654 ) ) ( not ( = ?auto_375644 ?auto_375655 ) ) ( not ( = ?auto_375644 ?auto_375656 ) ) ( not ( = ?auto_375644 ?auto_375657 ) ) ( not ( = ?auto_375645 ?auto_375646 ) ) ( not ( = ?auto_375645 ?auto_375647 ) ) ( not ( = ?auto_375645 ?auto_375648 ) ) ( not ( = ?auto_375645 ?auto_375649 ) ) ( not ( = ?auto_375645 ?auto_375650 ) ) ( not ( = ?auto_375645 ?auto_375651 ) ) ( not ( = ?auto_375645 ?auto_375652 ) ) ( not ( = ?auto_375645 ?auto_375653 ) ) ( not ( = ?auto_375645 ?auto_375654 ) ) ( not ( = ?auto_375645 ?auto_375655 ) ) ( not ( = ?auto_375645 ?auto_375656 ) ) ( not ( = ?auto_375645 ?auto_375657 ) ) ( not ( = ?auto_375646 ?auto_375647 ) ) ( not ( = ?auto_375646 ?auto_375648 ) ) ( not ( = ?auto_375646 ?auto_375649 ) ) ( not ( = ?auto_375646 ?auto_375650 ) ) ( not ( = ?auto_375646 ?auto_375651 ) ) ( not ( = ?auto_375646 ?auto_375652 ) ) ( not ( = ?auto_375646 ?auto_375653 ) ) ( not ( = ?auto_375646 ?auto_375654 ) ) ( not ( = ?auto_375646 ?auto_375655 ) ) ( not ( = ?auto_375646 ?auto_375656 ) ) ( not ( = ?auto_375646 ?auto_375657 ) ) ( not ( = ?auto_375647 ?auto_375648 ) ) ( not ( = ?auto_375647 ?auto_375649 ) ) ( not ( = ?auto_375647 ?auto_375650 ) ) ( not ( = ?auto_375647 ?auto_375651 ) ) ( not ( = ?auto_375647 ?auto_375652 ) ) ( not ( = ?auto_375647 ?auto_375653 ) ) ( not ( = ?auto_375647 ?auto_375654 ) ) ( not ( = ?auto_375647 ?auto_375655 ) ) ( not ( = ?auto_375647 ?auto_375656 ) ) ( not ( = ?auto_375647 ?auto_375657 ) ) ( not ( = ?auto_375648 ?auto_375649 ) ) ( not ( = ?auto_375648 ?auto_375650 ) ) ( not ( = ?auto_375648 ?auto_375651 ) ) ( not ( = ?auto_375648 ?auto_375652 ) ) ( not ( = ?auto_375648 ?auto_375653 ) ) ( not ( = ?auto_375648 ?auto_375654 ) ) ( not ( = ?auto_375648 ?auto_375655 ) ) ( not ( = ?auto_375648 ?auto_375656 ) ) ( not ( = ?auto_375648 ?auto_375657 ) ) ( not ( = ?auto_375649 ?auto_375650 ) ) ( not ( = ?auto_375649 ?auto_375651 ) ) ( not ( = ?auto_375649 ?auto_375652 ) ) ( not ( = ?auto_375649 ?auto_375653 ) ) ( not ( = ?auto_375649 ?auto_375654 ) ) ( not ( = ?auto_375649 ?auto_375655 ) ) ( not ( = ?auto_375649 ?auto_375656 ) ) ( not ( = ?auto_375649 ?auto_375657 ) ) ( not ( = ?auto_375650 ?auto_375651 ) ) ( not ( = ?auto_375650 ?auto_375652 ) ) ( not ( = ?auto_375650 ?auto_375653 ) ) ( not ( = ?auto_375650 ?auto_375654 ) ) ( not ( = ?auto_375650 ?auto_375655 ) ) ( not ( = ?auto_375650 ?auto_375656 ) ) ( not ( = ?auto_375650 ?auto_375657 ) ) ( not ( = ?auto_375651 ?auto_375652 ) ) ( not ( = ?auto_375651 ?auto_375653 ) ) ( not ( = ?auto_375651 ?auto_375654 ) ) ( not ( = ?auto_375651 ?auto_375655 ) ) ( not ( = ?auto_375651 ?auto_375656 ) ) ( not ( = ?auto_375651 ?auto_375657 ) ) ( not ( = ?auto_375652 ?auto_375653 ) ) ( not ( = ?auto_375652 ?auto_375654 ) ) ( not ( = ?auto_375652 ?auto_375655 ) ) ( not ( = ?auto_375652 ?auto_375656 ) ) ( not ( = ?auto_375652 ?auto_375657 ) ) ( not ( = ?auto_375653 ?auto_375654 ) ) ( not ( = ?auto_375653 ?auto_375655 ) ) ( not ( = ?auto_375653 ?auto_375656 ) ) ( not ( = ?auto_375653 ?auto_375657 ) ) ( not ( = ?auto_375654 ?auto_375655 ) ) ( not ( = ?auto_375654 ?auto_375656 ) ) ( not ( = ?auto_375654 ?auto_375657 ) ) ( not ( = ?auto_375655 ?auto_375656 ) ) ( not ( = ?auto_375655 ?auto_375657 ) ) ( not ( = ?auto_375656 ?auto_375657 ) ) ( ON ?auto_375655 ?auto_375656 ) ( ON ?auto_375654 ?auto_375655 ) ( ON ?auto_375653 ?auto_375654 ) ( ON ?auto_375652 ?auto_375653 ) ( CLEAR ?auto_375650 ) ( ON ?auto_375651 ?auto_375652 ) ( CLEAR ?auto_375651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_375642 ?auto_375643 ?auto_375644 ?auto_375645 ?auto_375646 ?auto_375647 ?auto_375648 ?auto_375649 ?auto_375650 ?auto_375651 )
      ( MAKE-15PILE ?auto_375642 ?auto_375643 ?auto_375644 ?auto_375645 ?auto_375646 ?auto_375647 ?auto_375648 ?auto_375649 ?auto_375650 ?auto_375651 ?auto_375652 ?auto_375653 ?auto_375654 ?auto_375655 ?auto_375656 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375673 - BLOCK
      ?auto_375674 - BLOCK
      ?auto_375675 - BLOCK
      ?auto_375676 - BLOCK
      ?auto_375677 - BLOCK
      ?auto_375678 - BLOCK
      ?auto_375679 - BLOCK
      ?auto_375680 - BLOCK
      ?auto_375681 - BLOCK
      ?auto_375682 - BLOCK
      ?auto_375683 - BLOCK
      ?auto_375684 - BLOCK
      ?auto_375685 - BLOCK
      ?auto_375686 - BLOCK
      ?auto_375687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375687 ) ( ON-TABLE ?auto_375673 ) ( ON ?auto_375674 ?auto_375673 ) ( ON ?auto_375675 ?auto_375674 ) ( ON ?auto_375676 ?auto_375675 ) ( ON ?auto_375677 ?auto_375676 ) ( ON ?auto_375678 ?auto_375677 ) ( ON ?auto_375679 ?auto_375678 ) ( ON ?auto_375680 ?auto_375679 ) ( ON ?auto_375681 ?auto_375680 ) ( not ( = ?auto_375673 ?auto_375674 ) ) ( not ( = ?auto_375673 ?auto_375675 ) ) ( not ( = ?auto_375673 ?auto_375676 ) ) ( not ( = ?auto_375673 ?auto_375677 ) ) ( not ( = ?auto_375673 ?auto_375678 ) ) ( not ( = ?auto_375673 ?auto_375679 ) ) ( not ( = ?auto_375673 ?auto_375680 ) ) ( not ( = ?auto_375673 ?auto_375681 ) ) ( not ( = ?auto_375673 ?auto_375682 ) ) ( not ( = ?auto_375673 ?auto_375683 ) ) ( not ( = ?auto_375673 ?auto_375684 ) ) ( not ( = ?auto_375673 ?auto_375685 ) ) ( not ( = ?auto_375673 ?auto_375686 ) ) ( not ( = ?auto_375673 ?auto_375687 ) ) ( not ( = ?auto_375674 ?auto_375675 ) ) ( not ( = ?auto_375674 ?auto_375676 ) ) ( not ( = ?auto_375674 ?auto_375677 ) ) ( not ( = ?auto_375674 ?auto_375678 ) ) ( not ( = ?auto_375674 ?auto_375679 ) ) ( not ( = ?auto_375674 ?auto_375680 ) ) ( not ( = ?auto_375674 ?auto_375681 ) ) ( not ( = ?auto_375674 ?auto_375682 ) ) ( not ( = ?auto_375674 ?auto_375683 ) ) ( not ( = ?auto_375674 ?auto_375684 ) ) ( not ( = ?auto_375674 ?auto_375685 ) ) ( not ( = ?auto_375674 ?auto_375686 ) ) ( not ( = ?auto_375674 ?auto_375687 ) ) ( not ( = ?auto_375675 ?auto_375676 ) ) ( not ( = ?auto_375675 ?auto_375677 ) ) ( not ( = ?auto_375675 ?auto_375678 ) ) ( not ( = ?auto_375675 ?auto_375679 ) ) ( not ( = ?auto_375675 ?auto_375680 ) ) ( not ( = ?auto_375675 ?auto_375681 ) ) ( not ( = ?auto_375675 ?auto_375682 ) ) ( not ( = ?auto_375675 ?auto_375683 ) ) ( not ( = ?auto_375675 ?auto_375684 ) ) ( not ( = ?auto_375675 ?auto_375685 ) ) ( not ( = ?auto_375675 ?auto_375686 ) ) ( not ( = ?auto_375675 ?auto_375687 ) ) ( not ( = ?auto_375676 ?auto_375677 ) ) ( not ( = ?auto_375676 ?auto_375678 ) ) ( not ( = ?auto_375676 ?auto_375679 ) ) ( not ( = ?auto_375676 ?auto_375680 ) ) ( not ( = ?auto_375676 ?auto_375681 ) ) ( not ( = ?auto_375676 ?auto_375682 ) ) ( not ( = ?auto_375676 ?auto_375683 ) ) ( not ( = ?auto_375676 ?auto_375684 ) ) ( not ( = ?auto_375676 ?auto_375685 ) ) ( not ( = ?auto_375676 ?auto_375686 ) ) ( not ( = ?auto_375676 ?auto_375687 ) ) ( not ( = ?auto_375677 ?auto_375678 ) ) ( not ( = ?auto_375677 ?auto_375679 ) ) ( not ( = ?auto_375677 ?auto_375680 ) ) ( not ( = ?auto_375677 ?auto_375681 ) ) ( not ( = ?auto_375677 ?auto_375682 ) ) ( not ( = ?auto_375677 ?auto_375683 ) ) ( not ( = ?auto_375677 ?auto_375684 ) ) ( not ( = ?auto_375677 ?auto_375685 ) ) ( not ( = ?auto_375677 ?auto_375686 ) ) ( not ( = ?auto_375677 ?auto_375687 ) ) ( not ( = ?auto_375678 ?auto_375679 ) ) ( not ( = ?auto_375678 ?auto_375680 ) ) ( not ( = ?auto_375678 ?auto_375681 ) ) ( not ( = ?auto_375678 ?auto_375682 ) ) ( not ( = ?auto_375678 ?auto_375683 ) ) ( not ( = ?auto_375678 ?auto_375684 ) ) ( not ( = ?auto_375678 ?auto_375685 ) ) ( not ( = ?auto_375678 ?auto_375686 ) ) ( not ( = ?auto_375678 ?auto_375687 ) ) ( not ( = ?auto_375679 ?auto_375680 ) ) ( not ( = ?auto_375679 ?auto_375681 ) ) ( not ( = ?auto_375679 ?auto_375682 ) ) ( not ( = ?auto_375679 ?auto_375683 ) ) ( not ( = ?auto_375679 ?auto_375684 ) ) ( not ( = ?auto_375679 ?auto_375685 ) ) ( not ( = ?auto_375679 ?auto_375686 ) ) ( not ( = ?auto_375679 ?auto_375687 ) ) ( not ( = ?auto_375680 ?auto_375681 ) ) ( not ( = ?auto_375680 ?auto_375682 ) ) ( not ( = ?auto_375680 ?auto_375683 ) ) ( not ( = ?auto_375680 ?auto_375684 ) ) ( not ( = ?auto_375680 ?auto_375685 ) ) ( not ( = ?auto_375680 ?auto_375686 ) ) ( not ( = ?auto_375680 ?auto_375687 ) ) ( not ( = ?auto_375681 ?auto_375682 ) ) ( not ( = ?auto_375681 ?auto_375683 ) ) ( not ( = ?auto_375681 ?auto_375684 ) ) ( not ( = ?auto_375681 ?auto_375685 ) ) ( not ( = ?auto_375681 ?auto_375686 ) ) ( not ( = ?auto_375681 ?auto_375687 ) ) ( not ( = ?auto_375682 ?auto_375683 ) ) ( not ( = ?auto_375682 ?auto_375684 ) ) ( not ( = ?auto_375682 ?auto_375685 ) ) ( not ( = ?auto_375682 ?auto_375686 ) ) ( not ( = ?auto_375682 ?auto_375687 ) ) ( not ( = ?auto_375683 ?auto_375684 ) ) ( not ( = ?auto_375683 ?auto_375685 ) ) ( not ( = ?auto_375683 ?auto_375686 ) ) ( not ( = ?auto_375683 ?auto_375687 ) ) ( not ( = ?auto_375684 ?auto_375685 ) ) ( not ( = ?auto_375684 ?auto_375686 ) ) ( not ( = ?auto_375684 ?auto_375687 ) ) ( not ( = ?auto_375685 ?auto_375686 ) ) ( not ( = ?auto_375685 ?auto_375687 ) ) ( not ( = ?auto_375686 ?auto_375687 ) ) ( ON ?auto_375686 ?auto_375687 ) ( ON ?auto_375685 ?auto_375686 ) ( ON ?auto_375684 ?auto_375685 ) ( ON ?auto_375683 ?auto_375684 ) ( CLEAR ?auto_375681 ) ( ON ?auto_375682 ?auto_375683 ) ( CLEAR ?auto_375682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_375673 ?auto_375674 ?auto_375675 ?auto_375676 ?auto_375677 ?auto_375678 ?auto_375679 ?auto_375680 ?auto_375681 ?auto_375682 )
      ( MAKE-15PILE ?auto_375673 ?auto_375674 ?auto_375675 ?auto_375676 ?auto_375677 ?auto_375678 ?auto_375679 ?auto_375680 ?auto_375681 ?auto_375682 ?auto_375683 ?auto_375684 ?auto_375685 ?auto_375686 ?auto_375687 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375703 - BLOCK
      ?auto_375704 - BLOCK
      ?auto_375705 - BLOCK
      ?auto_375706 - BLOCK
      ?auto_375707 - BLOCK
      ?auto_375708 - BLOCK
      ?auto_375709 - BLOCK
      ?auto_375710 - BLOCK
      ?auto_375711 - BLOCK
      ?auto_375712 - BLOCK
      ?auto_375713 - BLOCK
      ?auto_375714 - BLOCK
      ?auto_375715 - BLOCK
      ?auto_375716 - BLOCK
      ?auto_375717 - BLOCK
    )
    :vars
    (
      ?auto_375718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375717 ?auto_375718 ) ( ON-TABLE ?auto_375703 ) ( ON ?auto_375704 ?auto_375703 ) ( ON ?auto_375705 ?auto_375704 ) ( ON ?auto_375706 ?auto_375705 ) ( ON ?auto_375707 ?auto_375706 ) ( ON ?auto_375708 ?auto_375707 ) ( ON ?auto_375709 ?auto_375708 ) ( ON ?auto_375710 ?auto_375709 ) ( not ( = ?auto_375703 ?auto_375704 ) ) ( not ( = ?auto_375703 ?auto_375705 ) ) ( not ( = ?auto_375703 ?auto_375706 ) ) ( not ( = ?auto_375703 ?auto_375707 ) ) ( not ( = ?auto_375703 ?auto_375708 ) ) ( not ( = ?auto_375703 ?auto_375709 ) ) ( not ( = ?auto_375703 ?auto_375710 ) ) ( not ( = ?auto_375703 ?auto_375711 ) ) ( not ( = ?auto_375703 ?auto_375712 ) ) ( not ( = ?auto_375703 ?auto_375713 ) ) ( not ( = ?auto_375703 ?auto_375714 ) ) ( not ( = ?auto_375703 ?auto_375715 ) ) ( not ( = ?auto_375703 ?auto_375716 ) ) ( not ( = ?auto_375703 ?auto_375717 ) ) ( not ( = ?auto_375703 ?auto_375718 ) ) ( not ( = ?auto_375704 ?auto_375705 ) ) ( not ( = ?auto_375704 ?auto_375706 ) ) ( not ( = ?auto_375704 ?auto_375707 ) ) ( not ( = ?auto_375704 ?auto_375708 ) ) ( not ( = ?auto_375704 ?auto_375709 ) ) ( not ( = ?auto_375704 ?auto_375710 ) ) ( not ( = ?auto_375704 ?auto_375711 ) ) ( not ( = ?auto_375704 ?auto_375712 ) ) ( not ( = ?auto_375704 ?auto_375713 ) ) ( not ( = ?auto_375704 ?auto_375714 ) ) ( not ( = ?auto_375704 ?auto_375715 ) ) ( not ( = ?auto_375704 ?auto_375716 ) ) ( not ( = ?auto_375704 ?auto_375717 ) ) ( not ( = ?auto_375704 ?auto_375718 ) ) ( not ( = ?auto_375705 ?auto_375706 ) ) ( not ( = ?auto_375705 ?auto_375707 ) ) ( not ( = ?auto_375705 ?auto_375708 ) ) ( not ( = ?auto_375705 ?auto_375709 ) ) ( not ( = ?auto_375705 ?auto_375710 ) ) ( not ( = ?auto_375705 ?auto_375711 ) ) ( not ( = ?auto_375705 ?auto_375712 ) ) ( not ( = ?auto_375705 ?auto_375713 ) ) ( not ( = ?auto_375705 ?auto_375714 ) ) ( not ( = ?auto_375705 ?auto_375715 ) ) ( not ( = ?auto_375705 ?auto_375716 ) ) ( not ( = ?auto_375705 ?auto_375717 ) ) ( not ( = ?auto_375705 ?auto_375718 ) ) ( not ( = ?auto_375706 ?auto_375707 ) ) ( not ( = ?auto_375706 ?auto_375708 ) ) ( not ( = ?auto_375706 ?auto_375709 ) ) ( not ( = ?auto_375706 ?auto_375710 ) ) ( not ( = ?auto_375706 ?auto_375711 ) ) ( not ( = ?auto_375706 ?auto_375712 ) ) ( not ( = ?auto_375706 ?auto_375713 ) ) ( not ( = ?auto_375706 ?auto_375714 ) ) ( not ( = ?auto_375706 ?auto_375715 ) ) ( not ( = ?auto_375706 ?auto_375716 ) ) ( not ( = ?auto_375706 ?auto_375717 ) ) ( not ( = ?auto_375706 ?auto_375718 ) ) ( not ( = ?auto_375707 ?auto_375708 ) ) ( not ( = ?auto_375707 ?auto_375709 ) ) ( not ( = ?auto_375707 ?auto_375710 ) ) ( not ( = ?auto_375707 ?auto_375711 ) ) ( not ( = ?auto_375707 ?auto_375712 ) ) ( not ( = ?auto_375707 ?auto_375713 ) ) ( not ( = ?auto_375707 ?auto_375714 ) ) ( not ( = ?auto_375707 ?auto_375715 ) ) ( not ( = ?auto_375707 ?auto_375716 ) ) ( not ( = ?auto_375707 ?auto_375717 ) ) ( not ( = ?auto_375707 ?auto_375718 ) ) ( not ( = ?auto_375708 ?auto_375709 ) ) ( not ( = ?auto_375708 ?auto_375710 ) ) ( not ( = ?auto_375708 ?auto_375711 ) ) ( not ( = ?auto_375708 ?auto_375712 ) ) ( not ( = ?auto_375708 ?auto_375713 ) ) ( not ( = ?auto_375708 ?auto_375714 ) ) ( not ( = ?auto_375708 ?auto_375715 ) ) ( not ( = ?auto_375708 ?auto_375716 ) ) ( not ( = ?auto_375708 ?auto_375717 ) ) ( not ( = ?auto_375708 ?auto_375718 ) ) ( not ( = ?auto_375709 ?auto_375710 ) ) ( not ( = ?auto_375709 ?auto_375711 ) ) ( not ( = ?auto_375709 ?auto_375712 ) ) ( not ( = ?auto_375709 ?auto_375713 ) ) ( not ( = ?auto_375709 ?auto_375714 ) ) ( not ( = ?auto_375709 ?auto_375715 ) ) ( not ( = ?auto_375709 ?auto_375716 ) ) ( not ( = ?auto_375709 ?auto_375717 ) ) ( not ( = ?auto_375709 ?auto_375718 ) ) ( not ( = ?auto_375710 ?auto_375711 ) ) ( not ( = ?auto_375710 ?auto_375712 ) ) ( not ( = ?auto_375710 ?auto_375713 ) ) ( not ( = ?auto_375710 ?auto_375714 ) ) ( not ( = ?auto_375710 ?auto_375715 ) ) ( not ( = ?auto_375710 ?auto_375716 ) ) ( not ( = ?auto_375710 ?auto_375717 ) ) ( not ( = ?auto_375710 ?auto_375718 ) ) ( not ( = ?auto_375711 ?auto_375712 ) ) ( not ( = ?auto_375711 ?auto_375713 ) ) ( not ( = ?auto_375711 ?auto_375714 ) ) ( not ( = ?auto_375711 ?auto_375715 ) ) ( not ( = ?auto_375711 ?auto_375716 ) ) ( not ( = ?auto_375711 ?auto_375717 ) ) ( not ( = ?auto_375711 ?auto_375718 ) ) ( not ( = ?auto_375712 ?auto_375713 ) ) ( not ( = ?auto_375712 ?auto_375714 ) ) ( not ( = ?auto_375712 ?auto_375715 ) ) ( not ( = ?auto_375712 ?auto_375716 ) ) ( not ( = ?auto_375712 ?auto_375717 ) ) ( not ( = ?auto_375712 ?auto_375718 ) ) ( not ( = ?auto_375713 ?auto_375714 ) ) ( not ( = ?auto_375713 ?auto_375715 ) ) ( not ( = ?auto_375713 ?auto_375716 ) ) ( not ( = ?auto_375713 ?auto_375717 ) ) ( not ( = ?auto_375713 ?auto_375718 ) ) ( not ( = ?auto_375714 ?auto_375715 ) ) ( not ( = ?auto_375714 ?auto_375716 ) ) ( not ( = ?auto_375714 ?auto_375717 ) ) ( not ( = ?auto_375714 ?auto_375718 ) ) ( not ( = ?auto_375715 ?auto_375716 ) ) ( not ( = ?auto_375715 ?auto_375717 ) ) ( not ( = ?auto_375715 ?auto_375718 ) ) ( not ( = ?auto_375716 ?auto_375717 ) ) ( not ( = ?auto_375716 ?auto_375718 ) ) ( not ( = ?auto_375717 ?auto_375718 ) ) ( ON ?auto_375716 ?auto_375717 ) ( ON ?auto_375715 ?auto_375716 ) ( ON ?auto_375714 ?auto_375715 ) ( ON ?auto_375713 ?auto_375714 ) ( ON ?auto_375712 ?auto_375713 ) ( CLEAR ?auto_375710 ) ( ON ?auto_375711 ?auto_375712 ) ( CLEAR ?auto_375711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_375703 ?auto_375704 ?auto_375705 ?auto_375706 ?auto_375707 ?auto_375708 ?auto_375709 ?auto_375710 ?auto_375711 )
      ( MAKE-15PILE ?auto_375703 ?auto_375704 ?auto_375705 ?auto_375706 ?auto_375707 ?auto_375708 ?auto_375709 ?auto_375710 ?auto_375711 ?auto_375712 ?auto_375713 ?auto_375714 ?auto_375715 ?auto_375716 ?auto_375717 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375734 - BLOCK
      ?auto_375735 - BLOCK
      ?auto_375736 - BLOCK
      ?auto_375737 - BLOCK
      ?auto_375738 - BLOCK
      ?auto_375739 - BLOCK
      ?auto_375740 - BLOCK
      ?auto_375741 - BLOCK
      ?auto_375742 - BLOCK
      ?auto_375743 - BLOCK
      ?auto_375744 - BLOCK
      ?auto_375745 - BLOCK
      ?auto_375746 - BLOCK
      ?auto_375747 - BLOCK
      ?auto_375748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375748 ) ( ON-TABLE ?auto_375734 ) ( ON ?auto_375735 ?auto_375734 ) ( ON ?auto_375736 ?auto_375735 ) ( ON ?auto_375737 ?auto_375736 ) ( ON ?auto_375738 ?auto_375737 ) ( ON ?auto_375739 ?auto_375738 ) ( ON ?auto_375740 ?auto_375739 ) ( ON ?auto_375741 ?auto_375740 ) ( not ( = ?auto_375734 ?auto_375735 ) ) ( not ( = ?auto_375734 ?auto_375736 ) ) ( not ( = ?auto_375734 ?auto_375737 ) ) ( not ( = ?auto_375734 ?auto_375738 ) ) ( not ( = ?auto_375734 ?auto_375739 ) ) ( not ( = ?auto_375734 ?auto_375740 ) ) ( not ( = ?auto_375734 ?auto_375741 ) ) ( not ( = ?auto_375734 ?auto_375742 ) ) ( not ( = ?auto_375734 ?auto_375743 ) ) ( not ( = ?auto_375734 ?auto_375744 ) ) ( not ( = ?auto_375734 ?auto_375745 ) ) ( not ( = ?auto_375734 ?auto_375746 ) ) ( not ( = ?auto_375734 ?auto_375747 ) ) ( not ( = ?auto_375734 ?auto_375748 ) ) ( not ( = ?auto_375735 ?auto_375736 ) ) ( not ( = ?auto_375735 ?auto_375737 ) ) ( not ( = ?auto_375735 ?auto_375738 ) ) ( not ( = ?auto_375735 ?auto_375739 ) ) ( not ( = ?auto_375735 ?auto_375740 ) ) ( not ( = ?auto_375735 ?auto_375741 ) ) ( not ( = ?auto_375735 ?auto_375742 ) ) ( not ( = ?auto_375735 ?auto_375743 ) ) ( not ( = ?auto_375735 ?auto_375744 ) ) ( not ( = ?auto_375735 ?auto_375745 ) ) ( not ( = ?auto_375735 ?auto_375746 ) ) ( not ( = ?auto_375735 ?auto_375747 ) ) ( not ( = ?auto_375735 ?auto_375748 ) ) ( not ( = ?auto_375736 ?auto_375737 ) ) ( not ( = ?auto_375736 ?auto_375738 ) ) ( not ( = ?auto_375736 ?auto_375739 ) ) ( not ( = ?auto_375736 ?auto_375740 ) ) ( not ( = ?auto_375736 ?auto_375741 ) ) ( not ( = ?auto_375736 ?auto_375742 ) ) ( not ( = ?auto_375736 ?auto_375743 ) ) ( not ( = ?auto_375736 ?auto_375744 ) ) ( not ( = ?auto_375736 ?auto_375745 ) ) ( not ( = ?auto_375736 ?auto_375746 ) ) ( not ( = ?auto_375736 ?auto_375747 ) ) ( not ( = ?auto_375736 ?auto_375748 ) ) ( not ( = ?auto_375737 ?auto_375738 ) ) ( not ( = ?auto_375737 ?auto_375739 ) ) ( not ( = ?auto_375737 ?auto_375740 ) ) ( not ( = ?auto_375737 ?auto_375741 ) ) ( not ( = ?auto_375737 ?auto_375742 ) ) ( not ( = ?auto_375737 ?auto_375743 ) ) ( not ( = ?auto_375737 ?auto_375744 ) ) ( not ( = ?auto_375737 ?auto_375745 ) ) ( not ( = ?auto_375737 ?auto_375746 ) ) ( not ( = ?auto_375737 ?auto_375747 ) ) ( not ( = ?auto_375737 ?auto_375748 ) ) ( not ( = ?auto_375738 ?auto_375739 ) ) ( not ( = ?auto_375738 ?auto_375740 ) ) ( not ( = ?auto_375738 ?auto_375741 ) ) ( not ( = ?auto_375738 ?auto_375742 ) ) ( not ( = ?auto_375738 ?auto_375743 ) ) ( not ( = ?auto_375738 ?auto_375744 ) ) ( not ( = ?auto_375738 ?auto_375745 ) ) ( not ( = ?auto_375738 ?auto_375746 ) ) ( not ( = ?auto_375738 ?auto_375747 ) ) ( not ( = ?auto_375738 ?auto_375748 ) ) ( not ( = ?auto_375739 ?auto_375740 ) ) ( not ( = ?auto_375739 ?auto_375741 ) ) ( not ( = ?auto_375739 ?auto_375742 ) ) ( not ( = ?auto_375739 ?auto_375743 ) ) ( not ( = ?auto_375739 ?auto_375744 ) ) ( not ( = ?auto_375739 ?auto_375745 ) ) ( not ( = ?auto_375739 ?auto_375746 ) ) ( not ( = ?auto_375739 ?auto_375747 ) ) ( not ( = ?auto_375739 ?auto_375748 ) ) ( not ( = ?auto_375740 ?auto_375741 ) ) ( not ( = ?auto_375740 ?auto_375742 ) ) ( not ( = ?auto_375740 ?auto_375743 ) ) ( not ( = ?auto_375740 ?auto_375744 ) ) ( not ( = ?auto_375740 ?auto_375745 ) ) ( not ( = ?auto_375740 ?auto_375746 ) ) ( not ( = ?auto_375740 ?auto_375747 ) ) ( not ( = ?auto_375740 ?auto_375748 ) ) ( not ( = ?auto_375741 ?auto_375742 ) ) ( not ( = ?auto_375741 ?auto_375743 ) ) ( not ( = ?auto_375741 ?auto_375744 ) ) ( not ( = ?auto_375741 ?auto_375745 ) ) ( not ( = ?auto_375741 ?auto_375746 ) ) ( not ( = ?auto_375741 ?auto_375747 ) ) ( not ( = ?auto_375741 ?auto_375748 ) ) ( not ( = ?auto_375742 ?auto_375743 ) ) ( not ( = ?auto_375742 ?auto_375744 ) ) ( not ( = ?auto_375742 ?auto_375745 ) ) ( not ( = ?auto_375742 ?auto_375746 ) ) ( not ( = ?auto_375742 ?auto_375747 ) ) ( not ( = ?auto_375742 ?auto_375748 ) ) ( not ( = ?auto_375743 ?auto_375744 ) ) ( not ( = ?auto_375743 ?auto_375745 ) ) ( not ( = ?auto_375743 ?auto_375746 ) ) ( not ( = ?auto_375743 ?auto_375747 ) ) ( not ( = ?auto_375743 ?auto_375748 ) ) ( not ( = ?auto_375744 ?auto_375745 ) ) ( not ( = ?auto_375744 ?auto_375746 ) ) ( not ( = ?auto_375744 ?auto_375747 ) ) ( not ( = ?auto_375744 ?auto_375748 ) ) ( not ( = ?auto_375745 ?auto_375746 ) ) ( not ( = ?auto_375745 ?auto_375747 ) ) ( not ( = ?auto_375745 ?auto_375748 ) ) ( not ( = ?auto_375746 ?auto_375747 ) ) ( not ( = ?auto_375746 ?auto_375748 ) ) ( not ( = ?auto_375747 ?auto_375748 ) ) ( ON ?auto_375747 ?auto_375748 ) ( ON ?auto_375746 ?auto_375747 ) ( ON ?auto_375745 ?auto_375746 ) ( ON ?auto_375744 ?auto_375745 ) ( ON ?auto_375743 ?auto_375744 ) ( CLEAR ?auto_375741 ) ( ON ?auto_375742 ?auto_375743 ) ( CLEAR ?auto_375742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_375734 ?auto_375735 ?auto_375736 ?auto_375737 ?auto_375738 ?auto_375739 ?auto_375740 ?auto_375741 ?auto_375742 )
      ( MAKE-15PILE ?auto_375734 ?auto_375735 ?auto_375736 ?auto_375737 ?auto_375738 ?auto_375739 ?auto_375740 ?auto_375741 ?auto_375742 ?auto_375743 ?auto_375744 ?auto_375745 ?auto_375746 ?auto_375747 ?auto_375748 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375764 - BLOCK
      ?auto_375765 - BLOCK
      ?auto_375766 - BLOCK
      ?auto_375767 - BLOCK
      ?auto_375768 - BLOCK
      ?auto_375769 - BLOCK
      ?auto_375770 - BLOCK
      ?auto_375771 - BLOCK
      ?auto_375772 - BLOCK
      ?auto_375773 - BLOCK
      ?auto_375774 - BLOCK
      ?auto_375775 - BLOCK
      ?auto_375776 - BLOCK
      ?auto_375777 - BLOCK
      ?auto_375778 - BLOCK
    )
    :vars
    (
      ?auto_375779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375778 ?auto_375779 ) ( ON-TABLE ?auto_375764 ) ( ON ?auto_375765 ?auto_375764 ) ( ON ?auto_375766 ?auto_375765 ) ( ON ?auto_375767 ?auto_375766 ) ( ON ?auto_375768 ?auto_375767 ) ( ON ?auto_375769 ?auto_375768 ) ( ON ?auto_375770 ?auto_375769 ) ( not ( = ?auto_375764 ?auto_375765 ) ) ( not ( = ?auto_375764 ?auto_375766 ) ) ( not ( = ?auto_375764 ?auto_375767 ) ) ( not ( = ?auto_375764 ?auto_375768 ) ) ( not ( = ?auto_375764 ?auto_375769 ) ) ( not ( = ?auto_375764 ?auto_375770 ) ) ( not ( = ?auto_375764 ?auto_375771 ) ) ( not ( = ?auto_375764 ?auto_375772 ) ) ( not ( = ?auto_375764 ?auto_375773 ) ) ( not ( = ?auto_375764 ?auto_375774 ) ) ( not ( = ?auto_375764 ?auto_375775 ) ) ( not ( = ?auto_375764 ?auto_375776 ) ) ( not ( = ?auto_375764 ?auto_375777 ) ) ( not ( = ?auto_375764 ?auto_375778 ) ) ( not ( = ?auto_375764 ?auto_375779 ) ) ( not ( = ?auto_375765 ?auto_375766 ) ) ( not ( = ?auto_375765 ?auto_375767 ) ) ( not ( = ?auto_375765 ?auto_375768 ) ) ( not ( = ?auto_375765 ?auto_375769 ) ) ( not ( = ?auto_375765 ?auto_375770 ) ) ( not ( = ?auto_375765 ?auto_375771 ) ) ( not ( = ?auto_375765 ?auto_375772 ) ) ( not ( = ?auto_375765 ?auto_375773 ) ) ( not ( = ?auto_375765 ?auto_375774 ) ) ( not ( = ?auto_375765 ?auto_375775 ) ) ( not ( = ?auto_375765 ?auto_375776 ) ) ( not ( = ?auto_375765 ?auto_375777 ) ) ( not ( = ?auto_375765 ?auto_375778 ) ) ( not ( = ?auto_375765 ?auto_375779 ) ) ( not ( = ?auto_375766 ?auto_375767 ) ) ( not ( = ?auto_375766 ?auto_375768 ) ) ( not ( = ?auto_375766 ?auto_375769 ) ) ( not ( = ?auto_375766 ?auto_375770 ) ) ( not ( = ?auto_375766 ?auto_375771 ) ) ( not ( = ?auto_375766 ?auto_375772 ) ) ( not ( = ?auto_375766 ?auto_375773 ) ) ( not ( = ?auto_375766 ?auto_375774 ) ) ( not ( = ?auto_375766 ?auto_375775 ) ) ( not ( = ?auto_375766 ?auto_375776 ) ) ( not ( = ?auto_375766 ?auto_375777 ) ) ( not ( = ?auto_375766 ?auto_375778 ) ) ( not ( = ?auto_375766 ?auto_375779 ) ) ( not ( = ?auto_375767 ?auto_375768 ) ) ( not ( = ?auto_375767 ?auto_375769 ) ) ( not ( = ?auto_375767 ?auto_375770 ) ) ( not ( = ?auto_375767 ?auto_375771 ) ) ( not ( = ?auto_375767 ?auto_375772 ) ) ( not ( = ?auto_375767 ?auto_375773 ) ) ( not ( = ?auto_375767 ?auto_375774 ) ) ( not ( = ?auto_375767 ?auto_375775 ) ) ( not ( = ?auto_375767 ?auto_375776 ) ) ( not ( = ?auto_375767 ?auto_375777 ) ) ( not ( = ?auto_375767 ?auto_375778 ) ) ( not ( = ?auto_375767 ?auto_375779 ) ) ( not ( = ?auto_375768 ?auto_375769 ) ) ( not ( = ?auto_375768 ?auto_375770 ) ) ( not ( = ?auto_375768 ?auto_375771 ) ) ( not ( = ?auto_375768 ?auto_375772 ) ) ( not ( = ?auto_375768 ?auto_375773 ) ) ( not ( = ?auto_375768 ?auto_375774 ) ) ( not ( = ?auto_375768 ?auto_375775 ) ) ( not ( = ?auto_375768 ?auto_375776 ) ) ( not ( = ?auto_375768 ?auto_375777 ) ) ( not ( = ?auto_375768 ?auto_375778 ) ) ( not ( = ?auto_375768 ?auto_375779 ) ) ( not ( = ?auto_375769 ?auto_375770 ) ) ( not ( = ?auto_375769 ?auto_375771 ) ) ( not ( = ?auto_375769 ?auto_375772 ) ) ( not ( = ?auto_375769 ?auto_375773 ) ) ( not ( = ?auto_375769 ?auto_375774 ) ) ( not ( = ?auto_375769 ?auto_375775 ) ) ( not ( = ?auto_375769 ?auto_375776 ) ) ( not ( = ?auto_375769 ?auto_375777 ) ) ( not ( = ?auto_375769 ?auto_375778 ) ) ( not ( = ?auto_375769 ?auto_375779 ) ) ( not ( = ?auto_375770 ?auto_375771 ) ) ( not ( = ?auto_375770 ?auto_375772 ) ) ( not ( = ?auto_375770 ?auto_375773 ) ) ( not ( = ?auto_375770 ?auto_375774 ) ) ( not ( = ?auto_375770 ?auto_375775 ) ) ( not ( = ?auto_375770 ?auto_375776 ) ) ( not ( = ?auto_375770 ?auto_375777 ) ) ( not ( = ?auto_375770 ?auto_375778 ) ) ( not ( = ?auto_375770 ?auto_375779 ) ) ( not ( = ?auto_375771 ?auto_375772 ) ) ( not ( = ?auto_375771 ?auto_375773 ) ) ( not ( = ?auto_375771 ?auto_375774 ) ) ( not ( = ?auto_375771 ?auto_375775 ) ) ( not ( = ?auto_375771 ?auto_375776 ) ) ( not ( = ?auto_375771 ?auto_375777 ) ) ( not ( = ?auto_375771 ?auto_375778 ) ) ( not ( = ?auto_375771 ?auto_375779 ) ) ( not ( = ?auto_375772 ?auto_375773 ) ) ( not ( = ?auto_375772 ?auto_375774 ) ) ( not ( = ?auto_375772 ?auto_375775 ) ) ( not ( = ?auto_375772 ?auto_375776 ) ) ( not ( = ?auto_375772 ?auto_375777 ) ) ( not ( = ?auto_375772 ?auto_375778 ) ) ( not ( = ?auto_375772 ?auto_375779 ) ) ( not ( = ?auto_375773 ?auto_375774 ) ) ( not ( = ?auto_375773 ?auto_375775 ) ) ( not ( = ?auto_375773 ?auto_375776 ) ) ( not ( = ?auto_375773 ?auto_375777 ) ) ( not ( = ?auto_375773 ?auto_375778 ) ) ( not ( = ?auto_375773 ?auto_375779 ) ) ( not ( = ?auto_375774 ?auto_375775 ) ) ( not ( = ?auto_375774 ?auto_375776 ) ) ( not ( = ?auto_375774 ?auto_375777 ) ) ( not ( = ?auto_375774 ?auto_375778 ) ) ( not ( = ?auto_375774 ?auto_375779 ) ) ( not ( = ?auto_375775 ?auto_375776 ) ) ( not ( = ?auto_375775 ?auto_375777 ) ) ( not ( = ?auto_375775 ?auto_375778 ) ) ( not ( = ?auto_375775 ?auto_375779 ) ) ( not ( = ?auto_375776 ?auto_375777 ) ) ( not ( = ?auto_375776 ?auto_375778 ) ) ( not ( = ?auto_375776 ?auto_375779 ) ) ( not ( = ?auto_375777 ?auto_375778 ) ) ( not ( = ?auto_375777 ?auto_375779 ) ) ( not ( = ?auto_375778 ?auto_375779 ) ) ( ON ?auto_375777 ?auto_375778 ) ( ON ?auto_375776 ?auto_375777 ) ( ON ?auto_375775 ?auto_375776 ) ( ON ?auto_375774 ?auto_375775 ) ( ON ?auto_375773 ?auto_375774 ) ( ON ?auto_375772 ?auto_375773 ) ( CLEAR ?auto_375770 ) ( ON ?auto_375771 ?auto_375772 ) ( CLEAR ?auto_375771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_375764 ?auto_375765 ?auto_375766 ?auto_375767 ?auto_375768 ?auto_375769 ?auto_375770 ?auto_375771 )
      ( MAKE-15PILE ?auto_375764 ?auto_375765 ?auto_375766 ?auto_375767 ?auto_375768 ?auto_375769 ?auto_375770 ?auto_375771 ?auto_375772 ?auto_375773 ?auto_375774 ?auto_375775 ?auto_375776 ?auto_375777 ?auto_375778 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375795 - BLOCK
      ?auto_375796 - BLOCK
      ?auto_375797 - BLOCK
      ?auto_375798 - BLOCK
      ?auto_375799 - BLOCK
      ?auto_375800 - BLOCK
      ?auto_375801 - BLOCK
      ?auto_375802 - BLOCK
      ?auto_375803 - BLOCK
      ?auto_375804 - BLOCK
      ?auto_375805 - BLOCK
      ?auto_375806 - BLOCK
      ?auto_375807 - BLOCK
      ?auto_375808 - BLOCK
      ?auto_375809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375809 ) ( ON-TABLE ?auto_375795 ) ( ON ?auto_375796 ?auto_375795 ) ( ON ?auto_375797 ?auto_375796 ) ( ON ?auto_375798 ?auto_375797 ) ( ON ?auto_375799 ?auto_375798 ) ( ON ?auto_375800 ?auto_375799 ) ( ON ?auto_375801 ?auto_375800 ) ( not ( = ?auto_375795 ?auto_375796 ) ) ( not ( = ?auto_375795 ?auto_375797 ) ) ( not ( = ?auto_375795 ?auto_375798 ) ) ( not ( = ?auto_375795 ?auto_375799 ) ) ( not ( = ?auto_375795 ?auto_375800 ) ) ( not ( = ?auto_375795 ?auto_375801 ) ) ( not ( = ?auto_375795 ?auto_375802 ) ) ( not ( = ?auto_375795 ?auto_375803 ) ) ( not ( = ?auto_375795 ?auto_375804 ) ) ( not ( = ?auto_375795 ?auto_375805 ) ) ( not ( = ?auto_375795 ?auto_375806 ) ) ( not ( = ?auto_375795 ?auto_375807 ) ) ( not ( = ?auto_375795 ?auto_375808 ) ) ( not ( = ?auto_375795 ?auto_375809 ) ) ( not ( = ?auto_375796 ?auto_375797 ) ) ( not ( = ?auto_375796 ?auto_375798 ) ) ( not ( = ?auto_375796 ?auto_375799 ) ) ( not ( = ?auto_375796 ?auto_375800 ) ) ( not ( = ?auto_375796 ?auto_375801 ) ) ( not ( = ?auto_375796 ?auto_375802 ) ) ( not ( = ?auto_375796 ?auto_375803 ) ) ( not ( = ?auto_375796 ?auto_375804 ) ) ( not ( = ?auto_375796 ?auto_375805 ) ) ( not ( = ?auto_375796 ?auto_375806 ) ) ( not ( = ?auto_375796 ?auto_375807 ) ) ( not ( = ?auto_375796 ?auto_375808 ) ) ( not ( = ?auto_375796 ?auto_375809 ) ) ( not ( = ?auto_375797 ?auto_375798 ) ) ( not ( = ?auto_375797 ?auto_375799 ) ) ( not ( = ?auto_375797 ?auto_375800 ) ) ( not ( = ?auto_375797 ?auto_375801 ) ) ( not ( = ?auto_375797 ?auto_375802 ) ) ( not ( = ?auto_375797 ?auto_375803 ) ) ( not ( = ?auto_375797 ?auto_375804 ) ) ( not ( = ?auto_375797 ?auto_375805 ) ) ( not ( = ?auto_375797 ?auto_375806 ) ) ( not ( = ?auto_375797 ?auto_375807 ) ) ( not ( = ?auto_375797 ?auto_375808 ) ) ( not ( = ?auto_375797 ?auto_375809 ) ) ( not ( = ?auto_375798 ?auto_375799 ) ) ( not ( = ?auto_375798 ?auto_375800 ) ) ( not ( = ?auto_375798 ?auto_375801 ) ) ( not ( = ?auto_375798 ?auto_375802 ) ) ( not ( = ?auto_375798 ?auto_375803 ) ) ( not ( = ?auto_375798 ?auto_375804 ) ) ( not ( = ?auto_375798 ?auto_375805 ) ) ( not ( = ?auto_375798 ?auto_375806 ) ) ( not ( = ?auto_375798 ?auto_375807 ) ) ( not ( = ?auto_375798 ?auto_375808 ) ) ( not ( = ?auto_375798 ?auto_375809 ) ) ( not ( = ?auto_375799 ?auto_375800 ) ) ( not ( = ?auto_375799 ?auto_375801 ) ) ( not ( = ?auto_375799 ?auto_375802 ) ) ( not ( = ?auto_375799 ?auto_375803 ) ) ( not ( = ?auto_375799 ?auto_375804 ) ) ( not ( = ?auto_375799 ?auto_375805 ) ) ( not ( = ?auto_375799 ?auto_375806 ) ) ( not ( = ?auto_375799 ?auto_375807 ) ) ( not ( = ?auto_375799 ?auto_375808 ) ) ( not ( = ?auto_375799 ?auto_375809 ) ) ( not ( = ?auto_375800 ?auto_375801 ) ) ( not ( = ?auto_375800 ?auto_375802 ) ) ( not ( = ?auto_375800 ?auto_375803 ) ) ( not ( = ?auto_375800 ?auto_375804 ) ) ( not ( = ?auto_375800 ?auto_375805 ) ) ( not ( = ?auto_375800 ?auto_375806 ) ) ( not ( = ?auto_375800 ?auto_375807 ) ) ( not ( = ?auto_375800 ?auto_375808 ) ) ( not ( = ?auto_375800 ?auto_375809 ) ) ( not ( = ?auto_375801 ?auto_375802 ) ) ( not ( = ?auto_375801 ?auto_375803 ) ) ( not ( = ?auto_375801 ?auto_375804 ) ) ( not ( = ?auto_375801 ?auto_375805 ) ) ( not ( = ?auto_375801 ?auto_375806 ) ) ( not ( = ?auto_375801 ?auto_375807 ) ) ( not ( = ?auto_375801 ?auto_375808 ) ) ( not ( = ?auto_375801 ?auto_375809 ) ) ( not ( = ?auto_375802 ?auto_375803 ) ) ( not ( = ?auto_375802 ?auto_375804 ) ) ( not ( = ?auto_375802 ?auto_375805 ) ) ( not ( = ?auto_375802 ?auto_375806 ) ) ( not ( = ?auto_375802 ?auto_375807 ) ) ( not ( = ?auto_375802 ?auto_375808 ) ) ( not ( = ?auto_375802 ?auto_375809 ) ) ( not ( = ?auto_375803 ?auto_375804 ) ) ( not ( = ?auto_375803 ?auto_375805 ) ) ( not ( = ?auto_375803 ?auto_375806 ) ) ( not ( = ?auto_375803 ?auto_375807 ) ) ( not ( = ?auto_375803 ?auto_375808 ) ) ( not ( = ?auto_375803 ?auto_375809 ) ) ( not ( = ?auto_375804 ?auto_375805 ) ) ( not ( = ?auto_375804 ?auto_375806 ) ) ( not ( = ?auto_375804 ?auto_375807 ) ) ( not ( = ?auto_375804 ?auto_375808 ) ) ( not ( = ?auto_375804 ?auto_375809 ) ) ( not ( = ?auto_375805 ?auto_375806 ) ) ( not ( = ?auto_375805 ?auto_375807 ) ) ( not ( = ?auto_375805 ?auto_375808 ) ) ( not ( = ?auto_375805 ?auto_375809 ) ) ( not ( = ?auto_375806 ?auto_375807 ) ) ( not ( = ?auto_375806 ?auto_375808 ) ) ( not ( = ?auto_375806 ?auto_375809 ) ) ( not ( = ?auto_375807 ?auto_375808 ) ) ( not ( = ?auto_375807 ?auto_375809 ) ) ( not ( = ?auto_375808 ?auto_375809 ) ) ( ON ?auto_375808 ?auto_375809 ) ( ON ?auto_375807 ?auto_375808 ) ( ON ?auto_375806 ?auto_375807 ) ( ON ?auto_375805 ?auto_375806 ) ( ON ?auto_375804 ?auto_375805 ) ( ON ?auto_375803 ?auto_375804 ) ( CLEAR ?auto_375801 ) ( ON ?auto_375802 ?auto_375803 ) ( CLEAR ?auto_375802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_375795 ?auto_375796 ?auto_375797 ?auto_375798 ?auto_375799 ?auto_375800 ?auto_375801 ?auto_375802 )
      ( MAKE-15PILE ?auto_375795 ?auto_375796 ?auto_375797 ?auto_375798 ?auto_375799 ?auto_375800 ?auto_375801 ?auto_375802 ?auto_375803 ?auto_375804 ?auto_375805 ?auto_375806 ?auto_375807 ?auto_375808 ?auto_375809 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375825 - BLOCK
      ?auto_375826 - BLOCK
      ?auto_375827 - BLOCK
      ?auto_375828 - BLOCK
      ?auto_375829 - BLOCK
      ?auto_375830 - BLOCK
      ?auto_375831 - BLOCK
      ?auto_375832 - BLOCK
      ?auto_375833 - BLOCK
      ?auto_375834 - BLOCK
      ?auto_375835 - BLOCK
      ?auto_375836 - BLOCK
      ?auto_375837 - BLOCK
      ?auto_375838 - BLOCK
      ?auto_375839 - BLOCK
    )
    :vars
    (
      ?auto_375840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375839 ?auto_375840 ) ( ON-TABLE ?auto_375825 ) ( ON ?auto_375826 ?auto_375825 ) ( ON ?auto_375827 ?auto_375826 ) ( ON ?auto_375828 ?auto_375827 ) ( ON ?auto_375829 ?auto_375828 ) ( ON ?auto_375830 ?auto_375829 ) ( not ( = ?auto_375825 ?auto_375826 ) ) ( not ( = ?auto_375825 ?auto_375827 ) ) ( not ( = ?auto_375825 ?auto_375828 ) ) ( not ( = ?auto_375825 ?auto_375829 ) ) ( not ( = ?auto_375825 ?auto_375830 ) ) ( not ( = ?auto_375825 ?auto_375831 ) ) ( not ( = ?auto_375825 ?auto_375832 ) ) ( not ( = ?auto_375825 ?auto_375833 ) ) ( not ( = ?auto_375825 ?auto_375834 ) ) ( not ( = ?auto_375825 ?auto_375835 ) ) ( not ( = ?auto_375825 ?auto_375836 ) ) ( not ( = ?auto_375825 ?auto_375837 ) ) ( not ( = ?auto_375825 ?auto_375838 ) ) ( not ( = ?auto_375825 ?auto_375839 ) ) ( not ( = ?auto_375825 ?auto_375840 ) ) ( not ( = ?auto_375826 ?auto_375827 ) ) ( not ( = ?auto_375826 ?auto_375828 ) ) ( not ( = ?auto_375826 ?auto_375829 ) ) ( not ( = ?auto_375826 ?auto_375830 ) ) ( not ( = ?auto_375826 ?auto_375831 ) ) ( not ( = ?auto_375826 ?auto_375832 ) ) ( not ( = ?auto_375826 ?auto_375833 ) ) ( not ( = ?auto_375826 ?auto_375834 ) ) ( not ( = ?auto_375826 ?auto_375835 ) ) ( not ( = ?auto_375826 ?auto_375836 ) ) ( not ( = ?auto_375826 ?auto_375837 ) ) ( not ( = ?auto_375826 ?auto_375838 ) ) ( not ( = ?auto_375826 ?auto_375839 ) ) ( not ( = ?auto_375826 ?auto_375840 ) ) ( not ( = ?auto_375827 ?auto_375828 ) ) ( not ( = ?auto_375827 ?auto_375829 ) ) ( not ( = ?auto_375827 ?auto_375830 ) ) ( not ( = ?auto_375827 ?auto_375831 ) ) ( not ( = ?auto_375827 ?auto_375832 ) ) ( not ( = ?auto_375827 ?auto_375833 ) ) ( not ( = ?auto_375827 ?auto_375834 ) ) ( not ( = ?auto_375827 ?auto_375835 ) ) ( not ( = ?auto_375827 ?auto_375836 ) ) ( not ( = ?auto_375827 ?auto_375837 ) ) ( not ( = ?auto_375827 ?auto_375838 ) ) ( not ( = ?auto_375827 ?auto_375839 ) ) ( not ( = ?auto_375827 ?auto_375840 ) ) ( not ( = ?auto_375828 ?auto_375829 ) ) ( not ( = ?auto_375828 ?auto_375830 ) ) ( not ( = ?auto_375828 ?auto_375831 ) ) ( not ( = ?auto_375828 ?auto_375832 ) ) ( not ( = ?auto_375828 ?auto_375833 ) ) ( not ( = ?auto_375828 ?auto_375834 ) ) ( not ( = ?auto_375828 ?auto_375835 ) ) ( not ( = ?auto_375828 ?auto_375836 ) ) ( not ( = ?auto_375828 ?auto_375837 ) ) ( not ( = ?auto_375828 ?auto_375838 ) ) ( not ( = ?auto_375828 ?auto_375839 ) ) ( not ( = ?auto_375828 ?auto_375840 ) ) ( not ( = ?auto_375829 ?auto_375830 ) ) ( not ( = ?auto_375829 ?auto_375831 ) ) ( not ( = ?auto_375829 ?auto_375832 ) ) ( not ( = ?auto_375829 ?auto_375833 ) ) ( not ( = ?auto_375829 ?auto_375834 ) ) ( not ( = ?auto_375829 ?auto_375835 ) ) ( not ( = ?auto_375829 ?auto_375836 ) ) ( not ( = ?auto_375829 ?auto_375837 ) ) ( not ( = ?auto_375829 ?auto_375838 ) ) ( not ( = ?auto_375829 ?auto_375839 ) ) ( not ( = ?auto_375829 ?auto_375840 ) ) ( not ( = ?auto_375830 ?auto_375831 ) ) ( not ( = ?auto_375830 ?auto_375832 ) ) ( not ( = ?auto_375830 ?auto_375833 ) ) ( not ( = ?auto_375830 ?auto_375834 ) ) ( not ( = ?auto_375830 ?auto_375835 ) ) ( not ( = ?auto_375830 ?auto_375836 ) ) ( not ( = ?auto_375830 ?auto_375837 ) ) ( not ( = ?auto_375830 ?auto_375838 ) ) ( not ( = ?auto_375830 ?auto_375839 ) ) ( not ( = ?auto_375830 ?auto_375840 ) ) ( not ( = ?auto_375831 ?auto_375832 ) ) ( not ( = ?auto_375831 ?auto_375833 ) ) ( not ( = ?auto_375831 ?auto_375834 ) ) ( not ( = ?auto_375831 ?auto_375835 ) ) ( not ( = ?auto_375831 ?auto_375836 ) ) ( not ( = ?auto_375831 ?auto_375837 ) ) ( not ( = ?auto_375831 ?auto_375838 ) ) ( not ( = ?auto_375831 ?auto_375839 ) ) ( not ( = ?auto_375831 ?auto_375840 ) ) ( not ( = ?auto_375832 ?auto_375833 ) ) ( not ( = ?auto_375832 ?auto_375834 ) ) ( not ( = ?auto_375832 ?auto_375835 ) ) ( not ( = ?auto_375832 ?auto_375836 ) ) ( not ( = ?auto_375832 ?auto_375837 ) ) ( not ( = ?auto_375832 ?auto_375838 ) ) ( not ( = ?auto_375832 ?auto_375839 ) ) ( not ( = ?auto_375832 ?auto_375840 ) ) ( not ( = ?auto_375833 ?auto_375834 ) ) ( not ( = ?auto_375833 ?auto_375835 ) ) ( not ( = ?auto_375833 ?auto_375836 ) ) ( not ( = ?auto_375833 ?auto_375837 ) ) ( not ( = ?auto_375833 ?auto_375838 ) ) ( not ( = ?auto_375833 ?auto_375839 ) ) ( not ( = ?auto_375833 ?auto_375840 ) ) ( not ( = ?auto_375834 ?auto_375835 ) ) ( not ( = ?auto_375834 ?auto_375836 ) ) ( not ( = ?auto_375834 ?auto_375837 ) ) ( not ( = ?auto_375834 ?auto_375838 ) ) ( not ( = ?auto_375834 ?auto_375839 ) ) ( not ( = ?auto_375834 ?auto_375840 ) ) ( not ( = ?auto_375835 ?auto_375836 ) ) ( not ( = ?auto_375835 ?auto_375837 ) ) ( not ( = ?auto_375835 ?auto_375838 ) ) ( not ( = ?auto_375835 ?auto_375839 ) ) ( not ( = ?auto_375835 ?auto_375840 ) ) ( not ( = ?auto_375836 ?auto_375837 ) ) ( not ( = ?auto_375836 ?auto_375838 ) ) ( not ( = ?auto_375836 ?auto_375839 ) ) ( not ( = ?auto_375836 ?auto_375840 ) ) ( not ( = ?auto_375837 ?auto_375838 ) ) ( not ( = ?auto_375837 ?auto_375839 ) ) ( not ( = ?auto_375837 ?auto_375840 ) ) ( not ( = ?auto_375838 ?auto_375839 ) ) ( not ( = ?auto_375838 ?auto_375840 ) ) ( not ( = ?auto_375839 ?auto_375840 ) ) ( ON ?auto_375838 ?auto_375839 ) ( ON ?auto_375837 ?auto_375838 ) ( ON ?auto_375836 ?auto_375837 ) ( ON ?auto_375835 ?auto_375836 ) ( ON ?auto_375834 ?auto_375835 ) ( ON ?auto_375833 ?auto_375834 ) ( ON ?auto_375832 ?auto_375833 ) ( CLEAR ?auto_375830 ) ( ON ?auto_375831 ?auto_375832 ) ( CLEAR ?auto_375831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_375825 ?auto_375826 ?auto_375827 ?auto_375828 ?auto_375829 ?auto_375830 ?auto_375831 )
      ( MAKE-15PILE ?auto_375825 ?auto_375826 ?auto_375827 ?auto_375828 ?auto_375829 ?auto_375830 ?auto_375831 ?auto_375832 ?auto_375833 ?auto_375834 ?auto_375835 ?auto_375836 ?auto_375837 ?auto_375838 ?auto_375839 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375856 - BLOCK
      ?auto_375857 - BLOCK
      ?auto_375858 - BLOCK
      ?auto_375859 - BLOCK
      ?auto_375860 - BLOCK
      ?auto_375861 - BLOCK
      ?auto_375862 - BLOCK
      ?auto_375863 - BLOCK
      ?auto_375864 - BLOCK
      ?auto_375865 - BLOCK
      ?auto_375866 - BLOCK
      ?auto_375867 - BLOCK
      ?auto_375868 - BLOCK
      ?auto_375869 - BLOCK
      ?auto_375870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375870 ) ( ON-TABLE ?auto_375856 ) ( ON ?auto_375857 ?auto_375856 ) ( ON ?auto_375858 ?auto_375857 ) ( ON ?auto_375859 ?auto_375858 ) ( ON ?auto_375860 ?auto_375859 ) ( ON ?auto_375861 ?auto_375860 ) ( not ( = ?auto_375856 ?auto_375857 ) ) ( not ( = ?auto_375856 ?auto_375858 ) ) ( not ( = ?auto_375856 ?auto_375859 ) ) ( not ( = ?auto_375856 ?auto_375860 ) ) ( not ( = ?auto_375856 ?auto_375861 ) ) ( not ( = ?auto_375856 ?auto_375862 ) ) ( not ( = ?auto_375856 ?auto_375863 ) ) ( not ( = ?auto_375856 ?auto_375864 ) ) ( not ( = ?auto_375856 ?auto_375865 ) ) ( not ( = ?auto_375856 ?auto_375866 ) ) ( not ( = ?auto_375856 ?auto_375867 ) ) ( not ( = ?auto_375856 ?auto_375868 ) ) ( not ( = ?auto_375856 ?auto_375869 ) ) ( not ( = ?auto_375856 ?auto_375870 ) ) ( not ( = ?auto_375857 ?auto_375858 ) ) ( not ( = ?auto_375857 ?auto_375859 ) ) ( not ( = ?auto_375857 ?auto_375860 ) ) ( not ( = ?auto_375857 ?auto_375861 ) ) ( not ( = ?auto_375857 ?auto_375862 ) ) ( not ( = ?auto_375857 ?auto_375863 ) ) ( not ( = ?auto_375857 ?auto_375864 ) ) ( not ( = ?auto_375857 ?auto_375865 ) ) ( not ( = ?auto_375857 ?auto_375866 ) ) ( not ( = ?auto_375857 ?auto_375867 ) ) ( not ( = ?auto_375857 ?auto_375868 ) ) ( not ( = ?auto_375857 ?auto_375869 ) ) ( not ( = ?auto_375857 ?auto_375870 ) ) ( not ( = ?auto_375858 ?auto_375859 ) ) ( not ( = ?auto_375858 ?auto_375860 ) ) ( not ( = ?auto_375858 ?auto_375861 ) ) ( not ( = ?auto_375858 ?auto_375862 ) ) ( not ( = ?auto_375858 ?auto_375863 ) ) ( not ( = ?auto_375858 ?auto_375864 ) ) ( not ( = ?auto_375858 ?auto_375865 ) ) ( not ( = ?auto_375858 ?auto_375866 ) ) ( not ( = ?auto_375858 ?auto_375867 ) ) ( not ( = ?auto_375858 ?auto_375868 ) ) ( not ( = ?auto_375858 ?auto_375869 ) ) ( not ( = ?auto_375858 ?auto_375870 ) ) ( not ( = ?auto_375859 ?auto_375860 ) ) ( not ( = ?auto_375859 ?auto_375861 ) ) ( not ( = ?auto_375859 ?auto_375862 ) ) ( not ( = ?auto_375859 ?auto_375863 ) ) ( not ( = ?auto_375859 ?auto_375864 ) ) ( not ( = ?auto_375859 ?auto_375865 ) ) ( not ( = ?auto_375859 ?auto_375866 ) ) ( not ( = ?auto_375859 ?auto_375867 ) ) ( not ( = ?auto_375859 ?auto_375868 ) ) ( not ( = ?auto_375859 ?auto_375869 ) ) ( not ( = ?auto_375859 ?auto_375870 ) ) ( not ( = ?auto_375860 ?auto_375861 ) ) ( not ( = ?auto_375860 ?auto_375862 ) ) ( not ( = ?auto_375860 ?auto_375863 ) ) ( not ( = ?auto_375860 ?auto_375864 ) ) ( not ( = ?auto_375860 ?auto_375865 ) ) ( not ( = ?auto_375860 ?auto_375866 ) ) ( not ( = ?auto_375860 ?auto_375867 ) ) ( not ( = ?auto_375860 ?auto_375868 ) ) ( not ( = ?auto_375860 ?auto_375869 ) ) ( not ( = ?auto_375860 ?auto_375870 ) ) ( not ( = ?auto_375861 ?auto_375862 ) ) ( not ( = ?auto_375861 ?auto_375863 ) ) ( not ( = ?auto_375861 ?auto_375864 ) ) ( not ( = ?auto_375861 ?auto_375865 ) ) ( not ( = ?auto_375861 ?auto_375866 ) ) ( not ( = ?auto_375861 ?auto_375867 ) ) ( not ( = ?auto_375861 ?auto_375868 ) ) ( not ( = ?auto_375861 ?auto_375869 ) ) ( not ( = ?auto_375861 ?auto_375870 ) ) ( not ( = ?auto_375862 ?auto_375863 ) ) ( not ( = ?auto_375862 ?auto_375864 ) ) ( not ( = ?auto_375862 ?auto_375865 ) ) ( not ( = ?auto_375862 ?auto_375866 ) ) ( not ( = ?auto_375862 ?auto_375867 ) ) ( not ( = ?auto_375862 ?auto_375868 ) ) ( not ( = ?auto_375862 ?auto_375869 ) ) ( not ( = ?auto_375862 ?auto_375870 ) ) ( not ( = ?auto_375863 ?auto_375864 ) ) ( not ( = ?auto_375863 ?auto_375865 ) ) ( not ( = ?auto_375863 ?auto_375866 ) ) ( not ( = ?auto_375863 ?auto_375867 ) ) ( not ( = ?auto_375863 ?auto_375868 ) ) ( not ( = ?auto_375863 ?auto_375869 ) ) ( not ( = ?auto_375863 ?auto_375870 ) ) ( not ( = ?auto_375864 ?auto_375865 ) ) ( not ( = ?auto_375864 ?auto_375866 ) ) ( not ( = ?auto_375864 ?auto_375867 ) ) ( not ( = ?auto_375864 ?auto_375868 ) ) ( not ( = ?auto_375864 ?auto_375869 ) ) ( not ( = ?auto_375864 ?auto_375870 ) ) ( not ( = ?auto_375865 ?auto_375866 ) ) ( not ( = ?auto_375865 ?auto_375867 ) ) ( not ( = ?auto_375865 ?auto_375868 ) ) ( not ( = ?auto_375865 ?auto_375869 ) ) ( not ( = ?auto_375865 ?auto_375870 ) ) ( not ( = ?auto_375866 ?auto_375867 ) ) ( not ( = ?auto_375866 ?auto_375868 ) ) ( not ( = ?auto_375866 ?auto_375869 ) ) ( not ( = ?auto_375866 ?auto_375870 ) ) ( not ( = ?auto_375867 ?auto_375868 ) ) ( not ( = ?auto_375867 ?auto_375869 ) ) ( not ( = ?auto_375867 ?auto_375870 ) ) ( not ( = ?auto_375868 ?auto_375869 ) ) ( not ( = ?auto_375868 ?auto_375870 ) ) ( not ( = ?auto_375869 ?auto_375870 ) ) ( ON ?auto_375869 ?auto_375870 ) ( ON ?auto_375868 ?auto_375869 ) ( ON ?auto_375867 ?auto_375868 ) ( ON ?auto_375866 ?auto_375867 ) ( ON ?auto_375865 ?auto_375866 ) ( ON ?auto_375864 ?auto_375865 ) ( ON ?auto_375863 ?auto_375864 ) ( CLEAR ?auto_375861 ) ( ON ?auto_375862 ?auto_375863 ) ( CLEAR ?auto_375862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_375856 ?auto_375857 ?auto_375858 ?auto_375859 ?auto_375860 ?auto_375861 ?auto_375862 )
      ( MAKE-15PILE ?auto_375856 ?auto_375857 ?auto_375858 ?auto_375859 ?auto_375860 ?auto_375861 ?auto_375862 ?auto_375863 ?auto_375864 ?auto_375865 ?auto_375866 ?auto_375867 ?auto_375868 ?auto_375869 ?auto_375870 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375886 - BLOCK
      ?auto_375887 - BLOCK
      ?auto_375888 - BLOCK
      ?auto_375889 - BLOCK
      ?auto_375890 - BLOCK
      ?auto_375891 - BLOCK
      ?auto_375892 - BLOCK
      ?auto_375893 - BLOCK
      ?auto_375894 - BLOCK
      ?auto_375895 - BLOCK
      ?auto_375896 - BLOCK
      ?auto_375897 - BLOCK
      ?auto_375898 - BLOCK
      ?auto_375899 - BLOCK
      ?auto_375900 - BLOCK
    )
    :vars
    (
      ?auto_375901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375900 ?auto_375901 ) ( ON-TABLE ?auto_375886 ) ( ON ?auto_375887 ?auto_375886 ) ( ON ?auto_375888 ?auto_375887 ) ( ON ?auto_375889 ?auto_375888 ) ( ON ?auto_375890 ?auto_375889 ) ( not ( = ?auto_375886 ?auto_375887 ) ) ( not ( = ?auto_375886 ?auto_375888 ) ) ( not ( = ?auto_375886 ?auto_375889 ) ) ( not ( = ?auto_375886 ?auto_375890 ) ) ( not ( = ?auto_375886 ?auto_375891 ) ) ( not ( = ?auto_375886 ?auto_375892 ) ) ( not ( = ?auto_375886 ?auto_375893 ) ) ( not ( = ?auto_375886 ?auto_375894 ) ) ( not ( = ?auto_375886 ?auto_375895 ) ) ( not ( = ?auto_375886 ?auto_375896 ) ) ( not ( = ?auto_375886 ?auto_375897 ) ) ( not ( = ?auto_375886 ?auto_375898 ) ) ( not ( = ?auto_375886 ?auto_375899 ) ) ( not ( = ?auto_375886 ?auto_375900 ) ) ( not ( = ?auto_375886 ?auto_375901 ) ) ( not ( = ?auto_375887 ?auto_375888 ) ) ( not ( = ?auto_375887 ?auto_375889 ) ) ( not ( = ?auto_375887 ?auto_375890 ) ) ( not ( = ?auto_375887 ?auto_375891 ) ) ( not ( = ?auto_375887 ?auto_375892 ) ) ( not ( = ?auto_375887 ?auto_375893 ) ) ( not ( = ?auto_375887 ?auto_375894 ) ) ( not ( = ?auto_375887 ?auto_375895 ) ) ( not ( = ?auto_375887 ?auto_375896 ) ) ( not ( = ?auto_375887 ?auto_375897 ) ) ( not ( = ?auto_375887 ?auto_375898 ) ) ( not ( = ?auto_375887 ?auto_375899 ) ) ( not ( = ?auto_375887 ?auto_375900 ) ) ( not ( = ?auto_375887 ?auto_375901 ) ) ( not ( = ?auto_375888 ?auto_375889 ) ) ( not ( = ?auto_375888 ?auto_375890 ) ) ( not ( = ?auto_375888 ?auto_375891 ) ) ( not ( = ?auto_375888 ?auto_375892 ) ) ( not ( = ?auto_375888 ?auto_375893 ) ) ( not ( = ?auto_375888 ?auto_375894 ) ) ( not ( = ?auto_375888 ?auto_375895 ) ) ( not ( = ?auto_375888 ?auto_375896 ) ) ( not ( = ?auto_375888 ?auto_375897 ) ) ( not ( = ?auto_375888 ?auto_375898 ) ) ( not ( = ?auto_375888 ?auto_375899 ) ) ( not ( = ?auto_375888 ?auto_375900 ) ) ( not ( = ?auto_375888 ?auto_375901 ) ) ( not ( = ?auto_375889 ?auto_375890 ) ) ( not ( = ?auto_375889 ?auto_375891 ) ) ( not ( = ?auto_375889 ?auto_375892 ) ) ( not ( = ?auto_375889 ?auto_375893 ) ) ( not ( = ?auto_375889 ?auto_375894 ) ) ( not ( = ?auto_375889 ?auto_375895 ) ) ( not ( = ?auto_375889 ?auto_375896 ) ) ( not ( = ?auto_375889 ?auto_375897 ) ) ( not ( = ?auto_375889 ?auto_375898 ) ) ( not ( = ?auto_375889 ?auto_375899 ) ) ( not ( = ?auto_375889 ?auto_375900 ) ) ( not ( = ?auto_375889 ?auto_375901 ) ) ( not ( = ?auto_375890 ?auto_375891 ) ) ( not ( = ?auto_375890 ?auto_375892 ) ) ( not ( = ?auto_375890 ?auto_375893 ) ) ( not ( = ?auto_375890 ?auto_375894 ) ) ( not ( = ?auto_375890 ?auto_375895 ) ) ( not ( = ?auto_375890 ?auto_375896 ) ) ( not ( = ?auto_375890 ?auto_375897 ) ) ( not ( = ?auto_375890 ?auto_375898 ) ) ( not ( = ?auto_375890 ?auto_375899 ) ) ( not ( = ?auto_375890 ?auto_375900 ) ) ( not ( = ?auto_375890 ?auto_375901 ) ) ( not ( = ?auto_375891 ?auto_375892 ) ) ( not ( = ?auto_375891 ?auto_375893 ) ) ( not ( = ?auto_375891 ?auto_375894 ) ) ( not ( = ?auto_375891 ?auto_375895 ) ) ( not ( = ?auto_375891 ?auto_375896 ) ) ( not ( = ?auto_375891 ?auto_375897 ) ) ( not ( = ?auto_375891 ?auto_375898 ) ) ( not ( = ?auto_375891 ?auto_375899 ) ) ( not ( = ?auto_375891 ?auto_375900 ) ) ( not ( = ?auto_375891 ?auto_375901 ) ) ( not ( = ?auto_375892 ?auto_375893 ) ) ( not ( = ?auto_375892 ?auto_375894 ) ) ( not ( = ?auto_375892 ?auto_375895 ) ) ( not ( = ?auto_375892 ?auto_375896 ) ) ( not ( = ?auto_375892 ?auto_375897 ) ) ( not ( = ?auto_375892 ?auto_375898 ) ) ( not ( = ?auto_375892 ?auto_375899 ) ) ( not ( = ?auto_375892 ?auto_375900 ) ) ( not ( = ?auto_375892 ?auto_375901 ) ) ( not ( = ?auto_375893 ?auto_375894 ) ) ( not ( = ?auto_375893 ?auto_375895 ) ) ( not ( = ?auto_375893 ?auto_375896 ) ) ( not ( = ?auto_375893 ?auto_375897 ) ) ( not ( = ?auto_375893 ?auto_375898 ) ) ( not ( = ?auto_375893 ?auto_375899 ) ) ( not ( = ?auto_375893 ?auto_375900 ) ) ( not ( = ?auto_375893 ?auto_375901 ) ) ( not ( = ?auto_375894 ?auto_375895 ) ) ( not ( = ?auto_375894 ?auto_375896 ) ) ( not ( = ?auto_375894 ?auto_375897 ) ) ( not ( = ?auto_375894 ?auto_375898 ) ) ( not ( = ?auto_375894 ?auto_375899 ) ) ( not ( = ?auto_375894 ?auto_375900 ) ) ( not ( = ?auto_375894 ?auto_375901 ) ) ( not ( = ?auto_375895 ?auto_375896 ) ) ( not ( = ?auto_375895 ?auto_375897 ) ) ( not ( = ?auto_375895 ?auto_375898 ) ) ( not ( = ?auto_375895 ?auto_375899 ) ) ( not ( = ?auto_375895 ?auto_375900 ) ) ( not ( = ?auto_375895 ?auto_375901 ) ) ( not ( = ?auto_375896 ?auto_375897 ) ) ( not ( = ?auto_375896 ?auto_375898 ) ) ( not ( = ?auto_375896 ?auto_375899 ) ) ( not ( = ?auto_375896 ?auto_375900 ) ) ( not ( = ?auto_375896 ?auto_375901 ) ) ( not ( = ?auto_375897 ?auto_375898 ) ) ( not ( = ?auto_375897 ?auto_375899 ) ) ( not ( = ?auto_375897 ?auto_375900 ) ) ( not ( = ?auto_375897 ?auto_375901 ) ) ( not ( = ?auto_375898 ?auto_375899 ) ) ( not ( = ?auto_375898 ?auto_375900 ) ) ( not ( = ?auto_375898 ?auto_375901 ) ) ( not ( = ?auto_375899 ?auto_375900 ) ) ( not ( = ?auto_375899 ?auto_375901 ) ) ( not ( = ?auto_375900 ?auto_375901 ) ) ( ON ?auto_375899 ?auto_375900 ) ( ON ?auto_375898 ?auto_375899 ) ( ON ?auto_375897 ?auto_375898 ) ( ON ?auto_375896 ?auto_375897 ) ( ON ?auto_375895 ?auto_375896 ) ( ON ?auto_375894 ?auto_375895 ) ( ON ?auto_375893 ?auto_375894 ) ( ON ?auto_375892 ?auto_375893 ) ( CLEAR ?auto_375890 ) ( ON ?auto_375891 ?auto_375892 ) ( CLEAR ?auto_375891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_375886 ?auto_375887 ?auto_375888 ?auto_375889 ?auto_375890 ?auto_375891 )
      ( MAKE-15PILE ?auto_375886 ?auto_375887 ?auto_375888 ?auto_375889 ?auto_375890 ?auto_375891 ?auto_375892 ?auto_375893 ?auto_375894 ?auto_375895 ?auto_375896 ?auto_375897 ?auto_375898 ?auto_375899 ?auto_375900 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375917 - BLOCK
      ?auto_375918 - BLOCK
      ?auto_375919 - BLOCK
      ?auto_375920 - BLOCK
      ?auto_375921 - BLOCK
      ?auto_375922 - BLOCK
      ?auto_375923 - BLOCK
      ?auto_375924 - BLOCK
      ?auto_375925 - BLOCK
      ?auto_375926 - BLOCK
      ?auto_375927 - BLOCK
      ?auto_375928 - BLOCK
      ?auto_375929 - BLOCK
      ?auto_375930 - BLOCK
      ?auto_375931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375931 ) ( ON-TABLE ?auto_375917 ) ( ON ?auto_375918 ?auto_375917 ) ( ON ?auto_375919 ?auto_375918 ) ( ON ?auto_375920 ?auto_375919 ) ( ON ?auto_375921 ?auto_375920 ) ( not ( = ?auto_375917 ?auto_375918 ) ) ( not ( = ?auto_375917 ?auto_375919 ) ) ( not ( = ?auto_375917 ?auto_375920 ) ) ( not ( = ?auto_375917 ?auto_375921 ) ) ( not ( = ?auto_375917 ?auto_375922 ) ) ( not ( = ?auto_375917 ?auto_375923 ) ) ( not ( = ?auto_375917 ?auto_375924 ) ) ( not ( = ?auto_375917 ?auto_375925 ) ) ( not ( = ?auto_375917 ?auto_375926 ) ) ( not ( = ?auto_375917 ?auto_375927 ) ) ( not ( = ?auto_375917 ?auto_375928 ) ) ( not ( = ?auto_375917 ?auto_375929 ) ) ( not ( = ?auto_375917 ?auto_375930 ) ) ( not ( = ?auto_375917 ?auto_375931 ) ) ( not ( = ?auto_375918 ?auto_375919 ) ) ( not ( = ?auto_375918 ?auto_375920 ) ) ( not ( = ?auto_375918 ?auto_375921 ) ) ( not ( = ?auto_375918 ?auto_375922 ) ) ( not ( = ?auto_375918 ?auto_375923 ) ) ( not ( = ?auto_375918 ?auto_375924 ) ) ( not ( = ?auto_375918 ?auto_375925 ) ) ( not ( = ?auto_375918 ?auto_375926 ) ) ( not ( = ?auto_375918 ?auto_375927 ) ) ( not ( = ?auto_375918 ?auto_375928 ) ) ( not ( = ?auto_375918 ?auto_375929 ) ) ( not ( = ?auto_375918 ?auto_375930 ) ) ( not ( = ?auto_375918 ?auto_375931 ) ) ( not ( = ?auto_375919 ?auto_375920 ) ) ( not ( = ?auto_375919 ?auto_375921 ) ) ( not ( = ?auto_375919 ?auto_375922 ) ) ( not ( = ?auto_375919 ?auto_375923 ) ) ( not ( = ?auto_375919 ?auto_375924 ) ) ( not ( = ?auto_375919 ?auto_375925 ) ) ( not ( = ?auto_375919 ?auto_375926 ) ) ( not ( = ?auto_375919 ?auto_375927 ) ) ( not ( = ?auto_375919 ?auto_375928 ) ) ( not ( = ?auto_375919 ?auto_375929 ) ) ( not ( = ?auto_375919 ?auto_375930 ) ) ( not ( = ?auto_375919 ?auto_375931 ) ) ( not ( = ?auto_375920 ?auto_375921 ) ) ( not ( = ?auto_375920 ?auto_375922 ) ) ( not ( = ?auto_375920 ?auto_375923 ) ) ( not ( = ?auto_375920 ?auto_375924 ) ) ( not ( = ?auto_375920 ?auto_375925 ) ) ( not ( = ?auto_375920 ?auto_375926 ) ) ( not ( = ?auto_375920 ?auto_375927 ) ) ( not ( = ?auto_375920 ?auto_375928 ) ) ( not ( = ?auto_375920 ?auto_375929 ) ) ( not ( = ?auto_375920 ?auto_375930 ) ) ( not ( = ?auto_375920 ?auto_375931 ) ) ( not ( = ?auto_375921 ?auto_375922 ) ) ( not ( = ?auto_375921 ?auto_375923 ) ) ( not ( = ?auto_375921 ?auto_375924 ) ) ( not ( = ?auto_375921 ?auto_375925 ) ) ( not ( = ?auto_375921 ?auto_375926 ) ) ( not ( = ?auto_375921 ?auto_375927 ) ) ( not ( = ?auto_375921 ?auto_375928 ) ) ( not ( = ?auto_375921 ?auto_375929 ) ) ( not ( = ?auto_375921 ?auto_375930 ) ) ( not ( = ?auto_375921 ?auto_375931 ) ) ( not ( = ?auto_375922 ?auto_375923 ) ) ( not ( = ?auto_375922 ?auto_375924 ) ) ( not ( = ?auto_375922 ?auto_375925 ) ) ( not ( = ?auto_375922 ?auto_375926 ) ) ( not ( = ?auto_375922 ?auto_375927 ) ) ( not ( = ?auto_375922 ?auto_375928 ) ) ( not ( = ?auto_375922 ?auto_375929 ) ) ( not ( = ?auto_375922 ?auto_375930 ) ) ( not ( = ?auto_375922 ?auto_375931 ) ) ( not ( = ?auto_375923 ?auto_375924 ) ) ( not ( = ?auto_375923 ?auto_375925 ) ) ( not ( = ?auto_375923 ?auto_375926 ) ) ( not ( = ?auto_375923 ?auto_375927 ) ) ( not ( = ?auto_375923 ?auto_375928 ) ) ( not ( = ?auto_375923 ?auto_375929 ) ) ( not ( = ?auto_375923 ?auto_375930 ) ) ( not ( = ?auto_375923 ?auto_375931 ) ) ( not ( = ?auto_375924 ?auto_375925 ) ) ( not ( = ?auto_375924 ?auto_375926 ) ) ( not ( = ?auto_375924 ?auto_375927 ) ) ( not ( = ?auto_375924 ?auto_375928 ) ) ( not ( = ?auto_375924 ?auto_375929 ) ) ( not ( = ?auto_375924 ?auto_375930 ) ) ( not ( = ?auto_375924 ?auto_375931 ) ) ( not ( = ?auto_375925 ?auto_375926 ) ) ( not ( = ?auto_375925 ?auto_375927 ) ) ( not ( = ?auto_375925 ?auto_375928 ) ) ( not ( = ?auto_375925 ?auto_375929 ) ) ( not ( = ?auto_375925 ?auto_375930 ) ) ( not ( = ?auto_375925 ?auto_375931 ) ) ( not ( = ?auto_375926 ?auto_375927 ) ) ( not ( = ?auto_375926 ?auto_375928 ) ) ( not ( = ?auto_375926 ?auto_375929 ) ) ( not ( = ?auto_375926 ?auto_375930 ) ) ( not ( = ?auto_375926 ?auto_375931 ) ) ( not ( = ?auto_375927 ?auto_375928 ) ) ( not ( = ?auto_375927 ?auto_375929 ) ) ( not ( = ?auto_375927 ?auto_375930 ) ) ( not ( = ?auto_375927 ?auto_375931 ) ) ( not ( = ?auto_375928 ?auto_375929 ) ) ( not ( = ?auto_375928 ?auto_375930 ) ) ( not ( = ?auto_375928 ?auto_375931 ) ) ( not ( = ?auto_375929 ?auto_375930 ) ) ( not ( = ?auto_375929 ?auto_375931 ) ) ( not ( = ?auto_375930 ?auto_375931 ) ) ( ON ?auto_375930 ?auto_375931 ) ( ON ?auto_375929 ?auto_375930 ) ( ON ?auto_375928 ?auto_375929 ) ( ON ?auto_375927 ?auto_375928 ) ( ON ?auto_375926 ?auto_375927 ) ( ON ?auto_375925 ?auto_375926 ) ( ON ?auto_375924 ?auto_375925 ) ( ON ?auto_375923 ?auto_375924 ) ( CLEAR ?auto_375921 ) ( ON ?auto_375922 ?auto_375923 ) ( CLEAR ?auto_375922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_375917 ?auto_375918 ?auto_375919 ?auto_375920 ?auto_375921 ?auto_375922 )
      ( MAKE-15PILE ?auto_375917 ?auto_375918 ?auto_375919 ?auto_375920 ?auto_375921 ?auto_375922 ?auto_375923 ?auto_375924 ?auto_375925 ?auto_375926 ?auto_375927 ?auto_375928 ?auto_375929 ?auto_375930 ?auto_375931 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375947 - BLOCK
      ?auto_375948 - BLOCK
      ?auto_375949 - BLOCK
      ?auto_375950 - BLOCK
      ?auto_375951 - BLOCK
      ?auto_375952 - BLOCK
      ?auto_375953 - BLOCK
      ?auto_375954 - BLOCK
      ?auto_375955 - BLOCK
      ?auto_375956 - BLOCK
      ?auto_375957 - BLOCK
      ?auto_375958 - BLOCK
      ?auto_375959 - BLOCK
      ?auto_375960 - BLOCK
      ?auto_375961 - BLOCK
    )
    :vars
    (
      ?auto_375962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_375961 ?auto_375962 ) ( ON-TABLE ?auto_375947 ) ( ON ?auto_375948 ?auto_375947 ) ( ON ?auto_375949 ?auto_375948 ) ( ON ?auto_375950 ?auto_375949 ) ( not ( = ?auto_375947 ?auto_375948 ) ) ( not ( = ?auto_375947 ?auto_375949 ) ) ( not ( = ?auto_375947 ?auto_375950 ) ) ( not ( = ?auto_375947 ?auto_375951 ) ) ( not ( = ?auto_375947 ?auto_375952 ) ) ( not ( = ?auto_375947 ?auto_375953 ) ) ( not ( = ?auto_375947 ?auto_375954 ) ) ( not ( = ?auto_375947 ?auto_375955 ) ) ( not ( = ?auto_375947 ?auto_375956 ) ) ( not ( = ?auto_375947 ?auto_375957 ) ) ( not ( = ?auto_375947 ?auto_375958 ) ) ( not ( = ?auto_375947 ?auto_375959 ) ) ( not ( = ?auto_375947 ?auto_375960 ) ) ( not ( = ?auto_375947 ?auto_375961 ) ) ( not ( = ?auto_375947 ?auto_375962 ) ) ( not ( = ?auto_375948 ?auto_375949 ) ) ( not ( = ?auto_375948 ?auto_375950 ) ) ( not ( = ?auto_375948 ?auto_375951 ) ) ( not ( = ?auto_375948 ?auto_375952 ) ) ( not ( = ?auto_375948 ?auto_375953 ) ) ( not ( = ?auto_375948 ?auto_375954 ) ) ( not ( = ?auto_375948 ?auto_375955 ) ) ( not ( = ?auto_375948 ?auto_375956 ) ) ( not ( = ?auto_375948 ?auto_375957 ) ) ( not ( = ?auto_375948 ?auto_375958 ) ) ( not ( = ?auto_375948 ?auto_375959 ) ) ( not ( = ?auto_375948 ?auto_375960 ) ) ( not ( = ?auto_375948 ?auto_375961 ) ) ( not ( = ?auto_375948 ?auto_375962 ) ) ( not ( = ?auto_375949 ?auto_375950 ) ) ( not ( = ?auto_375949 ?auto_375951 ) ) ( not ( = ?auto_375949 ?auto_375952 ) ) ( not ( = ?auto_375949 ?auto_375953 ) ) ( not ( = ?auto_375949 ?auto_375954 ) ) ( not ( = ?auto_375949 ?auto_375955 ) ) ( not ( = ?auto_375949 ?auto_375956 ) ) ( not ( = ?auto_375949 ?auto_375957 ) ) ( not ( = ?auto_375949 ?auto_375958 ) ) ( not ( = ?auto_375949 ?auto_375959 ) ) ( not ( = ?auto_375949 ?auto_375960 ) ) ( not ( = ?auto_375949 ?auto_375961 ) ) ( not ( = ?auto_375949 ?auto_375962 ) ) ( not ( = ?auto_375950 ?auto_375951 ) ) ( not ( = ?auto_375950 ?auto_375952 ) ) ( not ( = ?auto_375950 ?auto_375953 ) ) ( not ( = ?auto_375950 ?auto_375954 ) ) ( not ( = ?auto_375950 ?auto_375955 ) ) ( not ( = ?auto_375950 ?auto_375956 ) ) ( not ( = ?auto_375950 ?auto_375957 ) ) ( not ( = ?auto_375950 ?auto_375958 ) ) ( not ( = ?auto_375950 ?auto_375959 ) ) ( not ( = ?auto_375950 ?auto_375960 ) ) ( not ( = ?auto_375950 ?auto_375961 ) ) ( not ( = ?auto_375950 ?auto_375962 ) ) ( not ( = ?auto_375951 ?auto_375952 ) ) ( not ( = ?auto_375951 ?auto_375953 ) ) ( not ( = ?auto_375951 ?auto_375954 ) ) ( not ( = ?auto_375951 ?auto_375955 ) ) ( not ( = ?auto_375951 ?auto_375956 ) ) ( not ( = ?auto_375951 ?auto_375957 ) ) ( not ( = ?auto_375951 ?auto_375958 ) ) ( not ( = ?auto_375951 ?auto_375959 ) ) ( not ( = ?auto_375951 ?auto_375960 ) ) ( not ( = ?auto_375951 ?auto_375961 ) ) ( not ( = ?auto_375951 ?auto_375962 ) ) ( not ( = ?auto_375952 ?auto_375953 ) ) ( not ( = ?auto_375952 ?auto_375954 ) ) ( not ( = ?auto_375952 ?auto_375955 ) ) ( not ( = ?auto_375952 ?auto_375956 ) ) ( not ( = ?auto_375952 ?auto_375957 ) ) ( not ( = ?auto_375952 ?auto_375958 ) ) ( not ( = ?auto_375952 ?auto_375959 ) ) ( not ( = ?auto_375952 ?auto_375960 ) ) ( not ( = ?auto_375952 ?auto_375961 ) ) ( not ( = ?auto_375952 ?auto_375962 ) ) ( not ( = ?auto_375953 ?auto_375954 ) ) ( not ( = ?auto_375953 ?auto_375955 ) ) ( not ( = ?auto_375953 ?auto_375956 ) ) ( not ( = ?auto_375953 ?auto_375957 ) ) ( not ( = ?auto_375953 ?auto_375958 ) ) ( not ( = ?auto_375953 ?auto_375959 ) ) ( not ( = ?auto_375953 ?auto_375960 ) ) ( not ( = ?auto_375953 ?auto_375961 ) ) ( not ( = ?auto_375953 ?auto_375962 ) ) ( not ( = ?auto_375954 ?auto_375955 ) ) ( not ( = ?auto_375954 ?auto_375956 ) ) ( not ( = ?auto_375954 ?auto_375957 ) ) ( not ( = ?auto_375954 ?auto_375958 ) ) ( not ( = ?auto_375954 ?auto_375959 ) ) ( not ( = ?auto_375954 ?auto_375960 ) ) ( not ( = ?auto_375954 ?auto_375961 ) ) ( not ( = ?auto_375954 ?auto_375962 ) ) ( not ( = ?auto_375955 ?auto_375956 ) ) ( not ( = ?auto_375955 ?auto_375957 ) ) ( not ( = ?auto_375955 ?auto_375958 ) ) ( not ( = ?auto_375955 ?auto_375959 ) ) ( not ( = ?auto_375955 ?auto_375960 ) ) ( not ( = ?auto_375955 ?auto_375961 ) ) ( not ( = ?auto_375955 ?auto_375962 ) ) ( not ( = ?auto_375956 ?auto_375957 ) ) ( not ( = ?auto_375956 ?auto_375958 ) ) ( not ( = ?auto_375956 ?auto_375959 ) ) ( not ( = ?auto_375956 ?auto_375960 ) ) ( not ( = ?auto_375956 ?auto_375961 ) ) ( not ( = ?auto_375956 ?auto_375962 ) ) ( not ( = ?auto_375957 ?auto_375958 ) ) ( not ( = ?auto_375957 ?auto_375959 ) ) ( not ( = ?auto_375957 ?auto_375960 ) ) ( not ( = ?auto_375957 ?auto_375961 ) ) ( not ( = ?auto_375957 ?auto_375962 ) ) ( not ( = ?auto_375958 ?auto_375959 ) ) ( not ( = ?auto_375958 ?auto_375960 ) ) ( not ( = ?auto_375958 ?auto_375961 ) ) ( not ( = ?auto_375958 ?auto_375962 ) ) ( not ( = ?auto_375959 ?auto_375960 ) ) ( not ( = ?auto_375959 ?auto_375961 ) ) ( not ( = ?auto_375959 ?auto_375962 ) ) ( not ( = ?auto_375960 ?auto_375961 ) ) ( not ( = ?auto_375960 ?auto_375962 ) ) ( not ( = ?auto_375961 ?auto_375962 ) ) ( ON ?auto_375960 ?auto_375961 ) ( ON ?auto_375959 ?auto_375960 ) ( ON ?auto_375958 ?auto_375959 ) ( ON ?auto_375957 ?auto_375958 ) ( ON ?auto_375956 ?auto_375957 ) ( ON ?auto_375955 ?auto_375956 ) ( ON ?auto_375954 ?auto_375955 ) ( ON ?auto_375953 ?auto_375954 ) ( ON ?auto_375952 ?auto_375953 ) ( CLEAR ?auto_375950 ) ( ON ?auto_375951 ?auto_375952 ) ( CLEAR ?auto_375951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_375947 ?auto_375948 ?auto_375949 ?auto_375950 ?auto_375951 )
      ( MAKE-15PILE ?auto_375947 ?auto_375948 ?auto_375949 ?auto_375950 ?auto_375951 ?auto_375952 ?auto_375953 ?auto_375954 ?auto_375955 ?auto_375956 ?auto_375957 ?auto_375958 ?auto_375959 ?auto_375960 ?auto_375961 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_375978 - BLOCK
      ?auto_375979 - BLOCK
      ?auto_375980 - BLOCK
      ?auto_375981 - BLOCK
      ?auto_375982 - BLOCK
      ?auto_375983 - BLOCK
      ?auto_375984 - BLOCK
      ?auto_375985 - BLOCK
      ?auto_375986 - BLOCK
      ?auto_375987 - BLOCK
      ?auto_375988 - BLOCK
      ?auto_375989 - BLOCK
      ?auto_375990 - BLOCK
      ?auto_375991 - BLOCK
      ?auto_375992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_375992 ) ( ON-TABLE ?auto_375978 ) ( ON ?auto_375979 ?auto_375978 ) ( ON ?auto_375980 ?auto_375979 ) ( ON ?auto_375981 ?auto_375980 ) ( not ( = ?auto_375978 ?auto_375979 ) ) ( not ( = ?auto_375978 ?auto_375980 ) ) ( not ( = ?auto_375978 ?auto_375981 ) ) ( not ( = ?auto_375978 ?auto_375982 ) ) ( not ( = ?auto_375978 ?auto_375983 ) ) ( not ( = ?auto_375978 ?auto_375984 ) ) ( not ( = ?auto_375978 ?auto_375985 ) ) ( not ( = ?auto_375978 ?auto_375986 ) ) ( not ( = ?auto_375978 ?auto_375987 ) ) ( not ( = ?auto_375978 ?auto_375988 ) ) ( not ( = ?auto_375978 ?auto_375989 ) ) ( not ( = ?auto_375978 ?auto_375990 ) ) ( not ( = ?auto_375978 ?auto_375991 ) ) ( not ( = ?auto_375978 ?auto_375992 ) ) ( not ( = ?auto_375979 ?auto_375980 ) ) ( not ( = ?auto_375979 ?auto_375981 ) ) ( not ( = ?auto_375979 ?auto_375982 ) ) ( not ( = ?auto_375979 ?auto_375983 ) ) ( not ( = ?auto_375979 ?auto_375984 ) ) ( not ( = ?auto_375979 ?auto_375985 ) ) ( not ( = ?auto_375979 ?auto_375986 ) ) ( not ( = ?auto_375979 ?auto_375987 ) ) ( not ( = ?auto_375979 ?auto_375988 ) ) ( not ( = ?auto_375979 ?auto_375989 ) ) ( not ( = ?auto_375979 ?auto_375990 ) ) ( not ( = ?auto_375979 ?auto_375991 ) ) ( not ( = ?auto_375979 ?auto_375992 ) ) ( not ( = ?auto_375980 ?auto_375981 ) ) ( not ( = ?auto_375980 ?auto_375982 ) ) ( not ( = ?auto_375980 ?auto_375983 ) ) ( not ( = ?auto_375980 ?auto_375984 ) ) ( not ( = ?auto_375980 ?auto_375985 ) ) ( not ( = ?auto_375980 ?auto_375986 ) ) ( not ( = ?auto_375980 ?auto_375987 ) ) ( not ( = ?auto_375980 ?auto_375988 ) ) ( not ( = ?auto_375980 ?auto_375989 ) ) ( not ( = ?auto_375980 ?auto_375990 ) ) ( not ( = ?auto_375980 ?auto_375991 ) ) ( not ( = ?auto_375980 ?auto_375992 ) ) ( not ( = ?auto_375981 ?auto_375982 ) ) ( not ( = ?auto_375981 ?auto_375983 ) ) ( not ( = ?auto_375981 ?auto_375984 ) ) ( not ( = ?auto_375981 ?auto_375985 ) ) ( not ( = ?auto_375981 ?auto_375986 ) ) ( not ( = ?auto_375981 ?auto_375987 ) ) ( not ( = ?auto_375981 ?auto_375988 ) ) ( not ( = ?auto_375981 ?auto_375989 ) ) ( not ( = ?auto_375981 ?auto_375990 ) ) ( not ( = ?auto_375981 ?auto_375991 ) ) ( not ( = ?auto_375981 ?auto_375992 ) ) ( not ( = ?auto_375982 ?auto_375983 ) ) ( not ( = ?auto_375982 ?auto_375984 ) ) ( not ( = ?auto_375982 ?auto_375985 ) ) ( not ( = ?auto_375982 ?auto_375986 ) ) ( not ( = ?auto_375982 ?auto_375987 ) ) ( not ( = ?auto_375982 ?auto_375988 ) ) ( not ( = ?auto_375982 ?auto_375989 ) ) ( not ( = ?auto_375982 ?auto_375990 ) ) ( not ( = ?auto_375982 ?auto_375991 ) ) ( not ( = ?auto_375982 ?auto_375992 ) ) ( not ( = ?auto_375983 ?auto_375984 ) ) ( not ( = ?auto_375983 ?auto_375985 ) ) ( not ( = ?auto_375983 ?auto_375986 ) ) ( not ( = ?auto_375983 ?auto_375987 ) ) ( not ( = ?auto_375983 ?auto_375988 ) ) ( not ( = ?auto_375983 ?auto_375989 ) ) ( not ( = ?auto_375983 ?auto_375990 ) ) ( not ( = ?auto_375983 ?auto_375991 ) ) ( not ( = ?auto_375983 ?auto_375992 ) ) ( not ( = ?auto_375984 ?auto_375985 ) ) ( not ( = ?auto_375984 ?auto_375986 ) ) ( not ( = ?auto_375984 ?auto_375987 ) ) ( not ( = ?auto_375984 ?auto_375988 ) ) ( not ( = ?auto_375984 ?auto_375989 ) ) ( not ( = ?auto_375984 ?auto_375990 ) ) ( not ( = ?auto_375984 ?auto_375991 ) ) ( not ( = ?auto_375984 ?auto_375992 ) ) ( not ( = ?auto_375985 ?auto_375986 ) ) ( not ( = ?auto_375985 ?auto_375987 ) ) ( not ( = ?auto_375985 ?auto_375988 ) ) ( not ( = ?auto_375985 ?auto_375989 ) ) ( not ( = ?auto_375985 ?auto_375990 ) ) ( not ( = ?auto_375985 ?auto_375991 ) ) ( not ( = ?auto_375985 ?auto_375992 ) ) ( not ( = ?auto_375986 ?auto_375987 ) ) ( not ( = ?auto_375986 ?auto_375988 ) ) ( not ( = ?auto_375986 ?auto_375989 ) ) ( not ( = ?auto_375986 ?auto_375990 ) ) ( not ( = ?auto_375986 ?auto_375991 ) ) ( not ( = ?auto_375986 ?auto_375992 ) ) ( not ( = ?auto_375987 ?auto_375988 ) ) ( not ( = ?auto_375987 ?auto_375989 ) ) ( not ( = ?auto_375987 ?auto_375990 ) ) ( not ( = ?auto_375987 ?auto_375991 ) ) ( not ( = ?auto_375987 ?auto_375992 ) ) ( not ( = ?auto_375988 ?auto_375989 ) ) ( not ( = ?auto_375988 ?auto_375990 ) ) ( not ( = ?auto_375988 ?auto_375991 ) ) ( not ( = ?auto_375988 ?auto_375992 ) ) ( not ( = ?auto_375989 ?auto_375990 ) ) ( not ( = ?auto_375989 ?auto_375991 ) ) ( not ( = ?auto_375989 ?auto_375992 ) ) ( not ( = ?auto_375990 ?auto_375991 ) ) ( not ( = ?auto_375990 ?auto_375992 ) ) ( not ( = ?auto_375991 ?auto_375992 ) ) ( ON ?auto_375991 ?auto_375992 ) ( ON ?auto_375990 ?auto_375991 ) ( ON ?auto_375989 ?auto_375990 ) ( ON ?auto_375988 ?auto_375989 ) ( ON ?auto_375987 ?auto_375988 ) ( ON ?auto_375986 ?auto_375987 ) ( ON ?auto_375985 ?auto_375986 ) ( ON ?auto_375984 ?auto_375985 ) ( ON ?auto_375983 ?auto_375984 ) ( CLEAR ?auto_375981 ) ( ON ?auto_375982 ?auto_375983 ) ( CLEAR ?auto_375982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_375978 ?auto_375979 ?auto_375980 ?auto_375981 ?auto_375982 )
      ( MAKE-15PILE ?auto_375978 ?auto_375979 ?auto_375980 ?auto_375981 ?auto_375982 ?auto_375983 ?auto_375984 ?auto_375985 ?auto_375986 ?auto_375987 ?auto_375988 ?auto_375989 ?auto_375990 ?auto_375991 ?auto_375992 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376008 - BLOCK
      ?auto_376009 - BLOCK
      ?auto_376010 - BLOCK
      ?auto_376011 - BLOCK
      ?auto_376012 - BLOCK
      ?auto_376013 - BLOCK
      ?auto_376014 - BLOCK
      ?auto_376015 - BLOCK
      ?auto_376016 - BLOCK
      ?auto_376017 - BLOCK
      ?auto_376018 - BLOCK
      ?auto_376019 - BLOCK
      ?auto_376020 - BLOCK
      ?auto_376021 - BLOCK
      ?auto_376022 - BLOCK
    )
    :vars
    (
      ?auto_376023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376022 ?auto_376023 ) ( ON-TABLE ?auto_376008 ) ( ON ?auto_376009 ?auto_376008 ) ( ON ?auto_376010 ?auto_376009 ) ( not ( = ?auto_376008 ?auto_376009 ) ) ( not ( = ?auto_376008 ?auto_376010 ) ) ( not ( = ?auto_376008 ?auto_376011 ) ) ( not ( = ?auto_376008 ?auto_376012 ) ) ( not ( = ?auto_376008 ?auto_376013 ) ) ( not ( = ?auto_376008 ?auto_376014 ) ) ( not ( = ?auto_376008 ?auto_376015 ) ) ( not ( = ?auto_376008 ?auto_376016 ) ) ( not ( = ?auto_376008 ?auto_376017 ) ) ( not ( = ?auto_376008 ?auto_376018 ) ) ( not ( = ?auto_376008 ?auto_376019 ) ) ( not ( = ?auto_376008 ?auto_376020 ) ) ( not ( = ?auto_376008 ?auto_376021 ) ) ( not ( = ?auto_376008 ?auto_376022 ) ) ( not ( = ?auto_376008 ?auto_376023 ) ) ( not ( = ?auto_376009 ?auto_376010 ) ) ( not ( = ?auto_376009 ?auto_376011 ) ) ( not ( = ?auto_376009 ?auto_376012 ) ) ( not ( = ?auto_376009 ?auto_376013 ) ) ( not ( = ?auto_376009 ?auto_376014 ) ) ( not ( = ?auto_376009 ?auto_376015 ) ) ( not ( = ?auto_376009 ?auto_376016 ) ) ( not ( = ?auto_376009 ?auto_376017 ) ) ( not ( = ?auto_376009 ?auto_376018 ) ) ( not ( = ?auto_376009 ?auto_376019 ) ) ( not ( = ?auto_376009 ?auto_376020 ) ) ( not ( = ?auto_376009 ?auto_376021 ) ) ( not ( = ?auto_376009 ?auto_376022 ) ) ( not ( = ?auto_376009 ?auto_376023 ) ) ( not ( = ?auto_376010 ?auto_376011 ) ) ( not ( = ?auto_376010 ?auto_376012 ) ) ( not ( = ?auto_376010 ?auto_376013 ) ) ( not ( = ?auto_376010 ?auto_376014 ) ) ( not ( = ?auto_376010 ?auto_376015 ) ) ( not ( = ?auto_376010 ?auto_376016 ) ) ( not ( = ?auto_376010 ?auto_376017 ) ) ( not ( = ?auto_376010 ?auto_376018 ) ) ( not ( = ?auto_376010 ?auto_376019 ) ) ( not ( = ?auto_376010 ?auto_376020 ) ) ( not ( = ?auto_376010 ?auto_376021 ) ) ( not ( = ?auto_376010 ?auto_376022 ) ) ( not ( = ?auto_376010 ?auto_376023 ) ) ( not ( = ?auto_376011 ?auto_376012 ) ) ( not ( = ?auto_376011 ?auto_376013 ) ) ( not ( = ?auto_376011 ?auto_376014 ) ) ( not ( = ?auto_376011 ?auto_376015 ) ) ( not ( = ?auto_376011 ?auto_376016 ) ) ( not ( = ?auto_376011 ?auto_376017 ) ) ( not ( = ?auto_376011 ?auto_376018 ) ) ( not ( = ?auto_376011 ?auto_376019 ) ) ( not ( = ?auto_376011 ?auto_376020 ) ) ( not ( = ?auto_376011 ?auto_376021 ) ) ( not ( = ?auto_376011 ?auto_376022 ) ) ( not ( = ?auto_376011 ?auto_376023 ) ) ( not ( = ?auto_376012 ?auto_376013 ) ) ( not ( = ?auto_376012 ?auto_376014 ) ) ( not ( = ?auto_376012 ?auto_376015 ) ) ( not ( = ?auto_376012 ?auto_376016 ) ) ( not ( = ?auto_376012 ?auto_376017 ) ) ( not ( = ?auto_376012 ?auto_376018 ) ) ( not ( = ?auto_376012 ?auto_376019 ) ) ( not ( = ?auto_376012 ?auto_376020 ) ) ( not ( = ?auto_376012 ?auto_376021 ) ) ( not ( = ?auto_376012 ?auto_376022 ) ) ( not ( = ?auto_376012 ?auto_376023 ) ) ( not ( = ?auto_376013 ?auto_376014 ) ) ( not ( = ?auto_376013 ?auto_376015 ) ) ( not ( = ?auto_376013 ?auto_376016 ) ) ( not ( = ?auto_376013 ?auto_376017 ) ) ( not ( = ?auto_376013 ?auto_376018 ) ) ( not ( = ?auto_376013 ?auto_376019 ) ) ( not ( = ?auto_376013 ?auto_376020 ) ) ( not ( = ?auto_376013 ?auto_376021 ) ) ( not ( = ?auto_376013 ?auto_376022 ) ) ( not ( = ?auto_376013 ?auto_376023 ) ) ( not ( = ?auto_376014 ?auto_376015 ) ) ( not ( = ?auto_376014 ?auto_376016 ) ) ( not ( = ?auto_376014 ?auto_376017 ) ) ( not ( = ?auto_376014 ?auto_376018 ) ) ( not ( = ?auto_376014 ?auto_376019 ) ) ( not ( = ?auto_376014 ?auto_376020 ) ) ( not ( = ?auto_376014 ?auto_376021 ) ) ( not ( = ?auto_376014 ?auto_376022 ) ) ( not ( = ?auto_376014 ?auto_376023 ) ) ( not ( = ?auto_376015 ?auto_376016 ) ) ( not ( = ?auto_376015 ?auto_376017 ) ) ( not ( = ?auto_376015 ?auto_376018 ) ) ( not ( = ?auto_376015 ?auto_376019 ) ) ( not ( = ?auto_376015 ?auto_376020 ) ) ( not ( = ?auto_376015 ?auto_376021 ) ) ( not ( = ?auto_376015 ?auto_376022 ) ) ( not ( = ?auto_376015 ?auto_376023 ) ) ( not ( = ?auto_376016 ?auto_376017 ) ) ( not ( = ?auto_376016 ?auto_376018 ) ) ( not ( = ?auto_376016 ?auto_376019 ) ) ( not ( = ?auto_376016 ?auto_376020 ) ) ( not ( = ?auto_376016 ?auto_376021 ) ) ( not ( = ?auto_376016 ?auto_376022 ) ) ( not ( = ?auto_376016 ?auto_376023 ) ) ( not ( = ?auto_376017 ?auto_376018 ) ) ( not ( = ?auto_376017 ?auto_376019 ) ) ( not ( = ?auto_376017 ?auto_376020 ) ) ( not ( = ?auto_376017 ?auto_376021 ) ) ( not ( = ?auto_376017 ?auto_376022 ) ) ( not ( = ?auto_376017 ?auto_376023 ) ) ( not ( = ?auto_376018 ?auto_376019 ) ) ( not ( = ?auto_376018 ?auto_376020 ) ) ( not ( = ?auto_376018 ?auto_376021 ) ) ( not ( = ?auto_376018 ?auto_376022 ) ) ( not ( = ?auto_376018 ?auto_376023 ) ) ( not ( = ?auto_376019 ?auto_376020 ) ) ( not ( = ?auto_376019 ?auto_376021 ) ) ( not ( = ?auto_376019 ?auto_376022 ) ) ( not ( = ?auto_376019 ?auto_376023 ) ) ( not ( = ?auto_376020 ?auto_376021 ) ) ( not ( = ?auto_376020 ?auto_376022 ) ) ( not ( = ?auto_376020 ?auto_376023 ) ) ( not ( = ?auto_376021 ?auto_376022 ) ) ( not ( = ?auto_376021 ?auto_376023 ) ) ( not ( = ?auto_376022 ?auto_376023 ) ) ( ON ?auto_376021 ?auto_376022 ) ( ON ?auto_376020 ?auto_376021 ) ( ON ?auto_376019 ?auto_376020 ) ( ON ?auto_376018 ?auto_376019 ) ( ON ?auto_376017 ?auto_376018 ) ( ON ?auto_376016 ?auto_376017 ) ( ON ?auto_376015 ?auto_376016 ) ( ON ?auto_376014 ?auto_376015 ) ( ON ?auto_376013 ?auto_376014 ) ( ON ?auto_376012 ?auto_376013 ) ( CLEAR ?auto_376010 ) ( ON ?auto_376011 ?auto_376012 ) ( CLEAR ?auto_376011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_376008 ?auto_376009 ?auto_376010 ?auto_376011 )
      ( MAKE-15PILE ?auto_376008 ?auto_376009 ?auto_376010 ?auto_376011 ?auto_376012 ?auto_376013 ?auto_376014 ?auto_376015 ?auto_376016 ?auto_376017 ?auto_376018 ?auto_376019 ?auto_376020 ?auto_376021 ?auto_376022 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376039 - BLOCK
      ?auto_376040 - BLOCK
      ?auto_376041 - BLOCK
      ?auto_376042 - BLOCK
      ?auto_376043 - BLOCK
      ?auto_376044 - BLOCK
      ?auto_376045 - BLOCK
      ?auto_376046 - BLOCK
      ?auto_376047 - BLOCK
      ?auto_376048 - BLOCK
      ?auto_376049 - BLOCK
      ?auto_376050 - BLOCK
      ?auto_376051 - BLOCK
      ?auto_376052 - BLOCK
      ?auto_376053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_376053 ) ( ON-TABLE ?auto_376039 ) ( ON ?auto_376040 ?auto_376039 ) ( ON ?auto_376041 ?auto_376040 ) ( not ( = ?auto_376039 ?auto_376040 ) ) ( not ( = ?auto_376039 ?auto_376041 ) ) ( not ( = ?auto_376039 ?auto_376042 ) ) ( not ( = ?auto_376039 ?auto_376043 ) ) ( not ( = ?auto_376039 ?auto_376044 ) ) ( not ( = ?auto_376039 ?auto_376045 ) ) ( not ( = ?auto_376039 ?auto_376046 ) ) ( not ( = ?auto_376039 ?auto_376047 ) ) ( not ( = ?auto_376039 ?auto_376048 ) ) ( not ( = ?auto_376039 ?auto_376049 ) ) ( not ( = ?auto_376039 ?auto_376050 ) ) ( not ( = ?auto_376039 ?auto_376051 ) ) ( not ( = ?auto_376039 ?auto_376052 ) ) ( not ( = ?auto_376039 ?auto_376053 ) ) ( not ( = ?auto_376040 ?auto_376041 ) ) ( not ( = ?auto_376040 ?auto_376042 ) ) ( not ( = ?auto_376040 ?auto_376043 ) ) ( not ( = ?auto_376040 ?auto_376044 ) ) ( not ( = ?auto_376040 ?auto_376045 ) ) ( not ( = ?auto_376040 ?auto_376046 ) ) ( not ( = ?auto_376040 ?auto_376047 ) ) ( not ( = ?auto_376040 ?auto_376048 ) ) ( not ( = ?auto_376040 ?auto_376049 ) ) ( not ( = ?auto_376040 ?auto_376050 ) ) ( not ( = ?auto_376040 ?auto_376051 ) ) ( not ( = ?auto_376040 ?auto_376052 ) ) ( not ( = ?auto_376040 ?auto_376053 ) ) ( not ( = ?auto_376041 ?auto_376042 ) ) ( not ( = ?auto_376041 ?auto_376043 ) ) ( not ( = ?auto_376041 ?auto_376044 ) ) ( not ( = ?auto_376041 ?auto_376045 ) ) ( not ( = ?auto_376041 ?auto_376046 ) ) ( not ( = ?auto_376041 ?auto_376047 ) ) ( not ( = ?auto_376041 ?auto_376048 ) ) ( not ( = ?auto_376041 ?auto_376049 ) ) ( not ( = ?auto_376041 ?auto_376050 ) ) ( not ( = ?auto_376041 ?auto_376051 ) ) ( not ( = ?auto_376041 ?auto_376052 ) ) ( not ( = ?auto_376041 ?auto_376053 ) ) ( not ( = ?auto_376042 ?auto_376043 ) ) ( not ( = ?auto_376042 ?auto_376044 ) ) ( not ( = ?auto_376042 ?auto_376045 ) ) ( not ( = ?auto_376042 ?auto_376046 ) ) ( not ( = ?auto_376042 ?auto_376047 ) ) ( not ( = ?auto_376042 ?auto_376048 ) ) ( not ( = ?auto_376042 ?auto_376049 ) ) ( not ( = ?auto_376042 ?auto_376050 ) ) ( not ( = ?auto_376042 ?auto_376051 ) ) ( not ( = ?auto_376042 ?auto_376052 ) ) ( not ( = ?auto_376042 ?auto_376053 ) ) ( not ( = ?auto_376043 ?auto_376044 ) ) ( not ( = ?auto_376043 ?auto_376045 ) ) ( not ( = ?auto_376043 ?auto_376046 ) ) ( not ( = ?auto_376043 ?auto_376047 ) ) ( not ( = ?auto_376043 ?auto_376048 ) ) ( not ( = ?auto_376043 ?auto_376049 ) ) ( not ( = ?auto_376043 ?auto_376050 ) ) ( not ( = ?auto_376043 ?auto_376051 ) ) ( not ( = ?auto_376043 ?auto_376052 ) ) ( not ( = ?auto_376043 ?auto_376053 ) ) ( not ( = ?auto_376044 ?auto_376045 ) ) ( not ( = ?auto_376044 ?auto_376046 ) ) ( not ( = ?auto_376044 ?auto_376047 ) ) ( not ( = ?auto_376044 ?auto_376048 ) ) ( not ( = ?auto_376044 ?auto_376049 ) ) ( not ( = ?auto_376044 ?auto_376050 ) ) ( not ( = ?auto_376044 ?auto_376051 ) ) ( not ( = ?auto_376044 ?auto_376052 ) ) ( not ( = ?auto_376044 ?auto_376053 ) ) ( not ( = ?auto_376045 ?auto_376046 ) ) ( not ( = ?auto_376045 ?auto_376047 ) ) ( not ( = ?auto_376045 ?auto_376048 ) ) ( not ( = ?auto_376045 ?auto_376049 ) ) ( not ( = ?auto_376045 ?auto_376050 ) ) ( not ( = ?auto_376045 ?auto_376051 ) ) ( not ( = ?auto_376045 ?auto_376052 ) ) ( not ( = ?auto_376045 ?auto_376053 ) ) ( not ( = ?auto_376046 ?auto_376047 ) ) ( not ( = ?auto_376046 ?auto_376048 ) ) ( not ( = ?auto_376046 ?auto_376049 ) ) ( not ( = ?auto_376046 ?auto_376050 ) ) ( not ( = ?auto_376046 ?auto_376051 ) ) ( not ( = ?auto_376046 ?auto_376052 ) ) ( not ( = ?auto_376046 ?auto_376053 ) ) ( not ( = ?auto_376047 ?auto_376048 ) ) ( not ( = ?auto_376047 ?auto_376049 ) ) ( not ( = ?auto_376047 ?auto_376050 ) ) ( not ( = ?auto_376047 ?auto_376051 ) ) ( not ( = ?auto_376047 ?auto_376052 ) ) ( not ( = ?auto_376047 ?auto_376053 ) ) ( not ( = ?auto_376048 ?auto_376049 ) ) ( not ( = ?auto_376048 ?auto_376050 ) ) ( not ( = ?auto_376048 ?auto_376051 ) ) ( not ( = ?auto_376048 ?auto_376052 ) ) ( not ( = ?auto_376048 ?auto_376053 ) ) ( not ( = ?auto_376049 ?auto_376050 ) ) ( not ( = ?auto_376049 ?auto_376051 ) ) ( not ( = ?auto_376049 ?auto_376052 ) ) ( not ( = ?auto_376049 ?auto_376053 ) ) ( not ( = ?auto_376050 ?auto_376051 ) ) ( not ( = ?auto_376050 ?auto_376052 ) ) ( not ( = ?auto_376050 ?auto_376053 ) ) ( not ( = ?auto_376051 ?auto_376052 ) ) ( not ( = ?auto_376051 ?auto_376053 ) ) ( not ( = ?auto_376052 ?auto_376053 ) ) ( ON ?auto_376052 ?auto_376053 ) ( ON ?auto_376051 ?auto_376052 ) ( ON ?auto_376050 ?auto_376051 ) ( ON ?auto_376049 ?auto_376050 ) ( ON ?auto_376048 ?auto_376049 ) ( ON ?auto_376047 ?auto_376048 ) ( ON ?auto_376046 ?auto_376047 ) ( ON ?auto_376045 ?auto_376046 ) ( ON ?auto_376044 ?auto_376045 ) ( ON ?auto_376043 ?auto_376044 ) ( CLEAR ?auto_376041 ) ( ON ?auto_376042 ?auto_376043 ) ( CLEAR ?auto_376042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_376039 ?auto_376040 ?auto_376041 ?auto_376042 )
      ( MAKE-15PILE ?auto_376039 ?auto_376040 ?auto_376041 ?auto_376042 ?auto_376043 ?auto_376044 ?auto_376045 ?auto_376046 ?auto_376047 ?auto_376048 ?auto_376049 ?auto_376050 ?auto_376051 ?auto_376052 ?auto_376053 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376069 - BLOCK
      ?auto_376070 - BLOCK
      ?auto_376071 - BLOCK
      ?auto_376072 - BLOCK
      ?auto_376073 - BLOCK
      ?auto_376074 - BLOCK
      ?auto_376075 - BLOCK
      ?auto_376076 - BLOCK
      ?auto_376077 - BLOCK
      ?auto_376078 - BLOCK
      ?auto_376079 - BLOCK
      ?auto_376080 - BLOCK
      ?auto_376081 - BLOCK
      ?auto_376082 - BLOCK
      ?auto_376083 - BLOCK
    )
    :vars
    (
      ?auto_376084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376083 ?auto_376084 ) ( ON-TABLE ?auto_376069 ) ( ON ?auto_376070 ?auto_376069 ) ( not ( = ?auto_376069 ?auto_376070 ) ) ( not ( = ?auto_376069 ?auto_376071 ) ) ( not ( = ?auto_376069 ?auto_376072 ) ) ( not ( = ?auto_376069 ?auto_376073 ) ) ( not ( = ?auto_376069 ?auto_376074 ) ) ( not ( = ?auto_376069 ?auto_376075 ) ) ( not ( = ?auto_376069 ?auto_376076 ) ) ( not ( = ?auto_376069 ?auto_376077 ) ) ( not ( = ?auto_376069 ?auto_376078 ) ) ( not ( = ?auto_376069 ?auto_376079 ) ) ( not ( = ?auto_376069 ?auto_376080 ) ) ( not ( = ?auto_376069 ?auto_376081 ) ) ( not ( = ?auto_376069 ?auto_376082 ) ) ( not ( = ?auto_376069 ?auto_376083 ) ) ( not ( = ?auto_376069 ?auto_376084 ) ) ( not ( = ?auto_376070 ?auto_376071 ) ) ( not ( = ?auto_376070 ?auto_376072 ) ) ( not ( = ?auto_376070 ?auto_376073 ) ) ( not ( = ?auto_376070 ?auto_376074 ) ) ( not ( = ?auto_376070 ?auto_376075 ) ) ( not ( = ?auto_376070 ?auto_376076 ) ) ( not ( = ?auto_376070 ?auto_376077 ) ) ( not ( = ?auto_376070 ?auto_376078 ) ) ( not ( = ?auto_376070 ?auto_376079 ) ) ( not ( = ?auto_376070 ?auto_376080 ) ) ( not ( = ?auto_376070 ?auto_376081 ) ) ( not ( = ?auto_376070 ?auto_376082 ) ) ( not ( = ?auto_376070 ?auto_376083 ) ) ( not ( = ?auto_376070 ?auto_376084 ) ) ( not ( = ?auto_376071 ?auto_376072 ) ) ( not ( = ?auto_376071 ?auto_376073 ) ) ( not ( = ?auto_376071 ?auto_376074 ) ) ( not ( = ?auto_376071 ?auto_376075 ) ) ( not ( = ?auto_376071 ?auto_376076 ) ) ( not ( = ?auto_376071 ?auto_376077 ) ) ( not ( = ?auto_376071 ?auto_376078 ) ) ( not ( = ?auto_376071 ?auto_376079 ) ) ( not ( = ?auto_376071 ?auto_376080 ) ) ( not ( = ?auto_376071 ?auto_376081 ) ) ( not ( = ?auto_376071 ?auto_376082 ) ) ( not ( = ?auto_376071 ?auto_376083 ) ) ( not ( = ?auto_376071 ?auto_376084 ) ) ( not ( = ?auto_376072 ?auto_376073 ) ) ( not ( = ?auto_376072 ?auto_376074 ) ) ( not ( = ?auto_376072 ?auto_376075 ) ) ( not ( = ?auto_376072 ?auto_376076 ) ) ( not ( = ?auto_376072 ?auto_376077 ) ) ( not ( = ?auto_376072 ?auto_376078 ) ) ( not ( = ?auto_376072 ?auto_376079 ) ) ( not ( = ?auto_376072 ?auto_376080 ) ) ( not ( = ?auto_376072 ?auto_376081 ) ) ( not ( = ?auto_376072 ?auto_376082 ) ) ( not ( = ?auto_376072 ?auto_376083 ) ) ( not ( = ?auto_376072 ?auto_376084 ) ) ( not ( = ?auto_376073 ?auto_376074 ) ) ( not ( = ?auto_376073 ?auto_376075 ) ) ( not ( = ?auto_376073 ?auto_376076 ) ) ( not ( = ?auto_376073 ?auto_376077 ) ) ( not ( = ?auto_376073 ?auto_376078 ) ) ( not ( = ?auto_376073 ?auto_376079 ) ) ( not ( = ?auto_376073 ?auto_376080 ) ) ( not ( = ?auto_376073 ?auto_376081 ) ) ( not ( = ?auto_376073 ?auto_376082 ) ) ( not ( = ?auto_376073 ?auto_376083 ) ) ( not ( = ?auto_376073 ?auto_376084 ) ) ( not ( = ?auto_376074 ?auto_376075 ) ) ( not ( = ?auto_376074 ?auto_376076 ) ) ( not ( = ?auto_376074 ?auto_376077 ) ) ( not ( = ?auto_376074 ?auto_376078 ) ) ( not ( = ?auto_376074 ?auto_376079 ) ) ( not ( = ?auto_376074 ?auto_376080 ) ) ( not ( = ?auto_376074 ?auto_376081 ) ) ( not ( = ?auto_376074 ?auto_376082 ) ) ( not ( = ?auto_376074 ?auto_376083 ) ) ( not ( = ?auto_376074 ?auto_376084 ) ) ( not ( = ?auto_376075 ?auto_376076 ) ) ( not ( = ?auto_376075 ?auto_376077 ) ) ( not ( = ?auto_376075 ?auto_376078 ) ) ( not ( = ?auto_376075 ?auto_376079 ) ) ( not ( = ?auto_376075 ?auto_376080 ) ) ( not ( = ?auto_376075 ?auto_376081 ) ) ( not ( = ?auto_376075 ?auto_376082 ) ) ( not ( = ?auto_376075 ?auto_376083 ) ) ( not ( = ?auto_376075 ?auto_376084 ) ) ( not ( = ?auto_376076 ?auto_376077 ) ) ( not ( = ?auto_376076 ?auto_376078 ) ) ( not ( = ?auto_376076 ?auto_376079 ) ) ( not ( = ?auto_376076 ?auto_376080 ) ) ( not ( = ?auto_376076 ?auto_376081 ) ) ( not ( = ?auto_376076 ?auto_376082 ) ) ( not ( = ?auto_376076 ?auto_376083 ) ) ( not ( = ?auto_376076 ?auto_376084 ) ) ( not ( = ?auto_376077 ?auto_376078 ) ) ( not ( = ?auto_376077 ?auto_376079 ) ) ( not ( = ?auto_376077 ?auto_376080 ) ) ( not ( = ?auto_376077 ?auto_376081 ) ) ( not ( = ?auto_376077 ?auto_376082 ) ) ( not ( = ?auto_376077 ?auto_376083 ) ) ( not ( = ?auto_376077 ?auto_376084 ) ) ( not ( = ?auto_376078 ?auto_376079 ) ) ( not ( = ?auto_376078 ?auto_376080 ) ) ( not ( = ?auto_376078 ?auto_376081 ) ) ( not ( = ?auto_376078 ?auto_376082 ) ) ( not ( = ?auto_376078 ?auto_376083 ) ) ( not ( = ?auto_376078 ?auto_376084 ) ) ( not ( = ?auto_376079 ?auto_376080 ) ) ( not ( = ?auto_376079 ?auto_376081 ) ) ( not ( = ?auto_376079 ?auto_376082 ) ) ( not ( = ?auto_376079 ?auto_376083 ) ) ( not ( = ?auto_376079 ?auto_376084 ) ) ( not ( = ?auto_376080 ?auto_376081 ) ) ( not ( = ?auto_376080 ?auto_376082 ) ) ( not ( = ?auto_376080 ?auto_376083 ) ) ( not ( = ?auto_376080 ?auto_376084 ) ) ( not ( = ?auto_376081 ?auto_376082 ) ) ( not ( = ?auto_376081 ?auto_376083 ) ) ( not ( = ?auto_376081 ?auto_376084 ) ) ( not ( = ?auto_376082 ?auto_376083 ) ) ( not ( = ?auto_376082 ?auto_376084 ) ) ( not ( = ?auto_376083 ?auto_376084 ) ) ( ON ?auto_376082 ?auto_376083 ) ( ON ?auto_376081 ?auto_376082 ) ( ON ?auto_376080 ?auto_376081 ) ( ON ?auto_376079 ?auto_376080 ) ( ON ?auto_376078 ?auto_376079 ) ( ON ?auto_376077 ?auto_376078 ) ( ON ?auto_376076 ?auto_376077 ) ( ON ?auto_376075 ?auto_376076 ) ( ON ?auto_376074 ?auto_376075 ) ( ON ?auto_376073 ?auto_376074 ) ( ON ?auto_376072 ?auto_376073 ) ( CLEAR ?auto_376070 ) ( ON ?auto_376071 ?auto_376072 ) ( CLEAR ?auto_376071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376069 ?auto_376070 ?auto_376071 )
      ( MAKE-15PILE ?auto_376069 ?auto_376070 ?auto_376071 ?auto_376072 ?auto_376073 ?auto_376074 ?auto_376075 ?auto_376076 ?auto_376077 ?auto_376078 ?auto_376079 ?auto_376080 ?auto_376081 ?auto_376082 ?auto_376083 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376100 - BLOCK
      ?auto_376101 - BLOCK
      ?auto_376102 - BLOCK
      ?auto_376103 - BLOCK
      ?auto_376104 - BLOCK
      ?auto_376105 - BLOCK
      ?auto_376106 - BLOCK
      ?auto_376107 - BLOCK
      ?auto_376108 - BLOCK
      ?auto_376109 - BLOCK
      ?auto_376110 - BLOCK
      ?auto_376111 - BLOCK
      ?auto_376112 - BLOCK
      ?auto_376113 - BLOCK
      ?auto_376114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_376114 ) ( ON-TABLE ?auto_376100 ) ( ON ?auto_376101 ?auto_376100 ) ( not ( = ?auto_376100 ?auto_376101 ) ) ( not ( = ?auto_376100 ?auto_376102 ) ) ( not ( = ?auto_376100 ?auto_376103 ) ) ( not ( = ?auto_376100 ?auto_376104 ) ) ( not ( = ?auto_376100 ?auto_376105 ) ) ( not ( = ?auto_376100 ?auto_376106 ) ) ( not ( = ?auto_376100 ?auto_376107 ) ) ( not ( = ?auto_376100 ?auto_376108 ) ) ( not ( = ?auto_376100 ?auto_376109 ) ) ( not ( = ?auto_376100 ?auto_376110 ) ) ( not ( = ?auto_376100 ?auto_376111 ) ) ( not ( = ?auto_376100 ?auto_376112 ) ) ( not ( = ?auto_376100 ?auto_376113 ) ) ( not ( = ?auto_376100 ?auto_376114 ) ) ( not ( = ?auto_376101 ?auto_376102 ) ) ( not ( = ?auto_376101 ?auto_376103 ) ) ( not ( = ?auto_376101 ?auto_376104 ) ) ( not ( = ?auto_376101 ?auto_376105 ) ) ( not ( = ?auto_376101 ?auto_376106 ) ) ( not ( = ?auto_376101 ?auto_376107 ) ) ( not ( = ?auto_376101 ?auto_376108 ) ) ( not ( = ?auto_376101 ?auto_376109 ) ) ( not ( = ?auto_376101 ?auto_376110 ) ) ( not ( = ?auto_376101 ?auto_376111 ) ) ( not ( = ?auto_376101 ?auto_376112 ) ) ( not ( = ?auto_376101 ?auto_376113 ) ) ( not ( = ?auto_376101 ?auto_376114 ) ) ( not ( = ?auto_376102 ?auto_376103 ) ) ( not ( = ?auto_376102 ?auto_376104 ) ) ( not ( = ?auto_376102 ?auto_376105 ) ) ( not ( = ?auto_376102 ?auto_376106 ) ) ( not ( = ?auto_376102 ?auto_376107 ) ) ( not ( = ?auto_376102 ?auto_376108 ) ) ( not ( = ?auto_376102 ?auto_376109 ) ) ( not ( = ?auto_376102 ?auto_376110 ) ) ( not ( = ?auto_376102 ?auto_376111 ) ) ( not ( = ?auto_376102 ?auto_376112 ) ) ( not ( = ?auto_376102 ?auto_376113 ) ) ( not ( = ?auto_376102 ?auto_376114 ) ) ( not ( = ?auto_376103 ?auto_376104 ) ) ( not ( = ?auto_376103 ?auto_376105 ) ) ( not ( = ?auto_376103 ?auto_376106 ) ) ( not ( = ?auto_376103 ?auto_376107 ) ) ( not ( = ?auto_376103 ?auto_376108 ) ) ( not ( = ?auto_376103 ?auto_376109 ) ) ( not ( = ?auto_376103 ?auto_376110 ) ) ( not ( = ?auto_376103 ?auto_376111 ) ) ( not ( = ?auto_376103 ?auto_376112 ) ) ( not ( = ?auto_376103 ?auto_376113 ) ) ( not ( = ?auto_376103 ?auto_376114 ) ) ( not ( = ?auto_376104 ?auto_376105 ) ) ( not ( = ?auto_376104 ?auto_376106 ) ) ( not ( = ?auto_376104 ?auto_376107 ) ) ( not ( = ?auto_376104 ?auto_376108 ) ) ( not ( = ?auto_376104 ?auto_376109 ) ) ( not ( = ?auto_376104 ?auto_376110 ) ) ( not ( = ?auto_376104 ?auto_376111 ) ) ( not ( = ?auto_376104 ?auto_376112 ) ) ( not ( = ?auto_376104 ?auto_376113 ) ) ( not ( = ?auto_376104 ?auto_376114 ) ) ( not ( = ?auto_376105 ?auto_376106 ) ) ( not ( = ?auto_376105 ?auto_376107 ) ) ( not ( = ?auto_376105 ?auto_376108 ) ) ( not ( = ?auto_376105 ?auto_376109 ) ) ( not ( = ?auto_376105 ?auto_376110 ) ) ( not ( = ?auto_376105 ?auto_376111 ) ) ( not ( = ?auto_376105 ?auto_376112 ) ) ( not ( = ?auto_376105 ?auto_376113 ) ) ( not ( = ?auto_376105 ?auto_376114 ) ) ( not ( = ?auto_376106 ?auto_376107 ) ) ( not ( = ?auto_376106 ?auto_376108 ) ) ( not ( = ?auto_376106 ?auto_376109 ) ) ( not ( = ?auto_376106 ?auto_376110 ) ) ( not ( = ?auto_376106 ?auto_376111 ) ) ( not ( = ?auto_376106 ?auto_376112 ) ) ( not ( = ?auto_376106 ?auto_376113 ) ) ( not ( = ?auto_376106 ?auto_376114 ) ) ( not ( = ?auto_376107 ?auto_376108 ) ) ( not ( = ?auto_376107 ?auto_376109 ) ) ( not ( = ?auto_376107 ?auto_376110 ) ) ( not ( = ?auto_376107 ?auto_376111 ) ) ( not ( = ?auto_376107 ?auto_376112 ) ) ( not ( = ?auto_376107 ?auto_376113 ) ) ( not ( = ?auto_376107 ?auto_376114 ) ) ( not ( = ?auto_376108 ?auto_376109 ) ) ( not ( = ?auto_376108 ?auto_376110 ) ) ( not ( = ?auto_376108 ?auto_376111 ) ) ( not ( = ?auto_376108 ?auto_376112 ) ) ( not ( = ?auto_376108 ?auto_376113 ) ) ( not ( = ?auto_376108 ?auto_376114 ) ) ( not ( = ?auto_376109 ?auto_376110 ) ) ( not ( = ?auto_376109 ?auto_376111 ) ) ( not ( = ?auto_376109 ?auto_376112 ) ) ( not ( = ?auto_376109 ?auto_376113 ) ) ( not ( = ?auto_376109 ?auto_376114 ) ) ( not ( = ?auto_376110 ?auto_376111 ) ) ( not ( = ?auto_376110 ?auto_376112 ) ) ( not ( = ?auto_376110 ?auto_376113 ) ) ( not ( = ?auto_376110 ?auto_376114 ) ) ( not ( = ?auto_376111 ?auto_376112 ) ) ( not ( = ?auto_376111 ?auto_376113 ) ) ( not ( = ?auto_376111 ?auto_376114 ) ) ( not ( = ?auto_376112 ?auto_376113 ) ) ( not ( = ?auto_376112 ?auto_376114 ) ) ( not ( = ?auto_376113 ?auto_376114 ) ) ( ON ?auto_376113 ?auto_376114 ) ( ON ?auto_376112 ?auto_376113 ) ( ON ?auto_376111 ?auto_376112 ) ( ON ?auto_376110 ?auto_376111 ) ( ON ?auto_376109 ?auto_376110 ) ( ON ?auto_376108 ?auto_376109 ) ( ON ?auto_376107 ?auto_376108 ) ( ON ?auto_376106 ?auto_376107 ) ( ON ?auto_376105 ?auto_376106 ) ( ON ?auto_376104 ?auto_376105 ) ( ON ?auto_376103 ?auto_376104 ) ( CLEAR ?auto_376101 ) ( ON ?auto_376102 ?auto_376103 ) ( CLEAR ?auto_376102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_376100 ?auto_376101 ?auto_376102 )
      ( MAKE-15PILE ?auto_376100 ?auto_376101 ?auto_376102 ?auto_376103 ?auto_376104 ?auto_376105 ?auto_376106 ?auto_376107 ?auto_376108 ?auto_376109 ?auto_376110 ?auto_376111 ?auto_376112 ?auto_376113 ?auto_376114 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376130 - BLOCK
      ?auto_376131 - BLOCK
      ?auto_376132 - BLOCK
      ?auto_376133 - BLOCK
      ?auto_376134 - BLOCK
      ?auto_376135 - BLOCK
      ?auto_376136 - BLOCK
      ?auto_376137 - BLOCK
      ?auto_376138 - BLOCK
      ?auto_376139 - BLOCK
      ?auto_376140 - BLOCK
      ?auto_376141 - BLOCK
      ?auto_376142 - BLOCK
      ?auto_376143 - BLOCK
      ?auto_376144 - BLOCK
    )
    :vars
    (
      ?auto_376145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376144 ?auto_376145 ) ( ON-TABLE ?auto_376130 ) ( not ( = ?auto_376130 ?auto_376131 ) ) ( not ( = ?auto_376130 ?auto_376132 ) ) ( not ( = ?auto_376130 ?auto_376133 ) ) ( not ( = ?auto_376130 ?auto_376134 ) ) ( not ( = ?auto_376130 ?auto_376135 ) ) ( not ( = ?auto_376130 ?auto_376136 ) ) ( not ( = ?auto_376130 ?auto_376137 ) ) ( not ( = ?auto_376130 ?auto_376138 ) ) ( not ( = ?auto_376130 ?auto_376139 ) ) ( not ( = ?auto_376130 ?auto_376140 ) ) ( not ( = ?auto_376130 ?auto_376141 ) ) ( not ( = ?auto_376130 ?auto_376142 ) ) ( not ( = ?auto_376130 ?auto_376143 ) ) ( not ( = ?auto_376130 ?auto_376144 ) ) ( not ( = ?auto_376130 ?auto_376145 ) ) ( not ( = ?auto_376131 ?auto_376132 ) ) ( not ( = ?auto_376131 ?auto_376133 ) ) ( not ( = ?auto_376131 ?auto_376134 ) ) ( not ( = ?auto_376131 ?auto_376135 ) ) ( not ( = ?auto_376131 ?auto_376136 ) ) ( not ( = ?auto_376131 ?auto_376137 ) ) ( not ( = ?auto_376131 ?auto_376138 ) ) ( not ( = ?auto_376131 ?auto_376139 ) ) ( not ( = ?auto_376131 ?auto_376140 ) ) ( not ( = ?auto_376131 ?auto_376141 ) ) ( not ( = ?auto_376131 ?auto_376142 ) ) ( not ( = ?auto_376131 ?auto_376143 ) ) ( not ( = ?auto_376131 ?auto_376144 ) ) ( not ( = ?auto_376131 ?auto_376145 ) ) ( not ( = ?auto_376132 ?auto_376133 ) ) ( not ( = ?auto_376132 ?auto_376134 ) ) ( not ( = ?auto_376132 ?auto_376135 ) ) ( not ( = ?auto_376132 ?auto_376136 ) ) ( not ( = ?auto_376132 ?auto_376137 ) ) ( not ( = ?auto_376132 ?auto_376138 ) ) ( not ( = ?auto_376132 ?auto_376139 ) ) ( not ( = ?auto_376132 ?auto_376140 ) ) ( not ( = ?auto_376132 ?auto_376141 ) ) ( not ( = ?auto_376132 ?auto_376142 ) ) ( not ( = ?auto_376132 ?auto_376143 ) ) ( not ( = ?auto_376132 ?auto_376144 ) ) ( not ( = ?auto_376132 ?auto_376145 ) ) ( not ( = ?auto_376133 ?auto_376134 ) ) ( not ( = ?auto_376133 ?auto_376135 ) ) ( not ( = ?auto_376133 ?auto_376136 ) ) ( not ( = ?auto_376133 ?auto_376137 ) ) ( not ( = ?auto_376133 ?auto_376138 ) ) ( not ( = ?auto_376133 ?auto_376139 ) ) ( not ( = ?auto_376133 ?auto_376140 ) ) ( not ( = ?auto_376133 ?auto_376141 ) ) ( not ( = ?auto_376133 ?auto_376142 ) ) ( not ( = ?auto_376133 ?auto_376143 ) ) ( not ( = ?auto_376133 ?auto_376144 ) ) ( not ( = ?auto_376133 ?auto_376145 ) ) ( not ( = ?auto_376134 ?auto_376135 ) ) ( not ( = ?auto_376134 ?auto_376136 ) ) ( not ( = ?auto_376134 ?auto_376137 ) ) ( not ( = ?auto_376134 ?auto_376138 ) ) ( not ( = ?auto_376134 ?auto_376139 ) ) ( not ( = ?auto_376134 ?auto_376140 ) ) ( not ( = ?auto_376134 ?auto_376141 ) ) ( not ( = ?auto_376134 ?auto_376142 ) ) ( not ( = ?auto_376134 ?auto_376143 ) ) ( not ( = ?auto_376134 ?auto_376144 ) ) ( not ( = ?auto_376134 ?auto_376145 ) ) ( not ( = ?auto_376135 ?auto_376136 ) ) ( not ( = ?auto_376135 ?auto_376137 ) ) ( not ( = ?auto_376135 ?auto_376138 ) ) ( not ( = ?auto_376135 ?auto_376139 ) ) ( not ( = ?auto_376135 ?auto_376140 ) ) ( not ( = ?auto_376135 ?auto_376141 ) ) ( not ( = ?auto_376135 ?auto_376142 ) ) ( not ( = ?auto_376135 ?auto_376143 ) ) ( not ( = ?auto_376135 ?auto_376144 ) ) ( not ( = ?auto_376135 ?auto_376145 ) ) ( not ( = ?auto_376136 ?auto_376137 ) ) ( not ( = ?auto_376136 ?auto_376138 ) ) ( not ( = ?auto_376136 ?auto_376139 ) ) ( not ( = ?auto_376136 ?auto_376140 ) ) ( not ( = ?auto_376136 ?auto_376141 ) ) ( not ( = ?auto_376136 ?auto_376142 ) ) ( not ( = ?auto_376136 ?auto_376143 ) ) ( not ( = ?auto_376136 ?auto_376144 ) ) ( not ( = ?auto_376136 ?auto_376145 ) ) ( not ( = ?auto_376137 ?auto_376138 ) ) ( not ( = ?auto_376137 ?auto_376139 ) ) ( not ( = ?auto_376137 ?auto_376140 ) ) ( not ( = ?auto_376137 ?auto_376141 ) ) ( not ( = ?auto_376137 ?auto_376142 ) ) ( not ( = ?auto_376137 ?auto_376143 ) ) ( not ( = ?auto_376137 ?auto_376144 ) ) ( not ( = ?auto_376137 ?auto_376145 ) ) ( not ( = ?auto_376138 ?auto_376139 ) ) ( not ( = ?auto_376138 ?auto_376140 ) ) ( not ( = ?auto_376138 ?auto_376141 ) ) ( not ( = ?auto_376138 ?auto_376142 ) ) ( not ( = ?auto_376138 ?auto_376143 ) ) ( not ( = ?auto_376138 ?auto_376144 ) ) ( not ( = ?auto_376138 ?auto_376145 ) ) ( not ( = ?auto_376139 ?auto_376140 ) ) ( not ( = ?auto_376139 ?auto_376141 ) ) ( not ( = ?auto_376139 ?auto_376142 ) ) ( not ( = ?auto_376139 ?auto_376143 ) ) ( not ( = ?auto_376139 ?auto_376144 ) ) ( not ( = ?auto_376139 ?auto_376145 ) ) ( not ( = ?auto_376140 ?auto_376141 ) ) ( not ( = ?auto_376140 ?auto_376142 ) ) ( not ( = ?auto_376140 ?auto_376143 ) ) ( not ( = ?auto_376140 ?auto_376144 ) ) ( not ( = ?auto_376140 ?auto_376145 ) ) ( not ( = ?auto_376141 ?auto_376142 ) ) ( not ( = ?auto_376141 ?auto_376143 ) ) ( not ( = ?auto_376141 ?auto_376144 ) ) ( not ( = ?auto_376141 ?auto_376145 ) ) ( not ( = ?auto_376142 ?auto_376143 ) ) ( not ( = ?auto_376142 ?auto_376144 ) ) ( not ( = ?auto_376142 ?auto_376145 ) ) ( not ( = ?auto_376143 ?auto_376144 ) ) ( not ( = ?auto_376143 ?auto_376145 ) ) ( not ( = ?auto_376144 ?auto_376145 ) ) ( ON ?auto_376143 ?auto_376144 ) ( ON ?auto_376142 ?auto_376143 ) ( ON ?auto_376141 ?auto_376142 ) ( ON ?auto_376140 ?auto_376141 ) ( ON ?auto_376139 ?auto_376140 ) ( ON ?auto_376138 ?auto_376139 ) ( ON ?auto_376137 ?auto_376138 ) ( ON ?auto_376136 ?auto_376137 ) ( ON ?auto_376135 ?auto_376136 ) ( ON ?auto_376134 ?auto_376135 ) ( ON ?auto_376133 ?auto_376134 ) ( ON ?auto_376132 ?auto_376133 ) ( CLEAR ?auto_376130 ) ( ON ?auto_376131 ?auto_376132 ) ( CLEAR ?auto_376131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376130 ?auto_376131 )
      ( MAKE-15PILE ?auto_376130 ?auto_376131 ?auto_376132 ?auto_376133 ?auto_376134 ?auto_376135 ?auto_376136 ?auto_376137 ?auto_376138 ?auto_376139 ?auto_376140 ?auto_376141 ?auto_376142 ?auto_376143 ?auto_376144 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376161 - BLOCK
      ?auto_376162 - BLOCK
      ?auto_376163 - BLOCK
      ?auto_376164 - BLOCK
      ?auto_376165 - BLOCK
      ?auto_376166 - BLOCK
      ?auto_376167 - BLOCK
      ?auto_376168 - BLOCK
      ?auto_376169 - BLOCK
      ?auto_376170 - BLOCK
      ?auto_376171 - BLOCK
      ?auto_376172 - BLOCK
      ?auto_376173 - BLOCK
      ?auto_376174 - BLOCK
      ?auto_376175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_376175 ) ( ON-TABLE ?auto_376161 ) ( not ( = ?auto_376161 ?auto_376162 ) ) ( not ( = ?auto_376161 ?auto_376163 ) ) ( not ( = ?auto_376161 ?auto_376164 ) ) ( not ( = ?auto_376161 ?auto_376165 ) ) ( not ( = ?auto_376161 ?auto_376166 ) ) ( not ( = ?auto_376161 ?auto_376167 ) ) ( not ( = ?auto_376161 ?auto_376168 ) ) ( not ( = ?auto_376161 ?auto_376169 ) ) ( not ( = ?auto_376161 ?auto_376170 ) ) ( not ( = ?auto_376161 ?auto_376171 ) ) ( not ( = ?auto_376161 ?auto_376172 ) ) ( not ( = ?auto_376161 ?auto_376173 ) ) ( not ( = ?auto_376161 ?auto_376174 ) ) ( not ( = ?auto_376161 ?auto_376175 ) ) ( not ( = ?auto_376162 ?auto_376163 ) ) ( not ( = ?auto_376162 ?auto_376164 ) ) ( not ( = ?auto_376162 ?auto_376165 ) ) ( not ( = ?auto_376162 ?auto_376166 ) ) ( not ( = ?auto_376162 ?auto_376167 ) ) ( not ( = ?auto_376162 ?auto_376168 ) ) ( not ( = ?auto_376162 ?auto_376169 ) ) ( not ( = ?auto_376162 ?auto_376170 ) ) ( not ( = ?auto_376162 ?auto_376171 ) ) ( not ( = ?auto_376162 ?auto_376172 ) ) ( not ( = ?auto_376162 ?auto_376173 ) ) ( not ( = ?auto_376162 ?auto_376174 ) ) ( not ( = ?auto_376162 ?auto_376175 ) ) ( not ( = ?auto_376163 ?auto_376164 ) ) ( not ( = ?auto_376163 ?auto_376165 ) ) ( not ( = ?auto_376163 ?auto_376166 ) ) ( not ( = ?auto_376163 ?auto_376167 ) ) ( not ( = ?auto_376163 ?auto_376168 ) ) ( not ( = ?auto_376163 ?auto_376169 ) ) ( not ( = ?auto_376163 ?auto_376170 ) ) ( not ( = ?auto_376163 ?auto_376171 ) ) ( not ( = ?auto_376163 ?auto_376172 ) ) ( not ( = ?auto_376163 ?auto_376173 ) ) ( not ( = ?auto_376163 ?auto_376174 ) ) ( not ( = ?auto_376163 ?auto_376175 ) ) ( not ( = ?auto_376164 ?auto_376165 ) ) ( not ( = ?auto_376164 ?auto_376166 ) ) ( not ( = ?auto_376164 ?auto_376167 ) ) ( not ( = ?auto_376164 ?auto_376168 ) ) ( not ( = ?auto_376164 ?auto_376169 ) ) ( not ( = ?auto_376164 ?auto_376170 ) ) ( not ( = ?auto_376164 ?auto_376171 ) ) ( not ( = ?auto_376164 ?auto_376172 ) ) ( not ( = ?auto_376164 ?auto_376173 ) ) ( not ( = ?auto_376164 ?auto_376174 ) ) ( not ( = ?auto_376164 ?auto_376175 ) ) ( not ( = ?auto_376165 ?auto_376166 ) ) ( not ( = ?auto_376165 ?auto_376167 ) ) ( not ( = ?auto_376165 ?auto_376168 ) ) ( not ( = ?auto_376165 ?auto_376169 ) ) ( not ( = ?auto_376165 ?auto_376170 ) ) ( not ( = ?auto_376165 ?auto_376171 ) ) ( not ( = ?auto_376165 ?auto_376172 ) ) ( not ( = ?auto_376165 ?auto_376173 ) ) ( not ( = ?auto_376165 ?auto_376174 ) ) ( not ( = ?auto_376165 ?auto_376175 ) ) ( not ( = ?auto_376166 ?auto_376167 ) ) ( not ( = ?auto_376166 ?auto_376168 ) ) ( not ( = ?auto_376166 ?auto_376169 ) ) ( not ( = ?auto_376166 ?auto_376170 ) ) ( not ( = ?auto_376166 ?auto_376171 ) ) ( not ( = ?auto_376166 ?auto_376172 ) ) ( not ( = ?auto_376166 ?auto_376173 ) ) ( not ( = ?auto_376166 ?auto_376174 ) ) ( not ( = ?auto_376166 ?auto_376175 ) ) ( not ( = ?auto_376167 ?auto_376168 ) ) ( not ( = ?auto_376167 ?auto_376169 ) ) ( not ( = ?auto_376167 ?auto_376170 ) ) ( not ( = ?auto_376167 ?auto_376171 ) ) ( not ( = ?auto_376167 ?auto_376172 ) ) ( not ( = ?auto_376167 ?auto_376173 ) ) ( not ( = ?auto_376167 ?auto_376174 ) ) ( not ( = ?auto_376167 ?auto_376175 ) ) ( not ( = ?auto_376168 ?auto_376169 ) ) ( not ( = ?auto_376168 ?auto_376170 ) ) ( not ( = ?auto_376168 ?auto_376171 ) ) ( not ( = ?auto_376168 ?auto_376172 ) ) ( not ( = ?auto_376168 ?auto_376173 ) ) ( not ( = ?auto_376168 ?auto_376174 ) ) ( not ( = ?auto_376168 ?auto_376175 ) ) ( not ( = ?auto_376169 ?auto_376170 ) ) ( not ( = ?auto_376169 ?auto_376171 ) ) ( not ( = ?auto_376169 ?auto_376172 ) ) ( not ( = ?auto_376169 ?auto_376173 ) ) ( not ( = ?auto_376169 ?auto_376174 ) ) ( not ( = ?auto_376169 ?auto_376175 ) ) ( not ( = ?auto_376170 ?auto_376171 ) ) ( not ( = ?auto_376170 ?auto_376172 ) ) ( not ( = ?auto_376170 ?auto_376173 ) ) ( not ( = ?auto_376170 ?auto_376174 ) ) ( not ( = ?auto_376170 ?auto_376175 ) ) ( not ( = ?auto_376171 ?auto_376172 ) ) ( not ( = ?auto_376171 ?auto_376173 ) ) ( not ( = ?auto_376171 ?auto_376174 ) ) ( not ( = ?auto_376171 ?auto_376175 ) ) ( not ( = ?auto_376172 ?auto_376173 ) ) ( not ( = ?auto_376172 ?auto_376174 ) ) ( not ( = ?auto_376172 ?auto_376175 ) ) ( not ( = ?auto_376173 ?auto_376174 ) ) ( not ( = ?auto_376173 ?auto_376175 ) ) ( not ( = ?auto_376174 ?auto_376175 ) ) ( ON ?auto_376174 ?auto_376175 ) ( ON ?auto_376173 ?auto_376174 ) ( ON ?auto_376172 ?auto_376173 ) ( ON ?auto_376171 ?auto_376172 ) ( ON ?auto_376170 ?auto_376171 ) ( ON ?auto_376169 ?auto_376170 ) ( ON ?auto_376168 ?auto_376169 ) ( ON ?auto_376167 ?auto_376168 ) ( ON ?auto_376166 ?auto_376167 ) ( ON ?auto_376165 ?auto_376166 ) ( ON ?auto_376164 ?auto_376165 ) ( ON ?auto_376163 ?auto_376164 ) ( CLEAR ?auto_376161 ) ( ON ?auto_376162 ?auto_376163 ) ( CLEAR ?auto_376162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_376161 ?auto_376162 )
      ( MAKE-15PILE ?auto_376161 ?auto_376162 ?auto_376163 ?auto_376164 ?auto_376165 ?auto_376166 ?auto_376167 ?auto_376168 ?auto_376169 ?auto_376170 ?auto_376171 ?auto_376172 ?auto_376173 ?auto_376174 ?auto_376175 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376191 - BLOCK
      ?auto_376192 - BLOCK
      ?auto_376193 - BLOCK
      ?auto_376194 - BLOCK
      ?auto_376195 - BLOCK
      ?auto_376196 - BLOCK
      ?auto_376197 - BLOCK
      ?auto_376198 - BLOCK
      ?auto_376199 - BLOCK
      ?auto_376200 - BLOCK
      ?auto_376201 - BLOCK
      ?auto_376202 - BLOCK
      ?auto_376203 - BLOCK
      ?auto_376204 - BLOCK
      ?auto_376205 - BLOCK
    )
    :vars
    (
      ?auto_376206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_376205 ?auto_376206 ) ( not ( = ?auto_376191 ?auto_376192 ) ) ( not ( = ?auto_376191 ?auto_376193 ) ) ( not ( = ?auto_376191 ?auto_376194 ) ) ( not ( = ?auto_376191 ?auto_376195 ) ) ( not ( = ?auto_376191 ?auto_376196 ) ) ( not ( = ?auto_376191 ?auto_376197 ) ) ( not ( = ?auto_376191 ?auto_376198 ) ) ( not ( = ?auto_376191 ?auto_376199 ) ) ( not ( = ?auto_376191 ?auto_376200 ) ) ( not ( = ?auto_376191 ?auto_376201 ) ) ( not ( = ?auto_376191 ?auto_376202 ) ) ( not ( = ?auto_376191 ?auto_376203 ) ) ( not ( = ?auto_376191 ?auto_376204 ) ) ( not ( = ?auto_376191 ?auto_376205 ) ) ( not ( = ?auto_376191 ?auto_376206 ) ) ( not ( = ?auto_376192 ?auto_376193 ) ) ( not ( = ?auto_376192 ?auto_376194 ) ) ( not ( = ?auto_376192 ?auto_376195 ) ) ( not ( = ?auto_376192 ?auto_376196 ) ) ( not ( = ?auto_376192 ?auto_376197 ) ) ( not ( = ?auto_376192 ?auto_376198 ) ) ( not ( = ?auto_376192 ?auto_376199 ) ) ( not ( = ?auto_376192 ?auto_376200 ) ) ( not ( = ?auto_376192 ?auto_376201 ) ) ( not ( = ?auto_376192 ?auto_376202 ) ) ( not ( = ?auto_376192 ?auto_376203 ) ) ( not ( = ?auto_376192 ?auto_376204 ) ) ( not ( = ?auto_376192 ?auto_376205 ) ) ( not ( = ?auto_376192 ?auto_376206 ) ) ( not ( = ?auto_376193 ?auto_376194 ) ) ( not ( = ?auto_376193 ?auto_376195 ) ) ( not ( = ?auto_376193 ?auto_376196 ) ) ( not ( = ?auto_376193 ?auto_376197 ) ) ( not ( = ?auto_376193 ?auto_376198 ) ) ( not ( = ?auto_376193 ?auto_376199 ) ) ( not ( = ?auto_376193 ?auto_376200 ) ) ( not ( = ?auto_376193 ?auto_376201 ) ) ( not ( = ?auto_376193 ?auto_376202 ) ) ( not ( = ?auto_376193 ?auto_376203 ) ) ( not ( = ?auto_376193 ?auto_376204 ) ) ( not ( = ?auto_376193 ?auto_376205 ) ) ( not ( = ?auto_376193 ?auto_376206 ) ) ( not ( = ?auto_376194 ?auto_376195 ) ) ( not ( = ?auto_376194 ?auto_376196 ) ) ( not ( = ?auto_376194 ?auto_376197 ) ) ( not ( = ?auto_376194 ?auto_376198 ) ) ( not ( = ?auto_376194 ?auto_376199 ) ) ( not ( = ?auto_376194 ?auto_376200 ) ) ( not ( = ?auto_376194 ?auto_376201 ) ) ( not ( = ?auto_376194 ?auto_376202 ) ) ( not ( = ?auto_376194 ?auto_376203 ) ) ( not ( = ?auto_376194 ?auto_376204 ) ) ( not ( = ?auto_376194 ?auto_376205 ) ) ( not ( = ?auto_376194 ?auto_376206 ) ) ( not ( = ?auto_376195 ?auto_376196 ) ) ( not ( = ?auto_376195 ?auto_376197 ) ) ( not ( = ?auto_376195 ?auto_376198 ) ) ( not ( = ?auto_376195 ?auto_376199 ) ) ( not ( = ?auto_376195 ?auto_376200 ) ) ( not ( = ?auto_376195 ?auto_376201 ) ) ( not ( = ?auto_376195 ?auto_376202 ) ) ( not ( = ?auto_376195 ?auto_376203 ) ) ( not ( = ?auto_376195 ?auto_376204 ) ) ( not ( = ?auto_376195 ?auto_376205 ) ) ( not ( = ?auto_376195 ?auto_376206 ) ) ( not ( = ?auto_376196 ?auto_376197 ) ) ( not ( = ?auto_376196 ?auto_376198 ) ) ( not ( = ?auto_376196 ?auto_376199 ) ) ( not ( = ?auto_376196 ?auto_376200 ) ) ( not ( = ?auto_376196 ?auto_376201 ) ) ( not ( = ?auto_376196 ?auto_376202 ) ) ( not ( = ?auto_376196 ?auto_376203 ) ) ( not ( = ?auto_376196 ?auto_376204 ) ) ( not ( = ?auto_376196 ?auto_376205 ) ) ( not ( = ?auto_376196 ?auto_376206 ) ) ( not ( = ?auto_376197 ?auto_376198 ) ) ( not ( = ?auto_376197 ?auto_376199 ) ) ( not ( = ?auto_376197 ?auto_376200 ) ) ( not ( = ?auto_376197 ?auto_376201 ) ) ( not ( = ?auto_376197 ?auto_376202 ) ) ( not ( = ?auto_376197 ?auto_376203 ) ) ( not ( = ?auto_376197 ?auto_376204 ) ) ( not ( = ?auto_376197 ?auto_376205 ) ) ( not ( = ?auto_376197 ?auto_376206 ) ) ( not ( = ?auto_376198 ?auto_376199 ) ) ( not ( = ?auto_376198 ?auto_376200 ) ) ( not ( = ?auto_376198 ?auto_376201 ) ) ( not ( = ?auto_376198 ?auto_376202 ) ) ( not ( = ?auto_376198 ?auto_376203 ) ) ( not ( = ?auto_376198 ?auto_376204 ) ) ( not ( = ?auto_376198 ?auto_376205 ) ) ( not ( = ?auto_376198 ?auto_376206 ) ) ( not ( = ?auto_376199 ?auto_376200 ) ) ( not ( = ?auto_376199 ?auto_376201 ) ) ( not ( = ?auto_376199 ?auto_376202 ) ) ( not ( = ?auto_376199 ?auto_376203 ) ) ( not ( = ?auto_376199 ?auto_376204 ) ) ( not ( = ?auto_376199 ?auto_376205 ) ) ( not ( = ?auto_376199 ?auto_376206 ) ) ( not ( = ?auto_376200 ?auto_376201 ) ) ( not ( = ?auto_376200 ?auto_376202 ) ) ( not ( = ?auto_376200 ?auto_376203 ) ) ( not ( = ?auto_376200 ?auto_376204 ) ) ( not ( = ?auto_376200 ?auto_376205 ) ) ( not ( = ?auto_376200 ?auto_376206 ) ) ( not ( = ?auto_376201 ?auto_376202 ) ) ( not ( = ?auto_376201 ?auto_376203 ) ) ( not ( = ?auto_376201 ?auto_376204 ) ) ( not ( = ?auto_376201 ?auto_376205 ) ) ( not ( = ?auto_376201 ?auto_376206 ) ) ( not ( = ?auto_376202 ?auto_376203 ) ) ( not ( = ?auto_376202 ?auto_376204 ) ) ( not ( = ?auto_376202 ?auto_376205 ) ) ( not ( = ?auto_376202 ?auto_376206 ) ) ( not ( = ?auto_376203 ?auto_376204 ) ) ( not ( = ?auto_376203 ?auto_376205 ) ) ( not ( = ?auto_376203 ?auto_376206 ) ) ( not ( = ?auto_376204 ?auto_376205 ) ) ( not ( = ?auto_376204 ?auto_376206 ) ) ( not ( = ?auto_376205 ?auto_376206 ) ) ( ON ?auto_376204 ?auto_376205 ) ( ON ?auto_376203 ?auto_376204 ) ( ON ?auto_376202 ?auto_376203 ) ( ON ?auto_376201 ?auto_376202 ) ( ON ?auto_376200 ?auto_376201 ) ( ON ?auto_376199 ?auto_376200 ) ( ON ?auto_376198 ?auto_376199 ) ( ON ?auto_376197 ?auto_376198 ) ( ON ?auto_376196 ?auto_376197 ) ( ON ?auto_376195 ?auto_376196 ) ( ON ?auto_376194 ?auto_376195 ) ( ON ?auto_376193 ?auto_376194 ) ( ON ?auto_376192 ?auto_376193 ) ( ON ?auto_376191 ?auto_376192 ) ( CLEAR ?auto_376191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376191 )
      ( MAKE-15PILE ?auto_376191 ?auto_376192 ?auto_376193 ?auto_376194 ?auto_376195 ?auto_376196 ?auto_376197 ?auto_376198 ?auto_376199 ?auto_376200 ?auto_376201 ?auto_376202 ?auto_376203 ?auto_376204 ?auto_376205 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376222 - BLOCK
      ?auto_376223 - BLOCK
      ?auto_376224 - BLOCK
      ?auto_376225 - BLOCK
      ?auto_376226 - BLOCK
      ?auto_376227 - BLOCK
      ?auto_376228 - BLOCK
      ?auto_376229 - BLOCK
      ?auto_376230 - BLOCK
      ?auto_376231 - BLOCK
      ?auto_376232 - BLOCK
      ?auto_376233 - BLOCK
      ?auto_376234 - BLOCK
      ?auto_376235 - BLOCK
      ?auto_376236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_376236 ) ( not ( = ?auto_376222 ?auto_376223 ) ) ( not ( = ?auto_376222 ?auto_376224 ) ) ( not ( = ?auto_376222 ?auto_376225 ) ) ( not ( = ?auto_376222 ?auto_376226 ) ) ( not ( = ?auto_376222 ?auto_376227 ) ) ( not ( = ?auto_376222 ?auto_376228 ) ) ( not ( = ?auto_376222 ?auto_376229 ) ) ( not ( = ?auto_376222 ?auto_376230 ) ) ( not ( = ?auto_376222 ?auto_376231 ) ) ( not ( = ?auto_376222 ?auto_376232 ) ) ( not ( = ?auto_376222 ?auto_376233 ) ) ( not ( = ?auto_376222 ?auto_376234 ) ) ( not ( = ?auto_376222 ?auto_376235 ) ) ( not ( = ?auto_376222 ?auto_376236 ) ) ( not ( = ?auto_376223 ?auto_376224 ) ) ( not ( = ?auto_376223 ?auto_376225 ) ) ( not ( = ?auto_376223 ?auto_376226 ) ) ( not ( = ?auto_376223 ?auto_376227 ) ) ( not ( = ?auto_376223 ?auto_376228 ) ) ( not ( = ?auto_376223 ?auto_376229 ) ) ( not ( = ?auto_376223 ?auto_376230 ) ) ( not ( = ?auto_376223 ?auto_376231 ) ) ( not ( = ?auto_376223 ?auto_376232 ) ) ( not ( = ?auto_376223 ?auto_376233 ) ) ( not ( = ?auto_376223 ?auto_376234 ) ) ( not ( = ?auto_376223 ?auto_376235 ) ) ( not ( = ?auto_376223 ?auto_376236 ) ) ( not ( = ?auto_376224 ?auto_376225 ) ) ( not ( = ?auto_376224 ?auto_376226 ) ) ( not ( = ?auto_376224 ?auto_376227 ) ) ( not ( = ?auto_376224 ?auto_376228 ) ) ( not ( = ?auto_376224 ?auto_376229 ) ) ( not ( = ?auto_376224 ?auto_376230 ) ) ( not ( = ?auto_376224 ?auto_376231 ) ) ( not ( = ?auto_376224 ?auto_376232 ) ) ( not ( = ?auto_376224 ?auto_376233 ) ) ( not ( = ?auto_376224 ?auto_376234 ) ) ( not ( = ?auto_376224 ?auto_376235 ) ) ( not ( = ?auto_376224 ?auto_376236 ) ) ( not ( = ?auto_376225 ?auto_376226 ) ) ( not ( = ?auto_376225 ?auto_376227 ) ) ( not ( = ?auto_376225 ?auto_376228 ) ) ( not ( = ?auto_376225 ?auto_376229 ) ) ( not ( = ?auto_376225 ?auto_376230 ) ) ( not ( = ?auto_376225 ?auto_376231 ) ) ( not ( = ?auto_376225 ?auto_376232 ) ) ( not ( = ?auto_376225 ?auto_376233 ) ) ( not ( = ?auto_376225 ?auto_376234 ) ) ( not ( = ?auto_376225 ?auto_376235 ) ) ( not ( = ?auto_376225 ?auto_376236 ) ) ( not ( = ?auto_376226 ?auto_376227 ) ) ( not ( = ?auto_376226 ?auto_376228 ) ) ( not ( = ?auto_376226 ?auto_376229 ) ) ( not ( = ?auto_376226 ?auto_376230 ) ) ( not ( = ?auto_376226 ?auto_376231 ) ) ( not ( = ?auto_376226 ?auto_376232 ) ) ( not ( = ?auto_376226 ?auto_376233 ) ) ( not ( = ?auto_376226 ?auto_376234 ) ) ( not ( = ?auto_376226 ?auto_376235 ) ) ( not ( = ?auto_376226 ?auto_376236 ) ) ( not ( = ?auto_376227 ?auto_376228 ) ) ( not ( = ?auto_376227 ?auto_376229 ) ) ( not ( = ?auto_376227 ?auto_376230 ) ) ( not ( = ?auto_376227 ?auto_376231 ) ) ( not ( = ?auto_376227 ?auto_376232 ) ) ( not ( = ?auto_376227 ?auto_376233 ) ) ( not ( = ?auto_376227 ?auto_376234 ) ) ( not ( = ?auto_376227 ?auto_376235 ) ) ( not ( = ?auto_376227 ?auto_376236 ) ) ( not ( = ?auto_376228 ?auto_376229 ) ) ( not ( = ?auto_376228 ?auto_376230 ) ) ( not ( = ?auto_376228 ?auto_376231 ) ) ( not ( = ?auto_376228 ?auto_376232 ) ) ( not ( = ?auto_376228 ?auto_376233 ) ) ( not ( = ?auto_376228 ?auto_376234 ) ) ( not ( = ?auto_376228 ?auto_376235 ) ) ( not ( = ?auto_376228 ?auto_376236 ) ) ( not ( = ?auto_376229 ?auto_376230 ) ) ( not ( = ?auto_376229 ?auto_376231 ) ) ( not ( = ?auto_376229 ?auto_376232 ) ) ( not ( = ?auto_376229 ?auto_376233 ) ) ( not ( = ?auto_376229 ?auto_376234 ) ) ( not ( = ?auto_376229 ?auto_376235 ) ) ( not ( = ?auto_376229 ?auto_376236 ) ) ( not ( = ?auto_376230 ?auto_376231 ) ) ( not ( = ?auto_376230 ?auto_376232 ) ) ( not ( = ?auto_376230 ?auto_376233 ) ) ( not ( = ?auto_376230 ?auto_376234 ) ) ( not ( = ?auto_376230 ?auto_376235 ) ) ( not ( = ?auto_376230 ?auto_376236 ) ) ( not ( = ?auto_376231 ?auto_376232 ) ) ( not ( = ?auto_376231 ?auto_376233 ) ) ( not ( = ?auto_376231 ?auto_376234 ) ) ( not ( = ?auto_376231 ?auto_376235 ) ) ( not ( = ?auto_376231 ?auto_376236 ) ) ( not ( = ?auto_376232 ?auto_376233 ) ) ( not ( = ?auto_376232 ?auto_376234 ) ) ( not ( = ?auto_376232 ?auto_376235 ) ) ( not ( = ?auto_376232 ?auto_376236 ) ) ( not ( = ?auto_376233 ?auto_376234 ) ) ( not ( = ?auto_376233 ?auto_376235 ) ) ( not ( = ?auto_376233 ?auto_376236 ) ) ( not ( = ?auto_376234 ?auto_376235 ) ) ( not ( = ?auto_376234 ?auto_376236 ) ) ( not ( = ?auto_376235 ?auto_376236 ) ) ( ON ?auto_376235 ?auto_376236 ) ( ON ?auto_376234 ?auto_376235 ) ( ON ?auto_376233 ?auto_376234 ) ( ON ?auto_376232 ?auto_376233 ) ( ON ?auto_376231 ?auto_376232 ) ( ON ?auto_376230 ?auto_376231 ) ( ON ?auto_376229 ?auto_376230 ) ( ON ?auto_376228 ?auto_376229 ) ( ON ?auto_376227 ?auto_376228 ) ( ON ?auto_376226 ?auto_376227 ) ( ON ?auto_376225 ?auto_376226 ) ( ON ?auto_376224 ?auto_376225 ) ( ON ?auto_376223 ?auto_376224 ) ( ON ?auto_376222 ?auto_376223 ) ( CLEAR ?auto_376222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_376222 )
      ( MAKE-15PILE ?auto_376222 ?auto_376223 ?auto_376224 ?auto_376225 ?auto_376226 ?auto_376227 ?auto_376228 ?auto_376229 ?auto_376230 ?auto_376231 ?auto_376232 ?auto_376233 ?auto_376234 ?auto_376235 ?auto_376236 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_376252 - BLOCK
      ?auto_376253 - BLOCK
      ?auto_376254 - BLOCK
      ?auto_376255 - BLOCK
      ?auto_376256 - BLOCK
      ?auto_376257 - BLOCK
      ?auto_376258 - BLOCK
      ?auto_376259 - BLOCK
      ?auto_376260 - BLOCK
      ?auto_376261 - BLOCK
      ?auto_376262 - BLOCK
      ?auto_376263 - BLOCK
      ?auto_376264 - BLOCK
      ?auto_376265 - BLOCK
      ?auto_376266 - BLOCK
    )
    :vars
    (
      ?auto_376267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_376252 ?auto_376253 ) ) ( not ( = ?auto_376252 ?auto_376254 ) ) ( not ( = ?auto_376252 ?auto_376255 ) ) ( not ( = ?auto_376252 ?auto_376256 ) ) ( not ( = ?auto_376252 ?auto_376257 ) ) ( not ( = ?auto_376252 ?auto_376258 ) ) ( not ( = ?auto_376252 ?auto_376259 ) ) ( not ( = ?auto_376252 ?auto_376260 ) ) ( not ( = ?auto_376252 ?auto_376261 ) ) ( not ( = ?auto_376252 ?auto_376262 ) ) ( not ( = ?auto_376252 ?auto_376263 ) ) ( not ( = ?auto_376252 ?auto_376264 ) ) ( not ( = ?auto_376252 ?auto_376265 ) ) ( not ( = ?auto_376252 ?auto_376266 ) ) ( not ( = ?auto_376253 ?auto_376254 ) ) ( not ( = ?auto_376253 ?auto_376255 ) ) ( not ( = ?auto_376253 ?auto_376256 ) ) ( not ( = ?auto_376253 ?auto_376257 ) ) ( not ( = ?auto_376253 ?auto_376258 ) ) ( not ( = ?auto_376253 ?auto_376259 ) ) ( not ( = ?auto_376253 ?auto_376260 ) ) ( not ( = ?auto_376253 ?auto_376261 ) ) ( not ( = ?auto_376253 ?auto_376262 ) ) ( not ( = ?auto_376253 ?auto_376263 ) ) ( not ( = ?auto_376253 ?auto_376264 ) ) ( not ( = ?auto_376253 ?auto_376265 ) ) ( not ( = ?auto_376253 ?auto_376266 ) ) ( not ( = ?auto_376254 ?auto_376255 ) ) ( not ( = ?auto_376254 ?auto_376256 ) ) ( not ( = ?auto_376254 ?auto_376257 ) ) ( not ( = ?auto_376254 ?auto_376258 ) ) ( not ( = ?auto_376254 ?auto_376259 ) ) ( not ( = ?auto_376254 ?auto_376260 ) ) ( not ( = ?auto_376254 ?auto_376261 ) ) ( not ( = ?auto_376254 ?auto_376262 ) ) ( not ( = ?auto_376254 ?auto_376263 ) ) ( not ( = ?auto_376254 ?auto_376264 ) ) ( not ( = ?auto_376254 ?auto_376265 ) ) ( not ( = ?auto_376254 ?auto_376266 ) ) ( not ( = ?auto_376255 ?auto_376256 ) ) ( not ( = ?auto_376255 ?auto_376257 ) ) ( not ( = ?auto_376255 ?auto_376258 ) ) ( not ( = ?auto_376255 ?auto_376259 ) ) ( not ( = ?auto_376255 ?auto_376260 ) ) ( not ( = ?auto_376255 ?auto_376261 ) ) ( not ( = ?auto_376255 ?auto_376262 ) ) ( not ( = ?auto_376255 ?auto_376263 ) ) ( not ( = ?auto_376255 ?auto_376264 ) ) ( not ( = ?auto_376255 ?auto_376265 ) ) ( not ( = ?auto_376255 ?auto_376266 ) ) ( not ( = ?auto_376256 ?auto_376257 ) ) ( not ( = ?auto_376256 ?auto_376258 ) ) ( not ( = ?auto_376256 ?auto_376259 ) ) ( not ( = ?auto_376256 ?auto_376260 ) ) ( not ( = ?auto_376256 ?auto_376261 ) ) ( not ( = ?auto_376256 ?auto_376262 ) ) ( not ( = ?auto_376256 ?auto_376263 ) ) ( not ( = ?auto_376256 ?auto_376264 ) ) ( not ( = ?auto_376256 ?auto_376265 ) ) ( not ( = ?auto_376256 ?auto_376266 ) ) ( not ( = ?auto_376257 ?auto_376258 ) ) ( not ( = ?auto_376257 ?auto_376259 ) ) ( not ( = ?auto_376257 ?auto_376260 ) ) ( not ( = ?auto_376257 ?auto_376261 ) ) ( not ( = ?auto_376257 ?auto_376262 ) ) ( not ( = ?auto_376257 ?auto_376263 ) ) ( not ( = ?auto_376257 ?auto_376264 ) ) ( not ( = ?auto_376257 ?auto_376265 ) ) ( not ( = ?auto_376257 ?auto_376266 ) ) ( not ( = ?auto_376258 ?auto_376259 ) ) ( not ( = ?auto_376258 ?auto_376260 ) ) ( not ( = ?auto_376258 ?auto_376261 ) ) ( not ( = ?auto_376258 ?auto_376262 ) ) ( not ( = ?auto_376258 ?auto_376263 ) ) ( not ( = ?auto_376258 ?auto_376264 ) ) ( not ( = ?auto_376258 ?auto_376265 ) ) ( not ( = ?auto_376258 ?auto_376266 ) ) ( not ( = ?auto_376259 ?auto_376260 ) ) ( not ( = ?auto_376259 ?auto_376261 ) ) ( not ( = ?auto_376259 ?auto_376262 ) ) ( not ( = ?auto_376259 ?auto_376263 ) ) ( not ( = ?auto_376259 ?auto_376264 ) ) ( not ( = ?auto_376259 ?auto_376265 ) ) ( not ( = ?auto_376259 ?auto_376266 ) ) ( not ( = ?auto_376260 ?auto_376261 ) ) ( not ( = ?auto_376260 ?auto_376262 ) ) ( not ( = ?auto_376260 ?auto_376263 ) ) ( not ( = ?auto_376260 ?auto_376264 ) ) ( not ( = ?auto_376260 ?auto_376265 ) ) ( not ( = ?auto_376260 ?auto_376266 ) ) ( not ( = ?auto_376261 ?auto_376262 ) ) ( not ( = ?auto_376261 ?auto_376263 ) ) ( not ( = ?auto_376261 ?auto_376264 ) ) ( not ( = ?auto_376261 ?auto_376265 ) ) ( not ( = ?auto_376261 ?auto_376266 ) ) ( not ( = ?auto_376262 ?auto_376263 ) ) ( not ( = ?auto_376262 ?auto_376264 ) ) ( not ( = ?auto_376262 ?auto_376265 ) ) ( not ( = ?auto_376262 ?auto_376266 ) ) ( not ( = ?auto_376263 ?auto_376264 ) ) ( not ( = ?auto_376263 ?auto_376265 ) ) ( not ( = ?auto_376263 ?auto_376266 ) ) ( not ( = ?auto_376264 ?auto_376265 ) ) ( not ( = ?auto_376264 ?auto_376266 ) ) ( not ( = ?auto_376265 ?auto_376266 ) ) ( ON ?auto_376252 ?auto_376267 ) ( not ( = ?auto_376266 ?auto_376267 ) ) ( not ( = ?auto_376265 ?auto_376267 ) ) ( not ( = ?auto_376264 ?auto_376267 ) ) ( not ( = ?auto_376263 ?auto_376267 ) ) ( not ( = ?auto_376262 ?auto_376267 ) ) ( not ( = ?auto_376261 ?auto_376267 ) ) ( not ( = ?auto_376260 ?auto_376267 ) ) ( not ( = ?auto_376259 ?auto_376267 ) ) ( not ( = ?auto_376258 ?auto_376267 ) ) ( not ( = ?auto_376257 ?auto_376267 ) ) ( not ( = ?auto_376256 ?auto_376267 ) ) ( not ( = ?auto_376255 ?auto_376267 ) ) ( not ( = ?auto_376254 ?auto_376267 ) ) ( not ( = ?auto_376253 ?auto_376267 ) ) ( not ( = ?auto_376252 ?auto_376267 ) ) ( ON ?auto_376253 ?auto_376252 ) ( ON ?auto_376254 ?auto_376253 ) ( ON ?auto_376255 ?auto_376254 ) ( ON ?auto_376256 ?auto_376255 ) ( ON ?auto_376257 ?auto_376256 ) ( ON ?auto_376258 ?auto_376257 ) ( ON ?auto_376259 ?auto_376258 ) ( ON ?auto_376260 ?auto_376259 ) ( ON ?auto_376261 ?auto_376260 ) ( ON ?auto_376262 ?auto_376261 ) ( ON ?auto_376263 ?auto_376262 ) ( ON ?auto_376264 ?auto_376263 ) ( ON ?auto_376265 ?auto_376264 ) ( ON ?auto_376266 ?auto_376265 ) ( CLEAR ?auto_376266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_376266 ?auto_376265 ?auto_376264 ?auto_376263 ?auto_376262 ?auto_376261 ?auto_376260 ?auto_376259 ?auto_376258 ?auto_376257 ?auto_376256 ?auto_376255 ?auto_376254 ?auto_376253 ?auto_376252 )
      ( MAKE-15PILE ?auto_376252 ?auto_376253 ?auto_376254 ?auto_376255 ?auto_376256 ?auto_376257 ?auto_376258 ?auto_376259 ?auto_376260 ?auto_376261 ?auto_376262 ?auto_376263 ?auto_376264 ?auto_376265 ?auto_376266 ) )
  )

)

