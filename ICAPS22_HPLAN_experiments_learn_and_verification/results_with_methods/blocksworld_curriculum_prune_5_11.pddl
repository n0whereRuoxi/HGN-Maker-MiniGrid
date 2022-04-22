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
      ?auto_7737 - BLOCK
    )
    :vars
    (
      ?auto_7738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7737 ?auto_7738 ) ( CLEAR ?auto_7737 ) ( HAND-EMPTY ) ( not ( = ?auto_7737 ?auto_7738 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7737 ?auto_7738 )
      ( !PUTDOWN ?auto_7737 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7744 - BLOCK
      ?auto_7745 - BLOCK
    )
    :vars
    (
      ?auto_7746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7744 ) ( ON ?auto_7745 ?auto_7746 ) ( CLEAR ?auto_7745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7744 ) ( not ( = ?auto_7744 ?auto_7745 ) ) ( not ( = ?auto_7744 ?auto_7746 ) ) ( not ( = ?auto_7745 ?auto_7746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7745 ?auto_7746 )
      ( !STACK ?auto_7745 ?auto_7744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_7754 - BLOCK
      ?auto_7755 - BLOCK
    )
    :vars
    (
      ?auto_7756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7755 ?auto_7756 ) ( not ( = ?auto_7754 ?auto_7755 ) ) ( not ( = ?auto_7754 ?auto_7756 ) ) ( not ( = ?auto_7755 ?auto_7756 ) ) ( ON ?auto_7754 ?auto_7755 ) ( CLEAR ?auto_7754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7754 )
      ( MAKE-2PILE ?auto_7754 ?auto_7755 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7765 - BLOCK
      ?auto_7766 - BLOCK
      ?auto_7767 - BLOCK
    )
    :vars
    (
      ?auto_7768 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7766 ) ( ON ?auto_7767 ?auto_7768 ) ( CLEAR ?auto_7767 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7765 ) ( ON ?auto_7766 ?auto_7765 ) ( not ( = ?auto_7765 ?auto_7766 ) ) ( not ( = ?auto_7765 ?auto_7767 ) ) ( not ( = ?auto_7765 ?auto_7768 ) ) ( not ( = ?auto_7766 ?auto_7767 ) ) ( not ( = ?auto_7766 ?auto_7768 ) ) ( not ( = ?auto_7767 ?auto_7768 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7767 ?auto_7768 )
      ( !STACK ?auto_7767 ?auto_7766 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7779 - BLOCK
      ?auto_7780 - BLOCK
      ?auto_7781 - BLOCK
    )
    :vars
    (
      ?auto_7782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7781 ?auto_7782 ) ( ON-TABLE ?auto_7779 ) ( not ( = ?auto_7779 ?auto_7780 ) ) ( not ( = ?auto_7779 ?auto_7781 ) ) ( not ( = ?auto_7779 ?auto_7782 ) ) ( not ( = ?auto_7780 ?auto_7781 ) ) ( not ( = ?auto_7780 ?auto_7782 ) ) ( not ( = ?auto_7781 ?auto_7782 ) ) ( CLEAR ?auto_7779 ) ( ON ?auto_7780 ?auto_7781 ) ( CLEAR ?auto_7780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7779 ?auto_7780 )
      ( MAKE-3PILE ?auto_7779 ?auto_7780 ?auto_7781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7793 - BLOCK
      ?auto_7794 - BLOCK
      ?auto_7795 - BLOCK
    )
    :vars
    (
      ?auto_7796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7795 ?auto_7796 ) ( not ( = ?auto_7793 ?auto_7794 ) ) ( not ( = ?auto_7793 ?auto_7795 ) ) ( not ( = ?auto_7793 ?auto_7796 ) ) ( not ( = ?auto_7794 ?auto_7795 ) ) ( not ( = ?auto_7794 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( ON ?auto_7794 ?auto_7795 ) ( ON ?auto_7793 ?auto_7794 ) ( CLEAR ?auto_7793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7793 )
      ( MAKE-3PILE ?auto_7793 ?auto_7794 ?auto_7795 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7808 - BLOCK
      ?auto_7809 - BLOCK
      ?auto_7810 - BLOCK
      ?auto_7811 - BLOCK
    )
    :vars
    (
      ?auto_7812 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7810 ) ( ON ?auto_7811 ?auto_7812 ) ( CLEAR ?auto_7811 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7808 ) ( ON ?auto_7809 ?auto_7808 ) ( ON ?auto_7810 ?auto_7809 ) ( not ( = ?auto_7808 ?auto_7809 ) ) ( not ( = ?auto_7808 ?auto_7810 ) ) ( not ( = ?auto_7808 ?auto_7811 ) ) ( not ( = ?auto_7808 ?auto_7812 ) ) ( not ( = ?auto_7809 ?auto_7810 ) ) ( not ( = ?auto_7809 ?auto_7811 ) ) ( not ( = ?auto_7809 ?auto_7812 ) ) ( not ( = ?auto_7810 ?auto_7811 ) ) ( not ( = ?auto_7810 ?auto_7812 ) ) ( not ( = ?auto_7811 ?auto_7812 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7811 ?auto_7812 )
      ( !STACK ?auto_7811 ?auto_7810 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7826 - BLOCK
      ?auto_7827 - BLOCK
      ?auto_7828 - BLOCK
      ?auto_7829 - BLOCK
    )
    :vars
    (
      ?auto_7830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7829 ?auto_7830 ) ( ON-TABLE ?auto_7826 ) ( ON ?auto_7827 ?auto_7826 ) ( not ( = ?auto_7826 ?auto_7827 ) ) ( not ( = ?auto_7826 ?auto_7828 ) ) ( not ( = ?auto_7826 ?auto_7829 ) ) ( not ( = ?auto_7826 ?auto_7830 ) ) ( not ( = ?auto_7827 ?auto_7828 ) ) ( not ( = ?auto_7827 ?auto_7829 ) ) ( not ( = ?auto_7827 ?auto_7830 ) ) ( not ( = ?auto_7828 ?auto_7829 ) ) ( not ( = ?auto_7828 ?auto_7830 ) ) ( not ( = ?auto_7829 ?auto_7830 ) ) ( CLEAR ?auto_7827 ) ( ON ?auto_7828 ?auto_7829 ) ( CLEAR ?auto_7828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7826 ?auto_7827 ?auto_7828 )
      ( MAKE-4PILE ?auto_7826 ?auto_7827 ?auto_7828 ?auto_7829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7844 - BLOCK
      ?auto_7845 - BLOCK
      ?auto_7846 - BLOCK
      ?auto_7847 - BLOCK
    )
    :vars
    (
      ?auto_7848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7847 ?auto_7848 ) ( ON-TABLE ?auto_7844 ) ( not ( = ?auto_7844 ?auto_7845 ) ) ( not ( = ?auto_7844 ?auto_7846 ) ) ( not ( = ?auto_7844 ?auto_7847 ) ) ( not ( = ?auto_7844 ?auto_7848 ) ) ( not ( = ?auto_7845 ?auto_7846 ) ) ( not ( = ?auto_7845 ?auto_7847 ) ) ( not ( = ?auto_7845 ?auto_7848 ) ) ( not ( = ?auto_7846 ?auto_7847 ) ) ( not ( = ?auto_7846 ?auto_7848 ) ) ( not ( = ?auto_7847 ?auto_7848 ) ) ( ON ?auto_7846 ?auto_7847 ) ( CLEAR ?auto_7844 ) ( ON ?auto_7845 ?auto_7846 ) ( CLEAR ?auto_7845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7844 ?auto_7845 )
      ( MAKE-4PILE ?auto_7844 ?auto_7845 ?auto_7846 ?auto_7847 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7862 - BLOCK
      ?auto_7863 - BLOCK
      ?auto_7864 - BLOCK
      ?auto_7865 - BLOCK
    )
    :vars
    (
      ?auto_7866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7865 ?auto_7866 ) ( not ( = ?auto_7862 ?auto_7863 ) ) ( not ( = ?auto_7862 ?auto_7864 ) ) ( not ( = ?auto_7862 ?auto_7865 ) ) ( not ( = ?auto_7862 ?auto_7866 ) ) ( not ( = ?auto_7863 ?auto_7864 ) ) ( not ( = ?auto_7863 ?auto_7865 ) ) ( not ( = ?auto_7863 ?auto_7866 ) ) ( not ( = ?auto_7864 ?auto_7865 ) ) ( not ( = ?auto_7864 ?auto_7866 ) ) ( not ( = ?auto_7865 ?auto_7866 ) ) ( ON ?auto_7864 ?auto_7865 ) ( ON ?auto_7863 ?auto_7864 ) ( ON ?auto_7862 ?auto_7863 ) ( CLEAR ?auto_7862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7862 )
      ( MAKE-4PILE ?auto_7862 ?auto_7863 ?auto_7864 ?auto_7865 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7881 - BLOCK
      ?auto_7882 - BLOCK
      ?auto_7883 - BLOCK
      ?auto_7884 - BLOCK
      ?auto_7885 - BLOCK
    )
    :vars
    (
      ?auto_7886 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7884 ) ( ON ?auto_7885 ?auto_7886 ) ( CLEAR ?auto_7885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7881 ) ( ON ?auto_7882 ?auto_7881 ) ( ON ?auto_7883 ?auto_7882 ) ( ON ?auto_7884 ?auto_7883 ) ( not ( = ?auto_7881 ?auto_7882 ) ) ( not ( = ?auto_7881 ?auto_7883 ) ) ( not ( = ?auto_7881 ?auto_7884 ) ) ( not ( = ?auto_7881 ?auto_7885 ) ) ( not ( = ?auto_7881 ?auto_7886 ) ) ( not ( = ?auto_7882 ?auto_7883 ) ) ( not ( = ?auto_7882 ?auto_7884 ) ) ( not ( = ?auto_7882 ?auto_7885 ) ) ( not ( = ?auto_7882 ?auto_7886 ) ) ( not ( = ?auto_7883 ?auto_7884 ) ) ( not ( = ?auto_7883 ?auto_7885 ) ) ( not ( = ?auto_7883 ?auto_7886 ) ) ( not ( = ?auto_7884 ?auto_7885 ) ) ( not ( = ?auto_7884 ?auto_7886 ) ) ( not ( = ?auto_7885 ?auto_7886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7885 ?auto_7886 )
      ( !STACK ?auto_7885 ?auto_7884 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7892 - BLOCK
      ?auto_7893 - BLOCK
      ?auto_7894 - BLOCK
      ?auto_7895 - BLOCK
      ?auto_7896 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7895 ) ( ON-TABLE ?auto_7896 ) ( CLEAR ?auto_7896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7892 ) ( ON ?auto_7893 ?auto_7892 ) ( ON ?auto_7894 ?auto_7893 ) ( ON ?auto_7895 ?auto_7894 ) ( not ( = ?auto_7892 ?auto_7893 ) ) ( not ( = ?auto_7892 ?auto_7894 ) ) ( not ( = ?auto_7892 ?auto_7895 ) ) ( not ( = ?auto_7892 ?auto_7896 ) ) ( not ( = ?auto_7893 ?auto_7894 ) ) ( not ( = ?auto_7893 ?auto_7895 ) ) ( not ( = ?auto_7893 ?auto_7896 ) ) ( not ( = ?auto_7894 ?auto_7895 ) ) ( not ( = ?auto_7894 ?auto_7896 ) ) ( not ( = ?auto_7895 ?auto_7896 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_7896 )
      ( !STACK ?auto_7896 ?auto_7895 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7902 - BLOCK
      ?auto_7903 - BLOCK
      ?auto_7904 - BLOCK
      ?auto_7905 - BLOCK
      ?auto_7906 - BLOCK
    )
    :vars
    (
      ?auto_7907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7906 ?auto_7907 ) ( ON-TABLE ?auto_7902 ) ( ON ?auto_7903 ?auto_7902 ) ( ON ?auto_7904 ?auto_7903 ) ( not ( = ?auto_7902 ?auto_7903 ) ) ( not ( = ?auto_7902 ?auto_7904 ) ) ( not ( = ?auto_7902 ?auto_7905 ) ) ( not ( = ?auto_7902 ?auto_7906 ) ) ( not ( = ?auto_7902 ?auto_7907 ) ) ( not ( = ?auto_7903 ?auto_7904 ) ) ( not ( = ?auto_7903 ?auto_7905 ) ) ( not ( = ?auto_7903 ?auto_7906 ) ) ( not ( = ?auto_7903 ?auto_7907 ) ) ( not ( = ?auto_7904 ?auto_7905 ) ) ( not ( = ?auto_7904 ?auto_7906 ) ) ( not ( = ?auto_7904 ?auto_7907 ) ) ( not ( = ?auto_7905 ?auto_7906 ) ) ( not ( = ?auto_7905 ?auto_7907 ) ) ( not ( = ?auto_7906 ?auto_7907 ) ) ( CLEAR ?auto_7904 ) ( ON ?auto_7905 ?auto_7906 ) ( CLEAR ?auto_7905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7902 ?auto_7903 ?auto_7904 ?auto_7905 )
      ( MAKE-5PILE ?auto_7902 ?auto_7903 ?auto_7904 ?auto_7905 ?auto_7906 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7913 - BLOCK
      ?auto_7914 - BLOCK
      ?auto_7915 - BLOCK
      ?auto_7916 - BLOCK
      ?auto_7917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7917 ) ( ON-TABLE ?auto_7913 ) ( ON ?auto_7914 ?auto_7913 ) ( ON ?auto_7915 ?auto_7914 ) ( not ( = ?auto_7913 ?auto_7914 ) ) ( not ( = ?auto_7913 ?auto_7915 ) ) ( not ( = ?auto_7913 ?auto_7916 ) ) ( not ( = ?auto_7913 ?auto_7917 ) ) ( not ( = ?auto_7914 ?auto_7915 ) ) ( not ( = ?auto_7914 ?auto_7916 ) ) ( not ( = ?auto_7914 ?auto_7917 ) ) ( not ( = ?auto_7915 ?auto_7916 ) ) ( not ( = ?auto_7915 ?auto_7917 ) ) ( not ( = ?auto_7916 ?auto_7917 ) ) ( CLEAR ?auto_7915 ) ( ON ?auto_7916 ?auto_7917 ) ( CLEAR ?auto_7916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7913 ?auto_7914 ?auto_7915 ?auto_7916 )
      ( MAKE-5PILE ?auto_7913 ?auto_7914 ?auto_7915 ?auto_7916 ?auto_7917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7923 - BLOCK
      ?auto_7924 - BLOCK
      ?auto_7925 - BLOCK
      ?auto_7926 - BLOCK
      ?auto_7927 - BLOCK
    )
    :vars
    (
      ?auto_7928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7927 ?auto_7928 ) ( ON-TABLE ?auto_7923 ) ( ON ?auto_7924 ?auto_7923 ) ( not ( = ?auto_7923 ?auto_7924 ) ) ( not ( = ?auto_7923 ?auto_7925 ) ) ( not ( = ?auto_7923 ?auto_7926 ) ) ( not ( = ?auto_7923 ?auto_7927 ) ) ( not ( = ?auto_7923 ?auto_7928 ) ) ( not ( = ?auto_7924 ?auto_7925 ) ) ( not ( = ?auto_7924 ?auto_7926 ) ) ( not ( = ?auto_7924 ?auto_7927 ) ) ( not ( = ?auto_7924 ?auto_7928 ) ) ( not ( = ?auto_7925 ?auto_7926 ) ) ( not ( = ?auto_7925 ?auto_7927 ) ) ( not ( = ?auto_7925 ?auto_7928 ) ) ( not ( = ?auto_7926 ?auto_7927 ) ) ( not ( = ?auto_7926 ?auto_7928 ) ) ( not ( = ?auto_7927 ?auto_7928 ) ) ( ON ?auto_7926 ?auto_7927 ) ( CLEAR ?auto_7924 ) ( ON ?auto_7925 ?auto_7926 ) ( CLEAR ?auto_7925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7923 ?auto_7924 ?auto_7925 )
      ( MAKE-5PILE ?auto_7923 ?auto_7924 ?auto_7925 ?auto_7926 ?auto_7927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7934 - BLOCK
      ?auto_7935 - BLOCK
      ?auto_7936 - BLOCK
      ?auto_7937 - BLOCK
      ?auto_7938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7938 ) ( ON-TABLE ?auto_7934 ) ( ON ?auto_7935 ?auto_7934 ) ( not ( = ?auto_7934 ?auto_7935 ) ) ( not ( = ?auto_7934 ?auto_7936 ) ) ( not ( = ?auto_7934 ?auto_7937 ) ) ( not ( = ?auto_7934 ?auto_7938 ) ) ( not ( = ?auto_7935 ?auto_7936 ) ) ( not ( = ?auto_7935 ?auto_7937 ) ) ( not ( = ?auto_7935 ?auto_7938 ) ) ( not ( = ?auto_7936 ?auto_7937 ) ) ( not ( = ?auto_7936 ?auto_7938 ) ) ( not ( = ?auto_7937 ?auto_7938 ) ) ( ON ?auto_7937 ?auto_7938 ) ( CLEAR ?auto_7935 ) ( ON ?auto_7936 ?auto_7937 ) ( CLEAR ?auto_7936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7934 ?auto_7935 ?auto_7936 )
      ( MAKE-5PILE ?auto_7934 ?auto_7935 ?auto_7936 ?auto_7937 ?auto_7938 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7944 - BLOCK
      ?auto_7945 - BLOCK
      ?auto_7946 - BLOCK
      ?auto_7947 - BLOCK
      ?auto_7948 - BLOCK
    )
    :vars
    (
      ?auto_7949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7948 ?auto_7949 ) ( ON-TABLE ?auto_7944 ) ( not ( = ?auto_7944 ?auto_7945 ) ) ( not ( = ?auto_7944 ?auto_7946 ) ) ( not ( = ?auto_7944 ?auto_7947 ) ) ( not ( = ?auto_7944 ?auto_7948 ) ) ( not ( = ?auto_7944 ?auto_7949 ) ) ( not ( = ?auto_7945 ?auto_7946 ) ) ( not ( = ?auto_7945 ?auto_7947 ) ) ( not ( = ?auto_7945 ?auto_7948 ) ) ( not ( = ?auto_7945 ?auto_7949 ) ) ( not ( = ?auto_7946 ?auto_7947 ) ) ( not ( = ?auto_7946 ?auto_7948 ) ) ( not ( = ?auto_7946 ?auto_7949 ) ) ( not ( = ?auto_7947 ?auto_7948 ) ) ( not ( = ?auto_7947 ?auto_7949 ) ) ( not ( = ?auto_7948 ?auto_7949 ) ) ( ON ?auto_7947 ?auto_7948 ) ( ON ?auto_7946 ?auto_7947 ) ( CLEAR ?auto_7944 ) ( ON ?auto_7945 ?auto_7946 ) ( CLEAR ?auto_7945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7944 ?auto_7945 )
      ( MAKE-5PILE ?auto_7944 ?auto_7945 ?auto_7946 ?auto_7947 ?auto_7948 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7955 - BLOCK
      ?auto_7956 - BLOCK
      ?auto_7957 - BLOCK
      ?auto_7958 - BLOCK
      ?auto_7959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7959 ) ( ON-TABLE ?auto_7955 ) ( not ( = ?auto_7955 ?auto_7956 ) ) ( not ( = ?auto_7955 ?auto_7957 ) ) ( not ( = ?auto_7955 ?auto_7958 ) ) ( not ( = ?auto_7955 ?auto_7959 ) ) ( not ( = ?auto_7956 ?auto_7957 ) ) ( not ( = ?auto_7956 ?auto_7958 ) ) ( not ( = ?auto_7956 ?auto_7959 ) ) ( not ( = ?auto_7957 ?auto_7958 ) ) ( not ( = ?auto_7957 ?auto_7959 ) ) ( not ( = ?auto_7958 ?auto_7959 ) ) ( ON ?auto_7958 ?auto_7959 ) ( ON ?auto_7957 ?auto_7958 ) ( CLEAR ?auto_7955 ) ( ON ?auto_7956 ?auto_7957 ) ( CLEAR ?auto_7956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7955 ?auto_7956 )
      ( MAKE-5PILE ?auto_7955 ?auto_7956 ?auto_7957 ?auto_7958 ?auto_7959 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7965 - BLOCK
      ?auto_7966 - BLOCK
      ?auto_7967 - BLOCK
      ?auto_7968 - BLOCK
      ?auto_7969 - BLOCK
    )
    :vars
    (
      ?auto_7970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7969 ?auto_7970 ) ( not ( = ?auto_7965 ?auto_7966 ) ) ( not ( = ?auto_7965 ?auto_7967 ) ) ( not ( = ?auto_7965 ?auto_7968 ) ) ( not ( = ?auto_7965 ?auto_7969 ) ) ( not ( = ?auto_7965 ?auto_7970 ) ) ( not ( = ?auto_7966 ?auto_7967 ) ) ( not ( = ?auto_7966 ?auto_7968 ) ) ( not ( = ?auto_7966 ?auto_7969 ) ) ( not ( = ?auto_7966 ?auto_7970 ) ) ( not ( = ?auto_7967 ?auto_7968 ) ) ( not ( = ?auto_7967 ?auto_7969 ) ) ( not ( = ?auto_7967 ?auto_7970 ) ) ( not ( = ?auto_7968 ?auto_7969 ) ) ( not ( = ?auto_7968 ?auto_7970 ) ) ( not ( = ?auto_7969 ?auto_7970 ) ) ( ON ?auto_7968 ?auto_7969 ) ( ON ?auto_7967 ?auto_7968 ) ( ON ?auto_7966 ?auto_7967 ) ( ON ?auto_7965 ?auto_7966 ) ( CLEAR ?auto_7965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7965 )
      ( MAKE-5PILE ?auto_7965 ?auto_7966 ?auto_7967 ?auto_7968 ?auto_7969 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7976 - BLOCK
      ?auto_7977 - BLOCK
      ?auto_7978 - BLOCK
      ?auto_7979 - BLOCK
      ?auto_7980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7980 ) ( not ( = ?auto_7976 ?auto_7977 ) ) ( not ( = ?auto_7976 ?auto_7978 ) ) ( not ( = ?auto_7976 ?auto_7979 ) ) ( not ( = ?auto_7976 ?auto_7980 ) ) ( not ( = ?auto_7977 ?auto_7978 ) ) ( not ( = ?auto_7977 ?auto_7979 ) ) ( not ( = ?auto_7977 ?auto_7980 ) ) ( not ( = ?auto_7978 ?auto_7979 ) ) ( not ( = ?auto_7978 ?auto_7980 ) ) ( not ( = ?auto_7979 ?auto_7980 ) ) ( ON ?auto_7979 ?auto_7980 ) ( ON ?auto_7978 ?auto_7979 ) ( ON ?auto_7977 ?auto_7978 ) ( ON ?auto_7976 ?auto_7977 ) ( CLEAR ?auto_7976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7976 )
      ( MAKE-5PILE ?auto_7976 ?auto_7977 ?auto_7978 ?auto_7979 ?auto_7980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7986 - BLOCK
      ?auto_7987 - BLOCK
      ?auto_7988 - BLOCK
      ?auto_7989 - BLOCK
      ?auto_7990 - BLOCK
    )
    :vars
    (
      ?auto_7991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7986 ?auto_7987 ) ) ( not ( = ?auto_7986 ?auto_7988 ) ) ( not ( = ?auto_7986 ?auto_7989 ) ) ( not ( = ?auto_7986 ?auto_7990 ) ) ( not ( = ?auto_7987 ?auto_7988 ) ) ( not ( = ?auto_7987 ?auto_7989 ) ) ( not ( = ?auto_7987 ?auto_7990 ) ) ( not ( = ?auto_7988 ?auto_7989 ) ) ( not ( = ?auto_7988 ?auto_7990 ) ) ( not ( = ?auto_7989 ?auto_7990 ) ) ( ON ?auto_7986 ?auto_7991 ) ( not ( = ?auto_7990 ?auto_7991 ) ) ( not ( = ?auto_7989 ?auto_7991 ) ) ( not ( = ?auto_7988 ?auto_7991 ) ) ( not ( = ?auto_7987 ?auto_7991 ) ) ( not ( = ?auto_7986 ?auto_7991 ) ) ( ON ?auto_7987 ?auto_7986 ) ( ON ?auto_7988 ?auto_7987 ) ( ON ?auto_7989 ?auto_7988 ) ( ON ?auto_7990 ?auto_7989 ) ( CLEAR ?auto_7990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_7990 ?auto_7989 ?auto_7988 ?auto_7987 ?auto_7986 )
      ( MAKE-5PILE ?auto_7986 ?auto_7987 ?auto_7988 ?auto_7989 ?auto_7990 ) )
  )

)

