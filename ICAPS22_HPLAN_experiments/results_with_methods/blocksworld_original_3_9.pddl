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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3873 - BLOCK
      ?auto_3874 - BLOCK
      ?auto_3875 - BLOCK
    )
    :vars
    (
      ?auto_3876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3876 ?auto_3875 ) ( CLEAR ?auto_3876 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3873 ) ( ON ?auto_3874 ?auto_3873 ) ( ON ?auto_3875 ?auto_3874 ) ( not ( = ?auto_3873 ?auto_3874 ) ) ( not ( = ?auto_3873 ?auto_3875 ) ) ( not ( = ?auto_3873 ?auto_3876 ) ) ( not ( = ?auto_3874 ?auto_3875 ) ) ( not ( = ?auto_3874 ?auto_3876 ) ) ( not ( = ?auto_3875 ?auto_3876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3876 ?auto_3875 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3878 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3879 - BLOCK
    )
    :vars
    (
      ?auto_3880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3879 ?auto_3880 ) ( CLEAR ?auto_3879 ) ( HAND-EMPTY ) ( not ( = ?auto_3879 ?auto_3880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3879 ?auto_3880 )
      ( MAKE-1PILE ?auto_3879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3883 - BLOCK
      ?auto_3884 - BLOCK
    )
    :vars
    (
      ?auto_3885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3885 ?auto_3884 ) ( CLEAR ?auto_3885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3883 ) ( ON ?auto_3884 ?auto_3883 ) ( not ( = ?auto_3883 ?auto_3884 ) ) ( not ( = ?auto_3883 ?auto_3885 ) ) ( not ( = ?auto_3884 ?auto_3885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3885 ?auto_3884 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3886 - BLOCK
      ?auto_3887 - BLOCK
    )
    :vars
    (
      ?auto_3888 - BLOCK
      ?auto_3889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3888 ?auto_3887 ) ( CLEAR ?auto_3888 ) ( ON-TABLE ?auto_3886 ) ( ON ?auto_3887 ?auto_3886 ) ( not ( = ?auto_3886 ?auto_3887 ) ) ( not ( = ?auto_3886 ?auto_3888 ) ) ( not ( = ?auto_3887 ?auto_3888 ) ) ( HOLDING ?auto_3889 ) ( not ( = ?auto_3886 ?auto_3889 ) ) ( not ( = ?auto_3887 ?auto_3889 ) ) ( not ( = ?auto_3888 ?auto_3889 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3889 )
      ( MAKE-2PILE ?auto_3886 ?auto_3887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3890 - BLOCK
      ?auto_3891 - BLOCK
    )
    :vars
    (
      ?auto_3893 - BLOCK
      ?auto_3892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3893 ?auto_3891 ) ( ON-TABLE ?auto_3890 ) ( ON ?auto_3891 ?auto_3890 ) ( not ( = ?auto_3890 ?auto_3891 ) ) ( not ( = ?auto_3890 ?auto_3893 ) ) ( not ( = ?auto_3891 ?auto_3893 ) ) ( not ( = ?auto_3890 ?auto_3892 ) ) ( not ( = ?auto_3891 ?auto_3892 ) ) ( not ( = ?auto_3893 ?auto_3892 ) ) ( ON ?auto_3892 ?auto_3893 ) ( CLEAR ?auto_3892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3890 ?auto_3891 ?auto_3893 )
      ( MAKE-2PILE ?auto_3890 ?auto_3891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3896 - BLOCK
      ?auto_3897 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3897 ) ( CLEAR ?auto_3896 ) ( ON-TABLE ?auto_3896 ) ( not ( = ?auto_3896 ?auto_3897 ) ) )
    :subtasks
    ( ( !STACK ?auto_3897 ?auto_3896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3898 - BLOCK
      ?auto_3899 - BLOCK
    )
    :vars
    (
      ?auto_3900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3898 ) ( ON-TABLE ?auto_3898 ) ( not ( = ?auto_3898 ?auto_3899 ) ) ( ON ?auto_3899 ?auto_3900 ) ( CLEAR ?auto_3899 ) ( HAND-EMPTY ) ( not ( = ?auto_3898 ?auto_3900 ) ) ( not ( = ?auto_3899 ?auto_3900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3899 ?auto_3900 )
      ( MAKE-2PILE ?auto_3898 ?auto_3899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3901 - BLOCK
      ?auto_3902 - BLOCK
    )
    :vars
    (
      ?auto_3903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3901 ?auto_3902 ) ) ( ON ?auto_3902 ?auto_3903 ) ( CLEAR ?auto_3902 ) ( not ( = ?auto_3901 ?auto_3903 ) ) ( not ( = ?auto_3902 ?auto_3903 ) ) ( HOLDING ?auto_3901 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3901 )
      ( MAKE-2PILE ?auto_3901 ?auto_3902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3904 - BLOCK
      ?auto_3905 - BLOCK
    )
    :vars
    (
      ?auto_3906 - BLOCK
      ?auto_3907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3904 ?auto_3905 ) ) ( ON ?auto_3905 ?auto_3906 ) ( not ( = ?auto_3904 ?auto_3906 ) ) ( not ( = ?auto_3905 ?auto_3906 ) ) ( ON ?auto_3904 ?auto_3905 ) ( CLEAR ?auto_3904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3907 ) ( ON ?auto_3906 ?auto_3907 ) ( not ( = ?auto_3907 ?auto_3906 ) ) ( not ( = ?auto_3907 ?auto_3905 ) ) ( not ( = ?auto_3907 ?auto_3904 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3907 ?auto_3906 ?auto_3905 )
      ( MAKE-2PILE ?auto_3904 ?auto_3905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3909 - BLOCK
    )
    :vars
    (
      ?auto_3910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3910 ?auto_3909 ) ( CLEAR ?auto_3910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3909 ) ( not ( = ?auto_3909 ?auto_3910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3910 ?auto_3909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3911 - BLOCK
    )
    :vars
    (
      ?auto_3912 - BLOCK
      ?auto_3913 - BLOCK
      ?auto_3914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3912 ?auto_3911 ) ( CLEAR ?auto_3912 ) ( ON-TABLE ?auto_3911 ) ( not ( = ?auto_3911 ?auto_3912 ) ) ( HOLDING ?auto_3913 ) ( CLEAR ?auto_3914 ) ( not ( = ?auto_3911 ?auto_3913 ) ) ( not ( = ?auto_3911 ?auto_3914 ) ) ( not ( = ?auto_3912 ?auto_3913 ) ) ( not ( = ?auto_3912 ?auto_3914 ) ) ( not ( = ?auto_3913 ?auto_3914 ) ) )
    :subtasks
    ( ( !STACK ?auto_3913 ?auto_3914 )
      ( MAKE-1PILE ?auto_3911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3915 - BLOCK
    )
    :vars
    (
      ?auto_3917 - BLOCK
      ?auto_3918 - BLOCK
      ?auto_3916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3917 ?auto_3915 ) ( ON-TABLE ?auto_3915 ) ( not ( = ?auto_3915 ?auto_3917 ) ) ( CLEAR ?auto_3918 ) ( not ( = ?auto_3915 ?auto_3916 ) ) ( not ( = ?auto_3915 ?auto_3918 ) ) ( not ( = ?auto_3917 ?auto_3916 ) ) ( not ( = ?auto_3917 ?auto_3918 ) ) ( not ( = ?auto_3916 ?auto_3918 ) ) ( ON ?auto_3916 ?auto_3917 ) ( CLEAR ?auto_3916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3915 ?auto_3917 )
      ( MAKE-1PILE ?auto_3915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3919 - BLOCK
    )
    :vars
    (
      ?auto_3922 - BLOCK
      ?auto_3921 - BLOCK
      ?auto_3920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3922 ?auto_3919 ) ( ON-TABLE ?auto_3919 ) ( not ( = ?auto_3919 ?auto_3922 ) ) ( not ( = ?auto_3919 ?auto_3921 ) ) ( not ( = ?auto_3919 ?auto_3920 ) ) ( not ( = ?auto_3922 ?auto_3921 ) ) ( not ( = ?auto_3922 ?auto_3920 ) ) ( not ( = ?auto_3921 ?auto_3920 ) ) ( ON ?auto_3921 ?auto_3922 ) ( CLEAR ?auto_3921 ) ( HOLDING ?auto_3920 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3920 )
      ( MAKE-1PILE ?auto_3919 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3923 - BLOCK
    )
    :vars
    (
      ?auto_3924 - BLOCK
      ?auto_3926 - BLOCK
      ?auto_3925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3924 ?auto_3923 ) ( ON-TABLE ?auto_3923 ) ( not ( = ?auto_3923 ?auto_3924 ) ) ( not ( = ?auto_3923 ?auto_3926 ) ) ( not ( = ?auto_3923 ?auto_3925 ) ) ( not ( = ?auto_3924 ?auto_3926 ) ) ( not ( = ?auto_3924 ?auto_3925 ) ) ( not ( = ?auto_3926 ?auto_3925 ) ) ( ON ?auto_3926 ?auto_3924 ) ( ON ?auto_3925 ?auto_3926 ) ( CLEAR ?auto_3925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3923 ?auto_3924 ?auto_3926 )
      ( MAKE-1PILE ?auto_3923 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3930 - BLOCK
      ?auto_3931 - BLOCK
      ?auto_3932 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3932 ) ( CLEAR ?auto_3931 ) ( ON-TABLE ?auto_3930 ) ( ON ?auto_3931 ?auto_3930 ) ( not ( = ?auto_3930 ?auto_3931 ) ) ( not ( = ?auto_3930 ?auto_3932 ) ) ( not ( = ?auto_3931 ?auto_3932 ) ) )
    :subtasks
    ( ( !STACK ?auto_3932 ?auto_3931 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3933 - BLOCK
      ?auto_3934 - BLOCK
      ?auto_3935 - BLOCK
    )
    :vars
    (
      ?auto_3936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3934 ) ( ON-TABLE ?auto_3933 ) ( ON ?auto_3934 ?auto_3933 ) ( not ( = ?auto_3933 ?auto_3934 ) ) ( not ( = ?auto_3933 ?auto_3935 ) ) ( not ( = ?auto_3934 ?auto_3935 ) ) ( ON ?auto_3935 ?auto_3936 ) ( CLEAR ?auto_3935 ) ( HAND-EMPTY ) ( not ( = ?auto_3933 ?auto_3936 ) ) ( not ( = ?auto_3934 ?auto_3936 ) ) ( not ( = ?auto_3935 ?auto_3936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3935 ?auto_3936 )
      ( MAKE-3PILE ?auto_3933 ?auto_3934 ?auto_3935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3937 - BLOCK
      ?auto_3938 - BLOCK
      ?auto_3939 - BLOCK
    )
    :vars
    (
      ?auto_3940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3937 ) ( not ( = ?auto_3937 ?auto_3938 ) ) ( not ( = ?auto_3937 ?auto_3939 ) ) ( not ( = ?auto_3938 ?auto_3939 ) ) ( ON ?auto_3939 ?auto_3940 ) ( CLEAR ?auto_3939 ) ( not ( = ?auto_3937 ?auto_3940 ) ) ( not ( = ?auto_3938 ?auto_3940 ) ) ( not ( = ?auto_3939 ?auto_3940 ) ) ( HOLDING ?auto_3938 ) ( CLEAR ?auto_3937 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3937 ?auto_3938 )
      ( MAKE-3PILE ?auto_3937 ?auto_3938 ?auto_3939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3941 - BLOCK
      ?auto_3942 - BLOCK
      ?auto_3943 - BLOCK
    )
    :vars
    (
      ?auto_3944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3941 ) ( not ( = ?auto_3941 ?auto_3942 ) ) ( not ( = ?auto_3941 ?auto_3943 ) ) ( not ( = ?auto_3942 ?auto_3943 ) ) ( ON ?auto_3943 ?auto_3944 ) ( not ( = ?auto_3941 ?auto_3944 ) ) ( not ( = ?auto_3942 ?auto_3944 ) ) ( not ( = ?auto_3943 ?auto_3944 ) ) ( CLEAR ?auto_3941 ) ( ON ?auto_3942 ?auto_3943 ) ( CLEAR ?auto_3942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3944 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3944 ?auto_3943 )
      ( MAKE-3PILE ?auto_3941 ?auto_3942 ?auto_3943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3945 - BLOCK
      ?auto_3946 - BLOCK
      ?auto_3947 - BLOCK
    )
    :vars
    (
      ?auto_3948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3945 ?auto_3946 ) ) ( not ( = ?auto_3945 ?auto_3947 ) ) ( not ( = ?auto_3946 ?auto_3947 ) ) ( ON ?auto_3947 ?auto_3948 ) ( not ( = ?auto_3945 ?auto_3948 ) ) ( not ( = ?auto_3946 ?auto_3948 ) ) ( not ( = ?auto_3947 ?auto_3948 ) ) ( ON ?auto_3946 ?auto_3947 ) ( CLEAR ?auto_3946 ) ( ON-TABLE ?auto_3948 ) ( HOLDING ?auto_3945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3945 )
      ( MAKE-3PILE ?auto_3945 ?auto_3946 ?auto_3947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3949 - BLOCK
      ?auto_3950 - BLOCK
      ?auto_3951 - BLOCK
    )
    :vars
    (
      ?auto_3952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3949 ?auto_3950 ) ) ( not ( = ?auto_3949 ?auto_3951 ) ) ( not ( = ?auto_3950 ?auto_3951 ) ) ( ON ?auto_3951 ?auto_3952 ) ( not ( = ?auto_3949 ?auto_3952 ) ) ( not ( = ?auto_3950 ?auto_3952 ) ) ( not ( = ?auto_3951 ?auto_3952 ) ) ( ON ?auto_3950 ?auto_3951 ) ( ON-TABLE ?auto_3952 ) ( ON ?auto_3949 ?auto_3950 ) ( CLEAR ?auto_3949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3952 ?auto_3951 ?auto_3950 )
      ( MAKE-3PILE ?auto_3949 ?auto_3950 ?auto_3951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3955 - BLOCK
      ?auto_3956 - BLOCK
    )
    :vars
    (
      ?auto_3957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3957 ?auto_3956 ) ( CLEAR ?auto_3957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3955 ) ( ON ?auto_3956 ?auto_3955 ) ( not ( = ?auto_3955 ?auto_3956 ) ) ( not ( = ?auto_3955 ?auto_3957 ) ) ( not ( = ?auto_3956 ?auto_3957 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3957 ?auto_3956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3965 - BLOCK
      ?auto_3966 - BLOCK
    )
    :vars
    (
      ?auto_3967 - BLOCK
      ?auto_3968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3965 ) ( not ( = ?auto_3965 ?auto_3966 ) ) ( not ( = ?auto_3965 ?auto_3967 ) ) ( not ( = ?auto_3966 ?auto_3967 ) ) ( ON ?auto_3967 ?auto_3968 ) ( CLEAR ?auto_3967 ) ( not ( = ?auto_3965 ?auto_3968 ) ) ( not ( = ?auto_3966 ?auto_3968 ) ) ( not ( = ?auto_3967 ?auto_3968 ) ) ( HOLDING ?auto_3966 ) ( CLEAR ?auto_3965 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3965 ?auto_3966 ?auto_3967 )
      ( MAKE-2PILE ?auto_3965 ?auto_3966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3969 - BLOCK
      ?auto_3970 - BLOCK
    )
    :vars
    (
      ?auto_3972 - BLOCK
      ?auto_3971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3969 ) ( not ( = ?auto_3969 ?auto_3970 ) ) ( not ( = ?auto_3969 ?auto_3972 ) ) ( not ( = ?auto_3970 ?auto_3972 ) ) ( ON ?auto_3972 ?auto_3971 ) ( not ( = ?auto_3969 ?auto_3971 ) ) ( not ( = ?auto_3970 ?auto_3971 ) ) ( not ( = ?auto_3972 ?auto_3971 ) ) ( CLEAR ?auto_3969 ) ( ON ?auto_3970 ?auto_3972 ) ( CLEAR ?auto_3970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3971 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3971 ?auto_3972 )
      ( MAKE-2PILE ?auto_3969 ?auto_3970 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3973 - BLOCK
      ?auto_3974 - BLOCK
    )
    :vars
    (
      ?auto_3976 - BLOCK
      ?auto_3975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3973 ?auto_3974 ) ) ( not ( = ?auto_3973 ?auto_3976 ) ) ( not ( = ?auto_3974 ?auto_3976 ) ) ( ON ?auto_3976 ?auto_3975 ) ( not ( = ?auto_3973 ?auto_3975 ) ) ( not ( = ?auto_3974 ?auto_3975 ) ) ( not ( = ?auto_3976 ?auto_3975 ) ) ( ON ?auto_3974 ?auto_3976 ) ( CLEAR ?auto_3974 ) ( ON-TABLE ?auto_3975 ) ( HOLDING ?auto_3973 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3973 )
      ( MAKE-2PILE ?auto_3973 ?auto_3974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3977 - BLOCK
      ?auto_3978 - BLOCK
    )
    :vars
    (
      ?auto_3980 - BLOCK
      ?auto_3979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3977 ?auto_3978 ) ) ( not ( = ?auto_3977 ?auto_3980 ) ) ( not ( = ?auto_3978 ?auto_3980 ) ) ( ON ?auto_3980 ?auto_3979 ) ( not ( = ?auto_3977 ?auto_3979 ) ) ( not ( = ?auto_3978 ?auto_3979 ) ) ( not ( = ?auto_3980 ?auto_3979 ) ) ( ON ?auto_3978 ?auto_3980 ) ( ON-TABLE ?auto_3979 ) ( ON ?auto_3977 ?auto_3978 ) ( CLEAR ?auto_3977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3979 ?auto_3980 ?auto_3978 )
      ( MAKE-2PILE ?auto_3977 ?auto_3978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3982 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3982 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3983 - BLOCK
    )
    :vars
    (
      ?auto_3984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3983 ?auto_3984 ) ( CLEAR ?auto_3983 ) ( HAND-EMPTY ) ( not ( = ?auto_3983 ?auto_3984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3983 ?auto_3984 )
      ( MAKE-1PILE ?auto_3983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3985 - BLOCK
    )
    :vars
    (
      ?auto_3986 - BLOCK
      ?auto_3987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3985 ?auto_3986 ) ) ( HOLDING ?auto_3985 ) ( CLEAR ?auto_3986 ) ( ON-TABLE ?auto_3987 ) ( ON ?auto_3986 ?auto_3987 ) ( not ( = ?auto_3987 ?auto_3986 ) ) ( not ( = ?auto_3987 ?auto_3985 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3987 ?auto_3986 ?auto_3985 )
      ( MAKE-1PILE ?auto_3985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3988 - BLOCK
    )
    :vars
    (
      ?auto_3989 - BLOCK
      ?auto_3990 - BLOCK
      ?auto_3991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3988 ?auto_3989 ) ) ( CLEAR ?auto_3989 ) ( ON-TABLE ?auto_3990 ) ( ON ?auto_3989 ?auto_3990 ) ( not ( = ?auto_3990 ?auto_3989 ) ) ( not ( = ?auto_3990 ?auto_3988 ) ) ( ON ?auto_3988 ?auto_3991 ) ( CLEAR ?auto_3988 ) ( HAND-EMPTY ) ( not ( = ?auto_3988 ?auto_3991 ) ) ( not ( = ?auto_3989 ?auto_3991 ) ) ( not ( = ?auto_3990 ?auto_3991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3988 ?auto_3991 )
      ( MAKE-1PILE ?auto_3988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3992 - BLOCK
    )
    :vars
    (
      ?auto_3995 - BLOCK
      ?auto_3993 - BLOCK
      ?auto_3994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3992 ?auto_3995 ) ) ( ON-TABLE ?auto_3993 ) ( not ( = ?auto_3993 ?auto_3995 ) ) ( not ( = ?auto_3993 ?auto_3992 ) ) ( ON ?auto_3992 ?auto_3994 ) ( CLEAR ?auto_3992 ) ( not ( = ?auto_3992 ?auto_3994 ) ) ( not ( = ?auto_3995 ?auto_3994 ) ) ( not ( = ?auto_3993 ?auto_3994 ) ) ( HOLDING ?auto_3995 ) ( CLEAR ?auto_3993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3993 ?auto_3995 )
      ( MAKE-1PILE ?auto_3992 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3996 - BLOCK
    )
    :vars
    (
      ?auto_3997 - BLOCK
      ?auto_3999 - BLOCK
      ?auto_3998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3996 ?auto_3997 ) ) ( ON-TABLE ?auto_3999 ) ( not ( = ?auto_3999 ?auto_3997 ) ) ( not ( = ?auto_3999 ?auto_3996 ) ) ( ON ?auto_3996 ?auto_3998 ) ( not ( = ?auto_3996 ?auto_3998 ) ) ( not ( = ?auto_3997 ?auto_3998 ) ) ( not ( = ?auto_3999 ?auto_3998 ) ) ( CLEAR ?auto_3999 ) ( ON ?auto_3997 ?auto_3996 ) ( CLEAR ?auto_3997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3998 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3998 ?auto_3996 )
      ( MAKE-1PILE ?auto_3996 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4000 - BLOCK
    )
    :vars
    (
      ?auto_4001 - BLOCK
      ?auto_4003 - BLOCK
      ?auto_4002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4000 ?auto_4001 ) ) ( not ( = ?auto_4003 ?auto_4001 ) ) ( not ( = ?auto_4003 ?auto_4000 ) ) ( ON ?auto_4000 ?auto_4002 ) ( not ( = ?auto_4000 ?auto_4002 ) ) ( not ( = ?auto_4001 ?auto_4002 ) ) ( not ( = ?auto_4003 ?auto_4002 ) ) ( ON ?auto_4001 ?auto_4000 ) ( CLEAR ?auto_4001 ) ( ON-TABLE ?auto_4002 ) ( HOLDING ?auto_4003 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4003 )
      ( MAKE-1PILE ?auto_4000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4004 - BLOCK
    )
    :vars
    (
      ?auto_4006 - BLOCK
      ?auto_4007 - BLOCK
      ?auto_4005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4004 ?auto_4006 ) ) ( not ( = ?auto_4007 ?auto_4006 ) ) ( not ( = ?auto_4007 ?auto_4004 ) ) ( ON ?auto_4004 ?auto_4005 ) ( not ( = ?auto_4004 ?auto_4005 ) ) ( not ( = ?auto_4006 ?auto_4005 ) ) ( not ( = ?auto_4007 ?auto_4005 ) ) ( ON ?auto_4006 ?auto_4004 ) ( ON-TABLE ?auto_4005 ) ( ON ?auto_4007 ?auto_4006 ) ( CLEAR ?auto_4007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4005 ?auto_4004 ?auto_4006 )
      ( MAKE-1PILE ?auto_4004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4009 - BLOCK
    )
    :vars
    (
      ?auto_4010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4010 ?auto_4009 ) ( CLEAR ?auto_4010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4009 ) ( not ( = ?auto_4009 ?auto_4010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4010 ?auto_4009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4011 - BLOCK
    )
    :vars
    (
      ?auto_4012 - BLOCK
      ?auto_4013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4012 ?auto_4011 ) ( CLEAR ?auto_4012 ) ( ON-TABLE ?auto_4011 ) ( not ( = ?auto_4011 ?auto_4012 ) ) ( HOLDING ?auto_4013 ) ( not ( = ?auto_4011 ?auto_4013 ) ) ( not ( = ?auto_4012 ?auto_4013 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4013 )
      ( MAKE-1PILE ?auto_4011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4014 - BLOCK
    )
    :vars
    (
      ?auto_4016 - BLOCK
      ?auto_4015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4016 ?auto_4014 ) ( ON-TABLE ?auto_4014 ) ( not ( = ?auto_4014 ?auto_4016 ) ) ( not ( = ?auto_4014 ?auto_4015 ) ) ( not ( = ?auto_4016 ?auto_4015 ) ) ( ON ?auto_4015 ?auto_4016 ) ( CLEAR ?auto_4015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4014 ?auto_4016 )
      ( MAKE-1PILE ?auto_4014 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4017 - BLOCK
    )
    :vars
    (
      ?auto_4018 - BLOCK
      ?auto_4019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4018 ?auto_4017 ) ( ON-TABLE ?auto_4017 ) ( not ( = ?auto_4017 ?auto_4018 ) ) ( not ( = ?auto_4017 ?auto_4019 ) ) ( not ( = ?auto_4018 ?auto_4019 ) ) ( HOLDING ?auto_4019 ) ( CLEAR ?auto_4018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4017 ?auto_4018 ?auto_4019 )
      ( MAKE-1PILE ?auto_4017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4020 - BLOCK
    )
    :vars
    (
      ?auto_4022 - BLOCK
      ?auto_4021 - BLOCK
      ?auto_4023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4022 ?auto_4020 ) ( ON-TABLE ?auto_4020 ) ( not ( = ?auto_4020 ?auto_4022 ) ) ( not ( = ?auto_4020 ?auto_4021 ) ) ( not ( = ?auto_4022 ?auto_4021 ) ) ( CLEAR ?auto_4022 ) ( ON ?auto_4021 ?auto_4023 ) ( CLEAR ?auto_4021 ) ( HAND-EMPTY ) ( not ( = ?auto_4020 ?auto_4023 ) ) ( not ( = ?auto_4022 ?auto_4023 ) ) ( not ( = ?auto_4021 ?auto_4023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4021 ?auto_4023 )
      ( MAKE-1PILE ?auto_4020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4032 - BLOCK
    )
    :vars
    (
      ?auto_4035 - BLOCK
      ?auto_4033 - BLOCK
      ?auto_4034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4032 ?auto_4035 ) ) ( not ( = ?auto_4032 ?auto_4033 ) ) ( not ( = ?auto_4035 ?auto_4033 ) ) ( ON ?auto_4033 ?auto_4034 ) ( not ( = ?auto_4032 ?auto_4034 ) ) ( not ( = ?auto_4035 ?auto_4034 ) ) ( not ( = ?auto_4033 ?auto_4034 ) ) ( ON ?auto_4035 ?auto_4033 ) ( CLEAR ?auto_4035 ) ( HOLDING ?auto_4032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4032 ?auto_4035 )
      ( MAKE-1PILE ?auto_4032 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4036 - BLOCK
    )
    :vars
    (
      ?auto_4038 - BLOCK
      ?auto_4037 - BLOCK
      ?auto_4039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4036 ?auto_4038 ) ) ( not ( = ?auto_4036 ?auto_4037 ) ) ( not ( = ?auto_4038 ?auto_4037 ) ) ( ON ?auto_4037 ?auto_4039 ) ( not ( = ?auto_4036 ?auto_4039 ) ) ( not ( = ?auto_4038 ?auto_4039 ) ) ( not ( = ?auto_4037 ?auto_4039 ) ) ( ON ?auto_4038 ?auto_4037 ) ( ON ?auto_4036 ?auto_4038 ) ( CLEAR ?auto_4036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4039 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4039 ?auto_4037 ?auto_4038 )
      ( MAKE-1PILE ?auto_4036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4042 - BLOCK
      ?auto_4043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4043 ) ( CLEAR ?auto_4042 ) ( ON-TABLE ?auto_4042 ) ( not ( = ?auto_4042 ?auto_4043 ) ) )
    :subtasks
    ( ( !STACK ?auto_4043 ?auto_4042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4044 - BLOCK
      ?auto_4045 - BLOCK
    )
    :vars
    (
      ?auto_4046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4044 ) ( ON-TABLE ?auto_4044 ) ( not ( = ?auto_4044 ?auto_4045 ) ) ( ON ?auto_4045 ?auto_4046 ) ( CLEAR ?auto_4045 ) ( HAND-EMPTY ) ( not ( = ?auto_4044 ?auto_4046 ) ) ( not ( = ?auto_4045 ?auto_4046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4045 ?auto_4046 )
      ( MAKE-2PILE ?auto_4044 ?auto_4045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4047 - BLOCK
      ?auto_4048 - BLOCK
    )
    :vars
    (
      ?auto_4049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4047 ?auto_4048 ) ) ( ON ?auto_4048 ?auto_4049 ) ( CLEAR ?auto_4048 ) ( not ( = ?auto_4047 ?auto_4049 ) ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( HOLDING ?auto_4047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4047 )
      ( MAKE-2PILE ?auto_4047 ?auto_4048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4050 - BLOCK
      ?auto_4051 - BLOCK
    )
    :vars
    (
      ?auto_4052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4050 ?auto_4051 ) ) ( ON ?auto_4051 ?auto_4052 ) ( not ( = ?auto_4050 ?auto_4052 ) ) ( not ( = ?auto_4051 ?auto_4052 ) ) ( ON ?auto_4050 ?auto_4051 ) ( CLEAR ?auto_4050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4052 ?auto_4051 )
      ( MAKE-2PILE ?auto_4050 ?auto_4051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4053 - BLOCK
      ?auto_4054 - BLOCK
    )
    :vars
    (
      ?auto_4055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4053 ?auto_4054 ) ) ( ON ?auto_4054 ?auto_4055 ) ( not ( = ?auto_4053 ?auto_4055 ) ) ( not ( = ?auto_4054 ?auto_4055 ) ) ( ON-TABLE ?auto_4055 ) ( HOLDING ?auto_4053 ) ( CLEAR ?auto_4054 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4055 ?auto_4054 ?auto_4053 )
      ( MAKE-2PILE ?auto_4053 ?auto_4054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4056 - BLOCK
      ?auto_4057 - BLOCK
    )
    :vars
    (
      ?auto_4058 - BLOCK
      ?auto_4059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4056 ?auto_4057 ) ) ( ON ?auto_4057 ?auto_4058 ) ( not ( = ?auto_4056 ?auto_4058 ) ) ( not ( = ?auto_4057 ?auto_4058 ) ) ( ON-TABLE ?auto_4058 ) ( CLEAR ?auto_4057 ) ( ON ?auto_4056 ?auto_4059 ) ( CLEAR ?auto_4056 ) ( HAND-EMPTY ) ( not ( = ?auto_4056 ?auto_4059 ) ) ( not ( = ?auto_4057 ?auto_4059 ) ) ( not ( = ?auto_4058 ?auto_4059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4056 ?auto_4059 )
      ( MAKE-2PILE ?auto_4056 ?auto_4057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4060 - BLOCK
      ?auto_4061 - BLOCK
    )
    :vars
    (
      ?auto_4062 - BLOCK
      ?auto_4063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4060 ?auto_4061 ) ) ( not ( = ?auto_4060 ?auto_4062 ) ) ( not ( = ?auto_4061 ?auto_4062 ) ) ( ON-TABLE ?auto_4062 ) ( ON ?auto_4060 ?auto_4063 ) ( CLEAR ?auto_4060 ) ( not ( = ?auto_4060 ?auto_4063 ) ) ( not ( = ?auto_4061 ?auto_4063 ) ) ( not ( = ?auto_4062 ?auto_4063 ) ) ( HOLDING ?auto_4061 ) ( CLEAR ?auto_4062 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4062 ?auto_4061 )
      ( MAKE-2PILE ?auto_4060 ?auto_4061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4064 - BLOCK
      ?auto_4065 - BLOCK
    )
    :vars
    (
      ?auto_4066 - BLOCK
      ?auto_4067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4064 ?auto_4065 ) ) ( not ( = ?auto_4064 ?auto_4066 ) ) ( not ( = ?auto_4065 ?auto_4066 ) ) ( ON-TABLE ?auto_4066 ) ( ON ?auto_4064 ?auto_4067 ) ( not ( = ?auto_4064 ?auto_4067 ) ) ( not ( = ?auto_4065 ?auto_4067 ) ) ( not ( = ?auto_4066 ?auto_4067 ) ) ( CLEAR ?auto_4066 ) ( ON ?auto_4065 ?auto_4064 ) ( CLEAR ?auto_4065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4067 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4067 ?auto_4064 )
      ( MAKE-2PILE ?auto_4064 ?auto_4065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4068 - BLOCK
      ?auto_4069 - BLOCK
    )
    :vars
    (
      ?auto_4071 - BLOCK
      ?auto_4070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4068 ?auto_4069 ) ) ( not ( = ?auto_4068 ?auto_4071 ) ) ( not ( = ?auto_4069 ?auto_4071 ) ) ( ON ?auto_4068 ?auto_4070 ) ( not ( = ?auto_4068 ?auto_4070 ) ) ( not ( = ?auto_4069 ?auto_4070 ) ) ( not ( = ?auto_4071 ?auto_4070 ) ) ( ON ?auto_4069 ?auto_4068 ) ( CLEAR ?auto_4069 ) ( ON-TABLE ?auto_4070 ) ( HOLDING ?auto_4071 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4071 )
      ( MAKE-2PILE ?auto_4068 ?auto_4069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4072 - BLOCK
      ?auto_4073 - BLOCK
    )
    :vars
    (
      ?auto_4075 - BLOCK
      ?auto_4074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4072 ?auto_4073 ) ) ( not ( = ?auto_4072 ?auto_4075 ) ) ( not ( = ?auto_4073 ?auto_4075 ) ) ( ON ?auto_4072 ?auto_4074 ) ( not ( = ?auto_4072 ?auto_4074 ) ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4075 ?auto_4074 ) ) ( ON ?auto_4073 ?auto_4072 ) ( ON-TABLE ?auto_4074 ) ( ON ?auto_4075 ?auto_4073 ) ( CLEAR ?auto_4075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4074 ?auto_4072 ?auto_4073 )
      ( MAKE-2PILE ?auto_4072 ?auto_4073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4079 - BLOCK
      ?auto_4080 - BLOCK
      ?auto_4081 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4081 ) ( CLEAR ?auto_4080 ) ( ON-TABLE ?auto_4079 ) ( ON ?auto_4080 ?auto_4079 ) ( not ( = ?auto_4079 ?auto_4080 ) ) ( not ( = ?auto_4079 ?auto_4081 ) ) ( not ( = ?auto_4080 ?auto_4081 ) ) )
    :subtasks
    ( ( !STACK ?auto_4081 ?auto_4080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4082 - BLOCK
      ?auto_4083 - BLOCK
      ?auto_4084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4083 ) ( ON-TABLE ?auto_4082 ) ( ON ?auto_4083 ?auto_4082 ) ( not ( = ?auto_4082 ?auto_4083 ) ) ( not ( = ?auto_4082 ?auto_4084 ) ) ( not ( = ?auto_4083 ?auto_4084 ) ) ( ON-TABLE ?auto_4084 ) ( CLEAR ?auto_4084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_4084 )
      ( MAKE-3PILE ?auto_4082 ?auto_4083 ?auto_4084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4085 - BLOCK
      ?auto_4086 - BLOCK
      ?auto_4087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4085 ) ( not ( = ?auto_4085 ?auto_4086 ) ) ( not ( = ?auto_4085 ?auto_4087 ) ) ( not ( = ?auto_4086 ?auto_4087 ) ) ( ON-TABLE ?auto_4087 ) ( CLEAR ?auto_4087 ) ( HOLDING ?auto_4086 ) ( CLEAR ?auto_4085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4085 ?auto_4086 )
      ( MAKE-3PILE ?auto_4085 ?auto_4086 ?auto_4087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4088 - BLOCK
      ?auto_4089 - BLOCK
      ?auto_4090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4088 ) ( not ( = ?auto_4088 ?auto_4089 ) ) ( not ( = ?auto_4088 ?auto_4090 ) ) ( not ( = ?auto_4089 ?auto_4090 ) ) ( ON-TABLE ?auto_4090 ) ( CLEAR ?auto_4088 ) ( ON ?auto_4089 ?auto_4090 ) ( CLEAR ?auto_4089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4090 )
      ( MAKE-3PILE ?auto_4088 ?auto_4089 ?auto_4090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4091 - BLOCK
      ?auto_4092 - BLOCK
      ?auto_4093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4091 ?auto_4092 ) ) ( not ( = ?auto_4091 ?auto_4093 ) ) ( not ( = ?auto_4092 ?auto_4093 ) ) ( ON-TABLE ?auto_4093 ) ( ON ?auto_4092 ?auto_4093 ) ( CLEAR ?auto_4092 ) ( HOLDING ?auto_4091 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4091 )
      ( MAKE-3PILE ?auto_4091 ?auto_4092 ?auto_4093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4094 - BLOCK
      ?auto_4095 - BLOCK
      ?auto_4096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4094 ?auto_4095 ) ) ( not ( = ?auto_4094 ?auto_4096 ) ) ( not ( = ?auto_4095 ?auto_4096 ) ) ( ON-TABLE ?auto_4096 ) ( ON ?auto_4095 ?auto_4096 ) ( ON ?auto_4094 ?auto_4095 ) ( CLEAR ?auto_4094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4096 ?auto_4095 )
      ( MAKE-3PILE ?auto_4094 ?auto_4095 ?auto_4096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4097 - BLOCK
      ?auto_4098 - BLOCK
      ?auto_4099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4097 ?auto_4098 ) ) ( not ( = ?auto_4097 ?auto_4099 ) ) ( not ( = ?auto_4098 ?auto_4099 ) ) ( ON-TABLE ?auto_4099 ) ( ON ?auto_4098 ?auto_4099 ) ( HOLDING ?auto_4097 ) ( CLEAR ?auto_4098 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4099 ?auto_4098 ?auto_4097 )
      ( MAKE-3PILE ?auto_4097 ?auto_4098 ?auto_4099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4100 - BLOCK
      ?auto_4101 - BLOCK
      ?auto_4102 - BLOCK
    )
    :vars
    (
      ?auto_4103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4100 ?auto_4101 ) ) ( not ( = ?auto_4100 ?auto_4102 ) ) ( not ( = ?auto_4101 ?auto_4102 ) ) ( ON-TABLE ?auto_4102 ) ( ON ?auto_4101 ?auto_4102 ) ( CLEAR ?auto_4101 ) ( ON ?auto_4100 ?auto_4103 ) ( CLEAR ?auto_4100 ) ( HAND-EMPTY ) ( not ( = ?auto_4100 ?auto_4103 ) ) ( not ( = ?auto_4101 ?auto_4103 ) ) ( not ( = ?auto_4102 ?auto_4103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4100 ?auto_4103 )
      ( MAKE-3PILE ?auto_4100 ?auto_4101 ?auto_4102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4104 - BLOCK
      ?auto_4105 - BLOCK
      ?auto_4106 - BLOCK
    )
    :vars
    (
      ?auto_4107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4104 ?auto_4105 ) ) ( not ( = ?auto_4104 ?auto_4106 ) ) ( not ( = ?auto_4105 ?auto_4106 ) ) ( ON-TABLE ?auto_4106 ) ( ON ?auto_4104 ?auto_4107 ) ( CLEAR ?auto_4104 ) ( not ( = ?auto_4104 ?auto_4107 ) ) ( not ( = ?auto_4105 ?auto_4107 ) ) ( not ( = ?auto_4106 ?auto_4107 ) ) ( HOLDING ?auto_4105 ) ( CLEAR ?auto_4106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4106 ?auto_4105 )
      ( MAKE-3PILE ?auto_4104 ?auto_4105 ?auto_4106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4108 - BLOCK
      ?auto_4109 - BLOCK
      ?auto_4110 - BLOCK
    )
    :vars
    (
      ?auto_4111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4108 ?auto_4109 ) ) ( not ( = ?auto_4108 ?auto_4110 ) ) ( not ( = ?auto_4109 ?auto_4110 ) ) ( ON-TABLE ?auto_4110 ) ( ON ?auto_4108 ?auto_4111 ) ( not ( = ?auto_4108 ?auto_4111 ) ) ( not ( = ?auto_4109 ?auto_4111 ) ) ( not ( = ?auto_4110 ?auto_4111 ) ) ( CLEAR ?auto_4110 ) ( ON ?auto_4109 ?auto_4108 ) ( CLEAR ?auto_4109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4111 ?auto_4108 )
      ( MAKE-3PILE ?auto_4108 ?auto_4109 ?auto_4110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4112 - BLOCK
      ?auto_4113 - BLOCK
      ?auto_4114 - BLOCK
    )
    :vars
    (
      ?auto_4115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4112 ?auto_4113 ) ) ( not ( = ?auto_4112 ?auto_4114 ) ) ( not ( = ?auto_4113 ?auto_4114 ) ) ( ON ?auto_4112 ?auto_4115 ) ( not ( = ?auto_4112 ?auto_4115 ) ) ( not ( = ?auto_4113 ?auto_4115 ) ) ( not ( = ?auto_4114 ?auto_4115 ) ) ( ON ?auto_4113 ?auto_4112 ) ( CLEAR ?auto_4113 ) ( ON-TABLE ?auto_4115 ) ( HOLDING ?auto_4114 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4114 )
      ( MAKE-3PILE ?auto_4112 ?auto_4113 ?auto_4114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4116 - BLOCK
      ?auto_4117 - BLOCK
      ?auto_4118 - BLOCK
    )
    :vars
    (
      ?auto_4119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4116 ?auto_4117 ) ) ( not ( = ?auto_4116 ?auto_4118 ) ) ( not ( = ?auto_4117 ?auto_4118 ) ) ( ON ?auto_4116 ?auto_4119 ) ( not ( = ?auto_4116 ?auto_4119 ) ) ( not ( = ?auto_4117 ?auto_4119 ) ) ( not ( = ?auto_4118 ?auto_4119 ) ) ( ON ?auto_4117 ?auto_4116 ) ( ON-TABLE ?auto_4119 ) ( ON ?auto_4118 ?auto_4117 ) ( CLEAR ?auto_4118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4119 ?auto_4116 ?auto_4117 )
      ( MAKE-3PILE ?auto_4116 ?auto_4117 ?auto_4118 ) )
  )

)

