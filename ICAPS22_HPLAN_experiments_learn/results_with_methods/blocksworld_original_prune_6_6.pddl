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
      ?auto_44088 - BLOCK
      ?auto_44089 - BLOCK
      ?auto_44090 - BLOCK
      ?auto_44091 - BLOCK
      ?auto_44092 - BLOCK
      ?auto_44093 - BLOCK
    )
    :vars
    (
      ?auto_44094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44094 ?auto_44093 ) ( CLEAR ?auto_44094 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44088 ) ( ON ?auto_44089 ?auto_44088 ) ( ON ?auto_44090 ?auto_44089 ) ( ON ?auto_44091 ?auto_44090 ) ( ON ?auto_44092 ?auto_44091 ) ( ON ?auto_44093 ?auto_44092 ) ( not ( = ?auto_44088 ?auto_44089 ) ) ( not ( = ?auto_44088 ?auto_44090 ) ) ( not ( = ?auto_44088 ?auto_44091 ) ) ( not ( = ?auto_44088 ?auto_44092 ) ) ( not ( = ?auto_44088 ?auto_44093 ) ) ( not ( = ?auto_44088 ?auto_44094 ) ) ( not ( = ?auto_44089 ?auto_44090 ) ) ( not ( = ?auto_44089 ?auto_44091 ) ) ( not ( = ?auto_44089 ?auto_44092 ) ) ( not ( = ?auto_44089 ?auto_44093 ) ) ( not ( = ?auto_44089 ?auto_44094 ) ) ( not ( = ?auto_44090 ?auto_44091 ) ) ( not ( = ?auto_44090 ?auto_44092 ) ) ( not ( = ?auto_44090 ?auto_44093 ) ) ( not ( = ?auto_44090 ?auto_44094 ) ) ( not ( = ?auto_44091 ?auto_44092 ) ) ( not ( = ?auto_44091 ?auto_44093 ) ) ( not ( = ?auto_44091 ?auto_44094 ) ) ( not ( = ?auto_44092 ?auto_44093 ) ) ( not ( = ?auto_44092 ?auto_44094 ) ) ( not ( = ?auto_44093 ?auto_44094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44094 ?auto_44093 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44096 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44096 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_44096 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44097 - BLOCK
    )
    :vars
    (
      ?auto_44098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44097 ?auto_44098 ) ( CLEAR ?auto_44097 ) ( HAND-EMPTY ) ( not ( = ?auto_44097 ?auto_44098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44097 ?auto_44098 )
      ( MAKE-1PILE ?auto_44097 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44104 - BLOCK
      ?auto_44105 - BLOCK
      ?auto_44106 - BLOCK
      ?auto_44107 - BLOCK
      ?auto_44108 - BLOCK
    )
    :vars
    (
      ?auto_44109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44109 ?auto_44108 ) ( CLEAR ?auto_44109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44104 ) ( ON ?auto_44105 ?auto_44104 ) ( ON ?auto_44106 ?auto_44105 ) ( ON ?auto_44107 ?auto_44106 ) ( ON ?auto_44108 ?auto_44107 ) ( not ( = ?auto_44104 ?auto_44105 ) ) ( not ( = ?auto_44104 ?auto_44106 ) ) ( not ( = ?auto_44104 ?auto_44107 ) ) ( not ( = ?auto_44104 ?auto_44108 ) ) ( not ( = ?auto_44104 ?auto_44109 ) ) ( not ( = ?auto_44105 ?auto_44106 ) ) ( not ( = ?auto_44105 ?auto_44107 ) ) ( not ( = ?auto_44105 ?auto_44108 ) ) ( not ( = ?auto_44105 ?auto_44109 ) ) ( not ( = ?auto_44106 ?auto_44107 ) ) ( not ( = ?auto_44106 ?auto_44108 ) ) ( not ( = ?auto_44106 ?auto_44109 ) ) ( not ( = ?auto_44107 ?auto_44108 ) ) ( not ( = ?auto_44107 ?auto_44109 ) ) ( not ( = ?auto_44108 ?auto_44109 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44109 ?auto_44108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44110 - BLOCK
      ?auto_44111 - BLOCK
      ?auto_44112 - BLOCK
      ?auto_44113 - BLOCK
      ?auto_44114 - BLOCK
    )
    :vars
    (
      ?auto_44115 - BLOCK
      ?auto_44116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44115 ?auto_44114 ) ( CLEAR ?auto_44115 ) ( ON-TABLE ?auto_44110 ) ( ON ?auto_44111 ?auto_44110 ) ( ON ?auto_44112 ?auto_44111 ) ( ON ?auto_44113 ?auto_44112 ) ( ON ?auto_44114 ?auto_44113 ) ( not ( = ?auto_44110 ?auto_44111 ) ) ( not ( = ?auto_44110 ?auto_44112 ) ) ( not ( = ?auto_44110 ?auto_44113 ) ) ( not ( = ?auto_44110 ?auto_44114 ) ) ( not ( = ?auto_44110 ?auto_44115 ) ) ( not ( = ?auto_44111 ?auto_44112 ) ) ( not ( = ?auto_44111 ?auto_44113 ) ) ( not ( = ?auto_44111 ?auto_44114 ) ) ( not ( = ?auto_44111 ?auto_44115 ) ) ( not ( = ?auto_44112 ?auto_44113 ) ) ( not ( = ?auto_44112 ?auto_44114 ) ) ( not ( = ?auto_44112 ?auto_44115 ) ) ( not ( = ?auto_44113 ?auto_44114 ) ) ( not ( = ?auto_44113 ?auto_44115 ) ) ( not ( = ?auto_44114 ?auto_44115 ) ) ( HOLDING ?auto_44116 ) ( not ( = ?auto_44110 ?auto_44116 ) ) ( not ( = ?auto_44111 ?auto_44116 ) ) ( not ( = ?auto_44112 ?auto_44116 ) ) ( not ( = ?auto_44113 ?auto_44116 ) ) ( not ( = ?auto_44114 ?auto_44116 ) ) ( not ( = ?auto_44115 ?auto_44116 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_44116 )
      ( MAKE-5PILE ?auto_44110 ?auto_44111 ?auto_44112 ?auto_44113 ?auto_44114 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44117 - BLOCK
      ?auto_44118 - BLOCK
      ?auto_44119 - BLOCK
      ?auto_44120 - BLOCK
      ?auto_44121 - BLOCK
    )
    :vars
    (
      ?auto_44122 - BLOCK
      ?auto_44123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44122 ?auto_44121 ) ( ON-TABLE ?auto_44117 ) ( ON ?auto_44118 ?auto_44117 ) ( ON ?auto_44119 ?auto_44118 ) ( ON ?auto_44120 ?auto_44119 ) ( ON ?auto_44121 ?auto_44120 ) ( not ( = ?auto_44117 ?auto_44118 ) ) ( not ( = ?auto_44117 ?auto_44119 ) ) ( not ( = ?auto_44117 ?auto_44120 ) ) ( not ( = ?auto_44117 ?auto_44121 ) ) ( not ( = ?auto_44117 ?auto_44122 ) ) ( not ( = ?auto_44118 ?auto_44119 ) ) ( not ( = ?auto_44118 ?auto_44120 ) ) ( not ( = ?auto_44118 ?auto_44121 ) ) ( not ( = ?auto_44118 ?auto_44122 ) ) ( not ( = ?auto_44119 ?auto_44120 ) ) ( not ( = ?auto_44119 ?auto_44121 ) ) ( not ( = ?auto_44119 ?auto_44122 ) ) ( not ( = ?auto_44120 ?auto_44121 ) ) ( not ( = ?auto_44120 ?auto_44122 ) ) ( not ( = ?auto_44121 ?auto_44122 ) ) ( not ( = ?auto_44117 ?auto_44123 ) ) ( not ( = ?auto_44118 ?auto_44123 ) ) ( not ( = ?auto_44119 ?auto_44123 ) ) ( not ( = ?auto_44120 ?auto_44123 ) ) ( not ( = ?auto_44121 ?auto_44123 ) ) ( not ( = ?auto_44122 ?auto_44123 ) ) ( ON ?auto_44123 ?auto_44122 ) ( CLEAR ?auto_44123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44117 ?auto_44118 ?auto_44119 ?auto_44120 ?auto_44121 ?auto_44122 )
      ( MAKE-5PILE ?auto_44117 ?auto_44118 ?auto_44119 ?auto_44120 ?auto_44121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44126 - BLOCK
      ?auto_44127 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44127 ) ( CLEAR ?auto_44126 ) ( ON-TABLE ?auto_44126 ) ( not ( = ?auto_44126 ?auto_44127 ) ) )
    :subtasks
    ( ( !STACK ?auto_44127 ?auto_44126 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44128 - BLOCK
      ?auto_44129 - BLOCK
    )
    :vars
    (
      ?auto_44130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44128 ) ( ON-TABLE ?auto_44128 ) ( not ( = ?auto_44128 ?auto_44129 ) ) ( ON ?auto_44129 ?auto_44130 ) ( CLEAR ?auto_44129 ) ( HAND-EMPTY ) ( not ( = ?auto_44128 ?auto_44130 ) ) ( not ( = ?auto_44129 ?auto_44130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44129 ?auto_44130 )
      ( MAKE-2PILE ?auto_44128 ?auto_44129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44131 - BLOCK
      ?auto_44132 - BLOCK
    )
    :vars
    (
      ?auto_44133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44131 ?auto_44132 ) ) ( ON ?auto_44132 ?auto_44133 ) ( CLEAR ?auto_44132 ) ( not ( = ?auto_44131 ?auto_44133 ) ) ( not ( = ?auto_44132 ?auto_44133 ) ) ( HOLDING ?auto_44131 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44131 )
      ( MAKE-2PILE ?auto_44131 ?auto_44132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44134 - BLOCK
      ?auto_44135 - BLOCK
    )
    :vars
    (
      ?auto_44136 - BLOCK
      ?auto_44138 - BLOCK
      ?auto_44139 - BLOCK
      ?auto_44140 - BLOCK
      ?auto_44137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44134 ?auto_44135 ) ) ( ON ?auto_44135 ?auto_44136 ) ( not ( = ?auto_44134 ?auto_44136 ) ) ( not ( = ?auto_44135 ?auto_44136 ) ) ( ON ?auto_44134 ?auto_44135 ) ( CLEAR ?auto_44134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44138 ) ( ON ?auto_44139 ?auto_44138 ) ( ON ?auto_44140 ?auto_44139 ) ( ON ?auto_44137 ?auto_44140 ) ( ON ?auto_44136 ?auto_44137 ) ( not ( = ?auto_44138 ?auto_44139 ) ) ( not ( = ?auto_44138 ?auto_44140 ) ) ( not ( = ?auto_44138 ?auto_44137 ) ) ( not ( = ?auto_44138 ?auto_44136 ) ) ( not ( = ?auto_44138 ?auto_44135 ) ) ( not ( = ?auto_44138 ?auto_44134 ) ) ( not ( = ?auto_44139 ?auto_44140 ) ) ( not ( = ?auto_44139 ?auto_44137 ) ) ( not ( = ?auto_44139 ?auto_44136 ) ) ( not ( = ?auto_44139 ?auto_44135 ) ) ( not ( = ?auto_44139 ?auto_44134 ) ) ( not ( = ?auto_44140 ?auto_44137 ) ) ( not ( = ?auto_44140 ?auto_44136 ) ) ( not ( = ?auto_44140 ?auto_44135 ) ) ( not ( = ?auto_44140 ?auto_44134 ) ) ( not ( = ?auto_44137 ?auto_44136 ) ) ( not ( = ?auto_44137 ?auto_44135 ) ) ( not ( = ?auto_44137 ?auto_44134 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44138 ?auto_44139 ?auto_44140 ?auto_44137 ?auto_44136 ?auto_44135 )
      ( MAKE-2PILE ?auto_44134 ?auto_44135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44145 - BLOCK
      ?auto_44146 - BLOCK
      ?auto_44147 - BLOCK
      ?auto_44148 - BLOCK
    )
    :vars
    (
      ?auto_44149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44149 ?auto_44148 ) ( CLEAR ?auto_44149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44145 ) ( ON ?auto_44146 ?auto_44145 ) ( ON ?auto_44147 ?auto_44146 ) ( ON ?auto_44148 ?auto_44147 ) ( not ( = ?auto_44145 ?auto_44146 ) ) ( not ( = ?auto_44145 ?auto_44147 ) ) ( not ( = ?auto_44145 ?auto_44148 ) ) ( not ( = ?auto_44145 ?auto_44149 ) ) ( not ( = ?auto_44146 ?auto_44147 ) ) ( not ( = ?auto_44146 ?auto_44148 ) ) ( not ( = ?auto_44146 ?auto_44149 ) ) ( not ( = ?auto_44147 ?auto_44148 ) ) ( not ( = ?auto_44147 ?auto_44149 ) ) ( not ( = ?auto_44148 ?auto_44149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44149 ?auto_44148 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44150 - BLOCK
      ?auto_44151 - BLOCK
      ?auto_44152 - BLOCK
      ?auto_44153 - BLOCK
    )
    :vars
    (
      ?auto_44154 - BLOCK
      ?auto_44155 - BLOCK
      ?auto_44156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44154 ?auto_44153 ) ( CLEAR ?auto_44154 ) ( ON-TABLE ?auto_44150 ) ( ON ?auto_44151 ?auto_44150 ) ( ON ?auto_44152 ?auto_44151 ) ( ON ?auto_44153 ?auto_44152 ) ( not ( = ?auto_44150 ?auto_44151 ) ) ( not ( = ?auto_44150 ?auto_44152 ) ) ( not ( = ?auto_44150 ?auto_44153 ) ) ( not ( = ?auto_44150 ?auto_44154 ) ) ( not ( = ?auto_44151 ?auto_44152 ) ) ( not ( = ?auto_44151 ?auto_44153 ) ) ( not ( = ?auto_44151 ?auto_44154 ) ) ( not ( = ?auto_44152 ?auto_44153 ) ) ( not ( = ?auto_44152 ?auto_44154 ) ) ( not ( = ?auto_44153 ?auto_44154 ) ) ( HOLDING ?auto_44155 ) ( CLEAR ?auto_44156 ) ( not ( = ?auto_44150 ?auto_44155 ) ) ( not ( = ?auto_44150 ?auto_44156 ) ) ( not ( = ?auto_44151 ?auto_44155 ) ) ( not ( = ?auto_44151 ?auto_44156 ) ) ( not ( = ?auto_44152 ?auto_44155 ) ) ( not ( = ?auto_44152 ?auto_44156 ) ) ( not ( = ?auto_44153 ?auto_44155 ) ) ( not ( = ?auto_44153 ?auto_44156 ) ) ( not ( = ?auto_44154 ?auto_44155 ) ) ( not ( = ?auto_44154 ?auto_44156 ) ) ( not ( = ?auto_44155 ?auto_44156 ) ) )
    :subtasks
    ( ( !STACK ?auto_44155 ?auto_44156 )
      ( MAKE-4PILE ?auto_44150 ?auto_44151 ?auto_44152 ?auto_44153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44756 - BLOCK
      ?auto_44757 - BLOCK
      ?auto_44758 - BLOCK
      ?auto_44759 - BLOCK
    )
    :vars
    (
      ?auto_44760 - BLOCK
      ?auto_44761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44760 ?auto_44759 ) ( ON-TABLE ?auto_44756 ) ( ON ?auto_44757 ?auto_44756 ) ( ON ?auto_44758 ?auto_44757 ) ( ON ?auto_44759 ?auto_44758 ) ( not ( = ?auto_44756 ?auto_44757 ) ) ( not ( = ?auto_44756 ?auto_44758 ) ) ( not ( = ?auto_44756 ?auto_44759 ) ) ( not ( = ?auto_44756 ?auto_44760 ) ) ( not ( = ?auto_44757 ?auto_44758 ) ) ( not ( = ?auto_44757 ?auto_44759 ) ) ( not ( = ?auto_44757 ?auto_44760 ) ) ( not ( = ?auto_44758 ?auto_44759 ) ) ( not ( = ?auto_44758 ?auto_44760 ) ) ( not ( = ?auto_44759 ?auto_44760 ) ) ( not ( = ?auto_44756 ?auto_44761 ) ) ( not ( = ?auto_44757 ?auto_44761 ) ) ( not ( = ?auto_44758 ?auto_44761 ) ) ( not ( = ?auto_44759 ?auto_44761 ) ) ( not ( = ?auto_44760 ?auto_44761 ) ) ( ON ?auto_44761 ?auto_44760 ) ( CLEAR ?auto_44761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44756 ?auto_44757 ?auto_44758 ?auto_44759 ?auto_44760 )
      ( MAKE-4PILE ?auto_44756 ?auto_44757 ?auto_44758 ?auto_44759 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44164 - BLOCK
      ?auto_44165 - BLOCK
      ?auto_44166 - BLOCK
      ?auto_44167 - BLOCK
    )
    :vars
    (
      ?auto_44170 - BLOCK
      ?auto_44168 - BLOCK
      ?auto_44169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44170 ?auto_44167 ) ( ON-TABLE ?auto_44164 ) ( ON ?auto_44165 ?auto_44164 ) ( ON ?auto_44166 ?auto_44165 ) ( ON ?auto_44167 ?auto_44166 ) ( not ( = ?auto_44164 ?auto_44165 ) ) ( not ( = ?auto_44164 ?auto_44166 ) ) ( not ( = ?auto_44164 ?auto_44167 ) ) ( not ( = ?auto_44164 ?auto_44170 ) ) ( not ( = ?auto_44165 ?auto_44166 ) ) ( not ( = ?auto_44165 ?auto_44167 ) ) ( not ( = ?auto_44165 ?auto_44170 ) ) ( not ( = ?auto_44166 ?auto_44167 ) ) ( not ( = ?auto_44166 ?auto_44170 ) ) ( not ( = ?auto_44167 ?auto_44170 ) ) ( not ( = ?auto_44164 ?auto_44168 ) ) ( not ( = ?auto_44164 ?auto_44169 ) ) ( not ( = ?auto_44165 ?auto_44168 ) ) ( not ( = ?auto_44165 ?auto_44169 ) ) ( not ( = ?auto_44166 ?auto_44168 ) ) ( not ( = ?auto_44166 ?auto_44169 ) ) ( not ( = ?auto_44167 ?auto_44168 ) ) ( not ( = ?auto_44167 ?auto_44169 ) ) ( not ( = ?auto_44170 ?auto_44168 ) ) ( not ( = ?auto_44170 ?auto_44169 ) ) ( not ( = ?auto_44168 ?auto_44169 ) ) ( ON ?auto_44168 ?auto_44170 ) ( CLEAR ?auto_44168 ) ( HOLDING ?auto_44169 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44169 )
      ( MAKE-4PILE ?auto_44164 ?auto_44165 ?auto_44166 ?auto_44167 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44171 - BLOCK
      ?auto_44172 - BLOCK
      ?auto_44173 - BLOCK
      ?auto_44174 - BLOCK
    )
    :vars
    (
      ?auto_44176 - BLOCK
      ?auto_44177 - BLOCK
      ?auto_44175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44176 ?auto_44174 ) ( ON-TABLE ?auto_44171 ) ( ON ?auto_44172 ?auto_44171 ) ( ON ?auto_44173 ?auto_44172 ) ( ON ?auto_44174 ?auto_44173 ) ( not ( = ?auto_44171 ?auto_44172 ) ) ( not ( = ?auto_44171 ?auto_44173 ) ) ( not ( = ?auto_44171 ?auto_44174 ) ) ( not ( = ?auto_44171 ?auto_44176 ) ) ( not ( = ?auto_44172 ?auto_44173 ) ) ( not ( = ?auto_44172 ?auto_44174 ) ) ( not ( = ?auto_44172 ?auto_44176 ) ) ( not ( = ?auto_44173 ?auto_44174 ) ) ( not ( = ?auto_44173 ?auto_44176 ) ) ( not ( = ?auto_44174 ?auto_44176 ) ) ( not ( = ?auto_44171 ?auto_44177 ) ) ( not ( = ?auto_44171 ?auto_44175 ) ) ( not ( = ?auto_44172 ?auto_44177 ) ) ( not ( = ?auto_44172 ?auto_44175 ) ) ( not ( = ?auto_44173 ?auto_44177 ) ) ( not ( = ?auto_44173 ?auto_44175 ) ) ( not ( = ?auto_44174 ?auto_44177 ) ) ( not ( = ?auto_44174 ?auto_44175 ) ) ( not ( = ?auto_44176 ?auto_44177 ) ) ( not ( = ?auto_44176 ?auto_44175 ) ) ( not ( = ?auto_44177 ?auto_44175 ) ) ( ON ?auto_44177 ?auto_44176 ) ( ON ?auto_44175 ?auto_44177 ) ( CLEAR ?auto_44175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44171 ?auto_44172 ?auto_44173 ?auto_44174 ?auto_44176 ?auto_44177 )
      ( MAKE-4PILE ?auto_44171 ?auto_44172 ?auto_44173 ?auto_44174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44181 - BLOCK
      ?auto_44182 - BLOCK
      ?auto_44183 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44183 ) ( CLEAR ?auto_44182 ) ( ON-TABLE ?auto_44181 ) ( ON ?auto_44182 ?auto_44181 ) ( not ( = ?auto_44181 ?auto_44182 ) ) ( not ( = ?auto_44181 ?auto_44183 ) ) ( not ( = ?auto_44182 ?auto_44183 ) ) )
    :subtasks
    ( ( !STACK ?auto_44183 ?auto_44182 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44184 - BLOCK
      ?auto_44185 - BLOCK
      ?auto_44186 - BLOCK
    )
    :vars
    (
      ?auto_44187 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44185 ) ( ON-TABLE ?auto_44184 ) ( ON ?auto_44185 ?auto_44184 ) ( not ( = ?auto_44184 ?auto_44185 ) ) ( not ( = ?auto_44184 ?auto_44186 ) ) ( not ( = ?auto_44185 ?auto_44186 ) ) ( ON ?auto_44186 ?auto_44187 ) ( CLEAR ?auto_44186 ) ( HAND-EMPTY ) ( not ( = ?auto_44184 ?auto_44187 ) ) ( not ( = ?auto_44185 ?auto_44187 ) ) ( not ( = ?auto_44186 ?auto_44187 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44186 ?auto_44187 )
      ( MAKE-3PILE ?auto_44184 ?auto_44185 ?auto_44186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44188 - BLOCK
      ?auto_44189 - BLOCK
      ?auto_44190 - BLOCK
    )
    :vars
    (
      ?auto_44191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44188 ) ( not ( = ?auto_44188 ?auto_44189 ) ) ( not ( = ?auto_44188 ?auto_44190 ) ) ( not ( = ?auto_44189 ?auto_44190 ) ) ( ON ?auto_44190 ?auto_44191 ) ( CLEAR ?auto_44190 ) ( not ( = ?auto_44188 ?auto_44191 ) ) ( not ( = ?auto_44189 ?auto_44191 ) ) ( not ( = ?auto_44190 ?auto_44191 ) ) ( HOLDING ?auto_44189 ) ( CLEAR ?auto_44188 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44188 ?auto_44189 )
      ( MAKE-3PILE ?auto_44188 ?auto_44189 ?auto_44190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44192 - BLOCK
      ?auto_44193 - BLOCK
      ?auto_44194 - BLOCK
    )
    :vars
    (
      ?auto_44195 - BLOCK
      ?auto_44197 - BLOCK
      ?auto_44198 - BLOCK
      ?auto_44196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44192 ) ( not ( = ?auto_44192 ?auto_44193 ) ) ( not ( = ?auto_44192 ?auto_44194 ) ) ( not ( = ?auto_44193 ?auto_44194 ) ) ( ON ?auto_44194 ?auto_44195 ) ( not ( = ?auto_44192 ?auto_44195 ) ) ( not ( = ?auto_44193 ?auto_44195 ) ) ( not ( = ?auto_44194 ?auto_44195 ) ) ( CLEAR ?auto_44192 ) ( ON ?auto_44193 ?auto_44194 ) ( CLEAR ?auto_44193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44197 ) ( ON ?auto_44198 ?auto_44197 ) ( ON ?auto_44196 ?auto_44198 ) ( ON ?auto_44195 ?auto_44196 ) ( not ( = ?auto_44197 ?auto_44198 ) ) ( not ( = ?auto_44197 ?auto_44196 ) ) ( not ( = ?auto_44197 ?auto_44195 ) ) ( not ( = ?auto_44197 ?auto_44194 ) ) ( not ( = ?auto_44197 ?auto_44193 ) ) ( not ( = ?auto_44198 ?auto_44196 ) ) ( not ( = ?auto_44198 ?auto_44195 ) ) ( not ( = ?auto_44198 ?auto_44194 ) ) ( not ( = ?auto_44198 ?auto_44193 ) ) ( not ( = ?auto_44196 ?auto_44195 ) ) ( not ( = ?auto_44196 ?auto_44194 ) ) ( not ( = ?auto_44196 ?auto_44193 ) ) ( not ( = ?auto_44192 ?auto_44197 ) ) ( not ( = ?auto_44192 ?auto_44198 ) ) ( not ( = ?auto_44192 ?auto_44196 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44197 ?auto_44198 ?auto_44196 ?auto_44195 ?auto_44194 )
      ( MAKE-3PILE ?auto_44192 ?auto_44193 ?auto_44194 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44199 - BLOCK
      ?auto_44200 - BLOCK
      ?auto_44201 - BLOCK
    )
    :vars
    (
      ?auto_44203 - BLOCK
      ?auto_44205 - BLOCK
      ?auto_44204 - BLOCK
      ?auto_44202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44199 ?auto_44200 ) ) ( not ( = ?auto_44199 ?auto_44201 ) ) ( not ( = ?auto_44200 ?auto_44201 ) ) ( ON ?auto_44201 ?auto_44203 ) ( not ( = ?auto_44199 ?auto_44203 ) ) ( not ( = ?auto_44200 ?auto_44203 ) ) ( not ( = ?auto_44201 ?auto_44203 ) ) ( ON ?auto_44200 ?auto_44201 ) ( CLEAR ?auto_44200 ) ( ON-TABLE ?auto_44205 ) ( ON ?auto_44204 ?auto_44205 ) ( ON ?auto_44202 ?auto_44204 ) ( ON ?auto_44203 ?auto_44202 ) ( not ( = ?auto_44205 ?auto_44204 ) ) ( not ( = ?auto_44205 ?auto_44202 ) ) ( not ( = ?auto_44205 ?auto_44203 ) ) ( not ( = ?auto_44205 ?auto_44201 ) ) ( not ( = ?auto_44205 ?auto_44200 ) ) ( not ( = ?auto_44204 ?auto_44202 ) ) ( not ( = ?auto_44204 ?auto_44203 ) ) ( not ( = ?auto_44204 ?auto_44201 ) ) ( not ( = ?auto_44204 ?auto_44200 ) ) ( not ( = ?auto_44202 ?auto_44203 ) ) ( not ( = ?auto_44202 ?auto_44201 ) ) ( not ( = ?auto_44202 ?auto_44200 ) ) ( not ( = ?auto_44199 ?auto_44205 ) ) ( not ( = ?auto_44199 ?auto_44204 ) ) ( not ( = ?auto_44199 ?auto_44202 ) ) ( HOLDING ?auto_44199 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44199 )
      ( MAKE-3PILE ?auto_44199 ?auto_44200 ?auto_44201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44206 - BLOCK
      ?auto_44207 - BLOCK
      ?auto_44208 - BLOCK
    )
    :vars
    (
      ?auto_44210 - BLOCK
      ?auto_44212 - BLOCK
      ?auto_44209 - BLOCK
      ?auto_44211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44206 ?auto_44207 ) ) ( not ( = ?auto_44206 ?auto_44208 ) ) ( not ( = ?auto_44207 ?auto_44208 ) ) ( ON ?auto_44208 ?auto_44210 ) ( not ( = ?auto_44206 ?auto_44210 ) ) ( not ( = ?auto_44207 ?auto_44210 ) ) ( not ( = ?auto_44208 ?auto_44210 ) ) ( ON ?auto_44207 ?auto_44208 ) ( ON-TABLE ?auto_44212 ) ( ON ?auto_44209 ?auto_44212 ) ( ON ?auto_44211 ?auto_44209 ) ( ON ?auto_44210 ?auto_44211 ) ( not ( = ?auto_44212 ?auto_44209 ) ) ( not ( = ?auto_44212 ?auto_44211 ) ) ( not ( = ?auto_44212 ?auto_44210 ) ) ( not ( = ?auto_44212 ?auto_44208 ) ) ( not ( = ?auto_44212 ?auto_44207 ) ) ( not ( = ?auto_44209 ?auto_44211 ) ) ( not ( = ?auto_44209 ?auto_44210 ) ) ( not ( = ?auto_44209 ?auto_44208 ) ) ( not ( = ?auto_44209 ?auto_44207 ) ) ( not ( = ?auto_44211 ?auto_44210 ) ) ( not ( = ?auto_44211 ?auto_44208 ) ) ( not ( = ?auto_44211 ?auto_44207 ) ) ( not ( = ?auto_44206 ?auto_44212 ) ) ( not ( = ?auto_44206 ?auto_44209 ) ) ( not ( = ?auto_44206 ?auto_44211 ) ) ( ON ?auto_44206 ?auto_44207 ) ( CLEAR ?auto_44206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44212 ?auto_44209 ?auto_44211 ?auto_44210 ?auto_44208 ?auto_44207 )
      ( MAKE-3PILE ?auto_44206 ?auto_44207 ?auto_44208 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44216 - BLOCK
      ?auto_44217 - BLOCK
      ?auto_44218 - BLOCK
    )
    :vars
    (
      ?auto_44219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44219 ?auto_44218 ) ( CLEAR ?auto_44219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44216 ) ( ON ?auto_44217 ?auto_44216 ) ( ON ?auto_44218 ?auto_44217 ) ( not ( = ?auto_44216 ?auto_44217 ) ) ( not ( = ?auto_44216 ?auto_44218 ) ) ( not ( = ?auto_44216 ?auto_44219 ) ) ( not ( = ?auto_44217 ?auto_44218 ) ) ( not ( = ?auto_44217 ?auto_44219 ) ) ( not ( = ?auto_44218 ?auto_44219 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44219 ?auto_44218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44220 - BLOCK
      ?auto_44221 - BLOCK
      ?auto_44222 - BLOCK
    )
    :vars
    (
      ?auto_44223 - BLOCK
      ?auto_44224 - BLOCK
      ?auto_44225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44223 ?auto_44222 ) ( CLEAR ?auto_44223 ) ( ON-TABLE ?auto_44220 ) ( ON ?auto_44221 ?auto_44220 ) ( ON ?auto_44222 ?auto_44221 ) ( not ( = ?auto_44220 ?auto_44221 ) ) ( not ( = ?auto_44220 ?auto_44222 ) ) ( not ( = ?auto_44220 ?auto_44223 ) ) ( not ( = ?auto_44221 ?auto_44222 ) ) ( not ( = ?auto_44221 ?auto_44223 ) ) ( not ( = ?auto_44222 ?auto_44223 ) ) ( HOLDING ?auto_44224 ) ( CLEAR ?auto_44225 ) ( not ( = ?auto_44220 ?auto_44224 ) ) ( not ( = ?auto_44220 ?auto_44225 ) ) ( not ( = ?auto_44221 ?auto_44224 ) ) ( not ( = ?auto_44221 ?auto_44225 ) ) ( not ( = ?auto_44222 ?auto_44224 ) ) ( not ( = ?auto_44222 ?auto_44225 ) ) ( not ( = ?auto_44223 ?auto_44224 ) ) ( not ( = ?auto_44223 ?auto_44225 ) ) ( not ( = ?auto_44224 ?auto_44225 ) ) )
    :subtasks
    ( ( !STACK ?auto_44224 ?auto_44225 )
      ( MAKE-3PILE ?auto_44220 ?auto_44221 ?auto_44222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44226 - BLOCK
      ?auto_44227 - BLOCK
      ?auto_44228 - BLOCK
    )
    :vars
    (
      ?auto_44230 - BLOCK
      ?auto_44229 - BLOCK
      ?auto_44231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44230 ?auto_44228 ) ( ON-TABLE ?auto_44226 ) ( ON ?auto_44227 ?auto_44226 ) ( ON ?auto_44228 ?auto_44227 ) ( not ( = ?auto_44226 ?auto_44227 ) ) ( not ( = ?auto_44226 ?auto_44228 ) ) ( not ( = ?auto_44226 ?auto_44230 ) ) ( not ( = ?auto_44227 ?auto_44228 ) ) ( not ( = ?auto_44227 ?auto_44230 ) ) ( not ( = ?auto_44228 ?auto_44230 ) ) ( CLEAR ?auto_44229 ) ( not ( = ?auto_44226 ?auto_44231 ) ) ( not ( = ?auto_44226 ?auto_44229 ) ) ( not ( = ?auto_44227 ?auto_44231 ) ) ( not ( = ?auto_44227 ?auto_44229 ) ) ( not ( = ?auto_44228 ?auto_44231 ) ) ( not ( = ?auto_44228 ?auto_44229 ) ) ( not ( = ?auto_44230 ?auto_44231 ) ) ( not ( = ?auto_44230 ?auto_44229 ) ) ( not ( = ?auto_44231 ?auto_44229 ) ) ( ON ?auto_44231 ?auto_44230 ) ( CLEAR ?auto_44231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44226 ?auto_44227 ?auto_44228 ?auto_44230 )
      ( MAKE-3PILE ?auto_44226 ?auto_44227 ?auto_44228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44232 - BLOCK
      ?auto_44233 - BLOCK
      ?auto_44234 - BLOCK
    )
    :vars
    (
      ?auto_44235 - BLOCK
      ?auto_44237 - BLOCK
      ?auto_44236 - BLOCK
      ?auto_44238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44235 ?auto_44234 ) ( ON-TABLE ?auto_44232 ) ( ON ?auto_44233 ?auto_44232 ) ( ON ?auto_44234 ?auto_44233 ) ( not ( = ?auto_44232 ?auto_44233 ) ) ( not ( = ?auto_44232 ?auto_44234 ) ) ( not ( = ?auto_44232 ?auto_44235 ) ) ( not ( = ?auto_44233 ?auto_44234 ) ) ( not ( = ?auto_44233 ?auto_44235 ) ) ( not ( = ?auto_44234 ?auto_44235 ) ) ( not ( = ?auto_44232 ?auto_44237 ) ) ( not ( = ?auto_44232 ?auto_44236 ) ) ( not ( = ?auto_44233 ?auto_44237 ) ) ( not ( = ?auto_44233 ?auto_44236 ) ) ( not ( = ?auto_44234 ?auto_44237 ) ) ( not ( = ?auto_44234 ?auto_44236 ) ) ( not ( = ?auto_44235 ?auto_44237 ) ) ( not ( = ?auto_44235 ?auto_44236 ) ) ( not ( = ?auto_44237 ?auto_44236 ) ) ( ON ?auto_44237 ?auto_44235 ) ( CLEAR ?auto_44237 ) ( HOLDING ?auto_44236 ) ( CLEAR ?auto_44238 ) ( ON-TABLE ?auto_44238 ) ( not ( = ?auto_44238 ?auto_44236 ) ) ( not ( = ?auto_44232 ?auto_44238 ) ) ( not ( = ?auto_44233 ?auto_44238 ) ) ( not ( = ?auto_44234 ?auto_44238 ) ) ( not ( = ?auto_44235 ?auto_44238 ) ) ( not ( = ?auto_44237 ?auto_44238 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44238 ?auto_44236 )
      ( MAKE-3PILE ?auto_44232 ?auto_44233 ?auto_44234 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44930 - BLOCK
      ?auto_44931 - BLOCK
      ?auto_44932 - BLOCK
    )
    :vars
    (
      ?auto_44933 - BLOCK
      ?auto_44934 - BLOCK
      ?auto_44935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44933 ?auto_44932 ) ( ON-TABLE ?auto_44930 ) ( ON ?auto_44931 ?auto_44930 ) ( ON ?auto_44932 ?auto_44931 ) ( not ( = ?auto_44930 ?auto_44931 ) ) ( not ( = ?auto_44930 ?auto_44932 ) ) ( not ( = ?auto_44930 ?auto_44933 ) ) ( not ( = ?auto_44931 ?auto_44932 ) ) ( not ( = ?auto_44931 ?auto_44933 ) ) ( not ( = ?auto_44932 ?auto_44933 ) ) ( not ( = ?auto_44930 ?auto_44934 ) ) ( not ( = ?auto_44930 ?auto_44935 ) ) ( not ( = ?auto_44931 ?auto_44934 ) ) ( not ( = ?auto_44931 ?auto_44935 ) ) ( not ( = ?auto_44932 ?auto_44934 ) ) ( not ( = ?auto_44932 ?auto_44935 ) ) ( not ( = ?auto_44933 ?auto_44934 ) ) ( not ( = ?auto_44933 ?auto_44935 ) ) ( not ( = ?auto_44934 ?auto_44935 ) ) ( ON ?auto_44934 ?auto_44933 ) ( ON ?auto_44935 ?auto_44934 ) ( CLEAR ?auto_44935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44930 ?auto_44931 ?auto_44932 ?auto_44933 ?auto_44934 )
      ( MAKE-3PILE ?auto_44930 ?auto_44931 ?auto_44932 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44246 - BLOCK
      ?auto_44247 - BLOCK
      ?auto_44248 - BLOCK
    )
    :vars
    (
      ?auto_44250 - BLOCK
      ?auto_44251 - BLOCK
      ?auto_44252 - BLOCK
      ?auto_44249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44250 ?auto_44248 ) ( ON-TABLE ?auto_44246 ) ( ON ?auto_44247 ?auto_44246 ) ( ON ?auto_44248 ?auto_44247 ) ( not ( = ?auto_44246 ?auto_44247 ) ) ( not ( = ?auto_44246 ?auto_44248 ) ) ( not ( = ?auto_44246 ?auto_44250 ) ) ( not ( = ?auto_44247 ?auto_44248 ) ) ( not ( = ?auto_44247 ?auto_44250 ) ) ( not ( = ?auto_44248 ?auto_44250 ) ) ( not ( = ?auto_44246 ?auto_44251 ) ) ( not ( = ?auto_44246 ?auto_44252 ) ) ( not ( = ?auto_44247 ?auto_44251 ) ) ( not ( = ?auto_44247 ?auto_44252 ) ) ( not ( = ?auto_44248 ?auto_44251 ) ) ( not ( = ?auto_44248 ?auto_44252 ) ) ( not ( = ?auto_44250 ?auto_44251 ) ) ( not ( = ?auto_44250 ?auto_44252 ) ) ( not ( = ?auto_44251 ?auto_44252 ) ) ( ON ?auto_44251 ?auto_44250 ) ( not ( = ?auto_44249 ?auto_44252 ) ) ( not ( = ?auto_44246 ?auto_44249 ) ) ( not ( = ?auto_44247 ?auto_44249 ) ) ( not ( = ?auto_44248 ?auto_44249 ) ) ( not ( = ?auto_44250 ?auto_44249 ) ) ( not ( = ?auto_44251 ?auto_44249 ) ) ( ON ?auto_44252 ?auto_44251 ) ( CLEAR ?auto_44252 ) ( HOLDING ?auto_44249 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44249 )
      ( MAKE-3PILE ?auto_44246 ?auto_44247 ?auto_44248 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44253 - BLOCK
      ?auto_44254 - BLOCK
      ?auto_44255 - BLOCK
    )
    :vars
    (
      ?auto_44256 - BLOCK
      ?auto_44259 - BLOCK
      ?auto_44258 - BLOCK
      ?auto_44257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44256 ?auto_44255 ) ( ON-TABLE ?auto_44253 ) ( ON ?auto_44254 ?auto_44253 ) ( ON ?auto_44255 ?auto_44254 ) ( not ( = ?auto_44253 ?auto_44254 ) ) ( not ( = ?auto_44253 ?auto_44255 ) ) ( not ( = ?auto_44253 ?auto_44256 ) ) ( not ( = ?auto_44254 ?auto_44255 ) ) ( not ( = ?auto_44254 ?auto_44256 ) ) ( not ( = ?auto_44255 ?auto_44256 ) ) ( not ( = ?auto_44253 ?auto_44259 ) ) ( not ( = ?auto_44253 ?auto_44258 ) ) ( not ( = ?auto_44254 ?auto_44259 ) ) ( not ( = ?auto_44254 ?auto_44258 ) ) ( not ( = ?auto_44255 ?auto_44259 ) ) ( not ( = ?auto_44255 ?auto_44258 ) ) ( not ( = ?auto_44256 ?auto_44259 ) ) ( not ( = ?auto_44256 ?auto_44258 ) ) ( not ( = ?auto_44259 ?auto_44258 ) ) ( ON ?auto_44259 ?auto_44256 ) ( not ( = ?auto_44257 ?auto_44258 ) ) ( not ( = ?auto_44253 ?auto_44257 ) ) ( not ( = ?auto_44254 ?auto_44257 ) ) ( not ( = ?auto_44255 ?auto_44257 ) ) ( not ( = ?auto_44256 ?auto_44257 ) ) ( not ( = ?auto_44259 ?auto_44257 ) ) ( ON ?auto_44258 ?auto_44259 ) ( ON ?auto_44257 ?auto_44258 ) ( CLEAR ?auto_44257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44253 ?auto_44254 ?auto_44255 ?auto_44256 ?auto_44259 ?auto_44258 )
      ( MAKE-3PILE ?auto_44253 ?auto_44254 ?auto_44255 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44264 - BLOCK
      ?auto_44265 - BLOCK
      ?auto_44266 - BLOCK
      ?auto_44267 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44267 ) ( CLEAR ?auto_44266 ) ( ON-TABLE ?auto_44264 ) ( ON ?auto_44265 ?auto_44264 ) ( ON ?auto_44266 ?auto_44265 ) ( not ( = ?auto_44264 ?auto_44265 ) ) ( not ( = ?auto_44264 ?auto_44266 ) ) ( not ( = ?auto_44264 ?auto_44267 ) ) ( not ( = ?auto_44265 ?auto_44266 ) ) ( not ( = ?auto_44265 ?auto_44267 ) ) ( not ( = ?auto_44266 ?auto_44267 ) ) )
    :subtasks
    ( ( !STACK ?auto_44267 ?auto_44266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44268 - BLOCK
      ?auto_44269 - BLOCK
      ?auto_44270 - BLOCK
      ?auto_44271 - BLOCK
    )
    :vars
    (
      ?auto_44272 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44270 ) ( ON-TABLE ?auto_44268 ) ( ON ?auto_44269 ?auto_44268 ) ( ON ?auto_44270 ?auto_44269 ) ( not ( = ?auto_44268 ?auto_44269 ) ) ( not ( = ?auto_44268 ?auto_44270 ) ) ( not ( = ?auto_44268 ?auto_44271 ) ) ( not ( = ?auto_44269 ?auto_44270 ) ) ( not ( = ?auto_44269 ?auto_44271 ) ) ( not ( = ?auto_44270 ?auto_44271 ) ) ( ON ?auto_44271 ?auto_44272 ) ( CLEAR ?auto_44271 ) ( HAND-EMPTY ) ( not ( = ?auto_44268 ?auto_44272 ) ) ( not ( = ?auto_44269 ?auto_44272 ) ) ( not ( = ?auto_44270 ?auto_44272 ) ) ( not ( = ?auto_44271 ?auto_44272 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44271 ?auto_44272 )
      ( MAKE-4PILE ?auto_44268 ?auto_44269 ?auto_44270 ?auto_44271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44273 - BLOCK
      ?auto_44274 - BLOCK
      ?auto_44275 - BLOCK
      ?auto_44276 - BLOCK
    )
    :vars
    (
      ?auto_44277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44273 ) ( ON ?auto_44274 ?auto_44273 ) ( not ( = ?auto_44273 ?auto_44274 ) ) ( not ( = ?auto_44273 ?auto_44275 ) ) ( not ( = ?auto_44273 ?auto_44276 ) ) ( not ( = ?auto_44274 ?auto_44275 ) ) ( not ( = ?auto_44274 ?auto_44276 ) ) ( not ( = ?auto_44275 ?auto_44276 ) ) ( ON ?auto_44276 ?auto_44277 ) ( CLEAR ?auto_44276 ) ( not ( = ?auto_44273 ?auto_44277 ) ) ( not ( = ?auto_44274 ?auto_44277 ) ) ( not ( = ?auto_44275 ?auto_44277 ) ) ( not ( = ?auto_44276 ?auto_44277 ) ) ( HOLDING ?auto_44275 ) ( CLEAR ?auto_44274 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44273 ?auto_44274 ?auto_44275 )
      ( MAKE-4PILE ?auto_44273 ?auto_44274 ?auto_44275 ?auto_44276 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44278 - BLOCK
      ?auto_44279 - BLOCK
      ?auto_44280 - BLOCK
      ?auto_44281 - BLOCK
    )
    :vars
    (
      ?auto_44282 - BLOCK
      ?auto_44283 - BLOCK
      ?auto_44284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44278 ) ( ON ?auto_44279 ?auto_44278 ) ( not ( = ?auto_44278 ?auto_44279 ) ) ( not ( = ?auto_44278 ?auto_44280 ) ) ( not ( = ?auto_44278 ?auto_44281 ) ) ( not ( = ?auto_44279 ?auto_44280 ) ) ( not ( = ?auto_44279 ?auto_44281 ) ) ( not ( = ?auto_44280 ?auto_44281 ) ) ( ON ?auto_44281 ?auto_44282 ) ( not ( = ?auto_44278 ?auto_44282 ) ) ( not ( = ?auto_44279 ?auto_44282 ) ) ( not ( = ?auto_44280 ?auto_44282 ) ) ( not ( = ?auto_44281 ?auto_44282 ) ) ( CLEAR ?auto_44279 ) ( ON ?auto_44280 ?auto_44281 ) ( CLEAR ?auto_44280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44283 ) ( ON ?auto_44284 ?auto_44283 ) ( ON ?auto_44282 ?auto_44284 ) ( not ( = ?auto_44283 ?auto_44284 ) ) ( not ( = ?auto_44283 ?auto_44282 ) ) ( not ( = ?auto_44283 ?auto_44281 ) ) ( not ( = ?auto_44283 ?auto_44280 ) ) ( not ( = ?auto_44284 ?auto_44282 ) ) ( not ( = ?auto_44284 ?auto_44281 ) ) ( not ( = ?auto_44284 ?auto_44280 ) ) ( not ( = ?auto_44278 ?auto_44283 ) ) ( not ( = ?auto_44278 ?auto_44284 ) ) ( not ( = ?auto_44279 ?auto_44283 ) ) ( not ( = ?auto_44279 ?auto_44284 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44283 ?auto_44284 ?auto_44282 ?auto_44281 )
      ( MAKE-4PILE ?auto_44278 ?auto_44279 ?auto_44280 ?auto_44281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44285 - BLOCK
      ?auto_44286 - BLOCK
      ?auto_44287 - BLOCK
      ?auto_44288 - BLOCK
    )
    :vars
    (
      ?auto_44289 - BLOCK
      ?auto_44291 - BLOCK
      ?auto_44290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44285 ) ( not ( = ?auto_44285 ?auto_44286 ) ) ( not ( = ?auto_44285 ?auto_44287 ) ) ( not ( = ?auto_44285 ?auto_44288 ) ) ( not ( = ?auto_44286 ?auto_44287 ) ) ( not ( = ?auto_44286 ?auto_44288 ) ) ( not ( = ?auto_44287 ?auto_44288 ) ) ( ON ?auto_44288 ?auto_44289 ) ( not ( = ?auto_44285 ?auto_44289 ) ) ( not ( = ?auto_44286 ?auto_44289 ) ) ( not ( = ?auto_44287 ?auto_44289 ) ) ( not ( = ?auto_44288 ?auto_44289 ) ) ( ON ?auto_44287 ?auto_44288 ) ( CLEAR ?auto_44287 ) ( ON-TABLE ?auto_44291 ) ( ON ?auto_44290 ?auto_44291 ) ( ON ?auto_44289 ?auto_44290 ) ( not ( = ?auto_44291 ?auto_44290 ) ) ( not ( = ?auto_44291 ?auto_44289 ) ) ( not ( = ?auto_44291 ?auto_44288 ) ) ( not ( = ?auto_44291 ?auto_44287 ) ) ( not ( = ?auto_44290 ?auto_44289 ) ) ( not ( = ?auto_44290 ?auto_44288 ) ) ( not ( = ?auto_44290 ?auto_44287 ) ) ( not ( = ?auto_44285 ?auto_44291 ) ) ( not ( = ?auto_44285 ?auto_44290 ) ) ( not ( = ?auto_44286 ?auto_44291 ) ) ( not ( = ?auto_44286 ?auto_44290 ) ) ( HOLDING ?auto_44286 ) ( CLEAR ?auto_44285 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44285 ?auto_44286 )
      ( MAKE-4PILE ?auto_44285 ?auto_44286 ?auto_44287 ?auto_44288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44292 - BLOCK
      ?auto_44293 - BLOCK
      ?auto_44294 - BLOCK
      ?auto_44295 - BLOCK
    )
    :vars
    (
      ?auto_44296 - BLOCK
      ?auto_44298 - BLOCK
      ?auto_44297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44292 ) ( not ( = ?auto_44292 ?auto_44293 ) ) ( not ( = ?auto_44292 ?auto_44294 ) ) ( not ( = ?auto_44292 ?auto_44295 ) ) ( not ( = ?auto_44293 ?auto_44294 ) ) ( not ( = ?auto_44293 ?auto_44295 ) ) ( not ( = ?auto_44294 ?auto_44295 ) ) ( ON ?auto_44295 ?auto_44296 ) ( not ( = ?auto_44292 ?auto_44296 ) ) ( not ( = ?auto_44293 ?auto_44296 ) ) ( not ( = ?auto_44294 ?auto_44296 ) ) ( not ( = ?auto_44295 ?auto_44296 ) ) ( ON ?auto_44294 ?auto_44295 ) ( ON-TABLE ?auto_44298 ) ( ON ?auto_44297 ?auto_44298 ) ( ON ?auto_44296 ?auto_44297 ) ( not ( = ?auto_44298 ?auto_44297 ) ) ( not ( = ?auto_44298 ?auto_44296 ) ) ( not ( = ?auto_44298 ?auto_44295 ) ) ( not ( = ?auto_44298 ?auto_44294 ) ) ( not ( = ?auto_44297 ?auto_44296 ) ) ( not ( = ?auto_44297 ?auto_44295 ) ) ( not ( = ?auto_44297 ?auto_44294 ) ) ( not ( = ?auto_44292 ?auto_44298 ) ) ( not ( = ?auto_44292 ?auto_44297 ) ) ( not ( = ?auto_44293 ?auto_44298 ) ) ( not ( = ?auto_44293 ?auto_44297 ) ) ( CLEAR ?auto_44292 ) ( ON ?auto_44293 ?auto_44294 ) ( CLEAR ?auto_44293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44298 ?auto_44297 ?auto_44296 ?auto_44295 ?auto_44294 )
      ( MAKE-4PILE ?auto_44292 ?auto_44293 ?auto_44294 ?auto_44295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44299 - BLOCK
      ?auto_44300 - BLOCK
      ?auto_44301 - BLOCK
      ?auto_44302 - BLOCK
    )
    :vars
    (
      ?auto_44304 - BLOCK
      ?auto_44303 - BLOCK
      ?auto_44305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44299 ?auto_44300 ) ) ( not ( = ?auto_44299 ?auto_44301 ) ) ( not ( = ?auto_44299 ?auto_44302 ) ) ( not ( = ?auto_44300 ?auto_44301 ) ) ( not ( = ?auto_44300 ?auto_44302 ) ) ( not ( = ?auto_44301 ?auto_44302 ) ) ( ON ?auto_44302 ?auto_44304 ) ( not ( = ?auto_44299 ?auto_44304 ) ) ( not ( = ?auto_44300 ?auto_44304 ) ) ( not ( = ?auto_44301 ?auto_44304 ) ) ( not ( = ?auto_44302 ?auto_44304 ) ) ( ON ?auto_44301 ?auto_44302 ) ( ON-TABLE ?auto_44303 ) ( ON ?auto_44305 ?auto_44303 ) ( ON ?auto_44304 ?auto_44305 ) ( not ( = ?auto_44303 ?auto_44305 ) ) ( not ( = ?auto_44303 ?auto_44304 ) ) ( not ( = ?auto_44303 ?auto_44302 ) ) ( not ( = ?auto_44303 ?auto_44301 ) ) ( not ( = ?auto_44305 ?auto_44304 ) ) ( not ( = ?auto_44305 ?auto_44302 ) ) ( not ( = ?auto_44305 ?auto_44301 ) ) ( not ( = ?auto_44299 ?auto_44303 ) ) ( not ( = ?auto_44299 ?auto_44305 ) ) ( not ( = ?auto_44300 ?auto_44303 ) ) ( not ( = ?auto_44300 ?auto_44305 ) ) ( ON ?auto_44300 ?auto_44301 ) ( CLEAR ?auto_44300 ) ( HOLDING ?auto_44299 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44299 )
      ( MAKE-4PILE ?auto_44299 ?auto_44300 ?auto_44301 ?auto_44302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44306 - BLOCK
      ?auto_44307 - BLOCK
      ?auto_44308 - BLOCK
      ?auto_44309 - BLOCK
    )
    :vars
    (
      ?auto_44311 - BLOCK
      ?auto_44312 - BLOCK
      ?auto_44310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44306 ?auto_44307 ) ) ( not ( = ?auto_44306 ?auto_44308 ) ) ( not ( = ?auto_44306 ?auto_44309 ) ) ( not ( = ?auto_44307 ?auto_44308 ) ) ( not ( = ?auto_44307 ?auto_44309 ) ) ( not ( = ?auto_44308 ?auto_44309 ) ) ( ON ?auto_44309 ?auto_44311 ) ( not ( = ?auto_44306 ?auto_44311 ) ) ( not ( = ?auto_44307 ?auto_44311 ) ) ( not ( = ?auto_44308 ?auto_44311 ) ) ( not ( = ?auto_44309 ?auto_44311 ) ) ( ON ?auto_44308 ?auto_44309 ) ( ON-TABLE ?auto_44312 ) ( ON ?auto_44310 ?auto_44312 ) ( ON ?auto_44311 ?auto_44310 ) ( not ( = ?auto_44312 ?auto_44310 ) ) ( not ( = ?auto_44312 ?auto_44311 ) ) ( not ( = ?auto_44312 ?auto_44309 ) ) ( not ( = ?auto_44312 ?auto_44308 ) ) ( not ( = ?auto_44310 ?auto_44311 ) ) ( not ( = ?auto_44310 ?auto_44309 ) ) ( not ( = ?auto_44310 ?auto_44308 ) ) ( not ( = ?auto_44306 ?auto_44312 ) ) ( not ( = ?auto_44306 ?auto_44310 ) ) ( not ( = ?auto_44307 ?auto_44312 ) ) ( not ( = ?auto_44307 ?auto_44310 ) ) ( ON ?auto_44307 ?auto_44308 ) ( ON ?auto_44306 ?auto_44307 ) ( CLEAR ?auto_44306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44312 ?auto_44310 ?auto_44311 ?auto_44309 ?auto_44308 ?auto_44307 )
      ( MAKE-4PILE ?auto_44306 ?auto_44307 ?auto_44308 ?auto_44309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44315 - BLOCK
      ?auto_44316 - BLOCK
    )
    :vars
    (
      ?auto_44317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44317 ?auto_44316 ) ( CLEAR ?auto_44317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44315 ) ( ON ?auto_44316 ?auto_44315 ) ( not ( = ?auto_44315 ?auto_44316 ) ) ( not ( = ?auto_44315 ?auto_44317 ) ) ( not ( = ?auto_44316 ?auto_44317 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44317 ?auto_44316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44318 - BLOCK
      ?auto_44319 - BLOCK
    )
    :vars
    (
      ?auto_44320 - BLOCK
      ?auto_44321 - BLOCK
      ?auto_44322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44320 ?auto_44319 ) ( CLEAR ?auto_44320 ) ( ON-TABLE ?auto_44318 ) ( ON ?auto_44319 ?auto_44318 ) ( not ( = ?auto_44318 ?auto_44319 ) ) ( not ( = ?auto_44318 ?auto_44320 ) ) ( not ( = ?auto_44319 ?auto_44320 ) ) ( HOLDING ?auto_44321 ) ( CLEAR ?auto_44322 ) ( not ( = ?auto_44318 ?auto_44321 ) ) ( not ( = ?auto_44318 ?auto_44322 ) ) ( not ( = ?auto_44319 ?auto_44321 ) ) ( not ( = ?auto_44319 ?auto_44322 ) ) ( not ( = ?auto_44320 ?auto_44321 ) ) ( not ( = ?auto_44320 ?auto_44322 ) ) ( not ( = ?auto_44321 ?auto_44322 ) ) )
    :subtasks
    ( ( !STACK ?auto_44321 ?auto_44322 )
      ( MAKE-2PILE ?auto_44318 ?auto_44319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44323 - BLOCK
      ?auto_44324 - BLOCK
    )
    :vars
    (
      ?auto_44325 - BLOCK
      ?auto_44327 - BLOCK
      ?auto_44326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44325 ?auto_44324 ) ( ON-TABLE ?auto_44323 ) ( ON ?auto_44324 ?auto_44323 ) ( not ( = ?auto_44323 ?auto_44324 ) ) ( not ( = ?auto_44323 ?auto_44325 ) ) ( not ( = ?auto_44324 ?auto_44325 ) ) ( CLEAR ?auto_44327 ) ( not ( = ?auto_44323 ?auto_44326 ) ) ( not ( = ?auto_44323 ?auto_44327 ) ) ( not ( = ?auto_44324 ?auto_44326 ) ) ( not ( = ?auto_44324 ?auto_44327 ) ) ( not ( = ?auto_44325 ?auto_44326 ) ) ( not ( = ?auto_44325 ?auto_44327 ) ) ( not ( = ?auto_44326 ?auto_44327 ) ) ( ON ?auto_44326 ?auto_44325 ) ( CLEAR ?auto_44326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44323 ?auto_44324 ?auto_44325 )
      ( MAKE-2PILE ?auto_44323 ?auto_44324 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44328 - BLOCK
      ?auto_44329 - BLOCK
    )
    :vars
    (
      ?auto_44330 - BLOCK
      ?auto_44332 - BLOCK
      ?auto_44331 - BLOCK
      ?auto_44333 - BLOCK
      ?auto_44334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44330 ?auto_44329 ) ( ON-TABLE ?auto_44328 ) ( ON ?auto_44329 ?auto_44328 ) ( not ( = ?auto_44328 ?auto_44329 ) ) ( not ( = ?auto_44328 ?auto_44330 ) ) ( not ( = ?auto_44329 ?auto_44330 ) ) ( not ( = ?auto_44328 ?auto_44332 ) ) ( not ( = ?auto_44328 ?auto_44331 ) ) ( not ( = ?auto_44329 ?auto_44332 ) ) ( not ( = ?auto_44329 ?auto_44331 ) ) ( not ( = ?auto_44330 ?auto_44332 ) ) ( not ( = ?auto_44330 ?auto_44331 ) ) ( not ( = ?auto_44332 ?auto_44331 ) ) ( ON ?auto_44332 ?auto_44330 ) ( CLEAR ?auto_44332 ) ( HOLDING ?auto_44331 ) ( CLEAR ?auto_44333 ) ( ON-TABLE ?auto_44334 ) ( ON ?auto_44333 ?auto_44334 ) ( not ( = ?auto_44334 ?auto_44333 ) ) ( not ( = ?auto_44334 ?auto_44331 ) ) ( not ( = ?auto_44333 ?auto_44331 ) ) ( not ( = ?auto_44328 ?auto_44333 ) ) ( not ( = ?auto_44328 ?auto_44334 ) ) ( not ( = ?auto_44329 ?auto_44333 ) ) ( not ( = ?auto_44329 ?auto_44334 ) ) ( not ( = ?auto_44330 ?auto_44333 ) ) ( not ( = ?auto_44330 ?auto_44334 ) ) ( not ( = ?auto_44332 ?auto_44333 ) ) ( not ( = ?auto_44332 ?auto_44334 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44334 ?auto_44333 ?auto_44331 )
      ( MAKE-2PILE ?auto_44328 ?auto_44329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44335 - BLOCK
      ?auto_44336 - BLOCK
    )
    :vars
    (
      ?auto_44338 - BLOCK
      ?auto_44339 - BLOCK
      ?auto_44337 - BLOCK
      ?auto_44341 - BLOCK
      ?auto_44340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44338 ?auto_44336 ) ( ON-TABLE ?auto_44335 ) ( ON ?auto_44336 ?auto_44335 ) ( not ( = ?auto_44335 ?auto_44336 ) ) ( not ( = ?auto_44335 ?auto_44338 ) ) ( not ( = ?auto_44336 ?auto_44338 ) ) ( not ( = ?auto_44335 ?auto_44339 ) ) ( not ( = ?auto_44335 ?auto_44337 ) ) ( not ( = ?auto_44336 ?auto_44339 ) ) ( not ( = ?auto_44336 ?auto_44337 ) ) ( not ( = ?auto_44338 ?auto_44339 ) ) ( not ( = ?auto_44338 ?auto_44337 ) ) ( not ( = ?auto_44339 ?auto_44337 ) ) ( ON ?auto_44339 ?auto_44338 ) ( CLEAR ?auto_44341 ) ( ON-TABLE ?auto_44340 ) ( ON ?auto_44341 ?auto_44340 ) ( not ( = ?auto_44340 ?auto_44341 ) ) ( not ( = ?auto_44340 ?auto_44337 ) ) ( not ( = ?auto_44341 ?auto_44337 ) ) ( not ( = ?auto_44335 ?auto_44341 ) ) ( not ( = ?auto_44335 ?auto_44340 ) ) ( not ( = ?auto_44336 ?auto_44341 ) ) ( not ( = ?auto_44336 ?auto_44340 ) ) ( not ( = ?auto_44338 ?auto_44341 ) ) ( not ( = ?auto_44338 ?auto_44340 ) ) ( not ( = ?auto_44339 ?auto_44341 ) ) ( not ( = ?auto_44339 ?auto_44340 ) ) ( ON ?auto_44337 ?auto_44339 ) ( CLEAR ?auto_44337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44335 ?auto_44336 ?auto_44338 ?auto_44339 )
      ( MAKE-2PILE ?auto_44335 ?auto_44336 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44342 - BLOCK
      ?auto_44343 - BLOCK
    )
    :vars
    (
      ?auto_44344 - BLOCK
      ?auto_44345 - BLOCK
      ?auto_44347 - BLOCK
      ?auto_44348 - BLOCK
      ?auto_44346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44344 ?auto_44343 ) ( ON-TABLE ?auto_44342 ) ( ON ?auto_44343 ?auto_44342 ) ( not ( = ?auto_44342 ?auto_44343 ) ) ( not ( = ?auto_44342 ?auto_44344 ) ) ( not ( = ?auto_44343 ?auto_44344 ) ) ( not ( = ?auto_44342 ?auto_44345 ) ) ( not ( = ?auto_44342 ?auto_44347 ) ) ( not ( = ?auto_44343 ?auto_44345 ) ) ( not ( = ?auto_44343 ?auto_44347 ) ) ( not ( = ?auto_44344 ?auto_44345 ) ) ( not ( = ?auto_44344 ?auto_44347 ) ) ( not ( = ?auto_44345 ?auto_44347 ) ) ( ON ?auto_44345 ?auto_44344 ) ( ON-TABLE ?auto_44348 ) ( not ( = ?auto_44348 ?auto_44346 ) ) ( not ( = ?auto_44348 ?auto_44347 ) ) ( not ( = ?auto_44346 ?auto_44347 ) ) ( not ( = ?auto_44342 ?auto_44346 ) ) ( not ( = ?auto_44342 ?auto_44348 ) ) ( not ( = ?auto_44343 ?auto_44346 ) ) ( not ( = ?auto_44343 ?auto_44348 ) ) ( not ( = ?auto_44344 ?auto_44346 ) ) ( not ( = ?auto_44344 ?auto_44348 ) ) ( not ( = ?auto_44345 ?auto_44346 ) ) ( not ( = ?auto_44345 ?auto_44348 ) ) ( ON ?auto_44347 ?auto_44345 ) ( CLEAR ?auto_44347 ) ( HOLDING ?auto_44346 ) ( CLEAR ?auto_44348 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44348 ?auto_44346 )
      ( MAKE-2PILE ?auto_44342 ?auto_44343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45120 - BLOCK
      ?auto_45121 - BLOCK
    )
    :vars
    (
      ?auto_45124 - BLOCK
      ?auto_45122 - BLOCK
      ?auto_45123 - BLOCK
      ?auto_45125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45124 ?auto_45121 ) ( ON-TABLE ?auto_45120 ) ( ON ?auto_45121 ?auto_45120 ) ( not ( = ?auto_45120 ?auto_45121 ) ) ( not ( = ?auto_45120 ?auto_45124 ) ) ( not ( = ?auto_45121 ?auto_45124 ) ) ( not ( = ?auto_45120 ?auto_45122 ) ) ( not ( = ?auto_45120 ?auto_45123 ) ) ( not ( = ?auto_45121 ?auto_45122 ) ) ( not ( = ?auto_45121 ?auto_45123 ) ) ( not ( = ?auto_45124 ?auto_45122 ) ) ( not ( = ?auto_45124 ?auto_45123 ) ) ( not ( = ?auto_45122 ?auto_45123 ) ) ( ON ?auto_45122 ?auto_45124 ) ( not ( = ?auto_45125 ?auto_45123 ) ) ( not ( = ?auto_45120 ?auto_45125 ) ) ( not ( = ?auto_45121 ?auto_45125 ) ) ( not ( = ?auto_45124 ?auto_45125 ) ) ( not ( = ?auto_45122 ?auto_45125 ) ) ( ON ?auto_45123 ?auto_45122 ) ( ON ?auto_45125 ?auto_45123 ) ( CLEAR ?auto_45125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45120 ?auto_45121 ?auto_45124 ?auto_45122 ?auto_45123 )
      ( MAKE-2PILE ?auto_45120 ?auto_45121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44356 - BLOCK
      ?auto_44357 - BLOCK
    )
    :vars
    (
      ?auto_44360 - BLOCK
      ?auto_44359 - BLOCK
      ?auto_44358 - BLOCK
      ?auto_44361 - BLOCK
      ?auto_44362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44360 ?auto_44357 ) ( ON-TABLE ?auto_44356 ) ( ON ?auto_44357 ?auto_44356 ) ( not ( = ?auto_44356 ?auto_44357 ) ) ( not ( = ?auto_44356 ?auto_44360 ) ) ( not ( = ?auto_44357 ?auto_44360 ) ) ( not ( = ?auto_44356 ?auto_44359 ) ) ( not ( = ?auto_44356 ?auto_44358 ) ) ( not ( = ?auto_44357 ?auto_44359 ) ) ( not ( = ?auto_44357 ?auto_44358 ) ) ( not ( = ?auto_44360 ?auto_44359 ) ) ( not ( = ?auto_44360 ?auto_44358 ) ) ( not ( = ?auto_44359 ?auto_44358 ) ) ( ON ?auto_44359 ?auto_44360 ) ( not ( = ?auto_44361 ?auto_44362 ) ) ( not ( = ?auto_44361 ?auto_44358 ) ) ( not ( = ?auto_44362 ?auto_44358 ) ) ( not ( = ?auto_44356 ?auto_44362 ) ) ( not ( = ?auto_44356 ?auto_44361 ) ) ( not ( = ?auto_44357 ?auto_44362 ) ) ( not ( = ?auto_44357 ?auto_44361 ) ) ( not ( = ?auto_44360 ?auto_44362 ) ) ( not ( = ?auto_44360 ?auto_44361 ) ) ( not ( = ?auto_44359 ?auto_44362 ) ) ( not ( = ?auto_44359 ?auto_44361 ) ) ( ON ?auto_44358 ?auto_44359 ) ( ON ?auto_44362 ?auto_44358 ) ( CLEAR ?auto_44362 ) ( HOLDING ?auto_44361 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44361 )
      ( MAKE-2PILE ?auto_44356 ?auto_44357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44363 - BLOCK
      ?auto_44364 - BLOCK
    )
    :vars
    (
      ?auto_44366 - BLOCK
      ?auto_44367 - BLOCK
      ?auto_44368 - BLOCK
      ?auto_44369 - BLOCK
      ?auto_44365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44366 ?auto_44364 ) ( ON-TABLE ?auto_44363 ) ( ON ?auto_44364 ?auto_44363 ) ( not ( = ?auto_44363 ?auto_44364 ) ) ( not ( = ?auto_44363 ?auto_44366 ) ) ( not ( = ?auto_44364 ?auto_44366 ) ) ( not ( = ?auto_44363 ?auto_44367 ) ) ( not ( = ?auto_44363 ?auto_44368 ) ) ( not ( = ?auto_44364 ?auto_44367 ) ) ( not ( = ?auto_44364 ?auto_44368 ) ) ( not ( = ?auto_44366 ?auto_44367 ) ) ( not ( = ?auto_44366 ?auto_44368 ) ) ( not ( = ?auto_44367 ?auto_44368 ) ) ( ON ?auto_44367 ?auto_44366 ) ( not ( = ?auto_44369 ?auto_44365 ) ) ( not ( = ?auto_44369 ?auto_44368 ) ) ( not ( = ?auto_44365 ?auto_44368 ) ) ( not ( = ?auto_44363 ?auto_44365 ) ) ( not ( = ?auto_44363 ?auto_44369 ) ) ( not ( = ?auto_44364 ?auto_44365 ) ) ( not ( = ?auto_44364 ?auto_44369 ) ) ( not ( = ?auto_44366 ?auto_44365 ) ) ( not ( = ?auto_44366 ?auto_44369 ) ) ( not ( = ?auto_44367 ?auto_44365 ) ) ( not ( = ?auto_44367 ?auto_44369 ) ) ( ON ?auto_44368 ?auto_44367 ) ( ON ?auto_44365 ?auto_44368 ) ( ON ?auto_44369 ?auto_44365 ) ( CLEAR ?auto_44369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44363 ?auto_44364 ?auto_44366 ?auto_44367 ?auto_44368 ?auto_44365 )
      ( MAKE-2PILE ?auto_44363 ?auto_44364 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44375 - BLOCK
      ?auto_44376 - BLOCK
      ?auto_44377 - BLOCK
      ?auto_44378 - BLOCK
      ?auto_44379 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44379 ) ( CLEAR ?auto_44378 ) ( ON-TABLE ?auto_44375 ) ( ON ?auto_44376 ?auto_44375 ) ( ON ?auto_44377 ?auto_44376 ) ( ON ?auto_44378 ?auto_44377 ) ( not ( = ?auto_44375 ?auto_44376 ) ) ( not ( = ?auto_44375 ?auto_44377 ) ) ( not ( = ?auto_44375 ?auto_44378 ) ) ( not ( = ?auto_44375 ?auto_44379 ) ) ( not ( = ?auto_44376 ?auto_44377 ) ) ( not ( = ?auto_44376 ?auto_44378 ) ) ( not ( = ?auto_44376 ?auto_44379 ) ) ( not ( = ?auto_44377 ?auto_44378 ) ) ( not ( = ?auto_44377 ?auto_44379 ) ) ( not ( = ?auto_44378 ?auto_44379 ) ) )
    :subtasks
    ( ( !STACK ?auto_44379 ?auto_44378 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44380 - BLOCK
      ?auto_44381 - BLOCK
      ?auto_44382 - BLOCK
      ?auto_44383 - BLOCK
      ?auto_44384 - BLOCK
    )
    :vars
    (
      ?auto_44385 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44383 ) ( ON-TABLE ?auto_44380 ) ( ON ?auto_44381 ?auto_44380 ) ( ON ?auto_44382 ?auto_44381 ) ( ON ?auto_44383 ?auto_44382 ) ( not ( = ?auto_44380 ?auto_44381 ) ) ( not ( = ?auto_44380 ?auto_44382 ) ) ( not ( = ?auto_44380 ?auto_44383 ) ) ( not ( = ?auto_44380 ?auto_44384 ) ) ( not ( = ?auto_44381 ?auto_44382 ) ) ( not ( = ?auto_44381 ?auto_44383 ) ) ( not ( = ?auto_44381 ?auto_44384 ) ) ( not ( = ?auto_44382 ?auto_44383 ) ) ( not ( = ?auto_44382 ?auto_44384 ) ) ( not ( = ?auto_44383 ?auto_44384 ) ) ( ON ?auto_44384 ?auto_44385 ) ( CLEAR ?auto_44384 ) ( HAND-EMPTY ) ( not ( = ?auto_44380 ?auto_44385 ) ) ( not ( = ?auto_44381 ?auto_44385 ) ) ( not ( = ?auto_44382 ?auto_44385 ) ) ( not ( = ?auto_44383 ?auto_44385 ) ) ( not ( = ?auto_44384 ?auto_44385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44384 ?auto_44385 )
      ( MAKE-5PILE ?auto_44380 ?auto_44381 ?auto_44382 ?auto_44383 ?auto_44384 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44386 - BLOCK
      ?auto_44387 - BLOCK
      ?auto_44388 - BLOCK
      ?auto_44389 - BLOCK
      ?auto_44390 - BLOCK
    )
    :vars
    (
      ?auto_44391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44386 ) ( ON ?auto_44387 ?auto_44386 ) ( ON ?auto_44388 ?auto_44387 ) ( not ( = ?auto_44386 ?auto_44387 ) ) ( not ( = ?auto_44386 ?auto_44388 ) ) ( not ( = ?auto_44386 ?auto_44389 ) ) ( not ( = ?auto_44386 ?auto_44390 ) ) ( not ( = ?auto_44387 ?auto_44388 ) ) ( not ( = ?auto_44387 ?auto_44389 ) ) ( not ( = ?auto_44387 ?auto_44390 ) ) ( not ( = ?auto_44388 ?auto_44389 ) ) ( not ( = ?auto_44388 ?auto_44390 ) ) ( not ( = ?auto_44389 ?auto_44390 ) ) ( ON ?auto_44390 ?auto_44391 ) ( CLEAR ?auto_44390 ) ( not ( = ?auto_44386 ?auto_44391 ) ) ( not ( = ?auto_44387 ?auto_44391 ) ) ( not ( = ?auto_44388 ?auto_44391 ) ) ( not ( = ?auto_44389 ?auto_44391 ) ) ( not ( = ?auto_44390 ?auto_44391 ) ) ( HOLDING ?auto_44389 ) ( CLEAR ?auto_44388 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44386 ?auto_44387 ?auto_44388 ?auto_44389 )
      ( MAKE-5PILE ?auto_44386 ?auto_44387 ?auto_44388 ?auto_44389 ?auto_44390 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44392 - BLOCK
      ?auto_44393 - BLOCK
      ?auto_44394 - BLOCK
      ?auto_44395 - BLOCK
      ?auto_44396 - BLOCK
    )
    :vars
    (
      ?auto_44397 - BLOCK
      ?auto_44398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44392 ) ( ON ?auto_44393 ?auto_44392 ) ( ON ?auto_44394 ?auto_44393 ) ( not ( = ?auto_44392 ?auto_44393 ) ) ( not ( = ?auto_44392 ?auto_44394 ) ) ( not ( = ?auto_44392 ?auto_44395 ) ) ( not ( = ?auto_44392 ?auto_44396 ) ) ( not ( = ?auto_44393 ?auto_44394 ) ) ( not ( = ?auto_44393 ?auto_44395 ) ) ( not ( = ?auto_44393 ?auto_44396 ) ) ( not ( = ?auto_44394 ?auto_44395 ) ) ( not ( = ?auto_44394 ?auto_44396 ) ) ( not ( = ?auto_44395 ?auto_44396 ) ) ( ON ?auto_44396 ?auto_44397 ) ( not ( = ?auto_44392 ?auto_44397 ) ) ( not ( = ?auto_44393 ?auto_44397 ) ) ( not ( = ?auto_44394 ?auto_44397 ) ) ( not ( = ?auto_44395 ?auto_44397 ) ) ( not ( = ?auto_44396 ?auto_44397 ) ) ( CLEAR ?auto_44394 ) ( ON ?auto_44395 ?auto_44396 ) ( CLEAR ?auto_44395 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44398 ) ( ON ?auto_44397 ?auto_44398 ) ( not ( = ?auto_44398 ?auto_44397 ) ) ( not ( = ?auto_44398 ?auto_44396 ) ) ( not ( = ?auto_44398 ?auto_44395 ) ) ( not ( = ?auto_44392 ?auto_44398 ) ) ( not ( = ?auto_44393 ?auto_44398 ) ) ( not ( = ?auto_44394 ?auto_44398 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44398 ?auto_44397 ?auto_44396 )
      ( MAKE-5PILE ?auto_44392 ?auto_44393 ?auto_44394 ?auto_44395 ?auto_44396 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44399 - BLOCK
      ?auto_44400 - BLOCK
      ?auto_44401 - BLOCK
      ?auto_44402 - BLOCK
      ?auto_44403 - BLOCK
    )
    :vars
    (
      ?auto_44404 - BLOCK
      ?auto_44405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44399 ) ( ON ?auto_44400 ?auto_44399 ) ( not ( = ?auto_44399 ?auto_44400 ) ) ( not ( = ?auto_44399 ?auto_44401 ) ) ( not ( = ?auto_44399 ?auto_44402 ) ) ( not ( = ?auto_44399 ?auto_44403 ) ) ( not ( = ?auto_44400 ?auto_44401 ) ) ( not ( = ?auto_44400 ?auto_44402 ) ) ( not ( = ?auto_44400 ?auto_44403 ) ) ( not ( = ?auto_44401 ?auto_44402 ) ) ( not ( = ?auto_44401 ?auto_44403 ) ) ( not ( = ?auto_44402 ?auto_44403 ) ) ( ON ?auto_44403 ?auto_44404 ) ( not ( = ?auto_44399 ?auto_44404 ) ) ( not ( = ?auto_44400 ?auto_44404 ) ) ( not ( = ?auto_44401 ?auto_44404 ) ) ( not ( = ?auto_44402 ?auto_44404 ) ) ( not ( = ?auto_44403 ?auto_44404 ) ) ( ON ?auto_44402 ?auto_44403 ) ( CLEAR ?auto_44402 ) ( ON-TABLE ?auto_44405 ) ( ON ?auto_44404 ?auto_44405 ) ( not ( = ?auto_44405 ?auto_44404 ) ) ( not ( = ?auto_44405 ?auto_44403 ) ) ( not ( = ?auto_44405 ?auto_44402 ) ) ( not ( = ?auto_44399 ?auto_44405 ) ) ( not ( = ?auto_44400 ?auto_44405 ) ) ( not ( = ?auto_44401 ?auto_44405 ) ) ( HOLDING ?auto_44401 ) ( CLEAR ?auto_44400 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44399 ?auto_44400 ?auto_44401 )
      ( MAKE-5PILE ?auto_44399 ?auto_44400 ?auto_44401 ?auto_44402 ?auto_44403 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44406 - BLOCK
      ?auto_44407 - BLOCK
      ?auto_44408 - BLOCK
      ?auto_44409 - BLOCK
      ?auto_44410 - BLOCK
    )
    :vars
    (
      ?auto_44411 - BLOCK
      ?auto_44412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44406 ) ( ON ?auto_44407 ?auto_44406 ) ( not ( = ?auto_44406 ?auto_44407 ) ) ( not ( = ?auto_44406 ?auto_44408 ) ) ( not ( = ?auto_44406 ?auto_44409 ) ) ( not ( = ?auto_44406 ?auto_44410 ) ) ( not ( = ?auto_44407 ?auto_44408 ) ) ( not ( = ?auto_44407 ?auto_44409 ) ) ( not ( = ?auto_44407 ?auto_44410 ) ) ( not ( = ?auto_44408 ?auto_44409 ) ) ( not ( = ?auto_44408 ?auto_44410 ) ) ( not ( = ?auto_44409 ?auto_44410 ) ) ( ON ?auto_44410 ?auto_44411 ) ( not ( = ?auto_44406 ?auto_44411 ) ) ( not ( = ?auto_44407 ?auto_44411 ) ) ( not ( = ?auto_44408 ?auto_44411 ) ) ( not ( = ?auto_44409 ?auto_44411 ) ) ( not ( = ?auto_44410 ?auto_44411 ) ) ( ON ?auto_44409 ?auto_44410 ) ( ON-TABLE ?auto_44412 ) ( ON ?auto_44411 ?auto_44412 ) ( not ( = ?auto_44412 ?auto_44411 ) ) ( not ( = ?auto_44412 ?auto_44410 ) ) ( not ( = ?auto_44412 ?auto_44409 ) ) ( not ( = ?auto_44406 ?auto_44412 ) ) ( not ( = ?auto_44407 ?auto_44412 ) ) ( not ( = ?auto_44408 ?auto_44412 ) ) ( CLEAR ?auto_44407 ) ( ON ?auto_44408 ?auto_44409 ) ( CLEAR ?auto_44408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44412 ?auto_44411 ?auto_44410 ?auto_44409 )
      ( MAKE-5PILE ?auto_44406 ?auto_44407 ?auto_44408 ?auto_44409 ?auto_44410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44413 - BLOCK
      ?auto_44414 - BLOCK
      ?auto_44415 - BLOCK
      ?auto_44416 - BLOCK
      ?auto_44417 - BLOCK
    )
    :vars
    (
      ?auto_44419 - BLOCK
      ?auto_44418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44413 ) ( not ( = ?auto_44413 ?auto_44414 ) ) ( not ( = ?auto_44413 ?auto_44415 ) ) ( not ( = ?auto_44413 ?auto_44416 ) ) ( not ( = ?auto_44413 ?auto_44417 ) ) ( not ( = ?auto_44414 ?auto_44415 ) ) ( not ( = ?auto_44414 ?auto_44416 ) ) ( not ( = ?auto_44414 ?auto_44417 ) ) ( not ( = ?auto_44415 ?auto_44416 ) ) ( not ( = ?auto_44415 ?auto_44417 ) ) ( not ( = ?auto_44416 ?auto_44417 ) ) ( ON ?auto_44417 ?auto_44419 ) ( not ( = ?auto_44413 ?auto_44419 ) ) ( not ( = ?auto_44414 ?auto_44419 ) ) ( not ( = ?auto_44415 ?auto_44419 ) ) ( not ( = ?auto_44416 ?auto_44419 ) ) ( not ( = ?auto_44417 ?auto_44419 ) ) ( ON ?auto_44416 ?auto_44417 ) ( ON-TABLE ?auto_44418 ) ( ON ?auto_44419 ?auto_44418 ) ( not ( = ?auto_44418 ?auto_44419 ) ) ( not ( = ?auto_44418 ?auto_44417 ) ) ( not ( = ?auto_44418 ?auto_44416 ) ) ( not ( = ?auto_44413 ?auto_44418 ) ) ( not ( = ?auto_44414 ?auto_44418 ) ) ( not ( = ?auto_44415 ?auto_44418 ) ) ( ON ?auto_44415 ?auto_44416 ) ( CLEAR ?auto_44415 ) ( HOLDING ?auto_44414 ) ( CLEAR ?auto_44413 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44413 ?auto_44414 )
      ( MAKE-5PILE ?auto_44413 ?auto_44414 ?auto_44415 ?auto_44416 ?auto_44417 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44420 - BLOCK
      ?auto_44421 - BLOCK
      ?auto_44422 - BLOCK
      ?auto_44423 - BLOCK
      ?auto_44424 - BLOCK
    )
    :vars
    (
      ?auto_44426 - BLOCK
      ?auto_44425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44420 ) ( not ( = ?auto_44420 ?auto_44421 ) ) ( not ( = ?auto_44420 ?auto_44422 ) ) ( not ( = ?auto_44420 ?auto_44423 ) ) ( not ( = ?auto_44420 ?auto_44424 ) ) ( not ( = ?auto_44421 ?auto_44422 ) ) ( not ( = ?auto_44421 ?auto_44423 ) ) ( not ( = ?auto_44421 ?auto_44424 ) ) ( not ( = ?auto_44422 ?auto_44423 ) ) ( not ( = ?auto_44422 ?auto_44424 ) ) ( not ( = ?auto_44423 ?auto_44424 ) ) ( ON ?auto_44424 ?auto_44426 ) ( not ( = ?auto_44420 ?auto_44426 ) ) ( not ( = ?auto_44421 ?auto_44426 ) ) ( not ( = ?auto_44422 ?auto_44426 ) ) ( not ( = ?auto_44423 ?auto_44426 ) ) ( not ( = ?auto_44424 ?auto_44426 ) ) ( ON ?auto_44423 ?auto_44424 ) ( ON-TABLE ?auto_44425 ) ( ON ?auto_44426 ?auto_44425 ) ( not ( = ?auto_44425 ?auto_44426 ) ) ( not ( = ?auto_44425 ?auto_44424 ) ) ( not ( = ?auto_44425 ?auto_44423 ) ) ( not ( = ?auto_44420 ?auto_44425 ) ) ( not ( = ?auto_44421 ?auto_44425 ) ) ( not ( = ?auto_44422 ?auto_44425 ) ) ( ON ?auto_44422 ?auto_44423 ) ( CLEAR ?auto_44420 ) ( ON ?auto_44421 ?auto_44422 ) ( CLEAR ?auto_44421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44425 ?auto_44426 ?auto_44424 ?auto_44423 ?auto_44422 )
      ( MAKE-5PILE ?auto_44420 ?auto_44421 ?auto_44422 ?auto_44423 ?auto_44424 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44427 - BLOCK
      ?auto_44428 - BLOCK
      ?auto_44429 - BLOCK
      ?auto_44430 - BLOCK
      ?auto_44431 - BLOCK
    )
    :vars
    (
      ?auto_44433 - BLOCK
      ?auto_44432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44427 ?auto_44428 ) ) ( not ( = ?auto_44427 ?auto_44429 ) ) ( not ( = ?auto_44427 ?auto_44430 ) ) ( not ( = ?auto_44427 ?auto_44431 ) ) ( not ( = ?auto_44428 ?auto_44429 ) ) ( not ( = ?auto_44428 ?auto_44430 ) ) ( not ( = ?auto_44428 ?auto_44431 ) ) ( not ( = ?auto_44429 ?auto_44430 ) ) ( not ( = ?auto_44429 ?auto_44431 ) ) ( not ( = ?auto_44430 ?auto_44431 ) ) ( ON ?auto_44431 ?auto_44433 ) ( not ( = ?auto_44427 ?auto_44433 ) ) ( not ( = ?auto_44428 ?auto_44433 ) ) ( not ( = ?auto_44429 ?auto_44433 ) ) ( not ( = ?auto_44430 ?auto_44433 ) ) ( not ( = ?auto_44431 ?auto_44433 ) ) ( ON ?auto_44430 ?auto_44431 ) ( ON-TABLE ?auto_44432 ) ( ON ?auto_44433 ?auto_44432 ) ( not ( = ?auto_44432 ?auto_44433 ) ) ( not ( = ?auto_44432 ?auto_44431 ) ) ( not ( = ?auto_44432 ?auto_44430 ) ) ( not ( = ?auto_44427 ?auto_44432 ) ) ( not ( = ?auto_44428 ?auto_44432 ) ) ( not ( = ?auto_44429 ?auto_44432 ) ) ( ON ?auto_44429 ?auto_44430 ) ( ON ?auto_44428 ?auto_44429 ) ( CLEAR ?auto_44428 ) ( HOLDING ?auto_44427 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44427 )
      ( MAKE-5PILE ?auto_44427 ?auto_44428 ?auto_44429 ?auto_44430 ?auto_44431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44434 - BLOCK
      ?auto_44435 - BLOCK
      ?auto_44436 - BLOCK
      ?auto_44437 - BLOCK
      ?auto_44438 - BLOCK
    )
    :vars
    (
      ?auto_44439 - BLOCK
      ?auto_44440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44434 ?auto_44435 ) ) ( not ( = ?auto_44434 ?auto_44436 ) ) ( not ( = ?auto_44434 ?auto_44437 ) ) ( not ( = ?auto_44434 ?auto_44438 ) ) ( not ( = ?auto_44435 ?auto_44436 ) ) ( not ( = ?auto_44435 ?auto_44437 ) ) ( not ( = ?auto_44435 ?auto_44438 ) ) ( not ( = ?auto_44436 ?auto_44437 ) ) ( not ( = ?auto_44436 ?auto_44438 ) ) ( not ( = ?auto_44437 ?auto_44438 ) ) ( ON ?auto_44438 ?auto_44439 ) ( not ( = ?auto_44434 ?auto_44439 ) ) ( not ( = ?auto_44435 ?auto_44439 ) ) ( not ( = ?auto_44436 ?auto_44439 ) ) ( not ( = ?auto_44437 ?auto_44439 ) ) ( not ( = ?auto_44438 ?auto_44439 ) ) ( ON ?auto_44437 ?auto_44438 ) ( ON-TABLE ?auto_44440 ) ( ON ?auto_44439 ?auto_44440 ) ( not ( = ?auto_44440 ?auto_44439 ) ) ( not ( = ?auto_44440 ?auto_44438 ) ) ( not ( = ?auto_44440 ?auto_44437 ) ) ( not ( = ?auto_44434 ?auto_44440 ) ) ( not ( = ?auto_44435 ?auto_44440 ) ) ( not ( = ?auto_44436 ?auto_44440 ) ) ( ON ?auto_44436 ?auto_44437 ) ( ON ?auto_44435 ?auto_44436 ) ( ON ?auto_44434 ?auto_44435 ) ( CLEAR ?auto_44434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44440 ?auto_44439 ?auto_44438 ?auto_44437 ?auto_44436 ?auto_44435 )
      ( MAKE-5PILE ?auto_44434 ?auto_44435 ?auto_44436 ?auto_44437 ?auto_44438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44442 - BLOCK
    )
    :vars
    (
      ?auto_44443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44443 ?auto_44442 ) ( CLEAR ?auto_44443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44442 ) ( not ( = ?auto_44442 ?auto_44443 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44443 ?auto_44442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44444 - BLOCK
    )
    :vars
    (
      ?auto_44445 - BLOCK
      ?auto_44446 - BLOCK
      ?auto_44447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44445 ?auto_44444 ) ( CLEAR ?auto_44445 ) ( ON-TABLE ?auto_44444 ) ( not ( = ?auto_44444 ?auto_44445 ) ) ( HOLDING ?auto_44446 ) ( CLEAR ?auto_44447 ) ( not ( = ?auto_44444 ?auto_44446 ) ) ( not ( = ?auto_44444 ?auto_44447 ) ) ( not ( = ?auto_44445 ?auto_44446 ) ) ( not ( = ?auto_44445 ?auto_44447 ) ) ( not ( = ?auto_44446 ?auto_44447 ) ) )
    :subtasks
    ( ( !STACK ?auto_44446 ?auto_44447 )
      ( MAKE-1PILE ?auto_44444 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44448 - BLOCK
    )
    :vars
    (
      ?auto_44449 - BLOCK
      ?auto_44451 - BLOCK
      ?auto_44450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44449 ?auto_44448 ) ( ON-TABLE ?auto_44448 ) ( not ( = ?auto_44448 ?auto_44449 ) ) ( CLEAR ?auto_44451 ) ( not ( = ?auto_44448 ?auto_44450 ) ) ( not ( = ?auto_44448 ?auto_44451 ) ) ( not ( = ?auto_44449 ?auto_44450 ) ) ( not ( = ?auto_44449 ?auto_44451 ) ) ( not ( = ?auto_44450 ?auto_44451 ) ) ( ON ?auto_44450 ?auto_44449 ) ( CLEAR ?auto_44450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44448 ?auto_44449 )
      ( MAKE-1PILE ?auto_44448 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44452 - BLOCK
    )
    :vars
    (
      ?auto_44454 - BLOCK
      ?auto_44453 - BLOCK
      ?auto_44455 - BLOCK
      ?auto_44457 - BLOCK
      ?auto_44458 - BLOCK
      ?auto_44456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44454 ?auto_44452 ) ( ON-TABLE ?auto_44452 ) ( not ( = ?auto_44452 ?auto_44454 ) ) ( not ( = ?auto_44452 ?auto_44453 ) ) ( not ( = ?auto_44452 ?auto_44455 ) ) ( not ( = ?auto_44454 ?auto_44453 ) ) ( not ( = ?auto_44454 ?auto_44455 ) ) ( not ( = ?auto_44453 ?auto_44455 ) ) ( ON ?auto_44453 ?auto_44454 ) ( CLEAR ?auto_44453 ) ( HOLDING ?auto_44455 ) ( CLEAR ?auto_44457 ) ( ON-TABLE ?auto_44458 ) ( ON ?auto_44456 ?auto_44458 ) ( ON ?auto_44457 ?auto_44456 ) ( not ( = ?auto_44458 ?auto_44456 ) ) ( not ( = ?auto_44458 ?auto_44457 ) ) ( not ( = ?auto_44458 ?auto_44455 ) ) ( not ( = ?auto_44456 ?auto_44457 ) ) ( not ( = ?auto_44456 ?auto_44455 ) ) ( not ( = ?auto_44457 ?auto_44455 ) ) ( not ( = ?auto_44452 ?auto_44457 ) ) ( not ( = ?auto_44452 ?auto_44458 ) ) ( not ( = ?auto_44452 ?auto_44456 ) ) ( not ( = ?auto_44454 ?auto_44457 ) ) ( not ( = ?auto_44454 ?auto_44458 ) ) ( not ( = ?auto_44454 ?auto_44456 ) ) ( not ( = ?auto_44453 ?auto_44457 ) ) ( not ( = ?auto_44453 ?auto_44458 ) ) ( not ( = ?auto_44453 ?auto_44456 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44458 ?auto_44456 ?auto_44457 ?auto_44455 )
      ( MAKE-1PILE ?auto_44452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44459 - BLOCK
    )
    :vars
    (
      ?auto_44461 - BLOCK
      ?auto_44465 - BLOCK
      ?auto_44460 - BLOCK
      ?auto_44463 - BLOCK
      ?auto_44464 - BLOCK
      ?auto_44462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44461 ?auto_44459 ) ( ON-TABLE ?auto_44459 ) ( not ( = ?auto_44459 ?auto_44461 ) ) ( not ( = ?auto_44459 ?auto_44465 ) ) ( not ( = ?auto_44459 ?auto_44460 ) ) ( not ( = ?auto_44461 ?auto_44465 ) ) ( not ( = ?auto_44461 ?auto_44460 ) ) ( not ( = ?auto_44465 ?auto_44460 ) ) ( ON ?auto_44465 ?auto_44461 ) ( CLEAR ?auto_44463 ) ( ON-TABLE ?auto_44464 ) ( ON ?auto_44462 ?auto_44464 ) ( ON ?auto_44463 ?auto_44462 ) ( not ( = ?auto_44464 ?auto_44462 ) ) ( not ( = ?auto_44464 ?auto_44463 ) ) ( not ( = ?auto_44464 ?auto_44460 ) ) ( not ( = ?auto_44462 ?auto_44463 ) ) ( not ( = ?auto_44462 ?auto_44460 ) ) ( not ( = ?auto_44463 ?auto_44460 ) ) ( not ( = ?auto_44459 ?auto_44463 ) ) ( not ( = ?auto_44459 ?auto_44464 ) ) ( not ( = ?auto_44459 ?auto_44462 ) ) ( not ( = ?auto_44461 ?auto_44463 ) ) ( not ( = ?auto_44461 ?auto_44464 ) ) ( not ( = ?auto_44461 ?auto_44462 ) ) ( not ( = ?auto_44465 ?auto_44463 ) ) ( not ( = ?auto_44465 ?auto_44464 ) ) ( not ( = ?auto_44465 ?auto_44462 ) ) ( ON ?auto_44460 ?auto_44465 ) ( CLEAR ?auto_44460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44459 ?auto_44461 ?auto_44465 )
      ( MAKE-1PILE ?auto_44459 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44466 - BLOCK
    )
    :vars
    (
      ?auto_44472 - BLOCK
      ?auto_44468 - BLOCK
      ?auto_44469 - BLOCK
      ?auto_44471 - BLOCK
      ?auto_44467 - BLOCK
      ?auto_44470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44472 ?auto_44466 ) ( ON-TABLE ?auto_44466 ) ( not ( = ?auto_44466 ?auto_44472 ) ) ( not ( = ?auto_44466 ?auto_44468 ) ) ( not ( = ?auto_44466 ?auto_44469 ) ) ( not ( = ?auto_44472 ?auto_44468 ) ) ( not ( = ?auto_44472 ?auto_44469 ) ) ( not ( = ?auto_44468 ?auto_44469 ) ) ( ON ?auto_44468 ?auto_44472 ) ( ON-TABLE ?auto_44471 ) ( ON ?auto_44467 ?auto_44471 ) ( not ( = ?auto_44471 ?auto_44467 ) ) ( not ( = ?auto_44471 ?auto_44470 ) ) ( not ( = ?auto_44471 ?auto_44469 ) ) ( not ( = ?auto_44467 ?auto_44470 ) ) ( not ( = ?auto_44467 ?auto_44469 ) ) ( not ( = ?auto_44470 ?auto_44469 ) ) ( not ( = ?auto_44466 ?auto_44470 ) ) ( not ( = ?auto_44466 ?auto_44471 ) ) ( not ( = ?auto_44466 ?auto_44467 ) ) ( not ( = ?auto_44472 ?auto_44470 ) ) ( not ( = ?auto_44472 ?auto_44471 ) ) ( not ( = ?auto_44472 ?auto_44467 ) ) ( not ( = ?auto_44468 ?auto_44470 ) ) ( not ( = ?auto_44468 ?auto_44471 ) ) ( not ( = ?auto_44468 ?auto_44467 ) ) ( ON ?auto_44469 ?auto_44468 ) ( CLEAR ?auto_44469 ) ( HOLDING ?auto_44470 ) ( CLEAR ?auto_44467 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44471 ?auto_44467 ?auto_44470 )
      ( MAKE-1PILE ?auto_44466 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44473 - BLOCK
    )
    :vars
    (
      ?auto_44474 - BLOCK
      ?auto_44479 - BLOCK
      ?auto_44478 - BLOCK
      ?auto_44475 - BLOCK
      ?auto_44476 - BLOCK
      ?auto_44477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44474 ?auto_44473 ) ( ON-TABLE ?auto_44473 ) ( not ( = ?auto_44473 ?auto_44474 ) ) ( not ( = ?auto_44473 ?auto_44479 ) ) ( not ( = ?auto_44473 ?auto_44478 ) ) ( not ( = ?auto_44474 ?auto_44479 ) ) ( not ( = ?auto_44474 ?auto_44478 ) ) ( not ( = ?auto_44479 ?auto_44478 ) ) ( ON ?auto_44479 ?auto_44474 ) ( ON-TABLE ?auto_44475 ) ( ON ?auto_44476 ?auto_44475 ) ( not ( = ?auto_44475 ?auto_44476 ) ) ( not ( = ?auto_44475 ?auto_44477 ) ) ( not ( = ?auto_44475 ?auto_44478 ) ) ( not ( = ?auto_44476 ?auto_44477 ) ) ( not ( = ?auto_44476 ?auto_44478 ) ) ( not ( = ?auto_44477 ?auto_44478 ) ) ( not ( = ?auto_44473 ?auto_44477 ) ) ( not ( = ?auto_44473 ?auto_44475 ) ) ( not ( = ?auto_44473 ?auto_44476 ) ) ( not ( = ?auto_44474 ?auto_44477 ) ) ( not ( = ?auto_44474 ?auto_44475 ) ) ( not ( = ?auto_44474 ?auto_44476 ) ) ( not ( = ?auto_44479 ?auto_44477 ) ) ( not ( = ?auto_44479 ?auto_44475 ) ) ( not ( = ?auto_44479 ?auto_44476 ) ) ( ON ?auto_44478 ?auto_44479 ) ( CLEAR ?auto_44476 ) ( ON ?auto_44477 ?auto_44478 ) ( CLEAR ?auto_44477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44473 ?auto_44474 ?auto_44479 ?auto_44478 )
      ( MAKE-1PILE ?auto_44473 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44480 - BLOCK
    )
    :vars
    (
      ?auto_44485 - BLOCK
      ?auto_44481 - BLOCK
      ?auto_44484 - BLOCK
      ?auto_44483 - BLOCK
      ?auto_44482 - BLOCK
      ?auto_44486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44485 ?auto_44480 ) ( ON-TABLE ?auto_44480 ) ( not ( = ?auto_44480 ?auto_44485 ) ) ( not ( = ?auto_44480 ?auto_44481 ) ) ( not ( = ?auto_44480 ?auto_44484 ) ) ( not ( = ?auto_44485 ?auto_44481 ) ) ( not ( = ?auto_44485 ?auto_44484 ) ) ( not ( = ?auto_44481 ?auto_44484 ) ) ( ON ?auto_44481 ?auto_44485 ) ( ON-TABLE ?auto_44483 ) ( not ( = ?auto_44483 ?auto_44482 ) ) ( not ( = ?auto_44483 ?auto_44486 ) ) ( not ( = ?auto_44483 ?auto_44484 ) ) ( not ( = ?auto_44482 ?auto_44486 ) ) ( not ( = ?auto_44482 ?auto_44484 ) ) ( not ( = ?auto_44486 ?auto_44484 ) ) ( not ( = ?auto_44480 ?auto_44486 ) ) ( not ( = ?auto_44480 ?auto_44483 ) ) ( not ( = ?auto_44480 ?auto_44482 ) ) ( not ( = ?auto_44485 ?auto_44486 ) ) ( not ( = ?auto_44485 ?auto_44483 ) ) ( not ( = ?auto_44485 ?auto_44482 ) ) ( not ( = ?auto_44481 ?auto_44486 ) ) ( not ( = ?auto_44481 ?auto_44483 ) ) ( not ( = ?auto_44481 ?auto_44482 ) ) ( ON ?auto_44484 ?auto_44481 ) ( ON ?auto_44486 ?auto_44484 ) ( CLEAR ?auto_44486 ) ( HOLDING ?auto_44482 ) ( CLEAR ?auto_44483 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44483 ?auto_44482 )
      ( MAKE-1PILE ?auto_44480 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45333 - BLOCK
    )
    :vars
    (
      ?auto_45336 - BLOCK
      ?auto_45334 - BLOCK
      ?auto_45338 - BLOCK
      ?auto_45335 - BLOCK
      ?auto_45337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45336 ?auto_45333 ) ( ON-TABLE ?auto_45333 ) ( not ( = ?auto_45333 ?auto_45336 ) ) ( not ( = ?auto_45333 ?auto_45334 ) ) ( not ( = ?auto_45333 ?auto_45338 ) ) ( not ( = ?auto_45336 ?auto_45334 ) ) ( not ( = ?auto_45336 ?auto_45338 ) ) ( not ( = ?auto_45334 ?auto_45338 ) ) ( ON ?auto_45334 ?auto_45336 ) ( not ( = ?auto_45335 ?auto_45337 ) ) ( not ( = ?auto_45335 ?auto_45338 ) ) ( not ( = ?auto_45337 ?auto_45338 ) ) ( not ( = ?auto_45333 ?auto_45337 ) ) ( not ( = ?auto_45333 ?auto_45335 ) ) ( not ( = ?auto_45336 ?auto_45337 ) ) ( not ( = ?auto_45336 ?auto_45335 ) ) ( not ( = ?auto_45334 ?auto_45337 ) ) ( not ( = ?auto_45334 ?auto_45335 ) ) ( ON ?auto_45338 ?auto_45334 ) ( ON ?auto_45337 ?auto_45338 ) ( ON ?auto_45335 ?auto_45337 ) ( CLEAR ?auto_45335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45333 ?auto_45336 ?auto_45334 ?auto_45338 ?auto_45337 )
      ( MAKE-1PILE ?auto_45333 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44494 - BLOCK
    )
    :vars
    (
      ?auto_44497 - BLOCK
      ?auto_44496 - BLOCK
      ?auto_44500 - BLOCK
      ?auto_44495 - BLOCK
      ?auto_44499 - BLOCK
      ?auto_44498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44497 ?auto_44494 ) ( ON-TABLE ?auto_44494 ) ( not ( = ?auto_44494 ?auto_44497 ) ) ( not ( = ?auto_44494 ?auto_44496 ) ) ( not ( = ?auto_44494 ?auto_44500 ) ) ( not ( = ?auto_44497 ?auto_44496 ) ) ( not ( = ?auto_44497 ?auto_44500 ) ) ( not ( = ?auto_44496 ?auto_44500 ) ) ( ON ?auto_44496 ?auto_44497 ) ( not ( = ?auto_44495 ?auto_44499 ) ) ( not ( = ?auto_44495 ?auto_44498 ) ) ( not ( = ?auto_44495 ?auto_44500 ) ) ( not ( = ?auto_44499 ?auto_44498 ) ) ( not ( = ?auto_44499 ?auto_44500 ) ) ( not ( = ?auto_44498 ?auto_44500 ) ) ( not ( = ?auto_44494 ?auto_44498 ) ) ( not ( = ?auto_44494 ?auto_44495 ) ) ( not ( = ?auto_44494 ?auto_44499 ) ) ( not ( = ?auto_44497 ?auto_44498 ) ) ( not ( = ?auto_44497 ?auto_44495 ) ) ( not ( = ?auto_44497 ?auto_44499 ) ) ( not ( = ?auto_44496 ?auto_44498 ) ) ( not ( = ?auto_44496 ?auto_44495 ) ) ( not ( = ?auto_44496 ?auto_44499 ) ) ( ON ?auto_44500 ?auto_44496 ) ( ON ?auto_44498 ?auto_44500 ) ( ON ?auto_44499 ?auto_44498 ) ( CLEAR ?auto_44499 ) ( HOLDING ?auto_44495 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44495 )
      ( MAKE-1PILE ?auto_44494 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44501 - BLOCK
    )
    :vars
    (
      ?auto_44505 - BLOCK
      ?auto_44503 - BLOCK
      ?auto_44504 - BLOCK
      ?auto_44502 - BLOCK
      ?auto_44506 - BLOCK
      ?auto_44507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44505 ?auto_44501 ) ( ON-TABLE ?auto_44501 ) ( not ( = ?auto_44501 ?auto_44505 ) ) ( not ( = ?auto_44501 ?auto_44503 ) ) ( not ( = ?auto_44501 ?auto_44504 ) ) ( not ( = ?auto_44505 ?auto_44503 ) ) ( not ( = ?auto_44505 ?auto_44504 ) ) ( not ( = ?auto_44503 ?auto_44504 ) ) ( ON ?auto_44503 ?auto_44505 ) ( not ( = ?auto_44502 ?auto_44506 ) ) ( not ( = ?auto_44502 ?auto_44507 ) ) ( not ( = ?auto_44502 ?auto_44504 ) ) ( not ( = ?auto_44506 ?auto_44507 ) ) ( not ( = ?auto_44506 ?auto_44504 ) ) ( not ( = ?auto_44507 ?auto_44504 ) ) ( not ( = ?auto_44501 ?auto_44507 ) ) ( not ( = ?auto_44501 ?auto_44502 ) ) ( not ( = ?auto_44501 ?auto_44506 ) ) ( not ( = ?auto_44505 ?auto_44507 ) ) ( not ( = ?auto_44505 ?auto_44502 ) ) ( not ( = ?auto_44505 ?auto_44506 ) ) ( not ( = ?auto_44503 ?auto_44507 ) ) ( not ( = ?auto_44503 ?auto_44502 ) ) ( not ( = ?auto_44503 ?auto_44506 ) ) ( ON ?auto_44504 ?auto_44503 ) ( ON ?auto_44507 ?auto_44504 ) ( ON ?auto_44506 ?auto_44507 ) ( ON ?auto_44502 ?auto_44506 ) ( CLEAR ?auto_44502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44501 ?auto_44505 ?auto_44503 ?auto_44504 ?auto_44507 ?auto_44506 )
      ( MAKE-1PILE ?auto_44501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44514 - BLOCK
      ?auto_44515 - BLOCK
      ?auto_44516 - BLOCK
      ?auto_44517 - BLOCK
      ?auto_44518 - BLOCK
      ?auto_44519 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44519 ) ( CLEAR ?auto_44518 ) ( ON-TABLE ?auto_44514 ) ( ON ?auto_44515 ?auto_44514 ) ( ON ?auto_44516 ?auto_44515 ) ( ON ?auto_44517 ?auto_44516 ) ( ON ?auto_44518 ?auto_44517 ) ( not ( = ?auto_44514 ?auto_44515 ) ) ( not ( = ?auto_44514 ?auto_44516 ) ) ( not ( = ?auto_44514 ?auto_44517 ) ) ( not ( = ?auto_44514 ?auto_44518 ) ) ( not ( = ?auto_44514 ?auto_44519 ) ) ( not ( = ?auto_44515 ?auto_44516 ) ) ( not ( = ?auto_44515 ?auto_44517 ) ) ( not ( = ?auto_44515 ?auto_44518 ) ) ( not ( = ?auto_44515 ?auto_44519 ) ) ( not ( = ?auto_44516 ?auto_44517 ) ) ( not ( = ?auto_44516 ?auto_44518 ) ) ( not ( = ?auto_44516 ?auto_44519 ) ) ( not ( = ?auto_44517 ?auto_44518 ) ) ( not ( = ?auto_44517 ?auto_44519 ) ) ( not ( = ?auto_44518 ?auto_44519 ) ) )
    :subtasks
    ( ( !STACK ?auto_44519 ?auto_44518 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44520 - BLOCK
      ?auto_44521 - BLOCK
      ?auto_44522 - BLOCK
      ?auto_44523 - BLOCK
      ?auto_44524 - BLOCK
      ?auto_44525 - BLOCK
    )
    :vars
    (
      ?auto_44526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44524 ) ( ON-TABLE ?auto_44520 ) ( ON ?auto_44521 ?auto_44520 ) ( ON ?auto_44522 ?auto_44521 ) ( ON ?auto_44523 ?auto_44522 ) ( ON ?auto_44524 ?auto_44523 ) ( not ( = ?auto_44520 ?auto_44521 ) ) ( not ( = ?auto_44520 ?auto_44522 ) ) ( not ( = ?auto_44520 ?auto_44523 ) ) ( not ( = ?auto_44520 ?auto_44524 ) ) ( not ( = ?auto_44520 ?auto_44525 ) ) ( not ( = ?auto_44521 ?auto_44522 ) ) ( not ( = ?auto_44521 ?auto_44523 ) ) ( not ( = ?auto_44521 ?auto_44524 ) ) ( not ( = ?auto_44521 ?auto_44525 ) ) ( not ( = ?auto_44522 ?auto_44523 ) ) ( not ( = ?auto_44522 ?auto_44524 ) ) ( not ( = ?auto_44522 ?auto_44525 ) ) ( not ( = ?auto_44523 ?auto_44524 ) ) ( not ( = ?auto_44523 ?auto_44525 ) ) ( not ( = ?auto_44524 ?auto_44525 ) ) ( ON ?auto_44525 ?auto_44526 ) ( CLEAR ?auto_44525 ) ( HAND-EMPTY ) ( not ( = ?auto_44520 ?auto_44526 ) ) ( not ( = ?auto_44521 ?auto_44526 ) ) ( not ( = ?auto_44522 ?auto_44526 ) ) ( not ( = ?auto_44523 ?auto_44526 ) ) ( not ( = ?auto_44524 ?auto_44526 ) ) ( not ( = ?auto_44525 ?auto_44526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44525 ?auto_44526 )
      ( MAKE-6PILE ?auto_44520 ?auto_44521 ?auto_44522 ?auto_44523 ?auto_44524 ?auto_44525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44527 - BLOCK
      ?auto_44528 - BLOCK
      ?auto_44529 - BLOCK
      ?auto_44530 - BLOCK
      ?auto_44531 - BLOCK
      ?auto_44532 - BLOCK
    )
    :vars
    (
      ?auto_44533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44527 ) ( ON ?auto_44528 ?auto_44527 ) ( ON ?auto_44529 ?auto_44528 ) ( ON ?auto_44530 ?auto_44529 ) ( not ( = ?auto_44527 ?auto_44528 ) ) ( not ( = ?auto_44527 ?auto_44529 ) ) ( not ( = ?auto_44527 ?auto_44530 ) ) ( not ( = ?auto_44527 ?auto_44531 ) ) ( not ( = ?auto_44527 ?auto_44532 ) ) ( not ( = ?auto_44528 ?auto_44529 ) ) ( not ( = ?auto_44528 ?auto_44530 ) ) ( not ( = ?auto_44528 ?auto_44531 ) ) ( not ( = ?auto_44528 ?auto_44532 ) ) ( not ( = ?auto_44529 ?auto_44530 ) ) ( not ( = ?auto_44529 ?auto_44531 ) ) ( not ( = ?auto_44529 ?auto_44532 ) ) ( not ( = ?auto_44530 ?auto_44531 ) ) ( not ( = ?auto_44530 ?auto_44532 ) ) ( not ( = ?auto_44531 ?auto_44532 ) ) ( ON ?auto_44532 ?auto_44533 ) ( CLEAR ?auto_44532 ) ( not ( = ?auto_44527 ?auto_44533 ) ) ( not ( = ?auto_44528 ?auto_44533 ) ) ( not ( = ?auto_44529 ?auto_44533 ) ) ( not ( = ?auto_44530 ?auto_44533 ) ) ( not ( = ?auto_44531 ?auto_44533 ) ) ( not ( = ?auto_44532 ?auto_44533 ) ) ( HOLDING ?auto_44531 ) ( CLEAR ?auto_44530 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44527 ?auto_44528 ?auto_44529 ?auto_44530 ?auto_44531 )
      ( MAKE-6PILE ?auto_44527 ?auto_44528 ?auto_44529 ?auto_44530 ?auto_44531 ?auto_44532 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44534 - BLOCK
      ?auto_44535 - BLOCK
      ?auto_44536 - BLOCK
      ?auto_44537 - BLOCK
      ?auto_44538 - BLOCK
      ?auto_44539 - BLOCK
    )
    :vars
    (
      ?auto_44540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44534 ) ( ON ?auto_44535 ?auto_44534 ) ( ON ?auto_44536 ?auto_44535 ) ( ON ?auto_44537 ?auto_44536 ) ( not ( = ?auto_44534 ?auto_44535 ) ) ( not ( = ?auto_44534 ?auto_44536 ) ) ( not ( = ?auto_44534 ?auto_44537 ) ) ( not ( = ?auto_44534 ?auto_44538 ) ) ( not ( = ?auto_44534 ?auto_44539 ) ) ( not ( = ?auto_44535 ?auto_44536 ) ) ( not ( = ?auto_44535 ?auto_44537 ) ) ( not ( = ?auto_44535 ?auto_44538 ) ) ( not ( = ?auto_44535 ?auto_44539 ) ) ( not ( = ?auto_44536 ?auto_44537 ) ) ( not ( = ?auto_44536 ?auto_44538 ) ) ( not ( = ?auto_44536 ?auto_44539 ) ) ( not ( = ?auto_44537 ?auto_44538 ) ) ( not ( = ?auto_44537 ?auto_44539 ) ) ( not ( = ?auto_44538 ?auto_44539 ) ) ( ON ?auto_44539 ?auto_44540 ) ( not ( = ?auto_44534 ?auto_44540 ) ) ( not ( = ?auto_44535 ?auto_44540 ) ) ( not ( = ?auto_44536 ?auto_44540 ) ) ( not ( = ?auto_44537 ?auto_44540 ) ) ( not ( = ?auto_44538 ?auto_44540 ) ) ( not ( = ?auto_44539 ?auto_44540 ) ) ( CLEAR ?auto_44537 ) ( ON ?auto_44538 ?auto_44539 ) ( CLEAR ?auto_44538 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44540 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44540 ?auto_44539 )
      ( MAKE-6PILE ?auto_44534 ?auto_44535 ?auto_44536 ?auto_44537 ?auto_44538 ?auto_44539 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44541 - BLOCK
      ?auto_44542 - BLOCK
      ?auto_44543 - BLOCK
      ?auto_44544 - BLOCK
      ?auto_44545 - BLOCK
      ?auto_44546 - BLOCK
    )
    :vars
    (
      ?auto_44547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44541 ) ( ON ?auto_44542 ?auto_44541 ) ( ON ?auto_44543 ?auto_44542 ) ( not ( = ?auto_44541 ?auto_44542 ) ) ( not ( = ?auto_44541 ?auto_44543 ) ) ( not ( = ?auto_44541 ?auto_44544 ) ) ( not ( = ?auto_44541 ?auto_44545 ) ) ( not ( = ?auto_44541 ?auto_44546 ) ) ( not ( = ?auto_44542 ?auto_44543 ) ) ( not ( = ?auto_44542 ?auto_44544 ) ) ( not ( = ?auto_44542 ?auto_44545 ) ) ( not ( = ?auto_44542 ?auto_44546 ) ) ( not ( = ?auto_44543 ?auto_44544 ) ) ( not ( = ?auto_44543 ?auto_44545 ) ) ( not ( = ?auto_44543 ?auto_44546 ) ) ( not ( = ?auto_44544 ?auto_44545 ) ) ( not ( = ?auto_44544 ?auto_44546 ) ) ( not ( = ?auto_44545 ?auto_44546 ) ) ( ON ?auto_44546 ?auto_44547 ) ( not ( = ?auto_44541 ?auto_44547 ) ) ( not ( = ?auto_44542 ?auto_44547 ) ) ( not ( = ?auto_44543 ?auto_44547 ) ) ( not ( = ?auto_44544 ?auto_44547 ) ) ( not ( = ?auto_44545 ?auto_44547 ) ) ( not ( = ?auto_44546 ?auto_44547 ) ) ( ON ?auto_44545 ?auto_44546 ) ( CLEAR ?auto_44545 ) ( ON-TABLE ?auto_44547 ) ( HOLDING ?auto_44544 ) ( CLEAR ?auto_44543 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44541 ?auto_44542 ?auto_44543 ?auto_44544 )
      ( MAKE-6PILE ?auto_44541 ?auto_44542 ?auto_44543 ?auto_44544 ?auto_44545 ?auto_44546 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44548 - BLOCK
      ?auto_44549 - BLOCK
      ?auto_44550 - BLOCK
      ?auto_44551 - BLOCK
      ?auto_44552 - BLOCK
      ?auto_44553 - BLOCK
    )
    :vars
    (
      ?auto_44554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44548 ) ( ON ?auto_44549 ?auto_44548 ) ( ON ?auto_44550 ?auto_44549 ) ( not ( = ?auto_44548 ?auto_44549 ) ) ( not ( = ?auto_44548 ?auto_44550 ) ) ( not ( = ?auto_44548 ?auto_44551 ) ) ( not ( = ?auto_44548 ?auto_44552 ) ) ( not ( = ?auto_44548 ?auto_44553 ) ) ( not ( = ?auto_44549 ?auto_44550 ) ) ( not ( = ?auto_44549 ?auto_44551 ) ) ( not ( = ?auto_44549 ?auto_44552 ) ) ( not ( = ?auto_44549 ?auto_44553 ) ) ( not ( = ?auto_44550 ?auto_44551 ) ) ( not ( = ?auto_44550 ?auto_44552 ) ) ( not ( = ?auto_44550 ?auto_44553 ) ) ( not ( = ?auto_44551 ?auto_44552 ) ) ( not ( = ?auto_44551 ?auto_44553 ) ) ( not ( = ?auto_44552 ?auto_44553 ) ) ( ON ?auto_44553 ?auto_44554 ) ( not ( = ?auto_44548 ?auto_44554 ) ) ( not ( = ?auto_44549 ?auto_44554 ) ) ( not ( = ?auto_44550 ?auto_44554 ) ) ( not ( = ?auto_44551 ?auto_44554 ) ) ( not ( = ?auto_44552 ?auto_44554 ) ) ( not ( = ?auto_44553 ?auto_44554 ) ) ( ON ?auto_44552 ?auto_44553 ) ( ON-TABLE ?auto_44554 ) ( CLEAR ?auto_44550 ) ( ON ?auto_44551 ?auto_44552 ) ( CLEAR ?auto_44551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44554 ?auto_44553 ?auto_44552 )
      ( MAKE-6PILE ?auto_44548 ?auto_44549 ?auto_44550 ?auto_44551 ?auto_44552 ?auto_44553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44555 - BLOCK
      ?auto_44556 - BLOCK
      ?auto_44557 - BLOCK
      ?auto_44558 - BLOCK
      ?auto_44559 - BLOCK
      ?auto_44560 - BLOCK
    )
    :vars
    (
      ?auto_44561 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44555 ) ( ON ?auto_44556 ?auto_44555 ) ( not ( = ?auto_44555 ?auto_44556 ) ) ( not ( = ?auto_44555 ?auto_44557 ) ) ( not ( = ?auto_44555 ?auto_44558 ) ) ( not ( = ?auto_44555 ?auto_44559 ) ) ( not ( = ?auto_44555 ?auto_44560 ) ) ( not ( = ?auto_44556 ?auto_44557 ) ) ( not ( = ?auto_44556 ?auto_44558 ) ) ( not ( = ?auto_44556 ?auto_44559 ) ) ( not ( = ?auto_44556 ?auto_44560 ) ) ( not ( = ?auto_44557 ?auto_44558 ) ) ( not ( = ?auto_44557 ?auto_44559 ) ) ( not ( = ?auto_44557 ?auto_44560 ) ) ( not ( = ?auto_44558 ?auto_44559 ) ) ( not ( = ?auto_44558 ?auto_44560 ) ) ( not ( = ?auto_44559 ?auto_44560 ) ) ( ON ?auto_44560 ?auto_44561 ) ( not ( = ?auto_44555 ?auto_44561 ) ) ( not ( = ?auto_44556 ?auto_44561 ) ) ( not ( = ?auto_44557 ?auto_44561 ) ) ( not ( = ?auto_44558 ?auto_44561 ) ) ( not ( = ?auto_44559 ?auto_44561 ) ) ( not ( = ?auto_44560 ?auto_44561 ) ) ( ON ?auto_44559 ?auto_44560 ) ( ON-TABLE ?auto_44561 ) ( ON ?auto_44558 ?auto_44559 ) ( CLEAR ?auto_44558 ) ( HOLDING ?auto_44557 ) ( CLEAR ?auto_44556 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44555 ?auto_44556 ?auto_44557 )
      ( MAKE-6PILE ?auto_44555 ?auto_44556 ?auto_44557 ?auto_44558 ?auto_44559 ?auto_44560 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44562 - BLOCK
      ?auto_44563 - BLOCK
      ?auto_44564 - BLOCK
      ?auto_44565 - BLOCK
      ?auto_44566 - BLOCK
      ?auto_44567 - BLOCK
    )
    :vars
    (
      ?auto_44568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44562 ) ( ON ?auto_44563 ?auto_44562 ) ( not ( = ?auto_44562 ?auto_44563 ) ) ( not ( = ?auto_44562 ?auto_44564 ) ) ( not ( = ?auto_44562 ?auto_44565 ) ) ( not ( = ?auto_44562 ?auto_44566 ) ) ( not ( = ?auto_44562 ?auto_44567 ) ) ( not ( = ?auto_44563 ?auto_44564 ) ) ( not ( = ?auto_44563 ?auto_44565 ) ) ( not ( = ?auto_44563 ?auto_44566 ) ) ( not ( = ?auto_44563 ?auto_44567 ) ) ( not ( = ?auto_44564 ?auto_44565 ) ) ( not ( = ?auto_44564 ?auto_44566 ) ) ( not ( = ?auto_44564 ?auto_44567 ) ) ( not ( = ?auto_44565 ?auto_44566 ) ) ( not ( = ?auto_44565 ?auto_44567 ) ) ( not ( = ?auto_44566 ?auto_44567 ) ) ( ON ?auto_44567 ?auto_44568 ) ( not ( = ?auto_44562 ?auto_44568 ) ) ( not ( = ?auto_44563 ?auto_44568 ) ) ( not ( = ?auto_44564 ?auto_44568 ) ) ( not ( = ?auto_44565 ?auto_44568 ) ) ( not ( = ?auto_44566 ?auto_44568 ) ) ( not ( = ?auto_44567 ?auto_44568 ) ) ( ON ?auto_44566 ?auto_44567 ) ( ON-TABLE ?auto_44568 ) ( ON ?auto_44565 ?auto_44566 ) ( CLEAR ?auto_44563 ) ( ON ?auto_44564 ?auto_44565 ) ( CLEAR ?auto_44564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44568 ?auto_44567 ?auto_44566 ?auto_44565 )
      ( MAKE-6PILE ?auto_44562 ?auto_44563 ?auto_44564 ?auto_44565 ?auto_44566 ?auto_44567 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44569 - BLOCK
      ?auto_44570 - BLOCK
      ?auto_44571 - BLOCK
      ?auto_44572 - BLOCK
      ?auto_44573 - BLOCK
      ?auto_44574 - BLOCK
    )
    :vars
    (
      ?auto_44575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44569 ) ( not ( = ?auto_44569 ?auto_44570 ) ) ( not ( = ?auto_44569 ?auto_44571 ) ) ( not ( = ?auto_44569 ?auto_44572 ) ) ( not ( = ?auto_44569 ?auto_44573 ) ) ( not ( = ?auto_44569 ?auto_44574 ) ) ( not ( = ?auto_44570 ?auto_44571 ) ) ( not ( = ?auto_44570 ?auto_44572 ) ) ( not ( = ?auto_44570 ?auto_44573 ) ) ( not ( = ?auto_44570 ?auto_44574 ) ) ( not ( = ?auto_44571 ?auto_44572 ) ) ( not ( = ?auto_44571 ?auto_44573 ) ) ( not ( = ?auto_44571 ?auto_44574 ) ) ( not ( = ?auto_44572 ?auto_44573 ) ) ( not ( = ?auto_44572 ?auto_44574 ) ) ( not ( = ?auto_44573 ?auto_44574 ) ) ( ON ?auto_44574 ?auto_44575 ) ( not ( = ?auto_44569 ?auto_44575 ) ) ( not ( = ?auto_44570 ?auto_44575 ) ) ( not ( = ?auto_44571 ?auto_44575 ) ) ( not ( = ?auto_44572 ?auto_44575 ) ) ( not ( = ?auto_44573 ?auto_44575 ) ) ( not ( = ?auto_44574 ?auto_44575 ) ) ( ON ?auto_44573 ?auto_44574 ) ( ON-TABLE ?auto_44575 ) ( ON ?auto_44572 ?auto_44573 ) ( ON ?auto_44571 ?auto_44572 ) ( CLEAR ?auto_44571 ) ( HOLDING ?auto_44570 ) ( CLEAR ?auto_44569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44569 ?auto_44570 )
      ( MAKE-6PILE ?auto_44569 ?auto_44570 ?auto_44571 ?auto_44572 ?auto_44573 ?auto_44574 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44576 - BLOCK
      ?auto_44577 - BLOCK
      ?auto_44578 - BLOCK
      ?auto_44579 - BLOCK
      ?auto_44580 - BLOCK
      ?auto_44581 - BLOCK
    )
    :vars
    (
      ?auto_44582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44576 ) ( not ( = ?auto_44576 ?auto_44577 ) ) ( not ( = ?auto_44576 ?auto_44578 ) ) ( not ( = ?auto_44576 ?auto_44579 ) ) ( not ( = ?auto_44576 ?auto_44580 ) ) ( not ( = ?auto_44576 ?auto_44581 ) ) ( not ( = ?auto_44577 ?auto_44578 ) ) ( not ( = ?auto_44577 ?auto_44579 ) ) ( not ( = ?auto_44577 ?auto_44580 ) ) ( not ( = ?auto_44577 ?auto_44581 ) ) ( not ( = ?auto_44578 ?auto_44579 ) ) ( not ( = ?auto_44578 ?auto_44580 ) ) ( not ( = ?auto_44578 ?auto_44581 ) ) ( not ( = ?auto_44579 ?auto_44580 ) ) ( not ( = ?auto_44579 ?auto_44581 ) ) ( not ( = ?auto_44580 ?auto_44581 ) ) ( ON ?auto_44581 ?auto_44582 ) ( not ( = ?auto_44576 ?auto_44582 ) ) ( not ( = ?auto_44577 ?auto_44582 ) ) ( not ( = ?auto_44578 ?auto_44582 ) ) ( not ( = ?auto_44579 ?auto_44582 ) ) ( not ( = ?auto_44580 ?auto_44582 ) ) ( not ( = ?auto_44581 ?auto_44582 ) ) ( ON ?auto_44580 ?auto_44581 ) ( ON-TABLE ?auto_44582 ) ( ON ?auto_44579 ?auto_44580 ) ( ON ?auto_44578 ?auto_44579 ) ( CLEAR ?auto_44576 ) ( ON ?auto_44577 ?auto_44578 ) ( CLEAR ?auto_44577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44582 ?auto_44581 ?auto_44580 ?auto_44579 ?auto_44578 )
      ( MAKE-6PILE ?auto_44576 ?auto_44577 ?auto_44578 ?auto_44579 ?auto_44580 ?auto_44581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44583 - BLOCK
      ?auto_44584 - BLOCK
      ?auto_44585 - BLOCK
      ?auto_44586 - BLOCK
      ?auto_44587 - BLOCK
      ?auto_44588 - BLOCK
    )
    :vars
    (
      ?auto_44589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44583 ?auto_44584 ) ) ( not ( = ?auto_44583 ?auto_44585 ) ) ( not ( = ?auto_44583 ?auto_44586 ) ) ( not ( = ?auto_44583 ?auto_44587 ) ) ( not ( = ?auto_44583 ?auto_44588 ) ) ( not ( = ?auto_44584 ?auto_44585 ) ) ( not ( = ?auto_44584 ?auto_44586 ) ) ( not ( = ?auto_44584 ?auto_44587 ) ) ( not ( = ?auto_44584 ?auto_44588 ) ) ( not ( = ?auto_44585 ?auto_44586 ) ) ( not ( = ?auto_44585 ?auto_44587 ) ) ( not ( = ?auto_44585 ?auto_44588 ) ) ( not ( = ?auto_44586 ?auto_44587 ) ) ( not ( = ?auto_44586 ?auto_44588 ) ) ( not ( = ?auto_44587 ?auto_44588 ) ) ( ON ?auto_44588 ?auto_44589 ) ( not ( = ?auto_44583 ?auto_44589 ) ) ( not ( = ?auto_44584 ?auto_44589 ) ) ( not ( = ?auto_44585 ?auto_44589 ) ) ( not ( = ?auto_44586 ?auto_44589 ) ) ( not ( = ?auto_44587 ?auto_44589 ) ) ( not ( = ?auto_44588 ?auto_44589 ) ) ( ON ?auto_44587 ?auto_44588 ) ( ON-TABLE ?auto_44589 ) ( ON ?auto_44586 ?auto_44587 ) ( ON ?auto_44585 ?auto_44586 ) ( ON ?auto_44584 ?auto_44585 ) ( CLEAR ?auto_44584 ) ( HOLDING ?auto_44583 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44583 )
      ( MAKE-6PILE ?auto_44583 ?auto_44584 ?auto_44585 ?auto_44586 ?auto_44587 ?auto_44588 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44590 - BLOCK
      ?auto_44591 - BLOCK
      ?auto_44592 - BLOCK
      ?auto_44593 - BLOCK
      ?auto_44594 - BLOCK
      ?auto_44595 - BLOCK
    )
    :vars
    (
      ?auto_44596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44590 ?auto_44591 ) ) ( not ( = ?auto_44590 ?auto_44592 ) ) ( not ( = ?auto_44590 ?auto_44593 ) ) ( not ( = ?auto_44590 ?auto_44594 ) ) ( not ( = ?auto_44590 ?auto_44595 ) ) ( not ( = ?auto_44591 ?auto_44592 ) ) ( not ( = ?auto_44591 ?auto_44593 ) ) ( not ( = ?auto_44591 ?auto_44594 ) ) ( not ( = ?auto_44591 ?auto_44595 ) ) ( not ( = ?auto_44592 ?auto_44593 ) ) ( not ( = ?auto_44592 ?auto_44594 ) ) ( not ( = ?auto_44592 ?auto_44595 ) ) ( not ( = ?auto_44593 ?auto_44594 ) ) ( not ( = ?auto_44593 ?auto_44595 ) ) ( not ( = ?auto_44594 ?auto_44595 ) ) ( ON ?auto_44595 ?auto_44596 ) ( not ( = ?auto_44590 ?auto_44596 ) ) ( not ( = ?auto_44591 ?auto_44596 ) ) ( not ( = ?auto_44592 ?auto_44596 ) ) ( not ( = ?auto_44593 ?auto_44596 ) ) ( not ( = ?auto_44594 ?auto_44596 ) ) ( not ( = ?auto_44595 ?auto_44596 ) ) ( ON ?auto_44594 ?auto_44595 ) ( ON-TABLE ?auto_44596 ) ( ON ?auto_44593 ?auto_44594 ) ( ON ?auto_44592 ?auto_44593 ) ( ON ?auto_44591 ?auto_44592 ) ( ON ?auto_44590 ?auto_44591 ) ( CLEAR ?auto_44590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44596 ?auto_44595 ?auto_44594 ?auto_44593 ?auto_44592 ?auto_44591 )
      ( MAKE-6PILE ?auto_44590 ?auto_44591 ?auto_44592 ?auto_44593 ?auto_44594 ?auto_44595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44677 - BLOCK
    )
    :vars
    (
      ?auto_44678 - BLOCK
      ?auto_44679 - BLOCK
      ?auto_44680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44677 ?auto_44678 ) ( CLEAR ?auto_44677 ) ( not ( = ?auto_44677 ?auto_44678 ) ) ( HOLDING ?auto_44679 ) ( CLEAR ?auto_44680 ) ( not ( = ?auto_44677 ?auto_44679 ) ) ( not ( = ?auto_44677 ?auto_44680 ) ) ( not ( = ?auto_44678 ?auto_44679 ) ) ( not ( = ?auto_44678 ?auto_44680 ) ) ( not ( = ?auto_44679 ?auto_44680 ) ) )
    :subtasks
    ( ( !STACK ?auto_44679 ?auto_44680 )
      ( MAKE-1PILE ?auto_44677 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44681 - BLOCK
    )
    :vars
    (
      ?auto_44682 - BLOCK
      ?auto_44683 - BLOCK
      ?auto_44684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44681 ?auto_44682 ) ( not ( = ?auto_44681 ?auto_44682 ) ) ( CLEAR ?auto_44683 ) ( not ( = ?auto_44681 ?auto_44684 ) ) ( not ( = ?auto_44681 ?auto_44683 ) ) ( not ( = ?auto_44682 ?auto_44684 ) ) ( not ( = ?auto_44682 ?auto_44683 ) ) ( not ( = ?auto_44684 ?auto_44683 ) ) ( ON ?auto_44684 ?auto_44681 ) ( CLEAR ?auto_44684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44682 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44682 ?auto_44681 )
      ( MAKE-1PILE ?auto_44681 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44685 - BLOCK
    )
    :vars
    (
      ?auto_44686 - BLOCK
      ?auto_44687 - BLOCK
      ?auto_44688 - BLOCK
      ?auto_44690 - BLOCK
      ?auto_44691 - BLOCK
      ?auto_44689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44685 ?auto_44686 ) ( not ( = ?auto_44685 ?auto_44686 ) ) ( not ( = ?auto_44685 ?auto_44687 ) ) ( not ( = ?auto_44685 ?auto_44688 ) ) ( not ( = ?auto_44686 ?auto_44687 ) ) ( not ( = ?auto_44686 ?auto_44688 ) ) ( not ( = ?auto_44687 ?auto_44688 ) ) ( ON ?auto_44687 ?auto_44685 ) ( CLEAR ?auto_44687 ) ( ON-TABLE ?auto_44686 ) ( HOLDING ?auto_44688 ) ( CLEAR ?auto_44690 ) ( ON-TABLE ?auto_44691 ) ( ON ?auto_44689 ?auto_44691 ) ( ON ?auto_44690 ?auto_44689 ) ( not ( = ?auto_44691 ?auto_44689 ) ) ( not ( = ?auto_44691 ?auto_44690 ) ) ( not ( = ?auto_44691 ?auto_44688 ) ) ( not ( = ?auto_44689 ?auto_44690 ) ) ( not ( = ?auto_44689 ?auto_44688 ) ) ( not ( = ?auto_44690 ?auto_44688 ) ) ( not ( = ?auto_44685 ?auto_44690 ) ) ( not ( = ?auto_44685 ?auto_44691 ) ) ( not ( = ?auto_44685 ?auto_44689 ) ) ( not ( = ?auto_44686 ?auto_44690 ) ) ( not ( = ?auto_44686 ?auto_44691 ) ) ( not ( = ?auto_44686 ?auto_44689 ) ) ( not ( = ?auto_44687 ?auto_44690 ) ) ( not ( = ?auto_44687 ?auto_44691 ) ) ( not ( = ?auto_44687 ?auto_44689 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44691 ?auto_44689 ?auto_44690 ?auto_44688 )
      ( MAKE-1PILE ?auto_44685 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44692 - BLOCK
    )
    :vars
    (
      ?auto_44695 - BLOCK
      ?auto_44697 - BLOCK
      ?auto_44693 - BLOCK
      ?auto_44694 - BLOCK
      ?auto_44698 - BLOCK
      ?auto_44696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44692 ?auto_44695 ) ( not ( = ?auto_44692 ?auto_44695 ) ) ( not ( = ?auto_44692 ?auto_44697 ) ) ( not ( = ?auto_44692 ?auto_44693 ) ) ( not ( = ?auto_44695 ?auto_44697 ) ) ( not ( = ?auto_44695 ?auto_44693 ) ) ( not ( = ?auto_44697 ?auto_44693 ) ) ( ON ?auto_44697 ?auto_44692 ) ( ON-TABLE ?auto_44695 ) ( CLEAR ?auto_44694 ) ( ON-TABLE ?auto_44698 ) ( ON ?auto_44696 ?auto_44698 ) ( ON ?auto_44694 ?auto_44696 ) ( not ( = ?auto_44698 ?auto_44696 ) ) ( not ( = ?auto_44698 ?auto_44694 ) ) ( not ( = ?auto_44698 ?auto_44693 ) ) ( not ( = ?auto_44696 ?auto_44694 ) ) ( not ( = ?auto_44696 ?auto_44693 ) ) ( not ( = ?auto_44694 ?auto_44693 ) ) ( not ( = ?auto_44692 ?auto_44694 ) ) ( not ( = ?auto_44692 ?auto_44698 ) ) ( not ( = ?auto_44692 ?auto_44696 ) ) ( not ( = ?auto_44695 ?auto_44694 ) ) ( not ( = ?auto_44695 ?auto_44698 ) ) ( not ( = ?auto_44695 ?auto_44696 ) ) ( not ( = ?auto_44697 ?auto_44694 ) ) ( not ( = ?auto_44697 ?auto_44698 ) ) ( not ( = ?auto_44697 ?auto_44696 ) ) ( ON ?auto_44693 ?auto_44697 ) ( CLEAR ?auto_44693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44695 ?auto_44692 ?auto_44697 )
      ( MAKE-1PILE ?auto_44692 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44699 - BLOCK
    )
    :vars
    (
      ?auto_44705 - BLOCK
      ?auto_44704 - BLOCK
      ?auto_44700 - BLOCK
      ?auto_44702 - BLOCK
      ?auto_44703 - BLOCK
      ?auto_44701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44699 ?auto_44705 ) ( not ( = ?auto_44699 ?auto_44705 ) ) ( not ( = ?auto_44699 ?auto_44704 ) ) ( not ( = ?auto_44699 ?auto_44700 ) ) ( not ( = ?auto_44705 ?auto_44704 ) ) ( not ( = ?auto_44705 ?auto_44700 ) ) ( not ( = ?auto_44704 ?auto_44700 ) ) ( ON ?auto_44704 ?auto_44699 ) ( ON-TABLE ?auto_44705 ) ( ON-TABLE ?auto_44702 ) ( ON ?auto_44703 ?auto_44702 ) ( not ( = ?auto_44702 ?auto_44703 ) ) ( not ( = ?auto_44702 ?auto_44701 ) ) ( not ( = ?auto_44702 ?auto_44700 ) ) ( not ( = ?auto_44703 ?auto_44701 ) ) ( not ( = ?auto_44703 ?auto_44700 ) ) ( not ( = ?auto_44701 ?auto_44700 ) ) ( not ( = ?auto_44699 ?auto_44701 ) ) ( not ( = ?auto_44699 ?auto_44702 ) ) ( not ( = ?auto_44699 ?auto_44703 ) ) ( not ( = ?auto_44705 ?auto_44701 ) ) ( not ( = ?auto_44705 ?auto_44702 ) ) ( not ( = ?auto_44705 ?auto_44703 ) ) ( not ( = ?auto_44704 ?auto_44701 ) ) ( not ( = ?auto_44704 ?auto_44702 ) ) ( not ( = ?auto_44704 ?auto_44703 ) ) ( ON ?auto_44700 ?auto_44704 ) ( CLEAR ?auto_44700 ) ( HOLDING ?auto_44701 ) ( CLEAR ?auto_44703 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44702 ?auto_44703 ?auto_44701 )
      ( MAKE-1PILE ?auto_44699 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44706 - BLOCK
    )
    :vars
    (
      ?auto_44712 - BLOCK
      ?auto_44710 - BLOCK
      ?auto_44709 - BLOCK
      ?auto_44708 - BLOCK
      ?auto_44707 - BLOCK
      ?auto_44711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44706 ?auto_44712 ) ( not ( = ?auto_44706 ?auto_44712 ) ) ( not ( = ?auto_44706 ?auto_44710 ) ) ( not ( = ?auto_44706 ?auto_44709 ) ) ( not ( = ?auto_44712 ?auto_44710 ) ) ( not ( = ?auto_44712 ?auto_44709 ) ) ( not ( = ?auto_44710 ?auto_44709 ) ) ( ON ?auto_44710 ?auto_44706 ) ( ON-TABLE ?auto_44712 ) ( ON-TABLE ?auto_44708 ) ( ON ?auto_44707 ?auto_44708 ) ( not ( = ?auto_44708 ?auto_44707 ) ) ( not ( = ?auto_44708 ?auto_44711 ) ) ( not ( = ?auto_44708 ?auto_44709 ) ) ( not ( = ?auto_44707 ?auto_44711 ) ) ( not ( = ?auto_44707 ?auto_44709 ) ) ( not ( = ?auto_44711 ?auto_44709 ) ) ( not ( = ?auto_44706 ?auto_44711 ) ) ( not ( = ?auto_44706 ?auto_44708 ) ) ( not ( = ?auto_44706 ?auto_44707 ) ) ( not ( = ?auto_44712 ?auto_44711 ) ) ( not ( = ?auto_44712 ?auto_44708 ) ) ( not ( = ?auto_44712 ?auto_44707 ) ) ( not ( = ?auto_44710 ?auto_44711 ) ) ( not ( = ?auto_44710 ?auto_44708 ) ) ( not ( = ?auto_44710 ?auto_44707 ) ) ( ON ?auto_44709 ?auto_44710 ) ( CLEAR ?auto_44707 ) ( ON ?auto_44711 ?auto_44709 ) ( CLEAR ?auto_44711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44712 ?auto_44706 ?auto_44710 ?auto_44709 )
      ( MAKE-1PILE ?auto_44706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44713 - BLOCK
    )
    :vars
    (
      ?auto_44717 - BLOCK
      ?auto_44719 - BLOCK
      ?auto_44715 - BLOCK
      ?auto_44714 - BLOCK
      ?auto_44718 - BLOCK
      ?auto_44716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44713 ?auto_44717 ) ( not ( = ?auto_44713 ?auto_44717 ) ) ( not ( = ?auto_44713 ?auto_44719 ) ) ( not ( = ?auto_44713 ?auto_44715 ) ) ( not ( = ?auto_44717 ?auto_44719 ) ) ( not ( = ?auto_44717 ?auto_44715 ) ) ( not ( = ?auto_44719 ?auto_44715 ) ) ( ON ?auto_44719 ?auto_44713 ) ( ON-TABLE ?auto_44717 ) ( ON-TABLE ?auto_44714 ) ( not ( = ?auto_44714 ?auto_44718 ) ) ( not ( = ?auto_44714 ?auto_44716 ) ) ( not ( = ?auto_44714 ?auto_44715 ) ) ( not ( = ?auto_44718 ?auto_44716 ) ) ( not ( = ?auto_44718 ?auto_44715 ) ) ( not ( = ?auto_44716 ?auto_44715 ) ) ( not ( = ?auto_44713 ?auto_44716 ) ) ( not ( = ?auto_44713 ?auto_44714 ) ) ( not ( = ?auto_44713 ?auto_44718 ) ) ( not ( = ?auto_44717 ?auto_44716 ) ) ( not ( = ?auto_44717 ?auto_44714 ) ) ( not ( = ?auto_44717 ?auto_44718 ) ) ( not ( = ?auto_44719 ?auto_44716 ) ) ( not ( = ?auto_44719 ?auto_44714 ) ) ( not ( = ?auto_44719 ?auto_44718 ) ) ( ON ?auto_44715 ?auto_44719 ) ( ON ?auto_44716 ?auto_44715 ) ( CLEAR ?auto_44716 ) ( HOLDING ?auto_44718 ) ( CLEAR ?auto_44714 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44714 ?auto_44718 )
      ( MAKE-1PILE ?auto_44713 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44720 - BLOCK
    )
    :vars
    (
      ?auto_44725 - BLOCK
      ?auto_44724 - BLOCK
      ?auto_44723 - BLOCK
      ?auto_44721 - BLOCK
      ?auto_44726 - BLOCK
      ?auto_44722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44720 ?auto_44725 ) ( not ( = ?auto_44720 ?auto_44725 ) ) ( not ( = ?auto_44720 ?auto_44724 ) ) ( not ( = ?auto_44720 ?auto_44723 ) ) ( not ( = ?auto_44725 ?auto_44724 ) ) ( not ( = ?auto_44725 ?auto_44723 ) ) ( not ( = ?auto_44724 ?auto_44723 ) ) ( ON ?auto_44724 ?auto_44720 ) ( ON-TABLE ?auto_44725 ) ( ON-TABLE ?auto_44721 ) ( not ( = ?auto_44721 ?auto_44726 ) ) ( not ( = ?auto_44721 ?auto_44722 ) ) ( not ( = ?auto_44721 ?auto_44723 ) ) ( not ( = ?auto_44726 ?auto_44722 ) ) ( not ( = ?auto_44726 ?auto_44723 ) ) ( not ( = ?auto_44722 ?auto_44723 ) ) ( not ( = ?auto_44720 ?auto_44722 ) ) ( not ( = ?auto_44720 ?auto_44721 ) ) ( not ( = ?auto_44720 ?auto_44726 ) ) ( not ( = ?auto_44725 ?auto_44722 ) ) ( not ( = ?auto_44725 ?auto_44721 ) ) ( not ( = ?auto_44725 ?auto_44726 ) ) ( not ( = ?auto_44724 ?auto_44722 ) ) ( not ( = ?auto_44724 ?auto_44721 ) ) ( not ( = ?auto_44724 ?auto_44726 ) ) ( ON ?auto_44723 ?auto_44724 ) ( ON ?auto_44722 ?auto_44723 ) ( CLEAR ?auto_44721 ) ( ON ?auto_44726 ?auto_44722 ) ( CLEAR ?auto_44726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44725 ?auto_44720 ?auto_44724 ?auto_44723 ?auto_44722 )
      ( MAKE-1PILE ?auto_44720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44727 - BLOCK
    )
    :vars
    (
      ?auto_44728 - BLOCK
      ?auto_44733 - BLOCK
      ?auto_44731 - BLOCK
      ?auto_44730 - BLOCK
      ?auto_44729 - BLOCK
      ?auto_44732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44727 ?auto_44728 ) ( not ( = ?auto_44727 ?auto_44728 ) ) ( not ( = ?auto_44727 ?auto_44733 ) ) ( not ( = ?auto_44727 ?auto_44731 ) ) ( not ( = ?auto_44728 ?auto_44733 ) ) ( not ( = ?auto_44728 ?auto_44731 ) ) ( not ( = ?auto_44733 ?auto_44731 ) ) ( ON ?auto_44733 ?auto_44727 ) ( ON-TABLE ?auto_44728 ) ( not ( = ?auto_44730 ?auto_44729 ) ) ( not ( = ?auto_44730 ?auto_44732 ) ) ( not ( = ?auto_44730 ?auto_44731 ) ) ( not ( = ?auto_44729 ?auto_44732 ) ) ( not ( = ?auto_44729 ?auto_44731 ) ) ( not ( = ?auto_44732 ?auto_44731 ) ) ( not ( = ?auto_44727 ?auto_44732 ) ) ( not ( = ?auto_44727 ?auto_44730 ) ) ( not ( = ?auto_44727 ?auto_44729 ) ) ( not ( = ?auto_44728 ?auto_44732 ) ) ( not ( = ?auto_44728 ?auto_44730 ) ) ( not ( = ?auto_44728 ?auto_44729 ) ) ( not ( = ?auto_44733 ?auto_44732 ) ) ( not ( = ?auto_44733 ?auto_44730 ) ) ( not ( = ?auto_44733 ?auto_44729 ) ) ( ON ?auto_44731 ?auto_44733 ) ( ON ?auto_44732 ?auto_44731 ) ( ON ?auto_44729 ?auto_44732 ) ( CLEAR ?auto_44729 ) ( HOLDING ?auto_44730 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44730 )
      ( MAKE-1PILE ?auto_44727 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44734 - BLOCK
    )
    :vars
    (
      ?auto_44737 - BLOCK
      ?auto_44735 - BLOCK
      ?auto_44740 - BLOCK
      ?auto_44739 - BLOCK
      ?auto_44736 - BLOCK
      ?auto_44738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44734 ?auto_44737 ) ( not ( = ?auto_44734 ?auto_44737 ) ) ( not ( = ?auto_44734 ?auto_44735 ) ) ( not ( = ?auto_44734 ?auto_44740 ) ) ( not ( = ?auto_44737 ?auto_44735 ) ) ( not ( = ?auto_44737 ?auto_44740 ) ) ( not ( = ?auto_44735 ?auto_44740 ) ) ( ON ?auto_44735 ?auto_44734 ) ( ON-TABLE ?auto_44737 ) ( not ( = ?auto_44739 ?auto_44736 ) ) ( not ( = ?auto_44739 ?auto_44738 ) ) ( not ( = ?auto_44739 ?auto_44740 ) ) ( not ( = ?auto_44736 ?auto_44738 ) ) ( not ( = ?auto_44736 ?auto_44740 ) ) ( not ( = ?auto_44738 ?auto_44740 ) ) ( not ( = ?auto_44734 ?auto_44738 ) ) ( not ( = ?auto_44734 ?auto_44739 ) ) ( not ( = ?auto_44734 ?auto_44736 ) ) ( not ( = ?auto_44737 ?auto_44738 ) ) ( not ( = ?auto_44737 ?auto_44739 ) ) ( not ( = ?auto_44737 ?auto_44736 ) ) ( not ( = ?auto_44735 ?auto_44738 ) ) ( not ( = ?auto_44735 ?auto_44739 ) ) ( not ( = ?auto_44735 ?auto_44736 ) ) ( ON ?auto_44740 ?auto_44735 ) ( ON ?auto_44738 ?auto_44740 ) ( ON ?auto_44736 ?auto_44738 ) ( ON ?auto_44739 ?auto_44736 ) ( CLEAR ?auto_44739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44737 ?auto_44734 ?auto_44735 ?auto_44740 ?auto_44738 ?auto_44736 )
      ( MAKE-1PILE ?auto_44734 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44750 - BLOCK
      ?auto_44751 - BLOCK
      ?auto_44752 - BLOCK
      ?auto_44753 - BLOCK
    )
    :vars
    (
      ?auto_44754 - BLOCK
      ?auto_44755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44754 ?auto_44753 ) ( CLEAR ?auto_44754 ) ( ON-TABLE ?auto_44750 ) ( ON ?auto_44751 ?auto_44750 ) ( ON ?auto_44752 ?auto_44751 ) ( ON ?auto_44753 ?auto_44752 ) ( not ( = ?auto_44750 ?auto_44751 ) ) ( not ( = ?auto_44750 ?auto_44752 ) ) ( not ( = ?auto_44750 ?auto_44753 ) ) ( not ( = ?auto_44750 ?auto_44754 ) ) ( not ( = ?auto_44751 ?auto_44752 ) ) ( not ( = ?auto_44751 ?auto_44753 ) ) ( not ( = ?auto_44751 ?auto_44754 ) ) ( not ( = ?auto_44752 ?auto_44753 ) ) ( not ( = ?auto_44752 ?auto_44754 ) ) ( not ( = ?auto_44753 ?auto_44754 ) ) ( HOLDING ?auto_44755 ) ( not ( = ?auto_44750 ?auto_44755 ) ) ( not ( = ?auto_44751 ?auto_44755 ) ) ( not ( = ?auto_44752 ?auto_44755 ) ) ( not ( = ?auto_44753 ?auto_44755 ) ) ( not ( = ?auto_44754 ?auto_44755 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_44755 )
      ( MAKE-4PILE ?auto_44750 ?auto_44751 ?auto_44752 ?auto_44753 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44823 - BLOCK
      ?auto_44824 - BLOCK
    )
    :vars
    (
      ?auto_44825 - BLOCK
      ?auto_44828 - BLOCK
      ?auto_44826 - BLOCK
      ?auto_44827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44823 ?auto_44824 ) ) ( ON ?auto_44824 ?auto_44825 ) ( not ( = ?auto_44823 ?auto_44825 ) ) ( not ( = ?auto_44824 ?auto_44825 ) ) ( ON ?auto_44823 ?auto_44824 ) ( CLEAR ?auto_44823 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44828 ) ( ON ?auto_44826 ?auto_44828 ) ( ON ?auto_44827 ?auto_44826 ) ( ON ?auto_44825 ?auto_44827 ) ( not ( = ?auto_44828 ?auto_44826 ) ) ( not ( = ?auto_44828 ?auto_44827 ) ) ( not ( = ?auto_44828 ?auto_44825 ) ) ( not ( = ?auto_44828 ?auto_44824 ) ) ( not ( = ?auto_44828 ?auto_44823 ) ) ( not ( = ?auto_44826 ?auto_44827 ) ) ( not ( = ?auto_44826 ?auto_44825 ) ) ( not ( = ?auto_44826 ?auto_44824 ) ) ( not ( = ?auto_44826 ?auto_44823 ) ) ( not ( = ?auto_44827 ?auto_44825 ) ) ( not ( = ?auto_44827 ?auto_44824 ) ) ( not ( = ?auto_44827 ?auto_44823 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44828 ?auto_44826 ?auto_44827 ?auto_44825 ?auto_44824 )
      ( MAKE-2PILE ?auto_44823 ?auto_44824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44831 - BLOCK
      ?auto_44832 - BLOCK
    )
    :vars
    (
      ?auto_44833 - BLOCK
      ?auto_44834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44831 ?auto_44832 ) ) ( ON ?auto_44832 ?auto_44833 ) ( CLEAR ?auto_44832 ) ( not ( = ?auto_44831 ?auto_44833 ) ) ( not ( = ?auto_44832 ?auto_44833 ) ) ( ON ?auto_44831 ?auto_44834 ) ( CLEAR ?auto_44831 ) ( HAND-EMPTY ) ( not ( = ?auto_44831 ?auto_44834 ) ) ( not ( = ?auto_44832 ?auto_44834 ) ) ( not ( = ?auto_44833 ?auto_44834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44831 ?auto_44834 )
      ( MAKE-2PILE ?auto_44831 ?auto_44832 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44835 - BLOCK
      ?auto_44836 - BLOCK
    )
    :vars
    (
      ?auto_44838 - BLOCK
      ?auto_44837 - BLOCK
      ?auto_44840 - BLOCK
      ?auto_44841 - BLOCK
      ?auto_44839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44835 ?auto_44836 ) ) ( not ( = ?auto_44835 ?auto_44838 ) ) ( not ( = ?auto_44836 ?auto_44838 ) ) ( ON ?auto_44835 ?auto_44837 ) ( CLEAR ?auto_44835 ) ( not ( = ?auto_44835 ?auto_44837 ) ) ( not ( = ?auto_44836 ?auto_44837 ) ) ( not ( = ?auto_44838 ?auto_44837 ) ) ( HOLDING ?auto_44836 ) ( CLEAR ?auto_44838 ) ( ON-TABLE ?auto_44840 ) ( ON ?auto_44841 ?auto_44840 ) ( ON ?auto_44839 ?auto_44841 ) ( ON ?auto_44838 ?auto_44839 ) ( not ( = ?auto_44840 ?auto_44841 ) ) ( not ( = ?auto_44840 ?auto_44839 ) ) ( not ( = ?auto_44840 ?auto_44838 ) ) ( not ( = ?auto_44840 ?auto_44836 ) ) ( not ( = ?auto_44841 ?auto_44839 ) ) ( not ( = ?auto_44841 ?auto_44838 ) ) ( not ( = ?auto_44841 ?auto_44836 ) ) ( not ( = ?auto_44839 ?auto_44838 ) ) ( not ( = ?auto_44839 ?auto_44836 ) ) ( not ( = ?auto_44835 ?auto_44840 ) ) ( not ( = ?auto_44835 ?auto_44841 ) ) ( not ( = ?auto_44835 ?auto_44839 ) ) ( not ( = ?auto_44837 ?auto_44840 ) ) ( not ( = ?auto_44837 ?auto_44841 ) ) ( not ( = ?auto_44837 ?auto_44839 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44840 ?auto_44841 ?auto_44839 ?auto_44838 ?auto_44836 )
      ( MAKE-2PILE ?auto_44835 ?auto_44836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44842 - BLOCK
      ?auto_44843 - BLOCK
    )
    :vars
    (
      ?auto_44847 - BLOCK
      ?auto_44846 - BLOCK
      ?auto_44844 - BLOCK
      ?auto_44848 - BLOCK
      ?auto_44845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44842 ?auto_44843 ) ) ( not ( = ?auto_44842 ?auto_44847 ) ) ( not ( = ?auto_44843 ?auto_44847 ) ) ( ON ?auto_44842 ?auto_44846 ) ( not ( = ?auto_44842 ?auto_44846 ) ) ( not ( = ?auto_44843 ?auto_44846 ) ) ( not ( = ?auto_44847 ?auto_44846 ) ) ( CLEAR ?auto_44847 ) ( ON-TABLE ?auto_44844 ) ( ON ?auto_44848 ?auto_44844 ) ( ON ?auto_44845 ?auto_44848 ) ( ON ?auto_44847 ?auto_44845 ) ( not ( = ?auto_44844 ?auto_44848 ) ) ( not ( = ?auto_44844 ?auto_44845 ) ) ( not ( = ?auto_44844 ?auto_44847 ) ) ( not ( = ?auto_44844 ?auto_44843 ) ) ( not ( = ?auto_44848 ?auto_44845 ) ) ( not ( = ?auto_44848 ?auto_44847 ) ) ( not ( = ?auto_44848 ?auto_44843 ) ) ( not ( = ?auto_44845 ?auto_44847 ) ) ( not ( = ?auto_44845 ?auto_44843 ) ) ( not ( = ?auto_44842 ?auto_44844 ) ) ( not ( = ?auto_44842 ?auto_44848 ) ) ( not ( = ?auto_44842 ?auto_44845 ) ) ( not ( = ?auto_44846 ?auto_44844 ) ) ( not ( = ?auto_44846 ?auto_44848 ) ) ( not ( = ?auto_44846 ?auto_44845 ) ) ( ON ?auto_44843 ?auto_44842 ) ( CLEAR ?auto_44843 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44846 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44846 ?auto_44842 )
      ( MAKE-2PILE ?auto_44842 ?auto_44843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44849 - BLOCK
      ?auto_44850 - BLOCK
    )
    :vars
    (
      ?auto_44853 - BLOCK
      ?auto_44852 - BLOCK
      ?auto_44851 - BLOCK
      ?auto_44855 - BLOCK
      ?auto_44854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44849 ?auto_44850 ) ) ( not ( = ?auto_44849 ?auto_44853 ) ) ( not ( = ?auto_44850 ?auto_44853 ) ) ( ON ?auto_44849 ?auto_44852 ) ( not ( = ?auto_44849 ?auto_44852 ) ) ( not ( = ?auto_44850 ?auto_44852 ) ) ( not ( = ?auto_44853 ?auto_44852 ) ) ( ON-TABLE ?auto_44851 ) ( ON ?auto_44855 ?auto_44851 ) ( ON ?auto_44854 ?auto_44855 ) ( not ( = ?auto_44851 ?auto_44855 ) ) ( not ( = ?auto_44851 ?auto_44854 ) ) ( not ( = ?auto_44851 ?auto_44853 ) ) ( not ( = ?auto_44851 ?auto_44850 ) ) ( not ( = ?auto_44855 ?auto_44854 ) ) ( not ( = ?auto_44855 ?auto_44853 ) ) ( not ( = ?auto_44855 ?auto_44850 ) ) ( not ( = ?auto_44854 ?auto_44853 ) ) ( not ( = ?auto_44854 ?auto_44850 ) ) ( not ( = ?auto_44849 ?auto_44851 ) ) ( not ( = ?auto_44849 ?auto_44855 ) ) ( not ( = ?auto_44849 ?auto_44854 ) ) ( not ( = ?auto_44852 ?auto_44851 ) ) ( not ( = ?auto_44852 ?auto_44855 ) ) ( not ( = ?auto_44852 ?auto_44854 ) ) ( ON ?auto_44850 ?auto_44849 ) ( CLEAR ?auto_44850 ) ( ON-TABLE ?auto_44852 ) ( HOLDING ?auto_44853 ) ( CLEAR ?auto_44854 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44851 ?auto_44855 ?auto_44854 ?auto_44853 )
      ( MAKE-2PILE ?auto_44849 ?auto_44850 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44856 - BLOCK
      ?auto_44857 - BLOCK
    )
    :vars
    (
      ?auto_44861 - BLOCK
      ?auto_44859 - BLOCK
      ?auto_44860 - BLOCK
      ?auto_44858 - BLOCK
      ?auto_44862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44856 ?auto_44857 ) ) ( not ( = ?auto_44856 ?auto_44861 ) ) ( not ( = ?auto_44857 ?auto_44861 ) ) ( ON ?auto_44856 ?auto_44859 ) ( not ( = ?auto_44856 ?auto_44859 ) ) ( not ( = ?auto_44857 ?auto_44859 ) ) ( not ( = ?auto_44861 ?auto_44859 ) ) ( ON-TABLE ?auto_44860 ) ( ON ?auto_44858 ?auto_44860 ) ( ON ?auto_44862 ?auto_44858 ) ( not ( = ?auto_44860 ?auto_44858 ) ) ( not ( = ?auto_44860 ?auto_44862 ) ) ( not ( = ?auto_44860 ?auto_44861 ) ) ( not ( = ?auto_44860 ?auto_44857 ) ) ( not ( = ?auto_44858 ?auto_44862 ) ) ( not ( = ?auto_44858 ?auto_44861 ) ) ( not ( = ?auto_44858 ?auto_44857 ) ) ( not ( = ?auto_44862 ?auto_44861 ) ) ( not ( = ?auto_44862 ?auto_44857 ) ) ( not ( = ?auto_44856 ?auto_44860 ) ) ( not ( = ?auto_44856 ?auto_44858 ) ) ( not ( = ?auto_44856 ?auto_44862 ) ) ( not ( = ?auto_44859 ?auto_44860 ) ) ( not ( = ?auto_44859 ?auto_44858 ) ) ( not ( = ?auto_44859 ?auto_44862 ) ) ( ON ?auto_44857 ?auto_44856 ) ( ON-TABLE ?auto_44859 ) ( CLEAR ?auto_44862 ) ( ON ?auto_44861 ?auto_44857 ) ( CLEAR ?auto_44861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44859 ?auto_44856 ?auto_44857 )
      ( MAKE-2PILE ?auto_44856 ?auto_44857 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44863 - BLOCK
      ?auto_44864 - BLOCK
    )
    :vars
    (
      ?auto_44869 - BLOCK
      ?auto_44865 - BLOCK
      ?auto_44866 - BLOCK
      ?auto_44867 - BLOCK
      ?auto_44868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44863 ?auto_44864 ) ) ( not ( = ?auto_44863 ?auto_44869 ) ) ( not ( = ?auto_44864 ?auto_44869 ) ) ( ON ?auto_44863 ?auto_44865 ) ( not ( = ?auto_44863 ?auto_44865 ) ) ( not ( = ?auto_44864 ?auto_44865 ) ) ( not ( = ?auto_44869 ?auto_44865 ) ) ( ON-TABLE ?auto_44866 ) ( ON ?auto_44867 ?auto_44866 ) ( not ( = ?auto_44866 ?auto_44867 ) ) ( not ( = ?auto_44866 ?auto_44868 ) ) ( not ( = ?auto_44866 ?auto_44869 ) ) ( not ( = ?auto_44866 ?auto_44864 ) ) ( not ( = ?auto_44867 ?auto_44868 ) ) ( not ( = ?auto_44867 ?auto_44869 ) ) ( not ( = ?auto_44867 ?auto_44864 ) ) ( not ( = ?auto_44868 ?auto_44869 ) ) ( not ( = ?auto_44868 ?auto_44864 ) ) ( not ( = ?auto_44863 ?auto_44866 ) ) ( not ( = ?auto_44863 ?auto_44867 ) ) ( not ( = ?auto_44863 ?auto_44868 ) ) ( not ( = ?auto_44865 ?auto_44866 ) ) ( not ( = ?auto_44865 ?auto_44867 ) ) ( not ( = ?auto_44865 ?auto_44868 ) ) ( ON ?auto_44864 ?auto_44863 ) ( ON-TABLE ?auto_44865 ) ( ON ?auto_44869 ?auto_44864 ) ( CLEAR ?auto_44869 ) ( HOLDING ?auto_44868 ) ( CLEAR ?auto_44867 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44866 ?auto_44867 ?auto_44868 )
      ( MAKE-2PILE ?auto_44863 ?auto_44864 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44870 - BLOCK
      ?auto_44871 - BLOCK
    )
    :vars
    (
      ?auto_44872 - BLOCK
      ?auto_44875 - BLOCK
      ?auto_44874 - BLOCK
      ?auto_44876 - BLOCK
      ?auto_44873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44870 ?auto_44871 ) ) ( not ( = ?auto_44870 ?auto_44872 ) ) ( not ( = ?auto_44871 ?auto_44872 ) ) ( ON ?auto_44870 ?auto_44875 ) ( not ( = ?auto_44870 ?auto_44875 ) ) ( not ( = ?auto_44871 ?auto_44875 ) ) ( not ( = ?auto_44872 ?auto_44875 ) ) ( ON-TABLE ?auto_44874 ) ( ON ?auto_44876 ?auto_44874 ) ( not ( = ?auto_44874 ?auto_44876 ) ) ( not ( = ?auto_44874 ?auto_44873 ) ) ( not ( = ?auto_44874 ?auto_44872 ) ) ( not ( = ?auto_44874 ?auto_44871 ) ) ( not ( = ?auto_44876 ?auto_44873 ) ) ( not ( = ?auto_44876 ?auto_44872 ) ) ( not ( = ?auto_44876 ?auto_44871 ) ) ( not ( = ?auto_44873 ?auto_44872 ) ) ( not ( = ?auto_44873 ?auto_44871 ) ) ( not ( = ?auto_44870 ?auto_44874 ) ) ( not ( = ?auto_44870 ?auto_44876 ) ) ( not ( = ?auto_44870 ?auto_44873 ) ) ( not ( = ?auto_44875 ?auto_44874 ) ) ( not ( = ?auto_44875 ?auto_44876 ) ) ( not ( = ?auto_44875 ?auto_44873 ) ) ( ON ?auto_44871 ?auto_44870 ) ( ON-TABLE ?auto_44875 ) ( ON ?auto_44872 ?auto_44871 ) ( CLEAR ?auto_44876 ) ( ON ?auto_44873 ?auto_44872 ) ( CLEAR ?auto_44873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44875 ?auto_44870 ?auto_44871 ?auto_44872 )
      ( MAKE-2PILE ?auto_44870 ?auto_44871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44877 - BLOCK
      ?auto_44878 - BLOCK
    )
    :vars
    (
      ?auto_44880 - BLOCK
      ?auto_44882 - BLOCK
      ?auto_44883 - BLOCK
      ?auto_44881 - BLOCK
      ?auto_44879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44877 ?auto_44878 ) ) ( not ( = ?auto_44877 ?auto_44880 ) ) ( not ( = ?auto_44878 ?auto_44880 ) ) ( ON ?auto_44877 ?auto_44882 ) ( not ( = ?auto_44877 ?auto_44882 ) ) ( not ( = ?auto_44878 ?auto_44882 ) ) ( not ( = ?auto_44880 ?auto_44882 ) ) ( ON-TABLE ?auto_44883 ) ( not ( = ?auto_44883 ?auto_44881 ) ) ( not ( = ?auto_44883 ?auto_44879 ) ) ( not ( = ?auto_44883 ?auto_44880 ) ) ( not ( = ?auto_44883 ?auto_44878 ) ) ( not ( = ?auto_44881 ?auto_44879 ) ) ( not ( = ?auto_44881 ?auto_44880 ) ) ( not ( = ?auto_44881 ?auto_44878 ) ) ( not ( = ?auto_44879 ?auto_44880 ) ) ( not ( = ?auto_44879 ?auto_44878 ) ) ( not ( = ?auto_44877 ?auto_44883 ) ) ( not ( = ?auto_44877 ?auto_44881 ) ) ( not ( = ?auto_44877 ?auto_44879 ) ) ( not ( = ?auto_44882 ?auto_44883 ) ) ( not ( = ?auto_44882 ?auto_44881 ) ) ( not ( = ?auto_44882 ?auto_44879 ) ) ( ON ?auto_44878 ?auto_44877 ) ( ON-TABLE ?auto_44882 ) ( ON ?auto_44880 ?auto_44878 ) ( ON ?auto_44879 ?auto_44880 ) ( CLEAR ?auto_44879 ) ( HOLDING ?auto_44881 ) ( CLEAR ?auto_44883 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44883 ?auto_44881 )
      ( MAKE-2PILE ?auto_44877 ?auto_44878 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44884 - BLOCK
      ?auto_44885 - BLOCK
    )
    :vars
    (
      ?auto_44890 - BLOCK
      ?auto_44888 - BLOCK
      ?auto_44886 - BLOCK
      ?auto_44889 - BLOCK
      ?auto_44887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44884 ?auto_44885 ) ) ( not ( = ?auto_44884 ?auto_44890 ) ) ( not ( = ?auto_44885 ?auto_44890 ) ) ( ON ?auto_44884 ?auto_44888 ) ( not ( = ?auto_44884 ?auto_44888 ) ) ( not ( = ?auto_44885 ?auto_44888 ) ) ( not ( = ?auto_44890 ?auto_44888 ) ) ( ON-TABLE ?auto_44886 ) ( not ( = ?auto_44886 ?auto_44889 ) ) ( not ( = ?auto_44886 ?auto_44887 ) ) ( not ( = ?auto_44886 ?auto_44890 ) ) ( not ( = ?auto_44886 ?auto_44885 ) ) ( not ( = ?auto_44889 ?auto_44887 ) ) ( not ( = ?auto_44889 ?auto_44890 ) ) ( not ( = ?auto_44889 ?auto_44885 ) ) ( not ( = ?auto_44887 ?auto_44890 ) ) ( not ( = ?auto_44887 ?auto_44885 ) ) ( not ( = ?auto_44884 ?auto_44886 ) ) ( not ( = ?auto_44884 ?auto_44889 ) ) ( not ( = ?auto_44884 ?auto_44887 ) ) ( not ( = ?auto_44888 ?auto_44886 ) ) ( not ( = ?auto_44888 ?auto_44889 ) ) ( not ( = ?auto_44888 ?auto_44887 ) ) ( ON ?auto_44885 ?auto_44884 ) ( ON-TABLE ?auto_44888 ) ( ON ?auto_44890 ?auto_44885 ) ( ON ?auto_44887 ?auto_44890 ) ( CLEAR ?auto_44886 ) ( ON ?auto_44889 ?auto_44887 ) ( CLEAR ?auto_44889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44888 ?auto_44884 ?auto_44885 ?auto_44890 ?auto_44887 )
      ( MAKE-2PILE ?auto_44884 ?auto_44885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44891 - BLOCK
      ?auto_44892 - BLOCK
    )
    :vars
    (
      ?auto_44896 - BLOCK
      ?auto_44894 - BLOCK
      ?auto_44893 - BLOCK
      ?auto_44895 - BLOCK
      ?auto_44897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44891 ?auto_44892 ) ) ( not ( = ?auto_44891 ?auto_44896 ) ) ( not ( = ?auto_44892 ?auto_44896 ) ) ( ON ?auto_44891 ?auto_44894 ) ( not ( = ?auto_44891 ?auto_44894 ) ) ( not ( = ?auto_44892 ?auto_44894 ) ) ( not ( = ?auto_44896 ?auto_44894 ) ) ( not ( = ?auto_44893 ?auto_44895 ) ) ( not ( = ?auto_44893 ?auto_44897 ) ) ( not ( = ?auto_44893 ?auto_44896 ) ) ( not ( = ?auto_44893 ?auto_44892 ) ) ( not ( = ?auto_44895 ?auto_44897 ) ) ( not ( = ?auto_44895 ?auto_44896 ) ) ( not ( = ?auto_44895 ?auto_44892 ) ) ( not ( = ?auto_44897 ?auto_44896 ) ) ( not ( = ?auto_44897 ?auto_44892 ) ) ( not ( = ?auto_44891 ?auto_44893 ) ) ( not ( = ?auto_44891 ?auto_44895 ) ) ( not ( = ?auto_44891 ?auto_44897 ) ) ( not ( = ?auto_44894 ?auto_44893 ) ) ( not ( = ?auto_44894 ?auto_44895 ) ) ( not ( = ?auto_44894 ?auto_44897 ) ) ( ON ?auto_44892 ?auto_44891 ) ( ON-TABLE ?auto_44894 ) ( ON ?auto_44896 ?auto_44892 ) ( ON ?auto_44897 ?auto_44896 ) ( ON ?auto_44895 ?auto_44897 ) ( CLEAR ?auto_44895 ) ( HOLDING ?auto_44893 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44893 )
      ( MAKE-2PILE ?auto_44891 ?auto_44892 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44898 - BLOCK
      ?auto_44899 - BLOCK
    )
    :vars
    (
      ?auto_44901 - BLOCK
      ?auto_44904 - BLOCK
      ?auto_44900 - BLOCK
      ?auto_44903 - BLOCK
      ?auto_44902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44898 ?auto_44899 ) ) ( not ( = ?auto_44898 ?auto_44901 ) ) ( not ( = ?auto_44899 ?auto_44901 ) ) ( ON ?auto_44898 ?auto_44904 ) ( not ( = ?auto_44898 ?auto_44904 ) ) ( not ( = ?auto_44899 ?auto_44904 ) ) ( not ( = ?auto_44901 ?auto_44904 ) ) ( not ( = ?auto_44900 ?auto_44903 ) ) ( not ( = ?auto_44900 ?auto_44902 ) ) ( not ( = ?auto_44900 ?auto_44901 ) ) ( not ( = ?auto_44900 ?auto_44899 ) ) ( not ( = ?auto_44903 ?auto_44902 ) ) ( not ( = ?auto_44903 ?auto_44901 ) ) ( not ( = ?auto_44903 ?auto_44899 ) ) ( not ( = ?auto_44902 ?auto_44901 ) ) ( not ( = ?auto_44902 ?auto_44899 ) ) ( not ( = ?auto_44898 ?auto_44900 ) ) ( not ( = ?auto_44898 ?auto_44903 ) ) ( not ( = ?auto_44898 ?auto_44902 ) ) ( not ( = ?auto_44904 ?auto_44900 ) ) ( not ( = ?auto_44904 ?auto_44903 ) ) ( not ( = ?auto_44904 ?auto_44902 ) ) ( ON ?auto_44899 ?auto_44898 ) ( ON-TABLE ?auto_44904 ) ( ON ?auto_44901 ?auto_44899 ) ( ON ?auto_44902 ?auto_44901 ) ( ON ?auto_44903 ?auto_44902 ) ( ON ?auto_44900 ?auto_44903 ) ( CLEAR ?auto_44900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44904 ?auto_44898 ?auto_44899 ?auto_44901 ?auto_44902 ?auto_44903 )
      ( MAKE-2PILE ?auto_44898 ?auto_44899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44924 - BLOCK
      ?auto_44925 - BLOCK
      ?auto_44926 - BLOCK
    )
    :vars
    (
      ?auto_44928 - BLOCK
      ?auto_44927 - BLOCK
      ?auto_44929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44928 ?auto_44926 ) ( ON-TABLE ?auto_44924 ) ( ON ?auto_44925 ?auto_44924 ) ( ON ?auto_44926 ?auto_44925 ) ( not ( = ?auto_44924 ?auto_44925 ) ) ( not ( = ?auto_44924 ?auto_44926 ) ) ( not ( = ?auto_44924 ?auto_44928 ) ) ( not ( = ?auto_44925 ?auto_44926 ) ) ( not ( = ?auto_44925 ?auto_44928 ) ) ( not ( = ?auto_44926 ?auto_44928 ) ) ( not ( = ?auto_44924 ?auto_44927 ) ) ( not ( = ?auto_44924 ?auto_44929 ) ) ( not ( = ?auto_44925 ?auto_44927 ) ) ( not ( = ?auto_44925 ?auto_44929 ) ) ( not ( = ?auto_44926 ?auto_44927 ) ) ( not ( = ?auto_44926 ?auto_44929 ) ) ( not ( = ?auto_44928 ?auto_44927 ) ) ( not ( = ?auto_44928 ?auto_44929 ) ) ( not ( = ?auto_44927 ?auto_44929 ) ) ( ON ?auto_44927 ?auto_44928 ) ( CLEAR ?auto_44927 ) ( HOLDING ?auto_44929 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44929 )
      ( MAKE-3PILE ?auto_44924 ?auto_44925 ?auto_44926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44989 - BLOCK
      ?auto_44990 - BLOCK
      ?auto_44991 - BLOCK
    )
    :vars
    (
      ?auto_44992 - BLOCK
      ?auto_44993 - BLOCK
      ?auto_44994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44989 ) ( not ( = ?auto_44989 ?auto_44990 ) ) ( not ( = ?auto_44989 ?auto_44991 ) ) ( not ( = ?auto_44990 ?auto_44991 ) ) ( ON ?auto_44991 ?auto_44992 ) ( not ( = ?auto_44989 ?auto_44992 ) ) ( not ( = ?auto_44990 ?auto_44992 ) ) ( not ( = ?auto_44991 ?auto_44992 ) ) ( CLEAR ?auto_44989 ) ( ON ?auto_44990 ?auto_44991 ) ( CLEAR ?auto_44990 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44993 ) ( ON ?auto_44994 ?auto_44993 ) ( ON ?auto_44992 ?auto_44994 ) ( not ( = ?auto_44993 ?auto_44994 ) ) ( not ( = ?auto_44993 ?auto_44992 ) ) ( not ( = ?auto_44993 ?auto_44991 ) ) ( not ( = ?auto_44993 ?auto_44990 ) ) ( not ( = ?auto_44994 ?auto_44992 ) ) ( not ( = ?auto_44994 ?auto_44991 ) ) ( not ( = ?auto_44994 ?auto_44990 ) ) ( not ( = ?auto_44989 ?auto_44993 ) ) ( not ( = ?auto_44989 ?auto_44994 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44993 ?auto_44994 ?auto_44992 ?auto_44991 )
      ( MAKE-3PILE ?auto_44989 ?auto_44990 ?auto_44991 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44995 - BLOCK
      ?auto_44996 - BLOCK
      ?auto_44997 - BLOCK
    )
    :vars
    (
      ?auto_44999 - BLOCK
      ?auto_44998 - BLOCK
      ?auto_45000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44995 ?auto_44996 ) ) ( not ( = ?auto_44995 ?auto_44997 ) ) ( not ( = ?auto_44996 ?auto_44997 ) ) ( ON ?auto_44997 ?auto_44999 ) ( not ( = ?auto_44995 ?auto_44999 ) ) ( not ( = ?auto_44996 ?auto_44999 ) ) ( not ( = ?auto_44997 ?auto_44999 ) ) ( ON ?auto_44996 ?auto_44997 ) ( CLEAR ?auto_44996 ) ( ON-TABLE ?auto_44998 ) ( ON ?auto_45000 ?auto_44998 ) ( ON ?auto_44999 ?auto_45000 ) ( not ( = ?auto_44998 ?auto_45000 ) ) ( not ( = ?auto_44998 ?auto_44999 ) ) ( not ( = ?auto_44998 ?auto_44997 ) ) ( not ( = ?auto_44998 ?auto_44996 ) ) ( not ( = ?auto_45000 ?auto_44999 ) ) ( not ( = ?auto_45000 ?auto_44997 ) ) ( not ( = ?auto_45000 ?auto_44996 ) ) ( not ( = ?auto_44995 ?auto_44998 ) ) ( not ( = ?auto_44995 ?auto_45000 ) ) ( HOLDING ?auto_44995 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44995 )
      ( MAKE-3PILE ?auto_44995 ?auto_44996 ?auto_44997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45001 - BLOCK
      ?auto_45002 - BLOCK
      ?auto_45003 - BLOCK
    )
    :vars
    (
      ?auto_45005 - BLOCK
      ?auto_45004 - BLOCK
      ?auto_45006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45001 ?auto_45002 ) ) ( not ( = ?auto_45001 ?auto_45003 ) ) ( not ( = ?auto_45002 ?auto_45003 ) ) ( ON ?auto_45003 ?auto_45005 ) ( not ( = ?auto_45001 ?auto_45005 ) ) ( not ( = ?auto_45002 ?auto_45005 ) ) ( not ( = ?auto_45003 ?auto_45005 ) ) ( ON ?auto_45002 ?auto_45003 ) ( ON-TABLE ?auto_45004 ) ( ON ?auto_45006 ?auto_45004 ) ( ON ?auto_45005 ?auto_45006 ) ( not ( = ?auto_45004 ?auto_45006 ) ) ( not ( = ?auto_45004 ?auto_45005 ) ) ( not ( = ?auto_45004 ?auto_45003 ) ) ( not ( = ?auto_45004 ?auto_45002 ) ) ( not ( = ?auto_45006 ?auto_45005 ) ) ( not ( = ?auto_45006 ?auto_45003 ) ) ( not ( = ?auto_45006 ?auto_45002 ) ) ( not ( = ?auto_45001 ?auto_45004 ) ) ( not ( = ?auto_45001 ?auto_45006 ) ) ( ON ?auto_45001 ?auto_45002 ) ( CLEAR ?auto_45001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45004 ?auto_45006 ?auto_45005 ?auto_45003 ?auto_45002 )
      ( MAKE-3PILE ?auto_45001 ?auto_45002 ?auto_45003 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45010 - BLOCK
      ?auto_45011 - BLOCK
      ?auto_45012 - BLOCK
    )
    :vars
    (
      ?auto_45015 - BLOCK
      ?auto_45014 - BLOCK
      ?auto_45013 - BLOCK
      ?auto_45016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45010 ?auto_45011 ) ) ( not ( = ?auto_45010 ?auto_45012 ) ) ( not ( = ?auto_45011 ?auto_45012 ) ) ( ON ?auto_45012 ?auto_45015 ) ( not ( = ?auto_45010 ?auto_45015 ) ) ( not ( = ?auto_45011 ?auto_45015 ) ) ( not ( = ?auto_45012 ?auto_45015 ) ) ( ON ?auto_45011 ?auto_45012 ) ( CLEAR ?auto_45011 ) ( ON-TABLE ?auto_45014 ) ( ON ?auto_45013 ?auto_45014 ) ( ON ?auto_45015 ?auto_45013 ) ( not ( = ?auto_45014 ?auto_45013 ) ) ( not ( = ?auto_45014 ?auto_45015 ) ) ( not ( = ?auto_45014 ?auto_45012 ) ) ( not ( = ?auto_45014 ?auto_45011 ) ) ( not ( = ?auto_45013 ?auto_45015 ) ) ( not ( = ?auto_45013 ?auto_45012 ) ) ( not ( = ?auto_45013 ?auto_45011 ) ) ( not ( = ?auto_45010 ?auto_45014 ) ) ( not ( = ?auto_45010 ?auto_45013 ) ) ( ON ?auto_45010 ?auto_45016 ) ( CLEAR ?auto_45010 ) ( HAND-EMPTY ) ( not ( = ?auto_45010 ?auto_45016 ) ) ( not ( = ?auto_45011 ?auto_45016 ) ) ( not ( = ?auto_45012 ?auto_45016 ) ) ( not ( = ?auto_45015 ?auto_45016 ) ) ( not ( = ?auto_45014 ?auto_45016 ) ) ( not ( = ?auto_45013 ?auto_45016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45010 ?auto_45016 )
      ( MAKE-3PILE ?auto_45010 ?auto_45011 ?auto_45012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45017 - BLOCK
      ?auto_45018 - BLOCK
      ?auto_45019 - BLOCK
    )
    :vars
    (
      ?auto_45020 - BLOCK
      ?auto_45023 - BLOCK
      ?auto_45021 - BLOCK
      ?auto_45022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45017 ?auto_45018 ) ) ( not ( = ?auto_45017 ?auto_45019 ) ) ( not ( = ?auto_45018 ?auto_45019 ) ) ( ON ?auto_45019 ?auto_45020 ) ( not ( = ?auto_45017 ?auto_45020 ) ) ( not ( = ?auto_45018 ?auto_45020 ) ) ( not ( = ?auto_45019 ?auto_45020 ) ) ( ON-TABLE ?auto_45023 ) ( ON ?auto_45021 ?auto_45023 ) ( ON ?auto_45020 ?auto_45021 ) ( not ( = ?auto_45023 ?auto_45021 ) ) ( not ( = ?auto_45023 ?auto_45020 ) ) ( not ( = ?auto_45023 ?auto_45019 ) ) ( not ( = ?auto_45023 ?auto_45018 ) ) ( not ( = ?auto_45021 ?auto_45020 ) ) ( not ( = ?auto_45021 ?auto_45019 ) ) ( not ( = ?auto_45021 ?auto_45018 ) ) ( not ( = ?auto_45017 ?auto_45023 ) ) ( not ( = ?auto_45017 ?auto_45021 ) ) ( ON ?auto_45017 ?auto_45022 ) ( CLEAR ?auto_45017 ) ( not ( = ?auto_45017 ?auto_45022 ) ) ( not ( = ?auto_45018 ?auto_45022 ) ) ( not ( = ?auto_45019 ?auto_45022 ) ) ( not ( = ?auto_45020 ?auto_45022 ) ) ( not ( = ?auto_45023 ?auto_45022 ) ) ( not ( = ?auto_45021 ?auto_45022 ) ) ( HOLDING ?auto_45018 ) ( CLEAR ?auto_45019 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45023 ?auto_45021 ?auto_45020 ?auto_45019 ?auto_45018 )
      ( MAKE-3PILE ?auto_45017 ?auto_45018 ?auto_45019 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45024 - BLOCK
      ?auto_45025 - BLOCK
      ?auto_45026 - BLOCK
    )
    :vars
    (
      ?auto_45027 - BLOCK
      ?auto_45029 - BLOCK
      ?auto_45030 - BLOCK
      ?auto_45028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45024 ?auto_45025 ) ) ( not ( = ?auto_45024 ?auto_45026 ) ) ( not ( = ?auto_45025 ?auto_45026 ) ) ( ON ?auto_45026 ?auto_45027 ) ( not ( = ?auto_45024 ?auto_45027 ) ) ( not ( = ?auto_45025 ?auto_45027 ) ) ( not ( = ?auto_45026 ?auto_45027 ) ) ( ON-TABLE ?auto_45029 ) ( ON ?auto_45030 ?auto_45029 ) ( ON ?auto_45027 ?auto_45030 ) ( not ( = ?auto_45029 ?auto_45030 ) ) ( not ( = ?auto_45029 ?auto_45027 ) ) ( not ( = ?auto_45029 ?auto_45026 ) ) ( not ( = ?auto_45029 ?auto_45025 ) ) ( not ( = ?auto_45030 ?auto_45027 ) ) ( not ( = ?auto_45030 ?auto_45026 ) ) ( not ( = ?auto_45030 ?auto_45025 ) ) ( not ( = ?auto_45024 ?auto_45029 ) ) ( not ( = ?auto_45024 ?auto_45030 ) ) ( ON ?auto_45024 ?auto_45028 ) ( not ( = ?auto_45024 ?auto_45028 ) ) ( not ( = ?auto_45025 ?auto_45028 ) ) ( not ( = ?auto_45026 ?auto_45028 ) ) ( not ( = ?auto_45027 ?auto_45028 ) ) ( not ( = ?auto_45029 ?auto_45028 ) ) ( not ( = ?auto_45030 ?auto_45028 ) ) ( CLEAR ?auto_45026 ) ( ON ?auto_45025 ?auto_45024 ) ( CLEAR ?auto_45025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45028 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45028 ?auto_45024 )
      ( MAKE-3PILE ?auto_45024 ?auto_45025 ?auto_45026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45031 - BLOCK
      ?auto_45032 - BLOCK
      ?auto_45033 - BLOCK
    )
    :vars
    (
      ?auto_45034 - BLOCK
      ?auto_45037 - BLOCK
      ?auto_45036 - BLOCK
      ?auto_45035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45031 ?auto_45032 ) ) ( not ( = ?auto_45031 ?auto_45033 ) ) ( not ( = ?auto_45032 ?auto_45033 ) ) ( not ( = ?auto_45031 ?auto_45034 ) ) ( not ( = ?auto_45032 ?auto_45034 ) ) ( not ( = ?auto_45033 ?auto_45034 ) ) ( ON-TABLE ?auto_45037 ) ( ON ?auto_45036 ?auto_45037 ) ( ON ?auto_45034 ?auto_45036 ) ( not ( = ?auto_45037 ?auto_45036 ) ) ( not ( = ?auto_45037 ?auto_45034 ) ) ( not ( = ?auto_45037 ?auto_45033 ) ) ( not ( = ?auto_45037 ?auto_45032 ) ) ( not ( = ?auto_45036 ?auto_45034 ) ) ( not ( = ?auto_45036 ?auto_45033 ) ) ( not ( = ?auto_45036 ?auto_45032 ) ) ( not ( = ?auto_45031 ?auto_45037 ) ) ( not ( = ?auto_45031 ?auto_45036 ) ) ( ON ?auto_45031 ?auto_45035 ) ( not ( = ?auto_45031 ?auto_45035 ) ) ( not ( = ?auto_45032 ?auto_45035 ) ) ( not ( = ?auto_45033 ?auto_45035 ) ) ( not ( = ?auto_45034 ?auto_45035 ) ) ( not ( = ?auto_45037 ?auto_45035 ) ) ( not ( = ?auto_45036 ?auto_45035 ) ) ( ON ?auto_45032 ?auto_45031 ) ( CLEAR ?auto_45032 ) ( ON-TABLE ?auto_45035 ) ( HOLDING ?auto_45033 ) ( CLEAR ?auto_45034 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45037 ?auto_45036 ?auto_45034 ?auto_45033 )
      ( MAKE-3PILE ?auto_45031 ?auto_45032 ?auto_45033 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45038 - BLOCK
      ?auto_45039 - BLOCK
      ?auto_45040 - BLOCK
    )
    :vars
    (
      ?auto_45042 - BLOCK
      ?auto_45043 - BLOCK
      ?auto_45041 - BLOCK
      ?auto_45044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45038 ?auto_45039 ) ) ( not ( = ?auto_45038 ?auto_45040 ) ) ( not ( = ?auto_45039 ?auto_45040 ) ) ( not ( = ?auto_45038 ?auto_45042 ) ) ( not ( = ?auto_45039 ?auto_45042 ) ) ( not ( = ?auto_45040 ?auto_45042 ) ) ( ON-TABLE ?auto_45043 ) ( ON ?auto_45041 ?auto_45043 ) ( ON ?auto_45042 ?auto_45041 ) ( not ( = ?auto_45043 ?auto_45041 ) ) ( not ( = ?auto_45043 ?auto_45042 ) ) ( not ( = ?auto_45043 ?auto_45040 ) ) ( not ( = ?auto_45043 ?auto_45039 ) ) ( not ( = ?auto_45041 ?auto_45042 ) ) ( not ( = ?auto_45041 ?auto_45040 ) ) ( not ( = ?auto_45041 ?auto_45039 ) ) ( not ( = ?auto_45038 ?auto_45043 ) ) ( not ( = ?auto_45038 ?auto_45041 ) ) ( ON ?auto_45038 ?auto_45044 ) ( not ( = ?auto_45038 ?auto_45044 ) ) ( not ( = ?auto_45039 ?auto_45044 ) ) ( not ( = ?auto_45040 ?auto_45044 ) ) ( not ( = ?auto_45042 ?auto_45044 ) ) ( not ( = ?auto_45043 ?auto_45044 ) ) ( not ( = ?auto_45041 ?auto_45044 ) ) ( ON ?auto_45039 ?auto_45038 ) ( ON-TABLE ?auto_45044 ) ( CLEAR ?auto_45042 ) ( ON ?auto_45040 ?auto_45039 ) ( CLEAR ?auto_45040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45044 ?auto_45038 ?auto_45039 )
      ( MAKE-3PILE ?auto_45038 ?auto_45039 ?auto_45040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45045 - BLOCK
      ?auto_45046 - BLOCK
      ?auto_45047 - BLOCK
    )
    :vars
    (
      ?auto_45050 - BLOCK
      ?auto_45049 - BLOCK
      ?auto_45051 - BLOCK
      ?auto_45048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45045 ?auto_45046 ) ) ( not ( = ?auto_45045 ?auto_45047 ) ) ( not ( = ?auto_45046 ?auto_45047 ) ) ( not ( = ?auto_45045 ?auto_45050 ) ) ( not ( = ?auto_45046 ?auto_45050 ) ) ( not ( = ?auto_45047 ?auto_45050 ) ) ( ON-TABLE ?auto_45049 ) ( ON ?auto_45051 ?auto_45049 ) ( not ( = ?auto_45049 ?auto_45051 ) ) ( not ( = ?auto_45049 ?auto_45050 ) ) ( not ( = ?auto_45049 ?auto_45047 ) ) ( not ( = ?auto_45049 ?auto_45046 ) ) ( not ( = ?auto_45051 ?auto_45050 ) ) ( not ( = ?auto_45051 ?auto_45047 ) ) ( not ( = ?auto_45051 ?auto_45046 ) ) ( not ( = ?auto_45045 ?auto_45049 ) ) ( not ( = ?auto_45045 ?auto_45051 ) ) ( ON ?auto_45045 ?auto_45048 ) ( not ( = ?auto_45045 ?auto_45048 ) ) ( not ( = ?auto_45046 ?auto_45048 ) ) ( not ( = ?auto_45047 ?auto_45048 ) ) ( not ( = ?auto_45050 ?auto_45048 ) ) ( not ( = ?auto_45049 ?auto_45048 ) ) ( not ( = ?auto_45051 ?auto_45048 ) ) ( ON ?auto_45046 ?auto_45045 ) ( ON-TABLE ?auto_45048 ) ( ON ?auto_45047 ?auto_45046 ) ( CLEAR ?auto_45047 ) ( HOLDING ?auto_45050 ) ( CLEAR ?auto_45051 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45049 ?auto_45051 ?auto_45050 )
      ( MAKE-3PILE ?auto_45045 ?auto_45046 ?auto_45047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45052 - BLOCK
      ?auto_45053 - BLOCK
      ?auto_45054 - BLOCK
    )
    :vars
    (
      ?auto_45057 - BLOCK
      ?auto_45055 - BLOCK
      ?auto_45056 - BLOCK
      ?auto_45058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45052 ?auto_45053 ) ) ( not ( = ?auto_45052 ?auto_45054 ) ) ( not ( = ?auto_45053 ?auto_45054 ) ) ( not ( = ?auto_45052 ?auto_45057 ) ) ( not ( = ?auto_45053 ?auto_45057 ) ) ( not ( = ?auto_45054 ?auto_45057 ) ) ( ON-TABLE ?auto_45055 ) ( ON ?auto_45056 ?auto_45055 ) ( not ( = ?auto_45055 ?auto_45056 ) ) ( not ( = ?auto_45055 ?auto_45057 ) ) ( not ( = ?auto_45055 ?auto_45054 ) ) ( not ( = ?auto_45055 ?auto_45053 ) ) ( not ( = ?auto_45056 ?auto_45057 ) ) ( not ( = ?auto_45056 ?auto_45054 ) ) ( not ( = ?auto_45056 ?auto_45053 ) ) ( not ( = ?auto_45052 ?auto_45055 ) ) ( not ( = ?auto_45052 ?auto_45056 ) ) ( ON ?auto_45052 ?auto_45058 ) ( not ( = ?auto_45052 ?auto_45058 ) ) ( not ( = ?auto_45053 ?auto_45058 ) ) ( not ( = ?auto_45054 ?auto_45058 ) ) ( not ( = ?auto_45057 ?auto_45058 ) ) ( not ( = ?auto_45055 ?auto_45058 ) ) ( not ( = ?auto_45056 ?auto_45058 ) ) ( ON ?auto_45053 ?auto_45052 ) ( ON-TABLE ?auto_45058 ) ( ON ?auto_45054 ?auto_45053 ) ( CLEAR ?auto_45056 ) ( ON ?auto_45057 ?auto_45054 ) ( CLEAR ?auto_45057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45058 ?auto_45052 ?auto_45053 ?auto_45054 )
      ( MAKE-3PILE ?auto_45052 ?auto_45053 ?auto_45054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45059 - BLOCK
      ?auto_45060 - BLOCK
      ?auto_45061 - BLOCK
    )
    :vars
    (
      ?auto_45063 - BLOCK
      ?auto_45065 - BLOCK
      ?auto_45062 - BLOCK
      ?auto_45064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45059 ?auto_45060 ) ) ( not ( = ?auto_45059 ?auto_45061 ) ) ( not ( = ?auto_45060 ?auto_45061 ) ) ( not ( = ?auto_45059 ?auto_45063 ) ) ( not ( = ?auto_45060 ?auto_45063 ) ) ( not ( = ?auto_45061 ?auto_45063 ) ) ( ON-TABLE ?auto_45065 ) ( not ( = ?auto_45065 ?auto_45062 ) ) ( not ( = ?auto_45065 ?auto_45063 ) ) ( not ( = ?auto_45065 ?auto_45061 ) ) ( not ( = ?auto_45065 ?auto_45060 ) ) ( not ( = ?auto_45062 ?auto_45063 ) ) ( not ( = ?auto_45062 ?auto_45061 ) ) ( not ( = ?auto_45062 ?auto_45060 ) ) ( not ( = ?auto_45059 ?auto_45065 ) ) ( not ( = ?auto_45059 ?auto_45062 ) ) ( ON ?auto_45059 ?auto_45064 ) ( not ( = ?auto_45059 ?auto_45064 ) ) ( not ( = ?auto_45060 ?auto_45064 ) ) ( not ( = ?auto_45061 ?auto_45064 ) ) ( not ( = ?auto_45063 ?auto_45064 ) ) ( not ( = ?auto_45065 ?auto_45064 ) ) ( not ( = ?auto_45062 ?auto_45064 ) ) ( ON ?auto_45060 ?auto_45059 ) ( ON-TABLE ?auto_45064 ) ( ON ?auto_45061 ?auto_45060 ) ( ON ?auto_45063 ?auto_45061 ) ( CLEAR ?auto_45063 ) ( HOLDING ?auto_45062 ) ( CLEAR ?auto_45065 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45065 ?auto_45062 )
      ( MAKE-3PILE ?auto_45059 ?auto_45060 ?auto_45061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45066 - BLOCK
      ?auto_45067 - BLOCK
      ?auto_45068 - BLOCK
    )
    :vars
    (
      ?auto_45072 - BLOCK
      ?auto_45071 - BLOCK
      ?auto_45070 - BLOCK
      ?auto_45069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45066 ?auto_45067 ) ) ( not ( = ?auto_45066 ?auto_45068 ) ) ( not ( = ?auto_45067 ?auto_45068 ) ) ( not ( = ?auto_45066 ?auto_45072 ) ) ( not ( = ?auto_45067 ?auto_45072 ) ) ( not ( = ?auto_45068 ?auto_45072 ) ) ( ON-TABLE ?auto_45071 ) ( not ( = ?auto_45071 ?auto_45070 ) ) ( not ( = ?auto_45071 ?auto_45072 ) ) ( not ( = ?auto_45071 ?auto_45068 ) ) ( not ( = ?auto_45071 ?auto_45067 ) ) ( not ( = ?auto_45070 ?auto_45072 ) ) ( not ( = ?auto_45070 ?auto_45068 ) ) ( not ( = ?auto_45070 ?auto_45067 ) ) ( not ( = ?auto_45066 ?auto_45071 ) ) ( not ( = ?auto_45066 ?auto_45070 ) ) ( ON ?auto_45066 ?auto_45069 ) ( not ( = ?auto_45066 ?auto_45069 ) ) ( not ( = ?auto_45067 ?auto_45069 ) ) ( not ( = ?auto_45068 ?auto_45069 ) ) ( not ( = ?auto_45072 ?auto_45069 ) ) ( not ( = ?auto_45071 ?auto_45069 ) ) ( not ( = ?auto_45070 ?auto_45069 ) ) ( ON ?auto_45067 ?auto_45066 ) ( ON-TABLE ?auto_45069 ) ( ON ?auto_45068 ?auto_45067 ) ( ON ?auto_45072 ?auto_45068 ) ( CLEAR ?auto_45071 ) ( ON ?auto_45070 ?auto_45072 ) ( CLEAR ?auto_45070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45069 ?auto_45066 ?auto_45067 ?auto_45068 ?auto_45072 )
      ( MAKE-3PILE ?auto_45066 ?auto_45067 ?auto_45068 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45073 - BLOCK
      ?auto_45074 - BLOCK
      ?auto_45075 - BLOCK
    )
    :vars
    (
      ?auto_45076 - BLOCK
      ?auto_45079 - BLOCK
      ?auto_45077 - BLOCK
      ?auto_45078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45073 ?auto_45074 ) ) ( not ( = ?auto_45073 ?auto_45075 ) ) ( not ( = ?auto_45074 ?auto_45075 ) ) ( not ( = ?auto_45073 ?auto_45076 ) ) ( not ( = ?auto_45074 ?auto_45076 ) ) ( not ( = ?auto_45075 ?auto_45076 ) ) ( not ( = ?auto_45079 ?auto_45077 ) ) ( not ( = ?auto_45079 ?auto_45076 ) ) ( not ( = ?auto_45079 ?auto_45075 ) ) ( not ( = ?auto_45079 ?auto_45074 ) ) ( not ( = ?auto_45077 ?auto_45076 ) ) ( not ( = ?auto_45077 ?auto_45075 ) ) ( not ( = ?auto_45077 ?auto_45074 ) ) ( not ( = ?auto_45073 ?auto_45079 ) ) ( not ( = ?auto_45073 ?auto_45077 ) ) ( ON ?auto_45073 ?auto_45078 ) ( not ( = ?auto_45073 ?auto_45078 ) ) ( not ( = ?auto_45074 ?auto_45078 ) ) ( not ( = ?auto_45075 ?auto_45078 ) ) ( not ( = ?auto_45076 ?auto_45078 ) ) ( not ( = ?auto_45079 ?auto_45078 ) ) ( not ( = ?auto_45077 ?auto_45078 ) ) ( ON ?auto_45074 ?auto_45073 ) ( ON-TABLE ?auto_45078 ) ( ON ?auto_45075 ?auto_45074 ) ( ON ?auto_45076 ?auto_45075 ) ( ON ?auto_45077 ?auto_45076 ) ( CLEAR ?auto_45077 ) ( HOLDING ?auto_45079 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45079 )
      ( MAKE-3PILE ?auto_45073 ?auto_45074 ?auto_45075 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_45080 - BLOCK
      ?auto_45081 - BLOCK
      ?auto_45082 - BLOCK
    )
    :vars
    (
      ?auto_45083 - BLOCK
      ?auto_45086 - BLOCK
      ?auto_45085 - BLOCK
      ?auto_45084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45080 ?auto_45081 ) ) ( not ( = ?auto_45080 ?auto_45082 ) ) ( not ( = ?auto_45081 ?auto_45082 ) ) ( not ( = ?auto_45080 ?auto_45083 ) ) ( not ( = ?auto_45081 ?auto_45083 ) ) ( not ( = ?auto_45082 ?auto_45083 ) ) ( not ( = ?auto_45086 ?auto_45085 ) ) ( not ( = ?auto_45086 ?auto_45083 ) ) ( not ( = ?auto_45086 ?auto_45082 ) ) ( not ( = ?auto_45086 ?auto_45081 ) ) ( not ( = ?auto_45085 ?auto_45083 ) ) ( not ( = ?auto_45085 ?auto_45082 ) ) ( not ( = ?auto_45085 ?auto_45081 ) ) ( not ( = ?auto_45080 ?auto_45086 ) ) ( not ( = ?auto_45080 ?auto_45085 ) ) ( ON ?auto_45080 ?auto_45084 ) ( not ( = ?auto_45080 ?auto_45084 ) ) ( not ( = ?auto_45081 ?auto_45084 ) ) ( not ( = ?auto_45082 ?auto_45084 ) ) ( not ( = ?auto_45083 ?auto_45084 ) ) ( not ( = ?auto_45086 ?auto_45084 ) ) ( not ( = ?auto_45085 ?auto_45084 ) ) ( ON ?auto_45081 ?auto_45080 ) ( ON-TABLE ?auto_45084 ) ( ON ?auto_45082 ?auto_45081 ) ( ON ?auto_45083 ?auto_45082 ) ( ON ?auto_45085 ?auto_45083 ) ( ON ?auto_45086 ?auto_45085 ) ( CLEAR ?auto_45086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45084 ?auto_45080 ?auto_45081 ?auto_45082 ?auto_45083 ?auto_45085 )
      ( MAKE-3PILE ?auto_45080 ?auto_45081 ?auto_45082 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45102 - BLOCK
      ?auto_45103 - BLOCK
    )
    :vars
    (
      ?auto_45104 - BLOCK
      ?auto_45105 - BLOCK
      ?auto_45106 - BLOCK
      ?auto_45107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45104 ?auto_45103 ) ( ON-TABLE ?auto_45102 ) ( ON ?auto_45103 ?auto_45102 ) ( not ( = ?auto_45102 ?auto_45103 ) ) ( not ( = ?auto_45102 ?auto_45104 ) ) ( not ( = ?auto_45103 ?auto_45104 ) ) ( not ( = ?auto_45102 ?auto_45105 ) ) ( not ( = ?auto_45102 ?auto_45106 ) ) ( not ( = ?auto_45103 ?auto_45105 ) ) ( not ( = ?auto_45103 ?auto_45106 ) ) ( not ( = ?auto_45104 ?auto_45105 ) ) ( not ( = ?auto_45104 ?auto_45106 ) ) ( not ( = ?auto_45105 ?auto_45106 ) ) ( ON ?auto_45105 ?auto_45104 ) ( CLEAR ?auto_45105 ) ( HOLDING ?auto_45106 ) ( CLEAR ?auto_45107 ) ( ON-TABLE ?auto_45107 ) ( not ( = ?auto_45107 ?auto_45106 ) ) ( not ( = ?auto_45102 ?auto_45107 ) ) ( not ( = ?auto_45103 ?auto_45107 ) ) ( not ( = ?auto_45104 ?auto_45107 ) ) ( not ( = ?auto_45105 ?auto_45107 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45107 ?auto_45106 )
      ( MAKE-2PILE ?auto_45102 ?auto_45103 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45108 - BLOCK
      ?auto_45109 - BLOCK
    )
    :vars
    (
      ?auto_45111 - BLOCK
      ?auto_45110 - BLOCK
      ?auto_45113 - BLOCK
      ?auto_45112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45111 ?auto_45109 ) ( ON-TABLE ?auto_45108 ) ( ON ?auto_45109 ?auto_45108 ) ( not ( = ?auto_45108 ?auto_45109 ) ) ( not ( = ?auto_45108 ?auto_45111 ) ) ( not ( = ?auto_45109 ?auto_45111 ) ) ( not ( = ?auto_45108 ?auto_45110 ) ) ( not ( = ?auto_45108 ?auto_45113 ) ) ( not ( = ?auto_45109 ?auto_45110 ) ) ( not ( = ?auto_45109 ?auto_45113 ) ) ( not ( = ?auto_45111 ?auto_45110 ) ) ( not ( = ?auto_45111 ?auto_45113 ) ) ( not ( = ?auto_45110 ?auto_45113 ) ) ( ON ?auto_45110 ?auto_45111 ) ( CLEAR ?auto_45112 ) ( ON-TABLE ?auto_45112 ) ( not ( = ?auto_45112 ?auto_45113 ) ) ( not ( = ?auto_45108 ?auto_45112 ) ) ( not ( = ?auto_45109 ?auto_45112 ) ) ( not ( = ?auto_45111 ?auto_45112 ) ) ( not ( = ?auto_45110 ?auto_45112 ) ) ( ON ?auto_45113 ?auto_45110 ) ( CLEAR ?auto_45113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45108 ?auto_45109 ?auto_45111 ?auto_45110 )
      ( MAKE-2PILE ?auto_45108 ?auto_45109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45114 - BLOCK
      ?auto_45115 - BLOCK
    )
    :vars
    (
      ?auto_45118 - BLOCK
      ?auto_45116 - BLOCK
      ?auto_45119 - BLOCK
      ?auto_45117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45118 ?auto_45115 ) ( ON-TABLE ?auto_45114 ) ( ON ?auto_45115 ?auto_45114 ) ( not ( = ?auto_45114 ?auto_45115 ) ) ( not ( = ?auto_45114 ?auto_45118 ) ) ( not ( = ?auto_45115 ?auto_45118 ) ) ( not ( = ?auto_45114 ?auto_45116 ) ) ( not ( = ?auto_45114 ?auto_45119 ) ) ( not ( = ?auto_45115 ?auto_45116 ) ) ( not ( = ?auto_45115 ?auto_45119 ) ) ( not ( = ?auto_45118 ?auto_45116 ) ) ( not ( = ?auto_45118 ?auto_45119 ) ) ( not ( = ?auto_45116 ?auto_45119 ) ) ( ON ?auto_45116 ?auto_45118 ) ( not ( = ?auto_45117 ?auto_45119 ) ) ( not ( = ?auto_45114 ?auto_45117 ) ) ( not ( = ?auto_45115 ?auto_45117 ) ) ( not ( = ?auto_45118 ?auto_45117 ) ) ( not ( = ?auto_45116 ?auto_45117 ) ) ( ON ?auto_45119 ?auto_45116 ) ( CLEAR ?auto_45119 ) ( HOLDING ?auto_45117 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45117 )
      ( MAKE-2PILE ?auto_45114 ?auto_45115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45128 - BLOCK
      ?auto_45129 - BLOCK
    )
    :vars
    (
      ?auto_45132 - BLOCK
      ?auto_45130 - BLOCK
      ?auto_45131 - BLOCK
      ?auto_45133 - BLOCK
      ?auto_45134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45132 ?auto_45129 ) ( ON-TABLE ?auto_45128 ) ( ON ?auto_45129 ?auto_45128 ) ( not ( = ?auto_45128 ?auto_45129 ) ) ( not ( = ?auto_45128 ?auto_45132 ) ) ( not ( = ?auto_45129 ?auto_45132 ) ) ( not ( = ?auto_45128 ?auto_45130 ) ) ( not ( = ?auto_45128 ?auto_45131 ) ) ( not ( = ?auto_45129 ?auto_45130 ) ) ( not ( = ?auto_45129 ?auto_45131 ) ) ( not ( = ?auto_45132 ?auto_45130 ) ) ( not ( = ?auto_45132 ?auto_45131 ) ) ( not ( = ?auto_45130 ?auto_45131 ) ) ( ON ?auto_45130 ?auto_45132 ) ( not ( = ?auto_45133 ?auto_45131 ) ) ( not ( = ?auto_45128 ?auto_45133 ) ) ( not ( = ?auto_45129 ?auto_45133 ) ) ( not ( = ?auto_45132 ?auto_45133 ) ) ( not ( = ?auto_45130 ?auto_45133 ) ) ( ON ?auto_45131 ?auto_45130 ) ( CLEAR ?auto_45131 ) ( ON ?auto_45133 ?auto_45134 ) ( CLEAR ?auto_45133 ) ( HAND-EMPTY ) ( not ( = ?auto_45128 ?auto_45134 ) ) ( not ( = ?auto_45129 ?auto_45134 ) ) ( not ( = ?auto_45132 ?auto_45134 ) ) ( not ( = ?auto_45130 ?auto_45134 ) ) ( not ( = ?auto_45131 ?auto_45134 ) ) ( not ( = ?auto_45133 ?auto_45134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45133 ?auto_45134 )
      ( MAKE-2PILE ?auto_45128 ?auto_45129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_45135 - BLOCK
      ?auto_45136 - BLOCK
    )
    :vars
    (
      ?auto_45140 - BLOCK
      ?auto_45141 - BLOCK
      ?auto_45138 - BLOCK
      ?auto_45139 - BLOCK
      ?auto_45137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45140 ?auto_45136 ) ( ON-TABLE ?auto_45135 ) ( ON ?auto_45136 ?auto_45135 ) ( not ( = ?auto_45135 ?auto_45136 ) ) ( not ( = ?auto_45135 ?auto_45140 ) ) ( not ( = ?auto_45136 ?auto_45140 ) ) ( not ( = ?auto_45135 ?auto_45141 ) ) ( not ( = ?auto_45135 ?auto_45138 ) ) ( not ( = ?auto_45136 ?auto_45141 ) ) ( not ( = ?auto_45136 ?auto_45138 ) ) ( not ( = ?auto_45140 ?auto_45141 ) ) ( not ( = ?auto_45140 ?auto_45138 ) ) ( not ( = ?auto_45141 ?auto_45138 ) ) ( ON ?auto_45141 ?auto_45140 ) ( not ( = ?auto_45139 ?auto_45138 ) ) ( not ( = ?auto_45135 ?auto_45139 ) ) ( not ( = ?auto_45136 ?auto_45139 ) ) ( not ( = ?auto_45140 ?auto_45139 ) ) ( not ( = ?auto_45141 ?auto_45139 ) ) ( ON ?auto_45139 ?auto_45137 ) ( CLEAR ?auto_45139 ) ( not ( = ?auto_45135 ?auto_45137 ) ) ( not ( = ?auto_45136 ?auto_45137 ) ) ( not ( = ?auto_45140 ?auto_45137 ) ) ( not ( = ?auto_45141 ?auto_45137 ) ) ( not ( = ?auto_45138 ?auto_45137 ) ) ( not ( = ?auto_45139 ?auto_45137 ) ) ( HOLDING ?auto_45138 ) ( CLEAR ?auto_45141 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45135 ?auto_45136 ?auto_45140 ?auto_45141 ?auto_45138 )
      ( MAKE-2PILE ?auto_45135 ?auto_45136 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45181 - BLOCK
      ?auto_45182 - BLOCK
      ?auto_45183 - BLOCK
      ?auto_45184 - BLOCK
    )
    :vars
    (
      ?auto_45185 - BLOCK
      ?auto_45186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45181 ) ( ON ?auto_45182 ?auto_45181 ) ( not ( = ?auto_45181 ?auto_45182 ) ) ( not ( = ?auto_45181 ?auto_45183 ) ) ( not ( = ?auto_45181 ?auto_45184 ) ) ( not ( = ?auto_45182 ?auto_45183 ) ) ( not ( = ?auto_45182 ?auto_45184 ) ) ( not ( = ?auto_45183 ?auto_45184 ) ) ( ON ?auto_45184 ?auto_45185 ) ( not ( = ?auto_45181 ?auto_45185 ) ) ( not ( = ?auto_45182 ?auto_45185 ) ) ( not ( = ?auto_45183 ?auto_45185 ) ) ( not ( = ?auto_45184 ?auto_45185 ) ) ( CLEAR ?auto_45182 ) ( ON ?auto_45183 ?auto_45184 ) ( CLEAR ?auto_45183 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45186 ) ( ON ?auto_45185 ?auto_45186 ) ( not ( = ?auto_45186 ?auto_45185 ) ) ( not ( = ?auto_45186 ?auto_45184 ) ) ( not ( = ?auto_45186 ?auto_45183 ) ) ( not ( = ?auto_45181 ?auto_45186 ) ) ( not ( = ?auto_45182 ?auto_45186 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45186 ?auto_45185 ?auto_45184 )
      ( MAKE-4PILE ?auto_45181 ?auto_45182 ?auto_45183 ?auto_45184 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45187 - BLOCK
      ?auto_45188 - BLOCK
      ?auto_45189 - BLOCK
      ?auto_45190 - BLOCK
    )
    :vars
    (
      ?auto_45191 - BLOCK
      ?auto_45192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45187 ) ( not ( = ?auto_45187 ?auto_45188 ) ) ( not ( = ?auto_45187 ?auto_45189 ) ) ( not ( = ?auto_45187 ?auto_45190 ) ) ( not ( = ?auto_45188 ?auto_45189 ) ) ( not ( = ?auto_45188 ?auto_45190 ) ) ( not ( = ?auto_45189 ?auto_45190 ) ) ( ON ?auto_45190 ?auto_45191 ) ( not ( = ?auto_45187 ?auto_45191 ) ) ( not ( = ?auto_45188 ?auto_45191 ) ) ( not ( = ?auto_45189 ?auto_45191 ) ) ( not ( = ?auto_45190 ?auto_45191 ) ) ( ON ?auto_45189 ?auto_45190 ) ( CLEAR ?auto_45189 ) ( ON-TABLE ?auto_45192 ) ( ON ?auto_45191 ?auto_45192 ) ( not ( = ?auto_45192 ?auto_45191 ) ) ( not ( = ?auto_45192 ?auto_45190 ) ) ( not ( = ?auto_45192 ?auto_45189 ) ) ( not ( = ?auto_45187 ?auto_45192 ) ) ( not ( = ?auto_45188 ?auto_45192 ) ) ( HOLDING ?auto_45188 ) ( CLEAR ?auto_45187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45187 ?auto_45188 )
      ( MAKE-4PILE ?auto_45187 ?auto_45188 ?auto_45189 ?auto_45190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45193 - BLOCK
      ?auto_45194 - BLOCK
      ?auto_45195 - BLOCK
      ?auto_45196 - BLOCK
    )
    :vars
    (
      ?auto_45198 - BLOCK
      ?auto_45197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45193 ) ( not ( = ?auto_45193 ?auto_45194 ) ) ( not ( = ?auto_45193 ?auto_45195 ) ) ( not ( = ?auto_45193 ?auto_45196 ) ) ( not ( = ?auto_45194 ?auto_45195 ) ) ( not ( = ?auto_45194 ?auto_45196 ) ) ( not ( = ?auto_45195 ?auto_45196 ) ) ( ON ?auto_45196 ?auto_45198 ) ( not ( = ?auto_45193 ?auto_45198 ) ) ( not ( = ?auto_45194 ?auto_45198 ) ) ( not ( = ?auto_45195 ?auto_45198 ) ) ( not ( = ?auto_45196 ?auto_45198 ) ) ( ON ?auto_45195 ?auto_45196 ) ( ON-TABLE ?auto_45197 ) ( ON ?auto_45198 ?auto_45197 ) ( not ( = ?auto_45197 ?auto_45198 ) ) ( not ( = ?auto_45197 ?auto_45196 ) ) ( not ( = ?auto_45197 ?auto_45195 ) ) ( not ( = ?auto_45193 ?auto_45197 ) ) ( not ( = ?auto_45194 ?auto_45197 ) ) ( CLEAR ?auto_45193 ) ( ON ?auto_45194 ?auto_45195 ) ( CLEAR ?auto_45194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45197 ?auto_45198 ?auto_45196 ?auto_45195 )
      ( MAKE-4PILE ?auto_45193 ?auto_45194 ?auto_45195 ?auto_45196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45199 - BLOCK
      ?auto_45200 - BLOCK
      ?auto_45201 - BLOCK
      ?auto_45202 - BLOCK
    )
    :vars
    (
      ?auto_45203 - BLOCK
      ?auto_45204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45199 ?auto_45200 ) ) ( not ( = ?auto_45199 ?auto_45201 ) ) ( not ( = ?auto_45199 ?auto_45202 ) ) ( not ( = ?auto_45200 ?auto_45201 ) ) ( not ( = ?auto_45200 ?auto_45202 ) ) ( not ( = ?auto_45201 ?auto_45202 ) ) ( ON ?auto_45202 ?auto_45203 ) ( not ( = ?auto_45199 ?auto_45203 ) ) ( not ( = ?auto_45200 ?auto_45203 ) ) ( not ( = ?auto_45201 ?auto_45203 ) ) ( not ( = ?auto_45202 ?auto_45203 ) ) ( ON ?auto_45201 ?auto_45202 ) ( ON-TABLE ?auto_45204 ) ( ON ?auto_45203 ?auto_45204 ) ( not ( = ?auto_45204 ?auto_45203 ) ) ( not ( = ?auto_45204 ?auto_45202 ) ) ( not ( = ?auto_45204 ?auto_45201 ) ) ( not ( = ?auto_45199 ?auto_45204 ) ) ( not ( = ?auto_45200 ?auto_45204 ) ) ( ON ?auto_45200 ?auto_45201 ) ( CLEAR ?auto_45200 ) ( HOLDING ?auto_45199 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45199 )
      ( MAKE-4PILE ?auto_45199 ?auto_45200 ?auto_45201 ?auto_45202 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45205 - BLOCK
      ?auto_45206 - BLOCK
      ?auto_45207 - BLOCK
      ?auto_45208 - BLOCK
    )
    :vars
    (
      ?auto_45210 - BLOCK
      ?auto_45209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45205 ?auto_45206 ) ) ( not ( = ?auto_45205 ?auto_45207 ) ) ( not ( = ?auto_45205 ?auto_45208 ) ) ( not ( = ?auto_45206 ?auto_45207 ) ) ( not ( = ?auto_45206 ?auto_45208 ) ) ( not ( = ?auto_45207 ?auto_45208 ) ) ( ON ?auto_45208 ?auto_45210 ) ( not ( = ?auto_45205 ?auto_45210 ) ) ( not ( = ?auto_45206 ?auto_45210 ) ) ( not ( = ?auto_45207 ?auto_45210 ) ) ( not ( = ?auto_45208 ?auto_45210 ) ) ( ON ?auto_45207 ?auto_45208 ) ( ON-TABLE ?auto_45209 ) ( ON ?auto_45210 ?auto_45209 ) ( not ( = ?auto_45209 ?auto_45210 ) ) ( not ( = ?auto_45209 ?auto_45208 ) ) ( not ( = ?auto_45209 ?auto_45207 ) ) ( not ( = ?auto_45205 ?auto_45209 ) ) ( not ( = ?auto_45206 ?auto_45209 ) ) ( ON ?auto_45206 ?auto_45207 ) ( ON ?auto_45205 ?auto_45206 ) ( CLEAR ?auto_45205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45209 ?auto_45210 ?auto_45208 ?auto_45207 ?auto_45206 )
      ( MAKE-4PILE ?auto_45205 ?auto_45206 ?auto_45207 ?auto_45208 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45215 - BLOCK
      ?auto_45216 - BLOCK
      ?auto_45217 - BLOCK
      ?auto_45218 - BLOCK
    )
    :vars
    (
      ?auto_45220 - BLOCK
      ?auto_45219 - BLOCK
      ?auto_45221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45215 ?auto_45216 ) ) ( not ( = ?auto_45215 ?auto_45217 ) ) ( not ( = ?auto_45215 ?auto_45218 ) ) ( not ( = ?auto_45216 ?auto_45217 ) ) ( not ( = ?auto_45216 ?auto_45218 ) ) ( not ( = ?auto_45217 ?auto_45218 ) ) ( ON ?auto_45218 ?auto_45220 ) ( not ( = ?auto_45215 ?auto_45220 ) ) ( not ( = ?auto_45216 ?auto_45220 ) ) ( not ( = ?auto_45217 ?auto_45220 ) ) ( not ( = ?auto_45218 ?auto_45220 ) ) ( ON ?auto_45217 ?auto_45218 ) ( ON-TABLE ?auto_45219 ) ( ON ?auto_45220 ?auto_45219 ) ( not ( = ?auto_45219 ?auto_45220 ) ) ( not ( = ?auto_45219 ?auto_45218 ) ) ( not ( = ?auto_45219 ?auto_45217 ) ) ( not ( = ?auto_45215 ?auto_45219 ) ) ( not ( = ?auto_45216 ?auto_45219 ) ) ( ON ?auto_45216 ?auto_45217 ) ( CLEAR ?auto_45216 ) ( ON ?auto_45215 ?auto_45221 ) ( CLEAR ?auto_45215 ) ( HAND-EMPTY ) ( not ( = ?auto_45215 ?auto_45221 ) ) ( not ( = ?auto_45216 ?auto_45221 ) ) ( not ( = ?auto_45217 ?auto_45221 ) ) ( not ( = ?auto_45218 ?auto_45221 ) ) ( not ( = ?auto_45220 ?auto_45221 ) ) ( not ( = ?auto_45219 ?auto_45221 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45215 ?auto_45221 )
      ( MAKE-4PILE ?auto_45215 ?auto_45216 ?auto_45217 ?auto_45218 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45222 - BLOCK
      ?auto_45223 - BLOCK
      ?auto_45224 - BLOCK
      ?auto_45225 - BLOCK
    )
    :vars
    (
      ?auto_45226 - BLOCK
      ?auto_45228 - BLOCK
      ?auto_45227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45222 ?auto_45223 ) ) ( not ( = ?auto_45222 ?auto_45224 ) ) ( not ( = ?auto_45222 ?auto_45225 ) ) ( not ( = ?auto_45223 ?auto_45224 ) ) ( not ( = ?auto_45223 ?auto_45225 ) ) ( not ( = ?auto_45224 ?auto_45225 ) ) ( ON ?auto_45225 ?auto_45226 ) ( not ( = ?auto_45222 ?auto_45226 ) ) ( not ( = ?auto_45223 ?auto_45226 ) ) ( not ( = ?auto_45224 ?auto_45226 ) ) ( not ( = ?auto_45225 ?auto_45226 ) ) ( ON ?auto_45224 ?auto_45225 ) ( ON-TABLE ?auto_45228 ) ( ON ?auto_45226 ?auto_45228 ) ( not ( = ?auto_45228 ?auto_45226 ) ) ( not ( = ?auto_45228 ?auto_45225 ) ) ( not ( = ?auto_45228 ?auto_45224 ) ) ( not ( = ?auto_45222 ?auto_45228 ) ) ( not ( = ?auto_45223 ?auto_45228 ) ) ( ON ?auto_45222 ?auto_45227 ) ( CLEAR ?auto_45222 ) ( not ( = ?auto_45222 ?auto_45227 ) ) ( not ( = ?auto_45223 ?auto_45227 ) ) ( not ( = ?auto_45224 ?auto_45227 ) ) ( not ( = ?auto_45225 ?auto_45227 ) ) ( not ( = ?auto_45226 ?auto_45227 ) ) ( not ( = ?auto_45228 ?auto_45227 ) ) ( HOLDING ?auto_45223 ) ( CLEAR ?auto_45224 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45228 ?auto_45226 ?auto_45225 ?auto_45224 ?auto_45223 )
      ( MAKE-4PILE ?auto_45222 ?auto_45223 ?auto_45224 ?auto_45225 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45229 - BLOCK
      ?auto_45230 - BLOCK
      ?auto_45231 - BLOCK
      ?auto_45232 - BLOCK
    )
    :vars
    (
      ?auto_45233 - BLOCK
      ?auto_45234 - BLOCK
      ?auto_45235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45229 ?auto_45230 ) ) ( not ( = ?auto_45229 ?auto_45231 ) ) ( not ( = ?auto_45229 ?auto_45232 ) ) ( not ( = ?auto_45230 ?auto_45231 ) ) ( not ( = ?auto_45230 ?auto_45232 ) ) ( not ( = ?auto_45231 ?auto_45232 ) ) ( ON ?auto_45232 ?auto_45233 ) ( not ( = ?auto_45229 ?auto_45233 ) ) ( not ( = ?auto_45230 ?auto_45233 ) ) ( not ( = ?auto_45231 ?auto_45233 ) ) ( not ( = ?auto_45232 ?auto_45233 ) ) ( ON ?auto_45231 ?auto_45232 ) ( ON-TABLE ?auto_45234 ) ( ON ?auto_45233 ?auto_45234 ) ( not ( = ?auto_45234 ?auto_45233 ) ) ( not ( = ?auto_45234 ?auto_45232 ) ) ( not ( = ?auto_45234 ?auto_45231 ) ) ( not ( = ?auto_45229 ?auto_45234 ) ) ( not ( = ?auto_45230 ?auto_45234 ) ) ( ON ?auto_45229 ?auto_45235 ) ( not ( = ?auto_45229 ?auto_45235 ) ) ( not ( = ?auto_45230 ?auto_45235 ) ) ( not ( = ?auto_45231 ?auto_45235 ) ) ( not ( = ?auto_45232 ?auto_45235 ) ) ( not ( = ?auto_45233 ?auto_45235 ) ) ( not ( = ?auto_45234 ?auto_45235 ) ) ( CLEAR ?auto_45231 ) ( ON ?auto_45230 ?auto_45229 ) ( CLEAR ?auto_45230 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45235 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45235 ?auto_45229 )
      ( MAKE-4PILE ?auto_45229 ?auto_45230 ?auto_45231 ?auto_45232 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45236 - BLOCK
      ?auto_45237 - BLOCK
      ?auto_45238 - BLOCK
      ?auto_45239 - BLOCK
    )
    :vars
    (
      ?auto_45242 - BLOCK
      ?auto_45240 - BLOCK
      ?auto_45241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45236 ?auto_45237 ) ) ( not ( = ?auto_45236 ?auto_45238 ) ) ( not ( = ?auto_45236 ?auto_45239 ) ) ( not ( = ?auto_45237 ?auto_45238 ) ) ( not ( = ?auto_45237 ?auto_45239 ) ) ( not ( = ?auto_45238 ?auto_45239 ) ) ( ON ?auto_45239 ?auto_45242 ) ( not ( = ?auto_45236 ?auto_45242 ) ) ( not ( = ?auto_45237 ?auto_45242 ) ) ( not ( = ?auto_45238 ?auto_45242 ) ) ( not ( = ?auto_45239 ?auto_45242 ) ) ( ON-TABLE ?auto_45240 ) ( ON ?auto_45242 ?auto_45240 ) ( not ( = ?auto_45240 ?auto_45242 ) ) ( not ( = ?auto_45240 ?auto_45239 ) ) ( not ( = ?auto_45240 ?auto_45238 ) ) ( not ( = ?auto_45236 ?auto_45240 ) ) ( not ( = ?auto_45237 ?auto_45240 ) ) ( ON ?auto_45236 ?auto_45241 ) ( not ( = ?auto_45236 ?auto_45241 ) ) ( not ( = ?auto_45237 ?auto_45241 ) ) ( not ( = ?auto_45238 ?auto_45241 ) ) ( not ( = ?auto_45239 ?auto_45241 ) ) ( not ( = ?auto_45242 ?auto_45241 ) ) ( not ( = ?auto_45240 ?auto_45241 ) ) ( ON ?auto_45237 ?auto_45236 ) ( CLEAR ?auto_45237 ) ( ON-TABLE ?auto_45241 ) ( HOLDING ?auto_45238 ) ( CLEAR ?auto_45239 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45240 ?auto_45242 ?auto_45239 ?auto_45238 )
      ( MAKE-4PILE ?auto_45236 ?auto_45237 ?auto_45238 ?auto_45239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45243 - BLOCK
      ?auto_45244 - BLOCK
      ?auto_45245 - BLOCK
      ?auto_45246 - BLOCK
    )
    :vars
    (
      ?auto_45249 - BLOCK
      ?auto_45248 - BLOCK
      ?auto_45247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45243 ?auto_45244 ) ) ( not ( = ?auto_45243 ?auto_45245 ) ) ( not ( = ?auto_45243 ?auto_45246 ) ) ( not ( = ?auto_45244 ?auto_45245 ) ) ( not ( = ?auto_45244 ?auto_45246 ) ) ( not ( = ?auto_45245 ?auto_45246 ) ) ( ON ?auto_45246 ?auto_45249 ) ( not ( = ?auto_45243 ?auto_45249 ) ) ( not ( = ?auto_45244 ?auto_45249 ) ) ( not ( = ?auto_45245 ?auto_45249 ) ) ( not ( = ?auto_45246 ?auto_45249 ) ) ( ON-TABLE ?auto_45248 ) ( ON ?auto_45249 ?auto_45248 ) ( not ( = ?auto_45248 ?auto_45249 ) ) ( not ( = ?auto_45248 ?auto_45246 ) ) ( not ( = ?auto_45248 ?auto_45245 ) ) ( not ( = ?auto_45243 ?auto_45248 ) ) ( not ( = ?auto_45244 ?auto_45248 ) ) ( ON ?auto_45243 ?auto_45247 ) ( not ( = ?auto_45243 ?auto_45247 ) ) ( not ( = ?auto_45244 ?auto_45247 ) ) ( not ( = ?auto_45245 ?auto_45247 ) ) ( not ( = ?auto_45246 ?auto_45247 ) ) ( not ( = ?auto_45249 ?auto_45247 ) ) ( not ( = ?auto_45248 ?auto_45247 ) ) ( ON ?auto_45244 ?auto_45243 ) ( ON-TABLE ?auto_45247 ) ( CLEAR ?auto_45246 ) ( ON ?auto_45245 ?auto_45244 ) ( CLEAR ?auto_45245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45247 ?auto_45243 ?auto_45244 )
      ( MAKE-4PILE ?auto_45243 ?auto_45244 ?auto_45245 ?auto_45246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45250 - BLOCK
      ?auto_45251 - BLOCK
      ?auto_45252 - BLOCK
      ?auto_45253 - BLOCK
    )
    :vars
    (
      ?auto_45256 - BLOCK
      ?auto_45255 - BLOCK
      ?auto_45254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45250 ?auto_45251 ) ) ( not ( = ?auto_45250 ?auto_45252 ) ) ( not ( = ?auto_45250 ?auto_45253 ) ) ( not ( = ?auto_45251 ?auto_45252 ) ) ( not ( = ?auto_45251 ?auto_45253 ) ) ( not ( = ?auto_45252 ?auto_45253 ) ) ( not ( = ?auto_45250 ?auto_45256 ) ) ( not ( = ?auto_45251 ?auto_45256 ) ) ( not ( = ?auto_45252 ?auto_45256 ) ) ( not ( = ?auto_45253 ?auto_45256 ) ) ( ON-TABLE ?auto_45255 ) ( ON ?auto_45256 ?auto_45255 ) ( not ( = ?auto_45255 ?auto_45256 ) ) ( not ( = ?auto_45255 ?auto_45253 ) ) ( not ( = ?auto_45255 ?auto_45252 ) ) ( not ( = ?auto_45250 ?auto_45255 ) ) ( not ( = ?auto_45251 ?auto_45255 ) ) ( ON ?auto_45250 ?auto_45254 ) ( not ( = ?auto_45250 ?auto_45254 ) ) ( not ( = ?auto_45251 ?auto_45254 ) ) ( not ( = ?auto_45252 ?auto_45254 ) ) ( not ( = ?auto_45253 ?auto_45254 ) ) ( not ( = ?auto_45256 ?auto_45254 ) ) ( not ( = ?auto_45255 ?auto_45254 ) ) ( ON ?auto_45251 ?auto_45250 ) ( ON-TABLE ?auto_45254 ) ( ON ?auto_45252 ?auto_45251 ) ( CLEAR ?auto_45252 ) ( HOLDING ?auto_45253 ) ( CLEAR ?auto_45256 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45255 ?auto_45256 ?auto_45253 )
      ( MAKE-4PILE ?auto_45250 ?auto_45251 ?auto_45252 ?auto_45253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45257 - BLOCK
      ?auto_45258 - BLOCK
      ?auto_45259 - BLOCK
      ?auto_45260 - BLOCK
    )
    :vars
    (
      ?auto_45262 - BLOCK
      ?auto_45263 - BLOCK
      ?auto_45261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45257 ?auto_45258 ) ) ( not ( = ?auto_45257 ?auto_45259 ) ) ( not ( = ?auto_45257 ?auto_45260 ) ) ( not ( = ?auto_45258 ?auto_45259 ) ) ( not ( = ?auto_45258 ?auto_45260 ) ) ( not ( = ?auto_45259 ?auto_45260 ) ) ( not ( = ?auto_45257 ?auto_45262 ) ) ( not ( = ?auto_45258 ?auto_45262 ) ) ( not ( = ?auto_45259 ?auto_45262 ) ) ( not ( = ?auto_45260 ?auto_45262 ) ) ( ON-TABLE ?auto_45263 ) ( ON ?auto_45262 ?auto_45263 ) ( not ( = ?auto_45263 ?auto_45262 ) ) ( not ( = ?auto_45263 ?auto_45260 ) ) ( not ( = ?auto_45263 ?auto_45259 ) ) ( not ( = ?auto_45257 ?auto_45263 ) ) ( not ( = ?auto_45258 ?auto_45263 ) ) ( ON ?auto_45257 ?auto_45261 ) ( not ( = ?auto_45257 ?auto_45261 ) ) ( not ( = ?auto_45258 ?auto_45261 ) ) ( not ( = ?auto_45259 ?auto_45261 ) ) ( not ( = ?auto_45260 ?auto_45261 ) ) ( not ( = ?auto_45262 ?auto_45261 ) ) ( not ( = ?auto_45263 ?auto_45261 ) ) ( ON ?auto_45258 ?auto_45257 ) ( ON-TABLE ?auto_45261 ) ( ON ?auto_45259 ?auto_45258 ) ( CLEAR ?auto_45262 ) ( ON ?auto_45260 ?auto_45259 ) ( CLEAR ?auto_45260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45261 ?auto_45257 ?auto_45258 ?auto_45259 )
      ( MAKE-4PILE ?auto_45257 ?auto_45258 ?auto_45259 ?auto_45260 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45264 - BLOCK
      ?auto_45265 - BLOCK
      ?auto_45266 - BLOCK
      ?auto_45267 - BLOCK
    )
    :vars
    (
      ?auto_45269 - BLOCK
      ?auto_45268 - BLOCK
      ?auto_45270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45264 ?auto_45265 ) ) ( not ( = ?auto_45264 ?auto_45266 ) ) ( not ( = ?auto_45264 ?auto_45267 ) ) ( not ( = ?auto_45265 ?auto_45266 ) ) ( not ( = ?auto_45265 ?auto_45267 ) ) ( not ( = ?auto_45266 ?auto_45267 ) ) ( not ( = ?auto_45264 ?auto_45269 ) ) ( not ( = ?auto_45265 ?auto_45269 ) ) ( not ( = ?auto_45266 ?auto_45269 ) ) ( not ( = ?auto_45267 ?auto_45269 ) ) ( ON-TABLE ?auto_45268 ) ( not ( = ?auto_45268 ?auto_45269 ) ) ( not ( = ?auto_45268 ?auto_45267 ) ) ( not ( = ?auto_45268 ?auto_45266 ) ) ( not ( = ?auto_45264 ?auto_45268 ) ) ( not ( = ?auto_45265 ?auto_45268 ) ) ( ON ?auto_45264 ?auto_45270 ) ( not ( = ?auto_45264 ?auto_45270 ) ) ( not ( = ?auto_45265 ?auto_45270 ) ) ( not ( = ?auto_45266 ?auto_45270 ) ) ( not ( = ?auto_45267 ?auto_45270 ) ) ( not ( = ?auto_45269 ?auto_45270 ) ) ( not ( = ?auto_45268 ?auto_45270 ) ) ( ON ?auto_45265 ?auto_45264 ) ( ON-TABLE ?auto_45270 ) ( ON ?auto_45266 ?auto_45265 ) ( ON ?auto_45267 ?auto_45266 ) ( CLEAR ?auto_45267 ) ( HOLDING ?auto_45269 ) ( CLEAR ?auto_45268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45268 ?auto_45269 )
      ( MAKE-4PILE ?auto_45264 ?auto_45265 ?auto_45266 ?auto_45267 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45271 - BLOCK
      ?auto_45272 - BLOCK
      ?auto_45273 - BLOCK
      ?auto_45274 - BLOCK
    )
    :vars
    (
      ?auto_45277 - BLOCK
      ?auto_45275 - BLOCK
      ?auto_45276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45271 ?auto_45272 ) ) ( not ( = ?auto_45271 ?auto_45273 ) ) ( not ( = ?auto_45271 ?auto_45274 ) ) ( not ( = ?auto_45272 ?auto_45273 ) ) ( not ( = ?auto_45272 ?auto_45274 ) ) ( not ( = ?auto_45273 ?auto_45274 ) ) ( not ( = ?auto_45271 ?auto_45277 ) ) ( not ( = ?auto_45272 ?auto_45277 ) ) ( not ( = ?auto_45273 ?auto_45277 ) ) ( not ( = ?auto_45274 ?auto_45277 ) ) ( ON-TABLE ?auto_45275 ) ( not ( = ?auto_45275 ?auto_45277 ) ) ( not ( = ?auto_45275 ?auto_45274 ) ) ( not ( = ?auto_45275 ?auto_45273 ) ) ( not ( = ?auto_45271 ?auto_45275 ) ) ( not ( = ?auto_45272 ?auto_45275 ) ) ( ON ?auto_45271 ?auto_45276 ) ( not ( = ?auto_45271 ?auto_45276 ) ) ( not ( = ?auto_45272 ?auto_45276 ) ) ( not ( = ?auto_45273 ?auto_45276 ) ) ( not ( = ?auto_45274 ?auto_45276 ) ) ( not ( = ?auto_45277 ?auto_45276 ) ) ( not ( = ?auto_45275 ?auto_45276 ) ) ( ON ?auto_45272 ?auto_45271 ) ( ON-TABLE ?auto_45276 ) ( ON ?auto_45273 ?auto_45272 ) ( ON ?auto_45274 ?auto_45273 ) ( CLEAR ?auto_45275 ) ( ON ?auto_45277 ?auto_45274 ) ( CLEAR ?auto_45277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45276 ?auto_45271 ?auto_45272 ?auto_45273 ?auto_45274 )
      ( MAKE-4PILE ?auto_45271 ?auto_45272 ?auto_45273 ?auto_45274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45278 - BLOCK
      ?auto_45279 - BLOCK
      ?auto_45280 - BLOCK
      ?auto_45281 - BLOCK
    )
    :vars
    (
      ?auto_45284 - BLOCK
      ?auto_45283 - BLOCK
      ?auto_45282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45278 ?auto_45279 ) ) ( not ( = ?auto_45278 ?auto_45280 ) ) ( not ( = ?auto_45278 ?auto_45281 ) ) ( not ( = ?auto_45279 ?auto_45280 ) ) ( not ( = ?auto_45279 ?auto_45281 ) ) ( not ( = ?auto_45280 ?auto_45281 ) ) ( not ( = ?auto_45278 ?auto_45284 ) ) ( not ( = ?auto_45279 ?auto_45284 ) ) ( not ( = ?auto_45280 ?auto_45284 ) ) ( not ( = ?auto_45281 ?auto_45284 ) ) ( not ( = ?auto_45283 ?auto_45284 ) ) ( not ( = ?auto_45283 ?auto_45281 ) ) ( not ( = ?auto_45283 ?auto_45280 ) ) ( not ( = ?auto_45278 ?auto_45283 ) ) ( not ( = ?auto_45279 ?auto_45283 ) ) ( ON ?auto_45278 ?auto_45282 ) ( not ( = ?auto_45278 ?auto_45282 ) ) ( not ( = ?auto_45279 ?auto_45282 ) ) ( not ( = ?auto_45280 ?auto_45282 ) ) ( not ( = ?auto_45281 ?auto_45282 ) ) ( not ( = ?auto_45284 ?auto_45282 ) ) ( not ( = ?auto_45283 ?auto_45282 ) ) ( ON ?auto_45279 ?auto_45278 ) ( ON-TABLE ?auto_45282 ) ( ON ?auto_45280 ?auto_45279 ) ( ON ?auto_45281 ?auto_45280 ) ( ON ?auto_45284 ?auto_45281 ) ( CLEAR ?auto_45284 ) ( HOLDING ?auto_45283 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45283 )
      ( MAKE-4PILE ?auto_45278 ?auto_45279 ?auto_45280 ?auto_45281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_45285 - BLOCK
      ?auto_45286 - BLOCK
      ?auto_45287 - BLOCK
      ?auto_45288 - BLOCK
    )
    :vars
    (
      ?auto_45291 - BLOCK
      ?auto_45289 - BLOCK
      ?auto_45290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45285 ?auto_45286 ) ) ( not ( = ?auto_45285 ?auto_45287 ) ) ( not ( = ?auto_45285 ?auto_45288 ) ) ( not ( = ?auto_45286 ?auto_45287 ) ) ( not ( = ?auto_45286 ?auto_45288 ) ) ( not ( = ?auto_45287 ?auto_45288 ) ) ( not ( = ?auto_45285 ?auto_45291 ) ) ( not ( = ?auto_45286 ?auto_45291 ) ) ( not ( = ?auto_45287 ?auto_45291 ) ) ( not ( = ?auto_45288 ?auto_45291 ) ) ( not ( = ?auto_45289 ?auto_45291 ) ) ( not ( = ?auto_45289 ?auto_45288 ) ) ( not ( = ?auto_45289 ?auto_45287 ) ) ( not ( = ?auto_45285 ?auto_45289 ) ) ( not ( = ?auto_45286 ?auto_45289 ) ) ( ON ?auto_45285 ?auto_45290 ) ( not ( = ?auto_45285 ?auto_45290 ) ) ( not ( = ?auto_45286 ?auto_45290 ) ) ( not ( = ?auto_45287 ?auto_45290 ) ) ( not ( = ?auto_45288 ?auto_45290 ) ) ( not ( = ?auto_45291 ?auto_45290 ) ) ( not ( = ?auto_45289 ?auto_45290 ) ) ( ON ?auto_45286 ?auto_45285 ) ( ON-TABLE ?auto_45290 ) ( ON ?auto_45287 ?auto_45286 ) ( ON ?auto_45288 ?auto_45287 ) ( ON ?auto_45291 ?auto_45288 ) ( ON ?auto_45289 ?auto_45291 ) ( CLEAR ?auto_45289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45290 ?auto_45285 ?auto_45286 ?auto_45287 ?auto_45288 ?auto_45291 )
      ( MAKE-4PILE ?auto_45285 ?auto_45286 ?auto_45287 ?auto_45288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45303 - BLOCK
    )
    :vars
    (
      ?auto_45305 - BLOCK
      ?auto_45304 - BLOCK
      ?auto_45306 - BLOCK
      ?auto_45307 - BLOCK
      ?auto_45308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45305 ?auto_45303 ) ( ON-TABLE ?auto_45303 ) ( not ( = ?auto_45303 ?auto_45305 ) ) ( not ( = ?auto_45303 ?auto_45304 ) ) ( not ( = ?auto_45303 ?auto_45306 ) ) ( not ( = ?auto_45305 ?auto_45304 ) ) ( not ( = ?auto_45305 ?auto_45306 ) ) ( not ( = ?auto_45304 ?auto_45306 ) ) ( ON ?auto_45304 ?auto_45305 ) ( CLEAR ?auto_45304 ) ( HOLDING ?auto_45306 ) ( CLEAR ?auto_45307 ) ( ON-TABLE ?auto_45308 ) ( ON ?auto_45307 ?auto_45308 ) ( not ( = ?auto_45308 ?auto_45307 ) ) ( not ( = ?auto_45308 ?auto_45306 ) ) ( not ( = ?auto_45307 ?auto_45306 ) ) ( not ( = ?auto_45303 ?auto_45307 ) ) ( not ( = ?auto_45303 ?auto_45308 ) ) ( not ( = ?auto_45305 ?auto_45307 ) ) ( not ( = ?auto_45305 ?auto_45308 ) ) ( not ( = ?auto_45304 ?auto_45307 ) ) ( not ( = ?auto_45304 ?auto_45308 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45308 ?auto_45307 ?auto_45306 )
      ( MAKE-1PILE ?auto_45303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45309 - BLOCK
    )
    :vars
    (
      ?auto_45311 - BLOCK
      ?auto_45310 - BLOCK
      ?auto_45312 - BLOCK
      ?auto_45313 - BLOCK
      ?auto_45314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45311 ?auto_45309 ) ( ON-TABLE ?auto_45309 ) ( not ( = ?auto_45309 ?auto_45311 ) ) ( not ( = ?auto_45309 ?auto_45310 ) ) ( not ( = ?auto_45309 ?auto_45312 ) ) ( not ( = ?auto_45311 ?auto_45310 ) ) ( not ( = ?auto_45311 ?auto_45312 ) ) ( not ( = ?auto_45310 ?auto_45312 ) ) ( ON ?auto_45310 ?auto_45311 ) ( CLEAR ?auto_45313 ) ( ON-TABLE ?auto_45314 ) ( ON ?auto_45313 ?auto_45314 ) ( not ( = ?auto_45314 ?auto_45313 ) ) ( not ( = ?auto_45314 ?auto_45312 ) ) ( not ( = ?auto_45313 ?auto_45312 ) ) ( not ( = ?auto_45309 ?auto_45313 ) ) ( not ( = ?auto_45309 ?auto_45314 ) ) ( not ( = ?auto_45311 ?auto_45313 ) ) ( not ( = ?auto_45311 ?auto_45314 ) ) ( not ( = ?auto_45310 ?auto_45313 ) ) ( not ( = ?auto_45310 ?auto_45314 ) ) ( ON ?auto_45312 ?auto_45310 ) ( CLEAR ?auto_45312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45309 ?auto_45311 ?auto_45310 )
      ( MAKE-1PILE ?auto_45309 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45315 - BLOCK
    )
    :vars
    (
      ?auto_45316 - BLOCK
      ?auto_45317 - BLOCK
      ?auto_45319 - BLOCK
      ?auto_45320 - BLOCK
      ?auto_45318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45316 ?auto_45315 ) ( ON-TABLE ?auto_45315 ) ( not ( = ?auto_45315 ?auto_45316 ) ) ( not ( = ?auto_45315 ?auto_45317 ) ) ( not ( = ?auto_45315 ?auto_45319 ) ) ( not ( = ?auto_45316 ?auto_45317 ) ) ( not ( = ?auto_45316 ?auto_45319 ) ) ( not ( = ?auto_45317 ?auto_45319 ) ) ( ON ?auto_45317 ?auto_45316 ) ( ON-TABLE ?auto_45320 ) ( not ( = ?auto_45320 ?auto_45318 ) ) ( not ( = ?auto_45320 ?auto_45319 ) ) ( not ( = ?auto_45318 ?auto_45319 ) ) ( not ( = ?auto_45315 ?auto_45318 ) ) ( not ( = ?auto_45315 ?auto_45320 ) ) ( not ( = ?auto_45316 ?auto_45318 ) ) ( not ( = ?auto_45316 ?auto_45320 ) ) ( not ( = ?auto_45317 ?auto_45318 ) ) ( not ( = ?auto_45317 ?auto_45320 ) ) ( ON ?auto_45319 ?auto_45317 ) ( CLEAR ?auto_45319 ) ( HOLDING ?auto_45318 ) ( CLEAR ?auto_45320 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45320 ?auto_45318 )
      ( MAKE-1PILE ?auto_45315 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45321 - BLOCK
    )
    :vars
    (
      ?auto_45324 - BLOCK
      ?auto_45326 - BLOCK
      ?auto_45322 - BLOCK
      ?auto_45325 - BLOCK
      ?auto_45323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45324 ?auto_45321 ) ( ON-TABLE ?auto_45321 ) ( not ( = ?auto_45321 ?auto_45324 ) ) ( not ( = ?auto_45321 ?auto_45326 ) ) ( not ( = ?auto_45321 ?auto_45322 ) ) ( not ( = ?auto_45324 ?auto_45326 ) ) ( not ( = ?auto_45324 ?auto_45322 ) ) ( not ( = ?auto_45326 ?auto_45322 ) ) ( ON ?auto_45326 ?auto_45324 ) ( ON-TABLE ?auto_45325 ) ( not ( = ?auto_45325 ?auto_45323 ) ) ( not ( = ?auto_45325 ?auto_45322 ) ) ( not ( = ?auto_45323 ?auto_45322 ) ) ( not ( = ?auto_45321 ?auto_45323 ) ) ( not ( = ?auto_45321 ?auto_45325 ) ) ( not ( = ?auto_45324 ?auto_45323 ) ) ( not ( = ?auto_45324 ?auto_45325 ) ) ( not ( = ?auto_45326 ?auto_45323 ) ) ( not ( = ?auto_45326 ?auto_45325 ) ) ( ON ?auto_45322 ?auto_45326 ) ( CLEAR ?auto_45325 ) ( ON ?auto_45323 ?auto_45322 ) ( CLEAR ?auto_45323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45321 ?auto_45324 ?auto_45326 ?auto_45322 )
      ( MAKE-1PILE ?auto_45321 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45327 - BLOCK
    )
    :vars
    (
      ?auto_45330 - BLOCK
      ?auto_45329 - BLOCK
      ?auto_45331 - BLOCK
      ?auto_45332 - BLOCK
      ?auto_45328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45330 ?auto_45327 ) ( ON-TABLE ?auto_45327 ) ( not ( = ?auto_45327 ?auto_45330 ) ) ( not ( = ?auto_45327 ?auto_45329 ) ) ( not ( = ?auto_45327 ?auto_45331 ) ) ( not ( = ?auto_45330 ?auto_45329 ) ) ( not ( = ?auto_45330 ?auto_45331 ) ) ( not ( = ?auto_45329 ?auto_45331 ) ) ( ON ?auto_45329 ?auto_45330 ) ( not ( = ?auto_45332 ?auto_45328 ) ) ( not ( = ?auto_45332 ?auto_45331 ) ) ( not ( = ?auto_45328 ?auto_45331 ) ) ( not ( = ?auto_45327 ?auto_45328 ) ) ( not ( = ?auto_45327 ?auto_45332 ) ) ( not ( = ?auto_45330 ?auto_45328 ) ) ( not ( = ?auto_45330 ?auto_45332 ) ) ( not ( = ?auto_45329 ?auto_45328 ) ) ( not ( = ?auto_45329 ?auto_45332 ) ) ( ON ?auto_45331 ?auto_45329 ) ( ON ?auto_45328 ?auto_45331 ) ( CLEAR ?auto_45328 ) ( HOLDING ?auto_45332 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45332 )
      ( MAKE-1PILE ?auto_45327 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45340 - BLOCK
    )
    :vars
    (
      ?auto_45345 - BLOCK
      ?auto_45344 - BLOCK
      ?auto_45341 - BLOCK
      ?auto_45342 - BLOCK
      ?auto_45343 - BLOCK
      ?auto_45346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45345 ?auto_45340 ) ( ON-TABLE ?auto_45340 ) ( not ( = ?auto_45340 ?auto_45345 ) ) ( not ( = ?auto_45340 ?auto_45344 ) ) ( not ( = ?auto_45340 ?auto_45341 ) ) ( not ( = ?auto_45345 ?auto_45344 ) ) ( not ( = ?auto_45345 ?auto_45341 ) ) ( not ( = ?auto_45344 ?auto_45341 ) ) ( ON ?auto_45344 ?auto_45345 ) ( not ( = ?auto_45342 ?auto_45343 ) ) ( not ( = ?auto_45342 ?auto_45341 ) ) ( not ( = ?auto_45343 ?auto_45341 ) ) ( not ( = ?auto_45340 ?auto_45343 ) ) ( not ( = ?auto_45340 ?auto_45342 ) ) ( not ( = ?auto_45345 ?auto_45343 ) ) ( not ( = ?auto_45345 ?auto_45342 ) ) ( not ( = ?auto_45344 ?auto_45343 ) ) ( not ( = ?auto_45344 ?auto_45342 ) ) ( ON ?auto_45341 ?auto_45344 ) ( ON ?auto_45343 ?auto_45341 ) ( CLEAR ?auto_45343 ) ( ON ?auto_45342 ?auto_45346 ) ( CLEAR ?auto_45342 ) ( HAND-EMPTY ) ( not ( = ?auto_45340 ?auto_45346 ) ) ( not ( = ?auto_45345 ?auto_45346 ) ) ( not ( = ?auto_45344 ?auto_45346 ) ) ( not ( = ?auto_45341 ?auto_45346 ) ) ( not ( = ?auto_45342 ?auto_45346 ) ) ( not ( = ?auto_45343 ?auto_45346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45342 ?auto_45346 )
      ( MAKE-1PILE ?auto_45340 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45347 - BLOCK
    )
    :vars
    (
      ?auto_45351 - BLOCK
      ?auto_45353 - BLOCK
      ?auto_45349 - BLOCK
      ?auto_45352 - BLOCK
      ?auto_45350 - BLOCK
      ?auto_45348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45351 ?auto_45347 ) ( ON-TABLE ?auto_45347 ) ( not ( = ?auto_45347 ?auto_45351 ) ) ( not ( = ?auto_45347 ?auto_45353 ) ) ( not ( = ?auto_45347 ?auto_45349 ) ) ( not ( = ?auto_45351 ?auto_45353 ) ) ( not ( = ?auto_45351 ?auto_45349 ) ) ( not ( = ?auto_45353 ?auto_45349 ) ) ( ON ?auto_45353 ?auto_45351 ) ( not ( = ?auto_45352 ?auto_45350 ) ) ( not ( = ?auto_45352 ?auto_45349 ) ) ( not ( = ?auto_45350 ?auto_45349 ) ) ( not ( = ?auto_45347 ?auto_45350 ) ) ( not ( = ?auto_45347 ?auto_45352 ) ) ( not ( = ?auto_45351 ?auto_45350 ) ) ( not ( = ?auto_45351 ?auto_45352 ) ) ( not ( = ?auto_45353 ?auto_45350 ) ) ( not ( = ?auto_45353 ?auto_45352 ) ) ( ON ?auto_45349 ?auto_45353 ) ( ON ?auto_45352 ?auto_45348 ) ( CLEAR ?auto_45352 ) ( not ( = ?auto_45347 ?auto_45348 ) ) ( not ( = ?auto_45351 ?auto_45348 ) ) ( not ( = ?auto_45353 ?auto_45348 ) ) ( not ( = ?auto_45349 ?auto_45348 ) ) ( not ( = ?auto_45352 ?auto_45348 ) ) ( not ( = ?auto_45350 ?auto_45348 ) ) ( HOLDING ?auto_45350 ) ( CLEAR ?auto_45349 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45347 ?auto_45351 ?auto_45353 ?auto_45349 ?auto_45350 )
      ( MAKE-1PILE ?auto_45347 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_45354 - BLOCK
    )
    :vars
    (
      ?auto_45357 - BLOCK
      ?auto_45356 - BLOCK
      ?auto_45359 - BLOCK
      ?auto_45360 - BLOCK
      ?auto_45355 - BLOCK
      ?auto_45358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_45357 ?auto_45354 ) ( ON-TABLE ?auto_45354 ) ( not ( = ?auto_45354 ?auto_45357 ) ) ( not ( = ?auto_45354 ?auto_45356 ) ) ( not ( = ?auto_45354 ?auto_45359 ) ) ( not ( = ?auto_45357 ?auto_45356 ) ) ( not ( = ?auto_45357 ?auto_45359 ) ) ( not ( = ?auto_45356 ?auto_45359 ) ) ( ON ?auto_45356 ?auto_45357 ) ( not ( = ?auto_45360 ?auto_45355 ) ) ( not ( = ?auto_45360 ?auto_45359 ) ) ( not ( = ?auto_45355 ?auto_45359 ) ) ( not ( = ?auto_45354 ?auto_45355 ) ) ( not ( = ?auto_45354 ?auto_45360 ) ) ( not ( = ?auto_45357 ?auto_45355 ) ) ( not ( = ?auto_45357 ?auto_45360 ) ) ( not ( = ?auto_45356 ?auto_45355 ) ) ( not ( = ?auto_45356 ?auto_45360 ) ) ( ON ?auto_45359 ?auto_45356 ) ( ON ?auto_45360 ?auto_45358 ) ( not ( = ?auto_45354 ?auto_45358 ) ) ( not ( = ?auto_45357 ?auto_45358 ) ) ( not ( = ?auto_45356 ?auto_45358 ) ) ( not ( = ?auto_45359 ?auto_45358 ) ) ( not ( = ?auto_45360 ?auto_45358 ) ) ( not ( = ?auto_45355 ?auto_45358 ) ) ( CLEAR ?auto_45359 ) ( ON ?auto_45355 ?auto_45360 ) ( CLEAR ?auto_45355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45358 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45358 ?auto_45360 )
      ( MAKE-1PILE ?auto_45354 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45394 - BLOCK
      ?auto_45395 - BLOCK
      ?auto_45396 - BLOCK
      ?auto_45397 - BLOCK
      ?auto_45398 - BLOCK
    )
    :vars
    (
      ?auto_45399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45394 ) ( ON ?auto_45395 ?auto_45394 ) ( ON ?auto_45396 ?auto_45395 ) ( not ( = ?auto_45394 ?auto_45395 ) ) ( not ( = ?auto_45394 ?auto_45396 ) ) ( not ( = ?auto_45394 ?auto_45397 ) ) ( not ( = ?auto_45394 ?auto_45398 ) ) ( not ( = ?auto_45395 ?auto_45396 ) ) ( not ( = ?auto_45395 ?auto_45397 ) ) ( not ( = ?auto_45395 ?auto_45398 ) ) ( not ( = ?auto_45396 ?auto_45397 ) ) ( not ( = ?auto_45396 ?auto_45398 ) ) ( not ( = ?auto_45397 ?auto_45398 ) ) ( ON ?auto_45398 ?auto_45399 ) ( not ( = ?auto_45394 ?auto_45399 ) ) ( not ( = ?auto_45395 ?auto_45399 ) ) ( not ( = ?auto_45396 ?auto_45399 ) ) ( not ( = ?auto_45397 ?auto_45399 ) ) ( not ( = ?auto_45398 ?auto_45399 ) ) ( CLEAR ?auto_45396 ) ( ON ?auto_45397 ?auto_45398 ) ( CLEAR ?auto_45397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45399 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45399 ?auto_45398 )
      ( MAKE-5PILE ?auto_45394 ?auto_45395 ?auto_45396 ?auto_45397 ?auto_45398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45400 - BLOCK
      ?auto_45401 - BLOCK
      ?auto_45402 - BLOCK
      ?auto_45403 - BLOCK
      ?auto_45404 - BLOCK
    )
    :vars
    (
      ?auto_45405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45400 ) ( ON ?auto_45401 ?auto_45400 ) ( not ( = ?auto_45400 ?auto_45401 ) ) ( not ( = ?auto_45400 ?auto_45402 ) ) ( not ( = ?auto_45400 ?auto_45403 ) ) ( not ( = ?auto_45400 ?auto_45404 ) ) ( not ( = ?auto_45401 ?auto_45402 ) ) ( not ( = ?auto_45401 ?auto_45403 ) ) ( not ( = ?auto_45401 ?auto_45404 ) ) ( not ( = ?auto_45402 ?auto_45403 ) ) ( not ( = ?auto_45402 ?auto_45404 ) ) ( not ( = ?auto_45403 ?auto_45404 ) ) ( ON ?auto_45404 ?auto_45405 ) ( not ( = ?auto_45400 ?auto_45405 ) ) ( not ( = ?auto_45401 ?auto_45405 ) ) ( not ( = ?auto_45402 ?auto_45405 ) ) ( not ( = ?auto_45403 ?auto_45405 ) ) ( not ( = ?auto_45404 ?auto_45405 ) ) ( ON ?auto_45403 ?auto_45404 ) ( CLEAR ?auto_45403 ) ( ON-TABLE ?auto_45405 ) ( HOLDING ?auto_45402 ) ( CLEAR ?auto_45401 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45400 ?auto_45401 ?auto_45402 )
      ( MAKE-5PILE ?auto_45400 ?auto_45401 ?auto_45402 ?auto_45403 ?auto_45404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45406 - BLOCK
      ?auto_45407 - BLOCK
      ?auto_45408 - BLOCK
      ?auto_45409 - BLOCK
      ?auto_45410 - BLOCK
    )
    :vars
    (
      ?auto_45411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45406 ) ( ON ?auto_45407 ?auto_45406 ) ( not ( = ?auto_45406 ?auto_45407 ) ) ( not ( = ?auto_45406 ?auto_45408 ) ) ( not ( = ?auto_45406 ?auto_45409 ) ) ( not ( = ?auto_45406 ?auto_45410 ) ) ( not ( = ?auto_45407 ?auto_45408 ) ) ( not ( = ?auto_45407 ?auto_45409 ) ) ( not ( = ?auto_45407 ?auto_45410 ) ) ( not ( = ?auto_45408 ?auto_45409 ) ) ( not ( = ?auto_45408 ?auto_45410 ) ) ( not ( = ?auto_45409 ?auto_45410 ) ) ( ON ?auto_45410 ?auto_45411 ) ( not ( = ?auto_45406 ?auto_45411 ) ) ( not ( = ?auto_45407 ?auto_45411 ) ) ( not ( = ?auto_45408 ?auto_45411 ) ) ( not ( = ?auto_45409 ?auto_45411 ) ) ( not ( = ?auto_45410 ?auto_45411 ) ) ( ON ?auto_45409 ?auto_45410 ) ( ON-TABLE ?auto_45411 ) ( CLEAR ?auto_45407 ) ( ON ?auto_45408 ?auto_45409 ) ( CLEAR ?auto_45408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45411 ?auto_45410 ?auto_45409 )
      ( MAKE-5PILE ?auto_45406 ?auto_45407 ?auto_45408 ?auto_45409 ?auto_45410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45412 - BLOCK
      ?auto_45413 - BLOCK
      ?auto_45414 - BLOCK
      ?auto_45415 - BLOCK
      ?auto_45416 - BLOCK
    )
    :vars
    (
      ?auto_45417 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45412 ) ( not ( = ?auto_45412 ?auto_45413 ) ) ( not ( = ?auto_45412 ?auto_45414 ) ) ( not ( = ?auto_45412 ?auto_45415 ) ) ( not ( = ?auto_45412 ?auto_45416 ) ) ( not ( = ?auto_45413 ?auto_45414 ) ) ( not ( = ?auto_45413 ?auto_45415 ) ) ( not ( = ?auto_45413 ?auto_45416 ) ) ( not ( = ?auto_45414 ?auto_45415 ) ) ( not ( = ?auto_45414 ?auto_45416 ) ) ( not ( = ?auto_45415 ?auto_45416 ) ) ( ON ?auto_45416 ?auto_45417 ) ( not ( = ?auto_45412 ?auto_45417 ) ) ( not ( = ?auto_45413 ?auto_45417 ) ) ( not ( = ?auto_45414 ?auto_45417 ) ) ( not ( = ?auto_45415 ?auto_45417 ) ) ( not ( = ?auto_45416 ?auto_45417 ) ) ( ON ?auto_45415 ?auto_45416 ) ( ON-TABLE ?auto_45417 ) ( ON ?auto_45414 ?auto_45415 ) ( CLEAR ?auto_45414 ) ( HOLDING ?auto_45413 ) ( CLEAR ?auto_45412 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45412 ?auto_45413 )
      ( MAKE-5PILE ?auto_45412 ?auto_45413 ?auto_45414 ?auto_45415 ?auto_45416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45418 - BLOCK
      ?auto_45419 - BLOCK
      ?auto_45420 - BLOCK
      ?auto_45421 - BLOCK
      ?auto_45422 - BLOCK
    )
    :vars
    (
      ?auto_45423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45418 ) ( not ( = ?auto_45418 ?auto_45419 ) ) ( not ( = ?auto_45418 ?auto_45420 ) ) ( not ( = ?auto_45418 ?auto_45421 ) ) ( not ( = ?auto_45418 ?auto_45422 ) ) ( not ( = ?auto_45419 ?auto_45420 ) ) ( not ( = ?auto_45419 ?auto_45421 ) ) ( not ( = ?auto_45419 ?auto_45422 ) ) ( not ( = ?auto_45420 ?auto_45421 ) ) ( not ( = ?auto_45420 ?auto_45422 ) ) ( not ( = ?auto_45421 ?auto_45422 ) ) ( ON ?auto_45422 ?auto_45423 ) ( not ( = ?auto_45418 ?auto_45423 ) ) ( not ( = ?auto_45419 ?auto_45423 ) ) ( not ( = ?auto_45420 ?auto_45423 ) ) ( not ( = ?auto_45421 ?auto_45423 ) ) ( not ( = ?auto_45422 ?auto_45423 ) ) ( ON ?auto_45421 ?auto_45422 ) ( ON-TABLE ?auto_45423 ) ( ON ?auto_45420 ?auto_45421 ) ( CLEAR ?auto_45418 ) ( ON ?auto_45419 ?auto_45420 ) ( CLEAR ?auto_45419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45423 ?auto_45422 ?auto_45421 ?auto_45420 )
      ( MAKE-5PILE ?auto_45418 ?auto_45419 ?auto_45420 ?auto_45421 ?auto_45422 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45424 - BLOCK
      ?auto_45425 - BLOCK
      ?auto_45426 - BLOCK
      ?auto_45427 - BLOCK
      ?auto_45428 - BLOCK
    )
    :vars
    (
      ?auto_45429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45424 ?auto_45425 ) ) ( not ( = ?auto_45424 ?auto_45426 ) ) ( not ( = ?auto_45424 ?auto_45427 ) ) ( not ( = ?auto_45424 ?auto_45428 ) ) ( not ( = ?auto_45425 ?auto_45426 ) ) ( not ( = ?auto_45425 ?auto_45427 ) ) ( not ( = ?auto_45425 ?auto_45428 ) ) ( not ( = ?auto_45426 ?auto_45427 ) ) ( not ( = ?auto_45426 ?auto_45428 ) ) ( not ( = ?auto_45427 ?auto_45428 ) ) ( ON ?auto_45428 ?auto_45429 ) ( not ( = ?auto_45424 ?auto_45429 ) ) ( not ( = ?auto_45425 ?auto_45429 ) ) ( not ( = ?auto_45426 ?auto_45429 ) ) ( not ( = ?auto_45427 ?auto_45429 ) ) ( not ( = ?auto_45428 ?auto_45429 ) ) ( ON ?auto_45427 ?auto_45428 ) ( ON-TABLE ?auto_45429 ) ( ON ?auto_45426 ?auto_45427 ) ( ON ?auto_45425 ?auto_45426 ) ( CLEAR ?auto_45425 ) ( HOLDING ?auto_45424 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45424 )
      ( MAKE-5PILE ?auto_45424 ?auto_45425 ?auto_45426 ?auto_45427 ?auto_45428 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45430 - BLOCK
      ?auto_45431 - BLOCK
      ?auto_45432 - BLOCK
      ?auto_45433 - BLOCK
      ?auto_45434 - BLOCK
    )
    :vars
    (
      ?auto_45435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45430 ?auto_45431 ) ) ( not ( = ?auto_45430 ?auto_45432 ) ) ( not ( = ?auto_45430 ?auto_45433 ) ) ( not ( = ?auto_45430 ?auto_45434 ) ) ( not ( = ?auto_45431 ?auto_45432 ) ) ( not ( = ?auto_45431 ?auto_45433 ) ) ( not ( = ?auto_45431 ?auto_45434 ) ) ( not ( = ?auto_45432 ?auto_45433 ) ) ( not ( = ?auto_45432 ?auto_45434 ) ) ( not ( = ?auto_45433 ?auto_45434 ) ) ( ON ?auto_45434 ?auto_45435 ) ( not ( = ?auto_45430 ?auto_45435 ) ) ( not ( = ?auto_45431 ?auto_45435 ) ) ( not ( = ?auto_45432 ?auto_45435 ) ) ( not ( = ?auto_45433 ?auto_45435 ) ) ( not ( = ?auto_45434 ?auto_45435 ) ) ( ON ?auto_45433 ?auto_45434 ) ( ON-TABLE ?auto_45435 ) ( ON ?auto_45432 ?auto_45433 ) ( ON ?auto_45431 ?auto_45432 ) ( ON ?auto_45430 ?auto_45431 ) ( CLEAR ?auto_45430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45435 ?auto_45434 ?auto_45433 ?auto_45432 ?auto_45431 )
      ( MAKE-5PILE ?auto_45430 ?auto_45431 ?auto_45432 ?auto_45433 ?auto_45434 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45441 - BLOCK
      ?auto_45442 - BLOCK
      ?auto_45443 - BLOCK
      ?auto_45444 - BLOCK
      ?auto_45445 - BLOCK
    )
    :vars
    (
      ?auto_45446 - BLOCK
      ?auto_45447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45441 ?auto_45442 ) ) ( not ( = ?auto_45441 ?auto_45443 ) ) ( not ( = ?auto_45441 ?auto_45444 ) ) ( not ( = ?auto_45441 ?auto_45445 ) ) ( not ( = ?auto_45442 ?auto_45443 ) ) ( not ( = ?auto_45442 ?auto_45444 ) ) ( not ( = ?auto_45442 ?auto_45445 ) ) ( not ( = ?auto_45443 ?auto_45444 ) ) ( not ( = ?auto_45443 ?auto_45445 ) ) ( not ( = ?auto_45444 ?auto_45445 ) ) ( ON ?auto_45445 ?auto_45446 ) ( not ( = ?auto_45441 ?auto_45446 ) ) ( not ( = ?auto_45442 ?auto_45446 ) ) ( not ( = ?auto_45443 ?auto_45446 ) ) ( not ( = ?auto_45444 ?auto_45446 ) ) ( not ( = ?auto_45445 ?auto_45446 ) ) ( ON ?auto_45444 ?auto_45445 ) ( ON-TABLE ?auto_45446 ) ( ON ?auto_45443 ?auto_45444 ) ( ON ?auto_45442 ?auto_45443 ) ( CLEAR ?auto_45442 ) ( ON ?auto_45441 ?auto_45447 ) ( CLEAR ?auto_45441 ) ( HAND-EMPTY ) ( not ( = ?auto_45441 ?auto_45447 ) ) ( not ( = ?auto_45442 ?auto_45447 ) ) ( not ( = ?auto_45443 ?auto_45447 ) ) ( not ( = ?auto_45444 ?auto_45447 ) ) ( not ( = ?auto_45445 ?auto_45447 ) ) ( not ( = ?auto_45446 ?auto_45447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45441 ?auto_45447 )
      ( MAKE-5PILE ?auto_45441 ?auto_45442 ?auto_45443 ?auto_45444 ?auto_45445 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45448 - BLOCK
      ?auto_45449 - BLOCK
      ?auto_45450 - BLOCK
      ?auto_45451 - BLOCK
      ?auto_45452 - BLOCK
    )
    :vars
    (
      ?auto_45454 - BLOCK
      ?auto_45453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45448 ?auto_45449 ) ) ( not ( = ?auto_45448 ?auto_45450 ) ) ( not ( = ?auto_45448 ?auto_45451 ) ) ( not ( = ?auto_45448 ?auto_45452 ) ) ( not ( = ?auto_45449 ?auto_45450 ) ) ( not ( = ?auto_45449 ?auto_45451 ) ) ( not ( = ?auto_45449 ?auto_45452 ) ) ( not ( = ?auto_45450 ?auto_45451 ) ) ( not ( = ?auto_45450 ?auto_45452 ) ) ( not ( = ?auto_45451 ?auto_45452 ) ) ( ON ?auto_45452 ?auto_45454 ) ( not ( = ?auto_45448 ?auto_45454 ) ) ( not ( = ?auto_45449 ?auto_45454 ) ) ( not ( = ?auto_45450 ?auto_45454 ) ) ( not ( = ?auto_45451 ?auto_45454 ) ) ( not ( = ?auto_45452 ?auto_45454 ) ) ( ON ?auto_45451 ?auto_45452 ) ( ON-TABLE ?auto_45454 ) ( ON ?auto_45450 ?auto_45451 ) ( ON ?auto_45448 ?auto_45453 ) ( CLEAR ?auto_45448 ) ( not ( = ?auto_45448 ?auto_45453 ) ) ( not ( = ?auto_45449 ?auto_45453 ) ) ( not ( = ?auto_45450 ?auto_45453 ) ) ( not ( = ?auto_45451 ?auto_45453 ) ) ( not ( = ?auto_45452 ?auto_45453 ) ) ( not ( = ?auto_45454 ?auto_45453 ) ) ( HOLDING ?auto_45449 ) ( CLEAR ?auto_45450 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45454 ?auto_45452 ?auto_45451 ?auto_45450 ?auto_45449 )
      ( MAKE-5PILE ?auto_45448 ?auto_45449 ?auto_45450 ?auto_45451 ?auto_45452 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45455 - BLOCK
      ?auto_45456 - BLOCK
      ?auto_45457 - BLOCK
      ?auto_45458 - BLOCK
      ?auto_45459 - BLOCK
    )
    :vars
    (
      ?auto_45460 - BLOCK
      ?auto_45461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45455 ?auto_45456 ) ) ( not ( = ?auto_45455 ?auto_45457 ) ) ( not ( = ?auto_45455 ?auto_45458 ) ) ( not ( = ?auto_45455 ?auto_45459 ) ) ( not ( = ?auto_45456 ?auto_45457 ) ) ( not ( = ?auto_45456 ?auto_45458 ) ) ( not ( = ?auto_45456 ?auto_45459 ) ) ( not ( = ?auto_45457 ?auto_45458 ) ) ( not ( = ?auto_45457 ?auto_45459 ) ) ( not ( = ?auto_45458 ?auto_45459 ) ) ( ON ?auto_45459 ?auto_45460 ) ( not ( = ?auto_45455 ?auto_45460 ) ) ( not ( = ?auto_45456 ?auto_45460 ) ) ( not ( = ?auto_45457 ?auto_45460 ) ) ( not ( = ?auto_45458 ?auto_45460 ) ) ( not ( = ?auto_45459 ?auto_45460 ) ) ( ON ?auto_45458 ?auto_45459 ) ( ON-TABLE ?auto_45460 ) ( ON ?auto_45457 ?auto_45458 ) ( ON ?auto_45455 ?auto_45461 ) ( not ( = ?auto_45455 ?auto_45461 ) ) ( not ( = ?auto_45456 ?auto_45461 ) ) ( not ( = ?auto_45457 ?auto_45461 ) ) ( not ( = ?auto_45458 ?auto_45461 ) ) ( not ( = ?auto_45459 ?auto_45461 ) ) ( not ( = ?auto_45460 ?auto_45461 ) ) ( CLEAR ?auto_45457 ) ( ON ?auto_45456 ?auto_45455 ) ( CLEAR ?auto_45456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45461 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45461 ?auto_45455 )
      ( MAKE-5PILE ?auto_45455 ?auto_45456 ?auto_45457 ?auto_45458 ?auto_45459 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45462 - BLOCK
      ?auto_45463 - BLOCK
      ?auto_45464 - BLOCK
      ?auto_45465 - BLOCK
      ?auto_45466 - BLOCK
    )
    :vars
    (
      ?auto_45468 - BLOCK
      ?auto_45467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45462 ?auto_45463 ) ) ( not ( = ?auto_45462 ?auto_45464 ) ) ( not ( = ?auto_45462 ?auto_45465 ) ) ( not ( = ?auto_45462 ?auto_45466 ) ) ( not ( = ?auto_45463 ?auto_45464 ) ) ( not ( = ?auto_45463 ?auto_45465 ) ) ( not ( = ?auto_45463 ?auto_45466 ) ) ( not ( = ?auto_45464 ?auto_45465 ) ) ( not ( = ?auto_45464 ?auto_45466 ) ) ( not ( = ?auto_45465 ?auto_45466 ) ) ( ON ?auto_45466 ?auto_45468 ) ( not ( = ?auto_45462 ?auto_45468 ) ) ( not ( = ?auto_45463 ?auto_45468 ) ) ( not ( = ?auto_45464 ?auto_45468 ) ) ( not ( = ?auto_45465 ?auto_45468 ) ) ( not ( = ?auto_45466 ?auto_45468 ) ) ( ON ?auto_45465 ?auto_45466 ) ( ON-TABLE ?auto_45468 ) ( ON ?auto_45462 ?auto_45467 ) ( not ( = ?auto_45462 ?auto_45467 ) ) ( not ( = ?auto_45463 ?auto_45467 ) ) ( not ( = ?auto_45464 ?auto_45467 ) ) ( not ( = ?auto_45465 ?auto_45467 ) ) ( not ( = ?auto_45466 ?auto_45467 ) ) ( not ( = ?auto_45468 ?auto_45467 ) ) ( ON ?auto_45463 ?auto_45462 ) ( CLEAR ?auto_45463 ) ( ON-TABLE ?auto_45467 ) ( HOLDING ?auto_45464 ) ( CLEAR ?auto_45465 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45468 ?auto_45466 ?auto_45465 ?auto_45464 )
      ( MAKE-5PILE ?auto_45462 ?auto_45463 ?auto_45464 ?auto_45465 ?auto_45466 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45469 - BLOCK
      ?auto_45470 - BLOCK
      ?auto_45471 - BLOCK
      ?auto_45472 - BLOCK
      ?auto_45473 - BLOCK
    )
    :vars
    (
      ?auto_45474 - BLOCK
      ?auto_45475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45469 ?auto_45470 ) ) ( not ( = ?auto_45469 ?auto_45471 ) ) ( not ( = ?auto_45469 ?auto_45472 ) ) ( not ( = ?auto_45469 ?auto_45473 ) ) ( not ( = ?auto_45470 ?auto_45471 ) ) ( not ( = ?auto_45470 ?auto_45472 ) ) ( not ( = ?auto_45470 ?auto_45473 ) ) ( not ( = ?auto_45471 ?auto_45472 ) ) ( not ( = ?auto_45471 ?auto_45473 ) ) ( not ( = ?auto_45472 ?auto_45473 ) ) ( ON ?auto_45473 ?auto_45474 ) ( not ( = ?auto_45469 ?auto_45474 ) ) ( not ( = ?auto_45470 ?auto_45474 ) ) ( not ( = ?auto_45471 ?auto_45474 ) ) ( not ( = ?auto_45472 ?auto_45474 ) ) ( not ( = ?auto_45473 ?auto_45474 ) ) ( ON ?auto_45472 ?auto_45473 ) ( ON-TABLE ?auto_45474 ) ( ON ?auto_45469 ?auto_45475 ) ( not ( = ?auto_45469 ?auto_45475 ) ) ( not ( = ?auto_45470 ?auto_45475 ) ) ( not ( = ?auto_45471 ?auto_45475 ) ) ( not ( = ?auto_45472 ?auto_45475 ) ) ( not ( = ?auto_45473 ?auto_45475 ) ) ( not ( = ?auto_45474 ?auto_45475 ) ) ( ON ?auto_45470 ?auto_45469 ) ( ON-TABLE ?auto_45475 ) ( CLEAR ?auto_45472 ) ( ON ?auto_45471 ?auto_45470 ) ( CLEAR ?auto_45471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45475 ?auto_45469 ?auto_45470 )
      ( MAKE-5PILE ?auto_45469 ?auto_45470 ?auto_45471 ?auto_45472 ?auto_45473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45476 - BLOCK
      ?auto_45477 - BLOCK
      ?auto_45478 - BLOCK
      ?auto_45479 - BLOCK
      ?auto_45480 - BLOCK
    )
    :vars
    (
      ?auto_45482 - BLOCK
      ?auto_45481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45476 ?auto_45477 ) ) ( not ( = ?auto_45476 ?auto_45478 ) ) ( not ( = ?auto_45476 ?auto_45479 ) ) ( not ( = ?auto_45476 ?auto_45480 ) ) ( not ( = ?auto_45477 ?auto_45478 ) ) ( not ( = ?auto_45477 ?auto_45479 ) ) ( not ( = ?auto_45477 ?auto_45480 ) ) ( not ( = ?auto_45478 ?auto_45479 ) ) ( not ( = ?auto_45478 ?auto_45480 ) ) ( not ( = ?auto_45479 ?auto_45480 ) ) ( ON ?auto_45480 ?auto_45482 ) ( not ( = ?auto_45476 ?auto_45482 ) ) ( not ( = ?auto_45477 ?auto_45482 ) ) ( not ( = ?auto_45478 ?auto_45482 ) ) ( not ( = ?auto_45479 ?auto_45482 ) ) ( not ( = ?auto_45480 ?auto_45482 ) ) ( ON-TABLE ?auto_45482 ) ( ON ?auto_45476 ?auto_45481 ) ( not ( = ?auto_45476 ?auto_45481 ) ) ( not ( = ?auto_45477 ?auto_45481 ) ) ( not ( = ?auto_45478 ?auto_45481 ) ) ( not ( = ?auto_45479 ?auto_45481 ) ) ( not ( = ?auto_45480 ?auto_45481 ) ) ( not ( = ?auto_45482 ?auto_45481 ) ) ( ON ?auto_45477 ?auto_45476 ) ( ON-TABLE ?auto_45481 ) ( ON ?auto_45478 ?auto_45477 ) ( CLEAR ?auto_45478 ) ( HOLDING ?auto_45479 ) ( CLEAR ?auto_45480 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45482 ?auto_45480 ?auto_45479 )
      ( MAKE-5PILE ?auto_45476 ?auto_45477 ?auto_45478 ?auto_45479 ?auto_45480 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45483 - BLOCK
      ?auto_45484 - BLOCK
      ?auto_45485 - BLOCK
      ?auto_45486 - BLOCK
      ?auto_45487 - BLOCK
    )
    :vars
    (
      ?auto_45489 - BLOCK
      ?auto_45488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45483 ?auto_45484 ) ) ( not ( = ?auto_45483 ?auto_45485 ) ) ( not ( = ?auto_45483 ?auto_45486 ) ) ( not ( = ?auto_45483 ?auto_45487 ) ) ( not ( = ?auto_45484 ?auto_45485 ) ) ( not ( = ?auto_45484 ?auto_45486 ) ) ( not ( = ?auto_45484 ?auto_45487 ) ) ( not ( = ?auto_45485 ?auto_45486 ) ) ( not ( = ?auto_45485 ?auto_45487 ) ) ( not ( = ?auto_45486 ?auto_45487 ) ) ( ON ?auto_45487 ?auto_45489 ) ( not ( = ?auto_45483 ?auto_45489 ) ) ( not ( = ?auto_45484 ?auto_45489 ) ) ( not ( = ?auto_45485 ?auto_45489 ) ) ( not ( = ?auto_45486 ?auto_45489 ) ) ( not ( = ?auto_45487 ?auto_45489 ) ) ( ON-TABLE ?auto_45489 ) ( ON ?auto_45483 ?auto_45488 ) ( not ( = ?auto_45483 ?auto_45488 ) ) ( not ( = ?auto_45484 ?auto_45488 ) ) ( not ( = ?auto_45485 ?auto_45488 ) ) ( not ( = ?auto_45486 ?auto_45488 ) ) ( not ( = ?auto_45487 ?auto_45488 ) ) ( not ( = ?auto_45489 ?auto_45488 ) ) ( ON ?auto_45484 ?auto_45483 ) ( ON-TABLE ?auto_45488 ) ( ON ?auto_45485 ?auto_45484 ) ( CLEAR ?auto_45487 ) ( ON ?auto_45486 ?auto_45485 ) ( CLEAR ?auto_45486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45488 ?auto_45483 ?auto_45484 ?auto_45485 )
      ( MAKE-5PILE ?auto_45483 ?auto_45484 ?auto_45485 ?auto_45486 ?auto_45487 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45490 - BLOCK
      ?auto_45491 - BLOCK
      ?auto_45492 - BLOCK
      ?auto_45493 - BLOCK
      ?auto_45494 - BLOCK
    )
    :vars
    (
      ?auto_45495 - BLOCK
      ?auto_45496 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45490 ?auto_45491 ) ) ( not ( = ?auto_45490 ?auto_45492 ) ) ( not ( = ?auto_45490 ?auto_45493 ) ) ( not ( = ?auto_45490 ?auto_45494 ) ) ( not ( = ?auto_45491 ?auto_45492 ) ) ( not ( = ?auto_45491 ?auto_45493 ) ) ( not ( = ?auto_45491 ?auto_45494 ) ) ( not ( = ?auto_45492 ?auto_45493 ) ) ( not ( = ?auto_45492 ?auto_45494 ) ) ( not ( = ?auto_45493 ?auto_45494 ) ) ( not ( = ?auto_45490 ?auto_45495 ) ) ( not ( = ?auto_45491 ?auto_45495 ) ) ( not ( = ?auto_45492 ?auto_45495 ) ) ( not ( = ?auto_45493 ?auto_45495 ) ) ( not ( = ?auto_45494 ?auto_45495 ) ) ( ON-TABLE ?auto_45495 ) ( ON ?auto_45490 ?auto_45496 ) ( not ( = ?auto_45490 ?auto_45496 ) ) ( not ( = ?auto_45491 ?auto_45496 ) ) ( not ( = ?auto_45492 ?auto_45496 ) ) ( not ( = ?auto_45493 ?auto_45496 ) ) ( not ( = ?auto_45494 ?auto_45496 ) ) ( not ( = ?auto_45495 ?auto_45496 ) ) ( ON ?auto_45491 ?auto_45490 ) ( ON-TABLE ?auto_45496 ) ( ON ?auto_45492 ?auto_45491 ) ( ON ?auto_45493 ?auto_45492 ) ( CLEAR ?auto_45493 ) ( HOLDING ?auto_45494 ) ( CLEAR ?auto_45495 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45495 ?auto_45494 )
      ( MAKE-5PILE ?auto_45490 ?auto_45491 ?auto_45492 ?auto_45493 ?auto_45494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45497 - BLOCK
      ?auto_45498 - BLOCK
      ?auto_45499 - BLOCK
      ?auto_45500 - BLOCK
      ?auto_45501 - BLOCK
    )
    :vars
    (
      ?auto_45503 - BLOCK
      ?auto_45502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45497 ?auto_45498 ) ) ( not ( = ?auto_45497 ?auto_45499 ) ) ( not ( = ?auto_45497 ?auto_45500 ) ) ( not ( = ?auto_45497 ?auto_45501 ) ) ( not ( = ?auto_45498 ?auto_45499 ) ) ( not ( = ?auto_45498 ?auto_45500 ) ) ( not ( = ?auto_45498 ?auto_45501 ) ) ( not ( = ?auto_45499 ?auto_45500 ) ) ( not ( = ?auto_45499 ?auto_45501 ) ) ( not ( = ?auto_45500 ?auto_45501 ) ) ( not ( = ?auto_45497 ?auto_45503 ) ) ( not ( = ?auto_45498 ?auto_45503 ) ) ( not ( = ?auto_45499 ?auto_45503 ) ) ( not ( = ?auto_45500 ?auto_45503 ) ) ( not ( = ?auto_45501 ?auto_45503 ) ) ( ON-TABLE ?auto_45503 ) ( ON ?auto_45497 ?auto_45502 ) ( not ( = ?auto_45497 ?auto_45502 ) ) ( not ( = ?auto_45498 ?auto_45502 ) ) ( not ( = ?auto_45499 ?auto_45502 ) ) ( not ( = ?auto_45500 ?auto_45502 ) ) ( not ( = ?auto_45501 ?auto_45502 ) ) ( not ( = ?auto_45503 ?auto_45502 ) ) ( ON ?auto_45498 ?auto_45497 ) ( ON-TABLE ?auto_45502 ) ( ON ?auto_45499 ?auto_45498 ) ( ON ?auto_45500 ?auto_45499 ) ( CLEAR ?auto_45503 ) ( ON ?auto_45501 ?auto_45500 ) ( CLEAR ?auto_45501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45502 ?auto_45497 ?auto_45498 ?auto_45499 ?auto_45500 )
      ( MAKE-5PILE ?auto_45497 ?auto_45498 ?auto_45499 ?auto_45500 ?auto_45501 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45504 - BLOCK
      ?auto_45505 - BLOCK
      ?auto_45506 - BLOCK
      ?auto_45507 - BLOCK
      ?auto_45508 - BLOCK
    )
    :vars
    (
      ?auto_45510 - BLOCK
      ?auto_45509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45504 ?auto_45505 ) ) ( not ( = ?auto_45504 ?auto_45506 ) ) ( not ( = ?auto_45504 ?auto_45507 ) ) ( not ( = ?auto_45504 ?auto_45508 ) ) ( not ( = ?auto_45505 ?auto_45506 ) ) ( not ( = ?auto_45505 ?auto_45507 ) ) ( not ( = ?auto_45505 ?auto_45508 ) ) ( not ( = ?auto_45506 ?auto_45507 ) ) ( not ( = ?auto_45506 ?auto_45508 ) ) ( not ( = ?auto_45507 ?auto_45508 ) ) ( not ( = ?auto_45504 ?auto_45510 ) ) ( not ( = ?auto_45505 ?auto_45510 ) ) ( not ( = ?auto_45506 ?auto_45510 ) ) ( not ( = ?auto_45507 ?auto_45510 ) ) ( not ( = ?auto_45508 ?auto_45510 ) ) ( ON ?auto_45504 ?auto_45509 ) ( not ( = ?auto_45504 ?auto_45509 ) ) ( not ( = ?auto_45505 ?auto_45509 ) ) ( not ( = ?auto_45506 ?auto_45509 ) ) ( not ( = ?auto_45507 ?auto_45509 ) ) ( not ( = ?auto_45508 ?auto_45509 ) ) ( not ( = ?auto_45510 ?auto_45509 ) ) ( ON ?auto_45505 ?auto_45504 ) ( ON-TABLE ?auto_45509 ) ( ON ?auto_45506 ?auto_45505 ) ( ON ?auto_45507 ?auto_45506 ) ( ON ?auto_45508 ?auto_45507 ) ( CLEAR ?auto_45508 ) ( HOLDING ?auto_45510 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45510 )
      ( MAKE-5PILE ?auto_45504 ?auto_45505 ?auto_45506 ?auto_45507 ?auto_45508 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_45511 - BLOCK
      ?auto_45512 - BLOCK
      ?auto_45513 - BLOCK
      ?auto_45514 - BLOCK
      ?auto_45515 - BLOCK
    )
    :vars
    (
      ?auto_45517 - BLOCK
      ?auto_45516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45511 ?auto_45512 ) ) ( not ( = ?auto_45511 ?auto_45513 ) ) ( not ( = ?auto_45511 ?auto_45514 ) ) ( not ( = ?auto_45511 ?auto_45515 ) ) ( not ( = ?auto_45512 ?auto_45513 ) ) ( not ( = ?auto_45512 ?auto_45514 ) ) ( not ( = ?auto_45512 ?auto_45515 ) ) ( not ( = ?auto_45513 ?auto_45514 ) ) ( not ( = ?auto_45513 ?auto_45515 ) ) ( not ( = ?auto_45514 ?auto_45515 ) ) ( not ( = ?auto_45511 ?auto_45517 ) ) ( not ( = ?auto_45512 ?auto_45517 ) ) ( not ( = ?auto_45513 ?auto_45517 ) ) ( not ( = ?auto_45514 ?auto_45517 ) ) ( not ( = ?auto_45515 ?auto_45517 ) ) ( ON ?auto_45511 ?auto_45516 ) ( not ( = ?auto_45511 ?auto_45516 ) ) ( not ( = ?auto_45512 ?auto_45516 ) ) ( not ( = ?auto_45513 ?auto_45516 ) ) ( not ( = ?auto_45514 ?auto_45516 ) ) ( not ( = ?auto_45515 ?auto_45516 ) ) ( not ( = ?auto_45517 ?auto_45516 ) ) ( ON ?auto_45512 ?auto_45511 ) ( ON-TABLE ?auto_45516 ) ( ON ?auto_45513 ?auto_45512 ) ( ON ?auto_45514 ?auto_45513 ) ( ON ?auto_45515 ?auto_45514 ) ( ON ?auto_45517 ?auto_45515 ) ( CLEAR ?auto_45517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45516 ?auto_45511 ?auto_45512 ?auto_45513 ?auto_45514 ?auto_45515 )
      ( MAKE-5PILE ?auto_45511 ?auto_45512 ?auto_45513 ?auto_45514 ?auto_45515 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45530 - BLOCK
      ?auto_45531 - BLOCK
      ?auto_45532 - BLOCK
      ?auto_45533 - BLOCK
      ?auto_45534 - BLOCK
      ?auto_45535 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_45534 ) ( ON-TABLE ?auto_45530 ) ( ON ?auto_45531 ?auto_45530 ) ( ON ?auto_45532 ?auto_45531 ) ( ON ?auto_45533 ?auto_45532 ) ( ON ?auto_45534 ?auto_45533 ) ( not ( = ?auto_45530 ?auto_45531 ) ) ( not ( = ?auto_45530 ?auto_45532 ) ) ( not ( = ?auto_45530 ?auto_45533 ) ) ( not ( = ?auto_45530 ?auto_45534 ) ) ( not ( = ?auto_45530 ?auto_45535 ) ) ( not ( = ?auto_45531 ?auto_45532 ) ) ( not ( = ?auto_45531 ?auto_45533 ) ) ( not ( = ?auto_45531 ?auto_45534 ) ) ( not ( = ?auto_45531 ?auto_45535 ) ) ( not ( = ?auto_45532 ?auto_45533 ) ) ( not ( = ?auto_45532 ?auto_45534 ) ) ( not ( = ?auto_45532 ?auto_45535 ) ) ( not ( = ?auto_45533 ?auto_45534 ) ) ( not ( = ?auto_45533 ?auto_45535 ) ) ( not ( = ?auto_45534 ?auto_45535 ) ) ( ON-TABLE ?auto_45535 ) ( CLEAR ?auto_45535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_45535 )
      ( MAKE-6PILE ?auto_45530 ?auto_45531 ?auto_45532 ?auto_45533 ?auto_45534 ?auto_45535 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45536 - BLOCK
      ?auto_45537 - BLOCK
      ?auto_45538 - BLOCK
      ?auto_45539 - BLOCK
      ?auto_45540 - BLOCK
      ?auto_45541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45536 ) ( ON ?auto_45537 ?auto_45536 ) ( ON ?auto_45538 ?auto_45537 ) ( ON ?auto_45539 ?auto_45538 ) ( not ( = ?auto_45536 ?auto_45537 ) ) ( not ( = ?auto_45536 ?auto_45538 ) ) ( not ( = ?auto_45536 ?auto_45539 ) ) ( not ( = ?auto_45536 ?auto_45540 ) ) ( not ( = ?auto_45536 ?auto_45541 ) ) ( not ( = ?auto_45537 ?auto_45538 ) ) ( not ( = ?auto_45537 ?auto_45539 ) ) ( not ( = ?auto_45537 ?auto_45540 ) ) ( not ( = ?auto_45537 ?auto_45541 ) ) ( not ( = ?auto_45538 ?auto_45539 ) ) ( not ( = ?auto_45538 ?auto_45540 ) ) ( not ( = ?auto_45538 ?auto_45541 ) ) ( not ( = ?auto_45539 ?auto_45540 ) ) ( not ( = ?auto_45539 ?auto_45541 ) ) ( not ( = ?auto_45540 ?auto_45541 ) ) ( ON-TABLE ?auto_45541 ) ( CLEAR ?auto_45541 ) ( HOLDING ?auto_45540 ) ( CLEAR ?auto_45539 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45536 ?auto_45537 ?auto_45538 ?auto_45539 ?auto_45540 )
      ( MAKE-6PILE ?auto_45536 ?auto_45537 ?auto_45538 ?auto_45539 ?auto_45540 ?auto_45541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45542 - BLOCK
      ?auto_45543 - BLOCK
      ?auto_45544 - BLOCK
      ?auto_45545 - BLOCK
      ?auto_45546 - BLOCK
      ?auto_45547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45542 ) ( ON ?auto_45543 ?auto_45542 ) ( ON ?auto_45544 ?auto_45543 ) ( ON ?auto_45545 ?auto_45544 ) ( not ( = ?auto_45542 ?auto_45543 ) ) ( not ( = ?auto_45542 ?auto_45544 ) ) ( not ( = ?auto_45542 ?auto_45545 ) ) ( not ( = ?auto_45542 ?auto_45546 ) ) ( not ( = ?auto_45542 ?auto_45547 ) ) ( not ( = ?auto_45543 ?auto_45544 ) ) ( not ( = ?auto_45543 ?auto_45545 ) ) ( not ( = ?auto_45543 ?auto_45546 ) ) ( not ( = ?auto_45543 ?auto_45547 ) ) ( not ( = ?auto_45544 ?auto_45545 ) ) ( not ( = ?auto_45544 ?auto_45546 ) ) ( not ( = ?auto_45544 ?auto_45547 ) ) ( not ( = ?auto_45545 ?auto_45546 ) ) ( not ( = ?auto_45545 ?auto_45547 ) ) ( not ( = ?auto_45546 ?auto_45547 ) ) ( ON-TABLE ?auto_45547 ) ( CLEAR ?auto_45545 ) ( ON ?auto_45546 ?auto_45547 ) ( CLEAR ?auto_45546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45547 )
      ( MAKE-6PILE ?auto_45542 ?auto_45543 ?auto_45544 ?auto_45545 ?auto_45546 ?auto_45547 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45548 - BLOCK
      ?auto_45549 - BLOCK
      ?auto_45550 - BLOCK
      ?auto_45551 - BLOCK
      ?auto_45552 - BLOCK
      ?auto_45553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45548 ) ( ON ?auto_45549 ?auto_45548 ) ( ON ?auto_45550 ?auto_45549 ) ( not ( = ?auto_45548 ?auto_45549 ) ) ( not ( = ?auto_45548 ?auto_45550 ) ) ( not ( = ?auto_45548 ?auto_45551 ) ) ( not ( = ?auto_45548 ?auto_45552 ) ) ( not ( = ?auto_45548 ?auto_45553 ) ) ( not ( = ?auto_45549 ?auto_45550 ) ) ( not ( = ?auto_45549 ?auto_45551 ) ) ( not ( = ?auto_45549 ?auto_45552 ) ) ( not ( = ?auto_45549 ?auto_45553 ) ) ( not ( = ?auto_45550 ?auto_45551 ) ) ( not ( = ?auto_45550 ?auto_45552 ) ) ( not ( = ?auto_45550 ?auto_45553 ) ) ( not ( = ?auto_45551 ?auto_45552 ) ) ( not ( = ?auto_45551 ?auto_45553 ) ) ( not ( = ?auto_45552 ?auto_45553 ) ) ( ON-TABLE ?auto_45553 ) ( ON ?auto_45552 ?auto_45553 ) ( CLEAR ?auto_45552 ) ( HOLDING ?auto_45551 ) ( CLEAR ?auto_45550 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45548 ?auto_45549 ?auto_45550 ?auto_45551 )
      ( MAKE-6PILE ?auto_45548 ?auto_45549 ?auto_45550 ?auto_45551 ?auto_45552 ?auto_45553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45554 - BLOCK
      ?auto_45555 - BLOCK
      ?auto_45556 - BLOCK
      ?auto_45557 - BLOCK
      ?auto_45558 - BLOCK
      ?auto_45559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45554 ) ( ON ?auto_45555 ?auto_45554 ) ( ON ?auto_45556 ?auto_45555 ) ( not ( = ?auto_45554 ?auto_45555 ) ) ( not ( = ?auto_45554 ?auto_45556 ) ) ( not ( = ?auto_45554 ?auto_45557 ) ) ( not ( = ?auto_45554 ?auto_45558 ) ) ( not ( = ?auto_45554 ?auto_45559 ) ) ( not ( = ?auto_45555 ?auto_45556 ) ) ( not ( = ?auto_45555 ?auto_45557 ) ) ( not ( = ?auto_45555 ?auto_45558 ) ) ( not ( = ?auto_45555 ?auto_45559 ) ) ( not ( = ?auto_45556 ?auto_45557 ) ) ( not ( = ?auto_45556 ?auto_45558 ) ) ( not ( = ?auto_45556 ?auto_45559 ) ) ( not ( = ?auto_45557 ?auto_45558 ) ) ( not ( = ?auto_45557 ?auto_45559 ) ) ( not ( = ?auto_45558 ?auto_45559 ) ) ( ON-TABLE ?auto_45559 ) ( ON ?auto_45558 ?auto_45559 ) ( CLEAR ?auto_45556 ) ( ON ?auto_45557 ?auto_45558 ) ( CLEAR ?auto_45557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45559 ?auto_45558 )
      ( MAKE-6PILE ?auto_45554 ?auto_45555 ?auto_45556 ?auto_45557 ?auto_45558 ?auto_45559 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45560 - BLOCK
      ?auto_45561 - BLOCK
      ?auto_45562 - BLOCK
      ?auto_45563 - BLOCK
      ?auto_45564 - BLOCK
      ?auto_45565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45560 ) ( ON ?auto_45561 ?auto_45560 ) ( not ( = ?auto_45560 ?auto_45561 ) ) ( not ( = ?auto_45560 ?auto_45562 ) ) ( not ( = ?auto_45560 ?auto_45563 ) ) ( not ( = ?auto_45560 ?auto_45564 ) ) ( not ( = ?auto_45560 ?auto_45565 ) ) ( not ( = ?auto_45561 ?auto_45562 ) ) ( not ( = ?auto_45561 ?auto_45563 ) ) ( not ( = ?auto_45561 ?auto_45564 ) ) ( not ( = ?auto_45561 ?auto_45565 ) ) ( not ( = ?auto_45562 ?auto_45563 ) ) ( not ( = ?auto_45562 ?auto_45564 ) ) ( not ( = ?auto_45562 ?auto_45565 ) ) ( not ( = ?auto_45563 ?auto_45564 ) ) ( not ( = ?auto_45563 ?auto_45565 ) ) ( not ( = ?auto_45564 ?auto_45565 ) ) ( ON-TABLE ?auto_45565 ) ( ON ?auto_45564 ?auto_45565 ) ( ON ?auto_45563 ?auto_45564 ) ( CLEAR ?auto_45563 ) ( HOLDING ?auto_45562 ) ( CLEAR ?auto_45561 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45560 ?auto_45561 ?auto_45562 )
      ( MAKE-6PILE ?auto_45560 ?auto_45561 ?auto_45562 ?auto_45563 ?auto_45564 ?auto_45565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45566 - BLOCK
      ?auto_45567 - BLOCK
      ?auto_45568 - BLOCK
      ?auto_45569 - BLOCK
      ?auto_45570 - BLOCK
      ?auto_45571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45566 ) ( ON ?auto_45567 ?auto_45566 ) ( not ( = ?auto_45566 ?auto_45567 ) ) ( not ( = ?auto_45566 ?auto_45568 ) ) ( not ( = ?auto_45566 ?auto_45569 ) ) ( not ( = ?auto_45566 ?auto_45570 ) ) ( not ( = ?auto_45566 ?auto_45571 ) ) ( not ( = ?auto_45567 ?auto_45568 ) ) ( not ( = ?auto_45567 ?auto_45569 ) ) ( not ( = ?auto_45567 ?auto_45570 ) ) ( not ( = ?auto_45567 ?auto_45571 ) ) ( not ( = ?auto_45568 ?auto_45569 ) ) ( not ( = ?auto_45568 ?auto_45570 ) ) ( not ( = ?auto_45568 ?auto_45571 ) ) ( not ( = ?auto_45569 ?auto_45570 ) ) ( not ( = ?auto_45569 ?auto_45571 ) ) ( not ( = ?auto_45570 ?auto_45571 ) ) ( ON-TABLE ?auto_45571 ) ( ON ?auto_45570 ?auto_45571 ) ( ON ?auto_45569 ?auto_45570 ) ( CLEAR ?auto_45567 ) ( ON ?auto_45568 ?auto_45569 ) ( CLEAR ?auto_45568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45571 ?auto_45570 ?auto_45569 )
      ( MAKE-6PILE ?auto_45566 ?auto_45567 ?auto_45568 ?auto_45569 ?auto_45570 ?auto_45571 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45572 - BLOCK
      ?auto_45573 - BLOCK
      ?auto_45574 - BLOCK
      ?auto_45575 - BLOCK
      ?auto_45576 - BLOCK
      ?auto_45577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45572 ) ( not ( = ?auto_45572 ?auto_45573 ) ) ( not ( = ?auto_45572 ?auto_45574 ) ) ( not ( = ?auto_45572 ?auto_45575 ) ) ( not ( = ?auto_45572 ?auto_45576 ) ) ( not ( = ?auto_45572 ?auto_45577 ) ) ( not ( = ?auto_45573 ?auto_45574 ) ) ( not ( = ?auto_45573 ?auto_45575 ) ) ( not ( = ?auto_45573 ?auto_45576 ) ) ( not ( = ?auto_45573 ?auto_45577 ) ) ( not ( = ?auto_45574 ?auto_45575 ) ) ( not ( = ?auto_45574 ?auto_45576 ) ) ( not ( = ?auto_45574 ?auto_45577 ) ) ( not ( = ?auto_45575 ?auto_45576 ) ) ( not ( = ?auto_45575 ?auto_45577 ) ) ( not ( = ?auto_45576 ?auto_45577 ) ) ( ON-TABLE ?auto_45577 ) ( ON ?auto_45576 ?auto_45577 ) ( ON ?auto_45575 ?auto_45576 ) ( ON ?auto_45574 ?auto_45575 ) ( CLEAR ?auto_45574 ) ( HOLDING ?auto_45573 ) ( CLEAR ?auto_45572 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45572 ?auto_45573 )
      ( MAKE-6PILE ?auto_45572 ?auto_45573 ?auto_45574 ?auto_45575 ?auto_45576 ?auto_45577 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45578 - BLOCK
      ?auto_45579 - BLOCK
      ?auto_45580 - BLOCK
      ?auto_45581 - BLOCK
      ?auto_45582 - BLOCK
      ?auto_45583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_45578 ) ( not ( = ?auto_45578 ?auto_45579 ) ) ( not ( = ?auto_45578 ?auto_45580 ) ) ( not ( = ?auto_45578 ?auto_45581 ) ) ( not ( = ?auto_45578 ?auto_45582 ) ) ( not ( = ?auto_45578 ?auto_45583 ) ) ( not ( = ?auto_45579 ?auto_45580 ) ) ( not ( = ?auto_45579 ?auto_45581 ) ) ( not ( = ?auto_45579 ?auto_45582 ) ) ( not ( = ?auto_45579 ?auto_45583 ) ) ( not ( = ?auto_45580 ?auto_45581 ) ) ( not ( = ?auto_45580 ?auto_45582 ) ) ( not ( = ?auto_45580 ?auto_45583 ) ) ( not ( = ?auto_45581 ?auto_45582 ) ) ( not ( = ?auto_45581 ?auto_45583 ) ) ( not ( = ?auto_45582 ?auto_45583 ) ) ( ON-TABLE ?auto_45583 ) ( ON ?auto_45582 ?auto_45583 ) ( ON ?auto_45581 ?auto_45582 ) ( ON ?auto_45580 ?auto_45581 ) ( CLEAR ?auto_45578 ) ( ON ?auto_45579 ?auto_45580 ) ( CLEAR ?auto_45579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45583 ?auto_45582 ?auto_45581 ?auto_45580 )
      ( MAKE-6PILE ?auto_45578 ?auto_45579 ?auto_45580 ?auto_45581 ?auto_45582 ?auto_45583 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45584 - BLOCK
      ?auto_45585 - BLOCK
      ?auto_45586 - BLOCK
      ?auto_45587 - BLOCK
      ?auto_45588 - BLOCK
      ?auto_45589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45584 ?auto_45585 ) ) ( not ( = ?auto_45584 ?auto_45586 ) ) ( not ( = ?auto_45584 ?auto_45587 ) ) ( not ( = ?auto_45584 ?auto_45588 ) ) ( not ( = ?auto_45584 ?auto_45589 ) ) ( not ( = ?auto_45585 ?auto_45586 ) ) ( not ( = ?auto_45585 ?auto_45587 ) ) ( not ( = ?auto_45585 ?auto_45588 ) ) ( not ( = ?auto_45585 ?auto_45589 ) ) ( not ( = ?auto_45586 ?auto_45587 ) ) ( not ( = ?auto_45586 ?auto_45588 ) ) ( not ( = ?auto_45586 ?auto_45589 ) ) ( not ( = ?auto_45587 ?auto_45588 ) ) ( not ( = ?auto_45587 ?auto_45589 ) ) ( not ( = ?auto_45588 ?auto_45589 ) ) ( ON-TABLE ?auto_45589 ) ( ON ?auto_45588 ?auto_45589 ) ( ON ?auto_45587 ?auto_45588 ) ( ON ?auto_45586 ?auto_45587 ) ( ON ?auto_45585 ?auto_45586 ) ( CLEAR ?auto_45585 ) ( HOLDING ?auto_45584 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45584 )
      ( MAKE-6PILE ?auto_45584 ?auto_45585 ?auto_45586 ?auto_45587 ?auto_45588 ?auto_45589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45590 - BLOCK
      ?auto_45591 - BLOCK
      ?auto_45592 - BLOCK
      ?auto_45593 - BLOCK
      ?auto_45594 - BLOCK
      ?auto_45595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45590 ?auto_45591 ) ) ( not ( = ?auto_45590 ?auto_45592 ) ) ( not ( = ?auto_45590 ?auto_45593 ) ) ( not ( = ?auto_45590 ?auto_45594 ) ) ( not ( = ?auto_45590 ?auto_45595 ) ) ( not ( = ?auto_45591 ?auto_45592 ) ) ( not ( = ?auto_45591 ?auto_45593 ) ) ( not ( = ?auto_45591 ?auto_45594 ) ) ( not ( = ?auto_45591 ?auto_45595 ) ) ( not ( = ?auto_45592 ?auto_45593 ) ) ( not ( = ?auto_45592 ?auto_45594 ) ) ( not ( = ?auto_45592 ?auto_45595 ) ) ( not ( = ?auto_45593 ?auto_45594 ) ) ( not ( = ?auto_45593 ?auto_45595 ) ) ( not ( = ?auto_45594 ?auto_45595 ) ) ( ON-TABLE ?auto_45595 ) ( ON ?auto_45594 ?auto_45595 ) ( ON ?auto_45593 ?auto_45594 ) ( ON ?auto_45592 ?auto_45593 ) ( ON ?auto_45591 ?auto_45592 ) ( ON ?auto_45590 ?auto_45591 ) ( CLEAR ?auto_45590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45595 ?auto_45594 ?auto_45593 ?auto_45592 ?auto_45591 )
      ( MAKE-6PILE ?auto_45590 ?auto_45591 ?auto_45592 ?auto_45593 ?auto_45594 ?auto_45595 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45602 - BLOCK
      ?auto_45603 - BLOCK
      ?auto_45604 - BLOCK
      ?auto_45605 - BLOCK
      ?auto_45606 - BLOCK
      ?auto_45607 - BLOCK
    )
    :vars
    (
      ?auto_45608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45602 ?auto_45603 ) ) ( not ( = ?auto_45602 ?auto_45604 ) ) ( not ( = ?auto_45602 ?auto_45605 ) ) ( not ( = ?auto_45602 ?auto_45606 ) ) ( not ( = ?auto_45602 ?auto_45607 ) ) ( not ( = ?auto_45603 ?auto_45604 ) ) ( not ( = ?auto_45603 ?auto_45605 ) ) ( not ( = ?auto_45603 ?auto_45606 ) ) ( not ( = ?auto_45603 ?auto_45607 ) ) ( not ( = ?auto_45604 ?auto_45605 ) ) ( not ( = ?auto_45604 ?auto_45606 ) ) ( not ( = ?auto_45604 ?auto_45607 ) ) ( not ( = ?auto_45605 ?auto_45606 ) ) ( not ( = ?auto_45605 ?auto_45607 ) ) ( not ( = ?auto_45606 ?auto_45607 ) ) ( ON-TABLE ?auto_45607 ) ( ON ?auto_45606 ?auto_45607 ) ( ON ?auto_45605 ?auto_45606 ) ( ON ?auto_45604 ?auto_45605 ) ( ON ?auto_45603 ?auto_45604 ) ( CLEAR ?auto_45603 ) ( ON ?auto_45602 ?auto_45608 ) ( CLEAR ?auto_45602 ) ( HAND-EMPTY ) ( not ( = ?auto_45602 ?auto_45608 ) ) ( not ( = ?auto_45603 ?auto_45608 ) ) ( not ( = ?auto_45604 ?auto_45608 ) ) ( not ( = ?auto_45605 ?auto_45608 ) ) ( not ( = ?auto_45606 ?auto_45608 ) ) ( not ( = ?auto_45607 ?auto_45608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_45602 ?auto_45608 )
      ( MAKE-6PILE ?auto_45602 ?auto_45603 ?auto_45604 ?auto_45605 ?auto_45606 ?auto_45607 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45609 - BLOCK
      ?auto_45610 - BLOCK
      ?auto_45611 - BLOCK
      ?auto_45612 - BLOCK
      ?auto_45613 - BLOCK
      ?auto_45614 - BLOCK
    )
    :vars
    (
      ?auto_45615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45609 ?auto_45610 ) ) ( not ( = ?auto_45609 ?auto_45611 ) ) ( not ( = ?auto_45609 ?auto_45612 ) ) ( not ( = ?auto_45609 ?auto_45613 ) ) ( not ( = ?auto_45609 ?auto_45614 ) ) ( not ( = ?auto_45610 ?auto_45611 ) ) ( not ( = ?auto_45610 ?auto_45612 ) ) ( not ( = ?auto_45610 ?auto_45613 ) ) ( not ( = ?auto_45610 ?auto_45614 ) ) ( not ( = ?auto_45611 ?auto_45612 ) ) ( not ( = ?auto_45611 ?auto_45613 ) ) ( not ( = ?auto_45611 ?auto_45614 ) ) ( not ( = ?auto_45612 ?auto_45613 ) ) ( not ( = ?auto_45612 ?auto_45614 ) ) ( not ( = ?auto_45613 ?auto_45614 ) ) ( ON-TABLE ?auto_45614 ) ( ON ?auto_45613 ?auto_45614 ) ( ON ?auto_45612 ?auto_45613 ) ( ON ?auto_45611 ?auto_45612 ) ( ON ?auto_45609 ?auto_45615 ) ( CLEAR ?auto_45609 ) ( not ( = ?auto_45609 ?auto_45615 ) ) ( not ( = ?auto_45610 ?auto_45615 ) ) ( not ( = ?auto_45611 ?auto_45615 ) ) ( not ( = ?auto_45612 ?auto_45615 ) ) ( not ( = ?auto_45613 ?auto_45615 ) ) ( not ( = ?auto_45614 ?auto_45615 ) ) ( HOLDING ?auto_45610 ) ( CLEAR ?auto_45611 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45614 ?auto_45613 ?auto_45612 ?auto_45611 ?auto_45610 )
      ( MAKE-6PILE ?auto_45609 ?auto_45610 ?auto_45611 ?auto_45612 ?auto_45613 ?auto_45614 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45616 - BLOCK
      ?auto_45617 - BLOCK
      ?auto_45618 - BLOCK
      ?auto_45619 - BLOCK
      ?auto_45620 - BLOCK
      ?auto_45621 - BLOCK
    )
    :vars
    (
      ?auto_45622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45616 ?auto_45617 ) ) ( not ( = ?auto_45616 ?auto_45618 ) ) ( not ( = ?auto_45616 ?auto_45619 ) ) ( not ( = ?auto_45616 ?auto_45620 ) ) ( not ( = ?auto_45616 ?auto_45621 ) ) ( not ( = ?auto_45617 ?auto_45618 ) ) ( not ( = ?auto_45617 ?auto_45619 ) ) ( not ( = ?auto_45617 ?auto_45620 ) ) ( not ( = ?auto_45617 ?auto_45621 ) ) ( not ( = ?auto_45618 ?auto_45619 ) ) ( not ( = ?auto_45618 ?auto_45620 ) ) ( not ( = ?auto_45618 ?auto_45621 ) ) ( not ( = ?auto_45619 ?auto_45620 ) ) ( not ( = ?auto_45619 ?auto_45621 ) ) ( not ( = ?auto_45620 ?auto_45621 ) ) ( ON-TABLE ?auto_45621 ) ( ON ?auto_45620 ?auto_45621 ) ( ON ?auto_45619 ?auto_45620 ) ( ON ?auto_45618 ?auto_45619 ) ( ON ?auto_45616 ?auto_45622 ) ( not ( = ?auto_45616 ?auto_45622 ) ) ( not ( = ?auto_45617 ?auto_45622 ) ) ( not ( = ?auto_45618 ?auto_45622 ) ) ( not ( = ?auto_45619 ?auto_45622 ) ) ( not ( = ?auto_45620 ?auto_45622 ) ) ( not ( = ?auto_45621 ?auto_45622 ) ) ( CLEAR ?auto_45618 ) ( ON ?auto_45617 ?auto_45616 ) ( CLEAR ?auto_45617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_45622 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45622 ?auto_45616 )
      ( MAKE-6PILE ?auto_45616 ?auto_45617 ?auto_45618 ?auto_45619 ?auto_45620 ?auto_45621 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45623 - BLOCK
      ?auto_45624 - BLOCK
      ?auto_45625 - BLOCK
      ?auto_45626 - BLOCK
      ?auto_45627 - BLOCK
      ?auto_45628 - BLOCK
    )
    :vars
    (
      ?auto_45629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45623 ?auto_45624 ) ) ( not ( = ?auto_45623 ?auto_45625 ) ) ( not ( = ?auto_45623 ?auto_45626 ) ) ( not ( = ?auto_45623 ?auto_45627 ) ) ( not ( = ?auto_45623 ?auto_45628 ) ) ( not ( = ?auto_45624 ?auto_45625 ) ) ( not ( = ?auto_45624 ?auto_45626 ) ) ( not ( = ?auto_45624 ?auto_45627 ) ) ( not ( = ?auto_45624 ?auto_45628 ) ) ( not ( = ?auto_45625 ?auto_45626 ) ) ( not ( = ?auto_45625 ?auto_45627 ) ) ( not ( = ?auto_45625 ?auto_45628 ) ) ( not ( = ?auto_45626 ?auto_45627 ) ) ( not ( = ?auto_45626 ?auto_45628 ) ) ( not ( = ?auto_45627 ?auto_45628 ) ) ( ON-TABLE ?auto_45628 ) ( ON ?auto_45627 ?auto_45628 ) ( ON ?auto_45626 ?auto_45627 ) ( ON ?auto_45623 ?auto_45629 ) ( not ( = ?auto_45623 ?auto_45629 ) ) ( not ( = ?auto_45624 ?auto_45629 ) ) ( not ( = ?auto_45625 ?auto_45629 ) ) ( not ( = ?auto_45626 ?auto_45629 ) ) ( not ( = ?auto_45627 ?auto_45629 ) ) ( not ( = ?auto_45628 ?auto_45629 ) ) ( ON ?auto_45624 ?auto_45623 ) ( CLEAR ?auto_45624 ) ( ON-TABLE ?auto_45629 ) ( HOLDING ?auto_45625 ) ( CLEAR ?auto_45626 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45628 ?auto_45627 ?auto_45626 ?auto_45625 )
      ( MAKE-6PILE ?auto_45623 ?auto_45624 ?auto_45625 ?auto_45626 ?auto_45627 ?auto_45628 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45630 - BLOCK
      ?auto_45631 - BLOCK
      ?auto_45632 - BLOCK
      ?auto_45633 - BLOCK
      ?auto_45634 - BLOCK
      ?auto_45635 - BLOCK
    )
    :vars
    (
      ?auto_45636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45630 ?auto_45631 ) ) ( not ( = ?auto_45630 ?auto_45632 ) ) ( not ( = ?auto_45630 ?auto_45633 ) ) ( not ( = ?auto_45630 ?auto_45634 ) ) ( not ( = ?auto_45630 ?auto_45635 ) ) ( not ( = ?auto_45631 ?auto_45632 ) ) ( not ( = ?auto_45631 ?auto_45633 ) ) ( not ( = ?auto_45631 ?auto_45634 ) ) ( not ( = ?auto_45631 ?auto_45635 ) ) ( not ( = ?auto_45632 ?auto_45633 ) ) ( not ( = ?auto_45632 ?auto_45634 ) ) ( not ( = ?auto_45632 ?auto_45635 ) ) ( not ( = ?auto_45633 ?auto_45634 ) ) ( not ( = ?auto_45633 ?auto_45635 ) ) ( not ( = ?auto_45634 ?auto_45635 ) ) ( ON-TABLE ?auto_45635 ) ( ON ?auto_45634 ?auto_45635 ) ( ON ?auto_45633 ?auto_45634 ) ( ON ?auto_45630 ?auto_45636 ) ( not ( = ?auto_45630 ?auto_45636 ) ) ( not ( = ?auto_45631 ?auto_45636 ) ) ( not ( = ?auto_45632 ?auto_45636 ) ) ( not ( = ?auto_45633 ?auto_45636 ) ) ( not ( = ?auto_45634 ?auto_45636 ) ) ( not ( = ?auto_45635 ?auto_45636 ) ) ( ON ?auto_45631 ?auto_45630 ) ( ON-TABLE ?auto_45636 ) ( CLEAR ?auto_45633 ) ( ON ?auto_45632 ?auto_45631 ) ( CLEAR ?auto_45632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45636 ?auto_45630 ?auto_45631 )
      ( MAKE-6PILE ?auto_45630 ?auto_45631 ?auto_45632 ?auto_45633 ?auto_45634 ?auto_45635 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45637 - BLOCK
      ?auto_45638 - BLOCK
      ?auto_45639 - BLOCK
      ?auto_45640 - BLOCK
      ?auto_45641 - BLOCK
      ?auto_45642 - BLOCK
    )
    :vars
    (
      ?auto_45643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45637 ?auto_45638 ) ) ( not ( = ?auto_45637 ?auto_45639 ) ) ( not ( = ?auto_45637 ?auto_45640 ) ) ( not ( = ?auto_45637 ?auto_45641 ) ) ( not ( = ?auto_45637 ?auto_45642 ) ) ( not ( = ?auto_45638 ?auto_45639 ) ) ( not ( = ?auto_45638 ?auto_45640 ) ) ( not ( = ?auto_45638 ?auto_45641 ) ) ( not ( = ?auto_45638 ?auto_45642 ) ) ( not ( = ?auto_45639 ?auto_45640 ) ) ( not ( = ?auto_45639 ?auto_45641 ) ) ( not ( = ?auto_45639 ?auto_45642 ) ) ( not ( = ?auto_45640 ?auto_45641 ) ) ( not ( = ?auto_45640 ?auto_45642 ) ) ( not ( = ?auto_45641 ?auto_45642 ) ) ( ON-TABLE ?auto_45642 ) ( ON ?auto_45641 ?auto_45642 ) ( ON ?auto_45637 ?auto_45643 ) ( not ( = ?auto_45637 ?auto_45643 ) ) ( not ( = ?auto_45638 ?auto_45643 ) ) ( not ( = ?auto_45639 ?auto_45643 ) ) ( not ( = ?auto_45640 ?auto_45643 ) ) ( not ( = ?auto_45641 ?auto_45643 ) ) ( not ( = ?auto_45642 ?auto_45643 ) ) ( ON ?auto_45638 ?auto_45637 ) ( ON-TABLE ?auto_45643 ) ( ON ?auto_45639 ?auto_45638 ) ( CLEAR ?auto_45639 ) ( HOLDING ?auto_45640 ) ( CLEAR ?auto_45641 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_45642 ?auto_45641 ?auto_45640 )
      ( MAKE-6PILE ?auto_45637 ?auto_45638 ?auto_45639 ?auto_45640 ?auto_45641 ?auto_45642 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45644 - BLOCK
      ?auto_45645 - BLOCK
      ?auto_45646 - BLOCK
      ?auto_45647 - BLOCK
      ?auto_45648 - BLOCK
      ?auto_45649 - BLOCK
    )
    :vars
    (
      ?auto_45650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45644 ?auto_45645 ) ) ( not ( = ?auto_45644 ?auto_45646 ) ) ( not ( = ?auto_45644 ?auto_45647 ) ) ( not ( = ?auto_45644 ?auto_45648 ) ) ( not ( = ?auto_45644 ?auto_45649 ) ) ( not ( = ?auto_45645 ?auto_45646 ) ) ( not ( = ?auto_45645 ?auto_45647 ) ) ( not ( = ?auto_45645 ?auto_45648 ) ) ( not ( = ?auto_45645 ?auto_45649 ) ) ( not ( = ?auto_45646 ?auto_45647 ) ) ( not ( = ?auto_45646 ?auto_45648 ) ) ( not ( = ?auto_45646 ?auto_45649 ) ) ( not ( = ?auto_45647 ?auto_45648 ) ) ( not ( = ?auto_45647 ?auto_45649 ) ) ( not ( = ?auto_45648 ?auto_45649 ) ) ( ON-TABLE ?auto_45649 ) ( ON ?auto_45648 ?auto_45649 ) ( ON ?auto_45644 ?auto_45650 ) ( not ( = ?auto_45644 ?auto_45650 ) ) ( not ( = ?auto_45645 ?auto_45650 ) ) ( not ( = ?auto_45646 ?auto_45650 ) ) ( not ( = ?auto_45647 ?auto_45650 ) ) ( not ( = ?auto_45648 ?auto_45650 ) ) ( not ( = ?auto_45649 ?auto_45650 ) ) ( ON ?auto_45645 ?auto_45644 ) ( ON-TABLE ?auto_45650 ) ( ON ?auto_45646 ?auto_45645 ) ( CLEAR ?auto_45648 ) ( ON ?auto_45647 ?auto_45646 ) ( CLEAR ?auto_45647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_45650 ?auto_45644 ?auto_45645 ?auto_45646 )
      ( MAKE-6PILE ?auto_45644 ?auto_45645 ?auto_45646 ?auto_45647 ?auto_45648 ?auto_45649 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45651 - BLOCK
      ?auto_45652 - BLOCK
      ?auto_45653 - BLOCK
      ?auto_45654 - BLOCK
      ?auto_45655 - BLOCK
      ?auto_45656 - BLOCK
    )
    :vars
    (
      ?auto_45657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45651 ?auto_45652 ) ) ( not ( = ?auto_45651 ?auto_45653 ) ) ( not ( = ?auto_45651 ?auto_45654 ) ) ( not ( = ?auto_45651 ?auto_45655 ) ) ( not ( = ?auto_45651 ?auto_45656 ) ) ( not ( = ?auto_45652 ?auto_45653 ) ) ( not ( = ?auto_45652 ?auto_45654 ) ) ( not ( = ?auto_45652 ?auto_45655 ) ) ( not ( = ?auto_45652 ?auto_45656 ) ) ( not ( = ?auto_45653 ?auto_45654 ) ) ( not ( = ?auto_45653 ?auto_45655 ) ) ( not ( = ?auto_45653 ?auto_45656 ) ) ( not ( = ?auto_45654 ?auto_45655 ) ) ( not ( = ?auto_45654 ?auto_45656 ) ) ( not ( = ?auto_45655 ?auto_45656 ) ) ( ON-TABLE ?auto_45656 ) ( ON ?auto_45651 ?auto_45657 ) ( not ( = ?auto_45651 ?auto_45657 ) ) ( not ( = ?auto_45652 ?auto_45657 ) ) ( not ( = ?auto_45653 ?auto_45657 ) ) ( not ( = ?auto_45654 ?auto_45657 ) ) ( not ( = ?auto_45655 ?auto_45657 ) ) ( not ( = ?auto_45656 ?auto_45657 ) ) ( ON ?auto_45652 ?auto_45651 ) ( ON-TABLE ?auto_45657 ) ( ON ?auto_45653 ?auto_45652 ) ( ON ?auto_45654 ?auto_45653 ) ( CLEAR ?auto_45654 ) ( HOLDING ?auto_45655 ) ( CLEAR ?auto_45656 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_45656 ?auto_45655 )
      ( MAKE-6PILE ?auto_45651 ?auto_45652 ?auto_45653 ?auto_45654 ?auto_45655 ?auto_45656 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45658 - BLOCK
      ?auto_45659 - BLOCK
      ?auto_45660 - BLOCK
      ?auto_45661 - BLOCK
      ?auto_45662 - BLOCK
      ?auto_45663 - BLOCK
    )
    :vars
    (
      ?auto_45664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45658 ?auto_45659 ) ) ( not ( = ?auto_45658 ?auto_45660 ) ) ( not ( = ?auto_45658 ?auto_45661 ) ) ( not ( = ?auto_45658 ?auto_45662 ) ) ( not ( = ?auto_45658 ?auto_45663 ) ) ( not ( = ?auto_45659 ?auto_45660 ) ) ( not ( = ?auto_45659 ?auto_45661 ) ) ( not ( = ?auto_45659 ?auto_45662 ) ) ( not ( = ?auto_45659 ?auto_45663 ) ) ( not ( = ?auto_45660 ?auto_45661 ) ) ( not ( = ?auto_45660 ?auto_45662 ) ) ( not ( = ?auto_45660 ?auto_45663 ) ) ( not ( = ?auto_45661 ?auto_45662 ) ) ( not ( = ?auto_45661 ?auto_45663 ) ) ( not ( = ?auto_45662 ?auto_45663 ) ) ( ON-TABLE ?auto_45663 ) ( ON ?auto_45658 ?auto_45664 ) ( not ( = ?auto_45658 ?auto_45664 ) ) ( not ( = ?auto_45659 ?auto_45664 ) ) ( not ( = ?auto_45660 ?auto_45664 ) ) ( not ( = ?auto_45661 ?auto_45664 ) ) ( not ( = ?auto_45662 ?auto_45664 ) ) ( not ( = ?auto_45663 ?auto_45664 ) ) ( ON ?auto_45659 ?auto_45658 ) ( ON-TABLE ?auto_45664 ) ( ON ?auto_45660 ?auto_45659 ) ( ON ?auto_45661 ?auto_45660 ) ( CLEAR ?auto_45663 ) ( ON ?auto_45662 ?auto_45661 ) ( CLEAR ?auto_45662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_45664 ?auto_45658 ?auto_45659 ?auto_45660 ?auto_45661 )
      ( MAKE-6PILE ?auto_45658 ?auto_45659 ?auto_45660 ?auto_45661 ?auto_45662 ?auto_45663 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45665 - BLOCK
      ?auto_45666 - BLOCK
      ?auto_45667 - BLOCK
      ?auto_45668 - BLOCK
      ?auto_45669 - BLOCK
      ?auto_45670 - BLOCK
    )
    :vars
    (
      ?auto_45671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45665 ?auto_45666 ) ) ( not ( = ?auto_45665 ?auto_45667 ) ) ( not ( = ?auto_45665 ?auto_45668 ) ) ( not ( = ?auto_45665 ?auto_45669 ) ) ( not ( = ?auto_45665 ?auto_45670 ) ) ( not ( = ?auto_45666 ?auto_45667 ) ) ( not ( = ?auto_45666 ?auto_45668 ) ) ( not ( = ?auto_45666 ?auto_45669 ) ) ( not ( = ?auto_45666 ?auto_45670 ) ) ( not ( = ?auto_45667 ?auto_45668 ) ) ( not ( = ?auto_45667 ?auto_45669 ) ) ( not ( = ?auto_45667 ?auto_45670 ) ) ( not ( = ?auto_45668 ?auto_45669 ) ) ( not ( = ?auto_45668 ?auto_45670 ) ) ( not ( = ?auto_45669 ?auto_45670 ) ) ( ON ?auto_45665 ?auto_45671 ) ( not ( = ?auto_45665 ?auto_45671 ) ) ( not ( = ?auto_45666 ?auto_45671 ) ) ( not ( = ?auto_45667 ?auto_45671 ) ) ( not ( = ?auto_45668 ?auto_45671 ) ) ( not ( = ?auto_45669 ?auto_45671 ) ) ( not ( = ?auto_45670 ?auto_45671 ) ) ( ON ?auto_45666 ?auto_45665 ) ( ON-TABLE ?auto_45671 ) ( ON ?auto_45667 ?auto_45666 ) ( ON ?auto_45668 ?auto_45667 ) ( ON ?auto_45669 ?auto_45668 ) ( CLEAR ?auto_45669 ) ( HOLDING ?auto_45670 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_45670 )
      ( MAKE-6PILE ?auto_45665 ?auto_45666 ?auto_45667 ?auto_45668 ?auto_45669 ?auto_45670 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_45672 - BLOCK
      ?auto_45673 - BLOCK
      ?auto_45674 - BLOCK
      ?auto_45675 - BLOCK
      ?auto_45676 - BLOCK
      ?auto_45677 - BLOCK
    )
    :vars
    (
      ?auto_45678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_45672 ?auto_45673 ) ) ( not ( = ?auto_45672 ?auto_45674 ) ) ( not ( = ?auto_45672 ?auto_45675 ) ) ( not ( = ?auto_45672 ?auto_45676 ) ) ( not ( = ?auto_45672 ?auto_45677 ) ) ( not ( = ?auto_45673 ?auto_45674 ) ) ( not ( = ?auto_45673 ?auto_45675 ) ) ( not ( = ?auto_45673 ?auto_45676 ) ) ( not ( = ?auto_45673 ?auto_45677 ) ) ( not ( = ?auto_45674 ?auto_45675 ) ) ( not ( = ?auto_45674 ?auto_45676 ) ) ( not ( = ?auto_45674 ?auto_45677 ) ) ( not ( = ?auto_45675 ?auto_45676 ) ) ( not ( = ?auto_45675 ?auto_45677 ) ) ( not ( = ?auto_45676 ?auto_45677 ) ) ( ON ?auto_45672 ?auto_45678 ) ( not ( = ?auto_45672 ?auto_45678 ) ) ( not ( = ?auto_45673 ?auto_45678 ) ) ( not ( = ?auto_45674 ?auto_45678 ) ) ( not ( = ?auto_45675 ?auto_45678 ) ) ( not ( = ?auto_45676 ?auto_45678 ) ) ( not ( = ?auto_45677 ?auto_45678 ) ) ( ON ?auto_45673 ?auto_45672 ) ( ON-TABLE ?auto_45678 ) ( ON ?auto_45674 ?auto_45673 ) ( ON ?auto_45675 ?auto_45674 ) ( ON ?auto_45676 ?auto_45675 ) ( ON ?auto_45677 ?auto_45676 ) ( CLEAR ?auto_45677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_45678 ?auto_45672 ?auto_45673 ?auto_45674 ?auto_45675 ?auto_45676 )
      ( MAKE-6PILE ?auto_45672 ?auto_45673 ?auto_45674 ?auto_45675 ?auto_45676 ?auto_45677 ) )
  )

)

