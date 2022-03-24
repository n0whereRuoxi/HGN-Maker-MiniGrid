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
      ?auto_38854 - BLOCK
    )
    :vars
    (
      ?auto_38855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38854 ?auto_38855 ) ( CLEAR ?auto_38854 ) ( HAND-EMPTY ) ( not ( = ?auto_38854 ?auto_38855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38854 ?auto_38855 )
      ( !PUTDOWN ?auto_38854 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38861 - BLOCK
      ?auto_38862 - BLOCK
    )
    :vars
    (
      ?auto_38863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38861 ) ( ON ?auto_38862 ?auto_38863 ) ( CLEAR ?auto_38862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38861 ) ( not ( = ?auto_38861 ?auto_38862 ) ) ( not ( = ?auto_38861 ?auto_38863 ) ) ( not ( = ?auto_38862 ?auto_38863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38862 ?auto_38863 )
      ( !STACK ?auto_38862 ?auto_38861 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_38871 - BLOCK
      ?auto_38872 - BLOCK
    )
    :vars
    (
      ?auto_38873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38872 ?auto_38873 ) ( not ( = ?auto_38871 ?auto_38872 ) ) ( not ( = ?auto_38871 ?auto_38873 ) ) ( not ( = ?auto_38872 ?auto_38873 ) ) ( ON ?auto_38871 ?auto_38872 ) ( CLEAR ?auto_38871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38871 )
      ( MAKE-2PILE ?auto_38871 ?auto_38872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38882 - BLOCK
      ?auto_38883 - BLOCK
      ?auto_38884 - BLOCK
    )
    :vars
    (
      ?auto_38885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38883 ) ( ON ?auto_38884 ?auto_38885 ) ( CLEAR ?auto_38884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38882 ) ( ON ?auto_38883 ?auto_38882 ) ( not ( = ?auto_38882 ?auto_38883 ) ) ( not ( = ?auto_38882 ?auto_38884 ) ) ( not ( = ?auto_38882 ?auto_38885 ) ) ( not ( = ?auto_38883 ?auto_38884 ) ) ( not ( = ?auto_38883 ?auto_38885 ) ) ( not ( = ?auto_38884 ?auto_38885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38884 ?auto_38885 )
      ( !STACK ?auto_38884 ?auto_38883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38896 - BLOCK
      ?auto_38897 - BLOCK
      ?auto_38898 - BLOCK
    )
    :vars
    (
      ?auto_38899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38898 ?auto_38899 ) ( ON-TABLE ?auto_38896 ) ( not ( = ?auto_38896 ?auto_38897 ) ) ( not ( = ?auto_38896 ?auto_38898 ) ) ( not ( = ?auto_38896 ?auto_38899 ) ) ( not ( = ?auto_38897 ?auto_38898 ) ) ( not ( = ?auto_38897 ?auto_38899 ) ) ( not ( = ?auto_38898 ?auto_38899 ) ) ( CLEAR ?auto_38896 ) ( ON ?auto_38897 ?auto_38898 ) ( CLEAR ?auto_38897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38896 ?auto_38897 )
      ( MAKE-3PILE ?auto_38896 ?auto_38897 ?auto_38898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_38910 - BLOCK
      ?auto_38911 - BLOCK
      ?auto_38912 - BLOCK
    )
    :vars
    (
      ?auto_38913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38912 ?auto_38913 ) ( not ( = ?auto_38910 ?auto_38911 ) ) ( not ( = ?auto_38910 ?auto_38912 ) ) ( not ( = ?auto_38910 ?auto_38913 ) ) ( not ( = ?auto_38911 ?auto_38912 ) ) ( not ( = ?auto_38911 ?auto_38913 ) ) ( not ( = ?auto_38912 ?auto_38913 ) ) ( ON ?auto_38911 ?auto_38912 ) ( ON ?auto_38910 ?auto_38911 ) ( CLEAR ?auto_38910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38910 )
      ( MAKE-3PILE ?auto_38910 ?auto_38911 ?auto_38912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38925 - BLOCK
      ?auto_38926 - BLOCK
      ?auto_38927 - BLOCK
      ?auto_38928 - BLOCK
    )
    :vars
    (
      ?auto_38929 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_38927 ) ( ON ?auto_38928 ?auto_38929 ) ( CLEAR ?auto_38928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38925 ) ( ON ?auto_38926 ?auto_38925 ) ( ON ?auto_38927 ?auto_38926 ) ( not ( = ?auto_38925 ?auto_38926 ) ) ( not ( = ?auto_38925 ?auto_38927 ) ) ( not ( = ?auto_38925 ?auto_38928 ) ) ( not ( = ?auto_38925 ?auto_38929 ) ) ( not ( = ?auto_38926 ?auto_38927 ) ) ( not ( = ?auto_38926 ?auto_38928 ) ) ( not ( = ?auto_38926 ?auto_38929 ) ) ( not ( = ?auto_38927 ?auto_38928 ) ) ( not ( = ?auto_38927 ?auto_38929 ) ) ( not ( = ?auto_38928 ?auto_38929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38928 ?auto_38929 )
      ( !STACK ?auto_38928 ?auto_38927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38943 - BLOCK
      ?auto_38944 - BLOCK
      ?auto_38945 - BLOCK
      ?auto_38946 - BLOCK
    )
    :vars
    (
      ?auto_38947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38946 ?auto_38947 ) ( ON-TABLE ?auto_38943 ) ( ON ?auto_38944 ?auto_38943 ) ( not ( = ?auto_38943 ?auto_38944 ) ) ( not ( = ?auto_38943 ?auto_38945 ) ) ( not ( = ?auto_38943 ?auto_38946 ) ) ( not ( = ?auto_38943 ?auto_38947 ) ) ( not ( = ?auto_38944 ?auto_38945 ) ) ( not ( = ?auto_38944 ?auto_38946 ) ) ( not ( = ?auto_38944 ?auto_38947 ) ) ( not ( = ?auto_38945 ?auto_38946 ) ) ( not ( = ?auto_38945 ?auto_38947 ) ) ( not ( = ?auto_38946 ?auto_38947 ) ) ( CLEAR ?auto_38944 ) ( ON ?auto_38945 ?auto_38946 ) ( CLEAR ?auto_38945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_38943 ?auto_38944 ?auto_38945 )
      ( MAKE-4PILE ?auto_38943 ?auto_38944 ?auto_38945 ?auto_38946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38961 - BLOCK
      ?auto_38962 - BLOCK
      ?auto_38963 - BLOCK
      ?auto_38964 - BLOCK
    )
    :vars
    (
      ?auto_38965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38964 ?auto_38965 ) ( ON-TABLE ?auto_38961 ) ( not ( = ?auto_38961 ?auto_38962 ) ) ( not ( = ?auto_38961 ?auto_38963 ) ) ( not ( = ?auto_38961 ?auto_38964 ) ) ( not ( = ?auto_38961 ?auto_38965 ) ) ( not ( = ?auto_38962 ?auto_38963 ) ) ( not ( = ?auto_38962 ?auto_38964 ) ) ( not ( = ?auto_38962 ?auto_38965 ) ) ( not ( = ?auto_38963 ?auto_38964 ) ) ( not ( = ?auto_38963 ?auto_38965 ) ) ( not ( = ?auto_38964 ?auto_38965 ) ) ( ON ?auto_38963 ?auto_38964 ) ( CLEAR ?auto_38961 ) ( ON ?auto_38962 ?auto_38963 ) ( CLEAR ?auto_38962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_38961 ?auto_38962 )
      ( MAKE-4PILE ?auto_38961 ?auto_38962 ?auto_38963 ?auto_38964 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_38979 - BLOCK
      ?auto_38980 - BLOCK
      ?auto_38981 - BLOCK
      ?auto_38982 - BLOCK
    )
    :vars
    (
      ?auto_38983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_38982 ?auto_38983 ) ( not ( = ?auto_38979 ?auto_38980 ) ) ( not ( = ?auto_38979 ?auto_38981 ) ) ( not ( = ?auto_38979 ?auto_38982 ) ) ( not ( = ?auto_38979 ?auto_38983 ) ) ( not ( = ?auto_38980 ?auto_38981 ) ) ( not ( = ?auto_38980 ?auto_38982 ) ) ( not ( = ?auto_38980 ?auto_38983 ) ) ( not ( = ?auto_38981 ?auto_38982 ) ) ( not ( = ?auto_38981 ?auto_38983 ) ) ( not ( = ?auto_38982 ?auto_38983 ) ) ( ON ?auto_38981 ?auto_38982 ) ( ON ?auto_38980 ?auto_38981 ) ( ON ?auto_38979 ?auto_38980 ) ( CLEAR ?auto_38979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_38979 )
      ( MAKE-4PILE ?auto_38979 ?auto_38980 ?auto_38981 ?auto_38982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_38998 - BLOCK
      ?auto_38999 - BLOCK
      ?auto_39000 - BLOCK
      ?auto_39001 - BLOCK
      ?auto_39002 - BLOCK
    )
    :vars
    (
      ?auto_39003 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39001 ) ( ON ?auto_39002 ?auto_39003 ) ( CLEAR ?auto_39002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_38998 ) ( ON ?auto_38999 ?auto_38998 ) ( ON ?auto_39000 ?auto_38999 ) ( ON ?auto_39001 ?auto_39000 ) ( not ( = ?auto_38998 ?auto_38999 ) ) ( not ( = ?auto_38998 ?auto_39000 ) ) ( not ( = ?auto_38998 ?auto_39001 ) ) ( not ( = ?auto_38998 ?auto_39002 ) ) ( not ( = ?auto_38998 ?auto_39003 ) ) ( not ( = ?auto_38999 ?auto_39000 ) ) ( not ( = ?auto_38999 ?auto_39001 ) ) ( not ( = ?auto_38999 ?auto_39002 ) ) ( not ( = ?auto_38999 ?auto_39003 ) ) ( not ( = ?auto_39000 ?auto_39001 ) ) ( not ( = ?auto_39000 ?auto_39002 ) ) ( not ( = ?auto_39000 ?auto_39003 ) ) ( not ( = ?auto_39001 ?auto_39002 ) ) ( not ( = ?auto_39001 ?auto_39003 ) ) ( not ( = ?auto_39002 ?auto_39003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39002 ?auto_39003 )
      ( !STACK ?auto_39002 ?auto_39001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39020 - BLOCK
      ?auto_39021 - BLOCK
      ?auto_39022 - BLOCK
      ?auto_39023 - BLOCK
      ?auto_39024 - BLOCK
    )
    :vars
    (
      ?auto_39025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39024 ?auto_39025 ) ( ON-TABLE ?auto_39020 ) ( ON ?auto_39021 ?auto_39020 ) ( ON ?auto_39022 ?auto_39021 ) ( not ( = ?auto_39020 ?auto_39021 ) ) ( not ( = ?auto_39020 ?auto_39022 ) ) ( not ( = ?auto_39020 ?auto_39023 ) ) ( not ( = ?auto_39020 ?auto_39024 ) ) ( not ( = ?auto_39020 ?auto_39025 ) ) ( not ( = ?auto_39021 ?auto_39022 ) ) ( not ( = ?auto_39021 ?auto_39023 ) ) ( not ( = ?auto_39021 ?auto_39024 ) ) ( not ( = ?auto_39021 ?auto_39025 ) ) ( not ( = ?auto_39022 ?auto_39023 ) ) ( not ( = ?auto_39022 ?auto_39024 ) ) ( not ( = ?auto_39022 ?auto_39025 ) ) ( not ( = ?auto_39023 ?auto_39024 ) ) ( not ( = ?auto_39023 ?auto_39025 ) ) ( not ( = ?auto_39024 ?auto_39025 ) ) ( CLEAR ?auto_39022 ) ( ON ?auto_39023 ?auto_39024 ) ( CLEAR ?auto_39023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39020 ?auto_39021 ?auto_39022 ?auto_39023 )
      ( MAKE-5PILE ?auto_39020 ?auto_39021 ?auto_39022 ?auto_39023 ?auto_39024 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39042 - BLOCK
      ?auto_39043 - BLOCK
      ?auto_39044 - BLOCK
      ?auto_39045 - BLOCK
      ?auto_39046 - BLOCK
    )
    :vars
    (
      ?auto_39047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39046 ?auto_39047 ) ( ON-TABLE ?auto_39042 ) ( ON ?auto_39043 ?auto_39042 ) ( not ( = ?auto_39042 ?auto_39043 ) ) ( not ( = ?auto_39042 ?auto_39044 ) ) ( not ( = ?auto_39042 ?auto_39045 ) ) ( not ( = ?auto_39042 ?auto_39046 ) ) ( not ( = ?auto_39042 ?auto_39047 ) ) ( not ( = ?auto_39043 ?auto_39044 ) ) ( not ( = ?auto_39043 ?auto_39045 ) ) ( not ( = ?auto_39043 ?auto_39046 ) ) ( not ( = ?auto_39043 ?auto_39047 ) ) ( not ( = ?auto_39044 ?auto_39045 ) ) ( not ( = ?auto_39044 ?auto_39046 ) ) ( not ( = ?auto_39044 ?auto_39047 ) ) ( not ( = ?auto_39045 ?auto_39046 ) ) ( not ( = ?auto_39045 ?auto_39047 ) ) ( not ( = ?auto_39046 ?auto_39047 ) ) ( ON ?auto_39045 ?auto_39046 ) ( CLEAR ?auto_39043 ) ( ON ?auto_39044 ?auto_39045 ) ( CLEAR ?auto_39044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39042 ?auto_39043 ?auto_39044 )
      ( MAKE-5PILE ?auto_39042 ?auto_39043 ?auto_39044 ?auto_39045 ?auto_39046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39064 - BLOCK
      ?auto_39065 - BLOCK
      ?auto_39066 - BLOCK
      ?auto_39067 - BLOCK
      ?auto_39068 - BLOCK
    )
    :vars
    (
      ?auto_39069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39068 ?auto_39069 ) ( ON-TABLE ?auto_39064 ) ( not ( = ?auto_39064 ?auto_39065 ) ) ( not ( = ?auto_39064 ?auto_39066 ) ) ( not ( = ?auto_39064 ?auto_39067 ) ) ( not ( = ?auto_39064 ?auto_39068 ) ) ( not ( = ?auto_39064 ?auto_39069 ) ) ( not ( = ?auto_39065 ?auto_39066 ) ) ( not ( = ?auto_39065 ?auto_39067 ) ) ( not ( = ?auto_39065 ?auto_39068 ) ) ( not ( = ?auto_39065 ?auto_39069 ) ) ( not ( = ?auto_39066 ?auto_39067 ) ) ( not ( = ?auto_39066 ?auto_39068 ) ) ( not ( = ?auto_39066 ?auto_39069 ) ) ( not ( = ?auto_39067 ?auto_39068 ) ) ( not ( = ?auto_39067 ?auto_39069 ) ) ( not ( = ?auto_39068 ?auto_39069 ) ) ( ON ?auto_39067 ?auto_39068 ) ( ON ?auto_39066 ?auto_39067 ) ( CLEAR ?auto_39064 ) ( ON ?auto_39065 ?auto_39066 ) ( CLEAR ?auto_39065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39064 ?auto_39065 )
      ( MAKE-5PILE ?auto_39064 ?auto_39065 ?auto_39066 ?auto_39067 ?auto_39068 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39086 - BLOCK
      ?auto_39087 - BLOCK
      ?auto_39088 - BLOCK
      ?auto_39089 - BLOCK
      ?auto_39090 - BLOCK
    )
    :vars
    (
      ?auto_39091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39090 ?auto_39091 ) ( not ( = ?auto_39086 ?auto_39087 ) ) ( not ( = ?auto_39086 ?auto_39088 ) ) ( not ( = ?auto_39086 ?auto_39089 ) ) ( not ( = ?auto_39086 ?auto_39090 ) ) ( not ( = ?auto_39086 ?auto_39091 ) ) ( not ( = ?auto_39087 ?auto_39088 ) ) ( not ( = ?auto_39087 ?auto_39089 ) ) ( not ( = ?auto_39087 ?auto_39090 ) ) ( not ( = ?auto_39087 ?auto_39091 ) ) ( not ( = ?auto_39088 ?auto_39089 ) ) ( not ( = ?auto_39088 ?auto_39090 ) ) ( not ( = ?auto_39088 ?auto_39091 ) ) ( not ( = ?auto_39089 ?auto_39090 ) ) ( not ( = ?auto_39089 ?auto_39091 ) ) ( not ( = ?auto_39090 ?auto_39091 ) ) ( ON ?auto_39089 ?auto_39090 ) ( ON ?auto_39088 ?auto_39089 ) ( ON ?auto_39087 ?auto_39088 ) ( ON ?auto_39086 ?auto_39087 ) ( CLEAR ?auto_39086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39086 )
      ( MAKE-5PILE ?auto_39086 ?auto_39087 ?auto_39088 ?auto_39089 ?auto_39090 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39109 - BLOCK
      ?auto_39110 - BLOCK
      ?auto_39111 - BLOCK
      ?auto_39112 - BLOCK
      ?auto_39113 - BLOCK
      ?auto_39114 - BLOCK
    )
    :vars
    (
      ?auto_39115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39113 ) ( ON ?auto_39114 ?auto_39115 ) ( CLEAR ?auto_39114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39109 ) ( ON ?auto_39110 ?auto_39109 ) ( ON ?auto_39111 ?auto_39110 ) ( ON ?auto_39112 ?auto_39111 ) ( ON ?auto_39113 ?auto_39112 ) ( not ( = ?auto_39109 ?auto_39110 ) ) ( not ( = ?auto_39109 ?auto_39111 ) ) ( not ( = ?auto_39109 ?auto_39112 ) ) ( not ( = ?auto_39109 ?auto_39113 ) ) ( not ( = ?auto_39109 ?auto_39114 ) ) ( not ( = ?auto_39109 ?auto_39115 ) ) ( not ( = ?auto_39110 ?auto_39111 ) ) ( not ( = ?auto_39110 ?auto_39112 ) ) ( not ( = ?auto_39110 ?auto_39113 ) ) ( not ( = ?auto_39110 ?auto_39114 ) ) ( not ( = ?auto_39110 ?auto_39115 ) ) ( not ( = ?auto_39111 ?auto_39112 ) ) ( not ( = ?auto_39111 ?auto_39113 ) ) ( not ( = ?auto_39111 ?auto_39114 ) ) ( not ( = ?auto_39111 ?auto_39115 ) ) ( not ( = ?auto_39112 ?auto_39113 ) ) ( not ( = ?auto_39112 ?auto_39114 ) ) ( not ( = ?auto_39112 ?auto_39115 ) ) ( not ( = ?auto_39113 ?auto_39114 ) ) ( not ( = ?auto_39113 ?auto_39115 ) ) ( not ( = ?auto_39114 ?auto_39115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39114 ?auto_39115 )
      ( !STACK ?auto_39114 ?auto_39113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39135 - BLOCK
      ?auto_39136 - BLOCK
      ?auto_39137 - BLOCK
      ?auto_39138 - BLOCK
      ?auto_39139 - BLOCK
      ?auto_39140 - BLOCK
    )
    :vars
    (
      ?auto_39141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39140 ?auto_39141 ) ( ON-TABLE ?auto_39135 ) ( ON ?auto_39136 ?auto_39135 ) ( ON ?auto_39137 ?auto_39136 ) ( ON ?auto_39138 ?auto_39137 ) ( not ( = ?auto_39135 ?auto_39136 ) ) ( not ( = ?auto_39135 ?auto_39137 ) ) ( not ( = ?auto_39135 ?auto_39138 ) ) ( not ( = ?auto_39135 ?auto_39139 ) ) ( not ( = ?auto_39135 ?auto_39140 ) ) ( not ( = ?auto_39135 ?auto_39141 ) ) ( not ( = ?auto_39136 ?auto_39137 ) ) ( not ( = ?auto_39136 ?auto_39138 ) ) ( not ( = ?auto_39136 ?auto_39139 ) ) ( not ( = ?auto_39136 ?auto_39140 ) ) ( not ( = ?auto_39136 ?auto_39141 ) ) ( not ( = ?auto_39137 ?auto_39138 ) ) ( not ( = ?auto_39137 ?auto_39139 ) ) ( not ( = ?auto_39137 ?auto_39140 ) ) ( not ( = ?auto_39137 ?auto_39141 ) ) ( not ( = ?auto_39138 ?auto_39139 ) ) ( not ( = ?auto_39138 ?auto_39140 ) ) ( not ( = ?auto_39138 ?auto_39141 ) ) ( not ( = ?auto_39139 ?auto_39140 ) ) ( not ( = ?auto_39139 ?auto_39141 ) ) ( not ( = ?auto_39140 ?auto_39141 ) ) ( CLEAR ?auto_39138 ) ( ON ?auto_39139 ?auto_39140 ) ( CLEAR ?auto_39139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39135 ?auto_39136 ?auto_39137 ?auto_39138 ?auto_39139 )
      ( MAKE-6PILE ?auto_39135 ?auto_39136 ?auto_39137 ?auto_39138 ?auto_39139 ?auto_39140 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39161 - BLOCK
      ?auto_39162 - BLOCK
      ?auto_39163 - BLOCK
      ?auto_39164 - BLOCK
      ?auto_39165 - BLOCK
      ?auto_39166 - BLOCK
    )
    :vars
    (
      ?auto_39167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39166 ?auto_39167 ) ( ON-TABLE ?auto_39161 ) ( ON ?auto_39162 ?auto_39161 ) ( ON ?auto_39163 ?auto_39162 ) ( not ( = ?auto_39161 ?auto_39162 ) ) ( not ( = ?auto_39161 ?auto_39163 ) ) ( not ( = ?auto_39161 ?auto_39164 ) ) ( not ( = ?auto_39161 ?auto_39165 ) ) ( not ( = ?auto_39161 ?auto_39166 ) ) ( not ( = ?auto_39161 ?auto_39167 ) ) ( not ( = ?auto_39162 ?auto_39163 ) ) ( not ( = ?auto_39162 ?auto_39164 ) ) ( not ( = ?auto_39162 ?auto_39165 ) ) ( not ( = ?auto_39162 ?auto_39166 ) ) ( not ( = ?auto_39162 ?auto_39167 ) ) ( not ( = ?auto_39163 ?auto_39164 ) ) ( not ( = ?auto_39163 ?auto_39165 ) ) ( not ( = ?auto_39163 ?auto_39166 ) ) ( not ( = ?auto_39163 ?auto_39167 ) ) ( not ( = ?auto_39164 ?auto_39165 ) ) ( not ( = ?auto_39164 ?auto_39166 ) ) ( not ( = ?auto_39164 ?auto_39167 ) ) ( not ( = ?auto_39165 ?auto_39166 ) ) ( not ( = ?auto_39165 ?auto_39167 ) ) ( not ( = ?auto_39166 ?auto_39167 ) ) ( ON ?auto_39165 ?auto_39166 ) ( CLEAR ?auto_39163 ) ( ON ?auto_39164 ?auto_39165 ) ( CLEAR ?auto_39164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39161 ?auto_39162 ?auto_39163 ?auto_39164 )
      ( MAKE-6PILE ?auto_39161 ?auto_39162 ?auto_39163 ?auto_39164 ?auto_39165 ?auto_39166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39187 - BLOCK
      ?auto_39188 - BLOCK
      ?auto_39189 - BLOCK
      ?auto_39190 - BLOCK
      ?auto_39191 - BLOCK
      ?auto_39192 - BLOCK
    )
    :vars
    (
      ?auto_39193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39192 ?auto_39193 ) ( ON-TABLE ?auto_39187 ) ( ON ?auto_39188 ?auto_39187 ) ( not ( = ?auto_39187 ?auto_39188 ) ) ( not ( = ?auto_39187 ?auto_39189 ) ) ( not ( = ?auto_39187 ?auto_39190 ) ) ( not ( = ?auto_39187 ?auto_39191 ) ) ( not ( = ?auto_39187 ?auto_39192 ) ) ( not ( = ?auto_39187 ?auto_39193 ) ) ( not ( = ?auto_39188 ?auto_39189 ) ) ( not ( = ?auto_39188 ?auto_39190 ) ) ( not ( = ?auto_39188 ?auto_39191 ) ) ( not ( = ?auto_39188 ?auto_39192 ) ) ( not ( = ?auto_39188 ?auto_39193 ) ) ( not ( = ?auto_39189 ?auto_39190 ) ) ( not ( = ?auto_39189 ?auto_39191 ) ) ( not ( = ?auto_39189 ?auto_39192 ) ) ( not ( = ?auto_39189 ?auto_39193 ) ) ( not ( = ?auto_39190 ?auto_39191 ) ) ( not ( = ?auto_39190 ?auto_39192 ) ) ( not ( = ?auto_39190 ?auto_39193 ) ) ( not ( = ?auto_39191 ?auto_39192 ) ) ( not ( = ?auto_39191 ?auto_39193 ) ) ( not ( = ?auto_39192 ?auto_39193 ) ) ( ON ?auto_39191 ?auto_39192 ) ( ON ?auto_39190 ?auto_39191 ) ( CLEAR ?auto_39188 ) ( ON ?auto_39189 ?auto_39190 ) ( CLEAR ?auto_39189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39187 ?auto_39188 ?auto_39189 )
      ( MAKE-6PILE ?auto_39187 ?auto_39188 ?auto_39189 ?auto_39190 ?auto_39191 ?auto_39192 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39213 - BLOCK
      ?auto_39214 - BLOCK
      ?auto_39215 - BLOCK
      ?auto_39216 - BLOCK
      ?auto_39217 - BLOCK
      ?auto_39218 - BLOCK
    )
    :vars
    (
      ?auto_39219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39218 ?auto_39219 ) ( ON-TABLE ?auto_39213 ) ( not ( = ?auto_39213 ?auto_39214 ) ) ( not ( = ?auto_39213 ?auto_39215 ) ) ( not ( = ?auto_39213 ?auto_39216 ) ) ( not ( = ?auto_39213 ?auto_39217 ) ) ( not ( = ?auto_39213 ?auto_39218 ) ) ( not ( = ?auto_39213 ?auto_39219 ) ) ( not ( = ?auto_39214 ?auto_39215 ) ) ( not ( = ?auto_39214 ?auto_39216 ) ) ( not ( = ?auto_39214 ?auto_39217 ) ) ( not ( = ?auto_39214 ?auto_39218 ) ) ( not ( = ?auto_39214 ?auto_39219 ) ) ( not ( = ?auto_39215 ?auto_39216 ) ) ( not ( = ?auto_39215 ?auto_39217 ) ) ( not ( = ?auto_39215 ?auto_39218 ) ) ( not ( = ?auto_39215 ?auto_39219 ) ) ( not ( = ?auto_39216 ?auto_39217 ) ) ( not ( = ?auto_39216 ?auto_39218 ) ) ( not ( = ?auto_39216 ?auto_39219 ) ) ( not ( = ?auto_39217 ?auto_39218 ) ) ( not ( = ?auto_39217 ?auto_39219 ) ) ( not ( = ?auto_39218 ?auto_39219 ) ) ( ON ?auto_39217 ?auto_39218 ) ( ON ?auto_39216 ?auto_39217 ) ( ON ?auto_39215 ?auto_39216 ) ( CLEAR ?auto_39213 ) ( ON ?auto_39214 ?auto_39215 ) ( CLEAR ?auto_39214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39213 ?auto_39214 )
      ( MAKE-6PILE ?auto_39213 ?auto_39214 ?auto_39215 ?auto_39216 ?auto_39217 ?auto_39218 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39239 - BLOCK
      ?auto_39240 - BLOCK
      ?auto_39241 - BLOCK
      ?auto_39242 - BLOCK
      ?auto_39243 - BLOCK
      ?auto_39244 - BLOCK
    )
    :vars
    (
      ?auto_39245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39244 ?auto_39245 ) ( not ( = ?auto_39239 ?auto_39240 ) ) ( not ( = ?auto_39239 ?auto_39241 ) ) ( not ( = ?auto_39239 ?auto_39242 ) ) ( not ( = ?auto_39239 ?auto_39243 ) ) ( not ( = ?auto_39239 ?auto_39244 ) ) ( not ( = ?auto_39239 ?auto_39245 ) ) ( not ( = ?auto_39240 ?auto_39241 ) ) ( not ( = ?auto_39240 ?auto_39242 ) ) ( not ( = ?auto_39240 ?auto_39243 ) ) ( not ( = ?auto_39240 ?auto_39244 ) ) ( not ( = ?auto_39240 ?auto_39245 ) ) ( not ( = ?auto_39241 ?auto_39242 ) ) ( not ( = ?auto_39241 ?auto_39243 ) ) ( not ( = ?auto_39241 ?auto_39244 ) ) ( not ( = ?auto_39241 ?auto_39245 ) ) ( not ( = ?auto_39242 ?auto_39243 ) ) ( not ( = ?auto_39242 ?auto_39244 ) ) ( not ( = ?auto_39242 ?auto_39245 ) ) ( not ( = ?auto_39243 ?auto_39244 ) ) ( not ( = ?auto_39243 ?auto_39245 ) ) ( not ( = ?auto_39244 ?auto_39245 ) ) ( ON ?auto_39243 ?auto_39244 ) ( ON ?auto_39242 ?auto_39243 ) ( ON ?auto_39241 ?auto_39242 ) ( ON ?auto_39240 ?auto_39241 ) ( ON ?auto_39239 ?auto_39240 ) ( CLEAR ?auto_39239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39239 )
      ( MAKE-6PILE ?auto_39239 ?auto_39240 ?auto_39241 ?auto_39242 ?auto_39243 ?auto_39244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_39266 - BLOCK
      ?auto_39267 - BLOCK
      ?auto_39268 - BLOCK
      ?auto_39269 - BLOCK
      ?auto_39270 - BLOCK
      ?auto_39271 - BLOCK
      ?auto_39272 - BLOCK
    )
    :vars
    (
      ?auto_39273 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39271 ) ( ON ?auto_39272 ?auto_39273 ) ( CLEAR ?auto_39272 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39266 ) ( ON ?auto_39267 ?auto_39266 ) ( ON ?auto_39268 ?auto_39267 ) ( ON ?auto_39269 ?auto_39268 ) ( ON ?auto_39270 ?auto_39269 ) ( ON ?auto_39271 ?auto_39270 ) ( not ( = ?auto_39266 ?auto_39267 ) ) ( not ( = ?auto_39266 ?auto_39268 ) ) ( not ( = ?auto_39266 ?auto_39269 ) ) ( not ( = ?auto_39266 ?auto_39270 ) ) ( not ( = ?auto_39266 ?auto_39271 ) ) ( not ( = ?auto_39266 ?auto_39272 ) ) ( not ( = ?auto_39266 ?auto_39273 ) ) ( not ( = ?auto_39267 ?auto_39268 ) ) ( not ( = ?auto_39267 ?auto_39269 ) ) ( not ( = ?auto_39267 ?auto_39270 ) ) ( not ( = ?auto_39267 ?auto_39271 ) ) ( not ( = ?auto_39267 ?auto_39272 ) ) ( not ( = ?auto_39267 ?auto_39273 ) ) ( not ( = ?auto_39268 ?auto_39269 ) ) ( not ( = ?auto_39268 ?auto_39270 ) ) ( not ( = ?auto_39268 ?auto_39271 ) ) ( not ( = ?auto_39268 ?auto_39272 ) ) ( not ( = ?auto_39268 ?auto_39273 ) ) ( not ( = ?auto_39269 ?auto_39270 ) ) ( not ( = ?auto_39269 ?auto_39271 ) ) ( not ( = ?auto_39269 ?auto_39272 ) ) ( not ( = ?auto_39269 ?auto_39273 ) ) ( not ( = ?auto_39270 ?auto_39271 ) ) ( not ( = ?auto_39270 ?auto_39272 ) ) ( not ( = ?auto_39270 ?auto_39273 ) ) ( not ( = ?auto_39271 ?auto_39272 ) ) ( not ( = ?auto_39271 ?auto_39273 ) ) ( not ( = ?auto_39272 ?auto_39273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39272 ?auto_39273 )
      ( !STACK ?auto_39272 ?auto_39271 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_39296 - BLOCK
      ?auto_39297 - BLOCK
      ?auto_39298 - BLOCK
      ?auto_39299 - BLOCK
      ?auto_39300 - BLOCK
      ?auto_39301 - BLOCK
      ?auto_39302 - BLOCK
    )
    :vars
    (
      ?auto_39303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39302 ?auto_39303 ) ( ON-TABLE ?auto_39296 ) ( ON ?auto_39297 ?auto_39296 ) ( ON ?auto_39298 ?auto_39297 ) ( ON ?auto_39299 ?auto_39298 ) ( ON ?auto_39300 ?auto_39299 ) ( not ( = ?auto_39296 ?auto_39297 ) ) ( not ( = ?auto_39296 ?auto_39298 ) ) ( not ( = ?auto_39296 ?auto_39299 ) ) ( not ( = ?auto_39296 ?auto_39300 ) ) ( not ( = ?auto_39296 ?auto_39301 ) ) ( not ( = ?auto_39296 ?auto_39302 ) ) ( not ( = ?auto_39296 ?auto_39303 ) ) ( not ( = ?auto_39297 ?auto_39298 ) ) ( not ( = ?auto_39297 ?auto_39299 ) ) ( not ( = ?auto_39297 ?auto_39300 ) ) ( not ( = ?auto_39297 ?auto_39301 ) ) ( not ( = ?auto_39297 ?auto_39302 ) ) ( not ( = ?auto_39297 ?auto_39303 ) ) ( not ( = ?auto_39298 ?auto_39299 ) ) ( not ( = ?auto_39298 ?auto_39300 ) ) ( not ( = ?auto_39298 ?auto_39301 ) ) ( not ( = ?auto_39298 ?auto_39302 ) ) ( not ( = ?auto_39298 ?auto_39303 ) ) ( not ( = ?auto_39299 ?auto_39300 ) ) ( not ( = ?auto_39299 ?auto_39301 ) ) ( not ( = ?auto_39299 ?auto_39302 ) ) ( not ( = ?auto_39299 ?auto_39303 ) ) ( not ( = ?auto_39300 ?auto_39301 ) ) ( not ( = ?auto_39300 ?auto_39302 ) ) ( not ( = ?auto_39300 ?auto_39303 ) ) ( not ( = ?auto_39301 ?auto_39302 ) ) ( not ( = ?auto_39301 ?auto_39303 ) ) ( not ( = ?auto_39302 ?auto_39303 ) ) ( CLEAR ?auto_39300 ) ( ON ?auto_39301 ?auto_39302 ) ( CLEAR ?auto_39301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39296 ?auto_39297 ?auto_39298 ?auto_39299 ?auto_39300 ?auto_39301 )
      ( MAKE-7PILE ?auto_39296 ?auto_39297 ?auto_39298 ?auto_39299 ?auto_39300 ?auto_39301 ?auto_39302 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_39326 - BLOCK
      ?auto_39327 - BLOCK
      ?auto_39328 - BLOCK
      ?auto_39329 - BLOCK
      ?auto_39330 - BLOCK
      ?auto_39331 - BLOCK
      ?auto_39332 - BLOCK
    )
    :vars
    (
      ?auto_39333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39332 ?auto_39333 ) ( ON-TABLE ?auto_39326 ) ( ON ?auto_39327 ?auto_39326 ) ( ON ?auto_39328 ?auto_39327 ) ( ON ?auto_39329 ?auto_39328 ) ( not ( = ?auto_39326 ?auto_39327 ) ) ( not ( = ?auto_39326 ?auto_39328 ) ) ( not ( = ?auto_39326 ?auto_39329 ) ) ( not ( = ?auto_39326 ?auto_39330 ) ) ( not ( = ?auto_39326 ?auto_39331 ) ) ( not ( = ?auto_39326 ?auto_39332 ) ) ( not ( = ?auto_39326 ?auto_39333 ) ) ( not ( = ?auto_39327 ?auto_39328 ) ) ( not ( = ?auto_39327 ?auto_39329 ) ) ( not ( = ?auto_39327 ?auto_39330 ) ) ( not ( = ?auto_39327 ?auto_39331 ) ) ( not ( = ?auto_39327 ?auto_39332 ) ) ( not ( = ?auto_39327 ?auto_39333 ) ) ( not ( = ?auto_39328 ?auto_39329 ) ) ( not ( = ?auto_39328 ?auto_39330 ) ) ( not ( = ?auto_39328 ?auto_39331 ) ) ( not ( = ?auto_39328 ?auto_39332 ) ) ( not ( = ?auto_39328 ?auto_39333 ) ) ( not ( = ?auto_39329 ?auto_39330 ) ) ( not ( = ?auto_39329 ?auto_39331 ) ) ( not ( = ?auto_39329 ?auto_39332 ) ) ( not ( = ?auto_39329 ?auto_39333 ) ) ( not ( = ?auto_39330 ?auto_39331 ) ) ( not ( = ?auto_39330 ?auto_39332 ) ) ( not ( = ?auto_39330 ?auto_39333 ) ) ( not ( = ?auto_39331 ?auto_39332 ) ) ( not ( = ?auto_39331 ?auto_39333 ) ) ( not ( = ?auto_39332 ?auto_39333 ) ) ( ON ?auto_39331 ?auto_39332 ) ( CLEAR ?auto_39329 ) ( ON ?auto_39330 ?auto_39331 ) ( CLEAR ?auto_39330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39326 ?auto_39327 ?auto_39328 ?auto_39329 ?auto_39330 )
      ( MAKE-7PILE ?auto_39326 ?auto_39327 ?auto_39328 ?auto_39329 ?auto_39330 ?auto_39331 ?auto_39332 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_39356 - BLOCK
      ?auto_39357 - BLOCK
      ?auto_39358 - BLOCK
      ?auto_39359 - BLOCK
      ?auto_39360 - BLOCK
      ?auto_39361 - BLOCK
      ?auto_39362 - BLOCK
    )
    :vars
    (
      ?auto_39363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39362 ?auto_39363 ) ( ON-TABLE ?auto_39356 ) ( ON ?auto_39357 ?auto_39356 ) ( ON ?auto_39358 ?auto_39357 ) ( not ( = ?auto_39356 ?auto_39357 ) ) ( not ( = ?auto_39356 ?auto_39358 ) ) ( not ( = ?auto_39356 ?auto_39359 ) ) ( not ( = ?auto_39356 ?auto_39360 ) ) ( not ( = ?auto_39356 ?auto_39361 ) ) ( not ( = ?auto_39356 ?auto_39362 ) ) ( not ( = ?auto_39356 ?auto_39363 ) ) ( not ( = ?auto_39357 ?auto_39358 ) ) ( not ( = ?auto_39357 ?auto_39359 ) ) ( not ( = ?auto_39357 ?auto_39360 ) ) ( not ( = ?auto_39357 ?auto_39361 ) ) ( not ( = ?auto_39357 ?auto_39362 ) ) ( not ( = ?auto_39357 ?auto_39363 ) ) ( not ( = ?auto_39358 ?auto_39359 ) ) ( not ( = ?auto_39358 ?auto_39360 ) ) ( not ( = ?auto_39358 ?auto_39361 ) ) ( not ( = ?auto_39358 ?auto_39362 ) ) ( not ( = ?auto_39358 ?auto_39363 ) ) ( not ( = ?auto_39359 ?auto_39360 ) ) ( not ( = ?auto_39359 ?auto_39361 ) ) ( not ( = ?auto_39359 ?auto_39362 ) ) ( not ( = ?auto_39359 ?auto_39363 ) ) ( not ( = ?auto_39360 ?auto_39361 ) ) ( not ( = ?auto_39360 ?auto_39362 ) ) ( not ( = ?auto_39360 ?auto_39363 ) ) ( not ( = ?auto_39361 ?auto_39362 ) ) ( not ( = ?auto_39361 ?auto_39363 ) ) ( not ( = ?auto_39362 ?auto_39363 ) ) ( ON ?auto_39361 ?auto_39362 ) ( ON ?auto_39360 ?auto_39361 ) ( CLEAR ?auto_39358 ) ( ON ?auto_39359 ?auto_39360 ) ( CLEAR ?auto_39359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39356 ?auto_39357 ?auto_39358 ?auto_39359 )
      ( MAKE-7PILE ?auto_39356 ?auto_39357 ?auto_39358 ?auto_39359 ?auto_39360 ?auto_39361 ?auto_39362 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_39386 - BLOCK
      ?auto_39387 - BLOCK
      ?auto_39388 - BLOCK
      ?auto_39389 - BLOCK
      ?auto_39390 - BLOCK
      ?auto_39391 - BLOCK
      ?auto_39392 - BLOCK
    )
    :vars
    (
      ?auto_39393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39392 ?auto_39393 ) ( ON-TABLE ?auto_39386 ) ( ON ?auto_39387 ?auto_39386 ) ( not ( = ?auto_39386 ?auto_39387 ) ) ( not ( = ?auto_39386 ?auto_39388 ) ) ( not ( = ?auto_39386 ?auto_39389 ) ) ( not ( = ?auto_39386 ?auto_39390 ) ) ( not ( = ?auto_39386 ?auto_39391 ) ) ( not ( = ?auto_39386 ?auto_39392 ) ) ( not ( = ?auto_39386 ?auto_39393 ) ) ( not ( = ?auto_39387 ?auto_39388 ) ) ( not ( = ?auto_39387 ?auto_39389 ) ) ( not ( = ?auto_39387 ?auto_39390 ) ) ( not ( = ?auto_39387 ?auto_39391 ) ) ( not ( = ?auto_39387 ?auto_39392 ) ) ( not ( = ?auto_39387 ?auto_39393 ) ) ( not ( = ?auto_39388 ?auto_39389 ) ) ( not ( = ?auto_39388 ?auto_39390 ) ) ( not ( = ?auto_39388 ?auto_39391 ) ) ( not ( = ?auto_39388 ?auto_39392 ) ) ( not ( = ?auto_39388 ?auto_39393 ) ) ( not ( = ?auto_39389 ?auto_39390 ) ) ( not ( = ?auto_39389 ?auto_39391 ) ) ( not ( = ?auto_39389 ?auto_39392 ) ) ( not ( = ?auto_39389 ?auto_39393 ) ) ( not ( = ?auto_39390 ?auto_39391 ) ) ( not ( = ?auto_39390 ?auto_39392 ) ) ( not ( = ?auto_39390 ?auto_39393 ) ) ( not ( = ?auto_39391 ?auto_39392 ) ) ( not ( = ?auto_39391 ?auto_39393 ) ) ( not ( = ?auto_39392 ?auto_39393 ) ) ( ON ?auto_39391 ?auto_39392 ) ( ON ?auto_39390 ?auto_39391 ) ( ON ?auto_39389 ?auto_39390 ) ( CLEAR ?auto_39387 ) ( ON ?auto_39388 ?auto_39389 ) ( CLEAR ?auto_39388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39386 ?auto_39387 ?auto_39388 )
      ( MAKE-7PILE ?auto_39386 ?auto_39387 ?auto_39388 ?auto_39389 ?auto_39390 ?auto_39391 ?auto_39392 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_39416 - BLOCK
      ?auto_39417 - BLOCK
      ?auto_39418 - BLOCK
      ?auto_39419 - BLOCK
      ?auto_39420 - BLOCK
      ?auto_39421 - BLOCK
      ?auto_39422 - BLOCK
    )
    :vars
    (
      ?auto_39423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39422 ?auto_39423 ) ( ON-TABLE ?auto_39416 ) ( not ( = ?auto_39416 ?auto_39417 ) ) ( not ( = ?auto_39416 ?auto_39418 ) ) ( not ( = ?auto_39416 ?auto_39419 ) ) ( not ( = ?auto_39416 ?auto_39420 ) ) ( not ( = ?auto_39416 ?auto_39421 ) ) ( not ( = ?auto_39416 ?auto_39422 ) ) ( not ( = ?auto_39416 ?auto_39423 ) ) ( not ( = ?auto_39417 ?auto_39418 ) ) ( not ( = ?auto_39417 ?auto_39419 ) ) ( not ( = ?auto_39417 ?auto_39420 ) ) ( not ( = ?auto_39417 ?auto_39421 ) ) ( not ( = ?auto_39417 ?auto_39422 ) ) ( not ( = ?auto_39417 ?auto_39423 ) ) ( not ( = ?auto_39418 ?auto_39419 ) ) ( not ( = ?auto_39418 ?auto_39420 ) ) ( not ( = ?auto_39418 ?auto_39421 ) ) ( not ( = ?auto_39418 ?auto_39422 ) ) ( not ( = ?auto_39418 ?auto_39423 ) ) ( not ( = ?auto_39419 ?auto_39420 ) ) ( not ( = ?auto_39419 ?auto_39421 ) ) ( not ( = ?auto_39419 ?auto_39422 ) ) ( not ( = ?auto_39419 ?auto_39423 ) ) ( not ( = ?auto_39420 ?auto_39421 ) ) ( not ( = ?auto_39420 ?auto_39422 ) ) ( not ( = ?auto_39420 ?auto_39423 ) ) ( not ( = ?auto_39421 ?auto_39422 ) ) ( not ( = ?auto_39421 ?auto_39423 ) ) ( not ( = ?auto_39422 ?auto_39423 ) ) ( ON ?auto_39421 ?auto_39422 ) ( ON ?auto_39420 ?auto_39421 ) ( ON ?auto_39419 ?auto_39420 ) ( ON ?auto_39418 ?auto_39419 ) ( CLEAR ?auto_39416 ) ( ON ?auto_39417 ?auto_39418 ) ( CLEAR ?auto_39417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39416 ?auto_39417 )
      ( MAKE-7PILE ?auto_39416 ?auto_39417 ?auto_39418 ?auto_39419 ?auto_39420 ?auto_39421 ?auto_39422 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_39446 - BLOCK
      ?auto_39447 - BLOCK
      ?auto_39448 - BLOCK
      ?auto_39449 - BLOCK
      ?auto_39450 - BLOCK
      ?auto_39451 - BLOCK
      ?auto_39452 - BLOCK
    )
    :vars
    (
      ?auto_39453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39452 ?auto_39453 ) ( not ( = ?auto_39446 ?auto_39447 ) ) ( not ( = ?auto_39446 ?auto_39448 ) ) ( not ( = ?auto_39446 ?auto_39449 ) ) ( not ( = ?auto_39446 ?auto_39450 ) ) ( not ( = ?auto_39446 ?auto_39451 ) ) ( not ( = ?auto_39446 ?auto_39452 ) ) ( not ( = ?auto_39446 ?auto_39453 ) ) ( not ( = ?auto_39447 ?auto_39448 ) ) ( not ( = ?auto_39447 ?auto_39449 ) ) ( not ( = ?auto_39447 ?auto_39450 ) ) ( not ( = ?auto_39447 ?auto_39451 ) ) ( not ( = ?auto_39447 ?auto_39452 ) ) ( not ( = ?auto_39447 ?auto_39453 ) ) ( not ( = ?auto_39448 ?auto_39449 ) ) ( not ( = ?auto_39448 ?auto_39450 ) ) ( not ( = ?auto_39448 ?auto_39451 ) ) ( not ( = ?auto_39448 ?auto_39452 ) ) ( not ( = ?auto_39448 ?auto_39453 ) ) ( not ( = ?auto_39449 ?auto_39450 ) ) ( not ( = ?auto_39449 ?auto_39451 ) ) ( not ( = ?auto_39449 ?auto_39452 ) ) ( not ( = ?auto_39449 ?auto_39453 ) ) ( not ( = ?auto_39450 ?auto_39451 ) ) ( not ( = ?auto_39450 ?auto_39452 ) ) ( not ( = ?auto_39450 ?auto_39453 ) ) ( not ( = ?auto_39451 ?auto_39452 ) ) ( not ( = ?auto_39451 ?auto_39453 ) ) ( not ( = ?auto_39452 ?auto_39453 ) ) ( ON ?auto_39451 ?auto_39452 ) ( ON ?auto_39450 ?auto_39451 ) ( ON ?auto_39449 ?auto_39450 ) ( ON ?auto_39448 ?auto_39449 ) ( ON ?auto_39447 ?auto_39448 ) ( ON ?auto_39446 ?auto_39447 ) ( CLEAR ?auto_39446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39446 )
      ( MAKE-7PILE ?auto_39446 ?auto_39447 ?auto_39448 ?auto_39449 ?auto_39450 ?auto_39451 ?auto_39452 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39477 - BLOCK
      ?auto_39478 - BLOCK
      ?auto_39479 - BLOCK
      ?auto_39480 - BLOCK
      ?auto_39481 - BLOCK
      ?auto_39482 - BLOCK
      ?auto_39483 - BLOCK
      ?auto_39484 - BLOCK
    )
    :vars
    (
      ?auto_39485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39483 ) ( ON ?auto_39484 ?auto_39485 ) ( CLEAR ?auto_39484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39477 ) ( ON ?auto_39478 ?auto_39477 ) ( ON ?auto_39479 ?auto_39478 ) ( ON ?auto_39480 ?auto_39479 ) ( ON ?auto_39481 ?auto_39480 ) ( ON ?auto_39482 ?auto_39481 ) ( ON ?auto_39483 ?auto_39482 ) ( not ( = ?auto_39477 ?auto_39478 ) ) ( not ( = ?auto_39477 ?auto_39479 ) ) ( not ( = ?auto_39477 ?auto_39480 ) ) ( not ( = ?auto_39477 ?auto_39481 ) ) ( not ( = ?auto_39477 ?auto_39482 ) ) ( not ( = ?auto_39477 ?auto_39483 ) ) ( not ( = ?auto_39477 ?auto_39484 ) ) ( not ( = ?auto_39477 ?auto_39485 ) ) ( not ( = ?auto_39478 ?auto_39479 ) ) ( not ( = ?auto_39478 ?auto_39480 ) ) ( not ( = ?auto_39478 ?auto_39481 ) ) ( not ( = ?auto_39478 ?auto_39482 ) ) ( not ( = ?auto_39478 ?auto_39483 ) ) ( not ( = ?auto_39478 ?auto_39484 ) ) ( not ( = ?auto_39478 ?auto_39485 ) ) ( not ( = ?auto_39479 ?auto_39480 ) ) ( not ( = ?auto_39479 ?auto_39481 ) ) ( not ( = ?auto_39479 ?auto_39482 ) ) ( not ( = ?auto_39479 ?auto_39483 ) ) ( not ( = ?auto_39479 ?auto_39484 ) ) ( not ( = ?auto_39479 ?auto_39485 ) ) ( not ( = ?auto_39480 ?auto_39481 ) ) ( not ( = ?auto_39480 ?auto_39482 ) ) ( not ( = ?auto_39480 ?auto_39483 ) ) ( not ( = ?auto_39480 ?auto_39484 ) ) ( not ( = ?auto_39480 ?auto_39485 ) ) ( not ( = ?auto_39481 ?auto_39482 ) ) ( not ( = ?auto_39481 ?auto_39483 ) ) ( not ( = ?auto_39481 ?auto_39484 ) ) ( not ( = ?auto_39481 ?auto_39485 ) ) ( not ( = ?auto_39482 ?auto_39483 ) ) ( not ( = ?auto_39482 ?auto_39484 ) ) ( not ( = ?auto_39482 ?auto_39485 ) ) ( not ( = ?auto_39483 ?auto_39484 ) ) ( not ( = ?auto_39483 ?auto_39485 ) ) ( not ( = ?auto_39484 ?auto_39485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39484 ?auto_39485 )
      ( !STACK ?auto_39484 ?auto_39483 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39494 - BLOCK
      ?auto_39495 - BLOCK
      ?auto_39496 - BLOCK
      ?auto_39497 - BLOCK
      ?auto_39498 - BLOCK
      ?auto_39499 - BLOCK
      ?auto_39500 - BLOCK
      ?auto_39501 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39500 ) ( ON-TABLE ?auto_39501 ) ( CLEAR ?auto_39501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39494 ) ( ON ?auto_39495 ?auto_39494 ) ( ON ?auto_39496 ?auto_39495 ) ( ON ?auto_39497 ?auto_39496 ) ( ON ?auto_39498 ?auto_39497 ) ( ON ?auto_39499 ?auto_39498 ) ( ON ?auto_39500 ?auto_39499 ) ( not ( = ?auto_39494 ?auto_39495 ) ) ( not ( = ?auto_39494 ?auto_39496 ) ) ( not ( = ?auto_39494 ?auto_39497 ) ) ( not ( = ?auto_39494 ?auto_39498 ) ) ( not ( = ?auto_39494 ?auto_39499 ) ) ( not ( = ?auto_39494 ?auto_39500 ) ) ( not ( = ?auto_39494 ?auto_39501 ) ) ( not ( = ?auto_39495 ?auto_39496 ) ) ( not ( = ?auto_39495 ?auto_39497 ) ) ( not ( = ?auto_39495 ?auto_39498 ) ) ( not ( = ?auto_39495 ?auto_39499 ) ) ( not ( = ?auto_39495 ?auto_39500 ) ) ( not ( = ?auto_39495 ?auto_39501 ) ) ( not ( = ?auto_39496 ?auto_39497 ) ) ( not ( = ?auto_39496 ?auto_39498 ) ) ( not ( = ?auto_39496 ?auto_39499 ) ) ( not ( = ?auto_39496 ?auto_39500 ) ) ( not ( = ?auto_39496 ?auto_39501 ) ) ( not ( = ?auto_39497 ?auto_39498 ) ) ( not ( = ?auto_39497 ?auto_39499 ) ) ( not ( = ?auto_39497 ?auto_39500 ) ) ( not ( = ?auto_39497 ?auto_39501 ) ) ( not ( = ?auto_39498 ?auto_39499 ) ) ( not ( = ?auto_39498 ?auto_39500 ) ) ( not ( = ?auto_39498 ?auto_39501 ) ) ( not ( = ?auto_39499 ?auto_39500 ) ) ( not ( = ?auto_39499 ?auto_39501 ) ) ( not ( = ?auto_39500 ?auto_39501 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_39501 )
      ( !STACK ?auto_39501 ?auto_39500 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39510 - BLOCK
      ?auto_39511 - BLOCK
      ?auto_39512 - BLOCK
      ?auto_39513 - BLOCK
      ?auto_39514 - BLOCK
      ?auto_39515 - BLOCK
      ?auto_39516 - BLOCK
      ?auto_39517 - BLOCK
    )
    :vars
    (
      ?auto_39518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39517 ?auto_39518 ) ( ON-TABLE ?auto_39510 ) ( ON ?auto_39511 ?auto_39510 ) ( ON ?auto_39512 ?auto_39511 ) ( ON ?auto_39513 ?auto_39512 ) ( ON ?auto_39514 ?auto_39513 ) ( ON ?auto_39515 ?auto_39514 ) ( not ( = ?auto_39510 ?auto_39511 ) ) ( not ( = ?auto_39510 ?auto_39512 ) ) ( not ( = ?auto_39510 ?auto_39513 ) ) ( not ( = ?auto_39510 ?auto_39514 ) ) ( not ( = ?auto_39510 ?auto_39515 ) ) ( not ( = ?auto_39510 ?auto_39516 ) ) ( not ( = ?auto_39510 ?auto_39517 ) ) ( not ( = ?auto_39510 ?auto_39518 ) ) ( not ( = ?auto_39511 ?auto_39512 ) ) ( not ( = ?auto_39511 ?auto_39513 ) ) ( not ( = ?auto_39511 ?auto_39514 ) ) ( not ( = ?auto_39511 ?auto_39515 ) ) ( not ( = ?auto_39511 ?auto_39516 ) ) ( not ( = ?auto_39511 ?auto_39517 ) ) ( not ( = ?auto_39511 ?auto_39518 ) ) ( not ( = ?auto_39512 ?auto_39513 ) ) ( not ( = ?auto_39512 ?auto_39514 ) ) ( not ( = ?auto_39512 ?auto_39515 ) ) ( not ( = ?auto_39512 ?auto_39516 ) ) ( not ( = ?auto_39512 ?auto_39517 ) ) ( not ( = ?auto_39512 ?auto_39518 ) ) ( not ( = ?auto_39513 ?auto_39514 ) ) ( not ( = ?auto_39513 ?auto_39515 ) ) ( not ( = ?auto_39513 ?auto_39516 ) ) ( not ( = ?auto_39513 ?auto_39517 ) ) ( not ( = ?auto_39513 ?auto_39518 ) ) ( not ( = ?auto_39514 ?auto_39515 ) ) ( not ( = ?auto_39514 ?auto_39516 ) ) ( not ( = ?auto_39514 ?auto_39517 ) ) ( not ( = ?auto_39514 ?auto_39518 ) ) ( not ( = ?auto_39515 ?auto_39516 ) ) ( not ( = ?auto_39515 ?auto_39517 ) ) ( not ( = ?auto_39515 ?auto_39518 ) ) ( not ( = ?auto_39516 ?auto_39517 ) ) ( not ( = ?auto_39516 ?auto_39518 ) ) ( not ( = ?auto_39517 ?auto_39518 ) ) ( CLEAR ?auto_39515 ) ( ON ?auto_39516 ?auto_39517 ) ( CLEAR ?auto_39516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_39510 ?auto_39511 ?auto_39512 ?auto_39513 ?auto_39514 ?auto_39515 ?auto_39516 )
      ( MAKE-8PILE ?auto_39510 ?auto_39511 ?auto_39512 ?auto_39513 ?auto_39514 ?auto_39515 ?auto_39516 ?auto_39517 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39527 - BLOCK
      ?auto_39528 - BLOCK
      ?auto_39529 - BLOCK
      ?auto_39530 - BLOCK
      ?auto_39531 - BLOCK
      ?auto_39532 - BLOCK
      ?auto_39533 - BLOCK
      ?auto_39534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39534 ) ( ON-TABLE ?auto_39527 ) ( ON ?auto_39528 ?auto_39527 ) ( ON ?auto_39529 ?auto_39528 ) ( ON ?auto_39530 ?auto_39529 ) ( ON ?auto_39531 ?auto_39530 ) ( ON ?auto_39532 ?auto_39531 ) ( not ( = ?auto_39527 ?auto_39528 ) ) ( not ( = ?auto_39527 ?auto_39529 ) ) ( not ( = ?auto_39527 ?auto_39530 ) ) ( not ( = ?auto_39527 ?auto_39531 ) ) ( not ( = ?auto_39527 ?auto_39532 ) ) ( not ( = ?auto_39527 ?auto_39533 ) ) ( not ( = ?auto_39527 ?auto_39534 ) ) ( not ( = ?auto_39528 ?auto_39529 ) ) ( not ( = ?auto_39528 ?auto_39530 ) ) ( not ( = ?auto_39528 ?auto_39531 ) ) ( not ( = ?auto_39528 ?auto_39532 ) ) ( not ( = ?auto_39528 ?auto_39533 ) ) ( not ( = ?auto_39528 ?auto_39534 ) ) ( not ( = ?auto_39529 ?auto_39530 ) ) ( not ( = ?auto_39529 ?auto_39531 ) ) ( not ( = ?auto_39529 ?auto_39532 ) ) ( not ( = ?auto_39529 ?auto_39533 ) ) ( not ( = ?auto_39529 ?auto_39534 ) ) ( not ( = ?auto_39530 ?auto_39531 ) ) ( not ( = ?auto_39530 ?auto_39532 ) ) ( not ( = ?auto_39530 ?auto_39533 ) ) ( not ( = ?auto_39530 ?auto_39534 ) ) ( not ( = ?auto_39531 ?auto_39532 ) ) ( not ( = ?auto_39531 ?auto_39533 ) ) ( not ( = ?auto_39531 ?auto_39534 ) ) ( not ( = ?auto_39532 ?auto_39533 ) ) ( not ( = ?auto_39532 ?auto_39534 ) ) ( not ( = ?auto_39533 ?auto_39534 ) ) ( CLEAR ?auto_39532 ) ( ON ?auto_39533 ?auto_39534 ) ( CLEAR ?auto_39533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_39527 ?auto_39528 ?auto_39529 ?auto_39530 ?auto_39531 ?auto_39532 ?auto_39533 )
      ( MAKE-8PILE ?auto_39527 ?auto_39528 ?auto_39529 ?auto_39530 ?auto_39531 ?auto_39532 ?auto_39533 ?auto_39534 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39543 - BLOCK
      ?auto_39544 - BLOCK
      ?auto_39545 - BLOCK
      ?auto_39546 - BLOCK
      ?auto_39547 - BLOCK
      ?auto_39548 - BLOCK
      ?auto_39549 - BLOCK
      ?auto_39550 - BLOCK
    )
    :vars
    (
      ?auto_39551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39550 ?auto_39551 ) ( ON-TABLE ?auto_39543 ) ( ON ?auto_39544 ?auto_39543 ) ( ON ?auto_39545 ?auto_39544 ) ( ON ?auto_39546 ?auto_39545 ) ( ON ?auto_39547 ?auto_39546 ) ( not ( = ?auto_39543 ?auto_39544 ) ) ( not ( = ?auto_39543 ?auto_39545 ) ) ( not ( = ?auto_39543 ?auto_39546 ) ) ( not ( = ?auto_39543 ?auto_39547 ) ) ( not ( = ?auto_39543 ?auto_39548 ) ) ( not ( = ?auto_39543 ?auto_39549 ) ) ( not ( = ?auto_39543 ?auto_39550 ) ) ( not ( = ?auto_39543 ?auto_39551 ) ) ( not ( = ?auto_39544 ?auto_39545 ) ) ( not ( = ?auto_39544 ?auto_39546 ) ) ( not ( = ?auto_39544 ?auto_39547 ) ) ( not ( = ?auto_39544 ?auto_39548 ) ) ( not ( = ?auto_39544 ?auto_39549 ) ) ( not ( = ?auto_39544 ?auto_39550 ) ) ( not ( = ?auto_39544 ?auto_39551 ) ) ( not ( = ?auto_39545 ?auto_39546 ) ) ( not ( = ?auto_39545 ?auto_39547 ) ) ( not ( = ?auto_39545 ?auto_39548 ) ) ( not ( = ?auto_39545 ?auto_39549 ) ) ( not ( = ?auto_39545 ?auto_39550 ) ) ( not ( = ?auto_39545 ?auto_39551 ) ) ( not ( = ?auto_39546 ?auto_39547 ) ) ( not ( = ?auto_39546 ?auto_39548 ) ) ( not ( = ?auto_39546 ?auto_39549 ) ) ( not ( = ?auto_39546 ?auto_39550 ) ) ( not ( = ?auto_39546 ?auto_39551 ) ) ( not ( = ?auto_39547 ?auto_39548 ) ) ( not ( = ?auto_39547 ?auto_39549 ) ) ( not ( = ?auto_39547 ?auto_39550 ) ) ( not ( = ?auto_39547 ?auto_39551 ) ) ( not ( = ?auto_39548 ?auto_39549 ) ) ( not ( = ?auto_39548 ?auto_39550 ) ) ( not ( = ?auto_39548 ?auto_39551 ) ) ( not ( = ?auto_39549 ?auto_39550 ) ) ( not ( = ?auto_39549 ?auto_39551 ) ) ( not ( = ?auto_39550 ?auto_39551 ) ) ( ON ?auto_39549 ?auto_39550 ) ( CLEAR ?auto_39547 ) ( ON ?auto_39548 ?auto_39549 ) ( CLEAR ?auto_39548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39543 ?auto_39544 ?auto_39545 ?auto_39546 ?auto_39547 ?auto_39548 )
      ( MAKE-8PILE ?auto_39543 ?auto_39544 ?auto_39545 ?auto_39546 ?auto_39547 ?auto_39548 ?auto_39549 ?auto_39550 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39560 - BLOCK
      ?auto_39561 - BLOCK
      ?auto_39562 - BLOCK
      ?auto_39563 - BLOCK
      ?auto_39564 - BLOCK
      ?auto_39565 - BLOCK
      ?auto_39566 - BLOCK
      ?auto_39567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39567 ) ( ON-TABLE ?auto_39560 ) ( ON ?auto_39561 ?auto_39560 ) ( ON ?auto_39562 ?auto_39561 ) ( ON ?auto_39563 ?auto_39562 ) ( ON ?auto_39564 ?auto_39563 ) ( not ( = ?auto_39560 ?auto_39561 ) ) ( not ( = ?auto_39560 ?auto_39562 ) ) ( not ( = ?auto_39560 ?auto_39563 ) ) ( not ( = ?auto_39560 ?auto_39564 ) ) ( not ( = ?auto_39560 ?auto_39565 ) ) ( not ( = ?auto_39560 ?auto_39566 ) ) ( not ( = ?auto_39560 ?auto_39567 ) ) ( not ( = ?auto_39561 ?auto_39562 ) ) ( not ( = ?auto_39561 ?auto_39563 ) ) ( not ( = ?auto_39561 ?auto_39564 ) ) ( not ( = ?auto_39561 ?auto_39565 ) ) ( not ( = ?auto_39561 ?auto_39566 ) ) ( not ( = ?auto_39561 ?auto_39567 ) ) ( not ( = ?auto_39562 ?auto_39563 ) ) ( not ( = ?auto_39562 ?auto_39564 ) ) ( not ( = ?auto_39562 ?auto_39565 ) ) ( not ( = ?auto_39562 ?auto_39566 ) ) ( not ( = ?auto_39562 ?auto_39567 ) ) ( not ( = ?auto_39563 ?auto_39564 ) ) ( not ( = ?auto_39563 ?auto_39565 ) ) ( not ( = ?auto_39563 ?auto_39566 ) ) ( not ( = ?auto_39563 ?auto_39567 ) ) ( not ( = ?auto_39564 ?auto_39565 ) ) ( not ( = ?auto_39564 ?auto_39566 ) ) ( not ( = ?auto_39564 ?auto_39567 ) ) ( not ( = ?auto_39565 ?auto_39566 ) ) ( not ( = ?auto_39565 ?auto_39567 ) ) ( not ( = ?auto_39566 ?auto_39567 ) ) ( ON ?auto_39566 ?auto_39567 ) ( CLEAR ?auto_39564 ) ( ON ?auto_39565 ?auto_39566 ) ( CLEAR ?auto_39565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39560 ?auto_39561 ?auto_39562 ?auto_39563 ?auto_39564 ?auto_39565 )
      ( MAKE-8PILE ?auto_39560 ?auto_39561 ?auto_39562 ?auto_39563 ?auto_39564 ?auto_39565 ?auto_39566 ?auto_39567 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39576 - BLOCK
      ?auto_39577 - BLOCK
      ?auto_39578 - BLOCK
      ?auto_39579 - BLOCK
      ?auto_39580 - BLOCK
      ?auto_39581 - BLOCK
      ?auto_39582 - BLOCK
      ?auto_39583 - BLOCK
    )
    :vars
    (
      ?auto_39584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39583 ?auto_39584 ) ( ON-TABLE ?auto_39576 ) ( ON ?auto_39577 ?auto_39576 ) ( ON ?auto_39578 ?auto_39577 ) ( ON ?auto_39579 ?auto_39578 ) ( not ( = ?auto_39576 ?auto_39577 ) ) ( not ( = ?auto_39576 ?auto_39578 ) ) ( not ( = ?auto_39576 ?auto_39579 ) ) ( not ( = ?auto_39576 ?auto_39580 ) ) ( not ( = ?auto_39576 ?auto_39581 ) ) ( not ( = ?auto_39576 ?auto_39582 ) ) ( not ( = ?auto_39576 ?auto_39583 ) ) ( not ( = ?auto_39576 ?auto_39584 ) ) ( not ( = ?auto_39577 ?auto_39578 ) ) ( not ( = ?auto_39577 ?auto_39579 ) ) ( not ( = ?auto_39577 ?auto_39580 ) ) ( not ( = ?auto_39577 ?auto_39581 ) ) ( not ( = ?auto_39577 ?auto_39582 ) ) ( not ( = ?auto_39577 ?auto_39583 ) ) ( not ( = ?auto_39577 ?auto_39584 ) ) ( not ( = ?auto_39578 ?auto_39579 ) ) ( not ( = ?auto_39578 ?auto_39580 ) ) ( not ( = ?auto_39578 ?auto_39581 ) ) ( not ( = ?auto_39578 ?auto_39582 ) ) ( not ( = ?auto_39578 ?auto_39583 ) ) ( not ( = ?auto_39578 ?auto_39584 ) ) ( not ( = ?auto_39579 ?auto_39580 ) ) ( not ( = ?auto_39579 ?auto_39581 ) ) ( not ( = ?auto_39579 ?auto_39582 ) ) ( not ( = ?auto_39579 ?auto_39583 ) ) ( not ( = ?auto_39579 ?auto_39584 ) ) ( not ( = ?auto_39580 ?auto_39581 ) ) ( not ( = ?auto_39580 ?auto_39582 ) ) ( not ( = ?auto_39580 ?auto_39583 ) ) ( not ( = ?auto_39580 ?auto_39584 ) ) ( not ( = ?auto_39581 ?auto_39582 ) ) ( not ( = ?auto_39581 ?auto_39583 ) ) ( not ( = ?auto_39581 ?auto_39584 ) ) ( not ( = ?auto_39582 ?auto_39583 ) ) ( not ( = ?auto_39582 ?auto_39584 ) ) ( not ( = ?auto_39583 ?auto_39584 ) ) ( ON ?auto_39582 ?auto_39583 ) ( ON ?auto_39581 ?auto_39582 ) ( CLEAR ?auto_39579 ) ( ON ?auto_39580 ?auto_39581 ) ( CLEAR ?auto_39580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39576 ?auto_39577 ?auto_39578 ?auto_39579 ?auto_39580 )
      ( MAKE-8PILE ?auto_39576 ?auto_39577 ?auto_39578 ?auto_39579 ?auto_39580 ?auto_39581 ?auto_39582 ?auto_39583 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39593 - BLOCK
      ?auto_39594 - BLOCK
      ?auto_39595 - BLOCK
      ?auto_39596 - BLOCK
      ?auto_39597 - BLOCK
      ?auto_39598 - BLOCK
      ?auto_39599 - BLOCK
      ?auto_39600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39600 ) ( ON-TABLE ?auto_39593 ) ( ON ?auto_39594 ?auto_39593 ) ( ON ?auto_39595 ?auto_39594 ) ( ON ?auto_39596 ?auto_39595 ) ( not ( = ?auto_39593 ?auto_39594 ) ) ( not ( = ?auto_39593 ?auto_39595 ) ) ( not ( = ?auto_39593 ?auto_39596 ) ) ( not ( = ?auto_39593 ?auto_39597 ) ) ( not ( = ?auto_39593 ?auto_39598 ) ) ( not ( = ?auto_39593 ?auto_39599 ) ) ( not ( = ?auto_39593 ?auto_39600 ) ) ( not ( = ?auto_39594 ?auto_39595 ) ) ( not ( = ?auto_39594 ?auto_39596 ) ) ( not ( = ?auto_39594 ?auto_39597 ) ) ( not ( = ?auto_39594 ?auto_39598 ) ) ( not ( = ?auto_39594 ?auto_39599 ) ) ( not ( = ?auto_39594 ?auto_39600 ) ) ( not ( = ?auto_39595 ?auto_39596 ) ) ( not ( = ?auto_39595 ?auto_39597 ) ) ( not ( = ?auto_39595 ?auto_39598 ) ) ( not ( = ?auto_39595 ?auto_39599 ) ) ( not ( = ?auto_39595 ?auto_39600 ) ) ( not ( = ?auto_39596 ?auto_39597 ) ) ( not ( = ?auto_39596 ?auto_39598 ) ) ( not ( = ?auto_39596 ?auto_39599 ) ) ( not ( = ?auto_39596 ?auto_39600 ) ) ( not ( = ?auto_39597 ?auto_39598 ) ) ( not ( = ?auto_39597 ?auto_39599 ) ) ( not ( = ?auto_39597 ?auto_39600 ) ) ( not ( = ?auto_39598 ?auto_39599 ) ) ( not ( = ?auto_39598 ?auto_39600 ) ) ( not ( = ?auto_39599 ?auto_39600 ) ) ( ON ?auto_39599 ?auto_39600 ) ( ON ?auto_39598 ?auto_39599 ) ( CLEAR ?auto_39596 ) ( ON ?auto_39597 ?auto_39598 ) ( CLEAR ?auto_39597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39593 ?auto_39594 ?auto_39595 ?auto_39596 ?auto_39597 )
      ( MAKE-8PILE ?auto_39593 ?auto_39594 ?auto_39595 ?auto_39596 ?auto_39597 ?auto_39598 ?auto_39599 ?auto_39600 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39609 - BLOCK
      ?auto_39610 - BLOCK
      ?auto_39611 - BLOCK
      ?auto_39612 - BLOCK
      ?auto_39613 - BLOCK
      ?auto_39614 - BLOCK
      ?auto_39615 - BLOCK
      ?auto_39616 - BLOCK
    )
    :vars
    (
      ?auto_39617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39616 ?auto_39617 ) ( ON-TABLE ?auto_39609 ) ( ON ?auto_39610 ?auto_39609 ) ( ON ?auto_39611 ?auto_39610 ) ( not ( = ?auto_39609 ?auto_39610 ) ) ( not ( = ?auto_39609 ?auto_39611 ) ) ( not ( = ?auto_39609 ?auto_39612 ) ) ( not ( = ?auto_39609 ?auto_39613 ) ) ( not ( = ?auto_39609 ?auto_39614 ) ) ( not ( = ?auto_39609 ?auto_39615 ) ) ( not ( = ?auto_39609 ?auto_39616 ) ) ( not ( = ?auto_39609 ?auto_39617 ) ) ( not ( = ?auto_39610 ?auto_39611 ) ) ( not ( = ?auto_39610 ?auto_39612 ) ) ( not ( = ?auto_39610 ?auto_39613 ) ) ( not ( = ?auto_39610 ?auto_39614 ) ) ( not ( = ?auto_39610 ?auto_39615 ) ) ( not ( = ?auto_39610 ?auto_39616 ) ) ( not ( = ?auto_39610 ?auto_39617 ) ) ( not ( = ?auto_39611 ?auto_39612 ) ) ( not ( = ?auto_39611 ?auto_39613 ) ) ( not ( = ?auto_39611 ?auto_39614 ) ) ( not ( = ?auto_39611 ?auto_39615 ) ) ( not ( = ?auto_39611 ?auto_39616 ) ) ( not ( = ?auto_39611 ?auto_39617 ) ) ( not ( = ?auto_39612 ?auto_39613 ) ) ( not ( = ?auto_39612 ?auto_39614 ) ) ( not ( = ?auto_39612 ?auto_39615 ) ) ( not ( = ?auto_39612 ?auto_39616 ) ) ( not ( = ?auto_39612 ?auto_39617 ) ) ( not ( = ?auto_39613 ?auto_39614 ) ) ( not ( = ?auto_39613 ?auto_39615 ) ) ( not ( = ?auto_39613 ?auto_39616 ) ) ( not ( = ?auto_39613 ?auto_39617 ) ) ( not ( = ?auto_39614 ?auto_39615 ) ) ( not ( = ?auto_39614 ?auto_39616 ) ) ( not ( = ?auto_39614 ?auto_39617 ) ) ( not ( = ?auto_39615 ?auto_39616 ) ) ( not ( = ?auto_39615 ?auto_39617 ) ) ( not ( = ?auto_39616 ?auto_39617 ) ) ( ON ?auto_39615 ?auto_39616 ) ( ON ?auto_39614 ?auto_39615 ) ( ON ?auto_39613 ?auto_39614 ) ( CLEAR ?auto_39611 ) ( ON ?auto_39612 ?auto_39613 ) ( CLEAR ?auto_39612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39609 ?auto_39610 ?auto_39611 ?auto_39612 )
      ( MAKE-8PILE ?auto_39609 ?auto_39610 ?auto_39611 ?auto_39612 ?auto_39613 ?auto_39614 ?auto_39615 ?auto_39616 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39626 - BLOCK
      ?auto_39627 - BLOCK
      ?auto_39628 - BLOCK
      ?auto_39629 - BLOCK
      ?auto_39630 - BLOCK
      ?auto_39631 - BLOCK
      ?auto_39632 - BLOCK
      ?auto_39633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39633 ) ( ON-TABLE ?auto_39626 ) ( ON ?auto_39627 ?auto_39626 ) ( ON ?auto_39628 ?auto_39627 ) ( not ( = ?auto_39626 ?auto_39627 ) ) ( not ( = ?auto_39626 ?auto_39628 ) ) ( not ( = ?auto_39626 ?auto_39629 ) ) ( not ( = ?auto_39626 ?auto_39630 ) ) ( not ( = ?auto_39626 ?auto_39631 ) ) ( not ( = ?auto_39626 ?auto_39632 ) ) ( not ( = ?auto_39626 ?auto_39633 ) ) ( not ( = ?auto_39627 ?auto_39628 ) ) ( not ( = ?auto_39627 ?auto_39629 ) ) ( not ( = ?auto_39627 ?auto_39630 ) ) ( not ( = ?auto_39627 ?auto_39631 ) ) ( not ( = ?auto_39627 ?auto_39632 ) ) ( not ( = ?auto_39627 ?auto_39633 ) ) ( not ( = ?auto_39628 ?auto_39629 ) ) ( not ( = ?auto_39628 ?auto_39630 ) ) ( not ( = ?auto_39628 ?auto_39631 ) ) ( not ( = ?auto_39628 ?auto_39632 ) ) ( not ( = ?auto_39628 ?auto_39633 ) ) ( not ( = ?auto_39629 ?auto_39630 ) ) ( not ( = ?auto_39629 ?auto_39631 ) ) ( not ( = ?auto_39629 ?auto_39632 ) ) ( not ( = ?auto_39629 ?auto_39633 ) ) ( not ( = ?auto_39630 ?auto_39631 ) ) ( not ( = ?auto_39630 ?auto_39632 ) ) ( not ( = ?auto_39630 ?auto_39633 ) ) ( not ( = ?auto_39631 ?auto_39632 ) ) ( not ( = ?auto_39631 ?auto_39633 ) ) ( not ( = ?auto_39632 ?auto_39633 ) ) ( ON ?auto_39632 ?auto_39633 ) ( ON ?auto_39631 ?auto_39632 ) ( ON ?auto_39630 ?auto_39631 ) ( CLEAR ?auto_39628 ) ( ON ?auto_39629 ?auto_39630 ) ( CLEAR ?auto_39629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39626 ?auto_39627 ?auto_39628 ?auto_39629 )
      ( MAKE-8PILE ?auto_39626 ?auto_39627 ?auto_39628 ?auto_39629 ?auto_39630 ?auto_39631 ?auto_39632 ?auto_39633 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39642 - BLOCK
      ?auto_39643 - BLOCK
      ?auto_39644 - BLOCK
      ?auto_39645 - BLOCK
      ?auto_39646 - BLOCK
      ?auto_39647 - BLOCK
      ?auto_39648 - BLOCK
      ?auto_39649 - BLOCK
    )
    :vars
    (
      ?auto_39650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39649 ?auto_39650 ) ( ON-TABLE ?auto_39642 ) ( ON ?auto_39643 ?auto_39642 ) ( not ( = ?auto_39642 ?auto_39643 ) ) ( not ( = ?auto_39642 ?auto_39644 ) ) ( not ( = ?auto_39642 ?auto_39645 ) ) ( not ( = ?auto_39642 ?auto_39646 ) ) ( not ( = ?auto_39642 ?auto_39647 ) ) ( not ( = ?auto_39642 ?auto_39648 ) ) ( not ( = ?auto_39642 ?auto_39649 ) ) ( not ( = ?auto_39642 ?auto_39650 ) ) ( not ( = ?auto_39643 ?auto_39644 ) ) ( not ( = ?auto_39643 ?auto_39645 ) ) ( not ( = ?auto_39643 ?auto_39646 ) ) ( not ( = ?auto_39643 ?auto_39647 ) ) ( not ( = ?auto_39643 ?auto_39648 ) ) ( not ( = ?auto_39643 ?auto_39649 ) ) ( not ( = ?auto_39643 ?auto_39650 ) ) ( not ( = ?auto_39644 ?auto_39645 ) ) ( not ( = ?auto_39644 ?auto_39646 ) ) ( not ( = ?auto_39644 ?auto_39647 ) ) ( not ( = ?auto_39644 ?auto_39648 ) ) ( not ( = ?auto_39644 ?auto_39649 ) ) ( not ( = ?auto_39644 ?auto_39650 ) ) ( not ( = ?auto_39645 ?auto_39646 ) ) ( not ( = ?auto_39645 ?auto_39647 ) ) ( not ( = ?auto_39645 ?auto_39648 ) ) ( not ( = ?auto_39645 ?auto_39649 ) ) ( not ( = ?auto_39645 ?auto_39650 ) ) ( not ( = ?auto_39646 ?auto_39647 ) ) ( not ( = ?auto_39646 ?auto_39648 ) ) ( not ( = ?auto_39646 ?auto_39649 ) ) ( not ( = ?auto_39646 ?auto_39650 ) ) ( not ( = ?auto_39647 ?auto_39648 ) ) ( not ( = ?auto_39647 ?auto_39649 ) ) ( not ( = ?auto_39647 ?auto_39650 ) ) ( not ( = ?auto_39648 ?auto_39649 ) ) ( not ( = ?auto_39648 ?auto_39650 ) ) ( not ( = ?auto_39649 ?auto_39650 ) ) ( ON ?auto_39648 ?auto_39649 ) ( ON ?auto_39647 ?auto_39648 ) ( ON ?auto_39646 ?auto_39647 ) ( ON ?auto_39645 ?auto_39646 ) ( CLEAR ?auto_39643 ) ( ON ?auto_39644 ?auto_39645 ) ( CLEAR ?auto_39644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39642 ?auto_39643 ?auto_39644 )
      ( MAKE-8PILE ?auto_39642 ?auto_39643 ?auto_39644 ?auto_39645 ?auto_39646 ?auto_39647 ?auto_39648 ?auto_39649 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39659 - BLOCK
      ?auto_39660 - BLOCK
      ?auto_39661 - BLOCK
      ?auto_39662 - BLOCK
      ?auto_39663 - BLOCK
      ?auto_39664 - BLOCK
      ?auto_39665 - BLOCK
      ?auto_39666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39666 ) ( ON-TABLE ?auto_39659 ) ( ON ?auto_39660 ?auto_39659 ) ( not ( = ?auto_39659 ?auto_39660 ) ) ( not ( = ?auto_39659 ?auto_39661 ) ) ( not ( = ?auto_39659 ?auto_39662 ) ) ( not ( = ?auto_39659 ?auto_39663 ) ) ( not ( = ?auto_39659 ?auto_39664 ) ) ( not ( = ?auto_39659 ?auto_39665 ) ) ( not ( = ?auto_39659 ?auto_39666 ) ) ( not ( = ?auto_39660 ?auto_39661 ) ) ( not ( = ?auto_39660 ?auto_39662 ) ) ( not ( = ?auto_39660 ?auto_39663 ) ) ( not ( = ?auto_39660 ?auto_39664 ) ) ( not ( = ?auto_39660 ?auto_39665 ) ) ( not ( = ?auto_39660 ?auto_39666 ) ) ( not ( = ?auto_39661 ?auto_39662 ) ) ( not ( = ?auto_39661 ?auto_39663 ) ) ( not ( = ?auto_39661 ?auto_39664 ) ) ( not ( = ?auto_39661 ?auto_39665 ) ) ( not ( = ?auto_39661 ?auto_39666 ) ) ( not ( = ?auto_39662 ?auto_39663 ) ) ( not ( = ?auto_39662 ?auto_39664 ) ) ( not ( = ?auto_39662 ?auto_39665 ) ) ( not ( = ?auto_39662 ?auto_39666 ) ) ( not ( = ?auto_39663 ?auto_39664 ) ) ( not ( = ?auto_39663 ?auto_39665 ) ) ( not ( = ?auto_39663 ?auto_39666 ) ) ( not ( = ?auto_39664 ?auto_39665 ) ) ( not ( = ?auto_39664 ?auto_39666 ) ) ( not ( = ?auto_39665 ?auto_39666 ) ) ( ON ?auto_39665 ?auto_39666 ) ( ON ?auto_39664 ?auto_39665 ) ( ON ?auto_39663 ?auto_39664 ) ( ON ?auto_39662 ?auto_39663 ) ( CLEAR ?auto_39660 ) ( ON ?auto_39661 ?auto_39662 ) ( CLEAR ?auto_39661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39659 ?auto_39660 ?auto_39661 )
      ( MAKE-8PILE ?auto_39659 ?auto_39660 ?auto_39661 ?auto_39662 ?auto_39663 ?auto_39664 ?auto_39665 ?auto_39666 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39675 - BLOCK
      ?auto_39676 - BLOCK
      ?auto_39677 - BLOCK
      ?auto_39678 - BLOCK
      ?auto_39679 - BLOCK
      ?auto_39680 - BLOCK
      ?auto_39681 - BLOCK
      ?auto_39682 - BLOCK
    )
    :vars
    (
      ?auto_39683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39682 ?auto_39683 ) ( ON-TABLE ?auto_39675 ) ( not ( = ?auto_39675 ?auto_39676 ) ) ( not ( = ?auto_39675 ?auto_39677 ) ) ( not ( = ?auto_39675 ?auto_39678 ) ) ( not ( = ?auto_39675 ?auto_39679 ) ) ( not ( = ?auto_39675 ?auto_39680 ) ) ( not ( = ?auto_39675 ?auto_39681 ) ) ( not ( = ?auto_39675 ?auto_39682 ) ) ( not ( = ?auto_39675 ?auto_39683 ) ) ( not ( = ?auto_39676 ?auto_39677 ) ) ( not ( = ?auto_39676 ?auto_39678 ) ) ( not ( = ?auto_39676 ?auto_39679 ) ) ( not ( = ?auto_39676 ?auto_39680 ) ) ( not ( = ?auto_39676 ?auto_39681 ) ) ( not ( = ?auto_39676 ?auto_39682 ) ) ( not ( = ?auto_39676 ?auto_39683 ) ) ( not ( = ?auto_39677 ?auto_39678 ) ) ( not ( = ?auto_39677 ?auto_39679 ) ) ( not ( = ?auto_39677 ?auto_39680 ) ) ( not ( = ?auto_39677 ?auto_39681 ) ) ( not ( = ?auto_39677 ?auto_39682 ) ) ( not ( = ?auto_39677 ?auto_39683 ) ) ( not ( = ?auto_39678 ?auto_39679 ) ) ( not ( = ?auto_39678 ?auto_39680 ) ) ( not ( = ?auto_39678 ?auto_39681 ) ) ( not ( = ?auto_39678 ?auto_39682 ) ) ( not ( = ?auto_39678 ?auto_39683 ) ) ( not ( = ?auto_39679 ?auto_39680 ) ) ( not ( = ?auto_39679 ?auto_39681 ) ) ( not ( = ?auto_39679 ?auto_39682 ) ) ( not ( = ?auto_39679 ?auto_39683 ) ) ( not ( = ?auto_39680 ?auto_39681 ) ) ( not ( = ?auto_39680 ?auto_39682 ) ) ( not ( = ?auto_39680 ?auto_39683 ) ) ( not ( = ?auto_39681 ?auto_39682 ) ) ( not ( = ?auto_39681 ?auto_39683 ) ) ( not ( = ?auto_39682 ?auto_39683 ) ) ( ON ?auto_39681 ?auto_39682 ) ( ON ?auto_39680 ?auto_39681 ) ( ON ?auto_39679 ?auto_39680 ) ( ON ?auto_39678 ?auto_39679 ) ( ON ?auto_39677 ?auto_39678 ) ( CLEAR ?auto_39675 ) ( ON ?auto_39676 ?auto_39677 ) ( CLEAR ?auto_39676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39675 ?auto_39676 )
      ( MAKE-8PILE ?auto_39675 ?auto_39676 ?auto_39677 ?auto_39678 ?auto_39679 ?auto_39680 ?auto_39681 ?auto_39682 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39692 - BLOCK
      ?auto_39693 - BLOCK
      ?auto_39694 - BLOCK
      ?auto_39695 - BLOCK
      ?auto_39696 - BLOCK
      ?auto_39697 - BLOCK
      ?auto_39698 - BLOCK
      ?auto_39699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39699 ) ( ON-TABLE ?auto_39692 ) ( not ( = ?auto_39692 ?auto_39693 ) ) ( not ( = ?auto_39692 ?auto_39694 ) ) ( not ( = ?auto_39692 ?auto_39695 ) ) ( not ( = ?auto_39692 ?auto_39696 ) ) ( not ( = ?auto_39692 ?auto_39697 ) ) ( not ( = ?auto_39692 ?auto_39698 ) ) ( not ( = ?auto_39692 ?auto_39699 ) ) ( not ( = ?auto_39693 ?auto_39694 ) ) ( not ( = ?auto_39693 ?auto_39695 ) ) ( not ( = ?auto_39693 ?auto_39696 ) ) ( not ( = ?auto_39693 ?auto_39697 ) ) ( not ( = ?auto_39693 ?auto_39698 ) ) ( not ( = ?auto_39693 ?auto_39699 ) ) ( not ( = ?auto_39694 ?auto_39695 ) ) ( not ( = ?auto_39694 ?auto_39696 ) ) ( not ( = ?auto_39694 ?auto_39697 ) ) ( not ( = ?auto_39694 ?auto_39698 ) ) ( not ( = ?auto_39694 ?auto_39699 ) ) ( not ( = ?auto_39695 ?auto_39696 ) ) ( not ( = ?auto_39695 ?auto_39697 ) ) ( not ( = ?auto_39695 ?auto_39698 ) ) ( not ( = ?auto_39695 ?auto_39699 ) ) ( not ( = ?auto_39696 ?auto_39697 ) ) ( not ( = ?auto_39696 ?auto_39698 ) ) ( not ( = ?auto_39696 ?auto_39699 ) ) ( not ( = ?auto_39697 ?auto_39698 ) ) ( not ( = ?auto_39697 ?auto_39699 ) ) ( not ( = ?auto_39698 ?auto_39699 ) ) ( ON ?auto_39698 ?auto_39699 ) ( ON ?auto_39697 ?auto_39698 ) ( ON ?auto_39696 ?auto_39697 ) ( ON ?auto_39695 ?auto_39696 ) ( ON ?auto_39694 ?auto_39695 ) ( CLEAR ?auto_39692 ) ( ON ?auto_39693 ?auto_39694 ) ( CLEAR ?auto_39693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39692 ?auto_39693 )
      ( MAKE-8PILE ?auto_39692 ?auto_39693 ?auto_39694 ?auto_39695 ?auto_39696 ?auto_39697 ?auto_39698 ?auto_39699 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39708 - BLOCK
      ?auto_39709 - BLOCK
      ?auto_39710 - BLOCK
      ?auto_39711 - BLOCK
      ?auto_39712 - BLOCK
      ?auto_39713 - BLOCK
      ?auto_39714 - BLOCK
      ?auto_39715 - BLOCK
    )
    :vars
    (
      ?auto_39716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39715 ?auto_39716 ) ( not ( = ?auto_39708 ?auto_39709 ) ) ( not ( = ?auto_39708 ?auto_39710 ) ) ( not ( = ?auto_39708 ?auto_39711 ) ) ( not ( = ?auto_39708 ?auto_39712 ) ) ( not ( = ?auto_39708 ?auto_39713 ) ) ( not ( = ?auto_39708 ?auto_39714 ) ) ( not ( = ?auto_39708 ?auto_39715 ) ) ( not ( = ?auto_39708 ?auto_39716 ) ) ( not ( = ?auto_39709 ?auto_39710 ) ) ( not ( = ?auto_39709 ?auto_39711 ) ) ( not ( = ?auto_39709 ?auto_39712 ) ) ( not ( = ?auto_39709 ?auto_39713 ) ) ( not ( = ?auto_39709 ?auto_39714 ) ) ( not ( = ?auto_39709 ?auto_39715 ) ) ( not ( = ?auto_39709 ?auto_39716 ) ) ( not ( = ?auto_39710 ?auto_39711 ) ) ( not ( = ?auto_39710 ?auto_39712 ) ) ( not ( = ?auto_39710 ?auto_39713 ) ) ( not ( = ?auto_39710 ?auto_39714 ) ) ( not ( = ?auto_39710 ?auto_39715 ) ) ( not ( = ?auto_39710 ?auto_39716 ) ) ( not ( = ?auto_39711 ?auto_39712 ) ) ( not ( = ?auto_39711 ?auto_39713 ) ) ( not ( = ?auto_39711 ?auto_39714 ) ) ( not ( = ?auto_39711 ?auto_39715 ) ) ( not ( = ?auto_39711 ?auto_39716 ) ) ( not ( = ?auto_39712 ?auto_39713 ) ) ( not ( = ?auto_39712 ?auto_39714 ) ) ( not ( = ?auto_39712 ?auto_39715 ) ) ( not ( = ?auto_39712 ?auto_39716 ) ) ( not ( = ?auto_39713 ?auto_39714 ) ) ( not ( = ?auto_39713 ?auto_39715 ) ) ( not ( = ?auto_39713 ?auto_39716 ) ) ( not ( = ?auto_39714 ?auto_39715 ) ) ( not ( = ?auto_39714 ?auto_39716 ) ) ( not ( = ?auto_39715 ?auto_39716 ) ) ( ON ?auto_39714 ?auto_39715 ) ( ON ?auto_39713 ?auto_39714 ) ( ON ?auto_39712 ?auto_39713 ) ( ON ?auto_39711 ?auto_39712 ) ( ON ?auto_39710 ?auto_39711 ) ( ON ?auto_39709 ?auto_39710 ) ( ON ?auto_39708 ?auto_39709 ) ( CLEAR ?auto_39708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39708 )
      ( MAKE-8PILE ?auto_39708 ?auto_39709 ?auto_39710 ?auto_39711 ?auto_39712 ?auto_39713 ?auto_39714 ?auto_39715 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39725 - BLOCK
      ?auto_39726 - BLOCK
      ?auto_39727 - BLOCK
      ?auto_39728 - BLOCK
      ?auto_39729 - BLOCK
      ?auto_39730 - BLOCK
      ?auto_39731 - BLOCK
      ?auto_39732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39732 ) ( not ( = ?auto_39725 ?auto_39726 ) ) ( not ( = ?auto_39725 ?auto_39727 ) ) ( not ( = ?auto_39725 ?auto_39728 ) ) ( not ( = ?auto_39725 ?auto_39729 ) ) ( not ( = ?auto_39725 ?auto_39730 ) ) ( not ( = ?auto_39725 ?auto_39731 ) ) ( not ( = ?auto_39725 ?auto_39732 ) ) ( not ( = ?auto_39726 ?auto_39727 ) ) ( not ( = ?auto_39726 ?auto_39728 ) ) ( not ( = ?auto_39726 ?auto_39729 ) ) ( not ( = ?auto_39726 ?auto_39730 ) ) ( not ( = ?auto_39726 ?auto_39731 ) ) ( not ( = ?auto_39726 ?auto_39732 ) ) ( not ( = ?auto_39727 ?auto_39728 ) ) ( not ( = ?auto_39727 ?auto_39729 ) ) ( not ( = ?auto_39727 ?auto_39730 ) ) ( not ( = ?auto_39727 ?auto_39731 ) ) ( not ( = ?auto_39727 ?auto_39732 ) ) ( not ( = ?auto_39728 ?auto_39729 ) ) ( not ( = ?auto_39728 ?auto_39730 ) ) ( not ( = ?auto_39728 ?auto_39731 ) ) ( not ( = ?auto_39728 ?auto_39732 ) ) ( not ( = ?auto_39729 ?auto_39730 ) ) ( not ( = ?auto_39729 ?auto_39731 ) ) ( not ( = ?auto_39729 ?auto_39732 ) ) ( not ( = ?auto_39730 ?auto_39731 ) ) ( not ( = ?auto_39730 ?auto_39732 ) ) ( not ( = ?auto_39731 ?auto_39732 ) ) ( ON ?auto_39731 ?auto_39732 ) ( ON ?auto_39730 ?auto_39731 ) ( ON ?auto_39729 ?auto_39730 ) ( ON ?auto_39728 ?auto_39729 ) ( ON ?auto_39727 ?auto_39728 ) ( ON ?auto_39726 ?auto_39727 ) ( ON ?auto_39725 ?auto_39726 ) ( CLEAR ?auto_39725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39725 )
      ( MAKE-8PILE ?auto_39725 ?auto_39726 ?auto_39727 ?auto_39728 ?auto_39729 ?auto_39730 ?auto_39731 ?auto_39732 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_39741 - BLOCK
      ?auto_39742 - BLOCK
      ?auto_39743 - BLOCK
      ?auto_39744 - BLOCK
      ?auto_39745 - BLOCK
      ?auto_39746 - BLOCK
      ?auto_39747 - BLOCK
      ?auto_39748 - BLOCK
    )
    :vars
    (
      ?auto_39749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39741 ?auto_39742 ) ) ( not ( = ?auto_39741 ?auto_39743 ) ) ( not ( = ?auto_39741 ?auto_39744 ) ) ( not ( = ?auto_39741 ?auto_39745 ) ) ( not ( = ?auto_39741 ?auto_39746 ) ) ( not ( = ?auto_39741 ?auto_39747 ) ) ( not ( = ?auto_39741 ?auto_39748 ) ) ( not ( = ?auto_39742 ?auto_39743 ) ) ( not ( = ?auto_39742 ?auto_39744 ) ) ( not ( = ?auto_39742 ?auto_39745 ) ) ( not ( = ?auto_39742 ?auto_39746 ) ) ( not ( = ?auto_39742 ?auto_39747 ) ) ( not ( = ?auto_39742 ?auto_39748 ) ) ( not ( = ?auto_39743 ?auto_39744 ) ) ( not ( = ?auto_39743 ?auto_39745 ) ) ( not ( = ?auto_39743 ?auto_39746 ) ) ( not ( = ?auto_39743 ?auto_39747 ) ) ( not ( = ?auto_39743 ?auto_39748 ) ) ( not ( = ?auto_39744 ?auto_39745 ) ) ( not ( = ?auto_39744 ?auto_39746 ) ) ( not ( = ?auto_39744 ?auto_39747 ) ) ( not ( = ?auto_39744 ?auto_39748 ) ) ( not ( = ?auto_39745 ?auto_39746 ) ) ( not ( = ?auto_39745 ?auto_39747 ) ) ( not ( = ?auto_39745 ?auto_39748 ) ) ( not ( = ?auto_39746 ?auto_39747 ) ) ( not ( = ?auto_39746 ?auto_39748 ) ) ( not ( = ?auto_39747 ?auto_39748 ) ) ( ON ?auto_39741 ?auto_39749 ) ( not ( = ?auto_39748 ?auto_39749 ) ) ( not ( = ?auto_39747 ?auto_39749 ) ) ( not ( = ?auto_39746 ?auto_39749 ) ) ( not ( = ?auto_39745 ?auto_39749 ) ) ( not ( = ?auto_39744 ?auto_39749 ) ) ( not ( = ?auto_39743 ?auto_39749 ) ) ( not ( = ?auto_39742 ?auto_39749 ) ) ( not ( = ?auto_39741 ?auto_39749 ) ) ( ON ?auto_39742 ?auto_39741 ) ( ON ?auto_39743 ?auto_39742 ) ( ON ?auto_39744 ?auto_39743 ) ( ON ?auto_39745 ?auto_39744 ) ( ON ?auto_39746 ?auto_39745 ) ( ON ?auto_39747 ?auto_39746 ) ( ON ?auto_39748 ?auto_39747 ) ( CLEAR ?auto_39748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_39748 ?auto_39747 ?auto_39746 ?auto_39745 ?auto_39744 ?auto_39743 ?auto_39742 ?auto_39741 )
      ( MAKE-8PILE ?auto_39741 ?auto_39742 ?auto_39743 ?auto_39744 ?auto_39745 ?auto_39746 ?auto_39747 ?auto_39748 ) )
  )

)

