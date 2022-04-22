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
      ?auto_8761 - BLOCK
    )
    :vars
    (
      ?auto_8762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8761 ?auto_8762 ) ( CLEAR ?auto_8761 ) ( HAND-EMPTY ) ( not ( = ?auto_8761 ?auto_8762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8761 ?auto_8762 )
      ( !PUTDOWN ?auto_8761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8768 - BLOCK
      ?auto_8769 - BLOCK
    )
    :vars
    (
      ?auto_8770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8768 ) ( ON ?auto_8769 ?auto_8770 ) ( CLEAR ?auto_8769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8768 ) ( not ( = ?auto_8768 ?auto_8769 ) ) ( not ( = ?auto_8768 ?auto_8770 ) ) ( not ( = ?auto_8769 ?auto_8770 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8769 ?auto_8770 )
      ( !STACK ?auto_8769 ?auto_8768 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8778 - BLOCK
      ?auto_8779 - BLOCK
    )
    :vars
    (
      ?auto_8780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8779 ?auto_8780 ) ( not ( = ?auto_8778 ?auto_8779 ) ) ( not ( = ?auto_8778 ?auto_8780 ) ) ( not ( = ?auto_8779 ?auto_8780 ) ) ( ON ?auto_8778 ?auto_8779 ) ( CLEAR ?auto_8778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8778 )
      ( MAKE-2PILE ?auto_8778 ?auto_8779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8789 - BLOCK
      ?auto_8790 - BLOCK
      ?auto_8791 - BLOCK
    )
    :vars
    (
      ?auto_8792 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8790 ) ( ON ?auto_8791 ?auto_8792 ) ( CLEAR ?auto_8791 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8789 ) ( ON ?auto_8790 ?auto_8789 ) ( not ( = ?auto_8789 ?auto_8790 ) ) ( not ( = ?auto_8789 ?auto_8791 ) ) ( not ( = ?auto_8789 ?auto_8792 ) ) ( not ( = ?auto_8790 ?auto_8791 ) ) ( not ( = ?auto_8790 ?auto_8792 ) ) ( not ( = ?auto_8791 ?auto_8792 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8791 ?auto_8792 )
      ( !STACK ?auto_8791 ?auto_8790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8803 - BLOCK
      ?auto_8804 - BLOCK
      ?auto_8805 - BLOCK
    )
    :vars
    (
      ?auto_8806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8805 ?auto_8806 ) ( ON-TABLE ?auto_8803 ) ( not ( = ?auto_8803 ?auto_8804 ) ) ( not ( = ?auto_8803 ?auto_8805 ) ) ( not ( = ?auto_8803 ?auto_8806 ) ) ( not ( = ?auto_8804 ?auto_8805 ) ) ( not ( = ?auto_8804 ?auto_8806 ) ) ( not ( = ?auto_8805 ?auto_8806 ) ) ( CLEAR ?auto_8803 ) ( ON ?auto_8804 ?auto_8805 ) ( CLEAR ?auto_8804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8803 ?auto_8804 )
      ( MAKE-3PILE ?auto_8803 ?auto_8804 ?auto_8805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_8817 - BLOCK
      ?auto_8818 - BLOCK
      ?auto_8819 - BLOCK
    )
    :vars
    (
      ?auto_8820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8819 ?auto_8820 ) ( not ( = ?auto_8817 ?auto_8818 ) ) ( not ( = ?auto_8817 ?auto_8819 ) ) ( not ( = ?auto_8817 ?auto_8820 ) ) ( not ( = ?auto_8818 ?auto_8819 ) ) ( not ( = ?auto_8818 ?auto_8820 ) ) ( not ( = ?auto_8819 ?auto_8820 ) ) ( ON ?auto_8818 ?auto_8819 ) ( ON ?auto_8817 ?auto_8818 ) ( CLEAR ?auto_8817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8817 )
      ( MAKE-3PILE ?auto_8817 ?auto_8818 ?auto_8819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8832 - BLOCK
      ?auto_8833 - BLOCK
      ?auto_8834 - BLOCK
      ?auto_8835 - BLOCK
    )
    :vars
    (
      ?auto_8836 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8834 ) ( ON ?auto_8835 ?auto_8836 ) ( CLEAR ?auto_8835 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8832 ) ( ON ?auto_8833 ?auto_8832 ) ( ON ?auto_8834 ?auto_8833 ) ( not ( = ?auto_8832 ?auto_8833 ) ) ( not ( = ?auto_8832 ?auto_8834 ) ) ( not ( = ?auto_8832 ?auto_8835 ) ) ( not ( = ?auto_8832 ?auto_8836 ) ) ( not ( = ?auto_8833 ?auto_8834 ) ) ( not ( = ?auto_8833 ?auto_8835 ) ) ( not ( = ?auto_8833 ?auto_8836 ) ) ( not ( = ?auto_8834 ?auto_8835 ) ) ( not ( = ?auto_8834 ?auto_8836 ) ) ( not ( = ?auto_8835 ?auto_8836 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8835 ?auto_8836 )
      ( !STACK ?auto_8835 ?auto_8834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8850 - BLOCK
      ?auto_8851 - BLOCK
      ?auto_8852 - BLOCK
      ?auto_8853 - BLOCK
    )
    :vars
    (
      ?auto_8854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8853 ?auto_8854 ) ( ON-TABLE ?auto_8850 ) ( ON ?auto_8851 ?auto_8850 ) ( not ( = ?auto_8850 ?auto_8851 ) ) ( not ( = ?auto_8850 ?auto_8852 ) ) ( not ( = ?auto_8850 ?auto_8853 ) ) ( not ( = ?auto_8850 ?auto_8854 ) ) ( not ( = ?auto_8851 ?auto_8852 ) ) ( not ( = ?auto_8851 ?auto_8853 ) ) ( not ( = ?auto_8851 ?auto_8854 ) ) ( not ( = ?auto_8852 ?auto_8853 ) ) ( not ( = ?auto_8852 ?auto_8854 ) ) ( not ( = ?auto_8853 ?auto_8854 ) ) ( CLEAR ?auto_8851 ) ( ON ?auto_8852 ?auto_8853 ) ( CLEAR ?auto_8852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8850 ?auto_8851 ?auto_8852 )
      ( MAKE-4PILE ?auto_8850 ?auto_8851 ?auto_8852 ?auto_8853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8868 - BLOCK
      ?auto_8869 - BLOCK
      ?auto_8870 - BLOCK
      ?auto_8871 - BLOCK
    )
    :vars
    (
      ?auto_8872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8871 ?auto_8872 ) ( ON-TABLE ?auto_8868 ) ( not ( = ?auto_8868 ?auto_8869 ) ) ( not ( = ?auto_8868 ?auto_8870 ) ) ( not ( = ?auto_8868 ?auto_8871 ) ) ( not ( = ?auto_8868 ?auto_8872 ) ) ( not ( = ?auto_8869 ?auto_8870 ) ) ( not ( = ?auto_8869 ?auto_8871 ) ) ( not ( = ?auto_8869 ?auto_8872 ) ) ( not ( = ?auto_8870 ?auto_8871 ) ) ( not ( = ?auto_8870 ?auto_8872 ) ) ( not ( = ?auto_8871 ?auto_8872 ) ) ( ON ?auto_8870 ?auto_8871 ) ( CLEAR ?auto_8868 ) ( ON ?auto_8869 ?auto_8870 ) ( CLEAR ?auto_8869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8868 ?auto_8869 )
      ( MAKE-4PILE ?auto_8868 ?auto_8869 ?auto_8870 ?auto_8871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_8886 - BLOCK
      ?auto_8887 - BLOCK
      ?auto_8888 - BLOCK
      ?auto_8889 - BLOCK
    )
    :vars
    (
      ?auto_8890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8889 ?auto_8890 ) ( not ( = ?auto_8886 ?auto_8887 ) ) ( not ( = ?auto_8886 ?auto_8888 ) ) ( not ( = ?auto_8886 ?auto_8889 ) ) ( not ( = ?auto_8886 ?auto_8890 ) ) ( not ( = ?auto_8887 ?auto_8888 ) ) ( not ( = ?auto_8887 ?auto_8889 ) ) ( not ( = ?auto_8887 ?auto_8890 ) ) ( not ( = ?auto_8888 ?auto_8889 ) ) ( not ( = ?auto_8888 ?auto_8890 ) ) ( not ( = ?auto_8889 ?auto_8890 ) ) ( ON ?auto_8888 ?auto_8889 ) ( ON ?auto_8887 ?auto_8888 ) ( ON ?auto_8886 ?auto_8887 ) ( CLEAR ?auto_8886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8886 )
      ( MAKE-4PILE ?auto_8886 ?auto_8887 ?auto_8888 ?auto_8889 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8905 - BLOCK
      ?auto_8906 - BLOCK
      ?auto_8907 - BLOCK
      ?auto_8908 - BLOCK
      ?auto_8909 - BLOCK
    )
    :vars
    (
      ?auto_8910 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8908 ) ( ON ?auto_8909 ?auto_8910 ) ( CLEAR ?auto_8909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8905 ) ( ON ?auto_8906 ?auto_8905 ) ( ON ?auto_8907 ?auto_8906 ) ( ON ?auto_8908 ?auto_8907 ) ( not ( = ?auto_8905 ?auto_8906 ) ) ( not ( = ?auto_8905 ?auto_8907 ) ) ( not ( = ?auto_8905 ?auto_8908 ) ) ( not ( = ?auto_8905 ?auto_8909 ) ) ( not ( = ?auto_8905 ?auto_8910 ) ) ( not ( = ?auto_8906 ?auto_8907 ) ) ( not ( = ?auto_8906 ?auto_8908 ) ) ( not ( = ?auto_8906 ?auto_8909 ) ) ( not ( = ?auto_8906 ?auto_8910 ) ) ( not ( = ?auto_8907 ?auto_8908 ) ) ( not ( = ?auto_8907 ?auto_8909 ) ) ( not ( = ?auto_8907 ?auto_8910 ) ) ( not ( = ?auto_8908 ?auto_8909 ) ) ( not ( = ?auto_8908 ?auto_8910 ) ) ( not ( = ?auto_8909 ?auto_8910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_8909 ?auto_8910 )
      ( !STACK ?auto_8909 ?auto_8908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8916 - BLOCK
      ?auto_8917 - BLOCK
      ?auto_8918 - BLOCK
      ?auto_8919 - BLOCK
      ?auto_8920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8919 ) ( ON-TABLE ?auto_8920 ) ( CLEAR ?auto_8920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8916 ) ( ON ?auto_8917 ?auto_8916 ) ( ON ?auto_8918 ?auto_8917 ) ( ON ?auto_8919 ?auto_8918 ) ( not ( = ?auto_8916 ?auto_8917 ) ) ( not ( = ?auto_8916 ?auto_8918 ) ) ( not ( = ?auto_8916 ?auto_8919 ) ) ( not ( = ?auto_8916 ?auto_8920 ) ) ( not ( = ?auto_8917 ?auto_8918 ) ) ( not ( = ?auto_8917 ?auto_8919 ) ) ( not ( = ?auto_8917 ?auto_8920 ) ) ( not ( = ?auto_8918 ?auto_8919 ) ) ( not ( = ?auto_8918 ?auto_8920 ) ) ( not ( = ?auto_8919 ?auto_8920 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_8920 )
      ( !STACK ?auto_8920 ?auto_8919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8926 - BLOCK
      ?auto_8927 - BLOCK
      ?auto_8928 - BLOCK
      ?auto_8929 - BLOCK
      ?auto_8930 - BLOCK
    )
    :vars
    (
      ?auto_8931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8930 ?auto_8931 ) ( ON-TABLE ?auto_8926 ) ( ON ?auto_8927 ?auto_8926 ) ( ON ?auto_8928 ?auto_8927 ) ( not ( = ?auto_8926 ?auto_8927 ) ) ( not ( = ?auto_8926 ?auto_8928 ) ) ( not ( = ?auto_8926 ?auto_8929 ) ) ( not ( = ?auto_8926 ?auto_8930 ) ) ( not ( = ?auto_8926 ?auto_8931 ) ) ( not ( = ?auto_8927 ?auto_8928 ) ) ( not ( = ?auto_8927 ?auto_8929 ) ) ( not ( = ?auto_8927 ?auto_8930 ) ) ( not ( = ?auto_8927 ?auto_8931 ) ) ( not ( = ?auto_8928 ?auto_8929 ) ) ( not ( = ?auto_8928 ?auto_8930 ) ) ( not ( = ?auto_8928 ?auto_8931 ) ) ( not ( = ?auto_8929 ?auto_8930 ) ) ( not ( = ?auto_8929 ?auto_8931 ) ) ( not ( = ?auto_8930 ?auto_8931 ) ) ( CLEAR ?auto_8928 ) ( ON ?auto_8929 ?auto_8930 ) ( CLEAR ?auto_8929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8926 ?auto_8927 ?auto_8928 ?auto_8929 )
      ( MAKE-5PILE ?auto_8926 ?auto_8927 ?auto_8928 ?auto_8929 ?auto_8930 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8937 - BLOCK
      ?auto_8938 - BLOCK
      ?auto_8939 - BLOCK
      ?auto_8940 - BLOCK
      ?auto_8941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8941 ) ( ON-TABLE ?auto_8937 ) ( ON ?auto_8938 ?auto_8937 ) ( ON ?auto_8939 ?auto_8938 ) ( not ( = ?auto_8937 ?auto_8938 ) ) ( not ( = ?auto_8937 ?auto_8939 ) ) ( not ( = ?auto_8937 ?auto_8940 ) ) ( not ( = ?auto_8937 ?auto_8941 ) ) ( not ( = ?auto_8938 ?auto_8939 ) ) ( not ( = ?auto_8938 ?auto_8940 ) ) ( not ( = ?auto_8938 ?auto_8941 ) ) ( not ( = ?auto_8939 ?auto_8940 ) ) ( not ( = ?auto_8939 ?auto_8941 ) ) ( not ( = ?auto_8940 ?auto_8941 ) ) ( CLEAR ?auto_8939 ) ( ON ?auto_8940 ?auto_8941 ) ( CLEAR ?auto_8940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_8937 ?auto_8938 ?auto_8939 ?auto_8940 )
      ( MAKE-5PILE ?auto_8937 ?auto_8938 ?auto_8939 ?auto_8940 ?auto_8941 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8947 - BLOCK
      ?auto_8948 - BLOCK
      ?auto_8949 - BLOCK
      ?auto_8950 - BLOCK
      ?auto_8951 - BLOCK
    )
    :vars
    (
      ?auto_8952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8951 ?auto_8952 ) ( ON-TABLE ?auto_8947 ) ( ON ?auto_8948 ?auto_8947 ) ( not ( = ?auto_8947 ?auto_8948 ) ) ( not ( = ?auto_8947 ?auto_8949 ) ) ( not ( = ?auto_8947 ?auto_8950 ) ) ( not ( = ?auto_8947 ?auto_8951 ) ) ( not ( = ?auto_8947 ?auto_8952 ) ) ( not ( = ?auto_8948 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8950 ) ) ( not ( = ?auto_8948 ?auto_8951 ) ) ( not ( = ?auto_8948 ?auto_8952 ) ) ( not ( = ?auto_8949 ?auto_8950 ) ) ( not ( = ?auto_8949 ?auto_8951 ) ) ( not ( = ?auto_8949 ?auto_8952 ) ) ( not ( = ?auto_8950 ?auto_8951 ) ) ( not ( = ?auto_8950 ?auto_8952 ) ) ( not ( = ?auto_8951 ?auto_8952 ) ) ( ON ?auto_8950 ?auto_8951 ) ( CLEAR ?auto_8948 ) ( ON ?auto_8949 ?auto_8950 ) ( CLEAR ?auto_8949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8947 ?auto_8948 ?auto_8949 )
      ( MAKE-5PILE ?auto_8947 ?auto_8948 ?auto_8949 ?auto_8950 ?auto_8951 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8958 - BLOCK
      ?auto_8959 - BLOCK
      ?auto_8960 - BLOCK
      ?auto_8961 - BLOCK
      ?auto_8962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8962 ) ( ON-TABLE ?auto_8958 ) ( ON ?auto_8959 ?auto_8958 ) ( not ( = ?auto_8958 ?auto_8959 ) ) ( not ( = ?auto_8958 ?auto_8960 ) ) ( not ( = ?auto_8958 ?auto_8961 ) ) ( not ( = ?auto_8958 ?auto_8962 ) ) ( not ( = ?auto_8959 ?auto_8960 ) ) ( not ( = ?auto_8959 ?auto_8961 ) ) ( not ( = ?auto_8959 ?auto_8962 ) ) ( not ( = ?auto_8960 ?auto_8961 ) ) ( not ( = ?auto_8960 ?auto_8962 ) ) ( not ( = ?auto_8961 ?auto_8962 ) ) ( ON ?auto_8961 ?auto_8962 ) ( CLEAR ?auto_8959 ) ( ON ?auto_8960 ?auto_8961 ) ( CLEAR ?auto_8960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_8958 ?auto_8959 ?auto_8960 )
      ( MAKE-5PILE ?auto_8958 ?auto_8959 ?auto_8960 ?auto_8961 ?auto_8962 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8968 - BLOCK
      ?auto_8969 - BLOCK
      ?auto_8970 - BLOCK
      ?auto_8971 - BLOCK
      ?auto_8972 - BLOCK
    )
    :vars
    (
      ?auto_8973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8972 ?auto_8973 ) ( ON-TABLE ?auto_8968 ) ( not ( = ?auto_8968 ?auto_8969 ) ) ( not ( = ?auto_8968 ?auto_8970 ) ) ( not ( = ?auto_8968 ?auto_8971 ) ) ( not ( = ?auto_8968 ?auto_8972 ) ) ( not ( = ?auto_8968 ?auto_8973 ) ) ( not ( = ?auto_8969 ?auto_8970 ) ) ( not ( = ?auto_8969 ?auto_8971 ) ) ( not ( = ?auto_8969 ?auto_8972 ) ) ( not ( = ?auto_8969 ?auto_8973 ) ) ( not ( = ?auto_8970 ?auto_8971 ) ) ( not ( = ?auto_8970 ?auto_8972 ) ) ( not ( = ?auto_8970 ?auto_8973 ) ) ( not ( = ?auto_8971 ?auto_8972 ) ) ( not ( = ?auto_8971 ?auto_8973 ) ) ( not ( = ?auto_8972 ?auto_8973 ) ) ( ON ?auto_8971 ?auto_8972 ) ( ON ?auto_8970 ?auto_8971 ) ( CLEAR ?auto_8968 ) ( ON ?auto_8969 ?auto_8970 ) ( CLEAR ?auto_8969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8968 ?auto_8969 )
      ( MAKE-5PILE ?auto_8968 ?auto_8969 ?auto_8970 ?auto_8971 ?auto_8972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8979 - BLOCK
      ?auto_8980 - BLOCK
      ?auto_8981 - BLOCK
      ?auto_8982 - BLOCK
      ?auto_8983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_8983 ) ( ON-TABLE ?auto_8979 ) ( not ( = ?auto_8979 ?auto_8980 ) ) ( not ( = ?auto_8979 ?auto_8981 ) ) ( not ( = ?auto_8979 ?auto_8982 ) ) ( not ( = ?auto_8979 ?auto_8983 ) ) ( not ( = ?auto_8980 ?auto_8981 ) ) ( not ( = ?auto_8980 ?auto_8982 ) ) ( not ( = ?auto_8980 ?auto_8983 ) ) ( not ( = ?auto_8981 ?auto_8982 ) ) ( not ( = ?auto_8981 ?auto_8983 ) ) ( not ( = ?auto_8982 ?auto_8983 ) ) ( ON ?auto_8982 ?auto_8983 ) ( ON ?auto_8981 ?auto_8982 ) ( CLEAR ?auto_8979 ) ( ON ?auto_8980 ?auto_8981 ) ( CLEAR ?auto_8980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_8979 ?auto_8980 )
      ( MAKE-5PILE ?auto_8979 ?auto_8980 ?auto_8981 ?auto_8982 ?auto_8983 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_8989 - BLOCK
      ?auto_8990 - BLOCK
      ?auto_8991 - BLOCK
      ?auto_8992 - BLOCK
      ?auto_8993 - BLOCK
    )
    :vars
    (
      ?auto_8994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_8993 ?auto_8994 ) ( not ( = ?auto_8989 ?auto_8990 ) ) ( not ( = ?auto_8989 ?auto_8991 ) ) ( not ( = ?auto_8989 ?auto_8992 ) ) ( not ( = ?auto_8989 ?auto_8993 ) ) ( not ( = ?auto_8989 ?auto_8994 ) ) ( not ( = ?auto_8990 ?auto_8991 ) ) ( not ( = ?auto_8990 ?auto_8992 ) ) ( not ( = ?auto_8990 ?auto_8993 ) ) ( not ( = ?auto_8990 ?auto_8994 ) ) ( not ( = ?auto_8991 ?auto_8992 ) ) ( not ( = ?auto_8991 ?auto_8993 ) ) ( not ( = ?auto_8991 ?auto_8994 ) ) ( not ( = ?auto_8992 ?auto_8993 ) ) ( not ( = ?auto_8992 ?auto_8994 ) ) ( not ( = ?auto_8993 ?auto_8994 ) ) ( ON ?auto_8992 ?auto_8993 ) ( ON ?auto_8991 ?auto_8992 ) ( ON ?auto_8990 ?auto_8991 ) ( ON ?auto_8989 ?auto_8990 ) ( CLEAR ?auto_8989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_8989 )
      ( MAKE-5PILE ?auto_8989 ?auto_8990 ?auto_8991 ?auto_8992 ?auto_8993 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9000 - BLOCK
      ?auto_9001 - BLOCK
      ?auto_9002 - BLOCK
      ?auto_9003 - BLOCK
      ?auto_9004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9004 ) ( not ( = ?auto_9000 ?auto_9001 ) ) ( not ( = ?auto_9000 ?auto_9002 ) ) ( not ( = ?auto_9000 ?auto_9003 ) ) ( not ( = ?auto_9000 ?auto_9004 ) ) ( not ( = ?auto_9001 ?auto_9002 ) ) ( not ( = ?auto_9001 ?auto_9003 ) ) ( not ( = ?auto_9001 ?auto_9004 ) ) ( not ( = ?auto_9002 ?auto_9003 ) ) ( not ( = ?auto_9002 ?auto_9004 ) ) ( not ( = ?auto_9003 ?auto_9004 ) ) ( ON ?auto_9003 ?auto_9004 ) ( ON ?auto_9002 ?auto_9003 ) ( ON ?auto_9001 ?auto_9002 ) ( ON ?auto_9000 ?auto_9001 ) ( CLEAR ?auto_9000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9000 )
      ( MAKE-5PILE ?auto_9000 ?auto_9001 ?auto_9002 ?auto_9003 ?auto_9004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9010 - BLOCK
      ?auto_9011 - BLOCK
      ?auto_9012 - BLOCK
      ?auto_9013 - BLOCK
      ?auto_9014 - BLOCK
    )
    :vars
    (
      ?auto_9015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9010 ?auto_9011 ) ) ( not ( = ?auto_9010 ?auto_9012 ) ) ( not ( = ?auto_9010 ?auto_9013 ) ) ( not ( = ?auto_9010 ?auto_9014 ) ) ( not ( = ?auto_9011 ?auto_9012 ) ) ( not ( = ?auto_9011 ?auto_9013 ) ) ( not ( = ?auto_9011 ?auto_9014 ) ) ( not ( = ?auto_9012 ?auto_9013 ) ) ( not ( = ?auto_9012 ?auto_9014 ) ) ( not ( = ?auto_9013 ?auto_9014 ) ) ( ON ?auto_9010 ?auto_9015 ) ( not ( = ?auto_9014 ?auto_9015 ) ) ( not ( = ?auto_9013 ?auto_9015 ) ) ( not ( = ?auto_9012 ?auto_9015 ) ) ( not ( = ?auto_9011 ?auto_9015 ) ) ( not ( = ?auto_9010 ?auto_9015 ) ) ( ON ?auto_9011 ?auto_9010 ) ( ON ?auto_9012 ?auto_9011 ) ( ON ?auto_9013 ?auto_9012 ) ( ON ?auto_9014 ?auto_9013 ) ( CLEAR ?auto_9014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_9014 ?auto_9013 ?auto_9012 ?auto_9011 ?auto_9010 )
      ( MAKE-5PILE ?auto_9010 ?auto_9011 ?auto_9012 ?auto_9013 ?auto_9014 ) )
  )

)

