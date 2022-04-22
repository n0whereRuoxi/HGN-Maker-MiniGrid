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
      ?auto_166715 - BLOCK
    )
    :vars
    (
      ?auto_166716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166715 ?auto_166716 ) ( CLEAR ?auto_166715 ) ( HAND-EMPTY ) ( not ( = ?auto_166715 ?auto_166716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166715 ?auto_166716 )
      ( !PUTDOWN ?auto_166715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166722 - BLOCK
      ?auto_166723 - BLOCK
    )
    :vars
    (
      ?auto_166724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166722 ) ( ON ?auto_166723 ?auto_166724 ) ( CLEAR ?auto_166723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166722 ) ( not ( = ?auto_166722 ?auto_166723 ) ) ( not ( = ?auto_166722 ?auto_166724 ) ) ( not ( = ?auto_166723 ?auto_166724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166723 ?auto_166724 )
      ( !STACK ?auto_166723 ?auto_166722 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166732 - BLOCK
      ?auto_166733 - BLOCK
    )
    :vars
    (
      ?auto_166734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166733 ?auto_166734 ) ( not ( = ?auto_166732 ?auto_166733 ) ) ( not ( = ?auto_166732 ?auto_166734 ) ) ( not ( = ?auto_166733 ?auto_166734 ) ) ( ON ?auto_166732 ?auto_166733 ) ( CLEAR ?auto_166732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166732 )
      ( MAKE-2PILE ?auto_166732 ?auto_166733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166743 - BLOCK
      ?auto_166744 - BLOCK
      ?auto_166745 - BLOCK
    )
    :vars
    (
      ?auto_166746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166744 ) ( ON ?auto_166745 ?auto_166746 ) ( CLEAR ?auto_166745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166743 ) ( ON ?auto_166744 ?auto_166743 ) ( not ( = ?auto_166743 ?auto_166744 ) ) ( not ( = ?auto_166743 ?auto_166745 ) ) ( not ( = ?auto_166743 ?auto_166746 ) ) ( not ( = ?auto_166744 ?auto_166745 ) ) ( not ( = ?auto_166744 ?auto_166746 ) ) ( not ( = ?auto_166745 ?auto_166746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166745 ?auto_166746 )
      ( !STACK ?auto_166745 ?auto_166744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166757 - BLOCK
      ?auto_166758 - BLOCK
      ?auto_166759 - BLOCK
    )
    :vars
    (
      ?auto_166760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166759 ?auto_166760 ) ( ON-TABLE ?auto_166757 ) ( not ( = ?auto_166757 ?auto_166758 ) ) ( not ( = ?auto_166757 ?auto_166759 ) ) ( not ( = ?auto_166757 ?auto_166760 ) ) ( not ( = ?auto_166758 ?auto_166759 ) ) ( not ( = ?auto_166758 ?auto_166760 ) ) ( not ( = ?auto_166759 ?auto_166760 ) ) ( CLEAR ?auto_166757 ) ( ON ?auto_166758 ?auto_166759 ) ( CLEAR ?auto_166758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166757 ?auto_166758 )
      ( MAKE-3PILE ?auto_166757 ?auto_166758 ?auto_166759 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166771 - BLOCK
      ?auto_166772 - BLOCK
      ?auto_166773 - BLOCK
    )
    :vars
    (
      ?auto_166774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166773 ?auto_166774 ) ( not ( = ?auto_166771 ?auto_166772 ) ) ( not ( = ?auto_166771 ?auto_166773 ) ) ( not ( = ?auto_166771 ?auto_166774 ) ) ( not ( = ?auto_166772 ?auto_166773 ) ) ( not ( = ?auto_166772 ?auto_166774 ) ) ( not ( = ?auto_166773 ?auto_166774 ) ) ( ON ?auto_166772 ?auto_166773 ) ( ON ?auto_166771 ?auto_166772 ) ( CLEAR ?auto_166771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166771 )
      ( MAKE-3PILE ?auto_166771 ?auto_166772 ?auto_166773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166786 - BLOCK
      ?auto_166787 - BLOCK
      ?auto_166788 - BLOCK
      ?auto_166789 - BLOCK
    )
    :vars
    (
      ?auto_166790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166788 ) ( ON ?auto_166789 ?auto_166790 ) ( CLEAR ?auto_166789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166786 ) ( ON ?auto_166787 ?auto_166786 ) ( ON ?auto_166788 ?auto_166787 ) ( not ( = ?auto_166786 ?auto_166787 ) ) ( not ( = ?auto_166786 ?auto_166788 ) ) ( not ( = ?auto_166786 ?auto_166789 ) ) ( not ( = ?auto_166786 ?auto_166790 ) ) ( not ( = ?auto_166787 ?auto_166788 ) ) ( not ( = ?auto_166787 ?auto_166789 ) ) ( not ( = ?auto_166787 ?auto_166790 ) ) ( not ( = ?auto_166788 ?auto_166789 ) ) ( not ( = ?auto_166788 ?auto_166790 ) ) ( not ( = ?auto_166789 ?auto_166790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166789 ?auto_166790 )
      ( !STACK ?auto_166789 ?auto_166788 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166804 - BLOCK
      ?auto_166805 - BLOCK
      ?auto_166806 - BLOCK
      ?auto_166807 - BLOCK
    )
    :vars
    (
      ?auto_166808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166807 ?auto_166808 ) ( ON-TABLE ?auto_166804 ) ( ON ?auto_166805 ?auto_166804 ) ( not ( = ?auto_166804 ?auto_166805 ) ) ( not ( = ?auto_166804 ?auto_166806 ) ) ( not ( = ?auto_166804 ?auto_166807 ) ) ( not ( = ?auto_166804 ?auto_166808 ) ) ( not ( = ?auto_166805 ?auto_166806 ) ) ( not ( = ?auto_166805 ?auto_166807 ) ) ( not ( = ?auto_166805 ?auto_166808 ) ) ( not ( = ?auto_166806 ?auto_166807 ) ) ( not ( = ?auto_166806 ?auto_166808 ) ) ( not ( = ?auto_166807 ?auto_166808 ) ) ( CLEAR ?auto_166805 ) ( ON ?auto_166806 ?auto_166807 ) ( CLEAR ?auto_166806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166804 ?auto_166805 ?auto_166806 )
      ( MAKE-4PILE ?auto_166804 ?auto_166805 ?auto_166806 ?auto_166807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166822 - BLOCK
      ?auto_166823 - BLOCK
      ?auto_166824 - BLOCK
      ?auto_166825 - BLOCK
    )
    :vars
    (
      ?auto_166826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166825 ?auto_166826 ) ( ON-TABLE ?auto_166822 ) ( not ( = ?auto_166822 ?auto_166823 ) ) ( not ( = ?auto_166822 ?auto_166824 ) ) ( not ( = ?auto_166822 ?auto_166825 ) ) ( not ( = ?auto_166822 ?auto_166826 ) ) ( not ( = ?auto_166823 ?auto_166824 ) ) ( not ( = ?auto_166823 ?auto_166825 ) ) ( not ( = ?auto_166823 ?auto_166826 ) ) ( not ( = ?auto_166824 ?auto_166825 ) ) ( not ( = ?auto_166824 ?auto_166826 ) ) ( not ( = ?auto_166825 ?auto_166826 ) ) ( ON ?auto_166824 ?auto_166825 ) ( CLEAR ?auto_166822 ) ( ON ?auto_166823 ?auto_166824 ) ( CLEAR ?auto_166823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166822 ?auto_166823 )
      ( MAKE-4PILE ?auto_166822 ?auto_166823 ?auto_166824 ?auto_166825 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166840 - BLOCK
      ?auto_166841 - BLOCK
      ?auto_166842 - BLOCK
      ?auto_166843 - BLOCK
    )
    :vars
    (
      ?auto_166844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166843 ?auto_166844 ) ( not ( = ?auto_166840 ?auto_166841 ) ) ( not ( = ?auto_166840 ?auto_166842 ) ) ( not ( = ?auto_166840 ?auto_166843 ) ) ( not ( = ?auto_166840 ?auto_166844 ) ) ( not ( = ?auto_166841 ?auto_166842 ) ) ( not ( = ?auto_166841 ?auto_166843 ) ) ( not ( = ?auto_166841 ?auto_166844 ) ) ( not ( = ?auto_166842 ?auto_166843 ) ) ( not ( = ?auto_166842 ?auto_166844 ) ) ( not ( = ?auto_166843 ?auto_166844 ) ) ( ON ?auto_166842 ?auto_166843 ) ( ON ?auto_166841 ?auto_166842 ) ( ON ?auto_166840 ?auto_166841 ) ( CLEAR ?auto_166840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166840 )
      ( MAKE-4PILE ?auto_166840 ?auto_166841 ?auto_166842 ?auto_166843 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166859 - BLOCK
      ?auto_166860 - BLOCK
      ?auto_166861 - BLOCK
      ?auto_166862 - BLOCK
      ?auto_166863 - BLOCK
    )
    :vars
    (
      ?auto_166864 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166862 ) ( ON ?auto_166863 ?auto_166864 ) ( CLEAR ?auto_166863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166859 ) ( ON ?auto_166860 ?auto_166859 ) ( ON ?auto_166861 ?auto_166860 ) ( ON ?auto_166862 ?auto_166861 ) ( not ( = ?auto_166859 ?auto_166860 ) ) ( not ( = ?auto_166859 ?auto_166861 ) ) ( not ( = ?auto_166859 ?auto_166862 ) ) ( not ( = ?auto_166859 ?auto_166863 ) ) ( not ( = ?auto_166859 ?auto_166864 ) ) ( not ( = ?auto_166860 ?auto_166861 ) ) ( not ( = ?auto_166860 ?auto_166862 ) ) ( not ( = ?auto_166860 ?auto_166863 ) ) ( not ( = ?auto_166860 ?auto_166864 ) ) ( not ( = ?auto_166861 ?auto_166862 ) ) ( not ( = ?auto_166861 ?auto_166863 ) ) ( not ( = ?auto_166861 ?auto_166864 ) ) ( not ( = ?auto_166862 ?auto_166863 ) ) ( not ( = ?auto_166862 ?auto_166864 ) ) ( not ( = ?auto_166863 ?auto_166864 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166863 ?auto_166864 )
      ( !STACK ?auto_166863 ?auto_166862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166881 - BLOCK
      ?auto_166882 - BLOCK
      ?auto_166883 - BLOCK
      ?auto_166884 - BLOCK
      ?auto_166885 - BLOCK
    )
    :vars
    (
      ?auto_166886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166885 ?auto_166886 ) ( ON-TABLE ?auto_166881 ) ( ON ?auto_166882 ?auto_166881 ) ( ON ?auto_166883 ?auto_166882 ) ( not ( = ?auto_166881 ?auto_166882 ) ) ( not ( = ?auto_166881 ?auto_166883 ) ) ( not ( = ?auto_166881 ?auto_166884 ) ) ( not ( = ?auto_166881 ?auto_166885 ) ) ( not ( = ?auto_166881 ?auto_166886 ) ) ( not ( = ?auto_166882 ?auto_166883 ) ) ( not ( = ?auto_166882 ?auto_166884 ) ) ( not ( = ?auto_166882 ?auto_166885 ) ) ( not ( = ?auto_166882 ?auto_166886 ) ) ( not ( = ?auto_166883 ?auto_166884 ) ) ( not ( = ?auto_166883 ?auto_166885 ) ) ( not ( = ?auto_166883 ?auto_166886 ) ) ( not ( = ?auto_166884 ?auto_166885 ) ) ( not ( = ?auto_166884 ?auto_166886 ) ) ( not ( = ?auto_166885 ?auto_166886 ) ) ( CLEAR ?auto_166883 ) ( ON ?auto_166884 ?auto_166885 ) ( CLEAR ?auto_166884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166881 ?auto_166882 ?auto_166883 ?auto_166884 )
      ( MAKE-5PILE ?auto_166881 ?auto_166882 ?auto_166883 ?auto_166884 ?auto_166885 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166903 - BLOCK
      ?auto_166904 - BLOCK
      ?auto_166905 - BLOCK
      ?auto_166906 - BLOCK
      ?auto_166907 - BLOCK
    )
    :vars
    (
      ?auto_166908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166907 ?auto_166908 ) ( ON-TABLE ?auto_166903 ) ( ON ?auto_166904 ?auto_166903 ) ( not ( = ?auto_166903 ?auto_166904 ) ) ( not ( = ?auto_166903 ?auto_166905 ) ) ( not ( = ?auto_166903 ?auto_166906 ) ) ( not ( = ?auto_166903 ?auto_166907 ) ) ( not ( = ?auto_166903 ?auto_166908 ) ) ( not ( = ?auto_166904 ?auto_166905 ) ) ( not ( = ?auto_166904 ?auto_166906 ) ) ( not ( = ?auto_166904 ?auto_166907 ) ) ( not ( = ?auto_166904 ?auto_166908 ) ) ( not ( = ?auto_166905 ?auto_166906 ) ) ( not ( = ?auto_166905 ?auto_166907 ) ) ( not ( = ?auto_166905 ?auto_166908 ) ) ( not ( = ?auto_166906 ?auto_166907 ) ) ( not ( = ?auto_166906 ?auto_166908 ) ) ( not ( = ?auto_166907 ?auto_166908 ) ) ( ON ?auto_166906 ?auto_166907 ) ( CLEAR ?auto_166904 ) ( ON ?auto_166905 ?auto_166906 ) ( CLEAR ?auto_166905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166903 ?auto_166904 ?auto_166905 )
      ( MAKE-5PILE ?auto_166903 ?auto_166904 ?auto_166905 ?auto_166906 ?auto_166907 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166925 - BLOCK
      ?auto_166926 - BLOCK
      ?auto_166927 - BLOCK
      ?auto_166928 - BLOCK
      ?auto_166929 - BLOCK
    )
    :vars
    (
      ?auto_166930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166929 ?auto_166930 ) ( ON-TABLE ?auto_166925 ) ( not ( = ?auto_166925 ?auto_166926 ) ) ( not ( = ?auto_166925 ?auto_166927 ) ) ( not ( = ?auto_166925 ?auto_166928 ) ) ( not ( = ?auto_166925 ?auto_166929 ) ) ( not ( = ?auto_166925 ?auto_166930 ) ) ( not ( = ?auto_166926 ?auto_166927 ) ) ( not ( = ?auto_166926 ?auto_166928 ) ) ( not ( = ?auto_166926 ?auto_166929 ) ) ( not ( = ?auto_166926 ?auto_166930 ) ) ( not ( = ?auto_166927 ?auto_166928 ) ) ( not ( = ?auto_166927 ?auto_166929 ) ) ( not ( = ?auto_166927 ?auto_166930 ) ) ( not ( = ?auto_166928 ?auto_166929 ) ) ( not ( = ?auto_166928 ?auto_166930 ) ) ( not ( = ?auto_166929 ?auto_166930 ) ) ( ON ?auto_166928 ?auto_166929 ) ( ON ?auto_166927 ?auto_166928 ) ( CLEAR ?auto_166925 ) ( ON ?auto_166926 ?auto_166927 ) ( CLEAR ?auto_166926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166925 ?auto_166926 )
      ( MAKE-5PILE ?auto_166925 ?auto_166926 ?auto_166927 ?auto_166928 ?auto_166929 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166947 - BLOCK
      ?auto_166948 - BLOCK
      ?auto_166949 - BLOCK
      ?auto_166950 - BLOCK
      ?auto_166951 - BLOCK
    )
    :vars
    (
      ?auto_166952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166951 ?auto_166952 ) ( not ( = ?auto_166947 ?auto_166948 ) ) ( not ( = ?auto_166947 ?auto_166949 ) ) ( not ( = ?auto_166947 ?auto_166950 ) ) ( not ( = ?auto_166947 ?auto_166951 ) ) ( not ( = ?auto_166947 ?auto_166952 ) ) ( not ( = ?auto_166948 ?auto_166949 ) ) ( not ( = ?auto_166948 ?auto_166950 ) ) ( not ( = ?auto_166948 ?auto_166951 ) ) ( not ( = ?auto_166948 ?auto_166952 ) ) ( not ( = ?auto_166949 ?auto_166950 ) ) ( not ( = ?auto_166949 ?auto_166951 ) ) ( not ( = ?auto_166949 ?auto_166952 ) ) ( not ( = ?auto_166950 ?auto_166951 ) ) ( not ( = ?auto_166950 ?auto_166952 ) ) ( not ( = ?auto_166951 ?auto_166952 ) ) ( ON ?auto_166950 ?auto_166951 ) ( ON ?auto_166949 ?auto_166950 ) ( ON ?auto_166948 ?auto_166949 ) ( ON ?auto_166947 ?auto_166948 ) ( CLEAR ?auto_166947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166947 )
      ( MAKE-5PILE ?auto_166947 ?auto_166948 ?auto_166949 ?auto_166950 ?auto_166951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166970 - BLOCK
      ?auto_166971 - BLOCK
      ?auto_166972 - BLOCK
      ?auto_166973 - BLOCK
      ?auto_166974 - BLOCK
      ?auto_166975 - BLOCK
    )
    :vars
    (
      ?auto_166976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166974 ) ( ON ?auto_166975 ?auto_166976 ) ( CLEAR ?auto_166975 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166970 ) ( ON ?auto_166971 ?auto_166970 ) ( ON ?auto_166972 ?auto_166971 ) ( ON ?auto_166973 ?auto_166972 ) ( ON ?auto_166974 ?auto_166973 ) ( not ( = ?auto_166970 ?auto_166971 ) ) ( not ( = ?auto_166970 ?auto_166972 ) ) ( not ( = ?auto_166970 ?auto_166973 ) ) ( not ( = ?auto_166970 ?auto_166974 ) ) ( not ( = ?auto_166970 ?auto_166975 ) ) ( not ( = ?auto_166970 ?auto_166976 ) ) ( not ( = ?auto_166971 ?auto_166972 ) ) ( not ( = ?auto_166971 ?auto_166973 ) ) ( not ( = ?auto_166971 ?auto_166974 ) ) ( not ( = ?auto_166971 ?auto_166975 ) ) ( not ( = ?auto_166971 ?auto_166976 ) ) ( not ( = ?auto_166972 ?auto_166973 ) ) ( not ( = ?auto_166972 ?auto_166974 ) ) ( not ( = ?auto_166972 ?auto_166975 ) ) ( not ( = ?auto_166972 ?auto_166976 ) ) ( not ( = ?auto_166973 ?auto_166974 ) ) ( not ( = ?auto_166973 ?auto_166975 ) ) ( not ( = ?auto_166973 ?auto_166976 ) ) ( not ( = ?auto_166974 ?auto_166975 ) ) ( not ( = ?auto_166974 ?auto_166976 ) ) ( not ( = ?auto_166975 ?auto_166976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166975 ?auto_166976 )
      ( !STACK ?auto_166975 ?auto_166974 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166996 - BLOCK
      ?auto_166997 - BLOCK
      ?auto_166998 - BLOCK
      ?auto_166999 - BLOCK
      ?auto_167000 - BLOCK
      ?auto_167001 - BLOCK
    )
    :vars
    (
      ?auto_167002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167001 ?auto_167002 ) ( ON-TABLE ?auto_166996 ) ( ON ?auto_166997 ?auto_166996 ) ( ON ?auto_166998 ?auto_166997 ) ( ON ?auto_166999 ?auto_166998 ) ( not ( = ?auto_166996 ?auto_166997 ) ) ( not ( = ?auto_166996 ?auto_166998 ) ) ( not ( = ?auto_166996 ?auto_166999 ) ) ( not ( = ?auto_166996 ?auto_167000 ) ) ( not ( = ?auto_166996 ?auto_167001 ) ) ( not ( = ?auto_166996 ?auto_167002 ) ) ( not ( = ?auto_166997 ?auto_166998 ) ) ( not ( = ?auto_166997 ?auto_166999 ) ) ( not ( = ?auto_166997 ?auto_167000 ) ) ( not ( = ?auto_166997 ?auto_167001 ) ) ( not ( = ?auto_166997 ?auto_167002 ) ) ( not ( = ?auto_166998 ?auto_166999 ) ) ( not ( = ?auto_166998 ?auto_167000 ) ) ( not ( = ?auto_166998 ?auto_167001 ) ) ( not ( = ?auto_166998 ?auto_167002 ) ) ( not ( = ?auto_166999 ?auto_167000 ) ) ( not ( = ?auto_166999 ?auto_167001 ) ) ( not ( = ?auto_166999 ?auto_167002 ) ) ( not ( = ?auto_167000 ?auto_167001 ) ) ( not ( = ?auto_167000 ?auto_167002 ) ) ( not ( = ?auto_167001 ?auto_167002 ) ) ( CLEAR ?auto_166999 ) ( ON ?auto_167000 ?auto_167001 ) ( CLEAR ?auto_167000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166996 ?auto_166997 ?auto_166998 ?auto_166999 ?auto_167000 )
      ( MAKE-6PILE ?auto_166996 ?auto_166997 ?auto_166998 ?auto_166999 ?auto_167000 ?auto_167001 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167022 - BLOCK
      ?auto_167023 - BLOCK
      ?auto_167024 - BLOCK
      ?auto_167025 - BLOCK
      ?auto_167026 - BLOCK
      ?auto_167027 - BLOCK
    )
    :vars
    (
      ?auto_167028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167027 ?auto_167028 ) ( ON-TABLE ?auto_167022 ) ( ON ?auto_167023 ?auto_167022 ) ( ON ?auto_167024 ?auto_167023 ) ( not ( = ?auto_167022 ?auto_167023 ) ) ( not ( = ?auto_167022 ?auto_167024 ) ) ( not ( = ?auto_167022 ?auto_167025 ) ) ( not ( = ?auto_167022 ?auto_167026 ) ) ( not ( = ?auto_167022 ?auto_167027 ) ) ( not ( = ?auto_167022 ?auto_167028 ) ) ( not ( = ?auto_167023 ?auto_167024 ) ) ( not ( = ?auto_167023 ?auto_167025 ) ) ( not ( = ?auto_167023 ?auto_167026 ) ) ( not ( = ?auto_167023 ?auto_167027 ) ) ( not ( = ?auto_167023 ?auto_167028 ) ) ( not ( = ?auto_167024 ?auto_167025 ) ) ( not ( = ?auto_167024 ?auto_167026 ) ) ( not ( = ?auto_167024 ?auto_167027 ) ) ( not ( = ?auto_167024 ?auto_167028 ) ) ( not ( = ?auto_167025 ?auto_167026 ) ) ( not ( = ?auto_167025 ?auto_167027 ) ) ( not ( = ?auto_167025 ?auto_167028 ) ) ( not ( = ?auto_167026 ?auto_167027 ) ) ( not ( = ?auto_167026 ?auto_167028 ) ) ( not ( = ?auto_167027 ?auto_167028 ) ) ( ON ?auto_167026 ?auto_167027 ) ( CLEAR ?auto_167024 ) ( ON ?auto_167025 ?auto_167026 ) ( CLEAR ?auto_167025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167022 ?auto_167023 ?auto_167024 ?auto_167025 )
      ( MAKE-6PILE ?auto_167022 ?auto_167023 ?auto_167024 ?auto_167025 ?auto_167026 ?auto_167027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167048 - BLOCK
      ?auto_167049 - BLOCK
      ?auto_167050 - BLOCK
      ?auto_167051 - BLOCK
      ?auto_167052 - BLOCK
      ?auto_167053 - BLOCK
    )
    :vars
    (
      ?auto_167054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167053 ?auto_167054 ) ( ON-TABLE ?auto_167048 ) ( ON ?auto_167049 ?auto_167048 ) ( not ( = ?auto_167048 ?auto_167049 ) ) ( not ( = ?auto_167048 ?auto_167050 ) ) ( not ( = ?auto_167048 ?auto_167051 ) ) ( not ( = ?auto_167048 ?auto_167052 ) ) ( not ( = ?auto_167048 ?auto_167053 ) ) ( not ( = ?auto_167048 ?auto_167054 ) ) ( not ( = ?auto_167049 ?auto_167050 ) ) ( not ( = ?auto_167049 ?auto_167051 ) ) ( not ( = ?auto_167049 ?auto_167052 ) ) ( not ( = ?auto_167049 ?auto_167053 ) ) ( not ( = ?auto_167049 ?auto_167054 ) ) ( not ( = ?auto_167050 ?auto_167051 ) ) ( not ( = ?auto_167050 ?auto_167052 ) ) ( not ( = ?auto_167050 ?auto_167053 ) ) ( not ( = ?auto_167050 ?auto_167054 ) ) ( not ( = ?auto_167051 ?auto_167052 ) ) ( not ( = ?auto_167051 ?auto_167053 ) ) ( not ( = ?auto_167051 ?auto_167054 ) ) ( not ( = ?auto_167052 ?auto_167053 ) ) ( not ( = ?auto_167052 ?auto_167054 ) ) ( not ( = ?auto_167053 ?auto_167054 ) ) ( ON ?auto_167052 ?auto_167053 ) ( ON ?auto_167051 ?auto_167052 ) ( CLEAR ?auto_167049 ) ( ON ?auto_167050 ?auto_167051 ) ( CLEAR ?auto_167050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167048 ?auto_167049 ?auto_167050 )
      ( MAKE-6PILE ?auto_167048 ?auto_167049 ?auto_167050 ?auto_167051 ?auto_167052 ?auto_167053 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167074 - BLOCK
      ?auto_167075 - BLOCK
      ?auto_167076 - BLOCK
      ?auto_167077 - BLOCK
      ?auto_167078 - BLOCK
      ?auto_167079 - BLOCK
    )
    :vars
    (
      ?auto_167080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167079 ?auto_167080 ) ( ON-TABLE ?auto_167074 ) ( not ( = ?auto_167074 ?auto_167075 ) ) ( not ( = ?auto_167074 ?auto_167076 ) ) ( not ( = ?auto_167074 ?auto_167077 ) ) ( not ( = ?auto_167074 ?auto_167078 ) ) ( not ( = ?auto_167074 ?auto_167079 ) ) ( not ( = ?auto_167074 ?auto_167080 ) ) ( not ( = ?auto_167075 ?auto_167076 ) ) ( not ( = ?auto_167075 ?auto_167077 ) ) ( not ( = ?auto_167075 ?auto_167078 ) ) ( not ( = ?auto_167075 ?auto_167079 ) ) ( not ( = ?auto_167075 ?auto_167080 ) ) ( not ( = ?auto_167076 ?auto_167077 ) ) ( not ( = ?auto_167076 ?auto_167078 ) ) ( not ( = ?auto_167076 ?auto_167079 ) ) ( not ( = ?auto_167076 ?auto_167080 ) ) ( not ( = ?auto_167077 ?auto_167078 ) ) ( not ( = ?auto_167077 ?auto_167079 ) ) ( not ( = ?auto_167077 ?auto_167080 ) ) ( not ( = ?auto_167078 ?auto_167079 ) ) ( not ( = ?auto_167078 ?auto_167080 ) ) ( not ( = ?auto_167079 ?auto_167080 ) ) ( ON ?auto_167078 ?auto_167079 ) ( ON ?auto_167077 ?auto_167078 ) ( ON ?auto_167076 ?auto_167077 ) ( CLEAR ?auto_167074 ) ( ON ?auto_167075 ?auto_167076 ) ( CLEAR ?auto_167075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167074 ?auto_167075 )
      ( MAKE-6PILE ?auto_167074 ?auto_167075 ?auto_167076 ?auto_167077 ?auto_167078 ?auto_167079 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167100 - BLOCK
      ?auto_167101 - BLOCK
      ?auto_167102 - BLOCK
      ?auto_167103 - BLOCK
      ?auto_167104 - BLOCK
      ?auto_167105 - BLOCK
    )
    :vars
    (
      ?auto_167106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167105 ?auto_167106 ) ( not ( = ?auto_167100 ?auto_167101 ) ) ( not ( = ?auto_167100 ?auto_167102 ) ) ( not ( = ?auto_167100 ?auto_167103 ) ) ( not ( = ?auto_167100 ?auto_167104 ) ) ( not ( = ?auto_167100 ?auto_167105 ) ) ( not ( = ?auto_167100 ?auto_167106 ) ) ( not ( = ?auto_167101 ?auto_167102 ) ) ( not ( = ?auto_167101 ?auto_167103 ) ) ( not ( = ?auto_167101 ?auto_167104 ) ) ( not ( = ?auto_167101 ?auto_167105 ) ) ( not ( = ?auto_167101 ?auto_167106 ) ) ( not ( = ?auto_167102 ?auto_167103 ) ) ( not ( = ?auto_167102 ?auto_167104 ) ) ( not ( = ?auto_167102 ?auto_167105 ) ) ( not ( = ?auto_167102 ?auto_167106 ) ) ( not ( = ?auto_167103 ?auto_167104 ) ) ( not ( = ?auto_167103 ?auto_167105 ) ) ( not ( = ?auto_167103 ?auto_167106 ) ) ( not ( = ?auto_167104 ?auto_167105 ) ) ( not ( = ?auto_167104 ?auto_167106 ) ) ( not ( = ?auto_167105 ?auto_167106 ) ) ( ON ?auto_167104 ?auto_167105 ) ( ON ?auto_167103 ?auto_167104 ) ( ON ?auto_167102 ?auto_167103 ) ( ON ?auto_167101 ?auto_167102 ) ( ON ?auto_167100 ?auto_167101 ) ( CLEAR ?auto_167100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167100 )
      ( MAKE-6PILE ?auto_167100 ?auto_167101 ?auto_167102 ?auto_167103 ?auto_167104 ?auto_167105 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167127 - BLOCK
      ?auto_167128 - BLOCK
      ?auto_167129 - BLOCK
      ?auto_167130 - BLOCK
      ?auto_167131 - BLOCK
      ?auto_167132 - BLOCK
      ?auto_167133 - BLOCK
    )
    :vars
    (
      ?auto_167134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167132 ) ( ON ?auto_167133 ?auto_167134 ) ( CLEAR ?auto_167133 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167127 ) ( ON ?auto_167128 ?auto_167127 ) ( ON ?auto_167129 ?auto_167128 ) ( ON ?auto_167130 ?auto_167129 ) ( ON ?auto_167131 ?auto_167130 ) ( ON ?auto_167132 ?auto_167131 ) ( not ( = ?auto_167127 ?auto_167128 ) ) ( not ( = ?auto_167127 ?auto_167129 ) ) ( not ( = ?auto_167127 ?auto_167130 ) ) ( not ( = ?auto_167127 ?auto_167131 ) ) ( not ( = ?auto_167127 ?auto_167132 ) ) ( not ( = ?auto_167127 ?auto_167133 ) ) ( not ( = ?auto_167127 ?auto_167134 ) ) ( not ( = ?auto_167128 ?auto_167129 ) ) ( not ( = ?auto_167128 ?auto_167130 ) ) ( not ( = ?auto_167128 ?auto_167131 ) ) ( not ( = ?auto_167128 ?auto_167132 ) ) ( not ( = ?auto_167128 ?auto_167133 ) ) ( not ( = ?auto_167128 ?auto_167134 ) ) ( not ( = ?auto_167129 ?auto_167130 ) ) ( not ( = ?auto_167129 ?auto_167131 ) ) ( not ( = ?auto_167129 ?auto_167132 ) ) ( not ( = ?auto_167129 ?auto_167133 ) ) ( not ( = ?auto_167129 ?auto_167134 ) ) ( not ( = ?auto_167130 ?auto_167131 ) ) ( not ( = ?auto_167130 ?auto_167132 ) ) ( not ( = ?auto_167130 ?auto_167133 ) ) ( not ( = ?auto_167130 ?auto_167134 ) ) ( not ( = ?auto_167131 ?auto_167132 ) ) ( not ( = ?auto_167131 ?auto_167133 ) ) ( not ( = ?auto_167131 ?auto_167134 ) ) ( not ( = ?auto_167132 ?auto_167133 ) ) ( not ( = ?auto_167132 ?auto_167134 ) ) ( not ( = ?auto_167133 ?auto_167134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167133 ?auto_167134 )
      ( !STACK ?auto_167133 ?auto_167132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167157 - BLOCK
      ?auto_167158 - BLOCK
      ?auto_167159 - BLOCK
      ?auto_167160 - BLOCK
      ?auto_167161 - BLOCK
      ?auto_167162 - BLOCK
      ?auto_167163 - BLOCK
    )
    :vars
    (
      ?auto_167164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167163 ?auto_167164 ) ( ON-TABLE ?auto_167157 ) ( ON ?auto_167158 ?auto_167157 ) ( ON ?auto_167159 ?auto_167158 ) ( ON ?auto_167160 ?auto_167159 ) ( ON ?auto_167161 ?auto_167160 ) ( not ( = ?auto_167157 ?auto_167158 ) ) ( not ( = ?auto_167157 ?auto_167159 ) ) ( not ( = ?auto_167157 ?auto_167160 ) ) ( not ( = ?auto_167157 ?auto_167161 ) ) ( not ( = ?auto_167157 ?auto_167162 ) ) ( not ( = ?auto_167157 ?auto_167163 ) ) ( not ( = ?auto_167157 ?auto_167164 ) ) ( not ( = ?auto_167158 ?auto_167159 ) ) ( not ( = ?auto_167158 ?auto_167160 ) ) ( not ( = ?auto_167158 ?auto_167161 ) ) ( not ( = ?auto_167158 ?auto_167162 ) ) ( not ( = ?auto_167158 ?auto_167163 ) ) ( not ( = ?auto_167158 ?auto_167164 ) ) ( not ( = ?auto_167159 ?auto_167160 ) ) ( not ( = ?auto_167159 ?auto_167161 ) ) ( not ( = ?auto_167159 ?auto_167162 ) ) ( not ( = ?auto_167159 ?auto_167163 ) ) ( not ( = ?auto_167159 ?auto_167164 ) ) ( not ( = ?auto_167160 ?auto_167161 ) ) ( not ( = ?auto_167160 ?auto_167162 ) ) ( not ( = ?auto_167160 ?auto_167163 ) ) ( not ( = ?auto_167160 ?auto_167164 ) ) ( not ( = ?auto_167161 ?auto_167162 ) ) ( not ( = ?auto_167161 ?auto_167163 ) ) ( not ( = ?auto_167161 ?auto_167164 ) ) ( not ( = ?auto_167162 ?auto_167163 ) ) ( not ( = ?auto_167162 ?auto_167164 ) ) ( not ( = ?auto_167163 ?auto_167164 ) ) ( CLEAR ?auto_167161 ) ( ON ?auto_167162 ?auto_167163 ) ( CLEAR ?auto_167162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167157 ?auto_167158 ?auto_167159 ?auto_167160 ?auto_167161 ?auto_167162 )
      ( MAKE-7PILE ?auto_167157 ?auto_167158 ?auto_167159 ?auto_167160 ?auto_167161 ?auto_167162 ?auto_167163 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167187 - BLOCK
      ?auto_167188 - BLOCK
      ?auto_167189 - BLOCK
      ?auto_167190 - BLOCK
      ?auto_167191 - BLOCK
      ?auto_167192 - BLOCK
      ?auto_167193 - BLOCK
    )
    :vars
    (
      ?auto_167194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167193 ?auto_167194 ) ( ON-TABLE ?auto_167187 ) ( ON ?auto_167188 ?auto_167187 ) ( ON ?auto_167189 ?auto_167188 ) ( ON ?auto_167190 ?auto_167189 ) ( not ( = ?auto_167187 ?auto_167188 ) ) ( not ( = ?auto_167187 ?auto_167189 ) ) ( not ( = ?auto_167187 ?auto_167190 ) ) ( not ( = ?auto_167187 ?auto_167191 ) ) ( not ( = ?auto_167187 ?auto_167192 ) ) ( not ( = ?auto_167187 ?auto_167193 ) ) ( not ( = ?auto_167187 ?auto_167194 ) ) ( not ( = ?auto_167188 ?auto_167189 ) ) ( not ( = ?auto_167188 ?auto_167190 ) ) ( not ( = ?auto_167188 ?auto_167191 ) ) ( not ( = ?auto_167188 ?auto_167192 ) ) ( not ( = ?auto_167188 ?auto_167193 ) ) ( not ( = ?auto_167188 ?auto_167194 ) ) ( not ( = ?auto_167189 ?auto_167190 ) ) ( not ( = ?auto_167189 ?auto_167191 ) ) ( not ( = ?auto_167189 ?auto_167192 ) ) ( not ( = ?auto_167189 ?auto_167193 ) ) ( not ( = ?auto_167189 ?auto_167194 ) ) ( not ( = ?auto_167190 ?auto_167191 ) ) ( not ( = ?auto_167190 ?auto_167192 ) ) ( not ( = ?auto_167190 ?auto_167193 ) ) ( not ( = ?auto_167190 ?auto_167194 ) ) ( not ( = ?auto_167191 ?auto_167192 ) ) ( not ( = ?auto_167191 ?auto_167193 ) ) ( not ( = ?auto_167191 ?auto_167194 ) ) ( not ( = ?auto_167192 ?auto_167193 ) ) ( not ( = ?auto_167192 ?auto_167194 ) ) ( not ( = ?auto_167193 ?auto_167194 ) ) ( ON ?auto_167192 ?auto_167193 ) ( CLEAR ?auto_167190 ) ( ON ?auto_167191 ?auto_167192 ) ( CLEAR ?auto_167191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167187 ?auto_167188 ?auto_167189 ?auto_167190 ?auto_167191 )
      ( MAKE-7PILE ?auto_167187 ?auto_167188 ?auto_167189 ?auto_167190 ?auto_167191 ?auto_167192 ?auto_167193 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167217 - BLOCK
      ?auto_167218 - BLOCK
      ?auto_167219 - BLOCK
      ?auto_167220 - BLOCK
      ?auto_167221 - BLOCK
      ?auto_167222 - BLOCK
      ?auto_167223 - BLOCK
    )
    :vars
    (
      ?auto_167224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167223 ?auto_167224 ) ( ON-TABLE ?auto_167217 ) ( ON ?auto_167218 ?auto_167217 ) ( ON ?auto_167219 ?auto_167218 ) ( not ( = ?auto_167217 ?auto_167218 ) ) ( not ( = ?auto_167217 ?auto_167219 ) ) ( not ( = ?auto_167217 ?auto_167220 ) ) ( not ( = ?auto_167217 ?auto_167221 ) ) ( not ( = ?auto_167217 ?auto_167222 ) ) ( not ( = ?auto_167217 ?auto_167223 ) ) ( not ( = ?auto_167217 ?auto_167224 ) ) ( not ( = ?auto_167218 ?auto_167219 ) ) ( not ( = ?auto_167218 ?auto_167220 ) ) ( not ( = ?auto_167218 ?auto_167221 ) ) ( not ( = ?auto_167218 ?auto_167222 ) ) ( not ( = ?auto_167218 ?auto_167223 ) ) ( not ( = ?auto_167218 ?auto_167224 ) ) ( not ( = ?auto_167219 ?auto_167220 ) ) ( not ( = ?auto_167219 ?auto_167221 ) ) ( not ( = ?auto_167219 ?auto_167222 ) ) ( not ( = ?auto_167219 ?auto_167223 ) ) ( not ( = ?auto_167219 ?auto_167224 ) ) ( not ( = ?auto_167220 ?auto_167221 ) ) ( not ( = ?auto_167220 ?auto_167222 ) ) ( not ( = ?auto_167220 ?auto_167223 ) ) ( not ( = ?auto_167220 ?auto_167224 ) ) ( not ( = ?auto_167221 ?auto_167222 ) ) ( not ( = ?auto_167221 ?auto_167223 ) ) ( not ( = ?auto_167221 ?auto_167224 ) ) ( not ( = ?auto_167222 ?auto_167223 ) ) ( not ( = ?auto_167222 ?auto_167224 ) ) ( not ( = ?auto_167223 ?auto_167224 ) ) ( ON ?auto_167222 ?auto_167223 ) ( ON ?auto_167221 ?auto_167222 ) ( CLEAR ?auto_167219 ) ( ON ?auto_167220 ?auto_167221 ) ( CLEAR ?auto_167220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167217 ?auto_167218 ?auto_167219 ?auto_167220 )
      ( MAKE-7PILE ?auto_167217 ?auto_167218 ?auto_167219 ?auto_167220 ?auto_167221 ?auto_167222 ?auto_167223 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167247 - BLOCK
      ?auto_167248 - BLOCK
      ?auto_167249 - BLOCK
      ?auto_167250 - BLOCK
      ?auto_167251 - BLOCK
      ?auto_167252 - BLOCK
      ?auto_167253 - BLOCK
    )
    :vars
    (
      ?auto_167254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167253 ?auto_167254 ) ( ON-TABLE ?auto_167247 ) ( ON ?auto_167248 ?auto_167247 ) ( not ( = ?auto_167247 ?auto_167248 ) ) ( not ( = ?auto_167247 ?auto_167249 ) ) ( not ( = ?auto_167247 ?auto_167250 ) ) ( not ( = ?auto_167247 ?auto_167251 ) ) ( not ( = ?auto_167247 ?auto_167252 ) ) ( not ( = ?auto_167247 ?auto_167253 ) ) ( not ( = ?auto_167247 ?auto_167254 ) ) ( not ( = ?auto_167248 ?auto_167249 ) ) ( not ( = ?auto_167248 ?auto_167250 ) ) ( not ( = ?auto_167248 ?auto_167251 ) ) ( not ( = ?auto_167248 ?auto_167252 ) ) ( not ( = ?auto_167248 ?auto_167253 ) ) ( not ( = ?auto_167248 ?auto_167254 ) ) ( not ( = ?auto_167249 ?auto_167250 ) ) ( not ( = ?auto_167249 ?auto_167251 ) ) ( not ( = ?auto_167249 ?auto_167252 ) ) ( not ( = ?auto_167249 ?auto_167253 ) ) ( not ( = ?auto_167249 ?auto_167254 ) ) ( not ( = ?auto_167250 ?auto_167251 ) ) ( not ( = ?auto_167250 ?auto_167252 ) ) ( not ( = ?auto_167250 ?auto_167253 ) ) ( not ( = ?auto_167250 ?auto_167254 ) ) ( not ( = ?auto_167251 ?auto_167252 ) ) ( not ( = ?auto_167251 ?auto_167253 ) ) ( not ( = ?auto_167251 ?auto_167254 ) ) ( not ( = ?auto_167252 ?auto_167253 ) ) ( not ( = ?auto_167252 ?auto_167254 ) ) ( not ( = ?auto_167253 ?auto_167254 ) ) ( ON ?auto_167252 ?auto_167253 ) ( ON ?auto_167251 ?auto_167252 ) ( ON ?auto_167250 ?auto_167251 ) ( CLEAR ?auto_167248 ) ( ON ?auto_167249 ?auto_167250 ) ( CLEAR ?auto_167249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167247 ?auto_167248 ?auto_167249 )
      ( MAKE-7PILE ?auto_167247 ?auto_167248 ?auto_167249 ?auto_167250 ?auto_167251 ?auto_167252 ?auto_167253 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167277 - BLOCK
      ?auto_167278 - BLOCK
      ?auto_167279 - BLOCK
      ?auto_167280 - BLOCK
      ?auto_167281 - BLOCK
      ?auto_167282 - BLOCK
      ?auto_167283 - BLOCK
    )
    :vars
    (
      ?auto_167284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167283 ?auto_167284 ) ( ON-TABLE ?auto_167277 ) ( not ( = ?auto_167277 ?auto_167278 ) ) ( not ( = ?auto_167277 ?auto_167279 ) ) ( not ( = ?auto_167277 ?auto_167280 ) ) ( not ( = ?auto_167277 ?auto_167281 ) ) ( not ( = ?auto_167277 ?auto_167282 ) ) ( not ( = ?auto_167277 ?auto_167283 ) ) ( not ( = ?auto_167277 ?auto_167284 ) ) ( not ( = ?auto_167278 ?auto_167279 ) ) ( not ( = ?auto_167278 ?auto_167280 ) ) ( not ( = ?auto_167278 ?auto_167281 ) ) ( not ( = ?auto_167278 ?auto_167282 ) ) ( not ( = ?auto_167278 ?auto_167283 ) ) ( not ( = ?auto_167278 ?auto_167284 ) ) ( not ( = ?auto_167279 ?auto_167280 ) ) ( not ( = ?auto_167279 ?auto_167281 ) ) ( not ( = ?auto_167279 ?auto_167282 ) ) ( not ( = ?auto_167279 ?auto_167283 ) ) ( not ( = ?auto_167279 ?auto_167284 ) ) ( not ( = ?auto_167280 ?auto_167281 ) ) ( not ( = ?auto_167280 ?auto_167282 ) ) ( not ( = ?auto_167280 ?auto_167283 ) ) ( not ( = ?auto_167280 ?auto_167284 ) ) ( not ( = ?auto_167281 ?auto_167282 ) ) ( not ( = ?auto_167281 ?auto_167283 ) ) ( not ( = ?auto_167281 ?auto_167284 ) ) ( not ( = ?auto_167282 ?auto_167283 ) ) ( not ( = ?auto_167282 ?auto_167284 ) ) ( not ( = ?auto_167283 ?auto_167284 ) ) ( ON ?auto_167282 ?auto_167283 ) ( ON ?auto_167281 ?auto_167282 ) ( ON ?auto_167280 ?auto_167281 ) ( ON ?auto_167279 ?auto_167280 ) ( CLEAR ?auto_167277 ) ( ON ?auto_167278 ?auto_167279 ) ( CLEAR ?auto_167278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167277 ?auto_167278 )
      ( MAKE-7PILE ?auto_167277 ?auto_167278 ?auto_167279 ?auto_167280 ?auto_167281 ?auto_167282 ?auto_167283 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167307 - BLOCK
      ?auto_167308 - BLOCK
      ?auto_167309 - BLOCK
      ?auto_167310 - BLOCK
      ?auto_167311 - BLOCK
      ?auto_167312 - BLOCK
      ?auto_167313 - BLOCK
    )
    :vars
    (
      ?auto_167314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167313 ?auto_167314 ) ( not ( = ?auto_167307 ?auto_167308 ) ) ( not ( = ?auto_167307 ?auto_167309 ) ) ( not ( = ?auto_167307 ?auto_167310 ) ) ( not ( = ?auto_167307 ?auto_167311 ) ) ( not ( = ?auto_167307 ?auto_167312 ) ) ( not ( = ?auto_167307 ?auto_167313 ) ) ( not ( = ?auto_167307 ?auto_167314 ) ) ( not ( = ?auto_167308 ?auto_167309 ) ) ( not ( = ?auto_167308 ?auto_167310 ) ) ( not ( = ?auto_167308 ?auto_167311 ) ) ( not ( = ?auto_167308 ?auto_167312 ) ) ( not ( = ?auto_167308 ?auto_167313 ) ) ( not ( = ?auto_167308 ?auto_167314 ) ) ( not ( = ?auto_167309 ?auto_167310 ) ) ( not ( = ?auto_167309 ?auto_167311 ) ) ( not ( = ?auto_167309 ?auto_167312 ) ) ( not ( = ?auto_167309 ?auto_167313 ) ) ( not ( = ?auto_167309 ?auto_167314 ) ) ( not ( = ?auto_167310 ?auto_167311 ) ) ( not ( = ?auto_167310 ?auto_167312 ) ) ( not ( = ?auto_167310 ?auto_167313 ) ) ( not ( = ?auto_167310 ?auto_167314 ) ) ( not ( = ?auto_167311 ?auto_167312 ) ) ( not ( = ?auto_167311 ?auto_167313 ) ) ( not ( = ?auto_167311 ?auto_167314 ) ) ( not ( = ?auto_167312 ?auto_167313 ) ) ( not ( = ?auto_167312 ?auto_167314 ) ) ( not ( = ?auto_167313 ?auto_167314 ) ) ( ON ?auto_167312 ?auto_167313 ) ( ON ?auto_167311 ?auto_167312 ) ( ON ?auto_167310 ?auto_167311 ) ( ON ?auto_167309 ?auto_167310 ) ( ON ?auto_167308 ?auto_167309 ) ( ON ?auto_167307 ?auto_167308 ) ( CLEAR ?auto_167307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167307 )
      ( MAKE-7PILE ?auto_167307 ?auto_167308 ?auto_167309 ?auto_167310 ?auto_167311 ?auto_167312 ?auto_167313 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167338 - BLOCK
      ?auto_167339 - BLOCK
      ?auto_167340 - BLOCK
      ?auto_167341 - BLOCK
      ?auto_167342 - BLOCK
      ?auto_167343 - BLOCK
      ?auto_167344 - BLOCK
      ?auto_167345 - BLOCK
    )
    :vars
    (
      ?auto_167346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167344 ) ( ON ?auto_167345 ?auto_167346 ) ( CLEAR ?auto_167345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167338 ) ( ON ?auto_167339 ?auto_167338 ) ( ON ?auto_167340 ?auto_167339 ) ( ON ?auto_167341 ?auto_167340 ) ( ON ?auto_167342 ?auto_167341 ) ( ON ?auto_167343 ?auto_167342 ) ( ON ?auto_167344 ?auto_167343 ) ( not ( = ?auto_167338 ?auto_167339 ) ) ( not ( = ?auto_167338 ?auto_167340 ) ) ( not ( = ?auto_167338 ?auto_167341 ) ) ( not ( = ?auto_167338 ?auto_167342 ) ) ( not ( = ?auto_167338 ?auto_167343 ) ) ( not ( = ?auto_167338 ?auto_167344 ) ) ( not ( = ?auto_167338 ?auto_167345 ) ) ( not ( = ?auto_167338 ?auto_167346 ) ) ( not ( = ?auto_167339 ?auto_167340 ) ) ( not ( = ?auto_167339 ?auto_167341 ) ) ( not ( = ?auto_167339 ?auto_167342 ) ) ( not ( = ?auto_167339 ?auto_167343 ) ) ( not ( = ?auto_167339 ?auto_167344 ) ) ( not ( = ?auto_167339 ?auto_167345 ) ) ( not ( = ?auto_167339 ?auto_167346 ) ) ( not ( = ?auto_167340 ?auto_167341 ) ) ( not ( = ?auto_167340 ?auto_167342 ) ) ( not ( = ?auto_167340 ?auto_167343 ) ) ( not ( = ?auto_167340 ?auto_167344 ) ) ( not ( = ?auto_167340 ?auto_167345 ) ) ( not ( = ?auto_167340 ?auto_167346 ) ) ( not ( = ?auto_167341 ?auto_167342 ) ) ( not ( = ?auto_167341 ?auto_167343 ) ) ( not ( = ?auto_167341 ?auto_167344 ) ) ( not ( = ?auto_167341 ?auto_167345 ) ) ( not ( = ?auto_167341 ?auto_167346 ) ) ( not ( = ?auto_167342 ?auto_167343 ) ) ( not ( = ?auto_167342 ?auto_167344 ) ) ( not ( = ?auto_167342 ?auto_167345 ) ) ( not ( = ?auto_167342 ?auto_167346 ) ) ( not ( = ?auto_167343 ?auto_167344 ) ) ( not ( = ?auto_167343 ?auto_167345 ) ) ( not ( = ?auto_167343 ?auto_167346 ) ) ( not ( = ?auto_167344 ?auto_167345 ) ) ( not ( = ?auto_167344 ?auto_167346 ) ) ( not ( = ?auto_167345 ?auto_167346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167345 ?auto_167346 )
      ( !STACK ?auto_167345 ?auto_167344 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167372 - BLOCK
      ?auto_167373 - BLOCK
      ?auto_167374 - BLOCK
      ?auto_167375 - BLOCK
      ?auto_167376 - BLOCK
      ?auto_167377 - BLOCK
      ?auto_167378 - BLOCK
      ?auto_167379 - BLOCK
    )
    :vars
    (
      ?auto_167380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167379 ?auto_167380 ) ( ON-TABLE ?auto_167372 ) ( ON ?auto_167373 ?auto_167372 ) ( ON ?auto_167374 ?auto_167373 ) ( ON ?auto_167375 ?auto_167374 ) ( ON ?auto_167376 ?auto_167375 ) ( ON ?auto_167377 ?auto_167376 ) ( not ( = ?auto_167372 ?auto_167373 ) ) ( not ( = ?auto_167372 ?auto_167374 ) ) ( not ( = ?auto_167372 ?auto_167375 ) ) ( not ( = ?auto_167372 ?auto_167376 ) ) ( not ( = ?auto_167372 ?auto_167377 ) ) ( not ( = ?auto_167372 ?auto_167378 ) ) ( not ( = ?auto_167372 ?auto_167379 ) ) ( not ( = ?auto_167372 ?auto_167380 ) ) ( not ( = ?auto_167373 ?auto_167374 ) ) ( not ( = ?auto_167373 ?auto_167375 ) ) ( not ( = ?auto_167373 ?auto_167376 ) ) ( not ( = ?auto_167373 ?auto_167377 ) ) ( not ( = ?auto_167373 ?auto_167378 ) ) ( not ( = ?auto_167373 ?auto_167379 ) ) ( not ( = ?auto_167373 ?auto_167380 ) ) ( not ( = ?auto_167374 ?auto_167375 ) ) ( not ( = ?auto_167374 ?auto_167376 ) ) ( not ( = ?auto_167374 ?auto_167377 ) ) ( not ( = ?auto_167374 ?auto_167378 ) ) ( not ( = ?auto_167374 ?auto_167379 ) ) ( not ( = ?auto_167374 ?auto_167380 ) ) ( not ( = ?auto_167375 ?auto_167376 ) ) ( not ( = ?auto_167375 ?auto_167377 ) ) ( not ( = ?auto_167375 ?auto_167378 ) ) ( not ( = ?auto_167375 ?auto_167379 ) ) ( not ( = ?auto_167375 ?auto_167380 ) ) ( not ( = ?auto_167376 ?auto_167377 ) ) ( not ( = ?auto_167376 ?auto_167378 ) ) ( not ( = ?auto_167376 ?auto_167379 ) ) ( not ( = ?auto_167376 ?auto_167380 ) ) ( not ( = ?auto_167377 ?auto_167378 ) ) ( not ( = ?auto_167377 ?auto_167379 ) ) ( not ( = ?auto_167377 ?auto_167380 ) ) ( not ( = ?auto_167378 ?auto_167379 ) ) ( not ( = ?auto_167378 ?auto_167380 ) ) ( not ( = ?auto_167379 ?auto_167380 ) ) ( CLEAR ?auto_167377 ) ( ON ?auto_167378 ?auto_167379 ) ( CLEAR ?auto_167378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167372 ?auto_167373 ?auto_167374 ?auto_167375 ?auto_167376 ?auto_167377 ?auto_167378 )
      ( MAKE-8PILE ?auto_167372 ?auto_167373 ?auto_167374 ?auto_167375 ?auto_167376 ?auto_167377 ?auto_167378 ?auto_167379 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167406 - BLOCK
      ?auto_167407 - BLOCK
      ?auto_167408 - BLOCK
      ?auto_167409 - BLOCK
      ?auto_167410 - BLOCK
      ?auto_167411 - BLOCK
      ?auto_167412 - BLOCK
      ?auto_167413 - BLOCK
    )
    :vars
    (
      ?auto_167414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167413 ?auto_167414 ) ( ON-TABLE ?auto_167406 ) ( ON ?auto_167407 ?auto_167406 ) ( ON ?auto_167408 ?auto_167407 ) ( ON ?auto_167409 ?auto_167408 ) ( ON ?auto_167410 ?auto_167409 ) ( not ( = ?auto_167406 ?auto_167407 ) ) ( not ( = ?auto_167406 ?auto_167408 ) ) ( not ( = ?auto_167406 ?auto_167409 ) ) ( not ( = ?auto_167406 ?auto_167410 ) ) ( not ( = ?auto_167406 ?auto_167411 ) ) ( not ( = ?auto_167406 ?auto_167412 ) ) ( not ( = ?auto_167406 ?auto_167413 ) ) ( not ( = ?auto_167406 ?auto_167414 ) ) ( not ( = ?auto_167407 ?auto_167408 ) ) ( not ( = ?auto_167407 ?auto_167409 ) ) ( not ( = ?auto_167407 ?auto_167410 ) ) ( not ( = ?auto_167407 ?auto_167411 ) ) ( not ( = ?auto_167407 ?auto_167412 ) ) ( not ( = ?auto_167407 ?auto_167413 ) ) ( not ( = ?auto_167407 ?auto_167414 ) ) ( not ( = ?auto_167408 ?auto_167409 ) ) ( not ( = ?auto_167408 ?auto_167410 ) ) ( not ( = ?auto_167408 ?auto_167411 ) ) ( not ( = ?auto_167408 ?auto_167412 ) ) ( not ( = ?auto_167408 ?auto_167413 ) ) ( not ( = ?auto_167408 ?auto_167414 ) ) ( not ( = ?auto_167409 ?auto_167410 ) ) ( not ( = ?auto_167409 ?auto_167411 ) ) ( not ( = ?auto_167409 ?auto_167412 ) ) ( not ( = ?auto_167409 ?auto_167413 ) ) ( not ( = ?auto_167409 ?auto_167414 ) ) ( not ( = ?auto_167410 ?auto_167411 ) ) ( not ( = ?auto_167410 ?auto_167412 ) ) ( not ( = ?auto_167410 ?auto_167413 ) ) ( not ( = ?auto_167410 ?auto_167414 ) ) ( not ( = ?auto_167411 ?auto_167412 ) ) ( not ( = ?auto_167411 ?auto_167413 ) ) ( not ( = ?auto_167411 ?auto_167414 ) ) ( not ( = ?auto_167412 ?auto_167413 ) ) ( not ( = ?auto_167412 ?auto_167414 ) ) ( not ( = ?auto_167413 ?auto_167414 ) ) ( ON ?auto_167412 ?auto_167413 ) ( CLEAR ?auto_167410 ) ( ON ?auto_167411 ?auto_167412 ) ( CLEAR ?auto_167411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167406 ?auto_167407 ?auto_167408 ?auto_167409 ?auto_167410 ?auto_167411 )
      ( MAKE-8PILE ?auto_167406 ?auto_167407 ?auto_167408 ?auto_167409 ?auto_167410 ?auto_167411 ?auto_167412 ?auto_167413 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167440 - BLOCK
      ?auto_167441 - BLOCK
      ?auto_167442 - BLOCK
      ?auto_167443 - BLOCK
      ?auto_167444 - BLOCK
      ?auto_167445 - BLOCK
      ?auto_167446 - BLOCK
      ?auto_167447 - BLOCK
    )
    :vars
    (
      ?auto_167448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167447 ?auto_167448 ) ( ON-TABLE ?auto_167440 ) ( ON ?auto_167441 ?auto_167440 ) ( ON ?auto_167442 ?auto_167441 ) ( ON ?auto_167443 ?auto_167442 ) ( not ( = ?auto_167440 ?auto_167441 ) ) ( not ( = ?auto_167440 ?auto_167442 ) ) ( not ( = ?auto_167440 ?auto_167443 ) ) ( not ( = ?auto_167440 ?auto_167444 ) ) ( not ( = ?auto_167440 ?auto_167445 ) ) ( not ( = ?auto_167440 ?auto_167446 ) ) ( not ( = ?auto_167440 ?auto_167447 ) ) ( not ( = ?auto_167440 ?auto_167448 ) ) ( not ( = ?auto_167441 ?auto_167442 ) ) ( not ( = ?auto_167441 ?auto_167443 ) ) ( not ( = ?auto_167441 ?auto_167444 ) ) ( not ( = ?auto_167441 ?auto_167445 ) ) ( not ( = ?auto_167441 ?auto_167446 ) ) ( not ( = ?auto_167441 ?auto_167447 ) ) ( not ( = ?auto_167441 ?auto_167448 ) ) ( not ( = ?auto_167442 ?auto_167443 ) ) ( not ( = ?auto_167442 ?auto_167444 ) ) ( not ( = ?auto_167442 ?auto_167445 ) ) ( not ( = ?auto_167442 ?auto_167446 ) ) ( not ( = ?auto_167442 ?auto_167447 ) ) ( not ( = ?auto_167442 ?auto_167448 ) ) ( not ( = ?auto_167443 ?auto_167444 ) ) ( not ( = ?auto_167443 ?auto_167445 ) ) ( not ( = ?auto_167443 ?auto_167446 ) ) ( not ( = ?auto_167443 ?auto_167447 ) ) ( not ( = ?auto_167443 ?auto_167448 ) ) ( not ( = ?auto_167444 ?auto_167445 ) ) ( not ( = ?auto_167444 ?auto_167446 ) ) ( not ( = ?auto_167444 ?auto_167447 ) ) ( not ( = ?auto_167444 ?auto_167448 ) ) ( not ( = ?auto_167445 ?auto_167446 ) ) ( not ( = ?auto_167445 ?auto_167447 ) ) ( not ( = ?auto_167445 ?auto_167448 ) ) ( not ( = ?auto_167446 ?auto_167447 ) ) ( not ( = ?auto_167446 ?auto_167448 ) ) ( not ( = ?auto_167447 ?auto_167448 ) ) ( ON ?auto_167446 ?auto_167447 ) ( ON ?auto_167445 ?auto_167446 ) ( CLEAR ?auto_167443 ) ( ON ?auto_167444 ?auto_167445 ) ( CLEAR ?auto_167444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167440 ?auto_167441 ?auto_167442 ?auto_167443 ?auto_167444 )
      ( MAKE-8PILE ?auto_167440 ?auto_167441 ?auto_167442 ?auto_167443 ?auto_167444 ?auto_167445 ?auto_167446 ?auto_167447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167474 - BLOCK
      ?auto_167475 - BLOCK
      ?auto_167476 - BLOCK
      ?auto_167477 - BLOCK
      ?auto_167478 - BLOCK
      ?auto_167479 - BLOCK
      ?auto_167480 - BLOCK
      ?auto_167481 - BLOCK
    )
    :vars
    (
      ?auto_167482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167481 ?auto_167482 ) ( ON-TABLE ?auto_167474 ) ( ON ?auto_167475 ?auto_167474 ) ( ON ?auto_167476 ?auto_167475 ) ( not ( = ?auto_167474 ?auto_167475 ) ) ( not ( = ?auto_167474 ?auto_167476 ) ) ( not ( = ?auto_167474 ?auto_167477 ) ) ( not ( = ?auto_167474 ?auto_167478 ) ) ( not ( = ?auto_167474 ?auto_167479 ) ) ( not ( = ?auto_167474 ?auto_167480 ) ) ( not ( = ?auto_167474 ?auto_167481 ) ) ( not ( = ?auto_167474 ?auto_167482 ) ) ( not ( = ?auto_167475 ?auto_167476 ) ) ( not ( = ?auto_167475 ?auto_167477 ) ) ( not ( = ?auto_167475 ?auto_167478 ) ) ( not ( = ?auto_167475 ?auto_167479 ) ) ( not ( = ?auto_167475 ?auto_167480 ) ) ( not ( = ?auto_167475 ?auto_167481 ) ) ( not ( = ?auto_167475 ?auto_167482 ) ) ( not ( = ?auto_167476 ?auto_167477 ) ) ( not ( = ?auto_167476 ?auto_167478 ) ) ( not ( = ?auto_167476 ?auto_167479 ) ) ( not ( = ?auto_167476 ?auto_167480 ) ) ( not ( = ?auto_167476 ?auto_167481 ) ) ( not ( = ?auto_167476 ?auto_167482 ) ) ( not ( = ?auto_167477 ?auto_167478 ) ) ( not ( = ?auto_167477 ?auto_167479 ) ) ( not ( = ?auto_167477 ?auto_167480 ) ) ( not ( = ?auto_167477 ?auto_167481 ) ) ( not ( = ?auto_167477 ?auto_167482 ) ) ( not ( = ?auto_167478 ?auto_167479 ) ) ( not ( = ?auto_167478 ?auto_167480 ) ) ( not ( = ?auto_167478 ?auto_167481 ) ) ( not ( = ?auto_167478 ?auto_167482 ) ) ( not ( = ?auto_167479 ?auto_167480 ) ) ( not ( = ?auto_167479 ?auto_167481 ) ) ( not ( = ?auto_167479 ?auto_167482 ) ) ( not ( = ?auto_167480 ?auto_167481 ) ) ( not ( = ?auto_167480 ?auto_167482 ) ) ( not ( = ?auto_167481 ?auto_167482 ) ) ( ON ?auto_167480 ?auto_167481 ) ( ON ?auto_167479 ?auto_167480 ) ( ON ?auto_167478 ?auto_167479 ) ( CLEAR ?auto_167476 ) ( ON ?auto_167477 ?auto_167478 ) ( CLEAR ?auto_167477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167474 ?auto_167475 ?auto_167476 ?auto_167477 )
      ( MAKE-8PILE ?auto_167474 ?auto_167475 ?auto_167476 ?auto_167477 ?auto_167478 ?auto_167479 ?auto_167480 ?auto_167481 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167508 - BLOCK
      ?auto_167509 - BLOCK
      ?auto_167510 - BLOCK
      ?auto_167511 - BLOCK
      ?auto_167512 - BLOCK
      ?auto_167513 - BLOCK
      ?auto_167514 - BLOCK
      ?auto_167515 - BLOCK
    )
    :vars
    (
      ?auto_167516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167515 ?auto_167516 ) ( ON-TABLE ?auto_167508 ) ( ON ?auto_167509 ?auto_167508 ) ( not ( = ?auto_167508 ?auto_167509 ) ) ( not ( = ?auto_167508 ?auto_167510 ) ) ( not ( = ?auto_167508 ?auto_167511 ) ) ( not ( = ?auto_167508 ?auto_167512 ) ) ( not ( = ?auto_167508 ?auto_167513 ) ) ( not ( = ?auto_167508 ?auto_167514 ) ) ( not ( = ?auto_167508 ?auto_167515 ) ) ( not ( = ?auto_167508 ?auto_167516 ) ) ( not ( = ?auto_167509 ?auto_167510 ) ) ( not ( = ?auto_167509 ?auto_167511 ) ) ( not ( = ?auto_167509 ?auto_167512 ) ) ( not ( = ?auto_167509 ?auto_167513 ) ) ( not ( = ?auto_167509 ?auto_167514 ) ) ( not ( = ?auto_167509 ?auto_167515 ) ) ( not ( = ?auto_167509 ?auto_167516 ) ) ( not ( = ?auto_167510 ?auto_167511 ) ) ( not ( = ?auto_167510 ?auto_167512 ) ) ( not ( = ?auto_167510 ?auto_167513 ) ) ( not ( = ?auto_167510 ?auto_167514 ) ) ( not ( = ?auto_167510 ?auto_167515 ) ) ( not ( = ?auto_167510 ?auto_167516 ) ) ( not ( = ?auto_167511 ?auto_167512 ) ) ( not ( = ?auto_167511 ?auto_167513 ) ) ( not ( = ?auto_167511 ?auto_167514 ) ) ( not ( = ?auto_167511 ?auto_167515 ) ) ( not ( = ?auto_167511 ?auto_167516 ) ) ( not ( = ?auto_167512 ?auto_167513 ) ) ( not ( = ?auto_167512 ?auto_167514 ) ) ( not ( = ?auto_167512 ?auto_167515 ) ) ( not ( = ?auto_167512 ?auto_167516 ) ) ( not ( = ?auto_167513 ?auto_167514 ) ) ( not ( = ?auto_167513 ?auto_167515 ) ) ( not ( = ?auto_167513 ?auto_167516 ) ) ( not ( = ?auto_167514 ?auto_167515 ) ) ( not ( = ?auto_167514 ?auto_167516 ) ) ( not ( = ?auto_167515 ?auto_167516 ) ) ( ON ?auto_167514 ?auto_167515 ) ( ON ?auto_167513 ?auto_167514 ) ( ON ?auto_167512 ?auto_167513 ) ( ON ?auto_167511 ?auto_167512 ) ( CLEAR ?auto_167509 ) ( ON ?auto_167510 ?auto_167511 ) ( CLEAR ?auto_167510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167508 ?auto_167509 ?auto_167510 )
      ( MAKE-8PILE ?auto_167508 ?auto_167509 ?auto_167510 ?auto_167511 ?auto_167512 ?auto_167513 ?auto_167514 ?auto_167515 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167542 - BLOCK
      ?auto_167543 - BLOCK
      ?auto_167544 - BLOCK
      ?auto_167545 - BLOCK
      ?auto_167546 - BLOCK
      ?auto_167547 - BLOCK
      ?auto_167548 - BLOCK
      ?auto_167549 - BLOCK
    )
    :vars
    (
      ?auto_167550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167549 ?auto_167550 ) ( ON-TABLE ?auto_167542 ) ( not ( = ?auto_167542 ?auto_167543 ) ) ( not ( = ?auto_167542 ?auto_167544 ) ) ( not ( = ?auto_167542 ?auto_167545 ) ) ( not ( = ?auto_167542 ?auto_167546 ) ) ( not ( = ?auto_167542 ?auto_167547 ) ) ( not ( = ?auto_167542 ?auto_167548 ) ) ( not ( = ?auto_167542 ?auto_167549 ) ) ( not ( = ?auto_167542 ?auto_167550 ) ) ( not ( = ?auto_167543 ?auto_167544 ) ) ( not ( = ?auto_167543 ?auto_167545 ) ) ( not ( = ?auto_167543 ?auto_167546 ) ) ( not ( = ?auto_167543 ?auto_167547 ) ) ( not ( = ?auto_167543 ?auto_167548 ) ) ( not ( = ?auto_167543 ?auto_167549 ) ) ( not ( = ?auto_167543 ?auto_167550 ) ) ( not ( = ?auto_167544 ?auto_167545 ) ) ( not ( = ?auto_167544 ?auto_167546 ) ) ( not ( = ?auto_167544 ?auto_167547 ) ) ( not ( = ?auto_167544 ?auto_167548 ) ) ( not ( = ?auto_167544 ?auto_167549 ) ) ( not ( = ?auto_167544 ?auto_167550 ) ) ( not ( = ?auto_167545 ?auto_167546 ) ) ( not ( = ?auto_167545 ?auto_167547 ) ) ( not ( = ?auto_167545 ?auto_167548 ) ) ( not ( = ?auto_167545 ?auto_167549 ) ) ( not ( = ?auto_167545 ?auto_167550 ) ) ( not ( = ?auto_167546 ?auto_167547 ) ) ( not ( = ?auto_167546 ?auto_167548 ) ) ( not ( = ?auto_167546 ?auto_167549 ) ) ( not ( = ?auto_167546 ?auto_167550 ) ) ( not ( = ?auto_167547 ?auto_167548 ) ) ( not ( = ?auto_167547 ?auto_167549 ) ) ( not ( = ?auto_167547 ?auto_167550 ) ) ( not ( = ?auto_167548 ?auto_167549 ) ) ( not ( = ?auto_167548 ?auto_167550 ) ) ( not ( = ?auto_167549 ?auto_167550 ) ) ( ON ?auto_167548 ?auto_167549 ) ( ON ?auto_167547 ?auto_167548 ) ( ON ?auto_167546 ?auto_167547 ) ( ON ?auto_167545 ?auto_167546 ) ( ON ?auto_167544 ?auto_167545 ) ( CLEAR ?auto_167542 ) ( ON ?auto_167543 ?auto_167544 ) ( CLEAR ?auto_167543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167542 ?auto_167543 )
      ( MAKE-8PILE ?auto_167542 ?auto_167543 ?auto_167544 ?auto_167545 ?auto_167546 ?auto_167547 ?auto_167548 ?auto_167549 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167576 - BLOCK
      ?auto_167577 - BLOCK
      ?auto_167578 - BLOCK
      ?auto_167579 - BLOCK
      ?auto_167580 - BLOCK
      ?auto_167581 - BLOCK
      ?auto_167582 - BLOCK
      ?auto_167583 - BLOCK
    )
    :vars
    (
      ?auto_167584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167583 ?auto_167584 ) ( not ( = ?auto_167576 ?auto_167577 ) ) ( not ( = ?auto_167576 ?auto_167578 ) ) ( not ( = ?auto_167576 ?auto_167579 ) ) ( not ( = ?auto_167576 ?auto_167580 ) ) ( not ( = ?auto_167576 ?auto_167581 ) ) ( not ( = ?auto_167576 ?auto_167582 ) ) ( not ( = ?auto_167576 ?auto_167583 ) ) ( not ( = ?auto_167576 ?auto_167584 ) ) ( not ( = ?auto_167577 ?auto_167578 ) ) ( not ( = ?auto_167577 ?auto_167579 ) ) ( not ( = ?auto_167577 ?auto_167580 ) ) ( not ( = ?auto_167577 ?auto_167581 ) ) ( not ( = ?auto_167577 ?auto_167582 ) ) ( not ( = ?auto_167577 ?auto_167583 ) ) ( not ( = ?auto_167577 ?auto_167584 ) ) ( not ( = ?auto_167578 ?auto_167579 ) ) ( not ( = ?auto_167578 ?auto_167580 ) ) ( not ( = ?auto_167578 ?auto_167581 ) ) ( not ( = ?auto_167578 ?auto_167582 ) ) ( not ( = ?auto_167578 ?auto_167583 ) ) ( not ( = ?auto_167578 ?auto_167584 ) ) ( not ( = ?auto_167579 ?auto_167580 ) ) ( not ( = ?auto_167579 ?auto_167581 ) ) ( not ( = ?auto_167579 ?auto_167582 ) ) ( not ( = ?auto_167579 ?auto_167583 ) ) ( not ( = ?auto_167579 ?auto_167584 ) ) ( not ( = ?auto_167580 ?auto_167581 ) ) ( not ( = ?auto_167580 ?auto_167582 ) ) ( not ( = ?auto_167580 ?auto_167583 ) ) ( not ( = ?auto_167580 ?auto_167584 ) ) ( not ( = ?auto_167581 ?auto_167582 ) ) ( not ( = ?auto_167581 ?auto_167583 ) ) ( not ( = ?auto_167581 ?auto_167584 ) ) ( not ( = ?auto_167582 ?auto_167583 ) ) ( not ( = ?auto_167582 ?auto_167584 ) ) ( not ( = ?auto_167583 ?auto_167584 ) ) ( ON ?auto_167582 ?auto_167583 ) ( ON ?auto_167581 ?auto_167582 ) ( ON ?auto_167580 ?auto_167581 ) ( ON ?auto_167579 ?auto_167580 ) ( ON ?auto_167578 ?auto_167579 ) ( ON ?auto_167577 ?auto_167578 ) ( ON ?auto_167576 ?auto_167577 ) ( CLEAR ?auto_167576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167576 )
      ( MAKE-8PILE ?auto_167576 ?auto_167577 ?auto_167578 ?auto_167579 ?auto_167580 ?auto_167581 ?auto_167582 ?auto_167583 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167611 - BLOCK
      ?auto_167612 - BLOCK
      ?auto_167613 - BLOCK
      ?auto_167614 - BLOCK
      ?auto_167615 - BLOCK
      ?auto_167616 - BLOCK
      ?auto_167617 - BLOCK
      ?auto_167618 - BLOCK
      ?auto_167619 - BLOCK
    )
    :vars
    (
      ?auto_167620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167618 ) ( ON ?auto_167619 ?auto_167620 ) ( CLEAR ?auto_167619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167611 ) ( ON ?auto_167612 ?auto_167611 ) ( ON ?auto_167613 ?auto_167612 ) ( ON ?auto_167614 ?auto_167613 ) ( ON ?auto_167615 ?auto_167614 ) ( ON ?auto_167616 ?auto_167615 ) ( ON ?auto_167617 ?auto_167616 ) ( ON ?auto_167618 ?auto_167617 ) ( not ( = ?auto_167611 ?auto_167612 ) ) ( not ( = ?auto_167611 ?auto_167613 ) ) ( not ( = ?auto_167611 ?auto_167614 ) ) ( not ( = ?auto_167611 ?auto_167615 ) ) ( not ( = ?auto_167611 ?auto_167616 ) ) ( not ( = ?auto_167611 ?auto_167617 ) ) ( not ( = ?auto_167611 ?auto_167618 ) ) ( not ( = ?auto_167611 ?auto_167619 ) ) ( not ( = ?auto_167611 ?auto_167620 ) ) ( not ( = ?auto_167612 ?auto_167613 ) ) ( not ( = ?auto_167612 ?auto_167614 ) ) ( not ( = ?auto_167612 ?auto_167615 ) ) ( not ( = ?auto_167612 ?auto_167616 ) ) ( not ( = ?auto_167612 ?auto_167617 ) ) ( not ( = ?auto_167612 ?auto_167618 ) ) ( not ( = ?auto_167612 ?auto_167619 ) ) ( not ( = ?auto_167612 ?auto_167620 ) ) ( not ( = ?auto_167613 ?auto_167614 ) ) ( not ( = ?auto_167613 ?auto_167615 ) ) ( not ( = ?auto_167613 ?auto_167616 ) ) ( not ( = ?auto_167613 ?auto_167617 ) ) ( not ( = ?auto_167613 ?auto_167618 ) ) ( not ( = ?auto_167613 ?auto_167619 ) ) ( not ( = ?auto_167613 ?auto_167620 ) ) ( not ( = ?auto_167614 ?auto_167615 ) ) ( not ( = ?auto_167614 ?auto_167616 ) ) ( not ( = ?auto_167614 ?auto_167617 ) ) ( not ( = ?auto_167614 ?auto_167618 ) ) ( not ( = ?auto_167614 ?auto_167619 ) ) ( not ( = ?auto_167614 ?auto_167620 ) ) ( not ( = ?auto_167615 ?auto_167616 ) ) ( not ( = ?auto_167615 ?auto_167617 ) ) ( not ( = ?auto_167615 ?auto_167618 ) ) ( not ( = ?auto_167615 ?auto_167619 ) ) ( not ( = ?auto_167615 ?auto_167620 ) ) ( not ( = ?auto_167616 ?auto_167617 ) ) ( not ( = ?auto_167616 ?auto_167618 ) ) ( not ( = ?auto_167616 ?auto_167619 ) ) ( not ( = ?auto_167616 ?auto_167620 ) ) ( not ( = ?auto_167617 ?auto_167618 ) ) ( not ( = ?auto_167617 ?auto_167619 ) ) ( not ( = ?auto_167617 ?auto_167620 ) ) ( not ( = ?auto_167618 ?auto_167619 ) ) ( not ( = ?auto_167618 ?auto_167620 ) ) ( not ( = ?auto_167619 ?auto_167620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167619 ?auto_167620 )
      ( !STACK ?auto_167619 ?auto_167618 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167649 - BLOCK
      ?auto_167650 - BLOCK
      ?auto_167651 - BLOCK
      ?auto_167652 - BLOCK
      ?auto_167653 - BLOCK
      ?auto_167654 - BLOCK
      ?auto_167655 - BLOCK
      ?auto_167656 - BLOCK
      ?auto_167657 - BLOCK
    )
    :vars
    (
      ?auto_167658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167657 ?auto_167658 ) ( ON-TABLE ?auto_167649 ) ( ON ?auto_167650 ?auto_167649 ) ( ON ?auto_167651 ?auto_167650 ) ( ON ?auto_167652 ?auto_167651 ) ( ON ?auto_167653 ?auto_167652 ) ( ON ?auto_167654 ?auto_167653 ) ( ON ?auto_167655 ?auto_167654 ) ( not ( = ?auto_167649 ?auto_167650 ) ) ( not ( = ?auto_167649 ?auto_167651 ) ) ( not ( = ?auto_167649 ?auto_167652 ) ) ( not ( = ?auto_167649 ?auto_167653 ) ) ( not ( = ?auto_167649 ?auto_167654 ) ) ( not ( = ?auto_167649 ?auto_167655 ) ) ( not ( = ?auto_167649 ?auto_167656 ) ) ( not ( = ?auto_167649 ?auto_167657 ) ) ( not ( = ?auto_167649 ?auto_167658 ) ) ( not ( = ?auto_167650 ?auto_167651 ) ) ( not ( = ?auto_167650 ?auto_167652 ) ) ( not ( = ?auto_167650 ?auto_167653 ) ) ( not ( = ?auto_167650 ?auto_167654 ) ) ( not ( = ?auto_167650 ?auto_167655 ) ) ( not ( = ?auto_167650 ?auto_167656 ) ) ( not ( = ?auto_167650 ?auto_167657 ) ) ( not ( = ?auto_167650 ?auto_167658 ) ) ( not ( = ?auto_167651 ?auto_167652 ) ) ( not ( = ?auto_167651 ?auto_167653 ) ) ( not ( = ?auto_167651 ?auto_167654 ) ) ( not ( = ?auto_167651 ?auto_167655 ) ) ( not ( = ?auto_167651 ?auto_167656 ) ) ( not ( = ?auto_167651 ?auto_167657 ) ) ( not ( = ?auto_167651 ?auto_167658 ) ) ( not ( = ?auto_167652 ?auto_167653 ) ) ( not ( = ?auto_167652 ?auto_167654 ) ) ( not ( = ?auto_167652 ?auto_167655 ) ) ( not ( = ?auto_167652 ?auto_167656 ) ) ( not ( = ?auto_167652 ?auto_167657 ) ) ( not ( = ?auto_167652 ?auto_167658 ) ) ( not ( = ?auto_167653 ?auto_167654 ) ) ( not ( = ?auto_167653 ?auto_167655 ) ) ( not ( = ?auto_167653 ?auto_167656 ) ) ( not ( = ?auto_167653 ?auto_167657 ) ) ( not ( = ?auto_167653 ?auto_167658 ) ) ( not ( = ?auto_167654 ?auto_167655 ) ) ( not ( = ?auto_167654 ?auto_167656 ) ) ( not ( = ?auto_167654 ?auto_167657 ) ) ( not ( = ?auto_167654 ?auto_167658 ) ) ( not ( = ?auto_167655 ?auto_167656 ) ) ( not ( = ?auto_167655 ?auto_167657 ) ) ( not ( = ?auto_167655 ?auto_167658 ) ) ( not ( = ?auto_167656 ?auto_167657 ) ) ( not ( = ?auto_167656 ?auto_167658 ) ) ( not ( = ?auto_167657 ?auto_167658 ) ) ( CLEAR ?auto_167655 ) ( ON ?auto_167656 ?auto_167657 ) ( CLEAR ?auto_167656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167649 ?auto_167650 ?auto_167651 ?auto_167652 ?auto_167653 ?auto_167654 ?auto_167655 ?auto_167656 )
      ( MAKE-9PILE ?auto_167649 ?auto_167650 ?auto_167651 ?auto_167652 ?auto_167653 ?auto_167654 ?auto_167655 ?auto_167656 ?auto_167657 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167687 - BLOCK
      ?auto_167688 - BLOCK
      ?auto_167689 - BLOCK
      ?auto_167690 - BLOCK
      ?auto_167691 - BLOCK
      ?auto_167692 - BLOCK
      ?auto_167693 - BLOCK
      ?auto_167694 - BLOCK
      ?auto_167695 - BLOCK
    )
    :vars
    (
      ?auto_167696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167695 ?auto_167696 ) ( ON-TABLE ?auto_167687 ) ( ON ?auto_167688 ?auto_167687 ) ( ON ?auto_167689 ?auto_167688 ) ( ON ?auto_167690 ?auto_167689 ) ( ON ?auto_167691 ?auto_167690 ) ( ON ?auto_167692 ?auto_167691 ) ( not ( = ?auto_167687 ?auto_167688 ) ) ( not ( = ?auto_167687 ?auto_167689 ) ) ( not ( = ?auto_167687 ?auto_167690 ) ) ( not ( = ?auto_167687 ?auto_167691 ) ) ( not ( = ?auto_167687 ?auto_167692 ) ) ( not ( = ?auto_167687 ?auto_167693 ) ) ( not ( = ?auto_167687 ?auto_167694 ) ) ( not ( = ?auto_167687 ?auto_167695 ) ) ( not ( = ?auto_167687 ?auto_167696 ) ) ( not ( = ?auto_167688 ?auto_167689 ) ) ( not ( = ?auto_167688 ?auto_167690 ) ) ( not ( = ?auto_167688 ?auto_167691 ) ) ( not ( = ?auto_167688 ?auto_167692 ) ) ( not ( = ?auto_167688 ?auto_167693 ) ) ( not ( = ?auto_167688 ?auto_167694 ) ) ( not ( = ?auto_167688 ?auto_167695 ) ) ( not ( = ?auto_167688 ?auto_167696 ) ) ( not ( = ?auto_167689 ?auto_167690 ) ) ( not ( = ?auto_167689 ?auto_167691 ) ) ( not ( = ?auto_167689 ?auto_167692 ) ) ( not ( = ?auto_167689 ?auto_167693 ) ) ( not ( = ?auto_167689 ?auto_167694 ) ) ( not ( = ?auto_167689 ?auto_167695 ) ) ( not ( = ?auto_167689 ?auto_167696 ) ) ( not ( = ?auto_167690 ?auto_167691 ) ) ( not ( = ?auto_167690 ?auto_167692 ) ) ( not ( = ?auto_167690 ?auto_167693 ) ) ( not ( = ?auto_167690 ?auto_167694 ) ) ( not ( = ?auto_167690 ?auto_167695 ) ) ( not ( = ?auto_167690 ?auto_167696 ) ) ( not ( = ?auto_167691 ?auto_167692 ) ) ( not ( = ?auto_167691 ?auto_167693 ) ) ( not ( = ?auto_167691 ?auto_167694 ) ) ( not ( = ?auto_167691 ?auto_167695 ) ) ( not ( = ?auto_167691 ?auto_167696 ) ) ( not ( = ?auto_167692 ?auto_167693 ) ) ( not ( = ?auto_167692 ?auto_167694 ) ) ( not ( = ?auto_167692 ?auto_167695 ) ) ( not ( = ?auto_167692 ?auto_167696 ) ) ( not ( = ?auto_167693 ?auto_167694 ) ) ( not ( = ?auto_167693 ?auto_167695 ) ) ( not ( = ?auto_167693 ?auto_167696 ) ) ( not ( = ?auto_167694 ?auto_167695 ) ) ( not ( = ?auto_167694 ?auto_167696 ) ) ( not ( = ?auto_167695 ?auto_167696 ) ) ( ON ?auto_167694 ?auto_167695 ) ( CLEAR ?auto_167692 ) ( ON ?auto_167693 ?auto_167694 ) ( CLEAR ?auto_167693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167687 ?auto_167688 ?auto_167689 ?auto_167690 ?auto_167691 ?auto_167692 ?auto_167693 )
      ( MAKE-9PILE ?auto_167687 ?auto_167688 ?auto_167689 ?auto_167690 ?auto_167691 ?auto_167692 ?auto_167693 ?auto_167694 ?auto_167695 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167725 - BLOCK
      ?auto_167726 - BLOCK
      ?auto_167727 - BLOCK
      ?auto_167728 - BLOCK
      ?auto_167729 - BLOCK
      ?auto_167730 - BLOCK
      ?auto_167731 - BLOCK
      ?auto_167732 - BLOCK
      ?auto_167733 - BLOCK
    )
    :vars
    (
      ?auto_167734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167733 ?auto_167734 ) ( ON-TABLE ?auto_167725 ) ( ON ?auto_167726 ?auto_167725 ) ( ON ?auto_167727 ?auto_167726 ) ( ON ?auto_167728 ?auto_167727 ) ( ON ?auto_167729 ?auto_167728 ) ( not ( = ?auto_167725 ?auto_167726 ) ) ( not ( = ?auto_167725 ?auto_167727 ) ) ( not ( = ?auto_167725 ?auto_167728 ) ) ( not ( = ?auto_167725 ?auto_167729 ) ) ( not ( = ?auto_167725 ?auto_167730 ) ) ( not ( = ?auto_167725 ?auto_167731 ) ) ( not ( = ?auto_167725 ?auto_167732 ) ) ( not ( = ?auto_167725 ?auto_167733 ) ) ( not ( = ?auto_167725 ?auto_167734 ) ) ( not ( = ?auto_167726 ?auto_167727 ) ) ( not ( = ?auto_167726 ?auto_167728 ) ) ( not ( = ?auto_167726 ?auto_167729 ) ) ( not ( = ?auto_167726 ?auto_167730 ) ) ( not ( = ?auto_167726 ?auto_167731 ) ) ( not ( = ?auto_167726 ?auto_167732 ) ) ( not ( = ?auto_167726 ?auto_167733 ) ) ( not ( = ?auto_167726 ?auto_167734 ) ) ( not ( = ?auto_167727 ?auto_167728 ) ) ( not ( = ?auto_167727 ?auto_167729 ) ) ( not ( = ?auto_167727 ?auto_167730 ) ) ( not ( = ?auto_167727 ?auto_167731 ) ) ( not ( = ?auto_167727 ?auto_167732 ) ) ( not ( = ?auto_167727 ?auto_167733 ) ) ( not ( = ?auto_167727 ?auto_167734 ) ) ( not ( = ?auto_167728 ?auto_167729 ) ) ( not ( = ?auto_167728 ?auto_167730 ) ) ( not ( = ?auto_167728 ?auto_167731 ) ) ( not ( = ?auto_167728 ?auto_167732 ) ) ( not ( = ?auto_167728 ?auto_167733 ) ) ( not ( = ?auto_167728 ?auto_167734 ) ) ( not ( = ?auto_167729 ?auto_167730 ) ) ( not ( = ?auto_167729 ?auto_167731 ) ) ( not ( = ?auto_167729 ?auto_167732 ) ) ( not ( = ?auto_167729 ?auto_167733 ) ) ( not ( = ?auto_167729 ?auto_167734 ) ) ( not ( = ?auto_167730 ?auto_167731 ) ) ( not ( = ?auto_167730 ?auto_167732 ) ) ( not ( = ?auto_167730 ?auto_167733 ) ) ( not ( = ?auto_167730 ?auto_167734 ) ) ( not ( = ?auto_167731 ?auto_167732 ) ) ( not ( = ?auto_167731 ?auto_167733 ) ) ( not ( = ?auto_167731 ?auto_167734 ) ) ( not ( = ?auto_167732 ?auto_167733 ) ) ( not ( = ?auto_167732 ?auto_167734 ) ) ( not ( = ?auto_167733 ?auto_167734 ) ) ( ON ?auto_167732 ?auto_167733 ) ( ON ?auto_167731 ?auto_167732 ) ( CLEAR ?auto_167729 ) ( ON ?auto_167730 ?auto_167731 ) ( CLEAR ?auto_167730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167725 ?auto_167726 ?auto_167727 ?auto_167728 ?auto_167729 ?auto_167730 )
      ( MAKE-9PILE ?auto_167725 ?auto_167726 ?auto_167727 ?auto_167728 ?auto_167729 ?auto_167730 ?auto_167731 ?auto_167732 ?auto_167733 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167763 - BLOCK
      ?auto_167764 - BLOCK
      ?auto_167765 - BLOCK
      ?auto_167766 - BLOCK
      ?auto_167767 - BLOCK
      ?auto_167768 - BLOCK
      ?auto_167769 - BLOCK
      ?auto_167770 - BLOCK
      ?auto_167771 - BLOCK
    )
    :vars
    (
      ?auto_167772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167771 ?auto_167772 ) ( ON-TABLE ?auto_167763 ) ( ON ?auto_167764 ?auto_167763 ) ( ON ?auto_167765 ?auto_167764 ) ( ON ?auto_167766 ?auto_167765 ) ( not ( = ?auto_167763 ?auto_167764 ) ) ( not ( = ?auto_167763 ?auto_167765 ) ) ( not ( = ?auto_167763 ?auto_167766 ) ) ( not ( = ?auto_167763 ?auto_167767 ) ) ( not ( = ?auto_167763 ?auto_167768 ) ) ( not ( = ?auto_167763 ?auto_167769 ) ) ( not ( = ?auto_167763 ?auto_167770 ) ) ( not ( = ?auto_167763 ?auto_167771 ) ) ( not ( = ?auto_167763 ?auto_167772 ) ) ( not ( = ?auto_167764 ?auto_167765 ) ) ( not ( = ?auto_167764 ?auto_167766 ) ) ( not ( = ?auto_167764 ?auto_167767 ) ) ( not ( = ?auto_167764 ?auto_167768 ) ) ( not ( = ?auto_167764 ?auto_167769 ) ) ( not ( = ?auto_167764 ?auto_167770 ) ) ( not ( = ?auto_167764 ?auto_167771 ) ) ( not ( = ?auto_167764 ?auto_167772 ) ) ( not ( = ?auto_167765 ?auto_167766 ) ) ( not ( = ?auto_167765 ?auto_167767 ) ) ( not ( = ?auto_167765 ?auto_167768 ) ) ( not ( = ?auto_167765 ?auto_167769 ) ) ( not ( = ?auto_167765 ?auto_167770 ) ) ( not ( = ?auto_167765 ?auto_167771 ) ) ( not ( = ?auto_167765 ?auto_167772 ) ) ( not ( = ?auto_167766 ?auto_167767 ) ) ( not ( = ?auto_167766 ?auto_167768 ) ) ( not ( = ?auto_167766 ?auto_167769 ) ) ( not ( = ?auto_167766 ?auto_167770 ) ) ( not ( = ?auto_167766 ?auto_167771 ) ) ( not ( = ?auto_167766 ?auto_167772 ) ) ( not ( = ?auto_167767 ?auto_167768 ) ) ( not ( = ?auto_167767 ?auto_167769 ) ) ( not ( = ?auto_167767 ?auto_167770 ) ) ( not ( = ?auto_167767 ?auto_167771 ) ) ( not ( = ?auto_167767 ?auto_167772 ) ) ( not ( = ?auto_167768 ?auto_167769 ) ) ( not ( = ?auto_167768 ?auto_167770 ) ) ( not ( = ?auto_167768 ?auto_167771 ) ) ( not ( = ?auto_167768 ?auto_167772 ) ) ( not ( = ?auto_167769 ?auto_167770 ) ) ( not ( = ?auto_167769 ?auto_167771 ) ) ( not ( = ?auto_167769 ?auto_167772 ) ) ( not ( = ?auto_167770 ?auto_167771 ) ) ( not ( = ?auto_167770 ?auto_167772 ) ) ( not ( = ?auto_167771 ?auto_167772 ) ) ( ON ?auto_167770 ?auto_167771 ) ( ON ?auto_167769 ?auto_167770 ) ( ON ?auto_167768 ?auto_167769 ) ( CLEAR ?auto_167766 ) ( ON ?auto_167767 ?auto_167768 ) ( CLEAR ?auto_167767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167763 ?auto_167764 ?auto_167765 ?auto_167766 ?auto_167767 )
      ( MAKE-9PILE ?auto_167763 ?auto_167764 ?auto_167765 ?auto_167766 ?auto_167767 ?auto_167768 ?auto_167769 ?auto_167770 ?auto_167771 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167801 - BLOCK
      ?auto_167802 - BLOCK
      ?auto_167803 - BLOCK
      ?auto_167804 - BLOCK
      ?auto_167805 - BLOCK
      ?auto_167806 - BLOCK
      ?auto_167807 - BLOCK
      ?auto_167808 - BLOCK
      ?auto_167809 - BLOCK
    )
    :vars
    (
      ?auto_167810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167809 ?auto_167810 ) ( ON-TABLE ?auto_167801 ) ( ON ?auto_167802 ?auto_167801 ) ( ON ?auto_167803 ?auto_167802 ) ( not ( = ?auto_167801 ?auto_167802 ) ) ( not ( = ?auto_167801 ?auto_167803 ) ) ( not ( = ?auto_167801 ?auto_167804 ) ) ( not ( = ?auto_167801 ?auto_167805 ) ) ( not ( = ?auto_167801 ?auto_167806 ) ) ( not ( = ?auto_167801 ?auto_167807 ) ) ( not ( = ?auto_167801 ?auto_167808 ) ) ( not ( = ?auto_167801 ?auto_167809 ) ) ( not ( = ?auto_167801 ?auto_167810 ) ) ( not ( = ?auto_167802 ?auto_167803 ) ) ( not ( = ?auto_167802 ?auto_167804 ) ) ( not ( = ?auto_167802 ?auto_167805 ) ) ( not ( = ?auto_167802 ?auto_167806 ) ) ( not ( = ?auto_167802 ?auto_167807 ) ) ( not ( = ?auto_167802 ?auto_167808 ) ) ( not ( = ?auto_167802 ?auto_167809 ) ) ( not ( = ?auto_167802 ?auto_167810 ) ) ( not ( = ?auto_167803 ?auto_167804 ) ) ( not ( = ?auto_167803 ?auto_167805 ) ) ( not ( = ?auto_167803 ?auto_167806 ) ) ( not ( = ?auto_167803 ?auto_167807 ) ) ( not ( = ?auto_167803 ?auto_167808 ) ) ( not ( = ?auto_167803 ?auto_167809 ) ) ( not ( = ?auto_167803 ?auto_167810 ) ) ( not ( = ?auto_167804 ?auto_167805 ) ) ( not ( = ?auto_167804 ?auto_167806 ) ) ( not ( = ?auto_167804 ?auto_167807 ) ) ( not ( = ?auto_167804 ?auto_167808 ) ) ( not ( = ?auto_167804 ?auto_167809 ) ) ( not ( = ?auto_167804 ?auto_167810 ) ) ( not ( = ?auto_167805 ?auto_167806 ) ) ( not ( = ?auto_167805 ?auto_167807 ) ) ( not ( = ?auto_167805 ?auto_167808 ) ) ( not ( = ?auto_167805 ?auto_167809 ) ) ( not ( = ?auto_167805 ?auto_167810 ) ) ( not ( = ?auto_167806 ?auto_167807 ) ) ( not ( = ?auto_167806 ?auto_167808 ) ) ( not ( = ?auto_167806 ?auto_167809 ) ) ( not ( = ?auto_167806 ?auto_167810 ) ) ( not ( = ?auto_167807 ?auto_167808 ) ) ( not ( = ?auto_167807 ?auto_167809 ) ) ( not ( = ?auto_167807 ?auto_167810 ) ) ( not ( = ?auto_167808 ?auto_167809 ) ) ( not ( = ?auto_167808 ?auto_167810 ) ) ( not ( = ?auto_167809 ?auto_167810 ) ) ( ON ?auto_167808 ?auto_167809 ) ( ON ?auto_167807 ?auto_167808 ) ( ON ?auto_167806 ?auto_167807 ) ( ON ?auto_167805 ?auto_167806 ) ( CLEAR ?auto_167803 ) ( ON ?auto_167804 ?auto_167805 ) ( CLEAR ?auto_167804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167801 ?auto_167802 ?auto_167803 ?auto_167804 )
      ( MAKE-9PILE ?auto_167801 ?auto_167802 ?auto_167803 ?auto_167804 ?auto_167805 ?auto_167806 ?auto_167807 ?auto_167808 ?auto_167809 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167839 - BLOCK
      ?auto_167840 - BLOCK
      ?auto_167841 - BLOCK
      ?auto_167842 - BLOCK
      ?auto_167843 - BLOCK
      ?auto_167844 - BLOCK
      ?auto_167845 - BLOCK
      ?auto_167846 - BLOCK
      ?auto_167847 - BLOCK
    )
    :vars
    (
      ?auto_167848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167847 ?auto_167848 ) ( ON-TABLE ?auto_167839 ) ( ON ?auto_167840 ?auto_167839 ) ( not ( = ?auto_167839 ?auto_167840 ) ) ( not ( = ?auto_167839 ?auto_167841 ) ) ( not ( = ?auto_167839 ?auto_167842 ) ) ( not ( = ?auto_167839 ?auto_167843 ) ) ( not ( = ?auto_167839 ?auto_167844 ) ) ( not ( = ?auto_167839 ?auto_167845 ) ) ( not ( = ?auto_167839 ?auto_167846 ) ) ( not ( = ?auto_167839 ?auto_167847 ) ) ( not ( = ?auto_167839 ?auto_167848 ) ) ( not ( = ?auto_167840 ?auto_167841 ) ) ( not ( = ?auto_167840 ?auto_167842 ) ) ( not ( = ?auto_167840 ?auto_167843 ) ) ( not ( = ?auto_167840 ?auto_167844 ) ) ( not ( = ?auto_167840 ?auto_167845 ) ) ( not ( = ?auto_167840 ?auto_167846 ) ) ( not ( = ?auto_167840 ?auto_167847 ) ) ( not ( = ?auto_167840 ?auto_167848 ) ) ( not ( = ?auto_167841 ?auto_167842 ) ) ( not ( = ?auto_167841 ?auto_167843 ) ) ( not ( = ?auto_167841 ?auto_167844 ) ) ( not ( = ?auto_167841 ?auto_167845 ) ) ( not ( = ?auto_167841 ?auto_167846 ) ) ( not ( = ?auto_167841 ?auto_167847 ) ) ( not ( = ?auto_167841 ?auto_167848 ) ) ( not ( = ?auto_167842 ?auto_167843 ) ) ( not ( = ?auto_167842 ?auto_167844 ) ) ( not ( = ?auto_167842 ?auto_167845 ) ) ( not ( = ?auto_167842 ?auto_167846 ) ) ( not ( = ?auto_167842 ?auto_167847 ) ) ( not ( = ?auto_167842 ?auto_167848 ) ) ( not ( = ?auto_167843 ?auto_167844 ) ) ( not ( = ?auto_167843 ?auto_167845 ) ) ( not ( = ?auto_167843 ?auto_167846 ) ) ( not ( = ?auto_167843 ?auto_167847 ) ) ( not ( = ?auto_167843 ?auto_167848 ) ) ( not ( = ?auto_167844 ?auto_167845 ) ) ( not ( = ?auto_167844 ?auto_167846 ) ) ( not ( = ?auto_167844 ?auto_167847 ) ) ( not ( = ?auto_167844 ?auto_167848 ) ) ( not ( = ?auto_167845 ?auto_167846 ) ) ( not ( = ?auto_167845 ?auto_167847 ) ) ( not ( = ?auto_167845 ?auto_167848 ) ) ( not ( = ?auto_167846 ?auto_167847 ) ) ( not ( = ?auto_167846 ?auto_167848 ) ) ( not ( = ?auto_167847 ?auto_167848 ) ) ( ON ?auto_167846 ?auto_167847 ) ( ON ?auto_167845 ?auto_167846 ) ( ON ?auto_167844 ?auto_167845 ) ( ON ?auto_167843 ?auto_167844 ) ( ON ?auto_167842 ?auto_167843 ) ( CLEAR ?auto_167840 ) ( ON ?auto_167841 ?auto_167842 ) ( CLEAR ?auto_167841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167839 ?auto_167840 ?auto_167841 )
      ( MAKE-9PILE ?auto_167839 ?auto_167840 ?auto_167841 ?auto_167842 ?auto_167843 ?auto_167844 ?auto_167845 ?auto_167846 ?auto_167847 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167877 - BLOCK
      ?auto_167878 - BLOCK
      ?auto_167879 - BLOCK
      ?auto_167880 - BLOCK
      ?auto_167881 - BLOCK
      ?auto_167882 - BLOCK
      ?auto_167883 - BLOCK
      ?auto_167884 - BLOCK
      ?auto_167885 - BLOCK
    )
    :vars
    (
      ?auto_167886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167885 ?auto_167886 ) ( ON-TABLE ?auto_167877 ) ( not ( = ?auto_167877 ?auto_167878 ) ) ( not ( = ?auto_167877 ?auto_167879 ) ) ( not ( = ?auto_167877 ?auto_167880 ) ) ( not ( = ?auto_167877 ?auto_167881 ) ) ( not ( = ?auto_167877 ?auto_167882 ) ) ( not ( = ?auto_167877 ?auto_167883 ) ) ( not ( = ?auto_167877 ?auto_167884 ) ) ( not ( = ?auto_167877 ?auto_167885 ) ) ( not ( = ?auto_167877 ?auto_167886 ) ) ( not ( = ?auto_167878 ?auto_167879 ) ) ( not ( = ?auto_167878 ?auto_167880 ) ) ( not ( = ?auto_167878 ?auto_167881 ) ) ( not ( = ?auto_167878 ?auto_167882 ) ) ( not ( = ?auto_167878 ?auto_167883 ) ) ( not ( = ?auto_167878 ?auto_167884 ) ) ( not ( = ?auto_167878 ?auto_167885 ) ) ( not ( = ?auto_167878 ?auto_167886 ) ) ( not ( = ?auto_167879 ?auto_167880 ) ) ( not ( = ?auto_167879 ?auto_167881 ) ) ( not ( = ?auto_167879 ?auto_167882 ) ) ( not ( = ?auto_167879 ?auto_167883 ) ) ( not ( = ?auto_167879 ?auto_167884 ) ) ( not ( = ?auto_167879 ?auto_167885 ) ) ( not ( = ?auto_167879 ?auto_167886 ) ) ( not ( = ?auto_167880 ?auto_167881 ) ) ( not ( = ?auto_167880 ?auto_167882 ) ) ( not ( = ?auto_167880 ?auto_167883 ) ) ( not ( = ?auto_167880 ?auto_167884 ) ) ( not ( = ?auto_167880 ?auto_167885 ) ) ( not ( = ?auto_167880 ?auto_167886 ) ) ( not ( = ?auto_167881 ?auto_167882 ) ) ( not ( = ?auto_167881 ?auto_167883 ) ) ( not ( = ?auto_167881 ?auto_167884 ) ) ( not ( = ?auto_167881 ?auto_167885 ) ) ( not ( = ?auto_167881 ?auto_167886 ) ) ( not ( = ?auto_167882 ?auto_167883 ) ) ( not ( = ?auto_167882 ?auto_167884 ) ) ( not ( = ?auto_167882 ?auto_167885 ) ) ( not ( = ?auto_167882 ?auto_167886 ) ) ( not ( = ?auto_167883 ?auto_167884 ) ) ( not ( = ?auto_167883 ?auto_167885 ) ) ( not ( = ?auto_167883 ?auto_167886 ) ) ( not ( = ?auto_167884 ?auto_167885 ) ) ( not ( = ?auto_167884 ?auto_167886 ) ) ( not ( = ?auto_167885 ?auto_167886 ) ) ( ON ?auto_167884 ?auto_167885 ) ( ON ?auto_167883 ?auto_167884 ) ( ON ?auto_167882 ?auto_167883 ) ( ON ?auto_167881 ?auto_167882 ) ( ON ?auto_167880 ?auto_167881 ) ( ON ?auto_167879 ?auto_167880 ) ( CLEAR ?auto_167877 ) ( ON ?auto_167878 ?auto_167879 ) ( CLEAR ?auto_167878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167877 ?auto_167878 )
      ( MAKE-9PILE ?auto_167877 ?auto_167878 ?auto_167879 ?auto_167880 ?auto_167881 ?auto_167882 ?auto_167883 ?auto_167884 ?auto_167885 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167915 - BLOCK
      ?auto_167916 - BLOCK
      ?auto_167917 - BLOCK
      ?auto_167918 - BLOCK
      ?auto_167919 - BLOCK
      ?auto_167920 - BLOCK
      ?auto_167921 - BLOCK
      ?auto_167922 - BLOCK
      ?auto_167923 - BLOCK
    )
    :vars
    (
      ?auto_167924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167923 ?auto_167924 ) ( not ( = ?auto_167915 ?auto_167916 ) ) ( not ( = ?auto_167915 ?auto_167917 ) ) ( not ( = ?auto_167915 ?auto_167918 ) ) ( not ( = ?auto_167915 ?auto_167919 ) ) ( not ( = ?auto_167915 ?auto_167920 ) ) ( not ( = ?auto_167915 ?auto_167921 ) ) ( not ( = ?auto_167915 ?auto_167922 ) ) ( not ( = ?auto_167915 ?auto_167923 ) ) ( not ( = ?auto_167915 ?auto_167924 ) ) ( not ( = ?auto_167916 ?auto_167917 ) ) ( not ( = ?auto_167916 ?auto_167918 ) ) ( not ( = ?auto_167916 ?auto_167919 ) ) ( not ( = ?auto_167916 ?auto_167920 ) ) ( not ( = ?auto_167916 ?auto_167921 ) ) ( not ( = ?auto_167916 ?auto_167922 ) ) ( not ( = ?auto_167916 ?auto_167923 ) ) ( not ( = ?auto_167916 ?auto_167924 ) ) ( not ( = ?auto_167917 ?auto_167918 ) ) ( not ( = ?auto_167917 ?auto_167919 ) ) ( not ( = ?auto_167917 ?auto_167920 ) ) ( not ( = ?auto_167917 ?auto_167921 ) ) ( not ( = ?auto_167917 ?auto_167922 ) ) ( not ( = ?auto_167917 ?auto_167923 ) ) ( not ( = ?auto_167917 ?auto_167924 ) ) ( not ( = ?auto_167918 ?auto_167919 ) ) ( not ( = ?auto_167918 ?auto_167920 ) ) ( not ( = ?auto_167918 ?auto_167921 ) ) ( not ( = ?auto_167918 ?auto_167922 ) ) ( not ( = ?auto_167918 ?auto_167923 ) ) ( not ( = ?auto_167918 ?auto_167924 ) ) ( not ( = ?auto_167919 ?auto_167920 ) ) ( not ( = ?auto_167919 ?auto_167921 ) ) ( not ( = ?auto_167919 ?auto_167922 ) ) ( not ( = ?auto_167919 ?auto_167923 ) ) ( not ( = ?auto_167919 ?auto_167924 ) ) ( not ( = ?auto_167920 ?auto_167921 ) ) ( not ( = ?auto_167920 ?auto_167922 ) ) ( not ( = ?auto_167920 ?auto_167923 ) ) ( not ( = ?auto_167920 ?auto_167924 ) ) ( not ( = ?auto_167921 ?auto_167922 ) ) ( not ( = ?auto_167921 ?auto_167923 ) ) ( not ( = ?auto_167921 ?auto_167924 ) ) ( not ( = ?auto_167922 ?auto_167923 ) ) ( not ( = ?auto_167922 ?auto_167924 ) ) ( not ( = ?auto_167923 ?auto_167924 ) ) ( ON ?auto_167922 ?auto_167923 ) ( ON ?auto_167921 ?auto_167922 ) ( ON ?auto_167920 ?auto_167921 ) ( ON ?auto_167919 ?auto_167920 ) ( ON ?auto_167918 ?auto_167919 ) ( ON ?auto_167917 ?auto_167918 ) ( ON ?auto_167916 ?auto_167917 ) ( ON ?auto_167915 ?auto_167916 ) ( CLEAR ?auto_167915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167915 )
      ( MAKE-9PILE ?auto_167915 ?auto_167916 ?auto_167917 ?auto_167918 ?auto_167919 ?auto_167920 ?auto_167921 ?auto_167922 ?auto_167923 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_167954 - BLOCK
      ?auto_167955 - BLOCK
      ?auto_167956 - BLOCK
      ?auto_167957 - BLOCK
      ?auto_167958 - BLOCK
      ?auto_167959 - BLOCK
      ?auto_167960 - BLOCK
      ?auto_167961 - BLOCK
      ?auto_167962 - BLOCK
      ?auto_167963 - BLOCK
    )
    :vars
    (
      ?auto_167964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167962 ) ( ON ?auto_167963 ?auto_167964 ) ( CLEAR ?auto_167963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167954 ) ( ON ?auto_167955 ?auto_167954 ) ( ON ?auto_167956 ?auto_167955 ) ( ON ?auto_167957 ?auto_167956 ) ( ON ?auto_167958 ?auto_167957 ) ( ON ?auto_167959 ?auto_167958 ) ( ON ?auto_167960 ?auto_167959 ) ( ON ?auto_167961 ?auto_167960 ) ( ON ?auto_167962 ?auto_167961 ) ( not ( = ?auto_167954 ?auto_167955 ) ) ( not ( = ?auto_167954 ?auto_167956 ) ) ( not ( = ?auto_167954 ?auto_167957 ) ) ( not ( = ?auto_167954 ?auto_167958 ) ) ( not ( = ?auto_167954 ?auto_167959 ) ) ( not ( = ?auto_167954 ?auto_167960 ) ) ( not ( = ?auto_167954 ?auto_167961 ) ) ( not ( = ?auto_167954 ?auto_167962 ) ) ( not ( = ?auto_167954 ?auto_167963 ) ) ( not ( = ?auto_167954 ?auto_167964 ) ) ( not ( = ?auto_167955 ?auto_167956 ) ) ( not ( = ?auto_167955 ?auto_167957 ) ) ( not ( = ?auto_167955 ?auto_167958 ) ) ( not ( = ?auto_167955 ?auto_167959 ) ) ( not ( = ?auto_167955 ?auto_167960 ) ) ( not ( = ?auto_167955 ?auto_167961 ) ) ( not ( = ?auto_167955 ?auto_167962 ) ) ( not ( = ?auto_167955 ?auto_167963 ) ) ( not ( = ?auto_167955 ?auto_167964 ) ) ( not ( = ?auto_167956 ?auto_167957 ) ) ( not ( = ?auto_167956 ?auto_167958 ) ) ( not ( = ?auto_167956 ?auto_167959 ) ) ( not ( = ?auto_167956 ?auto_167960 ) ) ( not ( = ?auto_167956 ?auto_167961 ) ) ( not ( = ?auto_167956 ?auto_167962 ) ) ( not ( = ?auto_167956 ?auto_167963 ) ) ( not ( = ?auto_167956 ?auto_167964 ) ) ( not ( = ?auto_167957 ?auto_167958 ) ) ( not ( = ?auto_167957 ?auto_167959 ) ) ( not ( = ?auto_167957 ?auto_167960 ) ) ( not ( = ?auto_167957 ?auto_167961 ) ) ( not ( = ?auto_167957 ?auto_167962 ) ) ( not ( = ?auto_167957 ?auto_167963 ) ) ( not ( = ?auto_167957 ?auto_167964 ) ) ( not ( = ?auto_167958 ?auto_167959 ) ) ( not ( = ?auto_167958 ?auto_167960 ) ) ( not ( = ?auto_167958 ?auto_167961 ) ) ( not ( = ?auto_167958 ?auto_167962 ) ) ( not ( = ?auto_167958 ?auto_167963 ) ) ( not ( = ?auto_167958 ?auto_167964 ) ) ( not ( = ?auto_167959 ?auto_167960 ) ) ( not ( = ?auto_167959 ?auto_167961 ) ) ( not ( = ?auto_167959 ?auto_167962 ) ) ( not ( = ?auto_167959 ?auto_167963 ) ) ( not ( = ?auto_167959 ?auto_167964 ) ) ( not ( = ?auto_167960 ?auto_167961 ) ) ( not ( = ?auto_167960 ?auto_167962 ) ) ( not ( = ?auto_167960 ?auto_167963 ) ) ( not ( = ?auto_167960 ?auto_167964 ) ) ( not ( = ?auto_167961 ?auto_167962 ) ) ( not ( = ?auto_167961 ?auto_167963 ) ) ( not ( = ?auto_167961 ?auto_167964 ) ) ( not ( = ?auto_167962 ?auto_167963 ) ) ( not ( = ?auto_167962 ?auto_167964 ) ) ( not ( = ?auto_167963 ?auto_167964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167963 ?auto_167964 )
      ( !STACK ?auto_167963 ?auto_167962 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_167996 - BLOCK
      ?auto_167997 - BLOCK
      ?auto_167998 - BLOCK
      ?auto_167999 - BLOCK
      ?auto_168000 - BLOCK
      ?auto_168001 - BLOCK
      ?auto_168002 - BLOCK
      ?auto_168003 - BLOCK
      ?auto_168004 - BLOCK
      ?auto_168005 - BLOCK
    )
    :vars
    (
      ?auto_168006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168005 ?auto_168006 ) ( ON-TABLE ?auto_167996 ) ( ON ?auto_167997 ?auto_167996 ) ( ON ?auto_167998 ?auto_167997 ) ( ON ?auto_167999 ?auto_167998 ) ( ON ?auto_168000 ?auto_167999 ) ( ON ?auto_168001 ?auto_168000 ) ( ON ?auto_168002 ?auto_168001 ) ( ON ?auto_168003 ?auto_168002 ) ( not ( = ?auto_167996 ?auto_167997 ) ) ( not ( = ?auto_167996 ?auto_167998 ) ) ( not ( = ?auto_167996 ?auto_167999 ) ) ( not ( = ?auto_167996 ?auto_168000 ) ) ( not ( = ?auto_167996 ?auto_168001 ) ) ( not ( = ?auto_167996 ?auto_168002 ) ) ( not ( = ?auto_167996 ?auto_168003 ) ) ( not ( = ?auto_167996 ?auto_168004 ) ) ( not ( = ?auto_167996 ?auto_168005 ) ) ( not ( = ?auto_167996 ?auto_168006 ) ) ( not ( = ?auto_167997 ?auto_167998 ) ) ( not ( = ?auto_167997 ?auto_167999 ) ) ( not ( = ?auto_167997 ?auto_168000 ) ) ( not ( = ?auto_167997 ?auto_168001 ) ) ( not ( = ?auto_167997 ?auto_168002 ) ) ( not ( = ?auto_167997 ?auto_168003 ) ) ( not ( = ?auto_167997 ?auto_168004 ) ) ( not ( = ?auto_167997 ?auto_168005 ) ) ( not ( = ?auto_167997 ?auto_168006 ) ) ( not ( = ?auto_167998 ?auto_167999 ) ) ( not ( = ?auto_167998 ?auto_168000 ) ) ( not ( = ?auto_167998 ?auto_168001 ) ) ( not ( = ?auto_167998 ?auto_168002 ) ) ( not ( = ?auto_167998 ?auto_168003 ) ) ( not ( = ?auto_167998 ?auto_168004 ) ) ( not ( = ?auto_167998 ?auto_168005 ) ) ( not ( = ?auto_167998 ?auto_168006 ) ) ( not ( = ?auto_167999 ?auto_168000 ) ) ( not ( = ?auto_167999 ?auto_168001 ) ) ( not ( = ?auto_167999 ?auto_168002 ) ) ( not ( = ?auto_167999 ?auto_168003 ) ) ( not ( = ?auto_167999 ?auto_168004 ) ) ( not ( = ?auto_167999 ?auto_168005 ) ) ( not ( = ?auto_167999 ?auto_168006 ) ) ( not ( = ?auto_168000 ?auto_168001 ) ) ( not ( = ?auto_168000 ?auto_168002 ) ) ( not ( = ?auto_168000 ?auto_168003 ) ) ( not ( = ?auto_168000 ?auto_168004 ) ) ( not ( = ?auto_168000 ?auto_168005 ) ) ( not ( = ?auto_168000 ?auto_168006 ) ) ( not ( = ?auto_168001 ?auto_168002 ) ) ( not ( = ?auto_168001 ?auto_168003 ) ) ( not ( = ?auto_168001 ?auto_168004 ) ) ( not ( = ?auto_168001 ?auto_168005 ) ) ( not ( = ?auto_168001 ?auto_168006 ) ) ( not ( = ?auto_168002 ?auto_168003 ) ) ( not ( = ?auto_168002 ?auto_168004 ) ) ( not ( = ?auto_168002 ?auto_168005 ) ) ( not ( = ?auto_168002 ?auto_168006 ) ) ( not ( = ?auto_168003 ?auto_168004 ) ) ( not ( = ?auto_168003 ?auto_168005 ) ) ( not ( = ?auto_168003 ?auto_168006 ) ) ( not ( = ?auto_168004 ?auto_168005 ) ) ( not ( = ?auto_168004 ?auto_168006 ) ) ( not ( = ?auto_168005 ?auto_168006 ) ) ( CLEAR ?auto_168003 ) ( ON ?auto_168004 ?auto_168005 ) ( CLEAR ?auto_168004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_167996 ?auto_167997 ?auto_167998 ?auto_167999 ?auto_168000 ?auto_168001 ?auto_168002 ?auto_168003 ?auto_168004 )
      ( MAKE-10PILE ?auto_167996 ?auto_167997 ?auto_167998 ?auto_167999 ?auto_168000 ?auto_168001 ?auto_168002 ?auto_168003 ?auto_168004 ?auto_168005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168038 - BLOCK
      ?auto_168039 - BLOCK
      ?auto_168040 - BLOCK
      ?auto_168041 - BLOCK
      ?auto_168042 - BLOCK
      ?auto_168043 - BLOCK
      ?auto_168044 - BLOCK
      ?auto_168045 - BLOCK
      ?auto_168046 - BLOCK
      ?auto_168047 - BLOCK
    )
    :vars
    (
      ?auto_168048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168047 ?auto_168048 ) ( ON-TABLE ?auto_168038 ) ( ON ?auto_168039 ?auto_168038 ) ( ON ?auto_168040 ?auto_168039 ) ( ON ?auto_168041 ?auto_168040 ) ( ON ?auto_168042 ?auto_168041 ) ( ON ?auto_168043 ?auto_168042 ) ( ON ?auto_168044 ?auto_168043 ) ( not ( = ?auto_168038 ?auto_168039 ) ) ( not ( = ?auto_168038 ?auto_168040 ) ) ( not ( = ?auto_168038 ?auto_168041 ) ) ( not ( = ?auto_168038 ?auto_168042 ) ) ( not ( = ?auto_168038 ?auto_168043 ) ) ( not ( = ?auto_168038 ?auto_168044 ) ) ( not ( = ?auto_168038 ?auto_168045 ) ) ( not ( = ?auto_168038 ?auto_168046 ) ) ( not ( = ?auto_168038 ?auto_168047 ) ) ( not ( = ?auto_168038 ?auto_168048 ) ) ( not ( = ?auto_168039 ?auto_168040 ) ) ( not ( = ?auto_168039 ?auto_168041 ) ) ( not ( = ?auto_168039 ?auto_168042 ) ) ( not ( = ?auto_168039 ?auto_168043 ) ) ( not ( = ?auto_168039 ?auto_168044 ) ) ( not ( = ?auto_168039 ?auto_168045 ) ) ( not ( = ?auto_168039 ?auto_168046 ) ) ( not ( = ?auto_168039 ?auto_168047 ) ) ( not ( = ?auto_168039 ?auto_168048 ) ) ( not ( = ?auto_168040 ?auto_168041 ) ) ( not ( = ?auto_168040 ?auto_168042 ) ) ( not ( = ?auto_168040 ?auto_168043 ) ) ( not ( = ?auto_168040 ?auto_168044 ) ) ( not ( = ?auto_168040 ?auto_168045 ) ) ( not ( = ?auto_168040 ?auto_168046 ) ) ( not ( = ?auto_168040 ?auto_168047 ) ) ( not ( = ?auto_168040 ?auto_168048 ) ) ( not ( = ?auto_168041 ?auto_168042 ) ) ( not ( = ?auto_168041 ?auto_168043 ) ) ( not ( = ?auto_168041 ?auto_168044 ) ) ( not ( = ?auto_168041 ?auto_168045 ) ) ( not ( = ?auto_168041 ?auto_168046 ) ) ( not ( = ?auto_168041 ?auto_168047 ) ) ( not ( = ?auto_168041 ?auto_168048 ) ) ( not ( = ?auto_168042 ?auto_168043 ) ) ( not ( = ?auto_168042 ?auto_168044 ) ) ( not ( = ?auto_168042 ?auto_168045 ) ) ( not ( = ?auto_168042 ?auto_168046 ) ) ( not ( = ?auto_168042 ?auto_168047 ) ) ( not ( = ?auto_168042 ?auto_168048 ) ) ( not ( = ?auto_168043 ?auto_168044 ) ) ( not ( = ?auto_168043 ?auto_168045 ) ) ( not ( = ?auto_168043 ?auto_168046 ) ) ( not ( = ?auto_168043 ?auto_168047 ) ) ( not ( = ?auto_168043 ?auto_168048 ) ) ( not ( = ?auto_168044 ?auto_168045 ) ) ( not ( = ?auto_168044 ?auto_168046 ) ) ( not ( = ?auto_168044 ?auto_168047 ) ) ( not ( = ?auto_168044 ?auto_168048 ) ) ( not ( = ?auto_168045 ?auto_168046 ) ) ( not ( = ?auto_168045 ?auto_168047 ) ) ( not ( = ?auto_168045 ?auto_168048 ) ) ( not ( = ?auto_168046 ?auto_168047 ) ) ( not ( = ?auto_168046 ?auto_168048 ) ) ( not ( = ?auto_168047 ?auto_168048 ) ) ( ON ?auto_168046 ?auto_168047 ) ( CLEAR ?auto_168044 ) ( ON ?auto_168045 ?auto_168046 ) ( CLEAR ?auto_168045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168038 ?auto_168039 ?auto_168040 ?auto_168041 ?auto_168042 ?auto_168043 ?auto_168044 ?auto_168045 )
      ( MAKE-10PILE ?auto_168038 ?auto_168039 ?auto_168040 ?auto_168041 ?auto_168042 ?auto_168043 ?auto_168044 ?auto_168045 ?auto_168046 ?auto_168047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168080 - BLOCK
      ?auto_168081 - BLOCK
      ?auto_168082 - BLOCK
      ?auto_168083 - BLOCK
      ?auto_168084 - BLOCK
      ?auto_168085 - BLOCK
      ?auto_168086 - BLOCK
      ?auto_168087 - BLOCK
      ?auto_168088 - BLOCK
      ?auto_168089 - BLOCK
    )
    :vars
    (
      ?auto_168090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168089 ?auto_168090 ) ( ON-TABLE ?auto_168080 ) ( ON ?auto_168081 ?auto_168080 ) ( ON ?auto_168082 ?auto_168081 ) ( ON ?auto_168083 ?auto_168082 ) ( ON ?auto_168084 ?auto_168083 ) ( ON ?auto_168085 ?auto_168084 ) ( not ( = ?auto_168080 ?auto_168081 ) ) ( not ( = ?auto_168080 ?auto_168082 ) ) ( not ( = ?auto_168080 ?auto_168083 ) ) ( not ( = ?auto_168080 ?auto_168084 ) ) ( not ( = ?auto_168080 ?auto_168085 ) ) ( not ( = ?auto_168080 ?auto_168086 ) ) ( not ( = ?auto_168080 ?auto_168087 ) ) ( not ( = ?auto_168080 ?auto_168088 ) ) ( not ( = ?auto_168080 ?auto_168089 ) ) ( not ( = ?auto_168080 ?auto_168090 ) ) ( not ( = ?auto_168081 ?auto_168082 ) ) ( not ( = ?auto_168081 ?auto_168083 ) ) ( not ( = ?auto_168081 ?auto_168084 ) ) ( not ( = ?auto_168081 ?auto_168085 ) ) ( not ( = ?auto_168081 ?auto_168086 ) ) ( not ( = ?auto_168081 ?auto_168087 ) ) ( not ( = ?auto_168081 ?auto_168088 ) ) ( not ( = ?auto_168081 ?auto_168089 ) ) ( not ( = ?auto_168081 ?auto_168090 ) ) ( not ( = ?auto_168082 ?auto_168083 ) ) ( not ( = ?auto_168082 ?auto_168084 ) ) ( not ( = ?auto_168082 ?auto_168085 ) ) ( not ( = ?auto_168082 ?auto_168086 ) ) ( not ( = ?auto_168082 ?auto_168087 ) ) ( not ( = ?auto_168082 ?auto_168088 ) ) ( not ( = ?auto_168082 ?auto_168089 ) ) ( not ( = ?auto_168082 ?auto_168090 ) ) ( not ( = ?auto_168083 ?auto_168084 ) ) ( not ( = ?auto_168083 ?auto_168085 ) ) ( not ( = ?auto_168083 ?auto_168086 ) ) ( not ( = ?auto_168083 ?auto_168087 ) ) ( not ( = ?auto_168083 ?auto_168088 ) ) ( not ( = ?auto_168083 ?auto_168089 ) ) ( not ( = ?auto_168083 ?auto_168090 ) ) ( not ( = ?auto_168084 ?auto_168085 ) ) ( not ( = ?auto_168084 ?auto_168086 ) ) ( not ( = ?auto_168084 ?auto_168087 ) ) ( not ( = ?auto_168084 ?auto_168088 ) ) ( not ( = ?auto_168084 ?auto_168089 ) ) ( not ( = ?auto_168084 ?auto_168090 ) ) ( not ( = ?auto_168085 ?auto_168086 ) ) ( not ( = ?auto_168085 ?auto_168087 ) ) ( not ( = ?auto_168085 ?auto_168088 ) ) ( not ( = ?auto_168085 ?auto_168089 ) ) ( not ( = ?auto_168085 ?auto_168090 ) ) ( not ( = ?auto_168086 ?auto_168087 ) ) ( not ( = ?auto_168086 ?auto_168088 ) ) ( not ( = ?auto_168086 ?auto_168089 ) ) ( not ( = ?auto_168086 ?auto_168090 ) ) ( not ( = ?auto_168087 ?auto_168088 ) ) ( not ( = ?auto_168087 ?auto_168089 ) ) ( not ( = ?auto_168087 ?auto_168090 ) ) ( not ( = ?auto_168088 ?auto_168089 ) ) ( not ( = ?auto_168088 ?auto_168090 ) ) ( not ( = ?auto_168089 ?auto_168090 ) ) ( ON ?auto_168088 ?auto_168089 ) ( ON ?auto_168087 ?auto_168088 ) ( CLEAR ?auto_168085 ) ( ON ?auto_168086 ?auto_168087 ) ( CLEAR ?auto_168086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168080 ?auto_168081 ?auto_168082 ?auto_168083 ?auto_168084 ?auto_168085 ?auto_168086 )
      ( MAKE-10PILE ?auto_168080 ?auto_168081 ?auto_168082 ?auto_168083 ?auto_168084 ?auto_168085 ?auto_168086 ?auto_168087 ?auto_168088 ?auto_168089 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168122 - BLOCK
      ?auto_168123 - BLOCK
      ?auto_168124 - BLOCK
      ?auto_168125 - BLOCK
      ?auto_168126 - BLOCK
      ?auto_168127 - BLOCK
      ?auto_168128 - BLOCK
      ?auto_168129 - BLOCK
      ?auto_168130 - BLOCK
      ?auto_168131 - BLOCK
    )
    :vars
    (
      ?auto_168132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168131 ?auto_168132 ) ( ON-TABLE ?auto_168122 ) ( ON ?auto_168123 ?auto_168122 ) ( ON ?auto_168124 ?auto_168123 ) ( ON ?auto_168125 ?auto_168124 ) ( ON ?auto_168126 ?auto_168125 ) ( not ( = ?auto_168122 ?auto_168123 ) ) ( not ( = ?auto_168122 ?auto_168124 ) ) ( not ( = ?auto_168122 ?auto_168125 ) ) ( not ( = ?auto_168122 ?auto_168126 ) ) ( not ( = ?auto_168122 ?auto_168127 ) ) ( not ( = ?auto_168122 ?auto_168128 ) ) ( not ( = ?auto_168122 ?auto_168129 ) ) ( not ( = ?auto_168122 ?auto_168130 ) ) ( not ( = ?auto_168122 ?auto_168131 ) ) ( not ( = ?auto_168122 ?auto_168132 ) ) ( not ( = ?auto_168123 ?auto_168124 ) ) ( not ( = ?auto_168123 ?auto_168125 ) ) ( not ( = ?auto_168123 ?auto_168126 ) ) ( not ( = ?auto_168123 ?auto_168127 ) ) ( not ( = ?auto_168123 ?auto_168128 ) ) ( not ( = ?auto_168123 ?auto_168129 ) ) ( not ( = ?auto_168123 ?auto_168130 ) ) ( not ( = ?auto_168123 ?auto_168131 ) ) ( not ( = ?auto_168123 ?auto_168132 ) ) ( not ( = ?auto_168124 ?auto_168125 ) ) ( not ( = ?auto_168124 ?auto_168126 ) ) ( not ( = ?auto_168124 ?auto_168127 ) ) ( not ( = ?auto_168124 ?auto_168128 ) ) ( not ( = ?auto_168124 ?auto_168129 ) ) ( not ( = ?auto_168124 ?auto_168130 ) ) ( not ( = ?auto_168124 ?auto_168131 ) ) ( not ( = ?auto_168124 ?auto_168132 ) ) ( not ( = ?auto_168125 ?auto_168126 ) ) ( not ( = ?auto_168125 ?auto_168127 ) ) ( not ( = ?auto_168125 ?auto_168128 ) ) ( not ( = ?auto_168125 ?auto_168129 ) ) ( not ( = ?auto_168125 ?auto_168130 ) ) ( not ( = ?auto_168125 ?auto_168131 ) ) ( not ( = ?auto_168125 ?auto_168132 ) ) ( not ( = ?auto_168126 ?auto_168127 ) ) ( not ( = ?auto_168126 ?auto_168128 ) ) ( not ( = ?auto_168126 ?auto_168129 ) ) ( not ( = ?auto_168126 ?auto_168130 ) ) ( not ( = ?auto_168126 ?auto_168131 ) ) ( not ( = ?auto_168126 ?auto_168132 ) ) ( not ( = ?auto_168127 ?auto_168128 ) ) ( not ( = ?auto_168127 ?auto_168129 ) ) ( not ( = ?auto_168127 ?auto_168130 ) ) ( not ( = ?auto_168127 ?auto_168131 ) ) ( not ( = ?auto_168127 ?auto_168132 ) ) ( not ( = ?auto_168128 ?auto_168129 ) ) ( not ( = ?auto_168128 ?auto_168130 ) ) ( not ( = ?auto_168128 ?auto_168131 ) ) ( not ( = ?auto_168128 ?auto_168132 ) ) ( not ( = ?auto_168129 ?auto_168130 ) ) ( not ( = ?auto_168129 ?auto_168131 ) ) ( not ( = ?auto_168129 ?auto_168132 ) ) ( not ( = ?auto_168130 ?auto_168131 ) ) ( not ( = ?auto_168130 ?auto_168132 ) ) ( not ( = ?auto_168131 ?auto_168132 ) ) ( ON ?auto_168130 ?auto_168131 ) ( ON ?auto_168129 ?auto_168130 ) ( ON ?auto_168128 ?auto_168129 ) ( CLEAR ?auto_168126 ) ( ON ?auto_168127 ?auto_168128 ) ( CLEAR ?auto_168127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168122 ?auto_168123 ?auto_168124 ?auto_168125 ?auto_168126 ?auto_168127 )
      ( MAKE-10PILE ?auto_168122 ?auto_168123 ?auto_168124 ?auto_168125 ?auto_168126 ?auto_168127 ?auto_168128 ?auto_168129 ?auto_168130 ?auto_168131 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168164 - BLOCK
      ?auto_168165 - BLOCK
      ?auto_168166 - BLOCK
      ?auto_168167 - BLOCK
      ?auto_168168 - BLOCK
      ?auto_168169 - BLOCK
      ?auto_168170 - BLOCK
      ?auto_168171 - BLOCK
      ?auto_168172 - BLOCK
      ?auto_168173 - BLOCK
    )
    :vars
    (
      ?auto_168174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168173 ?auto_168174 ) ( ON-TABLE ?auto_168164 ) ( ON ?auto_168165 ?auto_168164 ) ( ON ?auto_168166 ?auto_168165 ) ( ON ?auto_168167 ?auto_168166 ) ( not ( = ?auto_168164 ?auto_168165 ) ) ( not ( = ?auto_168164 ?auto_168166 ) ) ( not ( = ?auto_168164 ?auto_168167 ) ) ( not ( = ?auto_168164 ?auto_168168 ) ) ( not ( = ?auto_168164 ?auto_168169 ) ) ( not ( = ?auto_168164 ?auto_168170 ) ) ( not ( = ?auto_168164 ?auto_168171 ) ) ( not ( = ?auto_168164 ?auto_168172 ) ) ( not ( = ?auto_168164 ?auto_168173 ) ) ( not ( = ?auto_168164 ?auto_168174 ) ) ( not ( = ?auto_168165 ?auto_168166 ) ) ( not ( = ?auto_168165 ?auto_168167 ) ) ( not ( = ?auto_168165 ?auto_168168 ) ) ( not ( = ?auto_168165 ?auto_168169 ) ) ( not ( = ?auto_168165 ?auto_168170 ) ) ( not ( = ?auto_168165 ?auto_168171 ) ) ( not ( = ?auto_168165 ?auto_168172 ) ) ( not ( = ?auto_168165 ?auto_168173 ) ) ( not ( = ?auto_168165 ?auto_168174 ) ) ( not ( = ?auto_168166 ?auto_168167 ) ) ( not ( = ?auto_168166 ?auto_168168 ) ) ( not ( = ?auto_168166 ?auto_168169 ) ) ( not ( = ?auto_168166 ?auto_168170 ) ) ( not ( = ?auto_168166 ?auto_168171 ) ) ( not ( = ?auto_168166 ?auto_168172 ) ) ( not ( = ?auto_168166 ?auto_168173 ) ) ( not ( = ?auto_168166 ?auto_168174 ) ) ( not ( = ?auto_168167 ?auto_168168 ) ) ( not ( = ?auto_168167 ?auto_168169 ) ) ( not ( = ?auto_168167 ?auto_168170 ) ) ( not ( = ?auto_168167 ?auto_168171 ) ) ( not ( = ?auto_168167 ?auto_168172 ) ) ( not ( = ?auto_168167 ?auto_168173 ) ) ( not ( = ?auto_168167 ?auto_168174 ) ) ( not ( = ?auto_168168 ?auto_168169 ) ) ( not ( = ?auto_168168 ?auto_168170 ) ) ( not ( = ?auto_168168 ?auto_168171 ) ) ( not ( = ?auto_168168 ?auto_168172 ) ) ( not ( = ?auto_168168 ?auto_168173 ) ) ( not ( = ?auto_168168 ?auto_168174 ) ) ( not ( = ?auto_168169 ?auto_168170 ) ) ( not ( = ?auto_168169 ?auto_168171 ) ) ( not ( = ?auto_168169 ?auto_168172 ) ) ( not ( = ?auto_168169 ?auto_168173 ) ) ( not ( = ?auto_168169 ?auto_168174 ) ) ( not ( = ?auto_168170 ?auto_168171 ) ) ( not ( = ?auto_168170 ?auto_168172 ) ) ( not ( = ?auto_168170 ?auto_168173 ) ) ( not ( = ?auto_168170 ?auto_168174 ) ) ( not ( = ?auto_168171 ?auto_168172 ) ) ( not ( = ?auto_168171 ?auto_168173 ) ) ( not ( = ?auto_168171 ?auto_168174 ) ) ( not ( = ?auto_168172 ?auto_168173 ) ) ( not ( = ?auto_168172 ?auto_168174 ) ) ( not ( = ?auto_168173 ?auto_168174 ) ) ( ON ?auto_168172 ?auto_168173 ) ( ON ?auto_168171 ?auto_168172 ) ( ON ?auto_168170 ?auto_168171 ) ( ON ?auto_168169 ?auto_168170 ) ( CLEAR ?auto_168167 ) ( ON ?auto_168168 ?auto_168169 ) ( CLEAR ?auto_168168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168164 ?auto_168165 ?auto_168166 ?auto_168167 ?auto_168168 )
      ( MAKE-10PILE ?auto_168164 ?auto_168165 ?auto_168166 ?auto_168167 ?auto_168168 ?auto_168169 ?auto_168170 ?auto_168171 ?auto_168172 ?auto_168173 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168206 - BLOCK
      ?auto_168207 - BLOCK
      ?auto_168208 - BLOCK
      ?auto_168209 - BLOCK
      ?auto_168210 - BLOCK
      ?auto_168211 - BLOCK
      ?auto_168212 - BLOCK
      ?auto_168213 - BLOCK
      ?auto_168214 - BLOCK
      ?auto_168215 - BLOCK
    )
    :vars
    (
      ?auto_168216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168215 ?auto_168216 ) ( ON-TABLE ?auto_168206 ) ( ON ?auto_168207 ?auto_168206 ) ( ON ?auto_168208 ?auto_168207 ) ( not ( = ?auto_168206 ?auto_168207 ) ) ( not ( = ?auto_168206 ?auto_168208 ) ) ( not ( = ?auto_168206 ?auto_168209 ) ) ( not ( = ?auto_168206 ?auto_168210 ) ) ( not ( = ?auto_168206 ?auto_168211 ) ) ( not ( = ?auto_168206 ?auto_168212 ) ) ( not ( = ?auto_168206 ?auto_168213 ) ) ( not ( = ?auto_168206 ?auto_168214 ) ) ( not ( = ?auto_168206 ?auto_168215 ) ) ( not ( = ?auto_168206 ?auto_168216 ) ) ( not ( = ?auto_168207 ?auto_168208 ) ) ( not ( = ?auto_168207 ?auto_168209 ) ) ( not ( = ?auto_168207 ?auto_168210 ) ) ( not ( = ?auto_168207 ?auto_168211 ) ) ( not ( = ?auto_168207 ?auto_168212 ) ) ( not ( = ?auto_168207 ?auto_168213 ) ) ( not ( = ?auto_168207 ?auto_168214 ) ) ( not ( = ?auto_168207 ?auto_168215 ) ) ( not ( = ?auto_168207 ?auto_168216 ) ) ( not ( = ?auto_168208 ?auto_168209 ) ) ( not ( = ?auto_168208 ?auto_168210 ) ) ( not ( = ?auto_168208 ?auto_168211 ) ) ( not ( = ?auto_168208 ?auto_168212 ) ) ( not ( = ?auto_168208 ?auto_168213 ) ) ( not ( = ?auto_168208 ?auto_168214 ) ) ( not ( = ?auto_168208 ?auto_168215 ) ) ( not ( = ?auto_168208 ?auto_168216 ) ) ( not ( = ?auto_168209 ?auto_168210 ) ) ( not ( = ?auto_168209 ?auto_168211 ) ) ( not ( = ?auto_168209 ?auto_168212 ) ) ( not ( = ?auto_168209 ?auto_168213 ) ) ( not ( = ?auto_168209 ?auto_168214 ) ) ( not ( = ?auto_168209 ?auto_168215 ) ) ( not ( = ?auto_168209 ?auto_168216 ) ) ( not ( = ?auto_168210 ?auto_168211 ) ) ( not ( = ?auto_168210 ?auto_168212 ) ) ( not ( = ?auto_168210 ?auto_168213 ) ) ( not ( = ?auto_168210 ?auto_168214 ) ) ( not ( = ?auto_168210 ?auto_168215 ) ) ( not ( = ?auto_168210 ?auto_168216 ) ) ( not ( = ?auto_168211 ?auto_168212 ) ) ( not ( = ?auto_168211 ?auto_168213 ) ) ( not ( = ?auto_168211 ?auto_168214 ) ) ( not ( = ?auto_168211 ?auto_168215 ) ) ( not ( = ?auto_168211 ?auto_168216 ) ) ( not ( = ?auto_168212 ?auto_168213 ) ) ( not ( = ?auto_168212 ?auto_168214 ) ) ( not ( = ?auto_168212 ?auto_168215 ) ) ( not ( = ?auto_168212 ?auto_168216 ) ) ( not ( = ?auto_168213 ?auto_168214 ) ) ( not ( = ?auto_168213 ?auto_168215 ) ) ( not ( = ?auto_168213 ?auto_168216 ) ) ( not ( = ?auto_168214 ?auto_168215 ) ) ( not ( = ?auto_168214 ?auto_168216 ) ) ( not ( = ?auto_168215 ?auto_168216 ) ) ( ON ?auto_168214 ?auto_168215 ) ( ON ?auto_168213 ?auto_168214 ) ( ON ?auto_168212 ?auto_168213 ) ( ON ?auto_168211 ?auto_168212 ) ( ON ?auto_168210 ?auto_168211 ) ( CLEAR ?auto_168208 ) ( ON ?auto_168209 ?auto_168210 ) ( CLEAR ?auto_168209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168206 ?auto_168207 ?auto_168208 ?auto_168209 )
      ( MAKE-10PILE ?auto_168206 ?auto_168207 ?auto_168208 ?auto_168209 ?auto_168210 ?auto_168211 ?auto_168212 ?auto_168213 ?auto_168214 ?auto_168215 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168248 - BLOCK
      ?auto_168249 - BLOCK
      ?auto_168250 - BLOCK
      ?auto_168251 - BLOCK
      ?auto_168252 - BLOCK
      ?auto_168253 - BLOCK
      ?auto_168254 - BLOCK
      ?auto_168255 - BLOCK
      ?auto_168256 - BLOCK
      ?auto_168257 - BLOCK
    )
    :vars
    (
      ?auto_168258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168257 ?auto_168258 ) ( ON-TABLE ?auto_168248 ) ( ON ?auto_168249 ?auto_168248 ) ( not ( = ?auto_168248 ?auto_168249 ) ) ( not ( = ?auto_168248 ?auto_168250 ) ) ( not ( = ?auto_168248 ?auto_168251 ) ) ( not ( = ?auto_168248 ?auto_168252 ) ) ( not ( = ?auto_168248 ?auto_168253 ) ) ( not ( = ?auto_168248 ?auto_168254 ) ) ( not ( = ?auto_168248 ?auto_168255 ) ) ( not ( = ?auto_168248 ?auto_168256 ) ) ( not ( = ?auto_168248 ?auto_168257 ) ) ( not ( = ?auto_168248 ?auto_168258 ) ) ( not ( = ?auto_168249 ?auto_168250 ) ) ( not ( = ?auto_168249 ?auto_168251 ) ) ( not ( = ?auto_168249 ?auto_168252 ) ) ( not ( = ?auto_168249 ?auto_168253 ) ) ( not ( = ?auto_168249 ?auto_168254 ) ) ( not ( = ?auto_168249 ?auto_168255 ) ) ( not ( = ?auto_168249 ?auto_168256 ) ) ( not ( = ?auto_168249 ?auto_168257 ) ) ( not ( = ?auto_168249 ?auto_168258 ) ) ( not ( = ?auto_168250 ?auto_168251 ) ) ( not ( = ?auto_168250 ?auto_168252 ) ) ( not ( = ?auto_168250 ?auto_168253 ) ) ( not ( = ?auto_168250 ?auto_168254 ) ) ( not ( = ?auto_168250 ?auto_168255 ) ) ( not ( = ?auto_168250 ?auto_168256 ) ) ( not ( = ?auto_168250 ?auto_168257 ) ) ( not ( = ?auto_168250 ?auto_168258 ) ) ( not ( = ?auto_168251 ?auto_168252 ) ) ( not ( = ?auto_168251 ?auto_168253 ) ) ( not ( = ?auto_168251 ?auto_168254 ) ) ( not ( = ?auto_168251 ?auto_168255 ) ) ( not ( = ?auto_168251 ?auto_168256 ) ) ( not ( = ?auto_168251 ?auto_168257 ) ) ( not ( = ?auto_168251 ?auto_168258 ) ) ( not ( = ?auto_168252 ?auto_168253 ) ) ( not ( = ?auto_168252 ?auto_168254 ) ) ( not ( = ?auto_168252 ?auto_168255 ) ) ( not ( = ?auto_168252 ?auto_168256 ) ) ( not ( = ?auto_168252 ?auto_168257 ) ) ( not ( = ?auto_168252 ?auto_168258 ) ) ( not ( = ?auto_168253 ?auto_168254 ) ) ( not ( = ?auto_168253 ?auto_168255 ) ) ( not ( = ?auto_168253 ?auto_168256 ) ) ( not ( = ?auto_168253 ?auto_168257 ) ) ( not ( = ?auto_168253 ?auto_168258 ) ) ( not ( = ?auto_168254 ?auto_168255 ) ) ( not ( = ?auto_168254 ?auto_168256 ) ) ( not ( = ?auto_168254 ?auto_168257 ) ) ( not ( = ?auto_168254 ?auto_168258 ) ) ( not ( = ?auto_168255 ?auto_168256 ) ) ( not ( = ?auto_168255 ?auto_168257 ) ) ( not ( = ?auto_168255 ?auto_168258 ) ) ( not ( = ?auto_168256 ?auto_168257 ) ) ( not ( = ?auto_168256 ?auto_168258 ) ) ( not ( = ?auto_168257 ?auto_168258 ) ) ( ON ?auto_168256 ?auto_168257 ) ( ON ?auto_168255 ?auto_168256 ) ( ON ?auto_168254 ?auto_168255 ) ( ON ?auto_168253 ?auto_168254 ) ( ON ?auto_168252 ?auto_168253 ) ( ON ?auto_168251 ?auto_168252 ) ( CLEAR ?auto_168249 ) ( ON ?auto_168250 ?auto_168251 ) ( CLEAR ?auto_168250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168248 ?auto_168249 ?auto_168250 )
      ( MAKE-10PILE ?auto_168248 ?auto_168249 ?auto_168250 ?auto_168251 ?auto_168252 ?auto_168253 ?auto_168254 ?auto_168255 ?auto_168256 ?auto_168257 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168290 - BLOCK
      ?auto_168291 - BLOCK
      ?auto_168292 - BLOCK
      ?auto_168293 - BLOCK
      ?auto_168294 - BLOCK
      ?auto_168295 - BLOCK
      ?auto_168296 - BLOCK
      ?auto_168297 - BLOCK
      ?auto_168298 - BLOCK
      ?auto_168299 - BLOCK
    )
    :vars
    (
      ?auto_168300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168299 ?auto_168300 ) ( ON-TABLE ?auto_168290 ) ( not ( = ?auto_168290 ?auto_168291 ) ) ( not ( = ?auto_168290 ?auto_168292 ) ) ( not ( = ?auto_168290 ?auto_168293 ) ) ( not ( = ?auto_168290 ?auto_168294 ) ) ( not ( = ?auto_168290 ?auto_168295 ) ) ( not ( = ?auto_168290 ?auto_168296 ) ) ( not ( = ?auto_168290 ?auto_168297 ) ) ( not ( = ?auto_168290 ?auto_168298 ) ) ( not ( = ?auto_168290 ?auto_168299 ) ) ( not ( = ?auto_168290 ?auto_168300 ) ) ( not ( = ?auto_168291 ?auto_168292 ) ) ( not ( = ?auto_168291 ?auto_168293 ) ) ( not ( = ?auto_168291 ?auto_168294 ) ) ( not ( = ?auto_168291 ?auto_168295 ) ) ( not ( = ?auto_168291 ?auto_168296 ) ) ( not ( = ?auto_168291 ?auto_168297 ) ) ( not ( = ?auto_168291 ?auto_168298 ) ) ( not ( = ?auto_168291 ?auto_168299 ) ) ( not ( = ?auto_168291 ?auto_168300 ) ) ( not ( = ?auto_168292 ?auto_168293 ) ) ( not ( = ?auto_168292 ?auto_168294 ) ) ( not ( = ?auto_168292 ?auto_168295 ) ) ( not ( = ?auto_168292 ?auto_168296 ) ) ( not ( = ?auto_168292 ?auto_168297 ) ) ( not ( = ?auto_168292 ?auto_168298 ) ) ( not ( = ?auto_168292 ?auto_168299 ) ) ( not ( = ?auto_168292 ?auto_168300 ) ) ( not ( = ?auto_168293 ?auto_168294 ) ) ( not ( = ?auto_168293 ?auto_168295 ) ) ( not ( = ?auto_168293 ?auto_168296 ) ) ( not ( = ?auto_168293 ?auto_168297 ) ) ( not ( = ?auto_168293 ?auto_168298 ) ) ( not ( = ?auto_168293 ?auto_168299 ) ) ( not ( = ?auto_168293 ?auto_168300 ) ) ( not ( = ?auto_168294 ?auto_168295 ) ) ( not ( = ?auto_168294 ?auto_168296 ) ) ( not ( = ?auto_168294 ?auto_168297 ) ) ( not ( = ?auto_168294 ?auto_168298 ) ) ( not ( = ?auto_168294 ?auto_168299 ) ) ( not ( = ?auto_168294 ?auto_168300 ) ) ( not ( = ?auto_168295 ?auto_168296 ) ) ( not ( = ?auto_168295 ?auto_168297 ) ) ( not ( = ?auto_168295 ?auto_168298 ) ) ( not ( = ?auto_168295 ?auto_168299 ) ) ( not ( = ?auto_168295 ?auto_168300 ) ) ( not ( = ?auto_168296 ?auto_168297 ) ) ( not ( = ?auto_168296 ?auto_168298 ) ) ( not ( = ?auto_168296 ?auto_168299 ) ) ( not ( = ?auto_168296 ?auto_168300 ) ) ( not ( = ?auto_168297 ?auto_168298 ) ) ( not ( = ?auto_168297 ?auto_168299 ) ) ( not ( = ?auto_168297 ?auto_168300 ) ) ( not ( = ?auto_168298 ?auto_168299 ) ) ( not ( = ?auto_168298 ?auto_168300 ) ) ( not ( = ?auto_168299 ?auto_168300 ) ) ( ON ?auto_168298 ?auto_168299 ) ( ON ?auto_168297 ?auto_168298 ) ( ON ?auto_168296 ?auto_168297 ) ( ON ?auto_168295 ?auto_168296 ) ( ON ?auto_168294 ?auto_168295 ) ( ON ?auto_168293 ?auto_168294 ) ( ON ?auto_168292 ?auto_168293 ) ( CLEAR ?auto_168290 ) ( ON ?auto_168291 ?auto_168292 ) ( CLEAR ?auto_168291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168290 ?auto_168291 )
      ( MAKE-10PILE ?auto_168290 ?auto_168291 ?auto_168292 ?auto_168293 ?auto_168294 ?auto_168295 ?auto_168296 ?auto_168297 ?auto_168298 ?auto_168299 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168332 - BLOCK
      ?auto_168333 - BLOCK
      ?auto_168334 - BLOCK
      ?auto_168335 - BLOCK
      ?auto_168336 - BLOCK
      ?auto_168337 - BLOCK
      ?auto_168338 - BLOCK
      ?auto_168339 - BLOCK
      ?auto_168340 - BLOCK
      ?auto_168341 - BLOCK
    )
    :vars
    (
      ?auto_168342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168341 ?auto_168342 ) ( not ( = ?auto_168332 ?auto_168333 ) ) ( not ( = ?auto_168332 ?auto_168334 ) ) ( not ( = ?auto_168332 ?auto_168335 ) ) ( not ( = ?auto_168332 ?auto_168336 ) ) ( not ( = ?auto_168332 ?auto_168337 ) ) ( not ( = ?auto_168332 ?auto_168338 ) ) ( not ( = ?auto_168332 ?auto_168339 ) ) ( not ( = ?auto_168332 ?auto_168340 ) ) ( not ( = ?auto_168332 ?auto_168341 ) ) ( not ( = ?auto_168332 ?auto_168342 ) ) ( not ( = ?auto_168333 ?auto_168334 ) ) ( not ( = ?auto_168333 ?auto_168335 ) ) ( not ( = ?auto_168333 ?auto_168336 ) ) ( not ( = ?auto_168333 ?auto_168337 ) ) ( not ( = ?auto_168333 ?auto_168338 ) ) ( not ( = ?auto_168333 ?auto_168339 ) ) ( not ( = ?auto_168333 ?auto_168340 ) ) ( not ( = ?auto_168333 ?auto_168341 ) ) ( not ( = ?auto_168333 ?auto_168342 ) ) ( not ( = ?auto_168334 ?auto_168335 ) ) ( not ( = ?auto_168334 ?auto_168336 ) ) ( not ( = ?auto_168334 ?auto_168337 ) ) ( not ( = ?auto_168334 ?auto_168338 ) ) ( not ( = ?auto_168334 ?auto_168339 ) ) ( not ( = ?auto_168334 ?auto_168340 ) ) ( not ( = ?auto_168334 ?auto_168341 ) ) ( not ( = ?auto_168334 ?auto_168342 ) ) ( not ( = ?auto_168335 ?auto_168336 ) ) ( not ( = ?auto_168335 ?auto_168337 ) ) ( not ( = ?auto_168335 ?auto_168338 ) ) ( not ( = ?auto_168335 ?auto_168339 ) ) ( not ( = ?auto_168335 ?auto_168340 ) ) ( not ( = ?auto_168335 ?auto_168341 ) ) ( not ( = ?auto_168335 ?auto_168342 ) ) ( not ( = ?auto_168336 ?auto_168337 ) ) ( not ( = ?auto_168336 ?auto_168338 ) ) ( not ( = ?auto_168336 ?auto_168339 ) ) ( not ( = ?auto_168336 ?auto_168340 ) ) ( not ( = ?auto_168336 ?auto_168341 ) ) ( not ( = ?auto_168336 ?auto_168342 ) ) ( not ( = ?auto_168337 ?auto_168338 ) ) ( not ( = ?auto_168337 ?auto_168339 ) ) ( not ( = ?auto_168337 ?auto_168340 ) ) ( not ( = ?auto_168337 ?auto_168341 ) ) ( not ( = ?auto_168337 ?auto_168342 ) ) ( not ( = ?auto_168338 ?auto_168339 ) ) ( not ( = ?auto_168338 ?auto_168340 ) ) ( not ( = ?auto_168338 ?auto_168341 ) ) ( not ( = ?auto_168338 ?auto_168342 ) ) ( not ( = ?auto_168339 ?auto_168340 ) ) ( not ( = ?auto_168339 ?auto_168341 ) ) ( not ( = ?auto_168339 ?auto_168342 ) ) ( not ( = ?auto_168340 ?auto_168341 ) ) ( not ( = ?auto_168340 ?auto_168342 ) ) ( not ( = ?auto_168341 ?auto_168342 ) ) ( ON ?auto_168340 ?auto_168341 ) ( ON ?auto_168339 ?auto_168340 ) ( ON ?auto_168338 ?auto_168339 ) ( ON ?auto_168337 ?auto_168338 ) ( ON ?auto_168336 ?auto_168337 ) ( ON ?auto_168335 ?auto_168336 ) ( ON ?auto_168334 ?auto_168335 ) ( ON ?auto_168333 ?auto_168334 ) ( ON ?auto_168332 ?auto_168333 ) ( CLEAR ?auto_168332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168332 )
      ( MAKE-10PILE ?auto_168332 ?auto_168333 ?auto_168334 ?auto_168335 ?auto_168336 ?auto_168337 ?auto_168338 ?auto_168339 ?auto_168340 ?auto_168341 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168375 - BLOCK
      ?auto_168376 - BLOCK
      ?auto_168377 - BLOCK
      ?auto_168378 - BLOCK
      ?auto_168379 - BLOCK
      ?auto_168380 - BLOCK
      ?auto_168381 - BLOCK
      ?auto_168382 - BLOCK
      ?auto_168383 - BLOCK
      ?auto_168384 - BLOCK
      ?auto_168385 - BLOCK
    )
    :vars
    (
      ?auto_168386 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_168384 ) ( ON ?auto_168385 ?auto_168386 ) ( CLEAR ?auto_168385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168375 ) ( ON ?auto_168376 ?auto_168375 ) ( ON ?auto_168377 ?auto_168376 ) ( ON ?auto_168378 ?auto_168377 ) ( ON ?auto_168379 ?auto_168378 ) ( ON ?auto_168380 ?auto_168379 ) ( ON ?auto_168381 ?auto_168380 ) ( ON ?auto_168382 ?auto_168381 ) ( ON ?auto_168383 ?auto_168382 ) ( ON ?auto_168384 ?auto_168383 ) ( not ( = ?auto_168375 ?auto_168376 ) ) ( not ( = ?auto_168375 ?auto_168377 ) ) ( not ( = ?auto_168375 ?auto_168378 ) ) ( not ( = ?auto_168375 ?auto_168379 ) ) ( not ( = ?auto_168375 ?auto_168380 ) ) ( not ( = ?auto_168375 ?auto_168381 ) ) ( not ( = ?auto_168375 ?auto_168382 ) ) ( not ( = ?auto_168375 ?auto_168383 ) ) ( not ( = ?auto_168375 ?auto_168384 ) ) ( not ( = ?auto_168375 ?auto_168385 ) ) ( not ( = ?auto_168375 ?auto_168386 ) ) ( not ( = ?auto_168376 ?auto_168377 ) ) ( not ( = ?auto_168376 ?auto_168378 ) ) ( not ( = ?auto_168376 ?auto_168379 ) ) ( not ( = ?auto_168376 ?auto_168380 ) ) ( not ( = ?auto_168376 ?auto_168381 ) ) ( not ( = ?auto_168376 ?auto_168382 ) ) ( not ( = ?auto_168376 ?auto_168383 ) ) ( not ( = ?auto_168376 ?auto_168384 ) ) ( not ( = ?auto_168376 ?auto_168385 ) ) ( not ( = ?auto_168376 ?auto_168386 ) ) ( not ( = ?auto_168377 ?auto_168378 ) ) ( not ( = ?auto_168377 ?auto_168379 ) ) ( not ( = ?auto_168377 ?auto_168380 ) ) ( not ( = ?auto_168377 ?auto_168381 ) ) ( not ( = ?auto_168377 ?auto_168382 ) ) ( not ( = ?auto_168377 ?auto_168383 ) ) ( not ( = ?auto_168377 ?auto_168384 ) ) ( not ( = ?auto_168377 ?auto_168385 ) ) ( not ( = ?auto_168377 ?auto_168386 ) ) ( not ( = ?auto_168378 ?auto_168379 ) ) ( not ( = ?auto_168378 ?auto_168380 ) ) ( not ( = ?auto_168378 ?auto_168381 ) ) ( not ( = ?auto_168378 ?auto_168382 ) ) ( not ( = ?auto_168378 ?auto_168383 ) ) ( not ( = ?auto_168378 ?auto_168384 ) ) ( not ( = ?auto_168378 ?auto_168385 ) ) ( not ( = ?auto_168378 ?auto_168386 ) ) ( not ( = ?auto_168379 ?auto_168380 ) ) ( not ( = ?auto_168379 ?auto_168381 ) ) ( not ( = ?auto_168379 ?auto_168382 ) ) ( not ( = ?auto_168379 ?auto_168383 ) ) ( not ( = ?auto_168379 ?auto_168384 ) ) ( not ( = ?auto_168379 ?auto_168385 ) ) ( not ( = ?auto_168379 ?auto_168386 ) ) ( not ( = ?auto_168380 ?auto_168381 ) ) ( not ( = ?auto_168380 ?auto_168382 ) ) ( not ( = ?auto_168380 ?auto_168383 ) ) ( not ( = ?auto_168380 ?auto_168384 ) ) ( not ( = ?auto_168380 ?auto_168385 ) ) ( not ( = ?auto_168380 ?auto_168386 ) ) ( not ( = ?auto_168381 ?auto_168382 ) ) ( not ( = ?auto_168381 ?auto_168383 ) ) ( not ( = ?auto_168381 ?auto_168384 ) ) ( not ( = ?auto_168381 ?auto_168385 ) ) ( not ( = ?auto_168381 ?auto_168386 ) ) ( not ( = ?auto_168382 ?auto_168383 ) ) ( not ( = ?auto_168382 ?auto_168384 ) ) ( not ( = ?auto_168382 ?auto_168385 ) ) ( not ( = ?auto_168382 ?auto_168386 ) ) ( not ( = ?auto_168383 ?auto_168384 ) ) ( not ( = ?auto_168383 ?auto_168385 ) ) ( not ( = ?auto_168383 ?auto_168386 ) ) ( not ( = ?auto_168384 ?auto_168385 ) ) ( not ( = ?auto_168384 ?auto_168386 ) ) ( not ( = ?auto_168385 ?auto_168386 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168385 ?auto_168386 )
      ( !STACK ?auto_168385 ?auto_168384 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168421 - BLOCK
      ?auto_168422 - BLOCK
      ?auto_168423 - BLOCK
      ?auto_168424 - BLOCK
      ?auto_168425 - BLOCK
      ?auto_168426 - BLOCK
      ?auto_168427 - BLOCK
      ?auto_168428 - BLOCK
      ?auto_168429 - BLOCK
      ?auto_168430 - BLOCK
      ?auto_168431 - BLOCK
    )
    :vars
    (
      ?auto_168432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168431 ?auto_168432 ) ( ON-TABLE ?auto_168421 ) ( ON ?auto_168422 ?auto_168421 ) ( ON ?auto_168423 ?auto_168422 ) ( ON ?auto_168424 ?auto_168423 ) ( ON ?auto_168425 ?auto_168424 ) ( ON ?auto_168426 ?auto_168425 ) ( ON ?auto_168427 ?auto_168426 ) ( ON ?auto_168428 ?auto_168427 ) ( ON ?auto_168429 ?auto_168428 ) ( not ( = ?auto_168421 ?auto_168422 ) ) ( not ( = ?auto_168421 ?auto_168423 ) ) ( not ( = ?auto_168421 ?auto_168424 ) ) ( not ( = ?auto_168421 ?auto_168425 ) ) ( not ( = ?auto_168421 ?auto_168426 ) ) ( not ( = ?auto_168421 ?auto_168427 ) ) ( not ( = ?auto_168421 ?auto_168428 ) ) ( not ( = ?auto_168421 ?auto_168429 ) ) ( not ( = ?auto_168421 ?auto_168430 ) ) ( not ( = ?auto_168421 ?auto_168431 ) ) ( not ( = ?auto_168421 ?auto_168432 ) ) ( not ( = ?auto_168422 ?auto_168423 ) ) ( not ( = ?auto_168422 ?auto_168424 ) ) ( not ( = ?auto_168422 ?auto_168425 ) ) ( not ( = ?auto_168422 ?auto_168426 ) ) ( not ( = ?auto_168422 ?auto_168427 ) ) ( not ( = ?auto_168422 ?auto_168428 ) ) ( not ( = ?auto_168422 ?auto_168429 ) ) ( not ( = ?auto_168422 ?auto_168430 ) ) ( not ( = ?auto_168422 ?auto_168431 ) ) ( not ( = ?auto_168422 ?auto_168432 ) ) ( not ( = ?auto_168423 ?auto_168424 ) ) ( not ( = ?auto_168423 ?auto_168425 ) ) ( not ( = ?auto_168423 ?auto_168426 ) ) ( not ( = ?auto_168423 ?auto_168427 ) ) ( not ( = ?auto_168423 ?auto_168428 ) ) ( not ( = ?auto_168423 ?auto_168429 ) ) ( not ( = ?auto_168423 ?auto_168430 ) ) ( not ( = ?auto_168423 ?auto_168431 ) ) ( not ( = ?auto_168423 ?auto_168432 ) ) ( not ( = ?auto_168424 ?auto_168425 ) ) ( not ( = ?auto_168424 ?auto_168426 ) ) ( not ( = ?auto_168424 ?auto_168427 ) ) ( not ( = ?auto_168424 ?auto_168428 ) ) ( not ( = ?auto_168424 ?auto_168429 ) ) ( not ( = ?auto_168424 ?auto_168430 ) ) ( not ( = ?auto_168424 ?auto_168431 ) ) ( not ( = ?auto_168424 ?auto_168432 ) ) ( not ( = ?auto_168425 ?auto_168426 ) ) ( not ( = ?auto_168425 ?auto_168427 ) ) ( not ( = ?auto_168425 ?auto_168428 ) ) ( not ( = ?auto_168425 ?auto_168429 ) ) ( not ( = ?auto_168425 ?auto_168430 ) ) ( not ( = ?auto_168425 ?auto_168431 ) ) ( not ( = ?auto_168425 ?auto_168432 ) ) ( not ( = ?auto_168426 ?auto_168427 ) ) ( not ( = ?auto_168426 ?auto_168428 ) ) ( not ( = ?auto_168426 ?auto_168429 ) ) ( not ( = ?auto_168426 ?auto_168430 ) ) ( not ( = ?auto_168426 ?auto_168431 ) ) ( not ( = ?auto_168426 ?auto_168432 ) ) ( not ( = ?auto_168427 ?auto_168428 ) ) ( not ( = ?auto_168427 ?auto_168429 ) ) ( not ( = ?auto_168427 ?auto_168430 ) ) ( not ( = ?auto_168427 ?auto_168431 ) ) ( not ( = ?auto_168427 ?auto_168432 ) ) ( not ( = ?auto_168428 ?auto_168429 ) ) ( not ( = ?auto_168428 ?auto_168430 ) ) ( not ( = ?auto_168428 ?auto_168431 ) ) ( not ( = ?auto_168428 ?auto_168432 ) ) ( not ( = ?auto_168429 ?auto_168430 ) ) ( not ( = ?auto_168429 ?auto_168431 ) ) ( not ( = ?auto_168429 ?auto_168432 ) ) ( not ( = ?auto_168430 ?auto_168431 ) ) ( not ( = ?auto_168430 ?auto_168432 ) ) ( not ( = ?auto_168431 ?auto_168432 ) ) ( CLEAR ?auto_168429 ) ( ON ?auto_168430 ?auto_168431 ) ( CLEAR ?auto_168430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_168421 ?auto_168422 ?auto_168423 ?auto_168424 ?auto_168425 ?auto_168426 ?auto_168427 ?auto_168428 ?auto_168429 ?auto_168430 )
      ( MAKE-11PILE ?auto_168421 ?auto_168422 ?auto_168423 ?auto_168424 ?auto_168425 ?auto_168426 ?auto_168427 ?auto_168428 ?auto_168429 ?auto_168430 ?auto_168431 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168467 - BLOCK
      ?auto_168468 - BLOCK
      ?auto_168469 - BLOCK
      ?auto_168470 - BLOCK
      ?auto_168471 - BLOCK
      ?auto_168472 - BLOCK
      ?auto_168473 - BLOCK
      ?auto_168474 - BLOCK
      ?auto_168475 - BLOCK
      ?auto_168476 - BLOCK
      ?auto_168477 - BLOCK
    )
    :vars
    (
      ?auto_168478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168477 ?auto_168478 ) ( ON-TABLE ?auto_168467 ) ( ON ?auto_168468 ?auto_168467 ) ( ON ?auto_168469 ?auto_168468 ) ( ON ?auto_168470 ?auto_168469 ) ( ON ?auto_168471 ?auto_168470 ) ( ON ?auto_168472 ?auto_168471 ) ( ON ?auto_168473 ?auto_168472 ) ( ON ?auto_168474 ?auto_168473 ) ( not ( = ?auto_168467 ?auto_168468 ) ) ( not ( = ?auto_168467 ?auto_168469 ) ) ( not ( = ?auto_168467 ?auto_168470 ) ) ( not ( = ?auto_168467 ?auto_168471 ) ) ( not ( = ?auto_168467 ?auto_168472 ) ) ( not ( = ?auto_168467 ?auto_168473 ) ) ( not ( = ?auto_168467 ?auto_168474 ) ) ( not ( = ?auto_168467 ?auto_168475 ) ) ( not ( = ?auto_168467 ?auto_168476 ) ) ( not ( = ?auto_168467 ?auto_168477 ) ) ( not ( = ?auto_168467 ?auto_168478 ) ) ( not ( = ?auto_168468 ?auto_168469 ) ) ( not ( = ?auto_168468 ?auto_168470 ) ) ( not ( = ?auto_168468 ?auto_168471 ) ) ( not ( = ?auto_168468 ?auto_168472 ) ) ( not ( = ?auto_168468 ?auto_168473 ) ) ( not ( = ?auto_168468 ?auto_168474 ) ) ( not ( = ?auto_168468 ?auto_168475 ) ) ( not ( = ?auto_168468 ?auto_168476 ) ) ( not ( = ?auto_168468 ?auto_168477 ) ) ( not ( = ?auto_168468 ?auto_168478 ) ) ( not ( = ?auto_168469 ?auto_168470 ) ) ( not ( = ?auto_168469 ?auto_168471 ) ) ( not ( = ?auto_168469 ?auto_168472 ) ) ( not ( = ?auto_168469 ?auto_168473 ) ) ( not ( = ?auto_168469 ?auto_168474 ) ) ( not ( = ?auto_168469 ?auto_168475 ) ) ( not ( = ?auto_168469 ?auto_168476 ) ) ( not ( = ?auto_168469 ?auto_168477 ) ) ( not ( = ?auto_168469 ?auto_168478 ) ) ( not ( = ?auto_168470 ?auto_168471 ) ) ( not ( = ?auto_168470 ?auto_168472 ) ) ( not ( = ?auto_168470 ?auto_168473 ) ) ( not ( = ?auto_168470 ?auto_168474 ) ) ( not ( = ?auto_168470 ?auto_168475 ) ) ( not ( = ?auto_168470 ?auto_168476 ) ) ( not ( = ?auto_168470 ?auto_168477 ) ) ( not ( = ?auto_168470 ?auto_168478 ) ) ( not ( = ?auto_168471 ?auto_168472 ) ) ( not ( = ?auto_168471 ?auto_168473 ) ) ( not ( = ?auto_168471 ?auto_168474 ) ) ( not ( = ?auto_168471 ?auto_168475 ) ) ( not ( = ?auto_168471 ?auto_168476 ) ) ( not ( = ?auto_168471 ?auto_168477 ) ) ( not ( = ?auto_168471 ?auto_168478 ) ) ( not ( = ?auto_168472 ?auto_168473 ) ) ( not ( = ?auto_168472 ?auto_168474 ) ) ( not ( = ?auto_168472 ?auto_168475 ) ) ( not ( = ?auto_168472 ?auto_168476 ) ) ( not ( = ?auto_168472 ?auto_168477 ) ) ( not ( = ?auto_168472 ?auto_168478 ) ) ( not ( = ?auto_168473 ?auto_168474 ) ) ( not ( = ?auto_168473 ?auto_168475 ) ) ( not ( = ?auto_168473 ?auto_168476 ) ) ( not ( = ?auto_168473 ?auto_168477 ) ) ( not ( = ?auto_168473 ?auto_168478 ) ) ( not ( = ?auto_168474 ?auto_168475 ) ) ( not ( = ?auto_168474 ?auto_168476 ) ) ( not ( = ?auto_168474 ?auto_168477 ) ) ( not ( = ?auto_168474 ?auto_168478 ) ) ( not ( = ?auto_168475 ?auto_168476 ) ) ( not ( = ?auto_168475 ?auto_168477 ) ) ( not ( = ?auto_168475 ?auto_168478 ) ) ( not ( = ?auto_168476 ?auto_168477 ) ) ( not ( = ?auto_168476 ?auto_168478 ) ) ( not ( = ?auto_168477 ?auto_168478 ) ) ( ON ?auto_168476 ?auto_168477 ) ( CLEAR ?auto_168474 ) ( ON ?auto_168475 ?auto_168476 ) ( CLEAR ?auto_168475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_168467 ?auto_168468 ?auto_168469 ?auto_168470 ?auto_168471 ?auto_168472 ?auto_168473 ?auto_168474 ?auto_168475 )
      ( MAKE-11PILE ?auto_168467 ?auto_168468 ?auto_168469 ?auto_168470 ?auto_168471 ?auto_168472 ?auto_168473 ?auto_168474 ?auto_168475 ?auto_168476 ?auto_168477 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168513 - BLOCK
      ?auto_168514 - BLOCK
      ?auto_168515 - BLOCK
      ?auto_168516 - BLOCK
      ?auto_168517 - BLOCK
      ?auto_168518 - BLOCK
      ?auto_168519 - BLOCK
      ?auto_168520 - BLOCK
      ?auto_168521 - BLOCK
      ?auto_168522 - BLOCK
      ?auto_168523 - BLOCK
    )
    :vars
    (
      ?auto_168524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168523 ?auto_168524 ) ( ON-TABLE ?auto_168513 ) ( ON ?auto_168514 ?auto_168513 ) ( ON ?auto_168515 ?auto_168514 ) ( ON ?auto_168516 ?auto_168515 ) ( ON ?auto_168517 ?auto_168516 ) ( ON ?auto_168518 ?auto_168517 ) ( ON ?auto_168519 ?auto_168518 ) ( not ( = ?auto_168513 ?auto_168514 ) ) ( not ( = ?auto_168513 ?auto_168515 ) ) ( not ( = ?auto_168513 ?auto_168516 ) ) ( not ( = ?auto_168513 ?auto_168517 ) ) ( not ( = ?auto_168513 ?auto_168518 ) ) ( not ( = ?auto_168513 ?auto_168519 ) ) ( not ( = ?auto_168513 ?auto_168520 ) ) ( not ( = ?auto_168513 ?auto_168521 ) ) ( not ( = ?auto_168513 ?auto_168522 ) ) ( not ( = ?auto_168513 ?auto_168523 ) ) ( not ( = ?auto_168513 ?auto_168524 ) ) ( not ( = ?auto_168514 ?auto_168515 ) ) ( not ( = ?auto_168514 ?auto_168516 ) ) ( not ( = ?auto_168514 ?auto_168517 ) ) ( not ( = ?auto_168514 ?auto_168518 ) ) ( not ( = ?auto_168514 ?auto_168519 ) ) ( not ( = ?auto_168514 ?auto_168520 ) ) ( not ( = ?auto_168514 ?auto_168521 ) ) ( not ( = ?auto_168514 ?auto_168522 ) ) ( not ( = ?auto_168514 ?auto_168523 ) ) ( not ( = ?auto_168514 ?auto_168524 ) ) ( not ( = ?auto_168515 ?auto_168516 ) ) ( not ( = ?auto_168515 ?auto_168517 ) ) ( not ( = ?auto_168515 ?auto_168518 ) ) ( not ( = ?auto_168515 ?auto_168519 ) ) ( not ( = ?auto_168515 ?auto_168520 ) ) ( not ( = ?auto_168515 ?auto_168521 ) ) ( not ( = ?auto_168515 ?auto_168522 ) ) ( not ( = ?auto_168515 ?auto_168523 ) ) ( not ( = ?auto_168515 ?auto_168524 ) ) ( not ( = ?auto_168516 ?auto_168517 ) ) ( not ( = ?auto_168516 ?auto_168518 ) ) ( not ( = ?auto_168516 ?auto_168519 ) ) ( not ( = ?auto_168516 ?auto_168520 ) ) ( not ( = ?auto_168516 ?auto_168521 ) ) ( not ( = ?auto_168516 ?auto_168522 ) ) ( not ( = ?auto_168516 ?auto_168523 ) ) ( not ( = ?auto_168516 ?auto_168524 ) ) ( not ( = ?auto_168517 ?auto_168518 ) ) ( not ( = ?auto_168517 ?auto_168519 ) ) ( not ( = ?auto_168517 ?auto_168520 ) ) ( not ( = ?auto_168517 ?auto_168521 ) ) ( not ( = ?auto_168517 ?auto_168522 ) ) ( not ( = ?auto_168517 ?auto_168523 ) ) ( not ( = ?auto_168517 ?auto_168524 ) ) ( not ( = ?auto_168518 ?auto_168519 ) ) ( not ( = ?auto_168518 ?auto_168520 ) ) ( not ( = ?auto_168518 ?auto_168521 ) ) ( not ( = ?auto_168518 ?auto_168522 ) ) ( not ( = ?auto_168518 ?auto_168523 ) ) ( not ( = ?auto_168518 ?auto_168524 ) ) ( not ( = ?auto_168519 ?auto_168520 ) ) ( not ( = ?auto_168519 ?auto_168521 ) ) ( not ( = ?auto_168519 ?auto_168522 ) ) ( not ( = ?auto_168519 ?auto_168523 ) ) ( not ( = ?auto_168519 ?auto_168524 ) ) ( not ( = ?auto_168520 ?auto_168521 ) ) ( not ( = ?auto_168520 ?auto_168522 ) ) ( not ( = ?auto_168520 ?auto_168523 ) ) ( not ( = ?auto_168520 ?auto_168524 ) ) ( not ( = ?auto_168521 ?auto_168522 ) ) ( not ( = ?auto_168521 ?auto_168523 ) ) ( not ( = ?auto_168521 ?auto_168524 ) ) ( not ( = ?auto_168522 ?auto_168523 ) ) ( not ( = ?auto_168522 ?auto_168524 ) ) ( not ( = ?auto_168523 ?auto_168524 ) ) ( ON ?auto_168522 ?auto_168523 ) ( ON ?auto_168521 ?auto_168522 ) ( CLEAR ?auto_168519 ) ( ON ?auto_168520 ?auto_168521 ) ( CLEAR ?auto_168520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168513 ?auto_168514 ?auto_168515 ?auto_168516 ?auto_168517 ?auto_168518 ?auto_168519 ?auto_168520 )
      ( MAKE-11PILE ?auto_168513 ?auto_168514 ?auto_168515 ?auto_168516 ?auto_168517 ?auto_168518 ?auto_168519 ?auto_168520 ?auto_168521 ?auto_168522 ?auto_168523 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168559 - BLOCK
      ?auto_168560 - BLOCK
      ?auto_168561 - BLOCK
      ?auto_168562 - BLOCK
      ?auto_168563 - BLOCK
      ?auto_168564 - BLOCK
      ?auto_168565 - BLOCK
      ?auto_168566 - BLOCK
      ?auto_168567 - BLOCK
      ?auto_168568 - BLOCK
      ?auto_168569 - BLOCK
    )
    :vars
    (
      ?auto_168570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168569 ?auto_168570 ) ( ON-TABLE ?auto_168559 ) ( ON ?auto_168560 ?auto_168559 ) ( ON ?auto_168561 ?auto_168560 ) ( ON ?auto_168562 ?auto_168561 ) ( ON ?auto_168563 ?auto_168562 ) ( ON ?auto_168564 ?auto_168563 ) ( not ( = ?auto_168559 ?auto_168560 ) ) ( not ( = ?auto_168559 ?auto_168561 ) ) ( not ( = ?auto_168559 ?auto_168562 ) ) ( not ( = ?auto_168559 ?auto_168563 ) ) ( not ( = ?auto_168559 ?auto_168564 ) ) ( not ( = ?auto_168559 ?auto_168565 ) ) ( not ( = ?auto_168559 ?auto_168566 ) ) ( not ( = ?auto_168559 ?auto_168567 ) ) ( not ( = ?auto_168559 ?auto_168568 ) ) ( not ( = ?auto_168559 ?auto_168569 ) ) ( not ( = ?auto_168559 ?auto_168570 ) ) ( not ( = ?auto_168560 ?auto_168561 ) ) ( not ( = ?auto_168560 ?auto_168562 ) ) ( not ( = ?auto_168560 ?auto_168563 ) ) ( not ( = ?auto_168560 ?auto_168564 ) ) ( not ( = ?auto_168560 ?auto_168565 ) ) ( not ( = ?auto_168560 ?auto_168566 ) ) ( not ( = ?auto_168560 ?auto_168567 ) ) ( not ( = ?auto_168560 ?auto_168568 ) ) ( not ( = ?auto_168560 ?auto_168569 ) ) ( not ( = ?auto_168560 ?auto_168570 ) ) ( not ( = ?auto_168561 ?auto_168562 ) ) ( not ( = ?auto_168561 ?auto_168563 ) ) ( not ( = ?auto_168561 ?auto_168564 ) ) ( not ( = ?auto_168561 ?auto_168565 ) ) ( not ( = ?auto_168561 ?auto_168566 ) ) ( not ( = ?auto_168561 ?auto_168567 ) ) ( not ( = ?auto_168561 ?auto_168568 ) ) ( not ( = ?auto_168561 ?auto_168569 ) ) ( not ( = ?auto_168561 ?auto_168570 ) ) ( not ( = ?auto_168562 ?auto_168563 ) ) ( not ( = ?auto_168562 ?auto_168564 ) ) ( not ( = ?auto_168562 ?auto_168565 ) ) ( not ( = ?auto_168562 ?auto_168566 ) ) ( not ( = ?auto_168562 ?auto_168567 ) ) ( not ( = ?auto_168562 ?auto_168568 ) ) ( not ( = ?auto_168562 ?auto_168569 ) ) ( not ( = ?auto_168562 ?auto_168570 ) ) ( not ( = ?auto_168563 ?auto_168564 ) ) ( not ( = ?auto_168563 ?auto_168565 ) ) ( not ( = ?auto_168563 ?auto_168566 ) ) ( not ( = ?auto_168563 ?auto_168567 ) ) ( not ( = ?auto_168563 ?auto_168568 ) ) ( not ( = ?auto_168563 ?auto_168569 ) ) ( not ( = ?auto_168563 ?auto_168570 ) ) ( not ( = ?auto_168564 ?auto_168565 ) ) ( not ( = ?auto_168564 ?auto_168566 ) ) ( not ( = ?auto_168564 ?auto_168567 ) ) ( not ( = ?auto_168564 ?auto_168568 ) ) ( not ( = ?auto_168564 ?auto_168569 ) ) ( not ( = ?auto_168564 ?auto_168570 ) ) ( not ( = ?auto_168565 ?auto_168566 ) ) ( not ( = ?auto_168565 ?auto_168567 ) ) ( not ( = ?auto_168565 ?auto_168568 ) ) ( not ( = ?auto_168565 ?auto_168569 ) ) ( not ( = ?auto_168565 ?auto_168570 ) ) ( not ( = ?auto_168566 ?auto_168567 ) ) ( not ( = ?auto_168566 ?auto_168568 ) ) ( not ( = ?auto_168566 ?auto_168569 ) ) ( not ( = ?auto_168566 ?auto_168570 ) ) ( not ( = ?auto_168567 ?auto_168568 ) ) ( not ( = ?auto_168567 ?auto_168569 ) ) ( not ( = ?auto_168567 ?auto_168570 ) ) ( not ( = ?auto_168568 ?auto_168569 ) ) ( not ( = ?auto_168568 ?auto_168570 ) ) ( not ( = ?auto_168569 ?auto_168570 ) ) ( ON ?auto_168568 ?auto_168569 ) ( ON ?auto_168567 ?auto_168568 ) ( ON ?auto_168566 ?auto_168567 ) ( CLEAR ?auto_168564 ) ( ON ?auto_168565 ?auto_168566 ) ( CLEAR ?auto_168565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168559 ?auto_168560 ?auto_168561 ?auto_168562 ?auto_168563 ?auto_168564 ?auto_168565 )
      ( MAKE-11PILE ?auto_168559 ?auto_168560 ?auto_168561 ?auto_168562 ?auto_168563 ?auto_168564 ?auto_168565 ?auto_168566 ?auto_168567 ?auto_168568 ?auto_168569 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168605 - BLOCK
      ?auto_168606 - BLOCK
      ?auto_168607 - BLOCK
      ?auto_168608 - BLOCK
      ?auto_168609 - BLOCK
      ?auto_168610 - BLOCK
      ?auto_168611 - BLOCK
      ?auto_168612 - BLOCK
      ?auto_168613 - BLOCK
      ?auto_168614 - BLOCK
      ?auto_168615 - BLOCK
    )
    :vars
    (
      ?auto_168616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168615 ?auto_168616 ) ( ON-TABLE ?auto_168605 ) ( ON ?auto_168606 ?auto_168605 ) ( ON ?auto_168607 ?auto_168606 ) ( ON ?auto_168608 ?auto_168607 ) ( ON ?auto_168609 ?auto_168608 ) ( not ( = ?auto_168605 ?auto_168606 ) ) ( not ( = ?auto_168605 ?auto_168607 ) ) ( not ( = ?auto_168605 ?auto_168608 ) ) ( not ( = ?auto_168605 ?auto_168609 ) ) ( not ( = ?auto_168605 ?auto_168610 ) ) ( not ( = ?auto_168605 ?auto_168611 ) ) ( not ( = ?auto_168605 ?auto_168612 ) ) ( not ( = ?auto_168605 ?auto_168613 ) ) ( not ( = ?auto_168605 ?auto_168614 ) ) ( not ( = ?auto_168605 ?auto_168615 ) ) ( not ( = ?auto_168605 ?auto_168616 ) ) ( not ( = ?auto_168606 ?auto_168607 ) ) ( not ( = ?auto_168606 ?auto_168608 ) ) ( not ( = ?auto_168606 ?auto_168609 ) ) ( not ( = ?auto_168606 ?auto_168610 ) ) ( not ( = ?auto_168606 ?auto_168611 ) ) ( not ( = ?auto_168606 ?auto_168612 ) ) ( not ( = ?auto_168606 ?auto_168613 ) ) ( not ( = ?auto_168606 ?auto_168614 ) ) ( not ( = ?auto_168606 ?auto_168615 ) ) ( not ( = ?auto_168606 ?auto_168616 ) ) ( not ( = ?auto_168607 ?auto_168608 ) ) ( not ( = ?auto_168607 ?auto_168609 ) ) ( not ( = ?auto_168607 ?auto_168610 ) ) ( not ( = ?auto_168607 ?auto_168611 ) ) ( not ( = ?auto_168607 ?auto_168612 ) ) ( not ( = ?auto_168607 ?auto_168613 ) ) ( not ( = ?auto_168607 ?auto_168614 ) ) ( not ( = ?auto_168607 ?auto_168615 ) ) ( not ( = ?auto_168607 ?auto_168616 ) ) ( not ( = ?auto_168608 ?auto_168609 ) ) ( not ( = ?auto_168608 ?auto_168610 ) ) ( not ( = ?auto_168608 ?auto_168611 ) ) ( not ( = ?auto_168608 ?auto_168612 ) ) ( not ( = ?auto_168608 ?auto_168613 ) ) ( not ( = ?auto_168608 ?auto_168614 ) ) ( not ( = ?auto_168608 ?auto_168615 ) ) ( not ( = ?auto_168608 ?auto_168616 ) ) ( not ( = ?auto_168609 ?auto_168610 ) ) ( not ( = ?auto_168609 ?auto_168611 ) ) ( not ( = ?auto_168609 ?auto_168612 ) ) ( not ( = ?auto_168609 ?auto_168613 ) ) ( not ( = ?auto_168609 ?auto_168614 ) ) ( not ( = ?auto_168609 ?auto_168615 ) ) ( not ( = ?auto_168609 ?auto_168616 ) ) ( not ( = ?auto_168610 ?auto_168611 ) ) ( not ( = ?auto_168610 ?auto_168612 ) ) ( not ( = ?auto_168610 ?auto_168613 ) ) ( not ( = ?auto_168610 ?auto_168614 ) ) ( not ( = ?auto_168610 ?auto_168615 ) ) ( not ( = ?auto_168610 ?auto_168616 ) ) ( not ( = ?auto_168611 ?auto_168612 ) ) ( not ( = ?auto_168611 ?auto_168613 ) ) ( not ( = ?auto_168611 ?auto_168614 ) ) ( not ( = ?auto_168611 ?auto_168615 ) ) ( not ( = ?auto_168611 ?auto_168616 ) ) ( not ( = ?auto_168612 ?auto_168613 ) ) ( not ( = ?auto_168612 ?auto_168614 ) ) ( not ( = ?auto_168612 ?auto_168615 ) ) ( not ( = ?auto_168612 ?auto_168616 ) ) ( not ( = ?auto_168613 ?auto_168614 ) ) ( not ( = ?auto_168613 ?auto_168615 ) ) ( not ( = ?auto_168613 ?auto_168616 ) ) ( not ( = ?auto_168614 ?auto_168615 ) ) ( not ( = ?auto_168614 ?auto_168616 ) ) ( not ( = ?auto_168615 ?auto_168616 ) ) ( ON ?auto_168614 ?auto_168615 ) ( ON ?auto_168613 ?auto_168614 ) ( ON ?auto_168612 ?auto_168613 ) ( ON ?auto_168611 ?auto_168612 ) ( CLEAR ?auto_168609 ) ( ON ?auto_168610 ?auto_168611 ) ( CLEAR ?auto_168610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168605 ?auto_168606 ?auto_168607 ?auto_168608 ?auto_168609 ?auto_168610 )
      ( MAKE-11PILE ?auto_168605 ?auto_168606 ?auto_168607 ?auto_168608 ?auto_168609 ?auto_168610 ?auto_168611 ?auto_168612 ?auto_168613 ?auto_168614 ?auto_168615 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168651 - BLOCK
      ?auto_168652 - BLOCK
      ?auto_168653 - BLOCK
      ?auto_168654 - BLOCK
      ?auto_168655 - BLOCK
      ?auto_168656 - BLOCK
      ?auto_168657 - BLOCK
      ?auto_168658 - BLOCK
      ?auto_168659 - BLOCK
      ?auto_168660 - BLOCK
      ?auto_168661 - BLOCK
    )
    :vars
    (
      ?auto_168662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168661 ?auto_168662 ) ( ON-TABLE ?auto_168651 ) ( ON ?auto_168652 ?auto_168651 ) ( ON ?auto_168653 ?auto_168652 ) ( ON ?auto_168654 ?auto_168653 ) ( not ( = ?auto_168651 ?auto_168652 ) ) ( not ( = ?auto_168651 ?auto_168653 ) ) ( not ( = ?auto_168651 ?auto_168654 ) ) ( not ( = ?auto_168651 ?auto_168655 ) ) ( not ( = ?auto_168651 ?auto_168656 ) ) ( not ( = ?auto_168651 ?auto_168657 ) ) ( not ( = ?auto_168651 ?auto_168658 ) ) ( not ( = ?auto_168651 ?auto_168659 ) ) ( not ( = ?auto_168651 ?auto_168660 ) ) ( not ( = ?auto_168651 ?auto_168661 ) ) ( not ( = ?auto_168651 ?auto_168662 ) ) ( not ( = ?auto_168652 ?auto_168653 ) ) ( not ( = ?auto_168652 ?auto_168654 ) ) ( not ( = ?auto_168652 ?auto_168655 ) ) ( not ( = ?auto_168652 ?auto_168656 ) ) ( not ( = ?auto_168652 ?auto_168657 ) ) ( not ( = ?auto_168652 ?auto_168658 ) ) ( not ( = ?auto_168652 ?auto_168659 ) ) ( not ( = ?auto_168652 ?auto_168660 ) ) ( not ( = ?auto_168652 ?auto_168661 ) ) ( not ( = ?auto_168652 ?auto_168662 ) ) ( not ( = ?auto_168653 ?auto_168654 ) ) ( not ( = ?auto_168653 ?auto_168655 ) ) ( not ( = ?auto_168653 ?auto_168656 ) ) ( not ( = ?auto_168653 ?auto_168657 ) ) ( not ( = ?auto_168653 ?auto_168658 ) ) ( not ( = ?auto_168653 ?auto_168659 ) ) ( not ( = ?auto_168653 ?auto_168660 ) ) ( not ( = ?auto_168653 ?auto_168661 ) ) ( not ( = ?auto_168653 ?auto_168662 ) ) ( not ( = ?auto_168654 ?auto_168655 ) ) ( not ( = ?auto_168654 ?auto_168656 ) ) ( not ( = ?auto_168654 ?auto_168657 ) ) ( not ( = ?auto_168654 ?auto_168658 ) ) ( not ( = ?auto_168654 ?auto_168659 ) ) ( not ( = ?auto_168654 ?auto_168660 ) ) ( not ( = ?auto_168654 ?auto_168661 ) ) ( not ( = ?auto_168654 ?auto_168662 ) ) ( not ( = ?auto_168655 ?auto_168656 ) ) ( not ( = ?auto_168655 ?auto_168657 ) ) ( not ( = ?auto_168655 ?auto_168658 ) ) ( not ( = ?auto_168655 ?auto_168659 ) ) ( not ( = ?auto_168655 ?auto_168660 ) ) ( not ( = ?auto_168655 ?auto_168661 ) ) ( not ( = ?auto_168655 ?auto_168662 ) ) ( not ( = ?auto_168656 ?auto_168657 ) ) ( not ( = ?auto_168656 ?auto_168658 ) ) ( not ( = ?auto_168656 ?auto_168659 ) ) ( not ( = ?auto_168656 ?auto_168660 ) ) ( not ( = ?auto_168656 ?auto_168661 ) ) ( not ( = ?auto_168656 ?auto_168662 ) ) ( not ( = ?auto_168657 ?auto_168658 ) ) ( not ( = ?auto_168657 ?auto_168659 ) ) ( not ( = ?auto_168657 ?auto_168660 ) ) ( not ( = ?auto_168657 ?auto_168661 ) ) ( not ( = ?auto_168657 ?auto_168662 ) ) ( not ( = ?auto_168658 ?auto_168659 ) ) ( not ( = ?auto_168658 ?auto_168660 ) ) ( not ( = ?auto_168658 ?auto_168661 ) ) ( not ( = ?auto_168658 ?auto_168662 ) ) ( not ( = ?auto_168659 ?auto_168660 ) ) ( not ( = ?auto_168659 ?auto_168661 ) ) ( not ( = ?auto_168659 ?auto_168662 ) ) ( not ( = ?auto_168660 ?auto_168661 ) ) ( not ( = ?auto_168660 ?auto_168662 ) ) ( not ( = ?auto_168661 ?auto_168662 ) ) ( ON ?auto_168660 ?auto_168661 ) ( ON ?auto_168659 ?auto_168660 ) ( ON ?auto_168658 ?auto_168659 ) ( ON ?auto_168657 ?auto_168658 ) ( ON ?auto_168656 ?auto_168657 ) ( CLEAR ?auto_168654 ) ( ON ?auto_168655 ?auto_168656 ) ( CLEAR ?auto_168655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168651 ?auto_168652 ?auto_168653 ?auto_168654 ?auto_168655 )
      ( MAKE-11PILE ?auto_168651 ?auto_168652 ?auto_168653 ?auto_168654 ?auto_168655 ?auto_168656 ?auto_168657 ?auto_168658 ?auto_168659 ?auto_168660 ?auto_168661 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168697 - BLOCK
      ?auto_168698 - BLOCK
      ?auto_168699 - BLOCK
      ?auto_168700 - BLOCK
      ?auto_168701 - BLOCK
      ?auto_168702 - BLOCK
      ?auto_168703 - BLOCK
      ?auto_168704 - BLOCK
      ?auto_168705 - BLOCK
      ?auto_168706 - BLOCK
      ?auto_168707 - BLOCK
    )
    :vars
    (
      ?auto_168708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168707 ?auto_168708 ) ( ON-TABLE ?auto_168697 ) ( ON ?auto_168698 ?auto_168697 ) ( ON ?auto_168699 ?auto_168698 ) ( not ( = ?auto_168697 ?auto_168698 ) ) ( not ( = ?auto_168697 ?auto_168699 ) ) ( not ( = ?auto_168697 ?auto_168700 ) ) ( not ( = ?auto_168697 ?auto_168701 ) ) ( not ( = ?auto_168697 ?auto_168702 ) ) ( not ( = ?auto_168697 ?auto_168703 ) ) ( not ( = ?auto_168697 ?auto_168704 ) ) ( not ( = ?auto_168697 ?auto_168705 ) ) ( not ( = ?auto_168697 ?auto_168706 ) ) ( not ( = ?auto_168697 ?auto_168707 ) ) ( not ( = ?auto_168697 ?auto_168708 ) ) ( not ( = ?auto_168698 ?auto_168699 ) ) ( not ( = ?auto_168698 ?auto_168700 ) ) ( not ( = ?auto_168698 ?auto_168701 ) ) ( not ( = ?auto_168698 ?auto_168702 ) ) ( not ( = ?auto_168698 ?auto_168703 ) ) ( not ( = ?auto_168698 ?auto_168704 ) ) ( not ( = ?auto_168698 ?auto_168705 ) ) ( not ( = ?auto_168698 ?auto_168706 ) ) ( not ( = ?auto_168698 ?auto_168707 ) ) ( not ( = ?auto_168698 ?auto_168708 ) ) ( not ( = ?auto_168699 ?auto_168700 ) ) ( not ( = ?auto_168699 ?auto_168701 ) ) ( not ( = ?auto_168699 ?auto_168702 ) ) ( not ( = ?auto_168699 ?auto_168703 ) ) ( not ( = ?auto_168699 ?auto_168704 ) ) ( not ( = ?auto_168699 ?auto_168705 ) ) ( not ( = ?auto_168699 ?auto_168706 ) ) ( not ( = ?auto_168699 ?auto_168707 ) ) ( not ( = ?auto_168699 ?auto_168708 ) ) ( not ( = ?auto_168700 ?auto_168701 ) ) ( not ( = ?auto_168700 ?auto_168702 ) ) ( not ( = ?auto_168700 ?auto_168703 ) ) ( not ( = ?auto_168700 ?auto_168704 ) ) ( not ( = ?auto_168700 ?auto_168705 ) ) ( not ( = ?auto_168700 ?auto_168706 ) ) ( not ( = ?auto_168700 ?auto_168707 ) ) ( not ( = ?auto_168700 ?auto_168708 ) ) ( not ( = ?auto_168701 ?auto_168702 ) ) ( not ( = ?auto_168701 ?auto_168703 ) ) ( not ( = ?auto_168701 ?auto_168704 ) ) ( not ( = ?auto_168701 ?auto_168705 ) ) ( not ( = ?auto_168701 ?auto_168706 ) ) ( not ( = ?auto_168701 ?auto_168707 ) ) ( not ( = ?auto_168701 ?auto_168708 ) ) ( not ( = ?auto_168702 ?auto_168703 ) ) ( not ( = ?auto_168702 ?auto_168704 ) ) ( not ( = ?auto_168702 ?auto_168705 ) ) ( not ( = ?auto_168702 ?auto_168706 ) ) ( not ( = ?auto_168702 ?auto_168707 ) ) ( not ( = ?auto_168702 ?auto_168708 ) ) ( not ( = ?auto_168703 ?auto_168704 ) ) ( not ( = ?auto_168703 ?auto_168705 ) ) ( not ( = ?auto_168703 ?auto_168706 ) ) ( not ( = ?auto_168703 ?auto_168707 ) ) ( not ( = ?auto_168703 ?auto_168708 ) ) ( not ( = ?auto_168704 ?auto_168705 ) ) ( not ( = ?auto_168704 ?auto_168706 ) ) ( not ( = ?auto_168704 ?auto_168707 ) ) ( not ( = ?auto_168704 ?auto_168708 ) ) ( not ( = ?auto_168705 ?auto_168706 ) ) ( not ( = ?auto_168705 ?auto_168707 ) ) ( not ( = ?auto_168705 ?auto_168708 ) ) ( not ( = ?auto_168706 ?auto_168707 ) ) ( not ( = ?auto_168706 ?auto_168708 ) ) ( not ( = ?auto_168707 ?auto_168708 ) ) ( ON ?auto_168706 ?auto_168707 ) ( ON ?auto_168705 ?auto_168706 ) ( ON ?auto_168704 ?auto_168705 ) ( ON ?auto_168703 ?auto_168704 ) ( ON ?auto_168702 ?auto_168703 ) ( ON ?auto_168701 ?auto_168702 ) ( CLEAR ?auto_168699 ) ( ON ?auto_168700 ?auto_168701 ) ( CLEAR ?auto_168700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168697 ?auto_168698 ?auto_168699 ?auto_168700 )
      ( MAKE-11PILE ?auto_168697 ?auto_168698 ?auto_168699 ?auto_168700 ?auto_168701 ?auto_168702 ?auto_168703 ?auto_168704 ?auto_168705 ?auto_168706 ?auto_168707 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168743 - BLOCK
      ?auto_168744 - BLOCK
      ?auto_168745 - BLOCK
      ?auto_168746 - BLOCK
      ?auto_168747 - BLOCK
      ?auto_168748 - BLOCK
      ?auto_168749 - BLOCK
      ?auto_168750 - BLOCK
      ?auto_168751 - BLOCK
      ?auto_168752 - BLOCK
      ?auto_168753 - BLOCK
    )
    :vars
    (
      ?auto_168754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168753 ?auto_168754 ) ( ON-TABLE ?auto_168743 ) ( ON ?auto_168744 ?auto_168743 ) ( not ( = ?auto_168743 ?auto_168744 ) ) ( not ( = ?auto_168743 ?auto_168745 ) ) ( not ( = ?auto_168743 ?auto_168746 ) ) ( not ( = ?auto_168743 ?auto_168747 ) ) ( not ( = ?auto_168743 ?auto_168748 ) ) ( not ( = ?auto_168743 ?auto_168749 ) ) ( not ( = ?auto_168743 ?auto_168750 ) ) ( not ( = ?auto_168743 ?auto_168751 ) ) ( not ( = ?auto_168743 ?auto_168752 ) ) ( not ( = ?auto_168743 ?auto_168753 ) ) ( not ( = ?auto_168743 ?auto_168754 ) ) ( not ( = ?auto_168744 ?auto_168745 ) ) ( not ( = ?auto_168744 ?auto_168746 ) ) ( not ( = ?auto_168744 ?auto_168747 ) ) ( not ( = ?auto_168744 ?auto_168748 ) ) ( not ( = ?auto_168744 ?auto_168749 ) ) ( not ( = ?auto_168744 ?auto_168750 ) ) ( not ( = ?auto_168744 ?auto_168751 ) ) ( not ( = ?auto_168744 ?auto_168752 ) ) ( not ( = ?auto_168744 ?auto_168753 ) ) ( not ( = ?auto_168744 ?auto_168754 ) ) ( not ( = ?auto_168745 ?auto_168746 ) ) ( not ( = ?auto_168745 ?auto_168747 ) ) ( not ( = ?auto_168745 ?auto_168748 ) ) ( not ( = ?auto_168745 ?auto_168749 ) ) ( not ( = ?auto_168745 ?auto_168750 ) ) ( not ( = ?auto_168745 ?auto_168751 ) ) ( not ( = ?auto_168745 ?auto_168752 ) ) ( not ( = ?auto_168745 ?auto_168753 ) ) ( not ( = ?auto_168745 ?auto_168754 ) ) ( not ( = ?auto_168746 ?auto_168747 ) ) ( not ( = ?auto_168746 ?auto_168748 ) ) ( not ( = ?auto_168746 ?auto_168749 ) ) ( not ( = ?auto_168746 ?auto_168750 ) ) ( not ( = ?auto_168746 ?auto_168751 ) ) ( not ( = ?auto_168746 ?auto_168752 ) ) ( not ( = ?auto_168746 ?auto_168753 ) ) ( not ( = ?auto_168746 ?auto_168754 ) ) ( not ( = ?auto_168747 ?auto_168748 ) ) ( not ( = ?auto_168747 ?auto_168749 ) ) ( not ( = ?auto_168747 ?auto_168750 ) ) ( not ( = ?auto_168747 ?auto_168751 ) ) ( not ( = ?auto_168747 ?auto_168752 ) ) ( not ( = ?auto_168747 ?auto_168753 ) ) ( not ( = ?auto_168747 ?auto_168754 ) ) ( not ( = ?auto_168748 ?auto_168749 ) ) ( not ( = ?auto_168748 ?auto_168750 ) ) ( not ( = ?auto_168748 ?auto_168751 ) ) ( not ( = ?auto_168748 ?auto_168752 ) ) ( not ( = ?auto_168748 ?auto_168753 ) ) ( not ( = ?auto_168748 ?auto_168754 ) ) ( not ( = ?auto_168749 ?auto_168750 ) ) ( not ( = ?auto_168749 ?auto_168751 ) ) ( not ( = ?auto_168749 ?auto_168752 ) ) ( not ( = ?auto_168749 ?auto_168753 ) ) ( not ( = ?auto_168749 ?auto_168754 ) ) ( not ( = ?auto_168750 ?auto_168751 ) ) ( not ( = ?auto_168750 ?auto_168752 ) ) ( not ( = ?auto_168750 ?auto_168753 ) ) ( not ( = ?auto_168750 ?auto_168754 ) ) ( not ( = ?auto_168751 ?auto_168752 ) ) ( not ( = ?auto_168751 ?auto_168753 ) ) ( not ( = ?auto_168751 ?auto_168754 ) ) ( not ( = ?auto_168752 ?auto_168753 ) ) ( not ( = ?auto_168752 ?auto_168754 ) ) ( not ( = ?auto_168753 ?auto_168754 ) ) ( ON ?auto_168752 ?auto_168753 ) ( ON ?auto_168751 ?auto_168752 ) ( ON ?auto_168750 ?auto_168751 ) ( ON ?auto_168749 ?auto_168750 ) ( ON ?auto_168748 ?auto_168749 ) ( ON ?auto_168747 ?auto_168748 ) ( ON ?auto_168746 ?auto_168747 ) ( CLEAR ?auto_168744 ) ( ON ?auto_168745 ?auto_168746 ) ( CLEAR ?auto_168745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168743 ?auto_168744 ?auto_168745 )
      ( MAKE-11PILE ?auto_168743 ?auto_168744 ?auto_168745 ?auto_168746 ?auto_168747 ?auto_168748 ?auto_168749 ?auto_168750 ?auto_168751 ?auto_168752 ?auto_168753 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168789 - BLOCK
      ?auto_168790 - BLOCK
      ?auto_168791 - BLOCK
      ?auto_168792 - BLOCK
      ?auto_168793 - BLOCK
      ?auto_168794 - BLOCK
      ?auto_168795 - BLOCK
      ?auto_168796 - BLOCK
      ?auto_168797 - BLOCK
      ?auto_168798 - BLOCK
      ?auto_168799 - BLOCK
    )
    :vars
    (
      ?auto_168800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168799 ?auto_168800 ) ( ON-TABLE ?auto_168789 ) ( not ( = ?auto_168789 ?auto_168790 ) ) ( not ( = ?auto_168789 ?auto_168791 ) ) ( not ( = ?auto_168789 ?auto_168792 ) ) ( not ( = ?auto_168789 ?auto_168793 ) ) ( not ( = ?auto_168789 ?auto_168794 ) ) ( not ( = ?auto_168789 ?auto_168795 ) ) ( not ( = ?auto_168789 ?auto_168796 ) ) ( not ( = ?auto_168789 ?auto_168797 ) ) ( not ( = ?auto_168789 ?auto_168798 ) ) ( not ( = ?auto_168789 ?auto_168799 ) ) ( not ( = ?auto_168789 ?auto_168800 ) ) ( not ( = ?auto_168790 ?auto_168791 ) ) ( not ( = ?auto_168790 ?auto_168792 ) ) ( not ( = ?auto_168790 ?auto_168793 ) ) ( not ( = ?auto_168790 ?auto_168794 ) ) ( not ( = ?auto_168790 ?auto_168795 ) ) ( not ( = ?auto_168790 ?auto_168796 ) ) ( not ( = ?auto_168790 ?auto_168797 ) ) ( not ( = ?auto_168790 ?auto_168798 ) ) ( not ( = ?auto_168790 ?auto_168799 ) ) ( not ( = ?auto_168790 ?auto_168800 ) ) ( not ( = ?auto_168791 ?auto_168792 ) ) ( not ( = ?auto_168791 ?auto_168793 ) ) ( not ( = ?auto_168791 ?auto_168794 ) ) ( not ( = ?auto_168791 ?auto_168795 ) ) ( not ( = ?auto_168791 ?auto_168796 ) ) ( not ( = ?auto_168791 ?auto_168797 ) ) ( not ( = ?auto_168791 ?auto_168798 ) ) ( not ( = ?auto_168791 ?auto_168799 ) ) ( not ( = ?auto_168791 ?auto_168800 ) ) ( not ( = ?auto_168792 ?auto_168793 ) ) ( not ( = ?auto_168792 ?auto_168794 ) ) ( not ( = ?auto_168792 ?auto_168795 ) ) ( not ( = ?auto_168792 ?auto_168796 ) ) ( not ( = ?auto_168792 ?auto_168797 ) ) ( not ( = ?auto_168792 ?auto_168798 ) ) ( not ( = ?auto_168792 ?auto_168799 ) ) ( not ( = ?auto_168792 ?auto_168800 ) ) ( not ( = ?auto_168793 ?auto_168794 ) ) ( not ( = ?auto_168793 ?auto_168795 ) ) ( not ( = ?auto_168793 ?auto_168796 ) ) ( not ( = ?auto_168793 ?auto_168797 ) ) ( not ( = ?auto_168793 ?auto_168798 ) ) ( not ( = ?auto_168793 ?auto_168799 ) ) ( not ( = ?auto_168793 ?auto_168800 ) ) ( not ( = ?auto_168794 ?auto_168795 ) ) ( not ( = ?auto_168794 ?auto_168796 ) ) ( not ( = ?auto_168794 ?auto_168797 ) ) ( not ( = ?auto_168794 ?auto_168798 ) ) ( not ( = ?auto_168794 ?auto_168799 ) ) ( not ( = ?auto_168794 ?auto_168800 ) ) ( not ( = ?auto_168795 ?auto_168796 ) ) ( not ( = ?auto_168795 ?auto_168797 ) ) ( not ( = ?auto_168795 ?auto_168798 ) ) ( not ( = ?auto_168795 ?auto_168799 ) ) ( not ( = ?auto_168795 ?auto_168800 ) ) ( not ( = ?auto_168796 ?auto_168797 ) ) ( not ( = ?auto_168796 ?auto_168798 ) ) ( not ( = ?auto_168796 ?auto_168799 ) ) ( not ( = ?auto_168796 ?auto_168800 ) ) ( not ( = ?auto_168797 ?auto_168798 ) ) ( not ( = ?auto_168797 ?auto_168799 ) ) ( not ( = ?auto_168797 ?auto_168800 ) ) ( not ( = ?auto_168798 ?auto_168799 ) ) ( not ( = ?auto_168798 ?auto_168800 ) ) ( not ( = ?auto_168799 ?auto_168800 ) ) ( ON ?auto_168798 ?auto_168799 ) ( ON ?auto_168797 ?auto_168798 ) ( ON ?auto_168796 ?auto_168797 ) ( ON ?auto_168795 ?auto_168796 ) ( ON ?auto_168794 ?auto_168795 ) ( ON ?auto_168793 ?auto_168794 ) ( ON ?auto_168792 ?auto_168793 ) ( ON ?auto_168791 ?auto_168792 ) ( CLEAR ?auto_168789 ) ( ON ?auto_168790 ?auto_168791 ) ( CLEAR ?auto_168790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168789 ?auto_168790 )
      ( MAKE-11PILE ?auto_168789 ?auto_168790 ?auto_168791 ?auto_168792 ?auto_168793 ?auto_168794 ?auto_168795 ?auto_168796 ?auto_168797 ?auto_168798 ?auto_168799 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168835 - BLOCK
      ?auto_168836 - BLOCK
      ?auto_168837 - BLOCK
      ?auto_168838 - BLOCK
      ?auto_168839 - BLOCK
      ?auto_168840 - BLOCK
      ?auto_168841 - BLOCK
      ?auto_168842 - BLOCK
      ?auto_168843 - BLOCK
      ?auto_168844 - BLOCK
      ?auto_168845 - BLOCK
    )
    :vars
    (
      ?auto_168846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168845 ?auto_168846 ) ( not ( = ?auto_168835 ?auto_168836 ) ) ( not ( = ?auto_168835 ?auto_168837 ) ) ( not ( = ?auto_168835 ?auto_168838 ) ) ( not ( = ?auto_168835 ?auto_168839 ) ) ( not ( = ?auto_168835 ?auto_168840 ) ) ( not ( = ?auto_168835 ?auto_168841 ) ) ( not ( = ?auto_168835 ?auto_168842 ) ) ( not ( = ?auto_168835 ?auto_168843 ) ) ( not ( = ?auto_168835 ?auto_168844 ) ) ( not ( = ?auto_168835 ?auto_168845 ) ) ( not ( = ?auto_168835 ?auto_168846 ) ) ( not ( = ?auto_168836 ?auto_168837 ) ) ( not ( = ?auto_168836 ?auto_168838 ) ) ( not ( = ?auto_168836 ?auto_168839 ) ) ( not ( = ?auto_168836 ?auto_168840 ) ) ( not ( = ?auto_168836 ?auto_168841 ) ) ( not ( = ?auto_168836 ?auto_168842 ) ) ( not ( = ?auto_168836 ?auto_168843 ) ) ( not ( = ?auto_168836 ?auto_168844 ) ) ( not ( = ?auto_168836 ?auto_168845 ) ) ( not ( = ?auto_168836 ?auto_168846 ) ) ( not ( = ?auto_168837 ?auto_168838 ) ) ( not ( = ?auto_168837 ?auto_168839 ) ) ( not ( = ?auto_168837 ?auto_168840 ) ) ( not ( = ?auto_168837 ?auto_168841 ) ) ( not ( = ?auto_168837 ?auto_168842 ) ) ( not ( = ?auto_168837 ?auto_168843 ) ) ( not ( = ?auto_168837 ?auto_168844 ) ) ( not ( = ?auto_168837 ?auto_168845 ) ) ( not ( = ?auto_168837 ?auto_168846 ) ) ( not ( = ?auto_168838 ?auto_168839 ) ) ( not ( = ?auto_168838 ?auto_168840 ) ) ( not ( = ?auto_168838 ?auto_168841 ) ) ( not ( = ?auto_168838 ?auto_168842 ) ) ( not ( = ?auto_168838 ?auto_168843 ) ) ( not ( = ?auto_168838 ?auto_168844 ) ) ( not ( = ?auto_168838 ?auto_168845 ) ) ( not ( = ?auto_168838 ?auto_168846 ) ) ( not ( = ?auto_168839 ?auto_168840 ) ) ( not ( = ?auto_168839 ?auto_168841 ) ) ( not ( = ?auto_168839 ?auto_168842 ) ) ( not ( = ?auto_168839 ?auto_168843 ) ) ( not ( = ?auto_168839 ?auto_168844 ) ) ( not ( = ?auto_168839 ?auto_168845 ) ) ( not ( = ?auto_168839 ?auto_168846 ) ) ( not ( = ?auto_168840 ?auto_168841 ) ) ( not ( = ?auto_168840 ?auto_168842 ) ) ( not ( = ?auto_168840 ?auto_168843 ) ) ( not ( = ?auto_168840 ?auto_168844 ) ) ( not ( = ?auto_168840 ?auto_168845 ) ) ( not ( = ?auto_168840 ?auto_168846 ) ) ( not ( = ?auto_168841 ?auto_168842 ) ) ( not ( = ?auto_168841 ?auto_168843 ) ) ( not ( = ?auto_168841 ?auto_168844 ) ) ( not ( = ?auto_168841 ?auto_168845 ) ) ( not ( = ?auto_168841 ?auto_168846 ) ) ( not ( = ?auto_168842 ?auto_168843 ) ) ( not ( = ?auto_168842 ?auto_168844 ) ) ( not ( = ?auto_168842 ?auto_168845 ) ) ( not ( = ?auto_168842 ?auto_168846 ) ) ( not ( = ?auto_168843 ?auto_168844 ) ) ( not ( = ?auto_168843 ?auto_168845 ) ) ( not ( = ?auto_168843 ?auto_168846 ) ) ( not ( = ?auto_168844 ?auto_168845 ) ) ( not ( = ?auto_168844 ?auto_168846 ) ) ( not ( = ?auto_168845 ?auto_168846 ) ) ( ON ?auto_168844 ?auto_168845 ) ( ON ?auto_168843 ?auto_168844 ) ( ON ?auto_168842 ?auto_168843 ) ( ON ?auto_168841 ?auto_168842 ) ( ON ?auto_168840 ?auto_168841 ) ( ON ?auto_168839 ?auto_168840 ) ( ON ?auto_168838 ?auto_168839 ) ( ON ?auto_168837 ?auto_168838 ) ( ON ?auto_168836 ?auto_168837 ) ( ON ?auto_168835 ?auto_168836 ) ( CLEAR ?auto_168835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168835 )
      ( MAKE-11PILE ?auto_168835 ?auto_168836 ?auto_168837 ?auto_168838 ?auto_168839 ?auto_168840 ?auto_168841 ?auto_168842 ?auto_168843 ?auto_168844 ?auto_168845 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_168882 - BLOCK
      ?auto_168883 - BLOCK
      ?auto_168884 - BLOCK
      ?auto_168885 - BLOCK
      ?auto_168886 - BLOCK
      ?auto_168887 - BLOCK
      ?auto_168888 - BLOCK
      ?auto_168889 - BLOCK
      ?auto_168890 - BLOCK
      ?auto_168891 - BLOCK
      ?auto_168892 - BLOCK
      ?auto_168893 - BLOCK
    )
    :vars
    (
      ?auto_168894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_168892 ) ( ON ?auto_168893 ?auto_168894 ) ( CLEAR ?auto_168893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168882 ) ( ON ?auto_168883 ?auto_168882 ) ( ON ?auto_168884 ?auto_168883 ) ( ON ?auto_168885 ?auto_168884 ) ( ON ?auto_168886 ?auto_168885 ) ( ON ?auto_168887 ?auto_168886 ) ( ON ?auto_168888 ?auto_168887 ) ( ON ?auto_168889 ?auto_168888 ) ( ON ?auto_168890 ?auto_168889 ) ( ON ?auto_168891 ?auto_168890 ) ( ON ?auto_168892 ?auto_168891 ) ( not ( = ?auto_168882 ?auto_168883 ) ) ( not ( = ?auto_168882 ?auto_168884 ) ) ( not ( = ?auto_168882 ?auto_168885 ) ) ( not ( = ?auto_168882 ?auto_168886 ) ) ( not ( = ?auto_168882 ?auto_168887 ) ) ( not ( = ?auto_168882 ?auto_168888 ) ) ( not ( = ?auto_168882 ?auto_168889 ) ) ( not ( = ?auto_168882 ?auto_168890 ) ) ( not ( = ?auto_168882 ?auto_168891 ) ) ( not ( = ?auto_168882 ?auto_168892 ) ) ( not ( = ?auto_168882 ?auto_168893 ) ) ( not ( = ?auto_168882 ?auto_168894 ) ) ( not ( = ?auto_168883 ?auto_168884 ) ) ( not ( = ?auto_168883 ?auto_168885 ) ) ( not ( = ?auto_168883 ?auto_168886 ) ) ( not ( = ?auto_168883 ?auto_168887 ) ) ( not ( = ?auto_168883 ?auto_168888 ) ) ( not ( = ?auto_168883 ?auto_168889 ) ) ( not ( = ?auto_168883 ?auto_168890 ) ) ( not ( = ?auto_168883 ?auto_168891 ) ) ( not ( = ?auto_168883 ?auto_168892 ) ) ( not ( = ?auto_168883 ?auto_168893 ) ) ( not ( = ?auto_168883 ?auto_168894 ) ) ( not ( = ?auto_168884 ?auto_168885 ) ) ( not ( = ?auto_168884 ?auto_168886 ) ) ( not ( = ?auto_168884 ?auto_168887 ) ) ( not ( = ?auto_168884 ?auto_168888 ) ) ( not ( = ?auto_168884 ?auto_168889 ) ) ( not ( = ?auto_168884 ?auto_168890 ) ) ( not ( = ?auto_168884 ?auto_168891 ) ) ( not ( = ?auto_168884 ?auto_168892 ) ) ( not ( = ?auto_168884 ?auto_168893 ) ) ( not ( = ?auto_168884 ?auto_168894 ) ) ( not ( = ?auto_168885 ?auto_168886 ) ) ( not ( = ?auto_168885 ?auto_168887 ) ) ( not ( = ?auto_168885 ?auto_168888 ) ) ( not ( = ?auto_168885 ?auto_168889 ) ) ( not ( = ?auto_168885 ?auto_168890 ) ) ( not ( = ?auto_168885 ?auto_168891 ) ) ( not ( = ?auto_168885 ?auto_168892 ) ) ( not ( = ?auto_168885 ?auto_168893 ) ) ( not ( = ?auto_168885 ?auto_168894 ) ) ( not ( = ?auto_168886 ?auto_168887 ) ) ( not ( = ?auto_168886 ?auto_168888 ) ) ( not ( = ?auto_168886 ?auto_168889 ) ) ( not ( = ?auto_168886 ?auto_168890 ) ) ( not ( = ?auto_168886 ?auto_168891 ) ) ( not ( = ?auto_168886 ?auto_168892 ) ) ( not ( = ?auto_168886 ?auto_168893 ) ) ( not ( = ?auto_168886 ?auto_168894 ) ) ( not ( = ?auto_168887 ?auto_168888 ) ) ( not ( = ?auto_168887 ?auto_168889 ) ) ( not ( = ?auto_168887 ?auto_168890 ) ) ( not ( = ?auto_168887 ?auto_168891 ) ) ( not ( = ?auto_168887 ?auto_168892 ) ) ( not ( = ?auto_168887 ?auto_168893 ) ) ( not ( = ?auto_168887 ?auto_168894 ) ) ( not ( = ?auto_168888 ?auto_168889 ) ) ( not ( = ?auto_168888 ?auto_168890 ) ) ( not ( = ?auto_168888 ?auto_168891 ) ) ( not ( = ?auto_168888 ?auto_168892 ) ) ( not ( = ?auto_168888 ?auto_168893 ) ) ( not ( = ?auto_168888 ?auto_168894 ) ) ( not ( = ?auto_168889 ?auto_168890 ) ) ( not ( = ?auto_168889 ?auto_168891 ) ) ( not ( = ?auto_168889 ?auto_168892 ) ) ( not ( = ?auto_168889 ?auto_168893 ) ) ( not ( = ?auto_168889 ?auto_168894 ) ) ( not ( = ?auto_168890 ?auto_168891 ) ) ( not ( = ?auto_168890 ?auto_168892 ) ) ( not ( = ?auto_168890 ?auto_168893 ) ) ( not ( = ?auto_168890 ?auto_168894 ) ) ( not ( = ?auto_168891 ?auto_168892 ) ) ( not ( = ?auto_168891 ?auto_168893 ) ) ( not ( = ?auto_168891 ?auto_168894 ) ) ( not ( = ?auto_168892 ?auto_168893 ) ) ( not ( = ?auto_168892 ?auto_168894 ) ) ( not ( = ?auto_168893 ?auto_168894 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168893 ?auto_168894 )
      ( !STACK ?auto_168893 ?auto_168892 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_168907 - BLOCK
      ?auto_168908 - BLOCK
      ?auto_168909 - BLOCK
      ?auto_168910 - BLOCK
      ?auto_168911 - BLOCK
      ?auto_168912 - BLOCK
      ?auto_168913 - BLOCK
      ?auto_168914 - BLOCK
      ?auto_168915 - BLOCK
      ?auto_168916 - BLOCK
      ?auto_168917 - BLOCK
      ?auto_168918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_168917 ) ( ON-TABLE ?auto_168918 ) ( CLEAR ?auto_168918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168907 ) ( ON ?auto_168908 ?auto_168907 ) ( ON ?auto_168909 ?auto_168908 ) ( ON ?auto_168910 ?auto_168909 ) ( ON ?auto_168911 ?auto_168910 ) ( ON ?auto_168912 ?auto_168911 ) ( ON ?auto_168913 ?auto_168912 ) ( ON ?auto_168914 ?auto_168913 ) ( ON ?auto_168915 ?auto_168914 ) ( ON ?auto_168916 ?auto_168915 ) ( ON ?auto_168917 ?auto_168916 ) ( not ( = ?auto_168907 ?auto_168908 ) ) ( not ( = ?auto_168907 ?auto_168909 ) ) ( not ( = ?auto_168907 ?auto_168910 ) ) ( not ( = ?auto_168907 ?auto_168911 ) ) ( not ( = ?auto_168907 ?auto_168912 ) ) ( not ( = ?auto_168907 ?auto_168913 ) ) ( not ( = ?auto_168907 ?auto_168914 ) ) ( not ( = ?auto_168907 ?auto_168915 ) ) ( not ( = ?auto_168907 ?auto_168916 ) ) ( not ( = ?auto_168907 ?auto_168917 ) ) ( not ( = ?auto_168907 ?auto_168918 ) ) ( not ( = ?auto_168908 ?auto_168909 ) ) ( not ( = ?auto_168908 ?auto_168910 ) ) ( not ( = ?auto_168908 ?auto_168911 ) ) ( not ( = ?auto_168908 ?auto_168912 ) ) ( not ( = ?auto_168908 ?auto_168913 ) ) ( not ( = ?auto_168908 ?auto_168914 ) ) ( not ( = ?auto_168908 ?auto_168915 ) ) ( not ( = ?auto_168908 ?auto_168916 ) ) ( not ( = ?auto_168908 ?auto_168917 ) ) ( not ( = ?auto_168908 ?auto_168918 ) ) ( not ( = ?auto_168909 ?auto_168910 ) ) ( not ( = ?auto_168909 ?auto_168911 ) ) ( not ( = ?auto_168909 ?auto_168912 ) ) ( not ( = ?auto_168909 ?auto_168913 ) ) ( not ( = ?auto_168909 ?auto_168914 ) ) ( not ( = ?auto_168909 ?auto_168915 ) ) ( not ( = ?auto_168909 ?auto_168916 ) ) ( not ( = ?auto_168909 ?auto_168917 ) ) ( not ( = ?auto_168909 ?auto_168918 ) ) ( not ( = ?auto_168910 ?auto_168911 ) ) ( not ( = ?auto_168910 ?auto_168912 ) ) ( not ( = ?auto_168910 ?auto_168913 ) ) ( not ( = ?auto_168910 ?auto_168914 ) ) ( not ( = ?auto_168910 ?auto_168915 ) ) ( not ( = ?auto_168910 ?auto_168916 ) ) ( not ( = ?auto_168910 ?auto_168917 ) ) ( not ( = ?auto_168910 ?auto_168918 ) ) ( not ( = ?auto_168911 ?auto_168912 ) ) ( not ( = ?auto_168911 ?auto_168913 ) ) ( not ( = ?auto_168911 ?auto_168914 ) ) ( not ( = ?auto_168911 ?auto_168915 ) ) ( not ( = ?auto_168911 ?auto_168916 ) ) ( not ( = ?auto_168911 ?auto_168917 ) ) ( not ( = ?auto_168911 ?auto_168918 ) ) ( not ( = ?auto_168912 ?auto_168913 ) ) ( not ( = ?auto_168912 ?auto_168914 ) ) ( not ( = ?auto_168912 ?auto_168915 ) ) ( not ( = ?auto_168912 ?auto_168916 ) ) ( not ( = ?auto_168912 ?auto_168917 ) ) ( not ( = ?auto_168912 ?auto_168918 ) ) ( not ( = ?auto_168913 ?auto_168914 ) ) ( not ( = ?auto_168913 ?auto_168915 ) ) ( not ( = ?auto_168913 ?auto_168916 ) ) ( not ( = ?auto_168913 ?auto_168917 ) ) ( not ( = ?auto_168913 ?auto_168918 ) ) ( not ( = ?auto_168914 ?auto_168915 ) ) ( not ( = ?auto_168914 ?auto_168916 ) ) ( not ( = ?auto_168914 ?auto_168917 ) ) ( not ( = ?auto_168914 ?auto_168918 ) ) ( not ( = ?auto_168915 ?auto_168916 ) ) ( not ( = ?auto_168915 ?auto_168917 ) ) ( not ( = ?auto_168915 ?auto_168918 ) ) ( not ( = ?auto_168916 ?auto_168917 ) ) ( not ( = ?auto_168916 ?auto_168918 ) ) ( not ( = ?auto_168917 ?auto_168918 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_168918 )
      ( !STACK ?auto_168918 ?auto_168917 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_168931 - BLOCK
      ?auto_168932 - BLOCK
      ?auto_168933 - BLOCK
      ?auto_168934 - BLOCK
      ?auto_168935 - BLOCK
      ?auto_168936 - BLOCK
      ?auto_168937 - BLOCK
      ?auto_168938 - BLOCK
      ?auto_168939 - BLOCK
      ?auto_168940 - BLOCK
      ?auto_168941 - BLOCK
      ?auto_168942 - BLOCK
    )
    :vars
    (
      ?auto_168943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168942 ?auto_168943 ) ( ON-TABLE ?auto_168931 ) ( ON ?auto_168932 ?auto_168931 ) ( ON ?auto_168933 ?auto_168932 ) ( ON ?auto_168934 ?auto_168933 ) ( ON ?auto_168935 ?auto_168934 ) ( ON ?auto_168936 ?auto_168935 ) ( ON ?auto_168937 ?auto_168936 ) ( ON ?auto_168938 ?auto_168937 ) ( ON ?auto_168939 ?auto_168938 ) ( ON ?auto_168940 ?auto_168939 ) ( not ( = ?auto_168931 ?auto_168932 ) ) ( not ( = ?auto_168931 ?auto_168933 ) ) ( not ( = ?auto_168931 ?auto_168934 ) ) ( not ( = ?auto_168931 ?auto_168935 ) ) ( not ( = ?auto_168931 ?auto_168936 ) ) ( not ( = ?auto_168931 ?auto_168937 ) ) ( not ( = ?auto_168931 ?auto_168938 ) ) ( not ( = ?auto_168931 ?auto_168939 ) ) ( not ( = ?auto_168931 ?auto_168940 ) ) ( not ( = ?auto_168931 ?auto_168941 ) ) ( not ( = ?auto_168931 ?auto_168942 ) ) ( not ( = ?auto_168931 ?auto_168943 ) ) ( not ( = ?auto_168932 ?auto_168933 ) ) ( not ( = ?auto_168932 ?auto_168934 ) ) ( not ( = ?auto_168932 ?auto_168935 ) ) ( not ( = ?auto_168932 ?auto_168936 ) ) ( not ( = ?auto_168932 ?auto_168937 ) ) ( not ( = ?auto_168932 ?auto_168938 ) ) ( not ( = ?auto_168932 ?auto_168939 ) ) ( not ( = ?auto_168932 ?auto_168940 ) ) ( not ( = ?auto_168932 ?auto_168941 ) ) ( not ( = ?auto_168932 ?auto_168942 ) ) ( not ( = ?auto_168932 ?auto_168943 ) ) ( not ( = ?auto_168933 ?auto_168934 ) ) ( not ( = ?auto_168933 ?auto_168935 ) ) ( not ( = ?auto_168933 ?auto_168936 ) ) ( not ( = ?auto_168933 ?auto_168937 ) ) ( not ( = ?auto_168933 ?auto_168938 ) ) ( not ( = ?auto_168933 ?auto_168939 ) ) ( not ( = ?auto_168933 ?auto_168940 ) ) ( not ( = ?auto_168933 ?auto_168941 ) ) ( not ( = ?auto_168933 ?auto_168942 ) ) ( not ( = ?auto_168933 ?auto_168943 ) ) ( not ( = ?auto_168934 ?auto_168935 ) ) ( not ( = ?auto_168934 ?auto_168936 ) ) ( not ( = ?auto_168934 ?auto_168937 ) ) ( not ( = ?auto_168934 ?auto_168938 ) ) ( not ( = ?auto_168934 ?auto_168939 ) ) ( not ( = ?auto_168934 ?auto_168940 ) ) ( not ( = ?auto_168934 ?auto_168941 ) ) ( not ( = ?auto_168934 ?auto_168942 ) ) ( not ( = ?auto_168934 ?auto_168943 ) ) ( not ( = ?auto_168935 ?auto_168936 ) ) ( not ( = ?auto_168935 ?auto_168937 ) ) ( not ( = ?auto_168935 ?auto_168938 ) ) ( not ( = ?auto_168935 ?auto_168939 ) ) ( not ( = ?auto_168935 ?auto_168940 ) ) ( not ( = ?auto_168935 ?auto_168941 ) ) ( not ( = ?auto_168935 ?auto_168942 ) ) ( not ( = ?auto_168935 ?auto_168943 ) ) ( not ( = ?auto_168936 ?auto_168937 ) ) ( not ( = ?auto_168936 ?auto_168938 ) ) ( not ( = ?auto_168936 ?auto_168939 ) ) ( not ( = ?auto_168936 ?auto_168940 ) ) ( not ( = ?auto_168936 ?auto_168941 ) ) ( not ( = ?auto_168936 ?auto_168942 ) ) ( not ( = ?auto_168936 ?auto_168943 ) ) ( not ( = ?auto_168937 ?auto_168938 ) ) ( not ( = ?auto_168937 ?auto_168939 ) ) ( not ( = ?auto_168937 ?auto_168940 ) ) ( not ( = ?auto_168937 ?auto_168941 ) ) ( not ( = ?auto_168937 ?auto_168942 ) ) ( not ( = ?auto_168937 ?auto_168943 ) ) ( not ( = ?auto_168938 ?auto_168939 ) ) ( not ( = ?auto_168938 ?auto_168940 ) ) ( not ( = ?auto_168938 ?auto_168941 ) ) ( not ( = ?auto_168938 ?auto_168942 ) ) ( not ( = ?auto_168938 ?auto_168943 ) ) ( not ( = ?auto_168939 ?auto_168940 ) ) ( not ( = ?auto_168939 ?auto_168941 ) ) ( not ( = ?auto_168939 ?auto_168942 ) ) ( not ( = ?auto_168939 ?auto_168943 ) ) ( not ( = ?auto_168940 ?auto_168941 ) ) ( not ( = ?auto_168940 ?auto_168942 ) ) ( not ( = ?auto_168940 ?auto_168943 ) ) ( not ( = ?auto_168941 ?auto_168942 ) ) ( not ( = ?auto_168941 ?auto_168943 ) ) ( not ( = ?auto_168942 ?auto_168943 ) ) ( CLEAR ?auto_168940 ) ( ON ?auto_168941 ?auto_168942 ) ( CLEAR ?auto_168941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_168931 ?auto_168932 ?auto_168933 ?auto_168934 ?auto_168935 ?auto_168936 ?auto_168937 ?auto_168938 ?auto_168939 ?auto_168940 ?auto_168941 )
      ( MAKE-12PILE ?auto_168931 ?auto_168932 ?auto_168933 ?auto_168934 ?auto_168935 ?auto_168936 ?auto_168937 ?auto_168938 ?auto_168939 ?auto_168940 ?auto_168941 ?auto_168942 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_168956 - BLOCK
      ?auto_168957 - BLOCK
      ?auto_168958 - BLOCK
      ?auto_168959 - BLOCK
      ?auto_168960 - BLOCK
      ?auto_168961 - BLOCK
      ?auto_168962 - BLOCK
      ?auto_168963 - BLOCK
      ?auto_168964 - BLOCK
      ?auto_168965 - BLOCK
      ?auto_168966 - BLOCK
      ?auto_168967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168967 ) ( ON-TABLE ?auto_168956 ) ( ON ?auto_168957 ?auto_168956 ) ( ON ?auto_168958 ?auto_168957 ) ( ON ?auto_168959 ?auto_168958 ) ( ON ?auto_168960 ?auto_168959 ) ( ON ?auto_168961 ?auto_168960 ) ( ON ?auto_168962 ?auto_168961 ) ( ON ?auto_168963 ?auto_168962 ) ( ON ?auto_168964 ?auto_168963 ) ( ON ?auto_168965 ?auto_168964 ) ( not ( = ?auto_168956 ?auto_168957 ) ) ( not ( = ?auto_168956 ?auto_168958 ) ) ( not ( = ?auto_168956 ?auto_168959 ) ) ( not ( = ?auto_168956 ?auto_168960 ) ) ( not ( = ?auto_168956 ?auto_168961 ) ) ( not ( = ?auto_168956 ?auto_168962 ) ) ( not ( = ?auto_168956 ?auto_168963 ) ) ( not ( = ?auto_168956 ?auto_168964 ) ) ( not ( = ?auto_168956 ?auto_168965 ) ) ( not ( = ?auto_168956 ?auto_168966 ) ) ( not ( = ?auto_168956 ?auto_168967 ) ) ( not ( = ?auto_168957 ?auto_168958 ) ) ( not ( = ?auto_168957 ?auto_168959 ) ) ( not ( = ?auto_168957 ?auto_168960 ) ) ( not ( = ?auto_168957 ?auto_168961 ) ) ( not ( = ?auto_168957 ?auto_168962 ) ) ( not ( = ?auto_168957 ?auto_168963 ) ) ( not ( = ?auto_168957 ?auto_168964 ) ) ( not ( = ?auto_168957 ?auto_168965 ) ) ( not ( = ?auto_168957 ?auto_168966 ) ) ( not ( = ?auto_168957 ?auto_168967 ) ) ( not ( = ?auto_168958 ?auto_168959 ) ) ( not ( = ?auto_168958 ?auto_168960 ) ) ( not ( = ?auto_168958 ?auto_168961 ) ) ( not ( = ?auto_168958 ?auto_168962 ) ) ( not ( = ?auto_168958 ?auto_168963 ) ) ( not ( = ?auto_168958 ?auto_168964 ) ) ( not ( = ?auto_168958 ?auto_168965 ) ) ( not ( = ?auto_168958 ?auto_168966 ) ) ( not ( = ?auto_168958 ?auto_168967 ) ) ( not ( = ?auto_168959 ?auto_168960 ) ) ( not ( = ?auto_168959 ?auto_168961 ) ) ( not ( = ?auto_168959 ?auto_168962 ) ) ( not ( = ?auto_168959 ?auto_168963 ) ) ( not ( = ?auto_168959 ?auto_168964 ) ) ( not ( = ?auto_168959 ?auto_168965 ) ) ( not ( = ?auto_168959 ?auto_168966 ) ) ( not ( = ?auto_168959 ?auto_168967 ) ) ( not ( = ?auto_168960 ?auto_168961 ) ) ( not ( = ?auto_168960 ?auto_168962 ) ) ( not ( = ?auto_168960 ?auto_168963 ) ) ( not ( = ?auto_168960 ?auto_168964 ) ) ( not ( = ?auto_168960 ?auto_168965 ) ) ( not ( = ?auto_168960 ?auto_168966 ) ) ( not ( = ?auto_168960 ?auto_168967 ) ) ( not ( = ?auto_168961 ?auto_168962 ) ) ( not ( = ?auto_168961 ?auto_168963 ) ) ( not ( = ?auto_168961 ?auto_168964 ) ) ( not ( = ?auto_168961 ?auto_168965 ) ) ( not ( = ?auto_168961 ?auto_168966 ) ) ( not ( = ?auto_168961 ?auto_168967 ) ) ( not ( = ?auto_168962 ?auto_168963 ) ) ( not ( = ?auto_168962 ?auto_168964 ) ) ( not ( = ?auto_168962 ?auto_168965 ) ) ( not ( = ?auto_168962 ?auto_168966 ) ) ( not ( = ?auto_168962 ?auto_168967 ) ) ( not ( = ?auto_168963 ?auto_168964 ) ) ( not ( = ?auto_168963 ?auto_168965 ) ) ( not ( = ?auto_168963 ?auto_168966 ) ) ( not ( = ?auto_168963 ?auto_168967 ) ) ( not ( = ?auto_168964 ?auto_168965 ) ) ( not ( = ?auto_168964 ?auto_168966 ) ) ( not ( = ?auto_168964 ?auto_168967 ) ) ( not ( = ?auto_168965 ?auto_168966 ) ) ( not ( = ?auto_168965 ?auto_168967 ) ) ( not ( = ?auto_168966 ?auto_168967 ) ) ( CLEAR ?auto_168965 ) ( ON ?auto_168966 ?auto_168967 ) ( CLEAR ?auto_168966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_168956 ?auto_168957 ?auto_168958 ?auto_168959 ?auto_168960 ?auto_168961 ?auto_168962 ?auto_168963 ?auto_168964 ?auto_168965 ?auto_168966 )
      ( MAKE-12PILE ?auto_168956 ?auto_168957 ?auto_168958 ?auto_168959 ?auto_168960 ?auto_168961 ?auto_168962 ?auto_168963 ?auto_168964 ?auto_168965 ?auto_168966 ?auto_168967 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_168980 - BLOCK
      ?auto_168981 - BLOCK
      ?auto_168982 - BLOCK
      ?auto_168983 - BLOCK
      ?auto_168984 - BLOCK
      ?auto_168985 - BLOCK
      ?auto_168986 - BLOCK
      ?auto_168987 - BLOCK
      ?auto_168988 - BLOCK
      ?auto_168989 - BLOCK
      ?auto_168990 - BLOCK
      ?auto_168991 - BLOCK
    )
    :vars
    (
      ?auto_168992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168991 ?auto_168992 ) ( ON-TABLE ?auto_168980 ) ( ON ?auto_168981 ?auto_168980 ) ( ON ?auto_168982 ?auto_168981 ) ( ON ?auto_168983 ?auto_168982 ) ( ON ?auto_168984 ?auto_168983 ) ( ON ?auto_168985 ?auto_168984 ) ( ON ?auto_168986 ?auto_168985 ) ( ON ?auto_168987 ?auto_168986 ) ( ON ?auto_168988 ?auto_168987 ) ( not ( = ?auto_168980 ?auto_168981 ) ) ( not ( = ?auto_168980 ?auto_168982 ) ) ( not ( = ?auto_168980 ?auto_168983 ) ) ( not ( = ?auto_168980 ?auto_168984 ) ) ( not ( = ?auto_168980 ?auto_168985 ) ) ( not ( = ?auto_168980 ?auto_168986 ) ) ( not ( = ?auto_168980 ?auto_168987 ) ) ( not ( = ?auto_168980 ?auto_168988 ) ) ( not ( = ?auto_168980 ?auto_168989 ) ) ( not ( = ?auto_168980 ?auto_168990 ) ) ( not ( = ?auto_168980 ?auto_168991 ) ) ( not ( = ?auto_168980 ?auto_168992 ) ) ( not ( = ?auto_168981 ?auto_168982 ) ) ( not ( = ?auto_168981 ?auto_168983 ) ) ( not ( = ?auto_168981 ?auto_168984 ) ) ( not ( = ?auto_168981 ?auto_168985 ) ) ( not ( = ?auto_168981 ?auto_168986 ) ) ( not ( = ?auto_168981 ?auto_168987 ) ) ( not ( = ?auto_168981 ?auto_168988 ) ) ( not ( = ?auto_168981 ?auto_168989 ) ) ( not ( = ?auto_168981 ?auto_168990 ) ) ( not ( = ?auto_168981 ?auto_168991 ) ) ( not ( = ?auto_168981 ?auto_168992 ) ) ( not ( = ?auto_168982 ?auto_168983 ) ) ( not ( = ?auto_168982 ?auto_168984 ) ) ( not ( = ?auto_168982 ?auto_168985 ) ) ( not ( = ?auto_168982 ?auto_168986 ) ) ( not ( = ?auto_168982 ?auto_168987 ) ) ( not ( = ?auto_168982 ?auto_168988 ) ) ( not ( = ?auto_168982 ?auto_168989 ) ) ( not ( = ?auto_168982 ?auto_168990 ) ) ( not ( = ?auto_168982 ?auto_168991 ) ) ( not ( = ?auto_168982 ?auto_168992 ) ) ( not ( = ?auto_168983 ?auto_168984 ) ) ( not ( = ?auto_168983 ?auto_168985 ) ) ( not ( = ?auto_168983 ?auto_168986 ) ) ( not ( = ?auto_168983 ?auto_168987 ) ) ( not ( = ?auto_168983 ?auto_168988 ) ) ( not ( = ?auto_168983 ?auto_168989 ) ) ( not ( = ?auto_168983 ?auto_168990 ) ) ( not ( = ?auto_168983 ?auto_168991 ) ) ( not ( = ?auto_168983 ?auto_168992 ) ) ( not ( = ?auto_168984 ?auto_168985 ) ) ( not ( = ?auto_168984 ?auto_168986 ) ) ( not ( = ?auto_168984 ?auto_168987 ) ) ( not ( = ?auto_168984 ?auto_168988 ) ) ( not ( = ?auto_168984 ?auto_168989 ) ) ( not ( = ?auto_168984 ?auto_168990 ) ) ( not ( = ?auto_168984 ?auto_168991 ) ) ( not ( = ?auto_168984 ?auto_168992 ) ) ( not ( = ?auto_168985 ?auto_168986 ) ) ( not ( = ?auto_168985 ?auto_168987 ) ) ( not ( = ?auto_168985 ?auto_168988 ) ) ( not ( = ?auto_168985 ?auto_168989 ) ) ( not ( = ?auto_168985 ?auto_168990 ) ) ( not ( = ?auto_168985 ?auto_168991 ) ) ( not ( = ?auto_168985 ?auto_168992 ) ) ( not ( = ?auto_168986 ?auto_168987 ) ) ( not ( = ?auto_168986 ?auto_168988 ) ) ( not ( = ?auto_168986 ?auto_168989 ) ) ( not ( = ?auto_168986 ?auto_168990 ) ) ( not ( = ?auto_168986 ?auto_168991 ) ) ( not ( = ?auto_168986 ?auto_168992 ) ) ( not ( = ?auto_168987 ?auto_168988 ) ) ( not ( = ?auto_168987 ?auto_168989 ) ) ( not ( = ?auto_168987 ?auto_168990 ) ) ( not ( = ?auto_168987 ?auto_168991 ) ) ( not ( = ?auto_168987 ?auto_168992 ) ) ( not ( = ?auto_168988 ?auto_168989 ) ) ( not ( = ?auto_168988 ?auto_168990 ) ) ( not ( = ?auto_168988 ?auto_168991 ) ) ( not ( = ?auto_168988 ?auto_168992 ) ) ( not ( = ?auto_168989 ?auto_168990 ) ) ( not ( = ?auto_168989 ?auto_168991 ) ) ( not ( = ?auto_168989 ?auto_168992 ) ) ( not ( = ?auto_168990 ?auto_168991 ) ) ( not ( = ?auto_168990 ?auto_168992 ) ) ( not ( = ?auto_168991 ?auto_168992 ) ) ( ON ?auto_168990 ?auto_168991 ) ( CLEAR ?auto_168988 ) ( ON ?auto_168989 ?auto_168990 ) ( CLEAR ?auto_168989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_168980 ?auto_168981 ?auto_168982 ?auto_168983 ?auto_168984 ?auto_168985 ?auto_168986 ?auto_168987 ?auto_168988 ?auto_168989 )
      ( MAKE-12PILE ?auto_168980 ?auto_168981 ?auto_168982 ?auto_168983 ?auto_168984 ?auto_168985 ?auto_168986 ?auto_168987 ?auto_168988 ?auto_168989 ?auto_168990 ?auto_168991 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169005 - BLOCK
      ?auto_169006 - BLOCK
      ?auto_169007 - BLOCK
      ?auto_169008 - BLOCK
      ?auto_169009 - BLOCK
      ?auto_169010 - BLOCK
      ?auto_169011 - BLOCK
      ?auto_169012 - BLOCK
      ?auto_169013 - BLOCK
      ?auto_169014 - BLOCK
      ?auto_169015 - BLOCK
      ?auto_169016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169016 ) ( ON-TABLE ?auto_169005 ) ( ON ?auto_169006 ?auto_169005 ) ( ON ?auto_169007 ?auto_169006 ) ( ON ?auto_169008 ?auto_169007 ) ( ON ?auto_169009 ?auto_169008 ) ( ON ?auto_169010 ?auto_169009 ) ( ON ?auto_169011 ?auto_169010 ) ( ON ?auto_169012 ?auto_169011 ) ( ON ?auto_169013 ?auto_169012 ) ( not ( = ?auto_169005 ?auto_169006 ) ) ( not ( = ?auto_169005 ?auto_169007 ) ) ( not ( = ?auto_169005 ?auto_169008 ) ) ( not ( = ?auto_169005 ?auto_169009 ) ) ( not ( = ?auto_169005 ?auto_169010 ) ) ( not ( = ?auto_169005 ?auto_169011 ) ) ( not ( = ?auto_169005 ?auto_169012 ) ) ( not ( = ?auto_169005 ?auto_169013 ) ) ( not ( = ?auto_169005 ?auto_169014 ) ) ( not ( = ?auto_169005 ?auto_169015 ) ) ( not ( = ?auto_169005 ?auto_169016 ) ) ( not ( = ?auto_169006 ?auto_169007 ) ) ( not ( = ?auto_169006 ?auto_169008 ) ) ( not ( = ?auto_169006 ?auto_169009 ) ) ( not ( = ?auto_169006 ?auto_169010 ) ) ( not ( = ?auto_169006 ?auto_169011 ) ) ( not ( = ?auto_169006 ?auto_169012 ) ) ( not ( = ?auto_169006 ?auto_169013 ) ) ( not ( = ?auto_169006 ?auto_169014 ) ) ( not ( = ?auto_169006 ?auto_169015 ) ) ( not ( = ?auto_169006 ?auto_169016 ) ) ( not ( = ?auto_169007 ?auto_169008 ) ) ( not ( = ?auto_169007 ?auto_169009 ) ) ( not ( = ?auto_169007 ?auto_169010 ) ) ( not ( = ?auto_169007 ?auto_169011 ) ) ( not ( = ?auto_169007 ?auto_169012 ) ) ( not ( = ?auto_169007 ?auto_169013 ) ) ( not ( = ?auto_169007 ?auto_169014 ) ) ( not ( = ?auto_169007 ?auto_169015 ) ) ( not ( = ?auto_169007 ?auto_169016 ) ) ( not ( = ?auto_169008 ?auto_169009 ) ) ( not ( = ?auto_169008 ?auto_169010 ) ) ( not ( = ?auto_169008 ?auto_169011 ) ) ( not ( = ?auto_169008 ?auto_169012 ) ) ( not ( = ?auto_169008 ?auto_169013 ) ) ( not ( = ?auto_169008 ?auto_169014 ) ) ( not ( = ?auto_169008 ?auto_169015 ) ) ( not ( = ?auto_169008 ?auto_169016 ) ) ( not ( = ?auto_169009 ?auto_169010 ) ) ( not ( = ?auto_169009 ?auto_169011 ) ) ( not ( = ?auto_169009 ?auto_169012 ) ) ( not ( = ?auto_169009 ?auto_169013 ) ) ( not ( = ?auto_169009 ?auto_169014 ) ) ( not ( = ?auto_169009 ?auto_169015 ) ) ( not ( = ?auto_169009 ?auto_169016 ) ) ( not ( = ?auto_169010 ?auto_169011 ) ) ( not ( = ?auto_169010 ?auto_169012 ) ) ( not ( = ?auto_169010 ?auto_169013 ) ) ( not ( = ?auto_169010 ?auto_169014 ) ) ( not ( = ?auto_169010 ?auto_169015 ) ) ( not ( = ?auto_169010 ?auto_169016 ) ) ( not ( = ?auto_169011 ?auto_169012 ) ) ( not ( = ?auto_169011 ?auto_169013 ) ) ( not ( = ?auto_169011 ?auto_169014 ) ) ( not ( = ?auto_169011 ?auto_169015 ) ) ( not ( = ?auto_169011 ?auto_169016 ) ) ( not ( = ?auto_169012 ?auto_169013 ) ) ( not ( = ?auto_169012 ?auto_169014 ) ) ( not ( = ?auto_169012 ?auto_169015 ) ) ( not ( = ?auto_169012 ?auto_169016 ) ) ( not ( = ?auto_169013 ?auto_169014 ) ) ( not ( = ?auto_169013 ?auto_169015 ) ) ( not ( = ?auto_169013 ?auto_169016 ) ) ( not ( = ?auto_169014 ?auto_169015 ) ) ( not ( = ?auto_169014 ?auto_169016 ) ) ( not ( = ?auto_169015 ?auto_169016 ) ) ( ON ?auto_169015 ?auto_169016 ) ( CLEAR ?auto_169013 ) ( ON ?auto_169014 ?auto_169015 ) ( CLEAR ?auto_169014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_169005 ?auto_169006 ?auto_169007 ?auto_169008 ?auto_169009 ?auto_169010 ?auto_169011 ?auto_169012 ?auto_169013 ?auto_169014 )
      ( MAKE-12PILE ?auto_169005 ?auto_169006 ?auto_169007 ?auto_169008 ?auto_169009 ?auto_169010 ?auto_169011 ?auto_169012 ?auto_169013 ?auto_169014 ?auto_169015 ?auto_169016 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169029 - BLOCK
      ?auto_169030 - BLOCK
      ?auto_169031 - BLOCK
      ?auto_169032 - BLOCK
      ?auto_169033 - BLOCK
      ?auto_169034 - BLOCK
      ?auto_169035 - BLOCK
      ?auto_169036 - BLOCK
      ?auto_169037 - BLOCK
      ?auto_169038 - BLOCK
      ?auto_169039 - BLOCK
      ?auto_169040 - BLOCK
    )
    :vars
    (
      ?auto_169041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169040 ?auto_169041 ) ( ON-TABLE ?auto_169029 ) ( ON ?auto_169030 ?auto_169029 ) ( ON ?auto_169031 ?auto_169030 ) ( ON ?auto_169032 ?auto_169031 ) ( ON ?auto_169033 ?auto_169032 ) ( ON ?auto_169034 ?auto_169033 ) ( ON ?auto_169035 ?auto_169034 ) ( ON ?auto_169036 ?auto_169035 ) ( not ( = ?auto_169029 ?auto_169030 ) ) ( not ( = ?auto_169029 ?auto_169031 ) ) ( not ( = ?auto_169029 ?auto_169032 ) ) ( not ( = ?auto_169029 ?auto_169033 ) ) ( not ( = ?auto_169029 ?auto_169034 ) ) ( not ( = ?auto_169029 ?auto_169035 ) ) ( not ( = ?auto_169029 ?auto_169036 ) ) ( not ( = ?auto_169029 ?auto_169037 ) ) ( not ( = ?auto_169029 ?auto_169038 ) ) ( not ( = ?auto_169029 ?auto_169039 ) ) ( not ( = ?auto_169029 ?auto_169040 ) ) ( not ( = ?auto_169029 ?auto_169041 ) ) ( not ( = ?auto_169030 ?auto_169031 ) ) ( not ( = ?auto_169030 ?auto_169032 ) ) ( not ( = ?auto_169030 ?auto_169033 ) ) ( not ( = ?auto_169030 ?auto_169034 ) ) ( not ( = ?auto_169030 ?auto_169035 ) ) ( not ( = ?auto_169030 ?auto_169036 ) ) ( not ( = ?auto_169030 ?auto_169037 ) ) ( not ( = ?auto_169030 ?auto_169038 ) ) ( not ( = ?auto_169030 ?auto_169039 ) ) ( not ( = ?auto_169030 ?auto_169040 ) ) ( not ( = ?auto_169030 ?auto_169041 ) ) ( not ( = ?auto_169031 ?auto_169032 ) ) ( not ( = ?auto_169031 ?auto_169033 ) ) ( not ( = ?auto_169031 ?auto_169034 ) ) ( not ( = ?auto_169031 ?auto_169035 ) ) ( not ( = ?auto_169031 ?auto_169036 ) ) ( not ( = ?auto_169031 ?auto_169037 ) ) ( not ( = ?auto_169031 ?auto_169038 ) ) ( not ( = ?auto_169031 ?auto_169039 ) ) ( not ( = ?auto_169031 ?auto_169040 ) ) ( not ( = ?auto_169031 ?auto_169041 ) ) ( not ( = ?auto_169032 ?auto_169033 ) ) ( not ( = ?auto_169032 ?auto_169034 ) ) ( not ( = ?auto_169032 ?auto_169035 ) ) ( not ( = ?auto_169032 ?auto_169036 ) ) ( not ( = ?auto_169032 ?auto_169037 ) ) ( not ( = ?auto_169032 ?auto_169038 ) ) ( not ( = ?auto_169032 ?auto_169039 ) ) ( not ( = ?auto_169032 ?auto_169040 ) ) ( not ( = ?auto_169032 ?auto_169041 ) ) ( not ( = ?auto_169033 ?auto_169034 ) ) ( not ( = ?auto_169033 ?auto_169035 ) ) ( not ( = ?auto_169033 ?auto_169036 ) ) ( not ( = ?auto_169033 ?auto_169037 ) ) ( not ( = ?auto_169033 ?auto_169038 ) ) ( not ( = ?auto_169033 ?auto_169039 ) ) ( not ( = ?auto_169033 ?auto_169040 ) ) ( not ( = ?auto_169033 ?auto_169041 ) ) ( not ( = ?auto_169034 ?auto_169035 ) ) ( not ( = ?auto_169034 ?auto_169036 ) ) ( not ( = ?auto_169034 ?auto_169037 ) ) ( not ( = ?auto_169034 ?auto_169038 ) ) ( not ( = ?auto_169034 ?auto_169039 ) ) ( not ( = ?auto_169034 ?auto_169040 ) ) ( not ( = ?auto_169034 ?auto_169041 ) ) ( not ( = ?auto_169035 ?auto_169036 ) ) ( not ( = ?auto_169035 ?auto_169037 ) ) ( not ( = ?auto_169035 ?auto_169038 ) ) ( not ( = ?auto_169035 ?auto_169039 ) ) ( not ( = ?auto_169035 ?auto_169040 ) ) ( not ( = ?auto_169035 ?auto_169041 ) ) ( not ( = ?auto_169036 ?auto_169037 ) ) ( not ( = ?auto_169036 ?auto_169038 ) ) ( not ( = ?auto_169036 ?auto_169039 ) ) ( not ( = ?auto_169036 ?auto_169040 ) ) ( not ( = ?auto_169036 ?auto_169041 ) ) ( not ( = ?auto_169037 ?auto_169038 ) ) ( not ( = ?auto_169037 ?auto_169039 ) ) ( not ( = ?auto_169037 ?auto_169040 ) ) ( not ( = ?auto_169037 ?auto_169041 ) ) ( not ( = ?auto_169038 ?auto_169039 ) ) ( not ( = ?auto_169038 ?auto_169040 ) ) ( not ( = ?auto_169038 ?auto_169041 ) ) ( not ( = ?auto_169039 ?auto_169040 ) ) ( not ( = ?auto_169039 ?auto_169041 ) ) ( not ( = ?auto_169040 ?auto_169041 ) ) ( ON ?auto_169039 ?auto_169040 ) ( ON ?auto_169038 ?auto_169039 ) ( CLEAR ?auto_169036 ) ( ON ?auto_169037 ?auto_169038 ) ( CLEAR ?auto_169037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_169029 ?auto_169030 ?auto_169031 ?auto_169032 ?auto_169033 ?auto_169034 ?auto_169035 ?auto_169036 ?auto_169037 )
      ( MAKE-12PILE ?auto_169029 ?auto_169030 ?auto_169031 ?auto_169032 ?auto_169033 ?auto_169034 ?auto_169035 ?auto_169036 ?auto_169037 ?auto_169038 ?auto_169039 ?auto_169040 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169054 - BLOCK
      ?auto_169055 - BLOCK
      ?auto_169056 - BLOCK
      ?auto_169057 - BLOCK
      ?auto_169058 - BLOCK
      ?auto_169059 - BLOCK
      ?auto_169060 - BLOCK
      ?auto_169061 - BLOCK
      ?auto_169062 - BLOCK
      ?auto_169063 - BLOCK
      ?auto_169064 - BLOCK
      ?auto_169065 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169065 ) ( ON-TABLE ?auto_169054 ) ( ON ?auto_169055 ?auto_169054 ) ( ON ?auto_169056 ?auto_169055 ) ( ON ?auto_169057 ?auto_169056 ) ( ON ?auto_169058 ?auto_169057 ) ( ON ?auto_169059 ?auto_169058 ) ( ON ?auto_169060 ?auto_169059 ) ( ON ?auto_169061 ?auto_169060 ) ( not ( = ?auto_169054 ?auto_169055 ) ) ( not ( = ?auto_169054 ?auto_169056 ) ) ( not ( = ?auto_169054 ?auto_169057 ) ) ( not ( = ?auto_169054 ?auto_169058 ) ) ( not ( = ?auto_169054 ?auto_169059 ) ) ( not ( = ?auto_169054 ?auto_169060 ) ) ( not ( = ?auto_169054 ?auto_169061 ) ) ( not ( = ?auto_169054 ?auto_169062 ) ) ( not ( = ?auto_169054 ?auto_169063 ) ) ( not ( = ?auto_169054 ?auto_169064 ) ) ( not ( = ?auto_169054 ?auto_169065 ) ) ( not ( = ?auto_169055 ?auto_169056 ) ) ( not ( = ?auto_169055 ?auto_169057 ) ) ( not ( = ?auto_169055 ?auto_169058 ) ) ( not ( = ?auto_169055 ?auto_169059 ) ) ( not ( = ?auto_169055 ?auto_169060 ) ) ( not ( = ?auto_169055 ?auto_169061 ) ) ( not ( = ?auto_169055 ?auto_169062 ) ) ( not ( = ?auto_169055 ?auto_169063 ) ) ( not ( = ?auto_169055 ?auto_169064 ) ) ( not ( = ?auto_169055 ?auto_169065 ) ) ( not ( = ?auto_169056 ?auto_169057 ) ) ( not ( = ?auto_169056 ?auto_169058 ) ) ( not ( = ?auto_169056 ?auto_169059 ) ) ( not ( = ?auto_169056 ?auto_169060 ) ) ( not ( = ?auto_169056 ?auto_169061 ) ) ( not ( = ?auto_169056 ?auto_169062 ) ) ( not ( = ?auto_169056 ?auto_169063 ) ) ( not ( = ?auto_169056 ?auto_169064 ) ) ( not ( = ?auto_169056 ?auto_169065 ) ) ( not ( = ?auto_169057 ?auto_169058 ) ) ( not ( = ?auto_169057 ?auto_169059 ) ) ( not ( = ?auto_169057 ?auto_169060 ) ) ( not ( = ?auto_169057 ?auto_169061 ) ) ( not ( = ?auto_169057 ?auto_169062 ) ) ( not ( = ?auto_169057 ?auto_169063 ) ) ( not ( = ?auto_169057 ?auto_169064 ) ) ( not ( = ?auto_169057 ?auto_169065 ) ) ( not ( = ?auto_169058 ?auto_169059 ) ) ( not ( = ?auto_169058 ?auto_169060 ) ) ( not ( = ?auto_169058 ?auto_169061 ) ) ( not ( = ?auto_169058 ?auto_169062 ) ) ( not ( = ?auto_169058 ?auto_169063 ) ) ( not ( = ?auto_169058 ?auto_169064 ) ) ( not ( = ?auto_169058 ?auto_169065 ) ) ( not ( = ?auto_169059 ?auto_169060 ) ) ( not ( = ?auto_169059 ?auto_169061 ) ) ( not ( = ?auto_169059 ?auto_169062 ) ) ( not ( = ?auto_169059 ?auto_169063 ) ) ( not ( = ?auto_169059 ?auto_169064 ) ) ( not ( = ?auto_169059 ?auto_169065 ) ) ( not ( = ?auto_169060 ?auto_169061 ) ) ( not ( = ?auto_169060 ?auto_169062 ) ) ( not ( = ?auto_169060 ?auto_169063 ) ) ( not ( = ?auto_169060 ?auto_169064 ) ) ( not ( = ?auto_169060 ?auto_169065 ) ) ( not ( = ?auto_169061 ?auto_169062 ) ) ( not ( = ?auto_169061 ?auto_169063 ) ) ( not ( = ?auto_169061 ?auto_169064 ) ) ( not ( = ?auto_169061 ?auto_169065 ) ) ( not ( = ?auto_169062 ?auto_169063 ) ) ( not ( = ?auto_169062 ?auto_169064 ) ) ( not ( = ?auto_169062 ?auto_169065 ) ) ( not ( = ?auto_169063 ?auto_169064 ) ) ( not ( = ?auto_169063 ?auto_169065 ) ) ( not ( = ?auto_169064 ?auto_169065 ) ) ( ON ?auto_169064 ?auto_169065 ) ( ON ?auto_169063 ?auto_169064 ) ( CLEAR ?auto_169061 ) ( ON ?auto_169062 ?auto_169063 ) ( CLEAR ?auto_169062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_169054 ?auto_169055 ?auto_169056 ?auto_169057 ?auto_169058 ?auto_169059 ?auto_169060 ?auto_169061 ?auto_169062 )
      ( MAKE-12PILE ?auto_169054 ?auto_169055 ?auto_169056 ?auto_169057 ?auto_169058 ?auto_169059 ?auto_169060 ?auto_169061 ?auto_169062 ?auto_169063 ?auto_169064 ?auto_169065 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169078 - BLOCK
      ?auto_169079 - BLOCK
      ?auto_169080 - BLOCK
      ?auto_169081 - BLOCK
      ?auto_169082 - BLOCK
      ?auto_169083 - BLOCK
      ?auto_169084 - BLOCK
      ?auto_169085 - BLOCK
      ?auto_169086 - BLOCK
      ?auto_169087 - BLOCK
      ?auto_169088 - BLOCK
      ?auto_169089 - BLOCK
    )
    :vars
    (
      ?auto_169090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169089 ?auto_169090 ) ( ON-TABLE ?auto_169078 ) ( ON ?auto_169079 ?auto_169078 ) ( ON ?auto_169080 ?auto_169079 ) ( ON ?auto_169081 ?auto_169080 ) ( ON ?auto_169082 ?auto_169081 ) ( ON ?auto_169083 ?auto_169082 ) ( ON ?auto_169084 ?auto_169083 ) ( not ( = ?auto_169078 ?auto_169079 ) ) ( not ( = ?auto_169078 ?auto_169080 ) ) ( not ( = ?auto_169078 ?auto_169081 ) ) ( not ( = ?auto_169078 ?auto_169082 ) ) ( not ( = ?auto_169078 ?auto_169083 ) ) ( not ( = ?auto_169078 ?auto_169084 ) ) ( not ( = ?auto_169078 ?auto_169085 ) ) ( not ( = ?auto_169078 ?auto_169086 ) ) ( not ( = ?auto_169078 ?auto_169087 ) ) ( not ( = ?auto_169078 ?auto_169088 ) ) ( not ( = ?auto_169078 ?auto_169089 ) ) ( not ( = ?auto_169078 ?auto_169090 ) ) ( not ( = ?auto_169079 ?auto_169080 ) ) ( not ( = ?auto_169079 ?auto_169081 ) ) ( not ( = ?auto_169079 ?auto_169082 ) ) ( not ( = ?auto_169079 ?auto_169083 ) ) ( not ( = ?auto_169079 ?auto_169084 ) ) ( not ( = ?auto_169079 ?auto_169085 ) ) ( not ( = ?auto_169079 ?auto_169086 ) ) ( not ( = ?auto_169079 ?auto_169087 ) ) ( not ( = ?auto_169079 ?auto_169088 ) ) ( not ( = ?auto_169079 ?auto_169089 ) ) ( not ( = ?auto_169079 ?auto_169090 ) ) ( not ( = ?auto_169080 ?auto_169081 ) ) ( not ( = ?auto_169080 ?auto_169082 ) ) ( not ( = ?auto_169080 ?auto_169083 ) ) ( not ( = ?auto_169080 ?auto_169084 ) ) ( not ( = ?auto_169080 ?auto_169085 ) ) ( not ( = ?auto_169080 ?auto_169086 ) ) ( not ( = ?auto_169080 ?auto_169087 ) ) ( not ( = ?auto_169080 ?auto_169088 ) ) ( not ( = ?auto_169080 ?auto_169089 ) ) ( not ( = ?auto_169080 ?auto_169090 ) ) ( not ( = ?auto_169081 ?auto_169082 ) ) ( not ( = ?auto_169081 ?auto_169083 ) ) ( not ( = ?auto_169081 ?auto_169084 ) ) ( not ( = ?auto_169081 ?auto_169085 ) ) ( not ( = ?auto_169081 ?auto_169086 ) ) ( not ( = ?auto_169081 ?auto_169087 ) ) ( not ( = ?auto_169081 ?auto_169088 ) ) ( not ( = ?auto_169081 ?auto_169089 ) ) ( not ( = ?auto_169081 ?auto_169090 ) ) ( not ( = ?auto_169082 ?auto_169083 ) ) ( not ( = ?auto_169082 ?auto_169084 ) ) ( not ( = ?auto_169082 ?auto_169085 ) ) ( not ( = ?auto_169082 ?auto_169086 ) ) ( not ( = ?auto_169082 ?auto_169087 ) ) ( not ( = ?auto_169082 ?auto_169088 ) ) ( not ( = ?auto_169082 ?auto_169089 ) ) ( not ( = ?auto_169082 ?auto_169090 ) ) ( not ( = ?auto_169083 ?auto_169084 ) ) ( not ( = ?auto_169083 ?auto_169085 ) ) ( not ( = ?auto_169083 ?auto_169086 ) ) ( not ( = ?auto_169083 ?auto_169087 ) ) ( not ( = ?auto_169083 ?auto_169088 ) ) ( not ( = ?auto_169083 ?auto_169089 ) ) ( not ( = ?auto_169083 ?auto_169090 ) ) ( not ( = ?auto_169084 ?auto_169085 ) ) ( not ( = ?auto_169084 ?auto_169086 ) ) ( not ( = ?auto_169084 ?auto_169087 ) ) ( not ( = ?auto_169084 ?auto_169088 ) ) ( not ( = ?auto_169084 ?auto_169089 ) ) ( not ( = ?auto_169084 ?auto_169090 ) ) ( not ( = ?auto_169085 ?auto_169086 ) ) ( not ( = ?auto_169085 ?auto_169087 ) ) ( not ( = ?auto_169085 ?auto_169088 ) ) ( not ( = ?auto_169085 ?auto_169089 ) ) ( not ( = ?auto_169085 ?auto_169090 ) ) ( not ( = ?auto_169086 ?auto_169087 ) ) ( not ( = ?auto_169086 ?auto_169088 ) ) ( not ( = ?auto_169086 ?auto_169089 ) ) ( not ( = ?auto_169086 ?auto_169090 ) ) ( not ( = ?auto_169087 ?auto_169088 ) ) ( not ( = ?auto_169087 ?auto_169089 ) ) ( not ( = ?auto_169087 ?auto_169090 ) ) ( not ( = ?auto_169088 ?auto_169089 ) ) ( not ( = ?auto_169088 ?auto_169090 ) ) ( not ( = ?auto_169089 ?auto_169090 ) ) ( ON ?auto_169088 ?auto_169089 ) ( ON ?auto_169087 ?auto_169088 ) ( ON ?auto_169086 ?auto_169087 ) ( CLEAR ?auto_169084 ) ( ON ?auto_169085 ?auto_169086 ) ( CLEAR ?auto_169085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169078 ?auto_169079 ?auto_169080 ?auto_169081 ?auto_169082 ?auto_169083 ?auto_169084 ?auto_169085 )
      ( MAKE-12PILE ?auto_169078 ?auto_169079 ?auto_169080 ?auto_169081 ?auto_169082 ?auto_169083 ?auto_169084 ?auto_169085 ?auto_169086 ?auto_169087 ?auto_169088 ?auto_169089 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169103 - BLOCK
      ?auto_169104 - BLOCK
      ?auto_169105 - BLOCK
      ?auto_169106 - BLOCK
      ?auto_169107 - BLOCK
      ?auto_169108 - BLOCK
      ?auto_169109 - BLOCK
      ?auto_169110 - BLOCK
      ?auto_169111 - BLOCK
      ?auto_169112 - BLOCK
      ?auto_169113 - BLOCK
      ?auto_169114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169114 ) ( ON-TABLE ?auto_169103 ) ( ON ?auto_169104 ?auto_169103 ) ( ON ?auto_169105 ?auto_169104 ) ( ON ?auto_169106 ?auto_169105 ) ( ON ?auto_169107 ?auto_169106 ) ( ON ?auto_169108 ?auto_169107 ) ( ON ?auto_169109 ?auto_169108 ) ( not ( = ?auto_169103 ?auto_169104 ) ) ( not ( = ?auto_169103 ?auto_169105 ) ) ( not ( = ?auto_169103 ?auto_169106 ) ) ( not ( = ?auto_169103 ?auto_169107 ) ) ( not ( = ?auto_169103 ?auto_169108 ) ) ( not ( = ?auto_169103 ?auto_169109 ) ) ( not ( = ?auto_169103 ?auto_169110 ) ) ( not ( = ?auto_169103 ?auto_169111 ) ) ( not ( = ?auto_169103 ?auto_169112 ) ) ( not ( = ?auto_169103 ?auto_169113 ) ) ( not ( = ?auto_169103 ?auto_169114 ) ) ( not ( = ?auto_169104 ?auto_169105 ) ) ( not ( = ?auto_169104 ?auto_169106 ) ) ( not ( = ?auto_169104 ?auto_169107 ) ) ( not ( = ?auto_169104 ?auto_169108 ) ) ( not ( = ?auto_169104 ?auto_169109 ) ) ( not ( = ?auto_169104 ?auto_169110 ) ) ( not ( = ?auto_169104 ?auto_169111 ) ) ( not ( = ?auto_169104 ?auto_169112 ) ) ( not ( = ?auto_169104 ?auto_169113 ) ) ( not ( = ?auto_169104 ?auto_169114 ) ) ( not ( = ?auto_169105 ?auto_169106 ) ) ( not ( = ?auto_169105 ?auto_169107 ) ) ( not ( = ?auto_169105 ?auto_169108 ) ) ( not ( = ?auto_169105 ?auto_169109 ) ) ( not ( = ?auto_169105 ?auto_169110 ) ) ( not ( = ?auto_169105 ?auto_169111 ) ) ( not ( = ?auto_169105 ?auto_169112 ) ) ( not ( = ?auto_169105 ?auto_169113 ) ) ( not ( = ?auto_169105 ?auto_169114 ) ) ( not ( = ?auto_169106 ?auto_169107 ) ) ( not ( = ?auto_169106 ?auto_169108 ) ) ( not ( = ?auto_169106 ?auto_169109 ) ) ( not ( = ?auto_169106 ?auto_169110 ) ) ( not ( = ?auto_169106 ?auto_169111 ) ) ( not ( = ?auto_169106 ?auto_169112 ) ) ( not ( = ?auto_169106 ?auto_169113 ) ) ( not ( = ?auto_169106 ?auto_169114 ) ) ( not ( = ?auto_169107 ?auto_169108 ) ) ( not ( = ?auto_169107 ?auto_169109 ) ) ( not ( = ?auto_169107 ?auto_169110 ) ) ( not ( = ?auto_169107 ?auto_169111 ) ) ( not ( = ?auto_169107 ?auto_169112 ) ) ( not ( = ?auto_169107 ?auto_169113 ) ) ( not ( = ?auto_169107 ?auto_169114 ) ) ( not ( = ?auto_169108 ?auto_169109 ) ) ( not ( = ?auto_169108 ?auto_169110 ) ) ( not ( = ?auto_169108 ?auto_169111 ) ) ( not ( = ?auto_169108 ?auto_169112 ) ) ( not ( = ?auto_169108 ?auto_169113 ) ) ( not ( = ?auto_169108 ?auto_169114 ) ) ( not ( = ?auto_169109 ?auto_169110 ) ) ( not ( = ?auto_169109 ?auto_169111 ) ) ( not ( = ?auto_169109 ?auto_169112 ) ) ( not ( = ?auto_169109 ?auto_169113 ) ) ( not ( = ?auto_169109 ?auto_169114 ) ) ( not ( = ?auto_169110 ?auto_169111 ) ) ( not ( = ?auto_169110 ?auto_169112 ) ) ( not ( = ?auto_169110 ?auto_169113 ) ) ( not ( = ?auto_169110 ?auto_169114 ) ) ( not ( = ?auto_169111 ?auto_169112 ) ) ( not ( = ?auto_169111 ?auto_169113 ) ) ( not ( = ?auto_169111 ?auto_169114 ) ) ( not ( = ?auto_169112 ?auto_169113 ) ) ( not ( = ?auto_169112 ?auto_169114 ) ) ( not ( = ?auto_169113 ?auto_169114 ) ) ( ON ?auto_169113 ?auto_169114 ) ( ON ?auto_169112 ?auto_169113 ) ( ON ?auto_169111 ?auto_169112 ) ( CLEAR ?auto_169109 ) ( ON ?auto_169110 ?auto_169111 ) ( CLEAR ?auto_169110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169103 ?auto_169104 ?auto_169105 ?auto_169106 ?auto_169107 ?auto_169108 ?auto_169109 ?auto_169110 )
      ( MAKE-12PILE ?auto_169103 ?auto_169104 ?auto_169105 ?auto_169106 ?auto_169107 ?auto_169108 ?auto_169109 ?auto_169110 ?auto_169111 ?auto_169112 ?auto_169113 ?auto_169114 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169127 - BLOCK
      ?auto_169128 - BLOCK
      ?auto_169129 - BLOCK
      ?auto_169130 - BLOCK
      ?auto_169131 - BLOCK
      ?auto_169132 - BLOCK
      ?auto_169133 - BLOCK
      ?auto_169134 - BLOCK
      ?auto_169135 - BLOCK
      ?auto_169136 - BLOCK
      ?auto_169137 - BLOCK
      ?auto_169138 - BLOCK
    )
    :vars
    (
      ?auto_169139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169138 ?auto_169139 ) ( ON-TABLE ?auto_169127 ) ( ON ?auto_169128 ?auto_169127 ) ( ON ?auto_169129 ?auto_169128 ) ( ON ?auto_169130 ?auto_169129 ) ( ON ?auto_169131 ?auto_169130 ) ( ON ?auto_169132 ?auto_169131 ) ( not ( = ?auto_169127 ?auto_169128 ) ) ( not ( = ?auto_169127 ?auto_169129 ) ) ( not ( = ?auto_169127 ?auto_169130 ) ) ( not ( = ?auto_169127 ?auto_169131 ) ) ( not ( = ?auto_169127 ?auto_169132 ) ) ( not ( = ?auto_169127 ?auto_169133 ) ) ( not ( = ?auto_169127 ?auto_169134 ) ) ( not ( = ?auto_169127 ?auto_169135 ) ) ( not ( = ?auto_169127 ?auto_169136 ) ) ( not ( = ?auto_169127 ?auto_169137 ) ) ( not ( = ?auto_169127 ?auto_169138 ) ) ( not ( = ?auto_169127 ?auto_169139 ) ) ( not ( = ?auto_169128 ?auto_169129 ) ) ( not ( = ?auto_169128 ?auto_169130 ) ) ( not ( = ?auto_169128 ?auto_169131 ) ) ( not ( = ?auto_169128 ?auto_169132 ) ) ( not ( = ?auto_169128 ?auto_169133 ) ) ( not ( = ?auto_169128 ?auto_169134 ) ) ( not ( = ?auto_169128 ?auto_169135 ) ) ( not ( = ?auto_169128 ?auto_169136 ) ) ( not ( = ?auto_169128 ?auto_169137 ) ) ( not ( = ?auto_169128 ?auto_169138 ) ) ( not ( = ?auto_169128 ?auto_169139 ) ) ( not ( = ?auto_169129 ?auto_169130 ) ) ( not ( = ?auto_169129 ?auto_169131 ) ) ( not ( = ?auto_169129 ?auto_169132 ) ) ( not ( = ?auto_169129 ?auto_169133 ) ) ( not ( = ?auto_169129 ?auto_169134 ) ) ( not ( = ?auto_169129 ?auto_169135 ) ) ( not ( = ?auto_169129 ?auto_169136 ) ) ( not ( = ?auto_169129 ?auto_169137 ) ) ( not ( = ?auto_169129 ?auto_169138 ) ) ( not ( = ?auto_169129 ?auto_169139 ) ) ( not ( = ?auto_169130 ?auto_169131 ) ) ( not ( = ?auto_169130 ?auto_169132 ) ) ( not ( = ?auto_169130 ?auto_169133 ) ) ( not ( = ?auto_169130 ?auto_169134 ) ) ( not ( = ?auto_169130 ?auto_169135 ) ) ( not ( = ?auto_169130 ?auto_169136 ) ) ( not ( = ?auto_169130 ?auto_169137 ) ) ( not ( = ?auto_169130 ?auto_169138 ) ) ( not ( = ?auto_169130 ?auto_169139 ) ) ( not ( = ?auto_169131 ?auto_169132 ) ) ( not ( = ?auto_169131 ?auto_169133 ) ) ( not ( = ?auto_169131 ?auto_169134 ) ) ( not ( = ?auto_169131 ?auto_169135 ) ) ( not ( = ?auto_169131 ?auto_169136 ) ) ( not ( = ?auto_169131 ?auto_169137 ) ) ( not ( = ?auto_169131 ?auto_169138 ) ) ( not ( = ?auto_169131 ?auto_169139 ) ) ( not ( = ?auto_169132 ?auto_169133 ) ) ( not ( = ?auto_169132 ?auto_169134 ) ) ( not ( = ?auto_169132 ?auto_169135 ) ) ( not ( = ?auto_169132 ?auto_169136 ) ) ( not ( = ?auto_169132 ?auto_169137 ) ) ( not ( = ?auto_169132 ?auto_169138 ) ) ( not ( = ?auto_169132 ?auto_169139 ) ) ( not ( = ?auto_169133 ?auto_169134 ) ) ( not ( = ?auto_169133 ?auto_169135 ) ) ( not ( = ?auto_169133 ?auto_169136 ) ) ( not ( = ?auto_169133 ?auto_169137 ) ) ( not ( = ?auto_169133 ?auto_169138 ) ) ( not ( = ?auto_169133 ?auto_169139 ) ) ( not ( = ?auto_169134 ?auto_169135 ) ) ( not ( = ?auto_169134 ?auto_169136 ) ) ( not ( = ?auto_169134 ?auto_169137 ) ) ( not ( = ?auto_169134 ?auto_169138 ) ) ( not ( = ?auto_169134 ?auto_169139 ) ) ( not ( = ?auto_169135 ?auto_169136 ) ) ( not ( = ?auto_169135 ?auto_169137 ) ) ( not ( = ?auto_169135 ?auto_169138 ) ) ( not ( = ?auto_169135 ?auto_169139 ) ) ( not ( = ?auto_169136 ?auto_169137 ) ) ( not ( = ?auto_169136 ?auto_169138 ) ) ( not ( = ?auto_169136 ?auto_169139 ) ) ( not ( = ?auto_169137 ?auto_169138 ) ) ( not ( = ?auto_169137 ?auto_169139 ) ) ( not ( = ?auto_169138 ?auto_169139 ) ) ( ON ?auto_169137 ?auto_169138 ) ( ON ?auto_169136 ?auto_169137 ) ( ON ?auto_169135 ?auto_169136 ) ( ON ?auto_169134 ?auto_169135 ) ( CLEAR ?auto_169132 ) ( ON ?auto_169133 ?auto_169134 ) ( CLEAR ?auto_169133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169127 ?auto_169128 ?auto_169129 ?auto_169130 ?auto_169131 ?auto_169132 ?auto_169133 )
      ( MAKE-12PILE ?auto_169127 ?auto_169128 ?auto_169129 ?auto_169130 ?auto_169131 ?auto_169132 ?auto_169133 ?auto_169134 ?auto_169135 ?auto_169136 ?auto_169137 ?auto_169138 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169152 - BLOCK
      ?auto_169153 - BLOCK
      ?auto_169154 - BLOCK
      ?auto_169155 - BLOCK
      ?auto_169156 - BLOCK
      ?auto_169157 - BLOCK
      ?auto_169158 - BLOCK
      ?auto_169159 - BLOCK
      ?auto_169160 - BLOCK
      ?auto_169161 - BLOCK
      ?auto_169162 - BLOCK
      ?auto_169163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169163 ) ( ON-TABLE ?auto_169152 ) ( ON ?auto_169153 ?auto_169152 ) ( ON ?auto_169154 ?auto_169153 ) ( ON ?auto_169155 ?auto_169154 ) ( ON ?auto_169156 ?auto_169155 ) ( ON ?auto_169157 ?auto_169156 ) ( not ( = ?auto_169152 ?auto_169153 ) ) ( not ( = ?auto_169152 ?auto_169154 ) ) ( not ( = ?auto_169152 ?auto_169155 ) ) ( not ( = ?auto_169152 ?auto_169156 ) ) ( not ( = ?auto_169152 ?auto_169157 ) ) ( not ( = ?auto_169152 ?auto_169158 ) ) ( not ( = ?auto_169152 ?auto_169159 ) ) ( not ( = ?auto_169152 ?auto_169160 ) ) ( not ( = ?auto_169152 ?auto_169161 ) ) ( not ( = ?auto_169152 ?auto_169162 ) ) ( not ( = ?auto_169152 ?auto_169163 ) ) ( not ( = ?auto_169153 ?auto_169154 ) ) ( not ( = ?auto_169153 ?auto_169155 ) ) ( not ( = ?auto_169153 ?auto_169156 ) ) ( not ( = ?auto_169153 ?auto_169157 ) ) ( not ( = ?auto_169153 ?auto_169158 ) ) ( not ( = ?auto_169153 ?auto_169159 ) ) ( not ( = ?auto_169153 ?auto_169160 ) ) ( not ( = ?auto_169153 ?auto_169161 ) ) ( not ( = ?auto_169153 ?auto_169162 ) ) ( not ( = ?auto_169153 ?auto_169163 ) ) ( not ( = ?auto_169154 ?auto_169155 ) ) ( not ( = ?auto_169154 ?auto_169156 ) ) ( not ( = ?auto_169154 ?auto_169157 ) ) ( not ( = ?auto_169154 ?auto_169158 ) ) ( not ( = ?auto_169154 ?auto_169159 ) ) ( not ( = ?auto_169154 ?auto_169160 ) ) ( not ( = ?auto_169154 ?auto_169161 ) ) ( not ( = ?auto_169154 ?auto_169162 ) ) ( not ( = ?auto_169154 ?auto_169163 ) ) ( not ( = ?auto_169155 ?auto_169156 ) ) ( not ( = ?auto_169155 ?auto_169157 ) ) ( not ( = ?auto_169155 ?auto_169158 ) ) ( not ( = ?auto_169155 ?auto_169159 ) ) ( not ( = ?auto_169155 ?auto_169160 ) ) ( not ( = ?auto_169155 ?auto_169161 ) ) ( not ( = ?auto_169155 ?auto_169162 ) ) ( not ( = ?auto_169155 ?auto_169163 ) ) ( not ( = ?auto_169156 ?auto_169157 ) ) ( not ( = ?auto_169156 ?auto_169158 ) ) ( not ( = ?auto_169156 ?auto_169159 ) ) ( not ( = ?auto_169156 ?auto_169160 ) ) ( not ( = ?auto_169156 ?auto_169161 ) ) ( not ( = ?auto_169156 ?auto_169162 ) ) ( not ( = ?auto_169156 ?auto_169163 ) ) ( not ( = ?auto_169157 ?auto_169158 ) ) ( not ( = ?auto_169157 ?auto_169159 ) ) ( not ( = ?auto_169157 ?auto_169160 ) ) ( not ( = ?auto_169157 ?auto_169161 ) ) ( not ( = ?auto_169157 ?auto_169162 ) ) ( not ( = ?auto_169157 ?auto_169163 ) ) ( not ( = ?auto_169158 ?auto_169159 ) ) ( not ( = ?auto_169158 ?auto_169160 ) ) ( not ( = ?auto_169158 ?auto_169161 ) ) ( not ( = ?auto_169158 ?auto_169162 ) ) ( not ( = ?auto_169158 ?auto_169163 ) ) ( not ( = ?auto_169159 ?auto_169160 ) ) ( not ( = ?auto_169159 ?auto_169161 ) ) ( not ( = ?auto_169159 ?auto_169162 ) ) ( not ( = ?auto_169159 ?auto_169163 ) ) ( not ( = ?auto_169160 ?auto_169161 ) ) ( not ( = ?auto_169160 ?auto_169162 ) ) ( not ( = ?auto_169160 ?auto_169163 ) ) ( not ( = ?auto_169161 ?auto_169162 ) ) ( not ( = ?auto_169161 ?auto_169163 ) ) ( not ( = ?auto_169162 ?auto_169163 ) ) ( ON ?auto_169162 ?auto_169163 ) ( ON ?auto_169161 ?auto_169162 ) ( ON ?auto_169160 ?auto_169161 ) ( ON ?auto_169159 ?auto_169160 ) ( CLEAR ?auto_169157 ) ( ON ?auto_169158 ?auto_169159 ) ( CLEAR ?auto_169158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169152 ?auto_169153 ?auto_169154 ?auto_169155 ?auto_169156 ?auto_169157 ?auto_169158 )
      ( MAKE-12PILE ?auto_169152 ?auto_169153 ?auto_169154 ?auto_169155 ?auto_169156 ?auto_169157 ?auto_169158 ?auto_169159 ?auto_169160 ?auto_169161 ?auto_169162 ?auto_169163 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169176 - BLOCK
      ?auto_169177 - BLOCK
      ?auto_169178 - BLOCK
      ?auto_169179 - BLOCK
      ?auto_169180 - BLOCK
      ?auto_169181 - BLOCK
      ?auto_169182 - BLOCK
      ?auto_169183 - BLOCK
      ?auto_169184 - BLOCK
      ?auto_169185 - BLOCK
      ?auto_169186 - BLOCK
      ?auto_169187 - BLOCK
    )
    :vars
    (
      ?auto_169188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169187 ?auto_169188 ) ( ON-TABLE ?auto_169176 ) ( ON ?auto_169177 ?auto_169176 ) ( ON ?auto_169178 ?auto_169177 ) ( ON ?auto_169179 ?auto_169178 ) ( ON ?auto_169180 ?auto_169179 ) ( not ( = ?auto_169176 ?auto_169177 ) ) ( not ( = ?auto_169176 ?auto_169178 ) ) ( not ( = ?auto_169176 ?auto_169179 ) ) ( not ( = ?auto_169176 ?auto_169180 ) ) ( not ( = ?auto_169176 ?auto_169181 ) ) ( not ( = ?auto_169176 ?auto_169182 ) ) ( not ( = ?auto_169176 ?auto_169183 ) ) ( not ( = ?auto_169176 ?auto_169184 ) ) ( not ( = ?auto_169176 ?auto_169185 ) ) ( not ( = ?auto_169176 ?auto_169186 ) ) ( not ( = ?auto_169176 ?auto_169187 ) ) ( not ( = ?auto_169176 ?auto_169188 ) ) ( not ( = ?auto_169177 ?auto_169178 ) ) ( not ( = ?auto_169177 ?auto_169179 ) ) ( not ( = ?auto_169177 ?auto_169180 ) ) ( not ( = ?auto_169177 ?auto_169181 ) ) ( not ( = ?auto_169177 ?auto_169182 ) ) ( not ( = ?auto_169177 ?auto_169183 ) ) ( not ( = ?auto_169177 ?auto_169184 ) ) ( not ( = ?auto_169177 ?auto_169185 ) ) ( not ( = ?auto_169177 ?auto_169186 ) ) ( not ( = ?auto_169177 ?auto_169187 ) ) ( not ( = ?auto_169177 ?auto_169188 ) ) ( not ( = ?auto_169178 ?auto_169179 ) ) ( not ( = ?auto_169178 ?auto_169180 ) ) ( not ( = ?auto_169178 ?auto_169181 ) ) ( not ( = ?auto_169178 ?auto_169182 ) ) ( not ( = ?auto_169178 ?auto_169183 ) ) ( not ( = ?auto_169178 ?auto_169184 ) ) ( not ( = ?auto_169178 ?auto_169185 ) ) ( not ( = ?auto_169178 ?auto_169186 ) ) ( not ( = ?auto_169178 ?auto_169187 ) ) ( not ( = ?auto_169178 ?auto_169188 ) ) ( not ( = ?auto_169179 ?auto_169180 ) ) ( not ( = ?auto_169179 ?auto_169181 ) ) ( not ( = ?auto_169179 ?auto_169182 ) ) ( not ( = ?auto_169179 ?auto_169183 ) ) ( not ( = ?auto_169179 ?auto_169184 ) ) ( not ( = ?auto_169179 ?auto_169185 ) ) ( not ( = ?auto_169179 ?auto_169186 ) ) ( not ( = ?auto_169179 ?auto_169187 ) ) ( not ( = ?auto_169179 ?auto_169188 ) ) ( not ( = ?auto_169180 ?auto_169181 ) ) ( not ( = ?auto_169180 ?auto_169182 ) ) ( not ( = ?auto_169180 ?auto_169183 ) ) ( not ( = ?auto_169180 ?auto_169184 ) ) ( not ( = ?auto_169180 ?auto_169185 ) ) ( not ( = ?auto_169180 ?auto_169186 ) ) ( not ( = ?auto_169180 ?auto_169187 ) ) ( not ( = ?auto_169180 ?auto_169188 ) ) ( not ( = ?auto_169181 ?auto_169182 ) ) ( not ( = ?auto_169181 ?auto_169183 ) ) ( not ( = ?auto_169181 ?auto_169184 ) ) ( not ( = ?auto_169181 ?auto_169185 ) ) ( not ( = ?auto_169181 ?auto_169186 ) ) ( not ( = ?auto_169181 ?auto_169187 ) ) ( not ( = ?auto_169181 ?auto_169188 ) ) ( not ( = ?auto_169182 ?auto_169183 ) ) ( not ( = ?auto_169182 ?auto_169184 ) ) ( not ( = ?auto_169182 ?auto_169185 ) ) ( not ( = ?auto_169182 ?auto_169186 ) ) ( not ( = ?auto_169182 ?auto_169187 ) ) ( not ( = ?auto_169182 ?auto_169188 ) ) ( not ( = ?auto_169183 ?auto_169184 ) ) ( not ( = ?auto_169183 ?auto_169185 ) ) ( not ( = ?auto_169183 ?auto_169186 ) ) ( not ( = ?auto_169183 ?auto_169187 ) ) ( not ( = ?auto_169183 ?auto_169188 ) ) ( not ( = ?auto_169184 ?auto_169185 ) ) ( not ( = ?auto_169184 ?auto_169186 ) ) ( not ( = ?auto_169184 ?auto_169187 ) ) ( not ( = ?auto_169184 ?auto_169188 ) ) ( not ( = ?auto_169185 ?auto_169186 ) ) ( not ( = ?auto_169185 ?auto_169187 ) ) ( not ( = ?auto_169185 ?auto_169188 ) ) ( not ( = ?auto_169186 ?auto_169187 ) ) ( not ( = ?auto_169186 ?auto_169188 ) ) ( not ( = ?auto_169187 ?auto_169188 ) ) ( ON ?auto_169186 ?auto_169187 ) ( ON ?auto_169185 ?auto_169186 ) ( ON ?auto_169184 ?auto_169185 ) ( ON ?auto_169183 ?auto_169184 ) ( ON ?auto_169182 ?auto_169183 ) ( CLEAR ?auto_169180 ) ( ON ?auto_169181 ?auto_169182 ) ( CLEAR ?auto_169181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169176 ?auto_169177 ?auto_169178 ?auto_169179 ?auto_169180 ?auto_169181 )
      ( MAKE-12PILE ?auto_169176 ?auto_169177 ?auto_169178 ?auto_169179 ?auto_169180 ?auto_169181 ?auto_169182 ?auto_169183 ?auto_169184 ?auto_169185 ?auto_169186 ?auto_169187 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169201 - BLOCK
      ?auto_169202 - BLOCK
      ?auto_169203 - BLOCK
      ?auto_169204 - BLOCK
      ?auto_169205 - BLOCK
      ?auto_169206 - BLOCK
      ?auto_169207 - BLOCK
      ?auto_169208 - BLOCK
      ?auto_169209 - BLOCK
      ?auto_169210 - BLOCK
      ?auto_169211 - BLOCK
      ?auto_169212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169212 ) ( ON-TABLE ?auto_169201 ) ( ON ?auto_169202 ?auto_169201 ) ( ON ?auto_169203 ?auto_169202 ) ( ON ?auto_169204 ?auto_169203 ) ( ON ?auto_169205 ?auto_169204 ) ( not ( = ?auto_169201 ?auto_169202 ) ) ( not ( = ?auto_169201 ?auto_169203 ) ) ( not ( = ?auto_169201 ?auto_169204 ) ) ( not ( = ?auto_169201 ?auto_169205 ) ) ( not ( = ?auto_169201 ?auto_169206 ) ) ( not ( = ?auto_169201 ?auto_169207 ) ) ( not ( = ?auto_169201 ?auto_169208 ) ) ( not ( = ?auto_169201 ?auto_169209 ) ) ( not ( = ?auto_169201 ?auto_169210 ) ) ( not ( = ?auto_169201 ?auto_169211 ) ) ( not ( = ?auto_169201 ?auto_169212 ) ) ( not ( = ?auto_169202 ?auto_169203 ) ) ( not ( = ?auto_169202 ?auto_169204 ) ) ( not ( = ?auto_169202 ?auto_169205 ) ) ( not ( = ?auto_169202 ?auto_169206 ) ) ( not ( = ?auto_169202 ?auto_169207 ) ) ( not ( = ?auto_169202 ?auto_169208 ) ) ( not ( = ?auto_169202 ?auto_169209 ) ) ( not ( = ?auto_169202 ?auto_169210 ) ) ( not ( = ?auto_169202 ?auto_169211 ) ) ( not ( = ?auto_169202 ?auto_169212 ) ) ( not ( = ?auto_169203 ?auto_169204 ) ) ( not ( = ?auto_169203 ?auto_169205 ) ) ( not ( = ?auto_169203 ?auto_169206 ) ) ( not ( = ?auto_169203 ?auto_169207 ) ) ( not ( = ?auto_169203 ?auto_169208 ) ) ( not ( = ?auto_169203 ?auto_169209 ) ) ( not ( = ?auto_169203 ?auto_169210 ) ) ( not ( = ?auto_169203 ?auto_169211 ) ) ( not ( = ?auto_169203 ?auto_169212 ) ) ( not ( = ?auto_169204 ?auto_169205 ) ) ( not ( = ?auto_169204 ?auto_169206 ) ) ( not ( = ?auto_169204 ?auto_169207 ) ) ( not ( = ?auto_169204 ?auto_169208 ) ) ( not ( = ?auto_169204 ?auto_169209 ) ) ( not ( = ?auto_169204 ?auto_169210 ) ) ( not ( = ?auto_169204 ?auto_169211 ) ) ( not ( = ?auto_169204 ?auto_169212 ) ) ( not ( = ?auto_169205 ?auto_169206 ) ) ( not ( = ?auto_169205 ?auto_169207 ) ) ( not ( = ?auto_169205 ?auto_169208 ) ) ( not ( = ?auto_169205 ?auto_169209 ) ) ( not ( = ?auto_169205 ?auto_169210 ) ) ( not ( = ?auto_169205 ?auto_169211 ) ) ( not ( = ?auto_169205 ?auto_169212 ) ) ( not ( = ?auto_169206 ?auto_169207 ) ) ( not ( = ?auto_169206 ?auto_169208 ) ) ( not ( = ?auto_169206 ?auto_169209 ) ) ( not ( = ?auto_169206 ?auto_169210 ) ) ( not ( = ?auto_169206 ?auto_169211 ) ) ( not ( = ?auto_169206 ?auto_169212 ) ) ( not ( = ?auto_169207 ?auto_169208 ) ) ( not ( = ?auto_169207 ?auto_169209 ) ) ( not ( = ?auto_169207 ?auto_169210 ) ) ( not ( = ?auto_169207 ?auto_169211 ) ) ( not ( = ?auto_169207 ?auto_169212 ) ) ( not ( = ?auto_169208 ?auto_169209 ) ) ( not ( = ?auto_169208 ?auto_169210 ) ) ( not ( = ?auto_169208 ?auto_169211 ) ) ( not ( = ?auto_169208 ?auto_169212 ) ) ( not ( = ?auto_169209 ?auto_169210 ) ) ( not ( = ?auto_169209 ?auto_169211 ) ) ( not ( = ?auto_169209 ?auto_169212 ) ) ( not ( = ?auto_169210 ?auto_169211 ) ) ( not ( = ?auto_169210 ?auto_169212 ) ) ( not ( = ?auto_169211 ?auto_169212 ) ) ( ON ?auto_169211 ?auto_169212 ) ( ON ?auto_169210 ?auto_169211 ) ( ON ?auto_169209 ?auto_169210 ) ( ON ?auto_169208 ?auto_169209 ) ( ON ?auto_169207 ?auto_169208 ) ( CLEAR ?auto_169205 ) ( ON ?auto_169206 ?auto_169207 ) ( CLEAR ?auto_169206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169201 ?auto_169202 ?auto_169203 ?auto_169204 ?auto_169205 ?auto_169206 )
      ( MAKE-12PILE ?auto_169201 ?auto_169202 ?auto_169203 ?auto_169204 ?auto_169205 ?auto_169206 ?auto_169207 ?auto_169208 ?auto_169209 ?auto_169210 ?auto_169211 ?auto_169212 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169225 - BLOCK
      ?auto_169226 - BLOCK
      ?auto_169227 - BLOCK
      ?auto_169228 - BLOCK
      ?auto_169229 - BLOCK
      ?auto_169230 - BLOCK
      ?auto_169231 - BLOCK
      ?auto_169232 - BLOCK
      ?auto_169233 - BLOCK
      ?auto_169234 - BLOCK
      ?auto_169235 - BLOCK
      ?auto_169236 - BLOCK
    )
    :vars
    (
      ?auto_169237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169236 ?auto_169237 ) ( ON-TABLE ?auto_169225 ) ( ON ?auto_169226 ?auto_169225 ) ( ON ?auto_169227 ?auto_169226 ) ( ON ?auto_169228 ?auto_169227 ) ( not ( = ?auto_169225 ?auto_169226 ) ) ( not ( = ?auto_169225 ?auto_169227 ) ) ( not ( = ?auto_169225 ?auto_169228 ) ) ( not ( = ?auto_169225 ?auto_169229 ) ) ( not ( = ?auto_169225 ?auto_169230 ) ) ( not ( = ?auto_169225 ?auto_169231 ) ) ( not ( = ?auto_169225 ?auto_169232 ) ) ( not ( = ?auto_169225 ?auto_169233 ) ) ( not ( = ?auto_169225 ?auto_169234 ) ) ( not ( = ?auto_169225 ?auto_169235 ) ) ( not ( = ?auto_169225 ?auto_169236 ) ) ( not ( = ?auto_169225 ?auto_169237 ) ) ( not ( = ?auto_169226 ?auto_169227 ) ) ( not ( = ?auto_169226 ?auto_169228 ) ) ( not ( = ?auto_169226 ?auto_169229 ) ) ( not ( = ?auto_169226 ?auto_169230 ) ) ( not ( = ?auto_169226 ?auto_169231 ) ) ( not ( = ?auto_169226 ?auto_169232 ) ) ( not ( = ?auto_169226 ?auto_169233 ) ) ( not ( = ?auto_169226 ?auto_169234 ) ) ( not ( = ?auto_169226 ?auto_169235 ) ) ( not ( = ?auto_169226 ?auto_169236 ) ) ( not ( = ?auto_169226 ?auto_169237 ) ) ( not ( = ?auto_169227 ?auto_169228 ) ) ( not ( = ?auto_169227 ?auto_169229 ) ) ( not ( = ?auto_169227 ?auto_169230 ) ) ( not ( = ?auto_169227 ?auto_169231 ) ) ( not ( = ?auto_169227 ?auto_169232 ) ) ( not ( = ?auto_169227 ?auto_169233 ) ) ( not ( = ?auto_169227 ?auto_169234 ) ) ( not ( = ?auto_169227 ?auto_169235 ) ) ( not ( = ?auto_169227 ?auto_169236 ) ) ( not ( = ?auto_169227 ?auto_169237 ) ) ( not ( = ?auto_169228 ?auto_169229 ) ) ( not ( = ?auto_169228 ?auto_169230 ) ) ( not ( = ?auto_169228 ?auto_169231 ) ) ( not ( = ?auto_169228 ?auto_169232 ) ) ( not ( = ?auto_169228 ?auto_169233 ) ) ( not ( = ?auto_169228 ?auto_169234 ) ) ( not ( = ?auto_169228 ?auto_169235 ) ) ( not ( = ?auto_169228 ?auto_169236 ) ) ( not ( = ?auto_169228 ?auto_169237 ) ) ( not ( = ?auto_169229 ?auto_169230 ) ) ( not ( = ?auto_169229 ?auto_169231 ) ) ( not ( = ?auto_169229 ?auto_169232 ) ) ( not ( = ?auto_169229 ?auto_169233 ) ) ( not ( = ?auto_169229 ?auto_169234 ) ) ( not ( = ?auto_169229 ?auto_169235 ) ) ( not ( = ?auto_169229 ?auto_169236 ) ) ( not ( = ?auto_169229 ?auto_169237 ) ) ( not ( = ?auto_169230 ?auto_169231 ) ) ( not ( = ?auto_169230 ?auto_169232 ) ) ( not ( = ?auto_169230 ?auto_169233 ) ) ( not ( = ?auto_169230 ?auto_169234 ) ) ( not ( = ?auto_169230 ?auto_169235 ) ) ( not ( = ?auto_169230 ?auto_169236 ) ) ( not ( = ?auto_169230 ?auto_169237 ) ) ( not ( = ?auto_169231 ?auto_169232 ) ) ( not ( = ?auto_169231 ?auto_169233 ) ) ( not ( = ?auto_169231 ?auto_169234 ) ) ( not ( = ?auto_169231 ?auto_169235 ) ) ( not ( = ?auto_169231 ?auto_169236 ) ) ( not ( = ?auto_169231 ?auto_169237 ) ) ( not ( = ?auto_169232 ?auto_169233 ) ) ( not ( = ?auto_169232 ?auto_169234 ) ) ( not ( = ?auto_169232 ?auto_169235 ) ) ( not ( = ?auto_169232 ?auto_169236 ) ) ( not ( = ?auto_169232 ?auto_169237 ) ) ( not ( = ?auto_169233 ?auto_169234 ) ) ( not ( = ?auto_169233 ?auto_169235 ) ) ( not ( = ?auto_169233 ?auto_169236 ) ) ( not ( = ?auto_169233 ?auto_169237 ) ) ( not ( = ?auto_169234 ?auto_169235 ) ) ( not ( = ?auto_169234 ?auto_169236 ) ) ( not ( = ?auto_169234 ?auto_169237 ) ) ( not ( = ?auto_169235 ?auto_169236 ) ) ( not ( = ?auto_169235 ?auto_169237 ) ) ( not ( = ?auto_169236 ?auto_169237 ) ) ( ON ?auto_169235 ?auto_169236 ) ( ON ?auto_169234 ?auto_169235 ) ( ON ?auto_169233 ?auto_169234 ) ( ON ?auto_169232 ?auto_169233 ) ( ON ?auto_169231 ?auto_169232 ) ( ON ?auto_169230 ?auto_169231 ) ( CLEAR ?auto_169228 ) ( ON ?auto_169229 ?auto_169230 ) ( CLEAR ?auto_169229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169225 ?auto_169226 ?auto_169227 ?auto_169228 ?auto_169229 )
      ( MAKE-12PILE ?auto_169225 ?auto_169226 ?auto_169227 ?auto_169228 ?auto_169229 ?auto_169230 ?auto_169231 ?auto_169232 ?auto_169233 ?auto_169234 ?auto_169235 ?auto_169236 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169250 - BLOCK
      ?auto_169251 - BLOCK
      ?auto_169252 - BLOCK
      ?auto_169253 - BLOCK
      ?auto_169254 - BLOCK
      ?auto_169255 - BLOCK
      ?auto_169256 - BLOCK
      ?auto_169257 - BLOCK
      ?auto_169258 - BLOCK
      ?auto_169259 - BLOCK
      ?auto_169260 - BLOCK
      ?auto_169261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169261 ) ( ON-TABLE ?auto_169250 ) ( ON ?auto_169251 ?auto_169250 ) ( ON ?auto_169252 ?auto_169251 ) ( ON ?auto_169253 ?auto_169252 ) ( not ( = ?auto_169250 ?auto_169251 ) ) ( not ( = ?auto_169250 ?auto_169252 ) ) ( not ( = ?auto_169250 ?auto_169253 ) ) ( not ( = ?auto_169250 ?auto_169254 ) ) ( not ( = ?auto_169250 ?auto_169255 ) ) ( not ( = ?auto_169250 ?auto_169256 ) ) ( not ( = ?auto_169250 ?auto_169257 ) ) ( not ( = ?auto_169250 ?auto_169258 ) ) ( not ( = ?auto_169250 ?auto_169259 ) ) ( not ( = ?auto_169250 ?auto_169260 ) ) ( not ( = ?auto_169250 ?auto_169261 ) ) ( not ( = ?auto_169251 ?auto_169252 ) ) ( not ( = ?auto_169251 ?auto_169253 ) ) ( not ( = ?auto_169251 ?auto_169254 ) ) ( not ( = ?auto_169251 ?auto_169255 ) ) ( not ( = ?auto_169251 ?auto_169256 ) ) ( not ( = ?auto_169251 ?auto_169257 ) ) ( not ( = ?auto_169251 ?auto_169258 ) ) ( not ( = ?auto_169251 ?auto_169259 ) ) ( not ( = ?auto_169251 ?auto_169260 ) ) ( not ( = ?auto_169251 ?auto_169261 ) ) ( not ( = ?auto_169252 ?auto_169253 ) ) ( not ( = ?auto_169252 ?auto_169254 ) ) ( not ( = ?auto_169252 ?auto_169255 ) ) ( not ( = ?auto_169252 ?auto_169256 ) ) ( not ( = ?auto_169252 ?auto_169257 ) ) ( not ( = ?auto_169252 ?auto_169258 ) ) ( not ( = ?auto_169252 ?auto_169259 ) ) ( not ( = ?auto_169252 ?auto_169260 ) ) ( not ( = ?auto_169252 ?auto_169261 ) ) ( not ( = ?auto_169253 ?auto_169254 ) ) ( not ( = ?auto_169253 ?auto_169255 ) ) ( not ( = ?auto_169253 ?auto_169256 ) ) ( not ( = ?auto_169253 ?auto_169257 ) ) ( not ( = ?auto_169253 ?auto_169258 ) ) ( not ( = ?auto_169253 ?auto_169259 ) ) ( not ( = ?auto_169253 ?auto_169260 ) ) ( not ( = ?auto_169253 ?auto_169261 ) ) ( not ( = ?auto_169254 ?auto_169255 ) ) ( not ( = ?auto_169254 ?auto_169256 ) ) ( not ( = ?auto_169254 ?auto_169257 ) ) ( not ( = ?auto_169254 ?auto_169258 ) ) ( not ( = ?auto_169254 ?auto_169259 ) ) ( not ( = ?auto_169254 ?auto_169260 ) ) ( not ( = ?auto_169254 ?auto_169261 ) ) ( not ( = ?auto_169255 ?auto_169256 ) ) ( not ( = ?auto_169255 ?auto_169257 ) ) ( not ( = ?auto_169255 ?auto_169258 ) ) ( not ( = ?auto_169255 ?auto_169259 ) ) ( not ( = ?auto_169255 ?auto_169260 ) ) ( not ( = ?auto_169255 ?auto_169261 ) ) ( not ( = ?auto_169256 ?auto_169257 ) ) ( not ( = ?auto_169256 ?auto_169258 ) ) ( not ( = ?auto_169256 ?auto_169259 ) ) ( not ( = ?auto_169256 ?auto_169260 ) ) ( not ( = ?auto_169256 ?auto_169261 ) ) ( not ( = ?auto_169257 ?auto_169258 ) ) ( not ( = ?auto_169257 ?auto_169259 ) ) ( not ( = ?auto_169257 ?auto_169260 ) ) ( not ( = ?auto_169257 ?auto_169261 ) ) ( not ( = ?auto_169258 ?auto_169259 ) ) ( not ( = ?auto_169258 ?auto_169260 ) ) ( not ( = ?auto_169258 ?auto_169261 ) ) ( not ( = ?auto_169259 ?auto_169260 ) ) ( not ( = ?auto_169259 ?auto_169261 ) ) ( not ( = ?auto_169260 ?auto_169261 ) ) ( ON ?auto_169260 ?auto_169261 ) ( ON ?auto_169259 ?auto_169260 ) ( ON ?auto_169258 ?auto_169259 ) ( ON ?auto_169257 ?auto_169258 ) ( ON ?auto_169256 ?auto_169257 ) ( ON ?auto_169255 ?auto_169256 ) ( CLEAR ?auto_169253 ) ( ON ?auto_169254 ?auto_169255 ) ( CLEAR ?auto_169254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169250 ?auto_169251 ?auto_169252 ?auto_169253 ?auto_169254 )
      ( MAKE-12PILE ?auto_169250 ?auto_169251 ?auto_169252 ?auto_169253 ?auto_169254 ?auto_169255 ?auto_169256 ?auto_169257 ?auto_169258 ?auto_169259 ?auto_169260 ?auto_169261 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169274 - BLOCK
      ?auto_169275 - BLOCK
      ?auto_169276 - BLOCK
      ?auto_169277 - BLOCK
      ?auto_169278 - BLOCK
      ?auto_169279 - BLOCK
      ?auto_169280 - BLOCK
      ?auto_169281 - BLOCK
      ?auto_169282 - BLOCK
      ?auto_169283 - BLOCK
      ?auto_169284 - BLOCK
      ?auto_169285 - BLOCK
    )
    :vars
    (
      ?auto_169286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169285 ?auto_169286 ) ( ON-TABLE ?auto_169274 ) ( ON ?auto_169275 ?auto_169274 ) ( ON ?auto_169276 ?auto_169275 ) ( not ( = ?auto_169274 ?auto_169275 ) ) ( not ( = ?auto_169274 ?auto_169276 ) ) ( not ( = ?auto_169274 ?auto_169277 ) ) ( not ( = ?auto_169274 ?auto_169278 ) ) ( not ( = ?auto_169274 ?auto_169279 ) ) ( not ( = ?auto_169274 ?auto_169280 ) ) ( not ( = ?auto_169274 ?auto_169281 ) ) ( not ( = ?auto_169274 ?auto_169282 ) ) ( not ( = ?auto_169274 ?auto_169283 ) ) ( not ( = ?auto_169274 ?auto_169284 ) ) ( not ( = ?auto_169274 ?auto_169285 ) ) ( not ( = ?auto_169274 ?auto_169286 ) ) ( not ( = ?auto_169275 ?auto_169276 ) ) ( not ( = ?auto_169275 ?auto_169277 ) ) ( not ( = ?auto_169275 ?auto_169278 ) ) ( not ( = ?auto_169275 ?auto_169279 ) ) ( not ( = ?auto_169275 ?auto_169280 ) ) ( not ( = ?auto_169275 ?auto_169281 ) ) ( not ( = ?auto_169275 ?auto_169282 ) ) ( not ( = ?auto_169275 ?auto_169283 ) ) ( not ( = ?auto_169275 ?auto_169284 ) ) ( not ( = ?auto_169275 ?auto_169285 ) ) ( not ( = ?auto_169275 ?auto_169286 ) ) ( not ( = ?auto_169276 ?auto_169277 ) ) ( not ( = ?auto_169276 ?auto_169278 ) ) ( not ( = ?auto_169276 ?auto_169279 ) ) ( not ( = ?auto_169276 ?auto_169280 ) ) ( not ( = ?auto_169276 ?auto_169281 ) ) ( not ( = ?auto_169276 ?auto_169282 ) ) ( not ( = ?auto_169276 ?auto_169283 ) ) ( not ( = ?auto_169276 ?auto_169284 ) ) ( not ( = ?auto_169276 ?auto_169285 ) ) ( not ( = ?auto_169276 ?auto_169286 ) ) ( not ( = ?auto_169277 ?auto_169278 ) ) ( not ( = ?auto_169277 ?auto_169279 ) ) ( not ( = ?auto_169277 ?auto_169280 ) ) ( not ( = ?auto_169277 ?auto_169281 ) ) ( not ( = ?auto_169277 ?auto_169282 ) ) ( not ( = ?auto_169277 ?auto_169283 ) ) ( not ( = ?auto_169277 ?auto_169284 ) ) ( not ( = ?auto_169277 ?auto_169285 ) ) ( not ( = ?auto_169277 ?auto_169286 ) ) ( not ( = ?auto_169278 ?auto_169279 ) ) ( not ( = ?auto_169278 ?auto_169280 ) ) ( not ( = ?auto_169278 ?auto_169281 ) ) ( not ( = ?auto_169278 ?auto_169282 ) ) ( not ( = ?auto_169278 ?auto_169283 ) ) ( not ( = ?auto_169278 ?auto_169284 ) ) ( not ( = ?auto_169278 ?auto_169285 ) ) ( not ( = ?auto_169278 ?auto_169286 ) ) ( not ( = ?auto_169279 ?auto_169280 ) ) ( not ( = ?auto_169279 ?auto_169281 ) ) ( not ( = ?auto_169279 ?auto_169282 ) ) ( not ( = ?auto_169279 ?auto_169283 ) ) ( not ( = ?auto_169279 ?auto_169284 ) ) ( not ( = ?auto_169279 ?auto_169285 ) ) ( not ( = ?auto_169279 ?auto_169286 ) ) ( not ( = ?auto_169280 ?auto_169281 ) ) ( not ( = ?auto_169280 ?auto_169282 ) ) ( not ( = ?auto_169280 ?auto_169283 ) ) ( not ( = ?auto_169280 ?auto_169284 ) ) ( not ( = ?auto_169280 ?auto_169285 ) ) ( not ( = ?auto_169280 ?auto_169286 ) ) ( not ( = ?auto_169281 ?auto_169282 ) ) ( not ( = ?auto_169281 ?auto_169283 ) ) ( not ( = ?auto_169281 ?auto_169284 ) ) ( not ( = ?auto_169281 ?auto_169285 ) ) ( not ( = ?auto_169281 ?auto_169286 ) ) ( not ( = ?auto_169282 ?auto_169283 ) ) ( not ( = ?auto_169282 ?auto_169284 ) ) ( not ( = ?auto_169282 ?auto_169285 ) ) ( not ( = ?auto_169282 ?auto_169286 ) ) ( not ( = ?auto_169283 ?auto_169284 ) ) ( not ( = ?auto_169283 ?auto_169285 ) ) ( not ( = ?auto_169283 ?auto_169286 ) ) ( not ( = ?auto_169284 ?auto_169285 ) ) ( not ( = ?auto_169284 ?auto_169286 ) ) ( not ( = ?auto_169285 ?auto_169286 ) ) ( ON ?auto_169284 ?auto_169285 ) ( ON ?auto_169283 ?auto_169284 ) ( ON ?auto_169282 ?auto_169283 ) ( ON ?auto_169281 ?auto_169282 ) ( ON ?auto_169280 ?auto_169281 ) ( ON ?auto_169279 ?auto_169280 ) ( ON ?auto_169278 ?auto_169279 ) ( CLEAR ?auto_169276 ) ( ON ?auto_169277 ?auto_169278 ) ( CLEAR ?auto_169277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169274 ?auto_169275 ?auto_169276 ?auto_169277 )
      ( MAKE-12PILE ?auto_169274 ?auto_169275 ?auto_169276 ?auto_169277 ?auto_169278 ?auto_169279 ?auto_169280 ?auto_169281 ?auto_169282 ?auto_169283 ?auto_169284 ?auto_169285 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169299 - BLOCK
      ?auto_169300 - BLOCK
      ?auto_169301 - BLOCK
      ?auto_169302 - BLOCK
      ?auto_169303 - BLOCK
      ?auto_169304 - BLOCK
      ?auto_169305 - BLOCK
      ?auto_169306 - BLOCK
      ?auto_169307 - BLOCK
      ?auto_169308 - BLOCK
      ?auto_169309 - BLOCK
      ?auto_169310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169310 ) ( ON-TABLE ?auto_169299 ) ( ON ?auto_169300 ?auto_169299 ) ( ON ?auto_169301 ?auto_169300 ) ( not ( = ?auto_169299 ?auto_169300 ) ) ( not ( = ?auto_169299 ?auto_169301 ) ) ( not ( = ?auto_169299 ?auto_169302 ) ) ( not ( = ?auto_169299 ?auto_169303 ) ) ( not ( = ?auto_169299 ?auto_169304 ) ) ( not ( = ?auto_169299 ?auto_169305 ) ) ( not ( = ?auto_169299 ?auto_169306 ) ) ( not ( = ?auto_169299 ?auto_169307 ) ) ( not ( = ?auto_169299 ?auto_169308 ) ) ( not ( = ?auto_169299 ?auto_169309 ) ) ( not ( = ?auto_169299 ?auto_169310 ) ) ( not ( = ?auto_169300 ?auto_169301 ) ) ( not ( = ?auto_169300 ?auto_169302 ) ) ( not ( = ?auto_169300 ?auto_169303 ) ) ( not ( = ?auto_169300 ?auto_169304 ) ) ( not ( = ?auto_169300 ?auto_169305 ) ) ( not ( = ?auto_169300 ?auto_169306 ) ) ( not ( = ?auto_169300 ?auto_169307 ) ) ( not ( = ?auto_169300 ?auto_169308 ) ) ( not ( = ?auto_169300 ?auto_169309 ) ) ( not ( = ?auto_169300 ?auto_169310 ) ) ( not ( = ?auto_169301 ?auto_169302 ) ) ( not ( = ?auto_169301 ?auto_169303 ) ) ( not ( = ?auto_169301 ?auto_169304 ) ) ( not ( = ?auto_169301 ?auto_169305 ) ) ( not ( = ?auto_169301 ?auto_169306 ) ) ( not ( = ?auto_169301 ?auto_169307 ) ) ( not ( = ?auto_169301 ?auto_169308 ) ) ( not ( = ?auto_169301 ?auto_169309 ) ) ( not ( = ?auto_169301 ?auto_169310 ) ) ( not ( = ?auto_169302 ?auto_169303 ) ) ( not ( = ?auto_169302 ?auto_169304 ) ) ( not ( = ?auto_169302 ?auto_169305 ) ) ( not ( = ?auto_169302 ?auto_169306 ) ) ( not ( = ?auto_169302 ?auto_169307 ) ) ( not ( = ?auto_169302 ?auto_169308 ) ) ( not ( = ?auto_169302 ?auto_169309 ) ) ( not ( = ?auto_169302 ?auto_169310 ) ) ( not ( = ?auto_169303 ?auto_169304 ) ) ( not ( = ?auto_169303 ?auto_169305 ) ) ( not ( = ?auto_169303 ?auto_169306 ) ) ( not ( = ?auto_169303 ?auto_169307 ) ) ( not ( = ?auto_169303 ?auto_169308 ) ) ( not ( = ?auto_169303 ?auto_169309 ) ) ( not ( = ?auto_169303 ?auto_169310 ) ) ( not ( = ?auto_169304 ?auto_169305 ) ) ( not ( = ?auto_169304 ?auto_169306 ) ) ( not ( = ?auto_169304 ?auto_169307 ) ) ( not ( = ?auto_169304 ?auto_169308 ) ) ( not ( = ?auto_169304 ?auto_169309 ) ) ( not ( = ?auto_169304 ?auto_169310 ) ) ( not ( = ?auto_169305 ?auto_169306 ) ) ( not ( = ?auto_169305 ?auto_169307 ) ) ( not ( = ?auto_169305 ?auto_169308 ) ) ( not ( = ?auto_169305 ?auto_169309 ) ) ( not ( = ?auto_169305 ?auto_169310 ) ) ( not ( = ?auto_169306 ?auto_169307 ) ) ( not ( = ?auto_169306 ?auto_169308 ) ) ( not ( = ?auto_169306 ?auto_169309 ) ) ( not ( = ?auto_169306 ?auto_169310 ) ) ( not ( = ?auto_169307 ?auto_169308 ) ) ( not ( = ?auto_169307 ?auto_169309 ) ) ( not ( = ?auto_169307 ?auto_169310 ) ) ( not ( = ?auto_169308 ?auto_169309 ) ) ( not ( = ?auto_169308 ?auto_169310 ) ) ( not ( = ?auto_169309 ?auto_169310 ) ) ( ON ?auto_169309 ?auto_169310 ) ( ON ?auto_169308 ?auto_169309 ) ( ON ?auto_169307 ?auto_169308 ) ( ON ?auto_169306 ?auto_169307 ) ( ON ?auto_169305 ?auto_169306 ) ( ON ?auto_169304 ?auto_169305 ) ( ON ?auto_169303 ?auto_169304 ) ( CLEAR ?auto_169301 ) ( ON ?auto_169302 ?auto_169303 ) ( CLEAR ?auto_169302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169299 ?auto_169300 ?auto_169301 ?auto_169302 )
      ( MAKE-12PILE ?auto_169299 ?auto_169300 ?auto_169301 ?auto_169302 ?auto_169303 ?auto_169304 ?auto_169305 ?auto_169306 ?auto_169307 ?auto_169308 ?auto_169309 ?auto_169310 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169323 - BLOCK
      ?auto_169324 - BLOCK
      ?auto_169325 - BLOCK
      ?auto_169326 - BLOCK
      ?auto_169327 - BLOCK
      ?auto_169328 - BLOCK
      ?auto_169329 - BLOCK
      ?auto_169330 - BLOCK
      ?auto_169331 - BLOCK
      ?auto_169332 - BLOCK
      ?auto_169333 - BLOCK
      ?auto_169334 - BLOCK
    )
    :vars
    (
      ?auto_169335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169334 ?auto_169335 ) ( ON-TABLE ?auto_169323 ) ( ON ?auto_169324 ?auto_169323 ) ( not ( = ?auto_169323 ?auto_169324 ) ) ( not ( = ?auto_169323 ?auto_169325 ) ) ( not ( = ?auto_169323 ?auto_169326 ) ) ( not ( = ?auto_169323 ?auto_169327 ) ) ( not ( = ?auto_169323 ?auto_169328 ) ) ( not ( = ?auto_169323 ?auto_169329 ) ) ( not ( = ?auto_169323 ?auto_169330 ) ) ( not ( = ?auto_169323 ?auto_169331 ) ) ( not ( = ?auto_169323 ?auto_169332 ) ) ( not ( = ?auto_169323 ?auto_169333 ) ) ( not ( = ?auto_169323 ?auto_169334 ) ) ( not ( = ?auto_169323 ?auto_169335 ) ) ( not ( = ?auto_169324 ?auto_169325 ) ) ( not ( = ?auto_169324 ?auto_169326 ) ) ( not ( = ?auto_169324 ?auto_169327 ) ) ( not ( = ?auto_169324 ?auto_169328 ) ) ( not ( = ?auto_169324 ?auto_169329 ) ) ( not ( = ?auto_169324 ?auto_169330 ) ) ( not ( = ?auto_169324 ?auto_169331 ) ) ( not ( = ?auto_169324 ?auto_169332 ) ) ( not ( = ?auto_169324 ?auto_169333 ) ) ( not ( = ?auto_169324 ?auto_169334 ) ) ( not ( = ?auto_169324 ?auto_169335 ) ) ( not ( = ?auto_169325 ?auto_169326 ) ) ( not ( = ?auto_169325 ?auto_169327 ) ) ( not ( = ?auto_169325 ?auto_169328 ) ) ( not ( = ?auto_169325 ?auto_169329 ) ) ( not ( = ?auto_169325 ?auto_169330 ) ) ( not ( = ?auto_169325 ?auto_169331 ) ) ( not ( = ?auto_169325 ?auto_169332 ) ) ( not ( = ?auto_169325 ?auto_169333 ) ) ( not ( = ?auto_169325 ?auto_169334 ) ) ( not ( = ?auto_169325 ?auto_169335 ) ) ( not ( = ?auto_169326 ?auto_169327 ) ) ( not ( = ?auto_169326 ?auto_169328 ) ) ( not ( = ?auto_169326 ?auto_169329 ) ) ( not ( = ?auto_169326 ?auto_169330 ) ) ( not ( = ?auto_169326 ?auto_169331 ) ) ( not ( = ?auto_169326 ?auto_169332 ) ) ( not ( = ?auto_169326 ?auto_169333 ) ) ( not ( = ?auto_169326 ?auto_169334 ) ) ( not ( = ?auto_169326 ?auto_169335 ) ) ( not ( = ?auto_169327 ?auto_169328 ) ) ( not ( = ?auto_169327 ?auto_169329 ) ) ( not ( = ?auto_169327 ?auto_169330 ) ) ( not ( = ?auto_169327 ?auto_169331 ) ) ( not ( = ?auto_169327 ?auto_169332 ) ) ( not ( = ?auto_169327 ?auto_169333 ) ) ( not ( = ?auto_169327 ?auto_169334 ) ) ( not ( = ?auto_169327 ?auto_169335 ) ) ( not ( = ?auto_169328 ?auto_169329 ) ) ( not ( = ?auto_169328 ?auto_169330 ) ) ( not ( = ?auto_169328 ?auto_169331 ) ) ( not ( = ?auto_169328 ?auto_169332 ) ) ( not ( = ?auto_169328 ?auto_169333 ) ) ( not ( = ?auto_169328 ?auto_169334 ) ) ( not ( = ?auto_169328 ?auto_169335 ) ) ( not ( = ?auto_169329 ?auto_169330 ) ) ( not ( = ?auto_169329 ?auto_169331 ) ) ( not ( = ?auto_169329 ?auto_169332 ) ) ( not ( = ?auto_169329 ?auto_169333 ) ) ( not ( = ?auto_169329 ?auto_169334 ) ) ( not ( = ?auto_169329 ?auto_169335 ) ) ( not ( = ?auto_169330 ?auto_169331 ) ) ( not ( = ?auto_169330 ?auto_169332 ) ) ( not ( = ?auto_169330 ?auto_169333 ) ) ( not ( = ?auto_169330 ?auto_169334 ) ) ( not ( = ?auto_169330 ?auto_169335 ) ) ( not ( = ?auto_169331 ?auto_169332 ) ) ( not ( = ?auto_169331 ?auto_169333 ) ) ( not ( = ?auto_169331 ?auto_169334 ) ) ( not ( = ?auto_169331 ?auto_169335 ) ) ( not ( = ?auto_169332 ?auto_169333 ) ) ( not ( = ?auto_169332 ?auto_169334 ) ) ( not ( = ?auto_169332 ?auto_169335 ) ) ( not ( = ?auto_169333 ?auto_169334 ) ) ( not ( = ?auto_169333 ?auto_169335 ) ) ( not ( = ?auto_169334 ?auto_169335 ) ) ( ON ?auto_169333 ?auto_169334 ) ( ON ?auto_169332 ?auto_169333 ) ( ON ?auto_169331 ?auto_169332 ) ( ON ?auto_169330 ?auto_169331 ) ( ON ?auto_169329 ?auto_169330 ) ( ON ?auto_169328 ?auto_169329 ) ( ON ?auto_169327 ?auto_169328 ) ( ON ?auto_169326 ?auto_169327 ) ( CLEAR ?auto_169324 ) ( ON ?auto_169325 ?auto_169326 ) ( CLEAR ?auto_169325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169323 ?auto_169324 ?auto_169325 )
      ( MAKE-12PILE ?auto_169323 ?auto_169324 ?auto_169325 ?auto_169326 ?auto_169327 ?auto_169328 ?auto_169329 ?auto_169330 ?auto_169331 ?auto_169332 ?auto_169333 ?auto_169334 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169348 - BLOCK
      ?auto_169349 - BLOCK
      ?auto_169350 - BLOCK
      ?auto_169351 - BLOCK
      ?auto_169352 - BLOCK
      ?auto_169353 - BLOCK
      ?auto_169354 - BLOCK
      ?auto_169355 - BLOCK
      ?auto_169356 - BLOCK
      ?auto_169357 - BLOCK
      ?auto_169358 - BLOCK
      ?auto_169359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169359 ) ( ON-TABLE ?auto_169348 ) ( ON ?auto_169349 ?auto_169348 ) ( not ( = ?auto_169348 ?auto_169349 ) ) ( not ( = ?auto_169348 ?auto_169350 ) ) ( not ( = ?auto_169348 ?auto_169351 ) ) ( not ( = ?auto_169348 ?auto_169352 ) ) ( not ( = ?auto_169348 ?auto_169353 ) ) ( not ( = ?auto_169348 ?auto_169354 ) ) ( not ( = ?auto_169348 ?auto_169355 ) ) ( not ( = ?auto_169348 ?auto_169356 ) ) ( not ( = ?auto_169348 ?auto_169357 ) ) ( not ( = ?auto_169348 ?auto_169358 ) ) ( not ( = ?auto_169348 ?auto_169359 ) ) ( not ( = ?auto_169349 ?auto_169350 ) ) ( not ( = ?auto_169349 ?auto_169351 ) ) ( not ( = ?auto_169349 ?auto_169352 ) ) ( not ( = ?auto_169349 ?auto_169353 ) ) ( not ( = ?auto_169349 ?auto_169354 ) ) ( not ( = ?auto_169349 ?auto_169355 ) ) ( not ( = ?auto_169349 ?auto_169356 ) ) ( not ( = ?auto_169349 ?auto_169357 ) ) ( not ( = ?auto_169349 ?auto_169358 ) ) ( not ( = ?auto_169349 ?auto_169359 ) ) ( not ( = ?auto_169350 ?auto_169351 ) ) ( not ( = ?auto_169350 ?auto_169352 ) ) ( not ( = ?auto_169350 ?auto_169353 ) ) ( not ( = ?auto_169350 ?auto_169354 ) ) ( not ( = ?auto_169350 ?auto_169355 ) ) ( not ( = ?auto_169350 ?auto_169356 ) ) ( not ( = ?auto_169350 ?auto_169357 ) ) ( not ( = ?auto_169350 ?auto_169358 ) ) ( not ( = ?auto_169350 ?auto_169359 ) ) ( not ( = ?auto_169351 ?auto_169352 ) ) ( not ( = ?auto_169351 ?auto_169353 ) ) ( not ( = ?auto_169351 ?auto_169354 ) ) ( not ( = ?auto_169351 ?auto_169355 ) ) ( not ( = ?auto_169351 ?auto_169356 ) ) ( not ( = ?auto_169351 ?auto_169357 ) ) ( not ( = ?auto_169351 ?auto_169358 ) ) ( not ( = ?auto_169351 ?auto_169359 ) ) ( not ( = ?auto_169352 ?auto_169353 ) ) ( not ( = ?auto_169352 ?auto_169354 ) ) ( not ( = ?auto_169352 ?auto_169355 ) ) ( not ( = ?auto_169352 ?auto_169356 ) ) ( not ( = ?auto_169352 ?auto_169357 ) ) ( not ( = ?auto_169352 ?auto_169358 ) ) ( not ( = ?auto_169352 ?auto_169359 ) ) ( not ( = ?auto_169353 ?auto_169354 ) ) ( not ( = ?auto_169353 ?auto_169355 ) ) ( not ( = ?auto_169353 ?auto_169356 ) ) ( not ( = ?auto_169353 ?auto_169357 ) ) ( not ( = ?auto_169353 ?auto_169358 ) ) ( not ( = ?auto_169353 ?auto_169359 ) ) ( not ( = ?auto_169354 ?auto_169355 ) ) ( not ( = ?auto_169354 ?auto_169356 ) ) ( not ( = ?auto_169354 ?auto_169357 ) ) ( not ( = ?auto_169354 ?auto_169358 ) ) ( not ( = ?auto_169354 ?auto_169359 ) ) ( not ( = ?auto_169355 ?auto_169356 ) ) ( not ( = ?auto_169355 ?auto_169357 ) ) ( not ( = ?auto_169355 ?auto_169358 ) ) ( not ( = ?auto_169355 ?auto_169359 ) ) ( not ( = ?auto_169356 ?auto_169357 ) ) ( not ( = ?auto_169356 ?auto_169358 ) ) ( not ( = ?auto_169356 ?auto_169359 ) ) ( not ( = ?auto_169357 ?auto_169358 ) ) ( not ( = ?auto_169357 ?auto_169359 ) ) ( not ( = ?auto_169358 ?auto_169359 ) ) ( ON ?auto_169358 ?auto_169359 ) ( ON ?auto_169357 ?auto_169358 ) ( ON ?auto_169356 ?auto_169357 ) ( ON ?auto_169355 ?auto_169356 ) ( ON ?auto_169354 ?auto_169355 ) ( ON ?auto_169353 ?auto_169354 ) ( ON ?auto_169352 ?auto_169353 ) ( ON ?auto_169351 ?auto_169352 ) ( CLEAR ?auto_169349 ) ( ON ?auto_169350 ?auto_169351 ) ( CLEAR ?auto_169350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169348 ?auto_169349 ?auto_169350 )
      ( MAKE-12PILE ?auto_169348 ?auto_169349 ?auto_169350 ?auto_169351 ?auto_169352 ?auto_169353 ?auto_169354 ?auto_169355 ?auto_169356 ?auto_169357 ?auto_169358 ?auto_169359 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169372 - BLOCK
      ?auto_169373 - BLOCK
      ?auto_169374 - BLOCK
      ?auto_169375 - BLOCK
      ?auto_169376 - BLOCK
      ?auto_169377 - BLOCK
      ?auto_169378 - BLOCK
      ?auto_169379 - BLOCK
      ?auto_169380 - BLOCK
      ?auto_169381 - BLOCK
      ?auto_169382 - BLOCK
      ?auto_169383 - BLOCK
    )
    :vars
    (
      ?auto_169384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169383 ?auto_169384 ) ( ON-TABLE ?auto_169372 ) ( not ( = ?auto_169372 ?auto_169373 ) ) ( not ( = ?auto_169372 ?auto_169374 ) ) ( not ( = ?auto_169372 ?auto_169375 ) ) ( not ( = ?auto_169372 ?auto_169376 ) ) ( not ( = ?auto_169372 ?auto_169377 ) ) ( not ( = ?auto_169372 ?auto_169378 ) ) ( not ( = ?auto_169372 ?auto_169379 ) ) ( not ( = ?auto_169372 ?auto_169380 ) ) ( not ( = ?auto_169372 ?auto_169381 ) ) ( not ( = ?auto_169372 ?auto_169382 ) ) ( not ( = ?auto_169372 ?auto_169383 ) ) ( not ( = ?auto_169372 ?auto_169384 ) ) ( not ( = ?auto_169373 ?auto_169374 ) ) ( not ( = ?auto_169373 ?auto_169375 ) ) ( not ( = ?auto_169373 ?auto_169376 ) ) ( not ( = ?auto_169373 ?auto_169377 ) ) ( not ( = ?auto_169373 ?auto_169378 ) ) ( not ( = ?auto_169373 ?auto_169379 ) ) ( not ( = ?auto_169373 ?auto_169380 ) ) ( not ( = ?auto_169373 ?auto_169381 ) ) ( not ( = ?auto_169373 ?auto_169382 ) ) ( not ( = ?auto_169373 ?auto_169383 ) ) ( not ( = ?auto_169373 ?auto_169384 ) ) ( not ( = ?auto_169374 ?auto_169375 ) ) ( not ( = ?auto_169374 ?auto_169376 ) ) ( not ( = ?auto_169374 ?auto_169377 ) ) ( not ( = ?auto_169374 ?auto_169378 ) ) ( not ( = ?auto_169374 ?auto_169379 ) ) ( not ( = ?auto_169374 ?auto_169380 ) ) ( not ( = ?auto_169374 ?auto_169381 ) ) ( not ( = ?auto_169374 ?auto_169382 ) ) ( not ( = ?auto_169374 ?auto_169383 ) ) ( not ( = ?auto_169374 ?auto_169384 ) ) ( not ( = ?auto_169375 ?auto_169376 ) ) ( not ( = ?auto_169375 ?auto_169377 ) ) ( not ( = ?auto_169375 ?auto_169378 ) ) ( not ( = ?auto_169375 ?auto_169379 ) ) ( not ( = ?auto_169375 ?auto_169380 ) ) ( not ( = ?auto_169375 ?auto_169381 ) ) ( not ( = ?auto_169375 ?auto_169382 ) ) ( not ( = ?auto_169375 ?auto_169383 ) ) ( not ( = ?auto_169375 ?auto_169384 ) ) ( not ( = ?auto_169376 ?auto_169377 ) ) ( not ( = ?auto_169376 ?auto_169378 ) ) ( not ( = ?auto_169376 ?auto_169379 ) ) ( not ( = ?auto_169376 ?auto_169380 ) ) ( not ( = ?auto_169376 ?auto_169381 ) ) ( not ( = ?auto_169376 ?auto_169382 ) ) ( not ( = ?auto_169376 ?auto_169383 ) ) ( not ( = ?auto_169376 ?auto_169384 ) ) ( not ( = ?auto_169377 ?auto_169378 ) ) ( not ( = ?auto_169377 ?auto_169379 ) ) ( not ( = ?auto_169377 ?auto_169380 ) ) ( not ( = ?auto_169377 ?auto_169381 ) ) ( not ( = ?auto_169377 ?auto_169382 ) ) ( not ( = ?auto_169377 ?auto_169383 ) ) ( not ( = ?auto_169377 ?auto_169384 ) ) ( not ( = ?auto_169378 ?auto_169379 ) ) ( not ( = ?auto_169378 ?auto_169380 ) ) ( not ( = ?auto_169378 ?auto_169381 ) ) ( not ( = ?auto_169378 ?auto_169382 ) ) ( not ( = ?auto_169378 ?auto_169383 ) ) ( not ( = ?auto_169378 ?auto_169384 ) ) ( not ( = ?auto_169379 ?auto_169380 ) ) ( not ( = ?auto_169379 ?auto_169381 ) ) ( not ( = ?auto_169379 ?auto_169382 ) ) ( not ( = ?auto_169379 ?auto_169383 ) ) ( not ( = ?auto_169379 ?auto_169384 ) ) ( not ( = ?auto_169380 ?auto_169381 ) ) ( not ( = ?auto_169380 ?auto_169382 ) ) ( not ( = ?auto_169380 ?auto_169383 ) ) ( not ( = ?auto_169380 ?auto_169384 ) ) ( not ( = ?auto_169381 ?auto_169382 ) ) ( not ( = ?auto_169381 ?auto_169383 ) ) ( not ( = ?auto_169381 ?auto_169384 ) ) ( not ( = ?auto_169382 ?auto_169383 ) ) ( not ( = ?auto_169382 ?auto_169384 ) ) ( not ( = ?auto_169383 ?auto_169384 ) ) ( ON ?auto_169382 ?auto_169383 ) ( ON ?auto_169381 ?auto_169382 ) ( ON ?auto_169380 ?auto_169381 ) ( ON ?auto_169379 ?auto_169380 ) ( ON ?auto_169378 ?auto_169379 ) ( ON ?auto_169377 ?auto_169378 ) ( ON ?auto_169376 ?auto_169377 ) ( ON ?auto_169375 ?auto_169376 ) ( ON ?auto_169374 ?auto_169375 ) ( CLEAR ?auto_169372 ) ( ON ?auto_169373 ?auto_169374 ) ( CLEAR ?auto_169373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169372 ?auto_169373 )
      ( MAKE-12PILE ?auto_169372 ?auto_169373 ?auto_169374 ?auto_169375 ?auto_169376 ?auto_169377 ?auto_169378 ?auto_169379 ?auto_169380 ?auto_169381 ?auto_169382 ?auto_169383 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169397 - BLOCK
      ?auto_169398 - BLOCK
      ?auto_169399 - BLOCK
      ?auto_169400 - BLOCK
      ?auto_169401 - BLOCK
      ?auto_169402 - BLOCK
      ?auto_169403 - BLOCK
      ?auto_169404 - BLOCK
      ?auto_169405 - BLOCK
      ?auto_169406 - BLOCK
      ?auto_169407 - BLOCK
      ?auto_169408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169408 ) ( ON-TABLE ?auto_169397 ) ( not ( = ?auto_169397 ?auto_169398 ) ) ( not ( = ?auto_169397 ?auto_169399 ) ) ( not ( = ?auto_169397 ?auto_169400 ) ) ( not ( = ?auto_169397 ?auto_169401 ) ) ( not ( = ?auto_169397 ?auto_169402 ) ) ( not ( = ?auto_169397 ?auto_169403 ) ) ( not ( = ?auto_169397 ?auto_169404 ) ) ( not ( = ?auto_169397 ?auto_169405 ) ) ( not ( = ?auto_169397 ?auto_169406 ) ) ( not ( = ?auto_169397 ?auto_169407 ) ) ( not ( = ?auto_169397 ?auto_169408 ) ) ( not ( = ?auto_169398 ?auto_169399 ) ) ( not ( = ?auto_169398 ?auto_169400 ) ) ( not ( = ?auto_169398 ?auto_169401 ) ) ( not ( = ?auto_169398 ?auto_169402 ) ) ( not ( = ?auto_169398 ?auto_169403 ) ) ( not ( = ?auto_169398 ?auto_169404 ) ) ( not ( = ?auto_169398 ?auto_169405 ) ) ( not ( = ?auto_169398 ?auto_169406 ) ) ( not ( = ?auto_169398 ?auto_169407 ) ) ( not ( = ?auto_169398 ?auto_169408 ) ) ( not ( = ?auto_169399 ?auto_169400 ) ) ( not ( = ?auto_169399 ?auto_169401 ) ) ( not ( = ?auto_169399 ?auto_169402 ) ) ( not ( = ?auto_169399 ?auto_169403 ) ) ( not ( = ?auto_169399 ?auto_169404 ) ) ( not ( = ?auto_169399 ?auto_169405 ) ) ( not ( = ?auto_169399 ?auto_169406 ) ) ( not ( = ?auto_169399 ?auto_169407 ) ) ( not ( = ?auto_169399 ?auto_169408 ) ) ( not ( = ?auto_169400 ?auto_169401 ) ) ( not ( = ?auto_169400 ?auto_169402 ) ) ( not ( = ?auto_169400 ?auto_169403 ) ) ( not ( = ?auto_169400 ?auto_169404 ) ) ( not ( = ?auto_169400 ?auto_169405 ) ) ( not ( = ?auto_169400 ?auto_169406 ) ) ( not ( = ?auto_169400 ?auto_169407 ) ) ( not ( = ?auto_169400 ?auto_169408 ) ) ( not ( = ?auto_169401 ?auto_169402 ) ) ( not ( = ?auto_169401 ?auto_169403 ) ) ( not ( = ?auto_169401 ?auto_169404 ) ) ( not ( = ?auto_169401 ?auto_169405 ) ) ( not ( = ?auto_169401 ?auto_169406 ) ) ( not ( = ?auto_169401 ?auto_169407 ) ) ( not ( = ?auto_169401 ?auto_169408 ) ) ( not ( = ?auto_169402 ?auto_169403 ) ) ( not ( = ?auto_169402 ?auto_169404 ) ) ( not ( = ?auto_169402 ?auto_169405 ) ) ( not ( = ?auto_169402 ?auto_169406 ) ) ( not ( = ?auto_169402 ?auto_169407 ) ) ( not ( = ?auto_169402 ?auto_169408 ) ) ( not ( = ?auto_169403 ?auto_169404 ) ) ( not ( = ?auto_169403 ?auto_169405 ) ) ( not ( = ?auto_169403 ?auto_169406 ) ) ( not ( = ?auto_169403 ?auto_169407 ) ) ( not ( = ?auto_169403 ?auto_169408 ) ) ( not ( = ?auto_169404 ?auto_169405 ) ) ( not ( = ?auto_169404 ?auto_169406 ) ) ( not ( = ?auto_169404 ?auto_169407 ) ) ( not ( = ?auto_169404 ?auto_169408 ) ) ( not ( = ?auto_169405 ?auto_169406 ) ) ( not ( = ?auto_169405 ?auto_169407 ) ) ( not ( = ?auto_169405 ?auto_169408 ) ) ( not ( = ?auto_169406 ?auto_169407 ) ) ( not ( = ?auto_169406 ?auto_169408 ) ) ( not ( = ?auto_169407 ?auto_169408 ) ) ( ON ?auto_169407 ?auto_169408 ) ( ON ?auto_169406 ?auto_169407 ) ( ON ?auto_169405 ?auto_169406 ) ( ON ?auto_169404 ?auto_169405 ) ( ON ?auto_169403 ?auto_169404 ) ( ON ?auto_169402 ?auto_169403 ) ( ON ?auto_169401 ?auto_169402 ) ( ON ?auto_169400 ?auto_169401 ) ( ON ?auto_169399 ?auto_169400 ) ( CLEAR ?auto_169397 ) ( ON ?auto_169398 ?auto_169399 ) ( CLEAR ?auto_169398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169397 ?auto_169398 )
      ( MAKE-12PILE ?auto_169397 ?auto_169398 ?auto_169399 ?auto_169400 ?auto_169401 ?auto_169402 ?auto_169403 ?auto_169404 ?auto_169405 ?auto_169406 ?auto_169407 ?auto_169408 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169421 - BLOCK
      ?auto_169422 - BLOCK
      ?auto_169423 - BLOCK
      ?auto_169424 - BLOCK
      ?auto_169425 - BLOCK
      ?auto_169426 - BLOCK
      ?auto_169427 - BLOCK
      ?auto_169428 - BLOCK
      ?auto_169429 - BLOCK
      ?auto_169430 - BLOCK
      ?auto_169431 - BLOCK
      ?auto_169432 - BLOCK
    )
    :vars
    (
      ?auto_169433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169432 ?auto_169433 ) ( not ( = ?auto_169421 ?auto_169422 ) ) ( not ( = ?auto_169421 ?auto_169423 ) ) ( not ( = ?auto_169421 ?auto_169424 ) ) ( not ( = ?auto_169421 ?auto_169425 ) ) ( not ( = ?auto_169421 ?auto_169426 ) ) ( not ( = ?auto_169421 ?auto_169427 ) ) ( not ( = ?auto_169421 ?auto_169428 ) ) ( not ( = ?auto_169421 ?auto_169429 ) ) ( not ( = ?auto_169421 ?auto_169430 ) ) ( not ( = ?auto_169421 ?auto_169431 ) ) ( not ( = ?auto_169421 ?auto_169432 ) ) ( not ( = ?auto_169421 ?auto_169433 ) ) ( not ( = ?auto_169422 ?auto_169423 ) ) ( not ( = ?auto_169422 ?auto_169424 ) ) ( not ( = ?auto_169422 ?auto_169425 ) ) ( not ( = ?auto_169422 ?auto_169426 ) ) ( not ( = ?auto_169422 ?auto_169427 ) ) ( not ( = ?auto_169422 ?auto_169428 ) ) ( not ( = ?auto_169422 ?auto_169429 ) ) ( not ( = ?auto_169422 ?auto_169430 ) ) ( not ( = ?auto_169422 ?auto_169431 ) ) ( not ( = ?auto_169422 ?auto_169432 ) ) ( not ( = ?auto_169422 ?auto_169433 ) ) ( not ( = ?auto_169423 ?auto_169424 ) ) ( not ( = ?auto_169423 ?auto_169425 ) ) ( not ( = ?auto_169423 ?auto_169426 ) ) ( not ( = ?auto_169423 ?auto_169427 ) ) ( not ( = ?auto_169423 ?auto_169428 ) ) ( not ( = ?auto_169423 ?auto_169429 ) ) ( not ( = ?auto_169423 ?auto_169430 ) ) ( not ( = ?auto_169423 ?auto_169431 ) ) ( not ( = ?auto_169423 ?auto_169432 ) ) ( not ( = ?auto_169423 ?auto_169433 ) ) ( not ( = ?auto_169424 ?auto_169425 ) ) ( not ( = ?auto_169424 ?auto_169426 ) ) ( not ( = ?auto_169424 ?auto_169427 ) ) ( not ( = ?auto_169424 ?auto_169428 ) ) ( not ( = ?auto_169424 ?auto_169429 ) ) ( not ( = ?auto_169424 ?auto_169430 ) ) ( not ( = ?auto_169424 ?auto_169431 ) ) ( not ( = ?auto_169424 ?auto_169432 ) ) ( not ( = ?auto_169424 ?auto_169433 ) ) ( not ( = ?auto_169425 ?auto_169426 ) ) ( not ( = ?auto_169425 ?auto_169427 ) ) ( not ( = ?auto_169425 ?auto_169428 ) ) ( not ( = ?auto_169425 ?auto_169429 ) ) ( not ( = ?auto_169425 ?auto_169430 ) ) ( not ( = ?auto_169425 ?auto_169431 ) ) ( not ( = ?auto_169425 ?auto_169432 ) ) ( not ( = ?auto_169425 ?auto_169433 ) ) ( not ( = ?auto_169426 ?auto_169427 ) ) ( not ( = ?auto_169426 ?auto_169428 ) ) ( not ( = ?auto_169426 ?auto_169429 ) ) ( not ( = ?auto_169426 ?auto_169430 ) ) ( not ( = ?auto_169426 ?auto_169431 ) ) ( not ( = ?auto_169426 ?auto_169432 ) ) ( not ( = ?auto_169426 ?auto_169433 ) ) ( not ( = ?auto_169427 ?auto_169428 ) ) ( not ( = ?auto_169427 ?auto_169429 ) ) ( not ( = ?auto_169427 ?auto_169430 ) ) ( not ( = ?auto_169427 ?auto_169431 ) ) ( not ( = ?auto_169427 ?auto_169432 ) ) ( not ( = ?auto_169427 ?auto_169433 ) ) ( not ( = ?auto_169428 ?auto_169429 ) ) ( not ( = ?auto_169428 ?auto_169430 ) ) ( not ( = ?auto_169428 ?auto_169431 ) ) ( not ( = ?auto_169428 ?auto_169432 ) ) ( not ( = ?auto_169428 ?auto_169433 ) ) ( not ( = ?auto_169429 ?auto_169430 ) ) ( not ( = ?auto_169429 ?auto_169431 ) ) ( not ( = ?auto_169429 ?auto_169432 ) ) ( not ( = ?auto_169429 ?auto_169433 ) ) ( not ( = ?auto_169430 ?auto_169431 ) ) ( not ( = ?auto_169430 ?auto_169432 ) ) ( not ( = ?auto_169430 ?auto_169433 ) ) ( not ( = ?auto_169431 ?auto_169432 ) ) ( not ( = ?auto_169431 ?auto_169433 ) ) ( not ( = ?auto_169432 ?auto_169433 ) ) ( ON ?auto_169431 ?auto_169432 ) ( ON ?auto_169430 ?auto_169431 ) ( ON ?auto_169429 ?auto_169430 ) ( ON ?auto_169428 ?auto_169429 ) ( ON ?auto_169427 ?auto_169428 ) ( ON ?auto_169426 ?auto_169427 ) ( ON ?auto_169425 ?auto_169426 ) ( ON ?auto_169424 ?auto_169425 ) ( ON ?auto_169423 ?auto_169424 ) ( ON ?auto_169422 ?auto_169423 ) ( ON ?auto_169421 ?auto_169422 ) ( CLEAR ?auto_169421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169421 )
      ( MAKE-12PILE ?auto_169421 ?auto_169422 ?auto_169423 ?auto_169424 ?auto_169425 ?auto_169426 ?auto_169427 ?auto_169428 ?auto_169429 ?auto_169430 ?auto_169431 ?auto_169432 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169446 - BLOCK
      ?auto_169447 - BLOCK
      ?auto_169448 - BLOCK
      ?auto_169449 - BLOCK
      ?auto_169450 - BLOCK
      ?auto_169451 - BLOCK
      ?auto_169452 - BLOCK
      ?auto_169453 - BLOCK
      ?auto_169454 - BLOCK
      ?auto_169455 - BLOCK
      ?auto_169456 - BLOCK
      ?auto_169457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169457 ) ( not ( = ?auto_169446 ?auto_169447 ) ) ( not ( = ?auto_169446 ?auto_169448 ) ) ( not ( = ?auto_169446 ?auto_169449 ) ) ( not ( = ?auto_169446 ?auto_169450 ) ) ( not ( = ?auto_169446 ?auto_169451 ) ) ( not ( = ?auto_169446 ?auto_169452 ) ) ( not ( = ?auto_169446 ?auto_169453 ) ) ( not ( = ?auto_169446 ?auto_169454 ) ) ( not ( = ?auto_169446 ?auto_169455 ) ) ( not ( = ?auto_169446 ?auto_169456 ) ) ( not ( = ?auto_169446 ?auto_169457 ) ) ( not ( = ?auto_169447 ?auto_169448 ) ) ( not ( = ?auto_169447 ?auto_169449 ) ) ( not ( = ?auto_169447 ?auto_169450 ) ) ( not ( = ?auto_169447 ?auto_169451 ) ) ( not ( = ?auto_169447 ?auto_169452 ) ) ( not ( = ?auto_169447 ?auto_169453 ) ) ( not ( = ?auto_169447 ?auto_169454 ) ) ( not ( = ?auto_169447 ?auto_169455 ) ) ( not ( = ?auto_169447 ?auto_169456 ) ) ( not ( = ?auto_169447 ?auto_169457 ) ) ( not ( = ?auto_169448 ?auto_169449 ) ) ( not ( = ?auto_169448 ?auto_169450 ) ) ( not ( = ?auto_169448 ?auto_169451 ) ) ( not ( = ?auto_169448 ?auto_169452 ) ) ( not ( = ?auto_169448 ?auto_169453 ) ) ( not ( = ?auto_169448 ?auto_169454 ) ) ( not ( = ?auto_169448 ?auto_169455 ) ) ( not ( = ?auto_169448 ?auto_169456 ) ) ( not ( = ?auto_169448 ?auto_169457 ) ) ( not ( = ?auto_169449 ?auto_169450 ) ) ( not ( = ?auto_169449 ?auto_169451 ) ) ( not ( = ?auto_169449 ?auto_169452 ) ) ( not ( = ?auto_169449 ?auto_169453 ) ) ( not ( = ?auto_169449 ?auto_169454 ) ) ( not ( = ?auto_169449 ?auto_169455 ) ) ( not ( = ?auto_169449 ?auto_169456 ) ) ( not ( = ?auto_169449 ?auto_169457 ) ) ( not ( = ?auto_169450 ?auto_169451 ) ) ( not ( = ?auto_169450 ?auto_169452 ) ) ( not ( = ?auto_169450 ?auto_169453 ) ) ( not ( = ?auto_169450 ?auto_169454 ) ) ( not ( = ?auto_169450 ?auto_169455 ) ) ( not ( = ?auto_169450 ?auto_169456 ) ) ( not ( = ?auto_169450 ?auto_169457 ) ) ( not ( = ?auto_169451 ?auto_169452 ) ) ( not ( = ?auto_169451 ?auto_169453 ) ) ( not ( = ?auto_169451 ?auto_169454 ) ) ( not ( = ?auto_169451 ?auto_169455 ) ) ( not ( = ?auto_169451 ?auto_169456 ) ) ( not ( = ?auto_169451 ?auto_169457 ) ) ( not ( = ?auto_169452 ?auto_169453 ) ) ( not ( = ?auto_169452 ?auto_169454 ) ) ( not ( = ?auto_169452 ?auto_169455 ) ) ( not ( = ?auto_169452 ?auto_169456 ) ) ( not ( = ?auto_169452 ?auto_169457 ) ) ( not ( = ?auto_169453 ?auto_169454 ) ) ( not ( = ?auto_169453 ?auto_169455 ) ) ( not ( = ?auto_169453 ?auto_169456 ) ) ( not ( = ?auto_169453 ?auto_169457 ) ) ( not ( = ?auto_169454 ?auto_169455 ) ) ( not ( = ?auto_169454 ?auto_169456 ) ) ( not ( = ?auto_169454 ?auto_169457 ) ) ( not ( = ?auto_169455 ?auto_169456 ) ) ( not ( = ?auto_169455 ?auto_169457 ) ) ( not ( = ?auto_169456 ?auto_169457 ) ) ( ON ?auto_169456 ?auto_169457 ) ( ON ?auto_169455 ?auto_169456 ) ( ON ?auto_169454 ?auto_169455 ) ( ON ?auto_169453 ?auto_169454 ) ( ON ?auto_169452 ?auto_169453 ) ( ON ?auto_169451 ?auto_169452 ) ( ON ?auto_169450 ?auto_169451 ) ( ON ?auto_169449 ?auto_169450 ) ( ON ?auto_169448 ?auto_169449 ) ( ON ?auto_169447 ?auto_169448 ) ( ON ?auto_169446 ?auto_169447 ) ( CLEAR ?auto_169446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169446 )
      ( MAKE-12PILE ?auto_169446 ?auto_169447 ?auto_169448 ?auto_169449 ?auto_169450 ?auto_169451 ?auto_169452 ?auto_169453 ?auto_169454 ?auto_169455 ?auto_169456 ?auto_169457 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169470 - BLOCK
      ?auto_169471 - BLOCK
      ?auto_169472 - BLOCK
      ?auto_169473 - BLOCK
      ?auto_169474 - BLOCK
      ?auto_169475 - BLOCK
      ?auto_169476 - BLOCK
      ?auto_169477 - BLOCK
      ?auto_169478 - BLOCK
      ?auto_169479 - BLOCK
      ?auto_169480 - BLOCK
      ?auto_169481 - BLOCK
    )
    :vars
    (
      ?auto_169482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169470 ?auto_169471 ) ) ( not ( = ?auto_169470 ?auto_169472 ) ) ( not ( = ?auto_169470 ?auto_169473 ) ) ( not ( = ?auto_169470 ?auto_169474 ) ) ( not ( = ?auto_169470 ?auto_169475 ) ) ( not ( = ?auto_169470 ?auto_169476 ) ) ( not ( = ?auto_169470 ?auto_169477 ) ) ( not ( = ?auto_169470 ?auto_169478 ) ) ( not ( = ?auto_169470 ?auto_169479 ) ) ( not ( = ?auto_169470 ?auto_169480 ) ) ( not ( = ?auto_169470 ?auto_169481 ) ) ( not ( = ?auto_169471 ?auto_169472 ) ) ( not ( = ?auto_169471 ?auto_169473 ) ) ( not ( = ?auto_169471 ?auto_169474 ) ) ( not ( = ?auto_169471 ?auto_169475 ) ) ( not ( = ?auto_169471 ?auto_169476 ) ) ( not ( = ?auto_169471 ?auto_169477 ) ) ( not ( = ?auto_169471 ?auto_169478 ) ) ( not ( = ?auto_169471 ?auto_169479 ) ) ( not ( = ?auto_169471 ?auto_169480 ) ) ( not ( = ?auto_169471 ?auto_169481 ) ) ( not ( = ?auto_169472 ?auto_169473 ) ) ( not ( = ?auto_169472 ?auto_169474 ) ) ( not ( = ?auto_169472 ?auto_169475 ) ) ( not ( = ?auto_169472 ?auto_169476 ) ) ( not ( = ?auto_169472 ?auto_169477 ) ) ( not ( = ?auto_169472 ?auto_169478 ) ) ( not ( = ?auto_169472 ?auto_169479 ) ) ( not ( = ?auto_169472 ?auto_169480 ) ) ( not ( = ?auto_169472 ?auto_169481 ) ) ( not ( = ?auto_169473 ?auto_169474 ) ) ( not ( = ?auto_169473 ?auto_169475 ) ) ( not ( = ?auto_169473 ?auto_169476 ) ) ( not ( = ?auto_169473 ?auto_169477 ) ) ( not ( = ?auto_169473 ?auto_169478 ) ) ( not ( = ?auto_169473 ?auto_169479 ) ) ( not ( = ?auto_169473 ?auto_169480 ) ) ( not ( = ?auto_169473 ?auto_169481 ) ) ( not ( = ?auto_169474 ?auto_169475 ) ) ( not ( = ?auto_169474 ?auto_169476 ) ) ( not ( = ?auto_169474 ?auto_169477 ) ) ( not ( = ?auto_169474 ?auto_169478 ) ) ( not ( = ?auto_169474 ?auto_169479 ) ) ( not ( = ?auto_169474 ?auto_169480 ) ) ( not ( = ?auto_169474 ?auto_169481 ) ) ( not ( = ?auto_169475 ?auto_169476 ) ) ( not ( = ?auto_169475 ?auto_169477 ) ) ( not ( = ?auto_169475 ?auto_169478 ) ) ( not ( = ?auto_169475 ?auto_169479 ) ) ( not ( = ?auto_169475 ?auto_169480 ) ) ( not ( = ?auto_169475 ?auto_169481 ) ) ( not ( = ?auto_169476 ?auto_169477 ) ) ( not ( = ?auto_169476 ?auto_169478 ) ) ( not ( = ?auto_169476 ?auto_169479 ) ) ( not ( = ?auto_169476 ?auto_169480 ) ) ( not ( = ?auto_169476 ?auto_169481 ) ) ( not ( = ?auto_169477 ?auto_169478 ) ) ( not ( = ?auto_169477 ?auto_169479 ) ) ( not ( = ?auto_169477 ?auto_169480 ) ) ( not ( = ?auto_169477 ?auto_169481 ) ) ( not ( = ?auto_169478 ?auto_169479 ) ) ( not ( = ?auto_169478 ?auto_169480 ) ) ( not ( = ?auto_169478 ?auto_169481 ) ) ( not ( = ?auto_169479 ?auto_169480 ) ) ( not ( = ?auto_169479 ?auto_169481 ) ) ( not ( = ?auto_169480 ?auto_169481 ) ) ( ON ?auto_169470 ?auto_169482 ) ( not ( = ?auto_169481 ?auto_169482 ) ) ( not ( = ?auto_169480 ?auto_169482 ) ) ( not ( = ?auto_169479 ?auto_169482 ) ) ( not ( = ?auto_169478 ?auto_169482 ) ) ( not ( = ?auto_169477 ?auto_169482 ) ) ( not ( = ?auto_169476 ?auto_169482 ) ) ( not ( = ?auto_169475 ?auto_169482 ) ) ( not ( = ?auto_169474 ?auto_169482 ) ) ( not ( = ?auto_169473 ?auto_169482 ) ) ( not ( = ?auto_169472 ?auto_169482 ) ) ( not ( = ?auto_169471 ?auto_169482 ) ) ( not ( = ?auto_169470 ?auto_169482 ) ) ( ON ?auto_169471 ?auto_169470 ) ( ON ?auto_169472 ?auto_169471 ) ( ON ?auto_169473 ?auto_169472 ) ( ON ?auto_169474 ?auto_169473 ) ( ON ?auto_169475 ?auto_169474 ) ( ON ?auto_169476 ?auto_169475 ) ( ON ?auto_169477 ?auto_169476 ) ( ON ?auto_169478 ?auto_169477 ) ( ON ?auto_169479 ?auto_169478 ) ( ON ?auto_169480 ?auto_169479 ) ( ON ?auto_169481 ?auto_169480 ) ( CLEAR ?auto_169481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_169481 ?auto_169480 ?auto_169479 ?auto_169478 ?auto_169477 ?auto_169476 ?auto_169475 ?auto_169474 ?auto_169473 ?auto_169472 ?auto_169471 ?auto_169470 )
      ( MAKE-12PILE ?auto_169470 ?auto_169471 ?auto_169472 ?auto_169473 ?auto_169474 ?auto_169475 ?auto_169476 ?auto_169477 ?auto_169478 ?auto_169479 ?auto_169480 ?auto_169481 ) )
  )

)

