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
      ?auto_132757 - BLOCK
    )
    :vars
    (
      ?auto_132758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132757 ?auto_132758 ) ( CLEAR ?auto_132757 ) ( HAND-EMPTY ) ( not ( = ?auto_132757 ?auto_132758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132757 ?auto_132758 )
      ( !PUTDOWN ?auto_132757 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132764 - BLOCK
      ?auto_132765 - BLOCK
    )
    :vars
    (
      ?auto_132766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132764 ) ( ON ?auto_132765 ?auto_132766 ) ( CLEAR ?auto_132765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132764 ) ( not ( = ?auto_132764 ?auto_132765 ) ) ( not ( = ?auto_132764 ?auto_132766 ) ) ( not ( = ?auto_132765 ?auto_132766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132765 ?auto_132766 )
      ( !STACK ?auto_132765 ?auto_132764 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132774 - BLOCK
      ?auto_132775 - BLOCK
    )
    :vars
    (
      ?auto_132776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132775 ?auto_132776 ) ( not ( = ?auto_132774 ?auto_132775 ) ) ( not ( = ?auto_132774 ?auto_132776 ) ) ( not ( = ?auto_132775 ?auto_132776 ) ) ( ON ?auto_132774 ?auto_132775 ) ( CLEAR ?auto_132774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132774 )
      ( MAKE-2PILE ?auto_132774 ?auto_132775 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132785 - BLOCK
      ?auto_132786 - BLOCK
      ?auto_132787 - BLOCK
    )
    :vars
    (
      ?auto_132788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132786 ) ( ON ?auto_132787 ?auto_132788 ) ( CLEAR ?auto_132787 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132785 ) ( ON ?auto_132786 ?auto_132785 ) ( not ( = ?auto_132785 ?auto_132786 ) ) ( not ( = ?auto_132785 ?auto_132787 ) ) ( not ( = ?auto_132785 ?auto_132788 ) ) ( not ( = ?auto_132786 ?auto_132787 ) ) ( not ( = ?auto_132786 ?auto_132788 ) ) ( not ( = ?auto_132787 ?auto_132788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132787 ?auto_132788 )
      ( !STACK ?auto_132787 ?auto_132786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132799 - BLOCK
      ?auto_132800 - BLOCK
      ?auto_132801 - BLOCK
    )
    :vars
    (
      ?auto_132802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132801 ?auto_132802 ) ( ON-TABLE ?auto_132799 ) ( not ( = ?auto_132799 ?auto_132800 ) ) ( not ( = ?auto_132799 ?auto_132801 ) ) ( not ( = ?auto_132799 ?auto_132802 ) ) ( not ( = ?auto_132800 ?auto_132801 ) ) ( not ( = ?auto_132800 ?auto_132802 ) ) ( not ( = ?auto_132801 ?auto_132802 ) ) ( CLEAR ?auto_132799 ) ( ON ?auto_132800 ?auto_132801 ) ( CLEAR ?auto_132800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132799 ?auto_132800 )
      ( MAKE-3PILE ?auto_132799 ?auto_132800 ?auto_132801 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132813 - BLOCK
      ?auto_132814 - BLOCK
      ?auto_132815 - BLOCK
    )
    :vars
    (
      ?auto_132816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132815 ?auto_132816 ) ( not ( = ?auto_132813 ?auto_132814 ) ) ( not ( = ?auto_132813 ?auto_132815 ) ) ( not ( = ?auto_132813 ?auto_132816 ) ) ( not ( = ?auto_132814 ?auto_132815 ) ) ( not ( = ?auto_132814 ?auto_132816 ) ) ( not ( = ?auto_132815 ?auto_132816 ) ) ( ON ?auto_132814 ?auto_132815 ) ( ON ?auto_132813 ?auto_132814 ) ( CLEAR ?auto_132813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132813 )
      ( MAKE-3PILE ?auto_132813 ?auto_132814 ?auto_132815 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132828 - BLOCK
      ?auto_132829 - BLOCK
      ?auto_132830 - BLOCK
      ?auto_132831 - BLOCK
    )
    :vars
    (
      ?auto_132832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132830 ) ( ON ?auto_132831 ?auto_132832 ) ( CLEAR ?auto_132831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132828 ) ( ON ?auto_132829 ?auto_132828 ) ( ON ?auto_132830 ?auto_132829 ) ( not ( = ?auto_132828 ?auto_132829 ) ) ( not ( = ?auto_132828 ?auto_132830 ) ) ( not ( = ?auto_132828 ?auto_132831 ) ) ( not ( = ?auto_132828 ?auto_132832 ) ) ( not ( = ?auto_132829 ?auto_132830 ) ) ( not ( = ?auto_132829 ?auto_132831 ) ) ( not ( = ?auto_132829 ?auto_132832 ) ) ( not ( = ?auto_132830 ?auto_132831 ) ) ( not ( = ?auto_132830 ?auto_132832 ) ) ( not ( = ?auto_132831 ?auto_132832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132831 ?auto_132832 )
      ( !STACK ?auto_132831 ?auto_132830 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132846 - BLOCK
      ?auto_132847 - BLOCK
      ?auto_132848 - BLOCK
      ?auto_132849 - BLOCK
    )
    :vars
    (
      ?auto_132850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132849 ?auto_132850 ) ( ON-TABLE ?auto_132846 ) ( ON ?auto_132847 ?auto_132846 ) ( not ( = ?auto_132846 ?auto_132847 ) ) ( not ( = ?auto_132846 ?auto_132848 ) ) ( not ( = ?auto_132846 ?auto_132849 ) ) ( not ( = ?auto_132846 ?auto_132850 ) ) ( not ( = ?auto_132847 ?auto_132848 ) ) ( not ( = ?auto_132847 ?auto_132849 ) ) ( not ( = ?auto_132847 ?auto_132850 ) ) ( not ( = ?auto_132848 ?auto_132849 ) ) ( not ( = ?auto_132848 ?auto_132850 ) ) ( not ( = ?auto_132849 ?auto_132850 ) ) ( CLEAR ?auto_132847 ) ( ON ?auto_132848 ?auto_132849 ) ( CLEAR ?auto_132848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132846 ?auto_132847 ?auto_132848 )
      ( MAKE-4PILE ?auto_132846 ?auto_132847 ?auto_132848 ?auto_132849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132864 - BLOCK
      ?auto_132865 - BLOCK
      ?auto_132866 - BLOCK
      ?auto_132867 - BLOCK
    )
    :vars
    (
      ?auto_132868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132867 ?auto_132868 ) ( ON-TABLE ?auto_132864 ) ( not ( = ?auto_132864 ?auto_132865 ) ) ( not ( = ?auto_132864 ?auto_132866 ) ) ( not ( = ?auto_132864 ?auto_132867 ) ) ( not ( = ?auto_132864 ?auto_132868 ) ) ( not ( = ?auto_132865 ?auto_132866 ) ) ( not ( = ?auto_132865 ?auto_132867 ) ) ( not ( = ?auto_132865 ?auto_132868 ) ) ( not ( = ?auto_132866 ?auto_132867 ) ) ( not ( = ?auto_132866 ?auto_132868 ) ) ( not ( = ?auto_132867 ?auto_132868 ) ) ( ON ?auto_132866 ?auto_132867 ) ( CLEAR ?auto_132864 ) ( ON ?auto_132865 ?auto_132866 ) ( CLEAR ?auto_132865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132864 ?auto_132865 )
      ( MAKE-4PILE ?auto_132864 ?auto_132865 ?auto_132866 ?auto_132867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_132882 - BLOCK
      ?auto_132883 - BLOCK
      ?auto_132884 - BLOCK
      ?auto_132885 - BLOCK
    )
    :vars
    (
      ?auto_132886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132885 ?auto_132886 ) ( not ( = ?auto_132882 ?auto_132883 ) ) ( not ( = ?auto_132882 ?auto_132884 ) ) ( not ( = ?auto_132882 ?auto_132885 ) ) ( not ( = ?auto_132882 ?auto_132886 ) ) ( not ( = ?auto_132883 ?auto_132884 ) ) ( not ( = ?auto_132883 ?auto_132885 ) ) ( not ( = ?auto_132883 ?auto_132886 ) ) ( not ( = ?auto_132884 ?auto_132885 ) ) ( not ( = ?auto_132884 ?auto_132886 ) ) ( not ( = ?auto_132885 ?auto_132886 ) ) ( ON ?auto_132884 ?auto_132885 ) ( ON ?auto_132883 ?auto_132884 ) ( ON ?auto_132882 ?auto_132883 ) ( CLEAR ?auto_132882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132882 )
      ( MAKE-4PILE ?auto_132882 ?auto_132883 ?auto_132884 ?auto_132885 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132901 - BLOCK
      ?auto_132902 - BLOCK
      ?auto_132903 - BLOCK
      ?auto_132904 - BLOCK
      ?auto_132905 - BLOCK
    )
    :vars
    (
      ?auto_132906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132904 ) ( ON ?auto_132905 ?auto_132906 ) ( CLEAR ?auto_132905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132901 ) ( ON ?auto_132902 ?auto_132901 ) ( ON ?auto_132903 ?auto_132902 ) ( ON ?auto_132904 ?auto_132903 ) ( not ( = ?auto_132901 ?auto_132902 ) ) ( not ( = ?auto_132901 ?auto_132903 ) ) ( not ( = ?auto_132901 ?auto_132904 ) ) ( not ( = ?auto_132901 ?auto_132905 ) ) ( not ( = ?auto_132901 ?auto_132906 ) ) ( not ( = ?auto_132902 ?auto_132903 ) ) ( not ( = ?auto_132902 ?auto_132904 ) ) ( not ( = ?auto_132902 ?auto_132905 ) ) ( not ( = ?auto_132902 ?auto_132906 ) ) ( not ( = ?auto_132903 ?auto_132904 ) ) ( not ( = ?auto_132903 ?auto_132905 ) ) ( not ( = ?auto_132903 ?auto_132906 ) ) ( not ( = ?auto_132904 ?auto_132905 ) ) ( not ( = ?auto_132904 ?auto_132906 ) ) ( not ( = ?auto_132905 ?auto_132906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132905 ?auto_132906 )
      ( !STACK ?auto_132905 ?auto_132904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132923 - BLOCK
      ?auto_132924 - BLOCK
      ?auto_132925 - BLOCK
      ?auto_132926 - BLOCK
      ?auto_132927 - BLOCK
    )
    :vars
    (
      ?auto_132928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132927 ?auto_132928 ) ( ON-TABLE ?auto_132923 ) ( ON ?auto_132924 ?auto_132923 ) ( ON ?auto_132925 ?auto_132924 ) ( not ( = ?auto_132923 ?auto_132924 ) ) ( not ( = ?auto_132923 ?auto_132925 ) ) ( not ( = ?auto_132923 ?auto_132926 ) ) ( not ( = ?auto_132923 ?auto_132927 ) ) ( not ( = ?auto_132923 ?auto_132928 ) ) ( not ( = ?auto_132924 ?auto_132925 ) ) ( not ( = ?auto_132924 ?auto_132926 ) ) ( not ( = ?auto_132924 ?auto_132927 ) ) ( not ( = ?auto_132924 ?auto_132928 ) ) ( not ( = ?auto_132925 ?auto_132926 ) ) ( not ( = ?auto_132925 ?auto_132927 ) ) ( not ( = ?auto_132925 ?auto_132928 ) ) ( not ( = ?auto_132926 ?auto_132927 ) ) ( not ( = ?auto_132926 ?auto_132928 ) ) ( not ( = ?auto_132927 ?auto_132928 ) ) ( CLEAR ?auto_132925 ) ( ON ?auto_132926 ?auto_132927 ) ( CLEAR ?auto_132926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_132923 ?auto_132924 ?auto_132925 ?auto_132926 )
      ( MAKE-5PILE ?auto_132923 ?auto_132924 ?auto_132925 ?auto_132926 ?auto_132927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132945 - BLOCK
      ?auto_132946 - BLOCK
      ?auto_132947 - BLOCK
      ?auto_132948 - BLOCK
      ?auto_132949 - BLOCK
    )
    :vars
    (
      ?auto_132950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132949 ?auto_132950 ) ( ON-TABLE ?auto_132945 ) ( ON ?auto_132946 ?auto_132945 ) ( not ( = ?auto_132945 ?auto_132946 ) ) ( not ( = ?auto_132945 ?auto_132947 ) ) ( not ( = ?auto_132945 ?auto_132948 ) ) ( not ( = ?auto_132945 ?auto_132949 ) ) ( not ( = ?auto_132945 ?auto_132950 ) ) ( not ( = ?auto_132946 ?auto_132947 ) ) ( not ( = ?auto_132946 ?auto_132948 ) ) ( not ( = ?auto_132946 ?auto_132949 ) ) ( not ( = ?auto_132946 ?auto_132950 ) ) ( not ( = ?auto_132947 ?auto_132948 ) ) ( not ( = ?auto_132947 ?auto_132949 ) ) ( not ( = ?auto_132947 ?auto_132950 ) ) ( not ( = ?auto_132948 ?auto_132949 ) ) ( not ( = ?auto_132948 ?auto_132950 ) ) ( not ( = ?auto_132949 ?auto_132950 ) ) ( ON ?auto_132948 ?auto_132949 ) ( CLEAR ?auto_132946 ) ( ON ?auto_132947 ?auto_132948 ) ( CLEAR ?auto_132947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_132945 ?auto_132946 ?auto_132947 )
      ( MAKE-5PILE ?auto_132945 ?auto_132946 ?auto_132947 ?auto_132948 ?auto_132949 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132967 - BLOCK
      ?auto_132968 - BLOCK
      ?auto_132969 - BLOCK
      ?auto_132970 - BLOCK
      ?auto_132971 - BLOCK
    )
    :vars
    (
      ?auto_132972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132971 ?auto_132972 ) ( ON-TABLE ?auto_132967 ) ( not ( = ?auto_132967 ?auto_132968 ) ) ( not ( = ?auto_132967 ?auto_132969 ) ) ( not ( = ?auto_132967 ?auto_132970 ) ) ( not ( = ?auto_132967 ?auto_132971 ) ) ( not ( = ?auto_132967 ?auto_132972 ) ) ( not ( = ?auto_132968 ?auto_132969 ) ) ( not ( = ?auto_132968 ?auto_132970 ) ) ( not ( = ?auto_132968 ?auto_132971 ) ) ( not ( = ?auto_132968 ?auto_132972 ) ) ( not ( = ?auto_132969 ?auto_132970 ) ) ( not ( = ?auto_132969 ?auto_132971 ) ) ( not ( = ?auto_132969 ?auto_132972 ) ) ( not ( = ?auto_132970 ?auto_132971 ) ) ( not ( = ?auto_132970 ?auto_132972 ) ) ( not ( = ?auto_132971 ?auto_132972 ) ) ( ON ?auto_132970 ?auto_132971 ) ( ON ?auto_132969 ?auto_132970 ) ( CLEAR ?auto_132967 ) ( ON ?auto_132968 ?auto_132969 ) ( CLEAR ?auto_132968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132967 ?auto_132968 )
      ( MAKE-5PILE ?auto_132967 ?auto_132968 ?auto_132969 ?auto_132970 ?auto_132971 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132989 - BLOCK
      ?auto_132990 - BLOCK
      ?auto_132991 - BLOCK
      ?auto_132992 - BLOCK
      ?auto_132993 - BLOCK
    )
    :vars
    (
      ?auto_132994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132993 ?auto_132994 ) ( not ( = ?auto_132989 ?auto_132990 ) ) ( not ( = ?auto_132989 ?auto_132991 ) ) ( not ( = ?auto_132989 ?auto_132992 ) ) ( not ( = ?auto_132989 ?auto_132993 ) ) ( not ( = ?auto_132989 ?auto_132994 ) ) ( not ( = ?auto_132990 ?auto_132991 ) ) ( not ( = ?auto_132990 ?auto_132992 ) ) ( not ( = ?auto_132990 ?auto_132993 ) ) ( not ( = ?auto_132990 ?auto_132994 ) ) ( not ( = ?auto_132991 ?auto_132992 ) ) ( not ( = ?auto_132991 ?auto_132993 ) ) ( not ( = ?auto_132991 ?auto_132994 ) ) ( not ( = ?auto_132992 ?auto_132993 ) ) ( not ( = ?auto_132992 ?auto_132994 ) ) ( not ( = ?auto_132993 ?auto_132994 ) ) ( ON ?auto_132992 ?auto_132993 ) ( ON ?auto_132991 ?auto_132992 ) ( ON ?auto_132990 ?auto_132991 ) ( ON ?auto_132989 ?auto_132990 ) ( CLEAR ?auto_132989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132989 )
      ( MAKE-5PILE ?auto_132989 ?auto_132990 ?auto_132991 ?auto_132992 ?auto_132993 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133012 - BLOCK
      ?auto_133013 - BLOCK
      ?auto_133014 - BLOCK
      ?auto_133015 - BLOCK
      ?auto_133016 - BLOCK
      ?auto_133017 - BLOCK
    )
    :vars
    (
      ?auto_133018 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_133016 ) ( ON ?auto_133017 ?auto_133018 ) ( CLEAR ?auto_133017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133012 ) ( ON ?auto_133013 ?auto_133012 ) ( ON ?auto_133014 ?auto_133013 ) ( ON ?auto_133015 ?auto_133014 ) ( ON ?auto_133016 ?auto_133015 ) ( not ( = ?auto_133012 ?auto_133013 ) ) ( not ( = ?auto_133012 ?auto_133014 ) ) ( not ( = ?auto_133012 ?auto_133015 ) ) ( not ( = ?auto_133012 ?auto_133016 ) ) ( not ( = ?auto_133012 ?auto_133017 ) ) ( not ( = ?auto_133012 ?auto_133018 ) ) ( not ( = ?auto_133013 ?auto_133014 ) ) ( not ( = ?auto_133013 ?auto_133015 ) ) ( not ( = ?auto_133013 ?auto_133016 ) ) ( not ( = ?auto_133013 ?auto_133017 ) ) ( not ( = ?auto_133013 ?auto_133018 ) ) ( not ( = ?auto_133014 ?auto_133015 ) ) ( not ( = ?auto_133014 ?auto_133016 ) ) ( not ( = ?auto_133014 ?auto_133017 ) ) ( not ( = ?auto_133014 ?auto_133018 ) ) ( not ( = ?auto_133015 ?auto_133016 ) ) ( not ( = ?auto_133015 ?auto_133017 ) ) ( not ( = ?auto_133015 ?auto_133018 ) ) ( not ( = ?auto_133016 ?auto_133017 ) ) ( not ( = ?auto_133016 ?auto_133018 ) ) ( not ( = ?auto_133017 ?auto_133018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133017 ?auto_133018 )
      ( !STACK ?auto_133017 ?auto_133016 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133038 - BLOCK
      ?auto_133039 - BLOCK
      ?auto_133040 - BLOCK
      ?auto_133041 - BLOCK
      ?auto_133042 - BLOCK
      ?auto_133043 - BLOCK
    )
    :vars
    (
      ?auto_133044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133043 ?auto_133044 ) ( ON-TABLE ?auto_133038 ) ( ON ?auto_133039 ?auto_133038 ) ( ON ?auto_133040 ?auto_133039 ) ( ON ?auto_133041 ?auto_133040 ) ( not ( = ?auto_133038 ?auto_133039 ) ) ( not ( = ?auto_133038 ?auto_133040 ) ) ( not ( = ?auto_133038 ?auto_133041 ) ) ( not ( = ?auto_133038 ?auto_133042 ) ) ( not ( = ?auto_133038 ?auto_133043 ) ) ( not ( = ?auto_133038 ?auto_133044 ) ) ( not ( = ?auto_133039 ?auto_133040 ) ) ( not ( = ?auto_133039 ?auto_133041 ) ) ( not ( = ?auto_133039 ?auto_133042 ) ) ( not ( = ?auto_133039 ?auto_133043 ) ) ( not ( = ?auto_133039 ?auto_133044 ) ) ( not ( = ?auto_133040 ?auto_133041 ) ) ( not ( = ?auto_133040 ?auto_133042 ) ) ( not ( = ?auto_133040 ?auto_133043 ) ) ( not ( = ?auto_133040 ?auto_133044 ) ) ( not ( = ?auto_133041 ?auto_133042 ) ) ( not ( = ?auto_133041 ?auto_133043 ) ) ( not ( = ?auto_133041 ?auto_133044 ) ) ( not ( = ?auto_133042 ?auto_133043 ) ) ( not ( = ?auto_133042 ?auto_133044 ) ) ( not ( = ?auto_133043 ?auto_133044 ) ) ( CLEAR ?auto_133041 ) ( ON ?auto_133042 ?auto_133043 ) ( CLEAR ?auto_133042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133038 ?auto_133039 ?auto_133040 ?auto_133041 ?auto_133042 )
      ( MAKE-6PILE ?auto_133038 ?auto_133039 ?auto_133040 ?auto_133041 ?auto_133042 ?auto_133043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133064 - BLOCK
      ?auto_133065 - BLOCK
      ?auto_133066 - BLOCK
      ?auto_133067 - BLOCK
      ?auto_133068 - BLOCK
      ?auto_133069 - BLOCK
    )
    :vars
    (
      ?auto_133070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133069 ?auto_133070 ) ( ON-TABLE ?auto_133064 ) ( ON ?auto_133065 ?auto_133064 ) ( ON ?auto_133066 ?auto_133065 ) ( not ( = ?auto_133064 ?auto_133065 ) ) ( not ( = ?auto_133064 ?auto_133066 ) ) ( not ( = ?auto_133064 ?auto_133067 ) ) ( not ( = ?auto_133064 ?auto_133068 ) ) ( not ( = ?auto_133064 ?auto_133069 ) ) ( not ( = ?auto_133064 ?auto_133070 ) ) ( not ( = ?auto_133065 ?auto_133066 ) ) ( not ( = ?auto_133065 ?auto_133067 ) ) ( not ( = ?auto_133065 ?auto_133068 ) ) ( not ( = ?auto_133065 ?auto_133069 ) ) ( not ( = ?auto_133065 ?auto_133070 ) ) ( not ( = ?auto_133066 ?auto_133067 ) ) ( not ( = ?auto_133066 ?auto_133068 ) ) ( not ( = ?auto_133066 ?auto_133069 ) ) ( not ( = ?auto_133066 ?auto_133070 ) ) ( not ( = ?auto_133067 ?auto_133068 ) ) ( not ( = ?auto_133067 ?auto_133069 ) ) ( not ( = ?auto_133067 ?auto_133070 ) ) ( not ( = ?auto_133068 ?auto_133069 ) ) ( not ( = ?auto_133068 ?auto_133070 ) ) ( not ( = ?auto_133069 ?auto_133070 ) ) ( ON ?auto_133068 ?auto_133069 ) ( CLEAR ?auto_133066 ) ( ON ?auto_133067 ?auto_133068 ) ( CLEAR ?auto_133067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133064 ?auto_133065 ?auto_133066 ?auto_133067 )
      ( MAKE-6PILE ?auto_133064 ?auto_133065 ?auto_133066 ?auto_133067 ?auto_133068 ?auto_133069 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133090 - BLOCK
      ?auto_133091 - BLOCK
      ?auto_133092 - BLOCK
      ?auto_133093 - BLOCK
      ?auto_133094 - BLOCK
      ?auto_133095 - BLOCK
    )
    :vars
    (
      ?auto_133096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133095 ?auto_133096 ) ( ON-TABLE ?auto_133090 ) ( ON ?auto_133091 ?auto_133090 ) ( not ( = ?auto_133090 ?auto_133091 ) ) ( not ( = ?auto_133090 ?auto_133092 ) ) ( not ( = ?auto_133090 ?auto_133093 ) ) ( not ( = ?auto_133090 ?auto_133094 ) ) ( not ( = ?auto_133090 ?auto_133095 ) ) ( not ( = ?auto_133090 ?auto_133096 ) ) ( not ( = ?auto_133091 ?auto_133092 ) ) ( not ( = ?auto_133091 ?auto_133093 ) ) ( not ( = ?auto_133091 ?auto_133094 ) ) ( not ( = ?auto_133091 ?auto_133095 ) ) ( not ( = ?auto_133091 ?auto_133096 ) ) ( not ( = ?auto_133092 ?auto_133093 ) ) ( not ( = ?auto_133092 ?auto_133094 ) ) ( not ( = ?auto_133092 ?auto_133095 ) ) ( not ( = ?auto_133092 ?auto_133096 ) ) ( not ( = ?auto_133093 ?auto_133094 ) ) ( not ( = ?auto_133093 ?auto_133095 ) ) ( not ( = ?auto_133093 ?auto_133096 ) ) ( not ( = ?auto_133094 ?auto_133095 ) ) ( not ( = ?auto_133094 ?auto_133096 ) ) ( not ( = ?auto_133095 ?auto_133096 ) ) ( ON ?auto_133094 ?auto_133095 ) ( ON ?auto_133093 ?auto_133094 ) ( CLEAR ?auto_133091 ) ( ON ?auto_133092 ?auto_133093 ) ( CLEAR ?auto_133092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133090 ?auto_133091 ?auto_133092 )
      ( MAKE-6PILE ?auto_133090 ?auto_133091 ?auto_133092 ?auto_133093 ?auto_133094 ?auto_133095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133116 - BLOCK
      ?auto_133117 - BLOCK
      ?auto_133118 - BLOCK
      ?auto_133119 - BLOCK
      ?auto_133120 - BLOCK
      ?auto_133121 - BLOCK
    )
    :vars
    (
      ?auto_133122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133121 ?auto_133122 ) ( ON-TABLE ?auto_133116 ) ( not ( = ?auto_133116 ?auto_133117 ) ) ( not ( = ?auto_133116 ?auto_133118 ) ) ( not ( = ?auto_133116 ?auto_133119 ) ) ( not ( = ?auto_133116 ?auto_133120 ) ) ( not ( = ?auto_133116 ?auto_133121 ) ) ( not ( = ?auto_133116 ?auto_133122 ) ) ( not ( = ?auto_133117 ?auto_133118 ) ) ( not ( = ?auto_133117 ?auto_133119 ) ) ( not ( = ?auto_133117 ?auto_133120 ) ) ( not ( = ?auto_133117 ?auto_133121 ) ) ( not ( = ?auto_133117 ?auto_133122 ) ) ( not ( = ?auto_133118 ?auto_133119 ) ) ( not ( = ?auto_133118 ?auto_133120 ) ) ( not ( = ?auto_133118 ?auto_133121 ) ) ( not ( = ?auto_133118 ?auto_133122 ) ) ( not ( = ?auto_133119 ?auto_133120 ) ) ( not ( = ?auto_133119 ?auto_133121 ) ) ( not ( = ?auto_133119 ?auto_133122 ) ) ( not ( = ?auto_133120 ?auto_133121 ) ) ( not ( = ?auto_133120 ?auto_133122 ) ) ( not ( = ?auto_133121 ?auto_133122 ) ) ( ON ?auto_133120 ?auto_133121 ) ( ON ?auto_133119 ?auto_133120 ) ( ON ?auto_133118 ?auto_133119 ) ( CLEAR ?auto_133116 ) ( ON ?auto_133117 ?auto_133118 ) ( CLEAR ?auto_133117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133116 ?auto_133117 )
      ( MAKE-6PILE ?auto_133116 ?auto_133117 ?auto_133118 ?auto_133119 ?auto_133120 ?auto_133121 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133142 - BLOCK
      ?auto_133143 - BLOCK
      ?auto_133144 - BLOCK
      ?auto_133145 - BLOCK
      ?auto_133146 - BLOCK
      ?auto_133147 - BLOCK
    )
    :vars
    (
      ?auto_133148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133147 ?auto_133148 ) ( not ( = ?auto_133142 ?auto_133143 ) ) ( not ( = ?auto_133142 ?auto_133144 ) ) ( not ( = ?auto_133142 ?auto_133145 ) ) ( not ( = ?auto_133142 ?auto_133146 ) ) ( not ( = ?auto_133142 ?auto_133147 ) ) ( not ( = ?auto_133142 ?auto_133148 ) ) ( not ( = ?auto_133143 ?auto_133144 ) ) ( not ( = ?auto_133143 ?auto_133145 ) ) ( not ( = ?auto_133143 ?auto_133146 ) ) ( not ( = ?auto_133143 ?auto_133147 ) ) ( not ( = ?auto_133143 ?auto_133148 ) ) ( not ( = ?auto_133144 ?auto_133145 ) ) ( not ( = ?auto_133144 ?auto_133146 ) ) ( not ( = ?auto_133144 ?auto_133147 ) ) ( not ( = ?auto_133144 ?auto_133148 ) ) ( not ( = ?auto_133145 ?auto_133146 ) ) ( not ( = ?auto_133145 ?auto_133147 ) ) ( not ( = ?auto_133145 ?auto_133148 ) ) ( not ( = ?auto_133146 ?auto_133147 ) ) ( not ( = ?auto_133146 ?auto_133148 ) ) ( not ( = ?auto_133147 ?auto_133148 ) ) ( ON ?auto_133146 ?auto_133147 ) ( ON ?auto_133145 ?auto_133146 ) ( ON ?auto_133144 ?auto_133145 ) ( ON ?auto_133143 ?auto_133144 ) ( ON ?auto_133142 ?auto_133143 ) ( CLEAR ?auto_133142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133142 )
      ( MAKE-6PILE ?auto_133142 ?auto_133143 ?auto_133144 ?auto_133145 ?auto_133146 ?auto_133147 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133169 - BLOCK
      ?auto_133170 - BLOCK
      ?auto_133171 - BLOCK
      ?auto_133172 - BLOCK
      ?auto_133173 - BLOCK
      ?auto_133174 - BLOCK
      ?auto_133175 - BLOCK
    )
    :vars
    (
      ?auto_133176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_133174 ) ( ON ?auto_133175 ?auto_133176 ) ( CLEAR ?auto_133175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133169 ) ( ON ?auto_133170 ?auto_133169 ) ( ON ?auto_133171 ?auto_133170 ) ( ON ?auto_133172 ?auto_133171 ) ( ON ?auto_133173 ?auto_133172 ) ( ON ?auto_133174 ?auto_133173 ) ( not ( = ?auto_133169 ?auto_133170 ) ) ( not ( = ?auto_133169 ?auto_133171 ) ) ( not ( = ?auto_133169 ?auto_133172 ) ) ( not ( = ?auto_133169 ?auto_133173 ) ) ( not ( = ?auto_133169 ?auto_133174 ) ) ( not ( = ?auto_133169 ?auto_133175 ) ) ( not ( = ?auto_133169 ?auto_133176 ) ) ( not ( = ?auto_133170 ?auto_133171 ) ) ( not ( = ?auto_133170 ?auto_133172 ) ) ( not ( = ?auto_133170 ?auto_133173 ) ) ( not ( = ?auto_133170 ?auto_133174 ) ) ( not ( = ?auto_133170 ?auto_133175 ) ) ( not ( = ?auto_133170 ?auto_133176 ) ) ( not ( = ?auto_133171 ?auto_133172 ) ) ( not ( = ?auto_133171 ?auto_133173 ) ) ( not ( = ?auto_133171 ?auto_133174 ) ) ( not ( = ?auto_133171 ?auto_133175 ) ) ( not ( = ?auto_133171 ?auto_133176 ) ) ( not ( = ?auto_133172 ?auto_133173 ) ) ( not ( = ?auto_133172 ?auto_133174 ) ) ( not ( = ?auto_133172 ?auto_133175 ) ) ( not ( = ?auto_133172 ?auto_133176 ) ) ( not ( = ?auto_133173 ?auto_133174 ) ) ( not ( = ?auto_133173 ?auto_133175 ) ) ( not ( = ?auto_133173 ?auto_133176 ) ) ( not ( = ?auto_133174 ?auto_133175 ) ) ( not ( = ?auto_133174 ?auto_133176 ) ) ( not ( = ?auto_133175 ?auto_133176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133175 ?auto_133176 )
      ( !STACK ?auto_133175 ?auto_133174 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133199 - BLOCK
      ?auto_133200 - BLOCK
      ?auto_133201 - BLOCK
      ?auto_133202 - BLOCK
      ?auto_133203 - BLOCK
      ?auto_133204 - BLOCK
      ?auto_133205 - BLOCK
    )
    :vars
    (
      ?auto_133206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133205 ?auto_133206 ) ( ON-TABLE ?auto_133199 ) ( ON ?auto_133200 ?auto_133199 ) ( ON ?auto_133201 ?auto_133200 ) ( ON ?auto_133202 ?auto_133201 ) ( ON ?auto_133203 ?auto_133202 ) ( not ( = ?auto_133199 ?auto_133200 ) ) ( not ( = ?auto_133199 ?auto_133201 ) ) ( not ( = ?auto_133199 ?auto_133202 ) ) ( not ( = ?auto_133199 ?auto_133203 ) ) ( not ( = ?auto_133199 ?auto_133204 ) ) ( not ( = ?auto_133199 ?auto_133205 ) ) ( not ( = ?auto_133199 ?auto_133206 ) ) ( not ( = ?auto_133200 ?auto_133201 ) ) ( not ( = ?auto_133200 ?auto_133202 ) ) ( not ( = ?auto_133200 ?auto_133203 ) ) ( not ( = ?auto_133200 ?auto_133204 ) ) ( not ( = ?auto_133200 ?auto_133205 ) ) ( not ( = ?auto_133200 ?auto_133206 ) ) ( not ( = ?auto_133201 ?auto_133202 ) ) ( not ( = ?auto_133201 ?auto_133203 ) ) ( not ( = ?auto_133201 ?auto_133204 ) ) ( not ( = ?auto_133201 ?auto_133205 ) ) ( not ( = ?auto_133201 ?auto_133206 ) ) ( not ( = ?auto_133202 ?auto_133203 ) ) ( not ( = ?auto_133202 ?auto_133204 ) ) ( not ( = ?auto_133202 ?auto_133205 ) ) ( not ( = ?auto_133202 ?auto_133206 ) ) ( not ( = ?auto_133203 ?auto_133204 ) ) ( not ( = ?auto_133203 ?auto_133205 ) ) ( not ( = ?auto_133203 ?auto_133206 ) ) ( not ( = ?auto_133204 ?auto_133205 ) ) ( not ( = ?auto_133204 ?auto_133206 ) ) ( not ( = ?auto_133205 ?auto_133206 ) ) ( CLEAR ?auto_133203 ) ( ON ?auto_133204 ?auto_133205 ) ( CLEAR ?auto_133204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133199 ?auto_133200 ?auto_133201 ?auto_133202 ?auto_133203 ?auto_133204 )
      ( MAKE-7PILE ?auto_133199 ?auto_133200 ?auto_133201 ?auto_133202 ?auto_133203 ?auto_133204 ?auto_133205 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133229 - BLOCK
      ?auto_133230 - BLOCK
      ?auto_133231 - BLOCK
      ?auto_133232 - BLOCK
      ?auto_133233 - BLOCK
      ?auto_133234 - BLOCK
      ?auto_133235 - BLOCK
    )
    :vars
    (
      ?auto_133236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133235 ?auto_133236 ) ( ON-TABLE ?auto_133229 ) ( ON ?auto_133230 ?auto_133229 ) ( ON ?auto_133231 ?auto_133230 ) ( ON ?auto_133232 ?auto_133231 ) ( not ( = ?auto_133229 ?auto_133230 ) ) ( not ( = ?auto_133229 ?auto_133231 ) ) ( not ( = ?auto_133229 ?auto_133232 ) ) ( not ( = ?auto_133229 ?auto_133233 ) ) ( not ( = ?auto_133229 ?auto_133234 ) ) ( not ( = ?auto_133229 ?auto_133235 ) ) ( not ( = ?auto_133229 ?auto_133236 ) ) ( not ( = ?auto_133230 ?auto_133231 ) ) ( not ( = ?auto_133230 ?auto_133232 ) ) ( not ( = ?auto_133230 ?auto_133233 ) ) ( not ( = ?auto_133230 ?auto_133234 ) ) ( not ( = ?auto_133230 ?auto_133235 ) ) ( not ( = ?auto_133230 ?auto_133236 ) ) ( not ( = ?auto_133231 ?auto_133232 ) ) ( not ( = ?auto_133231 ?auto_133233 ) ) ( not ( = ?auto_133231 ?auto_133234 ) ) ( not ( = ?auto_133231 ?auto_133235 ) ) ( not ( = ?auto_133231 ?auto_133236 ) ) ( not ( = ?auto_133232 ?auto_133233 ) ) ( not ( = ?auto_133232 ?auto_133234 ) ) ( not ( = ?auto_133232 ?auto_133235 ) ) ( not ( = ?auto_133232 ?auto_133236 ) ) ( not ( = ?auto_133233 ?auto_133234 ) ) ( not ( = ?auto_133233 ?auto_133235 ) ) ( not ( = ?auto_133233 ?auto_133236 ) ) ( not ( = ?auto_133234 ?auto_133235 ) ) ( not ( = ?auto_133234 ?auto_133236 ) ) ( not ( = ?auto_133235 ?auto_133236 ) ) ( ON ?auto_133234 ?auto_133235 ) ( CLEAR ?auto_133232 ) ( ON ?auto_133233 ?auto_133234 ) ( CLEAR ?auto_133233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133229 ?auto_133230 ?auto_133231 ?auto_133232 ?auto_133233 )
      ( MAKE-7PILE ?auto_133229 ?auto_133230 ?auto_133231 ?auto_133232 ?auto_133233 ?auto_133234 ?auto_133235 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133259 - BLOCK
      ?auto_133260 - BLOCK
      ?auto_133261 - BLOCK
      ?auto_133262 - BLOCK
      ?auto_133263 - BLOCK
      ?auto_133264 - BLOCK
      ?auto_133265 - BLOCK
    )
    :vars
    (
      ?auto_133266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133265 ?auto_133266 ) ( ON-TABLE ?auto_133259 ) ( ON ?auto_133260 ?auto_133259 ) ( ON ?auto_133261 ?auto_133260 ) ( not ( = ?auto_133259 ?auto_133260 ) ) ( not ( = ?auto_133259 ?auto_133261 ) ) ( not ( = ?auto_133259 ?auto_133262 ) ) ( not ( = ?auto_133259 ?auto_133263 ) ) ( not ( = ?auto_133259 ?auto_133264 ) ) ( not ( = ?auto_133259 ?auto_133265 ) ) ( not ( = ?auto_133259 ?auto_133266 ) ) ( not ( = ?auto_133260 ?auto_133261 ) ) ( not ( = ?auto_133260 ?auto_133262 ) ) ( not ( = ?auto_133260 ?auto_133263 ) ) ( not ( = ?auto_133260 ?auto_133264 ) ) ( not ( = ?auto_133260 ?auto_133265 ) ) ( not ( = ?auto_133260 ?auto_133266 ) ) ( not ( = ?auto_133261 ?auto_133262 ) ) ( not ( = ?auto_133261 ?auto_133263 ) ) ( not ( = ?auto_133261 ?auto_133264 ) ) ( not ( = ?auto_133261 ?auto_133265 ) ) ( not ( = ?auto_133261 ?auto_133266 ) ) ( not ( = ?auto_133262 ?auto_133263 ) ) ( not ( = ?auto_133262 ?auto_133264 ) ) ( not ( = ?auto_133262 ?auto_133265 ) ) ( not ( = ?auto_133262 ?auto_133266 ) ) ( not ( = ?auto_133263 ?auto_133264 ) ) ( not ( = ?auto_133263 ?auto_133265 ) ) ( not ( = ?auto_133263 ?auto_133266 ) ) ( not ( = ?auto_133264 ?auto_133265 ) ) ( not ( = ?auto_133264 ?auto_133266 ) ) ( not ( = ?auto_133265 ?auto_133266 ) ) ( ON ?auto_133264 ?auto_133265 ) ( ON ?auto_133263 ?auto_133264 ) ( CLEAR ?auto_133261 ) ( ON ?auto_133262 ?auto_133263 ) ( CLEAR ?auto_133262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133259 ?auto_133260 ?auto_133261 ?auto_133262 )
      ( MAKE-7PILE ?auto_133259 ?auto_133260 ?auto_133261 ?auto_133262 ?auto_133263 ?auto_133264 ?auto_133265 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133289 - BLOCK
      ?auto_133290 - BLOCK
      ?auto_133291 - BLOCK
      ?auto_133292 - BLOCK
      ?auto_133293 - BLOCK
      ?auto_133294 - BLOCK
      ?auto_133295 - BLOCK
    )
    :vars
    (
      ?auto_133296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133295 ?auto_133296 ) ( ON-TABLE ?auto_133289 ) ( ON ?auto_133290 ?auto_133289 ) ( not ( = ?auto_133289 ?auto_133290 ) ) ( not ( = ?auto_133289 ?auto_133291 ) ) ( not ( = ?auto_133289 ?auto_133292 ) ) ( not ( = ?auto_133289 ?auto_133293 ) ) ( not ( = ?auto_133289 ?auto_133294 ) ) ( not ( = ?auto_133289 ?auto_133295 ) ) ( not ( = ?auto_133289 ?auto_133296 ) ) ( not ( = ?auto_133290 ?auto_133291 ) ) ( not ( = ?auto_133290 ?auto_133292 ) ) ( not ( = ?auto_133290 ?auto_133293 ) ) ( not ( = ?auto_133290 ?auto_133294 ) ) ( not ( = ?auto_133290 ?auto_133295 ) ) ( not ( = ?auto_133290 ?auto_133296 ) ) ( not ( = ?auto_133291 ?auto_133292 ) ) ( not ( = ?auto_133291 ?auto_133293 ) ) ( not ( = ?auto_133291 ?auto_133294 ) ) ( not ( = ?auto_133291 ?auto_133295 ) ) ( not ( = ?auto_133291 ?auto_133296 ) ) ( not ( = ?auto_133292 ?auto_133293 ) ) ( not ( = ?auto_133292 ?auto_133294 ) ) ( not ( = ?auto_133292 ?auto_133295 ) ) ( not ( = ?auto_133292 ?auto_133296 ) ) ( not ( = ?auto_133293 ?auto_133294 ) ) ( not ( = ?auto_133293 ?auto_133295 ) ) ( not ( = ?auto_133293 ?auto_133296 ) ) ( not ( = ?auto_133294 ?auto_133295 ) ) ( not ( = ?auto_133294 ?auto_133296 ) ) ( not ( = ?auto_133295 ?auto_133296 ) ) ( ON ?auto_133294 ?auto_133295 ) ( ON ?auto_133293 ?auto_133294 ) ( ON ?auto_133292 ?auto_133293 ) ( CLEAR ?auto_133290 ) ( ON ?auto_133291 ?auto_133292 ) ( CLEAR ?auto_133291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133289 ?auto_133290 ?auto_133291 )
      ( MAKE-7PILE ?auto_133289 ?auto_133290 ?auto_133291 ?auto_133292 ?auto_133293 ?auto_133294 ?auto_133295 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133319 - BLOCK
      ?auto_133320 - BLOCK
      ?auto_133321 - BLOCK
      ?auto_133322 - BLOCK
      ?auto_133323 - BLOCK
      ?auto_133324 - BLOCK
      ?auto_133325 - BLOCK
    )
    :vars
    (
      ?auto_133326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133325 ?auto_133326 ) ( ON-TABLE ?auto_133319 ) ( not ( = ?auto_133319 ?auto_133320 ) ) ( not ( = ?auto_133319 ?auto_133321 ) ) ( not ( = ?auto_133319 ?auto_133322 ) ) ( not ( = ?auto_133319 ?auto_133323 ) ) ( not ( = ?auto_133319 ?auto_133324 ) ) ( not ( = ?auto_133319 ?auto_133325 ) ) ( not ( = ?auto_133319 ?auto_133326 ) ) ( not ( = ?auto_133320 ?auto_133321 ) ) ( not ( = ?auto_133320 ?auto_133322 ) ) ( not ( = ?auto_133320 ?auto_133323 ) ) ( not ( = ?auto_133320 ?auto_133324 ) ) ( not ( = ?auto_133320 ?auto_133325 ) ) ( not ( = ?auto_133320 ?auto_133326 ) ) ( not ( = ?auto_133321 ?auto_133322 ) ) ( not ( = ?auto_133321 ?auto_133323 ) ) ( not ( = ?auto_133321 ?auto_133324 ) ) ( not ( = ?auto_133321 ?auto_133325 ) ) ( not ( = ?auto_133321 ?auto_133326 ) ) ( not ( = ?auto_133322 ?auto_133323 ) ) ( not ( = ?auto_133322 ?auto_133324 ) ) ( not ( = ?auto_133322 ?auto_133325 ) ) ( not ( = ?auto_133322 ?auto_133326 ) ) ( not ( = ?auto_133323 ?auto_133324 ) ) ( not ( = ?auto_133323 ?auto_133325 ) ) ( not ( = ?auto_133323 ?auto_133326 ) ) ( not ( = ?auto_133324 ?auto_133325 ) ) ( not ( = ?auto_133324 ?auto_133326 ) ) ( not ( = ?auto_133325 ?auto_133326 ) ) ( ON ?auto_133324 ?auto_133325 ) ( ON ?auto_133323 ?auto_133324 ) ( ON ?auto_133322 ?auto_133323 ) ( ON ?auto_133321 ?auto_133322 ) ( CLEAR ?auto_133319 ) ( ON ?auto_133320 ?auto_133321 ) ( CLEAR ?auto_133320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133319 ?auto_133320 )
      ( MAKE-7PILE ?auto_133319 ?auto_133320 ?auto_133321 ?auto_133322 ?auto_133323 ?auto_133324 ?auto_133325 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133349 - BLOCK
      ?auto_133350 - BLOCK
      ?auto_133351 - BLOCK
      ?auto_133352 - BLOCK
      ?auto_133353 - BLOCK
      ?auto_133354 - BLOCK
      ?auto_133355 - BLOCK
    )
    :vars
    (
      ?auto_133356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133355 ?auto_133356 ) ( not ( = ?auto_133349 ?auto_133350 ) ) ( not ( = ?auto_133349 ?auto_133351 ) ) ( not ( = ?auto_133349 ?auto_133352 ) ) ( not ( = ?auto_133349 ?auto_133353 ) ) ( not ( = ?auto_133349 ?auto_133354 ) ) ( not ( = ?auto_133349 ?auto_133355 ) ) ( not ( = ?auto_133349 ?auto_133356 ) ) ( not ( = ?auto_133350 ?auto_133351 ) ) ( not ( = ?auto_133350 ?auto_133352 ) ) ( not ( = ?auto_133350 ?auto_133353 ) ) ( not ( = ?auto_133350 ?auto_133354 ) ) ( not ( = ?auto_133350 ?auto_133355 ) ) ( not ( = ?auto_133350 ?auto_133356 ) ) ( not ( = ?auto_133351 ?auto_133352 ) ) ( not ( = ?auto_133351 ?auto_133353 ) ) ( not ( = ?auto_133351 ?auto_133354 ) ) ( not ( = ?auto_133351 ?auto_133355 ) ) ( not ( = ?auto_133351 ?auto_133356 ) ) ( not ( = ?auto_133352 ?auto_133353 ) ) ( not ( = ?auto_133352 ?auto_133354 ) ) ( not ( = ?auto_133352 ?auto_133355 ) ) ( not ( = ?auto_133352 ?auto_133356 ) ) ( not ( = ?auto_133353 ?auto_133354 ) ) ( not ( = ?auto_133353 ?auto_133355 ) ) ( not ( = ?auto_133353 ?auto_133356 ) ) ( not ( = ?auto_133354 ?auto_133355 ) ) ( not ( = ?auto_133354 ?auto_133356 ) ) ( not ( = ?auto_133355 ?auto_133356 ) ) ( ON ?auto_133354 ?auto_133355 ) ( ON ?auto_133353 ?auto_133354 ) ( ON ?auto_133352 ?auto_133353 ) ( ON ?auto_133351 ?auto_133352 ) ( ON ?auto_133350 ?auto_133351 ) ( ON ?auto_133349 ?auto_133350 ) ( CLEAR ?auto_133349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133349 )
      ( MAKE-7PILE ?auto_133349 ?auto_133350 ?auto_133351 ?auto_133352 ?auto_133353 ?auto_133354 ?auto_133355 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133380 - BLOCK
      ?auto_133381 - BLOCK
      ?auto_133382 - BLOCK
      ?auto_133383 - BLOCK
      ?auto_133384 - BLOCK
      ?auto_133385 - BLOCK
      ?auto_133386 - BLOCK
      ?auto_133387 - BLOCK
    )
    :vars
    (
      ?auto_133388 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_133386 ) ( ON ?auto_133387 ?auto_133388 ) ( CLEAR ?auto_133387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133380 ) ( ON ?auto_133381 ?auto_133380 ) ( ON ?auto_133382 ?auto_133381 ) ( ON ?auto_133383 ?auto_133382 ) ( ON ?auto_133384 ?auto_133383 ) ( ON ?auto_133385 ?auto_133384 ) ( ON ?auto_133386 ?auto_133385 ) ( not ( = ?auto_133380 ?auto_133381 ) ) ( not ( = ?auto_133380 ?auto_133382 ) ) ( not ( = ?auto_133380 ?auto_133383 ) ) ( not ( = ?auto_133380 ?auto_133384 ) ) ( not ( = ?auto_133380 ?auto_133385 ) ) ( not ( = ?auto_133380 ?auto_133386 ) ) ( not ( = ?auto_133380 ?auto_133387 ) ) ( not ( = ?auto_133380 ?auto_133388 ) ) ( not ( = ?auto_133381 ?auto_133382 ) ) ( not ( = ?auto_133381 ?auto_133383 ) ) ( not ( = ?auto_133381 ?auto_133384 ) ) ( not ( = ?auto_133381 ?auto_133385 ) ) ( not ( = ?auto_133381 ?auto_133386 ) ) ( not ( = ?auto_133381 ?auto_133387 ) ) ( not ( = ?auto_133381 ?auto_133388 ) ) ( not ( = ?auto_133382 ?auto_133383 ) ) ( not ( = ?auto_133382 ?auto_133384 ) ) ( not ( = ?auto_133382 ?auto_133385 ) ) ( not ( = ?auto_133382 ?auto_133386 ) ) ( not ( = ?auto_133382 ?auto_133387 ) ) ( not ( = ?auto_133382 ?auto_133388 ) ) ( not ( = ?auto_133383 ?auto_133384 ) ) ( not ( = ?auto_133383 ?auto_133385 ) ) ( not ( = ?auto_133383 ?auto_133386 ) ) ( not ( = ?auto_133383 ?auto_133387 ) ) ( not ( = ?auto_133383 ?auto_133388 ) ) ( not ( = ?auto_133384 ?auto_133385 ) ) ( not ( = ?auto_133384 ?auto_133386 ) ) ( not ( = ?auto_133384 ?auto_133387 ) ) ( not ( = ?auto_133384 ?auto_133388 ) ) ( not ( = ?auto_133385 ?auto_133386 ) ) ( not ( = ?auto_133385 ?auto_133387 ) ) ( not ( = ?auto_133385 ?auto_133388 ) ) ( not ( = ?auto_133386 ?auto_133387 ) ) ( not ( = ?auto_133386 ?auto_133388 ) ) ( not ( = ?auto_133387 ?auto_133388 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133387 ?auto_133388 )
      ( !STACK ?auto_133387 ?auto_133386 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133414 - BLOCK
      ?auto_133415 - BLOCK
      ?auto_133416 - BLOCK
      ?auto_133417 - BLOCK
      ?auto_133418 - BLOCK
      ?auto_133419 - BLOCK
      ?auto_133420 - BLOCK
      ?auto_133421 - BLOCK
    )
    :vars
    (
      ?auto_133422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133421 ?auto_133422 ) ( ON-TABLE ?auto_133414 ) ( ON ?auto_133415 ?auto_133414 ) ( ON ?auto_133416 ?auto_133415 ) ( ON ?auto_133417 ?auto_133416 ) ( ON ?auto_133418 ?auto_133417 ) ( ON ?auto_133419 ?auto_133418 ) ( not ( = ?auto_133414 ?auto_133415 ) ) ( not ( = ?auto_133414 ?auto_133416 ) ) ( not ( = ?auto_133414 ?auto_133417 ) ) ( not ( = ?auto_133414 ?auto_133418 ) ) ( not ( = ?auto_133414 ?auto_133419 ) ) ( not ( = ?auto_133414 ?auto_133420 ) ) ( not ( = ?auto_133414 ?auto_133421 ) ) ( not ( = ?auto_133414 ?auto_133422 ) ) ( not ( = ?auto_133415 ?auto_133416 ) ) ( not ( = ?auto_133415 ?auto_133417 ) ) ( not ( = ?auto_133415 ?auto_133418 ) ) ( not ( = ?auto_133415 ?auto_133419 ) ) ( not ( = ?auto_133415 ?auto_133420 ) ) ( not ( = ?auto_133415 ?auto_133421 ) ) ( not ( = ?auto_133415 ?auto_133422 ) ) ( not ( = ?auto_133416 ?auto_133417 ) ) ( not ( = ?auto_133416 ?auto_133418 ) ) ( not ( = ?auto_133416 ?auto_133419 ) ) ( not ( = ?auto_133416 ?auto_133420 ) ) ( not ( = ?auto_133416 ?auto_133421 ) ) ( not ( = ?auto_133416 ?auto_133422 ) ) ( not ( = ?auto_133417 ?auto_133418 ) ) ( not ( = ?auto_133417 ?auto_133419 ) ) ( not ( = ?auto_133417 ?auto_133420 ) ) ( not ( = ?auto_133417 ?auto_133421 ) ) ( not ( = ?auto_133417 ?auto_133422 ) ) ( not ( = ?auto_133418 ?auto_133419 ) ) ( not ( = ?auto_133418 ?auto_133420 ) ) ( not ( = ?auto_133418 ?auto_133421 ) ) ( not ( = ?auto_133418 ?auto_133422 ) ) ( not ( = ?auto_133419 ?auto_133420 ) ) ( not ( = ?auto_133419 ?auto_133421 ) ) ( not ( = ?auto_133419 ?auto_133422 ) ) ( not ( = ?auto_133420 ?auto_133421 ) ) ( not ( = ?auto_133420 ?auto_133422 ) ) ( not ( = ?auto_133421 ?auto_133422 ) ) ( CLEAR ?auto_133419 ) ( ON ?auto_133420 ?auto_133421 ) ( CLEAR ?auto_133420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133414 ?auto_133415 ?auto_133416 ?auto_133417 ?auto_133418 ?auto_133419 ?auto_133420 )
      ( MAKE-8PILE ?auto_133414 ?auto_133415 ?auto_133416 ?auto_133417 ?auto_133418 ?auto_133419 ?auto_133420 ?auto_133421 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133448 - BLOCK
      ?auto_133449 - BLOCK
      ?auto_133450 - BLOCK
      ?auto_133451 - BLOCK
      ?auto_133452 - BLOCK
      ?auto_133453 - BLOCK
      ?auto_133454 - BLOCK
      ?auto_133455 - BLOCK
    )
    :vars
    (
      ?auto_133456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133455 ?auto_133456 ) ( ON-TABLE ?auto_133448 ) ( ON ?auto_133449 ?auto_133448 ) ( ON ?auto_133450 ?auto_133449 ) ( ON ?auto_133451 ?auto_133450 ) ( ON ?auto_133452 ?auto_133451 ) ( not ( = ?auto_133448 ?auto_133449 ) ) ( not ( = ?auto_133448 ?auto_133450 ) ) ( not ( = ?auto_133448 ?auto_133451 ) ) ( not ( = ?auto_133448 ?auto_133452 ) ) ( not ( = ?auto_133448 ?auto_133453 ) ) ( not ( = ?auto_133448 ?auto_133454 ) ) ( not ( = ?auto_133448 ?auto_133455 ) ) ( not ( = ?auto_133448 ?auto_133456 ) ) ( not ( = ?auto_133449 ?auto_133450 ) ) ( not ( = ?auto_133449 ?auto_133451 ) ) ( not ( = ?auto_133449 ?auto_133452 ) ) ( not ( = ?auto_133449 ?auto_133453 ) ) ( not ( = ?auto_133449 ?auto_133454 ) ) ( not ( = ?auto_133449 ?auto_133455 ) ) ( not ( = ?auto_133449 ?auto_133456 ) ) ( not ( = ?auto_133450 ?auto_133451 ) ) ( not ( = ?auto_133450 ?auto_133452 ) ) ( not ( = ?auto_133450 ?auto_133453 ) ) ( not ( = ?auto_133450 ?auto_133454 ) ) ( not ( = ?auto_133450 ?auto_133455 ) ) ( not ( = ?auto_133450 ?auto_133456 ) ) ( not ( = ?auto_133451 ?auto_133452 ) ) ( not ( = ?auto_133451 ?auto_133453 ) ) ( not ( = ?auto_133451 ?auto_133454 ) ) ( not ( = ?auto_133451 ?auto_133455 ) ) ( not ( = ?auto_133451 ?auto_133456 ) ) ( not ( = ?auto_133452 ?auto_133453 ) ) ( not ( = ?auto_133452 ?auto_133454 ) ) ( not ( = ?auto_133452 ?auto_133455 ) ) ( not ( = ?auto_133452 ?auto_133456 ) ) ( not ( = ?auto_133453 ?auto_133454 ) ) ( not ( = ?auto_133453 ?auto_133455 ) ) ( not ( = ?auto_133453 ?auto_133456 ) ) ( not ( = ?auto_133454 ?auto_133455 ) ) ( not ( = ?auto_133454 ?auto_133456 ) ) ( not ( = ?auto_133455 ?auto_133456 ) ) ( ON ?auto_133454 ?auto_133455 ) ( CLEAR ?auto_133452 ) ( ON ?auto_133453 ?auto_133454 ) ( CLEAR ?auto_133453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133448 ?auto_133449 ?auto_133450 ?auto_133451 ?auto_133452 ?auto_133453 )
      ( MAKE-8PILE ?auto_133448 ?auto_133449 ?auto_133450 ?auto_133451 ?auto_133452 ?auto_133453 ?auto_133454 ?auto_133455 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133482 - BLOCK
      ?auto_133483 - BLOCK
      ?auto_133484 - BLOCK
      ?auto_133485 - BLOCK
      ?auto_133486 - BLOCK
      ?auto_133487 - BLOCK
      ?auto_133488 - BLOCK
      ?auto_133489 - BLOCK
    )
    :vars
    (
      ?auto_133490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133489 ?auto_133490 ) ( ON-TABLE ?auto_133482 ) ( ON ?auto_133483 ?auto_133482 ) ( ON ?auto_133484 ?auto_133483 ) ( ON ?auto_133485 ?auto_133484 ) ( not ( = ?auto_133482 ?auto_133483 ) ) ( not ( = ?auto_133482 ?auto_133484 ) ) ( not ( = ?auto_133482 ?auto_133485 ) ) ( not ( = ?auto_133482 ?auto_133486 ) ) ( not ( = ?auto_133482 ?auto_133487 ) ) ( not ( = ?auto_133482 ?auto_133488 ) ) ( not ( = ?auto_133482 ?auto_133489 ) ) ( not ( = ?auto_133482 ?auto_133490 ) ) ( not ( = ?auto_133483 ?auto_133484 ) ) ( not ( = ?auto_133483 ?auto_133485 ) ) ( not ( = ?auto_133483 ?auto_133486 ) ) ( not ( = ?auto_133483 ?auto_133487 ) ) ( not ( = ?auto_133483 ?auto_133488 ) ) ( not ( = ?auto_133483 ?auto_133489 ) ) ( not ( = ?auto_133483 ?auto_133490 ) ) ( not ( = ?auto_133484 ?auto_133485 ) ) ( not ( = ?auto_133484 ?auto_133486 ) ) ( not ( = ?auto_133484 ?auto_133487 ) ) ( not ( = ?auto_133484 ?auto_133488 ) ) ( not ( = ?auto_133484 ?auto_133489 ) ) ( not ( = ?auto_133484 ?auto_133490 ) ) ( not ( = ?auto_133485 ?auto_133486 ) ) ( not ( = ?auto_133485 ?auto_133487 ) ) ( not ( = ?auto_133485 ?auto_133488 ) ) ( not ( = ?auto_133485 ?auto_133489 ) ) ( not ( = ?auto_133485 ?auto_133490 ) ) ( not ( = ?auto_133486 ?auto_133487 ) ) ( not ( = ?auto_133486 ?auto_133488 ) ) ( not ( = ?auto_133486 ?auto_133489 ) ) ( not ( = ?auto_133486 ?auto_133490 ) ) ( not ( = ?auto_133487 ?auto_133488 ) ) ( not ( = ?auto_133487 ?auto_133489 ) ) ( not ( = ?auto_133487 ?auto_133490 ) ) ( not ( = ?auto_133488 ?auto_133489 ) ) ( not ( = ?auto_133488 ?auto_133490 ) ) ( not ( = ?auto_133489 ?auto_133490 ) ) ( ON ?auto_133488 ?auto_133489 ) ( ON ?auto_133487 ?auto_133488 ) ( CLEAR ?auto_133485 ) ( ON ?auto_133486 ?auto_133487 ) ( CLEAR ?auto_133486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133482 ?auto_133483 ?auto_133484 ?auto_133485 ?auto_133486 )
      ( MAKE-8PILE ?auto_133482 ?auto_133483 ?auto_133484 ?auto_133485 ?auto_133486 ?auto_133487 ?auto_133488 ?auto_133489 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133516 - BLOCK
      ?auto_133517 - BLOCK
      ?auto_133518 - BLOCK
      ?auto_133519 - BLOCK
      ?auto_133520 - BLOCK
      ?auto_133521 - BLOCK
      ?auto_133522 - BLOCK
      ?auto_133523 - BLOCK
    )
    :vars
    (
      ?auto_133524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133523 ?auto_133524 ) ( ON-TABLE ?auto_133516 ) ( ON ?auto_133517 ?auto_133516 ) ( ON ?auto_133518 ?auto_133517 ) ( not ( = ?auto_133516 ?auto_133517 ) ) ( not ( = ?auto_133516 ?auto_133518 ) ) ( not ( = ?auto_133516 ?auto_133519 ) ) ( not ( = ?auto_133516 ?auto_133520 ) ) ( not ( = ?auto_133516 ?auto_133521 ) ) ( not ( = ?auto_133516 ?auto_133522 ) ) ( not ( = ?auto_133516 ?auto_133523 ) ) ( not ( = ?auto_133516 ?auto_133524 ) ) ( not ( = ?auto_133517 ?auto_133518 ) ) ( not ( = ?auto_133517 ?auto_133519 ) ) ( not ( = ?auto_133517 ?auto_133520 ) ) ( not ( = ?auto_133517 ?auto_133521 ) ) ( not ( = ?auto_133517 ?auto_133522 ) ) ( not ( = ?auto_133517 ?auto_133523 ) ) ( not ( = ?auto_133517 ?auto_133524 ) ) ( not ( = ?auto_133518 ?auto_133519 ) ) ( not ( = ?auto_133518 ?auto_133520 ) ) ( not ( = ?auto_133518 ?auto_133521 ) ) ( not ( = ?auto_133518 ?auto_133522 ) ) ( not ( = ?auto_133518 ?auto_133523 ) ) ( not ( = ?auto_133518 ?auto_133524 ) ) ( not ( = ?auto_133519 ?auto_133520 ) ) ( not ( = ?auto_133519 ?auto_133521 ) ) ( not ( = ?auto_133519 ?auto_133522 ) ) ( not ( = ?auto_133519 ?auto_133523 ) ) ( not ( = ?auto_133519 ?auto_133524 ) ) ( not ( = ?auto_133520 ?auto_133521 ) ) ( not ( = ?auto_133520 ?auto_133522 ) ) ( not ( = ?auto_133520 ?auto_133523 ) ) ( not ( = ?auto_133520 ?auto_133524 ) ) ( not ( = ?auto_133521 ?auto_133522 ) ) ( not ( = ?auto_133521 ?auto_133523 ) ) ( not ( = ?auto_133521 ?auto_133524 ) ) ( not ( = ?auto_133522 ?auto_133523 ) ) ( not ( = ?auto_133522 ?auto_133524 ) ) ( not ( = ?auto_133523 ?auto_133524 ) ) ( ON ?auto_133522 ?auto_133523 ) ( ON ?auto_133521 ?auto_133522 ) ( ON ?auto_133520 ?auto_133521 ) ( CLEAR ?auto_133518 ) ( ON ?auto_133519 ?auto_133520 ) ( CLEAR ?auto_133519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133516 ?auto_133517 ?auto_133518 ?auto_133519 )
      ( MAKE-8PILE ?auto_133516 ?auto_133517 ?auto_133518 ?auto_133519 ?auto_133520 ?auto_133521 ?auto_133522 ?auto_133523 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133550 - BLOCK
      ?auto_133551 - BLOCK
      ?auto_133552 - BLOCK
      ?auto_133553 - BLOCK
      ?auto_133554 - BLOCK
      ?auto_133555 - BLOCK
      ?auto_133556 - BLOCK
      ?auto_133557 - BLOCK
    )
    :vars
    (
      ?auto_133558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133557 ?auto_133558 ) ( ON-TABLE ?auto_133550 ) ( ON ?auto_133551 ?auto_133550 ) ( not ( = ?auto_133550 ?auto_133551 ) ) ( not ( = ?auto_133550 ?auto_133552 ) ) ( not ( = ?auto_133550 ?auto_133553 ) ) ( not ( = ?auto_133550 ?auto_133554 ) ) ( not ( = ?auto_133550 ?auto_133555 ) ) ( not ( = ?auto_133550 ?auto_133556 ) ) ( not ( = ?auto_133550 ?auto_133557 ) ) ( not ( = ?auto_133550 ?auto_133558 ) ) ( not ( = ?auto_133551 ?auto_133552 ) ) ( not ( = ?auto_133551 ?auto_133553 ) ) ( not ( = ?auto_133551 ?auto_133554 ) ) ( not ( = ?auto_133551 ?auto_133555 ) ) ( not ( = ?auto_133551 ?auto_133556 ) ) ( not ( = ?auto_133551 ?auto_133557 ) ) ( not ( = ?auto_133551 ?auto_133558 ) ) ( not ( = ?auto_133552 ?auto_133553 ) ) ( not ( = ?auto_133552 ?auto_133554 ) ) ( not ( = ?auto_133552 ?auto_133555 ) ) ( not ( = ?auto_133552 ?auto_133556 ) ) ( not ( = ?auto_133552 ?auto_133557 ) ) ( not ( = ?auto_133552 ?auto_133558 ) ) ( not ( = ?auto_133553 ?auto_133554 ) ) ( not ( = ?auto_133553 ?auto_133555 ) ) ( not ( = ?auto_133553 ?auto_133556 ) ) ( not ( = ?auto_133553 ?auto_133557 ) ) ( not ( = ?auto_133553 ?auto_133558 ) ) ( not ( = ?auto_133554 ?auto_133555 ) ) ( not ( = ?auto_133554 ?auto_133556 ) ) ( not ( = ?auto_133554 ?auto_133557 ) ) ( not ( = ?auto_133554 ?auto_133558 ) ) ( not ( = ?auto_133555 ?auto_133556 ) ) ( not ( = ?auto_133555 ?auto_133557 ) ) ( not ( = ?auto_133555 ?auto_133558 ) ) ( not ( = ?auto_133556 ?auto_133557 ) ) ( not ( = ?auto_133556 ?auto_133558 ) ) ( not ( = ?auto_133557 ?auto_133558 ) ) ( ON ?auto_133556 ?auto_133557 ) ( ON ?auto_133555 ?auto_133556 ) ( ON ?auto_133554 ?auto_133555 ) ( ON ?auto_133553 ?auto_133554 ) ( CLEAR ?auto_133551 ) ( ON ?auto_133552 ?auto_133553 ) ( CLEAR ?auto_133552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133550 ?auto_133551 ?auto_133552 )
      ( MAKE-8PILE ?auto_133550 ?auto_133551 ?auto_133552 ?auto_133553 ?auto_133554 ?auto_133555 ?auto_133556 ?auto_133557 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133584 - BLOCK
      ?auto_133585 - BLOCK
      ?auto_133586 - BLOCK
      ?auto_133587 - BLOCK
      ?auto_133588 - BLOCK
      ?auto_133589 - BLOCK
      ?auto_133590 - BLOCK
      ?auto_133591 - BLOCK
    )
    :vars
    (
      ?auto_133592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133591 ?auto_133592 ) ( ON-TABLE ?auto_133584 ) ( not ( = ?auto_133584 ?auto_133585 ) ) ( not ( = ?auto_133584 ?auto_133586 ) ) ( not ( = ?auto_133584 ?auto_133587 ) ) ( not ( = ?auto_133584 ?auto_133588 ) ) ( not ( = ?auto_133584 ?auto_133589 ) ) ( not ( = ?auto_133584 ?auto_133590 ) ) ( not ( = ?auto_133584 ?auto_133591 ) ) ( not ( = ?auto_133584 ?auto_133592 ) ) ( not ( = ?auto_133585 ?auto_133586 ) ) ( not ( = ?auto_133585 ?auto_133587 ) ) ( not ( = ?auto_133585 ?auto_133588 ) ) ( not ( = ?auto_133585 ?auto_133589 ) ) ( not ( = ?auto_133585 ?auto_133590 ) ) ( not ( = ?auto_133585 ?auto_133591 ) ) ( not ( = ?auto_133585 ?auto_133592 ) ) ( not ( = ?auto_133586 ?auto_133587 ) ) ( not ( = ?auto_133586 ?auto_133588 ) ) ( not ( = ?auto_133586 ?auto_133589 ) ) ( not ( = ?auto_133586 ?auto_133590 ) ) ( not ( = ?auto_133586 ?auto_133591 ) ) ( not ( = ?auto_133586 ?auto_133592 ) ) ( not ( = ?auto_133587 ?auto_133588 ) ) ( not ( = ?auto_133587 ?auto_133589 ) ) ( not ( = ?auto_133587 ?auto_133590 ) ) ( not ( = ?auto_133587 ?auto_133591 ) ) ( not ( = ?auto_133587 ?auto_133592 ) ) ( not ( = ?auto_133588 ?auto_133589 ) ) ( not ( = ?auto_133588 ?auto_133590 ) ) ( not ( = ?auto_133588 ?auto_133591 ) ) ( not ( = ?auto_133588 ?auto_133592 ) ) ( not ( = ?auto_133589 ?auto_133590 ) ) ( not ( = ?auto_133589 ?auto_133591 ) ) ( not ( = ?auto_133589 ?auto_133592 ) ) ( not ( = ?auto_133590 ?auto_133591 ) ) ( not ( = ?auto_133590 ?auto_133592 ) ) ( not ( = ?auto_133591 ?auto_133592 ) ) ( ON ?auto_133590 ?auto_133591 ) ( ON ?auto_133589 ?auto_133590 ) ( ON ?auto_133588 ?auto_133589 ) ( ON ?auto_133587 ?auto_133588 ) ( ON ?auto_133586 ?auto_133587 ) ( CLEAR ?auto_133584 ) ( ON ?auto_133585 ?auto_133586 ) ( CLEAR ?auto_133585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133584 ?auto_133585 )
      ( MAKE-8PILE ?auto_133584 ?auto_133585 ?auto_133586 ?auto_133587 ?auto_133588 ?auto_133589 ?auto_133590 ?auto_133591 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133618 - BLOCK
      ?auto_133619 - BLOCK
      ?auto_133620 - BLOCK
      ?auto_133621 - BLOCK
      ?auto_133622 - BLOCK
      ?auto_133623 - BLOCK
      ?auto_133624 - BLOCK
      ?auto_133625 - BLOCK
    )
    :vars
    (
      ?auto_133626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133625 ?auto_133626 ) ( not ( = ?auto_133618 ?auto_133619 ) ) ( not ( = ?auto_133618 ?auto_133620 ) ) ( not ( = ?auto_133618 ?auto_133621 ) ) ( not ( = ?auto_133618 ?auto_133622 ) ) ( not ( = ?auto_133618 ?auto_133623 ) ) ( not ( = ?auto_133618 ?auto_133624 ) ) ( not ( = ?auto_133618 ?auto_133625 ) ) ( not ( = ?auto_133618 ?auto_133626 ) ) ( not ( = ?auto_133619 ?auto_133620 ) ) ( not ( = ?auto_133619 ?auto_133621 ) ) ( not ( = ?auto_133619 ?auto_133622 ) ) ( not ( = ?auto_133619 ?auto_133623 ) ) ( not ( = ?auto_133619 ?auto_133624 ) ) ( not ( = ?auto_133619 ?auto_133625 ) ) ( not ( = ?auto_133619 ?auto_133626 ) ) ( not ( = ?auto_133620 ?auto_133621 ) ) ( not ( = ?auto_133620 ?auto_133622 ) ) ( not ( = ?auto_133620 ?auto_133623 ) ) ( not ( = ?auto_133620 ?auto_133624 ) ) ( not ( = ?auto_133620 ?auto_133625 ) ) ( not ( = ?auto_133620 ?auto_133626 ) ) ( not ( = ?auto_133621 ?auto_133622 ) ) ( not ( = ?auto_133621 ?auto_133623 ) ) ( not ( = ?auto_133621 ?auto_133624 ) ) ( not ( = ?auto_133621 ?auto_133625 ) ) ( not ( = ?auto_133621 ?auto_133626 ) ) ( not ( = ?auto_133622 ?auto_133623 ) ) ( not ( = ?auto_133622 ?auto_133624 ) ) ( not ( = ?auto_133622 ?auto_133625 ) ) ( not ( = ?auto_133622 ?auto_133626 ) ) ( not ( = ?auto_133623 ?auto_133624 ) ) ( not ( = ?auto_133623 ?auto_133625 ) ) ( not ( = ?auto_133623 ?auto_133626 ) ) ( not ( = ?auto_133624 ?auto_133625 ) ) ( not ( = ?auto_133624 ?auto_133626 ) ) ( not ( = ?auto_133625 ?auto_133626 ) ) ( ON ?auto_133624 ?auto_133625 ) ( ON ?auto_133623 ?auto_133624 ) ( ON ?auto_133622 ?auto_133623 ) ( ON ?auto_133621 ?auto_133622 ) ( ON ?auto_133620 ?auto_133621 ) ( ON ?auto_133619 ?auto_133620 ) ( ON ?auto_133618 ?auto_133619 ) ( CLEAR ?auto_133618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133618 )
      ( MAKE-8PILE ?auto_133618 ?auto_133619 ?auto_133620 ?auto_133621 ?auto_133622 ?auto_133623 ?auto_133624 ?auto_133625 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_133653 - BLOCK
      ?auto_133654 - BLOCK
      ?auto_133655 - BLOCK
      ?auto_133656 - BLOCK
      ?auto_133657 - BLOCK
      ?auto_133658 - BLOCK
      ?auto_133659 - BLOCK
      ?auto_133660 - BLOCK
      ?auto_133661 - BLOCK
    )
    :vars
    (
      ?auto_133662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_133660 ) ( ON ?auto_133661 ?auto_133662 ) ( CLEAR ?auto_133661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133653 ) ( ON ?auto_133654 ?auto_133653 ) ( ON ?auto_133655 ?auto_133654 ) ( ON ?auto_133656 ?auto_133655 ) ( ON ?auto_133657 ?auto_133656 ) ( ON ?auto_133658 ?auto_133657 ) ( ON ?auto_133659 ?auto_133658 ) ( ON ?auto_133660 ?auto_133659 ) ( not ( = ?auto_133653 ?auto_133654 ) ) ( not ( = ?auto_133653 ?auto_133655 ) ) ( not ( = ?auto_133653 ?auto_133656 ) ) ( not ( = ?auto_133653 ?auto_133657 ) ) ( not ( = ?auto_133653 ?auto_133658 ) ) ( not ( = ?auto_133653 ?auto_133659 ) ) ( not ( = ?auto_133653 ?auto_133660 ) ) ( not ( = ?auto_133653 ?auto_133661 ) ) ( not ( = ?auto_133653 ?auto_133662 ) ) ( not ( = ?auto_133654 ?auto_133655 ) ) ( not ( = ?auto_133654 ?auto_133656 ) ) ( not ( = ?auto_133654 ?auto_133657 ) ) ( not ( = ?auto_133654 ?auto_133658 ) ) ( not ( = ?auto_133654 ?auto_133659 ) ) ( not ( = ?auto_133654 ?auto_133660 ) ) ( not ( = ?auto_133654 ?auto_133661 ) ) ( not ( = ?auto_133654 ?auto_133662 ) ) ( not ( = ?auto_133655 ?auto_133656 ) ) ( not ( = ?auto_133655 ?auto_133657 ) ) ( not ( = ?auto_133655 ?auto_133658 ) ) ( not ( = ?auto_133655 ?auto_133659 ) ) ( not ( = ?auto_133655 ?auto_133660 ) ) ( not ( = ?auto_133655 ?auto_133661 ) ) ( not ( = ?auto_133655 ?auto_133662 ) ) ( not ( = ?auto_133656 ?auto_133657 ) ) ( not ( = ?auto_133656 ?auto_133658 ) ) ( not ( = ?auto_133656 ?auto_133659 ) ) ( not ( = ?auto_133656 ?auto_133660 ) ) ( not ( = ?auto_133656 ?auto_133661 ) ) ( not ( = ?auto_133656 ?auto_133662 ) ) ( not ( = ?auto_133657 ?auto_133658 ) ) ( not ( = ?auto_133657 ?auto_133659 ) ) ( not ( = ?auto_133657 ?auto_133660 ) ) ( not ( = ?auto_133657 ?auto_133661 ) ) ( not ( = ?auto_133657 ?auto_133662 ) ) ( not ( = ?auto_133658 ?auto_133659 ) ) ( not ( = ?auto_133658 ?auto_133660 ) ) ( not ( = ?auto_133658 ?auto_133661 ) ) ( not ( = ?auto_133658 ?auto_133662 ) ) ( not ( = ?auto_133659 ?auto_133660 ) ) ( not ( = ?auto_133659 ?auto_133661 ) ) ( not ( = ?auto_133659 ?auto_133662 ) ) ( not ( = ?auto_133660 ?auto_133661 ) ) ( not ( = ?auto_133660 ?auto_133662 ) ) ( not ( = ?auto_133661 ?auto_133662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133661 ?auto_133662 )
      ( !STACK ?auto_133661 ?auto_133660 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_133691 - BLOCK
      ?auto_133692 - BLOCK
      ?auto_133693 - BLOCK
      ?auto_133694 - BLOCK
      ?auto_133695 - BLOCK
      ?auto_133696 - BLOCK
      ?auto_133697 - BLOCK
      ?auto_133698 - BLOCK
      ?auto_133699 - BLOCK
    )
    :vars
    (
      ?auto_133700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133699 ?auto_133700 ) ( ON-TABLE ?auto_133691 ) ( ON ?auto_133692 ?auto_133691 ) ( ON ?auto_133693 ?auto_133692 ) ( ON ?auto_133694 ?auto_133693 ) ( ON ?auto_133695 ?auto_133694 ) ( ON ?auto_133696 ?auto_133695 ) ( ON ?auto_133697 ?auto_133696 ) ( not ( = ?auto_133691 ?auto_133692 ) ) ( not ( = ?auto_133691 ?auto_133693 ) ) ( not ( = ?auto_133691 ?auto_133694 ) ) ( not ( = ?auto_133691 ?auto_133695 ) ) ( not ( = ?auto_133691 ?auto_133696 ) ) ( not ( = ?auto_133691 ?auto_133697 ) ) ( not ( = ?auto_133691 ?auto_133698 ) ) ( not ( = ?auto_133691 ?auto_133699 ) ) ( not ( = ?auto_133691 ?auto_133700 ) ) ( not ( = ?auto_133692 ?auto_133693 ) ) ( not ( = ?auto_133692 ?auto_133694 ) ) ( not ( = ?auto_133692 ?auto_133695 ) ) ( not ( = ?auto_133692 ?auto_133696 ) ) ( not ( = ?auto_133692 ?auto_133697 ) ) ( not ( = ?auto_133692 ?auto_133698 ) ) ( not ( = ?auto_133692 ?auto_133699 ) ) ( not ( = ?auto_133692 ?auto_133700 ) ) ( not ( = ?auto_133693 ?auto_133694 ) ) ( not ( = ?auto_133693 ?auto_133695 ) ) ( not ( = ?auto_133693 ?auto_133696 ) ) ( not ( = ?auto_133693 ?auto_133697 ) ) ( not ( = ?auto_133693 ?auto_133698 ) ) ( not ( = ?auto_133693 ?auto_133699 ) ) ( not ( = ?auto_133693 ?auto_133700 ) ) ( not ( = ?auto_133694 ?auto_133695 ) ) ( not ( = ?auto_133694 ?auto_133696 ) ) ( not ( = ?auto_133694 ?auto_133697 ) ) ( not ( = ?auto_133694 ?auto_133698 ) ) ( not ( = ?auto_133694 ?auto_133699 ) ) ( not ( = ?auto_133694 ?auto_133700 ) ) ( not ( = ?auto_133695 ?auto_133696 ) ) ( not ( = ?auto_133695 ?auto_133697 ) ) ( not ( = ?auto_133695 ?auto_133698 ) ) ( not ( = ?auto_133695 ?auto_133699 ) ) ( not ( = ?auto_133695 ?auto_133700 ) ) ( not ( = ?auto_133696 ?auto_133697 ) ) ( not ( = ?auto_133696 ?auto_133698 ) ) ( not ( = ?auto_133696 ?auto_133699 ) ) ( not ( = ?auto_133696 ?auto_133700 ) ) ( not ( = ?auto_133697 ?auto_133698 ) ) ( not ( = ?auto_133697 ?auto_133699 ) ) ( not ( = ?auto_133697 ?auto_133700 ) ) ( not ( = ?auto_133698 ?auto_133699 ) ) ( not ( = ?auto_133698 ?auto_133700 ) ) ( not ( = ?auto_133699 ?auto_133700 ) ) ( CLEAR ?auto_133697 ) ( ON ?auto_133698 ?auto_133699 ) ( CLEAR ?auto_133698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133691 ?auto_133692 ?auto_133693 ?auto_133694 ?auto_133695 ?auto_133696 ?auto_133697 ?auto_133698 )
      ( MAKE-9PILE ?auto_133691 ?auto_133692 ?auto_133693 ?auto_133694 ?auto_133695 ?auto_133696 ?auto_133697 ?auto_133698 ?auto_133699 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_133729 - BLOCK
      ?auto_133730 - BLOCK
      ?auto_133731 - BLOCK
      ?auto_133732 - BLOCK
      ?auto_133733 - BLOCK
      ?auto_133734 - BLOCK
      ?auto_133735 - BLOCK
      ?auto_133736 - BLOCK
      ?auto_133737 - BLOCK
    )
    :vars
    (
      ?auto_133738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133737 ?auto_133738 ) ( ON-TABLE ?auto_133729 ) ( ON ?auto_133730 ?auto_133729 ) ( ON ?auto_133731 ?auto_133730 ) ( ON ?auto_133732 ?auto_133731 ) ( ON ?auto_133733 ?auto_133732 ) ( ON ?auto_133734 ?auto_133733 ) ( not ( = ?auto_133729 ?auto_133730 ) ) ( not ( = ?auto_133729 ?auto_133731 ) ) ( not ( = ?auto_133729 ?auto_133732 ) ) ( not ( = ?auto_133729 ?auto_133733 ) ) ( not ( = ?auto_133729 ?auto_133734 ) ) ( not ( = ?auto_133729 ?auto_133735 ) ) ( not ( = ?auto_133729 ?auto_133736 ) ) ( not ( = ?auto_133729 ?auto_133737 ) ) ( not ( = ?auto_133729 ?auto_133738 ) ) ( not ( = ?auto_133730 ?auto_133731 ) ) ( not ( = ?auto_133730 ?auto_133732 ) ) ( not ( = ?auto_133730 ?auto_133733 ) ) ( not ( = ?auto_133730 ?auto_133734 ) ) ( not ( = ?auto_133730 ?auto_133735 ) ) ( not ( = ?auto_133730 ?auto_133736 ) ) ( not ( = ?auto_133730 ?auto_133737 ) ) ( not ( = ?auto_133730 ?auto_133738 ) ) ( not ( = ?auto_133731 ?auto_133732 ) ) ( not ( = ?auto_133731 ?auto_133733 ) ) ( not ( = ?auto_133731 ?auto_133734 ) ) ( not ( = ?auto_133731 ?auto_133735 ) ) ( not ( = ?auto_133731 ?auto_133736 ) ) ( not ( = ?auto_133731 ?auto_133737 ) ) ( not ( = ?auto_133731 ?auto_133738 ) ) ( not ( = ?auto_133732 ?auto_133733 ) ) ( not ( = ?auto_133732 ?auto_133734 ) ) ( not ( = ?auto_133732 ?auto_133735 ) ) ( not ( = ?auto_133732 ?auto_133736 ) ) ( not ( = ?auto_133732 ?auto_133737 ) ) ( not ( = ?auto_133732 ?auto_133738 ) ) ( not ( = ?auto_133733 ?auto_133734 ) ) ( not ( = ?auto_133733 ?auto_133735 ) ) ( not ( = ?auto_133733 ?auto_133736 ) ) ( not ( = ?auto_133733 ?auto_133737 ) ) ( not ( = ?auto_133733 ?auto_133738 ) ) ( not ( = ?auto_133734 ?auto_133735 ) ) ( not ( = ?auto_133734 ?auto_133736 ) ) ( not ( = ?auto_133734 ?auto_133737 ) ) ( not ( = ?auto_133734 ?auto_133738 ) ) ( not ( = ?auto_133735 ?auto_133736 ) ) ( not ( = ?auto_133735 ?auto_133737 ) ) ( not ( = ?auto_133735 ?auto_133738 ) ) ( not ( = ?auto_133736 ?auto_133737 ) ) ( not ( = ?auto_133736 ?auto_133738 ) ) ( not ( = ?auto_133737 ?auto_133738 ) ) ( ON ?auto_133736 ?auto_133737 ) ( CLEAR ?auto_133734 ) ( ON ?auto_133735 ?auto_133736 ) ( CLEAR ?auto_133735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133729 ?auto_133730 ?auto_133731 ?auto_133732 ?auto_133733 ?auto_133734 ?auto_133735 )
      ( MAKE-9PILE ?auto_133729 ?auto_133730 ?auto_133731 ?auto_133732 ?auto_133733 ?auto_133734 ?auto_133735 ?auto_133736 ?auto_133737 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_133767 - BLOCK
      ?auto_133768 - BLOCK
      ?auto_133769 - BLOCK
      ?auto_133770 - BLOCK
      ?auto_133771 - BLOCK
      ?auto_133772 - BLOCK
      ?auto_133773 - BLOCK
      ?auto_133774 - BLOCK
      ?auto_133775 - BLOCK
    )
    :vars
    (
      ?auto_133776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133775 ?auto_133776 ) ( ON-TABLE ?auto_133767 ) ( ON ?auto_133768 ?auto_133767 ) ( ON ?auto_133769 ?auto_133768 ) ( ON ?auto_133770 ?auto_133769 ) ( ON ?auto_133771 ?auto_133770 ) ( not ( = ?auto_133767 ?auto_133768 ) ) ( not ( = ?auto_133767 ?auto_133769 ) ) ( not ( = ?auto_133767 ?auto_133770 ) ) ( not ( = ?auto_133767 ?auto_133771 ) ) ( not ( = ?auto_133767 ?auto_133772 ) ) ( not ( = ?auto_133767 ?auto_133773 ) ) ( not ( = ?auto_133767 ?auto_133774 ) ) ( not ( = ?auto_133767 ?auto_133775 ) ) ( not ( = ?auto_133767 ?auto_133776 ) ) ( not ( = ?auto_133768 ?auto_133769 ) ) ( not ( = ?auto_133768 ?auto_133770 ) ) ( not ( = ?auto_133768 ?auto_133771 ) ) ( not ( = ?auto_133768 ?auto_133772 ) ) ( not ( = ?auto_133768 ?auto_133773 ) ) ( not ( = ?auto_133768 ?auto_133774 ) ) ( not ( = ?auto_133768 ?auto_133775 ) ) ( not ( = ?auto_133768 ?auto_133776 ) ) ( not ( = ?auto_133769 ?auto_133770 ) ) ( not ( = ?auto_133769 ?auto_133771 ) ) ( not ( = ?auto_133769 ?auto_133772 ) ) ( not ( = ?auto_133769 ?auto_133773 ) ) ( not ( = ?auto_133769 ?auto_133774 ) ) ( not ( = ?auto_133769 ?auto_133775 ) ) ( not ( = ?auto_133769 ?auto_133776 ) ) ( not ( = ?auto_133770 ?auto_133771 ) ) ( not ( = ?auto_133770 ?auto_133772 ) ) ( not ( = ?auto_133770 ?auto_133773 ) ) ( not ( = ?auto_133770 ?auto_133774 ) ) ( not ( = ?auto_133770 ?auto_133775 ) ) ( not ( = ?auto_133770 ?auto_133776 ) ) ( not ( = ?auto_133771 ?auto_133772 ) ) ( not ( = ?auto_133771 ?auto_133773 ) ) ( not ( = ?auto_133771 ?auto_133774 ) ) ( not ( = ?auto_133771 ?auto_133775 ) ) ( not ( = ?auto_133771 ?auto_133776 ) ) ( not ( = ?auto_133772 ?auto_133773 ) ) ( not ( = ?auto_133772 ?auto_133774 ) ) ( not ( = ?auto_133772 ?auto_133775 ) ) ( not ( = ?auto_133772 ?auto_133776 ) ) ( not ( = ?auto_133773 ?auto_133774 ) ) ( not ( = ?auto_133773 ?auto_133775 ) ) ( not ( = ?auto_133773 ?auto_133776 ) ) ( not ( = ?auto_133774 ?auto_133775 ) ) ( not ( = ?auto_133774 ?auto_133776 ) ) ( not ( = ?auto_133775 ?auto_133776 ) ) ( ON ?auto_133774 ?auto_133775 ) ( ON ?auto_133773 ?auto_133774 ) ( CLEAR ?auto_133771 ) ( ON ?auto_133772 ?auto_133773 ) ( CLEAR ?auto_133772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133767 ?auto_133768 ?auto_133769 ?auto_133770 ?auto_133771 ?auto_133772 )
      ( MAKE-9PILE ?auto_133767 ?auto_133768 ?auto_133769 ?auto_133770 ?auto_133771 ?auto_133772 ?auto_133773 ?auto_133774 ?auto_133775 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_133805 - BLOCK
      ?auto_133806 - BLOCK
      ?auto_133807 - BLOCK
      ?auto_133808 - BLOCK
      ?auto_133809 - BLOCK
      ?auto_133810 - BLOCK
      ?auto_133811 - BLOCK
      ?auto_133812 - BLOCK
      ?auto_133813 - BLOCK
    )
    :vars
    (
      ?auto_133814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133813 ?auto_133814 ) ( ON-TABLE ?auto_133805 ) ( ON ?auto_133806 ?auto_133805 ) ( ON ?auto_133807 ?auto_133806 ) ( ON ?auto_133808 ?auto_133807 ) ( not ( = ?auto_133805 ?auto_133806 ) ) ( not ( = ?auto_133805 ?auto_133807 ) ) ( not ( = ?auto_133805 ?auto_133808 ) ) ( not ( = ?auto_133805 ?auto_133809 ) ) ( not ( = ?auto_133805 ?auto_133810 ) ) ( not ( = ?auto_133805 ?auto_133811 ) ) ( not ( = ?auto_133805 ?auto_133812 ) ) ( not ( = ?auto_133805 ?auto_133813 ) ) ( not ( = ?auto_133805 ?auto_133814 ) ) ( not ( = ?auto_133806 ?auto_133807 ) ) ( not ( = ?auto_133806 ?auto_133808 ) ) ( not ( = ?auto_133806 ?auto_133809 ) ) ( not ( = ?auto_133806 ?auto_133810 ) ) ( not ( = ?auto_133806 ?auto_133811 ) ) ( not ( = ?auto_133806 ?auto_133812 ) ) ( not ( = ?auto_133806 ?auto_133813 ) ) ( not ( = ?auto_133806 ?auto_133814 ) ) ( not ( = ?auto_133807 ?auto_133808 ) ) ( not ( = ?auto_133807 ?auto_133809 ) ) ( not ( = ?auto_133807 ?auto_133810 ) ) ( not ( = ?auto_133807 ?auto_133811 ) ) ( not ( = ?auto_133807 ?auto_133812 ) ) ( not ( = ?auto_133807 ?auto_133813 ) ) ( not ( = ?auto_133807 ?auto_133814 ) ) ( not ( = ?auto_133808 ?auto_133809 ) ) ( not ( = ?auto_133808 ?auto_133810 ) ) ( not ( = ?auto_133808 ?auto_133811 ) ) ( not ( = ?auto_133808 ?auto_133812 ) ) ( not ( = ?auto_133808 ?auto_133813 ) ) ( not ( = ?auto_133808 ?auto_133814 ) ) ( not ( = ?auto_133809 ?auto_133810 ) ) ( not ( = ?auto_133809 ?auto_133811 ) ) ( not ( = ?auto_133809 ?auto_133812 ) ) ( not ( = ?auto_133809 ?auto_133813 ) ) ( not ( = ?auto_133809 ?auto_133814 ) ) ( not ( = ?auto_133810 ?auto_133811 ) ) ( not ( = ?auto_133810 ?auto_133812 ) ) ( not ( = ?auto_133810 ?auto_133813 ) ) ( not ( = ?auto_133810 ?auto_133814 ) ) ( not ( = ?auto_133811 ?auto_133812 ) ) ( not ( = ?auto_133811 ?auto_133813 ) ) ( not ( = ?auto_133811 ?auto_133814 ) ) ( not ( = ?auto_133812 ?auto_133813 ) ) ( not ( = ?auto_133812 ?auto_133814 ) ) ( not ( = ?auto_133813 ?auto_133814 ) ) ( ON ?auto_133812 ?auto_133813 ) ( ON ?auto_133811 ?auto_133812 ) ( ON ?auto_133810 ?auto_133811 ) ( CLEAR ?auto_133808 ) ( ON ?auto_133809 ?auto_133810 ) ( CLEAR ?auto_133809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133805 ?auto_133806 ?auto_133807 ?auto_133808 ?auto_133809 )
      ( MAKE-9PILE ?auto_133805 ?auto_133806 ?auto_133807 ?auto_133808 ?auto_133809 ?auto_133810 ?auto_133811 ?auto_133812 ?auto_133813 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_133843 - BLOCK
      ?auto_133844 - BLOCK
      ?auto_133845 - BLOCK
      ?auto_133846 - BLOCK
      ?auto_133847 - BLOCK
      ?auto_133848 - BLOCK
      ?auto_133849 - BLOCK
      ?auto_133850 - BLOCK
      ?auto_133851 - BLOCK
    )
    :vars
    (
      ?auto_133852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133851 ?auto_133852 ) ( ON-TABLE ?auto_133843 ) ( ON ?auto_133844 ?auto_133843 ) ( ON ?auto_133845 ?auto_133844 ) ( not ( = ?auto_133843 ?auto_133844 ) ) ( not ( = ?auto_133843 ?auto_133845 ) ) ( not ( = ?auto_133843 ?auto_133846 ) ) ( not ( = ?auto_133843 ?auto_133847 ) ) ( not ( = ?auto_133843 ?auto_133848 ) ) ( not ( = ?auto_133843 ?auto_133849 ) ) ( not ( = ?auto_133843 ?auto_133850 ) ) ( not ( = ?auto_133843 ?auto_133851 ) ) ( not ( = ?auto_133843 ?auto_133852 ) ) ( not ( = ?auto_133844 ?auto_133845 ) ) ( not ( = ?auto_133844 ?auto_133846 ) ) ( not ( = ?auto_133844 ?auto_133847 ) ) ( not ( = ?auto_133844 ?auto_133848 ) ) ( not ( = ?auto_133844 ?auto_133849 ) ) ( not ( = ?auto_133844 ?auto_133850 ) ) ( not ( = ?auto_133844 ?auto_133851 ) ) ( not ( = ?auto_133844 ?auto_133852 ) ) ( not ( = ?auto_133845 ?auto_133846 ) ) ( not ( = ?auto_133845 ?auto_133847 ) ) ( not ( = ?auto_133845 ?auto_133848 ) ) ( not ( = ?auto_133845 ?auto_133849 ) ) ( not ( = ?auto_133845 ?auto_133850 ) ) ( not ( = ?auto_133845 ?auto_133851 ) ) ( not ( = ?auto_133845 ?auto_133852 ) ) ( not ( = ?auto_133846 ?auto_133847 ) ) ( not ( = ?auto_133846 ?auto_133848 ) ) ( not ( = ?auto_133846 ?auto_133849 ) ) ( not ( = ?auto_133846 ?auto_133850 ) ) ( not ( = ?auto_133846 ?auto_133851 ) ) ( not ( = ?auto_133846 ?auto_133852 ) ) ( not ( = ?auto_133847 ?auto_133848 ) ) ( not ( = ?auto_133847 ?auto_133849 ) ) ( not ( = ?auto_133847 ?auto_133850 ) ) ( not ( = ?auto_133847 ?auto_133851 ) ) ( not ( = ?auto_133847 ?auto_133852 ) ) ( not ( = ?auto_133848 ?auto_133849 ) ) ( not ( = ?auto_133848 ?auto_133850 ) ) ( not ( = ?auto_133848 ?auto_133851 ) ) ( not ( = ?auto_133848 ?auto_133852 ) ) ( not ( = ?auto_133849 ?auto_133850 ) ) ( not ( = ?auto_133849 ?auto_133851 ) ) ( not ( = ?auto_133849 ?auto_133852 ) ) ( not ( = ?auto_133850 ?auto_133851 ) ) ( not ( = ?auto_133850 ?auto_133852 ) ) ( not ( = ?auto_133851 ?auto_133852 ) ) ( ON ?auto_133850 ?auto_133851 ) ( ON ?auto_133849 ?auto_133850 ) ( ON ?auto_133848 ?auto_133849 ) ( ON ?auto_133847 ?auto_133848 ) ( CLEAR ?auto_133845 ) ( ON ?auto_133846 ?auto_133847 ) ( CLEAR ?auto_133846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133843 ?auto_133844 ?auto_133845 ?auto_133846 )
      ( MAKE-9PILE ?auto_133843 ?auto_133844 ?auto_133845 ?auto_133846 ?auto_133847 ?auto_133848 ?auto_133849 ?auto_133850 ?auto_133851 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_133881 - BLOCK
      ?auto_133882 - BLOCK
      ?auto_133883 - BLOCK
      ?auto_133884 - BLOCK
      ?auto_133885 - BLOCK
      ?auto_133886 - BLOCK
      ?auto_133887 - BLOCK
      ?auto_133888 - BLOCK
      ?auto_133889 - BLOCK
    )
    :vars
    (
      ?auto_133890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133889 ?auto_133890 ) ( ON-TABLE ?auto_133881 ) ( ON ?auto_133882 ?auto_133881 ) ( not ( = ?auto_133881 ?auto_133882 ) ) ( not ( = ?auto_133881 ?auto_133883 ) ) ( not ( = ?auto_133881 ?auto_133884 ) ) ( not ( = ?auto_133881 ?auto_133885 ) ) ( not ( = ?auto_133881 ?auto_133886 ) ) ( not ( = ?auto_133881 ?auto_133887 ) ) ( not ( = ?auto_133881 ?auto_133888 ) ) ( not ( = ?auto_133881 ?auto_133889 ) ) ( not ( = ?auto_133881 ?auto_133890 ) ) ( not ( = ?auto_133882 ?auto_133883 ) ) ( not ( = ?auto_133882 ?auto_133884 ) ) ( not ( = ?auto_133882 ?auto_133885 ) ) ( not ( = ?auto_133882 ?auto_133886 ) ) ( not ( = ?auto_133882 ?auto_133887 ) ) ( not ( = ?auto_133882 ?auto_133888 ) ) ( not ( = ?auto_133882 ?auto_133889 ) ) ( not ( = ?auto_133882 ?auto_133890 ) ) ( not ( = ?auto_133883 ?auto_133884 ) ) ( not ( = ?auto_133883 ?auto_133885 ) ) ( not ( = ?auto_133883 ?auto_133886 ) ) ( not ( = ?auto_133883 ?auto_133887 ) ) ( not ( = ?auto_133883 ?auto_133888 ) ) ( not ( = ?auto_133883 ?auto_133889 ) ) ( not ( = ?auto_133883 ?auto_133890 ) ) ( not ( = ?auto_133884 ?auto_133885 ) ) ( not ( = ?auto_133884 ?auto_133886 ) ) ( not ( = ?auto_133884 ?auto_133887 ) ) ( not ( = ?auto_133884 ?auto_133888 ) ) ( not ( = ?auto_133884 ?auto_133889 ) ) ( not ( = ?auto_133884 ?auto_133890 ) ) ( not ( = ?auto_133885 ?auto_133886 ) ) ( not ( = ?auto_133885 ?auto_133887 ) ) ( not ( = ?auto_133885 ?auto_133888 ) ) ( not ( = ?auto_133885 ?auto_133889 ) ) ( not ( = ?auto_133885 ?auto_133890 ) ) ( not ( = ?auto_133886 ?auto_133887 ) ) ( not ( = ?auto_133886 ?auto_133888 ) ) ( not ( = ?auto_133886 ?auto_133889 ) ) ( not ( = ?auto_133886 ?auto_133890 ) ) ( not ( = ?auto_133887 ?auto_133888 ) ) ( not ( = ?auto_133887 ?auto_133889 ) ) ( not ( = ?auto_133887 ?auto_133890 ) ) ( not ( = ?auto_133888 ?auto_133889 ) ) ( not ( = ?auto_133888 ?auto_133890 ) ) ( not ( = ?auto_133889 ?auto_133890 ) ) ( ON ?auto_133888 ?auto_133889 ) ( ON ?auto_133887 ?auto_133888 ) ( ON ?auto_133886 ?auto_133887 ) ( ON ?auto_133885 ?auto_133886 ) ( ON ?auto_133884 ?auto_133885 ) ( CLEAR ?auto_133882 ) ( ON ?auto_133883 ?auto_133884 ) ( CLEAR ?auto_133883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133881 ?auto_133882 ?auto_133883 )
      ( MAKE-9PILE ?auto_133881 ?auto_133882 ?auto_133883 ?auto_133884 ?auto_133885 ?auto_133886 ?auto_133887 ?auto_133888 ?auto_133889 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_133919 - BLOCK
      ?auto_133920 - BLOCK
      ?auto_133921 - BLOCK
      ?auto_133922 - BLOCK
      ?auto_133923 - BLOCK
      ?auto_133924 - BLOCK
      ?auto_133925 - BLOCK
      ?auto_133926 - BLOCK
      ?auto_133927 - BLOCK
    )
    :vars
    (
      ?auto_133928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133927 ?auto_133928 ) ( ON-TABLE ?auto_133919 ) ( not ( = ?auto_133919 ?auto_133920 ) ) ( not ( = ?auto_133919 ?auto_133921 ) ) ( not ( = ?auto_133919 ?auto_133922 ) ) ( not ( = ?auto_133919 ?auto_133923 ) ) ( not ( = ?auto_133919 ?auto_133924 ) ) ( not ( = ?auto_133919 ?auto_133925 ) ) ( not ( = ?auto_133919 ?auto_133926 ) ) ( not ( = ?auto_133919 ?auto_133927 ) ) ( not ( = ?auto_133919 ?auto_133928 ) ) ( not ( = ?auto_133920 ?auto_133921 ) ) ( not ( = ?auto_133920 ?auto_133922 ) ) ( not ( = ?auto_133920 ?auto_133923 ) ) ( not ( = ?auto_133920 ?auto_133924 ) ) ( not ( = ?auto_133920 ?auto_133925 ) ) ( not ( = ?auto_133920 ?auto_133926 ) ) ( not ( = ?auto_133920 ?auto_133927 ) ) ( not ( = ?auto_133920 ?auto_133928 ) ) ( not ( = ?auto_133921 ?auto_133922 ) ) ( not ( = ?auto_133921 ?auto_133923 ) ) ( not ( = ?auto_133921 ?auto_133924 ) ) ( not ( = ?auto_133921 ?auto_133925 ) ) ( not ( = ?auto_133921 ?auto_133926 ) ) ( not ( = ?auto_133921 ?auto_133927 ) ) ( not ( = ?auto_133921 ?auto_133928 ) ) ( not ( = ?auto_133922 ?auto_133923 ) ) ( not ( = ?auto_133922 ?auto_133924 ) ) ( not ( = ?auto_133922 ?auto_133925 ) ) ( not ( = ?auto_133922 ?auto_133926 ) ) ( not ( = ?auto_133922 ?auto_133927 ) ) ( not ( = ?auto_133922 ?auto_133928 ) ) ( not ( = ?auto_133923 ?auto_133924 ) ) ( not ( = ?auto_133923 ?auto_133925 ) ) ( not ( = ?auto_133923 ?auto_133926 ) ) ( not ( = ?auto_133923 ?auto_133927 ) ) ( not ( = ?auto_133923 ?auto_133928 ) ) ( not ( = ?auto_133924 ?auto_133925 ) ) ( not ( = ?auto_133924 ?auto_133926 ) ) ( not ( = ?auto_133924 ?auto_133927 ) ) ( not ( = ?auto_133924 ?auto_133928 ) ) ( not ( = ?auto_133925 ?auto_133926 ) ) ( not ( = ?auto_133925 ?auto_133927 ) ) ( not ( = ?auto_133925 ?auto_133928 ) ) ( not ( = ?auto_133926 ?auto_133927 ) ) ( not ( = ?auto_133926 ?auto_133928 ) ) ( not ( = ?auto_133927 ?auto_133928 ) ) ( ON ?auto_133926 ?auto_133927 ) ( ON ?auto_133925 ?auto_133926 ) ( ON ?auto_133924 ?auto_133925 ) ( ON ?auto_133923 ?auto_133924 ) ( ON ?auto_133922 ?auto_133923 ) ( ON ?auto_133921 ?auto_133922 ) ( CLEAR ?auto_133919 ) ( ON ?auto_133920 ?auto_133921 ) ( CLEAR ?auto_133920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133919 ?auto_133920 )
      ( MAKE-9PILE ?auto_133919 ?auto_133920 ?auto_133921 ?auto_133922 ?auto_133923 ?auto_133924 ?auto_133925 ?auto_133926 ?auto_133927 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_133957 - BLOCK
      ?auto_133958 - BLOCK
      ?auto_133959 - BLOCK
      ?auto_133960 - BLOCK
      ?auto_133961 - BLOCK
      ?auto_133962 - BLOCK
      ?auto_133963 - BLOCK
      ?auto_133964 - BLOCK
      ?auto_133965 - BLOCK
    )
    :vars
    (
      ?auto_133966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133965 ?auto_133966 ) ( not ( = ?auto_133957 ?auto_133958 ) ) ( not ( = ?auto_133957 ?auto_133959 ) ) ( not ( = ?auto_133957 ?auto_133960 ) ) ( not ( = ?auto_133957 ?auto_133961 ) ) ( not ( = ?auto_133957 ?auto_133962 ) ) ( not ( = ?auto_133957 ?auto_133963 ) ) ( not ( = ?auto_133957 ?auto_133964 ) ) ( not ( = ?auto_133957 ?auto_133965 ) ) ( not ( = ?auto_133957 ?auto_133966 ) ) ( not ( = ?auto_133958 ?auto_133959 ) ) ( not ( = ?auto_133958 ?auto_133960 ) ) ( not ( = ?auto_133958 ?auto_133961 ) ) ( not ( = ?auto_133958 ?auto_133962 ) ) ( not ( = ?auto_133958 ?auto_133963 ) ) ( not ( = ?auto_133958 ?auto_133964 ) ) ( not ( = ?auto_133958 ?auto_133965 ) ) ( not ( = ?auto_133958 ?auto_133966 ) ) ( not ( = ?auto_133959 ?auto_133960 ) ) ( not ( = ?auto_133959 ?auto_133961 ) ) ( not ( = ?auto_133959 ?auto_133962 ) ) ( not ( = ?auto_133959 ?auto_133963 ) ) ( not ( = ?auto_133959 ?auto_133964 ) ) ( not ( = ?auto_133959 ?auto_133965 ) ) ( not ( = ?auto_133959 ?auto_133966 ) ) ( not ( = ?auto_133960 ?auto_133961 ) ) ( not ( = ?auto_133960 ?auto_133962 ) ) ( not ( = ?auto_133960 ?auto_133963 ) ) ( not ( = ?auto_133960 ?auto_133964 ) ) ( not ( = ?auto_133960 ?auto_133965 ) ) ( not ( = ?auto_133960 ?auto_133966 ) ) ( not ( = ?auto_133961 ?auto_133962 ) ) ( not ( = ?auto_133961 ?auto_133963 ) ) ( not ( = ?auto_133961 ?auto_133964 ) ) ( not ( = ?auto_133961 ?auto_133965 ) ) ( not ( = ?auto_133961 ?auto_133966 ) ) ( not ( = ?auto_133962 ?auto_133963 ) ) ( not ( = ?auto_133962 ?auto_133964 ) ) ( not ( = ?auto_133962 ?auto_133965 ) ) ( not ( = ?auto_133962 ?auto_133966 ) ) ( not ( = ?auto_133963 ?auto_133964 ) ) ( not ( = ?auto_133963 ?auto_133965 ) ) ( not ( = ?auto_133963 ?auto_133966 ) ) ( not ( = ?auto_133964 ?auto_133965 ) ) ( not ( = ?auto_133964 ?auto_133966 ) ) ( not ( = ?auto_133965 ?auto_133966 ) ) ( ON ?auto_133964 ?auto_133965 ) ( ON ?auto_133963 ?auto_133964 ) ( ON ?auto_133962 ?auto_133963 ) ( ON ?auto_133961 ?auto_133962 ) ( ON ?auto_133960 ?auto_133961 ) ( ON ?auto_133959 ?auto_133960 ) ( ON ?auto_133958 ?auto_133959 ) ( ON ?auto_133957 ?auto_133958 ) ( CLEAR ?auto_133957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133957 )
      ( MAKE-9PILE ?auto_133957 ?auto_133958 ?auto_133959 ?auto_133960 ?auto_133961 ?auto_133962 ?auto_133963 ?auto_133964 ?auto_133965 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_133996 - BLOCK
      ?auto_133997 - BLOCK
      ?auto_133998 - BLOCK
      ?auto_133999 - BLOCK
      ?auto_134000 - BLOCK
      ?auto_134001 - BLOCK
      ?auto_134002 - BLOCK
      ?auto_134003 - BLOCK
      ?auto_134004 - BLOCK
      ?auto_134005 - BLOCK
    )
    :vars
    (
      ?auto_134006 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_134004 ) ( ON ?auto_134005 ?auto_134006 ) ( CLEAR ?auto_134005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133996 ) ( ON ?auto_133997 ?auto_133996 ) ( ON ?auto_133998 ?auto_133997 ) ( ON ?auto_133999 ?auto_133998 ) ( ON ?auto_134000 ?auto_133999 ) ( ON ?auto_134001 ?auto_134000 ) ( ON ?auto_134002 ?auto_134001 ) ( ON ?auto_134003 ?auto_134002 ) ( ON ?auto_134004 ?auto_134003 ) ( not ( = ?auto_133996 ?auto_133997 ) ) ( not ( = ?auto_133996 ?auto_133998 ) ) ( not ( = ?auto_133996 ?auto_133999 ) ) ( not ( = ?auto_133996 ?auto_134000 ) ) ( not ( = ?auto_133996 ?auto_134001 ) ) ( not ( = ?auto_133996 ?auto_134002 ) ) ( not ( = ?auto_133996 ?auto_134003 ) ) ( not ( = ?auto_133996 ?auto_134004 ) ) ( not ( = ?auto_133996 ?auto_134005 ) ) ( not ( = ?auto_133996 ?auto_134006 ) ) ( not ( = ?auto_133997 ?auto_133998 ) ) ( not ( = ?auto_133997 ?auto_133999 ) ) ( not ( = ?auto_133997 ?auto_134000 ) ) ( not ( = ?auto_133997 ?auto_134001 ) ) ( not ( = ?auto_133997 ?auto_134002 ) ) ( not ( = ?auto_133997 ?auto_134003 ) ) ( not ( = ?auto_133997 ?auto_134004 ) ) ( not ( = ?auto_133997 ?auto_134005 ) ) ( not ( = ?auto_133997 ?auto_134006 ) ) ( not ( = ?auto_133998 ?auto_133999 ) ) ( not ( = ?auto_133998 ?auto_134000 ) ) ( not ( = ?auto_133998 ?auto_134001 ) ) ( not ( = ?auto_133998 ?auto_134002 ) ) ( not ( = ?auto_133998 ?auto_134003 ) ) ( not ( = ?auto_133998 ?auto_134004 ) ) ( not ( = ?auto_133998 ?auto_134005 ) ) ( not ( = ?auto_133998 ?auto_134006 ) ) ( not ( = ?auto_133999 ?auto_134000 ) ) ( not ( = ?auto_133999 ?auto_134001 ) ) ( not ( = ?auto_133999 ?auto_134002 ) ) ( not ( = ?auto_133999 ?auto_134003 ) ) ( not ( = ?auto_133999 ?auto_134004 ) ) ( not ( = ?auto_133999 ?auto_134005 ) ) ( not ( = ?auto_133999 ?auto_134006 ) ) ( not ( = ?auto_134000 ?auto_134001 ) ) ( not ( = ?auto_134000 ?auto_134002 ) ) ( not ( = ?auto_134000 ?auto_134003 ) ) ( not ( = ?auto_134000 ?auto_134004 ) ) ( not ( = ?auto_134000 ?auto_134005 ) ) ( not ( = ?auto_134000 ?auto_134006 ) ) ( not ( = ?auto_134001 ?auto_134002 ) ) ( not ( = ?auto_134001 ?auto_134003 ) ) ( not ( = ?auto_134001 ?auto_134004 ) ) ( not ( = ?auto_134001 ?auto_134005 ) ) ( not ( = ?auto_134001 ?auto_134006 ) ) ( not ( = ?auto_134002 ?auto_134003 ) ) ( not ( = ?auto_134002 ?auto_134004 ) ) ( not ( = ?auto_134002 ?auto_134005 ) ) ( not ( = ?auto_134002 ?auto_134006 ) ) ( not ( = ?auto_134003 ?auto_134004 ) ) ( not ( = ?auto_134003 ?auto_134005 ) ) ( not ( = ?auto_134003 ?auto_134006 ) ) ( not ( = ?auto_134004 ?auto_134005 ) ) ( not ( = ?auto_134004 ?auto_134006 ) ) ( not ( = ?auto_134005 ?auto_134006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134005 ?auto_134006 )
      ( !STACK ?auto_134005 ?auto_134004 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_134038 - BLOCK
      ?auto_134039 - BLOCK
      ?auto_134040 - BLOCK
      ?auto_134041 - BLOCK
      ?auto_134042 - BLOCK
      ?auto_134043 - BLOCK
      ?auto_134044 - BLOCK
      ?auto_134045 - BLOCK
      ?auto_134046 - BLOCK
      ?auto_134047 - BLOCK
    )
    :vars
    (
      ?auto_134048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134047 ?auto_134048 ) ( ON-TABLE ?auto_134038 ) ( ON ?auto_134039 ?auto_134038 ) ( ON ?auto_134040 ?auto_134039 ) ( ON ?auto_134041 ?auto_134040 ) ( ON ?auto_134042 ?auto_134041 ) ( ON ?auto_134043 ?auto_134042 ) ( ON ?auto_134044 ?auto_134043 ) ( ON ?auto_134045 ?auto_134044 ) ( not ( = ?auto_134038 ?auto_134039 ) ) ( not ( = ?auto_134038 ?auto_134040 ) ) ( not ( = ?auto_134038 ?auto_134041 ) ) ( not ( = ?auto_134038 ?auto_134042 ) ) ( not ( = ?auto_134038 ?auto_134043 ) ) ( not ( = ?auto_134038 ?auto_134044 ) ) ( not ( = ?auto_134038 ?auto_134045 ) ) ( not ( = ?auto_134038 ?auto_134046 ) ) ( not ( = ?auto_134038 ?auto_134047 ) ) ( not ( = ?auto_134038 ?auto_134048 ) ) ( not ( = ?auto_134039 ?auto_134040 ) ) ( not ( = ?auto_134039 ?auto_134041 ) ) ( not ( = ?auto_134039 ?auto_134042 ) ) ( not ( = ?auto_134039 ?auto_134043 ) ) ( not ( = ?auto_134039 ?auto_134044 ) ) ( not ( = ?auto_134039 ?auto_134045 ) ) ( not ( = ?auto_134039 ?auto_134046 ) ) ( not ( = ?auto_134039 ?auto_134047 ) ) ( not ( = ?auto_134039 ?auto_134048 ) ) ( not ( = ?auto_134040 ?auto_134041 ) ) ( not ( = ?auto_134040 ?auto_134042 ) ) ( not ( = ?auto_134040 ?auto_134043 ) ) ( not ( = ?auto_134040 ?auto_134044 ) ) ( not ( = ?auto_134040 ?auto_134045 ) ) ( not ( = ?auto_134040 ?auto_134046 ) ) ( not ( = ?auto_134040 ?auto_134047 ) ) ( not ( = ?auto_134040 ?auto_134048 ) ) ( not ( = ?auto_134041 ?auto_134042 ) ) ( not ( = ?auto_134041 ?auto_134043 ) ) ( not ( = ?auto_134041 ?auto_134044 ) ) ( not ( = ?auto_134041 ?auto_134045 ) ) ( not ( = ?auto_134041 ?auto_134046 ) ) ( not ( = ?auto_134041 ?auto_134047 ) ) ( not ( = ?auto_134041 ?auto_134048 ) ) ( not ( = ?auto_134042 ?auto_134043 ) ) ( not ( = ?auto_134042 ?auto_134044 ) ) ( not ( = ?auto_134042 ?auto_134045 ) ) ( not ( = ?auto_134042 ?auto_134046 ) ) ( not ( = ?auto_134042 ?auto_134047 ) ) ( not ( = ?auto_134042 ?auto_134048 ) ) ( not ( = ?auto_134043 ?auto_134044 ) ) ( not ( = ?auto_134043 ?auto_134045 ) ) ( not ( = ?auto_134043 ?auto_134046 ) ) ( not ( = ?auto_134043 ?auto_134047 ) ) ( not ( = ?auto_134043 ?auto_134048 ) ) ( not ( = ?auto_134044 ?auto_134045 ) ) ( not ( = ?auto_134044 ?auto_134046 ) ) ( not ( = ?auto_134044 ?auto_134047 ) ) ( not ( = ?auto_134044 ?auto_134048 ) ) ( not ( = ?auto_134045 ?auto_134046 ) ) ( not ( = ?auto_134045 ?auto_134047 ) ) ( not ( = ?auto_134045 ?auto_134048 ) ) ( not ( = ?auto_134046 ?auto_134047 ) ) ( not ( = ?auto_134046 ?auto_134048 ) ) ( not ( = ?auto_134047 ?auto_134048 ) ) ( CLEAR ?auto_134045 ) ( ON ?auto_134046 ?auto_134047 ) ( CLEAR ?auto_134046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_134038 ?auto_134039 ?auto_134040 ?auto_134041 ?auto_134042 ?auto_134043 ?auto_134044 ?auto_134045 ?auto_134046 )
      ( MAKE-10PILE ?auto_134038 ?auto_134039 ?auto_134040 ?auto_134041 ?auto_134042 ?auto_134043 ?auto_134044 ?auto_134045 ?auto_134046 ?auto_134047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_134080 - BLOCK
      ?auto_134081 - BLOCK
      ?auto_134082 - BLOCK
      ?auto_134083 - BLOCK
      ?auto_134084 - BLOCK
      ?auto_134085 - BLOCK
      ?auto_134086 - BLOCK
      ?auto_134087 - BLOCK
      ?auto_134088 - BLOCK
      ?auto_134089 - BLOCK
    )
    :vars
    (
      ?auto_134090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134089 ?auto_134090 ) ( ON-TABLE ?auto_134080 ) ( ON ?auto_134081 ?auto_134080 ) ( ON ?auto_134082 ?auto_134081 ) ( ON ?auto_134083 ?auto_134082 ) ( ON ?auto_134084 ?auto_134083 ) ( ON ?auto_134085 ?auto_134084 ) ( ON ?auto_134086 ?auto_134085 ) ( not ( = ?auto_134080 ?auto_134081 ) ) ( not ( = ?auto_134080 ?auto_134082 ) ) ( not ( = ?auto_134080 ?auto_134083 ) ) ( not ( = ?auto_134080 ?auto_134084 ) ) ( not ( = ?auto_134080 ?auto_134085 ) ) ( not ( = ?auto_134080 ?auto_134086 ) ) ( not ( = ?auto_134080 ?auto_134087 ) ) ( not ( = ?auto_134080 ?auto_134088 ) ) ( not ( = ?auto_134080 ?auto_134089 ) ) ( not ( = ?auto_134080 ?auto_134090 ) ) ( not ( = ?auto_134081 ?auto_134082 ) ) ( not ( = ?auto_134081 ?auto_134083 ) ) ( not ( = ?auto_134081 ?auto_134084 ) ) ( not ( = ?auto_134081 ?auto_134085 ) ) ( not ( = ?auto_134081 ?auto_134086 ) ) ( not ( = ?auto_134081 ?auto_134087 ) ) ( not ( = ?auto_134081 ?auto_134088 ) ) ( not ( = ?auto_134081 ?auto_134089 ) ) ( not ( = ?auto_134081 ?auto_134090 ) ) ( not ( = ?auto_134082 ?auto_134083 ) ) ( not ( = ?auto_134082 ?auto_134084 ) ) ( not ( = ?auto_134082 ?auto_134085 ) ) ( not ( = ?auto_134082 ?auto_134086 ) ) ( not ( = ?auto_134082 ?auto_134087 ) ) ( not ( = ?auto_134082 ?auto_134088 ) ) ( not ( = ?auto_134082 ?auto_134089 ) ) ( not ( = ?auto_134082 ?auto_134090 ) ) ( not ( = ?auto_134083 ?auto_134084 ) ) ( not ( = ?auto_134083 ?auto_134085 ) ) ( not ( = ?auto_134083 ?auto_134086 ) ) ( not ( = ?auto_134083 ?auto_134087 ) ) ( not ( = ?auto_134083 ?auto_134088 ) ) ( not ( = ?auto_134083 ?auto_134089 ) ) ( not ( = ?auto_134083 ?auto_134090 ) ) ( not ( = ?auto_134084 ?auto_134085 ) ) ( not ( = ?auto_134084 ?auto_134086 ) ) ( not ( = ?auto_134084 ?auto_134087 ) ) ( not ( = ?auto_134084 ?auto_134088 ) ) ( not ( = ?auto_134084 ?auto_134089 ) ) ( not ( = ?auto_134084 ?auto_134090 ) ) ( not ( = ?auto_134085 ?auto_134086 ) ) ( not ( = ?auto_134085 ?auto_134087 ) ) ( not ( = ?auto_134085 ?auto_134088 ) ) ( not ( = ?auto_134085 ?auto_134089 ) ) ( not ( = ?auto_134085 ?auto_134090 ) ) ( not ( = ?auto_134086 ?auto_134087 ) ) ( not ( = ?auto_134086 ?auto_134088 ) ) ( not ( = ?auto_134086 ?auto_134089 ) ) ( not ( = ?auto_134086 ?auto_134090 ) ) ( not ( = ?auto_134087 ?auto_134088 ) ) ( not ( = ?auto_134087 ?auto_134089 ) ) ( not ( = ?auto_134087 ?auto_134090 ) ) ( not ( = ?auto_134088 ?auto_134089 ) ) ( not ( = ?auto_134088 ?auto_134090 ) ) ( not ( = ?auto_134089 ?auto_134090 ) ) ( ON ?auto_134088 ?auto_134089 ) ( CLEAR ?auto_134086 ) ( ON ?auto_134087 ?auto_134088 ) ( CLEAR ?auto_134087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134080 ?auto_134081 ?auto_134082 ?auto_134083 ?auto_134084 ?auto_134085 ?auto_134086 ?auto_134087 )
      ( MAKE-10PILE ?auto_134080 ?auto_134081 ?auto_134082 ?auto_134083 ?auto_134084 ?auto_134085 ?auto_134086 ?auto_134087 ?auto_134088 ?auto_134089 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_134122 - BLOCK
      ?auto_134123 - BLOCK
      ?auto_134124 - BLOCK
      ?auto_134125 - BLOCK
      ?auto_134126 - BLOCK
      ?auto_134127 - BLOCK
      ?auto_134128 - BLOCK
      ?auto_134129 - BLOCK
      ?auto_134130 - BLOCK
      ?auto_134131 - BLOCK
    )
    :vars
    (
      ?auto_134132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134131 ?auto_134132 ) ( ON-TABLE ?auto_134122 ) ( ON ?auto_134123 ?auto_134122 ) ( ON ?auto_134124 ?auto_134123 ) ( ON ?auto_134125 ?auto_134124 ) ( ON ?auto_134126 ?auto_134125 ) ( ON ?auto_134127 ?auto_134126 ) ( not ( = ?auto_134122 ?auto_134123 ) ) ( not ( = ?auto_134122 ?auto_134124 ) ) ( not ( = ?auto_134122 ?auto_134125 ) ) ( not ( = ?auto_134122 ?auto_134126 ) ) ( not ( = ?auto_134122 ?auto_134127 ) ) ( not ( = ?auto_134122 ?auto_134128 ) ) ( not ( = ?auto_134122 ?auto_134129 ) ) ( not ( = ?auto_134122 ?auto_134130 ) ) ( not ( = ?auto_134122 ?auto_134131 ) ) ( not ( = ?auto_134122 ?auto_134132 ) ) ( not ( = ?auto_134123 ?auto_134124 ) ) ( not ( = ?auto_134123 ?auto_134125 ) ) ( not ( = ?auto_134123 ?auto_134126 ) ) ( not ( = ?auto_134123 ?auto_134127 ) ) ( not ( = ?auto_134123 ?auto_134128 ) ) ( not ( = ?auto_134123 ?auto_134129 ) ) ( not ( = ?auto_134123 ?auto_134130 ) ) ( not ( = ?auto_134123 ?auto_134131 ) ) ( not ( = ?auto_134123 ?auto_134132 ) ) ( not ( = ?auto_134124 ?auto_134125 ) ) ( not ( = ?auto_134124 ?auto_134126 ) ) ( not ( = ?auto_134124 ?auto_134127 ) ) ( not ( = ?auto_134124 ?auto_134128 ) ) ( not ( = ?auto_134124 ?auto_134129 ) ) ( not ( = ?auto_134124 ?auto_134130 ) ) ( not ( = ?auto_134124 ?auto_134131 ) ) ( not ( = ?auto_134124 ?auto_134132 ) ) ( not ( = ?auto_134125 ?auto_134126 ) ) ( not ( = ?auto_134125 ?auto_134127 ) ) ( not ( = ?auto_134125 ?auto_134128 ) ) ( not ( = ?auto_134125 ?auto_134129 ) ) ( not ( = ?auto_134125 ?auto_134130 ) ) ( not ( = ?auto_134125 ?auto_134131 ) ) ( not ( = ?auto_134125 ?auto_134132 ) ) ( not ( = ?auto_134126 ?auto_134127 ) ) ( not ( = ?auto_134126 ?auto_134128 ) ) ( not ( = ?auto_134126 ?auto_134129 ) ) ( not ( = ?auto_134126 ?auto_134130 ) ) ( not ( = ?auto_134126 ?auto_134131 ) ) ( not ( = ?auto_134126 ?auto_134132 ) ) ( not ( = ?auto_134127 ?auto_134128 ) ) ( not ( = ?auto_134127 ?auto_134129 ) ) ( not ( = ?auto_134127 ?auto_134130 ) ) ( not ( = ?auto_134127 ?auto_134131 ) ) ( not ( = ?auto_134127 ?auto_134132 ) ) ( not ( = ?auto_134128 ?auto_134129 ) ) ( not ( = ?auto_134128 ?auto_134130 ) ) ( not ( = ?auto_134128 ?auto_134131 ) ) ( not ( = ?auto_134128 ?auto_134132 ) ) ( not ( = ?auto_134129 ?auto_134130 ) ) ( not ( = ?auto_134129 ?auto_134131 ) ) ( not ( = ?auto_134129 ?auto_134132 ) ) ( not ( = ?auto_134130 ?auto_134131 ) ) ( not ( = ?auto_134130 ?auto_134132 ) ) ( not ( = ?auto_134131 ?auto_134132 ) ) ( ON ?auto_134130 ?auto_134131 ) ( ON ?auto_134129 ?auto_134130 ) ( CLEAR ?auto_134127 ) ( ON ?auto_134128 ?auto_134129 ) ( CLEAR ?auto_134128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134122 ?auto_134123 ?auto_134124 ?auto_134125 ?auto_134126 ?auto_134127 ?auto_134128 )
      ( MAKE-10PILE ?auto_134122 ?auto_134123 ?auto_134124 ?auto_134125 ?auto_134126 ?auto_134127 ?auto_134128 ?auto_134129 ?auto_134130 ?auto_134131 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_134164 - BLOCK
      ?auto_134165 - BLOCK
      ?auto_134166 - BLOCK
      ?auto_134167 - BLOCK
      ?auto_134168 - BLOCK
      ?auto_134169 - BLOCK
      ?auto_134170 - BLOCK
      ?auto_134171 - BLOCK
      ?auto_134172 - BLOCK
      ?auto_134173 - BLOCK
    )
    :vars
    (
      ?auto_134174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134173 ?auto_134174 ) ( ON-TABLE ?auto_134164 ) ( ON ?auto_134165 ?auto_134164 ) ( ON ?auto_134166 ?auto_134165 ) ( ON ?auto_134167 ?auto_134166 ) ( ON ?auto_134168 ?auto_134167 ) ( not ( = ?auto_134164 ?auto_134165 ) ) ( not ( = ?auto_134164 ?auto_134166 ) ) ( not ( = ?auto_134164 ?auto_134167 ) ) ( not ( = ?auto_134164 ?auto_134168 ) ) ( not ( = ?auto_134164 ?auto_134169 ) ) ( not ( = ?auto_134164 ?auto_134170 ) ) ( not ( = ?auto_134164 ?auto_134171 ) ) ( not ( = ?auto_134164 ?auto_134172 ) ) ( not ( = ?auto_134164 ?auto_134173 ) ) ( not ( = ?auto_134164 ?auto_134174 ) ) ( not ( = ?auto_134165 ?auto_134166 ) ) ( not ( = ?auto_134165 ?auto_134167 ) ) ( not ( = ?auto_134165 ?auto_134168 ) ) ( not ( = ?auto_134165 ?auto_134169 ) ) ( not ( = ?auto_134165 ?auto_134170 ) ) ( not ( = ?auto_134165 ?auto_134171 ) ) ( not ( = ?auto_134165 ?auto_134172 ) ) ( not ( = ?auto_134165 ?auto_134173 ) ) ( not ( = ?auto_134165 ?auto_134174 ) ) ( not ( = ?auto_134166 ?auto_134167 ) ) ( not ( = ?auto_134166 ?auto_134168 ) ) ( not ( = ?auto_134166 ?auto_134169 ) ) ( not ( = ?auto_134166 ?auto_134170 ) ) ( not ( = ?auto_134166 ?auto_134171 ) ) ( not ( = ?auto_134166 ?auto_134172 ) ) ( not ( = ?auto_134166 ?auto_134173 ) ) ( not ( = ?auto_134166 ?auto_134174 ) ) ( not ( = ?auto_134167 ?auto_134168 ) ) ( not ( = ?auto_134167 ?auto_134169 ) ) ( not ( = ?auto_134167 ?auto_134170 ) ) ( not ( = ?auto_134167 ?auto_134171 ) ) ( not ( = ?auto_134167 ?auto_134172 ) ) ( not ( = ?auto_134167 ?auto_134173 ) ) ( not ( = ?auto_134167 ?auto_134174 ) ) ( not ( = ?auto_134168 ?auto_134169 ) ) ( not ( = ?auto_134168 ?auto_134170 ) ) ( not ( = ?auto_134168 ?auto_134171 ) ) ( not ( = ?auto_134168 ?auto_134172 ) ) ( not ( = ?auto_134168 ?auto_134173 ) ) ( not ( = ?auto_134168 ?auto_134174 ) ) ( not ( = ?auto_134169 ?auto_134170 ) ) ( not ( = ?auto_134169 ?auto_134171 ) ) ( not ( = ?auto_134169 ?auto_134172 ) ) ( not ( = ?auto_134169 ?auto_134173 ) ) ( not ( = ?auto_134169 ?auto_134174 ) ) ( not ( = ?auto_134170 ?auto_134171 ) ) ( not ( = ?auto_134170 ?auto_134172 ) ) ( not ( = ?auto_134170 ?auto_134173 ) ) ( not ( = ?auto_134170 ?auto_134174 ) ) ( not ( = ?auto_134171 ?auto_134172 ) ) ( not ( = ?auto_134171 ?auto_134173 ) ) ( not ( = ?auto_134171 ?auto_134174 ) ) ( not ( = ?auto_134172 ?auto_134173 ) ) ( not ( = ?auto_134172 ?auto_134174 ) ) ( not ( = ?auto_134173 ?auto_134174 ) ) ( ON ?auto_134172 ?auto_134173 ) ( ON ?auto_134171 ?auto_134172 ) ( ON ?auto_134170 ?auto_134171 ) ( CLEAR ?auto_134168 ) ( ON ?auto_134169 ?auto_134170 ) ( CLEAR ?auto_134169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134164 ?auto_134165 ?auto_134166 ?auto_134167 ?auto_134168 ?auto_134169 )
      ( MAKE-10PILE ?auto_134164 ?auto_134165 ?auto_134166 ?auto_134167 ?auto_134168 ?auto_134169 ?auto_134170 ?auto_134171 ?auto_134172 ?auto_134173 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_134206 - BLOCK
      ?auto_134207 - BLOCK
      ?auto_134208 - BLOCK
      ?auto_134209 - BLOCK
      ?auto_134210 - BLOCK
      ?auto_134211 - BLOCK
      ?auto_134212 - BLOCK
      ?auto_134213 - BLOCK
      ?auto_134214 - BLOCK
      ?auto_134215 - BLOCK
    )
    :vars
    (
      ?auto_134216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134215 ?auto_134216 ) ( ON-TABLE ?auto_134206 ) ( ON ?auto_134207 ?auto_134206 ) ( ON ?auto_134208 ?auto_134207 ) ( ON ?auto_134209 ?auto_134208 ) ( not ( = ?auto_134206 ?auto_134207 ) ) ( not ( = ?auto_134206 ?auto_134208 ) ) ( not ( = ?auto_134206 ?auto_134209 ) ) ( not ( = ?auto_134206 ?auto_134210 ) ) ( not ( = ?auto_134206 ?auto_134211 ) ) ( not ( = ?auto_134206 ?auto_134212 ) ) ( not ( = ?auto_134206 ?auto_134213 ) ) ( not ( = ?auto_134206 ?auto_134214 ) ) ( not ( = ?auto_134206 ?auto_134215 ) ) ( not ( = ?auto_134206 ?auto_134216 ) ) ( not ( = ?auto_134207 ?auto_134208 ) ) ( not ( = ?auto_134207 ?auto_134209 ) ) ( not ( = ?auto_134207 ?auto_134210 ) ) ( not ( = ?auto_134207 ?auto_134211 ) ) ( not ( = ?auto_134207 ?auto_134212 ) ) ( not ( = ?auto_134207 ?auto_134213 ) ) ( not ( = ?auto_134207 ?auto_134214 ) ) ( not ( = ?auto_134207 ?auto_134215 ) ) ( not ( = ?auto_134207 ?auto_134216 ) ) ( not ( = ?auto_134208 ?auto_134209 ) ) ( not ( = ?auto_134208 ?auto_134210 ) ) ( not ( = ?auto_134208 ?auto_134211 ) ) ( not ( = ?auto_134208 ?auto_134212 ) ) ( not ( = ?auto_134208 ?auto_134213 ) ) ( not ( = ?auto_134208 ?auto_134214 ) ) ( not ( = ?auto_134208 ?auto_134215 ) ) ( not ( = ?auto_134208 ?auto_134216 ) ) ( not ( = ?auto_134209 ?auto_134210 ) ) ( not ( = ?auto_134209 ?auto_134211 ) ) ( not ( = ?auto_134209 ?auto_134212 ) ) ( not ( = ?auto_134209 ?auto_134213 ) ) ( not ( = ?auto_134209 ?auto_134214 ) ) ( not ( = ?auto_134209 ?auto_134215 ) ) ( not ( = ?auto_134209 ?auto_134216 ) ) ( not ( = ?auto_134210 ?auto_134211 ) ) ( not ( = ?auto_134210 ?auto_134212 ) ) ( not ( = ?auto_134210 ?auto_134213 ) ) ( not ( = ?auto_134210 ?auto_134214 ) ) ( not ( = ?auto_134210 ?auto_134215 ) ) ( not ( = ?auto_134210 ?auto_134216 ) ) ( not ( = ?auto_134211 ?auto_134212 ) ) ( not ( = ?auto_134211 ?auto_134213 ) ) ( not ( = ?auto_134211 ?auto_134214 ) ) ( not ( = ?auto_134211 ?auto_134215 ) ) ( not ( = ?auto_134211 ?auto_134216 ) ) ( not ( = ?auto_134212 ?auto_134213 ) ) ( not ( = ?auto_134212 ?auto_134214 ) ) ( not ( = ?auto_134212 ?auto_134215 ) ) ( not ( = ?auto_134212 ?auto_134216 ) ) ( not ( = ?auto_134213 ?auto_134214 ) ) ( not ( = ?auto_134213 ?auto_134215 ) ) ( not ( = ?auto_134213 ?auto_134216 ) ) ( not ( = ?auto_134214 ?auto_134215 ) ) ( not ( = ?auto_134214 ?auto_134216 ) ) ( not ( = ?auto_134215 ?auto_134216 ) ) ( ON ?auto_134214 ?auto_134215 ) ( ON ?auto_134213 ?auto_134214 ) ( ON ?auto_134212 ?auto_134213 ) ( ON ?auto_134211 ?auto_134212 ) ( CLEAR ?auto_134209 ) ( ON ?auto_134210 ?auto_134211 ) ( CLEAR ?auto_134210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134206 ?auto_134207 ?auto_134208 ?auto_134209 ?auto_134210 )
      ( MAKE-10PILE ?auto_134206 ?auto_134207 ?auto_134208 ?auto_134209 ?auto_134210 ?auto_134211 ?auto_134212 ?auto_134213 ?auto_134214 ?auto_134215 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_134248 - BLOCK
      ?auto_134249 - BLOCK
      ?auto_134250 - BLOCK
      ?auto_134251 - BLOCK
      ?auto_134252 - BLOCK
      ?auto_134253 - BLOCK
      ?auto_134254 - BLOCK
      ?auto_134255 - BLOCK
      ?auto_134256 - BLOCK
      ?auto_134257 - BLOCK
    )
    :vars
    (
      ?auto_134258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134257 ?auto_134258 ) ( ON-TABLE ?auto_134248 ) ( ON ?auto_134249 ?auto_134248 ) ( ON ?auto_134250 ?auto_134249 ) ( not ( = ?auto_134248 ?auto_134249 ) ) ( not ( = ?auto_134248 ?auto_134250 ) ) ( not ( = ?auto_134248 ?auto_134251 ) ) ( not ( = ?auto_134248 ?auto_134252 ) ) ( not ( = ?auto_134248 ?auto_134253 ) ) ( not ( = ?auto_134248 ?auto_134254 ) ) ( not ( = ?auto_134248 ?auto_134255 ) ) ( not ( = ?auto_134248 ?auto_134256 ) ) ( not ( = ?auto_134248 ?auto_134257 ) ) ( not ( = ?auto_134248 ?auto_134258 ) ) ( not ( = ?auto_134249 ?auto_134250 ) ) ( not ( = ?auto_134249 ?auto_134251 ) ) ( not ( = ?auto_134249 ?auto_134252 ) ) ( not ( = ?auto_134249 ?auto_134253 ) ) ( not ( = ?auto_134249 ?auto_134254 ) ) ( not ( = ?auto_134249 ?auto_134255 ) ) ( not ( = ?auto_134249 ?auto_134256 ) ) ( not ( = ?auto_134249 ?auto_134257 ) ) ( not ( = ?auto_134249 ?auto_134258 ) ) ( not ( = ?auto_134250 ?auto_134251 ) ) ( not ( = ?auto_134250 ?auto_134252 ) ) ( not ( = ?auto_134250 ?auto_134253 ) ) ( not ( = ?auto_134250 ?auto_134254 ) ) ( not ( = ?auto_134250 ?auto_134255 ) ) ( not ( = ?auto_134250 ?auto_134256 ) ) ( not ( = ?auto_134250 ?auto_134257 ) ) ( not ( = ?auto_134250 ?auto_134258 ) ) ( not ( = ?auto_134251 ?auto_134252 ) ) ( not ( = ?auto_134251 ?auto_134253 ) ) ( not ( = ?auto_134251 ?auto_134254 ) ) ( not ( = ?auto_134251 ?auto_134255 ) ) ( not ( = ?auto_134251 ?auto_134256 ) ) ( not ( = ?auto_134251 ?auto_134257 ) ) ( not ( = ?auto_134251 ?auto_134258 ) ) ( not ( = ?auto_134252 ?auto_134253 ) ) ( not ( = ?auto_134252 ?auto_134254 ) ) ( not ( = ?auto_134252 ?auto_134255 ) ) ( not ( = ?auto_134252 ?auto_134256 ) ) ( not ( = ?auto_134252 ?auto_134257 ) ) ( not ( = ?auto_134252 ?auto_134258 ) ) ( not ( = ?auto_134253 ?auto_134254 ) ) ( not ( = ?auto_134253 ?auto_134255 ) ) ( not ( = ?auto_134253 ?auto_134256 ) ) ( not ( = ?auto_134253 ?auto_134257 ) ) ( not ( = ?auto_134253 ?auto_134258 ) ) ( not ( = ?auto_134254 ?auto_134255 ) ) ( not ( = ?auto_134254 ?auto_134256 ) ) ( not ( = ?auto_134254 ?auto_134257 ) ) ( not ( = ?auto_134254 ?auto_134258 ) ) ( not ( = ?auto_134255 ?auto_134256 ) ) ( not ( = ?auto_134255 ?auto_134257 ) ) ( not ( = ?auto_134255 ?auto_134258 ) ) ( not ( = ?auto_134256 ?auto_134257 ) ) ( not ( = ?auto_134256 ?auto_134258 ) ) ( not ( = ?auto_134257 ?auto_134258 ) ) ( ON ?auto_134256 ?auto_134257 ) ( ON ?auto_134255 ?auto_134256 ) ( ON ?auto_134254 ?auto_134255 ) ( ON ?auto_134253 ?auto_134254 ) ( ON ?auto_134252 ?auto_134253 ) ( CLEAR ?auto_134250 ) ( ON ?auto_134251 ?auto_134252 ) ( CLEAR ?auto_134251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134248 ?auto_134249 ?auto_134250 ?auto_134251 )
      ( MAKE-10PILE ?auto_134248 ?auto_134249 ?auto_134250 ?auto_134251 ?auto_134252 ?auto_134253 ?auto_134254 ?auto_134255 ?auto_134256 ?auto_134257 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_134290 - BLOCK
      ?auto_134291 - BLOCK
      ?auto_134292 - BLOCK
      ?auto_134293 - BLOCK
      ?auto_134294 - BLOCK
      ?auto_134295 - BLOCK
      ?auto_134296 - BLOCK
      ?auto_134297 - BLOCK
      ?auto_134298 - BLOCK
      ?auto_134299 - BLOCK
    )
    :vars
    (
      ?auto_134300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134299 ?auto_134300 ) ( ON-TABLE ?auto_134290 ) ( ON ?auto_134291 ?auto_134290 ) ( not ( = ?auto_134290 ?auto_134291 ) ) ( not ( = ?auto_134290 ?auto_134292 ) ) ( not ( = ?auto_134290 ?auto_134293 ) ) ( not ( = ?auto_134290 ?auto_134294 ) ) ( not ( = ?auto_134290 ?auto_134295 ) ) ( not ( = ?auto_134290 ?auto_134296 ) ) ( not ( = ?auto_134290 ?auto_134297 ) ) ( not ( = ?auto_134290 ?auto_134298 ) ) ( not ( = ?auto_134290 ?auto_134299 ) ) ( not ( = ?auto_134290 ?auto_134300 ) ) ( not ( = ?auto_134291 ?auto_134292 ) ) ( not ( = ?auto_134291 ?auto_134293 ) ) ( not ( = ?auto_134291 ?auto_134294 ) ) ( not ( = ?auto_134291 ?auto_134295 ) ) ( not ( = ?auto_134291 ?auto_134296 ) ) ( not ( = ?auto_134291 ?auto_134297 ) ) ( not ( = ?auto_134291 ?auto_134298 ) ) ( not ( = ?auto_134291 ?auto_134299 ) ) ( not ( = ?auto_134291 ?auto_134300 ) ) ( not ( = ?auto_134292 ?auto_134293 ) ) ( not ( = ?auto_134292 ?auto_134294 ) ) ( not ( = ?auto_134292 ?auto_134295 ) ) ( not ( = ?auto_134292 ?auto_134296 ) ) ( not ( = ?auto_134292 ?auto_134297 ) ) ( not ( = ?auto_134292 ?auto_134298 ) ) ( not ( = ?auto_134292 ?auto_134299 ) ) ( not ( = ?auto_134292 ?auto_134300 ) ) ( not ( = ?auto_134293 ?auto_134294 ) ) ( not ( = ?auto_134293 ?auto_134295 ) ) ( not ( = ?auto_134293 ?auto_134296 ) ) ( not ( = ?auto_134293 ?auto_134297 ) ) ( not ( = ?auto_134293 ?auto_134298 ) ) ( not ( = ?auto_134293 ?auto_134299 ) ) ( not ( = ?auto_134293 ?auto_134300 ) ) ( not ( = ?auto_134294 ?auto_134295 ) ) ( not ( = ?auto_134294 ?auto_134296 ) ) ( not ( = ?auto_134294 ?auto_134297 ) ) ( not ( = ?auto_134294 ?auto_134298 ) ) ( not ( = ?auto_134294 ?auto_134299 ) ) ( not ( = ?auto_134294 ?auto_134300 ) ) ( not ( = ?auto_134295 ?auto_134296 ) ) ( not ( = ?auto_134295 ?auto_134297 ) ) ( not ( = ?auto_134295 ?auto_134298 ) ) ( not ( = ?auto_134295 ?auto_134299 ) ) ( not ( = ?auto_134295 ?auto_134300 ) ) ( not ( = ?auto_134296 ?auto_134297 ) ) ( not ( = ?auto_134296 ?auto_134298 ) ) ( not ( = ?auto_134296 ?auto_134299 ) ) ( not ( = ?auto_134296 ?auto_134300 ) ) ( not ( = ?auto_134297 ?auto_134298 ) ) ( not ( = ?auto_134297 ?auto_134299 ) ) ( not ( = ?auto_134297 ?auto_134300 ) ) ( not ( = ?auto_134298 ?auto_134299 ) ) ( not ( = ?auto_134298 ?auto_134300 ) ) ( not ( = ?auto_134299 ?auto_134300 ) ) ( ON ?auto_134298 ?auto_134299 ) ( ON ?auto_134297 ?auto_134298 ) ( ON ?auto_134296 ?auto_134297 ) ( ON ?auto_134295 ?auto_134296 ) ( ON ?auto_134294 ?auto_134295 ) ( ON ?auto_134293 ?auto_134294 ) ( CLEAR ?auto_134291 ) ( ON ?auto_134292 ?auto_134293 ) ( CLEAR ?auto_134292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134290 ?auto_134291 ?auto_134292 )
      ( MAKE-10PILE ?auto_134290 ?auto_134291 ?auto_134292 ?auto_134293 ?auto_134294 ?auto_134295 ?auto_134296 ?auto_134297 ?auto_134298 ?auto_134299 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_134332 - BLOCK
      ?auto_134333 - BLOCK
      ?auto_134334 - BLOCK
      ?auto_134335 - BLOCK
      ?auto_134336 - BLOCK
      ?auto_134337 - BLOCK
      ?auto_134338 - BLOCK
      ?auto_134339 - BLOCK
      ?auto_134340 - BLOCK
      ?auto_134341 - BLOCK
    )
    :vars
    (
      ?auto_134342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134341 ?auto_134342 ) ( ON-TABLE ?auto_134332 ) ( not ( = ?auto_134332 ?auto_134333 ) ) ( not ( = ?auto_134332 ?auto_134334 ) ) ( not ( = ?auto_134332 ?auto_134335 ) ) ( not ( = ?auto_134332 ?auto_134336 ) ) ( not ( = ?auto_134332 ?auto_134337 ) ) ( not ( = ?auto_134332 ?auto_134338 ) ) ( not ( = ?auto_134332 ?auto_134339 ) ) ( not ( = ?auto_134332 ?auto_134340 ) ) ( not ( = ?auto_134332 ?auto_134341 ) ) ( not ( = ?auto_134332 ?auto_134342 ) ) ( not ( = ?auto_134333 ?auto_134334 ) ) ( not ( = ?auto_134333 ?auto_134335 ) ) ( not ( = ?auto_134333 ?auto_134336 ) ) ( not ( = ?auto_134333 ?auto_134337 ) ) ( not ( = ?auto_134333 ?auto_134338 ) ) ( not ( = ?auto_134333 ?auto_134339 ) ) ( not ( = ?auto_134333 ?auto_134340 ) ) ( not ( = ?auto_134333 ?auto_134341 ) ) ( not ( = ?auto_134333 ?auto_134342 ) ) ( not ( = ?auto_134334 ?auto_134335 ) ) ( not ( = ?auto_134334 ?auto_134336 ) ) ( not ( = ?auto_134334 ?auto_134337 ) ) ( not ( = ?auto_134334 ?auto_134338 ) ) ( not ( = ?auto_134334 ?auto_134339 ) ) ( not ( = ?auto_134334 ?auto_134340 ) ) ( not ( = ?auto_134334 ?auto_134341 ) ) ( not ( = ?auto_134334 ?auto_134342 ) ) ( not ( = ?auto_134335 ?auto_134336 ) ) ( not ( = ?auto_134335 ?auto_134337 ) ) ( not ( = ?auto_134335 ?auto_134338 ) ) ( not ( = ?auto_134335 ?auto_134339 ) ) ( not ( = ?auto_134335 ?auto_134340 ) ) ( not ( = ?auto_134335 ?auto_134341 ) ) ( not ( = ?auto_134335 ?auto_134342 ) ) ( not ( = ?auto_134336 ?auto_134337 ) ) ( not ( = ?auto_134336 ?auto_134338 ) ) ( not ( = ?auto_134336 ?auto_134339 ) ) ( not ( = ?auto_134336 ?auto_134340 ) ) ( not ( = ?auto_134336 ?auto_134341 ) ) ( not ( = ?auto_134336 ?auto_134342 ) ) ( not ( = ?auto_134337 ?auto_134338 ) ) ( not ( = ?auto_134337 ?auto_134339 ) ) ( not ( = ?auto_134337 ?auto_134340 ) ) ( not ( = ?auto_134337 ?auto_134341 ) ) ( not ( = ?auto_134337 ?auto_134342 ) ) ( not ( = ?auto_134338 ?auto_134339 ) ) ( not ( = ?auto_134338 ?auto_134340 ) ) ( not ( = ?auto_134338 ?auto_134341 ) ) ( not ( = ?auto_134338 ?auto_134342 ) ) ( not ( = ?auto_134339 ?auto_134340 ) ) ( not ( = ?auto_134339 ?auto_134341 ) ) ( not ( = ?auto_134339 ?auto_134342 ) ) ( not ( = ?auto_134340 ?auto_134341 ) ) ( not ( = ?auto_134340 ?auto_134342 ) ) ( not ( = ?auto_134341 ?auto_134342 ) ) ( ON ?auto_134340 ?auto_134341 ) ( ON ?auto_134339 ?auto_134340 ) ( ON ?auto_134338 ?auto_134339 ) ( ON ?auto_134337 ?auto_134338 ) ( ON ?auto_134336 ?auto_134337 ) ( ON ?auto_134335 ?auto_134336 ) ( ON ?auto_134334 ?auto_134335 ) ( CLEAR ?auto_134332 ) ( ON ?auto_134333 ?auto_134334 ) ( CLEAR ?auto_134333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134332 ?auto_134333 )
      ( MAKE-10PILE ?auto_134332 ?auto_134333 ?auto_134334 ?auto_134335 ?auto_134336 ?auto_134337 ?auto_134338 ?auto_134339 ?auto_134340 ?auto_134341 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_134374 - BLOCK
      ?auto_134375 - BLOCK
      ?auto_134376 - BLOCK
      ?auto_134377 - BLOCK
      ?auto_134378 - BLOCK
      ?auto_134379 - BLOCK
      ?auto_134380 - BLOCK
      ?auto_134381 - BLOCK
      ?auto_134382 - BLOCK
      ?auto_134383 - BLOCK
    )
    :vars
    (
      ?auto_134384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134383 ?auto_134384 ) ( not ( = ?auto_134374 ?auto_134375 ) ) ( not ( = ?auto_134374 ?auto_134376 ) ) ( not ( = ?auto_134374 ?auto_134377 ) ) ( not ( = ?auto_134374 ?auto_134378 ) ) ( not ( = ?auto_134374 ?auto_134379 ) ) ( not ( = ?auto_134374 ?auto_134380 ) ) ( not ( = ?auto_134374 ?auto_134381 ) ) ( not ( = ?auto_134374 ?auto_134382 ) ) ( not ( = ?auto_134374 ?auto_134383 ) ) ( not ( = ?auto_134374 ?auto_134384 ) ) ( not ( = ?auto_134375 ?auto_134376 ) ) ( not ( = ?auto_134375 ?auto_134377 ) ) ( not ( = ?auto_134375 ?auto_134378 ) ) ( not ( = ?auto_134375 ?auto_134379 ) ) ( not ( = ?auto_134375 ?auto_134380 ) ) ( not ( = ?auto_134375 ?auto_134381 ) ) ( not ( = ?auto_134375 ?auto_134382 ) ) ( not ( = ?auto_134375 ?auto_134383 ) ) ( not ( = ?auto_134375 ?auto_134384 ) ) ( not ( = ?auto_134376 ?auto_134377 ) ) ( not ( = ?auto_134376 ?auto_134378 ) ) ( not ( = ?auto_134376 ?auto_134379 ) ) ( not ( = ?auto_134376 ?auto_134380 ) ) ( not ( = ?auto_134376 ?auto_134381 ) ) ( not ( = ?auto_134376 ?auto_134382 ) ) ( not ( = ?auto_134376 ?auto_134383 ) ) ( not ( = ?auto_134376 ?auto_134384 ) ) ( not ( = ?auto_134377 ?auto_134378 ) ) ( not ( = ?auto_134377 ?auto_134379 ) ) ( not ( = ?auto_134377 ?auto_134380 ) ) ( not ( = ?auto_134377 ?auto_134381 ) ) ( not ( = ?auto_134377 ?auto_134382 ) ) ( not ( = ?auto_134377 ?auto_134383 ) ) ( not ( = ?auto_134377 ?auto_134384 ) ) ( not ( = ?auto_134378 ?auto_134379 ) ) ( not ( = ?auto_134378 ?auto_134380 ) ) ( not ( = ?auto_134378 ?auto_134381 ) ) ( not ( = ?auto_134378 ?auto_134382 ) ) ( not ( = ?auto_134378 ?auto_134383 ) ) ( not ( = ?auto_134378 ?auto_134384 ) ) ( not ( = ?auto_134379 ?auto_134380 ) ) ( not ( = ?auto_134379 ?auto_134381 ) ) ( not ( = ?auto_134379 ?auto_134382 ) ) ( not ( = ?auto_134379 ?auto_134383 ) ) ( not ( = ?auto_134379 ?auto_134384 ) ) ( not ( = ?auto_134380 ?auto_134381 ) ) ( not ( = ?auto_134380 ?auto_134382 ) ) ( not ( = ?auto_134380 ?auto_134383 ) ) ( not ( = ?auto_134380 ?auto_134384 ) ) ( not ( = ?auto_134381 ?auto_134382 ) ) ( not ( = ?auto_134381 ?auto_134383 ) ) ( not ( = ?auto_134381 ?auto_134384 ) ) ( not ( = ?auto_134382 ?auto_134383 ) ) ( not ( = ?auto_134382 ?auto_134384 ) ) ( not ( = ?auto_134383 ?auto_134384 ) ) ( ON ?auto_134382 ?auto_134383 ) ( ON ?auto_134381 ?auto_134382 ) ( ON ?auto_134380 ?auto_134381 ) ( ON ?auto_134379 ?auto_134380 ) ( ON ?auto_134378 ?auto_134379 ) ( ON ?auto_134377 ?auto_134378 ) ( ON ?auto_134376 ?auto_134377 ) ( ON ?auto_134375 ?auto_134376 ) ( ON ?auto_134374 ?auto_134375 ) ( CLEAR ?auto_134374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134374 )
      ( MAKE-10PILE ?auto_134374 ?auto_134375 ?auto_134376 ?auto_134377 ?auto_134378 ?auto_134379 ?auto_134380 ?auto_134381 ?auto_134382 ?auto_134383 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134417 - BLOCK
      ?auto_134418 - BLOCK
      ?auto_134419 - BLOCK
      ?auto_134420 - BLOCK
      ?auto_134421 - BLOCK
      ?auto_134422 - BLOCK
      ?auto_134423 - BLOCK
      ?auto_134424 - BLOCK
      ?auto_134425 - BLOCK
      ?auto_134426 - BLOCK
      ?auto_134427 - BLOCK
    )
    :vars
    (
      ?auto_134428 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_134426 ) ( ON ?auto_134427 ?auto_134428 ) ( CLEAR ?auto_134427 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134417 ) ( ON ?auto_134418 ?auto_134417 ) ( ON ?auto_134419 ?auto_134418 ) ( ON ?auto_134420 ?auto_134419 ) ( ON ?auto_134421 ?auto_134420 ) ( ON ?auto_134422 ?auto_134421 ) ( ON ?auto_134423 ?auto_134422 ) ( ON ?auto_134424 ?auto_134423 ) ( ON ?auto_134425 ?auto_134424 ) ( ON ?auto_134426 ?auto_134425 ) ( not ( = ?auto_134417 ?auto_134418 ) ) ( not ( = ?auto_134417 ?auto_134419 ) ) ( not ( = ?auto_134417 ?auto_134420 ) ) ( not ( = ?auto_134417 ?auto_134421 ) ) ( not ( = ?auto_134417 ?auto_134422 ) ) ( not ( = ?auto_134417 ?auto_134423 ) ) ( not ( = ?auto_134417 ?auto_134424 ) ) ( not ( = ?auto_134417 ?auto_134425 ) ) ( not ( = ?auto_134417 ?auto_134426 ) ) ( not ( = ?auto_134417 ?auto_134427 ) ) ( not ( = ?auto_134417 ?auto_134428 ) ) ( not ( = ?auto_134418 ?auto_134419 ) ) ( not ( = ?auto_134418 ?auto_134420 ) ) ( not ( = ?auto_134418 ?auto_134421 ) ) ( not ( = ?auto_134418 ?auto_134422 ) ) ( not ( = ?auto_134418 ?auto_134423 ) ) ( not ( = ?auto_134418 ?auto_134424 ) ) ( not ( = ?auto_134418 ?auto_134425 ) ) ( not ( = ?auto_134418 ?auto_134426 ) ) ( not ( = ?auto_134418 ?auto_134427 ) ) ( not ( = ?auto_134418 ?auto_134428 ) ) ( not ( = ?auto_134419 ?auto_134420 ) ) ( not ( = ?auto_134419 ?auto_134421 ) ) ( not ( = ?auto_134419 ?auto_134422 ) ) ( not ( = ?auto_134419 ?auto_134423 ) ) ( not ( = ?auto_134419 ?auto_134424 ) ) ( not ( = ?auto_134419 ?auto_134425 ) ) ( not ( = ?auto_134419 ?auto_134426 ) ) ( not ( = ?auto_134419 ?auto_134427 ) ) ( not ( = ?auto_134419 ?auto_134428 ) ) ( not ( = ?auto_134420 ?auto_134421 ) ) ( not ( = ?auto_134420 ?auto_134422 ) ) ( not ( = ?auto_134420 ?auto_134423 ) ) ( not ( = ?auto_134420 ?auto_134424 ) ) ( not ( = ?auto_134420 ?auto_134425 ) ) ( not ( = ?auto_134420 ?auto_134426 ) ) ( not ( = ?auto_134420 ?auto_134427 ) ) ( not ( = ?auto_134420 ?auto_134428 ) ) ( not ( = ?auto_134421 ?auto_134422 ) ) ( not ( = ?auto_134421 ?auto_134423 ) ) ( not ( = ?auto_134421 ?auto_134424 ) ) ( not ( = ?auto_134421 ?auto_134425 ) ) ( not ( = ?auto_134421 ?auto_134426 ) ) ( not ( = ?auto_134421 ?auto_134427 ) ) ( not ( = ?auto_134421 ?auto_134428 ) ) ( not ( = ?auto_134422 ?auto_134423 ) ) ( not ( = ?auto_134422 ?auto_134424 ) ) ( not ( = ?auto_134422 ?auto_134425 ) ) ( not ( = ?auto_134422 ?auto_134426 ) ) ( not ( = ?auto_134422 ?auto_134427 ) ) ( not ( = ?auto_134422 ?auto_134428 ) ) ( not ( = ?auto_134423 ?auto_134424 ) ) ( not ( = ?auto_134423 ?auto_134425 ) ) ( not ( = ?auto_134423 ?auto_134426 ) ) ( not ( = ?auto_134423 ?auto_134427 ) ) ( not ( = ?auto_134423 ?auto_134428 ) ) ( not ( = ?auto_134424 ?auto_134425 ) ) ( not ( = ?auto_134424 ?auto_134426 ) ) ( not ( = ?auto_134424 ?auto_134427 ) ) ( not ( = ?auto_134424 ?auto_134428 ) ) ( not ( = ?auto_134425 ?auto_134426 ) ) ( not ( = ?auto_134425 ?auto_134427 ) ) ( not ( = ?auto_134425 ?auto_134428 ) ) ( not ( = ?auto_134426 ?auto_134427 ) ) ( not ( = ?auto_134426 ?auto_134428 ) ) ( not ( = ?auto_134427 ?auto_134428 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134427 ?auto_134428 )
      ( !STACK ?auto_134427 ?auto_134426 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134440 - BLOCK
      ?auto_134441 - BLOCK
      ?auto_134442 - BLOCK
      ?auto_134443 - BLOCK
      ?auto_134444 - BLOCK
      ?auto_134445 - BLOCK
      ?auto_134446 - BLOCK
      ?auto_134447 - BLOCK
      ?auto_134448 - BLOCK
      ?auto_134449 - BLOCK
      ?auto_134450 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_134449 ) ( ON-TABLE ?auto_134450 ) ( CLEAR ?auto_134450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134440 ) ( ON ?auto_134441 ?auto_134440 ) ( ON ?auto_134442 ?auto_134441 ) ( ON ?auto_134443 ?auto_134442 ) ( ON ?auto_134444 ?auto_134443 ) ( ON ?auto_134445 ?auto_134444 ) ( ON ?auto_134446 ?auto_134445 ) ( ON ?auto_134447 ?auto_134446 ) ( ON ?auto_134448 ?auto_134447 ) ( ON ?auto_134449 ?auto_134448 ) ( not ( = ?auto_134440 ?auto_134441 ) ) ( not ( = ?auto_134440 ?auto_134442 ) ) ( not ( = ?auto_134440 ?auto_134443 ) ) ( not ( = ?auto_134440 ?auto_134444 ) ) ( not ( = ?auto_134440 ?auto_134445 ) ) ( not ( = ?auto_134440 ?auto_134446 ) ) ( not ( = ?auto_134440 ?auto_134447 ) ) ( not ( = ?auto_134440 ?auto_134448 ) ) ( not ( = ?auto_134440 ?auto_134449 ) ) ( not ( = ?auto_134440 ?auto_134450 ) ) ( not ( = ?auto_134441 ?auto_134442 ) ) ( not ( = ?auto_134441 ?auto_134443 ) ) ( not ( = ?auto_134441 ?auto_134444 ) ) ( not ( = ?auto_134441 ?auto_134445 ) ) ( not ( = ?auto_134441 ?auto_134446 ) ) ( not ( = ?auto_134441 ?auto_134447 ) ) ( not ( = ?auto_134441 ?auto_134448 ) ) ( not ( = ?auto_134441 ?auto_134449 ) ) ( not ( = ?auto_134441 ?auto_134450 ) ) ( not ( = ?auto_134442 ?auto_134443 ) ) ( not ( = ?auto_134442 ?auto_134444 ) ) ( not ( = ?auto_134442 ?auto_134445 ) ) ( not ( = ?auto_134442 ?auto_134446 ) ) ( not ( = ?auto_134442 ?auto_134447 ) ) ( not ( = ?auto_134442 ?auto_134448 ) ) ( not ( = ?auto_134442 ?auto_134449 ) ) ( not ( = ?auto_134442 ?auto_134450 ) ) ( not ( = ?auto_134443 ?auto_134444 ) ) ( not ( = ?auto_134443 ?auto_134445 ) ) ( not ( = ?auto_134443 ?auto_134446 ) ) ( not ( = ?auto_134443 ?auto_134447 ) ) ( not ( = ?auto_134443 ?auto_134448 ) ) ( not ( = ?auto_134443 ?auto_134449 ) ) ( not ( = ?auto_134443 ?auto_134450 ) ) ( not ( = ?auto_134444 ?auto_134445 ) ) ( not ( = ?auto_134444 ?auto_134446 ) ) ( not ( = ?auto_134444 ?auto_134447 ) ) ( not ( = ?auto_134444 ?auto_134448 ) ) ( not ( = ?auto_134444 ?auto_134449 ) ) ( not ( = ?auto_134444 ?auto_134450 ) ) ( not ( = ?auto_134445 ?auto_134446 ) ) ( not ( = ?auto_134445 ?auto_134447 ) ) ( not ( = ?auto_134445 ?auto_134448 ) ) ( not ( = ?auto_134445 ?auto_134449 ) ) ( not ( = ?auto_134445 ?auto_134450 ) ) ( not ( = ?auto_134446 ?auto_134447 ) ) ( not ( = ?auto_134446 ?auto_134448 ) ) ( not ( = ?auto_134446 ?auto_134449 ) ) ( not ( = ?auto_134446 ?auto_134450 ) ) ( not ( = ?auto_134447 ?auto_134448 ) ) ( not ( = ?auto_134447 ?auto_134449 ) ) ( not ( = ?auto_134447 ?auto_134450 ) ) ( not ( = ?auto_134448 ?auto_134449 ) ) ( not ( = ?auto_134448 ?auto_134450 ) ) ( not ( = ?auto_134449 ?auto_134450 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_134450 )
      ( !STACK ?auto_134450 ?auto_134449 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134462 - BLOCK
      ?auto_134463 - BLOCK
      ?auto_134464 - BLOCK
      ?auto_134465 - BLOCK
      ?auto_134466 - BLOCK
      ?auto_134467 - BLOCK
      ?auto_134468 - BLOCK
      ?auto_134469 - BLOCK
      ?auto_134470 - BLOCK
      ?auto_134471 - BLOCK
      ?auto_134472 - BLOCK
    )
    :vars
    (
      ?auto_134473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134472 ?auto_134473 ) ( ON-TABLE ?auto_134462 ) ( ON ?auto_134463 ?auto_134462 ) ( ON ?auto_134464 ?auto_134463 ) ( ON ?auto_134465 ?auto_134464 ) ( ON ?auto_134466 ?auto_134465 ) ( ON ?auto_134467 ?auto_134466 ) ( ON ?auto_134468 ?auto_134467 ) ( ON ?auto_134469 ?auto_134468 ) ( ON ?auto_134470 ?auto_134469 ) ( not ( = ?auto_134462 ?auto_134463 ) ) ( not ( = ?auto_134462 ?auto_134464 ) ) ( not ( = ?auto_134462 ?auto_134465 ) ) ( not ( = ?auto_134462 ?auto_134466 ) ) ( not ( = ?auto_134462 ?auto_134467 ) ) ( not ( = ?auto_134462 ?auto_134468 ) ) ( not ( = ?auto_134462 ?auto_134469 ) ) ( not ( = ?auto_134462 ?auto_134470 ) ) ( not ( = ?auto_134462 ?auto_134471 ) ) ( not ( = ?auto_134462 ?auto_134472 ) ) ( not ( = ?auto_134462 ?auto_134473 ) ) ( not ( = ?auto_134463 ?auto_134464 ) ) ( not ( = ?auto_134463 ?auto_134465 ) ) ( not ( = ?auto_134463 ?auto_134466 ) ) ( not ( = ?auto_134463 ?auto_134467 ) ) ( not ( = ?auto_134463 ?auto_134468 ) ) ( not ( = ?auto_134463 ?auto_134469 ) ) ( not ( = ?auto_134463 ?auto_134470 ) ) ( not ( = ?auto_134463 ?auto_134471 ) ) ( not ( = ?auto_134463 ?auto_134472 ) ) ( not ( = ?auto_134463 ?auto_134473 ) ) ( not ( = ?auto_134464 ?auto_134465 ) ) ( not ( = ?auto_134464 ?auto_134466 ) ) ( not ( = ?auto_134464 ?auto_134467 ) ) ( not ( = ?auto_134464 ?auto_134468 ) ) ( not ( = ?auto_134464 ?auto_134469 ) ) ( not ( = ?auto_134464 ?auto_134470 ) ) ( not ( = ?auto_134464 ?auto_134471 ) ) ( not ( = ?auto_134464 ?auto_134472 ) ) ( not ( = ?auto_134464 ?auto_134473 ) ) ( not ( = ?auto_134465 ?auto_134466 ) ) ( not ( = ?auto_134465 ?auto_134467 ) ) ( not ( = ?auto_134465 ?auto_134468 ) ) ( not ( = ?auto_134465 ?auto_134469 ) ) ( not ( = ?auto_134465 ?auto_134470 ) ) ( not ( = ?auto_134465 ?auto_134471 ) ) ( not ( = ?auto_134465 ?auto_134472 ) ) ( not ( = ?auto_134465 ?auto_134473 ) ) ( not ( = ?auto_134466 ?auto_134467 ) ) ( not ( = ?auto_134466 ?auto_134468 ) ) ( not ( = ?auto_134466 ?auto_134469 ) ) ( not ( = ?auto_134466 ?auto_134470 ) ) ( not ( = ?auto_134466 ?auto_134471 ) ) ( not ( = ?auto_134466 ?auto_134472 ) ) ( not ( = ?auto_134466 ?auto_134473 ) ) ( not ( = ?auto_134467 ?auto_134468 ) ) ( not ( = ?auto_134467 ?auto_134469 ) ) ( not ( = ?auto_134467 ?auto_134470 ) ) ( not ( = ?auto_134467 ?auto_134471 ) ) ( not ( = ?auto_134467 ?auto_134472 ) ) ( not ( = ?auto_134467 ?auto_134473 ) ) ( not ( = ?auto_134468 ?auto_134469 ) ) ( not ( = ?auto_134468 ?auto_134470 ) ) ( not ( = ?auto_134468 ?auto_134471 ) ) ( not ( = ?auto_134468 ?auto_134472 ) ) ( not ( = ?auto_134468 ?auto_134473 ) ) ( not ( = ?auto_134469 ?auto_134470 ) ) ( not ( = ?auto_134469 ?auto_134471 ) ) ( not ( = ?auto_134469 ?auto_134472 ) ) ( not ( = ?auto_134469 ?auto_134473 ) ) ( not ( = ?auto_134470 ?auto_134471 ) ) ( not ( = ?auto_134470 ?auto_134472 ) ) ( not ( = ?auto_134470 ?auto_134473 ) ) ( not ( = ?auto_134471 ?auto_134472 ) ) ( not ( = ?auto_134471 ?auto_134473 ) ) ( not ( = ?auto_134472 ?auto_134473 ) ) ( CLEAR ?auto_134470 ) ( ON ?auto_134471 ?auto_134472 ) ( CLEAR ?auto_134471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_134462 ?auto_134463 ?auto_134464 ?auto_134465 ?auto_134466 ?auto_134467 ?auto_134468 ?auto_134469 ?auto_134470 ?auto_134471 )
      ( MAKE-11PILE ?auto_134462 ?auto_134463 ?auto_134464 ?auto_134465 ?auto_134466 ?auto_134467 ?auto_134468 ?auto_134469 ?auto_134470 ?auto_134471 ?auto_134472 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134485 - BLOCK
      ?auto_134486 - BLOCK
      ?auto_134487 - BLOCK
      ?auto_134488 - BLOCK
      ?auto_134489 - BLOCK
      ?auto_134490 - BLOCK
      ?auto_134491 - BLOCK
      ?auto_134492 - BLOCK
      ?auto_134493 - BLOCK
      ?auto_134494 - BLOCK
      ?auto_134495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134495 ) ( ON-TABLE ?auto_134485 ) ( ON ?auto_134486 ?auto_134485 ) ( ON ?auto_134487 ?auto_134486 ) ( ON ?auto_134488 ?auto_134487 ) ( ON ?auto_134489 ?auto_134488 ) ( ON ?auto_134490 ?auto_134489 ) ( ON ?auto_134491 ?auto_134490 ) ( ON ?auto_134492 ?auto_134491 ) ( ON ?auto_134493 ?auto_134492 ) ( not ( = ?auto_134485 ?auto_134486 ) ) ( not ( = ?auto_134485 ?auto_134487 ) ) ( not ( = ?auto_134485 ?auto_134488 ) ) ( not ( = ?auto_134485 ?auto_134489 ) ) ( not ( = ?auto_134485 ?auto_134490 ) ) ( not ( = ?auto_134485 ?auto_134491 ) ) ( not ( = ?auto_134485 ?auto_134492 ) ) ( not ( = ?auto_134485 ?auto_134493 ) ) ( not ( = ?auto_134485 ?auto_134494 ) ) ( not ( = ?auto_134485 ?auto_134495 ) ) ( not ( = ?auto_134486 ?auto_134487 ) ) ( not ( = ?auto_134486 ?auto_134488 ) ) ( not ( = ?auto_134486 ?auto_134489 ) ) ( not ( = ?auto_134486 ?auto_134490 ) ) ( not ( = ?auto_134486 ?auto_134491 ) ) ( not ( = ?auto_134486 ?auto_134492 ) ) ( not ( = ?auto_134486 ?auto_134493 ) ) ( not ( = ?auto_134486 ?auto_134494 ) ) ( not ( = ?auto_134486 ?auto_134495 ) ) ( not ( = ?auto_134487 ?auto_134488 ) ) ( not ( = ?auto_134487 ?auto_134489 ) ) ( not ( = ?auto_134487 ?auto_134490 ) ) ( not ( = ?auto_134487 ?auto_134491 ) ) ( not ( = ?auto_134487 ?auto_134492 ) ) ( not ( = ?auto_134487 ?auto_134493 ) ) ( not ( = ?auto_134487 ?auto_134494 ) ) ( not ( = ?auto_134487 ?auto_134495 ) ) ( not ( = ?auto_134488 ?auto_134489 ) ) ( not ( = ?auto_134488 ?auto_134490 ) ) ( not ( = ?auto_134488 ?auto_134491 ) ) ( not ( = ?auto_134488 ?auto_134492 ) ) ( not ( = ?auto_134488 ?auto_134493 ) ) ( not ( = ?auto_134488 ?auto_134494 ) ) ( not ( = ?auto_134488 ?auto_134495 ) ) ( not ( = ?auto_134489 ?auto_134490 ) ) ( not ( = ?auto_134489 ?auto_134491 ) ) ( not ( = ?auto_134489 ?auto_134492 ) ) ( not ( = ?auto_134489 ?auto_134493 ) ) ( not ( = ?auto_134489 ?auto_134494 ) ) ( not ( = ?auto_134489 ?auto_134495 ) ) ( not ( = ?auto_134490 ?auto_134491 ) ) ( not ( = ?auto_134490 ?auto_134492 ) ) ( not ( = ?auto_134490 ?auto_134493 ) ) ( not ( = ?auto_134490 ?auto_134494 ) ) ( not ( = ?auto_134490 ?auto_134495 ) ) ( not ( = ?auto_134491 ?auto_134492 ) ) ( not ( = ?auto_134491 ?auto_134493 ) ) ( not ( = ?auto_134491 ?auto_134494 ) ) ( not ( = ?auto_134491 ?auto_134495 ) ) ( not ( = ?auto_134492 ?auto_134493 ) ) ( not ( = ?auto_134492 ?auto_134494 ) ) ( not ( = ?auto_134492 ?auto_134495 ) ) ( not ( = ?auto_134493 ?auto_134494 ) ) ( not ( = ?auto_134493 ?auto_134495 ) ) ( not ( = ?auto_134494 ?auto_134495 ) ) ( CLEAR ?auto_134493 ) ( ON ?auto_134494 ?auto_134495 ) ( CLEAR ?auto_134494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_134485 ?auto_134486 ?auto_134487 ?auto_134488 ?auto_134489 ?auto_134490 ?auto_134491 ?auto_134492 ?auto_134493 ?auto_134494 )
      ( MAKE-11PILE ?auto_134485 ?auto_134486 ?auto_134487 ?auto_134488 ?auto_134489 ?auto_134490 ?auto_134491 ?auto_134492 ?auto_134493 ?auto_134494 ?auto_134495 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134507 - BLOCK
      ?auto_134508 - BLOCK
      ?auto_134509 - BLOCK
      ?auto_134510 - BLOCK
      ?auto_134511 - BLOCK
      ?auto_134512 - BLOCK
      ?auto_134513 - BLOCK
      ?auto_134514 - BLOCK
      ?auto_134515 - BLOCK
      ?auto_134516 - BLOCK
      ?auto_134517 - BLOCK
    )
    :vars
    (
      ?auto_134518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134517 ?auto_134518 ) ( ON-TABLE ?auto_134507 ) ( ON ?auto_134508 ?auto_134507 ) ( ON ?auto_134509 ?auto_134508 ) ( ON ?auto_134510 ?auto_134509 ) ( ON ?auto_134511 ?auto_134510 ) ( ON ?auto_134512 ?auto_134511 ) ( ON ?auto_134513 ?auto_134512 ) ( ON ?auto_134514 ?auto_134513 ) ( not ( = ?auto_134507 ?auto_134508 ) ) ( not ( = ?auto_134507 ?auto_134509 ) ) ( not ( = ?auto_134507 ?auto_134510 ) ) ( not ( = ?auto_134507 ?auto_134511 ) ) ( not ( = ?auto_134507 ?auto_134512 ) ) ( not ( = ?auto_134507 ?auto_134513 ) ) ( not ( = ?auto_134507 ?auto_134514 ) ) ( not ( = ?auto_134507 ?auto_134515 ) ) ( not ( = ?auto_134507 ?auto_134516 ) ) ( not ( = ?auto_134507 ?auto_134517 ) ) ( not ( = ?auto_134507 ?auto_134518 ) ) ( not ( = ?auto_134508 ?auto_134509 ) ) ( not ( = ?auto_134508 ?auto_134510 ) ) ( not ( = ?auto_134508 ?auto_134511 ) ) ( not ( = ?auto_134508 ?auto_134512 ) ) ( not ( = ?auto_134508 ?auto_134513 ) ) ( not ( = ?auto_134508 ?auto_134514 ) ) ( not ( = ?auto_134508 ?auto_134515 ) ) ( not ( = ?auto_134508 ?auto_134516 ) ) ( not ( = ?auto_134508 ?auto_134517 ) ) ( not ( = ?auto_134508 ?auto_134518 ) ) ( not ( = ?auto_134509 ?auto_134510 ) ) ( not ( = ?auto_134509 ?auto_134511 ) ) ( not ( = ?auto_134509 ?auto_134512 ) ) ( not ( = ?auto_134509 ?auto_134513 ) ) ( not ( = ?auto_134509 ?auto_134514 ) ) ( not ( = ?auto_134509 ?auto_134515 ) ) ( not ( = ?auto_134509 ?auto_134516 ) ) ( not ( = ?auto_134509 ?auto_134517 ) ) ( not ( = ?auto_134509 ?auto_134518 ) ) ( not ( = ?auto_134510 ?auto_134511 ) ) ( not ( = ?auto_134510 ?auto_134512 ) ) ( not ( = ?auto_134510 ?auto_134513 ) ) ( not ( = ?auto_134510 ?auto_134514 ) ) ( not ( = ?auto_134510 ?auto_134515 ) ) ( not ( = ?auto_134510 ?auto_134516 ) ) ( not ( = ?auto_134510 ?auto_134517 ) ) ( not ( = ?auto_134510 ?auto_134518 ) ) ( not ( = ?auto_134511 ?auto_134512 ) ) ( not ( = ?auto_134511 ?auto_134513 ) ) ( not ( = ?auto_134511 ?auto_134514 ) ) ( not ( = ?auto_134511 ?auto_134515 ) ) ( not ( = ?auto_134511 ?auto_134516 ) ) ( not ( = ?auto_134511 ?auto_134517 ) ) ( not ( = ?auto_134511 ?auto_134518 ) ) ( not ( = ?auto_134512 ?auto_134513 ) ) ( not ( = ?auto_134512 ?auto_134514 ) ) ( not ( = ?auto_134512 ?auto_134515 ) ) ( not ( = ?auto_134512 ?auto_134516 ) ) ( not ( = ?auto_134512 ?auto_134517 ) ) ( not ( = ?auto_134512 ?auto_134518 ) ) ( not ( = ?auto_134513 ?auto_134514 ) ) ( not ( = ?auto_134513 ?auto_134515 ) ) ( not ( = ?auto_134513 ?auto_134516 ) ) ( not ( = ?auto_134513 ?auto_134517 ) ) ( not ( = ?auto_134513 ?auto_134518 ) ) ( not ( = ?auto_134514 ?auto_134515 ) ) ( not ( = ?auto_134514 ?auto_134516 ) ) ( not ( = ?auto_134514 ?auto_134517 ) ) ( not ( = ?auto_134514 ?auto_134518 ) ) ( not ( = ?auto_134515 ?auto_134516 ) ) ( not ( = ?auto_134515 ?auto_134517 ) ) ( not ( = ?auto_134515 ?auto_134518 ) ) ( not ( = ?auto_134516 ?auto_134517 ) ) ( not ( = ?auto_134516 ?auto_134518 ) ) ( not ( = ?auto_134517 ?auto_134518 ) ) ( ON ?auto_134516 ?auto_134517 ) ( CLEAR ?auto_134514 ) ( ON ?auto_134515 ?auto_134516 ) ( CLEAR ?auto_134515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_134507 ?auto_134508 ?auto_134509 ?auto_134510 ?auto_134511 ?auto_134512 ?auto_134513 ?auto_134514 ?auto_134515 )
      ( MAKE-11PILE ?auto_134507 ?auto_134508 ?auto_134509 ?auto_134510 ?auto_134511 ?auto_134512 ?auto_134513 ?auto_134514 ?auto_134515 ?auto_134516 ?auto_134517 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134530 - BLOCK
      ?auto_134531 - BLOCK
      ?auto_134532 - BLOCK
      ?auto_134533 - BLOCK
      ?auto_134534 - BLOCK
      ?auto_134535 - BLOCK
      ?auto_134536 - BLOCK
      ?auto_134537 - BLOCK
      ?auto_134538 - BLOCK
      ?auto_134539 - BLOCK
      ?auto_134540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134540 ) ( ON-TABLE ?auto_134530 ) ( ON ?auto_134531 ?auto_134530 ) ( ON ?auto_134532 ?auto_134531 ) ( ON ?auto_134533 ?auto_134532 ) ( ON ?auto_134534 ?auto_134533 ) ( ON ?auto_134535 ?auto_134534 ) ( ON ?auto_134536 ?auto_134535 ) ( ON ?auto_134537 ?auto_134536 ) ( not ( = ?auto_134530 ?auto_134531 ) ) ( not ( = ?auto_134530 ?auto_134532 ) ) ( not ( = ?auto_134530 ?auto_134533 ) ) ( not ( = ?auto_134530 ?auto_134534 ) ) ( not ( = ?auto_134530 ?auto_134535 ) ) ( not ( = ?auto_134530 ?auto_134536 ) ) ( not ( = ?auto_134530 ?auto_134537 ) ) ( not ( = ?auto_134530 ?auto_134538 ) ) ( not ( = ?auto_134530 ?auto_134539 ) ) ( not ( = ?auto_134530 ?auto_134540 ) ) ( not ( = ?auto_134531 ?auto_134532 ) ) ( not ( = ?auto_134531 ?auto_134533 ) ) ( not ( = ?auto_134531 ?auto_134534 ) ) ( not ( = ?auto_134531 ?auto_134535 ) ) ( not ( = ?auto_134531 ?auto_134536 ) ) ( not ( = ?auto_134531 ?auto_134537 ) ) ( not ( = ?auto_134531 ?auto_134538 ) ) ( not ( = ?auto_134531 ?auto_134539 ) ) ( not ( = ?auto_134531 ?auto_134540 ) ) ( not ( = ?auto_134532 ?auto_134533 ) ) ( not ( = ?auto_134532 ?auto_134534 ) ) ( not ( = ?auto_134532 ?auto_134535 ) ) ( not ( = ?auto_134532 ?auto_134536 ) ) ( not ( = ?auto_134532 ?auto_134537 ) ) ( not ( = ?auto_134532 ?auto_134538 ) ) ( not ( = ?auto_134532 ?auto_134539 ) ) ( not ( = ?auto_134532 ?auto_134540 ) ) ( not ( = ?auto_134533 ?auto_134534 ) ) ( not ( = ?auto_134533 ?auto_134535 ) ) ( not ( = ?auto_134533 ?auto_134536 ) ) ( not ( = ?auto_134533 ?auto_134537 ) ) ( not ( = ?auto_134533 ?auto_134538 ) ) ( not ( = ?auto_134533 ?auto_134539 ) ) ( not ( = ?auto_134533 ?auto_134540 ) ) ( not ( = ?auto_134534 ?auto_134535 ) ) ( not ( = ?auto_134534 ?auto_134536 ) ) ( not ( = ?auto_134534 ?auto_134537 ) ) ( not ( = ?auto_134534 ?auto_134538 ) ) ( not ( = ?auto_134534 ?auto_134539 ) ) ( not ( = ?auto_134534 ?auto_134540 ) ) ( not ( = ?auto_134535 ?auto_134536 ) ) ( not ( = ?auto_134535 ?auto_134537 ) ) ( not ( = ?auto_134535 ?auto_134538 ) ) ( not ( = ?auto_134535 ?auto_134539 ) ) ( not ( = ?auto_134535 ?auto_134540 ) ) ( not ( = ?auto_134536 ?auto_134537 ) ) ( not ( = ?auto_134536 ?auto_134538 ) ) ( not ( = ?auto_134536 ?auto_134539 ) ) ( not ( = ?auto_134536 ?auto_134540 ) ) ( not ( = ?auto_134537 ?auto_134538 ) ) ( not ( = ?auto_134537 ?auto_134539 ) ) ( not ( = ?auto_134537 ?auto_134540 ) ) ( not ( = ?auto_134538 ?auto_134539 ) ) ( not ( = ?auto_134538 ?auto_134540 ) ) ( not ( = ?auto_134539 ?auto_134540 ) ) ( ON ?auto_134539 ?auto_134540 ) ( CLEAR ?auto_134537 ) ( ON ?auto_134538 ?auto_134539 ) ( CLEAR ?auto_134538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_134530 ?auto_134531 ?auto_134532 ?auto_134533 ?auto_134534 ?auto_134535 ?auto_134536 ?auto_134537 ?auto_134538 )
      ( MAKE-11PILE ?auto_134530 ?auto_134531 ?auto_134532 ?auto_134533 ?auto_134534 ?auto_134535 ?auto_134536 ?auto_134537 ?auto_134538 ?auto_134539 ?auto_134540 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134552 - BLOCK
      ?auto_134553 - BLOCK
      ?auto_134554 - BLOCK
      ?auto_134555 - BLOCK
      ?auto_134556 - BLOCK
      ?auto_134557 - BLOCK
      ?auto_134558 - BLOCK
      ?auto_134559 - BLOCK
      ?auto_134560 - BLOCK
      ?auto_134561 - BLOCK
      ?auto_134562 - BLOCK
    )
    :vars
    (
      ?auto_134563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134562 ?auto_134563 ) ( ON-TABLE ?auto_134552 ) ( ON ?auto_134553 ?auto_134552 ) ( ON ?auto_134554 ?auto_134553 ) ( ON ?auto_134555 ?auto_134554 ) ( ON ?auto_134556 ?auto_134555 ) ( ON ?auto_134557 ?auto_134556 ) ( ON ?auto_134558 ?auto_134557 ) ( not ( = ?auto_134552 ?auto_134553 ) ) ( not ( = ?auto_134552 ?auto_134554 ) ) ( not ( = ?auto_134552 ?auto_134555 ) ) ( not ( = ?auto_134552 ?auto_134556 ) ) ( not ( = ?auto_134552 ?auto_134557 ) ) ( not ( = ?auto_134552 ?auto_134558 ) ) ( not ( = ?auto_134552 ?auto_134559 ) ) ( not ( = ?auto_134552 ?auto_134560 ) ) ( not ( = ?auto_134552 ?auto_134561 ) ) ( not ( = ?auto_134552 ?auto_134562 ) ) ( not ( = ?auto_134552 ?auto_134563 ) ) ( not ( = ?auto_134553 ?auto_134554 ) ) ( not ( = ?auto_134553 ?auto_134555 ) ) ( not ( = ?auto_134553 ?auto_134556 ) ) ( not ( = ?auto_134553 ?auto_134557 ) ) ( not ( = ?auto_134553 ?auto_134558 ) ) ( not ( = ?auto_134553 ?auto_134559 ) ) ( not ( = ?auto_134553 ?auto_134560 ) ) ( not ( = ?auto_134553 ?auto_134561 ) ) ( not ( = ?auto_134553 ?auto_134562 ) ) ( not ( = ?auto_134553 ?auto_134563 ) ) ( not ( = ?auto_134554 ?auto_134555 ) ) ( not ( = ?auto_134554 ?auto_134556 ) ) ( not ( = ?auto_134554 ?auto_134557 ) ) ( not ( = ?auto_134554 ?auto_134558 ) ) ( not ( = ?auto_134554 ?auto_134559 ) ) ( not ( = ?auto_134554 ?auto_134560 ) ) ( not ( = ?auto_134554 ?auto_134561 ) ) ( not ( = ?auto_134554 ?auto_134562 ) ) ( not ( = ?auto_134554 ?auto_134563 ) ) ( not ( = ?auto_134555 ?auto_134556 ) ) ( not ( = ?auto_134555 ?auto_134557 ) ) ( not ( = ?auto_134555 ?auto_134558 ) ) ( not ( = ?auto_134555 ?auto_134559 ) ) ( not ( = ?auto_134555 ?auto_134560 ) ) ( not ( = ?auto_134555 ?auto_134561 ) ) ( not ( = ?auto_134555 ?auto_134562 ) ) ( not ( = ?auto_134555 ?auto_134563 ) ) ( not ( = ?auto_134556 ?auto_134557 ) ) ( not ( = ?auto_134556 ?auto_134558 ) ) ( not ( = ?auto_134556 ?auto_134559 ) ) ( not ( = ?auto_134556 ?auto_134560 ) ) ( not ( = ?auto_134556 ?auto_134561 ) ) ( not ( = ?auto_134556 ?auto_134562 ) ) ( not ( = ?auto_134556 ?auto_134563 ) ) ( not ( = ?auto_134557 ?auto_134558 ) ) ( not ( = ?auto_134557 ?auto_134559 ) ) ( not ( = ?auto_134557 ?auto_134560 ) ) ( not ( = ?auto_134557 ?auto_134561 ) ) ( not ( = ?auto_134557 ?auto_134562 ) ) ( not ( = ?auto_134557 ?auto_134563 ) ) ( not ( = ?auto_134558 ?auto_134559 ) ) ( not ( = ?auto_134558 ?auto_134560 ) ) ( not ( = ?auto_134558 ?auto_134561 ) ) ( not ( = ?auto_134558 ?auto_134562 ) ) ( not ( = ?auto_134558 ?auto_134563 ) ) ( not ( = ?auto_134559 ?auto_134560 ) ) ( not ( = ?auto_134559 ?auto_134561 ) ) ( not ( = ?auto_134559 ?auto_134562 ) ) ( not ( = ?auto_134559 ?auto_134563 ) ) ( not ( = ?auto_134560 ?auto_134561 ) ) ( not ( = ?auto_134560 ?auto_134562 ) ) ( not ( = ?auto_134560 ?auto_134563 ) ) ( not ( = ?auto_134561 ?auto_134562 ) ) ( not ( = ?auto_134561 ?auto_134563 ) ) ( not ( = ?auto_134562 ?auto_134563 ) ) ( ON ?auto_134561 ?auto_134562 ) ( ON ?auto_134560 ?auto_134561 ) ( CLEAR ?auto_134558 ) ( ON ?auto_134559 ?auto_134560 ) ( CLEAR ?auto_134559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134552 ?auto_134553 ?auto_134554 ?auto_134555 ?auto_134556 ?auto_134557 ?auto_134558 ?auto_134559 )
      ( MAKE-11PILE ?auto_134552 ?auto_134553 ?auto_134554 ?auto_134555 ?auto_134556 ?auto_134557 ?auto_134558 ?auto_134559 ?auto_134560 ?auto_134561 ?auto_134562 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134575 - BLOCK
      ?auto_134576 - BLOCK
      ?auto_134577 - BLOCK
      ?auto_134578 - BLOCK
      ?auto_134579 - BLOCK
      ?auto_134580 - BLOCK
      ?auto_134581 - BLOCK
      ?auto_134582 - BLOCK
      ?auto_134583 - BLOCK
      ?auto_134584 - BLOCK
      ?auto_134585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134585 ) ( ON-TABLE ?auto_134575 ) ( ON ?auto_134576 ?auto_134575 ) ( ON ?auto_134577 ?auto_134576 ) ( ON ?auto_134578 ?auto_134577 ) ( ON ?auto_134579 ?auto_134578 ) ( ON ?auto_134580 ?auto_134579 ) ( ON ?auto_134581 ?auto_134580 ) ( not ( = ?auto_134575 ?auto_134576 ) ) ( not ( = ?auto_134575 ?auto_134577 ) ) ( not ( = ?auto_134575 ?auto_134578 ) ) ( not ( = ?auto_134575 ?auto_134579 ) ) ( not ( = ?auto_134575 ?auto_134580 ) ) ( not ( = ?auto_134575 ?auto_134581 ) ) ( not ( = ?auto_134575 ?auto_134582 ) ) ( not ( = ?auto_134575 ?auto_134583 ) ) ( not ( = ?auto_134575 ?auto_134584 ) ) ( not ( = ?auto_134575 ?auto_134585 ) ) ( not ( = ?auto_134576 ?auto_134577 ) ) ( not ( = ?auto_134576 ?auto_134578 ) ) ( not ( = ?auto_134576 ?auto_134579 ) ) ( not ( = ?auto_134576 ?auto_134580 ) ) ( not ( = ?auto_134576 ?auto_134581 ) ) ( not ( = ?auto_134576 ?auto_134582 ) ) ( not ( = ?auto_134576 ?auto_134583 ) ) ( not ( = ?auto_134576 ?auto_134584 ) ) ( not ( = ?auto_134576 ?auto_134585 ) ) ( not ( = ?auto_134577 ?auto_134578 ) ) ( not ( = ?auto_134577 ?auto_134579 ) ) ( not ( = ?auto_134577 ?auto_134580 ) ) ( not ( = ?auto_134577 ?auto_134581 ) ) ( not ( = ?auto_134577 ?auto_134582 ) ) ( not ( = ?auto_134577 ?auto_134583 ) ) ( not ( = ?auto_134577 ?auto_134584 ) ) ( not ( = ?auto_134577 ?auto_134585 ) ) ( not ( = ?auto_134578 ?auto_134579 ) ) ( not ( = ?auto_134578 ?auto_134580 ) ) ( not ( = ?auto_134578 ?auto_134581 ) ) ( not ( = ?auto_134578 ?auto_134582 ) ) ( not ( = ?auto_134578 ?auto_134583 ) ) ( not ( = ?auto_134578 ?auto_134584 ) ) ( not ( = ?auto_134578 ?auto_134585 ) ) ( not ( = ?auto_134579 ?auto_134580 ) ) ( not ( = ?auto_134579 ?auto_134581 ) ) ( not ( = ?auto_134579 ?auto_134582 ) ) ( not ( = ?auto_134579 ?auto_134583 ) ) ( not ( = ?auto_134579 ?auto_134584 ) ) ( not ( = ?auto_134579 ?auto_134585 ) ) ( not ( = ?auto_134580 ?auto_134581 ) ) ( not ( = ?auto_134580 ?auto_134582 ) ) ( not ( = ?auto_134580 ?auto_134583 ) ) ( not ( = ?auto_134580 ?auto_134584 ) ) ( not ( = ?auto_134580 ?auto_134585 ) ) ( not ( = ?auto_134581 ?auto_134582 ) ) ( not ( = ?auto_134581 ?auto_134583 ) ) ( not ( = ?auto_134581 ?auto_134584 ) ) ( not ( = ?auto_134581 ?auto_134585 ) ) ( not ( = ?auto_134582 ?auto_134583 ) ) ( not ( = ?auto_134582 ?auto_134584 ) ) ( not ( = ?auto_134582 ?auto_134585 ) ) ( not ( = ?auto_134583 ?auto_134584 ) ) ( not ( = ?auto_134583 ?auto_134585 ) ) ( not ( = ?auto_134584 ?auto_134585 ) ) ( ON ?auto_134584 ?auto_134585 ) ( ON ?auto_134583 ?auto_134584 ) ( CLEAR ?auto_134581 ) ( ON ?auto_134582 ?auto_134583 ) ( CLEAR ?auto_134582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134575 ?auto_134576 ?auto_134577 ?auto_134578 ?auto_134579 ?auto_134580 ?auto_134581 ?auto_134582 )
      ( MAKE-11PILE ?auto_134575 ?auto_134576 ?auto_134577 ?auto_134578 ?auto_134579 ?auto_134580 ?auto_134581 ?auto_134582 ?auto_134583 ?auto_134584 ?auto_134585 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134597 - BLOCK
      ?auto_134598 - BLOCK
      ?auto_134599 - BLOCK
      ?auto_134600 - BLOCK
      ?auto_134601 - BLOCK
      ?auto_134602 - BLOCK
      ?auto_134603 - BLOCK
      ?auto_134604 - BLOCK
      ?auto_134605 - BLOCK
      ?auto_134606 - BLOCK
      ?auto_134607 - BLOCK
    )
    :vars
    (
      ?auto_134608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134607 ?auto_134608 ) ( ON-TABLE ?auto_134597 ) ( ON ?auto_134598 ?auto_134597 ) ( ON ?auto_134599 ?auto_134598 ) ( ON ?auto_134600 ?auto_134599 ) ( ON ?auto_134601 ?auto_134600 ) ( ON ?auto_134602 ?auto_134601 ) ( not ( = ?auto_134597 ?auto_134598 ) ) ( not ( = ?auto_134597 ?auto_134599 ) ) ( not ( = ?auto_134597 ?auto_134600 ) ) ( not ( = ?auto_134597 ?auto_134601 ) ) ( not ( = ?auto_134597 ?auto_134602 ) ) ( not ( = ?auto_134597 ?auto_134603 ) ) ( not ( = ?auto_134597 ?auto_134604 ) ) ( not ( = ?auto_134597 ?auto_134605 ) ) ( not ( = ?auto_134597 ?auto_134606 ) ) ( not ( = ?auto_134597 ?auto_134607 ) ) ( not ( = ?auto_134597 ?auto_134608 ) ) ( not ( = ?auto_134598 ?auto_134599 ) ) ( not ( = ?auto_134598 ?auto_134600 ) ) ( not ( = ?auto_134598 ?auto_134601 ) ) ( not ( = ?auto_134598 ?auto_134602 ) ) ( not ( = ?auto_134598 ?auto_134603 ) ) ( not ( = ?auto_134598 ?auto_134604 ) ) ( not ( = ?auto_134598 ?auto_134605 ) ) ( not ( = ?auto_134598 ?auto_134606 ) ) ( not ( = ?auto_134598 ?auto_134607 ) ) ( not ( = ?auto_134598 ?auto_134608 ) ) ( not ( = ?auto_134599 ?auto_134600 ) ) ( not ( = ?auto_134599 ?auto_134601 ) ) ( not ( = ?auto_134599 ?auto_134602 ) ) ( not ( = ?auto_134599 ?auto_134603 ) ) ( not ( = ?auto_134599 ?auto_134604 ) ) ( not ( = ?auto_134599 ?auto_134605 ) ) ( not ( = ?auto_134599 ?auto_134606 ) ) ( not ( = ?auto_134599 ?auto_134607 ) ) ( not ( = ?auto_134599 ?auto_134608 ) ) ( not ( = ?auto_134600 ?auto_134601 ) ) ( not ( = ?auto_134600 ?auto_134602 ) ) ( not ( = ?auto_134600 ?auto_134603 ) ) ( not ( = ?auto_134600 ?auto_134604 ) ) ( not ( = ?auto_134600 ?auto_134605 ) ) ( not ( = ?auto_134600 ?auto_134606 ) ) ( not ( = ?auto_134600 ?auto_134607 ) ) ( not ( = ?auto_134600 ?auto_134608 ) ) ( not ( = ?auto_134601 ?auto_134602 ) ) ( not ( = ?auto_134601 ?auto_134603 ) ) ( not ( = ?auto_134601 ?auto_134604 ) ) ( not ( = ?auto_134601 ?auto_134605 ) ) ( not ( = ?auto_134601 ?auto_134606 ) ) ( not ( = ?auto_134601 ?auto_134607 ) ) ( not ( = ?auto_134601 ?auto_134608 ) ) ( not ( = ?auto_134602 ?auto_134603 ) ) ( not ( = ?auto_134602 ?auto_134604 ) ) ( not ( = ?auto_134602 ?auto_134605 ) ) ( not ( = ?auto_134602 ?auto_134606 ) ) ( not ( = ?auto_134602 ?auto_134607 ) ) ( not ( = ?auto_134602 ?auto_134608 ) ) ( not ( = ?auto_134603 ?auto_134604 ) ) ( not ( = ?auto_134603 ?auto_134605 ) ) ( not ( = ?auto_134603 ?auto_134606 ) ) ( not ( = ?auto_134603 ?auto_134607 ) ) ( not ( = ?auto_134603 ?auto_134608 ) ) ( not ( = ?auto_134604 ?auto_134605 ) ) ( not ( = ?auto_134604 ?auto_134606 ) ) ( not ( = ?auto_134604 ?auto_134607 ) ) ( not ( = ?auto_134604 ?auto_134608 ) ) ( not ( = ?auto_134605 ?auto_134606 ) ) ( not ( = ?auto_134605 ?auto_134607 ) ) ( not ( = ?auto_134605 ?auto_134608 ) ) ( not ( = ?auto_134606 ?auto_134607 ) ) ( not ( = ?auto_134606 ?auto_134608 ) ) ( not ( = ?auto_134607 ?auto_134608 ) ) ( ON ?auto_134606 ?auto_134607 ) ( ON ?auto_134605 ?auto_134606 ) ( ON ?auto_134604 ?auto_134605 ) ( CLEAR ?auto_134602 ) ( ON ?auto_134603 ?auto_134604 ) ( CLEAR ?auto_134603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134597 ?auto_134598 ?auto_134599 ?auto_134600 ?auto_134601 ?auto_134602 ?auto_134603 )
      ( MAKE-11PILE ?auto_134597 ?auto_134598 ?auto_134599 ?auto_134600 ?auto_134601 ?auto_134602 ?auto_134603 ?auto_134604 ?auto_134605 ?auto_134606 ?auto_134607 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134620 - BLOCK
      ?auto_134621 - BLOCK
      ?auto_134622 - BLOCK
      ?auto_134623 - BLOCK
      ?auto_134624 - BLOCK
      ?auto_134625 - BLOCK
      ?auto_134626 - BLOCK
      ?auto_134627 - BLOCK
      ?auto_134628 - BLOCK
      ?auto_134629 - BLOCK
      ?auto_134630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134630 ) ( ON-TABLE ?auto_134620 ) ( ON ?auto_134621 ?auto_134620 ) ( ON ?auto_134622 ?auto_134621 ) ( ON ?auto_134623 ?auto_134622 ) ( ON ?auto_134624 ?auto_134623 ) ( ON ?auto_134625 ?auto_134624 ) ( not ( = ?auto_134620 ?auto_134621 ) ) ( not ( = ?auto_134620 ?auto_134622 ) ) ( not ( = ?auto_134620 ?auto_134623 ) ) ( not ( = ?auto_134620 ?auto_134624 ) ) ( not ( = ?auto_134620 ?auto_134625 ) ) ( not ( = ?auto_134620 ?auto_134626 ) ) ( not ( = ?auto_134620 ?auto_134627 ) ) ( not ( = ?auto_134620 ?auto_134628 ) ) ( not ( = ?auto_134620 ?auto_134629 ) ) ( not ( = ?auto_134620 ?auto_134630 ) ) ( not ( = ?auto_134621 ?auto_134622 ) ) ( not ( = ?auto_134621 ?auto_134623 ) ) ( not ( = ?auto_134621 ?auto_134624 ) ) ( not ( = ?auto_134621 ?auto_134625 ) ) ( not ( = ?auto_134621 ?auto_134626 ) ) ( not ( = ?auto_134621 ?auto_134627 ) ) ( not ( = ?auto_134621 ?auto_134628 ) ) ( not ( = ?auto_134621 ?auto_134629 ) ) ( not ( = ?auto_134621 ?auto_134630 ) ) ( not ( = ?auto_134622 ?auto_134623 ) ) ( not ( = ?auto_134622 ?auto_134624 ) ) ( not ( = ?auto_134622 ?auto_134625 ) ) ( not ( = ?auto_134622 ?auto_134626 ) ) ( not ( = ?auto_134622 ?auto_134627 ) ) ( not ( = ?auto_134622 ?auto_134628 ) ) ( not ( = ?auto_134622 ?auto_134629 ) ) ( not ( = ?auto_134622 ?auto_134630 ) ) ( not ( = ?auto_134623 ?auto_134624 ) ) ( not ( = ?auto_134623 ?auto_134625 ) ) ( not ( = ?auto_134623 ?auto_134626 ) ) ( not ( = ?auto_134623 ?auto_134627 ) ) ( not ( = ?auto_134623 ?auto_134628 ) ) ( not ( = ?auto_134623 ?auto_134629 ) ) ( not ( = ?auto_134623 ?auto_134630 ) ) ( not ( = ?auto_134624 ?auto_134625 ) ) ( not ( = ?auto_134624 ?auto_134626 ) ) ( not ( = ?auto_134624 ?auto_134627 ) ) ( not ( = ?auto_134624 ?auto_134628 ) ) ( not ( = ?auto_134624 ?auto_134629 ) ) ( not ( = ?auto_134624 ?auto_134630 ) ) ( not ( = ?auto_134625 ?auto_134626 ) ) ( not ( = ?auto_134625 ?auto_134627 ) ) ( not ( = ?auto_134625 ?auto_134628 ) ) ( not ( = ?auto_134625 ?auto_134629 ) ) ( not ( = ?auto_134625 ?auto_134630 ) ) ( not ( = ?auto_134626 ?auto_134627 ) ) ( not ( = ?auto_134626 ?auto_134628 ) ) ( not ( = ?auto_134626 ?auto_134629 ) ) ( not ( = ?auto_134626 ?auto_134630 ) ) ( not ( = ?auto_134627 ?auto_134628 ) ) ( not ( = ?auto_134627 ?auto_134629 ) ) ( not ( = ?auto_134627 ?auto_134630 ) ) ( not ( = ?auto_134628 ?auto_134629 ) ) ( not ( = ?auto_134628 ?auto_134630 ) ) ( not ( = ?auto_134629 ?auto_134630 ) ) ( ON ?auto_134629 ?auto_134630 ) ( ON ?auto_134628 ?auto_134629 ) ( ON ?auto_134627 ?auto_134628 ) ( CLEAR ?auto_134625 ) ( ON ?auto_134626 ?auto_134627 ) ( CLEAR ?auto_134626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134620 ?auto_134621 ?auto_134622 ?auto_134623 ?auto_134624 ?auto_134625 ?auto_134626 )
      ( MAKE-11PILE ?auto_134620 ?auto_134621 ?auto_134622 ?auto_134623 ?auto_134624 ?auto_134625 ?auto_134626 ?auto_134627 ?auto_134628 ?auto_134629 ?auto_134630 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134642 - BLOCK
      ?auto_134643 - BLOCK
      ?auto_134644 - BLOCK
      ?auto_134645 - BLOCK
      ?auto_134646 - BLOCK
      ?auto_134647 - BLOCK
      ?auto_134648 - BLOCK
      ?auto_134649 - BLOCK
      ?auto_134650 - BLOCK
      ?auto_134651 - BLOCK
      ?auto_134652 - BLOCK
    )
    :vars
    (
      ?auto_134653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134652 ?auto_134653 ) ( ON-TABLE ?auto_134642 ) ( ON ?auto_134643 ?auto_134642 ) ( ON ?auto_134644 ?auto_134643 ) ( ON ?auto_134645 ?auto_134644 ) ( ON ?auto_134646 ?auto_134645 ) ( not ( = ?auto_134642 ?auto_134643 ) ) ( not ( = ?auto_134642 ?auto_134644 ) ) ( not ( = ?auto_134642 ?auto_134645 ) ) ( not ( = ?auto_134642 ?auto_134646 ) ) ( not ( = ?auto_134642 ?auto_134647 ) ) ( not ( = ?auto_134642 ?auto_134648 ) ) ( not ( = ?auto_134642 ?auto_134649 ) ) ( not ( = ?auto_134642 ?auto_134650 ) ) ( not ( = ?auto_134642 ?auto_134651 ) ) ( not ( = ?auto_134642 ?auto_134652 ) ) ( not ( = ?auto_134642 ?auto_134653 ) ) ( not ( = ?auto_134643 ?auto_134644 ) ) ( not ( = ?auto_134643 ?auto_134645 ) ) ( not ( = ?auto_134643 ?auto_134646 ) ) ( not ( = ?auto_134643 ?auto_134647 ) ) ( not ( = ?auto_134643 ?auto_134648 ) ) ( not ( = ?auto_134643 ?auto_134649 ) ) ( not ( = ?auto_134643 ?auto_134650 ) ) ( not ( = ?auto_134643 ?auto_134651 ) ) ( not ( = ?auto_134643 ?auto_134652 ) ) ( not ( = ?auto_134643 ?auto_134653 ) ) ( not ( = ?auto_134644 ?auto_134645 ) ) ( not ( = ?auto_134644 ?auto_134646 ) ) ( not ( = ?auto_134644 ?auto_134647 ) ) ( not ( = ?auto_134644 ?auto_134648 ) ) ( not ( = ?auto_134644 ?auto_134649 ) ) ( not ( = ?auto_134644 ?auto_134650 ) ) ( not ( = ?auto_134644 ?auto_134651 ) ) ( not ( = ?auto_134644 ?auto_134652 ) ) ( not ( = ?auto_134644 ?auto_134653 ) ) ( not ( = ?auto_134645 ?auto_134646 ) ) ( not ( = ?auto_134645 ?auto_134647 ) ) ( not ( = ?auto_134645 ?auto_134648 ) ) ( not ( = ?auto_134645 ?auto_134649 ) ) ( not ( = ?auto_134645 ?auto_134650 ) ) ( not ( = ?auto_134645 ?auto_134651 ) ) ( not ( = ?auto_134645 ?auto_134652 ) ) ( not ( = ?auto_134645 ?auto_134653 ) ) ( not ( = ?auto_134646 ?auto_134647 ) ) ( not ( = ?auto_134646 ?auto_134648 ) ) ( not ( = ?auto_134646 ?auto_134649 ) ) ( not ( = ?auto_134646 ?auto_134650 ) ) ( not ( = ?auto_134646 ?auto_134651 ) ) ( not ( = ?auto_134646 ?auto_134652 ) ) ( not ( = ?auto_134646 ?auto_134653 ) ) ( not ( = ?auto_134647 ?auto_134648 ) ) ( not ( = ?auto_134647 ?auto_134649 ) ) ( not ( = ?auto_134647 ?auto_134650 ) ) ( not ( = ?auto_134647 ?auto_134651 ) ) ( not ( = ?auto_134647 ?auto_134652 ) ) ( not ( = ?auto_134647 ?auto_134653 ) ) ( not ( = ?auto_134648 ?auto_134649 ) ) ( not ( = ?auto_134648 ?auto_134650 ) ) ( not ( = ?auto_134648 ?auto_134651 ) ) ( not ( = ?auto_134648 ?auto_134652 ) ) ( not ( = ?auto_134648 ?auto_134653 ) ) ( not ( = ?auto_134649 ?auto_134650 ) ) ( not ( = ?auto_134649 ?auto_134651 ) ) ( not ( = ?auto_134649 ?auto_134652 ) ) ( not ( = ?auto_134649 ?auto_134653 ) ) ( not ( = ?auto_134650 ?auto_134651 ) ) ( not ( = ?auto_134650 ?auto_134652 ) ) ( not ( = ?auto_134650 ?auto_134653 ) ) ( not ( = ?auto_134651 ?auto_134652 ) ) ( not ( = ?auto_134651 ?auto_134653 ) ) ( not ( = ?auto_134652 ?auto_134653 ) ) ( ON ?auto_134651 ?auto_134652 ) ( ON ?auto_134650 ?auto_134651 ) ( ON ?auto_134649 ?auto_134650 ) ( ON ?auto_134648 ?auto_134649 ) ( CLEAR ?auto_134646 ) ( ON ?auto_134647 ?auto_134648 ) ( CLEAR ?auto_134647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134642 ?auto_134643 ?auto_134644 ?auto_134645 ?auto_134646 ?auto_134647 )
      ( MAKE-11PILE ?auto_134642 ?auto_134643 ?auto_134644 ?auto_134645 ?auto_134646 ?auto_134647 ?auto_134648 ?auto_134649 ?auto_134650 ?auto_134651 ?auto_134652 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134665 - BLOCK
      ?auto_134666 - BLOCK
      ?auto_134667 - BLOCK
      ?auto_134668 - BLOCK
      ?auto_134669 - BLOCK
      ?auto_134670 - BLOCK
      ?auto_134671 - BLOCK
      ?auto_134672 - BLOCK
      ?auto_134673 - BLOCK
      ?auto_134674 - BLOCK
      ?auto_134675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134675 ) ( ON-TABLE ?auto_134665 ) ( ON ?auto_134666 ?auto_134665 ) ( ON ?auto_134667 ?auto_134666 ) ( ON ?auto_134668 ?auto_134667 ) ( ON ?auto_134669 ?auto_134668 ) ( not ( = ?auto_134665 ?auto_134666 ) ) ( not ( = ?auto_134665 ?auto_134667 ) ) ( not ( = ?auto_134665 ?auto_134668 ) ) ( not ( = ?auto_134665 ?auto_134669 ) ) ( not ( = ?auto_134665 ?auto_134670 ) ) ( not ( = ?auto_134665 ?auto_134671 ) ) ( not ( = ?auto_134665 ?auto_134672 ) ) ( not ( = ?auto_134665 ?auto_134673 ) ) ( not ( = ?auto_134665 ?auto_134674 ) ) ( not ( = ?auto_134665 ?auto_134675 ) ) ( not ( = ?auto_134666 ?auto_134667 ) ) ( not ( = ?auto_134666 ?auto_134668 ) ) ( not ( = ?auto_134666 ?auto_134669 ) ) ( not ( = ?auto_134666 ?auto_134670 ) ) ( not ( = ?auto_134666 ?auto_134671 ) ) ( not ( = ?auto_134666 ?auto_134672 ) ) ( not ( = ?auto_134666 ?auto_134673 ) ) ( not ( = ?auto_134666 ?auto_134674 ) ) ( not ( = ?auto_134666 ?auto_134675 ) ) ( not ( = ?auto_134667 ?auto_134668 ) ) ( not ( = ?auto_134667 ?auto_134669 ) ) ( not ( = ?auto_134667 ?auto_134670 ) ) ( not ( = ?auto_134667 ?auto_134671 ) ) ( not ( = ?auto_134667 ?auto_134672 ) ) ( not ( = ?auto_134667 ?auto_134673 ) ) ( not ( = ?auto_134667 ?auto_134674 ) ) ( not ( = ?auto_134667 ?auto_134675 ) ) ( not ( = ?auto_134668 ?auto_134669 ) ) ( not ( = ?auto_134668 ?auto_134670 ) ) ( not ( = ?auto_134668 ?auto_134671 ) ) ( not ( = ?auto_134668 ?auto_134672 ) ) ( not ( = ?auto_134668 ?auto_134673 ) ) ( not ( = ?auto_134668 ?auto_134674 ) ) ( not ( = ?auto_134668 ?auto_134675 ) ) ( not ( = ?auto_134669 ?auto_134670 ) ) ( not ( = ?auto_134669 ?auto_134671 ) ) ( not ( = ?auto_134669 ?auto_134672 ) ) ( not ( = ?auto_134669 ?auto_134673 ) ) ( not ( = ?auto_134669 ?auto_134674 ) ) ( not ( = ?auto_134669 ?auto_134675 ) ) ( not ( = ?auto_134670 ?auto_134671 ) ) ( not ( = ?auto_134670 ?auto_134672 ) ) ( not ( = ?auto_134670 ?auto_134673 ) ) ( not ( = ?auto_134670 ?auto_134674 ) ) ( not ( = ?auto_134670 ?auto_134675 ) ) ( not ( = ?auto_134671 ?auto_134672 ) ) ( not ( = ?auto_134671 ?auto_134673 ) ) ( not ( = ?auto_134671 ?auto_134674 ) ) ( not ( = ?auto_134671 ?auto_134675 ) ) ( not ( = ?auto_134672 ?auto_134673 ) ) ( not ( = ?auto_134672 ?auto_134674 ) ) ( not ( = ?auto_134672 ?auto_134675 ) ) ( not ( = ?auto_134673 ?auto_134674 ) ) ( not ( = ?auto_134673 ?auto_134675 ) ) ( not ( = ?auto_134674 ?auto_134675 ) ) ( ON ?auto_134674 ?auto_134675 ) ( ON ?auto_134673 ?auto_134674 ) ( ON ?auto_134672 ?auto_134673 ) ( ON ?auto_134671 ?auto_134672 ) ( CLEAR ?auto_134669 ) ( ON ?auto_134670 ?auto_134671 ) ( CLEAR ?auto_134670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134665 ?auto_134666 ?auto_134667 ?auto_134668 ?auto_134669 ?auto_134670 )
      ( MAKE-11PILE ?auto_134665 ?auto_134666 ?auto_134667 ?auto_134668 ?auto_134669 ?auto_134670 ?auto_134671 ?auto_134672 ?auto_134673 ?auto_134674 ?auto_134675 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134687 - BLOCK
      ?auto_134688 - BLOCK
      ?auto_134689 - BLOCK
      ?auto_134690 - BLOCK
      ?auto_134691 - BLOCK
      ?auto_134692 - BLOCK
      ?auto_134693 - BLOCK
      ?auto_134694 - BLOCK
      ?auto_134695 - BLOCK
      ?auto_134696 - BLOCK
      ?auto_134697 - BLOCK
    )
    :vars
    (
      ?auto_134698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134697 ?auto_134698 ) ( ON-TABLE ?auto_134687 ) ( ON ?auto_134688 ?auto_134687 ) ( ON ?auto_134689 ?auto_134688 ) ( ON ?auto_134690 ?auto_134689 ) ( not ( = ?auto_134687 ?auto_134688 ) ) ( not ( = ?auto_134687 ?auto_134689 ) ) ( not ( = ?auto_134687 ?auto_134690 ) ) ( not ( = ?auto_134687 ?auto_134691 ) ) ( not ( = ?auto_134687 ?auto_134692 ) ) ( not ( = ?auto_134687 ?auto_134693 ) ) ( not ( = ?auto_134687 ?auto_134694 ) ) ( not ( = ?auto_134687 ?auto_134695 ) ) ( not ( = ?auto_134687 ?auto_134696 ) ) ( not ( = ?auto_134687 ?auto_134697 ) ) ( not ( = ?auto_134687 ?auto_134698 ) ) ( not ( = ?auto_134688 ?auto_134689 ) ) ( not ( = ?auto_134688 ?auto_134690 ) ) ( not ( = ?auto_134688 ?auto_134691 ) ) ( not ( = ?auto_134688 ?auto_134692 ) ) ( not ( = ?auto_134688 ?auto_134693 ) ) ( not ( = ?auto_134688 ?auto_134694 ) ) ( not ( = ?auto_134688 ?auto_134695 ) ) ( not ( = ?auto_134688 ?auto_134696 ) ) ( not ( = ?auto_134688 ?auto_134697 ) ) ( not ( = ?auto_134688 ?auto_134698 ) ) ( not ( = ?auto_134689 ?auto_134690 ) ) ( not ( = ?auto_134689 ?auto_134691 ) ) ( not ( = ?auto_134689 ?auto_134692 ) ) ( not ( = ?auto_134689 ?auto_134693 ) ) ( not ( = ?auto_134689 ?auto_134694 ) ) ( not ( = ?auto_134689 ?auto_134695 ) ) ( not ( = ?auto_134689 ?auto_134696 ) ) ( not ( = ?auto_134689 ?auto_134697 ) ) ( not ( = ?auto_134689 ?auto_134698 ) ) ( not ( = ?auto_134690 ?auto_134691 ) ) ( not ( = ?auto_134690 ?auto_134692 ) ) ( not ( = ?auto_134690 ?auto_134693 ) ) ( not ( = ?auto_134690 ?auto_134694 ) ) ( not ( = ?auto_134690 ?auto_134695 ) ) ( not ( = ?auto_134690 ?auto_134696 ) ) ( not ( = ?auto_134690 ?auto_134697 ) ) ( not ( = ?auto_134690 ?auto_134698 ) ) ( not ( = ?auto_134691 ?auto_134692 ) ) ( not ( = ?auto_134691 ?auto_134693 ) ) ( not ( = ?auto_134691 ?auto_134694 ) ) ( not ( = ?auto_134691 ?auto_134695 ) ) ( not ( = ?auto_134691 ?auto_134696 ) ) ( not ( = ?auto_134691 ?auto_134697 ) ) ( not ( = ?auto_134691 ?auto_134698 ) ) ( not ( = ?auto_134692 ?auto_134693 ) ) ( not ( = ?auto_134692 ?auto_134694 ) ) ( not ( = ?auto_134692 ?auto_134695 ) ) ( not ( = ?auto_134692 ?auto_134696 ) ) ( not ( = ?auto_134692 ?auto_134697 ) ) ( not ( = ?auto_134692 ?auto_134698 ) ) ( not ( = ?auto_134693 ?auto_134694 ) ) ( not ( = ?auto_134693 ?auto_134695 ) ) ( not ( = ?auto_134693 ?auto_134696 ) ) ( not ( = ?auto_134693 ?auto_134697 ) ) ( not ( = ?auto_134693 ?auto_134698 ) ) ( not ( = ?auto_134694 ?auto_134695 ) ) ( not ( = ?auto_134694 ?auto_134696 ) ) ( not ( = ?auto_134694 ?auto_134697 ) ) ( not ( = ?auto_134694 ?auto_134698 ) ) ( not ( = ?auto_134695 ?auto_134696 ) ) ( not ( = ?auto_134695 ?auto_134697 ) ) ( not ( = ?auto_134695 ?auto_134698 ) ) ( not ( = ?auto_134696 ?auto_134697 ) ) ( not ( = ?auto_134696 ?auto_134698 ) ) ( not ( = ?auto_134697 ?auto_134698 ) ) ( ON ?auto_134696 ?auto_134697 ) ( ON ?auto_134695 ?auto_134696 ) ( ON ?auto_134694 ?auto_134695 ) ( ON ?auto_134693 ?auto_134694 ) ( ON ?auto_134692 ?auto_134693 ) ( CLEAR ?auto_134690 ) ( ON ?auto_134691 ?auto_134692 ) ( CLEAR ?auto_134691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134687 ?auto_134688 ?auto_134689 ?auto_134690 ?auto_134691 )
      ( MAKE-11PILE ?auto_134687 ?auto_134688 ?auto_134689 ?auto_134690 ?auto_134691 ?auto_134692 ?auto_134693 ?auto_134694 ?auto_134695 ?auto_134696 ?auto_134697 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134710 - BLOCK
      ?auto_134711 - BLOCK
      ?auto_134712 - BLOCK
      ?auto_134713 - BLOCK
      ?auto_134714 - BLOCK
      ?auto_134715 - BLOCK
      ?auto_134716 - BLOCK
      ?auto_134717 - BLOCK
      ?auto_134718 - BLOCK
      ?auto_134719 - BLOCK
      ?auto_134720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134720 ) ( ON-TABLE ?auto_134710 ) ( ON ?auto_134711 ?auto_134710 ) ( ON ?auto_134712 ?auto_134711 ) ( ON ?auto_134713 ?auto_134712 ) ( not ( = ?auto_134710 ?auto_134711 ) ) ( not ( = ?auto_134710 ?auto_134712 ) ) ( not ( = ?auto_134710 ?auto_134713 ) ) ( not ( = ?auto_134710 ?auto_134714 ) ) ( not ( = ?auto_134710 ?auto_134715 ) ) ( not ( = ?auto_134710 ?auto_134716 ) ) ( not ( = ?auto_134710 ?auto_134717 ) ) ( not ( = ?auto_134710 ?auto_134718 ) ) ( not ( = ?auto_134710 ?auto_134719 ) ) ( not ( = ?auto_134710 ?auto_134720 ) ) ( not ( = ?auto_134711 ?auto_134712 ) ) ( not ( = ?auto_134711 ?auto_134713 ) ) ( not ( = ?auto_134711 ?auto_134714 ) ) ( not ( = ?auto_134711 ?auto_134715 ) ) ( not ( = ?auto_134711 ?auto_134716 ) ) ( not ( = ?auto_134711 ?auto_134717 ) ) ( not ( = ?auto_134711 ?auto_134718 ) ) ( not ( = ?auto_134711 ?auto_134719 ) ) ( not ( = ?auto_134711 ?auto_134720 ) ) ( not ( = ?auto_134712 ?auto_134713 ) ) ( not ( = ?auto_134712 ?auto_134714 ) ) ( not ( = ?auto_134712 ?auto_134715 ) ) ( not ( = ?auto_134712 ?auto_134716 ) ) ( not ( = ?auto_134712 ?auto_134717 ) ) ( not ( = ?auto_134712 ?auto_134718 ) ) ( not ( = ?auto_134712 ?auto_134719 ) ) ( not ( = ?auto_134712 ?auto_134720 ) ) ( not ( = ?auto_134713 ?auto_134714 ) ) ( not ( = ?auto_134713 ?auto_134715 ) ) ( not ( = ?auto_134713 ?auto_134716 ) ) ( not ( = ?auto_134713 ?auto_134717 ) ) ( not ( = ?auto_134713 ?auto_134718 ) ) ( not ( = ?auto_134713 ?auto_134719 ) ) ( not ( = ?auto_134713 ?auto_134720 ) ) ( not ( = ?auto_134714 ?auto_134715 ) ) ( not ( = ?auto_134714 ?auto_134716 ) ) ( not ( = ?auto_134714 ?auto_134717 ) ) ( not ( = ?auto_134714 ?auto_134718 ) ) ( not ( = ?auto_134714 ?auto_134719 ) ) ( not ( = ?auto_134714 ?auto_134720 ) ) ( not ( = ?auto_134715 ?auto_134716 ) ) ( not ( = ?auto_134715 ?auto_134717 ) ) ( not ( = ?auto_134715 ?auto_134718 ) ) ( not ( = ?auto_134715 ?auto_134719 ) ) ( not ( = ?auto_134715 ?auto_134720 ) ) ( not ( = ?auto_134716 ?auto_134717 ) ) ( not ( = ?auto_134716 ?auto_134718 ) ) ( not ( = ?auto_134716 ?auto_134719 ) ) ( not ( = ?auto_134716 ?auto_134720 ) ) ( not ( = ?auto_134717 ?auto_134718 ) ) ( not ( = ?auto_134717 ?auto_134719 ) ) ( not ( = ?auto_134717 ?auto_134720 ) ) ( not ( = ?auto_134718 ?auto_134719 ) ) ( not ( = ?auto_134718 ?auto_134720 ) ) ( not ( = ?auto_134719 ?auto_134720 ) ) ( ON ?auto_134719 ?auto_134720 ) ( ON ?auto_134718 ?auto_134719 ) ( ON ?auto_134717 ?auto_134718 ) ( ON ?auto_134716 ?auto_134717 ) ( ON ?auto_134715 ?auto_134716 ) ( CLEAR ?auto_134713 ) ( ON ?auto_134714 ?auto_134715 ) ( CLEAR ?auto_134714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134710 ?auto_134711 ?auto_134712 ?auto_134713 ?auto_134714 )
      ( MAKE-11PILE ?auto_134710 ?auto_134711 ?auto_134712 ?auto_134713 ?auto_134714 ?auto_134715 ?auto_134716 ?auto_134717 ?auto_134718 ?auto_134719 ?auto_134720 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134732 - BLOCK
      ?auto_134733 - BLOCK
      ?auto_134734 - BLOCK
      ?auto_134735 - BLOCK
      ?auto_134736 - BLOCK
      ?auto_134737 - BLOCK
      ?auto_134738 - BLOCK
      ?auto_134739 - BLOCK
      ?auto_134740 - BLOCK
      ?auto_134741 - BLOCK
      ?auto_134742 - BLOCK
    )
    :vars
    (
      ?auto_134743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134742 ?auto_134743 ) ( ON-TABLE ?auto_134732 ) ( ON ?auto_134733 ?auto_134732 ) ( ON ?auto_134734 ?auto_134733 ) ( not ( = ?auto_134732 ?auto_134733 ) ) ( not ( = ?auto_134732 ?auto_134734 ) ) ( not ( = ?auto_134732 ?auto_134735 ) ) ( not ( = ?auto_134732 ?auto_134736 ) ) ( not ( = ?auto_134732 ?auto_134737 ) ) ( not ( = ?auto_134732 ?auto_134738 ) ) ( not ( = ?auto_134732 ?auto_134739 ) ) ( not ( = ?auto_134732 ?auto_134740 ) ) ( not ( = ?auto_134732 ?auto_134741 ) ) ( not ( = ?auto_134732 ?auto_134742 ) ) ( not ( = ?auto_134732 ?auto_134743 ) ) ( not ( = ?auto_134733 ?auto_134734 ) ) ( not ( = ?auto_134733 ?auto_134735 ) ) ( not ( = ?auto_134733 ?auto_134736 ) ) ( not ( = ?auto_134733 ?auto_134737 ) ) ( not ( = ?auto_134733 ?auto_134738 ) ) ( not ( = ?auto_134733 ?auto_134739 ) ) ( not ( = ?auto_134733 ?auto_134740 ) ) ( not ( = ?auto_134733 ?auto_134741 ) ) ( not ( = ?auto_134733 ?auto_134742 ) ) ( not ( = ?auto_134733 ?auto_134743 ) ) ( not ( = ?auto_134734 ?auto_134735 ) ) ( not ( = ?auto_134734 ?auto_134736 ) ) ( not ( = ?auto_134734 ?auto_134737 ) ) ( not ( = ?auto_134734 ?auto_134738 ) ) ( not ( = ?auto_134734 ?auto_134739 ) ) ( not ( = ?auto_134734 ?auto_134740 ) ) ( not ( = ?auto_134734 ?auto_134741 ) ) ( not ( = ?auto_134734 ?auto_134742 ) ) ( not ( = ?auto_134734 ?auto_134743 ) ) ( not ( = ?auto_134735 ?auto_134736 ) ) ( not ( = ?auto_134735 ?auto_134737 ) ) ( not ( = ?auto_134735 ?auto_134738 ) ) ( not ( = ?auto_134735 ?auto_134739 ) ) ( not ( = ?auto_134735 ?auto_134740 ) ) ( not ( = ?auto_134735 ?auto_134741 ) ) ( not ( = ?auto_134735 ?auto_134742 ) ) ( not ( = ?auto_134735 ?auto_134743 ) ) ( not ( = ?auto_134736 ?auto_134737 ) ) ( not ( = ?auto_134736 ?auto_134738 ) ) ( not ( = ?auto_134736 ?auto_134739 ) ) ( not ( = ?auto_134736 ?auto_134740 ) ) ( not ( = ?auto_134736 ?auto_134741 ) ) ( not ( = ?auto_134736 ?auto_134742 ) ) ( not ( = ?auto_134736 ?auto_134743 ) ) ( not ( = ?auto_134737 ?auto_134738 ) ) ( not ( = ?auto_134737 ?auto_134739 ) ) ( not ( = ?auto_134737 ?auto_134740 ) ) ( not ( = ?auto_134737 ?auto_134741 ) ) ( not ( = ?auto_134737 ?auto_134742 ) ) ( not ( = ?auto_134737 ?auto_134743 ) ) ( not ( = ?auto_134738 ?auto_134739 ) ) ( not ( = ?auto_134738 ?auto_134740 ) ) ( not ( = ?auto_134738 ?auto_134741 ) ) ( not ( = ?auto_134738 ?auto_134742 ) ) ( not ( = ?auto_134738 ?auto_134743 ) ) ( not ( = ?auto_134739 ?auto_134740 ) ) ( not ( = ?auto_134739 ?auto_134741 ) ) ( not ( = ?auto_134739 ?auto_134742 ) ) ( not ( = ?auto_134739 ?auto_134743 ) ) ( not ( = ?auto_134740 ?auto_134741 ) ) ( not ( = ?auto_134740 ?auto_134742 ) ) ( not ( = ?auto_134740 ?auto_134743 ) ) ( not ( = ?auto_134741 ?auto_134742 ) ) ( not ( = ?auto_134741 ?auto_134743 ) ) ( not ( = ?auto_134742 ?auto_134743 ) ) ( ON ?auto_134741 ?auto_134742 ) ( ON ?auto_134740 ?auto_134741 ) ( ON ?auto_134739 ?auto_134740 ) ( ON ?auto_134738 ?auto_134739 ) ( ON ?auto_134737 ?auto_134738 ) ( ON ?auto_134736 ?auto_134737 ) ( CLEAR ?auto_134734 ) ( ON ?auto_134735 ?auto_134736 ) ( CLEAR ?auto_134735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134732 ?auto_134733 ?auto_134734 ?auto_134735 )
      ( MAKE-11PILE ?auto_134732 ?auto_134733 ?auto_134734 ?auto_134735 ?auto_134736 ?auto_134737 ?auto_134738 ?auto_134739 ?auto_134740 ?auto_134741 ?auto_134742 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134755 - BLOCK
      ?auto_134756 - BLOCK
      ?auto_134757 - BLOCK
      ?auto_134758 - BLOCK
      ?auto_134759 - BLOCK
      ?auto_134760 - BLOCK
      ?auto_134761 - BLOCK
      ?auto_134762 - BLOCK
      ?auto_134763 - BLOCK
      ?auto_134764 - BLOCK
      ?auto_134765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134765 ) ( ON-TABLE ?auto_134755 ) ( ON ?auto_134756 ?auto_134755 ) ( ON ?auto_134757 ?auto_134756 ) ( not ( = ?auto_134755 ?auto_134756 ) ) ( not ( = ?auto_134755 ?auto_134757 ) ) ( not ( = ?auto_134755 ?auto_134758 ) ) ( not ( = ?auto_134755 ?auto_134759 ) ) ( not ( = ?auto_134755 ?auto_134760 ) ) ( not ( = ?auto_134755 ?auto_134761 ) ) ( not ( = ?auto_134755 ?auto_134762 ) ) ( not ( = ?auto_134755 ?auto_134763 ) ) ( not ( = ?auto_134755 ?auto_134764 ) ) ( not ( = ?auto_134755 ?auto_134765 ) ) ( not ( = ?auto_134756 ?auto_134757 ) ) ( not ( = ?auto_134756 ?auto_134758 ) ) ( not ( = ?auto_134756 ?auto_134759 ) ) ( not ( = ?auto_134756 ?auto_134760 ) ) ( not ( = ?auto_134756 ?auto_134761 ) ) ( not ( = ?auto_134756 ?auto_134762 ) ) ( not ( = ?auto_134756 ?auto_134763 ) ) ( not ( = ?auto_134756 ?auto_134764 ) ) ( not ( = ?auto_134756 ?auto_134765 ) ) ( not ( = ?auto_134757 ?auto_134758 ) ) ( not ( = ?auto_134757 ?auto_134759 ) ) ( not ( = ?auto_134757 ?auto_134760 ) ) ( not ( = ?auto_134757 ?auto_134761 ) ) ( not ( = ?auto_134757 ?auto_134762 ) ) ( not ( = ?auto_134757 ?auto_134763 ) ) ( not ( = ?auto_134757 ?auto_134764 ) ) ( not ( = ?auto_134757 ?auto_134765 ) ) ( not ( = ?auto_134758 ?auto_134759 ) ) ( not ( = ?auto_134758 ?auto_134760 ) ) ( not ( = ?auto_134758 ?auto_134761 ) ) ( not ( = ?auto_134758 ?auto_134762 ) ) ( not ( = ?auto_134758 ?auto_134763 ) ) ( not ( = ?auto_134758 ?auto_134764 ) ) ( not ( = ?auto_134758 ?auto_134765 ) ) ( not ( = ?auto_134759 ?auto_134760 ) ) ( not ( = ?auto_134759 ?auto_134761 ) ) ( not ( = ?auto_134759 ?auto_134762 ) ) ( not ( = ?auto_134759 ?auto_134763 ) ) ( not ( = ?auto_134759 ?auto_134764 ) ) ( not ( = ?auto_134759 ?auto_134765 ) ) ( not ( = ?auto_134760 ?auto_134761 ) ) ( not ( = ?auto_134760 ?auto_134762 ) ) ( not ( = ?auto_134760 ?auto_134763 ) ) ( not ( = ?auto_134760 ?auto_134764 ) ) ( not ( = ?auto_134760 ?auto_134765 ) ) ( not ( = ?auto_134761 ?auto_134762 ) ) ( not ( = ?auto_134761 ?auto_134763 ) ) ( not ( = ?auto_134761 ?auto_134764 ) ) ( not ( = ?auto_134761 ?auto_134765 ) ) ( not ( = ?auto_134762 ?auto_134763 ) ) ( not ( = ?auto_134762 ?auto_134764 ) ) ( not ( = ?auto_134762 ?auto_134765 ) ) ( not ( = ?auto_134763 ?auto_134764 ) ) ( not ( = ?auto_134763 ?auto_134765 ) ) ( not ( = ?auto_134764 ?auto_134765 ) ) ( ON ?auto_134764 ?auto_134765 ) ( ON ?auto_134763 ?auto_134764 ) ( ON ?auto_134762 ?auto_134763 ) ( ON ?auto_134761 ?auto_134762 ) ( ON ?auto_134760 ?auto_134761 ) ( ON ?auto_134759 ?auto_134760 ) ( CLEAR ?auto_134757 ) ( ON ?auto_134758 ?auto_134759 ) ( CLEAR ?auto_134758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134755 ?auto_134756 ?auto_134757 ?auto_134758 )
      ( MAKE-11PILE ?auto_134755 ?auto_134756 ?auto_134757 ?auto_134758 ?auto_134759 ?auto_134760 ?auto_134761 ?auto_134762 ?auto_134763 ?auto_134764 ?auto_134765 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134777 - BLOCK
      ?auto_134778 - BLOCK
      ?auto_134779 - BLOCK
      ?auto_134780 - BLOCK
      ?auto_134781 - BLOCK
      ?auto_134782 - BLOCK
      ?auto_134783 - BLOCK
      ?auto_134784 - BLOCK
      ?auto_134785 - BLOCK
      ?auto_134786 - BLOCK
      ?auto_134787 - BLOCK
    )
    :vars
    (
      ?auto_134788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134787 ?auto_134788 ) ( ON-TABLE ?auto_134777 ) ( ON ?auto_134778 ?auto_134777 ) ( not ( = ?auto_134777 ?auto_134778 ) ) ( not ( = ?auto_134777 ?auto_134779 ) ) ( not ( = ?auto_134777 ?auto_134780 ) ) ( not ( = ?auto_134777 ?auto_134781 ) ) ( not ( = ?auto_134777 ?auto_134782 ) ) ( not ( = ?auto_134777 ?auto_134783 ) ) ( not ( = ?auto_134777 ?auto_134784 ) ) ( not ( = ?auto_134777 ?auto_134785 ) ) ( not ( = ?auto_134777 ?auto_134786 ) ) ( not ( = ?auto_134777 ?auto_134787 ) ) ( not ( = ?auto_134777 ?auto_134788 ) ) ( not ( = ?auto_134778 ?auto_134779 ) ) ( not ( = ?auto_134778 ?auto_134780 ) ) ( not ( = ?auto_134778 ?auto_134781 ) ) ( not ( = ?auto_134778 ?auto_134782 ) ) ( not ( = ?auto_134778 ?auto_134783 ) ) ( not ( = ?auto_134778 ?auto_134784 ) ) ( not ( = ?auto_134778 ?auto_134785 ) ) ( not ( = ?auto_134778 ?auto_134786 ) ) ( not ( = ?auto_134778 ?auto_134787 ) ) ( not ( = ?auto_134778 ?auto_134788 ) ) ( not ( = ?auto_134779 ?auto_134780 ) ) ( not ( = ?auto_134779 ?auto_134781 ) ) ( not ( = ?auto_134779 ?auto_134782 ) ) ( not ( = ?auto_134779 ?auto_134783 ) ) ( not ( = ?auto_134779 ?auto_134784 ) ) ( not ( = ?auto_134779 ?auto_134785 ) ) ( not ( = ?auto_134779 ?auto_134786 ) ) ( not ( = ?auto_134779 ?auto_134787 ) ) ( not ( = ?auto_134779 ?auto_134788 ) ) ( not ( = ?auto_134780 ?auto_134781 ) ) ( not ( = ?auto_134780 ?auto_134782 ) ) ( not ( = ?auto_134780 ?auto_134783 ) ) ( not ( = ?auto_134780 ?auto_134784 ) ) ( not ( = ?auto_134780 ?auto_134785 ) ) ( not ( = ?auto_134780 ?auto_134786 ) ) ( not ( = ?auto_134780 ?auto_134787 ) ) ( not ( = ?auto_134780 ?auto_134788 ) ) ( not ( = ?auto_134781 ?auto_134782 ) ) ( not ( = ?auto_134781 ?auto_134783 ) ) ( not ( = ?auto_134781 ?auto_134784 ) ) ( not ( = ?auto_134781 ?auto_134785 ) ) ( not ( = ?auto_134781 ?auto_134786 ) ) ( not ( = ?auto_134781 ?auto_134787 ) ) ( not ( = ?auto_134781 ?auto_134788 ) ) ( not ( = ?auto_134782 ?auto_134783 ) ) ( not ( = ?auto_134782 ?auto_134784 ) ) ( not ( = ?auto_134782 ?auto_134785 ) ) ( not ( = ?auto_134782 ?auto_134786 ) ) ( not ( = ?auto_134782 ?auto_134787 ) ) ( not ( = ?auto_134782 ?auto_134788 ) ) ( not ( = ?auto_134783 ?auto_134784 ) ) ( not ( = ?auto_134783 ?auto_134785 ) ) ( not ( = ?auto_134783 ?auto_134786 ) ) ( not ( = ?auto_134783 ?auto_134787 ) ) ( not ( = ?auto_134783 ?auto_134788 ) ) ( not ( = ?auto_134784 ?auto_134785 ) ) ( not ( = ?auto_134784 ?auto_134786 ) ) ( not ( = ?auto_134784 ?auto_134787 ) ) ( not ( = ?auto_134784 ?auto_134788 ) ) ( not ( = ?auto_134785 ?auto_134786 ) ) ( not ( = ?auto_134785 ?auto_134787 ) ) ( not ( = ?auto_134785 ?auto_134788 ) ) ( not ( = ?auto_134786 ?auto_134787 ) ) ( not ( = ?auto_134786 ?auto_134788 ) ) ( not ( = ?auto_134787 ?auto_134788 ) ) ( ON ?auto_134786 ?auto_134787 ) ( ON ?auto_134785 ?auto_134786 ) ( ON ?auto_134784 ?auto_134785 ) ( ON ?auto_134783 ?auto_134784 ) ( ON ?auto_134782 ?auto_134783 ) ( ON ?auto_134781 ?auto_134782 ) ( ON ?auto_134780 ?auto_134781 ) ( CLEAR ?auto_134778 ) ( ON ?auto_134779 ?auto_134780 ) ( CLEAR ?auto_134779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134777 ?auto_134778 ?auto_134779 )
      ( MAKE-11PILE ?auto_134777 ?auto_134778 ?auto_134779 ?auto_134780 ?auto_134781 ?auto_134782 ?auto_134783 ?auto_134784 ?auto_134785 ?auto_134786 ?auto_134787 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134800 - BLOCK
      ?auto_134801 - BLOCK
      ?auto_134802 - BLOCK
      ?auto_134803 - BLOCK
      ?auto_134804 - BLOCK
      ?auto_134805 - BLOCK
      ?auto_134806 - BLOCK
      ?auto_134807 - BLOCK
      ?auto_134808 - BLOCK
      ?auto_134809 - BLOCK
      ?auto_134810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134810 ) ( ON-TABLE ?auto_134800 ) ( ON ?auto_134801 ?auto_134800 ) ( not ( = ?auto_134800 ?auto_134801 ) ) ( not ( = ?auto_134800 ?auto_134802 ) ) ( not ( = ?auto_134800 ?auto_134803 ) ) ( not ( = ?auto_134800 ?auto_134804 ) ) ( not ( = ?auto_134800 ?auto_134805 ) ) ( not ( = ?auto_134800 ?auto_134806 ) ) ( not ( = ?auto_134800 ?auto_134807 ) ) ( not ( = ?auto_134800 ?auto_134808 ) ) ( not ( = ?auto_134800 ?auto_134809 ) ) ( not ( = ?auto_134800 ?auto_134810 ) ) ( not ( = ?auto_134801 ?auto_134802 ) ) ( not ( = ?auto_134801 ?auto_134803 ) ) ( not ( = ?auto_134801 ?auto_134804 ) ) ( not ( = ?auto_134801 ?auto_134805 ) ) ( not ( = ?auto_134801 ?auto_134806 ) ) ( not ( = ?auto_134801 ?auto_134807 ) ) ( not ( = ?auto_134801 ?auto_134808 ) ) ( not ( = ?auto_134801 ?auto_134809 ) ) ( not ( = ?auto_134801 ?auto_134810 ) ) ( not ( = ?auto_134802 ?auto_134803 ) ) ( not ( = ?auto_134802 ?auto_134804 ) ) ( not ( = ?auto_134802 ?auto_134805 ) ) ( not ( = ?auto_134802 ?auto_134806 ) ) ( not ( = ?auto_134802 ?auto_134807 ) ) ( not ( = ?auto_134802 ?auto_134808 ) ) ( not ( = ?auto_134802 ?auto_134809 ) ) ( not ( = ?auto_134802 ?auto_134810 ) ) ( not ( = ?auto_134803 ?auto_134804 ) ) ( not ( = ?auto_134803 ?auto_134805 ) ) ( not ( = ?auto_134803 ?auto_134806 ) ) ( not ( = ?auto_134803 ?auto_134807 ) ) ( not ( = ?auto_134803 ?auto_134808 ) ) ( not ( = ?auto_134803 ?auto_134809 ) ) ( not ( = ?auto_134803 ?auto_134810 ) ) ( not ( = ?auto_134804 ?auto_134805 ) ) ( not ( = ?auto_134804 ?auto_134806 ) ) ( not ( = ?auto_134804 ?auto_134807 ) ) ( not ( = ?auto_134804 ?auto_134808 ) ) ( not ( = ?auto_134804 ?auto_134809 ) ) ( not ( = ?auto_134804 ?auto_134810 ) ) ( not ( = ?auto_134805 ?auto_134806 ) ) ( not ( = ?auto_134805 ?auto_134807 ) ) ( not ( = ?auto_134805 ?auto_134808 ) ) ( not ( = ?auto_134805 ?auto_134809 ) ) ( not ( = ?auto_134805 ?auto_134810 ) ) ( not ( = ?auto_134806 ?auto_134807 ) ) ( not ( = ?auto_134806 ?auto_134808 ) ) ( not ( = ?auto_134806 ?auto_134809 ) ) ( not ( = ?auto_134806 ?auto_134810 ) ) ( not ( = ?auto_134807 ?auto_134808 ) ) ( not ( = ?auto_134807 ?auto_134809 ) ) ( not ( = ?auto_134807 ?auto_134810 ) ) ( not ( = ?auto_134808 ?auto_134809 ) ) ( not ( = ?auto_134808 ?auto_134810 ) ) ( not ( = ?auto_134809 ?auto_134810 ) ) ( ON ?auto_134809 ?auto_134810 ) ( ON ?auto_134808 ?auto_134809 ) ( ON ?auto_134807 ?auto_134808 ) ( ON ?auto_134806 ?auto_134807 ) ( ON ?auto_134805 ?auto_134806 ) ( ON ?auto_134804 ?auto_134805 ) ( ON ?auto_134803 ?auto_134804 ) ( CLEAR ?auto_134801 ) ( ON ?auto_134802 ?auto_134803 ) ( CLEAR ?auto_134802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134800 ?auto_134801 ?auto_134802 )
      ( MAKE-11PILE ?auto_134800 ?auto_134801 ?auto_134802 ?auto_134803 ?auto_134804 ?auto_134805 ?auto_134806 ?auto_134807 ?auto_134808 ?auto_134809 ?auto_134810 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134822 - BLOCK
      ?auto_134823 - BLOCK
      ?auto_134824 - BLOCK
      ?auto_134825 - BLOCK
      ?auto_134826 - BLOCK
      ?auto_134827 - BLOCK
      ?auto_134828 - BLOCK
      ?auto_134829 - BLOCK
      ?auto_134830 - BLOCK
      ?auto_134831 - BLOCK
      ?auto_134832 - BLOCK
    )
    :vars
    (
      ?auto_134833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134832 ?auto_134833 ) ( ON-TABLE ?auto_134822 ) ( not ( = ?auto_134822 ?auto_134823 ) ) ( not ( = ?auto_134822 ?auto_134824 ) ) ( not ( = ?auto_134822 ?auto_134825 ) ) ( not ( = ?auto_134822 ?auto_134826 ) ) ( not ( = ?auto_134822 ?auto_134827 ) ) ( not ( = ?auto_134822 ?auto_134828 ) ) ( not ( = ?auto_134822 ?auto_134829 ) ) ( not ( = ?auto_134822 ?auto_134830 ) ) ( not ( = ?auto_134822 ?auto_134831 ) ) ( not ( = ?auto_134822 ?auto_134832 ) ) ( not ( = ?auto_134822 ?auto_134833 ) ) ( not ( = ?auto_134823 ?auto_134824 ) ) ( not ( = ?auto_134823 ?auto_134825 ) ) ( not ( = ?auto_134823 ?auto_134826 ) ) ( not ( = ?auto_134823 ?auto_134827 ) ) ( not ( = ?auto_134823 ?auto_134828 ) ) ( not ( = ?auto_134823 ?auto_134829 ) ) ( not ( = ?auto_134823 ?auto_134830 ) ) ( not ( = ?auto_134823 ?auto_134831 ) ) ( not ( = ?auto_134823 ?auto_134832 ) ) ( not ( = ?auto_134823 ?auto_134833 ) ) ( not ( = ?auto_134824 ?auto_134825 ) ) ( not ( = ?auto_134824 ?auto_134826 ) ) ( not ( = ?auto_134824 ?auto_134827 ) ) ( not ( = ?auto_134824 ?auto_134828 ) ) ( not ( = ?auto_134824 ?auto_134829 ) ) ( not ( = ?auto_134824 ?auto_134830 ) ) ( not ( = ?auto_134824 ?auto_134831 ) ) ( not ( = ?auto_134824 ?auto_134832 ) ) ( not ( = ?auto_134824 ?auto_134833 ) ) ( not ( = ?auto_134825 ?auto_134826 ) ) ( not ( = ?auto_134825 ?auto_134827 ) ) ( not ( = ?auto_134825 ?auto_134828 ) ) ( not ( = ?auto_134825 ?auto_134829 ) ) ( not ( = ?auto_134825 ?auto_134830 ) ) ( not ( = ?auto_134825 ?auto_134831 ) ) ( not ( = ?auto_134825 ?auto_134832 ) ) ( not ( = ?auto_134825 ?auto_134833 ) ) ( not ( = ?auto_134826 ?auto_134827 ) ) ( not ( = ?auto_134826 ?auto_134828 ) ) ( not ( = ?auto_134826 ?auto_134829 ) ) ( not ( = ?auto_134826 ?auto_134830 ) ) ( not ( = ?auto_134826 ?auto_134831 ) ) ( not ( = ?auto_134826 ?auto_134832 ) ) ( not ( = ?auto_134826 ?auto_134833 ) ) ( not ( = ?auto_134827 ?auto_134828 ) ) ( not ( = ?auto_134827 ?auto_134829 ) ) ( not ( = ?auto_134827 ?auto_134830 ) ) ( not ( = ?auto_134827 ?auto_134831 ) ) ( not ( = ?auto_134827 ?auto_134832 ) ) ( not ( = ?auto_134827 ?auto_134833 ) ) ( not ( = ?auto_134828 ?auto_134829 ) ) ( not ( = ?auto_134828 ?auto_134830 ) ) ( not ( = ?auto_134828 ?auto_134831 ) ) ( not ( = ?auto_134828 ?auto_134832 ) ) ( not ( = ?auto_134828 ?auto_134833 ) ) ( not ( = ?auto_134829 ?auto_134830 ) ) ( not ( = ?auto_134829 ?auto_134831 ) ) ( not ( = ?auto_134829 ?auto_134832 ) ) ( not ( = ?auto_134829 ?auto_134833 ) ) ( not ( = ?auto_134830 ?auto_134831 ) ) ( not ( = ?auto_134830 ?auto_134832 ) ) ( not ( = ?auto_134830 ?auto_134833 ) ) ( not ( = ?auto_134831 ?auto_134832 ) ) ( not ( = ?auto_134831 ?auto_134833 ) ) ( not ( = ?auto_134832 ?auto_134833 ) ) ( ON ?auto_134831 ?auto_134832 ) ( ON ?auto_134830 ?auto_134831 ) ( ON ?auto_134829 ?auto_134830 ) ( ON ?auto_134828 ?auto_134829 ) ( ON ?auto_134827 ?auto_134828 ) ( ON ?auto_134826 ?auto_134827 ) ( ON ?auto_134825 ?auto_134826 ) ( ON ?auto_134824 ?auto_134825 ) ( CLEAR ?auto_134822 ) ( ON ?auto_134823 ?auto_134824 ) ( CLEAR ?auto_134823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134822 ?auto_134823 )
      ( MAKE-11PILE ?auto_134822 ?auto_134823 ?auto_134824 ?auto_134825 ?auto_134826 ?auto_134827 ?auto_134828 ?auto_134829 ?auto_134830 ?auto_134831 ?auto_134832 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134845 - BLOCK
      ?auto_134846 - BLOCK
      ?auto_134847 - BLOCK
      ?auto_134848 - BLOCK
      ?auto_134849 - BLOCK
      ?auto_134850 - BLOCK
      ?auto_134851 - BLOCK
      ?auto_134852 - BLOCK
      ?auto_134853 - BLOCK
      ?auto_134854 - BLOCK
      ?auto_134855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134855 ) ( ON-TABLE ?auto_134845 ) ( not ( = ?auto_134845 ?auto_134846 ) ) ( not ( = ?auto_134845 ?auto_134847 ) ) ( not ( = ?auto_134845 ?auto_134848 ) ) ( not ( = ?auto_134845 ?auto_134849 ) ) ( not ( = ?auto_134845 ?auto_134850 ) ) ( not ( = ?auto_134845 ?auto_134851 ) ) ( not ( = ?auto_134845 ?auto_134852 ) ) ( not ( = ?auto_134845 ?auto_134853 ) ) ( not ( = ?auto_134845 ?auto_134854 ) ) ( not ( = ?auto_134845 ?auto_134855 ) ) ( not ( = ?auto_134846 ?auto_134847 ) ) ( not ( = ?auto_134846 ?auto_134848 ) ) ( not ( = ?auto_134846 ?auto_134849 ) ) ( not ( = ?auto_134846 ?auto_134850 ) ) ( not ( = ?auto_134846 ?auto_134851 ) ) ( not ( = ?auto_134846 ?auto_134852 ) ) ( not ( = ?auto_134846 ?auto_134853 ) ) ( not ( = ?auto_134846 ?auto_134854 ) ) ( not ( = ?auto_134846 ?auto_134855 ) ) ( not ( = ?auto_134847 ?auto_134848 ) ) ( not ( = ?auto_134847 ?auto_134849 ) ) ( not ( = ?auto_134847 ?auto_134850 ) ) ( not ( = ?auto_134847 ?auto_134851 ) ) ( not ( = ?auto_134847 ?auto_134852 ) ) ( not ( = ?auto_134847 ?auto_134853 ) ) ( not ( = ?auto_134847 ?auto_134854 ) ) ( not ( = ?auto_134847 ?auto_134855 ) ) ( not ( = ?auto_134848 ?auto_134849 ) ) ( not ( = ?auto_134848 ?auto_134850 ) ) ( not ( = ?auto_134848 ?auto_134851 ) ) ( not ( = ?auto_134848 ?auto_134852 ) ) ( not ( = ?auto_134848 ?auto_134853 ) ) ( not ( = ?auto_134848 ?auto_134854 ) ) ( not ( = ?auto_134848 ?auto_134855 ) ) ( not ( = ?auto_134849 ?auto_134850 ) ) ( not ( = ?auto_134849 ?auto_134851 ) ) ( not ( = ?auto_134849 ?auto_134852 ) ) ( not ( = ?auto_134849 ?auto_134853 ) ) ( not ( = ?auto_134849 ?auto_134854 ) ) ( not ( = ?auto_134849 ?auto_134855 ) ) ( not ( = ?auto_134850 ?auto_134851 ) ) ( not ( = ?auto_134850 ?auto_134852 ) ) ( not ( = ?auto_134850 ?auto_134853 ) ) ( not ( = ?auto_134850 ?auto_134854 ) ) ( not ( = ?auto_134850 ?auto_134855 ) ) ( not ( = ?auto_134851 ?auto_134852 ) ) ( not ( = ?auto_134851 ?auto_134853 ) ) ( not ( = ?auto_134851 ?auto_134854 ) ) ( not ( = ?auto_134851 ?auto_134855 ) ) ( not ( = ?auto_134852 ?auto_134853 ) ) ( not ( = ?auto_134852 ?auto_134854 ) ) ( not ( = ?auto_134852 ?auto_134855 ) ) ( not ( = ?auto_134853 ?auto_134854 ) ) ( not ( = ?auto_134853 ?auto_134855 ) ) ( not ( = ?auto_134854 ?auto_134855 ) ) ( ON ?auto_134854 ?auto_134855 ) ( ON ?auto_134853 ?auto_134854 ) ( ON ?auto_134852 ?auto_134853 ) ( ON ?auto_134851 ?auto_134852 ) ( ON ?auto_134850 ?auto_134851 ) ( ON ?auto_134849 ?auto_134850 ) ( ON ?auto_134848 ?auto_134849 ) ( ON ?auto_134847 ?auto_134848 ) ( CLEAR ?auto_134845 ) ( ON ?auto_134846 ?auto_134847 ) ( CLEAR ?auto_134846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134845 ?auto_134846 )
      ( MAKE-11PILE ?auto_134845 ?auto_134846 ?auto_134847 ?auto_134848 ?auto_134849 ?auto_134850 ?auto_134851 ?auto_134852 ?auto_134853 ?auto_134854 ?auto_134855 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134867 - BLOCK
      ?auto_134868 - BLOCK
      ?auto_134869 - BLOCK
      ?auto_134870 - BLOCK
      ?auto_134871 - BLOCK
      ?auto_134872 - BLOCK
      ?auto_134873 - BLOCK
      ?auto_134874 - BLOCK
      ?auto_134875 - BLOCK
      ?auto_134876 - BLOCK
      ?auto_134877 - BLOCK
    )
    :vars
    (
      ?auto_134878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134877 ?auto_134878 ) ( not ( = ?auto_134867 ?auto_134868 ) ) ( not ( = ?auto_134867 ?auto_134869 ) ) ( not ( = ?auto_134867 ?auto_134870 ) ) ( not ( = ?auto_134867 ?auto_134871 ) ) ( not ( = ?auto_134867 ?auto_134872 ) ) ( not ( = ?auto_134867 ?auto_134873 ) ) ( not ( = ?auto_134867 ?auto_134874 ) ) ( not ( = ?auto_134867 ?auto_134875 ) ) ( not ( = ?auto_134867 ?auto_134876 ) ) ( not ( = ?auto_134867 ?auto_134877 ) ) ( not ( = ?auto_134867 ?auto_134878 ) ) ( not ( = ?auto_134868 ?auto_134869 ) ) ( not ( = ?auto_134868 ?auto_134870 ) ) ( not ( = ?auto_134868 ?auto_134871 ) ) ( not ( = ?auto_134868 ?auto_134872 ) ) ( not ( = ?auto_134868 ?auto_134873 ) ) ( not ( = ?auto_134868 ?auto_134874 ) ) ( not ( = ?auto_134868 ?auto_134875 ) ) ( not ( = ?auto_134868 ?auto_134876 ) ) ( not ( = ?auto_134868 ?auto_134877 ) ) ( not ( = ?auto_134868 ?auto_134878 ) ) ( not ( = ?auto_134869 ?auto_134870 ) ) ( not ( = ?auto_134869 ?auto_134871 ) ) ( not ( = ?auto_134869 ?auto_134872 ) ) ( not ( = ?auto_134869 ?auto_134873 ) ) ( not ( = ?auto_134869 ?auto_134874 ) ) ( not ( = ?auto_134869 ?auto_134875 ) ) ( not ( = ?auto_134869 ?auto_134876 ) ) ( not ( = ?auto_134869 ?auto_134877 ) ) ( not ( = ?auto_134869 ?auto_134878 ) ) ( not ( = ?auto_134870 ?auto_134871 ) ) ( not ( = ?auto_134870 ?auto_134872 ) ) ( not ( = ?auto_134870 ?auto_134873 ) ) ( not ( = ?auto_134870 ?auto_134874 ) ) ( not ( = ?auto_134870 ?auto_134875 ) ) ( not ( = ?auto_134870 ?auto_134876 ) ) ( not ( = ?auto_134870 ?auto_134877 ) ) ( not ( = ?auto_134870 ?auto_134878 ) ) ( not ( = ?auto_134871 ?auto_134872 ) ) ( not ( = ?auto_134871 ?auto_134873 ) ) ( not ( = ?auto_134871 ?auto_134874 ) ) ( not ( = ?auto_134871 ?auto_134875 ) ) ( not ( = ?auto_134871 ?auto_134876 ) ) ( not ( = ?auto_134871 ?auto_134877 ) ) ( not ( = ?auto_134871 ?auto_134878 ) ) ( not ( = ?auto_134872 ?auto_134873 ) ) ( not ( = ?auto_134872 ?auto_134874 ) ) ( not ( = ?auto_134872 ?auto_134875 ) ) ( not ( = ?auto_134872 ?auto_134876 ) ) ( not ( = ?auto_134872 ?auto_134877 ) ) ( not ( = ?auto_134872 ?auto_134878 ) ) ( not ( = ?auto_134873 ?auto_134874 ) ) ( not ( = ?auto_134873 ?auto_134875 ) ) ( not ( = ?auto_134873 ?auto_134876 ) ) ( not ( = ?auto_134873 ?auto_134877 ) ) ( not ( = ?auto_134873 ?auto_134878 ) ) ( not ( = ?auto_134874 ?auto_134875 ) ) ( not ( = ?auto_134874 ?auto_134876 ) ) ( not ( = ?auto_134874 ?auto_134877 ) ) ( not ( = ?auto_134874 ?auto_134878 ) ) ( not ( = ?auto_134875 ?auto_134876 ) ) ( not ( = ?auto_134875 ?auto_134877 ) ) ( not ( = ?auto_134875 ?auto_134878 ) ) ( not ( = ?auto_134876 ?auto_134877 ) ) ( not ( = ?auto_134876 ?auto_134878 ) ) ( not ( = ?auto_134877 ?auto_134878 ) ) ( ON ?auto_134876 ?auto_134877 ) ( ON ?auto_134875 ?auto_134876 ) ( ON ?auto_134874 ?auto_134875 ) ( ON ?auto_134873 ?auto_134874 ) ( ON ?auto_134872 ?auto_134873 ) ( ON ?auto_134871 ?auto_134872 ) ( ON ?auto_134870 ?auto_134871 ) ( ON ?auto_134869 ?auto_134870 ) ( ON ?auto_134868 ?auto_134869 ) ( ON ?auto_134867 ?auto_134868 ) ( CLEAR ?auto_134867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134867 )
      ( MAKE-11PILE ?auto_134867 ?auto_134868 ?auto_134869 ?auto_134870 ?auto_134871 ?auto_134872 ?auto_134873 ?auto_134874 ?auto_134875 ?auto_134876 ?auto_134877 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134890 - BLOCK
      ?auto_134891 - BLOCK
      ?auto_134892 - BLOCK
      ?auto_134893 - BLOCK
      ?auto_134894 - BLOCK
      ?auto_134895 - BLOCK
      ?auto_134896 - BLOCK
      ?auto_134897 - BLOCK
      ?auto_134898 - BLOCK
      ?auto_134899 - BLOCK
      ?auto_134900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134900 ) ( not ( = ?auto_134890 ?auto_134891 ) ) ( not ( = ?auto_134890 ?auto_134892 ) ) ( not ( = ?auto_134890 ?auto_134893 ) ) ( not ( = ?auto_134890 ?auto_134894 ) ) ( not ( = ?auto_134890 ?auto_134895 ) ) ( not ( = ?auto_134890 ?auto_134896 ) ) ( not ( = ?auto_134890 ?auto_134897 ) ) ( not ( = ?auto_134890 ?auto_134898 ) ) ( not ( = ?auto_134890 ?auto_134899 ) ) ( not ( = ?auto_134890 ?auto_134900 ) ) ( not ( = ?auto_134891 ?auto_134892 ) ) ( not ( = ?auto_134891 ?auto_134893 ) ) ( not ( = ?auto_134891 ?auto_134894 ) ) ( not ( = ?auto_134891 ?auto_134895 ) ) ( not ( = ?auto_134891 ?auto_134896 ) ) ( not ( = ?auto_134891 ?auto_134897 ) ) ( not ( = ?auto_134891 ?auto_134898 ) ) ( not ( = ?auto_134891 ?auto_134899 ) ) ( not ( = ?auto_134891 ?auto_134900 ) ) ( not ( = ?auto_134892 ?auto_134893 ) ) ( not ( = ?auto_134892 ?auto_134894 ) ) ( not ( = ?auto_134892 ?auto_134895 ) ) ( not ( = ?auto_134892 ?auto_134896 ) ) ( not ( = ?auto_134892 ?auto_134897 ) ) ( not ( = ?auto_134892 ?auto_134898 ) ) ( not ( = ?auto_134892 ?auto_134899 ) ) ( not ( = ?auto_134892 ?auto_134900 ) ) ( not ( = ?auto_134893 ?auto_134894 ) ) ( not ( = ?auto_134893 ?auto_134895 ) ) ( not ( = ?auto_134893 ?auto_134896 ) ) ( not ( = ?auto_134893 ?auto_134897 ) ) ( not ( = ?auto_134893 ?auto_134898 ) ) ( not ( = ?auto_134893 ?auto_134899 ) ) ( not ( = ?auto_134893 ?auto_134900 ) ) ( not ( = ?auto_134894 ?auto_134895 ) ) ( not ( = ?auto_134894 ?auto_134896 ) ) ( not ( = ?auto_134894 ?auto_134897 ) ) ( not ( = ?auto_134894 ?auto_134898 ) ) ( not ( = ?auto_134894 ?auto_134899 ) ) ( not ( = ?auto_134894 ?auto_134900 ) ) ( not ( = ?auto_134895 ?auto_134896 ) ) ( not ( = ?auto_134895 ?auto_134897 ) ) ( not ( = ?auto_134895 ?auto_134898 ) ) ( not ( = ?auto_134895 ?auto_134899 ) ) ( not ( = ?auto_134895 ?auto_134900 ) ) ( not ( = ?auto_134896 ?auto_134897 ) ) ( not ( = ?auto_134896 ?auto_134898 ) ) ( not ( = ?auto_134896 ?auto_134899 ) ) ( not ( = ?auto_134896 ?auto_134900 ) ) ( not ( = ?auto_134897 ?auto_134898 ) ) ( not ( = ?auto_134897 ?auto_134899 ) ) ( not ( = ?auto_134897 ?auto_134900 ) ) ( not ( = ?auto_134898 ?auto_134899 ) ) ( not ( = ?auto_134898 ?auto_134900 ) ) ( not ( = ?auto_134899 ?auto_134900 ) ) ( ON ?auto_134899 ?auto_134900 ) ( ON ?auto_134898 ?auto_134899 ) ( ON ?auto_134897 ?auto_134898 ) ( ON ?auto_134896 ?auto_134897 ) ( ON ?auto_134895 ?auto_134896 ) ( ON ?auto_134894 ?auto_134895 ) ( ON ?auto_134893 ?auto_134894 ) ( ON ?auto_134892 ?auto_134893 ) ( ON ?auto_134891 ?auto_134892 ) ( ON ?auto_134890 ?auto_134891 ) ( CLEAR ?auto_134890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134890 )
      ( MAKE-11PILE ?auto_134890 ?auto_134891 ?auto_134892 ?auto_134893 ?auto_134894 ?auto_134895 ?auto_134896 ?auto_134897 ?auto_134898 ?auto_134899 ?auto_134900 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_134912 - BLOCK
      ?auto_134913 - BLOCK
      ?auto_134914 - BLOCK
      ?auto_134915 - BLOCK
      ?auto_134916 - BLOCK
      ?auto_134917 - BLOCK
      ?auto_134918 - BLOCK
      ?auto_134919 - BLOCK
      ?auto_134920 - BLOCK
      ?auto_134921 - BLOCK
      ?auto_134922 - BLOCK
    )
    :vars
    (
      ?auto_134923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134912 ?auto_134913 ) ) ( not ( = ?auto_134912 ?auto_134914 ) ) ( not ( = ?auto_134912 ?auto_134915 ) ) ( not ( = ?auto_134912 ?auto_134916 ) ) ( not ( = ?auto_134912 ?auto_134917 ) ) ( not ( = ?auto_134912 ?auto_134918 ) ) ( not ( = ?auto_134912 ?auto_134919 ) ) ( not ( = ?auto_134912 ?auto_134920 ) ) ( not ( = ?auto_134912 ?auto_134921 ) ) ( not ( = ?auto_134912 ?auto_134922 ) ) ( not ( = ?auto_134913 ?auto_134914 ) ) ( not ( = ?auto_134913 ?auto_134915 ) ) ( not ( = ?auto_134913 ?auto_134916 ) ) ( not ( = ?auto_134913 ?auto_134917 ) ) ( not ( = ?auto_134913 ?auto_134918 ) ) ( not ( = ?auto_134913 ?auto_134919 ) ) ( not ( = ?auto_134913 ?auto_134920 ) ) ( not ( = ?auto_134913 ?auto_134921 ) ) ( not ( = ?auto_134913 ?auto_134922 ) ) ( not ( = ?auto_134914 ?auto_134915 ) ) ( not ( = ?auto_134914 ?auto_134916 ) ) ( not ( = ?auto_134914 ?auto_134917 ) ) ( not ( = ?auto_134914 ?auto_134918 ) ) ( not ( = ?auto_134914 ?auto_134919 ) ) ( not ( = ?auto_134914 ?auto_134920 ) ) ( not ( = ?auto_134914 ?auto_134921 ) ) ( not ( = ?auto_134914 ?auto_134922 ) ) ( not ( = ?auto_134915 ?auto_134916 ) ) ( not ( = ?auto_134915 ?auto_134917 ) ) ( not ( = ?auto_134915 ?auto_134918 ) ) ( not ( = ?auto_134915 ?auto_134919 ) ) ( not ( = ?auto_134915 ?auto_134920 ) ) ( not ( = ?auto_134915 ?auto_134921 ) ) ( not ( = ?auto_134915 ?auto_134922 ) ) ( not ( = ?auto_134916 ?auto_134917 ) ) ( not ( = ?auto_134916 ?auto_134918 ) ) ( not ( = ?auto_134916 ?auto_134919 ) ) ( not ( = ?auto_134916 ?auto_134920 ) ) ( not ( = ?auto_134916 ?auto_134921 ) ) ( not ( = ?auto_134916 ?auto_134922 ) ) ( not ( = ?auto_134917 ?auto_134918 ) ) ( not ( = ?auto_134917 ?auto_134919 ) ) ( not ( = ?auto_134917 ?auto_134920 ) ) ( not ( = ?auto_134917 ?auto_134921 ) ) ( not ( = ?auto_134917 ?auto_134922 ) ) ( not ( = ?auto_134918 ?auto_134919 ) ) ( not ( = ?auto_134918 ?auto_134920 ) ) ( not ( = ?auto_134918 ?auto_134921 ) ) ( not ( = ?auto_134918 ?auto_134922 ) ) ( not ( = ?auto_134919 ?auto_134920 ) ) ( not ( = ?auto_134919 ?auto_134921 ) ) ( not ( = ?auto_134919 ?auto_134922 ) ) ( not ( = ?auto_134920 ?auto_134921 ) ) ( not ( = ?auto_134920 ?auto_134922 ) ) ( not ( = ?auto_134921 ?auto_134922 ) ) ( ON ?auto_134912 ?auto_134923 ) ( not ( = ?auto_134922 ?auto_134923 ) ) ( not ( = ?auto_134921 ?auto_134923 ) ) ( not ( = ?auto_134920 ?auto_134923 ) ) ( not ( = ?auto_134919 ?auto_134923 ) ) ( not ( = ?auto_134918 ?auto_134923 ) ) ( not ( = ?auto_134917 ?auto_134923 ) ) ( not ( = ?auto_134916 ?auto_134923 ) ) ( not ( = ?auto_134915 ?auto_134923 ) ) ( not ( = ?auto_134914 ?auto_134923 ) ) ( not ( = ?auto_134913 ?auto_134923 ) ) ( not ( = ?auto_134912 ?auto_134923 ) ) ( ON ?auto_134913 ?auto_134912 ) ( ON ?auto_134914 ?auto_134913 ) ( ON ?auto_134915 ?auto_134914 ) ( ON ?auto_134916 ?auto_134915 ) ( ON ?auto_134917 ?auto_134916 ) ( ON ?auto_134918 ?auto_134917 ) ( ON ?auto_134919 ?auto_134918 ) ( ON ?auto_134920 ?auto_134919 ) ( ON ?auto_134921 ?auto_134920 ) ( ON ?auto_134922 ?auto_134921 ) ( CLEAR ?auto_134922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_134922 ?auto_134921 ?auto_134920 ?auto_134919 ?auto_134918 ?auto_134917 ?auto_134916 ?auto_134915 ?auto_134914 ?auto_134913 ?auto_134912 )
      ( MAKE-11PILE ?auto_134912 ?auto_134913 ?auto_134914 ?auto_134915 ?auto_134916 ?auto_134917 ?auto_134918 ?auto_134919 ?auto_134920 ?auto_134921 ?auto_134922 ) )
  )

)

