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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36103 - BLOCK
      ?auto_36104 - BLOCK
      ?auto_36105 - BLOCK
      ?auto_36106 - BLOCK
      ?auto_36107 - BLOCK
      ?auto_36108 - BLOCK
    )
    :vars
    (
      ?auto_36109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36109 ?auto_36108 ) ( CLEAR ?auto_36109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36103 ) ( ON ?auto_36104 ?auto_36103 ) ( ON ?auto_36105 ?auto_36104 ) ( ON ?auto_36106 ?auto_36105 ) ( ON ?auto_36107 ?auto_36106 ) ( ON ?auto_36108 ?auto_36107 ) ( not ( = ?auto_36103 ?auto_36104 ) ) ( not ( = ?auto_36103 ?auto_36105 ) ) ( not ( = ?auto_36103 ?auto_36106 ) ) ( not ( = ?auto_36103 ?auto_36107 ) ) ( not ( = ?auto_36103 ?auto_36108 ) ) ( not ( = ?auto_36103 ?auto_36109 ) ) ( not ( = ?auto_36104 ?auto_36105 ) ) ( not ( = ?auto_36104 ?auto_36106 ) ) ( not ( = ?auto_36104 ?auto_36107 ) ) ( not ( = ?auto_36104 ?auto_36108 ) ) ( not ( = ?auto_36104 ?auto_36109 ) ) ( not ( = ?auto_36105 ?auto_36106 ) ) ( not ( = ?auto_36105 ?auto_36107 ) ) ( not ( = ?auto_36105 ?auto_36108 ) ) ( not ( = ?auto_36105 ?auto_36109 ) ) ( not ( = ?auto_36106 ?auto_36107 ) ) ( not ( = ?auto_36106 ?auto_36108 ) ) ( not ( = ?auto_36106 ?auto_36109 ) ) ( not ( = ?auto_36107 ?auto_36108 ) ) ( not ( = ?auto_36107 ?auto_36109 ) ) ( not ( = ?auto_36108 ?auto_36109 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36109 ?auto_36108 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36111 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36111 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_36111 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36112 - BLOCK
    )
    :vars
    (
      ?auto_36113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36112 ?auto_36113 ) ( CLEAR ?auto_36112 ) ( HAND-EMPTY ) ( not ( = ?auto_36112 ?auto_36113 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36112 ?auto_36113 )
      ( MAKE-1PILE ?auto_36112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36119 - BLOCK
      ?auto_36120 - BLOCK
      ?auto_36121 - BLOCK
      ?auto_36122 - BLOCK
      ?auto_36123 - BLOCK
    )
    :vars
    (
      ?auto_36124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36124 ?auto_36123 ) ( CLEAR ?auto_36124 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36119 ) ( ON ?auto_36120 ?auto_36119 ) ( ON ?auto_36121 ?auto_36120 ) ( ON ?auto_36122 ?auto_36121 ) ( ON ?auto_36123 ?auto_36122 ) ( not ( = ?auto_36119 ?auto_36120 ) ) ( not ( = ?auto_36119 ?auto_36121 ) ) ( not ( = ?auto_36119 ?auto_36122 ) ) ( not ( = ?auto_36119 ?auto_36123 ) ) ( not ( = ?auto_36119 ?auto_36124 ) ) ( not ( = ?auto_36120 ?auto_36121 ) ) ( not ( = ?auto_36120 ?auto_36122 ) ) ( not ( = ?auto_36120 ?auto_36123 ) ) ( not ( = ?auto_36120 ?auto_36124 ) ) ( not ( = ?auto_36121 ?auto_36122 ) ) ( not ( = ?auto_36121 ?auto_36123 ) ) ( not ( = ?auto_36121 ?auto_36124 ) ) ( not ( = ?auto_36122 ?auto_36123 ) ) ( not ( = ?auto_36122 ?auto_36124 ) ) ( not ( = ?auto_36123 ?auto_36124 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36124 ?auto_36123 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36125 - BLOCK
      ?auto_36126 - BLOCK
      ?auto_36127 - BLOCK
      ?auto_36128 - BLOCK
      ?auto_36129 - BLOCK
    )
    :vars
    (
      ?auto_36130 - BLOCK
      ?auto_36131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36130 ?auto_36129 ) ( CLEAR ?auto_36130 ) ( ON-TABLE ?auto_36125 ) ( ON ?auto_36126 ?auto_36125 ) ( ON ?auto_36127 ?auto_36126 ) ( ON ?auto_36128 ?auto_36127 ) ( ON ?auto_36129 ?auto_36128 ) ( not ( = ?auto_36125 ?auto_36126 ) ) ( not ( = ?auto_36125 ?auto_36127 ) ) ( not ( = ?auto_36125 ?auto_36128 ) ) ( not ( = ?auto_36125 ?auto_36129 ) ) ( not ( = ?auto_36125 ?auto_36130 ) ) ( not ( = ?auto_36126 ?auto_36127 ) ) ( not ( = ?auto_36126 ?auto_36128 ) ) ( not ( = ?auto_36126 ?auto_36129 ) ) ( not ( = ?auto_36126 ?auto_36130 ) ) ( not ( = ?auto_36127 ?auto_36128 ) ) ( not ( = ?auto_36127 ?auto_36129 ) ) ( not ( = ?auto_36127 ?auto_36130 ) ) ( not ( = ?auto_36128 ?auto_36129 ) ) ( not ( = ?auto_36128 ?auto_36130 ) ) ( not ( = ?auto_36129 ?auto_36130 ) ) ( HOLDING ?auto_36131 ) ( not ( = ?auto_36125 ?auto_36131 ) ) ( not ( = ?auto_36126 ?auto_36131 ) ) ( not ( = ?auto_36127 ?auto_36131 ) ) ( not ( = ?auto_36128 ?auto_36131 ) ) ( not ( = ?auto_36129 ?auto_36131 ) ) ( not ( = ?auto_36130 ?auto_36131 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_36131 )
      ( MAKE-5PILE ?auto_36125 ?auto_36126 ?auto_36127 ?auto_36128 ?auto_36129 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36132 - BLOCK
      ?auto_36133 - BLOCK
      ?auto_36134 - BLOCK
      ?auto_36135 - BLOCK
      ?auto_36136 - BLOCK
    )
    :vars
    (
      ?auto_36137 - BLOCK
      ?auto_36138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36137 ?auto_36136 ) ( ON-TABLE ?auto_36132 ) ( ON ?auto_36133 ?auto_36132 ) ( ON ?auto_36134 ?auto_36133 ) ( ON ?auto_36135 ?auto_36134 ) ( ON ?auto_36136 ?auto_36135 ) ( not ( = ?auto_36132 ?auto_36133 ) ) ( not ( = ?auto_36132 ?auto_36134 ) ) ( not ( = ?auto_36132 ?auto_36135 ) ) ( not ( = ?auto_36132 ?auto_36136 ) ) ( not ( = ?auto_36132 ?auto_36137 ) ) ( not ( = ?auto_36133 ?auto_36134 ) ) ( not ( = ?auto_36133 ?auto_36135 ) ) ( not ( = ?auto_36133 ?auto_36136 ) ) ( not ( = ?auto_36133 ?auto_36137 ) ) ( not ( = ?auto_36134 ?auto_36135 ) ) ( not ( = ?auto_36134 ?auto_36136 ) ) ( not ( = ?auto_36134 ?auto_36137 ) ) ( not ( = ?auto_36135 ?auto_36136 ) ) ( not ( = ?auto_36135 ?auto_36137 ) ) ( not ( = ?auto_36136 ?auto_36137 ) ) ( not ( = ?auto_36132 ?auto_36138 ) ) ( not ( = ?auto_36133 ?auto_36138 ) ) ( not ( = ?auto_36134 ?auto_36138 ) ) ( not ( = ?auto_36135 ?auto_36138 ) ) ( not ( = ?auto_36136 ?auto_36138 ) ) ( not ( = ?auto_36137 ?auto_36138 ) ) ( ON ?auto_36138 ?auto_36137 ) ( CLEAR ?auto_36138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36132 ?auto_36133 ?auto_36134 ?auto_36135 ?auto_36136 ?auto_36137 )
      ( MAKE-5PILE ?auto_36132 ?auto_36133 ?auto_36134 ?auto_36135 ?auto_36136 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36141 - BLOCK
      ?auto_36142 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36142 ) ( CLEAR ?auto_36141 ) ( ON-TABLE ?auto_36141 ) ( not ( = ?auto_36141 ?auto_36142 ) ) )
    :subtasks
    ( ( !STACK ?auto_36142 ?auto_36141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36143 - BLOCK
      ?auto_36144 - BLOCK
    )
    :vars
    (
      ?auto_36145 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36143 ) ( ON-TABLE ?auto_36143 ) ( not ( = ?auto_36143 ?auto_36144 ) ) ( ON ?auto_36144 ?auto_36145 ) ( CLEAR ?auto_36144 ) ( HAND-EMPTY ) ( not ( = ?auto_36143 ?auto_36145 ) ) ( not ( = ?auto_36144 ?auto_36145 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36144 ?auto_36145 )
      ( MAKE-2PILE ?auto_36143 ?auto_36144 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36146 - BLOCK
      ?auto_36147 - BLOCK
    )
    :vars
    (
      ?auto_36148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36146 ?auto_36147 ) ) ( ON ?auto_36147 ?auto_36148 ) ( CLEAR ?auto_36147 ) ( not ( = ?auto_36146 ?auto_36148 ) ) ( not ( = ?auto_36147 ?auto_36148 ) ) ( HOLDING ?auto_36146 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36146 )
      ( MAKE-2PILE ?auto_36146 ?auto_36147 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36149 - BLOCK
      ?auto_36150 - BLOCK
    )
    :vars
    (
      ?auto_36151 - BLOCK
      ?auto_36155 - BLOCK
      ?auto_36152 - BLOCK
      ?auto_36153 - BLOCK
      ?auto_36154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36149 ?auto_36150 ) ) ( ON ?auto_36150 ?auto_36151 ) ( not ( = ?auto_36149 ?auto_36151 ) ) ( not ( = ?auto_36150 ?auto_36151 ) ) ( ON ?auto_36149 ?auto_36150 ) ( CLEAR ?auto_36149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36155 ) ( ON ?auto_36152 ?auto_36155 ) ( ON ?auto_36153 ?auto_36152 ) ( ON ?auto_36154 ?auto_36153 ) ( ON ?auto_36151 ?auto_36154 ) ( not ( = ?auto_36155 ?auto_36152 ) ) ( not ( = ?auto_36155 ?auto_36153 ) ) ( not ( = ?auto_36155 ?auto_36154 ) ) ( not ( = ?auto_36155 ?auto_36151 ) ) ( not ( = ?auto_36155 ?auto_36150 ) ) ( not ( = ?auto_36155 ?auto_36149 ) ) ( not ( = ?auto_36152 ?auto_36153 ) ) ( not ( = ?auto_36152 ?auto_36154 ) ) ( not ( = ?auto_36152 ?auto_36151 ) ) ( not ( = ?auto_36152 ?auto_36150 ) ) ( not ( = ?auto_36152 ?auto_36149 ) ) ( not ( = ?auto_36153 ?auto_36154 ) ) ( not ( = ?auto_36153 ?auto_36151 ) ) ( not ( = ?auto_36153 ?auto_36150 ) ) ( not ( = ?auto_36153 ?auto_36149 ) ) ( not ( = ?auto_36154 ?auto_36151 ) ) ( not ( = ?auto_36154 ?auto_36150 ) ) ( not ( = ?auto_36154 ?auto_36149 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36155 ?auto_36152 ?auto_36153 ?auto_36154 ?auto_36151 ?auto_36150 )
      ( MAKE-2PILE ?auto_36149 ?auto_36150 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36160 - BLOCK
      ?auto_36161 - BLOCK
      ?auto_36162 - BLOCK
      ?auto_36163 - BLOCK
    )
    :vars
    (
      ?auto_36164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36164 ?auto_36163 ) ( CLEAR ?auto_36164 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36160 ) ( ON ?auto_36161 ?auto_36160 ) ( ON ?auto_36162 ?auto_36161 ) ( ON ?auto_36163 ?auto_36162 ) ( not ( = ?auto_36160 ?auto_36161 ) ) ( not ( = ?auto_36160 ?auto_36162 ) ) ( not ( = ?auto_36160 ?auto_36163 ) ) ( not ( = ?auto_36160 ?auto_36164 ) ) ( not ( = ?auto_36161 ?auto_36162 ) ) ( not ( = ?auto_36161 ?auto_36163 ) ) ( not ( = ?auto_36161 ?auto_36164 ) ) ( not ( = ?auto_36162 ?auto_36163 ) ) ( not ( = ?auto_36162 ?auto_36164 ) ) ( not ( = ?auto_36163 ?auto_36164 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36164 ?auto_36163 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36165 - BLOCK
      ?auto_36166 - BLOCK
      ?auto_36167 - BLOCK
      ?auto_36168 - BLOCK
    )
    :vars
    (
      ?auto_36169 - BLOCK
      ?auto_36170 - BLOCK
      ?auto_36171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36169 ?auto_36168 ) ( CLEAR ?auto_36169 ) ( ON-TABLE ?auto_36165 ) ( ON ?auto_36166 ?auto_36165 ) ( ON ?auto_36167 ?auto_36166 ) ( ON ?auto_36168 ?auto_36167 ) ( not ( = ?auto_36165 ?auto_36166 ) ) ( not ( = ?auto_36165 ?auto_36167 ) ) ( not ( = ?auto_36165 ?auto_36168 ) ) ( not ( = ?auto_36165 ?auto_36169 ) ) ( not ( = ?auto_36166 ?auto_36167 ) ) ( not ( = ?auto_36166 ?auto_36168 ) ) ( not ( = ?auto_36166 ?auto_36169 ) ) ( not ( = ?auto_36167 ?auto_36168 ) ) ( not ( = ?auto_36167 ?auto_36169 ) ) ( not ( = ?auto_36168 ?auto_36169 ) ) ( HOLDING ?auto_36170 ) ( CLEAR ?auto_36171 ) ( not ( = ?auto_36165 ?auto_36170 ) ) ( not ( = ?auto_36165 ?auto_36171 ) ) ( not ( = ?auto_36166 ?auto_36170 ) ) ( not ( = ?auto_36166 ?auto_36171 ) ) ( not ( = ?auto_36167 ?auto_36170 ) ) ( not ( = ?auto_36167 ?auto_36171 ) ) ( not ( = ?auto_36168 ?auto_36170 ) ) ( not ( = ?auto_36168 ?auto_36171 ) ) ( not ( = ?auto_36169 ?auto_36170 ) ) ( not ( = ?auto_36169 ?auto_36171 ) ) ( not ( = ?auto_36170 ?auto_36171 ) ) )
    :subtasks
    ( ( !STACK ?auto_36170 ?auto_36171 )
      ( MAKE-4PILE ?auto_36165 ?auto_36166 ?auto_36167 ?auto_36168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36771 - BLOCK
      ?auto_36772 - BLOCK
      ?auto_36773 - BLOCK
      ?auto_36774 - BLOCK
    )
    :vars
    (
      ?auto_36776 - BLOCK
      ?auto_36775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36776 ?auto_36774 ) ( ON-TABLE ?auto_36771 ) ( ON ?auto_36772 ?auto_36771 ) ( ON ?auto_36773 ?auto_36772 ) ( ON ?auto_36774 ?auto_36773 ) ( not ( = ?auto_36771 ?auto_36772 ) ) ( not ( = ?auto_36771 ?auto_36773 ) ) ( not ( = ?auto_36771 ?auto_36774 ) ) ( not ( = ?auto_36771 ?auto_36776 ) ) ( not ( = ?auto_36772 ?auto_36773 ) ) ( not ( = ?auto_36772 ?auto_36774 ) ) ( not ( = ?auto_36772 ?auto_36776 ) ) ( not ( = ?auto_36773 ?auto_36774 ) ) ( not ( = ?auto_36773 ?auto_36776 ) ) ( not ( = ?auto_36774 ?auto_36776 ) ) ( not ( = ?auto_36771 ?auto_36775 ) ) ( not ( = ?auto_36772 ?auto_36775 ) ) ( not ( = ?auto_36773 ?auto_36775 ) ) ( not ( = ?auto_36774 ?auto_36775 ) ) ( not ( = ?auto_36776 ?auto_36775 ) ) ( ON ?auto_36775 ?auto_36776 ) ( CLEAR ?auto_36775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36771 ?auto_36772 ?auto_36773 ?auto_36774 ?auto_36776 )
      ( MAKE-4PILE ?auto_36771 ?auto_36772 ?auto_36773 ?auto_36774 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36179 - BLOCK
      ?auto_36180 - BLOCK
      ?auto_36181 - BLOCK
      ?auto_36182 - BLOCK
    )
    :vars
    (
      ?auto_36184 - BLOCK
      ?auto_36183 - BLOCK
      ?auto_36185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36184 ?auto_36182 ) ( ON-TABLE ?auto_36179 ) ( ON ?auto_36180 ?auto_36179 ) ( ON ?auto_36181 ?auto_36180 ) ( ON ?auto_36182 ?auto_36181 ) ( not ( = ?auto_36179 ?auto_36180 ) ) ( not ( = ?auto_36179 ?auto_36181 ) ) ( not ( = ?auto_36179 ?auto_36182 ) ) ( not ( = ?auto_36179 ?auto_36184 ) ) ( not ( = ?auto_36180 ?auto_36181 ) ) ( not ( = ?auto_36180 ?auto_36182 ) ) ( not ( = ?auto_36180 ?auto_36184 ) ) ( not ( = ?auto_36181 ?auto_36182 ) ) ( not ( = ?auto_36181 ?auto_36184 ) ) ( not ( = ?auto_36182 ?auto_36184 ) ) ( not ( = ?auto_36179 ?auto_36183 ) ) ( not ( = ?auto_36179 ?auto_36185 ) ) ( not ( = ?auto_36180 ?auto_36183 ) ) ( not ( = ?auto_36180 ?auto_36185 ) ) ( not ( = ?auto_36181 ?auto_36183 ) ) ( not ( = ?auto_36181 ?auto_36185 ) ) ( not ( = ?auto_36182 ?auto_36183 ) ) ( not ( = ?auto_36182 ?auto_36185 ) ) ( not ( = ?auto_36184 ?auto_36183 ) ) ( not ( = ?auto_36184 ?auto_36185 ) ) ( not ( = ?auto_36183 ?auto_36185 ) ) ( ON ?auto_36183 ?auto_36184 ) ( CLEAR ?auto_36183 ) ( HOLDING ?auto_36185 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36185 )
      ( MAKE-4PILE ?auto_36179 ?auto_36180 ?auto_36181 ?auto_36182 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36186 - BLOCK
      ?auto_36187 - BLOCK
      ?auto_36188 - BLOCK
      ?auto_36189 - BLOCK
    )
    :vars
    (
      ?auto_36190 - BLOCK
      ?auto_36192 - BLOCK
      ?auto_36191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36190 ?auto_36189 ) ( ON-TABLE ?auto_36186 ) ( ON ?auto_36187 ?auto_36186 ) ( ON ?auto_36188 ?auto_36187 ) ( ON ?auto_36189 ?auto_36188 ) ( not ( = ?auto_36186 ?auto_36187 ) ) ( not ( = ?auto_36186 ?auto_36188 ) ) ( not ( = ?auto_36186 ?auto_36189 ) ) ( not ( = ?auto_36186 ?auto_36190 ) ) ( not ( = ?auto_36187 ?auto_36188 ) ) ( not ( = ?auto_36187 ?auto_36189 ) ) ( not ( = ?auto_36187 ?auto_36190 ) ) ( not ( = ?auto_36188 ?auto_36189 ) ) ( not ( = ?auto_36188 ?auto_36190 ) ) ( not ( = ?auto_36189 ?auto_36190 ) ) ( not ( = ?auto_36186 ?auto_36192 ) ) ( not ( = ?auto_36186 ?auto_36191 ) ) ( not ( = ?auto_36187 ?auto_36192 ) ) ( not ( = ?auto_36187 ?auto_36191 ) ) ( not ( = ?auto_36188 ?auto_36192 ) ) ( not ( = ?auto_36188 ?auto_36191 ) ) ( not ( = ?auto_36189 ?auto_36192 ) ) ( not ( = ?auto_36189 ?auto_36191 ) ) ( not ( = ?auto_36190 ?auto_36192 ) ) ( not ( = ?auto_36190 ?auto_36191 ) ) ( not ( = ?auto_36192 ?auto_36191 ) ) ( ON ?auto_36192 ?auto_36190 ) ( ON ?auto_36191 ?auto_36192 ) ( CLEAR ?auto_36191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36186 ?auto_36187 ?auto_36188 ?auto_36189 ?auto_36190 ?auto_36192 )
      ( MAKE-4PILE ?auto_36186 ?auto_36187 ?auto_36188 ?auto_36189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36196 - BLOCK
      ?auto_36197 - BLOCK
      ?auto_36198 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36198 ) ( CLEAR ?auto_36197 ) ( ON-TABLE ?auto_36196 ) ( ON ?auto_36197 ?auto_36196 ) ( not ( = ?auto_36196 ?auto_36197 ) ) ( not ( = ?auto_36196 ?auto_36198 ) ) ( not ( = ?auto_36197 ?auto_36198 ) ) )
    :subtasks
    ( ( !STACK ?auto_36198 ?auto_36197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36199 - BLOCK
      ?auto_36200 - BLOCK
      ?auto_36201 - BLOCK
    )
    :vars
    (
      ?auto_36202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36200 ) ( ON-TABLE ?auto_36199 ) ( ON ?auto_36200 ?auto_36199 ) ( not ( = ?auto_36199 ?auto_36200 ) ) ( not ( = ?auto_36199 ?auto_36201 ) ) ( not ( = ?auto_36200 ?auto_36201 ) ) ( ON ?auto_36201 ?auto_36202 ) ( CLEAR ?auto_36201 ) ( HAND-EMPTY ) ( not ( = ?auto_36199 ?auto_36202 ) ) ( not ( = ?auto_36200 ?auto_36202 ) ) ( not ( = ?auto_36201 ?auto_36202 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36201 ?auto_36202 )
      ( MAKE-3PILE ?auto_36199 ?auto_36200 ?auto_36201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36203 - BLOCK
      ?auto_36204 - BLOCK
      ?auto_36205 - BLOCK
    )
    :vars
    (
      ?auto_36206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36203 ) ( not ( = ?auto_36203 ?auto_36204 ) ) ( not ( = ?auto_36203 ?auto_36205 ) ) ( not ( = ?auto_36204 ?auto_36205 ) ) ( ON ?auto_36205 ?auto_36206 ) ( CLEAR ?auto_36205 ) ( not ( = ?auto_36203 ?auto_36206 ) ) ( not ( = ?auto_36204 ?auto_36206 ) ) ( not ( = ?auto_36205 ?auto_36206 ) ) ( HOLDING ?auto_36204 ) ( CLEAR ?auto_36203 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36203 ?auto_36204 )
      ( MAKE-3PILE ?auto_36203 ?auto_36204 ?auto_36205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36207 - BLOCK
      ?auto_36208 - BLOCK
      ?auto_36209 - BLOCK
    )
    :vars
    (
      ?auto_36210 - BLOCK
      ?auto_36212 - BLOCK
      ?auto_36211 - BLOCK
      ?auto_36213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36207 ) ( not ( = ?auto_36207 ?auto_36208 ) ) ( not ( = ?auto_36207 ?auto_36209 ) ) ( not ( = ?auto_36208 ?auto_36209 ) ) ( ON ?auto_36209 ?auto_36210 ) ( not ( = ?auto_36207 ?auto_36210 ) ) ( not ( = ?auto_36208 ?auto_36210 ) ) ( not ( = ?auto_36209 ?auto_36210 ) ) ( CLEAR ?auto_36207 ) ( ON ?auto_36208 ?auto_36209 ) ( CLEAR ?auto_36208 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36212 ) ( ON ?auto_36211 ?auto_36212 ) ( ON ?auto_36213 ?auto_36211 ) ( ON ?auto_36210 ?auto_36213 ) ( not ( = ?auto_36212 ?auto_36211 ) ) ( not ( = ?auto_36212 ?auto_36213 ) ) ( not ( = ?auto_36212 ?auto_36210 ) ) ( not ( = ?auto_36212 ?auto_36209 ) ) ( not ( = ?auto_36212 ?auto_36208 ) ) ( not ( = ?auto_36211 ?auto_36213 ) ) ( not ( = ?auto_36211 ?auto_36210 ) ) ( not ( = ?auto_36211 ?auto_36209 ) ) ( not ( = ?auto_36211 ?auto_36208 ) ) ( not ( = ?auto_36213 ?auto_36210 ) ) ( not ( = ?auto_36213 ?auto_36209 ) ) ( not ( = ?auto_36213 ?auto_36208 ) ) ( not ( = ?auto_36207 ?auto_36212 ) ) ( not ( = ?auto_36207 ?auto_36211 ) ) ( not ( = ?auto_36207 ?auto_36213 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36212 ?auto_36211 ?auto_36213 ?auto_36210 ?auto_36209 )
      ( MAKE-3PILE ?auto_36207 ?auto_36208 ?auto_36209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36214 - BLOCK
      ?auto_36215 - BLOCK
      ?auto_36216 - BLOCK
    )
    :vars
    (
      ?auto_36219 - BLOCK
      ?auto_36217 - BLOCK
      ?auto_36220 - BLOCK
      ?auto_36218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36214 ?auto_36215 ) ) ( not ( = ?auto_36214 ?auto_36216 ) ) ( not ( = ?auto_36215 ?auto_36216 ) ) ( ON ?auto_36216 ?auto_36219 ) ( not ( = ?auto_36214 ?auto_36219 ) ) ( not ( = ?auto_36215 ?auto_36219 ) ) ( not ( = ?auto_36216 ?auto_36219 ) ) ( ON ?auto_36215 ?auto_36216 ) ( CLEAR ?auto_36215 ) ( ON-TABLE ?auto_36217 ) ( ON ?auto_36220 ?auto_36217 ) ( ON ?auto_36218 ?auto_36220 ) ( ON ?auto_36219 ?auto_36218 ) ( not ( = ?auto_36217 ?auto_36220 ) ) ( not ( = ?auto_36217 ?auto_36218 ) ) ( not ( = ?auto_36217 ?auto_36219 ) ) ( not ( = ?auto_36217 ?auto_36216 ) ) ( not ( = ?auto_36217 ?auto_36215 ) ) ( not ( = ?auto_36220 ?auto_36218 ) ) ( not ( = ?auto_36220 ?auto_36219 ) ) ( not ( = ?auto_36220 ?auto_36216 ) ) ( not ( = ?auto_36220 ?auto_36215 ) ) ( not ( = ?auto_36218 ?auto_36219 ) ) ( not ( = ?auto_36218 ?auto_36216 ) ) ( not ( = ?auto_36218 ?auto_36215 ) ) ( not ( = ?auto_36214 ?auto_36217 ) ) ( not ( = ?auto_36214 ?auto_36220 ) ) ( not ( = ?auto_36214 ?auto_36218 ) ) ( HOLDING ?auto_36214 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36214 )
      ( MAKE-3PILE ?auto_36214 ?auto_36215 ?auto_36216 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36221 - BLOCK
      ?auto_36222 - BLOCK
      ?auto_36223 - BLOCK
    )
    :vars
    (
      ?auto_36224 - BLOCK
      ?auto_36226 - BLOCK
      ?auto_36225 - BLOCK
      ?auto_36227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36221 ?auto_36222 ) ) ( not ( = ?auto_36221 ?auto_36223 ) ) ( not ( = ?auto_36222 ?auto_36223 ) ) ( ON ?auto_36223 ?auto_36224 ) ( not ( = ?auto_36221 ?auto_36224 ) ) ( not ( = ?auto_36222 ?auto_36224 ) ) ( not ( = ?auto_36223 ?auto_36224 ) ) ( ON ?auto_36222 ?auto_36223 ) ( ON-TABLE ?auto_36226 ) ( ON ?auto_36225 ?auto_36226 ) ( ON ?auto_36227 ?auto_36225 ) ( ON ?auto_36224 ?auto_36227 ) ( not ( = ?auto_36226 ?auto_36225 ) ) ( not ( = ?auto_36226 ?auto_36227 ) ) ( not ( = ?auto_36226 ?auto_36224 ) ) ( not ( = ?auto_36226 ?auto_36223 ) ) ( not ( = ?auto_36226 ?auto_36222 ) ) ( not ( = ?auto_36225 ?auto_36227 ) ) ( not ( = ?auto_36225 ?auto_36224 ) ) ( not ( = ?auto_36225 ?auto_36223 ) ) ( not ( = ?auto_36225 ?auto_36222 ) ) ( not ( = ?auto_36227 ?auto_36224 ) ) ( not ( = ?auto_36227 ?auto_36223 ) ) ( not ( = ?auto_36227 ?auto_36222 ) ) ( not ( = ?auto_36221 ?auto_36226 ) ) ( not ( = ?auto_36221 ?auto_36225 ) ) ( not ( = ?auto_36221 ?auto_36227 ) ) ( ON ?auto_36221 ?auto_36222 ) ( CLEAR ?auto_36221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36226 ?auto_36225 ?auto_36227 ?auto_36224 ?auto_36223 ?auto_36222 )
      ( MAKE-3PILE ?auto_36221 ?auto_36222 ?auto_36223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36231 - BLOCK
      ?auto_36232 - BLOCK
      ?auto_36233 - BLOCK
    )
    :vars
    (
      ?auto_36234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36234 ?auto_36233 ) ( CLEAR ?auto_36234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36231 ) ( ON ?auto_36232 ?auto_36231 ) ( ON ?auto_36233 ?auto_36232 ) ( not ( = ?auto_36231 ?auto_36232 ) ) ( not ( = ?auto_36231 ?auto_36233 ) ) ( not ( = ?auto_36231 ?auto_36234 ) ) ( not ( = ?auto_36232 ?auto_36233 ) ) ( not ( = ?auto_36232 ?auto_36234 ) ) ( not ( = ?auto_36233 ?auto_36234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36234 ?auto_36233 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36235 - BLOCK
      ?auto_36236 - BLOCK
      ?auto_36237 - BLOCK
    )
    :vars
    (
      ?auto_36238 - BLOCK
      ?auto_36239 - BLOCK
      ?auto_36240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36238 ?auto_36237 ) ( CLEAR ?auto_36238 ) ( ON-TABLE ?auto_36235 ) ( ON ?auto_36236 ?auto_36235 ) ( ON ?auto_36237 ?auto_36236 ) ( not ( = ?auto_36235 ?auto_36236 ) ) ( not ( = ?auto_36235 ?auto_36237 ) ) ( not ( = ?auto_36235 ?auto_36238 ) ) ( not ( = ?auto_36236 ?auto_36237 ) ) ( not ( = ?auto_36236 ?auto_36238 ) ) ( not ( = ?auto_36237 ?auto_36238 ) ) ( HOLDING ?auto_36239 ) ( CLEAR ?auto_36240 ) ( not ( = ?auto_36235 ?auto_36239 ) ) ( not ( = ?auto_36235 ?auto_36240 ) ) ( not ( = ?auto_36236 ?auto_36239 ) ) ( not ( = ?auto_36236 ?auto_36240 ) ) ( not ( = ?auto_36237 ?auto_36239 ) ) ( not ( = ?auto_36237 ?auto_36240 ) ) ( not ( = ?auto_36238 ?auto_36239 ) ) ( not ( = ?auto_36238 ?auto_36240 ) ) ( not ( = ?auto_36239 ?auto_36240 ) ) )
    :subtasks
    ( ( !STACK ?auto_36239 ?auto_36240 )
      ( MAKE-3PILE ?auto_36235 ?auto_36236 ?auto_36237 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36241 - BLOCK
      ?auto_36242 - BLOCK
      ?auto_36243 - BLOCK
    )
    :vars
    (
      ?auto_36246 - BLOCK
      ?auto_36245 - BLOCK
      ?auto_36244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36246 ?auto_36243 ) ( ON-TABLE ?auto_36241 ) ( ON ?auto_36242 ?auto_36241 ) ( ON ?auto_36243 ?auto_36242 ) ( not ( = ?auto_36241 ?auto_36242 ) ) ( not ( = ?auto_36241 ?auto_36243 ) ) ( not ( = ?auto_36241 ?auto_36246 ) ) ( not ( = ?auto_36242 ?auto_36243 ) ) ( not ( = ?auto_36242 ?auto_36246 ) ) ( not ( = ?auto_36243 ?auto_36246 ) ) ( CLEAR ?auto_36245 ) ( not ( = ?auto_36241 ?auto_36244 ) ) ( not ( = ?auto_36241 ?auto_36245 ) ) ( not ( = ?auto_36242 ?auto_36244 ) ) ( not ( = ?auto_36242 ?auto_36245 ) ) ( not ( = ?auto_36243 ?auto_36244 ) ) ( not ( = ?auto_36243 ?auto_36245 ) ) ( not ( = ?auto_36246 ?auto_36244 ) ) ( not ( = ?auto_36246 ?auto_36245 ) ) ( not ( = ?auto_36244 ?auto_36245 ) ) ( ON ?auto_36244 ?auto_36246 ) ( CLEAR ?auto_36244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36241 ?auto_36242 ?auto_36243 ?auto_36246 )
      ( MAKE-3PILE ?auto_36241 ?auto_36242 ?auto_36243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36247 - BLOCK
      ?auto_36248 - BLOCK
      ?auto_36249 - BLOCK
    )
    :vars
    (
      ?auto_36250 - BLOCK
      ?auto_36252 - BLOCK
      ?auto_36251 - BLOCK
      ?auto_36253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36250 ?auto_36249 ) ( ON-TABLE ?auto_36247 ) ( ON ?auto_36248 ?auto_36247 ) ( ON ?auto_36249 ?auto_36248 ) ( not ( = ?auto_36247 ?auto_36248 ) ) ( not ( = ?auto_36247 ?auto_36249 ) ) ( not ( = ?auto_36247 ?auto_36250 ) ) ( not ( = ?auto_36248 ?auto_36249 ) ) ( not ( = ?auto_36248 ?auto_36250 ) ) ( not ( = ?auto_36249 ?auto_36250 ) ) ( not ( = ?auto_36247 ?auto_36252 ) ) ( not ( = ?auto_36247 ?auto_36251 ) ) ( not ( = ?auto_36248 ?auto_36252 ) ) ( not ( = ?auto_36248 ?auto_36251 ) ) ( not ( = ?auto_36249 ?auto_36252 ) ) ( not ( = ?auto_36249 ?auto_36251 ) ) ( not ( = ?auto_36250 ?auto_36252 ) ) ( not ( = ?auto_36250 ?auto_36251 ) ) ( not ( = ?auto_36252 ?auto_36251 ) ) ( ON ?auto_36252 ?auto_36250 ) ( CLEAR ?auto_36252 ) ( HOLDING ?auto_36251 ) ( CLEAR ?auto_36253 ) ( ON-TABLE ?auto_36253 ) ( not ( = ?auto_36253 ?auto_36251 ) ) ( not ( = ?auto_36247 ?auto_36253 ) ) ( not ( = ?auto_36248 ?auto_36253 ) ) ( not ( = ?auto_36249 ?auto_36253 ) ) ( not ( = ?auto_36250 ?auto_36253 ) ) ( not ( = ?auto_36252 ?auto_36253 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36253 ?auto_36251 )
      ( MAKE-3PILE ?auto_36247 ?auto_36248 ?auto_36249 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36945 - BLOCK
      ?auto_36946 - BLOCK
      ?auto_36947 - BLOCK
    )
    :vars
    (
      ?auto_36950 - BLOCK
      ?auto_36948 - BLOCK
      ?auto_36949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36950 ?auto_36947 ) ( ON-TABLE ?auto_36945 ) ( ON ?auto_36946 ?auto_36945 ) ( ON ?auto_36947 ?auto_36946 ) ( not ( = ?auto_36945 ?auto_36946 ) ) ( not ( = ?auto_36945 ?auto_36947 ) ) ( not ( = ?auto_36945 ?auto_36950 ) ) ( not ( = ?auto_36946 ?auto_36947 ) ) ( not ( = ?auto_36946 ?auto_36950 ) ) ( not ( = ?auto_36947 ?auto_36950 ) ) ( not ( = ?auto_36945 ?auto_36948 ) ) ( not ( = ?auto_36945 ?auto_36949 ) ) ( not ( = ?auto_36946 ?auto_36948 ) ) ( not ( = ?auto_36946 ?auto_36949 ) ) ( not ( = ?auto_36947 ?auto_36948 ) ) ( not ( = ?auto_36947 ?auto_36949 ) ) ( not ( = ?auto_36950 ?auto_36948 ) ) ( not ( = ?auto_36950 ?auto_36949 ) ) ( not ( = ?auto_36948 ?auto_36949 ) ) ( ON ?auto_36948 ?auto_36950 ) ( ON ?auto_36949 ?auto_36948 ) ( CLEAR ?auto_36949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36945 ?auto_36946 ?auto_36947 ?auto_36950 ?auto_36948 )
      ( MAKE-3PILE ?auto_36945 ?auto_36946 ?auto_36947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36261 - BLOCK
      ?auto_36262 - BLOCK
      ?auto_36263 - BLOCK
    )
    :vars
    (
      ?auto_36265 - BLOCK
      ?auto_36266 - BLOCK
      ?auto_36267 - BLOCK
      ?auto_36264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36265 ?auto_36263 ) ( ON-TABLE ?auto_36261 ) ( ON ?auto_36262 ?auto_36261 ) ( ON ?auto_36263 ?auto_36262 ) ( not ( = ?auto_36261 ?auto_36262 ) ) ( not ( = ?auto_36261 ?auto_36263 ) ) ( not ( = ?auto_36261 ?auto_36265 ) ) ( not ( = ?auto_36262 ?auto_36263 ) ) ( not ( = ?auto_36262 ?auto_36265 ) ) ( not ( = ?auto_36263 ?auto_36265 ) ) ( not ( = ?auto_36261 ?auto_36266 ) ) ( not ( = ?auto_36261 ?auto_36267 ) ) ( not ( = ?auto_36262 ?auto_36266 ) ) ( not ( = ?auto_36262 ?auto_36267 ) ) ( not ( = ?auto_36263 ?auto_36266 ) ) ( not ( = ?auto_36263 ?auto_36267 ) ) ( not ( = ?auto_36265 ?auto_36266 ) ) ( not ( = ?auto_36265 ?auto_36267 ) ) ( not ( = ?auto_36266 ?auto_36267 ) ) ( ON ?auto_36266 ?auto_36265 ) ( not ( = ?auto_36264 ?auto_36267 ) ) ( not ( = ?auto_36261 ?auto_36264 ) ) ( not ( = ?auto_36262 ?auto_36264 ) ) ( not ( = ?auto_36263 ?auto_36264 ) ) ( not ( = ?auto_36265 ?auto_36264 ) ) ( not ( = ?auto_36266 ?auto_36264 ) ) ( ON ?auto_36267 ?auto_36266 ) ( CLEAR ?auto_36267 ) ( HOLDING ?auto_36264 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36264 )
      ( MAKE-3PILE ?auto_36261 ?auto_36262 ?auto_36263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36268 - BLOCK
      ?auto_36269 - BLOCK
      ?auto_36270 - BLOCK
    )
    :vars
    (
      ?auto_36274 - BLOCK
      ?auto_36273 - BLOCK
      ?auto_36271 - BLOCK
      ?auto_36272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36274 ?auto_36270 ) ( ON-TABLE ?auto_36268 ) ( ON ?auto_36269 ?auto_36268 ) ( ON ?auto_36270 ?auto_36269 ) ( not ( = ?auto_36268 ?auto_36269 ) ) ( not ( = ?auto_36268 ?auto_36270 ) ) ( not ( = ?auto_36268 ?auto_36274 ) ) ( not ( = ?auto_36269 ?auto_36270 ) ) ( not ( = ?auto_36269 ?auto_36274 ) ) ( not ( = ?auto_36270 ?auto_36274 ) ) ( not ( = ?auto_36268 ?auto_36273 ) ) ( not ( = ?auto_36268 ?auto_36271 ) ) ( not ( = ?auto_36269 ?auto_36273 ) ) ( not ( = ?auto_36269 ?auto_36271 ) ) ( not ( = ?auto_36270 ?auto_36273 ) ) ( not ( = ?auto_36270 ?auto_36271 ) ) ( not ( = ?auto_36274 ?auto_36273 ) ) ( not ( = ?auto_36274 ?auto_36271 ) ) ( not ( = ?auto_36273 ?auto_36271 ) ) ( ON ?auto_36273 ?auto_36274 ) ( not ( = ?auto_36272 ?auto_36271 ) ) ( not ( = ?auto_36268 ?auto_36272 ) ) ( not ( = ?auto_36269 ?auto_36272 ) ) ( not ( = ?auto_36270 ?auto_36272 ) ) ( not ( = ?auto_36274 ?auto_36272 ) ) ( not ( = ?auto_36273 ?auto_36272 ) ) ( ON ?auto_36271 ?auto_36273 ) ( ON ?auto_36272 ?auto_36271 ) ( CLEAR ?auto_36272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36268 ?auto_36269 ?auto_36270 ?auto_36274 ?auto_36273 ?auto_36271 )
      ( MAKE-3PILE ?auto_36268 ?auto_36269 ?auto_36270 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36279 - BLOCK
      ?auto_36280 - BLOCK
      ?auto_36281 - BLOCK
      ?auto_36282 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36282 ) ( CLEAR ?auto_36281 ) ( ON-TABLE ?auto_36279 ) ( ON ?auto_36280 ?auto_36279 ) ( ON ?auto_36281 ?auto_36280 ) ( not ( = ?auto_36279 ?auto_36280 ) ) ( not ( = ?auto_36279 ?auto_36281 ) ) ( not ( = ?auto_36279 ?auto_36282 ) ) ( not ( = ?auto_36280 ?auto_36281 ) ) ( not ( = ?auto_36280 ?auto_36282 ) ) ( not ( = ?auto_36281 ?auto_36282 ) ) )
    :subtasks
    ( ( !STACK ?auto_36282 ?auto_36281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36283 - BLOCK
      ?auto_36284 - BLOCK
      ?auto_36285 - BLOCK
      ?auto_36286 - BLOCK
    )
    :vars
    (
      ?auto_36287 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36285 ) ( ON-TABLE ?auto_36283 ) ( ON ?auto_36284 ?auto_36283 ) ( ON ?auto_36285 ?auto_36284 ) ( not ( = ?auto_36283 ?auto_36284 ) ) ( not ( = ?auto_36283 ?auto_36285 ) ) ( not ( = ?auto_36283 ?auto_36286 ) ) ( not ( = ?auto_36284 ?auto_36285 ) ) ( not ( = ?auto_36284 ?auto_36286 ) ) ( not ( = ?auto_36285 ?auto_36286 ) ) ( ON ?auto_36286 ?auto_36287 ) ( CLEAR ?auto_36286 ) ( HAND-EMPTY ) ( not ( = ?auto_36283 ?auto_36287 ) ) ( not ( = ?auto_36284 ?auto_36287 ) ) ( not ( = ?auto_36285 ?auto_36287 ) ) ( not ( = ?auto_36286 ?auto_36287 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36286 ?auto_36287 )
      ( MAKE-4PILE ?auto_36283 ?auto_36284 ?auto_36285 ?auto_36286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36288 - BLOCK
      ?auto_36289 - BLOCK
      ?auto_36290 - BLOCK
      ?auto_36291 - BLOCK
    )
    :vars
    (
      ?auto_36292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36288 ) ( ON ?auto_36289 ?auto_36288 ) ( not ( = ?auto_36288 ?auto_36289 ) ) ( not ( = ?auto_36288 ?auto_36290 ) ) ( not ( = ?auto_36288 ?auto_36291 ) ) ( not ( = ?auto_36289 ?auto_36290 ) ) ( not ( = ?auto_36289 ?auto_36291 ) ) ( not ( = ?auto_36290 ?auto_36291 ) ) ( ON ?auto_36291 ?auto_36292 ) ( CLEAR ?auto_36291 ) ( not ( = ?auto_36288 ?auto_36292 ) ) ( not ( = ?auto_36289 ?auto_36292 ) ) ( not ( = ?auto_36290 ?auto_36292 ) ) ( not ( = ?auto_36291 ?auto_36292 ) ) ( HOLDING ?auto_36290 ) ( CLEAR ?auto_36289 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36288 ?auto_36289 ?auto_36290 )
      ( MAKE-4PILE ?auto_36288 ?auto_36289 ?auto_36290 ?auto_36291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36293 - BLOCK
      ?auto_36294 - BLOCK
      ?auto_36295 - BLOCK
      ?auto_36296 - BLOCK
    )
    :vars
    (
      ?auto_36297 - BLOCK
      ?auto_36298 - BLOCK
      ?auto_36299 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36293 ) ( ON ?auto_36294 ?auto_36293 ) ( not ( = ?auto_36293 ?auto_36294 ) ) ( not ( = ?auto_36293 ?auto_36295 ) ) ( not ( = ?auto_36293 ?auto_36296 ) ) ( not ( = ?auto_36294 ?auto_36295 ) ) ( not ( = ?auto_36294 ?auto_36296 ) ) ( not ( = ?auto_36295 ?auto_36296 ) ) ( ON ?auto_36296 ?auto_36297 ) ( not ( = ?auto_36293 ?auto_36297 ) ) ( not ( = ?auto_36294 ?auto_36297 ) ) ( not ( = ?auto_36295 ?auto_36297 ) ) ( not ( = ?auto_36296 ?auto_36297 ) ) ( CLEAR ?auto_36294 ) ( ON ?auto_36295 ?auto_36296 ) ( CLEAR ?auto_36295 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36298 ) ( ON ?auto_36299 ?auto_36298 ) ( ON ?auto_36297 ?auto_36299 ) ( not ( = ?auto_36298 ?auto_36299 ) ) ( not ( = ?auto_36298 ?auto_36297 ) ) ( not ( = ?auto_36298 ?auto_36296 ) ) ( not ( = ?auto_36298 ?auto_36295 ) ) ( not ( = ?auto_36299 ?auto_36297 ) ) ( not ( = ?auto_36299 ?auto_36296 ) ) ( not ( = ?auto_36299 ?auto_36295 ) ) ( not ( = ?auto_36293 ?auto_36298 ) ) ( not ( = ?auto_36293 ?auto_36299 ) ) ( not ( = ?auto_36294 ?auto_36298 ) ) ( not ( = ?auto_36294 ?auto_36299 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36298 ?auto_36299 ?auto_36297 ?auto_36296 )
      ( MAKE-4PILE ?auto_36293 ?auto_36294 ?auto_36295 ?auto_36296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36300 - BLOCK
      ?auto_36301 - BLOCK
      ?auto_36302 - BLOCK
      ?auto_36303 - BLOCK
    )
    :vars
    (
      ?auto_36305 - BLOCK
      ?auto_36306 - BLOCK
      ?auto_36304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36300 ) ( not ( = ?auto_36300 ?auto_36301 ) ) ( not ( = ?auto_36300 ?auto_36302 ) ) ( not ( = ?auto_36300 ?auto_36303 ) ) ( not ( = ?auto_36301 ?auto_36302 ) ) ( not ( = ?auto_36301 ?auto_36303 ) ) ( not ( = ?auto_36302 ?auto_36303 ) ) ( ON ?auto_36303 ?auto_36305 ) ( not ( = ?auto_36300 ?auto_36305 ) ) ( not ( = ?auto_36301 ?auto_36305 ) ) ( not ( = ?auto_36302 ?auto_36305 ) ) ( not ( = ?auto_36303 ?auto_36305 ) ) ( ON ?auto_36302 ?auto_36303 ) ( CLEAR ?auto_36302 ) ( ON-TABLE ?auto_36306 ) ( ON ?auto_36304 ?auto_36306 ) ( ON ?auto_36305 ?auto_36304 ) ( not ( = ?auto_36306 ?auto_36304 ) ) ( not ( = ?auto_36306 ?auto_36305 ) ) ( not ( = ?auto_36306 ?auto_36303 ) ) ( not ( = ?auto_36306 ?auto_36302 ) ) ( not ( = ?auto_36304 ?auto_36305 ) ) ( not ( = ?auto_36304 ?auto_36303 ) ) ( not ( = ?auto_36304 ?auto_36302 ) ) ( not ( = ?auto_36300 ?auto_36306 ) ) ( not ( = ?auto_36300 ?auto_36304 ) ) ( not ( = ?auto_36301 ?auto_36306 ) ) ( not ( = ?auto_36301 ?auto_36304 ) ) ( HOLDING ?auto_36301 ) ( CLEAR ?auto_36300 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36300 ?auto_36301 )
      ( MAKE-4PILE ?auto_36300 ?auto_36301 ?auto_36302 ?auto_36303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36307 - BLOCK
      ?auto_36308 - BLOCK
      ?auto_36309 - BLOCK
      ?auto_36310 - BLOCK
    )
    :vars
    (
      ?auto_36313 - BLOCK
      ?auto_36311 - BLOCK
      ?auto_36312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36307 ) ( not ( = ?auto_36307 ?auto_36308 ) ) ( not ( = ?auto_36307 ?auto_36309 ) ) ( not ( = ?auto_36307 ?auto_36310 ) ) ( not ( = ?auto_36308 ?auto_36309 ) ) ( not ( = ?auto_36308 ?auto_36310 ) ) ( not ( = ?auto_36309 ?auto_36310 ) ) ( ON ?auto_36310 ?auto_36313 ) ( not ( = ?auto_36307 ?auto_36313 ) ) ( not ( = ?auto_36308 ?auto_36313 ) ) ( not ( = ?auto_36309 ?auto_36313 ) ) ( not ( = ?auto_36310 ?auto_36313 ) ) ( ON ?auto_36309 ?auto_36310 ) ( ON-TABLE ?auto_36311 ) ( ON ?auto_36312 ?auto_36311 ) ( ON ?auto_36313 ?auto_36312 ) ( not ( = ?auto_36311 ?auto_36312 ) ) ( not ( = ?auto_36311 ?auto_36313 ) ) ( not ( = ?auto_36311 ?auto_36310 ) ) ( not ( = ?auto_36311 ?auto_36309 ) ) ( not ( = ?auto_36312 ?auto_36313 ) ) ( not ( = ?auto_36312 ?auto_36310 ) ) ( not ( = ?auto_36312 ?auto_36309 ) ) ( not ( = ?auto_36307 ?auto_36311 ) ) ( not ( = ?auto_36307 ?auto_36312 ) ) ( not ( = ?auto_36308 ?auto_36311 ) ) ( not ( = ?auto_36308 ?auto_36312 ) ) ( CLEAR ?auto_36307 ) ( ON ?auto_36308 ?auto_36309 ) ( CLEAR ?auto_36308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36311 ?auto_36312 ?auto_36313 ?auto_36310 ?auto_36309 )
      ( MAKE-4PILE ?auto_36307 ?auto_36308 ?auto_36309 ?auto_36310 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36314 - BLOCK
      ?auto_36315 - BLOCK
      ?auto_36316 - BLOCK
      ?auto_36317 - BLOCK
    )
    :vars
    (
      ?auto_36320 - BLOCK
      ?auto_36318 - BLOCK
      ?auto_36319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36314 ?auto_36315 ) ) ( not ( = ?auto_36314 ?auto_36316 ) ) ( not ( = ?auto_36314 ?auto_36317 ) ) ( not ( = ?auto_36315 ?auto_36316 ) ) ( not ( = ?auto_36315 ?auto_36317 ) ) ( not ( = ?auto_36316 ?auto_36317 ) ) ( ON ?auto_36317 ?auto_36320 ) ( not ( = ?auto_36314 ?auto_36320 ) ) ( not ( = ?auto_36315 ?auto_36320 ) ) ( not ( = ?auto_36316 ?auto_36320 ) ) ( not ( = ?auto_36317 ?auto_36320 ) ) ( ON ?auto_36316 ?auto_36317 ) ( ON-TABLE ?auto_36318 ) ( ON ?auto_36319 ?auto_36318 ) ( ON ?auto_36320 ?auto_36319 ) ( not ( = ?auto_36318 ?auto_36319 ) ) ( not ( = ?auto_36318 ?auto_36320 ) ) ( not ( = ?auto_36318 ?auto_36317 ) ) ( not ( = ?auto_36318 ?auto_36316 ) ) ( not ( = ?auto_36319 ?auto_36320 ) ) ( not ( = ?auto_36319 ?auto_36317 ) ) ( not ( = ?auto_36319 ?auto_36316 ) ) ( not ( = ?auto_36314 ?auto_36318 ) ) ( not ( = ?auto_36314 ?auto_36319 ) ) ( not ( = ?auto_36315 ?auto_36318 ) ) ( not ( = ?auto_36315 ?auto_36319 ) ) ( ON ?auto_36315 ?auto_36316 ) ( CLEAR ?auto_36315 ) ( HOLDING ?auto_36314 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36314 )
      ( MAKE-4PILE ?auto_36314 ?auto_36315 ?auto_36316 ?auto_36317 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36321 - BLOCK
      ?auto_36322 - BLOCK
      ?auto_36323 - BLOCK
      ?auto_36324 - BLOCK
    )
    :vars
    (
      ?auto_36327 - BLOCK
      ?auto_36326 - BLOCK
      ?auto_36325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36321 ?auto_36322 ) ) ( not ( = ?auto_36321 ?auto_36323 ) ) ( not ( = ?auto_36321 ?auto_36324 ) ) ( not ( = ?auto_36322 ?auto_36323 ) ) ( not ( = ?auto_36322 ?auto_36324 ) ) ( not ( = ?auto_36323 ?auto_36324 ) ) ( ON ?auto_36324 ?auto_36327 ) ( not ( = ?auto_36321 ?auto_36327 ) ) ( not ( = ?auto_36322 ?auto_36327 ) ) ( not ( = ?auto_36323 ?auto_36327 ) ) ( not ( = ?auto_36324 ?auto_36327 ) ) ( ON ?auto_36323 ?auto_36324 ) ( ON-TABLE ?auto_36326 ) ( ON ?auto_36325 ?auto_36326 ) ( ON ?auto_36327 ?auto_36325 ) ( not ( = ?auto_36326 ?auto_36325 ) ) ( not ( = ?auto_36326 ?auto_36327 ) ) ( not ( = ?auto_36326 ?auto_36324 ) ) ( not ( = ?auto_36326 ?auto_36323 ) ) ( not ( = ?auto_36325 ?auto_36327 ) ) ( not ( = ?auto_36325 ?auto_36324 ) ) ( not ( = ?auto_36325 ?auto_36323 ) ) ( not ( = ?auto_36321 ?auto_36326 ) ) ( not ( = ?auto_36321 ?auto_36325 ) ) ( not ( = ?auto_36322 ?auto_36326 ) ) ( not ( = ?auto_36322 ?auto_36325 ) ) ( ON ?auto_36322 ?auto_36323 ) ( ON ?auto_36321 ?auto_36322 ) ( CLEAR ?auto_36321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36326 ?auto_36325 ?auto_36327 ?auto_36324 ?auto_36323 ?auto_36322 )
      ( MAKE-4PILE ?auto_36321 ?auto_36322 ?auto_36323 ?auto_36324 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36330 - BLOCK
      ?auto_36331 - BLOCK
    )
    :vars
    (
      ?auto_36332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36332 ?auto_36331 ) ( CLEAR ?auto_36332 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36330 ) ( ON ?auto_36331 ?auto_36330 ) ( not ( = ?auto_36330 ?auto_36331 ) ) ( not ( = ?auto_36330 ?auto_36332 ) ) ( not ( = ?auto_36331 ?auto_36332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36332 ?auto_36331 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36333 - BLOCK
      ?auto_36334 - BLOCK
    )
    :vars
    (
      ?auto_36335 - BLOCK
      ?auto_36336 - BLOCK
      ?auto_36337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36335 ?auto_36334 ) ( CLEAR ?auto_36335 ) ( ON-TABLE ?auto_36333 ) ( ON ?auto_36334 ?auto_36333 ) ( not ( = ?auto_36333 ?auto_36334 ) ) ( not ( = ?auto_36333 ?auto_36335 ) ) ( not ( = ?auto_36334 ?auto_36335 ) ) ( HOLDING ?auto_36336 ) ( CLEAR ?auto_36337 ) ( not ( = ?auto_36333 ?auto_36336 ) ) ( not ( = ?auto_36333 ?auto_36337 ) ) ( not ( = ?auto_36334 ?auto_36336 ) ) ( not ( = ?auto_36334 ?auto_36337 ) ) ( not ( = ?auto_36335 ?auto_36336 ) ) ( not ( = ?auto_36335 ?auto_36337 ) ) ( not ( = ?auto_36336 ?auto_36337 ) ) )
    :subtasks
    ( ( !STACK ?auto_36336 ?auto_36337 )
      ( MAKE-2PILE ?auto_36333 ?auto_36334 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36338 - BLOCK
      ?auto_36339 - BLOCK
    )
    :vars
    (
      ?auto_36342 - BLOCK
      ?auto_36341 - BLOCK
      ?auto_36340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36342 ?auto_36339 ) ( ON-TABLE ?auto_36338 ) ( ON ?auto_36339 ?auto_36338 ) ( not ( = ?auto_36338 ?auto_36339 ) ) ( not ( = ?auto_36338 ?auto_36342 ) ) ( not ( = ?auto_36339 ?auto_36342 ) ) ( CLEAR ?auto_36341 ) ( not ( = ?auto_36338 ?auto_36340 ) ) ( not ( = ?auto_36338 ?auto_36341 ) ) ( not ( = ?auto_36339 ?auto_36340 ) ) ( not ( = ?auto_36339 ?auto_36341 ) ) ( not ( = ?auto_36342 ?auto_36340 ) ) ( not ( = ?auto_36342 ?auto_36341 ) ) ( not ( = ?auto_36340 ?auto_36341 ) ) ( ON ?auto_36340 ?auto_36342 ) ( CLEAR ?auto_36340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36338 ?auto_36339 ?auto_36342 )
      ( MAKE-2PILE ?auto_36338 ?auto_36339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36343 - BLOCK
      ?auto_36344 - BLOCK
    )
    :vars
    (
      ?auto_36346 - BLOCK
      ?auto_36345 - BLOCK
      ?auto_36347 - BLOCK
      ?auto_36349 - BLOCK
      ?auto_36348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36346 ?auto_36344 ) ( ON-TABLE ?auto_36343 ) ( ON ?auto_36344 ?auto_36343 ) ( not ( = ?auto_36343 ?auto_36344 ) ) ( not ( = ?auto_36343 ?auto_36346 ) ) ( not ( = ?auto_36344 ?auto_36346 ) ) ( not ( = ?auto_36343 ?auto_36345 ) ) ( not ( = ?auto_36343 ?auto_36347 ) ) ( not ( = ?auto_36344 ?auto_36345 ) ) ( not ( = ?auto_36344 ?auto_36347 ) ) ( not ( = ?auto_36346 ?auto_36345 ) ) ( not ( = ?auto_36346 ?auto_36347 ) ) ( not ( = ?auto_36345 ?auto_36347 ) ) ( ON ?auto_36345 ?auto_36346 ) ( CLEAR ?auto_36345 ) ( HOLDING ?auto_36347 ) ( CLEAR ?auto_36349 ) ( ON-TABLE ?auto_36348 ) ( ON ?auto_36349 ?auto_36348 ) ( not ( = ?auto_36348 ?auto_36349 ) ) ( not ( = ?auto_36348 ?auto_36347 ) ) ( not ( = ?auto_36349 ?auto_36347 ) ) ( not ( = ?auto_36343 ?auto_36349 ) ) ( not ( = ?auto_36343 ?auto_36348 ) ) ( not ( = ?auto_36344 ?auto_36349 ) ) ( not ( = ?auto_36344 ?auto_36348 ) ) ( not ( = ?auto_36346 ?auto_36349 ) ) ( not ( = ?auto_36346 ?auto_36348 ) ) ( not ( = ?auto_36345 ?auto_36349 ) ) ( not ( = ?auto_36345 ?auto_36348 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36348 ?auto_36349 ?auto_36347 )
      ( MAKE-2PILE ?auto_36343 ?auto_36344 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36350 - BLOCK
      ?auto_36351 - BLOCK
    )
    :vars
    (
      ?auto_36356 - BLOCK
      ?auto_36355 - BLOCK
      ?auto_36354 - BLOCK
      ?auto_36352 - BLOCK
      ?auto_36353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36356 ?auto_36351 ) ( ON-TABLE ?auto_36350 ) ( ON ?auto_36351 ?auto_36350 ) ( not ( = ?auto_36350 ?auto_36351 ) ) ( not ( = ?auto_36350 ?auto_36356 ) ) ( not ( = ?auto_36351 ?auto_36356 ) ) ( not ( = ?auto_36350 ?auto_36355 ) ) ( not ( = ?auto_36350 ?auto_36354 ) ) ( not ( = ?auto_36351 ?auto_36355 ) ) ( not ( = ?auto_36351 ?auto_36354 ) ) ( not ( = ?auto_36356 ?auto_36355 ) ) ( not ( = ?auto_36356 ?auto_36354 ) ) ( not ( = ?auto_36355 ?auto_36354 ) ) ( ON ?auto_36355 ?auto_36356 ) ( CLEAR ?auto_36352 ) ( ON-TABLE ?auto_36353 ) ( ON ?auto_36352 ?auto_36353 ) ( not ( = ?auto_36353 ?auto_36352 ) ) ( not ( = ?auto_36353 ?auto_36354 ) ) ( not ( = ?auto_36352 ?auto_36354 ) ) ( not ( = ?auto_36350 ?auto_36352 ) ) ( not ( = ?auto_36350 ?auto_36353 ) ) ( not ( = ?auto_36351 ?auto_36352 ) ) ( not ( = ?auto_36351 ?auto_36353 ) ) ( not ( = ?auto_36356 ?auto_36352 ) ) ( not ( = ?auto_36356 ?auto_36353 ) ) ( not ( = ?auto_36355 ?auto_36352 ) ) ( not ( = ?auto_36355 ?auto_36353 ) ) ( ON ?auto_36354 ?auto_36355 ) ( CLEAR ?auto_36354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36350 ?auto_36351 ?auto_36356 ?auto_36355 )
      ( MAKE-2PILE ?auto_36350 ?auto_36351 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36357 - BLOCK
      ?auto_36358 - BLOCK
    )
    :vars
    (
      ?auto_36360 - BLOCK
      ?auto_36363 - BLOCK
      ?auto_36362 - BLOCK
      ?auto_36361 - BLOCK
      ?auto_36359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36360 ?auto_36358 ) ( ON-TABLE ?auto_36357 ) ( ON ?auto_36358 ?auto_36357 ) ( not ( = ?auto_36357 ?auto_36358 ) ) ( not ( = ?auto_36357 ?auto_36360 ) ) ( not ( = ?auto_36358 ?auto_36360 ) ) ( not ( = ?auto_36357 ?auto_36363 ) ) ( not ( = ?auto_36357 ?auto_36362 ) ) ( not ( = ?auto_36358 ?auto_36363 ) ) ( not ( = ?auto_36358 ?auto_36362 ) ) ( not ( = ?auto_36360 ?auto_36363 ) ) ( not ( = ?auto_36360 ?auto_36362 ) ) ( not ( = ?auto_36363 ?auto_36362 ) ) ( ON ?auto_36363 ?auto_36360 ) ( ON-TABLE ?auto_36361 ) ( not ( = ?auto_36361 ?auto_36359 ) ) ( not ( = ?auto_36361 ?auto_36362 ) ) ( not ( = ?auto_36359 ?auto_36362 ) ) ( not ( = ?auto_36357 ?auto_36359 ) ) ( not ( = ?auto_36357 ?auto_36361 ) ) ( not ( = ?auto_36358 ?auto_36359 ) ) ( not ( = ?auto_36358 ?auto_36361 ) ) ( not ( = ?auto_36360 ?auto_36359 ) ) ( not ( = ?auto_36360 ?auto_36361 ) ) ( not ( = ?auto_36363 ?auto_36359 ) ) ( not ( = ?auto_36363 ?auto_36361 ) ) ( ON ?auto_36362 ?auto_36363 ) ( CLEAR ?auto_36362 ) ( HOLDING ?auto_36359 ) ( CLEAR ?auto_36361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36361 ?auto_36359 )
      ( MAKE-2PILE ?auto_36357 ?auto_36358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37135 - BLOCK
      ?auto_37136 - BLOCK
    )
    :vars
    (
      ?auto_37139 - BLOCK
      ?auto_37137 - BLOCK
      ?auto_37140 - BLOCK
      ?auto_37138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37139 ?auto_37136 ) ( ON-TABLE ?auto_37135 ) ( ON ?auto_37136 ?auto_37135 ) ( not ( = ?auto_37135 ?auto_37136 ) ) ( not ( = ?auto_37135 ?auto_37139 ) ) ( not ( = ?auto_37136 ?auto_37139 ) ) ( not ( = ?auto_37135 ?auto_37137 ) ) ( not ( = ?auto_37135 ?auto_37140 ) ) ( not ( = ?auto_37136 ?auto_37137 ) ) ( not ( = ?auto_37136 ?auto_37140 ) ) ( not ( = ?auto_37139 ?auto_37137 ) ) ( not ( = ?auto_37139 ?auto_37140 ) ) ( not ( = ?auto_37137 ?auto_37140 ) ) ( ON ?auto_37137 ?auto_37139 ) ( not ( = ?auto_37138 ?auto_37140 ) ) ( not ( = ?auto_37135 ?auto_37138 ) ) ( not ( = ?auto_37136 ?auto_37138 ) ) ( not ( = ?auto_37139 ?auto_37138 ) ) ( not ( = ?auto_37137 ?auto_37138 ) ) ( ON ?auto_37140 ?auto_37137 ) ( ON ?auto_37138 ?auto_37140 ) ( CLEAR ?auto_37138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37135 ?auto_37136 ?auto_37139 ?auto_37137 ?auto_37140 )
      ( MAKE-2PILE ?auto_37135 ?auto_37136 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36371 - BLOCK
      ?auto_36372 - BLOCK
    )
    :vars
    (
      ?auto_36374 - BLOCK
      ?auto_36373 - BLOCK
      ?auto_36375 - BLOCK
      ?auto_36377 - BLOCK
      ?auto_36376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36374 ?auto_36372 ) ( ON-TABLE ?auto_36371 ) ( ON ?auto_36372 ?auto_36371 ) ( not ( = ?auto_36371 ?auto_36372 ) ) ( not ( = ?auto_36371 ?auto_36374 ) ) ( not ( = ?auto_36372 ?auto_36374 ) ) ( not ( = ?auto_36371 ?auto_36373 ) ) ( not ( = ?auto_36371 ?auto_36375 ) ) ( not ( = ?auto_36372 ?auto_36373 ) ) ( not ( = ?auto_36372 ?auto_36375 ) ) ( not ( = ?auto_36374 ?auto_36373 ) ) ( not ( = ?auto_36374 ?auto_36375 ) ) ( not ( = ?auto_36373 ?auto_36375 ) ) ( ON ?auto_36373 ?auto_36374 ) ( not ( = ?auto_36377 ?auto_36376 ) ) ( not ( = ?auto_36377 ?auto_36375 ) ) ( not ( = ?auto_36376 ?auto_36375 ) ) ( not ( = ?auto_36371 ?auto_36376 ) ) ( not ( = ?auto_36371 ?auto_36377 ) ) ( not ( = ?auto_36372 ?auto_36376 ) ) ( not ( = ?auto_36372 ?auto_36377 ) ) ( not ( = ?auto_36374 ?auto_36376 ) ) ( not ( = ?auto_36374 ?auto_36377 ) ) ( not ( = ?auto_36373 ?auto_36376 ) ) ( not ( = ?auto_36373 ?auto_36377 ) ) ( ON ?auto_36375 ?auto_36373 ) ( ON ?auto_36376 ?auto_36375 ) ( CLEAR ?auto_36376 ) ( HOLDING ?auto_36377 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36377 )
      ( MAKE-2PILE ?auto_36371 ?auto_36372 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36378 - BLOCK
      ?auto_36379 - BLOCK
    )
    :vars
    (
      ?auto_36381 - BLOCK
      ?auto_36384 - BLOCK
      ?auto_36383 - BLOCK
      ?auto_36382 - BLOCK
      ?auto_36380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36381 ?auto_36379 ) ( ON-TABLE ?auto_36378 ) ( ON ?auto_36379 ?auto_36378 ) ( not ( = ?auto_36378 ?auto_36379 ) ) ( not ( = ?auto_36378 ?auto_36381 ) ) ( not ( = ?auto_36379 ?auto_36381 ) ) ( not ( = ?auto_36378 ?auto_36384 ) ) ( not ( = ?auto_36378 ?auto_36383 ) ) ( not ( = ?auto_36379 ?auto_36384 ) ) ( not ( = ?auto_36379 ?auto_36383 ) ) ( not ( = ?auto_36381 ?auto_36384 ) ) ( not ( = ?auto_36381 ?auto_36383 ) ) ( not ( = ?auto_36384 ?auto_36383 ) ) ( ON ?auto_36384 ?auto_36381 ) ( not ( = ?auto_36382 ?auto_36380 ) ) ( not ( = ?auto_36382 ?auto_36383 ) ) ( not ( = ?auto_36380 ?auto_36383 ) ) ( not ( = ?auto_36378 ?auto_36380 ) ) ( not ( = ?auto_36378 ?auto_36382 ) ) ( not ( = ?auto_36379 ?auto_36380 ) ) ( not ( = ?auto_36379 ?auto_36382 ) ) ( not ( = ?auto_36381 ?auto_36380 ) ) ( not ( = ?auto_36381 ?auto_36382 ) ) ( not ( = ?auto_36384 ?auto_36380 ) ) ( not ( = ?auto_36384 ?auto_36382 ) ) ( ON ?auto_36383 ?auto_36384 ) ( ON ?auto_36380 ?auto_36383 ) ( ON ?auto_36382 ?auto_36380 ) ( CLEAR ?auto_36382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36378 ?auto_36379 ?auto_36381 ?auto_36384 ?auto_36383 ?auto_36380 )
      ( MAKE-2PILE ?auto_36378 ?auto_36379 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36390 - BLOCK
      ?auto_36391 - BLOCK
      ?auto_36392 - BLOCK
      ?auto_36393 - BLOCK
      ?auto_36394 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36394 ) ( CLEAR ?auto_36393 ) ( ON-TABLE ?auto_36390 ) ( ON ?auto_36391 ?auto_36390 ) ( ON ?auto_36392 ?auto_36391 ) ( ON ?auto_36393 ?auto_36392 ) ( not ( = ?auto_36390 ?auto_36391 ) ) ( not ( = ?auto_36390 ?auto_36392 ) ) ( not ( = ?auto_36390 ?auto_36393 ) ) ( not ( = ?auto_36390 ?auto_36394 ) ) ( not ( = ?auto_36391 ?auto_36392 ) ) ( not ( = ?auto_36391 ?auto_36393 ) ) ( not ( = ?auto_36391 ?auto_36394 ) ) ( not ( = ?auto_36392 ?auto_36393 ) ) ( not ( = ?auto_36392 ?auto_36394 ) ) ( not ( = ?auto_36393 ?auto_36394 ) ) )
    :subtasks
    ( ( !STACK ?auto_36394 ?auto_36393 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36395 - BLOCK
      ?auto_36396 - BLOCK
      ?auto_36397 - BLOCK
      ?auto_36398 - BLOCK
      ?auto_36399 - BLOCK
    )
    :vars
    (
      ?auto_36400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36398 ) ( ON-TABLE ?auto_36395 ) ( ON ?auto_36396 ?auto_36395 ) ( ON ?auto_36397 ?auto_36396 ) ( ON ?auto_36398 ?auto_36397 ) ( not ( = ?auto_36395 ?auto_36396 ) ) ( not ( = ?auto_36395 ?auto_36397 ) ) ( not ( = ?auto_36395 ?auto_36398 ) ) ( not ( = ?auto_36395 ?auto_36399 ) ) ( not ( = ?auto_36396 ?auto_36397 ) ) ( not ( = ?auto_36396 ?auto_36398 ) ) ( not ( = ?auto_36396 ?auto_36399 ) ) ( not ( = ?auto_36397 ?auto_36398 ) ) ( not ( = ?auto_36397 ?auto_36399 ) ) ( not ( = ?auto_36398 ?auto_36399 ) ) ( ON ?auto_36399 ?auto_36400 ) ( CLEAR ?auto_36399 ) ( HAND-EMPTY ) ( not ( = ?auto_36395 ?auto_36400 ) ) ( not ( = ?auto_36396 ?auto_36400 ) ) ( not ( = ?auto_36397 ?auto_36400 ) ) ( not ( = ?auto_36398 ?auto_36400 ) ) ( not ( = ?auto_36399 ?auto_36400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36399 ?auto_36400 )
      ( MAKE-5PILE ?auto_36395 ?auto_36396 ?auto_36397 ?auto_36398 ?auto_36399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36401 - BLOCK
      ?auto_36402 - BLOCK
      ?auto_36403 - BLOCK
      ?auto_36404 - BLOCK
      ?auto_36405 - BLOCK
    )
    :vars
    (
      ?auto_36406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36401 ) ( ON ?auto_36402 ?auto_36401 ) ( ON ?auto_36403 ?auto_36402 ) ( not ( = ?auto_36401 ?auto_36402 ) ) ( not ( = ?auto_36401 ?auto_36403 ) ) ( not ( = ?auto_36401 ?auto_36404 ) ) ( not ( = ?auto_36401 ?auto_36405 ) ) ( not ( = ?auto_36402 ?auto_36403 ) ) ( not ( = ?auto_36402 ?auto_36404 ) ) ( not ( = ?auto_36402 ?auto_36405 ) ) ( not ( = ?auto_36403 ?auto_36404 ) ) ( not ( = ?auto_36403 ?auto_36405 ) ) ( not ( = ?auto_36404 ?auto_36405 ) ) ( ON ?auto_36405 ?auto_36406 ) ( CLEAR ?auto_36405 ) ( not ( = ?auto_36401 ?auto_36406 ) ) ( not ( = ?auto_36402 ?auto_36406 ) ) ( not ( = ?auto_36403 ?auto_36406 ) ) ( not ( = ?auto_36404 ?auto_36406 ) ) ( not ( = ?auto_36405 ?auto_36406 ) ) ( HOLDING ?auto_36404 ) ( CLEAR ?auto_36403 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36401 ?auto_36402 ?auto_36403 ?auto_36404 )
      ( MAKE-5PILE ?auto_36401 ?auto_36402 ?auto_36403 ?auto_36404 ?auto_36405 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36407 - BLOCK
      ?auto_36408 - BLOCK
      ?auto_36409 - BLOCK
      ?auto_36410 - BLOCK
      ?auto_36411 - BLOCK
    )
    :vars
    (
      ?auto_36412 - BLOCK
      ?auto_36413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36407 ) ( ON ?auto_36408 ?auto_36407 ) ( ON ?auto_36409 ?auto_36408 ) ( not ( = ?auto_36407 ?auto_36408 ) ) ( not ( = ?auto_36407 ?auto_36409 ) ) ( not ( = ?auto_36407 ?auto_36410 ) ) ( not ( = ?auto_36407 ?auto_36411 ) ) ( not ( = ?auto_36408 ?auto_36409 ) ) ( not ( = ?auto_36408 ?auto_36410 ) ) ( not ( = ?auto_36408 ?auto_36411 ) ) ( not ( = ?auto_36409 ?auto_36410 ) ) ( not ( = ?auto_36409 ?auto_36411 ) ) ( not ( = ?auto_36410 ?auto_36411 ) ) ( ON ?auto_36411 ?auto_36412 ) ( not ( = ?auto_36407 ?auto_36412 ) ) ( not ( = ?auto_36408 ?auto_36412 ) ) ( not ( = ?auto_36409 ?auto_36412 ) ) ( not ( = ?auto_36410 ?auto_36412 ) ) ( not ( = ?auto_36411 ?auto_36412 ) ) ( CLEAR ?auto_36409 ) ( ON ?auto_36410 ?auto_36411 ) ( CLEAR ?auto_36410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36413 ) ( ON ?auto_36412 ?auto_36413 ) ( not ( = ?auto_36413 ?auto_36412 ) ) ( not ( = ?auto_36413 ?auto_36411 ) ) ( not ( = ?auto_36413 ?auto_36410 ) ) ( not ( = ?auto_36407 ?auto_36413 ) ) ( not ( = ?auto_36408 ?auto_36413 ) ) ( not ( = ?auto_36409 ?auto_36413 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36413 ?auto_36412 ?auto_36411 )
      ( MAKE-5PILE ?auto_36407 ?auto_36408 ?auto_36409 ?auto_36410 ?auto_36411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36414 - BLOCK
      ?auto_36415 - BLOCK
      ?auto_36416 - BLOCK
      ?auto_36417 - BLOCK
      ?auto_36418 - BLOCK
    )
    :vars
    (
      ?auto_36419 - BLOCK
      ?auto_36420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36414 ) ( ON ?auto_36415 ?auto_36414 ) ( not ( = ?auto_36414 ?auto_36415 ) ) ( not ( = ?auto_36414 ?auto_36416 ) ) ( not ( = ?auto_36414 ?auto_36417 ) ) ( not ( = ?auto_36414 ?auto_36418 ) ) ( not ( = ?auto_36415 ?auto_36416 ) ) ( not ( = ?auto_36415 ?auto_36417 ) ) ( not ( = ?auto_36415 ?auto_36418 ) ) ( not ( = ?auto_36416 ?auto_36417 ) ) ( not ( = ?auto_36416 ?auto_36418 ) ) ( not ( = ?auto_36417 ?auto_36418 ) ) ( ON ?auto_36418 ?auto_36419 ) ( not ( = ?auto_36414 ?auto_36419 ) ) ( not ( = ?auto_36415 ?auto_36419 ) ) ( not ( = ?auto_36416 ?auto_36419 ) ) ( not ( = ?auto_36417 ?auto_36419 ) ) ( not ( = ?auto_36418 ?auto_36419 ) ) ( ON ?auto_36417 ?auto_36418 ) ( CLEAR ?auto_36417 ) ( ON-TABLE ?auto_36420 ) ( ON ?auto_36419 ?auto_36420 ) ( not ( = ?auto_36420 ?auto_36419 ) ) ( not ( = ?auto_36420 ?auto_36418 ) ) ( not ( = ?auto_36420 ?auto_36417 ) ) ( not ( = ?auto_36414 ?auto_36420 ) ) ( not ( = ?auto_36415 ?auto_36420 ) ) ( not ( = ?auto_36416 ?auto_36420 ) ) ( HOLDING ?auto_36416 ) ( CLEAR ?auto_36415 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36414 ?auto_36415 ?auto_36416 )
      ( MAKE-5PILE ?auto_36414 ?auto_36415 ?auto_36416 ?auto_36417 ?auto_36418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36421 - BLOCK
      ?auto_36422 - BLOCK
      ?auto_36423 - BLOCK
      ?auto_36424 - BLOCK
      ?auto_36425 - BLOCK
    )
    :vars
    (
      ?auto_36426 - BLOCK
      ?auto_36427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36421 ) ( ON ?auto_36422 ?auto_36421 ) ( not ( = ?auto_36421 ?auto_36422 ) ) ( not ( = ?auto_36421 ?auto_36423 ) ) ( not ( = ?auto_36421 ?auto_36424 ) ) ( not ( = ?auto_36421 ?auto_36425 ) ) ( not ( = ?auto_36422 ?auto_36423 ) ) ( not ( = ?auto_36422 ?auto_36424 ) ) ( not ( = ?auto_36422 ?auto_36425 ) ) ( not ( = ?auto_36423 ?auto_36424 ) ) ( not ( = ?auto_36423 ?auto_36425 ) ) ( not ( = ?auto_36424 ?auto_36425 ) ) ( ON ?auto_36425 ?auto_36426 ) ( not ( = ?auto_36421 ?auto_36426 ) ) ( not ( = ?auto_36422 ?auto_36426 ) ) ( not ( = ?auto_36423 ?auto_36426 ) ) ( not ( = ?auto_36424 ?auto_36426 ) ) ( not ( = ?auto_36425 ?auto_36426 ) ) ( ON ?auto_36424 ?auto_36425 ) ( ON-TABLE ?auto_36427 ) ( ON ?auto_36426 ?auto_36427 ) ( not ( = ?auto_36427 ?auto_36426 ) ) ( not ( = ?auto_36427 ?auto_36425 ) ) ( not ( = ?auto_36427 ?auto_36424 ) ) ( not ( = ?auto_36421 ?auto_36427 ) ) ( not ( = ?auto_36422 ?auto_36427 ) ) ( not ( = ?auto_36423 ?auto_36427 ) ) ( CLEAR ?auto_36422 ) ( ON ?auto_36423 ?auto_36424 ) ( CLEAR ?auto_36423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36427 ?auto_36426 ?auto_36425 ?auto_36424 )
      ( MAKE-5PILE ?auto_36421 ?auto_36422 ?auto_36423 ?auto_36424 ?auto_36425 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36428 - BLOCK
      ?auto_36429 - BLOCK
      ?auto_36430 - BLOCK
      ?auto_36431 - BLOCK
      ?auto_36432 - BLOCK
    )
    :vars
    (
      ?auto_36433 - BLOCK
      ?auto_36434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36428 ) ( not ( = ?auto_36428 ?auto_36429 ) ) ( not ( = ?auto_36428 ?auto_36430 ) ) ( not ( = ?auto_36428 ?auto_36431 ) ) ( not ( = ?auto_36428 ?auto_36432 ) ) ( not ( = ?auto_36429 ?auto_36430 ) ) ( not ( = ?auto_36429 ?auto_36431 ) ) ( not ( = ?auto_36429 ?auto_36432 ) ) ( not ( = ?auto_36430 ?auto_36431 ) ) ( not ( = ?auto_36430 ?auto_36432 ) ) ( not ( = ?auto_36431 ?auto_36432 ) ) ( ON ?auto_36432 ?auto_36433 ) ( not ( = ?auto_36428 ?auto_36433 ) ) ( not ( = ?auto_36429 ?auto_36433 ) ) ( not ( = ?auto_36430 ?auto_36433 ) ) ( not ( = ?auto_36431 ?auto_36433 ) ) ( not ( = ?auto_36432 ?auto_36433 ) ) ( ON ?auto_36431 ?auto_36432 ) ( ON-TABLE ?auto_36434 ) ( ON ?auto_36433 ?auto_36434 ) ( not ( = ?auto_36434 ?auto_36433 ) ) ( not ( = ?auto_36434 ?auto_36432 ) ) ( not ( = ?auto_36434 ?auto_36431 ) ) ( not ( = ?auto_36428 ?auto_36434 ) ) ( not ( = ?auto_36429 ?auto_36434 ) ) ( not ( = ?auto_36430 ?auto_36434 ) ) ( ON ?auto_36430 ?auto_36431 ) ( CLEAR ?auto_36430 ) ( HOLDING ?auto_36429 ) ( CLEAR ?auto_36428 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36428 ?auto_36429 )
      ( MAKE-5PILE ?auto_36428 ?auto_36429 ?auto_36430 ?auto_36431 ?auto_36432 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36435 - BLOCK
      ?auto_36436 - BLOCK
      ?auto_36437 - BLOCK
      ?auto_36438 - BLOCK
      ?auto_36439 - BLOCK
    )
    :vars
    (
      ?auto_36441 - BLOCK
      ?auto_36440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36435 ) ( not ( = ?auto_36435 ?auto_36436 ) ) ( not ( = ?auto_36435 ?auto_36437 ) ) ( not ( = ?auto_36435 ?auto_36438 ) ) ( not ( = ?auto_36435 ?auto_36439 ) ) ( not ( = ?auto_36436 ?auto_36437 ) ) ( not ( = ?auto_36436 ?auto_36438 ) ) ( not ( = ?auto_36436 ?auto_36439 ) ) ( not ( = ?auto_36437 ?auto_36438 ) ) ( not ( = ?auto_36437 ?auto_36439 ) ) ( not ( = ?auto_36438 ?auto_36439 ) ) ( ON ?auto_36439 ?auto_36441 ) ( not ( = ?auto_36435 ?auto_36441 ) ) ( not ( = ?auto_36436 ?auto_36441 ) ) ( not ( = ?auto_36437 ?auto_36441 ) ) ( not ( = ?auto_36438 ?auto_36441 ) ) ( not ( = ?auto_36439 ?auto_36441 ) ) ( ON ?auto_36438 ?auto_36439 ) ( ON-TABLE ?auto_36440 ) ( ON ?auto_36441 ?auto_36440 ) ( not ( = ?auto_36440 ?auto_36441 ) ) ( not ( = ?auto_36440 ?auto_36439 ) ) ( not ( = ?auto_36440 ?auto_36438 ) ) ( not ( = ?auto_36435 ?auto_36440 ) ) ( not ( = ?auto_36436 ?auto_36440 ) ) ( not ( = ?auto_36437 ?auto_36440 ) ) ( ON ?auto_36437 ?auto_36438 ) ( CLEAR ?auto_36435 ) ( ON ?auto_36436 ?auto_36437 ) ( CLEAR ?auto_36436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36440 ?auto_36441 ?auto_36439 ?auto_36438 ?auto_36437 )
      ( MAKE-5PILE ?auto_36435 ?auto_36436 ?auto_36437 ?auto_36438 ?auto_36439 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36442 - BLOCK
      ?auto_36443 - BLOCK
      ?auto_36444 - BLOCK
      ?auto_36445 - BLOCK
      ?auto_36446 - BLOCK
    )
    :vars
    (
      ?auto_36448 - BLOCK
      ?auto_36447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36442 ?auto_36443 ) ) ( not ( = ?auto_36442 ?auto_36444 ) ) ( not ( = ?auto_36442 ?auto_36445 ) ) ( not ( = ?auto_36442 ?auto_36446 ) ) ( not ( = ?auto_36443 ?auto_36444 ) ) ( not ( = ?auto_36443 ?auto_36445 ) ) ( not ( = ?auto_36443 ?auto_36446 ) ) ( not ( = ?auto_36444 ?auto_36445 ) ) ( not ( = ?auto_36444 ?auto_36446 ) ) ( not ( = ?auto_36445 ?auto_36446 ) ) ( ON ?auto_36446 ?auto_36448 ) ( not ( = ?auto_36442 ?auto_36448 ) ) ( not ( = ?auto_36443 ?auto_36448 ) ) ( not ( = ?auto_36444 ?auto_36448 ) ) ( not ( = ?auto_36445 ?auto_36448 ) ) ( not ( = ?auto_36446 ?auto_36448 ) ) ( ON ?auto_36445 ?auto_36446 ) ( ON-TABLE ?auto_36447 ) ( ON ?auto_36448 ?auto_36447 ) ( not ( = ?auto_36447 ?auto_36448 ) ) ( not ( = ?auto_36447 ?auto_36446 ) ) ( not ( = ?auto_36447 ?auto_36445 ) ) ( not ( = ?auto_36442 ?auto_36447 ) ) ( not ( = ?auto_36443 ?auto_36447 ) ) ( not ( = ?auto_36444 ?auto_36447 ) ) ( ON ?auto_36444 ?auto_36445 ) ( ON ?auto_36443 ?auto_36444 ) ( CLEAR ?auto_36443 ) ( HOLDING ?auto_36442 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36442 )
      ( MAKE-5PILE ?auto_36442 ?auto_36443 ?auto_36444 ?auto_36445 ?auto_36446 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36449 - BLOCK
      ?auto_36450 - BLOCK
      ?auto_36451 - BLOCK
      ?auto_36452 - BLOCK
      ?auto_36453 - BLOCK
    )
    :vars
    (
      ?auto_36455 - BLOCK
      ?auto_36454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36449 ?auto_36450 ) ) ( not ( = ?auto_36449 ?auto_36451 ) ) ( not ( = ?auto_36449 ?auto_36452 ) ) ( not ( = ?auto_36449 ?auto_36453 ) ) ( not ( = ?auto_36450 ?auto_36451 ) ) ( not ( = ?auto_36450 ?auto_36452 ) ) ( not ( = ?auto_36450 ?auto_36453 ) ) ( not ( = ?auto_36451 ?auto_36452 ) ) ( not ( = ?auto_36451 ?auto_36453 ) ) ( not ( = ?auto_36452 ?auto_36453 ) ) ( ON ?auto_36453 ?auto_36455 ) ( not ( = ?auto_36449 ?auto_36455 ) ) ( not ( = ?auto_36450 ?auto_36455 ) ) ( not ( = ?auto_36451 ?auto_36455 ) ) ( not ( = ?auto_36452 ?auto_36455 ) ) ( not ( = ?auto_36453 ?auto_36455 ) ) ( ON ?auto_36452 ?auto_36453 ) ( ON-TABLE ?auto_36454 ) ( ON ?auto_36455 ?auto_36454 ) ( not ( = ?auto_36454 ?auto_36455 ) ) ( not ( = ?auto_36454 ?auto_36453 ) ) ( not ( = ?auto_36454 ?auto_36452 ) ) ( not ( = ?auto_36449 ?auto_36454 ) ) ( not ( = ?auto_36450 ?auto_36454 ) ) ( not ( = ?auto_36451 ?auto_36454 ) ) ( ON ?auto_36451 ?auto_36452 ) ( ON ?auto_36450 ?auto_36451 ) ( ON ?auto_36449 ?auto_36450 ) ( CLEAR ?auto_36449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36454 ?auto_36455 ?auto_36453 ?auto_36452 ?auto_36451 ?auto_36450 )
      ( MAKE-5PILE ?auto_36449 ?auto_36450 ?auto_36451 ?auto_36452 ?auto_36453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36457 - BLOCK
    )
    :vars
    (
      ?auto_36458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36458 ?auto_36457 ) ( CLEAR ?auto_36458 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36457 ) ( not ( = ?auto_36457 ?auto_36458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36458 ?auto_36457 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36459 - BLOCK
    )
    :vars
    (
      ?auto_36460 - BLOCK
      ?auto_36461 - BLOCK
      ?auto_36462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36460 ?auto_36459 ) ( CLEAR ?auto_36460 ) ( ON-TABLE ?auto_36459 ) ( not ( = ?auto_36459 ?auto_36460 ) ) ( HOLDING ?auto_36461 ) ( CLEAR ?auto_36462 ) ( not ( = ?auto_36459 ?auto_36461 ) ) ( not ( = ?auto_36459 ?auto_36462 ) ) ( not ( = ?auto_36460 ?auto_36461 ) ) ( not ( = ?auto_36460 ?auto_36462 ) ) ( not ( = ?auto_36461 ?auto_36462 ) ) )
    :subtasks
    ( ( !STACK ?auto_36461 ?auto_36462 )
      ( MAKE-1PILE ?auto_36459 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36463 - BLOCK
    )
    :vars
    (
      ?auto_36466 - BLOCK
      ?auto_36464 - BLOCK
      ?auto_36465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36466 ?auto_36463 ) ( ON-TABLE ?auto_36463 ) ( not ( = ?auto_36463 ?auto_36466 ) ) ( CLEAR ?auto_36464 ) ( not ( = ?auto_36463 ?auto_36465 ) ) ( not ( = ?auto_36463 ?auto_36464 ) ) ( not ( = ?auto_36466 ?auto_36465 ) ) ( not ( = ?auto_36466 ?auto_36464 ) ) ( not ( = ?auto_36465 ?auto_36464 ) ) ( ON ?auto_36465 ?auto_36466 ) ( CLEAR ?auto_36465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36463 ?auto_36466 )
      ( MAKE-1PILE ?auto_36463 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36467 - BLOCK
    )
    :vars
    (
      ?auto_36469 - BLOCK
      ?auto_36470 - BLOCK
      ?auto_36468 - BLOCK
      ?auto_36473 - BLOCK
      ?auto_36472 - BLOCK
      ?auto_36471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36469 ?auto_36467 ) ( ON-TABLE ?auto_36467 ) ( not ( = ?auto_36467 ?auto_36469 ) ) ( not ( = ?auto_36467 ?auto_36470 ) ) ( not ( = ?auto_36467 ?auto_36468 ) ) ( not ( = ?auto_36469 ?auto_36470 ) ) ( not ( = ?auto_36469 ?auto_36468 ) ) ( not ( = ?auto_36470 ?auto_36468 ) ) ( ON ?auto_36470 ?auto_36469 ) ( CLEAR ?auto_36470 ) ( HOLDING ?auto_36468 ) ( CLEAR ?auto_36473 ) ( ON-TABLE ?auto_36472 ) ( ON ?auto_36471 ?auto_36472 ) ( ON ?auto_36473 ?auto_36471 ) ( not ( = ?auto_36472 ?auto_36471 ) ) ( not ( = ?auto_36472 ?auto_36473 ) ) ( not ( = ?auto_36472 ?auto_36468 ) ) ( not ( = ?auto_36471 ?auto_36473 ) ) ( not ( = ?auto_36471 ?auto_36468 ) ) ( not ( = ?auto_36473 ?auto_36468 ) ) ( not ( = ?auto_36467 ?auto_36473 ) ) ( not ( = ?auto_36467 ?auto_36472 ) ) ( not ( = ?auto_36467 ?auto_36471 ) ) ( not ( = ?auto_36469 ?auto_36473 ) ) ( not ( = ?auto_36469 ?auto_36472 ) ) ( not ( = ?auto_36469 ?auto_36471 ) ) ( not ( = ?auto_36470 ?auto_36473 ) ) ( not ( = ?auto_36470 ?auto_36472 ) ) ( not ( = ?auto_36470 ?auto_36471 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36472 ?auto_36471 ?auto_36473 ?auto_36468 )
      ( MAKE-1PILE ?auto_36467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36474 - BLOCK
    )
    :vars
    (
      ?auto_36477 - BLOCK
      ?auto_36479 - BLOCK
      ?auto_36478 - BLOCK
      ?auto_36475 - BLOCK
      ?auto_36476 - BLOCK
      ?auto_36480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36477 ?auto_36474 ) ( ON-TABLE ?auto_36474 ) ( not ( = ?auto_36474 ?auto_36477 ) ) ( not ( = ?auto_36474 ?auto_36479 ) ) ( not ( = ?auto_36474 ?auto_36478 ) ) ( not ( = ?auto_36477 ?auto_36479 ) ) ( not ( = ?auto_36477 ?auto_36478 ) ) ( not ( = ?auto_36479 ?auto_36478 ) ) ( ON ?auto_36479 ?auto_36477 ) ( CLEAR ?auto_36475 ) ( ON-TABLE ?auto_36476 ) ( ON ?auto_36480 ?auto_36476 ) ( ON ?auto_36475 ?auto_36480 ) ( not ( = ?auto_36476 ?auto_36480 ) ) ( not ( = ?auto_36476 ?auto_36475 ) ) ( not ( = ?auto_36476 ?auto_36478 ) ) ( not ( = ?auto_36480 ?auto_36475 ) ) ( not ( = ?auto_36480 ?auto_36478 ) ) ( not ( = ?auto_36475 ?auto_36478 ) ) ( not ( = ?auto_36474 ?auto_36475 ) ) ( not ( = ?auto_36474 ?auto_36476 ) ) ( not ( = ?auto_36474 ?auto_36480 ) ) ( not ( = ?auto_36477 ?auto_36475 ) ) ( not ( = ?auto_36477 ?auto_36476 ) ) ( not ( = ?auto_36477 ?auto_36480 ) ) ( not ( = ?auto_36479 ?auto_36475 ) ) ( not ( = ?auto_36479 ?auto_36476 ) ) ( not ( = ?auto_36479 ?auto_36480 ) ) ( ON ?auto_36478 ?auto_36479 ) ( CLEAR ?auto_36478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36474 ?auto_36477 ?auto_36479 )
      ( MAKE-1PILE ?auto_36474 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36481 - BLOCK
    )
    :vars
    (
      ?auto_36486 - BLOCK
      ?auto_36483 - BLOCK
      ?auto_36485 - BLOCK
      ?auto_36482 - BLOCK
      ?auto_36484 - BLOCK
      ?auto_36487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36486 ?auto_36481 ) ( ON-TABLE ?auto_36481 ) ( not ( = ?auto_36481 ?auto_36486 ) ) ( not ( = ?auto_36481 ?auto_36483 ) ) ( not ( = ?auto_36481 ?auto_36485 ) ) ( not ( = ?auto_36486 ?auto_36483 ) ) ( not ( = ?auto_36486 ?auto_36485 ) ) ( not ( = ?auto_36483 ?auto_36485 ) ) ( ON ?auto_36483 ?auto_36486 ) ( ON-TABLE ?auto_36482 ) ( ON ?auto_36484 ?auto_36482 ) ( not ( = ?auto_36482 ?auto_36484 ) ) ( not ( = ?auto_36482 ?auto_36487 ) ) ( not ( = ?auto_36482 ?auto_36485 ) ) ( not ( = ?auto_36484 ?auto_36487 ) ) ( not ( = ?auto_36484 ?auto_36485 ) ) ( not ( = ?auto_36487 ?auto_36485 ) ) ( not ( = ?auto_36481 ?auto_36487 ) ) ( not ( = ?auto_36481 ?auto_36482 ) ) ( not ( = ?auto_36481 ?auto_36484 ) ) ( not ( = ?auto_36486 ?auto_36487 ) ) ( not ( = ?auto_36486 ?auto_36482 ) ) ( not ( = ?auto_36486 ?auto_36484 ) ) ( not ( = ?auto_36483 ?auto_36487 ) ) ( not ( = ?auto_36483 ?auto_36482 ) ) ( not ( = ?auto_36483 ?auto_36484 ) ) ( ON ?auto_36485 ?auto_36483 ) ( CLEAR ?auto_36485 ) ( HOLDING ?auto_36487 ) ( CLEAR ?auto_36484 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36482 ?auto_36484 ?auto_36487 )
      ( MAKE-1PILE ?auto_36481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36488 - BLOCK
    )
    :vars
    (
      ?auto_36493 - BLOCK
      ?auto_36490 - BLOCK
      ?auto_36494 - BLOCK
      ?auto_36492 - BLOCK
      ?auto_36489 - BLOCK
      ?auto_36491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36493 ?auto_36488 ) ( ON-TABLE ?auto_36488 ) ( not ( = ?auto_36488 ?auto_36493 ) ) ( not ( = ?auto_36488 ?auto_36490 ) ) ( not ( = ?auto_36488 ?auto_36494 ) ) ( not ( = ?auto_36493 ?auto_36490 ) ) ( not ( = ?auto_36493 ?auto_36494 ) ) ( not ( = ?auto_36490 ?auto_36494 ) ) ( ON ?auto_36490 ?auto_36493 ) ( ON-TABLE ?auto_36492 ) ( ON ?auto_36489 ?auto_36492 ) ( not ( = ?auto_36492 ?auto_36489 ) ) ( not ( = ?auto_36492 ?auto_36491 ) ) ( not ( = ?auto_36492 ?auto_36494 ) ) ( not ( = ?auto_36489 ?auto_36491 ) ) ( not ( = ?auto_36489 ?auto_36494 ) ) ( not ( = ?auto_36491 ?auto_36494 ) ) ( not ( = ?auto_36488 ?auto_36491 ) ) ( not ( = ?auto_36488 ?auto_36492 ) ) ( not ( = ?auto_36488 ?auto_36489 ) ) ( not ( = ?auto_36493 ?auto_36491 ) ) ( not ( = ?auto_36493 ?auto_36492 ) ) ( not ( = ?auto_36493 ?auto_36489 ) ) ( not ( = ?auto_36490 ?auto_36491 ) ) ( not ( = ?auto_36490 ?auto_36492 ) ) ( not ( = ?auto_36490 ?auto_36489 ) ) ( ON ?auto_36494 ?auto_36490 ) ( CLEAR ?auto_36489 ) ( ON ?auto_36491 ?auto_36494 ) ( CLEAR ?auto_36491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36488 ?auto_36493 ?auto_36490 ?auto_36494 )
      ( MAKE-1PILE ?auto_36488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36495 - BLOCK
    )
    :vars
    (
      ?auto_36498 - BLOCK
      ?auto_36497 - BLOCK
      ?auto_36501 - BLOCK
      ?auto_36499 - BLOCK
      ?auto_36500 - BLOCK
      ?auto_36496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36498 ?auto_36495 ) ( ON-TABLE ?auto_36495 ) ( not ( = ?auto_36495 ?auto_36498 ) ) ( not ( = ?auto_36495 ?auto_36497 ) ) ( not ( = ?auto_36495 ?auto_36501 ) ) ( not ( = ?auto_36498 ?auto_36497 ) ) ( not ( = ?auto_36498 ?auto_36501 ) ) ( not ( = ?auto_36497 ?auto_36501 ) ) ( ON ?auto_36497 ?auto_36498 ) ( ON-TABLE ?auto_36499 ) ( not ( = ?auto_36499 ?auto_36500 ) ) ( not ( = ?auto_36499 ?auto_36496 ) ) ( not ( = ?auto_36499 ?auto_36501 ) ) ( not ( = ?auto_36500 ?auto_36496 ) ) ( not ( = ?auto_36500 ?auto_36501 ) ) ( not ( = ?auto_36496 ?auto_36501 ) ) ( not ( = ?auto_36495 ?auto_36496 ) ) ( not ( = ?auto_36495 ?auto_36499 ) ) ( not ( = ?auto_36495 ?auto_36500 ) ) ( not ( = ?auto_36498 ?auto_36496 ) ) ( not ( = ?auto_36498 ?auto_36499 ) ) ( not ( = ?auto_36498 ?auto_36500 ) ) ( not ( = ?auto_36497 ?auto_36496 ) ) ( not ( = ?auto_36497 ?auto_36499 ) ) ( not ( = ?auto_36497 ?auto_36500 ) ) ( ON ?auto_36501 ?auto_36497 ) ( ON ?auto_36496 ?auto_36501 ) ( CLEAR ?auto_36496 ) ( HOLDING ?auto_36500 ) ( CLEAR ?auto_36499 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36499 ?auto_36500 )
      ( MAKE-1PILE ?auto_36495 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37348 - BLOCK
    )
    :vars
    (
      ?auto_37350 - BLOCK
      ?auto_37352 - BLOCK
      ?auto_37349 - BLOCK
      ?auto_37353 - BLOCK
      ?auto_37351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37350 ?auto_37348 ) ( ON-TABLE ?auto_37348 ) ( not ( = ?auto_37348 ?auto_37350 ) ) ( not ( = ?auto_37348 ?auto_37352 ) ) ( not ( = ?auto_37348 ?auto_37349 ) ) ( not ( = ?auto_37350 ?auto_37352 ) ) ( not ( = ?auto_37350 ?auto_37349 ) ) ( not ( = ?auto_37352 ?auto_37349 ) ) ( ON ?auto_37352 ?auto_37350 ) ( not ( = ?auto_37353 ?auto_37351 ) ) ( not ( = ?auto_37353 ?auto_37349 ) ) ( not ( = ?auto_37351 ?auto_37349 ) ) ( not ( = ?auto_37348 ?auto_37351 ) ) ( not ( = ?auto_37348 ?auto_37353 ) ) ( not ( = ?auto_37350 ?auto_37351 ) ) ( not ( = ?auto_37350 ?auto_37353 ) ) ( not ( = ?auto_37352 ?auto_37351 ) ) ( not ( = ?auto_37352 ?auto_37353 ) ) ( ON ?auto_37349 ?auto_37352 ) ( ON ?auto_37351 ?auto_37349 ) ( ON ?auto_37353 ?auto_37351 ) ( CLEAR ?auto_37353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37348 ?auto_37350 ?auto_37352 ?auto_37349 ?auto_37351 )
      ( MAKE-1PILE ?auto_37348 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36509 - BLOCK
    )
    :vars
    (
      ?auto_36512 - BLOCK
      ?auto_36515 - BLOCK
      ?auto_36514 - BLOCK
      ?auto_36511 - BLOCK
      ?auto_36510 - BLOCK
      ?auto_36513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36512 ?auto_36509 ) ( ON-TABLE ?auto_36509 ) ( not ( = ?auto_36509 ?auto_36512 ) ) ( not ( = ?auto_36509 ?auto_36515 ) ) ( not ( = ?auto_36509 ?auto_36514 ) ) ( not ( = ?auto_36512 ?auto_36515 ) ) ( not ( = ?auto_36512 ?auto_36514 ) ) ( not ( = ?auto_36515 ?auto_36514 ) ) ( ON ?auto_36515 ?auto_36512 ) ( not ( = ?auto_36511 ?auto_36510 ) ) ( not ( = ?auto_36511 ?auto_36513 ) ) ( not ( = ?auto_36511 ?auto_36514 ) ) ( not ( = ?auto_36510 ?auto_36513 ) ) ( not ( = ?auto_36510 ?auto_36514 ) ) ( not ( = ?auto_36513 ?auto_36514 ) ) ( not ( = ?auto_36509 ?auto_36513 ) ) ( not ( = ?auto_36509 ?auto_36511 ) ) ( not ( = ?auto_36509 ?auto_36510 ) ) ( not ( = ?auto_36512 ?auto_36513 ) ) ( not ( = ?auto_36512 ?auto_36511 ) ) ( not ( = ?auto_36512 ?auto_36510 ) ) ( not ( = ?auto_36515 ?auto_36513 ) ) ( not ( = ?auto_36515 ?auto_36511 ) ) ( not ( = ?auto_36515 ?auto_36510 ) ) ( ON ?auto_36514 ?auto_36515 ) ( ON ?auto_36513 ?auto_36514 ) ( ON ?auto_36510 ?auto_36513 ) ( CLEAR ?auto_36510 ) ( HOLDING ?auto_36511 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36511 )
      ( MAKE-1PILE ?auto_36509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36516 - BLOCK
    )
    :vars
    (
      ?auto_36518 - BLOCK
      ?auto_36522 - BLOCK
      ?auto_36521 - BLOCK
      ?auto_36519 - BLOCK
      ?auto_36520 - BLOCK
      ?auto_36517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36518 ?auto_36516 ) ( ON-TABLE ?auto_36516 ) ( not ( = ?auto_36516 ?auto_36518 ) ) ( not ( = ?auto_36516 ?auto_36522 ) ) ( not ( = ?auto_36516 ?auto_36521 ) ) ( not ( = ?auto_36518 ?auto_36522 ) ) ( not ( = ?auto_36518 ?auto_36521 ) ) ( not ( = ?auto_36522 ?auto_36521 ) ) ( ON ?auto_36522 ?auto_36518 ) ( not ( = ?auto_36519 ?auto_36520 ) ) ( not ( = ?auto_36519 ?auto_36517 ) ) ( not ( = ?auto_36519 ?auto_36521 ) ) ( not ( = ?auto_36520 ?auto_36517 ) ) ( not ( = ?auto_36520 ?auto_36521 ) ) ( not ( = ?auto_36517 ?auto_36521 ) ) ( not ( = ?auto_36516 ?auto_36517 ) ) ( not ( = ?auto_36516 ?auto_36519 ) ) ( not ( = ?auto_36516 ?auto_36520 ) ) ( not ( = ?auto_36518 ?auto_36517 ) ) ( not ( = ?auto_36518 ?auto_36519 ) ) ( not ( = ?auto_36518 ?auto_36520 ) ) ( not ( = ?auto_36522 ?auto_36517 ) ) ( not ( = ?auto_36522 ?auto_36519 ) ) ( not ( = ?auto_36522 ?auto_36520 ) ) ( ON ?auto_36521 ?auto_36522 ) ( ON ?auto_36517 ?auto_36521 ) ( ON ?auto_36520 ?auto_36517 ) ( ON ?auto_36519 ?auto_36520 ) ( CLEAR ?auto_36519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36516 ?auto_36518 ?auto_36522 ?auto_36521 ?auto_36517 ?auto_36520 )
      ( MAKE-1PILE ?auto_36516 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36529 - BLOCK
      ?auto_36530 - BLOCK
      ?auto_36531 - BLOCK
      ?auto_36532 - BLOCK
      ?auto_36533 - BLOCK
      ?auto_36534 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_36534 ) ( CLEAR ?auto_36533 ) ( ON-TABLE ?auto_36529 ) ( ON ?auto_36530 ?auto_36529 ) ( ON ?auto_36531 ?auto_36530 ) ( ON ?auto_36532 ?auto_36531 ) ( ON ?auto_36533 ?auto_36532 ) ( not ( = ?auto_36529 ?auto_36530 ) ) ( not ( = ?auto_36529 ?auto_36531 ) ) ( not ( = ?auto_36529 ?auto_36532 ) ) ( not ( = ?auto_36529 ?auto_36533 ) ) ( not ( = ?auto_36529 ?auto_36534 ) ) ( not ( = ?auto_36530 ?auto_36531 ) ) ( not ( = ?auto_36530 ?auto_36532 ) ) ( not ( = ?auto_36530 ?auto_36533 ) ) ( not ( = ?auto_36530 ?auto_36534 ) ) ( not ( = ?auto_36531 ?auto_36532 ) ) ( not ( = ?auto_36531 ?auto_36533 ) ) ( not ( = ?auto_36531 ?auto_36534 ) ) ( not ( = ?auto_36532 ?auto_36533 ) ) ( not ( = ?auto_36532 ?auto_36534 ) ) ( not ( = ?auto_36533 ?auto_36534 ) ) )
    :subtasks
    ( ( !STACK ?auto_36534 ?auto_36533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36535 - BLOCK
      ?auto_36536 - BLOCK
      ?auto_36537 - BLOCK
      ?auto_36538 - BLOCK
      ?auto_36539 - BLOCK
      ?auto_36540 - BLOCK
    )
    :vars
    (
      ?auto_36541 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36539 ) ( ON-TABLE ?auto_36535 ) ( ON ?auto_36536 ?auto_36535 ) ( ON ?auto_36537 ?auto_36536 ) ( ON ?auto_36538 ?auto_36537 ) ( ON ?auto_36539 ?auto_36538 ) ( not ( = ?auto_36535 ?auto_36536 ) ) ( not ( = ?auto_36535 ?auto_36537 ) ) ( not ( = ?auto_36535 ?auto_36538 ) ) ( not ( = ?auto_36535 ?auto_36539 ) ) ( not ( = ?auto_36535 ?auto_36540 ) ) ( not ( = ?auto_36536 ?auto_36537 ) ) ( not ( = ?auto_36536 ?auto_36538 ) ) ( not ( = ?auto_36536 ?auto_36539 ) ) ( not ( = ?auto_36536 ?auto_36540 ) ) ( not ( = ?auto_36537 ?auto_36538 ) ) ( not ( = ?auto_36537 ?auto_36539 ) ) ( not ( = ?auto_36537 ?auto_36540 ) ) ( not ( = ?auto_36538 ?auto_36539 ) ) ( not ( = ?auto_36538 ?auto_36540 ) ) ( not ( = ?auto_36539 ?auto_36540 ) ) ( ON ?auto_36540 ?auto_36541 ) ( CLEAR ?auto_36540 ) ( HAND-EMPTY ) ( not ( = ?auto_36535 ?auto_36541 ) ) ( not ( = ?auto_36536 ?auto_36541 ) ) ( not ( = ?auto_36537 ?auto_36541 ) ) ( not ( = ?auto_36538 ?auto_36541 ) ) ( not ( = ?auto_36539 ?auto_36541 ) ) ( not ( = ?auto_36540 ?auto_36541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36540 ?auto_36541 )
      ( MAKE-6PILE ?auto_36535 ?auto_36536 ?auto_36537 ?auto_36538 ?auto_36539 ?auto_36540 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36542 - BLOCK
      ?auto_36543 - BLOCK
      ?auto_36544 - BLOCK
      ?auto_36545 - BLOCK
      ?auto_36546 - BLOCK
      ?auto_36547 - BLOCK
    )
    :vars
    (
      ?auto_36548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36542 ) ( ON ?auto_36543 ?auto_36542 ) ( ON ?auto_36544 ?auto_36543 ) ( ON ?auto_36545 ?auto_36544 ) ( not ( = ?auto_36542 ?auto_36543 ) ) ( not ( = ?auto_36542 ?auto_36544 ) ) ( not ( = ?auto_36542 ?auto_36545 ) ) ( not ( = ?auto_36542 ?auto_36546 ) ) ( not ( = ?auto_36542 ?auto_36547 ) ) ( not ( = ?auto_36543 ?auto_36544 ) ) ( not ( = ?auto_36543 ?auto_36545 ) ) ( not ( = ?auto_36543 ?auto_36546 ) ) ( not ( = ?auto_36543 ?auto_36547 ) ) ( not ( = ?auto_36544 ?auto_36545 ) ) ( not ( = ?auto_36544 ?auto_36546 ) ) ( not ( = ?auto_36544 ?auto_36547 ) ) ( not ( = ?auto_36545 ?auto_36546 ) ) ( not ( = ?auto_36545 ?auto_36547 ) ) ( not ( = ?auto_36546 ?auto_36547 ) ) ( ON ?auto_36547 ?auto_36548 ) ( CLEAR ?auto_36547 ) ( not ( = ?auto_36542 ?auto_36548 ) ) ( not ( = ?auto_36543 ?auto_36548 ) ) ( not ( = ?auto_36544 ?auto_36548 ) ) ( not ( = ?auto_36545 ?auto_36548 ) ) ( not ( = ?auto_36546 ?auto_36548 ) ) ( not ( = ?auto_36547 ?auto_36548 ) ) ( HOLDING ?auto_36546 ) ( CLEAR ?auto_36545 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36542 ?auto_36543 ?auto_36544 ?auto_36545 ?auto_36546 )
      ( MAKE-6PILE ?auto_36542 ?auto_36543 ?auto_36544 ?auto_36545 ?auto_36546 ?auto_36547 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36549 - BLOCK
      ?auto_36550 - BLOCK
      ?auto_36551 - BLOCK
      ?auto_36552 - BLOCK
      ?auto_36553 - BLOCK
      ?auto_36554 - BLOCK
    )
    :vars
    (
      ?auto_36555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36549 ) ( ON ?auto_36550 ?auto_36549 ) ( ON ?auto_36551 ?auto_36550 ) ( ON ?auto_36552 ?auto_36551 ) ( not ( = ?auto_36549 ?auto_36550 ) ) ( not ( = ?auto_36549 ?auto_36551 ) ) ( not ( = ?auto_36549 ?auto_36552 ) ) ( not ( = ?auto_36549 ?auto_36553 ) ) ( not ( = ?auto_36549 ?auto_36554 ) ) ( not ( = ?auto_36550 ?auto_36551 ) ) ( not ( = ?auto_36550 ?auto_36552 ) ) ( not ( = ?auto_36550 ?auto_36553 ) ) ( not ( = ?auto_36550 ?auto_36554 ) ) ( not ( = ?auto_36551 ?auto_36552 ) ) ( not ( = ?auto_36551 ?auto_36553 ) ) ( not ( = ?auto_36551 ?auto_36554 ) ) ( not ( = ?auto_36552 ?auto_36553 ) ) ( not ( = ?auto_36552 ?auto_36554 ) ) ( not ( = ?auto_36553 ?auto_36554 ) ) ( ON ?auto_36554 ?auto_36555 ) ( not ( = ?auto_36549 ?auto_36555 ) ) ( not ( = ?auto_36550 ?auto_36555 ) ) ( not ( = ?auto_36551 ?auto_36555 ) ) ( not ( = ?auto_36552 ?auto_36555 ) ) ( not ( = ?auto_36553 ?auto_36555 ) ) ( not ( = ?auto_36554 ?auto_36555 ) ) ( CLEAR ?auto_36552 ) ( ON ?auto_36553 ?auto_36554 ) ( CLEAR ?auto_36553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36555 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36555 ?auto_36554 )
      ( MAKE-6PILE ?auto_36549 ?auto_36550 ?auto_36551 ?auto_36552 ?auto_36553 ?auto_36554 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36556 - BLOCK
      ?auto_36557 - BLOCK
      ?auto_36558 - BLOCK
      ?auto_36559 - BLOCK
      ?auto_36560 - BLOCK
      ?auto_36561 - BLOCK
    )
    :vars
    (
      ?auto_36562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36556 ) ( ON ?auto_36557 ?auto_36556 ) ( ON ?auto_36558 ?auto_36557 ) ( not ( = ?auto_36556 ?auto_36557 ) ) ( not ( = ?auto_36556 ?auto_36558 ) ) ( not ( = ?auto_36556 ?auto_36559 ) ) ( not ( = ?auto_36556 ?auto_36560 ) ) ( not ( = ?auto_36556 ?auto_36561 ) ) ( not ( = ?auto_36557 ?auto_36558 ) ) ( not ( = ?auto_36557 ?auto_36559 ) ) ( not ( = ?auto_36557 ?auto_36560 ) ) ( not ( = ?auto_36557 ?auto_36561 ) ) ( not ( = ?auto_36558 ?auto_36559 ) ) ( not ( = ?auto_36558 ?auto_36560 ) ) ( not ( = ?auto_36558 ?auto_36561 ) ) ( not ( = ?auto_36559 ?auto_36560 ) ) ( not ( = ?auto_36559 ?auto_36561 ) ) ( not ( = ?auto_36560 ?auto_36561 ) ) ( ON ?auto_36561 ?auto_36562 ) ( not ( = ?auto_36556 ?auto_36562 ) ) ( not ( = ?auto_36557 ?auto_36562 ) ) ( not ( = ?auto_36558 ?auto_36562 ) ) ( not ( = ?auto_36559 ?auto_36562 ) ) ( not ( = ?auto_36560 ?auto_36562 ) ) ( not ( = ?auto_36561 ?auto_36562 ) ) ( ON ?auto_36560 ?auto_36561 ) ( CLEAR ?auto_36560 ) ( ON-TABLE ?auto_36562 ) ( HOLDING ?auto_36559 ) ( CLEAR ?auto_36558 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36556 ?auto_36557 ?auto_36558 ?auto_36559 )
      ( MAKE-6PILE ?auto_36556 ?auto_36557 ?auto_36558 ?auto_36559 ?auto_36560 ?auto_36561 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36563 - BLOCK
      ?auto_36564 - BLOCK
      ?auto_36565 - BLOCK
      ?auto_36566 - BLOCK
      ?auto_36567 - BLOCK
      ?auto_36568 - BLOCK
    )
    :vars
    (
      ?auto_36569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36563 ) ( ON ?auto_36564 ?auto_36563 ) ( ON ?auto_36565 ?auto_36564 ) ( not ( = ?auto_36563 ?auto_36564 ) ) ( not ( = ?auto_36563 ?auto_36565 ) ) ( not ( = ?auto_36563 ?auto_36566 ) ) ( not ( = ?auto_36563 ?auto_36567 ) ) ( not ( = ?auto_36563 ?auto_36568 ) ) ( not ( = ?auto_36564 ?auto_36565 ) ) ( not ( = ?auto_36564 ?auto_36566 ) ) ( not ( = ?auto_36564 ?auto_36567 ) ) ( not ( = ?auto_36564 ?auto_36568 ) ) ( not ( = ?auto_36565 ?auto_36566 ) ) ( not ( = ?auto_36565 ?auto_36567 ) ) ( not ( = ?auto_36565 ?auto_36568 ) ) ( not ( = ?auto_36566 ?auto_36567 ) ) ( not ( = ?auto_36566 ?auto_36568 ) ) ( not ( = ?auto_36567 ?auto_36568 ) ) ( ON ?auto_36568 ?auto_36569 ) ( not ( = ?auto_36563 ?auto_36569 ) ) ( not ( = ?auto_36564 ?auto_36569 ) ) ( not ( = ?auto_36565 ?auto_36569 ) ) ( not ( = ?auto_36566 ?auto_36569 ) ) ( not ( = ?auto_36567 ?auto_36569 ) ) ( not ( = ?auto_36568 ?auto_36569 ) ) ( ON ?auto_36567 ?auto_36568 ) ( ON-TABLE ?auto_36569 ) ( CLEAR ?auto_36565 ) ( ON ?auto_36566 ?auto_36567 ) ( CLEAR ?auto_36566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36569 ?auto_36568 ?auto_36567 )
      ( MAKE-6PILE ?auto_36563 ?auto_36564 ?auto_36565 ?auto_36566 ?auto_36567 ?auto_36568 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36570 - BLOCK
      ?auto_36571 - BLOCK
      ?auto_36572 - BLOCK
      ?auto_36573 - BLOCK
      ?auto_36574 - BLOCK
      ?auto_36575 - BLOCK
    )
    :vars
    (
      ?auto_36576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36570 ) ( ON ?auto_36571 ?auto_36570 ) ( not ( = ?auto_36570 ?auto_36571 ) ) ( not ( = ?auto_36570 ?auto_36572 ) ) ( not ( = ?auto_36570 ?auto_36573 ) ) ( not ( = ?auto_36570 ?auto_36574 ) ) ( not ( = ?auto_36570 ?auto_36575 ) ) ( not ( = ?auto_36571 ?auto_36572 ) ) ( not ( = ?auto_36571 ?auto_36573 ) ) ( not ( = ?auto_36571 ?auto_36574 ) ) ( not ( = ?auto_36571 ?auto_36575 ) ) ( not ( = ?auto_36572 ?auto_36573 ) ) ( not ( = ?auto_36572 ?auto_36574 ) ) ( not ( = ?auto_36572 ?auto_36575 ) ) ( not ( = ?auto_36573 ?auto_36574 ) ) ( not ( = ?auto_36573 ?auto_36575 ) ) ( not ( = ?auto_36574 ?auto_36575 ) ) ( ON ?auto_36575 ?auto_36576 ) ( not ( = ?auto_36570 ?auto_36576 ) ) ( not ( = ?auto_36571 ?auto_36576 ) ) ( not ( = ?auto_36572 ?auto_36576 ) ) ( not ( = ?auto_36573 ?auto_36576 ) ) ( not ( = ?auto_36574 ?auto_36576 ) ) ( not ( = ?auto_36575 ?auto_36576 ) ) ( ON ?auto_36574 ?auto_36575 ) ( ON-TABLE ?auto_36576 ) ( ON ?auto_36573 ?auto_36574 ) ( CLEAR ?auto_36573 ) ( HOLDING ?auto_36572 ) ( CLEAR ?auto_36571 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36570 ?auto_36571 ?auto_36572 )
      ( MAKE-6PILE ?auto_36570 ?auto_36571 ?auto_36572 ?auto_36573 ?auto_36574 ?auto_36575 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36577 - BLOCK
      ?auto_36578 - BLOCK
      ?auto_36579 - BLOCK
      ?auto_36580 - BLOCK
      ?auto_36581 - BLOCK
      ?auto_36582 - BLOCK
    )
    :vars
    (
      ?auto_36583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36577 ) ( ON ?auto_36578 ?auto_36577 ) ( not ( = ?auto_36577 ?auto_36578 ) ) ( not ( = ?auto_36577 ?auto_36579 ) ) ( not ( = ?auto_36577 ?auto_36580 ) ) ( not ( = ?auto_36577 ?auto_36581 ) ) ( not ( = ?auto_36577 ?auto_36582 ) ) ( not ( = ?auto_36578 ?auto_36579 ) ) ( not ( = ?auto_36578 ?auto_36580 ) ) ( not ( = ?auto_36578 ?auto_36581 ) ) ( not ( = ?auto_36578 ?auto_36582 ) ) ( not ( = ?auto_36579 ?auto_36580 ) ) ( not ( = ?auto_36579 ?auto_36581 ) ) ( not ( = ?auto_36579 ?auto_36582 ) ) ( not ( = ?auto_36580 ?auto_36581 ) ) ( not ( = ?auto_36580 ?auto_36582 ) ) ( not ( = ?auto_36581 ?auto_36582 ) ) ( ON ?auto_36582 ?auto_36583 ) ( not ( = ?auto_36577 ?auto_36583 ) ) ( not ( = ?auto_36578 ?auto_36583 ) ) ( not ( = ?auto_36579 ?auto_36583 ) ) ( not ( = ?auto_36580 ?auto_36583 ) ) ( not ( = ?auto_36581 ?auto_36583 ) ) ( not ( = ?auto_36582 ?auto_36583 ) ) ( ON ?auto_36581 ?auto_36582 ) ( ON-TABLE ?auto_36583 ) ( ON ?auto_36580 ?auto_36581 ) ( CLEAR ?auto_36578 ) ( ON ?auto_36579 ?auto_36580 ) ( CLEAR ?auto_36579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36583 ?auto_36582 ?auto_36581 ?auto_36580 )
      ( MAKE-6PILE ?auto_36577 ?auto_36578 ?auto_36579 ?auto_36580 ?auto_36581 ?auto_36582 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36584 - BLOCK
      ?auto_36585 - BLOCK
      ?auto_36586 - BLOCK
      ?auto_36587 - BLOCK
      ?auto_36588 - BLOCK
      ?auto_36589 - BLOCK
    )
    :vars
    (
      ?auto_36590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36584 ) ( not ( = ?auto_36584 ?auto_36585 ) ) ( not ( = ?auto_36584 ?auto_36586 ) ) ( not ( = ?auto_36584 ?auto_36587 ) ) ( not ( = ?auto_36584 ?auto_36588 ) ) ( not ( = ?auto_36584 ?auto_36589 ) ) ( not ( = ?auto_36585 ?auto_36586 ) ) ( not ( = ?auto_36585 ?auto_36587 ) ) ( not ( = ?auto_36585 ?auto_36588 ) ) ( not ( = ?auto_36585 ?auto_36589 ) ) ( not ( = ?auto_36586 ?auto_36587 ) ) ( not ( = ?auto_36586 ?auto_36588 ) ) ( not ( = ?auto_36586 ?auto_36589 ) ) ( not ( = ?auto_36587 ?auto_36588 ) ) ( not ( = ?auto_36587 ?auto_36589 ) ) ( not ( = ?auto_36588 ?auto_36589 ) ) ( ON ?auto_36589 ?auto_36590 ) ( not ( = ?auto_36584 ?auto_36590 ) ) ( not ( = ?auto_36585 ?auto_36590 ) ) ( not ( = ?auto_36586 ?auto_36590 ) ) ( not ( = ?auto_36587 ?auto_36590 ) ) ( not ( = ?auto_36588 ?auto_36590 ) ) ( not ( = ?auto_36589 ?auto_36590 ) ) ( ON ?auto_36588 ?auto_36589 ) ( ON-TABLE ?auto_36590 ) ( ON ?auto_36587 ?auto_36588 ) ( ON ?auto_36586 ?auto_36587 ) ( CLEAR ?auto_36586 ) ( HOLDING ?auto_36585 ) ( CLEAR ?auto_36584 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36584 ?auto_36585 )
      ( MAKE-6PILE ?auto_36584 ?auto_36585 ?auto_36586 ?auto_36587 ?auto_36588 ?auto_36589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36591 - BLOCK
      ?auto_36592 - BLOCK
      ?auto_36593 - BLOCK
      ?auto_36594 - BLOCK
      ?auto_36595 - BLOCK
      ?auto_36596 - BLOCK
    )
    :vars
    (
      ?auto_36597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36591 ) ( not ( = ?auto_36591 ?auto_36592 ) ) ( not ( = ?auto_36591 ?auto_36593 ) ) ( not ( = ?auto_36591 ?auto_36594 ) ) ( not ( = ?auto_36591 ?auto_36595 ) ) ( not ( = ?auto_36591 ?auto_36596 ) ) ( not ( = ?auto_36592 ?auto_36593 ) ) ( not ( = ?auto_36592 ?auto_36594 ) ) ( not ( = ?auto_36592 ?auto_36595 ) ) ( not ( = ?auto_36592 ?auto_36596 ) ) ( not ( = ?auto_36593 ?auto_36594 ) ) ( not ( = ?auto_36593 ?auto_36595 ) ) ( not ( = ?auto_36593 ?auto_36596 ) ) ( not ( = ?auto_36594 ?auto_36595 ) ) ( not ( = ?auto_36594 ?auto_36596 ) ) ( not ( = ?auto_36595 ?auto_36596 ) ) ( ON ?auto_36596 ?auto_36597 ) ( not ( = ?auto_36591 ?auto_36597 ) ) ( not ( = ?auto_36592 ?auto_36597 ) ) ( not ( = ?auto_36593 ?auto_36597 ) ) ( not ( = ?auto_36594 ?auto_36597 ) ) ( not ( = ?auto_36595 ?auto_36597 ) ) ( not ( = ?auto_36596 ?auto_36597 ) ) ( ON ?auto_36595 ?auto_36596 ) ( ON-TABLE ?auto_36597 ) ( ON ?auto_36594 ?auto_36595 ) ( ON ?auto_36593 ?auto_36594 ) ( CLEAR ?auto_36591 ) ( ON ?auto_36592 ?auto_36593 ) ( CLEAR ?auto_36592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36597 ?auto_36596 ?auto_36595 ?auto_36594 ?auto_36593 )
      ( MAKE-6PILE ?auto_36591 ?auto_36592 ?auto_36593 ?auto_36594 ?auto_36595 ?auto_36596 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36598 - BLOCK
      ?auto_36599 - BLOCK
      ?auto_36600 - BLOCK
      ?auto_36601 - BLOCK
      ?auto_36602 - BLOCK
      ?auto_36603 - BLOCK
    )
    :vars
    (
      ?auto_36604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36598 ?auto_36599 ) ) ( not ( = ?auto_36598 ?auto_36600 ) ) ( not ( = ?auto_36598 ?auto_36601 ) ) ( not ( = ?auto_36598 ?auto_36602 ) ) ( not ( = ?auto_36598 ?auto_36603 ) ) ( not ( = ?auto_36599 ?auto_36600 ) ) ( not ( = ?auto_36599 ?auto_36601 ) ) ( not ( = ?auto_36599 ?auto_36602 ) ) ( not ( = ?auto_36599 ?auto_36603 ) ) ( not ( = ?auto_36600 ?auto_36601 ) ) ( not ( = ?auto_36600 ?auto_36602 ) ) ( not ( = ?auto_36600 ?auto_36603 ) ) ( not ( = ?auto_36601 ?auto_36602 ) ) ( not ( = ?auto_36601 ?auto_36603 ) ) ( not ( = ?auto_36602 ?auto_36603 ) ) ( ON ?auto_36603 ?auto_36604 ) ( not ( = ?auto_36598 ?auto_36604 ) ) ( not ( = ?auto_36599 ?auto_36604 ) ) ( not ( = ?auto_36600 ?auto_36604 ) ) ( not ( = ?auto_36601 ?auto_36604 ) ) ( not ( = ?auto_36602 ?auto_36604 ) ) ( not ( = ?auto_36603 ?auto_36604 ) ) ( ON ?auto_36602 ?auto_36603 ) ( ON-TABLE ?auto_36604 ) ( ON ?auto_36601 ?auto_36602 ) ( ON ?auto_36600 ?auto_36601 ) ( ON ?auto_36599 ?auto_36600 ) ( CLEAR ?auto_36599 ) ( HOLDING ?auto_36598 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36598 )
      ( MAKE-6PILE ?auto_36598 ?auto_36599 ?auto_36600 ?auto_36601 ?auto_36602 ?auto_36603 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36605 - BLOCK
      ?auto_36606 - BLOCK
      ?auto_36607 - BLOCK
      ?auto_36608 - BLOCK
      ?auto_36609 - BLOCK
      ?auto_36610 - BLOCK
    )
    :vars
    (
      ?auto_36611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36605 ?auto_36606 ) ) ( not ( = ?auto_36605 ?auto_36607 ) ) ( not ( = ?auto_36605 ?auto_36608 ) ) ( not ( = ?auto_36605 ?auto_36609 ) ) ( not ( = ?auto_36605 ?auto_36610 ) ) ( not ( = ?auto_36606 ?auto_36607 ) ) ( not ( = ?auto_36606 ?auto_36608 ) ) ( not ( = ?auto_36606 ?auto_36609 ) ) ( not ( = ?auto_36606 ?auto_36610 ) ) ( not ( = ?auto_36607 ?auto_36608 ) ) ( not ( = ?auto_36607 ?auto_36609 ) ) ( not ( = ?auto_36607 ?auto_36610 ) ) ( not ( = ?auto_36608 ?auto_36609 ) ) ( not ( = ?auto_36608 ?auto_36610 ) ) ( not ( = ?auto_36609 ?auto_36610 ) ) ( ON ?auto_36610 ?auto_36611 ) ( not ( = ?auto_36605 ?auto_36611 ) ) ( not ( = ?auto_36606 ?auto_36611 ) ) ( not ( = ?auto_36607 ?auto_36611 ) ) ( not ( = ?auto_36608 ?auto_36611 ) ) ( not ( = ?auto_36609 ?auto_36611 ) ) ( not ( = ?auto_36610 ?auto_36611 ) ) ( ON ?auto_36609 ?auto_36610 ) ( ON-TABLE ?auto_36611 ) ( ON ?auto_36608 ?auto_36609 ) ( ON ?auto_36607 ?auto_36608 ) ( ON ?auto_36606 ?auto_36607 ) ( ON ?auto_36605 ?auto_36606 ) ( CLEAR ?auto_36605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36611 ?auto_36610 ?auto_36609 ?auto_36608 ?auto_36607 ?auto_36606 )
      ( MAKE-6PILE ?auto_36605 ?auto_36606 ?auto_36607 ?auto_36608 ?auto_36609 ?auto_36610 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36692 - BLOCK
    )
    :vars
    (
      ?auto_36693 - BLOCK
      ?auto_36694 - BLOCK
      ?auto_36695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36692 ?auto_36693 ) ( CLEAR ?auto_36692 ) ( not ( = ?auto_36692 ?auto_36693 ) ) ( HOLDING ?auto_36694 ) ( CLEAR ?auto_36695 ) ( not ( = ?auto_36692 ?auto_36694 ) ) ( not ( = ?auto_36692 ?auto_36695 ) ) ( not ( = ?auto_36693 ?auto_36694 ) ) ( not ( = ?auto_36693 ?auto_36695 ) ) ( not ( = ?auto_36694 ?auto_36695 ) ) )
    :subtasks
    ( ( !STACK ?auto_36694 ?auto_36695 )
      ( MAKE-1PILE ?auto_36692 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36696 - BLOCK
    )
    :vars
    (
      ?auto_36698 - BLOCK
      ?auto_36697 - BLOCK
      ?auto_36699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36696 ?auto_36698 ) ( not ( = ?auto_36696 ?auto_36698 ) ) ( CLEAR ?auto_36697 ) ( not ( = ?auto_36696 ?auto_36699 ) ) ( not ( = ?auto_36696 ?auto_36697 ) ) ( not ( = ?auto_36698 ?auto_36699 ) ) ( not ( = ?auto_36698 ?auto_36697 ) ) ( not ( = ?auto_36699 ?auto_36697 ) ) ( ON ?auto_36699 ?auto_36696 ) ( CLEAR ?auto_36699 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36698 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36698 ?auto_36696 )
      ( MAKE-1PILE ?auto_36696 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36700 - BLOCK
    )
    :vars
    (
      ?auto_36701 - BLOCK
      ?auto_36702 - BLOCK
      ?auto_36703 - BLOCK
      ?auto_36706 - BLOCK
      ?auto_36705 - BLOCK
      ?auto_36704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36700 ?auto_36701 ) ( not ( = ?auto_36700 ?auto_36701 ) ) ( not ( = ?auto_36700 ?auto_36702 ) ) ( not ( = ?auto_36700 ?auto_36703 ) ) ( not ( = ?auto_36701 ?auto_36702 ) ) ( not ( = ?auto_36701 ?auto_36703 ) ) ( not ( = ?auto_36702 ?auto_36703 ) ) ( ON ?auto_36702 ?auto_36700 ) ( CLEAR ?auto_36702 ) ( ON-TABLE ?auto_36701 ) ( HOLDING ?auto_36703 ) ( CLEAR ?auto_36706 ) ( ON-TABLE ?auto_36705 ) ( ON ?auto_36704 ?auto_36705 ) ( ON ?auto_36706 ?auto_36704 ) ( not ( = ?auto_36705 ?auto_36704 ) ) ( not ( = ?auto_36705 ?auto_36706 ) ) ( not ( = ?auto_36705 ?auto_36703 ) ) ( not ( = ?auto_36704 ?auto_36706 ) ) ( not ( = ?auto_36704 ?auto_36703 ) ) ( not ( = ?auto_36706 ?auto_36703 ) ) ( not ( = ?auto_36700 ?auto_36706 ) ) ( not ( = ?auto_36700 ?auto_36705 ) ) ( not ( = ?auto_36700 ?auto_36704 ) ) ( not ( = ?auto_36701 ?auto_36706 ) ) ( not ( = ?auto_36701 ?auto_36705 ) ) ( not ( = ?auto_36701 ?auto_36704 ) ) ( not ( = ?auto_36702 ?auto_36706 ) ) ( not ( = ?auto_36702 ?auto_36705 ) ) ( not ( = ?auto_36702 ?auto_36704 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36705 ?auto_36704 ?auto_36706 ?auto_36703 )
      ( MAKE-1PILE ?auto_36700 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36707 - BLOCK
    )
    :vars
    (
      ?auto_36708 - BLOCK
      ?auto_36712 - BLOCK
      ?auto_36709 - BLOCK
      ?auto_36711 - BLOCK
      ?auto_36710 - BLOCK
      ?auto_36713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36707 ?auto_36708 ) ( not ( = ?auto_36707 ?auto_36708 ) ) ( not ( = ?auto_36707 ?auto_36712 ) ) ( not ( = ?auto_36707 ?auto_36709 ) ) ( not ( = ?auto_36708 ?auto_36712 ) ) ( not ( = ?auto_36708 ?auto_36709 ) ) ( not ( = ?auto_36712 ?auto_36709 ) ) ( ON ?auto_36712 ?auto_36707 ) ( ON-TABLE ?auto_36708 ) ( CLEAR ?auto_36711 ) ( ON-TABLE ?auto_36710 ) ( ON ?auto_36713 ?auto_36710 ) ( ON ?auto_36711 ?auto_36713 ) ( not ( = ?auto_36710 ?auto_36713 ) ) ( not ( = ?auto_36710 ?auto_36711 ) ) ( not ( = ?auto_36710 ?auto_36709 ) ) ( not ( = ?auto_36713 ?auto_36711 ) ) ( not ( = ?auto_36713 ?auto_36709 ) ) ( not ( = ?auto_36711 ?auto_36709 ) ) ( not ( = ?auto_36707 ?auto_36711 ) ) ( not ( = ?auto_36707 ?auto_36710 ) ) ( not ( = ?auto_36707 ?auto_36713 ) ) ( not ( = ?auto_36708 ?auto_36711 ) ) ( not ( = ?auto_36708 ?auto_36710 ) ) ( not ( = ?auto_36708 ?auto_36713 ) ) ( not ( = ?auto_36712 ?auto_36711 ) ) ( not ( = ?auto_36712 ?auto_36710 ) ) ( not ( = ?auto_36712 ?auto_36713 ) ) ( ON ?auto_36709 ?auto_36712 ) ( CLEAR ?auto_36709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36708 ?auto_36707 ?auto_36712 )
      ( MAKE-1PILE ?auto_36707 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36714 - BLOCK
    )
    :vars
    (
      ?auto_36720 - BLOCK
      ?auto_36719 - BLOCK
      ?auto_36718 - BLOCK
      ?auto_36716 - BLOCK
      ?auto_36717 - BLOCK
      ?auto_36715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36714 ?auto_36720 ) ( not ( = ?auto_36714 ?auto_36720 ) ) ( not ( = ?auto_36714 ?auto_36719 ) ) ( not ( = ?auto_36714 ?auto_36718 ) ) ( not ( = ?auto_36720 ?auto_36719 ) ) ( not ( = ?auto_36720 ?auto_36718 ) ) ( not ( = ?auto_36719 ?auto_36718 ) ) ( ON ?auto_36719 ?auto_36714 ) ( ON-TABLE ?auto_36720 ) ( ON-TABLE ?auto_36716 ) ( ON ?auto_36717 ?auto_36716 ) ( not ( = ?auto_36716 ?auto_36717 ) ) ( not ( = ?auto_36716 ?auto_36715 ) ) ( not ( = ?auto_36716 ?auto_36718 ) ) ( not ( = ?auto_36717 ?auto_36715 ) ) ( not ( = ?auto_36717 ?auto_36718 ) ) ( not ( = ?auto_36715 ?auto_36718 ) ) ( not ( = ?auto_36714 ?auto_36715 ) ) ( not ( = ?auto_36714 ?auto_36716 ) ) ( not ( = ?auto_36714 ?auto_36717 ) ) ( not ( = ?auto_36720 ?auto_36715 ) ) ( not ( = ?auto_36720 ?auto_36716 ) ) ( not ( = ?auto_36720 ?auto_36717 ) ) ( not ( = ?auto_36719 ?auto_36715 ) ) ( not ( = ?auto_36719 ?auto_36716 ) ) ( not ( = ?auto_36719 ?auto_36717 ) ) ( ON ?auto_36718 ?auto_36719 ) ( CLEAR ?auto_36718 ) ( HOLDING ?auto_36715 ) ( CLEAR ?auto_36717 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36716 ?auto_36717 ?auto_36715 )
      ( MAKE-1PILE ?auto_36714 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36721 - BLOCK
    )
    :vars
    (
      ?auto_36726 - BLOCK
      ?auto_36724 - BLOCK
      ?auto_36723 - BLOCK
      ?auto_36727 - BLOCK
      ?auto_36725 - BLOCK
      ?auto_36722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36721 ?auto_36726 ) ( not ( = ?auto_36721 ?auto_36726 ) ) ( not ( = ?auto_36721 ?auto_36724 ) ) ( not ( = ?auto_36721 ?auto_36723 ) ) ( not ( = ?auto_36726 ?auto_36724 ) ) ( not ( = ?auto_36726 ?auto_36723 ) ) ( not ( = ?auto_36724 ?auto_36723 ) ) ( ON ?auto_36724 ?auto_36721 ) ( ON-TABLE ?auto_36726 ) ( ON-TABLE ?auto_36727 ) ( ON ?auto_36725 ?auto_36727 ) ( not ( = ?auto_36727 ?auto_36725 ) ) ( not ( = ?auto_36727 ?auto_36722 ) ) ( not ( = ?auto_36727 ?auto_36723 ) ) ( not ( = ?auto_36725 ?auto_36722 ) ) ( not ( = ?auto_36725 ?auto_36723 ) ) ( not ( = ?auto_36722 ?auto_36723 ) ) ( not ( = ?auto_36721 ?auto_36722 ) ) ( not ( = ?auto_36721 ?auto_36727 ) ) ( not ( = ?auto_36721 ?auto_36725 ) ) ( not ( = ?auto_36726 ?auto_36722 ) ) ( not ( = ?auto_36726 ?auto_36727 ) ) ( not ( = ?auto_36726 ?auto_36725 ) ) ( not ( = ?auto_36724 ?auto_36722 ) ) ( not ( = ?auto_36724 ?auto_36727 ) ) ( not ( = ?auto_36724 ?auto_36725 ) ) ( ON ?auto_36723 ?auto_36724 ) ( CLEAR ?auto_36725 ) ( ON ?auto_36722 ?auto_36723 ) ( CLEAR ?auto_36722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36726 ?auto_36721 ?auto_36724 ?auto_36723 )
      ( MAKE-1PILE ?auto_36721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36728 - BLOCK
    )
    :vars
    (
      ?auto_36731 - BLOCK
      ?auto_36729 - BLOCK
      ?auto_36732 - BLOCK
      ?auto_36734 - BLOCK
      ?auto_36733 - BLOCK
      ?auto_36730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36728 ?auto_36731 ) ( not ( = ?auto_36728 ?auto_36731 ) ) ( not ( = ?auto_36728 ?auto_36729 ) ) ( not ( = ?auto_36728 ?auto_36732 ) ) ( not ( = ?auto_36731 ?auto_36729 ) ) ( not ( = ?auto_36731 ?auto_36732 ) ) ( not ( = ?auto_36729 ?auto_36732 ) ) ( ON ?auto_36729 ?auto_36728 ) ( ON-TABLE ?auto_36731 ) ( ON-TABLE ?auto_36734 ) ( not ( = ?auto_36734 ?auto_36733 ) ) ( not ( = ?auto_36734 ?auto_36730 ) ) ( not ( = ?auto_36734 ?auto_36732 ) ) ( not ( = ?auto_36733 ?auto_36730 ) ) ( not ( = ?auto_36733 ?auto_36732 ) ) ( not ( = ?auto_36730 ?auto_36732 ) ) ( not ( = ?auto_36728 ?auto_36730 ) ) ( not ( = ?auto_36728 ?auto_36734 ) ) ( not ( = ?auto_36728 ?auto_36733 ) ) ( not ( = ?auto_36731 ?auto_36730 ) ) ( not ( = ?auto_36731 ?auto_36734 ) ) ( not ( = ?auto_36731 ?auto_36733 ) ) ( not ( = ?auto_36729 ?auto_36730 ) ) ( not ( = ?auto_36729 ?auto_36734 ) ) ( not ( = ?auto_36729 ?auto_36733 ) ) ( ON ?auto_36732 ?auto_36729 ) ( ON ?auto_36730 ?auto_36732 ) ( CLEAR ?auto_36730 ) ( HOLDING ?auto_36733 ) ( CLEAR ?auto_36734 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36734 ?auto_36733 )
      ( MAKE-1PILE ?auto_36728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36735 - BLOCK
    )
    :vars
    (
      ?auto_36739 - BLOCK
      ?auto_36741 - BLOCK
      ?auto_36737 - BLOCK
      ?auto_36736 - BLOCK
      ?auto_36738 - BLOCK
      ?auto_36740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36735 ?auto_36739 ) ( not ( = ?auto_36735 ?auto_36739 ) ) ( not ( = ?auto_36735 ?auto_36741 ) ) ( not ( = ?auto_36735 ?auto_36737 ) ) ( not ( = ?auto_36739 ?auto_36741 ) ) ( not ( = ?auto_36739 ?auto_36737 ) ) ( not ( = ?auto_36741 ?auto_36737 ) ) ( ON ?auto_36741 ?auto_36735 ) ( ON-TABLE ?auto_36739 ) ( ON-TABLE ?auto_36736 ) ( not ( = ?auto_36736 ?auto_36738 ) ) ( not ( = ?auto_36736 ?auto_36740 ) ) ( not ( = ?auto_36736 ?auto_36737 ) ) ( not ( = ?auto_36738 ?auto_36740 ) ) ( not ( = ?auto_36738 ?auto_36737 ) ) ( not ( = ?auto_36740 ?auto_36737 ) ) ( not ( = ?auto_36735 ?auto_36740 ) ) ( not ( = ?auto_36735 ?auto_36736 ) ) ( not ( = ?auto_36735 ?auto_36738 ) ) ( not ( = ?auto_36739 ?auto_36740 ) ) ( not ( = ?auto_36739 ?auto_36736 ) ) ( not ( = ?auto_36739 ?auto_36738 ) ) ( not ( = ?auto_36741 ?auto_36740 ) ) ( not ( = ?auto_36741 ?auto_36736 ) ) ( not ( = ?auto_36741 ?auto_36738 ) ) ( ON ?auto_36737 ?auto_36741 ) ( ON ?auto_36740 ?auto_36737 ) ( CLEAR ?auto_36736 ) ( ON ?auto_36738 ?auto_36740 ) ( CLEAR ?auto_36738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36739 ?auto_36735 ?auto_36741 ?auto_36737 ?auto_36740 )
      ( MAKE-1PILE ?auto_36735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36742 - BLOCK
    )
    :vars
    (
      ?auto_36748 - BLOCK
      ?auto_36746 - BLOCK
      ?auto_36747 - BLOCK
      ?auto_36744 - BLOCK
      ?auto_36743 - BLOCK
      ?auto_36745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36742 ?auto_36748 ) ( not ( = ?auto_36742 ?auto_36748 ) ) ( not ( = ?auto_36742 ?auto_36746 ) ) ( not ( = ?auto_36742 ?auto_36747 ) ) ( not ( = ?auto_36748 ?auto_36746 ) ) ( not ( = ?auto_36748 ?auto_36747 ) ) ( not ( = ?auto_36746 ?auto_36747 ) ) ( ON ?auto_36746 ?auto_36742 ) ( ON-TABLE ?auto_36748 ) ( not ( = ?auto_36744 ?auto_36743 ) ) ( not ( = ?auto_36744 ?auto_36745 ) ) ( not ( = ?auto_36744 ?auto_36747 ) ) ( not ( = ?auto_36743 ?auto_36745 ) ) ( not ( = ?auto_36743 ?auto_36747 ) ) ( not ( = ?auto_36745 ?auto_36747 ) ) ( not ( = ?auto_36742 ?auto_36745 ) ) ( not ( = ?auto_36742 ?auto_36744 ) ) ( not ( = ?auto_36742 ?auto_36743 ) ) ( not ( = ?auto_36748 ?auto_36745 ) ) ( not ( = ?auto_36748 ?auto_36744 ) ) ( not ( = ?auto_36748 ?auto_36743 ) ) ( not ( = ?auto_36746 ?auto_36745 ) ) ( not ( = ?auto_36746 ?auto_36744 ) ) ( not ( = ?auto_36746 ?auto_36743 ) ) ( ON ?auto_36747 ?auto_36746 ) ( ON ?auto_36745 ?auto_36747 ) ( ON ?auto_36743 ?auto_36745 ) ( CLEAR ?auto_36743 ) ( HOLDING ?auto_36744 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36744 )
      ( MAKE-1PILE ?auto_36742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36749 - BLOCK
    )
    :vars
    (
      ?auto_36752 - BLOCK
      ?auto_36755 - BLOCK
      ?auto_36751 - BLOCK
      ?auto_36754 - BLOCK
      ?auto_36750 - BLOCK
      ?auto_36753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36749 ?auto_36752 ) ( not ( = ?auto_36749 ?auto_36752 ) ) ( not ( = ?auto_36749 ?auto_36755 ) ) ( not ( = ?auto_36749 ?auto_36751 ) ) ( not ( = ?auto_36752 ?auto_36755 ) ) ( not ( = ?auto_36752 ?auto_36751 ) ) ( not ( = ?auto_36755 ?auto_36751 ) ) ( ON ?auto_36755 ?auto_36749 ) ( ON-TABLE ?auto_36752 ) ( not ( = ?auto_36754 ?auto_36750 ) ) ( not ( = ?auto_36754 ?auto_36753 ) ) ( not ( = ?auto_36754 ?auto_36751 ) ) ( not ( = ?auto_36750 ?auto_36753 ) ) ( not ( = ?auto_36750 ?auto_36751 ) ) ( not ( = ?auto_36753 ?auto_36751 ) ) ( not ( = ?auto_36749 ?auto_36753 ) ) ( not ( = ?auto_36749 ?auto_36754 ) ) ( not ( = ?auto_36749 ?auto_36750 ) ) ( not ( = ?auto_36752 ?auto_36753 ) ) ( not ( = ?auto_36752 ?auto_36754 ) ) ( not ( = ?auto_36752 ?auto_36750 ) ) ( not ( = ?auto_36755 ?auto_36753 ) ) ( not ( = ?auto_36755 ?auto_36754 ) ) ( not ( = ?auto_36755 ?auto_36750 ) ) ( ON ?auto_36751 ?auto_36755 ) ( ON ?auto_36753 ?auto_36751 ) ( ON ?auto_36750 ?auto_36753 ) ( ON ?auto_36754 ?auto_36750 ) ( CLEAR ?auto_36754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36752 ?auto_36749 ?auto_36755 ?auto_36751 ?auto_36753 ?auto_36750 )
      ( MAKE-1PILE ?auto_36749 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36765 - BLOCK
      ?auto_36766 - BLOCK
      ?auto_36767 - BLOCK
      ?auto_36768 - BLOCK
    )
    :vars
    (
      ?auto_36769 - BLOCK
      ?auto_36770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36769 ?auto_36768 ) ( CLEAR ?auto_36769 ) ( ON-TABLE ?auto_36765 ) ( ON ?auto_36766 ?auto_36765 ) ( ON ?auto_36767 ?auto_36766 ) ( ON ?auto_36768 ?auto_36767 ) ( not ( = ?auto_36765 ?auto_36766 ) ) ( not ( = ?auto_36765 ?auto_36767 ) ) ( not ( = ?auto_36765 ?auto_36768 ) ) ( not ( = ?auto_36765 ?auto_36769 ) ) ( not ( = ?auto_36766 ?auto_36767 ) ) ( not ( = ?auto_36766 ?auto_36768 ) ) ( not ( = ?auto_36766 ?auto_36769 ) ) ( not ( = ?auto_36767 ?auto_36768 ) ) ( not ( = ?auto_36767 ?auto_36769 ) ) ( not ( = ?auto_36768 ?auto_36769 ) ) ( HOLDING ?auto_36770 ) ( not ( = ?auto_36765 ?auto_36770 ) ) ( not ( = ?auto_36766 ?auto_36770 ) ) ( not ( = ?auto_36767 ?auto_36770 ) ) ( not ( = ?auto_36768 ?auto_36770 ) ) ( not ( = ?auto_36769 ?auto_36770 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_36770 )
      ( MAKE-4PILE ?auto_36765 ?auto_36766 ?auto_36767 ?auto_36768 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36838 - BLOCK
      ?auto_36839 - BLOCK
    )
    :vars
    (
      ?auto_36840 - BLOCK
      ?auto_36841 - BLOCK
      ?auto_36843 - BLOCK
      ?auto_36842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36838 ?auto_36839 ) ) ( ON ?auto_36839 ?auto_36840 ) ( not ( = ?auto_36838 ?auto_36840 ) ) ( not ( = ?auto_36839 ?auto_36840 ) ) ( ON ?auto_36838 ?auto_36839 ) ( CLEAR ?auto_36838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36841 ) ( ON ?auto_36843 ?auto_36841 ) ( ON ?auto_36842 ?auto_36843 ) ( ON ?auto_36840 ?auto_36842 ) ( not ( = ?auto_36841 ?auto_36843 ) ) ( not ( = ?auto_36841 ?auto_36842 ) ) ( not ( = ?auto_36841 ?auto_36840 ) ) ( not ( = ?auto_36841 ?auto_36839 ) ) ( not ( = ?auto_36841 ?auto_36838 ) ) ( not ( = ?auto_36843 ?auto_36842 ) ) ( not ( = ?auto_36843 ?auto_36840 ) ) ( not ( = ?auto_36843 ?auto_36839 ) ) ( not ( = ?auto_36843 ?auto_36838 ) ) ( not ( = ?auto_36842 ?auto_36840 ) ) ( not ( = ?auto_36842 ?auto_36839 ) ) ( not ( = ?auto_36842 ?auto_36838 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36841 ?auto_36843 ?auto_36842 ?auto_36840 ?auto_36839 )
      ( MAKE-2PILE ?auto_36838 ?auto_36839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36846 - BLOCK
      ?auto_36847 - BLOCK
    )
    :vars
    (
      ?auto_36848 - BLOCK
      ?auto_36849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36846 ?auto_36847 ) ) ( ON ?auto_36847 ?auto_36848 ) ( CLEAR ?auto_36847 ) ( not ( = ?auto_36846 ?auto_36848 ) ) ( not ( = ?auto_36847 ?auto_36848 ) ) ( ON ?auto_36846 ?auto_36849 ) ( CLEAR ?auto_36846 ) ( HAND-EMPTY ) ( not ( = ?auto_36846 ?auto_36849 ) ) ( not ( = ?auto_36847 ?auto_36849 ) ) ( not ( = ?auto_36848 ?auto_36849 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36846 ?auto_36849 )
      ( MAKE-2PILE ?auto_36846 ?auto_36847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36850 - BLOCK
      ?auto_36851 - BLOCK
    )
    :vars
    (
      ?auto_36852 - BLOCK
      ?auto_36853 - BLOCK
      ?auto_36856 - BLOCK
      ?auto_36855 - BLOCK
      ?auto_36854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36850 ?auto_36851 ) ) ( not ( = ?auto_36850 ?auto_36852 ) ) ( not ( = ?auto_36851 ?auto_36852 ) ) ( ON ?auto_36850 ?auto_36853 ) ( CLEAR ?auto_36850 ) ( not ( = ?auto_36850 ?auto_36853 ) ) ( not ( = ?auto_36851 ?auto_36853 ) ) ( not ( = ?auto_36852 ?auto_36853 ) ) ( HOLDING ?auto_36851 ) ( CLEAR ?auto_36852 ) ( ON-TABLE ?auto_36856 ) ( ON ?auto_36855 ?auto_36856 ) ( ON ?auto_36854 ?auto_36855 ) ( ON ?auto_36852 ?auto_36854 ) ( not ( = ?auto_36856 ?auto_36855 ) ) ( not ( = ?auto_36856 ?auto_36854 ) ) ( not ( = ?auto_36856 ?auto_36852 ) ) ( not ( = ?auto_36856 ?auto_36851 ) ) ( not ( = ?auto_36855 ?auto_36854 ) ) ( not ( = ?auto_36855 ?auto_36852 ) ) ( not ( = ?auto_36855 ?auto_36851 ) ) ( not ( = ?auto_36854 ?auto_36852 ) ) ( not ( = ?auto_36854 ?auto_36851 ) ) ( not ( = ?auto_36850 ?auto_36856 ) ) ( not ( = ?auto_36850 ?auto_36855 ) ) ( not ( = ?auto_36850 ?auto_36854 ) ) ( not ( = ?auto_36853 ?auto_36856 ) ) ( not ( = ?auto_36853 ?auto_36855 ) ) ( not ( = ?auto_36853 ?auto_36854 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36856 ?auto_36855 ?auto_36854 ?auto_36852 ?auto_36851 )
      ( MAKE-2PILE ?auto_36850 ?auto_36851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36857 - BLOCK
      ?auto_36858 - BLOCK
    )
    :vars
    (
      ?auto_36859 - BLOCK
      ?auto_36861 - BLOCK
      ?auto_36862 - BLOCK
      ?auto_36863 - BLOCK
      ?auto_36860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36857 ?auto_36858 ) ) ( not ( = ?auto_36857 ?auto_36859 ) ) ( not ( = ?auto_36858 ?auto_36859 ) ) ( ON ?auto_36857 ?auto_36861 ) ( not ( = ?auto_36857 ?auto_36861 ) ) ( not ( = ?auto_36858 ?auto_36861 ) ) ( not ( = ?auto_36859 ?auto_36861 ) ) ( CLEAR ?auto_36859 ) ( ON-TABLE ?auto_36862 ) ( ON ?auto_36863 ?auto_36862 ) ( ON ?auto_36860 ?auto_36863 ) ( ON ?auto_36859 ?auto_36860 ) ( not ( = ?auto_36862 ?auto_36863 ) ) ( not ( = ?auto_36862 ?auto_36860 ) ) ( not ( = ?auto_36862 ?auto_36859 ) ) ( not ( = ?auto_36862 ?auto_36858 ) ) ( not ( = ?auto_36863 ?auto_36860 ) ) ( not ( = ?auto_36863 ?auto_36859 ) ) ( not ( = ?auto_36863 ?auto_36858 ) ) ( not ( = ?auto_36860 ?auto_36859 ) ) ( not ( = ?auto_36860 ?auto_36858 ) ) ( not ( = ?auto_36857 ?auto_36862 ) ) ( not ( = ?auto_36857 ?auto_36863 ) ) ( not ( = ?auto_36857 ?auto_36860 ) ) ( not ( = ?auto_36861 ?auto_36862 ) ) ( not ( = ?auto_36861 ?auto_36863 ) ) ( not ( = ?auto_36861 ?auto_36860 ) ) ( ON ?auto_36858 ?auto_36857 ) ( CLEAR ?auto_36858 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36861 ?auto_36857 )
      ( MAKE-2PILE ?auto_36857 ?auto_36858 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36864 - BLOCK
      ?auto_36865 - BLOCK
    )
    :vars
    (
      ?auto_36866 - BLOCK
      ?auto_36867 - BLOCK
      ?auto_36869 - BLOCK
      ?auto_36868 - BLOCK
      ?auto_36870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36864 ?auto_36865 ) ) ( not ( = ?auto_36864 ?auto_36866 ) ) ( not ( = ?auto_36865 ?auto_36866 ) ) ( ON ?auto_36864 ?auto_36867 ) ( not ( = ?auto_36864 ?auto_36867 ) ) ( not ( = ?auto_36865 ?auto_36867 ) ) ( not ( = ?auto_36866 ?auto_36867 ) ) ( ON-TABLE ?auto_36869 ) ( ON ?auto_36868 ?auto_36869 ) ( ON ?auto_36870 ?auto_36868 ) ( not ( = ?auto_36869 ?auto_36868 ) ) ( not ( = ?auto_36869 ?auto_36870 ) ) ( not ( = ?auto_36869 ?auto_36866 ) ) ( not ( = ?auto_36869 ?auto_36865 ) ) ( not ( = ?auto_36868 ?auto_36870 ) ) ( not ( = ?auto_36868 ?auto_36866 ) ) ( not ( = ?auto_36868 ?auto_36865 ) ) ( not ( = ?auto_36870 ?auto_36866 ) ) ( not ( = ?auto_36870 ?auto_36865 ) ) ( not ( = ?auto_36864 ?auto_36869 ) ) ( not ( = ?auto_36864 ?auto_36868 ) ) ( not ( = ?auto_36864 ?auto_36870 ) ) ( not ( = ?auto_36867 ?auto_36869 ) ) ( not ( = ?auto_36867 ?auto_36868 ) ) ( not ( = ?auto_36867 ?auto_36870 ) ) ( ON ?auto_36865 ?auto_36864 ) ( CLEAR ?auto_36865 ) ( ON-TABLE ?auto_36867 ) ( HOLDING ?auto_36866 ) ( CLEAR ?auto_36870 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36869 ?auto_36868 ?auto_36870 ?auto_36866 )
      ( MAKE-2PILE ?auto_36864 ?auto_36865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36871 - BLOCK
      ?auto_36872 - BLOCK
    )
    :vars
    (
      ?auto_36877 - BLOCK
      ?auto_36876 - BLOCK
      ?auto_36874 - BLOCK
      ?auto_36875 - BLOCK
      ?auto_36873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36871 ?auto_36872 ) ) ( not ( = ?auto_36871 ?auto_36877 ) ) ( not ( = ?auto_36872 ?auto_36877 ) ) ( ON ?auto_36871 ?auto_36876 ) ( not ( = ?auto_36871 ?auto_36876 ) ) ( not ( = ?auto_36872 ?auto_36876 ) ) ( not ( = ?auto_36877 ?auto_36876 ) ) ( ON-TABLE ?auto_36874 ) ( ON ?auto_36875 ?auto_36874 ) ( ON ?auto_36873 ?auto_36875 ) ( not ( = ?auto_36874 ?auto_36875 ) ) ( not ( = ?auto_36874 ?auto_36873 ) ) ( not ( = ?auto_36874 ?auto_36877 ) ) ( not ( = ?auto_36874 ?auto_36872 ) ) ( not ( = ?auto_36875 ?auto_36873 ) ) ( not ( = ?auto_36875 ?auto_36877 ) ) ( not ( = ?auto_36875 ?auto_36872 ) ) ( not ( = ?auto_36873 ?auto_36877 ) ) ( not ( = ?auto_36873 ?auto_36872 ) ) ( not ( = ?auto_36871 ?auto_36874 ) ) ( not ( = ?auto_36871 ?auto_36875 ) ) ( not ( = ?auto_36871 ?auto_36873 ) ) ( not ( = ?auto_36876 ?auto_36874 ) ) ( not ( = ?auto_36876 ?auto_36875 ) ) ( not ( = ?auto_36876 ?auto_36873 ) ) ( ON ?auto_36872 ?auto_36871 ) ( ON-TABLE ?auto_36876 ) ( CLEAR ?auto_36873 ) ( ON ?auto_36877 ?auto_36872 ) ( CLEAR ?auto_36877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36876 ?auto_36871 ?auto_36872 )
      ( MAKE-2PILE ?auto_36871 ?auto_36872 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36878 - BLOCK
      ?auto_36879 - BLOCK
    )
    :vars
    (
      ?auto_36880 - BLOCK
      ?auto_36884 - BLOCK
      ?auto_36881 - BLOCK
      ?auto_36882 - BLOCK
      ?auto_36883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36878 ?auto_36879 ) ) ( not ( = ?auto_36878 ?auto_36880 ) ) ( not ( = ?auto_36879 ?auto_36880 ) ) ( ON ?auto_36878 ?auto_36884 ) ( not ( = ?auto_36878 ?auto_36884 ) ) ( not ( = ?auto_36879 ?auto_36884 ) ) ( not ( = ?auto_36880 ?auto_36884 ) ) ( ON-TABLE ?auto_36881 ) ( ON ?auto_36882 ?auto_36881 ) ( not ( = ?auto_36881 ?auto_36882 ) ) ( not ( = ?auto_36881 ?auto_36883 ) ) ( not ( = ?auto_36881 ?auto_36880 ) ) ( not ( = ?auto_36881 ?auto_36879 ) ) ( not ( = ?auto_36882 ?auto_36883 ) ) ( not ( = ?auto_36882 ?auto_36880 ) ) ( not ( = ?auto_36882 ?auto_36879 ) ) ( not ( = ?auto_36883 ?auto_36880 ) ) ( not ( = ?auto_36883 ?auto_36879 ) ) ( not ( = ?auto_36878 ?auto_36881 ) ) ( not ( = ?auto_36878 ?auto_36882 ) ) ( not ( = ?auto_36878 ?auto_36883 ) ) ( not ( = ?auto_36884 ?auto_36881 ) ) ( not ( = ?auto_36884 ?auto_36882 ) ) ( not ( = ?auto_36884 ?auto_36883 ) ) ( ON ?auto_36879 ?auto_36878 ) ( ON-TABLE ?auto_36884 ) ( ON ?auto_36880 ?auto_36879 ) ( CLEAR ?auto_36880 ) ( HOLDING ?auto_36883 ) ( CLEAR ?auto_36882 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36881 ?auto_36882 ?auto_36883 )
      ( MAKE-2PILE ?auto_36878 ?auto_36879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36885 - BLOCK
      ?auto_36886 - BLOCK
    )
    :vars
    (
      ?auto_36889 - BLOCK
      ?auto_36890 - BLOCK
      ?auto_36887 - BLOCK
      ?auto_36888 - BLOCK
      ?auto_36891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36885 ?auto_36886 ) ) ( not ( = ?auto_36885 ?auto_36889 ) ) ( not ( = ?auto_36886 ?auto_36889 ) ) ( ON ?auto_36885 ?auto_36890 ) ( not ( = ?auto_36885 ?auto_36890 ) ) ( not ( = ?auto_36886 ?auto_36890 ) ) ( not ( = ?auto_36889 ?auto_36890 ) ) ( ON-TABLE ?auto_36887 ) ( ON ?auto_36888 ?auto_36887 ) ( not ( = ?auto_36887 ?auto_36888 ) ) ( not ( = ?auto_36887 ?auto_36891 ) ) ( not ( = ?auto_36887 ?auto_36889 ) ) ( not ( = ?auto_36887 ?auto_36886 ) ) ( not ( = ?auto_36888 ?auto_36891 ) ) ( not ( = ?auto_36888 ?auto_36889 ) ) ( not ( = ?auto_36888 ?auto_36886 ) ) ( not ( = ?auto_36891 ?auto_36889 ) ) ( not ( = ?auto_36891 ?auto_36886 ) ) ( not ( = ?auto_36885 ?auto_36887 ) ) ( not ( = ?auto_36885 ?auto_36888 ) ) ( not ( = ?auto_36885 ?auto_36891 ) ) ( not ( = ?auto_36890 ?auto_36887 ) ) ( not ( = ?auto_36890 ?auto_36888 ) ) ( not ( = ?auto_36890 ?auto_36891 ) ) ( ON ?auto_36886 ?auto_36885 ) ( ON-TABLE ?auto_36890 ) ( ON ?auto_36889 ?auto_36886 ) ( CLEAR ?auto_36888 ) ( ON ?auto_36891 ?auto_36889 ) ( CLEAR ?auto_36891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36890 ?auto_36885 ?auto_36886 ?auto_36889 )
      ( MAKE-2PILE ?auto_36885 ?auto_36886 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36892 - BLOCK
      ?auto_36893 - BLOCK
    )
    :vars
    (
      ?auto_36897 - BLOCK
      ?auto_36894 - BLOCK
      ?auto_36896 - BLOCK
      ?auto_36895 - BLOCK
      ?auto_36898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36892 ?auto_36893 ) ) ( not ( = ?auto_36892 ?auto_36897 ) ) ( not ( = ?auto_36893 ?auto_36897 ) ) ( ON ?auto_36892 ?auto_36894 ) ( not ( = ?auto_36892 ?auto_36894 ) ) ( not ( = ?auto_36893 ?auto_36894 ) ) ( not ( = ?auto_36897 ?auto_36894 ) ) ( ON-TABLE ?auto_36896 ) ( not ( = ?auto_36896 ?auto_36895 ) ) ( not ( = ?auto_36896 ?auto_36898 ) ) ( not ( = ?auto_36896 ?auto_36897 ) ) ( not ( = ?auto_36896 ?auto_36893 ) ) ( not ( = ?auto_36895 ?auto_36898 ) ) ( not ( = ?auto_36895 ?auto_36897 ) ) ( not ( = ?auto_36895 ?auto_36893 ) ) ( not ( = ?auto_36898 ?auto_36897 ) ) ( not ( = ?auto_36898 ?auto_36893 ) ) ( not ( = ?auto_36892 ?auto_36896 ) ) ( not ( = ?auto_36892 ?auto_36895 ) ) ( not ( = ?auto_36892 ?auto_36898 ) ) ( not ( = ?auto_36894 ?auto_36896 ) ) ( not ( = ?auto_36894 ?auto_36895 ) ) ( not ( = ?auto_36894 ?auto_36898 ) ) ( ON ?auto_36893 ?auto_36892 ) ( ON-TABLE ?auto_36894 ) ( ON ?auto_36897 ?auto_36893 ) ( ON ?auto_36898 ?auto_36897 ) ( CLEAR ?auto_36898 ) ( HOLDING ?auto_36895 ) ( CLEAR ?auto_36896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36896 ?auto_36895 )
      ( MAKE-2PILE ?auto_36892 ?auto_36893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36899 - BLOCK
      ?auto_36900 - BLOCK
    )
    :vars
    (
      ?auto_36901 - BLOCK
      ?auto_36902 - BLOCK
      ?auto_36904 - BLOCK
      ?auto_36905 - BLOCK
      ?auto_36903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36899 ?auto_36900 ) ) ( not ( = ?auto_36899 ?auto_36901 ) ) ( not ( = ?auto_36900 ?auto_36901 ) ) ( ON ?auto_36899 ?auto_36902 ) ( not ( = ?auto_36899 ?auto_36902 ) ) ( not ( = ?auto_36900 ?auto_36902 ) ) ( not ( = ?auto_36901 ?auto_36902 ) ) ( ON-TABLE ?auto_36904 ) ( not ( = ?auto_36904 ?auto_36905 ) ) ( not ( = ?auto_36904 ?auto_36903 ) ) ( not ( = ?auto_36904 ?auto_36901 ) ) ( not ( = ?auto_36904 ?auto_36900 ) ) ( not ( = ?auto_36905 ?auto_36903 ) ) ( not ( = ?auto_36905 ?auto_36901 ) ) ( not ( = ?auto_36905 ?auto_36900 ) ) ( not ( = ?auto_36903 ?auto_36901 ) ) ( not ( = ?auto_36903 ?auto_36900 ) ) ( not ( = ?auto_36899 ?auto_36904 ) ) ( not ( = ?auto_36899 ?auto_36905 ) ) ( not ( = ?auto_36899 ?auto_36903 ) ) ( not ( = ?auto_36902 ?auto_36904 ) ) ( not ( = ?auto_36902 ?auto_36905 ) ) ( not ( = ?auto_36902 ?auto_36903 ) ) ( ON ?auto_36900 ?auto_36899 ) ( ON-TABLE ?auto_36902 ) ( ON ?auto_36901 ?auto_36900 ) ( ON ?auto_36903 ?auto_36901 ) ( CLEAR ?auto_36904 ) ( ON ?auto_36905 ?auto_36903 ) ( CLEAR ?auto_36905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36902 ?auto_36899 ?auto_36900 ?auto_36901 ?auto_36903 )
      ( MAKE-2PILE ?auto_36899 ?auto_36900 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36906 - BLOCK
      ?auto_36907 - BLOCK
    )
    :vars
    (
      ?auto_36908 - BLOCK
      ?auto_36912 - BLOCK
      ?auto_36909 - BLOCK
      ?auto_36910 - BLOCK
      ?auto_36911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36906 ?auto_36907 ) ) ( not ( = ?auto_36906 ?auto_36908 ) ) ( not ( = ?auto_36907 ?auto_36908 ) ) ( ON ?auto_36906 ?auto_36912 ) ( not ( = ?auto_36906 ?auto_36912 ) ) ( not ( = ?auto_36907 ?auto_36912 ) ) ( not ( = ?auto_36908 ?auto_36912 ) ) ( not ( = ?auto_36909 ?auto_36910 ) ) ( not ( = ?auto_36909 ?auto_36911 ) ) ( not ( = ?auto_36909 ?auto_36908 ) ) ( not ( = ?auto_36909 ?auto_36907 ) ) ( not ( = ?auto_36910 ?auto_36911 ) ) ( not ( = ?auto_36910 ?auto_36908 ) ) ( not ( = ?auto_36910 ?auto_36907 ) ) ( not ( = ?auto_36911 ?auto_36908 ) ) ( not ( = ?auto_36911 ?auto_36907 ) ) ( not ( = ?auto_36906 ?auto_36909 ) ) ( not ( = ?auto_36906 ?auto_36910 ) ) ( not ( = ?auto_36906 ?auto_36911 ) ) ( not ( = ?auto_36912 ?auto_36909 ) ) ( not ( = ?auto_36912 ?auto_36910 ) ) ( not ( = ?auto_36912 ?auto_36911 ) ) ( ON ?auto_36907 ?auto_36906 ) ( ON-TABLE ?auto_36912 ) ( ON ?auto_36908 ?auto_36907 ) ( ON ?auto_36911 ?auto_36908 ) ( ON ?auto_36910 ?auto_36911 ) ( CLEAR ?auto_36910 ) ( HOLDING ?auto_36909 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36909 )
      ( MAKE-2PILE ?auto_36906 ?auto_36907 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36913 - BLOCK
      ?auto_36914 - BLOCK
    )
    :vars
    (
      ?auto_36915 - BLOCK
      ?auto_36916 - BLOCK
      ?auto_36917 - BLOCK
      ?auto_36919 - BLOCK
      ?auto_36918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_36913 ?auto_36914 ) ) ( not ( = ?auto_36913 ?auto_36915 ) ) ( not ( = ?auto_36914 ?auto_36915 ) ) ( ON ?auto_36913 ?auto_36916 ) ( not ( = ?auto_36913 ?auto_36916 ) ) ( not ( = ?auto_36914 ?auto_36916 ) ) ( not ( = ?auto_36915 ?auto_36916 ) ) ( not ( = ?auto_36917 ?auto_36919 ) ) ( not ( = ?auto_36917 ?auto_36918 ) ) ( not ( = ?auto_36917 ?auto_36915 ) ) ( not ( = ?auto_36917 ?auto_36914 ) ) ( not ( = ?auto_36919 ?auto_36918 ) ) ( not ( = ?auto_36919 ?auto_36915 ) ) ( not ( = ?auto_36919 ?auto_36914 ) ) ( not ( = ?auto_36918 ?auto_36915 ) ) ( not ( = ?auto_36918 ?auto_36914 ) ) ( not ( = ?auto_36913 ?auto_36917 ) ) ( not ( = ?auto_36913 ?auto_36919 ) ) ( not ( = ?auto_36913 ?auto_36918 ) ) ( not ( = ?auto_36916 ?auto_36917 ) ) ( not ( = ?auto_36916 ?auto_36919 ) ) ( not ( = ?auto_36916 ?auto_36918 ) ) ( ON ?auto_36914 ?auto_36913 ) ( ON-TABLE ?auto_36916 ) ( ON ?auto_36915 ?auto_36914 ) ( ON ?auto_36918 ?auto_36915 ) ( ON ?auto_36919 ?auto_36918 ) ( ON ?auto_36917 ?auto_36919 ) ( CLEAR ?auto_36917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36916 ?auto_36913 ?auto_36914 ?auto_36915 ?auto_36918 ?auto_36919 )
      ( MAKE-2PILE ?auto_36913 ?auto_36914 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36939 - BLOCK
      ?auto_36940 - BLOCK
      ?auto_36941 - BLOCK
    )
    :vars
    (
      ?auto_36943 - BLOCK
      ?auto_36944 - BLOCK
      ?auto_36942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36943 ?auto_36941 ) ( ON-TABLE ?auto_36939 ) ( ON ?auto_36940 ?auto_36939 ) ( ON ?auto_36941 ?auto_36940 ) ( not ( = ?auto_36939 ?auto_36940 ) ) ( not ( = ?auto_36939 ?auto_36941 ) ) ( not ( = ?auto_36939 ?auto_36943 ) ) ( not ( = ?auto_36940 ?auto_36941 ) ) ( not ( = ?auto_36940 ?auto_36943 ) ) ( not ( = ?auto_36941 ?auto_36943 ) ) ( not ( = ?auto_36939 ?auto_36944 ) ) ( not ( = ?auto_36939 ?auto_36942 ) ) ( not ( = ?auto_36940 ?auto_36944 ) ) ( not ( = ?auto_36940 ?auto_36942 ) ) ( not ( = ?auto_36941 ?auto_36944 ) ) ( not ( = ?auto_36941 ?auto_36942 ) ) ( not ( = ?auto_36943 ?auto_36944 ) ) ( not ( = ?auto_36943 ?auto_36942 ) ) ( not ( = ?auto_36944 ?auto_36942 ) ) ( ON ?auto_36944 ?auto_36943 ) ( CLEAR ?auto_36944 ) ( HOLDING ?auto_36942 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36942 )
      ( MAKE-3PILE ?auto_36939 ?auto_36940 ?auto_36941 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37004 - BLOCK
      ?auto_37005 - BLOCK
      ?auto_37006 - BLOCK
    )
    :vars
    (
      ?auto_37007 - BLOCK
      ?auto_37009 - BLOCK
      ?auto_37008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37004 ) ( not ( = ?auto_37004 ?auto_37005 ) ) ( not ( = ?auto_37004 ?auto_37006 ) ) ( not ( = ?auto_37005 ?auto_37006 ) ) ( ON ?auto_37006 ?auto_37007 ) ( not ( = ?auto_37004 ?auto_37007 ) ) ( not ( = ?auto_37005 ?auto_37007 ) ) ( not ( = ?auto_37006 ?auto_37007 ) ) ( CLEAR ?auto_37004 ) ( ON ?auto_37005 ?auto_37006 ) ( CLEAR ?auto_37005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37009 ) ( ON ?auto_37008 ?auto_37009 ) ( ON ?auto_37007 ?auto_37008 ) ( not ( = ?auto_37009 ?auto_37008 ) ) ( not ( = ?auto_37009 ?auto_37007 ) ) ( not ( = ?auto_37009 ?auto_37006 ) ) ( not ( = ?auto_37009 ?auto_37005 ) ) ( not ( = ?auto_37008 ?auto_37007 ) ) ( not ( = ?auto_37008 ?auto_37006 ) ) ( not ( = ?auto_37008 ?auto_37005 ) ) ( not ( = ?auto_37004 ?auto_37009 ) ) ( not ( = ?auto_37004 ?auto_37008 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37009 ?auto_37008 ?auto_37007 ?auto_37006 )
      ( MAKE-3PILE ?auto_37004 ?auto_37005 ?auto_37006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37010 - BLOCK
      ?auto_37011 - BLOCK
      ?auto_37012 - BLOCK
    )
    :vars
    (
      ?auto_37014 - BLOCK
      ?auto_37015 - BLOCK
      ?auto_37013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37010 ?auto_37011 ) ) ( not ( = ?auto_37010 ?auto_37012 ) ) ( not ( = ?auto_37011 ?auto_37012 ) ) ( ON ?auto_37012 ?auto_37014 ) ( not ( = ?auto_37010 ?auto_37014 ) ) ( not ( = ?auto_37011 ?auto_37014 ) ) ( not ( = ?auto_37012 ?auto_37014 ) ) ( ON ?auto_37011 ?auto_37012 ) ( CLEAR ?auto_37011 ) ( ON-TABLE ?auto_37015 ) ( ON ?auto_37013 ?auto_37015 ) ( ON ?auto_37014 ?auto_37013 ) ( not ( = ?auto_37015 ?auto_37013 ) ) ( not ( = ?auto_37015 ?auto_37014 ) ) ( not ( = ?auto_37015 ?auto_37012 ) ) ( not ( = ?auto_37015 ?auto_37011 ) ) ( not ( = ?auto_37013 ?auto_37014 ) ) ( not ( = ?auto_37013 ?auto_37012 ) ) ( not ( = ?auto_37013 ?auto_37011 ) ) ( not ( = ?auto_37010 ?auto_37015 ) ) ( not ( = ?auto_37010 ?auto_37013 ) ) ( HOLDING ?auto_37010 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37010 )
      ( MAKE-3PILE ?auto_37010 ?auto_37011 ?auto_37012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37016 - BLOCK
      ?auto_37017 - BLOCK
      ?auto_37018 - BLOCK
    )
    :vars
    (
      ?auto_37019 - BLOCK
      ?auto_37021 - BLOCK
      ?auto_37020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37016 ?auto_37017 ) ) ( not ( = ?auto_37016 ?auto_37018 ) ) ( not ( = ?auto_37017 ?auto_37018 ) ) ( ON ?auto_37018 ?auto_37019 ) ( not ( = ?auto_37016 ?auto_37019 ) ) ( not ( = ?auto_37017 ?auto_37019 ) ) ( not ( = ?auto_37018 ?auto_37019 ) ) ( ON ?auto_37017 ?auto_37018 ) ( ON-TABLE ?auto_37021 ) ( ON ?auto_37020 ?auto_37021 ) ( ON ?auto_37019 ?auto_37020 ) ( not ( = ?auto_37021 ?auto_37020 ) ) ( not ( = ?auto_37021 ?auto_37019 ) ) ( not ( = ?auto_37021 ?auto_37018 ) ) ( not ( = ?auto_37021 ?auto_37017 ) ) ( not ( = ?auto_37020 ?auto_37019 ) ) ( not ( = ?auto_37020 ?auto_37018 ) ) ( not ( = ?auto_37020 ?auto_37017 ) ) ( not ( = ?auto_37016 ?auto_37021 ) ) ( not ( = ?auto_37016 ?auto_37020 ) ) ( ON ?auto_37016 ?auto_37017 ) ( CLEAR ?auto_37016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37021 ?auto_37020 ?auto_37019 ?auto_37018 ?auto_37017 )
      ( MAKE-3PILE ?auto_37016 ?auto_37017 ?auto_37018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37025 - BLOCK
      ?auto_37026 - BLOCK
      ?auto_37027 - BLOCK
    )
    :vars
    (
      ?auto_37029 - BLOCK
      ?auto_37028 - BLOCK
      ?auto_37030 - BLOCK
      ?auto_37031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37025 ?auto_37026 ) ) ( not ( = ?auto_37025 ?auto_37027 ) ) ( not ( = ?auto_37026 ?auto_37027 ) ) ( ON ?auto_37027 ?auto_37029 ) ( not ( = ?auto_37025 ?auto_37029 ) ) ( not ( = ?auto_37026 ?auto_37029 ) ) ( not ( = ?auto_37027 ?auto_37029 ) ) ( ON ?auto_37026 ?auto_37027 ) ( CLEAR ?auto_37026 ) ( ON-TABLE ?auto_37028 ) ( ON ?auto_37030 ?auto_37028 ) ( ON ?auto_37029 ?auto_37030 ) ( not ( = ?auto_37028 ?auto_37030 ) ) ( not ( = ?auto_37028 ?auto_37029 ) ) ( not ( = ?auto_37028 ?auto_37027 ) ) ( not ( = ?auto_37028 ?auto_37026 ) ) ( not ( = ?auto_37030 ?auto_37029 ) ) ( not ( = ?auto_37030 ?auto_37027 ) ) ( not ( = ?auto_37030 ?auto_37026 ) ) ( not ( = ?auto_37025 ?auto_37028 ) ) ( not ( = ?auto_37025 ?auto_37030 ) ) ( ON ?auto_37025 ?auto_37031 ) ( CLEAR ?auto_37025 ) ( HAND-EMPTY ) ( not ( = ?auto_37025 ?auto_37031 ) ) ( not ( = ?auto_37026 ?auto_37031 ) ) ( not ( = ?auto_37027 ?auto_37031 ) ) ( not ( = ?auto_37029 ?auto_37031 ) ) ( not ( = ?auto_37028 ?auto_37031 ) ) ( not ( = ?auto_37030 ?auto_37031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37025 ?auto_37031 )
      ( MAKE-3PILE ?auto_37025 ?auto_37026 ?auto_37027 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37032 - BLOCK
      ?auto_37033 - BLOCK
      ?auto_37034 - BLOCK
    )
    :vars
    (
      ?auto_37036 - BLOCK
      ?auto_37037 - BLOCK
      ?auto_37038 - BLOCK
      ?auto_37035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37032 ?auto_37033 ) ) ( not ( = ?auto_37032 ?auto_37034 ) ) ( not ( = ?auto_37033 ?auto_37034 ) ) ( ON ?auto_37034 ?auto_37036 ) ( not ( = ?auto_37032 ?auto_37036 ) ) ( not ( = ?auto_37033 ?auto_37036 ) ) ( not ( = ?auto_37034 ?auto_37036 ) ) ( ON-TABLE ?auto_37037 ) ( ON ?auto_37038 ?auto_37037 ) ( ON ?auto_37036 ?auto_37038 ) ( not ( = ?auto_37037 ?auto_37038 ) ) ( not ( = ?auto_37037 ?auto_37036 ) ) ( not ( = ?auto_37037 ?auto_37034 ) ) ( not ( = ?auto_37037 ?auto_37033 ) ) ( not ( = ?auto_37038 ?auto_37036 ) ) ( not ( = ?auto_37038 ?auto_37034 ) ) ( not ( = ?auto_37038 ?auto_37033 ) ) ( not ( = ?auto_37032 ?auto_37037 ) ) ( not ( = ?auto_37032 ?auto_37038 ) ) ( ON ?auto_37032 ?auto_37035 ) ( CLEAR ?auto_37032 ) ( not ( = ?auto_37032 ?auto_37035 ) ) ( not ( = ?auto_37033 ?auto_37035 ) ) ( not ( = ?auto_37034 ?auto_37035 ) ) ( not ( = ?auto_37036 ?auto_37035 ) ) ( not ( = ?auto_37037 ?auto_37035 ) ) ( not ( = ?auto_37038 ?auto_37035 ) ) ( HOLDING ?auto_37033 ) ( CLEAR ?auto_37034 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37037 ?auto_37038 ?auto_37036 ?auto_37034 ?auto_37033 )
      ( MAKE-3PILE ?auto_37032 ?auto_37033 ?auto_37034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37039 - BLOCK
      ?auto_37040 - BLOCK
      ?auto_37041 - BLOCK
    )
    :vars
    (
      ?auto_37043 - BLOCK
      ?auto_37045 - BLOCK
      ?auto_37042 - BLOCK
      ?auto_37044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37039 ?auto_37040 ) ) ( not ( = ?auto_37039 ?auto_37041 ) ) ( not ( = ?auto_37040 ?auto_37041 ) ) ( ON ?auto_37041 ?auto_37043 ) ( not ( = ?auto_37039 ?auto_37043 ) ) ( not ( = ?auto_37040 ?auto_37043 ) ) ( not ( = ?auto_37041 ?auto_37043 ) ) ( ON-TABLE ?auto_37045 ) ( ON ?auto_37042 ?auto_37045 ) ( ON ?auto_37043 ?auto_37042 ) ( not ( = ?auto_37045 ?auto_37042 ) ) ( not ( = ?auto_37045 ?auto_37043 ) ) ( not ( = ?auto_37045 ?auto_37041 ) ) ( not ( = ?auto_37045 ?auto_37040 ) ) ( not ( = ?auto_37042 ?auto_37043 ) ) ( not ( = ?auto_37042 ?auto_37041 ) ) ( not ( = ?auto_37042 ?auto_37040 ) ) ( not ( = ?auto_37039 ?auto_37045 ) ) ( not ( = ?auto_37039 ?auto_37042 ) ) ( ON ?auto_37039 ?auto_37044 ) ( not ( = ?auto_37039 ?auto_37044 ) ) ( not ( = ?auto_37040 ?auto_37044 ) ) ( not ( = ?auto_37041 ?auto_37044 ) ) ( not ( = ?auto_37043 ?auto_37044 ) ) ( not ( = ?auto_37045 ?auto_37044 ) ) ( not ( = ?auto_37042 ?auto_37044 ) ) ( CLEAR ?auto_37041 ) ( ON ?auto_37040 ?auto_37039 ) ( CLEAR ?auto_37040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37044 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37044 ?auto_37039 )
      ( MAKE-3PILE ?auto_37039 ?auto_37040 ?auto_37041 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37046 - BLOCK
      ?auto_37047 - BLOCK
      ?auto_37048 - BLOCK
    )
    :vars
    (
      ?auto_37050 - BLOCK
      ?auto_37052 - BLOCK
      ?auto_37051 - BLOCK
      ?auto_37049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37046 ?auto_37047 ) ) ( not ( = ?auto_37046 ?auto_37048 ) ) ( not ( = ?auto_37047 ?auto_37048 ) ) ( not ( = ?auto_37046 ?auto_37050 ) ) ( not ( = ?auto_37047 ?auto_37050 ) ) ( not ( = ?auto_37048 ?auto_37050 ) ) ( ON-TABLE ?auto_37052 ) ( ON ?auto_37051 ?auto_37052 ) ( ON ?auto_37050 ?auto_37051 ) ( not ( = ?auto_37052 ?auto_37051 ) ) ( not ( = ?auto_37052 ?auto_37050 ) ) ( not ( = ?auto_37052 ?auto_37048 ) ) ( not ( = ?auto_37052 ?auto_37047 ) ) ( not ( = ?auto_37051 ?auto_37050 ) ) ( not ( = ?auto_37051 ?auto_37048 ) ) ( not ( = ?auto_37051 ?auto_37047 ) ) ( not ( = ?auto_37046 ?auto_37052 ) ) ( not ( = ?auto_37046 ?auto_37051 ) ) ( ON ?auto_37046 ?auto_37049 ) ( not ( = ?auto_37046 ?auto_37049 ) ) ( not ( = ?auto_37047 ?auto_37049 ) ) ( not ( = ?auto_37048 ?auto_37049 ) ) ( not ( = ?auto_37050 ?auto_37049 ) ) ( not ( = ?auto_37052 ?auto_37049 ) ) ( not ( = ?auto_37051 ?auto_37049 ) ) ( ON ?auto_37047 ?auto_37046 ) ( CLEAR ?auto_37047 ) ( ON-TABLE ?auto_37049 ) ( HOLDING ?auto_37048 ) ( CLEAR ?auto_37050 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37052 ?auto_37051 ?auto_37050 ?auto_37048 )
      ( MAKE-3PILE ?auto_37046 ?auto_37047 ?auto_37048 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37053 - BLOCK
      ?auto_37054 - BLOCK
      ?auto_37055 - BLOCK
    )
    :vars
    (
      ?auto_37059 - BLOCK
      ?auto_37056 - BLOCK
      ?auto_37058 - BLOCK
      ?auto_37057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37053 ?auto_37054 ) ) ( not ( = ?auto_37053 ?auto_37055 ) ) ( not ( = ?auto_37054 ?auto_37055 ) ) ( not ( = ?auto_37053 ?auto_37059 ) ) ( not ( = ?auto_37054 ?auto_37059 ) ) ( not ( = ?auto_37055 ?auto_37059 ) ) ( ON-TABLE ?auto_37056 ) ( ON ?auto_37058 ?auto_37056 ) ( ON ?auto_37059 ?auto_37058 ) ( not ( = ?auto_37056 ?auto_37058 ) ) ( not ( = ?auto_37056 ?auto_37059 ) ) ( not ( = ?auto_37056 ?auto_37055 ) ) ( not ( = ?auto_37056 ?auto_37054 ) ) ( not ( = ?auto_37058 ?auto_37059 ) ) ( not ( = ?auto_37058 ?auto_37055 ) ) ( not ( = ?auto_37058 ?auto_37054 ) ) ( not ( = ?auto_37053 ?auto_37056 ) ) ( not ( = ?auto_37053 ?auto_37058 ) ) ( ON ?auto_37053 ?auto_37057 ) ( not ( = ?auto_37053 ?auto_37057 ) ) ( not ( = ?auto_37054 ?auto_37057 ) ) ( not ( = ?auto_37055 ?auto_37057 ) ) ( not ( = ?auto_37059 ?auto_37057 ) ) ( not ( = ?auto_37056 ?auto_37057 ) ) ( not ( = ?auto_37058 ?auto_37057 ) ) ( ON ?auto_37054 ?auto_37053 ) ( ON-TABLE ?auto_37057 ) ( CLEAR ?auto_37059 ) ( ON ?auto_37055 ?auto_37054 ) ( CLEAR ?auto_37055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37057 ?auto_37053 ?auto_37054 )
      ( MAKE-3PILE ?auto_37053 ?auto_37054 ?auto_37055 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37060 - BLOCK
      ?auto_37061 - BLOCK
      ?auto_37062 - BLOCK
    )
    :vars
    (
      ?auto_37063 - BLOCK
      ?auto_37064 - BLOCK
      ?auto_37065 - BLOCK
      ?auto_37066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37060 ?auto_37061 ) ) ( not ( = ?auto_37060 ?auto_37062 ) ) ( not ( = ?auto_37061 ?auto_37062 ) ) ( not ( = ?auto_37060 ?auto_37063 ) ) ( not ( = ?auto_37061 ?auto_37063 ) ) ( not ( = ?auto_37062 ?auto_37063 ) ) ( ON-TABLE ?auto_37064 ) ( ON ?auto_37065 ?auto_37064 ) ( not ( = ?auto_37064 ?auto_37065 ) ) ( not ( = ?auto_37064 ?auto_37063 ) ) ( not ( = ?auto_37064 ?auto_37062 ) ) ( not ( = ?auto_37064 ?auto_37061 ) ) ( not ( = ?auto_37065 ?auto_37063 ) ) ( not ( = ?auto_37065 ?auto_37062 ) ) ( not ( = ?auto_37065 ?auto_37061 ) ) ( not ( = ?auto_37060 ?auto_37064 ) ) ( not ( = ?auto_37060 ?auto_37065 ) ) ( ON ?auto_37060 ?auto_37066 ) ( not ( = ?auto_37060 ?auto_37066 ) ) ( not ( = ?auto_37061 ?auto_37066 ) ) ( not ( = ?auto_37062 ?auto_37066 ) ) ( not ( = ?auto_37063 ?auto_37066 ) ) ( not ( = ?auto_37064 ?auto_37066 ) ) ( not ( = ?auto_37065 ?auto_37066 ) ) ( ON ?auto_37061 ?auto_37060 ) ( ON-TABLE ?auto_37066 ) ( ON ?auto_37062 ?auto_37061 ) ( CLEAR ?auto_37062 ) ( HOLDING ?auto_37063 ) ( CLEAR ?auto_37065 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37064 ?auto_37065 ?auto_37063 )
      ( MAKE-3PILE ?auto_37060 ?auto_37061 ?auto_37062 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37067 - BLOCK
      ?auto_37068 - BLOCK
      ?auto_37069 - BLOCK
    )
    :vars
    (
      ?auto_37071 - BLOCK
      ?auto_37072 - BLOCK
      ?auto_37073 - BLOCK
      ?auto_37070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37067 ?auto_37068 ) ) ( not ( = ?auto_37067 ?auto_37069 ) ) ( not ( = ?auto_37068 ?auto_37069 ) ) ( not ( = ?auto_37067 ?auto_37071 ) ) ( not ( = ?auto_37068 ?auto_37071 ) ) ( not ( = ?auto_37069 ?auto_37071 ) ) ( ON-TABLE ?auto_37072 ) ( ON ?auto_37073 ?auto_37072 ) ( not ( = ?auto_37072 ?auto_37073 ) ) ( not ( = ?auto_37072 ?auto_37071 ) ) ( not ( = ?auto_37072 ?auto_37069 ) ) ( not ( = ?auto_37072 ?auto_37068 ) ) ( not ( = ?auto_37073 ?auto_37071 ) ) ( not ( = ?auto_37073 ?auto_37069 ) ) ( not ( = ?auto_37073 ?auto_37068 ) ) ( not ( = ?auto_37067 ?auto_37072 ) ) ( not ( = ?auto_37067 ?auto_37073 ) ) ( ON ?auto_37067 ?auto_37070 ) ( not ( = ?auto_37067 ?auto_37070 ) ) ( not ( = ?auto_37068 ?auto_37070 ) ) ( not ( = ?auto_37069 ?auto_37070 ) ) ( not ( = ?auto_37071 ?auto_37070 ) ) ( not ( = ?auto_37072 ?auto_37070 ) ) ( not ( = ?auto_37073 ?auto_37070 ) ) ( ON ?auto_37068 ?auto_37067 ) ( ON-TABLE ?auto_37070 ) ( ON ?auto_37069 ?auto_37068 ) ( CLEAR ?auto_37073 ) ( ON ?auto_37071 ?auto_37069 ) ( CLEAR ?auto_37071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37070 ?auto_37067 ?auto_37068 ?auto_37069 )
      ( MAKE-3PILE ?auto_37067 ?auto_37068 ?auto_37069 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37074 - BLOCK
      ?auto_37075 - BLOCK
      ?auto_37076 - BLOCK
    )
    :vars
    (
      ?auto_37077 - BLOCK
      ?auto_37080 - BLOCK
      ?auto_37078 - BLOCK
      ?auto_37079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37074 ?auto_37075 ) ) ( not ( = ?auto_37074 ?auto_37076 ) ) ( not ( = ?auto_37075 ?auto_37076 ) ) ( not ( = ?auto_37074 ?auto_37077 ) ) ( not ( = ?auto_37075 ?auto_37077 ) ) ( not ( = ?auto_37076 ?auto_37077 ) ) ( ON-TABLE ?auto_37080 ) ( not ( = ?auto_37080 ?auto_37078 ) ) ( not ( = ?auto_37080 ?auto_37077 ) ) ( not ( = ?auto_37080 ?auto_37076 ) ) ( not ( = ?auto_37080 ?auto_37075 ) ) ( not ( = ?auto_37078 ?auto_37077 ) ) ( not ( = ?auto_37078 ?auto_37076 ) ) ( not ( = ?auto_37078 ?auto_37075 ) ) ( not ( = ?auto_37074 ?auto_37080 ) ) ( not ( = ?auto_37074 ?auto_37078 ) ) ( ON ?auto_37074 ?auto_37079 ) ( not ( = ?auto_37074 ?auto_37079 ) ) ( not ( = ?auto_37075 ?auto_37079 ) ) ( not ( = ?auto_37076 ?auto_37079 ) ) ( not ( = ?auto_37077 ?auto_37079 ) ) ( not ( = ?auto_37080 ?auto_37079 ) ) ( not ( = ?auto_37078 ?auto_37079 ) ) ( ON ?auto_37075 ?auto_37074 ) ( ON-TABLE ?auto_37079 ) ( ON ?auto_37076 ?auto_37075 ) ( ON ?auto_37077 ?auto_37076 ) ( CLEAR ?auto_37077 ) ( HOLDING ?auto_37078 ) ( CLEAR ?auto_37080 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37080 ?auto_37078 )
      ( MAKE-3PILE ?auto_37074 ?auto_37075 ?auto_37076 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37081 - BLOCK
      ?auto_37082 - BLOCK
      ?auto_37083 - BLOCK
    )
    :vars
    (
      ?auto_37087 - BLOCK
      ?auto_37084 - BLOCK
      ?auto_37086 - BLOCK
      ?auto_37085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37081 ?auto_37082 ) ) ( not ( = ?auto_37081 ?auto_37083 ) ) ( not ( = ?auto_37082 ?auto_37083 ) ) ( not ( = ?auto_37081 ?auto_37087 ) ) ( not ( = ?auto_37082 ?auto_37087 ) ) ( not ( = ?auto_37083 ?auto_37087 ) ) ( ON-TABLE ?auto_37084 ) ( not ( = ?auto_37084 ?auto_37086 ) ) ( not ( = ?auto_37084 ?auto_37087 ) ) ( not ( = ?auto_37084 ?auto_37083 ) ) ( not ( = ?auto_37084 ?auto_37082 ) ) ( not ( = ?auto_37086 ?auto_37087 ) ) ( not ( = ?auto_37086 ?auto_37083 ) ) ( not ( = ?auto_37086 ?auto_37082 ) ) ( not ( = ?auto_37081 ?auto_37084 ) ) ( not ( = ?auto_37081 ?auto_37086 ) ) ( ON ?auto_37081 ?auto_37085 ) ( not ( = ?auto_37081 ?auto_37085 ) ) ( not ( = ?auto_37082 ?auto_37085 ) ) ( not ( = ?auto_37083 ?auto_37085 ) ) ( not ( = ?auto_37087 ?auto_37085 ) ) ( not ( = ?auto_37084 ?auto_37085 ) ) ( not ( = ?auto_37086 ?auto_37085 ) ) ( ON ?auto_37082 ?auto_37081 ) ( ON-TABLE ?auto_37085 ) ( ON ?auto_37083 ?auto_37082 ) ( ON ?auto_37087 ?auto_37083 ) ( CLEAR ?auto_37084 ) ( ON ?auto_37086 ?auto_37087 ) ( CLEAR ?auto_37086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37085 ?auto_37081 ?auto_37082 ?auto_37083 ?auto_37087 )
      ( MAKE-3PILE ?auto_37081 ?auto_37082 ?auto_37083 ) )
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
      ?auto_37092 - BLOCK
      ?auto_37094 - BLOCK
      ?auto_37093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37088 ?auto_37089 ) ) ( not ( = ?auto_37088 ?auto_37090 ) ) ( not ( = ?auto_37089 ?auto_37090 ) ) ( not ( = ?auto_37088 ?auto_37091 ) ) ( not ( = ?auto_37089 ?auto_37091 ) ) ( not ( = ?auto_37090 ?auto_37091 ) ) ( not ( = ?auto_37092 ?auto_37094 ) ) ( not ( = ?auto_37092 ?auto_37091 ) ) ( not ( = ?auto_37092 ?auto_37090 ) ) ( not ( = ?auto_37092 ?auto_37089 ) ) ( not ( = ?auto_37094 ?auto_37091 ) ) ( not ( = ?auto_37094 ?auto_37090 ) ) ( not ( = ?auto_37094 ?auto_37089 ) ) ( not ( = ?auto_37088 ?auto_37092 ) ) ( not ( = ?auto_37088 ?auto_37094 ) ) ( ON ?auto_37088 ?auto_37093 ) ( not ( = ?auto_37088 ?auto_37093 ) ) ( not ( = ?auto_37089 ?auto_37093 ) ) ( not ( = ?auto_37090 ?auto_37093 ) ) ( not ( = ?auto_37091 ?auto_37093 ) ) ( not ( = ?auto_37092 ?auto_37093 ) ) ( not ( = ?auto_37094 ?auto_37093 ) ) ( ON ?auto_37089 ?auto_37088 ) ( ON-TABLE ?auto_37093 ) ( ON ?auto_37090 ?auto_37089 ) ( ON ?auto_37091 ?auto_37090 ) ( ON ?auto_37094 ?auto_37091 ) ( CLEAR ?auto_37094 ) ( HOLDING ?auto_37092 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37092 )
      ( MAKE-3PILE ?auto_37088 ?auto_37089 ?auto_37090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_37095 - BLOCK
      ?auto_37096 - BLOCK
      ?auto_37097 - BLOCK
    )
    :vars
    (
      ?auto_37099 - BLOCK
      ?auto_37101 - BLOCK
      ?auto_37098 - BLOCK
      ?auto_37100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37095 ?auto_37096 ) ) ( not ( = ?auto_37095 ?auto_37097 ) ) ( not ( = ?auto_37096 ?auto_37097 ) ) ( not ( = ?auto_37095 ?auto_37099 ) ) ( not ( = ?auto_37096 ?auto_37099 ) ) ( not ( = ?auto_37097 ?auto_37099 ) ) ( not ( = ?auto_37101 ?auto_37098 ) ) ( not ( = ?auto_37101 ?auto_37099 ) ) ( not ( = ?auto_37101 ?auto_37097 ) ) ( not ( = ?auto_37101 ?auto_37096 ) ) ( not ( = ?auto_37098 ?auto_37099 ) ) ( not ( = ?auto_37098 ?auto_37097 ) ) ( not ( = ?auto_37098 ?auto_37096 ) ) ( not ( = ?auto_37095 ?auto_37101 ) ) ( not ( = ?auto_37095 ?auto_37098 ) ) ( ON ?auto_37095 ?auto_37100 ) ( not ( = ?auto_37095 ?auto_37100 ) ) ( not ( = ?auto_37096 ?auto_37100 ) ) ( not ( = ?auto_37097 ?auto_37100 ) ) ( not ( = ?auto_37099 ?auto_37100 ) ) ( not ( = ?auto_37101 ?auto_37100 ) ) ( not ( = ?auto_37098 ?auto_37100 ) ) ( ON ?auto_37096 ?auto_37095 ) ( ON-TABLE ?auto_37100 ) ( ON ?auto_37097 ?auto_37096 ) ( ON ?auto_37099 ?auto_37097 ) ( ON ?auto_37098 ?auto_37099 ) ( ON ?auto_37101 ?auto_37098 ) ( CLEAR ?auto_37101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37100 ?auto_37095 ?auto_37096 ?auto_37097 ?auto_37099 ?auto_37098 )
      ( MAKE-3PILE ?auto_37095 ?auto_37096 ?auto_37097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37117 - BLOCK
      ?auto_37118 - BLOCK
    )
    :vars
    (
      ?auto_37120 - BLOCK
      ?auto_37119 - BLOCK
      ?auto_37121 - BLOCK
      ?auto_37122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37120 ?auto_37118 ) ( ON-TABLE ?auto_37117 ) ( ON ?auto_37118 ?auto_37117 ) ( not ( = ?auto_37117 ?auto_37118 ) ) ( not ( = ?auto_37117 ?auto_37120 ) ) ( not ( = ?auto_37118 ?auto_37120 ) ) ( not ( = ?auto_37117 ?auto_37119 ) ) ( not ( = ?auto_37117 ?auto_37121 ) ) ( not ( = ?auto_37118 ?auto_37119 ) ) ( not ( = ?auto_37118 ?auto_37121 ) ) ( not ( = ?auto_37120 ?auto_37119 ) ) ( not ( = ?auto_37120 ?auto_37121 ) ) ( not ( = ?auto_37119 ?auto_37121 ) ) ( ON ?auto_37119 ?auto_37120 ) ( CLEAR ?auto_37119 ) ( HOLDING ?auto_37121 ) ( CLEAR ?auto_37122 ) ( ON-TABLE ?auto_37122 ) ( not ( = ?auto_37122 ?auto_37121 ) ) ( not ( = ?auto_37117 ?auto_37122 ) ) ( not ( = ?auto_37118 ?auto_37122 ) ) ( not ( = ?auto_37120 ?auto_37122 ) ) ( not ( = ?auto_37119 ?auto_37122 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37122 ?auto_37121 )
      ( MAKE-2PILE ?auto_37117 ?auto_37118 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37123 - BLOCK
      ?auto_37124 - BLOCK
    )
    :vars
    (
      ?auto_37127 - BLOCK
      ?auto_37125 - BLOCK
      ?auto_37128 - BLOCK
      ?auto_37126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37127 ?auto_37124 ) ( ON-TABLE ?auto_37123 ) ( ON ?auto_37124 ?auto_37123 ) ( not ( = ?auto_37123 ?auto_37124 ) ) ( not ( = ?auto_37123 ?auto_37127 ) ) ( not ( = ?auto_37124 ?auto_37127 ) ) ( not ( = ?auto_37123 ?auto_37125 ) ) ( not ( = ?auto_37123 ?auto_37128 ) ) ( not ( = ?auto_37124 ?auto_37125 ) ) ( not ( = ?auto_37124 ?auto_37128 ) ) ( not ( = ?auto_37127 ?auto_37125 ) ) ( not ( = ?auto_37127 ?auto_37128 ) ) ( not ( = ?auto_37125 ?auto_37128 ) ) ( ON ?auto_37125 ?auto_37127 ) ( CLEAR ?auto_37126 ) ( ON-TABLE ?auto_37126 ) ( not ( = ?auto_37126 ?auto_37128 ) ) ( not ( = ?auto_37123 ?auto_37126 ) ) ( not ( = ?auto_37124 ?auto_37126 ) ) ( not ( = ?auto_37127 ?auto_37126 ) ) ( not ( = ?auto_37125 ?auto_37126 ) ) ( ON ?auto_37128 ?auto_37125 ) ( CLEAR ?auto_37128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37123 ?auto_37124 ?auto_37127 ?auto_37125 )
      ( MAKE-2PILE ?auto_37123 ?auto_37124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37129 - BLOCK
      ?auto_37130 - BLOCK
    )
    :vars
    (
      ?auto_37132 - BLOCK
      ?auto_37131 - BLOCK
      ?auto_37133 - BLOCK
      ?auto_37134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37132 ?auto_37130 ) ( ON-TABLE ?auto_37129 ) ( ON ?auto_37130 ?auto_37129 ) ( not ( = ?auto_37129 ?auto_37130 ) ) ( not ( = ?auto_37129 ?auto_37132 ) ) ( not ( = ?auto_37130 ?auto_37132 ) ) ( not ( = ?auto_37129 ?auto_37131 ) ) ( not ( = ?auto_37129 ?auto_37133 ) ) ( not ( = ?auto_37130 ?auto_37131 ) ) ( not ( = ?auto_37130 ?auto_37133 ) ) ( not ( = ?auto_37132 ?auto_37131 ) ) ( not ( = ?auto_37132 ?auto_37133 ) ) ( not ( = ?auto_37131 ?auto_37133 ) ) ( ON ?auto_37131 ?auto_37132 ) ( not ( = ?auto_37134 ?auto_37133 ) ) ( not ( = ?auto_37129 ?auto_37134 ) ) ( not ( = ?auto_37130 ?auto_37134 ) ) ( not ( = ?auto_37132 ?auto_37134 ) ) ( not ( = ?auto_37131 ?auto_37134 ) ) ( ON ?auto_37133 ?auto_37131 ) ( CLEAR ?auto_37133 ) ( HOLDING ?auto_37134 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37134 )
      ( MAKE-2PILE ?auto_37129 ?auto_37130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37143 - BLOCK
      ?auto_37144 - BLOCK
    )
    :vars
    (
      ?auto_37145 - BLOCK
      ?auto_37147 - BLOCK
      ?auto_37146 - BLOCK
      ?auto_37148 - BLOCK
      ?auto_37149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37145 ?auto_37144 ) ( ON-TABLE ?auto_37143 ) ( ON ?auto_37144 ?auto_37143 ) ( not ( = ?auto_37143 ?auto_37144 ) ) ( not ( = ?auto_37143 ?auto_37145 ) ) ( not ( = ?auto_37144 ?auto_37145 ) ) ( not ( = ?auto_37143 ?auto_37147 ) ) ( not ( = ?auto_37143 ?auto_37146 ) ) ( not ( = ?auto_37144 ?auto_37147 ) ) ( not ( = ?auto_37144 ?auto_37146 ) ) ( not ( = ?auto_37145 ?auto_37147 ) ) ( not ( = ?auto_37145 ?auto_37146 ) ) ( not ( = ?auto_37147 ?auto_37146 ) ) ( ON ?auto_37147 ?auto_37145 ) ( not ( = ?auto_37148 ?auto_37146 ) ) ( not ( = ?auto_37143 ?auto_37148 ) ) ( not ( = ?auto_37144 ?auto_37148 ) ) ( not ( = ?auto_37145 ?auto_37148 ) ) ( not ( = ?auto_37147 ?auto_37148 ) ) ( ON ?auto_37146 ?auto_37147 ) ( CLEAR ?auto_37146 ) ( ON ?auto_37148 ?auto_37149 ) ( CLEAR ?auto_37148 ) ( HAND-EMPTY ) ( not ( = ?auto_37143 ?auto_37149 ) ) ( not ( = ?auto_37144 ?auto_37149 ) ) ( not ( = ?auto_37145 ?auto_37149 ) ) ( not ( = ?auto_37147 ?auto_37149 ) ) ( not ( = ?auto_37146 ?auto_37149 ) ) ( not ( = ?auto_37148 ?auto_37149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37148 ?auto_37149 )
      ( MAKE-2PILE ?auto_37143 ?auto_37144 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37150 - BLOCK
      ?auto_37151 - BLOCK
    )
    :vars
    (
      ?auto_37153 - BLOCK
      ?auto_37154 - BLOCK
      ?auto_37156 - BLOCK
      ?auto_37152 - BLOCK
      ?auto_37155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37153 ?auto_37151 ) ( ON-TABLE ?auto_37150 ) ( ON ?auto_37151 ?auto_37150 ) ( not ( = ?auto_37150 ?auto_37151 ) ) ( not ( = ?auto_37150 ?auto_37153 ) ) ( not ( = ?auto_37151 ?auto_37153 ) ) ( not ( = ?auto_37150 ?auto_37154 ) ) ( not ( = ?auto_37150 ?auto_37156 ) ) ( not ( = ?auto_37151 ?auto_37154 ) ) ( not ( = ?auto_37151 ?auto_37156 ) ) ( not ( = ?auto_37153 ?auto_37154 ) ) ( not ( = ?auto_37153 ?auto_37156 ) ) ( not ( = ?auto_37154 ?auto_37156 ) ) ( ON ?auto_37154 ?auto_37153 ) ( not ( = ?auto_37152 ?auto_37156 ) ) ( not ( = ?auto_37150 ?auto_37152 ) ) ( not ( = ?auto_37151 ?auto_37152 ) ) ( not ( = ?auto_37153 ?auto_37152 ) ) ( not ( = ?auto_37154 ?auto_37152 ) ) ( ON ?auto_37152 ?auto_37155 ) ( CLEAR ?auto_37152 ) ( not ( = ?auto_37150 ?auto_37155 ) ) ( not ( = ?auto_37151 ?auto_37155 ) ) ( not ( = ?auto_37153 ?auto_37155 ) ) ( not ( = ?auto_37154 ?auto_37155 ) ) ( not ( = ?auto_37156 ?auto_37155 ) ) ( not ( = ?auto_37152 ?auto_37155 ) ) ( HOLDING ?auto_37156 ) ( CLEAR ?auto_37154 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37150 ?auto_37151 ?auto_37153 ?auto_37154 ?auto_37156 )
      ( MAKE-2PILE ?auto_37150 ?auto_37151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37196 - BLOCK
      ?auto_37197 - BLOCK
      ?auto_37198 - BLOCK
      ?auto_37199 - BLOCK
    )
    :vars
    (
      ?auto_37200 - BLOCK
      ?auto_37201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37196 ) ( ON ?auto_37197 ?auto_37196 ) ( not ( = ?auto_37196 ?auto_37197 ) ) ( not ( = ?auto_37196 ?auto_37198 ) ) ( not ( = ?auto_37196 ?auto_37199 ) ) ( not ( = ?auto_37197 ?auto_37198 ) ) ( not ( = ?auto_37197 ?auto_37199 ) ) ( not ( = ?auto_37198 ?auto_37199 ) ) ( ON ?auto_37199 ?auto_37200 ) ( not ( = ?auto_37196 ?auto_37200 ) ) ( not ( = ?auto_37197 ?auto_37200 ) ) ( not ( = ?auto_37198 ?auto_37200 ) ) ( not ( = ?auto_37199 ?auto_37200 ) ) ( CLEAR ?auto_37197 ) ( ON ?auto_37198 ?auto_37199 ) ( CLEAR ?auto_37198 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37201 ) ( ON ?auto_37200 ?auto_37201 ) ( not ( = ?auto_37201 ?auto_37200 ) ) ( not ( = ?auto_37201 ?auto_37199 ) ) ( not ( = ?auto_37201 ?auto_37198 ) ) ( not ( = ?auto_37196 ?auto_37201 ) ) ( not ( = ?auto_37197 ?auto_37201 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37201 ?auto_37200 ?auto_37199 )
      ( MAKE-4PILE ?auto_37196 ?auto_37197 ?auto_37198 ?auto_37199 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37202 - BLOCK
      ?auto_37203 - BLOCK
      ?auto_37204 - BLOCK
      ?auto_37205 - BLOCK
    )
    :vars
    (
      ?auto_37206 - BLOCK
      ?auto_37207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37202 ) ( not ( = ?auto_37202 ?auto_37203 ) ) ( not ( = ?auto_37202 ?auto_37204 ) ) ( not ( = ?auto_37202 ?auto_37205 ) ) ( not ( = ?auto_37203 ?auto_37204 ) ) ( not ( = ?auto_37203 ?auto_37205 ) ) ( not ( = ?auto_37204 ?auto_37205 ) ) ( ON ?auto_37205 ?auto_37206 ) ( not ( = ?auto_37202 ?auto_37206 ) ) ( not ( = ?auto_37203 ?auto_37206 ) ) ( not ( = ?auto_37204 ?auto_37206 ) ) ( not ( = ?auto_37205 ?auto_37206 ) ) ( ON ?auto_37204 ?auto_37205 ) ( CLEAR ?auto_37204 ) ( ON-TABLE ?auto_37207 ) ( ON ?auto_37206 ?auto_37207 ) ( not ( = ?auto_37207 ?auto_37206 ) ) ( not ( = ?auto_37207 ?auto_37205 ) ) ( not ( = ?auto_37207 ?auto_37204 ) ) ( not ( = ?auto_37202 ?auto_37207 ) ) ( not ( = ?auto_37203 ?auto_37207 ) ) ( HOLDING ?auto_37203 ) ( CLEAR ?auto_37202 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37202 ?auto_37203 )
      ( MAKE-4PILE ?auto_37202 ?auto_37203 ?auto_37204 ?auto_37205 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37208 - BLOCK
      ?auto_37209 - BLOCK
      ?auto_37210 - BLOCK
      ?auto_37211 - BLOCK
    )
    :vars
    (
      ?auto_37212 - BLOCK
      ?auto_37213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37208 ) ( not ( = ?auto_37208 ?auto_37209 ) ) ( not ( = ?auto_37208 ?auto_37210 ) ) ( not ( = ?auto_37208 ?auto_37211 ) ) ( not ( = ?auto_37209 ?auto_37210 ) ) ( not ( = ?auto_37209 ?auto_37211 ) ) ( not ( = ?auto_37210 ?auto_37211 ) ) ( ON ?auto_37211 ?auto_37212 ) ( not ( = ?auto_37208 ?auto_37212 ) ) ( not ( = ?auto_37209 ?auto_37212 ) ) ( not ( = ?auto_37210 ?auto_37212 ) ) ( not ( = ?auto_37211 ?auto_37212 ) ) ( ON ?auto_37210 ?auto_37211 ) ( ON-TABLE ?auto_37213 ) ( ON ?auto_37212 ?auto_37213 ) ( not ( = ?auto_37213 ?auto_37212 ) ) ( not ( = ?auto_37213 ?auto_37211 ) ) ( not ( = ?auto_37213 ?auto_37210 ) ) ( not ( = ?auto_37208 ?auto_37213 ) ) ( not ( = ?auto_37209 ?auto_37213 ) ) ( CLEAR ?auto_37208 ) ( ON ?auto_37209 ?auto_37210 ) ( CLEAR ?auto_37209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37213 ?auto_37212 ?auto_37211 ?auto_37210 )
      ( MAKE-4PILE ?auto_37208 ?auto_37209 ?auto_37210 ?auto_37211 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37214 - BLOCK
      ?auto_37215 - BLOCK
      ?auto_37216 - BLOCK
      ?auto_37217 - BLOCK
    )
    :vars
    (
      ?auto_37219 - BLOCK
      ?auto_37218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37214 ?auto_37215 ) ) ( not ( = ?auto_37214 ?auto_37216 ) ) ( not ( = ?auto_37214 ?auto_37217 ) ) ( not ( = ?auto_37215 ?auto_37216 ) ) ( not ( = ?auto_37215 ?auto_37217 ) ) ( not ( = ?auto_37216 ?auto_37217 ) ) ( ON ?auto_37217 ?auto_37219 ) ( not ( = ?auto_37214 ?auto_37219 ) ) ( not ( = ?auto_37215 ?auto_37219 ) ) ( not ( = ?auto_37216 ?auto_37219 ) ) ( not ( = ?auto_37217 ?auto_37219 ) ) ( ON ?auto_37216 ?auto_37217 ) ( ON-TABLE ?auto_37218 ) ( ON ?auto_37219 ?auto_37218 ) ( not ( = ?auto_37218 ?auto_37219 ) ) ( not ( = ?auto_37218 ?auto_37217 ) ) ( not ( = ?auto_37218 ?auto_37216 ) ) ( not ( = ?auto_37214 ?auto_37218 ) ) ( not ( = ?auto_37215 ?auto_37218 ) ) ( ON ?auto_37215 ?auto_37216 ) ( CLEAR ?auto_37215 ) ( HOLDING ?auto_37214 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37214 )
      ( MAKE-4PILE ?auto_37214 ?auto_37215 ?auto_37216 ?auto_37217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37220 - BLOCK
      ?auto_37221 - BLOCK
      ?auto_37222 - BLOCK
      ?auto_37223 - BLOCK
    )
    :vars
    (
      ?auto_37225 - BLOCK
      ?auto_37224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37220 ?auto_37221 ) ) ( not ( = ?auto_37220 ?auto_37222 ) ) ( not ( = ?auto_37220 ?auto_37223 ) ) ( not ( = ?auto_37221 ?auto_37222 ) ) ( not ( = ?auto_37221 ?auto_37223 ) ) ( not ( = ?auto_37222 ?auto_37223 ) ) ( ON ?auto_37223 ?auto_37225 ) ( not ( = ?auto_37220 ?auto_37225 ) ) ( not ( = ?auto_37221 ?auto_37225 ) ) ( not ( = ?auto_37222 ?auto_37225 ) ) ( not ( = ?auto_37223 ?auto_37225 ) ) ( ON ?auto_37222 ?auto_37223 ) ( ON-TABLE ?auto_37224 ) ( ON ?auto_37225 ?auto_37224 ) ( not ( = ?auto_37224 ?auto_37225 ) ) ( not ( = ?auto_37224 ?auto_37223 ) ) ( not ( = ?auto_37224 ?auto_37222 ) ) ( not ( = ?auto_37220 ?auto_37224 ) ) ( not ( = ?auto_37221 ?auto_37224 ) ) ( ON ?auto_37221 ?auto_37222 ) ( ON ?auto_37220 ?auto_37221 ) ( CLEAR ?auto_37220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37224 ?auto_37225 ?auto_37223 ?auto_37222 ?auto_37221 )
      ( MAKE-4PILE ?auto_37220 ?auto_37221 ?auto_37222 ?auto_37223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37230 - BLOCK
      ?auto_37231 - BLOCK
      ?auto_37232 - BLOCK
      ?auto_37233 - BLOCK
    )
    :vars
    (
      ?auto_37234 - BLOCK
      ?auto_37235 - BLOCK
      ?auto_37236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37230 ?auto_37231 ) ) ( not ( = ?auto_37230 ?auto_37232 ) ) ( not ( = ?auto_37230 ?auto_37233 ) ) ( not ( = ?auto_37231 ?auto_37232 ) ) ( not ( = ?auto_37231 ?auto_37233 ) ) ( not ( = ?auto_37232 ?auto_37233 ) ) ( ON ?auto_37233 ?auto_37234 ) ( not ( = ?auto_37230 ?auto_37234 ) ) ( not ( = ?auto_37231 ?auto_37234 ) ) ( not ( = ?auto_37232 ?auto_37234 ) ) ( not ( = ?auto_37233 ?auto_37234 ) ) ( ON ?auto_37232 ?auto_37233 ) ( ON-TABLE ?auto_37235 ) ( ON ?auto_37234 ?auto_37235 ) ( not ( = ?auto_37235 ?auto_37234 ) ) ( not ( = ?auto_37235 ?auto_37233 ) ) ( not ( = ?auto_37235 ?auto_37232 ) ) ( not ( = ?auto_37230 ?auto_37235 ) ) ( not ( = ?auto_37231 ?auto_37235 ) ) ( ON ?auto_37231 ?auto_37232 ) ( CLEAR ?auto_37231 ) ( ON ?auto_37230 ?auto_37236 ) ( CLEAR ?auto_37230 ) ( HAND-EMPTY ) ( not ( = ?auto_37230 ?auto_37236 ) ) ( not ( = ?auto_37231 ?auto_37236 ) ) ( not ( = ?auto_37232 ?auto_37236 ) ) ( not ( = ?auto_37233 ?auto_37236 ) ) ( not ( = ?auto_37234 ?auto_37236 ) ) ( not ( = ?auto_37235 ?auto_37236 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37230 ?auto_37236 )
      ( MAKE-4PILE ?auto_37230 ?auto_37231 ?auto_37232 ?auto_37233 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37237 - BLOCK
      ?auto_37238 - BLOCK
      ?auto_37239 - BLOCK
      ?auto_37240 - BLOCK
    )
    :vars
    (
      ?auto_37241 - BLOCK
      ?auto_37242 - BLOCK
      ?auto_37243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37237 ?auto_37238 ) ) ( not ( = ?auto_37237 ?auto_37239 ) ) ( not ( = ?auto_37237 ?auto_37240 ) ) ( not ( = ?auto_37238 ?auto_37239 ) ) ( not ( = ?auto_37238 ?auto_37240 ) ) ( not ( = ?auto_37239 ?auto_37240 ) ) ( ON ?auto_37240 ?auto_37241 ) ( not ( = ?auto_37237 ?auto_37241 ) ) ( not ( = ?auto_37238 ?auto_37241 ) ) ( not ( = ?auto_37239 ?auto_37241 ) ) ( not ( = ?auto_37240 ?auto_37241 ) ) ( ON ?auto_37239 ?auto_37240 ) ( ON-TABLE ?auto_37242 ) ( ON ?auto_37241 ?auto_37242 ) ( not ( = ?auto_37242 ?auto_37241 ) ) ( not ( = ?auto_37242 ?auto_37240 ) ) ( not ( = ?auto_37242 ?auto_37239 ) ) ( not ( = ?auto_37237 ?auto_37242 ) ) ( not ( = ?auto_37238 ?auto_37242 ) ) ( ON ?auto_37237 ?auto_37243 ) ( CLEAR ?auto_37237 ) ( not ( = ?auto_37237 ?auto_37243 ) ) ( not ( = ?auto_37238 ?auto_37243 ) ) ( not ( = ?auto_37239 ?auto_37243 ) ) ( not ( = ?auto_37240 ?auto_37243 ) ) ( not ( = ?auto_37241 ?auto_37243 ) ) ( not ( = ?auto_37242 ?auto_37243 ) ) ( HOLDING ?auto_37238 ) ( CLEAR ?auto_37239 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37242 ?auto_37241 ?auto_37240 ?auto_37239 ?auto_37238 )
      ( MAKE-4PILE ?auto_37237 ?auto_37238 ?auto_37239 ?auto_37240 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37244 - BLOCK
      ?auto_37245 - BLOCK
      ?auto_37246 - BLOCK
      ?auto_37247 - BLOCK
    )
    :vars
    (
      ?auto_37248 - BLOCK
      ?auto_37250 - BLOCK
      ?auto_37249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37244 ?auto_37245 ) ) ( not ( = ?auto_37244 ?auto_37246 ) ) ( not ( = ?auto_37244 ?auto_37247 ) ) ( not ( = ?auto_37245 ?auto_37246 ) ) ( not ( = ?auto_37245 ?auto_37247 ) ) ( not ( = ?auto_37246 ?auto_37247 ) ) ( ON ?auto_37247 ?auto_37248 ) ( not ( = ?auto_37244 ?auto_37248 ) ) ( not ( = ?auto_37245 ?auto_37248 ) ) ( not ( = ?auto_37246 ?auto_37248 ) ) ( not ( = ?auto_37247 ?auto_37248 ) ) ( ON ?auto_37246 ?auto_37247 ) ( ON-TABLE ?auto_37250 ) ( ON ?auto_37248 ?auto_37250 ) ( not ( = ?auto_37250 ?auto_37248 ) ) ( not ( = ?auto_37250 ?auto_37247 ) ) ( not ( = ?auto_37250 ?auto_37246 ) ) ( not ( = ?auto_37244 ?auto_37250 ) ) ( not ( = ?auto_37245 ?auto_37250 ) ) ( ON ?auto_37244 ?auto_37249 ) ( not ( = ?auto_37244 ?auto_37249 ) ) ( not ( = ?auto_37245 ?auto_37249 ) ) ( not ( = ?auto_37246 ?auto_37249 ) ) ( not ( = ?auto_37247 ?auto_37249 ) ) ( not ( = ?auto_37248 ?auto_37249 ) ) ( not ( = ?auto_37250 ?auto_37249 ) ) ( CLEAR ?auto_37246 ) ( ON ?auto_37245 ?auto_37244 ) ( CLEAR ?auto_37245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37249 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37249 ?auto_37244 )
      ( MAKE-4PILE ?auto_37244 ?auto_37245 ?auto_37246 ?auto_37247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37251 - BLOCK
      ?auto_37252 - BLOCK
      ?auto_37253 - BLOCK
      ?auto_37254 - BLOCK
    )
    :vars
    (
      ?auto_37257 - BLOCK
      ?auto_37256 - BLOCK
      ?auto_37255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37251 ?auto_37252 ) ) ( not ( = ?auto_37251 ?auto_37253 ) ) ( not ( = ?auto_37251 ?auto_37254 ) ) ( not ( = ?auto_37252 ?auto_37253 ) ) ( not ( = ?auto_37252 ?auto_37254 ) ) ( not ( = ?auto_37253 ?auto_37254 ) ) ( ON ?auto_37254 ?auto_37257 ) ( not ( = ?auto_37251 ?auto_37257 ) ) ( not ( = ?auto_37252 ?auto_37257 ) ) ( not ( = ?auto_37253 ?auto_37257 ) ) ( not ( = ?auto_37254 ?auto_37257 ) ) ( ON-TABLE ?auto_37256 ) ( ON ?auto_37257 ?auto_37256 ) ( not ( = ?auto_37256 ?auto_37257 ) ) ( not ( = ?auto_37256 ?auto_37254 ) ) ( not ( = ?auto_37256 ?auto_37253 ) ) ( not ( = ?auto_37251 ?auto_37256 ) ) ( not ( = ?auto_37252 ?auto_37256 ) ) ( ON ?auto_37251 ?auto_37255 ) ( not ( = ?auto_37251 ?auto_37255 ) ) ( not ( = ?auto_37252 ?auto_37255 ) ) ( not ( = ?auto_37253 ?auto_37255 ) ) ( not ( = ?auto_37254 ?auto_37255 ) ) ( not ( = ?auto_37257 ?auto_37255 ) ) ( not ( = ?auto_37256 ?auto_37255 ) ) ( ON ?auto_37252 ?auto_37251 ) ( CLEAR ?auto_37252 ) ( ON-TABLE ?auto_37255 ) ( HOLDING ?auto_37253 ) ( CLEAR ?auto_37254 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37256 ?auto_37257 ?auto_37254 ?auto_37253 )
      ( MAKE-4PILE ?auto_37251 ?auto_37252 ?auto_37253 ?auto_37254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37258 - BLOCK
      ?auto_37259 - BLOCK
      ?auto_37260 - BLOCK
      ?auto_37261 - BLOCK
    )
    :vars
    (
      ?auto_37264 - BLOCK
      ?auto_37262 - BLOCK
      ?auto_37263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37258 ?auto_37259 ) ) ( not ( = ?auto_37258 ?auto_37260 ) ) ( not ( = ?auto_37258 ?auto_37261 ) ) ( not ( = ?auto_37259 ?auto_37260 ) ) ( not ( = ?auto_37259 ?auto_37261 ) ) ( not ( = ?auto_37260 ?auto_37261 ) ) ( ON ?auto_37261 ?auto_37264 ) ( not ( = ?auto_37258 ?auto_37264 ) ) ( not ( = ?auto_37259 ?auto_37264 ) ) ( not ( = ?auto_37260 ?auto_37264 ) ) ( not ( = ?auto_37261 ?auto_37264 ) ) ( ON-TABLE ?auto_37262 ) ( ON ?auto_37264 ?auto_37262 ) ( not ( = ?auto_37262 ?auto_37264 ) ) ( not ( = ?auto_37262 ?auto_37261 ) ) ( not ( = ?auto_37262 ?auto_37260 ) ) ( not ( = ?auto_37258 ?auto_37262 ) ) ( not ( = ?auto_37259 ?auto_37262 ) ) ( ON ?auto_37258 ?auto_37263 ) ( not ( = ?auto_37258 ?auto_37263 ) ) ( not ( = ?auto_37259 ?auto_37263 ) ) ( not ( = ?auto_37260 ?auto_37263 ) ) ( not ( = ?auto_37261 ?auto_37263 ) ) ( not ( = ?auto_37264 ?auto_37263 ) ) ( not ( = ?auto_37262 ?auto_37263 ) ) ( ON ?auto_37259 ?auto_37258 ) ( ON-TABLE ?auto_37263 ) ( CLEAR ?auto_37261 ) ( ON ?auto_37260 ?auto_37259 ) ( CLEAR ?auto_37260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37263 ?auto_37258 ?auto_37259 )
      ( MAKE-4PILE ?auto_37258 ?auto_37259 ?auto_37260 ?auto_37261 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37265 - BLOCK
      ?auto_37266 - BLOCK
      ?auto_37267 - BLOCK
      ?auto_37268 - BLOCK
    )
    :vars
    (
      ?auto_37271 - BLOCK
      ?auto_37269 - BLOCK
      ?auto_37270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37265 ?auto_37266 ) ) ( not ( = ?auto_37265 ?auto_37267 ) ) ( not ( = ?auto_37265 ?auto_37268 ) ) ( not ( = ?auto_37266 ?auto_37267 ) ) ( not ( = ?auto_37266 ?auto_37268 ) ) ( not ( = ?auto_37267 ?auto_37268 ) ) ( not ( = ?auto_37265 ?auto_37271 ) ) ( not ( = ?auto_37266 ?auto_37271 ) ) ( not ( = ?auto_37267 ?auto_37271 ) ) ( not ( = ?auto_37268 ?auto_37271 ) ) ( ON-TABLE ?auto_37269 ) ( ON ?auto_37271 ?auto_37269 ) ( not ( = ?auto_37269 ?auto_37271 ) ) ( not ( = ?auto_37269 ?auto_37268 ) ) ( not ( = ?auto_37269 ?auto_37267 ) ) ( not ( = ?auto_37265 ?auto_37269 ) ) ( not ( = ?auto_37266 ?auto_37269 ) ) ( ON ?auto_37265 ?auto_37270 ) ( not ( = ?auto_37265 ?auto_37270 ) ) ( not ( = ?auto_37266 ?auto_37270 ) ) ( not ( = ?auto_37267 ?auto_37270 ) ) ( not ( = ?auto_37268 ?auto_37270 ) ) ( not ( = ?auto_37271 ?auto_37270 ) ) ( not ( = ?auto_37269 ?auto_37270 ) ) ( ON ?auto_37266 ?auto_37265 ) ( ON-TABLE ?auto_37270 ) ( ON ?auto_37267 ?auto_37266 ) ( CLEAR ?auto_37267 ) ( HOLDING ?auto_37268 ) ( CLEAR ?auto_37271 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37269 ?auto_37271 ?auto_37268 )
      ( MAKE-4PILE ?auto_37265 ?auto_37266 ?auto_37267 ?auto_37268 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37272 - BLOCK
      ?auto_37273 - BLOCK
      ?auto_37274 - BLOCK
      ?auto_37275 - BLOCK
    )
    :vars
    (
      ?auto_37277 - BLOCK
      ?auto_37276 - BLOCK
      ?auto_37278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37272 ?auto_37273 ) ) ( not ( = ?auto_37272 ?auto_37274 ) ) ( not ( = ?auto_37272 ?auto_37275 ) ) ( not ( = ?auto_37273 ?auto_37274 ) ) ( not ( = ?auto_37273 ?auto_37275 ) ) ( not ( = ?auto_37274 ?auto_37275 ) ) ( not ( = ?auto_37272 ?auto_37277 ) ) ( not ( = ?auto_37273 ?auto_37277 ) ) ( not ( = ?auto_37274 ?auto_37277 ) ) ( not ( = ?auto_37275 ?auto_37277 ) ) ( ON-TABLE ?auto_37276 ) ( ON ?auto_37277 ?auto_37276 ) ( not ( = ?auto_37276 ?auto_37277 ) ) ( not ( = ?auto_37276 ?auto_37275 ) ) ( not ( = ?auto_37276 ?auto_37274 ) ) ( not ( = ?auto_37272 ?auto_37276 ) ) ( not ( = ?auto_37273 ?auto_37276 ) ) ( ON ?auto_37272 ?auto_37278 ) ( not ( = ?auto_37272 ?auto_37278 ) ) ( not ( = ?auto_37273 ?auto_37278 ) ) ( not ( = ?auto_37274 ?auto_37278 ) ) ( not ( = ?auto_37275 ?auto_37278 ) ) ( not ( = ?auto_37277 ?auto_37278 ) ) ( not ( = ?auto_37276 ?auto_37278 ) ) ( ON ?auto_37273 ?auto_37272 ) ( ON-TABLE ?auto_37278 ) ( ON ?auto_37274 ?auto_37273 ) ( CLEAR ?auto_37277 ) ( ON ?auto_37275 ?auto_37274 ) ( CLEAR ?auto_37275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37278 ?auto_37272 ?auto_37273 ?auto_37274 )
      ( MAKE-4PILE ?auto_37272 ?auto_37273 ?auto_37274 ?auto_37275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37279 - BLOCK
      ?auto_37280 - BLOCK
      ?auto_37281 - BLOCK
      ?auto_37282 - BLOCK
    )
    :vars
    (
      ?auto_37284 - BLOCK
      ?auto_37285 - BLOCK
      ?auto_37283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37279 ?auto_37280 ) ) ( not ( = ?auto_37279 ?auto_37281 ) ) ( not ( = ?auto_37279 ?auto_37282 ) ) ( not ( = ?auto_37280 ?auto_37281 ) ) ( not ( = ?auto_37280 ?auto_37282 ) ) ( not ( = ?auto_37281 ?auto_37282 ) ) ( not ( = ?auto_37279 ?auto_37284 ) ) ( not ( = ?auto_37280 ?auto_37284 ) ) ( not ( = ?auto_37281 ?auto_37284 ) ) ( not ( = ?auto_37282 ?auto_37284 ) ) ( ON-TABLE ?auto_37285 ) ( not ( = ?auto_37285 ?auto_37284 ) ) ( not ( = ?auto_37285 ?auto_37282 ) ) ( not ( = ?auto_37285 ?auto_37281 ) ) ( not ( = ?auto_37279 ?auto_37285 ) ) ( not ( = ?auto_37280 ?auto_37285 ) ) ( ON ?auto_37279 ?auto_37283 ) ( not ( = ?auto_37279 ?auto_37283 ) ) ( not ( = ?auto_37280 ?auto_37283 ) ) ( not ( = ?auto_37281 ?auto_37283 ) ) ( not ( = ?auto_37282 ?auto_37283 ) ) ( not ( = ?auto_37284 ?auto_37283 ) ) ( not ( = ?auto_37285 ?auto_37283 ) ) ( ON ?auto_37280 ?auto_37279 ) ( ON-TABLE ?auto_37283 ) ( ON ?auto_37281 ?auto_37280 ) ( ON ?auto_37282 ?auto_37281 ) ( CLEAR ?auto_37282 ) ( HOLDING ?auto_37284 ) ( CLEAR ?auto_37285 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37285 ?auto_37284 )
      ( MAKE-4PILE ?auto_37279 ?auto_37280 ?auto_37281 ?auto_37282 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37286 - BLOCK
      ?auto_37287 - BLOCK
      ?auto_37288 - BLOCK
      ?auto_37289 - BLOCK
    )
    :vars
    (
      ?auto_37292 - BLOCK
      ?auto_37291 - BLOCK
      ?auto_37290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37286 ?auto_37287 ) ) ( not ( = ?auto_37286 ?auto_37288 ) ) ( not ( = ?auto_37286 ?auto_37289 ) ) ( not ( = ?auto_37287 ?auto_37288 ) ) ( not ( = ?auto_37287 ?auto_37289 ) ) ( not ( = ?auto_37288 ?auto_37289 ) ) ( not ( = ?auto_37286 ?auto_37292 ) ) ( not ( = ?auto_37287 ?auto_37292 ) ) ( not ( = ?auto_37288 ?auto_37292 ) ) ( not ( = ?auto_37289 ?auto_37292 ) ) ( ON-TABLE ?auto_37291 ) ( not ( = ?auto_37291 ?auto_37292 ) ) ( not ( = ?auto_37291 ?auto_37289 ) ) ( not ( = ?auto_37291 ?auto_37288 ) ) ( not ( = ?auto_37286 ?auto_37291 ) ) ( not ( = ?auto_37287 ?auto_37291 ) ) ( ON ?auto_37286 ?auto_37290 ) ( not ( = ?auto_37286 ?auto_37290 ) ) ( not ( = ?auto_37287 ?auto_37290 ) ) ( not ( = ?auto_37288 ?auto_37290 ) ) ( not ( = ?auto_37289 ?auto_37290 ) ) ( not ( = ?auto_37292 ?auto_37290 ) ) ( not ( = ?auto_37291 ?auto_37290 ) ) ( ON ?auto_37287 ?auto_37286 ) ( ON-TABLE ?auto_37290 ) ( ON ?auto_37288 ?auto_37287 ) ( ON ?auto_37289 ?auto_37288 ) ( CLEAR ?auto_37291 ) ( ON ?auto_37292 ?auto_37289 ) ( CLEAR ?auto_37292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37290 ?auto_37286 ?auto_37287 ?auto_37288 ?auto_37289 )
      ( MAKE-4PILE ?auto_37286 ?auto_37287 ?auto_37288 ?auto_37289 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37293 - BLOCK
      ?auto_37294 - BLOCK
      ?auto_37295 - BLOCK
      ?auto_37296 - BLOCK
    )
    :vars
    (
      ?auto_37299 - BLOCK
      ?auto_37297 - BLOCK
      ?auto_37298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37293 ?auto_37294 ) ) ( not ( = ?auto_37293 ?auto_37295 ) ) ( not ( = ?auto_37293 ?auto_37296 ) ) ( not ( = ?auto_37294 ?auto_37295 ) ) ( not ( = ?auto_37294 ?auto_37296 ) ) ( not ( = ?auto_37295 ?auto_37296 ) ) ( not ( = ?auto_37293 ?auto_37299 ) ) ( not ( = ?auto_37294 ?auto_37299 ) ) ( not ( = ?auto_37295 ?auto_37299 ) ) ( not ( = ?auto_37296 ?auto_37299 ) ) ( not ( = ?auto_37297 ?auto_37299 ) ) ( not ( = ?auto_37297 ?auto_37296 ) ) ( not ( = ?auto_37297 ?auto_37295 ) ) ( not ( = ?auto_37293 ?auto_37297 ) ) ( not ( = ?auto_37294 ?auto_37297 ) ) ( ON ?auto_37293 ?auto_37298 ) ( not ( = ?auto_37293 ?auto_37298 ) ) ( not ( = ?auto_37294 ?auto_37298 ) ) ( not ( = ?auto_37295 ?auto_37298 ) ) ( not ( = ?auto_37296 ?auto_37298 ) ) ( not ( = ?auto_37299 ?auto_37298 ) ) ( not ( = ?auto_37297 ?auto_37298 ) ) ( ON ?auto_37294 ?auto_37293 ) ( ON-TABLE ?auto_37298 ) ( ON ?auto_37295 ?auto_37294 ) ( ON ?auto_37296 ?auto_37295 ) ( ON ?auto_37299 ?auto_37296 ) ( CLEAR ?auto_37299 ) ( HOLDING ?auto_37297 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37297 )
      ( MAKE-4PILE ?auto_37293 ?auto_37294 ?auto_37295 ?auto_37296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_37300 - BLOCK
      ?auto_37301 - BLOCK
      ?auto_37302 - BLOCK
      ?auto_37303 - BLOCK
    )
    :vars
    (
      ?auto_37306 - BLOCK
      ?auto_37305 - BLOCK
      ?auto_37304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37300 ?auto_37301 ) ) ( not ( = ?auto_37300 ?auto_37302 ) ) ( not ( = ?auto_37300 ?auto_37303 ) ) ( not ( = ?auto_37301 ?auto_37302 ) ) ( not ( = ?auto_37301 ?auto_37303 ) ) ( not ( = ?auto_37302 ?auto_37303 ) ) ( not ( = ?auto_37300 ?auto_37306 ) ) ( not ( = ?auto_37301 ?auto_37306 ) ) ( not ( = ?auto_37302 ?auto_37306 ) ) ( not ( = ?auto_37303 ?auto_37306 ) ) ( not ( = ?auto_37305 ?auto_37306 ) ) ( not ( = ?auto_37305 ?auto_37303 ) ) ( not ( = ?auto_37305 ?auto_37302 ) ) ( not ( = ?auto_37300 ?auto_37305 ) ) ( not ( = ?auto_37301 ?auto_37305 ) ) ( ON ?auto_37300 ?auto_37304 ) ( not ( = ?auto_37300 ?auto_37304 ) ) ( not ( = ?auto_37301 ?auto_37304 ) ) ( not ( = ?auto_37302 ?auto_37304 ) ) ( not ( = ?auto_37303 ?auto_37304 ) ) ( not ( = ?auto_37306 ?auto_37304 ) ) ( not ( = ?auto_37305 ?auto_37304 ) ) ( ON ?auto_37301 ?auto_37300 ) ( ON-TABLE ?auto_37304 ) ( ON ?auto_37302 ?auto_37301 ) ( ON ?auto_37303 ?auto_37302 ) ( ON ?auto_37306 ?auto_37303 ) ( ON ?auto_37305 ?auto_37306 ) ( CLEAR ?auto_37305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37304 ?auto_37300 ?auto_37301 ?auto_37302 ?auto_37303 ?auto_37306 )
      ( MAKE-4PILE ?auto_37300 ?auto_37301 ?auto_37302 ?auto_37303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37318 - BLOCK
    )
    :vars
    (
      ?auto_37320 - BLOCK
      ?auto_37321 - BLOCK
      ?auto_37319 - BLOCK
      ?auto_37323 - BLOCK
      ?auto_37322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37320 ?auto_37318 ) ( ON-TABLE ?auto_37318 ) ( not ( = ?auto_37318 ?auto_37320 ) ) ( not ( = ?auto_37318 ?auto_37321 ) ) ( not ( = ?auto_37318 ?auto_37319 ) ) ( not ( = ?auto_37320 ?auto_37321 ) ) ( not ( = ?auto_37320 ?auto_37319 ) ) ( not ( = ?auto_37321 ?auto_37319 ) ) ( ON ?auto_37321 ?auto_37320 ) ( CLEAR ?auto_37321 ) ( HOLDING ?auto_37319 ) ( CLEAR ?auto_37323 ) ( ON-TABLE ?auto_37322 ) ( ON ?auto_37323 ?auto_37322 ) ( not ( = ?auto_37322 ?auto_37323 ) ) ( not ( = ?auto_37322 ?auto_37319 ) ) ( not ( = ?auto_37323 ?auto_37319 ) ) ( not ( = ?auto_37318 ?auto_37323 ) ) ( not ( = ?auto_37318 ?auto_37322 ) ) ( not ( = ?auto_37320 ?auto_37323 ) ) ( not ( = ?auto_37320 ?auto_37322 ) ) ( not ( = ?auto_37321 ?auto_37323 ) ) ( not ( = ?auto_37321 ?auto_37322 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37322 ?auto_37323 ?auto_37319 )
      ( MAKE-1PILE ?auto_37318 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37324 - BLOCK
    )
    :vars
    (
      ?auto_37326 - BLOCK
      ?auto_37327 - BLOCK
      ?auto_37325 - BLOCK
      ?auto_37329 - BLOCK
      ?auto_37328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37326 ?auto_37324 ) ( ON-TABLE ?auto_37324 ) ( not ( = ?auto_37324 ?auto_37326 ) ) ( not ( = ?auto_37324 ?auto_37327 ) ) ( not ( = ?auto_37324 ?auto_37325 ) ) ( not ( = ?auto_37326 ?auto_37327 ) ) ( not ( = ?auto_37326 ?auto_37325 ) ) ( not ( = ?auto_37327 ?auto_37325 ) ) ( ON ?auto_37327 ?auto_37326 ) ( CLEAR ?auto_37329 ) ( ON-TABLE ?auto_37328 ) ( ON ?auto_37329 ?auto_37328 ) ( not ( = ?auto_37328 ?auto_37329 ) ) ( not ( = ?auto_37328 ?auto_37325 ) ) ( not ( = ?auto_37329 ?auto_37325 ) ) ( not ( = ?auto_37324 ?auto_37329 ) ) ( not ( = ?auto_37324 ?auto_37328 ) ) ( not ( = ?auto_37326 ?auto_37329 ) ) ( not ( = ?auto_37326 ?auto_37328 ) ) ( not ( = ?auto_37327 ?auto_37329 ) ) ( not ( = ?auto_37327 ?auto_37328 ) ) ( ON ?auto_37325 ?auto_37327 ) ( CLEAR ?auto_37325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37324 ?auto_37326 ?auto_37327 )
      ( MAKE-1PILE ?auto_37324 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37330 - BLOCK
    )
    :vars
    (
      ?auto_37335 - BLOCK
      ?auto_37333 - BLOCK
      ?auto_37331 - BLOCK
      ?auto_37332 - BLOCK
      ?auto_37334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37335 ?auto_37330 ) ( ON-TABLE ?auto_37330 ) ( not ( = ?auto_37330 ?auto_37335 ) ) ( not ( = ?auto_37330 ?auto_37333 ) ) ( not ( = ?auto_37330 ?auto_37331 ) ) ( not ( = ?auto_37335 ?auto_37333 ) ) ( not ( = ?auto_37335 ?auto_37331 ) ) ( not ( = ?auto_37333 ?auto_37331 ) ) ( ON ?auto_37333 ?auto_37335 ) ( ON-TABLE ?auto_37332 ) ( not ( = ?auto_37332 ?auto_37334 ) ) ( not ( = ?auto_37332 ?auto_37331 ) ) ( not ( = ?auto_37334 ?auto_37331 ) ) ( not ( = ?auto_37330 ?auto_37334 ) ) ( not ( = ?auto_37330 ?auto_37332 ) ) ( not ( = ?auto_37335 ?auto_37334 ) ) ( not ( = ?auto_37335 ?auto_37332 ) ) ( not ( = ?auto_37333 ?auto_37334 ) ) ( not ( = ?auto_37333 ?auto_37332 ) ) ( ON ?auto_37331 ?auto_37333 ) ( CLEAR ?auto_37331 ) ( HOLDING ?auto_37334 ) ( CLEAR ?auto_37332 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37332 ?auto_37334 )
      ( MAKE-1PILE ?auto_37330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37336 - BLOCK
    )
    :vars
    (
      ?auto_37340 - BLOCK
      ?auto_37338 - BLOCK
      ?auto_37341 - BLOCK
      ?auto_37337 - BLOCK
      ?auto_37339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37340 ?auto_37336 ) ( ON-TABLE ?auto_37336 ) ( not ( = ?auto_37336 ?auto_37340 ) ) ( not ( = ?auto_37336 ?auto_37338 ) ) ( not ( = ?auto_37336 ?auto_37341 ) ) ( not ( = ?auto_37340 ?auto_37338 ) ) ( not ( = ?auto_37340 ?auto_37341 ) ) ( not ( = ?auto_37338 ?auto_37341 ) ) ( ON ?auto_37338 ?auto_37340 ) ( ON-TABLE ?auto_37337 ) ( not ( = ?auto_37337 ?auto_37339 ) ) ( not ( = ?auto_37337 ?auto_37341 ) ) ( not ( = ?auto_37339 ?auto_37341 ) ) ( not ( = ?auto_37336 ?auto_37339 ) ) ( not ( = ?auto_37336 ?auto_37337 ) ) ( not ( = ?auto_37340 ?auto_37339 ) ) ( not ( = ?auto_37340 ?auto_37337 ) ) ( not ( = ?auto_37338 ?auto_37339 ) ) ( not ( = ?auto_37338 ?auto_37337 ) ) ( ON ?auto_37341 ?auto_37338 ) ( CLEAR ?auto_37337 ) ( ON ?auto_37339 ?auto_37341 ) ( CLEAR ?auto_37339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37336 ?auto_37340 ?auto_37338 ?auto_37341 )
      ( MAKE-1PILE ?auto_37336 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37342 - BLOCK
    )
    :vars
    (
      ?auto_37347 - BLOCK
      ?auto_37343 - BLOCK
      ?auto_37344 - BLOCK
      ?auto_37346 - BLOCK
      ?auto_37345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37347 ?auto_37342 ) ( ON-TABLE ?auto_37342 ) ( not ( = ?auto_37342 ?auto_37347 ) ) ( not ( = ?auto_37342 ?auto_37343 ) ) ( not ( = ?auto_37342 ?auto_37344 ) ) ( not ( = ?auto_37347 ?auto_37343 ) ) ( not ( = ?auto_37347 ?auto_37344 ) ) ( not ( = ?auto_37343 ?auto_37344 ) ) ( ON ?auto_37343 ?auto_37347 ) ( not ( = ?auto_37346 ?auto_37345 ) ) ( not ( = ?auto_37346 ?auto_37344 ) ) ( not ( = ?auto_37345 ?auto_37344 ) ) ( not ( = ?auto_37342 ?auto_37345 ) ) ( not ( = ?auto_37342 ?auto_37346 ) ) ( not ( = ?auto_37347 ?auto_37345 ) ) ( not ( = ?auto_37347 ?auto_37346 ) ) ( not ( = ?auto_37343 ?auto_37345 ) ) ( not ( = ?auto_37343 ?auto_37346 ) ) ( ON ?auto_37344 ?auto_37343 ) ( ON ?auto_37345 ?auto_37344 ) ( CLEAR ?auto_37345 ) ( HOLDING ?auto_37346 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37346 )
      ( MAKE-1PILE ?auto_37342 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37355 - BLOCK
    )
    :vars
    (
      ?auto_37357 - BLOCK
      ?auto_37358 - BLOCK
      ?auto_37359 - BLOCK
      ?auto_37356 - BLOCK
      ?auto_37360 - BLOCK
      ?auto_37361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37357 ?auto_37355 ) ( ON-TABLE ?auto_37355 ) ( not ( = ?auto_37355 ?auto_37357 ) ) ( not ( = ?auto_37355 ?auto_37358 ) ) ( not ( = ?auto_37355 ?auto_37359 ) ) ( not ( = ?auto_37357 ?auto_37358 ) ) ( not ( = ?auto_37357 ?auto_37359 ) ) ( not ( = ?auto_37358 ?auto_37359 ) ) ( ON ?auto_37358 ?auto_37357 ) ( not ( = ?auto_37356 ?auto_37360 ) ) ( not ( = ?auto_37356 ?auto_37359 ) ) ( not ( = ?auto_37360 ?auto_37359 ) ) ( not ( = ?auto_37355 ?auto_37360 ) ) ( not ( = ?auto_37355 ?auto_37356 ) ) ( not ( = ?auto_37357 ?auto_37360 ) ) ( not ( = ?auto_37357 ?auto_37356 ) ) ( not ( = ?auto_37358 ?auto_37360 ) ) ( not ( = ?auto_37358 ?auto_37356 ) ) ( ON ?auto_37359 ?auto_37358 ) ( ON ?auto_37360 ?auto_37359 ) ( CLEAR ?auto_37360 ) ( ON ?auto_37356 ?auto_37361 ) ( CLEAR ?auto_37356 ) ( HAND-EMPTY ) ( not ( = ?auto_37355 ?auto_37361 ) ) ( not ( = ?auto_37357 ?auto_37361 ) ) ( not ( = ?auto_37358 ?auto_37361 ) ) ( not ( = ?auto_37359 ?auto_37361 ) ) ( not ( = ?auto_37356 ?auto_37361 ) ) ( not ( = ?auto_37360 ?auto_37361 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37356 ?auto_37361 )
      ( MAKE-1PILE ?auto_37355 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37362 - BLOCK
    )
    :vars
    (
      ?auto_37367 - BLOCK
      ?auto_37365 - BLOCK
      ?auto_37368 - BLOCK
      ?auto_37364 - BLOCK
      ?auto_37366 - BLOCK
      ?auto_37363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37367 ?auto_37362 ) ( ON-TABLE ?auto_37362 ) ( not ( = ?auto_37362 ?auto_37367 ) ) ( not ( = ?auto_37362 ?auto_37365 ) ) ( not ( = ?auto_37362 ?auto_37368 ) ) ( not ( = ?auto_37367 ?auto_37365 ) ) ( not ( = ?auto_37367 ?auto_37368 ) ) ( not ( = ?auto_37365 ?auto_37368 ) ) ( ON ?auto_37365 ?auto_37367 ) ( not ( = ?auto_37364 ?auto_37366 ) ) ( not ( = ?auto_37364 ?auto_37368 ) ) ( not ( = ?auto_37366 ?auto_37368 ) ) ( not ( = ?auto_37362 ?auto_37366 ) ) ( not ( = ?auto_37362 ?auto_37364 ) ) ( not ( = ?auto_37367 ?auto_37366 ) ) ( not ( = ?auto_37367 ?auto_37364 ) ) ( not ( = ?auto_37365 ?auto_37366 ) ) ( not ( = ?auto_37365 ?auto_37364 ) ) ( ON ?auto_37368 ?auto_37365 ) ( ON ?auto_37364 ?auto_37363 ) ( CLEAR ?auto_37364 ) ( not ( = ?auto_37362 ?auto_37363 ) ) ( not ( = ?auto_37367 ?auto_37363 ) ) ( not ( = ?auto_37365 ?auto_37363 ) ) ( not ( = ?auto_37368 ?auto_37363 ) ) ( not ( = ?auto_37364 ?auto_37363 ) ) ( not ( = ?auto_37366 ?auto_37363 ) ) ( HOLDING ?auto_37366 ) ( CLEAR ?auto_37368 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37362 ?auto_37367 ?auto_37365 ?auto_37368 ?auto_37366 )
      ( MAKE-1PILE ?auto_37362 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_37369 - BLOCK
    )
    :vars
    (
      ?auto_37374 - BLOCK
      ?auto_37375 - BLOCK
      ?auto_37370 - BLOCK
      ?auto_37373 - BLOCK
      ?auto_37371 - BLOCK
      ?auto_37372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37374 ?auto_37369 ) ( ON-TABLE ?auto_37369 ) ( not ( = ?auto_37369 ?auto_37374 ) ) ( not ( = ?auto_37369 ?auto_37375 ) ) ( not ( = ?auto_37369 ?auto_37370 ) ) ( not ( = ?auto_37374 ?auto_37375 ) ) ( not ( = ?auto_37374 ?auto_37370 ) ) ( not ( = ?auto_37375 ?auto_37370 ) ) ( ON ?auto_37375 ?auto_37374 ) ( not ( = ?auto_37373 ?auto_37371 ) ) ( not ( = ?auto_37373 ?auto_37370 ) ) ( not ( = ?auto_37371 ?auto_37370 ) ) ( not ( = ?auto_37369 ?auto_37371 ) ) ( not ( = ?auto_37369 ?auto_37373 ) ) ( not ( = ?auto_37374 ?auto_37371 ) ) ( not ( = ?auto_37374 ?auto_37373 ) ) ( not ( = ?auto_37375 ?auto_37371 ) ) ( not ( = ?auto_37375 ?auto_37373 ) ) ( ON ?auto_37370 ?auto_37375 ) ( ON ?auto_37373 ?auto_37372 ) ( not ( = ?auto_37369 ?auto_37372 ) ) ( not ( = ?auto_37374 ?auto_37372 ) ) ( not ( = ?auto_37375 ?auto_37372 ) ) ( not ( = ?auto_37370 ?auto_37372 ) ) ( not ( = ?auto_37373 ?auto_37372 ) ) ( not ( = ?auto_37371 ?auto_37372 ) ) ( CLEAR ?auto_37370 ) ( ON ?auto_37371 ?auto_37373 ) ( CLEAR ?auto_37371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37372 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37372 ?auto_37373 )
      ( MAKE-1PILE ?auto_37369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37409 - BLOCK
      ?auto_37410 - BLOCK
      ?auto_37411 - BLOCK
      ?auto_37412 - BLOCK
      ?auto_37413 - BLOCK
    )
    :vars
    (
      ?auto_37414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37409 ) ( ON ?auto_37410 ?auto_37409 ) ( ON ?auto_37411 ?auto_37410 ) ( not ( = ?auto_37409 ?auto_37410 ) ) ( not ( = ?auto_37409 ?auto_37411 ) ) ( not ( = ?auto_37409 ?auto_37412 ) ) ( not ( = ?auto_37409 ?auto_37413 ) ) ( not ( = ?auto_37410 ?auto_37411 ) ) ( not ( = ?auto_37410 ?auto_37412 ) ) ( not ( = ?auto_37410 ?auto_37413 ) ) ( not ( = ?auto_37411 ?auto_37412 ) ) ( not ( = ?auto_37411 ?auto_37413 ) ) ( not ( = ?auto_37412 ?auto_37413 ) ) ( ON ?auto_37413 ?auto_37414 ) ( not ( = ?auto_37409 ?auto_37414 ) ) ( not ( = ?auto_37410 ?auto_37414 ) ) ( not ( = ?auto_37411 ?auto_37414 ) ) ( not ( = ?auto_37412 ?auto_37414 ) ) ( not ( = ?auto_37413 ?auto_37414 ) ) ( CLEAR ?auto_37411 ) ( ON ?auto_37412 ?auto_37413 ) ( CLEAR ?auto_37412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37414 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37414 ?auto_37413 )
      ( MAKE-5PILE ?auto_37409 ?auto_37410 ?auto_37411 ?auto_37412 ?auto_37413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37415 - BLOCK
      ?auto_37416 - BLOCK
      ?auto_37417 - BLOCK
      ?auto_37418 - BLOCK
      ?auto_37419 - BLOCK
    )
    :vars
    (
      ?auto_37420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37415 ) ( ON ?auto_37416 ?auto_37415 ) ( not ( = ?auto_37415 ?auto_37416 ) ) ( not ( = ?auto_37415 ?auto_37417 ) ) ( not ( = ?auto_37415 ?auto_37418 ) ) ( not ( = ?auto_37415 ?auto_37419 ) ) ( not ( = ?auto_37416 ?auto_37417 ) ) ( not ( = ?auto_37416 ?auto_37418 ) ) ( not ( = ?auto_37416 ?auto_37419 ) ) ( not ( = ?auto_37417 ?auto_37418 ) ) ( not ( = ?auto_37417 ?auto_37419 ) ) ( not ( = ?auto_37418 ?auto_37419 ) ) ( ON ?auto_37419 ?auto_37420 ) ( not ( = ?auto_37415 ?auto_37420 ) ) ( not ( = ?auto_37416 ?auto_37420 ) ) ( not ( = ?auto_37417 ?auto_37420 ) ) ( not ( = ?auto_37418 ?auto_37420 ) ) ( not ( = ?auto_37419 ?auto_37420 ) ) ( ON ?auto_37418 ?auto_37419 ) ( CLEAR ?auto_37418 ) ( ON-TABLE ?auto_37420 ) ( HOLDING ?auto_37417 ) ( CLEAR ?auto_37416 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37415 ?auto_37416 ?auto_37417 )
      ( MAKE-5PILE ?auto_37415 ?auto_37416 ?auto_37417 ?auto_37418 ?auto_37419 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37421 - BLOCK
      ?auto_37422 - BLOCK
      ?auto_37423 - BLOCK
      ?auto_37424 - BLOCK
      ?auto_37425 - BLOCK
    )
    :vars
    (
      ?auto_37426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37421 ) ( ON ?auto_37422 ?auto_37421 ) ( not ( = ?auto_37421 ?auto_37422 ) ) ( not ( = ?auto_37421 ?auto_37423 ) ) ( not ( = ?auto_37421 ?auto_37424 ) ) ( not ( = ?auto_37421 ?auto_37425 ) ) ( not ( = ?auto_37422 ?auto_37423 ) ) ( not ( = ?auto_37422 ?auto_37424 ) ) ( not ( = ?auto_37422 ?auto_37425 ) ) ( not ( = ?auto_37423 ?auto_37424 ) ) ( not ( = ?auto_37423 ?auto_37425 ) ) ( not ( = ?auto_37424 ?auto_37425 ) ) ( ON ?auto_37425 ?auto_37426 ) ( not ( = ?auto_37421 ?auto_37426 ) ) ( not ( = ?auto_37422 ?auto_37426 ) ) ( not ( = ?auto_37423 ?auto_37426 ) ) ( not ( = ?auto_37424 ?auto_37426 ) ) ( not ( = ?auto_37425 ?auto_37426 ) ) ( ON ?auto_37424 ?auto_37425 ) ( ON-TABLE ?auto_37426 ) ( CLEAR ?auto_37422 ) ( ON ?auto_37423 ?auto_37424 ) ( CLEAR ?auto_37423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37426 ?auto_37425 ?auto_37424 )
      ( MAKE-5PILE ?auto_37421 ?auto_37422 ?auto_37423 ?auto_37424 ?auto_37425 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37427 - BLOCK
      ?auto_37428 - BLOCK
      ?auto_37429 - BLOCK
      ?auto_37430 - BLOCK
      ?auto_37431 - BLOCK
    )
    :vars
    (
      ?auto_37432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37427 ) ( not ( = ?auto_37427 ?auto_37428 ) ) ( not ( = ?auto_37427 ?auto_37429 ) ) ( not ( = ?auto_37427 ?auto_37430 ) ) ( not ( = ?auto_37427 ?auto_37431 ) ) ( not ( = ?auto_37428 ?auto_37429 ) ) ( not ( = ?auto_37428 ?auto_37430 ) ) ( not ( = ?auto_37428 ?auto_37431 ) ) ( not ( = ?auto_37429 ?auto_37430 ) ) ( not ( = ?auto_37429 ?auto_37431 ) ) ( not ( = ?auto_37430 ?auto_37431 ) ) ( ON ?auto_37431 ?auto_37432 ) ( not ( = ?auto_37427 ?auto_37432 ) ) ( not ( = ?auto_37428 ?auto_37432 ) ) ( not ( = ?auto_37429 ?auto_37432 ) ) ( not ( = ?auto_37430 ?auto_37432 ) ) ( not ( = ?auto_37431 ?auto_37432 ) ) ( ON ?auto_37430 ?auto_37431 ) ( ON-TABLE ?auto_37432 ) ( ON ?auto_37429 ?auto_37430 ) ( CLEAR ?auto_37429 ) ( HOLDING ?auto_37428 ) ( CLEAR ?auto_37427 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37427 ?auto_37428 )
      ( MAKE-5PILE ?auto_37427 ?auto_37428 ?auto_37429 ?auto_37430 ?auto_37431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37433 - BLOCK
      ?auto_37434 - BLOCK
      ?auto_37435 - BLOCK
      ?auto_37436 - BLOCK
      ?auto_37437 - BLOCK
    )
    :vars
    (
      ?auto_37438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37433 ) ( not ( = ?auto_37433 ?auto_37434 ) ) ( not ( = ?auto_37433 ?auto_37435 ) ) ( not ( = ?auto_37433 ?auto_37436 ) ) ( not ( = ?auto_37433 ?auto_37437 ) ) ( not ( = ?auto_37434 ?auto_37435 ) ) ( not ( = ?auto_37434 ?auto_37436 ) ) ( not ( = ?auto_37434 ?auto_37437 ) ) ( not ( = ?auto_37435 ?auto_37436 ) ) ( not ( = ?auto_37435 ?auto_37437 ) ) ( not ( = ?auto_37436 ?auto_37437 ) ) ( ON ?auto_37437 ?auto_37438 ) ( not ( = ?auto_37433 ?auto_37438 ) ) ( not ( = ?auto_37434 ?auto_37438 ) ) ( not ( = ?auto_37435 ?auto_37438 ) ) ( not ( = ?auto_37436 ?auto_37438 ) ) ( not ( = ?auto_37437 ?auto_37438 ) ) ( ON ?auto_37436 ?auto_37437 ) ( ON-TABLE ?auto_37438 ) ( ON ?auto_37435 ?auto_37436 ) ( CLEAR ?auto_37433 ) ( ON ?auto_37434 ?auto_37435 ) ( CLEAR ?auto_37434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37438 ?auto_37437 ?auto_37436 ?auto_37435 )
      ( MAKE-5PILE ?auto_37433 ?auto_37434 ?auto_37435 ?auto_37436 ?auto_37437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37439 - BLOCK
      ?auto_37440 - BLOCK
      ?auto_37441 - BLOCK
      ?auto_37442 - BLOCK
      ?auto_37443 - BLOCK
    )
    :vars
    (
      ?auto_37444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37439 ?auto_37440 ) ) ( not ( = ?auto_37439 ?auto_37441 ) ) ( not ( = ?auto_37439 ?auto_37442 ) ) ( not ( = ?auto_37439 ?auto_37443 ) ) ( not ( = ?auto_37440 ?auto_37441 ) ) ( not ( = ?auto_37440 ?auto_37442 ) ) ( not ( = ?auto_37440 ?auto_37443 ) ) ( not ( = ?auto_37441 ?auto_37442 ) ) ( not ( = ?auto_37441 ?auto_37443 ) ) ( not ( = ?auto_37442 ?auto_37443 ) ) ( ON ?auto_37443 ?auto_37444 ) ( not ( = ?auto_37439 ?auto_37444 ) ) ( not ( = ?auto_37440 ?auto_37444 ) ) ( not ( = ?auto_37441 ?auto_37444 ) ) ( not ( = ?auto_37442 ?auto_37444 ) ) ( not ( = ?auto_37443 ?auto_37444 ) ) ( ON ?auto_37442 ?auto_37443 ) ( ON-TABLE ?auto_37444 ) ( ON ?auto_37441 ?auto_37442 ) ( ON ?auto_37440 ?auto_37441 ) ( CLEAR ?auto_37440 ) ( HOLDING ?auto_37439 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37439 )
      ( MAKE-5PILE ?auto_37439 ?auto_37440 ?auto_37441 ?auto_37442 ?auto_37443 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37445 - BLOCK
      ?auto_37446 - BLOCK
      ?auto_37447 - BLOCK
      ?auto_37448 - BLOCK
      ?auto_37449 - BLOCK
    )
    :vars
    (
      ?auto_37450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37445 ?auto_37446 ) ) ( not ( = ?auto_37445 ?auto_37447 ) ) ( not ( = ?auto_37445 ?auto_37448 ) ) ( not ( = ?auto_37445 ?auto_37449 ) ) ( not ( = ?auto_37446 ?auto_37447 ) ) ( not ( = ?auto_37446 ?auto_37448 ) ) ( not ( = ?auto_37446 ?auto_37449 ) ) ( not ( = ?auto_37447 ?auto_37448 ) ) ( not ( = ?auto_37447 ?auto_37449 ) ) ( not ( = ?auto_37448 ?auto_37449 ) ) ( ON ?auto_37449 ?auto_37450 ) ( not ( = ?auto_37445 ?auto_37450 ) ) ( not ( = ?auto_37446 ?auto_37450 ) ) ( not ( = ?auto_37447 ?auto_37450 ) ) ( not ( = ?auto_37448 ?auto_37450 ) ) ( not ( = ?auto_37449 ?auto_37450 ) ) ( ON ?auto_37448 ?auto_37449 ) ( ON-TABLE ?auto_37450 ) ( ON ?auto_37447 ?auto_37448 ) ( ON ?auto_37446 ?auto_37447 ) ( ON ?auto_37445 ?auto_37446 ) ( CLEAR ?auto_37445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37450 ?auto_37449 ?auto_37448 ?auto_37447 ?auto_37446 )
      ( MAKE-5PILE ?auto_37445 ?auto_37446 ?auto_37447 ?auto_37448 ?auto_37449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37456 - BLOCK
      ?auto_37457 - BLOCK
      ?auto_37458 - BLOCK
      ?auto_37459 - BLOCK
      ?auto_37460 - BLOCK
    )
    :vars
    (
      ?auto_37461 - BLOCK
      ?auto_37462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37456 ?auto_37457 ) ) ( not ( = ?auto_37456 ?auto_37458 ) ) ( not ( = ?auto_37456 ?auto_37459 ) ) ( not ( = ?auto_37456 ?auto_37460 ) ) ( not ( = ?auto_37457 ?auto_37458 ) ) ( not ( = ?auto_37457 ?auto_37459 ) ) ( not ( = ?auto_37457 ?auto_37460 ) ) ( not ( = ?auto_37458 ?auto_37459 ) ) ( not ( = ?auto_37458 ?auto_37460 ) ) ( not ( = ?auto_37459 ?auto_37460 ) ) ( ON ?auto_37460 ?auto_37461 ) ( not ( = ?auto_37456 ?auto_37461 ) ) ( not ( = ?auto_37457 ?auto_37461 ) ) ( not ( = ?auto_37458 ?auto_37461 ) ) ( not ( = ?auto_37459 ?auto_37461 ) ) ( not ( = ?auto_37460 ?auto_37461 ) ) ( ON ?auto_37459 ?auto_37460 ) ( ON-TABLE ?auto_37461 ) ( ON ?auto_37458 ?auto_37459 ) ( ON ?auto_37457 ?auto_37458 ) ( CLEAR ?auto_37457 ) ( ON ?auto_37456 ?auto_37462 ) ( CLEAR ?auto_37456 ) ( HAND-EMPTY ) ( not ( = ?auto_37456 ?auto_37462 ) ) ( not ( = ?auto_37457 ?auto_37462 ) ) ( not ( = ?auto_37458 ?auto_37462 ) ) ( not ( = ?auto_37459 ?auto_37462 ) ) ( not ( = ?auto_37460 ?auto_37462 ) ) ( not ( = ?auto_37461 ?auto_37462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37456 ?auto_37462 )
      ( MAKE-5PILE ?auto_37456 ?auto_37457 ?auto_37458 ?auto_37459 ?auto_37460 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37463 - BLOCK
      ?auto_37464 - BLOCK
      ?auto_37465 - BLOCK
      ?auto_37466 - BLOCK
      ?auto_37467 - BLOCK
    )
    :vars
    (
      ?auto_37469 - BLOCK
      ?auto_37468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37463 ?auto_37464 ) ) ( not ( = ?auto_37463 ?auto_37465 ) ) ( not ( = ?auto_37463 ?auto_37466 ) ) ( not ( = ?auto_37463 ?auto_37467 ) ) ( not ( = ?auto_37464 ?auto_37465 ) ) ( not ( = ?auto_37464 ?auto_37466 ) ) ( not ( = ?auto_37464 ?auto_37467 ) ) ( not ( = ?auto_37465 ?auto_37466 ) ) ( not ( = ?auto_37465 ?auto_37467 ) ) ( not ( = ?auto_37466 ?auto_37467 ) ) ( ON ?auto_37467 ?auto_37469 ) ( not ( = ?auto_37463 ?auto_37469 ) ) ( not ( = ?auto_37464 ?auto_37469 ) ) ( not ( = ?auto_37465 ?auto_37469 ) ) ( not ( = ?auto_37466 ?auto_37469 ) ) ( not ( = ?auto_37467 ?auto_37469 ) ) ( ON ?auto_37466 ?auto_37467 ) ( ON-TABLE ?auto_37469 ) ( ON ?auto_37465 ?auto_37466 ) ( ON ?auto_37463 ?auto_37468 ) ( CLEAR ?auto_37463 ) ( not ( = ?auto_37463 ?auto_37468 ) ) ( not ( = ?auto_37464 ?auto_37468 ) ) ( not ( = ?auto_37465 ?auto_37468 ) ) ( not ( = ?auto_37466 ?auto_37468 ) ) ( not ( = ?auto_37467 ?auto_37468 ) ) ( not ( = ?auto_37469 ?auto_37468 ) ) ( HOLDING ?auto_37464 ) ( CLEAR ?auto_37465 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37469 ?auto_37467 ?auto_37466 ?auto_37465 ?auto_37464 )
      ( MAKE-5PILE ?auto_37463 ?auto_37464 ?auto_37465 ?auto_37466 ?auto_37467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37470 - BLOCK
      ?auto_37471 - BLOCK
      ?auto_37472 - BLOCK
      ?auto_37473 - BLOCK
      ?auto_37474 - BLOCK
    )
    :vars
    (
      ?auto_37475 - BLOCK
      ?auto_37476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37470 ?auto_37471 ) ) ( not ( = ?auto_37470 ?auto_37472 ) ) ( not ( = ?auto_37470 ?auto_37473 ) ) ( not ( = ?auto_37470 ?auto_37474 ) ) ( not ( = ?auto_37471 ?auto_37472 ) ) ( not ( = ?auto_37471 ?auto_37473 ) ) ( not ( = ?auto_37471 ?auto_37474 ) ) ( not ( = ?auto_37472 ?auto_37473 ) ) ( not ( = ?auto_37472 ?auto_37474 ) ) ( not ( = ?auto_37473 ?auto_37474 ) ) ( ON ?auto_37474 ?auto_37475 ) ( not ( = ?auto_37470 ?auto_37475 ) ) ( not ( = ?auto_37471 ?auto_37475 ) ) ( not ( = ?auto_37472 ?auto_37475 ) ) ( not ( = ?auto_37473 ?auto_37475 ) ) ( not ( = ?auto_37474 ?auto_37475 ) ) ( ON ?auto_37473 ?auto_37474 ) ( ON-TABLE ?auto_37475 ) ( ON ?auto_37472 ?auto_37473 ) ( ON ?auto_37470 ?auto_37476 ) ( not ( = ?auto_37470 ?auto_37476 ) ) ( not ( = ?auto_37471 ?auto_37476 ) ) ( not ( = ?auto_37472 ?auto_37476 ) ) ( not ( = ?auto_37473 ?auto_37476 ) ) ( not ( = ?auto_37474 ?auto_37476 ) ) ( not ( = ?auto_37475 ?auto_37476 ) ) ( CLEAR ?auto_37472 ) ( ON ?auto_37471 ?auto_37470 ) ( CLEAR ?auto_37471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37476 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37476 ?auto_37470 )
      ( MAKE-5PILE ?auto_37470 ?auto_37471 ?auto_37472 ?auto_37473 ?auto_37474 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37477 - BLOCK
      ?auto_37478 - BLOCK
      ?auto_37479 - BLOCK
      ?auto_37480 - BLOCK
      ?auto_37481 - BLOCK
    )
    :vars
    (
      ?auto_37482 - BLOCK
      ?auto_37483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37477 ?auto_37478 ) ) ( not ( = ?auto_37477 ?auto_37479 ) ) ( not ( = ?auto_37477 ?auto_37480 ) ) ( not ( = ?auto_37477 ?auto_37481 ) ) ( not ( = ?auto_37478 ?auto_37479 ) ) ( not ( = ?auto_37478 ?auto_37480 ) ) ( not ( = ?auto_37478 ?auto_37481 ) ) ( not ( = ?auto_37479 ?auto_37480 ) ) ( not ( = ?auto_37479 ?auto_37481 ) ) ( not ( = ?auto_37480 ?auto_37481 ) ) ( ON ?auto_37481 ?auto_37482 ) ( not ( = ?auto_37477 ?auto_37482 ) ) ( not ( = ?auto_37478 ?auto_37482 ) ) ( not ( = ?auto_37479 ?auto_37482 ) ) ( not ( = ?auto_37480 ?auto_37482 ) ) ( not ( = ?auto_37481 ?auto_37482 ) ) ( ON ?auto_37480 ?auto_37481 ) ( ON-TABLE ?auto_37482 ) ( ON ?auto_37477 ?auto_37483 ) ( not ( = ?auto_37477 ?auto_37483 ) ) ( not ( = ?auto_37478 ?auto_37483 ) ) ( not ( = ?auto_37479 ?auto_37483 ) ) ( not ( = ?auto_37480 ?auto_37483 ) ) ( not ( = ?auto_37481 ?auto_37483 ) ) ( not ( = ?auto_37482 ?auto_37483 ) ) ( ON ?auto_37478 ?auto_37477 ) ( CLEAR ?auto_37478 ) ( ON-TABLE ?auto_37483 ) ( HOLDING ?auto_37479 ) ( CLEAR ?auto_37480 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37482 ?auto_37481 ?auto_37480 ?auto_37479 )
      ( MAKE-5PILE ?auto_37477 ?auto_37478 ?auto_37479 ?auto_37480 ?auto_37481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37484 - BLOCK
      ?auto_37485 - BLOCK
      ?auto_37486 - BLOCK
      ?auto_37487 - BLOCK
      ?auto_37488 - BLOCK
    )
    :vars
    (
      ?auto_37490 - BLOCK
      ?auto_37489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37484 ?auto_37485 ) ) ( not ( = ?auto_37484 ?auto_37486 ) ) ( not ( = ?auto_37484 ?auto_37487 ) ) ( not ( = ?auto_37484 ?auto_37488 ) ) ( not ( = ?auto_37485 ?auto_37486 ) ) ( not ( = ?auto_37485 ?auto_37487 ) ) ( not ( = ?auto_37485 ?auto_37488 ) ) ( not ( = ?auto_37486 ?auto_37487 ) ) ( not ( = ?auto_37486 ?auto_37488 ) ) ( not ( = ?auto_37487 ?auto_37488 ) ) ( ON ?auto_37488 ?auto_37490 ) ( not ( = ?auto_37484 ?auto_37490 ) ) ( not ( = ?auto_37485 ?auto_37490 ) ) ( not ( = ?auto_37486 ?auto_37490 ) ) ( not ( = ?auto_37487 ?auto_37490 ) ) ( not ( = ?auto_37488 ?auto_37490 ) ) ( ON ?auto_37487 ?auto_37488 ) ( ON-TABLE ?auto_37490 ) ( ON ?auto_37484 ?auto_37489 ) ( not ( = ?auto_37484 ?auto_37489 ) ) ( not ( = ?auto_37485 ?auto_37489 ) ) ( not ( = ?auto_37486 ?auto_37489 ) ) ( not ( = ?auto_37487 ?auto_37489 ) ) ( not ( = ?auto_37488 ?auto_37489 ) ) ( not ( = ?auto_37490 ?auto_37489 ) ) ( ON ?auto_37485 ?auto_37484 ) ( ON-TABLE ?auto_37489 ) ( CLEAR ?auto_37487 ) ( ON ?auto_37486 ?auto_37485 ) ( CLEAR ?auto_37486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37489 ?auto_37484 ?auto_37485 )
      ( MAKE-5PILE ?auto_37484 ?auto_37485 ?auto_37486 ?auto_37487 ?auto_37488 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37491 - BLOCK
      ?auto_37492 - BLOCK
      ?auto_37493 - BLOCK
      ?auto_37494 - BLOCK
      ?auto_37495 - BLOCK
    )
    :vars
    (
      ?auto_37496 - BLOCK
      ?auto_37497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37491 ?auto_37492 ) ) ( not ( = ?auto_37491 ?auto_37493 ) ) ( not ( = ?auto_37491 ?auto_37494 ) ) ( not ( = ?auto_37491 ?auto_37495 ) ) ( not ( = ?auto_37492 ?auto_37493 ) ) ( not ( = ?auto_37492 ?auto_37494 ) ) ( not ( = ?auto_37492 ?auto_37495 ) ) ( not ( = ?auto_37493 ?auto_37494 ) ) ( not ( = ?auto_37493 ?auto_37495 ) ) ( not ( = ?auto_37494 ?auto_37495 ) ) ( ON ?auto_37495 ?auto_37496 ) ( not ( = ?auto_37491 ?auto_37496 ) ) ( not ( = ?auto_37492 ?auto_37496 ) ) ( not ( = ?auto_37493 ?auto_37496 ) ) ( not ( = ?auto_37494 ?auto_37496 ) ) ( not ( = ?auto_37495 ?auto_37496 ) ) ( ON-TABLE ?auto_37496 ) ( ON ?auto_37491 ?auto_37497 ) ( not ( = ?auto_37491 ?auto_37497 ) ) ( not ( = ?auto_37492 ?auto_37497 ) ) ( not ( = ?auto_37493 ?auto_37497 ) ) ( not ( = ?auto_37494 ?auto_37497 ) ) ( not ( = ?auto_37495 ?auto_37497 ) ) ( not ( = ?auto_37496 ?auto_37497 ) ) ( ON ?auto_37492 ?auto_37491 ) ( ON-TABLE ?auto_37497 ) ( ON ?auto_37493 ?auto_37492 ) ( CLEAR ?auto_37493 ) ( HOLDING ?auto_37494 ) ( CLEAR ?auto_37495 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37496 ?auto_37495 ?auto_37494 )
      ( MAKE-5PILE ?auto_37491 ?auto_37492 ?auto_37493 ?auto_37494 ?auto_37495 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37498 - BLOCK
      ?auto_37499 - BLOCK
      ?auto_37500 - BLOCK
      ?auto_37501 - BLOCK
      ?auto_37502 - BLOCK
    )
    :vars
    (
      ?auto_37503 - BLOCK
      ?auto_37504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37498 ?auto_37499 ) ) ( not ( = ?auto_37498 ?auto_37500 ) ) ( not ( = ?auto_37498 ?auto_37501 ) ) ( not ( = ?auto_37498 ?auto_37502 ) ) ( not ( = ?auto_37499 ?auto_37500 ) ) ( not ( = ?auto_37499 ?auto_37501 ) ) ( not ( = ?auto_37499 ?auto_37502 ) ) ( not ( = ?auto_37500 ?auto_37501 ) ) ( not ( = ?auto_37500 ?auto_37502 ) ) ( not ( = ?auto_37501 ?auto_37502 ) ) ( ON ?auto_37502 ?auto_37503 ) ( not ( = ?auto_37498 ?auto_37503 ) ) ( not ( = ?auto_37499 ?auto_37503 ) ) ( not ( = ?auto_37500 ?auto_37503 ) ) ( not ( = ?auto_37501 ?auto_37503 ) ) ( not ( = ?auto_37502 ?auto_37503 ) ) ( ON-TABLE ?auto_37503 ) ( ON ?auto_37498 ?auto_37504 ) ( not ( = ?auto_37498 ?auto_37504 ) ) ( not ( = ?auto_37499 ?auto_37504 ) ) ( not ( = ?auto_37500 ?auto_37504 ) ) ( not ( = ?auto_37501 ?auto_37504 ) ) ( not ( = ?auto_37502 ?auto_37504 ) ) ( not ( = ?auto_37503 ?auto_37504 ) ) ( ON ?auto_37499 ?auto_37498 ) ( ON-TABLE ?auto_37504 ) ( ON ?auto_37500 ?auto_37499 ) ( CLEAR ?auto_37502 ) ( ON ?auto_37501 ?auto_37500 ) ( CLEAR ?auto_37501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37504 ?auto_37498 ?auto_37499 ?auto_37500 )
      ( MAKE-5PILE ?auto_37498 ?auto_37499 ?auto_37500 ?auto_37501 ?auto_37502 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37505 - BLOCK
      ?auto_37506 - BLOCK
      ?auto_37507 - BLOCK
      ?auto_37508 - BLOCK
      ?auto_37509 - BLOCK
    )
    :vars
    (
      ?auto_37511 - BLOCK
      ?auto_37510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37505 ?auto_37506 ) ) ( not ( = ?auto_37505 ?auto_37507 ) ) ( not ( = ?auto_37505 ?auto_37508 ) ) ( not ( = ?auto_37505 ?auto_37509 ) ) ( not ( = ?auto_37506 ?auto_37507 ) ) ( not ( = ?auto_37506 ?auto_37508 ) ) ( not ( = ?auto_37506 ?auto_37509 ) ) ( not ( = ?auto_37507 ?auto_37508 ) ) ( not ( = ?auto_37507 ?auto_37509 ) ) ( not ( = ?auto_37508 ?auto_37509 ) ) ( not ( = ?auto_37505 ?auto_37511 ) ) ( not ( = ?auto_37506 ?auto_37511 ) ) ( not ( = ?auto_37507 ?auto_37511 ) ) ( not ( = ?auto_37508 ?auto_37511 ) ) ( not ( = ?auto_37509 ?auto_37511 ) ) ( ON-TABLE ?auto_37511 ) ( ON ?auto_37505 ?auto_37510 ) ( not ( = ?auto_37505 ?auto_37510 ) ) ( not ( = ?auto_37506 ?auto_37510 ) ) ( not ( = ?auto_37507 ?auto_37510 ) ) ( not ( = ?auto_37508 ?auto_37510 ) ) ( not ( = ?auto_37509 ?auto_37510 ) ) ( not ( = ?auto_37511 ?auto_37510 ) ) ( ON ?auto_37506 ?auto_37505 ) ( ON-TABLE ?auto_37510 ) ( ON ?auto_37507 ?auto_37506 ) ( ON ?auto_37508 ?auto_37507 ) ( CLEAR ?auto_37508 ) ( HOLDING ?auto_37509 ) ( CLEAR ?auto_37511 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37511 ?auto_37509 )
      ( MAKE-5PILE ?auto_37505 ?auto_37506 ?auto_37507 ?auto_37508 ?auto_37509 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37512 - BLOCK
      ?auto_37513 - BLOCK
      ?auto_37514 - BLOCK
      ?auto_37515 - BLOCK
      ?auto_37516 - BLOCK
    )
    :vars
    (
      ?auto_37517 - BLOCK
      ?auto_37518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37512 ?auto_37513 ) ) ( not ( = ?auto_37512 ?auto_37514 ) ) ( not ( = ?auto_37512 ?auto_37515 ) ) ( not ( = ?auto_37512 ?auto_37516 ) ) ( not ( = ?auto_37513 ?auto_37514 ) ) ( not ( = ?auto_37513 ?auto_37515 ) ) ( not ( = ?auto_37513 ?auto_37516 ) ) ( not ( = ?auto_37514 ?auto_37515 ) ) ( not ( = ?auto_37514 ?auto_37516 ) ) ( not ( = ?auto_37515 ?auto_37516 ) ) ( not ( = ?auto_37512 ?auto_37517 ) ) ( not ( = ?auto_37513 ?auto_37517 ) ) ( not ( = ?auto_37514 ?auto_37517 ) ) ( not ( = ?auto_37515 ?auto_37517 ) ) ( not ( = ?auto_37516 ?auto_37517 ) ) ( ON-TABLE ?auto_37517 ) ( ON ?auto_37512 ?auto_37518 ) ( not ( = ?auto_37512 ?auto_37518 ) ) ( not ( = ?auto_37513 ?auto_37518 ) ) ( not ( = ?auto_37514 ?auto_37518 ) ) ( not ( = ?auto_37515 ?auto_37518 ) ) ( not ( = ?auto_37516 ?auto_37518 ) ) ( not ( = ?auto_37517 ?auto_37518 ) ) ( ON ?auto_37513 ?auto_37512 ) ( ON-TABLE ?auto_37518 ) ( ON ?auto_37514 ?auto_37513 ) ( ON ?auto_37515 ?auto_37514 ) ( CLEAR ?auto_37517 ) ( ON ?auto_37516 ?auto_37515 ) ( CLEAR ?auto_37516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37518 ?auto_37512 ?auto_37513 ?auto_37514 ?auto_37515 )
      ( MAKE-5PILE ?auto_37512 ?auto_37513 ?auto_37514 ?auto_37515 ?auto_37516 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37519 - BLOCK
      ?auto_37520 - BLOCK
      ?auto_37521 - BLOCK
      ?auto_37522 - BLOCK
      ?auto_37523 - BLOCK
    )
    :vars
    (
      ?auto_37524 - BLOCK
      ?auto_37525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37519 ?auto_37520 ) ) ( not ( = ?auto_37519 ?auto_37521 ) ) ( not ( = ?auto_37519 ?auto_37522 ) ) ( not ( = ?auto_37519 ?auto_37523 ) ) ( not ( = ?auto_37520 ?auto_37521 ) ) ( not ( = ?auto_37520 ?auto_37522 ) ) ( not ( = ?auto_37520 ?auto_37523 ) ) ( not ( = ?auto_37521 ?auto_37522 ) ) ( not ( = ?auto_37521 ?auto_37523 ) ) ( not ( = ?auto_37522 ?auto_37523 ) ) ( not ( = ?auto_37519 ?auto_37524 ) ) ( not ( = ?auto_37520 ?auto_37524 ) ) ( not ( = ?auto_37521 ?auto_37524 ) ) ( not ( = ?auto_37522 ?auto_37524 ) ) ( not ( = ?auto_37523 ?auto_37524 ) ) ( ON ?auto_37519 ?auto_37525 ) ( not ( = ?auto_37519 ?auto_37525 ) ) ( not ( = ?auto_37520 ?auto_37525 ) ) ( not ( = ?auto_37521 ?auto_37525 ) ) ( not ( = ?auto_37522 ?auto_37525 ) ) ( not ( = ?auto_37523 ?auto_37525 ) ) ( not ( = ?auto_37524 ?auto_37525 ) ) ( ON ?auto_37520 ?auto_37519 ) ( ON-TABLE ?auto_37525 ) ( ON ?auto_37521 ?auto_37520 ) ( ON ?auto_37522 ?auto_37521 ) ( ON ?auto_37523 ?auto_37522 ) ( CLEAR ?auto_37523 ) ( HOLDING ?auto_37524 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37524 )
      ( MAKE-5PILE ?auto_37519 ?auto_37520 ?auto_37521 ?auto_37522 ?auto_37523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_37526 - BLOCK
      ?auto_37527 - BLOCK
      ?auto_37528 - BLOCK
      ?auto_37529 - BLOCK
      ?auto_37530 - BLOCK
    )
    :vars
    (
      ?auto_37531 - BLOCK
      ?auto_37532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37526 ?auto_37527 ) ) ( not ( = ?auto_37526 ?auto_37528 ) ) ( not ( = ?auto_37526 ?auto_37529 ) ) ( not ( = ?auto_37526 ?auto_37530 ) ) ( not ( = ?auto_37527 ?auto_37528 ) ) ( not ( = ?auto_37527 ?auto_37529 ) ) ( not ( = ?auto_37527 ?auto_37530 ) ) ( not ( = ?auto_37528 ?auto_37529 ) ) ( not ( = ?auto_37528 ?auto_37530 ) ) ( not ( = ?auto_37529 ?auto_37530 ) ) ( not ( = ?auto_37526 ?auto_37531 ) ) ( not ( = ?auto_37527 ?auto_37531 ) ) ( not ( = ?auto_37528 ?auto_37531 ) ) ( not ( = ?auto_37529 ?auto_37531 ) ) ( not ( = ?auto_37530 ?auto_37531 ) ) ( ON ?auto_37526 ?auto_37532 ) ( not ( = ?auto_37526 ?auto_37532 ) ) ( not ( = ?auto_37527 ?auto_37532 ) ) ( not ( = ?auto_37528 ?auto_37532 ) ) ( not ( = ?auto_37529 ?auto_37532 ) ) ( not ( = ?auto_37530 ?auto_37532 ) ) ( not ( = ?auto_37531 ?auto_37532 ) ) ( ON ?auto_37527 ?auto_37526 ) ( ON-TABLE ?auto_37532 ) ( ON ?auto_37528 ?auto_37527 ) ( ON ?auto_37529 ?auto_37528 ) ( ON ?auto_37530 ?auto_37529 ) ( ON ?auto_37531 ?auto_37530 ) ( CLEAR ?auto_37531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37532 ?auto_37526 ?auto_37527 ?auto_37528 ?auto_37529 ?auto_37530 )
      ( MAKE-5PILE ?auto_37526 ?auto_37527 ?auto_37528 ?auto_37529 ?auto_37530 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37545 - BLOCK
      ?auto_37546 - BLOCK
      ?auto_37547 - BLOCK
      ?auto_37548 - BLOCK
      ?auto_37549 - BLOCK
      ?auto_37550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37549 ) ( ON-TABLE ?auto_37545 ) ( ON ?auto_37546 ?auto_37545 ) ( ON ?auto_37547 ?auto_37546 ) ( ON ?auto_37548 ?auto_37547 ) ( ON ?auto_37549 ?auto_37548 ) ( not ( = ?auto_37545 ?auto_37546 ) ) ( not ( = ?auto_37545 ?auto_37547 ) ) ( not ( = ?auto_37545 ?auto_37548 ) ) ( not ( = ?auto_37545 ?auto_37549 ) ) ( not ( = ?auto_37545 ?auto_37550 ) ) ( not ( = ?auto_37546 ?auto_37547 ) ) ( not ( = ?auto_37546 ?auto_37548 ) ) ( not ( = ?auto_37546 ?auto_37549 ) ) ( not ( = ?auto_37546 ?auto_37550 ) ) ( not ( = ?auto_37547 ?auto_37548 ) ) ( not ( = ?auto_37547 ?auto_37549 ) ) ( not ( = ?auto_37547 ?auto_37550 ) ) ( not ( = ?auto_37548 ?auto_37549 ) ) ( not ( = ?auto_37548 ?auto_37550 ) ) ( not ( = ?auto_37549 ?auto_37550 ) ) ( ON-TABLE ?auto_37550 ) ( CLEAR ?auto_37550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_37550 )
      ( MAKE-6PILE ?auto_37545 ?auto_37546 ?auto_37547 ?auto_37548 ?auto_37549 ?auto_37550 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37551 - BLOCK
      ?auto_37552 - BLOCK
      ?auto_37553 - BLOCK
      ?auto_37554 - BLOCK
      ?auto_37555 - BLOCK
      ?auto_37556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37551 ) ( ON ?auto_37552 ?auto_37551 ) ( ON ?auto_37553 ?auto_37552 ) ( ON ?auto_37554 ?auto_37553 ) ( not ( = ?auto_37551 ?auto_37552 ) ) ( not ( = ?auto_37551 ?auto_37553 ) ) ( not ( = ?auto_37551 ?auto_37554 ) ) ( not ( = ?auto_37551 ?auto_37555 ) ) ( not ( = ?auto_37551 ?auto_37556 ) ) ( not ( = ?auto_37552 ?auto_37553 ) ) ( not ( = ?auto_37552 ?auto_37554 ) ) ( not ( = ?auto_37552 ?auto_37555 ) ) ( not ( = ?auto_37552 ?auto_37556 ) ) ( not ( = ?auto_37553 ?auto_37554 ) ) ( not ( = ?auto_37553 ?auto_37555 ) ) ( not ( = ?auto_37553 ?auto_37556 ) ) ( not ( = ?auto_37554 ?auto_37555 ) ) ( not ( = ?auto_37554 ?auto_37556 ) ) ( not ( = ?auto_37555 ?auto_37556 ) ) ( ON-TABLE ?auto_37556 ) ( CLEAR ?auto_37556 ) ( HOLDING ?auto_37555 ) ( CLEAR ?auto_37554 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37551 ?auto_37552 ?auto_37553 ?auto_37554 ?auto_37555 )
      ( MAKE-6PILE ?auto_37551 ?auto_37552 ?auto_37553 ?auto_37554 ?auto_37555 ?auto_37556 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37557 - BLOCK
      ?auto_37558 - BLOCK
      ?auto_37559 - BLOCK
      ?auto_37560 - BLOCK
      ?auto_37561 - BLOCK
      ?auto_37562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37557 ) ( ON ?auto_37558 ?auto_37557 ) ( ON ?auto_37559 ?auto_37558 ) ( ON ?auto_37560 ?auto_37559 ) ( not ( = ?auto_37557 ?auto_37558 ) ) ( not ( = ?auto_37557 ?auto_37559 ) ) ( not ( = ?auto_37557 ?auto_37560 ) ) ( not ( = ?auto_37557 ?auto_37561 ) ) ( not ( = ?auto_37557 ?auto_37562 ) ) ( not ( = ?auto_37558 ?auto_37559 ) ) ( not ( = ?auto_37558 ?auto_37560 ) ) ( not ( = ?auto_37558 ?auto_37561 ) ) ( not ( = ?auto_37558 ?auto_37562 ) ) ( not ( = ?auto_37559 ?auto_37560 ) ) ( not ( = ?auto_37559 ?auto_37561 ) ) ( not ( = ?auto_37559 ?auto_37562 ) ) ( not ( = ?auto_37560 ?auto_37561 ) ) ( not ( = ?auto_37560 ?auto_37562 ) ) ( not ( = ?auto_37561 ?auto_37562 ) ) ( ON-TABLE ?auto_37562 ) ( CLEAR ?auto_37560 ) ( ON ?auto_37561 ?auto_37562 ) ( CLEAR ?auto_37561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37562 )
      ( MAKE-6PILE ?auto_37557 ?auto_37558 ?auto_37559 ?auto_37560 ?auto_37561 ?auto_37562 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37563 - BLOCK
      ?auto_37564 - BLOCK
      ?auto_37565 - BLOCK
      ?auto_37566 - BLOCK
      ?auto_37567 - BLOCK
      ?auto_37568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37563 ) ( ON ?auto_37564 ?auto_37563 ) ( ON ?auto_37565 ?auto_37564 ) ( not ( = ?auto_37563 ?auto_37564 ) ) ( not ( = ?auto_37563 ?auto_37565 ) ) ( not ( = ?auto_37563 ?auto_37566 ) ) ( not ( = ?auto_37563 ?auto_37567 ) ) ( not ( = ?auto_37563 ?auto_37568 ) ) ( not ( = ?auto_37564 ?auto_37565 ) ) ( not ( = ?auto_37564 ?auto_37566 ) ) ( not ( = ?auto_37564 ?auto_37567 ) ) ( not ( = ?auto_37564 ?auto_37568 ) ) ( not ( = ?auto_37565 ?auto_37566 ) ) ( not ( = ?auto_37565 ?auto_37567 ) ) ( not ( = ?auto_37565 ?auto_37568 ) ) ( not ( = ?auto_37566 ?auto_37567 ) ) ( not ( = ?auto_37566 ?auto_37568 ) ) ( not ( = ?auto_37567 ?auto_37568 ) ) ( ON-TABLE ?auto_37568 ) ( ON ?auto_37567 ?auto_37568 ) ( CLEAR ?auto_37567 ) ( HOLDING ?auto_37566 ) ( CLEAR ?auto_37565 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37563 ?auto_37564 ?auto_37565 ?auto_37566 )
      ( MAKE-6PILE ?auto_37563 ?auto_37564 ?auto_37565 ?auto_37566 ?auto_37567 ?auto_37568 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37569 - BLOCK
      ?auto_37570 - BLOCK
      ?auto_37571 - BLOCK
      ?auto_37572 - BLOCK
      ?auto_37573 - BLOCK
      ?auto_37574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37569 ) ( ON ?auto_37570 ?auto_37569 ) ( ON ?auto_37571 ?auto_37570 ) ( not ( = ?auto_37569 ?auto_37570 ) ) ( not ( = ?auto_37569 ?auto_37571 ) ) ( not ( = ?auto_37569 ?auto_37572 ) ) ( not ( = ?auto_37569 ?auto_37573 ) ) ( not ( = ?auto_37569 ?auto_37574 ) ) ( not ( = ?auto_37570 ?auto_37571 ) ) ( not ( = ?auto_37570 ?auto_37572 ) ) ( not ( = ?auto_37570 ?auto_37573 ) ) ( not ( = ?auto_37570 ?auto_37574 ) ) ( not ( = ?auto_37571 ?auto_37572 ) ) ( not ( = ?auto_37571 ?auto_37573 ) ) ( not ( = ?auto_37571 ?auto_37574 ) ) ( not ( = ?auto_37572 ?auto_37573 ) ) ( not ( = ?auto_37572 ?auto_37574 ) ) ( not ( = ?auto_37573 ?auto_37574 ) ) ( ON-TABLE ?auto_37574 ) ( ON ?auto_37573 ?auto_37574 ) ( CLEAR ?auto_37571 ) ( ON ?auto_37572 ?auto_37573 ) ( CLEAR ?auto_37572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37574 ?auto_37573 )
      ( MAKE-6PILE ?auto_37569 ?auto_37570 ?auto_37571 ?auto_37572 ?auto_37573 ?auto_37574 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37575 - BLOCK
      ?auto_37576 - BLOCK
      ?auto_37577 - BLOCK
      ?auto_37578 - BLOCK
      ?auto_37579 - BLOCK
      ?auto_37580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37575 ) ( ON ?auto_37576 ?auto_37575 ) ( not ( = ?auto_37575 ?auto_37576 ) ) ( not ( = ?auto_37575 ?auto_37577 ) ) ( not ( = ?auto_37575 ?auto_37578 ) ) ( not ( = ?auto_37575 ?auto_37579 ) ) ( not ( = ?auto_37575 ?auto_37580 ) ) ( not ( = ?auto_37576 ?auto_37577 ) ) ( not ( = ?auto_37576 ?auto_37578 ) ) ( not ( = ?auto_37576 ?auto_37579 ) ) ( not ( = ?auto_37576 ?auto_37580 ) ) ( not ( = ?auto_37577 ?auto_37578 ) ) ( not ( = ?auto_37577 ?auto_37579 ) ) ( not ( = ?auto_37577 ?auto_37580 ) ) ( not ( = ?auto_37578 ?auto_37579 ) ) ( not ( = ?auto_37578 ?auto_37580 ) ) ( not ( = ?auto_37579 ?auto_37580 ) ) ( ON-TABLE ?auto_37580 ) ( ON ?auto_37579 ?auto_37580 ) ( ON ?auto_37578 ?auto_37579 ) ( CLEAR ?auto_37578 ) ( HOLDING ?auto_37577 ) ( CLEAR ?auto_37576 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37575 ?auto_37576 ?auto_37577 )
      ( MAKE-6PILE ?auto_37575 ?auto_37576 ?auto_37577 ?auto_37578 ?auto_37579 ?auto_37580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37581 - BLOCK
      ?auto_37582 - BLOCK
      ?auto_37583 - BLOCK
      ?auto_37584 - BLOCK
      ?auto_37585 - BLOCK
      ?auto_37586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37581 ) ( ON ?auto_37582 ?auto_37581 ) ( not ( = ?auto_37581 ?auto_37582 ) ) ( not ( = ?auto_37581 ?auto_37583 ) ) ( not ( = ?auto_37581 ?auto_37584 ) ) ( not ( = ?auto_37581 ?auto_37585 ) ) ( not ( = ?auto_37581 ?auto_37586 ) ) ( not ( = ?auto_37582 ?auto_37583 ) ) ( not ( = ?auto_37582 ?auto_37584 ) ) ( not ( = ?auto_37582 ?auto_37585 ) ) ( not ( = ?auto_37582 ?auto_37586 ) ) ( not ( = ?auto_37583 ?auto_37584 ) ) ( not ( = ?auto_37583 ?auto_37585 ) ) ( not ( = ?auto_37583 ?auto_37586 ) ) ( not ( = ?auto_37584 ?auto_37585 ) ) ( not ( = ?auto_37584 ?auto_37586 ) ) ( not ( = ?auto_37585 ?auto_37586 ) ) ( ON-TABLE ?auto_37586 ) ( ON ?auto_37585 ?auto_37586 ) ( ON ?auto_37584 ?auto_37585 ) ( CLEAR ?auto_37582 ) ( ON ?auto_37583 ?auto_37584 ) ( CLEAR ?auto_37583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37586 ?auto_37585 ?auto_37584 )
      ( MAKE-6PILE ?auto_37581 ?auto_37582 ?auto_37583 ?auto_37584 ?auto_37585 ?auto_37586 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37587 - BLOCK
      ?auto_37588 - BLOCK
      ?auto_37589 - BLOCK
      ?auto_37590 - BLOCK
      ?auto_37591 - BLOCK
      ?auto_37592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37587 ) ( not ( = ?auto_37587 ?auto_37588 ) ) ( not ( = ?auto_37587 ?auto_37589 ) ) ( not ( = ?auto_37587 ?auto_37590 ) ) ( not ( = ?auto_37587 ?auto_37591 ) ) ( not ( = ?auto_37587 ?auto_37592 ) ) ( not ( = ?auto_37588 ?auto_37589 ) ) ( not ( = ?auto_37588 ?auto_37590 ) ) ( not ( = ?auto_37588 ?auto_37591 ) ) ( not ( = ?auto_37588 ?auto_37592 ) ) ( not ( = ?auto_37589 ?auto_37590 ) ) ( not ( = ?auto_37589 ?auto_37591 ) ) ( not ( = ?auto_37589 ?auto_37592 ) ) ( not ( = ?auto_37590 ?auto_37591 ) ) ( not ( = ?auto_37590 ?auto_37592 ) ) ( not ( = ?auto_37591 ?auto_37592 ) ) ( ON-TABLE ?auto_37592 ) ( ON ?auto_37591 ?auto_37592 ) ( ON ?auto_37590 ?auto_37591 ) ( ON ?auto_37589 ?auto_37590 ) ( CLEAR ?auto_37589 ) ( HOLDING ?auto_37588 ) ( CLEAR ?auto_37587 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37587 ?auto_37588 )
      ( MAKE-6PILE ?auto_37587 ?auto_37588 ?auto_37589 ?auto_37590 ?auto_37591 ?auto_37592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37593 - BLOCK
      ?auto_37594 - BLOCK
      ?auto_37595 - BLOCK
      ?auto_37596 - BLOCK
      ?auto_37597 - BLOCK
      ?auto_37598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37593 ) ( not ( = ?auto_37593 ?auto_37594 ) ) ( not ( = ?auto_37593 ?auto_37595 ) ) ( not ( = ?auto_37593 ?auto_37596 ) ) ( not ( = ?auto_37593 ?auto_37597 ) ) ( not ( = ?auto_37593 ?auto_37598 ) ) ( not ( = ?auto_37594 ?auto_37595 ) ) ( not ( = ?auto_37594 ?auto_37596 ) ) ( not ( = ?auto_37594 ?auto_37597 ) ) ( not ( = ?auto_37594 ?auto_37598 ) ) ( not ( = ?auto_37595 ?auto_37596 ) ) ( not ( = ?auto_37595 ?auto_37597 ) ) ( not ( = ?auto_37595 ?auto_37598 ) ) ( not ( = ?auto_37596 ?auto_37597 ) ) ( not ( = ?auto_37596 ?auto_37598 ) ) ( not ( = ?auto_37597 ?auto_37598 ) ) ( ON-TABLE ?auto_37598 ) ( ON ?auto_37597 ?auto_37598 ) ( ON ?auto_37596 ?auto_37597 ) ( ON ?auto_37595 ?auto_37596 ) ( CLEAR ?auto_37593 ) ( ON ?auto_37594 ?auto_37595 ) ( CLEAR ?auto_37594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37598 ?auto_37597 ?auto_37596 ?auto_37595 )
      ( MAKE-6PILE ?auto_37593 ?auto_37594 ?auto_37595 ?auto_37596 ?auto_37597 ?auto_37598 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37599 - BLOCK
      ?auto_37600 - BLOCK
      ?auto_37601 - BLOCK
      ?auto_37602 - BLOCK
      ?auto_37603 - BLOCK
      ?auto_37604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37599 ?auto_37600 ) ) ( not ( = ?auto_37599 ?auto_37601 ) ) ( not ( = ?auto_37599 ?auto_37602 ) ) ( not ( = ?auto_37599 ?auto_37603 ) ) ( not ( = ?auto_37599 ?auto_37604 ) ) ( not ( = ?auto_37600 ?auto_37601 ) ) ( not ( = ?auto_37600 ?auto_37602 ) ) ( not ( = ?auto_37600 ?auto_37603 ) ) ( not ( = ?auto_37600 ?auto_37604 ) ) ( not ( = ?auto_37601 ?auto_37602 ) ) ( not ( = ?auto_37601 ?auto_37603 ) ) ( not ( = ?auto_37601 ?auto_37604 ) ) ( not ( = ?auto_37602 ?auto_37603 ) ) ( not ( = ?auto_37602 ?auto_37604 ) ) ( not ( = ?auto_37603 ?auto_37604 ) ) ( ON-TABLE ?auto_37604 ) ( ON ?auto_37603 ?auto_37604 ) ( ON ?auto_37602 ?auto_37603 ) ( ON ?auto_37601 ?auto_37602 ) ( ON ?auto_37600 ?auto_37601 ) ( CLEAR ?auto_37600 ) ( HOLDING ?auto_37599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37599 )
      ( MAKE-6PILE ?auto_37599 ?auto_37600 ?auto_37601 ?auto_37602 ?auto_37603 ?auto_37604 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37605 - BLOCK
      ?auto_37606 - BLOCK
      ?auto_37607 - BLOCK
      ?auto_37608 - BLOCK
      ?auto_37609 - BLOCK
      ?auto_37610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37605 ?auto_37606 ) ) ( not ( = ?auto_37605 ?auto_37607 ) ) ( not ( = ?auto_37605 ?auto_37608 ) ) ( not ( = ?auto_37605 ?auto_37609 ) ) ( not ( = ?auto_37605 ?auto_37610 ) ) ( not ( = ?auto_37606 ?auto_37607 ) ) ( not ( = ?auto_37606 ?auto_37608 ) ) ( not ( = ?auto_37606 ?auto_37609 ) ) ( not ( = ?auto_37606 ?auto_37610 ) ) ( not ( = ?auto_37607 ?auto_37608 ) ) ( not ( = ?auto_37607 ?auto_37609 ) ) ( not ( = ?auto_37607 ?auto_37610 ) ) ( not ( = ?auto_37608 ?auto_37609 ) ) ( not ( = ?auto_37608 ?auto_37610 ) ) ( not ( = ?auto_37609 ?auto_37610 ) ) ( ON-TABLE ?auto_37610 ) ( ON ?auto_37609 ?auto_37610 ) ( ON ?auto_37608 ?auto_37609 ) ( ON ?auto_37607 ?auto_37608 ) ( ON ?auto_37606 ?auto_37607 ) ( ON ?auto_37605 ?auto_37606 ) ( CLEAR ?auto_37605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37610 ?auto_37609 ?auto_37608 ?auto_37607 ?auto_37606 )
      ( MAKE-6PILE ?auto_37605 ?auto_37606 ?auto_37607 ?auto_37608 ?auto_37609 ?auto_37610 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37617 - BLOCK
      ?auto_37618 - BLOCK
      ?auto_37619 - BLOCK
      ?auto_37620 - BLOCK
      ?auto_37621 - BLOCK
      ?auto_37622 - BLOCK
    )
    :vars
    (
      ?auto_37623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37617 ?auto_37618 ) ) ( not ( = ?auto_37617 ?auto_37619 ) ) ( not ( = ?auto_37617 ?auto_37620 ) ) ( not ( = ?auto_37617 ?auto_37621 ) ) ( not ( = ?auto_37617 ?auto_37622 ) ) ( not ( = ?auto_37618 ?auto_37619 ) ) ( not ( = ?auto_37618 ?auto_37620 ) ) ( not ( = ?auto_37618 ?auto_37621 ) ) ( not ( = ?auto_37618 ?auto_37622 ) ) ( not ( = ?auto_37619 ?auto_37620 ) ) ( not ( = ?auto_37619 ?auto_37621 ) ) ( not ( = ?auto_37619 ?auto_37622 ) ) ( not ( = ?auto_37620 ?auto_37621 ) ) ( not ( = ?auto_37620 ?auto_37622 ) ) ( not ( = ?auto_37621 ?auto_37622 ) ) ( ON-TABLE ?auto_37622 ) ( ON ?auto_37621 ?auto_37622 ) ( ON ?auto_37620 ?auto_37621 ) ( ON ?auto_37619 ?auto_37620 ) ( ON ?auto_37618 ?auto_37619 ) ( CLEAR ?auto_37618 ) ( ON ?auto_37617 ?auto_37623 ) ( CLEAR ?auto_37617 ) ( HAND-EMPTY ) ( not ( = ?auto_37617 ?auto_37623 ) ) ( not ( = ?auto_37618 ?auto_37623 ) ) ( not ( = ?auto_37619 ?auto_37623 ) ) ( not ( = ?auto_37620 ?auto_37623 ) ) ( not ( = ?auto_37621 ?auto_37623 ) ) ( not ( = ?auto_37622 ?auto_37623 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_37617 ?auto_37623 )
      ( MAKE-6PILE ?auto_37617 ?auto_37618 ?auto_37619 ?auto_37620 ?auto_37621 ?auto_37622 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37624 - BLOCK
      ?auto_37625 - BLOCK
      ?auto_37626 - BLOCK
      ?auto_37627 - BLOCK
      ?auto_37628 - BLOCK
      ?auto_37629 - BLOCK
    )
    :vars
    (
      ?auto_37630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37624 ?auto_37625 ) ) ( not ( = ?auto_37624 ?auto_37626 ) ) ( not ( = ?auto_37624 ?auto_37627 ) ) ( not ( = ?auto_37624 ?auto_37628 ) ) ( not ( = ?auto_37624 ?auto_37629 ) ) ( not ( = ?auto_37625 ?auto_37626 ) ) ( not ( = ?auto_37625 ?auto_37627 ) ) ( not ( = ?auto_37625 ?auto_37628 ) ) ( not ( = ?auto_37625 ?auto_37629 ) ) ( not ( = ?auto_37626 ?auto_37627 ) ) ( not ( = ?auto_37626 ?auto_37628 ) ) ( not ( = ?auto_37626 ?auto_37629 ) ) ( not ( = ?auto_37627 ?auto_37628 ) ) ( not ( = ?auto_37627 ?auto_37629 ) ) ( not ( = ?auto_37628 ?auto_37629 ) ) ( ON-TABLE ?auto_37629 ) ( ON ?auto_37628 ?auto_37629 ) ( ON ?auto_37627 ?auto_37628 ) ( ON ?auto_37626 ?auto_37627 ) ( ON ?auto_37624 ?auto_37630 ) ( CLEAR ?auto_37624 ) ( not ( = ?auto_37624 ?auto_37630 ) ) ( not ( = ?auto_37625 ?auto_37630 ) ) ( not ( = ?auto_37626 ?auto_37630 ) ) ( not ( = ?auto_37627 ?auto_37630 ) ) ( not ( = ?auto_37628 ?auto_37630 ) ) ( not ( = ?auto_37629 ?auto_37630 ) ) ( HOLDING ?auto_37625 ) ( CLEAR ?auto_37626 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37629 ?auto_37628 ?auto_37627 ?auto_37626 ?auto_37625 )
      ( MAKE-6PILE ?auto_37624 ?auto_37625 ?auto_37626 ?auto_37627 ?auto_37628 ?auto_37629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37631 - BLOCK
      ?auto_37632 - BLOCK
      ?auto_37633 - BLOCK
      ?auto_37634 - BLOCK
      ?auto_37635 - BLOCK
      ?auto_37636 - BLOCK
    )
    :vars
    (
      ?auto_37637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37631 ?auto_37632 ) ) ( not ( = ?auto_37631 ?auto_37633 ) ) ( not ( = ?auto_37631 ?auto_37634 ) ) ( not ( = ?auto_37631 ?auto_37635 ) ) ( not ( = ?auto_37631 ?auto_37636 ) ) ( not ( = ?auto_37632 ?auto_37633 ) ) ( not ( = ?auto_37632 ?auto_37634 ) ) ( not ( = ?auto_37632 ?auto_37635 ) ) ( not ( = ?auto_37632 ?auto_37636 ) ) ( not ( = ?auto_37633 ?auto_37634 ) ) ( not ( = ?auto_37633 ?auto_37635 ) ) ( not ( = ?auto_37633 ?auto_37636 ) ) ( not ( = ?auto_37634 ?auto_37635 ) ) ( not ( = ?auto_37634 ?auto_37636 ) ) ( not ( = ?auto_37635 ?auto_37636 ) ) ( ON-TABLE ?auto_37636 ) ( ON ?auto_37635 ?auto_37636 ) ( ON ?auto_37634 ?auto_37635 ) ( ON ?auto_37633 ?auto_37634 ) ( ON ?auto_37631 ?auto_37637 ) ( not ( = ?auto_37631 ?auto_37637 ) ) ( not ( = ?auto_37632 ?auto_37637 ) ) ( not ( = ?auto_37633 ?auto_37637 ) ) ( not ( = ?auto_37634 ?auto_37637 ) ) ( not ( = ?auto_37635 ?auto_37637 ) ) ( not ( = ?auto_37636 ?auto_37637 ) ) ( CLEAR ?auto_37633 ) ( ON ?auto_37632 ?auto_37631 ) ( CLEAR ?auto_37632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37637 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37637 ?auto_37631 )
      ( MAKE-6PILE ?auto_37631 ?auto_37632 ?auto_37633 ?auto_37634 ?auto_37635 ?auto_37636 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37638 - BLOCK
      ?auto_37639 - BLOCK
      ?auto_37640 - BLOCK
      ?auto_37641 - BLOCK
      ?auto_37642 - BLOCK
      ?auto_37643 - BLOCK
    )
    :vars
    (
      ?auto_37644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37638 ?auto_37639 ) ) ( not ( = ?auto_37638 ?auto_37640 ) ) ( not ( = ?auto_37638 ?auto_37641 ) ) ( not ( = ?auto_37638 ?auto_37642 ) ) ( not ( = ?auto_37638 ?auto_37643 ) ) ( not ( = ?auto_37639 ?auto_37640 ) ) ( not ( = ?auto_37639 ?auto_37641 ) ) ( not ( = ?auto_37639 ?auto_37642 ) ) ( not ( = ?auto_37639 ?auto_37643 ) ) ( not ( = ?auto_37640 ?auto_37641 ) ) ( not ( = ?auto_37640 ?auto_37642 ) ) ( not ( = ?auto_37640 ?auto_37643 ) ) ( not ( = ?auto_37641 ?auto_37642 ) ) ( not ( = ?auto_37641 ?auto_37643 ) ) ( not ( = ?auto_37642 ?auto_37643 ) ) ( ON-TABLE ?auto_37643 ) ( ON ?auto_37642 ?auto_37643 ) ( ON ?auto_37641 ?auto_37642 ) ( ON ?auto_37638 ?auto_37644 ) ( not ( = ?auto_37638 ?auto_37644 ) ) ( not ( = ?auto_37639 ?auto_37644 ) ) ( not ( = ?auto_37640 ?auto_37644 ) ) ( not ( = ?auto_37641 ?auto_37644 ) ) ( not ( = ?auto_37642 ?auto_37644 ) ) ( not ( = ?auto_37643 ?auto_37644 ) ) ( ON ?auto_37639 ?auto_37638 ) ( CLEAR ?auto_37639 ) ( ON-TABLE ?auto_37644 ) ( HOLDING ?auto_37640 ) ( CLEAR ?auto_37641 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37643 ?auto_37642 ?auto_37641 ?auto_37640 )
      ( MAKE-6PILE ?auto_37638 ?auto_37639 ?auto_37640 ?auto_37641 ?auto_37642 ?auto_37643 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37645 - BLOCK
      ?auto_37646 - BLOCK
      ?auto_37647 - BLOCK
      ?auto_37648 - BLOCK
      ?auto_37649 - BLOCK
      ?auto_37650 - BLOCK
    )
    :vars
    (
      ?auto_37651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37645 ?auto_37646 ) ) ( not ( = ?auto_37645 ?auto_37647 ) ) ( not ( = ?auto_37645 ?auto_37648 ) ) ( not ( = ?auto_37645 ?auto_37649 ) ) ( not ( = ?auto_37645 ?auto_37650 ) ) ( not ( = ?auto_37646 ?auto_37647 ) ) ( not ( = ?auto_37646 ?auto_37648 ) ) ( not ( = ?auto_37646 ?auto_37649 ) ) ( not ( = ?auto_37646 ?auto_37650 ) ) ( not ( = ?auto_37647 ?auto_37648 ) ) ( not ( = ?auto_37647 ?auto_37649 ) ) ( not ( = ?auto_37647 ?auto_37650 ) ) ( not ( = ?auto_37648 ?auto_37649 ) ) ( not ( = ?auto_37648 ?auto_37650 ) ) ( not ( = ?auto_37649 ?auto_37650 ) ) ( ON-TABLE ?auto_37650 ) ( ON ?auto_37649 ?auto_37650 ) ( ON ?auto_37648 ?auto_37649 ) ( ON ?auto_37645 ?auto_37651 ) ( not ( = ?auto_37645 ?auto_37651 ) ) ( not ( = ?auto_37646 ?auto_37651 ) ) ( not ( = ?auto_37647 ?auto_37651 ) ) ( not ( = ?auto_37648 ?auto_37651 ) ) ( not ( = ?auto_37649 ?auto_37651 ) ) ( not ( = ?auto_37650 ?auto_37651 ) ) ( ON ?auto_37646 ?auto_37645 ) ( ON-TABLE ?auto_37651 ) ( CLEAR ?auto_37648 ) ( ON ?auto_37647 ?auto_37646 ) ( CLEAR ?auto_37647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37651 ?auto_37645 ?auto_37646 )
      ( MAKE-6PILE ?auto_37645 ?auto_37646 ?auto_37647 ?auto_37648 ?auto_37649 ?auto_37650 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37652 - BLOCK
      ?auto_37653 - BLOCK
      ?auto_37654 - BLOCK
      ?auto_37655 - BLOCK
      ?auto_37656 - BLOCK
      ?auto_37657 - BLOCK
    )
    :vars
    (
      ?auto_37658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37652 ?auto_37653 ) ) ( not ( = ?auto_37652 ?auto_37654 ) ) ( not ( = ?auto_37652 ?auto_37655 ) ) ( not ( = ?auto_37652 ?auto_37656 ) ) ( not ( = ?auto_37652 ?auto_37657 ) ) ( not ( = ?auto_37653 ?auto_37654 ) ) ( not ( = ?auto_37653 ?auto_37655 ) ) ( not ( = ?auto_37653 ?auto_37656 ) ) ( not ( = ?auto_37653 ?auto_37657 ) ) ( not ( = ?auto_37654 ?auto_37655 ) ) ( not ( = ?auto_37654 ?auto_37656 ) ) ( not ( = ?auto_37654 ?auto_37657 ) ) ( not ( = ?auto_37655 ?auto_37656 ) ) ( not ( = ?auto_37655 ?auto_37657 ) ) ( not ( = ?auto_37656 ?auto_37657 ) ) ( ON-TABLE ?auto_37657 ) ( ON ?auto_37656 ?auto_37657 ) ( ON ?auto_37652 ?auto_37658 ) ( not ( = ?auto_37652 ?auto_37658 ) ) ( not ( = ?auto_37653 ?auto_37658 ) ) ( not ( = ?auto_37654 ?auto_37658 ) ) ( not ( = ?auto_37655 ?auto_37658 ) ) ( not ( = ?auto_37656 ?auto_37658 ) ) ( not ( = ?auto_37657 ?auto_37658 ) ) ( ON ?auto_37653 ?auto_37652 ) ( ON-TABLE ?auto_37658 ) ( ON ?auto_37654 ?auto_37653 ) ( CLEAR ?auto_37654 ) ( HOLDING ?auto_37655 ) ( CLEAR ?auto_37656 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_37657 ?auto_37656 ?auto_37655 )
      ( MAKE-6PILE ?auto_37652 ?auto_37653 ?auto_37654 ?auto_37655 ?auto_37656 ?auto_37657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37659 - BLOCK
      ?auto_37660 - BLOCK
      ?auto_37661 - BLOCK
      ?auto_37662 - BLOCK
      ?auto_37663 - BLOCK
      ?auto_37664 - BLOCK
    )
    :vars
    (
      ?auto_37665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37659 ?auto_37660 ) ) ( not ( = ?auto_37659 ?auto_37661 ) ) ( not ( = ?auto_37659 ?auto_37662 ) ) ( not ( = ?auto_37659 ?auto_37663 ) ) ( not ( = ?auto_37659 ?auto_37664 ) ) ( not ( = ?auto_37660 ?auto_37661 ) ) ( not ( = ?auto_37660 ?auto_37662 ) ) ( not ( = ?auto_37660 ?auto_37663 ) ) ( not ( = ?auto_37660 ?auto_37664 ) ) ( not ( = ?auto_37661 ?auto_37662 ) ) ( not ( = ?auto_37661 ?auto_37663 ) ) ( not ( = ?auto_37661 ?auto_37664 ) ) ( not ( = ?auto_37662 ?auto_37663 ) ) ( not ( = ?auto_37662 ?auto_37664 ) ) ( not ( = ?auto_37663 ?auto_37664 ) ) ( ON-TABLE ?auto_37664 ) ( ON ?auto_37663 ?auto_37664 ) ( ON ?auto_37659 ?auto_37665 ) ( not ( = ?auto_37659 ?auto_37665 ) ) ( not ( = ?auto_37660 ?auto_37665 ) ) ( not ( = ?auto_37661 ?auto_37665 ) ) ( not ( = ?auto_37662 ?auto_37665 ) ) ( not ( = ?auto_37663 ?auto_37665 ) ) ( not ( = ?auto_37664 ?auto_37665 ) ) ( ON ?auto_37660 ?auto_37659 ) ( ON-TABLE ?auto_37665 ) ( ON ?auto_37661 ?auto_37660 ) ( CLEAR ?auto_37663 ) ( ON ?auto_37662 ?auto_37661 ) ( CLEAR ?auto_37662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_37665 ?auto_37659 ?auto_37660 ?auto_37661 )
      ( MAKE-6PILE ?auto_37659 ?auto_37660 ?auto_37661 ?auto_37662 ?auto_37663 ?auto_37664 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37666 - BLOCK
      ?auto_37667 - BLOCK
      ?auto_37668 - BLOCK
      ?auto_37669 - BLOCK
      ?auto_37670 - BLOCK
      ?auto_37671 - BLOCK
    )
    :vars
    (
      ?auto_37672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37666 ?auto_37667 ) ) ( not ( = ?auto_37666 ?auto_37668 ) ) ( not ( = ?auto_37666 ?auto_37669 ) ) ( not ( = ?auto_37666 ?auto_37670 ) ) ( not ( = ?auto_37666 ?auto_37671 ) ) ( not ( = ?auto_37667 ?auto_37668 ) ) ( not ( = ?auto_37667 ?auto_37669 ) ) ( not ( = ?auto_37667 ?auto_37670 ) ) ( not ( = ?auto_37667 ?auto_37671 ) ) ( not ( = ?auto_37668 ?auto_37669 ) ) ( not ( = ?auto_37668 ?auto_37670 ) ) ( not ( = ?auto_37668 ?auto_37671 ) ) ( not ( = ?auto_37669 ?auto_37670 ) ) ( not ( = ?auto_37669 ?auto_37671 ) ) ( not ( = ?auto_37670 ?auto_37671 ) ) ( ON-TABLE ?auto_37671 ) ( ON ?auto_37666 ?auto_37672 ) ( not ( = ?auto_37666 ?auto_37672 ) ) ( not ( = ?auto_37667 ?auto_37672 ) ) ( not ( = ?auto_37668 ?auto_37672 ) ) ( not ( = ?auto_37669 ?auto_37672 ) ) ( not ( = ?auto_37670 ?auto_37672 ) ) ( not ( = ?auto_37671 ?auto_37672 ) ) ( ON ?auto_37667 ?auto_37666 ) ( ON-TABLE ?auto_37672 ) ( ON ?auto_37668 ?auto_37667 ) ( ON ?auto_37669 ?auto_37668 ) ( CLEAR ?auto_37669 ) ( HOLDING ?auto_37670 ) ( CLEAR ?auto_37671 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37671 ?auto_37670 )
      ( MAKE-6PILE ?auto_37666 ?auto_37667 ?auto_37668 ?auto_37669 ?auto_37670 ?auto_37671 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37673 - BLOCK
      ?auto_37674 - BLOCK
      ?auto_37675 - BLOCK
      ?auto_37676 - BLOCK
      ?auto_37677 - BLOCK
      ?auto_37678 - BLOCK
    )
    :vars
    (
      ?auto_37679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37673 ?auto_37674 ) ) ( not ( = ?auto_37673 ?auto_37675 ) ) ( not ( = ?auto_37673 ?auto_37676 ) ) ( not ( = ?auto_37673 ?auto_37677 ) ) ( not ( = ?auto_37673 ?auto_37678 ) ) ( not ( = ?auto_37674 ?auto_37675 ) ) ( not ( = ?auto_37674 ?auto_37676 ) ) ( not ( = ?auto_37674 ?auto_37677 ) ) ( not ( = ?auto_37674 ?auto_37678 ) ) ( not ( = ?auto_37675 ?auto_37676 ) ) ( not ( = ?auto_37675 ?auto_37677 ) ) ( not ( = ?auto_37675 ?auto_37678 ) ) ( not ( = ?auto_37676 ?auto_37677 ) ) ( not ( = ?auto_37676 ?auto_37678 ) ) ( not ( = ?auto_37677 ?auto_37678 ) ) ( ON-TABLE ?auto_37678 ) ( ON ?auto_37673 ?auto_37679 ) ( not ( = ?auto_37673 ?auto_37679 ) ) ( not ( = ?auto_37674 ?auto_37679 ) ) ( not ( = ?auto_37675 ?auto_37679 ) ) ( not ( = ?auto_37676 ?auto_37679 ) ) ( not ( = ?auto_37677 ?auto_37679 ) ) ( not ( = ?auto_37678 ?auto_37679 ) ) ( ON ?auto_37674 ?auto_37673 ) ( ON-TABLE ?auto_37679 ) ( ON ?auto_37675 ?auto_37674 ) ( ON ?auto_37676 ?auto_37675 ) ( CLEAR ?auto_37678 ) ( ON ?auto_37677 ?auto_37676 ) ( CLEAR ?auto_37677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_37679 ?auto_37673 ?auto_37674 ?auto_37675 ?auto_37676 )
      ( MAKE-6PILE ?auto_37673 ?auto_37674 ?auto_37675 ?auto_37676 ?auto_37677 ?auto_37678 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37680 - BLOCK
      ?auto_37681 - BLOCK
      ?auto_37682 - BLOCK
      ?auto_37683 - BLOCK
      ?auto_37684 - BLOCK
      ?auto_37685 - BLOCK
    )
    :vars
    (
      ?auto_37686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37680 ?auto_37681 ) ) ( not ( = ?auto_37680 ?auto_37682 ) ) ( not ( = ?auto_37680 ?auto_37683 ) ) ( not ( = ?auto_37680 ?auto_37684 ) ) ( not ( = ?auto_37680 ?auto_37685 ) ) ( not ( = ?auto_37681 ?auto_37682 ) ) ( not ( = ?auto_37681 ?auto_37683 ) ) ( not ( = ?auto_37681 ?auto_37684 ) ) ( not ( = ?auto_37681 ?auto_37685 ) ) ( not ( = ?auto_37682 ?auto_37683 ) ) ( not ( = ?auto_37682 ?auto_37684 ) ) ( not ( = ?auto_37682 ?auto_37685 ) ) ( not ( = ?auto_37683 ?auto_37684 ) ) ( not ( = ?auto_37683 ?auto_37685 ) ) ( not ( = ?auto_37684 ?auto_37685 ) ) ( ON ?auto_37680 ?auto_37686 ) ( not ( = ?auto_37680 ?auto_37686 ) ) ( not ( = ?auto_37681 ?auto_37686 ) ) ( not ( = ?auto_37682 ?auto_37686 ) ) ( not ( = ?auto_37683 ?auto_37686 ) ) ( not ( = ?auto_37684 ?auto_37686 ) ) ( not ( = ?auto_37685 ?auto_37686 ) ) ( ON ?auto_37681 ?auto_37680 ) ( ON-TABLE ?auto_37686 ) ( ON ?auto_37682 ?auto_37681 ) ( ON ?auto_37683 ?auto_37682 ) ( ON ?auto_37684 ?auto_37683 ) ( CLEAR ?auto_37684 ) ( HOLDING ?auto_37685 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37685 )
      ( MAKE-6PILE ?auto_37680 ?auto_37681 ?auto_37682 ?auto_37683 ?auto_37684 ?auto_37685 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_37687 - BLOCK
      ?auto_37688 - BLOCK
      ?auto_37689 - BLOCK
      ?auto_37690 - BLOCK
      ?auto_37691 - BLOCK
      ?auto_37692 - BLOCK
    )
    :vars
    (
      ?auto_37693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37687 ?auto_37688 ) ) ( not ( = ?auto_37687 ?auto_37689 ) ) ( not ( = ?auto_37687 ?auto_37690 ) ) ( not ( = ?auto_37687 ?auto_37691 ) ) ( not ( = ?auto_37687 ?auto_37692 ) ) ( not ( = ?auto_37688 ?auto_37689 ) ) ( not ( = ?auto_37688 ?auto_37690 ) ) ( not ( = ?auto_37688 ?auto_37691 ) ) ( not ( = ?auto_37688 ?auto_37692 ) ) ( not ( = ?auto_37689 ?auto_37690 ) ) ( not ( = ?auto_37689 ?auto_37691 ) ) ( not ( = ?auto_37689 ?auto_37692 ) ) ( not ( = ?auto_37690 ?auto_37691 ) ) ( not ( = ?auto_37690 ?auto_37692 ) ) ( not ( = ?auto_37691 ?auto_37692 ) ) ( ON ?auto_37687 ?auto_37693 ) ( not ( = ?auto_37687 ?auto_37693 ) ) ( not ( = ?auto_37688 ?auto_37693 ) ) ( not ( = ?auto_37689 ?auto_37693 ) ) ( not ( = ?auto_37690 ?auto_37693 ) ) ( not ( = ?auto_37691 ?auto_37693 ) ) ( not ( = ?auto_37692 ?auto_37693 ) ) ( ON ?auto_37688 ?auto_37687 ) ( ON-TABLE ?auto_37693 ) ( ON ?auto_37689 ?auto_37688 ) ( ON ?auto_37690 ?auto_37689 ) ( ON ?auto_37691 ?auto_37690 ) ( ON ?auto_37692 ?auto_37691 ) ( CLEAR ?auto_37692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_37693 ?auto_37687 ?auto_37688 ?auto_37689 ?auto_37690 ?auto_37691 )
      ( MAKE-6PILE ?auto_37687 ?auto_37688 ?auto_37689 ?auto_37690 ?auto_37691 ?auto_37692 ) )
  )

)

