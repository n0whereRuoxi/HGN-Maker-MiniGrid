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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84101 - BLOCK
      ?auto_84102 - BLOCK
      ?auto_84103 - BLOCK
      ?auto_84104 - BLOCK
      ?auto_84105 - BLOCK
      ?auto_84106 - BLOCK
      ?auto_84107 - BLOCK
    )
    :vars
    (
      ?auto_84108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84108 ?auto_84107 ) ( CLEAR ?auto_84108 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84101 ) ( ON ?auto_84102 ?auto_84101 ) ( ON ?auto_84103 ?auto_84102 ) ( ON ?auto_84104 ?auto_84103 ) ( ON ?auto_84105 ?auto_84104 ) ( ON ?auto_84106 ?auto_84105 ) ( ON ?auto_84107 ?auto_84106 ) ( not ( = ?auto_84101 ?auto_84102 ) ) ( not ( = ?auto_84101 ?auto_84103 ) ) ( not ( = ?auto_84101 ?auto_84104 ) ) ( not ( = ?auto_84101 ?auto_84105 ) ) ( not ( = ?auto_84101 ?auto_84106 ) ) ( not ( = ?auto_84101 ?auto_84107 ) ) ( not ( = ?auto_84101 ?auto_84108 ) ) ( not ( = ?auto_84102 ?auto_84103 ) ) ( not ( = ?auto_84102 ?auto_84104 ) ) ( not ( = ?auto_84102 ?auto_84105 ) ) ( not ( = ?auto_84102 ?auto_84106 ) ) ( not ( = ?auto_84102 ?auto_84107 ) ) ( not ( = ?auto_84102 ?auto_84108 ) ) ( not ( = ?auto_84103 ?auto_84104 ) ) ( not ( = ?auto_84103 ?auto_84105 ) ) ( not ( = ?auto_84103 ?auto_84106 ) ) ( not ( = ?auto_84103 ?auto_84107 ) ) ( not ( = ?auto_84103 ?auto_84108 ) ) ( not ( = ?auto_84104 ?auto_84105 ) ) ( not ( = ?auto_84104 ?auto_84106 ) ) ( not ( = ?auto_84104 ?auto_84107 ) ) ( not ( = ?auto_84104 ?auto_84108 ) ) ( not ( = ?auto_84105 ?auto_84106 ) ) ( not ( = ?auto_84105 ?auto_84107 ) ) ( not ( = ?auto_84105 ?auto_84108 ) ) ( not ( = ?auto_84106 ?auto_84107 ) ) ( not ( = ?auto_84106 ?auto_84108 ) ) ( not ( = ?auto_84107 ?auto_84108 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84108 ?auto_84107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84110 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84110 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_84110 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84111 - BLOCK
    )
    :vars
    (
      ?auto_84112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84111 ?auto_84112 ) ( CLEAR ?auto_84111 ) ( HAND-EMPTY ) ( not ( = ?auto_84111 ?auto_84112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84111 ?auto_84112 )
      ( MAKE-1PILE ?auto_84111 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84119 - BLOCK
      ?auto_84120 - BLOCK
      ?auto_84121 - BLOCK
      ?auto_84122 - BLOCK
      ?auto_84123 - BLOCK
      ?auto_84124 - BLOCK
    )
    :vars
    (
      ?auto_84125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84125 ?auto_84124 ) ( CLEAR ?auto_84125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84119 ) ( ON ?auto_84120 ?auto_84119 ) ( ON ?auto_84121 ?auto_84120 ) ( ON ?auto_84122 ?auto_84121 ) ( ON ?auto_84123 ?auto_84122 ) ( ON ?auto_84124 ?auto_84123 ) ( not ( = ?auto_84119 ?auto_84120 ) ) ( not ( = ?auto_84119 ?auto_84121 ) ) ( not ( = ?auto_84119 ?auto_84122 ) ) ( not ( = ?auto_84119 ?auto_84123 ) ) ( not ( = ?auto_84119 ?auto_84124 ) ) ( not ( = ?auto_84119 ?auto_84125 ) ) ( not ( = ?auto_84120 ?auto_84121 ) ) ( not ( = ?auto_84120 ?auto_84122 ) ) ( not ( = ?auto_84120 ?auto_84123 ) ) ( not ( = ?auto_84120 ?auto_84124 ) ) ( not ( = ?auto_84120 ?auto_84125 ) ) ( not ( = ?auto_84121 ?auto_84122 ) ) ( not ( = ?auto_84121 ?auto_84123 ) ) ( not ( = ?auto_84121 ?auto_84124 ) ) ( not ( = ?auto_84121 ?auto_84125 ) ) ( not ( = ?auto_84122 ?auto_84123 ) ) ( not ( = ?auto_84122 ?auto_84124 ) ) ( not ( = ?auto_84122 ?auto_84125 ) ) ( not ( = ?auto_84123 ?auto_84124 ) ) ( not ( = ?auto_84123 ?auto_84125 ) ) ( not ( = ?auto_84124 ?auto_84125 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84125 ?auto_84124 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84126 - BLOCK
      ?auto_84127 - BLOCK
      ?auto_84128 - BLOCK
      ?auto_84129 - BLOCK
      ?auto_84130 - BLOCK
      ?auto_84131 - BLOCK
    )
    :vars
    (
      ?auto_84132 - BLOCK
      ?auto_84133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84132 ?auto_84131 ) ( CLEAR ?auto_84132 ) ( ON-TABLE ?auto_84126 ) ( ON ?auto_84127 ?auto_84126 ) ( ON ?auto_84128 ?auto_84127 ) ( ON ?auto_84129 ?auto_84128 ) ( ON ?auto_84130 ?auto_84129 ) ( ON ?auto_84131 ?auto_84130 ) ( not ( = ?auto_84126 ?auto_84127 ) ) ( not ( = ?auto_84126 ?auto_84128 ) ) ( not ( = ?auto_84126 ?auto_84129 ) ) ( not ( = ?auto_84126 ?auto_84130 ) ) ( not ( = ?auto_84126 ?auto_84131 ) ) ( not ( = ?auto_84126 ?auto_84132 ) ) ( not ( = ?auto_84127 ?auto_84128 ) ) ( not ( = ?auto_84127 ?auto_84129 ) ) ( not ( = ?auto_84127 ?auto_84130 ) ) ( not ( = ?auto_84127 ?auto_84131 ) ) ( not ( = ?auto_84127 ?auto_84132 ) ) ( not ( = ?auto_84128 ?auto_84129 ) ) ( not ( = ?auto_84128 ?auto_84130 ) ) ( not ( = ?auto_84128 ?auto_84131 ) ) ( not ( = ?auto_84128 ?auto_84132 ) ) ( not ( = ?auto_84129 ?auto_84130 ) ) ( not ( = ?auto_84129 ?auto_84131 ) ) ( not ( = ?auto_84129 ?auto_84132 ) ) ( not ( = ?auto_84130 ?auto_84131 ) ) ( not ( = ?auto_84130 ?auto_84132 ) ) ( not ( = ?auto_84131 ?auto_84132 ) ) ( HOLDING ?auto_84133 ) ( not ( = ?auto_84126 ?auto_84133 ) ) ( not ( = ?auto_84127 ?auto_84133 ) ) ( not ( = ?auto_84128 ?auto_84133 ) ) ( not ( = ?auto_84129 ?auto_84133 ) ) ( not ( = ?auto_84130 ?auto_84133 ) ) ( not ( = ?auto_84131 ?auto_84133 ) ) ( not ( = ?auto_84132 ?auto_84133 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_84133 )
      ( MAKE-6PILE ?auto_84126 ?auto_84127 ?auto_84128 ?auto_84129 ?auto_84130 ?auto_84131 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84134 - BLOCK
      ?auto_84135 - BLOCK
      ?auto_84136 - BLOCK
      ?auto_84137 - BLOCK
      ?auto_84138 - BLOCK
      ?auto_84139 - BLOCK
    )
    :vars
    (
      ?auto_84140 - BLOCK
      ?auto_84141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84140 ?auto_84139 ) ( ON-TABLE ?auto_84134 ) ( ON ?auto_84135 ?auto_84134 ) ( ON ?auto_84136 ?auto_84135 ) ( ON ?auto_84137 ?auto_84136 ) ( ON ?auto_84138 ?auto_84137 ) ( ON ?auto_84139 ?auto_84138 ) ( not ( = ?auto_84134 ?auto_84135 ) ) ( not ( = ?auto_84134 ?auto_84136 ) ) ( not ( = ?auto_84134 ?auto_84137 ) ) ( not ( = ?auto_84134 ?auto_84138 ) ) ( not ( = ?auto_84134 ?auto_84139 ) ) ( not ( = ?auto_84134 ?auto_84140 ) ) ( not ( = ?auto_84135 ?auto_84136 ) ) ( not ( = ?auto_84135 ?auto_84137 ) ) ( not ( = ?auto_84135 ?auto_84138 ) ) ( not ( = ?auto_84135 ?auto_84139 ) ) ( not ( = ?auto_84135 ?auto_84140 ) ) ( not ( = ?auto_84136 ?auto_84137 ) ) ( not ( = ?auto_84136 ?auto_84138 ) ) ( not ( = ?auto_84136 ?auto_84139 ) ) ( not ( = ?auto_84136 ?auto_84140 ) ) ( not ( = ?auto_84137 ?auto_84138 ) ) ( not ( = ?auto_84137 ?auto_84139 ) ) ( not ( = ?auto_84137 ?auto_84140 ) ) ( not ( = ?auto_84138 ?auto_84139 ) ) ( not ( = ?auto_84138 ?auto_84140 ) ) ( not ( = ?auto_84139 ?auto_84140 ) ) ( not ( = ?auto_84134 ?auto_84141 ) ) ( not ( = ?auto_84135 ?auto_84141 ) ) ( not ( = ?auto_84136 ?auto_84141 ) ) ( not ( = ?auto_84137 ?auto_84141 ) ) ( not ( = ?auto_84138 ?auto_84141 ) ) ( not ( = ?auto_84139 ?auto_84141 ) ) ( not ( = ?auto_84140 ?auto_84141 ) ) ( ON ?auto_84141 ?auto_84140 ) ( CLEAR ?auto_84141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84134 ?auto_84135 ?auto_84136 ?auto_84137 ?auto_84138 ?auto_84139 ?auto_84140 )
      ( MAKE-6PILE ?auto_84134 ?auto_84135 ?auto_84136 ?auto_84137 ?auto_84138 ?auto_84139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84144 - BLOCK
      ?auto_84145 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84145 ) ( CLEAR ?auto_84144 ) ( ON-TABLE ?auto_84144 ) ( not ( = ?auto_84144 ?auto_84145 ) ) )
    :subtasks
    ( ( !STACK ?auto_84145 ?auto_84144 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84146 - BLOCK
      ?auto_84147 - BLOCK
    )
    :vars
    (
      ?auto_84148 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84146 ) ( ON-TABLE ?auto_84146 ) ( not ( = ?auto_84146 ?auto_84147 ) ) ( ON ?auto_84147 ?auto_84148 ) ( CLEAR ?auto_84147 ) ( HAND-EMPTY ) ( not ( = ?auto_84146 ?auto_84148 ) ) ( not ( = ?auto_84147 ?auto_84148 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84147 ?auto_84148 )
      ( MAKE-2PILE ?auto_84146 ?auto_84147 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84149 - BLOCK
      ?auto_84150 - BLOCK
    )
    :vars
    (
      ?auto_84151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84149 ?auto_84150 ) ) ( ON ?auto_84150 ?auto_84151 ) ( CLEAR ?auto_84150 ) ( not ( = ?auto_84149 ?auto_84151 ) ) ( not ( = ?auto_84150 ?auto_84151 ) ) ( HOLDING ?auto_84149 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84149 )
      ( MAKE-2PILE ?auto_84149 ?auto_84150 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84152 - BLOCK
      ?auto_84153 - BLOCK
    )
    :vars
    (
      ?auto_84154 - BLOCK
      ?auto_84155 - BLOCK
      ?auto_84159 - BLOCK
      ?auto_84156 - BLOCK
      ?auto_84158 - BLOCK
      ?auto_84157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84152 ?auto_84153 ) ) ( ON ?auto_84153 ?auto_84154 ) ( not ( = ?auto_84152 ?auto_84154 ) ) ( not ( = ?auto_84153 ?auto_84154 ) ) ( ON ?auto_84152 ?auto_84153 ) ( CLEAR ?auto_84152 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84155 ) ( ON ?auto_84159 ?auto_84155 ) ( ON ?auto_84156 ?auto_84159 ) ( ON ?auto_84158 ?auto_84156 ) ( ON ?auto_84157 ?auto_84158 ) ( ON ?auto_84154 ?auto_84157 ) ( not ( = ?auto_84155 ?auto_84159 ) ) ( not ( = ?auto_84155 ?auto_84156 ) ) ( not ( = ?auto_84155 ?auto_84158 ) ) ( not ( = ?auto_84155 ?auto_84157 ) ) ( not ( = ?auto_84155 ?auto_84154 ) ) ( not ( = ?auto_84155 ?auto_84153 ) ) ( not ( = ?auto_84155 ?auto_84152 ) ) ( not ( = ?auto_84159 ?auto_84156 ) ) ( not ( = ?auto_84159 ?auto_84158 ) ) ( not ( = ?auto_84159 ?auto_84157 ) ) ( not ( = ?auto_84159 ?auto_84154 ) ) ( not ( = ?auto_84159 ?auto_84153 ) ) ( not ( = ?auto_84159 ?auto_84152 ) ) ( not ( = ?auto_84156 ?auto_84158 ) ) ( not ( = ?auto_84156 ?auto_84157 ) ) ( not ( = ?auto_84156 ?auto_84154 ) ) ( not ( = ?auto_84156 ?auto_84153 ) ) ( not ( = ?auto_84156 ?auto_84152 ) ) ( not ( = ?auto_84158 ?auto_84157 ) ) ( not ( = ?auto_84158 ?auto_84154 ) ) ( not ( = ?auto_84158 ?auto_84153 ) ) ( not ( = ?auto_84158 ?auto_84152 ) ) ( not ( = ?auto_84157 ?auto_84154 ) ) ( not ( = ?auto_84157 ?auto_84153 ) ) ( not ( = ?auto_84157 ?auto_84152 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84155 ?auto_84159 ?auto_84156 ?auto_84158 ?auto_84157 ?auto_84154 ?auto_84153 )
      ( MAKE-2PILE ?auto_84152 ?auto_84153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84165 - BLOCK
      ?auto_84166 - BLOCK
      ?auto_84167 - BLOCK
      ?auto_84168 - BLOCK
      ?auto_84169 - BLOCK
    )
    :vars
    (
      ?auto_84170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84170 ?auto_84169 ) ( CLEAR ?auto_84170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84165 ) ( ON ?auto_84166 ?auto_84165 ) ( ON ?auto_84167 ?auto_84166 ) ( ON ?auto_84168 ?auto_84167 ) ( ON ?auto_84169 ?auto_84168 ) ( not ( = ?auto_84165 ?auto_84166 ) ) ( not ( = ?auto_84165 ?auto_84167 ) ) ( not ( = ?auto_84165 ?auto_84168 ) ) ( not ( = ?auto_84165 ?auto_84169 ) ) ( not ( = ?auto_84165 ?auto_84170 ) ) ( not ( = ?auto_84166 ?auto_84167 ) ) ( not ( = ?auto_84166 ?auto_84168 ) ) ( not ( = ?auto_84166 ?auto_84169 ) ) ( not ( = ?auto_84166 ?auto_84170 ) ) ( not ( = ?auto_84167 ?auto_84168 ) ) ( not ( = ?auto_84167 ?auto_84169 ) ) ( not ( = ?auto_84167 ?auto_84170 ) ) ( not ( = ?auto_84168 ?auto_84169 ) ) ( not ( = ?auto_84168 ?auto_84170 ) ) ( not ( = ?auto_84169 ?auto_84170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84170 ?auto_84169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84171 - BLOCK
      ?auto_84172 - BLOCK
      ?auto_84173 - BLOCK
      ?auto_84174 - BLOCK
      ?auto_84175 - BLOCK
    )
    :vars
    (
      ?auto_84176 - BLOCK
      ?auto_84177 - BLOCK
      ?auto_84178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84176 ?auto_84175 ) ( CLEAR ?auto_84176 ) ( ON-TABLE ?auto_84171 ) ( ON ?auto_84172 ?auto_84171 ) ( ON ?auto_84173 ?auto_84172 ) ( ON ?auto_84174 ?auto_84173 ) ( ON ?auto_84175 ?auto_84174 ) ( not ( = ?auto_84171 ?auto_84172 ) ) ( not ( = ?auto_84171 ?auto_84173 ) ) ( not ( = ?auto_84171 ?auto_84174 ) ) ( not ( = ?auto_84171 ?auto_84175 ) ) ( not ( = ?auto_84171 ?auto_84176 ) ) ( not ( = ?auto_84172 ?auto_84173 ) ) ( not ( = ?auto_84172 ?auto_84174 ) ) ( not ( = ?auto_84172 ?auto_84175 ) ) ( not ( = ?auto_84172 ?auto_84176 ) ) ( not ( = ?auto_84173 ?auto_84174 ) ) ( not ( = ?auto_84173 ?auto_84175 ) ) ( not ( = ?auto_84173 ?auto_84176 ) ) ( not ( = ?auto_84174 ?auto_84175 ) ) ( not ( = ?auto_84174 ?auto_84176 ) ) ( not ( = ?auto_84175 ?auto_84176 ) ) ( HOLDING ?auto_84177 ) ( CLEAR ?auto_84178 ) ( not ( = ?auto_84171 ?auto_84177 ) ) ( not ( = ?auto_84171 ?auto_84178 ) ) ( not ( = ?auto_84172 ?auto_84177 ) ) ( not ( = ?auto_84172 ?auto_84178 ) ) ( not ( = ?auto_84173 ?auto_84177 ) ) ( not ( = ?auto_84173 ?auto_84178 ) ) ( not ( = ?auto_84174 ?auto_84177 ) ) ( not ( = ?auto_84174 ?auto_84178 ) ) ( not ( = ?auto_84175 ?auto_84177 ) ) ( not ( = ?auto_84175 ?auto_84178 ) ) ( not ( = ?auto_84176 ?auto_84177 ) ) ( not ( = ?auto_84176 ?auto_84178 ) ) ( not ( = ?auto_84177 ?auto_84178 ) ) )
    :subtasks
    ( ( !STACK ?auto_84177 ?auto_84178 )
      ( MAKE-5PILE ?auto_84171 ?auto_84172 ?auto_84173 ?auto_84174 ?auto_84175 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85097 - BLOCK
      ?auto_85098 - BLOCK
      ?auto_85099 - BLOCK
      ?auto_85100 - BLOCK
      ?auto_85101 - BLOCK
    )
    :vars
    (
      ?auto_85102 - BLOCK
      ?auto_85103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85102 ?auto_85101 ) ( ON-TABLE ?auto_85097 ) ( ON ?auto_85098 ?auto_85097 ) ( ON ?auto_85099 ?auto_85098 ) ( ON ?auto_85100 ?auto_85099 ) ( ON ?auto_85101 ?auto_85100 ) ( not ( = ?auto_85097 ?auto_85098 ) ) ( not ( = ?auto_85097 ?auto_85099 ) ) ( not ( = ?auto_85097 ?auto_85100 ) ) ( not ( = ?auto_85097 ?auto_85101 ) ) ( not ( = ?auto_85097 ?auto_85102 ) ) ( not ( = ?auto_85098 ?auto_85099 ) ) ( not ( = ?auto_85098 ?auto_85100 ) ) ( not ( = ?auto_85098 ?auto_85101 ) ) ( not ( = ?auto_85098 ?auto_85102 ) ) ( not ( = ?auto_85099 ?auto_85100 ) ) ( not ( = ?auto_85099 ?auto_85101 ) ) ( not ( = ?auto_85099 ?auto_85102 ) ) ( not ( = ?auto_85100 ?auto_85101 ) ) ( not ( = ?auto_85100 ?auto_85102 ) ) ( not ( = ?auto_85101 ?auto_85102 ) ) ( not ( = ?auto_85097 ?auto_85103 ) ) ( not ( = ?auto_85098 ?auto_85103 ) ) ( not ( = ?auto_85099 ?auto_85103 ) ) ( not ( = ?auto_85100 ?auto_85103 ) ) ( not ( = ?auto_85101 ?auto_85103 ) ) ( not ( = ?auto_85102 ?auto_85103 ) ) ( ON ?auto_85103 ?auto_85102 ) ( CLEAR ?auto_85103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85097 ?auto_85098 ?auto_85099 ?auto_85100 ?auto_85101 ?auto_85102 )
      ( MAKE-5PILE ?auto_85097 ?auto_85098 ?auto_85099 ?auto_85100 ?auto_85101 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84187 - BLOCK
      ?auto_84188 - BLOCK
      ?auto_84189 - BLOCK
      ?auto_84190 - BLOCK
      ?auto_84191 - BLOCK
    )
    :vars
    (
      ?auto_84192 - BLOCK
      ?auto_84194 - BLOCK
      ?auto_84193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84192 ?auto_84191 ) ( ON-TABLE ?auto_84187 ) ( ON ?auto_84188 ?auto_84187 ) ( ON ?auto_84189 ?auto_84188 ) ( ON ?auto_84190 ?auto_84189 ) ( ON ?auto_84191 ?auto_84190 ) ( not ( = ?auto_84187 ?auto_84188 ) ) ( not ( = ?auto_84187 ?auto_84189 ) ) ( not ( = ?auto_84187 ?auto_84190 ) ) ( not ( = ?auto_84187 ?auto_84191 ) ) ( not ( = ?auto_84187 ?auto_84192 ) ) ( not ( = ?auto_84188 ?auto_84189 ) ) ( not ( = ?auto_84188 ?auto_84190 ) ) ( not ( = ?auto_84188 ?auto_84191 ) ) ( not ( = ?auto_84188 ?auto_84192 ) ) ( not ( = ?auto_84189 ?auto_84190 ) ) ( not ( = ?auto_84189 ?auto_84191 ) ) ( not ( = ?auto_84189 ?auto_84192 ) ) ( not ( = ?auto_84190 ?auto_84191 ) ) ( not ( = ?auto_84190 ?auto_84192 ) ) ( not ( = ?auto_84191 ?auto_84192 ) ) ( not ( = ?auto_84187 ?auto_84194 ) ) ( not ( = ?auto_84187 ?auto_84193 ) ) ( not ( = ?auto_84188 ?auto_84194 ) ) ( not ( = ?auto_84188 ?auto_84193 ) ) ( not ( = ?auto_84189 ?auto_84194 ) ) ( not ( = ?auto_84189 ?auto_84193 ) ) ( not ( = ?auto_84190 ?auto_84194 ) ) ( not ( = ?auto_84190 ?auto_84193 ) ) ( not ( = ?auto_84191 ?auto_84194 ) ) ( not ( = ?auto_84191 ?auto_84193 ) ) ( not ( = ?auto_84192 ?auto_84194 ) ) ( not ( = ?auto_84192 ?auto_84193 ) ) ( not ( = ?auto_84194 ?auto_84193 ) ) ( ON ?auto_84194 ?auto_84192 ) ( CLEAR ?auto_84194 ) ( HOLDING ?auto_84193 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84193 )
      ( MAKE-5PILE ?auto_84187 ?auto_84188 ?auto_84189 ?auto_84190 ?auto_84191 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84195 - BLOCK
      ?auto_84196 - BLOCK
      ?auto_84197 - BLOCK
      ?auto_84198 - BLOCK
      ?auto_84199 - BLOCK
    )
    :vars
    (
      ?auto_84200 - BLOCK
      ?auto_84202 - BLOCK
      ?auto_84201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84200 ?auto_84199 ) ( ON-TABLE ?auto_84195 ) ( ON ?auto_84196 ?auto_84195 ) ( ON ?auto_84197 ?auto_84196 ) ( ON ?auto_84198 ?auto_84197 ) ( ON ?auto_84199 ?auto_84198 ) ( not ( = ?auto_84195 ?auto_84196 ) ) ( not ( = ?auto_84195 ?auto_84197 ) ) ( not ( = ?auto_84195 ?auto_84198 ) ) ( not ( = ?auto_84195 ?auto_84199 ) ) ( not ( = ?auto_84195 ?auto_84200 ) ) ( not ( = ?auto_84196 ?auto_84197 ) ) ( not ( = ?auto_84196 ?auto_84198 ) ) ( not ( = ?auto_84196 ?auto_84199 ) ) ( not ( = ?auto_84196 ?auto_84200 ) ) ( not ( = ?auto_84197 ?auto_84198 ) ) ( not ( = ?auto_84197 ?auto_84199 ) ) ( not ( = ?auto_84197 ?auto_84200 ) ) ( not ( = ?auto_84198 ?auto_84199 ) ) ( not ( = ?auto_84198 ?auto_84200 ) ) ( not ( = ?auto_84199 ?auto_84200 ) ) ( not ( = ?auto_84195 ?auto_84202 ) ) ( not ( = ?auto_84195 ?auto_84201 ) ) ( not ( = ?auto_84196 ?auto_84202 ) ) ( not ( = ?auto_84196 ?auto_84201 ) ) ( not ( = ?auto_84197 ?auto_84202 ) ) ( not ( = ?auto_84197 ?auto_84201 ) ) ( not ( = ?auto_84198 ?auto_84202 ) ) ( not ( = ?auto_84198 ?auto_84201 ) ) ( not ( = ?auto_84199 ?auto_84202 ) ) ( not ( = ?auto_84199 ?auto_84201 ) ) ( not ( = ?auto_84200 ?auto_84202 ) ) ( not ( = ?auto_84200 ?auto_84201 ) ) ( not ( = ?auto_84202 ?auto_84201 ) ) ( ON ?auto_84202 ?auto_84200 ) ( ON ?auto_84201 ?auto_84202 ) ( CLEAR ?auto_84201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84195 ?auto_84196 ?auto_84197 ?auto_84198 ?auto_84199 ?auto_84200 ?auto_84202 )
      ( MAKE-5PILE ?auto_84195 ?auto_84196 ?auto_84197 ?auto_84198 ?auto_84199 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84206 - BLOCK
      ?auto_84207 - BLOCK
      ?auto_84208 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84208 ) ( CLEAR ?auto_84207 ) ( ON-TABLE ?auto_84206 ) ( ON ?auto_84207 ?auto_84206 ) ( not ( = ?auto_84206 ?auto_84207 ) ) ( not ( = ?auto_84206 ?auto_84208 ) ) ( not ( = ?auto_84207 ?auto_84208 ) ) )
    :subtasks
    ( ( !STACK ?auto_84208 ?auto_84207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84209 - BLOCK
      ?auto_84210 - BLOCK
      ?auto_84211 - BLOCK
    )
    :vars
    (
      ?auto_84212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84210 ) ( ON-TABLE ?auto_84209 ) ( ON ?auto_84210 ?auto_84209 ) ( not ( = ?auto_84209 ?auto_84210 ) ) ( not ( = ?auto_84209 ?auto_84211 ) ) ( not ( = ?auto_84210 ?auto_84211 ) ) ( ON ?auto_84211 ?auto_84212 ) ( CLEAR ?auto_84211 ) ( HAND-EMPTY ) ( not ( = ?auto_84209 ?auto_84212 ) ) ( not ( = ?auto_84210 ?auto_84212 ) ) ( not ( = ?auto_84211 ?auto_84212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84211 ?auto_84212 )
      ( MAKE-3PILE ?auto_84209 ?auto_84210 ?auto_84211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84213 - BLOCK
      ?auto_84214 - BLOCK
      ?auto_84215 - BLOCK
    )
    :vars
    (
      ?auto_84216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84213 ) ( not ( = ?auto_84213 ?auto_84214 ) ) ( not ( = ?auto_84213 ?auto_84215 ) ) ( not ( = ?auto_84214 ?auto_84215 ) ) ( ON ?auto_84215 ?auto_84216 ) ( CLEAR ?auto_84215 ) ( not ( = ?auto_84213 ?auto_84216 ) ) ( not ( = ?auto_84214 ?auto_84216 ) ) ( not ( = ?auto_84215 ?auto_84216 ) ) ( HOLDING ?auto_84214 ) ( CLEAR ?auto_84213 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84213 ?auto_84214 )
      ( MAKE-3PILE ?auto_84213 ?auto_84214 ?auto_84215 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84217 - BLOCK
      ?auto_84218 - BLOCK
      ?auto_84219 - BLOCK
    )
    :vars
    (
      ?auto_84220 - BLOCK
      ?auto_84224 - BLOCK
      ?auto_84221 - BLOCK
      ?auto_84222 - BLOCK
      ?auto_84223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84217 ) ( not ( = ?auto_84217 ?auto_84218 ) ) ( not ( = ?auto_84217 ?auto_84219 ) ) ( not ( = ?auto_84218 ?auto_84219 ) ) ( ON ?auto_84219 ?auto_84220 ) ( not ( = ?auto_84217 ?auto_84220 ) ) ( not ( = ?auto_84218 ?auto_84220 ) ) ( not ( = ?auto_84219 ?auto_84220 ) ) ( CLEAR ?auto_84217 ) ( ON ?auto_84218 ?auto_84219 ) ( CLEAR ?auto_84218 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84224 ) ( ON ?auto_84221 ?auto_84224 ) ( ON ?auto_84222 ?auto_84221 ) ( ON ?auto_84223 ?auto_84222 ) ( ON ?auto_84220 ?auto_84223 ) ( not ( = ?auto_84224 ?auto_84221 ) ) ( not ( = ?auto_84224 ?auto_84222 ) ) ( not ( = ?auto_84224 ?auto_84223 ) ) ( not ( = ?auto_84224 ?auto_84220 ) ) ( not ( = ?auto_84224 ?auto_84219 ) ) ( not ( = ?auto_84224 ?auto_84218 ) ) ( not ( = ?auto_84221 ?auto_84222 ) ) ( not ( = ?auto_84221 ?auto_84223 ) ) ( not ( = ?auto_84221 ?auto_84220 ) ) ( not ( = ?auto_84221 ?auto_84219 ) ) ( not ( = ?auto_84221 ?auto_84218 ) ) ( not ( = ?auto_84222 ?auto_84223 ) ) ( not ( = ?auto_84222 ?auto_84220 ) ) ( not ( = ?auto_84222 ?auto_84219 ) ) ( not ( = ?auto_84222 ?auto_84218 ) ) ( not ( = ?auto_84223 ?auto_84220 ) ) ( not ( = ?auto_84223 ?auto_84219 ) ) ( not ( = ?auto_84223 ?auto_84218 ) ) ( not ( = ?auto_84217 ?auto_84224 ) ) ( not ( = ?auto_84217 ?auto_84221 ) ) ( not ( = ?auto_84217 ?auto_84222 ) ) ( not ( = ?auto_84217 ?auto_84223 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84224 ?auto_84221 ?auto_84222 ?auto_84223 ?auto_84220 ?auto_84219 )
      ( MAKE-3PILE ?auto_84217 ?auto_84218 ?auto_84219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84225 - BLOCK
      ?auto_84226 - BLOCK
      ?auto_84227 - BLOCK
    )
    :vars
    (
      ?auto_84229 - BLOCK
      ?auto_84230 - BLOCK
      ?auto_84231 - BLOCK
      ?auto_84232 - BLOCK
      ?auto_84228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84225 ?auto_84226 ) ) ( not ( = ?auto_84225 ?auto_84227 ) ) ( not ( = ?auto_84226 ?auto_84227 ) ) ( ON ?auto_84227 ?auto_84229 ) ( not ( = ?auto_84225 ?auto_84229 ) ) ( not ( = ?auto_84226 ?auto_84229 ) ) ( not ( = ?auto_84227 ?auto_84229 ) ) ( ON ?auto_84226 ?auto_84227 ) ( CLEAR ?auto_84226 ) ( ON-TABLE ?auto_84230 ) ( ON ?auto_84231 ?auto_84230 ) ( ON ?auto_84232 ?auto_84231 ) ( ON ?auto_84228 ?auto_84232 ) ( ON ?auto_84229 ?auto_84228 ) ( not ( = ?auto_84230 ?auto_84231 ) ) ( not ( = ?auto_84230 ?auto_84232 ) ) ( not ( = ?auto_84230 ?auto_84228 ) ) ( not ( = ?auto_84230 ?auto_84229 ) ) ( not ( = ?auto_84230 ?auto_84227 ) ) ( not ( = ?auto_84230 ?auto_84226 ) ) ( not ( = ?auto_84231 ?auto_84232 ) ) ( not ( = ?auto_84231 ?auto_84228 ) ) ( not ( = ?auto_84231 ?auto_84229 ) ) ( not ( = ?auto_84231 ?auto_84227 ) ) ( not ( = ?auto_84231 ?auto_84226 ) ) ( not ( = ?auto_84232 ?auto_84228 ) ) ( not ( = ?auto_84232 ?auto_84229 ) ) ( not ( = ?auto_84232 ?auto_84227 ) ) ( not ( = ?auto_84232 ?auto_84226 ) ) ( not ( = ?auto_84228 ?auto_84229 ) ) ( not ( = ?auto_84228 ?auto_84227 ) ) ( not ( = ?auto_84228 ?auto_84226 ) ) ( not ( = ?auto_84225 ?auto_84230 ) ) ( not ( = ?auto_84225 ?auto_84231 ) ) ( not ( = ?auto_84225 ?auto_84232 ) ) ( not ( = ?auto_84225 ?auto_84228 ) ) ( HOLDING ?auto_84225 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84225 )
      ( MAKE-3PILE ?auto_84225 ?auto_84226 ?auto_84227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84233 - BLOCK
      ?auto_84234 - BLOCK
      ?auto_84235 - BLOCK
    )
    :vars
    (
      ?auto_84236 - BLOCK
      ?auto_84237 - BLOCK
      ?auto_84240 - BLOCK
      ?auto_84238 - BLOCK
      ?auto_84239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84233 ?auto_84234 ) ) ( not ( = ?auto_84233 ?auto_84235 ) ) ( not ( = ?auto_84234 ?auto_84235 ) ) ( ON ?auto_84235 ?auto_84236 ) ( not ( = ?auto_84233 ?auto_84236 ) ) ( not ( = ?auto_84234 ?auto_84236 ) ) ( not ( = ?auto_84235 ?auto_84236 ) ) ( ON ?auto_84234 ?auto_84235 ) ( ON-TABLE ?auto_84237 ) ( ON ?auto_84240 ?auto_84237 ) ( ON ?auto_84238 ?auto_84240 ) ( ON ?auto_84239 ?auto_84238 ) ( ON ?auto_84236 ?auto_84239 ) ( not ( = ?auto_84237 ?auto_84240 ) ) ( not ( = ?auto_84237 ?auto_84238 ) ) ( not ( = ?auto_84237 ?auto_84239 ) ) ( not ( = ?auto_84237 ?auto_84236 ) ) ( not ( = ?auto_84237 ?auto_84235 ) ) ( not ( = ?auto_84237 ?auto_84234 ) ) ( not ( = ?auto_84240 ?auto_84238 ) ) ( not ( = ?auto_84240 ?auto_84239 ) ) ( not ( = ?auto_84240 ?auto_84236 ) ) ( not ( = ?auto_84240 ?auto_84235 ) ) ( not ( = ?auto_84240 ?auto_84234 ) ) ( not ( = ?auto_84238 ?auto_84239 ) ) ( not ( = ?auto_84238 ?auto_84236 ) ) ( not ( = ?auto_84238 ?auto_84235 ) ) ( not ( = ?auto_84238 ?auto_84234 ) ) ( not ( = ?auto_84239 ?auto_84236 ) ) ( not ( = ?auto_84239 ?auto_84235 ) ) ( not ( = ?auto_84239 ?auto_84234 ) ) ( not ( = ?auto_84233 ?auto_84237 ) ) ( not ( = ?auto_84233 ?auto_84240 ) ) ( not ( = ?auto_84233 ?auto_84238 ) ) ( not ( = ?auto_84233 ?auto_84239 ) ) ( ON ?auto_84233 ?auto_84234 ) ( CLEAR ?auto_84233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84237 ?auto_84240 ?auto_84238 ?auto_84239 ?auto_84236 ?auto_84235 ?auto_84234 )
      ( MAKE-3PILE ?auto_84233 ?auto_84234 ?auto_84235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84245 - BLOCK
      ?auto_84246 - BLOCK
      ?auto_84247 - BLOCK
      ?auto_84248 - BLOCK
    )
    :vars
    (
      ?auto_84249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84249 ?auto_84248 ) ( CLEAR ?auto_84249 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84245 ) ( ON ?auto_84246 ?auto_84245 ) ( ON ?auto_84247 ?auto_84246 ) ( ON ?auto_84248 ?auto_84247 ) ( not ( = ?auto_84245 ?auto_84246 ) ) ( not ( = ?auto_84245 ?auto_84247 ) ) ( not ( = ?auto_84245 ?auto_84248 ) ) ( not ( = ?auto_84245 ?auto_84249 ) ) ( not ( = ?auto_84246 ?auto_84247 ) ) ( not ( = ?auto_84246 ?auto_84248 ) ) ( not ( = ?auto_84246 ?auto_84249 ) ) ( not ( = ?auto_84247 ?auto_84248 ) ) ( not ( = ?auto_84247 ?auto_84249 ) ) ( not ( = ?auto_84248 ?auto_84249 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84249 ?auto_84248 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84250 - BLOCK
      ?auto_84251 - BLOCK
      ?auto_84252 - BLOCK
      ?auto_84253 - BLOCK
    )
    :vars
    (
      ?auto_84254 - BLOCK
      ?auto_84255 - BLOCK
      ?auto_84256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84254 ?auto_84253 ) ( CLEAR ?auto_84254 ) ( ON-TABLE ?auto_84250 ) ( ON ?auto_84251 ?auto_84250 ) ( ON ?auto_84252 ?auto_84251 ) ( ON ?auto_84253 ?auto_84252 ) ( not ( = ?auto_84250 ?auto_84251 ) ) ( not ( = ?auto_84250 ?auto_84252 ) ) ( not ( = ?auto_84250 ?auto_84253 ) ) ( not ( = ?auto_84250 ?auto_84254 ) ) ( not ( = ?auto_84251 ?auto_84252 ) ) ( not ( = ?auto_84251 ?auto_84253 ) ) ( not ( = ?auto_84251 ?auto_84254 ) ) ( not ( = ?auto_84252 ?auto_84253 ) ) ( not ( = ?auto_84252 ?auto_84254 ) ) ( not ( = ?auto_84253 ?auto_84254 ) ) ( HOLDING ?auto_84255 ) ( CLEAR ?auto_84256 ) ( not ( = ?auto_84250 ?auto_84255 ) ) ( not ( = ?auto_84250 ?auto_84256 ) ) ( not ( = ?auto_84251 ?auto_84255 ) ) ( not ( = ?auto_84251 ?auto_84256 ) ) ( not ( = ?auto_84252 ?auto_84255 ) ) ( not ( = ?auto_84252 ?auto_84256 ) ) ( not ( = ?auto_84253 ?auto_84255 ) ) ( not ( = ?auto_84253 ?auto_84256 ) ) ( not ( = ?auto_84254 ?auto_84255 ) ) ( not ( = ?auto_84254 ?auto_84256 ) ) ( not ( = ?auto_84255 ?auto_84256 ) ) )
    :subtasks
    ( ( !STACK ?auto_84255 ?auto_84256 )
      ( MAKE-4PILE ?auto_84250 ?auto_84251 ?auto_84252 ?auto_84253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84257 - BLOCK
      ?auto_84258 - BLOCK
      ?auto_84259 - BLOCK
      ?auto_84260 - BLOCK
    )
    :vars
    (
      ?auto_84261 - BLOCK
      ?auto_84262 - BLOCK
      ?auto_84263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84261 ?auto_84260 ) ( ON-TABLE ?auto_84257 ) ( ON ?auto_84258 ?auto_84257 ) ( ON ?auto_84259 ?auto_84258 ) ( ON ?auto_84260 ?auto_84259 ) ( not ( = ?auto_84257 ?auto_84258 ) ) ( not ( = ?auto_84257 ?auto_84259 ) ) ( not ( = ?auto_84257 ?auto_84260 ) ) ( not ( = ?auto_84257 ?auto_84261 ) ) ( not ( = ?auto_84258 ?auto_84259 ) ) ( not ( = ?auto_84258 ?auto_84260 ) ) ( not ( = ?auto_84258 ?auto_84261 ) ) ( not ( = ?auto_84259 ?auto_84260 ) ) ( not ( = ?auto_84259 ?auto_84261 ) ) ( not ( = ?auto_84260 ?auto_84261 ) ) ( CLEAR ?auto_84262 ) ( not ( = ?auto_84257 ?auto_84263 ) ) ( not ( = ?auto_84257 ?auto_84262 ) ) ( not ( = ?auto_84258 ?auto_84263 ) ) ( not ( = ?auto_84258 ?auto_84262 ) ) ( not ( = ?auto_84259 ?auto_84263 ) ) ( not ( = ?auto_84259 ?auto_84262 ) ) ( not ( = ?auto_84260 ?auto_84263 ) ) ( not ( = ?auto_84260 ?auto_84262 ) ) ( not ( = ?auto_84261 ?auto_84263 ) ) ( not ( = ?auto_84261 ?auto_84262 ) ) ( not ( = ?auto_84263 ?auto_84262 ) ) ( ON ?auto_84263 ?auto_84261 ) ( CLEAR ?auto_84263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84257 ?auto_84258 ?auto_84259 ?auto_84260 ?auto_84261 )
      ( MAKE-4PILE ?auto_84257 ?auto_84258 ?auto_84259 ?auto_84260 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84264 - BLOCK
      ?auto_84265 - BLOCK
      ?auto_84266 - BLOCK
      ?auto_84267 - BLOCK
    )
    :vars
    (
      ?auto_84268 - BLOCK
      ?auto_84270 - BLOCK
      ?auto_84269 - BLOCK
      ?auto_84271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84268 ?auto_84267 ) ( ON-TABLE ?auto_84264 ) ( ON ?auto_84265 ?auto_84264 ) ( ON ?auto_84266 ?auto_84265 ) ( ON ?auto_84267 ?auto_84266 ) ( not ( = ?auto_84264 ?auto_84265 ) ) ( not ( = ?auto_84264 ?auto_84266 ) ) ( not ( = ?auto_84264 ?auto_84267 ) ) ( not ( = ?auto_84264 ?auto_84268 ) ) ( not ( = ?auto_84265 ?auto_84266 ) ) ( not ( = ?auto_84265 ?auto_84267 ) ) ( not ( = ?auto_84265 ?auto_84268 ) ) ( not ( = ?auto_84266 ?auto_84267 ) ) ( not ( = ?auto_84266 ?auto_84268 ) ) ( not ( = ?auto_84267 ?auto_84268 ) ) ( not ( = ?auto_84264 ?auto_84270 ) ) ( not ( = ?auto_84264 ?auto_84269 ) ) ( not ( = ?auto_84265 ?auto_84270 ) ) ( not ( = ?auto_84265 ?auto_84269 ) ) ( not ( = ?auto_84266 ?auto_84270 ) ) ( not ( = ?auto_84266 ?auto_84269 ) ) ( not ( = ?auto_84267 ?auto_84270 ) ) ( not ( = ?auto_84267 ?auto_84269 ) ) ( not ( = ?auto_84268 ?auto_84270 ) ) ( not ( = ?auto_84268 ?auto_84269 ) ) ( not ( = ?auto_84270 ?auto_84269 ) ) ( ON ?auto_84270 ?auto_84268 ) ( CLEAR ?auto_84270 ) ( HOLDING ?auto_84269 ) ( CLEAR ?auto_84271 ) ( ON-TABLE ?auto_84271 ) ( not ( = ?auto_84271 ?auto_84269 ) ) ( not ( = ?auto_84264 ?auto_84271 ) ) ( not ( = ?auto_84265 ?auto_84271 ) ) ( not ( = ?auto_84266 ?auto_84271 ) ) ( not ( = ?auto_84267 ?auto_84271 ) ) ( not ( = ?auto_84268 ?auto_84271 ) ) ( not ( = ?auto_84270 ?auto_84271 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84271 ?auto_84269 )
      ( MAKE-4PILE ?auto_84264 ?auto_84265 ?auto_84266 ?auto_84267 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85326 - BLOCK
      ?auto_85327 - BLOCK
      ?auto_85328 - BLOCK
      ?auto_85329 - BLOCK
    )
    :vars
    (
      ?auto_85332 - BLOCK
      ?auto_85331 - BLOCK
      ?auto_85330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85332 ?auto_85329 ) ( ON-TABLE ?auto_85326 ) ( ON ?auto_85327 ?auto_85326 ) ( ON ?auto_85328 ?auto_85327 ) ( ON ?auto_85329 ?auto_85328 ) ( not ( = ?auto_85326 ?auto_85327 ) ) ( not ( = ?auto_85326 ?auto_85328 ) ) ( not ( = ?auto_85326 ?auto_85329 ) ) ( not ( = ?auto_85326 ?auto_85332 ) ) ( not ( = ?auto_85327 ?auto_85328 ) ) ( not ( = ?auto_85327 ?auto_85329 ) ) ( not ( = ?auto_85327 ?auto_85332 ) ) ( not ( = ?auto_85328 ?auto_85329 ) ) ( not ( = ?auto_85328 ?auto_85332 ) ) ( not ( = ?auto_85329 ?auto_85332 ) ) ( not ( = ?auto_85326 ?auto_85331 ) ) ( not ( = ?auto_85326 ?auto_85330 ) ) ( not ( = ?auto_85327 ?auto_85331 ) ) ( not ( = ?auto_85327 ?auto_85330 ) ) ( not ( = ?auto_85328 ?auto_85331 ) ) ( not ( = ?auto_85328 ?auto_85330 ) ) ( not ( = ?auto_85329 ?auto_85331 ) ) ( not ( = ?auto_85329 ?auto_85330 ) ) ( not ( = ?auto_85332 ?auto_85331 ) ) ( not ( = ?auto_85332 ?auto_85330 ) ) ( not ( = ?auto_85331 ?auto_85330 ) ) ( ON ?auto_85331 ?auto_85332 ) ( ON ?auto_85330 ?auto_85331 ) ( CLEAR ?auto_85330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85326 ?auto_85327 ?auto_85328 ?auto_85329 ?auto_85332 ?auto_85331 )
      ( MAKE-4PILE ?auto_85326 ?auto_85327 ?auto_85328 ?auto_85329 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84280 - BLOCK
      ?auto_84281 - BLOCK
      ?auto_84282 - BLOCK
      ?auto_84283 - BLOCK
    )
    :vars
    (
      ?auto_84285 - BLOCK
      ?auto_84284 - BLOCK
      ?auto_84286 - BLOCK
      ?auto_84287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84285 ?auto_84283 ) ( ON-TABLE ?auto_84280 ) ( ON ?auto_84281 ?auto_84280 ) ( ON ?auto_84282 ?auto_84281 ) ( ON ?auto_84283 ?auto_84282 ) ( not ( = ?auto_84280 ?auto_84281 ) ) ( not ( = ?auto_84280 ?auto_84282 ) ) ( not ( = ?auto_84280 ?auto_84283 ) ) ( not ( = ?auto_84280 ?auto_84285 ) ) ( not ( = ?auto_84281 ?auto_84282 ) ) ( not ( = ?auto_84281 ?auto_84283 ) ) ( not ( = ?auto_84281 ?auto_84285 ) ) ( not ( = ?auto_84282 ?auto_84283 ) ) ( not ( = ?auto_84282 ?auto_84285 ) ) ( not ( = ?auto_84283 ?auto_84285 ) ) ( not ( = ?auto_84280 ?auto_84284 ) ) ( not ( = ?auto_84280 ?auto_84286 ) ) ( not ( = ?auto_84281 ?auto_84284 ) ) ( not ( = ?auto_84281 ?auto_84286 ) ) ( not ( = ?auto_84282 ?auto_84284 ) ) ( not ( = ?auto_84282 ?auto_84286 ) ) ( not ( = ?auto_84283 ?auto_84284 ) ) ( not ( = ?auto_84283 ?auto_84286 ) ) ( not ( = ?auto_84285 ?auto_84284 ) ) ( not ( = ?auto_84285 ?auto_84286 ) ) ( not ( = ?auto_84284 ?auto_84286 ) ) ( ON ?auto_84284 ?auto_84285 ) ( not ( = ?auto_84287 ?auto_84286 ) ) ( not ( = ?auto_84280 ?auto_84287 ) ) ( not ( = ?auto_84281 ?auto_84287 ) ) ( not ( = ?auto_84282 ?auto_84287 ) ) ( not ( = ?auto_84283 ?auto_84287 ) ) ( not ( = ?auto_84285 ?auto_84287 ) ) ( not ( = ?auto_84284 ?auto_84287 ) ) ( ON ?auto_84286 ?auto_84284 ) ( CLEAR ?auto_84286 ) ( HOLDING ?auto_84287 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84287 )
      ( MAKE-4PILE ?auto_84280 ?auto_84281 ?auto_84282 ?auto_84283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84288 - BLOCK
      ?auto_84289 - BLOCK
      ?auto_84290 - BLOCK
      ?auto_84291 - BLOCK
    )
    :vars
    (
      ?auto_84292 - BLOCK
      ?auto_84294 - BLOCK
      ?auto_84293 - BLOCK
      ?auto_84295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84292 ?auto_84291 ) ( ON-TABLE ?auto_84288 ) ( ON ?auto_84289 ?auto_84288 ) ( ON ?auto_84290 ?auto_84289 ) ( ON ?auto_84291 ?auto_84290 ) ( not ( = ?auto_84288 ?auto_84289 ) ) ( not ( = ?auto_84288 ?auto_84290 ) ) ( not ( = ?auto_84288 ?auto_84291 ) ) ( not ( = ?auto_84288 ?auto_84292 ) ) ( not ( = ?auto_84289 ?auto_84290 ) ) ( not ( = ?auto_84289 ?auto_84291 ) ) ( not ( = ?auto_84289 ?auto_84292 ) ) ( not ( = ?auto_84290 ?auto_84291 ) ) ( not ( = ?auto_84290 ?auto_84292 ) ) ( not ( = ?auto_84291 ?auto_84292 ) ) ( not ( = ?auto_84288 ?auto_84294 ) ) ( not ( = ?auto_84288 ?auto_84293 ) ) ( not ( = ?auto_84289 ?auto_84294 ) ) ( not ( = ?auto_84289 ?auto_84293 ) ) ( not ( = ?auto_84290 ?auto_84294 ) ) ( not ( = ?auto_84290 ?auto_84293 ) ) ( not ( = ?auto_84291 ?auto_84294 ) ) ( not ( = ?auto_84291 ?auto_84293 ) ) ( not ( = ?auto_84292 ?auto_84294 ) ) ( not ( = ?auto_84292 ?auto_84293 ) ) ( not ( = ?auto_84294 ?auto_84293 ) ) ( ON ?auto_84294 ?auto_84292 ) ( not ( = ?auto_84295 ?auto_84293 ) ) ( not ( = ?auto_84288 ?auto_84295 ) ) ( not ( = ?auto_84289 ?auto_84295 ) ) ( not ( = ?auto_84290 ?auto_84295 ) ) ( not ( = ?auto_84291 ?auto_84295 ) ) ( not ( = ?auto_84292 ?auto_84295 ) ) ( not ( = ?auto_84294 ?auto_84295 ) ) ( ON ?auto_84293 ?auto_84294 ) ( ON ?auto_84295 ?auto_84293 ) ( CLEAR ?auto_84295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84288 ?auto_84289 ?auto_84290 ?auto_84291 ?auto_84292 ?auto_84294 ?auto_84293 )
      ( MAKE-4PILE ?auto_84288 ?auto_84289 ?auto_84290 ?auto_84291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84300 - BLOCK
      ?auto_84301 - BLOCK
      ?auto_84302 - BLOCK
      ?auto_84303 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84303 ) ( CLEAR ?auto_84302 ) ( ON-TABLE ?auto_84300 ) ( ON ?auto_84301 ?auto_84300 ) ( ON ?auto_84302 ?auto_84301 ) ( not ( = ?auto_84300 ?auto_84301 ) ) ( not ( = ?auto_84300 ?auto_84302 ) ) ( not ( = ?auto_84300 ?auto_84303 ) ) ( not ( = ?auto_84301 ?auto_84302 ) ) ( not ( = ?auto_84301 ?auto_84303 ) ) ( not ( = ?auto_84302 ?auto_84303 ) ) )
    :subtasks
    ( ( !STACK ?auto_84303 ?auto_84302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84304 - BLOCK
      ?auto_84305 - BLOCK
      ?auto_84306 - BLOCK
      ?auto_84307 - BLOCK
    )
    :vars
    (
      ?auto_84308 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84306 ) ( ON-TABLE ?auto_84304 ) ( ON ?auto_84305 ?auto_84304 ) ( ON ?auto_84306 ?auto_84305 ) ( not ( = ?auto_84304 ?auto_84305 ) ) ( not ( = ?auto_84304 ?auto_84306 ) ) ( not ( = ?auto_84304 ?auto_84307 ) ) ( not ( = ?auto_84305 ?auto_84306 ) ) ( not ( = ?auto_84305 ?auto_84307 ) ) ( not ( = ?auto_84306 ?auto_84307 ) ) ( ON ?auto_84307 ?auto_84308 ) ( CLEAR ?auto_84307 ) ( HAND-EMPTY ) ( not ( = ?auto_84304 ?auto_84308 ) ) ( not ( = ?auto_84305 ?auto_84308 ) ) ( not ( = ?auto_84306 ?auto_84308 ) ) ( not ( = ?auto_84307 ?auto_84308 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84307 ?auto_84308 )
      ( MAKE-4PILE ?auto_84304 ?auto_84305 ?auto_84306 ?auto_84307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84309 - BLOCK
      ?auto_84310 - BLOCK
      ?auto_84311 - BLOCK
      ?auto_84312 - BLOCK
    )
    :vars
    (
      ?auto_84313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84309 ) ( ON ?auto_84310 ?auto_84309 ) ( not ( = ?auto_84309 ?auto_84310 ) ) ( not ( = ?auto_84309 ?auto_84311 ) ) ( not ( = ?auto_84309 ?auto_84312 ) ) ( not ( = ?auto_84310 ?auto_84311 ) ) ( not ( = ?auto_84310 ?auto_84312 ) ) ( not ( = ?auto_84311 ?auto_84312 ) ) ( ON ?auto_84312 ?auto_84313 ) ( CLEAR ?auto_84312 ) ( not ( = ?auto_84309 ?auto_84313 ) ) ( not ( = ?auto_84310 ?auto_84313 ) ) ( not ( = ?auto_84311 ?auto_84313 ) ) ( not ( = ?auto_84312 ?auto_84313 ) ) ( HOLDING ?auto_84311 ) ( CLEAR ?auto_84310 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84309 ?auto_84310 ?auto_84311 )
      ( MAKE-4PILE ?auto_84309 ?auto_84310 ?auto_84311 ?auto_84312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84314 - BLOCK
      ?auto_84315 - BLOCK
      ?auto_84316 - BLOCK
      ?auto_84317 - BLOCK
    )
    :vars
    (
      ?auto_84318 - BLOCK
      ?auto_84321 - BLOCK
      ?auto_84319 - BLOCK
      ?auto_84320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84314 ) ( ON ?auto_84315 ?auto_84314 ) ( not ( = ?auto_84314 ?auto_84315 ) ) ( not ( = ?auto_84314 ?auto_84316 ) ) ( not ( = ?auto_84314 ?auto_84317 ) ) ( not ( = ?auto_84315 ?auto_84316 ) ) ( not ( = ?auto_84315 ?auto_84317 ) ) ( not ( = ?auto_84316 ?auto_84317 ) ) ( ON ?auto_84317 ?auto_84318 ) ( not ( = ?auto_84314 ?auto_84318 ) ) ( not ( = ?auto_84315 ?auto_84318 ) ) ( not ( = ?auto_84316 ?auto_84318 ) ) ( not ( = ?auto_84317 ?auto_84318 ) ) ( CLEAR ?auto_84315 ) ( ON ?auto_84316 ?auto_84317 ) ( CLEAR ?auto_84316 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84321 ) ( ON ?auto_84319 ?auto_84321 ) ( ON ?auto_84320 ?auto_84319 ) ( ON ?auto_84318 ?auto_84320 ) ( not ( = ?auto_84321 ?auto_84319 ) ) ( not ( = ?auto_84321 ?auto_84320 ) ) ( not ( = ?auto_84321 ?auto_84318 ) ) ( not ( = ?auto_84321 ?auto_84317 ) ) ( not ( = ?auto_84321 ?auto_84316 ) ) ( not ( = ?auto_84319 ?auto_84320 ) ) ( not ( = ?auto_84319 ?auto_84318 ) ) ( not ( = ?auto_84319 ?auto_84317 ) ) ( not ( = ?auto_84319 ?auto_84316 ) ) ( not ( = ?auto_84320 ?auto_84318 ) ) ( not ( = ?auto_84320 ?auto_84317 ) ) ( not ( = ?auto_84320 ?auto_84316 ) ) ( not ( = ?auto_84314 ?auto_84321 ) ) ( not ( = ?auto_84314 ?auto_84319 ) ) ( not ( = ?auto_84314 ?auto_84320 ) ) ( not ( = ?auto_84315 ?auto_84321 ) ) ( not ( = ?auto_84315 ?auto_84319 ) ) ( not ( = ?auto_84315 ?auto_84320 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84321 ?auto_84319 ?auto_84320 ?auto_84318 ?auto_84317 )
      ( MAKE-4PILE ?auto_84314 ?auto_84315 ?auto_84316 ?auto_84317 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84322 - BLOCK
      ?auto_84323 - BLOCK
      ?auto_84324 - BLOCK
      ?auto_84325 - BLOCK
    )
    :vars
    (
      ?auto_84328 - BLOCK
      ?auto_84329 - BLOCK
      ?auto_84327 - BLOCK
      ?auto_84326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84322 ) ( not ( = ?auto_84322 ?auto_84323 ) ) ( not ( = ?auto_84322 ?auto_84324 ) ) ( not ( = ?auto_84322 ?auto_84325 ) ) ( not ( = ?auto_84323 ?auto_84324 ) ) ( not ( = ?auto_84323 ?auto_84325 ) ) ( not ( = ?auto_84324 ?auto_84325 ) ) ( ON ?auto_84325 ?auto_84328 ) ( not ( = ?auto_84322 ?auto_84328 ) ) ( not ( = ?auto_84323 ?auto_84328 ) ) ( not ( = ?auto_84324 ?auto_84328 ) ) ( not ( = ?auto_84325 ?auto_84328 ) ) ( ON ?auto_84324 ?auto_84325 ) ( CLEAR ?auto_84324 ) ( ON-TABLE ?auto_84329 ) ( ON ?auto_84327 ?auto_84329 ) ( ON ?auto_84326 ?auto_84327 ) ( ON ?auto_84328 ?auto_84326 ) ( not ( = ?auto_84329 ?auto_84327 ) ) ( not ( = ?auto_84329 ?auto_84326 ) ) ( not ( = ?auto_84329 ?auto_84328 ) ) ( not ( = ?auto_84329 ?auto_84325 ) ) ( not ( = ?auto_84329 ?auto_84324 ) ) ( not ( = ?auto_84327 ?auto_84326 ) ) ( not ( = ?auto_84327 ?auto_84328 ) ) ( not ( = ?auto_84327 ?auto_84325 ) ) ( not ( = ?auto_84327 ?auto_84324 ) ) ( not ( = ?auto_84326 ?auto_84328 ) ) ( not ( = ?auto_84326 ?auto_84325 ) ) ( not ( = ?auto_84326 ?auto_84324 ) ) ( not ( = ?auto_84322 ?auto_84329 ) ) ( not ( = ?auto_84322 ?auto_84327 ) ) ( not ( = ?auto_84322 ?auto_84326 ) ) ( not ( = ?auto_84323 ?auto_84329 ) ) ( not ( = ?auto_84323 ?auto_84327 ) ) ( not ( = ?auto_84323 ?auto_84326 ) ) ( HOLDING ?auto_84323 ) ( CLEAR ?auto_84322 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84322 ?auto_84323 )
      ( MAKE-4PILE ?auto_84322 ?auto_84323 ?auto_84324 ?auto_84325 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84330 - BLOCK
      ?auto_84331 - BLOCK
      ?auto_84332 - BLOCK
      ?auto_84333 - BLOCK
    )
    :vars
    (
      ?auto_84335 - BLOCK
      ?auto_84334 - BLOCK
      ?auto_84336 - BLOCK
      ?auto_84337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84330 ) ( not ( = ?auto_84330 ?auto_84331 ) ) ( not ( = ?auto_84330 ?auto_84332 ) ) ( not ( = ?auto_84330 ?auto_84333 ) ) ( not ( = ?auto_84331 ?auto_84332 ) ) ( not ( = ?auto_84331 ?auto_84333 ) ) ( not ( = ?auto_84332 ?auto_84333 ) ) ( ON ?auto_84333 ?auto_84335 ) ( not ( = ?auto_84330 ?auto_84335 ) ) ( not ( = ?auto_84331 ?auto_84335 ) ) ( not ( = ?auto_84332 ?auto_84335 ) ) ( not ( = ?auto_84333 ?auto_84335 ) ) ( ON ?auto_84332 ?auto_84333 ) ( ON-TABLE ?auto_84334 ) ( ON ?auto_84336 ?auto_84334 ) ( ON ?auto_84337 ?auto_84336 ) ( ON ?auto_84335 ?auto_84337 ) ( not ( = ?auto_84334 ?auto_84336 ) ) ( not ( = ?auto_84334 ?auto_84337 ) ) ( not ( = ?auto_84334 ?auto_84335 ) ) ( not ( = ?auto_84334 ?auto_84333 ) ) ( not ( = ?auto_84334 ?auto_84332 ) ) ( not ( = ?auto_84336 ?auto_84337 ) ) ( not ( = ?auto_84336 ?auto_84335 ) ) ( not ( = ?auto_84336 ?auto_84333 ) ) ( not ( = ?auto_84336 ?auto_84332 ) ) ( not ( = ?auto_84337 ?auto_84335 ) ) ( not ( = ?auto_84337 ?auto_84333 ) ) ( not ( = ?auto_84337 ?auto_84332 ) ) ( not ( = ?auto_84330 ?auto_84334 ) ) ( not ( = ?auto_84330 ?auto_84336 ) ) ( not ( = ?auto_84330 ?auto_84337 ) ) ( not ( = ?auto_84331 ?auto_84334 ) ) ( not ( = ?auto_84331 ?auto_84336 ) ) ( not ( = ?auto_84331 ?auto_84337 ) ) ( CLEAR ?auto_84330 ) ( ON ?auto_84331 ?auto_84332 ) ( CLEAR ?auto_84331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84334 ?auto_84336 ?auto_84337 ?auto_84335 ?auto_84333 ?auto_84332 )
      ( MAKE-4PILE ?auto_84330 ?auto_84331 ?auto_84332 ?auto_84333 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84338 - BLOCK
      ?auto_84339 - BLOCK
      ?auto_84340 - BLOCK
      ?auto_84341 - BLOCK
    )
    :vars
    (
      ?auto_84342 - BLOCK
      ?auto_84345 - BLOCK
      ?auto_84343 - BLOCK
      ?auto_84344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84338 ?auto_84339 ) ) ( not ( = ?auto_84338 ?auto_84340 ) ) ( not ( = ?auto_84338 ?auto_84341 ) ) ( not ( = ?auto_84339 ?auto_84340 ) ) ( not ( = ?auto_84339 ?auto_84341 ) ) ( not ( = ?auto_84340 ?auto_84341 ) ) ( ON ?auto_84341 ?auto_84342 ) ( not ( = ?auto_84338 ?auto_84342 ) ) ( not ( = ?auto_84339 ?auto_84342 ) ) ( not ( = ?auto_84340 ?auto_84342 ) ) ( not ( = ?auto_84341 ?auto_84342 ) ) ( ON ?auto_84340 ?auto_84341 ) ( ON-TABLE ?auto_84345 ) ( ON ?auto_84343 ?auto_84345 ) ( ON ?auto_84344 ?auto_84343 ) ( ON ?auto_84342 ?auto_84344 ) ( not ( = ?auto_84345 ?auto_84343 ) ) ( not ( = ?auto_84345 ?auto_84344 ) ) ( not ( = ?auto_84345 ?auto_84342 ) ) ( not ( = ?auto_84345 ?auto_84341 ) ) ( not ( = ?auto_84345 ?auto_84340 ) ) ( not ( = ?auto_84343 ?auto_84344 ) ) ( not ( = ?auto_84343 ?auto_84342 ) ) ( not ( = ?auto_84343 ?auto_84341 ) ) ( not ( = ?auto_84343 ?auto_84340 ) ) ( not ( = ?auto_84344 ?auto_84342 ) ) ( not ( = ?auto_84344 ?auto_84341 ) ) ( not ( = ?auto_84344 ?auto_84340 ) ) ( not ( = ?auto_84338 ?auto_84345 ) ) ( not ( = ?auto_84338 ?auto_84343 ) ) ( not ( = ?auto_84338 ?auto_84344 ) ) ( not ( = ?auto_84339 ?auto_84345 ) ) ( not ( = ?auto_84339 ?auto_84343 ) ) ( not ( = ?auto_84339 ?auto_84344 ) ) ( ON ?auto_84339 ?auto_84340 ) ( CLEAR ?auto_84339 ) ( HOLDING ?auto_84338 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84338 )
      ( MAKE-4PILE ?auto_84338 ?auto_84339 ?auto_84340 ?auto_84341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_84346 - BLOCK
      ?auto_84347 - BLOCK
      ?auto_84348 - BLOCK
      ?auto_84349 - BLOCK
    )
    :vars
    (
      ?auto_84350 - BLOCK
      ?auto_84352 - BLOCK
      ?auto_84351 - BLOCK
      ?auto_84353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84346 ?auto_84347 ) ) ( not ( = ?auto_84346 ?auto_84348 ) ) ( not ( = ?auto_84346 ?auto_84349 ) ) ( not ( = ?auto_84347 ?auto_84348 ) ) ( not ( = ?auto_84347 ?auto_84349 ) ) ( not ( = ?auto_84348 ?auto_84349 ) ) ( ON ?auto_84349 ?auto_84350 ) ( not ( = ?auto_84346 ?auto_84350 ) ) ( not ( = ?auto_84347 ?auto_84350 ) ) ( not ( = ?auto_84348 ?auto_84350 ) ) ( not ( = ?auto_84349 ?auto_84350 ) ) ( ON ?auto_84348 ?auto_84349 ) ( ON-TABLE ?auto_84352 ) ( ON ?auto_84351 ?auto_84352 ) ( ON ?auto_84353 ?auto_84351 ) ( ON ?auto_84350 ?auto_84353 ) ( not ( = ?auto_84352 ?auto_84351 ) ) ( not ( = ?auto_84352 ?auto_84353 ) ) ( not ( = ?auto_84352 ?auto_84350 ) ) ( not ( = ?auto_84352 ?auto_84349 ) ) ( not ( = ?auto_84352 ?auto_84348 ) ) ( not ( = ?auto_84351 ?auto_84353 ) ) ( not ( = ?auto_84351 ?auto_84350 ) ) ( not ( = ?auto_84351 ?auto_84349 ) ) ( not ( = ?auto_84351 ?auto_84348 ) ) ( not ( = ?auto_84353 ?auto_84350 ) ) ( not ( = ?auto_84353 ?auto_84349 ) ) ( not ( = ?auto_84353 ?auto_84348 ) ) ( not ( = ?auto_84346 ?auto_84352 ) ) ( not ( = ?auto_84346 ?auto_84351 ) ) ( not ( = ?auto_84346 ?auto_84353 ) ) ( not ( = ?auto_84347 ?auto_84352 ) ) ( not ( = ?auto_84347 ?auto_84351 ) ) ( not ( = ?auto_84347 ?auto_84353 ) ) ( ON ?auto_84347 ?auto_84348 ) ( ON ?auto_84346 ?auto_84347 ) ( CLEAR ?auto_84346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84352 ?auto_84351 ?auto_84353 ?auto_84350 ?auto_84349 ?auto_84348 ?auto_84347 )
      ( MAKE-4PILE ?auto_84346 ?auto_84347 ?auto_84348 ?auto_84349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84357 - BLOCK
      ?auto_84358 - BLOCK
      ?auto_84359 - BLOCK
    )
    :vars
    (
      ?auto_84360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84360 ?auto_84359 ) ( CLEAR ?auto_84360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84357 ) ( ON ?auto_84358 ?auto_84357 ) ( ON ?auto_84359 ?auto_84358 ) ( not ( = ?auto_84357 ?auto_84358 ) ) ( not ( = ?auto_84357 ?auto_84359 ) ) ( not ( = ?auto_84357 ?auto_84360 ) ) ( not ( = ?auto_84358 ?auto_84359 ) ) ( not ( = ?auto_84358 ?auto_84360 ) ) ( not ( = ?auto_84359 ?auto_84360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84360 ?auto_84359 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84361 - BLOCK
      ?auto_84362 - BLOCK
      ?auto_84363 - BLOCK
    )
    :vars
    (
      ?auto_84364 - BLOCK
      ?auto_84365 - BLOCK
      ?auto_84366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84364 ?auto_84363 ) ( CLEAR ?auto_84364 ) ( ON-TABLE ?auto_84361 ) ( ON ?auto_84362 ?auto_84361 ) ( ON ?auto_84363 ?auto_84362 ) ( not ( = ?auto_84361 ?auto_84362 ) ) ( not ( = ?auto_84361 ?auto_84363 ) ) ( not ( = ?auto_84361 ?auto_84364 ) ) ( not ( = ?auto_84362 ?auto_84363 ) ) ( not ( = ?auto_84362 ?auto_84364 ) ) ( not ( = ?auto_84363 ?auto_84364 ) ) ( HOLDING ?auto_84365 ) ( CLEAR ?auto_84366 ) ( not ( = ?auto_84361 ?auto_84365 ) ) ( not ( = ?auto_84361 ?auto_84366 ) ) ( not ( = ?auto_84362 ?auto_84365 ) ) ( not ( = ?auto_84362 ?auto_84366 ) ) ( not ( = ?auto_84363 ?auto_84365 ) ) ( not ( = ?auto_84363 ?auto_84366 ) ) ( not ( = ?auto_84364 ?auto_84365 ) ) ( not ( = ?auto_84364 ?auto_84366 ) ) ( not ( = ?auto_84365 ?auto_84366 ) ) )
    :subtasks
    ( ( !STACK ?auto_84365 ?auto_84366 )
      ( MAKE-3PILE ?auto_84361 ?auto_84362 ?auto_84363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84367 - BLOCK
      ?auto_84368 - BLOCK
      ?auto_84369 - BLOCK
    )
    :vars
    (
      ?auto_84371 - BLOCK
      ?auto_84372 - BLOCK
      ?auto_84370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84371 ?auto_84369 ) ( ON-TABLE ?auto_84367 ) ( ON ?auto_84368 ?auto_84367 ) ( ON ?auto_84369 ?auto_84368 ) ( not ( = ?auto_84367 ?auto_84368 ) ) ( not ( = ?auto_84367 ?auto_84369 ) ) ( not ( = ?auto_84367 ?auto_84371 ) ) ( not ( = ?auto_84368 ?auto_84369 ) ) ( not ( = ?auto_84368 ?auto_84371 ) ) ( not ( = ?auto_84369 ?auto_84371 ) ) ( CLEAR ?auto_84372 ) ( not ( = ?auto_84367 ?auto_84370 ) ) ( not ( = ?auto_84367 ?auto_84372 ) ) ( not ( = ?auto_84368 ?auto_84370 ) ) ( not ( = ?auto_84368 ?auto_84372 ) ) ( not ( = ?auto_84369 ?auto_84370 ) ) ( not ( = ?auto_84369 ?auto_84372 ) ) ( not ( = ?auto_84371 ?auto_84370 ) ) ( not ( = ?auto_84371 ?auto_84372 ) ) ( not ( = ?auto_84370 ?auto_84372 ) ) ( ON ?auto_84370 ?auto_84371 ) ( CLEAR ?auto_84370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84367 ?auto_84368 ?auto_84369 ?auto_84371 )
      ( MAKE-3PILE ?auto_84367 ?auto_84368 ?auto_84369 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84373 - BLOCK
      ?auto_84374 - BLOCK
      ?auto_84375 - BLOCK
    )
    :vars
    (
      ?auto_84377 - BLOCK
      ?auto_84378 - BLOCK
      ?auto_84376 - BLOCK
      ?auto_84380 - BLOCK
      ?auto_84379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84377 ?auto_84375 ) ( ON-TABLE ?auto_84373 ) ( ON ?auto_84374 ?auto_84373 ) ( ON ?auto_84375 ?auto_84374 ) ( not ( = ?auto_84373 ?auto_84374 ) ) ( not ( = ?auto_84373 ?auto_84375 ) ) ( not ( = ?auto_84373 ?auto_84377 ) ) ( not ( = ?auto_84374 ?auto_84375 ) ) ( not ( = ?auto_84374 ?auto_84377 ) ) ( not ( = ?auto_84375 ?auto_84377 ) ) ( not ( = ?auto_84373 ?auto_84378 ) ) ( not ( = ?auto_84373 ?auto_84376 ) ) ( not ( = ?auto_84374 ?auto_84378 ) ) ( not ( = ?auto_84374 ?auto_84376 ) ) ( not ( = ?auto_84375 ?auto_84378 ) ) ( not ( = ?auto_84375 ?auto_84376 ) ) ( not ( = ?auto_84377 ?auto_84378 ) ) ( not ( = ?auto_84377 ?auto_84376 ) ) ( not ( = ?auto_84378 ?auto_84376 ) ) ( ON ?auto_84378 ?auto_84377 ) ( CLEAR ?auto_84378 ) ( HOLDING ?auto_84376 ) ( CLEAR ?auto_84380 ) ( ON-TABLE ?auto_84379 ) ( ON ?auto_84380 ?auto_84379 ) ( not ( = ?auto_84379 ?auto_84380 ) ) ( not ( = ?auto_84379 ?auto_84376 ) ) ( not ( = ?auto_84380 ?auto_84376 ) ) ( not ( = ?auto_84373 ?auto_84380 ) ) ( not ( = ?auto_84373 ?auto_84379 ) ) ( not ( = ?auto_84374 ?auto_84380 ) ) ( not ( = ?auto_84374 ?auto_84379 ) ) ( not ( = ?auto_84375 ?auto_84380 ) ) ( not ( = ?auto_84375 ?auto_84379 ) ) ( not ( = ?auto_84377 ?auto_84380 ) ) ( not ( = ?auto_84377 ?auto_84379 ) ) ( not ( = ?auto_84378 ?auto_84380 ) ) ( not ( = ?auto_84378 ?auto_84379 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84379 ?auto_84380 ?auto_84376 )
      ( MAKE-3PILE ?auto_84373 ?auto_84374 ?auto_84375 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84381 - BLOCK
      ?auto_84382 - BLOCK
      ?auto_84383 - BLOCK
    )
    :vars
    (
      ?auto_84385 - BLOCK
      ?auto_84387 - BLOCK
      ?auto_84388 - BLOCK
      ?auto_84386 - BLOCK
      ?auto_84384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84385 ?auto_84383 ) ( ON-TABLE ?auto_84381 ) ( ON ?auto_84382 ?auto_84381 ) ( ON ?auto_84383 ?auto_84382 ) ( not ( = ?auto_84381 ?auto_84382 ) ) ( not ( = ?auto_84381 ?auto_84383 ) ) ( not ( = ?auto_84381 ?auto_84385 ) ) ( not ( = ?auto_84382 ?auto_84383 ) ) ( not ( = ?auto_84382 ?auto_84385 ) ) ( not ( = ?auto_84383 ?auto_84385 ) ) ( not ( = ?auto_84381 ?auto_84387 ) ) ( not ( = ?auto_84381 ?auto_84388 ) ) ( not ( = ?auto_84382 ?auto_84387 ) ) ( not ( = ?auto_84382 ?auto_84388 ) ) ( not ( = ?auto_84383 ?auto_84387 ) ) ( not ( = ?auto_84383 ?auto_84388 ) ) ( not ( = ?auto_84385 ?auto_84387 ) ) ( not ( = ?auto_84385 ?auto_84388 ) ) ( not ( = ?auto_84387 ?auto_84388 ) ) ( ON ?auto_84387 ?auto_84385 ) ( CLEAR ?auto_84386 ) ( ON-TABLE ?auto_84384 ) ( ON ?auto_84386 ?auto_84384 ) ( not ( = ?auto_84384 ?auto_84386 ) ) ( not ( = ?auto_84384 ?auto_84388 ) ) ( not ( = ?auto_84386 ?auto_84388 ) ) ( not ( = ?auto_84381 ?auto_84386 ) ) ( not ( = ?auto_84381 ?auto_84384 ) ) ( not ( = ?auto_84382 ?auto_84386 ) ) ( not ( = ?auto_84382 ?auto_84384 ) ) ( not ( = ?auto_84383 ?auto_84386 ) ) ( not ( = ?auto_84383 ?auto_84384 ) ) ( not ( = ?auto_84385 ?auto_84386 ) ) ( not ( = ?auto_84385 ?auto_84384 ) ) ( not ( = ?auto_84387 ?auto_84386 ) ) ( not ( = ?auto_84387 ?auto_84384 ) ) ( ON ?auto_84388 ?auto_84387 ) ( CLEAR ?auto_84388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84381 ?auto_84382 ?auto_84383 ?auto_84385 ?auto_84387 )
      ( MAKE-3PILE ?auto_84381 ?auto_84382 ?auto_84383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84389 - BLOCK
      ?auto_84390 - BLOCK
      ?auto_84391 - BLOCK
    )
    :vars
    (
      ?auto_84393 - BLOCK
      ?auto_84395 - BLOCK
      ?auto_84396 - BLOCK
      ?auto_84394 - BLOCK
      ?auto_84392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84393 ?auto_84391 ) ( ON-TABLE ?auto_84389 ) ( ON ?auto_84390 ?auto_84389 ) ( ON ?auto_84391 ?auto_84390 ) ( not ( = ?auto_84389 ?auto_84390 ) ) ( not ( = ?auto_84389 ?auto_84391 ) ) ( not ( = ?auto_84389 ?auto_84393 ) ) ( not ( = ?auto_84390 ?auto_84391 ) ) ( not ( = ?auto_84390 ?auto_84393 ) ) ( not ( = ?auto_84391 ?auto_84393 ) ) ( not ( = ?auto_84389 ?auto_84395 ) ) ( not ( = ?auto_84389 ?auto_84396 ) ) ( not ( = ?auto_84390 ?auto_84395 ) ) ( not ( = ?auto_84390 ?auto_84396 ) ) ( not ( = ?auto_84391 ?auto_84395 ) ) ( not ( = ?auto_84391 ?auto_84396 ) ) ( not ( = ?auto_84393 ?auto_84395 ) ) ( not ( = ?auto_84393 ?auto_84396 ) ) ( not ( = ?auto_84395 ?auto_84396 ) ) ( ON ?auto_84395 ?auto_84393 ) ( ON-TABLE ?auto_84394 ) ( not ( = ?auto_84394 ?auto_84392 ) ) ( not ( = ?auto_84394 ?auto_84396 ) ) ( not ( = ?auto_84392 ?auto_84396 ) ) ( not ( = ?auto_84389 ?auto_84392 ) ) ( not ( = ?auto_84389 ?auto_84394 ) ) ( not ( = ?auto_84390 ?auto_84392 ) ) ( not ( = ?auto_84390 ?auto_84394 ) ) ( not ( = ?auto_84391 ?auto_84392 ) ) ( not ( = ?auto_84391 ?auto_84394 ) ) ( not ( = ?auto_84393 ?auto_84392 ) ) ( not ( = ?auto_84393 ?auto_84394 ) ) ( not ( = ?auto_84395 ?auto_84392 ) ) ( not ( = ?auto_84395 ?auto_84394 ) ) ( ON ?auto_84396 ?auto_84395 ) ( CLEAR ?auto_84396 ) ( HOLDING ?auto_84392 ) ( CLEAR ?auto_84394 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84394 ?auto_84392 )
      ( MAKE-3PILE ?auto_84389 ?auto_84390 ?auto_84391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85574 - BLOCK
      ?auto_85575 - BLOCK
      ?auto_85576 - BLOCK
    )
    :vars
    (
      ?auto_85578 - BLOCK
      ?auto_85579 - BLOCK
      ?auto_85580 - BLOCK
      ?auto_85577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85578 ?auto_85576 ) ( ON-TABLE ?auto_85574 ) ( ON ?auto_85575 ?auto_85574 ) ( ON ?auto_85576 ?auto_85575 ) ( not ( = ?auto_85574 ?auto_85575 ) ) ( not ( = ?auto_85574 ?auto_85576 ) ) ( not ( = ?auto_85574 ?auto_85578 ) ) ( not ( = ?auto_85575 ?auto_85576 ) ) ( not ( = ?auto_85575 ?auto_85578 ) ) ( not ( = ?auto_85576 ?auto_85578 ) ) ( not ( = ?auto_85574 ?auto_85579 ) ) ( not ( = ?auto_85574 ?auto_85580 ) ) ( not ( = ?auto_85575 ?auto_85579 ) ) ( not ( = ?auto_85575 ?auto_85580 ) ) ( not ( = ?auto_85576 ?auto_85579 ) ) ( not ( = ?auto_85576 ?auto_85580 ) ) ( not ( = ?auto_85578 ?auto_85579 ) ) ( not ( = ?auto_85578 ?auto_85580 ) ) ( not ( = ?auto_85579 ?auto_85580 ) ) ( ON ?auto_85579 ?auto_85578 ) ( not ( = ?auto_85577 ?auto_85580 ) ) ( not ( = ?auto_85574 ?auto_85577 ) ) ( not ( = ?auto_85575 ?auto_85577 ) ) ( not ( = ?auto_85576 ?auto_85577 ) ) ( not ( = ?auto_85578 ?auto_85577 ) ) ( not ( = ?auto_85579 ?auto_85577 ) ) ( ON ?auto_85580 ?auto_85579 ) ( ON ?auto_85577 ?auto_85580 ) ( CLEAR ?auto_85577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85574 ?auto_85575 ?auto_85576 ?auto_85578 ?auto_85579 ?auto_85580 )
      ( MAKE-3PILE ?auto_85574 ?auto_85575 ?auto_85576 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84405 - BLOCK
      ?auto_84406 - BLOCK
      ?auto_84407 - BLOCK
    )
    :vars
    (
      ?auto_84408 - BLOCK
      ?auto_84411 - BLOCK
      ?auto_84409 - BLOCK
      ?auto_84412 - BLOCK
      ?auto_84410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84408 ?auto_84407 ) ( ON-TABLE ?auto_84405 ) ( ON ?auto_84406 ?auto_84405 ) ( ON ?auto_84407 ?auto_84406 ) ( not ( = ?auto_84405 ?auto_84406 ) ) ( not ( = ?auto_84405 ?auto_84407 ) ) ( not ( = ?auto_84405 ?auto_84408 ) ) ( not ( = ?auto_84406 ?auto_84407 ) ) ( not ( = ?auto_84406 ?auto_84408 ) ) ( not ( = ?auto_84407 ?auto_84408 ) ) ( not ( = ?auto_84405 ?auto_84411 ) ) ( not ( = ?auto_84405 ?auto_84409 ) ) ( not ( = ?auto_84406 ?auto_84411 ) ) ( not ( = ?auto_84406 ?auto_84409 ) ) ( not ( = ?auto_84407 ?auto_84411 ) ) ( not ( = ?auto_84407 ?auto_84409 ) ) ( not ( = ?auto_84408 ?auto_84411 ) ) ( not ( = ?auto_84408 ?auto_84409 ) ) ( not ( = ?auto_84411 ?auto_84409 ) ) ( ON ?auto_84411 ?auto_84408 ) ( not ( = ?auto_84412 ?auto_84410 ) ) ( not ( = ?auto_84412 ?auto_84409 ) ) ( not ( = ?auto_84410 ?auto_84409 ) ) ( not ( = ?auto_84405 ?auto_84410 ) ) ( not ( = ?auto_84405 ?auto_84412 ) ) ( not ( = ?auto_84406 ?auto_84410 ) ) ( not ( = ?auto_84406 ?auto_84412 ) ) ( not ( = ?auto_84407 ?auto_84410 ) ) ( not ( = ?auto_84407 ?auto_84412 ) ) ( not ( = ?auto_84408 ?auto_84410 ) ) ( not ( = ?auto_84408 ?auto_84412 ) ) ( not ( = ?auto_84411 ?auto_84410 ) ) ( not ( = ?auto_84411 ?auto_84412 ) ) ( ON ?auto_84409 ?auto_84411 ) ( ON ?auto_84410 ?auto_84409 ) ( CLEAR ?auto_84410 ) ( HOLDING ?auto_84412 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84412 )
      ( MAKE-3PILE ?auto_84405 ?auto_84406 ?auto_84407 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_84413 - BLOCK
      ?auto_84414 - BLOCK
      ?auto_84415 - BLOCK
    )
    :vars
    (
      ?auto_84419 - BLOCK
      ?auto_84420 - BLOCK
      ?auto_84418 - BLOCK
      ?auto_84416 - BLOCK
      ?auto_84417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84419 ?auto_84415 ) ( ON-TABLE ?auto_84413 ) ( ON ?auto_84414 ?auto_84413 ) ( ON ?auto_84415 ?auto_84414 ) ( not ( = ?auto_84413 ?auto_84414 ) ) ( not ( = ?auto_84413 ?auto_84415 ) ) ( not ( = ?auto_84413 ?auto_84419 ) ) ( not ( = ?auto_84414 ?auto_84415 ) ) ( not ( = ?auto_84414 ?auto_84419 ) ) ( not ( = ?auto_84415 ?auto_84419 ) ) ( not ( = ?auto_84413 ?auto_84420 ) ) ( not ( = ?auto_84413 ?auto_84418 ) ) ( not ( = ?auto_84414 ?auto_84420 ) ) ( not ( = ?auto_84414 ?auto_84418 ) ) ( not ( = ?auto_84415 ?auto_84420 ) ) ( not ( = ?auto_84415 ?auto_84418 ) ) ( not ( = ?auto_84419 ?auto_84420 ) ) ( not ( = ?auto_84419 ?auto_84418 ) ) ( not ( = ?auto_84420 ?auto_84418 ) ) ( ON ?auto_84420 ?auto_84419 ) ( not ( = ?auto_84416 ?auto_84417 ) ) ( not ( = ?auto_84416 ?auto_84418 ) ) ( not ( = ?auto_84417 ?auto_84418 ) ) ( not ( = ?auto_84413 ?auto_84417 ) ) ( not ( = ?auto_84413 ?auto_84416 ) ) ( not ( = ?auto_84414 ?auto_84417 ) ) ( not ( = ?auto_84414 ?auto_84416 ) ) ( not ( = ?auto_84415 ?auto_84417 ) ) ( not ( = ?auto_84415 ?auto_84416 ) ) ( not ( = ?auto_84419 ?auto_84417 ) ) ( not ( = ?auto_84419 ?auto_84416 ) ) ( not ( = ?auto_84420 ?auto_84417 ) ) ( not ( = ?auto_84420 ?auto_84416 ) ) ( ON ?auto_84418 ?auto_84420 ) ( ON ?auto_84417 ?auto_84418 ) ( ON ?auto_84416 ?auto_84417 ) ( CLEAR ?auto_84416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84413 ?auto_84414 ?auto_84415 ?auto_84419 ?auto_84420 ?auto_84418 ?auto_84417 )
      ( MAKE-3PILE ?auto_84413 ?auto_84414 ?auto_84415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84426 - BLOCK
      ?auto_84427 - BLOCK
      ?auto_84428 - BLOCK
      ?auto_84429 - BLOCK
      ?auto_84430 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84430 ) ( CLEAR ?auto_84429 ) ( ON-TABLE ?auto_84426 ) ( ON ?auto_84427 ?auto_84426 ) ( ON ?auto_84428 ?auto_84427 ) ( ON ?auto_84429 ?auto_84428 ) ( not ( = ?auto_84426 ?auto_84427 ) ) ( not ( = ?auto_84426 ?auto_84428 ) ) ( not ( = ?auto_84426 ?auto_84429 ) ) ( not ( = ?auto_84426 ?auto_84430 ) ) ( not ( = ?auto_84427 ?auto_84428 ) ) ( not ( = ?auto_84427 ?auto_84429 ) ) ( not ( = ?auto_84427 ?auto_84430 ) ) ( not ( = ?auto_84428 ?auto_84429 ) ) ( not ( = ?auto_84428 ?auto_84430 ) ) ( not ( = ?auto_84429 ?auto_84430 ) ) )
    :subtasks
    ( ( !STACK ?auto_84430 ?auto_84429 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84431 - BLOCK
      ?auto_84432 - BLOCK
      ?auto_84433 - BLOCK
      ?auto_84434 - BLOCK
      ?auto_84435 - BLOCK
    )
    :vars
    (
      ?auto_84436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84434 ) ( ON-TABLE ?auto_84431 ) ( ON ?auto_84432 ?auto_84431 ) ( ON ?auto_84433 ?auto_84432 ) ( ON ?auto_84434 ?auto_84433 ) ( not ( = ?auto_84431 ?auto_84432 ) ) ( not ( = ?auto_84431 ?auto_84433 ) ) ( not ( = ?auto_84431 ?auto_84434 ) ) ( not ( = ?auto_84431 ?auto_84435 ) ) ( not ( = ?auto_84432 ?auto_84433 ) ) ( not ( = ?auto_84432 ?auto_84434 ) ) ( not ( = ?auto_84432 ?auto_84435 ) ) ( not ( = ?auto_84433 ?auto_84434 ) ) ( not ( = ?auto_84433 ?auto_84435 ) ) ( not ( = ?auto_84434 ?auto_84435 ) ) ( ON ?auto_84435 ?auto_84436 ) ( CLEAR ?auto_84435 ) ( HAND-EMPTY ) ( not ( = ?auto_84431 ?auto_84436 ) ) ( not ( = ?auto_84432 ?auto_84436 ) ) ( not ( = ?auto_84433 ?auto_84436 ) ) ( not ( = ?auto_84434 ?auto_84436 ) ) ( not ( = ?auto_84435 ?auto_84436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84435 ?auto_84436 )
      ( MAKE-5PILE ?auto_84431 ?auto_84432 ?auto_84433 ?auto_84434 ?auto_84435 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84437 - BLOCK
      ?auto_84438 - BLOCK
      ?auto_84439 - BLOCK
      ?auto_84440 - BLOCK
      ?auto_84441 - BLOCK
    )
    :vars
    (
      ?auto_84442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84437 ) ( ON ?auto_84438 ?auto_84437 ) ( ON ?auto_84439 ?auto_84438 ) ( not ( = ?auto_84437 ?auto_84438 ) ) ( not ( = ?auto_84437 ?auto_84439 ) ) ( not ( = ?auto_84437 ?auto_84440 ) ) ( not ( = ?auto_84437 ?auto_84441 ) ) ( not ( = ?auto_84438 ?auto_84439 ) ) ( not ( = ?auto_84438 ?auto_84440 ) ) ( not ( = ?auto_84438 ?auto_84441 ) ) ( not ( = ?auto_84439 ?auto_84440 ) ) ( not ( = ?auto_84439 ?auto_84441 ) ) ( not ( = ?auto_84440 ?auto_84441 ) ) ( ON ?auto_84441 ?auto_84442 ) ( CLEAR ?auto_84441 ) ( not ( = ?auto_84437 ?auto_84442 ) ) ( not ( = ?auto_84438 ?auto_84442 ) ) ( not ( = ?auto_84439 ?auto_84442 ) ) ( not ( = ?auto_84440 ?auto_84442 ) ) ( not ( = ?auto_84441 ?auto_84442 ) ) ( HOLDING ?auto_84440 ) ( CLEAR ?auto_84439 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84437 ?auto_84438 ?auto_84439 ?auto_84440 )
      ( MAKE-5PILE ?auto_84437 ?auto_84438 ?auto_84439 ?auto_84440 ?auto_84441 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84443 - BLOCK
      ?auto_84444 - BLOCK
      ?auto_84445 - BLOCK
      ?auto_84446 - BLOCK
      ?auto_84447 - BLOCK
    )
    :vars
    (
      ?auto_84448 - BLOCK
      ?auto_84449 - BLOCK
      ?auto_84450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84443 ) ( ON ?auto_84444 ?auto_84443 ) ( ON ?auto_84445 ?auto_84444 ) ( not ( = ?auto_84443 ?auto_84444 ) ) ( not ( = ?auto_84443 ?auto_84445 ) ) ( not ( = ?auto_84443 ?auto_84446 ) ) ( not ( = ?auto_84443 ?auto_84447 ) ) ( not ( = ?auto_84444 ?auto_84445 ) ) ( not ( = ?auto_84444 ?auto_84446 ) ) ( not ( = ?auto_84444 ?auto_84447 ) ) ( not ( = ?auto_84445 ?auto_84446 ) ) ( not ( = ?auto_84445 ?auto_84447 ) ) ( not ( = ?auto_84446 ?auto_84447 ) ) ( ON ?auto_84447 ?auto_84448 ) ( not ( = ?auto_84443 ?auto_84448 ) ) ( not ( = ?auto_84444 ?auto_84448 ) ) ( not ( = ?auto_84445 ?auto_84448 ) ) ( not ( = ?auto_84446 ?auto_84448 ) ) ( not ( = ?auto_84447 ?auto_84448 ) ) ( CLEAR ?auto_84445 ) ( ON ?auto_84446 ?auto_84447 ) ( CLEAR ?auto_84446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84449 ) ( ON ?auto_84450 ?auto_84449 ) ( ON ?auto_84448 ?auto_84450 ) ( not ( = ?auto_84449 ?auto_84450 ) ) ( not ( = ?auto_84449 ?auto_84448 ) ) ( not ( = ?auto_84449 ?auto_84447 ) ) ( not ( = ?auto_84449 ?auto_84446 ) ) ( not ( = ?auto_84450 ?auto_84448 ) ) ( not ( = ?auto_84450 ?auto_84447 ) ) ( not ( = ?auto_84450 ?auto_84446 ) ) ( not ( = ?auto_84443 ?auto_84449 ) ) ( not ( = ?auto_84443 ?auto_84450 ) ) ( not ( = ?auto_84444 ?auto_84449 ) ) ( not ( = ?auto_84444 ?auto_84450 ) ) ( not ( = ?auto_84445 ?auto_84449 ) ) ( not ( = ?auto_84445 ?auto_84450 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84449 ?auto_84450 ?auto_84448 ?auto_84447 )
      ( MAKE-5PILE ?auto_84443 ?auto_84444 ?auto_84445 ?auto_84446 ?auto_84447 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84451 - BLOCK
      ?auto_84452 - BLOCK
      ?auto_84453 - BLOCK
      ?auto_84454 - BLOCK
      ?auto_84455 - BLOCK
    )
    :vars
    (
      ?auto_84457 - BLOCK
      ?auto_84456 - BLOCK
      ?auto_84458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84451 ) ( ON ?auto_84452 ?auto_84451 ) ( not ( = ?auto_84451 ?auto_84452 ) ) ( not ( = ?auto_84451 ?auto_84453 ) ) ( not ( = ?auto_84451 ?auto_84454 ) ) ( not ( = ?auto_84451 ?auto_84455 ) ) ( not ( = ?auto_84452 ?auto_84453 ) ) ( not ( = ?auto_84452 ?auto_84454 ) ) ( not ( = ?auto_84452 ?auto_84455 ) ) ( not ( = ?auto_84453 ?auto_84454 ) ) ( not ( = ?auto_84453 ?auto_84455 ) ) ( not ( = ?auto_84454 ?auto_84455 ) ) ( ON ?auto_84455 ?auto_84457 ) ( not ( = ?auto_84451 ?auto_84457 ) ) ( not ( = ?auto_84452 ?auto_84457 ) ) ( not ( = ?auto_84453 ?auto_84457 ) ) ( not ( = ?auto_84454 ?auto_84457 ) ) ( not ( = ?auto_84455 ?auto_84457 ) ) ( ON ?auto_84454 ?auto_84455 ) ( CLEAR ?auto_84454 ) ( ON-TABLE ?auto_84456 ) ( ON ?auto_84458 ?auto_84456 ) ( ON ?auto_84457 ?auto_84458 ) ( not ( = ?auto_84456 ?auto_84458 ) ) ( not ( = ?auto_84456 ?auto_84457 ) ) ( not ( = ?auto_84456 ?auto_84455 ) ) ( not ( = ?auto_84456 ?auto_84454 ) ) ( not ( = ?auto_84458 ?auto_84457 ) ) ( not ( = ?auto_84458 ?auto_84455 ) ) ( not ( = ?auto_84458 ?auto_84454 ) ) ( not ( = ?auto_84451 ?auto_84456 ) ) ( not ( = ?auto_84451 ?auto_84458 ) ) ( not ( = ?auto_84452 ?auto_84456 ) ) ( not ( = ?auto_84452 ?auto_84458 ) ) ( not ( = ?auto_84453 ?auto_84456 ) ) ( not ( = ?auto_84453 ?auto_84458 ) ) ( HOLDING ?auto_84453 ) ( CLEAR ?auto_84452 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84451 ?auto_84452 ?auto_84453 )
      ( MAKE-5PILE ?auto_84451 ?auto_84452 ?auto_84453 ?auto_84454 ?auto_84455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84459 - BLOCK
      ?auto_84460 - BLOCK
      ?auto_84461 - BLOCK
      ?auto_84462 - BLOCK
      ?auto_84463 - BLOCK
    )
    :vars
    (
      ?auto_84464 - BLOCK
      ?auto_84465 - BLOCK
      ?auto_84466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84459 ) ( ON ?auto_84460 ?auto_84459 ) ( not ( = ?auto_84459 ?auto_84460 ) ) ( not ( = ?auto_84459 ?auto_84461 ) ) ( not ( = ?auto_84459 ?auto_84462 ) ) ( not ( = ?auto_84459 ?auto_84463 ) ) ( not ( = ?auto_84460 ?auto_84461 ) ) ( not ( = ?auto_84460 ?auto_84462 ) ) ( not ( = ?auto_84460 ?auto_84463 ) ) ( not ( = ?auto_84461 ?auto_84462 ) ) ( not ( = ?auto_84461 ?auto_84463 ) ) ( not ( = ?auto_84462 ?auto_84463 ) ) ( ON ?auto_84463 ?auto_84464 ) ( not ( = ?auto_84459 ?auto_84464 ) ) ( not ( = ?auto_84460 ?auto_84464 ) ) ( not ( = ?auto_84461 ?auto_84464 ) ) ( not ( = ?auto_84462 ?auto_84464 ) ) ( not ( = ?auto_84463 ?auto_84464 ) ) ( ON ?auto_84462 ?auto_84463 ) ( ON-TABLE ?auto_84465 ) ( ON ?auto_84466 ?auto_84465 ) ( ON ?auto_84464 ?auto_84466 ) ( not ( = ?auto_84465 ?auto_84466 ) ) ( not ( = ?auto_84465 ?auto_84464 ) ) ( not ( = ?auto_84465 ?auto_84463 ) ) ( not ( = ?auto_84465 ?auto_84462 ) ) ( not ( = ?auto_84466 ?auto_84464 ) ) ( not ( = ?auto_84466 ?auto_84463 ) ) ( not ( = ?auto_84466 ?auto_84462 ) ) ( not ( = ?auto_84459 ?auto_84465 ) ) ( not ( = ?auto_84459 ?auto_84466 ) ) ( not ( = ?auto_84460 ?auto_84465 ) ) ( not ( = ?auto_84460 ?auto_84466 ) ) ( not ( = ?auto_84461 ?auto_84465 ) ) ( not ( = ?auto_84461 ?auto_84466 ) ) ( CLEAR ?auto_84460 ) ( ON ?auto_84461 ?auto_84462 ) ( CLEAR ?auto_84461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84465 ?auto_84466 ?auto_84464 ?auto_84463 ?auto_84462 )
      ( MAKE-5PILE ?auto_84459 ?auto_84460 ?auto_84461 ?auto_84462 ?auto_84463 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84467 - BLOCK
      ?auto_84468 - BLOCK
      ?auto_84469 - BLOCK
      ?auto_84470 - BLOCK
      ?auto_84471 - BLOCK
    )
    :vars
    (
      ?auto_84472 - BLOCK
      ?auto_84474 - BLOCK
      ?auto_84473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84467 ) ( not ( = ?auto_84467 ?auto_84468 ) ) ( not ( = ?auto_84467 ?auto_84469 ) ) ( not ( = ?auto_84467 ?auto_84470 ) ) ( not ( = ?auto_84467 ?auto_84471 ) ) ( not ( = ?auto_84468 ?auto_84469 ) ) ( not ( = ?auto_84468 ?auto_84470 ) ) ( not ( = ?auto_84468 ?auto_84471 ) ) ( not ( = ?auto_84469 ?auto_84470 ) ) ( not ( = ?auto_84469 ?auto_84471 ) ) ( not ( = ?auto_84470 ?auto_84471 ) ) ( ON ?auto_84471 ?auto_84472 ) ( not ( = ?auto_84467 ?auto_84472 ) ) ( not ( = ?auto_84468 ?auto_84472 ) ) ( not ( = ?auto_84469 ?auto_84472 ) ) ( not ( = ?auto_84470 ?auto_84472 ) ) ( not ( = ?auto_84471 ?auto_84472 ) ) ( ON ?auto_84470 ?auto_84471 ) ( ON-TABLE ?auto_84474 ) ( ON ?auto_84473 ?auto_84474 ) ( ON ?auto_84472 ?auto_84473 ) ( not ( = ?auto_84474 ?auto_84473 ) ) ( not ( = ?auto_84474 ?auto_84472 ) ) ( not ( = ?auto_84474 ?auto_84471 ) ) ( not ( = ?auto_84474 ?auto_84470 ) ) ( not ( = ?auto_84473 ?auto_84472 ) ) ( not ( = ?auto_84473 ?auto_84471 ) ) ( not ( = ?auto_84473 ?auto_84470 ) ) ( not ( = ?auto_84467 ?auto_84474 ) ) ( not ( = ?auto_84467 ?auto_84473 ) ) ( not ( = ?auto_84468 ?auto_84474 ) ) ( not ( = ?auto_84468 ?auto_84473 ) ) ( not ( = ?auto_84469 ?auto_84474 ) ) ( not ( = ?auto_84469 ?auto_84473 ) ) ( ON ?auto_84469 ?auto_84470 ) ( CLEAR ?auto_84469 ) ( HOLDING ?auto_84468 ) ( CLEAR ?auto_84467 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84467 ?auto_84468 )
      ( MAKE-5PILE ?auto_84467 ?auto_84468 ?auto_84469 ?auto_84470 ?auto_84471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84475 - BLOCK
      ?auto_84476 - BLOCK
      ?auto_84477 - BLOCK
      ?auto_84478 - BLOCK
      ?auto_84479 - BLOCK
    )
    :vars
    (
      ?auto_84482 - BLOCK
      ?auto_84481 - BLOCK
      ?auto_84480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84475 ) ( not ( = ?auto_84475 ?auto_84476 ) ) ( not ( = ?auto_84475 ?auto_84477 ) ) ( not ( = ?auto_84475 ?auto_84478 ) ) ( not ( = ?auto_84475 ?auto_84479 ) ) ( not ( = ?auto_84476 ?auto_84477 ) ) ( not ( = ?auto_84476 ?auto_84478 ) ) ( not ( = ?auto_84476 ?auto_84479 ) ) ( not ( = ?auto_84477 ?auto_84478 ) ) ( not ( = ?auto_84477 ?auto_84479 ) ) ( not ( = ?auto_84478 ?auto_84479 ) ) ( ON ?auto_84479 ?auto_84482 ) ( not ( = ?auto_84475 ?auto_84482 ) ) ( not ( = ?auto_84476 ?auto_84482 ) ) ( not ( = ?auto_84477 ?auto_84482 ) ) ( not ( = ?auto_84478 ?auto_84482 ) ) ( not ( = ?auto_84479 ?auto_84482 ) ) ( ON ?auto_84478 ?auto_84479 ) ( ON-TABLE ?auto_84481 ) ( ON ?auto_84480 ?auto_84481 ) ( ON ?auto_84482 ?auto_84480 ) ( not ( = ?auto_84481 ?auto_84480 ) ) ( not ( = ?auto_84481 ?auto_84482 ) ) ( not ( = ?auto_84481 ?auto_84479 ) ) ( not ( = ?auto_84481 ?auto_84478 ) ) ( not ( = ?auto_84480 ?auto_84482 ) ) ( not ( = ?auto_84480 ?auto_84479 ) ) ( not ( = ?auto_84480 ?auto_84478 ) ) ( not ( = ?auto_84475 ?auto_84481 ) ) ( not ( = ?auto_84475 ?auto_84480 ) ) ( not ( = ?auto_84476 ?auto_84481 ) ) ( not ( = ?auto_84476 ?auto_84480 ) ) ( not ( = ?auto_84477 ?auto_84481 ) ) ( not ( = ?auto_84477 ?auto_84480 ) ) ( ON ?auto_84477 ?auto_84478 ) ( CLEAR ?auto_84475 ) ( ON ?auto_84476 ?auto_84477 ) ( CLEAR ?auto_84476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84481 ?auto_84480 ?auto_84482 ?auto_84479 ?auto_84478 ?auto_84477 )
      ( MAKE-5PILE ?auto_84475 ?auto_84476 ?auto_84477 ?auto_84478 ?auto_84479 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84483 - BLOCK
      ?auto_84484 - BLOCK
      ?auto_84485 - BLOCK
      ?auto_84486 - BLOCK
      ?auto_84487 - BLOCK
    )
    :vars
    (
      ?auto_84489 - BLOCK
      ?auto_84488 - BLOCK
      ?auto_84490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84483 ?auto_84484 ) ) ( not ( = ?auto_84483 ?auto_84485 ) ) ( not ( = ?auto_84483 ?auto_84486 ) ) ( not ( = ?auto_84483 ?auto_84487 ) ) ( not ( = ?auto_84484 ?auto_84485 ) ) ( not ( = ?auto_84484 ?auto_84486 ) ) ( not ( = ?auto_84484 ?auto_84487 ) ) ( not ( = ?auto_84485 ?auto_84486 ) ) ( not ( = ?auto_84485 ?auto_84487 ) ) ( not ( = ?auto_84486 ?auto_84487 ) ) ( ON ?auto_84487 ?auto_84489 ) ( not ( = ?auto_84483 ?auto_84489 ) ) ( not ( = ?auto_84484 ?auto_84489 ) ) ( not ( = ?auto_84485 ?auto_84489 ) ) ( not ( = ?auto_84486 ?auto_84489 ) ) ( not ( = ?auto_84487 ?auto_84489 ) ) ( ON ?auto_84486 ?auto_84487 ) ( ON-TABLE ?auto_84488 ) ( ON ?auto_84490 ?auto_84488 ) ( ON ?auto_84489 ?auto_84490 ) ( not ( = ?auto_84488 ?auto_84490 ) ) ( not ( = ?auto_84488 ?auto_84489 ) ) ( not ( = ?auto_84488 ?auto_84487 ) ) ( not ( = ?auto_84488 ?auto_84486 ) ) ( not ( = ?auto_84490 ?auto_84489 ) ) ( not ( = ?auto_84490 ?auto_84487 ) ) ( not ( = ?auto_84490 ?auto_84486 ) ) ( not ( = ?auto_84483 ?auto_84488 ) ) ( not ( = ?auto_84483 ?auto_84490 ) ) ( not ( = ?auto_84484 ?auto_84488 ) ) ( not ( = ?auto_84484 ?auto_84490 ) ) ( not ( = ?auto_84485 ?auto_84488 ) ) ( not ( = ?auto_84485 ?auto_84490 ) ) ( ON ?auto_84485 ?auto_84486 ) ( ON ?auto_84484 ?auto_84485 ) ( CLEAR ?auto_84484 ) ( HOLDING ?auto_84483 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84483 )
      ( MAKE-5PILE ?auto_84483 ?auto_84484 ?auto_84485 ?auto_84486 ?auto_84487 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_84491 - BLOCK
      ?auto_84492 - BLOCK
      ?auto_84493 - BLOCK
      ?auto_84494 - BLOCK
      ?auto_84495 - BLOCK
    )
    :vars
    (
      ?auto_84497 - BLOCK
      ?auto_84498 - BLOCK
      ?auto_84496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84491 ?auto_84492 ) ) ( not ( = ?auto_84491 ?auto_84493 ) ) ( not ( = ?auto_84491 ?auto_84494 ) ) ( not ( = ?auto_84491 ?auto_84495 ) ) ( not ( = ?auto_84492 ?auto_84493 ) ) ( not ( = ?auto_84492 ?auto_84494 ) ) ( not ( = ?auto_84492 ?auto_84495 ) ) ( not ( = ?auto_84493 ?auto_84494 ) ) ( not ( = ?auto_84493 ?auto_84495 ) ) ( not ( = ?auto_84494 ?auto_84495 ) ) ( ON ?auto_84495 ?auto_84497 ) ( not ( = ?auto_84491 ?auto_84497 ) ) ( not ( = ?auto_84492 ?auto_84497 ) ) ( not ( = ?auto_84493 ?auto_84497 ) ) ( not ( = ?auto_84494 ?auto_84497 ) ) ( not ( = ?auto_84495 ?auto_84497 ) ) ( ON ?auto_84494 ?auto_84495 ) ( ON-TABLE ?auto_84498 ) ( ON ?auto_84496 ?auto_84498 ) ( ON ?auto_84497 ?auto_84496 ) ( not ( = ?auto_84498 ?auto_84496 ) ) ( not ( = ?auto_84498 ?auto_84497 ) ) ( not ( = ?auto_84498 ?auto_84495 ) ) ( not ( = ?auto_84498 ?auto_84494 ) ) ( not ( = ?auto_84496 ?auto_84497 ) ) ( not ( = ?auto_84496 ?auto_84495 ) ) ( not ( = ?auto_84496 ?auto_84494 ) ) ( not ( = ?auto_84491 ?auto_84498 ) ) ( not ( = ?auto_84491 ?auto_84496 ) ) ( not ( = ?auto_84492 ?auto_84498 ) ) ( not ( = ?auto_84492 ?auto_84496 ) ) ( not ( = ?auto_84493 ?auto_84498 ) ) ( not ( = ?auto_84493 ?auto_84496 ) ) ( ON ?auto_84493 ?auto_84494 ) ( ON ?auto_84492 ?auto_84493 ) ( ON ?auto_84491 ?auto_84492 ) ( CLEAR ?auto_84491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84498 ?auto_84496 ?auto_84497 ?auto_84495 ?auto_84494 ?auto_84493 ?auto_84492 )
      ( MAKE-5PILE ?auto_84491 ?auto_84492 ?auto_84493 ?auto_84494 ?auto_84495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84501 - BLOCK
      ?auto_84502 - BLOCK
    )
    :vars
    (
      ?auto_84503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84503 ?auto_84502 ) ( CLEAR ?auto_84503 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84501 ) ( ON ?auto_84502 ?auto_84501 ) ( not ( = ?auto_84501 ?auto_84502 ) ) ( not ( = ?auto_84501 ?auto_84503 ) ) ( not ( = ?auto_84502 ?auto_84503 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84503 ?auto_84502 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84504 - BLOCK
      ?auto_84505 - BLOCK
    )
    :vars
    (
      ?auto_84506 - BLOCK
      ?auto_84507 - BLOCK
      ?auto_84508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84506 ?auto_84505 ) ( CLEAR ?auto_84506 ) ( ON-TABLE ?auto_84504 ) ( ON ?auto_84505 ?auto_84504 ) ( not ( = ?auto_84504 ?auto_84505 ) ) ( not ( = ?auto_84504 ?auto_84506 ) ) ( not ( = ?auto_84505 ?auto_84506 ) ) ( HOLDING ?auto_84507 ) ( CLEAR ?auto_84508 ) ( not ( = ?auto_84504 ?auto_84507 ) ) ( not ( = ?auto_84504 ?auto_84508 ) ) ( not ( = ?auto_84505 ?auto_84507 ) ) ( not ( = ?auto_84505 ?auto_84508 ) ) ( not ( = ?auto_84506 ?auto_84507 ) ) ( not ( = ?auto_84506 ?auto_84508 ) ) ( not ( = ?auto_84507 ?auto_84508 ) ) )
    :subtasks
    ( ( !STACK ?auto_84507 ?auto_84508 )
      ( MAKE-2PILE ?auto_84504 ?auto_84505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84509 - BLOCK
      ?auto_84510 - BLOCK
    )
    :vars
    (
      ?auto_84513 - BLOCK
      ?auto_84511 - BLOCK
      ?auto_84512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84513 ?auto_84510 ) ( ON-TABLE ?auto_84509 ) ( ON ?auto_84510 ?auto_84509 ) ( not ( = ?auto_84509 ?auto_84510 ) ) ( not ( = ?auto_84509 ?auto_84513 ) ) ( not ( = ?auto_84510 ?auto_84513 ) ) ( CLEAR ?auto_84511 ) ( not ( = ?auto_84509 ?auto_84512 ) ) ( not ( = ?auto_84509 ?auto_84511 ) ) ( not ( = ?auto_84510 ?auto_84512 ) ) ( not ( = ?auto_84510 ?auto_84511 ) ) ( not ( = ?auto_84513 ?auto_84512 ) ) ( not ( = ?auto_84513 ?auto_84511 ) ) ( not ( = ?auto_84512 ?auto_84511 ) ) ( ON ?auto_84512 ?auto_84513 ) ( CLEAR ?auto_84512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84509 ?auto_84510 ?auto_84513 )
      ( MAKE-2PILE ?auto_84509 ?auto_84510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84514 - BLOCK
      ?auto_84515 - BLOCK
    )
    :vars
    (
      ?auto_84516 - BLOCK
      ?auto_84517 - BLOCK
      ?auto_84518 - BLOCK
      ?auto_84520 - BLOCK
      ?auto_84519 - BLOCK
      ?auto_84521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84516 ?auto_84515 ) ( ON-TABLE ?auto_84514 ) ( ON ?auto_84515 ?auto_84514 ) ( not ( = ?auto_84514 ?auto_84515 ) ) ( not ( = ?auto_84514 ?auto_84516 ) ) ( not ( = ?auto_84515 ?auto_84516 ) ) ( not ( = ?auto_84514 ?auto_84517 ) ) ( not ( = ?auto_84514 ?auto_84518 ) ) ( not ( = ?auto_84515 ?auto_84517 ) ) ( not ( = ?auto_84515 ?auto_84518 ) ) ( not ( = ?auto_84516 ?auto_84517 ) ) ( not ( = ?auto_84516 ?auto_84518 ) ) ( not ( = ?auto_84517 ?auto_84518 ) ) ( ON ?auto_84517 ?auto_84516 ) ( CLEAR ?auto_84517 ) ( HOLDING ?auto_84518 ) ( CLEAR ?auto_84520 ) ( ON-TABLE ?auto_84519 ) ( ON ?auto_84521 ?auto_84519 ) ( ON ?auto_84520 ?auto_84521 ) ( not ( = ?auto_84519 ?auto_84521 ) ) ( not ( = ?auto_84519 ?auto_84520 ) ) ( not ( = ?auto_84519 ?auto_84518 ) ) ( not ( = ?auto_84521 ?auto_84520 ) ) ( not ( = ?auto_84521 ?auto_84518 ) ) ( not ( = ?auto_84520 ?auto_84518 ) ) ( not ( = ?auto_84514 ?auto_84520 ) ) ( not ( = ?auto_84514 ?auto_84519 ) ) ( not ( = ?auto_84514 ?auto_84521 ) ) ( not ( = ?auto_84515 ?auto_84520 ) ) ( not ( = ?auto_84515 ?auto_84519 ) ) ( not ( = ?auto_84515 ?auto_84521 ) ) ( not ( = ?auto_84516 ?auto_84520 ) ) ( not ( = ?auto_84516 ?auto_84519 ) ) ( not ( = ?auto_84516 ?auto_84521 ) ) ( not ( = ?auto_84517 ?auto_84520 ) ) ( not ( = ?auto_84517 ?auto_84519 ) ) ( not ( = ?auto_84517 ?auto_84521 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84519 ?auto_84521 ?auto_84520 ?auto_84518 )
      ( MAKE-2PILE ?auto_84514 ?auto_84515 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84522 - BLOCK
      ?auto_84523 - BLOCK
    )
    :vars
    (
      ?auto_84527 - BLOCK
      ?auto_84524 - BLOCK
      ?auto_84525 - BLOCK
      ?auto_84526 - BLOCK
      ?auto_84529 - BLOCK
      ?auto_84528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84527 ?auto_84523 ) ( ON-TABLE ?auto_84522 ) ( ON ?auto_84523 ?auto_84522 ) ( not ( = ?auto_84522 ?auto_84523 ) ) ( not ( = ?auto_84522 ?auto_84527 ) ) ( not ( = ?auto_84523 ?auto_84527 ) ) ( not ( = ?auto_84522 ?auto_84524 ) ) ( not ( = ?auto_84522 ?auto_84525 ) ) ( not ( = ?auto_84523 ?auto_84524 ) ) ( not ( = ?auto_84523 ?auto_84525 ) ) ( not ( = ?auto_84527 ?auto_84524 ) ) ( not ( = ?auto_84527 ?auto_84525 ) ) ( not ( = ?auto_84524 ?auto_84525 ) ) ( ON ?auto_84524 ?auto_84527 ) ( CLEAR ?auto_84526 ) ( ON-TABLE ?auto_84529 ) ( ON ?auto_84528 ?auto_84529 ) ( ON ?auto_84526 ?auto_84528 ) ( not ( = ?auto_84529 ?auto_84528 ) ) ( not ( = ?auto_84529 ?auto_84526 ) ) ( not ( = ?auto_84529 ?auto_84525 ) ) ( not ( = ?auto_84528 ?auto_84526 ) ) ( not ( = ?auto_84528 ?auto_84525 ) ) ( not ( = ?auto_84526 ?auto_84525 ) ) ( not ( = ?auto_84522 ?auto_84526 ) ) ( not ( = ?auto_84522 ?auto_84529 ) ) ( not ( = ?auto_84522 ?auto_84528 ) ) ( not ( = ?auto_84523 ?auto_84526 ) ) ( not ( = ?auto_84523 ?auto_84529 ) ) ( not ( = ?auto_84523 ?auto_84528 ) ) ( not ( = ?auto_84527 ?auto_84526 ) ) ( not ( = ?auto_84527 ?auto_84529 ) ) ( not ( = ?auto_84527 ?auto_84528 ) ) ( not ( = ?auto_84524 ?auto_84526 ) ) ( not ( = ?auto_84524 ?auto_84529 ) ) ( not ( = ?auto_84524 ?auto_84528 ) ) ( ON ?auto_84525 ?auto_84524 ) ( CLEAR ?auto_84525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84522 ?auto_84523 ?auto_84527 ?auto_84524 )
      ( MAKE-2PILE ?auto_84522 ?auto_84523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84530 - BLOCK
      ?auto_84531 - BLOCK
    )
    :vars
    (
      ?auto_84534 - BLOCK
      ?auto_84535 - BLOCK
      ?auto_84537 - BLOCK
      ?auto_84532 - BLOCK
      ?auto_84533 - BLOCK
      ?auto_84536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84534 ?auto_84531 ) ( ON-TABLE ?auto_84530 ) ( ON ?auto_84531 ?auto_84530 ) ( not ( = ?auto_84530 ?auto_84531 ) ) ( not ( = ?auto_84530 ?auto_84534 ) ) ( not ( = ?auto_84531 ?auto_84534 ) ) ( not ( = ?auto_84530 ?auto_84535 ) ) ( not ( = ?auto_84530 ?auto_84537 ) ) ( not ( = ?auto_84531 ?auto_84535 ) ) ( not ( = ?auto_84531 ?auto_84537 ) ) ( not ( = ?auto_84534 ?auto_84535 ) ) ( not ( = ?auto_84534 ?auto_84537 ) ) ( not ( = ?auto_84535 ?auto_84537 ) ) ( ON ?auto_84535 ?auto_84534 ) ( ON-TABLE ?auto_84532 ) ( ON ?auto_84533 ?auto_84532 ) ( not ( = ?auto_84532 ?auto_84533 ) ) ( not ( = ?auto_84532 ?auto_84536 ) ) ( not ( = ?auto_84532 ?auto_84537 ) ) ( not ( = ?auto_84533 ?auto_84536 ) ) ( not ( = ?auto_84533 ?auto_84537 ) ) ( not ( = ?auto_84536 ?auto_84537 ) ) ( not ( = ?auto_84530 ?auto_84536 ) ) ( not ( = ?auto_84530 ?auto_84532 ) ) ( not ( = ?auto_84530 ?auto_84533 ) ) ( not ( = ?auto_84531 ?auto_84536 ) ) ( not ( = ?auto_84531 ?auto_84532 ) ) ( not ( = ?auto_84531 ?auto_84533 ) ) ( not ( = ?auto_84534 ?auto_84536 ) ) ( not ( = ?auto_84534 ?auto_84532 ) ) ( not ( = ?auto_84534 ?auto_84533 ) ) ( not ( = ?auto_84535 ?auto_84536 ) ) ( not ( = ?auto_84535 ?auto_84532 ) ) ( not ( = ?auto_84535 ?auto_84533 ) ) ( ON ?auto_84537 ?auto_84535 ) ( CLEAR ?auto_84537 ) ( HOLDING ?auto_84536 ) ( CLEAR ?auto_84533 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84532 ?auto_84533 ?auto_84536 )
      ( MAKE-2PILE ?auto_84530 ?auto_84531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84538 - BLOCK
      ?auto_84539 - BLOCK
    )
    :vars
    (
      ?auto_84545 - BLOCK
      ?auto_84543 - BLOCK
      ?auto_84540 - BLOCK
      ?auto_84541 - BLOCK
      ?auto_84542 - BLOCK
      ?auto_84544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84545 ?auto_84539 ) ( ON-TABLE ?auto_84538 ) ( ON ?auto_84539 ?auto_84538 ) ( not ( = ?auto_84538 ?auto_84539 ) ) ( not ( = ?auto_84538 ?auto_84545 ) ) ( not ( = ?auto_84539 ?auto_84545 ) ) ( not ( = ?auto_84538 ?auto_84543 ) ) ( not ( = ?auto_84538 ?auto_84540 ) ) ( not ( = ?auto_84539 ?auto_84543 ) ) ( not ( = ?auto_84539 ?auto_84540 ) ) ( not ( = ?auto_84545 ?auto_84543 ) ) ( not ( = ?auto_84545 ?auto_84540 ) ) ( not ( = ?auto_84543 ?auto_84540 ) ) ( ON ?auto_84543 ?auto_84545 ) ( ON-TABLE ?auto_84541 ) ( ON ?auto_84542 ?auto_84541 ) ( not ( = ?auto_84541 ?auto_84542 ) ) ( not ( = ?auto_84541 ?auto_84544 ) ) ( not ( = ?auto_84541 ?auto_84540 ) ) ( not ( = ?auto_84542 ?auto_84544 ) ) ( not ( = ?auto_84542 ?auto_84540 ) ) ( not ( = ?auto_84544 ?auto_84540 ) ) ( not ( = ?auto_84538 ?auto_84544 ) ) ( not ( = ?auto_84538 ?auto_84541 ) ) ( not ( = ?auto_84538 ?auto_84542 ) ) ( not ( = ?auto_84539 ?auto_84544 ) ) ( not ( = ?auto_84539 ?auto_84541 ) ) ( not ( = ?auto_84539 ?auto_84542 ) ) ( not ( = ?auto_84545 ?auto_84544 ) ) ( not ( = ?auto_84545 ?auto_84541 ) ) ( not ( = ?auto_84545 ?auto_84542 ) ) ( not ( = ?auto_84543 ?auto_84544 ) ) ( not ( = ?auto_84543 ?auto_84541 ) ) ( not ( = ?auto_84543 ?auto_84542 ) ) ( ON ?auto_84540 ?auto_84543 ) ( CLEAR ?auto_84542 ) ( ON ?auto_84544 ?auto_84540 ) ( CLEAR ?auto_84544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84538 ?auto_84539 ?auto_84545 ?auto_84543 ?auto_84540 )
      ( MAKE-2PILE ?auto_84538 ?auto_84539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84546 - BLOCK
      ?auto_84547 - BLOCK
    )
    :vars
    (
      ?auto_84552 - BLOCK
      ?auto_84549 - BLOCK
      ?auto_84548 - BLOCK
      ?auto_84553 - BLOCK
      ?auto_84550 - BLOCK
      ?auto_84551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84552 ?auto_84547 ) ( ON-TABLE ?auto_84546 ) ( ON ?auto_84547 ?auto_84546 ) ( not ( = ?auto_84546 ?auto_84547 ) ) ( not ( = ?auto_84546 ?auto_84552 ) ) ( not ( = ?auto_84547 ?auto_84552 ) ) ( not ( = ?auto_84546 ?auto_84549 ) ) ( not ( = ?auto_84546 ?auto_84548 ) ) ( not ( = ?auto_84547 ?auto_84549 ) ) ( not ( = ?auto_84547 ?auto_84548 ) ) ( not ( = ?auto_84552 ?auto_84549 ) ) ( not ( = ?auto_84552 ?auto_84548 ) ) ( not ( = ?auto_84549 ?auto_84548 ) ) ( ON ?auto_84549 ?auto_84552 ) ( ON-TABLE ?auto_84553 ) ( not ( = ?auto_84553 ?auto_84550 ) ) ( not ( = ?auto_84553 ?auto_84551 ) ) ( not ( = ?auto_84553 ?auto_84548 ) ) ( not ( = ?auto_84550 ?auto_84551 ) ) ( not ( = ?auto_84550 ?auto_84548 ) ) ( not ( = ?auto_84551 ?auto_84548 ) ) ( not ( = ?auto_84546 ?auto_84551 ) ) ( not ( = ?auto_84546 ?auto_84553 ) ) ( not ( = ?auto_84546 ?auto_84550 ) ) ( not ( = ?auto_84547 ?auto_84551 ) ) ( not ( = ?auto_84547 ?auto_84553 ) ) ( not ( = ?auto_84547 ?auto_84550 ) ) ( not ( = ?auto_84552 ?auto_84551 ) ) ( not ( = ?auto_84552 ?auto_84553 ) ) ( not ( = ?auto_84552 ?auto_84550 ) ) ( not ( = ?auto_84549 ?auto_84551 ) ) ( not ( = ?auto_84549 ?auto_84553 ) ) ( not ( = ?auto_84549 ?auto_84550 ) ) ( ON ?auto_84548 ?auto_84549 ) ( ON ?auto_84551 ?auto_84548 ) ( CLEAR ?auto_84551 ) ( HOLDING ?auto_84550 ) ( CLEAR ?auto_84553 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84553 ?auto_84550 )
      ( MAKE-2PILE ?auto_84546 ?auto_84547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85847 - BLOCK
      ?auto_85848 - BLOCK
    )
    :vars
    (
      ?auto_85850 - BLOCK
      ?auto_85851 - BLOCK
      ?auto_85849 - BLOCK
      ?auto_85853 - BLOCK
      ?auto_85852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85850 ?auto_85848 ) ( ON-TABLE ?auto_85847 ) ( ON ?auto_85848 ?auto_85847 ) ( not ( = ?auto_85847 ?auto_85848 ) ) ( not ( = ?auto_85847 ?auto_85850 ) ) ( not ( = ?auto_85848 ?auto_85850 ) ) ( not ( = ?auto_85847 ?auto_85851 ) ) ( not ( = ?auto_85847 ?auto_85849 ) ) ( not ( = ?auto_85848 ?auto_85851 ) ) ( not ( = ?auto_85848 ?auto_85849 ) ) ( not ( = ?auto_85850 ?auto_85851 ) ) ( not ( = ?auto_85850 ?auto_85849 ) ) ( not ( = ?auto_85851 ?auto_85849 ) ) ( ON ?auto_85851 ?auto_85850 ) ( not ( = ?auto_85853 ?auto_85852 ) ) ( not ( = ?auto_85853 ?auto_85849 ) ) ( not ( = ?auto_85852 ?auto_85849 ) ) ( not ( = ?auto_85847 ?auto_85852 ) ) ( not ( = ?auto_85847 ?auto_85853 ) ) ( not ( = ?auto_85848 ?auto_85852 ) ) ( not ( = ?auto_85848 ?auto_85853 ) ) ( not ( = ?auto_85850 ?auto_85852 ) ) ( not ( = ?auto_85850 ?auto_85853 ) ) ( not ( = ?auto_85851 ?auto_85852 ) ) ( not ( = ?auto_85851 ?auto_85853 ) ) ( ON ?auto_85849 ?auto_85851 ) ( ON ?auto_85852 ?auto_85849 ) ( ON ?auto_85853 ?auto_85852 ) ( CLEAR ?auto_85853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85847 ?auto_85848 ?auto_85850 ?auto_85851 ?auto_85849 ?auto_85852 )
      ( MAKE-2PILE ?auto_85847 ?auto_85848 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84562 - BLOCK
      ?auto_84563 - BLOCK
    )
    :vars
    (
      ?auto_84565 - BLOCK
      ?auto_84569 - BLOCK
      ?auto_84564 - BLOCK
      ?auto_84568 - BLOCK
      ?auto_84567 - BLOCK
      ?auto_84566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84565 ?auto_84563 ) ( ON-TABLE ?auto_84562 ) ( ON ?auto_84563 ?auto_84562 ) ( not ( = ?auto_84562 ?auto_84563 ) ) ( not ( = ?auto_84562 ?auto_84565 ) ) ( not ( = ?auto_84563 ?auto_84565 ) ) ( not ( = ?auto_84562 ?auto_84569 ) ) ( not ( = ?auto_84562 ?auto_84564 ) ) ( not ( = ?auto_84563 ?auto_84569 ) ) ( not ( = ?auto_84563 ?auto_84564 ) ) ( not ( = ?auto_84565 ?auto_84569 ) ) ( not ( = ?auto_84565 ?auto_84564 ) ) ( not ( = ?auto_84569 ?auto_84564 ) ) ( ON ?auto_84569 ?auto_84565 ) ( not ( = ?auto_84568 ?auto_84567 ) ) ( not ( = ?auto_84568 ?auto_84566 ) ) ( not ( = ?auto_84568 ?auto_84564 ) ) ( not ( = ?auto_84567 ?auto_84566 ) ) ( not ( = ?auto_84567 ?auto_84564 ) ) ( not ( = ?auto_84566 ?auto_84564 ) ) ( not ( = ?auto_84562 ?auto_84566 ) ) ( not ( = ?auto_84562 ?auto_84568 ) ) ( not ( = ?auto_84562 ?auto_84567 ) ) ( not ( = ?auto_84563 ?auto_84566 ) ) ( not ( = ?auto_84563 ?auto_84568 ) ) ( not ( = ?auto_84563 ?auto_84567 ) ) ( not ( = ?auto_84565 ?auto_84566 ) ) ( not ( = ?auto_84565 ?auto_84568 ) ) ( not ( = ?auto_84565 ?auto_84567 ) ) ( not ( = ?auto_84569 ?auto_84566 ) ) ( not ( = ?auto_84569 ?auto_84568 ) ) ( not ( = ?auto_84569 ?auto_84567 ) ) ( ON ?auto_84564 ?auto_84569 ) ( ON ?auto_84566 ?auto_84564 ) ( ON ?auto_84567 ?auto_84566 ) ( CLEAR ?auto_84567 ) ( HOLDING ?auto_84568 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84568 )
      ( MAKE-2PILE ?auto_84562 ?auto_84563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84570 - BLOCK
      ?auto_84571 - BLOCK
    )
    :vars
    (
      ?auto_84572 - BLOCK
      ?auto_84574 - BLOCK
      ?auto_84573 - BLOCK
      ?auto_84575 - BLOCK
      ?auto_84577 - BLOCK
      ?auto_84576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84572 ?auto_84571 ) ( ON-TABLE ?auto_84570 ) ( ON ?auto_84571 ?auto_84570 ) ( not ( = ?auto_84570 ?auto_84571 ) ) ( not ( = ?auto_84570 ?auto_84572 ) ) ( not ( = ?auto_84571 ?auto_84572 ) ) ( not ( = ?auto_84570 ?auto_84574 ) ) ( not ( = ?auto_84570 ?auto_84573 ) ) ( not ( = ?auto_84571 ?auto_84574 ) ) ( not ( = ?auto_84571 ?auto_84573 ) ) ( not ( = ?auto_84572 ?auto_84574 ) ) ( not ( = ?auto_84572 ?auto_84573 ) ) ( not ( = ?auto_84574 ?auto_84573 ) ) ( ON ?auto_84574 ?auto_84572 ) ( not ( = ?auto_84575 ?auto_84577 ) ) ( not ( = ?auto_84575 ?auto_84576 ) ) ( not ( = ?auto_84575 ?auto_84573 ) ) ( not ( = ?auto_84577 ?auto_84576 ) ) ( not ( = ?auto_84577 ?auto_84573 ) ) ( not ( = ?auto_84576 ?auto_84573 ) ) ( not ( = ?auto_84570 ?auto_84576 ) ) ( not ( = ?auto_84570 ?auto_84575 ) ) ( not ( = ?auto_84570 ?auto_84577 ) ) ( not ( = ?auto_84571 ?auto_84576 ) ) ( not ( = ?auto_84571 ?auto_84575 ) ) ( not ( = ?auto_84571 ?auto_84577 ) ) ( not ( = ?auto_84572 ?auto_84576 ) ) ( not ( = ?auto_84572 ?auto_84575 ) ) ( not ( = ?auto_84572 ?auto_84577 ) ) ( not ( = ?auto_84574 ?auto_84576 ) ) ( not ( = ?auto_84574 ?auto_84575 ) ) ( not ( = ?auto_84574 ?auto_84577 ) ) ( ON ?auto_84573 ?auto_84574 ) ( ON ?auto_84576 ?auto_84573 ) ( ON ?auto_84577 ?auto_84576 ) ( ON ?auto_84575 ?auto_84577 ) ( CLEAR ?auto_84575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84570 ?auto_84571 ?auto_84572 ?auto_84574 ?auto_84573 ?auto_84576 ?auto_84577 )
      ( MAKE-2PILE ?auto_84570 ?auto_84571 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84584 - BLOCK
      ?auto_84585 - BLOCK
      ?auto_84586 - BLOCK
      ?auto_84587 - BLOCK
      ?auto_84588 - BLOCK
      ?auto_84589 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84589 ) ( CLEAR ?auto_84588 ) ( ON-TABLE ?auto_84584 ) ( ON ?auto_84585 ?auto_84584 ) ( ON ?auto_84586 ?auto_84585 ) ( ON ?auto_84587 ?auto_84586 ) ( ON ?auto_84588 ?auto_84587 ) ( not ( = ?auto_84584 ?auto_84585 ) ) ( not ( = ?auto_84584 ?auto_84586 ) ) ( not ( = ?auto_84584 ?auto_84587 ) ) ( not ( = ?auto_84584 ?auto_84588 ) ) ( not ( = ?auto_84584 ?auto_84589 ) ) ( not ( = ?auto_84585 ?auto_84586 ) ) ( not ( = ?auto_84585 ?auto_84587 ) ) ( not ( = ?auto_84585 ?auto_84588 ) ) ( not ( = ?auto_84585 ?auto_84589 ) ) ( not ( = ?auto_84586 ?auto_84587 ) ) ( not ( = ?auto_84586 ?auto_84588 ) ) ( not ( = ?auto_84586 ?auto_84589 ) ) ( not ( = ?auto_84587 ?auto_84588 ) ) ( not ( = ?auto_84587 ?auto_84589 ) ) ( not ( = ?auto_84588 ?auto_84589 ) ) )
    :subtasks
    ( ( !STACK ?auto_84589 ?auto_84588 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84590 - BLOCK
      ?auto_84591 - BLOCK
      ?auto_84592 - BLOCK
      ?auto_84593 - BLOCK
      ?auto_84594 - BLOCK
      ?auto_84595 - BLOCK
    )
    :vars
    (
      ?auto_84596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84594 ) ( ON-TABLE ?auto_84590 ) ( ON ?auto_84591 ?auto_84590 ) ( ON ?auto_84592 ?auto_84591 ) ( ON ?auto_84593 ?auto_84592 ) ( ON ?auto_84594 ?auto_84593 ) ( not ( = ?auto_84590 ?auto_84591 ) ) ( not ( = ?auto_84590 ?auto_84592 ) ) ( not ( = ?auto_84590 ?auto_84593 ) ) ( not ( = ?auto_84590 ?auto_84594 ) ) ( not ( = ?auto_84590 ?auto_84595 ) ) ( not ( = ?auto_84591 ?auto_84592 ) ) ( not ( = ?auto_84591 ?auto_84593 ) ) ( not ( = ?auto_84591 ?auto_84594 ) ) ( not ( = ?auto_84591 ?auto_84595 ) ) ( not ( = ?auto_84592 ?auto_84593 ) ) ( not ( = ?auto_84592 ?auto_84594 ) ) ( not ( = ?auto_84592 ?auto_84595 ) ) ( not ( = ?auto_84593 ?auto_84594 ) ) ( not ( = ?auto_84593 ?auto_84595 ) ) ( not ( = ?auto_84594 ?auto_84595 ) ) ( ON ?auto_84595 ?auto_84596 ) ( CLEAR ?auto_84595 ) ( HAND-EMPTY ) ( not ( = ?auto_84590 ?auto_84596 ) ) ( not ( = ?auto_84591 ?auto_84596 ) ) ( not ( = ?auto_84592 ?auto_84596 ) ) ( not ( = ?auto_84593 ?auto_84596 ) ) ( not ( = ?auto_84594 ?auto_84596 ) ) ( not ( = ?auto_84595 ?auto_84596 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84595 ?auto_84596 )
      ( MAKE-6PILE ?auto_84590 ?auto_84591 ?auto_84592 ?auto_84593 ?auto_84594 ?auto_84595 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84597 - BLOCK
      ?auto_84598 - BLOCK
      ?auto_84599 - BLOCK
      ?auto_84600 - BLOCK
      ?auto_84601 - BLOCK
      ?auto_84602 - BLOCK
    )
    :vars
    (
      ?auto_84603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84597 ) ( ON ?auto_84598 ?auto_84597 ) ( ON ?auto_84599 ?auto_84598 ) ( ON ?auto_84600 ?auto_84599 ) ( not ( = ?auto_84597 ?auto_84598 ) ) ( not ( = ?auto_84597 ?auto_84599 ) ) ( not ( = ?auto_84597 ?auto_84600 ) ) ( not ( = ?auto_84597 ?auto_84601 ) ) ( not ( = ?auto_84597 ?auto_84602 ) ) ( not ( = ?auto_84598 ?auto_84599 ) ) ( not ( = ?auto_84598 ?auto_84600 ) ) ( not ( = ?auto_84598 ?auto_84601 ) ) ( not ( = ?auto_84598 ?auto_84602 ) ) ( not ( = ?auto_84599 ?auto_84600 ) ) ( not ( = ?auto_84599 ?auto_84601 ) ) ( not ( = ?auto_84599 ?auto_84602 ) ) ( not ( = ?auto_84600 ?auto_84601 ) ) ( not ( = ?auto_84600 ?auto_84602 ) ) ( not ( = ?auto_84601 ?auto_84602 ) ) ( ON ?auto_84602 ?auto_84603 ) ( CLEAR ?auto_84602 ) ( not ( = ?auto_84597 ?auto_84603 ) ) ( not ( = ?auto_84598 ?auto_84603 ) ) ( not ( = ?auto_84599 ?auto_84603 ) ) ( not ( = ?auto_84600 ?auto_84603 ) ) ( not ( = ?auto_84601 ?auto_84603 ) ) ( not ( = ?auto_84602 ?auto_84603 ) ) ( HOLDING ?auto_84601 ) ( CLEAR ?auto_84600 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84597 ?auto_84598 ?auto_84599 ?auto_84600 ?auto_84601 )
      ( MAKE-6PILE ?auto_84597 ?auto_84598 ?auto_84599 ?auto_84600 ?auto_84601 ?auto_84602 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84604 - BLOCK
      ?auto_84605 - BLOCK
      ?auto_84606 - BLOCK
      ?auto_84607 - BLOCK
      ?auto_84608 - BLOCK
      ?auto_84609 - BLOCK
    )
    :vars
    (
      ?auto_84610 - BLOCK
      ?auto_84611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84604 ) ( ON ?auto_84605 ?auto_84604 ) ( ON ?auto_84606 ?auto_84605 ) ( ON ?auto_84607 ?auto_84606 ) ( not ( = ?auto_84604 ?auto_84605 ) ) ( not ( = ?auto_84604 ?auto_84606 ) ) ( not ( = ?auto_84604 ?auto_84607 ) ) ( not ( = ?auto_84604 ?auto_84608 ) ) ( not ( = ?auto_84604 ?auto_84609 ) ) ( not ( = ?auto_84605 ?auto_84606 ) ) ( not ( = ?auto_84605 ?auto_84607 ) ) ( not ( = ?auto_84605 ?auto_84608 ) ) ( not ( = ?auto_84605 ?auto_84609 ) ) ( not ( = ?auto_84606 ?auto_84607 ) ) ( not ( = ?auto_84606 ?auto_84608 ) ) ( not ( = ?auto_84606 ?auto_84609 ) ) ( not ( = ?auto_84607 ?auto_84608 ) ) ( not ( = ?auto_84607 ?auto_84609 ) ) ( not ( = ?auto_84608 ?auto_84609 ) ) ( ON ?auto_84609 ?auto_84610 ) ( not ( = ?auto_84604 ?auto_84610 ) ) ( not ( = ?auto_84605 ?auto_84610 ) ) ( not ( = ?auto_84606 ?auto_84610 ) ) ( not ( = ?auto_84607 ?auto_84610 ) ) ( not ( = ?auto_84608 ?auto_84610 ) ) ( not ( = ?auto_84609 ?auto_84610 ) ) ( CLEAR ?auto_84607 ) ( ON ?auto_84608 ?auto_84609 ) ( CLEAR ?auto_84608 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84611 ) ( ON ?auto_84610 ?auto_84611 ) ( not ( = ?auto_84611 ?auto_84610 ) ) ( not ( = ?auto_84611 ?auto_84609 ) ) ( not ( = ?auto_84611 ?auto_84608 ) ) ( not ( = ?auto_84604 ?auto_84611 ) ) ( not ( = ?auto_84605 ?auto_84611 ) ) ( not ( = ?auto_84606 ?auto_84611 ) ) ( not ( = ?auto_84607 ?auto_84611 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84611 ?auto_84610 ?auto_84609 )
      ( MAKE-6PILE ?auto_84604 ?auto_84605 ?auto_84606 ?auto_84607 ?auto_84608 ?auto_84609 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84612 - BLOCK
      ?auto_84613 - BLOCK
      ?auto_84614 - BLOCK
      ?auto_84615 - BLOCK
      ?auto_84616 - BLOCK
      ?auto_84617 - BLOCK
    )
    :vars
    (
      ?auto_84619 - BLOCK
      ?auto_84618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84612 ) ( ON ?auto_84613 ?auto_84612 ) ( ON ?auto_84614 ?auto_84613 ) ( not ( = ?auto_84612 ?auto_84613 ) ) ( not ( = ?auto_84612 ?auto_84614 ) ) ( not ( = ?auto_84612 ?auto_84615 ) ) ( not ( = ?auto_84612 ?auto_84616 ) ) ( not ( = ?auto_84612 ?auto_84617 ) ) ( not ( = ?auto_84613 ?auto_84614 ) ) ( not ( = ?auto_84613 ?auto_84615 ) ) ( not ( = ?auto_84613 ?auto_84616 ) ) ( not ( = ?auto_84613 ?auto_84617 ) ) ( not ( = ?auto_84614 ?auto_84615 ) ) ( not ( = ?auto_84614 ?auto_84616 ) ) ( not ( = ?auto_84614 ?auto_84617 ) ) ( not ( = ?auto_84615 ?auto_84616 ) ) ( not ( = ?auto_84615 ?auto_84617 ) ) ( not ( = ?auto_84616 ?auto_84617 ) ) ( ON ?auto_84617 ?auto_84619 ) ( not ( = ?auto_84612 ?auto_84619 ) ) ( not ( = ?auto_84613 ?auto_84619 ) ) ( not ( = ?auto_84614 ?auto_84619 ) ) ( not ( = ?auto_84615 ?auto_84619 ) ) ( not ( = ?auto_84616 ?auto_84619 ) ) ( not ( = ?auto_84617 ?auto_84619 ) ) ( ON ?auto_84616 ?auto_84617 ) ( CLEAR ?auto_84616 ) ( ON-TABLE ?auto_84618 ) ( ON ?auto_84619 ?auto_84618 ) ( not ( = ?auto_84618 ?auto_84619 ) ) ( not ( = ?auto_84618 ?auto_84617 ) ) ( not ( = ?auto_84618 ?auto_84616 ) ) ( not ( = ?auto_84612 ?auto_84618 ) ) ( not ( = ?auto_84613 ?auto_84618 ) ) ( not ( = ?auto_84614 ?auto_84618 ) ) ( not ( = ?auto_84615 ?auto_84618 ) ) ( HOLDING ?auto_84615 ) ( CLEAR ?auto_84614 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84612 ?auto_84613 ?auto_84614 ?auto_84615 )
      ( MAKE-6PILE ?auto_84612 ?auto_84613 ?auto_84614 ?auto_84615 ?auto_84616 ?auto_84617 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84620 - BLOCK
      ?auto_84621 - BLOCK
      ?auto_84622 - BLOCK
      ?auto_84623 - BLOCK
      ?auto_84624 - BLOCK
      ?auto_84625 - BLOCK
    )
    :vars
    (
      ?auto_84627 - BLOCK
      ?auto_84626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84620 ) ( ON ?auto_84621 ?auto_84620 ) ( ON ?auto_84622 ?auto_84621 ) ( not ( = ?auto_84620 ?auto_84621 ) ) ( not ( = ?auto_84620 ?auto_84622 ) ) ( not ( = ?auto_84620 ?auto_84623 ) ) ( not ( = ?auto_84620 ?auto_84624 ) ) ( not ( = ?auto_84620 ?auto_84625 ) ) ( not ( = ?auto_84621 ?auto_84622 ) ) ( not ( = ?auto_84621 ?auto_84623 ) ) ( not ( = ?auto_84621 ?auto_84624 ) ) ( not ( = ?auto_84621 ?auto_84625 ) ) ( not ( = ?auto_84622 ?auto_84623 ) ) ( not ( = ?auto_84622 ?auto_84624 ) ) ( not ( = ?auto_84622 ?auto_84625 ) ) ( not ( = ?auto_84623 ?auto_84624 ) ) ( not ( = ?auto_84623 ?auto_84625 ) ) ( not ( = ?auto_84624 ?auto_84625 ) ) ( ON ?auto_84625 ?auto_84627 ) ( not ( = ?auto_84620 ?auto_84627 ) ) ( not ( = ?auto_84621 ?auto_84627 ) ) ( not ( = ?auto_84622 ?auto_84627 ) ) ( not ( = ?auto_84623 ?auto_84627 ) ) ( not ( = ?auto_84624 ?auto_84627 ) ) ( not ( = ?auto_84625 ?auto_84627 ) ) ( ON ?auto_84624 ?auto_84625 ) ( ON-TABLE ?auto_84626 ) ( ON ?auto_84627 ?auto_84626 ) ( not ( = ?auto_84626 ?auto_84627 ) ) ( not ( = ?auto_84626 ?auto_84625 ) ) ( not ( = ?auto_84626 ?auto_84624 ) ) ( not ( = ?auto_84620 ?auto_84626 ) ) ( not ( = ?auto_84621 ?auto_84626 ) ) ( not ( = ?auto_84622 ?auto_84626 ) ) ( not ( = ?auto_84623 ?auto_84626 ) ) ( CLEAR ?auto_84622 ) ( ON ?auto_84623 ?auto_84624 ) ( CLEAR ?auto_84623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84626 ?auto_84627 ?auto_84625 ?auto_84624 )
      ( MAKE-6PILE ?auto_84620 ?auto_84621 ?auto_84622 ?auto_84623 ?auto_84624 ?auto_84625 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84628 - BLOCK
      ?auto_84629 - BLOCK
      ?auto_84630 - BLOCK
      ?auto_84631 - BLOCK
      ?auto_84632 - BLOCK
      ?auto_84633 - BLOCK
    )
    :vars
    (
      ?auto_84635 - BLOCK
      ?auto_84634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84628 ) ( ON ?auto_84629 ?auto_84628 ) ( not ( = ?auto_84628 ?auto_84629 ) ) ( not ( = ?auto_84628 ?auto_84630 ) ) ( not ( = ?auto_84628 ?auto_84631 ) ) ( not ( = ?auto_84628 ?auto_84632 ) ) ( not ( = ?auto_84628 ?auto_84633 ) ) ( not ( = ?auto_84629 ?auto_84630 ) ) ( not ( = ?auto_84629 ?auto_84631 ) ) ( not ( = ?auto_84629 ?auto_84632 ) ) ( not ( = ?auto_84629 ?auto_84633 ) ) ( not ( = ?auto_84630 ?auto_84631 ) ) ( not ( = ?auto_84630 ?auto_84632 ) ) ( not ( = ?auto_84630 ?auto_84633 ) ) ( not ( = ?auto_84631 ?auto_84632 ) ) ( not ( = ?auto_84631 ?auto_84633 ) ) ( not ( = ?auto_84632 ?auto_84633 ) ) ( ON ?auto_84633 ?auto_84635 ) ( not ( = ?auto_84628 ?auto_84635 ) ) ( not ( = ?auto_84629 ?auto_84635 ) ) ( not ( = ?auto_84630 ?auto_84635 ) ) ( not ( = ?auto_84631 ?auto_84635 ) ) ( not ( = ?auto_84632 ?auto_84635 ) ) ( not ( = ?auto_84633 ?auto_84635 ) ) ( ON ?auto_84632 ?auto_84633 ) ( ON-TABLE ?auto_84634 ) ( ON ?auto_84635 ?auto_84634 ) ( not ( = ?auto_84634 ?auto_84635 ) ) ( not ( = ?auto_84634 ?auto_84633 ) ) ( not ( = ?auto_84634 ?auto_84632 ) ) ( not ( = ?auto_84628 ?auto_84634 ) ) ( not ( = ?auto_84629 ?auto_84634 ) ) ( not ( = ?auto_84630 ?auto_84634 ) ) ( not ( = ?auto_84631 ?auto_84634 ) ) ( ON ?auto_84631 ?auto_84632 ) ( CLEAR ?auto_84631 ) ( HOLDING ?auto_84630 ) ( CLEAR ?auto_84629 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84628 ?auto_84629 ?auto_84630 )
      ( MAKE-6PILE ?auto_84628 ?auto_84629 ?auto_84630 ?auto_84631 ?auto_84632 ?auto_84633 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84636 - BLOCK
      ?auto_84637 - BLOCK
      ?auto_84638 - BLOCK
      ?auto_84639 - BLOCK
      ?auto_84640 - BLOCK
      ?auto_84641 - BLOCK
    )
    :vars
    (
      ?auto_84643 - BLOCK
      ?auto_84642 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84636 ) ( ON ?auto_84637 ?auto_84636 ) ( not ( = ?auto_84636 ?auto_84637 ) ) ( not ( = ?auto_84636 ?auto_84638 ) ) ( not ( = ?auto_84636 ?auto_84639 ) ) ( not ( = ?auto_84636 ?auto_84640 ) ) ( not ( = ?auto_84636 ?auto_84641 ) ) ( not ( = ?auto_84637 ?auto_84638 ) ) ( not ( = ?auto_84637 ?auto_84639 ) ) ( not ( = ?auto_84637 ?auto_84640 ) ) ( not ( = ?auto_84637 ?auto_84641 ) ) ( not ( = ?auto_84638 ?auto_84639 ) ) ( not ( = ?auto_84638 ?auto_84640 ) ) ( not ( = ?auto_84638 ?auto_84641 ) ) ( not ( = ?auto_84639 ?auto_84640 ) ) ( not ( = ?auto_84639 ?auto_84641 ) ) ( not ( = ?auto_84640 ?auto_84641 ) ) ( ON ?auto_84641 ?auto_84643 ) ( not ( = ?auto_84636 ?auto_84643 ) ) ( not ( = ?auto_84637 ?auto_84643 ) ) ( not ( = ?auto_84638 ?auto_84643 ) ) ( not ( = ?auto_84639 ?auto_84643 ) ) ( not ( = ?auto_84640 ?auto_84643 ) ) ( not ( = ?auto_84641 ?auto_84643 ) ) ( ON ?auto_84640 ?auto_84641 ) ( ON-TABLE ?auto_84642 ) ( ON ?auto_84643 ?auto_84642 ) ( not ( = ?auto_84642 ?auto_84643 ) ) ( not ( = ?auto_84642 ?auto_84641 ) ) ( not ( = ?auto_84642 ?auto_84640 ) ) ( not ( = ?auto_84636 ?auto_84642 ) ) ( not ( = ?auto_84637 ?auto_84642 ) ) ( not ( = ?auto_84638 ?auto_84642 ) ) ( not ( = ?auto_84639 ?auto_84642 ) ) ( ON ?auto_84639 ?auto_84640 ) ( CLEAR ?auto_84637 ) ( ON ?auto_84638 ?auto_84639 ) ( CLEAR ?auto_84638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84642 ?auto_84643 ?auto_84641 ?auto_84640 ?auto_84639 )
      ( MAKE-6PILE ?auto_84636 ?auto_84637 ?auto_84638 ?auto_84639 ?auto_84640 ?auto_84641 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84644 - BLOCK
      ?auto_84645 - BLOCK
      ?auto_84646 - BLOCK
      ?auto_84647 - BLOCK
      ?auto_84648 - BLOCK
      ?auto_84649 - BLOCK
    )
    :vars
    (
      ?auto_84651 - BLOCK
      ?auto_84650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84644 ) ( not ( = ?auto_84644 ?auto_84645 ) ) ( not ( = ?auto_84644 ?auto_84646 ) ) ( not ( = ?auto_84644 ?auto_84647 ) ) ( not ( = ?auto_84644 ?auto_84648 ) ) ( not ( = ?auto_84644 ?auto_84649 ) ) ( not ( = ?auto_84645 ?auto_84646 ) ) ( not ( = ?auto_84645 ?auto_84647 ) ) ( not ( = ?auto_84645 ?auto_84648 ) ) ( not ( = ?auto_84645 ?auto_84649 ) ) ( not ( = ?auto_84646 ?auto_84647 ) ) ( not ( = ?auto_84646 ?auto_84648 ) ) ( not ( = ?auto_84646 ?auto_84649 ) ) ( not ( = ?auto_84647 ?auto_84648 ) ) ( not ( = ?auto_84647 ?auto_84649 ) ) ( not ( = ?auto_84648 ?auto_84649 ) ) ( ON ?auto_84649 ?auto_84651 ) ( not ( = ?auto_84644 ?auto_84651 ) ) ( not ( = ?auto_84645 ?auto_84651 ) ) ( not ( = ?auto_84646 ?auto_84651 ) ) ( not ( = ?auto_84647 ?auto_84651 ) ) ( not ( = ?auto_84648 ?auto_84651 ) ) ( not ( = ?auto_84649 ?auto_84651 ) ) ( ON ?auto_84648 ?auto_84649 ) ( ON-TABLE ?auto_84650 ) ( ON ?auto_84651 ?auto_84650 ) ( not ( = ?auto_84650 ?auto_84651 ) ) ( not ( = ?auto_84650 ?auto_84649 ) ) ( not ( = ?auto_84650 ?auto_84648 ) ) ( not ( = ?auto_84644 ?auto_84650 ) ) ( not ( = ?auto_84645 ?auto_84650 ) ) ( not ( = ?auto_84646 ?auto_84650 ) ) ( not ( = ?auto_84647 ?auto_84650 ) ) ( ON ?auto_84647 ?auto_84648 ) ( ON ?auto_84646 ?auto_84647 ) ( CLEAR ?auto_84646 ) ( HOLDING ?auto_84645 ) ( CLEAR ?auto_84644 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84644 ?auto_84645 )
      ( MAKE-6PILE ?auto_84644 ?auto_84645 ?auto_84646 ?auto_84647 ?auto_84648 ?auto_84649 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84652 - BLOCK
      ?auto_84653 - BLOCK
      ?auto_84654 - BLOCK
      ?auto_84655 - BLOCK
      ?auto_84656 - BLOCK
      ?auto_84657 - BLOCK
    )
    :vars
    (
      ?auto_84658 - BLOCK
      ?auto_84659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84652 ) ( not ( = ?auto_84652 ?auto_84653 ) ) ( not ( = ?auto_84652 ?auto_84654 ) ) ( not ( = ?auto_84652 ?auto_84655 ) ) ( not ( = ?auto_84652 ?auto_84656 ) ) ( not ( = ?auto_84652 ?auto_84657 ) ) ( not ( = ?auto_84653 ?auto_84654 ) ) ( not ( = ?auto_84653 ?auto_84655 ) ) ( not ( = ?auto_84653 ?auto_84656 ) ) ( not ( = ?auto_84653 ?auto_84657 ) ) ( not ( = ?auto_84654 ?auto_84655 ) ) ( not ( = ?auto_84654 ?auto_84656 ) ) ( not ( = ?auto_84654 ?auto_84657 ) ) ( not ( = ?auto_84655 ?auto_84656 ) ) ( not ( = ?auto_84655 ?auto_84657 ) ) ( not ( = ?auto_84656 ?auto_84657 ) ) ( ON ?auto_84657 ?auto_84658 ) ( not ( = ?auto_84652 ?auto_84658 ) ) ( not ( = ?auto_84653 ?auto_84658 ) ) ( not ( = ?auto_84654 ?auto_84658 ) ) ( not ( = ?auto_84655 ?auto_84658 ) ) ( not ( = ?auto_84656 ?auto_84658 ) ) ( not ( = ?auto_84657 ?auto_84658 ) ) ( ON ?auto_84656 ?auto_84657 ) ( ON-TABLE ?auto_84659 ) ( ON ?auto_84658 ?auto_84659 ) ( not ( = ?auto_84659 ?auto_84658 ) ) ( not ( = ?auto_84659 ?auto_84657 ) ) ( not ( = ?auto_84659 ?auto_84656 ) ) ( not ( = ?auto_84652 ?auto_84659 ) ) ( not ( = ?auto_84653 ?auto_84659 ) ) ( not ( = ?auto_84654 ?auto_84659 ) ) ( not ( = ?auto_84655 ?auto_84659 ) ) ( ON ?auto_84655 ?auto_84656 ) ( ON ?auto_84654 ?auto_84655 ) ( CLEAR ?auto_84652 ) ( ON ?auto_84653 ?auto_84654 ) ( CLEAR ?auto_84653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84659 ?auto_84658 ?auto_84657 ?auto_84656 ?auto_84655 ?auto_84654 )
      ( MAKE-6PILE ?auto_84652 ?auto_84653 ?auto_84654 ?auto_84655 ?auto_84656 ?auto_84657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84660 - BLOCK
      ?auto_84661 - BLOCK
      ?auto_84662 - BLOCK
      ?auto_84663 - BLOCK
      ?auto_84664 - BLOCK
      ?auto_84665 - BLOCK
    )
    :vars
    (
      ?auto_84667 - BLOCK
      ?auto_84666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84660 ?auto_84661 ) ) ( not ( = ?auto_84660 ?auto_84662 ) ) ( not ( = ?auto_84660 ?auto_84663 ) ) ( not ( = ?auto_84660 ?auto_84664 ) ) ( not ( = ?auto_84660 ?auto_84665 ) ) ( not ( = ?auto_84661 ?auto_84662 ) ) ( not ( = ?auto_84661 ?auto_84663 ) ) ( not ( = ?auto_84661 ?auto_84664 ) ) ( not ( = ?auto_84661 ?auto_84665 ) ) ( not ( = ?auto_84662 ?auto_84663 ) ) ( not ( = ?auto_84662 ?auto_84664 ) ) ( not ( = ?auto_84662 ?auto_84665 ) ) ( not ( = ?auto_84663 ?auto_84664 ) ) ( not ( = ?auto_84663 ?auto_84665 ) ) ( not ( = ?auto_84664 ?auto_84665 ) ) ( ON ?auto_84665 ?auto_84667 ) ( not ( = ?auto_84660 ?auto_84667 ) ) ( not ( = ?auto_84661 ?auto_84667 ) ) ( not ( = ?auto_84662 ?auto_84667 ) ) ( not ( = ?auto_84663 ?auto_84667 ) ) ( not ( = ?auto_84664 ?auto_84667 ) ) ( not ( = ?auto_84665 ?auto_84667 ) ) ( ON ?auto_84664 ?auto_84665 ) ( ON-TABLE ?auto_84666 ) ( ON ?auto_84667 ?auto_84666 ) ( not ( = ?auto_84666 ?auto_84667 ) ) ( not ( = ?auto_84666 ?auto_84665 ) ) ( not ( = ?auto_84666 ?auto_84664 ) ) ( not ( = ?auto_84660 ?auto_84666 ) ) ( not ( = ?auto_84661 ?auto_84666 ) ) ( not ( = ?auto_84662 ?auto_84666 ) ) ( not ( = ?auto_84663 ?auto_84666 ) ) ( ON ?auto_84663 ?auto_84664 ) ( ON ?auto_84662 ?auto_84663 ) ( ON ?auto_84661 ?auto_84662 ) ( CLEAR ?auto_84661 ) ( HOLDING ?auto_84660 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84660 )
      ( MAKE-6PILE ?auto_84660 ?auto_84661 ?auto_84662 ?auto_84663 ?auto_84664 ?auto_84665 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84668 - BLOCK
      ?auto_84669 - BLOCK
      ?auto_84670 - BLOCK
      ?auto_84671 - BLOCK
      ?auto_84672 - BLOCK
      ?auto_84673 - BLOCK
    )
    :vars
    (
      ?auto_84674 - BLOCK
      ?auto_84675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84668 ?auto_84669 ) ) ( not ( = ?auto_84668 ?auto_84670 ) ) ( not ( = ?auto_84668 ?auto_84671 ) ) ( not ( = ?auto_84668 ?auto_84672 ) ) ( not ( = ?auto_84668 ?auto_84673 ) ) ( not ( = ?auto_84669 ?auto_84670 ) ) ( not ( = ?auto_84669 ?auto_84671 ) ) ( not ( = ?auto_84669 ?auto_84672 ) ) ( not ( = ?auto_84669 ?auto_84673 ) ) ( not ( = ?auto_84670 ?auto_84671 ) ) ( not ( = ?auto_84670 ?auto_84672 ) ) ( not ( = ?auto_84670 ?auto_84673 ) ) ( not ( = ?auto_84671 ?auto_84672 ) ) ( not ( = ?auto_84671 ?auto_84673 ) ) ( not ( = ?auto_84672 ?auto_84673 ) ) ( ON ?auto_84673 ?auto_84674 ) ( not ( = ?auto_84668 ?auto_84674 ) ) ( not ( = ?auto_84669 ?auto_84674 ) ) ( not ( = ?auto_84670 ?auto_84674 ) ) ( not ( = ?auto_84671 ?auto_84674 ) ) ( not ( = ?auto_84672 ?auto_84674 ) ) ( not ( = ?auto_84673 ?auto_84674 ) ) ( ON ?auto_84672 ?auto_84673 ) ( ON-TABLE ?auto_84675 ) ( ON ?auto_84674 ?auto_84675 ) ( not ( = ?auto_84675 ?auto_84674 ) ) ( not ( = ?auto_84675 ?auto_84673 ) ) ( not ( = ?auto_84675 ?auto_84672 ) ) ( not ( = ?auto_84668 ?auto_84675 ) ) ( not ( = ?auto_84669 ?auto_84675 ) ) ( not ( = ?auto_84670 ?auto_84675 ) ) ( not ( = ?auto_84671 ?auto_84675 ) ) ( ON ?auto_84671 ?auto_84672 ) ( ON ?auto_84670 ?auto_84671 ) ( ON ?auto_84669 ?auto_84670 ) ( ON ?auto_84668 ?auto_84669 ) ( CLEAR ?auto_84668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84675 ?auto_84674 ?auto_84673 ?auto_84672 ?auto_84671 ?auto_84670 ?auto_84669 )
      ( MAKE-6PILE ?auto_84668 ?auto_84669 ?auto_84670 ?auto_84671 ?auto_84672 ?auto_84673 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84677 - BLOCK
    )
    :vars
    (
      ?auto_84678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84678 ?auto_84677 ) ( CLEAR ?auto_84678 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84677 ) ( not ( = ?auto_84677 ?auto_84678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84678 ?auto_84677 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84679 - BLOCK
    )
    :vars
    (
      ?auto_84680 - BLOCK
      ?auto_84681 - BLOCK
      ?auto_84682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84680 ?auto_84679 ) ( CLEAR ?auto_84680 ) ( ON-TABLE ?auto_84679 ) ( not ( = ?auto_84679 ?auto_84680 ) ) ( HOLDING ?auto_84681 ) ( CLEAR ?auto_84682 ) ( not ( = ?auto_84679 ?auto_84681 ) ) ( not ( = ?auto_84679 ?auto_84682 ) ) ( not ( = ?auto_84680 ?auto_84681 ) ) ( not ( = ?auto_84680 ?auto_84682 ) ) ( not ( = ?auto_84681 ?auto_84682 ) ) )
    :subtasks
    ( ( !STACK ?auto_84681 ?auto_84682 )
      ( MAKE-1PILE ?auto_84679 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84683 - BLOCK
    )
    :vars
    (
      ?auto_84684 - BLOCK
      ?auto_84685 - BLOCK
      ?auto_84686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84684 ?auto_84683 ) ( ON-TABLE ?auto_84683 ) ( not ( = ?auto_84683 ?auto_84684 ) ) ( CLEAR ?auto_84685 ) ( not ( = ?auto_84683 ?auto_84686 ) ) ( not ( = ?auto_84683 ?auto_84685 ) ) ( not ( = ?auto_84684 ?auto_84686 ) ) ( not ( = ?auto_84684 ?auto_84685 ) ) ( not ( = ?auto_84686 ?auto_84685 ) ) ( ON ?auto_84686 ?auto_84684 ) ( CLEAR ?auto_84686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84683 ?auto_84684 )
      ( MAKE-1PILE ?auto_84683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84687 - BLOCK
    )
    :vars
    (
      ?auto_84688 - BLOCK
      ?auto_84690 - BLOCK
      ?auto_84689 - BLOCK
      ?auto_84693 - BLOCK
      ?auto_84692 - BLOCK
      ?auto_84694 - BLOCK
      ?auto_84691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84688 ?auto_84687 ) ( ON-TABLE ?auto_84687 ) ( not ( = ?auto_84687 ?auto_84688 ) ) ( not ( = ?auto_84687 ?auto_84690 ) ) ( not ( = ?auto_84687 ?auto_84689 ) ) ( not ( = ?auto_84688 ?auto_84690 ) ) ( not ( = ?auto_84688 ?auto_84689 ) ) ( not ( = ?auto_84690 ?auto_84689 ) ) ( ON ?auto_84690 ?auto_84688 ) ( CLEAR ?auto_84690 ) ( HOLDING ?auto_84689 ) ( CLEAR ?auto_84693 ) ( ON-TABLE ?auto_84692 ) ( ON ?auto_84694 ?auto_84692 ) ( ON ?auto_84691 ?auto_84694 ) ( ON ?auto_84693 ?auto_84691 ) ( not ( = ?auto_84692 ?auto_84694 ) ) ( not ( = ?auto_84692 ?auto_84691 ) ) ( not ( = ?auto_84692 ?auto_84693 ) ) ( not ( = ?auto_84692 ?auto_84689 ) ) ( not ( = ?auto_84694 ?auto_84691 ) ) ( not ( = ?auto_84694 ?auto_84693 ) ) ( not ( = ?auto_84694 ?auto_84689 ) ) ( not ( = ?auto_84691 ?auto_84693 ) ) ( not ( = ?auto_84691 ?auto_84689 ) ) ( not ( = ?auto_84693 ?auto_84689 ) ) ( not ( = ?auto_84687 ?auto_84693 ) ) ( not ( = ?auto_84687 ?auto_84692 ) ) ( not ( = ?auto_84687 ?auto_84694 ) ) ( not ( = ?auto_84687 ?auto_84691 ) ) ( not ( = ?auto_84688 ?auto_84693 ) ) ( not ( = ?auto_84688 ?auto_84692 ) ) ( not ( = ?auto_84688 ?auto_84694 ) ) ( not ( = ?auto_84688 ?auto_84691 ) ) ( not ( = ?auto_84690 ?auto_84693 ) ) ( not ( = ?auto_84690 ?auto_84692 ) ) ( not ( = ?auto_84690 ?auto_84694 ) ) ( not ( = ?auto_84690 ?auto_84691 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84692 ?auto_84694 ?auto_84691 ?auto_84693 ?auto_84689 )
      ( MAKE-1PILE ?auto_84687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84695 - BLOCK
    )
    :vars
    (
      ?auto_84700 - BLOCK
      ?auto_84699 - BLOCK
      ?auto_84701 - BLOCK
      ?auto_84697 - BLOCK
      ?auto_84698 - BLOCK
      ?auto_84702 - BLOCK
      ?auto_84696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84700 ?auto_84695 ) ( ON-TABLE ?auto_84695 ) ( not ( = ?auto_84695 ?auto_84700 ) ) ( not ( = ?auto_84695 ?auto_84699 ) ) ( not ( = ?auto_84695 ?auto_84701 ) ) ( not ( = ?auto_84700 ?auto_84699 ) ) ( not ( = ?auto_84700 ?auto_84701 ) ) ( not ( = ?auto_84699 ?auto_84701 ) ) ( ON ?auto_84699 ?auto_84700 ) ( CLEAR ?auto_84697 ) ( ON-TABLE ?auto_84698 ) ( ON ?auto_84702 ?auto_84698 ) ( ON ?auto_84696 ?auto_84702 ) ( ON ?auto_84697 ?auto_84696 ) ( not ( = ?auto_84698 ?auto_84702 ) ) ( not ( = ?auto_84698 ?auto_84696 ) ) ( not ( = ?auto_84698 ?auto_84697 ) ) ( not ( = ?auto_84698 ?auto_84701 ) ) ( not ( = ?auto_84702 ?auto_84696 ) ) ( not ( = ?auto_84702 ?auto_84697 ) ) ( not ( = ?auto_84702 ?auto_84701 ) ) ( not ( = ?auto_84696 ?auto_84697 ) ) ( not ( = ?auto_84696 ?auto_84701 ) ) ( not ( = ?auto_84697 ?auto_84701 ) ) ( not ( = ?auto_84695 ?auto_84697 ) ) ( not ( = ?auto_84695 ?auto_84698 ) ) ( not ( = ?auto_84695 ?auto_84702 ) ) ( not ( = ?auto_84695 ?auto_84696 ) ) ( not ( = ?auto_84700 ?auto_84697 ) ) ( not ( = ?auto_84700 ?auto_84698 ) ) ( not ( = ?auto_84700 ?auto_84702 ) ) ( not ( = ?auto_84700 ?auto_84696 ) ) ( not ( = ?auto_84699 ?auto_84697 ) ) ( not ( = ?auto_84699 ?auto_84698 ) ) ( not ( = ?auto_84699 ?auto_84702 ) ) ( not ( = ?auto_84699 ?auto_84696 ) ) ( ON ?auto_84701 ?auto_84699 ) ( CLEAR ?auto_84701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84695 ?auto_84700 ?auto_84699 )
      ( MAKE-1PILE ?auto_84695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84703 - BLOCK
    )
    :vars
    (
      ?auto_84710 - BLOCK
      ?auto_84704 - BLOCK
      ?auto_84707 - BLOCK
      ?auto_84705 - BLOCK
      ?auto_84709 - BLOCK
      ?auto_84708 - BLOCK
      ?auto_84706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84710 ?auto_84703 ) ( ON-TABLE ?auto_84703 ) ( not ( = ?auto_84703 ?auto_84710 ) ) ( not ( = ?auto_84703 ?auto_84704 ) ) ( not ( = ?auto_84703 ?auto_84707 ) ) ( not ( = ?auto_84710 ?auto_84704 ) ) ( not ( = ?auto_84710 ?auto_84707 ) ) ( not ( = ?auto_84704 ?auto_84707 ) ) ( ON ?auto_84704 ?auto_84710 ) ( ON-TABLE ?auto_84705 ) ( ON ?auto_84709 ?auto_84705 ) ( ON ?auto_84708 ?auto_84709 ) ( not ( = ?auto_84705 ?auto_84709 ) ) ( not ( = ?auto_84705 ?auto_84708 ) ) ( not ( = ?auto_84705 ?auto_84706 ) ) ( not ( = ?auto_84705 ?auto_84707 ) ) ( not ( = ?auto_84709 ?auto_84708 ) ) ( not ( = ?auto_84709 ?auto_84706 ) ) ( not ( = ?auto_84709 ?auto_84707 ) ) ( not ( = ?auto_84708 ?auto_84706 ) ) ( not ( = ?auto_84708 ?auto_84707 ) ) ( not ( = ?auto_84706 ?auto_84707 ) ) ( not ( = ?auto_84703 ?auto_84706 ) ) ( not ( = ?auto_84703 ?auto_84705 ) ) ( not ( = ?auto_84703 ?auto_84709 ) ) ( not ( = ?auto_84703 ?auto_84708 ) ) ( not ( = ?auto_84710 ?auto_84706 ) ) ( not ( = ?auto_84710 ?auto_84705 ) ) ( not ( = ?auto_84710 ?auto_84709 ) ) ( not ( = ?auto_84710 ?auto_84708 ) ) ( not ( = ?auto_84704 ?auto_84706 ) ) ( not ( = ?auto_84704 ?auto_84705 ) ) ( not ( = ?auto_84704 ?auto_84709 ) ) ( not ( = ?auto_84704 ?auto_84708 ) ) ( ON ?auto_84707 ?auto_84704 ) ( CLEAR ?auto_84707 ) ( HOLDING ?auto_84706 ) ( CLEAR ?auto_84708 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84705 ?auto_84709 ?auto_84708 ?auto_84706 )
      ( MAKE-1PILE ?auto_84703 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84711 - BLOCK
    )
    :vars
    (
      ?auto_84716 - BLOCK
      ?auto_84717 - BLOCK
      ?auto_84712 - BLOCK
      ?auto_84718 - BLOCK
      ?auto_84714 - BLOCK
      ?auto_84713 - BLOCK
      ?auto_84715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84716 ?auto_84711 ) ( ON-TABLE ?auto_84711 ) ( not ( = ?auto_84711 ?auto_84716 ) ) ( not ( = ?auto_84711 ?auto_84717 ) ) ( not ( = ?auto_84711 ?auto_84712 ) ) ( not ( = ?auto_84716 ?auto_84717 ) ) ( not ( = ?auto_84716 ?auto_84712 ) ) ( not ( = ?auto_84717 ?auto_84712 ) ) ( ON ?auto_84717 ?auto_84716 ) ( ON-TABLE ?auto_84718 ) ( ON ?auto_84714 ?auto_84718 ) ( ON ?auto_84713 ?auto_84714 ) ( not ( = ?auto_84718 ?auto_84714 ) ) ( not ( = ?auto_84718 ?auto_84713 ) ) ( not ( = ?auto_84718 ?auto_84715 ) ) ( not ( = ?auto_84718 ?auto_84712 ) ) ( not ( = ?auto_84714 ?auto_84713 ) ) ( not ( = ?auto_84714 ?auto_84715 ) ) ( not ( = ?auto_84714 ?auto_84712 ) ) ( not ( = ?auto_84713 ?auto_84715 ) ) ( not ( = ?auto_84713 ?auto_84712 ) ) ( not ( = ?auto_84715 ?auto_84712 ) ) ( not ( = ?auto_84711 ?auto_84715 ) ) ( not ( = ?auto_84711 ?auto_84718 ) ) ( not ( = ?auto_84711 ?auto_84714 ) ) ( not ( = ?auto_84711 ?auto_84713 ) ) ( not ( = ?auto_84716 ?auto_84715 ) ) ( not ( = ?auto_84716 ?auto_84718 ) ) ( not ( = ?auto_84716 ?auto_84714 ) ) ( not ( = ?auto_84716 ?auto_84713 ) ) ( not ( = ?auto_84717 ?auto_84715 ) ) ( not ( = ?auto_84717 ?auto_84718 ) ) ( not ( = ?auto_84717 ?auto_84714 ) ) ( not ( = ?auto_84717 ?auto_84713 ) ) ( ON ?auto_84712 ?auto_84717 ) ( CLEAR ?auto_84713 ) ( ON ?auto_84715 ?auto_84712 ) ( CLEAR ?auto_84715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84711 ?auto_84716 ?auto_84717 ?auto_84712 )
      ( MAKE-1PILE ?auto_84711 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84719 - BLOCK
    )
    :vars
    (
      ?auto_84726 - BLOCK
      ?auto_84722 - BLOCK
      ?auto_84723 - BLOCK
      ?auto_84721 - BLOCK
      ?auto_84720 - BLOCK
      ?auto_84724 - BLOCK
      ?auto_84725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84726 ?auto_84719 ) ( ON-TABLE ?auto_84719 ) ( not ( = ?auto_84719 ?auto_84726 ) ) ( not ( = ?auto_84719 ?auto_84722 ) ) ( not ( = ?auto_84719 ?auto_84723 ) ) ( not ( = ?auto_84726 ?auto_84722 ) ) ( not ( = ?auto_84726 ?auto_84723 ) ) ( not ( = ?auto_84722 ?auto_84723 ) ) ( ON ?auto_84722 ?auto_84726 ) ( ON-TABLE ?auto_84721 ) ( ON ?auto_84720 ?auto_84721 ) ( not ( = ?auto_84721 ?auto_84720 ) ) ( not ( = ?auto_84721 ?auto_84724 ) ) ( not ( = ?auto_84721 ?auto_84725 ) ) ( not ( = ?auto_84721 ?auto_84723 ) ) ( not ( = ?auto_84720 ?auto_84724 ) ) ( not ( = ?auto_84720 ?auto_84725 ) ) ( not ( = ?auto_84720 ?auto_84723 ) ) ( not ( = ?auto_84724 ?auto_84725 ) ) ( not ( = ?auto_84724 ?auto_84723 ) ) ( not ( = ?auto_84725 ?auto_84723 ) ) ( not ( = ?auto_84719 ?auto_84725 ) ) ( not ( = ?auto_84719 ?auto_84721 ) ) ( not ( = ?auto_84719 ?auto_84720 ) ) ( not ( = ?auto_84719 ?auto_84724 ) ) ( not ( = ?auto_84726 ?auto_84725 ) ) ( not ( = ?auto_84726 ?auto_84721 ) ) ( not ( = ?auto_84726 ?auto_84720 ) ) ( not ( = ?auto_84726 ?auto_84724 ) ) ( not ( = ?auto_84722 ?auto_84725 ) ) ( not ( = ?auto_84722 ?auto_84721 ) ) ( not ( = ?auto_84722 ?auto_84720 ) ) ( not ( = ?auto_84722 ?auto_84724 ) ) ( ON ?auto_84723 ?auto_84722 ) ( ON ?auto_84725 ?auto_84723 ) ( CLEAR ?auto_84725 ) ( HOLDING ?auto_84724 ) ( CLEAR ?auto_84720 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84721 ?auto_84720 ?auto_84724 )
      ( MAKE-1PILE ?auto_84719 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84727 - BLOCK
    )
    :vars
    (
      ?auto_84730 - BLOCK
      ?auto_84734 - BLOCK
      ?auto_84733 - BLOCK
      ?auto_84731 - BLOCK
      ?auto_84729 - BLOCK
      ?auto_84728 - BLOCK
      ?auto_84732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84730 ?auto_84727 ) ( ON-TABLE ?auto_84727 ) ( not ( = ?auto_84727 ?auto_84730 ) ) ( not ( = ?auto_84727 ?auto_84734 ) ) ( not ( = ?auto_84727 ?auto_84733 ) ) ( not ( = ?auto_84730 ?auto_84734 ) ) ( not ( = ?auto_84730 ?auto_84733 ) ) ( not ( = ?auto_84734 ?auto_84733 ) ) ( ON ?auto_84734 ?auto_84730 ) ( ON-TABLE ?auto_84731 ) ( ON ?auto_84729 ?auto_84731 ) ( not ( = ?auto_84731 ?auto_84729 ) ) ( not ( = ?auto_84731 ?auto_84728 ) ) ( not ( = ?auto_84731 ?auto_84732 ) ) ( not ( = ?auto_84731 ?auto_84733 ) ) ( not ( = ?auto_84729 ?auto_84728 ) ) ( not ( = ?auto_84729 ?auto_84732 ) ) ( not ( = ?auto_84729 ?auto_84733 ) ) ( not ( = ?auto_84728 ?auto_84732 ) ) ( not ( = ?auto_84728 ?auto_84733 ) ) ( not ( = ?auto_84732 ?auto_84733 ) ) ( not ( = ?auto_84727 ?auto_84732 ) ) ( not ( = ?auto_84727 ?auto_84731 ) ) ( not ( = ?auto_84727 ?auto_84729 ) ) ( not ( = ?auto_84727 ?auto_84728 ) ) ( not ( = ?auto_84730 ?auto_84732 ) ) ( not ( = ?auto_84730 ?auto_84731 ) ) ( not ( = ?auto_84730 ?auto_84729 ) ) ( not ( = ?auto_84730 ?auto_84728 ) ) ( not ( = ?auto_84734 ?auto_84732 ) ) ( not ( = ?auto_84734 ?auto_84731 ) ) ( not ( = ?auto_84734 ?auto_84729 ) ) ( not ( = ?auto_84734 ?auto_84728 ) ) ( ON ?auto_84733 ?auto_84734 ) ( ON ?auto_84732 ?auto_84733 ) ( CLEAR ?auto_84729 ) ( ON ?auto_84728 ?auto_84732 ) ( CLEAR ?auto_84728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84727 ?auto_84730 ?auto_84734 ?auto_84733 ?auto_84732 )
      ( MAKE-1PILE ?auto_84727 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84735 - BLOCK
    )
    :vars
    (
      ?auto_84739 - BLOCK
      ?auto_84741 - BLOCK
      ?auto_84738 - BLOCK
      ?auto_84736 - BLOCK
      ?auto_84742 - BLOCK
      ?auto_84737 - BLOCK
      ?auto_84740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84739 ?auto_84735 ) ( ON-TABLE ?auto_84735 ) ( not ( = ?auto_84735 ?auto_84739 ) ) ( not ( = ?auto_84735 ?auto_84741 ) ) ( not ( = ?auto_84735 ?auto_84738 ) ) ( not ( = ?auto_84739 ?auto_84741 ) ) ( not ( = ?auto_84739 ?auto_84738 ) ) ( not ( = ?auto_84741 ?auto_84738 ) ) ( ON ?auto_84741 ?auto_84739 ) ( ON-TABLE ?auto_84736 ) ( not ( = ?auto_84736 ?auto_84742 ) ) ( not ( = ?auto_84736 ?auto_84737 ) ) ( not ( = ?auto_84736 ?auto_84740 ) ) ( not ( = ?auto_84736 ?auto_84738 ) ) ( not ( = ?auto_84742 ?auto_84737 ) ) ( not ( = ?auto_84742 ?auto_84740 ) ) ( not ( = ?auto_84742 ?auto_84738 ) ) ( not ( = ?auto_84737 ?auto_84740 ) ) ( not ( = ?auto_84737 ?auto_84738 ) ) ( not ( = ?auto_84740 ?auto_84738 ) ) ( not ( = ?auto_84735 ?auto_84740 ) ) ( not ( = ?auto_84735 ?auto_84736 ) ) ( not ( = ?auto_84735 ?auto_84742 ) ) ( not ( = ?auto_84735 ?auto_84737 ) ) ( not ( = ?auto_84739 ?auto_84740 ) ) ( not ( = ?auto_84739 ?auto_84736 ) ) ( not ( = ?auto_84739 ?auto_84742 ) ) ( not ( = ?auto_84739 ?auto_84737 ) ) ( not ( = ?auto_84741 ?auto_84740 ) ) ( not ( = ?auto_84741 ?auto_84736 ) ) ( not ( = ?auto_84741 ?auto_84742 ) ) ( not ( = ?auto_84741 ?auto_84737 ) ) ( ON ?auto_84738 ?auto_84741 ) ( ON ?auto_84740 ?auto_84738 ) ( ON ?auto_84737 ?auto_84740 ) ( CLEAR ?auto_84737 ) ( HOLDING ?auto_84742 ) ( CLEAR ?auto_84736 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84736 ?auto_84742 )
      ( MAKE-1PILE ?auto_84735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86149 - BLOCK
    )
    :vars
    (
      ?auto_86153 - BLOCK
      ?auto_86151 - BLOCK
      ?auto_86152 - BLOCK
      ?auto_86155 - BLOCK
      ?auto_86150 - BLOCK
      ?auto_86154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86153 ?auto_86149 ) ( ON-TABLE ?auto_86149 ) ( not ( = ?auto_86149 ?auto_86153 ) ) ( not ( = ?auto_86149 ?auto_86151 ) ) ( not ( = ?auto_86149 ?auto_86152 ) ) ( not ( = ?auto_86153 ?auto_86151 ) ) ( not ( = ?auto_86153 ?auto_86152 ) ) ( not ( = ?auto_86151 ?auto_86152 ) ) ( ON ?auto_86151 ?auto_86153 ) ( not ( = ?auto_86155 ?auto_86150 ) ) ( not ( = ?auto_86155 ?auto_86154 ) ) ( not ( = ?auto_86155 ?auto_86152 ) ) ( not ( = ?auto_86150 ?auto_86154 ) ) ( not ( = ?auto_86150 ?auto_86152 ) ) ( not ( = ?auto_86154 ?auto_86152 ) ) ( not ( = ?auto_86149 ?auto_86154 ) ) ( not ( = ?auto_86149 ?auto_86155 ) ) ( not ( = ?auto_86149 ?auto_86150 ) ) ( not ( = ?auto_86153 ?auto_86154 ) ) ( not ( = ?auto_86153 ?auto_86155 ) ) ( not ( = ?auto_86153 ?auto_86150 ) ) ( not ( = ?auto_86151 ?auto_86154 ) ) ( not ( = ?auto_86151 ?auto_86155 ) ) ( not ( = ?auto_86151 ?auto_86150 ) ) ( ON ?auto_86152 ?auto_86151 ) ( ON ?auto_86154 ?auto_86152 ) ( ON ?auto_86150 ?auto_86154 ) ( ON ?auto_86155 ?auto_86150 ) ( CLEAR ?auto_86155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86149 ?auto_86153 ?auto_86151 ?auto_86152 ?auto_86154 ?auto_86150 )
      ( MAKE-1PILE ?auto_86149 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84751 - BLOCK
    )
    :vars
    (
      ?auto_84758 - BLOCK
      ?auto_84756 - BLOCK
      ?auto_84752 - BLOCK
      ?auto_84754 - BLOCK
      ?auto_84753 - BLOCK
      ?auto_84755 - BLOCK
      ?auto_84757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84758 ?auto_84751 ) ( ON-TABLE ?auto_84751 ) ( not ( = ?auto_84751 ?auto_84758 ) ) ( not ( = ?auto_84751 ?auto_84756 ) ) ( not ( = ?auto_84751 ?auto_84752 ) ) ( not ( = ?auto_84758 ?auto_84756 ) ) ( not ( = ?auto_84758 ?auto_84752 ) ) ( not ( = ?auto_84756 ?auto_84752 ) ) ( ON ?auto_84756 ?auto_84758 ) ( not ( = ?auto_84754 ?auto_84753 ) ) ( not ( = ?auto_84754 ?auto_84755 ) ) ( not ( = ?auto_84754 ?auto_84757 ) ) ( not ( = ?auto_84754 ?auto_84752 ) ) ( not ( = ?auto_84753 ?auto_84755 ) ) ( not ( = ?auto_84753 ?auto_84757 ) ) ( not ( = ?auto_84753 ?auto_84752 ) ) ( not ( = ?auto_84755 ?auto_84757 ) ) ( not ( = ?auto_84755 ?auto_84752 ) ) ( not ( = ?auto_84757 ?auto_84752 ) ) ( not ( = ?auto_84751 ?auto_84757 ) ) ( not ( = ?auto_84751 ?auto_84754 ) ) ( not ( = ?auto_84751 ?auto_84753 ) ) ( not ( = ?auto_84751 ?auto_84755 ) ) ( not ( = ?auto_84758 ?auto_84757 ) ) ( not ( = ?auto_84758 ?auto_84754 ) ) ( not ( = ?auto_84758 ?auto_84753 ) ) ( not ( = ?auto_84758 ?auto_84755 ) ) ( not ( = ?auto_84756 ?auto_84757 ) ) ( not ( = ?auto_84756 ?auto_84754 ) ) ( not ( = ?auto_84756 ?auto_84753 ) ) ( not ( = ?auto_84756 ?auto_84755 ) ) ( ON ?auto_84752 ?auto_84756 ) ( ON ?auto_84757 ?auto_84752 ) ( ON ?auto_84755 ?auto_84757 ) ( ON ?auto_84753 ?auto_84755 ) ( CLEAR ?auto_84753 ) ( HOLDING ?auto_84754 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84754 )
      ( MAKE-1PILE ?auto_84751 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84759 - BLOCK
    )
    :vars
    (
      ?auto_84765 - BLOCK
      ?auto_84760 - BLOCK
      ?auto_84763 - BLOCK
      ?auto_84766 - BLOCK
      ?auto_84762 - BLOCK
      ?auto_84764 - BLOCK
      ?auto_84761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84765 ?auto_84759 ) ( ON-TABLE ?auto_84759 ) ( not ( = ?auto_84759 ?auto_84765 ) ) ( not ( = ?auto_84759 ?auto_84760 ) ) ( not ( = ?auto_84759 ?auto_84763 ) ) ( not ( = ?auto_84765 ?auto_84760 ) ) ( not ( = ?auto_84765 ?auto_84763 ) ) ( not ( = ?auto_84760 ?auto_84763 ) ) ( ON ?auto_84760 ?auto_84765 ) ( not ( = ?auto_84766 ?auto_84762 ) ) ( not ( = ?auto_84766 ?auto_84764 ) ) ( not ( = ?auto_84766 ?auto_84761 ) ) ( not ( = ?auto_84766 ?auto_84763 ) ) ( not ( = ?auto_84762 ?auto_84764 ) ) ( not ( = ?auto_84762 ?auto_84761 ) ) ( not ( = ?auto_84762 ?auto_84763 ) ) ( not ( = ?auto_84764 ?auto_84761 ) ) ( not ( = ?auto_84764 ?auto_84763 ) ) ( not ( = ?auto_84761 ?auto_84763 ) ) ( not ( = ?auto_84759 ?auto_84761 ) ) ( not ( = ?auto_84759 ?auto_84766 ) ) ( not ( = ?auto_84759 ?auto_84762 ) ) ( not ( = ?auto_84759 ?auto_84764 ) ) ( not ( = ?auto_84765 ?auto_84761 ) ) ( not ( = ?auto_84765 ?auto_84766 ) ) ( not ( = ?auto_84765 ?auto_84762 ) ) ( not ( = ?auto_84765 ?auto_84764 ) ) ( not ( = ?auto_84760 ?auto_84761 ) ) ( not ( = ?auto_84760 ?auto_84766 ) ) ( not ( = ?auto_84760 ?auto_84762 ) ) ( not ( = ?auto_84760 ?auto_84764 ) ) ( ON ?auto_84763 ?auto_84760 ) ( ON ?auto_84761 ?auto_84763 ) ( ON ?auto_84764 ?auto_84761 ) ( ON ?auto_84762 ?auto_84764 ) ( ON ?auto_84766 ?auto_84762 ) ( CLEAR ?auto_84766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84759 ?auto_84765 ?auto_84760 ?auto_84763 ?auto_84761 ?auto_84764 ?auto_84762 )
      ( MAKE-1PILE ?auto_84759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84774 - BLOCK
      ?auto_84775 - BLOCK
      ?auto_84776 - BLOCK
      ?auto_84777 - BLOCK
      ?auto_84778 - BLOCK
      ?auto_84779 - BLOCK
      ?auto_84780 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84780 ) ( CLEAR ?auto_84779 ) ( ON-TABLE ?auto_84774 ) ( ON ?auto_84775 ?auto_84774 ) ( ON ?auto_84776 ?auto_84775 ) ( ON ?auto_84777 ?auto_84776 ) ( ON ?auto_84778 ?auto_84777 ) ( ON ?auto_84779 ?auto_84778 ) ( not ( = ?auto_84774 ?auto_84775 ) ) ( not ( = ?auto_84774 ?auto_84776 ) ) ( not ( = ?auto_84774 ?auto_84777 ) ) ( not ( = ?auto_84774 ?auto_84778 ) ) ( not ( = ?auto_84774 ?auto_84779 ) ) ( not ( = ?auto_84774 ?auto_84780 ) ) ( not ( = ?auto_84775 ?auto_84776 ) ) ( not ( = ?auto_84775 ?auto_84777 ) ) ( not ( = ?auto_84775 ?auto_84778 ) ) ( not ( = ?auto_84775 ?auto_84779 ) ) ( not ( = ?auto_84775 ?auto_84780 ) ) ( not ( = ?auto_84776 ?auto_84777 ) ) ( not ( = ?auto_84776 ?auto_84778 ) ) ( not ( = ?auto_84776 ?auto_84779 ) ) ( not ( = ?auto_84776 ?auto_84780 ) ) ( not ( = ?auto_84777 ?auto_84778 ) ) ( not ( = ?auto_84777 ?auto_84779 ) ) ( not ( = ?auto_84777 ?auto_84780 ) ) ( not ( = ?auto_84778 ?auto_84779 ) ) ( not ( = ?auto_84778 ?auto_84780 ) ) ( not ( = ?auto_84779 ?auto_84780 ) ) )
    :subtasks
    ( ( !STACK ?auto_84780 ?auto_84779 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84781 - BLOCK
      ?auto_84782 - BLOCK
      ?auto_84783 - BLOCK
      ?auto_84784 - BLOCK
      ?auto_84785 - BLOCK
      ?auto_84786 - BLOCK
      ?auto_84787 - BLOCK
    )
    :vars
    (
      ?auto_84788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84786 ) ( ON-TABLE ?auto_84781 ) ( ON ?auto_84782 ?auto_84781 ) ( ON ?auto_84783 ?auto_84782 ) ( ON ?auto_84784 ?auto_84783 ) ( ON ?auto_84785 ?auto_84784 ) ( ON ?auto_84786 ?auto_84785 ) ( not ( = ?auto_84781 ?auto_84782 ) ) ( not ( = ?auto_84781 ?auto_84783 ) ) ( not ( = ?auto_84781 ?auto_84784 ) ) ( not ( = ?auto_84781 ?auto_84785 ) ) ( not ( = ?auto_84781 ?auto_84786 ) ) ( not ( = ?auto_84781 ?auto_84787 ) ) ( not ( = ?auto_84782 ?auto_84783 ) ) ( not ( = ?auto_84782 ?auto_84784 ) ) ( not ( = ?auto_84782 ?auto_84785 ) ) ( not ( = ?auto_84782 ?auto_84786 ) ) ( not ( = ?auto_84782 ?auto_84787 ) ) ( not ( = ?auto_84783 ?auto_84784 ) ) ( not ( = ?auto_84783 ?auto_84785 ) ) ( not ( = ?auto_84783 ?auto_84786 ) ) ( not ( = ?auto_84783 ?auto_84787 ) ) ( not ( = ?auto_84784 ?auto_84785 ) ) ( not ( = ?auto_84784 ?auto_84786 ) ) ( not ( = ?auto_84784 ?auto_84787 ) ) ( not ( = ?auto_84785 ?auto_84786 ) ) ( not ( = ?auto_84785 ?auto_84787 ) ) ( not ( = ?auto_84786 ?auto_84787 ) ) ( ON ?auto_84787 ?auto_84788 ) ( CLEAR ?auto_84787 ) ( HAND-EMPTY ) ( not ( = ?auto_84781 ?auto_84788 ) ) ( not ( = ?auto_84782 ?auto_84788 ) ) ( not ( = ?auto_84783 ?auto_84788 ) ) ( not ( = ?auto_84784 ?auto_84788 ) ) ( not ( = ?auto_84785 ?auto_84788 ) ) ( not ( = ?auto_84786 ?auto_84788 ) ) ( not ( = ?auto_84787 ?auto_84788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84787 ?auto_84788 )
      ( MAKE-7PILE ?auto_84781 ?auto_84782 ?auto_84783 ?auto_84784 ?auto_84785 ?auto_84786 ?auto_84787 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84789 - BLOCK
      ?auto_84790 - BLOCK
      ?auto_84791 - BLOCK
      ?auto_84792 - BLOCK
      ?auto_84793 - BLOCK
      ?auto_84794 - BLOCK
      ?auto_84795 - BLOCK
    )
    :vars
    (
      ?auto_84796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84789 ) ( ON ?auto_84790 ?auto_84789 ) ( ON ?auto_84791 ?auto_84790 ) ( ON ?auto_84792 ?auto_84791 ) ( ON ?auto_84793 ?auto_84792 ) ( not ( = ?auto_84789 ?auto_84790 ) ) ( not ( = ?auto_84789 ?auto_84791 ) ) ( not ( = ?auto_84789 ?auto_84792 ) ) ( not ( = ?auto_84789 ?auto_84793 ) ) ( not ( = ?auto_84789 ?auto_84794 ) ) ( not ( = ?auto_84789 ?auto_84795 ) ) ( not ( = ?auto_84790 ?auto_84791 ) ) ( not ( = ?auto_84790 ?auto_84792 ) ) ( not ( = ?auto_84790 ?auto_84793 ) ) ( not ( = ?auto_84790 ?auto_84794 ) ) ( not ( = ?auto_84790 ?auto_84795 ) ) ( not ( = ?auto_84791 ?auto_84792 ) ) ( not ( = ?auto_84791 ?auto_84793 ) ) ( not ( = ?auto_84791 ?auto_84794 ) ) ( not ( = ?auto_84791 ?auto_84795 ) ) ( not ( = ?auto_84792 ?auto_84793 ) ) ( not ( = ?auto_84792 ?auto_84794 ) ) ( not ( = ?auto_84792 ?auto_84795 ) ) ( not ( = ?auto_84793 ?auto_84794 ) ) ( not ( = ?auto_84793 ?auto_84795 ) ) ( not ( = ?auto_84794 ?auto_84795 ) ) ( ON ?auto_84795 ?auto_84796 ) ( CLEAR ?auto_84795 ) ( not ( = ?auto_84789 ?auto_84796 ) ) ( not ( = ?auto_84790 ?auto_84796 ) ) ( not ( = ?auto_84791 ?auto_84796 ) ) ( not ( = ?auto_84792 ?auto_84796 ) ) ( not ( = ?auto_84793 ?auto_84796 ) ) ( not ( = ?auto_84794 ?auto_84796 ) ) ( not ( = ?auto_84795 ?auto_84796 ) ) ( HOLDING ?auto_84794 ) ( CLEAR ?auto_84793 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84789 ?auto_84790 ?auto_84791 ?auto_84792 ?auto_84793 ?auto_84794 )
      ( MAKE-7PILE ?auto_84789 ?auto_84790 ?auto_84791 ?auto_84792 ?auto_84793 ?auto_84794 ?auto_84795 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84797 - BLOCK
      ?auto_84798 - BLOCK
      ?auto_84799 - BLOCK
      ?auto_84800 - BLOCK
      ?auto_84801 - BLOCK
      ?auto_84802 - BLOCK
      ?auto_84803 - BLOCK
    )
    :vars
    (
      ?auto_84804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84797 ) ( ON ?auto_84798 ?auto_84797 ) ( ON ?auto_84799 ?auto_84798 ) ( ON ?auto_84800 ?auto_84799 ) ( ON ?auto_84801 ?auto_84800 ) ( not ( = ?auto_84797 ?auto_84798 ) ) ( not ( = ?auto_84797 ?auto_84799 ) ) ( not ( = ?auto_84797 ?auto_84800 ) ) ( not ( = ?auto_84797 ?auto_84801 ) ) ( not ( = ?auto_84797 ?auto_84802 ) ) ( not ( = ?auto_84797 ?auto_84803 ) ) ( not ( = ?auto_84798 ?auto_84799 ) ) ( not ( = ?auto_84798 ?auto_84800 ) ) ( not ( = ?auto_84798 ?auto_84801 ) ) ( not ( = ?auto_84798 ?auto_84802 ) ) ( not ( = ?auto_84798 ?auto_84803 ) ) ( not ( = ?auto_84799 ?auto_84800 ) ) ( not ( = ?auto_84799 ?auto_84801 ) ) ( not ( = ?auto_84799 ?auto_84802 ) ) ( not ( = ?auto_84799 ?auto_84803 ) ) ( not ( = ?auto_84800 ?auto_84801 ) ) ( not ( = ?auto_84800 ?auto_84802 ) ) ( not ( = ?auto_84800 ?auto_84803 ) ) ( not ( = ?auto_84801 ?auto_84802 ) ) ( not ( = ?auto_84801 ?auto_84803 ) ) ( not ( = ?auto_84802 ?auto_84803 ) ) ( ON ?auto_84803 ?auto_84804 ) ( not ( = ?auto_84797 ?auto_84804 ) ) ( not ( = ?auto_84798 ?auto_84804 ) ) ( not ( = ?auto_84799 ?auto_84804 ) ) ( not ( = ?auto_84800 ?auto_84804 ) ) ( not ( = ?auto_84801 ?auto_84804 ) ) ( not ( = ?auto_84802 ?auto_84804 ) ) ( not ( = ?auto_84803 ?auto_84804 ) ) ( CLEAR ?auto_84801 ) ( ON ?auto_84802 ?auto_84803 ) ( CLEAR ?auto_84802 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84804 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84804 ?auto_84803 )
      ( MAKE-7PILE ?auto_84797 ?auto_84798 ?auto_84799 ?auto_84800 ?auto_84801 ?auto_84802 ?auto_84803 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84805 - BLOCK
      ?auto_84806 - BLOCK
      ?auto_84807 - BLOCK
      ?auto_84808 - BLOCK
      ?auto_84809 - BLOCK
      ?auto_84810 - BLOCK
      ?auto_84811 - BLOCK
    )
    :vars
    (
      ?auto_84812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84805 ) ( ON ?auto_84806 ?auto_84805 ) ( ON ?auto_84807 ?auto_84806 ) ( ON ?auto_84808 ?auto_84807 ) ( not ( = ?auto_84805 ?auto_84806 ) ) ( not ( = ?auto_84805 ?auto_84807 ) ) ( not ( = ?auto_84805 ?auto_84808 ) ) ( not ( = ?auto_84805 ?auto_84809 ) ) ( not ( = ?auto_84805 ?auto_84810 ) ) ( not ( = ?auto_84805 ?auto_84811 ) ) ( not ( = ?auto_84806 ?auto_84807 ) ) ( not ( = ?auto_84806 ?auto_84808 ) ) ( not ( = ?auto_84806 ?auto_84809 ) ) ( not ( = ?auto_84806 ?auto_84810 ) ) ( not ( = ?auto_84806 ?auto_84811 ) ) ( not ( = ?auto_84807 ?auto_84808 ) ) ( not ( = ?auto_84807 ?auto_84809 ) ) ( not ( = ?auto_84807 ?auto_84810 ) ) ( not ( = ?auto_84807 ?auto_84811 ) ) ( not ( = ?auto_84808 ?auto_84809 ) ) ( not ( = ?auto_84808 ?auto_84810 ) ) ( not ( = ?auto_84808 ?auto_84811 ) ) ( not ( = ?auto_84809 ?auto_84810 ) ) ( not ( = ?auto_84809 ?auto_84811 ) ) ( not ( = ?auto_84810 ?auto_84811 ) ) ( ON ?auto_84811 ?auto_84812 ) ( not ( = ?auto_84805 ?auto_84812 ) ) ( not ( = ?auto_84806 ?auto_84812 ) ) ( not ( = ?auto_84807 ?auto_84812 ) ) ( not ( = ?auto_84808 ?auto_84812 ) ) ( not ( = ?auto_84809 ?auto_84812 ) ) ( not ( = ?auto_84810 ?auto_84812 ) ) ( not ( = ?auto_84811 ?auto_84812 ) ) ( ON ?auto_84810 ?auto_84811 ) ( CLEAR ?auto_84810 ) ( ON-TABLE ?auto_84812 ) ( HOLDING ?auto_84809 ) ( CLEAR ?auto_84808 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84805 ?auto_84806 ?auto_84807 ?auto_84808 ?auto_84809 )
      ( MAKE-7PILE ?auto_84805 ?auto_84806 ?auto_84807 ?auto_84808 ?auto_84809 ?auto_84810 ?auto_84811 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84813 - BLOCK
      ?auto_84814 - BLOCK
      ?auto_84815 - BLOCK
      ?auto_84816 - BLOCK
      ?auto_84817 - BLOCK
      ?auto_84818 - BLOCK
      ?auto_84819 - BLOCK
    )
    :vars
    (
      ?auto_84820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84813 ) ( ON ?auto_84814 ?auto_84813 ) ( ON ?auto_84815 ?auto_84814 ) ( ON ?auto_84816 ?auto_84815 ) ( not ( = ?auto_84813 ?auto_84814 ) ) ( not ( = ?auto_84813 ?auto_84815 ) ) ( not ( = ?auto_84813 ?auto_84816 ) ) ( not ( = ?auto_84813 ?auto_84817 ) ) ( not ( = ?auto_84813 ?auto_84818 ) ) ( not ( = ?auto_84813 ?auto_84819 ) ) ( not ( = ?auto_84814 ?auto_84815 ) ) ( not ( = ?auto_84814 ?auto_84816 ) ) ( not ( = ?auto_84814 ?auto_84817 ) ) ( not ( = ?auto_84814 ?auto_84818 ) ) ( not ( = ?auto_84814 ?auto_84819 ) ) ( not ( = ?auto_84815 ?auto_84816 ) ) ( not ( = ?auto_84815 ?auto_84817 ) ) ( not ( = ?auto_84815 ?auto_84818 ) ) ( not ( = ?auto_84815 ?auto_84819 ) ) ( not ( = ?auto_84816 ?auto_84817 ) ) ( not ( = ?auto_84816 ?auto_84818 ) ) ( not ( = ?auto_84816 ?auto_84819 ) ) ( not ( = ?auto_84817 ?auto_84818 ) ) ( not ( = ?auto_84817 ?auto_84819 ) ) ( not ( = ?auto_84818 ?auto_84819 ) ) ( ON ?auto_84819 ?auto_84820 ) ( not ( = ?auto_84813 ?auto_84820 ) ) ( not ( = ?auto_84814 ?auto_84820 ) ) ( not ( = ?auto_84815 ?auto_84820 ) ) ( not ( = ?auto_84816 ?auto_84820 ) ) ( not ( = ?auto_84817 ?auto_84820 ) ) ( not ( = ?auto_84818 ?auto_84820 ) ) ( not ( = ?auto_84819 ?auto_84820 ) ) ( ON ?auto_84818 ?auto_84819 ) ( ON-TABLE ?auto_84820 ) ( CLEAR ?auto_84816 ) ( ON ?auto_84817 ?auto_84818 ) ( CLEAR ?auto_84817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84820 ?auto_84819 ?auto_84818 )
      ( MAKE-7PILE ?auto_84813 ?auto_84814 ?auto_84815 ?auto_84816 ?auto_84817 ?auto_84818 ?auto_84819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84821 - BLOCK
      ?auto_84822 - BLOCK
      ?auto_84823 - BLOCK
      ?auto_84824 - BLOCK
      ?auto_84825 - BLOCK
      ?auto_84826 - BLOCK
      ?auto_84827 - BLOCK
    )
    :vars
    (
      ?auto_84828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84821 ) ( ON ?auto_84822 ?auto_84821 ) ( ON ?auto_84823 ?auto_84822 ) ( not ( = ?auto_84821 ?auto_84822 ) ) ( not ( = ?auto_84821 ?auto_84823 ) ) ( not ( = ?auto_84821 ?auto_84824 ) ) ( not ( = ?auto_84821 ?auto_84825 ) ) ( not ( = ?auto_84821 ?auto_84826 ) ) ( not ( = ?auto_84821 ?auto_84827 ) ) ( not ( = ?auto_84822 ?auto_84823 ) ) ( not ( = ?auto_84822 ?auto_84824 ) ) ( not ( = ?auto_84822 ?auto_84825 ) ) ( not ( = ?auto_84822 ?auto_84826 ) ) ( not ( = ?auto_84822 ?auto_84827 ) ) ( not ( = ?auto_84823 ?auto_84824 ) ) ( not ( = ?auto_84823 ?auto_84825 ) ) ( not ( = ?auto_84823 ?auto_84826 ) ) ( not ( = ?auto_84823 ?auto_84827 ) ) ( not ( = ?auto_84824 ?auto_84825 ) ) ( not ( = ?auto_84824 ?auto_84826 ) ) ( not ( = ?auto_84824 ?auto_84827 ) ) ( not ( = ?auto_84825 ?auto_84826 ) ) ( not ( = ?auto_84825 ?auto_84827 ) ) ( not ( = ?auto_84826 ?auto_84827 ) ) ( ON ?auto_84827 ?auto_84828 ) ( not ( = ?auto_84821 ?auto_84828 ) ) ( not ( = ?auto_84822 ?auto_84828 ) ) ( not ( = ?auto_84823 ?auto_84828 ) ) ( not ( = ?auto_84824 ?auto_84828 ) ) ( not ( = ?auto_84825 ?auto_84828 ) ) ( not ( = ?auto_84826 ?auto_84828 ) ) ( not ( = ?auto_84827 ?auto_84828 ) ) ( ON ?auto_84826 ?auto_84827 ) ( ON-TABLE ?auto_84828 ) ( ON ?auto_84825 ?auto_84826 ) ( CLEAR ?auto_84825 ) ( HOLDING ?auto_84824 ) ( CLEAR ?auto_84823 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84821 ?auto_84822 ?auto_84823 ?auto_84824 )
      ( MAKE-7PILE ?auto_84821 ?auto_84822 ?auto_84823 ?auto_84824 ?auto_84825 ?auto_84826 ?auto_84827 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84829 - BLOCK
      ?auto_84830 - BLOCK
      ?auto_84831 - BLOCK
      ?auto_84832 - BLOCK
      ?auto_84833 - BLOCK
      ?auto_84834 - BLOCK
      ?auto_84835 - BLOCK
    )
    :vars
    (
      ?auto_84836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84829 ) ( ON ?auto_84830 ?auto_84829 ) ( ON ?auto_84831 ?auto_84830 ) ( not ( = ?auto_84829 ?auto_84830 ) ) ( not ( = ?auto_84829 ?auto_84831 ) ) ( not ( = ?auto_84829 ?auto_84832 ) ) ( not ( = ?auto_84829 ?auto_84833 ) ) ( not ( = ?auto_84829 ?auto_84834 ) ) ( not ( = ?auto_84829 ?auto_84835 ) ) ( not ( = ?auto_84830 ?auto_84831 ) ) ( not ( = ?auto_84830 ?auto_84832 ) ) ( not ( = ?auto_84830 ?auto_84833 ) ) ( not ( = ?auto_84830 ?auto_84834 ) ) ( not ( = ?auto_84830 ?auto_84835 ) ) ( not ( = ?auto_84831 ?auto_84832 ) ) ( not ( = ?auto_84831 ?auto_84833 ) ) ( not ( = ?auto_84831 ?auto_84834 ) ) ( not ( = ?auto_84831 ?auto_84835 ) ) ( not ( = ?auto_84832 ?auto_84833 ) ) ( not ( = ?auto_84832 ?auto_84834 ) ) ( not ( = ?auto_84832 ?auto_84835 ) ) ( not ( = ?auto_84833 ?auto_84834 ) ) ( not ( = ?auto_84833 ?auto_84835 ) ) ( not ( = ?auto_84834 ?auto_84835 ) ) ( ON ?auto_84835 ?auto_84836 ) ( not ( = ?auto_84829 ?auto_84836 ) ) ( not ( = ?auto_84830 ?auto_84836 ) ) ( not ( = ?auto_84831 ?auto_84836 ) ) ( not ( = ?auto_84832 ?auto_84836 ) ) ( not ( = ?auto_84833 ?auto_84836 ) ) ( not ( = ?auto_84834 ?auto_84836 ) ) ( not ( = ?auto_84835 ?auto_84836 ) ) ( ON ?auto_84834 ?auto_84835 ) ( ON-TABLE ?auto_84836 ) ( ON ?auto_84833 ?auto_84834 ) ( CLEAR ?auto_84831 ) ( ON ?auto_84832 ?auto_84833 ) ( CLEAR ?auto_84832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84836 ?auto_84835 ?auto_84834 ?auto_84833 )
      ( MAKE-7PILE ?auto_84829 ?auto_84830 ?auto_84831 ?auto_84832 ?auto_84833 ?auto_84834 ?auto_84835 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84837 - BLOCK
      ?auto_84838 - BLOCK
      ?auto_84839 - BLOCK
      ?auto_84840 - BLOCK
      ?auto_84841 - BLOCK
      ?auto_84842 - BLOCK
      ?auto_84843 - BLOCK
    )
    :vars
    (
      ?auto_84844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84837 ) ( ON ?auto_84838 ?auto_84837 ) ( not ( = ?auto_84837 ?auto_84838 ) ) ( not ( = ?auto_84837 ?auto_84839 ) ) ( not ( = ?auto_84837 ?auto_84840 ) ) ( not ( = ?auto_84837 ?auto_84841 ) ) ( not ( = ?auto_84837 ?auto_84842 ) ) ( not ( = ?auto_84837 ?auto_84843 ) ) ( not ( = ?auto_84838 ?auto_84839 ) ) ( not ( = ?auto_84838 ?auto_84840 ) ) ( not ( = ?auto_84838 ?auto_84841 ) ) ( not ( = ?auto_84838 ?auto_84842 ) ) ( not ( = ?auto_84838 ?auto_84843 ) ) ( not ( = ?auto_84839 ?auto_84840 ) ) ( not ( = ?auto_84839 ?auto_84841 ) ) ( not ( = ?auto_84839 ?auto_84842 ) ) ( not ( = ?auto_84839 ?auto_84843 ) ) ( not ( = ?auto_84840 ?auto_84841 ) ) ( not ( = ?auto_84840 ?auto_84842 ) ) ( not ( = ?auto_84840 ?auto_84843 ) ) ( not ( = ?auto_84841 ?auto_84842 ) ) ( not ( = ?auto_84841 ?auto_84843 ) ) ( not ( = ?auto_84842 ?auto_84843 ) ) ( ON ?auto_84843 ?auto_84844 ) ( not ( = ?auto_84837 ?auto_84844 ) ) ( not ( = ?auto_84838 ?auto_84844 ) ) ( not ( = ?auto_84839 ?auto_84844 ) ) ( not ( = ?auto_84840 ?auto_84844 ) ) ( not ( = ?auto_84841 ?auto_84844 ) ) ( not ( = ?auto_84842 ?auto_84844 ) ) ( not ( = ?auto_84843 ?auto_84844 ) ) ( ON ?auto_84842 ?auto_84843 ) ( ON-TABLE ?auto_84844 ) ( ON ?auto_84841 ?auto_84842 ) ( ON ?auto_84840 ?auto_84841 ) ( CLEAR ?auto_84840 ) ( HOLDING ?auto_84839 ) ( CLEAR ?auto_84838 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84837 ?auto_84838 ?auto_84839 )
      ( MAKE-7PILE ?auto_84837 ?auto_84838 ?auto_84839 ?auto_84840 ?auto_84841 ?auto_84842 ?auto_84843 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84845 - BLOCK
      ?auto_84846 - BLOCK
      ?auto_84847 - BLOCK
      ?auto_84848 - BLOCK
      ?auto_84849 - BLOCK
      ?auto_84850 - BLOCK
      ?auto_84851 - BLOCK
    )
    :vars
    (
      ?auto_84852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84845 ) ( ON ?auto_84846 ?auto_84845 ) ( not ( = ?auto_84845 ?auto_84846 ) ) ( not ( = ?auto_84845 ?auto_84847 ) ) ( not ( = ?auto_84845 ?auto_84848 ) ) ( not ( = ?auto_84845 ?auto_84849 ) ) ( not ( = ?auto_84845 ?auto_84850 ) ) ( not ( = ?auto_84845 ?auto_84851 ) ) ( not ( = ?auto_84846 ?auto_84847 ) ) ( not ( = ?auto_84846 ?auto_84848 ) ) ( not ( = ?auto_84846 ?auto_84849 ) ) ( not ( = ?auto_84846 ?auto_84850 ) ) ( not ( = ?auto_84846 ?auto_84851 ) ) ( not ( = ?auto_84847 ?auto_84848 ) ) ( not ( = ?auto_84847 ?auto_84849 ) ) ( not ( = ?auto_84847 ?auto_84850 ) ) ( not ( = ?auto_84847 ?auto_84851 ) ) ( not ( = ?auto_84848 ?auto_84849 ) ) ( not ( = ?auto_84848 ?auto_84850 ) ) ( not ( = ?auto_84848 ?auto_84851 ) ) ( not ( = ?auto_84849 ?auto_84850 ) ) ( not ( = ?auto_84849 ?auto_84851 ) ) ( not ( = ?auto_84850 ?auto_84851 ) ) ( ON ?auto_84851 ?auto_84852 ) ( not ( = ?auto_84845 ?auto_84852 ) ) ( not ( = ?auto_84846 ?auto_84852 ) ) ( not ( = ?auto_84847 ?auto_84852 ) ) ( not ( = ?auto_84848 ?auto_84852 ) ) ( not ( = ?auto_84849 ?auto_84852 ) ) ( not ( = ?auto_84850 ?auto_84852 ) ) ( not ( = ?auto_84851 ?auto_84852 ) ) ( ON ?auto_84850 ?auto_84851 ) ( ON-TABLE ?auto_84852 ) ( ON ?auto_84849 ?auto_84850 ) ( ON ?auto_84848 ?auto_84849 ) ( CLEAR ?auto_84846 ) ( ON ?auto_84847 ?auto_84848 ) ( CLEAR ?auto_84847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84852 ?auto_84851 ?auto_84850 ?auto_84849 ?auto_84848 )
      ( MAKE-7PILE ?auto_84845 ?auto_84846 ?auto_84847 ?auto_84848 ?auto_84849 ?auto_84850 ?auto_84851 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84853 - BLOCK
      ?auto_84854 - BLOCK
      ?auto_84855 - BLOCK
      ?auto_84856 - BLOCK
      ?auto_84857 - BLOCK
      ?auto_84858 - BLOCK
      ?auto_84859 - BLOCK
    )
    :vars
    (
      ?auto_84860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84853 ) ( not ( = ?auto_84853 ?auto_84854 ) ) ( not ( = ?auto_84853 ?auto_84855 ) ) ( not ( = ?auto_84853 ?auto_84856 ) ) ( not ( = ?auto_84853 ?auto_84857 ) ) ( not ( = ?auto_84853 ?auto_84858 ) ) ( not ( = ?auto_84853 ?auto_84859 ) ) ( not ( = ?auto_84854 ?auto_84855 ) ) ( not ( = ?auto_84854 ?auto_84856 ) ) ( not ( = ?auto_84854 ?auto_84857 ) ) ( not ( = ?auto_84854 ?auto_84858 ) ) ( not ( = ?auto_84854 ?auto_84859 ) ) ( not ( = ?auto_84855 ?auto_84856 ) ) ( not ( = ?auto_84855 ?auto_84857 ) ) ( not ( = ?auto_84855 ?auto_84858 ) ) ( not ( = ?auto_84855 ?auto_84859 ) ) ( not ( = ?auto_84856 ?auto_84857 ) ) ( not ( = ?auto_84856 ?auto_84858 ) ) ( not ( = ?auto_84856 ?auto_84859 ) ) ( not ( = ?auto_84857 ?auto_84858 ) ) ( not ( = ?auto_84857 ?auto_84859 ) ) ( not ( = ?auto_84858 ?auto_84859 ) ) ( ON ?auto_84859 ?auto_84860 ) ( not ( = ?auto_84853 ?auto_84860 ) ) ( not ( = ?auto_84854 ?auto_84860 ) ) ( not ( = ?auto_84855 ?auto_84860 ) ) ( not ( = ?auto_84856 ?auto_84860 ) ) ( not ( = ?auto_84857 ?auto_84860 ) ) ( not ( = ?auto_84858 ?auto_84860 ) ) ( not ( = ?auto_84859 ?auto_84860 ) ) ( ON ?auto_84858 ?auto_84859 ) ( ON-TABLE ?auto_84860 ) ( ON ?auto_84857 ?auto_84858 ) ( ON ?auto_84856 ?auto_84857 ) ( ON ?auto_84855 ?auto_84856 ) ( CLEAR ?auto_84855 ) ( HOLDING ?auto_84854 ) ( CLEAR ?auto_84853 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84853 ?auto_84854 )
      ( MAKE-7PILE ?auto_84853 ?auto_84854 ?auto_84855 ?auto_84856 ?auto_84857 ?auto_84858 ?auto_84859 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84861 - BLOCK
      ?auto_84862 - BLOCK
      ?auto_84863 - BLOCK
      ?auto_84864 - BLOCK
      ?auto_84865 - BLOCK
      ?auto_84866 - BLOCK
      ?auto_84867 - BLOCK
    )
    :vars
    (
      ?auto_84868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84861 ) ( not ( = ?auto_84861 ?auto_84862 ) ) ( not ( = ?auto_84861 ?auto_84863 ) ) ( not ( = ?auto_84861 ?auto_84864 ) ) ( not ( = ?auto_84861 ?auto_84865 ) ) ( not ( = ?auto_84861 ?auto_84866 ) ) ( not ( = ?auto_84861 ?auto_84867 ) ) ( not ( = ?auto_84862 ?auto_84863 ) ) ( not ( = ?auto_84862 ?auto_84864 ) ) ( not ( = ?auto_84862 ?auto_84865 ) ) ( not ( = ?auto_84862 ?auto_84866 ) ) ( not ( = ?auto_84862 ?auto_84867 ) ) ( not ( = ?auto_84863 ?auto_84864 ) ) ( not ( = ?auto_84863 ?auto_84865 ) ) ( not ( = ?auto_84863 ?auto_84866 ) ) ( not ( = ?auto_84863 ?auto_84867 ) ) ( not ( = ?auto_84864 ?auto_84865 ) ) ( not ( = ?auto_84864 ?auto_84866 ) ) ( not ( = ?auto_84864 ?auto_84867 ) ) ( not ( = ?auto_84865 ?auto_84866 ) ) ( not ( = ?auto_84865 ?auto_84867 ) ) ( not ( = ?auto_84866 ?auto_84867 ) ) ( ON ?auto_84867 ?auto_84868 ) ( not ( = ?auto_84861 ?auto_84868 ) ) ( not ( = ?auto_84862 ?auto_84868 ) ) ( not ( = ?auto_84863 ?auto_84868 ) ) ( not ( = ?auto_84864 ?auto_84868 ) ) ( not ( = ?auto_84865 ?auto_84868 ) ) ( not ( = ?auto_84866 ?auto_84868 ) ) ( not ( = ?auto_84867 ?auto_84868 ) ) ( ON ?auto_84866 ?auto_84867 ) ( ON-TABLE ?auto_84868 ) ( ON ?auto_84865 ?auto_84866 ) ( ON ?auto_84864 ?auto_84865 ) ( ON ?auto_84863 ?auto_84864 ) ( CLEAR ?auto_84861 ) ( ON ?auto_84862 ?auto_84863 ) ( CLEAR ?auto_84862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84868 ?auto_84867 ?auto_84866 ?auto_84865 ?auto_84864 ?auto_84863 )
      ( MAKE-7PILE ?auto_84861 ?auto_84862 ?auto_84863 ?auto_84864 ?auto_84865 ?auto_84866 ?auto_84867 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84869 - BLOCK
      ?auto_84870 - BLOCK
      ?auto_84871 - BLOCK
      ?auto_84872 - BLOCK
      ?auto_84873 - BLOCK
      ?auto_84874 - BLOCK
      ?auto_84875 - BLOCK
    )
    :vars
    (
      ?auto_84876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84869 ?auto_84870 ) ) ( not ( = ?auto_84869 ?auto_84871 ) ) ( not ( = ?auto_84869 ?auto_84872 ) ) ( not ( = ?auto_84869 ?auto_84873 ) ) ( not ( = ?auto_84869 ?auto_84874 ) ) ( not ( = ?auto_84869 ?auto_84875 ) ) ( not ( = ?auto_84870 ?auto_84871 ) ) ( not ( = ?auto_84870 ?auto_84872 ) ) ( not ( = ?auto_84870 ?auto_84873 ) ) ( not ( = ?auto_84870 ?auto_84874 ) ) ( not ( = ?auto_84870 ?auto_84875 ) ) ( not ( = ?auto_84871 ?auto_84872 ) ) ( not ( = ?auto_84871 ?auto_84873 ) ) ( not ( = ?auto_84871 ?auto_84874 ) ) ( not ( = ?auto_84871 ?auto_84875 ) ) ( not ( = ?auto_84872 ?auto_84873 ) ) ( not ( = ?auto_84872 ?auto_84874 ) ) ( not ( = ?auto_84872 ?auto_84875 ) ) ( not ( = ?auto_84873 ?auto_84874 ) ) ( not ( = ?auto_84873 ?auto_84875 ) ) ( not ( = ?auto_84874 ?auto_84875 ) ) ( ON ?auto_84875 ?auto_84876 ) ( not ( = ?auto_84869 ?auto_84876 ) ) ( not ( = ?auto_84870 ?auto_84876 ) ) ( not ( = ?auto_84871 ?auto_84876 ) ) ( not ( = ?auto_84872 ?auto_84876 ) ) ( not ( = ?auto_84873 ?auto_84876 ) ) ( not ( = ?auto_84874 ?auto_84876 ) ) ( not ( = ?auto_84875 ?auto_84876 ) ) ( ON ?auto_84874 ?auto_84875 ) ( ON-TABLE ?auto_84876 ) ( ON ?auto_84873 ?auto_84874 ) ( ON ?auto_84872 ?auto_84873 ) ( ON ?auto_84871 ?auto_84872 ) ( ON ?auto_84870 ?auto_84871 ) ( CLEAR ?auto_84870 ) ( HOLDING ?auto_84869 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84869 )
      ( MAKE-7PILE ?auto_84869 ?auto_84870 ?auto_84871 ?auto_84872 ?auto_84873 ?auto_84874 ?auto_84875 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84877 - BLOCK
      ?auto_84878 - BLOCK
      ?auto_84879 - BLOCK
      ?auto_84880 - BLOCK
      ?auto_84881 - BLOCK
      ?auto_84882 - BLOCK
      ?auto_84883 - BLOCK
    )
    :vars
    (
      ?auto_84884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84877 ?auto_84878 ) ) ( not ( = ?auto_84877 ?auto_84879 ) ) ( not ( = ?auto_84877 ?auto_84880 ) ) ( not ( = ?auto_84877 ?auto_84881 ) ) ( not ( = ?auto_84877 ?auto_84882 ) ) ( not ( = ?auto_84877 ?auto_84883 ) ) ( not ( = ?auto_84878 ?auto_84879 ) ) ( not ( = ?auto_84878 ?auto_84880 ) ) ( not ( = ?auto_84878 ?auto_84881 ) ) ( not ( = ?auto_84878 ?auto_84882 ) ) ( not ( = ?auto_84878 ?auto_84883 ) ) ( not ( = ?auto_84879 ?auto_84880 ) ) ( not ( = ?auto_84879 ?auto_84881 ) ) ( not ( = ?auto_84879 ?auto_84882 ) ) ( not ( = ?auto_84879 ?auto_84883 ) ) ( not ( = ?auto_84880 ?auto_84881 ) ) ( not ( = ?auto_84880 ?auto_84882 ) ) ( not ( = ?auto_84880 ?auto_84883 ) ) ( not ( = ?auto_84881 ?auto_84882 ) ) ( not ( = ?auto_84881 ?auto_84883 ) ) ( not ( = ?auto_84882 ?auto_84883 ) ) ( ON ?auto_84883 ?auto_84884 ) ( not ( = ?auto_84877 ?auto_84884 ) ) ( not ( = ?auto_84878 ?auto_84884 ) ) ( not ( = ?auto_84879 ?auto_84884 ) ) ( not ( = ?auto_84880 ?auto_84884 ) ) ( not ( = ?auto_84881 ?auto_84884 ) ) ( not ( = ?auto_84882 ?auto_84884 ) ) ( not ( = ?auto_84883 ?auto_84884 ) ) ( ON ?auto_84882 ?auto_84883 ) ( ON-TABLE ?auto_84884 ) ( ON ?auto_84881 ?auto_84882 ) ( ON ?auto_84880 ?auto_84881 ) ( ON ?auto_84879 ?auto_84880 ) ( ON ?auto_84878 ?auto_84879 ) ( ON ?auto_84877 ?auto_84878 ) ( CLEAR ?auto_84877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84884 ?auto_84883 ?auto_84882 ?auto_84881 ?auto_84880 ?auto_84879 ?auto_84878 )
      ( MAKE-7PILE ?auto_84877 ?auto_84878 ?auto_84879 ?auto_84880 ?auto_84881 ?auto_84882 ?auto_84883 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84991 - BLOCK
    )
    :vars
    (
      ?auto_84992 - BLOCK
      ?auto_84993 - BLOCK
      ?auto_84994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84991 ?auto_84992 ) ( CLEAR ?auto_84991 ) ( not ( = ?auto_84991 ?auto_84992 ) ) ( HOLDING ?auto_84993 ) ( CLEAR ?auto_84994 ) ( not ( = ?auto_84991 ?auto_84993 ) ) ( not ( = ?auto_84991 ?auto_84994 ) ) ( not ( = ?auto_84992 ?auto_84993 ) ) ( not ( = ?auto_84992 ?auto_84994 ) ) ( not ( = ?auto_84993 ?auto_84994 ) ) )
    :subtasks
    ( ( !STACK ?auto_84993 ?auto_84994 )
      ( MAKE-1PILE ?auto_84991 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84995 - BLOCK
    )
    :vars
    (
      ?auto_84997 - BLOCK
      ?auto_84996 - BLOCK
      ?auto_84998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84995 ?auto_84997 ) ( not ( = ?auto_84995 ?auto_84997 ) ) ( CLEAR ?auto_84996 ) ( not ( = ?auto_84995 ?auto_84998 ) ) ( not ( = ?auto_84995 ?auto_84996 ) ) ( not ( = ?auto_84997 ?auto_84998 ) ) ( not ( = ?auto_84997 ?auto_84996 ) ) ( not ( = ?auto_84998 ?auto_84996 ) ) ( ON ?auto_84998 ?auto_84995 ) ( CLEAR ?auto_84998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84997 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84997 ?auto_84995 )
      ( MAKE-1PILE ?auto_84995 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_84999 - BLOCK
    )
    :vars
    (
      ?auto_85000 - BLOCK
      ?auto_85002 - BLOCK
      ?auto_85001 - BLOCK
      ?auto_85005 - BLOCK
      ?auto_85004 - BLOCK
      ?auto_85006 - BLOCK
      ?auto_85003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_84999 ?auto_85000 ) ( not ( = ?auto_84999 ?auto_85000 ) ) ( not ( = ?auto_84999 ?auto_85002 ) ) ( not ( = ?auto_84999 ?auto_85001 ) ) ( not ( = ?auto_85000 ?auto_85002 ) ) ( not ( = ?auto_85000 ?auto_85001 ) ) ( not ( = ?auto_85002 ?auto_85001 ) ) ( ON ?auto_85002 ?auto_84999 ) ( CLEAR ?auto_85002 ) ( ON-TABLE ?auto_85000 ) ( HOLDING ?auto_85001 ) ( CLEAR ?auto_85005 ) ( ON-TABLE ?auto_85004 ) ( ON ?auto_85006 ?auto_85004 ) ( ON ?auto_85003 ?auto_85006 ) ( ON ?auto_85005 ?auto_85003 ) ( not ( = ?auto_85004 ?auto_85006 ) ) ( not ( = ?auto_85004 ?auto_85003 ) ) ( not ( = ?auto_85004 ?auto_85005 ) ) ( not ( = ?auto_85004 ?auto_85001 ) ) ( not ( = ?auto_85006 ?auto_85003 ) ) ( not ( = ?auto_85006 ?auto_85005 ) ) ( not ( = ?auto_85006 ?auto_85001 ) ) ( not ( = ?auto_85003 ?auto_85005 ) ) ( not ( = ?auto_85003 ?auto_85001 ) ) ( not ( = ?auto_85005 ?auto_85001 ) ) ( not ( = ?auto_84999 ?auto_85005 ) ) ( not ( = ?auto_84999 ?auto_85004 ) ) ( not ( = ?auto_84999 ?auto_85006 ) ) ( not ( = ?auto_84999 ?auto_85003 ) ) ( not ( = ?auto_85000 ?auto_85005 ) ) ( not ( = ?auto_85000 ?auto_85004 ) ) ( not ( = ?auto_85000 ?auto_85006 ) ) ( not ( = ?auto_85000 ?auto_85003 ) ) ( not ( = ?auto_85002 ?auto_85005 ) ) ( not ( = ?auto_85002 ?auto_85004 ) ) ( not ( = ?auto_85002 ?auto_85006 ) ) ( not ( = ?auto_85002 ?auto_85003 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85004 ?auto_85006 ?auto_85003 ?auto_85005 ?auto_85001 )
      ( MAKE-1PILE ?auto_84999 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85007 - BLOCK
    )
    :vars
    (
      ?auto_85012 - BLOCK
      ?auto_85008 - BLOCK
      ?auto_85010 - BLOCK
      ?auto_85009 - BLOCK
      ?auto_85014 - BLOCK
      ?auto_85013 - BLOCK
      ?auto_85011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85007 ?auto_85012 ) ( not ( = ?auto_85007 ?auto_85012 ) ) ( not ( = ?auto_85007 ?auto_85008 ) ) ( not ( = ?auto_85007 ?auto_85010 ) ) ( not ( = ?auto_85012 ?auto_85008 ) ) ( not ( = ?auto_85012 ?auto_85010 ) ) ( not ( = ?auto_85008 ?auto_85010 ) ) ( ON ?auto_85008 ?auto_85007 ) ( ON-TABLE ?auto_85012 ) ( CLEAR ?auto_85009 ) ( ON-TABLE ?auto_85014 ) ( ON ?auto_85013 ?auto_85014 ) ( ON ?auto_85011 ?auto_85013 ) ( ON ?auto_85009 ?auto_85011 ) ( not ( = ?auto_85014 ?auto_85013 ) ) ( not ( = ?auto_85014 ?auto_85011 ) ) ( not ( = ?auto_85014 ?auto_85009 ) ) ( not ( = ?auto_85014 ?auto_85010 ) ) ( not ( = ?auto_85013 ?auto_85011 ) ) ( not ( = ?auto_85013 ?auto_85009 ) ) ( not ( = ?auto_85013 ?auto_85010 ) ) ( not ( = ?auto_85011 ?auto_85009 ) ) ( not ( = ?auto_85011 ?auto_85010 ) ) ( not ( = ?auto_85009 ?auto_85010 ) ) ( not ( = ?auto_85007 ?auto_85009 ) ) ( not ( = ?auto_85007 ?auto_85014 ) ) ( not ( = ?auto_85007 ?auto_85013 ) ) ( not ( = ?auto_85007 ?auto_85011 ) ) ( not ( = ?auto_85012 ?auto_85009 ) ) ( not ( = ?auto_85012 ?auto_85014 ) ) ( not ( = ?auto_85012 ?auto_85013 ) ) ( not ( = ?auto_85012 ?auto_85011 ) ) ( not ( = ?auto_85008 ?auto_85009 ) ) ( not ( = ?auto_85008 ?auto_85014 ) ) ( not ( = ?auto_85008 ?auto_85013 ) ) ( not ( = ?auto_85008 ?auto_85011 ) ) ( ON ?auto_85010 ?auto_85008 ) ( CLEAR ?auto_85010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85012 ?auto_85007 ?auto_85008 )
      ( MAKE-1PILE ?auto_85007 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85015 - BLOCK
    )
    :vars
    (
      ?auto_85020 - BLOCK
      ?auto_85021 - BLOCK
      ?auto_85017 - BLOCK
      ?auto_85016 - BLOCK
      ?auto_85019 - BLOCK
      ?auto_85022 - BLOCK
      ?auto_85018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85015 ?auto_85020 ) ( not ( = ?auto_85015 ?auto_85020 ) ) ( not ( = ?auto_85015 ?auto_85021 ) ) ( not ( = ?auto_85015 ?auto_85017 ) ) ( not ( = ?auto_85020 ?auto_85021 ) ) ( not ( = ?auto_85020 ?auto_85017 ) ) ( not ( = ?auto_85021 ?auto_85017 ) ) ( ON ?auto_85021 ?auto_85015 ) ( ON-TABLE ?auto_85020 ) ( ON-TABLE ?auto_85016 ) ( ON ?auto_85019 ?auto_85016 ) ( ON ?auto_85022 ?auto_85019 ) ( not ( = ?auto_85016 ?auto_85019 ) ) ( not ( = ?auto_85016 ?auto_85022 ) ) ( not ( = ?auto_85016 ?auto_85018 ) ) ( not ( = ?auto_85016 ?auto_85017 ) ) ( not ( = ?auto_85019 ?auto_85022 ) ) ( not ( = ?auto_85019 ?auto_85018 ) ) ( not ( = ?auto_85019 ?auto_85017 ) ) ( not ( = ?auto_85022 ?auto_85018 ) ) ( not ( = ?auto_85022 ?auto_85017 ) ) ( not ( = ?auto_85018 ?auto_85017 ) ) ( not ( = ?auto_85015 ?auto_85018 ) ) ( not ( = ?auto_85015 ?auto_85016 ) ) ( not ( = ?auto_85015 ?auto_85019 ) ) ( not ( = ?auto_85015 ?auto_85022 ) ) ( not ( = ?auto_85020 ?auto_85018 ) ) ( not ( = ?auto_85020 ?auto_85016 ) ) ( not ( = ?auto_85020 ?auto_85019 ) ) ( not ( = ?auto_85020 ?auto_85022 ) ) ( not ( = ?auto_85021 ?auto_85018 ) ) ( not ( = ?auto_85021 ?auto_85016 ) ) ( not ( = ?auto_85021 ?auto_85019 ) ) ( not ( = ?auto_85021 ?auto_85022 ) ) ( ON ?auto_85017 ?auto_85021 ) ( CLEAR ?auto_85017 ) ( HOLDING ?auto_85018 ) ( CLEAR ?auto_85022 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85016 ?auto_85019 ?auto_85022 ?auto_85018 )
      ( MAKE-1PILE ?auto_85015 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85023 - BLOCK
    )
    :vars
    (
      ?auto_85030 - BLOCK
      ?auto_85027 - BLOCK
      ?auto_85026 - BLOCK
      ?auto_85029 - BLOCK
      ?auto_85028 - BLOCK
      ?auto_85025 - BLOCK
      ?auto_85024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85023 ?auto_85030 ) ( not ( = ?auto_85023 ?auto_85030 ) ) ( not ( = ?auto_85023 ?auto_85027 ) ) ( not ( = ?auto_85023 ?auto_85026 ) ) ( not ( = ?auto_85030 ?auto_85027 ) ) ( not ( = ?auto_85030 ?auto_85026 ) ) ( not ( = ?auto_85027 ?auto_85026 ) ) ( ON ?auto_85027 ?auto_85023 ) ( ON-TABLE ?auto_85030 ) ( ON-TABLE ?auto_85029 ) ( ON ?auto_85028 ?auto_85029 ) ( ON ?auto_85025 ?auto_85028 ) ( not ( = ?auto_85029 ?auto_85028 ) ) ( not ( = ?auto_85029 ?auto_85025 ) ) ( not ( = ?auto_85029 ?auto_85024 ) ) ( not ( = ?auto_85029 ?auto_85026 ) ) ( not ( = ?auto_85028 ?auto_85025 ) ) ( not ( = ?auto_85028 ?auto_85024 ) ) ( not ( = ?auto_85028 ?auto_85026 ) ) ( not ( = ?auto_85025 ?auto_85024 ) ) ( not ( = ?auto_85025 ?auto_85026 ) ) ( not ( = ?auto_85024 ?auto_85026 ) ) ( not ( = ?auto_85023 ?auto_85024 ) ) ( not ( = ?auto_85023 ?auto_85029 ) ) ( not ( = ?auto_85023 ?auto_85028 ) ) ( not ( = ?auto_85023 ?auto_85025 ) ) ( not ( = ?auto_85030 ?auto_85024 ) ) ( not ( = ?auto_85030 ?auto_85029 ) ) ( not ( = ?auto_85030 ?auto_85028 ) ) ( not ( = ?auto_85030 ?auto_85025 ) ) ( not ( = ?auto_85027 ?auto_85024 ) ) ( not ( = ?auto_85027 ?auto_85029 ) ) ( not ( = ?auto_85027 ?auto_85028 ) ) ( not ( = ?auto_85027 ?auto_85025 ) ) ( ON ?auto_85026 ?auto_85027 ) ( CLEAR ?auto_85025 ) ( ON ?auto_85024 ?auto_85026 ) ( CLEAR ?auto_85024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85030 ?auto_85023 ?auto_85027 ?auto_85026 )
      ( MAKE-1PILE ?auto_85023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85031 - BLOCK
    )
    :vars
    (
      ?auto_85033 - BLOCK
      ?auto_85036 - BLOCK
      ?auto_85037 - BLOCK
      ?auto_85032 - BLOCK
      ?auto_85034 - BLOCK
      ?auto_85035 - BLOCK
      ?auto_85038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85031 ?auto_85033 ) ( not ( = ?auto_85031 ?auto_85033 ) ) ( not ( = ?auto_85031 ?auto_85036 ) ) ( not ( = ?auto_85031 ?auto_85037 ) ) ( not ( = ?auto_85033 ?auto_85036 ) ) ( not ( = ?auto_85033 ?auto_85037 ) ) ( not ( = ?auto_85036 ?auto_85037 ) ) ( ON ?auto_85036 ?auto_85031 ) ( ON-TABLE ?auto_85033 ) ( ON-TABLE ?auto_85032 ) ( ON ?auto_85034 ?auto_85032 ) ( not ( = ?auto_85032 ?auto_85034 ) ) ( not ( = ?auto_85032 ?auto_85035 ) ) ( not ( = ?auto_85032 ?auto_85038 ) ) ( not ( = ?auto_85032 ?auto_85037 ) ) ( not ( = ?auto_85034 ?auto_85035 ) ) ( not ( = ?auto_85034 ?auto_85038 ) ) ( not ( = ?auto_85034 ?auto_85037 ) ) ( not ( = ?auto_85035 ?auto_85038 ) ) ( not ( = ?auto_85035 ?auto_85037 ) ) ( not ( = ?auto_85038 ?auto_85037 ) ) ( not ( = ?auto_85031 ?auto_85038 ) ) ( not ( = ?auto_85031 ?auto_85032 ) ) ( not ( = ?auto_85031 ?auto_85034 ) ) ( not ( = ?auto_85031 ?auto_85035 ) ) ( not ( = ?auto_85033 ?auto_85038 ) ) ( not ( = ?auto_85033 ?auto_85032 ) ) ( not ( = ?auto_85033 ?auto_85034 ) ) ( not ( = ?auto_85033 ?auto_85035 ) ) ( not ( = ?auto_85036 ?auto_85038 ) ) ( not ( = ?auto_85036 ?auto_85032 ) ) ( not ( = ?auto_85036 ?auto_85034 ) ) ( not ( = ?auto_85036 ?auto_85035 ) ) ( ON ?auto_85037 ?auto_85036 ) ( ON ?auto_85038 ?auto_85037 ) ( CLEAR ?auto_85038 ) ( HOLDING ?auto_85035 ) ( CLEAR ?auto_85034 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85032 ?auto_85034 ?auto_85035 )
      ( MAKE-1PILE ?auto_85031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85039 - BLOCK
    )
    :vars
    (
      ?auto_85042 - BLOCK
      ?auto_85043 - BLOCK
      ?auto_85040 - BLOCK
      ?auto_85044 - BLOCK
      ?auto_85041 - BLOCK
      ?auto_85046 - BLOCK
      ?auto_85045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85039 ?auto_85042 ) ( not ( = ?auto_85039 ?auto_85042 ) ) ( not ( = ?auto_85039 ?auto_85043 ) ) ( not ( = ?auto_85039 ?auto_85040 ) ) ( not ( = ?auto_85042 ?auto_85043 ) ) ( not ( = ?auto_85042 ?auto_85040 ) ) ( not ( = ?auto_85043 ?auto_85040 ) ) ( ON ?auto_85043 ?auto_85039 ) ( ON-TABLE ?auto_85042 ) ( ON-TABLE ?auto_85044 ) ( ON ?auto_85041 ?auto_85044 ) ( not ( = ?auto_85044 ?auto_85041 ) ) ( not ( = ?auto_85044 ?auto_85046 ) ) ( not ( = ?auto_85044 ?auto_85045 ) ) ( not ( = ?auto_85044 ?auto_85040 ) ) ( not ( = ?auto_85041 ?auto_85046 ) ) ( not ( = ?auto_85041 ?auto_85045 ) ) ( not ( = ?auto_85041 ?auto_85040 ) ) ( not ( = ?auto_85046 ?auto_85045 ) ) ( not ( = ?auto_85046 ?auto_85040 ) ) ( not ( = ?auto_85045 ?auto_85040 ) ) ( not ( = ?auto_85039 ?auto_85045 ) ) ( not ( = ?auto_85039 ?auto_85044 ) ) ( not ( = ?auto_85039 ?auto_85041 ) ) ( not ( = ?auto_85039 ?auto_85046 ) ) ( not ( = ?auto_85042 ?auto_85045 ) ) ( not ( = ?auto_85042 ?auto_85044 ) ) ( not ( = ?auto_85042 ?auto_85041 ) ) ( not ( = ?auto_85042 ?auto_85046 ) ) ( not ( = ?auto_85043 ?auto_85045 ) ) ( not ( = ?auto_85043 ?auto_85044 ) ) ( not ( = ?auto_85043 ?auto_85041 ) ) ( not ( = ?auto_85043 ?auto_85046 ) ) ( ON ?auto_85040 ?auto_85043 ) ( ON ?auto_85045 ?auto_85040 ) ( CLEAR ?auto_85041 ) ( ON ?auto_85046 ?auto_85045 ) ( CLEAR ?auto_85046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85042 ?auto_85039 ?auto_85043 ?auto_85040 ?auto_85045 )
      ( MAKE-1PILE ?auto_85039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85047 - BLOCK
    )
    :vars
    (
      ?auto_85048 - BLOCK
      ?auto_85052 - BLOCK
      ?auto_85051 - BLOCK
      ?auto_85053 - BLOCK
      ?auto_85049 - BLOCK
      ?auto_85050 - BLOCK
      ?auto_85054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85047 ?auto_85048 ) ( not ( = ?auto_85047 ?auto_85048 ) ) ( not ( = ?auto_85047 ?auto_85052 ) ) ( not ( = ?auto_85047 ?auto_85051 ) ) ( not ( = ?auto_85048 ?auto_85052 ) ) ( not ( = ?auto_85048 ?auto_85051 ) ) ( not ( = ?auto_85052 ?auto_85051 ) ) ( ON ?auto_85052 ?auto_85047 ) ( ON-TABLE ?auto_85048 ) ( ON-TABLE ?auto_85053 ) ( not ( = ?auto_85053 ?auto_85049 ) ) ( not ( = ?auto_85053 ?auto_85050 ) ) ( not ( = ?auto_85053 ?auto_85054 ) ) ( not ( = ?auto_85053 ?auto_85051 ) ) ( not ( = ?auto_85049 ?auto_85050 ) ) ( not ( = ?auto_85049 ?auto_85054 ) ) ( not ( = ?auto_85049 ?auto_85051 ) ) ( not ( = ?auto_85050 ?auto_85054 ) ) ( not ( = ?auto_85050 ?auto_85051 ) ) ( not ( = ?auto_85054 ?auto_85051 ) ) ( not ( = ?auto_85047 ?auto_85054 ) ) ( not ( = ?auto_85047 ?auto_85053 ) ) ( not ( = ?auto_85047 ?auto_85049 ) ) ( not ( = ?auto_85047 ?auto_85050 ) ) ( not ( = ?auto_85048 ?auto_85054 ) ) ( not ( = ?auto_85048 ?auto_85053 ) ) ( not ( = ?auto_85048 ?auto_85049 ) ) ( not ( = ?auto_85048 ?auto_85050 ) ) ( not ( = ?auto_85052 ?auto_85054 ) ) ( not ( = ?auto_85052 ?auto_85053 ) ) ( not ( = ?auto_85052 ?auto_85049 ) ) ( not ( = ?auto_85052 ?auto_85050 ) ) ( ON ?auto_85051 ?auto_85052 ) ( ON ?auto_85054 ?auto_85051 ) ( ON ?auto_85050 ?auto_85054 ) ( CLEAR ?auto_85050 ) ( HOLDING ?auto_85049 ) ( CLEAR ?auto_85053 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85053 ?auto_85049 )
      ( MAKE-1PILE ?auto_85047 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85055 - BLOCK
    )
    :vars
    (
      ?auto_85061 - BLOCK
      ?auto_85057 - BLOCK
      ?auto_85062 - BLOCK
      ?auto_85059 - BLOCK
      ?auto_85058 - BLOCK
      ?auto_85060 - BLOCK
      ?auto_85056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85055 ?auto_85061 ) ( not ( = ?auto_85055 ?auto_85061 ) ) ( not ( = ?auto_85055 ?auto_85057 ) ) ( not ( = ?auto_85055 ?auto_85062 ) ) ( not ( = ?auto_85061 ?auto_85057 ) ) ( not ( = ?auto_85061 ?auto_85062 ) ) ( not ( = ?auto_85057 ?auto_85062 ) ) ( ON ?auto_85057 ?auto_85055 ) ( ON-TABLE ?auto_85061 ) ( ON-TABLE ?auto_85059 ) ( not ( = ?auto_85059 ?auto_85058 ) ) ( not ( = ?auto_85059 ?auto_85060 ) ) ( not ( = ?auto_85059 ?auto_85056 ) ) ( not ( = ?auto_85059 ?auto_85062 ) ) ( not ( = ?auto_85058 ?auto_85060 ) ) ( not ( = ?auto_85058 ?auto_85056 ) ) ( not ( = ?auto_85058 ?auto_85062 ) ) ( not ( = ?auto_85060 ?auto_85056 ) ) ( not ( = ?auto_85060 ?auto_85062 ) ) ( not ( = ?auto_85056 ?auto_85062 ) ) ( not ( = ?auto_85055 ?auto_85056 ) ) ( not ( = ?auto_85055 ?auto_85059 ) ) ( not ( = ?auto_85055 ?auto_85058 ) ) ( not ( = ?auto_85055 ?auto_85060 ) ) ( not ( = ?auto_85061 ?auto_85056 ) ) ( not ( = ?auto_85061 ?auto_85059 ) ) ( not ( = ?auto_85061 ?auto_85058 ) ) ( not ( = ?auto_85061 ?auto_85060 ) ) ( not ( = ?auto_85057 ?auto_85056 ) ) ( not ( = ?auto_85057 ?auto_85059 ) ) ( not ( = ?auto_85057 ?auto_85058 ) ) ( not ( = ?auto_85057 ?auto_85060 ) ) ( ON ?auto_85062 ?auto_85057 ) ( ON ?auto_85056 ?auto_85062 ) ( ON ?auto_85060 ?auto_85056 ) ( CLEAR ?auto_85059 ) ( ON ?auto_85058 ?auto_85060 ) ( CLEAR ?auto_85058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85061 ?auto_85055 ?auto_85057 ?auto_85062 ?auto_85056 ?auto_85060 )
      ( MAKE-1PILE ?auto_85055 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85063 - BLOCK
    )
    :vars
    (
      ?auto_85066 - BLOCK
      ?auto_85065 - BLOCK
      ?auto_85067 - BLOCK
      ?auto_85069 - BLOCK
      ?auto_85070 - BLOCK
      ?auto_85064 - BLOCK
      ?auto_85068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85063 ?auto_85066 ) ( not ( = ?auto_85063 ?auto_85066 ) ) ( not ( = ?auto_85063 ?auto_85065 ) ) ( not ( = ?auto_85063 ?auto_85067 ) ) ( not ( = ?auto_85066 ?auto_85065 ) ) ( not ( = ?auto_85066 ?auto_85067 ) ) ( not ( = ?auto_85065 ?auto_85067 ) ) ( ON ?auto_85065 ?auto_85063 ) ( ON-TABLE ?auto_85066 ) ( not ( = ?auto_85069 ?auto_85070 ) ) ( not ( = ?auto_85069 ?auto_85064 ) ) ( not ( = ?auto_85069 ?auto_85068 ) ) ( not ( = ?auto_85069 ?auto_85067 ) ) ( not ( = ?auto_85070 ?auto_85064 ) ) ( not ( = ?auto_85070 ?auto_85068 ) ) ( not ( = ?auto_85070 ?auto_85067 ) ) ( not ( = ?auto_85064 ?auto_85068 ) ) ( not ( = ?auto_85064 ?auto_85067 ) ) ( not ( = ?auto_85068 ?auto_85067 ) ) ( not ( = ?auto_85063 ?auto_85068 ) ) ( not ( = ?auto_85063 ?auto_85069 ) ) ( not ( = ?auto_85063 ?auto_85070 ) ) ( not ( = ?auto_85063 ?auto_85064 ) ) ( not ( = ?auto_85066 ?auto_85068 ) ) ( not ( = ?auto_85066 ?auto_85069 ) ) ( not ( = ?auto_85066 ?auto_85070 ) ) ( not ( = ?auto_85066 ?auto_85064 ) ) ( not ( = ?auto_85065 ?auto_85068 ) ) ( not ( = ?auto_85065 ?auto_85069 ) ) ( not ( = ?auto_85065 ?auto_85070 ) ) ( not ( = ?auto_85065 ?auto_85064 ) ) ( ON ?auto_85067 ?auto_85065 ) ( ON ?auto_85068 ?auto_85067 ) ( ON ?auto_85064 ?auto_85068 ) ( ON ?auto_85070 ?auto_85064 ) ( CLEAR ?auto_85070 ) ( HOLDING ?auto_85069 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85069 )
      ( MAKE-1PILE ?auto_85063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_85071 - BLOCK
    )
    :vars
    (
      ?auto_85076 - BLOCK
      ?auto_85074 - BLOCK
      ?auto_85077 - BLOCK
      ?auto_85078 - BLOCK
      ?auto_85075 - BLOCK
      ?auto_85073 - BLOCK
      ?auto_85072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85071 ?auto_85076 ) ( not ( = ?auto_85071 ?auto_85076 ) ) ( not ( = ?auto_85071 ?auto_85074 ) ) ( not ( = ?auto_85071 ?auto_85077 ) ) ( not ( = ?auto_85076 ?auto_85074 ) ) ( not ( = ?auto_85076 ?auto_85077 ) ) ( not ( = ?auto_85074 ?auto_85077 ) ) ( ON ?auto_85074 ?auto_85071 ) ( ON-TABLE ?auto_85076 ) ( not ( = ?auto_85078 ?auto_85075 ) ) ( not ( = ?auto_85078 ?auto_85073 ) ) ( not ( = ?auto_85078 ?auto_85072 ) ) ( not ( = ?auto_85078 ?auto_85077 ) ) ( not ( = ?auto_85075 ?auto_85073 ) ) ( not ( = ?auto_85075 ?auto_85072 ) ) ( not ( = ?auto_85075 ?auto_85077 ) ) ( not ( = ?auto_85073 ?auto_85072 ) ) ( not ( = ?auto_85073 ?auto_85077 ) ) ( not ( = ?auto_85072 ?auto_85077 ) ) ( not ( = ?auto_85071 ?auto_85072 ) ) ( not ( = ?auto_85071 ?auto_85078 ) ) ( not ( = ?auto_85071 ?auto_85075 ) ) ( not ( = ?auto_85071 ?auto_85073 ) ) ( not ( = ?auto_85076 ?auto_85072 ) ) ( not ( = ?auto_85076 ?auto_85078 ) ) ( not ( = ?auto_85076 ?auto_85075 ) ) ( not ( = ?auto_85076 ?auto_85073 ) ) ( not ( = ?auto_85074 ?auto_85072 ) ) ( not ( = ?auto_85074 ?auto_85078 ) ) ( not ( = ?auto_85074 ?auto_85075 ) ) ( not ( = ?auto_85074 ?auto_85073 ) ) ( ON ?auto_85077 ?auto_85074 ) ( ON ?auto_85072 ?auto_85077 ) ( ON ?auto_85073 ?auto_85072 ) ( ON ?auto_85075 ?auto_85073 ) ( ON ?auto_85078 ?auto_85075 ) ( CLEAR ?auto_85078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85076 ?auto_85071 ?auto_85074 ?auto_85077 ?auto_85072 ?auto_85073 ?auto_85075 )
      ( MAKE-1PILE ?auto_85071 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85090 - BLOCK
      ?auto_85091 - BLOCK
      ?auto_85092 - BLOCK
      ?auto_85093 - BLOCK
      ?auto_85094 - BLOCK
    )
    :vars
    (
      ?auto_85095 - BLOCK
      ?auto_85096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85095 ?auto_85094 ) ( CLEAR ?auto_85095 ) ( ON-TABLE ?auto_85090 ) ( ON ?auto_85091 ?auto_85090 ) ( ON ?auto_85092 ?auto_85091 ) ( ON ?auto_85093 ?auto_85092 ) ( ON ?auto_85094 ?auto_85093 ) ( not ( = ?auto_85090 ?auto_85091 ) ) ( not ( = ?auto_85090 ?auto_85092 ) ) ( not ( = ?auto_85090 ?auto_85093 ) ) ( not ( = ?auto_85090 ?auto_85094 ) ) ( not ( = ?auto_85090 ?auto_85095 ) ) ( not ( = ?auto_85091 ?auto_85092 ) ) ( not ( = ?auto_85091 ?auto_85093 ) ) ( not ( = ?auto_85091 ?auto_85094 ) ) ( not ( = ?auto_85091 ?auto_85095 ) ) ( not ( = ?auto_85092 ?auto_85093 ) ) ( not ( = ?auto_85092 ?auto_85094 ) ) ( not ( = ?auto_85092 ?auto_85095 ) ) ( not ( = ?auto_85093 ?auto_85094 ) ) ( not ( = ?auto_85093 ?auto_85095 ) ) ( not ( = ?auto_85094 ?auto_85095 ) ) ( HOLDING ?auto_85096 ) ( not ( = ?auto_85090 ?auto_85096 ) ) ( not ( = ?auto_85091 ?auto_85096 ) ) ( not ( = ?auto_85092 ?auto_85096 ) ) ( not ( = ?auto_85093 ?auto_85096 ) ) ( not ( = ?auto_85094 ?auto_85096 ) ) ( not ( = ?auto_85095 ?auto_85096 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_85096 )
      ( MAKE-5PILE ?auto_85090 ?auto_85091 ?auto_85092 ?auto_85093 ?auto_85094 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85187 - BLOCK
      ?auto_85188 - BLOCK
    )
    :vars
    (
      ?auto_85189 - BLOCK
      ?auto_85191 - BLOCK
      ?auto_85190 - BLOCK
      ?auto_85192 - BLOCK
      ?auto_85193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85187 ?auto_85188 ) ) ( ON ?auto_85188 ?auto_85189 ) ( not ( = ?auto_85187 ?auto_85189 ) ) ( not ( = ?auto_85188 ?auto_85189 ) ) ( ON ?auto_85187 ?auto_85188 ) ( CLEAR ?auto_85187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85191 ) ( ON ?auto_85190 ?auto_85191 ) ( ON ?auto_85192 ?auto_85190 ) ( ON ?auto_85193 ?auto_85192 ) ( ON ?auto_85189 ?auto_85193 ) ( not ( = ?auto_85191 ?auto_85190 ) ) ( not ( = ?auto_85191 ?auto_85192 ) ) ( not ( = ?auto_85191 ?auto_85193 ) ) ( not ( = ?auto_85191 ?auto_85189 ) ) ( not ( = ?auto_85191 ?auto_85188 ) ) ( not ( = ?auto_85191 ?auto_85187 ) ) ( not ( = ?auto_85190 ?auto_85192 ) ) ( not ( = ?auto_85190 ?auto_85193 ) ) ( not ( = ?auto_85190 ?auto_85189 ) ) ( not ( = ?auto_85190 ?auto_85188 ) ) ( not ( = ?auto_85190 ?auto_85187 ) ) ( not ( = ?auto_85192 ?auto_85193 ) ) ( not ( = ?auto_85192 ?auto_85189 ) ) ( not ( = ?auto_85192 ?auto_85188 ) ) ( not ( = ?auto_85192 ?auto_85187 ) ) ( not ( = ?auto_85193 ?auto_85189 ) ) ( not ( = ?auto_85193 ?auto_85188 ) ) ( not ( = ?auto_85193 ?auto_85187 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85191 ?auto_85190 ?auto_85192 ?auto_85193 ?auto_85189 ?auto_85188 )
      ( MAKE-2PILE ?auto_85187 ?auto_85188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85196 - BLOCK
      ?auto_85197 - BLOCK
    )
    :vars
    (
      ?auto_85198 - BLOCK
      ?auto_85199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85196 ?auto_85197 ) ) ( ON ?auto_85197 ?auto_85198 ) ( CLEAR ?auto_85197 ) ( not ( = ?auto_85196 ?auto_85198 ) ) ( not ( = ?auto_85197 ?auto_85198 ) ) ( ON ?auto_85196 ?auto_85199 ) ( CLEAR ?auto_85196 ) ( HAND-EMPTY ) ( not ( = ?auto_85196 ?auto_85199 ) ) ( not ( = ?auto_85197 ?auto_85199 ) ) ( not ( = ?auto_85198 ?auto_85199 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85196 ?auto_85199 )
      ( MAKE-2PILE ?auto_85196 ?auto_85197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85200 - BLOCK
      ?auto_85201 - BLOCK
    )
    :vars
    (
      ?auto_85202 - BLOCK
      ?auto_85203 - BLOCK
      ?auto_85207 - BLOCK
      ?auto_85205 - BLOCK
      ?auto_85204 - BLOCK
      ?auto_85206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85200 ?auto_85201 ) ) ( not ( = ?auto_85200 ?auto_85202 ) ) ( not ( = ?auto_85201 ?auto_85202 ) ) ( ON ?auto_85200 ?auto_85203 ) ( CLEAR ?auto_85200 ) ( not ( = ?auto_85200 ?auto_85203 ) ) ( not ( = ?auto_85201 ?auto_85203 ) ) ( not ( = ?auto_85202 ?auto_85203 ) ) ( HOLDING ?auto_85201 ) ( CLEAR ?auto_85202 ) ( ON-TABLE ?auto_85207 ) ( ON ?auto_85205 ?auto_85207 ) ( ON ?auto_85204 ?auto_85205 ) ( ON ?auto_85206 ?auto_85204 ) ( ON ?auto_85202 ?auto_85206 ) ( not ( = ?auto_85207 ?auto_85205 ) ) ( not ( = ?auto_85207 ?auto_85204 ) ) ( not ( = ?auto_85207 ?auto_85206 ) ) ( not ( = ?auto_85207 ?auto_85202 ) ) ( not ( = ?auto_85207 ?auto_85201 ) ) ( not ( = ?auto_85205 ?auto_85204 ) ) ( not ( = ?auto_85205 ?auto_85206 ) ) ( not ( = ?auto_85205 ?auto_85202 ) ) ( not ( = ?auto_85205 ?auto_85201 ) ) ( not ( = ?auto_85204 ?auto_85206 ) ) ( not ( = ?auto_85204 ?auto_85202 ) ) ( not ( = ?auto_85204 ?auto_85201 ) ) ( not ( = ?auto_85206 ?auto_85202 ) ) ( not ( = ?auto_85206 ?auto_85201 ) ) ( not ( = ?auto_85200 ?auto_85207 ) ) ( not ( = ?auto_85200 ?auto_85205 ) ) ( not ( = ?auto_85200 ?auto_85204 ) ) ( not ( = ?auto_85200 ?auto_85206 ) ) ( not ( = ?auto_85203 ?auto_85207 ) ) ( not ( = ?auto_85203 ?auto_85205 ) ) ( not ( = ?auto_85203 ?auto_85204 ) ) ( not ( = ?auto_85203 ?auto_85206 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85207 ?auto_85205 ?auto_85204 ?auto_85206 ?auto_85202 ?auto_85201 )
      ( MAKE-2PILE ?auto_85200 ?auto_85201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85208 - BLOCK
      ?auto_85209 - BLOCK
    )
    :vars
    (
      ?auto_85215 - BLOCK
      ?auto_85212 - BLOCK
      ?auto_85210 - BLOCK
      ?auto_85213 - BLOCK
      ?auto_85214 - BLOCK
      ?auto_85211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85208 ?auto_85209 ) ) ( not ( = ?auto_85208 ?auto_85215 ) ) ( not ( = ?auto_85209 ?auto_85215 ) ) ( ON ?auto_85208 ?auto_85212 ) ( not ( = ?auto_85208 ?auto_85212 ) ) ( not ( = ?auto_85209 ?auto_85212 ) ) ( not ( = ?auto_85215 ?auto_85212 ) ) ( CLEAR ?auto_85215 ) ( ON-TABLE ?auto_85210 ) ( ON ?auto_85213 ?auto_85210 ) ( ON ?auto_85214 ?auto_85213 ) ( ON ?auto_85211 ?auto_85214 ) ( ON ?auto_85215 ?auto_85211 ) ( not ( = ?auto_85210 ?auto_85213 ) ) ( not ( = ?auto_85210 ?auto_85214 ) ) ( not ( = ?auto_85210 ?auto_85211 ) ) ( not ( = ?auto_85210 ?auto_85215 ) ) ( not ( = ?auto_85210 ?auto_85209 ) ) ( not ( = ?auto_85213 ?auto_85214 ) ) ( not ( = ?auto_85213 ?auto_85211 ) ) ( not ( = ?auto_85213 ?auto_85215 ) ) ( not ( = ?auto_85213 ?auto_85209 ) ) ( not ( = ?auto_85214 ?auto_85211 ) ) ( not ( = ?auto_85214 ?auto_85215 ) ) ( not ( = ?auto_85214 ?auto_85209 ) ) ( not ( = ?auto_85211 ?auto_85215 ) ) ( not ( = ?auto_85211 ?auto_85209 ) ) ( not ( = ?auto_85208 ?auto_85210 ) ) ( not ( = ?auto_85208 ?auto_85213 ) ) ( not ( = ?auto_85208 ?auto_85214 ) ) ( not ( = ?auto_85208 ?auto_85211 ) ) ( not ( = ?auto_85212 ?auto_85210 ) ) ( not ( = ?auto_85212 ?auto_85213 ) ) ( not ( = ?auto_85212 ?auto_85214 ) ) ( not ( = ?auto_85212 ?auto_85211 ) ) ( ON ?auto_85209 ?auto_85208 ) ( CLEAR ?auto_85209 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85212 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85212 ?auto_85208 )
      ( MAKE-2PILE ?auto_85208 ?auto_85209 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85216 - BLOCK
      ?auto_85217 - BLOCK
    )
    :vars
    (
      ?auto_85221 - BLOCK
      ?auto_85218 - BLOCK
      ?auto_85222 - BLOCK
      ?auto_85219 - BLOCK
      ?auto_85223 - BLOCK
      ?auto_85220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85216 ?auto_85217 ) ) ( not ( = ?auto_85216 ?auto_85221 ) ) ( not ( = ?auto_85217 ?auto_85221 ) ) ( ON ?auto_85216 ?auto_85218 ) ( not ( = ?auto_85216 ?auto_85218 ) ) ( not ( = ?auto_85217 ?auto_85218 ) ) ( not ( = ?auto_85221 ?auto_85218 ) ) ( ON-TABLE ?auto_85222 ) ( ON ?auto_85219 ?auto_85222 ) ( ON ?auto_85223 ?auto_85219 ) ( ON ?auto_85220 ?auto_85223 ) ( not ( = ?auto_85222 ?auto_85219 ) ) ( not ( = ?auto_85222 ?auto_85223 ) ) ( not ( = ?auto_85222 ?auto_85220 ) ) ( not ( = ?auto_85222 ?auto_85221 ) ) ( not ( = ?auto_85222 ?auto_85217 ) ) ( not ( = ?auto_85219 ?auto_85223 ) ) ( not ( = ?auto_85219 ?auto_85220 ) ) ( not ( = ?auto_85219 ?auto_85221 ) ) ( not ( = ?auto_85219 ?auto_85217 ) ) ( not ( = ?auto_85223 ?auto_85220 ) ) ( not ( = ?auto_85223 ?auto_85221 ) ) ( not ( = ?auto_85223 ?auto_85217 ) ) ( not ( = ?auto_85220 ?auto_85221 ) ) ( not ( = ?auto_85220 ?auto_85217 ) ) ( not ( = ?auto_85216 ?auto_85222 ) ) ( not ( = ?auto_85216 ?auto_85219 ) ) ( not ( = ?auto_85216 ?auto_85223 ) ) ( not ( = ?auto_85216 ?auto_85220 ) ) ( not ( = ?auto_85218 ?auto_85222 ) ) ( not ( = ?auto_85218 ?auto_85219 ) ) ( not ( = ?auto_85218 ?auto_85223 ) ) ( not ( = ?auto_85218 ?auto_85220 ) ) ( ON ?auto_85217 ?auto_85216 ) ( CLEAR ?auto_85217 ) ( ON-TABLE ?auto_85218 ) ( HOLDING ?auto_85221 ) ( CLEAR ?auto_85220 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85222 ?auto_85219 ?auto_85223 ?auto_85220 ?auto_85221 )
      ( MAKE-2PILE ?auto_85216 ?auto_85217 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85224 - BLOCK
      ?auto_85225 - BLOCK
    )
    :vars
    (
      ?auto_85229 - BLOCK
      ?auto_85227 - BLOCK
      ?auto_85228 - BLOCK
      ?auto_85231 - BLOCK
      ?auto_85230 - BLOCK
      ?auto_85226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85224 ?auto_85225 ) ) ( not ( = ?auto_85224 ?auto_85229 ) ) ( not ( = ?auto_85225 ?auto_85229 ) ) ( ON ?auto_85224 ?auto_85227 ) ( not ( = ?auto_85224 ?auto_85227 ) ) ( not ( = ?auto_85225 ?auto_85227 ) ) ( not ( = ?auto_85229 ?auto_85227 ) ) ( ON-TABLE ?auto_85228 ) ( ON ?auto_85231 ?auto_85228 ) ( ON ?auto_85230 ?auto_85231 ) ( ON ?auto_85226 ?auto_85230 ) ( not ( = ?auto_85228 ?auto_85231 ) ) ( not ( = ?auto_85228 ?auto_85230 ) ) ( not ( = ?auto_85228 ?auto_85226 ) ) ( not ( = ?auto_85228 ?auto_85229 ) ) ( not ( = ?auto_85228 ?auto_85225 ) ) ( not ( = ?auto_85231 ?auto_85230 ) ) ( not ( = ?auto_85231 ?auto_85226 ) ) ( not ( = ?auto_85231 ?auto_85229 ) ) ( not ( = ?auto_85231 ?auto_85225 ) ) ( not ( = ?auto_85230 ?auto_85226 ) ) ( not ( = ?auto_85230 ?auto_85229 ) ) ( not ( = ?auto_85230 ?auto_85225 ) ) ( not ( = ?auto_85226 ?auto_85229 ) ) ( not ( = ?auto_85226 ?auto_85225 ) ) ( not ( = ?auto_85224 ?auto_85228 ) ) ( not ( = ?auto_85224 ?auto_85231 ) ) ( not ( = ?auto_85224 ?auto_85230 ) ) ( not ( = ?auto_85224 ?auto_85226 ) ) ( not ( = ?auto_85227 ?auto_85228 ) ) ( not ( = ?auto_85227 ?auto_85231 ) ) ( not ( = ?auto_85227 ?auto_85230 ) ) ( not ( = ?auto_85227 ?auto_85226 ) ) ( ON ?auto_85225 ?auto_85224 ) ( ON-TABLE ?auto_85227 ) ( CLEAR ?auto_85226 ) ( ON ?auto_85229 ?auto_85225 ) ( CLEAR ?auto_85229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85227 ?auto_85224 ?auto_85225 )
      ( MAKE-2PILE ?auto_85224 ?auto_85225 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85232 - BLOCK
      ?auto_85233 - BLOCK
    )
    :vars
    (
      ?auto_85235 - BLOCK
      ?auto_85239 - BLOCK
      ?auto_85236 - BLOCK
      ?auto_85237 - BLOCK
      ?auto_85234 - BLOCK
      ?auto_85238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85232 ?auto_85233 ) ) ( not ( = ?auto_85232 ?auto_85235 ) ) ( not ( = ?auto_85233 ?auto_85235 ) ) ( ON ?auto_85232 ?auto_85239 ) ( not ( = ?auto_85232 ?auto_85239 ) ) ( not ( = ?auto_85233 ?auto_85239 ) ) ( not ( = ?auto_85235 ?auto_85239 ) ) ( ON-TABLE ?auto_85236 ) ( ON ?auto_85237 ?auto_85236 ) ( ON ?auto_85234 ?auto_85237 ) ( not ( = ?auto_85236 ?auto_85237 ) ) ( not ( = ?auto_85236 ?auto_85234 ) ) ( not ( = ?auto_85236 ?auto_85238 ) ) ( not ( = ?auto_85236 ?auto_85235 ) ) ( not ( = ?auto_85236 ?auto_85233 ) ) ( not ( = ?auto_85237 ?auto_85234 ) ) ( not ( = ?auto_85237 ?auto_85238 ) ) ( not ( = ?auto_85237 ?auto_85235 ) ) ( not ( = ?auto_85237 ?auto_85233 ) ) ( not ( = ?auto_85234 ?auto_85238 ) ) ( not ( = ?auto_85234 ?auto_85235 ) ) ( not ( = ?auto_85234 ?auto_85233 ) ) ( not ( = ?auto_85238 ?auto_85235 ) ) ( not ( = ?auto_85238 ?auto_85233 ) ) ( not ( = ?auto_85232 ?auto_85236 ) ) ( not ( = ?auto_85232 ?auto_85237 ) ) ( not ( = ?auto_85232 ?auto_85234 ) ) ( not ( = ?auto_85232 ?auto_85238 ) ) ( not ( = ?auto_85239 ?auto_85236 ) ) ( not ( = ?auto_85239 ?auto_85237 ) ) ( not ( = ?auto_85239 ?auto_85234 ) ) ( not ( = ?auto_85239 ?auto_85238 ) ) ( ON ?auto_85233 ?auto_85232 ) ( ON-TABLE ?auto_85239 ) ( ON ?auto_85235 ?auto_85233 ) ( CLEAR ?auto_85235 ) ( HOLDING ?auto_85238 ) ( CLEAR ?auto_85234 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85236 ?auto_85237 ?auto_85234 ?auto_85238 )
      ( MAKE-2PILE ?auto_85232 ?auto_85233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85240 - BLOCK
      ?auto_85241 - BLOCK
    )
    :vars
    (
      ?auto_85243 - BLOCK
      ?auto_85242 - BLOCK
      ?auto_85247 - BLOCK
      ?auto_85245 - BLOCK
      ?auto_85246 - BLOCK
      ?auto_85244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85240 ?auto_85241 ) ) ( not ( = ?auto_85240 ?auto_85243 ) ) ( not ( = ?auto_85241 ?auto_85243 ) ) ( ON ?auto_85240 ?auto_85242 ) ( not ( = ?auto_85240 ?auto_85242 ) ) ( not ( = ?auto_85241 ?auto_85242 ) ) ( not ( = ?auto_85243 ?auto_85242 ) ) ( ON-TABLE ?auto_85247 ) ( ON ?auto_85245 ?auto_85247 ) ( ON ?auto_85246 ?auto_85245 ) ( not ( = ?auto_85247 ?auto_85245 ) ) ( not ( = ?auto_85247 ?auto_85246 ) ) ( not ( = ?auto_85247 ?auto_85244 ) ) ( not ( = ?auto_85247 ?auto_85243 ) ) ( not ( = ?auto_85247 ?auto_85241 ) ) ( not ( = ?auto_85245 ?auto_85246 ) ) ( not ( = ?auto_85245 ?auto_85244 ) ) ( not ( = ?auto_85245 ?auto_85243 ) ) ( not ( = ?auto_85245 ?auto_85241 ) ) ( not ( = ?auto_85246 ?auto_85244 ) ) ( not ( = ?auto_85246 ?auto_85243 ) ) ( not ( = ?auto_85246 ?auto_85241 ) ) ( not ( = ?auto_85244 ?auto_85243 ) ) ( not ( = ?auto_85244 ?auto_85241 ) ) ( not ( = ?auto_85240 ?auto_85247 ) ) ( not ( = ?auto_85240 ?auto_85245 ) ) ( not ( = ?auto_85240 ?auto_85246 ) ) ( not ( = ?auto_85240 ?auto_85244 ) ) ( not ( = ?auto_85242 ?auto_85247 ) ) ( not ( = ?auto_85242 ?auto_85245 ) ) ( not ( = ?auto_85242 ?auto_85246 ) ) ( not ( = ?auto_85242 ?auto_85244 ) ) ( ON ?auto_85241 ?auto_85240 ) ( ON-TABLE ?auto_85242 ) ( ON ?auto_85243 ?auto_85241 ) ( CLEAR ?auto_85246 ) ( ON ?auto_85244 ?auto_85243 ) ( CLEAR ?auto_85244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85242 ?auto_85240 ?auto_85241 ?auto_85243 )
      ( MAKE-2PILE ?auto_85240 ?auto_85241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85248 - BLOCK
      ?auto_85249 - BLOCK
    )
    :vars
    (
      ?auto_85252 - BLOCK
      ?auto_85253 - BLOCK
      ?auto_85251 - BLOCK
      ?auto_85250 - BLOCK
      ?auto_85255 - BLOCK
      ?auto_85254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85248 ?auto_85249 ) ) ( not ( = ?auto_85248 ?auto_85252 ) ) ( not ( = ?auto_85249 ?auto_85252 ) ) ( ON ?auto_85248 ?auto_85253 ) ( not ( = ?auto_85248 ?auto_85253 ) ) ( not ( = ?auto_85249 ?auto_85253 ) ) ( not ( = ?auto_85252 ?auto_85253 ) ) ( ON-TABLE ?auto_85251 ) ( ON ?auto_85250 ?auto_85251 ) ( not ( = ?auto_85251 ?auto_85250 ) ) ( not ( = ?auto_85251 ?auto_85255 ) ) ( not ( = ?auto_85251 ?auto_85254 ) ) ( not ( = ?auto_85251 ?auto_85252 ) ) ( not ( = ?auto_85251 ?auto_85249 ) ) ( not ( = ?auto_85250 ?auto_85255 ) ) ( not ( = ?auto_85250 ?auto_85254 ) ) ( not ( = ?auto_85250 ?auto_85252 ) ) ( not ( = ?auto_85250 ?auto_85249 ) ) ( not ( = ?auto_85255 ?auto_85254 ) ) ( not ( = ?auto_85255 ?auto_85252 ) ) ( not ( = ?auto_85255 ?auto_85249 ) ) ( not ( = ?auto_85254 ?auto_85252 ) ) ( not ( = ?auto_85254 ?auto_85249 ) ) ( not ( = ?auto_85248 ?auto_85251 ) ) ( not ( = ?auto_85248 ?auto_85250 ) ) ( not ( = ?auto_85248 ?auto_85255 ) ) ( not ( = ?auto_85248 ?auto_85254 ) ) ( not ( = ?auto_85253 ?auto_85251 ) ) ( not ( = ?auto_85253 ?auto_85250 ) ) ( not ( = ?auto_85253 ?auto_85255 ) ) ( not ( = ?auto_85253 ?auto_85254 ) ) ( ON ?auto_85249 ?auto_85248 ) ( ON-TABLE ?auto_85253 ) ( ON ?auto_85252 ?auto_85249 ) ( ON ?auto_85254 ?auto_85252 ) ( CLEAR ?auto_85254 ) ( HOLDING ?auto_85255 ) ( CLEAR ?auto_85250 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85251 ?auto_85250 ?auto_85255 )
      ( MAKE-2PILE ?auto_85248 ?auto_85249 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85256 - BLOCK
      ?auto_85257 - BLOCK
    )
    :vars
    (
      ?auto_85258 - BLOCK
      ?auto_85259 - BLOCK
      ?auto_85262 - BLOCK
      ?auto_85261 - BLOCK
      ?auto_85263 - BLOCK
      ?auto_85260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85256 ?auto_85257 ) ) ( not ( = ?auto_85256 ?auto_85258 ) ) ( not ( = ?auto_85257 ?auto_85258 ) ) ( ON ?auto_85256 ?auto_85259 ) ( not ( = ?auto_85256 ?auto_85259 ) ) ( not ( = ?auto_85257 ?auto_85259 ) ) ( not ( = ?auto_85258 ?auto_85259 ) ) ( ON-TABLE ?auto_85262 ) ( ON ?auto_85261 ?auto_85262 ) ( not ( = ?auto_85262 ?auto_85261 ) ) ( not ( = ?auto_85262 ?auto_85263 ) ) ( not ( = ?auto_85262 ?auto_85260 ) ) ( not ( = ?auto_85262 ?auto_85258 ) ) ( not ( = ?auto_85262 ?auto_85257 ) ) ( not ( = ?auto_85261 ?auto_85263 ) ) ( not ( = ?auto_85261 ?auto_85260 ) ) ( not ( = ?auto_85261 ?auto_85258 ) ) ( not ( = ?auto_85261 ?auto_85257 ) ) ( not ( = ?auto_85263 ?auto_85260 ) ) ( not ( = ?auto_85263 ?auto_85258 ) ) ( not ( = ?auto_85263 ?auto_85257 ) ) ( not ( = ?auto_85260 ?auto_85258 ) ) ( not ( = ?auto_85260 ?auto_85257 ) ) ( not ( = ?auto_85256 ?auto_85262 ) ) ( not ( = ?auto_85256 ?auto_85261 ) ) ( not ( = ?auto_85256 ?auto_85263 ) ) ( not ( = ?auto_85256 ?auto_85260 ) ) ( not ( = ?auto_85259 ?auto_85262 ) ) ( not ( = ?auto_85259 ?auto_85261 ) ) ( not ( = ?auto_85259 ?auto_85263 ) ) ( not ( = ?auto_85259 ?auto_85260 ) ) ( ON ?auto_85257 ?auto_85256 ) ( ON-TABLE ?auto_85259 ) ( ON ?auto_85258 ?auto_85257 ) ( ON ?auto_85260 ?auto_85258 ) ( CLEAR ?auto_85261 ) ( ON ?auto_85263 ?auto_85260 ) ( CLEAR ?auto_85263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85259 ?auto_85256 ?auto_85257 ?auto_85258 ?auto_85260 )
      ( MAKE-2PILE ?auto_85256 ?auto_85257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85264 - BLOCK
      ?auto_85265 - BLOCK
    )
    :vars
    (
      ?auto_85266 - BLOCK
      ?auto_85271 - BLOCK
      ?auto_85268 - BLOCK
      ?auto_85270 - BLOCK
      ?auto_85269 - BLOCK
      ?auto_85267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85264 ?auto_85265 ) ) ( not ( = ?auto_85264 ?auto_85266 ) ) ( not ( = ?auto_85265 ?auto_85266 ) ) ( ON ?auto_85264 ?auto_85271 ) ( not ( = ?auto_85264 ?auto_85271 ) ) ( not ( = ?auto_85265 ?auto_85271 ) ) ( not ( = ?auto_85266 ?auto_85271 ) ) ( ON-TABLE ?auto_85268 ) ( not ( = ?auto_85268 ?auto_85270 ) ) ( not ( = ?auto_85268 ?auto_85269 ) ) ( not ( = ?auto_85268 ?auto_85267 ) ) ( not ( = ?auto_85268 ?auto_85266 ) ) ( not ( = ?auto_85268 ?auto_85265 ) ) ( not ( = ?auto_85270 ?auto_85269 ) ) ( not ( = ?auto_85270 ?auto_85267 ) ) ( not ( = ?auto_85270 ?auto_85266 ) ) ( not ( = ?auto_85270 ?auto_85265 ) ) ( not ( = ?auto_85269 ?auto_85267 ) ) ( not ( = ?auto_85269 ?auto_85266 ) ) ( not ( = ?auto_85269 ?auto_85265 ) ) ( not ( = ?auto_85267 ?auto_85266 ) ) ( not ( = ?auto_85267 ?auto_85265 ) ) ( not ( = ?auto_85264 ?auto_85268 ) ) ( not ( = ?auto_85264 ?auto_85270 ) ) ( not ( = ?auto_85264 ?auto_85269 ) ) ( not ( = ?auto_85264 ?auto_85267 ) ) ( not ( = ?auto_85271 ?auto_85268 ) ) ( not ( = ?auto_85271 ?auto_85270 ) ) ( not ( = ?auto_85271 ?auto_85269 ) ) ( not ( = ?auto_85271 ?auto_85267 ) ) ( ON ?auto_85265 ?auto_85264 ) ( ON-TABLE ?auto_85271 ) ( ON ?auto_85266 ?auto_85265 ) ( ON ?auto_85267 ?auto_85266 ) ( ON ?auto_85269 ?auto_85267 ) ( CLEAR ?auto_85269 ) ( HOLDING ?auto_85270 ) ( CLEAR ?auto_85268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85268 ?auto_85270 )
      ( MAKE-2PILE ?auto_85264 ?auto_85265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85272 - BLOCK
      ?auto_85273 - BLOCK
    )
    :vars
    (
      ?auto_85279 - BLOCK
      ?auto_85278 - BLOCK
      ?auto_85275 - BLOCK
      ?auto_85277 - BLOCK
      ?auto_85274 - BLOCK
      ?auto_85276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85272 ?auto_85273 ) ) ( not ( = ?auto_85272 ?auto_85279 ) ) ( not ( = ?auto_85273 ?auto_85279 ) ) ( ON ?auto_85272 ?auto_85278 ) ( not ( = ?auto_85272 ?auto_85278 ) ) ( not ( = ?auto_85273 ?auto_85278 ) ) ( not ( = ?auto_85279 ?auto_85278 ) ) ( ON-TABLE ?auto_85275 ) ( not ( = ?auto_85275 ?auto_85277 ) ) ( not ( = ?auto_85275 ?auto_85274 ) ) ( not ( = ?auto_85275 ?auto_85276 ) ) ( not ( = ?auto_85275 ?auto_85279 ) ) ( not ( = ?auto_85275 ?auto_85273 ) ) ( not ( = ?auto_85277 ?auto_85274 ) ) ( not ( = ?auto_85277 ?auto_85276 ) ) ( not ( = ?auto_85277 ?auto_85279 ) ) ( not ( = ?auto_85277 ?auto_85273 ) ) ( not ( = ?auto_85274 ?auto_85276 ) ) ( not ( = ?auto_85274 ?auto_85279 ) ) ( not ( = ?auto_85274 ?auto_85273 ) ) ( not ( = ?auto_85276 ?auto_85279 ) ) ( not ( = ?auto_85276 ?auto_85273 ) ) ( not ( = ?auto_85272 ?auto_85275 ) ) ( not ( = ?auto_85272 ?auto_85277 ) ) ( not ( = ?auto_85272 ?auto_85274 ) ) ( not ( = ?auto_85272 ?auto_85276 ) ) ( not ( = ?auto_85278 ?auto_85275 ) ) ( not ( = ?auto_85278 ?auto_85277 ) ) ( not ( = ?auto_85278 ?auto_85274 ) ) ( not ( = ?auto_85278 ?auto_85276 ) ) ( ON ?auto_85273 ?auto_85272 ) ( ON-TABLE ?auto_85278 ) ( ON ?auto_85279 ?auto_85273 ) ( ON ?auto_85276 ?auto_85279 ) ( ON ?auto_85274 ?auto_85276 ) ( CLEAR ?auto_85275 ) ( ON ?auto_85277 ?auto_85274 ) ( CLEAR ?auto_85277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85278 ?auto_85272 ?auto_85273 ?auto_85279 ?auto_85276 ?auto_85274 )
      ( MAKE-2PILE ?auto_85272 ?auto_85273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85280 - BLOCK
      ?auto_85281 - BLOCK
    )
    :vars
    (
      ?auto_85286 - BLOCK
      ?auto_85284 - BLOCK
      ?auto_85282 - BLOCK
      ?auto_85283 - BLOCK
      ?auto_85285 - BLOCK
      ?auto_85287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85280 ?auto_85281 ) ) ( not ( = ?auto_85280 ?auto_85286 ) ) ( not ( = ?auto_85281 ?auto_85286 ) ) ( ON ?auto_85280 ?auto_85284 ) ( not ( = ?auto_85280 ?auto_85284 ) ) ( not ( = ?auto_85281 ?auto_85284 ) ) ( not ( = ?auto_85286 ?auto_85284 ) ) ( not ( = ?auto_85282 ?auto_85283 ) ) ( not ( = ?auto_85282 ?auto_85285 ) ) ( not ( = ?auto_85282 ?auto_85287 ) ) ( not ( = ?auto_85282 ?auto_85286 ) ) ( not ( = ?auto_85282 ?auto_85281 ) ) ( not ( = ?auto_85283 ?auto_85285 ) ) ( not ( = ?auto_85283 ?auto_85287 ) ) ( not ( = ?auto_85283 ?auto_85286 ) ) ( not ( = ?auto_85283 ?auto_85281 ) ) ( not ( = ?auto_85285 ?auto_85287 ) ) ( not ( = ?auto_85285 ?auto_85286 ) ) ( not ( = ?auto_85285 ?auto_85281 ) ) ( not ( = ?auto_85287 ?auto_85286 ) ) ( not ( = ?auto_85287 ?auto_85281 ) ) ( not ( = ?auto_85280 ?auto_85282 ) ) ( not ( = ?auto_85280 ?auto_85283 ) ) ( not ( = ?auto_85280 ?auto_85285 ) ) ( not ( = ?auto_85280 ?auto_85287 ) ) ( not ( = ?auto_85284 ?auto_85282 ) ) ( not ( = ?auto_85284 ?auto_85283 ) ) ( not ( = ?auto_85284 ?auto_85285 ) ) ( not ( = ?auto_85284 ?auto_85287 ) ) ( ON ?auto_85281 ?auto_85280 ) ( ON-TABLE ?auto_85284 ) ( ON ?auto_85286 ?auto_85281 ) ( ON ?auto_85287 ?auto_85286 ) ( ON ?auto_85285 ?auto_85287 ) ( ON ?auto_85283 ?auto_85285 ) ( CLEAR ?auto_85283 ) ( HOLDING ?auto_85282 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85282 )
      ( MAKE-2PILE ?auto_85280 ?auto_85281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85288 - BLOCK
      ?auto_85289 - BLOCK
    )
    :vars
    (
      ?auto_85290 - BLOCK
      ?auto_85291 - BLOCK
      ?auto_85293 - BLOCK
      ?auto_85294 - BLOCK
      ?auto_85295 - BLOCK
      ?auto_85292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85288 ?auto_85289 ) ) ( not ( = ?auto_85288 ?auto_85290 ) ) ( not ( = ?auto_85289 ?auto_85290 ) ) ( ON ?auto_85288 ?auto_85291 ) ( not ( = ?auto_85288 ?auto_85291 ) ) ( not ( = ?auto_85289 ?auto_85291 ) ) ( not ( = ?auto_85290 ?auto_85291 ) ) ( not ( = ?auto_85293 ?auto_85294 ) ) ( not ( = ?auto_85293 ?auto_85295 ) ) ( not ( = ?auto_85293 ?auto_85292 ) ) ( not ( = ?auto_85293 ?auto_85290 ) ) ( not ( = ?auto_85293 ?auto_85289 ) ) ( not ( = ?auto_85294 ?auto_85295 ) ) ( not ( = ?auto_85294 ?auto_85292 ) ) ( not ( = ?auto_85294 ?auto_85290 ) ) ( not ( = ?auto_85294 ?auto_85289 ) ) ( not ( = ?auto_85295 ?auto_85292 ) ) ( not ( = ?auto_85295 ?auto_85290 ) ) ( not ( = ?auto_85295 ?auto_85289 ) ) ( not ( = ?auto_85292 ?auto_85290 ) ) ( not ( = ?auto_85292 ?auto_85289 ) ) ( not ( = ?auto_85288 ?auto_85293 ) ) ( not ( = ?auto_85288 ?auto_85294 ) ) ( not ( = ?auto_85288 ?auto_85295 ) ) ( not ( = ?auto_85288 ?auto_85292 ) ) ( not ( = ?auto_85291 ?auto_85293 ) ) ( not ( = ?auto_85291 ?auto_85294 ) ) ( not ( = ?auto_85291 ?auto_85295 ) ) ( not ( = ?auto_85291 ?auto_85292 ) ) ( ON ?auto_85289 ?auto_85288 ) ( ON-TABLE ?auto_85291 ) ( ON ?auto_85290 ?auto_85289 ) ( ON ?auto_85292 ?auto_85290 ) ( ON ?auto_85295 ?auto_85292 ) ( ON ?auto_85294 ?auto_85295 ) ( ON ?auto_85293 ?auto_85294 ) ( CLEAR ?auto_85293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85291 ?auto_85288 ?auto_85289 ?auto_85290 ?auto_85292 ?auto_85295 ?auto_85294 )
      ( MAKE-2PILE ?auto_85288 ?auto_85289 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85319 - BLOCK
      ?auto_85320 - BLOCK
      ?auto_85321 - BLOCK
      ?auto_85322 - BLOCK
    )
    :vars
    (
      ?auto_85325 - BLOCK
      ?auto_85323 - BLOCK
      ?auto_85324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85325 ?auto_85322 ) ( ON-TABLE ?auto_85319 ) ( ON ?auto_85320 ?auto_85319 ) ( ON ?auto_85321 ?auto_85320 ) ( ON ?auto_85322 ?auto_85321 ) ( not ( = ?auto_85319 ?auto_85320 ) ) ( not ( = ?auto_85319 ?auto_85321 ) ) ( not ( = ?auto_85319 ?auto_85322 ) ) ( not ( = ?auto_85319 ?auto_85325 ) ) ( not ( = ?auto_85320 ?auto_85321 ) ) ( not ( = ?auto_85320 ?auto_85322 ) ) ( not ( = ?auto_85320 ?auto_85325 ) ) ( not ( = ?auto_85321 ?auto_85322 ) ) ( not ( = ?auto_85321 ?auto_85325 ) ) ( not ( = ?auto_85322 ?auto_85325 ) ) ( not ( = ?auto_85319 ?auto_85323 ) ) ( not ( = ?auto_85319 ?auto_85324 ) ) ( not ( = ?auto_85320 ?auto_85323 ) ) ( not ( = ?auto_85320 ?auto_85324 ) ) ( not ( = ?auto_85321 ?auto_85323 ) ) ( not ( = ?auto_85321 ?auto_85324 ) ) ( not ( = ?auto_85322 ?auto_85323 ) ) ( not ( = ?auto_85322 ?auto_85324 ) ) ( not ( = ?auto_85325 ?auto_85323 ) ) ( not ( = ?auto_85325 ?auto_85324 ) ) ( not ( = ?auto_85323 ?auto_85324 ) ) ( ON ?auto_85323 ?auto_85325 ) ( CLEAR ?auto_85323 ) ( HOLDING ?auto_85324 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85324 )
      ( MAKE-4PILE ?auto_85319 ?auto_85320 ?auto_85321 ?auto_85322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85406 - BLOCK
      ?auto_85407 - BLOCK
      ?auto_85408 - BLOCK
    )
    :vars
    (
      ?auto_85409 - BLOCK
      ?auto_85410 - BLOCK
      ?auto_85411 - BLOCK
      ?auto_85412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85406 ) ( not ( = ?auto_85406 ?auto_85407 ) ) ( not ( = ?auto_85406 ?auto_85408 ) ) ( not ( = ?auto_85407 ?auto_85408 ) ) ( ON ?auto_85408 ?auto_85409 ) ( not ( = ?auto_85406 ?auto_85409 ) ) ( not ( = ?auto_85407 ?auto_85409 ) ) ( not ( = ?auto_85408 ?auto_85409 ) ) ( CLEAR ?auto_85406 ) ( ON ?auto_85407 ?auto_85408 ) ( CLEAR ?auto_85407 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85410 ) ( ON ?auto_85411 ?auto_85410 ) ( ON ?auto_85412 ?auto_85411 ) ( ON ?auto_85409 ?auto_85412 ) ( not ( = ?auto_85410 ?auto_85411 ) ) ( not ( = ?auto_85410 ?auto_85412 ) ) ( not ( = ?auto_85410 ?auto_85409 ) ) ( not ( = ?auto_85410 ?auto_85408 ) ) ( not ( = ?auto_85410 ?auto_85407 ) ) ( not ( = ?auto_85411 ?auto_85412 ) ) ( not ( = ?auto_85411 ?auto_85409 ) ) ( not ( = ?auto_85411 ?auto_85408 ) ) ( not ( = ?auto_85411 ?auto_85407 ) ) ( not ( = ?auto_85412 ?auto_85409 ) ) ( not ( = ?auto_85412 ?auto_85408 ) ) ( not ( = ?auto_85412 ?auto_85407 ) ) ( not ( = ?auto_85406 ?auto_85410 ) ) ( not ( = ?auto_85406 ?auto_85411 ) ) ( not ( = ?auto_85406 ?auto_85412 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85410 ?auto_85411 ?auto_85412 ?auto_85409 ?auto_85408 )
      ( MAKE-3PILE ?auto_85406 ?auto_85407 ?auto_85408 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85413 - BLOCK
      ?auto_85414 - BLOCK
      ?auto_85415 - BLOCK
    )
    :vars
    (
      ?auto_85419 - BLOCK
      ?auto_85417 - BLOCK
      ?auto_85416 - BLOCK
      ?auto_85418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85413 ?auto_85414 ) ) ( not ( = ?auto_85413 ?auto_85415 ) ) ( not ( = ?auto_85414 ?auto_85415 ) ) ( ON ?auto_85415 ?auto_85419 ) ( not ( = ?auto_85413 ?auto_85419 ) ) ( not ( = ?auto_85414 ?auto_85419 ) ) ( not ( = ?auto_85415 ?auto_85419 ) ) ( ON ?auto_85414 ?auto_85415 ) ( CLEAR ?auto_85414 ) ( ON-TABLE ?auto_85417 ) ( ON ?auto_85416 ?auto_85417 ) ( ON ?auto_85418 ?auto_85416 ) ( ON ?auto_85419 ?auto_85418 ) ( not ( = ?auto_85417 ?auto_85416 ) ) ( not ( = ?auto_85417 ?auto_85418 ) ) ( not ( = ?auto_85417 ?auto_85419 ) ) ( not ( = ?auto_85417 ?auto_85415 ) ) ( not ( = ?auto_85417 ?auto_85414 ) ) ( not ( = ?auto_85416 ?auto_85418 ) ) ( not ( = ?auto_85416 ?auto_85419 ) ) ( not ( = ?auto_85416 ?auto_85415 ) ) ( not ( = ?auto_85416 ?auto_85414 ) ) ( not ( = ?auto_85418 ?auto_85419 ) ) ( not ( = ?auto_85418 ?auto_85415 ) ) ( not ( = ?auto_85418 ?auto_85414 ) ) ( not ( = ?auto_85413 ?auto_85417 ) ) ( not ( = ?auto_85413 ?auto_85416 ) ) ( not ( = ?auto_85413 ?auto_85418 ) ) ( HOLDING ?auto_85413 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85413 )
      ( MAKE-3PILE ?auto_85413 ?auto_85414 ?auto_85415 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85420 - BLOCK
      ?auto_85421 - BLOCK
      ?auto_85422 - BLOCK
    )
    :vars
    (
      ?auto_85423 - BLOCK
      ?auto_85424 - BLOCK
      ?auto_85425 - BLOCK
      ?auto_85426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85420 ?auto_85421 ) ) ( not ( = ?auto_85420 ?auto_85422 ) ) ( not ( = ?auto_85421 ?auto_85422 ) ) ( ON ?auto_85422 ?auto_85423 ) ( not ( = ?auto_85420 ?auto_85423 ) ) ( not ( = ?auto_85421 ?auto_85423 ) ) ( not ( = ?auto_85422 ?auto_85423 ) ) ( ON ?auto_85421 ?auto_85422 ) ( ON-TABLE ?auto_85424 ) ( ON ?auto_85425 ?auto_85424 ) ( ON ?auto_85426 ?auto_85425 ) ( ON ?auto_85423 ?auto_85426 ) ( not ( = ?auto_85424 ?auto_85425 ) ) ( not ( = ?auto_85424 ?auto_85426 ) ) ( not ( = ?auto_85424 ?auto_85423 ) ) ( not ( = ?auto_85424 ?auto_85422 ) ) ( not ( = ?auto_85424 ?auto_85421 ) ) ( not ( = ?auto_85425 ?auto_85426 ) ) ( not ( = ?auto_85425 ?auto_85423 ) ) ( not ( = ?auto_85425 ?auto_85422 ) ) ( not ( = ?auto_85425 ?auto_85421 ) ) ( not ( = ?auto_85426 ?auto_85423 ) ) ( not ( = ?auto_85426 ?auto_85422 ) ) ( not ( = ?auto_85426 ?auto_85421 ) ) ( not ( = ?auto_85420 ?auto_85424 ) ) ( not ( = ?auto_85420 ?auto_85425 ) ) ( not ( = ?auto_85420 ?auto_85426 ) ) ( ON ?auto_85420 ?auto_85421 ) ( CLEAR ?auto_85420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85424 ?auto_85425 ?auto_85426 ?auto_85423 ?auto_85422 ?auto_85421 )
      ( MAKE-3PILE ?auto_85420 ?auto_85421 ?auto_85422 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85430 - BLOCK
      ?auto_85431 - BLOCK
      ?auto_85432 - BLOCK
    )
    :vars
    (
      ?auto_85434 - BLOCK
      ?auto_85433 - BLOCK
      ?auto_85435 - BLOCK
      ?auto_85436 - BLOCK
      ?auto_85437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85430 ?auto_85431 ) ) ( not ( = ?auto_85430 ?auto_85432 ) ) ( not ( = ?auto_85431 ?auto_85432 ) ) ( ON ?auto_85432 ?auto_85434 ) ( not ( = ?auto_85430 ?auto_85434 ) ) ( not ( = ?auto_85431 ?auto_85434 ) ) ( not ( = ?auto_85432 ?auto_85434 ) ) ( ON ?auto_85431 ?auto_85432 ) ( CLEAR ?auto_85431 ) ( ON-TABLE ?auto_85433 ) ( ON ?auto_85435 ?auto_85433 ) ( ON ?auto_85436 ?auto_85435 ) ( ON ?auto_85434 ?auto_85436 ) ( not ( = ?auto_85433 ?auto_85435 ) ) ( not ( = ?auto_85433 ?auto_85436 ) ) ( not ( = ?auto_85433 ?auto_85434 ) ) ( not ( = ?auto_85433 ?auto_85432 ) ) ( not ( = ?auto_85433 ?auto_85431 ) ) ( not ( = ?auto_85435 ?auto_85436 ) ) ( not ( = ?auto_85435 ?auto_85434 ) ) ( not ( = ?auto_85435 ?auto_85432 ) ) ( not ( = ?auto_85435 ?auto_85431 ) ) ( not ( = ?auto_85436 ?auto_85434 ) ) ( not ( = ?auto_85436 ?auto_85432 ) ) ( not ( = ?auto_85436 ?auto_85431 ) ) ( not ( = ?auto_85430 ?auto_85433 ) ) ( not ( = ?auto_85430 ?auto_85435 ) ) ( not ( = ?auto_85430 ?auto_85436 ) ) ( ON ?auto_85430 ?auto_85437 ) ( CLEAR ?auto_85430 ) ( HAND-EMPTY ) ( not ( = ?auto_85430 ?auto_85437 ) ) ( not ( = ?auto_85431 ?auto_85437 ) ) ( not ( = ?auto_85432 ?auto_85437 ) ) ( not ( = ?auto_85434 ?auto_85437 ) ) ( not ( = ?auto_85433 ?auto_85437 ) ) ( not ( = ?auto_85435 ?auto_85437 ) ) ( not ( = ?auto_85436 ?auto_85437 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85430 ?auto_85437 )
      ( MAKE-3PILE ?auto_85430 ?auto_85431 ?auto_85432 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85438 - BLOCK
      ?auto_85439 - BLOCK
      ?auto_85440 - BLOCK
    )
    :vars
    (
      ?auto_85442 - BLOCK
      ?auto_85444 - BLOCK
      ?auto_85441 - BLOCK
      ?auto_85445 - BLOCK
      ?auto_85443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85438 ?auto_85439 ) ) ( not ( = ?auto_85438 ?auto_85440 ) ) ( not ( = ?auto_85439 ?auto_85440 ) ) ( ON ?auto_85440 ?auto_85442 ) ( not ( = ?auto_85438 ?auto_85442 ) ) ( not ( = ?auto_85439 ?auto_85442 ) ) ( not ( = ?auto_85440 ?auto_85442 ) ) ( ON-TABLE ?auto_85444 ) ( ON ?auto_85441 ?auto_85444 ) ( ON ?auto_85445 ?auto_85441 ) ( ON ?auto_85442 ?auto_85445 ) ( not ( = ?auto_85444 ?auto_85441 ) ) ( not ( = ?auto_85444 ?auto_85445 ) ) ( not ( = ?auto_85444 ?auto_85442 ) ) ( not ( = ?auto_85444 ?auto_85440 ) ) ( not ( = ?auto_85444 ?auto_85439 ) ) ( not ( = ?auto_85441 ?auto_85445 ) ) ( not ( = ?auto_85441 ?auto_85442 ) ) ( not ( = ?auto_85441 ?auto_85440 ) ) ( not ( = ?auto_85441 ?auto_85439 ) ) ( not ( = ?auto_85445 ?auto_85442 ) ) ( not ( = ?auto_85445 ?auto_85440 ) ) ( not ( = ?auto_85445 ?auto_85439 ) ) ( not ( = ?auto_85438 ?auto_85444 ) ) ( not ( = ?auto_85438 ?auto_85441 ) ) ( not ( = ?auto_85438 ?auto_85445 ) ) ( ON ?auto_85438 ?auto_85443 ) ( CLEAR ?auto_85438 ) ( not ( = ?auto_85438 ?auto_85443 ) ) ( not ( = ?auto_85439 ?auto_85443 ) ) ( not ( = ?auto_85440 ?auto_85443 ) ) ( not ( = ?auto_85442 ?auto_85443 ) ) ( not ( = ?auto_85444 ?auto_85443 ) ) ( not ( = ?auto_85441 ?auto_85443 ) ) ( not ( = ?auto_85445 ?auto_85443 ) ) ( HOLDING ?auto_85439 ) ( CLEAR ?auto_85440 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85444 ?auto_85441 ?auto_85445 ?auto_85442 ?auto_85440 ?auto_85439 )
      ( MAKE-3PILE ?auto_85438 ?auto_85439 ?auto_85440 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85446 - BLOCK
      ?auto_85447 - BLOCK
      ?auto_85448 - BLOCK
    )
    :vars
    (
      ?auto_85450 - BLOCK
      ?auto_85453 - BLOCK
      ?auto_85449 - BLOCK
      ?auto_85452 - BLOCK
      ?auto_85451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85446 ?auto_85447 ) ) ( not ( = ?auto_85446 ?auto_85448 ) ) ( not ( = ?auto_85447 ?auto_85448 ) ) ( ON ?auto_85448 ?auto_85450 ) ( not ( = ?auto_85446 ?auto_85450 ) ) ( not ( = ?auto_85447 ?auto_85450 ) ) ( not ( = ?auto_85448 ?auto_85450 ) ) ( ON-TABLE ?auto_85453 ) ( ON ?auto_85449 ?auto_85453 ) ( ON ?auto_85452 ?auto_85449 ) ( ON ?auto_85450 ?auto_85452 ) ( not ( = ?auto_85453 ?auto_85449 ) ) ( not ( = ?auto_85453 ?auto_85452 ) ) ( not ( = ?auto_85453 ?auto_85450 ) ) ( not ( = ?auto_85453 ?auto_85448 ) ) ( not ( = ?auto_85453 ?auto_85447 ) ) ( not ( = ?auto_85449 ?auto_85452 ) ) ( not ( = ?auto_85449 ?auto_85450 ) ) ( not ( = ?auto_85449 ?auto_85448 ) ) ( not ( = ?auto_85449 ?auto_85447 ) ) ( not ( = ?auto_85452 ?auto_85450 ) ) ( not ( = ?auto_85452 ?auto_85448 ) ) ( not ( = ?auto_85452 ?auto_85447 ) ) ( not ( = ?auto_85446 ?auto_85453 ) ) ( not ( = ?auto_85446 ?auto_85449 ) ) ( not ( = ?auto_85446 ?auto_85452 ) ) ( ON ?auto_85446 ?auto_85451 ) ( not ( = ?auto_85446 ?auto_85451 ) ) ( not ( = ?auto_85447 ?auto_85451 ) ) ( not ( = ?auto_85448 ?auto_85451 ) ) ( not ( = ?auto_85450 ?auto_85451 ) ) ( not ( = ?auto_85453 ?auto_85451 ) ) ( not ( = ?auto_85449 ?auto_85451 ) ) ( not ( = ?auto_85452 ?auto_85451 ) ) ( CLEAR ?auto_85448 ) ( ON ?auto_85447 ?auto_85446 ) ( CLEAR ?auto_85447 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85451 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85451 ?auto_85446 )
      ( MAKE-3PILE ?auto_85446 ?auto_85447 ?auto_85448 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85454 - BLOCK
      ?auto_85455 - BLOCK
      ?auto_85456 - BLOCK
    )
    :vars
    (
      ?auto_85457 - BLOCK
      ?auto_85461 - BLOCK
      ?auto_85458 - BLOCK
      ?auto_85459 - BLOCK
      ?auto_85460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85454 ?auto_85455 ) ) ( not ( = ?auto_85454 ?auto_85456 ) ) ( not ( = ?auto_85455 ?auto_85456 ) ) ( not ( = ?auto_85454 ?auto_85457 ) ) ( not ( = ?auto_85455 ?auto_85457 ) ) ( not ( = ?auto_85456 ?auto_85457 ) ) ( ON-TABLE ?auto_85461 ) ( ON ?auto_85458 ?auto_85461 ) ( ON ?auto_85459 ?auto_85458 ) ( ON ?auto_85457 ?auto_85459 ) ( not ( = ?auto_85461 ?auto_85458 ) ) ( not ( = ?auto_85461 ?auto_85459 ) ) ( not ( = ?auto_85461 ?auto_85457 ) ) ( not ( = ?auto_85461 ?auto_85456 ) ) ( not ( = ?auto_85461 ?auto_85455 ) ) ( not ( = ?auto_85458 ?auto_85459 ) ) ( not ( = ?auto_85458 ?auto_85457 ) ) ( not ( = ?auto_85458 ?auto_85456 ) ) ( not ( = ?auto_85458 ?auto_85455 ) ) ( not ( = ?auto_85459 ?auto_85457 ) ) ( not ( = ?auto_85459 ?auto_85456 ) ) ( not ( = ?auto_85459 ?auto_85455 ) ) ( not ( = ?auto_85454 ?auto_85461 ) ) ( not ( = ?auto_85454 ?auto_85458 ) ) ( not ( = ?auto_85454 ?auto_85459 ) ) ( ON ?auto_85454 ?auto_85460 ) ( not ( = ?auto_85454 ?auto_85460 ) ) ( not ( = ?auto_85455 ?auto_85460 ) ) ( not ( = ?auto_85456 ?auto_85460 ) ) ( not ( = ?auto_85457 ?auto_85460 ) ) ( not ( = ?auto_85461 ?auto_85460 ) ) ( not ( = ?auto_85458 ?auto_85460 ) ) ( not ( = ?auto_85459 ?auto_85460 ) ) ( ON ?auto_85455 ?auto_85454 ) ( CLEAR ?auto_85455 ) ( ON-TABLE ?auto_85460 ) ( HOLDING ?auto_85456 ) ( CLEAR ?auto_85457 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85461 ?auto_85458 ?auto_85459 ?auto_85457 ?auto_85456 )
      ( MAKE-3PILE ?auto_85454 ?auto_85455 ?auto_85456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85462 - BLOCK
      ?auto_85463 - BLOCK
      ?auto_85464 - BLOCK
    )
    :vars
    (
      ?auto_85465 - BLOCK
      ?auto_85469 - BLOCK
      ?auto_85466 - BLOCK
      ?auto_85468 - BLOCK
      ?auto_85467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85462 ?auto_85463 ) ) ( not ( = ?auto_85462 ?auto_85464 ) ) ( not ( = ?auto_85463 ?auto_85464 ) ) ( not ( = ?auto_85462 ?auto_85465 ) ) ( not ( = ?auto_85463 ?auto_85465 ) ) ( not ( = ?auto_85464 ?auto_85465 ) ) ( ON-TABLE ?auto_85469 ) ( ON ?auto_85466 ?auto_85469 ) ( ON ?auto_85468 ?auto_85466 ) ( ON ?auto_85465 ?auto_85468 ) ( not ( = ?auto_85469 ?auto_85466 ) ) ( not ( = ?auto_85469 ?auto_85468 ) ) ( not ( = ?auto_85469 ?auto_85465 ) ) ( not ( = ?auto_85469 ?auto_85464 ) ) ( not ( = ?auto_85469 ?auto_85463 ) ) ( not ( = ?auto_85466 ?auto_85468 ) ) ( not ( = ?auto_85466 ?auto_85465 ) ) ( not ( = ?auto_85466 ?auto_85464 ) ) ( not ( = ?auto_85466 ?auto_85463 ) ) ( not ( = ?auto_85468 ?auto_85465 ) ) ( not ( = ?auto_85468 ?auto_85464 ) ) ( not ( = ?auto_85468 ?auto_85463 ) ) ( not ( = ?auto_85462 ?auto_85469 ) ) ( not ( = ?auto_85462 ?auto_85466 ) ) ( not ( = ?auto_85462 ?auto_85468 ) ) ( ON ?auto_85462 ?auto_85467 ) ( not ( = ?auto_85462 ?auto_85467 ) ) ( not ( = ?auto_85463 ?auto_85467 ) ) ( not ( = ?auto_85464 ?auto_85467 ) ) ( not ( = ?auto_85465 ?auto_85467 ) ) ( not ( = ?auto_85469 ?auto_85467 ) ) ( not ( = ?auto_85466 ?auto_85467 ) ) ( not ( = ?auto_85468 ?auto_85467 ) ) ( ON ?auto_85463 ?auto_85462 ) ( ON-TABLE ?auto_85467 ) ( CLEAR ?auto_85465 ) ( ON ?auto_85464 ?auto_85463 ) ( CLEAR ?auto_85464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85467 ?auto_85462 ?auto_85463 )
      ( MAKE-3PILE ?auto_85462 ?auto_85463 ?auto_85464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85470 - BLOCK
      ?auto_85471 - BLOCK
      ?auto_85472 - BLOCK
    )
    :vars
    (
      ?auto_85476 - BLOCK
      ?auto_85473 - BLOCK
      ?auto_85474 - BLOCK
      ?auto_85477 - BLOCK
      ?auto_85475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85470 ?auto_85471 ) ) ( not ( = ?auto_85470 ?auto_85472 ) ) ( not ( = ?auto_85471 ?auto_85472 ) ) ( not ( = ?auto_85470 ?auto_85476 ) ) ( not ( = ?auto_85471 ?auto_85476 ) ) ( not ( = ?auto_85472 ?auto_85476 ) ) ( ON-TABLE ?auto_85473 ) ( ON ?auto_85474 ?auto_85473 ) ( ON ?auto_85477 ?auto_85474 ) ( not ( = ?auto_85473 ?auto_85474 ) ) ( not ( = ?auto_85473 ?auto_85477 ) ) ( not ( = ?auto_85473 ?auto_85476 ) ) ( not ( = ?auto_85473 ?auto_85472 ) ) ( not ( = ?auto_85473 ?auto_85471 ) ) ( not ( = ?auto_85474 ?auto_85477 ) ) ( not ( = ?auto_85474 ?auto_85476 ) ) ( not ( = ?auto_85474 ?auto_85472 ) ) ( not ( = ?auto_85474 ?auto_85471 ) ) ( not ( = ?auto_85477 ?auto_85476 ) ) ( not ( = ?auto_85477 ?auto_85472 ) ) ( not ( = ?auto_85477 ?auto_85471 ) ) ( not ( = ?auto_85470 ?auto_85473 ) ) ( not ( = ?auto_85470 ?auto_85474 ) ) ( not ( = ?auto_85470 ?auto_85477 ) ) ( ON ?auto_85470 ?auto_85475 ) ( not ( = ?auto_85470 ?auto_85475 ) ) ( not ( = ?auto_85471 ?auto_85475 ) ) ( not ( = ?auto_85472 ?auto_85475 ) ) ( not ( = ?auto_85476 ?auto_85475 ) ) ( not ( = ?auto_85473 ?auto_85475 ) ) ( not ( = ?auto_85474 ?auto_85475 ) ) ( not ( = ?auto_85477 ?auto_85475 ) ) ( ON ?auto_85471 ?auto_85470 ) ( ON-TABLE ?auto_85475 ) ( ON ?auto_85472 ?auto_85471 ) ( CLEAR ?auto_85472 ) ( HOLDING ?auto_85476 ) ( CLEAR ?auto_85477 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85473 ?auto_85474 ?auto_85477 ?auto_85476 )
      ( MAKE-3PILE ?auto_85470 ?auto_85471 ?auto_85472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85478 - BLOCK
      ?auto_85479 - BLOCK
      ?auto_85480 - BLOCK
    )
    :vars
    (
      ?auto_85482 - BLOCK
      ?auto_85481 - BLOCK
      ?auto_85483 - BLOCK
      ?auto_85484 - BLOCK
      ?auto_85485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85478 ?auto_85479 ) ) ( not ( = ?auto_85478 ?auto_85480 ) ) ( not ( = ?auto_85479 ?auto_85480 ) ) ( not ( = ?auto_85478 ?auto_85482 ) ) ( not ( = ?auto_85479 ?auto_85482 ) ) ( not ( = ?auto_85480 ?auto_85482 ) ) ( ON-TABLE ?auto_85481 ) ( ON ?auto_85483 ?auto_85481 ) ( ON ?auto_85484 ?auto_85483 ) ( not ( = ?auto_85481 ?auto_85483 ) ) ( not ( = ?auto_85481 ?auto_85484 ) ) ( not ( = ?auto_85481 ?auto_85482 ) ) ( not ( = ?auto_85481 ?auto_85480 ) ) ( not ( = ?auto_85481 ?auto_85479 ) ) ( not ( = ?auto_85483 ?auto_85484 ) ) ( not ( = ?auto_85483 ?auto_85482 ) ) ( not ( = ?auto_85483 ?auto_85480 ) ) ( not ( = ?auto_85483 ?auto_85479 ) ) ( not ( = ?auto_85484 ?auto_85482 ) ) ( not ( = ?auto_85484 ?auto_85480 ) ) ( not ( = ?auto_85484 ?auto_85479 ) ) ( not ( = ?auto_85478 ?auto_85481 ) ) ( not ( = ?auto_85478 ?auto_85483 ) ) ( not ( = ?auto_85478 ?auto_85484 ) ) ( ON ?auto_85478 ?auto_85485 ) ( not ( = ?auto_85478 ?auto_85485 ) ) ( not ( = ?auto_85479 ?auto_85485 ) ) ( not ( = ?auto_85480 ?auto_85485 ) ) ( not ( = ?auto_85482 ?auto_85485 ) ) ( not ( = ?auto_85481 ?auto_85485 ) ) ( not ( = ?auto_85483 ?auto_85485 ) ) ( not ( = ?auto_85484 ?auto_85485 ) ) ( ON ?auto_85479 ?auto_85478 ) ( ON-TABLE ?auto_85485 ) ( ON ?auto_85480 ?auto_85479 ) ( CLEAR ?auto_85484 ) ( ON ?auto_85482 ?auto_85480 ) ( CLEAR ?auto_85482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85485 ?auto_85478 ?auto_85479 ?auto_85480 )
      ( MAKE-3PILE ?auto_85478 ?auto_85479 ?auto_85480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85486 - BLOCK
      ?auto_85487 - BLOCK
      ?auto_85488 - BLOCK
    )
    :vars
    (
      ?auto_85491 - BLOCK
      ?auto_85490 - BLOCK
      ?auto_85492 - BLOCK
      ?auto_85493 - BLOCK
      ?auto_85489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85486 ?auto_85487 ) ) ( not ( = ?auto_85486 ?auto_85488 ) ) ( not ( = ?auto_85487 ?auto_85488 ) ) ( not ( = ?auto_85486 ?auto_85491 ) ) ( not ( = ?auto_85487 ?auto_85491 ) ) ( not ( = ?auto_85488 ?auto_85491 ) ) ( ON-TABLE ?auto_85490 ) ( ON ?auto_85492 ?auto_85490 ) ( not ( = ?auto_85490 ?auto_85492 ) ) ( not ( = ?auto_85490 ?auto_85493 ) ) ( not ( = ?auto_85490 ?auto_85491 ) ) ( not ( = ?auto_85490 ?auto_85488 ) ) ( not ( = ?auto_85490 ?auto_85487 ) ) ( not ( = ?auto_85492 ?auto_85493 ) ) ( not ( = ?auto_85492 ?auto_85491 ) ) ( not ( = ?auto_85492 ?auto_85488 ) ) ( not ( = ?auto_85492 ?auto_85487 ) ) ( not ( = ?auto_85493 ?auto_85491 ) ) ( not ( = ?auto_85493 ?auto_85488 ) ) ( not ( = ?auto_85493 ?auto_85487 ) ) ( not ( = ?auto_85486 ?auto_85490 ) ) ( not ( = ?auto_85486 ?auto_85492 ) ) ( not ( = ?auto_85486 ?auto_85493 ) ) ( ON ?auto_85486 ?auto_85489 ) ( not ( = ?auto_85486 ?auto_85489 ) ) ( not ( = ?auto_85487 ?auto_85489 ) ) ( not ( = ?auto_85488 ?auto_85489 ) ) ( not ( = ?auto_85491 ?auto_85489 ) ) ( not ( = ?auto_85490 ?auto_85489 ) ) ( not ( = ?auto_85492 ?auto_85489 ) ) ( not ( = ?auto_85493 ?auto_85489 ) ) ( ON ?auto_85487 ?auto_85486 ) ( ON-TABLE ?auto_85489 ) ( ON ?auto_85488 ?auto_85487 ) ( ON ?auto_85491 ?auto_85488 ) ( CLEAR ?auto_85491 ) ( HOLDING ?auto_85493 ) ( CLEAR ?auto_85492 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85490 ?auto_85492 ?auto_85493 )
      ( MAKE-3PILE ?auto_85486 ?auto_85487 ?auto_85488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85494 - BLOCK
      ?auto_85495 - BLOCK
      ?auto_85496 - BLOCK
    )
    :vars
    (
      ?auto_85498 - BLOCK
      ?auto_85497 - BLOCK
      ?auto_85501 - BLOCK
      ?auto_85499 - BLOCK
      ?auto_85500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85494 ?auto_85495 ) ) ( not ( = ?auto_85494 ?auto_85496 ) ) ( not ( = ?auto_85495 ?auto_85496 ) ) ( not ( = ?auto_85494 ?auto_85498 ) ) ( not ( = ?auto_85495 ?auto_85498 ) ) ( not ( = ?auto_85496 ?auto_85498 ) ) ( ON-TABLE ?auto_85497 ) ( ON ?auto_85501 ?auto_85497 ) ( not ( = ?auto_85497 ?auto_85501 ) ) ( not ( = ?auto_85497 ?auto_85499 ) ) ( not ( = ?auto_85497 ?auto_85498 ) ) ( not ( = ?auto_85497 ?auto_85496 ) ) ( not ( = ?auto_85497 ?auto_85495 ) ) ( not ( = ?auto_85501 ?auto_85499 ) ) ( not ( = ?auto_85501 ?auto_85498 ) ) ( not ( = ?auto_85501 ?auto_85496 ) ) ( not ( = ?auto_85501 ?auto_85495 ) ) ( not ( = ?auto_85499 ?auto_85498 ) ) ( not ( = ?auto_85499 ?auto_85496 ) ) ( not ( = ?auto_85499 ?auto_85495 ) ) ( not ( = ?auto_85494 ?auto_85497 ) ) ( not ( = ?auto_85494 ?auto_85501 ) ) ( not ( = ?auto_85494 ?auto_85499 ) ) ( ON ?auto_85494 ?auto_85500 ) ( not ( = ?auto_85494 ?auto_85500 ) ) ( not ( = ?auto_85495 ?auto_85500 ) ) ( not ( = ?auto_85496 ?auto_85500 ) ) ( not ( = ?auto_85498 ?auto_85500 ) ) ( not ( = ?auto_85497 ?auto_85500 ) ) ( not ( = ?auto_85501 ?auto_85500 ) ) ( not ( = ?auto_85499 ?auto_85500 ) ) ( ON ?auto_85495 ?auto_85494 ) ( ON-TABLE ?auto_85500 ) ( ON ?auto_85496 ?auto_85495 ) ( ON ?auto_85498 ?auto_85496 ) ( CLEAR ?auto_85501 ) ( ON ?auto_85499 ?auto_85498 ) ( CLEAR ?auto_85499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85500 ?auto_85494 ?auto_85495 ?auto_85496 ?auto_85498 )
      ( MAKE-3PILE ?auto_85494 ?auto_85495 ?auto_85496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85502 - BLOCK
      ?auto_85503 - BLOCK
      ?auto_85504 - BLOCK
    )
    :vars
    (
      ?auto_85506 - BLOCK
      ?auto_85505 - BLOCK
      ?auto_85507 - BLOCK
      ?auto_85509 - BLOCK
      ?auto_85508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85502 ?auto_85503 ) ) ( not ( = ?auto_85502 ?auto_85504 ) ) ( not ( = ?auto_85503 ?auto_85504 ) ) ( not ( = ?auto_85502 ?auto_85506 ) ) ( not ( = ?auto_85503 ?auto_85506 ) ) ( not ( = ?auto_85504 ?auto_85506 ) ) ( ON-TABLE ?auto_85505 ) ( not ( = ?auto_85505 ?auto_85507 ) ) ( not ( = ?auto_85505 ?auto_85509 ) ) ( not ( = ?auto_85505 ?auto_85506 ) ) ( not ( = ?auto_85505 ?auto_85504 ) ) ( not ( = ?auto_85505 ?auto_85503 ) ) ( not ( = ?auto_85507 ?auto_85509 ) ) ( not ( = ?auto_85507 ?auto_85506 ) ) ( not ( = ?auto_85507 ?auto_85504 ) ) ( not ( = ?auto_85507 ?auto_85503 ) ) ( not ( = ?auto_85509 ?auto_85506 ) ) ( not ( = ?auto_85509 ?auto_85504 ) ) ( not ( = ?auto_85509 ?auto_85503 ) ) ( not ( = ?auto_85502 ?auto_85505 ) ) ( not ( = ?auto_85502 ?auto_85507 ) ) ( not ( = ?auto_85502 ?auto_85509 ) ) ( ON ?auto_85502 ?auto_85508 ) ( not ( = ?auto_85502 ?auto_85508 ) ) ( not ( = ?auto_85503 ?auto_85508 ) ) ( not ( = ?auto_85504 ?auto_85508 ) ) ( not ( = ?auto_85506 ?auto_85508 ) ) ( not ( = ?auto_85505 ?auto_85508 ) ) ( not ( = ?auto_85507 ?auto_85508 ) ) ( not ( = ?auto_85509 ?auto_85508 ) ) ( ON ?auto_85503 ?auto_85502 ) ( ON-TABLE ?auto_85508 ) ( ON ?auto_85504 ?auto_85503 ) ( ON ?auto_85506 ?auto_85504 ) ( ON ?auto_85509 ?auto_85506 ) ( CLEAR ?auto_85509 ) ( HOLDING ?auto_85507 ) ( CLEAR ?auto_85505 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85505 ?auto_85507 )
      ( MAKE-3PILE ?auto_85502 ?auto_85503 ?auto_85504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85510 - BLOCK
      ?auto_85511 - BLOCK
      ?auto_85512 - BLOCK
    )
    :vars
    (
      ?auto_85515 - BLOCK
      ?auto_85516 - BLOCK
      ?auto_85517 - BLOCK
      ?auto_85513 - BLOCK
      ?auto_85514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85510 ?auto_85511 ) ) ( not ( = ?auto_85510 ?auto_85512 ) ) ( not ( = ?auto_85511 ?auto_85512 ) ) ( not ( = ?auto_85510 ?auto_85515 ) ) ( not ( = ?auto_85511 ?auto_85515 ) ) ( not ( = ?auto_85512 ?auto_85515 ) ) ( ON-TABLE ?auto_85516 ) ( not ( = ?auto_85516 ?auto_85517 ) ) ( not ( = ?auto_85516 ?auto_85513 ) ) ( not ( = ?auto_85516 ?auto_85515 ) ) ( not ( = ?auto_85516 ?auto_85512 ) ) ( not ( = ?auto_85516 ?auto_85511 ) ) ( not ( = ?auto_85517 ?auto_85513 ) ) ( not ( = ?auto_85517 ?auto_85515 ) ) ( not ( = ?auto_85517 ?auto_85512 ) ) ( not ( = ?auto_85517 ?auto_85511 ) ) ( not ( = ?auto_85513 ?auto_85515 ) ) ( not ( = ?auto_85513 ?auto_85512 ) ) ( not ( = ?auto_85513 ?auto_85511 ) ) ( not ( = ?auto_85510 ?auto_85516 ) ) ( not ( = ?auto_85510 ?auto_85517 ) ) ( not ( = ?auto_85510 ?auto_85513 ) ) ( ON ?auto_85510 ?auto_85514 ) ( not ( = ?auto_85510 ?auto_85514 ) ) ( not ( = ?auto_85511 ?auto_85514 ) ) ( not ( = ?auto_85512 ?auto_85514 ) ) ( not ( = ?auto_85515 ?auto_85514 ) ) ( not ( = ?auto_85516 ?auto_85514 ) ) ( not ( = ?auto_85517 ?auto_85514 ) ) ( not ( = ?auto_85513 ?auto_85514 ) ) ( ON ?auto_85511 ?auto_85510 ) ( ON-TABLE ?auto_85514 ) ( ON ?auto_85512 ?auto_85511 ) ( ON ?auto_85515 ?auto_85512 ) ( ON ?auto_85513 ?auto_85515 ) ( CLEAR ?auto_85516 ) ( ON ?auto_85517 ?auto_85513 ) ( CLEAR ?auto_85517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85514 ?auto_85510 ?auto_85511 ?auto_85512 ?auto_85515 ?auto_85513 )
      ( MAKE-3PILE ?auto_85510 ?auto_85511 ?auto_85512 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85518 - BLOCK
      ?auto_85519 - BLOCK
      ?auto_85520 - BLOCK
    )
    :vars
    (
      ?auto_85521 - BLOCK
      ?auto_85524 - BLOCK
      ?auto_85523 - BLOCK
      ?auto_85525 - BLOCK
      ?auto_85522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85518 ?auto_85519 ) ) ( not ( = ?auto_85518 ?auto_85520 ) ) ( not ( = ?auto_85519 ?auto_85520 ) ) ( not ( = ?auto_85518 ?auto_85521 ) ) ( not ( = ?auto_85519 ?auto_85521 ) ) ( not ( = ?auto_85520 ?auto_85521 ) ) ( not ( = ?auto_85524 ?auto_85523 ) ) ( not ( = ?auto_85524 ?auto_85525 ) ) ( not ( = ?auto_85524 ?auto_85521 ) ) ( not ( = ?auto_85524 ?auto_85520 ) ) ( not ( = ?auto_85524 ?auto_85519 ) ) ( not ( = ?auto_85523 ?auto_85525 ) ) ( not ( = ?auto_85523 ?auto_85521 ) ) ( not ( = ?auto_85523 ?auto_85520 ) ) ( not ( = ?auto_85523 ?auto_85519 ) ) ( not ( = ?auto_85525 ?auto_85521 ) ) ( not ( = ?auto_85525 ?auto_85520 ) ) ( not ( = ?auto_85525 ?auto_85519 ) ) ( not ( = ?auto_85518 ?auto_85524 ) ) ( not ( = ?auto_85518 ?auto_85523 ) ) ( not ( = ?auto_85518 ?auto_85525 ) ) ( ON ?auto_85518 ?auto_85522 ) ( not ( = ?auto_85518 ?auto_85522 ) ) ( not ( = ?auto_85519 ?auto_85522 ) ) ( not ( = ?auto_85520 ?auto_85522 ) ) ( not ( = ?auto_85521 ?auto_85522 ) ) ( not ( = ?auto_85524 ?auto_85522 ) ) ( not ( = ?auto_85523 ?auto_85522 ) ) ( not ( = ?auto_85525 ?auto_85522 ) ) ( ON ?auto_85519 ?auto_85518 ) ( ON-TABLE ?auto_85522 ) ( ON ?auto_85520 ?auto_85519 ) ( ON ?auto_85521 ?auto_85520 ) ( ON ?auto_85525 ?auto_85521 ) ( ON ?auto_85523 ?auto_85525 ) ( CLEAR ?auto_85523 ) ( HOLDING ?auto_85524 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85524 )
      ( MAKE-3PILE ?auto_85518 ?auto_85519 ?auto_85520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85526 - BLOCK
      ?auto_85527 - BLOCK
      ?auto_85528 - BLOCK
    )
    :vars
    (
      ?auto_85531 - BLOCK
      ?auto_85530 - BLOCK
      ?auto_85533 - BLOCK
      ?auto_85532 - BLOCK
      ?auto_85529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85526 ?auto_85527 ) ) ( not ( = ?auto_85526 ?auto_85528 ) ) ( not ( = ?auto_85527 ?auto_85528 ) ) ( not ( = ?auto_85526 ?auto_85531 ) ) ( not ( = ?auto_85527 ?auto_85531 ) ) ( not ( = ?auto_85528 ?auto_85531 ) ) ( not ( = ?auto_85530 ?auto_85533 ) ) ( not ( = ?auto_85530 ?auto_85532 ) ) ( not ( = ?auto_85530 ?auto_85531 ) ) ( not ( = ?auto_85530 ?auto_85528 ) ) ( not ( = ?auto_85530 ?auto_85527 ) ) ( not ( = ?auto_85533 ?auto_85532 ) ) ( not ( = ?auto_85533 ?auto_85531 ) ) ( not ( = ?auto_85533 ?auto_85528 ) ) ( not ( = ?auto_85533 ?auto_85527 ) ) ( not ( = ?auto_85532 ?auto_85531 ) ) ( not ( = ?auto_85532 ?auto_85528 ) ) ( not ( = ?auto_85532 ?auto_85527 ) ) ( not ( = ?auto_85526 ?auto_85530 ) ) ( not ( = ?auto_85526 ?auto_85533 ) ) ( not ( = ?auto_85526 ?auto_85532 ) ) ( ON ?auto_85526 ?auto_85529 ) ( not ( = ?auto_85526 ?auto_85529 ) ) ( not ( = ?auto_85527 ?auto_85529 ) ) ( not ( = ?auto_85528 ?auto_85529 ) ) ( not ( = ?auto_85531 ?auto_85529 ) ) ( not ( = ?auto_85530 ?auto_85529 ) ) ( not ( = ?auto_85533 ?auto_85529 ) ) ( not ( = ?auto_85532 ?auto_85529 ) ) ( ON ?auto_85527 ?auto_85526 ) ( ON-TABLE ?auto_85529 ) ( ON ?auto_85528 ?auto_85527 ) ( ON ?auto_85531 ?auto_85528 ) ( ON ?auto_85532 ?auto_85531 ) ( ON ?auto_85533 ?auto_85532 ) ( ON ?auto_85530 ?auto_85533 ) ( CLEAR ?auto_85530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85529 ?auto_85526 ?auto_85527 ?auto_85528 ?auto_85531 ?auto_85532 ?auto_85533 )
      ( MAKE-3PILE ?auto_85526 ?auto_85527 ?auto_85528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85553 - BLOCK
      ?auto_85554 - BLOCK
      ?auto_85555 - BLOCK
    )
    :vars
    (
      ?auto_85558 - BLOCK
      ?auto_85556 - BLOCK
      ?auto_85557 - BLOCK
      ?auto_85559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85558 ?auto_85555 ) ( ON-TABLE ?auto_85553 ) ( ON ?auto_85554 ?auto_85553 ) ( ON ?auto_85555 ?auto_85554 ) ( not ( = ?auto_85553 ?auto_85554 ) ) ( not ( = ?auto_85553 ?auto_85555 ) ) ( not ( = ?auto_85553 ?auto_85558 ) ) ( not ( = ?auto_85554 ?auto_85555 ) ) ( not ( = ?auto_85554 ?auto_85558 ) ) ( not ( = ?auto_85555 ?auto_85558 ) ) ( not ( = ?auto_85553 ?auto_85556 ) ) ( not ( = ?auto_85553 ?auto_85557 ) ) ( not ( = ?auto_85554 ?auto_85556 ) ) ( not ( = ?auto_85554 ?auto_85557 ) ) ( not ( = ?auto_85555 ?auto_85556 ) ) ( not ( = ?auto_85555 ?auto_85557 ) ) ( not ( = ?auto_85558 ?auto_85556 ) ) ( not ( = ?auto_85558 ?auto_85557 ) ) ( not ( = ?auto_85556 ?auto_85557 ) ) ( ON ?auto_85556 ?auto_85558 ) ( CLEAR ?auto_85556 ) ( HOLDING ?auto_85557 ) ( CLEAR ?auto_85559 ) ( ON-TABLE ?auto_85559 ) ( not ( = ?auto_85559 ?auto_85557 ) ) ( not ( = ?auto_85553 ?auto_85559 ) ) ( not ( = ?auto_85554 ?auto_85559 ) ) ( not ( = ?auto_85555 ?auto_85559 ) ) ( not ( = ?auto_85558 ?auto_85559 ) ) ( not ( = ?auto_85556 ?auto_85559 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85559 ?auto_85557 )
      ( MAKE-3PILE ?auto_85553 ?auto_85554 ?auto_85555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85560 - BLOCK
      ?auto_85561 - BLOCK
      ?auto_85562 - BLOCK
    )
    :vars
    (
      ?auto_85565 - BLOCK
      ?auto_85564 - BLOCK
      ?auto_85563 - BLOCK
      ?auto_85566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85565 ?auto_85562 ) ( ON-TABLE ?auto_85560 ) ( ON ?auto_85561 ?auto_85560 ) ( ON ?auto_85562 ?auto_85561 ) ( not ( = ?auto_85560 ?auto_85561 ) ) ( not ( = ?auto_85560 ?auto_85562 ) ) ( not ( = ?auto_85560 ?auto_85565 ) ) ( not ( = ?auto_85561 ?auto_85562 ) ) ( not ( = ?auto_85561 ?auto_85565 ) ) ( not ( = ?auto_85562 ?auto_85565 ) ) ( not ( = ?auto_85560 ?auto_85564 ) ) ( not ( = ?auto_85560 ?auto_85563 ) ) ( not ( = ?auto_85561 ?auto_85564 ) ) ( not ( = ?auto_85561 ?auto_85563 ) ) ( not ( = ?auto_85562 ?auto_85564 ) ) ( not ( = ?auto_85562 ?auto_85563 ) ) ( not ( = ?auto_85565 ?auto_85564 ) ) ( not ( = ?auto_85565 ?auto_85563 ) ) ( not ( = ?auto_85564 ?auto_85563 ) ) ( ON ?auto_85564 ?auto_85565 ) ( CLEAR ?auto_85566 ) ( ON-TABLE ?auto_85566 ) ( not ( = ?auto_85566 ?auto_85563 ) ) ( not ( = ?auto_85560 ?auto_85566 ) ) ( not ( = ?auto_85561 ?auto_85566 ) ) ( not ( = ?auto_85562 ?auto_85566 ) ) ( not ( = ?auto_85565 ?auto_85566 ) ) ( not ( = ?auto_85564 ?auto_85566 ) ) ( ON ?auto_85563 ?auto_85564 ) ( CLEAR ?auto_85563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85560 ?auto_85561 ?auto_85562 ?auto_85565 ?auto_85564 )
      ( MAKE-3PILE ?auto_85560 ?auto_85561 ?auto_85562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85567 - BLOCK
      ?auto_85568 - BLOCK
      ?auto_85569 - BLOCK
    )
    :vars
    (
      ?auto_85573 - BLOCK
      ?auto_85572 - BLOCK
      ?auto_85571 - BLOCK
      ?auto_85570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85573 ?auto_85569 ) ( ON-TABLE ?auto_85567 ) ( ON ?auto_85568 ?auto_85567 ) ( ON ?auto_85569 ?auto_85568 ) ( not ( = ?auto_85567 ?auto_85568 ) ) ( not ( = ?auto_85567 ?auto_85569 ) ) ( not ( = ?auto_85567 ?auto_85573 ) ) ( not ( = ?auto_85568 ?auto_85569 ) ) ( not ( = ?auto_85568 ?auto_85573 ) ) ( not ( = ?auto_85569 ?auto_85573 ) ) ( not ( = ?auto_85567 ?auto_85572 ) ) ( not ( = ?auto_85567 ?auto_85571 ) ) ( not ( = ?auto_85568 ?auto_85572 ) ) ( not ( = ?auto_85568 ?auto_85571 ) ) ( not ( = ?auto_85569 ?auto_85572 ) ) ( not ( = ?auto_85569 ?auto_85571 ) ) ( not ( = ?auto_85573 ?auto_85572 ) ) ( not ( = ?auto_85573 ?auto_85571 ) ) ( not ( = ?auto_85572 ?auto_85571 ) ) ( ON ?auto_85572 ?auto_85573 ) ( not ( = ?auto_85570 ?auto_85571 ) ) ( not ( = ?auto_85567 ?auto_85570 ) ) ( not ( = ?auto_85568 ?auto_85570 ) ) ( not ( = ?auto_85569 ?auto_85570 ) ) ( not ( = ?auto_85573 ?auto_85570 ) ) ( not ( = ?auto_85572 ?auto_85570 ) ) ( ON ?auto_85571 ?auto_85572 ) ( CLEAR ?auto_85571 ) ( HOLDING ?auto_85570 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85570 )
      ( MAKE-3PILE ?auto_85567 ?auto_85568 ?auto_85569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85584 - BLOCK
      ?auto_85585 - BLOCK
      ?auto_85586 - BLOCK
    )
    :vars
    (
      ?auto_85589 - BLOCK
      ?auto_85587 - BLOCK
      ?auto_85588 - BLOCK
      ?auto_85590 - BLOCK
      ?auto_85591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85589 ?auto_85586 ) ( ON-TABLE ?auto_85584 ) ( ON ?auto_85585 ?auto_85584 ) ( ON ?auto_85586 ?auto_85585 ) ( not ( = ?auto_85584 ?auto_85585 ) ) ( not ( = ?auto_85584 ?auto_85586 ) ) ( not ( = ?auto_85584 ?auto_85589 ) ) ( not ( = ?auto_85585 ?auto_85586 ) ) ( not ( = ?auto_85585 ?auto_85589 ) ) ( not ( = ?auto_85586 ?auto_85589 ) ) ( not ( = ?auto_85584 ?auto_85587 ) ) ( not ( = ?auto_85584 ?auto_85588 ) ) ( not ( = ?auto_85585 ?auto_85587 ) ) ( not ( = ?auto_85585 ?auto_85588 ) ) ( not ( = ?auto_85586 ?auto_85587 ) ) ( not ( = ?auto_85586 ?auto_85588 ) ) ( not ( = ?auto_85589 ?auto_85587 ) ) ( not ( = ?auto_85589 ?auto_85588 ) ) ( not ( = ?auto_85587 ?auto_85588 ) ) ( ON ?auto_85587 ?auto_85589 ) ( not ( = ?auto_85590 ?auto_85588 ) ) ( not ( = ?auto_85584 ?auto_85590 ) ) ( not ( = ?auto_85585 ?auto_85590 ) ) ( not ( = ?auto_85586 ?auto_85590 ) ) ( not ( = ?auto_85589 ?auto_85590 ) ) ( not ( = ?auto_85587 ?auto_85590 ) ) ( ON ?auto_85588 ?auto_85587 ) ( CLEAR ?auto_85588 ) ( ON ?auto_85590 ?auto_85591 ) ( CLEAR ?auto_85590 ) ( HAND-EMPTY ) ( not ( = ?auto_85584 ?auto_85591 ) ) ( not ( = ?auto_85585 ?auto_85591 ) ) ( not ( = ?auto_85586 ?auto_85591 ) ) ( not ( = ?auto_85589 ?auto_85591 ) ) ( not ( = ?auto_85587 ?auto_85591 ) ) ( not ( = ?auto_85588 ?auto_85591 ) ) ( not ( = ?auto_85590 ?auto_85591 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85590 ?auto_85591 )
      ( MAKE-3PILE ?auto_85584 ?auto_85585 ?auto_85586 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_85592 - BLOCK
      ?auto_85593 - BLOCK
      ?auto_85594 - BLOCK
    )
    :vars
    (
      ?auto_85598 - BLOCK
      ?auto_85599 - BLOCK
      ?auto_85597 - BLOCK
      ?auto_85596 - BLOCK
      ?auto_85595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85598 ?auto_85594 ) ( ON-TABLE ?auto_85592 ) ( ON ?auto_85593 ?auto_85592 ) ( ON ?auto_85594 ?auto_85593 ) ( not ( = ?auto_85592 ?auto_85593 ) ) ( not ( = ?auto_85592 ?auto_85594 ) ) ( not ( = ?auto_85592 ?auto_85598 ) ) ( not ( = ?auto_85593 ?auto_85594 ) ) ( not ( = ?auto_85593 ?auto_85598 ) ) ( not ( = ?auto_85594 ?auto_85598 ) ) ( not ( = ?auto_85592 ?auto_85599 ) ) ( not ( = ?auto_85592 ?auto_85597 ) ) ( not ( = ?auto_85593 ?auto_85599 ) ) ( not ( = ?auto_85593 ?auto_85597 ) ) ( not ( = ?auto_85594 ?auto_85599 ) ) ( not ( = ?auto_85594 ?auto_85597 ) ) ( not ( = ?auto_85598 ?auto_85599 ) ) ( not ( = ?auto_85598 ?auto_85597 ) ) ( not ( = ?auto_85599 ?auto_85597 ) ) ( ON ?auto_85599 ?auto_85598 ) ( not ( = ?auto_85596 ?auto_85597 ) ) ( not ( = ?auto_85592 ?auto_85596 ) ) ( not ( = ?auto_85593 ?auto_85596 ) ) ( not ( = ?auto_85594 ?auto_85596 ) ) ( not ( = ?auto_85598 ?auto_85596 ) ) ( not ( = ?auto_85599 ?auto_85596 ) ) ( ON ?auto_85596 ?auto_85595 ) ( CLEAR ?auto_85596 ) ( not ( = ?auto_85592 ?auto_85595 ) ) ( not ( = ?auto_85593 ?auto_85595 ) ) ( not ( = ?auto_85594 ?auto_85595 ) ) ( not ( = ?auto_85598 ?auto_85595 ) ) ( not ( = ?auto_85599 ?auto_85595 ) ) ( not ( = ?auto_85597 ?auto_85595 ) ) ( not ( = ?auto_85596 ?auto_85595 ) ) ( HOLDING ?auto_85597 ) ( CLEAR ?auto_85599 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85592 ?auto_85593 ?auto_85594 ?auto_85598 ?auto_85599 ?auto_85597 )
      ( MAKE-3PILE ?auto_85592 ?auto_85593 ?auto_85594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85654 - BLOCK
      ?auto_85655 - BLOCK
      ?auto_85656 - BLOCK
      ?auto_85657 - BLOCK
    )
    :vars
    (
      ?auto_85658 - BLOCK
      ?auto_85660 - BLOCK
      ?auto_85659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85654 ) ( ON ?auto_85655 ?auto_85654 ) ( not ( = ?auto_85654 ?auto_85655 ) ) ( not ( = ?auto_85654 ?auto_85656 ) ) ( not ( = ?auto_85654 ?auto_85657 ) ) ( not ( = ?auto_85655 ?auto_85656 ) ) ( not ( = ?auto_85655 ?auto_85657 ) ) ( not ( = ?auto_85656 ?auto_85657 ) ) ( ON ?auto_85657 ?auto_85658 ) ( not ( = ?auto_85654 ?auto_85658 ) ) ( not ( = ?auto_85655 ?auto_85658 ) ) ( not ( = ?auto_85656 ?auto_85658 ) ) ( not ( = ?auto_85657 ?auto_85658 ) ) ( CLEAR ?auto_85655 ) ( ON ?auto_85656 ?auto_85657 ) ( CLEAR ?auto_85656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85660 ) ( ON ?auto_85659 ?auto_85660 ) ( ON ?auto_85658 ?auto_85659 ) ( not ( = ?auto_85660 ?auto_85659 ) ) ( not ( = ?auto_85660 ?auto_85658 ) ) ( not ( = ?auto_85660 ?auto_85657 ) ) ( not ( = ?auto_85660 ?auto_85656 ) ) ( not ( = ?auto_85659 ?auto_85658 ) ) ( not ( = ?auto_85659 ?auto_85657 ) ) ( not ( = ?auto_85659 ?auto_85656 ) ) ( not ( = ?auto_85654 ?auto_85660 ) ) ( not ( = ?auto_85654 ?auto_85659 ) ) ( not ( = ?auto_85655 ?auto_85660 ) ) ( not ( = ?auto_85655 ?auto_85659 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85660 ?auto_85659 ?auto_85658 ?auto_85657 )
      ( MAKE-4PILE ?auto_85654 ?auto_85655 ?auto_85656 ?auto_85657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85661 - BLOCK
      ?auto_85662 - BLOCK
      ?auto_85663 - BLOCK
      ?auto_85664 - BLOCK
    )
    :vars
    (
      ?auto_85665 - BLOCK
      ?auto_85666 - BLOCK
      ?auto_85667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85661 ) ( not ( = ?auto_85661 ?auto_85662 ) ) ( not ( = ?auto_85661 ?auto_85663 ) ) ( not ( = ?auto_85661 ?auto_85664 ) ) ( not ( = ?auto_85662 ?auto_85663 ) ) ( not ( = ?auto_85662 ?auto_85664 ) ) ( not ( = ?auto_85663 ?auto_85664 ) ) ( ON ?auto_85664 ?auto_85665 ) ( not ( = ?auto_85661 ?auto_85665 ) ) ( not ( = ?auto_85662 ?auto_85665 ) ) ( not ( = ?auto_85663 ?auto_85665 ) ) ( not ( = ?auto_85664 ?auto_85665 ) ) ( ON ?auto_85663 ?auto_85664 ) ( CLEAR ?auto_85663 ) ( ON-TABLE ?auto_85666 ) ( ON ?auto_85667 ?auto_85666 ) ( ON ?auto_85665 ?auto_85667 ) ( not ( = ?auto_85666 ?auto_85667 ) ) ( not ( = ?auto_85666 ?auto_85665 ) ) ( not ( = ?auto_85666 ?auto_85664 ) ) ( not ( = ?auto_85666 ?auto_85663 ) ) ( not ( = ?auto_85667 ?auto_85665 ) ) ( not ( = ?auto_85667 ?auto_85664 ) ) ( not ( = ?auto_85667 ?auto_85663 ) ) ( not ( = ?auto_85661 ?auto_85666 ) ) ( not ( = ?auto_85661 ?auto_85667 ) ) ( not ( = ?auto_85662 ?auto_85666 ) ) ( not ( = ?auto_85662 ?auto_85667 ) ) ( HOLDING ?auto_85662 ) ( CLEAR ?auto_85661 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85661 ?auto_85662 )
      ( MAKE-4PILE ?auto_85661 ?auto_85662 ?auto_85663 ?auto_85664 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85668 - BLOCK
      ?auto_85669 - BLOCK
      ?auto_85670 - BLOCK
      ?auto_85671 - BLOCK
    )
    :vars
    (
      ?auto_85674 - BLOCK
      ?auto_85672 - BLOCK
      ?auto_85673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85668 ) ( not ( = ?auto_85668 ?auto_85669 ) ) ( not ( = ?auto_85668 ?auto_85670 ) ) ( not ( = ?auto_85668 ?auto_85671 ) ) ( not ( = ?auto_85669 ?auto_85670 ) ) ( not ( = ?auto_85669 ?auto_85671 ) ) ( not ( = ?auto_85670 ?auto_85671 ) ) ( ON ?auto_85671 ?auto_85674 ) ( not ( = ?auto_85668 ?auto_85674 ) ) ( not ( = ?auto_85669 ?auto_85674 ) ) ( not ( = ?auto_85670 ?auto_85674 ) ) ( not ( = ?auto_85671 ?auto_85674 ) ) ( ON ?auto_85670 ?auto_85671 ) ( ON-TABLE ?auto_85672 ) ( ON ?auto_85673 ?auto_85672 ) ( ON ?auto_85674 ?auto_85673 ) ( not ( = ?auto_85672 ?auto_85673 ) ) ( not ( = ?auto_85672 ?auto_85674 ) ) ( not ( = ?auto_85672 ?auto_85671 ) ) ( not ( = ?auto_85672 ?auto_85670 ) ) ( not ( = ?auto_85673 ?auto_85674 ) ) ( not ( = ?auto_85673 ?auto_85671 ) ) ( not ( = ?auto_85673 ?auto_85670 ) ) ( not ( = ?auto_85668 ?auto_85672 ) ) ( not ( = ?auto_85668 ?auto_85673 ) ) ( not ( = ?auto_85669 ?auto_85672 ) ) ( not ( = ?auto_85669 ?auto_85673 ) ) ( CLEAR ?auto_85668 ) ( ON ?auto_85669 ?auto_85670 ) ( CLEAR ?auto_85669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85672 ?auto_85673 ?auto_85674 ?auto_85671 ?auto_85670 )
      ( MAKE-4PILE ?auto_85668 ?auto_85669 ?auto_85670 ?auto_85671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85675 - BLOCK
      ?auto_85676 - BLOCK
      ?auto_85677 - BLOCK
      ?auto_85678 - BLOCK
    )
    :vars
    (
      ?auto_85680 - BLOCK
      ?auto_85681 - BLOCK
      ?auto_85679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85675 ?auto_85676 ) ) ( not ( = ?auto_85675 ?auto_85677 ) ) ( not ( = ?auto_85675 ?auto_85678 ) ) ( not ( = ?auto_85676 ?auto_85677 ) ) ( not ( = ?auto_85676 ?auto_85678 ) ) ( not ( = ?auto_85677 ?auto_85678 ) ) ( ON ?auto_85678 ?auto_85680 ) ( not ( = ?auto_85675 ?auto_85680 ) ) ( not ( = ?auto_85676 ?auto_85680 ) ) ( not ( = ?auto_85677 ?auto_85680 ) ) ( not ( = ?auto_85678 ?auto_85680 ) ) ( ON ?auto_85677 ?auto_85678 ) ( ON-TABLE ?auto_85681 ) ( ON ?auto_85679 ?auto_85681 ) ( ON ?auto_85680 ?auto_85679 ) ( not ( = ?auto_85681 ?auto_85679 ) ) ( not ( = ?auto_85681 ?auto_85680 ) ) ( not ( = ?auto_85681 ?auto_85678 ) ) ( not ( = ?auto_85681 ?auto_85677 ) ) ( not ( = ?auto_85679 ?auto_85680 ) ) ( not ( = ?auto_85679 ?auto_85678 ) ) ( not ( = ?auto_85679 ?auto_85677 ) ) ( not ( = ?auto_85675 ?auto_85681 ) ) ( not ( = ?auto_85675 ?auto_85679 ) ) ( not ( = ?auto_85676 ?auto_85681 ) ) ( not ( = ?auto_85676 ?auto_85679 ) ) ( ON ?auto_85676 ?auto_85677 ) ( CLEAR ?auto_85676 ) ( HOLDING ?auto_85675 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85675 )
      ( MAKE-4PILE ?auto_85675 ?auto_85676 ?auto_85677 ?auto_85678 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85682 - BLOCK
      ?auto_85683 - BLOCK
      ?auto_85684 - BLOCK
      ?auto_85685 - BLOCK
    )
    :vars
    (
      ?auto_85686 - BLOCK
      ?auto_85688 - BLOCK
      ?auto_85687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85682 ?auto_85683 ) ) ( not ( = ?auto_85682 ?auto_85684 ) ) ( not ( = ?auto_85682 ?auto_85685 ) ) ( not ( = ?auto_85683 ?auto_85684 ) ) ( not ( = ?auto_85683 ?auto_85685 ) ) ( not ( = ?auto_85684 ?auto_85685 ) ) ( ON ?auto_85685 ?auto_85686 ) ( not ( = ?auto_85682 ?auto_85686 ) ) ( not ( = ?auto_85683 ?auto_85686 ) ) ( not ( = ?auto_85684 ?auto_85686 ) ) ( not ( = ?auto_85685 ?auto_85686 ) ) ( ON ?auto_85684 ?auto_85685 ) ( ON-TABLE ?auto_85688 ) ( ON ?auto_85687 ?auto_85688 ) ( ON ?auto_85686 ?auto_85687 ) ( not ( = ?auto_85688 ?auto_85687 ) ) ( not ( = ?auto_85688 ?auto_85686 ) ) ( not ( = ?auto_85688 ?auto_85685 ) ) ( not ( = ?auto_85688 ?auto_85684 ) ) ( not ( = ?auto_85687 ?auto_85686 ) ) ( not ( = ?auto_85687 ?auto_85685 ) ) ( not ( = ?auto_85687 ?auto_85684 ) ) ( not ( = ?auto_85682 ?auto_85688 ) ) ( not ( = ?auto_85682 ?auto_85687 ) ) ( not ( = ?auto_85683 ?auto_85688 ) ) ( not ( = ?auto_85683 ?auto_85687 ) ) ( ON ?auto_85683 ?auto_85684 ) ( ON ?auto_85682 ?auto_85683 ) ( CLEAR ?auto_85682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85688 ?auto_85687 ?auto_85686 ?auto_85685 ?auto_85684 ?auto_85683 )
      ( MAKE-4PILE ?auto_85682 ?auto_85683 ?auto_85684 ?auto_85685 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85693 - BLOCK
      ?auto_85694 - BLOCK
      ?auto_85695 - BLOCK
      ?auto_85696 - BLOCK
    )
    :vars
    (
      ?auto_85697 - BLOCK
      ?auto_85699 - BLOCK
      ?auto_85698 - BLOCK
      ?auto_85700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85693 ?auto_85694 ) ) ( not ( = ?auto_85693 ?auto_85695 ) ) ( not ( = ?auto_85693 ?auto_85696 ) ) ( not ( = ?auto_85694 ?auto_85695 ) ) ( not ( = ?auto_85694 ?auto_85696 ) ) ( not ( = ?auto_85695 ?auto_85696 ) ) ( ON ?auto_85696 ?auto_85697 ) ( not ( = ?auto_85693 ?auto_85697 ) ) ( not ( = ?auto_85694 ?auto_85697 ) ) ( not ( = ?auto_85695 ?auto_85697 ) ) ( not ( = ?auto_85696 ?auto_85697 ) ) ( ON ?auto_85695 ?auto_85696 ) ( ON-TABLE ?auto_85699 ) ( ON ?auto_85698 ?auto_85699 ) ( ON ?auto_85697 ?auto_85698 ) ( not ( = ?auto_85699 ?auto_85698 ) ) ( not ( = ?auto_85699 ?auto_85697 ) ) ( not ( = ?auto_85699 ?auto_85696 ) ) ( not ( = ?auto_85699 ?auto_85695 ) ) ( not ( = ?auto_85698 ?auto_85697 ) ) ( not ( = ?auto_85698 ?auto_85696 ) ) ( not ( = ?auto_85698 ?auto_85695 ) ) ( not ( = ?auto_85693 ?auto_85699 ) ) ( not ( = ?auto_85693 ?auto_85698 ) ) ( not ( = ?auto_85694 ?auto_85699 ) ) ( not ( = ?auto_85694 ?auto_85698 ) ) ( ON ?auto_85694 ?auto_85695 ) ( CLEAR ?auto_85694 ) ( ON ?auto_85693 ?auto_85700 ) ( CLEAR ?auto_85693 ) ( HAND-EMPTY ) ( not ( = ?auto_85693 ?auto_85700 ) ) ( not ( = ?auto_85694 ?auto_85700 ) ) ( not ( = ?auto_85695 ?auto_85700 ) ) ( not ( = ?auto_85696 ?auto_85700 ) ) ( not ( = ?auto_85697 ?auto_85700 ) ) ( not ( = ?auto_85699 ?auto_85700 ) ) ( not ( = ?auto_85698 ?auto_85700 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85693 ?auto_85700 )
      ( MAKE-4PILE ?auto_85693 ?auto_85694 ?auto_85695 ?auto_85696 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85701 - BLOCK
      ?auto_85702 - BLOCK
      ?auto_85703 - BLOCK
      ?auto_85704 - BLOCK
    )
    :vars
    (
      ?auto_85708 - BLOCK
      ?auto_85705 - BLOCK
      ?auto_85706 - BLOCK
      ?auto_85707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85701 ?auto_85702 ) ) ( not ( = ?auto_85701 ?auto_85703 ) ) ( not ( = ?auto_85701 ?auto_85704 ) ) ( not ( = ?auto_85702 ?auto_85703 ) ) ( not ( = ?auto_85702 ?auto_85704 ) ) ( not ( = ?auto_85703 ?auto_85704 ) ) ( ON ?auto_85704 ?auto_85708 ) ( not ( = ?auto_85701 ?auto_85708 ) ) ( not ( = ?auto_85702 ?auto_85708 ) ) ( not ( = ?auto_85703 ?auto_85708 ) ) ( not ( = ?auto_85704 ?auto_85708 ) ) ( ON ?auto_85703 ?auto_85704 ) ( ON-TABLE ?auto_85705 ) ( ON ?auto_85706 ?auto_85705 ) ( ON ?auto_85708 ?auto_85706 ) ( not ( = ?auto_85705 ?auto_85706 ) ) ( not ( = ?auto_85705 ?auto_85708 ) ) ( not ( = ?auto_85705 ?auto_85704 ) ) ( not ( = ?auto_85705 ?auto_85703 ) ) ( not ( = ?auto_85706 ?auto_85708 ) ) ( not ( = ?auto_85706 ?auto_85704 ) ) ( not ( = ?auto_85706 ?auto_85703 ) ) ( not ( = ?auto_85701 ?auto_85705 ) ) ( not ( = ?auto_85701 ?auto_85706 ) ) ( not ( = ?auto_85702 ?auto_85705 ) ) ( not ( = ?auto_85702 ?auto_85706 ) ) ( ON ?auto_85701 ?auto_85707 ) ( CLEAR ?auto_85701 ) ( not ( = ?auto_85701 ?auto_85707 ) ) ( not ( = ?auto_85702 ?auto_85707 ) ) ( not ( = ?auto_85703 ?auto_85707 ) ) ( not ( = ?auto_85704 ?auto_85707 ) ) ( not ( = ?auto_85708 ?auto_85707 ) ) ( not ( = ?auto_85705 ?auto_85707 ) ) ( not ( = ?auto_85706 ?auto_85707 ) ) ( HOLDING ?auto_85702 ) ( CLEAR ?auto_85703 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85705 ?auto_85706 ?auto_85708 ?auto_85704 ?auto_85703 ?auto_85702 )
      ( MAKE-4PILE ?auto_85701 ?auto_85702 ?auto_85703 ?auto_85704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85709 - BLOCK
      ?auto_85710 - BLOCK
      ?auto_85711 - BLOCK
      ?auto_85712 - BLOCK
    )
    :vars
    (
      ?auto_85716 - BLOCK
      ?auto_85713 - BLOCK
      ?auto_85714 - BLOCK
      ?auto_85715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85709 ?auto_85710 ) ) ( not ( = ?auto_85709 ?auto_85711 ) ) ( not ( = ?auto_85709 ?auto_85712 ) ) ( not ( = ?auto_85710 ?auto_85711 ) ) ( not ( = ?auto_85710 ?auto_85712 ) ) ( not ( = ?auto_85711 ?auto_85712 ) ) ( ON ?auto_85712 ?auto_85716 ) ( not ( = ?auto_85709 ?auto_85716 ) ) ( not ( = ?auto_85710 ?auto_85716 ) ) ( not ( = ?auto_85711 ?auto_85716 ) ) ( not ( = ?auto_85712 ?auto_85716 ) ) ( ON ?auto_85711 ?auto_85712 ) ( ON-TABLE ?auto_85713 ) ( ON ?auto_85714 ?auto_85713 ) ( ON ?auto_85716 ?auto_85714 ) ( not ( = ?auto_85713 ?auto_85714 ) ) ( not ( = ?auto_85713 ?auto_85716 ) ) ( not ( = ?auto_85713 ?auto_85712 ) ) ( not ( = ?auto_85713 ?auto_85711 ) ) ( not ( = ?auto_85714 ?auto_85716 ) ) ( not ( = ?auto_85714 ?auto_85712 ) ) ( not ( = ?auto_85714 ?auto_85711 ) ) ( not ( = ?auto_85709 ?auto_85713 ) ) ( not ( = ?auto_85709 ?auto_85714 ) ) ( not ( = ?auto_85710 ?auto_85713 ) ) ( not ( = ?auto_85710 ?auto_85714 ) ) ( ON ?auto_85709 ?auto_85715 ) ( not ( = ?auto_85709 ?auto_85715 ) ) ( not ( = ?auto_85710 ?auto_85715 ) ) ( not ( = ?auto_85711 ?auto_85715 ) ) ( not ( = ?auto_85712 ?auto_85715 ) ) ( not ( = ?auto_85716 ?auto_85715 ) ) ( not ( = ?auto_85713 ?auto_85715 ) ) ( not ( = ?auto_85714 ?auto_85715 ) ) ( CLEAR ?auto_85711 ) ( ON ?auto_85710 ?auto_85709 ) ( CLEAR ?auto_85710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85715 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85715 ?auto_85709 )
      ( MAKE-4PILE ?auto_85709 ?auto_85710 ?auto_85711 ?auto_85712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85717 - BLOCK
      ?auto_85718 - BLOCK
      ?auto_85719 - BLOCK
      ?auto_85720 - BLOCK
    )
    :vars
    (
      ?auto_85721 - BLOCK
      ?auto_85723 - BLOCK
      ?auto_85722 - BLOCK
      ?auto_85724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85717 ?auto_85718 ) ) ( not ( = ?auto_85717 ?auto_85719 ) ) ( not ( = ?auto_85717 ?auto_85720 ) ) ( not ( = ?auto_85718 ?auto_85719 ) ) ( not ( = ?auto_85718 ?auto_85720 ) ) ( not ( = ?auto_85719 ?auto_85720 ) ) ( ON ?auto_85720 ?auto_85721 ) ( not ( = ?auto_85717 ?auto_85721 ) ) ( not ( = ?auto_85718 ?auto_85721 ) ) ( not ( = ?auto_85719 ?auto_85721 ) ) ( not ( = ?auto_85720 ?auto_85721 ) ) ( ON-TABLE ?auto_85723 ) ( ON ?auto_85722 ?auto_85723 ) ( ON ?auto_85721 ?auto_85722 ) ( not ( = ?auto_85723 ?auto_85722 ) ) ( not ( = ?auto_85723 ?auto_85721 ) ) ( not ( = ?auto_85723 ?auto_85720 ) ) ( not ( = ?auto_85723 ?auto_85719 ) ) ( not ( = ?auto_85722 ?auto_85721 ) ) ( not ( = ?auto_85722 ?auto_85720 ) ) ( not ( = ?auto_85722 ?auto_85719 ) ) ( not ( = ?auto_85717 ?auto_85723 ) ) ( not ( = ?auto_85717 ?auto_85722 ) ) ( not ( = ?auto_85718 ?auto_85723 ) ) ( not ( = ?auto_85718 ?auto_85722 ) ) ( ON ?auto_85717 ?auto_85724 ) ( not ( = ?auto_85717 ?auto_85724 ) ) ( not ( = ?auto_85718 ?auto_85724 ) ) ( not ( = ?auto_85719 ?auto_85724 ) ) ( not ( = ?auto_85720 ?auto_85724 ) ) ( not ( = ?auto_85721 ?auto_85724 ) ) ( not ( = ?auto_85723 ?auto_85724 ) ) ( not ( = ?auto_85722 ?auto_85724 ) ) ( ON ?auto_85718 ?auto_85717 ) ( CLEAR ?auto_85718 ) ( ON-TABLE ?auto_85724 ) ( HOLDING ?auto_85719 ) ( CLEAR ?auto_85720 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85723 ?auto_85722 ?auto_85721 ?auto_85720 ?auto_85719 )
      ( MAKE-4PILE ?auto_85717 ?auto_85718 ?auto_85719 ?auto_85720 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85725 - BLOCK
      ?auto_85726 - BLOCK
      ?auto_85727 - BLOCK
      ?auto_85728 - BLOCK
    )
    :vars
    (
      ?auto_85729 - BLOCK
      ?auto_85730 - BLOCK
      ?auto_85731 - BLOCK
      ?auto_85732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85725 ?auto_85726 ) ) ( not ( = ?auto_85725 ?auto_85727 ) ) ( not ( = ?auto_85725 ?auto_85728 ) ) ( not ( = ?auto_85726 ?auto_85727 ) ) ( not ( = ?auto_85726 ?auto_85728 ) ) ( not ( = ?auto_85727 ?auto_85728 ) ) ( ON ?auto_85728 ?auto_85729 ) ( not ( = ?auto_85725 ?auto_85729 ) ) ( not ( = ?auto_85726 ?auto_85729 ) ) ( not ( = ?auto_85727 ?auto_85729 ) ) ( not ( = ?auto_85728 ?auto_85729 ) ) ( ON-TABLE ?auto_85730 ) ( ON ?auto_85731 ?auto_85730 ) ( ON ?auto_85729 ?auto_85731 ) ( not ( = ?auto_85730 ?auto_85731 ) ) ( not ( = ?auto_85730 ?auto_85729 ) ) ( not ( = ?auto_85730 ?auto_85728 ) ) ( not ( = ?auto_85730 ?auto_85727 ) ) ( not ( = ?auto_85731 ?auto_85729 ) ) ( not ( = ?auto_85731 ?auto_85728 ) ) ( not ( = ?auto_85731 ?auto_85727 ) ) ( not ( = ?auto_85725 ?auto_85730 ) ) ( not ( = ?auto_85725 ?auto_85731 ) ) ( not ( = ?auto_85726 ?auto_85730 ) ) ( not ( = ?auto_85726 ?auto_85731 ) ) ( ON ?auto_85725 ?auto_85732 ) ( not ( = ?auto_85725 ?auto_85732 ) ) ( not ( = ?auto_85726 ?auto_85732 ) ) ( not ( = ?auto_85727 ?auto_85732 ) ) ( not ( = ?auto_85728 ?auto_85732 ) ) ( not ( = ?auto_85729 ?auto_85732 ) ) ( not ( = ?auto_85730 ?auto_85732 ) ) ( not ( = ?auto_85731 ?auto_85732 ) ) ( ON ?auto_85726 ?auto_85725 ) ( ON-TABLE ?auto_85732 ) ( CLEAR ?auto_85728 ) ( ON ?auto_85727 ?auto_85726 ) ( CLEAR ?auto_85727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85732 ?auto_85725 ?auto_85726 )
      ( MAKE-4PILE ?auto_85725 ?auto_85726 ?auto_85727 ?auto_85728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85733 - BLOCK
      ?auto_85734 - BLOCK
      ?auto_85735 - BLOCK
      ?auto_85736 - BLOCK
    )
    :vars
    (
      ?auto_85737 - BLOCK
      ?auto_85739 - BLOCK
      ?auto_85740 - BLOCK
      ?auto_85738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85733 ?auto_85734 ) ) ( not ( = ?auto_85733 ?auto_85735 ) ) ( not ( = ?auto_85733 ?auto_85736 ) ) ( not ( = ?auto_85734 ?auto_85735 ) ) ( not ( = ?auto_85734 ?auto_85736 ) ) ( not ( = ?auto_85735 ?auto_85736 ) ) ( not ( = ?auto_85733 ?auto_85737 ) ) ( not ( = ?auto_85734 ?auto_85737 ) ) ( not ( = ?auto_85735 ?auto_85737 ) ) ( not ( = ?auto_85736 ?auto_85737 ) ) ( ON-TABLE ?auto_85739 ) ( ON ?auto_85740 ?auto_85739 ) ( ON ?auto_85737 ?auto_85740 ) ( not ( = ?auto_85739 ?auto_85740 ) ) ( not ( = ?auto_85739 ?auto_85737 ) ) ( not ( = ?auto_85739 ?auto_85736 ) ) ( not ( = ?auto_85739 ?auto_85735 ) ) ( not ( = ?auto_85740 ?auto_85737 ) ) ( not ( = ?auto_85740 ?auto_85736 ) ) ( not ( = ?auto_85740 ?auto_85735 ) ) ( not ( = ?auto_85733 ?auto_85739 ) ) ( not ( = ?auto_85733 ?auto_85740 ) ) ( not ( = ?auto_85734 ?auto_85739 ) ) ( not ( = ?auto_85734 ?auto_85740 ) ) ( ON ?auto_85733 ?auto_85738 ) ( not ( = ?auto_85733 ?auto_85738 ) ) ( not ( = ?auto_85734 ?auto_85738 ) ) ( not ( = ?auto_85735 ?auto_85738 ) ) ( not ( = ?auto_85736 ?auto_85738 ) ) ( not ( = ?auto_85737 ?auto_85738 ) ) ( not ( = ?auto_85739 ?auto_85738 ) ) ( not ( = ?auto_85740 ?auto_85738 ) ) ( ON ?auto_85734 ?auto_85733 ) ( ON-TABLE ?auto_85738 ) ( ON ?auto_85735 ?auto_85734 ) ( CLEAR ?auto_85735 ) ( HOLDING ?auto_85736 ) ( CLEAR ?auto_85737 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85739 ?auto_85740 ?auto_85737 ?auto_85736 )
      ( MAKE-4PILE ?auto_85733 ?auto_85734 ?auto_85735 ?auto_85736 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85741 - BLOCK
      ?auto_85742 - BLOCK
      ?auto_85743 - BLOCK
      ?auto_85744 - BLOCK
    )
    :vars
    (
      ?auto_85748 - BLOCK
      ?auto_85746 - BLOCK
      ?auto_85747 - BLOCK
      ?auto_85745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85741 ?auto_85742 ) ) ( not ( = ?auto_85741 ?auto_85743 ) ) ( not ( = ?auto_85741 ?auto_85744 ) ) ( not ( = ?auto_85742 ?auto_85743 ) ) ( not ( = ?auto_85742 ?auto_85744 ) ) ( not ( = ?auto_85743 ?auto_85744 ) ) ( not ( = ?auto_85741 ?auto_85748 ) ) ( not ( = ?auto_85742 ?auto_85748 ) ) ( not ( = ?auto_85743 ?auto_85748 ) ) ( not ( = ?auto_85744 ?auto_85748 ) ) ( ON-TABLE ?auto_85746 ) ( ON ?auto_85747 ?auto_85746 ) ( ON ?auto_85748 ?auto_85747 ) ( not ( = ?auto_85746 ?auto_85747 ) ) ( not ( = ?auto_85746 ?auto_85748 ) ) ( not ( = ?auto_85746 ?auto_85744 ) ) ( not ( = ?auto_85746 ?auto_85743 ) ) ( not ( = ?auto_85747 ?auto_85748 ) ) ( not ( = ?auto_85747 ?auto_85744 ) ) ( not ( = ?auto_85747 ?auto_85743 ) ) ( not ( = ?auto_85741 ?auto_85746 ) ) ( not ( = ?auto_85741 ?auto_85747 ) ) ( not ( = ?auto_85742 ?auto_85746 ) ) ( not ( = ?auto_85742 ?auto_85747 ) ) ( ON ?auto_85741 ?auto_85745 ) ( not ( = ?auto_85741 ?auto_85745 ) ) ( not ( = ?auto_85742 ?auto_85745 ) ) ( not ( = ?auto_85743 ?auto_85745 ) ) ( not ( = ?auto_85744 ?auto_85745 ) ) ( not ( = ?auto_85748 ?auto_85745 ) ) ( not ( = ?auto_85746 ?auto_85745 ) ) ( not ( = ?auto_85747 ?auto_85745 ) ) ( ON ?auto_85742 ?auto_85741 ) ( ON-TABLE ?auto_85745 ) ( ON ?auto_85743 ?auto_85742 ) ( CLEAR ?auto_85748 ) ( ON ?auto_85744 ?auto_85743 ) ( CLEAR ?auto_85744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85745 ?auto_85741 ?auto_85742 ?auto_85743 )
      ( MAKE-4PILE ?auto_85741 ?auto_85742 ?auto_85743 ?auto_85744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85749 - BLOCK
      ?auto_85750 - BLOCK
      ?auto_85751 - BLOCK
      ?auto_85752 - BLOCK
    )
    :vars
    (
      ?auto_85755 - BLOCK
      ?auto_85753 - BLOCK
      ?auto_85756 - BLOCK
      ?auto_85754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85749 ?auto_85750 ) ) ( not ( = ?auto_85749 ?auto_85751 ) ) ( not ( = ?auto_85749 ?auto_85752 ) ) ( not ( = ?auto_85750 ?auto_85751 ) ) ( not ( = ?auto_85750 ?auto_85752 ) ) ( not ( = ?auto_85751 ?auto_85752 ) ) ( not ( = ?auto_85749 ?auto_85755 ) ) ( not ( = ?auto_85750 ?auto_85755 ) ) ( not ( = ?auto_85751 ?auto_85755 ) ) ( not ( = ?auto_85752 ?auto_85755 ) ) ( ON-TABLE ?auto_85753 ) ( ON ?auto_85756 ?auto_85753 ) ( not ( = ?auto_85753 ?auto_85756 ) ) ( not ( = ?auto_85753 ?auto_85755 ) ) ( not ( = ?auto_85753 ?auto_85752 ) ) ( not ( = ?auto_85753 ?auto_85751 ) ) ( not ( = ?auto_85756 ?auto_85755 ) ) ( not ( = ?auto_85756 ?auto_85752 ) ) ( not ( = ?auto_85756 ?auto_85751 ) ) ( not ( = ?auto_85749 ?auto_85753 ) ) ( not ( = ?auto_85749 ?auto_85756 ) ) ( not ( = ?auto_85750 ?auto_85753 ) ) ( not ( = ?auto_85750 ?auto_85756 ) ) ( ON ?auto_85749 ?auto_85754 ) ( not ( = ?auto_85749 ?auto_85754 ) ) ( not ( = ?auto_85750 ?auto_85754 ) ) ( not ( = ?auto_85751 ?auto_85754 ) ) ( not ( = ?auto_85752 ?auto_85754 ) ) ( not ( = ?auto_85755 ?auto_85754 ) ) ( not ( = ?auto_85753 ?auto_85754 ) ) ( not ( = ?auto_85756 ?auto_85754 ) ) ( ON ?auto_85750 ?auto_85749 ) ( ON-TABLE ?auto_85754 ) ( ON ?auto_85751 ?auto_85750 ) ( ON ?auto_85752 ?auto_85751 ) ( CLEAR ?auto_85752 ) ( HOLDING ?auto_85755 ) ( CLEAR ?auto_85756 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85753 ?auto_85756 ?auto_85755 )
      ( MAKE-4PILE ?auto_85749 ?auto_85750 ?auto_85751 ?auto_85752 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85757 - BLOCK
      ?auto_85758 - BLOCK
      ?auto_85759 - BLOCK
      ?auto_85760 - BLOCK
    )
    :vars
    (
      ?auto_85761 - BLOCK
      ?auto_85762 - BLOCK
      ?auto_85763 - BLOCK
      ?auto_85764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85757 ?auto_85758 ) ) ( not ( = ?auto_85757 ?auto_85759 ) ) ( not ( = ?auto_85757 ?auto_85760 ) ) ( not ( = ?auto_85758 ?auto_85759 ) ) ( not ( = ?auto_85758 ?auto_85760 ) ) ( not ( = ?auto_85759 ?auto_85760 ) ) ( not ( = ?auto_85757 ?auto_85761 ) ) ( not ( = ?auto_85758 ?auto_85761 ) ) ( not ( = ?auto_85759 ?auto_85761 ) ) ( not ( = ?auto_85760 ?auto_85761 ) ) ( ON-TABLE ?auto_85762 ) ( ON ?auto_85763 ?auto_85762 ) ( not ( = ?auto_85762 ?auto_85763 ) ) ( not ( = ?auto_85762 ?auto_85761 ) ) ( not ( = ?auto_85762 ?auto_85760 ) ) ( not ( = ?auto_85762 ?auto_85759 ) ) ( not ( = ?auto_85763 ?auto_85761 ) ) ( not ( = ?auto_85763 ?auto_85760 ) ) ( not ( = ?auto_85763 ?auto_85759 ) ) ( not ( = ?auto_85757 ?auto_85762 ) ) ( not ( = ?auto_85757 ?auto_85763 ) ) ( not ( = ?auto_85758 ?auto_85762 ) ) ( not ( = ?auto_85758 ?auto_85763 ) ) ( ON ?auto_85757 ?auto_85764 ) ( not ( = ?auto_85757 ?auto_85764 ) ) ( not ( = ?auto_85758 ?auto_85764 ) ) ( not ( = ?auto_85759 ?auto_85764 ) ) ( not ( = ?auto_85760 ?auto_85764 ) ) ( not ( = ?auto_85761 ?auto_85764 ) ) ( not ( = ?auto_85762 ?auto_85764 ) ) ( not ( = ?auto_85763 ?auto_85764 ) ) ( ON ?auto_85758 ?auto_85757 ) ( ON-TABLE ?auto_85764 ) ( ON ?auto_85759 ?auto_85758 ) ( ON ?auto_85760 ?auto_85759 ) ( CLEAR ?auto_85763 ) ( ON ?auto_85761 ?auto_85760 ) ( CLEAR ?auto_85761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85764 ?auto_85757 ?auto_85758 ?auto_85759 ?auto_85760 )
      ( MAKE-4PILE ?auto_85757 ?auto_85758 ?auto_85759 ?auto_85760 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85765 - BLOCK
      ?auto_85766 - BLOCK
      ?auto_85767 - BLOCK
      ?auto_85768 - BLOCK
    )
    :vars
    (
      ?auto_85770 - BLOCK
      ?auto_85772 - BLOCK
      ?auto_85771 - BLOCK
      ?auto_85769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85765 ?auto_85766 ) ) ( not ( = ?auto_85765 ?auto_85767 ) ) ( not ( = ?auto_85765 ?auto_85768 ) ) ( not ( = ?auto_85766 ?auto_85767 ) ) ( not ( = ?auto_85766 ?auto_85768 ) ) ( not ( = ?auto_85767 ?auto_85768 ) ) ( not ( = ?auto_85765 ?auto_85770 ) ) ( not ( = ?auto_85766 ?auto_85770 ) ) ( not ( = ?auto_85767 ?auto_85770 ) ) ( not ( = ?auto_85768 ?auto_85770 ) ) ( ON-TABLE ?auto_85772 ) ( not ( = ?auto_85772 ?auto_85771 ) ) ( not ( = ?auto_85772 ?auto_85770 ) ) ( not ( = ?auto_85772 ?auto_85768 ) ) ( not ( = ?auto_85772 ?auto_85767 ) ) ( not ( = ?auto_85771 ?auto_85770 ) ) ( not ( = ?auto_85771 ?auto_85768 ) ) ( not ( = ?auto_85771 ?auto_85767 ) ) ( not ( = ?auto_85765 ?auto_85772 ) ) ( not ( = ?auto_85765 ?auto_85771 ) ) ( not ( = ?auto_85766 ?auto_85772 ) ) ( not ( = ?auto_85766 ?auto_85771 ) ) ( ON ?auto_85765 ?auto_85769 ) ( not ( = ?auto_85765 ?auto_85769 ) ) ( not ( = ?auto_85766 ?auto_85769 ) ) ( not ( = ?auto_85767 ?auto_85769 ) ) ( not ( = ?auto_85768 ?auto_85769 ) ) ( not ( = ?auto_85770 ?auto_85769 ) ) ( not ( = ?auto_85772 ?auto_85769 ) ) ( not ( = ?auto_85771 ?auto_85769 ) ) ( ON ?auto_85766 ?auto_85765 ) ( ON-TABLE ?auto_85769 ) ( ON ?auto_85767 ?auto_85766 ) ( ON ?auto_85768 ?auto_85767 ) ( ON ?auto_85770 ?auto_85768 ) ( CLEAR ?auto_85770 ) ( HOLDING ?auto_85771 ) ( CLEAR ?auto_85772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85772 ?auto_85771 )
      ( MAKE-4PILE ?auto_85765 ?auto_85766 ?auto_85767 ?auto_85768 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85773 - BLOCK
      ?auto_85774 - BLOCK
      ?auto_85775 - BLOCK
      ?auto_85776 - BLOCK
    )
    :vars
    (
      ?auto_85777 - BLOCK
      ?auto_85778 - BLOCK
      ?auto_85780 - BLOCK
      ?auto_85779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85773 ?auto_85774 ) ) ( not ( = ?auto_85773 ?auto_85775 ) ) ( not ( = ?auto_85773 ?auto_85776 ) ) ( not ( = ?auto_85774 ?auto_85775 ) ) ( not ( = ?auto_85774 ?auto_85776 ) ) ( not ( = ?auto_85775 ?auto_85776 ) ) ( not ( = ?auto_85773 ?auto_85777 ) ) ( not ( = ?auto_85774 ?auto_85777 ) ) ( not ( = ?auto_85775 ?auto_85777 ) ) ( not ( = ?auto_85776 ?auto_85777 ) ) ( ON-TABLE ?auto_85778 ) ( not ( = ?auto_85778 ?auto_85780 ) ) ( not ( = ?auto_85778 ?auto_85777 ) ) ( not ( = ?auto_85778 ?auto_85776 ) ) ( not ( = ?auto_85778 ?auto_85775 ) ) ( not ( = ?auto_85780 ?auto_85777 ) ) ( not ( = ?auto_85780 ?auto_85776 ) ) ( not ( = ?auto_85780 ?auto_85775 ) ) ( not ( = ?auto_85773 ?auto_85778 ) ) ( not ( = ?auto_85773 ?auto_85780 ) ) ( not ( = ?auto_85774 ?auto_85778 ) ) ( not ( = ?auto_85774 ?auto_85780 ) ) ( ON ?auto_85773 ?auto_85779 ) ( not ( = ?auto_85773 ?auto_85779 ) ) ( not ( = ?auto_85774 ?auto_85779 ) ) ( not ( = ?auto_85775 ?auto_85779 ) ) ( not ( = ?auto_85776 ?auto_85779 ) ) ( not ( = ?auto_85777 ?auto_85779 ) ) ( not ( = ?auto_85778 ?auto_85779 ) ) ( not ( = ?auto_85780 ?auto_85779 ) ) ( ON ?auto_85774 ?auto_85773 ) ( ON-TABLE ?auto_85779 ) ( ON ?auto_85775 ?auto_85774 ) ( ON ?auto_85776 ?auto_85775 ) ( ON ?auto_85777 ?auto_85776 ) ( CLEAR ?auto_85778 ) ( ON ?auto_85780 ?auto_85777 ) ( CLEAR ?auto_85780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85779 ?auto_85773 ?auto_85774 ?auto_85775 ?auto_85776 ?auto_85777 )
      ( MAKE-4PILE ?auto_85773 ?auto_85774 ?auto_85775 ?auto_85776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85781 - BLOCK
      ?auto_85782 - BLOCK
      ?auto_85783 - BLOCK
      ?auto_85784 - BLOCK
    )
    :vars
    (
      ?auto_85787 - BLOCK
      ?auto_85785 - BLOCK
      ?auto_85788 - BLOCK
      ?auto_85786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85781 ?auto_85782 ) ) ( not ( = ?auto_85781 ?auto_85783 ) ) ( not ( = ?auto_85781 ?auto_85784 ) ) ( not ( = ?auto_85782 ?auto_85783 ) ) ( not ( = ?auto_85782 ?auto_85784 ) ) ( not ( = ?auto_85783 ?auto_85784 ) ) ( not ( = ?auto_85781 ?auto_85787 ) ) ( not ( = ?auto_85782 ?auto_85787 ) ) ( not ( = ?auto_85783 ?auto_85787 ) ) ( not ( = ?auto_85784 ?auto_85787 ) ) ( not ( = ?auto_85785 ?auto_85788 ) ) ( not ( = ?auto_85785 ?auto_85787 ) ) ( not ( = ?auto_85785 ?auto_85784 ) ) ( not ( = ?auto_85785 ?auto_85783 ) ) ( not ( = ?auto_85788 ?auto_85787 ) ) ( not ( = ?auto_85788 ?auto_85784 ) ) ( not ( = ?auto_85788 ?auto_85783 ) ) ( not ( = ?auto_85781 ?auto_85785 ) ) ( not ( = ?auto_85781 ?auto_85788 ) ) ( not ( = ?auto_85782 ?auto_85785 ) ) ( not ( = ?auto_85782 ?auto_85788 ) ) ( ON ?auto_85781 ?auto_85786 ) ( not ( = ?auto_85781 ?auto_85786 ) ) ( not ( = ?auto_85782 ?auto_85786 ) ) ( not ( = ?auto_85783 ?auto_85786 ) ) ( not ( = ?auto_85784 ?auto_85786 ) ) ( not ( = ?auto_85787 ?auto_85786 ) ) ( not ( = ?auto_85785 ?auto_85786 ) ) ( not ( = ?auto_85788 ?auto_85786 ) ) ( ON ?auto_85782 ?auto_85781 ) ( ON-TABLE ?auto_85786 ) ( ON ?auto_85783 ?auto_85782 ) ( ON ?auto_85784 ?auto_85783 ) ( ON ?auto_85787 ?auto_85784 ) ( ON ?auto_85788 ?auto_85787 ) ( CLEAR ?auto_85788 ) ( HOLDING ?auto_85785 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85785 )
      ( MAKE-4PILE ?auto_85781 ?auto_85782 ?auto_85783 ?auto_85784 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_85789 - BLOCK
      ?auto_85790 - BLOCK
      ?auto_85791 - BLOCK
      ?auto_85792 - BLOCK
    )
    :vars
    (
      ?auto_85795 - BLOCK
      ?auto_85793 - BLOCK
      ?auto_85794 - BLOCK
      ?auto_85796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85789 ?auto_85790 ) ) ( not ( = ?auto_85789 ?auto_85791 ) ) ( not ( = ?auto_85789 ?auto_85792 ) ) ( not ( = ?auto_85790 ?auto_85791 ) ) ( not ( = ?auto_85790 ?auto_85792 ) ) ( not ( = ?auto_85791 ?auto_85792 ) ) ( not ( = ?auto_85789 ?auto_85795 ) ) ( not ( = ?auto_85790 ?auto_85795 ) ) ( not ( = ?auto_85791 ?auto_85795 ) ) ( not ( = ?auto_85792 ?auto_85795 ) ) ( not ( = ?auto_85793 ?auto_85794 ) ) ( not ( = ?auto_85793 ?auto_85795 ) ) ( not ( = ?auto_85793 ?auto_85792 ) ) ( not ( = ?auto_85793 ?auto_85791 ) ) ( not ( = ?auto_85794 ?auto_85795 ) ) ( not ( = ?auto_85794 ?auto_85792 ) ) ( not ( = ?auto_85794 ?auto_85791 ) ) ( not ( = ?auto_85789 ?auto_85793 ) ) ( not ( = ?auto_85789 ?auto_85794 ) ) ( not ( = ?auto_85790 ?auto_85793 ) ) ( not ( = ?auto_85790 ?auto_85794 ) ) ( ON ?auto_85789 ?auto_85796 ) ( not ( = ?auto_85789 ?auto_85796 ) ) ( not ( = ?auto_85790 ?auto_85796 ) ) ( not ( = ?auto_85791 ?auto_85796 ) ) ( not ( = ?auto_85792 ?auto_85796 ) ) ( not ( = ?auto_85795 ?auto_85796 ) ) ( not ( = ?auto_85793 ?auto_85796 ) ) ( not ( = ?auto_85794 ?auto_85796 ) ) ( ON ?auto_85790 ?auto_85789 ) ( ON-TABLE ?auto_85796 ) ( ON ?auto_85791 ?auto_85790 ) ( ON ?auto_85792 ?auto_85791 ) ( ON ?auto_85795 ?auto_85792 ) ( ON ?auto_85794 ?auto_85795 ) ( ON ?auto_85793 ?auto_85794 ) ( CLEAR ?auto_85793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_85796 ?auto_85789 ?auto_85790 ?auto_85791 ?auto_85792 ?auto_85795 ?auto_85794 )
      ( MAKE-4PILE ?auto_85789 ?auto_85790 ?auto_85791 ?auto_85792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85812 - BLOCK
      ?auto_85813 - BLOCK
    )
    :vars
    (
      ?auto_85815 - BLOCK
      ?auto_85816 - BLOCK
      ?auto_85814 - BLOCK
      ?auto_85817 - BLOCK
      ?auto_85818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85815 ?auto_85813 ) ( ON-TABLE ?auto_85812 ) ( ON ?auto_85813 ?auto_85812 ) ( not ( = ?auto_85812 ?auto_85813 ) ) ( not ( = ?auto_85812 ?auto_85815 ) ) ( not ( = ?auto_85813 ?auto_85815 ) ) ( not ( = ?auto_85812 ?auto_85816 ) ) ( not ( = ?auto_85812 ?auto_85814 ) ) ( not ( = ?auto_85813 ?auto_85816 ) ) ( not ( = ?auto_85813 ?auto_85814 ) ) ( not ( = ?auto_85815 ?auto_85816 ) ) ( not ( = ?auto_85815 ?auto_85814 ) ) ( not ( = ?auto_85816 ?auto_85814 ) ) ( ON ?auto_85816 ?auto_85815 ) ( CLEAR ?auto_85816 ) ( HOLDING ?auto_85814 ) ( CLEAR ?auto_85817 ) ( ON-TABLE ?auto_85818 ) ( ON ?auto_85817 ?auto_85818 ) ( not ( = ?auto_85818 ?auto_85817 ) ) ( not ( = ?auto_85818 ?auto_85814 ) ) ( not ( = ?auto_85817 ?auto_85814 ) ) ( not ( = ?auto_85812 ?auto_85817 ) ) ( not ( = ?auto_85812 ?auto_85818 ) ) ( not ( = ?auto_85813 ?auto_85817 ) ) ( not ( = ?auto_85813 ?auto_85818 ) ) ( not ( = ?auto_85815 ?auto_85817 ) ) ( not ( = ?auto_85815 ?auto_85818 ) ) ( not ( = ?auto_85816 ?auto_85817 ) ) ( not ( = ?auto_85816 ?auto_85818 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85818 ?auto_85817 ?auto_85814 )
      ( MAKE-2PILE ?auto_85812 ?auto_85813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85819 - BLOCK
      ?auto_85820 - BLOCK
    )
    :vars
    (
      ?auto_85821 - BLOCK
      ?auto_85824 - BLOCK
      ?auto_85823 - BLOCK
      ?auto_85825 - BLOCK
      ?auto_85822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85821 ?auto_85820 ) ( ON-TABLE ?auto_85819 ) ( ON ?auto_85820 ?auto_85819 ) ( not ( = ?auto_85819 ?auto_85820 ) ) ( not ( = ?auto_85819 ?auto_85821 ) ) ( not ( = ?auto_85820 ?auto_85821 ) ) ( not ( = ?auto_85819 ?auto_85824 ) ) ( not ( = ?auto_85819 ?auto_85823 ) ) ( not ( = ?auto_85820 ?auto_85824 ) ) ( not ( = ?auto_85820 ?auto_85823 ) ) ( not ( = ?auto_85821 ?auto_85824 ) ) ( not ( = ?auto_85821 ?auto_85823 ) ) ( not ( = ?auto_85824 ?auto_85823 ) ) ( ON ?auto_85824 ?auto_85821 ) ( CLEAR ?auto_85825 ) ( ON-TABLE ?auto_85822 ) ( ON ?auto_85825 ?auto_85822 ) ( not ( = ?auto_85822 ?auto_85825 ) ) ( not ( = ?auto_85822 ?auto_85823 ) ) ( not ( = ?auto_85825 ?auto_85823 ) ) ( not ( = ?auto_85819 ?auto_85825 ) ) ( not ( = ?auto_85819 ?auto_85822 ) ) ( not ( = ?auto_85820 ?auto_85825 ) ) ( not ( = ?auto_85820 ?auto_85822 ) ) ( not ( = ?auto_85821 ?auto_85825 ) ) ( not ( = ?auto_85821 ?auto_85822 ) ) ( not ( = ?auto_85824 ?auto_85825 ) ) ( not ( = ?auto_85824 ?auto_85822 ) ) ( ON ?auto_85823 ?auto_85824 ) ( CLEAR ?auto_85823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85819 ?auto_85820 ?auto_85821 ?auto_85824 )
      ( MAKE-2PILE ?auto_85819 ?auto_85820 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85826 - BLOCK
      ?auto_85827 - BLOCK
    )
    :vars
    (
      ?auto_85829 - BLOCK
      ?auto_85831 - BLOCK
      ?auto_85828 - BLOCK
      ?auto_85830 - BLOCK
      ?auto_85832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85829 ?auto_85827 ) ( ON-TABLE ?auto_85826 ) ( ON ?auto_85827 ?auto_85826 ) ( not ( = ?auto_85826 ?auto_85827 ) ) ( not ( = ?auto_85826 ?auto_85829 ) ) ( not ( = ?auto_85827 ?auto_85829 ) ) ( not ( = ?auto_85826 ?auto_85831 ) ) ( not ( = ?auto_85826 ?auto_85828 ) ) ( not ( = ?auto_85827 ?auto_85831 ) ) ( not ( = ?auto_85827 ?auto_85828 ) ) ( not ( = ?auto_85829 ?auto_85831 ) ) ( not ( = ?auto_85829 ?auto_85828 ) ) ( not ( = ?auto_85831 ?auto_85828 ) ) ( ON ?auto_85831 ?auto_85829 ) ( ON-TABLE ?auto_85830 ) ( not ( = ?auto_85830 ?auto_85832 ) ) ( not ( = ?auto_85830 ?auto_85828 ) ) ( not ( = ?auto_85832 ?auto_85828 ) ) ( not ( = ?auto_85826 ?auto_85832 ) ) ( not ( = ?auto_85826 ?auto_85830 ) ) ( not ( = ?auto_85827 ?auto_85832 ) ) ( not ( = ?auto_85827 ?auto_85830 ) ) ( not ( = ?auto_85829 ?auto_85832 ) ) ( not ( = ?auto_85829 ?auto_85830 ) ) ( not ( = ?auto_85831 ?auto_85832 ) ) ( not ( = ?auto_85831 ?auto_85830 ) ) ( ON ?auto_85828 ?auto_85831 ) ( CLEAR ?auto_85828 ) ( HOLDING ?auto_85832 ) ( CLEAR ?auto_85830 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85830 ?auto_85832 )
      ( MAKE-2PILE ?auto_85826 ?auto_85827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85833 - BLOCK
      ?auto_85834 - BLOCK
    )
    :vars
    (
      ?auto_85836 - BLOCK
      ?auto_85839 - BLOCK
      ?auto_85838 - BLOCK
      ?auto_85837 - BLOCK
      ?auto_85835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85836 ?auto_85834 ) ( ON-TABLE ?auto_85833 ) ( ON ?auto_85834 ?auto_85833 ) ( not ( = ?auto_85833 ?auto_85834 ) ) ( not ( = ?auto_85833 ?auto_85836 ) ) ( not ( = ?auto_85834 ?auto_85836 ) ) ( not ( = ?auto_85833 ?auto_85839 ) ) ( not ( = ?auto_85833 ?auto_85838 ) ) ( not ( = ?auto_85834 ?auto_85839 ) ) ( not ( = ?auto_85834 ?auto_85838 ) ) ( not ( = ?auto_85836 ?auto_85839 ) ) ( not ( = ?auto_85836 ?auto_85838 ) ) ( not ( = ?auto_85839 ?auto_85838 ) ) ( ON ?auto_85839 ?auto_85836 ) ( ON-TABLE ?auto_85837 ) ( not ( = ?auto_85837 ?auto_85835 ) ) ( not ( = ?auto_85837 ?auto_85838 ) ) ( not ( = ?auto_85835 ?auto_85838 ) ) ( not ( = ?auto_85833 ?auto_85835 ) ) ( not ( = ?auto_85833 ?auto_85837 ) ) ( not ( = ?auto_85834 ?auto_85835 ) ) ( not ( = ?auto_85834 ?auto_85837 ) ) ( not ( = ?auto_85836 ?auto_85835 ) ) ( not ( = ?auto_85836 ?auto_85837 ) ) ( not ( = ?auto_85839 ?auto_85835 ) ) ( not ( = ?auto_85839 ?auto_85837 ) ) ( ON ?auto_85838 ?auto_85839 ) ( CLEAR ?auto_85837 ) ( ON ?auto_85835 ?auto_85838 ) ( CLEAR ?auto_85835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85833 ?auto_85834 ?auto_85836 ?auto_85839 ?auto_85838 )
      ( MAKE-2PILE ?auto_85833 ?auto_85834 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85840 - BLOCK
      ?auto_85841 - BLOCK
    )
    :vars
    (
      ?auto_85845 - BLOCK
      ?auto_85846 - BLOCK
      ?auto_85842 - BLOCK
      ?auto_85843 - BLOCK
      ?auto_85844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85845 ?auto_85841 ) ( ON-TABLE ?auto_85840 ) ( ON ?auto_85841 ?auto_85840 ) ( not ( = ?auto_85840 ?auto_85841 ) ) ( not ( = ?auto_85840 ?auto_85845 ) ) ( not ( = ?auto_85841 ?auto_85845 ) ) ( not ( = ?auto_85840 ?auto_85846 ) ) ( not ( = ?auto_85840 ?auto_85842 ) ) ( not ( = ?auto_85841 ?auto_85846 ) ) ( not ( = ?auto_85841 ?auto_85842 ) ) ( not ( = ?auto_85845 ?auto_85846 ) ) ( not ( = ?auto_85845 ?auto_85842 ) ) ( not ( = ?auto_85846 ?auto_85842 ) ) ( ON ?auto_85846 ?auto_85845 ) ( not ( = ?auto_85843 ?auto_85844 ) ) ( not ( = ?auto_85843 ?auto_85842 ) ) ( not ( = ?auto_85844 ?auto_85842 ) ) ( not ( = ?auto_85840 ?auto_85844 ) ) ( not ( = ?auto_85840 ?auto_85843 ) ) ( not ( = ?auto_85841 ?auto_85844 ) ) ( not ( = ?auto_85841 ?auto_85843 ) ) ( not ( = ?auto_85845 ?auto_85844 ) ) ( not ( = ?auto_85845 ?auto_85843 ) ) ( not ( = ?auto_85846 ?auto_85844 ) ) ( not ( = ?auto_85846 ?auto_85843 ) ) ( ON ?auto_85842 ?auto_85846 ) ( ON ?auto_85844 ?auto_85842 ) ( CLEAR ?auto_85844 ) ( HOLDING ?auto_85843 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85843 )
      ( MAKE-2PILE ?auto_85840 ?auto_85841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85856 - BLOCK
      ?auto_85857 - BLOCK
    )
    :vars
    (
      ?auto_85861 - BLOCK
      ?auto_85862 - BLOCK
      ?auto_85860 - BLOCK
      ?auto_85858 - BLOCK
      ?auto_85859 - BLOCK
      ?auto_85863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85861 ?auto_85857 ) ( ON-TABLE ?auto_85856 ) ( ON ?auto_85857 ?auto_85856 ) ( not ( = ?auto_85856 ?auto_85857 ) ) ( not ( = ?auto_85856 ?auto_85861 ) ) ( not ( = ?auto_85857 ?auto_85861 ) ) ( not ( = ?auto_85856 ?auto_85862 ) ) ( not ( = ?auto_85856 ?auto_85860 ) ) ( not ( = ?auto_85857 ?auto_85862 ) ) ( not ( = ?auto_85857 ?auto_85860 ) ) ( not ( = ?auto_85861 ?auto_85862 ) ) ( not ( = ?auto_85861 ?auto_85860 ) ) ( not ( = ?auto_85862 ?auto_85860 ) ) ( ON ?auto_85862 ?auto_85861 ) ( not ( = ?auto_85858 ?auto_85859 ) ) ( not ( = ?auto_85858 ?auto_85860 ) ) ( not ( = ?auto_85859 ?auto_85860 ) ) ( not ( = ?auto_85856 ?auto_85859 ) ) ( not ( = ?auto_85856 ?auto_85858 ) ) ( not ( = ?auto_85857 ?auto_85859 ) ) ( not ( = ?auto_85857 ?auto_85858 ) ) ( not ( = ?auto_85861 ?auto_85859 ) ) ( not ( = ?auto_85861 ?auto_85858 ) ) ( not ( = ?auto_85862 ?auto_85859 ) ) ( not ( = ?auto_85862 ?auto_85858 ) ) ( ON ?auto_85860 ?auto_85862 ) ( ON ?auto_85859 ?auto_85860 ) ( CLEAR ?auto_85859 ) ( ON ?auto_85858 ?auto_85863 ) ( CLEAR ?auto_85858 ) ( HAND-EMPTY ) ( not ( = ?auto_85856 ?auto_85863 ) ) ( not ( = ?auto_85857 ?auto_85863 ) ) ( not ( = ?auto_85861 ?auto_85863 ) ) ( not ( = ?auto_85862 ?auto_85863 ) ) ( not ( = ?auto_85860 ?auto_85863 ) ) ( not ( = ?auto_85858 ?auto_85863 ) ) ( not ( = ?auto_85859 ?auto_85863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85858 ?auto_85863 )
      ( MAKE-2PILE ?auto_85856 ?auto_85857 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85864 - BLOCK
      ?auto_85865 - BLOCK
    )
    :vars
    (
      ?auto_85867 - BLOCK
      ?auto_85866 - BLOCK
      ?auto_85868 - BLOCK
      ?auto_85869 - BLOCK
      ?auto_85870 - BLOCK
      ?auto_85871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85867 ?auto_85865 ) ( ON-TABLE ?auto_85864 ) ( ON ?auto_85865 ?auto_85864 ) ( not ( = ?auto_85864 ?auto_85865 ) ) ( not ( = ?auto_85864 ?auto_85867 ) ) ( not ( = ?auto_85865 ?auto_85867 ) ) ( not ( = ?auto_85864 ?auto_85866 ) ) ( not ( = ?auto_85864 ?auto_85868 ) ) ( not ( = ?auto_85865 ?auto_85866 ) ) ( not ( = ?auto_85865 ?auto_85868 ) ) ( not ( = ?auto_85867 ?auto_85866 ) ) ( not ( = ?auto_85867 ?auto_85868 ) ) ( not ( = ?auto_85866 ?auto_85868 ) ) ( ON ?auto_85866 ?auto_85867 ) ( not ( = ?auto_85869 ?auto_85870 ) ) ( not ( = ?auto_85869 ?auto_85868 ) ) ( not ( = ?auto_85870 ?auto_85868 ) ) ( not ( = ?auto_85864 ?auto_85870 ) ) ( not ( = ?auto_85864 ?auto_85869 ) ) ( not ( = ?auto_85865 ?auto_85870 ) ) ( not ( = ?auto_85865 ?auto_85869 ) ) ( not ( = ?auto_85867 ?auto_85870 ) ) ( not ( = ?auto_85867 ?auto_85869 ) ) ( not ( = ?auto_85866 ?auto_85870 ) ) ( not ( = ?auto_85866 ?auto_85869 ) ) ( ON ?auto_85868 ?auto_85866 ) ( ON ?auto_85869 ?auto_85871 ) ( CLEAR ?auto_85869 ) ( not ( = ?auto_85864 ?auto_85871 ) ) ( not ( = ?auto_85865 ?auto_85871 ) ) ( not ( = ?auto_85867 ?auto_85871 ) ) ( not ( = ?auto_85866 ?auto_85871 ) ) ( not ( = ?auto_85868 ?auto_85871 ) ) ( not ( = ?auto_85869 ?auto_85871 ) ) ( not ( = ?auto_85870 ?auto_85871 ) ) ( HOLDING ?auto_85870 ) ( CLEAR ?auto_85868 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85864 ?auto_85865 ?auto_85867 ?auto_85866 ?auto_85868 ?auto_85870 )
      ( MAKE-2PILE ?auto_85864 ?auto_85865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85872 - BLOCK
      ?auto_85873 - BLOCK
    )
    :vars
    (
      ?auto_85878 - BLOCK
      ?auto_85877 - BLOCK
      ?auto_85874 - BLOCK
      ?auto_85879 - BLOCK
      ?auto_85875 - BLOCK
      ?auto_85876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85878 ?auto_85873 ) ( ON-TABLE ?auto_85872 ) ( ON ?auto_85873 ?auto_85872 ) ( not ( = ?auto_85872 ?auto_85873 ) ) ( not ( = ?auto_85872 ?auto_85878 ) ) ( not ( = ?auto_85873 ?auto_85878 ) ) ( not ( = ?auto_85872 ?auto_85877 ) ) ( not ( = ?auto_85872 ?auto_85874 ) ) ( not ( = ?auto_85873 ?auto_85877 ) ) ( not ( = ?auto_85873 ?auto_85874 ) ) ( not ( = ?auto_85878 ?auto_85877 ) ) ( not ( = ?auto_85878 ?auto_85874 ) ) ( not ( = ?auto_85877 ?auto_85874 ) ) ( ON ?auto_85877 ?auto_85878 ) ( not ( = ?auto_85879 ?auto_85875 ) ) ( not ( = ?auto_85879 ?auto_85874 ) ) ( not ( = ?auto_85875 ?auto_85874 ) ) ( not ( = ?auto_85872 ?auto_85875 ) ) ( not ( = ?auto_85872 ?auto_85879 ) ) ( not ( = ?auto_85873 ?auto_85875 ) ) ( not ( = ?auto_85873 ?auto_85879 ) ) ( not ( = ?auto_85878 ?auto_85875 ) ) ( not ( = ?auto_85878 ?auto_85879 ) ) ( not ( = ?auto_85877 ?auto_85875 ) ) ( not ( = ?auto_85877 ?auto_85879 ) ) ( ON ?auto_85874 ?auto_85877 ) ( ON ?auto_85879 ?auto_85876 ) ( not ( = ?auto_85872 ?auto_85876 ) ) ( not ( = ?auto_85873 ?auto_85876 ) ) ( not ( = ?auto_85878 ?auto_85876 ) ) ( not ( = ?auto_85877 ?auto_85876 ) ) ( not ( = ?auto_85874 ?auto_85876 ) ) ( not ( = ?auto_85879 ?auto_85876 ) ) ( not ( = ?auto_85875 ?auto_85876 ) ) ( CLEAR ?auto_85874 ) ( ON ?auto_85875 ?auto_85879 ) ( CLEAR ?auto_85875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85876 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85876 ?auto_85879 )
      ( MAKE-2PILE ?auto_85872 ?auto_85873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_85880 - BLOCK
      ?auto_85881 - BLOCK
    )
    :vars
    (
      ?auto_85884 - BLOCK
      ?auto_85883 - BLOCK
      ?auto_85887 - BLOCK
      ?auto_85882 - BLOCK
      ?auto_85885 - BLOCK
      ?auto_85886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_85884 ?auto_85881 ) ( ON-TABLE ?auto_85880 ) ( ON ?auto_85881 ?auto_85880 ) ( not ( = ?auto_85880 ?auto_85881 ) ) ( not ( = ?auto_85880 ?auto_85884 ) ) ( not ( = ?auto_85881 ?auto_85884 ) ) ( not ( = ?auto_85880 ?auto_85883 ) ) ( not ( = ?auto_85880 ?auto_85887 ) ) ( not ( = ?auto_85881 ?auto_85883 ) ) ( not ( = ?auto_85881 ?auto_85887 ) ) ( not ( = ?auto_85884 ?auto_85883 ) ) ( not ( = ?auto_85884 ?auto_85887 ) ) ( not ( = ?auto_85883 ?auto_85887 ) ) ( ON ?auto_85883 ?auto_85884 ) ( not ( = ?auto_85882 ?auto_85885 ) ) ( not ( = ?auto_85882 ?auto_85887 ) ) ( not ( = ?auto_85885 ?auto_85887 ) ) ( not ( = ?auto_85880 ?auto_85885 ) ) ( not ( = ?auto_85880 ?auto_85882 ) ) ( not ( = ?auto_85881 ?auto_85885 ) ) ( not ( = ?auto_85881 ?auto_85882 ) ) ( not ( = ?auto_85884 ?auto_85885 ) ) ( not ( = ?auto_85884 ?auto_85882 ) ) ( not ( = ?auto_85883 ?auto_85885 ) ) ( not ( = ?auto_85883 ?auto_85882 ) ) ( ON ?auto_85882 ?auto_85886 ) ( not ( = ?auto_85880 ?auto_85886 ) ) ( not ( = ?auto_85881 ?auto_85886 ) ) ( not ( = ?auto_85884 ?auto_85886 ) ) ( not ( = ?auto_85883 ?auto_85886 ) ) ( not ( = ?auto_85887 ?auto_85886 ) ) ( not ( = ?auto_85882 ?auto_85886 ) ) ( not ( = ?auto_85885 ?auto_85886 ) ) ( ON ?auto_85885 ?auto_85882 ) ( CLEAR ?auto_85885 ) ( ON-TABLE ?auto_85886 ) ( HOLDING ?auto_85887 ) ( CLEAR ?auto_85883 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85880 ?auto_85881 ?auto_85884 ?auto_85883 ?auto_85887 )
      ( MAKE-2PILE ?auto_85880 ?auto_85881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85931 - BLOCK
      ?auto_85932 - BLOCK
      ?auto_85933 - BLOCK
      ?auto_85934 - BLOCK
      ?auto_85935 - BLOCK
    )
    :vars
    (
      ?auto_85936 - BLOCK
      ?auto_85937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85931 ) ( ON ?auto_85932 ?auto_85931 ) ( ON ?auto_85933 ?auto_85932 ) ( not ( = ?auto_85931 ?auto_85932 ) ) ( not ( = ?auto_85931 ?auto_85933 ) ) ( not ( = ?auto_85931 ?auto_85934 ) ) ( not ( = ?auto_85931 ?auto_85935 ) ) ( not ( = ?auto_85932 ?auto_85933 ) ) ( not ( = ?auto_85932 ?auto_85934 ) ) ( not ( = ?auto_85932 ?auto_85935 ) ) ( not ( = ?auto_85933 ?auto_85934 ) ) ( not ( = ?auto_85933 ?auto_85935 ) ) ( not ( = ?auto_85934 ?auto_85935 ) ) ( ON ?auto_85935 ?auto_85936 ) ( not ( = ?auto_85931 ?auto_85936 ) ) ( not ( = ?auto_85932 ?auto_85936 ) ) ( not ( = ?auto_85933 ?auto_85936 ) ) ( not ( = ?auto_85934 ?auto_85936 ) ) ( not ( = ?auto_85935 ?auto_85936 ) ) ( CLEAR ?auto_85933 ) ( ON ?auto_85934 ?auto_85935 ) ( CLEAR ?auto_85934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_85937 ) ( ON ?auto_85936 ?auto_85937 ) ( not ( = ?auto_85937 ?auto_85936 ) ) ( not ( = ?auto_85937 ?auto_85935 ) ) ( not ( = ?auto_85937 ?auto_85934 ) ) ( not ( = ?auto_85931 ?auto_85937 ) ) ( not ( = ?auto_85932 ?auto_85937 ) ) ( not ( = ?auto_85933 ?auto_85937 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85937 ?auto_85936 ?auto_85935 )
      ( MAKE-5PILE ?auto_85931 ?auto_85932 ?auto_85933 ?auto_85934 ?auto_85935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85938 - BLOCK
      ?auto_85939 - BLOCK
      ?auto_85940 - BLOCK
      ?auto_85941 - BLOCK
      ?auto_85942 - BLOCK
    )
    :vars
    (
      ?auto_85944 - BLOCK
      ?auto_85943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85938 ) ( ON ?auto_85939 ?auto_85938 ) ( not ( = ?auto_85938 ?auto_85939 ) ) ( not ( = ?auto_85938 ?auto_85940 ) ) ( not ( = ?auto_85938 ?auto_85941 ) ) ( not ( = ?auto_85938 ?auto_85942 ) ) ( not ( = ?auto_85939 ?auto_85940 ) ) ( not ( = ?auto_85939 ?auto_85941 ) ) ( not ( = ?auto_85939 ?auto_85942 ) ) ( not ( = ?auto_85940 ?auto_85941 ) ) ( not ( = ?auto_85940 ?auto_85942 ) ) ( not ( = ?auto_85941 ?auto_85942 ) ) ( ON ?auto_85942 ?auto_85944 ) ( not ( = ?auto_85938 ?auto_85944 ) ) ( not ( = ?auto_85939 ?auto_85944 ) ) ( not ( = ?auto_85940 ?auto_85944 ) ) ( not ( = ?auto_85941 ?auto_85944 ) ) ( not ( = ?auto_85942 ?auto_85944 ) ) ( ON ?auto_85941 ?auto_85942 ) ( CLEAR ?auto_85941 ) ( ON-TABLE ?auto_85943 ) ( ON ?auto_85944 ?auto_85943 ) ( not ( = ?auto_85943 ?auto_85944 ) ) ( not ( = ?auto_85943 ?auto_85942 ) ) ( not ( = ?auto_85943 ?auto_85941 ) ) ( not ( = ?auto_85938 ?auto_85943 ) ) ( not ( = ?auto_85939 ?auto_85943 ) ) ( not ( = ?auto_85940 ?auto_85943 ) ) ( HOLDING ?auto_85940 ) ( CLEAR ?auto_85939 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_85938 ?auto_85939 ?auto_85940 )
      ( MAKE-5PILE ?auto_85938 ?auto_85939 ?auto_85940 ?auto_85941 ?auto_85942 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85945 - BLOCK
      ?auto_85946 - BLOCK
      ?auto_85947 - BLOCK
      ?auto_85948 - BLOCK
      ?auto_85949 - BLOCK
    )
    :vars
    (
      ?auto_85950 - BLOCK
      ?auto_85951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85945 ) ( ON ?auto_85946 ?auto_85945 ) ( not ( = ?auto_85945 ?auto_85946 ) ) ( not ( = ?auto_85945 ?auto_85947 ) ) ( not ( = ?auto_85945 ?auto_85948 ) ) ( not ( = ?auto_85945 ?auto_85949 ) ) ( not ( = ?auto_85946 ?auto_85947 ) ) ( not ( = ?auto_85946 ?auto_85948 ) ) ( not ( = ?auto_85946 ?auto_85949 ) ) ( not ( = ?auto_85947 ?auto_85948 ) ) ( not ( = ?auto_85947 ?auto_85949 ) ) ( not ( = ?auto_85948 ?auto_85949 ) ) ( ON ?auto_85949 ?auto_85950 ) ( not ( = ?auto_85945 ?auto_85950 ) ) ( not ( = ?auto_85946 ?auto_85950 ) ) ( not ( = ?auto_85947 ?auto_85950 ) ) ( not ( = ?auto_85948 ?auto_85950 ) ) ( not ( = ?auto_85949 ?auto_85950 ) ) ( ON ?auto_85948 ?auto_85949 ) ( ON-TABLE ?auto_85951 ) ( ON ?auto_85950 ?auto_85951 ) ( not ( = ?auto_85951 ?auto_85950 ) ) ( not ( = ?auto_85951 ?auto_85949 ) ) ( not ( = ?auto_85951 ?auto_85948 ) ) ( not ( = ?auto_85945 ?auto_85951 ) ) ( not ( = ?auto_85946 ?auto_85951 ) ) ( not ( = ?auto_85947 ?auto_85951 ) ) ( CLEAR ?auto_85946 ) ( ON ?auto_85947 ?auto_85948 ) ( CLEAR ?auto_85947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_85951 ?auto_85950 ?auto_85949 ?auto_85948 )
      ( MAKE-5PILE ?auto_85945 ?auto_85946 ?auto_85947 ?auto_85948 ?auto_85949 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85952 - BLOCK
      ?auto_85953 - BLOCK
      ?auto_85954 - BLOCK
      ?auto_85955 - BLOCK
      ?auto_85956 - BLOCK
    )
    :vars
    (
      ?auto_85957 - BLOCK
      ?auto_85958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85952 ) ( not ( = ?auto_85952 ?auto_85953 ) ) ( not ( = ?auto_85952 ?auto_85954 ) ) ( not ( = ?auto_85952 ?auto_85955 ) ) ( not ( = ?auto_85952 ?auto_85956 ) ) ( not ( = ?auto_85953 ?auto_85954 ) ) ( not ( = ?auto_85953 ?auto_85955 ) ) ( not ( = ?auto_85953 ?auto_85956 ) ) ( not ( = ?auto_85954 ?auto_85955 ) ) ( not ( = ?auto_85954 ?auto_85956 ) ) ( not ( = ?auto_85955 ?auto_85956 ) ) ( ON ?auto_85956 ?auto_85957 ) ( not ( = ?auto_85952 ?auto_85957 ) ) ( not ( = ?auto_85953 ?auto_85957 ) ) ( not ( = ?auto_85954 ?auto_85957 ) ) ( not ( = ?auto_85955 ?auto_85957 ) ) ( not ( = ?auto_85956 ?auto_85957 ) ) ( ON ?auto_85955 ?auto_85956 ) ( ON-TABLE ?auto_85958 ) ( ON ?auto_85957 ?auto_85958 ) ( not ( = ?auto_85958 ?auto_85957 ) ) ( not ( = ?auto_85958 ?auto_85956 ) ) ( not ( = ?auto_85958 ?auto_85955 ) ) ( not ( = ?auto_85952 ?auto_85958 ) ) ( not ( = ?auto_85953 ?auto_85958 ) ) ( not ( = ?auto_85954 ?auto_85958 ) ) ( ON ?auto_85954 ?auto_85955 ) ( CLEAR ?auto_85954 ) ( HOLDING ?auto_85953 ) ( CLEAR ?auto_85952 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85952 ?auto_85953 )
      ( MAKE-5PILE ?auto_85952 ?auto_85953 ?auto_85954 ?auto_85955 ?auto_85956 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85959 - BLOCK
      ?auto_85960 - BLOCK
      ?auto_85961 - BLOCK
      ?auto_85962 - BLOCK
      ?auto_85963 - BLOCK
    )
    :vars
    (
      ?auto_85964 - BLOCK
      ?auto_85965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_85959 ) ( not ( = ?auto_85959 ?auto_85960 ) ) ( not ( = ?auto_85959 ?auto_85961 ) ) ( not ( = ?auto_85959 ?auto_85962 ) ) ( not ( = ?auto_85959 ?auto_85963 ) ) ( not ( = ?auto_85960 ?auto_85961 ) ) ( not ( = ?auto_85960 ?auto_85962 ) ) ( not ( = ?auto_85960 ?auto_85963 ) ) ( not ( = ?auto_85961 ?auto_85962 ) ) ( not ( = ?auto_85961 ?auto_85963 ) ) ( not ( = ?auto_85962 ?auto_85963 ) ) ( ON ?auto_85963 ?auto_85964 ) ( not ( = ?auto_85959 ?auto_85964 ) ) ( not ( = ?auto_85960 ?auto_85964 ) ) ( not ( = ?auto_85961 ?auto_85964 ) ) ( not ( = ?auto_85962 ?auto_85964 ) ) ( not ( = ?auto_85963 ?auto_85964 ) ) ( ON ?auto_85962 ?auto_85963 ) ( ON-TABLE ?auto_85965 ) ( ON ?auto_85964 ?auto_85965 ) ( not ( = ?auto_85965 ?auto_85964 ) ) ( not ( = ?auto_85965 ?auto_85963 ) ) ( not ( = ?auto_85965 ?auto_85962 ) ) ( not ( = ?auto_85959 ?auto_85965 ) ) ( not ( = ?auto_85960 ?auto_85965 ) ) ( not ( = ?auto_85961 ?auto_85965 ) ) ( ON ?auto_85961 ?auto_85962 ) ( CLEAR ?auto_85959 ) ( ON ?auto_85960 ?auto_85961 ) ( CLEAR ?auto_85960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_85965 ?auto_85964 ?auto_85963 ?auto_85962 ?auto_85961 )
      ( MAKE-5PILE ?auto_85959 ?auto_85960 ?auto_85961 ?auto_85962 ?auto_85963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85966 - BLOCK
      ?auto_85967 - BLOCK
      ?auto_85968 - BLOCK
      ?auto_85969 - BLOCK
      ?auto_85970 - BLOCK
    )
    :vars
    (
      ?auto_85972 - BLOCK
      ?auto_85971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85966 ?auto_85967 ) ) ( not ( = ?auto_85966 ?auto_85968 ) ) ( not ( = ?auto_85966 ?auto_85969 ) ) ( not ( = ?auto_85966 ?auto_85970 ) ) ( not ( = ?auto_85967 ?auto_85968 ) ) ( not ( = ?auto_85967 ?auto_85969 ) ) ( not ( = ?auto_85967 ?auto_85970 ) ) ( not ( = ?auto_85968 ?auto_85969 ) ) ( not ( = ?auto_85968 ?auto_85970 ) ) ( not ( = ?auto_85969 ?auto_85970 ) ) ( ON ?auto_85970 ?auto_85972 ) ( not ( = ?auto_85966 ?auto_85972 ) ) ( not ( = ?auto_85967 ?auto_85972 ) ) ( not ( = ?auto_85968 ?auto_85972 ) ) ( not ( = ?auto_85969 ?auto_85972 ) ) ( not ( = ?auto_85970 ?auto_85972 ) ) ( ON ?auto_85969 ?auto_85970 ) ( ON-TABLE ?auto_85971 ) ( ON ?auto_85972 ?auto_85971 ) ( not ( = ?auto_85971 ?auto_85972 ) ) ( not ( = ?auto_85971 ?auto_85970 ) ) ( not ( = ?auto_85971 ?auto_85969 ) ) ( not ( = ?auto_85966 ?auto_85971 ) ) ( not ( = ?auto_85967 ?auto_85971 ) ) ( not ( = ?auto_85968 ?auto_85971 ) ) ( ON ?auto_85968 ?auto_85969 ) ( ON ?auto_85967 ?auto_85968 ) ( CLEAR ?auto_85967 ) ( HOLDING ?auto_85966 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_85966 )
      ( MAKE-5PILE ?auto_85966 ?auto_85967 ?auto_85968 ?auto_85969 ?auto_85970 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85973 - BLOCK
      ?auto_85974 - BLOCK
      ?auto_85975 - BLOCK
      ?auto_85976 - BLOCK
      ?auto_85977 - BLOCK
    )
    :vars
    (
      ?auto_85978 - BLOCK
      ?auto_85979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85973 ?auto_85974 ) ) ( not ( = ?auto_85973 ?auto_85975 ) ) ( not ( = ?auto_85973 ?auto_85976 ) ) ( not ( = ?auto_85973 ?auto_85977 ) ) ( not ( = ?auto_85974 ?auto_85975 ) ) ( not ( = ?auto_85974 ?auto_85976 ) ) ( not ( = ?auto_85974 ?auto_85977 ) ) ( not ( = ?auto_85975 ?auto_85976 ) ) ( not ( = ?auto_85975 ?auto_85977 ) ) ( not ( = ?auto_85976 ?auto_85977 ) ) ( ON ?auto_85977 ?auto_85978 ) ( not ( = ?auto_85973 ?auto_85978 ) ) ( not ( = ?auto_85974 ?auto_85978 ) ) ( not ( = ?auto_85975 ?auto_85978 ) ) ( not ( = ?auto_85976 ?auto_85978 ) ) ( not ( = ?auto_85977 ?auto_85978 ) ) ( ON ?auto_85976 ?auto_85977 ) ( ON-TABLE ?auto_85979 ) ( ON ?auto_85978 ?auto_85979 ) ( not ( = ?auto_85979 ?auto_85978 ) ) ( not ( = ?auto_85979 ?auto_85977 ) ) ( not ( = ?auto_85979 ?auto_85976 ) ) ( not ( = ?auto_85973 ?auto_85979 ) ) ( not ( = ?auto_85974 ?auto_85979 ) ) ( not ( = ?auto_85975 ?auto_85979 ) ) ( ON ?auto_85975 ?auto_85976 ) ( ON ?auto_85974 ?auto_85975 ) ( ON ?auto_85973 ?auto_85974 ) ( CLEAR ?auto_85973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85979 ?auto_85978 ?auto_85977 ?auto_85976 ?auto_85975 ?auto_85974 )
      ( MAKE-5PILE ?auto_85973 ?auto_85974 ?auto_85975 ?auto_85976 ?auto_85977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85985 - BLOCK
      ?auto_85986 - BLOCK
      ?auto_85987 - BLOCK
      ?auto_85988 - BLOCK
      ?auto_85989 - BLOCK
    )
    :vars
    (
      ?auto_85990 - BLOCK
      ?auto_85991 - BLOCK
      ?auto_85992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85985 ?auto_85986 ) ) ( not ( = ?auto_85985 ?auto_85987 ) ) ( not ( = ?auto_85985 ?auto_85988 ) ) ( not ( = ?auto_85985 ?auto_85989 ) ) ( not ( = ?auto_85986 ?auto_85987 ) ) ( not ( = ?auto_85986 ?auto_85988 ) ) ( not ( = ?auto_85986 ?auto_85989 ) ) ( not ( = ?auto_85987 ?auto_85988 ) ) ( not ( = ?auto_85987 ?auto_85989 ) ) ( not ( = ?auto_85988 ?auto_85989 ) ) ( ON ?auto_85989 ?auto_85990 ) ( not ( = ?auto_85985 ?auto_85990 ) ) ( not ( = ?auto_85986 ?auto_85990 ) ) ( not ( = ?auto_85987 ?auto_85990 ) ) ( not ( = ?auto_85988 ?auto_85990 ) ) ( not ( = ?auto_85989 ?auto_85990 ) ) ( ON ?auto_85988 ?auto_85989 ) ( ON-TABLE ?auto_85991 ) ( ON ?auto_85990 ?auto_85991 ) ( not ( = ?auto_85991 ?auto_85990 ) ) ( not ( = ?auto_85991 ?auto_85989 ) ) ( not ( = ?auto_85991 ?auto_85988 ) ) ( not ( = ?auto_85985 ?auto_85991 ) ) ( not ( = ?auto_85986 ?auto_85991 ) ) ( not ( = ?auto_85987 ?auto_85991 ) ) ( ON ?auto_85987 ?auto_85988 ) ( ON ?auto_85986 ?auto_85987 ) ( CLEAR ?auto_85986 ) ( ON ?auto_85985 ?auto_85992 ) ( CLEAR ?auto_85985 ) ( HAND-EMPTY ) ( not ( = ?auto_85985 ?auto_85992 ) ) ( not ( = ?auto_85986 ?auto_85992 ) ) ( not ( = ?auto_85987 ?auto_85992 ) ) ( not ( = ?auto_85988 ?auto_85992 ) ) ( not ( = ?auto_85989 ?auto_85992 ) ) ( not ( = ?auto_85990 ?auto_85992 ) ) ( not ( = ?auto_85991 ?auto_85992 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_85985 ?auto_85992 )
      ( MAKE-5PILE ?auto_85985 ?auto_85986 ?auto_85987 ?auto_85988 ?auto_85989 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_85993 - BLOCK
      ?auto_85994 - BLOCK
      ?auto_85995 - BLOCK
      ?auto_85996 - BLOCK
      ?auto_85997 - BLOCK
    )
    :vars
    (
      ?auto_86000 - BLOCK
      ?auto_85999 - BLOCK
      ?auto_85998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_85993 ?auto_85994 ) ) ( not ( = ?auto_85993 ?auto_85995 ) ) ( not ( = ?auto_85993 ?auto_85996 ) ) ( not ( = ?auto_85993 ?auto_85997 ) ) ( not ( = ?auto_85994 ?auto_85995 ) ) ( not ( = ?auto_85994 ?auto_85996 ) ) ( not ( = ?auto_85994 ?auto_85997 ) ) ( not ( = ?auto_85995 ?auto_85996 ) ) ( not ( = ?auto_85995 ?auto_85997 ) ) ( not ( = ?auto_85996 ?auto_85997 ) ) ( ON ?auto_85997 ?auto_86000 ) ( not ( = ?auto_85993 ?auto_86000 ) ) ( not ( = ?auto_85994 ?auto_86000 ) ) ( not ( = ?auto_85995 ?auto_86000 ) ) ( not ( = ?auto_85996 ?auto_86000 ) ) ( not ( = ?auto_85997 ?auto_86000 ) ) ( ON ?auto_85996 ?auto_85997 ) ( ON-TABLE ?auto_85999 ) ( ON ?auto_86000 ?auto_85999 ) ( not ( = ?auto_85999 ?auto_86000 ) ) ( not ( = ?auto_85999 ?auto_85997 ) ) ( not ( = ?auto_85999 ?auto_85996 ) ) ( not ( = ?auto_85993 ?auto_85999 ) ) ( not ( = ?auto_85994 ?auto_85999 ) ) ( not ( = ?auto_85995 ?auto_85999 ) ) ( ON ?auto_85995 ?auto_85996 ) ( ON ?auto_85993 ?auto_85998 ) ( CLEAR ?auto_85993 ) ( not ( = ?auto_85993 ?auto_85998 ) ) ( not ( = ?auto_85994 ?auto_85998 ) ) ( not ( = ?auto_85995 ?auto_85998 ) ) ( not ( = ?auto_85996 ?auto_85998 ) ) ( not ( = ?auto_85997 ?auto_85998 ) ) ( not ( = ?auto_86000 ?auto_85998 ) ) ( not ( = ?auto_85999 ?auto_85998 ) ) ( HOLDING ?auto_85994 ) ( CLEAR ?auto_85995 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_85999 ?auto_86000 ?auto_85997 ?auto_85996 ?auto_85995 ?auto_85994 )
      ( MAKE-5PILE ?auto_85993 ?auto_85994 ?auto_85995 ?auto_85996 ?auto_85997 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86001 - BLOCK
      ?auto_86002 - BLOCK
      ?auto_86003 - BLOCK
      ?auto_86004 - BLOCK
      ?auto_86005 - BLOCK
    )
    :vars
    (
      ?auto_86008 - BLOCK
      ?auto_86006 - BLOCK
      ?auto_86007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86001 ?auto_86002 ) ) ( not ( = ?auto_86001 ?auto_86003 ) ) ( not ( = ?auto_86001 ?auto_86004 ) ) ( not ( = ?auto_86001 ?auto_86005 ) ) ( not ( = ?auto_86002 ?auto_86003 ) ) ( not ( = ?auto_86002 ?auto_86004 ) ) ( not ( = ?auto_86002 ?auto_86005 ) ) ( not ( = ?auto_86003 ?auto_86004 ) ) ( not ( = ?auto_86003 ?auto_86005 ) ) ( not ( = ?auto_86004 ?auto_86005 ) ) ( ON ?auto_86005 ?auto_86008 ) ( not ( = ?auto_86001 ?auto_86008 ) ) ( not ( = ?auto_86002 ?auto_86008 ) ) ( not ( = ?auto_86003 ?auto_86008 ) ) ( not ( = ?auto_86004 ?auto_86008 ) ) ( not ( = ?auto_86005 ?auto_86008 ) ) ( ON ?auto_86004 ?auto_86005 ) ( ON-TABLE ?auto_86006 ) ( ON ?auto_86008 ?auto_86006 ) ( not ( = ?auto_86006 ?auto_86008 ) ) ( not ( = ?auto_86006 ?auto_86005 ) ) ( not ( = ?auto_86006 ?auto_86004 ) ) ( not ( = ?auto_86001 ?auto_86006 ) ) ( not ( = ?auto_86002 ?auto_86006 ) ) ( not ( = ?auto_86003 ?auto_86006 ) ) ( ON ?auto_86003 ?auto_86004 ) ( ON ?auto_86001 ?auto_86007 ) ( not ( = ?auto_86001 ?auto_86007 ) ) ( not ( = ?auto_86002 ?auto_86007 ) ) ( not ( = ?auto_86003 ?auto_86007 ) ) ( not ( = ?auto_86004 ?auto_86007 ) ) ( not ( = ?auto_86005 ?auto_86007 ) ) ( not ( = ?auto_86008 ?auto_86007 ) ) ( not ( = ?auto_86006 ?auto_86007 ) ) ( CLEAR ?auto_86003 ) ( ON ?auto_86002 ?auto_86001 ) ( CLEAR ?auto_86002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86007 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86007 ?auto_86001 )
      ( MAKE-5PILE ?auto_86001 ?auto_86002 ?auto_86003 ?auto_86004 ?auto_86005 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86009 - BLOCK
      ?auto_86010 - BLOCK
      ?auto_86011 - BLOCK
      ?auto_86012 - BLOCK
      ?auto_86013 - BLOCK
    )
    :vars
    (
      ?auto_86014 - BLOCK
      ?auto_86015 - BLOCK
      ?auto_86016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86009 ?auto_86010 ) ) ( not ( = ?auto_86009 ?auto_86011 ) ) ( not ( = ?auto_86009 ?auto_86012 ) ) ( not ( = ?auto_86009 ?auto_86013 ) ) ( not ( = ?auto_86010 ?auto_86011 ) ) ( not ( = ?auto_86010 ?auto_86012 ) ) ( not ( = ?auto_86010 ?auto_86013 ) ) ( not ( = ?auto_86011 ?auto_86012 ) ) ( not ( = ?auto_86011 ?auto_86013 ) ) ( not ( = ?auto_86012 ?auto_86013 ) ) ( ON ?auto_86013 ?auto_86014 ) ( not ( = ?auto_86009 ?auto_86014 ) ) ( not ( = ?auto_86010 ?auto_86014 ) ) ( not ( = ?auto_86011 ?auto_86014 ) ) ( not ( = ?auto_86012 ?auto_86014 ) ) ( not ( = ?auto_86013 ?auto_86014 ) ) ( ON ?auto_86012 ?auto_86013 ) ( ON-TABLE ?auto_86015 ) ( ON ?auto_86014 ?auto_86015 ) ( not ( = ?auto_86015 ?auto_86014 ) ) ( not ( = ?auto_86015 ?auto_86013 ) ) ( not ( = ?auto_86015 ?auto_86012 ) ) ( not ( = ?auto_86009 ?auto_86015 ) ) ( not ( = ?auto_86010 ?auto_86015 ) ) ( not ( = ?auto_86011 ?auto_86015 ) ) ( ON ?auto_86009 ?auto_86016 ) ( not ( = ?auto_86009 ?auto_86016 ) ) ( not ( = ?auto_86010 ?auto_86016 ) ) ( not ( = ?auto_86011 ?auto_86016 ) ) ( not ( = ?auto_86012 ?auto_86016 ) ) ( not ( = ?auto_86013 ?auto_86016 ) ) ( not ( = ?auto_86014 ?auto_86016 ) ) ( not ( = ?auto_86015 ?auto_86016 ) ) ( ON ?auto_86010 ?auto_86009 ) ( CLEAR ?auto_86010 ) ( ON-TABLE ?auto_86016 ) ( HOLDING ?auto_86011 ) ( CLEAR ?auto_86012 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86015 ?auto_86014 ?auto_86013 ?auto_86012 ?auto_86011 )
      ( MAKE-5PILE ?auto_86009 ?auto_86010 ?auto_86011 ?auto_86012 ?auto_86013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86017 - BLOCK
      ?auto_86018 - BLOCK
      ?auto_86019 - BLOCK
      ?auto_86020 - BLOCK
      ?auto_86021 - BLOCK
    )
    :vars
    (
      ?auto_86022 - BLOCK
      ?auto_86024 - BLOCK
      ?auto_86023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86017 ?auto_86018 ) ) ( not ( = ?auto_86017 ?auto_86019 ) ) ( not ( = ?auto_86017 ?auto_86020 ) ) ( not ( = ?auto_86017 ?auto_86021 ) ) ( not ( = ?auto_86018 ?auto_86019 ) ) ( not ( = ?auto_86018 ?auto_86020 ) ) ( not ( = ?auto_86018 ?auto_86021 ) ) ( not ( = ?auto_86019 ?auto_86020 ) ) ( not ( = ?auto_86019 ?auto_86021 ) ) ( not ( = ?auto_86020 ?auto_86021 ) ) ( ON ?auto_86021 ?auto_86022 ) ( not ( = ?auto_86017 ?auto_86022 ) ) ( not ( = ?auto_86018 ?auto_86022 ) ) ( not ( = ?auto_86019 ?auto_86022 ) ) ( not ( = ?auto_86020 ?auto_86022 ) ) ( not ( = ?auto_86021 ?auto_86022 ) ) ( ON ?auto_86020 ?auto_86021 ) ( ON-TABLE ?auto_86024 ) ( ON ?auto_86022 ?auto_86024 ) ( not ( = ?auto_86024 ?auto_86022 ) ) ( not ( = ?auto_86024 ?auto_86021 ) ) ( not ( = ?auto_86024 ?auto_86020 ) ) ( not ( = ?auto_86017 ?auto_86024 ) ) ( not ( = ?auto_86018 ?auto_86024 ) ) ( not ( = ?auto_86019 ?auto_86024 ) ) ( ON ?auto_86017 ?auto_86023 ) ( not ( = ?auto_86017 ?auto_86023 ) ) ( not ( = ?auto_86018 ?auto_86023 ) ) ( not ( = ?auto_86019 ?auto_86023 ) ) ( not ( = ?auto_86020 ?auto_86023 ) ) ( not ( = ?auto_86021 ?auto_86023 ) ) ( not ( = ?auto_86022 ?auto_86023 ) ) ( not ( = ?auto_86024 ?auto_86023 ) ) ( ON ?auto_86018 ?auto_86017 ) ( ON-TABLE ?auto_86023 ) ( CLEAR ?auto_86020 ) ( ON ?auto_86019 ?auto_86018 ) ( CLEAR ?auto_86019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86023 ?auto_86017 ?auto_86018 )
      ( MAKE-5PILE ?auto_86017 ?auto_86018 ?auto_86019 ?auto_86020 ?auto_86021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86025 - BLOCK
      ?auto_86026 - BLOCK
      ?auto_86027 - BLOCK
      ?auto_86028 - BLOCK
      ?auto_86029 - BLOCK
    )
    :vars
    (
      ?auto_86031 - BLOCK
      ?auto_86030 - BLOCK
      ?auto_86032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86025 ?auto_86026 ) ) ( not ( = ?auto_86025 ?auto_86027 ) ) ( not ( = ?auto_86025 ?auto_86028 ) ) ( not ( = ?auto_86025 ?auto_86029 ) ) ( not ( = ?auto_86026 ?auto_86027 ) ) ( not ( = ?auto_86026 ?auto_86028 ) ) ( not ( = ?auto_86026 ?auto_86029 ) ) ( not ( = ?auto_86027 ?auto_86028 ) ) ( not ( = ?auto_86027 ?auto_86029 ) ) ( not ( = ?auto_86028 ?auto_86029 ) ) ( ON ?auto_86029 ?auto_86031 ) ( not ( = ?auto_86025 ?auto_86031 ) ) ( not ( = ?auto_86026 ?auto_86031 ) ) ( not ( = ?auto_86027 ?auto_86031 ) ) ( not ( = ?auto_86028 ?auto_86031 ) ) ( not ( = ?auto_86029 ?auto_86031 ) ) ( ON-TABLE ?auto_86030 ) ( ON ?auto_86031 ?auto_86030 ) ( not ( = ?auto_86030 ?auto_86031 ) ) ( not ( = ?auto_86030 ?auto_86029 ) ) ( not ( = ?auto_86030 ?auto_86028 ) ) ( not ( = ?auto_86025 ?auto_86030 ) ) ( not ( = ?auto_86026 ?auto_86030 ) ) ( not ( = ?auto_86027 ?auto_86030 ) ) ( ON ?auto_86025 ?auto_86032 ) ( not ( = ?auto_86025 ?auto_86032 ) ) ( not ( = ?auto_86026 ?auto_86032 ) ) ( not ( = ?auto_86027 ?auto_86032 ) ) ( not ( = ?auto_86028 ?auto_86032 ) ) ( not ( = ?auto_86029 ?auto_86032 ) ) ( not ( = ?auto_86031 ?auto_86032 ) ) ( not ( = ?auto_86030 ?auto_86032 ) ) ( ON ?auto_86026 ?auto_86025 ) ( ON-TABLE ?auto_86032 ) ( ON ?auto_86027 ?auto_86026 ) ( CLEAR ?auto_86027 ) ( HOLDING ?auto_86028 ) ( CLEAR ?auto_86029 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86030 ?auto_86031 ?auto_86029 ?auto_86028 )
      ( MAKE-5PILE ?auto_86025 ?auto_86026 ?auto_86027 ?auto_86028 ?auto_86029 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86033 - BLOCK
      ?auto_86034 - BLOCK
      ?auto_86035 - BLOCK
      ?auto_86036 - BLOCK
      ?auto_86037 - BLOCK
    )
    :vars
    (
      ?auto_86040 - BLOCK
      ?auto_86039 - BLOCK
      ?auto_86038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86033 ?auto_86034 ) ) ( not ( = ?auto_86033 ?auto_86035 ) ) ( not ( = ?auto_86033 ?auto_86036 ) ) ( not ( = ?auto_86033 ?auto_86037 ) ) ( not ( = ?auto_86034 ?auto_86035 ) ) ( not ( = ?auto_86034 ?auto_86036 ) ) ( not ( = ?auto_86034 ?auto_86037 ) ) ( not ( = ?auto_86035 ?auto_86036 ) ) ( not ( = ?auto_86035 ?auto_86037 ) ) ( not ( = ?auto_86036 ?auto_86037 ) ) ( ON ?auto_86037 ?auto_86040 ) ( not ( = ?auto_86033 ?auto_86040 ) ) ( not ( = ?auto_86034 ?auto_86040 ) ) ( not ( = ?auto_86035 ?auto_86040 ) ) ( not ( = ?auto_86036 ?auto_86040 ) ) ( not ( = ?auto_86037 ?auto_86040 ) ) ( ON-TABLE ?auto_86039 ) ( ON ?auto_86040 ?auto_86039 ) ( not ( = ?auto_86039 ?auto_86040 ) ) ( not ( = ?auto_86039 ?auto_86037 ) ) ( not ( = ?auto_86039 ?auto_86036 ) ) ( not ( = ?auto_86033 ?auto_86039 ) ) ( not ( = ?auto_86034 ?auto_86039 ) ) ( not ( = ?auto_86035 ?auto_86039 ) ) ( ON ?auto_86033 ?auto_86038 ) ( not ( = ?auto_86033 ?auto_86038 ) ) ( not ( = ?auto_86034 ?auto_86038 ) ) ( not ( = ?auto_86035 ?auto_86038 ) ) ( not ( = ?auto_86036 ?auto_86038 ) ) ( not ( = ?auto_86037 ?auto_86038 ) ) ( not ( = ?auto_86040 ?auto_86038 ) ) ( not ( = ?auto_86039 ?auto_86038 ) ) ( ON ?auto_86034 ?auto_86033 ) ( ON-TABLE ?auto_86038 ) ( ON ?auto_86035 ?auto_86034 ) ( CLEAR ?auto_86037 ) ( ON ?auto_86036 ?auto_86035 ) ( CLEAR ?auto_86036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86038 ?auto_86033 ?auto_86034 ?auto_86035 )
      ( MAKE-5PILE ?auto_86033 ?auto_86034 ?auto_86035 ?auto_86036 ?auto_86037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86041 - BLOCK
      ?auto_86042 - BLOCK
      ?auto_86043 - BLOCK
      ?auto_86044 - BLOCK
      ?auto_86045 - BLOCK
    )
    :vars
    (
      ?auto_86048 - BLOCK
      ?auto_86047 - BLOCK
      ?auto_86046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86041 ?auto_86042 ) ) ( not ( = ?auto_86041 ?auto_86043 ) ) ( not ( = ?auto_86041 ?auto_86044 ) ) ( not ( = ?auto_86041 ?auto_86045 ) ) ( not ( = ?auto_86042 ?auto_86043 ) ) ( not ( = ?auto_86042 ?auto_86044 ) ) ( not ( = ?auto_86042 ?auto_86045 ) ) ( not ( = ?auto_86043 ?auto_86044 ) ) ( not ( = ?auto_86043 ?auto_86045 ) ) ( not ( = ?auto_86044 ?auto_86045 ) ) ( not ( = ?auto_86041 ?auto_86048 ) ) ( not ( = ?auto_86042 ?auto_86048 ) ) ( not ( = ?auto_86043 ?auto_86048 ) ) ( not ( = ?auto_86044 ?auto_86048 ) ) ( not ( = ?auto_86045 ?auto_86048 ) ) ( ON-TABLE ?auto_86047 ) ( ON ?auto_86048 ?auto_86047 ) ( not ( = ?auto_86047 ?auto_86048 ) ) ( not ( = ?auto_86047 ?auto_86045 ) ) ( not ( = ?auto_86047 ?auto_86044 ) ) ( not ( = ?auto_86041 ?auto_86047 ) ) ( not ( = ?auto_86042 ?auto_86047 ) ) ( not ( = ?auto_86043 ?auto_86047 ) ) ( ON ?auto_86041 ?auto_86046 ) ( not ( = ?auto_86041 ?auto_86046 ) ) ( not ( = ?auto_86042 ?auto_86046 ) ) ( not ( = ?auto_86043 ?auto_86046 ) ) ( not ( = ?auto_86044 ?auto_86046 ) ) ( not ( = ?auto_86045 ?auto_86046 ) ) ( not ( = ?auto_86048 ?auto_86046 ) ) ( not ( = ?auto_86047 ?auto_86046 ) ) ( ON ?auto_86042 ?auto_86041 ) ( ON-TABLE ?auto_86046 ) ( ON ?auto_86043 ?auto_86042 ) ( ON ?auto_86044 ?auto_86043 ) ( CLEAR ?auto_86044 ) ( HOLDING ?auto_86045 ) ( CLEAR ?auto_86048 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86047 ?auto_86048 ?auto_86045 )
      ( MAKE-5PILE ?auto_86041 ?auto_86042 ?auto_86043 ?auto_86044 ?auto_86045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86049 - BLOCK
      ?auto_86050 - BLOCK
      ?auto_86051 - BLOCK
      ?auto_86052 - BLOCK
      ?auto_86053 - BLOCK
    )
    :vars
    (
      ?auto_86056 - BLOCK
      ?auto_86054 - BLOCK
      ?auto_86055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86049 ?auto_86050 ) ) ( not ( = ?auto_86049 ?auto_86051 ) ) ( not ( = ?auto_86049 ?auto_86052 ) ) ( not ( = ?auto_86049 ?auto_86053 ) ) ( not ( = ?auto_86050 ?auto_86051 ) ) ( not ( = ?auto_86050 ?auto_86052 ) ) ( not ( = ?auto_86050 ?auto_86053 ) ) ( not ( = ?auto_86051 ?auto_86052 ) ) ( not ( = ?auto_86051 ?auto_86053 ) ) ( not ( = ?auto_86052 ?auto_86053 ) ) ( not ( = ?auto_86049 ?auto_86056 ) ) ( not ( = ?auto_86050 ?auto_86056 ) ) ( not ( = ?auto_86051 ?auto_86056 ) ) ( not ( = ?auto_86052 ?auto_86056 ) ) ( not ( = ?auto_86053 ?auto_86056 ) ) ( ON-TABLE ?auto_86054 ) ( ON ?auto_86056 ?auto_86054 ) ( not ( = ?auto_86054 ?auto_86056 ) ) ( not ( = ?auto_86054 ?auto_86053 ) ) ( not ( = ?auto_86054 ?auto_86052 ) ) ( not ( = ?auto_86049 ?auto_86054 ) ) ( not ( = ?auto_86050 ?auto_86054 ) ) ( not ( = ?auto_86051 ?auto_86054 ) ) ( ON ?auto_86049 ?auto_86055 ) ( not ( = ?auto_86049 ?auto_86055 ) ) ( not ( = ?auto_86050 ?auto_86055 ) ) ( not ( = ?auto_86051 ?auto_86055 ) ) ( not ( = ?auto_86052 ?auto_86055 ) ) ( not ( = ?auto_86053 ?auto_86055 ) ) ( not ( = ?auto_86056 ?auto_86055 ) ) ( not ( = ?auto_86054 ?auto_86055 ) ) ( ON ?auto_86050 ?auto_86049 ) ( ON-TABLE ?auto_86055 ) ( ON ?auto_86051 ?auto_86050 ) ( ON ?auto_86052 ?auto_86051 ) ( CLEAR ?auto_86056 ) ( ON ?auto_86053 ?auto_86052 ) ( CLEAR ?auto_86053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86055 ?auto_86049 ?auto_86050 ?auto_86051 ?auto_86052 )
      ( MAKE-5PILE ?auto_86049 ?auto_86050 ?auto_86051 ?auto_86052 ?auto_86053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86057 - BLOCK
      ?auto_86058 - BLOCK
      ?auto_86059 - BLOCK
      ?auto_86060 - BLOCK
      ?auto_86061 - BLOCK
    )
    :vars
    (
      ?auto_86063 - BLOCK
      ?auto_86062 - BLOCK
      ?auto_86064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86057 ?auto_86058 ) ) ( not ( = ?auto_86057 ?auto_86059 ) ) ( not ( = ?auto_86057 ?auto_86060 ) ) ( not ( = ?auto_86057 ?auto_86061 ) ) ( not ( = ?auto_86058 ?auto_86059 ) ) ( not ( = ?auto_86058 ?auto_86060 ) ) ( not ( = ?auto_86058 ?auto_86061 ) ) ( not ( = ?auto_86059 ?auto_86060 ) ) ( not ( = ?auto_86059 ?auto_86061 ) ) ( not ( = ?auto_86060 ?auto_86061 ) ) ( not ( = ?auto_86057 ?auto_86063 ) ) ( not ( = ?auto_86058 ?auto_86063 ) ) ( not ( = ?auto_86059 ?auto_86063 ) ) ( not ( = ?auto_86060 ?auto_86063 ) ) ( not ( = ?auto_86061 ?auto_86063 ) ) ( ON-TABLE ?auto_86062 ) ( not ( = ?auto_86062 ?auto_86063 ) ) ( not ( = ?auto_86062 ?auto_86061 ) ) ( not ( = ?auto_86062 ?auto_86060 ) ) ( not ( = ?auto_86057 ?auto_86062 ) ) ( not ( = ?auto_86058 ?auto_86062 ) ) ( not ( = ?auto_86059 ?auto_86062 ) ) ( ON ?auto_86057 ?auto_86064 ) ( not ( = ?auto_86057 ?auto_86064 ) ) ( not ( = ?auto_86058 ?auto_86064 ) ) ( not ( = ?auto_86059 ?auto_86064 ) ) ( not ( = ?auto_86060 ?auto_86064 ) ) ( not ( = ?auto_86061 ?auto_86064 ) ) ( not ( = ?auto_86063 ?auto_86064 ) ) ( not ( = ?auto_86062 ?auto_86064 ) ) ( ON ?auto_86058 ?auto_86057 ) ( ON-TABLE ?auto_86064 ) ( ON ?auto_86059 ?auto_86058 ) ( ON ?auto_86060 ?auto_86059 ) ( ON ?auto_86061 ?auto_86060 ) ( CLEAR ?auto_86061 ) ( HOLDING ?auto_86063 ) ( CLEAR ?auto_86062 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86062 ?auto_86063 )
      ( MAKE-5PILE ?auto_86057 ?auto_86058 ?auto_86059 ?auto_86060 ?auto_86061 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86065 - BLOCK
      ?auto_86066 - BLOCK
      ?auto_86067 - BLOCK
      ?auto_86068 - BLOCK
      ?auto_86069 - BLOCK
    )
    :vars
    (
      ?auto_86072 - BLOCK
      ?auto_86070 - BLOCK
      ?auto_86071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86065 ?auto_86066 ) ) ( not ( = ?auto_86065 ?auto_86067 ) ) ( not ( = ?auto_86065 ?auto_86068 ) ) ( not ( = ?auto_86065 ?auto_86069 ) ) ( not ( = ?auto_86066 ?auto_86067 ) ) ( not ( = ?auto_86066 ?auto_86068 ) ) ( not ( = ?auto_86066 ?auto_86069 ) ) ( not ( = ?auto_86067 ?auto_86068 ) ) ( not ( = ?auto_86067 ?auto_86069 ) ) ( not ( = ?auto_86068 ?auto_86069 ) ) ( not ( = ?auto_86065 ?auto_86072 ) ) ( not ( = ?auto_86066 ?auto_86072 ) ) ( not ( = ?auto_86067 ?auto_86072 ) ) ( not ( = ?auto_86068 ?auto_86072 ) ) ( not ( = ?auto_86069 ?auto_86072 ) ) ( ON-TABLE ?auto_86070 ) ( not ( = ?auto_86070 ?auto_86072 ) ) ( not ( = ?auto_86070 ?auto_86069 ) ) ( not ( = ?auto_86070 ?auto_86068 ) ) ( not ( = ?auto_86065 ?auto_86070 ) ) ( not ( = ?auto_86066 ?auto_86070 ) ) ( not ( = ?auto_86067 ?auto_86070 ) ) ( ON ?auto_86065 ?auto_86071 ) ( not ( = ?auto_86065 ?auto_86071 ) ) ( not ( = ?auto_86066 ?auto_86071 ) ) ( not ( = ?auto_86067 ?auto_86071 ) ) ( not ( = ?auto_86068 ?auto_86071 ) ) ( not ( = ?auto_86069 ?auto_86071 ) ) ( not ( = ?auto_86072 ?auto_86071 ) ) ( not ( = ?auto_86070 ?auto_86071 ) ) ( ON ?auto_86066 ?auto_86065 ) ( ON-TABLE ?auto_86071 ) ( ON ?auto_86067 ?auto_86066 ) ( ON ?auto_86068 ?auto_86067 ) ( ON ?auto_86069 ?auto_86068 ) ( CLEAR ?auto_86070 ) ( ON ?auto_86072 ?auto_86069 ) ( CLEAR ?auto_86072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86071 ?auto_86065 ?auto_86066 ?auto_86067 ?auto_86068 ?auto_86069 )
      ( MAKE-5PILE ?auto_86065 ?auto_86066 ?auto_86067 ?auto_86068 ?auto_86069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86073 - BLOCK
      ?auto_86074 - BLOCK
      ?auto_86075 - BLOCK
      ?auto_86076 - BLOCK
      ?auto_86077 - BLOCK
    )
    :vars
    (
      ?auto_86079 - BLOCK
      ?auto_86080 - BLOCK
      ?auto_86078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86073 ?auto_86074 ) ) ( not ( = ?auto_86073 ?auto_86075 ) ) ( not ( = ?auto_86073 ?auto_86076 ) ) ( not ( = ?auto_86073 ?auto_86077 ) ) ( not ( = ?auto_86074 ?auto_86075 ) ) ( not ( = ?auto_86074 ?auto_86076 ) ) ( not ( = ?auto_86074 ?auto_86077 ) ) ( not ( = ?auto_86075 ?auto_86076 ) ) ( not ( = ?auto_86075 ?auto_86077 ) ) ( not ( = ?auto_86076 ?auto_86077 ) ) ( not ( = ?auto_86073 ?auto_86079 ) ) ( not ( = ?auto_86074 ?auto_86079 ) ) ( not ( = ?auto_86075 ?auto_86079 ) ) ( not ( = ?auto_86076 ?auto_86079 ) ) ( not ( = ?auto_86077 ?auto_86079 ) ) ( not ( = ?auto_86080 ?auto_86079 ) ) ( not ( = ?auto_86080 ?auto_86077 ) ) ( not ( = ?auto_86080 ?auto_86076 ) ) ( not ( = ?auto_86073 ?auto_86080 ) ) ( not ( = ?auto_86074 ?auto_86080 ) ) ( not ( = ?auto_86075 ?auto_86080 ) ) ( ON ?auto_86073 ?auto_86078 ) ( not ( = ?auto_86073 ?auto_86078 ) ) ( not ( = ?auto_86074 ?auto_86078 ) ) ( not ( = ?auto_86075 ?auto_86078 ) ) ( not ( = ?auto_86076 ?auto_86078 ) ) ( not ( = ?auto_86077 ?auto_86078 ) ) ( not ( = ?auto_86079 ?auto_86078 ) ) ( not ( = ?auto_86080 ?auto_86078 ) ) ( ON ?auto_86074 ?auto_86073 ) ( ON-TABLE ?auto_86078 ) ( ON ?auto_86075 ?auto_86074 ) ( ON ?auto_86076 ?auto_86075 ) ( ON ?auto_86077 ?auto_86076 ) ( ON ?auto_86079 ?auto_86077 ) ( CLEAR ?auto_86079 ) ( HOLDING ?auto_86080 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86080 )
      ( MAKE-5PILE ?auto_86073 ?auto_86074 ?auto_86075 ?auto_86076 ?auto_86077 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_86081 - BLOCK
      ?auto_86082 - BLOCK
      ?auto_86083 - BLOCK
      ?auto_86084 - BLOCK
      ?auto_86085 - BLOCK
    )
    :vars
    (
      ?auto_86087 - BLOCK
      ?auto_86088 - BLOCK
      ?auto_86086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86081 ?auto_86082 ) ) ( not ( = ?auto_86081 ?auto_86083 ) ) ( not ( = ?auto_86081 ?auto_86084 ) ) ( not ( = ?auto_86081 ?auto_86085 ) ) ( not ( = ?auto_86082 ?auto_86083 ) ) ( not ( = ?auto_86082 ?auto_86084 ) ) ( not ( = ?auto_86082 ?auto_86085 ) ) ( not ( = ?auto_86083 ?auto_86084 ) ) ( not ( = ?auto_86083 ?auto_86085 ) ) ( not ( = ?auto_86084 ?auto_86085 ) ) ( not ( = ?auto_86081 ?auto_86087 ) ) ( not ( = ?auto_86082 ?auto_86087 ) ) ( not ( = ?auto_86083 ?auto_86087 ) ) ( not ( = ?auto_86084 ?auto_86087 ) ) ( not ( = ?auto_86085 ?auto_86087 ) ) ( not ( = ?auto_86088 ?auto_86087 ) ) ( not ( = ?auto_86088 ?auto_86085 ) ) ( not ( = ?auto_86088 ?auto_86084 ) ) ( not ( = ?auto_86081 ?auto_86088 ) ) ( not ( = ?auto_86082 ?auto_86088 ) ) ( not ( = ?auto_86083 ?auto_86088 ) ) ( ON ?auto_86081 ?auto_86086 ) ( not ( = ?auto_86081 ?auto_86086 ) ) ( not ( = ?auto_86082 ?auto_86086 ) ) ( not ( = ?auto_86083 ?auto_86086 ) ) ( not ( = ?auto_86084 ?auto_86086 ) ) ( not ( = ?auto_86085 ?auto_86086 ) ) ( not ( = ?auto_86087 ?auto_86086 ) ) ( not ( = ?auto_86088 ?auto_86086 ) ) ( ON ?auto_86082 ?auto_86081 ) ( ON-TABLE ?auto_86086 ) ( ON ?auto_86083 ?auto_86082 ) ( ON ?auto_86084 ?auto_86083 ) ( ON ?auto_86085 ?auto_86084 ) ( ON ?auto_86087 ?auto_86085 ) ( ON ?auto_86088 ?auto_86087 ) ( CLEAR ?auto_86088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86086 ?auto_86081 ?auto_86082 ?auto_86083 ?auto_86084 ?auto_86085 ?auto_86087 )
      ( MAKE-5PILE ?auto_86081 ?auto_86082 ?auto_86083 ?auto_86084 ?auto_86085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86100 - BLOCK
    )
    :vars
    (
      ?auto_86102 - BLOCK
      ?auto_86101 - BLOCK
      ?auto_86103 - BLOCK
      ?auto_86104 - BLOCK
      ?auto_86106 - BLOCK
      ?auto_86105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86102 ?auto_86100 ) ( ON-TABLE ?auto_86100 ) ( not ( = ?auto_86100 ?auto_86102 ) ) ( not ( = ?auto_86100 ?auto_86101 ) ) ( not ( = ?auto_86100 ?auto_86103 ) ) ( not ( = ?auto_86102 ?auto_86101 ) ) ( not ( = ?auto_86102 ?auto_86103 ) ) ( not ( = ?auto_86101 ?auto_86103 ) ) ( ON ?auto_86101 ?auto_86102 ) ( CLEAR ?auto_86101 ) ( HOLDING ?auto_86103 ) ( CLEAR ?auto_86104 ) ( ON-TABLE ?auto_86106 ) ( ON ?auto_86105 ?auto_86106 ) ( ON ?auto_86104 ?auto_86105 ) ( not ( = ?auto_86106 ?auto_86105 ) ) ( not ( = ?auto_86106 ?auto_86104 ) ) ( not ( = ?auto_86106 ?auto_86103 ) ) ( not ( = ?auto_86105 ?auto_86104 ) ) ( not ( = ?auto_86105 ?auto_86103 ) ) ( not ( = ?auto_86104 ?auto_86103 ) ) ( not ( = ?auto_86100 ?auto_86104 ) ) ( not ( = ?auto_86100 ?auto_86106 ) ) ( not ( = ?auto_86100 ?auto_86105 ) ) ( not ( = ?auto_86102 ?auto_86104 ) ) ( not ( = ?auto_86102 ?auto_86106 ) ) ( not ( = ?auto_86102 ?auto_86105 ) ) ( not ( = ?auto_86101 ?auto_86104 ) ) ( not ( = ?auto_86101 ?auto_86106 ) ) ( not ( = ?auto_86101 ?auto_86105 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86106 ?auto_86105 ?auto_86104 ?auto_86103 )
      ( MAKE-1PILE ?auto_86100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86107 - BLOCK
    )
    :vars
    (
      ?auto_86112 - BLOCK
      ?auto_86111 - BLOCK
      ?auto_86113 - BLOCK
      ?auto_86108 - BLOCK
      ?auto_86110 - BLOCK
      ?auto_86109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86112 ?auto_86107 ) ( ON-TABLE ?auto_86107 ) ( not ( = ?auto_86107 ?auto_86112 ) ) ( not ( = ?auto_86107 ?auto_86111 ) ) ( not ( = ?auto_86107 ?auto_86113 ) ) ( not ( = ?auto_86112 ?auto_86111 ) ) ( not ( = ?auto_86112 ?auto_86113 ) ) ( not ( = ?auto_86111 ?auto_86113 ) ) ( ON ?auto_86111 ?auto_86112 ) ( CLEAR ?auto_86108 ) ( ON-TABLE ?auto_86110 ) ( ON ?auto_86109 ?auto_86110 ) ( ON ?auto_86108 ?auto_86109 ) ( not ( = ?auto_86110 ?auto_86109 ) ) ( not ( = ?auto_86110 ?auto_86108 ) ) ( not ( = ?auto_86110 ?auto_86113 ) ) ( not ( = ?auto_86109 ?auto_86108 ) ) ( not ( = ?auto_86109 ?auto_86113 ) ) ( not ( = ?auto_86108 ?auto_86113 ) ) ( not ( = ?auto_86107 ?auto_86108 ) ) ( not ( = ?auto_86107 ?auto_86110 ) ) ( not ( = ?auto_86107 ?auto_86109 ) ) ( not ( = ?auto_86112 ?auto_86108 ) ) ( not ( = ?auto_86112 ?auto_86110 ) ) ( not ( = ?auto_86112 ?auto_86109 ) ) ( not ( = ?auto_86111 ?auto_86108 ) ) ( not ( = ?auto_86111 ?auto_86110 ) ) ( not ( = ?auto_86111 ?auto_86109 ) ) ( ON ?auto_86113 ?auto_86111 ) ( CLEAR ?auto_86113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86107 ?auto_86112 ?auto_86111 )
      ( MAKE-1PILE ?auto_86107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86114 - BLOCK
    )
    :vars
    (
      ?auto_86119 - BLOCK
      ?auto_86120 - BLOCK
      ?auto_86118 - BLOCK
      ?auto_86116 - BLOCK
      ?auto_86115 - BLOCK
      ?auto_86117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86119 ?auto_86114 ) ( ON-TABLE ?auto_86114 ) ( not ( = ?auto_86114 ?auto_86119 ) ) ( not ( = ?auto_86114 ?auto_86120 ) ) ( not ( = ?auto_86114 ?auto_86118 ) ) ( not ( = ?auto_86119 ?auto_86120 ) ) ( not ( = ?auto_86119 ?auto_86118 ) ) ( not ( = ?auto_86120 ?auto_86118 ) ) ( ON ?auto_86120 ?auto_86119 ) ( ON-TABLE ?auto_86116 ) ( ON ?auto_86115 ?auto_86116 ) ( not ( = ?auto_86116 ?auto_86115 ) ) ( not ( = ?auto_86116 ?auto_86117 ) ) ( not ( = ?auto_86116 ?auto_86118 ) ) ( not ( = ?auto_86115 ?auto_86117 ) ) ( not ( = ?auto_86115 ?auto_86118 ) ) ( not ( = ?auto_86117 ?auto_86118 ) ) ( not ( = ?auto_86114 ?auto_86117 ) ) ( not ( = ?auto_86114 ?auto_86116 ) ) ( not ( = ?auto_86114 ?auto_86115 ) ) ( not ( = ?auto_86119 ?auto_86117 ) ) ( not ( = ?auto_86119 ?auto_86116 ) ) ( not ( = ?auto_86119 ?auto_86115 ) ) ( not ( = ?auto_86120 ?auto_86117 ) ) ( not ( = ?auto_86120 ?auto_86116 ) ) ( not ( = ?auto_86120 ?auto_86115 ) ) ( ON ?auto_86118 ?auto_86120 ) ( CLEAR ?auto_86118 ) ( HOLDING ?auto_86117 ) ( CLEAR ?auto_86115 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86116 ?auto_86115 ?auto_86117 )
      ( MAKE-1PILE ?auto_86114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86121 - BLOCK
    )
    :vars
    (
      ?auto_86122 - BLOCK
      ?auto_86124 - BLOCK
      ?auto_86125 - BLOCK
      ?auto_86127 - BLOCK
      ?auto_86123 - BLOCK
      ?auto_86126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86122 ?auto_86121 ) ( ON-TABLE ?auto_86121 ) ( not ( = ?auto_86121 ?auto_86122 ) ) ( not ( = ?auto_86121 ?auto_86124 ) ) ( not ( = ?auto_86121 ?auto_86125 ) ) ( not ( = ?auto_86122 ?auto_86124 ) ) ( not ( = ?auto_86122 ?auto_86125 ) ) ( not ( = ?auto_86124 ?auto_86125 ) ) ( ON ?auto_86124 ?auto_86122 ) ( ON-TABLE ?auto_86127 ) ( ON ?auto_86123 ?auto_86127 ) ( not ( = ?auto_86127 ?auto_86123 ) ) ( not ( = ?auto_86127 ?auto_86126 ) ) ( not ( = ?auto_86127 ?auto_86125 ) ) ( not ( = ?auto_86123 ?auto_86126 ) ) ( not ( = ?auto_86123 ?auto_86125 ) ) ( not ( = ?auto_86126 ?auto_86125 ) ) ( not ( = ?auto_86121 ?auto_86126 ) ) ( not ( = ?auto_86121 ?auto_86127 ) ) ( not ( = ?auto_86121 ?auto_86123 ) ) ( not ( = ?auto_86122 ?auto_86126 ) ) ( not ( = ?auto_86122 ?auto_86127 ) ) ( not ( = ?auto_86122 ?auto_86123 ) ) ( not ( = ?auto_86124 ?auto_86126 ) ) ( not ( = ?auto_86124 ?auto_86127 ) ) ( not ( = ?auto_86124 ?auto_86123 ) ) ( ON ?auto_86125 ?auto_86124 ) ( CLEAR ?auto_86123 ) ( ON ?auto_86126 ?auto_86125 ) ( CLEAR ?auto_86126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86121 ?auto_86122 ?auto_86124 ?auto_86125 )
      ( MAKE-1PILE ?auto_86121 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86128 - BLOCK
    )
    :vars
    (
      ?auto_86131 - BLOCK
      ?auto_86133 - BLOCK
      ?auto_86132 - BLOCK
      ?auto_86134 - BLOCK
      ?auto_86130 - BLOCK
      ?auto_86129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86131 ?auto_86128 ) ( ON-TABLE ?auto_86128 ) ( not ( = ?auto_86128 ?auto_86131 ) ) ( not ( = ?auto_86128 ?auto_86133 ) ) ( not ( = ?auto_86128 ?auto_86132 ) ) ( not ( = ?auto_86131 ?auto_86133 ) ) ( not ( = ?auto_86131 ?auto_86132 ) ) ( not ( = ?auto_86133 ?auto_86132 ) ) ( ON ?auto_86133 ?auto_86131 ) ( ON-TABLE ?auto_86134 ) ( not ( = ?auto_86134 ?auto_86130 ) ) ( not ( = ?auto_86134 ?auto_86129 ) ) ( not ( = ?auto_86134 ?auto_86132 ) ) ( not ( = ?auto_86130 ?auto_86129 ) ) ( not ( = ?auto_86130 ?auto_86132 ) ) ( not ( = ?auto_86129 ?auto_86132 ) ) ( not ( = ?auto_86128 ?auto_86129 ) ) ( not ( = ?auto_86128 ?auto_86134 ) ) ( not ( = ?auto_86128 ?auto_86130 ) ) ( not ( = ?auto_86131 ?auto_86129 ) ) ( not ( = ?auto_86131 ?auto_86134 ) ) ( not ( = ?auto_86131 ?auto_86130 ) ) ( not ( = ?auto_86133 ?auto_86129 ) ) ( not ( = ?auto_86133 ?auto_86134 ) ) ( not ( = ?auto_86133 ?auto_86130 ) ) ( ON ?auto_86132 ?auto_86133 ) ( ON ?auto_86129 ?auto_86132 ) ( CLEAR ?auto_86129 ) ( HOLDING ?auto_86130 ) ( CLEAR ?auto_86134 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86134 ?auto_86130 )
      ( MAKE-1PILE ?auto_86128 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86135 - BLOCK
    )
    :vars
    (
      ?auto_86139 - BLOCK
      ?auto_86141 - BLOCK
      ?auto_86140 - BLOCK
      ?auto_86138 - BLOCK
      ?auto_86136 - BLOCK
      ?auto_86137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86139 ?auto_86135 ) ( ON-TABLE ?auto_86135 ) ( not ( = ?auto_86135 ?auto_86139 ) ) ( not ( = ?auto_86135 ?auto_86141 ) ) ( not ( = ?auto_86135 ?auto_86140 ) ) ( not ( = ?auto_86139 ?auto_86141 ) ) ( not ( = ?auto_86139 ?auto_86140 ) ) ( not ( = ?auto_86141 ?auto_86140 ) ) ( ON ?auto_86141 ?auto_86139 ) ( ON-TABLE ?auto_86138 ) ( not ( = ?auto_86138 ?auto_86136 ) ) ( not ( = ?auto_86138 ?auto_86137 ) ) ( not ( = ?auto_86138 ?auto_86140 ) ) ( not ( = ?auto_86136 ?auto_86137 ) ) ( not ( = ?auto_86136 ?auto_86140 ) ) ( not ( = ?auto_86137 ?auto_86140 ) ) ( not ( = ?auto_86135 ?auto_86137 ) ) ( not ( = ?auto_86135 ?auto_86138 ) ) ( not ( = ?auto_86135 ?auto_86136 ) ) ( not ( = ?auto_86139 ?auto_86137 ) ) ( not ( = ?auto_86139 ?auto_86138 ) ) ( not ( = ?auto_86139 ?auto_86136 ) ) ( not ( = ?auto_86141 ?auto_86137 ) ) ( not ( = ?auto_86141 ?auto_86138 ) ) ( not ( = ?auto_86141 ?auto_86136 ) ) ( ON ?auto_86140 ?auto_86141 ) ( ON ?auto_86137 ?auto_86140 ) ( CLEAR ?auto_86138 ) ( ON ?auto_86136 ?auto_86137 ) ( CLEAR ?auto_86136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86135 ?auto_86139 ?auto_86141 ?auto_86140 ?auto_86137 )
      ( MAKE-1PILE ?auto_86135 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86142 - BLOCK
    )
    :vars
    (
      ?auto_86147 - BLOCK
      ?auto_86148 - BLOCK
      ?auto_86145 - BLOCK
      ?auto_86144 - BLOCK
      ?auto_86143 - BLOCK
      ?auto_86146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86147 ?auto_86142 ) ( ON-TABLE ?auto_86142 ) ( not ( = ?auto_86142 ?auto_86147 ) ) ( not ( = ?auto_86142 ?auto_86148 ) ) ( not ( = ?auto_86142 ?auto_86145 ) ) ( not ( = ?auto_86147 ?auto_86148 ) ) ( not ( = ?auto_86147 ?auto_86145 ) ) ( not ( = ?auto_86148 ?auto_86145 ) ) ( ON ?auto_86148 ?auto_86147 ) ( not ( = ?auto_86144 ?auto_86143 ) ) ( not ( = ?auto_86144 ?auto_86146 ) ) ( not ( = ?auto_86144 ?auto_86145 ) ) ( not ( = ?auto_86143 ?auto_86146 ) ) ( not ( = ?auto_86143 ?auto_86145 ) ) ( not ( = ?auto_86146 ?auto_86145 ) ) ( not ( = ?auto_86142 ?auto_86146 ) ) ( not ( = ?auto_86142 ?auto_86144 ) ) ( not ( = ?auto_86142 ?auto_86143 ) ) ( not ( = ?auto_86147 ?auto_86146 ) ) ( not ( = ?auto_86147 ?auto_86144 ) ) ( not ( = ?auto_86147 ?auto_86143 ) ) ( not ( = ?auto_86148 ?auto_86146 ) ) ( not ( = ?auto_86148 ?auto_86144 ) ) ( not ( = ?auto_86148 ?auto_86143 ) ) ( ON ?auto_86145 ?auto_86148 ) ( ON ?auto_86146 ?auto_86145 ) ( ON ?auto_86143 ?auto_86146 ) ( CLEAR ?auto_86143 ) ( HOLDING ?auto_86144 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86144 )
      ( MAKE-1PILE ?auto_86142 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86157 - BLOCK
    )
    :vars
    (
      ?auto_86162 - BLOCK
      ?auto_86160 - BLOCK
      ?auto_86158 - BLOCK
      ?auto_86163 - BLOCK
      ?auto_86159 - BLOCK
      ?auto_86161 - BLOCK
      ?auto_86164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86162 ?auto_86157 ) ( ON-TABLE ?auto_86157 ) ( not ( = ?auto_86157 ?auto_86162 ) ) ( not ( = ?auto_86157 ?auto_86160 ) ) ( not ( = ?auto_86157 ?auto_86158 ) ) ( not ( = ?auto_86162 ?auto_86160 ) ) ( not ( = ?auto_86162 ?auto_86158 ) ) ( not ( = ?auto_86160 ?auto_86158 ) ) ( ON ?auto_86160 ?auto_86162 ) ( not ( = ?auto_86163 ?auto_86159 ) ) ( not ( = ?auto_86163 ?auto_86161 ) ) ( not ( = ?auto_86163 ?auto_86158 ) ) ( not ( = ?auto_86159 ?auto_86161 ) ) ( not ( = ?auto_86159 ?auto_86158 ) ) ( not ( = ?auto_86161 ?auto_86158 ) ) ( not ( = ?auto_86157 ?auto_86161 ) ) ( not ( = ?auto_86157 ?auto_86163 ) ) ( not ( = ?auto_86157 ?auto_86159 ) ) ( not ( = ?auto_86162 ?auto_86161 ) ) ( not ( = ?auto_86162 ?auto_86163 ) ) ( not ( = ?auto_86162 ?auto_86159 ) ) ( not ( = ?auto_86160 ?auto_86161 ) ) ( not ( = ?auto_86160 ?auto_86163 ) ) ( not ( = ?auto_86160 ?auto_86159 ) ) ( ON ?auto_86158 ?auto_86160 ) ( ON ?auto_86161 ?auto_86158 ) ( ON ?auto_86159 ?auto_86161 ) ( CLEAR ?auto_86159 ) ( ON ?auto_86163 ?auto_86164 ) ( CLEAR ?auto_86163 ) ( HAND-EMPTY ) ( not ( = ?auto_86157 ?auto_86164 ) ) ( not ( = ?auto_86162 ?auto_86164 ) ) ( not ( = ?auto_86160 ?auto_86164 ) ) ( not ( = ?auto_86158 ?auto_86164 ) ) ( not ( = ?auto_86163 ?auto_86164 ) ) ( not ( = ?auto_86159 ?auto_86164 ) ) ( not ( = ?auto_86161 ?auto_86164 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86163 ?auto_86164 )
      ( MAKE-1PILE ?auto_86157 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86165 - BLOCK
    )
    :vars
    (
      ?auto_86172 - BLOCK
      ?auto_86170 - BLOCK
      ?auto_86166 - BLOCK
      ?auto_86167 - BLOCK
      ?auto_86171 - BLOCK
      ?auto_86168 - BLOCK
      ?auto_86169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86172 ?auto_86165 ) ( ON-TABLE ?auto_86165 ) ( not ( = ?auto_86165 ?auto_86172 ) ) ( not ( = ?auto_86165 ?auto_86170 ) ) ( not ( = ?auto_86165 ?auto_86166 ) ) ( not ( = ?auto_86172 ?auto_86170 ) ) ( not ( = ?auto_86172 ?auto_86166 ) ) ( not ( = ?auto_86170 ?auto_86166 ) ) ( ON ?auto_86170 ?auto_86172 ) ( not ( = ?auto_86167 ?auto_86171 ) ) ( not ( = ?auto_86167 ?auto_86168 ) ) ( not ( = ?auto_86167 ?auto_86166 ) ) ( not ( = ?auto_86171 ?auto_86168 ) ) ( not ( = ?auto_86171 ?auto_86166 ) ) ( not ( = ?auto_86168 ?auto_86166 ) ) ( not ( = ?auto_86165 ?auto_86168 ) ) ( not ( = ?auto_86165 ?auto_86167 ) ) ( not ( = ?auto_86165 ?auto_86171 ) ) ( not ( = ?auto_86172 ?auto_86168 ) ) ( not ( = ?auto_86172 ?auto_86167 ) ) ( not ( = ?auto_86172 ?auto_86171 ) ) ( not ( = ?auto_86170 ?auto_86168 ) ) ( not ( = ?auto_86170 ?auto_86167 ) ) ( not ( = ?auto_86170 ?auto_86171 ) ) ( ON ?auto_86166 ?auto_86170 ) ( ON ?auto_86168 ?auto_86166 ) ( ON ?auto_86167 ?auto_86169 ) ( CLEAR ?auto_86167 ) ( not ( = ?auto_86165 ?auto_86169 ) ) ( not ( = ?auto_86172 ?auto_86169 ) ) ( not ( = ?auto_86170 ?auto_86169 ) ) ( not ( = ?auto_86166 ?auto_86169 ) ) ( not ( = ?auto_86167 ?auto_86169 ) ) ( not ( = ?auto_86171 ?auto_86169 ) ) ( not ( = ?auto_86168 ?auto_86169 ) ) ( HOLDING ?auto_86171 ) ( CLEAR ?auto_86168 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86165 ?auto_86172 ?auto_86170 ?auto_86166 ?auto_86168 ?auto_86171 )
      ( MAKE-1PILE ?auto_86165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86173 - BLOCK
    )
    :vars
    (
      ?auto_86175 - BLOCK
      ?auto_86179 - BLOCK
      ?auto_86177 - BLOCK
      ?auto_86176 - BLOCK
      ?auto_86180 - BLOCK
      ?auto_86178 - BLOCK
      ?auto_86174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86175 ?auto_86173 ) ( ON-TABLE ?auto_86173 ) ( not ( = ?auto_86173 ?auto_86175 ) ) ( not ( = ?auto_86173 ?auto_86179 ) ) ( not ( = ?auto_86173 ?auto_86177 ) ) ( not ( = ?auto_86175 ?auto_86179 ) ) ( not ( = ?auto_86175 ?auto_86177 ) ) ( not ( = ?auto_86179 ?auto_86177 ) ) ( ON ?auto_86179 ?auto_86175 ) ( not ( = ?auto_86176 ?auto_86180 ) ) ( not ( = ?auto_86176 ?auto_86178 ) ) ( not ( = ?auto_86176 ?auto_86177 ) ) ( not ( = ?auto_86180 ?auto_86178 ) ) ( not ( = ?auto_86180 ?auto_86177 ) ) ( not ( = ?auto_86178 ?auto_86177 ) ) ( not ( = ?auto_86173 ?auto_86178 ) ) ( not ( = ?auto_86173 ?auto_86176 ) ) ( not ( = ?auto_86173 ?auto_86180 ) ) ( not ( = ?auto_86175 ?auto_86178 ) ) ( not ( = ?auto_86175 ?auto_86176 ) ) ( not ( = ?auto_86175 ?auto_86180 ) ) ( not ( = ?auto_86179 ?auto_86178 ) ) ( not ( = ?auto_86179 ?auto_86176 ) ) ( not ( = ?auto_86179 ?auto_86180 ) ) ( ON ?auto_86177 ?auto_86179 ) ( ON ?auto_86178 ?auto_86177 ) ( ON ?auto_86176 ?auto_86174 ) ( not ( = ?auto_86173 ?auto_86174 ) ) ( not ( = ?auto_86175 ?auto_86174 ) ) ( not ( = ?auto_86179 ?auto_86174 ) ) ( not ( = ?auto_86177 ?auto_86174 ) ) ( not ( = ?auto_86176 ?auto_86174 ) ) ( not ( = ?auto_86180 ?auto_86174 ) ) ( not ( = ?auto_86178 ?auto_86174 ) ) ( CLEAR ?auto_86178 ) ( ON ?auto_86180 ?auto_86176 ) ( CLEAR ?auto_86180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86174 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86174 ?auto_86176 )
      ( MAKE-1PILE ?auto_86173 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_86181 - BLOCK
    )
    :vars
    (
      ?auto_86185 - BLOCK
      ?auto_86184 - BLOCK
      ?auto_86182 - BLOCK
      ?auto_86188 - BLOCK
      ?auto_86186 - BLOCK
      ?auto_86187 - BLOCK
      ?auto_86183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_86185 ?auto_86181 ) ( ON-TABLE ?auto_86181 ) ( not ( = ?auto_86181 ?auto_86185 ) ) ( not ( = ?auto_86181 ?auto_86184 ) ) ( not ( = ?auto_86181 ?auto_86182 ) ) ( not ( = ?auto_86185 ?auto_86184 ) ) ( not ( = ?auto_86185 ?auto_86182 ) ) ( not ( = ?auto_86184 ?auto_86182 ) ) ( ON ?auto_86184 ?auto_86185 ) ( not ( = ?auto_86188 ?auto_86186 ) ) ( not ( = ?auto_86188 ?auto_86187 ) ) ( not ( = ?auto_86188 ?auto_86182 ) ) ( not ( = ?auto_86186 ?auto_86187 ) ) ( not ( = ?auto_86186 ?auto_86182 ) ) ( not ( = ?auto_86187 ?auto_86182 ) ) ( not ( = ?auto_86181 ?auto_86187 ) ) ( not ( = ?auto_86181 ?auto_86188 ) ) ( not ( = ?auto_86181 ?auto_86186 ) ) ( not ( = ?auto_86185 ?auto_86187 ) ) ( not ( = ?auto_86185 ?auto_86188 ) ) ( not ( = ?auto_86185 ?auto_86186 ) ) ( not ( = ?auto_86184 ?auto_86187 ) ) ( not ( = ?auto_86184 ?auto_86188 ) ) ( not ( = ?auto_86184 ?auto_86186 ) ) ( ON ?auto_86182 ?auto_86184 ) ( ON ?auto_86188 ?auto_86183 ) ( not ( = ?auto_86181 ?auto_86183 ) ) ( not ( = ?auto_86185 ?auto_86183 ) ) ( not ( = ?auto_86184 ?auto_86183 ) ) ( not ( = ?auto_86182 ?auto_86183 ) ) ( not ( = ?auto_86188 ?auto_86183 ) ) ( not ( = ?auto_86186 ?auto_86183 ) ) ( not ( = ?auto_86187 ?auto_86183 ) ) ( ON ?auto_86186 ?auto_86188 ) ( CLEAR ?auto_86186 ) ( ON-TABLE ?auto_86183 ) ( HOLDING ?auto_86187 ) ( CLEAR ?auto_86182 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86181 ?auto_86185 ?auto_86184 ?auto_86182 ?auto_86187 )
      ( MAKE-1PILE ?auto_86181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86227 - BLOCK
      ?auto_86228 - BLOCK
      ?auto_86229 - BLOCK
      ?auto_86230 - BLOCK
      ?auto_86231 - BLOCK
      ?auto_86232 - BLOCK
    )
    :vars
    (
      ?auto_86233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86227 ) ( ON ?auto_86228 ?auto_86227 ) ( ON ?auto_86229 ?auto_86228 ) ( ON ?auto_86230 ?auto_86229 ) ( not ( = ?auto_86227 ?auto_86228 ) ) ( not ( = ?auto_86227 ?auto_86229 ) ) ( not ( = ?auto_86227 ?auto_86230 ) ) ( not ( = ?auto_86227 ?auto_86231 ) ) ( not ( = ?auto_86227 ?auto_86232 ) ) ( not ( = ?auto_86228 ?auto_86229 ) ) ( not ( = ?auto_86228 ?auto_86230 ) ) ( not ( = ?auto_86228 ?auto_86231 ) ) ( not ( = ?auto_86228 ?auto_86232 ) ) ( not ( = ?auto_86229 ?auto_86230 ) ) ( not ( = ?auto_86229 ?auto_86231 ) ) ( not ( = ?auto_86229 ?auto_86232 ) ) ( not ( = ?auto_86230 ?auto_86231 ) ) ( not ( = ?auto_86230 ?auto_86232 ) ) ( not ( = ?auto_86231 ?auto_86232 ) ) ( ON ?auto_86232 ?auto_86233 ) ( not ( = ?auto_86227 ?auto_86233 ) ) ( not ( = ?auto_86228 ?auto_86233 ) ) ( not ( = ?auto_86229 ?auto_86233 ) ) ( not ( = ?auto_86230 ?auto_86233 ) ) ( not ( = ?auto_86231 ?auto_86233 ) ) ( not ( = ?auto_86232 ?auto_86233 ) ) ( CLEAR ?auto_86230 ) ( ON ?auto_86231 ?auto_86232 ) ( CLEAR ?auto_86231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86233 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86233 ?auto_86232 )
      ( MAKE-6PILE ?auto_86227 ?auto_86228 ?auto_86229 ?auto_86230 ?auto_86231 ?auto_86232 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86234 - BLOCK
      ?auto_86235 - BLOCK
      ?auto_86236 - BLOCK
      ?auto_86237 - BLOCK
      ?auto_86238 - BLOCK
      ?auto_86239 - BLOCK
    )
    :vars
    (
      ?auto_86240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86234 ) ( ON ?auto_86235 ?auto_86234 ) ( ON ?auto_86236 ?auto_86235 ) ( not ( = ?auto_86234 ?auto_86235 ) ) ( not ( = ?auto_86234 ?auto_86236 ) ) ( not ( = ?auto_86234 ?auto_86237 ) ) ( not ( = ?auto_86234 ?auto_86238 ) ) ( not ( = ?auto_86234 ?auto_86239 ) ) ( not ( = ?auto_86235 ?auto_86236 ) ) ( not ( = ?auto_86235 ?auto_86237 ) ) ( not ( = ?auto_86235 ?auto_86238 ) ) ( not ( = ?auto_86235 ?auto_86239 ) ) ( not ( = ?auto_86236 ?auto_86237 ) ) ( not ( = ?auto_86236 ?auto_86238 ) ) ( not ( = ?auto_86236 ?auto_86239 ) ) ( not ( = ?auto_86237 ?auto_86238 ) ) ( not ( = ?auto_86237 ?auto_86239 ) ) ( not ( = ?auto_86238 ?auto_86239 ) ) ( ON ?auto_86239 ?auto_86240 ) ( not ( = ?auto_86234 ?auto_86240 ) ) ( not ( = ?auto_86235 ?auto_86240 ) ) ( not ( = ?auto_86236 ?auto_86240 ) ) ( not ( = ?auto_86237 ?auto_86240 ) ) ( not ( = ?auto_86238 ?auto_86240 ) ) ( not ( = ?auto_86239 ?auto_86240 ) ) ( ON ?auto_86238 ?auto_86239 ) ( CLEAR ?auto_86238 ) ( ON-TABLE ?auto_86240 ) ( HOLDING ?auto_86237 ) ( CLEAR ?auto_86236 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86234 ?auto_86235 ?auto_86236 ?auto_86237 )
      ( MAKE-6PILE ?auto_86234 ?auto_86235 ?auto_86236 ?auto_86237 ?auto_86238 ?auto_86239 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86241 - BLOCK
      ?auto_86242 - BLOCK
      ?auto_86243 - BLOCK
      ?auto_86244 - BLOCK
      ?auto_86245 - BLOCK
      ?auto_86246 - BLOCK
    )
    :vars
    (
      ?auto_86247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86241 ) ( ON ?auto_86242 ?auto_86241 ) ( ON ?auto_86243 ?auto_86242 ) ( not ( = ?auto_86241 ?auto_86242 ) ) ( not ( = ?auto_86241 ?auto_86243 ) ) ( not ( = ?auto_86241 ?auto_86244 ) ) ( not ( = ?auto_86241 ?auto_86245 ) ) ( not ( = ?auto_86241 ?auto_86246 ) ) ( not ( = ?auto_86242 ?auto_86243 ) ) ( not ( = ?auto_86242 ?auto_86244 ) ) ( not ( = ?auto_86242 ?auto_86245 ) ) ( not ( = ?auto_86242 ?auto_86246 ) ) ( not ( = ?auto_86243 ?auto_86244 ) ) ( not ( = ?auto_86243 ?auto_86245 ) ) ( not ( = ?auto_86243 ?auto_86246 ) ) ( not ( = ?auto_86244 ?auto_86245 ) ) ( not ( = ?auto_86244 ?auto_86246 ) ) ( not ( = ?auto_86245 ?auto_86246 ) ) ( ON ?auto_86246 ?auto_86247 ) ( not ( = ?auto_86241 ?auto_86247 ) ) ( not ( = ?auto_86242 ?auto_86247 ) ) ( not ( = ?auto_86243 ?auto_86247 ) ) ( not ( = ?auto_86244 ?auto_86247 ) ) ( not ( = ?auto_86245 ?auto_86247 ) ) ( not ( = ?auto_86246 ?auto_86247 ) ) ( ON ?auto_86245 ?auto_86246 ) ( ON-TABLE ?auto_86247 ) ( CLEAR ?auto_86243 ) ( ON ?auto_86244 ?auto_86245 ) ( CLEAR ?auto_86244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86247 ?auto_86246 ?auto_86245 )
      ( MAKE-6PILE ?auto_86241 ?auto_86242 ?auto_86243 ?auto_86244 ?auto_86245 ?auto_86246 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86248 - BLOCK
      ?auto_86249 - BLOCK
      ?auto_86250 - BLOCK
      ?auto_86251 - BLOCK
      ?auto_86252 - BLOCK
      ?auto_86253 - BLOCK
    )
    :vars
    (
      ?auto_86254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86248 ) ( ON ?auto_86249 ?auto_86248 ) ( not ( = ?auto_86248 ?auto_86249 ) ) ( not ( = ?auto_86248 ?auto_86250 ) ) ( not ( = ?auto_86248 ?auto_86251 ) ) ( not ( = ?auto_86248 ?auto_86252 ) ) ( not ( = ?auto_86248 ?auto_86253 ) ) ( not ( = ?auto_86249 ?auto_86250 ) ) ( not ( = ?auto_86249 ?auto_86251 ) ) ( not ( = ?auto_86249 ?auto_86252 ) ) ( not ( = ?auto_86249 ?auto_86253 ) ) ( not ( = ?auto_86250 ?auto_86251 ) ) ( not ( = ?auto_86250 ?auto_86252 ) ) ( not ( = ?auto_86250 ?auto_86253 ) ) ( not ( = ?auto_86251 ?auto_86252 ) ) ( not ( = ?auto_86251 ?auto_86253 ) ) ( not ( = ?auto_86252 ?auto_86253 ) ) ( ON ?auto_86253 ?auto_86254 ) ( not ( = ?auto_86248 ?auto_86254 ) ) ( not ( = ?auto_86249 ?auto_86254 ) ) ( not ( = ?auto_86250 ?auto_86254 ) ) ( not ( = ?auto_86251 ?auto_86254 ) ) ( not ( = ?auto_86252 ?auto_86254 ) ) ( not ( = ?auto_86253 ?auto_86254 ) ) ( ON ?auto_86252 ?auto_86253 ) ( ON-TABLE ?auto_86254 ) ( ON ?auto_86251 ?auto_86252 ) ( CLEAR ?auto_86251 ) ( HOLDING ?auto_86250 ) ( CLEAR ?auto_86249 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86248 ?auto_86249 ?auto_86250 )
      ( MAKE-6PILE ?auto_86248 ?auto_86249 ?auto_86250 ?auto_86251 ?auto_86252 ?auto_86253 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86255 - BLOCK
      ?auto_86256 - BLOCK
      ?auto_86257 - BLOCK
      ?auto_86258 - BLOCK
      ?auto_86259 - BLOCK
      ?auto_86260 - BLOCK
    )
    :vars
    (
      ?auto_86261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86255 ) ( ON ?auto_86256 ?auto_86255 ) ( not ( = ?auto_86255 ?auto_86256 ) ) ( not ( = ?auto_86255 ?auto_86257 ) ) ( not ( = ?auto_86255 ?auto_86258 ) ) ( not ( = ?auto_86255 ?auto_86259 ) ) ( not ( = ?auto_86255 ?auto_86260 ) ) ( not ( = ?auto_86256 ?auto_86257 ) ) ( not ( = ?auto_86256 ?auto_86258 ) ) ( not ( = ?auto_86256 ?auto_86259 ) ) ( not ( = ?auto_86256 ?auto_86260 ) ) ( not ( = ?auto_86257 ?auto_86258 ) ) ( not ( = ?auto_86257 ?auto_86259 ) ) ( not ( = ?auto_86257 ?auto_86260 ) ) ( not ( = ?auto_86258 ?auto_86259 ) ) ( not ( = ?auto_86258 ?auto_86260 ) ) ( not ( = ?auto_86259 ?auto_86260 ) ) ( ON ?auto_86260 ?auto_86261 ) ( not ( = ?auto_86255 ?auto_86261 ) ) ( not ( = ?auto_86256 ?auto_86261 ) ) ( not ( = ?auto_86257 ?auto_86261 ) ) ( not ( = ?auto_86258 ?auto_86261 ) ) ( not ( = ?auto_86259 ?auto_86261 ) ) ( not ( = ?auto_86260 ?auto_86261 ) ) ( ON ?auto_86259 ?auto_86260 ) ( ON-TABLE ?auto_86261 ) ( ON ?auto_86258 ?auto_86259 ) ( CLEAR ?auto_86256 ) ( ON ?auto_86257 ?auto_86258 ) ( CLEAR ?auto_86257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86261 ?auto_86260 ?auto_86259 ?auto_86258 )
      ( MAKE-6PILE ?auto_86255 ?auto_86256 ?auto_86257 ?auto_86258 ?auto_86259 ?auto_86260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86262 - BLOCK
      ?auto_86263 - BLOCK
      ?auto_86264 - BLOCK
      ?auto_86265 - BLOCK
      ?auto_86266 - BLOCK
      ?auto_86267 - BLOCK
    )
    :vars
    (
      ?auto_86268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86262 ) ( not ( = ?auto_86262 ?auto_86263 ) ) ( not ( = ?auto_86262 ?auto_86264 ) ) ( not ( = ?auto_86262 ?auto_86265 ) ) ( not ( = ?auto_86262 ?auto_86266 ) ) ( not ( = ?auto_86262 ?auto_86267 ) ) ( not ( = ?auto_86263 ?auto_86264 ) ) ( not ( = ?auto_86263 ?auto_86265 ) ) ( not ( = ?auto_86263 ?auto_86266 ) ) ( not ( = ?auto_86263 ?auto_86267 ) ) ( not ( = ?auto_86264 ?auto_86265 ) ) ( not ( = ?auto_86264 ?auto_86266 ) ) ( not ( = ?auto_86264 ?auto_86267 ) ) ( not ( = ?auto_86265 ?auto_86266 ) ) ( not ( = ?auto_86265 ?auto_86267 ) ) ( not ( = ?auto_86266 ?auto_86267 ) ) ( ON ?auto_86267 ?auto_86268 ) ( not ( = ?auto_86262 ?auto_86268 ) ) ( not ( = ?auto_86263 ?auto_86268 ) ) ( not ( = ?auto_86264 ?auto_86268 ) ) ( not ( = ?auto_86265 ?auto_86268 ) ) ( not ( = ?auto_86266 ?auto_86268 ) ) ( not ( = ?auto_86267 ?auto_86268 ) ) ( ON ?auto_86266 ?auto_86267 ) ( ON-TABLE ?auto_86268 ) ( ON ?auto_86265 ?auto_86266 ) ( ON ?auto_86264 ?auto_86265 ) ( CLEAR ?auto_86264 ) ( HOLDING ?auto_86263 ) ( CLEAR ?auto_86262 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86262 ?auto_86263 )
      ( MAKE-6PILE ?auto_86262 ?auto_86263 ?auto_86264 ?auto_86265 ?auto_86266 ?auto_86267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86269 - BLOCK
      ?auto_86270 - BLOCK
      ?auto_86271 - BLOCK
      ?auto_86272 - BLOCK
      ?auto_86273 - BLOCK
      ?auto_86274 - BLOCK
    )
    :vars
    (
      ?auto_86275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86269 ) ( not ( = ?auto_86269 ?auto_86270 ) ) ( not ( = ?auto_86269 ?auto_86271 ) ) ( not ( = ?auto_86269 ?auto_86272 ) ) ( not ( = ?auto_86269 ?auto_86273 ) ) ( not ( = ?auto_86269 ?auto_86274 ) ) ( not ( = ?auto_86270 ?auto_86271 ) ) ( not ( = ?auto_86270 ?auto_86272 ) ) ( not ( = ?auto_86270 ?auto_86273 ) ) ( not ( = ?auto_86270 ?auto_86274 ) ) ( not ( = ?auto_86271 ?auto_86272 ) ) ( not ( = ?auto_86271 ?auto_86273 ) ) ( not ( = ?auto_86271 ?auto_86274 ) ) ( not ( = ?auto_86272 ?auto_86273 ) ) ( not ( = ?auto_86272 ?auto_86274 ) ) ( not ( = ?auto_86273 ?auto_86274 ) ) ( ON ?auto_86274 ?auto_86275 ) ( not ( = ?auto_86269 ?auto_86275 ) ) ( not ( = ?auto_86270 ?auto_86275 ) ) ( not ( = ?auto_86271 ?auto_86275 ) ) ( not ( = ?auto_86272 ?auto_86275 ) ) ( not ( = ?auto_86273 ?auto_86275 ) ) ( not ( = ?auto_86274 ?auto_86275 ) ) ( ON ?auto_86273 ?auto_86274 ) ( ON-TABLE ?auto_86275 ) ( ON ?auto_86272 ?auto_86273 ) ( ON ?auto_86271 ?auto_86272 ) ( CLEAR ?auto_86269 ) ( ON ?auto_86270 ?auto_86271 ) ( CLEAR ?auto_86270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86275 ?auto_86274 ?auto_86273 ?auto_86272 ?auto_86271 )
      ( MAKE-6PILE ?auto_86269 ?auto_86270 ?auto_86271 ?auto_86272 ?auto_86273 ?auto_86274 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86276 - BLOCK
      ?auto_86277 - BLOCK
      ?auto_86278 - BLOCK
      ?auto_86279 - BLOCK
      ?auto_86280 - BLOCK
      ?auto_86281 - BLOCK
    )
    :vars
    (
      ?auto_86282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86276 ?auto_86277 ) ) ( not ( = ?auto_86276 ?auto_86278 ) ) ( not ( = ?auto_86276 ?auto_86279 ) ) ( not ( = ?auto_86276 ?auto_86280 ) ) ( not ( = ?auto_86276 ?auto_86281 ) ) ( not ( = ?auto_86277 ?auto_86278 ) ) ( not ( = ?auto_86277 ?auto_86279 ) ) ( not ( = ?auto_86277 ?auto_86280 ) ) ( not ( = ?auto_86277 ?auto_86281 ) ) ( not ( = ?auto_86278 ?auto_86279 ) ) ( not ( = ?auto_86278 ?auto_86280 ) ) ( not ( = ?auto_86278 ?auto_86281 ) ) ( not ( = ?auto_86279 ?auto_86280 ) ) ( not ( = ?auto_86279 ?auto_86281 ) ) ( not ( = ?auto_86280 ?auto_86281 ) ) ( ON ?auto_86281 ?auto_86282 ) ( not ( = ?auto_86276 ?auto_86282 ) ) ( not ( = ?auto_86277 ?auto_86282 ) ) ( not ( = ?auto_86278 ?auto_86282 ) ) ( not ( = ?auto_86279 ?auto_86282 ) ) ( not ( = ?auto_86280 ?auto_86282 ) ) ( not ( = ?auto_86281 ?auto_86282 ) ) ( ON ?auto_86280 ?auto_86281 ) ( ON-TABLE ?auto_86282 ) ( ON ?auto_86279 ?auto_86280 ) ( ON ?auto_86278 ?auto_86279 ) ( ON ?auto_86277 ?auto_86278 ) ( CLEAR ?auto_86277 ) ( HOLDING ?auto_86276 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86276 )
      ( MAKE-6PILE ?auto_86276 ?auto_86277 ?auto_86278 ?auto_86279 ?auto_86280 ?auto_86281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86283 - BLOCK
      ?auto_86284 - BLOCK
      ?auto_86285 - BLOCK
      ?auto_86286 - BLOCK
      ?auto_86287 - BLOCK
      ?auto_86288 - BLOCK
    )
    :vars
    (
      ?auto_86289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86283 ?auto_86284 ) ) ( not ( = ?auto_86283 ?auto_86285 ) ) ( not ( = ?auto_86283 ?auto_86286 ) ) ( not ( = ?auto_86283 ?auto_86287 ) ) ( not ( = ?auto_86283 ?auto_86288 ) ) ( not ( = ?auto_86284 ?auto_86285 ) ) ( not ( = ?auto_86284 ?auto_86286 ) ) ( not ( = ?auto_86284 ?auto_86287 ) ) ( not ( = ?auto_86284 ?auto_86288 ) ) ( not ( = ?auto_86285 ?auto_86286 ) ) ( not ( = ?auto_86285 ?auto_86287 ) ) ( not ( = ?auto_86285 ?auto_86288 ) ) ( not ( = ?auto_86286 ?auto_86287 ) ) ( not ( = ?auto_86286 ?auto_86288 ) ) ( not ( = ?auto_86287 ?auto_86288 ) ) ( ON ?auto_86288 ?auto_86289 ) ( not ( = ?auto_86283 ?auto_86289 ) ) ( not ( = ?auto_86284 ?auto_86289 ) ) ( not ( = ?auto_86285 ?auto_86289 ) ) ( not ( = ?auto_86286 ?auto_86289 ) ) ( not ( = ?auto_86287 ?auto_86289 ) ) ( not ( = ?auto_86288 ?auto_86289 ) ) ( ON ?auto_86287 ?auto_86288 ) ( ON-TABLE ?auto_86289 ) ( ON ?auto_86286 ?auto_86287 ) ( ON ?auto_86285 ?auto_86286 ) ( ON ?auto_86284 ?auto_86285 ) ( ON ?auto_86283 ?auto_86284 ) ( CLEAR ?auto_86283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86289 ?auto_86288 ?auto_86287 ?auto_86286 ?auto_86285 ?auto_86284 )
      ( MAKE-6PILE ?auto_86283 ?auto_86284 ?auto_86285 ?auto_86286 ?auto_86287 ?auto_86288 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86296 - BLOCK
      ?auto_86297 - BLOCK
      ?auto_86298 - BLOCK
      ?auto_86299 - BLOCK
      ?auto_86300 - BLOCK
      ?auto_86301 - BLOCK
    )
    :vars
    (
      ?auto_86302 - BLOCK
      ?auto_86303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86296 ?auto_86297 ) ) ( not ( = ?auto_86296 ?auto_86298 ) ) ( not ( = ?auto_86296 ?auto_86299 ) ) ( not ( = ?auto_86296 ?auto_86300 ) ) ( not ( = ?auto_86296 ?auto_86301 ) ) ( not ( = ?auto_86297 ?auto_86298 ) ) ( not ( = ?auto_86297 ?auto_86299 ) ) ( not ( = ?auto_86297 ?auto_86300 ) ) ( not ( = ?auto_86297 ?auto_86301 ) ) ( not ( = ?auto_86298 ?auto_86299 ) ) ( not ( = ?auto_86298 ?auto_86300 ) ) ( not ( = ?auto_86298 ?auto_86301 ) ) ( not ( = ?auto_86299 ?auto_86300 ) ) ( not ( = ?auto_86299 ?auto_86301 ) ) ( not ( = ?auto_86300 ?auto_86301 ) ) ( ON ?auto_86301 ?auto_86302 ) ( not ( = ?auto_86296 ?auto_86302 ) ) ( not ( = ?auto_86297 ?auto_86302 ) ) ( not ( = ?auto_86298 ?auto_86302 ) ) ( not ( = ?auto_86299 ?auto_86302 ) ) ( not ( = ?auto_86300 ?auto_86302 ) ) ( not ( = ?auto_86301 ?auto_86302 ) ) ( ON ?auto_86300 ?auto_86301 ) ( ON-TABLE ?auto_86302 ) ( ON ?auto_86299 ?auto_86300 ) ( ON ?auto_86298 ?auto_86299 ) ( ON ?auto_86297 ?auto_86298 ) ( CLEAR ?auto_86297 ) ( ON ?auto_86296 ?auto_86303 ) ( CLEAR ?auto_86296 ) ( HAND-EMPTY ) ( not ( = ?auto_86296 ?auto_86303 ) ) ( not ( = ?auto_86297 ?auto_86303 ) ) ( not ( = ?auto_86298 ?auto_86303 ) ) ( not ( = ?auto_86299 ?auto_86303 ) ) ( not ( = ?auto_86300 ?auto_86303 ) ) ( not ( = ?auto_86301 ?auto_86303 ) ) ( not ( = ?auto_86302 ?auto_86303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86296 ?auto_86303 )
      ( MAKE-6PILE ?auto_86296 ?auto_86297 ?auto_86298 ?auto_86299 ?auto_86300 ?auto_86301 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86304 - BLOCK
      ?auto_86305 - BLOCK
      ?auto_86306 - BLOCK
      ?auto_86307 - BLOCK
      ?auto_86308 - BLOCK
      ?auto_86309 - BLOCK
    )
    :vars
    (
      ?auto_86311 - BLOCK
      ?auto_86310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86304 ?auto_86305 ) ) ( not ( = ?auto_86304 ?auto_86306 ) ) ( not ( = ?auto_86304 ?auto_86307 ) ) ( not ( = ?auto_86304 ?auto_86308 ) ) ( not ( = ?auto_86304 ?auto_86309 ) ) ( not ( = ?auto_86305 ?auto_86306 ) ) ( not ( = ?auto_86305 ?auto_86307 ) ) ( not ( = ?auto_86305 ?auto_86308 ) ) ( not ( = ?auto_86305 ?auto_86309 ) ) ( not ( = ?auto_86306 ?auto_86307 ) ) ( not ( = ?auto_86306 ?auto_86308 ) ) ( not ( = ?auto_86306 ?auto_86309 ) ) ( not ( = ?auto_86307 ?auto_86308 ) ) ( not ( = ?auto_86307 ?auto_86309 ) ) ( not ( = ?auto_86308 ?auto_86309 ) ) ( ON ?auto_86309 ?auto_86311 ) ( not ( = ?auto_86304 ?auto_86311 ) ) ( not ( = ?auto_86305 ?auto_86311 ) ) ( not ( = ?auto_86306 ?auto_86311 ) ) ( not ( = ?auto_86307 ?auto_86311 ) ) ( not ( = ?auto_86308 ?auto_86311 ) ) ( not ( = ?auto_86309 ?auto_86311 ) ) ( ON ?auto_86308 ?auto_86309 ) ( ON-TABLE ?auto_86311 ) ( ON ?auto_86307 ?auto_86308 ) ( ON ?auto_86306 ?auto_86307 ) ( ON ?auto_86304 ?auto_86310 ) ( CLEAR ?auto_86304 ) ( not ( = ?auto_86304 ?auto_86310 ) ) ( not ( = ?auto_86305 ?auto_86310 ) ) ( not ( = ?auto_86306 ?auto_86310 ) ) ( not ( = ?auto_86307 ?auto_86310 ) ) ( not ( = ?auto_86308 ?auto_86310 ) ) ( not ( = ?auto_86309 ?auto_86310 ) ) ( not ( = ?auto_86311 ?auto_86310 ) ) ( HOLDING ?auto_86305 ) ( CLEAR ?auto_86306 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86311 ?auto_86309 ?auto_86308 ?auto_86307 ?auto_86306 ?auto_86305 )
      ( MAKE-6PILE ?auto_86304 ?auto_86305 ?auto_86306 ?auto_86307 ?auto_86308 ?auto_86309 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86312 - BLOCK
      ?auto_86313 - BLOCK
      ?auto_86314 - BLOCK
      ?auto_86315 - BLOCK
      ?auto_86316 - BLOCK
      ?auto_86317 - BLOCK
    )
    :vars
    (
      ?auto_86319 - BLOCK
      ?auto_86318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86312 ?auto_86313 ) ) ( not ( = ?auto_86312 ?auto_86314 ) ) ( not ( = ?auto_86312 ?auto_86315 ) ) ( not ( = ?auto_86312 ?auto_86316 ) ) ( not ( = ?auto_86312 ?auto_86317 ) ) ( not ( = ?auto_86313 ?auto_86314 ) ) ( not ( = ?auto_86313 ?auto_86315 ) ) ( not ( = ?auto_86313 ?auto_86316 ) ) ( not ( = ?auto_86313 ?auto_86317 ) ) ( not ( = ?auto_86314 ?auto_86315 ) ) ( not ( = ?auto_86314 ?auto_86316 ) ) ( not ( = ?auto_86314 ?auto_86317 ) ) ( not ( = ?auto_86315 ?auto_86316 ) ) ( not ( = ?auto_86315 ?auto_86317 ) ) ( not ( = ?auto_86316 ?auto_86317 ) ) ( ON ?auto_86317 ?auto_86319 ) ( not ( = ?auto_86312 ?auto_86319 ) ) ( not ( = ?auto_86313 ?auto_86319 ) ) ( not ( = ?auto_86314 ?auto_86319 ) ) ( not ( = ?auto_86315 ?auto_86319 ) ) ( not ( = ?auto_86316 ?auto_86319 ) ) ( not ( = ?auto_86317 ?auto_86319 ) ) ( ON ?auto_86316 ?auto_86317 ) ( ON-TABLE ?auto_86319 ) ( ON ?auto_86315 ?auto_86316 ) ( ON ?auto_86314 ?auto_86315 ) ( ON ?auto_86312 ?auto_86318 ) ( not ( = ?auto_86312 ?auto_86318 ) ) ( not ( = ?auto_86313 ?auto_86318 ) ) ( not ( = ?auto_86314 ?auto_86318 ) ) ( not ( = ?auto_86315 ?auto_86318 ) ) ( not ( = ?auto_86316 ?auto_86318 ) ) ( not ( = ?auto_86317 ?auto_86318 ) ) ( not ( = ?auto_86319 ?auto_86318 ) ) ( CLEAR ?auto_86314 ) ( ON ?auto_86313 ?auto_86312 ) ( CLEAR ?auto_86313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86318 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86318 ?auto_86312 )
      ( MAKE-6PILE ?auto_86312 ?auto_86313 ?auto_86314 ?auto_86315 ?auto_86316 ?auto_86317 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86320 - BLOCK
      ?auto_86321 - BLOCK
      ?auto_86322 - BLOCK
      ?auto_86323 - BLOCK
      ?auto_86324 - BLOCK
      ?auto_86325 - BLOCK
    )
    :vars
    (
      ?auto_86326 - BLOCK
      ?auto_86327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86320 ?auto_86321 ) ) ( not ( = ?auto_86320 ?auto_86322 ) ) ( not ( = ?auto_86320 ?auto_86323 ) ) ( not ( = ?auto_86320 ?auto_86324 ) ) ( not ( = ?auto_86320 ?auto_86325 ) ) ( not ( = ?auto_86321 ?auto_86322 ) ) ( not ( = ?auto_86321 ?auto_86323 ) ) ( not ( = ?auto_86321 ?auto_86324 ) ) ( not ( = ?auto_86321 ?auto_86325 ) ) ( not ( = ?auto_86322 ?auto_86323 ) ) ( not ( = ?auto_86322 ?auto_86324 ) ) ( not ( = ?auto_86322 ?auto_86325 ) ) ( not ( = ?auto_86323 ?auto_86324 ) ) ( not ( = ?auto_86323 ?auto_86325 ) ) ( not ( = ?auto_86324 ?auto_86325 ) ) ( ON ?auto_86325 ?auto_86326 ) ( not ( = ?auto_86320 ?auto_86326 ) ) ( not ( = ?auto_86321 ?auto_86326 ) ) ( not ( = ?auto_86322 ?auto_86326 ) ) ( not ( = ?auto_86323 ?auto_86326 ) ) ( not ( = ?auto_86324 ?auto_86326 ) ) ( not ( = ?auto_86325 ?auto_86326 ) ) ( ON ?auto_86324 ?auto_86325 ) ( ON-TABLE ?auto_86326 ) ( ON ?auto_86323 ?auto_86324 ) ( ON ?auto_86320 ?auto_86327 ) ( not ( = ?auto_86320 ?auto_86327 ) ) ( not ( = ?auto_86321 ?auto_86327 ) ) ( not ( = ?auto_86322 ?auto_86327 ) ) ( not ( = ?auto_86323 ?auto_86327 ) ) ( not ( = ?auto_86324 ?auto_86327 ) ) ( not ( = ?auto_86325 ?auto_86327 ) ) ( not ( = ?auto_86326 ?auto_86327 ) ) ( ON ?auto_86321 ?auto_86320 ) ( CLEAR ?auto_86321 ) ( ON-TABLE ?auto_86327 ) ( HOLDING ?auto_86322 ) ( CLEAR ?auto_86323 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86326 ?auto_86325 ?auto_86324 ?auto_86323 ?auto_86322 )
      ( MAKE-6PILE ?auto_86320 ?auto_86321 ?auto_86322 ?auto_86323 ?auto_86324 ?auto_86325 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86328 - BLOCK
      ?auto_86329 - BLOCK
      ?auto_86330 - BLOCK
      ?auto_86331 - BLOCK
      ?auto_86332 - BLOCK
      ?auto_86333 - BLOCK
    )
    :vars
    (
      ?auto_86335 - BLOCK
      ?auto_86334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86328 ?auto_86329 ) ) ( not ( = ?auto_86328 ?auto_86330 ) ) ( not ( = ?auto_86328 ?auto_86331 ) ) ( not ( = ?auto_86328 ?auto_86332 ) ) ( not ( = ?auto_86328 ?auto_86333 ) ) ( not ( = ?auto_86329 ?auto_86330 ) ) ( not ( = ?auto_86329 ?auto_86331 ) ) ( not ( = ?auto_86329 ?auto_86332 ) ) ( not ( = ?auto_86329 ?auto_86333 ) ) ( not ( = ?auto_86330 ?auto_86331 ) ) ( not ( = ?auto_86330 ?auto_86332 ) ) ( not ( = ?auto_86330 ?auto_86333 ) ) ( not ( = ?auto_86331 ?auto_86332 ) ) ( not ( = ?auto_86331 ?auto_86333 ) ) ( not ( = ?auto_86332 ?auto_86333 ) ) ( ON ?auto_86333 ?auto_86335 ) ( not ( = ?auto_86328 ?auto_86335 ) ) ( not ( = ?auto_86329 ?auto_86335 ) ) ( not ( = ?auto_86330 ?auto_86335 ) ) ( not ( = ?auto_86331 ?auto_86335 ) ) ( not ( = ?auto_86332 ?auto_86335 ) ) ( not ( = ?auto_86333 ?auto_86335 ) ) ( ON ?auto_86332 ?auto_86333 ) ( ON-TABLE ?auto_86335 ) ( ON ?auto_86331 ?auto_86332 ) ( ON ?auto_86328 ?auto_86334 ) ( not ( = ?auto_86328 ?auto_86334 ) ) ( not ( = ?auto_86329 ?auto_86334 ) ) ( not ( = ?auto_86330 ?auto_86334 ) ) ( not ( = ?auto_86331 ?auto_86334 ) ) ( not ( = ?auto_86332 ?auto_86334 ) ) ( not ( = ?auto_86333 ?auto_86334 ) ) ( not ( = ?auto_86335 ?auto_86334 ) ) ( ON ?auto_86329 ?auto_86328 ) ( ON-TABLE ?auto_86334 ) ( CLEAR ?auto_86331 ) ( ON ?auto_86330 ?auto_86329 ) ( CLEAR ?auto_86330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86334 ?auto_86328 ?auto_86329 )
      ( MAKE-6PILE ?auto_86328 ?auto_86329 ?auto_86330 ?auto_86331 ?auto_86332 ?auto_86333 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86336 - BLOCK
      ?auto_86337 - BLOCK
      ?auto_86338 - BLOCK
      ?auto_86339 - BLOCK
      ?auto_86340 - BLOCK
      ?auto_86341 - BLOCK
    )
    :vars
    (
      ?auto_86343 - BLOCK
      ?auto_86342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86336 ?auto_86337 ) ) ( not ( = ?auto_86336 ?auto_86338 ) ) ( not ( = ?auto_86336 ?auto_86339 ) ) ( not ( = ?auto_86336 ?auto_86340 ) ) ( not ( = ?auto_86336 ?auto_86341 ) ) ( not ( = ?auto_86337 ?auto_86338 ) ) ( not ( = ?auto_86337 ?auto_86339 ) ) ( not ( = ?auto_86337 ?auto_86340 ) ) ( not ( = ?auto_86337 ?auto_86341 ) ) ( not ( = ?auto_86338 ?auto_86339 ) ) ( not ( = ?auto_86338 ?auto_86340 ) ) ( not ( = ?auto_86338 ?auto_86341 ) ) ( not ( = ?auto_86339 ?auto_86340 ) ) ( not ( = ?auto_86339 ?auto_86341 ) ) ( not ( = ?auto_86340 ?auto_86341 ) ) ( ON ?auto_86341 ?auto_86343 ) ( not ( = ?auto_86336 ?auto_86343 ) ) ( not ( = ?auto_86337 ?auto_86343 ) ) ( not ( = ?auto_86338 ?auto_86343 ) ) ( not ( = ?auto_86339 ?auto_86343 ) ) ( not ( = ?auto_86340 ?auto_86343 ) ) ( not ( = ?auto_86341 ?auto_86343 ) ) ( ON ?auto_86340 ?auto_86341 ) ( ON-TABLE ?auto_86343 ) ( ON ?auto_86336 ?auto_86342 ) ( not ( = ?auto_86336 ?auto_86342 ) ) ( not ( = ?auto_86337 ?auto_86342 ) ) ( not ( = ?auto_86338 ?auto_86342 ) ) ( not ( = ?auto_86339 ?auto_86342 ) ) ( not ( = ?auto_86340 ?auto_86342 ) ) ( not ( = ?auto_86341 ?auto_86342 ) ) ( not ( = ?auto_86343 ?auto_86342 ) ) ( ON ?auto_86337 ?auto_86336 ) ( ON-TABLE ?auto_86342 ) ( ON ?auto_86338 ?auto_86337 ) ( CLEAR ?auto_86338 ) ( HOLDING ?auto_86339 ) ( CLEAR ?auto_86340 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86343 ?auto_86341 ?auto_86340 ?auto_86339 )
      ( MAKE-6PILE ?auto_86336 ?auto_86337 ?auto_86338 ?auto_86339 ?auto_86340 ?auto_86341 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86344 - BLOCK
      ?auto_86345 - BLOCK
      ?auto_86346 - BLOCK
      ?auto_86347 - BLOCK
      ?auto_86348 - BLOCK
      ?auto_86349 - BLOCK
    )
    :vars
    (
      ?auto_86351 - BLOCK
      ?auto_86350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86344 ?auto_86345 ) ) ( not ( = ?auto_86344 ?auto_86346 ) ) ( not ( = ?auto_86344 ?auto_86347 ) ) ( not ( = ?auto_86344 ?auto_86348 ) ) ( not ( = ?auto_86344 ?auto_86349 ) ) ( not ( = ?auto_86345 ?auto_86346 ) ) ( not ( = ?auto_86345 ?auto_86347 ) ) ( not ( = ?auto_86345 ?auto_86348 ) ) ( not ( = ?auto_86345 ?auto_86349 ) ) ( not ( = ?auto_86346 ?auto_86347 ) ) ( not ( = ?auto_86346 ?auto_86348 ) ) ( not ( = ?auto_86346 ?auto_86349 ) ) ( not ( = ?auto_86347 ?auto_86348 ) ) ( not ( = ?auto_86347 ?auto_86349 ) ) ( not ( = ?auto_86348 ?auto_86349 ) ) ( ON ?auto_86349 ?auto_86351 ) ( not ( = ?auto_86344 ?auto_86351 ) ) ( not ( = ?auto_86345 ?auto_86351 ) ) ( not ( = ?auto_86346 ?auto_86351 ) ) ( not ( = ?auto_86347 ?auto_86351 ) ) ( not ( = ?auto_86348 ?auto_86351 ) ) ( not ( = ?auto_86349 ?auto_86351 ) ) ( ON ?auto_86348 ?auto_86349 ) ( ON-TABLE ?auto_86351 ) ( ON ?auto_86344 ?auto_86350 ) ( not ( = ?auto_86344 ?auto_86350 ) ) ( not ( = ?auto_86345 ?auto_86350 ) ) ( not ( = ?auto_86346 ?auto_86350 ) ) ( not ( = ?auto_86347 ?auto_86350 ) ) ( not ( = ?auto_86348 ?auto_86350 ) ) ( not ( = ?auto_86349 ?auto_86350 ) ) ( not ( = ?auto_86351 ?auto_86350 ) ) ( ON ?auto_86345 ?auto_86344 ) ( ON-TABLE ?auto_86350 ) ( ON ?auto_86346 ?auto_86345 ) ( CLEAR ?auto_86348 ) ( ON ?auto_86347 ?auto_86346 ) ( CLEAR ?auto_86347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86350 ?auto_86344 ?auto_86345 ?auto_86346 )
      ( MAKE-6PILE ?auto_86344 ?auto_86345 ?auto_86346 ?auto_86347 ?auto_86348 ?auto_86349 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86352 - BLOCK
      ?auto_86353 - BLOCK
      ?auto_86354 - BLOCK
      ?auto_86355 - BLOCK
      ?auto_86356 - BLOCK
      ?auto_86357 - BLOCK
    )
    :vars
    (
      ?auto_86359 - BLOCK
      ?auto_86358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86352 ?auto_86353 ) ) ( not ( = ?auto_86352 ?auto_86354 ) ) ( not ( = ?auto_86352 ?auto_86355 ) ) ( not ( = ?auto_86352 ?auto_86356 ) ) ( not ( = ?auto_86352 ?auto_86357 ) ) ( not ( = ?auto_86353 ?auto_86354 ) ) ( not ( = ?auto_86353 ?auto_86355 ) ) ( not ( = ?auto_86353 ?auto_86356 ) ) ( not ( = ?auto_86353 ?auto_86357 ) ) ( not ( = ?auto_86354 ?auto_86355 ) ) ( not ( = ?auto_86354 ?auto_86356 ) ) ( not ( = ?auto_86354 ?auto_86357 ) ) ( not ( = ?auto_86355 ?auto_86356 ) ) ( not ( = ?auto_86355 ?auto_86357 ) ) ( not ( = ?auto_86356 ?auto_86357 ) ) ( ON ?auto_86357 ?auto_86359 ) ( not ( = ?auto_86352 ?auto_86359 ) ) ( not ( = ?auto_86353 ?auto_86359 ) ) ( not ( = ?auto_86354 ?auto_86359 ) ) ( not ( = ?auto_86355 ?auto_86359 ) ) ( not ( = ?auto_86356 ?auto_86359 ) ) ( not ( = ?auto_86357 ?auto_86359 ) ) ( ON-TABLE ?auto_86359 ) ( ON ?auto_86352 ?auto_86358 ) ( not ( = ?auto_86352 ?auto_86358 ) ) ( not ( = ?auto_86353 ?auto_86358 ) ) ( not ( = ?auto_86354 ?auto_86358 ) ) ( not ( = ?auto_86355 ?auto_86358 ) ) ( not ( = ?auto_86356 ?auto_86358 ) ) ( not ( = ?auto_86357 ?auto_86358 ) ) ( not ( = ?auto_86359 ?auto_86358 ) ) ( ON ?auto_86353 ?auto_86352 ) ( ON-TABLE ?auto_86358 ) ( ON ?auto_86354 ?auto_86353 ) ( ON ?auto_86355 ?auto_86354 ) ( CLEAR ?auto_86355 ) ( HOLDING ?auto_86356 ) ( CLEAR ?auto_86357 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86359 ?auto_86357 ?auto_86356 )
      ( MAKE-6PILE ?auto_86352 ?auto_86353 ?auto_86354 ?auto_86355 ?auto_86356 ?auto_86357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86360 - BLOCK
      ?auto_86361 - BLOCK
      ?auto_86362 - BLOCK
      ?auto_86363 - BLOCK
      ?auto_86364 - BLOCK
      ?auto_86365 - BLOCK
    )
    :vars
    (
      ?auto_86366 - BLOCK
      ?auto_86367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86360 ?auto_86361 ) ) ( not ( = ?auto_86360 ?auto_86362 ) ) ( not ( = ?auto_86360 ?auto_86363 ) ) ( not ( = ?auto_86360 ?auto_86364 ) ) ( not ( = ?auto_86360 ?auto_86365 ) ) ( not ( = ?auto_86361 ?auto_86362 ) ) ( not ( = ?auto_86361 ?auto_86363 ) ) ( not ( = ?auto_86361 ?auto_86364 ) ) ( not ( = ?auto_86361 ?auto_86365 ) ) ( not ( = ?auto_86362 ?auto_86363 ) ) ( not ( = ?auto_86362 ?auto_86364 ) ) ( not ( = ?auto_86362 ?auto_86365 ) ) ( not ( = ?auto_86363 ?auto_86364 ) ) ( not ( = ?auto_86363 ?auto_86365 ) ) ( not ( = ?auto_86364 ?auto_86365 ) ) ( ON ?auto_86365 ?auto_86366 ) ( not ( = ?auto_86360 ?auto_86366 ) ) ( not ( = ?auto_86361 ?auto_86366 ) ) ( not ( = ?auto_86362 ?auto_86366 ) ) ( not ( = ?auto_86363 ?auto_86366 ) ) ( not ( = ?auto_86364 ?auto_86366 ) ) ( not ( = ?auto_86365 ?auto_86366 ) ) ( ON-TABLE ?auto_86366 ) ( ON ?auto_86360 ?auto_86367 ) ( not ( = ?auto_86360 ?auto_86367 ) ) ( not ( = ?auto_86361 ?auto_86367 ) ) ( not ( = ?auto_86362 ?auto_86367 ) ) ( not ( = ?auto_86363 ?auto_86367 ) ) ( not ( = ?auto_86364 ?auto_86367 ) ) ( not ( = ?auto_86365 ?auto_86367 ) ) ( not ( = ?auto_86366 ?auto_86367 ) ) ( ON ?auto_86361 ?auto_86360 ) ( ON-TABLE ?auto_86367 ) ( ON ?auto_86362 ?auto_86361 ) ( ON ?auto_86363 ?auto_86362 ) ( CLEAR ?auto_86365 ) ( ON ?auto_86364 ?auto_86363 ) ( CLEAR ?auto_86364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86367 ?auto_86360 ?auto_86361 ?auto_86362 ?auto_86363 )
      ( MAKE-6PILE ?auto_86360 ?auto_86361 ?auto_86362 ?auto_86363 ?auto_86364 ?auto_86365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86368 - BLOCK
      ?auto_86369 - BLOCK
      ?auto_86370 - BLOCK
      ?auto_86371 - BLOCK
      ?auto_86372 - BLOCK
      ?auto_86373 - BLOCK
    )
    :vars
    (
      ?auto_86374 - BLOCK
      ?auto_86375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86368 ?auto_86369 ) ) ( not ( = ?auto_86368 ?auto_86370 ) ) ( not ( = ?auto_86368 ?auto_86371 ) ) ( not ( = ?auto_86368 ?auto_86372 ) ) ( not ( = ?auto_86368 ?auto_86373 ) ) ( not ( = ?auto_86369 ?auto_86370 ) ) ( not ( = ?auto_86369 ?auto_86371 ) ) ( not ( = ?auto_86369 ?auto_86372 ) ) ( not ( = ?auto_86369 ?auto_86373 ) ) ( not ( = ?auto_86370 ?auto_86371 ) ) ( not ( = ?auto_86370 ?auto_86372 ) ) ( not ( = ?auto_86370 ?auto_86373 ) ) ( not ( = ?auto_86371 ?auto_86372 ) ) ( not ( = ?auto_86371 ?auto_86373 ) ) ( not ( = ?auto_86372 ?auto_86373 ) ) ( not ( = ?auto_86368 ?auto_86374 ) ) ( not ( = ?auto_86369 ?auto_86374 ) ) ( not ( = ?auto_86370 ?auto_86374 ) ) ( not ( = ?auto_86371 ?auto_86374 ) ) ( not ( = ?auto_86372 ?auto_86374 ) ) ( not ( = ?auto_86373 ?auto_86374 ) ) ( ON-TABLE ?auto_86374 ) ( ON ?auto_86368 ?auto_86375 ) ( not ( = ?auto_86368 ?auto_86375 ) ) ( not ( = ?auto_86369 ?auto_86375 ) ) ( not ( = ?auto_86370 ?auto_86375 ) ) ( not ( = ?auto_86371 ?auto_86375 ) ) ( not ( = ?auto_86372 ?auto_86375 ) ) ( not ( = ?auto_86373 ?auto_86375 ) ) ( not ( = ?auto_86374 ?auto_86375 ) ) ( ON ?auto_86369 ?auto_86368 ) ( ON-TABLE ?auto_86375 ) ( ON ?auto_86370 ?auto_86369 ) ( ON ?auto_86371 ?auto_86370 ) ( ON ?auto_86372 ?auto_86371 ) ( CLEAR ?auto_86372 ) ( HOLDING ?auto_86373 ) ( CLEAR ?auto_86374 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86374 ?auto_86373 )
      ( MAKE-6PILE ?auto_86368 ?auto_86369 ?auto_86370 ?auto_86371 ?auto_86372 ?auto_86373 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86376 - BLOCK
      ?auto_86377 - BLOCK
      ?auto_86378 - BLOCK
      ?auto_86379 - BLOCK
      ?auto_86380 - BLOCK
      ?auto_86381 - BLOCK
    )
    :vars
    (
      ?auto_86383 - BLOCK
      ?auto_86382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86376 ?auto_86377 ) ) ( not ( = ?auto_86376 ?auto_86378 ) ) ( not ( = ?auto_86376 ?auto_86379 ) ) ( not ( = ?auto_86376 ?auto_86380 ) ) ( not ( = ?auto_86376 ?auto_86381 ) ) ( not ( = ?auto_86377 ?auto_86378 ) ) ( not ( = ?auto_86377 ?auto_86379 ) ) ( not ( = ?auto_86377 ?auto_86380 ) ) ( not ( = ?auto_86377 ?auto_86381 ) ) ( not ( = ?auto_86378 ?auto_86379 ) ) ( not ( = ?auto_86378 ?auto_86380 ) ) ( not ( = ?auto_86378 ?auto_86381 ) ) ( not ( = ?auto_86379 ?auto_86380 ) ) ( not ( = ?auto_86379 ?auto_86381 ) ) ( not ( = ?auto_86380 ?auto_86381 ) ) ( not ( = ?auto_86376 ?auto_86383 ) ) ( not ( = ?auto_86377 ?auto_86383 ) ) ( not ( = ?auto_86378 ?auto_86383 ) ) ( not ( = ?auto_86379 ?auto_86383 ) ) ( not ( = ?auto_86380 ?auto_86383 ) ) ( not ( = ?auto_86381 ?auto_86383 ) ) ( ON-TABLE ?auto_86383 ) ( ON ?auto_86376 ?auto_86382 ) ( not ( = ?auto_86376 ?auto_86382 ) ) ( not ( = ?auto_86377 ?auto_86382 ) ) ( not ( = ?auto_86378 ?auto_86382 ) ) ( not ( = ?auto_86379 ?auto_86382 ) ) ( not ( = ?auto_86380 ?auto_86382 ) ) ( not ( = ?auto_86381 ?auto_86382 ) ) ( not ( = ?auto_86383 ?auto_86382 ) ) ( ON ?auto_86377 ?auto_86376 ) ( ON-TABLE ?auto_86382 ) ( ON ?auto_86378 ?auto_86377 ) ( ON ?auto_86379 ?auto_86378 ) ( ON ?auto_86380 ?auto_86379 ) ( CLEAR ?auto_86383 ) ( ON ?auto_86381 ?auto_86380 ) ( CLEAR ?auto_86381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86382 ?auto_86376 ?auto_86377 ?auto_86378 ?auto_86379 ?auto_86380 )
      ( MAKE-6PILE ?auto_86376 ?auto_86377 ?auto_86378 ?auto_86379 ?auto_86380 ?auto_86381 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86384 - BLOCK
      ?auto_86385 - BLOCK
      ?auto_86386 - BLOCK
      ?auto_86387 - BLOCK
      ?auto_86388 - BLOCK
      ?auto_86389 - BLOCK
    )
    :vars
    (
      ?auto_86390 - BLOCK
      ?auto_86391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86384 ?auto_86385 ) ) ( not ( = ?auto_86384 ?auto_86386 ) ) ( not ( = ?auto_86384 ?auto_86387 ) ) ( not ( = ?auto_86384 ?auto_86388 ) ) ( not ( = ?auto_86384 ?auto_86389 ) ) ( not ( = ?auto_86385 ?auto_86386 ) ) ( not ( = ?auto_86385 ?auto_86387 ) ) ( not ( = ?auto_86385 ?auto_86388 ) ) ( not ( = ?auto_86385 ?auto_86389 ) ) ( not ( = ?auto_86386 ?auto_86387 ) ) ( not ( = ?auto_86386 ?auto_86388 ) ) ( not ( = ?auto_86386 ?auto_86389 ) ) ( not ( = ?auto_86387 ?auto_86388 ) ) ( not ( = ?auto_86387 ?auto_86389 ) ) ( not ( = ?auto_86388 ?auto_86389 ) ) ( not ( = ?auto_86384 ?auto_86390 ) ) ( not ( = ?auto_86385 ?auto_86390 ) ) ( not ( = ?auto_86386 ?auto_86390 ) ) ( not ( = ?auto_86387 ?auto_86390 ) ) ( not ( = ?auto_86388 ?auto_86390 ) ) ( not ( = ?auto_86389 ?auto_86390 ) ) ( ON ?auto_86384 ?auto_86391 ) ( not ( = ?auto_86384 ?auto_86391 ) ) ( not ( = ?auto_86385 ?auto_86391 ) ) ( not ( = ?auto_86386 ?auto_86391 ) ) ( not ( = ?auto_86387 ?auto_86391 ) ) ( not ( = ?auto_86388 ?auto_86391 ) ) ( not ( = ?auto_86389 ?auto_86391 ) ) ( not ( = ?auto_86390 ?auto_86391 ) ) ( ON ?auto_86385 ?auto_86384 ) ( ON-TABLE ?auto_86391 ) ( ON ?auto_86386 ?auto_86385 ) ( ON ?auto_86387 ?auto_86386 ) ( ON ?auto_86388 ?auto_86387 ) ( ON ?auto_86389 ?auto_86388 ) ( CLEAR ?auto_86389 ) ( HOLDING ?auto_86390 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86390 )
      ( MAKE-6PILE ?auto_86384 ?auto_86385 ?auto_86386 ?auto_86387 ?auto_86388 ?auto_86389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_86392 - BLOCK
      ?auto_86393 - BLOCK
      ?auto_86394 - BLOCK
      ?auto_86395 - BLOCK
      ?auto_86396 - BLOCK
      ?auto_86397 - BLOCK
    )
    :vars
    (
      ?auto_86399 - BLOCK
      ?auto_86398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86392 ?auto_86393 ) ) ( not ( = ?auto_86392 ?auto_86394 ) ) ( not ( = ?auto_86392 ?auto_86395 ) ) ( not ( = ?auto_86392 ?auto_86396 ) ) ( not ( = ?auto_86392 ?auto_86397 ) ) ( not ( = ?auto_86393 ?auto_86394 ) ) ( not ( = ?auto_86393 ?auto_86395 ) ) ( not ( = ?auto_86393 ?auto_86396 ) ) ( not ( = ?auto_86393 ?auto_86397 ) ) ( not ( = ?auto_86394 ?auto_86395 ) ) ( not ( = ?auto_86394 ?auto_86396 ) ) ( not ( = ?auto_86394 ?auto_86397 ) ) ( not ( = ?auto_86395 ?auto_86396 ) ) ( not ( = ?auto_86395 ?auto_86397 ) ) ( not ( = ?auto_86396 ?auto_86397 ) ) ( not ( = ?auto_86392 ?auto_86399 ) ) ( not ( = ?auto_86393 ?auto_86399 ) ) ( not ( = ?auto_86394 ?auto_86399 ) ) ( not ( = ?auto_86395 ?auto_86399 ) ) ( not ( = ?auto_86396 ?auto_86399 ) ) ( not ( = ?auto_86397 ?auto_86399 ) ) ( ON ?auto_86392 ?auto_86398 ) ( not ( = ?auto_86392 ?auto_86398 ) ) ( not ( = ?auto_86393 ?auto_86398 ) ) ( not ( = ?auto_86394 ?auto_86398 ) ) ( not ( = ?auto_86395 ?auto_86398 ) ) ( not ( = ?auto_86396 ?auto_86398 ) ) ( not ( = ?auto_86397 ?auto_86398 ) ) ( not ( = ?auto_86399 ?auto_86398 ) ) ( ON ?auto_86393 ?auto_86392 ) ( ON-TABLE ?auto_86398 ) ( ON ?auto_86394 ?auto_86393 ) ( ON ?auto_86395 ?auto_86394 ) ( ON ?auto_86396 ?auto_86395 ) ( ON ?auto_86397 ?auto_86396 ) ( ON ?auto_86399 ?auto_86397 ) ( CLEAR ?auto_86399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86398 ?auto_86392 ?auto_86393 ?auto_86394 ?auto_86395 ?auto_86396 ?auto_86397 )
      ( MAKE-6PILE ?auto_86392 ?auto_86393 ?auto_86394 ?auto_86395 ?auto_86396 ?auto_86397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86414 - BLOCK
      ?auto_86415 - BLOCK
      ?auto_86416 - BLOCK
      ?auto_86417 - BLOCK
      ?auto_86418 - BLOCK
      ?auto_86419 - BLOCK
      ?auto_86420 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_86419 ) ( ON-TABLE ?auto_86414 ) ( ON ?auto_86415 ?auto_86414 ) ( ON ?auto_86416 ?auto_86415 ) ( ON ?auto_86417 ?auto_86416 ) ( ON ?auto_86418 ?auto_86417 ) ( ON ?auto_86419 ?auto_86418 ) ( not ( = ?auto_86414 ?auto_86415 ) ) ( not ( = ?auto_86414 ?auto_86416 ) ) ( not ( = ?auto_86414 ?auto_86417 ) ) ( not ( = ?auto_86414 ?auto_86418 ) ) ( not ( = ?auto_86414 ?auto_86419 ) ) ( not ( = ?auto_86414 ?auto_86420 ) ) ( not ( = ?auto_86415 ?auto_86416 ) ) ( not ( = ?auto_86415 ?auto_86417 ) ) ( not ( = ?auto_86415 ?auto_86418 ) ) ( not ( = ?auto_86415 ?auto_86419 ) ) ( not ( = ?auto_86415 ?auto_86420 ) ) ( not ( = ?auto_86416 ?auto_86417 ) ) ( not ( = ?auto_86416 ?auto_86418 ) ) ( not ( = ?auto_86416 ?auto_86419 ) ) ( not ( = ?auto_86416 ?auto_86420 ) ) ( not ( = ?auto_86417 ?auto_86418 ) ) ( not ( = ?auto_86417 ?auto_86419 ) ) ( not ( = ?auto_86417 ?auto_86420 ) ) ( not ( = ?auto_86418 ?auto_86419 ) ) ( not ( = ?auto_86418 ?auto_86420 ) ) ( not ( = ?auto_86419 ?auto_86420 ) ) ( ON-TABLE ?auto_86420 ) ( CLEAR ?auto_86420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_86420 )
      ( MAKE-7PILE ?auto_86414 ?auto_86415 ?auto_86416 ?auto_86417 ?auto_86418 ?auto_86419 ?auto_86420 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86421 - BLOCK
      ?auto_86422 - BLOCK
      ?auto_86423 - BLOCK
      ?auto_86424 - BLOCK
      ?auto_86425 - BLOCK
      ?auto_86426 - BLOCK
      ?auto_86427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86421 ) ( ON ?auto_86422 ?auto_86421 ) ( ON ?auto_86423 ?auto_86422 ) ( ON ?auto_86424 ?auto_86423 ) ( ON ?auto_86425 ?auto_86424 ) ( not ( = ?auto_86421 ?auto_86422 ) ) ( not ( = ?auto_86421 ?auto_86423 ) ) ( not ( = ?auto_86421 ?auto_86424 ) ) ( not ( = ?auto_86421 ?auto_86425 ) ) ( not ( = ?auto_86421 ?auto_86426 ) ) ( not ( = ?auto_86421 ?auto_86427 ) ) ( not ( = ?auto_86422 ?auto_86423 ) ) ( not ( = ?auto_86422 ?auto_86424 ) ) ( not ( = ?auto_86422 ?auto_86425 ) ) ( not ( = ?auto_86422 ?auto_86426 ) ) ( not ( = ?auto_86422 ?auto_86427 ) ) ( not ( = ?auto_86423 ?auto_86424 ) ) ( not ( = ?auto_86423 ?auto_86425 ) ) ( not ( = ?auto_86423 ?auto_86426 ) ) ( not ( = ?auto_86423 ?auto_86427 ) ) ( not ( = ?auto_86424 ?auto_86425 ) ) ( not ( = ?auto_86424 ?auto_86426 ) ) ( not ( = ?auto_86424 ?auto_86427 ) ) ( not ( = ?auto_86425 ?auto_86426 ) ) ( not ( = ?auto_86425 ?auto_86427 ) ) ( not ( = ?auto_86426 ?auto_86427 ) ) ( ON-TABLE ?auto_86427 ) ( CLEAR ?auto_86427 ) ( HOLDING ?auto_86426 ) ( CLEAR ?auto_86425 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86421 ?auto_86422 ?auto_86423 ?auto_86424 ?auto_86425 ?auto_86426 )
      ( MAKE-7PILE ?auto_86421 ?auto_86422 ?auto_86423 ?auto_86424 ?auto_86425 ?auto_86426 ?auto_86427 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86428 - BLOCK
      ?auto_86429 - BLOCK
      ?auto_86430 - BLOCK
      ?auto_86431 - BLOCK
      ?auto_86432 - BLOCK
      ?auto_86433 - BLOCK
      ?auto_86434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86428 ) ( ON ?auto_86429 ?auto_86428 ) ( ON ?auto_86430 ?auto_86429 ) ( ON ?auto_86431 ?auto_86430 ) ( ON ?auto_86432 ?auto_86431 ) ( not ( = ?auto_86428 ?auto_86429 ) ) ( not ( = ?auto_86428 ?auto_86430 ) ) ( not ( = ?auto_86428 ?auto_86431 ) ) ( not ( = ?auto_86428 ?auto_86432 ) ) ( not ( = ?auto_86428 ?auto_86433 ) ) ( not ( = ?auto_86428 ?auto_86434 ) ) ( not ( = ?auto_86429 ?auto_86430 ) ) ( not ( = ?auto_86429 ?auto_86431 ) ) ( not ( = ?auto_86429 ?auto_86432 ) ) ( not ( = ?auto_86429 ?auto_86433 ) ) ( not ( = ?auto_86429 ?auto_86434 ) ) ( not ( = ?auto_86430 ?auto_86431 ) ) ( not ( = ?auto_86430 ?auto_86432 ) ) ( not ( = ?auto_86430 ?auto_86433 ) ) ( not ( = ?auto_86430 ?auto_86434 ) ) ( not ( = ?auto_86431 ?auto_86432 ) ) ( not ( = ?auto_86431 ?auto_86433 ) ) ( not ( = ?auto_86431 ?auto_86434 ) ) ( not ( = ?auto_86432 ?auto_86433 ) ) ( not ( = ?auto_86432 ?auto_86434 ) ) ( not ( = ?auto_86433 ?auto_86434 ) ) ( ON-TABLE ?auto_86434 ) ( CLEAR ?auto_86432 ) ( ON ?auto_86433 ?auto_86434 ) ( CLEAR ?auto_86433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86434 )
      ( MAKE-7PILE ?auto_86428 ?auto_86429 ?auto_86430 ?auto_86431 ?auto_86432 ?auto_86433 ?auto_86434 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86435 - BLOCK
      ?auto_86436 - BLOCK
      ?auto_86437 - BLOCK
      ?auto_86438 - BLOCK
      ?auto_86439 - BLOCK
      ?auto_86440 - BLOCK
      ?auto_86441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86435 ) ( ON ?auto_86436 ?auto_86435 ) ( ON ?auto_86437 ?auto_86436 ) ( ON ?auto_86438 ?auto_86437 ) ( not ( = ?auto_86435 ?auto_86436 ) ) ( not ( = ?auto_86435 ?auto_86437 ) ) ( not ( = ?auto_86435 ?auto_86438 ) ) ( not ( = ?auto_86435 ?auto_86439 ) ) ( not ( = ?auto_86435 ?auto_86440 ) ) ( not ( = ?auto_86435 ?auto_86441 ) ) ( not ( = ?auto_86436 ?auto_86437 ) ) ( not ( = ?auto_86436 ?auto_86438 ) ) ( not ( = ?auto_86436 ?auto_86439 ) ) ( not ( = ?auto_86436 ?auto_86440 ) ) ( not ( = ?auto_86436 ?auto_86441 ) ) ( not ( = ?auto_86437 ?auto_86438 ) ) ( not ( = ?auto_86437 ?auto_86439 ) ) ( not ( = ?auto_86437 ?auto_86440 ) ) ( not ( = ?auto_86437 ?auto_86441 ) ) ( not ( = ?auto_86438 ?auto_86439 ) ) ( not ( = ?auto_86438 ?auto_86440 ) ) ( not ( = ?auto_86438 ?auto_86441 ) ) ( not ( = ?auto_86439 ?auto_86440 ) ) ( not ( = ?auto_86439 ?auto_86441 ) ) ( not ( = ?auto_86440 ?auto_86441 ) ) ( ON-TABLE ?auto_86441 ) ( ON ?auto_86440 ?auto_86441 ) ( CLEAR ?auto_86440 ) ( HOLDING ?auto_86439 ) ( CLEAR ?auto_86438 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86435 ?auto_86436 ?auto_86437 ?auto_86438 ?auto_86439 )
      ( MAKE-7PILE ?auto_86435 ?auto_86436 ?auto_86437 ?auto_86438 ?auto_86439 ?auto_86440 ?auto_86441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86442 - BLOCK
      ?auto_86443 - BLOCK
      ?auto_86444 - BLOCK
      ?auto_86445 - BLOCK
      ?auto_86446 - BLOCK
      ?auto_86447 - BLOCK
      ?auto_86448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86442 ) ( ON ?auto_86443 ?auto_86442 ) ( ON ?auto_86444 ?auto_86443 ) ( ON ?auto_86445 ?auto_86444 ) ( not ( = ?auto_86442 ?auto_86443 ) ) ( not ( = ?auto_86442 ?auto_86444 ) ) ( not ( = ?auto_86442 ?auto_86445 ) ) ( not ( = ?auto_86442 ?auto_86446 ) ) ( not ( = ?auto_86442 ?auto_86447 ) ) ( not ( = ?auto_86442 ?auto_86448 ) ) ( not ( = ?auto_86443 ?auto_86444 ) ) ( not ( = ?auto_86443 ?auto_86445 ) ) ( not ( = ?auto_86443 ?auto_86446 ) ) ( not ( = ?auto_86443 ?auto_86447 ) ) ( not ( = ?auto_86443 ?auto_86448 ) ) ( not ( = ?auto_86444 ?auto_86445 ) ) ( not ( = ?auto_86444 ?auto_86446 ) ) ( not ( = ?auto_86444 ?auto_86447 ) ) ( not ( = ?auto_86444 ?auto_86448 ) ) ( not ( = ?auto_86445 ?auto_86446 ) ) ( not ( = ?auto_86445 ?auto_86447 ) ) ( not ( = ?auto_86445 ?auto_86448 ) ) ( not ( = ?auto_86446 ?auto_86447 ) ) ( not ( = ?auto_86446 ?auto_86448 ) ) ( not ( = ?auto_86447 ?auto_86448 ) ) ( ON-TABLE ?auto_86448 ) ( ON ?auto_86447 ?auto_86448 ) ( CLEAR ?auto_86445 ) ( ON ?auto_86446 ?auto_86447 ) ( CLEAR ?auto_86446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86448 ?auto_86447 )
      ( MAKE-7PILE ?auto_86442 ?auto_86443 ?auto_86444 ?auto_86445 ?auto_86446 ?auto_86447 ?auto_86448 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86449 - BLOCK
      ?auto_86450 - BLOCK
      ?auto_86451 - BLOCK
      ?auto_86452 - BLOCK
      ?auto_86453 - BLOCK
      ?auto_86454 - BLOCK
      ?auto_86455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86449 ) ( ON ?auto_86450 ?auto_86449 ) ( ON ?auto_86451 ?auto_86450 ) ( not ( = ?auto_86449 ?auto_86450 ) ) ( not ( = ?auto_86449 ?auto_86451 ) ) ( not ( = ?auto_86449 ?auto_86452 ) ) ( not ( = ?auto_86449 ?auto_86453 ) ) ( not ( = ?auto_86449 ?auto_86454 ) ) ( not ( = ?auto_86449 ?auto_86455 ) ) ( not ( = ?auto_86450 ?auto_86451 ) ) ( not ( = ?auto_86450 ?auto_86452 ) ) ( not ( = ?auto_86450 ?auto_86453 ) ) ( not ( = ?auto_86450 ?auto_86454 ) ) ( not ( = ?auto_86450 ?auto_86455 ) ) ( not ( = ?auto_86451 ?auto_86452 ) ) ( not ( = ?auto_86451 ?auto_86453 ) ) ( not ( = ?auto_86451 ?auto_86454 ) ) ( not ( = ?auto_86451 ?auto_86455 ) ) ( not ( = ?auto_86452 ?auto_86453 ) ) ( not ( = ?auto_86452 ?auto_86454 ) ) ( not ( = ?auto_86452 ?auto_86455 ) ) ( not ( = ?auto_86453 ?auto_86454 ) ) ( not ( = ?auto_86453 ?auto_86455 ) ) ( not ( = ?auto_86454 ?auto_86455 ) ) ( ON-TABLE ?auto_86455 ) ( ON ?auto_86454 ?auto_86455 ) ( ON ?auto_86453 ?auto_86454 ) ( CLEAR ?auto_86453 ) ( HOLDING ?auto_86452 ) ( CLEAR ?auto_86451 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86449 ?auto_86450 ?auto_86451 ?auto_86452 )
      ( MAKE-7PILE ?auto_86449 ?auto_86450 ?auto_86451 ?auto_86452 ?auto_86453 ?auto_86454 ?auto_86455 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86456 - BLOCK
      ?auto_86457 - BLOCK
      ?auto_86458 - BLOCK
      ?auto_86459 - BLOCK
      ?auto_86460 - BLOCK
      ?auto_86461 - BLOCK
      ?auto_86462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86456 ) ( ON ?auto_86457 ?auto_86456 ) ( ON ?auto_86458 ?auto_86457 ) ( not ( = ?auto_86456 ?auto_86457 ) ) ( not ( = ?auto_86456 ?auto_86458 ) ) ( not ( = ?auto_86456 ?auto_86459 ) ) ( not ( = ?auto_86456 ?auto_86460 ) ) ( not ( = ?auto_86456 ?auto_86461 ) ) ( not ( = ?auto_86456 ?auto_86462 ) ) ( not ( = ?auto_86457 ?auto_86458 ) ) ( not ( = ?auto_86457 ?auto_86459 ) ) ( not ( = ?auto_86457 ?auto_86460 ) ) ( not ( = ?auto_86457 ?auto_86461 ) ) ( not ( = ?auto_86457 ?auto_86462 ) ) ( not ( = ?auto_86458 ?auto_86459 ) ) ( not ( = ?auto_86458 ?auto_86460 ) ) ( not ( = ?auto_86458 ?auto_86461 ) ) ( not ( = ?auto_86458 ?auto_86462 ) ) ( not ( = ?auto_86459 ?auto_86460 ) ) ( not ( = ?auto_86459 ?auto_86461 ) ) ( not ( = ?auto_86459 ?auto_86462 ) ) ( not ( = ?auto_86460 ?auto_86461 ) ) ( not ( = ?auto_86460 ?auto_86462 ) ) ( not ( = ?auto_86461 ?auto_86462 ) ) ( ON-TABLE ?auto_86462 ) ( ON ?auto_86461 ?auto_86462 ) ( ON ?auto_86460 ?auto_86461 ) ( CLEAR ?auto_86458 ) ( ON ?auto_86459 ?auto_86460 ) ( CLEAR ?auto_86459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86462 ?auto_86461 ?auto_86460 )
      ( MAKE-7PILE ?auto_86456 ?auto_86457 ?auto_86458 ?auto_86459 ?auto_86460 ?auto_86461 ?auto_86462 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86463 - BLOCK
      ?auto_86464 - BLOCK
      ?auto_86465 - BLOCK
      ?auto_86466 - BLOCK
      ?auto_86467 - BLOCK
      ?auto_86468 - BLOCK
      ?auto_86469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86463 ) ( ON ?auto_86464 ?auto_86463 ) ( not ( = ?auto_86463 ?auto_86464 ) ) ( not ( = ?auto_86463 ?auto_86465 ) ) ( not ( = ?auto_86463 ?auto_86466 ) ) ( not ( = ?auto_86463 ?auto_86467 ) ) ( not ( = ?auto_86463 ?auto_86468 ) ) ( not ( = ?auto_86463 ?auto_86469 ) ) ( not ( = ?auto_86464 ?auto_86465 ) ) ( not ( = ?auto_86464 ?auto_86466 ) ) ( not ( = ?auto_86464 ?auto_86467 ) ) ( not ( = ?auto_86464 ?auto_86468 ) ) ( not ( = ?auto_86464 ?auto_86469 ) ) ( not ( = ?auto_86465 ?auto_86466 ) ) ( not ( = ?auto_86465 ?auto_86467 ) ) ( not ( = ?auto_86465 ?auto_86468 ) ) ( not ( = ?auto_86465 ?auto_86469 ) ) ( not ( = ?auto_86466 ?auto_86467 ) ) ( not ( = ?auto_86466 ?auto_86468 ) ) ( not ( = ?auto_86466 ?auto_86469 ) ) ( not ( = ?auto_86467 ?auto_86468 ) ) ( not ( = ?auto_86467 ?auto_86469 ) ) ( not ( = ?auto_86468 ?auto_86469 ) ) ( ON-TABLE ?auto_86469 ) ( ON ?auto_86468 ?auto_86469 ) ( ON ?auto_86467 ?auto_86468 ) ( ON ?auto_86466 ?auto_86467 ) ( CLEAR ?auto_86466 ) ( HOLDING ?auto_86465 ) ( CLEAR ?auto_86464 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86463 ?auto_86464 ?auto_86465 )
      ( MAKE-7PILE ?auto_86463 ?auto_86464 ?auto_86465 ?auto_86466 ?auto_86467 ?auto_86468 ?auto_86469 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86470 - BLOCK
      ?auto_86471 - BLOCK
      ?auto_86472 - BLOCK
      ?auto_86473 - BLOCK
      ?auto_86474 - BLOCK
      ?auto_86475 - BLOCK
      ?auto_86476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86470 ) ( ON ?auto_86471 ?auto_86470 ) ( not ( = ?auto_86470 ?auto_86471 ) ) ( not ( = ?auto_86470 ?auto_86472 ) ) ( not ( = ?auto_86470 ?auto_86473 ) ) ( not ( = ?auto_86470 ?auto_86474 ) ) ( not ( = ?auto_86470 ?auto_86475 ) ) ( not ( = ?auto_86470 ?auto_86476 ) ) ( not ( = ?auto_86471 ?auto_86472 ) ) ( not ( = ?auto_86471 ?auto_86473 ) ) ( not ( = ?auto_86471 ?auto_86474 ) ) ( not ( = ?auto_86471 ?auto_86475 ) ) ( not ( = ?auto_86471 ?auto_86476 ) ) ( not ( = ?auto_86472 ?auto_86473 ) ) ( not ( = ?auto_86472 ?auto_86474 ) ) ( not ( = ?auto_86472 ?auto_86475 ) ) ( not ( = ?auto_86472 ?auto_86476 ) ) ( not ( = ?auto_86473 ?auto_86474 ) ) ( not ( = ?auto_86473 ?auto_86475 ) ) ( not ( = ?auto_86473 ?auto_86476 ) ) ( not ( = ?auto_86474 ?auto_86475 ) ) ( not ( = ?auto_86474 ?auto_86476 ) ) ( not ( = ?auto_86475 ?auto_86476 ) ) ( ON-TABLE ?auto_86476 ) ( ON ?auto_86475 ?auto_86476 ) ( ON ?auto_86474 ?auto_86475 ) ( ON ?auto_86473 ?auto_86474 ) ( CLEAR ?auto_86471 ) ( ON ?auto_86472 ?auto_86473 ) ( CLEAR ?auto_86472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86476 ?auto_86475 ?auto_86474 ?auto_86473 )
      ( MAKE-7PILE ?auto_86470 ?auto_86471 ?auto_86472 ?auto_86473 ?auto_86474 ?auto_86475 ?auto_86476 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86477 - BLOCK
      ?auto_86478 - BLOCK
      ?auto_86479 - BLOCK
      ?auto_86480 - BLOCK
      ?auto_86481 - BLOCK
      ?auto_86482 - BLOCK
      ?auto_86483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86477 ) ( not ( = ?auto_86477 ?auto_86478 ) ) ( not ( = ?auto_86477 ?auto_86479 ) ) ( not ( = ?auto_86477 ?auto_86480 ) ) ( not ( = ?auto_86477 ?auto_86481 ) ) ( not ( = ?auto_86477 ?auto_86482 ) ) ( not ( = ?auto_86477 ?auto_86483 ) ) ( not ( = ?auto_86478 ?auto_86479 ) ) ( not ( = ?auto_86478 ?auto_86480 ) ) ( not ( = ?auto_86478 ?auto_86481 ) ) ( not ( = ?auto_86478 ?auto_86482 ) ) ( not ( = ?auto_86478 ?auto_86483 ) ) ( not ( = ?auto_86479 ?auto_86480 ) ) ( not ( = ?auto_86479 ?auto_86481 ) ) ( not ( = ?auto_86479 ?auto_86482 ) ) ( not ( = ?auto_86479 ?auto_86483 ) ) ( not ( = ?auto_86480 ?auto_86481 ) ) ( not ( = ?auto_86480 ?auto_86482 ) ) ( not ( = ?auto_86480 ?auto_86483 ) ) ( not ( = ?auto_86481 ?auto_86482 ) ) ( not ( = ?auto_86481 ?auto_86483 ) ) ( not ( = ?auto_86482 ?auto_86483 ) ) ( ON-TABLE ?auto_86483 ) ( ON ?auto_86482 ?auto_86483 ) ( ON ?auto_86481 ?auto_86482 ) ( ON ?auto_86480 ?auto_86481 ) ( ON ?auto_86479 ?auto_86480 ) ( CLEAR ?auto_86479 ) ( HOLDING ?auto_86478 ) ( CLEAR ?auto_86477 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86477 ?auto_86478 )
      ( MAKE-7PILE ?auto_86477 ?auto_86478 ?auto_86479 ?auto_86480 ?auto_86481 ?auto_86482 ?auto_86483 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86484 - BLOCK
      ?auto_86485 - BLOCK
      ?auto_86486 - BLOCK
      ?auto_86487 - BLOCK
      ?auto_86488 - BLOCK
      ?auto_86489 - BLOCK
      ?auto_86490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_86484 ) ( not ( = ?auto_86484 ?auto_86485 ) ) ( not ( = ?auto_86484 ?auto_86486 ) ) ( not ( = ?auto_86484 ?auto_86487 ) ) ( not ( = ?auto_86484 ?auto_86488 ) ) ( not ( = ?auto_86484 ?auto_86489 ) ) ( not ( = ?auto_86484 ?auto_86490 ) ) ( not ( = ?auto_86485 ?auto_86486 ) ) ( not ( = ?auto_86485 ?auto_86487 ) ) ( not ( = ?auto_86485 ?auto_86488 ) ) ( not ( = ?auto_86485 ?auto_86489 ) ) ( not ( = ?auto_86485 ?auto_86490 ) ) ( not ( = ?auto_86486 ?auto_86487 ) ) ( not ( = ?auto_86486 ?auto_86488 ) ) ( not ( = ?auto_86486 ?auto_86489 ) ) ( not ( = ?auto_86486 ?auto_86490 ) ) ( not ( = ?auto_86487 ?auto_86488 ) ) ( not ( = ?auto_86487 ?auto_86489 ) ) ( not ( = ?auto_86487 ?auto_86490 ) ) ( not ( = ?auto_86488 ?auto_86489 ) ) ( not ( = ?auto_86488 ?auto_86490 ) ) ( not ( = ?auto_86489 ?auto_86490 ) ) ( ON-TABLE ?auto_86490 ) ( ON ?auto_86489 ?auto_86490 ) ( ON ?auto_86488 ?auto_86489 ) ( ON ?auto_86487 ?auto_86488 ) ( ON ?auto_86486 ?auto_86487 ) ( CLEAR ?auto_86484 ) ( ON ?auto_86485 ?auto_86486 ) ( CLEAR ?auto_86485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86490 ?auto_86489 ?auto_86488 ?auto_86487 ?auto_86486 )
      ( MAKE-7PILE ?auto_86484 ?auto_86485 ?auto_86486 ?auto_86487 ?auto_86488 ?auto_86489 ?auto_86490 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86491 - BLOCK
      ?auto_86492 - BLOCK
      ?auto_86493 - BLOCK
      ?auto_86494 - BLOCK
      ?auto_86495 - BLOCK
      ?auto_86496 - BLOCK
      ?auto_86497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86491 ?auto_86492 ) ) ( not ( = ?auto_86491 ?auto_86493 ) ) ( not ( = ?auto_86491 ?auto_86494 ) ) ( not ( = ?auto_86491 ?auto_86495 ) ) ( not ( = ?auto_86491 ?auto_86496 ) ) ( not ( = ?auto_86491 ?auto_86497 ) ) ( not ( = ?auto_86492 ?auto_86493 ) ) ( not ( = ?auto_86492 ?auto_86494 ) ) ( not ( = ?auto_86492 ?auto_86495 ) ) ( not ( = ?auto_86492 ?auto_86496 ) ) ( not ( = ?auto_86492 ?auto_86497 ) ) ( not ( = ?auto_86493 ?auto_86494 ) ) ( not ( = ?auto_86493 ?auto_86495 ) ) ( not ( = ?auto_86493 ?auto_86496 ) ) ( not ( = ?auto_86493 ?auto_86497 ) ) ( not ( = ?auto_86494 ?auto_86495 ) ) ( not ( = ?auto_86494 ?auto_86496 ) ) ( not ( = ?auto_86494 ?auto_86497 ) ) ( not ( = ?auto_86495 ?auto_86496 ) ) ( not ( = ?auto_86495 ?auto_86497 ) ) ( not ( = ?auto_86496 ?auto_86497 ) ) ( ON-TABLE ?auto_86497 ) ( ON ?auto_86496 ?auto_86497 ) ( ON ?auto_86495 ?auto_86496 ) ( ON ?auto_86494 ?auto_86495 ) ( ON ?auto_86493 ?auto_86494 ) ( ON ?auto_86492 ?auto_86493 ) ( CLEAR ?auto_86492 ) ( HOLDING ?auto_86491 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86491 )
      ( MAKE-7PILE ?auto_86491 ?auto_86492 ?auto_86493 ?auto_86494 ?auto_86495 ?auto_86496 ?auto_86497 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86498 - BLOCK
      ?auto_86499 - BLOCK
      ?auto_86500 - BLOCK
      ?auto_86501 - BLOCK
      ?auto_86502 - BLOCK
      ?auto_86503 - BLOCK
      ?auto_86504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86498 ?auto_86499 ) ) ( not ( = ?auto_86498 ?auto_86500 ) ) ( not ( = ?auto_86498 ?auto_86501 ) ) ( not ( = ?auto_86498 ?auto_86502 ) ) ( not ( = ?auto_86498 ?auto_86503 ) ) ( not ( = ?auto_86498 ?auto_86504 ) ) ( not ( = ?auto_86499 ?auto_86500 ) ) ( not ( = ?auto_86499 ?auto_86501 ) ) ( not ( = ?auto_86499 ?auto_86502 ) ) ( not ( = ?auto_86499 ?auto_86503 ) ) ( not ( = ?auto_86499 ?auto_86504 ) ) ( not ( = ?auto_86500 ?auto_86501 ) ) ( not ( = ?auto_86500 ?auto_86502 ) ) ( not ( = ?auto_86500 ?auto_86503 ) ) ( not ( = ?auto_86500 ?auto_86504 ) ) ( not ( = ?auto_86501 ?auto_86502 ) ) ( not ( = ?auto_86501 ?auto_86503 ) ) ( not ( = ?auto_86501 ?auto_86504 ) ) ( not ( = ?auto_86502 ?auto_86503 ) ) ( not ( = ?auto_86502 ?auto_86504 ) ) ( not ( = ?auto_86503 ?auto_86504 ) ) ( ON-TABLE ?auto_86504 ) ( ON ?auto_86503 ?auto_86504 ) ( ON ?auto_86502 ?auto_86503 ) ( ON ?auto_86501 ?auto_86502 ) ( ON ?auto_86500 ?auto_86501 ) ( ON ?auto_86499 ?auto_86500 ) ( ON ?auto_86498 ?auto_86499 ) ( CLEAR ?auto_86498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86504 ?auto_86503 ?auto_86502 ?auto_86501 ?auto_86500 ?auto_86499 )
      ( MAKE-7PILE ?auto_86498 ?auto_86499 ?auto_86500 ?auto_86501 ?auto_86502 ?auto_86503 ?auto_86504 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86512 - BLOCK
      ?auto_86513 - BLOCK
      ?auto_86514 - BLOCK
      ?auto_86515 - BLOCK
      ?auto_86516 - BLOCK
      ?auto_86517 - BLOCK
      ?auto_86518 - BLOCK
    )
    :vars
    (
      ?auto_86519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86512 ?auto_86513 ) ) ( not ( = ?auto_86512 ?auto_86514 ) ) ( not ( = ?auto_86512 ?auto_86515 ) ) ( not ( = ?auto_86512 ?auto_86516 ) ) ( not ( = ?auto_86512 ?auto_86517 ) ) ( not ( = ?auto_86512 ?auto_86518 ) ) ( not ( = ?auto_86513 ?auto_86514 ) ) ( not ( = ?auto_86513 ?auto_86515 ) ) ( not ( = ?auto_86513 ?auto_86516 ) ) ( not ( = ?auto_86513 ?auto_86517 ) ) ( not ( = ?auto_86513 ?auto_86518 ) ) ( not ( = ?auto_86514 ?auto_86515 ) ) ( not ( = ?auto_86514 ?auto_86516 ) ) ( not ( = ?auto_86514 ?auto_86517 ) ) ( not ( = ?auto_86514 ?auto_86518 ) ) ( not ( = ?auto_86515 ?auto_86516 ) ) ( not ( = ?auto_86515 ?auto_86517 ) ) ( not ( = ?auto_86515 ?auto_86518 ) ) ( not ( = ?auto_86516 ?auto_86517 ) ) ( not ( = ?auto_86516 ?auto_86518 ) ) ( not ( = ?auto_86517 ?auto_86518 ) ) ( ON-TABLE ?auto_86518 ) ( ON ?auto_86517 ?auto_86518 ) ( ON ?auto_86516 ?auto_86517 ) ( ON ?auto_86515 ?auto_86516 ) ( ON ?auto_86514 ?auto_86515 ) ( ON ?auto_86513 ?auto_86514 ) ( CLEAR ?auto_86513 ) ( ON ?auto_86512 ?auto_86519 ) ( CLEAR ?auto_86512 ) ( HAND-EMPTY ) ( not ( = ?auto_86512 ?auto_86519 ) ) ( not ( = ?auto_86513 ?auto_86519 ) ) ( not ( = ?auto_86514 ?auto_86519 ) ) ( not ( = ?auto_86515 ?auto_86519 ) ) ( not ( = ?auto_86516 ?auto_86519 ) ) ( not ( = ?auto_86517 ?auto_86519 ) ) ( not ( = ?auto_86518 ?auto_86519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_86512 ?auto_86519 )
      ( MAKE-7PILE ?auto_86512 ?auto_86513 ?auto_86514 ?auto_86515 ?auto_86516 ?auto_86517 ?auto_86518 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86520 - BLOCK
      ?auto_86521 - BLOCK
      ?auto_86522 - BLOCK
      ?auto_86523 - BLOCK
      ?auto_86524 - BLOCK
      ?auto_86525 - BLOCK
      ?auto_86526 - BLOCK
    )
    :vars
    (
      ?auto_86527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86520 ?auto_86521 ) ) ( not ( = ?auto_86520 ?auto_86522 ) ) ( not ( = ?auto_86520 ?auto_86523 ) ) ( not ( = ?auto_86520 ?auto_86524 ) ) ( not ( = ?auto_86520 ?auto_86525 ) ) ( not ( = ?auto_86520 ?auto_86526 ) ) ( not ( = ?auto_86521 ?auto_86522 ) ) ( not ( = ?auto_86521 ?auto_86523 ) ) ( not ( = ?auto_86521 ?auto_86524 ) ) ( not ( = ?auto_86521 ?auto_86525 ) ) ( not ( = ?auto_86521 ?auto_86526 ) ) ( not ( = ?auto_86522 ?auto_86523 ) ) ( not ( = ?auto_86522 ?auto_86524 ) ) ( not ( = ?auto_86522 ?auto_86525 ) ) ( not ( = ?auto_86522 ?auto_86526 ) ) ( not ( = ?auto_86523 ?auto_86524 ) ) ( not ( = ?auto_86523 ?auto_86525 ) ) ( not ( = ?auto_86523 ?auto_86526 ) ) ( not ( = ?auto_86524 ?auto_86525 ) ) ( not ( = ?auto_86524 ?auto_86526 ) ) ( not ( = ?auto_86525 ?auto_86526 ) ) ( ON-TABLE ?auto_86526 ) ( ON ?auto_86525 ?auto_86526 ) ( ON ?auto_86524 ?auto_86525 ) ( ON ?auto_86523 ?auto_86524 ) ( ON ?auto_86522 ?auto_86523 ) ( ON ?auto_86520 ?auto_86527 ) ( CLEAR ?auto_86520 ) ( not ( = ?auto_86520 ?auto_86527 ) ) ( not ( = ?auto_86521 ?auto_86527 ) ) ( not ( = ?auto_86522 ?auto_86527 ) ) ( not ( = ?auto_86523 ?auto_86527 ) ) ( not ( = ?auto_86524 ?auto_86527 ) ) ( not ( = ?auto_86525 ?auto_86527 ) ) ( not ( = ?auto_86526 ?auto_86527 ) ) ( HOLDING ?auto_86521 ) ( CLEAR ?auto_86522 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86526 ?auto_86525 ?auto_86524 ?auto_86523 ?auto_86522 ?auto_86521 )
      ( MAKE-7PILE ?auto_86520 ?auto_86521 ?auto_86522 ?auto_86523 ?auto_86524 ?auto_86525 ?auto_86526 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86528 - BLOCK
      ?auto_86529 - BLOCK
      ?auto_86530 - BLOCK
      ?auto_86531 - BLOCK
      ?auto_86532 - BLOCK
      ?auto_86533 - BLOCK
      ?auto_86534 - BLOCK
    )
    :vars
    (
      ?auto_86535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86528 ?auto_86529 ) ) ( not ( = ?auto_86528 ?auto_86530 ) ) ( not ( = ?auto_86528 ?auto_86531 ) ) ( not ( = ?auto_86528 ?auto_86532 ) ) ( not ( = ?auto_86528 ?auto_86533 ) ) ( not ( = ?auto_86528 ?auto_86534 ) ) ( not ( = ?auto_86529 ?auto_86530 ) ) ( not ( = ?auto_86529 ?auto_86531 ) ) ( not ( = ?auto_86529 ?auto_86532 ) ) ( not ( = ?auto_86529 ?auto_86533 ) ) ( not ( = ?auto_86529 ?auto_86534 ) ) ( not ( = ?auto_86530 ?auto_86531 ) ) ( not ( = ?auto_86530 ?auto_86532 ) ) ( not ( = ?auto_86530 ?auto_86533 ) ) ( not ( = ?auto_86530 ?auto_86534 ) ) ( not ( = ?auto_86531 ?auto_86532 ) ) ( not ( = ?auto_86531 ?auto_86533 ) ) ( not ( = ?auto_86531 ?auto_86534 ) ) ( not ( = ?auto_86532 ?auto_86533 ) ) ( not ( = ?auto_86532 ?auto_86534 ) ) ( not ( = ?auto_86533 ?auto_86534 ) ) ( ON-TABLE ?auto_86534 ) ( ON ?auto_86533 ?auto_86534 ) ( ON ?auto_86532 ?auto_86533 ) ( ON ?auto_86531 ?auto_86532 ) ( ON ?auto_86530 ?auto_86531 ) ( ON ?auto_86528 ?auto_86535 ) ( not ( = ?auto_86528 ?auto_86535 ) ) ( not ( = ?auto_86529 ?auto_86535 ) ) ( not ( = ?auto_86530 ?auto_86535 ) ) ( not ( = ?auto_86531 ?auto_86535 ) ) ( not ( = ?auto_86532 ?auto_86535 ) ) ( not ( = ?auto_86533 ?auto_86535 ) ) ( not ( = ?auto_86534 ?auto_86535 ) ) ( CLEAR ?auto_86530 ) ( ON ?auto_86529 ?auto_86528 ) ( CLEAR ?auto_86529 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_86535 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86535 ?auto_86528 )
      ( MAKE-7PILE ?auto_86528 ?auto_86529 ?auto_86530 ?auto_86531 ?auto_86532 ?auto_86533 ?auto_86534 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86536 - BLOCK
      ?auto_86537 - BLOCK
      ?auto_86538 - BLOCK
      ?auto_86539 - BLOCK
      ?auto_86540 - BLOCK
      ?auto_86541 - BLOCK
      ?auto_86542 - BLOCK
    )
    :vars
    (
      ?auto_86543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86536 ?auto_86537 ) ) ( not ( = ?auto_86536 ?auto_86538 ) ) ( not ( = ?auto_86536 ?auto_86539 ) ) ( not ( = ?auto_86536 ?auto_86540 ) ) ( not ( = ?auto_86536 ?auto_86541 ) ) ( not ( = ?auto_86536 ?auto_86542 ) ) ( not ( = ?auto_86537 ?auto_86538 ) ) ( not ( = ?auto_86537 ?auto_86539 ) ) ( not ( = ?auto_86537 ?auto_86540 ) ) ( not ( = ?auto_86537 ?auto_86541 ) ) ( not ( = ?auto_86537 ?auto_86542 ) ) ( not ( = ?auto_86538 ?auto_86539 ) ) ( not ( = ?auto_86538 ?auto_86540 ) ) ( not ( = ?auto_86538 ?auto_86541 ) ) ( not ( = ?auto_86538 ?auto_86542 ) ) ( not ( = ?auto_86539 ?auto_86540 ) ) ( not ( = ?auto_86539 ?auto_86541 ) ) ( not ( = ?auto_86539 ?auto_86542 ) ) ( not ( = ?auto_86540 ?auto_86541 ) ) ( not ( = ?auto_86540 ?auto_86542 ) ) ( not ( = ?auto_86541 ?auto_86542 ) ) ( ON-TABLE ?auto_86542 ) ( ON ?auto_86541 ?auto_86542 ) ( ON ?auto_86540 ?auto_86541 ) ( ON ?auto_86539 ?auto_86540 ) ( ON ?auto_86536 ?auto_86543 ) ( not ( = ?auto_86536 ?auto_86543 ) ) ( not ( = ?auto_86537 ?auto_86543 ) ) ( not ( = ?auto_86538 ?auto_86543 ) ) ( not ( = ?auto_86539 ?auto_86543 ) ) ( not ( = ?auto_86540 ?auto_86543 ) ) ( not ( = ?auto_86541 ?auto_86543 ) ) ( not ( = ?auto_86542 ?auto_86543 ) ) ( ON ?auto_86537 ?auto_86536 ) ( CLEAR ?auto_86537 ) ( ON-TABLE ?auto_86543 ) ( HOLDING ?auto_86538 ) ( CLEAR ?auto_86539 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86542 ?auto_86541 ?auto_86540 ?auto_86539 ?auto_86538 )
      ( MAKE-7PILE ?auto_86536 ?auto_86537 ?auto_86538 ?auto_86539 ?auto_86540 ?auto_86541 ?auto_86542 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86544 - BLOCK
      ?auto_86545 - BLOCK
      ?auto_86546 - BLOCK
      ?auto_86547 - BLOCK
      ?auto_86548 - BLOCK
      ?auto_86549 - BLOCK
      ?auto_86550 - BLOCK
    )
    :vars
    (
      ?auto_86551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86544 ?auto_86545 ) ) ( not ( = ?auto_86544 ?auto_86546 ) ) ( not ( = ?auto_86544 ?auto_86547 ) ) ( not ( = ?auto_86544 ?auto_86548 ) ) ( not ( = ?auto_86544 ?auto_86549 ) ) ( not ( = ?auto_86544 ?auto_86550 ) ) ( not ( = ?auto_86545 ?auto_86546 ) ) ( not ( = ?auto_86545 ?auto_86547 ) ) ( not ( = ?auto_86545 ?auto_86548 ) ) ( not ( = ?auto_86545 ?auto_86549 ) ) ( not ( = ?auto_86545 ?auto_86550 ) ) ( not ( = ?auto_86546 ?auto_86547 ) ) ( not ( = ?auto_86546 ?auto_86548 ) ) ( not ( = ?auto_86546 ?auto_86549 ) ) ( not ( = ?auto_86546 ?auto_86550 ) ) ( not ( = ?auto_86547 ?auto_86548 ) ) ( not ( = ?auto_86547 ?auto_86549 ) ) ( not ( = ?auto_86547 ?auto_86550 ) ) ( not ( = ?auto_86548 ?auto_86549 ) ) ( not ( = ?auto_86548 ?auto_86550 ) ) ( not ( = ?auto_86549 ?auto_86550 ) ) ( ON-TABLE ?auto_86550 ) ( ON ?auto_86549 ?auto_86550 ) ( ON ?auto_86548 ?auto_86549 ) ( ON ?auto_86547 ?auto_86548 ) ( ON ?auto_86544 ?auto_86551 ) ( not ( = ?auto_86544 ?auto_86551 ) ) ( not ( = ?auto_86545 ?auto_86551 ) ) ( not ( = ?auto_86546 ?auto_86551 ) ) ( not ( = ?auto_86547 ?auto_86551 ) ) ( not ( = ?auto_86548 ?auto_86551 ) ) ( not ( = ?auto_86549 ?auto_86551 ) ) ( not ( = ?auto_86550 ?auto_86551 ) ) ( ON ?auto_86545 ?auto_86544 ) ( ON-TABLE ?auto_86551 ) ( CLEAR ?auto_86547 ) ( ON ?auto_86546 ?auto_86545 ) ( CLEAR ?auto_86546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86551 ?auto_86544 ?auto_86545 )
      ( MAKE-7PILE ?auto_86544 ?auto_86545 ?auto_86546 ?auto_86547 ?auto_86548 ?auto_86549 ?auto_86550 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86552 - BLOCK
      ?auto_86553 - BLOCK
      ?auto_86554 - BLOCK
      ?auto_86555 - BLOCK
      ?auto_86556 - BLOCK
      ?auto_86557 - BLOCK
      ?auto_86558 - BLOCK
    )
    :vars
    (
      ?auto_86559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86552 ?auto_86553 ) ) ( not ( = ?auto_86552 ?auto_86554 ) ) ( not ( = ?auto_86552 ?auto_86555 ) ) ( not ( = ?auto_86552 ?auto_86556 ) ) ( not ( = ?auto_86552 ?auto_86557 ) ) ( not ( = ?auto_86552 ?auto_86558 ) ) ( not ( = ?auto_86553 ?auto_86554 ) ) ( not ( = ?auto_86553 ?auto_86555 ) ) ( not ( = ?auto_86553 ?auto_86556 ) ) ( not ( = ?auto_86553 ?auto_86557 ) ) ( not ( = ?auto_86553 ?auto_86558 ) ) ( not ( = ?auto_86554 ?auto_86555 ) ) ( not ( = ?auto_86554 ?auto_86556 ) ) ( not ( = ?auto_86554 ?auto_86557 ) ) ( not ( = ?auto_86554 ?auto_86558 ) ) ( not ( = ?auto_86555 ?auto_86556 ) ) ( not ( = ?auto_86555 ?auto_86557 ) ) ( not ( = ?auto_86555 ?auto_86558 ) ) ( not ( = ?auto_86556 ?auto_86557 ) ) ( not ( = ?auto_86556 ?auto_86558 ) ) ( not ( = ?auto_86557 ?auto_86558 ) ) ( ON-TABLE ?auto_86558 ) ( ON ?auto_86557 ?auto_86558 ) ( ON ?auto_86556 ?auto_86557 ) ( ON ?auto_86552 ?auto_86559 ) ( not ( = ?auto_86552 ?auto_86559 ) ) ( not ( = ?auto_86553 ?auto_86559 ) ) ( not ( = ?auto_86554 ?auto_86559 ) ) ( not ( = ?auto_86555 ?auto_86559 ) ) ( not ( = ?auto_86556 ?auto_86559 ) ) ( not ( = ?auto_86557 ?auto_86559 ) ) ( not ( = ?auto_86558 ?auto_86559 ) ) ( ON ?auto_86553 ?auto_86552 ) ( ON-TABLE ?auto_86559 ) ( ON ?auto_86554 ?auto_86553 ) ( CLEAR ?auto_86554 ) ( HOLDING ?auto_86555 ) ( CLEAR ?auto_86556 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86558 ?auto_86557 ?auto_86556 ?auto_86555 )
      ( MAKE-7PILE ?auto_86552 ?auto_86553 ?auto_86554 ?auto_86555 ?auto_86556 ?auto_86557 ?auto_86558 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86560 - BLOCK
      ?auto_86561 - BLOCK
      ?auto_86562 - BLOCK
      ?auto_86563 - BLOCK
      ?auto_86564 - BLOCK
      ?auto_86565 - BLOCK
      ?auto_86566 - BLOCK
    )
    :vars
    (
      ?auto_86567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86560 ?auto_86561 ) ) ( not ( = ?auto_86560 ?auto_86562 ) ) ( not ( = ?auto_86560 ?auto_86563 ) ) ( not ( = ?auto_86560 ?auto_86564 ) ) ( not ( = ?auto_86560 ?auto_86565 ) ) ( not ( = ?auto_86560 ?auto_86566 ) ) ( not ( = ?auto_86561 ?auto_86562 ) ) ( not ( = ?auto_86561 ?auto_86563 ) ) ( not ( = ?auto_86561 ?auto_86564 ) ) ( not ( = ?auto_86561 ?auto_86565 ) ) ( not ( = ?auto_86561 ?auto_86566 ) ) ( not ( = ?auto_86562 ?auto_86563 ) ) ( not ( = ?auto_86562 ?auto_86564 ) ) ( not ( = ?auto_86562 ?auto_86565 ) ) ( not ( = ?auto_86562 ?auto_86566 ) ) ( not ( = ?auto_86563 ?auto_86564 ) ) ( not ( = ?auto_86563 ?auto_86565 ) ) ( not ( = ?auto_86563 ?auto_86566 ) ) ( not ( = ?auto_86564 ?auto_86565 ) ) ( not ( = ?auto_86564 ?auto_86566 ) ) ( not ( = ?auto_86565 ?auto_86566 ) ) ( ON-TABLE ?auto_86566 ) ( ON ?auto_86565 ?auto_86566 ) ( ON ?auto_86564 ?auto_86565 ) ( ON ?auto_86560 ?auto_86567 ) ( not ( = ?auto_86560 ?auto_86567 ) ) ( not ( = ?auto_86561 ?auto_86567 ) ) ( not ( = ?auto_86562 ?auto_86567 ) ) ( not ( = ?auto_86563 ?auto_86567 ) ) ( not ( = ?auto_86564 ?auto_86567 ) ) ( not ( = ?auto_86565 ?auto_86567 ) ) ( not ( = ?auto_86566 ?auto_86567 ) ) ( ON ?auto_86561 ?auto_86560 ) ( ON-TABLE ?auto_86567 ) ( ON ?auto_86562 ?auto_86561 ) ( CLEAR ?auto_86564 ) ( ON ?auto_86563 ?auto_86562 ) ( CLEAR ?auto_86563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_86567 ?auto_86560 ?auto_86561 ?auto_86562 )
      ( MAKE-7PILE ?auto_86560 ?auto_86561 ?auto_86562 ?auto_86563 ?auto_86564 ?auto_86565 ?auto_86566 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86568 - BLOCK
      ?auto_86569 - BLOCK
      ?auto_86570 - BLOCK
      ?auto_86571 - BLOCK
      ?auto_86572 - BLOCK
      ?auto_86573 - BLOCK
      ?auto_86574 - BLOCK
    )
    :vars
    (
      ?auto_86575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86568 ?auto_86569 ) ) ( not ( = ?auto_86568 ?auto_86570 ) ) ( not ( = ?auto_86568 ?auto_86571 ) ) ( not ( = ?auto_86568 ?auto_86572 ) ) ( not ( = ?auto_86568 ?auto_86573 ) ) ( not ( = ?auto_86568 ?auto_86574 ) ) ( not ( = ?auto_86569 ?auto_86570 ) ) ( not ( = ?auto_86569 ?auto_86571 ) ) ( not ( = ?auto_86569 ?auto_86572 ) ) ( not ( = ?auto_86569 ?auto_86573 ) ) ( not ( = ?auto_86569 ?auto_86574 ) ) ( not ( = ?auto_86570 ?auto_86571 ) ) ( not ( = ?auto_86570 ?auto_86572 ) ) ( not ( = ?auto_86570 ?auto_86573 ) ) ( not ( = ?auto_86570 ?auto_86574 ) ) ( not ( = ?auto_86571 ?auto_86572 ) ) ( not ( = ?auto_86571 ?auto_86573 ) ) ( not ( = ?auto_86571 ?auto_86574 ) ) ( not ( = ?auto_86572 ?auto_86573 ) ) ( not ( = ?auto_86572 ?auto_86574 ) ) ( not ( = ?auto_86573 ?auto_86574 ) ) ( ON-TABLE ?auto_86574 ) ( ON ?auto_86573 ?auto_86574 ) ( ON ?auto_86568 ?auto_86575 ) ( not ( = ?auto_86568 ?auto_86575 ) ) ( not ( = ?auto_86569 ?auto_86575 ) ) ( not ( = ?auto_86570 ?auto_86575 ) ) ( not ( = ?auto_86571 ?auto_86575 ) ) ( not ( = ?auto_86572 ?auto_86575 ) ) ( not ( = ?auto_86573 ?auto_86575 ) ) ( not ( = ?auto_86574 ?auto_86575 ) ) ( ON ?auto_86569 ?auto_86568 ) ( ON-TABLE ?auto_86575 ) ( ON ?auto_86570 ?auto_86569 ) ( ON ?auto_86571 ?auto_86570 ) ( CLEAR ?auto_86571 ) ( HOLDING ?auto_86572 ) ( CLEAR ?auto_86573 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_86574 ?auto_86573 ?auto_86572 )
      ( MAKE-7PILE ?auto_86568 ?auto_86569 ?auto_86570 ?auto_86571 ?auto_86572 ?auto_86573 ?auto_86574 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86576 - BLOCK
      ?auto_86577 - BLOCK
      ?auto_86578 - BLOCK
      ?auto_86579 - BLOCK
      ?auto_86580 - BLOCK
      ?auto_86581 - BLOCK
      ?auto_86582 - BLOCK
    )
    :vars
    (
      ?auto_86583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86576 ?auto_86577 ) ) ( not ( = ?auto_86576 ?auto_86578 ) ) ( not ( = ?auto_86576 ?auto_86579 ) ) ( not ( = ?auto_86576 ?auto_86580 ) ) ( not ( = ?auto_86576 ?auto_86581 ) ) ( not ( = ?auto_86576 ?auto_86582 ) ) ( not ( = ?auto_86577 ?auto_86578 ) ) ( not ( = ?auto_86577 ?auto_86579 ) ) ( not ( = ?auto_86577 ?auto_86580 ) ) ( not ( = ?auto_86577 ?auto_86581 ) ) ( not ( = ?auto_86577 ?auto_86582 ) ) ( not ( = ?auto_86578 ?auto_86579 ) ) ( not ( = ?auto_86578 ?auto_86580 ) ) ( not ( = ?auto_86578 ?auto_86581 ) ) ( not ( = ?auto_86578 ?auto_86582 ) ) ( not ( = ?auto_86579 ?auto_86580 ) ) ( not ( = ?auto_86579 ?auto_86581 ) ) ( not ( = ?auto_86579 ?auto_86582 ) ) ( not ( = ?auto_86580 ?auto_86581 ) ) ( not ( = ?auto_86580 ?auto_86582 ) ) ( not ( = ?auto_86581 ?auto_86582 ) ) ( ON-TABLE ?auto_86582 ) ( ON ?auto_86581 ?auto_86582 ) ( ON ?auto_86576 ?auto_86583 ) ( not ( = ?auto_86576 ?auto_86583 ) ) ( not ( = ?auto_86577 ?auto_86583 ) ) ( not ( = ?auto_86578 ?auto_86583 ) ) ( not ( = ?auto_86579 ?auto_86583 ) ) ( not ( = ?auto_86580 ?auto_86583 ) ) ( not ( = ?auto_86581 ?auto_86583 ) ) ( not ( = ?auto_86582 ?auto_86583 ) ) ( ON ?auto_86577 ?auto_86576 ) ( ON-TABLE ?auto_86583 ) ( ON ?auto_86578 ?auto_86577 ) ( ON ?auto_86579 ?auto_86578 ) ( CLEAR ?auto_86581 ) ( ON ?auto_86580 ?auto_86579 ) ( CLEAR ?auto_86580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_86583 ?auto_86576 ?auto_86577 ?auto_86578 ?auto_86579 )
      ( MAKE-7PILE ?auto_86576 ?auto_86577 ?auto_86578 ?auto_86579 ?auto_86580 ?auto_86581 ?auto_86582 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86584 - BLOCK
      ?auto_86585 - BLOCK
      ?auto_86586 - BLOCK
      ?auto_86587 - BLOCK
      ?auto_86588 - BLOCK
      ?auto_86589 - BLOCK
      ?auto_86590 - BLOCK
    )
    :vars
    (
      ?auto_86591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86584 ?auto_86585 ) ) ( not ( = ?auto_86584 ?auto_86586 ) ) ( not ( = ?auto_86584 ?auto_86587 ) ) ( not ( = ?auto_86584 ?auto_86588 ) ) ( not ( = ?auto_86584 ?auto_86589 ) ) ( not ( = ?auto_86584 ?auto_86590 ) ) ( not ( = ?auto_86585 ?auto_86586 ) ) ( not ( = ?auto_86585 ?auto_86587 ) ) ( not ( = ?auto_86585 ?auto_86588 ) ) ( not ( = ?auto_86585 ?auto_86589 ) ) ( not ( = ?auto_86585 ?auto_86590 ) ) ( not ( = ?auto_86586 ?auto_86587 ) ) ( not ( = ?auto_86586 ?auto_86588 ) ) ( not ( = ?auto_86586 ?auto_86589 ) ) ( not ( = ?auto_86586 ?auto_86590 ) ) ( not ( = ?auto_86587 ?auto_86588 ) ) ( not ( = ?auto_86587 ?auto_86589 ) ) ( not ( = ?auto_86587 ?auto_86590 ) ) ( not ( = ?auto_86588 ?auto_86589 ) ) ( not ( = ?auto_86588 ?auto_86590 ) ) ( not ( = ?auto_86589 ?auto_86590 ) ) ( ON-TABLE ?auto_86590 ) ( ON ?auto_86584 ?auto_86591 ) ( not ( = ?auto_86584 ?auto_86591 ) ) ( not ( = ?auto_86585 ?auto_86591 ) ) ( not ( = ?auto_86586 ?auto_86591 ) ) ( not ( = ?auto_86587 ?auto_86591 ) ) ( not ( = ?auto_86588 ?auto_86591 ) ) ( not ( = ?auto_86589 ?auto_86591 ) ) ( not ( = ?auto_86590 ?auto_86591 ) ) ( ON ?auto_86585 ?auto_86584 ) ( ON-TABLE ?auto_86591 ) ( ON ?auto_86586 ?auto_86585 ) ( ON ?auto_86587 ?auto_86586 ) ( ON ?auto_86588 ?auto_86587 ) ( CLEAR ?auto_86588 ) ( HOLDING ?auto_86589 ) ( CLEAR ?auto_86590 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_86590 ?auto_86589 )
      ( MAKE-7PILE ?auto_86584 ?auto_86585 ?auto_86586 ?auto_86587 ?auto_86588 ?auto_86589 ?auto_86590 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86592 - BLOCK
      ?auto_86593 - BLOCK
      ?auto_86594 - BLOCK
      ?auto_86595 - BLOCK
      ?auto_86596 - BLOCK
      ?auto_86597 - BLOCK
      ?auto_86598 - BLOCK
    )
    :vars
    (
      ?auto_86599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86592 ?auto_86593 ) ) ( not ( = ?auto_86592 ?auto_86594 ) ) ( not ( = ?auto_86592 ?auto_86595 ) ) ( not ( = ?auto_86592 ?auto_86596 ) ) ( not ( = ?auto_86592 ?auto_86597 ) ) ( not ( = ?auto_86592 ?auto_86598 ) ) ( not ( = ?auto_86593 ?auto_86594 ) ) ( not ( = ?auto_86593 ?auto_86595 ) ) ( not ( = ?auto_86593 ?auto_86596 ) ) ( not ( = ?auto_86593 ?auto_86597 ) ) ( not ( = ?auto_86593 ?auto_86598 ) ) ( not ( = ?auto_86594 ?auto_86595 ) ) ( not ( = ?auto_86594 ?auto_86596 ) ) ( not ( = ?auto_86594 ?auto_86597 ) ) ( not ( = ?auto_86594 ?auto_86598 ) ) ( not ( = ?auto_86595 ?auto_86596 ) ) ( not ( = ?auto_86595 ?auto_86597 ) ) ( not ( = ?auto_86595 ?auto_86598 ) ) ( not ( = ?auto_86596 ?auto_86597 ) ) ( not ( = ?auto_86596 ?auto_86598 ) ) ( not ( = ?auto_86597 ?auto_86598 ) ) ( ON-TABLE ?auto_86598 ) ( ON ?auto_86592 ?auto_86599 ) ( not ( = ?auto_86592 ?auto_86599 ) ) ( not ( = ?auto_86593 ?auto_86599 ) ) ( not ( = ?auto_86594 ?auto_86599 ) ) ( not ( = ?auto_86595 ?auto_86599 ) ) ( not ( = ?auto_86596 ?auto_86599 ) ) ( not ( = ?auto_86597 ?auto_86599 ) ) ( not ( = ?auto_86598 ?auto_86599 ) ) ( ON ?auto_86593 ?auto_86592 ) ( ON-TABLE ?auto_86599 ) ( ON ?auto_86594 ?auto_86593 ) ( ON ?auto_86595 ?auto_86594 ) ( ON ?auto_86596 ?auto_86595 ) ( CLEAR ?auto_86598 ) ( ON ?auto_86597 ?auto_86596 ) ( CLEAR ?auto_86597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_86599 ?auto_86592 ?auto_86593 ?auto_86594 ?auto_86595 ?auto_86596 )
      ( MAKE-7PILE ?auto_86592 ?auto_86593 ?auto_86594 ?auto_86595 ?auto_86596 ?auto_86597 ?auto_86598 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86600 - BLOCK
      ?auto_86601 - BLOCK
      ?auto_86602 - BLOCK
      ?auto_86603 - BLOCK
      ?auto_86604 - BLOCK
      ?auto_86605 - BLOCK
      ?auto_86606 - BLOCK
    )
    :vars
    (
      ?auto_86607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86600 ?auto_86601 ) ) ( not ( = ?auto_86600 ?auto_86602 ) ) ( not ( = ?auto_86600 ?auto_86603 ) ) ( not ( = ?auto_86600 ?auto_86604 ) ) ( not ( = ?auto_86600 ?auto_86605 ) ) ( not ( = ?auto_86600 ?auto_86606 ) ) ( not ( = ?auto_86601 ?auto_86602 ) ) ( not ( = ?auto_86601 ?auto_86603 ) ) ( not ( = ?auto_86601 ?auto_86604 ) ) ( not ( = ?auto_86601 ?auto_86605 ) ) ( not ( = ?auto_86601 ?auto_86606 ) ) ( not ( = ?auto_86602 ?auto_86603 ) ) ( not ( = ?auto_86602 ?auto_86604 ) ) ( not ( = ?auto_86602 ?auto_86605 ) ) ( not ( = ?auto_86602 ?auto_86606 ) ) ( not ( = ?auto_86603 ?auto_86604 ) ) ( not ( = ?auto_86603 ?auto_86605 ) ) ( not ( = ?auto_86603 ?auto_86606 ) ) ( not ( = ?auto_86604 ?auto_86605 ) ) ( not ( = ?auto_86604 ?auto_86606 ) ) ( not ( = ?auto_86605 ?auto_86606 ) ) ( ON ?auto_86600 ?auto_86607 ) ( not ( = ?auto_86600 ?auto_86607 ) ) ( not ( = ?auto_86601 ?auto_86607 ) ) ( not ( = ?auto_86602 ?auto_86607 ) ) ( not ( = ?auto_86603 ?auto_86607 ) ) ( not ( = ?auto_86604 ?auto_86607 ) ) ( not ( = ?auto_86605 ?auto_86607 ) ) ( not ( = ?auto_86606 ?auto_86607 ) ) ( ON ?auto_86601 ?auto_86600 ) ( ON-TABLE ?auto_86607 ) ( ON ?auto_86602 ?auto_86601 ) ( ON ?auto_86603 ?auto_86602 ) ( ON ?auto_86604 ?auto_86603 ) ( ON ?auto_86605 ?auto_86604 ) ( CLEAR ?auto_86605 ) ( HOLDING ?auto_86606 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_86606 )
      ( MAKE-7PILE ?auto_86600 ?auto_86601 ?auto_86602 ?auto_86603 ?auto_86604 ?auto_86605 ?auto_86606 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_86608 - BLOCK
      ?auto_86609 - BLOCK
      ?auto_86610 - BLOCK
      ?auto_86611 - BLOCK
      ?auto_86612 - BLOCK
      ?auto_86613 - BLOCK
      ?auto_86614 - BLOCK
    )
    :vars
    (
      ?auto_86615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_86608 ?auto_86609 ) ) ( not ( = ?auto_86608 ?auto_86610 ) ) ( not ( = ?auto_86608 ?auto_86611 ) ) ( not ( = ?auto_86608 ?auto_86612 ) ) ( not ( = ?auto_86608 ?auto_86613 ) ) ( not ( = ?auto_86608 ?auto_86614 ) ) ( not ( = ?auto_86609 ?auto_86610 ) ) ( not ( = ?auto_86609 ?auto_86611 ) ) ( not ( = ?auto_86609 ?auto_86612 ) ) ( not ( = ?auto_86609 ?auto_86613 ) ) ( not ( = ?auto_86609 ?auto_86614 ) ) ( not ( = ?auto_86610 ?auto_86611 ) ) ( not ( = ?auto_86610 ?auto_86612 ) ) ( not ( = ?auto_86610 ?auto_86613 ) ) ( not ( = ?auto_86610 ?auto_86614 ) ) ( not ( = ?auto_86611 ?auto_86612 ) ) ( not ( = ?auto_86611 ?auto_86613 ) ) ( not ( = ?auto_86611 ?auto_86614 ) ) ( not ( = ?auto_86612 ?auto_86613 ) ) ( not ( = ?auto_86612 ?auto_86614 ) ) ( not ( = ?auto_86613 ?auto_86614 ) ) ( ON ?auto_86608 ?auto_86615 ) ( not ( = ?auto_86608 ?auto_86615 ) ) ( not ( = ?auto_86609 ?auto_86615 ) ) ( not ( = ?auto_86610 ?auto_86615 ) ) ( not ( = ?auto_86611 ?auto_86615 ) ) ( not ( = ?auto_86612 ?auto_86615 ) ) ( not ( = ?auto_86613 ?auto_86615 ) ) ( not ( = ?auto_86614 ?auto_86615 ) ) ( ON ?auto_86609 ?auto_86608 ) ( ON-TABLE ?auto_86615 ) ( ON ?auto_86610 ?auto_86609 ) ( ON ?auto_86611 ?auto_86610 ) ( ON ?auto_86612 ?auto_86611 ) ( ON ?auto_86613 ?auto_86612 ) ( ON ?auto_86614 ?auto_86613 ) ( CLEAR ?auto_86614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_86615 ?auto_86608 ?auto_86609 ?auto_86610 ?auto_86611 ?auto_86612 ?auto_86613 )
      ( MAKE-7PILE ?auto_86608 ?auto_86609 ?auto_86610 ?auto_86611 ?auto_86612 ?auto_86613 ?auto_86614 ) )
  )

)

