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
      ?auto_347766 - BLOCK
    )
    :vars
    (
      ?auto_347767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347766 ?auto_347767 ) ( CLEAR ?auto_347766 ) ( HAND-EMPTY ) ( not ( = ?auto_347766 ?auto_347767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347766 ?auto_347767 )
      ( !PUTDOWN ?auto_347766 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_347769 - BLOCK
    )
    :vars
    (
      ?auto_347770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347769 ?auto_347770 ) ( CLEAR ?auto_347769 ) ( HAND-EMPTY ) ( not ( = ?auto_347769 ?auto_347770 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347769 ?auto_347770 )
      ( !PUTDOWN ?auto_347769 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_347773 - BLOCK
      ?auto_347774 - BLOCK
    )
    :vars
    (
      ?auto_347775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_347773 ) ( ON ?auto_347774 ?auto_347775 ) ( CLEAR ?auto_347774 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_347773 ) ( not ( = ?auto_347773 ?auto_347774 ) ) ( not ( = ?auto_347773 ?auto_347775 ) ) ( not ( = ?auto_347774 ?auto_347775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347774 ?auto_347775 )
      ( !STACK ?auto_347774 ?auto_347773 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_347778 - BLOCK
      ?auto_347779 - BLOCK
    )
    :vars
    (
      ?auto_347780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_347778 ) ( ON ?auto_347779 ?auto_347780 ) ( CLEAR ?auto_347779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_347778 ) ( not ( = ?auto_347778 ?auto_347779 ) ) ( not ( = ?auto_347778 ?auto_347780 ) ) ( not ( = ?auto_347779 ?auto_347780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347779 ?auto_347780 )
      ( !STACK ?auto_347779 ?auto_347778 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_347783 - BLOCK
      ?auto_347784 - BLOCK
    )
    :vars
    (
      ?auto_347785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347784 ?auto_347785 ) ( not ( = ?auto_347783 ?auto_347784 ) ) ( not ( = ?auto_347783 ?auto_347785 ) ) ( not ( = ?auto_347784 ?auto_347785 ) ) ( ON ?auto_347783 ?auto_347784 ) ( CLEAR ?auto_347783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_347783 )
      ( MAKE-2PILE ?auto_347783 ?auto_347784 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_347788 - BLOCK
      ?auto_347789 - BLOCK
    )
    :vars
    (
      ?auto_347790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347789 ?auto_347790 ) ( not ( = ?auto_347788 ?auto_347789 ) ) ( not ( = ?auto_347788 ?auto_347790 ) ) ( not ( = ?auto_347789 ?auto_347790 ) ) ( ON ?auto_347788 ?auto_347789 ) ( CLEAR ?auto_347788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_347788 )
      ( MAKE-2PILE ?auto_347788 ?auto_347789 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_347794 - BLOCK
      ?auto_347795 - BLOCK
      ?auto_347796 - BLOCK
    )
    :vars
    (
      ?auto_347797 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_347795 ) ( ON ?auto_347796 ?auto_347797 ) ( CLEAR ?auto_347796 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_347794 ) ( ON ?auto_347795 ?auto_347794 ) ( not ( = ?auto_347794 ?auto_347795 ) ) ( not ( = ?auto_347794 ?auto_347796 ) ) ( not ( = ?auto_347794 ?auto_347797 ) ) ( not ( = ?auto_347795 ?auto_347796 ) ) ( not ( = ?auto_347795 ?auto_347797 ) ) ( not ( = ?auto_347796 ?auto_347797 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347796 ?auto_347797 )
      ( !STACK ?auto_347796 ?auto_347795 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_347801 - BLOCK
      ?auto_347802 - BLOCK
      ?auto_347803 - BLOCK
    )
    :vars
    (
      ?auto_347804 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_347802 ) ( ON ?auto_347803 ?auto_347804 ) ( CLEAR ?auto_347803 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_347801 ) ( ON ?auto_347802 ?auto_347801 ) ( not ( = ?auto_347801 ?auto_347802 ) ) ( not ( = ?auto_347801 ?auto_347803 ) ) ( not ( = ?auto_347801 ?auto_347804 ) ) ( not ( = ?auto_347802 ?auto_347803 ) ) ( not ( = ?auto_347802 ?auto_347804 ) ) ( not ( = ?auto_347803 ?auto_347804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347803 ?auto_347804 )
      ( !STACK ?auto_347803 ?auto_347802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_347808 - BLOCK
      ?auto_347809 - BLOCK
      ?auto_347810 - BLOCK
    )
    :vars
    (
      ?auto_347811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347810 ?auto_347811 ) ( ON-TABLE ?auto_347808 ) ( not ( = ?auto_347808 ?auto_347809 ) ) ( not ( = ?auto_347808 ?auto_347810 ) ) ( not ( = ?auto_347808 ?auto_347811 ) ) ( not ( = ?auto_347809 ?auto_347810 ) ) ( not ( = ?auto_347809 ?auto_347811 ) ) ( not ( = ?auto_347810 ?auto_347811 ) ) ( CLEAR ?auto_347808 ) ( ON ?auto_347809 ?auto_347810 ) ( CLEAR ?auto_347809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_347808 ?auto_347809 )
      ( MAKE-3PILE ?auto_347808 ?auto_347809 ?auto_347810 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_347815 - BLOCK
      ?auto_347816 - BLOCK
      ?auto_347817 - BLOCK
    )
    :vars
    (
      ?auto_347818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347817 ?auto_347818 ) ( ON-TABLE ?auto_347815 ) ( not ( = ?auto_347815 ?auto_347816 ) ) ( not ( = ?auto_347815 ?auto_347817 ) ) ( not ( = ?auto_347815 ?auto_347818 ) ) ( not ( = ?auto_347816 ?auto_347817 ) ) ( not ( = ?auto_347816 ?auto_347818 ) ) ( not ( = ?auto_347817 ?auto_347818 ) ) ( CLEAR ?auto_347815 ) ( ON ?auto_347816 ?auto_347817 ) ( CLEAR ?auto_347816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_347815 ?auto_347816 )
      ( MAKE-3PILE ?auto_347815 ?auto_347816 ?auto_347817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_347822 - BLOCK
      ?auto_347823 - BLOCK
      ?auto_347824 - BLOCK
    )
    :vars
    (
      ?auto_347825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347824 ?auto_347825 ) ( not ( = ?auto_347822 ?auto_347823 ) ) ( not ( = ?auto_347822 ?auto_347824 ) ) ( not ( = ?auto_347822 ?auto_347825 ) ) ( not ( = ?auto_347823 ?auto_347824 ) ) ( not ( = ?auto_347823 ?auto_347825 ) ) ( not ( = ?auto_347824 ?auto_347825 ) ) ( ON ?auto_347823 ?auto_347824 ) ( ON ?auto_347822 ?auto_347823 ) ( CLEAR ?auto_347822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_347822 )
      ( MAKE-3PILE ?auto_347822 ?auto_347823 ?auto_347824 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_347829 - BLOCK
      ?auto_347830 - BLOCK
      ?auto_347831 - BLOCK
    )
    :vars
    (
      ?auto_347832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347831 ?auto_347832 ) ( not ( = ?auto_347829 ?auto_347830 ) ) ( not ( = ?auto_347829 ?auto_347831 ) ) ( not ( = ?auto_347829 ?auto_347832 ) ) ( not ( = ?auto_347830 ?auto_347831 ) ) ( not ( = ?auto_347830 ?auto_347832 ) ) ( not ( = ?auto_347831 ?auto_347832 ) ) ( ON ?auto_347830 ?auto_347831 ) ( ON ?auto_347829 ?auto_347830 ) ( CLEAR ?auto_347829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_347829 )
      ( MAKE-3PILE ?auto_347829 ?auto_347830 ?auto_347831 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_347837 - BLOCK
      ?auto_347838 - BLOCK
      ?auto_347839 - BLOCK
      ?auto_347840 - BLOCK
    )
    :vars
    (
      ?auto_347841 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_347839 ) ( ON ?auto_347840 ?auto_347841 ) ( CLEAR ?auto_347840 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_347837 ) ( ON ?auto_347838 ?auto_347837 ) ( ON ?auto_347839 ?auto_347838 ) ( not ( = ?auto_347837 ?auto_347838 ) ) ( not ( = ?auto_347837 ?auto_347839 ) ) ( not ( = ?auto_347837 ?auto_347840 ) ) ( not ( = ?auto_347837 ?auto_347841 ) ) ( not ( = ?auto_347838 ?auto_347839 ) ) ( not ( = ?auto_347838 ?auto_347840 ) ) ( not ( = ?auto_347838 ?auto_347841 ) ) ( not ( = ?auto_347839 ?auto_347840 ) ) ( not ( = ?auto_347839 ?auto_347841 ) ) ( not ( = ?auto_347840 ?auto_347841 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347840 ?auto_347841 )
      ( !STACK ?auto_347840 ?auto_347839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_347846 - BLOCK
      ?auto_347847 - BLOCK
      ?auto_347848 - BLOCK
      ?auto_347849 - BLOCK
    )
    :vars
    (
      ?auto_347850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_347848 ) ( ON ?auto_347849 ?auto_347850 ) ( CLEAR ?auto_347849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_347846 ) ( ON ?auto_347847 ?auto_347846 ) ( ON ?auto_347848 ?auto_347847 ) ( not ( = ?auto_347846 ?auto_347847 ) ) ( not ( = ?auto_347846 ?auto_347848 ) ) ( not ( = ?auto_347846 ?auto_347849 ) ) ( not ( = ?auto_347846 ?auto_347850 ) ) ( not ( = ?auto_347847 ?auto_347848 ) ) ( not ( = ?auto_347847 ?auto_347849 ) ) ( not ( = ?auto_347847 ?auto_347850 ) ) ( not ( = ?auto_347848 ?auto_347849 ) ) ( not ( = ?auto_347848 ?auto_347850 ) ) ( not ( = ?auto_347849 ?auto_347850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347849 ?auto_347850 )
      ( !STACK ?auto_347849 ?auto_347848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_347855 - BLOCK
      ?auto_347856 - BLOCK
      ?auto_347857 - BLOCK
      ?auto_347858 - BLOCK
    )
    :vars
    (
      ?auto_347859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347858 ?auto_347859 ) ( ON-TABLE ?auto_347855 ) ( ON ?auto_347856 ?auto_347855 ) ( not ( = ?auto_347855 ?auto_347856 ) ) ( not ( = ?auto_347855 ?auto_347857 ) ) ( not ( = ?auto_347855 ?auto_347858 ) ) ( not ( = ?auto_347855 ?auto_347859 ) ) ( not ( = ?auto_347856 ?auto_347857 ) ) ( not ( = ?auto_347856 ?auto_347858 ) ) ( not ( = ?auto_347856 ?auto_347859 ) ) ( not ( = ?auto_347857 ?auto_347858 ) ) ( not ( = ?auto_347857 ?auto_347859 ) ) ( not ( = ?auto_347858 ?auto_347859 ) ) ( CLEAR ?auto_347856 ) ( ON ?auto_347857 ?auto_347858 ) ( CLEAR ?auto_347857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_347855 ?auto_347856 ?auto_347857 )
      ( MAKE-4PILE ?auto_347855 ?auto_347856 ?auto_347857 ?auto_347858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_347864 - BLOCK
      ?auto_347865 - BLOCK
      ?auto_347866 - BLOCK
      ?auto_347867 - BLOCK
    )
    :vars
    (
      ?auto_347868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347867 ?auto_347868 ) ( ON-TABLE ?auto_347864 ) ( ON ?auto_347865 ?auto_347864 ) ( not ( = ?auto_347864 ?auto_347865 ) ) ( not ( = ?auto_347864 ?auto_347866 ) ) ( not ( = ?auto_347864 ?auto_347867 ) ) ( not ( = ?auto_347864 ?auto_347868 ) ) ( not ( = ?auto_347865 ?auto_347866 ) ) ( not ( = ?auto_347865 ?auto_347867 ) ) ( not ( = ?auto_347865 ?auto_347868 ) ) ( not ( = ?auto_347866 ?auto_347867 ) ) ( not ( = ?auto_347866 ?auto_347868 ) ) ( not ( = ?auto_347867 ?auto_347868 ) ) ( CLEAR ?auto_347865 ) ( ON ?auto_347866 ?auto_347867 ) ( CLEAR ?auto_347866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_347864 ?auto_347865 ?auto_347866 )
      ( MAKE-4PILE ?auto_347864 ?auto_347865 ?auto_347866 ?auto_347867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_347873 - BLOCK
      ?auto_347874 - BLOCK
      ?auto_347875 - BLOCK
      ?auto_347876 - BLOCK
    )
    :vars
    (
      ?auto_347877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347876 ?auto_347877 ) ( ON-TABLE ?auto_347873 ) ( not ( = ?auto_347873 ?auto_347874 ) ) ( not ( = ?auto_347873 ?auto_347875 ) ) ( not ( = ?auto_347873 ?auto_347876 ) ) ( not ( = ?auto_347873 ?auto_347877 ) ) ( not ( = ?auto_347874 ?auto_347875 ) ) ( not ( = ?auto_347874 ?auto_347876 ) ) ( not ( = ?auto_347874 ?auto_347877 ) ) ( not ( = ?auto_347875 ?auto_347876 ) ) ( not ( = ?auto_347875 ?auto_347877 ) ) ( not ( = ?auto_347876 ?auto_347877 ) ) ( ON ?auto_347875 ?auto_347876 ) ( CLEAR ?auto_347873 ) ( ON ?auto_347874 ?auto_347875 ) ( CLEAR ?auto_347874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_347873 ?auto_347874 )
      ( MAKE-4PILE ?auto_347873 ?auto_347874 ?auto_347875 ?auto_347876 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_347882 - BLOCK
      ?auto_347883 - BLOCK
      ?auto_347884 - BLOCK
      ?auto_347885 - BLOCK
    )
    :vars
    (
      ?auto_347886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347885 ?auto_347886 ) ( ON-TABLE ?auto_347882 ) ( not ( = ?auto_347882 ?auto_347883 ) ) ( not ( = ?auto_347882 ?auto_347884 ) ) ( not ( = ?auto_347882 ?auto_347885 ) ) ( not ( = ?auto_347882 ?auto_347886 ) ) ( not ( = ?auto_347883 ?auto_347884 ) ) ( not ( = ?auto_347883 ?auto_347885 ) ) ( not ( = ?auto_347883 ?auto_347886 ) ) ( not ( = ?auto_347884 ?auto_347885 ) ) ( not ( = ?auto_347884 ?auto_347886 ) ) ( not ( = ?auto_347885 ?auto_347886 ) ) ( ON ?auto_347884 ?auto_347885 ) ( CLEAR ?auto_347882 ) ( ON ?auto_347883 ?auto_347884 ) ( CLEAR ?auto_347883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_347882 ?auto_347883 )
      ( MAKE-4PILE ?auto_347882 ?auto_347883 ?auto_347884 ?auto_347885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_347891 - BLOCK
      ?auto_347892 - BLOCK
      ?auto_347893 - BLOCK
      ?auto_347894 - BLOCK
    )
    :vars
    (
      ?auto_347895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347894 ?auto_347895 ) ( not ( = ?auto_347891 ?auto_347892 ) ) ( not ( = ?auto_347891 ?auto_347893 ) ) ( not ( = ?auto_347891 ?auto_347894 ) ) ( not ( = ?auto_347891 ?auto_347895 ) ) ( not ( = ?auto_347892 ?auto_347893 ) ) ( not ( = ?auto_347892 ?auto_347894 ) ) ( not ( = ?auto_347892 ?auto_347895 ) ) ( not ( = ?auto_347893 ?auto_347894 ) ) ( not ( = ?auto_347893 ?auto_347895 ) ) ( not ( = ?auto_347894 ?auto_347895 ) ) ( ON ?auto_347893 ?auto_347894 ) ( ON ?auto_347892 ?auto_347893 ) ( ON ?auto_347891 ?auto_347892 ) ( CLEAR ?auto_347891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_347891 )
      ( MAKE-4PILE ?auto_347891 ?auto_347892 ?auto_347893 ?auto_347894 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_347900 - BLOCK
      ?auto_347901 - BLOCK
      ?auto_347902 - BLOCK
      ?auto_347903 - BLOCK
    )
    :vars
    (
      ?auto_347904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347903 ?auto_347904 ) ( not ( = ?auto_347900 ?auto_347901 ) ) ( not ( = ?auto_347900 ?auto_347902 ) ) ( not ( = ?auto_347900 ?auto_347903 ) ) ( not ( = ?auto_347900 ?auto_347904 ) ) ( not ( = ?auto_347901 ?auto_347902 ) ) ( not ( = ?auto_347901 ?auto_347903 ) ) ( not ( = ?auto_347901 ?auto_347904 ) ) ( not ( = ?auto_347902 ?auto_347903 ) ) ( not ( = ?auto_347902 ?auto_347904 ) ) ( not ( = ?auto_347903 ?auto_347904 ) ) ( ON ?auto_347902 ?auto_347903 ) ( ON ?auto_347901 ?auto_347902 ) ( ON ?auto_347900 ?auto_347901 ) ( CLEAR ?auto_347900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_347900 )
      ( MAKE-4PILE ?auto_347900 ?auto_347901 ?auto_347902 ?auto_347903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_347910 - BLOCK
      ?auto_347911 - BLOCK
      ?auto_347912 - BLOCK
      ?auto_347913 - BLOCK
      ?auto_347914 - BLOCK
    )
    :vars
    (
      ?auto_347915 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_347913 ) ( ON ?auto_347914 ?auto_347915 ) ( CLEAR ?auto_347914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_347910 ) ( ON ?auto_347911 ?auto_347910 ) ( ON ?auto_347912 ?auto_347911 ) ( ON ?auto_347913 ?auto_347912 ) ( not ( = ?auto_347910 ?auto_347911 ) ) ( not ( = ?auto_347910 ?auto_347912 ) ) ( not ( = ?auto_347910 ?auto_347913 ) ) ( not ( = ?auto_347910 ?auto_347914 ) ) ( not ( = ?auto_347910 ?auto_347915 ) ) ( not ( = ?auto_347911 ?auto_347912 ) ) ( not ( = ?auto_347911 ?auto_347913 ) ) ( not ( = ?auto_347911 ?auto_347914 ) ) ( not ( = ?auto_347911 ?auto_347915 ) ) ( not ( = ?auto_347912 ?auto_347913 ) ) ( not ( = ?auto_347912 ?auto_347914 ) ) ( not ( = ?auto_347912 ?auto_347915 ) ) ( not ( = ?auto_347913 ?auto_347914 ) ) ( not ( = ?auto_347913 ?auto_347915 ) ) ( not ( = ?auto_347914 ?auto_347915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347914 ?auto_347915 )
      ( !STACK ?auto_347914 ?auto_347913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_347921 - BLOCK
      ?auto_347922 - BLOCK
      ?auto_347923 - BLOCK
      ?auto_347924 - BLOCK
      ?auto_347925 - BLOCK
    )
    :vars
    (
      ?auto_347926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_347924 ) ( ON ?auto_347925 ?auto_347926 ) ( CLEAR ?auto_347925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_347921 ) ( ON ?auto_347922 ?auto_347921 ) ( ON ?auto_347923 ?auto_347922 ) ( ON ?auto_347924 ?auto_347923 ) ( not ( = ?auto_347921 ?auto_347922 ) ) ( not ( = ?auto_347921 ?auto_347923 ) ) ( not ( = ?auto_347921 ?auto_347924 ) ) ( not ( = ?auto_347921 ?auto_347925 ) ) ( not ( = ?auto_347921 ?auto_347926 ) ) ( not ( = ?auto_347922 ?auto_347923 ) ) ( not ( = ?auto_347922 ?auto_347924 ) ) ( not ( = ?auto_347922 ?auto_347925 ) ) ( not ( = ?auto_347922 ?auto_347926 ) ) ( not ( = ?auto_347923 ?auto_347924 ) ) ( not ( = ?auto_347923 ?auto_347925 ) ) ( not ( = ?auto_347923 ?auto_347926 ) ) ( not ( = ?auto_347924 ?auto_347925 ) ) ( not ( = ?auto_347924 ?auto_347926 ) ) ( not ( = ?auto_347925 ?auto_347926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_347925 ?auto_347926 )
      ( !STACK ?auto_347925 ?auto_347924 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_347932 - BLOCK
      ?auto_347933 - BLOCK
      ?auto_347934 - BLOCK
      ?auto_347935 - BLOCK
      ?auto_347936 - BLOCK
    )
    :vars
    (
      ?auto_347937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347936 ?auto_347937 ) ( ON-TABLE ?auto_347932 ) ( ON ?auto_347933 ?auto_347932 ) ( ON ?auto_347934 ?auto_347933 ) ( not ( = ?auto_347932 ?auto_347933 ) ) ( not ( = ?auto_347932 ?auto_347934 ) ) ( not ( = ?auto_347932 ?auto_347935 ) ) ( not ( = ?auto_347932 ?auto_347936 ) ) ( not ( = ?auto_347932 ?auto_347937 ) ) ( not ( = ?auto_347933 ?auto_347934 ) ) ( not ( = ?auto_347933 ?auto_347935 ) ) ( not ( = ?auto_347933 ?auto_347936 ) ) ( not ( = ?auto_347933 ?auto_347937 ) ) ( not ( = ?auto_347934 ?auto_347935 ) ) ( not ( = ?auto_347934 ?auto_347936 ) ) ( not ( = ?auto_347934 ?auto_347937 ) ) ( not ( = ?auto_347935 ?auto_347936 ) ) ( not ( = ?auto_347935 ?auto_347937 ) ) ( not ( = ?auto_347936 ?auto_347937 ) ) ( CLEAR ?auto_347934 ) ( ON ?auto_347935 ?auto_347936 ) ( CLEAR ?auto_347935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_347932 ?auto_347933 ?auto_347934 ?auto_347935 )
      ( MAKE-5PILE ?auto_347932 ?auto_347933 ?auto_347934 ?auto_347935 ?auto_347936 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_347943 - BLOCK
      ?auto_347944 - BLOCK
      ?auto_347945 - BLOCK
      ?auto_347946 - BLOCK
      ?auto_347947 - BLOCK
    )
    :vars
    (
      ?auto_347948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347947 ?auto_347948 ) ( ON-TABLE ?auto_347943 ) ( ON ?auto_347944 ?auto_347943 ) ( ON ?auto_347945 ?auto_347944 ) ( not ( = ?auto_347943 ?auto_347944 ) ) ( not ( = ?auto_347943 ?auto_347945 ) ) ( not ( = ?auto_347943 ?auto_347946 ) ) ( not ( = ?auto_347943 ?auto_347947 ) ) ( not ( = ?auto_347943 ?auto_347948 ) ) ( not ( = ?auto_347944 ?auto_347945 ) ) ( not ( = ?auto_347944 ?auto_347946 ) ) ( not ( = ?auto_347944 ?auto_347947 ) ) ( not ( = ?auto_347944 ?auto_347948 ) ) ( not ( = ?auto_347945 ?auto_347946 ) ) ( not ( = ?auto_347945 ?auto_347947 ) ) ( not ( = ?auto_347945 ?auto_347948 ) ) ( not ( = ?auto_347946 ?auto_347947 ) ) ( not ( = ?auto_347946 ?auto_347948 ) ) ( not ( = ?auto_347947 ?auto_347948 ) ) ( CLEAR ?auto_347945 ) ( ON ?auto_347946 ?auto_347947 ) ( CLEAR ?auto_347946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_347943 ?auto_347944 ?auto_347945 ?auto_347946 )
      ( MAKE-5PILE ?auto_347943 ?auto_347944 ?auto_347945 ?auto_347946 ?auto_347947 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_347954 - BLOCK
      ?auto_347955 - BLOCK
      ?auto_347956 - BLOCK
      ?auto_347957 - BLOCK
      ?auto_347958 - BLOCK
    )
    :vars
    (
      ?auto_347959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347958 ?auto_347959 ) ( ON-TABLE ?auto_347954 ) ( ON ?auto_347955 ?auto_347954 ) ( not ( = ?auto_347954 ?auto_347955 ) ) ( not ( = ?auto_347954 ?auto_347956 ) ) ( not ( = ?auto_347954 ?auto_347957 ) ) ( not ( = ?auto_347954 ?auto_347958 ) ) ( not ( = ?auto_347954 ?auto_347959 ) ) ( not ( = ?auto_347955 ?auto_347956 ) ) ( not ( = ?auto_347955 ?auto_347957 ) ) ( not ( = ?auto_347955 ?auto_347958 ) ) ( not ( = ?auto_347955 ?auto_347959 ) ) ( not ( = ?auto_347956 ?auto_347957 ) ) ( not ( = ?auto_347956 ?auto_347958 ) ) ( not ( = ?auto_347956 ?auto_347959 ) ) ( not ( = ?auto_347957 ?auto_347958 ) ) ( not ( = ?auto_347957 ?auto_347959 ) ) ( not ( = ?auto_347958 ?auto_347959 ) ) ( ON ?auto_347957 ?auto_347958 ) ( CLEAR ?auto_347955 ) ( ON ?auto_347956 ?auto_347957 ) ( CLEAR ?auto_347956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_347954 ?auto_347955 ?auto_347956 )
      ( MAKE-5PILE ?auto_347954 ?auto_347955 ?auto_347956 ?auto_347957 ?auto_347958 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_347965 - BLOCK
      ?auto_347966 - BLOCK
      ?auto_347967 - BLOCK
      ?auto_347968 - BLOCK
      ?auto_347969 - BLOCK
    )
    :vars
    (
      ?auto_347970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347969 ?auto_347970 ) ( ON-TABLE ?auto_347965 ) ( ON ?auto_347966 ?auto_347965 ) ( not ( = ?auto_347965 ?auto_347966 ) ) ( not ( = ?auto_347965 ?auto_347967 ) ) ( not ( = ?auto_347965 ?auto_347968 ) ) ( not ( = ?auto_347965 ?auto_347969 ) ) ( not ( = ?auto_347965 ?auto_347970 ) ) ( not ( = ?auto_347966 ?auto_347967 ) ) ( not ( = ?auto_347966 ?auto_347968 ) ) ( not ( = ?auto_347966 ?auto_347969 ) ) ( not ( = ?auto_347966 ?auto_347970 ) ) ( not ( = ?auto_347967 ?auto_347968 ) ) ( not ( = ?auto_347967 ?auto_347969 ) ) ( not ( = ?auto_347967 ?auto_347970 ) ) ( not ( = ?auto_347968 ?auto_347969 ) ) ( not ( = ?auto_347968 ?auto_347970 ) ) ( not ( = ?auto_347969 ?auto_347970 ) ) ( ON ?auto_347968 ?auto_347969 ) ( CLEAR ?auto_347966 ) ( ON ?auto_347967 ?auto_347968 ) ( CLEAR ?auto_347967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_347965 ?auto_347966 ?auto_347967 )
      ( MAKE-5PILE ?auto_347965 ?auto_347966 ?auto_347967 ?auto_347968 ?auto_347969 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_347976 - BLOCK
      ?auto_347977 - BLOCK
      ?auto_347978 - BLOCK
      ?auto_347979 - BLOCK
      ?auto_347980 - BLOCK
    )
    :vars
    (
      ?auto_347981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347980 ?auto_347981 ) ( ON-TABLE ?auto_347976 ) ( not ( = ?auto_347976 ?auto_347977 ) ) ( not ( = ?auto_347976 ?auto_347978 ) ) ( not ( = ?auto_347976 ?auto_347979 ) ) ( not ( = ?auto_347976 ?auto_347980 ) ) ( not ( = ?auto_347976 ?auto_347981 ) ) ( not ( = ?auto_347977 ?auto_347978 ) ) ( not ( = ?auto_347977 ?auto_347979 ) ) ( not ( = ?auto_347977 ?auto_347980 ) ) ( not ( = ?auto_347977 ?auto_347981 ) ) ( not ( = ?auto_347978 ?auto_347979 ) ) ( not ( = ?auto_347978 ?auto_347980 ) ) ( not ( = ?auto_347978 ?auto_347981 ) ) ( not ( = ?auto_347979 ?auto_347980 ) ) ( not ( = ?auto_347979 ?auto_347981 ) ) ( not ( = ?auto_347980 ?auto_347981 ) ) ( ON ?auto_347979 ?auto_347980 ) ( ON ?auto_347978 ?auto_347979 ) ( CLEAR ?auto_347976 ) ( ON ?auto_347977 ?auto_347978 ) ( CLEAR ?auto_347977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_347976 ?auto_347977 )
      ( MAKE-5PILE ?auto_347976 ?auto_347977 ?auto_347978 ?auto_347979 ?auto_347980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_347987 - BLOCK
      ?auto_347988 - BLOCK
      ?auto_347989 - BLOCK
      ?auto_347990 - BLOCK
      ?auto_347991 - BLOCK
    )
    :vars
    (
      ?auto_347992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_347991 ?auto_347992 ) ( ON-TABLE ?auto_347987 ) ( not ( = ?auto_347987 ?auto_347988 ) ) ( not ( = ?auto_347987 ?auto_347989 ) ) ( not ( = ?auto_347987 ?auto_347990 ) ) ( not ( = ?auto_347987 ?auto_347991 ) ) ( not ( = ?auto_347987 ?auto_347992 ) ) ( not ( = ?auto_347988 ?auto_347989 ) ) ( not ( = ?auto_347988 ?auto_347990 ) ) ( not ( = ?auto_347988 ?auto_347991 ) ) ( not ( = ?auto_347988 ?auto_347992 ) ) ( not ( = ?auto_347989 ?auto_347990 ) ) ( not ( = ?auto_347989 ?auto_347991 ) ) ( not ( = ?auto_347989 ?auto_347992 ) ) ( not ( = ?auto_347990 ?auto_347991 ) ) ( not ( = ?auto_347990 ?auto_347992 ) ) ( not ( = ?auto_347991 ?auto_347992 ) ) ( ON ?auto_347990 ?auto_347991 ) ( ON ?auto_347989 ?auto_347990 ) ( CLEAR ?auto_347987 ) ( ON ?auto_347988 ?auto_347989 ) ( CLEAR ?auto_347988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_347987 ?auto_347988 )
      ( MAKE-5PILE ?auto_347987 ?auto_347988 ?auto_347989 ?auto_347990 ?auto_347991 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_347998 - BLOCK
      ?auto_347999 - BLOCK
      ?auto_348000 - BLOCK
      ?auto_348001 - BLOCK
      ?auto_348002 - BLOCK
    )
    :vars
    (
      ?auto_348003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348002 ?auto_348003 ) ( not ( = ?auto_347998 ?auto_347999 ) ) ( not ( = ?auto_347998 ?auto_348000 ) ) ( not ( = ?auto_347998 ?auto_348001 ) ) ( not ( = ?auto_347998 ?auto_348002 ) ) ( not ( = ?auto_347998 ?auto_348003 ) ) ( not ( = ?auto_347999 ?auto_348000 ) ) ( not ( = ?auto_347999 ?auto_348001 ) ) ( not ( = ?auto_347999 ?auto_348002 ) ) ( not ( = ?auto_347999 ?auto_348003 ) ) ( not ( = ?auto_348000 ?auto_348001 ) ) ( not ( = ?auto_348000 ?auto_348002 ) ) ( not ( = ?auto_348000 ?auto_348003 ) ) ( not ( = ?auto_348001 ?auto_348002 ) ) ( not ( = ?auto_348001 ?auto_348003 ) ) ( not ( = ?auto_348002 ?auto_348003 ) ) ( ON ?auto_348001 ?auto_348002 ) ( ON ?auto_348000 ?auto_348001 ) ( ON ?auto_347999 ?auto_348000 ) ( ON ?auto_347998 ?auto_347999 ) ( CLEAR ?auto_347998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_347998 )
      ( MAKE-5PILE ?auto_347998 ?auto_347999 ?auto_348000 ?auto_348001 ?auto_348002 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_348009 - BLOCK
      ?auto_348010 - BLOCK
      ?auto_348011 - BLOCK
      ?auto_348012 - BLOCK
      ?auto_348013 - BLOCK
    )
    :vars
    (
      ?auto_348014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348013 ?auto_348014 ) ( not ( = ?auto_348009 ?auto_348010 ) ) ( not ( = ?auto_348009 ?auto_348011 ) ) ( not ( = ?auto_348009 ?auto_348012 ) ) ( not ( = ?auto_348009 ?auto_348013 ) ) ( not ( = ?auto_348009 ?auto_348014 ) ) ( not ( = ?auto_348010 ?auto_348011 ) ) ( not ( = ?auto_348010 ?auto_348012 ) ) ( not ( = ?auto_348010 ?auto_348013 ) ) ( not ( = ?auto_348010 ?auto_348014 ) ) ( not ( = ?auto_348011 ?auto_348012 ) ) ( not ( = ?auto_348011 ?auto_348013 ) ) ( not ( = ?auto_348011 ?auto_348014 ) ) ( not ( = ?auto_348012 ?auto_348013 ) ) ( not ( = ?auto_348012 ?auto_348014 ) ) ( not ( = ?auto_348013 ?auto_348014 ) ) ( ON ?auto_348012 ?auto_348013 ) ( ON ?auto_348011 ?auto_348012 ) ( ON ?auto_348010 ?auto_348011 ) ( ON ?auto_348009 ?auto_348010 ) ( CLEAR ?auto_348009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_348009 )
      ( MAKE-5PILE ?auto_348009 ?auto_348010 ?auto_348011 ?auto_348012 ?auto_348013 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348021 - BLOCK
      ?auto_348022 - BLOCK
      ?auto_348023 - BLOCK
      ?auto_348024 - BLOCK
      ?auto_348025 - BLOCK
      ?auto_348026 - BLOCK
    )
    :vars
    (
      ?auto_348027 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_348025 ) ( ON ?auto_348026 ?auto_348027 ) ( CLEAR ?auto_348026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_348021 ) ( ON ?auto_348022 ?auto_348021 ) ( ON ?auto_348023 ?auto_348022 ) ( ON ?auto_348024 ?auto_348023 ) ( ON ?auto_348025 ?auto_348024 ) ( not ( = ?auto_348021 ?auto_348022 ) ) ( not ( = ?auto_348021 ?auto_348023 ) ) ( not ( = ?auto_348021 ?auto_348024 ) ) ( not ( = ?auto_348021 ?auto_348025 ) ) ( not ( = ?auto_348021 ?auto_348026 ) ) ( not ( = ?auto_348021 ?auto_348027 ) ) ( not ( = ?auto_348022 ?auto_348023 ) ) ( not ( = ?auto_348022 ?auto_348024 ) ) ( not ( = ?auto_348022 ?auto_348025 ) ) ( not ( = ?auto_348022 ?auto_348026 ) ) ( not ( = ?auto_348022 ?auto_348027 ) ) ( not ( = ?auto_348023 ?auto_348024 ) ) ( not ( = ?auto_348023 ?auto_348025 ) ) ( not ( = ?auto_348023 ?auto_348026 ) ) ( not ( = ?auto_348023 ?auto_348027 ) ) ( not ( = ?auto_348024 ?auto_348025 ) ) ( not ( = ?auto_348024 ?auto_348026 ) ) ( not ( = ?auto_348024 ?auto_348027 ) ) ( not ( = ?auto_348025 ?auto_348026 ) ) ( not ( = ?auto_348025 ?auto_348027 ) ) ( not ( = ?auto_348026 ?auto_348027 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_348026 ?auto_348027 )
      ( !STACK ?auto_348026 ?auto_348025 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348034 - BLOCK
      ?auto_348035 - BLOCK
      ?auto_348036 - BLOCK
      ?auto_348037 - BLOCK
      ?auto_348038 - BLOCK
      ?auto_348039 - BLOCK
    )
    :vars
    (
      ?auto_348040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_348038 ) ( ON ?auto_348039 ?auto_348040 ) ( CLEAR ?auto_348039 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_348034 ) ( ON ?auto_348035 ?auto_348034 ) ( ON ?auto_348036 ?auto_348035 ) ( ON ?auto_348037 ?auto_348036 ) ( ON ?auto_348038 ?auto_348037 ) ( not ( = ?auto_348034 ?auto_348035 ) ) ( not ( = ?auto_348034 ?auto_348036 ) ) ( not ( = ?auto_348034 ?auto_348037 ) ) ( not ( = ?auto_348034 ?auto_348038 ) ) ( not ( = ?auto_348034 ?auto_348039 ) ) ( not ( = ?auto_348034 ?auto_348040 ) ) ( not ( = ?auto_348035 ?auto_348036 ) ) ( not ( = ?auto_348035 ?auto_348037 ) ) ( not ( = ?auto_348035 ?auto_348038 ) ) ( not ( = ?auto_348035 ?auto_348039 ) ) ( not ( = ?auto_348035 ?auto_348040 ) ) ( not ( = ?auto_348036 ?auto_348037 ) ) ( not ( = ?auto_348036 ?auto_348038 ) ) ( not ( = ?auto_348036 ?auto_348039 ) ) ( not ( = ?auto_348036 ?auto_348040 ) ) ( not ( = ?auto_348037 ?auto_348038 ) ) ( not ( = ?auto_348037 ?auto_348039 ) ) ( not ( = ?auto_348037 ?auto_348040 ) ) ( not ( = ?auto_348038 ?auto_348039 ) ) ( not ( = ?auto_348038 ?auto_348040 ) ) ( not ( = ?auto_348039 ?auto_348040 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_348039 ?auto_348040 )
      ( !STACK ?auto_348039 ?auto_348038 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348047 - BLOCK
      ?auto_348048 - BLOCK
      ?auto_348049 - BLOCK
      ?auto_348050 - BLOCK
      ?auto_348051 - BLOCK
      ?auto_348052 - BLOCK
    )
    :vars
    (
      ?auto_348053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348052 ?auto_348053 ) ( ON-TABLE ?auto_348047 ) ( ON ?auto_348048 ?auto_348047 ) ( ON ?auto_348049 ?auto_348048 ) ( ON ?auto_348050 ?auto_348049 ) ( not ( = ?auto_348047 ?auto_348048 ) ) ( not ( = ?auto_348047 ?auto_348049 ) ) ( not ( = ?auto_348047 ?auto_348050 ) ) ( not ( = ?auto_348047 ?auto_348051 ) ) ( not ( = ?auto_348047 ?auto_348052 ) ) ( not ( = ?auto_348047 ?auto_348053 ) ) ( not ( = ?auto_348048 ?auto_348049 ) ) ( not ( = ?auto_348048 ?auto_348050 ) ) ( not ( = ?auto_348048 ?auto_348051 ) ) ( not ( = ?auto_348048 ?auto_348052 ) ) ( not ( = ?auto_348048 ?auto_348053 ) ) ( not ( = ?auto_348049 ?auto_348050 ) ) ( not ( = ?auto_348049 ?auto_348051 ) ) ( not ( = ?auto_348049 ?auto_348052 ) ) ( not ( = ?auto_348049 ?auto_348053 ) ) ( not ( = ?auto_348050 ?auto_348051 ) ) ( not ( = ?auto_348050 ?auto_348052 ) ) ( not ( = ?auto_348050 ?auto_348053 ) ) ( not ( = ?auto_348051 ?auto_348052 ) ) ( not ( = ?auto_348051 ?auto_348053 ) ) ( not ( = ?auto_348052 ?auto_348053 ) ) ( CLEAR ?auto_348050 ) ( ON ?auto_348051 ?auto_348052 ) ( CLEAR ?auto_348051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_348047 ?auto_348048 ?auto_348049 ?auto_348050 ?auto_348051 )
      ( MAKE-6PILE ?auto_348047 ?auto_348048 ?auto_348049 ?auto_348050 ?auto_348051 ?auto_348052 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348060 - BLOCK
      ?auto_348061 - BLOCK
      ?auto_348062 - BLOCK
      ?auto_348063 - BLOCK
      ?auto_348064 - BLOCK
      ?auto_348065 - BLOCK
    )
    :vars
    (
      ?auto_348066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348065 ?auto_348066 ) ( ON-TABLE ?auto_348060 ) ( ON ?auto_348061 ?auto_348060 ) ( ON ?auto_348062 ?auto_348061 ) ( ON ?auto_348063 ?auto_348062 ) ( not ( = ?auto_348060 ?auto_348061 ) ) ( not ( = ?auto_348060 ?auto_348062 ) ) ( not ( = ?auto_348060 ?auto_348063 ) ) ( not ( = ?auto_348060 ?auto_348064 ) ) ( not ( = ?auto_348060 ?auto_348065 ) ) ( not ( = ?auto_348060 ?auto_348066 ) ) ( not ( = ?auto_348061 ?auto_348062 ) ) ( not ( = ?auto_348061 ?auto_348063 ) ) ( not ( = ?auto_348061 ?auto_348064 ) ) ( not ( = ?auto_348061 ?auto_348065 ) ) ( not ( = ?auto_348061 ?auto_348066 ) ) ( not ( = ?auto_348062 ?auto_348063 ) ) ( not ( = ?auto_348062 ?auto_348064 ) ) ( not ( = ?auto_348062 ?auto_348065 ) ) ( not ( = ?auto_348062 ?auto_348066 ) ) ( not ( = ?auto_348063 ?auto_348064 ) ) ( not ( = ?auto_348063 ?auto_348065 ) ) ( not ( = ?auto_348063 ?auto_348066 ) ) ( not ( = ?auto_348064 ?auto_348065 ) ) ( not ( = ?auto_348064 ?auto_348066 ) ) ( not ( = ?auto_348065 ?auto_348066 ) ) ( CLEAR ?auto_348063 ) ( ON ?auto_348064 ?auto_348065 ) ( CLEAR ?auto_348064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_348060 ?auto_348061 ?auto_348062 ?auto_348063 ?auto_348064 )
      ( MAKE-6PILE ?auto_348060 ?auto_348061 ?auto_348062 ?auto_348063 ?auto_348064 ?auto_348065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348073 - BLOCK
      ?auto_348074 - BLOCK
      ?auto_348075 - BLOCK
      ?auto_348076 - BLOCK
      ?auto_348077 - BLOCK
      ?auto_348078 - BLOCK
    )
    :vars
    (
      ?auto_348079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348078 ?auto_348079 ) ( ON-TABLE ?auto_348073 ) ( ON ?auto_348074 ?auto_348073 ) ( ON ?auto_348075 ?auto_348074 ) ( not ( = ?auto_348073 ?auto_348074 ) ) ( not ( = ?auto_348073 ?auto_348075 ) ) ( not ( = ?auto_348073 ?auto_348076 ) ) ( not ( = ?auto_348073 ?auto_348077 ) ) ( not ( = ?auto_348073 ?auto_348078 ) ) ( not ( = ?auto_348073 ?auto_348079 ) ) ( not ( = ?auto_348074 ?auto_348075 ) ) ( not ( = ?auto_348074 ?auto_348076 ) ) ( not ( = ?auto_348074 ?auto_348077 ) ) ( not ( = ?auto_348074 ?auto_348078 ) ) ( not ( = ?auto_348074 ?auto_348079 ) ) ( not ( = ?auto_348075 ?auto_348076 ) ) ( not ( = ?auto_348075 ?auto_348077 ) ) ( not ( = ?auto_348075 ?auto_348078 ) ) ( not ( = ?auto_348075 ?auto_348079 ) ) ( not ( = ?auto_348076 ?auto_348077 ) ) ( not ( = ?auto_348076 ?auto_348078 ) ) ( not ( = ?auto_348076 ?auto_348079 ) ) ( not ( = ?auto_348077 ?auto_348078 ) ) ( not ( = ?auto_348077 ?auto_348079 ) ) ( not ( = ?auto_348078 ?auto_348079 ) ) ( ON ?auto_348077 ?auto_348078 ) ( CLEAR ?auto_348075 ) ( ON ?auto_348076 ?auto_348077 ) ( CLEAR ?auto_348076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_348073 ?auto_348074 ?auto_348075 ?auto_348076 )
      ( MAKE-6PILE ?auto_348073 ?auto_348074 ?auto_348075 ?auto_348076 ?auto_348077 ?auto_348078 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348086 - BLOCK
      ?auto_348087 - BLOCK
      ?auto_348088 - BLOCK
      ?auto_348089 - BLOCK
      ?auto_348090 - BLOCK
      ?auto_348091 - BLOCK
    )
    :vars
    (
      ?auto_348092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348091 ?auto_348092 ) ( ON-TABLE ?auto_348086 ) ( ON ?auto_348087 ?auto_348086 ) ( ON ?auto_348088 ?auto_348087 ) ( not ( = ?auto_348086 ?auto_348087 ) ) ( not ( = ?auto_348086 ?auto_348088 ) ) ( not ( = ?auto_348086 ?auto_348089 ) ) ( not ( = ?auto_348086 ?auto_348090 ) ) ( not ( = ?auto_348086 ?auto_348091 ) ) ( not ( = ?auto_348086 ?auto_348092 ) ) ( not ( = ?auto_348087 ?auto_348088 ) ) ( not ( = ?auto_348087 ?auto_348089 ) ) ( not ( = ?auto_348087 ?auto_348090 ) ) ( not ( = ?auto_348087 ?auto_348091 ) ) ( not ( = ?auto_348087 ?auto_348092 ) ) ( not ( = ?auto_348088 ?auto_348089 ) ) ( not ( = ?auto_348088 ?auto_348090 ) ) ( not ( = ?auto_348088 ?auto_348091 ) ) ( not ( = ?auto_348088 ?auto_348092 ) ) ( not ( = ?auto_348089 ?auto_348090 ) ) ( not ( = ?auto_348089 ?auto_348091 ) ) ( not ( = ?auto_348089 ?auto_348092 ) ) ( not ( = ?auto_348090 ?auto_348091 ) ) ( not ( = ?auto_348090 ?auto_348092 ) ) ( not ( = ?auto_348091 ?auto_348092 ) ) ( ON ?auto_348090 ?auto_348091 ) ( CLEAR ?auto_348088 ) ( ON ?auto_348089 ?auto_348090 ) ( CLEAR ?auto_348089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_348086 ?auto_348087 ?auto_348088 ?auto_348089 )
      ( MAKE-6PILE ?auto_348086 ?auto_348087 ?auto_348088 ?auto_348089 ?auto_348090 ?auto_348091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348099 - BLOCK
      ?auto_348100 - BLOCK
      ?auto_348101 - BLOCK
      ?auto_348102 - BLOCK
      ?auto_348103 - BLOCK
      ?auto_348104 - BLOCK
    )
    :vars
    (
      ?auto_348105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348104 ?auto_348105 ) ( ON-TABLE ?auto_348099 ) ( ON ?auto_348100 ?auto_348099 ) ( not ( = ?auto_348099 ?auto_348100 ) ) ( not ( = ?auto_348099 ?auto_348101 ) ) ( not ( = ?auto_348099 ?auto_348102 ) ) ( not ( = ?auto_348099 ?auto_348103 ) ) ( not ( = ?auto_348099 ?auto_348104 ) ) ( not ( = ?auto_348099 ?auto_348105 ) ) ( not ( = ?auto_348100 ?auto_348101 ) ) ( not ( = ?auto_348100 ?auto_348102 ) ) ( not ( = ?auto_348100 ?auto_348103 ) ) ( not ( = ?auto_348100 ?auto_348104 ) ) ( not ( = ?auto_348100 ?auto_348105 ) ) ( not ( = ?auto_348101 ?auto_348102 ) ) ( not ( = ?auto_348101 ?auto_348103 ) ) ( not ( = ?auto_348101 ?auto_348104 ) ) ( not ( = ?auto_348101 ?auto_348105 ) ) ( not ( = ?auto_348102 ?auto_348103 ) ) ( not ( = ?auto_348102 ?auto_348104 ) ) ( not ( = ?auto_348102 ?auto_348105 ) ) ( not ( = ?auto_348103 ?auto_348104 ) ) ( not ( = ?auto_348103 ?auto_348105 ) ) ( not ( = ?auto_348104 ?auto_348105 ) ) ( ON ?auto_348103 ?auto_348104 ) ( ON ?auto_348102 ?auto_348103 ) ( CLEAR ?auto_348100 ) ( ON ?auto_348101 ?auto_348102 ) ( CLEAR ?auto_348101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_348099 ?auto_348100 ?auto_348101 )
      ( MAKE-6PILE ?auto_348099 ?auto_348100 ?auto_348101 ?auto_348102 ?auto_348103 ?auto_348104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348112 - BLOCK
      ?auto_348113 - BLOCK
      ?auto_348114 - BLOCK
      ?auto_348115 - BLOCK
      ?auto_348116 - BLOCK
      ?auto_348117 - BLOCK
    )
    :vars
    (
      ?auto_348118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348117 ?auto_348118 ) ( ON-TABLE ?auto_348112 ) ( ON ?auto_348113 ?auto_348112 ) ( not ( = ?auto_348112 ?auto_348113 ) ) ( not ( = ?auto_348112 ?auto_348114 ) ) ( not ( = ?auto_348112 ?auto_348115 ) ) ( not ( = ?auto_348112 ?auto_348116 ) ) ( not ( = ?auto_348112 ?auto_348117 ) ) ( not ( = ?auto_348112 ?auto_348118 ) ) ( not ( = ?auto_348113 ?auto_348114 ) ) ( not ( = ?auto_348113 ?auto_348115 ) ) ( not ( = ?auto_348113 ?auto_348116 ) ) ( not ( = ?auto_348113 ?auto_348117 ) ) ( not ( = ?auto_348113 ?auto_348118 ) ) ( not ( = ?auto_348114 ?auto_348115 ) ) ( not ( = ?auto_348114 ?auto_348116 ) ) ( not ( = ?auto_348114 ?auto_348117 ) ) ( not ( = ?auto_348114 ?auto_348118 ) ) ( not ( = ?auto_348115 ?auto_348116 ) ) ( not ( = ?auto_348115 ?auto_348117 ) ) ( not ( = ?auto_348115 ?auto_348118 ) ) ( not ( = ?auto_348116 ?auto_348117 ) ) ( not ( = ?auto_348116 ?auto_348118 ) ) ( not ( = ?auto_348117 ?auto_348118 ) ) ( ON ?auto_348116 ?auto_348117 ) ( ON ?auto_348115 ?auto_348116 ) ( CLEAR ?auto_348113 ) ( ON ?auto_348114 ?auto_348115 ) ( CLEAR ?auto_348114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_348112 ?auto_348113 ?auto_348114 )
      ( MAKE-6PILE ?auto_348112 ?auto_348113 ?auto_348114 ?auto_348115 ?auto_348116 ?auto_348117 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348125 - BLOCK
      ?auto_348126 - BLOCK
      ?auto_348127 - BLOCK
      ?auto_348128 - BLOCK
      ?auto_348129 - BLOCK
      ?auto_348130 - BLOCK
    )
    :vars
    (
      ?auto_348131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348130 ?auto_348131 ) ( ON-TABLE ?auto_348125 ) ( not ( = ?auto_348125 ?auto_348126 ) ) ( not ( = ?auto_348125 ?auto_348127 ) ) ( not ( = ?auto_348125 ?auto_348128 ) ) ( not ( = ?auto_348125 ?auto_348129 ) ) ( not ( = ?auto_348125 ?auto_348130 ) ) ( not ( = ?auto_348125 ?auto_348131 ) ) ( not ( = ?auto_348126 ?auto_348127 ) ) ( not ( = ?auto_348126 ?auto_348128 ) ) ( not ( = ?auto_348126 ?auto_348129 ) ) ( not ( = ?auto_348126 ?auto_348130 ) ) ( not ( = ?auto_348126 ?auto_348131 ) ) ( not ( = ?auto_348127 ?auto_348128 ) ) ( not ( = ?auto_348127 ?auto_348129 ) ) ( not ( = ?auto_348127 ?auto_348130 ) ) ( not ( = ?auto_348127 ?auto_348131 ) ) ( not ( = ?auto_348128 ?auto_348129 ) ) ( not ( = ?auto_348128 ?auto_348130 ) ) ( not ( = ?auto_348128 ?auto_348131 ) ) ( not ( = ?auto_348129 ?auto_348130 ) ) ( not ( = ?auto_348129 ?auto_348131 ) ) ( not ( = ?auto_348130 ?auto_348131 ) ) ( ON ?auto_348129 ?auto_348130 ) ( ON ?auto_348128 ?auto_348129 ) ( ON ?auto_348127 ?auto_348128 ) ( CLEAR ?auto_348125 ) ( ON ?auto_348126 ?auto_348127 ) ( CLEAR ?auto_348126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_348125 ?auto_348126 )
      ( MAKE-6PILE ?auto_348125 ?auto_348126 ?auto_348127 ?auto_348128 ?auto_348129 ?auto_348130 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348138 - BLOCK
      ?auto_348139 - BLOCK
      ?auto_348140 - BLOCK
      ?auto_348141 - BLOCK
      ?auto_348142 - BLOCK
      ?auto_348143 - BLOCK
    )
    :vars
    (
      ?auto_348144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348143 ?auto_348144 ) ( ON-TABLE ?auto_348138 ) ( not ( = ?auto_348138 ?auto_348139 ) ) ( not ( = ?auto_348138 ?auto_348140 ) ) ( not ( = ?auto_348138 ?auto_348141 ) ) ( not ( = ?auto_348138 ?auto_348142 ) ) ( not ( = ?auto_348138 ?auto_348143 ) ) ( not ( = ?auto_348138 ?auto_348144 ) ) ( not ( = ?auto_348139 ?auto_348140 ) ) ( not ( = ?auto_348139 ?auto_348141 ) ) ( not ( = ?auto_348139 ?auto_348142 ) ) ( not ( = ?auto_348139 ?auto_348143 ) ) ( not ( = ?auto_348139 ?auto_348144 ) ) ( not ( = ?auto_348140 ?auto_348141 ) ) ( not ( = ?auto_348140 ?auto_348142 ) ) ( not ( = ?auto_348140 ?auto_348143 ) ) ( not ( = ?auto_348140 ?auto_348144 ) ) ( not ( = ?auto_348141 ?auto_348142 ) ) ( not ( = ?auto_348141 ?auto_348143 ) ) ( not ( = ?auto_348141 ?auto_348144 ) ) ( not ( = ?auto_348142 ?auto_348143 ) ) ( not ( = ?auto_348142 ?auto_348144 ) ) ( not ( = ?auto_348143 ?auto_348144 ) ) ( ON ?auto_348142 ?auto_348143 ) ( ON ?auto_348141 ?auto_348142 ) ( ON ?auto_348140 ?auto_348141 ) ( CLEAR ?auto_348138 ) ( ON ?auto_348139 ?auto_348140 ) ( CLEAR ?auto_348139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_348138 ?auto_348139 )
      ( MAKE-6PILE ?auto_348138 ?auto_348139 ?auto_348140 ?auto_348141 ?auto_348142 ?auto_348143 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348151 - BLOCK
      ?auto_348152 - BLOCK
      ?auto_348153 - BLOCK
      ?auto_348154 - BLOCK
      ?auto_348155 - BLOCK
      ?auto_348156 - BLOCK
    )
    :vars
    (
      ?auto_348157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348156 ?auto_348157 ) ( not ( = ?auto_348151 ?auto_348152 ) ) ( not ( = ?auto_348151 ?auto_348153 ) ) ( not ( = ?auto_348151 ?auto_348154 ) ) ( not ( = ?auto_348151 ?auto_348155 ) ) ( not ( = ?auto_348151 ?auto_348156 ) ) ( not ( = ?auto_348151 ?auto_348157 ) ) ( not ( = ?auto_348152 ?auto_348153 ) ) ( not ( = ?auto_348152 ?auto_348154 ) ) ( not ( = ?auto_348152 ?auto_348155 ) ) ( not ( = ?auto_348152 ?auto_348156 ) ) ( not ( = ?auto_348152 ?auto_348157 ) ) ( not ( = ?auto_348153 ?auto_348154 ) ) ( not ( = ?auto_348153 ?auto_348155 ) ) ( not ( = ?auto_348153 ?auto_348156 ) ) ( not ( = ?auto_348153 ?auto_348157 ) ) ( not ( = ?auto_348154 ?auto_348155 ) ) ( not ( = ?auto_348154 ?auto_348156 ) ) ( not ( = ?auto_348154 ?auto_348157 ) ) ( not ( = ?auto_348155 ?auto_348156 ) ) ( not ( = ?auto_348155 ?auto_348157 ) ) ( not ( = ?auto_348156 ?auto_348157 ) ) ( ON ?auto_348155 ?auto_348156 ) ( ON ?auto_348154 ?auto_348155 ) ( ON ?auto_348153 ?auto_348154 ) ( ON ?auto_348152 ?auto_348153 ) ( ON ?auto_348151 ?auto_348152 ) ( CLEAR ?auto_348151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_348151 )
      ( MAKE-6PILE ?auto_348151 ?auto_348152 ?auto_348153 ?auto_348154 ?auto_348155 ?auto_348156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_348164 - BLOCK
      ?auto_348165 - BLOCK
      ?auto_348166 - BLOCK
      ?auto_348167 - BLOCK
      ?auto_348168 - BLOCK
      ?auto_348169 - BLOCK
    )
    :vars
    (
      ?auto_348170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348169 ?auto_348170 ) ( not ( = ?auto_348164 ?auto_348165 ) ) ( not ( = ?auto_348164 ?auto_348166 ) ) ( not ( = ?auto_348164 ?auto_348167 ) ) ( not ( = ?auto_348164 ?auto_348168 ) ) ( not ( = ?auto_348164 ?auto_348169 ) ) ( not ( = ?auto_348164 ?auto_348170 ) ) ( not ( = ?auto_348165 ?auto_348166 ) ) ( not ( = ?auto_348165 ?auto_348167 ) ) ( not ( = ?auto_348165 ?auto_348168 ) ) ( not ( = ?auto_348165 ?auto_348169 ) ) ( not ( = ?auto_348165 ?auto_348170 ) ) ( not ( = ?auto_348166 ?auto_348167 ) ) ( not ( = ?auto_348166 ?auto_348168 ) ) ( not ( = ?auto_348166 ?auto_348169 ) ) ( not ( = ?auto_348166 ?auto_348170 ) ) ( not ( = ?auto_348167 ?auto_348168 ) ) ( not ( = ?auto_348167 ?auto_348169 ) ) ( not ( = ?auto_348167 ?auto_348170 ) ) ( not ( = ?auto_348168 ?auto_348169 ) ) ( not ( = ?auto_348168 ?auto_348170 ) ) ( not ( = ?auto_348169 ?auto_348170 ) ) ( ON ?auto_348168 ?auto_348169 ) ( ON ?auto_348167 ?auto_348168 ) ( ON ?auto_348166 ?auto_348167 ) ( ON ?auto_348165 ?auto_348166 ) ( ON ?auto_348164 ?auto_348165 ) ( CLEAR ?auto_348164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_348164 )
      ( MAKE-6PILE ?auto_348164 ?auto_348165 ?auto_348166 ?auto_348167 ?auto_348168 ?auto_348169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348178 - BLOCK
      ?auto_348179 - BLOCK
      ?auto_348180 - BLOCK
      ?auto_348181 - BLOCK
      ?auto_348182 - BLOCK
      ?auto_348183 - BLOCK
      ?auto_348184 - BLOCK
    )
    :vars
    (
      ?auto_348185 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_348183 ) ( ON ?auto_348184 ?auto_348185 ) ( CLEAR ?auto_348184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_348178 ) ( ON ?auto_348179 ?auto_348178 ) ( ON ?auto_348180 ?auto_348179 ) ( ON ?auto_348181 ?auto_348180 ) ( ON ?auto_348182 ?auto_348181 ) ( ON ?auto_348183 ?auto_348182 ) ( not ( = ?auto_348178 ?auto_348179 ) ) ( not ( = ?auto_348178 ?auto_348180 ) ) ( not ( = ?auto_348178 ?auto_348181 ) ) ( not ( = ?auto_348178 ?auto_348182 ) ) ( not ( = ?auto_348178 ?auto_348183 ) ) ( not ( = ?auto_348178 ?auto_348184 ) ) ( not ( = ?auto_348178 ?auto_348185 ) ) ( not ( = ?auto_348179 ?auto_348180 ) ) ( not ( = ?auto_348179 ?auto_348181 ) ) ( not ( = ?auto_348179 ?auto_348182 ) ) ( not ( = ?auto_348179 ?auto_348183 ) ) ( not ( = ?auto_348179 ?auto_348184 ) ) ( not ( = ?auto_348179 ?auto_348185 ) ) ( not ( = ?auto_348180 ?auto_348181 ) ) ( not ( = ?auto_348180 ?auto_348182 ) ) ( not ( = ?auto_348180 ?auto_348183 ) ) ( not ( = ?auto_348180 ?auto_348184 ) ) ( not ( = ?auto_348180 ?auto_348185 ) ) ( not ( = ?auto_348181 ?auto_348182 ) ) ( not ( = ?auto_348181 ?auto_348183 ) ) ( not ( = ?auto_348181 ?auto_348184 ) ) ( not ( = ?auto_348181 ?auto_348185 ) ) ( not ( = ?auto_348182 ?auto_348183 ) ) ( not ( = ?auto_348182 ?auto_348184 ) ) ( not ( = ?auto_348182 ?auto_348185 ) ) ( not ( = ?auto_348183 ?auto_348184 ) ) ( not ( = ?auto_348183 ?auto_348185 ) ) ( not ( = ?auto_348184 ?auto_348185 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_348184 ?auto_348185 )
      ( !STACK ?auto_348184 ?auto_348183 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348193 - BLOCK
      ?auto_348194 - BLOCK
      ?auto_348195 - BLOCK
      ?auto_348196 - BLOCK
      ?auto_348197 - BLOCK
      ?auto_348198 - BLOCK
      ?auto_348199 - BLOCK
    )
    :vars
    (
      ?auto_348200 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_348198 ) ( ON ?auto_348199 ?auto_348200 ) ( CLEAR ?auto_348199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_348193 ) ( ON ?auto_348194 ?auto_348193 ) ( ON ?auto_348195 ?auto_348194 ) ( ON ?auto_348196 ?auto_348195 ) ( ON ?auto_348197 ?auto_348196 ) ( ON ?auto_348198 ?auto_348197 ) ( not ( = ?auto_348193 ?auto_348194 ) ) ( not ( = ?auto_348193 ?auto_348195 ) ) ( not ( = ?auto_348193 ?auto_348196 ) ) ( not ( = ?auto_348193 ?auto_348197 ) ) ( not ( = ?auto_348193 ?auto_348198 ) ) ( not ( = ?auto_348193 ?auto_348199 ) ) ( not ( = ?auto_348193 ?auto_348200 ) ) ( not ( = ?auto_348194 ?auto_348195 ) ) ( not ( = ?auto_348194 ?auto_348196 ) ) ( not ( = ?auto_348194 ?auto_348197 ) ) ( not ( = ?auto_348194 ?auto_348198 ) ) ( not ( = ?auto_348194 ?auto_348199 ) ) ( not ( = ?auto_348194 ?auto_348200 ) ) ( not ( = ?auto_348195 ?auto_348196 ) ) ( not ( = ?auto_348195 ?auto_348197 ) ) ( not ( = ?auto_348195 ?auto_348198 ) ) ( not ( = ?auto_348195 ?auto_348199 ) ) ( not ( = ?auto_348195 ?auto_348200 ) ) ( not ( = ?auto_348196 ?auto_348197 ) ) ( not ( = ?auto_348196 ?auto_348198 ) ) ( not ( = ?auto_348196 ?auto_348199 ) ) ( not ( = ?auto_348196 ?auto_348200 ) ) ( not ( = ?auto_348197 ?auto_348198 ) ) ( not ( = ?auto_348197 ?auto_348199 ) ) ( not ( = ?auto_348197 ?auto_348200 ) ) ( not ( = ?auto_348198 ?auto_348199 ) ) ( not ( = ?auto_348198 ?auto_348200 ) ) ( not ( = ?auto_348199 ?auto_348200 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_348199 ?auto_348200 )
      ( !STACK ?auto_348199 ?auto_348198 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348208 - BLOCK
      ?auto_348209 - BLOCK
      ?auto_348210 - BLOCK
      ?auto_348211 - BLOCK
      ?auto_348212 - BLOCK
      ?auto_348213 - BLOCK
      ?auto_348214 - BLOCK
    )
    :vars
    (
      ?auto_348215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348214 ?auto_348215 ) ( ON-TABLE ?auto_348208 ) ( ON ?auto_348209 ?auto_348208 ) ( ON ?auto_348210 ?auto_348209 ) ( ON ?auto_348211 ?auto_348210 ) ( ON ?auto_348212 ?auto_348211 ) ( not ( = ?auto_348208 ?auto_348209 ) ) ( not ( = ?auto_348208 ?auto_348210 ) ) ( not ( = ?auto_348208 ?auto_348211 ) ) ( not ( = ?auto_348208 ?auto_348212 ) ) ( not ( = ?auto_348208 ?auto_348213 ) ) ( not ( = ?auto_348208 ?auto_348214 ) ) ( not ( = ?auto_348208 ?auto_348215 ) ) ( not ( = ?auto_348209 ?auto_348210 ) ) ( not ( = ?auto_348209 ?auto_348211 ) ) ( not ( = ?auto_348209 ?auto_348212 ) ) ( not ( = ?auto_348209 ?auto_348213 ) ) ( not ( = ?auto_348209 ?auto_348214 ) ) ( not ( = ?auto_348209 ?auto_348215 ) ) ( not ( = ?auto_348210 ?auto_348211 ) ) ( not ( = ?auto_348210 ?auto_348212 ) ) ( not ( = ?auto_348210 ?auto_348213 ) ) ( not ( = ?auto_348210 ?auto_348214 ) ) ( not ( = ?auto_348210 ?auto_348215 ) ) ( not ( = ?auto_348211 ?auto_348212 ) ) ( not ( = ?auto_348211 ?auto_348213 ) ) ( not ( = ?auto_348211 ?auto_348214 ) ) ( not ( = ?auto_348211 ?auto_348215 ) ) ( not ( = ?auto_348212 ?auto_348213 ) ) ( not ( = ?auto_348212 ?auto_348214 ) ) ( not ( = ?auto_348212 ?auto_348215 ) ) ( not ( = ?auto_348213 ?auto_348214 ) ) ( not ( = ?auto_348213 ?auto_348215 ) ) ( not ( = ?auto_348214 ?auto_348215 ) ) ( CLEAR ?auto_348212 ) ( ON ?auto_348213 ?auto_348214 ) ( CLEAR ?auto_348213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_348208 ?auto_348209 ?auto_348210 ?auto_348211 ?auto_348212 ?auto_348213 )
      ( MAKE-7PILE ?auto_348208 ?auto_348209 ?auto_348210 ?auto_348211 ?auto_348212 ?auto_348213 ?auto_348214 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348223 - BLOCK
      ?auto_348224 - BLOCK
      ?auto_348225 - BLOCK
      ?auto_348226 - BLOCK
      ?auto_348227 - BLOCK
      ?auto_348228 - BLOCK
      ?auto_348229 - BLOCK
    )
    :vars
    (
      ?auto_348230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348229 ?auto_348230 ) ( ON-TABLE ?auto_348223 ) ( ON ?auto_348224 ?auto_348223 ) ( ON ?auto_348225 ?auto_348224 ) ( ON ?auto_348226 ?auto_348225 ) ( ON ?auto_348227 ?auto_348226 ) ( not ( = ?auto_348223 ?auto_348224 ) ) ( not ( = ?auto_348223 ?auto_348225 ) ) ( not ( = ?auto_348223 ?auto_348226 ) ) ( not ( = ?auto_348223 ?auto_348227 ) ) ( not ( = ?auto_348223 ?auto_348228 ) ) ( not ( = ?auto_348223 ?auto_348229 ) ) ( not ( = ?auto_348223 ?auto_348230 ) ) ( not ( = ?auto_348224 ?auto_348225 ) ) ( not ( = ?auto_348224 ?auto_348226 ) ) ( not ( = ?auto_348224 ?auto_348227 ) ) ( not ( = ?auto_348224 ?auto_348228 ) ) ( not ( = ?auto_348224 ?auto_348229 ) ) ( not ( = ?auto_348224 ?auto_348230 ) ) ( not ( = ?auto_348225 ?auto_348226 ) ) ( not ( = ?auto_348225 ?auto_348227 ) ) ( not ( = ?auto_348225 ?auto_348228 ) ) ( not ( = ?auto_348225 ?auto_348229 ) ) ( not ( = ?auto_348225 ?auto_348230 ) ) ( not ( = ?auto_348226 ?auto_348227 ) ) ( not ( = ?auto_348226 ?auto_348228 ) ) ( not ( = ?auto_348226 ?auto_348229 ) ) ( not ( = ?auto_348226 ?auto_348230 ) ) ( not ( = ?auto_348227 ?auto_348228 ) ) ( not ( = ?auto_348227 ?auto_348229 ) ) ( not ( = ?auto_348227 ?auto_348230 ) ) ( not ( = ?auto_348228 ?auto_348229 ) ) ( not ( = ?auto_348228 ?auto_348230 ) ) ( not ( = ?auto_348229 ?auto_348230 ) ) ( CLEAR ?auto_348227 ) ( ON ?auto_348228 ?auto_348229 ) ( CLEAR ?auto_348228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_348223 ?auto_348224 ?auto_348225 ?auto_348226 ?auto_348227 ?auto_348228 )
      ( MAKE-7PILE ?auto_348223 ?auto_348224 ?auto_348225 ?auto_348226 ?auto_348227 ?auto_348228 ?auto_348229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348238 - BLOCK
      ?auto_348239 - BLOCK
      ?auto_348240 - BLOCK
      ?auto_348241 - BLOCK
      ?auto_348242 - BLOCK
      ?auto_348243 - BLOCK
      ?auto_348244 - BLOCK
    )
    :vars
    (
      ?auto_348245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348244 ?auto_348245 ) ( ON-TABLE ?auto_348238 ) ( ON ?auto_348239 ?auto_348238 ) ( ON ?auto_348240 ?auto_348239 ) ( ON ?auto_348241 ?auto_348240 ) ( not ( = ?auto_348238 ?auto_348239 ) ) ( not ( = ?auto_348238 ?auto_348240 ) ) ( not ( = ?auto_348238 ?auto_348241 ) ) ( not ( = ?auto_348238 ?auto_348242 ) ) ( not ( = ?auto_348238 ?auto_348243 ) ) ( not ( = ?auto_348238 ?auto_348244 ) ) ( not ( = ?auto_348238 ?auto_348245 ) ) ( not ( = ?auto_348239 ?auto_348240 ) ) ( not ( = ?auto_348239 ?auto_348241 ) ) ( not ( = ?auto_348239 ?auto_348242 ) ) ( not ( = ?auto_348239 ?auto_348243 ) ) ( not ( = ?auto_348239 ?auto_348244 ) ) ( not ( = ?auto_348239 ?auto_348245 ) ) ( not ( = ?auto_348240 ?auto_348241 ) ) ( not ( = ?auto_348240 ?auto_348242 ) ) ( not ( = ?auto_348240 ?auto_348243 ) ) ( not ( = ?auto_348240 ?auto_348244 ) ) ( not ( = ?auto_348240 ?auto_348245 ) ) ( not ( = ?auto_348241 ?auto_348242 ) ) ( not ( = ?auto_348241 ?auto_348243 ) ) ( not ( = ?auto_348241 ?auto_348244 ) ) ( not ( = ?auto_348241 ?auto_348245 ) ) ( not ( = ?auto_348242 ?auto_348243 ) ) ( not ( = ?auto_348242 ?auto_348244 ) ) ( not ( = ?auto_348242 ?auto_348245 ) ) ( not ( = ?auto_348243 ?auto_348244 ) ) ( not ( = ?auto_348243 ?auto_348245 ) ) ( not ( = ?auto_348244 ?auto_348245 ) ) ( ON ?auto_348243 ?auto_348244 ) ( CLEAR ?auto_348241 ) ( ON ?auto_348242 ?auto_348243 ) ( CLEAR ?auto_348242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_348238 ?auto_348239 ?auto_348240 ?auto_348241 ?auto_348242 )
      ( MAKE-7PILE ?auto_348238 ?auto_348239 ?auto_348240 ?auto_348241 ?auto_348242 ?auto_348243 ?auto_348244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348253 - BLOCK
      ?auto_348254 - BLOCK
      ?auto_348255 - BLOCK
      ?auto_348256 - BLOCK
      ?auto_348257 - BLOCK
      ?auto_348258 - BLOCK
      ?auto_348259 - BLOCK
    )
    :vars
    (
      ?auto_348260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348259 ?auto_348260 ) ( ON-TABLE ?auto_348253 ) ( ON ?auto_348254 ?auto_348253 ) ( ON ?auto_348255 ?auto_348254 ) ( ON ?auto_348256 ?auto_348255 ) ( not ( = ?auto_348253 ?auto_348254 ) ) ( not ( = ?auto_348253 ?auto_348255 ) ) ( not ( = ?auto_348253 ?auto_348256 ) ) ( not ( = ?auto_348253 ?auto_348257 ) ) ( not ( = ?auto_348253 ?auto_348258 ) ) ( not ( = ?auto_348253 ?auto_348259 ) ) ( not ( = ?auto_348253 ?auto_348260 ) ) ( not ( = ?auto_348254 ?auto_348255 ) ) ( not ( = ?auto_348254 ?auto_348256 ) ) ( not ( = ?auto_348254 ?auto_348257 ) ) ( not ( = ?auto_348254 ?auto_348258 ) ) ( not ( = ?auto_348254 ?auto_348259 ) ) ( not ( = ?auto_348254 ?auto_348260 ) ) ( not ( = ?auto_348255 ?auto_348256 ) ) ( not ( = ?auto_348255 ?auto_348257 ) ) ( not ( = ?auto_348255 ?auto_348258 ) ) ( not ( = ?auto_348255 ?auto_348259 ) ) ( not ( = ?auto_348255 ?auto_348260 ) ) ( not ( = ?auto_348256 ?auto_348257 ) ) ( not ( = ?auto_348256 ?auto_348258 ) ) ( not ( = ?auto_348256 ?auto_348259 ) ) ( not ( = ?auto_348256 ?auto_348260 ) ) ( not ( = ?auto_348257 ?auto_348258 ) ) ( not ( = ?auto_348257 ?auto_348259 ) ) ( not ( = ?auto_348257 ?auto_348260 ) ) ( not ( = ?auto_348258 ?auto_348259 ) ) ( not ( = ?auto_348258 ?auto_348260 ) ) ( not ( = ?auto_348259 ?auto_348260 ) ) ( ON ?auto_348258 ?auto_348259 ) ( CLEAR ?auto_348256 ) ( ON ?auto_348257 ?auto_348258 ) ( CLEAR ?auto_348257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_348253 ?auto_348254 ?auto_348255 ?auto_348256 ?auto_348257 )
      ( MAKE-7PILE ?auto_348253 ?auto_348254 ?auto_348255 ?auto_348256 ?auto_348257 ?auto_348258 ?auto_348259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348268 - BLOCK
      ?auto_348269 - BLOCK
      ?auto_348270 - BLOCK
      ?auto_348271 - BLOCK
      ?auto_348272 - BLOCK
      ?auto_348273 - BLOCK
      ?auto_348274 - BLOCK
    )
    :vars
    (
      ?auto_348275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348274 ?auto_348275 ) ( ON-TABLE ?auto_348268 ) ( ON ?auto_348269 ?auto_348268 ) ( ON ?auto_348270 ?auto_348269 ) ( not ( = ?auto_348268 ?auto_348269 ) ) ( not ( = ?auto_348268 ?auto_348270 ) ) ( not ( = ?auto_348268 ?auto_348271 ) ) ( not ( = ?auto_348268 ?auto_348272 ) ) ( not ( = ?auto_348268 ?auto_348273 ) ) ( not ( = ?auto_348268 ?auto_348274 ) ) ( not ( = ?auto_348268 ?auto_348275 ) ) ( not ( = ?auto_348269 ?auto_348270 ) ) ( not ( = ?auto_348269 ?auto_348271 ) ) ( not ( = ?auto_348269 ?auto_348272 ) ) ( not ( = ?auto_348269 ?auto_348273 ) ) ( not ( = ?auto_348269 ?auto_348274 ) ) ( not ( = ?auto_348269 ?auto_348275 ) ) ( not ( = ?auto_348270 ?auto_348271 ) ) ( not ( = ?auto_348270 ?auto_348272 ) ) ( not ( = ?auto_348270 ?auto_348273 ) ) ( not ( = ?auto_348270 ?auto_348274 ) ) ( not ( = ?auto_348270 ?auto_348275 ) ) ( not ( = ?auto_348271 ?auto_348272 ) ) ( not ( = ?auto_348271 ?auto_348273 ) ) ( not ( = ?auto_348271 ?auto_348274 ) ) ( not ( = ?auto_348271 ?auto_348275 ) ) ( not ( = ?auto_348272 ?auto_348273 ) ) ( not ( = ?auto_348272 ?auto_348274 ) ) ( not ( = ?auto_348272 ?auto_348275 ) ) ( not ( = ?auto_348273 ?auto_348274 ) ) ( not ( = ?auto_348273 ?auto_348275 ) ) ( not ( = ?auto_348274 ?auto_348275 ) ) ( ON ?auto_348273 ?auto_348274 ) ( ON ?auto_348272 ?auto_348273 ) ( CLEAR ?auto_348270 ) ( ON ?auto_348271 ?auto_348272 ) ( CLEAR ?auto_348271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_348268 ?auto_348269 ?auto_348270 ?auto_348271 )
      ( MAKE-7PILE ?auto_348268 ?auto_348269 ?auto_348270 ?auto_348271 ?auto_348272 ?auto_348273 ?auto_348274 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348283 - BLOCK
      ?auto_348284 - BLOCK
      ?auto_348285 - BLOCK
      ?auto_348286 - BLOCK
      ?auto_348287 - BLOCK
      ?auto_348288 - BLOCK
      ?auto_348289 - BLOCK
    )
    :vars
    (
      ?auto_348290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348289 ?auto_348290 ) ( ON-TABLE ?auto_348283 ) ( ON ?auto_348284 ?auto_348283 ) ( ON ?auto_348285 ?auto_348284 ) ( not ( = ?auto_348283 ?auto_348284 ) ) ( not ( = ?auto_348283 ?auto_348285 ) ) ( not ( = ?auto_348283 ?auto_348286 ) ) ( not ( = ?auto_348283 ?auto_348287 ) ) ( not ( = ?auto_348283 ?auto_348288 ) ) ( not ( = ?auto_348283 ?auto_348289 ) ) ( not ( = ?auto_348283 ?auto_348290 ) ) ( not ( = ?auto_348284 ?auto_348285 ) ) ( not ( = ?auto_348284 ?auto_348286 ) ) ( not ( = ?auto_348284 ?auto_348287 ) ) ( not ( = ?auto_348284 ?auto_348288 ) ) ( not ( = ?auto_348284 ?auto_348289 ) ) ( not ( = ?auto_348284 ?auto_348290 ) ) ( not ( = ?auto_348285 ?auto_348286 ) ) ( not ( = ?auto_348285 ?auto_348287 ) ) ( not ( = ?auto_348285 ?auto_348288 ) ) ( not ( = ?auto_348285 ?auto_348289 ) ) ( not ( = ?auto_348285 ?auto_348290 ) ) ( not ( = ?auto_348286 ?auto_348287 ) ) ( not ( = ?auto_348286 ?auto_348288 ) ) ( not ( = ?auto_348286 ?auto_348289 ) ) ( not ( = ?auto_348286 ?auto_348290 ) ) ( not ( = ?auto_348287 ?auto_348288 ) ) ( not ( = ?auto_348287 ?auto_348289 ) ) ( not ( = ?auto_348287 ?auto_348290 ) ) ( not ( = ?auto_348288 ?auto_348289 ) ) ( not ( = ?auto_348288 ?auto_348290 ) ) ( not ( = ?auto_348289 ?auto_348290 ) ) ( ON ?auto_348288 ?auto_348289 ) ( ON ?auto_348287 ?auto_348288 ) ( CLEAR ?auto_348285 ) ( ON ?auto_348286 ?auto_348287 ) ( CLEAR ?auto_348286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_348283 ?auto_348284 ?auto_348285 ?auto_348286 )
      ( MAKE-7PILE ?auto_348283 ?auto_348284 ?auto_348285 ?auto_348286 ?auto_348287 ?auto_348288 ?auto_348289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348298 - BLOCK
      ?auto_348299 - BLOCK
      ?auto_348300 - BLOCK
      ?auto_348301 - BLOCK
      ?auto_348302 - BLOCK
      ?auto_348303 - BLOCK
      ?auto_348304 - BLOCK
    )
    :vars
    (
      ?auto_348305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348304 ?auto_348305 ) ( ON-TABLE ?auto_348298 ) ( ON ?auto_348299 ?auto_348298 ) ( not ( = ?auto_348298 ?auto_348299 ) ) ( not ( = ?auto_348298 ?auto_348300 ) ) ( not ( = ?auto_348298 ?auto_348301 ) ) ( not ( = ?auto_348298 ?auto_348302 ) ) ( not ( = ?auto_348298 ?auto_348303 ) ) ( not ( = ?auto_348298 ?auto_348304 ) ) ( not ( = ?auto_348298 ?auto_348305 ) ) ( not ( = ?auto_348299 ?auto_348300 ) ) ( not ( = ?auto_348299 ?auto_348301 ) ) ( not ( = ?auto_348299 ?auto_348302 ) ) ( not ( = ?auto_348299 ?auto_348303 ) ) ( not ( = ?auto_348299 ?auto_348304 ) ) ( not ( = ?auto_348299 ?auto_348305 ) ) ( not ( = ?auto_348300 ?auto_348301 ) ) ( not ( = ?auto_348300 ?auto_348302 ) ) ( not ( = ?auto_348300 ?auto_348303 ) ) ( not ( = ?auto_348300 ?auto_348304 ) ) ( not ( = ?auto_348300 ?auto_348305 ) ) ( not ( = ?auto_348301 ?auto_348302 ) ) ( not ( = ?auto_348301 ?auto_348303 ) ) ( not ( = ?auto_348301 ?auto_348304 ) ) ( not ( = ?auto_348301 ?auto_348305 ) ) ( not ( = ?auto_348302 ?auto_348303 ) ) ( not ( = ?auto_348302 ?auto_348304 ) ) ( not ( = ?auto_348302 ?auto_348305 ) ) ( not ( = ?auto_348303 ?auto_348304 ) ) ( not ( = ?auto_348303 ?auto_348305 ) ) ( not ( = ?auto_348304 ?auto_348305 ) ) ( ON ?auto_348303 ?auto_348304 ) ( ON ?auto_348302 ?auto_348303 ) ( ON ?auto_348301 ?auto_348302 ) ( CLEAR ?auto_348299 ) ( ON ?auto_348300 ?auto_348301 ) ( CLEAR ?auto_348300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_348298 ?auto_348299 ?auto_348300 )
      ( MAKE-7PILE ?auto_348298 ?auto_348299 ?auto_348300 ?auto_348301 ?auto_348302 ?auto_348303 ?auto_348304 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348313 - BLOCK
      ?auto_348314 - BLOCK
      ?auto_348315 - BLOCK
      ?auto_348316 - BLOCK
      ?auto_348317 - BLOCK
      ?auto_348318 - BLOCK
      ?auto_348319 - BLOCK
    )
    :vars
    (
      ?auto_348320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348319 ?auto_348320 ) ( ON-TABLE ?auto_348313 ) ( ON ?auto_348314 ?auto_348313 ) ( not ( = ?auto_348313 ?auto_348314 ) ) ( not ( = ?auto_348313 ?auto_348315 ) ) ( not ( = ?auto_348313 ?auto_348316 ) ) ( not ( = ?auto_348313 ?auto_348317 ) ) ( not ( = ?auto_348313 ?auto_348318 ) ) ( not ( = ?auto_348313 ?auto_348319 ) ) ( not ( = ?auto_348313 ?auto_348320 ) ) ( not ( = ?auto_348314 ?auto_348315 ) ) ( not ( = ?auto_348314 ?auto_348316 ) ) ( not ( = ?auto_348314 ?auto_348317 ) ) ( not ( = ?auto_348314 ?auto_348318 ) ) ( not ( = ?auto_348314 ?auto_348319 ) ) ( not ( = ?auto_348314 ?auto_348320 ) ) ( not ( = ?auto_348315 ?auto_348316 ) ) ( not ( = ?auto_348315 ?auto_348317 ) ) ( not ( = ?auto_348315 ?auto_348318 ) ) ( not ( = ?auto_348315 ?auto_348319 ) ) ( not ( = ?auto_348315 ?auto_348320 ) ) ( not ( = ?auto_348316 ?auto_348317 ) ) ( not ( = ?auto_348316 ?auto_348318 ) ) ( not ( = ?auto_348316 ?auto_348319 ) ) ( not ( = ?auto_348316 ?auto_348320 ) ) ( not ( = ?auto_348317 ?auto_348318 ) ) ( not ( = ?auto_348317 ?auto_348319 ) ) ( not ( = ?auto_348317 ?auto_348320 ) ) ( not ( = ?auto_348318 ?auto_348319 ) ) ( not ( = ?auto_348318 ?auto_348320 ) ) ( not ( = ?auto_348319 ?auto_348320 ) ) ( ON ?auto_348318 ?auto_348319 ) ( ON ?auto_348317 ?auto_348318 ) ( ON ?auto_348316 ?auto_348317 ) ( CLEAR ?auto_348314 ) ( ON ?auto_348315 ?auto_348316 ) ( CLEAR ?auto_348315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_348313 ?auto_348314 ?auto_348315 )
      ( MAKE-7PILE ?auto_348313 ?auto_348314 ?auto_348315 ?auto_348316 ?auto_348317 ?auto_348318 ?auto_348319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348328 - BLOCK
      ?auto_348329 - BLOCK
      ?auto_348330 - BLOCK
      ?auto_348331 - BLOCK
      ?auto_348332 - BLOCK
      ?auto_348333 - BLOCK
      ?auto_348334 - BLOCK
    )
    :vars
    (
      ?auto_348335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348334 ?auto_348335 ) ( ON-TABLE ?auto_348328 ) ( not ( = ?auto_348328 ?auto_348329 ) ) ( not ( = ?auto_348328 ?auto_348330 ) ) ( not ( = ?auto_348328 ?auto_348331 ) ) ( not ( = ?auto_348328 ?auto_348332 ) ) ( not ( = ?auto_348328 ?auto_348333 ) ) ( not ( = ?auto_348328 ?auto_348334 ) ) ( not ( = ?auto_348328 ?auto_348335 ) ) ( not ( = ?auto_348329 ?auto_348330 ) ) ( not ( = ?auto_348329 ?auto_348331 ) ) ( not ( = ?auto_348329 ?auto_348332 ) ) ( not ( = ?auto_348329 ?auto_348333 ) ) ( not ( = ?auto_348329 ?auto_348334 ) ) ( not ( = ?auto_348329 ?auto_348335 ) ) ( not ( = ?auto_348330 ?auto_348331 ) ) ( not ( = ?auto_348330 ?auto_348332 ) ) ( not ( = ?auto_348330 ?auto_348333 ) ) ( not ( = ?auto_348330 ?auto_348334 ) ) ( not ( = ?auto_348330 ?auto_348335 ) ) ( not ( = ?auto_348331 ?auto_348332 ) ) ( not ( = ?auto_348331 ?auto_348333 ) ) ( not ( = ?auto_348331 ?auto_348334 ) ) ( not ( = ?auto_348331 ?auto_348335 ) ) ( not ( = ?auto_348332 ?auto_348333 ) ) ( not ( = ?auto_348332 ?auto_348334 ) ) ( not ( = ?auto_348332 ?auto_348335 ) ) ( not ( = ?auto_348333 ?auto_348334 ) ) ( not ( = ?auto_348333 ?auto_348335 ) ) ( not ( = ?auto_348334 ?auto_348335 ) ) ( ON ?auto_348333 ?auto_348334 ) ( ON ?auto_348332 ?auto_348333 ) ( ON ?auto_348331 ?auto_348332 ) ( ON ?auto_348330 ?auto_348331 ) ( CLEAR ?auto_348328 ) ( ON ?auto_348329 ?auto_348330 ) ( CLEAR ?auto_348329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_348328 ?auto_348329 )
      ( MAKE-7PILE ?auto_348328 ?auto_348329 ?auto_348330 ?auto_348331 ?auto_348332 ?auto_348333 ?auto_348334 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348343 - BLOCK
      ?auto_348344 - BLOCK
      ?auto_348345 - BLOCK
      ?auto_348346 - BLOCK
      ?auto_348347 - BLOCK
      ?auto_348348 - BLOCK
      ?auto_348349 - BLOCK
    )
    :vars
    (
      ?auto_348350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348349 ?auto_348350 ) ( ON-TABLE ?auto_348343 ) ( not ( = ?auto_348343 ?auto_348344 ) ) ( not ( = ?auto_348343 ?auto_348345 ) ) ( not ( = ?auto_348343 ?auto_348346 ) ) ( not ( = ?auto_348343 ?auto_348347 ) ) ( not ( = ?auto_348343 ?auto_348348 ) ) ( not ( = ?auto_348343 ?auto_348349 ) ) ( not ( = ?auto_348343 ?auto_348350 ) ) ( not ( = ?auto_348344 ?auto_348345 ) ) ( not ( = ?auto_348344 ?auto_348346 ) ) ( not ( = ?auto_348344 ?auto_348347 ) ) ( not ( = ?auto_348344 ?auto_348348 ) ) ( not ( = ?auto_348344 ?auto_348349 ) ) ( not ( = ?auto_348344 ?auto_348350 ) ) ( not ( = ?auto_348345 ?auto_348346 ) ) ( not ( = ?auto_348345 ?auto_348347 ) ) ( not ( = ?auto_348345 ?auto_348348 ) ) ( not ( = ?auto_348345 ?auto_348349 ) ) ( not ( = ?auto_348345 ?auto_348350 ) ) ( not ( = ?auto_348346 ?auto_348347 ) ) ( not ( = ?auto_348346 ?auto_348348 ) ) ( not ( = ?auto_348346 ?auto_348349 ) ) ( not ( = ?auto_348346 ?auto_348350 ) ) ( not ( = ?auto_348347 ?auto_348348 ) ) ( not ( = ?auto_348347 ?auto_348349 ) ) ( not ( = ?auto_348347 ?auto_348350 ) ) ( not ( = ?auto_348348 ?auto_348349 ) ) ( not ( = ?auto_348348 ?auto_348350 ) ) ( not ( = ?auto_348349 ?auto_348350 ) ) ( ON ?auto_348348 ?auto_348349 ) ( ON ?auto_348347 ?auto_348348 ) ( ON ?auto_348346 ?auto_348347 ) ( ON ?auto_348345 ?auto_348346 ) ( CLEAR ?auto_348343 ) ( ON ?auto_348344 ?auto_348345 ) ( CLEAR ?auto_348344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_348343 ?auto_348344 )
      ( MAKE-7PILE ?auto_348343 ?auto_348344 ?auto_348345 ?auto_348346 ?auto_348347 ?auto_348348 ?auto_348349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348358 - BLOCK
      ?auto_348359 - BLOCK
      ?auto_348360 - BLOCK
      ?auto_348361 - BLOCK
      ?auto_348362 - BLOCK
      ?auto_348363 - BLOCK
      ?auto_348364 - BLOCK
    )
    :vars
    (
      ?auto_348365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348364 ?auto_348365 ) ( not ( = ?auto_348358 ?auto_348359 ) ) ( not ( = ?auto_348358 ?auto_348360 ) ) ( not ( = ?auto_348358 ?auto_348361 ) ) ( not ( = ?auto_348358 ?auto_348362 ) ) ( not ( = ?auto_348358 ?auto_348363 ) ) ( not ( = ?auto_348358 ?auto_348364 ) ) ( not ( = ?auto_348358 ?auto_348365 ) ) ( not ( = ?auto_348359 ?auto_348360 ) ) ( not ( = ?auto_348359 ?auto_348361 ) ) ( not ( = ?auto_348359 ?auto_348362 ) ) ( not ( = ?auto_348359 ?auto_348363 ) ) ( not ( = ?auto_348359 ?auto_348364 ) ) ( not ( = ?auto_348359 ?auto_348365 ) ) ( not ( = ?auto_348360 ?auto_348361 ) ) ( not ( = ?auto_348360 ?auto_348362 ) ) ( not ( = ?auto_348360 ?auto_348363 ) ) ( not ( = ?auto_348360 ?auto_348364 ) ) ( not ( = ?auto_348360 ?auto_348365 ) ) ( not ( = ?auto_348361 ?auto_348362 ) ) ( not ( = ?auto_348361 ?auto_348363 ) ) ( not ( = ?auto_348361 ?auto_348364 ) ) ( not ( = ?auto_348361 ?auto_348365 ) ) ( not ( = ?auto_348362 ?auto_348363 ) ) ( not ( = ?auto_348362 ?auto_348364 ) ) ( not ( = ?auto_348362 ?auto_348365 ) ) ( not ( = ?auto_348363 ?auto_348364 ) ) ( not ( = ?auto_348363 ?auto_348365 ) ) ( not ( = ?auto_348364 ?auto_348365 ) ) ( ON ?auto_348363 ?auto_348364 ) ( ON ?auto_348362 ?auto_348363 ) ( ON ?auto_348361 ?auto_348362 ) ( ON ?auto_348360 ?auto_348361 ) ( ON ?auto_348359 ?auto_348360 ) ( ON ?auto_348358 ?auto_348359 ) ( CLEAR ?auto_348358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_348358 )
      ( MAKE-7PILE ?auto_348358 ?auto_348359 ?auto_348360 ?auto_348361 ?auto_348362 ?auto_348363 ?auto_348364 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_348373 - BLOCK
      ?auto_348374 - BLOCK
      ?auto_348375 - BLOCK
      ?auto_348376 - BLOCK
      ?auto_348377 - BLOCK
      ?auto_348378 - BLOCK
      ?auto_348379 - BLOCK
    )
    :vars
    (
      ?auto_348380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348379 ?auto_348380 ) ( not ( = ?auto_348373 ?auto_348374 ) ) ( not ( = ?auto_348373 ?auto_348375 ) ) ( not ( = ?auto_348373 ?auto_348376 ) ) ( not ( = ?auto_348373 ?auto_348377 ) ) ( not ( = ?auto_348373 ?auto_348378 ) ) ( not ( = ?auto_348373 ?auto_348379 ) ) ( not ( = ?auto_348373 ?auto_348380 ) ) ( not ( = ?auto_348374 ?auto_348375 ) ) ( not ( = ?auto_348374 ?auto_348376 ) ) ( not ( = ?auto_348374 ?auto_348377 ) ) ( not ( = ?auto_348374 ?auto_348378 ) ) ( not ( = ?auto_348374 ?auto_348379 ) ) ( not ( = ?auto_348374 ?auto_348380 ) ) ( not ( = ?auto_348375 ?auto_348376 ) ) ( not ( = ?auto_348375 ?auto_348377 ) ) ( not ( = ?auto_348375 ?auto_348378 ) ) ( not ( = ?auto_348375 ?auto_348379 ) ) ( not ( = ?auto_348375 ?auto_348380 ) ) ( not ( = ?auto_348376 ?auto_348377 ) ) ( not ( = ?auto_348376 ?auto_348378 ) ) ( not ( = ?auto_348376 ?auto_348379 ) ) ( not ( = ?auto_348376 ?auto_348380 ) ) ( not ( = ?auto_348377 ?auto_348378 ) ) ( not ( = ?auto_348377 ?auto_348379 ) ) ( not ( = ?auto_348377 ?auto_348380 ) ) ( not ( = ?auto_348378 ?auto_348379 ) ) ( not ( = ?auto_348378 ?auto_348380 ) ) ( not ( = ?auto_348379 ?auto_348380 ) ) ( ON ?auto_348378 ?auto_348379 ) ( ON ?auto_348377 ?auto_348378 ) ( ON ?auto_348376 ?auto_348377 ) ( ON ?auto_348375 ?auto_348376 ) ( ON ?auto_348374 ?auto_348375 ) ( ON ?auto_348373 ?auto_348374 ) ( CLEAR ?auto_348373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_348373 )
      ( MAKE-7PILE ?auto_348373 ?auto_348374 ?auto_348375 ?auto_348376 ?auto_348377 ?auto_348378 ?auto_348379 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348389 - BLOCK
      ?auto_348390 - BLOCK
      ?auto_348391 - BLOCK
      ?auto_348392 - BLOCK
      ?auto_348393 - BLOCK
      ?auto_348394 - BLOCK
      ?auto_348395 - BLOCK
      ?auto_348396 - BLOCK
    )
    :vars
    (
      ?auto_348397 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_348395 ) ( ON ?auto_348396 ?auto_348397 ) ( CLEAR ?auto_348396 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_348389 ) ( ON ?auto_348390 ?auto_348389 ) ( ON ?auto_348391 ?auto_348390 ) ( ON ?auto_348392 ?auto_348391 ) ( ON ?auto_348393 ?auto_348392 ) ( ON ?auto_348394 ?auto_348393 ) ( ON ?auto_348395 ?auto_348394 ) ( not ( = ?auto_348389 ?auto_348390 ) ) ( not ( = ?auto_348389 ?auto_348391 ) ) ( not ( = ?auto_348389 ?auto_348392 ) ) ( not ( = ?auto_348389 ?auto_348393 ) ) ( not ( = ?auto_348389 ?auto_348394 ) ) ( not ( = ?auto_348389 ?auto_348395 ) ) ( not ( = ?auto_348389 ?auto_348396 ) ) ( not ( = ?auto_348389 ?auto_348397 ) ) ( not ( = ?auto_348390 ?auto_348391 ) ) ( not ( = ?auto_348390 ?auto_348392 ) ) ( not ( = ?auto_348390 ?auto_348393 ) ) ( not ( = ?auto_348390 ?auto_348394 ) ) ( not ( = ?auto_348390 ?auto_348395 ) ) ( not ( = ?auto_348390 ?auto_348396 ) ) ( not ( = ?auto_348390 ?auto_348397 ) ) ( not ( = ?auto_348391 ?auto_348392 ) ) ( not ( = ?auto_348391 ?auto_348393 ) ) ( not ( = ?auto_348391 ?auto_348394 ) ) ( not ( = ?auto_348391 ?auto_348395 ) ) ( not ( = ?auto_348391 ?auto_348396 ) ) ( not ( = ?auto_348391 ?auto_348397 ) ) ( not ( = ?auto_348392 ?auto_348393 ) ) ( not ( = ?auto_348392 ?auto_348394 ) ) ( not ( = ?auto_348392 ?auto_348395 ) ) ( not ( = ?auto_348392 ?auto_348396 ) ) ( not ( = ?auto_348392 ?auto_348397 ) ) ( not ( = ?auto_348393 ?auto_348394 ) ) ( not ( = ?auto_348393 ?auto_348395 ) ) ( not ( = ?auto_348393 ?auto_348396 ) ) ( not ( = ?auto_348393 ?auto_348397 ) ) ( not ( = ?auto_348394 ?auto_348395 ) ) ( not ( = ?auto_348394 ?auto_348396 ) ) ( not ( = ?auto_348394 ?auto_348397 ) ) ( not ( = ?auto_348395 ?auto_348396 ) ) ( not ( = ?auto_348395 ?auto_348397 ) ) ( not ( = ?auto_348396 ?auto_348397 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_348396 ?auto_348397 )
      ( !STACK ?auto_348396 ?auto_348395 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348406 - BLOCK
      ?auto_348407 - BLOCK
      ?auto_348408 - BLOCK
      ?auto_348409 - BLOCK
      ?auto_348410 - BLOCK
      ?auto_348411 - BLOCK
      ?auto_348412 - BLOCK
      ?auto_348413 - BLOCK
    )
    :vars
    (
      ?auto_348414 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_348412 ) ( ON ?auto_348413 ?auto_348414 ) ( CLEAR ?auto_348413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_348406 ) ( ON ?auto_348407 ?auto_348406 ) ( ON ?auto_348408 ?auto_348407 ) ( ON ?auto_348409 ?auto_348408 ) ( ON ?auto_348410 ?auto_348409 ) ( ON ?auto_348411 ?auto_348410 ) ( ON ?auto_348412 ?auto_348411 ) ( not ( = ?auto_348406 ?auto_348407 ) ) ( not ( = ?auto_348406 ?auto_348408 ) ) ( not ( = ?auto_348406 ?auto_348409 ) ) ( not ( = ?auto_348406 ?auto_348410 ) ) ( not ( = ?auto_348406 ?auto_348411 ) ) ( not ( = ?auto_348406 ?auto_348412 ) ) ( not ( = ?auto_348406 ?auto_348413 ) ) ( not ( = ?auto_348406 ?auto_348414 ) ) ( not ( = ?auto_348407 ?auto_348408 ) ) ( not ( = ?auto_348407 ?auto_348409 ) ) ( not ( = ?auto_348407 ?auto_348410 ) ) ( not ( = ?auto_348407 ?auto_348411 ) ) ( not ( = ?auto_348407 ?auto_348412 ) ) ( not ( = ?auto_348407 ?auto_348413 ) ) ( not ( = ?auto_348407 ?auto_348414 ) ) ( not ( = ?auto_348408 ?auto_348409 ) ) ( not ( = ?auto_348408 ?auto_348410 ) ) ( not ( = ?auto_348408 ?auto_348411 ) ) ( not ( = ?auto_348408 ?auto_348412 ) ) ( not ( = ?auto_348408 ?auto_348413 ) ) ( not ( = ?auto_348408 ?auto_348414 ) ) ( not ( = ?auto_348409 ?auto_348410 ) ) ( not ( = ?auto_348409 ?auto_348411 ) ) ( not ( = ?auto_348409 ?auto_348412 ) ) ( not ( = ?auto_348409 ?auto_348413 ) ) ( not ( = ?auto_348409 ?auto_348414 ) ) ( not ( = ?auto_348410 ?auto_348411 ) ) ( not ( = ?auto_348410 ?auto_348412 ) ) ( not ( = ?auto_348410 ?auto_348413 ) ) ( not ( = ?auto_348410 ?auto_348414 ) ) ( not ( = ?auto_348411 ?auto_348412 ) ) ( not ( = ?auto_348411 ?auto_348413 ) ) ( not ( = ?auto_348411 ?auto_348414 ) ) ( not ( = ?auto_348412 ?auto_348413 ) ) ( not ( = ?auto_348412 ?auto_348414 ) ) ( not ( = ?auto_348413 ?auto_348414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_348413 ?auto_348414 )
      ( !STACK ?auto_348413 ?auto_348412 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348423 - BLOCK
      ?auto_348424 - BLOCK
      ?auto_348425 - BLOCK
      ?auto_348426 - BLOCK
      ?auto_348427 - BLOCK
      ?auto_348428 - BLOCK
      ?auto_348429 - BLOCK
      ?auto_348430 - BLOCK
    )
    :vars
    (
      ?auto_348431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348430 ?auto_348431 ) ( ON-TABLE ?auto_348423 ) ( ON ?auto_348424 ?auto_348423 ) ( ON ?auto_348425 ?auto_348424 ) ( ON ?auto_348426 ?auto_348425 ) ( ON ?auto_348427 ?auto_348426 ) ( ON ?auto_348428 ?auto_348427 ) ( not ( = ?auto_348423 ?auto_348424 ) ) ( not ( = ?auto_348423 ?auto_348425 ) ) ( not ( = ?auto_348423 ?auto_348426 ) ) ( not ( = ?auto_348423 ?auto_348427 ) ) ( not ( = ?auto_348423 ?auto_348428 ) ) ( not ( = ?auto_348423 ?auto_348429 ) ) ( not ( = ?auto_348423 ?auto_348430 ) ) ( not ( = ?auto_348423 ?auto_348431 ) ) ( not ( = ?auto_348424 ?auto_348425 ) ) ( not ( = ?auto_348424 ?auto_348426 ) ) ( not ( = ?auto_348424 ?auto_348427 ) ) ( not ( = ?auto_348424 ?auto_348428 ) ) ( not ( = ?auto_348424 ?auto_348429 ) ) ( not ( = ?auto_348424 ?auto_348430 ) ) ( not ( = ?auto_348424 ?auto_348431 ) ) ( not ( = ?auto_348425 ?auto_348426 ) ) ( not ( = ?auto_348425 ?auto_348427 ) ) ( not ( = ?auto_348425 ?auto_348428 ) ) ( not ( = ?auto_348425 ?auto_348429 ) ) ( not ( = ?auto_348425 ?auto_348430 ) ) ( not ( = ?auto_348425 ?auto_348431 ) ) ( not ( = ?auto_348426 ?auto_348427 ) ) ( not ( = ?auto_348426 ?auto_348428 ) ) ( not ( = ?auto_348426 ?auto_348429 ) ) ( not ( = ?auto_348426 ?auto_348430 ) ) ( not ( = ?auto_348426 ?auto_348431 ) ) ( not ( = ?auto_348427 ?auto_348428 ) ) ( not ( = ?auto_348427 ?auto_348429 ) ) ( not ( = ?auto_348427 ?auto_348430 ) ) ( not ( = ?auto_348427 ?auto_348431 ) ) ( not ( = ?auto_348428 ?auto_348429 ) ) ( not ( = ?auto_348428 ?auto_348430 ) ) ( not ( = ?auto_348428 ?auto_348431 ) ) ( not ( = ?auto_348429 ?auto_348430 ) ) ( not ( = ?auto_348429 ?auto_348431 ) ) ( not ( = ?auto_348430 ?auto_348431 ) ) ( CLEAR ?auto_348428 ) ( ON ?auto_348429 ?auto_348430 ) ( CLEAR ?auto_348429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_348423 ?auto_348424 ?auto_348425 ?auto_348426 ?auto_348427 ?auto_348428 ?auto_348429 )
      ( MAKE-8PILE ?auto_348423 ?auto_348424 ?auto_348425 ?auto_348426 ?auto_348427 ?auto_348428 ?auto_348429 ?auto_348430 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348440 - BLOCK
      ?auto_348441 - BLOCK
      ?auto_348442 - BLOCK
      ?auto_348443 - BLOCK
      ?auto_348444 - BLOCK
      ?auto_348445 - BLOCK
      ?auto_348446 - BLOCK
      ?auto_348447 - BLOCK
    )
    :vars
    (
      ?auto_348448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348447 ?auto_348448 ) ( ON-TABLE ?auto_348440 ) ( ON ?auto_348441 ?auto_348440 ) ( ON ?auto_348442 ?auto_348441 ) ( ON ?auto_348443 ?auto_348442 ) ( ON ?auto_348444 ?auto_348443 ) ( ON ?auto_348445 ?auto_348444 ) ( not ( = ?auto_348440 ?auto_348441 ) ) ( not ( = ?auto_348440 ?auto_348442 ) ) ( not ( = ?auto_348440 ?auto_348443 ) ) ( not ( = ?auto_348440 ?auto_348444 ) ) ( not ( = ?auto_348440 ?auto_348445 ) ) ( not ( = ?auto_348440 ?auto_348446 ) ) ( not ( = ?auto_348440 ?auto_348447 ) ) ( not ( = ?auto_348440 ?auto_348448 ) ) ( not ( = ?auto_348441 ?auto_348442 ) ) ( not ( = ?auto_348441 ?auto_348443 ) ) ( not ( = ?auto_348441 ?auto_348444 ) ) ( not ( = ?auto_348441 ?auto_348445 ) ) ( not ( = ?auto_348441 ?auto_348446 ) ) ( not ( = ?auto_348441 ?auto_348447 ) ) ( not ( = ?auto_348441 ?auto_348448 ) ) ( not ( = ?auto_348442 ?auto_348443 ) ) ( not ( = ?auto_348442 ?auto_348444 ) ) ( not ( = ?auto_348442 ?auto_348445 ) ) ( not ( = ?auto_348442 ?auto_348446 ) ) ( not ( = ?auto_348442 ?auto_348447 ) ) ( not ( = ?auto_348442 ?auto_348448 ) ) ( not ( = ?auto_348443 ?auto_348444 ) ) ( not ( = ?auto_348443 ?auto_348445 ) ) ( not ( = ?auto_348443 ?auto_348446 ) ) ( not ( = ?auto_348443 ?auto_348447 ) ) ( not ( = ?auto_348443 ?auto_348448 ) ) ( not ( = ?auto_348444 ?auto_348445 ) ) ( not ( = ?auto_348444 ?auto_348446 ) ) ( not ( = ?auto_348444 ?auto_348447 ) ) ( not ( = ?auto_348444 ?auto_348448 ) ) ( not ( = ?auto_348445 ?auto_348446 ) ) ( not ( = ?auto_348445 ?auto_348447 ) ) ( not ( = ?auto_348445 ?auto_348448 ) ) ( not ( = ?auto_348446 ?auto_348447 ) ) ( not ( = ?auto_348446 ?auto_348448 ) ) ( not ( = ?auto_348447 ?auto_348448 ) ) ( CLEAR ?auto_348445 ) ( ON ?auto_348446 ?auto_348447 ) ( CLEAR ?auto_348446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_348440 ?auto_348441 ?auto_348442 ?auto_348443 ?auto_348444 ?auto_348445 ?auto_348446 )
      ( MAKE-8PILE ?auto_348440 ?auto_348441 ?auto_348442 ?auto_348443 ?auto_348444 ?auto_348445 ?auto_348446 ?auto_348447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348457 - BLOCK
      ?auto_348458 - BLOCK
      ?auto_348459 - BLOCK
      ?auto_348460 - BLOCK
      ?auto_348461 - BLOCK
      ?auto_348462 - BLOCK
      ?auto_348463 - BLOCK
      ?auto_348464 - BLOCK
    )
    :vars
    (
      ?auto_348465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348464 ?auto_348465 ) ( ON-TABLE ?auto_348457 ) ( ON ?auto_348458 ?auto_348457 ) ( ON ?auto_348459 ?auto_348458 ) ( ON ?auto_348460 ?auto_348459 ) ( ON ?auto_348461 ?auto_348460 ) ( not ( = ?auto_348457 ?auto_348458 ) ) ( not ( = ?auto_348457 ?auto_348459 ) ) ( not ( = ?auto_348457 ?auto_348460 ) ) ( not ( = ?auto_348457 ?auto_348461 ) ) ( not ( = ?auto_348457 ?auto_348462 ) ) ( not ( = ?auto_348457 ?auto_348463 ) ) ( not ( = ?auto_348457 ?auto_348464 ) ) ( not ( = ?auto_348457 ?auto_348465 ) ) ( not ( = ?auto_348458 ?auto_348459 ) ) ( not ( = ?auto_348458 ?auto_348460 ) ) ( not ( = ?auto_348458 ?auto_348461 ) ) ( not ( = ?auto_348458 ?auto_348462 ) ) ( not ( = ?auto_348458 ?auto_348463 ) ) ( not ( = ?auto_348458 ?auto_348464 ) ) ( not ( = ?auto_348458 ?auto_348465 ) ) ( not ( = ?auto_348459 ?auto_348460 ) ) ( not ( = ?auto_348459 ?auto_348461 ) ) ( not ( = ?auto_348459 ?auto_348462 ) ) ( not ( = ?auto_348459 ?auto_348463 ) ) ( not ( = ?auto_348459 ?auto_348464 ) ) ( not ( = ?auto_348459 ?auto_348465 ) ) ( not ( = ?auto_348460 ?auto_348461 ) ) ( not ( = ?auto_348460 ?auto_348462 ) ) ( not ( = ?auto_348460 ?auto_348463 ) ) ( not ( = ?auto_348460 ?auto_348464 ) ) ( not ( = ?auto_348460 ?auto_348465 ) ) ( not ( = ?auto_348461 ?auto_348462 ) ) ( not ( = ?auto_348461 ?auto_348463 ) ) ( not ( = ?auto_348461 ?auto_348464 ) ) ( not ( = ?auto_348461 ?auto_348465 ) ) ( not ( = ?auto_348462 ?auto_348463 ) ) ( not ( = ?auto_348462 ?auto_348464 ) ) ( not ( = ?auto_348462 ?auto_348465 ) ) ( not ( = ?auto_348463 ?auto_348464 ) ) ( not ( = ?auto_348463 ?auto_348465 ) ) ( not ( = ?auto_348464 ?auto_348465 ) ) ( ON ?auto_348463 ?auto_348464 ) ( CLEAR ?auto_348461 ) ( ON ?auto_348462 ?auto_348463 ) ( CLEAR ?auto_348462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_348457 ?auto_348458 ?auto_348459 ?auto_348460 ?auto_348461 ?auto_348462 )
      ( MAKE-8PILE ?auto_348457 ?auto_348458 ?auto_348459 ?auto_348460 ?auto_348461 ?auto_348462 ?auto_348463 ?auto_348464 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348474 - BLOCK
      ?auto_348475 - BLOCK
      ?auto_348476 - BLOCK
      ?auto_348477 - BLOCK
      ?auto_348478 - BLOCK
      ?auto_348479 - BLOCK
      ?auto_348480 - BLOCK
      ?auto_348481 - BLOCK
    )
    :vars
    (
      ?auto_348482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348481 ?auto_348482 ) ( ON-TABLE ?auto_348474 ) ( ON ?auto_348475 ?auto_348474 ) ( ON ?auto_348476 ?auto_348475 ) ( ON ?auto_348477 ?auto_348476 ) ( ON ?auto_348478 ?auto_348477 ) ( not ( = ?auto_348474 ?auto_348475 ) ) ( not ( = ?auto_348474 ?auto_348476 ) ) ( not ( = ?auto_348474 ?auto_348477 ) ) ( not ( = ?auto_348474 ?auto_348478 ) ) ( not ( = ?auto_348474 ?auto_348479 ) ) ( not ( = ?auto_348474 ?auto_348480 ) ) ( not ( = ?auto_348474 ?auto_348481 ) ) ( not ( = ?auto_348474 ?auto_348482 ) ) ( not ( = ?auto_348475 ?auto_348476 ) ) ( not ( = ?auto_348475 ?auto_348477 ) ) ( not ( = ?auto_348475 ?auto_348478 ) ) ( not ( = ?auto_348475 ?auto_348479 ) ) ( not ( = ?auto_348475 ?auto_348480 ) ) ( not ( = ?auto_348475 ?auto_348481 ) ) ( not ( = ?auto_348475 ?auto_348482 ) ) ( not ( = ?auto_348476 ?auto_348477 ) ) ( not ( = ?auto_348476 ?auto_348478 ) ) ( not ( = ?auto_348476 ?auto_348479 ) ) ( not ( = ?auto_348476 ?auto_348480 ) ) ( not ( = ?auto_348476 ?auto_348481 ) ) ( not ( = ?auto_348476 ?auto_348482 ) ) ( not ( = ?auto_348477 ?auto_348478 ) ) ( not ( = ?auto_348477 ?auto_348479 ) ) ( not ( = ?auto_348477 ?auto_348480 ) ) ( not ( = ?auto_348477 ?auto_348481 ) ) ( not ( = ?auto_348477 ?auto_348482 ) ) ( not ( = ?auto_348478 ?auto_348479 ) ) ( not ( = ?auto_348478 ?auto_348480 ) ) ( not ( = ?auto_348478 ?auto_348481 ) ) ( not ( = ?auto_348478 ?auto_348482 ) ) ( not ( = ?auto_348479 ?auto_348480 ) ) ( not ( = ?auto_348479 ?auto_348481 ) ) ( not ( = ?auto_348479 ?auto_348482 ) ) ( not ( = ?auto_348480 ?auto_348481 ) ) ( not ( = ?auto_348480 ?auto_348482 ) ) ( not ( = ?auto_348481 ?auto_348482 ) ) ( ON ?auto_348480 ?auto_348481 ) ( CLEAR ?auto_348478 ) ( ON ?auto_348479 ?auto_348480 ) ( CLEAR ?auto_348479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_348474 ?auto_348475 ?auto_348476 ?auto_348477 ?auto_348478 ?auto_348479 )
      ( MAKE-8PILE ?auto_348474 ?auto_348475 ?auto_348476 ?auto_348477 ?auto_348478 ?auto_348479 ?auto_348480 ?auto_348481 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348491 - BLOCK
      ?auto_348492 - BLOCK
      ?auto_348493 - BLOCK
      ?auto_348494 - BLOCK
      ?auto_348495 - BLOCK
      ?auto_348496 - BLOCK
      ?auto_348497 - BLOCK
      ?auto_348498 - BLOCK
    )
    :vars
    (
      ?auto_348499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348498 ?auto_348499 ) ( ON-TABLE ?auto_348491 ) ( ON ?auto_348492 ?auto_348491 ) ( ON ?auto_348493 ?auto_348492 ) ( ON ?auto_348494 ?auto_348493 ) ( not ( = ?auto_348491 ?auto_348492 ) ) ( not ( = ?auto_348491 ?auto_348493 ) ) ( not ( = ?auto_348491 ?auto_348494 ) ) ( not ( = ?auto_348491 ?auto_348495 ) ) ( not ( = ?auto_348491 ?auto_348496 ) ) ( not ( = ?auto_348491 ?auto_348497 ) ) ( not ( = ?auto_348491 ?auto_348498 ) ) ( not ( = ?auto_348491 ?auto_348499 ) ) ( not ( = ?auto_348492 ?auto_348493 ) ) ( not ( = ?auto_348492 ?auto_348494 ) ) ( not ( = ?auto_348492 ?auto_348495 ) ) ( not ( = ?auto_348492 ?auto_348496 ) ) ( not ( = ?auto_348492 ?auto_348497 ) ) ( not ( = ?auto_348492 ?auto_348498 ) ) ( not ( = ?auto_348492 ?auto_348499 ) ) ( not ( = ?auto_348493 ?auto_348494 ) ) ( not ( = ?auto_348493 ?auto_348495 ) ) ( not ( = ?auto_348493 ?auto_348496 ) ) ( not ( = ?auto_348493 ?auto_348497 ) ) ( not ( = ?auto_348493 ?auto_348498 ) ) ( not ( = ?auto_348493 ?auto_348499 ) ) ( not ( = ?auto_348494 ?auto_348495 ) ) ( not ( = ?auto_348494 ?auto_348496 ) ) ( not ( = ?auto_348494 ?auto_348497 ) ) ( not ( = ?auto_348494 ?auto_348498 ) ) ( not ( = ?auto_348494 ?auto_348499 ) ) ( not ( = ?auto_348495 ?auto_348496 ) ) ( not ( = ?auto_348495 ?auto_348497 ) ) ( not ( = ?auto_348495 ?auto_348498 ) ) ( not ( = ?auto_348495 ?auto_348499 ) ) ( not ( = ?auto_348496 ?auto_348497 ) ) ( not ( = ?auto_348496 ?auto_348498 ) ) ( not ( = ?auto_348496 ?auto_348499 ) ) ( not ( = ?auto_348497 ?auto_348498 ) ) ( not ( = ?auto_348497 ?auto_348499 ) ) ( not ( = ?auto_348498 ?auto_348499 ) ) ( ON ?auto_348497 ?auto_348498 ) ( ON ?auto_348496 ?auto_348497 ) ( CLEAR ?auto_348494 ) ( ON ?auto_348495 ?auto_348496 ) ( CLEAR ?auto_348495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_348491 ?auto_348492 ?auto_348493 ?auto_348494 ?auto_348495 )
      ( MAKE-8PILE ?auto_348491 ?auto_348492 ?auto_348493 ?auto_348494 ?auto_348495 ?auto_348496 ?auto_348497 ?auto_348498 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348508 - BLOCK
      ?auto_348509 - BLOCK
      ?auto_348510 - BLOCK
      ?auto_348511 - BLOCK
      ?auto_348512 - BLOCK
      ?auto_348513 - BLOCK
      ?auto_348514 - BLOCK
      ?auto_348515 - BLOCK
    )
    :vars
    (
      ?auto_348516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348515 ?auto_348516 ) ( ON-TABLE ?auto_348508 ) ( ON ?auto_348509 ?auto_348508 ) ( ON ?auto_348510 ?auto_348509 ) ( ON ?auto_348511 ?auto_348510 ) ( not ( = ?auto_348508 ?auto_348509 ) ) ( not ( = ?auto_348508 ?auto_348510 ) ) ( not ( = ?auto_348508 ?auto_348511 ) ) ( not ( = ?auto_348508 ?auto_348512 ) ) ( not ( = ?auto_348508 ?auto_348513 ) ) ( not ( = ?auto_348508 ?auto_348514 ) ) ( not ( = ?auto_348508 ?auto_348515 ) ) ( not ( = ?auto_348508 ?auto_348516 ) ) ( not ( = ?auto_348509 ?auto_348510 ) ) ( not ( = ?auto_348509 ?auto_348511 ) ) ( not ( = ?auto_348509 ?auto_348512 ) ) ( not ( = ?auto_348509 ?auto_348513 ) ) ( not ( = ?auto_348509 ?auto_348514 ) ) ( not ( = ?auto_348509 ?auto_348515 ) ) ( not ( = ?auto_348509 ?auto_348516 ) ) ( not ( = ?auto_348510 ?auto_348511 ) ) ( not ( = ?auto_348510 ?auto_348512 ) ) ( not ( = ?auto_348510 ?auto_348513 ) ) ( not ( = ?auto_348510 ?auto_348514 ) ) ( not ( = ?auto_348510 ?auto_348515 ) ) ( not ( = ?auto_348510 ?auto_348516 ) ) ( not ( = ?auto_348511 ?auto_348512 ) ) ( not ( = ?auto_348511 ?auto_348513 ) ) ( not ( = ?auto_348511 ?auto_348514 ) ) ( not ( = ?auto_348511 ?auto_348515 ) ) ( not ( = ?auto_348511 ?auto_348516 ) ) ( not ( = ?auto_348512 ?auto_348513 ) ) ( not ( = ?auto_348512 ?auto_348514 ) ) ( not ( = ?auto_348512 ?auto_348515 ) ) ( not ( = ?auto_348512 ?auto_348516 ) ) ( not ( = ?auto_348513 ?auto_348514 ) ) ( not ( = ?auto_348513 ?auto_348515 ) ) ( not ( = ?auto_348513 ?auto_348516 ) ) ( not ( = ?auto_348514 ?auto_348515 ) ) ( not ( = ?auto_348514 ?auto_348516 ) ) ( not ( = ?auto_348515 ?auto_348516 ) ) ( ON ?auto_348514 ?auto_348515 ) ( ON ?auto_348513 ?auto_348514 ) ( CLEAR ?auto_348511 ) ( ON ?auto_348512 ?auto_348513 ) ( CLEAR ?auto_348512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_348508 ?auto_348509 ?auto_348510 ?auto_348511 ?auto_348512 )
      ( MAKE-8PILE ?auto_348508 ?auto_348509 ?auto_348510 ?auto_348511 ?auto_348512 ?auto_348513 ?auto_348514 ?auto_348515 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348525 - BLOCK
      ?auto_348526 - BLOCK
      ?auto_348527 - BLOCK
      ?auto_348528 - BLOCK
      ?auto_348529 - BLOCK
      ?auto_348530 - BLOCK
      ?auto_348531 - BLOCK
      ?auto_348532 - BLOCK
    )
    :vars
    (
      ?auto_348533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348532 ?auto_348533 ) ( ON-TABLE ?auto_348525 ) ( ON ?auto_348526 ?auto_348525 ) ( ON ?auto_348527 ?auto_348526 ) ( not ( = ?auto_348525 ?auto_348526 ) ) ( not ( = ?auto_348525 ?auto_348527 ) ) ( not ( = ?auto_348525 ?auto_348528 ) ) ( not ( = ?auto_348525 ?auto_348529 ) ) ( not ( = ?auto_348525 ?auto_348530 ) ) ( not ( = ?auto_348525 ?auto_348531 ) ) ( not ( = ?auto_348525 ?auto_348532 ) ) ( not ( = ?auto_348525 ?auto_348533 ) ) ( not ( = ?auto_348526 ?auto_348527 ) ) ( not ( = ?auto_348526 ?auto_348528 ) ) ( not ( = ?auto_348526 ?auto_348529 ) ) ( not ( = ?auto_348526 ?auto_348530 ) ) ( not ( = ?auto_348526 ?auto_348531 ) ) ( not ( = ?auto_348526 ?auto_348532 ) ) ( not ( = ?auto_348526 ?auto_348533 ) ) ( not ( = ?auto_348527 ?auto_348528 ) ) ( not ( = ?auto_348527 ?auto_348529 ) ) ( not ( = ?auto_348527 ?auto_348530 ) ) ( not ( = ?auto_348527 ?auto_348531 ) ) ( not ( = ?auto_348527 ?auto_348532 ) ) ( not ( = ?auto_348527 ?auto_348533 ) ) ( not ( = ?auto_348528 ?auto_348529 ) ) ( not ( = ?auto_348528 ?auto_348530 ) ) ( not ( = ?auto_348528 ?auto_348531 ) ) ( not ( = ?auto_348528 ?auto_348532 ) ) ( not ( = ?auto_348528 ?auto_348533 ) ) ( not ( = ?auto_348529 ?auto_348530 ) ) ( not ( = ?auto_348529 ?auto_348531 ) ) ( not ( = ?auto_348529 ?auto_348532 ) ) ( not ( = ?auto_348529 ?auto_348533 ) ) ( not ( = ?auto_348530 ?auto_348531 ) ) ( not ( = ?auto_348530 ?auto_348532 ) ) ( not ( = ?auto_348530 ?auto_348533 ) ) ( not ( = ?auto_348531 ?auto_348532 ) ) ( not ( = ?auto_348531 ?auto_348533 ) ) ( not ( = ?auto_348532 ?auto_348533 ) ) ( ON ?auto_348531 ?auto_348532 ) ( ON ?auto_348530 ?auto_348531 ) ( ON ?auto_348529 ?auto_348530 ) ( CLEAR ?auto_348527 ) ( ON ?auto_348528 ?auto_348529 ) ( CLEAR ?auto_348528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_348525 ?auto_348526 ?auto_348527 ?auto_348528 )
      ( MAKE-8PILE ?auto_348525 ?auto_348526 ?auto_348527 ?auto_348528 ?auto_348529 ?auto_348530 ?auto_348531 ?auto_348532 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348542 - BLOCK
      ?auto_348543 - BLOCK
      ?auto_348544 - BLOCK
      ?auto_348545 - BLOCK
      ?auto_348546 - BLOCK
      ?auto_348547 - BLOCK
      ?auto_348548 - BLOCK
      ?auto_348549 - BLOCK
    )
    :vars
    (
      ?auto_348550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348549 ?auto_348550 ) ( ON-TABLE ?auto_348542 ) ( ON ?auto_348543 ?auto_348542 ) ( ON ?auto_348544 ?auto_348543 ) ( not ( = ?auto_348542 ?auto_348543 ) ) ( not ( = ?auto_348542 ?auto_348544 ) ) ( not ( = ?auto_348542 ?auto_348545 ) ) ( not ( = ?auto_348542 ?auto_348546 ) ) ( not ( = ?auto_348542 ?auto_348547 ) ) ( not ( = ?auto_348542 ?auto_348548 ) ) ( not ( = ?auto_348542 ?auto_348549 ) ) ( not ( = ?auto_348542 ?auto_348550 ) ) ( not ( = ?auto_348543 ?auto_348544 ) ) ( not ( = ?auto_348543 ?auto_348545 ) ) ( not ( = ?auto_348543 ?auto_348546 ) ) ( not ( = ?auto_348543 ?auto_348547 ) ) ( not ( = ?auto_348543 ?auto_348548 ) ) ( not ( = ?auto_348543 ?auto_348549 ) ) ( not ( = ?auto_348543 ?auto_348550 ) ) ( not ( = ?auto_348544 ?auto_348545 ) ) ( not ( = ?auto_348544 ?auto_348546 ) ) ( not ( = ?auto_348544 ?auto_348547 ) ) ( not ( = ?auto_348544 ?auto_348548 ) ) ( not ( = ?auto_348544 ?auto_348549 ) ) ( not ( = ?auto_348544 ?auto_348550 ) ) ( not ( = ?auto_348545 ?auto_348546 ) ) ( not ( = ?auto_348545 ?auto_348547 ) ) ( not ( = ?auto_348545 ?auto_348548 ) ) ( not ( = ?auto_348545 ?auto_348549 ) ) ( not ( = ?auto_348545 ?auto_348550 ) ) ( not ( = ?auto_348546 ?auto_348547 ) ) ( not ( = ?auto_348546 ?auto_348548 ) ) ( not ( = ?auto_348546 ?auto_348549 ) ) ( not ( = ?auto_348546 ?auto_348550 ) ) ( not ( = ?auto_348547 ?auto_348548 ) ) ( not ( = ?auto_348547 ?auto_348549 ) ) ( not ( = ?auto_348547 ?auto_348550 ) ) ( not ( = ?auto_348548 ?auto_348549 ) ) ( not ( = ?auto_348548 ?auto_348550 ) ) ( not ( = ?auto_348549 ?auto_348550 ) ) ( ON ?auto_348548 ?auto_348549 ) ( ON ?auto_348547 ?auto_348548 ) ( ON ?auto_348546 ?auto_348547 ) ( CLEAR ?auto_348544 ) ( ON ?auto_348545 ?auto_348546 ) ( CLEAR ?auto_348545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_348542 ?auto_348543 ?auto_348544 ?auto_348545 )
      ( MAKE-8PILE ?auto_348542 ?auto_348543 ?auto_348544 ?auto_348545 ?auto_348546 ?auto_348547 ?auto_348548 ?auto_348549 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348559 - BLOCK
      ?auto_348560 - BLOCK
      ?auto_348561 - BLOCK
      ?auto_348562 - BLOCK
      ?auto_348563 - BLOCK
      ?auto_348564 - BLOCK
      ?auto_348565 - BLOCK
      ?auto_348566 - BLOCK
    )
    :vars
    (
      ?auto_348567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348566 ?auto_348567 ) ( ON-TABLE ?auto_348559 ) ( ON ?auto_348560 ?auto_348559 ) ( not ( = ?auto_348559 ?auto_348560 ) ) ( not ( = ?auto_348559 ?auto_348561 ) ) ( not ( = ?auto_348559 ?auto_348562 ) ) ( not ( = ?auto_348559 ?auto_348563 ) ) ( not ( = ?auto_348559 ?auto_348564 ) ) ( not ( = ?auto_348559 ?auto_348565 ) ) ( not ( = ?auto_348559 ?auto_348566 ) ) ( not ( = ?auto_348559 ?auto_348567 ) ) ( not ( = ?auto_348560 ?auto_348561 ) ) ( not ( = ?auto_348560 ?auto_348562 ) ) ( not ( = ?auto_348560 ?auto_348563 ) ) ( not ( = ?auto_348560 ?auto_348564 ) ) ( not ( = ?auto_348560 ?auto_348565 ) ) ( not ( = ?auto_348560 ?auto_348566 ) ) ( not ( = ?auto_348560 ?auto_348567 ) ) ( not ( = ?auto_348561 ?auto_348562 ) ) ( not ( = ?auto_348561 ?auto_348563 ) ) ( not ( = ?auto_348561 ?auto_348564 ) ) ( not ( = ?auto_348561 ?auto_348565 ) ) ( not ( = ?auto_348561 ?auto_348566 ) ) ( not ( = ?auto_348561 ?auto_348567 ) ) ( not ( = ?auto_348562 ?auto_348563 ) ) ( not ( = ?auto_348562 ?auto_348564 ) ) ( not ( = ?auto_348562 ?auto_348565 ) ) ( not ( = ?auto_348562 ?auto_348566 ) ) ( not ( = ?auto_348562 ?auto_348567 ) ) ( not ( = ?auto_348563 ?auto_348564 ) ) ( not ( = ?auto_348563 ?auto_348565 ) ) ( not ( = ?auto_348563 ?auto_348566 ) ) ( not ( = ?auto_348563 ?auto_348567 ) ) ( not ( = ?auto_348564 ?auto_348565 ) ) ( not ( = ?auto_348564 ?auto_348566 ) ) ( not ( = ?auto_348564 ?auto_348567 ) ) ( not ( = ?auto_348565 ?auto_348566 ) ) ( not ( = ?auto_348565 ?auto_348567 ) ) ( not ( = ?auto_348566 ?auto_348567 ) ) ( ON ?auto_348565 ?auto_348566 ) ( ON ?auto_348564 ?auto_348565 ) ( ON ?auto_348563 ?auto_348564 ) ( ON ?auto_348562 ?auto_348563 ) ( CLEAR ?auto_348560 ) ( ON ?auto_348561 ?auto_348562 ) ( CLEAR ?auto_348561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_348559 ?auto_348560 ?auto_348561 )
      ( MAKE-8PILE ?auto_348559 ?auto_348560 ?auto_348561 ?auto_348562 ?auto_348563 ?auto_348564 ?auto_348565 ?auto_348566 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348576 - BLOCK
      ?auto_348577 - BLOCK
      ?auto_348578 - BLOCK
      ?auto_348579 - BLOCK
      ?auto_348580 - BLOCK
      ?auto_348581 - BLOCK
      ?auto_348582 - BLOCK
      ?auto_348583 - BLOCK
    )
    :vars
    (
      ?auto_348584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348583 ?auto_348584 ) ( ON-TABLE ?auto_348576 ) ( ON ?auto_348577 ?auto_348576 ) ( not ( = ?auto_348576 ?auto_348577 ) ) ( not ( = ?auto_348576 ?auto_348578 ) ) ( not ( = ?auto_348576 ?auto_348579 ) ) ( not ( = ?auto_348576 ?auto_348580 ) ) ( not ( = ?auto_348576 ?auto_348581 ) ) ( not ( = ?auto_348576 ?auto_348582 ) ) ( not ( = ?auto_348576 ?auto_348583 ) ) ( not ( = ?auto_348576 ?auto_348584 ) ) ( not ( = ?auto_348577 ?auto_348578 ) ) ( not ( = ?auto_348577 ?auto_348579 ) ) ( not ( = ?auto_348577 ?auto_348580 ) ) ( not ( = ?auto_348577 ?auto_348581 ) ) ( not ( = ?auto_348577 ?auto_348582 ) ) ( not ( = ?auto_348577 ?auto_348583 ) ) ( not ( = ?auto_348577 ?auto_348584 ) ) ( not ( = ?auto_348578 ?auto_348579 ) ) ( not ( = ?auto_348578 ?auto_348580 ) ) ( not ( = ?auto_348578 ?auto_348581 ) ) ( not ( = ?auto_348578 ?auto_348582 ) ) ( not ( = ?auto_348578 ?auto_348583 ) ) ( not ( = ?auto_348578 ?auto_348584 ) ) ( not ( = ?auto_348579 ?auto_348580 ) ) ( not ( = ?auto_348579 ?auto_348581 ) ) ( not ( = ?auto_348579 ?auto_348582 ) ) ( not ( = ?auto_348579 ?auto_348583 ) ) ( not ( = ?auto_348579 ?auto_348584 ) ) ( not ( = ?auto_348580 ?auto_348581 ) ) ( not ( = ?auto_348580 ?auto_348582 ) ) ( not ( = ?auto_348580 ?auto_348583 ) ) ( not ( = ?auto_348580 ?auto_348584 ) ) ( not ( = ?auto_348581 ?auto_348582 ) ) ( not ( = ?auto_348581 ?auto_348583 ) ) ( not ( = ?auto_348581 ?auto_348584 ) ) ( not ( = ?auto_348582 ?auto_348583 ) ) ( not ( = ?auto_348582 ?auto_348584 ) ) ( not ( = ?auto_348583 ?auto_348584 ) ) ( ON ?auto_348582 ?auto_348583 ) ( ON ?auto_348581 ?auto_348582 ) ( ON ?auto_348580 ?auto_348581 ) ( ON ?auto_348579 ?auto_348580 ) ( CLEAR ?auto_348577 ) ( ON ?auto_348578 ?auto_348579 ) ( CLEAR ?auto_348578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_348576 ?auto_348577 ?auto_348578 )
      ( MAKE-8PILE ?auto_348576 ?auto_348577 ?auto_348578 ?auto_348579 ?auto_348580 ?auto_348581 ?auto_348582 ?auto_348583 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348593 - BLOCK
      ?auto_348594 - BLOCK
      ?auto_348595 - BLOCK
      ?auto_348596 - BLOCK
      ?auto_348597 - BLOCK
      ?auto_348598 - BLOCK
      ?auto_348599 - BLOCK
      ?auto_348600 - BLOCK
    )
    :vars
    (
      ?auto_348601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348600 ?auto_348601 ) ( ON-TABLE ?auto_348593 ) ( not ( = ?auto_348593 ?auto_348594 ) ) ( not ( = ?auto_348593 ?auto_348595 ) ) ( not ( = ?auto_348593 ?auto_348596 ) ) ( not ( = ?auto_348593 ?auto_348597 ) ) ( not ( = ?auto_348593 ?auto_348598 ) ) ( not ( = ?auto_348593 ?auto_348599 ) ) ( not ( = ?auto_348593 ?auto_348600 ) ) ( not ( = ?auto_348593 ?auto_348601 ) ) ( not ( = ?auto_348594 ?auto_348595 ) ) ( not ( = ?auto_348594 ?auto_348596 ) ) ( not ( = ?auto_348594 ?auto_348597 ) ) ( not ( = ?auto_348594 ?auto_348598 ) ) ( not ( = ?auto_348594 ?auto_348599 ) ) ( not ( = ?auto_348594 ?auto_348600 ) ) ( not ( = ?auto_348594 ?auto_348601 ) ) ( not ( = ?auto_348595 ?auto_348596 ) ) ( not ( = ?auto_348595 ?auto_348597 ) ) ( not ( = ?auto_348595 ?auto_348598 ) ) ( not ( = ?auto_348595 ?auto_348599 ) ) ( not ( = ?auto_348595 ?auto_348600 ) ) ( not ( = ?auto_348595 ?auto_348601 ) ) ( not ( = ?auto_348596 ?auto_348597 ) ) ( not ( = ?auto_348596 ?auto_348598 ) ) ( not ( = ?auto_348596 ?auto_348599 ) ) ( not ( = ?auto_348596 ?auto_348600 ) ) ( not ( = ?auto_348596 ?auto_348601 ) ) ( not ( = ?auto_348597 ?auto_348598 ) ) ( not ( = ?auto_348597 ?auto_348599 ) ) ( not ( = ?auto_348597 ?auto_348600 ) ) ( not ( = ?auto_348597 ?auto_348601 ) ) ( not ( = ?auto_348598 ?auto_348599 ) ) ( not ( = ?auto_348598 ?auto_348600 ) ) ( not ( = ?auto_348598 ?auto_348601 ) ) ( not ( = ?auto_348599 ?auto_348600 ) ) ( not ( = ?auto_348599 ?auto_348601 ) ) ( not ( = ?auto_348600 ?auto_348601 ) ) ( ON ?auto_348599 ?auto_348600 ) ( ON ?auto_348598 ?auto_348599 ) ( ON ?auto_348597 ?auto_348598 ) ( ON ?auto_348596 ?auto_348597 ) ( ON ?auto_348595 ?auto_348596 ) ( CLEAR ?auto_348593 ) ( ON ?auto_348594 ?auto_348595 ) ( CLEAR ?auto_348594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_348593 ?auto_348594 )
      ( MAKE-8PILE ?auto_348593 ?auto_348594 ?auto_348595 ?auto_348596 ?auto_348597 ?auto_348598 ?auto_348599 ?auto_348600 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348610 - BLOCK
      ?auto_348611 - BLOCK
      ?auto_348612 - BLOCK
      ?auto_348613 - BLOCK
      ?auto_348614 - BLOCK
      ?auto_348615 - BLOCK
      ?auto_348616 - BLOCK
      ?auto_348617 - BLOCK
    )
    :vars
    (
      ?auto_348618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348617 ?auto_348618 ) ( ON-TABLE ?auto_348610 ) ( not ( = ?auto_348610 ?auto_348611 ) ) ( not ( = ?auto_348610 ?auto_348612 ) ) ( not ( = ?auto_348610 ?auto_348613 ) ) ( not ( = ?auto_348610 ?auto_348614 ) ) ( not ( = ?auto_348610 ?auto_348615 ) ) ( not ( = ?auto_348610 ?auto_348616 ) ) ( not ( = ?auto_348610 ?auto_348617 ) ) ( not ( = ?auto_348610 ?auto_348618 ) ) ( not ( = ?auto_348611 ?auto_348612 ) ) ( not ( = ?auto_348611 ?auto_348613 ) ) ( not ( = ?auto_348611 ?auto_348614 ) ) ( not ( = ?auto_348611 ?auto_348615 ) ) ( not ( = ?auto_348611 ?auto_348616 ) ) ( not ( = ?auto_348611 ?auto_348617 ) ) ( not ( = ?auto_348611 ?auto_348618 ) ) ( not ( = ?auto_348612 ?auto_348613 ) ) ( not ( = ?auto_348612 ?auto_348614 ) ) ( not ( = ?auto_348612 ?auto_348615 ) ) ( not ( = ?auto_348612 ?auto_348616 ) ) ( not ( = ?auto_348612 ?auto_348617 ) ) ( not ( = ?auto_348612 ?auto_348618 ) ) ( not ( = ?auto_348613 ?auto_348614 ) ) ( not ( = ?auto_348613 ?auto_348615 ) ) ( not ( = ?auto_348613 ?auto_348616 ) ) ( not ( = ?auto_348613 ?auto_348617 ) ) ( not ( = ?auto_348613 ?auto_348618 ) ) ( not ( = ?auto_348614 ?auto_348615 ) ) ( not ( = ?auto_348614 ?auto_348616 ) ) ( not ( = ?auto_348614 ?auto_348617 ) ) ( not ( = ?auto_348614 ?auto_348618 ) ) ( not ( = ?auto_348615 ?auto_348616 ) ) ( not ( = ?auto_348615 ?auto_348617 ) ) ( not ( = ?auto_348615 ?auto_348618 ) ) ( not ( = ?auto_348616 ?auto_348617 ) ) ( not ( = ?auto_348616 ?auto_348618 ) ) ( not ( = ?auto_348617 ?auto_348618 ) ) ( ON ?auto_348616 ?auto_348617 ) ( ON ?auto_348615 ?auto_348616 ) ( ON ?auto_348614 ?auto_348615 ) ( ON ?auto_348613 ?auto_348614 ) ( ON ?auto_348612 ?auto_348613 ) ( CLEAR ?auto_348610 ) ( ON ?auto_348611 ?auto_348612 ) ( CLEAR ?auto_348611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_348610 ?auto_348611 )
      ( MAKE-8PILE ?auto_348610 ?auto_348611 ?auto_348612 ?auto_348613 ?auto_348614 ?auto_348615 ?auto_348616 ?auto_348617 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348627 - BLOCK
      ?auto_348628 - BLOCK
      ?auto_348629 - BLOCK
      ?auto_348630 - BLOCK
      ?auto_348631 - BLOCK
      ?auto_348632 - BLOCK
      ?auto_348633 - BLOCK
      ?auto_348634 - BLOCK
    )
    :vars
    (
      ?auto_348635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348634 ?auto_348635 ) ( not ( = ?auto_348627 ?auto_348628 ) ) ( not ( = ?auto_348627 ?auto_348629 ) ) ( not ( = ?auto_348627 ?auto_348630 ) ) ( not ( = ?auto_348627 ?auto_348631 ) ) ( not ( = ?auto_348627 ?auto_348632 ) ) ( not ( = ?auto_348627 ?auto_348633 ) ) ( not ( = ?auto_348627 ?auto_348634 ) ) ( not ( = ?auto_348627 ?auto_348635 ) ) ( not ( = ?auto_348628 ?auto_348629 ) ) ( not ( = ?auto_348628 ?auto_348630 ) ) ( not ( = ?auto_348628 ?auto_348631 ) ) ( not ( = ?auto_348628 ?auto_348632 ) ) ( not ( = ?auto_348628 ?auto_348633 ) ) ( not ( = ?auto_348628 ?auto_348634 ) ) ( not ( = ?auto_348628 ?auto_348635 ) ) ( not ( = ?auto_348629 ?auto_348630 ) ) ( not ( = ?auto_348629 ?auto_348631 ) ) ( not ( = ?auto_348629 ?auto_348632 ) ) ( not ( = ?auto_348629 ?auto_348633 ) ) ( not ( = ?auto_348629 ?auto_348634 ) ) ( not ( = ?auto_348629 ?auto_348635 ) ) ( not ( = ?auto_348630 ?auto_348631 ) ) ( not ( = ?auto_348630 ?auto_348632 ) ) ( not ( = ?auto_348630 ?auto_348633 ) ) ( not ( = ?auto_348630 ?auto_348634 ) ) ( not ( = ?auto_348630 ?auto_348635 ) ) ( not ( = ?auto_348631 ?auto_348632 ) ) ( not ( = ?auto_348631 ?auto_348633 ) ) ( not ( = ?auto_348631 ?auto_348634 ) ) ( not ( = ?auto_348631 ?auto_348635 ) ) ( not ( = ?auto_348632 ?auto_348633 ) ) ( not ( = ?auto_348632 ?auto_348634 ) ) ( not ( = ?auto_348632 ?auto_348635 ) ) ( not ( = ?auto_348633 ?auto_348634 ) ) ( not ( = ?auto_348633 ?auto_348635 ) ) ( not ( = ?auto_348634 ?auto_348635 ) ) ( ON ?auto_348633 ?auto_348634 ) ( ON ?auto_348632 ?auto_348633 ) ( ON ?auto_348631 ?auto_348632 ) ( ON ?auto_348630 ?auto_348631 ) ( ON ?auto_348629 ?auto_348630 ) ( ON ?auto_348628 ?auto_348629 ) ( ON ?auto_348627 ?auto_348628 ) ( CLEAR ?auto_348627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_348627 )
      ( MAKE-8PILE ?auto_348627 ?auto_348628 ?auto_348629 ?auto_348630 ?auto_348631 ?auto_348632 ?auto_348633 ?auto_348634 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_348644 - BLOCK
      ?auto_348645 - BLOCK
      ?auto_348646 - BLOCK
      ?auto_348647 - BLOCK
      ?auto_348648 - BLOCK
      ?auto_348649 - BLOCK
      ?auto_348650 - BLOCK
      ?auto_348651 - BLOCK
    )
    :vars
    (
      ?auto_348652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348651 ?auto_348652 ) ( not ( = ?auto_348644 ?auto_348645 ) ) ( not ( = ?auto_348644 ?auto_348646 ) ) ( not ( = ?auto_348644 ?auto_348647 ) ) ( not ( = ?auto_348644 ?auto_348648 ) ) ( not ( = ?auto_348644 ?auto_348649 ) ) ( not ( = ?auto_348644 ?auto_348650 ) ) ( not ( = ?auto_348644 ?auto_348651 ) ) ( not ( = ?auto_348644 ?auto_348652 ) ) ( not ( = ?auto_348645 ?auto_348646 ) ) ( not ( = ?auto_348645 ?auto_348647 ) ) ( not ( = ?auto_348645 ?auto_348648 ) ) ( not ( = ?auto_348645 ?auto_348649 ) ) ( not ( = ?auto_348645 ?auto_348650 ) ) ( not ( = ?auto_348645 ?auto_348651 ) ) ( not ( = ?auto_348645 ?auto_348652 ) ) ( not ( = ?auto_348646 ?auto_348647 ) ) ( not ( = ?auto_348646 ?auto_348648 ) ) ( not ( = ?auto_348646 ?auto_348649 ) ) ( not ( = ?auto_348646 ?auto_348650 ) ) ( not ( = ?auto_348646 ?auto_348651 ) ) ( not ( = ?auto_348646 ?auto_348652 ) ) ( not ( = ?auto_348647 ?auto_348648 ) ) ( not ( = ?auto_348647 ?auto_348649 ) ) ( not ( = ?auto_348647 ?auto_348650 ) ) ( not ( = ?auto_348647 ?auto_348651 ) ) ( not ( = ?auto_348647 ?auto_348652 ) ) ( not ( = ?auto_348648 ?auto_348649 ) ) ( not ( = ?auto_348648 ?auto_348650 ) ) ( not ( = ?auto_348648 ?auto_348651 ) ) ( not ( = ?auto_348648 ?auto_348652 ) ) ( not ( = ?auto_348649 ?auto_348650 ) ) ( not ( = ?auto_348649 ?auto_348651 ) ) ( not ( = ?auto_348649 ?auto_348652 ) ) ( not ( = ?auto_348650 ?auto_348651 ) ) ( not ( = ?auto_348650 ?auto_348652 ) ) ( not ( = ?auto_348651 ?auto_348652 ) ) ( ON ?auto_348650 ?auto_348651 ) ( ON ?auto_348649 ?auto_348650 ) ( ON ?auto_348648 ?auto_348649 ) ( ON ?auto_348647 ?auto_348648 ) ( ON ?auto_348646 ?auto_348647 ) ( ON ?auto_348645 ?auto_348646 ) ( ON ?auto_348644 ?auto_348645 ) ( CLEAR ?auto_348644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_348644 )
      ( MAKE-8PILE ?auto_348644 ?auto_348645 ?auto_348646 ?auto_348647 ?auto_348648 ?auto_348649 ?auto_348650 ?auto_348651 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348662 - BLOCK
      ?auto_348663 - BLOCK
      ?auto_348664 - BLOCK
      ?auto_348665 - BLOCK
      ?auto_348666 - BLOCK
      ?auto_348667 - BLOCK
      ?auto_348668 - BLOCK
      ?auto_348669 - BLOCK
      ?auto_348670 - BLOCK
    )
    :vars
    (
      ?auto_348671 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_348669 ) ( ON ?auto_348670 ?auto_348671 ) ( CLEAR ?auto_348670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_348662 ) ( ON ?auto_348663 ?auto_348662 ) ( ON ?auto_348664 ?auto_348663 ) ( ON ?auto_348665 ?auto_348664 ) ( ON ?auto_348666 ?auto_348665 ) ( ON ?auto_348667 ?auto_348666 ) ( ON ?auto_348668 ?auto_348667 ) ( ON ?auto_348669 ?auto_348668 ) ( not ( = ?auto_348662 ?auto_348663 ) ) ( not ( = ?auto_348662 ?auto_348664 ) ) ( not ( = ?auto_348662 ?auto_348665 ) ) ( not ( = ?auto_348662 ?auto_348666 ) ) ( not ( = ?auto_348662 ?auto_348667 ) ) ( not ( = ?auto_348662 ?auto_348668 ) ) ( not ( = ?auto_348662 ?auto_348669 ) ) ( not ( = ?auto_348662 ?auto_348670 ) ) ( not ( = ?auto_348662 ?auto_348671 ) ) ( not ( = ?auto_348663 ?auto_348664 ) ) ( not ( = ?auto_348663 ?auto_348665 ) ) ( not ( = ?auto_348663 ?auto_348666 ) ) ( not ( = ?auto_348663 ?auto_348667 ) ) ( not ( = ?auto_348663 ?auto_348668 ) ) ( not ( = ?auto_348663 ?auto_348669 ) ) ( not ( = ?auto_348663 ?auto_348670 ) ) ( not ( = ?auto_348663 ?auto_348671 ) ) ( not ( = ?auto_348664 ?auto_348665 ) ) ( not ( = ?auto_348664 ?auto_348666 ) ) ( not ( = ?auto_348664 ?auto_348667 ) ) ( not ( = ?auto_348664 ?auto_348668 ) ) ( not ( = ?auto_348664 ?auto_348669 ) ) ( not ( = ?auto_348664 ?auto_348670 ) ) ( not ( = ?auto_348664 ?auto_348671 ) ) ( not ( = ?auto_348665 ?auto_348666 ) ) ( not ( = ?auto_348665 ?auto_348667 ) ) ( not ( = ?auto_348665 ?auto_348668 ) ) ( not ( = ?auto_348665 ?auto_348669 ) ) ( not ( = ?auto_348665 ?auto_348670 ) ) ( not ( = ?auto_348665 ?auto_348671 ) ) ( not ( = ?auto_348666 ?auto_348667 ) ) ( not ( = ?auto_348666 ?auto_348668 ) ) ( not ( = ?auto_348666 ?auto_348669 ) ) ( not ( = ?auto_348666 ?auto_348670 ) ) ( not ( = ?auto_348666 ?auto_348671 ) ) ( not ( = ?auto_348667 ?auto_348668 ) ) ( not ( = ?auto_348667 ?auto_348669 ) ) ( not ( = ?auto_348667 ?auto_348670 ) ) ( not ( = ?auto_348667 ?auto_348671 ) ) ( not ( = ?auto_348668 ?auto_348669 ) ) ( not ( = ?auto_348668 ?auto_348670 ) ) ( not ( = ?auto_348668 ?auto_348671 ) ) ( not ( = ?auto_348669 ?auto_348670 ) ) ( not ( = ?auto_348669 ?auto_348671 ) ) ( not ( = ?auto_348670 ?auto_348671 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_348670 ?auto_348671 )
      ( !STACK ?auto_348670 ?auto_348669 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348681 - BLOCK
      ?auto_348682 - BLOCK
      ?auto_348683 - BLOCK
      ?auto_348684 - BLOCK
      ?auto_348685 - BLOCK
      ?auto_348686 - BLOCK
      ?auto_348687 - BLOCK
      ?auto_348688 - BLOCK
      ?auto_348689 - BLOCK
    )
    :vars
    (
      ?auto_348690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_348688 ) ( ON ?auto_348689 ?auto_348690 ) ( CLEAR ?auto_348689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_348681 ) ( ON ?auto_348682 ?auto_348681 ) ( ON ?auto_348683 ?auto_348682 ) ( ON ?auto_348684 ?auto_348683 ) ( ON ?auto_348685 ?auto_348684 ) ( ON ?auto_348686 ?auto_348685 ) ( ON ?auto_348687 ?auto_348686 ) ( ON ?auto_348688 ?auto_348687 ) ( not ( = ?auto_348681 ?auto_348682 ) ) ( not ( = ?auto_348681 ?auto_348683 ) ) ( not ( = ?auto_348681 ?auto_348684 ) ) ( not ( = ?auto_348681 ?auto_348685 ) ) ( not ( = ?auto_348681 ?auto_348686 ) ) ( not ( = ?auto_348681 ?auto_348687 ) ) ( not ( = ?auto_348681 ?auto_348688 ) ) ( not ( = ?auto_348681 ?auto_348689 ) ) ( not ( = ?auto_348681 ?auto_348690 ) ) ( not ( = ?auto_348682 ?auto_348683 ) ) ( not ( = ?auto_348682 ?auto_348684 ) ) ( not ( = ?auto_348682 ?auto_348685 ) ) ( not ( = ?auto_348682 ?auto_348686 ) ) ( not ( = ?auto_348682 ?auto_348687 ) ) ( not ( = ?auto_348682 ?auto_348688 ) ) ( not ( = ?auto_348682 ?auto_348689 ) ) ( not ( = ?auto_348682 ?auto_348690 ) ) ( not ( = ?auto_348683 ?auto_348684 ) ) ( not ( = ?auto_348683 ?auto_348685 ) ) ( not ( = ?auto_348683 ?auto_348686 ) ) ( not ( = ?auto_348683 ?auto_348687 ) ) ( not ( = ?auto_348683 ?auto_348688 ) ) ( not ( = ?auto_348683 ?auto_348689 ) ) ( not ( = ?auto_348683 ?auto_348690 ) ) ( not ( = ?auto_348684 ?auto_348685 ) ) ( not ( = ?auto_348684 ?auto_348686 ) ) ( not ( = ?auto_348684 ?auto_348687 ) ) ( not ( = ?auto_348684 ?auto_348688 ) ) ( not ( = ?auto_348684 ?auto_348689 ) ) ( not ( = ?auto_348684 ?auto_348690 ) ) ( not ( = ?auto_348685 ?auto_348686 ) ) ( not ( = ?auto_348685 ?auto_348687 ) ) ( not ( = ?auto_348685 ?auto_348688 ) ) ( not ( = ?auto_348685 ?auto_348689 ) ) ( not ( = ?auto_348685 ?auto_348690 ) ) ( not ( = ?auto_348686 ?auto_348687 ) ) ( not ( = ?auto_348686 ?auto_348688 ) ) ( not ( = ?auto_348686 ?auto_348689 ) ) ( not ( = ?auto_348686 ?auto_348690 ) ) ( not ( = ?auto_348687 ?auto_348688 ) ) ( not ( = ?auto_348687 ?auto_348689 ) ) ( not ( = ?auto_348687 ?auto_348690 ) ) ( not ( = ?auto_348688 ?auto_348689 ) ) ( not ( = ?auto_348688 ?auto_348690 ) ) ( not ( = ?auto_348689 ?auto_348690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_348689 ?auto_348690 )
      ( !STACK ?auto_348689 ?auto_348688 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348700 - BLOCK
      ?auto_348701 - BLOCK
      ?auto_348702 - BLOCK
      ?auto_348703 - BLOCK
      ?auto_348704 - BLOCK
      ?auto_348705 - BLOCK
      ?auto_348706 - BLOCK
      ?auto_348707 - BLOCK
      ?auto_348708 - BLOCK
    )
    :vars
    (
      ?auto_348709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348708 ?auto_348709 ) ( ON-TABLE ?auto_348700 ) ( ON ?auto_348701 ?auto_348700 ) ( ON ?auto_348702 ?auto_348701 ) ( ON ?auto_348703 ?auto_348702 ) ( ON ?auto_348704 ?auto_348703 ) ( ON ?auto_348705 ?auto_348704 ) ( ON ?auto_348706 ?auto_348705 ) ( not ( = ?auto_348700 ?auto_348701 ) ) ( not ( = ?auto_348700 ?auto_348702 ) ) ( not ( = ?auto_348700 ?auto_348703 ) ) ( not ( = ?auto_348700 ?auto_348704 ) ) ( not ( = ?auto_348700 ?auto_348705 ) ) ( not ( = ?auto_348700 ?auto_348706 ) ) ( not ( = ?auto_348700 ?auto_348707 ) ) ( not ( = ?auto_348700 ?auto_348708 ) ) ( not ( = ?auto_348700 ?auto_348709 ) ) ( not ( = ?auto_348701 ?auto_348702 ) ) ( not ( = ?auto_348701 ?auto_348703 ) ) ( not ( = ?auto_348701 ?auto_348704 ) ) ( not ( = ?auto_348701 ?auto_348705 ) ) ( not ( = ?auto_348701 ?auto_348706 ) ) ( not ( = ?auto_348701 ?auto_348707 ) ) ( not ( = ?auto_348701 ?auto_348708 ) ) ( not ( = ?auto_348701 ?auto_348709 ) ) ( not ( = ?auto_348702 ?auto_348703 ) ) ( not ( = ?auto_348702 ?auto_348704 ) ) ( not ( = ?auto_348702 ?auto_348705 ) ) ( not ( = ?auto_348702 ?auto_348706 ) ) ( not ( = ?auto_348702 ?auto_348707 ) ) ( not ( = ?auto_348702 ?auto_348708 ) ) ( not ( = ?auto_348702 ?auto_348709 ) ) ( not ( = ?auto_348703 ?auto_348704 ) ) ( not ( = ?auto_348703 ?auto_348705 ) ) ( not ( = ?auto_348703 ?auto_348706 ) ) ( not ( = ?auto_348703 ?auto_348707 ) ) ( not ( = ?auto_348703 ?auto_348708 ) ) ( not ( = ?auto_348703 ?auto_348709 ) ) ( not ( = ?auto_348704 ?auto_348705 ) ) ( not ( = ?auto_348704 ?auto_348706 ) ) ( not ( = ?auto_348704 ?auto_348707 ) ) ( not ( = ?auto_348704 ?auto_348708 ) ) ( not ( = ?auto_348704 ?auto_348709 ) ) ( not ( = ?auto_348705 ?auto_348706 ) ) ( not ( = ?auto_348705 ?auto_348707 ) ) ( not ( = ?auto_348705 ?auto_348708 ) ) ( not ( = ?auto_348705 ?auto_348709 ) ) ( not ( = ?auto_348706 ?auto_348707 ) ) ( not ( = ?auto_348706 ?auto_348708 ) ) ( not ( = ?auto_348706 ?auto_348709 ) ) ( not ( = ?auto_348707 ?auto_348708 ) ) ( not ( = ?auto_348707 ?auto_348709 ) ) ( not ( = ?auto_348708 ?auto_348709 ) ) ( CLEAR ?auto_348706 ) ( ON ?auto_348707 ?auto_348708 ) ( CLEAR ?auto_348707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_348700 ?auto_348701 ?auto_348702 ?auto_348703 ?auto_348704 ?auto_348705 ?auto_348706 ?auto_348707 )
      ( MAKE-9PILE ?auto_348700 ?auto_348701 ?auto_348702 ?auto_348703 ?auto_348704 ?auto_348705 ?auto_348706 ?auto_348707 ?auto_348708 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348719 - BLOCK
      ?auto_348720 - BLOCK
      ?auto_348721 - BLOCK
      ?auto_348722 - BLOCK
      ?auto_348723 - BLOCK
      ?auto_348724 - BLOCK
      ?auto_348725 - BLOCK
      ?auto_348726 - BLOCK
      ?auto_348727 - BLOCK
    )
    :vars
    (
      ?auto_348728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348727 ?auto_348728 ) ( ON-TABLE ?auto_348719 ) ( ON ?auto_348720 ?auto_348719 ) ( ON ?auto_348721 ?auto_348720 ) ( ON ?auto_348722 ?auto_348721 ) ( ON ?auto_348723 ?auto_348722 ) ( ON ?auto_348724 ?auto_348723 ) ( ON ?auto_348725 ?auto_348724 ) ( not ( = ?auto_348719 ?auto_348720 ) ) ( not ( = ?auto_348719 ?auto_348721 ) ) ( not ( = ?auto_348719 ?auto_348722 ) ) ( not ( = ?auto_348719 ?auto_348723 ) ) ( not ( = ?auto_348719 ?auto_348724 ) ) ( not ( = ?auto_348719 ?auto_348725 ) ) ( not ( = ?auto_348719 ?auto_348726 ) ) ( not ( = ?auto_348719 ?auto_348727 ) ) ( not ( = ?auto_348719 ?auto_348728 ) ) ( not ( = ?auto_348720 ?auto_348721 ) ) ( not ( = ?auto_348720 ?auto_348722 ) ) ( not ( = ?auto_348720 ?auto_348723 ) ) ( not ( = ?auto_348720 ?auto_348724 ) ) ( not ( = ?auto_348720 ?auto_348725 ) ) ( not ( = ?auto_348720 ?auto_348726 ) ) ( not ( = ?auto_348720 ?auto_348727 ) ) ( not ( = ?auto_348720 ?auto_348728 ) ) ( not ( = ?auto_348721 ?auto_348722 ) ) ( not ( = ?auto_348721 ?auto_348723 ) ) ( not ( = ?auto_348721 ?auto_348724 ) ) ( not ( = ?auto_348721 ?auto_348725 ) ) ( not ( = ?auto_348721 ?auto_348726 ) ) ( not ( = ?auto_348721 ?auto_348727 ) ) ( not ( = ?auto_348721 ?auto_348728 ) ) ( not ( = ?auto_348722 ?auto_348723 ) ) ( not ( = ?auto_348722 ?auto_348724 ) ) ( not ( = ?auto_348722 ?auto_348725 ) ) ( not ( = ?auto_348722 ?auto_348726 ) ) ( not ( = ?auto_348722 ?auto_348727 ) ) ( not ( = ?auto_348722 ?auto_348728 ) ) ( not ( = ?auto_348723 ?auto_348724 ) ) ( not ( = ?auto_348723 ?auto_348725 ) ) ( not ( = ?auto_348723 ?auto_348726 ) ) ( not ( = ?auto_348723 ?auto_348727 ) ) ( not ( = ?auto_348723 ?auto_348728 ) ) ( not ( = ?auto_348724 ?auto_348725 ) ) ( not ( = ?auto_348724 ?auto_348726 ) ) ( not ( = ?auto_348724 ?auto_348727 ) ) ( not ( = ?auto_348724 ?auto_348728 ) ) ( not ( = ?auto_348725 ?auto_348726 ) ) ( not ( = ?auto_348725 ?auto_348727 ) ) ( not ( = ?auto_348725 ?auto_348728 ) ) ( not ( = ?auto_348726 ?auto_348727 ) ) ( not ( = ?auto_348726 ?auto_348728 ) ) ( not ( = ?auto_348727 ?auto_348728 ) ) ( CLEAR ?auto_348725 ) ( ON ?auto_348726 ?auto_348727 ) ( CLEAR ?auto_348726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_348719 ?auto_348720 ?auto_348721 ?auto_348722 ?auto_348723 ?auto_348724 ?auto_348725 ?auto_348726 )
      ( MAKE-9PILE ?auto_348719 ?auto_348720 ?auto_348721 ?auto_348722 ?auto_348723 ?auto_348724 ?auto_348725 ?auto_348726 ?auto_348727 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348738 - BLOCK
      ?auto_348739 - BLOCK
      ?auto_348740 - BLOCK
      ?auto_348741 - BLOCK
      ?auto_348742 - BLOCK
      ?auto_348743 - BLOCK
      ?auto_348744 - BLOCK
      ?auto_348745 - BLOCK
      ?auto_348746 - BLOCK
    )
    :vars
    (
      ?auto_348747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348746 ?auto_348747 ) ( ON-TABLE ?auto_348738 ) ( ON ?auto_348739 ?auto_348738 ) ( ON ?auto_348740 ?auto_348739 ) ( ON ?auto_348741 ?auto_348740 ) ( ON ?auto_348742 ?auto_348741 ) ( ON ?auto_348743 ?auto_348742 ) ( not ( = ?auto_348738 ?auto_348739 ) ) ( not ( = ?auto_348738 ?auto_348740 ) ) ( not ( = ?auto_348738 ?auto_348741 ) ) ( not ( = ?auto_348738 ?auto_348742 ) ) ( not ( = ?auto_348738 ?auto_348743 ) ) ( not ( = ?auto_348738 ?auto_348744 ) ) ( not ( = ?auto_348738 ?auto_348745 ) ) ( not ( = ?auto_348738 ?auto_348746 ) ) ( not ( = ?auto_348738 ?auto_348747 ) ) ( not ( = ?auto_348739 ?auto_348740 ) ) ( not ( = ?auto_348739 ?auto_348741 ) ) ( not ( = ?auto_348739 ?auto_348742 ) ) ( not ( = ?auto_348739 ?auto_348743 ) ) ( not ( = ?auto_348739 ?auto_348744 ) ) ( not ( = ?auto_348739 ?auto_348745 ) ) ( not ( = ?auto_348739 ?auto_348746 ) ) ( not ( = ?auto_348739 ?auto_348747 ) ) ( not ( = ?auto_348740 ?auto_348741 ) ) ( not ( = ?auto_348740 ?auto_348742 ) ) ( not ( = ?auto_348740 ?auto_348743 ) ) ( not ( = ?auto_348740 ?auto_348744 ) ) ( not ( = ?auto_348740 ?auto_348745 ) ) ( not ( = ?auto_348740 ?auto_348746 ) ) ( not ( = ?auto_348740 ?auto_348747 ) ) ( not ( = ?auto_348741 ?auto_348742 ) ) ( not ( = ?auto_348741 ?auto_348743 ) ) ( not ( = ?auto_348741 ?auto_348744 ) ) ( not ( = ?auto_348741 ?auto_348745 ) ) ( not ( = ?auto_348741 ?auto_348746 ) ) ( not ( = ?auto_348741 ?auto_348747 ) ) ( not ( = ?auto_348742 ?auto_348743 ) ) ( not ( = ?auto_348742 ?auto_348744 ) ) ( not ( = ?auto_348742 ?auto_348745 ) ) ( not ( = ?auto_348742 ?auto_348746 ) ) ( not ( = ?auto_348742 ?auto_348747 ) ) ( not ( = ?auto_348743 ?auto_348744 ) ) ( not ( = ?auto_348743 ?auto_348745 ) ) ( not ( = ?auto_348743 ?auto_348746 ) ) ( not ( = ?auto_348743 ?auto_348747 ) ) ( not ( = ?auto_348744 ?auto_348745 ) ) ( not ( = ?auto_348744 ?auto_348746 ) ) ( not ( = ?auto_348744 ?auto_348747 ) ) ( not ( = ?auto_348745 ?auto_348746 ) ) ( not ( = ?auto_348745 ?auto_348747 ) ) ( not ( = ?auto_348746 ?auto_348747 ) ) ( ON ?auto_348745 ?auto_348746 ) ( CLEAR ?auto_348743 ) ( ON ?auto_348744 ?auto_348745 ) ( CLEAR ?auto_348744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_348738 ?auto_348739 ?auto_348740 ?auto_348741 ?auto_348742 ?auto_348743 ?auto_348744 )
      ( MAKE-9PILE ?auto_348738 ?auto_348739 ?auto_348740 ?auto_348741 ?auto_348742 ?auto_348743 ?auto_348744 ?auto_348745 ?auto_348746 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348757 - BLOCK
      ?auto_348758 - BLOCK
      ?auto_348759 - BLOCK
      ?auto_348760 - BLOCK
      ?auto_348761 - BLOCK
      ?auto_348762 - BLOCK
      ?auto_348763 - BLOCK
      ?auto_348764 - BLOCK
      ?auto_348765 - BLOCK
    )
    :vars
    (
      ?auto_348766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348765 ?auto_348766 ) ( ON-TABLE ?auto_348757 ) ( ON ?auto_348758 ?auto_348757 ) ( ON ?auto_348759 ?auto_348758 ) ( ON ?auto_348760 ?auto_348759 ) ( ON ?auto_348761 ?auto_348760 ) ( ON ?auto_348762 ?auto_348761 ) ( not ( = ?auto_348757 ?auto_348758 ) ) ( not ( = ?auto_348757 ?auto_348759 ) ) ( not ( = ?auto_348757 ?auto_348760 ) ) ( not ( = ?auto_348757 ?auto_348761 ) ) ( not ( = ?auto_348757 ?auto_348762 ) ) ( not ( = ?auto_348757 ?auto_348763 ) ) ( not ( = ?auto_348757 ?auto_348764 ) ) ( not ( = ?auto_348757 ?auto_348765 ) ) ( not ( = ?auto_348757 ?auto_348766 ) ) ( not ( = ?auto_348758 ?auto_348759 ) ) ( not ( = ?auto_348758 ?auto_348760 ) ) ( not ( = ?auto_348758 ?auto_348761 ) ) ( not ( = ?auto_348758 ?auto_348762 ) ) ( not ( = ?auto_348758 ?auto_348763 ) ) ( not ( = ?auto_348758 ?auto_348764 ) ) ( not ( = ?auto_348758 ?auto_348765 ) ) ( not ( = ?auto_348758 ?auto_348766 ) ) ( not ( = ?auto_348759 ?auto_348760 ) ) ( not ( = ?auto_348759 ?auto_348761 ) ) ( not ( = ?auto_348759 ?auto_348762 ) ) ( not ( = ?auto_348759 ?auto_348763 ) ) ( not ( = ?auto_348759 ?auto_348764 ) ) ( not ( = ?auto_348759 ?auto_348765 ) ) ( not ( = ?auto_348759 ?auto_348766 ) ) ( not ( = ?auto_348760 ?auto_348761 ) ) ( not ( = ?auto_348760 ?auto_348762 ) ) ( not ( = ?auto_348760 ?auto_348763 ) ) ( not ( = ?auto_348760 ?auto_348764 ) ) ( not ( = ?auto_348760 ?auto_348765 ) ) ( not ( = ?auto_348760 ?auto_348766 ) ) ( not ( = ?auto_348761 ?auto_348762 ) ) ( not ( = ?auto_348761 ?auto_348763 ) ) ( not ( = ?auto_348761 ?auto_348764 ) ) ( not ( = ?auto_348761 ?auto_348765 ) ) ( not ( = ?auto_348761 ?auto_348766 ) ) ( not ( = ?auto_348762 ?auto_348763 ) ) ( not ( = ?auto_348762 ?auto_348764 ) ) ( not ( = ?auto_348762 ?auto_348765 ) ) ( not ( = ?auto_348762 ?auto_348766 ) ) ( not ( = ?auto_348763 ?auto_348764 ) ) ( not ( = ?auto_348763 ?auto_348765 ) ) ( not ( = ?auto_348763 ?auto_348766 ) ) ( not ( = ?auto_348764 ?auto_348765 ) ) ( not ( = ?auto_348764 ?auto_348766 ) ) ( not ( = ?auto_348765 ?auto_348766 ) ) ( ON ?auto_348764 ?auto_348765 ) ( CLEAR ?auto_348762 ) ( ON ?auto_348763 ?auto_348764 ) ( CLEAR ?auto_348763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_348757 ?auto_348758 ?auto_348759 ?auto_348760 ?auto_348761 ?auto_348762 ?auto_348763 )
      ( MAKE-9PILE ?auto_348757 ?auto_348758 ?auto_348759 ?auto_348760 ?auto_348761 ?auto_348762 ?auto_348763 ?auto_348764 ?auto_348765 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348776 - BLOCK
      ?auto_348777 - BLOCK
      ?auto_348778 - BLOCK
      ?auto_348779 - BLOCK
      ?auto_348780 - BLOCK
      ?auto_348781 - BLOCK
      ?auto_348782 - BLOCK
      ?auto_348783 - BLOCK
      ?auto_348784 - BLOCK
    )
    :vars
    (
      ?auto_348785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348784 ?auto_348785 ) ( ON-TABLE ?auto_348776 ) ( ON ?auto_348777 ?auto_348776 ) ( ON ?auto_348778 ?auto_348777 ) ( ON ?auto_348779 ?auto_348778 ) ( ON ?auto_348780 ?auto_348779 ) ( not ( = ?auto_348776 ?auto_348777 ) ) ( not ( = ?auto_348776 ?auto_348778 ) ) ( not ( = ?auto_348776 ?auto_348779 ) ) ( not ( = ?auto_348776 ?auto_348780 ) ) ( not ( = ?auto_348776 ?auto_348781 ) ) ( not ( = ?auto_348776 ?auto_348782 ) ) ( not ( = ?auto_348776 ?auto_348783 ) ) ( not ( = ?auto_348776 ?auto_348784 ) ) ( not ( = ?auto_348776 ?auto_348785 ) ) ( not ( = ?auto_348777 ?auto_348778 ) ) ( not ( = ?auto_348777 ?auto_348779 ) ) ( not ( = ?auto_348777 ?auto_348780 ) ) ( not ( = ?auto_348777 ?auto_348781 ) ) ( not ( = ?auto_348777 ?auto_348782 ) ) ( not ( = ?auto_348777 ?auto_348783 ) ) ( not ( = ?auto_348777 ?auto_348784 ) ) ( not ( = ?auto_348777 ?auto_348785 ) ) ( not ( = ?auto_348778 ?auto_348779 ) ) ( not ( = ?auto_348778 ?auto_348780 ) ) ( not ( = ?auto_348778 ?auto_348781 ) ) ( not ( = ?auto_348778 ?auto_348782 ) ) ( not ( = ?auto_348778 ?auto_348783 ) ) ( not ( = ?auto_348778 ?auto_348784 ) ) ( not ( = ?auto_348778 ?auto_348785 ) ) ( not ( = ?auto_348779 ?auto_348780 ) ) ( not ( = ?auto_348779 ?auto_348781 ) ) ( not ( = ?auto_348779 ?auto_348782 ) ) ( not ( = ?auto_348779 ?auto_348783 ) ) ( not ( = ?auto_348779 ?auto_348784 ) ) ( not ( = ?auto_348779 ?auto_348785 ) ) ( not ( = ?auto_348780 ?auto_348781 ) ) ( not ( = ?auto_348780 ?auto_348782 ) ) ( not ( = ?auto_348780 ?auto_348783 ) ) ( not ( = ?auto_348780 ?auto_348784 ) ) ( not ( = ?auto_348780 ?auto_348785 ) ) ( not ( = ?auto_348781 ?auto_348782 ) ) ( not ( = ?auto_348781 ?auto_348783 ) ) ( not ( = ?auto_348781 ?auto_348784 ) ) ( not ( = ?auto_348781 ?auto_348785 ) ) ( not ( = ?auto_348782 ?auto_348783 ) ) ( not ( = ?auto_348782 ?auto_348784 ) ) ( not ( = ?auto_348782 ?auto_348785 ) ) ( not ( = ?auto_348783 ?auto_348784 ) ) ( not ( = ?auto_348783 ?auto_348785 ) ) ( not ( = ?auto_348784 ?auto_348785 ) ) ( ON ?auto_348783 ?auto_348784 ) ( ON ?auto_348782 ?auto_348783 ) ( CLEAR ?auto_348780 ) ( ON ?auto_348781 ?auto_348782 ) ( CLEAR ?auto_348781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_348776 ?auto_348777 ?auto_348778 ?auto_348779 ?auto_348780 ?auto_348781 )
      ( MAKE-9PILE ?auto_348776 ?auto_348777 ?auto_348778 ?auto_348779 ?auto_348780 ?auto_348781 ?auto_348782 ?auto_348783 ?auto_348784 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348795 - BLOCK
      ?auto_348796 - BLOCK
      ?auto_348797 - BLOCK
      ?auto_348798 - BLOCK
      ?auto_348799 - BLOCK
      ?auto_348800 - BLOCK
      ?auto_348801 - BLOCK
      ?auto_348802 - BLOCK
      ?auto_348803 - BLOCK
    )
    :vars
    (
      ?auto_348804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348803 ?auto_348804 ) ( ON-TABLE ?auto_348795 ) ( ON ?auto_348796 ?auto_348795 ) ( ON ?auto_348797 ?auto_348796 ) ( ON ?auto_348798 ?auto_348797 ) ( ON ?auto_348799 ?auto_348798 ) ( not ( = ?auto_348795 ?auto_348796 ) ) ( not ( = ?auto_348795 ?auto_348797 ) ) ( not ( = ?auto_348795 ?auto_348798 ) ) ( not ( = ?auto_348795 ?auto_348799 ) ) ( not ( = ?auto_348795 ?auto_348800 ) ) ( not ( = ?auto_348795 ?auto_348801 ) ) ( not ( = ?auto_348795 ?auto_348802 ) ) ( not ( = ?auto_348795 ?auto_348803 ) ) ( not ( = ?auto_348795 ?auto_348804 ) ) ( not ( = ?auto_348796 ?auto_348797 ) ) ( not ( = ?auto_348796 ?auto_348798 ) ) ( not ( = ?auto_348796 ?auto_348799 ) ) ( not ( = ?auto_348796 ?auto_348800 ) ) ( not ( = ?auto_348796 ?auto_348801 ) ) ( not ( = ?auto_348796 ?auto_348802 ) ) ( not ( = ?auto_348796 ?auto_348803 ) ) ( not ( = ?auto_348796 ?auto_348804 ) ) ( not ( = ?auto_348797 ?auto_348798 ) ) ( not ( = ?auto_348797 ?auto_348799 ) ) ( not ( = ?auto_348797 ?auto_348800 ) ) ( not ( = ?auto_348797 ?auto_348801 ) ) ( not ( = ?auto_348797 ?auto_348802 ) ) ( not ( = ?auto_348797 ?auto_348803 ) ) ( not ( = ?auto_348797 ?auto_348804 ) ) ( not ( = ?auto_348798 ?auto_348799 ) ) ( not ( = ?auto_348798 ?auto_348800 ) ) ( not ( = ?auto_348798 ?auto_348801 ) ) ( not ( = ?auto_348798 ?auto_348802 ) ) ( not ( = ?auto_348798 ?auto_348803 ) ) ( not ( = ?auto_348798 ?auto_348804 ) ) ( not ( = ?auto_348799 ?auto_348800 ) ) ( not ( = ?auto_348799 ?auto_348801 ) ) ( not ( = ?auto_348799 ?auto_348802 ) ) ( not ( = ?auto_348799 ?auto_348803 ) ) ( not ( = ?auto_348799 ?auto_348804 ) ) ( not ( = ?auto_348800 ?auto_348801 ) ) ( not ( = ?auto_348800 ?auto_348802 ) ) ( not ( = ?auto_348800 ?auto_348803 ) ) ( not ( = ?auto_348800 ?auto_348804 ) ) ( not ( = ?auto_348801 ?auto_348802 ) ) ( not ( = ?auto_348801 ?auto_348803 ) ) ( not ( = ?auto_348801 ?auto_348804 ) ) ( not ( = ?auto_348802 ?auto_348803 ) ) ( not ( = ?auto_348802 ?auto_348804 ) ) ( not ( = ?auto_348803 ?auto_348804 ) ) ( ON ?auto_348802 ?auto_348803 ) ( ON ?auto_348801 ?auto_348802 ) ( CLEAR ?auto_348799 ) ( ON ?auto_348800 ?auto_348801 ) ( CLEAR ?auto_348800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_348795 ?auto_348796 ?auto_348797 ?auto_348798 ?auto_348799 ?auto_348800 )
      ( MAKE-9PILE ?auto_348795 ?auto_348796 ?auto_348797 ?auto_348798 ?auto_348799 ?auto_348800 ?auto_348801 ?auto_348802 ?auto_348803 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348814 - BLOCK
      ?auto_348815 - BLOCK
      ?auto_348816 - BLOCK
      ?auto_348817 - BLOCK
      ?auto_348818 - BLOCK
      ?auto_348819 - BLOCK
      ?auto_348820 - BLOCK
      ?auto_348821 - BLOCK
      ?auto_348822 - BLOCK
    )
    :vars
    (
      ?auto_348823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348822 ?auto_348823 ) ( ON-TABLE ?auto_348814 ) ( ON ?auto_348815 ?auto_348814 ) ( ON ?auto_348816 ?auto_348815 ) ( ON ?auto_348817 ?auto_348816 ) ( not ( = ?auto_348814 ?auto_348815 ) ) ( not ( = ?auto_348814 ?auto_348816 ) ) ( not ( = ?auto_348814 ?auto_348817 ) ) ( not ( = ?auto_348814 ?auto_348818 ) ) ( not ( = ?auto_348814 ?auto_348819 ) ) ( not ( = ?auto_348814 ?auto_348820 ) ) ( not ( = ?auto_348814 ?auto_348821 ) ) ( not ( = ?auto_348814 ?auto_348822 ) ) ( not ( = ?auto_348814 ?auto_348823 ) ) ( not ( = ?auto_348815 ?auto_348816 ) ) ( not ( = ?auto_348815 ?auto_348817 ) ) ( not ( = ?auto_348815 ?auto_348818 ) ) ( not ( = ?auto_348815 ?auto_348819 ) ) ( not ( = ?auto_348815 ?auto_348820 ) ) ( not ( = ?auto_348815 ?auto_348821 ) ) ( not ( = ?auto_348815 ?auto_348822 ) ) ( not ( = ?auto_348815 ?auto_348823 ) ) ( not ( = ?auto_348816 ?auto_348817 ) ) ( not ( = ?auto_348816 ?auto_348818 ) ) ( not ( = ?auto_348816 ?auto_348819 ) ) ( not ( = ?auto_348816 ?auto_348820 ) ) ( not ( = ?auto_348816 ?auto_348821 ) ) ( not ( = ?auto_348816 ?auto_348822 ) ) ( not ( = ?auto_348816 ?auto_348823 ) ) ( not ( = ?auto_348817 ?auto_348818 ) ) ( not ( = ?auto_348817 ?auto_348819 ) ) ( not ( = ?auto_348817 ?auto_348820 ) ) ( not ( = ?auto_348817 ?auto_348821 ) ) ( not ( = ?auto_348817 ?auto_348822 ) ) ( not ( = ?auto_348817 ?auto_348823 ) ) ( not ( = ?auto_348818 ?auto_348819 ) ) ( not ( = ?auto_348818 ?auto_348820 ) ) ( not ( = ?auto_348818 ?auto_348821 ) ) ( not ( = ?auto_348818 ?auto_348822 ) ) ( not ( = ?auto_348818 ?auto_348823 ) ) ( not ( = ?auto_348819 ?auto_348820 ) ) ( not ( = ?auto_348819 ?auto_348821 ) ) ( not ( = ?auto_348819 ?auto_348822 ) ) ( not ( = ?auto_348819 ?auto_348823 ) ) ( not ( = ?auto_348820 ?auto_348821 ) ) ( not ( = ?auto_348820 ?auto_348822 ) ) ( not ( = ?auto_348820 ?auto_348823 ) ) ( not ( = ?auto_348821 ?auto_348822 ) ) ( not ( = ?auto_348821 ?auto_348823 ) ) ( not ( = ?auto_348822 ?auto_348823 ) ) ( ON ?auto_348821 ?auto_348822 ) ( ON ?auto_348820 ?auto_348821 ) ( ON ?auto_348819 ?auto_348820 ) ( CLEAR ?auto_348817 ) ( ON ?auto_348818 ?auto_348819 ) ( CLEAR ?auto_348818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_348814 ?auto_348815 ?auto_348816 ?auto_348817 ?auto_348818 )
      ( MAKE-9PILE ?auto_348814 ?auto_348815 ?auto_348816 ?auto_348817 ?auto_348818 ?auto_348819 ?auto_348820 ?auto_348821 ?auto_348822 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348833 - BLOCK
      ?auto_348834 - BLOCK
      ?auto_348835 - BLOCK
      ?auto_348836 - BLOCK
      ?auto_348837 - BLOCK
      ?auto_348838 - BLOCK
      ?auto_348839 - BLOCK
      ?auto_348840 - BLOCK
      ?auto_348841 - BLOCK
    )
    :vars
    (
      ?auto_348842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348841 ?auto_348842 ) ( ON-TABLE ?auto_348833 ) ( ON ?auto_348834 ?auto_348833 ) ( ON ?auto_348835 ?auto_348834 ) ( ON ?auto_348836 ?auto_348835 ) ( not ( = ?auto_348833 ?auto_348834 ) ) ( not ( = ?auto_348833 ?auto_348835 ) ) ( not ( = ?auto_348833 ?auto_348836 ) ) ( not ( = ?auto_348833 ?auto_348837 ) ) ( not ( = ?auto_348833 ?auto_348838 ) ) ( not ( = ?auto_348833 ?auto_348839 ) ) ( not ( = ?auto_348833 ?auto_348840 ) ) ( not ( = ?auto_348833 ?auto_348841 ) ) ( not ( = ?auto_348833 ?auto_348842 ) ) ( not ( = ?auto_348834 ?auto_348835 ) ) ( not ( = ?auto_348834 ?auto_348836 ) ) ( not ( = ?auto_348834 ?auto_348837 ) ) ( not ( = ?auto_348834 ?auto_348838 ) ) ( not ( = ?auto_348834 ?auto_348839 ) ) ( not ( = ?auto_348834 ?auto_348840 ) ) ( not ( = ?auto_348834 ?auto_348841 ) ) ( not ( = ?auto_348834 ?auto_348842 ) ) ( not ( = ?auto_348835 ?auto_348836 ) ) ( not ( = ?auto_348835 ?auto_348837 ) ) ( not ( = ?auto_348835 ?auto_348838 ) ) ( not ( = ?auto_348835 ?auto_348839 ) ) ( not ( = ?auto_348835 ?auto_348840 ) ) ( not ( = ?auto_348835 ?auto_348841 ) ) ( not ( = ?auto_348835 ?auto_348842 ) ) ( not ( = ?auto_348836 ?auto_348837 ) ) ( not ( = ?auto_348836 ?auto_348838 ) ) ( not ( = ?auto_348836 ?auto_348839 ) ) ( not ( = ?auto_348836 ?auto_348840 ) ) ( not ( = ?auto_348836 ?auto_348841 ) ) ( not ( = ?auto_348836 ?auto_348842 ) ) ( not ( = ?auto_348837 ?auto_348838 ) ) ( not ( = ?auto_348837 ?auto_348839 ) ) ( not ( = ?auto_348837 ?auto_348840 ) ) ( not ( = ?auto_348837 ?auto_348841 ) ) ( not ( = ?auto_348837 ?auto_348842 ) ) ( not ( = ?auto_348838 ?auto_348839 ) ) ( not ( = ?auto_348838 ?auto_348840 ) ) ( not ( = ?auto_348838 ?auto_348841 ) ) ( not ( = ?auto_348838 ?auto_348842 ) ) ( not ( = ?auto_348839 ?auto_348840 ) ) ( not ( = ?auto_348839 ?auto_348841 ) ) ( not ( = ?auto_348839 ?auto_348842 ) ) ( not ( = ?auto_348840 ?auto_348841 ) ) ( not ( = ?auto_348840 ?auto_348842 ) ) ( not ( = ?auto_348841 ?auto_348842 ) ) ( ON ?auto_348840 ?auto_348841 ) ( ON ?auto_348839 ?auto_348840 ) ( ON ?auto_348838 ?auto_348839 ) ( CLEAR ?auto_348836 ) ( ON ?auto_348837 ?auto_348838 ) ( CLEAR ?auto_348837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_348833 ?auto_348834 ?auto_348835 ?auto_348836 ?auto_348837 )
      ( MAKE-9PILE ?auto_348833 ?auto_348834 ?auto_348835 ?auto_348836 ?auto_348837 ?auto_348838 ?auto_348839 ?auto_348840 ?auto_348841 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348852 - BLOCK
      ?auto_348853 - BLOCK
      ?auto_348854 - BLOCK
      ?auto_348855 - BLOCK
      ?auto_348856 - BLOCK
      ?auto_348857 - BLOCK
      ?auto_348858 - BLOCK
      ?auto_348859 - BLOCK
      ?auto_348860 - BLOCK
    )
    :vars
    (
      ?auto_348861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348860 ?auto_348861 ) ( ON-TABLE ?auto_348852 ) ( ON ?auto_348853 ?auto_348852 ) ( ON ?auto_348854 ?auto_348853 ) ( not ( = ?auto_348852 ?auto_348853 ) ) ( not ( = ?auto_348852 ?auto_348854 ) ) ( not ( = ?auto_348852 ?auto_348855 ) ) ( not ( = ?auto_348852 ?auto_348856 ) ) ( not ( = ?auto_348852 ?auto_348857 ) ) ( not ( = ?auto_348852 ?auto_348858 ) ) ( not ( = ?auto_348852 ?auto_348859 ) ) ( not ( = ?auto_348852 ?auto_348860 ) ) ( not ( = ?auto_348852 ?auto_348861 ) ) ( not ( = ?auto_348853 ?auto_348854 ) ) ( not ( = ?auto_348853 ?auto_348855 ) ) ( not ( = ?auto_348853 ?auto_348856 ) ) ( not ( = ?auto_348853 ?auto_348857 ) ) ( not ( = ?auto_348853 ?auto_348858 ) ) ( not ( = ?auto_348853 ?auto_348859 ) ) ( not ( = ?auto_348853 ?auto_348860 ) ) ( not ( = ?auto_348853 ?auto_348861 ) ) ( not ( = ?auto_348854 ?auto_348855 ) ) ( not ( = ?auto_348854 ?auto_348856 ) ) ( not ( = ?auto_348854 ?auto_348857 ) ) ( not ( = ?auto_348854 ?auto_348858 ) ) ( not ( = ?auto_348854 ?auto_348859 ) ) ( not ( = ?auto_348854 ?auto_348860 ) ) ( not ( = ?auto_348854 ?auto_348861 ) ) ( not ( = ?auto_348855 ?auto_348856 ) ) ( not ( = ?auto_348855 ?auto_348857 ) ) ( not ( = ?auto_348855 ?auto_348858 ) ) ( not ( = ?auto_348855 ?auto_348859 ) ) ( not ( = ?auto_348855 ?auto_348860 ) ) ( not ( = ?auto_348855 ?auto_348861 ) ) ( not ( = ?auto_348856 ?auto_348857 ) ) ( not ( = ?auto_348856 ?auto_348858 ) ) ( not ( = ?auto_348856 ?auto_348859 ) ) ( not ( = ?auto_348856 ?auto_348860 ) ) ( not ( = ?auto_348856 ?auto_348861 ) ) ( not ( = ?auto_348857 ?auto_348858 ) ) ( not ( = ?auto_348857 ?auto_348859 ) ) ( not ( = ?auto_348857 ?auto_348860 ) ) ( not ( = ?auto_348857 ?auto_348861 ) ) ( not ( = ?auto_348858 ?auto_348859 ) ) ( not ( = ?auto_348858 ?auto_348860 ) ) ( not ( = ?auto_348858 ?auto_348861 ) ) ( not ( = ?auto_348859 ?auto_348860 ) ) ( not ( = ?auto_348859 ?auto_348861 ) ) ( not ( = ?auto_348860 ?auto_348861 ) ) ( ON ?auto_348859 ?auto_348860 ) ( ON ?auto_348858 ?auto_348859 ) ( ON ?auto_348857 ?auto_348858 ) ( ON ?auto_348856 ?auto_348857 ) ( CLEAR ?auto_348854 ) ( ON ?auto_348855 ?auto_348856 ) ( CLEAR ?auto_348855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_348852 ?auto_348853 ?auto_348854 ?auto_348855 )
      ( MAKE-9PILE ?auto_348852 ?auto_348853 ?auto_348854 ?auto_348855 ?auto_348856 ?auto_348857 ?auto_348858 ?auto_348859 ?auto_348860 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348871 - BLOCK
      ?auto_348872 - BLOCK
      ?auto_348873 - BLOCK
      ?auto_348874 - BLOCK
      ?auto_348875 - BLOCK
      ?auto_348876 - BLOCK
      ?auto_348877 - BLOCK
      ?auto_348878 - BLOCK
      ?auto_348879 - BLOCK
    )
    :vars
    (
      ?auto_348880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348879 ?auto_348880 ) ( ON-TABLE ?auto_348871 ) ( ON ?auto_348872 ?auto_348871 ) ( ON ?auto_348873 ?auto_348872 ) ( not ( = ?auto_348871 ?auto_348872 ) ) ( not ( = ?auto_348871 ?auto_348873 ) ) ( not ( = ?auto_348871 ?auto_348874 ) ) ( not ( = ?auto_348871 ?auto_348875 ) ) ( not ( = ?auto_348871 ?auto_348876 ) ) ( not ( = ?auto_348871 ?auto_348877 ) ) ( not ( = ?auto_348871 ?auto_348878 ) ) ( not ( = ?auto_348871 ?auto_348879 ) ) ( not ( = ?auto_348871 ?auto_348880 ) ) ( not ( = ?auto_348872 ?auto_348873 ) ) ( not ( = ?auto_348872 ?auto_348874 ) ) ( not ( = ?auto_348872 ?auto_348875 ) ) ( not ( = ?auto_348872 ?auto_348876 ) ) ( not ( = ?auto_348872 ?auto_348877 ) ) ( not ( = ?auto_348872 ?auto_348878 ) ) ( not ( = ?auto_348872 ?auto_348879 ) ) ( not ( = ?auto_348872 ?auto_348880 ) ) ( not ( = ?auto_348873 ?auto_348874 ) ) ( not ( = ?auto_348873 ?auto_348875 ) ) ( not ( = ?auto_348873 ?auto_348876 ) ) ( not ( = ?auto_348873 ?auto_348877 ) ) ( not ( = ?auto_348873 ?auto_348878 ) ) ( not ( = ?auto_348873 ?auto_348879 ) ) ( not ( = ?auto_348873 ?auto_348880 ) ) ( not ( = ?auto_348874 ?auto_348875 ) ) ( not ( = ?auto_348874 ?auto_348876 ) ) ( not ( = ?auto_348874 ?auto_348877 ) ) ( not ( = ?auto_348874 ?auto_348878 ) ) ( not ( = ?auto_348874 ?auto_348879 ) ) ( not ( = ?auto_348874 ?auto_348880 ) ) ( not ( = ?auto_348875 ?auto_348876 ) ) ( not ( = ?auto_348875 ?auto_348877 ) ) ( not ( = ?auto_348875 ?auto_348878 ) ) ( not ( = ?auto_348875 ?auto_348879 ) ) ( not ( = ?auto_348875 ?auto_348880 ) ) ( not ( = ?auto_348876 ?auto_348877 ) ) ( not ( = ?auto_348876 ?auto_348878 ) ) ( not ( = ?auto_348876 ?auto_348879 ) ) ( not ( = ?auto_348876 ?auto_348880 ) ) ( not ( = ?auto_348877 ?auto_348878 ) ) ( not ( = ?auto_348877 ?auto_348879 ) ) ( not ( = ?auto_348877 ?auto_348880 ) ) ( not ( = ?auto_348878 ?auto_348879 ) ) ( not ( = ?auto_348878 ?auto_348880 ) ) ( not ( = ?auto_348879 ?auto_348880 ) ) ( ON ?auto_348878 ?auto_348879 ) ( ON ?auto_348877 ?auto_348878 ) ( ON ?auto_348876 ?auto_348877 ) ( ON ?auto_348875 ?auto_348876 ) ( CLEAR ?auto_348873 ) ( ON ?auto_348874 ?auto_348875 ) ( CLEAR ?auto_348874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_348871 ?auto_348872 ?auto_348873 ?auto_348874 )
      ( MAKE-9PILE ?auto_348871 ?auto_348872 ?auto_348873 ?auto_348874 ?auto_348875 ?auto_348876 ?auto_348877 ?auto_348878 ?auto_348879 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348890 - BLOCK
      ?auto_348891 - BLOCK
      ?auto_348892 - BLOCK
      ?auto_348893 - BLOCK
      ?auto_348894 - BLOCK
      ?auto_348895 - BLOCK
      ?auto_348896 - BLOCK
      ?auto_348897 - BLOCK
      ?auto_348898 - BLOCK
    )
    :vars
    (
      ?auto_348899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348898 ?auto_348899 ) ( ON-TABLE ?auto_348890 ) ( ON ?auto_348891 ?auto_348890 ) ( not ( = ?auto_348890 ?auto_348891 ) ) ( not ( = ?auto_348890 ?auto_348892 ) ) ( not ( = ?auto_348890 ?auto_348893 ) ) ( not ( = ?auto_348890 ?auto_348894 ) ) ( not ( = ?auto_348890 ?auto_348895 ) ) ( not ( = ?auto_348890 ?auto_348896 ) ) ( not ( = ?auto_348890 ?auto_348897 ) ) ( not ( = ?auto_348890 ?auto_348898 ) ) ( not ( = ?auto_348890 ?auto_348899 ) ) ( not ( = ?auto_348891 ?auto_348892 ) ) ( not ( = ?auto_348891 ?auto_348893 ) ) ( not ( = ?auto_348891 ?auto_348894 ) ) ( not ( = ?auto_348891 ?auto_348895 ) ) ( not ( = ?auto_348891 ?auto_348896 ) ) ( not ( = ?auto_348891 ?auto_348897 ) ) ( not ( = ?auto_348891 ?auto_348898 ) ) ( not ( = ?auto_348891 ?auto_348899 ) ) ( not ( = ?auto_348892 ?auto_348893 ) ) ( not ( = ?auto_348892 ?auto_348894 ) ) ( not ( = ?auto_348892 ?auto_348895 ) ) ( not ( = ?auto_348892 ?auto_348896 ) ) ( not ( = ?auto_348892 ?auto_348897 ) ) ( not ( = ?auto_348892 ?auto_348898 ) ) ( not ( = ?auto_348892 ?auto_348899 ) ) ( not ( = ?auto_348893 ?auto_348894 ) ) ( not ( = ?auto_348893 ?auto_348895 ) ) ( not ( = ?auto_348893 ?auto_348896 ) ) ( not ( = ?auto_348893 ?auto_348897 ) ) ( not ( = ?auto_348893 ?auto_348898 ) ) ( not ( = ?auto_348893 ?auto_348899 ) ) ( not ( = ?auto_348894 ?auto_348895 ) ) ( not ( = ?auto_348894 ?auto_348896 ) ) ( not ( = ?auto_348894 ?auto_348897 ) ) ( not ( = ?auto_348894 ?auto_348898 ) ) ( not ( = ?auto_348894 ?auto_348899 ) ) ( not ( = ?auto_348895 ?auto_348896 ) ) ( not ( = ?auto_348895 ?auto_348897 ) ) ( not ( = ?auto_348895 ?auto_348898 ) ) ( not ( = ?auto_348895 ?auto_348899 ) ) ( not ( = ?auto_348896 ?auto_348897 ) ) ( not ( = ?auto_348896 ?auto_348898 ) ) ( not ( = ?auto_348896 ?auto_348899 ) ) ( not ( = ?auto_348897 ?auto_348898 ) ) ( not ( = ?auto_348897 ?auto_348899 ) ) ( not ( = ?auto_348898 ?auto_348899 ) ) ( ON ?auto_348897 ?auto_348898 ) ( ON ?auto_348896 ?auto_348897 ) ( ON ?auto_348895 ?auto_348896 ) ( ON ?auto_348894 ?auto_348895 ) ( ON ?auto_348893 ?auto_348894 ) ( CLEAR ?auto_348891 ) ( ON ?auto_348892 ?auto_348893 ) ( CLEAR ?auto_348892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_348890 ?auto_348891 ?auto_348892 )
      ( MAKE-9PILE ?auto_348890 ?auto_348891 ?auto_348892 ?auto_348893 ?auto_348894 ?auto_348895 ?auto_348896 ?auto_348897 ?auto_348898 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348909 - BLOCK
      ?auto_348910 - BLOCK
      ?auto_348911 - BLOCK
      ?auto_348912 - BLOCK
      ?auto_348913 - BLOCK
      ?auto_348914 - BLOCK
      ?auto_348915 - BLOCK
      ?auto_348916 - BLOCK
      ?auto_348917 - BLOCK
    )
    :vars
    (
      ?auto_348918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348917 ?auto_348918 ) ( ON-TABLE ?auto_348909 ) ( ON ?auto_348910 ?auto_348909 ) ( not ( = ?auto_348909 ?auto_348910 ) ) ( not ( = ?auto_348909 ?auto_348911 ) ) ( not ( = ?auto_348909 ?auto_348912 ) ) ( not ( = ?auto_348909 ?auto_348913 ) ) ( not ( = ?auto_348909 ?auto_348914 ) ) ( not ( = ?auto_348909 ?auto_348915 ) ) ( not ( = ?auto_348909 ?auto_348916 ) ) ( not ( = ?auto_348909 ?auto_348917 ) ) ( not ( = ?auto_348909 ?auto_348918 ) ) ( not ( = ?auto_348910 ?auto_348911 ) ) ( not ( = ?auto_348910 ?auto_348912 ) ) ( not ( = ?auto_348910 ?auto_348913 ) ) ( not ( = ?auto_348910 ?auto_348914 ) ) ( not ( = ?auto_348910 ?auto_348915 ) ) ( not ( = ?auto_348910 ?auto_348916 ) ) ( not ( = ?auto_348910 ?auto_348917 ) ) ( not ( = ?auto_348910 ?auto_348918 ) ) ( not ( = ?auto_348911 ?auto_348912 ) ) ( not ( = ?auto_348911 ?auto_348913 ) ) ( not ( = ?auto_348911 ?auto_348914 ) ) ( not ( = ?auto_348911 ?auto_348915 ) ) ( not ( = ?auto_348911 ?auto_348916 ) ) ( not ( = ?auto_348911 ?auto_348917 ) ) ( not ( = ?auto_348911 ?auto_348918 ) ) ( not ( = ?auto_348912 ?auto_348913 ) ) ( not ( = ?auto_348912 ?auto_348914 ) ) ( not ( = ?auto_348912 ?auto_348915 ) ) ( not ( = ?auto_348912 ?auto_348916 ) ) ( not ( = ?auto_348912 ?auto_348917 ) ) ( not ( = ?auto_348912 ?auto_348918 ) ) ( not ( = ?auto_348913 ?auto_348914 ) ) ( not ( = ?auto_348913 ?auto_348915 ) ) ( not ( = ?auto_348913 ?auto_348916 ) ) ( not ( = ?auto_348913 ?auto_348917 ) ) ( not ( = ?auto_348913 ?auto_348918 ) ) ( not ( = ?auto_348914 ?auto_348915 ) ) ( not ( = ?auto_348914 ?auto_348916 ) ) ( not ( = ?auto_348914 ?auto_348917 ) ) ( not ( = ?auto_348914 ?auto_348918 ) ) ( not ( = ?auto_348915 ?auto_348916 ) ) ( not ( = ?auto_348915 ?auto_348917 ) ) ( not ( = ?auto_348915 ?auto_348918 ) ) ( not ( = ?auto_348916 ?auto_348917 ) ) ( not ( = ?auto_348916 ?auto_348918 ) ) ( not ( = ?auto_348917 ?auto_348918 ) ) ( ON ?auto_348916 ?auto_348917 ) ( ON ?auto_348915 ?auto_348916 ) ( ON ?auto_348914 ?auto_348915 ) ( ON ?auto_348913 ?auto_348914 ) ( ON ?auto_348912 ?auto_348913 ) ( CLEAR ?auto_348910 ) ( ON ?auto_348911 ?auto_348912 ) ( CLEAR ?auto_348911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_348909 ?auto_348910 ?auto_348911 )
      ( MAKE-9PILE ?auto_348909 ?auto_348910 ?auto_348911 ?auto_348912 ?auto_348913 ?auto_348914 ?auto_348915 ?auto_348916 ?auto_348917 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348928 - BLOCK
      ?auto_348929 - BLOCK
      ?auto_348930 - BLOCK
      ?auto_348931 - BLOCK
      ?auto_348932 - BLOCK
      ?auto_348933 - BLOCK
      ?auto_348934 - BLOCK
      ?auto_348935 - BLOCK
      ?auto_348936 - BLOCK
    )
    :vars
    (
      ?auto_348937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348936 ?auto_348937 ) ( ON-TABLE ?auto_348928 ) ( not ( = ?auto_348928 ?auto_348929 ) ) ( not ( = ?auto_348928 ?auto_348930 ) ) ( not ( = ?auto_348928 ?auto_348931 ) ) ( not ( = ?auto_348928 ?auto_348932 ) ) ( not ( = ?auto_348928 ?auto_348933 ) ) ( not ( = ?auto_348928 ?auto_348934 ) ) ( not ( = ?auto_348928 ?auto_348935 ) ) ( not ( = ?auto_348928 ?auto_348936 ) ) ( not ( = ?auto_348928 ?auto_348937 ) ) ( not ( = ?auto_348929 ?auto_348930 ) ) ( not ( = ?auto_348929 ?auto_348931 ) ) ( not ( = ?auto_348929 ?auto_348932 ) ) ( not ( = ?auto_348929 ?auto_348933 ) ) ( not ( = ?auto_348929 ?auto_348934 ) ) ( not ( = ?auto_348929 ?auto_348935 ) ) ( not ( = ?auto_348929 ?auto_348936 ) ) ( not ( = ?auto_348929 ?auto_348937 ) ) ( not ( = ?auto_348930 ?auto_348931 ) ) ( not ( = ?auto_348930 ?auto_348932 ) ) ( not ( = ?auto_348930 ?auto_348933 ) ) ( not ( = ?auto_348930 ?auto_348934 ) ) ( not ( = ?auto_348930 ?auto_348935 ) ) ( not ( = ?auto_348930 ?auto_348936 ) ) ( not ( = ?auto_348930 ?auto_348937 ) ) ( not ( = ?auto_348931 ?auto_348932 ) ) ( not ( = ?auto_348931 ?auto_348933 ) ) ( not ( = ?auto_348931 ?auto_348934 ) ) ( not ( = ?auto_348931 ?auto_348935 ) ) ( not ( = ?auto_348931 ?auto_348936 ) ) ( not ( = ?auto_348931 ?auto_348937 ) ) ( not ( = ?auto_348932 ?auto_348933 ) ) ( not ( = ?auto_348932 ?auto_348934 ) ) ( not ( = ?auto_348932 ?auto_348935 ) ) ( not ( = ?auto_348932 ?auto_348936 ) ) ( not ( = ?auto_348932 ?auto_348937 ) ) ( not ( = ?auto_348933 ?auto_348934 ) ) ( not ( = ?auto_348933 ?auto_348935 ) ) ( not ( = ?auto_348933 ?auto_348936 ) ) ( not ( = ?auto_348933 ?auto_348937 ) ) ( not ( = ?auto_348934 ?auto_348935 ) ) ( not ( = ?auto_348934 ?auto_348936 ) ) ( not ( = ?auto_348934 ?auto_348937 ) ) ( not ( = ?auto_348935 ?auto_348936 ) ) ( not ( = ?auto_348935 ?auto_348937 ) ) ( not ( = ?auto_348936 ?auto_348937 ) ) ( ON ?auto_348935 ?auto_348936 ) ( ON ?auto_348934 ?auto_348935 ) ( ON ?auto_348933 ?auto_348934 ) ( ON ?auto_348932 ?auto_348933 ) ( ON ?auto_348931 ?auto_348932 ) ( ON ?auto_348930 ?auto_348931 ) ( CLEAR ?auto_348928 ) ( ON ?auto_348929 ?auto_348930 ) ( CLEAR ?auto_348929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_348928 ?auto_348929 )
      ( MAKE-9PILE ?auto_348928 ?auto_348929 ?auto_348930 ?auto_348931 ?auto_348932 ?auto_348933 ?auto_348934 ?auto_348935 ?auto_348936 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348947 - BLOCK
      ?auto_348948 - BLOCK
      ?auto_348949 - BLOCK
      ?auto_348950 - BLOCK
      ?auto_348951 - BLOCK
      ?auto_348952 - BLOCK
      ?auto_348953 - BLOCK
      ?auto_348954 - BLOCK
      ?auto_348955 - BLOCK
    )
    :vars
    (
      ?auto_348956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348955 ?auto_348956 ) ( ON-TABLE ?auto_348947 ) ( not ( = ?auto_348947 ?auto_348948 ) ) ( not ( = ?auto_348947 ?auto_348949 ) ) ( not ( = ?auto_348947 ?auto_348950 ) ) ( not ( = ?auto_348947 ?auto_348951 ) ) ( not ( = ?auto_348947 ?auto_348952 ) ) ( not ( = ?auto_348947 ?auto_348953 ) ) ( not ( = ?auto_348947 ?auto_348954 ) ) ( not ( = ?auto_348947 ?auto_348955 ) ) ( not ( = ?auto_348947 ?auto_348956 ) ) ( not ( = ?auto_348948 ?auto_348949 ) ) ( not ( = ?auto_348948 ?auto_348950 ) ) ( not ( = ?auto_348948 ?auto_348951 ) ) ( not ( = ?auto_348948 ?auto_348952 ) ) ( not ( = ?auto_348948 ?auto_348953 ) ) ( not ( = ?auto_348948 ?auto_348954 ) ) ( not ( = ?auto_348948 ?auto_348955 ) ) ( not ( = ?auto_348948 ?auto_348956 ) ) ( not ( = ?auto_348949 ?auto_348950 ) ) ( not ( = ?auto_348949 ?auto_348951 ) ) ( not ( = ?auto_348949 ?auto_348952 ) ) ( not ( = ?auto_348949 ?auto_348953 ) ) ( not ( = ?auto_348949 ?auto_348954 ) ) ( not ( = ?auto_348949 ?auto_348955 ) ) ( not ( = ?auto_348949 ?auto_348956 ) ) ( not ( = ?auto_348950 ?auto_348951 ) ) ( not ( = ?auto_348950 ?auto_348952 ) ) ( not ( = ?auto_348950 ?auto_348953 ) ) ( not ( = ?auto_348950 ?auto_348954 ) ) ( not ( = ?auto_348950 ?auto_348955 ) ) ( not ( = ?auto_348950 ?auto_348956 ) ) ( not ( = ?auto_348951 ?auto_348952 ) ) ( not ( = ?auto_348951 ?auto_348953 ) ) ( not ( = ?auto_348951 ?auto_348954 ) ) ( not ( = ?auto_348951 ?auto_348955 ) ) ( not ( = ?auto_348951 ?auto_348956 ) ) ( not ( = ?auto_348952 ?auto_348953 ) ) ( not ( = ?auto_348952 ?auto_348954 ) ) ( not ( = ?auto_348952 ?auto_348955 ) ) ( not ( = ?auto_348952 ?auto_348956 ) ) ( not ( = ?auto_348953 ?auto_348954 ) ) ( not ( = ?auto_348953 ?auto_348955 ) ) ( not ( = ?auto_348953 ?auto_348956 ) ) ( not ( = ?auto_348954 ?auto_348955 ) ) ( not ( = ?auto_348954 ?auto_348956 ) ) ( not ( = ?auto_348955 ?auto_348956 ) ) ( ON ?auto_348954 ?auto_348955 ) ( ON ?auto_348953 ?auto_348954 ) ( ON ?auto_348952 ?auto_348953 ) ( ON ?auto_348951 ?auto_348952 ) ( ON ?auto_348950 ?auto_348951 ) ( ON ?auto_348949 ?auto_348950 ) ( CLEAR ?auto_348947 ) ( ON ?auto_348948 ?auto_348949 ) ( CLEAR ?auto_348948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_348947 ?auto_348948 )
      ( MAKE-9PILE ?auto_348947 ?auto_348948 ?auto_348949 ?auto_348950 ?auto_348951 ?auto_348952 ?auto_348953 ?auto_348954 ?auto_348955 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348966 - BLOCK
      ?auto_348967 - BLOCK
      ?auto_348968 - BLOCK
      ?auto_348969 - BLOCK
      ?auto_348970 - BLOCK
      ?auto_348971 - BLOCK
      ?auto_348972 - BLOCK
      ?auto_348973 - BLOCK
      ?auto_348974 - BLOCK
    )
    :vars
    (
      ?auto_348975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348974 ?auto_348975 ) ( not ( = ?auto_348966 ?auto_348967 ) ) ( not ( = ?auto_348966 ?auto_348968 ) ) ( not ( = ?auto_348966 ?auto_348969 ) ) ( not ( = ?auto_348966 ?auto_348970 ) ) ( not ( = ?auto_348966 ?auto_348971 ) ) ( not ( = ?auto_348966 ?auto_348972 ) ) ( not ( = ?auto_348966 ?auto_348973 ) ) ( not ( = ?auto_348966 ?auto_348974 ) ) ( not ( = ?auto_348966 ?auto_348975 ) ) ( not ( = ?auto_348967 ?auto_348968 ) ) ( not ( = ?auto_348967 ?auto_348969 ) ) ( not ( = ?auto_348967 ?auto_348970 ) ) ( not ( = ?auto_348967 ?auto_348971 ) ) ( not ( = ?auto_348967 ?auto_348972 ) ) ( not ( = ?auto_348967 ?auto_348973 ) ) ( not ( = ?auto_348967 ?auto_348974 ) ) ( not ( = ?auto_348967 ?auto_348975 ) ) ( not ( = ?auto_348968 ?auto_348969 ) ) ( not ( = ?auto_348968 ?auto_348970 ) ) ( not ( = ?auto_348968 ?auto_348971 ) ) ( not ( = ?auto_348968 ?auto_348972 ) ) ( not ( = ?auto_348968 ?auto_348973 ) ) ( not ( = ?auto_348968 ?auto_348974 ) ) ( not ( = ?auto_348968 ?auto_348975 ) ) ( not ( = ?auto_348969 ?auto_348970 ) ) ( not ( = ?auto_348969 ?auto_348971 ) ) ( not ( = ?auto_348969 ?auto_348972 ) ) ( not ( = ?auto_348969 ?auto_348973 ) ) ( not ( = ?auto_348969 ?auto_348974 ) ) ( not ( = ?auto_348969 ?auto_348975 ) ) ( not ( = ?auto_348970 ?auto_348971 ) ) ( not ( = ?auto_348970 ?auto_348972 ) ) ( not ( = ?auto_348970 ?auto_348973 ) ) ( not ( = ?auto_348970 ?auto_348974 ) ) ( not ( = ?auto_348970 ?auto_348975 ) ) ( not ( = ?auto_348971 ?auto_348972 ) ) ( not ( = ?auto_348971 ?auto_348973 ) ) ( not ( = ?auto_348971 ?auto_348974 ) ) ( not ( = ?auto_348971 ?auto_348975 ) ) ( not ( = ?auto_348972 ?auto_348973 ) ) ( not ( = ?auto_348972 ?auto_348974 ) ) ( not ( = ?auto_348972 ?auto_348975 ) ) ( not ( = ?auto_348973 ?auto_348974 ) ) ( not ( = ?auto_348973 ?auto_348975 ) ) ( not ( = ?auto_348974 ?auto_348975 ) ) ( ON ?auto_348973 ?auto_348974 ) ( ON ?auto_348972 ?auto_348973 ) ( ON ?auto_348971 ?auto_348972 ) ( ON ?auto_348970 ?auto_348971 ) ( ON ?auto_348969 ?auto_348970 ) ( ON ?auto_348968 ?auto_348969 ) ( ON ?auto_348967 ?auto_348968 ) ( ON ?auto_348966 ?auto_348967 ) ( CLEAR ?auto_348966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_348966 )
      ( MAKE-9PILE ?auto_348966 ?auto_348967 ?auto_348968 ?auto_348969 ?auto_348970 ?auto_348971 ?auto_348972 ?auto_348973 ?auto_348974 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_348985 - BLOCK
      ?auto_348986 - BLOCK
      ?auto_348987 - BLOCK
      ?auto_348988 - BLOCK
      ?auto_348989 - BLOCK
      ?auto_348990 - BLOCK
      ?auto_348991 - BLOCK
      ?auto_348992 - BLOCK
      ?auto_348993 - BLOCK
    )
    :vars
    (
      ?auto_348994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_348993 ?auto_348994 ) ( not ( = ?auto_348985 ?auto_348986 ) ) ( not ( = ?auto_348985 ?auto_348987 ) ) ( not ( = ?auto_348985 ?auto_348988 ) ) ( not ( = ?auto_348985 ?auto_348989 ) ) ( not ( = ?auto_348985 ?auto_348990 ) ) ( not ( = ?auto_348985 ?auto_348991 ) ) ( not ( = ?auto_348985 ?auto_348992 ) ) ( not ( = ?auto_348985 ?auto_348993 ) ) ( not ( = ?auto_348985 ?auto_348994 ) ) ( not ( = ?auto_348986 ?auto_348987 ) ) ( not ( = ?auto_348986 ?auto_348988 ) ) ( not ( = ?auto_348986 ?auto_348989 ) ) ( not ( = ?auto_348986 ?auto_348990 ) ) ( not ( = ?auto_348986 ?auto_348991 ) ) ( not ( = ?auto_348986 ?auto_348992 ) ) ( not ( = ?auto_348986 ?auto_348993 ) ) ( not ( = ?auto_348986 ?auto_348994 ) ) ( not ( = ?auto_348987 ?auto_348988 ) ) ( not ( = ?auto_348987 ?auto_348989 ) ) ( not ( = ?auto_348987 ?auto_348990 ) ) ( not ( = ?auto_348987 ?auto_348991 ) ) ( not ( = ?auto_348987 ?auto_348992 ) ) ( not ( = ?auto_348987 ?auto_348993 ) ) ( not ( = ?auto_348987 ?auto_348994 ) ) ( not ( = ?auto_348988 ?auto_348989 ) ) ( not ( = ?auto_348988 ?auto_348990 ) ) ( not ( = ?auto_348988 ?auto_348991 ) ) ( not ( = ?auto_348988 ?auto_348992 ) ) ( not ( = ?auto_348988 ?auto_348993 ) ) ( not ( = ?auto_348988 ?auto_348994 ) ) ( not ( = ?auto_348989 ?auto_348990 ) ) ( not ( = ?auto_348989 ?auto_348991 ) ) ( not ( = ?auto_348989 ?auto_348992 ) ) ( not ( = ?auto_348989 ?auto_348993 ) ) ( not ( = ?auto_348989 ?auto_348994 ) ) ( not ( = ?auto_348990 ?auto_348991 ) ) ( not ( = ?auto_348990 ?auto_348992 ) ) ( not ( = ?auto_348990 ?auto_348993 ) ) ( not ( = ?auto_348990 ?auto_348994 ) ) ( not ( = ?auto_348991 ?auto_348992 ) ) ( not ( = ?auto_348991 ?auto_348993 ) ) ( not ( = ?auto_348991 ?auto_348994 ) ) ( not ( = ?auto_348992 ?auto_348993 ) ) ( not ( = ?auto_348992 ?auto_348994 ) ) ( not ( = ?auto_348993 ?auto_348994 ) ) ( ON ?auto_348992 ?auto_348993 ) ( ON ?auto_348991 ?auto_348992 ) ( ON ?auto_348990 ?auto_348991 ) ( ON ?auto_348989 ?auto_348990 ) ( ON ?auto_348988 ?auto_348989 ) ( ON ?auto_348987 ?auto_348988 ) ( ON ?auto_348986 ?auto_348987 ) ( ON ?auto_348985 ?auto_348986 ) ( CLEAR ?auto_348985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_348985 )
      ( MAKE-9PILE ?auto_348985 ?auto_348986 ?auto_348987 ?auto_348988 ?auto_348989 ?auto_348990 ?auto_348991 ?auto_348992 ?auto_348993 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349005 - BLOCK
      ?auto_349006 - BLOCK
      ?auto_349007 - BLOCK
      ?auto_349008 - BLOCK
      ?auto_349009 - BLOCK
      ?auto_349010 - BLOCK
      ?auto_349011 - BLOCK
      ?auto_349012 - BLOCK
      ?auto_349013 - BLOCK
      ?auto_349014 - BLOCK
    )
    :vars
    (
      ?auto_349015 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_349013 ) ( ON ?auto_349014 ?auto_349015 ) ( CLEAR ?auto_349014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_349005 ) ( ON ?auto_349006 ?auto_349005 ) ( ON ?auto_349007 ?auto_349006 ) ( ON ?auto_349008 ?auto_349007 ) ( ON ?auto_349009 ?auto_349008 ) ( ON ?auto_349010 ?auto_349009 ) ( ON ?auto_349011 ?auto_349010 ) ( ON ?auto_349012 ?auto_349011 ) ( ON ?auto_349013 ?auto_349012 ) ( not ( = ?auto_349005 ?auto_349006 ) ) ( not ( = ?auto_349005 ?auto_349007 ) ) ( not ( = ?auto_349005 ?auto_349008 ) ) ( not ( = ?auto_349005 ?auto_349009 ) ) ( not ( = ?auto_349005 ?auto_349010 ) ) ( not ( = ?auto_349005 ?auto_349011 ) ) ( not ( = ?auto_349005 ?auto_349012 ) ) ( not ( = ?auto_349005 ?auto_349013 ) ) ( not ( = ?auto_349005 ?auto_349014 ) ) ( not ( = ?auto_349005 ?auto_349015 ) ) ( not ( = ?auto_349006 ?auto_349007 ) ) ( not ( = ?auto_349006 ?auto_349008 ) ) ( not ( = ?auto_349006 ?auto_349009 ) ) ( not ( = ?auto_349006 ?auto_349010 ) ) ( not ( = ?auto_349006 ?auto_349011 ) ) ( not ( = ?auto_349006 ?auto_349012 ) ) ( not ( = ?auto_349006 ?auto_349013 ) ) ( not ( = ?auto_349006 ?auto_349014 ) ) ( not ( = ?auto_349006 ?auto_349015 ) ) ( not ( = ?auto_349007 ?auto_349008 ) ) ( not ( = ?auto_349007 ?auto_349009 ) ) ( not ( = ?auto_349007 ?auto_349010 ) ) ( not ( = ?auto_349007 ?auto_349011 ) ) ( not ( = ?auto_349007 ?auto_349012 ) ) ( not ( = ?auto_349007 ?auto_349013 ) ) ( not ( = ?auto_349007 ?auto_349014 ) ) ( not ( = ?auto_349007 ?auto_349015 ) ) ( not ( = ?auto_349008 ?auto_349009 ) ) ( not ( = ?auto_349008 ?auto_349010 ) ) ( not ( = ?auto_349008 ?auto_349011 ) ) ( not ( = ?auto_349008 ?auto_349012 ) ) ( not ( = ?auto_349008 ?auto_349013 ) ) ( not ( = ?auto_349008 ?auto_349014 ) ) ( not ( = ?auto_349008 ?auto_349015 ) ) ( not ( = ?auto_349009 ?auto_349010 ) ) ( not ( = ?auto_349009 ?auto_349011 ) ) ( not ( = ?auto_349009 ?auto_349012 ) ) ( not ( = ?auto_349009 ?auto_349013 ) ) ( not ( = ?auto_349009 ?auto_349014 ) ) ( not ( = ?auto_349009 ?auto_349015 ) ) ( not ( = ?auto_349010 ?auto_349011 ) ) ( not ( = ?auto_349010 ?auto_349012 ) ) ( not ( = ?auto_349010 ?auto_349013 ) ) ( not ( = ?auto_349010 ?auto_349014 ) ) ( not ( = ?auto_349010 ?auto_349015 ) ) ( not ( = ?auto_349011 ?auto_349012 ) ) ( not ( = ?auto_349011 ?auto_349013 ) ) ( not ( = ?auto_349011 ?auto_349014 ) ) ( not ( = ?auto_349011 ?auto_349015 ) ) ( not ( = ?auto_349012 ?auto_349013 ) ) ( not ( = ?auto_349012 ?auto_349014 ) ) ( not ( = ?auto_349012 ?auto_349015 ) ) ( not ( = ?auto_349013 ?auto_349014 ) ) ( not ( = ?auto_349013 ?auto_349015 ) ) ( not ( = ?auto_349014 ?auto_349015 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_349014 ?auto_349015 )
      ( !STACK ?auto_349014 ?auto_349013 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349026 - BLOCK
      ?auto_349027 - BLOCK
      ?auto_349028 - BLOCK
      ?auto_349029 - BLOCK
      ?auto_349030 - BLOCK
      ?auto_349031 - BLOCK
      ?auto_349032 - BLOCK
      ?auto_349033 - BLOCK
      ?auto_349034 - BLOCK
      ?auto_349035 - BLOCK
    )
    :vars
    (
      ?auto_349036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_349034 ) ( ON ?auto_349035 ?auto_349036 ) ( CLEAR ?auto_349035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_349026 ) ( ON ?auto_349027 ?auto_349026 ) ( ON ?auto_349028 ?auto_349027 ) ( ON ?auto_349029 ?auto_349028 ) ( ON ?auto_349030 ?auto_349029 ) ( ON ?auto_349031 ?auto_349030 ) ( ON ?auto_349032 ?auto_349031 ) ( ON ?auto_349033 ?auto_349032 ) ( ON ?auto_349034 ?auto_349033 ) ( not ( = ?auto_349026 ?auto_349027 ) ) ( not ( = ?auto_349026 ?auto_349028 ) ) ( not ( = ?auto_349026 ?auto_349029 ) ) ( not ( = ?auto_349026 ?auto_349030 ) ) ( not ( = ?auto_349026 ?auto_349031 ) ) ( not ( = ?auto_349026 ?auto_349032 ) ) ( not ( = ?auto_349026 ?auto_349033 ) ) ( not ( = ?auto_349026 ?auto_349034 ) ) ( not ( = ?auto_349026 ?auto_349035 ) ) ( not ( = ?auto_349026 ?auto_349036 ) ) ( not ( = ?auto_349027 ?auto_349028 ) ) ( not ( = ?auto_349027 ?auto_349029 ) ) ( not ( = ?auto_349027 ?auto_349030 ) ) ( not ( = ?auto_349027 ?auto_349031 ) ) ( not ( = ?auto_349027 ?auto_349032 ) ) ( not ( = ?auto_349027 ?auto_349033 ) ) ( not ( = ?auto_349027 ?auto_349034 ) ) ( not ( = ?auto_349027 ?auto_349035 ) ) ( not ( = ?auto_349027 ?auto_349036 ) ) ( not ( = ?auto_349028 ?auto_349029 ) ) ( not ( = ?auto_349028 ?auto_349030 ) ) ( not ( = ?auto_349028 ?auto_349031 ) ) ( not ( = ?auto_349028 ?auto_349032 ) ) ( not ( = ?auto_349028 ?auto_349033 ) ) ( not ( = ?auto_349028 ?auto_349034 ) ) ( not ( = ?auto_349028 ?auto_349035 ) ) ( not ( = ?auto_349028 ?auto_349036 ) ) ( not ( = ?auto_349029 ?auto_349030 ) ) ( not ( = ?auto_349029 ?auto_349031 ) ) ( not ( = ?auto_349029 ?auto_349032 ) ) ( not ( = ?auto_349029 ?auto_349033 ) ) ( not ( = ?auto_349029 ?auto_349034 ) ) ( not ( = ?auto_349029 ?auto_349035 ) ) ( not ( = ?auto_349029 ?auto_349036 ) ) ( not ( = ?auto_349030 ?auto_349031 ) ) ( not ( = ?auto_349030 ?auto_349032 ) ) ( not ( = ?auto_349030 ?auto_349033 ) ) ( not ( = ?auto_349030 ?auto_349034 ) ) ( not ( = ?auto_349030 ?auto_349035 ) ) ( not ( = ?auto_349030 ?auto_349036 ) ) ( not ( = ?auto_349031 ?auto_349032 ) ) ( not ( = ?auto_349031 ?auto_349033 ) ) ( not ( = ?auto_349031 ?auto_349034 ) ) ( not ( = ?auto_349031 ?auto_349035 ) ) ( not ( = ?auto_349031 ?auto_349036 ) ) ( not ( = ?auto_349032 ?auto_349033 ) ) ( not ( = ?auto_349032 ?auto_349034 ) ) ( not ( = ?auto_349032 ?auto_349035 ) ) ( not ( = ?auto_349032 ?auto_349036 ) ) ( not ( = ?auto_349033 ?auto_349034 ) ) ( not ( = ?auto_349033 ?auto_349035 ) ) ( not ( = ?auto_349033 ?auto_349036 ) ) ( not ( = ?auto_349034 ?auto_349035 ) ) ( not ( = ?auto_349034 ?auto_349036 ) ) ( not ( = ?auto_349035 ?auto_349036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_349035 ?auto_349036 )
      ( !STACK ?auto_349035 ?auto_349034 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349047 - BLOCK
      ?auto_349048 - BLOCK
      ?auto_349049 - BLOCK
      ?auto_349050 - BLOCK
      ?auto_349051 - BLOCK
      ?auto_349052 - BLOCK
      ?auto_349053 - BLOCK
      ?auto_349054 - BLOCK
      ?auto_349055 - BLOCK
      ?auto_349056 - BLOCK
    )
    :vars
    (
      ?auto_349057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349056 ?auto_349057 ) ( ON-TABLE ?auto_349047 ) ( ON ?auto_349048 ?auto_349047 ) ( ON ?auto_349049 ?auto_349048 ) ( ON ?auto_349050 ?auto_349049 ) ( ON ?auto_349051 ?auto_349050 ) ( ON ?auto_349052 ?auto_349051 ) ( ON ?auto_349053 ?auto_349052 ) ( ON ?auto_349054 ?auto_349053 ) ( not ( = ?auto_349047 ?auto_349048 ) ) ( not ( = ?auto_349047 ?auto_349049 ) ) ( not ( = ?auto_349047 ?auto_349050 ) ) ( not ( = ?auto_349047 ?auto_349051 ) ) ( not ( = ?auto_349047 ?auto_349052 ) ) ( not ( = ?auto_349047 ?auto_349053 ) ) ( not ( = ?auto_349047 ?auto_349054 ) ) ( not ( = ?auto_349047 ?auto_349055 ) ) ( not ( = ?auto_349047 ?auto_349056 ) ) ( not ( = ?auto_349047 ?auto_349057 ) ) ( not ( = ?auto_349048 ?auto_349049 ) ) ( not ( = ?auto_349048 ?auto_349050 ) ) ( not ( = ?auto_349048 ?auto_349051 ) ) ( not ( = ?auto_349048 ?auto_349052 ) ) ( not ( = ?auto_349048 ?auto_349053 ) ) ( not ( = ?auto_349048 ?auto_349054 ) ) ( not ( = ?auto_349048 ?auto_349055 ) ) ( not ( = ?auto_349048 ?auto_349056 ) ) ( not ( = ?auto_349048 ?auto_349057 ) ) ( not ( = ?auto_349049 ?auto_349050 ) ) ( not ( = ?auto_349049 ?auto_349051 ) ) ( not ( = ?auto_349049 ?auto_349052 ) ) ( not ( = ?auto_349049 ?auto_349053 ) ) ( not ( = ?auto_349049 ?auto_349054 ) ) ( not ( = ?auto_349049 ?auto_349055 ) ) ( not ( = ?auto_349049 ?auto_349056 ) ) ( not ( = ?auto_349049 ?auto_349057 ) ) ( not ( = ?auto_349050 ?auto_349051 ) ) ( not ( = ?auto_349050 ?auto_349052 ) ) ( not ( = ?auto_349050 ?auto_349053 ) ) ( not ( = ?auto_349050 ?auto_349054 ) ) ( not ( = ?auto_349050 ?auto_349055 ) ) ( not ( = ?auto_349050 ?auto_349056 ) ) ( not ( = ?auto_349050 ?auto_349057 ) ) ( not ( = ?auto_349051 ?auto_349052 ) ) ( not ( = ?auto_349051 ?auto_349053 ) ) ( not ( = ?auto_349051 ?auto_349054 ) ) ( not ( = ?auto_349051 ?auto_349055 ) ) ( not ( = ?auto_349051 ?auto_349056 ) ) ( not ( = ?auto_349051 ?auto_349057 ) ) ( not ( = ?auto_349052 ?auto_349053 ) ) ( not ( = ?auto_349052 ?auto_349054 ) ) ( not ( = ?auto_349052 ?auto_349055 ) ) ( not ( = ?auto_349052 ?auto_349056 ) ) ( not ( = ?auto_349052 ?auto_349057 ) ) ( not ( = ?auto_349053 ?auto_349054 ) ) ( not ( = ?auto_349053 ?auto_349055 ) ) ( not ( = ?auto_349053 ?auto_349056 ) ) ( not ( = ?auto_349053 ?auto_349057 ) ) ( not ( = ?auto_349054 ?auto_349055 ) ) ( not ( = ?auto_349054 ?auto_349056 ) ) ( not ( = ?auto_349054 ?auto_349057 ) ) ( not ( = ?auto_349055 ?auto_349056 ) ) ( not ( = ?auto_349055 ?auto_349057 ) ) ( not ( = ?auto_349056 ?auto_349057 ) ) ( CLEAR ?auto_349054 ) ( ON ?auto_349055 ?auto_349056 ) ( CLEAR ?auto_349055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_349047 ?auto_349048 ?auto_349049 ?auto_349050 ?auto_349051 ?auto_349052 ?auto_349053 ?auto_349054 ?auto_349055 )
      ( MAKE-10PILE ?auto_349047 ?auto_349048 ?auto_349049 ?auto_349050 ?auto_349051 ?auto_349052 ?auto_349053 ?auto_349054 ?auto_349055 ?auto_349056 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349068 - BLOCK
      ?auto_349069 - BLOCK
      ?auto_349070 - BLOCK
      ?auto_349071 - BLOCK
      ?auto_349072 - BLOCK
      ?auto_349073 - BLOCK
      ?auto_349074 - BLOCK
      ?auto_349075 - BLOCK
      ?auto_349076 - BLOCK
      ?auto_349077 - BLOCK
    )
    :vars
    (
      ?auto_349078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349077 ?auto_349078 ) ( ON-TABLE ?auto_349068 ) ( ON ?auto_349069 ?auto_349068 ) ( ON ?auto_349070 ?auto_349069 ) ( ON ?auto_349071 ?auto_349070 ) ( ON ?auto_349072 ?auto_349071 ) ( ON ?auto_349073 ?auto_349072 ) ( ON ?auto_349074 ?auto_349073 ) ( ON ?auto_349075 ?auto_349074 ) ( not ( = ?auto_349068 ?auto_349069 ) ) ( not ( = ?auto_349068 ?auto_349070 ) ) ( not ( = ?auto_349068 ?auto_349071 ) ) ( not ( = ?auto_349068 ?auto_349072 ) ) ( not ( = ?auto_349068 ?auto_349073 ) ) ( not ( = ?auto_349068 ?auto_349074 ) ) ( not ( = ?auto_349068 ?auto_349075 ) ) ( not ( = ?auto_349068 ?auto_349076 ) ) ( not ( = ?auto_349068 ?auto_349077 ) ) ( not ( = ?auto_349068 ?auto_349078 ) ) ( not ( = ?auto_349069 ?auto_349070 ) ) ( not ( = ?auto_349069 ?auto_349071 ) ) ( not ( = ?auto_349069 ?auto_349072 ) ) ( not ( = ?auto_349069 ?auto_349073 ) ) ( not ( = ?auto_349069 ?auto_349074 ) ) ( not ( = ?auto_349069 ?auto_349075 ) ) ( not ( = ?auto_349069 ?auto_349076 ) ) ( not ( = ?auto_349069 ?auto_349077 ) ) ( not ( = ?auto_349069 ?auto_349078 ) ) ( not ( = ?auto_349070 ?auto_349071 ) ) ( not ( = ?auto_349070 ?auto_349072 ) ) ( not ( = ?auto_349070 ?auto_349073 ) ) ( not ( = ?auto_349070 ?auto_349074 ) ) ( not ( = ?auto_349070 ?auto_349075 ) ) ( not ( = ?auto_349070 ?auto_349076 ) ) ( not ( = ?auto_349070 ?auto_349077 ) ) ( not ( = ?auto_349070 ?auto_349078 ) ) ( not ( = ?auto_349071 ?auto_349072 ) ) ( not ( = ?auto_349071 ?auto_349073 ) ) ( not ( = ?auto_349071 ?auto_349074 ) ) ( not ( = ?auto_349071 ?auto_349075 ) ) ( not ( = ?auto_349071 ?auto_349076 ) ) ( not ( = ?auto_349071 ?auto_349077 ) ) ( not ( = ?auto_349071 ?auto_349078 ) ) ( not ( = ?auto_349072 ?auto_349073 ) ) ( not ( = ?auto_349072 ?auto_349074 ) ) ( not ( = ?auto_349072 ?auto_349075 ) ) ( not ( = ?auto_349072 ?auto_349076 ) ) ( not ( = ?auto_349072 ?auto_349077 ) ) ( not ( = ?auto_349072 ?auto_349078 ) ) ( not ( = ?auto_349073 ?auto_349074 ) ) ( not ( = ?auto_349073 ?auto_349075 ) ) ( not ( = ?auto_349073 ?auto_349076 ) ) ( not ( = ?auto_349073 ?auto_349077 ) ) ( not ( = ?auto_349073 ?auto_349078 ) ) ( not ( = ?auto_349074 ?auto_349075 ) ) ( not ( = ?auto_349074 ?auto_349076 ) ) ( not ( = ?auto_349074 ?auto_349077 ) ) ( not ( = ?auto_349074 ?auto_349078 ) ) ( not ( = ?auto_349075 ?auto_349076 ) ) ( not ( = ?auto_349075 ?auto_349077 ) ) ( not ( = ?auto_349075 ?auto_349078 ) ) ( not ( = ?auto_349076 ?auto_349077 ) ) ( not ( = ?auto_349076 ?auto_349078 ) ) ( not ( = ?auto_349077 ?auto_349078 ) ) ( CLEAR ?auto_349075 ) ( ON ?auto_349076 ?auto_349077 ) ( CLEAR ?auto_349076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_349068 ?auto_349069 ?auto_349070 ?auto_349071 ?auto_349072 ?auto_349073 ?auto_349074 ?auto_349075 ?auto_349076 )
      ( MAKE-10PILE ?auto_349068 ?auto_349069 ?auto_349070 ?auto_349071 ?auto_349072 ?auto_349073 ?auto_349074 ?auto_349075 ?auto_349076 ?auto_349077 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349089 - BLOCK
      ?auto_349090 - BLOCK
      ?auto_349091 - BLOCK
      ?auto_349092 - BLOCK
      ?auto_349093 - BLOCK
      ?auto_349094 - BLOCK
      ?auto_349095 - BLOCK
      ?auto_349096 - BLOCK
      ?auto_349097 - BLOCK
      ?auto_349098 - BLOCK
    )
    :vars
    (
      ?auto_349099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349098 ?auto_349099 ) ( ON-TABLE ?auto_349089 ) ( ON ?auto_349090 ?auto_349089 ) ( ON ?auto_349091 ?auto_349090 ) ( ON ?auto_349092 ?auto_349091 ) ( ON ?auto_349093 ?auto_349092 ) ( ON ?auto_349094 ?auto_349093 ) ( ON ?auto_349095 ?auto_349094 ) ( not ( = ?auto_349089 ?auto_349090 ) ) ( not ( = ?auto_349089 ?auto_349091 ) ) ( not ( = ?auto_349089 ?auto_349092 ) ) ( not ( = ?auto_349089 ?auto_349093 ) ) ( not ( = ?auto_349089 ?auto_349094 ) ) ( not ( = ?auto_349089 ?auto_349095 ) ) ( not ( = ?auto_349089 ?auto_349096 ) ) ( not ( = ?auto_349089 ?auto_349097 ) ) ( not ( = ?auto_349089 ?auto_349098 ) ) ( not ( = ?auto_349089 ?auto_349099 ) ) ( not ( = ?auto_349090 ?auto_349091 ) ) ( not ( = ?auto_349090 ?auto_349092 ) ) ( not ( = ?auto_349090 ?auto_349093 ) ) ( not ( = ?auto_349090 ?auto_349094 ) ) ( not ( = ?auto_349090 ?auto_349095 ) ) ( not ( = ?auto_349090 ?auto_349096 ) ) ( not ( = ?auto_349090 ?auto_349097 ) ) ( not ( = ?auto_349090 ?auto_349098 ) ) ( not ( = ?auto_349090 ?auto_349099 ) ) ( not ( = ?auto_349091 ?auto_349092 ) ) ( not ( = ?auto_349091 ?auto_349093 ) ) ( not ( = ?auto_349091 ?auto_349094 ) ) ( not ( = ?auto_349091 ?auto_349095 ) ) ( not ( = ?auto_349091 ?auto_349096 ) ) ( not ( = ?auto_349091 ?auto_349097 ) ) ( not ( = ?auto_349091 ?auto_349098 ) ) ( not ( = ?auto_349091 ?auto_349099 ) ) ( not ( = ?auto_349092 ?auto_349093 ) ) ( not ( = ?auto_349092 ?auto_349094 ) ) ( not ( = ?auto_349092 ?auto_349095 ) ) ( not ( = ?auto_349092 ?auto_349096 ) ) ( not ( = ?auto_349092 ?auto_349097 ) ) ( not ( = ?auto_349092 ?auto_349098 ) ) ( not ( = ?auto_349092 ?auto_349099 ) ) ( not ( = ?auto_349093 ?auto_349094 ) ) ( not ( = ?auto_349093 ?auto_349095 ) ) ( not ( = ?auto_349093 ?auto_349096 ) ) ( not ( = ?auto_349093 ?auto_349097 ) ) ( not ( = ?auto_349093 ?auto_349098 ) ) ( not ( = ?auto_349093 ?auto_349099 ) ) ( not ( = ?auto_349094 ?auto_349095 ) ) ( not ( = ?auto_349094 ?auto_349096 ) ) ( not ( = ?auto_349094 ?auto_349097 ) ) ( not ( = ?auto_349094 ?auto_349098 ) ) ( not ( = ?auto_349094 ?auto_349099 ) ) ( not ( = ?auto_349095 ?auto_349096 ) ) ( not ( = ?auto_349095 ?auto_349097 ) ) ( not ( = ?auto_349095 ?auto_349098 ) ) ( not ( = ?auto_349095 ?auto_349099 ) ) ( not ( = ?auto_349096 ?auto_349097 ) ) ( not ( = ?auto_349096 ?auto_349098 ) ) ( not ( = ?auto_349096 ?auto_349099 ) ) ( not ( = ?auto_349097 ?auto_349098 ) ) ( not ( = ?auto_349097 ?auto_349099 ) ) ( not ( = ?auto_349098 ?auto_349099 ) ) ( ON ?auto_349097 ?auto_349098 ) ( CLEAR ?auto_349095 ) ( ON ?auto_349096 ?auto_349097 ) ( CLEAR ?auto_349096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_349089 ?auto_349090 ?auto_349091 ?auto_349092 ?auto_349093 ?auto_349094 ?auto_349095 ?auto_349096 )
      ( MAKE-10PILE ?auto_349089 ?auto_349090 ?auto_349091 ?auto_349092 ?auto_349093 ?auto_349094 ?auto_349095 ?auto_349096 ?auto_349097 ?auto_349098 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349110 - BLOCK
      ?auto_349111 - BLOCK
      ?auto_349112 - BLOCK
      ?auto_349113 - BLOCK
      ?auto_349114 - BLOCK
      ?auto_349115 - BLOCK
      ?auto_349116 - BLOCK
      ?auto_349117 - BLOCK
      ?auto_349118 - BLOCK
      ?auto_349119 - BLOCK
    )
    :vars
    (
      ?auto_349120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349119 ?auto_349120 ) ( ON-TABLE ?auto_349110 ) ( ON ?auto_349111 ?auto_349110 ) ( ON ?auto_349112 ?auto_349111 ) ( ON ?auto_349113 ?auto_349112 ) ( ON ?auto_349114 ?auto_349113 ) ( ON ?auto_349115 ?auto_349114 ) ( ON ?auto_349116 ?auto_349115 ) ( not ( = ?auto_349110 ?auto_349111 ) ) ( not ( = ?auto_349110 ?auto_349112 ) ) ( not ( = ?auto_349110 ?auto_349113 ) ) ( not ( = ?auto_349110 ?auto_349114 ) ) ( not ( = ?auto_349110 ?auto_349115 ) ) ( not ( = ?auto_349110 ?auto_349116 ) ) ( not ( = ?auto_349110 ?auto_349117 ) ) ( not ( = ?auto_349110 ?auto_349118 ) ) ( not ( = ?auto_349110 ?auto_349119 ) ) ( not ( = ?auto_349110 ?auto_349120 ) ) ( not ( = ?auto_349111 ?auto_349112 ) ) ( not ( = ?auto_349111 ?auto_349113 ) ) ( not ( = ?auto_349111 ?auto_349114 ) ) ( not ( = ?auto_349111 ?auto_349115 ) ) ( not ( = ?auto_349111 ?auto_349116 ) ) ( not ( = ?auto_349111 ?auto_349117 ) ) ( not ( = ?auto_349111 ?auto_349118 ) ) ( not ( = ?auto_349111 ?auto_349119 ) ) ( not ( = ?auto_349111 ?auto_349120 ) ) ( not ( = ?auto_349112 ?auto_349113 ) ) ( not ( = ?auto_349112 ?auto_349114 ) ) ( not ( = ?auto_349112 ?auto_349115 ) ) ( not ( = ?auto_349112 ?auto_349116 ) ) ( not ( = ?auto_349112 ?auto_349117 ) ) ( not ( = ?auto_349112 ?auto_349118 ) ) ( not ( = ?auto_349112 ?auto_349119 ) ) ( not ( = ?auto_349112 ?auto_349120 ) ) ( not ( = ?auto_349113 ?auto_349114 ) ) ( not ( = ?auto_349113 ?auto_349115 ) ) ( not ( = ?auto_349113 ?auto_349116 ) ) ( not ( = ?auto_349113 ?auto_349117 ) ) ( not ( = ?auto_349113 ?auto_349118 ) ) ( not ( = ?auto_349113 ?auto_349119 ) ) ( not ( = ?auto_349113 ?auto_349120 ) ) ( not ( = ?auto_349114 ?auto_349115 ) ) ( not ( = ?auto_349114 ?auto_349116 ) ) ( not ( = ?auto_349114 ?auto_349117 ) ) ( not ( = ?auto_349114 ?auto_349118 ) ) ( not ( = ?auto_349114 ?auto_349119 ) ) ( not ( = ?auto_349114 ?auto_349120 ) ) ( not ( = ?auto_349115 ?auto_349116 ) ) ( not ( = ?auto_349115 ?auto_349117 ) ) ( not ( = ?auto_349115 ?auto_349118 ) ) ( not ( = ?auto_349115 ?auto_349119 ) ) ( not ( = ?auto_349115 ?auto_349120 ) ) ( not ( = ?auto_349116 ?auto_349117 ) ) ( not ( = ?auto_349116 ?auto_349118 ) ) ( not ( = ?auto_349116 ?auto_349119 ) ) ( not ( = ?auto_349116 ?auto_349120 ) ) ( not ( = ?auto_349117 ?auto_349118 ) ) ( not ( = ?auto_349117 ?auto_349119 ) ) ( not ( = ?auto_349117 ?auto_349120 ) ) ( not ( = ?auto_349118 ?auto_349119 ) ) ( not ( = ?auto_349118 ?auto_349120 ) ) ( not ( = ?auto_349119 ?auto_349120 ) ) ( ON ?auto_349118 ?auto_349119 ) ( CLEAR ?auto_349116 ) ( ON ?auto_349117 ?auto_349118 ) ( CLEAR ?auto_349117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_349110 ?auto_349111 ?auto_349112 ?auto_349113 ?auto_349114 ?auto_349115 ?auto_349116 ?auto_349117 )
      ( MAKE-10PILE ?auto_349110 ?auto_349111 ?auto_349112 ?auto_349113 ?auto_349114 ?auto_349115 ?auto_349116 ?auto_349117 ?auto_349118 ?auto_349119 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349131 - BLOCK
      ?auto_349132 - BLOCK
      ?auto_349133 - BLOCK
      ?auto_349134 - BLOCK
      ?auto_349135 - BLOCK
      ?auto_349136 - BLOCK
      ?auto_349137 - BLOCK
      ?auto_349138 - BLOCK
      ?auto_349139 - BLOCK
      ?auto_349140 - BLOCK
    )
    :vars
    (
      ?auto_349141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349140 ?auto_349141 ) ( ON-TABLE ?auto_349131 ) ( ON ?auto_349132 ?auto_349131 ) ( ON ?auto_349133 ?auto_349132 ) ( ON ?auto_349134 ?auto_349133 ) ( ON ?auto_349135 ?auto_349134 ) ( ON ?auto_349136 ?auto_349135 ) ( not ( = ?auto_349131 ?auto_349132 ) ) ( not ( = ?auto_349131 ?auto_349133 ) ) ( not ( = ?auto_349131 ?auto_349134 ) ) ( not ( = ?auto_349131 ?auto_349135 ) ) ( not ( = ?auto_349131 ?auto_349136 ) ) ( not ( = ?auto_349131 ?auto_349137 ) ) ( not ( = ?auto_349131 ?auto_349138 ) ) ( not ( = ?auto_349131 ?auto_349139 ) ) ( not ( = ?auto_349131 ?auto_349140 ) ) ( not ( = ?auto_349131 ?auto_349141 ) ) ( not ( = ?auto_349132 ?auto_349133 ) ) ( not ( = ?auto_349132 ?auto_349134 ) ) ( not ( = ?auto_349132 ?auto_349135 ) ) ( not ( = ?auto_349132 ?auto_349136 ) ) ( not ( = ?auto_349132 ?auto_349137 ) ) ( not ( = ?auto_349132 ?auto_349138 ) ) ( not ( = ?auto_349132 ?auto_349139 ) ) ( not ( = ?auto_349132 ?auto_349140 ) ) ( not ( = ?auto_349132 ?auto_349141 ) ) ( not ( = ?auto_349133 ?auto_349134 ) ) ( not ( = ?auto_349133 ?auto_349135 ) ) ( not ( = ?auto_349133 ?auto_349136 ) ) ( not ( = ?auto_349133 ?auto_349137 ) ) ( not ( = ?auto_349133 ?auto_349138 ) ) ( not ( = ?auto_349133 ?auto_349139 ) ) ( not ( = ?auto_349133 ?auto_349140 ) ) ( not ( = ?auto_349133 ?auto_349141 ) ) ( not ( = ?auto_349134 ?auto_349135 ) ) ( not ( = ?auto_349134 ?auto_349136 ) ) ( not ( = ?auto_349134 ?auto_349137 ) ) ( not ( = ?auto_349134 ?auto_349138 ) ) ( not ( = ?auto_349134 ?auto_349139 ) ) ( not ( = ?auto_349134 ?auto_349140 ) ) ( not ( = ?auto_349134 ?auto_349141 ) ) ( not ( = ?auto_349135 ?auto_349136 ) ) ( not ( = ?auto_349135 ?auto_349137 ) ) ( not ( = ?auto_349135 ?auto_349138 ) ) ( not ( = ?auto_349135 ?auto_349139 ) ) ( not ( = ?auto_349135 ?auto_349140 ) ) ( not ( = ?auto_349135 ?auto_349141 ) ) ( not ( = ?auto_349136 ?auto_349137 ) ) ( not ( = ?auto_349136 ?auto_349138 ) ) ( not ( = ?auto_349136 ?auto_349139 ) ) ( not ( = ?auto_349136 ?auto_349140 ) ) ( not ( = ?auto_349136 ?auto_349141 ) ) ( not ( = ?auto_349137 ?auto_349138 ) ) ( not ( = ?auto_349137 ?auto_349139 ) ) ( not ( = ?auto_349137 ?auto_349140 ) ) ( not ( = ?auto_349137 ?auto_349141 ) ) ( not ( = ?auto_349138 ?auto_349139 ) ) ( not ( = ?auto_349138 ?auto_349140 ) ) ( not ( = ?auto_349138 ?auto_349141 ) ) ( not ( = ?auto_349139 ?auto_349140 ) ) ( not ( = ?auto_349139 ?auto_349141 ) ) ( not ( = ?auto_349140 ?auto_349141 ) ) ( ON ?auto_349139 ?auto_349140 ) ( ON ?auto_349138 ?auto_349139 ) ( CLEAR ?auto_349136 ) ( ON ?auto_349137 ?auto_349138 ) ( CLEAR ?auto_349137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_349131 ?auto_349132 ?auto_349133 ?auto_349134 ?auto_349135 ?auto_349136 ?auto_349137 )
      ( MAKE-10PILE ?auto_349131 ?auto_349132 ?auto_349133 ?auto_349134 ?auto_349135 ?auto_349136 ?auto_349137 ?auto_349138 ?auto_349139 ?auto_349140 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349152 - BLOCK
      ?auto_349153 - BLOCK
      ?auto_349154 - BLOCK
      ?auto_349155 - BLOCK
      ?auto_349156 - BLOCK
      ?auto_349157 - BLOCK
      ?auto_349158 - BLOCK
      ?auto_349159 - BLOCK
      ?auto_349160 - BLOCK
      ?auto_349161 - BLOCK
    )
    :vars
    (
      ?auto_349162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349161 ?auto_349162 ) ( ON-TABLE ?auto_349152 ) ( ON ?auto_349153 ?auto_349152 ) ( ON ?auto_349154 ?auto_349153 ) ( ON ?auto_349155 ?auto_349154 ) ( ON ?auto_349156 ?auto_349155 ) ( ON ?auto_349157 ?auto_349156 ) ( not ( = ?auto_349152 ?auto_349153 ) ) ( not ( = ?auto_349152 ?auto_349154 ) ) ( not ( = ?auto_349152 ?auto_349155 ) ) ( not ( = ?auto_349152 ?auto_349156 ) ) ( not ( = ?auto_349152 ?auto_349157 ) ) ( not ( = ?auto_349152 ?auto_349158 ) ) ( not ( = ?auto_349152 ?auto_349159 ) ) ( not ( = ?auto_349152 ?auto_349160 ) ) ( not ( = ?auto_349152 ?auto_349161 ) ) ( not ( = ?auto_349152 ?auto_349162 ) ) ( not ( = ?auto_349153 ?auto_349154 ) ) ( not ( = ?auto_349153 ?auto_349155 ) ) ( not ( = ?auto_349153 ?auto_349156 ) ) ( not ( = ?auto_349153 ?auto_349157 ) ) ( not ( = ?auto_349153 ?auto_349158 ) ) ( not ( = ?auto_349153 ?auto_349159 ) ) ( not ( = ?auto_349153 ?auto_349160 ) ) ( not ( = ?auto_349153 ?auto_349161 ) ) ( not ( = ?auto_349153 ?auto_349162 ) ) ( not ( = ?auto_349154 ?auto_349155 ) ) ( not ( = ?auto_349154 ?auto_349156 ) ) ( not ( = ?auto_349154 ?auto_349157 ) ) ( not ( = ?auto_349154 ?auto_349158 ) ) ( not ( = ?auto_349154 ?auto_349159 ) ) ( not ( = ?auto_349154 ?auto_349160 ) ) ( not ( = ?auto_349154 ?auto_349161 ) ) ( not ( = ?auto_349154 ?auto_349162 ) ) ( not ( = ?auto_349155 ?auto_349156 ) ) ( not ( = ?auto_349155 ?auto_349157 ) ) ( not ( = ?auto_349155 ?auto_349158 ) ) ( not ( = ?auto_349155 ?auto_349159 ) ) ( not ( = ?auto_349155 ?auto_349160 ) ) ( not ( = ?auto_349155 ?auto_349161 ) ) ( not ( = ?auto_349155 ?auto_349162 ) ) ( not ( = ?auto_349156 ?auto_349157 ) ) ( not ( = ?auto_349156 ?auto_349158 ) ) ( not ( = ?auto_349156 ?auto_349159 ) ) ( not ( = ?auto_349156 ?auto_349160 ) ) ( not ( = ?auto_349156 ?auto_349161 ) ) ( not ( = ?auto_349156 ?auto_349162 ) ) ( not ( = ?auto_349157 ?auto_349158 ) ) ( not ( = ?auto_349157 ?auto_349159 ) ) ( not ( = ?auto_349157 ?auto_349160 ) ) ( not ( = ?auto_349157 ?auto_349161 ) ) ( not ( = ?auto_349157 ?auto_349162 ) ) ( not ( = ?auto_349158 ?auto_349159 ) ) ( not ( = ?auto_349158 ?auto_349160 ) ) ( not ( = ?auto_349158 ?auto_349161 ) ) ( not ( = ?auto_349158 ?auto_349162 ) ) ( not ( = ?auto_349159 ?auto_349160 ) ) ( not ( = ?auto_349159 ?auto_349161 ) ) ( not ( = ?auto_349159 ?auto_349162 ) ) ( not ( = ?auto_349160 ?auto_349161 ) ) ( not ( = ?auto_349160 ?auto_349162 ) ) ( not ( = ?auto_349161 ?auto_349162 ) ) ( ON ?auto_349160 ?auto_349161 ) ( ON ?auto_349159 ?auto_349160 ) ( CLEAR ?auto_349157 ) ( ON ?auto_349158 ?auto_349159 ) ( CLEAR ?auto_349158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_349152 ?auto_349153 ?auto_349154 ?auto_349155 ?auto_349156 ?auto_349157 ?auto_349158 )
      ( MAKE-10PILE ?auto_349152 ?auto_349153 ?auto_349154 ?auto_349155 ?auto_349156 ?auto_349157 ?auto_349158 ?auto_349159 ?auto_349160 ?auto_349161 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349173 - BLOCK
      ?auto_349174 - BLOCK
      ?auto_349175 - BLOCK
      ?auto_349176 - BLOCK
      ?auto_349177 - BLOCK
      ?auto_349178 - BLOCK
      ?auto_349179 - BLOCK
      ?auto_349180 - BLOCK
      ?auto_349181 - BLOCK
      ?auto_349182 - BLOCK
    )
    :vars
    (
      ?auto_349183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349182 ?auto_349183 ) ( ON-TABLE ?auto_349173 ) ( ON ?auto_349174 ?auto_349173 ) ( ON ?auto_349175 ?auto_349174 ) ( ON ?auto_349176 ?auto_349175 ) ( ON ?auto_349177 ?auto_349176 ) ( not ( = ?auto_349173 ?auto_349174 ) ) ( not ( = ?auto_349173 ?auto_349175 ) ) ( not ( = ?auto_349173 ?auto_349176 ) ) ( not ( = ?auto_349173 ?auto_349177 ) ) ( not ( = ?auto_349173 ?auto_349178 ) ) ( not ( = ?auto_349173 ?auto_349179 ) ) ( not ( = ?auto_349173 ?auto_349180 ) ) ( not ( = ?auto_349173 ?auto_349181 ) ) ( not ( = ?auto_349173 ?auto_349182 ) ) ( not ( = ?auto_349173 ?auto_349183 ) ) ( not ( = ?auto_349174 ?auto_349175 ) ) ( not ( = ?auto_349174 ?auto_349176 ) ) ( not ( = ?auto_349174 ?auto_349177 ) ) ( not ( = ?auto_349174 ?auto_349178 ) ) ( not ( = ?auto_349174 ?auto_349179 ) ) ( not ( = ?auto_349174 ?auto_349180 ) ) ( not ( = ?auto_349174 ?auto_349181 ) ) ( not ( = ?auto_349174 ?auto_349182 ) ) ( not ( = ?auto_349174 ?auto_349183 ) ) ( not ( = ?auto_349175 ?auto_349176 ) ) ( not ( = ?auto_349175 ?auto_349177 ) ) ( not ( = ?auto_349175 ?auto_349178 ) ) ( not ( = ?auto_349175 ?auto_349179 ) ) ( not ( = ?auto_349175 ?auto_349180 ) ) ( not ( = ?auto_349175 ?auto_349181 ) ) ( not ( = ?auto_349175 ?auto_349182 ) ) ( not ( = ?auto_349175 ?auto_349183 ) ) ( not ( = ?auto_349176 ?auto_349177 ) ) ( not ( = ?auto_349176 ?auto_349178 ) ) ( not ( = ?auto_349176 ?auto_349179 ) ) ( not ( = ?auto_349176 ?auto_349180 ) ) ( not ( = ?auto_349176 ?auto_349181 ) ) ( not ( = ?auto_349176 ?auto_349182 ) ) ( not ( = ?auto_349176 ?auto_349183 ) ) ( not ( = ?auto_349177 ?auto_349178 ) ) ( not ( = ?auto_349177 ?auto_349179 ) ) ( not ( = ?auto_349177 ?auto_349180 ) ) ( not ( = ?auto_349177 ?auto_349181 ) ) ( not ( = ?auto_349177 ?auto_349182 ) ) ( not ( = ?auto_349177 ?auto_349183 ) ) ( not ( = ?auto_349178 ?auto_349179 ) ) ( not ( = ?auto_349178 ?auto_349180 ) ) ( not ( = ?auto_349178 ?auto_349181 ) ) ( not ( = ?auto_349178 ?auto_349182 ) ) ( not ( = ?auto_349178 ?auto_349183 ) ) ( not ( = ?auto_349179 ?auto_349180 ) ) ( not ( = ?auto_349179 ?auto_349181 ) ) ( not ( = ?auto_349179 ?auto_349182 ) ) ( not ( = ?auto_349179 ?auto_349183 ) ) ( not ( = ?auto_349180 ?auto_349181 ) ) ( not ( = ?auto_349180 ?auto_349182 ) ) ( not ( = ?auto_349180 ?auto_349183 ) ) ( not ( = ?auto_349181 ?auto_349182 ) ) ( not ( = ?auto_349181 ?auto_349183 ) ) ( not ( = ?auto_349182 ?auto_349183 ) ) ( ON ?auto_349181 ?auto_349182 ) ( ON ?auto_349180 ?auto_349181 ) ( ON ?auto_349179 ?auto_349180 ) ( CLEAR ?auto_349177 ) ( ON ?auto_349178 ?auto_349179 ) ( CLEAR ?auto_349178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_349173 ?auto_349174 ?auto_349175 ?auto_349176 ?auto_349177 ?auto_349178 )
      ( MAKE-10PILE ?auto_349173 ?auto_349174 ?auto_349175 ?auto_349176 ?auto_349177 ?auto_349178 ?auto_349179 ?auto_349180 ?auto_349181 ?auto_349182 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349194 - BLOCK
      ?auto_349195 - BLOCK
      ?auto_349196 - BLOCK
      ?auto_349197 - BLOCK
      ?auto_349198 - BLOCK
      ?auto_349199 - BLOCK
      ?auto_349200 - BLOCK
      ?auto_349201 - BLOCK
      ?auto_349202 - BLOCK
      ?auto_349203 - BLOCK
    )
    :vars
    (
      ?auto_349204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349203 ?auto_349204 ) ( ON-TABLE ?auto_349194 ) ( ON ?auto_349195 ?auto_349194 ) ( ON ?auto_349196 ?auto_349195 ) ( ON ?auto_349197 ?auto_349196 ) ( ON ?auto_349198 ?auto_349197 ) ( not ( = ?auto_349194 ?auto_349195 ) ) ( not ( = ?auto_349194 ?auto_349196 ) ) ( not ( = ?auto_349194 ?auto_349197 ) ) ( not ( = ?auto_349194 ?auto_349198 ) ) ( not ( = ?auto_349194 ?auto_349199 ) ) ( not ( = ?auto_349194 ?auto_349200 ) ) ( not ( = ?auto_349194 ?auto_349201 ) ) ( not ( = ?auto_349194 ?auto_349202 ) ) ( not ( = ?auto_349194 ?auto_349203 ) ) ( not ( = ?auto_349194 ?auto_349204 ) ) ( not ( = ?auto_349195 ?auto_349196 ) ) ( not ( = ?auto_349195 ?auto_349197 ) ) ( not ( = ?auto_349195 ?auto_349198 ) ) ( not ( = ?auto_349195 ?auto_349199 ) ) ( not ( = ?auto_349195 ?auto_349200 ) ) ( not ( = ?auto_349195 ?auto_349201 ) ) ( not ( = ?auto_349195 ?auto_349202 ) ) ( not ( = ?auto_349195 ?auto_349203 ) ) ( not ( = ?auto_349195 ?auto_349204 ) ) ( not ( = ?auto_349196 ?auto_349197 ) ) ( not ( = ?auto_349196 ?auto_349198 ) ) ( not ( = ?auto_349196 ?auto_349199 ) ) ( not ( = ?auto_349196 ?auto_349200 ) ) ( not ( = ?auto_349196 ?auto_349201 ) ) ( not ( = ?auto_349196 ?auto_349202 ) ) ( not ( = ?auto_349196 ?auto_349203 ) ) ( not ( = ?auto_349196 ?auto_349204 ) ) ( not ( = ?auto_349197 ?auto_349198 ) ) ( not ( = ?auto_349197 ?auto_349199 ) ) ( not ( = ?auto_349197 ?auto_349200 ) ) ( not ( = ?auto_349197 ?auto_349201 ) ) ( not ( = ?auto_349197 ?auto_349202 ) ) ( not ( = ?auto_349197 ?auto_349203 ) ) ( not ( = ?auto_349197 ?auto_349204 ) ) ( not ( = ?auto_349198 ?auto_349199 ) ) ( not ( = ?auto_349198 ?auto_349200 ) ) ( not ( = ?auto_349198 ?auto_349201 ) ) ( not ( = ?auto_349198 ?auto_349202 ) ) ( not ( = ?auto_349198 ?auto_349203 ) ) ( not ( = ?auto_349198 ?auto_349204 ) ) ( not ( = ?auto_349199 ?auto_349200 ) ) ( not ( = ?auto_349199 ?auto_349201 ) ) ( not ( = ?auto_349199 ?auto_349202 ) ) ( not ( = ?auto_349199 ?auto_349203 ) ) ( not ( = ?auto_349199 ?auto_349204 ) ) ( not ( = ?auto_349200 ?auto_349201 ) ) ( not ( = ?auto_349200 ?auto_349202 ) ) ( not ( = ?auto_349200 ?auto_349203 ) ) ( not ( = ?auto_349200 ?auto_349204 ) ) ( not ( = ?auto_349201 ?auto_349202 ) ) ( not ( = ?auto_349201 ?auto_349203 ) ) ( not ( = ?auto_349201 ?auto_349204 ) ) ( not ( = ?auto_349202 ?auto_349203 ) ) ( not ( = ?auto_349202 ?auto_349204 ) ) ( not ( = ?auto_349203 ?auto_349204 ) ) ( ON ?auto_349202 ?auto_349203 ) ( ON ?auto_349201 ?auto_349202 ) ( ON ?auto_349200 ?auto_349201 ) ( CLEAR ?auto_349198 ) ( ON ?auto_349199 ?auto_349200 ) ( CLEAR ?auto_349199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_349194 ?auto_349195 ?auto_349196 ?auto_349197 ?auto_349198 ?auto_349199 )
      ( MAKE-10PILE ?auto_349194 ?auto_349195 ?auto_349196 ?auto_349197 ?auto_349198 ?auto_349199 ?auto_349200 ?auto_349201 ?auto_349202 ?auto_349203 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349215 - BLOCK
      ?auto_349216 - BLOCK
      ?auto_349217 - BLOCK
      ?auto_349218 - BLOCK
      ?auto_349219 - BLOCK
      ?auto_349220 - BLOCK
      ?auto_349221 - BLOCK
      ?auto_349222 - BLOCK
      ?auto_349223 - BLOCK
      ?auto_349224 - BLOCK
    )
    :vars
    (
      ?auto_349225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349224 ?auto_349225 ) ( ON-TABLE ?auto_349215 ) ( ON ?auto_349216 ?auto_349215 ) ( ON ?auto_349217 ?auto_349216 ) ( ON ?auto_349218 ?auto_349217 ) ( not ( = ?auto_349215 ?auto_349216 ) ) ( not ( = ?auto_349215 ?auto_349217 ) ) ( not ( = ?auto_349215 ?auto_349218 ) ) ( not ( = ?auto_349215 ?auto_349219 ) ) ( not ( = ?auto_349215 ?auto_349220 ) ) ( not ( = ?auto_349215 ?auto_349221 ) ) ( not ( = ?auto_349215 ?auto_349222 ) ) ( not ( = ?auto_349215 ?auto_349223 ) ) ( not ( = ?auto_349215 ?auto_349224 ) ) ( not ( = ?auto_349215 ?auto_349225 ) ) ( not ( = ?auto_349216 ?auto_349217 ) ) ( not ( = ?auto_349216 ?auto_349218 ) ) ( not ( = ?auto_349216 ?auto_349219 ) ) ( not ( = ?auto_349216 ?auto_349220 ) ) ( not ( = ?auto_349216 ?auto_349221 ) ) ( not ( = ?auto_349216 ?auto_349222 ) ) ( not ( = ?auto_349216 ?auto_349223 ) ) ( not ( = ?auto_349216 ?auto_349224 ) ) ( not ( = ?auto_349216 ?auto_349225 ) ) ( not ( = ?auto_349217 ?auto_349218 ) ) ( not ( = ?auto_349217 ?auto_349219 ) ) ( not ( = ?auto_349217 ?auto_349220 ) ) ( not ( = ?auto_349217 ?auto_349221 ) ) ( not ( = ?auto_349217 ?auto_349222 ) ) ( not ( = ?auto_349217 ?auto_349223 ) ) ( not ( = ?auto_349217 ?auto_349224 ) ) ( not ( = ?auto_349217 ?auto_349225 ) ) ( not ( = ?auto_349218 ?auto_349219 ) ) ( not ( = ?auto_349218 ?auto_349220 ) ) ( not ( = ?auto_349218 ?auto_349221 ) ) ( not ( = ?auto_349218 ?auto_349222 ) ) ( not ( = ?auto_349218 ?auto_349223 ) ) ( not ( = ?auto_349218 ?auto_349224 ) ) ( not ( = ?auto_349218 ?auto_349225 ) ) ( not ( = ?auto_349219 ?auto_349220 ) ) ( not ( = ?auto_349219 ?auto_349221 ) ) ( not ( = ?auto_349219 ?auto_349222 ) ) ( not ( = ?auto_349219 ?auto_349223 ) ) ( not ( = ?auto_349219 ?auto_349224 ) ) ( not ( = ?auto_349219 ?auto_349225 ) ) ( not ( = ?auto_349220 ?auto_349221 ) ) ( not ( = ?auto_349220 ?auto_349222 ) ) ( not ( = ?auto_349220 ?auto_349223 ) ) ( not ( = ?auto_349220 ?auto_349224 ) ) ( not ( = ?auto_349220 ?auto_349225 ) ) ( not ( = ?auto_349221 ?auto_349222 ) ) ( not ( = ?auto_349221 ?auto_349223 ) ) ( not ( = ?auto_349221 ?auto_349224 ) ) ( not ( = ?auto_349221 ?auto_349225 ) ) ( not ( = ?auto_349222 ?auto_349223 ) ) ( not ( = ?auto_349222 ?auto_349224 ) ) ( not ( = ?auto_349222 ?auto_349225 ) ) ( not ( = ?auto_349223 ?auto_349224 ) ) ( not ( = ?auto_349223 ?auto_349225 ) ) ( not ( = ?auto_349224 ?auto_349225 ) ) ( ON ?auto_349223 ?auto_349224 ) ( ON ?auto_349222 ?auto_349223 ) ( ON ?auto_349221 ?auto_349222 ) ( ON ?auto_349220 ?auto_349221 ) ( CLEAR ?auto_349218 ) ( ON ?auto_349219 ?auto_349220 ) ( CLEAR ?auto_349219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_349215 ?auto_349216 ?auto_349217 ?auto_349218 ?auto_349219 )
      ( MAKE-10PILE ?auto_349215 ?auto_349216 ?auto_349217 ?auto_349218 ?auto_349219 ?auto_349220 ?auto_349221 ?auto_349222 ?auto_349223 ?auto_349224 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349236 - BLOCK
      ?auto_349237 - BLOCK
      ?auto_349238 - BLOCK
      ?auto_349239 - BLOCK
      ?auto_349240 - BLOCK
      ?auto_349241 - BLOCK
      ?auto_349242 - BLOCK
      ?auto_349243 - BLOCK
      ?auto_349244 - BLOCK
      ?auto_349245 - BLOCK
    )
    :vars
    (
      ?auto_349246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349245 ?auto_349246 ) ( ON-TABLE ?auto_349236 ) ( ON ?auto_349237 ?auto_349236 ) ( ON ?auto_349238 ?auto_349237 ) ( ON ?auto_349239 ?auto_349238 ) ( not ( = ?auto_349236 ?auto_349237 ) ) ( not ( = ?auto_349236 ?auto_349238 ) ) ( not ( = ?auto_349236 ?auto_349239 ) ) ( not ( = ?auto_349236 ?auto_349240 ) ) ( not ( = ?auto_349236 ?auto_349241 ) ) ( not ( = ?auto_349236 ?auto_349242 ) ) ( not ( = ?auto_349236 ?auto_349243 ) ) ( not ( = ?auto_349236 ?auto_349244 ) ) ( not ( = ?auto_349236 ?auto_349245 ) ) ( not ( = ?auto_349236 ?auto_349246 ) ) ( not ( = ?auto_349237 ?auto_349238 ) ) ( not ( = ?auto_349237 ?auto_349239 ) ) ( not ( = ?auto_349237 ?auto_349240 ) ) ( not ( = ?auto_349237 ?auto_349241 ) ) ( not ( = ?auto_349237 ?auto_349242 ) ) ( not ( = ?auto_349237 ?auto_349243 ) ) ( not ( = ?auto_349237 ?auto_349244 ) ) ( not ( = ?auto_349237 ?auto_349245 ) ) ( not ( = ?auto_349237 ?auto_349246 ) ) ( not ( = ?auto_349238 ?auto_349239 ) ) ( not ( = ?auto_349238 ?auto_349240 ) ) ( not ( = ?auto_349238 ?auto_349241 ) ) ( not ( = ?auto_349238 ?auto_349242 ) ) ( not ( = ?auto_349238 ?auto_349243 ) ) ( not ( = ?auto_349238 ?auto_349244 ) ) ( not ( = ?auto_349238 ?auto_349245 ) ) ( not ( = ?auto_349238 ?auto_349246 ) ) ( not ( = ?auto_349239 ?auto_349240 ) ) ( not ( = ?auto_349239 ?auto_349241 ) ) ( not ( = ?auto_349239 ?auto_349242 ) ) ( not ( = ?auto_349239 ?auto_349243 ) ) ( not ( = ?auto_349239 ?auto_349244 ) ) ( not ( = ?auto_349239 ?auto_349245 ) ) ( not ( = ?auto_349239 ?auto_349246 ) ) ( not ( = ?auto_349240 ?auto_349241 ) ) ( not ( = ?auto_349240 ?auto_349242 ) ) ( not ( = ?auto_349240 ?auto_349243 ) ) ( not ( = ?auto_349240 ?auto_349244 ) ) ( not ( = ?auto_349240 ?auto_349245 ) ) ( not ( = ?auto_349240 ?auto_349246 ) ) ( not ( = ?auto_349241 ?auto_349242 ) ) ( not ( = ?auto_349241 ?auto_349243 ) ) ( not ( = ?auto_349241 ?auto_349244 ) ) ( not ( = ?auto_349241 ?auto_349245 ) ) ( not ( = ?auto_349241 ?auto_349246 ) ) ( not ( = ?auto_349242 ?auto_349243 ) ) ( not ( = ?auto_349242 ?auto_349244 ) ) ( not ( = ?auto_349242 ?auto_349245 ) ) ( not ( = ?auto_349242 ?auto_349246 ) ) ( not ( = ?auto_349243 ?auto_349244 ) ) ( not ( = ?auto_349243 ?auto_349245 ) ) ( not ( = ?auto_349243 ?auto_349246 ) ) ( not ( = ?auto_349244 ?auto_349245 ) ) ( not ( = ?auto_349244 ?auto_349246 ) ) ( not ( = ?auto_349245 ?auto_349246 ) ) ( ON ?auto_349244 ?auto_349245 ) ( ON ?auto_349243 ?auto_349244 ) ( ON ?auto_349242 ?auto_349243 ) ( ON ?auto_349241 ?auto_349242 ) ( CLEAR ?auto_349239 ) ( ON ?auto_349240 ?auto_349241 ) ( CLEAR ?auto_349240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_349236 ?auto_349237 ?auto_349238 ?auto_349239 ?auto_349240 )
      ( MAKE-10PILE ?auto_349236 ?auto_349237 ?auto_349238 ?auto_349239 ?auto_349240 ?auto_349241 ?auto_349242 ?auto_349243 ?auto_349244 ?auto_349245 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349257 - BLOCK
      ?auto_349258 - BLOCK
      ?auto_349259 - BLOCK
      ?auto_349260 - BLOCK
      ?auto_349261 - BLOCK
      ?auto_349262 - BLOCK
      ?auto_349263 - BLOCK
      ?auto_349264 - BLOCK
      ?auto_349265 - BLOCK
      ?auto_349266 - BLOCK
    )
    :vars
    (
      ?auto_349267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349266 ?auto_349267 ) ( ON-TABLE ?auto_349257 ) ( ON ?auto_349258 ?auto_349257 ) ( ON ?auto_349259 ?auto_349258 ) ( not ( = ?auto_349257 ?auto_349258 ) ) ( not ( = ?auto_349257 ?auto_349259 ) ) ( not ( = ?auto_349257 ?auto_349260 ) ) ( not ( = ?auto_349257 ?auto_349261 ) ) ( not ( = ?auto_349257 ?auto_349262 ) ) ( not ( = ?auto_349257 ?auto_349263 ) ) ( not ( = ?auto_349257 ?auto_349264 ) ) ( not ( = ?auto_349257 ?auto_349265 ) ) ( not ( = ?auto_349257 ?auto_349266 ) ) ( not ( = ?auto_349257 ?auto_349267 ) ) ( not ( = ?auto_349258 ?auto_349259 ) ) ( not ( = ?auto_349258 ?auto_349260 ) ) ( not ( = ?auto_349258 ?auto_349261 ) ) ( not ( = ?auto_349258 ?auto_349262 ) ) ( not ( = ?auto_349258 ?auto_349263 ) ) ( not ( = ?auto_349258 ?auto_349264 ) ) ( not ( = ?auto_349258 ?auto_349265 ) ) ( not ( = ?auto_349258 ?auto_349266 ) ) ( not ( = ?auto_349258 ?auto_349267 ) ) ( not ( = ?auto_349259 ?auto_349260 ) ) ( not ( = ?auto_349259 ?auto_349261 ) ) ( not ( = ?auto_349259 ?auto_349262 ) ) ( not ( = ?auto_349259 ?auto_349263 ) ) ( not ( = ?auto_349259 ?auto_349264 ) ) ( not ( = ?auto_349259 ?auto_349265 ) ) ( not ( = ?auto_349259 ?auto_349266 ) ) ( not ( = ?auto_349259 ?auto_349267 ) ) ( not ( = ?auto_349260 ?auto_349261 ) ) ( not ( = ?auto_349260 ?auto_349262 ) ) ( not ( = ?auto_349260 ?auto_349263 ) ) ( not ( = ?auto_349260 ?auto_349264 ) ) ( not ( = ?auto_349260 ?auto_349265 ) ) ( not ( = ?auto_349260 ?auto_349266 ) ) ( not ( = ?auto_349260 ?auto_349267 ) ) ( not ( = ?auto_349261 ?auto_349262 ) ) ( not ( = ?auto_349261 ?auto_349263 ) ) ( not ( = ?auto_349261 ?auto_349264 ) ) ( not ( = ?auto_349261 ?auto_349265 ) ) ( not ( = ?auto_349261 ?auto_349266 ) ) ( not ( = ?auto_349261 ?auto_349267 ) ) ( not ( = ?auto_349262 ?auto_349263 ) ) ( not ( = ?auto_349262 ?auto_349264 ) ) ( not ( = ?auto_349262 ?auto_349265 ) ) ( not ( = ?auto_349262 ?auto_349266 ) ) ( not ( = ?auto_349262 ?auto_349267 ) ) ( not ( = ?auto_349263 ?auto_349264 ) ) ( not ( = ?auto_349263 ?auto_349265 ) ) ( not ( = ?auto_349263 ?auto_349266 ) ) ( not ( = ?auto_349263 ?auto_349267 ) ) ( not ( = ?auto_349264 ?auto_349265 ) ) ( not ( = ?auto_349264 ?auto_349266 ) ) ( not ( = ?auto_349264 ?auto_349267 ) ) ( not ( = ?auto_349265 ?auto_349266 ) ) ( not ( = ?auto_349265 ?auto_349267 ) ) ( not ( = ?auto_349266 ?auto_349267 ) ) ( ON ?auto_349265 ?auto_349266 ) ( ON ?auto_349264 ?auto_349265 ) ( ON ?auto_349263 ?auto_349264 ) ( ON ?auto_349262 ?auto_349263 ) ( ON ?auto_349261 ?auto_349262 ) ( CLEAR ?auto_349259 ) ( ON ?auto_349260 ?auto_349261 ) ( CLEAR ?auto_349260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_349257 ?auto_349258 ?auto_349259 ?auto_349260 )
      ( MAKE-10PILE ?auto_349257 ?auto_349258 ?auto_349259 ?auto_349260 ?auto_349261 ?auto_349262 ?auto_349263 ?auto_349264 ?auto_349265 ?auto_349266 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349278 - BLOCK
      ?auto_349279 - BLOCK
      ?auto_349280 - BLOCK
      ?auto_349281 - BLOCK
      ?auto_349282 - BLOCK
      ?auto_349283 - BLOCK
      ?auto_349284 - BLOCK
      ?auto_349285 - BLOCK
      ?auto_349286 - BLOCK
      ?auto_349287 - BLOCK
    )
    :vars
    (
      ?auto_349288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349287 ?auto_349288 ) ( ON-TABLE ?auto_349278 ) ( ON ?auto_349279 ?auto_349278 ) ( ON ?auto_349280 ?auto_349279 ) ( not ( = ?auto_349278 ?auto_349279 ) ) ( not ( = ?auto_349278 ?auto_349280 ) ) ( not ( = ?auto_349278 ?auto_349281 ) ) ( not ( = ?auto_349278 ?auto_349282 ) ) ( not ( = ?auto_349278 ?auto_349283 ) ) ( not ( = ?auto_349278 ?auto_349284 ) ) ( not ( = ?auto_349278 ?auto_349285 ) ) ( not ( = ?auto_349278 ?auto_349286 ) ) ( not ( = ?auto_349278 ?auto_349287 ) ) ( not ( = ?auto_349278 ?auto_349288 ) ) ( not ( = ?auto_349279 ?auto_349280 ) ) ( not ( = ?auto_349279 ?auto_349281 ) ) ( not ( = ?auto_349279 ?auto_349282 ) ) ( not ( = ?auto_349279 ?auto_349283 ) ) ( not ( = ?auto_349279 ?auto_349284 ) ) ( not ( = ?auto_349279 ?auto_349285 ) ) ( not ( = ?auto_349279 ?auto_349286 ) ) ( not ( = ?auto_349279 ?auto_349287 ) ) ( not ( = ?auto_349279 ?auto_349288 ) ) ( not ( = ?auto_349280 ?auto_349281 ) ) ( not ( = ?auto_349280 ?auto_349282 ) ) ( not ( = ?auto_349280 ?auto_349283 ) ) ( not ( = ?auto_349280 ?auto_349284 ) ) ( not ( = ?auto_349280 ?auto_349285 ) ) ( not ( = ?auto_349280 ?auto_349286 ) ) ( not ( = ?auto_349280 ?auto_349287 ) ) ( not ( = ?auto_349280 ?auto_349288 ) ) ( not ( = ?auto_349281 ?auto_349282 ) ) ( not ( = ?auto_349281 ?auto_349283 ) ) ( not ( = ?auto_349281 ?auto_349284 ) ) ( not ( = ?auto_349281 ?auto_349285 ) ) ( not ( = ?auto_349281 ?auto_349286 ) ) ( not ( = ?auto_349281 ?auto_349287 ) ) ( not ( = ?auto_349281 ?auto_349288 ) ) ( not ( = ?auto_349282 ?auto_349283 ) ) ( not ( = ?auto_349282 ?auto_349284 ) ) ( not ( = ?auto_349282 ?auto_349285 ) ) ( not ( = ?auto_349282 ?auto_349286 ) ) ( not ( = ?auto_349282 ?auto_349287 ) ) ( not ( = ?auto_349282 ?auto_349288 ) ) ( not ( = ?auto_349283 ?auto_349284 ) ) ( not ( = ?auto_349283 ?auto_349285 ) ) ( not ( = ?auto_349283 ?auto_349286 ) ) ( not ( = ?auto_349283 ?auto_349287 ) ) ( not ( = ?auto_349283 ?auto_349288 ) ) ( not ( = ?auto_349284 ?auto_349285 ) ) ( not ( = ?auto_349284 ?auto_349286 ) ) ( not ( = ?auto_349284 ?auto_349287 ) ) ( not ( = ?auto_349284 ?auto_349288 ) ) ( not ( = ?auto_349285 ?auto_349286 ) ) ( not ( = ?auto_349285 ?auto_349287 ) ) ( not ( = ?auto_349285 ?auto_349288 ) ) ( not ( = ?auto_349286 ?auto_349287 ) ) ( not ( = ?auto_349286 ?auto_349288 ) ) ( not ( = ?auto_349287 ?auto_349288 ) ) ( ON ?auto_349286 ?auto_349287 ) ( ON ?auto_349285 ?auto_349286 ) ( ON ?auto_349284 ?auto_349285 ) ( ON ?auto_349283 ?auto_349284 ) ( ON ?auto_349282 ?auto_349283 ) ( CLEAR ?auto_349280 ) ( ON ?auto_349281 ?auto_349282 ) ( CLEAR ?auto_349281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_349278 ?auto_349279 ?auto_349280 ?auto_349281 )
      ( MAKE-10PILE ?auto_349278 ?auto_349279 ?auto_349280 ?auto_349281 ?auto_349282 ?auto_349283 ?auto_349284 ?auto_349285 ?auto_349286 ?auto_349287 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349299 - BLOCK
      ?auto_349300 - BLOCK
      ?auto_349301 - BLOCK
      ?auto_349302 - BLOCK
      ?auto_349303 - BLOCK
      ?auto_349304 - BLOCK
      ?auto_349305 - BLOCK
      ?auto_349306 - BLOCK
      ?auto_349307 - BLOCK
      ?auto_349308 - BLOCK
    )
    :vars
    (
      ?auto_349309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349308 ?auto_349309 ) ( ON-TABLE ?auto_349299 ) ( ON ?auto_349300 ?auto_349299 ) ( not ( = ?auto_349299 ?auto_349300 ) ) ( not ( = ?auto_349299 ?auto_349301 ) ) ( not ( = ?auto_349299 ?auto_349302 ) ) ( not ( = ?auto_349299 ?auto_349303 ) ) ( not ( = ?auto_349299 ?auto_349304 ) ) ( not ( = ?auto_349299 ?auto_349305 ) ) ( not ( = ?auto_349299 ?auto_349306 ) ) ( not ( = ?auto_349299 ?auto_349307 ) ) ( not ( = ?auto_349299 ?auto_349308 ) ) ( not ( = ?auto_349299 ?auto_349309 ) ) ( not ( = ?auto_349300 ?auto_349301 ) ) ( not ( = ?auto_349300 ?auto_349302 ) ) ( not ( = ?auto_349300 ?auto_349303 ) ) ( not ( = ?auto_349300 ?auto_349304 ) ) ( not ( = ?auto_349300 ?auto_349305 ) ) ( not ( = ?auto_349300 ?auto_349306 ) ) ( not ( = ?auto_349300 ?auto_349307 ) ) ( not ( = ?auto_349300 ?auto_349308 ) ) ( not ( = ?auto_349300 ?auto_349309 ) ) ( not ( = ?auto_349301 ?auto_349302 ) ) ( not ( = ?auto_349301 ?auto_349303 ) ) ( not ( = ?auto_349301 ?auto_349304 ) ) ( not ( = ?auto_349301 ?auto_349305 ) ) ( not ( = ?auto_349301 ?auto_349306 ) ) ( not ( = ?auto_349301 ?auto_349307 ) ) ( not ( = ?auto_349301 ?auto_349308 ) ) ( not ( = ?auto_349301 ?auto_349309 ) ) ( not ( = ?auto_349302 ?auto_349303 ) ) ( not ( = ?auto_349302 ?auto_349304 ) ) ( not ( = ?auto_349302 ?auto_349305 ) ) ( not ( = ?auto_349302 ?auto_349306 ) ) ( not ( = ?auto_349302 ?auto_349307 ) ) ( not ( = ?auto_349302 ?auto_349308 ) ) ( not ( = ?auto_349302 ?auto_349309 ) ) ( not ( = ?auto_349303 ?auto_349304 ) ) ( not ( = ?auto_349303 ?auto_349305 ) ) ( not ( = ?auto_349303 ?auto_349306 ) ) ( not ( = ?auto_349303 ?auto_349307 ) ) ( not ( = ?auto_349303 ?auto_349308 ) ) ( not ( = ?auto_349303 ?auto_349309 ) ) ( not ( = ?auto_349304 ?auto_349305 ) ) ( not ( = ?auto_349304 ?auto_349306 ) ) ( not ( = ?auto_349304 ?auto_349307 ) ) ( not ( = ?auto_349304 ?auto_349308 ) ) ( not ( = ?auto_349304 ?auto_349309 ) ) ( not ( = ?auto_349305 ?auto_349306 ) ) ( not ( = ?auto_349305 ?auto_349307 ) ) ( not ( = ?auto_349305 ?auto_349308 ) ) ( not ( = ?auto_349305 ?auto_349309 ) ) ( not ( = ?auto_349306 ?auto_349307 ) ) ( not ( = ?auto_349306 ?auto_349308 ) ) ( not ( = ?auto_349306 ?auto_349309 ) ) ( not ( = ?auto_349307 ?auto_349308 ) ) ( not ( = ?auto_349307 ?auto_349309 ) ) ( not ( = ?auto_349308 ?auto_349309 ) ) ( ON ?auto_349307 ?auto_349308 ) ( ON ?auto_349306 ?auto_349307 ) ( ON ?auto_349305 ?auto_349306 ) ( ON ?auto_349304 ?auto_349305 ) ( ON ?auto_349303 ?auto_349304 ) ( ON ?auto_349302 ?auto_349303 ) ( CLEAR ?auto_349300 ) ( ON ?auto_349301 ?auto_349302 ) ( CLEAR ?auto_349301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_349299 ?auto_349300 ?auto_349301 )
      ( MAKE-10PILE ?auto_349299 ?auto_349300 ?auto_349301 ?auto_349302 ?auto_349303 ?auto_349304 ?auto_349305 ?auto_349306 ?auto_349307 ?auto_349308 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349320 - BLOCK
      ?auto_349321 - BLOCK
      ?auto_349322 - BLOCK
      ?auto_349323 - BLOCK
      ?auto_349324 - BLOCK
      ?auto_349325 - BLOCK
      ?auto_349326 - BLOCK
      ?auto_349327 - BLOCK
      ?auto_349328 - BLOCK
      ?auto_349329 - BLOCK
    )
    :vars
    (
      ?auto_349330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349329 ?auto_349330 ) ( ON-TABLE ?auto_349320 ) ( ON ?auto_349321 ?auto_349320 ) ( not ( = ?auto_349320 ?auto_349321 ) ) ( not ( = ?auto_349320 ?auto_349322 ) ) ( not ( = ?auto_349320 ?auto_349323 ) ) ( not ( = ?auto_349320 ?auto_349324 ) ) ( not ( = ?auto_349320 ?auto_349325 ) ) ( not ( = ?auto_349320 ?auto_349326 ) ) ( not ( = ?auto_349320 ?auto_349327 ) ) ( not ( = ?auto_349320 ?auto_349328 ) ) ( not ( = ?auto_349320 ?auto_349329 ) ) ( not ( = ?auto_349320 ?auto_349330 ) ) ( not ( = ?auto_349321 ?auto_349322 ) ) ( not ( = ?auto_349321 ?auto_349323 ) ) ( not ( = ?auto_349321 ?auto_349324 ) ) ( not ( = ?auto_349321 ?auto_349325 ) ) ( not ( = ?auto_349321 ?auto_349326 ) ) ( not ( = ?auto_349321 ?auto_349327 ) ) ( not ( = ?auto_349321 ?auto_349328 ) ) ( not ( = ?auto_349321 ?auto_349329 ) ) ( not ( = ?auto_349321 ?auto_349330 ) ) ( not ( = ?auto_349322 ?auto_349323 ) ) ( not ( = ?auto_349322 ?auto_349324 ) ) ( not ( = ?auto_349322 ?auto_349325 ) ) ( not ( = ?auto_349322 ?auto_349326 ) ) ( not ( = ?auto_349322 ?auto_349327 ) ) ( not ( = ?auto_349322 ?auto_349328 ) ) ( not ( = ?auto_349322 ?auto_349329 ) ) ( not ( = ?auto_349322 ?auto_349330 ) ) ( not ( = ?auto_349323 ?auto_349324 ) ) ( not ( = ?auto_349323 ?auto_349325 ) ) ( not ( = ?auto_349323 ?auto_349326 ) ) ( not ( = ?auto_349323 ?auto_349327 ) ) ( not ( = ?auto_349323 ?auto_349328 ) ) ( not ( = ?auto_349323 ?auto_349329 ) ) ( not ( = ?auto_349323 ?auto_349330 ) ) ( not ( = ?auto_349324 ?auto_349325 ) ) ( not ( = ?auto_349324 ?auto_349326 ) ) ( not ( = ?auto_349324 ?auto_349327 ) ) ( not ( = ?auto_349324 ?auto_349328 ) ) ( not ( = ?auto_349324 ?auto_349329 ) ) ( not ( = ?auto_349324 ?auto_349330 ) ) ( not ( = ?auto_349325 ?auto_349326 ) ) ( not ( = ?auto_349325 ?auto_349327 ) ) ( not ( = ?auto_349325 ?auto_349328 ) ) ( not ( = ?auto_349325 ?auto_349329 ) ) ( not ( = ?auto_349325 ?auto_349330 ) ) ( not ( = ?auto_349326 ?auto_349327 ) ) ( not ( = ?auto_349326 ?auto_349328 ) ) ( not ( = ?auto_349326 ?auto_349329 ) ) ( not ( = ?auto_349326 ?auto_349330 ) ) ( not ( = ?auto_349327 ?auto_349328 ) ) ( not ( = ?auto_349327 ?auto_349329 ) ) ( not ( = ?auto_349327 ?auto_349330 ) ) ( not ( = ?auto_349328 ?auto_349329 ) ) ( not ( = ?auto_349328 ?auto_349330 ) ) ( not ( = ?auto_349329 ?auto_349330 ) ) ( ON ?auto_349328 ?auto_349329 ) ( ON ?auto_349327 ?auto_349328 ) ( ON ?auto_349326 ?auto_349327 ) ( ON ?auto_349325 ?auto_349326 ) ( ON ?auto_349324 ?auto_349325 ) ( ON ?auto_349323 ?auto_349324 ) ( CLEAR ?auto_349321 ) ( ON ?auto_349322 ?auto_349323 ) ( CLEAR ?auto_349322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_349320 ?auto_349321 ?auto_349322 )
      ( MAKE-10PILE ?auto_349320 ?auto_349321 ?auto_349322 ?auto_349323 ?auto_349324 ?auto_349325 ?auto_349326 ?auto_349327 ?auto_349328 ?auto_349329 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349341 - BLOCK
      ?auto_349342 - BLOCK
      ?auto_349343 - BLOCK
      ?auto_349344 - BLOCK
      ?auto_349345 - BLOCK
      ?auto_349346 - BLOCK
      ?auto_349347 - BLOCK
      ?auto_349348 - BLOCK
      ?auto_349349 - BLOCK
      ?auto_349350 - BLOCK
    )
    :vars
    (
      ?auto_349351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349350 ?auto_349351 ) ( ON-TABLE ?auto_349341 ) ( not ( = ?auto_349341 ?auto_349342 ) ) ( not ( = ?auto_349341 ?auto_349343 ) ) ( not ( = ?auto_349341 ?auto_349344 ) ) ( not ( = ?auto_349341 ?auto_349345 ) ) ( not ( = ?auto_349341 ?auto_349346 ) ) ( not ( = ?auto_349341 ?auto_349347 ) ) ( not ( = ?auto_349341 ?auto_349348 ) ) ( not ( = ?auto_349341 ?auto_349349 ) ) ( not ( = ?auto_349341 ?auto_349350 ) ) ( not ( = ?auto_349341 ?auto_349351 ) ) ( not ( = ?auto_349342 ?auto_349343 ) ) ( not ( = ?auto_349342 ?auto_349344 ) ) ( not ( = ?auto_349342 ?auto_349345 ) ) ( not ( = ?auto_349342 ?auto_349346 ) ) ( not ( = ?auto_349342 ?auto_349347 ) ) ( not ( = ?auto_349342 ?auto_349348 ) ) ( not ( = ?auto_349342 ?auto_349349 ) ) ( not ( = ?auto_349342 ?auto_349350 ) ) ( not ( = ?auto_349342 ?auto_349351 ) ) ( not ( = ?auto_349343 ?auto_349344 ) ) ( not ( = ?auto_349343 ?auto_349345 ) ) ( not ( = ?auto_349343 ?auto_349346 ) ) ( not ( = ?auto_349343 ?auto_349347 ) ) ( not ( = ?auto_349343 ?auto_349348 ) ) ( not ( = ?auto_349343 ?auto_349349 ) ) ( not ( = ?auto_349343 ?auto_349350 ) ) ( not ( = ?auto_349343 ?auto_349351 ) ) ( not ( = ?auto_349344 ?auto_349345 ) ) ( not ( = ?auto_349344 ?auto_349346 ) ) ( not ( = ?auto_349344 ?auto_349347 ) ) ( not ( = ?auto_349344 ?auto_349348 ) ) ( not ( = ?auto_349344 ?auto_349349 ) ) ( not ( = ?auto_349344 ?auto_349350 ) ) ( not ( = ?auto_349344 ?auto_349351 ) ) ( not ( = ?auto_349345 ?auto_349346 ) ) ( not ( = ?auto_349345 ?auto_349347 ) ) ( not ( = ?auto_349345 ?auto_349348 ) ) ( not ( = ?auto_349345 ?auto_349349 ) ) ( not ( = ?auto_349345 ?auto_349350 ) ) ( not ( = ?auto_349345 ?auto_349351 ) ) ( not ( = ?auto_349346 ?auto_349347 ) ) ( not ( = ?auto_349346 ?auto_349348 ) ) ( not ( = ?auto_349346 ?auto_349349 ) ) ( not ( = ?auto_349346 ?auto_349350 ) ) ( not ( = ?auto_349346 ?auto_349351 ) ) ( not ( = ?auto_349347 ?auto_349348 ) ) ( not ( = ?auto_349347 ?auto_349349 ) ) ( not ( = ?auto_349347 ?auto_349350 ) ) ( not ( = ?auto_349347 ?auto_349351 ) ) ( not ( = ?auto_349348 ?auto_349349 ) ) ( not ( = ?auto_349348 ?auto_349350 ) ) ( not ( = ?auto_349348 ?auto_349351 ) ) ( not ( = ?auto_349349 ?auto_349350 ) ) ( not ( = ?auto_349349 ?auto_349351 ) ) ( not ( = ?auto_349350 ?auto_349351 ) ) ( ON ?auto_349349 ?auto_349350 ) ( ON ?auto_349348 ?auto_349349 ) ( ON ?auto_349347 ?auto_349348 ) ( ON ?auto_349346 ?auto_349347 ) ( ON ?auto_349345 ?auto_349346 ) ( ON ?auto_349344 ?auto_349345 ) ( ON ?auto_349343 ?auto_349344 ) ( CLEAR ?auto_349341 ) ( ON ?auto_349342 ?auto_349343 ) ( CLEAR ?auto_349342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_349341 ?auto_349342 )
      ( MAKE-10PILE ?auto_349341 ?auto_349342 ?auto_349343 ?auto_349344 ?auto_349345 ?auto_349346 ?auto_349347 ?auto_349348 ?auto_349349 ?auto_349350 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349362 - BLOCK
      ?auto_349363 - BLOCK
      ?auto_349364 - BLOCK
      ?auto_349365 - BLOCK
      ?auto_349366 - BLOCK
      ?auto_349367 - BLOCK
      ?auto_349368 - BLOCK
      ?auto_349369 - BLOCK
      ?auto_349370 - BLOCK
      ?auto_349371 - BLOCK
    )
    :vars
    (
      ?auto_349372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349371 ?auto_349372 ) ( ON-TABLE ?auto_349362 ) ( not ( = ?auto_349362 ?auto_349363 ) ) ( not ( = ?auto_349362 ?auto_349364 ) ) ( not ( = ?auto_349362 ?auto_349365 ) ) ( not ( = ?auto_349362 ?auto_349366 ) ) ( not ( = ?auto_349362 ?auto_349367 ) ) ( not ( = ?auto_349362 ?auto_349368 ) ) ( not ( = ?auto_349362 ?auto_349369 ) ) ( not ( = ?auto_349362 ?auto_349370 ) ) ( not ( = ?auto_349362 ?auto_349371 ) ) ( not ( = ?auto_349362 ?auto_349372 ) ) ( not ( = ?auto_349363 ?auto_349364 ) ) ( not ( = ?auto_349363 ?auto_349365 ) ) ( not ( = ?auto_349363 ?auto_349366 ) ) ( not ( = ?auto_349363 ?auto_349367 ) ) ( not ( = ?auto_349363 ?auto_349368 ) ) ( not ( = ?auto_349363 ?auto_349369 ) ) ( not ( = ?auto_349363 ?auto_349370 ) ) ( not ( = ?auto_349363 ?auto_349371 ) ) ( not ( = ?auto_349363 ?auto_349372 ) ) ( not ( = ?auto_349364 ?auto_349365 ) ) ( not ( = ?auto_349364 ?auto_349366 ) ) ( not ( = ?auto_349364 ?auto_349367 ) ) ( not ( = ?auto_349364 ?auto_349368 ) ) ( not ( = ?auto_349364 ?auto_349369 ) ) ( not ( = ?auto_349364 ?auto_349370 ) ) ( not ( = ?auto_349364 ?auto_349371 ) ) ( not ( = ?auto_349364 ?auto_349372 ) ) ( not ( = ?auto_349365 ?auto_349366 ) ) ( not ( = ?auto_349365 ?auto_349367 ) ) ( not ( = ?auto_349365 ?auto_349368 ) ) ( not ( = ?auto_349365 ?auto_349369 ) ) ( not ( = ?auto_349365 ?auto_349370 ) ) ( not ( = ?auto_349365 ?auto_349371 ) ) ( not ( = ?auto_349365 ?auto_349372 ) ) ( not ( = ?auto_349366 ?auto_349367 ) ) ( not ( = ?auto_349366 ?auto_349368 ) ) ( not ( = ?auto_349366 ?auto_349369 ) ) ( not ( = ?auto_349366 ?auto_349370 ) ) ( not ( = ?auto_349366 ?auto_349371 ) ) ( not ( = ?auto_349366 ?auto_349372 ) ) ( not ( = ?auto_349367 ?auto_349368 ) ) ( not ( = ?auto_349367 ?auto_349369 ) ) ( not ( = ?auto_349367 ?auto_349370 ) ) ( not ( = ?auto_349367 ?auto_349371 ) ) ( not ( = ?auto_349367 ?auto_349372 ) ) ( not ( = ?auto_349368 ?auto_349369 ) ) ( not ( = ?auto_349368 ?auto_349370 ) ) ( not ( = ?auto_349368 ?auto_349371 ) ) ( not ( = ?auto_349368 ?auto_349372 ) ) ( not ( = ?auto_349369 ?auto_349370 ) ) ( not ( = ?auto_349369 ?auto_349371 ) ) ( not ( = ?auto_349369 ?auto_349372 ) ) ( not ( = ?auto_349370 ?auto_349371 ) ) ( not ( = ?auto_349370 ?auto_349372 ) ) ( not ( = ?auto_349371 ?auto_349372 ) ) ( ON ?auto_349370 ?auto_349371 ) ( ON ?auto_349369 ?auto_349370 ) ( ON ?auto_349368 ?auto_349369 ) ( ON ?auto_349367 ?auto_349368 ) ( ON ?auto_349366 ?auto_349367 ) ( ON ?auto_349365 ?auto_349366 ) ( ON ?auto_349364 ?auto_349365 ) ( CLEAR ?auto_349362 ) ( ON ?auto_349363 ?auto_349364 ) ( CLEAR ?auto_349363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_349362 ?auto_349363 )
      ( MAKE-10PILE ?auto_349362 ?auto_349363 ?auto_349364 ?auto_349365 ?auto_349366 ?auto_349367 ?auto_349368 ?auto_349369 ?auto_349370 ?auto_349371 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349383 - BLOCK
      ?auto_349384 - BLOCK
      ?auto_349385 - BLOCK
      ?auto_349386 - BLOCK
      ?auto_349387 - BLOCK
      ?auto_349388 - BLOCK
      ?auto_349389 - BLOCK
      ?auto_349390 - BLOCK
      ?auto_349391 - BLOCK
      ?auto_349392 - BLOCK
    )
    :vars
    (
      ?auto_349393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349392 ?auto_349393 ) ( not ( = ?auto_349383 ?auto_349384 ) ) ( not ( = ?auto_349383 ?auto_349385 ) ) ( not ( = ?auto_349383 ?auto_349386 ) ) ( not ( = ?auto_349383 ?auto_349387 ) ) ( not ( = ?auto_349383 ?auto_349388 ) ) ( not ( = ?auto_349383 ?auto_349389 ) ) ( not ( = ?auto_349383 ?auto_349390 ) ) ( not ( = ?auto_349383 ?auto_349391 ) ) ( not ( = ?auto_349383 ?auto_349392 ) ) ( not ( = ?auto_349383 ?auto_349393 ) ) ( not ( = ?auto_349384 ?auto_349385 ) ) ( not ( = ?auto_349384 ?auto_349386 ) ) ( not ( = ?auto_349384 ?auto_349387 ) ) ( not ( = ?auto_349384 ?auto_349388 ) ) ( not ( = ?auto_349384 ?auto_349389 ) ) ( not ( = ?auto_349384 ?auto_349390 ) ) ( not ( = ?auto_349384 ?auto_349391 ) ) ( not ( = ?auto_349384 ?auto_349392 ) ) ( not ( = ?auto_349384 ?auto_349393 ) ) ( not ( = ?auto_349385 ?auto_349386 ) ) ( not ( = ?auto_349385 ?auto_349387 ) ) ( not ( = ?auto_349385 ?auto_349388 ) ) ( not ( = ?auto_349385 ?auto_349389 ) ) ( not ( = ?auto_349385 ?auto_349390 ) ) ( not ( = ?auto_349385 ?auto_349391 ) ) ( not ( = ?auto_349385 ?auto_349392 ) ) ( not ( = ?auto_349385 ?auto_349393 ) ) ( not ( = ?auto_349386 ?auto_349387 ) ) ( not ( = ?auto_349386 ?auto_349388 ) ) ( not ( = ?auto_349386 ?auto_349389 ) ) ( not ( = ?auto_349386 ?auto_349390 ) ) ( not ( = ?auto_349386 ?auto_349391 ) ) ( not ( = ?auto_349386 ?auto_349392 ) ) ( not ( = ?auto_349386 ?auto_349393 ) ) ( not ( = ?auto_349387 ?auto_349388 ) ) ( not ( = ?auto_349387 ?auto_349389 ) ) ( not ( = ?auto_349387 ?auto_349390 ) ) ( not ( = ?auto_349387 ?auto_349391 ) ) ( not ( = ?auto_349387 ?auto_349392 ) ) ( not ( = ?auto_349387 ?auto_349393 ) ) ( not ( = ?auto_349388 ?auto_349389 ) ) ( not ( = ?auto_349388 ?auto_349390 ) ) ( not ( = ?auto_349388 ?auto_349391 ) ) ( not ( = ?auto_349388 ?auto_349392 ) ) ( not ( = ?auto_349388 ?auto_349393 ) ) ( not ( = ?auto_349389 ?auto_349390 ) ) ( not ( = ?auto_349389 ?auto_349391 ) ) ( not ( = ?auto_349389 ?auto_349392 ) ) ( not ( = ?auto_349389 ?auto_349393 ) ) ( not ( = ?auto_349390 ?auto_349391 ) ) ( not ( = ?auto_349390 ?auto_349392 ) ) ( not ( = ?auto_349390 ?auto_349393 ) ) ( not ( = ?auto_349391 ?auto_349392 ) ) ( not ( = ?auto_349391 ?auto_349393 ) ) ( not ( = ?auto_349392 ?auto_349393 ) ) ( ON ?auto_349391 ?auto_349392 ) ( ON ?auto_349390 ?auto_349391 ) ( ON ?auto_349389 ?auto_349390 ) ( ON ?auto_349388 ?auto_349389 ) ( ON ?auto_349387 ?auto_349388 ) ( ON ?auto_349386 ?auto_349387 ) ( ON ?auto_349385 ?auto_349386 ) ( ON ?auto_349384 ?auto_349385 ) ( ON ?auto_349383 ?auto_349384 ) ( CLEAR ?auto_349383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_349383 )
      ( MAKE-10PILE ?auto_349383 ?auto_349384 ?auto_349385 ?auto_349386 ?auto_349387 ?auto_349388 ?auto_349389 ?auto_349390 ?auto_349391 ?auto_349392 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_349404 - BLOCK
      ?auto_349405 - BLOCK
      ?auto_349406 - BLOCK
      ?auto_349407 - BLOCK
      ?auto_349408 - BLOCK
      ?auto_349409 - BLOCK
      ?auto_349410 - BLOCK
      ?auto_349411 - BLOCK
      ?auto_349412 - BLOCK
      ?auto_349413 - BLOCK
    )
    :vars
    (
      ?auto_349414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349413 ?auto_349414 ) ( not ( = ?auto_349404 ?auto_349405 ) ) ( not ( = ?auto_349404 ?auto_349406 ) ) ( not ( = ?auto_349404 ?auto_349407 ) ) ( not ( = ?auto_349404 ?auto_349408 ) ) ( not ( = ?auto_349404 ?auto_349409 ) ) ( not ( = ?auto_349404 ?auto_349410 ) ) ( not ( = ?auto_349404 ?auto_349411 ) ) ( not ( = ?auto_349404 ?auto_349412 ) ) ( not ( = ?auto_349404 ?auto_349413 ) ) ( not ( = ?auto_349404 ?auto_349414 ) ) ( not ( = ?auto_349405 ?auto_349406 ) ) ( not ( = ?auto_349405 ?auto_349407 ) ) ( not ( = ?auto_349405 ?auto_349408 ) ) ( not ( = ?auto_349405 ?auto_349409 ) ) ( not ( = ?auto_349405 ?auto_349410 ) ) ( not ( = ?auto_349405 ?auto_349411 ) ) ( not ( = ?auto_349405 ?auto_349412 ) ) ( not ( = ?auto_349405 ?auto_349413 ) ) ( not ( = ?auto_349405 ?auto_349414 ) ) ( not ( = ?auto_349406 ?auto_349407 ) ) ( not ( = ?auto_349406 ?auto_349408 ) ) ( not ( = ?auto_349406 ?auto_349409 ) ) ( not ( = ?auto_349406 ?auto_349410 ) ) ( not ( = ?auto_349406 ?auto_349411 ) ) ( not ( = ?auto_349406 ?auto_349412 ) ) ( not ( = ?auto_349406 ?auto_349413 ) ) ( not ( = ?auto_349406 ?auto_349414 ) ) ( not ( = ?auto_349407 ?auto_349408 ) ) ( not ( = ?auto_349407 ?auto_349409 ) ) ( not ( = ?auto_349407 ?auto_349410 ) ) ( not ( = ?auto_349407 ?auto_349411 ) ) ( not ( = ?auto_349407 ?auto_349412 ) ) ( not ( = ?auto_349407 ?auto_349413 ) ) ( not ( = ?auto_349407 ?auto_349414 ) ) ( not ( = ?auto_349408 ?auto_349409 ) ) ( not ( = ?auto_349408 ?auto_349410 ) ) ( not ( = ?auto_349408 ?auto_349411 ) ) ( not ( = ?auto_349408 ?auto_349412 ) ) ( not ( = ?auto_349408 ?auto_349413 ) ) ( not ( = ?auto_349408 ?auto_349414 ) ) ( not ( = ?auto_349409 ?auto_349410 ) ) ( not ( = ?auto_349409 ?auto_349411 ) ) ( not ( = ?auto_349409 ?auto_349412 ) ) ( not ( = ?auto_349409 ?auto_349413 ) ) ( not ( = ?auto_349409 ?auto_349414 ) ) ( not ( = ?auto_349410 ?auto_349411 ) ) ( not ( = ?auto_349410 ?auto_349412 ) ) ( not ( = ?auto_349410 ?auto_349413 ) ) ( not ( = ?auto_349410 ?auto_349414 ) ) ( not ( = ?auto_349411 ?auto_349412 ) ) ( not ( = ?auto_349411 ?auto_349413 ) ) ( not ( = ?auto_349411 ?auto_349414 ) ) ( not ( = ?auto_349412 ?auto_349413 ) ) ( not ( = ?auto_349412 ?auto_349414 ) ) ( not ( = ?auto_349413 ?auto_349414 ) ) ( ON ?auto_349412 ?auto_349413 ) ( ON ?auto_349411 ?auto_349412 ) ( ON ?auto_349410 ?auto_349411 ) ( ON ?auto_349409 ?auto_349410 ) ( ON ?auto_349408 ?auto_349409 ) ( ON ?auto_349407 ?auto_349408 ) ( ON ?auto_349406 ?auto_349407 ) ( ON ?auto_349405 ?auto_349406 ) ( ON ?auto_349404 ?auto_349405 ) ( CLEAR ?auto_349404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_349404 )
      ( MAKE-10PILE ?auto_349404 ?auto_349405 ?auto_349406 ?auto_349407 ?auto_349408 ?auto_349409 ?auto_349410 ?auto_349411 ?auto_349412 ?auto_349413 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349426 - BLOCK
      ?auto_349427 - BLOCK
      ?auto_349428 - BLOCK
      ?auto_349429 - BLOCK
      ?auto_349430 - BLOCK
      ?auto_349431 - BLOCK
      ?auto_349432 - BLOCK
      ?auto_349433 - BLOCK
      ?auto_349434 - BLOCK
      ?auto_349435 - BLOCK
      ?auto_349436 - BLOCK
    )
    :vars
    (
      ?auto_349437 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_349435 ) ( ON ?auto_349436 ?auto_349437 ) ( CLEAR ?auto_349436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_349426 ) ( ON ?auto_349427 ?auto_349426 ) ( ON ?auto_349428 ?auto_349427 ) ( ON ?auto_349429 ?auto_349428 ) ( ON ?auto_349430 ?auto_349429 ) ( ON ?auto_349431 ?auto_349430 ) ( ON ?auto_349432 ?auto_349431 ) ( ON ?auto_349433 ?auto_349432 ) ( ON ?auto_349434 ?auto_349433 ) ( ON ?auto_349435 ?auto_349434 ) ( not ( = ?auto_349426 ?auto_349427 ) ) ( not ( = ?auto_349426 ?auto_349428 ) ) ( not ( = ?auto_349426 ?auto_349429 ) ) ( not ( = ?auto_349426 ?auto_349430 ) ) ( not ( = ?auto_349426 ?auto_349431 ) ) ( not ( = ?auto_349426 ?auto_349432 ) ) ( not ( = ?auto_349426 ?auto_349433 ) ) ( not ( = ?auto_349426 ?auto_349434 ) ) ( not ( = ?auto_349426 ?auto_349435 ) ) ( not ( = ?auto_349426 ?auto_349436 ) ) ( not ( = ?auto_349426 ?auto_349437 ) ) ( not ( = ?auto_349427 ?auto_349428 ) ) ( not ( = ?auto_349427 ?auto_349429 ) ) ( not ( = ?auto_349427 ?auto_349430 ) ) ( not ( = ?auto_349427 ?auto_349431 ) ) ( not ( = ?auto_349427 ?auto_349432 ) ) ( not ( = ?auto_349427 ?auto_349433 ) ) ( not ( = ?auto_349427 ?auto_349434 ) ) ( not ( = ?auto_349427 ?auto_349435 ) ) ( not ( = ?auto_349427 ?auto_349436 ) ) ( not ( = ?auto_349427 ?auto_349437 ) ) ( not ( = ?auto_349428 ?auto_349429 ) ) ( not ( = ?auto_349428 ?auto_349430 ) ) ( not ( = ?auto_349428 ?auto_349431 ) ) ( not ( = ?auto_349428 ?auto_349432 ) ) ( not ( = ?auto_349428 ?auto_349433 ) ) ( not ( = ?auto_349428 ?auto_349434 ) ) ( not ( = ?auto_349428 ?auto_349435 ) ) ( not ( = ?auto_349428 ?auto_349436 ) ) ( not ( = ?auto_349428 ?auto_349437 ) ) ( not ( = ?auto_349429 ?auto_349430 ) ) ( not ( = ?auto_349429 ?auto_349431 ) ) ( not ( = ?auto_349429 ?auto_349432 ) ) ( not ( = ?auto_349429 ?auto_349433 ) ) ( not ( = ?auto_349429 ?auto_349434 ) ) ( not ( = ?auto_349429 ?auto_349435 ) ) ( not ( = ?auto_349429 ?auto_349436 ) ) ( not ( = ?auto_349429 ?auto_349437 ) ) ( not ( = ?auto_349430 ?auto_349431 ) ) ( not ( = ?auto_349430 ?auto_349432 ) ) ( not ( = ?auto_349430 ?auto_349433 ) ) ( not ( = ?auto_349430 ?auto_349434 ) ) ( not ( = ?auto_349430 ?auto_349435 ) ) ( not ( = ?auto_349430 ?auto_349436 ) ) ( not ( = ?auto_349430 ?auto_349437 ) ) ( not ( = ?auto_349431 ?auto_349432 ) ) ( not ( = ?auto_349431 ?auto_349433 ) ) ( not ( = ?auto_349431 ?auto_349434 ) ) ( not ( = ?auto_349431 ?auto_349435 ) ) ( not ( = ?auto_349431 ?auto_349436 ) ) ( not ( = ?auto_349431 ?auto_349437 ) ) ( not ( = ?auto_349432 ?auto_349433 ) ) ( not ( = ?auto_349432 ?auto_349434 ) ) ( not ( = ?auto_349432 ?auto_349435 ) ) ( not ( = ?auto_349432 ?auto_349436 ) ) ( not ( = ?auto_349432 ?auto_349437 ) ) ( not ( = ?auto_349433 ?auto_349434 ) ) ( not ( = ?auto_349433 ?auto_349435 ) ) ( not ( = ?auto_349433 ?auto_349436 ) ) ( not ( = ?auto_349433 ?auto_349437 ) ) ( not ( = ?auto_349434 ?auto_349435 ) ) ( not ( = ?auto_349434 ?auto_349436 ) ) ( not ( = ?auto_349434 ?auto_349437 ) ) ( not ( = ?auto_349435 ?auto_349436 ) ) ( not ( = ?auto_349435 ?auto_349437 ) ) ( not ( = ?auto_349436 ?auto_349437 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_349436 ?auto_349437 )
      ( !STACK ?auto_349436 ?auto_349435 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349449 - BLOCK
      ?auto_349450 - BLOCK
      ?auto_349451 - BLOCK
      ?auto_349452 - BLOCK
      ?auto_349453 - BLOCK
      ?auto_349454 - BLOCK
      ?auto_349455 - BLOCK
      ?auto_349456 - BLOCK
      ?auto_349457 - BLOCK
      ?auto_349458 - BLOCK
      ?auto_349459 - BLOCK
    )
    :vars
    (
      ?auto_349460 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_349458 ) ( ON ?auto_349459 ?auto_349460 ) ( CLEAR ?auto_349459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_349449 ) ( ON ?auto_349450 ?auto_349449 ) ( ON ?auto_349451 ?auto_349450 ) ( ON ?auto_349452 ?auto_349451 ) ( ON ?auto_349453 ?auto_349452 ) ( ON ?auto_349454 ?auto_349453 ) ( ON ?auto_349455 ?auto_349454 ) ( ON ?auto_349456 ?auto_349455 ) ( ON ?auto_349457 ?auto_349456 ) ( ON ?auto_349458 ?auto_349457 ) ( not ( = ?auto_349449 ?auto_349450 ) ) ( not ( = ?auto_349449 ?auto_349451 ) ) ( not ( = ?auto_349449 ?auto_349452 ) ) ( not ( = ?auto_349449 ?auto_349453 ) ) ( not ( = ?auto_349449 ?auto_349454 ) ) ( not ( = ?auto_349449 ?auto_349455 ) ) ( not ( = ?auto_349449 ?auto_349456 ) ) ( not ( = ?auto_349449 ?auto_349457 ) ) ( not ( = ?auto_349449 ?auto_349458 ) ) ( not ( = ?auto_349449 ?auto_349459 ) ) ( not ( = ?auto_349449 ?auto_349460 ) ) ( not ( = ?auto_349450 ?auto_349451 ) ) ( not ( = ?auto_349450 ?auto_349452 ) ) ( not ( = ?auto_349450 ?auto_349453 ) ) ( not ( = ?auto_349450 ?auto_349454 ) ) ( not ( = ?auto_349450 ?auto_349455 ) ) ( not ( = ?auto_349450 ?auto_349456 ) ) ( not ( = ?auto_349450 ?auto_349457 ) ) ( not ( = ?auto_349450 ?auto_349458 ) ) ( not ( = ?auto_349450 ?auto_349459 ) ) ( not ( = ?auto_349450 ?auto_349460 ) ) ( not ( = ?auto_349451 ?auto_349452 ) ) ( not ( = ?auto_349451 ?auto_349453 ) ) ( not ( = ?auto_349451 ?auto_349454 ) ) ( not ( = ?auto_349451 ?auto_349455 ) ) ( not ( = ?auto_349451 ?auto_349456 ) ) ( not ( = ?auto_349451 ?auto_349457 ) ) ( not ( = ?auto_349451 ?auto_349458 ) ) ( not ( = ?auto_349451 ?auto_349459 ) ) ( not ( = ?auto_349451 ?auto_349460 ) ) ( not ( = ?auto_349452 ?auto_349453 ) ) ( not ( = ?auto_349452 ?auto_349454 ) ) ( not ( = ?auto_349452 ?auto_349455 ) ) ( not ( = ?auto_349452 ?auto_349456 ) ) ( not ( = ?auto_349452 ?auto_349457 ) ) ( not ( = ?auto_349452 ?auto_349458 ) ) ( not ( = ?auto_349452 ?auto_349459 ) ) ( not ( = ?auto_349452 ?auto_349460 ) ) ( not ( = ?auto_349453 ?auto_349454 ) ) ( not ( = ?auto_349453 ?auto_349455 ) ) ( not ( = ?auto_349453 ?auto_349456 ) ) ( not ( = ?auto_349453 ?auto_349457 ) ) ( not ( = ?auto_349453 ?auto_349458 ) ) ( not ( = ?auto_349453 ?auto_349459 ) ) ( not ( = ?auto_349453 ?auto_349460 ) ) ( not ( = ?auto_349454 ?auto_349455 ) ) ( not ( = ?auto_349454 ?auto_349456 ) ) ( not ( = ?auto_349454 ?auto_349457 ) ) ( not ( = ?auto_349454 ?auto_349458 ) ) ( not ( = ?auto_349454 ?auto_349459 ) ) ( not ( = ?auto_349454 ?auto_349460 ) ) ( not ( = ?auto_349455 ?auto_349456 ) ) ( not ( = ?auto_349455 ?auto_349457 ) ) ( not ( = ?auto_349455 ?auto_349458 ) ) ( not ( = ?auto_349455 ?auto_349459 ) ) ( not ( = ?auto_349455 ?auto_349460 ) ) ( not ( = ?auto_349456 ?auto_349457 ) ) ( not ( = ?auto_349456 ?auto_349458 ) ) ( not ( = ?auto_349456 ?auto_349459 ) ) ( not ( = ?auto_349456 ?auto_349460 ) ) ( not ( = ?auto_349457 ?auto_349458 ) ) ( not ( = ?auto_349457 ?auto_349459 ) ) ( not ( = ?auto_349457 ?auto_349460 ) ) ( not ( = ?auto_349458 ?auto_349459 ) ) ( not ( = ?auto_349458 ?auto_349460 ) ) ( not ( = ?auto_349459 ?auto_349460 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_349459 ?auto_349460 )
      ( !STACK ?auto_349459 ?auto_349458 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349472 - BLOCK
      ?auto_349473 - BLOCK
      ?auto_349474 - BLOCK
      ?auto_349475 - BLOCK
      ?auto_349476 - BLOCK
      ?auto_349477 - BLOCK
      ?auto_349478 - BLOCK
      ?auto_349479 - BLOCK
      ?auto_349480 - BLOCK
      ?auto_349481 - BLOCK
      ?auto_349482 - BLOCK
    )
    :vars
    (
      ?auto_349483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349482 ?auto_349483 ) ( ON-TABLE ?auto_349472 ) ( ON ?auto_349473 ?auto_349472 ) ( ON ?auto_349474 ?auto_349473 ) ( ON ?auto_349475 ?auto_349474 ) ( ON ?auto_349476 ?auto_349475 ) ( ON ?auto_349477 ?auto_349476 ) ( ON ?auto_349478 ?auto_349477 ) ( ON ?auto_349479 ?auto_349478 ) ( ON ?auto_349480 ?auto_349479 ) ( not ( = ?auto_349472 ?auto_349473 ) ) ( not ( = ?auto_349472 ?auto_349474 ) ) ( not ( = ?auto_349472 ?auto_349475 ) ) ( not ( = ?auto_349472 ?auto_349476 ) ) ( not ( = ?auto_349472 ?auto_349477 ) ) ( not ( = ?auto_349472 ?auto_349478 ) ) ( not ( = ?auto_349472 ?auto_349479 ) ) ( not ( = ?auto_349472 ?auto_349480 ) ) ( not ( = ?auto_349472 ?auto_349481 ) ) ( not ( = ?auto_349472 ?auto_349482 ) ) ( not ( = ?auto_349472 ?auto_349483 ) ) ( not ( = ?auto_349473 ?auto_349474 ) ) ( not ( = ?auto_349473 ?auto_349475 ) ) ( not ( = ?auto_349473 ?auto_349476 ) ) ( not ( = ?auto_349473 ?auto_349477 ) ) ( not ( = ?auto_349473 ?auto_349478 ) ) ( not ( = ?auto_349473 ?auto_349479 ) ) ( not ( = ?auto_349473 ?auto_349480 ) ) ( not ( = ?auto_349473 ?auto_349481 ) ) ( not ( = ?auto_349473 ?auto_349482 ) ) ( not ( = ?auto_349473 ?auto_349483 ) ) ( not ( = ?auto_349474 ?auto_349475 ) ) ( not ( = ?auto_349474 ?auto_349476 ) ) ( not ( = ?auto_349474 ?auto_349477 ) ) ( not ( = ?auto_349474 ?auto_349478 ) ) ( not ( = ?auto_349474 ?auto_349479 ) ) ( not ( = ?auto_349474 ?auto_349480 ) ) ( not ( = ?auto_349474 ?auto_349481 ) ) ( not ( = ?auto_349474 ?auto_349482 ) ) ( not ( = ?auto_349474 ?auto_349483 ) ) ( not ( = ?auto_349475 ?auto_349476 ) ) ( not ( = ?auto_349475 ?auto_349477 ) ) ( not ( = ?auto_349475 ?auto_349478 ) ) ( not ( = ?auto_349475 ?auto_349479 ) ) ( not ( = ?auto_349475 ?auto_349480 ) ) ( not ( = ?auto_349475 ?auto_349481 ) ) ( not ( = ?auto_349475 ?auto_349482 ) ) ( not ( = ?auto_349475 ?auto_349483 ) ) ( not ( = ?auto_349476 ?auto_349477 ) ) ( not ( = ?auto_349476 ?auto_349478 ) ) ( not ( = ?auto_349476 ?auto_349479 ) ) ( not ( = ?auto_349476 ?auto_349480 ) ) ( not ( = ?auto_349476 ?auto_349481 ) ) ( not ( = ?auto_349476 ?auto_349482 ) ) ( not ( = ?auto_349476 ?auto_349483 ) ) ( not ( = ?auto_349477 ?auto_349478 ) ) ( not ( = ?auto_349477 ?auto_349479 ) ) ( not ( = ?auto_349477 ?auto_349480 ) ) ( not ( = ?auto_349477 ?auto_349481 ) ) ( not ( = ?auto_349477 ?auto_349482 ) ) ( not ( = ?auto_349477 ?auto_349483 ) ) ( not ( = ?auto_349478 ?auto_349479 ) ) ( not ( = ?auto_349478 ?auto_349480 ) ) ( not ( = ?auto_349478 ?auto_349481 ) ) ( not ( = ?auto_349478 ?auto_349482 ) ) ( not ( = ?auto_349478 ?auto_349483 ) ) ( not ( = ?auto_349479 ?auto_349480 ) ) ( not ( = ?auto_349479 ?auto_349481 ) ) ( not ( = ?auto_349479 ?auto_349482 ) ) ( not ( = ?auto_349479 ?auto_349483 ) ) ( not ( = ?auto_349480 ?auto_349481 ) ) ( not ( = ?auto_349480 ?auto_349482 ) ) ( not ( = ?auto_349480 ?auto_349483 ) ) ( not ( = ?auto_349481 ?auto_349482 ) ) ( not ( = ?auto_349481 ?auto_349483 ) ) ( not ( = ?auto_349482 ?auto_349483 ) ) ( CLEAR ?auto_349480 ) ( ON ?auto_349481 ?auto_349482 ) ( CLEAR ?auto_349481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_349472 ?auto_349473 ?auto_349474 ?auto_349475 ?auto_349476 ?auto_349477 ?auto_349478 ?auto_349479 ?auto_349480 ?auto_349481 )
      ( MAKE-11PILE ?auto_349472 ?auto_349473 ?auto_349474 ?auto_349475 ?auto_349476 ?auto_349477 ?auto_349478 ?auto_349479 ?auto_349480 ?auto_349481 ?auto_349482 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349495 - BLOCK
      ?auto_349496 - BLOCK
      ?auto_349497 - BLOCK
      ?auto_349498 - BLOCK
      ?auto_349499 - BLOCK
      ?auto_349500 - BLOCK
      ?auto_349501 - BLOCK
      ?auto_349502 - BLOCK
      ?auto_349503 - BLOCK
      ?auto_349504 - BLOCK
      ?auto_349505 - BLOCK
    )
    :vars
    (
      ?auto_349506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349505 ?auto_349506 ) ( ON-TABLE ?auto_349495 ) ( ON ?auto_349496 ?auto_349495 ) ( ON ?auto_349497 ?auto_349496 ) ( ON ?auto_349498 ?auto_349497 ) ( ON ?auto_349499 ?auto_349498 ) ( ON ?auto_349500 ?auto_349499 ) ( ON ?auto_349501 ?auto_349500 ) ( ON ?auto_349502 ?auto_349501 ) ( ON ?auto_349503 ?auto_349502 ) ( not ( = ?auto_349495 ?auto_349496 ) ) ( not ( = ?auto_349495 ?auto_349497 ) ) ( not ( = ?auto_349495 ?auto_349498 ) ) ( not ( = ?auto_349495 ?auto_349499 ) ) ( not ( = ?auto_349495 ?auto_349500 ) ) ( not ( = ?auto_349495 ?auto_349501 ) ) ( not ( = ?auto_349495 ?auto_349502 ) ) ( not ( = ?auto_349495 ?auto_349503 ) ) ( not ( = ?auto_349495 ?auto_349504 ) ) ( not ( = ?auto_349495 ?auto_349505 ) ) ( not ( = ?auto_349495 ?auto_349506 ) ) ( not ( = ?auto_349496 ?auto_349497 ) ) ( not ( = ?auto_349496 ?auto_349498 ) ) ( not ( = ?auto_349496 ?auto_349499 ) ) ( not ( = ?auto_349496 ?auto_349500 ) ) ( not ( = ?auto_349496 ?auto_349501 ) ) ( not ( = ?auto_349496 ?auto_349502 ) ) ( not ( = ?auto_349496 ?auto_349503 ) ) ( not ( = ?auto_349496 ?auto_349504 ) ) ( not ( = ?auto_349496 ?auto_349505 ) ) ( not ( = ?auto_349496 ?auto_349506 ) ) ( not ( = ?auto_349497 ?auto_349498 ) ) ( not ( = ?auto_349497 ?auto_349499 ) ) ( not ( = ?auto_349497 ?auto_349500 ) ) ( not ( = ?auto_349497 ?auto_349501 ) ) ( not ( = ?auto_349497 ?auto_349502 ) ) ( not ( = ?auto_349497 ?auto_349503 ) ) ( not ( = ?auto_349497 ?auto_349504 ) ) ( not ( = ?auto_349497 ?auto_349505 ) ) ( not ( = ?auto_349497 ?auto_349506 ) ) ( not ( = ?auto_349498 ?auto_349499 ) ) ( not ( = ?auto_349498 ?auto_349500 ) ) ( not ( = ?auto_349498 ?auto_349501 ) ) ( not ( = ?auto_349498 ?auto_349502 ) ) ( not ( = ?auto_349498 ?auto_349503 ) ) ( not ( = ?auto_349498 ?auto_349504 ) ) ( not ( = ?auto_349498 ?auto_349505 ) ) ( not ( = ?auto_349498 ?auto_349506 ) ) ( not ( = ?auto_349499 ?auto_349500 ) ) ( not ( = ?auto_349499 ?auto_349501 ) ) ( not ( = ?auto_349499 ?auto_349502 ) ) ( not ( = ?auto_349499 ?auto_349503 ) ) ( not ( = ?auto_349499 ?auto_349504 ) ) ( not ( = ?auto_349499 ?auto_349505 ) ) ( not ( = ?auto_349499 ?auto_349506 ) ) ( not ( = ?auto_349500 ?auto_349501 ) ) ( not ( = ?auto_349500 ?auto_349502 ) ) ( not ( = ?auto_349500 ?auto_349503 ) ) ( not ( = ?auto_349500 ?auto_349504 ) ) ( not ( = ?auto_349500 ?auto_349505 ) ) ( not ( = ?auto_349500 ?auto_349506 ) ) ( not ( = ?auto_349501 ?auto_349502 ) ) ( not ( = ?auto_349501 ?auto_349503 ) ) ( not ( = ?auto_349501 ?auto_349504 ) ) ( not ( = ?auto_349501 ?auto_349505 ) ) ( not ( = ?auto_349501 ?auto_349506 ) ) ( not ( = ?auto_349502 ?auto_349503 ) ) ( not ( = ?auto_349502 ?auto_349504 ) ) ( not ( = ?auto_349502 ?auto_349505 ) ) ( not ( = ?auto_349502 ?auto_349506 ) ) ( not ( = ?auto_349503 ?auto_349504 ) ) ( not ( = ?auto_349503 ?auto_349505 ) ) ( not ( = ?auto_349503 ?auto_349506 ) ) ( not ( = ?auto_349504 ?auto_349505 ) ) ( not ( = ?auto_349504 ?auto_349506 ) ) ( not ( = ?auto_349505 ?auto_349506 ) ) ( CLEAR ?auto_349503 ) ( ON ?auto_349504 ?auto_349505 ) ( CLEAR ?auto_349504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_349495 ?auto_349496 ?auto_349497 ?auto_349498 ?auto_349499 ?auto_349500 ?auto_349501 ?auto_349502 ?auto_349503 ?auto_349504 )
      ( MAKE-11PILE ?auto_349495 ?auto_349496 ?auto_349497 ?auto_349498 ?auto_349499 ?auto_349500 ?auto_349501 ?auto_349502 ?auto_349503 ?auto_349504 ?auto_349505 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349518 - BLOCK
      ?auto_349519 - BLOCK
      ?auto_349520 - BLOCK
      ?auto_349521 - BLOCK
      ?auto_349522 - BLOCK
      ?auto_349523 - BLOCK
      ?auto_349524 - BLOCK
      ?auto_349525 - BLOCK
      ?auto_349526 - BLOCK
      ?auto_349527 - BLOCK
      ?auto_349528 - BLOCK
    )
    :vars
    (
      ?auto_349529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349528 ?auto_349529 ) ( ON-TABLE ?auto_349518 ) ( ON ?auto_349519 ?auto_349518 ) ( ON ?auto_349520 ?auto_349519 ) ( ON ?auto_349521 ?auto_349520 ) ( ON ?auto_349522 ?auto_349521 ) ( ON ?auto_349523 ?auto_349522 ) ( ON ?auto_349524 ?auto_349523 ) ( ON ?auto_349525 ?auto_349524 ) ( not ( = ?auto_349518 ?auto_349519 ) ) ( not ( = ?auto_349518 ?auto_349520 ) ) ( not ( = ?auto_349518 ?auto_349521 ) ) ( not ( = ?auto_349518 ?auto_349522 ) ) ( not ( = ?auto_349518 ?auto_349523 ) ) ( not ( = ?auto_349518 ?auto_349524 ) ) ( not ( = ?auto_349518 ?auto_349525 ) ) ( not ( = ?auto_349518 ?auto_349526 ) ) ( not ( = ?auto_349518 ?auto_349527 ) ) ( not ( = ?auto_349518 ?auto_349528 ) ) ( not ( = ?auto_349518 ?auto_349529 ) ) ( not ( = ?auto_349519 ?auto_349520 ) ) ( not ( = ?auto_349519 ?auto_349521 ) ) ( not ( = ?auto_349519 ?auto_349522 ) ) ( not ( = ?auto_349519 ?auto_349523 ) ) ( not ( = ?auto_349519 ?auto_349524 ) ) ( not ( = ?auto_349519 ?auto_349525 ) ) ( not ( = ?auto_349519 ?auto_349526 ) ) ( not ( = ?auto_349519 ?auto_349527 ) ) ( not ( = ?auto_349519 ?auto_349528 ) ) ( not ( = ?auto_349519 ?auto_349529 ) ) ( not ( = ?auto_349520 ?auto_349521 ) ) ( not ( = ?auto_349520 ?auto_349522 ) ) ( not ( = ?auto_349520 ?auto_349523 ) ) ( not ( = ?auto_349520 ?auto_349524 ) ) ( not ( = ?auto_349520 ?auto_349525 ) ) ( not ( = ?auto_349520 ?auto_349526 ) ) ( not ( = ?auto_349520 ?auto_349527 ) ) ( not ( = ?auto_349520 ?auto_349528 ) ) ( not ( = ?auto_349520 ?auto_349529 ) ) ( not ( = ?auto_349521 ?auto_349522 ) ) ( not ( = ?auto_349521 ?auto_349523 ) ) ( not ( = ?auto_349521 ?auto_349524 ) ) ( not ( = ?auto_349521 ?auto_349525 ) ) ( not ( = ?auto_349521 ?auto_349526 ) ) ( not ( = ?auto_349521 ?auto_349527 ) ) ( not ( = ?auto_349521 ?auto_349528 ) ) ( not ( = ?auto_349521 ?auto_349529 ) ) ( not ( = ?auto_349522 ?auto_349523 ) ) ( not ( = ?auto_349522 ?auto_349524 ) ) ( not ( = ?auto_349522 ?auto_349525 ) ) ( not ( = ?auto_349522 ?auto_349526 ) ) ( not ( = ?auto_349522 ?auto_349527 ) ) ( not ( = ?auto_349522 ?auto_349528 ) ) ( not ( = ?auto_349522 ?auto_349529 ) ) ( not ( = ?auto_349523 ?auto_349524 ) ) ( not ( = ?auto_349523 ?auto_349525 ) ) ( not ( = ?auto_349523 ?auto_349526 ) ) ( not ( = ?auto_349523 ?auto_349527 ) ) ( not ( = ?auto_349523 ?auto_349528 ) ) ( not ( = ?auto_349523 ?auto_349529 ) ) ( not ( = ?auto_349524 ?auto_349525 ) ) ( not ( = ?auto_349524 ?auto_349526 ) ) ( not ( = ?auto_349524 ?auto_349527 ) ) ( not ( = ?auto_349524 ?auto_349528 ) ) ( not ( = ?auto_349524 ?auto_349529 ) ) ( not ( = ?auto_349525 ?auto_349526 ) ) ( not ( = ?auto_349525 ?auto_349527 ) ) ( not ( = ?auto_349525 ?auto_349528 ) ) ( not ( = ?auto_349525 ?auto_349529 ) ) ( not ( = ?auto_349526 ?auto_349527 ) ) ( not ( = ?auto_349526 ?auto_349528 ) ) ( not ( = ?auto_349526 ?auto_349529 ) ) ( not ( = ?auto_349527 ?auto_349528 ) ) ( not ( = ?auto_349527 ?auto_349529 ) ) ( not ( = ?auto_349528 ?auto_349529 ) ) ( ON ?auto_349527 ?auto_349528 ) ( CLEAR ?auto_349525 ) ( ON ?auto_349526 ?auto_349527 ) ( CLEAR ?auto_349526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_349518 ?auto_349519 ?auto_349520 ?auto_349521 ?auto_349522 ?auto_349523 ?auto_349524 ?auto_349525 ?auto_349526 )
      ( MAKE-11PILE ?auto_349518 ?auto_349519 ?auto_349520 ?auto_349521 ?auto_349522 ?auto_349523 ?auto_349524 ?auto_349525 ?auto_349526 ?auto_349527 ?auto_349528 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349541 - BLOCK
      ?auto_349542 - BLOCK
      ?auto_349543 - BLOCK
      ?auto_349544 - BLOCK
      ?auto_349545 - BLOCK
      ?auto_349546 - BLOCK
      ?auto_349547 - BLOCK
      ?auto_349548 - BLOCK
      ?auto_349549 - BLOCK
      ?auto_349550 - BLOCK
      ?auto_349551 - BLOCK
    )
    :vars
    (
      ?auto_349552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349551 ?auto_349552 ) ( ON-TABLE ?auto_349541 ) ( ON ?auto_349542 ?auto_349541 ) ( ON ?auto_349543 ?auto_349542 ) ( ON ?auto_349544 ?auto_349543 ) ( ON ?auto_349545 ?auto_349544 ) ( ON ?auto_349546 ?auto_349545 ) ( ON ?auto_349547 ?auto_349546 ) ( ON ?auto_349548 ?auto_349547 ) ( not ( = ?auto_349541 ?auto_349542 ) ) ( not ( = ?auto_349541 ?auto_349543 ) ) ( not ( = ?auto_349541 ?auto_349544 ) ) ( not ( = ?auto_349541 ?auto_349545 ) ) ( not ( = ?auto_349541 ?auto_349546 ) ) ( not ( = ?auto_349541 ?auto_349547 ) ) ( not ( = ?auto_349541 ?auto_349548 ) ) ( not ( = ?auto_349541 ?auto_349549 ) ) ( not ( = ?auto_349541 ?auto_349550 ) ) ( not ( = ?auto_349541 ?auto_349551 ) ) ( not ( = ?auto_349541 ?auto_349552 ) ) ( not ( = ?auto_349542 ?auto_349543 ) ) ( not ( = ?auto_349542 ?auto_349544 ) ) ( not ( = ?auto_349542 ?auto_349545 ) ) ( not ( = ?auto_349542 ?auto_349546 ) ) ( not ( = ?auto_349542 ?auto_349547 ) ) ( not ( = ?auto_349542 ?auto_349548 ) ) ( not ( = ?auto_349542 ?auto_349549 ) ) ( not ( = ?auto_349542 ?auto_349550 ) ) ( not ( = ?auto_349542 ?auto_349551 ) ) ( not ( = ?auto_349542 ?auto_349552 ) ) ( not ( = ?auto_349543 ?auto_349544 ) ) ( not ( = ?auto_349543 ?auto_349545 ) ) ( not ( = ?auto_349543 ?auto_349546 ) ) ( not ( = ?auto_349543 ?auto_349547 ) ) ( not ( = ?auto_349543 ?auto_349548 ) ) ( not ( = ?auto_349543 ?auto_349549 ) ) ( not ( = ?auto_349543 ?auto_349550 ) ) ( not ( = ?auto_349543 ?auto_349551 ) ) ( not ( = ?auto_349543 ?auto_349552 ) ) ( not ( = ?auto_349544 ?auto_349545 ) ) ( not ( = ?auto_349544 ?auto_349546 ) ) ( not ( = ?auto_349544 ?auto_349547 ) ) ( not ( = ?auto_349544 ?auto_349548 ) ) ( not ( = ?auto_349544 ?auto_349549 ) ) ( not ( = ?auto_349544 ?auto_349550 ) ) ( not ( = ?auto_349544 ?auto_349551 ) ) ( not ( = ?auto_349544 ?auto_349552 ) ) ( not ( = ?auto_349545 ?auto_349546 ) ) ( not ( = ?auto_349545 ?auto_349547 ) ) ( not ( = ?auto_349545 ?auto_349548 ) ) ( not ( = ?auto_349545 ?auto_349549 ) ) ( not ( = ?auto_349545 ?auto_349550 ) ) ( not ( = ?auto_349545 ?auto_349551 ) ) ( not ( = ?auto_349545 ?auto_349552 ) ) ( not ( = ?auto_349546 ?auto_349547 ) ) ( not ( = ?auto_349546 ?auto_349548 ) ) ( not ( = ?auto_349546 ?auto_349549 ) ) ( not ( = ?auto_349546 ?auto_349550 ) ) ( not ( = ?auto_349546 ?auto_349551 ) ) ( not ( = ?auto_349546 ?auto_349552 ) ) ( not ( = ?auto_349547 ?auto_349548 ) ) ( not ( = ?auto_349547 ?auto_349549 ) ) ( not ( = ?auto_349547 ?auto_349550 ) ) ( not ( = ?auto_349547 ?auto_349551 ) ) ( not ( = ?auto_349547 ?auto_349552 ) ) ( not ( = ?auto_349548 ?auto_349549 ) ) ( not ( = ?auto_349548 ?auto_349550 ) ) ( not ( = ?auto_349548 ?auto_349551 ) ) ( not ( = ?auto_349548 ?auto_349552 ) ) ( not ( = ?auto_349549 ?auto_349550 ) ) ( not ( = ?auto_349549 ?auto_349551 ) ) ( not ( = ?auto_349549 ?auto_349552 ) ) ( not ( = ?auto_349550 ?auto_349551 ) ) ( not ( = ?auto_349550 ?auto_349552 ) ) ( not ( = ?auto_349551 ?auto_349552 ) ) ( ON ?auto_349550 ?auto_349551 ) ( CLEAR ?auto_349548 ) ( ON ?auto_349549 ?auto_349550 ) ( CLEAR ?auto_349549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_349541 ?auto_349542 ?auto_349543 ?auto_349544 ?auto_349545 ?auto_349546 ?auto_349547 ?auto_349548 ?auto_349549 )
      ( MAKE-11PILE ?auto_349541 ?auto_349542 ?auto_349543 ?auto_349544 ?auto_349545 ?auto_349546 ?auto_349547 ?auto_349548 ?auto_349549 ?auto_349550 ?auto_349551 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349564 - BLOCK
      ?auto_349565 - BLOCK
      ?auto_349566 - BLOCK
      ?auto_349567 - BLOCK
      ?auto_349568 - BLOCK
      ?auto_349569 - BLOCK
      ?auto_349570 - BLOCK
      ?auto_349571 - BLOCK
      ?auto_349572 - BLOCK
      ?auto_349573 - BLOCK
      ?auto_349574 - BLOCK
    )
    :vars
    (
      ?auto_349575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349574 ?auto_349575 ) ( ON-TABLE ?auto_349564 ) ( ON ?auto_349565 ?auto_349564 ) ( ON ?auto_349566 ?auto_349565 ) ( ON ?auto_349567 ?auto_349566 ) ( ON ?auto_349568 ?auto_349567 ) ( ON ?auto_349569 ?auto_349568 ) ( ON ?auto_349570 ?auto_349569 ) ( not ( = ?auto_349564 ?auto_349565 ) ) ( not ( = ?auto_349564 ?auto_349566 ) ) ( not ( = ?auto_349564 ?auto_349567 ) ) ( not ( = ?auto_349564 ?auto_349568 ) ) ( not ( = ?auto_349564 ?auto_349569 ) ) ( not ( = ?auto_349564 ?auto_349570 ) ) ( not ( = ?auto_349564 ?auto_349571 ) ) ( not ( = ?auto_349564 ?auto_349572 ) ) ( not ( = ?auto_349564 ?auto_349573 ) ) ( not ( = ?auto_349564 ?auto_349574 ) ) ( not ( = ?auto_349564 ?auto_349575 ) ) ( not ( = ?auto_349565 ?auto_349566 ) ) ( not ( = ?auto_349565 ?auto_349567 ) ) ( not ( = ?auto_349565 ?auto_349568 ) ) ( not ( = ?auto_349565 ?auto_349569 ) ) ( not ( = ?auto_349565 ?auto_349570 ) ) ( not ( = ?auto_349565 ?auto_349571 ) ) ( not ( = ?auto_349565 ?auto_349572 ) ) ( not ( = ?auto_349565 ?auto_349573 ) ) ( not ( = ?auto_349565 ?auto_349574 ) ) ( not ( = ?auto_349565 ?auto_349575 ) ) ( not ( = ?auto_349566 ?auto_349567 ) ) ( not ( = ?auto_349566 ?auto_349568 ) ) ( not ( = ?auto_349566 ?auto_349569 ) ) ( not ( = ?auto_349566 ?auto_349570 ) ) ( not ( = ?auto_349566 ?auto_349571 ) ) ( not ( = ?auto_349566 ?auto_349572 ) ) ( not ( = ?auto_349566 ?auto_349573 ) ) ( not ( = ?auto_349566 ?auto_349574 ) ) ( not ( = ?auto_349566 ?auto_349575 ) ) ( not ( = ?auto_349567 ?auto_349568 ) ) ( not ( = ?auto_349567 ?auto_349569 ) ) ( not ( = ?auto_349567 ?auto_349570 ) ) ( not ( = ?auto_349567 ?auto_349571 ) ) ( not ( = ?auto_349567 ?auto_349572 ) ) ( not ( = ?auto_349567 ?auto_349573 ) ) ( not ( = ?auto_349567 ?auto_349574 ) ) ( not ( = ?auto_349567 ?auto_349575 ) ) ( not ( = ?auto_349568 ?auto_349569 ) ) ( not ( = ?auto_349568 ?auto_349570 ) ) ( not ( = ?auto_349568 ?auto_349571 ) ) ( not ( = ?auto_349568 ?auto_349572 ) ) ( not ( = ?auto_349568 ?auto_349573 ) ) ( not ( = ?auto_349568 ?auto_349574 ) ) ( not ( = ?auto_349568 ?auto_349575 ) ) ( not ( = ?auto_349569 ?auto_349570 ) ) ( not ( = ?auto_349569 ?auto_349571 ) ) ( not ( = ?auto_349569 ?auto_349572 ) ) ( not ( = ?auto_349569 ?auto_349573 ) ) ( not ( = ?auto_349569 ?auto_349574 ) ) ( not ( = ?auto_349569 ?auto_349575 ) ) ( not ( = ?auto_349570 ?auto_349571 ) ) ( not ( = ?auto_349570 ?auto_349572 ) ) ( not ( = ?auto_349570 ?auto_349573 ) ) ( not ( = ?auto_349570 ?auto_349574 ) ) ( not ( = ?auto_349570 ?auto_349575 ) ) ( not ( = ?auto_349571 ?auto_349572 ) ) ( not ( = ?auto_349571 ?auto_349573 ) ) ( not ( = ?auto_349571 ?auto_349574 ) ) ( not ( = ?auto_349571 ?auto_349575 ) ) ( not ( = ?auto_349572 ?auto_349573 ) ) ( not ( = ?auto_349572 ?auto_349574 ) ) ( not ( = ?auto_349572 ?auto_349575 ) ) ( not ( = ?auto_349573 ?auto_349574 ) ) ( not ( = ?auto_349573 ?auto_349575 ) ) ( not ( = ?auto_349574 ?auto_349575 ) ) ( ON ?auto_349573 ?auto_349574 ) ( ON ?auto_349572 ?auto_349573 ) ( CLEAR ?auto_349570 ) ( ON ?auto_349571 ?auto_349572 ) ( CLEAR ?auto_349571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_349564 ?auto_349565 ?auto_349566 ?auto_349567 ?auto_349568 ?auto_349569 ?auto_349570 ?auto_349571 )
      ( MAKE-11PILE ?auto_349564 ?auto_349565 ?auto_349566 ?auto_349567 ?auto_349568 ?auto_349569 ?auto_349570 ?auto_349571 ?auto_349572 ?auto_349573 ?auto_349574 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349587 - BLOCK
      ?auto_349588 - BLOCK
      ?auto_349589 - BLOCK
      ?auto_349590 - BLOCK
      ?auto_349591 - BLOCK
      ?auto_349592 - BLOCK
      ?auto_349593 - BLOCK
      ?auto_349594 - BLOCK
      ?auto_349595 - BLOCK
      ?auto_349596 - BLOCK
      ?auto_349597 - BLOCK
    )
    :vars
    (
      ?auto_349598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349597 ?auto_349598 ) ( ON-TABLE ?auto_349587 ) ( ON ?auto_349588 ?auto_349587 ) ( ON ?auto_349589 ?auto_349588 ) ( ON ?auto_349590 ?auto_349589 ) ( ON ?auto_349591 ?auto_349590 ) ( ON ?auto_349592 ?auto_349591 ) ( ON ?auto_349593 ?auto_349592 ) ( not ( = ?auto_349587 ?auto_349588 ) ) ( not ( = ?auto_349587 ?auto_349589 ) ) ( not ( = ?auto_349587 ?auto_349590 ) ) ( not ( = ?auto_349587 ?auto_349591 ) ) ( not ( = ?auto_349587 ?auto_349592 ) ) ( not ( = ?auto_349587 ?auto_349593 ) ) ( not ( = ?auto_349587 ?auto_349594 ) ) ( not ( = ?auto_349587 ?auto_349595 ) ) ( not ( = ?auto_349587 ?auto_349596 ) ) ( not ( = ?auto_349587 ?auto_349597 ) ) ( not ( = ?auto_349587 ?auto_349598 ) ) ( not ( = ?auto_349588 ?auto_349589 ) ) ( not ( = ?auto_349588 ?auto_349590 ) ) ( not ( = ?auto_349588 ?auto_349591 ) ) ( not ( = ?auto_349588 ?auto_349592 ) ) ( not ( = ?auto_349588 ?auto_349593 ) ) ( not ( = ?auto_349588 ?auto_349594 ) ) ( not ( = ?auto_349588 ?auto_349595 ) ) ( not ( = ?auto_349588 ?auto_349596 ) ) ( not ( = ?auto_349588 ?auto_349597 ) ) ( not ( = ?auto_349588 ?auto_349598 ) ) ( not ( = ?auto_349589 ?auto_349590 ) ) ( not ( = ?auto_349589 ?auto_349591 ) ) ( not ( = ?auto_349589 ?auto_349592 ) ) ( not ( = ?auto_349589 ?auto_349593 ) ) ( not ( = ?auto_349589 ?auto_349594 ) ) ( not ( = ?auto_349589 ?auto_349595 ) ) ( not ( = ?auto_349589 ?auto_349596 ) ) ( not ( = ?auto_349589 ?auto_349597 ) ) ( not ( = ?auto_349589 ?auto_349598 ) ) ( not ( = ?auto_349590 ?auto_349591 ) ) ( not ( = ?auto_349590 ?auto_349592 ) ) ( not ( = ?auto_349590 ?auto_349593 ) ) ( not ( = ?auto_349590 ?auto_349594 ) ) ( not ( = ?auto_349590 ?auto_349595 ) ) ( not ( = ?auto_349590 ?auto_349596 ) ) ( not ( = ?auto_349590 ?auto_349597 ) ) ( not ( = ?auto_349590 ?auto_349598 ) ) ( not ( = ?auto_349591 ?auto_349592 ) ) ( not ( = ?auto_349591 ?auto_349593 ) ) ( not ( = ?auto_349591 ?auto_349594 ) ) ( not ( = ?auto_349591 ?auto_349595 ) ) ( not ( = ?auto_349591 ?auto_349596 ) ) ( not ( = ?auto_349591 ?auto_349597 ) ) ( not ( = ?auto_349591 ?auto_349598 ) ) ( not ( = ?auto_349592 ?auto_349593 ) ) ( not ( = ?auto_349592 ?auto_349594 ) ) ( not ( = ?auto_349592 ?auto_349595 ) ) ( not ( = ?auto_349592 ?auto_349596 ) ) ( not ( = ?auto_349592 ?auto_349597 ) ) ( not ( = ?auto_349592 ?auto_349598 ) ) ( not ( = ?auto_349593 ?auto_349594 ) ) ( not ( = ?auto_349593 ?auto_349595 ) ) ( not ( = ?auto_349593 ?auto_349596 ) ) ( not ( = ?auto_349593 ?auto_349597 ) ) ( not ( = ?auto_349593 ?auto_349598 ) ) ( not ( = ?auto_349594 ?auto_349595 ) ) ( not ( = ?auto_349594 ?auto_349596 ) ) ( not ( = ?auto_349594 ?auto_349597 ) ) ( not ( = ?auto_349594 ?auto_349598 ) ) ( not ( = ?auto_349595 ?auto_349596 ) ) ( not ( = ?auto_349595 ?auto_349597 ) ) ( not ( = ?auto_349595 ?auto_349598 ) ) ( not ( = ?auto_349596 ?auto_349597 ) ) ( not ( = ?auto_349596 ?auto_349598 ) ) ( not ( = ?auto_349597 ?auto_349598 ) ) ( ON ?auto_349596 ?auto_349597 ) ( ON ?auto_349595 ?auto_349596 ) ( CLEAR ?auto_349593 ) ( ON ?auto_349594 ?auto_349595 ) ( CLEAR ?auto_349594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_349587 ?auto_349588 ?auto_349589 ?auto_349590 ?auto_349591 ?auto_349592 ?auto_349593 ?auto_349594 )
      ( MAKE-11PILE ?auto_349587 ?auto_349588 ?auto_349589 ?auto_349590 ?auto_349591 ?auto_349592 ?auto_349593 ?auto_349594 ?auto_349595 ?auto_349596 ?auto_349597 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349610 - BLOCK
      ?auto_349611 - BLOCK
      ?auto_349612 - BLOCK
      ?auto_349613 - BLOCK
      ?auto_349614 - BLOCK
      ?auto_349615 - BLOCK
      ?auto_349616 - BLOCK
      ?auto_349617 - BLOCK
      ?auto_349618 - BLOCK
      ?auto_349619 - BLOCK
      ?auto_349620 - BLOCK
    )
    :vars
    (
      ?auto_349621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349620 ?auto_349621 ) ( ON-TABLE ?auto_349610 ) ( ON ?auto_349611 ?auto_349610 ) ( ON ?auto_349612 ?auto_349611 ) ( ON ?auto_349613 ?auto_349612 ) ( ON ?auto_349614 ?auto_349613 ) ( ON ?auto_349615 ?auto_349614 ) ( not ( = ?auto_349610 ?auto_349611 ) ) ( not ( = ?auto_349610 ?auto_349612 ) ) ( not ( = ?auto_349610 ?auto_349613 ) ) ( not ( = ?auto_349610 ?auto_349614 ) ) ( not ( = ?auto_349610 ?auto_349615 ) ) ( not ( = ?auto_349610 ?auto_349616 ) ) ( not ( = ?auto_349610 ?auto_349617 ) ) ( not ( = ?auto_349610 ?auto_349618 ) ) ( not ( = ?auto_349610 ?auto_349619 ) ) ( not ( = ?auto_349610 ?auto_349620 ) ) ( not ( = ?auto_349610 ?auto_349621 ) ) ( not ( = ?auto_349611 ?auto_349612 ) ) ( not ( = ?auto_349611 ?auto_349613 ) ) ( not ( = ?auto_349611 ?auto_349614 ) ) ( not ( = ?auto_349611 ?auto_349615 ) ) ( not ( = ?auto_349611 ?auto_349616 ) ) ( not ( = ?auto_349611 ?auto_349617 ) ) ( not ( = ?auto_349611 ?auto_349618 ) ) ( not ( = ?auto_349611 ?auto_349619 ) ) ( not ( = ?auto_349611 ?auto_349620 ) ) ( not ( = ?auto_349611 ?auto_349621 ) ) ( not ( = ?auto_349612 ?auto_349613 ) ) ( not ( = ?auto_349612 ?auto_349614 ) ) ( not ( = ?auto_349612 ?auto_349615 ) ) ( not ( = ?auto_349612 ?auto_349616 ) ) ( not ( = ?auto_349612 ?auto_349617 ) ) ( not ( = ?auto_349612 ?auto_349618 ) ) ( not ( = ?auto_349612 ?auto_349619 ) ) ( not ( = ?auto_349612 ?auto_349620 ) ) ( not ( = ?auto_349612 ?auto_349621 ) ) ( not ( = ?auto_349613 ?auto_349614 ) ) ( not ( = ?auto_349613 ?auto_349615 ) ) ( not ( = ?auto_349613 ?auto_349616 ) ) ( not ( = ?auto_349613 ?auto_349617 ) ) ( not ( = ?auto_349613 ?auto_349618 ) ) ( not ( = ?auto_349613 ?auto_349619 ) ) ( not ( = ?auto_349613 ?auto_349620 ) ) ( not ( = ?auto_349613 ?auto_349621 ) ) ( not ( = ?auto_349614 ?auto_349615 ) ) ( not ( = ?auto_349614 ?auto_349616 ) ) ( not ( = ?auto_349614 ?auto_349617 ) ) ( not ( = ?auto_349614 ?auto_349618 ) ) ( not ( = ?auto_349614 ?auto_349619 ) ) ( not ( = ?auto_349614 ?auto_349620 ) ) ( not ( = ?auto_349614 ?auto_349621 ) ) ( not ( = ?auto_349615 ?auto_349616 ) ) ( not ( = ?auto_349615 ?auto_349617 ) ) ( not ( = ?auto_349615 ?auto_349618 ) ) ( not ( = ?auto_349615 ?auto_349619 ) ) ( not ( = ?auto_349615 ?auto_349620 ) ) ( not ( = ?auto_349615 ?auto_349621 ) ) ( not ( = ?auto_349616 ?auto_349617 ) ) ( not ( = ?auto_349616 ?auto_349618 ) ) ( not ( = ?auto_349616 ?auto_349619 ) ) ( not ( = ?auto_349616 ?auto_349620 ) ) ( not ( = ?auto_349616 ?auto_349621 ) ) ( not ( = ?auto_349617 ?auto_349618 ) ) ( not ( = ?auto_349617 ?auto_349619 ) ) ( not ( = ?auto_349617 ?auto_349620 ) ) ( not ( = ?auto_349617 ?auto_349621 ) ) ( not ( = ?auto_349618 ?auto_349619 ) ) ( not ( = ?auto_349618 ?auto_349620 ) ) ( not ( = ?auto_349618 ?auto_349621 ) ) ( not ( = ?auto_349619 ?auto_349620 ) ) ( not ( = ?auto_349619 ?auto_349621 ) ) ( not ( = ?auto_349620 ?auto_349621 ) ) ( ON ?auto_349619 ?auto_349620 ) ( ON ?auto_349618 ?auto_349619 ) ( ON ?auto_349617 ?auto_349618 ) ( CLEAR ?auto_349615 ) ( ON ?auto_349616 ?auto_349617 ) ( CLEAR ?auto_349616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_349610 ?auto_349611 ?auto_349612 ?auto_349613 ?auto_349614 ?auto_349615 ?auto_349616 )
      ( MAKE-11PILE ?auto_349610 ?auto_349611 ?auto_349612 ?auto_349613 ?auto_349614 ?auto_349615 ?auto_349616 ?auto_349617 ?auto_349618 ?auto_349619 ?auto_349620 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349633 - BLOCK
      ?auto_349634 - BLOCK
      ?auto_349635 - BLOCK
      ?auto_349636 - BLOCK
      ?auto_349637 - BLOCK
      ?auto_349638 - BLOCK
      ?auto_349639 - BLOCK
      ?auto_349640 - BLOCK
      ?auto_349641 - BLOCK
      ?auto_349642 - BLOCK
      ?auto_349643 - BLOCK
    )
    :vars
    (
      ?auto_349644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349643 ?auto_349644 ) ( ON-TABLE ?auto_349633 ) ( ON ?auto_349634 ?auto_349633 ) ( ON ?auto_349635 ?auto_349634 ) ( ON ?auto_349636 ?auto_349635 ) ( ON ?auto_349637 ?auto_349636 ) ( ON ?auto_349638 ?auto_349637 ) ( not ( = ?auto_349633 ?auto_349634 ) ) ( not ( = ?auto_349633 ?auto_349635 ) ) ( not ( = ?auto_349633 ?auto_349636 ) ) ( not ( = ?auto_349633 ?auto_349637 ) ) ( not ( = ?auto_349633 ?auto_349638 ) ) ( not ( = ?auto_349633 ?auto_349639 ) ) ( not ( = ?auto_349633 ?auto_349640 ) ) ( not ( = ?auto_349633 ?auto_349641 ) ) ( not ( = ?auto_349633 ?auto_349642 ) ) ( not ( = ?auto_349633 ?auto_349643 ) ) ( not ( = ?auto_349633 ?auto_349644 ) ) ( not ( = ?auto_349634 ?auto_349635 ) ) ( not ( = ?auto_349634 ?auto_349636 ) ) ( not ( = ?auto_349634 ?auto_349637 ) ) ( not ( = ?auto_349634 ?auto_349638 ) ) ( not ( = ?auto_349634 ?auto_349639 ) ) ( not ( = ?auto_349634 ?auto_349640 ) ) ( not ( = ?auto_349634 ?auto_349641 ) ) ( not ( = ?auto_349634 ?auto_349642 ) ) ( not ( = ?auto_349634 ?auto_349643 ) ) ( not ( = ?auto_349634 ?auto_349644 ) ) ( not ( = ?auto_349635 ?auto_349636 ) ) ( not ( = ?auto_349635 ?auto_349637 ) ) ( not ( = ?auto_349635 ?auto_349638 ) ) ( not ( = ?auto_349635 ?auto_349639 ) ) ( not ( = ?auto_349635 ?auto_349640 ) ) ( not ( = ?auto_349635 ?auto_349641 ) ) ( not ( = ?auto_349635 ?auto_349642 ) ) ( not ( = ?auto_349635 ?auto_349643 ) ) ( not ( = ?auto_349635 ?auto_349644 ) ) ( not ( = ?auto_349636 ?auto_349637 ) ) ( not ( = ?auto_349636 ?auto_349638 ) ) ( not ( = ?auto_349636 ?auto_349639 ) ) ( not ( = ?auto_349636 ?auto_349640 ) ) ( not ( = ?auto_349636 ?auto_349641 ) ) ( not ( = ?auto_349636 ?auto_349642 ) ) ( not ( = ?auto_349636 ?auto_349643 ) ) ( not ( = ?auto_349636 ?auto_349644 ) ) ( not ( = ?auto_349637 ?auto_349638 ) ) ( not ( = ?auto_349637 ?auto_349639 ) ) ( not ( = ?auto_349637 ?auto_349640 ) ) ( not ( = ?auto_349637 ?auto_349641 ) ) ( not ( = ?auto_349637 ?auto_349642 ) ) ( not ( = ?auto_349637 ?auto_349643 ) ) ( not ( = ?auto_349637 ?auto_349644 ) ) ( not ( = ?auto_349638 ?auto_349639 ) ) ( not ( = ?auto_349638 ?auto_349640 ) ) ( not ( = ?auto_349638 ?auto_349641 ) ) ( not ( = ?auto_349638 ?auto_349642 ) ) ( not ( = ?auto_349638 ?auto_349643 ) ) ( not ( = ?auto_349638 ?auto_349644 ) ) ( not ( = ?auto_349639 ?auto_349640 ) ) ( not ( = ?auto_349639 ?auto_349641 ) ) ( not ( = ?auto_349639 ?auto_349642 ) ) ( not ( = ?auto_349639 ?auto_349643 ) ) ( not ( = ?auto_349639 ?auto_349644 ) ) ( not ( = ?auto_349640 ?auto_349641 ) ) ( not ( = ?auto_349640 ?auto_349642 ) ) ( not ( = ?auto_349640 ?auto_349643 ) ) ( not ( = ?auto_349640 ?auto_349644 ) ) ( not ( = ?auto_349641 ?auto_349642 ) ) ( not ( = ?auto_349641 ?auto_349643 ) ) ( not ( = ?auto_349641 ?auto_349644 ) ) ( not ( = ?auto_349642 ?auto_349643 ) ) ( not ( = ?auto_349642 ?auto_349644 ) ) ( not ( = ?auto_349643 ?auto_349644 ) ) ( ON ?auto_349642 ?auto_349643 ) ( ON ?auto_349641 ?auto_349642 ) ( ON ?auto_349640 ?auto_349641 ) ( CLEAR ?auto_349638 ) ( ON ?auto_349639 ?auto_349640 ) ( CLEAR ?auto_349639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_349633 ?auto_349634 ?auto_349635 ?auto_349636 ?auto_349637 ?auto_349638 ?auto_349639 )
      ( MAKE-11PILE ?auto_349633 ?auto_349634 ?auto_349635 ?auto_349636 ?auto_349637 ?auto_349638 ?auto_349639 ?auto_349640 ?auto_349641 ?auto_349642 ?auto_349643 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349656 - BLOCK
      ?auto_349657 - BLOCK
      ?auto_349658 - BLOCK
      ?auto_349659 - BLOCK
      ?auto_349660 - BLOCK
      ?auto_349661 - BLOCK
      ?auto_349662 - BLOCK
      ?auto_349663 - BLOCK
      ?auto_349664 - BLOCK
      ?auto_349665 - BLOCK
      ?auto_349666 - BLOCK
    )
    :vars
    (
      ?auto_349667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349666 ?auto_349667 ) ( ON-TABLE ?auto_349656 ) ( ON ?auto_349657 ?auto_349656 ) ( ON ?auto_349658 ?auto_349657 ) ( ON ?auto_349659 ?auto_349658 ) ( ON ?auto_349660 ?auto_349659 ) ( not ( = ?auto_349656 ?auto_349657 ) ) ( not ( = ?auto_349656 ?auto_349658 ) ) ( not ( = ?auto_349656 ?auto_349659 ) ) ( not ( = ?auto_349656 ?auto_349660 ) ) ( not ( = ?auto_349656 ?auto_349661 ) ) ( not ( = ?auto_349656 ?auto_349662 ) ) ( not ( = ?auto_349656 ?auto_349663 ) ) ( not ( = ?auto_349656 ?auto_349664 ) ) ( not ( = ?auto_349656 ?auto_349665 ) ) ( not ( = ?auto_349656 ?auto_349666 ) ) ( not ( = ?auto_349656 ?auto_349667 ) ) ( not ( = ?auto_349657 ?auto_349658 ) ) ( not ( = ?auto_349657 ?auto_349659 ) ) ( not ( = ?auto_349657 ?auto_349660 ) ) ( not ( = ?auto_349657 ?auto_349661 ) ) ( not ( = ?auto_349657 ?auto_349662 ) ) ( not ( = ?auto_349657 ?auto_349663 ) ) ( not ( = ?auto_349657 ?auto_349664 ) ) ( not ( = ?auto_349657 ?auto_349665 ) ) ( not ( = ?auto_349657 ?auto_349666 ) ) ( not ( = ?auto_349657 ?auto_349667 ) ) ( not ( = ?auto_349658 ?auto_349659 ) ) ( not ( = ?auto_349658 ?auto_349660 ) ) ( not ( = ?auto_349658 ?auto_349661 ) ) ( not ( = ?auto_349658 ?auto_349662 ) ) ( not ( = ?auto_349658 ?auto_349663 ) ) ( not ( = ?auto_349658 ?auto_349664 ) ) ( not ( = ?auto_349658 ?auto_349665 ) ) ( not ( = ?auto_349658 ?auto_349666 ) ) ( not ( = ?auto_349658 ?auto_349667 ) ) ( not ( = ?auto_349659 ?auto_349660 ) ) ( not ( = ?auto_349659 ?auto_349661 ) ) ( not ( = ?auto_349659 ?auto_349662 ) ) ( not ( = ?auto_349659 ?auto_349663 ) ) ( not ( = ?auto_349659 ?auto_349664 ) ) ( not ( = ?auto_349659 ?auto_349665 ) ) ( not ( = ?auto_349659 ?auto_349666 ) ) ( not ( = ?auto_349659 ?auto_349667 ) ) ( not ( = ?auto_349660 ?auto_349661 ) ) ( not ( = ?auto_349660 ?auto_349662 ) ) ( not ( = ?auto_349660 ?auto_349663 ) ) ( not ( = ?auto_349660 ?auto_349664 ) ) ( not ( = ?auto_349660 ?auto_349665 ) ) ( not ( = ?auto_349660 ?auto_349666 ) ) ( not ( = ?auto_349660 ?auto_349667 ) ) ( not ( = ?auto_349661 ?auto_349662 ) ) ( not ( = ?auto_349661 ?auto_349663 ) ) ( not ( = ?auto_349661 ?auto_349664 ) ) ( not ( = ?auto_349661 ?auto_349665 ) ) ( not ( = ?auto_349661 ?auto_349666 ) ) ( not ( = ?auto_349661 ?auto_349667 ) ) ( not ( = ?auto_349662 ?auto_349663 ) ) ( not ( = ?auto_349662 ?auto_349664 ) ) ( not ( = ?auto_349662 ?auto_349665 ) ) ( not ( = ?auto_349662 ?auto_349666 ) ) ( not ( = ?auto_349662 ?auto_349667 ) ) ( not ( = ?auto_349663 ?auto_349664 ) ) ( not ( = ?auto_349663 ?auto_349665 ) ) ( not ( = ?auto_349663 ?auto_349666 ) ) ( not ( = ?auto_349663 ?auto_349667 ) ) ( not ( = ?auto_349664 ?auto_349665 ) ) ( not ( = ?auto_349664 ?auto_349666 ) ) ( not ( = ?auto_349664 ?auto_349667 ) ) ( not ( = ?auto_349665 ?auto_349666 ) ) ( not ( = ?auto_349665 ?auto_349667 ) ) ( not ( = ?auto_349666 ?auto_349667 ) ) ( ON ?auto_349665 ?auto_349666 ) ( ON ?auto_349664 ?auto_349665 ) ( ON ?auto_349663 ?auto_349664 ) ( ON ?auto_349662 ?auto_349663 ) ( CLEAR ?auto_349660 ) ( ON ?auto_349661 ?auto_349662 ) ( CLEAR ?auto_349661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_349656 ?auto_349657 ?auto_349658 ?auto_349659 ?auto_349660 ?auto_349661 )
      ( MAKE-11PILE ?auto_349656 ?auto_349657 ?auto_349658 ?auto_349659 ?auto_349660 ?auto_349661 ?auto_349662 ?auto_349663 ?auto_349664 ?auto_349665 ?auto_349666 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349679 - BLOCK
      ?auto_349680 - BLOCK
      ?auto_349681 - BLOCK
      ?auto_349682 - BLOCK
      ?auto_349683 - BLOCK
      ?auto_349684 - BLOCK
      ?auto_349685 - BLOCK
      ?auto_349686 - BLOCK
      ?auto_349687 - BLOCK
      ?auto_349688 - BLOCK
      ?auto_349689 - BLOCK
    )
    :vars
    (
      ?auto_349690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349689 ?auto_349690 ) ( ON-TABLE ?auto_349679 ) ( ON ?auto_349680 ?auto_349679 ) ( ON ?auto_349681 ?auto_349680 ) ( ON ?auto_349682 ?auto_349681 ) ( ON ?auto_349683 ?auto_349682 ) ( not ( = ?auto_349679 ?auto_349680 ) ) ( not ( = ?auto_349679 ?auto_349681 ) ) ( not ( = ?auto_349679 ?auto_349682 ) ) ( not ( = ?auto_349679 ?auto_349683 ) ) ( not ( = ?auto_349679 ?auto_349684 ) ) ( not ( = ?auto_349679 ?auto_349685 ) ) ( not ( = ?auto_349679 ?auto_349686 ) ) ( not ( = ?auto_349679 ?auto_349687 ) ) ( not ( = ?auto_349679 ?auto_349688 ) ) ( not ( = ?auto_349679 ?auto_349689 ) ) ( not ( = ?auto_349679 ?auto_349690 ) ) ( not ( = ?auto_349680 ?auto_349681 ) ) ( not ( = ?auto_349680 ?auto_349682 ) ) ( not ( = ?auto_349680 ?auto_349683 ) ) ( not ( = ?auto_349680 ?auto_349684 ) ) ( not ( = ?auto_349680 ?auto_349685 ) ) ( not ( = ?auto_349680 ?auto_349686 ) ) ( not ( = ?auto_349680 ?auto_349687 ) ) ( not ( = ?auto_349680 ?auto_349688 ) ) ( not ( = ?auto_349680 ?auto_349689 ) ) ( not ( = ?auto_349680 ?auto_349690 ) ) ( not ( = ?auto_349681 ?auto_349682 ) ) ( not ( = ?auto_349681 ?auto_349683 ) ) ( not ( = ?auto_349681 ?auto_349684 ) ) ( not ( = ?auto_349681 ?auto_349685 ) ) ( not ( = ?auto_349681 ?auto_349686 ) ) ( not ( = ?auto_349681 ?auto_349687 ) ) ( not ( = ?auto_349681 ?auto_349688 ) ) ( not ( = ?auto_349681 ?auto_349689 ) ) ( not ( = ?auto_349681 ?auto_349690 ) ) ( not ( = ?auto_349682 ?auto_349683 ) ) ( not ( = ?auto_349682 ?auto_349684 ) ) ( not ( = ?auto_349682 ?auto_349685 ) ) ( not ( = ?auto_349682 ?auto_349686 ) ) ( not ( = ?auto_349682 ?auto_349687 ) ) ( not ( = ?auto_349682 ?auto_349688 ) ) ( not ( = ?auto_349682 ?auto_349689 ) ) ( not ( = ?auto_349682 ?auto_349690 ) ) ( not ( = ?auto_349683 ?auto_349684 ) ) ( not ( = ?auto_349683 ?auto_349685 ) ) ( not ( = ?auto_349683 ?auto_349686 ) ) ( not ( = ?auto_349683 ?auto_349687 ) ) ( not ( = ?auto_349683 ?auto_349688 ) ) ( not ( = ?auto_349683 ?auto_349689 ) ) ( not ( = ?auto_349683 ?auto_349690 ) ) ( not ( = ?auto_349684 ?auto_349685 ) ) ( not ( = ?auto_349684 ?auto_349686 ) ) ( not ( = ?auto_349684 ?auto_349687 ) ) ( not ( = ?auto_349684 ?auto_349688 ) ) ( not ( = ?auto_349684 ?auto_349689 ) ) ( not ( = ?auto_349684 ?auto_349690 ) ) ( not ( = ?auto_349685 ?auto_349686 ) ) ( not ( = ?auto_349685 ?auto_349687 ) ) ( not ( = ?auto_349685 ?auto_349688 ) ) ( not ( = ?auto_349685 ?auto_349689 ) ) ( not ( = ?auto_349685 ?auto_349690 ) ) ( not ( = ?auto_349686 ?auto_349687 ) ) ( not ( = ?auto_349686 ?auto_349688 ) ) ( not ( = ?auto_349686 ?auto_349689 ) ) ( not ( = ?auto_349686 ?auto_349690 ) ) ( not ( = ?auto_349687 ?auto_349688 ) ) ( not ( = ?auto_349687 ?auto_349689 ) ) ( not ( = ?auto_349687 ?auto_349690 ) ) ( not ( = ?auto_349688 ?auto_349689 ) ) ( not ( = ?auto_349688 ?auto_349690 ) ) ( not ( = ?auto_349689 ?auto_349690 ) ) ( ON ?auto_349688 ?auto_349689 ) ( ON ?auto_349687 ?auto_349688 ) ( ON ?auto_349686 ?auto_349687 ) ( ON ?auto_349685 ?auto_349686 ) ( CLEAR ?auto_349683 ) ( ON ?auto_349684 ?auto_349685 ) ( CLEAR ?auto_349684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_349679 ?auto_349680 ?auto_349681 ?auto_349682 ?auto_349683 ?auto_349684 )
      ( MAKE-11PILE ?auto_349679 ?auto_349680 ?auto_349681 ?auto_349682 ?auto_349683 ?auto_349684 ?auto_349685 ?auto_349686 ?auto_349687 ?auto_349688 ?auto_349689 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349702 - BLOCK
      ?auto_349703 - BLOCK
      ?auto_349704 - BLOCK
      ?auto_349705 - BLOCK
      ?auto_349706 - BLOCK
      ?auto_349707 - BLOCK
      ?auto_349708 - BLOCK
      ?auto_349709 - BLOCK
      ?auto_349710 - BLOCK
      ?auto_349711 - BLOCK
      ?auto_349712 - BLOCK
    )
    :vars
    (
      ?auto_349713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349712 ?auto_349713 ) ( ON-TABLE ?auto_349702 ) ( ON ?auto_349703 ?auto_349702 ) ( ON ?auto_349704 ?auto_349703 ) ( ON ?auto_349705 ?auto_349704 ) ( not ( = ?auto_349702 ?auto_349703 ) ) ( not ( = ?auto_349702 ?auto_349704 ) ) ( not ( = ?auto_349702 ?auto_349705 ) ) ( not ( = ?auto_349702 ?auto_349706 ) ) ( not ( = ?auto_349702 ?auto_349707 ) ) ( not ( = ?auto_349702 ?auto_349708 ) ) ( not ( = ?auto_349702 ?auto_349709 ) ) ( not ( = ?auto_349702 ?auto_349710 ) ) ( not ( = ?auto_349702 ?auto_349711 ) ) ( not ( = ?auto_349702 ?auto_349712 ) ) ( not ( = ?auto_349702 ?auto_349713 ) ) ( not ( = ?auto_349703 ?auto_349704 ) ) ( not ( = ?auto_349703 ?auto_349705 ) ) ( not ( = ?auto_349703 ?auto_349706 ) ) ( not ( = ?auto_349703 ?auto_349707 ) ) ( not ( = ?auto_349703 ?auto_349708 ) ) ( not ( = ?auto_349703 ?auto_349709 ) ) ( not ( = ?auto_349703 ?auto_349710 ) ) ( not ( = ?auto_349703 ?auto_349711 ) ) ( not ( = ?auto_349703 ?auto_349712 ) ) ( not ( = ?auto_349703 ?auto_349713 ) ) ( not ( = ?auto_349704 ?auto_349705 ) ) ( not ( = ?auto_349704 ?auto_349706 ) ) ( not ( = ?auto_349704 ?auto_349707 ) ) ( not ( = ?auto_349704 ?auto_349708 ) ) ( not ( = ?auto_349704 ?auto_349709 ) ) ( not ( = ?auto_349704 ?auto_349710 ) ) ( not ( = ?auto_349704 ?auto_349711 ) ) ( not ( = ?auto_349704 ?auto_349712 ) ) ( not ( = ?auto_349704 ?auto_349713 ) ) ( not ( = ?auto_349705 ?auto_349706 ) ) ( not ( = ?auto_349705 ?auto_349707 ) ) ( not ( = ?auto_349705 ?auto_349708 ) ) ( not ( = ?auto_349705 ?auto_349709 ) ) ( not ( = ?auto_349705 ?auto_349710 ) ) ( not ( = ?auto_349705 ?auto_349711 ) ) ( not ( = ?auto_349705 ?auto_349712 ) ) ( not ( = ?auto_349705 ?auto_349713 ) ) ( not ( = ?auto_349706 ?auto_349707 ) ) ( not ( = ?auto_349706 ?auto_349708 ) ) ( not ( = ?auto_349706 ?auto_349709 ) ) ( not ( = ?auto_349706 ?auto_349710 ) ) ( not ( = ?auto_349706 ?auto_349711 ) ) ( not ( = ?auto_349706 ?auto_349712 ) ) ( not ( = ?auto_349706 ?auto_349713 ) ) ( not ( = ?auto_349707 ?auto_349708 ) ) ( not ( = ?auto_349707 ?auto_349709 ) ) ( not ( = ?auto_349707 ?auto_349710 ) ) ( not ( = ?auto_349707 ?auto_349711 ) ) ( not ( = ?auto_349707 ?auto_349712 ) ) ( not ( = ?auto_349707 ?auto_349713 ) ) ( not ( = ?auto_349708 ?auto_349709 ) ) ( not ( = ?auto_349708 ?auto_349710 ) ) ( not ( = ?auto_349708 ?auto_349711 ) ) ( not ( = ?auto_349708 ?auto_349712 ) ) ( not ( = ?auto_349708 ?auto_349713 ) ) ( not ( = ?auto_349709 ?auto_349710 ) ) ( not ( = ?auto_349709 ?auto_349711 ) ) ( not ( = ?auto_349709 ?auto_349712 ) ) ( not ( = ?auto_349709 ?auto_349713 ) ) ( not ( = ?auto_349710 ?auto_349711 ) ) ( not ( = ?auto_349710 ?auto_349712 ) ) ( not ( = ?auto_349710 ?auto_349713 ) ) ( not ( = ?auto_349711 ?auto_349712 ) ) ( not ( = ?auto_349711 ?auto_349713 ) ) ( not ( = ?auto_349712 ?auto_349713 ) ) ( ON ?auto_349711 ?auto_349712 ) ( ON ?auto_349710 ?auto_349711 ) ( ON ?auto_349709 ?auto_349710 ) ( ON ?auto_349708 ?auto_349709 ) ( ON ?auto_349707 ?auto_349708 ) ( CLEAR ?auto_349705 ) ( ON ?auto_349706 ?auto_349707 ) ( CLEAR ?auto_349706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_349702 ?auto_349703 ?auto_349704 ?auto_349705 ?auto_349706 )
      ( MAKE-11PILE ?auto_349702 ?auto_349703 ?auto_349704 ?auto_349705 ?auto_349706 ?auto_349707 ?auto_349708 ?auto_349709 ?auto_349710 ?auto_349711 ?auto_349712 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349725 - BLOCK
      ?auto_349726 - BLOCK
      ?auto_349727 - BLOCK
      ?auto_349728 - BLOCK
      ?auto_349729 - BLOCK
      ?auto_349730 - BLOCK
      ?auto_349731 - BLOCK
      ?auto_349732 - BLOCK
      ?auto_349733 - BLOCK
      ?auto_349734 - BLOCK
      ?auto_349735 - BLOCK
    )
    :vars
    (
      ?auto_349736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349735 ?auto_349736 ) ( ON-TABLE ?auto_349725 ) ( ON ?auto_349726 ?auto_349725 ) ( ON ?auto_349727 ?auto_349726 ) ( ON ?auto_349728 ?auto_349727 ) ( not ( = ?auto_349725 ?auto_349726 ) ) ( not ( = ?auto_349725 ?auto_349727 ) ) ( not ( = ?auto_349725 ?auto_349728 ) ) ( not ( = ?auto_349725 ?auto_349729 ) ) ( not ( = ?auto_349725 ?auto_349730 ) ) ( not ( = ?auto_349725 ?auto_349731 ) ) ( not ( = ?auto_349725 ?auto_349732 ) ) ( not ( = ?auto_349725 ?auto_349733 ) ) ( not ( = ?auto_349725 ?auto_349734 ) ) ( not ( = ?auto_349725 ?auto_349735 ) ) ( not ( = ?auto_349725 ?auto_349736 ) ) ( not ( = ?auto_349726 ?auto_349727 ) ) ( not ( = ?auto_349726 ?auto_349728 ) ) ( not ( = ?auto_349726 ?auto_349729 ) ) ( not ( = ?auto_349726 ?auto_349730 ) ) ( not ( = ?auto_349726 ?auto_349731 ) ) ( not ( = ?auto_349726 ?auto_349732 ) ) ( not ( = ?auto_349726 ?auto_349733 ) ) ( not ( = ?auto_349726 ?auto_349734 ) ) ( not ( = ?auto_349726 ?auto_349735 ) ) ( not ( = ?auto_349726 ?auto_349736 ) ) ( not ( = ?auto_349727 ?auto_349728 ) ) ( not ( = ?auto_349727 ?auto_349729 ) ) ( not ( = ?auto_349727 ?auto_349730 ) ) ( not ( = ?auto_349727 ?auto_349731 ) ) ( not ( = ?auto_349727 ?auto_349732 ) ) ( not ( = ?auto_349727 ?auto_349733 ) ) ( not ( = ?auto_349727 ?auto_349734 ) ) ( not ( = ?auto_349727 ?auto_349735 ) ) ( not ( = ?auto_349727 ?auto_349736 ) ) ( not ( = ?auto_349728 ?auto_349729 ) ) ( not ( = ?auto_349728 ?auto_349730 ) ) ( not ( = ?auto_349728 ?auto_349731 ) ) ( not ( = ?auto_349728 ?auto_349732 ) ) ( not ( = ?auto_349728 ?auto_349733 ) ) ( not ( = ?auto_349728 ?auto_349734 ) ) ( not ( = ?auto_349728 ?auto_349735 ) ) ( not ( = ?auto_349728 ?auto_349736 ) ) ( not ( = ?auto_349729 ?auto_349730 ) ) ( not ( = ?auto_349729 ?auto_349731 ) ) ( not ( = ?auto_349729 ?auto_349732 ) ) ( not ( = ?auto_349729 ?auto_349733 ) ) ( not ( = ?auto_349729 ?auto_349734 ) ) ( not ( = ?auto_349729 ?auto_349735 ) ) ( not ( = ?auto_349729 ?auto_349736 ) ) ( not ( = ?auto_349730 ?auto_349731 ) ) ( not ( = ?auto_349730 ?auto_349732 ) ) ( not ( = ?auto_349730 ?auto_349733 ) ) ( not ( = ?auto_349730 ?auto_349734 ) ) ( not ( = ?auto_349730 ?auto_349735 ) ) ( not ( = ?auto_349730 ?auto_349736 ) ) ( not ( = ?auto_349731 ?auto_349732 ) ) ( not ( = ?auto_349731 ?auto_349733 ) ) ( not ( = ?auto_349731 ?auto_349734 ) ) ( not ( = ?auto_349731 ?auto_349735 ) ) ( not ( = ?auto_349731 ?auto_349736 ) ) ( not ( = ?auto_349732 ?auto_349733 ) ) ( not ( = ?auto_349732 ?auto_349734 ) ) ( not ( = ?auto_349732 ?auto_349735 ) ) ( not ( = ?auto_349732 ?auto_349736 ) ) ( not ( = ?auto_349733 ?auto_349734 ) ) ( not ( = ?auto_349733 ?auto_349735 ) ) ( not ( = ?auto_349733 ?auto_349736 ) ) ( not ( = ?auto_349734 ?auto_349735 ) ) ( not ( = ?auto_349734 ?auto_349736 ) ) ( not ( = ?auto_349735 ?auto_349736 ) ) ( ON ?auto_349734 ?auto_349735 ) ( ON ?auto_349733 ?auto_349734 ) ( ON ?auto_349732 ?auto_349733 ) ( ON ?auto_349731 ?auto_349732 ) ( ON ?auto_349730 ?auto_349731 ) ( CLEAR ?auto_349728 ) ( ON ?auto_349729 ?auto_349730 ) ( CLEAR ?auto_349729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_349725 ?auto_349726 ?auto_349727 ?auto_349728 ?auto_349729 )
      ( MAKE-11PILE ?auto_349725 ?auto_349726 ?auto_349727 ?auto_349728 ?auto_349729 ?auto_349730 ?auto_349731 ?auto_349732 ?auto_349733 ?auto_349734 ?auto_349735 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349748 - BLOCK
      ?auto_349749 - BLOCK
      ?auto_349750 - BLOCK
      ?auto_349751 - BLOCK
      ?auto_349752 - BLOCK
      ?auto_349753 - BLOCK
      ?auto_349754 - BLOCK
      ?auto_349755 - BLOCK
      ?auto_349756 - BLOCK
      ?auto_349757 - BLOCK
      ?auto_349758 - BLOCK
    )
    :vars
    (
      ?auto_349759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349758 ?auto_349759 ) ( ON-TABLE ?auto_349748 ) ( ON ?auto_349749 ?auto_349748 ) ( ON ?auto_349750 ?auto_349749 ) ( not ( = ?auto_349748 ?auto_349749 ) ) ( not ( = ?auto_349748 ?auto_349750 ) ) ( not ( = ?auto_349748 ?auto_349751 ) ) ( not ( = ?auto_349748 ?auto_349752 ) ) ( not ( = ?auto_349748 ?auto_349753 ) ) ( not ( = ?auto_349748 ?auto_349754 ) ) ( not ( = ?auto_349748 ?auto_349755 ) ) ( not ( = ?auto_349748 ?auto_349756 ) ) ( not ( = ?auto_349748 ?auto_349757 ) ) ( not ( = ?auto_349748 ?auto_349758 ) ) ( not ( = ?auto_349748 ?auto_349759 ) ) ( not ( = ?auto_349749 ?auto_349750 ) ) ( not ( = ?auto_349749 ?auto_349751 ) ) ( not ( = ?auto_349749 ?auto_349752 ) ) ( not ( = ?auto_349749 ?auto_349753 ) ) ( not ( = ?auto_349749 ?auto_349754 ) ) ( not ( = ?auto_349749 ?auto_349755 ) ) ( not ( = ?auto_349749 ?auto_349756 ) ) ( not ( = ?auto_349749 ?auto_349757 ) ) ( not ( = ?auto_349749 ?auto_349758 ) ) ( not ( = ?auto_349749 ?auto_349759 ) ) ( not ( = ?auto_349750 ?auto_349751 ) ) ( not ( = ?auto_349750 ?auto_349752 ) ) ( not ( = ?auto_349750 ?auto_349753 ) ) ( not ( = ?auto_349750 ?auto_349754 ) ) ( not ( = ?auto_349750 ?auto_349755 ) ) ( not ( = ?auto_349750 ?auto_349756 ) ) ( not ( = ?auto_349750 ?auto_349757 ) ) ( not ( = ?auto_349750 ?auto_349758 ) ) ( not ( = ?auto_349750 ?auto_349759 ) ) ( not ( = ?auto_349751 ?auto_349752 ) ) ( not ( = ?auto_349751 ?auto_349753 ) ) ( not ( = ?auto_349751 ?auto_349754 ) ) ( not ( = ?auto_349751 ?auto_349755 ) ) ( not ( = ?auto_349751 ?auto_349756 ) ) ( not ( = ?auto_349751 ?auto_349757 ) ) ( not ( = ?auto_349751 ?auto_349758 ) ) ( not ( = ?auto_349751 ?auto_349759 ) ) ( not ( = ?auto_349752 ?auto_349753 ) ) ( not ( = ?auto_349752 ?auto_349754 ) ) ( not ( = ?auto_349752 ?auto_349755 ) ) ( not ( = ?auto_349752 ?auto_349756 ) ) ( not ( = ?auto_349752 ?auto_349757 ) ) ( not ( = ?auto_349752 ?auto_349758 ) ) ( not ( = ?auto_349752 ?auto_349759 ) ) ( not ( = ?auto_349753 ?auto_349754 ) ) ( not ( = ?auto_349753 ?auto_349755 ) ) ( not ( = ?auto_349753 ?auto_349756 ) ) ( not ( = ?auto_349753 ?auto_349757 ) ) ( not ( = ?auto_349753 ?auto_349758 ) ) ( not ( = ?auto_349753 ?auto_349759 ) ) ( not ( = ?auto_349754 ?auto_349755 ) ) ( not ( = ?auto_349754 ?auto_349756 ) ) ( not ( = ?auto_349754 ?auto_349757 ) ) ( not ( = ?auto_349754 ?auto_349758 ) ) ( not ( = ?auto_349754 ?auto_349759 ) ) ( not ( = ?auto_349755 ?auto_349756 ) ) ( not ( = ?auto_349755 ?auto_349757 ) ) ( not ( = ?auto_349755 ?auto_349758 ) ) ( not ( = ?auto_349755 ?auto_349759 ) ) ( not ( = ?auto_349756 ?auto_349757 ) ) ( not ( = ?auto_349756 ?auto_349758 ) ) ( not ( = ?auto_349756 ?auto_349759 ) ) ( not ( = ?auto_349757 ?auto_349758 ) ) ( not ( = ?auto_349757 ?auto_349759 ) ) ( not ( = ?auto_349758 ?auto_349759 ) ) ( ON ?auto_349757 ?auto_349758 ) ( ON ?auto_349756 ?auto_349757 ) ( ON ?auto_349755 ?auto_349756 ) ( ON ?auto_349754 ?auto_349755 ) ( ON ?auto_349753 ?auto_349754 ) ( ON ?auto_349752 ?auto_349753 ) ( CLEAR ?auto_349750 ) ( ON ?auto_349751 ?auto_349752 ) ( CLEAR ?auto_349751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_349748 ?auto_349749 ?auto_349750 ?auto_349751 )
      ( MAKE-11PILE ?auto_349748 ?auto_349749 ?auto_349750 ?auto_349751 ?auto_349752 ?auto_349753 ?auto_349754 ?auto_349755 ?auto_349756 ?auto_349757 ?auto_349758 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349771 - BLOCK
      ?auto_349772 - BLOCK
      ?auto_349773 - BLOCK
      ?auto_349774 - BLOCK
      ?auto_349775 - BLOCK
      ?auto_349776 - BLOCK
      ?auto_349777 - BLOCK
      ?auto_349778 - BLOCK
      ?auto_349779 - BLOCK
      ?auto_349780 - BLOCK
      ?auto_349781 - BLOCK
    )
    :vars
    (
      ?auto_349782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349781 ?auto_349782 ) ( ON-TABLE ?auto_349771 ) ( ON ?auto_349772 ?auto_349771 ) ( ON ?auto_349773 ?auto_349772 ) ( not ( = ?auto_349771 ?auto_349772 ) ) ( not ( = ?auto_349771 ?auto_349773 ) ) ( not ( = ?auto_349771 ?auto_349774 ) ) ( not ( = ?auto_349771 ?auto_349775 ) ) ( not ( = ?auto_349771 ?auto_349776 ) ) ( not ( = ?auto_349771 ?auto_349777 ) ) ( not ( = ?auto_349771 ?auto_349778 ) ) ( not ( = ?auto_349771 ?auto_349779 ) ) ( not ( = ?auto_349771 ?auto_349780 ) ) ( not ( = ?auto_349771 ?auto_349781 ) ) ( not ( = ?auto_349771 ?auto_349782 ) ) ( not ( = ?auto_349772 ?auto_349773 ) ) ( not ( = ?auto_349772 ?auto_349774 ) ) ( not ( = ?auto_349772 ?auto_349775 ) ) ( not ( = ?auto_349772 ?auto_349776 ) ) ( not ( = ?auto_349772 ?auto_349777 ) ) ( not ( = ?auto_349772 ?auto_349778 ) ) ( not ( = ?auto_349772 ?auto_349779 ) ) ( not ( = ?auto_349772 ?auto_349780 ) ) ( not ( = ?auto_349772 ?auto_349781 ) ) ( not ( = ?auto_349772 ?auto_349782 ) ) ( not ( = ?auto_349773 ?auto_349774 ) ) ( not ( = ?auto_349773 ?auto_349775 ) ) ( not ( = ?auto_349773 ?auto_349776 ) ) ( not ( = ?auto_349773 ?auto_349777 ) ) ( not ( = ?auto_349773 ?auto_349778 ) ) ( not ( = ?auto_349773 ?auto_349779 ) ) ( not ( = ?auto_349773 ?auto_349780 ) ) ( not ( = ?auto_349773 ?auto_349781 ) ) ( not ( = ?auto_349773 ?auto_349782 ) ) ( not ( = ?auto_349774 ?auto_349775 ) ) ( not ( = ?auto_349774 ?auto_349776 ) ) ( not ( = ?auto_349774 ?auto_349777 ) ) ( not ( = ?auto_349774 ?auto_349778 ) ) ( not ( = ?auto_349774 ?auto_349779 ) ) ( not ( = ?auto_349774 ?auto_349780 ) ) ( not ( = ?auto_349774 ?auto_349781 ) ) ( not ( = ?auto_349774 ?auto_349782 ) ) ( not ( = ?auto_349775 ?auto_349776 ) ) ( not ( = ?auto_349775 ?auto_349777 ) ) ( not ( = ?auto_349775 ?auto_349778 ) ) ( not ( = ?auto_349775 ?auto_349779 ) ) ( not ( = ?auto_349775 ?auto_349780 ) ) ( not ( = ?auto_349775 ?auto_349781 ) ) ( not ( = ?auto_349775 ?auto_349782 ) ) ( not ( = ?auto_349776 ?auto_349777 ) ) ( not ( = ?auto_349776 ?auto_349778 ) ) ( not ( = ?auto_349776 ?auto_349779 ) ) ( not ( = ?auto_349776 ?auto_349780 ) ) ( not ( = ?auto_349776 ?auto_349781 ) ) ( not ( = ?auto_349776 ?auto_349782 ) ) ( not ( = ?auto_349777 ?auto_349778 ) ) ( not ( = ?auto_349777 ?auto_349779 ) ) ( not ( = ?auto_349777 ?auto_349780 ) ) ( not ( = ?auto_349777 ?auto_349781 ) ) ( not ( = ?auto_349777 ?auto_349782 ) ) ( not ( = ?auto_349778 ?auto_349779 ) ) ( not ( = ?auto_349778 ?auto_349780 ) ) ( not ( = ?auto_349778 ?auto_349781 ) ) ( not ( = ?auto_349778 ?auto_349782 ) ) ( not ( = ?auto_349779 ?auto_349780 ) ) ( not ( = ?auto_349779 ?auto_349781 ) ) ( not ( = ?auto_349779 ?auto_349782 ) ) ( not ( = ?auto_349780 ?auto_349781 ) ) ( not ( = ?auto_349780 ?auto_349782 ) ) ( not ( = ?auto_349781 ?auto_349782 ) ) ( ON ?auto_349780 ?auto_349781 ) ( ON ?auto_349779 ?auto_349780 ) ( ON ?auto_349778 ?auto_349779 ) ( ON ?auto_349777 ?auto_349778 ) ( ON ?auto_349776 ?auto_349777 ) ( ON ?auto_349775 ?auto_349776 ) ( CLEAR ?auto_349773 ) ( ON ?auto_349774 ?auto_349775 ) ( CLEAR ?auto_349774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_349771 ?auto_349772 ?auto_349773 ?auto_349774 )
      ( MAKE-11PILE ?auto_349771 ?auto_349772 ?auto_349773 ?auto_349774 ?auto_349775 ?auto_349776 ?auto_349777 ?auto_349778 ?auto_349779 ?auto_349780 ?auto_349781 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349794 - BLOCK
      ?auto_349795 - BLOCK
      ?auto_349796 - BLOCK
      ?auto_349797 - BLOCK
      ?auto_349798 - BLOCK
      ?auto_349799 - BLOCK
      ?auto_349800 - BLOCK
      ?auto_349801 - BLOCK
      ?auto_349802 - BLOCK
      ?auto_349803 - BLOCK
      ?auto_349804 - BLOCK
    )
    :vars
    (
      ?auto_349805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349804 ?auto_349805 ) ( ON-TABLE ?auto_349794 ) ( ON ?auto_349795 ?auto_349794 ) ( not ( = ?auto_349794 ?auto_349795 ) ) ( not ( = ?auto_349794 ?auto_349796 ) ) ( not ( = ?auto_349794 ?auto_349797 ) ) ( not ( = ?auto_349794 ?auto_349798 ) ) ( not ( = ?auto_349794 ?auto_349799 ) ) ( not ( = ?auto_349794 ?auto_349800 ) ) ( not ( = ?auto_349794 ?auto_349801 ) ) ( not ( = ?auto_349794 ?auto_349802 ) ) ( not ( = ?auto_349794 ?auto_349803 ) ) ( not ( = ?auto_349794 ?auto_349804 ) ) ( not ( = ?auto_349794 ?auto_349805 ) ) ( not ( = ?auto_349795 ?auto_349796 ) ) ( not ( = ?auto_349795 ?auto_349797 ) ) ( not ( = ?auto_349795 ?auto_349798 ) ) ( not ( = ?auto_349795 ?auto_349799 ) ) ( not ( = ?auto_349795 ?auto_349800 ) ) ( not ( = ?auto_349795 ?auto_349801 ) ) ( not ( = ?auto_349795 ?auto_349802 ) ) ( not ( = ?auto_349795 ?auto_349803 ) ) ( not ( = ?auto_349795 ?auto_349804 ) ) ( not ( = ?auto_349795 ?auto_349805 ) ) ( not ( = ?auto_349796 ?auto_349797 ) ) ( not ( = ?auto_349796 ?auto_349798 ) ) ( not ( = ?auto_349796 ?auto_349799 ) ) ( not ( = ?auto_349796 ?auto_349800 ) ) ( not ( = ?auto_349796 ?auto_349801 ) ) ( not ( = ?auto_349796 ?auto_349802 ) ) ( not ( = ?auto_349796 ?auto_349803 ) ) ( not ( = ?auto_349796 ?auto_349804 ) ) ( not ( = ?auto_349796 ?auto_349805 ) ) ( not ( = ?auto_349797 ?auto_349798 ) ) ( not ( = ?auto_349797 ?auto_349799 ) ) ( not ( = ?auto_349797 ?auto_349800 ) ) ( not ( = ?auto_349797 ?auto_349801 ) ) ( not ( = ?auto_349797 ?auto_349802 ) ) ( not ( = ?auto_349797 ?auto_349803 ) ) ( not ( = ?auto_349797 ?auto_349804 ) ) ( not ( = ?auto_349797 ?auto_349805 ) ) ( not ( = ?auto_349798 ?auto_349799 ) ) ( not ( = ?auto_349798 ?auto_349800 ) ) ( not ( = ?auto_349798 ?auto_349801 ) ) ( not ( = ?auto_349798 ?auto_349802 ) ) ( not ( = ?auto_349798 ?auto_349803 ) ) ( not ( = ?auto_349798 ?auto_349804 ) ) ( not ( = ?auto_349798 ?auto_349805 ) ) ( not ( = ?auto_349799 ?auto_349800 ) ) ( not ( = ?auto_349799 ?auto_349801 ) ) ( not ( = ?auto_349799 ?auto_349802 ) ) ( not ( = ?auto_349799 ?auto_349803 ) ) ( not ( = ?auto_349799 ?auto_349804 ) ) ( not ( = ?auto_349799 ?auto_349805 ) ) ( not ( = ?auto_349800 ?auto_349801 ) ) ( not ( = ?auto_349800 ?auto_349802 ) ) ( not ( = ?auto_349800 ?auto_349803 ) ) ( not ( = ?auto_349800 ?auto_349804 ) ) ( not ( = ?auto_349800 ?auto_349805 ) ) ( not ( = ?auto_349801 ?auto_349802 ) ) ( not ( = ?auto_349801 ?auto_349803 ) ) ( not ( = ?auto_349801 ?auto_349804 ) ) ( not ( = ?auto_349801 ?auto_349805 ) ) ( not ( = ?auto_349802 ?auto_349803 ) ) ( not ( = ?auto_349802 ?auto_349804 ) ) ( not ( = ?auto_349802 ?auto_349805 ) ) ( not ( = ?auto_349803 ?auto_349804 ) ) ( not ( = ?auto_349803 ?auto_349805 ) ) ( not ( = ?auto_349804 ?auto_349805 ) ) ( ON ?auto_349803 ?auto_349804 ) ( ON ?auto_349802 ?auto_349803 ) ( ON ?auto_349801 ?auto_349802 ) ( ON ?auto_349800 ?auto_349801 ) ( ON ?auto_349799 ?auto_349800 ) ( ON ?auto_349798 ?auto_349799 ) ( ON ?auto_349797 ?auto_349798 ) ( CLEAR ?auto_349795 ) ( ON ?auto_349796 ?auto_349797 ) ( CLEAR ?auto_349796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_349794 ?auto_349795 ?auto_349796 )
      ( MAKE-11PILE ?auto_349794 ?auto_349795 ?auto_349796 ?auto_349797 ?auto_349798 ?auto_349799 ?auto_349800 ?auto_349801 ?auto_349802 ?auto_349803 ?auto_349804 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349817 - BLOCK
      ?auto_349818 - BLOCK
      ?auto_349819 - BLOCK
      ?auto_349820 - BLOCK
      ?auto_349821 - BLOCK
      ?auto_349822 - BLOCK
      ?auto_349823 - BLOCK
      ?auto_349824 - BLOCK
      ?auto_349825 - BLOCK
      ?auto_349826 - BLOCK
      ?auto_349827 - BLOCK
    )
    :vars
    (
      ?auto_349828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349827 ?auto_349828 ) ( ON-TABLE ?auto_349817 ) ( ON ?auto_349818 ?auto_349817 ) ( not ( = ?auto_349817 ?auto_349818 ) ) ( not ( = ?auto_349817 ?auto_349819 ) ) ( not ( = ?auto_349817 ?auto_349820 ) ) ( not ( = ?auto_349817 ?auto_349821 ) ) ( not ( = ?auto_349817 ?auto_349822 ) ) ( not ( = ?auto_349817 ?auto_349823 ) ) ( not ( = ?auto_349817 ?auto_349824 ) ) ( not ( = ?auto_349817 ?auto_349825 ) ) ( not ( = ?auto_349817 ?auto_349826 ) ) ( not ( = ?auto_349817 ?auto_349827 ) ) ( not ( = ?auto_349817 ?auto_349828 ) ) ( not ( = ?auto_349818 ?auto_349819 ) ) ( not ( = ?auto_349818 ?auto_349820 ) ) ( not ( = ?auto_349818 ?auto_349821 ) ) ( not ( = ?auto_349818 ?auto_349822 ) ) ( not ( = ?auto_349818 ?auto_349823 ) ) ( not ( = ?auto_349818 ?auto_349824 ) ) ( not ( = ?auto_349818 ?auto_349825 ) ) ( not ( = ?auto_349818 ?auto_349826 ) ) ( not ( = ?auto_349818 ?auto_349827 ) ) ( not ( = ?auto_349818 ?auto_349828 ) ) ( not ( = ?auto_349819 ?auto_349820 ) ) ( not ( = ?auto_349819 ?auto_349821 ) ) ( not ( = ?auto_349819 ?auto_349822 ) ) ( not ( = ?auto_349819 ?auto_349823 ) ) ( not ( = ?auto_349819 ?auto_349824 ) ) ( not ( = ?auto_349819 ?auto_349825 ) ) ( not ( = ?auto_349819 ?auto_349826 ) ) ( not ( = ?auto_349819 ?auto_349827 ) ) ( not ( = ?auto_349819 ?auto_349828 ) ) ( not ( = ?auto_349820 ?auto_349821 ) ) ( not ( = ?auto_349820 ?auto_349822 ) ) ( not ( = ?auto_349820 ?auto_349823 ) ) ( not ( = ?auto_349820 ?auto_349824 ) ) ( not ( = ?auto_349820 ?auto_349825 ) ) ( not ( = ?auto_349820 ?auto_349826 ) ) ( not ( = ?auto_349820 ?auto_349827 ) ) ( not ( = ?auto_349820 ?auto_349828 ) ) ( not ( = ?auto_349821 ?auto_349822 ) ) ( not ( = ?auto_349821 ?auto_349823 ) ) ( not ( = ?auto_349821 ?auto_349824 ) ) ( not ( = ?auto_349821 ?auto_349825 ) ) ( not ( = ?auto_349821 ?auto_349826 ) ) ( not ( = ?auto_349821 ?auto_349827 ) ) ( not ( = ?auto_349821 ?auto_349828 ) ) ( not ( = ?auto_349822 ?auto_349823 ) ) ( not ( = ?auto_349822 ?auto_349824 ) ) ( not ( = ?auto_349822 ?auto_349825 ) ) ( not ( = ?auto_349822 ?auto_349826 ) ) ( not ( = ?auto_349822 ?auto_349827 ) ) ( not ( = ?auto_349822 ?auto_349828 ) ) ( not ( = ?auto_349823 ?auto_349824 ) ) ( not ( = ?auto_349823 ?auto_349825 ) ) ( not ( = ?auto_349823 ?auto_349826 ) ) ( not ( = ?auto_349823 ?auto_349827 ) ) ( not ( = ?auto_349823 ?auto_349828 ) ) ( not ( = ?auto_349824 ?auto_349825 ) ) ( not ( = ?auto_349824 ?auto_349826 ) ) ( not ( = ?auto_349824 ?auto_349827 ) ) ( not ( = ?auto_349824 ?auto_349828 ) ) ( not ( = ?auto_349825 ?auto_349826 ) ) ( not ( = ?auto_349825 ?auto_349827 ) ) ( not ( = ?auto_349825 ?auto_349828 ) ) ( not ( = ?auto_349826 ?auto_349827 ) ) ( not ( = ?auto_349826 ?auto_349828 ) ) ( not ( = ?auto_349827 ?auto_349828 ) ) ( ON ?auto_349826 ?auto_349827 ) ( ON ?auto_349825 ?auto_349826 ) ( ON ?auto_349824 ?auto_349825 ) ( ON ?auto_349823 ?auto_349824 ) ( ON ?auto_349822 ?auto_349823 ) ( ON ?auto_349821 ?auto_349822 ) ( ON ?auto_349820 ?auto_349821 ) ( CLEAR ?auto_349818 ) ( ON ?auto_349819 ?auto_349820 ) ( CLEAR ?auto_349819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_349817 ?auto_349818 ?auto_349819 )
      ( MAKE-11PILE ?auto_349817 ?auto_349818 ?auto_349819 ?auto_349820 ?auto_349821 ?auto_349822 ?auto_349823 ?auto_349824 ?auto_349825 ?auto_349826 ?auto_349827 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349840 - BLOCK
      ?auto_349841 - BLOCK
      ?auto_349842 - BLOCK
      ?auto_349843 - BLOCK
      ?auto_349844 - BLOCK
      ?auto_349845 - BLOCK
      ?auto_349846 - BLOCK
      ?auto_349847 - BLOCK
      ?auto_349848 - BLOCK
      ?auto_349849 - BLOCK
      ?auto_349850 - BLOCK
    )
    :vars
    (
      ?auto_349851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349850 ?auto_349851 ) ( ON-TABLE ?auto_349840 ) ( not ( = ?auto_349840 ?auto_349841 ) ) ( not ( = ?auto_349840 ?auto_349842 ) ) ( not ( = ?auto_349840 ?auto_349843 ) ) ( not ( = ?auto_349840 ?auto_349844 ) ) ( not ( = ?auto_349840 ?auto_349845 ) ) ( not ( = ?auto_349840 ?auto_349846 ) ) ( not ( = ?auto_349840 ?auto_349847 ) ) ( not ( = ?auto_349840 ?auto_349848 ) ) ( not ( = ?auto_349840 ?auto_349849 ) ) ( not ( = ?auto_349840 ?auto_349850 ) ) ( not ( = ?auto_349840 ?auto_349851 ) ) ( not ( = ?auto_349841 ?auto_349842 ) ) ( not ( = ?auto_349841 ?auto_349843 ) ) ( not ( = ?auto_349841 ?auto_349844 ) ) ( not ( = ?auto_349841 ?auto_349845 ) ) ( not ( = ?auto_349841 ?auto_349846 ) ) ( not ( = ?auto_349841 ?auto_349847 ) ) ( not ( = ?auto_349841 ?auto_349848 ) ) ( not ( = ?auto_349841 ?auto_349849 ) ) ( not ( = ?auto_349841 ?auto_349850 ) ) ( not ( = ?auto_349841 ?auto_349851 ) ) ( not ( = ?auto_349842 ?auto_349843 ) ) ( not ( = ?auto_349842 ?auto_349844 ) ) ( not ( = ?auto_349842 ?auto_349845 ) ) ( not ( = ?auto_349842 ?auto_349846 ) ) ( not ( = ?auto_349842 ?auto_349847 ) ) ( not ( = ?auto_349842 ?auto_349848 ) ) ( not ( = ?auto_349842 ?auto_349849 ) ) ( not ( = ?auto_349842 ?auto_349850 ) ) ( not ( = ?auto_349842 ?auto_349851 ) ) ( not ( = ?auto_349843 ?auto_349844 ) ) ( not ( = ?auto_349843 ?auto_349845 ) ) ( not ( = ?auto_349843 ?auto_349846 ) ) ( not ( = ?auto_349843 ?auto_349847 ) ) ( not ( = ?auto_349843 ?auto_349848 ) ) ( not ( = ?auto_349843 ?auto_349849 ) ) ( not ( = ?auto_349843 ?auto_349850 ) ) ( not ( = ?auto_349843 ?auto_349851 ) ) ( not ( = ?auto_349844 ?auto_349845 ) ) ( not ( = ?auto_349844 ?auto_349846 ) ) ( not ( = ?auto_349844 ?auto_349847 ) ) ( not ( = ?auto_349844 ?auto_349848 ) ) ( not ( = ?auto_349844 ?auto_349849 ) ) ( not ( = ?auto_349844 ?auto_349850 ) ) ( not ( = ?auto_349844 ?auto_349851 ) ) ( not ( = ?auto_349845 ?auto_349846 ) ) ( not ( = ?auto_349845 ?auto_349847 ) ) ( not ( = ?auto_349845 ?auto_349848 ) ) ( not ( = ?auto_349845 ?auto_349849 ) ) ( not ( = ?auto_349845 ?auto_349850 ) ) ( not ( = ?auto_349845 ?auto_349851 ) ) ( not ( = ?auto_349846 ?auto_349847 ) ) ( not ( = ?auto_349846 ?auto_349848 ) ) ( not ( = ?auto_349846 ?auto_349849 ) ) ( not ( = ?auto_349846 ?auto_349850 ) ) ( not ( = ?auto_349846 ?auto_349851 ) ) ( not ( = ?auto_349847 ?auto_349848 ) ) ( not ( = ?auto_349847 ?auto_349849 ) ) ( not ( = ?auto_349847 ?auto_349850 ) ) ( not ( = ?auto_349847 ?auto_349851 ) ) ( not ( = ?auto_349848 ?auto_349849 ) ) ( not ( = ?auto_349848 ?auto_349850 ) ) ( not ( = ?auto_349848 ?auto_349851 ) ) ( not ( = ?auto_349849 ?auto_349850 ) ) ( not ( = ?auto_349849 ?auto_349851 ) ) ( not ( = ?auto_349850 ?auto_349851 ) ) ( ON ?auto_349849 ?auto_349850 ) ( ON ?auto_349848 ?auto_349849 ) ( ON ?auto_349847 ?auto_349848 ) ( ON ?auto_349846 ?auto_349847 ) ( ON ?auto_349845 ?auto_349846 ) ( ON ?auto_349844 ?auto_349845 ) ( ON ?auto_349843 ?auto_349844 ) ( ON ?auto_349842 ?auto_349843 ) ( CLEAR ?auto_349840 ) ( ON ?auto_349841 ?auto_349842 ) ( CLEAR ?auto_349841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_349840 ?auto_349841 )
      ( MAKE-11PILE ?auto_349840 ?auto_349841 ?auto_349842 ?auto_349843 ?auto_349844 ?auto_349845 ?auto_349846 ?auto_349847 ?auto_349848 ?auto_349849 ?auto_349850 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349863 - BLOCK
      ?auto_349864 - BLOCK
      ?auto_349865 - BLOCK
      ?auto_349866 - BLOCK
      ?auto_349867 - BLOCK
      ?auto_349868 - BLOCK
      ?auto_349869 - BLOCK
      ?auto_349870 - BLOCK
      ?auto_349871 - BLOCK
      ?auto_349872 - BLOCK
      ?auto_349873 - BLOCK
    )
    :vars
    (
      ?auto_349874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349873 ?auto_349874 ) ( ON-TABLE ?auto_349863 ) ( not ( = ?auto_349863 ?auto_349864 ) ) ( not ( = ?auto_349863 ?auto_349865 ) ) ( not ( = ?auto_349863 ?auto_349866 ) ) ( not ( = ?auto_349863 ?auto_349867 ) ) ( not ( = ?auto_349863 ?auto_349868 ) ) ( not ( = ?auto_349863 ?auto_349869 ) ) ( not ( = ?auto_349863 ?auto_349870 ) ) ( not ( = ?auto_349863 ?auto_349871 ) ) ( not ( = ?auto_349863 ?auto_349872 ) ) ( not ( = ?auto_349863 ?auto_349873 ) ) ( not ( = ?auto_349863 ?auto_349874 ) ) ( not ( = ?auto_349864 ?auto_349865 ) ) ( not ( = ?auto_349864 ?auto_349866 ) ) ( not ( = ?auto_349864 ?auto_349867 ) ) ( not ( = ?auto_349864 ?auto_349868 ) ) ( not ( = ?auto_349864 ?auto_349869 ) ) ( not ( = ?auto_349864 ?auto_349870 ) ) ( not ( = ?auto_349864 ?auto_349871 ) ) ( not ( = ?auto_349864 ?auto_349872 ) ) ( not ( = ?auto_349864 ?auto_349873 ) ) ( not ( = ?auto_349864 ?auto_349874 ) ) ( not ( = ?auto_349865 ?auto_349866 ) ) ( not ( = ?auto_349865 ?auto_349867 ) ) ( not ( = ?auto_349865 ?auto_349868 ) ) ( not ( = ?auto_349865 ?auto_349869 ) ) ( not ( = ?auto_349865 ?auto_349870 ) ) ( not ( = ?auto_349865 ?auto_349871 ) ) ( not ( = ?auto_349865 ?auto_349872 ) ) ( not ( = ?auto_349865 ?auto_349873 ) ) ( not ( = ?auto_349865 ?auto_349874 ) ) ( not ( = ?auto_349866 ?auto_349867 ) ) ( not ( = ?auto_349866 ?auto_349868 ) ) ( not ( = ?auto_349866 ?auto_349869 ) ) ( not ( = ?auto_349866 ?auto_349870 ) ) ( not ( = ?auto_349866 ?auto_349871 ) ) ( not ( = ?auto_349866 ?auto_349872 ) ) ( not ( = ?auto_349866 ?auto_349873 ) ) ( not ( = ?auto_349866 ?auto_349874 ) ) ( not ( = ?auto_349867 ?auto_349868 ) ) ( not ( = ?auto_349867 ?auto_349869 ) ) ( not ( = ?auto_349867 ?auto_349870 ) ) ( not ( = ?auto_349867 ?auto_349871 ) ) ( not ( = ?auto_349867 ?auto_349872 ) ) ( not ( = ?auto_349867 ?auto_349873 ) ) ( not ( = ?auto_349867 ?auto_349874 ) ) ( not ( = ?auto_349868 ?auto_349869 ) ) ( not ( = ?auto_349868 ?auto_349870 ) ) ( not ( = ?auto_349868 ?auto_349871 ) ) ( not ( = ?auto_349868 ?auto_349872 ) ) ( not ( = ?auto_349868 ?auto_349873 ) ) ( not ( = ?auto_349868 ?auto_349874 ) ) ( not ( = ?auto_349869 ?auto_349870 ) ) ( not ( = ?auto_349869 ?auto_349871 ) ) ( not ( = ?auto_349869 ?auto_349872 ) ) ( not ( = ?auto_349869 ?auto_349873 ) ) ( not ( = ?auto_349869 ?auto_349874 ) ) ( not ( = ?auto_349870 ?auto_349871 ) ) ( not ( = ?auto_349870 ?auto_349872 ) ) ( not ( = ?auto_349870 ?auto_349873 ) ) ( not ( = ?auto_349870 ?auto_349874 ) ) ( not ( = ?auto_349871 ?auto_349872 ) ) ( not ( = ?auto_349871 ?auto_349873 ) ) ( not ( = ?auto_349871 ?auto_349874 ) ) ( not ( = ?auto_349872 ?auto_349873 ) ) ( not ( = ?auto_349872 ?auto_349874 ) ) ( not ( = ?auto_349873 ?auto_349874 ) ) ( ON ?auto_349872 ?auto_349873 ) ( ON ?auto_349871 ?auto_349872 ) ( ON ?auto_349870 ?auto_349871 ) ( ON ?auto_349869 ?auto_349870 ) ( ON ?auto_349868 ?auto_349869 ) ( ON ?auto_349867 ?auto_349868 ) ( ON ?auto_349866 ?auto_349867 ) ( ON ?auto_349865 ?auto_349866 ) ( CLEAR ?auto_349863 ) ( ON ?auto_349864 ?auto_349865 ) ( CLEAR ?auto_349864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_349863 ?auto_349864 )
      ( MAKE-11PILE ?auto_349863 ?auto_349864 ?auto_349865 ?auto_349866 ?auto_349867 ?auto_349868 ?auto_349869 ?auto_349870 ?auto_349871 ?auto_349872 ?auto_349873 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349886 - BLOCK
      ?auto_349887 - BLOCK
      ?auto_349888 - BLOCK
      ?auto_349889 - BLOCK
      ?auto_349890 - BLOCK
      ?auto_349891 - BLOCK
      ?auto_349892 - BLOCK
      ?auto_349893 - BLOCK
      ?auto_349894 - BLOCK
      ?auto_349895 - BLOCK
      ?auto_349896 - BLOCK
    )
    :vars
    (
      ?auto_349897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349896 ?auto_349897 ) ( not ( = ?auto_349886 ?auto_349887 ) ) ( not ( = ?auto_349886 ?auto_349888 ) ) ( not ( = ?auto_349886 ?auto_349889 ) ) ( not ( = ?auto_349886 ?auto_349890 ) ) ( not ( = ?auto_349886 ?auto_349891 ) ) ( not ( = ?auto_349886 ?auto_349892 ) ) ( not ( = ?auto_349886 ?auto_349893 ) ) ( not ( = ?auto_349886 ?auto_349894 ) ) ( not ( = ?auto_349886 ?auto_349895 ) ) ( not ( = ?auto_349886 ?auto_349896 ) ) ( not ( = ?auto_349886 ?auto_349897 ) ) ( not ( = ?auto_349887 ?auto_349888 ) ) ( not ( = ?auto_349887 ?auto_349889 ) ) ( not ( = ?auto_349887 ?auto_349890 ) ) ( not ( = ?auto_349887 ?auto_349891 ) ) ( not ( = ?auto_349887 ?auto_349892 ) ) ( not ( = ?auto_349887 ?auto_349893 ) ) ( not ( = ?auto_349887 ?auto_349894 ) ) ( not ( = ?auto_349887 ?auto_349895 ) ) ( not ( = ?auto_349887 ?auto_349896 ) ) ( not ( = ?auto_349887 ?auto_349897 ) ) ( not ( = ?auto_349888 ?auto_349889 ) ) ( not ( = ?auto_349888 ?auto_349890 ) ) ( not ( = ?auto_349888 ?auto_349891 ) ) ( not ( = ?auto_349888 ?auto_349892 ) ) ( not ( = ?auto_349888 ?auto_349893 ) ) ( not ( = ?auto_349888 ?auto_349894 ) ) ( not ( = ?auto_349888 ?auto_349895 ) ) ( not ( = ?auto_349888 ?auto_349896 ) ) ( not ( = ?auto_349888 ?auto_349897 ) ) ( not ( = ?auto_349889 ?auto_349890 ) ) ( not ( = ?auto_349889 ?auto_349891 ) ) ( not ( = ?auto_349889 ?auto_349892 ) ) ( not ( = ?auto_349889 ?auto_349893 ) ) ( not ( = ?auto_349889 ?auto_349894 ) ) ( not ( = ?auto_349889 ?auto_349895 ) ) ( not ( = ?auto_349889 ?auto_349896 ) ) ( not ( = ?auto_349889 ?auto_349897 ) ) ( not ( = ?auto_349890 ?auto_349891 ) ) ( not ( = ?auto_349890 ?auto_349892 ) ) ( not ( = ?auto_349890 ?auto_349893 ) ) ( not ( = ?auto_349890 ?auto_349894 ) ) ( not ( = ?auto_349890 ?auto_349895 ) ) ( not ( = ?auto_349890 ?auto_349896 ) ) ( not ( = ?auto_349890 ?auto_349897 ) ) ( not ( = ?auto_349891 ?auto_349892 ) ) ( not ( = ?auto_349891 ?auto_349893 ) ) ( not ( = ?auto_349891 ?auto_349894 ) ) ( not ( = ?auto_349891 ?auto_349895 ) ) ( not ( = ?auto_349891 ?auto_349896 ) ) ( not ( = ?auto_349891 ?auto_349897 ) ) ( not ( = ?auto_349892 ?auto_349893 ) ) ( not ( = ?auto_349892 ?auto_349894 ) ) ( not ( = ?auto_349892 ?auto_349895 ) ) ( not ( = ?auto_349892 ?auto_349896 ) ) ( not ( = ?auto_349892 ?auto_349897 ) ) ( not ( = ?auto_349893 ?auto_349894 ) ) ( not ( = ?auto_349893 ?auto_349895 ) ) ( not ( = ?auto_349893 ?auto_349896 ) ) ( not ( = ?auto_349893 ?auto_349897 ) ) ( not ( = ?auto_349894 ?auto_349895 ) ) ( not ( = ?auto_349894 ?auto_349896 ) ) ( not ( = ?auto_349894 ?auto_349897 ) ) ( not ( = ?auto_349895 ?auto_349896 ) ) ( not ( = ?auto_349895 ?auto_349897 ) ) ( not ( = ?auto_349896 ?auto_349897 ) ) ( ON ?auto_349895 ?auto_349896 ) ( ON ?auto_349894 ?auto_349895 ) ( ON ?auto_349893 ?auto_349894 ) ( ON ?auto_349892 ?auto_349893 ) ( ON ?auto_349891 ?auto_349892 ) ( ON ?auto_349890 ?auto_349891 ) ( ON ?auto_349889 ?auto_349890 ) ( ON ?auto_349888 ?auto_349889 ) ( ON ?auto_349887 ?auto_349888 ) ( ON ?auto_349886 ?auto_349887 ) ( CLEAR ?auto_349886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_349886 )
      ( MAKE-11PILE ?auto_349886 ?auto_349887 ?auto_349888 ?auto_349889 ?auto_349890 ?auto_349891 ?auto_349892 ?auto_349893 ?auto_349894 ?auto_349895 ?auto_349896 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_349909 - BLOCK
      ?auto_349910 - BLOCK
      ?auto_349911 - BLOCK
      ?auto_349912 - BLOCK
      ?auto_349913 - BLOCK
      ?auto_349914 - BLOCK
      ?auto_349915 - BLOCK
      ?auto_349916 - BLOCK
      ?auto_349917 - BLOCK
      ?auto_349918 - BLOCK
      ?auto_349919 - BLOCK
    )
    :vars
    (
      ?auto_349920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349919 ?auto_349920 ) ( not ( = ?auto_349909 ?auto_349910 ) ) ( not ( = ?auto_349909 ?auto_349911 ) ) ( not ( = ?auto_349909 ?auto_349912 ) ) ( not ( = ?auto_349909 ?auto_349913 ) ) ( not ( = ?auto_349909 ?auto_349914 ) ) ( not ( = ?auto_349909 ?auto_349915 ) ) ( not ( = ?auto_349909 ?auto_349916 ) ) ( not ( = ?auto_349909 ?auto_349917 ) ) ( not ( = ?auto_349909 ?auto_349918 ) ) ( not ( = ?auto_349909 ?auto_349919 ) ) ( not ( = ?auto_349909 ?auto_349920 ) ) ( not ( = ?auto_349910 ?auto_349911 ) ) ( not ( = ?auto_349910 ?auto_349912 ) ) ( not ( = ?auto_349910 ?auto_349913 ) ) ( not ( = ?auto_349910 ?auto_349914 ) ) ( not ( = ?auto_349910 ?auto_349915 ) ) ( not ( = ?auto_349910 ?auto_349916 ) ) ( not ( = ?auto_349910 ?auto_349917 ) ) ( not ( = ?auto_349910 ?auto_349918 ) ) ( not ( = ?auto_349910 ?auto_349919 ) ) ( not ( = ?auto_349910 ?auto_349920 ) ) ( not ( = ?auto_349911 ?auto_349912 ) ) ( not ( = ?auto_349911 ?auto_349913 ) ) ( not ( = ?auto_349911 ?auto_349914 ) ) ( not ( = ?auto_349911 ?auto_349915 ) ) ( not ( = ?auto_349911 ?auto_349916 ) ) ( not ( = ?auto_349911 ?auto_349917 ) ) ( not ( = ?auto_349911 ?auto_349918 ) ) ( not ( = ?auto_349911 ?auto_349919 ) ) ( not ( = ?auto_349911 ?auto_349920 ) ) ( not ( = ?auto_349912 ?auto_349913 ) ) ( not ( = ?auto_349912 ?auto_349914 ) ) ( not ( = ?auto_349912 ?auto_349915 ) ) ( not ( = ?auto_349912 ?auto_349916 ) ) ( not ( = ?auto_349912 ?auto_349917 ) ) ( not ( = ?auto_349912 ?auto_349918 ) ) ( not ( = ?auto_349912 ?auto_349919 ) ) ( not ( = ?auto_349912 ?auto_349920 ) ) ( not ( = ?auto_349913 ?auto_349914 ) ) ( not ( = ?auto_349913 ?auto_349915 ) ) ( not ( = ?auto_349913 ?auto_349916 ) ) ( not ( = ?auto_349913 ?auto_349917 ) ) ( not ( = ?auto_349913 ?auto_349918 ) ) ( not ( = ?auto_349913 ?auto_349919 ) ) ( not ( = ?auto_349913 ?auto_349920 ) ) ( not ( = ?auto_349914 ?auto_349915 ) ) ( not ( = ?auto_349914 ?auto_349916 ) ) ( not ( = ?auto_349914 ?auto_349917 ) ) ( not ( = ?auto_349914 ?auto_349918 ) ) ( not ( = ?auto_349914 ?auto_349919 ) ) ( not ( = ?auto_349914 ?auto_349920 ) ) ( not ( = ?auto_349915 ?auto_349916 ) ) ( not ( = ?auto_349915 ?auto_349917 ) ) ( not ( = ?auto_349915 ?auto_349918 ) ) ( not ( = ?auto_349915 ?auto_349919 ) ) ( not ( = ?auto_349915 ?auto_349920 ) ) ( not ( = ?auto_349916 ?auto_349917 ) ) ( not ( = ?auto_349916 ?auto_349918 ) ) ( not ( = ?auto_349916 ?auto_349919 ) ) ( not ( = ?auto_349916 ?auto_349920 ) ) ( not ( = ?auto_349917 ?auto_349918 ) ) ( not ( = ?auto_349917 ?auto_349919 ) ) ( not ( = ?auto_349917 ?auto_349920 ) ) ( not ( = ?auto_349918 ?auto_349919 ) ) ( not ( = ?auto_349918 ?auto_349920 ) ) ( not ( = ?auto_349919 ?auto_349920 ) ) ( ON ?auto_349918 ?auto_349919 ) ( ON ?auto_349917 ?auto_349918 ) ( ON ?auto_349916 ?auto_349917 ) ( ON ?auto_349915 ?auto_349916 ) ( ON ?auto_349914 ?auto_349915 ) ( ON ?auto_349913 ?auto_349914 ) ( ON ?auto_349912 ?auto_349913 ) ( ON ?auto_349911 ?auto_349912 ) ( ON ?auto_349910 ?auto_349911 ) ( ON ?auto_349909 ?auto_349910 ) ( CLEAR ?auto_349909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_349909 )
      ( MAKE-11PILE ?auto_349909 ?auto_349910 ?auto_349911 ?auto_349912 ?auto_349913 ?auto_349914 ?auto_349915 ?auto_349916 ?auto_349917 ?auto_349918 ?auto_349919 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_349933 - BLOCK
      ?auto_349934 - BLOCK
      ?auto_349935 - BLOCK
      ?auto_349936 - BLOCK
      ?auto_349937 - BLOCK
      ?auto_349938 - BLOCK
      ?auto_349939 - BLOCK
      ?auto_349940 - BLOCK
      ?auto_349941 - BLOCK
      ?auto_349942 - BLOCK
      ?auto_349943 - BLOCK
      ?auto_349944 - BLOCK
    )
    :vars
    (
      ?auto_349945 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_349943 ) ( ON ?auto_349944 ?auto_349945 ) ( CLEAR ?auto_349944 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_349933 ) ( ON ?auto_349934 ?auto_349933 ) ( ON ?auto_349935 ?auto_349934 ) ( ON ?auto_349936 ?auto_349935 ) ( ON ?auto_349937 ?auto_349936 ) ( ON ?auto_349938 ?auto_349937 ) ( ON ?auto_349939 ?auto_349938 ) ( ON ?auto_349940 ?auto_349939 ) ( ON ?auto_349941 ?auto_349940 ) ( ON ?auto_349942 ?auto_349941 ) ( ON ?auto_349943 ?auto_349942 ) ( not ( = ?auto_349933 ?auto_349934 ) ) ( not ( = ?auto_349933 ?auto_349935 ) ) ( not ( = ?auto_349933 ?auto_349936 ) ) ( not ( = ?auto_349933 ?auto_349937 ) ) ( not ( = ?auto_349933 ?auto_349938 ) ) ( not ( = ?auto_349933 ?auto_349939 ) ) ( not ( = ?auto_349933 ?auto_349940 ) ) ( not ( = ?auto_349933 ?auto_349941 ) ) ( not ( = ?auto_349933 ?auto_349942 ) ) ( not ( = ?auto_349933 ?auto_349943 ) ) ( not ( = ?auto_349933 ?auto_349944 ) ) ( not ( = ?auto_349933 ?auto_349945 ) ) ( not ( = ?auto_349934 ?auto_349935 ) ) ( not ( = ?auto_349934 ?auto_349936 ) ) ( not ( = ?auto_349934 ?auto_349937 ) ) ( not ( = ?auto_349934 ?auto_349938 ) ) ( not ( = ?auto_349934 ?auto_349939 ) ) ( not ( = ?auto_349934 ?auto_349940 ) ) ( not ( = ?auto_349934 ?auto_349941 ) ) ( not ( = ?auto_349934 ?auto_349942 ) ) ( not ( = ?auto_349934 ?auto_349943 ) ) ( not ( = ?auto_349934 ?auto_349944 ) ) ( not ( = ?auto_349934 ?auto_349945 ) ) ( not ( = ?auto_349935 ?auto_349936 ) ) ( not ( = ?auto_349935 ?auto_349937 ) ) ( not ( = ?auto_349935 ?auto_349938 ) ) ( not ( = ?auto_349935 ?auto_349939 ) ) ( not ( = ?auto_349935 ?auto_349940 ) ) ( not ( = ?auto_349935 ?auto_349941 ) ) ( not ( = ?auto_349935 ?auto_349942 ) ) ( not ( = ?auto_349935 ?auto_349943 ) ) ( not ( = ?auto_349935 ?auto_349944 ) ) ( not ( = ?auto_349935 ?auto_349945 ) ) ( not ( = ?auto_349936 ?auto_349937 ) ) ( not ( = ?auto_349936 ?auto_349938 ) ) ( not ( = ?auto_349936 ?auto_349939 ) ) ( not ( = ?auto_349936 ?auto_349940 ) ) ( not ( = ?auto_349936 ?auto_349941 ) ) ( not ( = ?auto_349936 ?auto_349942 ) ) ( not ( = ?auto_349936 ?auto_349943 ) ) ( not ( = ?auto_349936 ?auto_349944 ) ) ( not ( = ?auto_349936 ?auto_349945 ) ) ( not ( = ?auto_349937 ?auto_349938 ) ) ( not ( = ?auto_349937 ?auto_349939 ) ) ( not ( = ?auto_349937 ?auto_349940 ) ) ( not ( = ?auto_349937 ?auto_349941 ) ) ( not ( = ?auto_349937 ?auto_349942 ) ) ( not ( = ?auto_349937 ?auto_349943 ) ) ( not ( = ?auto_349937 ?auto_349944 ) ) ( not ( = ?auto_349937 ?auto_349945 ) ) ( not ( = ?auto_349938 ?auto_349939 ) ) ( not ( = ?auto_349938 ?auto_349940 ) ) ( not ( = ?auto_349938 ?auto_349941 ) ) ( not ( = ?auto_349938 ?auto_349942 ) ) ( not ( = ?auto_349938 ?auto_349943 ) ) ( not ( = ?auto_349938 ?auto_349944 ) ) ( not ( = ?auto_349938 ?auto_349945 ) ) ( not ( = ?auto_349939 ?auto_349940 ) ) ( not ( = ?auto_349939 ?auto_349941 ) ) ( not ( = ?auto_349939 ?auto_349942 ) ) ( not ( = ?auto_349939 ?auto_349943 ) ) ( not ( = ?auto_349939 ?auto_349944 ) ) ( not ( = ?auto_349939 ?auto_349945 ) ) ( not ( = ?auto_349940 ?auto_349941 ) ) ( not ( = ?auto_349940 ?auto_349942 ) ) ( not ( = ?auto_349940 ?auto_349943 ) ) ( not ( = ?auto_349940 ?auto_349944 ) ) ( not ( = ?auto_349940 ?auto_349945 ) ) ( not ( = ?auto_349941 ?auto_349942 ) ) ( not ( = ?auto_349941 ?auto_349943 ) ) ( not ( = ?auto_349941 ?auto_349944 ) ) ( not ( = ?auto_349941 ?auto_349945 ) ) ( not ( = ?auto_349942 ?auto_349943 ) ) ( not ( = ?auto_349942 ?auto_349944 ) ) ( not ( = ?auto_349942 ?auto_349945 ) ) ( not ( = ?auto_349943 ?auto_349944 ) ) ( not ( = ?auto_349943 ?auto_349945 ) ) ( not ( = ?auto_349944 ?auto_349945 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_349944 ?auto_349945 )
      ( !STACK ?auto_349944 ?auto_349943 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_349958 - BLOCK
      ?auto_349959 - BLOCK
      ?auto_349960 - BLOCK
      ?auto_349961 - BLOCK
      ?auto_349962 - BLOCK
      ?auto_349963 - BLOCK
      ?auto_349964 - BLOCK
      ?auto_349965 - BLOCK
      ?auto_349966 - BLOCK
      ?auto_349967 - BLOCK
      ?auto_349968 - BLOCK
      ?auto_349969 - BLOCK
    )
    :vars
    (
      ?auto_349970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_349968 ) ( ON ?auto_349969 ?auto_349970 ) ( CLEAR ?auto_349969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_349958 ) ( ON ?auto_349959 ?auto_349958 ) ( ON ?auto_349960 ?auto_349959 ) ( ON ?auto_349961 ?auto_349960 ) ( ON ?auto_349962 ?auto_349961 ) ( ON ?auto_349963 ?auto_349962 ) ( ON ?auto_349964 ?auto_349963 ) ( ON ?auto_349965 ?auto_349964 ) ( ON ?auto_349966 ?auto_349965 ) ( ON ?auto_349967 ?auto_349966 ) ( ON ?auto_349968 ?auto_349967 ) ( not ( = ?auto_349958 ?auto_349959 ) ) ( not ( = ?auto_349958 ?auto_349960 ) ) ( not ( = ?auto_349958 ?auto_349961 ) ) ( not ( = ?auto_349958 ?auto_349962 ) ) ( not ( = ?auto_349958 ?auto_349963 ) ) ( not ( = ?auto_349958 ?auto_349964 ) ) ( not ( = ?auto_349958 ?auto_349965 ) ) ( not ( = ?auto_349958 ?auto_349966 ) ) ( not ( = ?auto_349958 ?auto_349967 ) ) ( not ( = ?auto_349958 ?auto_349968 ) ) ( not ( = ?auto_349958 ?auto_349969 ) ) ( not ( = ?auto_349958 ?auto_349970 ) ) ( not ( = ?auto_349959 ?auto_349960 ) ) ( not ( = ?auto_349959 ?auto_349961 ) ) ( not ( = ?auto_349959 ?auto_349962 ) ) ( not ( = ?auto_349959 ?auto_349963 ) ) ( not ( = ?auto_349959 ?auto_349964 ) ) ( not ( = ?auto_349959 ?auto_349965 ) ) ( not ( = ?auto_349959 ?auto_349966 ) ) ( not ( = ?auto_349959 ?auto_349967 ) ) ( not ( = ?auto_349959 ?auto_349968 ) ) ( not ( = ?auto_349959 ?auto_349969 ) ) ( not ( = ?auto_349959 ?auto_349970 ) ) ( not ( = ?auto_349960 ?auto_349961 ) ) ( not ( = ?auto_349960 ?auto_349962 ) ) ( not ( = ?auto_349960 ?auto_349963 ) ) ( not ( = ?auto_349960 ?auto_349964 ) ) ( not ( = ?auto_349960 ?auto_349965 ) ) ( not ( = ?auto_349960 ?auto_349966 ) ) ( not ( = ?auto_349960 ?auto_349967 ) ) ( not ( = ?auto_349960 ?auto_349968 ) ) ( not ( = ?auto_349960 ?auto_349969 ) ) ( not ( = ?auto_349960 ?auto_349970 ) ) ( not ( = ?auto_349961 ?auto_349962 ) ) ( not ( = ?auto_349961 ?auto_349963 ) ) ( not ( = ?auto_349961 ?auto_349964 ) ) ( not ( = ?auto_349961 ?auto_349965 ) ) ( not ( = ?auto_349961 ?auto_349966 ) ) ( not ( = ?auto_349961 ?auto_349967 ) ) ( not ( = ?auto_349961 ?auto_349968 ) ) ( not ( = ?auto_349961 ?auto_349969 ) ) ( not ( = ?auto_349961 ?auto_349970 ) ) ( not ( = ?auto_349962 ?auto_349963 ) ) ( not ( = ?auto_349962 ?auto_349964 ) ) ( not ( = ?auto_349962 ?auto_349965 ) ) ( not ( = ?auto_349962 ?auto_349966 ) ) ( not ( = ?auto_349962 ?auto_349967 ) ) ( not ( = ?auto_349962 ?auto_349968 ) ) ( not ( = ?auto_349962 ?auto_349969 ) ) ( not ( = ?auto_349962 ?auto_349970 ) ) ( not ( = ?auto_349963 ?auto_349964 ) ) ( not ( = ?auto_349963 ?auto_349965 ) ) ( not ( = ?auto_349963 ?auto_349966 ) ) ( not ( = ?auto_349963 ?auto_349967 ) ) ( not ( = ?auto_349963 ?auto_349968 ) ) ( not ( = ?auto_349963 ?auto_349969 ) ) ( not ( = ?auto_349963 ?auto_349970 ) ) ( not ( = ?auto_349964 ?auto_349965 ) ) ( not ( = ?auto_349964 ?auto_349966 ) ) ( not ( = ?auto_349964 ?auto_349967 ) ) ( not ( = ?auto_349964 ?auto_349968 ) ) ( not ( = ?auto_349964 ?auto_349969 ) ) ( not ( = ?auto_349964 ?auto_349970 ) ) ( not ( = ?auto_349965 ?auto_349966 ) ) ( not ( = ?auto_349965 ?auto_349967 ) ) ( not ( = ?auto_349965 ?auto_349968 ) ) ( not ( = ?auto_349965 ?auto_349969 ) ) ( not ( = ?auto_349965 ?auto_349970 ) ) ( not ( = ?auto_349966 ?auto_349967 ) ) ( not ( = ?auto_349966 ?auto_349968 ) ) ( not ( = ?auto_349966 ?auto_349969 ) ) ( not ( = ?auto_349966 ?auto_349970 ) ) ( not ( = ?auto_349967 ?auto_349968 ) ) ( not ( = ?auto_349967 ?auto_349969 ) ) ( not ( = ?auto_349967 ?auto_349970 ) ) ( not ( = ?auto_349968 ?auto_349969 ) ) ( not ( = ?auto_349968 ?auto_349970 ) ) ( not ( = ?auto_349969 ?auto_349970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_349969 ?auto_349970 )
      ( !STACK ?auto_349969 ?auto_349968 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_349983 - BLOCK
      ?auto_349984 - BLOCK
      ?auto_349985 - BLOCK
      ?auto_349986 - BLOCK
      ?auto_349987 - BLOCK
      ?auto_349988 - BLOCK
      ?auto_349989 - BLOCK
      ?auto_349990 - BLOCK
      ?auto_349991 - BLOCK
      ?auto_349992 - BLOCK
      ?auto_349993 - BLOCK
      ?auto_349994 - BLOCK
    )
    :vars
    (
      ?auto_349995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_349994 ?auto_349995 ) ( ON-TABLE ?auto_349983 ) ( ON ?auto_349984 ?auto_349983 ) ( ON ?auto_349985 ?auto_349984 ) ( ON ?auto_349986 ?auto_349985 ) ( ON ?auto_349987 ?auto_349986 ) ( ON ?auto_349988 ?auto_349987 ) ( ON ?auto_349989 ?auto_349988 ) ( ON ?auto_349990 ?auto_349989 ) ( ON ?auto_349991 ?auto_349990 ) ( ON ?auto_349992 ?auto_349991 ) ( not ( = ?auto_349983 ?auto_349984 ) ) ( not ( = ?auto_349983 ?auto_349985 ) ) ( not ( = ?auto_349983 ?auto_349986 ) ) ( not ( = ?auto_349983 ?auto_349987 ) ) ( not ( = ?auto_349983 ?auto_349988 ) ) ( not ( = ?auto_349983 ?auto_349989 ) ) ( not ( = ?auto_349983 ?auto_349990 ) ) ( not ( = ?auto_349983 ?auto_349991 ) ) ( not ( = ?auto_349983 ?auto_349992 ) ) ( not ( = ?auto_349983 ?auto_349993 ) ) ( not ( = ?auto_349983 ?auto_349994 ) ) ( not ( = ?auto_349983 ?auto_349995 ) ) ( not ( = ?auto_349984 ?auto_349985 ) ) ( not ( = ?auto_349984 ?auto_349986 ) ) ( not ( = ?auto_349984 ?auto_349987 ) ) ( not ( = ?auto_349984 ?auto_349988 ) ) ( not ( = ?auto_349984 ?auto_349989 ) ) ( not ( = ?auto_349984 ?auto_349990 ) ) ( not ( = ?auto_349984 ?auto_349991 ) ) ( not ( = ?auto_349984 ?auto_349992 ) ) ( not ( = ?auto_349984 ?auto_349993 ) ) ( not ( = ?auto_349984 ?auto_349994 ) ) ( not ( = ?auto_349984 ?auto_349995 ) ) ( not ( = ?auto_349985 ?auto_349986 ) ) ( not ( = ?auto_349985 ?auto_349987 ) ) ( not ( = ?auto_349985 ?auto_349988 ) ) ( not ( = ?auto_349985 ?auto_349989 ) ) ( not ( = ?auto_349985 ?auto_349990 ) ) ( not ( = ?auto_349985 ?auto_349991 ) ) ( not ( = ?auto_349985 ?auto_349992 ) ) ( not ( = ?auto_349985 ?auto_349993 ) ) ( not ( = ?auto_349985 ?auto_349994 ) ) ( not ( = ?auto_349985 ?auto_349995 ) ) ( not ( = ?auto_349986 ?auto_349987 ) ) ( not ( = ?auto_349986 ?auto_349988 ) ) ( not ( = ?auto_349986 ?auto_349989 ) ) ( not ( = ?auto_349986 ?auto_349990 ) ) ( not ( = ?auto_349986 ?auto_349991 ) ) ( not ( = ?auto_349986 ?auto_349992 ) ) ( not ( = ?auto_349986 ?auto_349993 ) ) ( not ( = ?auto_349986 ?auto_349994 ) ) ( not ( = ?auto_349986 ?auto_349995 ) ) ( not ( = ?auto_349987 ?auto_349988 ) ) ( not ( = ?auto_349987 ?auto_349989 ) ) ( not ( = ?auto_349987 ?auto_349990 ) ) ( not ( = ?auto_349987 ?auto_349991 ) ) ( not ( = ?auto_349987 ?auto_349992 ) ) ( not ( = ?auto_349987 ?auto_349993 ) ) ( not ( = ?auto_349987 ?auto_349994 ) ) ( not ( = ?auto_349987 ?auto_349995 ) ) ( not ( = ?auto_349988 ?auto_349989 ) ) ( not ( = ?auto_349988 ?auto_349990 ) ) ( not ( = ?auto_349988 ?auto_349991 ) ) ( not ( = ?auto_349988 ?auto_349992 ) ) ( not ( = ?auto_349988 ?auto_349993 ) ) ( not ( = ?auto_349988 ?auto_349994 ) ) ( not ( = ?auto_349988 ?auto_349995 ) ) ( not ( = ?auto_349989 ?auto_349990 ) ) ( not ( = ?auto_349989 ?auto_349991 ) ) ( not ( = ?auto_349989 ?auto_349992 ) ) ( not ( = ?auto_349989 ?auto_349993 ) ) ( not ( = ?auto_349989 ?auto_349994 ) ) ( not ( = ?auto_349989 ?auto_349995 ) ) ( not ( = ?auto_349990 ?auto_349991 ) ) ( not ( = ?auto_349990 ?auto_349992 ) ) ( not ( = ?auto_349990 ?auto_349993 ) ) ( not ( = ?auto_349990 ?auto_349994 ) ) ( not ( = ?auto_349990 ?auto_349995 ) ) ( not ( = ?auto_349991 ?auto_349992 ) ) ( not ( = ?auto_349991 ?auto_349993 ) ) ( not ( = ?auto_349991 ?auto_349994 ) ) ( not ( = ?auto_349991 ?auto_349995 ) ) ( not ( = ?auto_349992 ?auto_349993 ) ) ( not ( = ?auto_349992 ?auto_349994 ) ) ( not ( = ?auto_349992 ?auto_349995 ) ) ( not ( = ?auto_349993 ?auto_349994 ) ) ( not ( = ?auto_349993 ?auto_349995 ) ) ( not ( = ?auto_349994 ?auto_349995 ) ) ( CLEAR ?auto_349992 ) ( ON ?auto_349993 ?auto_349994 ) ( CLEAR ?auto_349993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_349983 ?auto_349984 ?auto_349985 ?auto_349986 ?auto_349987 ?auto_349988 ?auto_349989 ?auto_349990 ?auto_349991 ?auto_349992 ?auto_349993 )
      ( MAKE-12PILE ?auto_349983 ?auto_349984 ?auto_349985 ?auto_349986 ?auto_349987 ?auto_349988 ?auto_349989 ?auto_349990 ?auto_349991 ?auto_349992 ?auto_349993 ?auto_349994 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350008 - BLOCK
      ?auto_350009 - BLOCK
      ?auto_350010 - BLOCK
      ?auto_350011 - BLOCK
      ?auto_350012 - BLOCK
      ?auto_350013 - BLOCK
      ?auto_350014 - BLOCK
      ?auto_350015 - BLOCK
      ?auto_350016 - BLOCK
      ?auto_350017 - BLOCK
      ?auto_350018 - BLOCK
      ?auto_350019 - BLOCK
    )
    :vars
    (
      ?auto_350020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350019 ?auto_350020 ) ( ON-TABLE ?auto_350008 ) ( ON ?auto_350009 ?auto_350008 ) ( ON ?auto_350010 ?auto_350009 ) ( ON ?auto_350011 ?auto_350010 ) ( ON ?auto_350012 ?auto_350011 ) ( ON ?auto_350013 ?auto_350012 ) ( ON ?auto_350014 ?auto_350013 ) ( ON ?auto_350015 ?auto_350014 ) ( ON ?auto_350016 ?auto_350015 ) ( ON ?auto_350017 ?auto_350016 ) ( not ( = ?auto_350008 ?auto_350009 ) ) ( not ( = ?auto_350008 ?auto_350010 ) ) ( not ( = ?auto_350008 ?auto_350011 ) ) ( not ( = ?auto_350008 ?auto_350012 ) ) ( not ( = ?auto_350008 ?auto_350013 ) ) ( not ( = ?auto_350008 ?auto_350014 ) ) ( not ( = ?auto_350008 ?auto_350015 ) ) ( not ( = ?auto_350008 ?auto_350016 ) ) ( not ( = ?auto_350008 ?auto_350017 ) ) ( not ( = ?auto_350008 ?auto_350018 ) ) ( not ( = ?auto_350008 ?auto_350019 ) ) ( not ( = ?auto_350008 ?auto_350020 ) ) ( not ( = ?auto_350009 ?auto_350010 ) ) ( not ( = ?auto_350009 ?auto_350011 ) ) ( not ( = ?auto_350009 ?auto_350012 ) ) ( not ( = ?auto_350009 ?auto_350013 ) ) ( not ( = ?auto_350009 ?auto_350014 ) ) ( not ( = ?auto_350009 ?auto_350015 ) ) ( not ( = ?auto_350009 ?auto_350016 ) ) ( not ( = ?auto_350009 ?auto_350017 ) ) ( not ( = ?auto_350009 ?auto_350018 ) ) ( not ( = ?auto_350009 ?auto_350019 ) ) ( not ( = ?auto_350009 ?auto_350020 ) ) ( not ( = ?auto_350010 ?auto_350011 ) ) ( not ( = ?auto_350010 ?auto_350012 ) ) ( not ( = ?auto_350010 ?auto_350013 ) ) ( not ( = ?auto_350010 ?auto_350014 ) ) ( not ( = ?auto_350010 ?auto_350015 ) ) ( not ( = ?auto_350010 ?auto_350016 ) ) ( not ( = ?auto_350010 ?auto_350017 ) ) ( not ( = ?auto_350010 ?auto_350018 ) ) ( not ( = ?auto_350010 ?auto_350019 ) ) ( not ( = ?auto_350010 ?auto_350020 ) ) ( not ( = ?auto_350011 ?auto_350012 ) ) ( not ( = ?auto_350011 ?auto_350013 ) ) ( not ( = ?auto_350011 ?auto_350014 ) ) ( not ( = ?auto_350011 ?auto_350015 ) ) ( not ( = ?auto_350011 ?auto_350016 ) ) ( not ( = ?auto_350011 ?auto_350017 ) ) ( not ( = ?auto_350011 ?auto_350018 ) ) ( not ( = ?auto_350011 ?auto_350019 ) ) ( not ( = ?auto_350011 ?auto_350020 ) ) ( not ( = ?auto_350012 ?auto_350013 ) ) ( not ( = ?auto_350012 ?auto_350014 ) ) ( not ( = ?auto_350012 ?auto_350015 ) ) ( not ( = ?auto_350012 ?auto_350016 ) ) ( not ( = ?auto_350012 ?auto_350017 ) ) ( not ( = ?auto_350012 ?auto_350018 ) ) ( not ( = ?auto_350012 ?auto_350019 ) ) ( not ( = ?auto_350012 ?auto_350020 ) ) ( not ( = ?auto_350013 ?auto_350014 ) ) ( not ( = ?auto_350013 ?auto_350015 ) ) ( not ( = ?auto_350013 ?auto_350016 ) ) ( not ( = ?auto_350013 ?auto_350017 ) ) ( not ( = ?auto_350013 ?auto_350018 ) ) ( not ( = ?auto_350013 ?auto_350019 ) ) ( not ( = ?auto_350013 ?auto_350020 ) ) ( not ( = ?auto_350014 ?auto_350015 ) ) ( not ( = ?auto_350014 ?auto_350016 ) ) ( not ( = ?auto_350014 ?auto_350017 ) ) ( not ( = ?auto_350014 ?auto_350018 ) ) ( not ( = ?auto_350014 ?auto_350019 ) ) ( not ( = ?auto_350014 ?auto_350020 ) ) ( not ( = ?auto_350015 ?auto_350016 ) ) ( not ( = ?auto_350015 ?auto_350017 ) ) ( not ( = ?auto_350015 ?auto_350018 ) ) ( not ( = ?auto_350015 ?auto_350019 ) ) ( not ( = ?auto_350015 ?auto_350020 ) ) ( not ( = ?auto_350016 ?auto_350017 ) ) ( not ( = ?auto_350016 ?auto_350018 ) ) ( not ( = ?auto_350016 ?auto_350019 ) ) ( not ( = ?auto_350016 ?auto_350020 ) ) ( not ( = ?auto_350017 ?auto_350018 ) ) ( not ( = ?auto_350017 ?auto_350019 ) ) ( not ( = ?auto_350017 ?auto_350020 ) ) ( not ( = ?auto_350018 ?auto_350019 ) ) ( not ( = ?auto_350018 ?auto_350020 ) ) ( not ( = ?auto_350019 ?auto_350020 ) ) ( CLEAR ?auto_350017 ) ( ON ?auto_350018 ?auto_350019 ) ( CLEAR ?auto_350018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_350008 ?auto_350009 ?auto_350010 ?auto_350011 ?auto_350012 ?auto_350013 ?auto_350014 ?auto_350015 ?auto_350016 ?auto_350017 ?auto_350018 )
      ( MAKE-12PILE ?auto_350008 ?auto_350009 ?auto_350010 ?auto_350011 ?auto_350012 ?auto_350013 ?auto_350014 ?auto_350015 ?auto_350016 ?auto_350017 ?auto_350018 ?auto_350019 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350033 - BLOCK
      ?auto_350034 - BLOCK
      ?auto_350035 - BLOCK
      ?auto_350036 - BLOCK
      ?auto_350037 - BLOCK
      ?auto_350038 - BLOCK
      ?auto_350039 - BLOCK
      ?auto_350040 - BLOCK
      ?auto_350041 - BLOCK
      ?auto_350042 - BLOCK
      ?auto_350043 - BLOCK
      ?auto_350044 - BLOCK
    )
    :vars
    (
      ?auto_350045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350044 ?auto_350045 ) ( ON-TABLE ?auto_350033 ) ( ON ?auto_350034 ?auto_350033 ) ( ON ?auto_350035 ?auto_350034 ) ( ON ?auto_350036 ?auto_350035 ) ( ON ?auto_350037 ?auto_350036 ) ( ON ?auto_350038 ?auto_350037 ) ( ON ?auto_350039 ?auto_350038 ) ( ON ?auto_350040 ?auto_350039 ) ( ON ?auto_350041 ?auto_350040 ) ( not ( = ?auto_350033 ?auto_350034 ) ) ( not ( = ?auto_350033 ?auto_350035 ) ) ( not ( = ?auto_350033 ?auto_350036 ) ) ( not ( = ?auto_350033 ?auto_350037 ) ) ( not ( = ?auto_350033 ?auto_350038 ) ) ( not ( = ?auto_350033 ?auto_350039 ) ) ( not ( = ?auto_350033 ?auto_350040 ) ) ( not ( = ?auto_350033 ?auto_350041 ) ) ( not ( = ?auto_350033 ?auto_350042 ) ) ( not ( = ?auto_350033 ?auto_350043 ) ) ( not ( = ?auto_350033 ?auto_350044 ) ) ( not ( = ?auto_350033 ?auto_350045 ) ) ( not ( = ?auto_350034 ?auto_350035 ) ) ( not ( = ?auto_350034 ?auto_350036 ) ) ( not ( = ?auto_350034 ?auto_350037 ) ) ( not ( = ?auto_350034 ?auto_350038 ) ) ( not ( = ?auto_350034 ?auto_350039 ) ) ( not ( = ?auto_350034 ?auto_350040 ) ) ( not ( = ?auto_350034 ?auto_350041 ) ) ( not ( = ?auto_350034 ?auto_350042 ) ) ( not ( = ?auto_350034 ?auto_350043 ) ) ( not ( = ?auto_350034 ?auto_350044 ) ) ( not ( = ?auto_350034 ?auto_350045 ) ) ( not ( = ?auto_350035 ?auto_350036 ) ) ( not ( = ?auto_350035 ?auto_350037 ) ) ( not ( = ?auto_350035 ?auto_350038 ) ) ( not ( = ?auto_350035 ?auto_350039 ) ) ( not ( = ?auto_350035 ?auto_350040 ) ) ( not ( = ?auto_350035 ?auto_350041 ) ) ( not ( = ?auto_350035 ?auto_350042 ) ) ( not ( = ?auto_350035 ?auto_350043 ) ) ( not ( = ?auto_350035 ?auto_350044 ) ) ( not ( = ?auto_350035 ?auto_350045 ) ) ( not ( = ?auto_350036 ?auto_350037 ) ) ( not ( = ?auto_350036 ?auto_350038 ) ) ( not ( = ?auto_350036 ?auto_350039 ) ) ( not ( = ?auto_350036 ?auto_350040 ) ) ( not ( = ?auto_350036 ?auto_350041 ) ) ( not ( = ?auto_350036 ?auto_350042 ) ) ( not ( = ?auto_350036 ?auto_350043 ) ) ( not ( = ?auto_350036 ?auto_350044 ) ) ( not ( = ?auto_350036 ?auto_350045 ) ) ( not ( = ?auto_350037 ?auto_350038 ) ) ( not ( = ?auto_350037 ?auto_350039 ) ) ( not ( = ?auto_350037 ?auto_350040 ) ) ( not ( = ?auto_350037 ?auto_350041 ) ) ( not ( = ?auto_350037 ?auto_350042 ) ) ( not ( = ?auto_350037 ?auto_350043 ) ) ( not ( = ?auto_350037 ?auto_350044 ) ) ( not ( = ?auto_350037 ?auto_350045 ) ) ( not ( = ?auto_350038 ?auto_350039 ) ) ( not ( = ?auto_350038 ?auto_350040 ) ) ( not ( = ?auto_350038 ?auto_350041 ) ) ( not ( = ?auto_350038 ?auto_350042 ) ) ( not ( = ?auto_350038 ?auto_350043 ) ) ( not ( = ?auto_350038 ?auto_350044 ) ) ( not ( = ?auto_350038 ?auto_350045 ) ) ( not ( = ?auto_350039 ?auto_350040 ) ) ( not ( = ?auto_350039 ?auto_350041 ) ) ( not ( = ?auto_350039 ?auto_350042 ) ) ( not ( = ?auto_350039 ?auto_350043 ) ) ( not ( = ?auto_350039 ?auto_350044 ) ) ( not ( = ?auto_350039 ?auto_350045 ) ) ( not ( = ?auto_350040 ?auto_350041 ) ) ( not ( = ?auto_350040 ?auto_350042 ) ) ( not ( = ?auto_350040 ?auto_350043 ) ) ( not ( = ?auto_350040 ?auto_350044 ) ) ( not ( = ?auto_350040 ?auto_350045 ) ) ( not ( = ?auto_350041 ?auto_350042 ) ) ( not ( = ?auto_350041 ?auto_350043 ) ) ( not ( = ?auto_350041 ?auto_350044 ) ) ( not ( = ?auto_350041 ?auto_350045 ) ) ( not ( = ?auto_350042 ?auto_350043 ) ) ( not ( = ?auto_350042 ?auto_350044 ) ) ( not ( = ?auto_350042 ?auto_350045 ) ) ( not ( = ?auto_350043 ?auto_350044 ) ) ( not ( = ?auto_350043 ?auto_350045 ) ) ( not ( = ?auto_350044 ?auto_350045 ) ) ( ON ?auto_350043 ?auto_350044 ) ( CLEAR ?auto_350041 ) ( ON ?auto_350042 ?auto_350043 ) ( CLEAR ?auto_350042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_350033 ?auto_350034 ?auto_350035 ?auto_350036 ?auto_350037 ?auto_350038 ?auto_350039 ?auto_350040 ?auto_350041 ?auto_350042 )
      ( MAKE-12PILE ?auto_350033 ?auto_350034 ?auto_350035 ?auto_350036 ?auto_350037 ?auto_350038 ?auto_350039 ?auto_350040 ?auto_350041 ?auto_350042 ?auto_350043 ?auto_350044 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350058 - BLOCK
      ?auto_350059 - BLOCK
      ?auto_350060 - BLOCK
      ?auto_350061 - BLOCK
      ?auto_350062 - BLOCK
      ?auto_350063 - BLOCK
      ?auto_350064 - BLOCK
      ?auto_350065 - BLOCK
      ?auto_350066 - BLOCK
      ?auto_350067 - BLOCK
      ?auto_350068 - BLOCK
      ?auto_350069 - BLOCK
    )
    :vars
    (
      ?auto_350070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350069 ?auto_350070 ) ( ON-TABLE ?auto_350058 ) ( ON ?auto_350059 ?auto_350058 ) ( ON ?auto_350060 ?auto_350059 ) ( ON ?auto_350061 ?auto_350060 ) ( ON ?auto_350062 ?auto_350061 ) ( ON ?auto_350063 ?auto_350062 ) ( ON ?auto_350064 ?auto_350063 ) ( ON ?auto_350065 ?auto_350064 ) ( ON ?auto_350066 ?auto_350065 ) ( not ( = ?auto_350058 ?auto_350059 ) ) ( not ( = ?auto_350058 ?auto_350060 ) ) ( not ( = ?auto_350058 ?auto_350061 ) ) ( not ( = ?auto_350058 ?auto_350062 ) ) ( not ( = ?auto_350058 ?auto_350063 ) ) ( not ( = ?auto_350058 ?auto_350064 ) ) ( not ( = ?auto_350058 ?auto_350065 ) ) ( not ( = ?auto_350058 ?auto_350066 ) ) ( not ( = ?auto_350058 ?auto_350067 ) ) ( not ( = ?auto_350058 ?auto_350068 ) ) ( not ( = ?auto_350058 ?auto_350069 ) ) ( not ( = ?auto_350058 ?auto_350070 ) ) ( not ( = ?auto_350059 ?auto_350060 ) ) ( not ( = ?auto_350059 ?auto_350061 ) ) ( not ( = ?auto_350059 ?auto_350062 ) ) ( not ( = ?auto_350059 ?auto_350063 ) ) ( not ( = ?auto_350059 ?auto_350064 ) ) ( not ( = ?auto_350059 ?auto_350065 ) ) ( not ( = ?auto_350059 ?auto_350066 ) ) ( not ( = ?auto_350059 ?auto_350067 ) ) ( not ( = ?auto_350059 ?auto_350068 ) ) ( not ( = ?auto_350059 ?auto_350069 ) ) ( not ( = ?auto_350059 ?auto_350070 ) ) ( not ( = ?auto_350060 ?auto_350061 ) ) ( not ( = ?auto_350060 ?auto_350062 ) ) ( not ( = ?auto_350060 ?auto_350063 ) ) ( not ( = ?auto_350060 ?auto_350064 ) ) ( not ( = ?auto_350060 ?auto_350065 ) ) ( not ( = ?auto_350060 ?auto_350066 ) ) ( not ( = ?auto_350060 ?auto_350067 ) ) ( not ( = ?auto_350060 ?auto_350068 ) ) ( not ( = ?auto_350060 ?auto_350069 ) ) ( not ( = ?auto_350060 ?auto_350070 ) ) ( not ( = ?auto_350061 ?auto_350062 ) ) ( not ( = ?auto_350061 ?auto_350063 ) ) ( not ( = ?auto_350061 ?auto_350064 ) ) ( not ( = ?auto_350061 ?auto_350065 ) ) ( not ( = ?auto_350061 ?auto_350066 ) ) ( not ( = ?auto_350061 ?auto_350067 ) ) ( not ( = ?auto_350061 ?auto_350068 ) ) ( not ( = ?auto_350061 ?auto_350069 ) ) ( not ( = ?auto_350061 ?auto_350070 ) ) ( not ( = ?auto_350062 ?auto_350063 ) ) ( not ( = ?auto_350062 ?auto_350064 ) ) ( not ( = ?auto_350062 ?auto_350065 ) ) ( not ( = ?auto_350062 ?auto_350066 ) ) ( not ( = ?auto_350062 ?auto_350067 ) ) ( not ( = ?auto_350062 ?auto_350068 ) ) ( not ( = ?auto_350062 ?auto_350069 ) ) ( not ( = ?auto_350062 ?auto_350070 ) ) ( not ( = ?auto_350063 ?auto_350064 ) ) ( not ( = ?auto_350063 ?auto_350065 ) ) ( not ( = ?auto_350063 ?auto_350066 ) ) ( not ( = ?auto_350063 ?auto_350067 ) ) ( not ( = ?auto_350063 ?auto_350068 ) ) ( not ( = ?auto_350063 ?auto_350069 ) ) ( not ( = ?auto_350063 ?auto_350070 ) ) ( not ( = ?auto_350064 ?auto_350065 ) ) ( not ( = ?auto_350064 ?auto_350066 ) ) ( not ( = ?auto_350064 ?auto_350067 ) ) ( not ( = ?auto_350064 ?auto_350068 ) ) ( not ( = ?auto_350064 ?auto_350069 ) ) ( not ( = ?auto_350064 ?auto_350070 ) ) ( not ( = ?auto_350065 ?auto_350066 ) ) ( not ( = ?auto_350065 ?auto_350067 ) ) ( not ( = ?auto_350065 ?auto_350068 ) ) ( not ( = ?auto_350065 ?auto_350069 ) ) ( not ( = ?auto_350065 ?auto_350070 ) ) ( not ( = ?auto_350066 ?auto_350067 ) ) ( not ( = ?auto_350066 ?auto_350068 ) ) ( not ( = ?auto_350066 ?auto_350069 ) ) ( not ( = ?auto_350066 ?auto_350070 ) ) ( not ( = ?auto_350067 ?auto_350068 ) ) ( not ( = ?auto_350067 ?auto_350069 ) ) ( not ( = ?auto_350067 ?auto_350070 ) ) ( not ( = ?auto_350068 ?auto_350069 ) ) ( not ( = ?auto_350068 ?auto_350070 ) ) ( not ( = ?auto_350069 ?auto_350070 ) ) ( ON ?auto_350068 ?auto_350069 ) ( CLEAR ?auto_350066 ) ( ON ?auto_350067 ?auto_350068 ) ( CLEAR ?auto_350067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_350058 ?auto_350059 ?auto_350060 ?auto_350061 ?auto_350062 ?auto_350063 ?auto_350064 ?auto_350065 ?auto_350066 ?auto_350067 )
      ( MAKE-12PILE ?auto_350058 ?auto_350059 ?auto_350060 ?auto_350061 ?auto_350062 ?auto_350063 ?auto_350064 ?auto_350065 ?auto_350066 ?auto_350067 ?auto_350068 ?auto_350069 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350083 - BLOCK
      ?auto_350084 - BLOCK
      ?auto_350085 - BLOCK
      ?auto_350086 - BLOCK
      ?auto_350087 - BLOCK
      ?auto_350088 - BLOCK
      ?auto_350089 - BLOCK
      ?auto_350090 - BLOCK
      ?auto_350091 - BLOCK
      ?auto_350092 - BLOCK
      ?auto_350093 - BLOCK
      ?auto_350094 - BLOCK
    )
    :vars
    (
      ?auto_350095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350094 ?auto_350095 ) ( ON-TABLE ?auto_350083 ) ( ON ?auto_350084 ?auto_350083 ) ( ON ?auto_350085 ?auto_350084 ) ( ON ?auto_350086 ?auto_350085 ) ( ON ?auto_350087 ?auto_350086 ) ( ON ?auto_350088 ?auto_350087 ) ( ON ?auto_350089 ?auto_350088 ) ( ON ?auto_350090 ?auto_350089 ) ( not ( = ?auto_350083 ?auto_350084 ) ) ( not ( = ?auto_350083 ?auto_350085 ) ) ( not ( = ?auto_350083 ?auto_350086 ) ) ( not ( = ?auto_350083 ?auto_350087 ) ) ( not ( = ?auto_350083 ?auto_350088 ) ) ( not ( = ?auto_350083 ?auto_350089 ) ) ( not ( = ?auto_350083 ?auto_350090 ) ) ( not ( = ?auto_350083 ?auto_350091 ) ) ( not ( = ?auto_350083 ?auto_350092 ) ) ( not ( = ?auto_350083 ?auto_350093 ) ) ( not ( = ?auto_350083 ?auto_350094 ) ) ( not ( = ?auto_350083 ?auto_350095 ) ) ( not ( = ?auto_350084 ?auto_350085 ) ) ( not ( = ?auto_350084 ?auto_350086 ) ) ( not ( = ?auto_350084 ?auto_350087 ) ) ( not ( = ?auto_350084 ?auto_350088 ) ) ( not ( = ?auto_350084 ?auto_350089 ) ) ( not ( = ?auto_350084 ?auto_350090 ) ) ( not ( = ?auto_350084 ?auto_350091 ) ) ( not ( = ?auto_350084 ?auto_350092 ) ) ( not ( = ?auto_350084 ?auto_350093 ) ) ( not ( = ?auto_350084 ?auto_350094 ) ) ( not ( = ?auto_350084 ?auto_350095 ) ) ( not ( = ?auto_350085 ?auto_350086 ) ) ( not ( = ?auto_350085 ?auto_350087 ) ) ( not ( = ?auto_350085 ?auto_350088 ) ) ( not ( = ?auto_350085 ?auto_350089 ) ) ( not ( = ?auto_350085 ?auto_350090 ) ) ( not ( = ?auto_350085 ?auto_350091 ) ) ( not ( = ?auto_350085 ?auto_350092 ) ) ( not ( = ?auto_350085 ?auto_350093 ) ) ( not ( = ?auto_350085 ?auto_350094 ) ) ( not ( = ?auto_350085 ?auto_350095 ) ) ( not ( = ?auto_350086 ?auto_350087 ) ) ( not ( = ?auto_350086 ?auto_350088 ) ) ( not ( = ?auto_350086 ?auto_350089 ) ) ( not ( = ?auto_350086 ?auto_350090 ) ) ( not ( = ?auto_350086 ?auto_350091 ) ) ( not ( = ?auto_350086 ?auto_350092 ) ) ( not ( = ?auto_350086 ?auto_350093 ) ) ( not ( = ?auto_350086 ?auto_350094 ) ) ( not ( = ?auto_350086 ?auto_350095 ) ) ( not ( = ?auto_350087 ?auto_350088 ) ) ( not ( = ?auto_350087 ?auto_350089 ) ) ( not ( = ?auto_350087 ?auto_350090 ) ) ( not ( = ?auto_350087 ?auto_350091 ) ) ( not ( = ?auto_350087 ?auto_350092 ) ) ( not ( = ?auto_350087 ?auto_350093 ) ) ( not ( = ?auto_350087 ?auto_350094 ) ) ( not ( = ?auto_350087 ?auto_350095 ) ) ( not ( = ?auto_350088 ?auto_350089 ) ) ( not ( = ?auto_350088 ?auto_350090 ) ) ( not ( = ?auto_350088 ?auto_350091 ) ) ( not ( = ?auto_350088 ?auto_350092 ) ) ( not ( = ?auto_350088 ?auto_350093 ) ) ( not ( = ?auto_350088 ?auto_350094 ) ) ( not ( = ?auto_350088 ?auto_350095 ) ) ( not ( = ?auto_350089 ?auto_350090 ) ) ( not ( = ?auto_350089 ?auto_350091 ) ) ( not ( = ?auto_350089 ?auto_350092 ) ) ( not ( = ?auto_350089 ?auto_350093 ) ) ( not ( = ?auto_350089 ?auto_350094 ) ) ( not ( = ?auto_350089 ?auto_350095 ) ) ( not ( = ?auto_350090 ?auto_350091 ) ) ( not ( = ?auto_350090 ?auto_350092 ) ) ( not ( = ?auto_350090 ?auto_350093 ) ) ( not ( = ?auto_350090 ?auto_350094 ) ) ( not ( = ?auto_350090 ?auto_350095 ) ) ( not ( = ?auto_350091 ?auto_350092 ) ) ( not ( = ?auto_350091 ?auto_350093 ) ) ( not ( = ?auto_350091 ?auto_350094 ) ) ( not ( = ?auto_350091 ?auto_350095 ) ) ( not ( = ?auto_350092 ?auto_350093 ) ) ( not ( = ?auto_350092 ?auto_350094 ) ) ( not ( = ?auto_350092 ?auto_350095 ) ) ( not ( = ?auto_350093 ?auto_350094 ) ) ( not ( = ?auto_350093 ?auto_350095 ) ) ( not ( = ?auto_350094 ?auto_350095 ) ) ( ON ?auto_350093 ?auto_350094 ) ( ON ?auto_350092 ?auto_350093 ) ( CLEAR ?auto_350090 ) ( ON ?auto_350091 ?auto_350092 ) ( CLEAR ?auto_350091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_350083 ?auto_350084 ?auto_350085 ?auto_350086 ?auto_350087 ?auto_350088 ?auto_350089 ?auto_350090 ?auto_350091 )
      ( MAKE-12PILE ?auto_350083 ?auto_350084 ?auto_350085 ?auto_350086 ?auto_350087 ?auto_350088 ?auto_350089 ?auto_350090 ?auto_350091 ?auto_350092 ?auto_350093 ?auto_350094 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350108 - BLOCK
      ?auto_350109 - BLOCK
      ?auto_350110 - BLOCK
      ?auto_350111 - BLOCK
      ?auto_350112 - BLOCK
      ?auto_350113 - BLOCK
      ?auto_350114 - BLOCK
      ?auto_350115 - BLOCK
      ?auto_350116 - BLOCK
      ?auto_350117 - BLOCK
      ?auto_350118 - BLOCK
      ?auto_350119 - BLOCK
    )
    :vars
    (
      ?auto_350120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350119 ?auto_350120 ) ( ON-TABLE ?auto_350108 ) ( ON ?auto_350109 ?auto_350108 ) ( ON ?auto_350110 ?auto_350109 ) ( ON ?auto_350111 ?auto_350110 ) ( ON ?auto_350112 ?auto_350111 ) ( ON ?auto_350113 ?auto_350112 ) ( ON ?auto_350114 ?auto_350113 ) ( ON ?auto_350115 ?auto_350114 ) ( not ( = ?auto_350108 ?auto_350109 ) ) ( not ( = ?auto_350108 ?auto_350110 ) ) ( not ( = ?auto_350108 ?auto_350111 ) ) ( not ( = ?auto_350108 ?auto_350112 ) ) ( not ( = ?auto_350108 ?auto_350113 ) ) ( not ( = ?auto_350108 ?auto_350114 ) ) ( not ( = ?auto_350108 ?auto_350115 ) ) ( not ( = ?auto_350108 ?auto_350116 ) ) ( not ( = ?auto_350108 ?auto_350117 ) ) ( not ( = ?auto_350108 ?auto_350118 ) ) ( not ( = ?auto_350108 ?auto_350119 ) ) ( not ( = ?auto_350108 ?auto_350120 ) ) ( not ( = ?auto_350109 ?auto_350110 ) ) ( not ( = ?auto_350109 ?auto_350111 ) ) ( not ( = ?auto_350109 ?auto_350112 ) ) ( not ( = ?auto_350109 ?auto_350113 ) ) ( not ( = ?auto_350109 ?auto_350114 ) ) ( not ( = ?auto_350109 ?auto_350115 ) ) ( not ( = ?auto_350109 ?auto_350116 ) ) ( not ( = ?auto_350109 ?auto_350117 ) ) ( not ( = ?auto_350109 ?auto_350118 ) ) ( not ( = ?auto_350109 ?auto_350119 ) ) ( not ( = ?auto_350109 ?auto_350120 ) ) ( not ( = ?auto_350110 ?auto_350111 ) ) ( not ( = ?auto_350110 ?auto_350112 ) ) ( not ( = ?auto_350110 ?auto_350113 ) ) ( not ( = ?auto_350110 ?auto_350114 ) ) ( not ( = ?auto_350110 ?auto_350115 ) ) ( not ( = ?auto_350110 ?auto_350116 ) ) ( not ( = ?auto_350110 ?auto_350117 ) ) ( not ( = ?auto_350110 ?auto_350118 ) ) ( not ( = ?auto_350110 ?auto_350119 ) ) ( not ( = ?auto_350110 ?auto_350120 ) ) ( not ( = ?auto_350111 ?auto_350112 ) ) ( not ( = ?auto_350111 ?auto_350113 ) ) ( not ( = ?auto_350111 ?auto_350114 ) ) ( not ( = ?auto_350111 ?auto_350115 ) ) ( not ( = ?auto_350111 ?auto_350116 ) ) ( not ( = ?auto_350111 ?auto_350117 ) ) ( not ( = ?auto_350111 ?auto_350118 ) ) ( not ( = ?auto_350111 ?auto_350119 ) ) ( not ( = ?auto_350111 ?auto_350120 ) ) ( not ( = ?auto_350112 ?auto_350113 ) ) ( not ( = ?auto_350112 ?auto_350114 ) ) ( not ( = ?auto_350112 ?auto_350115 ) ) ( not ( = ?auto_350112 ?auto_350116 ) ) ( not ( = ?auto_350112 ?auto_350117 ) ) ( not ( = ?auto_350112 ?auto_350118 ) ) ( not ( = ?auto_350112 ?auto_350119 ) ) ( not ( = ?auto_350112 ?auto_350120 ) ) ( not ( = ?auto_350113 ?auto_350114 ) ) ( not ( = ?auto_350113 ?auto_350115 ) ) ( not ( = ?auto_350113 ?auto_350116 ) ) ( not ( = ?auto_350113 ?auto_350117 ) ) ( not ( = ?auto_350113 ?auto_350118 ) ) ( not ( = ?auto_350113 ?auto_350119 ) ) ( not ( = ?auto_350113 ?auto_350120 ) ) ( not ( = ?auto_350114 ?auto_350115 ) ) ( not ( = ?auto_350114 ?auto_350116 ) ) ( not ( = ?auto_350114 ?auto_350117 ) ) ( not ( = ?auto_350114 ?auto_350118 ) ) ( not ( = ?auto_350114 ?auto_350119 ) ) ( not ( = ?auto_350114 ?auto_350120 ) ) ( not ( = ?auto_350115 ?auto_350116 ) ) ( not ( = ?auto_350115 ?auto_350117 ) ) ( not ( = ?auto_350115 ?auto_350118 ) ) ( not ( = ?auto_350115 ?auto_350119 ) ) ( not ( = ?auto_350115 ?auto_350120 ) ) ( not ( = ?auto_350116 ?auto_350117 ) ) ( not ( = ?auto_350116 ?auto_350118 ) ) ( not ( = ?auto_350116 ?auto_350119 ) ) ( not ( = ?auto_350116 ?auto_350120 ) ) ( not ( = ?auto_350117 ?auto_350118 ) ) ( not ( = ?auto_350117 ?auto_350119 ) ) ( not ( = ?auto_350117 ?auto_350120 ) ) ( not ( = ?auto_350118 ?auto_350119 ) ) ( not ( = ?auto_350118 ?auto_350120 ) ) ( not ( = ?auto_350119 ?auto_350120 ) ) ( ON ?auto_350118 ?auto_350119 ) ( ON ?auto_350117 ?auto_350118 ) ( CLEAR ?auto_350115 ) ( ON ?auto_350116 ?auto_350117 ) ( CLEAR ?auto_350116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_350108 ?auto_350109 ?auto_350110 ?auto_350111 ?auto_350112 ?auto_350113 ?auto_350114 ?auto_350115 ?auto_350116 )
      ( MAKE-12PILE ?auto_350108 ?auto_350109 ?auto_350110 ?auto_350111 ?auto_350112 ?auto_350113 ?auto_350114 ?auto_350115 ?auto_350116 ?auto_350117 ?auto_350118 ?auto_350119 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350133 - BLOCK
      ?auto_350134 - BLOCK
      ?auto_350135 - BLOCK
      ?auto_350136 - BLOCK
      ?auto_350137 - BLOCK
      ?auto_350138 - BLOCK
      ?auto_350139 - BLOCK
      ?auto_350140 - BLOCK
      ?auto_350141 - BLOCK
      ?auto_350142 - BLOCK
      ?auto_350143 - BLOCK
      ?auto_350144 - BLOCK
    )
    :vars
    (
      ?auto_350145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350144 ?auto_350145 ) ( ON-TABLE ?auto_350133 ) ( ON ?auto_350134 ?auto_350133 ) ( ON ?auto_350135 ?auto_350134 ) ( ON ?auto_350136 ?auto_350135 ) ( ON ?auto_350137 ?auto_350136 ) ( ON ?auto_350138 ?auto_350137 ) ( ON ?auto_350139 ?auto_350138 ) ( not ( = ?auto_350133 ?auto_350134 ) ) ( not ( = ?auto_350133 ?auto_350135 ) ) ( not ( = ?auto_350133 ?auto_350136 ) ) ( not ( = ?auto_350133 ?auto_350137 ) ) ( not ( = ?auto_350133 ?auto_350138 ) ) ( not ( = ?auto_350133 ?auto_350139 ) ) ( not ( = ?auto_350133 ?auto_350140 ) ) ( not ( = ?auto_350133 ?auto_350141 ) ) ( not ( = ?auto_350133 ?auto_350142 ) ) ( not ( = ?auto_350133 ?auto_350143 ) ) ( not ( = ?auto_350133 ?auto_350144 ) ) ( not ( = ?auto_350133 ?auto_350145 ) ) ( not ( = ?auto_350134 ?auto_350135 ) ) ( not ( = ?auto_350134 ?auto_350136 ) ) ( not ( = ?auto_350134 ?auto_350137 ) ) ( not ( = ?auto_350134 ?auto_350138 ) ) ( not ( = ?auto_350134 ?auto_350139 ) ) ( not ( = ?auto_350134 ?auto_350140 ) ) ( not ( = ?auto_350134 ?auto_350141 ) ) ( not ( = ?auto_350134 ?auto_350142 ) ) ( not ( = ?auto_350134 ?auto_350143 ) ) ( not ( = ?auto_350134 ?auto_350144 ) ) ( not ( = ?auto_350134 ?auto_350145 ) ) ( not ( = ?auto_350135 ?auto_350136 ) ) ( not ( = ?auto_350135 ?auto_350137 ) ) ( not ( = ?auto_350135 ?auto_350138 ) ) ( not ( = ?auto_350135 ?auto_350139 ) ) ( not ( = ?auto_350135 ?auto_350140 ) ) ( not ( = ?auto_350135 ?auto_350141 ) ) ( not ( = ?auto_350135 ?auto_350142 ) ) ( not ( = ?auto_350135 ?auto_350143 ) ) ( not ( = ?auto_350135 ?auto_350144 ) ) ( not ( = ?auto_350135 ?auto_350145 ) ) ( not ( = ?auto_350136 ?auto_350137 ) ) ( not ( = ?auto_350136 ?auto_350138 ) ) ( not ( = ?auto_350136 ?auto_350139 ) ) ( not ( = ?auto_350136 ?auto_350140 ) ) ( not ( = ?auto_350136 ?auto_350141 ) ) ( not ( = ?auto_350136 ?auto_350142 ) ) ( not ( = ?auto_350136 ?auto_350143 ) ) ( not ( = ?auto_350136 ?auto_350144 ) ) ( not ( = ?auto_350136 ?auto_350145 ) ) ( not ( = ?auto_350137 ?auto_350138 ) ) ( not ( = ?auto_350137 ?auto_350139 ) ) ( not ( = ?auto_350137 ?auto_350140 ) ) ( not ( = ?auto_350137 ?auto_350141 ) ) ( not ( = ?auto_350137 ?auto_350142 ) ) ( not ( = ?auto_350137 ?auto_350143 ) ) ( not ( = ?auto_350137 ?auto_350144 ) ) ( not ( = ?auto_350137 ?auto_350145 ) ) ( not ( = ?auto_350138 ?auto_350139 ) ) ( not ( = ?auto_350138 ?auto_350140 ) ) ( not ( = ?auto_350138 ?auto_350141 ) ) ( not ( = ?auto_350138 ?auto_350142 ) ) ( not ( = ?auto_350138 ?auto_350143 ) ) ( not ( = ?auto_350138 ?auto_350144 ) ) ( not ( = ?auto_350138 ?auto_350145 ) ) ( not ( = ?auto_350139 ?auto_350140 ) ) ( not ( = ?auto_350139 ?auto_350141 ) ) ( not ( = ?auto_350139 ?auto_350142 ) ) ( not ( = ?auto_350139 ?auto_350143 ) ) ( not ( = ?auto_350139 ?auto_350144 ) ) ( not ( = ?auto_350139 ?auto_350145 ) ) ( not ( = ?auto_350140 ?auto_350141 ) ) ( not ( = ?auto_350140 ?auto_350142 ) ) ( not ( = ?auto_350140 ?auto_350143 ) ) ( not ( = ?auto_350140 ?auto_350144 ) ) ( not ( = ?auto_350140 ?auto_350145 ) ) ( not ( = ?auto_350141 ?auto_350142 ) ) ( not ( = ?auto_350141 ?auto_350143 ) ) ( not ( = ?auto_350141 ?auto_350144 ) ) ( not ( = ?auto_350141 ?auto_350145 ) ) ( not ( = ?auto_350142 ?auto_350143 ) ) ( not ( = ?auto_350142 ?auto_350144 ) ) ( not ( = ?auto_350142 ?auto_350145 ) ) ( not ( = ?auto_350143 ?auto_350144 ) ) ( not ( = ?auto_350143 ?auto_350145 ) ) ( not ( = ?auto_350144 ?auto_350145 ) ) ( ON ?auto_350143 ?auto_350144 ) ( ON ?auto_350142 ?auto_350143 ) ( ON ?auto_350141 ?auto_350142 ) ( CLEAR ?auto_350139 ) ( ON ?auto_350140 ?auto_350141 ) ( CLEAR ?auto_350140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_350133 ?auto_350134 ?auto_350135 ?auto_350136 ?auto_350137 ?auto_350138 ?auto_350139 ?auto_350140 )
      ( MAKE-12PILE ?auto_350133 ?auto_350134 ?auto_350135 ?auto_350136 ?auto_350137 ?auto_350138 ?auto_350139 ?auto_350140 ?auto_350141 ?auto_350142 ?auto_350143 ?auto_350144 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350158 - BLOCK
      ?auto_350159 - BLOCK
      ?auto_350160 - BLOCK
      ?auto_350161 - BLOCK
      ?auto_350162 - BLOCK
      ?auto_350163 - BLOCK
      ?auto_350164 - BLOCK
      ?auto_350165 - BLOCK
      ?auto_350166 - BLOCK
      ?auto_350167 - BLOCK
      ?auto_350168 - BLOCK
      ?auto_350169 - BLOCK
    )
    :vars
    (
      ?auto_350170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350169 ?auto_350170 ) ( ON-TABLE ?auto_350158 ) ( ON ?auto_350159 ?auto_350158 ) ( ON ?auto_350160 ?auto_350159 ) ( ON ?auto_350161 ?auto_350160 ) ( ON ?auto_350162 ?auto_350161 ) ( ON ?auto_350163 ?auto_350162 ) ( ON ?auto_350164 ?auto_350163 ) ( not ( = ?auto_350158 ?auto_350159 ) ) ( not ( = ?auto_350158 ?auto_350160 ) ) ( not ( = ?auto_350158 ?auto_350161 ) ) ( not ( = ?auto_350158 ?auto_350162 ) ) ( not ( = ?auto_350158 ?auto_350163 ) ) ( not ( = ?auto_350158 ?auto_350164 ) ) ( not ( = ?auto_350158 ?auto_350165 ) ) ( not ( = ?auto_350158 ?auto_350166 ) ) ( not ( = ?auto_350158 ?auto_350167 ) ) ( not ( = ?auto_350158 ?auto_350168 ) ) ( not ( = ?auto_350158 ?auto_350169 ) ) ( not ( = ?auto_350158 ?auto_350170 ) ) ( not ( = ?auto_350159 ?auto_350160 ) ) ( not ( = ?auto_350159 ?auto_350161 ) ) ( not ( = ?auto_350159 ?auto_350162 ) ) ( not ( = ?auto_350159 ?auto_350163 ) ) ( not ( = ?auto_350159 ?auto_350164 ) ) ( not ( = ?auto_350159 ?auto_350165 ) ) ( not ( = ?auto_350159 ?auto_350166 ) ) ( not ( = ?auto_350159 ?auto_350167 ) ) ( not ( = ?auto_350159 ?auto_350168 ) ) ( not ( = ?auto_350159 ?auto_350169 ) ) ( not ( = ?auto_350159 ?auto_350170 ) ) ( not ( = ?auto_350160 ?auto_350161 ) ) ( not ( = ?auto_350160 ?auto_350162 ) ) ( not ( = ?auto_350160 ?auto_350163 ) ) ( not ( = ?auto_350160 ?auto_350164 ) ) ( not ( = ?auto_350160 ?auto_350165 ) ) ( not ( = ?auto_350160 ?auto_350166 ) ) ( not ( = ?auto_350160 ?auto_350167 ) ) ( not ( = ?auto_350160 ?auto_350168 ) ) ( not ( = ?auto_350160 ?auto_350169 ) ) ( not ( = ?auto_350160 ?auto_350170 ) ) ( not ( = ?auto_350161 ?auto_350162 ) ) ( not ( = ?auto_350161 ?auto_350163 ) ) ( not ( = ?auto_350161 ?auto_350164 ) ) ( not ( = ?auto_350161 ?auto_350165 ) ) ( not ( = ?auto_350161 ?auto_350166 ) ) ( not ( = ?auto_350161 ?auto_350167 ) ) ( not ( = ?auto_350161 ?auto_350168 ) ) ( not ( = ?auto_350161 ?auto_350169 ) ) ( not ( = ?auto_350161 ?auto_350170 ) ) ( not ( = ?auto_350162 ?auto_350163 ) ) ( not ( = ?auto_350162 ?auto_350164 ) ) ( not ( = ?auto_350162 ?auto_350165 ) ) ( not ( = ?auto_350162 ?auto_350166 ) ) ( not ( = ?auto_350162 ?auto_350167 ) ) ( not ( = ?auto_350162 ?auto_350168 ) ) ( not ( = ?auto_350162 ?auto_350169 ) ) ( not ( = ?auto_350162 ?auto_350170 ) ) ( not ( = ?auto_350163 ?auto_350164 ) ) ( not ( = ?auto_350163 ?auto_350165 ) ) ( not ( = ?auto_350163 ?auto_350166 ) ) ( not ( = ?auto_350163 ?auto_350167 ) ) ( not ( = ?auto_350163 ?auto_350168 ) ) ( not ( = ?auto_350163 ?auto_350169 ) ) ( not ( = ?auto_350163 ?auto_350170 ) ) ( not ( = ?auto_350164 ?auto_350165 ) ) ( not ( = ?auto_350164 ?auto_350166 ) ) ( not ( = ?auto_350164 ?auto_350167 ) ) ( not ( = ?auto_350164 ?auto_350168 ) ) ( not ( = ?auto_350164 ?auto_350169 ) ) ( not ( = ?auto_350164 ?auto_350170 ) ) ( not ( = ?auto_350165 ?auto_350166 ) ) ( not ( = ?auto_350165 ?auto_350167 ) ) ( not ( = ?auto_350165 ?auto_350168 ) ) ( not ( = ?auto_350165 ?auto_350169 ) ) ( not ( = ?auto_350165 ?auto_350170 ) ) ( not ( = ?auto_350166 ?auto_350167 ) ) ( not ( = ?auto_350166 ?auto_350168 ) ) ( not ( = ?auto_350166 ?auto_350169 ) ) ( not ( = ?auto_350166 ?auto_350170 ) ) ( not ( = ?auto_350167 ?auto_350168 ) ) ( not ( = ?auto_350167 ?auto_350169 ) ) ( not ( = ?auto_350167 ?auto_350170 ) ) ( not ( = ?auto_350168 ?auto_350169 ) ) ( not ( = ?auto_350168 ?auto_350170 ) ) ( not ( = ?auto_350169 ?auto_350170 ) ) ( ON ?auto_350168 ?auto_350169 ) ( ON ?auto_350167 ?auto_350168 ) ( ON ?auto_350166 ?auto_350167 ) ( CLEAR ?auto_350164 ) ( ON ?auto_350165 ?auto_350166 ) ( CLEAR ?auto_350165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_350158 ?auto_350159 ?auto_350160 ?auto_350161 ?auto_350162 ?auto_350163 ?auto_350164 ?auto_350165 )
      ( MAKE-12PILE ?auto_350158 ?auto_350159 ?auto_350160 ?auto_350161 ?auto_350162 ?auto_350163 ?auto_350164 ?auto_350165 ?auto_350166 ?auto_350167 ?auto_350168 ?auto_350169 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350183 - BLOCK
      ?auto_350184 - BLOCK
      ?auto_350185 - BLOCK
      ?auto_350186 - BLOCK
      ?auto_350187 - BLOCK
      ?auto_350188 - BLOCK
      ?auto_350189 - BLOCK
      ?auto_350190 - BLOCK
      ?auto_350191 - BLOCK
      ?auto_350192 - BLOCK
      ?auto_350193 - BLOCK
      ?auto_350194 - BLOCK
    )
    :vars
    (
      ?auto_350195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350194 ?auto_350195 ) ( ON-TABLE ?auto_350183 ) ( ON ?auto_350184 ?auto_350183 ) ( ON ?auto_350185 ?auto_350184 ) ( ON ?auto_350186 ?auto_350185 ) ( ON ?auto_350187 ?auto_350186 ) ( ON ?auto_350188 ?auto_350187 ) ( not ( = ?auto_350183 ?auto_350184 ) ) ( not ( = ?auto_350183 ?auto_350185 ) ) ( not ( = ?auto_350183 ?auto_350186 ) ) ( not ( = ?auto_350183 ?auto_350187 ) ) ( not ( = ?auto_350183 ?auto_350188 ) ) ( not ( = ?auto_350183 ?auto_350189 ) ) ( not ( = ?auto_350183 ?auto_350190 ) ) ( not ( = ?auto_350183 ?auto_350191 ) ) ( not ( = ?auto_350183 ?auto_350192 ) ) ( not ( = ?auto_350183 ?auto_350193 ) ) ( not ( = ?auto_350183 ?auto_350194 ) ) ( not ( = ?auto_350183 ?auto_350195 ) ) ( not ( = ?auto_350184 ?auto_350185 ) ) ( not ( = ?auto_350184 ?auto_350186 ) ) ( not ( = ?auto_350184 ?auto_350187 ) ) ( not ( = ?auto_350184 ?auto_350188 ) ) ( not ( = ?auto_350184 ?auto_350189 ) ) ( not ( = ?auto_350184 ?auto_350190 ) ) ( not ( = ?auto_350184 ?auto_350191 ) ) ( not ( = ?auto_350184 ?auto_350192 ) ) ( not ( = ?auto_350184 ?auto_350193 ) ) ( not ( = ?auto_350184 ?auto_350194 ) ) ( not ( = ?auto_350184 ?auto_350195 ) ) ( not ( = ?auto_350185 ?auto_350186 ) ) ( not ( = ?auto_350185 ?auto_350187 ) ) ( not ( = ?auto_350185 ?auto_350188 ) ) ( not ( = ?auto_350185 ?auto_350189 ) ) ( not ( = ?auto_350185 ?auto_350190 ) ) ( not ( = ?auto_350185 ?auto_350191 ) ) ( not ( = ?auto_350185 ?auto_350192 ) ) ( not ( = ?auto_350185 ?auto_350193 ) ) ( not ( = ?auto_350185 ?auto_350194 ) ) ( not ( = ?auto_350185 ?auto_350195 ) ) ( not ( = ?auto_350186 ?auto_350187 ) ) ( not ( = ?auto_350186 ?auto_350188 ) ) ( not ( = ?auto_350186 ?auto_350189 ) ) ( not ( = ?auto_350186 ?auto_350190 ) ) ( not ( = ?auto_350186 ?auto_350191 ) ) ( not ( = ?auto_350186 ?auto_350192 ) ) ( not ( = ?auto_350186 ?auto_350193 ) ) ( not ( = ?auto_350186 ?auto_350194 ) ) ( not ( = ?auto_350186 ?auto_350195 ) ) ( not ( = ?auto_350187 ?auto_350188 ) ) ( not ( = ?auto_350187 ?auto_350189 ) ) ( not ( = ?auto_350187 ?auto_350190 ) ) ( not ( = ?auto_350187 ?auto_350191 ) ) ( not ( = ?auto_350187 ?auto_350192 ) ) ( not ( = ?auto_350187 ?auto_350193 ) ) ( not ( = ?auto_350187 ?auto_350194 ) ) ( not ( = ?auto_350187 ?auto_350195 ) ) ( not ( = ?auto_350188 ?auto_350189 ) ) ( not ( = ?auto_350188 ?auto_350190 ) ) ( not ( = ?auto_350188 ?auto_350191 ) ) ( not ( = ?auto_350188 ?auto_350192 ) ) ( not ( = ?auto_350188 ?auto_350193 ) ) ( not ( = ?auto_350188 ?auto_350194 ) ) ( not ( = ?auto_350188 ?auto_350195 ) ) ( not ( = ?auto_350189 ?auto_350190 ) ) ( not ( = ?auto_350189 ?auto_350191 ) ) ( not ( = ?auto_350189 ?auto_350192 ) ) ( not ( = ?auto_350189 ?auto_350193 ) ) ( not ( = ?auto_350189 ?auto_350194 ) ) ( not ( = ?auto_350189 ?auto_350195 ) ) ( not ( = ?auto_350190 ?auto_350191 ) ) ( not ( = ?auto_350190 ?auto_350192 ) ) ( not ( = ?auto_350190 ?auto_350193 ) ) ( not ( = ?auto_350190 ?auto_350194 ) ) ( not ( = ?auto_350190 ?auto_350195 ) ) ( not ( = ?auto_350191 ?auto_350192 ) ) ( not ( = ?auto_350191 ?auto_350193 ) ) ( not ( = ?auto_350191 ?auto_350194 ) ) ( not ( = ?auto_350191 ?auto_350195 ) ) ( not ( = ?auto_350192 ?auto_350193 ) ) ( not ( = ?auto_350192 ?auto_350194 ) ) ( not ( = ?auto_350192 ?auto_350195 ) ) ( not ( = ?auto_350193 ?auto_350194 ) ) ( not ( = ?auto_350193 ?auto_350195 ) ) ( not ( = ?auto_350194 ?auto_350195 ) ) ( ON ?auto_350193 ?auto_350194 ) ( ON ?auto_350192 ?auto_350193 ) ( ON ?auto_350191 ?auto_350192 ) ( ON ?auto_350190 ?auto_350191 ) ( CLEAR ?auto_350188 ) ( ON ?auto_350189 ?auto_350190 ) ( CLEAR ?auto_350189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_350183 ?auto_350184 ?auto_350185 ?auto_350186 ?auto_350187 ?auto_350188 ?auto_350189 )
      ( MAKE-12PILE ?auto_350183 ?auto_350184 ?auto_350185 ?auto_350186 ?auto_350187 ?auto_350188 ?auto_350189 ?auto_350190 ?auto_350191 ?auto_350192 ?auto_350193 ?auto_350194 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350208 - BLOCK
      ?auto_350209 - BLOCK
      ?auto_350210 - BLOCK
      ?auto_350211 - BLOCK
      ?auto_350212 - BLOCK
      ?auto_350213 - BLOCK
      ?auto_350214 - BLOCK
      ?auto_350215 - BLOCK
      ?auto_350216 - BLOCK
      ?auto_350217 - BLOCK
      ?auto_350218 - BLOCK
      ?auto_350219 - BLOCK
    )
    :vars
    (
      ?auto_350220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350219 ?auto_350220 ) ( ON-TABLE ?auto_350208 ) ( ON ?auto_350209 ?auto_350208 ) ( ON ?auto_350210 ?auto_350209 ) ( ON ?auto_350211 ?auto_350210 ) ( ON ?auto_350212 ?auto_350211 ) ( ON ?auto_350213 ?auto_350212 ) ( not ( = ?auto_350208 ?auto_350209 ) ) ( not ( = ?auto_350208 ?auto_350210 ) ) ( not ( = ?auto_350208 ?auto_350211 ) ) ( not ( = ?auto_350208 ?auto_350212 ) ) ( not ( = ?auto_350208 ?auto_350213 ) ) ( not ( = ?auto_350208 ?auto_350214 ) ) ( not ( = ?auto_350208 ?auto_350215 ) ) ( not ( = ?auto_350208 ?auto_350216 ) ) ( not ( = ?auto_350208 ?auto_350217 ) ) ( not ( = ?auto_350208 ?auto_350218 ) ) ( not ( = ?auto_350208 ?auto_350219 ) ) ( not ( = ?auto_350208 ?auto_350220 ) ) ( not ( = ?auto_350209 ?auto_350210 ) ) ( not ( = ?auto_350209 ?auto_350211 ) ) ( not ( = ?auto_350209 ?auto_350212 ) ) ( not ( = ?auto_350209 ?auto_350213 ) ) ( not ( = ?auto_350209 ?auto_350214 ) ) ( not ( = ?auto_350209 ?auto_350215 ) ) ( not ( = ?auto_350209 ?auto_350216 ) ) ( not ( = ?auto_350209 ?auto_350217 ) ) ( not ( = ?auto_350209 ?auto_350218 ) ) ( not ( = ?auto_350209 ?auto_350219 ) ) ( not ( = ?auto_350209 ?auto_350220 ) ) ( not ( = ?auto_350210 ?auto_350211 ) ) ( not ( = ?auto_350210 ?auto_350212 ) ) ( not ( = ?auto_350210 ?auto_350213 ) ) ( not ( = ?auto_350210 ?auto_350214 ) ) ( not ( = ?auto_350210 ?auto_350215 ) ) ( not ( = ?auto_350210 ?auto_350216 ) ) ( not ( = ?auto_350210 ?auto_350217 ) ) ( not ( = ?auto_350210 ?auto_350218 ) ) ( not ( = ?auto_350210 ?auto_350219 ) ) ( not ( = ?auto_350210 ?auto_350220 ) ) ( not ( = ?auto_350211 ?auto_350212 ) ) ( not ( = ?auto_350211 ?auto_350213 ) ) ( not ( = ?auto_350211 ?auto_350214 ) ) ( not ( = ?auto_350211 ?auto_350215 ) ) ( not ( = ?auto_350211 ?auto_350216 ) ) ( not ( = ?auto_350211 ?auto_350217 ) ) ( not ( = ?auto_350211 ?auto_350218 ) ) ( not ( = ?auto_350211 ?auto_350219 ) ) ( not ( = ?auto_350211 ?auto_350220 ) ) ( not ( = ?auto_350212 ?auto_350213 ) ) ( not ( = ?auto_350212 ?auto_350214 ) ) ( not ( = ?auto_350212 ?auto_350215 ) ) ( not ( = ?auto_350212 ?auto_350216 ) ) ( not ( = ?auto_350212 ?auto_350217 ) ) ( not ( = ?auto_350212 ?auto_350218 ) ) ( not ( = ?auto_350212 ?auto_350219 ) ) ( not ( = ?auto_350212 ?auto_350220 ) ) ( not ( = ?auto_350213 ?auto_350214 ) ) ( not ( = ?auto_350213 ?auto_350215 ) ) ( not ( = ?auto_350213 ?auto_350216 ) ) ( not ( = ?auto_350213 ?auto_350217 ) ) ( not ( = ?auto_350213 ?auto_350218 ) ) ( not ( = ?auto_350213 ?auto_350219 ) ) ( not ( = ?auto_350213 ?auto_350220 ) ) ( not ( = ?auto_350214 ?auto_350215 ) ) ( not ( = ?auto_350214 ?auto_350216 ) ) ( not ( = ?auto_350214 ?auto_350217 ) ) ( not ( = ?auto_350214 ?auto_350218 ) ) ( not ( = ?auto_350214 ?auto_350219 ) ) ( not ( = ?auto_350214 ?auto_350220 ) ) ( not ( = ?auto_350215 ?auto_350216 ) ) ( not ( = ?auto_350215 ?auto_350217 ) ) ( not ( = ?auto_350215 ?auto_350218 ) ) ( not ( = ?auto_350215 ?auto_350219 ) ) ( not ( = ?auto_350215 ?auto_350220 ) ) ( not ( = ?auto_350216 ?auto_350217 ) ) ( not ( = ?auto_350216 ?auto_350218 ) ) ( not ( = ?auto_350216 ?auto_350219 ) ) ( not ( = ?auto_350216 ?auto_350220 ) ) ( not ( = ?auto_350217 ?auto_350218 ) ) ( not ( = ?auto_350217 ?auto_350219 ) ) ( not ( = ?auto_350217 ?auto_350220 ) ) ( not ( = ?auto_350218 ?auto_350219 ) ) ( not ( = ?auto_350218 ?auto_350220 ) ) ( not ( = ?auto_350219 ?auto_350220 ) ) ( ON ?auto_350218 ?auto_350219 ) ( ON ?auto_350217 ?auto_350218 ) ( ON ?auto_350216 ?auto_350217 ) ( ON ?auto_350215 ?auto_350216 ) ( CLEAR ?auto_350213 ) ( ON ?auto_350214 ?auto_350215 ) ( CLEAR ?auto_350214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_350208 ?auto_350209 ?auto_350210 ?auto_350211 ?auto_350212 ?auto_350213 ?auto_350214 )
      ( MAKE-12PILE ?auto_350208 ?auto_350209 ?auto_350210 ?auto_350211 ?auto_350212 ?auto_350213 ?auto_350214 ?auto_350215 ?auto_350216 ?auto_350217 ?auto_350218 ?auto_350219 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350233 - BLOCK
      ?auto_350234 - BLOCK
      ?auto_350235 - BLOCK
      ?auto_350236 - BLOCK
      ?auto_350237 - BLOCK
      ?auto_350238 - BLOCK
      ?auto_350239 - BLOCK
      ?auto_350240 - BLOCK
      ?auto_350241 - BLOCK
      ?auto_350242 - BLOCK
      ?auto_350243 - BLOCK
      ?auto_350244 - BLOCK
    )
    :vars
    (
      ?auto_350245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350244 ?auto_350245 ) ( ON-TABLE ?auto_350233 ) ( ON ?auto_350234 ?auto_350233 ) ( ON ?auto_350235 ?auto_350234 ) ( ON ?auto_350236 ?auto_350235 ) ( ON ?auto_350237 ?auto_350236 ) ( not ( = ?auto_350233 ?auto_350234 ) ) ( not ( = ?auto_350233 ?auto_350235 ) ) ( not ( = ?auto_350233 ?auto_350236 ) ) ( not ( = ?auto_350233 ?auto_350237 ) ) ( not ( = ?auto_350233 ?auto_350238 ) ) ( not ( = ?auto_350233 ?auto_350239 ) ) ( not ( = ?auto_350233 ?auto_350240 ) ) ( not ( = ?auto_350233 ?auto_350241 ) ) ( not ( = ?auto_350233 ?auto_350242 ) ) ( not ( = ?auto_350233 ?auto_350243 ) ) ( not ( = ?auto_350233 ?auto_350244 ) ) ( not ( = ?auto_350233 ?auto_350245 ) ) ( not ( = ?auto_350234 ?auto_350235 ) ) ( not ( = ?auto_350234 ?auto_350236 ) ) ( not ( = ?auto_350234 ?auto_350237 ) ) ( not ( = ?auto_350234 ?auto_350238 ) ) ( not ( = ?auto_350234 ?auto_350239 ) ) ( not ( = ?auto_350234 ?auto_350240 ) ) ( not ( = ?auto_350234 ?auto_350241 ) ) ( not ( = ?auto_350234 ?auto_350242 ) ) ( not ( = ?auto_350234 ?auto_350243 ) ) ( not ( = ?auto_350234 ?auto_350244 ) ) ( not ( = ?auto_350234 ?auto_350245 ) ) ( not ( = ?auto_350235 ?auto_350236 ) ) ( not ( = ?auto_350235 ?auto_350237 ) ) ( not ( = ?auto_350235 ?auto_350238 ) ) ( not ( = ?auto_350235 ?auto_350239 ) ) ( not ( = ?auto_350235 ?auto_350240 ) ) ( not ( = ?auto_350235 ?auto_350241 ) ) ( not ( = ?auto_350235 ?auto_350242 ) ) ( not ( = ?auto_350235 ?auto_350243 ) ) ( not ( = ?auto_350235 ?auto_350244 ) ) ( not ( = ?auto_350235 ?auto_350245 ) ) ( not ( = ?auto_350236 ?auto_350237 ) ) ( not ( = ?auto_350236 ?auto_350238 ) ) ( not ( = ?auto_350236 ?auto_350239 ) ) ( not ( = ?auto_350236 ?auto_350240 ) ) ( not ( = ?auto_350236 ?auto_350241 ) ) ( not ( = ?auto_350236 ?auto_350242 ) ) ( not ( = ?auto_350236 ?auto_350243 ) ) ( not ( = ?auto_350236 ?auto_350244 ) ) ( not ( = ?auto_350236 ?auto_350245 ) ) ( not ( = ?auto_350237 ?auto_350238 ) ) ( not ( = ?auto_350237 ?auto_350239 ) ) ( not ( = ?auto_350237 ?auto_350240 ) ) ( not ( = ?auto_350237 ?auto_350241 ) ) ( not ( = ?auto_350237 ?auto_350242 ) ) ( not ( = ?auto_350237 ?auto_350243 ) ) ( not ( = ?auto_350237 ?auto_350244 ) ) ( not ( = ?auto_350237 ?auto_350245 ) ) ( not ( = ?auto_350238 ?auto_350239 ) ) ( not ( = ?auto_350238 ?auto_350240 ) ) ( not ( = ?auto_350238 ?auto_350241 ) ) ( not ( = ?auto_350238 ?auto_350242 ) ) ( not ( = ?auto_350238 ?auto_350243 ) ) ( not ( = ?auto_350238 ?auto_350244 ) ) ( not ( = ?auto_350238 ?auto_350245 ) ) ( not ( = ?auto_350239 ?auto_350240 ) ) ( not ( = ?auto_350239 ?auto_350241 ) ) ( not ( = ?auto_350239 ?auto_350242 ) ) ( not ( = ?auto_350239 ?auto_350243 ) ) ( not ( = ?auto_350239 ?auto_350244 ) ) ( not ( = ?auto_350239 ?auto_350245 ) ) ( not ( = ?auto_350240 ?auto_350241 ) ) ( not ( = ?auto_350240 ?auto_350242 ) ) ( not ( = ?auto_350240 ?auto_350243 ) ) ( not ( = ?auto_350240 ?auto_350244 ) ) ( not ( = ?auto_350240 ?auto_350245 ) ) ( not ( = ?auto_350241 ?auto_350242 ) ) ( not ( = ?auto_350241 ?auto_350243 ) ) ( not ( = ?auto_350241 ?auto_350244 ) ) ( not ( = ?auto_350241 ?auto_350245 ) ) ( not ( = ?auto_350242 ?auto_350243 ) ) ( not ( = ?auto_350242 ?auto_350244 ) ) ( not ( = ?auto_350242 ?auto_350245 ) ) ( not ( = ?auto_350243 ?auto_350244 ) ) ( not ( = ?auto_350243 ?auto_350245 ) ) ( not ( = ?auto_350244 ?auto_350245 ) ) ( ON ?auto_350243 ?auto_350244 ) ( ON ?auto_350242 ?auto_350243 ) ( ON ?auto_350241 ?auto_350242 ) ( ON ?auto_350240 ?auto_350241 ) ( ON ?auto_350239 ?auto_350240 ) ( CLEAR ?auto_350237 ) ( ON ?auto_350238 ?auto_350239 ) ( CLEAR ?auto_350238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_350233 ?auto_350234 ?auto_350235 ?auto_350236 ?auto_350237 ?auto_350238 )
      ( MAKE-12PILE ?auto_350233 ?auto_350234 ?auto_350235 ?auto_350236 ?auto_350237 ?auto_350238 ?auto_350239 ?auto_350240 ?auto_350241 ?auto_350242 ?auto_350243 ?auto_350244 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350258 - BLOCK
      ?auto_350259 - BLOCK
      ?auto_350260 - BLOCK
      ?auto_350261 - BLOCK
      ?auto_350262 - BLOCK
      ?auto_350263 - BLOCK
      ?auto_350264 - BLOCK
      ?auto_350265 - BLOCK
      ?auto_350266 - BLOCK
      ?auto_350267 - BLOCK
      ?auto_350268 - BLOCK
      ?auto_350269 - BLOCK
    )
    :vars
    (
      ?auto_350270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350269 ?auto_350270 ) ( ON-TABLE ?auto_350258 ) ( ON ?auto_350259 ?auto_350258 ) ( ON ?auto_350260 ?auto_350259 ) ( ON ?auto_350261 ?auto_350260 ) ( ON ?auto_350262 ?auto_350261 ) ( not ( = ?auto_350258 ?auto_350259 ) ) ( not ( = ?auto_350258 ?auto_350260 ) ) ( not ( = ?auto_350258 ?auto_350261 ) ) ( not ( = ?auto_350258 ?auto_350262 ) ) ( not ( = ?auto_350258 ?auto_350263 ) ) ( not ( = ?auto_350258 ?auto_350264 ) ) ( not ( = ?auto_350258 ?auto_350265 ) ) ( not ( = ?auto_350258 ?auto_350266 ) ) ( not ( = ?auto_350258 ?auto_350267 ) ) ( not ( = ?auto_350258 ?auto_350268 ) ) ( not ( = ?auto_350258 ?auto_350269 ) ) ( not ( = ?auto_350258 ?auto_350270 ) ) ( not ( = ?auto_350259 ?auto_350260 ) ) ( not ( = ?auto_350259 ?auto_350261 ) ) ( not ( = ?auto_350259 ?auto_350262 ) ) ( not ( = ?auto_350259 ?auto_350263 ) ) ( not ( = ?auto_350259 ?auto_350264 ) ) ( not ( = ?auto_350259 ?auto_350265 ) ) ( not ( = ?auto_350259 ?auto_350266 ) ) ( not ( = ?auto_350259 ?auto_350267 ) ) ( not ( = ?auto_350259 ?auto_350268 ) ) ( not ( = ?auto_350259 ?auto_350269 ) ) ( not ( = ?auto_350259 ?auto_350270 ) ) ( not ( = ?auto_350260 ?auto_350261 ) ) ( not ( = ?auto_350260 ?auto_350262 ) ) ( not ( = ?auto_350260 ?auto_350263 ) ) ( not ( = ?auto_350260 ?auto_350264 ) ) ( not ( = ?auto_350260 ?auto_350265 ) ) ( not ( = ?auto_350260 ?auto_350266 ) ) ( not ( = ?auto_350260 ?auto_350267 ) ) ( not ( = ?auto_350260 ?auto_350268 ) ) ( not ( = ?auto_350260 ?auto_350269 ) ) ( not ( = ?auto_350260 ?auto_350270 ) ) ( not ( = ?auto_350261 ?auto_350262 ) ) ( not ( = ?auto_350261 ?auto_350263 ) ) ( not ( = ?auto_350261 ?auto_350264 ) ) ( not ( = ?auto_350261 ?auto_350265 ) ) ( not ( = ?auto_350261 ?auto_350266 ) ) ( not ( = ?auto_350261 ?auto_350267 ) ) ( not ( = ?auto_350261 ?auto_350268 ) ) ( not ( = ?auto_350261 ?auto_350269 ) ) ( not ( = ?auto_350261 ?auto_350270 ) ) ( not ( = ?auto_350262 ?auto_350263 ) ) ( not ( = ?auto_350262 ?auto_350264 ) ) ( not ( = ?auto_350262 ?auto_350265 ) ) ( not ( = ?auto_350262 ?auto_350266 ) ) ( not ( = ?auto_350262 ?auto_350267 ) ) ( not ( = ?auto_350262 ?auto_350268 ) ) ( not ( = ?auto_350262 ?auto_350269 ) ) ( not ( = ?auto_350262 ?auto_350270 ) ) ( not ( = ?auto_350263 ?auto_350264 ) ) ( not ( = ?auto_350263 ?auto_350265 ) ) ( not ( = ?auto_350263 ?auto_350266 ) ) ( not ( = ?auto_350263 ?auto_350267 ) ) ( not ( = ?auto_350263 ?auto_350268 ) ) ( not ( = ?auto_350263 ?auto_350269 ) ) ( not ( = ?auto_350263 ?auto_350270 ) ) ( not ( = ?auto_350264 ?auto_350265 ) ) ( not ( = ?auto_350264 ?auto_350266 ) ) ( not ( = ?auto_350264 ?auto_350267 ) ) ( not ( = ?auto_350264 ?auto_350268 ) ) ( not ( = ?auto_350264 ?auto_350269 ) ) ( not ( = ?auto_350264 ?auto_350270 ) ) ( not ( = ?auto_350265 ?auto_350266 ) ) ( not ( = ?auto_350265 ?auto_350267 ) ) ( not ( = ?auto_350265 ?auto_350268 ) ) ( not ( = ?auto_350265 ?auto_350269 ) ) ( not ( = ?auto_350265 ?auto_350270 ) ) ( not ( = ?auto_350266 ?auto_350267 ) ) ( not ( = ?auto_350266 ?auto_350268 ) ) ( not ( = ?auto_350266 ?auto_350269 ) ) ( not ( = ?auto_350266 ?auto_350270 ) ) ( not ( = ?auto_350267 ?auto_350268 ) ) ( not ( = ?auto_350267 ?auto_350269 ) ) ( not ( = ?auto_350267 ?auto_350270 ) ) ( not ( = ?auto_350268 ?auto_350269 ) ) ( not ( = ?auto_350268 ?auto_350270 ) ) ( not ( = ?auto_350269 ?auto_350270 ) ) ( ON ?auto_350268 ?auto_350269 ) ( ON ?auto_350267 ?auto_350268 ) ( ON ?auto_350266 ?auto_350267 ) ( ON ?auto_350265 ?auto_350266 ) ( ON ?auto_350264 ?auto_350265 ) ( CLEAR ?auto_350262 ) ( ON ?auto_350263 ?auto_350264 ) ( CLEAR ?auto_350263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_350258 ?auto_350259 ?auto_350260 ?auto_350261 ?auto_350262 ?auto_350263 )
      ( MAKE-12PILE ?auto_350258 ?auto_350259 ?auto_350260 ?auto_350261 ?auto_350262 ?auto_350263 ?auto_350264 ?auto_350265 ?auto_350266 ?auto_350267 ?auto_350268 ?auto_350269 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350283 - BLOCK
      ?auto_350284 - BLOCK
      ?auto_350285 - BLOCK
      ?auto_350286 - BLOCK
      ?auto_350287 - BLOCK
      ?auto_350288 - BLOCK
      ?auto_350289 - BLOCK
      ?auto_350290 - BLOCK
      ?auto_350291 - BLOCK
      ?auto_350292 - BLOCK
      ?auto_350293 - BLOCK
      ?auto_350294 - BLOCK
    )
    :vars
    (
      ?auto_350295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350294 ?auto_350295 ) ( ON-TABLE ?auto_350283 ) ( ON ?auto_350284 ?auto_350283 ) ( ON ?auto_350285 ?auto_350284 ) ( ON ?auto_350286 ?auto_350285 ) ( not ( = ?auto_350283 ?auto_350284 ) ) ( not ( = ?auto_350283 ?auto_350285 ) ) ( not ( = ?auto_350283 ?auto_350286 ) ) ( not ( = ?auto_350283 ?auto_350287 ) ) ( not ( = ?auto_350283 ?auto_350288 ) ) ( not ( = ?auto_350283 ?auto_350289 ) ) ( not ( = ?auto_350283 ?auto_350290 ) ) ( not ( = ?auto_350283 ?auto_350291 ) ) ( not ( = ?auto_350283 ?auto_350292 ) ) ( not ( = ?auto_350283 ?auto_350293 ) ) ( not ( = ?auto_350283 ?auto_350294 ) ) ( not ( = ?auto_350283 ?auto_350295 ) ) ( not ( = ?auto_350284 ?auto_350285 ) ) ( not ( = ?auto_350284 ?auto_350286 ) ) ( not ( = ?auto_350284 ?auto_350287 ) ) ( not ( = ?auto_350284 ?auto_350288 ) ) ( not ( = ?auto_350284 ?auto_350289 ) ) ( not ( = ?auto_350284 ?auto_350290 ) ) ( not ( = ?auto_350284 ?auto_350291 ) ) ( not ( = ?auto_350284 ?auto_350292 ) ) ( not ( = ?auto_350284 ?auto_350293 ) ) ( not ( = ?auto_350284 ?auto_350294 ) ) ( not ( = ?auto_350284 ?auto_350295 ) ) ( not ( = ?auto_350285 ?auto_350286 ) ) ( not ( = ?auto_350285 ?auto_350287 ) ) ( not ( = ?auto_350285 ?auto_350288 ) ) ( not ( = ?auto_350285 ?auto_350289 ) ) ( not ( = ?auto_350285 ?auto_350290 ) ) ( not ( = ?auto_350285 ?auto_350291 ) ) ( not ( = ?auto_350285 ?auto_350292 ) ) ( not ( = ?auto_350285 ?auto_350293 ) ) ( not ( = ?auto_350285 ?auto_350294 ) ) ( not ( = ?auto_350285 ?auto_350295 ) ) ( not ( = ?auto_350286 ?auto_350287 ) ) ( not ( = ?auto_350286 ?auto_350288 ) ) ( not ( = ?auto_350286 ?auto_350289 ) ) ( not ( = ?auto_350286 ?auto_350290 ) ) ( not ( = ?auto_350286 ?auto_350291 ) ) ( not ( = ?auto_350286 ?auto_350292 ) ) ( not ( = ?auto_350286 ?auto_350293 ) ) ( not ( = ?auto_350286 ?auto_350294 ) ) ( not ( = ?auto_350286 ?auto_350295 ) ) ( not ( = ?auto_350287 ?auto_350288 ) ) ( not ( = ?auto_350287 ?auto_350289 ) ) ( not ( = ?auto_350287 ?auto_350290 ) ) ( not ( = ?auto_350287 ?auto_350291 ) ) ( not ( = ?auto_350287 ?auto_350292 ) ) ( not ( = ?auto_350287 ?auto_350293 ) ) ( not ( = ?auto_350287 ?auto_350294 ) ) ( not ( = ?auto_350287 ?auto_350295 ) ) ( not ( = ?auto_350288 ?auto_350289 ) ) ( not ( = ?auto_350288 ?auto_350290 ) ) ( not ( = ?auto_350288 ?auto_350291 ) ) ( not ( = ?auto_350288 ?auto_350292 ) ) ( not ( = ?auto_350288 ?auto_350293 ) ) ( not ( = ?auto_350288 ?auto_350294 ) ) ( not ( = ?auto_350288 ?auto_350295 ) ) ( not ( = ?auto_350289 ?auto_350290 ) ) ( not ( = ?auto_350289 ?auto_350291 ) ) ( not ( = ?auto_350289 ?auto_350292 ) ) ( not ( = ?auto_350289 ?auto_350293 ) ) ( not ( = ?auto_350289 ?auto_350294 ) ) ( not ( = ?auto_350289 ?auto_350295 ) ) ( not ( = ?auto_350290 ?auto_350291 ) ) ( not ( = ?auto_350290 ?auto_350292 ) ) ( not ( = ?auto_350290 ?auto_350293 ) ) ( not ( = ?auto_350290 ?auto_350294 ) ) ( not ( = ?auto_350290 ?auto_350295 ) ) ( not ( = ?auto_350291 ?auto_350292 ) ) ( not ( = ?auto_350291 ?auto_350293 ) ) ( not ( = ?auto_350291 ?auto_350294 ) ) ( not ( = ?auto_350291 ?auto_350295 ) ) ( not ( = ?auto_350292 ?auto_350293 ) ) ( not ( = ?auto_350292 ?auto_350294 ) ) ( not ( = ?auto_350292 ?auto_350295 ) ) ( not ( = ?auto_350293 ?auto_350294 ) ) ( not ( = ?auto_350293 ?auto_350295 ) ) ( not ( = ?auto_350294 ?auto_350295 ) ) ( ON ?auto_350293 ?auto_350294 ) ( ON ?auto_350292 ?auto_350293 ) ( ON ?auto_350291 ?auto_350292 ) ( ON ?auto_350290 ?auto_350291 ) ( ON ?auto_350289 ?auto_350290 ) ( ON ?auto_350288 ?auto_350289 ) ( CLEAR ?auto_350286 ) ( ON ?auto_350287 ?auto_350288 ) ( CLEAR ?auto_350287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_350283 ?auto_350284 ?auto_350285 ?auto_350286 ?auto_350287 )
      ( MAKE-12PILE ?auto_350283 ?auto_350284 ?auto_350285 ?auto_350286 ?auto_350287 ?auto_350288 ?auto_350289 ?auto_350290 ?auto_350291 ?auto_350292 ?auto_350293 ?auto_350294 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350308 - BLOCK
      ?auto_350309 - BLOCK
      ?auto_350310 - BLOCK
      ?auto_350311 - BLOCK
      ?auto_350312 - BLOCK
      ?auto_350313 - BLOCK
      ?auto_350314 - BLOCK
      ?auto_350315 - BLOCK
      ?auto_350316 - BLOCK
      ?auto_350317 - BLOCK
      ?auto_350318 - BLOCK
      ?auto_350319 - BLOCK
    )
    :vars
    (
      ?auto_350320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350319 ?auto_350320 ) ( ON-TABLE ?auto_350308 ) ( ON ?auto_350309 ?auto_350308 ) ( ON ?auto_350310 ?auto_350309 ) ( ON ?auto_350311 ?auto_350310 ) ( not ( = ?auto_350308 ?auto_350309 ) ) ( not ( = ?auto_350308 ?auto_350310 ) ) ( not ( = ?auto_350308 ?auto_350311 ) ) ( not ( = ?auto_350308 ?auto_350312 ) ) ( not ( = ?auto_350308 ?auto_350313 ) ) ( not ( = ?auto_350308 ?auto_350314 ) ) ( not ( = ?auto_350308 ?auto_350315 ) ) ( not ( = ?auto_350308 ?auto_350316 ) ) ( not ( = ?auto_350308 ?auto_350317 ) ) ( not ( = ?auto_350308 ?auto_350318 ) ) ( not ( = ?auto_350308 ?auto_350319 ) ) ( not ( = ?auto_350308 ?auto_350320 ) ) ( not ( = ?auto_350309 ?auto_350310 ) ) ( not ( = ?auto_350309 ?auto_350311 ) ) ( not ( = ?auto_350309 ?auto_350312 ) ) ( not ( = ?auto_350309 ?auto_350313 ) ) ( not ( = ?auto_350309 ?auto_350314 ) ) ( not ( = ?auto_350309 ?auto_350315 ) ) ( not ( = ?auto_350309 ?auto_350316 ) ) ( not ( = ?auto_350309 ?auto_350317 ) ) ( not ( = ?auto_350309 ?auto_350318 ) ) ( not ( = ?auto_350309 ?auto_350319 ) ) ( not ( = ?auto_350309 ?auto_350320 ) ) ( not ( = ?auto_350310 ?auto_350311 ) ) ( not ( = ?auto_350310 ?auto_350312 ) ) ( not ( = ?auto_350310 ?auto_350313 ) ) ( not ( = ?auto_350310 ?auto_350314 ) ) ( not ( = ?auto_350310 ?auto_350315 ) ) ( not ( = ?auto_350310 ?auto_350316 ) ) ( not ( = ?auto_350310 ?auto_350317 ) ) ( not ( = ?auto_350310 ?auto_350318 ) ) ( not ( = ?auto_350310 ?auto_350319 ) ) ( not ( = ?auto_350310 ?auto_350320 ) ) ( not ( = ?auto_350311 ?auto_350312 ) ) ( not ( = ?auto_350311 ?auto_350313 ) ) ( not ( = ?auto_350311 ?auto_350314 ) ) ( not ( = ?auto_350311 ?auto_350315 ) ) ( not ( = ?auto_350311 ?auto_350316 ) ) ( not ( = ?auto_350311 ?auto_350317 ) ) ( not ( = ?auto_350311 ?auto_350318 ) ) ( not ( = ?auto_350311 ?auto_350319 ) ) ( not ( = ?auto_350311 ?auto_350320 ) ) ( not ( = ?auto_350312 ?auto_350313 ) ) ( not ( = ?auto_350312 ?auto_350314 ) ) ( not ( = ?auto_350312 ?auto_350315 ) ) ( not ( = ?auto_350312 ?auto_350316 ) ) ( not ( = ?auto_350312 ?auto_350317 ) ) ( not ( = ?auto_350312 ?auto_350318 ) ) ( not ( = ?auto_350312 ?auto_350319 ) ) ( not ( = ?auto_350312 ?auto_350320 ) ) ( not ( = ?auto_350313 ?auto_350314 ) ) ( not ( = ?auto_350313 ?auto_350315 ) ) ( not ( = ?auto_350313 ?auto_350316 ) ) ( not ( = ?auto_350313 ?auto_350317 ) ) ( not ( = ?auto_350313 ?auto_350318 ) ) ( not ( = ?auto_350313 ?auto_350319 ) ) ( not ( = ?auto_350313 ?auto_350320 ) ) ( not ( = ?auto_350314 ?auto_350315 ) ) ( not ( = ?auto_350314 ?auto_350316 ) ) ( not ( = ?auto_350314 ?auto_350317 ) ) ( not ( = ?auto_350314 ?auto_350318 ) ) ( not ( = ?auto_350314 ?auto_350319 ) ) ( not ( = ?auto_350314 ?auto_350320 ) ) ( not ( = ?auto_350315 ?auto_350316 ) ) ( not ( = ?auto_350315 ?auto_350317 ) ) ( not ( = ?auto_350315 ?auto_350318 ) ) ( not ( = ?auto_350315 ?auto_350319 ) ) ( not ( = ?auto_350315 ?auto_350320 ) ) ( not ( = ?auto_350316 ?auto_350317 ) ) ( not ( = ?auto_350316 ?auto_350318 ) ) ( not ( = ?auto_350316 ?auto_350319 ) ) ( not ( = ?auto_350316 ?auto_350320 ) ) ( not ( = ?auto_350317 ?auto_350318 ) ) ( not ( = ?auto_350317 ?auto_350319 ) ) ( not ( = ?auto_350317 ?auto_350320 ) ) ( not ( = ?auto_350318 ?auto_350319 ) ) ( not ( = ?auto_350318 ?auto_350320 ) ) ( not ( = ?auto_350319 ?auto_350320 ) ) ( ON ?auto_350318 ?auto_350319 ) ( ON ?auto_350317 ?auto_350318 ) ( ON ?auto_350316 ?auto_350317 ) ( ON ?auto_350315 ?auto_350316 ) ( ON ?auto_350314 ?auto_350315 ) ( ON ?auto_350313 ?auto_350314 ) ( CLEAR ?auto_350311 ) ( ON ?auto_350312 ?auto_350313 ) ( CLEAR ?auto_350312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_350308 ?auto_350309 ?auto_350310 ?auto_350311 ?auto_350312 )
      ( MAKE-12PILE ?auto_350308 ?auto_350309 ?auto_350310 ?auto_350311 ?auto_350312 ?auto_350313 ?auto_350314 ?auto_350315 ?auto_350316 ?auto_350317 ?auto_350318 ?auto_350319 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350333 - BLOCK
      ?auto_350334 - BLOCK
      ?auto_350335 - BLOCK
      ?auto_350336 - BLOCK
      ?auto_350337 - BLOCK
      ?auto_350338 - BLOCK
      ?auto_350339 - BLOCK
      ?auto_350340 - BLOCK
      ?auto_350341 - BLOCK
      ?auto_350342 - BLOCK
      ?auto_350343 - BLOCK
      ?auto_350344 - BLOCK
    )
    :vars
    (
      ?auto_350345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350344 ?auto_350345 ) ( ON-TABLE ?auto_350333 ) ( ON ?auto_350334 ?auto_350333 ) ( ON ?auto_350335 ?auto_350334 ) ( not ( = ?auto_350333 ?auto_350334 ) ) ( not ( = ?auto_350333 ?auto_350335 ) ) ( not ( = ?auto_350333 ?auto_350336 ) ) ( not ( = ?auto_350333 ?auto_350337 ) ) ( not ( = ?auto_350333 ?auto_350338 ) ) ( not ( = ?auto_350333 ?auto_350339 ) ) ( not ( = ?auto_350333 ?auto_350340 ) ) ( not ( = ?auto_350333 ?auto_350341 ) ) ( not ( = ?auto_350333 ?auto_350342 ) ) ( not ( = ?auto_350333 ?auto_350343 ) ) ( not ( = ?auto_350333 ?auto_350344 ) ) ( not ( = ?auto_350333 ?auto_350345 ) ) ( not ( = ?auto_350334 ?auto_350335 ) ) ( not ( = ?auto_350334 ?auto_350336 ) ) ( not ( = ?auto_350334 ?auto_350337 ) ) ( not ( = ?auto_350334 ?auto_350338 ) ) ( not ( = ?auto_350334 ?auto_350339 ) ) ( not ( = ?auto_350334 ?auto_350340 ) ) ( not ( = ?auto_350334 ?auto_350341 ) ) ( not ( = ?auto_350334 ?auto_350342 ) ) ( not ( = ?auto_350334 ?auto_350343 ) ) ( not ( = ?auto_350334 ?auto_350344 ) ) ( not ( = ?auto_350334 ?auto_350345 ) ) ( not ( = ?auto_350335 ?auto_350336 ) ) ( not ( = ?auto_350335 ?auto_350337 ) ) ( not ( = ?auto_350335 ?auto_350338 ) ) ( not ( = ?auto_350335 ?auto_350339 ) ) ( not ( = ?auto_350335 ?auto_350340 ) ) ( not ( = ?auto_350335 ?auto_350341 ) ) ( not ( = ?auto_350335 ?auto_350342 ) ) ( not ( = ?auto_350335 ?auto_350343 ) ) ( not ( = ?auto_350335 ?auto_350344 ) ) ( not ( = ?auto_350335 ?auto_350345 ) ) ( not ( = ?auto_350336 ?auto_350337 ) ) ( not ( = ?auto_350336 ?auto_350338 ) ) ( not ( = ?auto_350336 ?auto_350339 ) ) ( not ( = ?auto_350336 ?auto_350340 ) ) ( not ( = ?auto_350336 ?auto_350341 ) ) ( not ( = ?auto_350336 ?auto_350342 ) ) ( not ( = ?auto_350336 ?auto_350343 ) ) ( not ( = ?auto_350336 ?auto_350344 ) ) ( not ( = ?auto_350336 ?auto_350345 ) ) ( not ( = ?auto_350337 ?auto_350338 ) ) ( not ( = ?auto_350337 ?auto_350339 ) ) ( not ( = ?auto_350337 ?auto_350340 ) ) ( not ( = ?auto_350337 ?auto_350341 ) ) ( not ( = ?auto_350337 ?auto_350342 ) ) ( not ( = ?auto_350337 ?auto_350343 ) ) ( not ( = ?auto_350337 ?auto_350344 ) ) ( not ( = ?auto_350337 ?auto_350345 ) ) ( not ( = ?auto_350338 ?auto_350339 ) ) ( not ( = ?auto_350338 ?auto_350340 ) ) ( not ( = ?auto_350338 ?auto_350341 ) ) ( not ( = ?auto_350338 ?auto_350342 ) ) ( not ( = ?auto_350338 ?auto_350343 ) ) ( not ( = ?auto_350338 ?auto_350344 ) ) ( not ( = ?auto_350338 ?auto_350345 ) ) ( not ( = ?auto_350339 ?auto_350340 ) ) ( not ( = ?auto_350339 ?auto_350341 ) ) ( not ( = ?auto_350339 ?auto_350342 ) ) ( not ( = ?auto_350339 ?auto_350343 ) ) ( not ( = ?auto_350339 ?auto_350344 ) ) ( not ( = ?auto_350339 ?auto_350345 ) ) ( not ( = ?auto_350340 ?auto_350341 ) ) ( not ( = ?auto_350340 ?auto_350342 ) ) ( not ( = ?auto_350340 ?auto_350343 ) ) ( not ( = ?auto_350340 ?auto_350344 ) ) ( not ( = ?auto_350340 ?auto_350345 ) ) ( not ( = ?auto_350341 ?auto_350342 ) ) ( not ( = ?auto_350341 ?auto_350343 ) ) ( not ( = ?auto_350341 ?auto_350344 ) ) ( not ( = ?auto_350341 ?auto_350345 ) ) ( not ( = ?auto_350342 ?auto_350343 ) ) ( not ( = ?auto_350342 ?auto_350344 ) ) ( not ( = ?auto_350342 ?auto_350345 ) ) ( not ( = ?auto_350343 ?auto_350344 ) ) ( not ( = ?auto_350343 ?auto_350345 ) ) ( not ( = ?auto_350344 ?auto_350345 ) ) ( ON ?auto_350343 ?auto_350344 ) ( ON ?auto_350342 ?auto_350343 ) ( ON ?auto_350341 ?auto_350342 ) ( ON ?auto_350340 ?auto_350341 ) ( ON ?auto_350339 ?auto_350340 ) ( ON ?auto_350338 ?auto_350339 ) ( ON ?auto_350337 ?auto_350338 ) ( CLEAR ?auto_350335 ) ( ON ?auto_350336 ?auto_350337 ) ( CLEAR ?auto_350336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_350333 ?auto_350334 ?auto_350335 ?auto_350336 )
      ( MAKE-12PILE ?auto_350333 ?auto_350334 ?auto_350335 ?auto_350336 ?auto_350337 ?auto_350338 ?auto_350339 ?auto_350340 ?auto_350341 ?auto_350342 ?auto_350343 ?auto_350344 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350358 - BLOCK
      ?auto_350359 - BLOCK
      ?auto_350360 - BLOCK
      ?auto_350361 - BLOCK
      ?auto_350362 - BLOCK
      ?auto_350363 - BLOCK
      ?auto_350364 - BLOCK
      ?auto_350365 - BLOCK
      ?auto_350366 - BLOCK
      ?auto_350367 - BLOCK
      ?auto_350368 - BLOCK
      ?auto_350369 - BLOCK
    )
    :vars
    (
      ?auto_350370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350369 ?auto_350370 ) ( ON-TABLE ?auto_350358 ) ( ON ?auto_350359 ?auto_350358 ) ( ON ?auto_350360 ?auto_350359 ) ( not ( = ?auto_350358 ?auto_350359 ) ) ( not ( = ?auto_350358 ?auto_350360 ) ) ( not ( = ?auto_350358 ?auto_350361 ) ) ( not ( = ?auto_350358 ?auto_350362 ) ) ( not ( = ?auto_350358 ?auto_350363 ) ) ( not ( = ?auto_350358 ?auto_350364 ) ) ( not ( = ?auto_350358 ?auto_350365 ) ) ( not ( = ?auto_350358 ?auto_350366 ) ) ( not ( = ?auto_350358 ?auto_350367 ) ) ( not ( = ?auto_350358 ?auto_350368 ) ) ( not ( = ?auto_350358 ?auto_350369 ) ) ( not ( = ?auto_350358 ?auto_350370 ) ) ( not ( = ?auto_350359 ?auto_350360 ) ) ( not ( = ?auto_350359 ?auto_350361 ) ) ( not ( = ?auto_350359 ?auto_350362 ) ) ( not ( = ?auto_350359 ?auto_350363 ) ) ( not ( = ?auto_350359 ?auto_350364 ) ) ( not ( = ?auto_350359 ?auto_350365 ) ) ( not ( = ?auto_350359 ?auto_350366 ) ) ( not ( = ?auto_350359 ?auto_350367 ) ) ( not ( = ?auto_350359 ?auto_350368 ) ) ( not ( = ?auto_350359 ?auto_350369 ) ) ( not ( = ?auto_350359 ?auto_350370 ) ) ( not ( = ?auto_350360 ?auto_350361 ) ) ( not ( = ?auto_350360 ?auto_350362 ) ) ( not ( = ?auto_350360 ?auto_350363 ) ) ( not ( = ?auto_350360 ?auto_350364 ) ) ( not ( = ?auto_350360 ?auto_350365 ) ) ( not ( = ?auto_350360 ?auto_350366 ) ) ( not ( = ?auto_350360 ?auto_350367 ) ) ( not ( = ?auto_350360 ?auto_350368 ) ) ( not ( = ?auto_350360 ?auto_350369 ) ) ( not ( = ?auto_350360 ?auto_350370 ) ) ( not ( = ?auto_350361 ?auto_350362 ) ) ( not ( = ?auto_350361 ?auto_350363 ) ) ( not ( = ?auto_350361 ?auto_350364 ) ) ( not ( = ?auto_350361 ?auto_350365 ) ) ( not ( = ?auto_350361 ?auto_350366 ) ) ( not ( = ?auto_350361 ?auto_350367 ) ) ( not ( = ?auto_350361 ?auto_350368 ) ) ( not ( = ?auto_350361 ?auto_350369 ) ) ( not ( = ?auto_350361 ?auto_350370 ) ) ( not ( = ?auto_350362 ?auto_350363 ) ) ( not ( = ?auto_350362 ?auto_350364 ) ) ( not ( = ?auto_350362 ?auto_350365 ) ) ( not ( = ?auto_350362 ?auto_350366 ) ) ( not ( = ?auto_350362 ?auto_350367 ) ) ( not ( = ?auto_350362 ?auto_350368 ) ) ( not ( = ?auto_350362 ?auto_350369 ) ) ( not ( = ?auto_350362 ?auto_350370 ) ) ( not ( = ?auto_350363 ?auto_350364 ) ) ( not ( = ?auto_350363 ?auto_350365 ) ) ( not ( = ?auto_350363 ?auto_350366 ) ) ( not ( = ?auto_350363 ?auto_350367 ) ) ( not ( = ?auto_350363 ?auto_350368 ) ) ( not ( = ?auto_350363 ?auto_350369 ) ) ( not ( = ?auto_350363 ?auto_350370 ) ) ( not ( = ?auto_350364 ?auto_350365 ) ) ( not ( = ?auto_350364 ?auto_350366 ) ) ( not ( = ?auto_350364 ?auto_350367 ) ) ( not ( = ?auto_350364 ?auto_350368 ) ) ( not ( = ?auto_350364 ?auto_350369 ) ) ( not ( = ?auto_350364 ?auto_350370 ) ) ( not ( = ?auto_350365 ?auto_350366 ) ) ( not ( = ?auto_350365 ?auto_350367 ) ) ( not ( = ?auto_350365 ?auto_350368 ) ) ( not ( = ?auto_350365 ?auto_350369 ) ) ( not ( = ?auto_350365 ?auto_350370 ) ) ( not ( = ?auto_350366 ?auto_350367 ) ) ( not ( = ?auto_350366 ?auto_350368 ) ) ( not ( = ?auto_350366 ?auto_350369 ) ) ( not ( = ?auto_350366 ?auto_350370 ) ) ( not ( = ?auto_350367 ?auto_350368 ) ) ( not ( = ?auto_350367 ?auto_350369 ) ) ( not ( = ?auto_350367 ?auto_350370 ) ) ( not ( = ?auto_350368 ?auto_350369 ) ) ( not ( = ?auto_350368 ?auto_350370 ) ) ( not ( = ?auto_350369 ?auto_350370 ) ) ( ON ?auto_350368 ?auto_350369 ) ( ON ?auto_350367 ?auto_350368 ) ( ON ?auto_350366 ?auto_350367 ) ( ON ?auto_350365 ?auto_350366 ) ( ON ?auto_350364 ?auto_350365 ) ( ON ?auto_350363 ?auto_350364 ) ( ON ?auto_350362 ?auto_350363 ) ( CLEAR ?auto_350360 ) ( ON ?auto_350361 ?auto_350362 ) ( CLEAR ?auto_350361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_350358 ?auto_350359 ?auto_350360 ?auto_350361 )
      ( MAKE-12PILE ?auto_350358 ?auto_350359 ?auto_350360 ?auto_350361 ?auto_350362 ?auto_350363 ?auto_350364 ?auto_350365 ?auto_350366 ?auto_350367 ?auto_350368 ?auto_350369 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350383 - BLOCK
      ?auto_350384 - BLOCK
      ?auto_350385 - BLOCK
      ?auto_350386 - BLOCK
      ?auto_350387 - BLOCK
      ?auto_350388 - BLOCK
      ?auto_350389 - BLOCK
      ?auto_350390 - BLOCK
      ?auto_350391 - BLOCK
      ?auto_350392 - BLOCK
      ?auto_350393 - BLOCK
      ?auto_350394 - BLOCK
    )
    :vars
    (
      ?auto_350395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350394 ?auto_350395 ) ( ON-TABLE ?auto_350383 ) ( ON ?auto_350384 ?auto_350383 ) ( not ( = ?auto_350383 ?auto_350384 ) ) ( not ( = ?auto_350383 ?auto_350385 ) ) ( not ( = ?auto_350383 ?auto_350386 ) ) ( not ( = ?auto_350383 ?auto_350387 ) ) ( not ( = ?auto_350383 ?auto_350388 ) ) ( not ( = ?auto_350383 ?auto_350389 ) ) ( not ( = ?auto_350383 ?auto_350390 ) ) ( not ( = ?auto_350383 ?auto_350391 ) ) ( not ( = ?auto_350383 ?auto_350392 ) ) ( not ( = ?auto_350383 ?auto_350393 ) ) ( not ( = ?auto_350383 ?auto_350394 ) ) ( not ( = ?auto_350383 ?auto_350395 ) ) ( not ( = ?auto_350384 ?auto_350385 ) ) ( not ( = ?auto_350384 ?auto_350386 ) ) ( not ( = ?auto_350384 ?auto_350387 ) ) ( not ( = ?auto_350384 ?auto_350388 ) ) ( not ( = ?auto_350384 ?auto_350389 ) ) ( not ( = ?auto_350384 ?auto_350390 ) ) ( not ( = ?auto_350384 ?auto_350391 ) ) ( not ( = ?auto_350384 ?auto_350392 ) ) ( not ( = ?auto_350384 ?auto_350393 ) ) ( not ( = ?auto_350384 ?auto_350394 ) ) ( not ( = ?auto_350384 ?auto_350395 ) ) ( not ( = ?auto_350385 ?auto_350386 ) ) ( not ( = ?auto_350385 ?auto_350387 ) ) ( not ( = ?auto_350385 ?auto_350388 ) ) ( not ( = ?auto_350385 ?auto_350389 ) ) ( not ( = ?auto_350385 ?auto_350390 ) ) ( not ( = ?auto_350385 ?auto_350391 ) ) ( not ( = ?auto_350385 ?auto_350392 ) ) ( not ( = ?auto_350385 ?auto_350393 ) ) ( not ( = ?auto_350385 ?auto_350394 ) ) ( not ( = ?auto_350385 ?auto_350395 ) ) ( not ( = ?auto_350386 ?auto_350387 ) ) ( not ( = ?auto_350386 ?auto_350388 ) ) ( not ( = ?auto_350386 ?auto_350389 ) ) ( not ( = ?auto_350386 ?auto_350390 ) ) ( not ( = ?auto_350386 ?auto_350391 ) ) ( not ( = ?auto_350386 ?auto_350392 ) ) ( not ( = ?auto_350386 ?auto_350393 ) ) ( not ( = ?auto_350386 ?auto_350394 ) ) ( not ( = ?auto_350386 ?auto_350395 ) ) ( not ( = ?auto_350387 ?auto_350388 ) ) ( not ( = ?auto_350387 ?auto_350389 ) ) ( not ( = ?auto_350387 ?auto_350390 ) ) ( not ( = ?auto_350387 ?auto_350391 ) ) ( not ( = ?auto_350387 ?auto_350392 ) ) ( not ( = ?auto_350387 ?auto_350393 ) ) ( not ( = ?auto_350387 ?auto_350394 ) ) ( not ( = ?auto_350387 ?auto_350395 ) ) ( not ( = ?auto_350388 ?auto_350389 ) ) ( not ( = ?auto_350388 ?auto_350390 ) ) ( not ( = ?auto_350388 ?auto_350391 ) ) ( not ( = ?auto_350388 ?auto_350392 ) ) ( not ( = ?auto_350388 ?auto_350393 ) ) ( not ( = ?auto_350388 ?auto_350394 ) ) ( not ( = ?auto_350388 ?auto_350395 ) ) ( not ( = ?auto_350389 ?auto_350390 ) ) ( not ( = ?auto_350389 ?auto_350391 ) ) ( not ( = ?auto_350389 ?auto_350392 ) ) ( not ( = ?auto_350389 ?auto_350393 ) ) ( not ( = ?auto_350389 ?auto_350394 ) ) ( not ( = ?auto_350389 ?auto_350395 ) ) ( not ( = ?auto_350390 ?auto_350391 ) ) ( not ( = ?auto_350390 ?auto_350392 ) ) ( not ( = ?auto_350390 ?auto_350393 ) ) ( not ( = ?auto_350390 ?auto_350394 ) ) ( not ( = ?auto_350390 ?auto_350395 ) ) ( not ( = ?auto_350391 ?auto_350392 ) ) ( not ( = ?auto_350391 ?auto_350393 ) ) ( not ( = ?auto_350391 ?auto_350394 ) ) ( not ( = ?auto_350391 ?auto_350395 ) ) ( not ( = ?auto_350392 ?auto_350393 ) ) ( not ( = ?auto_350392 ?auto_350394 ) ) ( not ( = ?auto_350392 ?auto_350395 ) ) ( not ( = ?auto_350393 ?auto_350394 ) ) ( not ( = ?auto_350393 ?auto_350395 ) ) ( not ( = ?auto_350394 ?auto_350395 ) ) ( ON ?auto_350393 ?auto_350394 ) ( ON ?auto_350392 ?auto_350393 ) ( ON ?auto_350391 ?auto_350392 ) ( ON ?auto_350390 ?auto_350391 ) ( ON ?auto_350389 ?auto_350390 ) ( ON ?auto_350388 ?auto_350389 ) ( ON ?auto_350387 ?auto_350388 ) ( ON ?auto_350386 ?auto_350387 ) ( CLEAR ?auto_350384 ) ( ON ?auto_350385 ?auto_350386 ) ( CLEAR ?auto_350385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_350383 ?auto_350384 ?auto_350385 )
      ( MAKE-12PILE ?auto_350383 ?auto_350384 ?auto_350385 ?auto_350386 ?auto_350387 ?auto_350388 ?auto_350389 ?auto_350390 ?auto_350391 ?auto_350392 ?auto_350393 ?auto_350394 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350408 - BLOCK
      ?auto_350409 - BLOCK
      ?auto_350410 - BLOCK
      ?auto_350411 - BLOCK
      ?auto_350412 - BLOCK
      ?auto_350413 - BLOCK
      ?auto_350414 - BLOCK
      ?auto_350415 - BLOCK
      ?auto_350416 - BLOCK
      ?auto_350417 - BLOCK
      ?auto_350418 - BLOCK
      ?auto_350419 - BLOCK
    )
    :vars
    (
      ?auto_350420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350419 ?auto_350420 ) ( ON-TABLE ?auto_350408 ) ( ON ?auto_350409 ?auto_350408 ) ( not ( = ?auto_350408 ?auto_350409 ) ) ( not ( = ?auto_350408 ?auto_350410 ) ) ( not ( = ?auto_350408 ?auto_350411 ) ) ( not ( = ?auto_350408 ?auto_350412 ) ) ( not ( = ?auto_350408 ?auto_350413 ) ) ( not ( = ?auto_350408 ?auto_350414 ) ) ( not ( = ?auto_350408 ?auto_350415 ) ) ( not ( = ?auto_350408 ?auto_350416 ) ) ( not ( = ?auto_350408 ?auto_350417 ) ) ( not ( = ?auto_350408 ?auto_350418 ) ) ( not ( = ?auto_350408 ?auto_350419 ) ) ( not ( = ?auto_350408 ?auto_350420 ) ) ( not ( = ?auto_350409 ?auto_350410 ) ) ( not ( = ?auto_350409 ?auto_350411 ) ) ( not ( = ?auto_350409 ?auto_350412 ) ) ( not ( = ?auto_350409 ?auto_350413 ) ) ( not ( = ?auto_350409 ?auto_350414 ) ) ( not ( = ?auto_350409 ?auto_350415 ) ) ( not ( = ?auto_350409 ?auto_350416 ) ) ( not ( = ?auto_350409 ?auto_350417 ) ) ( not ( = ?auto_350409 ?auto_350418 ) ) ( not ( = ?auto_350409 ?auto_350419 ) ) ( not ( = ?auto_350409 ?auto_350420 ) ) ( not ( = ?auto_350410 ?auto_350411 ) ) ( not ( = ?auto_350410 ?auto_350412 ) ) ( not ( = ?auto_350410 ?auto_350413 ) ) ( not ( = ?auto_350410 ?auto_350414 ) ) ( not ( = ?auto_350410 ?auto_350415 ) ) ( not ( = ?auto_350410 ?auto_350416 ) ) ( not ( = ?auto_350410 ?auto_350417 ) ) ( not ( = ?auto_350410 ?auto_350418 ) ) ( not ( = ?auto_350410 ?auto_350419 ) ) ( not ( = ?auto_350410 ?auto_350420 ) ) ( not ( = ?auto_350411 ?auto_350412 ) ) ( not ( = ?auto_350411 ?auto_350413 ) ) ( not ( = ?auto_350411 ?auto_350414 ) ) ( not ( = ?auto_350411 ?auto_350415 ) ) ( not ( = ?auto_350411 ?auto_350416 ) ) ( not ( = ?auto_350411 ?auto_350417 ) ) ( not ( = ?auto_350411 ?auto_350418 ) ) ( not ( = ?auto_350411 ?auto_350419 ) ) ( not ( = ?auto_350411 ?auto_350420 ) ) ( not ( = ?auto_350412 ?auto_350413 ) ) ( not ( = ?auto_350412 ?auto_350414 ) ) ( not ( = ?auto_350412 ?auto_350415 ) ) ( not ( = ?auto_350412 ?auto_350416 ) ) ( not ( = ?auto_350412 ?auto_350417 ) ) ( not ( = ?auto_350412 ?auto_350418 ) ) ( not ( = ?auto_350412 ?auto_350419 ) ) ( not ( = ?auto_350412 ?auto_350420 ) ) ( not ( = ?auto_350413 ?auto_350414 ) ) ( not ( = ?auto_350413 ?auto_350415 ) ) ( not ( = ?auto_350413 ?auto_350416 ) ) ( not ( = ?auto_350413 ?auto_350417 ) ) ( not ( = ?auto_350413 ?auto_350418 ) ) ( not ( = ?auto_350413 ?auto_350419 ) ) ( not ( = ?auto_350413 ?auto_350420 ) ) ( not ( = ?auto_350414 ?auto_350415 ) ) ( not ( = ?auto_350414 ?auto_350416 ) ) ( not ( = ?auto_350414 ?auto_350417 ) ) ( not ( = ?auto_350414 ?auto_350418 ) ) ( not ( = ?auto_350414 ?auto_350419 ) ) ( not ( = ?auto_350414 ?auto_350420 ) ) ( not ( = ?auto_350415 ?auto_350416 ) ) ( not ( = ?auto_350415 ?auto_350417 ) ) ( not ( = ?auto_350415 ?auto_350418 ) ) ( not ( = ?auto_350415 ?auto_350419 ) ) ( not ( = ?auto_350415 ?auto_350420 ) ) ( not ( = ?auto_350416 ?auto_350417 ) ) ( not ( = ?auto_350416 ?auto_350418 ) ) ( not ( = ?auto_350416 ?auto_350419 ) ) ( not ( = ?auto_350416 ?auto_350420 ) ) ( not ( = ?auto_350417 ?auto_350418 ) ) ( not ( = ?auto_350417 ?auto_350419 ) ) ( not ( = ?auto_350417 ?auto_350420 ) ) ( not ( = ?auto_350418 ?auto_350419 ) ) ( not ( = ?auto_350418 ?auto_350420 ) ) ( not ( = ?auto_350419 ?auto_350420 ) ) ( ON ?auto_350418 ?auto_350419 ) ( ON ?auto_350417 ?auto_350418 ) ( ON ?auto_350416 ?auto_350417 ) ( ON ?auto_350415 ?auto_350416 ) ( ON ?auto_350414 ?auto_350415 ) ( ON ?auto_350413 ?auto_350414 ) ( ON ?auto_350412 ?auto_350413 ) ( ON ?auto_350411 ?auto_350412 ) ( CLEAR ?auto_350409 ) ( ON ?auto_350410 ?auto_350411 ) ( CLEAR ?auto_350410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_350408 ?auto_350409 ?auto_350410 )
      ( MAKE-12PILE ?auto_350408 ?auto_350409 ?auto_350410 ?auto_350411 ?auto_350412 ?auto_350413 ?auto_350414 ?auto_350415 ?auto_350416 ?auto_350417 ?auto_350418 ?auto_350419 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350433 - BLOCK
      ?auto_350434 - BLOCK
      ?auto_350435 - BLOCK
      ?auto_350436 - BLOCK
      ?auto_350437 - BLOCK
      ?auto_350438 - BLOCK
      ?auto_350439 - BLOCK
      ?auto_350440 - BLOCK
      ?auto_350441 - BLOCK
      ?auto_350442 - BLOCK
      ?auto_350443 - BLOCK
      ?auto_350444 - BLOCK
    )
    :vars
    (
      ?auto_350445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350444 ?auto_350445 ) ( ON-TABLE ?auto_350433 ) ( not ( = ?auto_350433 ?auto_350434 ) ) ( not ( = ?auto_350433 ?auto_350435 ) ) ( not ( = ?auto_350433 ?auto_350436 ) ) ( not ( = ?auto_350433 ?auto_350437 ) ) ( not ( = ?auto_350433 ?auto_350438 ) ) ( not ( = ?auto_350433 ?auto_350439 ) ) ( not ( = ?auto_350433 ?auto_350440 ) ) ( not ( = ?auto_350433 ?auto_350441 ) ) ( not ( = ?auto_350433 ?auto_350442 ) ) ( not ( = ?auto_350433 ?auto_350443 ) ) ( not ( = ?auto_350433 ?auto_350444 ) ) ( not ( = ?auto_350433 ?auto_350445 ) ) ( not ( = ?auto_350434 ?auto_350435 ) ) ( not ( = ?auto_350434 ?auto_350436 ) ) ( not ( = ?auto_350434 ?auto_350437 ) ) ( not ( = ?auto_350434 ?auto_350438 ) ) ( not ( = ?auto_350434 ?auto_350439 ) ) ( not ( = ?auto_350434 ?auto_350440 ) ) ( not ( = ?auto_350434 ?auto_350441 ) ) ( not ( = ?auto_350434 ?auto_350442 ) ) ( not ( = ?auto_350434 ?auto_350443 ) ) ( not ( = ?auto_350434 ?auto_350444 ) ) ( not ( = ?auto_350434 ?auto_350445 ) ) ( not ( = ?auto_350435 ?auto_350436 ) ) ( not ( = ?auto_350435 ?auto_350437 ) ) ( not ( = ?auto_350435 ?auto_350438 ) ) ( not ( = ?auto_350435 ?auto_350439 ) ) ( not ( = ?auto_350435 ?auto_350440 ) ) ( not ( = ?auto_350435 ?auto_350441 ) ) ( not ( = ?auto_350435 ?auto_350442 ) ) ( not ( = ?auto_350435 ?auto_350443 ) ) ( not ( = ?auto_350435 ?auto_350444 ) ) ( not ( = ?auto_350435 ?auto_350445 ) ) ( not ( = ?auto_350436 ?auto_350437 ) ) ( not ( = ?auto_350436 ?auto_350438 ) ) ( not ( = ?auto_350436 ?auto_350439 ) ) ( not ( = ?auto_350436 ?auto_350440 ) ) ( not ( = ?auto_350436 ?auto_350441 ) ) ( not ( = ?auto_350436 ?auto_350442 ) ) ( not ( = ?auto_350436 ?auto_350443 ) ) ( not ( = ?auto_350436 ?auto_350444 ) ) ( not ( = ?auto_350436 ?auto_350445 ) ) ( not ( = ?auto_350437 ?auto_350438 ) ) ( not ( = ?auto_350437 ?auto_350439 ) ) ( not ( = ?auto_350437 ?auto_350440 ) ) ( not ( = ?auto_350437 ?auto_350441 ) ) ( not ( = ?auto_350437 ?auto_350442 ) ) ( not ( = ?auto_350437 ?auto_350443 ) ) ( not ( = ?auto_350437 ?auto_350444 ) ) ( not ( = ?auto_350437 ?auto_350445 ) ) ( not ( = ?auto_350438 ?auto_350439 ) ) ( not ( = ?auto_350438 ?auto_350440 ) ) ( not ( = ?auto_350438 ?auto_350441 ) ) ( not ( = ?auto_350438 ?auto_350442 ) ) ( not ( = ?auto_350438 ?auto_350443 ) ) ( not ( = ?auto_350438 ?auto_350444 ) ) ( not ( = ?auto_350438 ?auto_350445 ) ) ( not ( = ?auto_350439 ?auto_350440 ) ) ( not ( = ?auto_350439 ?auto_350441 ) ) ( not ( = ?auto_350439 ?auto_350442 ) ) ( not ( = ?auto_350439 ?auto_350443 ) ) ( not ( = ?auto_350439 ?auto_350444 ) ) ( not ( = ?auto_350439 ?auto_350445 ) ) ( not ( = ?auto_350440 ?auto_350441 ) ) ( not ( = ?auto_350440 ?auto_350442 ) ) ( not ( = ?auto_350440 ?auto_350443 ) ) ( not ( = ?auto_350440 ?auto_350444 ) ) ( not ( = ?auto_350440 ?auto_350445 ) ) ( not ( = ?auto_350441 ?auto_350442 ) ) ( not ( = ?auto_350441 ?auto_350443 ) ) ( not ( = ?auto_350441 ?auto_350444 ) ) ( not ( = ?auto_350441 ?auto_350445 ) ) ( not ( = ?auto_350442 ?auto_350443 ) ) ( not ( = ?auto_350442 ?auto_350444 ) ) ( not ( = ?auto_350442 ?auto_350445 ) ) ( not ( = ?auto_350443 ?auto_350444 ) ) ( not ( = ?auto_350443 ?auto_350445 ) ) ( not ( = ?auto_350444 ?auto_350445 ) ) ( ON ?auto_350443 ?auto_350444 ) ( ON ?auto_350442 ?auto_350443 ) ( ON ?auto_350441 ?auto_350442 ) ( ON ?auto_350440 ?auto_350441 ) ( ON ?auto_350439 ?auto_350440 ) ( ON ?auto_350438 ?auto_350439 ) ( ON ?auto_350437 ?auto_350438 ) ( ON ?auto_350436 ?auto_350437 ) ( ON ?auto_350435 ?auto_350436 ) ( CLEAR ?auto_350433 ) ( ON ?auto_350434 ?auto_350435 ) ( CLEAR ?auto_350434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_350433 ?auto_350434 )
      ( MAKE-12PILE ?auto_350433 ?auto_350434 ?auto_350435 ?auto_350436 ?auto_350437 ?auto_350438 ?auto_350439 ?auto_350440 ?auto_350441 ?auto_350442 ?auto_350443 ?auto_350444 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350458 - BLOCK
      ?auto_350459 - BLOCK
      ?auto_350460 - BLOCK
      ?auto_350461 - BLOCK
      ?auto_350462 - BLOCK
      ?auto_350463 - BLOCK
      ?auto_350464 - BLOCK
      ?auto_350465 - BLOCK
      ?auto_350466 - BLOCK
      ?auto_350467 - BLOCK
      ?auto_350468 - BLOCK
      ?auto_350469 - BLOCK
    )
    :vars
    (
      ?auto_350470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350469 ?auto_350470 ) ( ON-TABLE ?auto_350458 ) ( not ( = ?auto_350458 ?auto_350459 ) ) ( not ( = ?auto_350458 ?auto_350460 ) ) ( not ( = ?auto_350458 ?auto_350461 ) ) ( not ( = ?auto_350458 ?auto_350462 ) ) ( not ( = ?auto_350458 ?auto_350463 ) ) ( not ( = ?auto_350458 ?auto_350464 ) ) ( not ( = ?auto_350458 ?auto_350465 ) ) ( not ( = ?auto_350458 ?auto_350466 ) ) ( not ( = ?auto_350458 ?auto_350467 ) ) ( not ( = ?auto_350458 ?auto_350468 ) ) ( not ( = ?auto_350458 ?auto_350469 ) ) ( not ( = ?auto_350458 ?auto_350470 ) ) ( not ( = ?auto_350459 ?auto_350460 ) ) ( not ( = ?auto_350459 ?auto_350461 ) ) ( not ( = ?auto_350459 ?auto_350462 ) ) ( not ( = ?auto_350459 ?auto_350463 ) ) ( not ( = ?auto_350459 ?auto_350464 ) ) ( not ( = ?auto_350459 ?auto_350465 ) ) ( not ( = ?auto_350459 ?auto_350466 ) ) ( not ( = ?auto_350459 ?auto_350467 ) ) ( not ( = ?auto_350459 ?auto_350468 ) ) ( not ( = ?auto_350459 ?auto_350469 ) ) ( not ( = ?auto_350459 ?auto_350470 ) ) ( not ( = ?auto_350460 ?auto_350461 ) ) ( not ( = ?auto_350460 ?auto_350462 ) ) ( not ( = ?auto_350460 ?auto_350463 ) ) ( not ( = ?auto_350460 ?auto_350464 ) ) ( not ( = ?auto_350460 ?auto_350465 ) ) ( not ( = ?auto_350460 ?auto_350466 ) ) ( not ( = ?auto_350460 ?auto_350467 ) ) ( not ( = ?auto_350460 ?auto_350468 ) ) ( not ( = ?auto_350460 ?auto_350469 ) ) ( not ( = ?auto_350460 ?auto_350470 ) ) ( not ( = ?auto_350461 ?auto_350462 ) ) ( not ( = ?auto_350461 ?auto_350463 ) ) ( not ( = ?auto_350461 ?auto_350464 ) ) ( not ( = ?auto_350461 ?auto_350465 ) ) ( not ( = ?auto_350461 ?auto_350466 ) ) ( not ( = ?auto_350461 ?auto_350467 ) ) ( not ( = ?auto_350461 ?auto_350468 ) ) ( not ( = ?auto_350461 ?auto_350469 ) ) ( not ( = ?auto_350461 ?auto_350470 ) ) ( not ( = ?auto_350462 ?auto_350463 ) ) ( not ( = ?auto_350462 ?auto_350464 ) ) ( not ( = ?auto_350462 ?auto_350465 ) ) ( not ( = ?auto_350462 ?auto_350466 ) ) ( not ( = ?auto_350462 ?auto_350467 ) ) ( not ( = ?auto_350462 ?auto_350468 ) ) ( not ( = ?auto_350462 ?auto_350469 ) ) ( not ( = ?auto_350462 ?auto_350470 ) ) ( not ( = ?auto_350463 ?auto_350464 ) ) ( not ( = ?auto_350463 ?auto_350465 ) ) ( not ( = ?auto_350463 ?auto_350466 ) ) ( not ( = ?auto_350463 ?auto_350467 ) ) ( not ( = ?auto_350463 ?auto_350468 ) ) ( not ( = ?auto_350463 ?auto_350469 ) ) ( not ( = ?auto_350463 ?auto_350470 ) ) ( not ( = ?auto_350464 ?auto_350465 ) ) ( not ( = ?auto_350464 ?auto_350466 ) ) ( not ( = ?auto_350464 ?auto_350467 ) ) ( not ( = ?auto_350464 ?auto_350468 ) ) ( not ( = ?auto_350464 ?auto_350469 ) ) ( not ( = ?auto_350464 ?auto_350470 ) ) ( not ( = ?auto_350465 ?auto_350466 ) ) ( not ( = ?auto_350465 ?auto_350467 ) ) ( not ( = ?auto_350465 ?auto_350468 ) ) ( not ( = ?auto_350465 ?auto_350469 ) ) ( not ( = ?auto_350465 ?auto_350470 ) ) ( not ( = ?auto_350466 ?auto_350467 ) ) ( not ( = ?auto_350466 ?auto_350468 ) ) ( not ( = ?auto_350466 ?auto_350469 ) ) ( not ( = ?auto_350466 ?auto_350470 ) ) ( not ( = ?auto_350467 ?auto_350468 ) ) ( not ( = ?auto_350467 ?auto_350469 ) ) ( not ( = ?auto_350467 ?auto_350470 ) ) ( not ( = ?auto_350468 ?auto_350469 ) ) ( not ( = ?auto_350468 ?auto_350470 ) ) ( not ( = ?auto_350469 ?auto_350470 ) ) ( ON ?auto_350468 ?auto_350469 ) ( ON ?auto_350467 ?auto_350468 ) ( ON ?auto_350466 ?auto_350467 ) ( ON ?auto_350465 ?auto_350466 ) ( ON ?auto_350464 ?auto_350465 ) ( ON ?auto_350463 ?auto_350464 ) ( ON ?auto_350462 ?auto_350463 ) ( ON ?auto_350461 ?auto_350462 ) ( ON ?auto_350460 ?auto_350461 ) ( CLEAR ?auto_350458 ) ( ON ?auto_350459 ?auto_350460 ) ( CLEAR ?auto_350459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_350458 ?auto_350459 )
      ( MAKE-12PILE ?auto_350458 ?auto_350459 ?auto_350460 ?auto_350461 ?auto_350462 ?auto_350463 ?auto_350464 ?auto_350465 ?auto_350466 ?auto_350467 ?auto_350468 ?auto_350469 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350483 - BLOCK
      ?auto_350484 - BLOCK
      ?auto_350485 - BLOCK
      ?auto_350486 - BLOCK
      ?auto_350487 - BLOCK
      ?auto_350488 - BLOCK
      ?auto_350489 - BLOCK
      ?auto_350490 - BLOCK
      ?auto_350491 - BLOCK
      ?auto_350492 - BLOCK
      ?auto_350493 - BLOCK
      ?auto_350494 - BLOCK
    )
    :vars
    (
      ?auto_350495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350494 ?auto_350495 ) ( not ( = ?auto_350483 ?auto_350484 ) ) ( not ( = ?auto_350483 ?auto_350485 ) ) ( not ( = ?auto_350483 ?auto_350486 ) ) ( not ( = ?auto_350483 ?auto_350487 ) ) ( not ( = ?auto_350483 ?auto_350488 ) ) ( not ( = ?auto_350483 ?auto_350489 ) ) ( not ( = ?auto_350483 ?auto_350490 ) ) ( not ( = ?auto_350483 ?auto_350491 ) ) ( not ( = ?auto_350483 ?auto_350492 ) ) ( not ( = ?auto_350483 ?auto_350493 ) ) ( not ( = ?auto_350483 ?auto_350494 ) ) ( not ( = ?auto_350483 ?auto_350495 ) ) ( not ( = ?auto_350484 ?auto_350485 ) ) ( not ( = ?auto_350484 ?auto_350486 ) ) ( not ( = ?auto_350484 ?auto_350487 ) ) ( not ( = ?auto_350484 ?auto_350488 ) ) ( not ( = ?auto_350484 ?auto_350489 ) ) ( not ( = ?auto_350484 ?auto_350490 ) ) ( not ( = ?auto_350484 ?auto_350491 ) ) ( not ( = ?auto_350484 ?auto_350492 ) ) ( not ( = ?auto_350484 ?auto_350493 ) ) ( not ( = ?auto_350484 ?auto_350494 ) ) ( not ( = ?auto_350484 ?auto_350495 ) ) ( not ( = ?auto_350485 ?auto_350486 ) ) ( not ( = ?auto_350485 ?auto_350487 ) ) ( not ( = ?auto_350485 ?auto_350488 ) ) ( not ( = ?auto_350485 ?auto_350489 ) ) ( not ( = ?auto_350485 ?auto_350490 ) ) ( not ( = ?auto_350485 ?auto_350491 ) ) ( not ( = ?auto_350485 ?auto_350492 ) ) ( not ( = ?auto_350485 ?auto_350493 ) ) ( not ( = ?auto_350485 ?auto_350494 ) ) ( not ( = ?auto_350485 ?auto_350495 ) ) ( not ( = ?auto_350486 ?auto_350487 ) ) ( not ( = ?auto_350486 ?auto_350488 ) ) ( not ( = ?auto_350486 ?auto_350489 ) ) ( not ( = ?auto_350486 ?auto_350490 ) ) ( not ( = ?auto_350486 ?auto_350491 ) ) ( not ( = ?auto_350486 ?auto_350492 ) ) ( not ( = ?auto_350486 ?auto_350493 ) ) ( not ( = ?auto_350486 ?auto_350494 ) ) ( not ( = ?auto_350486 ?auto_350495 ) ) ( not ( = ?auto_350487 ?auto_350488 ) ) ( not ( = ?auto_350487 ?auto_350489 ) ) ( not ( = ?auto_350487 ?auto_350490 ) ) ( not ( = ?auto_350487 ?auto_350491 ) ) ( not ( = ?auto_350487 ?auto_350492 ) ) ( not ( = ?auto_350487 ?auto_350493 ) ) ( not ( = ?auto_350487 ?auto_350494 ) ) ( not ( = ?auto_350487 ?auto_350495 ) ) ( not ( = ?auto_350488 ?auto_350489 ) ) ( not ( = ?auto_350488 ?auto_350490 ) ) ( not ( = ?auto_350488 ?auto_350491 ) ) ( not ( = ?auto_350488 ?auto_350492 ) ) ( not ( = ?auto_350488 ?auto_350493 ) ) ( not ( = ?auto_350488 ?auto_350494 ) ) ( not ( = ?auto_350488 ?auto_350495 ) ) ( not ( = ?auto_350489 ?auto_350490 ) ) ( not ( = ?auto_350489 ?auto_350491 ) ) ( not ( = ?auto_350489 ?auto_350492 ) ) ( not ( = ?auto_350489 ?auto_350493 ) ) ( not ( = ?auto_350489 ?auto_350494 ) ) ( not ( = ?auto_350489 ?auto_350495 ) ) ( not ( = ?auto_350490 ?auto_350491 ) ) ( not ( = ?auto_350490 ?auto_350492 ) ) ( not ( = ?auto_350490 ?auto_350493 ) ) ( not ( = ?auto_350490 ?auto_350494 ) ) ( not ( = ?auto_350490 ?auto_350495 ) ) ( not ( = ?auto_350491 ?auto_350492 ) ) ( not ( = ?auto_350491 ?auto_350493 ) ) ( not ( = ?auto_350491 ?auto_350494 ) ) ( not ( = ?auto_350491 ?auto_350495 ) ) ( not ( = ?auto_350492 ?auto_350493 ) ) ( not ( = ?auto_350492 ?auto_350494 ) ) ( not ( = ?auto_350492 ?auto_350495 ) ) ( not ( = ?auto_350493 ?auto_350494 ) ) ( not ( = ?auto_350493 ?auto_350495 ) ) ( not ( = ?auto_350494 ?auto_350495 ) ) ( ON ?auto_350493 ?auto_350494 ) ( ON ?auto_350492 ?auto_350493 ) ( ON ?auto_350491 ?auto_350492 ) ( ON ?auto_350490 ?auto_350491 ) ( ON ?auto_350489 ?auto_350490 ) ( ON ?auto_350488 ?auto_350489 ) ( ON ?auto_350487 ?auto_350488 ) ( ON ?auto_350486 ?auto_350487 ) ( ON ?auto_350485 ?auto_350486 ) ( ON ?auto_350484 ?auto_350485 ) ( ON ?auto_350483 ?auto_350484 ) ( CLEAR ?auto_350483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_350483 )
      ( MAKE-12PILE ?auto_350483 ?auto_350484 ?auto_350485 ?auto_350486 ?auto_350487 ?auto_350488 ?auto_350489 ?auto_350490 ?auto_350491 ?auto_350492 ?auto_350493 ?auto_350494 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_350508 - BLOCK
      ?auto_350509 - BLOCK
      ?auto_350510 - BLOCK
      ?auto_350511 - BLOCK
      ?auto_350512 - BLOCK
      ?auto_350513 - BLOCK
      ?auto_350514 - BLOCK
      ?auto_350515 - BLOCK
      ?auto_350516 - BLOCK
      ?auto_350517 - BLOCK
      ?auto_350518 - BLOCK
      ?auto_350519 - BLOCK
    )
    :vars
    (
      ?auto_350520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350519 ?auto_350520 ) ( not ( = ?auto_350508 ?auto_350509 ) ) ( not ( = ?auto_350508 ?auto_350510 ) ) ( not ( = ?auto_350508 ?auto_350511 ) ) ( not ( = ?auto_350508 ?auto_350512 ) ) ( not ( = ?auto_350508 ?auto_350513 ) ) ( not ( = ?auto_350508 ?auto_350514 ) ) ( not ( = ?auto_350508 ?auto_350515 ) ) ( not ( = ?auto_350508 ?auto_350516 ) ) ( not ( = ?auto_350508 ?auto_350517 ) ) ( not ( = ?auto_350508 ?auto_350518 ) ) ( not ( = ?auto_350508 ?auto_350519 ) ) ( not ( = ?auto_350508 ?auto_350520 ) ) ( not ( = ?auto_350509 ?auto_350510 ) ) ( not ( = ?auto_350509 ?auto_350511 ) ) ( not ( = ?auto_350509 ?auto_350512 ) ) ( not ( = ?auto_350509 ?auto_350513 ) ) ( not ( = ?auto_350509 ?auto_350514 ) ) ( not ( = ?auto_350509 ?auto_350515 ) ) ( not ( = ?auto_350509 ?auto_350516 ) ) ( not ( = ?auto_350509 ?auto_350517 ) ) ( not ( = ?auto_350509 ?auto_350518 ) ) ( not ( = ?auto_350509 ?auto_350519 ) ) ( not ( = ?auto_350509 ?auto_350520 ) ) ( not ( = ?auto_350510 ?auto_350511 ) ) ( not ( = ?auto_350510 ?auto_350512 ) ) ( not ( = ?auto_350510 ?auto_350513 ) ) ( not ( = ?auto_350510 ?auto_350514 ) ) ( not ( = ?auto_350510 ?auto_350515 ) ) ( not ( = ?auto_350510 ?auto_350516 ) ) ( not ( = ?auto_350510 ?auto_350517 ) ) ( not ( = ?auto_350510 ?auto_350518 ) ) ( not ( = ?auto_350510 ?auto_350519 ) ) ( not ( = ?auto_350510 ?auto_350520 ) ) ( not ( = ?auto_350511 ?auto_350512 ) ) ( not ( = ?auto_350511 ?auto_350513 ) ) ( not ( = ?auto_350511 ?auto_350514 ) ) ( not ( = ?auto_350511 ?auto_350515 ) ) ( not ( = ?auto_350511 ?auto_350516 ) ) ( not ( = ?auto_350511 ?auto_350517 ) ) ( not ( = ?auto_350511 ?auto_350518 ) ) ( not ( = ?auto_350511 ?auto_350519 ) ) ( not ( = ?auto_350511 ?auto_350520 ) ) ( not ( = ?auto_350512 ?auto_350513 ) ) ( not ( = ?auto_350512 ?auto_350514 ) ) ( not ( = ?auto_350512 ?auto_350515 ) ) ( not ( = ?auto_350512 ?auto_350516 ) ) ( not ( = ?auto_350512 ?auto_350517 ) ) ( not ( = ?auto_350512 ?auto_350518 ) ) ( not ( = ?auto_350512 ?auto_350519 ) ) ( not ( = ?auto_350512 ?auto_350520 ) ) ( not ( = ?auto_350513 ?auto_350514 ) ) ( not ( = ?auto_350513 ?auto_350515 ) ) ( not ( = ?auto_350513 ?auto_350516 ) ) ( not ( = ?auto_350513 ?auto_350517 ) ) ( not ( = ?auto_350513 ?auto_350518 ) ) ( not ( = ?auto_350513 ?auto_350519 ) ) ( not ( = ?auto_350513 ?auto_350520 ) ) ( not ( = ?auto_350514 ?auto_350515 ) ) ( not ( = ?auto_350514 ?auto_350516 ) ) ( not ( = ?auto_350514 ?auto_350517 ) ) ( not ( = ?auto_350514 ?auto_350518 ) ) ( not ( = ?auto_350514 ?auto_350519 ) ) ( not ( = ?auto_350514 ?auto_350520 ) ) ( not ( = ?auto_350515 ?auto_350516 ) ) ( not ( = ?auto_350515 ?auto_350517 ) ) ( not ( = ?auto_350515 ?auto_350518 ) ) ( not ( = ?auto_350515 ?auto_350519 ) ) ( not ( = ?auto_350515 ?auto_350520 ) ) ( not ( = ?auto_350516 ?auto_350517 ) ) ( not ( = ?auto_350516 ?auto_350518 ) ) ( not ( = ?auto_350516 ?auto_350519 ) ) ( not ( = ?auto_350516 ?auto_350520 ) ) ( not ( = ?auto_350517 ?auto_350518 ) ) ( not ( = ?auto_350517 ?auto_350519 ) ) ( not ( = ?auto_350517 ?auto_350520 ) ) ( not ( = ?auto_350518 ?auto_350519 ) ) ( not ( = ?auto_350518 ?auto_350520 ) ) ( not ( = ?auto_350519 ?auto_350520 ) ) ( ON ?auto_350518 ?auto_350519 ) ( ON ?auto_350517 ?auto_350518 ) ( ON ?auto_350516 ?auto_350517 ) ( ON ?auto_350515 ?auto_350516 ) ( ON ?auto_350514 ?auto_350515 ) ( ON ?auto_350513 ?auto_350514 ) ( ON ?auto_350512 ?auto_350513 ) ( ON ?auto_350511 ?auto_350512 ) ( ON ?auto_350510 ?auto_350511 ) ( ON ?auto_350509 ?auto_350510 ) ( ON ?auto_350508 ?auto_350509 ) ( CLEAR ?auto_350508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_350508 )
      ( MAKE-12PILE ?auto_350508 ?auto_350509 ?auto_350510 ?auto_350511 ?auto_350512 ?auto_350513 ?auto_350514 ?auto_350515 ?auto_350516 ?auto_350517 ?auto_350518 ?auto_350519 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350534 - BLOCK
      ?auto_350535 - BLOCK
      ?auto_350536 - BLOCK
      ?auto_350537 - BLOCK
      ?auto_350538 - BLOCK
      ?auto_350539 - BLOCK
      ?auto_350540 - BLOCK
      ?auto_350541 - BLOCK
      ?auto_350542 - BLOCK
      ?auto_350543 - BLOCK
      ?auto_350544 - BLOCK
      ?auto_350545 - BLOCK
      ?auto_350546 - BLOCK
    )
    :vars
    (
      ?auto_350547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_350545 ) ( ON ?auto_350546 ?auto_350547 ) ( CLEAR ?auto_350546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_350534 ) ( ON ?auto_350535 ?auto_350534 ) ( ON ?auto_350536 ?auto_350535 ) ( ON ?auto_350537 ?auto_350536 ) ( ON ?auto_350538 ?auto_350537 ) ( ON ?auto_350539 ?auto_350538 ) ( ON ?auto_350540 ?auto_350539 ) ( ON ?auto_350541 ?auto_350540 ) ( ON ?auto_350542 ?auto_350541 ) ( ON ?auto_350543 ?auto_350542 ) ( ON ?auto_350544 ?auto_350543 ) ( ON ?auto_350545 ?auto_350544 ) ( not ( = ?auto_350534 ?auto_350535 ) ) ( not ( = ?auto_350534 ?auto_350536 ) ) ( not ( = ?auto_350534 ?auto_350537 ) ) ( not ( = ?auto_350534 ?auto_350538 ) ) ( not ( = ?auto_350534 ?auto_350539 ) ) ( not ( = ?auto_350534 ?auto_350540 ) ) ( not ( = ?auto_350534 ?auto_350541 ) ) ( not ( = ?auto_350534 ?auto_350542 ) ) ( not ( = ?auto_350534 ?auto_350543 ) ) ( not ( = ?auto_350534 ?auto_350544 ) ) ( not ( = ?auto_350534 ?auto_350545 ) ) ( not ( = ?auto_350534 ?auto_350546 ) ) ( not ( = ?auto_350534 ?auto_350547 ) ) ( not ( = ?auto_350535 ?auto_350536 ) ) ( not ( = ?auto_350535 ?auto_350537 ) ) ( not ( = ?auto_350535 ?auto_350538 ) ) ( not ( = ?auto_350535 ?auto_350539 ) ) ( not ( = ?auto_350535 ?auto_350540 ) ) ( not ( = ?auto_350535 ?auto_350541 ) ) ( not ( = ?auto_350535 ?auto_350542 ) ) ( not ( = ?auto_350535 ?auto_350543 ) ) ( not ( = ?auto_350535 ?auto_350544 ) ) ( not ( = ?auto_350535 ?auto_350545 ) ) ( not ( = ?auto_350535 ?auto_350546 ) ) ( not ( = ?auto_350535 ?auto_350547 ) ) ( not ( = ?auto_350536 ?auto_350537 ) ) ( not ( = ?auto_350536 ?auto_350538 ) ) ( not ( = ?auto_350536 ?auto_350539 ) ) ( not ( = ?auto_350536 ?auto_350540 ) ) ( not ( = ?auto_350536 ?auto_350541 ) ) ( not ( = ?auto_350536 ?auto_350542 ) ) ( not ( = ?auto_350536 ?auto_350543 ) ) ( not ( = ?auto_350536 ?auto_350544 ) ) ( not ( = ?auto_350536 ?auto_350545 ) ) ( not ( = ?auto_350536 ?auto_350546 ) ) ( not ( = ?auto_350536 ?auto_350547 ) ) ( not ( = ?auto_350537 ?auto_350538 ) ) ( not ( = ?auto_350537 ?auto_350539 ) ) ( not ( = ?auto_350537 ?auto_350540 ) ) ( not ( = ?auto_350537 ?auto_350541 ) ) ( not ( = ?auto_350537 ?auto_350542 ) ) ( not ( = ?auto_350537 ?auto_350543 ) ) ( not ( = ?auto_350537 ?auto_350544 ) ) ( not ( = ?auto_350537 ?auto_350545 ) ) ( not ( = ?auto_350537 ?auto_350546 ) ) ( not ( = ?auto_350537 ?auto_350547 ) ) ( not ( = ?auto_350538 ?auto_350539 ) ) ( not ( = ?auto_350538 ?auto_350540 ) ) ( not ( = ?auto_350538 ?auto_350541 ) ) ( not ( = ?auto_350538 ?auto_350542 ) ) ( not ( = ?auto_350538 ?auto_350543 ) ) ( not ( = ?auto_350538 ?auto_350544 ) ) ( not ( = ?auto_350538 ?auto_350545 ) ) ( not ( = ?auto_350538 ?auto_350546 ) ) ( not ( = ?auto_350538 ?auto_350547 ) ) ( not ( = ?auto_350539 ?auto_350540 ) ) ( not ( = ?auto_350539 ?auto_350541 ) ) ( not ( = ?auto_350539 ?auto_350542 ) ) ( not ( = ?auto_350539 ?auto_350543 ) ) ( not ( = ?auto_350539 ?auto_350544 ) ) ( not ( = ?auto_350539 ?auto_350545 ) ) ( not ( = ?auto_350539 ?auto_350546 ) ) ( not ( = ?auto_350539 ?auto_350547 ) ) ( not ( = ?auto_350540 ?auto_350541 ) ) ( not ( = ?auto_350540 ?auto_350542 ) ) ( not ( = ?auto_350540 ?auto_350543 ) ) ( not ( = ?auto_350540 ?auto_350544 ) ) ( not ( = ?auto_350540 ?auto_350545 ) ) ( not ( = ?auto_350540 ?auto_350546 ) ) ( not ( = ?auto_350540 ?auto_350547 ) ) ( not ( = ?auto_350541 ?auto_350542 ) ) ( not ( = ?auto_350541 ?auto_350543 ) ) ( not ( = ?auto_350541 ?auto_350544 ) ) ( not ( = ?auto_350541 ?auto_350545 ) ) ( not ( = ?auto_350541 ?auto_350546 ) ) ( not ( = ?auto_350541 ?auto_350547 ) ) ( not ( = ?auto_350542 ?auto_350543 ) ) ( not ( = ?auto_350542 ?auto_350544 ) ) ( not ( = ?auto_350542 ?auto_350545 ) ) ( not ( = ?auto_350542 ?auto_350546 ) ) ( not ( = ?auto_350542 ?auto_350547 ) ) ( not ( = ?auto_350543 ?auto_350544 ) ) ( not ( = ?auto_350543 ?auto_350545 ) ) ( not ( = ?auto_350543 ?auto_350546 ) ) ( not ( = ?auto_350543 ?auto_350547 ) ) ( not ( = ?auto_350544 ?auto_350545 ) ) ( not ( = ?auto_350544 ?auto_350546 ) ) ( not ( = ?auto_350544 ?auto_350547 ) ) ( not ( = ?auto_350545 ?auto_350546 ) ) ( not ( = ?auto_350545 ?auto_350547 ) ) ( not ( = ?auto_350546 ?auto_350547 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_350546 ?auto_350547 )
      ( !STACK ?auto_350546 ?auto_350545 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350561 - BLOCK
      ?auto_350562 - BLOCK
      ?auto_350563 - BLOCK
      ?auto_350564 - BLOCK
      ?auto_350565 - BLOCK
      ?auto_350566 - BLOCK
      ?auto_350567 - BLOCK
      ?auto_350568 - BLOCK
      ?auto_350569 - BLOCK
      ?auto_350570 - BLOCK
      ?auto_350571 - BLOCK
      ?auto_350572 - BLOCK
      ?auto_350573 - BLOCK
    )
    :vars
    (
      ?auto_350574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_350572 ) ( ON ?auto_350573 ?auto_350574 ) ( CLEAR ?auto_350573 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_350561 ) ( ON ?auto_350562 ?auto_350561 ) ( ON ?auto_350563 ?auto_350562 ) ( ON ?auto_350564 ?auto_350563 ) ( ON ?auto_350565 ?auto_350564 ) ( ON ?auto_350566 ?auto_350565 ) ( ON ?auto_350567 ?auto_350566 ) ( ON ?auto_350568 ?auto_350567 ) ( ON ?auto_350569 ?auto_350568 ) ( ON ?auto_350570 ?auto_350569 ) ( ON ?auto_350571 ?auto_350570 ) ( ON ?auto_350572 ?auto_350571 ) ( not ( = ?auto_350561 ?auto_350562 ) ) ( not ( = ?auto_350561 ?auto_350563 ) ) ( not ( = ?auto_350561 ?auto_350564 ) ) ( not ( = ?auto_350561 ?auto_350565 ) ) ( not ( = ?auto_350561 ?auto_350566 ) ) ( not ( = ?auto_350561 ?auto_350567 ) ) ( not ( = ?auto_350561 ?auto_350568 ) ) ( not ( = ?auto_350561 ?auto_350569 ) ) ( not ( = ?auto_350561 ?auto_350570 ) ) ( not ( = ?auto_350561 ?auto_350571 ) ) ( not ( = ?auto_350561 ?auto_350572 ) ) ( not ( = ?auto_350561 ?auto_350573 ) ) ( not ( = ?auto_350561 ?auto_350574 ) ) ( not ( = ?auto_350562 ?auto_350563 ) ) ( not ( = ?auto_350562 ?auto_350564 ) ) ( not ( = ?auto_350562 ?auto_350565 ) ) ( not ( = ?auto_350562 ?auto_350566 ) ) ( not ( = ?auto_350562 ?auto_350567 ) ) ( not ( = ?auto_350562 ?auto_350568 ) ) ( not ( = ?auto_350562 ?auto_350569 ) ) ( not ( = ?auto_350562 ?auto_350570 ) ) ( not ( = ?auto_350562 ?auto_350571 ) ) ( not ( = ?auto_350562 ?auto_350572 ) ) ( not ( = ?auto_350562 ?auto_350573 ) ) ( not ( = ?auto_350562 ?auto_350574 ) ) ( not ( = ?auto_350563 ?auto_350564 ) ) ( not ( = ?auto_350563 ?auto_350565 ) ) ( not ( = ?auto_350563 ?auto_350566 ) ) ( not ( = ?auto_350563 ?auto_350567 ) ) ( not ( = ?auto_350563 ?auto_350568 ) ) ( not ( = ?auto_350563 ?auto_350569 ) ) ( not ( = ?auto_350563 ?auto_350570 ) ) ( not ( = ?auto_350563 ?auto_350571 ) ) ( not ( = ?auto_350563 ?auto_350572 ) ) ( not ( = ?auto_350563 ?auto_350573 ) ) ( not ( = ?auto_350563 ?auto_350574 ) ) ( not ( = ?auto_350564 ?auto_350565 ) ) ( not ( = ?auto_350564 ?auto_350566 ) ) ( not ( = ?auto_350564 ?auto_350567 ) ) ( not ( = ?auto_350564 ?auto_350568 ) ) ( not ( = ?auto_350564 ?auto_350569 ) ) ( not ( = ?auto_350564 ?auto_350570 ) ) ( not ( = ?auto_350564 ?auto_350571 ) ) ( not ( = ?auto_350564 ?auto_350572 ) ) ( not ( = ?auto_350564 ?auto_350573 ) ) ( not ( = ?auto_350564 ?auto_350574 ) ) ( not ( = ?auto_350565 ?auto_350566 ) ) ( not ( = ?auto_350565 ?auto_350567 ) ) ( not ( = ?auto_350565 ?auto_350568 ) ) ( not ( = ?auto_350565 ?auto_350569 ) ) ( not ( = ?auto_350565 ?auto_350570 ) ) ( not ( = ?auto_350565 ?auto_350571 ) ) ( not ( = ?auto_350565 ?auto_350572 ) ) ( not ( = ?auto_350565 ?auto_350573 ) ) ( not ( = ?auto_350565 ?auto_350574 ) ) ( not ( = ?auto_350566 ?auto_350567 ) ) ( not ( = ?auto_350566 ?auto_350568 ) ) ( not ( = ?auto_350566 ?auto_350569 ) ) ( not ( = ?auto_350566 ?auto_350570 ) ) ( not ( = ?auto_350566 ?auto_350571 ) ) ( not ( = ?auto_350566 ?auto_350572 ) ) ( not ( = ?auto_350566 ?auto_350573 ) ) ( not ( = ?auto_350566 ?auto_350574 ) ) ( not ( = ?auto_350567 ?auto_350568 ) ) ( not ( = ?auto_350567 ?auto_350569 ) ) ( not ( = ?auto_350567 ?auto_350570 ) ) ( not ( = ?auto_350567 ?auto_350571 ) ) ( not ( = ?auto_350567 ?auto_350572 ) ) ( not ( = ?auto_350567 ?auto_350573 ) ) ( not ( = ?auto_350567 ?auto_350574 ) ) ( not ( = ?auto_350568 ?auto_350569 ) ) ( not ( = ?auto_350568 ?auto_350570 ) ) ( not ( = ?auto_350568 ?auto_350571 ) ) ( not ( = ?auto_350568 ?auto_350572 ) ) ( not ( = ?auto_350568 ?auto_350573 ) ) ( not ( = ?auto_350568 ?auto_350574 ) ) ( not ( = ?auto_350569 ?auto_350570 ) ) ( not ( = ?auto_350569 ?auto_350571 ) ) ( not ( = ?auto_350569 ?auto_350572 ) ) ( not ( = ?auto_350569 ?auto_350573 ) ) ( not ( = ?auto_350569 ?auto_350574 ) ) ( not ( = ?auto_350570 ?auto_350571 ) ) ( not ( = ?auto_350570 ?auto_350572 ) ) ( not ( = ?auto_350570 ?auto_350573 ) ) ( not ( = ?auto_350570 ?auto_350574 ) ) ( not ( = ?auto_350571 ?auto_350572 ) ) ( not ( = ?auto_350571 ?auto_350573 ) ) ( not ( = ?auto_350571 ?auto_350574 ) ) ( not ( = ?auto_350572 ?auto_350573 ) ) ( not ( = ?auto_350572 ?auto_350574 ) ) ( not ( = ?auto_350573 ?auto_350574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_350573 ?auto_350574 )
      ( !STACK ?auto_350573 ?auto_350572 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350588 - BLOCK
      ?auto_350589 - BLOCK
      ?auto_350590 - BLOCK
      ?auto_350591 - BLOCK
      ?auto_350592 - BLOCK
      ?auto_350593 - BLOCK
      ?auto_350594 - BLOCK
      ?auto_350595 - BLOCK
      ?auto_350596 - BLOCK
      ?auto_350597 - BLOCK
      ?auto_350598 - BLOCK
      ?auto_350599 - BLOCK
      ?auto_350600 - BLOCK
    )
    :vars
    (
      ?auto_350601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350600 ?auto_350601 ) ( ON-TABLE ?auto_350588 ) ( ON ?auto_350589 ?auto_350588 ) ( ON ?auto_350590 ?auto_350589 ) ( ON ?auto_350591 ?auto_350590 ) ( ON ?auto_350592 ?auto_350591 ) ( ON ?auto_350593 ?auto_350592 ) ( ON ?auto_350594 ?auto_350593 ) ( ON ?auto_350595 ?auto_350594 ) ( ON ?auto_350596 ?auto_350595 ) ( ON ?auto_350597 ?auto_350596 ) ( ON ?auto_350598 ?auto_350597 ) ( not ( = ?auto_350588 ?auto_350589 ) ) ( not ( = ?auto_350588 ?auto_350590 ) ) ( not ( = ?auto_350588 ?auto_350591 ) ) ( not ( = ?auto_350588 ?auto_350592 ) ) ( not ( = ?auto_350588 ?auto_350593 ) ) ( not ( = ?auto_350588 ?auto_350594 ) ) ( not ( = ?auto_350588 ?auto_350595 ) ) ( not ( = ?auto_350588 ?auto_350596 ) ) ( not ( = ?auto_350588 ?auto_350597 ) ) ( not ( = ?auto_350588 ?auto_350598 ) ) ( not ( = ?auto_350588 ?auto_350599 ) ) ( not ( = ?auto_350588 ?auto_350600 ) ) ( not ( = ?auto_350588 ?auto_350601 ) ) ( not ( = ?auto_350589 ?auto_350590 ) ) ( not ( = ?auto_350589 ?auto_350591 ) ) ( not ( = ?auto_350589 ?auto_350592 ) ) ( not ( = ?auto_350589 ?auto_350593 ) ) ( not ( = ?auto_350589 ?auto_350594 ) ) ( not ( = ?auto_350589 ?auto_350595 ) ) ( not ( = ?auto_350589 ?auto_350596 ) ) ( not ( = ?auto_350589 ?auto_350597 ) ) ( not ( = ?auto_350589 ?auto_350598 ) ) ( not ( = ?auto_350589 ?auto_350599 ) ) ( not ( = ?auto_350589 ?auto_350600 ) ) ( not ( = ?auto_350589 ?auto_350601 ) ) ( not ( = ?auto_350590 ?auto_350591 ) ) ( not ( = ?auto_350590 ?auto_350592 ) ) ( not ( = ?auto_350590 ?auto_350593 ) ) ( not ( = ?auto_350590 ?auto_350594 ) ) ( not ( = ?auto_350590 ?auto_350595 ) ) ( not ( = ?auto_350590 ?auto_350596 ) ) ( not ( = ?auto_350590 ?auto_350597 ) ) ( not ( = ?auto_350590 ?auto_350598 ) ) ( not ( = ?auto_350590 ?auto_350599 ) ) ( not ( = ?auto_350590 ?auto_350600 ) ) ( not ( = ?auto_350590 ?auto_350601 ) ) ( not ( = ?auto_350591 ?auto_350592 ) ) ( not ( = ?auto_350591 ?auto_350593 ) ) ( not ( = ?auto_350591 ?auto_350594 ) ) ( not ( = ?auto_350591 ?auto_350595 ) ) ( not ( = ?auto_350591 ?auto_350596 ) ) ( not ( = ?auto_350591 ?auto_350597 ) ) ( not ( = ?auto_350591 ?auto_350598 ) ) ( not ( = ?auto_350591 ?auto_350599 ) ) ( not ( = ?auto_350591 ?auto_350600 ) ) ( not ( = ?auto_350591 ?auto_350601 ) ) ( not ( = ?auto_350592 ?auto_350593 ) ) ( not ( = ?auto_350592 ?auto_350594 ) ) ( not ( = ?auto_350592 ?auto_350595 ) ) ( not ( = ?auto_350592 ?auto_350596 ) ) ( not ( = ?auto_350592 ?auto_350597 ) ) ( not ( = ?auto_350592 ?auto_350598 ) ) ( not ( = ?auto_350592 ?auto_350599 ) ) ( not ( = ?auto_350592 ?auto_350600 ) ) ( not ( = ?auto_350592 ?auto_350601 ) ) ( not ( = ?auto_350593 ?auto_350594 ) ) ( not ( = ?auto_350593 ?auto_350595 ) ) ( not ( = ?auto_350593 ?auto_350596 ) ) ( not ( = ?auto_350593 ?auto_350597 ) ) ( not ( = ?auto_350593 ?auto_350598 ) ) ( not ( = ?auto_350593 ?auto_350599 ) ) ( not ( = ?auto_350593 ?auto_350600 ) ) ( not ( = ?auto_350593 ?auto_350601 ) ) ( not ( = ?auto_350594 ?auto_350595 ) ) ( not ( = ?auto_350594 ?auto_350596 ) ) ( not ( = ?auto_350594 ?auto_350597 ) ) ( not ( = ?auto_350594 ?auto_350598 ) ) ( not ( = ?auto_350594 ?auto_350599 ) ) ( not ( = ?auto_350594 ?auto_350600 ) ) ( not ( = ?auto_350594 ?auto_350601 ) ) ( not ( = ?auto_350595 ?auto_350596 ) ) ( not ( = ?auto_350595 ?auto_350597 ) ) ( not ( = ?auto_350595 ?auto_350598 ) ) ( not ( = ?auto_350595 ?auto_350599 ) ) ( not ( = ?auto_350595 ?auto_350600 ) ) ( not ( = ?auto_350595 ?auto_350601 ) ) ( not ( = ?auto_350596 ?auto_350597 ) ) ( not ( = ?auto_350596 ?auto_350598 ) ) ( not ( = ?auto_350596 ?auto_350599 ) ) ( not ( = ?auto_350596 ?auto_350600 ) ) ( not ( = ?auto_350596 ?auto_350601 ) ) ( not ( = ?auto_350597 ?auto_350598 ) ) ( not ( = ?auto_350597 ?auto_350599 ) ) ( not ( = ?auto_350597 ?auto_350600 ) ) ( not ( = ?auto_350597 ?auto_350601 ) ) ( not ( = ?auto_350598 ?auto_350599 ) ) ( not ( = ?auto_350598 ?auto_350600 ) ) ( not ( = ?auto_350598 ?auto_350601 ) ) ( not ( = ?auto_350599 ?auto_350600 ) ) ( not ( = ?auto_350599 ?auto_350601 ) ) ( not ( = ?auto_350600 ?auto_350601 ) ) ( CLEAR ?auto_350598 ) ( ON ?auto_350599 ?auto_350600 ) ( CLEAR ?auto_350599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_350588 ?auto_350589 ?auto_350590 ?auto_350591 ?auto_350592 ?auto_350593 ?auto_350594 ?auto_350595 ?auto_350596 ?auto_350597 ?auto_350598 ?auto_350599 )
      ( MAKE-13PILE ?auto_350588 ?auto_350589 ?auto_350590 ?auto_350591 ?auto_350592 ?auto_350593 ?auto_350594 ?auto_350595 ?auto_350596 ?auto_350597 ?auto_350598 ?auto_350599 ?auto_350600 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350615 - BLOCK
      ?auto_350616 - BLOCK
      ?auto_350617 - BLOCK
      ?auto_350618 - BLOCK
      ?auto_350619 - BLOCK
      ?auto_350620 - BLOCK
      ?auto_350621 - BLOCK
      ?auto_350622 - BLOCK
      ?auto_350623 - BLOCK
      ?auto_350624 - BLOCK
      ?auto_350625 - BLOCK
      ?auto_350626 - BLOCK
      ?auto_350627 - BLOCK
    )
    :vars
    (
      ?auto_350628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350627 ?auto_350628 ) ( ON-TABLE ?auto_350615 ) ( ON ?auto_350616 ?auto_350615 ) ( ON ?auto_350617 ?auto_350616 ) ( ON ?auto_350618 ?auto_350617 ) ( ON ?auto_350619 ?auto_350618 ) ( ON ?auto_350620 ?auto_350619 ) ( ON ?auto_350621 ?auto_350620 ) ( ON ?auto_350622 ?auto_350621 ) ( ON ?auto_350623 ?auto_350622 ) ( ON ?auto_350624 ?auto_350623 ) ( ON ?auto_350625 ?auto_350624 ) ( not ( = ?auto_350615 ?auto_350616 ) ) ( not ( = ?auto_350615 ?auto_350617 ) ) ( not ( = ?auto_350615 ?auto_350618 ) ) ( not ( = ?auto_350615 ?auto_350619 ) ) ( not ( = ?auto_350615 ?auto_350620 ) ) ( not ( = ?auto_350615 ?auto_350621 ) ) ( not ( = ?auto_350615 ?auto_350622 ) ) ( not ( = ?auto_350615 ?auto_350623 ) ) ( not ( = ?auto_350615 ?auto_350624 ) ) ( not ( = ?auto_350615 ?auto_350625 ) ) ( not ( = ?auto_350615 ?auto_350626 ) ) ( not ( = ?auto_350615 ?auto_350627 ) ) ( not ( = ?auto_350615 ?auto_350628 ) ) ( not ( = ?auto_350616 ?auto_350617 ) ) ( not ( = ?auto_350616 ?auto_350618 ) ) ( not ( = ?auto_350616 ?auto_350619 ) ) ( not ( = ?auto_350616 ?auto_350620 ) ) ( not ( = ?auto_350616 ?auto_350621 ) ) ( not ( = ?auto_350616 ?auto_350622 ) ) ( not ( = ?auto_350616 ?auto_350623 ) ) ( not ( = ?auto_350616 ?auto_350624 ) ) ( not ( = ?auto_350616 ?auto_350625 ) ) ( not ( = ?auto_350616 ?auto_350626 ) ) ( not ( = ?auto_350616 ?auto_350627 ) ) ( not ( = ?auto_350616 ?auto_350628 ) ) ( not ( = ?auto_350617 ?auto_350618 ) ) ( not ( = ?auto_350617 ?auto_350619 ) ) ( not ( = ?auto_350617 ?auto_350620 ) ) ( not ( = ?auto_350617 ?auto_350621 ) ) ( not ( = ?auto_350617 ?auto_350622 ) ) ( not ( = ?auto_350617 ?auto_350623 ) ) ( not ( = ?auto_350617 ?auto_350624 ) ) ( not ( = ?auto_350617 ?auto_350625 ) ) ( not ( = ?auto_350617 ?auto_350626 ) ) ( not ( = ?auto_350617 ?auto_350627 ) ) ( not ( = ?auto_350617 ?auto_350628 ) ) ( not ( = ?auto_350618 ?auto_350619 ) ) ( not ( = ?auto_350618 ?auto_350620 ) ) ( not ( = ?auto_350618 ?auto_350621 ) ) ( not ( = ?auto_350618 ?auto_350622 ) ) ( not ( = ?auto_350618 ?auto_350623 ) ) ( not ( = ?auto_350618 ?auto_350624 ) ) ( not ( = ?auto_350618 ?auto_350625 ) ) ( not ( = ?auto_350618 ?auto_350626 ) ) ( not ( = ?auto_350618 ?auto_350627 ) ) ( not ( = ?auto_350618 ?auto_350628 ) ) ( not ( = ?auto_350619 ?auto_350620 ) ) ( not ( = ?auto_350619 ?auto_350621 ) ) ( not ( = ?auto_350619 ?auto_350622 ) ) ( not ( = ?auto_350619 ?auto_350623 ) ) ( not ( = ?auto_350619 ?auto_350624 ) ) ( not ( = ?auto_350619 ?auto_350625 ) ) ( not ( = ?auto_350619 ?auto_350626 ) ) ( not ( = ?auto_350619 ?auto_350627 ) ) ( not ( = ?auto_350619 ?auto_350628 ) ) ( not ( = ?auto_350620 ?auto_350621 ) ) ( not ( = ?auto_350620 ?auto_350622 ) ) ( not ( = ?auto_350620 ?auto_350623 ) ) ( not ( = ?auto_350620 ?auto_350624 ) ) ( not ( = ?auto_350620 ?auto_350625 ) ) ( not ( = ?auto_350620 ?auto_350626 ) ) ( not ( = ?auto_350620 ?auto_350627 ) ) ( not ( = ?auto_350620 ?auto_350628 ) ) ( not ( = ?auto_350621 ?auto_350622 ) ) ( not ( = ?auto_350621 ?auto_350623 ) ) ( not ( = ?auto_350621 ?auto_350624 ) ) ( not ( = ?auto_350621 ?auto_350625 ) ) ( not ( = ?auto_350621 ?auto_350626 ) ) ( not ( = ?auto_350621 ?auto_350627 ) ) ( not ( = ?auto_350621 ?auto_350628 ) ) ( not ( = ?auto_350622 ?auto_350623 ) ) ( not ( = ?auto_350622 ?auto_350624 ) ) ( not ( = ?auto_350622 ?auto_350625 ) ) ( not ( = ?auto_350622 ?auto_350626 ) ) ( not ( = ?auto_350622 ?auto_350627 ) ) ( not ( = ?auto_350622 ?auto_350628 ) ) ( not ( = ?auto_350623 ?auto_350624 ) ) ( not ( = ?auto_350623 ?auto_350625 ) ) ( not ( = ?auto_350623 ?auto_350626 ) ) ( not ( = ?auto_350623 ?auto_350627 ) ) ( not ( = ?auto_350623 ?auto_350628 ) ) ( not ( = ?auto_350624 ?auto_350625 ) ) ( not ( = ?auto_350624 ?auto_350626 ) ) ( not ( = ?auto_350624 ?auto_350627 ) ) ( not ( = ?auto_350624 ?auto_350628 ) ) ( not ( = ?auto_350625 ?auto_350626 ) ) ( not ( = ?auto_350625 ?auto_350627 ) ) ( not ( = ?auto_350625 ?auto_350628 ) ) ( not ( = ?auto_350626 ?auto_350627 ) ) ( not ( = ?auto_350626 ?auto_350628 ) ) ( not ( = ?auto_350627 ?auto_350628 ) ) ( CLEAR ?auto_350625 ) ( ON ?auto_350626 ?auto_350627 ) ( CLEAR ?auto_350626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_350615 ?auto_350616 ?auto_350617 ?auto_350618 ?auto_350619 ?auto_350620 ?auto_350621 ?auto_350622 ?auto_350623 ?auto_350624 ?auto_350625 ?auto_350626 )
      ( MAKE-13PILE ?auto_350615 ?auto_350616 ?auto_350617 ?auto_350618 ?auto_350619 ?auto_350620 ?auto_350621 ?auto_350622 ?auto_350623 ?auto_350624 ?auto_350625 ?auto_350626 ?auto_350627 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350642 - BLOCK
      ?auto_350643 - BLOCK
      ?auto_350644 - BLOCK
      ?auto_350645 - BLOCK
      ?auto_350646 - BLOCK
      ?auto_350647 - BLOCK
      ?auto_350648 - BLOCK
      ?auto_350649 - BLOCK
      ?auto_350650 - BLOCK
      ?auto_350651 - BLOCK
      ?auto_350652 - BLOCK
      ?auto_350653 - BLOCK
      ?auto_350654 - BLOCK
    )
    :vars
    (
      ?auto_350655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350654 ?auto_350655 ) ( ON-TABLE ?auto_350642 ) ( ON ?auto_350643 ?auto_350642 ) ( ON ?auto_350644 ?auto_350643 ) ( ON ?auto_350645 ?auto_350644 ) ( ON ?auto_350646 ?auto_350645 ) ( ON ?auto_350647 ?auto_350646 ) ( ON ?auto_350648 ?auto_350647 ) ( ON ?auto_350649 ?auto_350648 ) ( ON ?auto_350650 ?auto_350649 ) ( ON ?auto_350651 ?auto_350650 ) ( not ( = ?auto_350642 ?auto_350643 ) ) ( not ( = ?auto_350642 ?auto_350644 ) ) ( not ( = ?auto_350642 ?auto_350645 ) ) ( not ( = ?auto_350642 ?auto_350646 ) ) ( not ( = ?auto_350642 ?auto_350647 ) ) ( not ( = ?auto_350642 ?auto_350648 ) ) ( not ( = ?auto_350642 ?auto_350649 ) ) ( not ( = ?auto_350642 ?auto_350650 ) ) ( not ( = ?auto_350642 ?auto_350651 ) ) ( not ( = ?auto_350642 ?auto_350652 ) ) ( not ( = ?auto_350642 ?auto_350653 ) ) ( not ( = ?auto_350642 ?auto_350654 ) ) ( not ( = ?auto_350642 ?auto_350655 ) ) ( not ( = ?auto_350643 ?auto_350644 ) ) ( not ( = ?auto_350643 ?auto_350645 ) ) ( not ( = ?auto_350643 ?auto_350646 ) ) ( not ( = ?auto_350643 ?auto_350647 ) ) ( not ( = ?auto_350643 ?auto_350648 ) ) ( not ( = ?auto_350643 ?auto_350649 ) ) ( not ( = ?auto_350643 ?auto_350650 ) ) ( not ( = ?auto_350643 ?auto_350651 ) ) ( not ( = ?auto_350643 ?auto_350652 ) ) ( not ( = ?auto_350643 ?auto_350653 ) ) ( not ( = ?auto_350643 ?auto_350654 ) ) ( not ( = ?auto_350643 ?auto_350655 ) ) ( not ( = ?auto_350644 ?auto_350645 ) ) ( not ( = ?auto_350644 ?auto_350646 ) ) ( not ( = ?auto_350644 ?auto_350647 ) ) ( not ( = ?auto_350644 ?auto_350648 ) ) ( not ( = ?auto_350644 ?auto_350649 ) ) ( not ( = ?auto_350644 ?auto_350650 ) ) ( not ( = ?auto_350644 ?auto_350651 ) ) ( not ( = ?auto_350644 ?auto_350652 ) ) ( not ( = ?auto_350644 ?auto_350653 ) ) ( not ( = ?auto_350644 ?auto_350654 ) ) ( not ( = ?auto_350644 ?auto_350655 ) ) ( not ( = ?auto_350645 ?auto_350646 ) ) ( not ( = ?auto_350645 ?auto_350647 ) ) ( not ( = ?auto_350645 ?auto_350648 ) ) ( not ( = ?auto_350645 ?auto_350649 ) ) ( not ( = ?auto_350645 ?auto_350650 ) ) ( not ( = ?auto_350645 ?auto_350651 ) ) ( not ( = ?auto_350645 ?auto_350652 ) ) ( not ( = ?auto_350645 ?auto_350653 ) ) ( not ( = ?auto_350645 ?auto_350654 ) ) ( not ( = ?auto_350645 ?auto_350655 ) ) ( not ( = ?auto_350646 ?auto_350647 ) ) ( not ( = ?auto_350646 ?auto_350648 ) ) ( not ( = ?auto_350646 ?auto_350649 ) ) ( not ( = ?auto_350646 ?auto_350650 ) ) ( not ( = ?auto_350646 ?auto_350651 ) ) ( not ( = ?auto_350646 ?auto_350652 ) ) ( not ( = ?auto_350646 ?auto_350653 ) ) ( not ( = ?auto_350646 ?auto_350654 ) ) ( not ( = ?auto_350646 ?auto_350655 ) ) ( not ( = ?auto_350647 ?auto_350648 ) ) ( not ( = ?auto_350647 ?auto_350649 ) ) ( not ( = ?auto_350647 ?auto_350650 ) ) ( not ( = ?auto_350647 ?auto_350651 ) ) ( not ( = ?auto_350647 ?auto_350652 ) ) ( not ( = ?auto_350647 ?auto_350653 ) ) ( not ( = ?auto_350647 ?auto_350654 ) ) ( not ( = ?auto_350647 ?auto_350655 ) ) ( not ( = ?auto_350648 ?auto_350649 ) ) ( not ( = ?auto_350648 ?auto_350650 ) ) ( not ( = ?auto_350648 ?auto_350651 ) ) ( not ( = ?auto_350648 ?auto_350652 ) ) ( not ( = ?auto_350648 ?auto_350653 ) ) ( not ( = ?auto_350648 ?auto_350654 ) ) ( not ( = ?auto_350648 ?auto_350655 ) ) ( not ( = ?auto_350649 ?auto_350650 ) ) ( not ( = ?auto_350649 ?auto_350651 ) ) ( not ( = ?auto_350649 ?auto_350652 ) ) ( not ( = ?auto_350649 ?auto_350653 ) ) ( not ( = ?auto_350649 ?auto_350654 ) ) ( not ( = ?auto_350649 ?auto_350655 ) ) ( not ( = ?auto_350650 ?auto_350651 ) ) ( not ( = ?auto_350650 ?auto_350652 ) ) ( not ( = ?auto_350650 ?auto_350653 ) ) ( not ( = ?auto_350650 ?auto_350654 ) ) ( not ( = ?auto_350650 ?auto_350655 ) ) ( not ( = ?auto_350651 ?auto_350652 ) ) ( not ( = ?auto_350651 ?auto_350653 ) ) ( not ( = ?auto_350651 ?auto_350654 ) ) ( not ( = ?auto_350651 ?auto_350655 ) ) ( not ( = ?auto_350652 ?auto_350653 ) ) ( not ( = ?auto_350652 ?auto_350654 ) ) ( not ( = ?auto_350652 ?auto_350655 ) ) ( not ( = ?auto_350653 ?auto_350654 ) ) ( not ( = ?auto_350653 ?auto_350655 ) ) ( not ( = ?auto_350654 ?auto_350655 ) ) ( ON ?auto_350653 ?auto_350654 ) ( CLEAR ?auto_350651 ) ( ON ?auto_350652 ?auto_350653 ) ( CLEAR ?auto_350652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_350642 ?auto_350643 ?auto_350644 ?auto_350645 ?auto_350646 ?auto_350647 ?auto_350648 ?auto_350649 ?auto_350650 ?auto_350651 ?auto_350652 )
      ( MAKE-13PILE ?auto_350642 ?auto_350643 ?auto_350644 ?auto_350645 ?auto_350646 ?auto_350647 ?auto_350648 ?auto_350649 ?auto_350650 ?auto_350651 ?auto_350652 ?auto_350653 ?auto_350654 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350669 - BLOCK
      ?auto_350670 - BLOCK
      ?auto_350671 - BLOCK
      ?auto_350672 - BLOCK
      ?auto_350673 - BLOCK
      ?auto_350674 - BLOCK
      ?auto_350675 - BLOCK
      ?auto_350676 - BLOCK
      ?auto_350677 - BLOCK
      ?auto_350678 - BLOCK
      ?auto_350679 - BLOCK
      ?auto_350680 - BLOCK
      ?auto_350681 - BLOCK
    )
    :vars
    (
      ?auto_350682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350681 ?auto_350682 ) ( ON-TABLE ?auto_350669 ) ( ON ?auto_350670 ?auto_350669 ) ( ON ?auto_350671 ?auto_350670 ) ( ON ?auto_350672 ?auto_350671 ) ( ON ?auto_350673 ?auto_350672 ) ( ON ?auto_350674 ?auto_350673 ) ( ON ?auto_350675 ?auto_350674 ) ( ON ?auto_350676 ?auto_350675 ) ( ON ?auto_350677 ?auto_350676 ) ( ON ?auto_350678 ?auto_350677 ) ( not ( = ?auto_350669 ?auto_350670 ) ) ( not ( = ?auto_350669 ?auto_350671 ) ) ( not ( = ?auto_350669 ?auto_350672 ) ) ( not ( = ?auto_350669 ?auto_350673 ) ) ( not ( = ?auto_350669 ?auto_350674 ) ) ( not ( = ?auto_350669 ?auto_350675 ) ) ( not ( = ?auto_350669 ?auto_350676 ) ) ( not ( = ?auto_350669 ?auto_350677 ) ) ( not ( = ?auto_350669 ?auto_350678 ) ) ( not ( = ?auto_350669 ?auto_350679 ) ) ( not ( = ?auto_350669 ?auto_350680 ) ) ( not ( = ?auto_350669 ?auto_350681 ) ) ( not ( = ?auto_350669 ?auto_350682 ) ) ( not ( = ?auto_350670 ?auto_350671 ) ) ( not ( = ?auto_350670 ?auto_350672 ) ) ( not ( = ?auto_350670 ?auto_350673 ) ) ( not ( = ?auto_350670 ?auto_350674 ) ) ( not ( = ?auto_350670 ?auto_350675 ) ) ( not ( = ?auto_350670 ?auto_350676 ) ) ( not ( = ?auto_350670 ?auto_350677 ) ) ( not ( = ?auto_350670 ?auto_350678 ) ) ( not ( = ?auto_350670 ?auto_350679 ) ) ( not ( = ?auto_350670 ?auto_350680 ) ) ( not ( = ?auto_350670 ?auto_350681 ) ) ( not ( = ?auto_350670 ?auto_350682 ) ) ( not ( = ?auto_350671 ?auto_350672 ) ) ( not ( = ?auto_350671 ?auto_350673 ) ) ( not ( = ?auto_350671 ?auto_350674 ) ) ( not ( = ?auto_350671 ?auto_350675 ) ) ( not ( = ?auto_350671 ?auto_350676 ) ) ( not ( = ?auto_350671 ?auto_350677 ) ) ( not ( = ?auto_350671 ?auto_350678 ) ) ( not ( = ?auto_350671 ?auto_350679 ) ) ( not ( = ?auto_350671 ?auto_350680 ) ) ( not ( = ?auto_350671 ?auto_350681 ) ) ( not ( = ?auto_350671 ?auto_350682 ) ) ( not ( = ?auto_350672 ?auto_350673 ) ) ( not ( = ?auto_350672 ?auto_350674 ) ) ( not ( = ?auto_350672 ?auto_350675 ) ) ( not ( = ?auto_350672 ?auto_350676 ) ) ( not ( = ?auto_350672 ?auto_350677 ) ) ( not ( = ?auto_350672 ?auto_350678 ) ) ( not ( = ?auto_350672 ?auto_350679 ) ) ( not ( = ?auto_350672 ?auto_350680 ) ) ( not ( = ?auto_350672 ?auto_350681 ) ) ( not ( = ?auto_350672 ?auto_350682 ) ) ( not ( = ?auto_350673 ?auto_350674 ) ) ( not ( = ?auto_350673 ?auto_350675 ) ) ( not ( = ?auto_350673 ?auto_350676 ) ) ( not ( = ?auto_350673 ?auto_350677 ) ) ( not ( = ?auto_350673 ?auto_350678 ) ) ( not ( = ?auto_350673 ?auto_350679 ) ) ( not ( = ?auto_350673 ?auto_350680 ) ) ( not ( = ?auto_350673 ?auto_350681 ) ) ( not ( = ?auto_350673 ?auto_350682 ) ) ( not ( = ?auto_350674 ?auto_350675 ) ) ( not ( = ?auto_350674 ?auto_350676 ) ) ( not ( = ?auto_350674 ?auto_350677 ) ) ( not ( = ?auto_350674 ?auto_350678 ) ) ( not ( = ?auto_350674 ?auto_350679 ) ) ( not ( = ?auto_350674 ?auto_350680 ) ) ( not ( = ?auto_350674 ?auto_350681 ) ) ( not ( = ?auto_350674 ?auto_350682 ) ) ( not ( = ?auto_350675 ?auto_350676 ) ) ( not ( = ?auto_350675 ?auto_350677 ) ) ( not ( = ?auto_350675 ?auto_350678 ) ) ( not ( = ?auto_350675 ?auto_350679 ) ) ( not ( = ?auto_350675 ?auto_350680 ) ) ( not ( = ?auto_350675 ?auto_350681 ) ) ( not ( = ?auto_350675 ?auto_350682 ) ) ( not ( = ?auto_350676 ?auto_350677 ) ) ( not ( = ?auto_350676 ?auto_350678 ) ) ( not ( = ?auto_350676 ?auto_350679 ) ) ( not ( = ?auto_350676 ?auto_350680 ) ) ( not ( = ?auto_350676 ?auto_350681 ) ) ( not ( = ?auto_350676 ?auto_350682 ) ) ( not ( = ?auto_350677 ?auto_350678 ) ) ( not ( = ?auto_350677 ?auto_350679 ) ) ( not ( = ?auto_350677 ?auto_350680 ) ) ( not ( = ?auto_350677 ?auto_350681 ) ) ( not ( = ?auto_350677 ?auto_350682 ) ) ( not ( = ?auto_350678 ?auto_350679 ) ) ( not ( = ?auto_350678 ?auto_350680 ) ) ( not ( = ?auto_350678 ?auto_350681 ) ) ( not ( = ?auto_350678 ?auto_350682 ) ) ( not ( = ?auto_350679 ?auto_350680 ) ) ( not ( = ?auto_350679 ?auto_350681 ) ) ( not ( = ?auto_350679 ?auto_350682 ) ) ( not ( = ?auto_350680 ?auto_350681 ) ) ( not ( = ?auto_350680 ?auto_350682 ) ) ( not ( = ?auto_350681 ?auto_350682 ) ) ( ON ?auto_350680 ?auto_350681 ) ( CLEAR ?auto_350678 ) ( ON ?auto_350679 ?auto_350680 ) ( CLEAR ?auto_350679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_350669 ?auto_350670 ?auto_350671 ?auto_350672 ?auto_350673 ?auto_350674 ?auto_350675 ?auto_350676 ?auto_350677 ?auto_350678 ?auto_350679 )
      ( MAKE-13PILE ?auto_350669 ?auto_350670 ?auto_350671 ?auto_350672 ?auto_350673 ?auto_350674 ?auto_350675 ?auto_350676 ?auto_350677 ?auto_350678 ?auto_350679 ?auto_350680 ?auto_350681 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350696 - BLOCK
      ?auto_350697 - BLOCK
      ?auto_350698 - BLOCK
      ?auto_350699 - BLOCK
      ?auto_350700 - BLOCK
      ?auto_350701 - BLOCK
      ?auto_350702 - BLOCK
      ?auto_350703 - BLOCK
      ?auto_350704 - BLOCK
      ?auto_350705 - BLOCK
      ?auto_350706 - BLOCK
      ?auto_350707 - BLOCK
      ?auto_350708 - BLOCK
    )
    :vars
    (
      ?auto_350709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350708 ?auto_350709 ) ( ON-TABLE ?auto_350696 ) ( ON ?auto_350697 ?auto_350696 ) ( ON ?auto_350698 ?auto_350697 ) ( ON ?auto_350699 ?auto_350698 ) ( ON ?auto_350700 ?auto_350699 ) ( ON ?auto_350701 ?auto_350700 ) ( ON ?auto_350702 ?auto_350701 ) ( ON ?auto_350703 ?auto_350702 ) ( ON ?auto_350704 ?auto_350703 ) ( not ( = ?auto_350696 ?auto_350697 ) ) ( not ( = ?auto_350696 ?auto_350698 ) ) ( not ( = ?auto_350696 ?auto_350699 ) ) ( not ( = ?auto_350696 ?auto_350700 ) ) ( not ( = ?auto_350696 ?auto_350701 ) ) ( not ( = ?auto_350696 ?auto_350702 ) ) ( not ( = ?auto_350696 ?auto_350703 ) ) ( not ( = ?auto_350696 ?auto_350704 ) ) ( not ( = ?auto_350696 ?auto_350705 ) ) ( not ( = ?auto_350696 ?auto_350706 ) ) ( not ( = ?auto_350696 ?auto_350707 ) ) ( not ( = ?auto_350696 ?auto_350708 ) ) ( not ( = ?auto_350696 ?auto_350709 ) ) ( not ( = ?auto_350697 ?auto_350698 ) ) ( not ( = ?auto_350697 ?auto_350699 ) ) ( not ( = ?auto_350697 ?auto_350700 ) ) ( not ( = ?auto_350697 ?auto_350701 ) ) ( not ( = ?auto_350697 ?auto_350702 ) ) ( not ( = ?auto_350697 ?auto_350703 ) ) ( not ( = ?auto_350697 ?auto_350704 ) ) ( not ( = ?auto_350697 ?auto_350705 ) ) ( not ( = ?auto_350697 ?auto_350706 ) ) ( not ( = ?auto_350697 ?auto_350707 ) ) ( not ( = ?auto_350697 ?auto_350708 ) ) ( not ( = ?auto_350697 ?auto_350709 ) ) ( not ( = ?auto_350698 ?auto_350699 ) ) ( not ( = ?auto_350698 ?auto_350700 ) ) ( not ( = ?auto_350698 ?auto_350701 ) ) ( not ( = ?auto_350698 ?auto_350702 ) ) ( not ( = ?auto_350698 ?auto_350703 ) ) ( not ( = ?auto_350698 ?auto_350704 ) ) ( not ( = ?auto_350698 ?auto_350705 ) ) ( not ( = ?auto_350698 ?auto_350706 ) ) ( not ( = ?auto_350698 ?auto_350707 ) ) ( not ( = ?auto_350698 ?auto_350708 ) ) ( not ( = ?auto_350698 ?auto_350709 ) ) ( not ( = ?auto_350699 ?auto_350700 ) ) ( not ( = ?auto_350699 ?auto_350701 ) ) ( not ( = ?auto_350699 ?auto_350702 ) ) ( not ( = ?auto_350699 ?auto_350703 ) ) ( not ( = ?auto_350699 ?auto_350704 ) ) ( not ( = ?auto_350699 ?auto_350705 ) ) ( not ( = ?auto_350699 ?auto_350706 ) ) ( not ( = ?auto_350699 ?auto_350707 ) ) ( not ( = ?auto_350699 ?auto_350708 ) ) ( not ( = ?auto_350699 ?auto_350709 ) ) ( not ( = ?auto_350700 ?auto_350701 ) ) ( not ( = ?auto_350700 ?auto_350702 ) ) ( not ( = ?auto_350700 ?auto_350703 ) ) ( not ( = ?auto_350700 ?auto_350704 ) ) ( not ( = ?auto_350700 ?auto_350705 ) ) ( not ( = ?auto_350700 ?auto_350706 ) ) ( not ( = ?auto_350700 ?auto_350707 ) ) ( not ( = ?auto_350700 ?auto_350708 ) ) ( not ( = ?auto_350700 ?auto_350709 ) ) ( not ( = ?auto_350701 ?auto_350702 ) ) ( not ( = ?auto_350701 ?auto_350703 ) ) ( not ( = ?auto_350701 ?auto_350704 ) ) ( not ( = ?auto_350701 ?auto_350705 ) ) ( not ( = ?auto_350701 ?auto_350706 ) ) ( not ( = ?auto_350701 ?auto_350707 ) ) ( not ( = ?auto_350701 ?auto_350708 ) ) ( not ( = ?auto_350701 ?auto_350709 ) ) ( not ( = ?auto_350702 ?auto_350703 ) ) ( not ( = ?auto_350702 ?auto_350704 ) ) ( not ( = ?auto_350702 ?auto_350705 ) ) ( not ( = ?auto_350702 ?auto_350706 ) ) ( not ( = ?auto_350702 ?auto_350707 ) ) ( not ( = ?auto_350702 ?auto_350708 ) ) ( not ( = ?auto_350702 ?auto_350709 ) ) ( not ( = ?auto_350703 ?auto_350704 ) ) ( not ( = ?auto_350703 ?auto_350705 ) ) ( not ( = ?auto_350703 ?auto_350706 ) ) ( not ( = ?auto_350703 ?auto_350707 ) ) ( not ( = ?auto_350703 ?auto_350708 ) ) ( not ( = ?auto_350703 ?auto_350709 ) ) ( not ( = ?auto_350704 ?auto_350705 ) ) ( not ( = ?auto_350704 ?auto_350706 ) ) ( not ( = ?auto_350704 ?auto_350707 ) ) ( not ( = ?auto_350704 ?auto_350708 ) ) ( not ( = ?auto_350704 ?auto_350709 ) ) ( not ( = ?auto_350705 ?auto_350706 ) ) ( not ( = ?auto_350705 ?auto_350707 ) ) ( not ( = ?auto_350705 ?auto_350708 ) ) ( not ( = ?auto_350705 ?auto_350709 ) ) ( not ( = ?auto_350706 ?auto_350707 ) ) ( not ( = ?auto_350706 ?auto_350708 ) ) ( not ( = ?auto_350706 ?auto_350709 ) ) ( not ( = ?auto_350707 ?auto_350708 ) ) ( not ( = ?auto_350707 ?auto_350709 ) ) ( not ( = ?auto_350708 ?auto_350709 ) ) ( ON ?auto_350707 ?auto_350708 ) ( ON ?auto_350706 ?auto_350707 ) ( CLEAR ?auto_350704 ) ( ON ?auto_350705 ?auto_350706 ) ( CLEAR ?auto_350705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_350696 ?auto_350697 ?auto_350698 ?auto_350699 ?auto_350700 ?auto_350701 ?auto_350702 ?auto_350703 ?auto_350704 ?auto_350705 )
      ( MAKE-13PILE ?auto_350696 ?auto_350697 ?auto_350698 ?auto_350699 ?auto_350700 ?auto_350701 ?auto_350702 ?auto_350703 ?auto_350704 ?auto_350705 ?auto_350706 ?auto_350707 ?auto_350708 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350723 - BLOCK
      ?auto_350724 - BLOCK
      ?auto_350725 - BLOCK
      ?auto_350726 - BLOCK
      ?auto_350727 - BLOCK
      ?auto_350728 - BLOCK
      ?auto_350729 - BLOCK
      ?auto_350730 - BLOCK
      ?auto_350731 - BLOCK
      ?auto_350732 - BLOCK
      ?auto_350733 - BLOCK
      ?auto_350734 - BLOCK
      ?auto_350735 - BLOCK
    )
    :vars
    (
      ?auto_350736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350735 ?auto_350736 ) ( ON-TABLE ?auto_350723 ) ( ON ?auto_350724 ?auto_350723 ) ( ON ?auto_350725 ?auto_350724 ) ( ON ?auto_350726 ?auto_350725 ) ( ON ?auto_350727 ?auto_350726 ) ( ON ?auto_350728 ?auto_350727 ) ( ON ?auto_350729 ?auto_350728 ) ( ON ?auto_350730 ?auto_350729 ) ( ON ?auto_350731 ?auto_350730 ) ( not ( = ?auto_350723 ?auto_350724 ) ) ( not ( = ?auto_350723 ?auto_350725 ) ) ( not ( = ?auto_350723 ?auto_350726 ) ) ( not ( = ?auto_350723 ?auto_350727 ) ) ( not ( = ?auto_350723 ?auto_350728 ) ) ( not ( = ?auto_350723 ?auto_350729 ) ) ( not ( = ?auto_350723 ?auto_350730 ) ) ( not ( = ?auto_350723 ?auto_350731 ) ) ( not ( = ?auto_350723 ?auto_350732 ) ) ( not ( = ?auto_350723 ?auto_350733 ) ) ( not ( = ?auto_350723 ?auto_350734 ) ) ( not ( = ?auto_350723 ?auto_350735 ) ) ( not ( = ?auto_350723 ?auto_350736 ) ) ( not ( = ?auto_350724 ?auto_350725 ) ) ( not ( = ?auto_350724 ?auto_350726 ) ) ( not ( = ?auto_350724 ?auto_350727 ) ) ( not ( = ?auto_350724 ?auto_350728 ) ) ( not ( = ?auto_350724 ?auto_350729 ) ) ( not ( = ?auto_350724 ?auto_350730 ) ) ( not ( = ?auto_350724 ?auto_350731 ) ) ( not ( = ?auto_350724 ?auto_350732 ) ) ( not ( = ?auto_350724 ?auto_350733 ) ) ( not ( = ?auto_350724 ?auto_350734 ) ) ( not ( = ?auto_350724 ?auto_350735 ) ) ( not ( = ?auto_350724 ?auto_350736 ) ) ( not ( = ?auto_350725 ?auto_350726 ) ) ( not ( = ?auto_350725 ?auto_350727 ) ) ( not ( = ?auto_350725 ?auto_350728 ) ) ( not ( = ?auto_350725 ?auto_350729 ) ) ( not ( = ?auto_350725 ?auto_350730 ) ) ( not ( = ?auto_350725 ?auto_350731 ) ) ( not ( = ?auto_350725 ?auto_350732 ) ) ( not ( = ?auto_350725 ?auto_350733 ) ) ( not ( = ?auto_350725 ?auto_350734 ) ) ( not ( = ?auto_350725 ?auto_350735 ) ) ( not ( = ?auto_350725 ?auto_350736 ) ) ( not ( = ?auto_350726 ?auto_350727 ) ) ( not ( = ?auto_350726 ?auto_350728 ) ) ( not ( = ?auto_350726 ?auto_350729 ) ) ( not ( = ?auto_350726 ?auto_350730 ) ) ( not ( = ?auto_350726 ?auto_350731 ) ) ( not ( = ?auto_350726 ?auto_350732 ) ) ( not ( = ?auto_350726 ?auto_350733 ) ) ( not ( = ?auto_350726 ?auto_350734 ) ) ( not ( = ?auto_350726 ?auto_350735 ) ) ( not ( = ?auto_350726 ?auto_350736 ) ) ( not ( = ?auto_350727 ?auto_350728 ) ) ( not ( = ?auto_350727 ?auto_350729 ) ) ( not ( = ?auto_350727 ?auto_350730 ) ) ( not ( = ?auto_350727 ?auto_350731 ) ) ( not ( = ?auto_350727 ?auto_350732 ) ) ( not ( = ?auto_350727 ?auto_350733 ) ) ( not ( = ?auto_350727 ?auto_350734 ) ) ( not ( = ?auto_350727 ?auto_350735 ) ) ( not ( = ?auto_350727 ?auto_350736 ) ) ( not ( = ?auto_350728 ?auto_350729 ) ) ( not ( = ?auto_350728 ?auto_350730 ) ) ( not ( = ?auto_350728 ?auto_350731 ) ) ( not ( = ?auto_350728 ?auto_350732 ) ) ( not ( = ?auto_350728 ?auto_350733 ) ) ( not ( = ?auto_350728 ?auto_350734 ) ) ( not ( = ?auto_350728 ?auto_350735 ) ) ( not ( = ?auto_350728 ?auto_350736 ) ) ( not ( = ?auto_350729 ?auto_350730 ) ) ( not ( = ?auto_350729 ?auto_350731 ) ) ( not ( = ?auto_350729 ?auto_350732 ) ) ( not ( = ?auto_350729 ?auto_350733 ) ) ( not ( = ?auto_350729 ?auto_350734 ) ) ( not ( = ?auto_350729 ?auto_350735 ) ) ( not ( = ?auto_350729 ?auto_350736 ) ) ( not ( = ?auto_350730 ?auto_350731 ) ) ( not ( = ?auto_350730 ?auto_350732 ) ) ( not ( = ?auto_350730 ?auto_350733 ) ) ( not ( = ?auto_350730 ?auto_350734 ) ) ( not ( = ?auto_350730 ?auto_350735 ) ) ( not ( = ?auto_350730 ?auto_350736 ) ) ( not ( = ?auto_350731 ?auto_350732 ) ) ( not ( = ?auto_350731 ?auto_350733 ) ) ( not ( = ?auto_350731 ?auto_350734 ) ) ( not ( = ?auto_350731 ?auto_350735 ) ) ( not ( = ?auto_350731 ?auto_350736 ) ) ( not ( = ?auto_350732 ?auto_350733 ) ) ( not ( = ?auto_350732 ?auto_350734 ) ) ( not ( = ?auto_350732 ?auto_350735 ) ) ( not ( = ?auto_350732 ?auto_350736 ) ) ( not ( = ?auto_350733 ?auto_350734 ) ) ( not ( = ?auto_350733 ?auto_350735 ) ) ( not ( = ?auto_350733 ?auto_350736 ) ) ( not ( = ?auto_350734 ?auto_350735 ) ) ( not ( = ?auto_350734 ?auto_350736 ) ) ( not ( = ?auto_350735 ?auto_350736 ) ) ( ON ?auto_350734 ?auto_350735 ) ( ON ?auto_350733 ?auto_350734 ) ( CLEAR ?auto_350731 ) ( ON ?auto_350732 ?auto_350733 ) ( CLEAR ?auto_350732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_350723 ?auto_350724 ?auto_350725 ?auto_350726 ?auto_350727 ?auto_350728 ?auto_350729 ?auto_350730 ?auto_350731 ?auto_350732 )
      ( MAKE-13PILE ?auto_350723 ?auto_350724 ?auto_350725 ?auto_350726 ?auto_350727 ?auto_350728 ?auto_350729 ?auto_350730 ?auto_350731 ?auto_350732 ?auto_350733 ?auto_350734 ?auto_350735 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350750 - BLOCK
      ?auto_350751 - BLOCK
      ?auto_350752 - BLOCK
      ?auto_350753 - BLOCK
      ?auto_350754 - BLOCK
      ?auto_350755 - BLOCK
      ?auto_350756 - BLOCK
      ?auto_350757 - BLOCK
      ?auto_350758 - BLOCK
      ?auto_350759 - BLOCK
      ?auto_350760 - BLOCK
      ?auto_350761 - BLOCK
      ?auto_350762 - BLOCK
    )
    :vars
    (
      ?auto_350763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350762 ?auto_350763 ) ( ON-TABLE ?auto_350750 ) ( ON ?auto_350751 ?auto_350750 ) ( ON ?auto_350752 ?auto_350751 ) ( ON ?auto_350753 ?auto_350752 ) ( ON ?auto_350754 ?auto_350753 ) ( ON ?auto_350755 ?auto_350754 ) ( ON ?auto_350756 ?auto_350755 ) ( ON ?auto_350757 ?auto_350756 ) ( not ( = ?auto_350750 ?auto_350751 ) ) ( not ( = ?auto_350750 ?auto_350752 ) ) ( not ( = ?auto_350750 ?auto_350753 ) ) ( not ( = ?auto_350750 ?auto_350754 ) ) ( not ( = ?auto_350750 ?auto_350755 ) ) ( not ( = ?auto_350750 ?auto_350756 ) ) ( not ( = ?auto_350750 ?auto_350757 ) ) ( not ( = ?auto_350750 ?auto_350758 ) ) ( not ( = ?auto_350750 ?auto_350759 ) ) ( not ( = ?auto_350750 ?auto_350760 ) ) ( not ( = ?auto_350750 ?auto_350761 ) ) ( not ( = ?auto_350750 ?auto_350762 ) ) ( not ( = ?auto_350750 ?auto_350763 ) ) ( not ( = ?auto_350751 ?auto_350752 ) ) ( not ( = ?auto_350751 ?auto_350753 ) ) ( not ( = ?auto_350751 ?auto_350754 ) ) ( not ( = ?auto_350751 ?auto_350755 ) ) ( not ( = ?auto_350751 ?auto_350756 ) ) ( not ( = ?auto_350751 ?auto_350757 ) ) ( not ( = ?auto_350751 ?auto_350758 ) ) ( not ( = ?auto_350751 ?auto_350759 ) ) ( not ( = ?auto_350751 ?auto_350760 ) ) ( not ( = ?auto_350751 ?auto_350761 ) ) ( not ( = ?auto_350751 ?auto_350762 ) ) ( not ( = ?auto_350751 ?auto_350763 ) ) ( not ( = ?auto_350752 ?auto_350753 ) ) ( not ( = ?auto_350752 ?auto_350754 ) ) ( not ( = ?auto_350752 ?auto_350755 ) ) ( not ( = ?auto_350752 ?auto_350756 ) ) ( not ( = ?auto_350752 ?auto_350757 ) ) ( not ( = ?auto_350752 ?auto_350758 ) ) ( not ( = ?auto_350752 ?auto_350759 ) ) ( not ( = ?auto_350752 ?auto_350760 ) ) ( not ( = ?auto_350752 ?auto_350761 ) ) ( not ( = ?auto_350752 ?auto_350762 ) ) ( not ( = ?auto_350752 ?auto_350763 ) ) ( not ( = ?auto_350753 ?auto_350754 ) ) ( not ( = ?auto_350753 ?auto_350755 ) ) ( not ( = ?auto_350753 ?auto_350756 ) ) ( not ( = ?auto_350753 ?auto_350757 ) ) ( not ( = ?auto_350753 ?auto_350758 ) ) ( not ( = ?auto_350753 ?auto_350759 ) ) ( not ( = ?auto_350753 ?auto_350760 ) ) ( not ( = ?auto_350753 ?auto_350761 ) ) ( not ( = ?auto_350753 ?auto_350762 ) ) ( not ( = ?auto_350753 ?auto_350763 ) ) ( not ( = ?auto_350754 ?auto_350755 ) ) ( not ( = ?auto_350754 ?auto_350756 ) ) ( not ( = ?auto_350754 ?auto_350757 ) ) ( not ( = ?auto_350754 ?auto_350758 ) ) ( not ( = ?auto_350754 ?auto_350759 ) ) ( not ( = ?auto_350754 ?auto_350760 ) ) ( not ( = ?auto_350754 ?auto_350761 ) ) ( not ( = ?auto_350754 ?auto_350762 ) ) ( not ( = ?auto_350754 ?auto_350763 ) ) ( not ( = ?auto_350755 ?auto_350756 ) ) ( not ( = ?auto_350755 ?auto_350757 ) ) ( not ( = ?auto_350755 ?auto_350758 ) ) ( not ( = ?auto_350755 ?auto_350759 ) ) ( not ( = ?auto_350755 ?auto_350760 ) ) ( not ( = ?auto_350755 ?auto_350761 ) ) ( not ( = ?auto_350755 ?auto_350762 ) ) ( not ( = ?auto_350755 ?auto_350763 ) ) ( not ( = ?auto_350756 ?auto_350757 ) ) ( not ( = ?auto_350756 ?auto_350758 ) ) ( not ( = ?auto_350756 ?auto_350759 ) ) ( not ( = ?auto_350756 ?auto_350760 ) ) ( not ( = ?auto_350756 ?auto_350761 ) ) ( not ( = ?auto_350756 ?auto_350762 ) ) ( not ( = ?auto_350756 ?auto_350763 ) ) ( not ( = ?auto_350757 ?auto_350758 ) ) ( not ( = ?auto_350757 ?auto_350759 ) ) ( not ( = ?auto_350757 ?auto_350760 ) ) ( not ( = ?auto_350757 ?auto_350761 ) ) ( not ( = ?auto_350757 ?auto_350762 ) ) ( not ( = ?auto_350757 ?auto_350763 ) ) ( not ( = ?auto_350758 ?auto_350759 ) ) ( not ( = ?auto_350758 ?auto_350760 ) ) ( not ( = ?auto_350758 ?auto_350761 ) ) ( not ( = ?auto_350758 ?auto_350762 ) ) ( not ( = ?auto_350758 ?auto_350763 ) ) ( not ( = ?auto_350759 ?auto_350760 ) ) ( not ( = ?auto_350759 ?auto_350761 ) ) ( not ( = ?auto_350759 ?auto_350762 ) ) ( not ( = ?auto_350759 ?auto_350763 ) ) ( not ( = ?auto_350760 ?auto_350761 ) ) ( not ( = ?auto_350760 ?auto_350762 ) ) ( not ( = ?auto_350760 ?auto_350763 ) ) ( not ( = ?auto_350761 ?auto_350762 ) ) ( not ( = ?auto_350761 ?auto_350763 ) ) ( not ( = ?auto_350762 ?auto_350763 ) ) ( ON ?auto_350761 ?auto_350762 ) ( ON ?auto_350760 ?auto_350761 ) ( ON ?auto_350759 ?auto_350760 ) ( CLEAR ?auto_350757 ) ( ON ?auto_350758 ?auto_350759 ) ( CLEAR ?auto_350758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_350750 ?auto_350751 ?auto_350752 ?auto_350753 ?auto_350754 ?auto_350755 ?auto_350756 ?auto_350757 ?auto_350758 )
      ( MAKE-13PILE ?auto_350750 ?auto_350751 ?auto_350752 ?auto_350753 ?auto_350754 ?auto_350755 ?auto_350756 ?auto_350757 ?auto_350758 ?auto_350759 ?auto_350760 ?auto_350761 ?auto_350762 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350777 - BLOCK
      ?auto_350778 - BLOCK
      ?auto_350779 - BLOCK
      ?auto_350780 - BLOCK
      ?auto_350781 - BLOCK
      ?auto_350782 - BLOCK
      ?auto_350783 - BLOCK
      ?auto_350784 - BLOCK
      ?auto_350785 - BLOCK
      ?auto_350786 - BLOCK
      ?auto_350787 - BLOCK
      ?auto_350788 - BLOCK
      ?auto_350789 - BLOCK
    )
    :vars
    (
      ?auto_350790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350789 ?auto_350790 ) ( ON-TABLE ?auto_350777 ) ( ON ?auto_350778 ?auto_350777 ) ( ON ?auto_350779 ?auto_350778 ) ( ON ?auto_350780 ?auto_350779 ) ( ON ?auto_350781 ?auto_350780 ) ( ON ?auto_350782 ?auto_350781 ) ( ON ?auto_350783 ?auto_350782 ) ( ON ?auto_350784 ?auto_350783 ) ( not ( = ?auto_350777 ?auto_350778 ) ) ( not ( = ?auto_350777 ?auto_350779 ) ) ( not ( = ?auto_350777 ?auto_350780 ) ) ( not ( = ?auto_350777 ?auto_350781 ) ) ( not ( = ?auto_350777 ?auto_350782 ) ) ( not ( = ?auto_350777 ?auto_350783 ) ) ( not ( = ?auto_350777 ?auto_350784 ) ) ( not ( = ?auto_350777 ?auto_350785 ) ) ( not ( = ?auto_350777 ?auto_350786 ) ) ( not ( = ?auto_350777 ?auto_350787 ) ) ( not ( = ?auto_350777 ?auto_350788 ) ) ( not ( = ?auto_350777 ?auto_350789 ) ) ( not ( = ?auto_350777 ?auto_350790 ) ) ( not ( = ?auto_350778 ?auto_350779 ) ) ( not ( = ?auto_350778 ?auto_350780 ) ) ( not ( = ?auto_350778 ?auto_350781 ) ) ( not ( = ?auto_350778 ?auto_350782 ) ) ( not ( = ?auto_350778 ?auto_350783 ) ) ( not ( = ?auto_350778 ?auto_350784 ) ) ( not ( = ?auto_350778 ?auto_350785 ) ) ( not ( = ?auto_350778 ?auto_350786 ) ) ( not ( = ?auto_350778 ?auto_350787 ) ) ( not ( = ?auto_350778 ?auto_350788 ) ) ( not ( = ?auto_350778 ?auto_350789 ) ) ( not ( = ?auto_350778 ?auto_350790 ) ) ( not ( = ?auto_350779 ?auto_350780 ) ) ( not ( = ?auto_350779 ?auto_350781 ) ) ( not ( = ?auto_350779 ?auto_350782 ) ) ( not ( = ?auto_350779 ?auto_350783 ) ) ( not ( = ?auto_350779 ?auto_350784 ) ) ( not ( = ?auto_350779 ?auto_350785 ) ) ( not ( = ?auto_350779 ?auto_350786 ) ) ( not ( = ?auto_350779 ?auto_350787 ) ) ( not ( = ?auto_350779 ?auto_350788 ) ) ( not ( = ?auto_350779 ?auto_350789 ) ) ( not ( = ?auto_350779 ?auto_350790 ) ) ( not ( = ?auto_350780 ?auto_350781 ) ) ( not ( = ?auto_350780 ?auto_350782 ) ) ( not ( = ?auto_350780 ?auto_350783 ) ) ( not ( = ?auto_350780 ?auto_350784 ) ) ( not ( = ?auto_350780 ?auto_350785 ) ) ( not ( = ?auto_350780 ?auto_350786 ) ) ( not ( = ?auto_350780 ?auto_350787 ) ) ( not ( = ?auto_350780 ?auto_350788 ) ) ( not ( = ?auto_350780 ?auto_350789 ) ) ( not ( = ?auto_350780 ?auto_350790 ) ) ( not ( = ?auto_350781 ?auto_350782 ) ) ( not ( = ?auto_350781 ?auto_350783 ) ) ( not ( = ?auto_350781 ?auto_350784 ) ) ( not ( = ?auto_350781 ?auto_350785 ) ) ( not ( = ?auto_350781 ?auto_350786 ) ) ( not ( = ?auto_350781 ?auto_350787 ) ) ( not ( = ?auto_350781 ?auto_350788 ) ) ( not ( = ?auto_350781 ?auto_350789 ) ) ( not ( = ?auto_350781 ?auto_350790 ) ) ( not ( = ?auto_350782 ?auto_350783 ) ) ( not ( = ?auto_350782 ?auto_350784 ) ) ( not ( = ?auto_350782 ?auto_350785 ) ) ( not ( = ?auto_350782 ?auto_350786 ) ) ( not ( = ?auto_350782 ?auto_350787 ) ) ( not ( = ?auto_350782 ?auto_350788 ) ) ( not ( = ?auto_350782 ?auto_350789 ) ) ( not ( = ?auto_350782 ?auto_350790 ) ) ( not ( = ?auto_350783 ?auto_350784 ) ) ( not ( = ?auto_350783 ?auto_350785 ) ) ( not ( = ?auto_350783 ?auto_350786 ) ) ( not ( = ?auto_350783 ?auto_350787 ) ) ( not ( = ?auto_350783 ?auto_350788 ) ) ( not ( = ?auto_350783 ?auto_350789 ) ) ( not ( = ?auto_350783 ?auto_350790 ) ) ( not ( = ?auto_350784 ?auto_350785 ) ) ( not ( = ?auto_350784 ?auto_350786 ) ) ( not ( = ?auto_350784 ?auto_350787 ) ) ( not ( = ?auto_350784 ?auto_350788 ) ) ( not ( = ?auto_350784 ?auto_350789 ) ) ( not ( = ?auto_350784 ?auto_350790 ) ) ( not ( = ?auto_350785 ?auto_350786 ) ) ( not ( = ?auto_350785 ?auto_350787 ) ) ( not ( = ?auto_350785 ?auto_350788 ) ) ( not ( = ?auto_350785 ?auto_350789 ) ) ( not ( = ?auto_350785 ?auto_350790 ) ) ( not ( = ?auto_350786 ?auto_350787 ) ) ( not ( = ?auto_350786 ?auto_350788 ) ) ( not ( = ?auto_350786 ?auto_350789 ) ) ( not ( = ?auto_350786 ?auto_350790 ) ) ( not ( = ?auto_350787 ?auto_350788 ) ) ( not ( = ?auto_350787 ?auto_350789 ) ) ( not ( = ?auto_350787 ?auto_350790 ) ) ( not ( = ?auto_350788 ?auto_350789 ) ) ( not ( = ?auto_350788 ?auto_350790 ) ) ( not ( = ?auto_350789 ?auto_350790 ) ) ( ON ?auto_350788 ?auto_350789 ) ( ON ?auto_350787 ?auto_350788 ) ( ON ?auto_350786 ?auto_350787 ) ( CLEAR ?auto_350784 ) ( ON ?auto_350785 ?auto_350786 ) ( CLEAR ?auto_350785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_350777 ?auto_350778 ?auto_350779 ?auto_350780 ?auto_350781 ?auto_350782 ?auto_350783 ?auto_350784 ?auto_350785 )
      ( MAKE-13PILE ?auto_350777 ?auto_350778 ?auto_350779 ?auto_350780 ?auto_350781 ?auto_350782 ?auto_350783 ?auto_350784 ?auto_350785 ?auto_350786 ?auto_350787 ?auto_350788 ?auto_350789 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350804 - BLOCK
      ?auto_350805 - BLOCK
      ?auto_350806 - BLOCK
      ?auto_350807 - BLOCK
      ?auto_350808 - BLOCK
      ?auto_350809 - BLOCK
      ?auto_350810 - BLOCK
      ?auto_350811 - BLOCK
      ?auto_350812 - BLOCK
      ?auto_350813 - BLOCK
      ?auto_350814 - BLOCK
      ?auto_350815 - BLOCK
      ?auto_350816 - BLOCK
    )
    :vars
    (
      ?auto_350817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350816 ?auto_350817 ) ( ON-TABLE ?auto_350804 ) ( ON ?auto_350805 ?auto_350804 ) ( ON ?auto_350806 ?auto_350805 ) ( ON ?auto_350807 ?auto_350806 ) ( ON ?auto_350808 ?auto_350807 ) ( ON ?auto_350809 ?auto_350808 ) ( ON ?auto_350810 ?auto_350809 ) ( not ( = ?auto_350804 ?auto_350805 ) ) ( not ( = ?auto_350804 ?auto_350806 ) ) ( not ( = ?auto_350804 ?auto_350807 ) ) ( not ( = ?auto_350804 ?auto_350808 ) ) ( not ( = ?auto_350804 ?auto_350809 ) ) ( not ( = ?auto_350804 ?auto_350810 ) ) ( not ( = ?auto_350804 ?auto_350811 ) ) ( not ( = ?auto_350804 ?auto_350812 ) ) ( not ( = ?auto_350804 ?auto_350813 ) ) ( not ( = ?auto_350804 ?auto_350814 ) ) ( not ( = ?auto_350804 ?auto_350815 ) ) ( not ( = ?auto_350804 ?auto_350816 ) ) ( not ( = ?auto_350804 ?auto_350817 ) ) ( not ( = ?auto_350805 ?auto_350806 ) ) ( not ( = ?auto_350805 ?auto_350807 ) ) ( not ( = ?auto_350805 ?auto_350808 ) ) ( not ( = ?auto_350805 ?auto_350809 ) ) ( not ( = ?auto_350805 ?auto_350810 ) ) ( not ( = ?auto_350805 ?auto_350811 ) ) ( not ( = ?auto_350805 ?auto_350812 ) ) ( not ( = ?auto_350805 ?auto_350813 ) ) ( not ( = ?auto_350805 ?auto_350814 ) ) ( not ( = ?auto_350805 ?auto_350815 ) ) ( not ( = ?auto_350805 ?auto_350816 ) ) ( not ( = ?auto_350805 ?auto_350817 ) ) ( not ( = ?auto_350806 ?auto_350807 ) ) ( not ( = ?auto_350806 ?auto_350808 ) ) ( not ( = ?auto_350806 ?auto_350809 ) ) ( not ( = ?auto_350806 ?auto_350810 ) ) ( not ( = ?auto_350806 ?auto_350811 ) ) ( not ( = ?auto_350806 ?auto_350812 ) ) ( not ( = ?auto_350806 ?auto_350813 ) ) ( not ( = ?auto_350806 ?auto_350814 ) ) ( not ( = ?auto_350806 ?auto_350815 ) ) ( not ( = ?auto_350806 ?auto_350816 ) ) ( not ( = ?auto_350806 ?auto_350817 ) ) ( not ( = ?auto_350807 ?auto_350808 ) ) ( not ( = ?auto_350807 ?auto_350809 ) ) ( not ( = ?auto_350807 ?auto_350810 ) ) ( not ( = ?auto_350807 ?auto_350811 ) ) ( not ( = ?auto_350807 ?auto_350812 ) ) ( not ( = ?auto_350807 ?auto_350813 ) ) ( not ( = ?auto_350807 ?auto_350814 ) ) ( not ( = ?auto_350807 ?auto_350815 ) ) ( not ( = ?auto_350807 ?auto_350816 ) ) ( not ( = ?auto_350807 ?auto_350817 ) ) ( not ( = ?auto_350808 ?auto_350809 ) ) ( not ( = ?auto_350808 ?auto_350810 ) ) ( not ( = ?auto_350808 ?auto_350811 ) ) ( not ( = ?auto_350808 ?auto_350812 ) ) ( not ( = ?auto_350808 ?auto_350813 ) ) ( not ( = ?auto_350808 ?auto_350814 ) ) ( not ( = ?auto_350808 ?auto_350815 ) ) ( not ( = ?auto_350808 ?auto_350816 ) ) ( not ( = ?auto_350808 ?auto_350817 ) ) ( not ( = ?auto_350809 ?auto_350810 ) ) ( not ( = ?auto_350809 ?auto_350811 ) ) ( not ( = ?auto_350809 ?auto_350812 ) ) ( not ( = ?auto_350809 ?auto_350813 ) ) ( not ( = ?auto_350809 ?auto_350814 ) ) ( not ( = ?auto_350809 ?auto_350815 ) ) ( not ( = ?auto_350809 ?auto_350816 ) ) ( not ( = ?auto_350809 ?auto_350817 ) ) ( not ( = ?auto_350810 ?auto_350811 ) ) ( not ( = ?auto_350810 ?auto_350812 ) ) ( not ( = ?auto_350810 ?auto_350813 ) ) ( not ( = ?auto_350810 ?auto_350814 ) ) ( not ( = ?auto_350810 ?auto_350815 ) ) ( not ( = ?auto_350810 ?auto_350816 ) ) ( not ( = ?auto_350810 ?auto_350817 ) ) ( not ( = ?auto_350811 ?auto_350812 ) ) ( not ( = ?auto_350811 ?auto_350813 ) ) ( not ( = ?auto_350811 ?auto_350814 ) ) ( not ( = ?auto_350811 ?auto_350815 ) ) ( not ( = ?auto_350811 ?auto_350816 ) ) ( not ( = ?auto_350811 ?auto_350817 ) ) ( not ( = ?auto_350812 ?auto_350813 ) ) ( not ( = ?auto_350812 ?auto_350814 ) ) ( not ( = ?auto_350812 ?auto_350815 ) ) ( not ( = ?auto_350812 ?auto_350816 ) ) ( not ( = ?auto_350812 ?auto_350817 ) ) ( not ( = ?auto_350813 ?auto_350814 ) ) ( not ( = ?auto_350813 ?auto_350815 ) ) ( not ( = ?auto_350813 ?auto_350816 ) ) ( not ( = ?auto_350813 ?auto_350817 ) ) ( not ( = ?auto_350814 ?auto_350815 ) ) ( not ( = ?auto_350814 ?auto_350816 ) ) ( not ( = ?auto_350814 ?auto_350817 ) ) ( not ( = ?auto_350815 ?auto_350816 ) ) ( not ( = ?auto_350815 ?auto_350817 ) ) ( not ( = ?auto_350816 ?auto_350817 ) ) ( ON ?auto_350815 ?auto_350816 ) ( ON ?auto_350814 ?auto_350815 ) ( ON ?auto_350813 ?auto_350814 ) ( ON ?auto_350812 ?auto_350813 ) ( CLEAR ?auto_350810 ) ( ON ?auto_350811 ?auto_350812 ) ( CLEAR ?auto_350811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_350804 ?auto_350805 ?auto_350806 ?auto_350807 ?auto_350808 ?auto_350809 ?auto_350810 ?auto_350811 )
      ( MAKE-13PILE ?auto_350804 ?auto_350805 ?auto_350806 ?auto_350807 ?auto_350808 ?auto_350809 ?auto_350810 ?auto_350811 ?auto_350812 ?auto_350813 ?auto_350814 ?auto_350815 ?auto_350816 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350831 - BLOCK
      ?auto_350832 - BLOCK
      ?auto_350833 - BLOCK
      ?auto_350834 - BLOCK
      ?auto_350835 - BLOCK
      ?auto_350836 - BLOCK
      ?auto_350837 - BLOCK
      ?auto_350838 - BLOCK
      ?auto_350839 - BLOCK
      ?auto_350840 - BLOCK
      ?auto_350841 - BLOCK
      ?auto_350842 - BLOCK
      ?auto_350843 - BLOCK
    )
    :vars
    (
      ?auto_350844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350843 ?auto_350844 ) ( ON-TABLE ?auto_350831 ) ( ON ?auto_350832 ?auto_350831 ) ( ON ?auto_350833 ?auto_350832 ) ( ON ?auto_350834 ?auto_350833 ) ( ON ?auto_350835 ?auto_350834 ) ( ON ?auto_350836 ?auto_350835 ) ( ON ?auto_350837 ?auto_350836 ) ( not ( = ?auto_350831 ?auto_350832 ) ) ( not ( = ?auto_350831 ?auto_350833 ) ) ( not ( = ?auto_350831 ?auto_350834 ) ) ( not ( = ?auto_350831 ?auto_350835 ) ) ( not ( = ?auto_350831 ?auto_350836 ) ) ( not ( = ?auto_350831 ?auto_350837 ) ) ( not ( = ?auto_350831 ?auto_350838 ) ) ( not ( = ?auto_350831 ?auto_350839 ) ) ( not ( = ?auto_350831 ?auto_350840 ) ) ( not ( = ?auto_350831 ?auto_350841 ) ) ( not ( = ?auto_350831 ?auto_350842 ) ) ( not ( = ?auto_350831 ?auto_350843 ) ) ( not ( = ?auto_350831 ?auto_350844 ) ) ( not ( = ?auto_350832 ?auto_350833 ) ) ( not ( = ?auto_350832 ?auto_350834 ) ) ( not ( = ?auto_350832 ?auto_350835 ) ) ( not ( = ?auto_350832 ?auto_350836 ) ) ( not ( = ?auto_350832 ?auto_350837 ) ) ( not ( = ?auto_350832 ?auto_350838 ) ) ( not ( = ?auto_350832 ?auto_350839 ) ) ( not ( = ?auto_350832 ?auto_350840 ) ) ( not ( = ?auto_350832 ?auto_350841 ) ) ( not ( = ?auto_350832 ?auto_350842 ) ) ( not ( = ?auto_350832 ?auto_350843 ) ) ( not ( = ?auto_350832 ?auto_350844 ) ) ( not ( = ?auto_350833 ?auto_350834 ) ) ( not ( = ?auto_350833 ?auto_350835 ) ) ( not ( = ?auto_350833 ?auto_350836 ) ) ( not ( = ?auto_350833 ?auto_350837 ) ) ( not ( = ?auto_350833 ?auto_350838 ) ) ( not ( = ?auto_350833 ?auto_350839 ) ) ( not ( = ?auto_350833 ?auto_350840 ) ) ( not ( = ?auto_350833 ?auto_350841 ) ) ( not ( = ?auto_350833 ?auto_350842 ) ) ( not ( = ?auto_350833 ?auto_350843 ) ) ( not ( = ?auto_350833 ?auto_350844 ) ) ( not ( = ?auto_350834 ?auto_350835 ) ) ( not ( = ?auto_350834 ?auto_350836 ) ) ( not ( = ?auto_350834 ?auto_350837 ) ) ( not ( = ?auto_350834 ?auto_350838 ) ) ( not ( = ?auto_350834 ?auto_350839 ) ) ( not ( = ?auto_350834 ?auto_350840 ) ) ( not ( = ?auto_350834 ?auto_350841 ) ) ( not ( = ?auto_350834 ?auto_350842 ) ) ( not ( = ?auto_350834 ?auto_350843 ) ) ( not ( = ?auto_350834 ?auto_350844 ) ) ( not ( = ?auto_350835 ?auto_350836 ) ) ( not ( = ?auto_350835 ?auto_350837 ) ) ( not ( = ?auto_350835 ?auto_350838 ) ) ( not ( = ?auto_350835 ?auto_350839 ) ) ( not ( = ?auto_350835 ?auto_350840 ) ) ( not ( = ?auto_350835 ?auto_350841 ) ) ( not ( = ?auto_350835 ?auto_350842 ) ) ( not ( = ?auto_350835 ?auto_350843 ) ) ( not ( = ?auto_350835 ?auto_350844 ) ) ( not ( = ?auto_350836 ?auto_350837 ) ) ( not ( = ?auto_350836 ?auto_350838 ) ) ( not ( = ?auto_350836 ?auto_350839 ) ) ( not ( = ?auto_350836 ?auto_350840 ) ) ( not ( = ?auto_350836 ?auto_350841 ) ) ( not ( = ?auto_350836 ?auto_350842 ) ) ( not ( = ?auto_350836 ?auto_350843 ) ) ( not ( = ?auto_350836 ?auto_350844 ) ) ( not ( = ?auto_350837 ?auto_350838 ) ) ( not ( = ?auto_350837 ?auto_350839 ) ) ( not ( = ?auto_350837 ?auto_350840 ) ) ( not ( = ?auto_350837 ?auto_350841 ) ) ( not ( = ?auto_350837 ?auto_350842 ) ) ( not ( = ?auto_350837 ?auto_350843 ) ) ( not ( = ?auto_350837 ?auto_350844 ) ) ( not ( = ?auto_350838 ?auto_350839 ) ) ( not ( = ?auto_350838 ?auto_350840 ) ) ( not ( = ?auto_350838 ?auto_350841 ) ) ( not ( = ?auto_350838 ?auto_350842 ) ) ( not ( = ?auto_350838 ?auto_350843 ) ) ( not ( = ?auto_350838 ?auto_350844 ) ) ( not ( = ?auto_350839 ?auto_350840 ) ) ( not ( = ?auto_350839 ?auto_350841 ) ) ( not ( = ?auto_350839 ?auto_350842 ) ) ( not ( = ?auto_350839 ?auto_350843 ) ) ( not ( = ?auto_350839 ?auto_350844 ) ) ( not ( = ?auto_350840 ?auto_350841 ) ) ( not ( = ?auto_350840 ?auto_350842 ) ) ( not ( = ?auto_350840 ?auto_350843 ) ) ( not ( = ?auto_350840 ?auto_350844 ) ) ( not ( = ?auto_350841 ?auto_350842 ) ) ( not ( = ?auto_350841 ?auto_350843 ) ) ( not ( = ?auto_350841 ?auto_350844 ) ) ( not ( = ?auto_350842 ?auto_350843 ) ) ( not ( = ?auto_350842 ?auto_350844 ) ) ( not ( = ?auto_350843 ?auto_350844 ) ) ( ON ?auto_350842 ?auto_350843 ) ( ON ?auto_350841 ?auto_350842 ) ( ON ?auto_350840 ?auto_350841 ) ( ON ?auto_350839 ?auto_350840 ) ( CLEAR ?auto_350837 ) ( ON ?auto_350838 ?auto_350839 ) ( CLEAR ?auto_350838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_350831 ?auto_350832 ?auto_350833 ?auto_350834 ?auto_350835 ?auto_350836 ?auto_350837 ?auto_350838 )
      ( MAKE-13PILE ?auto_350831 ?auto_350832 ?auto_350833 ?auto_350834 ?auto_350835 ?auto_350836 ?auto_350837 ?auto_350838 ?auto_350839 ?auto_350840 ?auto_350841 ?auto_350842 ?auto_350843 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350858 - BLOCK
      ?auto_350859 - BLOCK
      ?auto_350860 - BLOCK
      ?auto_350861 - BLOCK
      ?auto_350862 - BLOCK
      ?auto_350863 - BLOCK
      ?auto_350864 - BLOCK
      ?auto_350865 - BLOCK
      ?auto_350866 - BLOCK
      ?auto_350867 - BLOCK
      ?auto_350868 - BLOCK
      ?auto_350869 - BLOCK
      ?auto_350870 - BLOCK
    )
    :vars
    (
      ?auto_350871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350870 ?auto_350871 ) ( ON-TABLE ?auto_350858 ) ( ON ?auto_350859 ?auto_350858 ) ( ON ?auto_350860 ?auto_350859 ) ( ON ?auto_350861 ?auto_350860 ) ( ON ?auto_350862 ?auto_350861 ) ( ON ?auto_350863 ?auto_350862 ) ( not ( = ?auto_350858 ?auto_350859 ) ) ( not ( = ?auto_350858 ?auto_350860 ) ) ( not ( = ?auto_350858 ?auto_350861 ) ) ( not ( = ?auto_350858 ?auto_350862 ) ) ( not ( = ?auto_350858 ?auto_350863 ) ) ( not ( = ?auto_350858 ?auto_350864 ) ) ( not ( = ?auto_350858 ?auto_350865 ) ) ( not ( = ?auto_350858 ?auto_350866 ) ) ( not ( = ?auto_350858 ?auto_350867 ) ) ( not ( = ?auto_350858 ?auto_350868 ) ) ( not ( = ?auto_350858 ?auto_350869 ) ) ( not ( = ?auto_350858 ?auto_350870 ) ) ( not ( = ?auto_350858 ?auto_350871 ) ) ( not ( = ?auto_350859 ?auto_350860 ) ) ( not ( = ?auto_350859 ?auto_350861 ) ) ( not ( = ?auto_350859 ?auto_350862 ) ) ( not ( = ?auto_350859 ?auto_350863 ) ) ( not ( = ?auto_350859 ?auto_350864 ) ) ( not ( = ?auto_350859 ?auto_350865 ) ) ( not ( = ?auto_350859 ?auto_350866 ) ) ( not ( = ?auto_350859 ?auto_350867 ) ) ( not ( = ?auto_350859 ?auto_350868 ) ) ( not ( = ?auto_350859 ?auto_350869 ) ) ( not ( = ?auto_350859 ?auto_350870 ) ) ( not ( = ?auto_350859 ?auto_350871 ) ) ( not ( = ?auto_350860 ?auto_350861 ) ) ( not ( = ?auto_350860 ?auto_350862 ) ) ( not ( = ?auto_350860 ?auto_350863 ) ) ( not ( = ?auto_350860 ?auto_350864 ) ) ( not ( = ?auto_350860 ?auto_350865 ) ) ( not ( = ?auto_350860 ?auto_350866 ) ) ( not ( = ?auto_350860 ?auto_350867 ) ) ( not ( = ?auto_350860 ?auto_350868 ) ) ( not ( = ?auto_350860 ?auto_350869 ) ) ( not ( = ?auto_350860 ?auto_350870 ) ) ( not ( = ?auto_350860 ?auto_350871 ) ) ( not ( = ?auto_350861 ?auto_350862 ) ) ( not ( = ?auto_350861 ?auto_350863 ) ) ( not ( = ?auto_350861 ?auto_350864 ) ) ( not ( = ?auto_350861 ?auto_350865 ) ) ( not ( = ?auto_350861 ?auto_350866 ) ) ( not ( = ?auto_350861 ?auto_350867 ) ) ( not ( = ?auto_350861 ?auto_350868 ) ) ( not ( = ?auto_350861 ?auto_350869 ) ) ( not ( = ?auto_350861 ?auto_350870 ) ) ( not ( = ?auto_350861 ?auto_350871 ) ) ( not ( = ?auto_350862 ?auto_350863 ) ) ( not ( = ?auto_350862 ?auto_350864 ) ) ( not ( = ?auto_350862 ?auto_350865 ) ) ( not ( = ?auto_350862 ?auto_350866 ) ) ( not ( = ?auto_350862 ?auto_350867 ) ) ( not ( = ?auto_350862 ?auto_350868 ) ) ( not ( = ?auto_350862 ?auto_350869 ) ) ( not ( = ?auto_350862 ?auto_350870 ) ) ( not ( = ?auto_350862 ?auto_350871 ) ) ( not ( = ?auto_350863 ?auto_350864 ) ) ( not ( = ?auto_350863 ?auto_350865 ) ) ( not ( = ?auto_350863 ?auto_350866 ) ) ( not ( = ?auto_350863 ?auto_350867 ) ) ( not ( = ?auto_350863 ?auto_350868 ) ) ( not ( = ?auto_350863 ?auto_350869 ) ) ( not ( = ?auto_350863 ?auto_350870 ) ) ( not ( = ?auto_350863 ?auto_350871 ) ) ( not ( = ?auto_350864 ?auto_350865 ) ) ( not ( = ?auto_350864 ?auto_350866 ) ) ( not ( = ?auto_350864 ?auto_350867 ) ) ( not ( = ?auto_350864 ?auto_350868 ) ) ( not ( = ?auto_350864 ?auto_350869 ) ) ( not ( = ?auto_350864 ?auto_350870 ) ) ( not ( = ?auto_350864 ?auto_350871 ) ) ( not ( = ?auto_350865 ?auto_350866 ) ) ( not ( = ?auto_350865 ?auto_350867 ) ) ( not ( = ?auto_350865 ?auto_350868 ) ) ( not ( = ?auto_350865 ?auto_350869 ) ) ( not ( = ?auto_350865 ?auto_350870 ) ) ( not ( = ?auto_350865 ?auto_350871 ) ) ( not ( = ?auto_350866 ?auto_350867 ) ) ( not ( = ?auto_350866 ?auto_350868 ) ) ( not ( = ?auto_350866 ?auto_350869 ) ) ( not ( = ?auto_350866 ?auto_350870 ) ) ( not ( = ?auto_350866 ?auto_350871 ) ) ( not ( = ?auto_350867 ?auto_350868 ) ) ( not ( = ?auto_350867 ?auto_350869 ) ) ( not ( = ?auto_350867 ?auto_350870 ) ) ( not ( = ?auto_350867 ?auto_350871 ) ) ( not ( = ?auto_350868 ?auto_350869 ) ) ( not ( = ?auto_350868 ?auto_350870 ) ) ( not ( = ?auto_350868 ?auto_350871 ) ) ( not ( = ?auto_350869 ?auto_350870 ) ) ( not ( = ?auto_350869 ?auto_350871 ) ) ( not ( = ?auto_350870 ?auto_350871 ) ) ( ON ?auto_350869 ?auto_350870 ) ( ON ?auto_350868 ?auto_350869 ) ( ON ?auto_350867 ?auto_350868 ) ( ON ?auto_350866 ?auto_350867 ) ( ON ?auto_350865 ?auto_350866 ) ( CLEAR ?auto_350863 ) ( ON ?auto_350864 ?auto_350865 ) ( CLEAR ?auto_350864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_350858 ?auto_350859 ?auto_350860 ?auto_350861 ?auto_350862 ?auto_350863 ?auto_350864 )
      ( MAKE-13PILE ?auto_350858 ?auto_350859 ?auto_350860 ?auto_350861 ?auto_350862 ?auto_350863 ?auto_350864 ?auto_350865 ?auto_350866 ?auto_350867 ?auto_350868 ?auto_350869 ?auto_350870 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350885 - BLOCK
      ?auto_350886 - BLOCK
      ?auto_350887 - BLOCK
      ?auto_350888 - BLOCK
      ?auto_350889 - BLOCK
      ?auto_350890 - BLOCK
      ?auto_350891 - BLOCK
      ?auto_350892 - BLOCK
      ?auto_350893 - BLOCK
      ?auto_350894 - BLOCK
      ?auto_350895 - BLOCK
      ?auto_350896 - BLOCK
      ?auto_350897 - BLOCK
    )
    :vars
    (
      ?auto_350898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350897 ?auto_350898 ) ( ON-TABLE ?auto_350885 ) ( ON ?auto_350886 ?auto_350885 ) ( ON ?auto_350887 ?auto_350886 ) ( ON ?auto_350888 ?auto_350887 ) ( ON ?auto_350889 ?auto_350888 ) ( ON ?auto_350890 ?auto_350889 ) ( not ( = ?auto_350885 ?auto_350886 ) ) ( not ( = ?auto_350885 ?auto_350887 ) ) ( not ( = ?auto_350885 ?auto_350888 ) ) ( not ( = ?auto_350885 ?auto_350889 ) ) ( not ( = ?auto_350885 ?auto_350890 ) ) ( not ( = ?auto_350885 ?auto_350891 ) ) ( not ( = ?auto_350885 ?auto_350892 ) ) ( not ( = ?auto_350885 ?auto_350893 ) ) ( not ( = ?auto_350885 ?auto_350894 ) ) ( not ( = ?auto_350885 ?auto_350895 ) ) ( not ( = ?auto_350885 ?auto_350896 ) ) ( not ( = ?auto_350885 ?auto_350897 ) ) ( not ( = ?auto_350885 ?auto_350898 ) ) ( not ( = ?auto_350886 ?auto_350887 ) ) ( not ( = ?auto_350886 ?auto_350888 ) ) ( not ( = ?auto_350886 ?auto_350889 ) ) ( not ( = ?auto_350886 ?auto_350890 ) ) ( not ( = ?auto_350886 ?auto_350891 ) ) ( not ( = ?auto_350886 ?auto_350892 ) ) ( not ( = ?auto_350886 ?auto_350893 ) ) ( not ( = ?auto_350886 ?auto_350894 ) ) ( not ( = ?auto_350886 ?auto_350895 ) ) ( not ( = ?auto_350886 ?auto_350896 ) ) ( not ( = ?auto_350886 ?auto_350897 ) ) ( not ( = ?auto_350886 ?auto_350898 ) ) ( not ( = ?auto_350887 ?auto_350888 ) ) ( not ( = ?auto_350887 ?auto_350889 ) ) ( not ( = ?auto_350887 ?auto_350890 ) ) ( not ( = ?auto_350887 ?auto_350891 ) ) ( not ( = ?auto_350887 ?auto_350892 ) ) ( not ( = ?auto_350887 ?auto_350893 ) ) ( not ( = ?auto_350887 ?auto_350894 ) ) ( not ( = ?auto_350887 ?auto_350895 ) ) ( not ( = ?auto_350887 ?auto_350896 ) ) ( not ( = ?auto_350887 ?auto_350897 ) ) ( not ( = ?auto_350887 ?auto_350898 ) ) ( not ( = ?auto_350888 ?auto_350889 ) ) ( not ( = ?auto_350888 ?auto_350890 ) ) ( not ( = ?auto_350888 ?auto_350891 ) ) ( not ( = ?auto_350888 ?auto_350892 ) ) ( not ( = ?auto_350888 ?auto_350893 ) ) ( not ( = ?auto_350888 ?auto_350894 ) ) ( not ( = ?auto_350888 ?auto_350895 ) ) ( not ( = ?auto_350888 ?auto_350896 ) ) ( not ( = ?auto_350888 ?auto_350897 ) ) ( not ( = ?auto_350888 ?auto_350898 ) ) ( not ( = ?auto_350889 ?auto_350890 ) ) ( not ( = ?auto_350889 ?auto_350891 ) ) ( not ( = ?auto_350889 ?auto_350892 ) ) ( not ( = ?auto_350889 ?auto_350893 ) ) ( not ( = ?auto_350889 ?auto_350894 ) ) ( not ( = ?auto_350889 ?auto_350895 ) ) ( not ( = ?auto_350889 ?auto_350896 ) ) ( not ( = ?auto_350889 ?auto_350897 ) ) ( not ( = ?auto_350889 ?auto_350898 ) ) ( not ( = ?auto_350890 ?auto_350891 ) ) ( not ( = ?auto_350890 ?auto_350892 ) ) ( not ( = ?auto_350890 ?auto_350893 ) ) ( not ( = ?auto_350890 ?auto_350894 ) ) ( not ( = ?auto_350890 ?auto_350895 ) ) ( not ( = ?auto_350890 ?auto_350896 ) ) ( not ( = ?auto_350890 ?auto_350897 ) ) ( not ( = ?auto_350890 ?auto_350898 ) ) ( not ( = ?auto_350891 ?auto_350892 ) ) ( not ( = ?auto_350891 ?auto_350893 ) ) ( not ( = ?auto_350891 ?auto_350894 ) ) ( not ( = ?auto_350891 ?auto_350895 ) ) ( not ( = ?auto_350891 ?auto_350896 ) ) ( not ( = ?auto_350891 ?auto_350897 ) ) ( not ( = ?auto_350891 ?auto_350898 ) ) ( not ( = ?auto_350892 ?auto_350893 ) ) ( not ( = ?auto_350892 ?auto_350894 ) ) ( not ( = ?auto_350892 ?auto_350895 ) ) ( not ( = ?auto_350892 ?auto_350896 ) ) ( not ( = ?auto_350892 ?auto_350897 ) ) ( not ( = ?auto_350892 ?auto_350898 ) ) ( not ( = ?auto_350893 ?auto_350894 ) ) ( not ( = ?auto_350893 ?auto_350895 ) ) ( not ( = ?auto_350893 ?auto_350896 ) ) ( not ( = ?auto_350893 ?auto_350897 ) ) ( not ( = ?auto_350893 ?auto_350898 ) ) ( not ( = ?auto_350894 ?auto_350895 ) ) ( not ( = ?auto_350894 ?auto_350896 ) ) ( not ( = ?auto_350894 ?auto_350897 ) ) ( not ( = ?auto_350894 ?auto_350898 ) ) ( not ( = ?auto_350895 ?auto_350896 ) ) ( not ( = ?auto_350895 ?auto_350897 ) ) ( not ( = ?auto_350895 ?auto_350898 ) ) ( not ( = ?auto_350896 ?auto_350897 ) ) ( not ( = ?auto_350896 ?auto_350898 ) ) ( not ( = ?auto_350897 ?auto_350898 ) ) ( ON ?auto_350896 ?auto_350897 ) ( ON ?auto_350895 ?auto_350896 ) ( ON ?auto_350894 ?auto_350895 ) ( ON ?auto_350893 ?auto_350894 ) ( ON ?auto_350892 ?auto_350893 ) ( CLEAR ?auto_350890 ) ( ON ?auto_350891 ?auto_350892 ) ( CLEAR ?auto_350891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_350885 ?auto_350886 ?auto_350887 ?auto_350888 ?auto_350889 ?auto_350890 ?auto_350891 )
      ( MAKE-13PILE ?auto_350885 ?auto_350886 ?auto_350887 ?auto_350888 ?auto_350889 ?auto_350890 ?auto_350891 ?auto_350892 ?auto_350893 ?auto_350894 ?auto_350895 ?auto_350896 ?auto_350897 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350912 - BLOCK
      ?auto_350913 - BLOCK
      ?auto_350914 - BLOCK
      ?auto_350915 - BLOCK
      ?auto_350916 - BLOCK
      ?auto_350917 - BLOCK
      ?auto_350918 - BLOCK
      ?auto_350919 - BLOCK
      ?auto_350920 - BLOCK
      ?auto_350921 - BLOCK
      ?auto_350922 - BLOCK
      ?auto_350923 - BLOCK
      ?auto_350924 - BLOCK
    )
    :vars
    (
      ?auto_350925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350924 ?auto_350925 ) ( ON-TABLE ?auto_350912 ) ( ON ?auto_350913 ?auto_350912 ) ( ON ?auto_350914 ?auto_350913 ) ( ON ?auto_350915 ?auto_350914 ) ( ON ?auto_350916 ?auto_350915 ) ( not ( = ?auto_350912 ?auto_350913 ) ) ( not ( = ?auto_350912 ?auto_350914 ) ) ( not ( = ?auto_350912 ?auto_350915 ) ) ( not ( = ?auto_350912 ?auto_350916 ) ) ( not ( = ?auto_350912 ?auto_350917 ) ) ( not ( = ?auto_350912 ?auto_350918 ) ) ( not ( = ?auto_350912 ?auto_350919 ) ) ( not ( = ?auto_350912 ?auto_350920 ) ) ( not ( = ?auto_350912 ?auto_350921 ) ) ( not ( = ?auto_350912 ?auto_350922 ) ) ( not ( = ?auto_350912 ?auto_350923 ) ) ( not ( = ?auto_350912 ?auto_350924 ) ) ( not ( = ?auto_350912 ?auto_350925 ) ) ( not ( = ?auto_350913 ?auto_350914 ) ) ( not ( = ?auto_350913 ?auto_350915 ) ) ( not ( = ?auto_350913 ?auto_350916 ) ) ( not ( = ?auto_350913 ?auto_350917 ) ) ( not ( = ?auto_350913 ?auto_350918 ) ) ( not ( = ?auto_350913 ?auto_350919 ) ) ( not ( = ?auto_350913 ?auto_350920 ) ) ( not ( = ?auto_350913 ?auto_350921 ) ) ( not ( = ?auto_350913 ?auto_350922 ) ) ( not ( = ?auto_350913 ?auto_350923 ) ) ( not ( = ?auto_350913 ?auto_350924 ) ) ( not ( = ?auto_350913 ?auto_350925 ) ) ( not ( = ?auto_350914 ?auto_350915 ) ) ( not ( = ?auto_350914 ?auto_350916 ) ) ( not ( = ?auto_350914 ?auto_350917 ) ) ( not ( = ?auto_350914 ?auto_350918 ) ) ( not ( = ?auto_350914 ?auto_350919 ) ) ( not ( = ?auto_350914 ?auto_350920 ) ) ( not ( = ?auto_350914 ?auto_350921 ) ) ( not ( = ?auto_350914 ?auto_350922 ) ) ( not ( = ?auto_350914 ?auto_350923 ) ) ( not ( = ?auto_350914 ?auto_350924 ) ) ( not ( = ?auto_350914 ?auto_350925 ) ) ( not ( = ?auto_350915 ?auto_350916 ) ) ( not ( = ?auto_350915 ?auto_350917 ) ) ( not ( = ?auto_350915 ?auto_350918 ) ) ( not ( = ?auto_350915 ?auto_350919 ) ) ( not ( = ?auto_350915 ?auto_350920 ) ) ( not ( = ?auto_350915 ?auto_350921 ) ) ( not ( = ?auto_350915 ?auto_350922 ) ) ( not ( = ?auto_350915 ?auto_350923 ) ) ( not ( = ?auto_350915 ?auto_350924 ) ) ( not ( = ?auto_350915 ?auto_350925 ) ) ( not ( = ?auto_350916 ?auto_350917 ) ) ( not ( = ?auto_350916 ?auto_350918 ) ) ( not ( = ?auto_350916 ?auto_350919 ) ) ( not ( = ?auto_350916 ?auto_350920 ) ) ( not ( = ?auto_350916 ?auto_350921 ) ) ( not ( = ?auto_350916 ?auto_350922 ) ) ( not ( = ?auto_350916 ?auto_350923 ) ) ( not ( = ?auto_350916 ?auto_350924 ) ) ( not ( = ?auto_350916 ?auto_350925 ) ) ( not ( = ?auto_350917 ?auto_350918 ) ) ( not ( = ?auto_350917 ?auto_350919 ) ) ( not ( = ?auto_350917 ?auto_350920 ) ) ( not ( = ?auto_350917 ?auto_350921 ) ) ( not ( = ?auto_350917 ?auto_350922 ) ) ( not ( = ?auto_350917 ?auto_350923 ) ) ( not ( = ?auto_350917 ?auto_350924 ) ) ( not ( = ?auto_350917 ?auto_350925 ) ) ( not ( = ?auto_350918 ?auto_350919 ) ) ( not ( = ?auto_350918 ?auto_350920 ) ) ( not ( = ?auto_350918 ?auto_350921 ) ) ( not ( = ?auto_350918 ?auto_350922 ) ) ( not ( = ?auto_350918 ?auto_350923 ) ) ( not ( = ?auto_350918 ?auto_350924 ) ) ( not ( = ?auto_350918 ?auto_350925 ) ) ( not ( = ?auto_350919 ?auto_350920 ) ) ( not ( = ?auto_350919 ?auto_350921 ) ) ( not ( = ?auto_350919 ?auto_350922 ) ) ( not ( = ?auto_350919 ?auto_350923 ) ) ( not ( = ?auto_350919 ?auto_350924 ) ) ( not ( = ?auto_350919 ?auto_350925 ) ) ( not ( = ?auto_350920 ?auto_350921 ) ) ( not ( = ?auto_350920 ?auto_350922 ) ) ( not ( = ?auto_350920 ?auto_350923 ) ) ( not ( = ?auto_350920 ?auto_350924 ) ) ( not ( = ?auto_350920 ?auto_350925 ) ) ( not ( = ?auto_350921 ?auto_350922 ) ) ( not ( = ?auto_350921 ?auto_350923 ) ) ( not ( = ?auto_350921 ?auto_350924 ) ) ( not ( = ?auto_350921 ?auto_350925 ) ) ( not ( = ?auto_350922 ?auto_350923 ) ) ( not ( = ?auto_350922 ?auto_350924 ) ) ( not ( = ?auto_350922 ?auto_350925 ) ) ( not ( = ?auto_350923 ?auto_350924 ) ) ( not ( = ?auto_350923 ?auto_350925 ) ) ( not ( = ?auto_350924 ?auto_350925 ) ) ( ON ?auto_350923 ?auto_350924 ) ( ON ?auto_350922 ?auto_350923 ) ( ON ?auto_350921 ?auto_350922 ) ( ON ?auto_350920 ?auto_350921 ) ( ON ?auto_350919 ?auto_350920 ) ( ON ?auto_350918 ?auto_350919 ) ( CLEAR ?auto_350916 ) ( ON ?auto_350917 ?auto_350918 ) ( CLEAR ?auto_350917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_350912 ?auto_350913 ?auto_350914 ?auto_350915 ?auto_350916 ?auto_350917 )
      ( MAKE-13PILE ?auto_350912 ?auto_350913 ?auto_350914 ?auto_350915 ?auto_350916 ?auto_350917 ?auto_350918 ?auto_350919 ?auto_350920 ?auto_350921 ?auto_350922 ?auto_350923 ?auto_350924 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350939 - BLOCK
      ?auto_350940 - BLOCK
      ?auto_350941 - BLOCK
      ?auto_350942 - BLOCK
      ?auto_350943 - BLOCK
      ?auto_350944 - BLOCK
      ?auto_350945 - BLOCK
      ?auto_350946 - BLOCK
      ?auto_350947 - BLOCK
      ?auto_350948 - BLOCK
      ?auto_350949 - BLOCK
      ?auto_350950 - BLOCK
      ?auto_350951 - BLOCK
    )
    :vars
    (
      ?auto_350952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350951 ?auto_350952 ) ( ON-TABLE ?auto_350939 ) ( ON ?auto_350940 ?auto_350939 ) ( ON ?auto_350941 ?auto_350940 ) ( ON ?auto_350942 ?auto_350941 ) ( ON ?auto_350943 ?auto_350942 ) ( not ( = ?auto_350939 ?auto_350940 ) ) ( not ( = ?auto_350939 ?auto_350941 ) ) ( not ( = ?auto_350939 ?auto_350942 ) ) ( not ( = ?auto_350939 ?auto_350943 ) ) ( not ( = ?auto_350939 ?auto_350944 ) ) ( not ( = ?auto_350939 ?auto_350945 ) ) ( not ( = ?auto_350939 ?auto_350946 ) ) ( not ( = ?auto_350939 ?auto_350947 ) ) ( not ( = ?auto_350939 ?auto_350948 ) ) ( not ( = ?auto_350939 ?auto_350949 ) ) ( not ( = ?auto_350939 ?auto_350950 ) ) ( not ( = ?auto_350939 ?auto_350951 ) ) ( not ( = ?auto_350939 ?auto_350952 ) ) ( not ( = ?auto_350940 ?auto_350941 ) ) ( not ( = ?auto_350940 ?auto_350942 ) ) ( not ( = ?auto_350940 ?auto_350943 ) ) ( not ( = ?auto_350940 ?auto_350944 ) ) ( not ( = ?auto_350940 ?auto_350945 ) ) ( not ( = ?auto_350940 ?auto_350946 ) ) ( not ( = ?auto_350940 ?auto_350947 ) ) ( not ( = ?auto_350940 ?auto_350948 ) ) ( not ( = ?auto_350940 ?auto_350949 ) ) ( not ( = ?auto_350940 ?auto_350950 ) ) ( not ( = ?auto_350940 ?auto_350951 ) ) ( not ( = ?auto_350940 ?auto_350952 ) ) ( not ( = ?auto_350941 ?auto_350942 ) ) ( not ( = ?auto_350941 ?auto_350943 ) ) ( not ( = ?auto_350941 ?auto_350944 ) ) ( not ( = ?auto_350941 ?auto_350945 ) ) ( not ( = ?auto_350941 ?auto_350946 ) ) ( not ( = ?auto_350941 ?auto_350947 ) ) ( not ( = ?auto_350941 ?auto_350948 ) ) ( not ( = ?auto_350941 ?auto_350949 ) ) ( not ( = ?auto_350941 ?auto_350950 ) ) ( not ( = ?auto_350941 ?auto_350951 ) ) ( not ( = ?auto_350941 ?auto_350952 ) ) ( not ( = ?auto_350942 ?auto_350943 ) ) ( not ( = ?auto_350942 ?auto_350944 ) ) ( not ( = ?auto_350942 ?auto_350945 ) ) ( not ( = ?auto_350942 ?auto_350946 ) ) ( not ( = ?auto_350942 ?auto_350947 ) ) ( not ( = ?auto_350942 ?auto_350948 ) ) ( not ( = ?auto_350942 ?auto_350949 ) ) ( not ( = ?auto_350942 ?auto_350950 ) ) ( not ( = ?auto_350942 ?auto_350951 ) ) ( not ( = ?auto_350942 ?auto_350952 ) ) ( not ( = ?auto_350943 ?auto_350944 ) ) ( not ( = ?auto_350943 ?auto_350945 ) ) ( not ( = ?auto_350943 ?auto_350946 ) ) ( not ( = ?auto_350943 ?auto_350947 ) ) ( not ( = ?auto_350943 ?auto_350948 ) ) ( not ( = ?auto_350943 ?auto_350949 ) ) ( not ( = ?auto_350943 ?auto_350950 ) ) ( not ( = ?auto_350943 ?auto_350951 ) ) ( not ( = ?auto_350943 ?auto_350952 ) ) ( not ( = ?auto_350944 ?auto_350945 ) ) ( not ( = ?auto_350944 ?auto_350946 ) ) ( not ( = ?auto_350944 ?auto_350947 ) ) ( not ( = ?auto_350944 ?auto_350948 ) ) ( not ( = ?auto_350944 ?auto_350949 ) ) ( not ( = ?auto_350944 ?auto_350950 ) ) ( not ( = ?auto_350944 ?auto_350951 ) ) ( not ( = ?auto_350944 ?auto_350952 ) ) ( not ( = ?auto_350945 ?auto_350946 ) ) ( not ( = ?auto_350945 ?auto_350947 ) ) ( not ( = ?auto_350945 ?auto_350948 ) ) ( not ( = ?auto_350945 ?auto_350949 ) ) ( not ( = ?auto_350945 ?auto_350950 ) ) ( not ( = ?auto_350945 ?auto_350951 ) ) ( not ( = ?auto_350945 ?auto_350952 ) ) ( not ( = ?auto_350946 ?auto_350947 ) ) ( not ( = ?auto_350946 ?auto_350948 ) ) ( not ( = ?auto_350946 ?auto_350949 ) ) ( not ( = ?auto_350946 ?auto_350950 ) ) ( not ( = ?auto_350946 ?auto_350951 ) ) ( not ( = ?auto_350946 ?auto_350952 ) ) ( not ( = ?auto_350947 ?auto_350948 ) ) ( not ( = ?auto_350947 ?auto_350949 ) ) ( not ( = ?auto_350947 ?auto_350950 ) ) ( not ( = ?auto_350947 ?auto_350951 ) ) ( not ( = ?auto_350947 ?auto_350952 ) ) ( not ( = ?auto_350948 ?auto_350949 ) ) ( not ( = ?auto_350948 ?auto_350950 ) ) ( not ( = ?auto_350948 ?auto_350951 ) ) ( not ( = ?auto_350948 ?auto_350952 ) ) ( not ( = ?auto_350949 ?auto_350950 ) ) ( not ( = ?auto_350949 ?auto_350951 ) ) ( not ( = ?auto_350949 ?auto_350952 ) ) ( not ( = ?auto_350950 ?auto_350951 ) ) ( not ( = ?auto_350950 ?auto_350952 ) ) ( not ( = ?auto_350951 ?auto_350952 ) ) ( ON ?auto_350950 ?auto_350951 ) ( ON ?auto_350949 ?auto_350950 ) ( ON ?auto_350948 ?auto_350949 ) ( ON ?auto_350947 ?auto_350948 ) ( ON ?auto_350946 ?auto_350947 ) ( ON ?auto_350945 ?auto_350946 ) ( CLEAR ?auto_350943 ) ( ON ?auto_350944 ?auto_350945 ) ( CLEAR ?auto_350944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_350939 ?auto_350940 ?auto_350941 ?auto_350942 ?auto_350943 ?auto_350944 )
      ( MAKE-13PILE ?auto_350939 ?auto_350940 ?auto_350941 ?auto_350942 ?auto_350943 ?auto_350944 ?auto_350945 ?auto_350946 ?auto_350947 ?auto_350948 ?auto_350949 ?auto_350950 ?auto_350951 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350966 - BLOCK
      ?auto_350967 - BLOCK
      ?auto_350968 - BLOCK
      ?auto_350969 - BLOCK
      ?auto_350970 - BLOCK
      ?auto_350971 - BLOCK
      ?auto_350972 - BLOCK
      ?auto_350973 - BLOCK
      ?auto_350974 - BLOCK
      ?auto_350975 - BLOCK
      ?auto_350976 - BLOCK
      ?auto_350977 - BLOCK
      ?auto_350978 - BLOCK
    )
    :vars
    (
      ?auto_350979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_350978 ?auto_350979 ) ( ON-TABLE ?auto_350966 ) ( ON ?auto_350967 ?auto_350966 ) ( ON ?auto_350968 ?auto_350967 ) ( ON ?auto_350969 ?auto_350968 ) ( not ( = ?auto_350966 ?auto_350967 ) ) ( not ( = ?auto_350966 ?auto_350968 ) ) ( not ( = ?auto_350966 ?auto_350969 ) ) ( not ( = ?auto_350966 ?auto_350970 ) ) ( not ( = ?auto_350966 ?auto_350971 ) ) ( not ( = ?auto_350966 ?auto_350972 ) ) ( not ( = ?auto_350966 ?auto_350973 ) ) ( not ( = ?auto_350966 ?auto_350974 ) ) ( not ( = ?auto_350966 ?auto_350975 ) ) ( not ( = ?auto_350966 ?auto_350976 ) ) ( not ( = ?auto_350966 ?auto_350977 ) ) ( not ( = ?auto_350966 ?auto_350978 ) ) ( not ( = ?auto_350966 ?auto_350979 ) ) ( not ( = ?auto_350967 ?auto_350968 ) ) ( not ( = ?auto_350967 ?auto_350969 ) ) ( not ( = ?auto_350967 ?auto_350970 ) ) ( not ( = ?auto_350967 ?auto_350971 ) ) ( not ( = ?auto_350967 ?auto_350972 ) ) ( not ( = ?auto_350967 ?auto_350973 ) ) ( not ( = ?auto_350967 ?auto_350974 ) ) ( not ( = ?auto_350967 ?auto_350975 ) ) ( not ( = ?auto_350967 ?auto_350976 ) ) ( not ( = ?auto_350967 ?auto_350977 ) ) ( not ( = ?auto_350967 ?auto_350978 ) ) ( not ( = ?auto_350967 ?auto_350979 ) ) ( not ( = ?auto_350968 ?auto_350969 ) ) ( not ( = ?auto_350968 ?auto_350970 ) ) ( not ( = ?auto_350968 ?auto_350971 ) ) ( not ( = ?auto_350968 ?auto_350972 ) ) ( not ( = ?auto_350968 ?auto_350973 ) ) ( not ( = ?auto_350968 ?auto_350974 ) ) ( not ( = ?auto_350968 ?auto_350975 ) ) ( not ( = ?auto_350968 ?auto_350976 ) ) ( not ( = ?auto_350968 ?auto_350977 ) ) ( not ( = ?auto_350968 ?auto_350978 ) ) ( not ( = ?auto_350968 ?auto_350979 ) ) ( not ( = ?auto_350969 ?auto_350970 ) ) ( not ( = ?auto_350969 ?auto_350971 ) ) ( not ( = ?auto_350969 ?auto_350972 ) ) ( not ( = ?auto_350969 ?auto_350973 ) ) ( not ( = ?auto_350969 ?auto_350974 ) ) ( not ( = ?auto_350969 ?auto_350975 ) ) ( not ( = ?auto_350969 ?auto_350976 ) ) ( not ( = ?auto_350969 ?auto_350977 ) ) ( not ( = ?auto_350969 ?auto_350978 ) ) ( not ( = ?auto_350969 ?auto_350979 ) ) ( not ( = ?auto_350970 ?auto_350971 ) ) ( not ( = ?auto_350970 ?auto_350972 ) ) ( not ( = ?auto_350970 ?auto_350973 ) ) ( not ( = ?auto_350970 ?auto_350974 ) ) ( not ( = ?auto_350970 ?auto_350975 ) ) ( not ( = ?auto_350970 ?auto_350976 ) ) ( not ( = ?auto_350970 ?auto_350977 ) ) ( not ( = ?auto_350970 ?auto_350978 ) ) ( not ( = ?auto_350970 ?auto_350979 ) ) ( not ( = ?auto_350971 ?auto_350972 ) ) ( not ( = ?auto_350971 ?auto_350973 ) ) ( not ( = ?auto_350971 ?auto_350974 ) ) ( not ( = ?auto_350971 ?auto_350975 ) ) ( not ( = ?auto_350971 ?auto_350976 ) ) ( not ( = ?auto_350971 ?auto_350977 ) ) ( not ( = ?auto_350971 ?auto_350978 ) ) ( not ( = ?auto_350971 ?auto_350979 ) ) ( not ( = ?auto_350972 ?auto_350973 ) ) ( not ( = ?auto_350972 ?auto_350974 ) ) ( not ( = ?auto_350972 ?auto_350975 ) ) ( not ( = ?auto_350972 ?auto_350976 ) ) ( not ( = ?auto_350972 ?auto_350977 ) ) ( not ( = ?auto_350972 ?auto_350978 ) ) ( not ( = ?auto_350972 ?auto_350979 ) ) ( not ( = ?auto_350973 ?auto_350974 ) ) ( not ( = ?auto_350973 ?auto_350975 ) ) ( not ( = ?auto_350973 ?auto_350976 ) ) ( not ( = ?auto_350973 ?auto_350977 ) ) ( not ( = ?auto_350973 ?auto_350978 ) ) ( not ( = ?auto_350973 ?auto_350979 ) ) ( not ( = ?auto_350974 ?auto_350975 ) ) ( not ( = ?auto_350974 ?auto_350976 ) ) ( not ( = ?auto_350974 ?auto_350977 ) ) ( not ( = ?auto_350974 ?auto_350978 ) ) ( not ( = ?auto_350974 ?auto_350979 ) ) ( not ( = ?auto_350975 ?auto_350976 ) ) ( not ( = ?auto_350975 ?auto_350977 ) ) ( not ( = ?auto_350975 ?auto_350978 ) ) ( not ( = ?auto_350975 ?auto_350979 ) ) ( not ( = ?auto_350976 ?auto_350977 ) ) ( not ( = ?auto_350976 ?auto_350978 ) ) ( not ( = ?auto_350976 ?auto_350979 ) ) ( not ( = ?auto_350977 ?auto_350978 ) ) ( not ( = ?auto_350977 ?auto_350979 ) ) ( not ( = ?auto_350978 ?auto_350979 ) ) ( ON ?auto_350977 ?auto_350978 ) ( ON ?auto_350976 ?auto_350977 ) ( ON ?auto_350975 ?auto_350976 ) ( ON ?auto_350974 ?auto_350975 ) ( ON ?auto_350973 ?auto_350974 ) ( ON ?auto_350972 ?auto_350973 ) ( ON ?auto_350971 ?auto_350972 ) ( CLEAR ?auto_350969 ) ( ON ?auto_350970 ?auto_350971 ) ( CLEAR ?auto_350970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_350966 ?auto_350967 ?auto_350968 ?auto_350969 ?auto_350970 )
      ( MAKE-13PILE ?auto_350966 ?auto_350967 ?auto_350968 ?auto_350969 ?auto_350970 ?auto_350971 ?auto_350972 ?auto_350973 ?auto_350974 ?auto_350975 ?auto_350976 ?auto_350977 ?auto_350978 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_350993 - BLOCK
      ?auto_350994 - BLOCK
      ?auto_350995 - BLOCK
      ?auto_350996 - BLOCK
      ?auto_350997 - BLOCK
      ?auto_350998 - BLOCK
      ?auto_350999 - BLOCK
      ?auto_351000 - BLOCK
      ?auto_351001 - BLOCK
      ?auto_351002 - BLOCK
      ?auto_351003 - BLOCK
      ?auto_351004 - BLOCK
      ?auto_351005 - BLOCK
    )
    :vars
    (
      ?auto_351006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351005 ?auto_351006 ) ( ON-TABLE ?auto_350993 ) ( ON ?auto_350994 ?auto_350993 ) ( ON ?auto_350995 ?auto_350994 ) ( ON ?auto_350996 ?auto_350995 ) ( not ( = ?auto_350993 ?auto_350994 ) ) ( not ( = ?auto_350993 ?auto_350995 ) ) ( not ( = ?auto_350993 ?auto_350996 ) ) ( not ( = ?auto_350993 ?auto_350997 ) ) ( not ( = ?auto_350993 ?auto_350998 ) ) ( not ( = ?auto_350993 ?auto_350999 ) ) ( not ( = ?auto_350993 ?auto_351000 ) ) ( not ( = ?auto_350993 ?auto_351001 ) ) ( not ( = ?auto_350993 ?auto_351002 ) ) ( not ( = ?auto_350993 ?auto_351003 ) ) ( not ( = ?auto_350993 ?auto_351004 ) ) ( not ( = ?auto_350993 ?auto_351005 ) ) ( not ( = ?auto_350993 ?auto_351006 ) ) ( not ( = ?auto_350994 ?auto_350995 ) ) ( not ( = ?auto_350994 ?auto_350996 ) ) ( not ( = ?auto_350994 ?auto_350997 ) ) ( not ( = ?auto_350994 ?auto_350998 ) ) ( not ( = ?auto_350994 ?auto_350999 ) ) ( not ( = ?auto_350994 ?auto_351000 ) ) ( not ( = ?auto_350994 ?auto_351001 ) ) ( not ( = ?auto_350994 ?auto_351002 ) ) ( not ( = ?auto_350994 ?auto_351003 ) ) ( not ( = ?auto_350994 ?auto_351004 ) ) ( not ( = ?auto_350994 ?auto_351005 ) ) ( not ( = ?auto_350994 ?auto_351006 ) ) ( not ( = ?auto_350995 ?auto_350996 ) ) ( not ( = ?auto_350995 ?auto_350997 ) ) ( not ( = ?auto_350995 ?auto_350998 ) ) ( not ( = ?auto_350995 ?auto_350999 ) ) ( not ( = ?auto_350995 ?auto_351000 ) ) ( not ( = ?auto_350995 ?auto_351001 ) ) ( not ( = ?auto_350995 ?auto_351002 ) ) ( not ( = ?auto_350995 ?auto_351003 ) ) ( not ( = ?auto_350995 ?auto_351004 ) ) ( not ( = ?auto_350995 ?auto_351005 ) ) ( not ( = ?auto_350995 ?auto_351006 ) ) ( not ( = ?auto_350996 ?auto_350997 ) ) ( not ( = ?auto_350996 ?auto_350998 ) ) ( not ( = ?auto_350996 ?auto_350999 ) ) ( not ( = ?auto_350996 ?auto_351000 ) ) ( not ( = ?auto_350996 ?auto_351001 ) ) ( not ( = ?auto_350996 ?auto_351002 ) ) ( not ( = ?auto_350996 ?auto_351003 ) ) ( not ( = ?auto_350996 ?auto_351004 ) ) ( not ( = ?auto_350996 ?auto_351005 ) ) ( not ( = ?auto_350996 ?auto_351006 ) ) ( not ( = ?auto_350997 ?auto_350998 ) ) ( not ( = ?auto_350997 ?auto_350999 ) ) ( not ( = ?auto_350997 ?auto_351000 ) ) ( not ( = ?auto_350997 ?auto_351001 ) ) ( not ( = ?auto_350997 ?auto_351002 ) ) ( not ( = ?auto_350997 ?auto_351003 ) ) ( not ( = ?auto_350997 ?auto_351004 ) ) ( not ( = ?auto_350997 ?auto_351005 ) ) ( not ( = ?auto_350997 ?auto_351006 ) ) ( not ( = ?auto_350998 ?auto_350999 ) ) ( not ( = ?auto_350998 ?auto_351000 ) ) ( not ( = ?auto_350998 ?auto_351001 ) ) ( not ( = ?auto_350998 ?auto_351002 ) ) ( not ( = ?auto_350998 ?auto_351003 ) ) ( not ( = ?auto_350998 ?auto_351004 ) ) ( not ( = ?auto_350998 ?auto_351005 ) ) ( not ( = ?auto_350998 ?auto_351006 ) ) ( not ( = ?auto_350999 ?auto_351000 ) ) ( not ( = ?auto_350999 ?auto_351001 ) ) ( not ( = ?auto_350999 ?auto_351002 ) ) ( not ( = ?auto_350999 ?auto_351003 ) ) ( not ( = ?auto_350999 ?auto_351004 ) ) ( not ( = ?auto_350999 ?auto_351005 ) ) ( not ( = ?auto_350999 ?auto_351006 ) ) ( not ( = ?auto_351000 ?auto_351001 ) ) ( not ( = ?auto_351000 ?auto_351002 ) ) ( not ( = ?auto_351000 ?auto_351003 ) ) ( not ( = ?auto_351000 ?auto_351004 ) ) ( not ( = ?auto_351000 ?auto_351005 ) ) ( not ( = ?auto_351000 ?auto_351006 ) ) ( not ( = ?auto_351001 ?auto_351002 ) ) ( not ( = ?auto_351001 ?auto_351003 ) ) ( not ( = ?auto_351001 ?auto_351004 ) ) ( not ( = ?auto_351001 ?auto_351005 ) ) ( not ( = ?auto_351001 ?auto_351006 ) ) ( not ( = ?auto_351002 ?auto_351003 ) ) ( not ( = ?auto_351002 ?auto_351004 ) ) ( not ( = ?auto_351002 ?auto_351005 ) ) ( not ( = ?auto_351002 ?auto_351006 ) ) ( not ( = ?auto_351003 ?auto_351004 ) ) ( not ( = ?auto_351003 ?auto_351005 ) ) ( not ( = ?auto_351003 ?auto_351006 ) ) ( not ( = ?auto_351004 ?auto_351005 ) ) ( not ( = ?auto_351004 ?auto_351006 ) ) ( not ( = ?auto_351005 ?auto_351006 ) ) ( ON ?auto_351004 ?auto_351005 ) ( ON ?auto_351003 ?auto_351004 ) ( ON ?auto_351002 ?auto_351003 ) ( ON ?auto_351001 ?auto_351002 ) ( ON ?auto_351000 ?auto_351001 ) ( ON ?auto_350999 ?auto_351000 ) ( ON ?auto_350998 ?auto_350999 ) ( CLEAR ?auto_350996 ) ( ON ?auto_350997 ?auto_350998 ) ( CLEAR ?auto_350997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_350993 ?auto_350994 ?auto_350995 ?auto_350996 ?auto_350997 )
      ( MAKE-13PILE ?auto_350993 ?auto_350994 ?auto_350995 ?auto_350996 ?auto_350997 ?auto_350998 ?auto_350999 ?auto_351000 ?auto_351001 ?auto_351002 ?auto_351003 ?auto_351004 ?auto_351005 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_351020 - BLOCK
      ?auto_351021 - BLOCK
      ?auto_351022 - BLOCK
      ?auto_351023 - BLOCK
      ?auto_351024 - BLOCK
      ?auto_351025 - BLOCK
      ?auto_351026 - BLOCK
      ?auto_351027 - BLOCK
      ?auto_351028 - BLOCK
      ?auto_351029 - BLOCK
      ?auto_351030 - BLOCK
      ?auto_351031 - BLOCK
      ?auto_351032 - BLOCK
    )
    :vars
    (
      ?auto_351033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351032 ?auto_351033 ) ( ON-TABLE ?auto_351020 ) ( ON ?auto_351021 ?auto_351020 ) ( ON ?auto_351022 ?auto_351021 ) ( not ( = ?auto_351020 ?auto_351021 ) ) ( not ( = ?auto_351020 ?auto_351022 ) ) ( not ( = ?auto_351020 ?auto_351023 ) ) ( not ( = ?auto_351020 ?auto_351024 ) ) ( not ( = ?auto_351020 ?auto_351025 ) ) ( not ( = ?auto_351020 ?auto_351026 ) ) ( not ( = ?auto_351020 ?auto_351027 ) ) ( not ( = ?auto_351020 ?auto_351028 ) ) ( not ( = ?auto_351020 ?auto_351029 ) ) ( not ( = ?auto_351020 ?auto_351030 ) ) ( not ( = ?auto_351020 ?auto_351031 ) ) ( not ( = ?auto_351020 ?auto_351032 ) ) ( not ( = ?auto_351020 ?auto_351033 ) ) ( not ( = ?auto_351021 ?auto_351022 ) ) ( not ( = ?auto_351021 ?auto_351023 ) ) ( not ( = ?auto_351021 ?auto_351024 ) ) ( not ( = ?auto_351021 ?auto_351025 ) ) ( not ( = ?auto_351021 ?auto_351026 ) ) ( not ( = ?auto_351021 ?auto_351027 ) ) ( not ( = ?auto_351021 ?auto_351028 ) ) ( not ( = ?auto_351021 ?auto_351029 ) ) ( not ( = ?auto_351021 ?auto_351030 ) ) ( not ( = ?auto_351021 ?auto_351031 ) ) ( not ( = ?auto_351021 ?auto_351032 ) ) ( not ( = ?auto_351021 ?auto_351033 ) ) ( not ( = ?auto_351022 ?auto_351023 ) ) ( not ( = ?auto_351022 ?auto_351024 ) ) ( not ( = ?auto_351022 ?auto_351025 ) ) ( not ( = ?auto_351022 ?auto_351026 ) ) ( not ( = ?auto_351022 ?auto_351027 ) ) ( not ( = ?auto_351022 ?auto_351028 ) ) ( not ( = ?auto_351022 ?auto_351029 ) ) ( not ( = ?auto_351022 ?auto_351030 ) ) ( not ( = ?auto_351022 ?auto_351031 ) ) ( not ( = ?auto_351022 ?auto_351032 ) ) ( not ( = ?auto_351022 ?auto_351033 ) ) ( not ( = ?auto_351023 ?auto_351024 ) ) ( not ( = ?auto_351023 ?auto_351025 ) ) ( not ( = ?auto_351023 ?auto_351026 ) ) ( not ( = ?auto_351023 ?auto_351027 ) ) ( not ( = ?auto_351023 ?auto_351028 ) ) ( not ( = ?auto_351023 ?auto_351029 ) ) ( not ( = ?auto_351023 ?auto_351030 ) ) ( not ( = ?auto_351023 ?auto_351031 ) ) ( not ( = ?auto_351023 ?auto_351032 ) ) ( not ( = ?auto_351023 ?auto_351033 ) ) ( not ( = ?auto_351024 ?auto_351025 ) ) ( not ( = ?auto_351024 ?auto_351026 ) ) ( not ( = ?auto_351024 ?auto_351027 ) ) ( not ( = ?auto_351024 ?auto_351028 ) ) ( not ( = ?auto_351024 ?auto_351029 ) ) ( not ( = ?auto_351024 ?auto_351030 ) ) ( not ( = ?auto_351024 ?auto_351031 ) ) ( not ( = ?auto_351024 ?auto_351032 ) ) ( not ( = ?auto_351024 ?auto_351033 ) ) ( not ( = ?auto_351025 ?auto_351026 ) ) ( not ( = ?auto_351025 ?auto_351027 ) ) ( not ( = ?auto_351025 ?auto_351028 ) ) ( not ( = ?auto_351025 ?auto_351029 ) ) ( not ( = ?auto_351025 ?auto_351030 ) ) ( not ( = ?auto_351025 ?auto_351031 ) ) ( not ( = ?auto_351025 ?auto_351032 ) ) ( not ( = ?auto_351025 ?auto_351033 ) ) ( not ( = ?auto_351026 ?auto_351027 ) ) ( not ( = ?auto_351026 ?auto_351028 ) ) ( not ( = ?auto_351026 ?auto_351029 ) ) ( not ( = ?auto_351026 ?auto_351030 ) ) ( not ( = ?auto_351026 ?auto_351031 ) ) ( not ( = ?auto_351026 ?auto_351032 ) ) ( not ( = ?auto_351026 ?auto_351033 ) ) ( not ( = ?auto_351027 ?auto_351028 ) ) ( not ( = ?auto_351027 ?auto_351029 ) ) ( not ( = ?auto_351027 ?auto_351030 ) ) ( not ( = ?auto_351027 ?auto_351031 ) ) ( not ( = ?auto_351027 ?auto_351032 ) ) ( not ( = ?auto_351027 ?auto_351033 ) ) ( not ( = ?auto_351028 ?auto_351029 ) ) ( not ( = ?auto_351028 ?auto_351030 ) ) ( not ( = ?auto_351028 ?auto_351031 ) ) ( not ( = ?auto_351028 ?auto_351032 ) ) ( not ( = ?auto_351028 ?auto_351033 ) ) ( not ( = ?auto_351029 ?auto_351030 ) ) ( not ( = ?auto_351029 ?auto_351031 ) ) ( not ( = ?auto_351029 ?auto_351032 ) ) ( not ( = ?auto_351029 ?auto_351033 ) ) ( not ( = ?auto_351030 ?auto_351031 ) ) ( not ( = ?auto_351030 ?auto_351032 ) ) ( not ( = ?auto_351030 ?auto_351033 ) ) ( not ( = ?auto_351031 ?auto_351032 ) ) ( not ( = ?auto_351031 ?auto_351033 ) ) ( not ( = ?auto_351032 ?auto_351033 ) ) ( ON ?auto_351031 ?auto_351032 ) ( ON ?auto_351030 ?auto_351031 ) ( ON ?auto_351029 ?auto_351030 ) ( ON ?auto_351028 ?auto_351029 ) ( ON ?auto_351027 ?auto_351028 ) ( ON ?auto_351026 ?auto_351027 ) ( ON ?auto_351025 ?auto_351026 ) ( ON ?auto_351024 ?auto_351025 ) ( CLEAR ?auto_351022 ) ( ON ?auto_351023 ?auto_351024 ) ( CLEAR ?auto_351023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_351020 ?auto_351021 ?auto_351022 ?auto_351023 )
      ( MAKE-13PILE ?auto_351020 ?auto_351021 ?auto_351022 ?auto_351023 ?auto_351024 ?auto_351025 ?auto_351026 ?auto_351027 ?auto_351028 ?auto_351029 ?auto_351030 ?auto_351031 ?auto_351032 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_351047 - BLOCK
      ?auto_351048 - BLOCK
      ?auto_351049 - BLOCK
      ?auto_351050 - BLOCK
      ?auto_351051 - BLOCK
      ?auto_351052 - BLOCK
      ?auto_351053 - BLOCK
      ?auto_351054 - BLOCK
      ?auto_351055 - BLOCK
      ?auto_351056 - BLOCK
      ?auto_351057 - BLOCK
      ?auto_351058 - BLOCK
      ?auto_351059 - BLOCK
    )
    :vars
    (
      ?auto_351060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351059 ?auto_351060 ) ( ON-TABLE ?auto_351047 ) ( ON ?auto_351048 ?auto_351047 ) ( ON ?auto_351049 ?auto_351048 ) ( not ( = ?auto_351047 ?auto_351048 ) ) ( not ( = ?auto_351047 ?auto_351049 ) ) ( not ( = ?auto_351047 ?auto_351050 ) ) ( not ( = ?auto_351047 ?auto_351051 ) ) ( not ( = ?auto_351047 ?auto_351052 ) ) ( not ( = ?auto_351047 ?auto_351053 ) ) ( not ( = ?auto_351047 ?auto_351054 ) ) ( not ( = ?auto_351047 ?auto_351055 ) ) ( not ( = ?auto_351047 ?auto_351056 ) ) ( not ( = ?auto_351047 ?auto_351057 ) ) ( not ( = ?auto_351047 ?auto_351058 ) ) ( not ( = ?auto_351047 ?auto_351059 ) ) ( not ( = ?auto_351047 ?auto_351060 ) ) ( not ( = ?auto_351048 ?auto_351049 ) ) ( not ( = ?auto_351048 ?auto_351050 ) ) ( not ( = ?auto_351048 ?auto_351051 ) ) ( not ( = ?auto_351048 ?auto_351052 ) ) ( not ( = ?auto_351048 ?auto_351053 ) ) ( not ( = ?auto_351048 ?auto_351054 ) ) ( not ( = ?auto_351048 ?auto_351055 ) ) ( not ( = ?auto_351048 ?auto_351056 ) ) ( not ( = ?auto_351048 ?auto_351057 ) ) ( not ( = ?auto_351048 ?auto_351058 ) ) ( not ( = ?auto_351048 ?auto_351059 ) ) ( not ( = ?auto_351048 ?auto_351060 ) ) ( not ( = ?auto_351049 ?auto_351050 ) ) ( not ( = ?auto_351049 ?auto_351051 ) ) ( not ( = ?auto_351049 ?auto_351052 ) ) ( not ( = ?auto_351049 ?auto_351053 ) ) ( not ( = ?auto_351049 ?auto_351054 ) ) ( not ( = ?auto_351049 ?auto_351055 ) ) ( not ( = ?auto_351049 ?auto_351056 ) ) ( not ( = ?auto_351049 ?auto_351057 ) ) ( not ( = ?auto_351049 ?auto_351058 ) ) ( not ( = ?auto_351049 ?auto_351059 ) ) ( not ( = ?auto_351049 ?auto_351060 ) ) ( not ( = ?auto_351050 ?auto_351051 ) ) ( not ( = ?auto_351050 ?auto_351052 ) ) ( not ( = ?auto_351050 ?auto_351053 ) ) ( not ( = ?auto_351050 ?auto_351054 ) ) ( not ( = ?auto_351050 ?auto_351055 ) ) ( not ( = ?auto_351050 ?auto_351056 ) ) ( not ( = ?auto_351050 ?auto_351057 ) ) ( not ( = ?auto_351050 ?auto_351058 ) ) ( not ( = ?auto_351050 ?auto_351059 ) ) ( not ( = ?auto_351050 ?auto_351060 ) ) ( not ( = ?auto_351051 ?auto_351052 ) ) ( not ( = ?auto_351051 ?auto_351053 ) ) ( not ( = ?auto_351051 ?auto_351054 ) ) ( not ( = ?auto_351051 ?auto_351055 ) ) ( not ( = ?auto_351051 ?auto_351056 ) ) ( not ( = ?auto_351051 ?auto_351057 ) ) ( not ( = ?auto_351051 ?auto_351058 ) ) ( not ( = ?auto_351051 ?auto_351059 ) ) ( not ( = ?auto_351051 ?auto_351060 ) ) ( not ( = ?auto_351052 ?auto_351053 ) ) ( not ( = ?auto_351052 ?auto_351054 ) ) ( not ( = ?auto_351052 ?auto_351055 ) ) ( not ( = ?auto_351052 ?auto_351056 ) ) ( not ( = ?auto_351052 ?auto_351057 ) ) ( not ( = ?auto_351052 ?auto_351058 ) ) ( not ( = ?auto_351052 ?auto_351059 ) ) ( not ( = ?auto_351052 ?auto_351060 ) ) ( not ( = ?auto_351053 ?auto_351054 ) ) ( not ( = ?auto_351053 ?auto_351055 ) ) ( not ( = ?auto_351053 ?auto_351056 ) ) ( not ( = ?auto_351053 ?auto_351057 ) ) ( not ( = ?auto_351053 ?auto_351058 ) ) ( not ( = ?auto_351053 ?auto_351059 ) ) ( not ( = ?auto_351053 ?auto_351060 ) ) ( not ( = ?auto_351054 ?auto_351055 ) ) ( not ( = ?auto_351054 ?auto_351056 ) ) ( not ( = ?auto_351054 ?auto_351057 ) ) ( not ( = ?auto_351054 ?auto_351058 ) ) ( not ( = ?auto_351054 ?auto_351059 ) ) ( not ( = ?auto_351054 ?auto_351060 ) ) ( not ( = ?auto_351055 ?auto_351056 ) ) ( not ( = ?auto_351055 ?auto_351057 ) ) ( not ( = ?auto_351055 ?auto_351058 ) ) ( not ( = ?auto_351055 ?auto_351059 ) ) ( not ( = ?auto_351055 ?auto_351060 ) ) ( not ( = ?auto_351056 ?auto_351057 ) ) ( not ( = ?auto_351056 ?auto_351058 ) ) ( not ( = ?auto_351056 ?auto_351059 ) ) ( not ( = ?auto_351056 ?auto_351060 ) ) ( not ( = ?auto_351057 ?auto_351058 ) ) ( not ( = ?auto_351057 ?auto_351059 ) ) ( not ( = ?auto_351057 ?auto_351060 ) ) ( not ( = ?auto_351058 ?auto_351059 ) ) ( not ( = ?auto_351058 ?auto_351060 ) ) ( not ( = ?auto_351059 ?auto_351060 ) ) ( ON ?auto_351058 ?auto_351059 ) ( ON ?auto_351057 ?auto_351058 ) ( ON ?auto_351056 ?auto_351057 ) ( ON ?auto_351055 ?auto_351056 ) ( ON ?auto_351054 ?auto_351055 ) ( ON ?auto_351053 ?auto_351054 ) ( ON ?auto_351052 ?auto_351053 ) ( ON ?auto_351051 ?auto_351052 ) ( CLEAR ?auto_351049 ) ( ON ?auto_351050 ?auto_351051 ) ( CLEAR ?auto_351050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_351047 ?auto_351048 ?auto_351049 ?auto_351050 )
      ( MAKE-13PILE ?auto_351047 ?auto_351048 ?auto_351049 ?auto_351050 ?auto_351051 ?auto_351052 ?auto_351053 ?auto_351054 ?auto_351055 ?auto_351056 ?auto_351057 ?auto_351058 ?auto_351059 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_351074 - BLOCK
      ?auto_351075 - BLOCK
      ?auto_351076 - BLOCK
      ?auto_351077 - BLOCK
      ?auto_351078 - BLOCK
      ?auto_351079 - BLOCK
      ?auto_351080 - BLOCK
      ?auto_351081 - BLOCK
      ?auto_351082 - BLOCK
      ?auto_351083 - BLOCK
      ?auto_351084 - BLOCK
      ?auto_351085 - BLOCK
      ?auto_351086 - BLOCK
    )
    :vars
    (
      ?auto_351087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351086 ?auto_351087 ) ( ON-TABLE ?auto_351074 ) ( ON ?auto_351075 ?auto_351074 ) ( not ( = ?auto_351074 ?auto_351075 ) ) ( not ( = ?auto_351074 ?auto_351076 ) ) ( not ( = ?auto_351074 ?auto_351077 ) ) ( not ( = ?auto_351074 ?auto_351078 ) ) ( not ( = ?auto_351074 ?auto_351079 ) ) ( not ( = ?auto_351074 ?auto_351080 ) ) ( not ( = ?auto_351074 ?auto_351081 ) ) ( not ( = ?auto_351074 ?auto_351082 ) ) ( not ( = ?auto_351074 ?auto_351083 ) ) ( not ( = ?auto_351074 ?auto_351084 ) ) ( not ( = ?auto_351074 ?auto_351085 ) ) ( not ( = ?auto_351074 ?auto_351086 ) ) ( not ( = ?auto_351074 ?auto_351087 ) ) ( not ( = ?auto_351075 ?auto_351076 ) ) ( not ( = ?auto_351075 ?auto_351077 ) ) ( not ( = ?auto_351075 ?auto_351078 ) ) ( not ( = ?auto_351075 ?auto_351079 ) ) ( not ( = ?auto_351075 ?auto_351080 ) ) ( not ( = ?auto_351075 ?auto_351081 ) ) ( not ( = ?auto_351075 ?auto_351082 ) ) ( not ( = ?auto_351075 ?auto_351083 ) ) ( not ( = ?auto_351075 ?auto_351084 ) ) ( not ( = ?auto_351075 ?auto_351085 ) ) ( not ( = ?auto_351075 ?auto_351086 ) ) ( not ( = ?auto_351075 ?auto_351087 ) ) ( not ( = ?auto_351076 ?auto_351077 ) ) ( not ( = ?auto_351076 ?auto_351078 ) ) ( not ( = ?auto_351076 ?auto_351079 ) ) ( not ( = ?auto_351076 ?auto_351080 ) ) ( not ( = ?auto_351076 ?auto_351081 ) ) ( not ( = ?auto_351076 ?auto_351082 ) ) ( not ( = ?auto_351076 ?auto_351083 ) ) ( not ( = ?auto_351076 ?auto_351084 ) ) ( not ( = ?auto_351076 ?auto_351085 ) ) ( not ( = ?auto_351076 ?auto_351086 ) ) ( not ( = ?auto_351076 ?auto_351087 ) ) ( not ( = ?auto_351077 ?auto_351078 ) ) ( not ( = ?auto_351077 ?auto_351079 ) ) ( not ( = ?auto_351077 ?auto_351080 ) ) ( not ( = ?auto_351077 ?auto_351081 ) ) ( not ( = ?auto_351077 ?auto_351082 ) ) ( not ( = ?auto_351077 ?auto_351083 ) ) ( not ( = ?auto_351077 ?auto_351084 ) ) ( not ( = ?auto_351077 ?auto_351085 ) ) ( not ( = ?auto_351077 ?auto_351086 ) ) ( not ( = ?auto_351077 ?auto_351087 ) ) ( not ( = ?auto_351078 ?auto_351079 ) ) ( not ( = ?auto_351078 ?auto_351080 ) ) ( not ( = ?auto_351078 ?auto_351081 ) ) ( not ( = ?auto_351078 ?auto_351082 ) ) ( not ( = ?auto_351078 ?auto_351083 ) ) ( not ( = ?auto_351078 ?auto_351084 ) ) ( not ( = ?auto_351078 ?auto_351085 ) ) ( not ( = ?auto_351078 ?auto_351086 ) ) ( not ( = ?auto_351078 ?auto_351087 ) ) ( not ( = ?auto_351079 ?auto_351080 ) ) ( not ( = ?auto_351079 ?auto_351081 ) ) ( not ( = ?auto_351079 ?auto_351082 ) ) ( not ( = ?auto_351079 ?auto_351083 ) ) ( not ( = ?auto_351079 ?auto_351084 ) ) ( not ( = ?auto_351079 ?auto_351085 ) ) ( not ( = ?auto_351079 ?auto_351086 ) ) ( not ( = ?auto_351079 ?auto_351087 ) ) ( not ( = ?auto_351080 ?auto_351081 ) ) ( not ( = ?auto_351080 ?auto_351082 ) ) ( not ( = ?auto_351080 ?auto_351083 ) ) ( not ( = ?auto_351080 ?auto_351084 ) ) ( not ( = ?auto_351080 ?auto_351085 ) ) ( not ( = ?auto_351080 ?auto_351086 ) ) ( not ( = ?auto_351080 ?auto_351087 ) ) ( not ( = ?auto_351081 ?auto_351082 ) ) ( not ( = ?auto_351081 ?auto_351083 ) ) ( not ( = ?auto_351081 ?auto_351084 ) ) ( not ( = ?auto_351081 ?auto_351085 ) ) ( not ( = ?auto_351081 ?auto_351086 ) ) ( not ( = ?auto_351081 ?auto_351087 ) ) ( not ( = ?auto_351082 ?auto_351083 ) ) ( not ( = ?auto_351082 ?auto_351084 ) ) ( not ( = ?auto_351082 ?auto_351085 ) ) ( not ( = ?auto_351082 ?auto_351086 ) ) ( not ( = ?auto_351082 ?auto_351087 ) ) ( not ( = ?auto_351083 ?auto_351084 ) ) ( not ( = ?auto_351083 ?auto_351085 ) ) ( not ( = ?auto_351083 ?auto_351086 ) ) ( not ( = ?auto_351083 ?auto_351087 ) ) ( not ( = ?auto_351084 ?auto_351085 ) ) ( not ( = ?auto_351084 ?auto_351086 ) ) ( not ( = ?auto_351084 ?auto_351087 ) ) ( not ( = ?auto_351085 ?auto_351086 ) ) ( not ( = ?auto_351085 ?auto_351087 ) ) ( not ( = ?auto_351086 ?auto_351087 ) ) ( ON ?auto_351085 ?auto_351086 ) ( ON ?auto_351084 ?auto_351085 ) ( ON ?auto_351083 ?auto_351084 ) ( ON ?auto_351082 ?auto_351083 ) ( ON ?auto_351081 ?auto_351082 ) ( ON ?auto_351080 ?auto_351081 ) ( ON ?auto_351079 ?auto_351080 ) ( ON ?auto_351078 ?auto_351079 ) ( ON ?auto_351077 ?auto_351078 ) ( CLEAR ?auto_351075 ) ( ON ?auto_351076 ?auto_351077 ) ( CLEAR ?auto_351076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_351074 ?auto_351075 ?auto_351076 )
      ( MAKE-13PILE ?auto_351074 ?auto_351075 ?auto_351076 ?auto_351077 ?auto_351078 ?auto_351079 ?auto_351080 ?auto_351081 ?auto_351082 ?auto_351083 ?auto_351084 ?auto_351085 ?auto_351086 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_351101 - BLOCK
      ?auto_351102 - BLOCK
      ?auto_351103 - BLOCK
      ?auto_351104 - BLOCK
      ?auto_351105 - BLOCK
      ?auto_351106 - BLOCK
      ?auto_351107 - BLOCK
      ?auto_351108 - BLOCK
      ?auto_351109 - BLOCK
      ?auto_351110 - BLOCK
      ?auto_351111 - BLOCK
      ?auto_351112 - BLOCK
      ?auto_351113 - BLOCK
    )
    :vars
    (
      ?auto_351114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351113 ?auto_351114 ) ( ON-TABLE ?auto_351101 ) ( ON ?auto_351102 ?auto_351101 ) ( not ( = ?auto_351101 ?auto_351102 ) ) ( not ( = ?auto_351101 ?auto_351103 ) ) ( not ( = ?auto_351101 ?auto_351104 ) ) ( not ( = ?auto_351101 ?auto_351105 ) ) ( not ( = ?auto_351101 ?auto_351106 ) ) ( not ( = ?auto_351101 ?auto_351107 ) ) ( not ( = ?auto_351101 ?auto_351108 ) ) ( not ( = ?auto_351101 ?auto_351109 ) ) ( not ( = ?auto_351101 ?auto_351110 ) ) ( not ( = ?auto_351101 ?auto_351111 ) ) ( not ( = ?auto_351101 ?auto_351112 ) ) ( not ( = ?auto_351101 ?auto_351113 ) ) ( not ( = ?auto_351101 ?auto_351114 ) ) ( not ( = ?auto_351102 ?auto_351103 ) ) ( not ( = ?auto_351102 ?auto_351104 ) ) ( not ( = ?auto_351102 ?auto_351105 ) ) ( not ( = ?auto_351102 ?auto_351106 ) ) ( not ( = ?auto_351102 ?auto_351107 ) ) ( not ( = ?auto_351102 ?auto_351108 ) ) ( not ( = ?auto_351102 ?auto_351109 ) ) ( not ( = ?auto_351102 ?auto_351110 ) ) ( not ( = ?auto_351102 ?auto_351111 ) ) ( not ( = ?auto_351102 ?auto_351112 ) ) ( not ( = ?auto_351102 ?auto_351113 ) ) ( not ( = ?auto_351102 ?auto_351114 ) ) ( not ( = ?auto_351103 ?auto_351104 ) ) ( not ( = ?auto_351103 ?auto_351105 ) ) ( not ( = ?auto_351103 ?auto_351106 ) ) ( not ( = ?auto_351103 ?auto_351107 ) ) ( not ( = ?auto_351103 ?auto_351108 ) ) ( not ( = ?auto_351103 ?auto_351109 ) ) ( not ( = ?auto_351103 ?auto_351110 ) ) ( not ( = ?auto_351103 ?auto_351111 ) ) ( not ( = ?auto_351103 ?auto_351112 ) ) ( not ( = ?auto_351103 ?auto_351113 ) ) ( not ( = ?auto_351103 ?auto_351114 ) ) ( not ( = ?auto_351104 ?auto_351105 ) ) ( not ( = ?auto_351104 ?auto_351106 ) ) ( not ( = ?auto_351104 ?auto_351107 ) ) ( not ( = ?auto_351104 ?auto_351108 ) ) ( not ( = ?auto_351104 ?auto_351109 ) ) ( not ( = ?auto_351104 ?auto_351110 ) ) ( not ( = ?auto_351104 ?auto_351111 ) ) ( not ( = ?auto_351104 ?auto_351112 ) ) ( not ( = ?auto_351104 ?auto_351113 ) ) ( not ( = ?auto_351104 ?auto_351114 ) ) ( not ( = ?auto_351105 ?auto_351106 ) ) ( not ( = ?auto_351105 ?auto_351107 ) ) ( not ( = ?auto_351105 ?auto_351108 ) ) ( not ( = ?auto_351105 ?auto_351109 ) ) ( not ( = ?auto_351105 ?auto_351110 ) ) ( not ( = ?auto_351105 ?auto_351111 ) ) ( not ( = ?auto_351105 ?auto_351112 ) ) ( not ( = ?auto_351105 ?auto_351113 ) ) ( not ( = ?auto_351105 ?auto_351114 ) ) ( not ( = ?auto_351106 ?auto_351107 ) ) ( not ( = ?auto_351106 ?auto_351108 ) ) ( not ( = ?auto_351106 ?auto_351109 ) ) ( not ( = ?auto_351106 ?auto_351110 ) ) ( not ( = ?auto_351106 ?auto_351111 ) ) ( not ( = ?auto_351106 ?auto_351112 ) ) ( not ( = ?auto_351106 ?auto_351113 ) ) ( not ( = ?auto_351106 ?auto_351114 ) ) ( not ( = ?auto_351107 ?auto_351108 ) ) ( not ( = ?auto_351107 ?auto_351109 ) ) ( not ( = ?auto_351107 ?auto_351110 ) ) ( not ( = ?auto_351107 ?auto_351111 ) ) ( not ( = ?auto_351107 ?auto_351112 ) ) ( not ( = ?auto_351107 ?auto_351113 ) ) ( not ( = ?auto_351107 ?auto_351114 ) ) ( not ( = ?auto_351108 ?auto_351109 ) ) ( not ( = ?auto_351108 ?auto_351110 ) ) ( not ( = ?auto_351108 ?auto_351111 ) ) ( not ( = ?auto_351108 ?auto_351112 ) ) ( not ( = ?auto_351108 ?auto_351113 ) ) ( not ( = ?auto_351108 ?auto_351114 ) ) ( not ( = ?auto_351109 ?auto_351110 ) ) ( not ( = ?auto_351109 ?auto_351111 ) ) ( not ( = ?auto_351109 ?auto_351112 ) ) ( not ( = ?auto_351109 ?auto_351113 ) ) ( not ( = ?auto_351109 ?auto_351114 ) ) ( not ( = ?auto_351110 ?auto_351111 ) ) ( not ( = ?auto_351110 ?auto_351112 ) ) ( not ( = ?auto_351110 ?auto_351113 ) ) ( not ( = ?auto_351110 ?auto_351114 ) ) ( not ( = ?auto_351111 ?auto_351112 ) ) ( not ( = ?auto_351111 ?auto_351113 ) ) ( not ( = ?auto_351111 ?auto_351114 ) ) ( not ( = ?auto_351112 ?auto_351113 ) ) ( not ( = ?auto_351112 ?auto_351114 ) ) ( not ( = ?auto_351113 ?auto_351114 ) ) ( ON ?auto_351112 ?auto_351113 ) ( ON ?auto_351111 ?auto_351112 ) ( ON ?auto_351110 ?auto_351111 ) ( ON ?auto_351109 ?auto_351110 ) ( ON ?auto_351108 ?auto_351109 ) ( ON ?auto_351107 ?auto_351108 ) ( ON ?auto_351106 ?auto_351107 ) ( ON ?auto_351105 ?auto_351106 ) ( ON ?auto_351104 ?auto_351105 ) ( CLEAR ?auto_351102 ) ( ON ?auto_351103 ?auto_351104 ) ( CLEAR ?auto_351103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_351101 ?auto_351102 ?auto_351103 )
      ( MAKE-13PILE ?auto_351101 ?auto_351102 ?auto_351103 ?auto_351104 ?auto_351105 ?auto_351106 ?auto_351107 ?auto_351108 ?auto_351109 ?auto_351110 ?auto_351111 ?auto_351112 ?auto_351113 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_351128 - BLOCK
      ?auto_351129 - BLOCK
      ?auto_351130 - BLOCK
      ?auto_351131 - BLOCK
      ?auto_351132 - BLOCK
      ?auto_351133 - BLOCK
      ?auto_351134 - BLOCK
      ?auto_351135 - BLOCK
      ?auto_351136 - BLOCK
      ?auto_351137 - BLOCK
      ?auto_351138 - BLOCK
      ?auto_351139 - BLOCK
      ?auto_351140 - BLOCK
    )
    :vars
    (
      ?auto_351141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351140 ?auto_351141 ) ( ON-TABLE ?auto_351128 ) ( not ( = ?auto_351128 ?auto_351129 ) ) ( not ( = ?auto_351128 ?auto_351130 ) ) ( not ( = ?auto_351128 ?auto_351131 ) ) ( not ( = ?auto_351128 ?auto_351132 ) ) ( not ( = ?auto_351128 ?auto_351133 ) ) ( not ( = ?auto_351128 ?auto_351134 ) ) ( not ( = ?auto_351128 ?auto_351135 ) ) ( not ( = ?auto_351128 ?auto_351136 ) ) ( not ( = ?auto_351128 ?auto_351137 ) ) ( not ( = ?auto_351128 ?auto_351138 ) ) ( not ( = ?auto_351128 ?auto_351139 ) ) ( not ( = ?auto_351128 ?auto_351140 ) ) ( not ( = ?auto_351128 ?auto_351141 ) ) ( not ( = ?auto_351129 ?auto_351130 ) ) ( not ( = ?auto_351129 ?auto_351131 ) ) ( not ( = ?auto_351129 ?auto_351132 ) ) ( not ( = ?auto_351129 ?auto_351133 ) ) ( not ( = ?auto_351129 ?auto_351134 ) ) ( not ( = ?auto_351129 ?auto_351135 ) ) ( not ( = ?auto_351129 ?auto_351136 ) ) ( not ( = ?auto_351129 ?auto_351137 ) ) ( not ( = ?auto_351129 ?auto_351138 ) ) ( not ( = ?auto_351129 ?auto_351139 ) ) ( not ( = ?auto_351129 ?auto_351140 ) ) ( not ( = ?auto_351129 ?auto_351141 ) ) ( not ( = ?auto_351130 ?auto_351131 ) ) ( not ( = ?auto_351130 ?auto_351132 ) ) ( not ( = ?auto_351130 ?auto_351133 ) ) ( not ( = ?auto_351130 ?auto_351134 ) ) ( not ( = ?auto_351130 ?auto_351135 ) ) ( not ( = ?auto_351130 ?auto_351136 ) ) ( not ( = ?auto_351130 ?auto_351137 ) ) ( not ( = ?auto_351130 ?auto_351138 ) ) ( not ( = ?auto_351130 ?auto_351139 ) ) ( not ( = ?auto_351130 ?auto_351140 ) ) ( not ( = ?auto_351130 ?auto_351141 ) ) ( not ( = ?auto_351131 ?auto_351132 ) ) ( not ( = ?auto_351131 ?auto_351133 ) ) ( not ( = ?auto_351131 ?auto_351134 ) ) ( not ( = ?auto_351131 ?auto_351135 ) ) ( not ( = ?auto_351131 ?auto_351136 ) ) ( not ( = ?auto_351131 ?auto_351137 ) ) ( not ( = ?auto_351131 ?auto_351138 ) ) ( not ( = ?auto_351131 ?auto_351139 ) ) ( not ( = ?auto_351131 ?auto_351140 ) ) ( not ( = ?auto_351131 ?auto_351141 ) ) ( not ( = ?auto_351132 ?auto_351133 ) ) ( not ( = ?auto_351132 ?auto_351134 ) ) ( not ( = ?auto_351132 ?auto_351135 ) ) ( not ( = ?auto_351132 ?auto_351136 ) ) ( not ( = ?auto_351132 ?auto_351137 ) ) ( not ( = ?auto_351132 ?auto_351138 ) ) ( not ( = ?auto_351132 ?auto_351139 ) ) ( not ( = ?auto_351132 ?auto_351140 ) ) ( not ( = ?auto_351132 ?auto_351141 ) ) ( not ( = ?auto_351133 ?auto_351134 ) ) ( not ( = ?auto_351133 ?auto_351135 ) ) ( not ( = ?auto_351133 ?auto_351136 ) ) ( not ( = ?auto_351133 ?auto_351137 ) ) ( not ( = ?auto_351133 ?auto_351138 ) ) ( not ( = ?auto_351133 ?auto_351139 ) ) ( not ( = ?auto_351133 ?auto_351140 ) ) ( not ( = ?auto_351133 ?auto_351141 ) ) ( not ( = ?auto_351134 ?auto_351135 ) ) ( not ( = ?auto_351134 ?auto_351136 ) ) ( not ( = ?auto_351134 ?auto_351137 ) ) ( not ( = ?auto_351134 ?auto_351138 ) ) ( not ( = ?auto_351134 ?auto_351139 ) ) ( not ( = ?auto_351134 ?auto_351140 ) ) ( not ( = ?auto_351134 ?auto_351141 ) ) ( not ( = ?auto_351135 ?auto_351136 ) ) ( not ( = ?auto_351135 ?auto_351137 ) ) ( not ( = ?auto_351135 ?auto_351138 ) ) ( not ( = ?auto_351135 ?auto_351139 ) ) ( not ( = ?auto_351135 ?auto_351140 ) ) ( not ( = ?auto_351135 ?auto_351141 ) ) ( not ( = ?auto_351136 ?auto_351137 ) ) ( not ( = ?auto_351136 ?auto_351138 ) ) ( not ( = ?auto_351136 ?auto_351139 ) ) ( not ( = ?auto_351136 ?auto_351140 ) ) ( not ( = ?auto_351136 ?auto_351141 ) ) ( not ( = ?auto_351137 ?auto_351138 ) ) ( not ( = ?auto_351137 ?auto_351139 ) ) ( not ( = ?auto_351137 ?auto_351140 ) ) ( not ( = ?auto_351137 ?auto_351141 ) ) ( not ( = ?auto_351138 ?auto_351139 ) ) ( not ( = ?auto_351138 ?auto_351140 ) ) ( not ( = ?auto_351138 ?auto_351141 ) ) ( not ( = ?auto_351139 ?auto_351140 ) ) ( not ( = ?auto_351139 ?auto_351141 ) ) ( not ( = ?auto_351140 ?auto_351141 ) ) ( ON ?auto_351139 ?auto_351140 ) ( ON ?auto_351138 ?auto_351139 ) ( ON ?auto_351137 ?auto_351138 ) ( ON ?auto_351136 ?auto_351137 ) ( ON ?auto_351135 ?auto_351136 ) ( ON ?auto_351134 ?auto_351135 ) ( ON ?auto_351133 ?auto_351134 ) ( ON ?auto_351132 ?auto_351133 ) ( ON ?auto_351131 ?auto_351132 ) ( ON ?auto_351130 ?auto_351131 ) ( CLEAR ?auto_351128 ) ( ON ?auto_351129 ?auto_351130 ) ( CLEAR ?auto_351129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_351128 ?auto_351129 )
      ( MAKE-13PILE ?auto_351128 ?auto_351129 ?auto_351130 ?auto_351131 ?auto_351132 ?auto_351133 ?auto_351134 ?auto_351135 ?auto_351136 ?auto_351137 ?auto_351138 ?auto_351139 ?auto_351140 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_351155 - BLOCK
      ?auto_351156 - BLOCK
      ?auto_351157 - BLOCK
      ?auto_351158 - BLOCK
      ?auto_351159 - BLOCK
      ?auto_351160 - BLOCK
      ?auto_351161 - BLOCK
      ?auto_351162 - BLOCK
      ?auto_351163 - BLOCK
      ?auto_351164 - BLOCK
      ?auto_351165 - BLOCK
      ?auto_351166 - BLOCK
      ?auto_351167 - BLOCK
    )
    :vars
    (
      ?auto_351168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351167 ?auto_351168 ) ( ON-TABLE ?auto_351155 ) ( not ( = ?auto_351155 ?auto_351156 ) ) ( not ( = ?auto_351155 ?auto_351157 ) ) ( not ( = ?auto_351155 ?auto_351158 ) ) ( not ( = ?auto_351155 ?auto_351159 ) ) ( not ( = ?auto_351155 ?auto_351160 ) ) ( not ( = ?auto_351155 ?auto_351161 ) ) ( not ( = ?auto_351155 ?auto_351162 ) ) ( not ( = ?auto_351155 ?auto_351163 ) ) ( not ( = ?auto_351155 ?auto_351164 ) ) ( not ( = ?auto_351155 ?auto_351165 ) ) ( not ( = ?auto_351155 ?auto_351166 ) ) ( not ( = ?auto_351155 ?auto_351167 ) ) ( not ( = ?auto_351155 ?auto_351168 ) ) ( not ( = ?auto_351156 ?auto_351157 ) ) ( not ( = ?auto_351156 ?auto_351158 ) ) ( not ( = ?auto_351156 ?auto_351159 ) ) ( not ( = ?auto_351156 ?auto_351160 ) ) ( not ( = ?auto_351156 ?auto_351161 ) ) ( not ( = ?auto_351156 ?auto_351162 ) ) ( not ( = ?auto_351156 ?auto_351163 ) ) ( not ( = ?auto_351156 ?auto_351164 ) ) ( not ( = ?auto_351156 ?auto_351165 ) ) ( not ( = ?auto_351156 ?auto_351166 ) ) ( not ( = ?auto_351156 ?auto_351167 ) ) ( not ( = ?auto_351156 ?auto_351168 ) ) ( not ( = ?auto_351157 ?auto_351158 ) ) ( not ( = ?auto_351157 ?auto_351159 ) ) ( not ( = ?auto_351157 ?auto_351160 ) ) ( not ( = ?auto_351157 ?auto_351161 ) ) ( not ( = ?auto_351157 ?auto_351162 ) ) ( not ( = ?auto_351157 ?auto_351163 ) ) ( not ( = ?auto_351157 ?auto_351164 ) ) ( not ( = ?auto_351157 ?auto_351165 ) ) ( not ( = ?auto_351157 ?auto_351166 ) ) ( not ( = ?auto_351157 ?auto_351167 ) ) ( not ( = ?auto_351157 ?auto_351168 ) ) ( not ( = ?auto_351158 ?auto_351159 ) ) ( not ( = ?auto_351158 ?auto_351160 ) ) ( not ( = ?auto_351158 ?auto_351161 ) ) ( not ( = ?auto_351158 ?auto_351162 ) ) ( not ( = ?auto_351158 ?auto_351163 ) ) ( not ( = ?auto_351158 ?auto_351164 ) ) ( not ( = ?auto_351158 ?auto_351165 ) ) ( not ( = ?auto_351158 ?auto_351166 ) ) ( not ( = ?auto_351158 ?auto_351167 ) ) ( not ( = ?auto_351158 ?auto_351168 ) ) ( not ( = ?auto_351159 ?auto_351160 ) ) ( not ( = ?auto_351159 ?auto_351161 ) ) ( not ( = ?auto_351159 ?auto_351162 ) ) ( not ( = ?auto_351159 ?auto_351163 ) ) ( not ( = ?auto_351159 ?auto_351164 ) ) ( not ( = ?auto_351159 ?auto_351165 ) ) ( not ( = ?auto_351159 ?auto_351166 ) ) ( not ( = ?auto_351159 ?auto_351167 ) ) ( not ( = ?auto_351159 ?auto_351168 ) ) ( not ( = ?auto_351160 ?auto_351161 ) ) ( not ( = ?auto_351160 ?auto_351162 ) ) ( not ( = ?auto_351160 ?auto_351163 ) ) ( not ( = ?auto_351160 ?auto_351164 ) ) ( not ( = ?auto_351160 ?auto_351165 ) ) ( not ( = ?auto_351160 ?auto_351166 ) ) ( not ( = ?auto_351160 ?auto_351167 ) ) ( not ( = ?auto_351160 ?auto_351168 ) ) ( not ( = ?auto_351161 ?auto_351162 ) ) ( not ( = ?auto_351161 ?auto_351163 ) ) ( not ( = ?auto_351161 ?auto_351164 ) ) ( not ( = ?auto_351161 ?auto_351165 ) ) ( not ( = ?auto_351161 ?auto_351166 ) ) ( not ( = ?auto_351161 ?auto_351167 ) ) ( not ( = ?auto_351161 ?auto_351168 ) ) ( not ( = ?auto_351162 ?auto_351163 ) ) ( not ( = ?auto_351162 ?auto_351164 ) ) ( not ( = ?auto_351162 ?auto_351165 ) ) ( not ( = ?auto_351162 ?auto_351166 ) ) ( not ( = ?auto_351162 ?auto_351167 ) ) ( not ( = ?auto_351162 ?auto_351168 ) ) ( not ( = ?auto_351163 ?auto_351164 ) ) ( not ( = ?auto_351163 ?auto_351165 ) ) ( not ( = ?auto_351163 ?auto_351166 ) ) ( not ( = ?auto_351163 ?auto_351167 ) ) ( not ( = ?auto_351163 ?auto_351168 ) ) ( not ( = ?auto_351164 ?auto_351165 ) ) ( not ( = ?auto_351164 ?auto_351166 ) ) ( not ( = ?auto_351164 ?auto_351167 ) ) ( not ( = ?auto_351164 ?auto_351168 ) ) ( not ( = ?auto_351165 ?auto_351166 ) ) ( not ( = ?auto_351165 ?auto_351167 ) ) ( not ( = ?auto_351165 ?auto_351168 ) ) ( not ( = ?auto_351166 ?auto_351167 ) ) ( not ( = ?auto_351166 ?auto_351168 ) ) ( not ( = ?auto_351167 ?auto_351168 ) ) ( ON ?auto_351166 ?auto_351167 ) ( ON ?auto_351165 ?auto_351166 ) ( ON ?auto_351164 ?auto_351165 ) ( ON ?auto_351163 ?auto_351164 ) ( ON ?auto_351162 ?auto_351163 ) ( ON ?auto_351161 ?auto_351162 ) ( ON ?auto_351160 ?auto_351161 ) ( ON ?auto_351159 ?auto_351160 ) ( ON ?auto_351158 ?auto_351159 ) ( ON ?auto_351157 ?auto_351158 ) ( CLEAR ?auto_351155 ) ( ON ?auto_351156 ?auto_351157 ) ( CLEAR ?auto_351156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_351155 ?auto_351156 )
      ( MAKE-13PILE ?auto_351155 ?auto_351156 ?auto_351157 ?auto_351158 ?auto_351159 ?auto_351160 ?auto_351161 ?auto_351162 ?auto_351163 ?auto_351164 ?auto_351165 ?auto_351166 ?auto_351167 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_351182 - BLOCK
      ?auto_351183 - BLOCK
      ?auto_351184 - BLOCK
      ?auto_351185 - BLOCK
      ?auto_351186 - BLOCK
      ?auto_351187 - BLOCK
      ?auto_351188 - BLOCK
      ?auto_351189 - BLOCK
      ?auto_351190 - BLOCK
      ?auto_351191 - BLOCK
      ?auto_351192 - BLOCK
      ?auto_351193 - BLOCK
      ?auto_351194 - BLOCK
    )
    :vars
    (
      ?auto_351195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351194 ?auto_351195 ) ( not ( = ?auto_351182 ?auto_351183 ) ) ( not ( = ?auto_351182 ?auto_351184 ) ) ( not ( = ?auto_351182 ?auto_351185 ) ) ( not ( = ?auto_351182 ?auto_351186 ) ) ( not ( = ?auto_351182 ?auto_351187 ) ) ( not ( = ?auto_351182 ?auto_351188 ) ) ( not ( = ?auto_351182 ?auto_351189 ) ) ( not ( = ?auto_351182 ?auto_351190 ) ) ( not ( = ?auto_351182 ?auto_351191 ) ) ( not ( = ?auto_351182 ?auto_351192 ) ) ( not ( = ?auto_351182 ?auto_351193 ) ) ( not ( = ?auto_351182 ?auto_351194 ) ) ( not ( = ?auto_351182 ?auto_351195 ) ) ( not ( = ?auto_351183 ?auto_351184 ) ) ( not ( = ?auto_351183 ?auto_351185 ) ) ( not ( = ?auto_351183 ?auto_351186 ) ) ( not ( = ?auto_351183 ?auto_351187 ) ) ( not ( = ?auto_351183 ?auto_351188 ) ) ( not ( = ?auto_351183 ?auto_351189 ) ) ( not ( = ?auto_351183 ?auto_351190 ) ) ( not ( = ?auto_351183 ?auto_351191 ) ) ( not ( = ?auto_351183 ?auto_351192 ) ) ( not ( = ?auto_351183 ?auto_351193 ) ) ( not ( = ?auto_351183 ?auto_351194 ) ) ( not ( = ?auto_351183 ?auto_351195 ) ) ( not ( = ?auto_351184 ?auto_351185 ) ) ( not ( = ?auto_351184 ?auto_351186 ) ) ( not ( = ?auto_351184 ?auto_351187 ) ) ( not ( = ?auto_351184 ?auto_351188 ) ) ( not ( = ?auto_351184 ?auto_351189 ) ) ( not ( = ?auto_351184 ?auto_351190 ) ) ( not ( = ?auto_351184 ?auto_351191 ) ) ( not ( = ?auto_351184 ?auto_351192 ) ) ( not ( = ?auto_351184 ?auto_351193 ) ) ( not ( = ?auto_351184 ?auto_351194 ) ) ( not ( = ?auto_351184 ?auto_351195 ) ) ( not ( = ?auto_351185 ?auto_351186 ) ) ( not ( = ?auto_351185 ?auto_351187 ) ) ( not ( = ?auto_351185 ?auto_351188 ) ) ( not ( = ?auto_351185 ?auto_351189 ) ) ( not ( = ?auto_351185 ?auto_351190 ) ) ( not ( = ?auto_351185 ?auto_351191 ) ) ( not ( = ?auto_351185 ?auto_351192 ) ) ( not ( = ?auto_351185 ?auto_351193 ) ) ( not ( = ?auto_351185 ?auto_351194 ) ) ( not ( = ?auto_351185 ?auto_351195 ) ) ( not ( = ?auto_351186 ?auto_351187 ) ) ( not ( = ?auto_351186 ?auto_351188 ) ) ( not ( = ?auto_351186 ?auto_351189 ) ) ( not ( = ?auto_351186 ?auto_351190 ) ) ( not ( = ?auto_351186 ?auto_351191 ) ) ( not ( = ?auto_351186 ?auto_351192 ) ) ( not ( = ?auto_351186 ?auto_351193 ) ) ( not ( = ?auto_351186 ?auto_351194 ) ) ( not ( = ?auto_351186 ?auto_351195 ) ) ( not ( = ?auto_351187 ?auto_351188 ) ) ( not ( = ?auto_351187 ?auto_351189 ) ) ( not ( = ?auto_351187 ?auto_351190 ) ) ( not ( = ?auto_351187 ?auto_351191 ) ) ( not ( = ?auto_351187 ?auto_351192 ) ) ( not ( = ?auto_351187 ?auto_351193 ) ) ( not ( = ?auto_351187 ?auto_351194 ) ) ( not ( = ?auto_351187 ?auto_351195 ) ) ( not ( = ?auto_351188 ?auto_351189 ) ) ( not ( = ?auto_351188 ?auto_351190 ) ) ( not ( = ?auto_351188 ?auto_351191 ) ) ( not ( = ?auto_351188 ?auto_351192 ) ) ( not ( = ?auto_351188 ?auto_351193 ) ) ( not ( = ?auto_351188 ?auto_351194 ) ) ( not ( = ?auto_351188 ?auto_351195 ) ) ( not ( = ?auto_351189 ?auto_351190 ) ) ( not ( = ?auto_351189 ?auto_351191 ) ) ( not ( = ?auto_351189 ?auto_351192 ) ) ( not ( = ?auto_351189 ?auto_351193 ) ) ( not ( = ?auto_351189 ?auto_351194 ) ) ( not ( = ?auto_351189 ?auto_351195 ) ) ( not ( = ?auto_351190 ?auto_351191 ) ) ( not ( = ?auto_351190 ?auto_351192 ) ) ( not ( = ?auto_351190 ?auto_351193 ) ) ( not ( = ?auto_351190 ?auto_351194 ) ) ( not ( = ?auto_351190 ?auto_351195 ) ) ( not ( = ?auto_351191 ?auto_351192 ) ) ( not ( = ?auto_351191 ?auto_351193 ) ) ( not ( = ?auto_351191 ?auto_351194 ) ) ( not ( = ?auto_351191 ?auto_351195 ) ) ( not ( = ?auto_351192 ?auto_351193 ) ) ( not ( = ?auto_351192 ?auto_351194 ) ) ( not ( = ?auto_351192 ?auto_351195 ) ) ( not ( = ?auto_351193 ?auto_351194 ) ) ( not ( = ?auto_351193 ?auto_351195 ) ) ( not ( = ?auto_351194 ?auto_351195 ) ) ( ON ?auto_351193 ?auto_351194 ) ( ON ?auto_351192 ?auto_351193 ) ( ON ?auto_351191 ?auto_351192 ) ( ON ?auto_351190 ?auto_351191 ) ( ON ?auto_351189 ?auto_351190 ) ( ON ?auto_351188 ?auto_351189 ) ( ON ?auto_351187 ?auto_351188 ) ( ON ?auto_351186 ?auto_351187 ) ( ON ?auto_351185 ?auto_351186 ) ( ON ?auto_351184 ?auto_351185 ) ( ON ?auto_351183 ?auto_351184 ) ( ON ?auto_351182 ?auto_351183 ) ( CLEAR ?auto_351182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_351182 )
      ( MAKE-13PILE ?auto_351182 ?auto_351183 ?auto_351184 ?auto_351185 ?auto_351186 ?auto_351187 ?auto_351188 ?auto_351189 ?auto_351190 ?auto_351191 ?auto_351192 ?auto_351193 ?auto_351194 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_351209 - BLOCK
      ?auto_351210 - BLOCK
      ?auto_351211 - BLOCK
      ?auto_351212 - BLOCK
      ?auto_351213 - BLOCK
      ?auto_351214 - BLOCK
      ?auto_351215 - BLOCK
      ?auto_351216 - BLOCK
      ?auto_351217 - BLOCK
      ?auto_351218 - BLOCK
      ?auto_351219 - BLOCK
      ?auto_351220 - BLOCK
      ?auto_351221 - BLOCK
    )
    :vars
    (
      ?auto_351222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351221 ?auto_351222 ) ( not ( = ?auto_351209 ?auto_351210 ) ) ( not ( = ?auto_351209 ?auto_351211 ) ) ( not ( = ?auto_351209 ?auto_351212 ) ) ( not ( = ?auto_351209 ?auto_351213 ) ) ( not ( = ?auto_351209 ?auto_351214 ) ) ( not ( = ?auto_351209 ?auto_351215 ) ) ( not ( = ?auto_351209 ?auto_351216 ) ) ( not ( = ?auto_351209 ?auto_351217 ) ) ( not ( = ?auto_351209 ?auto_351218 ) ) ( not ( = ?auto_351209 ?auto_351219 ) ) ( not ( = ?auto_351209 ?auto_351220 ) ) ( not ( = ?auto_351209 ?auto_351221 ) ) ( not ( = ?auto_351209 ?auto_351222 ) ) ( not ( = ?auto_351210 ?auto_351211 ) ) ( not ( = ?auto_351210 ?auto_351212 ) ) ( not ( = ?auto_351210 ?auto_351213 ) ) ( not ( = ?auto_351210 ?auto_351214 ) ) ( not ( = ?auto_351210 ?auto_351215 ) ) ( not ( = ?auto_351210 ?auto_351216 ) ) ( not ( = ?auto_351210 ?auto_351217 ) ) ( not ( = ?auto_351210 ?auto_351218 ) ) ( not ( = ?auto_351210 ?auto_351219 ) ) ( not ( = ?auto_351210 ?auto_351220 ) ) ( not ( = ?auto_351210 ?auto_351221 ) ) ( not ( = ?auto_351210 ?auto_351222 ) ) ( not ( = ?auto_351211 ?auto_351212 ) ) ( not ( = ?auto_351211 ?auto_351213 ) ) ( not ( = ?auto_351211 ?auto_351214 ) ) ( not ( = ?auto_351211 ?auto_351215 ) ) ( not ( = ?auto_351211 ?auto_351216 ) ) ( not ( = ?auto_351211 ?auto_351217 ) ) ( not ( = ?auto_351211 ?auto_351218 ) ) ( not ( = ?auto_351211 ?auto_351219 ) ) ( not ( = ?auto_351211 ?auto_351220 ) ) ( not ( = ?auto_351211 ?auto_351221 ) ) ( not ( = ?auto_351211 ?auto_351222 ) ) ( not ( = ?auto_351212 ?auto_351213 ) ) ( not ( = ?auto_351212 ?auto_351214 ) ) ( not ( = ?auto_351212 ?auto_351215 ) ) ( not ( = ?auto_351212 ?auto_351216 ) ) ( not ( = ?auto_351212 ?auto_351217 ) ) ( not ( = ?auto_351212 ?auto_351218 ) ) ( not ( = ?auto_351212 ?auto_351219 ) ) ( not ( = ?auto_351212 ?auto_351220 ) ) ( not ( = ?auto_351212 ?auto_351221 ) ) ( not ( = ?auto_351212 ?auto_351222 ) ) ( not ( = ?auto_351213 ?auto_351214 ) ) ( not ( = ?auto_351213 ?auto_351215 ) ) ( not ( = ?auto_351213 ?auto_351216 ) ) ( not ( = ?auto_351213 ?auto_351217 ) ) ( not ( = ?auto_351213 ?auto_351218 ) ) ( not ( = ?auto_351213 ?auto_351219 ) ) ( not ( = ?auto_351213 ?auto_351220 ) ) ( not ( = ?auto_351213 ?auto_351221 ) ) ( not ( = ?auto_351213 ?auto_351222 ) ) ( not ( = ?auto_351214 ?auto_351215 ) ) ( not ( = ?auto_351214 ?auto_351216 ) ) ( not ( = ?auto_351214 ?auto_351217 ) ) ( not ( = ?auto_351214 ?auto_351218 ) ) ( not ( = ?auto_351214 ?auto_351219 ) ) ( not ( = ?auto_351214 ?auto_351220 ) ) ( not ( = ?auto_351214 ?auto_351221 ) ) ( not ( = ?auto_351214 ?auto_351222 ) ) ( not ( = ?auto_351215 ?auto_351216 ) ) ( not ( = ?auto_351215 ?auto_351217 ) ) ( not ( = ?auto_351215 ?auto_351218 ) ) ( not ( = ?auto_351215 ?auto_351219 ) ) ( not ( = ?auto_351215 ?auto_351220 ) ) ( not ( = ?auto_351215 ?auto_351221 ) ) ( not ( = ?auto_351215 ?auto_351222 ) ) ( not ( = ?auto_351216 ?auto_351217 ) ) ( not ( = ?auto_351216 ?auto_351218 ) ) ( not ( = ?auto_351216 ?auto_351219 ) ) ( not ( = ?auto_351216 ?auto_351220 ) ) ( not ( = ?auto_351216 ?auto_351221 ) ) ( not ( = ?auto_351216 ?auto_351222 ) ) ( not ( = ?auto_351217 ?auto_351218 ) ) ( not ( = ?auto_351217 ?auto_351219 ) ) ( not ( = ?auto_351217 ?auto_351220 ) ) ( not ( = ?auto_351217 ?auto_351221 ) ) ( not ( = ?auto_351217 ?auto_351222 ) ) ( not ( = ?auto_351218 ?auto_351219 ) ) ( not ( = ?auto_351218 ?auto_351220 ) ) ( not ( = ?auto_351218 ?auto_351221 ) ) ( not ( = ?auto_351218 ?auto_351222 ) ) ( not ( = ?auto_351219 ?auto_351220 ) ) ( not ( = ?auto_351219 ?auto_351221 ) ) ( not ( = ?auto_351219 ?auto_351222 ) ) ( not ( = ?auto_351220 ?auto_351221 ) ) ( not ( = ?auto_351220 ?auto_351222 ) ) ( not ( = ?auto_351221 ?auto_351222 ) ) ( ON ?auto_351220 ?auto_351221 ) ( ON ?auto_351219 ?auto_351220 ) ( ON ?auto_351218 ?auto_351219 ) ( ON ?auto_351217 ?auto_351218 ) ( ON ?auto_351216 ?auto_351217 ) ( ON ?auto_351215 ?auto_351216 ) ( ON ?auto_351214 ?auto_351215 ) ( ON ?auto_351213 ?auto_351214 ) ( ON ?auto_351212 ?auto_351213 ) ( ON ?auto_351211 ?auto_351212 ) ( ON ?auto_351210 ?auto_351211 ) ( ON ?auto_351209 ?auto_351210 ) ( CLEAR ?auto_351209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_351209 )
      ( MAKE-13PILE ?auto_351209 ?auto_351210 ?auto_351211 ?auto_351212 ?auto_351213 ?auto_351214 ?auto_351215 ?auto_351216 ?auto_351217 ?auto_351218 ?auto_351219 ?auto_351220 ?auto_351221 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351237 - BLOCK
      ?auto_351238 - BLOCK
      ?auto_351239 - BLOCK
      ?auto_351240 - BLOCK
      ?auto_351241 - BLOCK
      ?auto_351242 - BLOCK
      ?auto_351243 - BLOCK
      ?auto_351244 - BLOCK
      ?auto_351245 - BLOCK
      ?auto_351246 - BLOCK
      ?auto_351247 - BLOCK
      ?auto_351248 - BLOCK
      ?auto_351249 - BLOCK
      ?auto_351250 - BLOCK
    )
    :vars
    (
      ?auto_351251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_351249 ) ( ON ?auto_351250 ?auto_351251 ) ( CLEAR ?auto_351250 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_351237 ) ( ON ?auto_351238 ?auto_351237 ) ( ON ?auto_351239 ?auto_351238 ) ( ON ?auto_351240 ?auto_351239 ) ( ON ?auto_351241 ?auto_351240 ) ( ON ?auto_351242 ?auto_351241 ) ( ON ?auto_351243 ?auto_351242 ) ( ON ?auto_351244 ?auto_351243 ) ( ON ?auto_351245 ?auto_351244 ) ( ON ?auto_351246 ?auto_351245 ) ( ON ?auto_351247 ?auto_351246 ) ( ON ?auto_351248 ?auto_351247 ) ( ON ?auto_351249 ?auto_351248 ) ( not ( = ?auto_351237 ?auto_351238 ) ) ( not ( = ?auto_351237 ?auto_351239 ) ) ( not ( = ?auto_351237 ?auto_351240 ) ) ( not ( = ?auto_351237 ?auto_351241 ) ) ( not ( = ?auto_351237 ?auto_351242 ) ) ( not ( = ?auto_351237 ?auto_351243 ) ) ( not ( = ?auto_351237 ?auto_351244 ) ) ( not ( = ?auto_351237 ?auto_351245 ) ) ( not ( = ?auto_351237 ?auto_351246 ) ) ( not ( = ?auto_351237 ?auto_351247 ) ) ( not ( = ?auto_351237 ?auto_351248 ) ) ( not ( = ?auto_351237 ?auto_351249 ) ) ( not ( = ?auto_351237 ?auto_351250 ) ) ( not ( = ?auto_351237 ?auto_351251 ) ) ( not ( = ?auto_351238 ?auto_351239 ) ) ( not ( = ?auto_351238 ?auto_351240 ) ) ( not ( = ?auto_351238 ?auto_351241 ) ) ( not ( = ?auto_351238 ?auto_351242 ) ) ( not ( = ?auto_351238 ?auto_351243 ) ) ( not ( = ?auto_351238 ?auto_351244 ) ) ( not ( = ?auto_351238 ?auto_351245 ) ) ( not ( = ?auto_351238 ?auto_351246 ) ) ( not ( = ?auto_351238 ?auto_351247 ) ) ( not ( = ?auto_351238 ?auto_351248 ) ) ( not ( = ?auto_351238 ?auto_351249 ) ) ( not ( = ?auto_351238 ?auto_351250 ) ) ( not ( = ?auto_351238 ?auto_351251 ) ) ( not ( = ?auto_351239 ?auto_351240 ) ) ( not ( = ?auto_351239 ?auto_351241 ) ) ( not ( = ?auto_351239 ?auto_351242 ) ) ( not ( = ?auto_351239 ?auto_351243 ) ) ( not ( = ?auto_351239 ?auto_351244 ) ) ( not ( = ?auto_351239 ?auto_351245 ) ) ( not ( = ?auto_351239 ?auto_351246 ) ) ( not ( = ?auto_351239 ?auto_351247 ) ) ( not ( = ?auto_351239 ?auto_351248 ) ) ( not ( = ?auto_351239 ?auto_351249 ) ) ( not ( = ?auto_351239 ?auto_351250 ) ) ( not ( = ?auto_351239 ?auto_351251 ) ) ( not ( = ?auto_351240 ?auto_351241 ) ) ( not ( = ?auto_351240 ?auto_351242 ) ) ( not ( = ?auto_351240 ?auto_351243 ) ) ( not ( = ?auto_351240 ?auto_351244 ) ) ( not ( = ?auto_351240 ?auto_351245 ) ) ( not ( = ?auto_351240 ?auto_351246 ) ) ( not ( = ?auto_351240 ?auto_351247 ) ) ( not ( = ?auto_351240 ?auto_351248 ) ) ( not ( = ?auto_351240 ?auto_351249 ) ) ( not ( = ?auto_351240 ?auto_351250 ) ) ( not ( = ?auto_351240 ?auto_351251 ) ) ( not ( = ?auto_351241 ?auto_351242 ) ) ( not ( = ?auto_351241 ?auto_351243 ) ) ( not ( = ?auto_351241 ?auto_351244 ) ) ( not ( = ?auto_351241 ?auto_351245 ) ) ( not ( = ?auto_351241 ?auto_351246 ) ) ( not ( = ?auto_351241 ?auto_351247 ) ) ( not ( = ?auto_351241 ?auto_351248 ) ) ( not ( = ?auto_351241 ?auto_351249 ) ) ( not ( = ?auto_351241 ?auto_351250 ) ) ( not ( = ?auto_351241 ?auto_351251 ) ) ( not ( = ?auto_351242 ?auto_351243 ) ) ( not ( = ?auto_351242 ?auto_351244 ) ) ( not ( = ?auto_351242 ?auto_351245 ) ) ( not ( = ?auto_351242 ?auto_351246 ) ) ( not ( = ?auto_351242 ?auto_351247 ) ) ( not ( = ?auto_351242 ?auto_351248 ) ) ( not ( = ?auto_351242 ?auto_351249 ) ) ( not ( = ?auto_351242 ?auto_351250 ) ) ( not ( = ?auto_351242 ?auto_351251 ) ) ( not ( = ?auto_351243 ?auto_351244 ) ) ( not ( = ?auto_351243 ?auto_351245 ) ) ( not ( = ?auto_351243 ?auto_351246 ) ) ( not ( = ?auto_351243 ?auto_351247 ) ) ( not ( = ?auto_351243 ?auto_351248 ) ) ( not ( = ?auto_351243 ?auto_351249 ) ) ( not ( = ?auto_351243 ?auto_351250 ) ) ( not ( = ?auto_351243 ?auto_351251 ) ) ( not ( = ?auto_351244 ?auto_351245 ) ) ( not ( = ?auto_351244 ?auto_351246 ) ) ( not ( = ?auto_351244 ?auto_351247 ) ) ( not ( = ?auto_351244 ?auto_351248 ) ) ( not ( = ?auto_351244 ?auto_351249 ) ) ( not ( = ?auto_351244 ?auto_351250 ) ) ( not ( = ?auto_351244 ?auto_351251 ) ) ( not ( = ?auto_351245 ?auto_351246 ) ) ( not ( = ?auto_351245 ?auto_351247 ) ) ( not ( = ?auto_351245 ?auto_351248 ) ) ( not ( = ?auto_351245 ?auto_351249 ) ) ( not ( = ?auto_351245 ?auto_351250 ) ) ( not ( = ?auto_351245 ?auto_351251 ) ) ( not ( = ?auto_351246 ?auto_351247 ) ) ( not ( = ?auto_351246 ?auto_351248 ) ) ( not ( = ?auto_351246 ?auto_351249 ) ) ( not ( = ?auto_351246 ?auto_351250 ) ) ( not ( = ?auto_351246 ?auto_351251 ) ) ( not ( = ?auto_351247 ?auto_351248 ) ) ( not ( = ?auto_351247 ?auto_351249 ) ) ( not ( = ?auto_351247 ?auto_351250 ) ) ( not ( = ?auto_351247 ?auto_351251 ) ) ( not ( = ?auto_351248 ?auto_351249 ) ) ( not ( = ?auto_351248 ?auto_351250 ) ) ( not ( = ?auto_351248 ?auto_351251 ) ) ( not ( = ?auto_351249 ?auto_351250 ) ) ( not ( = ?auto_351249 ?auto_351251 ) ) ( not ( = ?auto_351250 ?auto_351251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_351250 ?auto_351251 )
      ( !STACK ?auto_351250 ?auto_351249 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351266 - BLOCK
      ?auto_351267 - BLOCK
      ?auto_351268 - BLOCK
      ?auto_351269 - BLOCK
      ?auto_351270 - BLOCK
      ?auto_351271 - BLOCK
      ?auto_351272 - BLOCK
      ?auto_351273 - BLOCK
      ?auto_351274 - BLOCK
      ?auto_351275 - BLOCK
      ?auto_351276 - BLOCK
      ?auto_351277 - BLOCK
      ?auto_351278 - BLOCK
      ?auto_351279 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_351278 ) ( ON-TABLE ?auto_351279 ) ( CLEAR ?auto_351279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_351266 ) ( ON ?auto_351267 ?auto_351266 ) ( ON ?auto_351268 ?auto_351267 ) ( ON ?auto_351269 ?auto_351268 ) ( ON ?auto_351270 ?auto_351269 ) ( ON ?auto_351271 ?auto_351270 ) ( ON ?auto_351272 ?auto_351271 ) ( ON ?auto_351273 ?auto_351272 ) ( ON ?auto_351274 ?auto_351273 ) ( ON ?auto_351275 ?auto_351274 ) ( ON ?auto_351276 ?auto_351275 ) ( ON ?auto_351277 ?auto_351276 ) ( ON ?auto_351278 ?auto_351277 ) ( not ( = ?auto_351266 ?auto_351267 ) ) ( not ( = ?auto_351266 ?auto_351268 ) ) ( not ( = ?auto_351266 ?auto_351269 ) ) ( not ( = ?auto_351266 ?auto_351270 ) ) ( not ( = ?auto_351266 ?auto_351271 ) ) ( not ( = ?auto_351266 ?auto_351272 ) ) ( not ( = ?auto_351266 ?auto_351273 ) ) ( not ( = ?auto_351266 ?auto_351274 ) ) ( not ( = ?auto_351266 ?auto_351275 ) ) ( not ( = ?auto_351266 ?auto_351276 ) ) ( not ( = ?auto_351266 ?auto_351277 ) ) ( not ( = ?auto_351266 ?auto_351278 ) ) ( not ( = ?auto_351266 ?auto_351279 ) ) ( not ( = ?auto_351267 ?auto_351268 ) ) ( not ( = ?auto_351267 ?auto_351269 ) ) ( not ( = ?auto_351267 ?auto_351270 ) ) ( not ( = ?auto_351267 ?auto_351271 ) ) ( not ( = ?auto_351267 ?auto_351272 ) ) ( not ( = ?auto_351267 ?auto_351273 ) ) ( not ( = ?auto_351267 ?auto_351274 ) ) ( not ( = ?auto_351267 ?auto_351275 ) ) ( not ( = ?auto_351267 ?auto_351276 ) ) ( not ( = ?auto_351267 ?auto_351277 ) ) ( not ( = ?auto_351267 ?auto_351278 ) ) ( not ( = ?auto_351267 ?auto_351279 ) ) ( not ( = ?auto_351268 ?auto_351269 ) ) ( not ( = ?auto_351268 ?auto_351270 ) ) ( not ( = ?auto_351268 ?auto_351271 ) ) ( not ( = ?auto_351268 ?auto_351272 ) ) ( not ( = ?auto_351268 ?auto_351273 ) ) ( not ( = ?auto_351268 ?auto_351274 ) ) ( not ( = ?auto_351268 ?auto_351275 ) ) ( not ( = ?auto_351268 ?auto_351276 ) ) ( not ( = ?auto_351268 ?auto_351277 ) ) ( not ( = ?auto_351268 ?auto_351278 ) ) ( not ( = ?auto_351268 ?auto_351279 ) ) ( not ( = ?auto_351269 ?auto_351270 ) ) ( not ( = ?auto_351269 ?auto_351271 ) ) ( not ( = ?auto_351269 ?auto_351272 ) ) ( not ( = ?auto_351269 ?auto_351273 ) ) ( not ( = ?auto_351269 ?auto_351274 ) ) ( not ( = ?auto_351269 ?auto_351275 ) ) ( not ( = ?auto_351269 ?auto_351276 ) ) ( not ( = ?auto_351269 ?auto_351277 ) ) ( not ( = ?auto_351269 ?auto_351278 ) ) ( not ( = ?auto_351269 ?auto_351279 ) ) ( not ( = ?auto_351270 ?auto_351271 ) ) ( not ( = ?auto_351270 ?auto_351272 ) ) ( not ( = ?auto_351270 ?auto_351273 ) ) ( not ( = ?auto_351270 ?auto_351274 ) ) ( not ( = ?auto_351270 ?auto_351275 ) ) ( not ( = ?auto_351270 ?auto_351276 ) ) ( not ( = ?auto_351270 ?auto_351277 ) ) ( not ( = ?auto_351270 ?auto_351278 ) ) ( not ( = ?auto_351270 ?auto_351279 ) ) ( not ( = ?auto_351271 ?auto_351272 ) ) ( not ( = ?auto_351271 ?auto_351273 ) ) ( not ( = ?auto_351271 ?auto_351274 ) ) ( not ( = ?auto_351271 ?auto_351275 ) ) ( not ( = ?auto_351271 ?auto_351276 ) ) ( not ( = ?auto_351271 ?auto_351277 ) ) ( not ( = ?auto_351271 ?auto_351278 ) ) ( not ( = ?auto_351271 ?auto_351279 ) ) ( not ( = ?auto_351272 ?auto_351273 ) ) ( not ( = ?auto_351272 ?auto_351274 ) ) ( not ( = ?auto_351272 ?auto_351275 ) ) ( not ( = ?auto_351272 ?auto_351276 ) ) ( not ( = ?auto_351272 ?auto_351277 ) ) ( not ( = ?auto_351272 ?auto_351278 ) ) ( not ( = ?auto_351272 ?auto_351279 ) ) ( not ( = ?auto_351273 ?auto_351274 ) ) ( not ( = ?auto_351273 ?auto_351275 ) ) ( not ( = ?auto_351273 ?auto_351276 ) ) ( not ( = ?auto_351273 ?auto_351277 ) ) ( not ( = ?auto_351273 ?auto_351278 ) ) ( not ( = ?auto_351273 ?auto_351279 ) ) ( not ( = ?auto_351274 ?auto_351275 ) ) ( not ( = ?auto_351274 ?auto_351276 ) ) ( not ( = ?auto_351274 ?auto_351277 ) ) ( not ( = ?auto_351274 ?auto_351278 ) ) ( not ( = ?auto_351274 ?auto_351279 ) ) ( not ( = ?auto_351275 ?auto_351276 ) ) ( not ( = ?auto_351275 ?auto_351277 ) ) ( not ( = ?auto_351275 ?auto_351278 ) ) ( not ( = ?auto_351275 ?auto_351279 ) ) ( not ( = ?auto_351276 ?auto_351277 ) ) ( not ( = ?auto_351276 ?auto_351278 ) ) ( not ( = ?auto_351276 ?auto_351279 ) ) ( not ( = ?auto_351277 ?auto_351278 ) ) ( not ( = ?auto_351277 ?auto_351279 ) ) ( not ( = ?auto_351278 ?auto_351279 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_351279 )
      ( !STACK ?auto_351279 ?auto_351278 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351294 - BLOCK
      ?auto_351295 - BLOCK
      ?auto_351296 - BLOCK
      ?auto_351297 - BLOCK
      ?auto_351298 - BLOCK
      ?auto_351299 - BLOCK
      ?auto_351300 - BLOCK
      ?auto_351301 - BLOCK
      ?auto_351302 - BLOCK
      ?auto_351303 - BLOCK
      ?auto_351304 - BLOCK
      ?auto_351305 - BLOCK
      ?auto_351306 - BLOCK
      ?auto_351307 - BLOCK
    )
    :vars
    (
      ?auto_351308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351307 ?auto_351308 ) ( ON-TABLE ?auto_351294 ) ( ON ?auto_351295 ?auto_351294 ) ( ON ?auto_351296 ?auto_351295 ) ( ON ?auto_351297 ?auto_351296 ) ( ON ?auto_351298 ?auto_351297 ) ( ON ?auto_351299 ?auto_351298 ) ( ON ?auto_351300 ?auto_351299 ) ( ON ?auto_351301 ?auto_351300 ) ( ON ?auto_351302 ?auto_351301 ) ( ON ?auto_351303 ?auto_351302 ) ( ON ?auto_351304 ?auto_351303 ) ( ON ?auto_351305 ?auto_351304 ) ( not ( = ?auto_351294 ?auto_351295 ) ) ( not ( = ?auto_351294 ?auto_351296 ) ) ( not ( = ?auto_351294 ?auto_351297 ) ) ( not ( = ?auto_351294 ?auto_351298 ) ) ( not ( = ?auto_351294 ?auto_351299 ) ) ( not ( = ?auto_351294 ?auto_351300 ) ) ( not ( = ?auto_351294 ?auto_351301 ) ) ( not ( = ?auto_351294 ?auto_351302 ) ) ( not ( = ?auto_351294 ?auto_351303 ) ) ( not ( = ?auto_351294 ?auto_351304 ) ) ( not ( = ?auto_351294 ?auto_351305 ) ) ( not ( = ?auto_351294 ?auto_351306 ) ) ( not ( = ?auto_351294 ?auto_351307 ) ) ( not ( = ?auto_351294 ?auto_351308 ) ) ( not ( = ?auto_351295 ?auto_351296 ) ) ( not ( = ?auto_351295 ?auto_351297 ) ) ( not ( = ?auto_351295 ?auto_351298 ) ) ( not ( = ?auto_351295 ?auto_351299 ) ) ( not ( = ?auto_351295 ?auto_351300 ) ) ( not ( = ?auto_351295 ?auto_351301 ) ) ( not ( = ?auto_351295 ?auto_351302 ) ) ( not ( = ?auto_351295 ?auto_351303 ) ) ( not ( = ?auto_351295 ?auto_351304 ) ) ( not ( = ?auto_351295 ?auto_351305 ) ) ( not ( = ?auto_351295 ?auto_351306 ) ) ( not ( = ?auto_351295 ?auto_351307 ) ) ( not ( = ?auto_351295 ?auto_351308 ) ) ( not ( = ?auto_351296 ?auto_351297 ) ) ( not ( = ?auto_351296 ?auto_351298 ) ) ( not ( = ?auto_351296 ?auto_351299 ) ) ( not ( = ?auto_351296 ?auto_351300 ) ) ( not ( = ?auto_351296 ?auto_351301 ) ) ( not ( = ?auto_351296 ?auto_351302 ) ) ( not ( = ?auto_351296 ?auto_351303 ) ) ( not ( = ?auto_351296 ?auto_351304 ) ) ( not ( = ?auto_351296 ?auto_351305 ) ) ( not ( = ?auto_351296 ?auto_351306 ) ) ( not ( = ?auto_351296 ?auto_351307 ) ) ( not ( = ?auto_351296 ?auto_351308 ) ) ( not ( = ?auto_351297 ?auto_351298 ) ) ( not ( = ?auto_351297 ?auto_351299 ) ) ( not ( = ?auto_351297 ?auto_351300 ) ) ( not ( = ?auto_351297 ?auto_351301 ) ) ( not ( = ?auto_351297 ?auto_351302 ) ) ( not ( = ?auto_351297 ?auto_351303 ) ) ( not ( = ?auto_351297 ?auto_351304 ) ) ( not ( = ?auto_351297 ?auto_351305 ) ) ( not ( = ?auto_351297 ?auto_351306 ) ) ( not ( = ?auto_351297 ?auto_351307 ) ) ( not ( = ?auto_351297 ?auto_351308 ) ) ( not ( = ?auto_351298 ?auto_351299 ) ) ( not ( = ?auto_351298 ?auto_351300 ) ) ( not ( = ?auto_351298 ?auto_351301 ) ) ( not ( = ?auto_351298 ?auto_351302 ) ) ( not ( = ?auto_351298 ?auto_351303 ) ) ( not ( = ?auto_351298 ?auto_351304 ) ) ( not ( = ?auto_351298 ?auto_351305 ) ) ( not ( = ?auto_351298 ?auto_351306 ) ) ( not ( = ?auto_351298 ?auto_351307 ) ) ( not ( = ?auto_351298 ?auto_351308 ) ) ( not ( = ?auto_351299 ?auto_351300 ) ) ( not ( = ?auto_351299 ?auto_351301 ) ) ( not ( = ?auto_351299 ?auto_351302 ) ) ( not ( = ?auto_351299 ?auto_351303 ) ) ( not ( = ?auto_351299 ?auto_351304 ) ) ( not ( = ?auto_351299 ?auto_351305 ) ) ( not ( = ?auto_351299 ?auto_351306 ) ) ( not ( = ?auto_351299 ?auto_351307 ) ) ( not ( = ?auto_351299 ?auto_351308 ) ) ( not ( = ?auto_351300 ?auto_351301 ) ) ( not ( = ?auto_351300 ?auto_351302 ) ) ( not ( = ?auto_351300 ?auto_351303 ) ) ( not ( = ?auto_351300 ?auto_351304 ) ) ( not ( = ?auto_351300 ?auto_351305 ) ) ( not ( = ?auto_351300 ?auto_351306 ) ) ( not ( = ?auto_351300 ?auto_351307 ) ) ( not ( = ?auto_351300 ?auto_351308 ) ) ( not ( = ?auto_351301 ?auto_351302 ) ) ( not ( = ?auto_351301 ?auto_351303 ) ) ( not ( = ?auto_351301 ?auto_351304 ) ) ( not ( = ?auto_351301 ?auto_351305 ) ) ( not ( = ?auto_351301 ?auto_351306 ) ) ( not ( = ?auto_351301 ?auto_351307 ) ) ( not ( = ?auto_351301 ?auto_351308 ) ) ( not ( = ?auto_351302 ?auto_351303 ) ) ( not ( = ?auto_351302 ?auto_351304 ) ) ( not ( = ?auto_351302 ?auto_351305 ) ) ( not ( = ?auto_351302 ?auto_351306 ) ) ( not ( = ?auto_351302 ?auto_351307 ) ) ( not ( = ?auto_351302 ?auto_351308 ) ) ( not ( = ?auto_351303 ?auto_351304 ) ) ( not ( = ?auto_351303 ?auto_351305 ) ) ( not ( = ?auto_351303 ?auto_351306 ) ) ( not ( = ?auto_351303 ?auto_351307 ) ) ( not ( = ?auto_351303 ?auto_351308 ) ) ( not ( = ?auto_351304 ?auto_351305 ) ) ( not ( = ?auto_351304 ?auto_351306 ) ) ( not ( = ?auto_351304 ?auto_351307 ) ) ( not ( = ?auto_351304 ?auto_351308 ) ) ( not ( = ?auto_351305 ?auto_351306 ) ) ( not ( = ?auto_351305 ?auto_351307 ) ) ( not ( = ?auto_351305 ?auto_351308 ) ) ( not ( = ?auto_351306 ?auto_351307 ) ) ( not ( = ?auto_351306 ?auto_351308 ) ) ( not ( = ?auto_351307 ?auto_351308 ) ) ( CLEAR ?auto_351305 ) ( ON ?auto_351306 ?auto_351307 ) ( CLEAR ?auto_351306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_351294 ?auto_351295 ?auto_351296 ?auto_351297 ?auto_351298 ?auto_351299 ?auto_351300 ?auto_351301 ?auto_351302 ?auto_351303 ?auto_351304 ?auto_351305 ?auto_351306 )
      ( MAKE-14PILE ?auto_351294 ?auto_351295 ?auto_351296 ?auto_351297 ?auto_351298 ?auto_351299 ?auto_351300 ?auto_351301 ?auto_351302 ?auto_351303 ?auto_351304 ?auto_351305 ?auto_351306 ?auto_351307 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351323 - BLOCK
      ?auto_351324 - BLOCK
      ?auto_351325 - BLOCK
      ?auto_351326 - BLOCK
      ?auto_351327 - BLOCK
      ?auto_351328 - BLOCK
      ?auto_351329 - BLOCK
      ?auto_351330 - BLOCK
      ?auto_351331 - BLOCK
      ?auto_351332 - BLOCK
      ?auto_351333 - BLOCK
      ?auto_351334 - BLOCK
      ?auto_351335 - BLOCK
      ?auto_351336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351336 ) ( ON-TABLE ?auto_351323 ) ( ON ?auto_351324 ?auto_351323 ) ( ON ?auto_351325 ?auto_351324 ) ( ON ?auto_351326 ?auto_351325 ) ( ON ?auto_351327 ?auto_351326 ) ( ON ?auto_351328 ?auto_351327 ) ( ON ?auto_351329 ?auto_351328 ) ( ON ?auto_351330 ?auto_351329 ) ( ON ?auto_351331 ?auto_351330 ) ( ON ?auto_351332 ?auto_351331 ) ( ON ?auto_351333 ?auto_351332 ) ( ON ?auto_351334 ?auto_351333 ) ( not ( = ?auto_351323 ?auto_351324 ) ) ( not ( = ?auto_351323 ?auto_351325 ) ) ( not ( = ?auto_351323 ?auto_351326 ) ) ( not ( = ?auto_351323 ?auto_351327 ) ) ( not ( = ?auto_351323 ?auto_351328 ) ) ( not ( = ?auto_351323 ?auto_351329 ) ) ( not ( = ?auto_351323 ?auto_351330 ) ) ( not ( = ?auto_351323 ?auto_351331 ) ) ( not ( = ?auto_351323 ?auto_351332 ) ) ( not ( = ?auto_351323 ?auto_351333 ) ) ( not ( = ?auto_351323 ?auto_351334 ) ) ( not ( = ?auto_351323 ?auto_351335 ) ) ( not ( = ?auto_351323 ?auto_351336 ) ) ( not ( = ?auto_351324 ?auto_351325 ) ) ( not ( = ?auto_351324 ?auto_351326 ) ) ( not ( = ?auto_351324 ?auto_351327 ) ) ( not ( = ?auto_351324 ?auto_351328 ) ) ( not ( = ?auto_351324 ?auto_351329 ) ) ( not ( = ?auto_351324 ?auto_351330 ) ) ( not ( = ?auto_351324 ?auto_351331 ) ) ( not ( = ?auto_351324 ?auto_351332 ) ) ( not ( = ?auto_351324 ?auto_351333 ) ) ( not ( = ?auto_351324 ?auto_351334 ) ) ( not ( = ?auto_351324 ?auto_351335 ) ) ( not ( = ?auto_351324 ?auto_351336 ) ) ( not ( = ?auto_351325 ?auto_351326 ) ) ( not ( = ?auto_351325 ?auto_351327 ) ) ( not ( = ?auto_351325 ?auto_351328 ) ) ( not ( = ?auto_351325 ?auto_351329 ) ) ( not ( = ?auto_351325 ?auto_351330 ) ) ( not ( = ?auto_351325 ?auto_351331 ) ) ( not ( = ?auto_351325 ?auto_351332 ) ) ( not ( = ?auto_351325 ?auto_351333 ) ) ( not ( = ?auto_351325 ?auto_351334 ) ) ( not ( = ?auto_351325 ?auto_351335 ) ) ( not ( = ?auto_351325 ?auto_351336 ) ) ( not ( = ?auto_351326 ?auto_351327 ) ) ( not ( = ?auto_351326 ?auto_351328 ) ) ( not ( = ?auto_351326 ?auto_351329 ) ) ( not ( = ?auto_351326 ?auto_351330 ) ) ( not ( = ?auto_351326 ?auto_351331 ) ) ( not ( = ?auto_351326 ?auto_351332 ) ) ( not ( = ?auto_351326 ?auto_351333 ) ) ( not ( = ?auto_351326 ?auto_351334 ) ) ( not ( = ?auto_351326 ?auto_351335 ) ) ( not ( = ?auto_351326 ?auto_351336 ) ) ( not ( = ?auto_351327 ?auto_351328 ) ) ( not ( = ?auto_351327 ?auto_351329 ) ) ( not ( = ?auto_351327 ?auto_351330 ) ) ( not ( = ?auto_351327 ?auto_351331 ) ) ( not ( = ?auto_351327 ?auto_351332 ) ) ( not ( = ?auto_351327 ?auto_351333 ) ) ( not ( = ?auto_351327 ?auto_351334 ) ) ( not ( = ?auto_351327 ?auto_351335 ) ) ( not ( = ?auto_351327 ?auto_351336 ) ) ( not ( = ?auto_351328 ?auto_351329 ) ) ( not ( = ?auto_351328 ?auto_351330 ) ) ( not ( = ?auto_351328 ?auto_351331 ) ) ( not ( = ?auto_351328 ?auto_351332 ) ) ( not ( = ?auto_351328 ?auto_351333 ) ) ( not ( = ?auto_351328 ?auto_351334 ) ) ( not ( = ?auto_351328 ?auto_351335 ) ) ( not ( = ?auto_351328 ?auto_351336 ) ) ( not ( = ?auto_351329 ?auto_351330 ) ) ( not ( = ?auto_351329 ?auto_351331 ) ) ( not ( = ?auto_351329 ?auto_351332 ) ) ( not ( = ?auto_351329 ?auto_351333 ) ) ( not ( = ?auto_351329 ?auto_351334 ) ) ( not ( = ?auto_351329 ?auto_351335 ) ) ( not ( = ?auto_351329 ?auto_351336 ) ) ( not ( = ?auto_351330 ?auto_351331 ) ) ( not ( = ?auto_351330 ?auto_351332 ) ) ( not ( = ?auto_351330 ?auto_351333 ) ) ( not ( = ?auto_351330 ?auto_351334 ) ) ( not ( = ?auto_351330 ?auto_351335 ) ) ( not ( = ?auto_351330 ?auto_351336 ) ) ( not ( = ?auto_351331 ?auto_351332 ) ) ( not ( = ?auto_351331 ?auto_351333 ) ) ( not ( = ?auto_351331 ?auto_351334 ) ) ( not ( = ?auto_351331 ?auto_351335 ) ) ( not ( = ?auto_351331 ?auto_351336 ) ) ( not ( = ?auto_351332 ?auto_351333 ) ) ( not ( = ?auto_351332 ?auto_351334 ) ) ( not ( = ?auto_351332 ?auto_351335 ) ) ( not ( = ?auto_351332 ?auto_351336 ) ) ( not ( = ?auto_351333 ?auto_351334 ) ) ( not ( = ?auto_351333 ?auto_351335 ) ) ( not ( = ?auto_351333 ?auto_351336 ) ) ( not ( = ?auto_351334 ?auto_351335 ) ) ( not ( = ?auto_351334 ?auto_351336 ) ) ( not ( = ?auto_351335 ?auto_351336 ) ) ( CLEAR ?auto_351334 ) ( ON ?auto_351335 ?auto_351336 ) ( CLEAR ?auto_351335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_351323 ?auto_351324 ?auto_351325 ?auto_351326 ?auto_351327 ?auto_351328 ?auto_351329 ?auto_351330 ?auto_351331 ?auto_351332 ?auto_351333 ?auto_351334 ?auto_351335 )
      ( MAKE-14PILE ?auto_351323 ?auto_351324 ?auto_351325 ?auto_351326 ?auto_351327 ?auto_351328 ?auto_351329 ?auto_351330 ?auto_351331 ?auto_351332 ?auto_351333 ?auto_351334 ?auto_351335 ?auto_351336 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351351 - BLOCK
      ?auto_351352 - BLOCK
      ?auto_351353 - BLOCK
      ?auto_351354 - BLOCK
      ?auto_351355 - BLOCK
      ?auto_351356 - BLOCK
      ?auto_351357 - BLOCK
      ?auto_351358 - BLOCK
      ?auto_351359 - BLOCK
      ?auto_351360 - BLOCK
      ?auto_351361 - BLOCK
      ?auto_351362 - BLOCK
      ?auto_351363 - BLOCK
      ?auto_351364 - BLOCK
    )
    :vars
    (
      ?auto_351365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351364 ?auto_351365 ) ( ON-TABLE ?auto_351351 ) ( ON ?auto_351352 ?auto_351351 ) ( ON ?auto_351353 ?auto_351352 ) ( ON ?auto_351354 ?auto_351353 ) ( ON ?auto_351355 ?auto_351354 ) ( ON ?auto_351356 ?auto_351355 ) ( ON ?auto_351357 ?auto_351356 ) ( ON ?auto_351358 ?auto_351357 ) ( ON ?auto_351359 ?auto_351358 ) ( ON ?auto_351360 ?auto_351359 ) ( ON ?auto_351361 ?auto_351360 ) ( not ( = ?auto_351351 ?auto_351352 ) ) ( not ( = ?auto_351351 ?auto_351353 ) ) ( not ( = ?auto_351351 ?auto_351354 ) ) ( not ( = ?auto_351351 ?auto_351355 ) ) ( not ( = ?auto_351351 ?auto_351356 ) ) ( not ( = ?auto_351351 ?auto_351357 ) ) ( not ( = ?auto_351351 ?auto_351358 ) ) ( not ( = ?auto_351351 ?auto_351359 ) ) ( not ( = ?auto_351351 ?auto_351360 ) ) ( not ( = ?auto_351351 ?auto_351361 ) ) ( not ( = ?auto_351351 ?auto_351362 ) ) ( not ( = ?auto_351351 ?auto_351363 ) ) ( not ( = ?auto_351351 ?auto_351364 ) ) ( not ( = ?auto_351351 ?auto_351365 ) ) ( not ( = ?auto_351352 ?auto_351353 ) ) ( not ( = ?auto_351352 ?auto_351354 ) ) ( not ( = ?auto_351352 ?auto_351355 ) ) ( not ( = ?auto_351352 ?auto_351356 ) ) ( not ( = ?auto_351352 ?auto_351357 ) ) ( not ( = ?auto_351352 ?auto_351358 ) ) ( not ( = ?auto_351352 ?auto_351359 ) ) ( not ( = ?auto_351352 ?auto_351360 ) ) ( not ( = ?auto_351352 ?auto_351361 ) ) ( not ( = ?auto_351352 ?auto_351362 ) ) ( not ( = ?auto_351352 ?auto_351363 ) ) ( not ( = ?auto_351352 ?auto_351364 ) ) ( not ( = ?auto_351352 ?auto_351365 ) ) ( not ( = ?auto_351353 ?auto_351354 ) ) ( not ( = ?auto_351353 ?auto_351355 ) ) ( not ( = ?auto_351353 ?auto_351356 ) ) ( not ( = ?auto_351353 ?auto_351357 ) ) ( not ( = ?auto_351353 ?auto_351358 ) ) ( not ( = ?auto_351353 ?auto_351359 ) ) ( not ( = ?auto_351353 ?auto_351360 ) ) ( not ( = ?auto_351353 ?auto_351361 ) ) ( not ( = ?auto_351353 ?auto_351362 ) ) ( not ( = ?auto_351353 ?auto_351363 ) ) ( not ( = ?auto_351353 ?auto_351364 ) ) ( not ( = ?auto_351353 ?auto_351365 ) ) ( not ( = ?auto_351354 ?auto_351355 ) ) ( not ( = ?auto_351354 ?auto_351356 ) ) ( not ( = ?auto_351354 ?auto_351357 ) ) ( not ( = ?auto_351354 ?auto_351358 ) ) ( not ( = ?auto_351354 ?auto_351359 ) ) ( not ( = ?auto_351354 ?auto_351360 ) ) ( not ( = ?auto_351354 ?auto_351361 ) ) ( not ( = ?auto_351354 ?auto_351362 ) ) ( not ( = ?auto_351354 ?auto_351363 ) ) ( not ( = ?auto_351354 ?auto_351364 ) ) ( not ( = ?auto_351354 ?auto_351365 ) ) ( not ( = ?auto_351355 ?auto_351356 ) ) ( not ( = ?auto_351355 ?auto_351357 ) ) ( not ( = ?auto_351355 ?auto_351358 ) ) ( not ( = ?auto_351355 ?auto_351359 ) ) ( not ( = ?auto_351355 ?auto_351360 ) ) ( not ( = ?auto_351355 ?auto_351361 ) ) ( not ( = ?auto_351355 ?auto_351362 ) ) ( not ( = ?auto_351355 ?auto_351363 ) ) ( not ( = ?auto_351355 ?auto_351364 ) ) ( not ( = ?auto_351355 ?auto_351365 ) ) ( not ( = ?auto_351356 ?auto_351357 ) ) ( not ( = ?auto_351356 ?auto_351358 ) ) ( not ( = ?auto_351356 ?auto_351359 ) ) ( not ( = ?auto_351356 ?auto_351360 ) ) ( not ( = ?auto_351356 ?auto_351361 ) ) ( not ( = ?auto_351356 ?auto_351362 ) ) ( not ( = ?auto_351356 ?auto_351363 ) ) ( not ( = ?auto_351356 ?auto_351364 ) ) ( not ( = ?auto_351356 ?auto_351365 ) ) ( not ( = ?auto_351357 ?auto_351358 ) ) ( not ( = ?auto_351357 ?auto_351359 ) ) ( not ( = ?auto_351357 ?auto_351360 ) ) ( not ( = ?auto_351357 ?auto_351361 ) ) ( not ( = ?auto_351357 ?auto_351362 ) ) ( not ( = ?auto_351357 ?auto_351363 ) ) ( not ( = ?auto_351357 ?auto_351364 ) ) ( not ( = ?auto_351357 ?auto_351365 ) ) ( not ( = ?auto_351358 ?auto_351359 ) ) ( not ( = ?auto_351358 ?auto_351360 ) ) ( not ( = ?auto_351358 ?auto_351361 ) ) ( not ( = ?auto_351358 ?auto_351362 ) ) ( not ( = ?auto_351358 ?auto_351363 ) ) ( not ( = ?auto_351358 ?auto_351364 ) ) ( not ( = ?auto_351358 ?auto_351365 ) ) ( not ( = ?auto_351359 ?auto_351360 ) ) ( not ( = ?auto_351359 ?auto_351361 ) ) ( not ( = ?auto_351359 ?auto_351362 ) ) ( not ( = ?auto_351359 ?auto_351363 ) ) ( not ( = ?auto_351359 ?auto_351364 ) ) ( not ( = ?auto_351359 ?auto_351365 ) ) ( not ( = ?auto_351360 ?auto_351361 ) ) ( not ( = ?auto_351360 ?auto_351362 ) ) ( not ( = ?auto_351360 ?auto_351363 ) ) ( not ( = ?auto_351360 ?auto_351364 ) ) ( not ( = ?auto_351360 ?auto_351365 ) ) ( not ( = ?auto_351361 ?auto_351362 ) ) ( not ( = ?auto_351361 ?auto_351363 ) ) ( not ( = ?auto_351361 ?auto_351364 ) ) ( not ( = ?auto_351361 ?auto_351365 ) ) ( not ( = ?auto_351362 ?auto_351363 ) ) ( not ( = ?auto_351362 ?auto_351364 ) ) ( not ( = ?auto_351362 ?auto_351365 ) ) ( not ( = ?auto_351363 ?auto_351364 ) ) ( not ( = ?auto_351363 ?auto_351365 ) ) ( not ( = ?auto_351364 ?auto_351365 ) ) ( ON ?auto_351363 ?auto_351364 ) ( CLEAR ?auto_351361 ) ( ON ?auto_351362 ?auto_351363 ) ( CLEAR ?auto_351362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_351351 ?auto_351352 ?auto_351353 ?auto_351354 ?auto_351355 ?auto_351356 ?auto_351357 ?auto_351358 ?auto_351359 ?auto_351360 ?auto_351361 ?auto_351362 )
      ( MAKE-14PILE ?auto_351351 ?auto_351352 ?auto_351353 ?auto_351354 ?auto_351355 ?auto_351356 ?auto_351357 ?auto_351358 ?auto_351359 ?auto_351360 ?auto_351361 ?auto_351362 ?auto_351363 ?auto_351364 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351380 - BLOCK
      ?auto_351381 - BLOCK
      ?auto_351382 - BLOCK
      ?auto_351383 - BLOCK
      ?auto_351384 - BLOCK
      ?auto_351385 - BLOCK
      ?auto_351386 - BLOCK
      ?auto_351387 - BLOCK
      ?auto_351388 - BLOCK
      ?auto_351389 - BLOCK
      ?auto_351390 - BLOCK
      ?auto_351391 - BLOCK
      ?auto_351392 - BLOCK
      ?auto_351393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351393 ) ( ON-TABLE ?auto_351380 ) ( ON ?auto_351381 ?auto_351380 ) ( ON ?auto_351382 ?auto_351381 ) ( ON ?auto_351383 ?auto_351382 ) ( ON ?auto_351384 ?auto_351383 ) ( ON ?auto_351385 ?auto_351384 ) ( ON ?auto_351386 ?auto_351385 ) ( ON ?auto_351387 ?auto_351386 ) ( ON ?auto_351388 ?auto_351387 ) ( ON ?auto_351389 ?auto_351388 ) ( ON ?auto_351390 ?auto_351389 ) ( not ( = ?auto_351380 ?auto_351381 ) ) ( not ( = ?auto_351380 ?auto_351382 ) ) ( not ( = ?auto_351380 ?auto_351383 ) ) ( not ( = ?auto_351380 ?auto_351384 ) ) ( not ( = ?auto_351380 ?auto_351385 ) ) ( not ( = ?auto_351380 ?auto_351386 ) ) ( not ( = ?auto_351380 ?auto_351387 ) ) ( not ( = ?auto_351380 ?auto_351388 ) ) ( not ( = ?auto_351380 ?auto_351389 ) ) ( not ( = ?auto_351380 ?auto_351390 ) ) ( not ( = ?auto_351380 ?auto_351391 ) ) ( not ( = ?auto_351380 ?auto_351392 ) ) ( not ( = ?auto_351380 ?auto_351393 ) ) ( not ( = ?auto_351381 ?auto_351382 ) ) ( not ( = ?auto_351381 ?auto_351383 ) ) ( not ( = ?auto_351381 ?auto_351384 ) ) ( not ( = ?auto_351381 ?auto_351385 ) ) ( not ( = ?auto_351381 ?auto_351386 ) ) ( not ( = ?auto_351381 ?auto_351387 ) ) ( not ( = ?auto_351381 ?auto_351388 ) ) ( not ( = ?auto_351381 ?auto_351389 ) ) ( not ( = ?auto_351381 ?auto_351390 ) ) ( not ( = ?auto_351381 ?auto_351391 ) ) ( not ( = ?auto_351381 ?auto_351392 ) ) ( not ( = ?auto_351381 ?auto_351393 ) ) ( not ( = ?auto_351382 ?auto_351383 ) ) ( not ( = ?auto_351382 ?auto_351384 ) ) ( not ( = ?auto_351382 ?auto_351385 ) ) ( not ( = ?auto_351382 ?auto_351386 ) ) ( not ( = ?auto_351382 ?auto_351387 ) ) ( not ( = ?auto_351382 ?auto_351388 ) ) ( not ( = ?auto_351382 ?auto_351389 ) ) ( not ( = ?auto_351382 ?auto_351390 ) ) ( not ( = ?auto_351382 ?auto_351391 ) ) ( not ( = ?auto_351382 ?auto_351392 ) ) ( not ( = ?auto_351382 ?auto_351393 ) ) ( not ( = ?auto_351383 ?auto_351384 ) ) ( not ( = ?auto_351383 ?auto_351385 ) ) ( not ( = ?auto_351383 ?auto_351386 ) ) ( not ( = ?auto_351383 ?auto_351387 ) ) ( not ( = ?auto_351383 ?auto_351388 ) ) ( not ( = ?auto_351383 ?auto_351389 ) ) ( not ( = ?auto_351383 ?auto_351390 ) ) ( not ( = ?auto_351383 ?auto_351391 ) ) ( not ( = ?auto_351383 ?auto_351392 ) ) ( not ( = ?auto_351383 ?auto_351393 ) ) ( not ( = ?auto_351384 ?auto_351385 ) ) ( not ( = ?auto_351384 ?auto_351386 ) ) ( not ( = ?auto_351384 ?auto_351387 ) ) ( not ( = ?auto_351384 ?auto_351388 ) ) ( not ( = ?auto_351384 ?auto_351389 ) ) ( not ( = ?auto_351384 ?auto_351390 ) ) ( not ( = ?auto_351384 ?auto_351391 ) ) ( not ( = ?auto_351384 ?auto_351392 ) ) ( not ( = ?auto_351384 ?auto_351393 ) ) ( not ( = ?auto_351385 ?auto_351386 ) ) ( not ( = ?auto_351385 ?auto_351387 ) ) ( not ( = ?auto_351385 ?auto_351388 ) ) ( not ( = ?auto_351385 ?auto_351389 ) ) ( not ( = ?auto_351385 ?auto_351390 ) ) ( not ( = ?auto_351385 ?auto_351391 ) ) ( not ( = ?auto_351385 ?auto_351392 ) ) ( not ( = ?auto_351385 ?auto_351393 ) ) ( not ( = ?auto_351386 ?auto_351387 ) ) ( not ( = ?auto_351386 ?auto_351388 ) ) ( not ( = ?auto_351386 ?auto_351389 ) ) ( not ( = ?auto_351386 ?auto_351390 ) ) ( not ( = ?auto_351386 ?auto_351391 ) ) ( not ( = ?auto_351386 ?auto_351392 ) ) ( not ( = ?auto_351386 ?auto_351393 ) ) ( not ( = ?auto_351387 ?auto_351388 ) ) ( not ( = ?auto_351387 ?auto_351389 ) ) ( not ( = ?auto_351387 ?auto_351390 ) ) ( not ( = ?auto_351387 ?auto_351391 ) ) ( not ( = ?auto_351387 ?auto_351392 ) ) ( not ( = ?auto_351387 ?auto_351393 ) ) ( not ( = ?auto_351388 ?auto_351389 ) ) ( not ( = ?auto_351388 ?auto_351390 ) ) ( not ( = ?auto_351388 ?auto_351391 ) ) ( not ( = ?auto_351388 ?auto_351392 ) ) ( not ( = ?auto_351388 ?auto_351393 ) ) ( not ( = ?auto_351389 ?auto_351390 ) ) ( not ( = ?auto_351389 ?auto_351391 ) ) ( not ( = ?auto_351389 ?auto_351392 ) ) ( not ( = ?auto_351389 ?auto_351393 ) ) ( not ( = ?auto_351390 ?auto_351391 ) ) ( not ( = ?auto_351390 ?auto_351392 ) ) ( not ( = ?auto_351390 ?auto_351393 ) ) ( not ( = ?auto_351391 ?auto_351392 ) ) ( not ( = ?auto_351391 ?auto_351393 ) ) ( not ( = ?auto_351392 ?auto_351393 ) ) ( ON ?auto_351392 ?auto_351393 ) ( CLEAR ?auto_351390 ) ( ON ?auto_351391 ?auto_351392 ) ( CLEAR ?auto_351391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_351380 ?auto_351381 ?auto_351382 ?auto_351383 ?auto_351384 ?auto_351385 ?auto_351386 ?auto_351387 ?auto_351388 ?auto_351389 ?auto_351390 ?auto_351391 )
      ( MAKE-14PILE ?auto_351380 ?auto_351381 ?auto_351382 ?auto_351383 ?auto_351384 ?auto_351385 ?auto_351386 ?auto_351387 ?auto_351388 ?auto_351389 ?auto_351390 ?auto_351391 ?auto_351392 ?auto_351393 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351408 - BLOCK
      ?auto_351409 - BLOCK
      ?auto_351410 - BLOCK
      ?auto_351411 - BLOCK
      ?auto_351412 - BLOCK
      ?auto_351413 - BLOCK
      ?auto_351414 - BLOCK
      ?auto_351415 - BLOCK
      ?auto_351416 - BLOCK
      ?auto_351417 - BLOCK
      ?auto_351418 - BLOCK
      ?auto_351419 - BLOCK
      ?auto_351420 - BLOCK
      ?auto_351421 - BLOCK
    )
    :vars
    (
      ?auto_351422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351421 ?auto_351422 ) ( ON-TABLE ?auto_351408 ) ( ON ?auto_351409 ?auto_351408 ) ( ON ?auto_351410 ?auto_351409 ) ( ON ?auto_351411 ?auto_351410 ) ( ON ?auto_351412 ?auto_351411 ) ( ON ?auto_351413 ?auto_351412 ) ( ON ?auto_351414 ?auto_351413 ) ( ON ?auto_351415 ?auto_351414 ) ( ON ?auto_351416 ?auto_351415 ) ( ON ?auto_351417 ?auto_351416 ) ( not ( = ?auto_351408 ?auto_351409 ) ) ( not ( = ?auto_351408 ?auto_351410 ) ) ( not ( = ?auto_351408 ?auto_351411 ) ) ( not ( = ?auto_351408 ?auto_351412 ) ) ( not ( = ?auto_351408 ?auto_351413 ) ) ( not ( = ?auto_351408 ?auto_351414 ) ) ( not ( = ?auto_351408 ?auto_351415 ) ) ( not ( = ?auto_351408 ?auto_351416 ) ) ( not ( = ?auto_351408 ?auto_351417 ) ) ( not ( = ?auto_351408 ?auto_351418 ) ) ( not ( = ?auto_351408 ?auto_351419 ) ) ( not ( = ?auto_351408 ?auto_351420 ) ) ( not ( = ?auto_351408 ?auto_351421 ) ) ( not ( = ?auto_351408 ?auto_351422 ) ) ( not ( = ?auto_351409 ?auto_351410 ) ) ( not ( = ?auto_351409 ?auto_351411 ) ) ( not ( = ?auto_351409 ?auto_351412 ) ) ( not ( = ?auto_351409 ?auto_351413 ) ) ( not ( = ?auto_351409 ?auto_351414 ) ) ( not ( = ?auto_351409 ?auto_351415 ) ) ( not ( = ?auto_351409 ?auto_351416 ) ) ( not ( = ?auto_351409 ?auto_351417 ) ) ( not ( = ?auto_351409 ?auto_351418 ) ) ( not ( = ?auto_351409 ?auto_351419 ) ) ( not ( = ?auto_351409 ?auto_351420 ) ) ( not ( = ?auto_351409 ?auto_351421 ) ) ( not ( = ?auto_351409 ?auto_351422 ) ) ( not ( = ?auto_351410 ?auto_351411 ) ) ( not ( = ?auto_351410 ?auto_351412 ) ) ( not ( = ?auto_351410 ?auto_351413 ) ) ( not ( = ?auto_351410 ?auto_351414 ) ) ( not ( = ?auto_351410 ?auto_351415 ) ) ( not ( = ?auto_351410 ?auto_351416 ) ) ( not ( = ?auto_351410 ?auto_351417 ) ) ( not ( = ?auto_351410 ?auto_351418 ) ) ( not ( = ?auto_351410 ?auto_351419 ) ) ( not ( = ?auto_351410 ?auto_351420 ) ) ( not ( = ?auto_351410 ?auto_351421 ) ) ( not ( = ?auto_351410 ?auto_351422 ) ) ( not ( = ?auto_351411 ?auto_351412 ) ) ( not ( = ?auto_351411 ?auto_351413 ) ) ( not ( = ?auto_351411 ?auto_351414 ) ) ( not ( = ?auto_351411 ?auto_351415 ) ) ( not ( = ?auto_351411 ?auto_351416 ) ) ( not ( = ?auto_351411 ?auto_351417 ) ) ( not ( = ?auto_351411 ?auto_351418 ) ) ( not ( = ?auto_351411 ?auto_351419 ) ) ( not ( = ?auto_351411 ?auto_351420 ) ) ( not ( = ?auto_351411 ?auto_351421 ) ) ( not ( = ?auto_351411 ?auto_351422 ) ) ( not ( = ?auto_351412 ?auto_351413 ) ) ( not ( = ?auto_351412 ?auto_351414 ) ) ( not ( = ?auto_351412 ?auto_351415 ) ) ( not ( = ?auto_351412 ?auto_351416 ) ) ( not ( = ?auto_351412 ?auto_351417 ) ) ( not ( = ?auto_351412 ?auto_351418 ) ) ( not ( = ?auto_351412 ?auto_351419 ) ) ( not ( = ?auto_351412 ?auto_351420 ) ) ( not ( = ?auto_351412 ?auto_351421 ) ) ( not ( = ?auto_351412 ?auto_351422 ) ) ( not ( = ?auto_351413 ?auto_351414 ) ) ( not ( = ?auto_351413 ?auto_351415 ) ) ( not ( = ?auto_351413 ?auto_351416 ) ) ( not ( = ?auto_351413 ?auto_351417 ) ) ( not ( = ?auto_351413 ?auto_351418 ) ) ( not ( = ?auto_351413 ?auto_351419 ) ) ( not ( = ?auto_351413 ?auto_351420 ) ) ( not ( = ?auto_351413 ?auto_351421 ) ) ( not ( = ?auto_351413 ?auto_351422 ) ) ( not ( = ?auto_351414 ?auto_351415 ) ) ( not ( = ?auto_351414 ?auto_351416 ) ) ( not ( = ?auto_351414 ?auto_351417 ) ) ( not ( = ?auto_351414 ?auto_351418 ) ) ( not ( = ?auto_351414 ?auto_351419 ) ) ( not ( = ?auto_351414 ?auto_351420 ) ) ( not ( = ?auto_351414 ?auto_351421 ) ) ( not ( = ?auto_351414 ?auto_351422 ) ) ( not ( = ?auto_351415 ?auto_351416 ) ) ( not ( = ?auto_351415 ?auto_351417 ) ) ( not ( = ?auto_351415 ?auto_351418 ) ) ( not ( = ?auto_351415 ?auto_351419 ) ) ( not ( = ?auto_351415 ?auto_351420 ) ) ( not ( = ?auto_351415 ?auto_351421 ) ) ( not ( = ?auto_351415 ?auto_351422 ) ) ( not ( = ?auto_351416 ?auto_351417 ) ) ( not ( = ?auto_351416 ?auto_351418 ) ) ( not ( = ?auto_351416 ?auto_351419 ) ) ( not ( = ?auto_351416 ?auto_351420 ) ) ( not ( = ?auto_351416 ?auto_351421 ) ) ( not ( = ?auto_351416 ?auto_351422 ) ) ( not ( = ?auto_351417 ?auto_351418 ) ) ( not ( = ?auto_351417 ?auto_351419 ) ) ( not ( = ?auto_351417 ?auto_351420 ) ) ( not ( = ?auto_351417 ?auto_351421 ) ) ( not ( = ?auto_351417 ?auto_351422 ) ) ( not ( = ?auto_351418 ?auto_351419 ) ) ( not ( = ?auto_351418 ?auto_351420 ) ) ( not ( = ?auto_351418 ?auto_351421 ) ) ( not ( = ?auto_351418 ?auto_351422 ) ) ( not ( = ?auto_351419 ?auto_351420 ) ) ( not ( = ?auto_351419 ?auto_351421 ) ) ( not ( = ?auto_351419 ?auto_351422 ) ) ( not ( = ?auto_351420 ?auto_351421 ) ) ( not ( = ?auto_351420 ?auto_351422 ) ) ( not ( = ?auto_351421 ?auto_351422 ) ) ( ON ?auto_351420 ?auto_351421 ) ( ON ?auto_351419 ?auto_351420 ) ( CLEAR ?auto_351417 ) ( ON ?auto_351418 ?auto_351419 ) ( CLEAR ?auto_351418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_351408 ?auto_351409 ?auto_351410 ?auto_351411 ?auto_351412 ?auto_351413 ?auto_351414 ?auto_351415 ?auto_351416 ?auto_351417 ?auto_351418 )
      ( MAKE-14PILE ?auto_351408 ?auto_351409 ?auto_351410 ?auto_351411 ?auto_351412 ?auto_351413 ?auto_351414 ?auto_351415 ?auto_351416 ?auto_351417 ?auto_351418 ?auto_351419 ?auto_351420 ?auto_351421 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351437 - BLOCK
      ?auto_351438 - BLOCK
      ?auto_351439 - BLOCK
      ?auto_351440 - BLOCK
      ?auto_351441 - BLOCK
      ?auto_351442 - BLOCK
      ?auto_351443 - BLOCK
      ?auto_351444 - BLOCK
      ?auto_351445 - BLOCK
      ?auto_351446 - BLOCK
      ?auto_351447 - BLOCK
      ?auto_351448 - BLOCK
      ?auto_351449 - BLOCK
      ?auto_351450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351450 ) ( ON-TABLE ?auto_351437 ) ( ON ?auto_351438 ?auto_351437 ) ( ON ?auto_351439 ?auto_351438 ) ( ON ?auto_351440 ?auto_351439 ) ( ON ?auto_351441 ?auto_351440 ) ( ON ?auto_351442 ?auto_351441 ) ( ON ?auto_351443 ?auto_351442 ) ( ON ?auto_351444 ?auto_351443 ) ( ON ?auto_351445 ?auto_351444 ) ( ON ?auto_351446 ?auto_351445 ) ( not ( = ?auto_351437 ?auto_351438 ) ) ( not ( = ?auto_351437 ?auto_351439 ) ) ( not ( = ?auto_351437 ?auto_351440 ) ) ( not ( = ?auto_351437 ?auto_351441 ) ) ( not ( = ?auto_351437 ?auto_351442 ) ) ( not ( = ?auto_351437 ?auto_351443 ) ) ( not ( = ?auto_351437 ?auto_351444 ) ) ( not ( = ?auto_351437 ?auto_351445 ) ) ( not ( = ?auto_351437 ?auto_351446 ) ) ( not ( = ?auto_351437 ?auto_351447 ) ) ( not ( = ?auto_351437 ?auto_351448 ) ) ( not ( = ?auto_351437 ?auto_351449 ) ) ( not ( = ?auto_351437 ?auto_351450 ) ) ( not ( = ?auto_351438 ?auto_351439 ) ) ( not ( = ?auto_351438 ?auto_351440 ) ) ( not ( = ?auto_351438 ?auto_351441 ) ) ( not ( = ?auto_351438 ?auto_351442 ) ) ( not ( = ?auto_351438 ?auto_351443 ) ) ( not ( = ?auto_351438 ?auto_351444 ) ) ( not ( = ?auto_351438 ?auto_351445 ) ) ( not ( = ?auto_351438 ?auto_351446 ) ) ( not ( = ?auto_351438 ?auto_351447 ) ) ( not ( = ?auto_351438 ?auto_351448 ) ) ( not ( = ?auto_351438 ?auto_351449 ) ) ( not ( = ?auto_351438 ?auto_351450 ) ) ( not ( = ?auto_351439 ?auto_351440 ) ) ( not ( = ?auto_351439 ?auto_351441 ) ) ( not ( = ?auto_351439 ?auto_351442 ) ) ( not ( = ?auto_351439 ?auto_351443 ) ) ( not ( = ?auto_351439 ?auto_351444 ) ) ( not ( = ?auto_351439 ?auto_351445 ) ) ( not ( = ?auto_351439 ?auto_351446 ) ) ( not ( = ?auto_351439 ?auto_351447 ) ) ( not ( = ?auto_351439 ?auto_351448 ) ) ( not ( = ?auto_351439 ?auto_351449 ) ) ( not ( = ?auto_351439 ?auto_351450 ) ) ( not ( = ?auto_351440 ?auto_351441 ) ) ( not ( = ?auto_351440 ?auto_351442 ) ) ( not ( = ?auto_351440 ?auto_351443 ) ) ( not ( = ?auto_351440 ?auto_351444 ) ) ( not ( = ?auto_351440 ?auto_351445 ) ) ( not ( = ?auto_351440 ?auto_351446 ) ) ( not ( = ?auto_351440 ?auto_351447 ) ) ( not ( = ?auto_351440 ?auto_351448 ) ) ( not ( = ?auto_351440 ?auto_351449 ) ) ( not ( = ?auto_351440 ?auto_351450 ) ) ( not ( = ?auto_351441 ?auto_351442 ) ) ( not ( = ?auto_351441 ?auto_351443 ) ) ( not ( = ?auto_351441 ?auto_351444 ) ) ( not ( = ?auto_351441 ?auto_351445 ) ) ( not ( = ?auto_351441 ?auto_351446 ) ) ( not ( = ?auto_351441 ?auto_351447 ) ) ( not ( = ?auto_351441 ?auto_351448 ) ) ( not ( = ?auto_351441 ?auto_351449 ) ) ( not ( = ?auto_351441 ?auto_351450 ) ) ( not ( = ?auto_351442 ?auto_351443 ) ) ( not ( = ?auto_351442 ?auto_351444 ) ) ( not ( = ?auto_351442 ?auto_351445 ) ) ( not ( = ?auto_351442 ?auto_351446 ) ) ( not ( = ?auto_351442 ?auto_351447 ) ) ( not ( = ?auto_351442 ?auto_351448 ) ) ( not ( = ?auto_351442 ?auto_351449 ) ) ( not ( = ?auto_351442 ?auto_351450 ) ) ( not ( = ?auto_351443 ?auto_351444 ) ) ( not ( = ?auto_351443 ?auto_351445 ) ) ( not ( = ?auto_351443 ?auto_351446 ) ) ( not ( = ?auto_351443 ?auto_351447 ) ) ( not ( = ?auto_351443 ?auto_351448 ) ) ( not ( = ?auto_351443 ?auto_351449 ) ) ( not ( = ?auto_351443 ?auto_351450 ) ) ( not ( = ?auto_351444 ?auto_351445 ) ) ( not ( = ?auto_351444 ?auto_351446 ) ) ( not ( = ?auto_351444 ?auto_351447 ) ) ( not ( = ?auto_351444 ?auto_351448 ) ) ( not ( = ?auto_351444 ?auto_351449 ) ) ( not ( = ?auto_351444 ?auto_351450 ) ) ( not ( = ?auto_351445 ?auto_351446 ) ) ( not ( = ?auto_351445 ?auto_351447 ) ) ( not ( = ?auto_351445 ?auto_351448 ) ) ( not ( = ?auto_351445 ?auto_351449 ) ) ( not ( = ?auto_351445 ?auto_351450 ) ) ( not ( = ?auto_351446 ?auto_351447 ) ) ( not ( = ?auto_351446 ?auto_351448 ) ) ( not ( = ?auto_351446 ?auto_351449 ) ) ( not ( = ?auto_351446 ?auto_351450 ) ) ( not ( = ?auto_351447 ?auto_351448 ) ) ( not ( = ?auto_351447 ?auto_351449 ) ) ( not ( = ?auto_351447 ?auto_351450 ) ) ( not ( = ?auto_351448 ?auto_351449 ) ) ( not ( = ?auto_351448 ?auto_351450 ) ) ( not ( = ?auto_351449 ?auto_351450 ) ) ( ON ?auto_351449 ?auto_351450 ) ( ON ?auto_351448 ?auto_351449 ) ( CLEAR ?auto_351446 ) ( ON ?auto_351447 ?auto_351448 ) ( CLEAR ?auto_351447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_351437 ?auto_351438 ?auto_351439 ?auto_351440 ?auto_351441 ?auto_351442 ?auto_351443 ?auto_351444 ?auto_351445 ?auto_351446 ?auto_351447 )
      ( MAKE-14PILE ?auto_351437 ?auto_351438 ?auto_351439 ?auto_351440 ?auto_351441 ?auto_351442 ?auto_351443 ?auto_351444 ?auto_351445 ?auto_351446 ?auto_351447 ?auto_351448 ?auto_351449 ?auto_351450 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351465 - BLOCK
      ?auto_351466 - BLOCK
      ?auto_351467 - BLOCK
      ?auto_351468 - BLOCK
      ?auto_351469 - BLOCK
      ?auto_351470 - BLOCK
      ?auto_351471 - BLOCK
      ?auto_351472 - BLOCK
      ?auto_351473 - BLOCK
      ?auto_351474 - BLOCK
      ?auto_351475 - BLOCK
      ?auto_351476 - BLOCK
      ?auto_351477 - BLOCK
      ?auto_351478 - BLOCK
    )
    :vars
    (
      ?auto_351479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351478 ?auto_351479 ) ( ON-TABLE ?auto_351465 ) ( ON ?auto_351466 ?auto_351465 ) ( ON ?auto_351467 ?auto_351466 ) ( ON ?auto_351468 ?auto_351467 ) ( ON ?auto_351469 ?auto_351468 ) ( ON ?auto_351470 ?auto_351469 ) ( ON ?auto_351471 ?auto_351470 ) ( ON ?auto_351472 ?auto_351471 ) ( ON ?auto_351473 ?auto_351472 ) ( not ( = ?auto_351465 ?auto_351466 ) ) ( not ( = ?auto_351465 ?auto_351467 ) ) ( not ( = ?auto_351465 ?auto_351468 ) ) ( not ( = ?auto_351465 ?auto_351469 ) ) ( not ( = ?auto_351465 ?auto_351470 ) ) ( not ( = ?auto_351465 ?auto_351471 ) ) ( not ( = ?auto_351465 ?auto_351472 ) ) ( not ( = ?auto_351465 ?auto_351473 ) ) ( not ( = ?auto_351465 ?auto_351474 ) ) ( not ( = ?auto_351465 ?auto_351475 ) ) ( not ( = ?auto_351465 ?auto_351476 ) ) ( not ( = ?auto_351465 ?auto_351477 ) ) ( not ( = ?auto_351465 ?auto_351478 ) ) ( not ( = ?auto_351465 ?auto_351479 ) ) ( not ( = ?auto_351466 ?auto_351467 ) ) ( not ( = ?auto_351466 ?auto_351468 ) ) ( not ( = ?auto_351466 ?auto_351469 ) ) ( not ( = ?auto_351466 ?auto_351470 ) ) ( not ( = ?auto_351466 ?auto_351471 ) ) ( not ( = ?auto_351466 ?auto_351472 ) ) ( not ( = ?auto_351466 ?auto_351473 ) ) ( not ( = ?auto_351466 ?auto_351474 ) ) ( not ( = ?auto_351466 ?auto_351475 ) ) ( not ( = ?auto_351466 ?auto_351476 ) ) ( not ( = ?auto_351466 ?auto_351477 ) ) ( not ( = ?auto_351466 ?auto_351478 ) ) ( not ( = ?auto_351466 ?auto_351479 ) ) ( not ( = ?auto_351467 ?auto_351468 ) ) ( not ( = ?auto_351467 ?auto_351469 ) ) ( not ( = ?auto_351467 ?auto_351470 ) ) ( not ( = ?auto_351467 ?auto_351471 ) ) ( not ( = ?auto_351467 ?auto_351472 ) ) ( not ( = ?auto_351467 ?auto_351473 ) ) ( not ( = ?auto_351467 ?auto_351474 ) ) ( not ( = ?auto_351467 ?auto_351475 ) ) ( not ( = ?auto_351467 ?auto_351476 ) ) ( not ( = ?auto_351467 ?auto_351477 ) ) ( not ( = ?auto_351467 ?auto_351478 ) ) ( not ( = ?auto_351467 ?auto_351479 ) ) ( not ( = ?auto_351468 ?auto_351469 ) ) ( not ( = ?auto_351468 ?auto_351470 ) ) ( not ( = ?auto_351468 ?auto_351471 ) ) ( not ( = ?auto_351468 ?auto_351472 ) ) ( not ( = ?auto_351468 ?auto_351473 ) ) ( not ( = ?auto_351468 ?auto_351474 ) ) ( not ( = ?auto_351468 ?auto_351475 ) ) ( not ( = ?auto_351468 ?auto_351476 ) ) ( not ( = ?auto_351468 ?auto_351477 ) ) ( not ( = ?auto_351468 ?auto_351478 ) ) ( not ( = ?auto_351468 ?auto_351479 ) ) ( not ( = ?auto_351469 ?auto_351470 ) ) ( not ( = ?auto_351469 ?auto_351471 ) ) ( not ( = ?auto_351469 ?auto_351472 ) ) ( not ( = ?auto_351469 ?auto_351473 ) ) ( not ( = ?auto_351469 ?auto_351474 ) ) ( not ( = ?auto_351469 ?auto_351475 ) ) ( not ( = ?auto_351469 ?auto_351476 ) ) ( not ( = ?auto_351469 ?auto_351477 ) ) ( not ( = ?auto_351469 ?auto_351478 ) ) ( not ( = ?auto_351469 ?auto_351479 ) ) ( not ( = ?auto_351470 ?auto_351471 ) ) ( not ( = ?auto_351470 ?auto_351472 ) ) ( not ( = ?auto_351470 ?auto_351473 ) ) ( not ( = ?auto_351470 ?auto_351474 ) ) ( not ( = ?auto_351470 ?auto_351475 ) ) ( not ( = ?auto_351470 ?auto_351476 ) ) ( not ( = ?auto_351470 ?auto_351477 ) ) ( not ( = ?auto_351470 ?auto_351478 ) ) ( not ( = ?auto_351470 ?auto_351479 ) ) ( not ( = ?auto_351471 ?auto_351472 ) ) ( not ( = ?auto_351471 ?auto_351473 ) ) ( not ( = ?auto_351471 ?auto_351474 ) ) ( not ( = ?auto_351471 ?auto_351475 ) ) ( not ( = ?auto_351471 ?auto_351476 ) ) ( not ( = ?auto_351471 ?auto_351477 ) ) ( not ( = ?auto_351471 ?auto_351478 ) ) ( not ( = ?auto_351471 ?auto_351479 ) ) ( not ( = ?auto_351472 ?auto_351473 ) ) ( not ( = ?auto_351472 ?auto_351474 ) ) ( not ( = ?auto_351472 ?auto_351475 ) ) ( not ( = ?auto_351472 ?auto_351476 ) ) ( not ( = ?auto_351472 ?auto_351477 ) ) ( not ( = ?auto_351472 ?auto_351478 ) ) ( not ( = ?auto_351472 ?auto_351479 ) ) ( not ( = ?auto_351473 ?auto_351474 ) ) ( not ( = ?auto_351473 ?auto_351475 ) ) ( not ( = ?auto_351473 ?auto_351476 ) ) ( not ( = ?auto_351473 ?auto_351477 ) ) ( not ( = ?auto_351473 ?auto_351478 ) ) ( not ( = ?auto_351473 ?auto_351479 ) ) ( not ( = ?auto_351474 ?auto_351475 ) ) ( not ( = ?auto_351474 ?auto_351476 ) ) ( not ( = ?auto_351474 ?auto_351477 ) ) ( not ( = ?auto_351474 ?auto_351478 ) ) ( not ( = ?auto_351474 ?auto_351479 ) ) ( not ( = ?auto_351475 ?auto_351476 ) ) ( not ( = ?auto_351475 ?auto_351477 ) ) ( not ( = ?auto_351475 ?auto_351478 ) ) ( not ( = ?auto_351475 ?auto_351479 ) ) ( not ( = ?auto_351476 ?auto_351477 ) ) ( not ( = ?auto_351476 ?auto_351478 ) ) ( not ( = ?auto_351476 ?auto_351479 ) ) ( not ( = ?auto_351477 ?auto_351478 ) ) ( not ( = ?auto_351477 ?auto_351479 ) ) ( not ( = ?auto_351478 ?auto_351479 ) ) ( ON ?auto_351477 ?auto_351478 ) ( ON ?auto_351476 ?auto_351477 ) ( ON ?auto_351475 ?auto_351476 ) ( CLEAR ?auto_351473 ) ( ON ?auto_351474 ?auto_351475 ) ( CLEAR ?auto_351474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_351465 ?auto_351466 ?auto_351467 ?auto_351468 ?auto_351469 ?auto_351470 ?auto_351471 ?auto_351472 ?auto_351473 ?auto_351474 )
      ( MAKE-14PILE ?auto_351465 ?auto_351466 ?auto_351467 ?auto_351468 ?auto_351469 ?auto_351470 ?auto_351471 ?auto_351472 ?auto_351473 ?auto_351474 ?auto_351475 ?auto_351476 ?auto_351477 ?auto_351478 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351494 - BLOCK
      ?auto_351495 - BLOCK
      ?auto_351496 - BLOCK
      ?auto_351497 - BLOCK
      ?auto_351498 - BLOCK
      ?auto_351499 - BLOCK
      ?auto_351500 - BLOCK
      ?auto_351501 - BLOCK
      ?auto_351502 - BLOCK
      ?auto_351503 - BLOCK
      ?auto_351504 - BLOCK
      ?auto_351505 - BLOCK
      ?auto_351506 - BLOCK
      ?auto_351507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351507 ) ( ON-TABLE ?auto_351494 ) ( ON ?auto_351495 ?auto_351494 ) ( ON ?auto_351496 ?auto_351495 ) ( ON ?auto_351497 ?auto_351496 ) ( ON ?auto_351498 ?auto_351497 ) ( ON ?auto_351499 ?auto_351498 ) ( ON ?auto_351500 ?auto_351499 ) ( ON ?auto_351501 ?auto_351500 ) ( ON ?auto_351502 ?auto_351501 ) ( not ( = ?auto_351494 ?auto_351495 ) ) ( not ( = ?auto_351494 ?auto_351496 ) ) ( not ( = ?auto_351494 ?auto_351497 ) ) ( not ( = ?auto_351494 ?auto_351498 ) ) ( not ( = ?auto_351494 ?auto_351499 ) ) ( not ( = ?auto_351494 ?auto_351500 ) ) ( not ( = ?auto_351494 ?auto_351501 ) ) ( not ( = ?auto_351494 ?auto_351502 ) ) ( not ( = ?auto_351494 ?auto_351503 ) ) ( not ( = ?auto_351494 ?auto_351504 ) ) ( not ( = ?auto_351494 ?auto_351505 ) ) ( not ( = ?auto_351494 ?auto_351506 ) ) ( not ( = ?auto_351494 ?auto_351507 ) ) ( not ( = ?auto_351495 ?auto_351496 ) ) ( not ( = ?auto_351495 ?auto_351497 ) ) ( not ( = ?auto_351495 ?auto_351498 ) ) ( not ( = ?auto_351495 ?auto_351499 ) ) ( not ( = ?auto_351495 ?auto_351500 ) ) ( not ( = ?auto_351495 ?auto_351501 ) ) ( not ( = ?auto_351495 ?auto_351502 ) ) ( not ( = ?auto_351495 ?auto_351503 ) ) ( not ( = ?auto_351495 ?auto_351504 ) ) ( not ( = ?auto_351495 ?auto_351505 ) ) ( not ( = ?auto_351495 ?auto_351506 ) ) ( not ( = ?auto_351495 ?auto_351507 ) ) ( not ( = ?auto_351496 ?auto_351497 ) ) ( not ( = ?auto_351496 ?auto_351498 ) ) ( not ( = ?auto_351496 ?auto_351499 ) ) ( not ( = ?auto_351496 ?auto_351500 ) ) ( not ( = ?auto_351496 ?auto_351501 ) ) ( not ( = ?auto_351496 ?auto_351502 ) ) ( not ( = ?auto_351496 ?auto_351503 ) ) ( not ( = ?auto_351496 ?auto_351504 ) ) ( not ( = ?auto_351496 ?auto_351505 ) ) ( not ( = ?auto_351496 ?auto_351506 ) ) ( not ( = ?auto_351496 ?auto_351507 ) ) ( not ( = ?auto_351497 ?auto_351498 ) ) ( not ( = ?auto_351497 ?auto_351499 ) ) ( not ( = ?auto_351497 ?auto_351500 ) ) ( not ( = ?auto_351497 ?auto_351501 ) ) ( not ( = ?auto_351497 ?auto_351502 ) ) ( not ( = ?auto_351497 ?auto_351503 ) ) ( not ( = ?auto_351497 ?auto_351504 ) ) ( not ( = ?auto_351497 ?auto_351505 ) ) ( not ( = ?auto_351497 ?auto_351506 ) ) ( not ( = ?auto_351497 ?auto_351507 ) ) ( not ( = ?auto_351498 ?auto_351499 ) ) ( not ( = ?auto_351498 ?auto_351500 ) ) ( not ( = ?auto_351498 ?auto_351501 ) ) ( not ( = ?auto_351498 ?auto_351502 ) ) ( not ( = ?auto_351498 ?auto_351503 ) ) ( not ( = ?auto_351498 ?auto_351504 ) ) ( not ( = ?auto_351498 ?auto_351505 ) ) ( not ( = ?auto_351498 ?auto_351506 ) ) ( not ( = ?auto_351498 ?auto_351507 ) ) ( not ( = ?auto_351499 ?auto_351500 ) ) ( not ( = ?auto_351499 ?auto_351501 ) ) ( not ( = ?auto_351499 ?auto_351502 ) ) ( not ( = ?auto_351499 ?auto_351503 ) ) ( not ( = ?auto_351499 ?auto_351504 ) ) ( not ( = ?auto_351499 ?auto_351505 ) ) ( not ( = ?auto_351499 ?auto_351506 ) ) ( not ( = ?auto_351499 ?auto_351507 ) ) ( not ( = ?auto_351500 ?auto_351501 ) ) ( not ( = ?auto_351500 ?auto_351502 ) ) ( not ( = ?auto_351500 ?auto_351503 ) ) ( not ( = ?auto_351500 ?auto_351504 ) ) ( not ( = ?auto_351500 ?auto_351505 ) ) ( not ( = ?auto_351500 ?auto_351506 ) ) ( not ( = ?auto_351500 ?auto_351507 ) ) ( not ( = ?auto_351501 ?auto_351502 ) ) ( not ( = ?auto_351501 ?auto_351503 ) ) ( not ( = ?auto_351501 ?auto_351504 ) ) ( not ( = ?auto_351501 ?auto_351505 ) ) ( not ( = ?auto_351501 ?auto_351506 ) ) ( not ( = ?auto_351501 ?auto_351507 ) ) ( not ( = ?auto_351502 ?auto_351503 ) ) ( not ( = ?auto_351502 ?auto_351504 ) ) ( not ( = ?auto_351502 ?auto_351505 ) ) ( not ( = ?auto_351502 ?auto_351506 ) ) ( not ( = ?auto_351502 ?auto_351507 ) ) ( not ( = ?auto_351503 ?auto_351504 ) ) ( not ( = ?auto_351503 ?auto_351505 ) ) ( not ( = ?auto_351503 ?auto_351506 ) ) ( not ( = ?auto_351503 ?auto_351507 ) ) ( not ( = ?auto_351504 ?auto_351505 ) ) ( not ( = ?auto_351504 ?auto_351506 ) ) ( not ( = ?auto_351504 ?auto_351507 ) ) ( not ( = ?auto_351505 ?auto_351506 ) ) ( not ( = ?auto_351505 ?auto_351507 ) ) ( not ( = ?auto_351506 ?auto_351507 ) ) ( ON ?auto_351506 ?auto_351507 ) ( ON ?auto_351505 ?auto_351506 ) ( ON ?auto_351504 ?auto_351505 ) ( CLEAR ?auto_351502 ) ( ON ?auto_351503 ?auto_351504 ) ( CLEAR ?auto_351503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_351494 ?auto_351495 ?auto_351496 ?auto_351497 ?auto_351498 ?auto_351499 ?auto_351500 ?auto_351501 ?auto_351502 ?auto_351503 )
      ( MAKE-14PILE ?auto_351494 ?auto_351495 ?auto_351496 ?auto_351497 ?auto_351498 ?auto_351499 ?auto_351500 ?auto_351501 ?auto_351502 ?auto_351503 ?auto_351504 ?auto_351505 ?auto_351506 ?auto_351507 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351522 - BLOCK
      ?auto_351523 - BLOCK
      ?auto_351524 - BLOCK
      ?auto_351525 - BLOCK
      ?auto_351526 - BLOCK
      ?auto_351527 - BLOCK
      ?auto_351528 - BLOCK
      ?auto_351529 - BLOCK
      ?auto_351530 - BLOCK
      ?auto_351531 - BLOCK
      ?auto_351532 - BLOCK
      ?auto_351533 - BLOCK
      ?auto_351534 - BLOCK
      ?auto_351535 - BLOCK
    )
    :vars
    (
      ?auto_351536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351535 ?auto_351536 ) ( ON-TABLE ?auto_351522 ) ( ON ?auto_351523 ?auto_351522 ) ( ON ?auto_351524 ?auto_351523 ) ( ON ?auto_351525 ?auto_351524 ) ( ON ?auto_351526 ?auto_351525 ) ( ON ?auto_351527 ?auto_351526 ) ( ON ?auto_351528 ?auto_351527 ) ( ON ?auto_351529 ?auto_351528 ) ( not ( = ?auto_351522 ?auto_351523 ) ) ( not ( = ?auto_351522 ?auto_351524 ) ) ( not ( = ?auto_351522 ?auto_351525 ) ) ( not ( = ?auto_351522 ?auto_351526 ) ) ( not ( = ?auto_351522 ?auto_351527 ) ) ( not ( = ?auto_351522 ?auto_351528 ) ) ( not ( = ?auto_351522 ?auto_351529 ) ) ( not ( = ?auto_351522 ?auto_351530 ) ) ( not ( = ?auto_351522 ?auto_351531 ) ) ( not ( = ?auto_351522 ?auto_351532 ) ) ( not ( = ?auto_351522 ?auto_351533 ) ) ( not ( = ?auto_351522 ?auto_351534 ) ) ( not ( = ?auto_351522 ?auto_351535 ) ) ( not ( = ?auto_351522 ?auto_351536 ) ) ( not ( = ?auto_351523 ?auto_351524 ) ) ( not ( = ?auto_351523 ?auto_351525 ) ) ( not ( = ?auto_351523 ?auto_351526 ) ) ( not ( = ?auto_351523 ?auto_351527 ) ) ( not ( = ?auto_351523 ?auto_351528 ) ) ( not ( = ?auto_351523 ?auto_351529 ) ) ( not ( = ?auto_351523 ?auto_351530 ) ) ( not ( = ?auto_351523 ?auto_351531 ) ) ( not ( = ?auto_351523 ?auto_351532 ) ) ( not ( = ?auto_351523 ?auto_351533 ) ) ( not ( = ?auto_351523 ?auto_351534 ) ) ( not ( = ?auto_351523 ?auto_351535 ) ) ( not ( = ?auto_351523 ?auto_351536 ) ) ( not ( = ?auto_351524 ?auto_351525 ) ) ( not ( = ?auto_351524 ?auto_351526 ) ) ( not ( = ?auto_351524 ?auto_351527 ) ) ( not ( = ?auto_351524 ?auto_351528 ) ) ( not ( = ?auto_351524 ?auto_351529 ) ) ( not ( = ?auto_351524 ?auto_351530 ) ) ( not ( = ?auto_351524 ?auto_351531 ) ) ( not ( = ?auto_351524 ?auto_351532 ) ) ( not ( = ?auto_351524 ?auto_351533 ) ) ( not ( = ?auto_351524 ?auto_351534 ) ) ( not ( = ?auto_351524 ?auto_351535 ) ) ( not ( = ?auto_351524 ?auto_351536 ) ) ( not ( = ?auto_351525 ?auto_351526 ) ) ( not ( = ?auto_351525 ?auto_351527 ) ) ( not ( = ?auto_351525 ?auto_351528 ) ) ( not ( = ?auto_351525 ?auto_351529 ) ) ( not ( = ?auto_351525 ?auto_351530 ) ) ( not ( = ?auto_351525 ?auto_351531 ) ) ( not ( = ?auto_351525 ?auto_351532 ) ) ( not ( = ?auto_351525 ?auto_351533 ) ) ( not ( = ?auto_351525 ?auto_351534 ) ) ( not ( = ?auto_351525 ?auto_351535 ) ) ( not ( = ?auto_351525 ?auto_351536 ) ) ( not ( = ?auto_351526 ?auto_351527 ) ) ( not ( = ?auto_351526 ?auto_351528 ) ) ( not ( = ?auto_351526 ?auto_351529 ) ) ( not ( = ?auto_351526 ?auto_351530 ) ) ( not ( = ?auto_351526 ?auto_351531 ) ) ( not ( = ?auto_351526 ?auto_351532 ) ) ( not ( = ?auto_351526 ?auto_351533 ) ) ( not ( = ?auto_351526 ?auto_351534 ) ) ( not ( = ?auto_351526 ?auto_351535 ) ) ( not ( = ?auto_351526 ?auto_351536 ) ) ( not ( = ?auto_351527 ?auto_351528 ) ) ( not ( = ?auto_351527 ?auto_351529 ) ) ( not ( = ?auto_351527 ?auto_351530 ) ) ( not ( = ?auto_351527 ?auto_351531 ) ) ( not ( = ?auto_351527 ?auto_351532 ) ) ( not ( = ?auto_351527 ?auto_351533 ) ) ( not ( = ?auto_351527 ?auto_351534 ) ) ( not ( = ?auto_351527 ?auto_351535 ) ) ( not ( = ?auto_351527 ?auto_351536 ) ) ( not ( = ?auto_351528 ?auto_351529 ) ) ( not ( = ?auto_351528 ?auto_351530 ) ) ( not ( = ?auto_351528 ?auto_351531 ) ) ( not ( = ?auto_351528 ?auto_351532 ) ) ( not ( = ?auto_351528 ?auto_351533 ) ) ( not ( = ?auto_351528 ?auto_351534 ) ) ( not ( = ?auto_351528 ?auto_351535 ) ) ( not ( = ?auto_351528 ?auto_351536 ) ) ( not ( = ?auto_351529 ?auto_351530 ) ) ( not ( = ?auto_351529 ?auto_351531 ) ) ( not ( = ?auto_351529 ?auto_351532 ) ) ( not ( = ?auto_351529 ?auto_351533 ) ) ( not ( = ?auto_351529 ?auto_351534 ) ) ( not ( = ?auto_351529 ?auto_351535 ) ) ( not ( = ?auto_351529 ?auto_351536 ) ) ( not ( = ?auto_351530 ?auto_351531 ) ) ( not ( = ?auto_351530 ?auto_351532 ) ) ( not ( = ?auto_351530 ?auto_351533 ) ) ( not ( = ?auto_351530 ?auto_351534 ) ) ( not ( = ?auto_351530 ?auto_351535 ) ) ( not ( = ?auto_351530 ?auto_351536 ) ) ( not ( = ?auto_351531 ?auto_351532 ) ) ( not ( = ?auto_351531 ?auto_351533 ) ) ( not ( = ?auto_351531 ?auto_351534 ) ) ( not ( = ?auto_351531 ?auto_351535 ) ) ( not ( = ?auto_351531 ?auto_351536 ) ) ( not ( = ?auto_351532 ?auto_351533 ) ) ( not ( = ?auto_351532 ?auto_351534 ) ) ( not ( = ?auto_351532 ?auto_351535 ) ) ( not ( = ?auto_351532 ?auto_351536 ) ) ( not ( = ?auto_351533 ?auto_351534 ) ) ( not ( = ?auto_351533 ?auto_351535 ) ) ( not ( = ?auto_351533 ?auto_351536 ) ) ( not ( = ?auto_351534 ?auto_351535 ) ) ( not ( = ?auto_351534 ?auto_351536 ) ) ( not ( = ?auto_351535 ?auto_351536 ) ) ( ON ?auto_351534 ?auto_351535 ) ( ON ?auto_351533 ?auto_351534 ) ( ON ?auto_351532 ?auto_351533 ) ( ON ?auto_351531 ?auto_351532 ) ( CLEAR ?auto_351529 ) ( ON ?auto_351530 ?auto_351531 ) ( CLEAR ?auto_351530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_351522 ?auto_351523 ?auto_351524 ?auto_351525 ?auto_351526 ?auto_351527 ?auto_351528 ?auto_351529 ?auto_351530 )
      ( MAKE-14PILE ?auto_351522 ?auto_351523 ?auto_351524 ?auto_351525 ?auto_351526 ?auto_351527 ?auto_351528 ?auto_351529 ?auto_351530 ?auto_351531 ?auto_351532 ?auto_351533 ?auto_351534 ?auto_351535 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351551 - BLOCK
      ?auto_351552 - BLOCK
      ?auto_351553 - BLOCK
      ?auto_351554 - BLOCK
      ?auto_351555 - BLOCK
      ?auto_351556 - BLOCK
      ?auto_351557 - BLOCK
      ?auto_351558 - BLOCK
      ?auto_351559 - BLOCK
      ?auto_351560 - BLOCK
      ?auto_351561 - BLOCK
      ?auto_351562 - BLOCK
      ?auto_351563 - BLOCK
      ?auto_351564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351564 ) ( ON-TABLE ?auto_351551 ) ( ON ?auto_351552 ?auto_351551 ) ( ON ?auto_351553 ?auto_351552 ) ( ON ?auto_351554 ?auto_351553 ) ( ON ?auto_351555 ?auto_351554 ) ( ON ?auto_351556 ?auto_351555 ) ( ON ?auto_351557 ?auto_351556 ) ( ON ?auto_351558 ?auto_351557 ) ( not ( = ?auto_351551 ?auto_351552 ) ) ( not ( = ?auto_351551 ?auto_351553 ) ) ( not ( = ?auto_351551 ?auto_351554 ) ) ( not ( = ?auto_351551 ?auto_351555 ) ) ( not ( = ?auto_351551 ?auto_351556 ) ) ( not ( = ?auto_351551 ?auto_351557 ) ) ( not ( = ?auto_351551 ?auto_351558 ) ) ( not ( = ?auto_351551 ?auto_351559 ) ) ( not ( = ?auto_351551 ?auto_351560 ) ) ( not ( = ?auto_351551 ?auto_351561 ) ) ( not ( = ?auto_351551 ?auto_351562 ) ) ( not ( = ?auto_351551 ?auto_351563 ) ) ( not ( = ?auto_351551 ?auto_351564 ) ) ( not ( = ?auto_351552 ?auto_351553 ) ) ( not ( = ?auto_351552 ?auto_351554 ) ) ( not ( = ?auto_351552 ?auto_351555 ) ) ( not ( = ?auto_351552 ?auto_351556 ) ) ( not ( = ?auto_351552 ?auto_351557 ) ) ( not ( = ?auto_351552 ?auto_351558 ) ) ( not ( = ?auto_351552 ?auto_351559 ) ) ( not ( = ?auto_351552 ?auto_351560 ) ) ( not ( = ?auto_351552 ?auto_351561 ) ) ( not ( = ?auto_351552 ?auto_351562 ) ) ( not ( = ?auto_351552 ?auto_351563 ) ) ( not ( = ?auto_351552 ?auto_351564 ) ) ( not ( = ?auto_351553 ?auto_351554 ) ) ( not ( = ?auto_351553 ?auto_351555 ) ) ( not ( = ?auto_351553 ?auto_351556 ) ) ( not ( = ?auto_351553 ?auto_351557 ) ) ( not ( = ?auto_351553 ?auto_351558 ) ) ( not ( = ?auto_351553 ?auto_351559 ) ) ( not ( = ?auto_351553 ?auto_351560 ) ) ( not ( = ?auto_351553 ?auto_351561 ) ) ( not ( = ?auto_351553 ?auto_351562 ) ) ( not ( = ?auto_351553 ?auto_351563 ) ) ( not ( = ?auto_351553 ?auto_351564 ) ) ( not ( = ?auto_351554 ?auto_351555 ) ) ( not ( = ?auto_351554 ?auto_351556 ) ) ( not ( = ?auto_351554 ?auto_351557 ) ) ( not ( = ?auto_351554 ?auto_351558 ) ) ( not ( = ?auto_351554 ?auto_351559 ) ) ( not ( = ?auto_351554 ?auto_351560 ) ) ( not ( = ?auto_351554 ?auto_351561 ) ) ( not ( = ?auto_351554 ?auto_351562 ) ) ( not ( = ?auto_351554 ?auto_351563 ) ) ( not ( = ?auto_351554 ?auto_351564 ) ) ( not ( = ?auto_351555 ?auto_351556 ) ) ( not ( = ?auto_351555 ?auto_351557 ) ) ( not ( = ?auto_351555 ?auto_351558 ) ) ( not ( = ?auto_351555 ?auto_351559 ) ) ( not ( = ?auto_351555 ?auto_351560 ) ) ( not ( = ?auto_351555 ?auto_351561 ) ) ( not ( = ?auto_351555 ?auto_351562 ) ) ( not ( = ?auto_351555 ?auto_351563 ) ) ( not ( = ?auto_351555 ?auto_351564 ) ) ( not ( = ?auto_351556 ?auto_351557 ) ) ( not ( = ?auto_351556 ?auto_351558 ) ) ( not ( = ?auto_351556 ?auto_351559 ) ) ( not ( = ?auto_351556 ?auto_351560 ) ) ( not ( = ?auto_351556 ?auto_351561 ) ) ( not ( = ?auto_351556 ?auto_351562 ) ) ( not ( = ?auto_351556 ?auto_351563 ) ) ( not ( = ?auto_351556 ?auto_351564 ) ) ( not ( = ?auto_351557 ?auto_351558 ) ) ( not ( = ?auto_351557 ?auto_351559 ) ) ( not ( = ?auto_351557 ?auto_351560 ) ) ( not ( = ?auto_351557 ?auto_351561 ) ) ( not ( = ?auto_351557 ?auto_351562 ) ) ( not ( = ?auto_351557 ?auto_351563 ) ) ( not ( = ?auto_351557 ?auto_351564 ) ) ( not ( = ?auto_351558 ?auto_351559 ) ) ( not ( = ?auto_351558 ?auto_351560 ) ) ( not ( = ?auto_351558 ?auto_351561 ) ) ( not ( = ?auto_351558 ?auto_351562 ) ) ( not ( = ?auto_351558 ?auto_351563 ) ) ( not ( = ?auto_351558 ?auto_351564 ) ) ( not ( = ?auto_351559 ?auto_351560 ) ) ( not ( = ?auto_351559 ?auto_351561 ) ) ( not ( = ?auto_351559 ?auto_351562 ) ) ( not ( = ?auto_351559 ?auto_351563 ) ) ( not ( = ?auto_351559 ?auto_351564 ) ) ( not ( = ?auto_351560 ?auto_351561 ) ) ( not ( = ?auto_351560 ?auto_351562 ) ) ( not ( = ?auto_351560 ?auto_351563 ) ) ( not ( = ?auto_351560 ?auto_351564 ) ) ( not ( = ?auto_351561 ?auto_351562 ) ) ( not ( = ?auto_351561 ?auto_351563 ) ) ( not ( = ?auto_351561 ?auto_351564 ) ) ( not ( = ?auto_351562 ?auto_351563 ) ) ( not ( = ?auto_351562 ?auto_351564 ) ) ( not ( = ?auto_351563 ?auto_351564 ) ) ( ON ?auto_351563 ?auto_351564 ) ( ON ?auto_351562 ?auto_351563 ) ( ON ?auto_351561 ?auto_351562 ) ( ON ?auto_351560 ?auto_351561 ) ( CLEAR ?auto_351558 ) ( ON ?auto_351559 ?auto_351560 ) ( CLEAR ?auto_351559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_351551 ?auto_351552 ?auto_351553 ?auto_351554 ?auto_351555 ?auto_351556 ?auto_351557 ?auto_351558 ?auto_351559 )
      ( MAKE-14PILE ?auto_351551 ?auto_351552 ?auto_351553 ?auto_351554 ?auto_351555 ?auto_351556 ?auto_351557 ?auto_351558 ?auto_351559 ?auto_351560 ?auto_351561 ?auto_351562 ?auto_351563 ?auto_351564 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351579 - BLOCK
      ?auto_351580 - BLOCK
      ?auto_351581 - BLOCK
      ?auto_351582 - BLOCK
      ?auto_351583 - BLOCK
      ?auto_351584 - BLOCK
      ?auto_351585 - BLOCK
      ?auto_351586 - BLOCK
      ?auto_351587 - BLOCK
      ?auto_351588 - BLOCK
      ?auto_351589 - BLOCK
      ?auto_351590 - BLOCK
      ?auto_351591 - BLOCK
      ?auto_351592 - BLOCK
    )
    :vars
    (
      ?auto_351593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351592 ?auto_351593 ) ( ON-TABLE ?auto_351579 ) ( ON ?auto_351580 ?auto_351579 ) ( ON ?auto_351581 ?auto_351580 ) ( ON ?auto_351582 ?auto_351581 ) ( ON ?auto_351583 ?auto_351582 ) ( ON ?auto_351584 ?auto_351583 ) ( ON ?auto_351585 ?auto_351584 ) ( not ( = ?auto_351579 ?auto_351580 ) ) ( not ( = ?auto_351579 ?auto_351581 ) ) ( not ( = ?auto_351579 ?auto_351582 ) ) ( not ( = ?auto_351579 ?auto_351583 ) ) ( not ( = ?auto_351579 ?auto_351584 ) ) ( not ( = ?auto_351579 ?auto_351585 ) ) ( not ( = ?auto_351579 ?auto_351586 ) ) ( not ( = ?auto_351579 ?auto_351587 ) ) ( not ( = ?auto_351579 ?auto_351588 ) ) ( not ( = ?auto_351579 ?auto_351589 ) ) ( not ( = ?auto_351579 ?auto_351590 ) ) ( not ( = ?auto_351579 ?auto_351591 ) ) ( not ( = ?auto_351579 ?auto_351592 ) ) ( not ( = ?auto_351579 ?auto_351593 ) ) ( not ( = ?auto_351580 ?auto_351581 ) ) ( not ( = ?auto_351580 ?auto_351582 ) ) ( not ( = ?auto_351580 ?auto_351583 ) ) ( not ( = ?auto_351580 ?auto_351584 ) ) ( not ( = ?auto_351580 ?auto_351585 ) ) ( not ( = ?auto_351580 ?auto_351586 ) ) ( not ( = ?auto_351580 ?auto_351587 ) ) ( not ( = ?auto_351580 ?auto_351588 ) ) ( not ( = ?auto_351580 ?auto_351589 ) ) ( not ( = ?auto_351580 ?auto_351590 ) ) ( not ( = ?auto_351580 ?auto_351591 ) ) ( not ( = ?auto_351580 ?auto_351592 ) ) ( not ( = ?auto_351580 ?auto_351593 ) ) ( not ( = ?auto_351581 ?auto_351582 ) ) ( not ( = ?auto_351581 ?auto_351583 ) ) ( not ( = ?auto_351581 ?auto_351584 ) ) ( not ( = ?auto_351581 ?auto_351585 ) ) ( not ( = ?auto_351581 ?auto_351586 ) ) ( not ( = ?auto_351581 ?auto_351587 ) ) ( not ( = ?auto_351581 ?auto_351588 ) ) ( not ( = ?auto_351581 ?auto_351589 ) ) ( not ( = ?auto_351581 ?auto_351590 ) ) ( not ( = ?auto_351581 ?auto_351591 ) ) ( not ( = ?auto_351581 ?auto_351592 ) ) ( not ( = ?auto_351581 ?auto_351593 ) ) ( not ( = ?auto_351582 ?auto_351583 ) ) ( not ( = ?auto_351582 ?auto_351584 ) ) ( not ( = ?auto_351582 ?auto_351585 ) ) ( not ( = ?auto_351582 ?auto_351586 ) ) ( not ( = ?auto_351582 ?auto_351587 ) ) ( not ( = ?auto_351582 ?auto_351588 ) ) ( not ( = ?auto_351582 ?auto_351589 ) ) ( not ( = ?auto_351582 ?auto_351590 ) ) ( not ( = ?auto_351582 ?auto_351591 ) ) ( not ( = ?auto_351582 ?auto_351592 ) ) ( not ( = ?auto_351582 ?auto_351593 ) ) ( not ( = ?auto_351583 ?auto_351584 ) ) ( not ( = ?auto_351583 ?auto_351585 ) ) ( not ( = ?auto_351583 ?auto_351586 ) ) ( not ( = ?auto_351583 ?auto_351587 ) ) ( not ( = ?auto_351583 ?auto_351588 ) ) ( not ( = ?auto_351583 ?auto_351589 ) ) ( not ( = ?auto_351583 ?auto_351590 ) ) ( not ( = ?auto_351583 ?auto_351591 ) ) ( not ( = ?auto_351583 ?auto_351592 ) ) ( not ( = ?auto_351583 ?auto_351593 ) ) ( not ( = ?auto_351584 ?auto_351585 ) ) ( not ( = ?auto_351584 ?auto_351586 ) ) ( not ( = ?auto_351584 ?auto_351587 ) ) ( not ( = ?auto_351584 ?auto_351588 ) ) ( not ( = ?auto_351584 ?auto_351589 ) ) ( not ( = ?auto_351584 ?auto_351590 ) ) ( not ( = ?auto_351584 ?auto_351591 ) ) ( not ( = ?auto_351584 ?auto_351592 ) ) ( not ( = ?auto_351584 ?auto_351593 ) ) ( not ( = ?auto_351585 ?auto_351586 ) ) ( not ( = ?auto_351585 ?auto_351587 ) ) ( not ( = ?auto_351585 ?auto_351588 ) ) ( not ( = ?auto_351585 ?auto_351589 ) ) ( not ( = ?auto_351585 ?auto_351590 ) ) ( not ( = ?auto_351585 ?auto_351591 ) ) ( not ( = ?auto_351585 ?auto_351592 ) ) ( not ( = ?auto_351585 ?auto_351593 ) ) ( not ( = ?auto_351586 ?auto_351587 ) ) ( not ( = ?auto_351586 ?auto_351588 ) ) ( not ( = ?auto_351586 ?auto_351589 ) ) ( not ( = ?auto_351586 ?auto_351590 ) ) ( not ( = ?auto_351586 ?auto_351591 ) ) ( not ( = ?auto_351586 ?auto_351592 ) ) ( not ( = ?auto_351586 ?auto_351593 ) ) ( not ( = ?auto_351587 ?auto_351588 ) ) ( not ( = ?auto_351587 ?auto_351589 ) ) ( not ( = ?auto_351587 ?auto_351590 ) ) ( not ( = ?auto_351587 ?auto_351591 ) ) ( not ( = ?auto_351587 ?auto_351592 ) ) ( not ( = ?auto_351587 ?auto_351593 ) ) ( not ( = ?auto_351588 ?auto_351589 ) ) ( not ( = ?auto_351588 ?auto_351590 ) ) ( not ( = ?auto_351588 ?auto_351591 ) ) ( not ( = ?auto_351588 ?auto_351592 ) ) ( not ( = ?auto_351588 ?auto_351593 ) ) ( not ( = ?auto_351589 ?auto_351590 ) ) ( not ( = ?auto_351589 ?auto_351591 ) ) ( not ( = ?auto_351589 ?auto_351592 ) ) ( not ( = ?auto_351589 ?auto_351593 ) ) ( not ( = ?auto_351590 ?auto_351591 ) ) ( not ( = ?auto_351590 ?auto_351592 ) ) ( not ( = ?auto_351590 ?auto_351593 ) ) ( not ( = ?auto_351591 ?auto_351592 ) ) ( not ( = ?auto_351591 ?auto_351593 ) ) ( not ( = ?auto_351592 ?auto_351593 ) ) ( ON ?auto_351591 ?auto_351592 ) ( ON ?auto_351590 ?auto_351591 ) ( ON ?auto_351589 ?auto_351590 ) ( ON ?auto_351588 ?auto_351589 ) ( ON ?auto_351587 ?auto_351588 ) ( CLEAR ?auto_351585 ) ( ON ?auto_351586 ?auto_351587 ) ( CLEAR ?auto_351586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_351579 ?auto_351580 ?auto_351581 ?auto_351582 ?auto_351583 ?auto_351584 ?auto_351585 ?auto_351586 )
      ( MAKE-14PILE ?auto_351579 ?auto_351580 ?auto_351581 ?auto_351582 ?auto_351583 ?auto_351584 ?auto_351585 ?auto_351586 ?auto_351587 ?auto_351588 ?auto_351589 ?auto_351590 ?auto_351591 ?auto_351592 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351608 - BLOCK
      ?auto_351609 - BLOCK
      ?auto_351610 - BLOCK
      ?auto_351611 - BLOCK
      ?auto_351612 - BLOCK
      ?auto_351613 - BLOCK
      ?auto_351614 - BLOCK
      ?auto_351615 - BLOCK
      ?auto_351616 - BLOCK
      ?auto_351617 - BLOCK
      ?auto_351618 - BLOCK
      ?auto_351619 - BLOCK
      ?auto_351620 - BLOCK
      ?auto_351621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351621 ) ( ON-TABLE ?auto_351608 ) ( ON ?auto_351609 ?auto_351608 ) ( ON ?auto_351610 ?auto_351609 ) ( ON ?auto_351611 ?auto_351610 ) ( ON ?auto_351612 ?auto_351611 ) ( ON ?auto_351613 ?auto_351612 ) ( ON ?auto_351614 ?auto_351613 ) ( not ( = ?auto_351608 ?auto_351609 ) ) ( not ( = ?auto_351608 ?auto_351610 ) ) ( not ( = ?auto_351608 ?auto_351611 ) ) ( not ( = ?auto_351608 ?auto_351612 ) ) ( not ( = ?auto_351608 ?auto_351613 ) ) ( not ( = ?auto_351608 ?auto_351614 ) ) ( not ( = ?auto_351608 ?auto_351615 ) ) ( not ( = ?auto_351608 ?auto_351616 ) ) ( not ( = ?auto_351608 ?auto_351617 ) ) ( not ( = ?auto_351608 ?auto_351618 ) ) ( not ( = ?auto_351608 ?auto_351619 ) ) ( not ( = ?auto_351608 ?auto_351620 ) ) ( not ( = ?auto_351608 ?auto_351621 ) ) ( not ( = ?auto_351609 ?auto_351610 ) ) ( not ( = ?auto_351609 ?auto_351611 ) ) ( not ( = ?auto_351609 ?auto_351612 ) ) ( not ( = ?auto_351609 ?auto_351613 ) ) ( not ( = ?auto_351609 ?auto_351614 ) ) ( not ( = ?auto_351609 ?auto_351615 ) ) ( not ( = ?auto_351609 ?auto_351616 ) ) ( not ( = ?auto_351609 ?auto_351617 ) ) ( not ( = ?auto_351609 ?auto_351618 ) ) ( not ( = ?auto_351609 ?auto_351619 ) ) ( not ( = ?auto_351609 ?auto_351620 ) ) ( not ( = ?auto_351609 ?auto_351621 ) ) ( not ( = ?auto_351610 ?auto_351611 ) ) ( not ( = ?auto_351610 ?auto_351612 ) ) ( not ( = ?auto_351610 ?auto_351613 ) ) ( not ( = ?auto_351610 ?auto_351614 ) ) ( not ( = ?auto_351610 ?auto_351615 ) ) ( not ( = ?auto_351610 ?auto_351616 ) ) ( not ( = ?auto_351610 ?auto_351617 ) ) ( not ( = ?auto_351610 ?auto_351618 ) ) ( not ( = ?auto_351610 ?auto_351619 ) ) ( not ( = ?auto_351610 ?auto_351620 ) ) ( not ( = ?auto_351610 ?auto_351621 ) ) ( not ( = ?auto_351611 ?auto_351612 ) ) ( not ( = ?auto_351611 ?auto_351613 ) ) ( not ( = ?auto_351611 ?auto_351614 ) ) ( not ( = ?auto_351611 ?auto_351615 ) ) ( not ( = ?auto_351611 ?auto_351616 ) ) ( not ( = ?auto_351611 ?auto_351617 ) ) ( not ( = ?auto_351611 ?auto_351618 ) ) ( not ( = ?auto_351611 ?auto_351619 ) ) ( not ( = ?auto_351611 ?auto_351620 ) ) ( not ( = ?auto_351611 ?auto_351621 ) ) ( not ( = ?auto_351612 ?auto_351613 ) ) ( not ( = ?auto_351612 ?auto_351614 ) ) ( not ( = ?auto_351612 ?auto_351615 ) ) ( not ( = ?auto_351612 ?auto_351616 ) ) ( not ( = ?auto_351612 ?auto_351617 ) ) ( not ( = ?auto_351612 ?auto_351618 ) ) ( not ( = ?auto_351612 ?auto_351619 ) ) ( not ( = ?auto_351612 ?auto_351620 ) ) ( not ( = ?auto_351612 ?auto_351621 ) ) ( not ( = ?auto_351613 ?auto_351614 ) ) ( not ( = ?auto_351613 ?auto_351615 ) ) ( not ( = ?auto_351613 ?auto_351616 ) ) ( not ( = ?auto_351613 ?auto_351617 ) ) ( not ( = ?auto_351613 ?auto_351618 ) ) ( not ( = ?auto_351613 ?auto_351619 ) ) ( not ( = ?auto_351613 ?auto_351620 ) ) ( not ( = ?auto_351613 ?auto_351621 ) ) ( not ( = ?auto_351614 ?auto_351615 ) ) ( not ( = ?auto_351614 ?auto_351616 ) ) ( not ( = ?auto_351614 ?auto_351617 ) ) ( not ( = ?auto_351614 ?auto_351618 ) ) ( not ( = ?auto_351614 ?auto_351619 ) ) ( not ( = ?auto_351614 ?auto_351620 ) ) ( not ( = ?auto_351614 ?auto_351621 ) ) ( not ( = ?auto_351615 ?auto_351616 ) ) ( not ( = ?auto_351615 ?auto_351617 ) ) ( not ( = ?auto_351615 ?auto_351618 ) ) ( not ( = ?auto_351615 ?auto_351619 ) ) ( not ( = ?auto_351615 ?auto_351620 ) ) ( not ( = ?auto_351615 ?auto_351621 ) ) ( not ( = ?auto_351616 ?auto_351617 ) ) ( not ( = ?auto_351616 ?auto_351618 ) ) ( not ( = ?auto_351616 ?auto_351619 ) ) ( not ( = ?auto_351616 ?auto_351620 ) ) ( not ( = ?auto_351616 ?auto_351621 ) ) ( not ( = ?auto_351617 ?auto_351618 ) ) ( not ( = ?auto_351617 ?auto_351619 ) ) ( not ( = ?auto_351617 ?auto_351620 ) ) ( not ( = ?auto_351617 ?auto_351621 ) ) ( not ( = ?auto_351618 ?auto_351619 ) ) ( not ( = ?auto_351618 ?auto_351620 ) ) ( not ( = ?auto_351618 ?auto_351621 ) ) ( not ( = ?auto_351619 ?auto_351620 ) ) ( not ( = ?auto_351619 ?auto_351621 ) ) ( not ( = ?auto_351620 ?auto_351621 ) ) ( ON ?auto_351620 ?auto_351621 ) ( ON ?auto_351619 ?auto_351620 ) ( ON ?auto_351618 ?auto_351619 ) ( ON ?auto_351617 ?auto_351618 ) ( ON ?auto_351616 ?auto_351617 ) ( CLEAR ?auto_351614 ) ( ON ?auto_351615 ?auto_351616 ) ( CLEAR ?auto_351615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_351608 ?auto_351609 ?auto_351610 ?auto_351611 ?auto_351612 ?auto_351613 ?auto_351614 ?auto_351615 )
      ( MAKE-14PILE ?auto_351608 ?auto_351609 ?auto_351610 ?auto_351611 ?auto_351612 ?auto_351613 ?auto_351614 ?auto_351615 ?auto_351616 ?auto_351617 ?auto_351618 ?auto_351619 ?auto_351620 ?auto_351621 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351636 - BLOCK
      ?auto_351637 - BLOCK
      ?auto_351638 - BLOCK
      ?auto_351639 - BLOCK
      ?auto_351640 - BLOCK
      ?auto_351641 - BLOCK
      ?auto_351642 - BLOCK
      ?auto_351643 - BLOCK
      ?auto_351644 - BLOCK
      ?auto_351645 - BLOCK
      ?auto_351646 - BLOCK
      ?auto_351647 - BLOCK
      ?auto_351648 - BLOCK
      ?auto_351649 - BLOCK
    )
    :vars
    (
      ?auto_351650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351649 ?auto_351650 ) ( ON-TABLE ?auto_351636 ) ( ON ?auto_351637 ?auto_351636 ) ( ON ?auto_351638 ?auto_351637 ) ( ON ?auto_351639 ?auto_351638 ) ( ON ?auto_351640 ?auto_351639 ) ( ON ?auto_351641 ?auto_351640 ) ( not ( = ?auto_351636 ?auto_351637 ) ) ( not ( = ?auto_351636 ?auto_351638 ) ) ( not ( = ?auto_351636 ?auto_351639 ) ) ( not ( = ?auto_351636 ?auto_351640 ) ) ( not ( = ?auto_351636 ?auto_351641 ) ) ( not ( = ?auto_351636 ?auto_351642 ) ) ( not ( = ?auto_351636 ?auto_351643 ) ) ( not ( = ?auto_351636 ?auto_351644 ) ) ( not ( = ?auto_351636 ?auto_351645 ) ) ( not ( = ?auto_351636 ?auto_351646 ) ) ( not ( = ?auto_351636 ?auto_351647 ) ) ( not ( = ?auto_351636 ?auto_351648 ) ) ( not ( = ?auto_351636 ?auto_351649 ) ) ( not ( = ?auto_351636 ?auto_351650 ) ) ( not ( = ?auto_351637 ?auto_351638 ) ) ( not ( = ?auto_351637 ?auto_351639 ) ) ( not ( = ?auto_351637 ?auto_351640 ) ) ( not ( = ?auto_351637 ?auto_351641 ) ) ( not ( = ?auto_351637 ?auto_351642 ) ) ( not ( = ?auto_351637 ?auto_351643 ) ) ( not ( = ?auto_351637 ?auto_351644 ) ) ( not ( = ?auto_351637 ?auto_351645 ) ) ( not ( = ?auto_351637 ?auto_351646 ) ) ( not ( = ?auto_351637 ?auto_351647 ) ) ( not ( = ?auto_351637 ?auto_351648 ) ) ( not ( = ?auto_351637 ?auto_351649 ) ) ( not ( = ?auto_351637 ?auto_351650 ) ) ( not ( = ?auto_351638 ?auto_351639 ) ) ( not ( = ?auto_351638 ?auto_351640 ) ) ( not ( = ?auto_351638 ?auto_351641 ) ) ( not ( = ?auto_351638 ?auto_351642 ) ) ( not ( = ?auto_351638 ?auto_351643 ) ) ( not ( = ?auto_351638 ?auto_351644 ) ) ( not ( = ?auto_351638 ?auto_351645 ) ) ( not ( = ?auto_351638 ?auto_351646 ) ) ( not ( = ?auto_351638 ?auto_351647 ) ) ( not ( = ?auto_351638 ?auto_351648 ) ) ( not ( = ?auto_351638 ?auto_351649 ) ) ( not ( = ?auto_351638 ?auto_351650 ) ) ( not ( = ?auto_351639 ?auto_351640 ) ) ( not ( = ?auto_351639 ?auto_351641 ) ) ( not ( = ?auto_351639 ?auto_351642 ) ) ( not ( = ?auto_351639 ?auto_351643 ) ) ( not ( = ?auto_351639 ?auto_351644 ) ) ( not ( = ?auto_351639 ?auto_351645 ) ) ( not ( = ?auto_351639 ?auto_351646 ) ) ( not ( = ?auto_351639 ?auto_351647 ) ) ( not ( = ?auto_351639 ?auto_351648 ) ) ( not ( = ?auto_351639 ?auto_351649 ) ) ( not ( = ?auto_351639 ?auto_351650 ) ) ( not ( = ?auto_351640 ?auto_351641 ) ) ( not ( = ?auto_351640 ?auto_351642 ) ) ( not ( = ?auto_351640 ?auto_351643 ) ) ( not ( = ?auto_351640 ?auto_351644 ) ) ( not ( = ?auto_351640 ?auto_351645 ) ) ( not ( = ?auto_351640 ?auto_351646 ) ) ( not ( = ?auto_351640 ?auto_351647 ) ) ( not ( = ?auto_351640 ?auto_351648 ) ) ( not ( = ?auto_351640 ?auto_351649 ) ) ( not ( = ?auto_351640 ?auto_351650 ) ) ( not ( = ?auto_351641 ?auto_351642 ) ) ( not ( = ?auto_351641 ?auto_351643 ) ) ( not ( = ?auto_351641 ?auto_351644 ) ) ( not ( = ?auto_351641 ?auto_351645 ) ) ( not ( = ?auto_351641 ?auto_351646 ) ) ( not ( = ?auto_351641 ?auto_351647 ) ) ( not ( = ?auto_351641 ?auto_351648 ) ) ( not ( = ?auto_351641 ?auto_351649 ) ) ( not ( = ?auto_351641 ?auto_351650 ) ) ( not ( = ?auto_351642 ?auto_351643 ) ) ( not ( = ?auto_351642 ?auto_351644 ) ) ( not ( = ?auto_351642 ?auto_351645 ) ) ( not ( = ?auto_351642 ?auto_351646 ) ) ( not ( = ?auto_351642 ?auto_351647 ) ) ( not ( = ?auto_351642 ?auto_351648 ) ) ( not ( = ?auto_351642 ?auto_351649 ) ) ( not ( = ?auto_351642 ?auto_351650 ) ) ( not ( = ?auto_351643 ?auto_351644 ) ) ( not ( = ?auto_351643 ?auto_351645 ) ) ( not ( = ?auto_351643 ?auto_351646 ) ) ( not ( = ?auto_351643 ?auto_351647 ) ) ( not ( = ?auto_351643 ?auto_351648 ) ) ( not ( = ?auto_351643 ?auto_351649 ) ) ( not ( = ?auto_351643 ?auto_351650 ) ) ( not ( = ?auto_351644 ?auto_351645 ) ) ( not ( = ?auto_351644 ?auto_351646 ) ) ( not ( = ?auto_351644 ?auto_351647 ) ) ( not ( = ?auto_351644 ?auto_351648 ) ) ( not ( = ?auto_351644 ?auto_351649 ) ) ( not ( = ?auto_351644 ?auto_351650 ) ) ( not ( = ?auto_351645 ?auto_351646 ) ) ( not ( = ?auto_351645 ?auto_351647 ) ) ( not ( = ?auto_351645 ?auto_351648 ) ) ( not ( = ?auto_351645 ?auto_351649 ) ) ( not ( = ?auto_351645 ?auto_351650 ) ) ( not ( = ?auto_351646 ?auto_351647 ) ) ( not ( = ?auto_351646 ?auto_351648 ) ) ( not ( = ?auto_351646 ?auto_351649 ) ) ( not ( = ?auto_351646 ?auto_351650 ) ) ( not ( = ?auto_351647 ?auto_351648 ) ) ( not ( = ?auto_351647 ?auto_351649 ) ) ( not ( = ?auto_351647 ?auto_351650 ) ) ( not ( = ?auto_351648 ?auto_351649 ) ) ( not ( = ?auto_351648 ?auto_351650 ) ) ( not ( = ?auto_351649 ?auto_351650 ) ) ( ON ?auto_351648 ?auto_351649 ) ( ON ?auto_351647 ?auto_351648 ) ( ON ?auto_351646 ?auto_351647 ) ( ON ?auto_351645 ?auto_351646 ) ( ON ?auto_351644 ?auto_351645 ) ( ON ?auto_351643 ?auto_351644 ) ( CLEAR ?auto_351641 ) ( ON ?auto_351642 ?auto_351643 ) ( CLEAR ?auto_351642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_351636 ?auto_351637 ?auto_351638 ?auto_351639 ?auto_351640 ?auto_351641 ?auto_351642 )
      ( MAKE-14PILE ?auto_351636 ?auto_351637 ?auto_351638 ?auto_351639 ?auto_351640 ?auto_351641 ?auto_351642 ?auto_351643 ?auto_351644 ?auto_351645 ?auto_351646 ?auto_351647 ?auto_351648 ?auto_351649 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351665 - BLOCK
      ?auto_351666 - BLOCK
      ?auto_351667 - BLOCK
      ?auto_351668 - BLOCK
      ?auto_351669 - BLOCK
      ?auto_351670 - BLOCK
      ?auto_351671 - BLOCK
      ?auto_351672 - BLOCK
      ?auto_351673 - BLOCK
      ?auto_351674 - BLOCK
      ?auto_351675 - BLOCK
      ?auto_351676 - BLOCK
      ?auto_351677 - BLOCK
      ?auto_351678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351678 ) ( ON-TABLE ?auto_351665 ) ( ON ?auto_351666 ?auto_351665 ) ( ON ?auto_351667 ?auto_351666 ) ( ON ?auto_351668 ?auto_351667 ) ( ON ?auto_351669 ?auto_351668 ) ( ON ?auto_351670 ?auto_351669 ) ( not ( = ?auto_351665 ?auto_351666 ) ) ( not ( = ?auto_351665 ?auto_351667 ) ) ( not ( = ?auto_351665 ?auto_351668 ) ) ( not ( = ?auto_351665 ?auto_351669 ) ) ( not ( = ?auto_351665 ?auto_351670 ) ) ( not ( = ?auto_351665 ?auto_351671 ) ) ( not ( = ?auto_351665 ?auto_351672 ) ) ( not ( = ?auto_351665 ?auto_351673 ) ) ( not ( = ?auto_351665 ?auto_351674 ) ) ( not ( = ?auto_351665 ?auto_351675 ) ) ( not ( = ?auto_351665 ?auto_351676 ) ) ( not ( = ?auto_351665 ?auto_351677 ) ) ( not ( = ?auto_351665 ?auto_351678 ) ) ( not ( = ?auto_351666 ?auto_351667 ) ) ( not ( = ?auto_351666 ?auto_351668 ) ) ( not ( = ?auto_351666 ?auto_351669 ) ) ( not ( = ?auto_351666 ?auto_351670 ) ) ( not ( = ?auto_351666 ?auto_351671 ) ) ( not ( = ?auto_351666 ?auto_351672 ) ) ( not ( = ?auto_351666 ?auto_351673 ) ) ( not ( = ?auto_351666 ?auto_351674 ) ) ( not ( = ?auto_351666 ?auto_351675 ) ) ( not ( = ?auto_351666 ?auto_351676 ) ) ( not ( = ?auto_351666 ?auto_351677 ) ) ( not ( = ?auto_351666 ?auto_351678 ) ) ( not ( = ?auto_351667 ?auto_351668 ) ) ( not ( = ?auto_351667 ?auto_351669 ) ) ( not ( = ?auto_351667 ?auto_351670 ) ) ( not ( = ?auto_351667 ?auto_351671 ) ) ( not ( = ?auto_351667 ?auto_351672 ) ) ( not ( = ?auto_351667 ?auto_351673 ) ) ( not ( = ?auto_351667 ?auto_351674 ) ) ( not ( = ?auto_351667 ?auto_351675 ) ) ( not ( = ?auto_351667 ?auto_351676 ) ) ( not ( = ?auto_351667 ?auto_351677 ) ) ( not ( = ?auto_351667 ?auto_351678 ) ) ( not ( = ?auto_351668 ?auto_351669 ) ) ( not ( = ?auto_351668 ?auto_351670 ) ) ( not ( = ?auto_351668 ?auto_351671 ) ) ( not ( = ?auto_351668 ?auto_351672 ) ) ( not ( = ?auto_351668 ?auto_351673 ) ) ( not ( = ?auto_351668 ?auto_351674 ) ) ( not ( = ?auto_351668 ?auto_351675 ) ) ( not ( = ?auto_351668 ?auto_351676 ) ) ( not ( = ?auto_351668 ?auto_351677 ) ) ( not ( = ?auto_351668 ?auto_351678 ) ) ( not ( = ?auto_351669 ?auto_351670 ) ) ( not ( = ?auto_351669 ?auto_351671 ) ) ( not ( = ?auto_351669 ?auto_351672 ) ) ( not ( = ?auto_351669 ?auto_351673 ) ) ( not ( = ?auto_351669 ?auto_351674 ) ) ( not ( = ?auto_351669 ?auto_351675 ) ) ( not ( = ?auto_351669 ?auto_351676 ) ) ( not ( = ?auto_351669 ?auto_351677 ) ) ( not ( = ?auto_351669 ?auto_351678 ) ) ( not ( = ?auto_351670 ?auto_351671 ) ) ( not ( = ?auto_351670 ?auto_351672 ) ) ( not ( = ?auto_351670 ?auto_351673 ) ) ( not ( = ?auto_351670 ?auto_351674 ) ) ( not ( = ?auto_351670 ?auto_351675 ) ) ( not ( = ?auto_351670 ?auto_351676 ) ) ( not ( = ?auto_351670 ?auto_351677 ) ) ( not ( = ?auto_351670 ?auto_351678 ) ) ( not ( = ?auto_351671 ?auto_351672 ) ) ( not ( = ?auto_351671 ?auto_351673 ) ) ( not ( = ?auto_351671 ?auto_351674 ) ) ( not ( = ?auto_351671 ?auto_351675 ) ) ( not ( = ?auto_351671 ?auto_351676 ) ) ( not ( = ?auto_351671 ?auto_351677 ) ) ( not ( = ?auto_351671 ?auto_351678 ) ) ( not ( = ?auto_351672 ?auto_351673 ) ) ( not ( = ?auto_351672 ?auto_351674 ) ) ( not ( = ?auto_351672 ?auto_351675 ) ) ( not ( = ?auto_351672 ?auto_351676 ) ) ( not ( = ?auto_351672 ?auto_351677 ) ) ( not ( = ?auto_351672 ?auto_351678 ) ) ( not ( = ?auto_351673 ?auto_351674 ) ) ( not ( = ?auto_351673 ?auto_351675 ) ) ( not ( = ?auto_351673 ?auto_351676 ) ) ( not ( = ?auto_351673 ?auto_351677 ) ) ( not ( = ?auto_351673 ?auto_351678 ) ) ( not ( = ?auto_351674 ?auto_351675 ) ) ( not ( = ?auto_351674 ?auto_351676 ) ) ( not ( = ?auto_351674 ?auto_351677 ) ) ( not ( = ?auto_351674 ?auto_351678 ) ) ( not ( = ?auto_351675 ?auto_351676 ) ) ( not ( = ?auto_351675 ?auto_351677 ) ) ( not ( = ?auto_351675 ?auto_351678 ) ) ( not ( = ?auto_351676 ?auto_351677 ) ) ( not ( = ?auto_351676 ?auto_351678 ) ) ( not ( = ?auto_351677 ?auto_351678 ) ) ( ON ?auto_351677 ?auto_351678 ) ( ON ?auto_351676 ?auto_351677 ) ( ON ?auto_351675 ?auto_351676 ) ( ON ?auto_351674 ?auto_351675 ) ( ON ?auto_351673 ?auto_351674 ) ( ON ?auto_351672 ?auto_351673 ) ( CLEAR ?auto_351670 ) ( ON ?auto_351671 ?auto_351672 ) ( CLEAR ?auto_351671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_351665 ?auto_351666 ?auto_351667 ?auto_351668 ?auto_351669 ?auto_351670 ?auto_351671 )
      ( MAKE-14PILE ?auto_351665 ?auto_351666 ?auto_351667 ?auto_351668 ?auto_351669 ?auto_351670 ?auto_351671 ?auto_351672 ?auto_351673 ?auto_351674 ?auto_351675 ?auto_351676 ?auto_351677 ?auto_351678 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351693 - BLOCK
      ?auto_351694 - BLOCK
      ?auto_351695 - BLOCK
      ?auto_351696 - BLOCK
      ?auto_351697 - BLOCK
      ?auto_351698 - BLOCK
      ?auto_351699 - BLOCK
      ?auto_351700 - BLOCK
      ?auto_351701 - BLOCK
      ?auto_351702 - BLOCK
      ?auto_351703 - BLOCK
      ?auto_351704 - BLOCK
      ?auto_351705 - BLOCK
      ?auto_351706 - BLOCK
    )
    :vars
    (
      ?auto_351707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351706 ?auto_351707 ) ( ON-TABLE ?auto_351693 ) ( ON ?auto_351694 ?auto_351693 ) ( ON ?auto_351695 ?auto_351694 ) ( ON ?auto_351696 ?auto_351695 ) ( ON ?auto_351697 ?auto_351696 ) ( not ( = ?auto_351693 ?auto_351694 ) ) ( not ( = ?auto_351693 ?auto_351695 ) ) ( not ( = ?auto_351693 ?auto_351696 ) ) ( not ( = ?auto_351693 ?auto_351697 ) ) ( not ( = ?auto_351693 ?auto_351698 ) ) ( not ( = ?auto_351693 ?auto_351699 ) ) ( not ( = ?auto_351693 ?auto_351700 ) ) ( not ( = ?auto_351693 ?auto_351701 ) ) ( not ( = ?auto_351693 ?auto_351702 ) ) ( not ( = ?auto_351693 ?auto_351703 ) ) ( not ( = ?auto_351693 ?auto_351704 ) ) ( not ( = ?auto_351693 ?auto_351705 ) ) ( not ( = ?auto_351693 ?auto_351706 ) ) ( not ( = ?auto_351693 ?auto_351707 ) ) ( not ( = ?auto_351694 ?auto_351695 ) ) ( not ( = ?auto_351694 ?auto_351696 ) ) ( not ( = ?auto_351694 ?auto_351697 ) ) ( not ( = ?auto_351694 ?auto_351698 ) ) ( not ( = ?auto_351694 ?auto_351699 ) ) ( not ( = ?auto_351694 ?auto_351700 ) ) ( not ( = ?auto_351694 ?auto_351701 ) ) ( not ( = ?auto_351694 ?auto_351702 ) ) ( not ( = ?auto_351694 ?auto_351703 ) ) ( not ( = ?auto_351694 ?auto_351704 ) ) ( not ( = ?auto_351694 ?auto_351705 ) ) ( not ( = ?auto_351694 ?auto_351706 ) ) ( not ( = ?auto_351694 ?auto_351707 ) ) ( not ( = ?auto_351695 ?auto_351696 ) ) ( not ( = ?auto_351695 ?auto_351697 ) ) ( not ( = ?auto_351695 ?auto_351698 ) ) ( not ( = ?auto_351695 ?auto_351699 ) ) ( not ( = ?auto_351695 ?auto_351700 ) ) ( not ( = ?auto_351695 ?auto_351701 ) ) ( not ( = ?auto_351695 ?auto_351702 ) ) ( not ( = ?auto_351695 ?auto_351703 ) ) ( not ( = ?auto_351695 ?auto_351704 ) ) ( not ( = ?auto_351695 ?auto_351705 ) ) ( not ( = ?auto_351695 ?auto_351706 ) ) ( not ( = ?auto_351695 ?auto_351707 ) ) ( not ( = ?auto_351696 ?auto_351697 ) ) ( not ( = ?auto_351696 ?auto_351698 ) ) ( not ( = ?auto_351696 ?auto_351699 ) ) ( not ( = ?auto_351696 ?auto_351700 ) ) ( not ( = ?auto_351696 ?auto_351701 ) ) ( not ( = ?auto_351696 ?auto_351702 ) ) ( not ( = ?auto_351696 ?auto_351703 ) ) ( not ( = ?auto_351696 ?auto_351704 ) ) ( not ( = ?auto_351696 ?auto_351705 ) ) ( not ( = ?auto_351696 ?auto_351706 ) ) ( not ( = ?auto_351696 ?auto_351707 ) ) ( not ( = ?auto_351697 ?auto_351698 ) ) ( not ( = ?auto_351697 ?auto_351699 ) ) ( not ( = ?auto_351697 ?auto_351700 ) ) ( not ( = ?auto_351697 ?auto_351701 ) ) ( not ( = ?auto_351697 ?auto_351702 ) ) ( not ( = ?auto_351697 ?auto_351703 ) ) ( not ( = ?auto_351697 ?auto_351704 ) ) ( not ( = ?auto_351697 ?auto_351705 ) ) ( not ( = ?auto_351697 ?auto_351706 ) ) ( not ( = ?auto_351697 ?auto_351707 ) ) ( not ( = ?auto_351698 ?auto_351699 ) ) ( not ( = ?auto_351698 ?auto_351700 ) ) ( not ( = ?auto_351698 ?auto_351701 ) ) ( not ( = ?auto_351698 ?auto_351702 ) ) ( not ( = ?auto_351698 ?auto_351703 ) ) ( not ( = ?auto_351698 ?auto_351704 ) ) ( not ( = ?auto_351698 ?auto_351705 ) ) ( not ( = ?auto_351698 ?auto_351706 ) ) ( not ( = ?auto_351698 ?auto_351707 ) ) ( not ( = ?auto_351699 ?auto_351700 ) ) ( not ( = ?auto_351699 ?auto_351701 ) ) ( not ( = ?auto_351699 ?auto_351702 ) ) ( not ( = ?auto_351699 ?auto_351703 ) ) ( not ( = ?auto_351699 ?auto_351704 ) ) ( not ( = ?auto_351699 ?auto_351705 ) ) ( not ( = ?auto_351699 ?auto_351706 ) ) ( not ( = ?auto_351699 ?auto_351707 ) ) ( not ( = ?auto_351700 ?auto_351701 ) ) ( not ( = ?auto_351700 ?auto_351702 ) ) ( not ( = ?auto_351700 ?auto_351703 ) ) ( not ( = ?auto_351700 ?auto_351704 ) ) ( not ( = ?auto_351700 ?auto_351705 ) ) ( not ( = ?auto_351700 ?auto_351706 ) ) ( not ( = ?auto_351700 ?auto_351707 ) ) ( not ( = ?auto_351701 ?auto_351702 ) ) ( not ( = ?auto_351701 ?auto_351703 ) ) ( not ( = ?auto_351701 ?auto_351704 ) ) ( not ( = ?auto_351701 ?auto_351705 ) ) ( not ( = ?auto_351701 ?auto_351706 ) ) ( not ( = ?auto_351701 ?auto_351707 ) ) ( not ( = ?auto_351702 ?auto_351703 ) ) ( not ( = ?auto_351702 ?auto_351704 ) ) ( not ( = ?auto_351702 ?auto_351705 ) ) ( not ( = ?auto_351702 ?auto_351706 ) ) ( not ( = ?auto_351702 ?auto_351707 ) ) ( not ( = ?auto_351703 ?auto_351704 ) ) ( not ( = ?auto_351703 ?auto_351705 ) ) ( not ( = ?auto_351703 ?auto_351706 ) ) ( not ( = ?auto_351703 ?auto_351707 ) ) ( not ( = ?auto_351704 ?auto_351705 ) ) ( not ( = ?auto_351704 ?auto_351706 ) ) ( not ( = ?auto_351704 ?auto_351707 ) ) ( not ( = ?auto_351705 ?auto_351706 ) ) ( not ( = ?auto_351705 ?auto_351707 ) ) ( not ( = ?auto_351706 ?auto_351707 ) ) ( ON ?auto_351705 ?auto_351706 ) ( ON ?auto_351704 ?auto_351705 ) ( ON ?auto_351703 ?auto_351704 ) ( ON ?auto_351702 ?auto_351703 ) ( ON ?auto_351701 ?auto_351702 ) ( ON ?auto_351700 ?auto_351701 ) ( ON ?auto_351699 ?auto_351700 ) ( CLEAR ?auto_351697 ) ( ON ?auto_351698 ?auto_351699 ) ( CLEAR ?auto_351698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_351693 ?auto_351694 ?auto_351695 ?auto_351696 ?auto_351697 ?auto_351698 )
      ( MAKE-14PILE ?auto_351693 ?auto_351694 ?auto_351695 ?auto_351696 ?auto_351697 ?auto_351698 ?auto_351699 ?auto_351700 ?auto_351701 ?auto_351702 ?auto_351703 ?auto_351704 ?auto_351705 ?auto_351706 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351722 - BLOCK
      ?auto_351723 - BLOCK
      ?auto_351724 - BLOCK
      ?auto_351725 - BLOCK
      ?auto_351726 - BLOCK
      ?auto_351727 - BLOCK
      ?auto_351728 - BLOCK
      ?auto_351729 - BLOCK
      ?auto_351730 - BLOCK
      ?auto_351731 - BLOCK
      ?auto_351732 - BLOCK
      ?auto_351733 - BLOCK
      ?auto_351734 - BLOCK
      ?auto_351735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351735 ) ( ON-TABLE ?auto_351722 ) ( ON ?auto_351723 ?auto_351722 ) ( ON ?auto_351724 ?auto_351723 ) ( ON ?auto_351725 ?auto_351724 ) ( ON ?auto_351726 ?auto_351725 ) ( not ( = ?auto_351722 ?auto_351723 ) ) ( not ( = ?auto_351722 ?auto_351724 ) ) ( not ( = ?auto_351722 ?auto_351725 ) ) ( not ( = ?auto_351722 ?auto_351726 ) ) ( not ( = ?auto_351722 ?auto_351727 ) ) ( not ( = ?auto_351722 ?auto_351728 ) ) ( not ( = ?auto_351722 ?auto_351729 ) ) ( not ( = ?auto_351722 ?auto_351730 ) ) ( not ( = ?auto_351722 ?auto_351731 ) ) ( not ( = ?auto_351722 ?auto_351732 ) ) ( not ( = ?auto_351722 ?auto_351733 ) ) ( not ( = ?auto_351722 ?auto_351734 ) ) ( not ( = ?auto_351722 ?auto_351735 ) ) ( not ( = ?auto_351723 ?auto_351724 ) ) ( not ( = ?auto_351723 ?auto_351725 ) ) ( not ( = ?auto_351723 ?auto_351726 ) ) ( not ( = ?auto_351723 ?auto_351727 ) ) ( not ( = ?auto_351723 ?auto_351728 ) ) ( not ( = ?auto_351723 ?auto_351729 ) ) ( not ( = ?auto_351723 ?auto_351730 ) ) ( not ( = ?auto_351723 ?auto_351731 ) ) ( not ( = ?auto_351723 ?auto_351732 ) ) ( not ( = ?auto_351723 ?auto_351733 ) ) ( not ( = ?auto_351723 ?auto_351734 ) ) ( not ( = ?auto_351723 ?auto_351735 ) ) ( not ( = ?auto_351724 ?auto_351725 ) ) ( not ( = ?auto_351724 ?auto_351726 ) ) ( not ( = ?auto_351724 ?auto_351727 ) ) ( not ( = ?auto_351724 ?auto_351728 ) ) ( not ( = ?auto_351724 ?auto_351729 ) ) ( not ( = ?auto_351724 ?auto_351730 ) ) ( not ( = ?auto_351724 ?auto_351731 ) ) ( not ( = ?auto_351724 ?auto_351732 ) ) ( not ( = ?auto_351724 ?auto_351733 ) ) ( not ( = ?auto_351724 ?auto_351734 ) ) ( not ( = ?auto_351724 ?auto_351735 ) ) ( not ( = ?auto_351725 ?auto_351726 ) ) ( not ( = ?auto_351725 ?auto_351727 ) ) ( not ( = ?auto_351725 ?auto_351728 ) ) ( not ( = ?auto_351725 ?auto_351729 ) ) ( not ( = ?auto_351725 ?auto_351730 ) ) ( not ( = ?auto_351725 ?auto_351731 ) ) ( not ( = ?auto_351725 ?auto_351732 ) ) ( not ( = ?auto_351725 ?auto_351733 ) ) ( not ( = ?auto_351725 ?auto_351734 ) ) ( not ( = ?auto_351725 ?auto_351735 ) ) ( not ( = ?auto_351726 ?auto_351727 ) ) ( not ( = ?auto_351726 ?auto_351728 ) ) ( not ( = ?auto_351726 ?auto_351729 ) ) ( not ( = ?auto_351726 ?auto_351730 ) ) ( not ( = ?auto_351726 ?auto_351731 ) ) ( not ( = ?auto_351726 ?auto_351732 ) ) ( not ( = ?auto_351726 ?auto_351733 ) ) ( not ( = ?auto_351726 ?auto_351734 ) ) ( not ( = ?auto_351726 ?auto_351735 ) ) ( not ( = ?auto_351727 ?auto_351728 ) ) ( not ( = ?auto_351727 ?auto_351729 ) ) ( not ( = ?auto_351727 ?auto_351730 ) ) ( not ( = ?auto_351727 ?auto_351731 ) ) ( not ( = ?auto_351727 ?auto_351732 ) ) ( not ( = ?auto_351727 ?auto_351733 ) ) ( not ( = ?auto_351727 ?auto_351734 ) ) ( not ( = ?auto_351727 ?auto_351735 ) ) ( not ( = ?auto_351728 ?auto_351729 ) ) ( not ( = ?auto_351728 ?auto_351730 ) ) ( not ( = ?auto_351728 ?auto_351731 ) ) ( not ( = ?auto_351728 ?auto_351732 ) ) ( not ( = ?auto_351728 ?auto_351733 ) ) ( not ( = ?auto_351728 ?auto_351734 ) ) ( not ( = ?auto_351728 ?auto_351735 ) ) ( not ( = ?auto_351729 ?auto_351730 ) ) ( not ( = ?auto_351729 ?auto_351731 ) ) ( not ( = ?auto_351729 ?auto_351732 ) ) ( not ( = ?auto_351729 ?auto_351733 ) ) ( not ( = ?auto_351729 ?auto_351734 ) ) ( not ( = ?auto_351729 ?auto_351735 ) ) ( not ( = ?auto_351730 ?auto_351731 ) ) ( not ( = ?auto_351730 ?auto_351732 ) ) ( not ( = ?auto_351730 ?auto_351733 ) ) ( not ( = ?auto_351730 ?auto_351734 ) ) ( not ( = ?auto_351730 ?auto_351735 ) ) ( not ( = ?auto_351731 ?auto_351732 ) ) ( not ( = ?auto_351731 ?auto_351733 ) ) ( not ( = ?auto_351731 ?auto_351734 ) ) ( not ( = ?auto_351731 ?auto_351735 ) ) ( not ( = ?auto_351732 ?auto_351733 ) ) ( not ( = ?auto_351732 ?auto_351734 ) ) ( not ( = ?auto_351732 ?auto_351735 ) ) ( not ( = ?auto_351733 ?auto_351734 ) ) ( not ( = ?auto_351733 ?auto_351735 ) ) ( not ( = ?auto_351734 ?auto_351735 ) ) ( ON ?auto_351734 ?auto_351735 ) ( ON ?auto_351733 ?auto_351734 ) ( ON ?auto_351732 ?auto_351733 ) ( ON ?auto_351731 ?auto_351732 ) ( ON ?auto_351730 ?auto_351731 ) ( ON ?auto_351729 ?auto_351730 ) ( ON ?auto_351728 ?auto_351729 ) ( CLEAR ?auto_351726 ) ( ON ?auto_351727 ?auto_351728 ) ( CLEAR ?auto_351727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_351722 ?auto_351723 ?auto_351724 ?auto_351725 ?auto_351726 ?auto_351727 )
      ( MAKE-14PILE ?auto_351722 ?auto_351723 ?auto_351724 ?auto_351725 ?auto_351726 ?auto_351727 ?auto_351728 ?auto_351729 ?auto_351730 ?auto_351731 ?auto_351732 ?auto_351733 ?auto_351734 ?auto_351735 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351750 - BLOCK
      ?auto_351751 - BLOCK
      ?auto_351752 - BLOCK
      ?auto_351753 - BLOCK
      ?auto_351754 - BLOCK
      ?auto_351755 - BLOCK
      ?auto_351756 - BLOCK
      ?auto_351757 - BLOCK
      ?auto_351758 - BLOCK
      ?auto_351759 - BLOCK
      ?auto_351760 - BLOCK
      ?auto_351761 - BLOCK
      ?auto_351762 - BLOCK
      ?auto_351763 - BLOCK
    )
    :vars
    (
      ?auto_351764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351763 ?auto_351764 ) ( ON-TABLE ?auto_351750 ) ( ON ?auto_351751 ?auto_351750 ) ( ON ?auto_351752 ?auto_351751 ) ( ON ?auto_351753 ?auto_351752 ) ( not ( = ?auto_351750 ?auto_351751 ) ) ( not ( = ?auto_351750 ?auto_351752 ) ) ( not ( = ?auto_351750 ?auto_351753 ) ) ( not ( = ?auto_351750 ?auto_351754 ) ) ( not ( = ?auto_351750 ?auto_351755 ) ) ( not ( = ?auto_351750 ?auto_351756 ) ) ( not ( = ?auto_351750 ?auto_351757 ) ) ( not ( = ?auto_351750 ?auto_351758 ) ) ( not ( = ?auto_351750 ?auto_351759 ) ) ( not ( = ?auto_351750 ?auto_351760 ) ) ( not ( = ?auto_351750 ?auto_351761 ) ) ( not ( = ?auto_351750 ?auto_351762 ) ) ( not ( = ?auto_351750 ?auto_351763 ) ) ( not ( = ?auto_351750 ?auto_351764 ) ) ( not ( = ?auto_351751 ?auto_351752 ) ) ( not ( = ?auto_351751 ?auto_351753 ) ) ( not ( = ?auto_351751 ?auto_351754 ) ) ( not ( = ?auto_351751 ?auto_351755 ) ) ( not ( = ?auto_351751 ?auto_351756 ) ) ( not ( = ?auto_351751 ?auto_351757 ) ) ( not ( = ?auto_351751 ?auto_351758 ) ) ( not ( = ?auto_351751 ?auto_351759 ) ) ( not ( = ?auto_351751 ?auto_351760 ) ) ( not ( = ?auto_351751 ?auto_351761 ) ) ( not ( = ?auto_351751 ?auto_351762 ) ) ( not ( = ?auto_351751 ?auto_351763 ) ) ( not ( = ?auto_351751 ?auto_351764 ) ) ( not ( = ?auto_351752 ?auto_351753 ) ) ( not ( = ?auto_351752 ?auto_351754 ) ) ( not ( = ?auto_351752 ?auto_351755 ) ) ( not ( = ?auto_351752 ?auto_351756 ) ) ( not ( = ?auto_351752 ?auto_351757 ) ) ( not ( = ?auto_351752 ?auto_351758 ) ) ( not ( = ?auto_351752 ?auto_351759 ) ) ( not ( = ?auto_351752 ?auto_351760 ) ) ( not ( = ?auto_351752 ?auto_351761 ) ) ( not ( = ?auto_351752 ?auto_351762 ) ) ( not ( = ?auto_351752 ?auto_351763 ) ) ( not ( = ?auto_351752 ?auto_351764 ) ) ( not ( = ?auto_351753 ?auto_351754 ) ) ( not ( = ?auto_351753 ?auto_351755 ) ) ( not ( = ?auto_351753 ?auto_351756 ) ) ( not ( = ?auto_351753 ?auto_351757 ) ) ( not ( = ?auto_351753 ?auto_351758 ) ) ( not ( = ?auto_351753 ?auto_351759 ) ) ( not ( = ?auto_351753 ?auto_351760 ) ) ( not ( = ?auto_351753 ?auto_351761 ) ) ( not ( = ?auto_351753 ?auto_351762 ) ) ( not ( = ?auto_351753 ?auto_351763 ) ) ( not ( = ?auto_351753 ?auto_351764 ) ) ( not ( = ?auto_351754 ?auto_351755 ) ) ( not ( = ?auto_351754 ?auto_351756 ) ) ( not ( = ?auto_351754 ?auto_351757 ) ) ( not ( = ?auto_351754 ?auto_351758 ) ) ( not ( = ?auto_351754 ?auto_351759 ) ) ( not ( = ?auto_351754 ?auto_351760 ) ) ( not ( = ?auto_351754 ?auto_351761 ) ) ( not ( = ?auto_351754 ?auto_351762 ) ) ( not ( = ?auto_351754 ?auto_351763 ) ) ( not ( = ?auto_351754 ?auto_351764 ) ) ( not ( = ?auto_351755 ?auto_351756 ) ) ( not ( = ?auto_351755 ?auto_351757 ) ) ( not ( = ?auto_351755 ?auto_351758 ) ) ( not ( = ?auto_351755 ?auto_351759 ) ) ( not ( = ?auto_351755 ?auto_351760 ) ) ( not ( = ?auto_351755 ?auto_351761 ) ) ( not ( = ?auto_351755 ?auto_351762 ) ) ( not ( = ?auto_351755 ?auto_351763 ) ) ( not ( = ?auto_351755 ?auto_351764 ) ) ( not ( = ?auto_351756 ?auto_351757 ) ) ( not ( = ?auto_351756 ?auto_351758 ) ) ( not ( = ?auto_351756 ?auto_351759 ) ) ( not ( = ?auto_351756 ?auto_351760 ) ) ( not ( = ?auto_351756 ?auto_351761 ) ) ( not ( = ?auto_351756 ?auto_351762 ) ) ( not ( = ?auto_351756 ?auto_351763 ) ) ( not ( = ?auto_351756 ?auto_351764 ) ) ( not ( = ?auto_351757 ?auto_351758 ) ) ( not ( = ?auto_351757 ?auto_351759 ) ) ( not ( = ?auto_351757 ?auto_351760 ) ) ( not ( = ?auto_351757 ?auto_351761 ) ) ( not ( = ?auto_351757 ?auto_351762 ) ) ( not ( = ?auto_351757 ?auto_351763 ) ) ( not ( = ?auto_351757 ?auto_351764 ) ) ( not ( = ?auto_351758 ?auto_351759 ) ) ( not ( = ?auto_351758 ?auto_351760 ) ) ( not ( = ?auto_351758 ?auto_351761 ) ) ( not ( = ?auto_351758 ?auto_351762 ) ) ( not ( = ?auto_351758 ?auto_351763 ) ) ( not ( = ?auto_351758 ?auto_351764 ) ) ( not ( = ?auto_351759 ?auto_351760 ) ) ( not ( = ?auto_351759 ?auto_351761 ) ) ( not ( = ?auto_351759 ?auto_351762 ) ) ( not ( = ?auto_351759 ?auto_351763 ) ) ( not ( = ?auto_351759 ?auto_351764 ) ) ( not ( = ?auto_351760 ?auto_351761 ) ) ( not ( = ?auto_351760 ?auto_351762 ) ) ( not ( = ?auto_351760 ?auto_351763 ) ) ( not ( = ?auto_351760 ?auto_351764 ) ) ( not ( = ?auto_351761 ?auto_351762 ) ) ( not ( = ?auto_351761 ?auto_351763 ) ) ( not ( = ?auto_351761 ?auto_351764 ) ) ( not ( = ?auto_351762 ?auto_351763 ) ) ( not ( = ?auto_351762 ?auto_351764 ) ) ( not ( = ?auto_351763 ?auto_351764 ) ) ( ON ?auto_351762 ?auto_351763 ) ( ON ?auto_351761 ?auto_351762 ) ( ON ?auto_351760 ?auto_351761 ) ( ON ?auto_351759 ?auto_351760 ) ( ON ?auto_351758 ?auto_351759 ) ( ON ?auto_351757 ?auto_351758 ) ( ON ?auto_351756 ?auto_351757 ) ( ON ?auto_351755 ?auto_351756 ) ( CLEAR ?auto_351753 ) ( ON ?auto_351754 ?auto_351755 ) ( CLEAR ?auto_351754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_351750 ?auto_351751 ?auto_351752 ?auto_351753 ?auto_351754 )
      ( MAKE-14PILE ?auto_351750 ?auto_351751 ?auto_351752 ?auto_351753 ?auto_351754 ?auto_351755 ?auto_351756 ?auto_351757 ?auto_351758 ?auto_351759 ?auto_351760 ?auto_351761 ?auto_351762 ?auto_351763 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351779 - BLOCK
      ?auto_351780 - BLOCK
      ?auto_351781 - BLOCK
      ?auto_351782 - BLOCK
      ?auto_351783 - BLOCK
      ?auto_351784 - BLOCK
      ?auto_351785 - BLOCK
      ?auto_351786 - BLOCK
      ?auto_351787 - BLOCK
      ?auto_351788 - BLOCK
      ?auto_351789 - BLOCK
      ?auto_351790 - BLOCK
      ?auto_351791 - BLOCK
      ?auto_351792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351792 ) ( ON-TABLE ?auto_351779 ) ( ON ?auto_351780 ?auto_351779 ) ( ON ?auto_351781 ?auto_351780 ) ( ON ?auto_351782 ?auto_351781 ) ( not ( = ?auto_351779 ?auto_351780 ) ) ( not ( = ?auto_351779 ?auto_351781 ) ) ( not ( = ?auto_351779 ?auto_351782 ) ) ( not ( = ?auto_351779 ?auto_351783 ) ) ( not ( = ?auto_351779 ?auto_351784 ) ) ( not ( = ?auto_351779 ?auto_351785 ) ) ( not ( = ?auto_351779 ?auto_351786 ) ) ( not ( = ?auto_351779 ?auto_351787 ) ) ( not ( = ?auto_351779 ?auto_351788 ) ) ( not ( = ?auto_351779 ?auto_351789 ) ) ( not ( = ?auto_351779 ?auto_351790 ) ) ( not ( = ?auto_351779 ?auto_351791 ) ) ( not ( = ?auto_351779 ?auto_351792 ) ) ( not ( = ?auto_351780 ?auto_351781 ) ) ( not ( = ?auto_351780 ?auto_351782 ) ) ( not ( = ?auto_351780 ?auto_351783 ) ) ( not ( = ?auto_351780 ?auto_351784 ) ) ( not ( = ?auto_351780 ?auto_351785 ) ) ( not ( = ?auto_351780 ?auto_351786 ) ) ( not ( = ?auto_351780 ?auto_351787 ) ) ( not ( = ?auto_351780 ?auto_351788 ) ) ( not ( = ?auto_351780 ?auto_351789 ) ) ( not ( = ?auto_351780 ?auto_351790 ) ) ( not ( = ?auto_351780 ?auto_351791 ) ) ( not ( = ?auto_351780 ?auto_351792 ) ) ( not ( = ?auto_351781 ?auto_351782 ) ) ( not ( = ?auto_351781 ?auto_351783 ) ) ( not ( = ?auto_351781 ?auto_351784 ) ) ( not ( = ?auto_351781 ?auto_351785 ) ) ( not ( = ?auto_351781 ?auto_351786 ) ) ( not ( = ?auto_351781 ?auto_351787 ) ) ( not ( = ?auto_351781 ?auto_351788 ) ) ( not ( = ?auto_351781 ?auto_351789 ) ) ( not ( = ?auto_351781 ?auto_351790 ) ) ( not ( = ?auto_351781 ?auto_351791 ) ) ( not ( = ?auto_351781 ?auto_351792 ) ) ( not ( = ?auto_351782 ?auto_351783 ) ) ( not ( = ?auto_351782 ?auto_351784 ) ) ( not ( = ?auto_351782 ?auto_351785 ) ) ( not ( = ?auto_351782 ?auto_351786 ) ) ( not ( = ?auto_351782 ?auto_351787 ) ) ( not ( = ?auto_351782 ?auto_351788 ) ) ( not ( = ?auto_351782 ?auto_351789 ) ) ( not ( = ?auto_351782 ?auto_351790 ) ) ( not ( = ?auto_351782 ?auto_351791 ) ) ( not ( = ?auto_351782 ?auto_351792 ) ) ( not ( = ?auto_351783 ?auto_351784 ) ) ( not ( = ?auto_351783 ?auto_351785 ) ) ( not ( = ?auto_351783 ?auto_351786 ) ) ( not ( = ?auto_351783 ?auto_351787 ) ) ( not ( = ?auto_351783 ?auto_351788 ) ) ( not ( = ?auto_351783 ?auto_351789 ) ) ( not ( = ?auto_351783 ?auto_351790 ) ) ( not ( = ?auto_351783 ?auto_351791 ) ) ( not ( = ?auto_351783 ?auto_351792 ) ) ( not ( = ?auto_351784 ?auto_351785 ) ) ( not ( = ?auto_351784 ?auto_351786 ) ) ( not ( = ?auto_351784 ?auto_351787 ) ) ( not ( = ?auto_351784 ?auto_351788 ) ) ( not ( = ?auto_351784 ?auto_351789 ) ) ( not ( = ?auto_351784 ?auto_351790 ) ) ( not ( = ?auto_351784 ?auto_351791 ) ) ( not ( = ?auto_351784 ?auto_351792 ) ) ( not ( = ?auto_351785 ?auto_351786 ) ) ( not ( = ?auto_351785 ?auto_351787 ) ) ( not ( = ?auto_351785 ?auto_351788 ) ) ( not ( = ?auto_351785 ?auto_351789 ) ) ( not ( = ?auto_351785 ?auto_351790 ) ) ( not ( = ?auto_351785 ?auto_351791 ) ) ( not ( = ?auto_351785 ?auto_351792 ) ) ( not ( = ?auto_351786 ?auto_351787 ) ) ( not ( = ?auto_351786 ?auto_351788 ) ) ( not ( = ?auto_351786 ?auto_351789 ) ) ( not ( = ?auto_351786 ?auto_351790 ) ) ( not ( = ?auto_351786 ?auto_351791 ) ) ( not ( = ?auto_351786 ?auto_351792 ) ) ( not ( = ?auto_351787 ?auto_351788 ) ) ( not ( = ?auto_351787 ?auto_351789 ) ) ( not ( = ?auto_351787 ?auto_351790 ) ) ( not ( = ?auto_351787 ?auto_351791 ) ) ( not ( = ?auto_351787 ?auto_351792 ) ) ( not ( = ?auto_351788 ?auto_351789 ) ) ( not ( = ?auto_351788 ?auto_351790 ) ) ( not ( = ?auto_351788 ?auto_351791 ) ) ( not ( = ?auto_351788 ?auto_351792 ) ) ( not ( = ?auto_351789 ?auto_351790 ) ) ( not ( = ?auto_351789 ?auto_351791 ) ) ( not ( = ?auto_351789 ?auto_351792 ) ) ( not ( = ?auto_351790 ?auto_351791 ) ) ( not ( = ?auto_351790 ?auto_351792 ) ) ( not ( = ?auto_351791 ?auto_351792 ) ) ( ON ?auto_351791 ?auto_351792 ) ( ON ?auto_351790 ?auto_351791 ) ( ON ?auto_351789 ?auto_351790 ) ( ON ?auto_351788 ?auto_351789 ) ( ON ?auto_351787 ?auto_351788 ) ( ON ?auto_351786 ?auto_351787 ) ( ON ?auto_351785 ?auto_351786 ) ( ON ?auto_351784 ?auto_351785 ) ( CLEAR ?auto_351782 ) ( ON ?auto_351783 ?auto_351784 ) ( CLEAR ?auto_351783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_351779 ?auto_351780 ?auto_351781 ?auto_351782 ?auto_351783 )
      ( MAKE-14PILE ?auto_351779 ?auto_351780 ?auto_351781 ?auto_351782 ?auto_351783 ?auto_351784 ?auto_351785 ?auto_351786 ?auto_351787 ?auto_351788 ?auto_351789 ?auto_351790 ?auto_351791 ?auto_351792 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351807 - BLOCK
      ?auto_351808 - BLOCK
      ?auto_351809 - BLOCK
      ?auto_351810 - BLOCK
      ?auto_351811 - BLOCK
      ?auto_351812 - BLOCK
      ?auto_351813 - BLOCK
      ?auto_351814 - BLOCK
      ?auto_351815 - BLOCK
      ?auto_351816 - BLOCK
      ?auto_351817 - BLOCK
      ?auto_351818 - BLOCK
      ?auto_351819 - BLOCK
      ?auto_351820 - BLOCK
    )
    :vars
    (
      ?auto_351821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351820 ?auto_351821 ) ( ON-TABLE ?auto_351807 ) ( ON ?auto_351808 ?auto_351807 ) ( ON ?auto_351809 ?auto_351808 ) ( not ( = ?auto_351807 ?auto_351808 ) ) ( not ( = ?auto_351807 ?auto_351809 ) ) ( not ( = ?auto_351807 ?auto_351810 ) ) ( not ( = ?auto_351807 ?auto_351811 ) ) ( not ( = ?auto_351807 ?auto_351812 ) ) ( not ( = ?auto_351807 ?auto_351813 ) ) ( not ( = ?auto_351807 ?auto_351814 ) ) ( not ( = ?auto_351807 ?auto_351815 ) ) ( not ( = ?auto_351807 ?auto_351816 ) ) ( not ( = ?auto_351807 ?auto_351817 ) ) ( not ( = ?auto_351807 ?auto_351818 ) ) ( not ( = ?auto_351807 ?auto_351819 ) ) ( not ( = ?auto_351807 ?auto_351820 ) ) ( not ( = ?auto_351807 ?auto_351821 ) ) ( not ( = ?auto_351808 ?auto_351809 ) ) ( not ( = ?auto_351808 ?auto_351810 ) ) ( not ( = ?auto_351808 ?auto_351811 ) ) ( not ( = ?auto_351808 ?auto_351812 ) ) ( not ( = ?auto_351808 ?auto_351813 ) ) ( not ( = ?auto_351808 ?auto_351814 ) ) ( not ( = ?auto_351808 ?auto_351815 ) ) ( not ( = ?auto_351808 ?auto_351816 ) ) ( not ( = ?auto_351808 ?auto_351817 ) ) ( not ( = ?auto_351808 ?auto_351818 ) ) ( not ( = ?auto_351808 ?auto_351819 ) ) ( not ( = ?auto_351808 ?auto_351820 ) ) ( not ( = ?auto_351808 ?auto_351821 ) ) ( not ( = ?auto_351809 ?auto_351810 ) ) ( not ( = ?auto_351809 ?auto_351811 ) ) ( not ( = ?auto_351809 ?auto_351812 ) ) ( not ( = ?auto_351809 ?auto_351813 ) ) ( not ( = ?auto_351809 ?auto_351814 ) ) ( not ( = ?auto_351809 ?auto_351815 ) ) ( not ( = ?auto_351809 ?auto_351816 ) ) ( not ( = ?auto_351809 ?auto_351817 ) ) ( not ( = ?auto_351809 ?auto_351818 ) ) ( not ( = ?auto_351809 ?auto_351819 ) ) ( not ( = ?auto_351809 ?auto_351820 ) ) ( not ( = ?auto_351809 ?auto_351821 ) ) ( not ( = ?auto_351810 ?auto_351811 ) ) ( not ( = ?auto_351810 ?auto_351812 ) ) ( not ( = ?auto_351810 ?auto_351813 ) ) ( not ( = ?auto_351810 ?auto_351814 ) ) ( not ( = ?auto_351810 ?auto_351815 ) ) ( not ( = ?auto_351810 ?auto_351816 ) ) ( not ( = ?auto_351810 ?auto_351817 ) ) ( not ( = ?auto_351810 ?auto_351818 ) ) ( not ( = ?auto_351810 ?auto_351819 ) ) ( not ( = ?auto_351810 ?auto_351820 ) ) ( not ( = ?auto_351810 ?auto_351821 ) ) ( not ( = ?auto_351811 ?auto_351812 ) ) ( not ( = ?auto_351811 ?auto_351813 ) ) ( not ( = ?auto_351811 ?auto_351814 ) ) ( not ( = ?auto_351811 ?auto_351815 ) ) ( not ( = ?auto_351811 ?auto_351816 ) ) ( not ( = ?auto_351811 ?auto_351817 ) ) ( not ( = ?auto_351811 ?auto_351818 ) ) ( not ( = ?auto_351811 ?auto_351819 ) ) ( not ( = ?auto_351811 ?auto_351820 ) ) ( not ( = ?auto_351811 ?auto_351821 ) ) ( not ( = ?auto_351812 ?auto_351813 ) ) ( not ( = ?auto_351812 ?auto_351814 ) ) ( not ( = ?auto_351812 ?auto_351815 ) ) ( not ( = ?auto_351812 ?auto_351816 ) ) ( not ( = ?auto_351812 ?auto_351817 ) ) ( not ( = ?auto_351812 ?auto_351818 ) ) ( not ( = ?auto_351812 ?auto_351819 ) ) ( not ( = ?auto_351812 ?auto_351820 ) ) ( not ( = ?auto_351812 ?auto_351821 ) ) ( not ( = ?auto_351813 ?auto_351814 ) ) ( not ( = ?auto_351813 ?auto_351815 ) ) ( not ( = ?auto_351813 ?auto_351816 ) ) ( not ( = ?auto_351813 ?auto_351817 ) ) ( not ( = ?auto_351813 ?auto_351818 ) ) ( not ( = ?auto_351813 ?auto_351819 ) ) ( not ( = ?auto_351813 ?auto_351820 ) ) ( not ( = ?auto_351813 ?auto_351821 ) ) ( not ( = ?auto_351814 ?auto_351815 ) ) ( not ( = ?auto_351814 ?auto_351816 ) ) ( not ( = ?auto_351814 ?auto_351817 ) ) ( not ( = ?auto_351814 ?auto_351818 ) ) ( not ( = ?auto_351814 ?auto_351819 ) ) ( not ( = ?auto_351814 ?auto_351820 ) ) ( not ( = ?auto_351814 ?auto_351821 ) ) ( not ( = ?auto_351815 ?auto_351816 ) ) ( not ( = ?auto_351815 ?auto_351817 ) ) ( not ( = ?auto_351815 ?auto_351818 ) ) ( not ( = ?auto_351815 ?auto_351819 ) ) ( not ( = ?auto_351815 ?auto_351820 ) ) ( not ( = ?auto_351815 ?auto_351821 ) ) ( not ( = ?auto_351816 ?auto_351817 ) ) ( not ( = ?auto_351816 ?auto_351818 ) ) ( not ( = ?auto_351816 ?auto_351819 ) ) ( not ( = ?auto_351816 ?auto_351820 ) ) ( not ( = ?auto_351816 ?auto_351821 ) ) ( not ( = ?auto_351817 ?auto_351818 ) ) ( not ( = ?auto_351817 ?auto_351819 ) ) ( not ( = ?auto_351817 ?auto_351820 ) ) ( not ( = ?auto_351817 ?auto_351821 ) ) ( not ( = ?auto_351818 ?auto_351819 ) ) ( not ( = ?auto_351818 ?auto_351820 ) ) ( not ( = ?auto_351818 ?auto_351821 ) ) ( not ( = ?auto_351819 ?auto_351820 ) ) ( not ( = ?auto_351819 ?auto_351821 ) ) ( not ( = ?auto_351820 ?auto_351821 ) ) ( ON ?auto_351819 ?auto_351820 ) ( ON ?auto_351818 ?auto_351819 ) ( ON ?auto_351817 ?auto_351818 ) ( ON ?auto_351816 ?auto_351817 ) ( ON ?auto_351815 ?auto_351816 ) ( ON ?auto_351814 ?auto_351815 ) ( ON ?auto_351813 ?auto_351814 ) ( ON ?auto_351812 ?auto_351813 ) ( ON ?auto_351811 ?auto_351812 ) ( CLEAR ?auto_351809 ) ( ON ?auto_351810 ?auto_351811 ) ( CLEAR ?auto_351810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_351807 ?auto_351808 ?auto_351809 ?auto_351810 )
      ( MAKE-14PILE ?auto_351807 ?auto_351808 ?auto_351809 ?auto_351810 ?auto_351811 ?auto_351812 ?auto_351813 ?auto_351814 ?auto_351815 ?auto_351816 ?auto_351817 ?auto_351818 ?auto_351819 ?auto_351820 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351836 - BLOCK
      ?auto_351837 - BLOCK
      ?auto_351838 - BLOCK
      ?auto_351839 - BLOCK
      ?auto_351840 - BLOCK
      ?auto_351841 - BLOCK
      ?auto_351842 - BLOCK
      ?auto_351843 - BLOCK
      ?auto_351844 - BLOCK
      ?auto_351845 - BLOCK
      ?auto_351846 - BLOCK
      ?auto_351847 - BLOCK
      ?auto_351848 - BLOCK
      ?auto_351849 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351849 ) ( ON-TABLE ?auto_351836 ) ( ON ?auto_351837 ?auto_351836 ) ( ON ?auto_351838 ?auto_351837 ) ( not ( = ?auto_351836 ?auto_351837 ) ) ( not ( = ?auto_351836 ?auto_351838 ) ) ( not ( = ?auto_351836 ?auto_351839 ) ) ( not ( = ?auto_351836 ?auto_351840 ) ) ( not ( = ?auto_351836 ?auto_351841 ) ) ( not ( = ?auto_351836 ?auto_351842 ) ) ( not ( = ?auto_351836 ?auto_351843 ) ) ( not ( = ?auto_351836 ?auto_351844 ) ) ( not ( = ?auto_351836 ?auto_351845 ) ) ( not ( = ?auto_351836 ?auto_351846 ) ) ( not ( = ?auto_351836 ?auto_351847 ) ) ( not ( = ?auto_351836 ?auto_351848 ) ) ( not ( = ?auto_351836 ?auto_351849 ) ) ( not ( = ?auto_351837 ?auto_351838 ) ) ( not ( = ?auto_351837 ?auto_351839 ) ) ( not ( = ?auto_351837 ?auto_351840 ) ) ( not ( = ?auto_351837 ?auto_351841 ) ) ( not ( = ?auto_351837 ?auto_351842 ) ) ( not ( = ?auto_351837 ?auto_351843 ) ) ( not ( = ?auto_351837 ?auto_351844 ) ) ( not ( = ?auto_351837 ?auto_351845 ) ) ( not ( = ?auto_351837 ?auto_351846 ) ) ( not ( = ?auto_351837 ?auto_351847 ) ) ( not ( = ?auto_351837 ?auto_351848 ) ) ( not ( = ?auto_351837 ?auto_351849 ) ) ( not ( = ?auto_351838 ?auto_351839 ) ) ( not ( = ?auto_351838 ?auto_351840 ) ) ( not ( = ?auto_351838 ?auto_351841 ) ) ( not ( = ?auto_351838 ?auto_351842 ) ) ( not ( = ?auto_351838 ?auto_351843 ) ) ( not ( = ?auto_351838 ?auto_351844 ) ) ( not ( = ?auto_351838 ?auto_351845 ) ) ( not ( = ?auto_351838 ?auto_351846 ) ) ( not ( = ?auto_351838 ?auto_351847 ) ) ( not ( = ?auto_351838 ?auto_351848 ) ) ( not ( = ?auto_351838 ?auto_351849 ) ) ( not ( = ?auto_351839 ?auto_351840 ) ) ( not ( = ?auto_351839 ?auto_351841 ) ) ( not ( = ?auto_351839 ?auto_351842 ) ) ( not ( = ?auto_351839 ?auto_351843 ) ) ( not ( = ?auto_351839 ?auto_351844 ) ) ( not ( = ?auto_351839 ?auto_351845 ) ) ( not ( = ?auto_351839 ?auto_351846 ) ) ( not ( = ?auto_351839 ?auto_351847 ) ) ( not ( = ?auto_351839 ?auto_351848 ) ) ( not ( = ?auto_351839 ?auto_351849 ) ) ( not ( = ?auto_351840 ?auto_351841 ) ) ( not ( = ?auto_351840 ?auto_351842 ) ) ( not ( = ?auto_351840 ?auto_351843 ) ) ( not ( = ?auto_351840 ?auto_351844 ) ) ( not ( = ?auto_351840 ?auto_351845 ) ) ( not ( = ?auto_351840 ?auto_351846 ) ) ( not ( = ?auto_351840 ?auto_351847 ) ) ( not ( = ?auto_351840 ?auto_351848 ) ) ( not ( = ?auto_351840 ?auto_351849 ) ) ( not ( = ?auto_351841 ?auto_351842 ) ) ( not ( = ?auto_351841 ?auto_351843 ) ) ( not ( = ?auto_351841 ?auto_351844 ) ) ( not ( = ?auto_351841 ?auto_351845 ) ) ( not ( = ?auto_351841 ?auto_351846 ) ) ( not ( = ?auto_351841 ?auto_351847 ) ) ( not ( = ?auto_351841 ?auto_351848 ) ) ( not ( = ?auto_351841 ?auto_351849 ) ) ( not ( = ?auto_351842 ?auto_351843 ) ) ( not ( = ?auto_351842 ?auto_351844 ) ) ( not ( = ?auto_351842 ?auto_351845 ) ) ( not ( = ?auto_351842 ?auto_351846 ) ) ( not ( = ?auto_351842 ?auto_351847 ) ) ( not ( = ?auto_351842 ?auto_351848 ) ) ( not ( = ?auto_351842 ?auto_351849 ) ) ( not ( = ?auto_351843 ?auto_351844 ) ) ( not ( = ?auto_351843 ?auto_351845 ) ) ( not ( = ?auto_351843 ?auto_351846 ) ) ( not ( = ?auto_351843 ?auto_351847 ) ) ( not ( = ?auto_351843 ?auto_351848 ) ) ( not ( = ?auto_351843 ?auto_351849 ) ) ( not ( = ?auto_351844 ?auto_351845 ) ) ( not ( = ?auto_351844 ?auto_351846 ) ) ( not ( = ?auto_351844 ?auto_351847 ) ) ( not ( = ?auto_351844 ?auto_351848 ) ) ( not ( = ?auto_351844 ?auto_351849 ) ) ( not ( = ?auto_351845 ?auto_351846 ) ) ( not ( = ?auto_351845 ?auto_351847 ) ) ( not ( = ?auto_351845 ?auto_351848 ) ) ( not ( = ?auto_351845 ?auto_351849 ) ) ( not ( = ?auto_351846 ?auto_351847 ) ) ( not ( = ?auto_351846 ?auto_351848 ) ) ( not ( = ?auto_351846 ?auto_351849 ) ) ( not ( = ?auto_351847 ?auto_351848 ) ) ( not ( = ?auto_351847 ?auto_351849 ) ) ( not ( = ?auto_351848 ?auto_351849 ) ) ( ON ?auto_351848 ?auto_351849 ) ( ON ?auto_351847 ?auto_351848 ) ( ON ?auto_351846 ?auto_351847 ) ( ON ?auto_351845 ?auto_351846 ) ( ON ?auto_351844 ?auto_351845 ) ( ON ?auto_351843 ?auto_351844 ) ( ON ?auto_351842 ?auto_351843 ) ( ON ?auto_351841 ?auto_351842 ) ( ON ?auto_351840 ?auto_351841 ) ( CLEAR ?auto_351838 ) ( ON ?auto_351839 ?auto_351840 ) ( CLEAR ?auto_351839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_351836 ?auto_351837 ?auto_351838 ?auto_351839 )
      ( MAKE-14PILE ?auto_351836 ?auto_351837 ?auto_351838 ?auto_351839 ?auto_351840 ?auto_351841 ?auto_351842 ?auto_351843 ?auto_351844 ?auto_351845 ?auto_351846 ?auto_351847 ?auto_351848 ?auto_351849 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351864 - BLOCK
      ?auto_351865 - BLOCK
      ?auto_351866 - BLOCK
      ?auto_351867 - BLOCK
      ?auto_351868 - BLOCK
      ?auto_351869 - BLOCK
      ?auto_351870 - BLOCK
      ?auto_351871 - BLOCK
      ?auto_351872 - BLOCK
      ?auto_351873 - BLOCK
      ?auto_351874 - BLOCK
      ?auto_351875 - BLOCK
      ?auto_351876 - BLOCK
      ?auto_351877 - BLOCK
    )
    :vars
    (
      ?auto_351878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351877 ?auto_351878 ) ( ON-TABLE ?auto_351864 ) ( ON ?auto_351865 ?auto_351864 ) ( not ( = ?auto_351864 ?auto_351865 ) ) ( not ( = ?auto_351864 ?auto_351866 ) ) ( not ( = ?auto_351864 ?auto_351867 ) ) ( not ( = ?auto_351864 ?auto_351868 ) ) ( not ( = ?auto_351864 ?auto_351869 ) ) ( not ( = ?auto_351864 ?auto_351870 ) ) ( not ( = ?auto_351864 ?auto_351871 ) ) ( not ( = ?auto_351864 ?auto_351872 ) ) ( not ( = ?auto_351864 ?auto_351873 ) ) ( not ( = ?auto_351864 ?auto_351874 ) ) ( not ( = ?auto_351864 ?auto_351875 ) ) ( not ( = ?auto_351864 ?auto_351876 ) ) ( not ( = ?auto_351864 ?auto_351877 ) ) ( not ( = ?auto_351864 ?auto_351878 ) ) ( not ( = ?auto_351865 ?auto_351866 ) ) ( not ( = ?auto_351865 ?auto_351867 ) ) ( not ( = ?auto_351865 ?auto_351868 ) ) ( not ( = ?auto_351865 ?auto_351869 ) ) ( not ( = ?auto_351865 ?auto_351870 ) ) ( not ( = ?auto_351865 ?auto_351871 ) ) ( not ( = ?auto_351865 ?auto_351872 ) ) ( not ( = ?auto_351865 ?auto_351873 ) ) ( not ( = ?auto_351865 ?auto_351874 ) ) ( not ( = ?auto_351865 ?auto_351875 ) ) ( not ( = ?auto_351865 ?auto_351876 ) ) ( not ( = ?auto_351865 ?auto_351877 ) ) ( not ( = ?auto_351865 ?auto_351878 ) ) ( not ( = ?auto_351866 ?auto_351867 ) ) ( not ( = ?auto_351866 ?auto_351868 ) ) ( not ( = ?auto_351866 ?auto_351869 ) ) ( not ( = ?auto_351866 ?auto_351870 ) ) ( not ( = ?auto_351866 ?auto_351871 ) ) ( not ( = ?auto_351866 ?auto_351872 ) ) ( not ( = ?auto_351866 ?auto_351873 ) ) ( not ( = ?auto_351866 ?auto_351874 ) ) ( not ( = ?auto_351866 ?auto_351875 ) ) ( not ( = ?auto_351866 ?auto_351876 ) ) ( not ( = ?auto_351866 ?auto_351877 ) ) ( not ( = ?auto_351866 ?auto_351878 ) ) ( not ( = ?auto_351867 ?auto_351868 ) ) ( not ( = ?auto_351867 ?auto_351869 ) ) ( not ( = ?auto_351867 ?auto_351870 ) ) ( not ( = ?auto_351867 ?auto_351871 ) ) ( not ( = ?auto_351867 ?auto_351872 ) ) ( not ( = ?auto_351867 ?auto_351873 ) ) ( not ( = ?auto_351867 ?auto_351874 ) ) ( not ( = ?auto_351867 ?auto_351875 ) ) ( not ( = ?auto_351867 ?auto_351876 ) ) ( not ( = ?auto_351867 ?auto_351877 ) ) ( not ( = ?auto_351867 ?auto_351878 ) ) ( not ( = ?auto_351868 ?auto_351869 ) ) ( not ( = ?auto_351868 ?auto_351870 ) ) ( not ( = ?auto_351868 ?auto_351871 ) ) ( not ( = ?auto_351868 ?auto_351872 ) ) ( not ( = ?auto_351868 ?auto_351873 ) ) ( not ( = ?auto_351868 ?auto_351874 ) ) ( not ( = ?auto_351868 ?auto_351875 ) ) ( not ( = ?auto_351868 ?auto_351876 ) ) ( not ( = ?auto_351868 ?auto_351877 ) ) ( not ( = ?auto_351868 ?auto_351878 ) ) ( not ( = ?auto_351869 ?auto_351870 ) ) ( not ( = ?auto_351869 ?auto_351871 ) ) ( not ( = ?auto_351869 ?auto_351872 ) ) ( not ( = ?auto_351869 ?auto_351873 ) ) ( not ( = ?auto_351869 ?auto_351874 ) ) ( not ( = ?auto_351869 ?auto_351875 ) ) ( not ( = ?auto_351869 ?auto_351876 ) ) ( not ( = ?auto_351869 ?auto_351877 ) ) ( not ( = ?auto_351869 ?auto_351878 ) ) ( not ( = ?auto_351870 ?auto_351871 ) ) ( not ( = ?auto_351870 ?auto_351872 ) ) ( not ( = ?auto_351870 ?auto_351873 ) ) ( not ( = ?auto_351870 ?auto_351874 ) ) ( not ( = ?auto_351870 ?auto_351875 ) ) ( not ( = ?auto_351870 ?auto_351876 ) ) ( not ( = ?auto_351870 ?auto_351877 ) ) ( not ( = ?auto_351870 ?auto_351878 ) ) ( not ( = ?auto_351871 ?auto_351872 ) ) ( not ( = ?auto_351871 ?auto_351873 ) ) ( not ( = ?auto_351871 ?auto_351874 ) ) ( not ( = ?auto_351871 ?auto_351875 ) ) ( not ( = ?auto_351871 ?auto_351876 ) ) ( not ( = ?auto_351871 ?auto_351877 ) ) ( not ( = ?auto_351871 ?auto_351878 ) ) ( not ( = ?auto_351872 ?auto_351873 ) ) ( not ( = ?auto_351872 ?auto_351874 ) ) ( not ( = ?auto_351872 ?auto_351875 ) ) ( not ( = ?auto_351872 ?auto_351876 ) ) ( not ( = ?auto_351872 ?auto_351877 ) ) ( not ( = ?auto_351872 ?auto_351878 ) ) ( not ( = ?auto_351873 ?auto_351874 ) ) ( not ( = ?auto_351873 ?auto_351875 ) ) ( not ( = ?auto_351873 ?auto_351876 ) ) ( not ( = ?auto_351873 ?auto_351877 ) ) ( not ( = ?auto_351873 ?auto_351878 ) ) ( not ( = ?auto_351874 ?auto_351875 ) ) ( not ( = ?auto_351874 ?auto_351876 ) ) ( not ( = ?auto_351874 ?auto_351877 ) ) ( not ( = ?auto_351874 ?auto_351878 ) ) ( not ( = ?auto_351875 ?auto_351876 ) ) ( not ( = ?auto_351875 ?auto_351877 ) ) ( not ( = ?auto_351875 ?auto_351878 ) ) ( not ( = ?auto_351876 ?auto_351877 ) ) ( not ( = ?auto_351876 ?auto_351878 ) ) ( not ( = ?auto_351877 ?auto_351878 ) ) ( ON ?auto_351876 ?auto_351877 ) ( ON ?auto_351875 ?auto_351876 ) ( ON ?auto_351874 ?auto_351875 ) ( ON ?auto_351873 ?auto_351874 ) ( ON ?auto_351872 ?auto_351873 ) ( ON ?auto_351871 ?auto_351872 ) ( ON ?auto_351870 ?auto_351871 ) ( ON ?auto_351869 ?auto_351870 ) ( ON ?auto_351868 ?auto_351869 ) ( ON ?auto_351867 ?auto_351868 ) ( CLEAR ?auto_351865 ) ( ON ?auto_351866 ?auto_351867 ) ( CLEAR ?auto_351866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_351864 ?auto_351865 ?auto_351866 )
      ( MAKE-14PILE ?auto_351864 ?auto_351865 ?auto_351866 ?auto_351867 ?auto_351868 ?auto_351869 ?auto_351870 ?auto_351871 ?auto_351872 ?auto_351873 ?auto_351874 ?auto_351875 ?auto_351876 ?auto_351877 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351893 - BLOCK
      ?auto_351894 - BLOCK
      ?auto_351895 - BLOCK
      ?auto_351896 - BLOCK
      ?auto_351897 - BLOCK
      ?auto_351898 - BLOCK
      ?auto_351899 - BLOCK
      ?auto_351900 - BLOCK
      ?auto_351901 - BLOCK
      ?auto_351902 - BLOCK
      ?auto_351903 - BLOCK
      ?auto_351904 - BLOCK
      ?auto_351905 - BLOCK
      ?auto_351906 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351906 ) ( ON-TABLE ?auto_351893 ) ( ON ?auto_351894 ?auto_351893 ) ( not ( = ?auto_351893 ?auto_351894 ) ) ( not ( = ?auto_351893 ?auto_351895 ) ) ( not ( = ?auto_351893 ?auto_351896 ) ) ( not ( = ?auto_351893 ?auto_351897 ) ) ( not ( = ?auto_351893 ?auto_351898 ) ) ( not ( = ?auto_351893 ?auto_351899 ) ) ( not ( = ?auto_351893 ?auto_351900 ) ) ( not ( = ?auto_351893 ?auto_351901 ) ) ( not ( = ?auto_351893 ?auto_351902 ) ) ( not ( = ?auto_351893 ?auto_351903 ) ) ( not ( = ?auto_351893 ?auto_351904 ) ) ( not ( = ?auto_351893 ?auto_351905 ) ) ( not ( = ?auto_351893 ?auto_351906 ) ) ( not ( = ?auto_351894 ?auto_351895 ) ) ( not ( = ?auto_351894 ?auto_351896 ) ) ( not ( = ?auto_351894 ?auto_351897 ) ) ( not ( = ?auto_351894 ?auto_351898 ) ) ( not ( = ?auto_351894 ?auto_351899 ) ) ( not ( = ?auto_351894 ?auto_351900 ) ) ( not ( = ?auto_351894 ?auto_351901 ) ) ( not ( = ?auto_351894 ?auto_351902 ) ) ( not ( = ?auto_351894 ?auto_351903 ) ) ( not ( = ?auto_351894 ?auto_351904 ) ) ( not ( = ?auto_351894 ?auto_351905 ) ) ( not ( = ?auto_351894 ?auto_351906 ) ) ( not ( = ?auto_351895 ?auto_351896 ) ) ( not ( = ?auto_351895 ?auto_351897 ) ) ( not ( = ?auto_351895 ?auto_351898 ) ) ( not ( = ?auto_351895 ?auto_351899 ) ) ( not ( = ?auto_351895 ?auto_351900 ) ) ( not ( = ?auto_351895 ?auto_351901 ) ) ( not ( = ?auto_351895 ?auto_351902 ) ) ( not ( = ?auto_351895 ?auto_351903 ) ) ( not ( = ?auto_351895 ?auto_351904 ) ) ( not ( = ?auto_351895 ?auto_351905 ) ) ( not ( = ?auto_351895 ?auto_351906 ) ) ( not ( = ?auto_351896 ?auto_351897 ) ) ( not ( = ?auto_351896 ?auto_351898 ) ) ( not ( = ?auto_351896 ?auto_351899 ) ) ( not ( = ?auto_351896 ?auto_351900 ) ) ( not ( = ?auto_351896 ?auto_351901 ) ) ( not ( = ?auto_351896 ?auto_351902 ) ) ( not ( = ?auto_351896 ?auto_351903 ) ) ( not ( = ?auto_351896 ?auto_351904 ) ) ( not ( = ?auto_351896 ?auto_351905 ) ) ( not ( = ?auto_351896 ?auto_351906 ) ) ( not ( = ?auto_351897 ?auto_351898 ) ) ( not ( = ?auto_351897 ?auto_351899 ) ) ( not ( = ?auto_351897 ?auto_351900 ) ) ( not ( = ?auto_351897 ?auto_351901 ) ) ( not ( = ?auto_351897 ?auto_351902 ) ) ( not ( = ?auto_351897 ?auto_351903 ) ) ( not ( = ?auto_351897 ?auto_351904 ) ) ( not ( = ?auto_351897 ?auto_351905 ) ) ( not ( = ?auto_351897 ?auto_351906 ) ) ( not ( = ?auto_351898 ?auto_351899 ) ) ( not ( = ?auto_351898 ?auto_351900 ) ) ( not ( = ?auto_351898 ?auto_351901 ) ) ( not ( = ?auto_351898 ?auto_351902 ) ) ( not ( = ?auto_351898 ?auto_351903 ) ) ( not ( = ?auto_351898 ?auto_351904 ) ) ( not ( = ?auto_351898 ?auto_351905 ) ) ( not ( = ?auto_351898 ?auto_351906 ) ) ( not ( = ?auto_351899 ?auto_351900 ) ) ( not ( = ?auto_351899 ?auto_351901 ) ) ( not ( = ?auto_351899 ?auto_351902 ) ) ( not ( = ?auto_351899 ?auto_351903 ) ) ( not ( = ?auto_351899 ?auto_351904 ) ) ( not ( = ?auto_351899 ?auto_351905 ) ) ( not ( = ?auto_351899 ?auto_351906 ) ) ( not ( = ?auto_351900 ?auto_351901 ) ) ( not ( = ?auto_351900 ?auto_351902 ) ) ( not ( = ?auto_351900 ?auto_351903 ) ) ( not ( = ?auto_351900 ?auto_351904 ) ) ( not ( = ?auto_351900 ?auto_351905 ) ) ( not ( = ?auto_351900 ?auto_351906 ) ) ( not ( = ?auto_351901 ?auto_351902 ) ) ( not ( = ?auto_351901 ?auto_351903 ) ) ( not ( = ?auto_351901 ?auto_351904 ) ) ( not ( = ?auto_351901 ?auto_351905 ) ) ( not ( = ?auto_351901 ?auto_351906 ) ) ( not ( = ?auto_351902 ?auto_351903 ) ) ( not ( = ?auto_351902 ?auto_351904 ) ) ( not ( = ?auto_351902 ?auto_351905 ) ) ( not ( = ?auto_351902 ?auto_351906 ) ) ( not ( = ?auto_351903 ?auto_351904 ) ) ( not ( = ?auto_351903 ?auto_351905 ) ) ( not ( = ?auto_351903 ?auto_351906 ) ) ( not ( = ?auto_351904 ?auto_351905 ) ) ( not ( = ?auto_351904 ?auto_351906 ) ) ( not ( = ?auto_351905 ?auto_351906 ) ) ( ON ?auto_351905 ?auto_351906 ) ( ON ?auto_351904 ?auto_351905 ) ( ON ?auto_351903 ?auto_351904 ) ( ON ?auto_351902 ?auto_351903 ) ( ON ?auto_351901 ?auto_351902 ) ( ON ?auto_351900 ?auto_351901 ) ( ON ?auto_351899 ?auto_351900 ) ( ON ?auto_351898 ?auto_351899 ) ( ON ?auto_351897 ?auto_351898 ) ( ON ?auto_351896 ?auto_351897 ) ( CLEAR ?auto_351894 ) ( ON ?auto_351895 ?auto_351896 ) ( CLEAR ?auto_351895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_351893 ?auto_351894 ?auto_351895 )
      ( MAKE-14PILE ?auto_351893 ?auto_351894 ?auto_351895 ?auto_351896 ?auto_351897 ?auto_351898 ?auto_351899 ?auto_351900 ?auto_351901 ?auto_351902 ?auto_351903 ?auto_351904 ?auto_351905 ?auto_351906 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351921 - BLOCK
      ?auto_351922 - BLOCK
      ?auto_351923 - BLOCK
      ?auto_351924 - BLOCK
      ?auto_351925 - BLOCK
      ?auto_351926 - BLOCK
      ?auto_351927 - BLOCK
      ?auto_351928 - BLOCK
      ?auto_351929 - BLOCK
      ?auto_351930 - BLOCK
      ?auto_351931 - BLOCK
      ?auto_351932 - BLOCK
      ?auto_351933 - BLOCK
      ?auto_351934 - BLOCK
    )
    :vars
    (
      ?auto_351935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351934 ?auto_351935 ) ( ON-TABLE ?auto_351921 ) ( not ( = ?auto_351921 ?auto_351922 ) ) ( not ( = ?auto_351921 ?auto_351923 ) ) ( not ( = ?auto_351921 ?auto_351924 ) ) ( not ( = ?auto_351921 ?auto_351925 ) ) ( not ( = ?auto_351921 ?auto_351926 ) ) ( not ( = ?auto_351921 ?auto_351927 ) ) ( not ( = ?auto_351921 ?auto_351928 ) ) ( not ( = ?auto_351921 ?auto_351929 ) ) ( not ( = ?auto_351921 ?auto_351930 ) ) ( not ( = ?auto_351921 ?auto_351931 ) ) ( not ( = ?auto_351921 ?auto_351932 ) ) ( not ( = ?auto_351921 ?auto_351933 ) ) ( not ( = ?auto_351921 ?auto_351934 ) ) ( not ( = ?auto_351921 ?auto_351935 ) ) ( not ( = ?auto_351922 ?auto_351923 ) ) ( not ( = ?auto_351922 ?auto_351924 ) ) ( not ( = ?auto_351922 ?auto_351925 ) ) ( not ( = ?auto_351922 ?auto_351926 ) ) ( not ( = ?auto_351922 ?auto_351927 ) ) ( not ( = ?auto_351922 ?auto_351928 ) ) ( not ( = ?auto_351922 ?auto_351929 ) ) ( not ( = ?auto_351922 ?auto_351930 ) ) ( not ( = ?auto_351922 ?auto_351931 ) ) ( not ( = ?auto_351922 ?auto_351932 ) ) ( not ( = ?auto_351922 ?auto_351933 ) ) ( not ( = ?auto_351922 ?auto_351934 ) ) ( not ( = ?auto_351922 ?auto_351935 ) ) ( not ( = ?auto_351923 ?auto_351924 ) ) ( not ( = ?auto_351923 ?auto_351925 ) ) ( not ( = ?auto_351923 ?auto_351926 ) ) ( not ( = ?auto_351923 ?auto_351927 ) ) ( not ( = ?auto_351923 ?auto_351928 ) ) ( not ( = ?auto_351923 ?auto_351929 ) ) ( not ( = ?auto_351923 ?auto_351930 ) ) ( not ( = ?auto_351923 ?auto_351931 ) ) ( not ( = ?auto_351923 ?auto_351932 ) ) ( not ( = ?auto_351923 ?auto_351933 ) ) ( not ( = ?auto_351923 ?auto_351934 ) ) ( not ( = ?auto_351923 ?auto_351935 ) ) ( not ( = ?auto_351924 ?auto_351925 ) ) ( not ( = ?auto_351924 ?auto_351926 ) ) ( not ( = ?auto_351924 ?auto_351927 ) ) ( not ( = ?auto_351924 ?auto_351928 ) ) ( not ( = ?auto_351924 ?auto_351929 ) ) ( not ( = ?auto_351924 ?auto_351930 ) ) ( not ( = ?auto_351924 ?auto_351931 ) ) ( not ( = ?auto_351924 ?auto_351932 ) ) ( not ( = ?auto_351924 ?auto_351933 ) ) ( not ( = ?auto_351924 ?auto_351934 ) ) ( not ( = ?auto_351924 ?auto_351935 ) ) ( not ( = ?auto_351925 ?auto_351926 ) ) ( not ( = ?auto_351925 ?auto_351927 ) ) ( not ( = ?auto_351925 ?auto_351928 ) ) ( not ( = ?auto_351925 ?auto_351929 ) ) ( not ( = ?auto_351925 ?auto_351930 ) ) ( not ( = ?auto_351925 ?auto_351931 ) ) ( not ( = ?auto_351925 ?auto_351932 ) ) ( not ( = ?auto_351925 ?auto_351933 ) ) ( not ( = ?auto_351925 ?auto_351934 ) ) ( not ( = ?auto_351925 ?auto_351935 ) ) ( not ( = ?auto_351926 ?auto_351927 ) ) ( not ( = ?auto_351926 ?auto_351928 ) ) ( not ( = ?auto_351926 ?auto_351929 ) ) ( not ( = ?auto_351926 ?auto_351930 ) ) ( not ( = ?auto_351926 ?auto_351931 ) ) ( not ( = ?auto_351926 ?auto_351932 ) ) ( not ( = ?auto_351926 ?auto_351933 ) ) ( not ( = ?auto_351926 ?auto_351934 ) ) ( not ( = ?auto_351926 ?auto_351935 ) ) ( not ( = ?auto_351927 ?auto_351928 ) ) ( not ( = ?auto_351927 ?auto_351929 ) ) ( not ( = ?auto_351927 ?auto_351930 ) ) ( not ( = ?auto_351927 ?auto_351931 ) ) ( not ( = ?auto_351927 ?auto_351932 ) ) ( not ( = ?auto_351927 ?auto_351933 ) ) ( not ( = ?auto_351927 ?auto_351934 ) ) ( not ( = ?auto_351927 ?auto_351935 ) ) ( not ( = ?auto_351928 ?auto_351929 ) ) ( not ( = ?auto_351928 ?auto_351930 ) ) ( not ( = ?auto_351928 ?auto_351931 ) ) ( not ( = ?auto_351928 ?auto_351932 ) ) ( not ( = ?auto_351928 ?auto_351933 ) ) ( not ( = ?auto_351928 ?auto_351934 ) ) ( not ( = ?auto_351928 ?auto_351935 ) ) ( not ( = ?auto_351929 ?auto_351930 ) ) ( not ( = ?auto_351929 ?auto_351931 ) ) ( not ( = ?auto_351929 ?auto_351932 ) ) ( not ( = ?auto_351929 ?auto_351933 ) ) ( not ( = ?auto_351929 ?auto_351934 ) ) ( not ( = ?auto_351929 ?auto_351935 ) ) ( not ( = ?auto_351930 ?auto_351931 ) ) ( not ( = ?auto_351930 ?auto_351932 ) ) ( not ( = ?auto_351930 ?auto_351933 ) ) ( not ( = ?auto_351930 ?auto_351934 ) ) ( not ( = ?auto_351930 ?auto_351935 ) ) ( not ( = ?auto_351931 ?auto_351932 ) ) ( not ( = ?auto_351931 ?auto_351933 ) ) ( not ( = ?auto_351931 ?auto_351934 ) ) ( not ( = ?auto_351931 ?auto_351935 ) ) ( not ( = ?auto_351932 ?auto_351933 ) ) ( not ( = ?auto_351932 ?auto_351934 ) ) ( not ( = ?auto_351932 ?auto_351935 ) ) ( not ( = ?auto_351933 ?auto_351934 ) ) ( not ( = ?auto_351933 ?auto_351935 ) ) ( not ( = ?auto_351934 ?auto_351935 ) ) ( ON ?auto_351933 ?auto_351934 ) ( ON ?auto_351932 ?auto_351933 ) ( ON ?auto_351931 ?auto_351932 ) ( ON ?auto_351930 ?auto_351931 ) ( ON ?auto_351929 ?auto_351930 ) ( ON ?auto_351928 ?auto_351929 ) ( ON ?auto_351927 ?auto_351928 ) ( ON ?auto_351926 ?auto_351927 ) ( ON ?auto_351925 ?auto_351926 ) ( ON ?auto_351924 ?auto_351925 ) ( ON ?auto_351923 ?auto_351924 ) ( CLEAR ?auto_351921 ) ( ON ?auto_351922 ?auto_351923 ) ( CLEAR ?auto_351922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_351921 ?auto_351922 )
      ( MAKE-14PILE ?auto_351921 ?auto_351922 ?auto_351923 ?auto_351924 ?auto_351925 ?auto_351926 ?auto_351927 ?auto_351928 ?auto_351929 ?auto_351930 ?auto_351931 ?auto_351932 ?auto_351933 ?auto_351934 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351950 - BLOCK
      ?auto_351951 - BLOCK
      ?auto_351952 - BLOCK
      ?auto_351953 - BLOCK
      ?auto_351954 - BLOCK
      ?auto_351955 - BLOCK
      ?auto_351956 - BLOCK
      ?auto_351957 - BLOCK
      ?auto_351958 - BLOCK
      ?auto_351959 - BLOCK
      ?auto_351960 - BLOCK
      ?auto_351961 - BLOCK
      ?auto_351962 - BLOCK
      ?auto_351963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_351963 ) ( ON-TABLE ?auto_351950 ) ( not ( = ?auto_351950 ?auto_351951 ) ) ( not ( = ?auto_351950 ?auto_351952 ) ) ( not ( = ?auto_351950 ?auto_351953 ) ) ( not ( = ?auto_351950 ?auto_351954 ) ) ( not ( = ?auto_351950 ?auto_351955 ) ) ( not ( = ?auto_351950 ?auto_351956 ) ) ( not ( = ?auto_351950 ?auto_351957 ) ) ( not ( = ?auto_351950 ?auto_351958 ) ) ( not ( = ?auto_351950 ?auto_351959 ) ) ( not ( = ?auto_351950 ?auto_351960 ) ) ( not ( = ?auto_351950 ?auto_351961 ) ) ( not ( = ?auto_351950 ?auto_351962 ) ) ( not ( = ?auto_351950 ?auto_351963 ) ) ( not ( = ?auto_351951 ?auto_351952 ) ) ( not ( = ?auto_351951 ?auto_351953 ) ) ( not ( = ?auto_351951 ?auto_351954 ) ) ( not ( = ?auto_351951 ?auto_351955 ) ) ( not ( = ?auto_351951 ?auto_351956 ) ) ( not ( = ?auto_351951 ?auto_351957 ) ) ( not ( = ?auto_351951 ?auto_351958 ) ) ( not ( = ?auto_351951 ?auto_351959 ) ) ( not ( = ?auto_351951 ?auto_351960 ) ) ( not ( = ?auto_351951 ?auto_351961 ) ) ( not ( = ?auto_351951 ?auto_351962 ) ) ( not ( = ?auto_351951 ?auto_351963 ) ) ( not ( = ?auto_351952 ?auto_351953 ) ) ( not ( = ?auto_351952 ?auto_351954 ) ) ( not ( = ?auto_351952 ?auto_351955 ) ) ( not ( = ?auto_351952 ?auto_351956 ) ) ( not ( = ?auto_351952 ?auto_351957 ) ) ( not ( = ?auto_351952 ?auto_351958 ) ) ( not ( = ?auto_351952 ?auto_351959 ) ) ( not ( = ?auto_351952 ?auto_351960 ) ) ( not ( = ?auto_351952 ?auto_351961 ) ) ( not ( = ?auto_351952 ?auto_351962 ) ) ( not ( = ?auto_351952 ?auto_351963 ) ) ( not ( = ?auto_351953 ?auto_351954 ) ) ( not ( = ?auto_351953 ?auto_351955 ) ) ( not ( = ?auto_351953 ?auto_351956 ) ) ( not ( = ?auto_351953 ?auto_351957 ) ) ( not ( = ?auto_351953 ?auto_351958 ) ) ( not ( = ?auto_351953 ?auto_351959 ) ) ( not ( = ?auto_351953 ?auto_351960 ) ) ( not ( = ?auto_351953 ?auto_351961 ) ) ( not ( = ?auto_351953 ?auto_351962 ) ) ( not ( = ?auto_351953 ?auto_351963 ) ) ( not ( = ?auto_351954 ?auto_351955 ) ) ( not ( = ?auto_351954 ?auto_351956 ) ) ( not ( = ?auto_351954 ?auto_351957 ) ) ( not ( = ?auto_351954 ?auto_351958 ) ) ( not ( = ?auto_351954 ?auto_351959 ) ) ( not ( = ?auto_351954 ?auto_351960 ) ) ( not ( = ?auto_351954 ?auto_351961 ) ) ( not ( = ?auto_351954 ?auto_351962 ) ) ( not ( = ?auto_351954 ?auto_351963 ) ) ( not ( = ?auto_351955 ?auto_351956 ) ) ( not ( = ?auto_351955 ?auto_351957 ) ) ( not ( = ?auto_351955 ?auto_351958 ) ) ( not ( = ?auto_351955 ?auto_351959 ) ) ( not ( = ?auto_351955 ?auto_351960 ) ) ( not ( = ?auto_351955 ?auto_351961 ) ) ( not ( = ?auto_351955 ?auto_351962 ) ) ( not ( = ?auto_351955 ?auto_351963 ) ) ( not ( = ?auto_351956 ?auto_351957 ) ) ( not ( = ?auto_351956 ?auto_351958 ) ) ( not ( = ?auto_351956 ?auto_351959 ) ) ( not ( = ?auto_351956 ?auto_351960 ) ) ( not ( = ?auto_351956 ?auto_351961 ) ) ( not ( = ?auto_351956 ?auto_351962 ) ) ( not ( = ?auto_351956 ?auto_351963 ) ) ( not ( = ?auto_351957 ?auto_351958 ) ) ( not ( = ?auto_351957 ?auto_351959 ) ) ( not ( = ?auto_351957 ?auto_351960 ) ) ( not ( = ?auto_351957 ?auto_351961 ) ) ( not ( = ?auto_351957 ?auto_351962 ) ) ( not ( = ?auto_351957 ?auto_351963 ) ) ( not ( = ?auto_351958 ?auto_351959 ) ) ( not ( = ?auto_351958 ?auto_351960 ) ) ( not ( = ?auto_351958 ?auto_351961 ) ) ( not ( = ?auto_351958 ?auto_351962 ) ) ( not ( = ?auto_351958 ?auto_351963 ) ) ( not ( = ?auto_351959 ?auto_351960 ) ) ( not ( = ?auto_351959 ?auto_351961 ) ) ( not ( = ?auto_351959 ?auto_351962 ) ) ( not ( = ?auto_351959 ?auto_351963 ) ) ( not ( = ?auto_351960 ?auto_351961 ) ) ( not ( = ?auto_351960 ?auto_351962 ) ) ( not ( = ?auto_351960 ?auto_351963 ) ) ( not ( = ?auto_351961 ?auto_351962 ) ) ( not ( = ?auto_351961 ?auto_351963 ) ) ( not ( = ?auto_351962 ?auto_351963 ) ) ( ON ?auto_351962 ?auto_351963 ) ( ON ?auto_351961 ?auto_351962 ) ( ON ?auto_351960 ?auto_351961 ) ( ON ?auto_351959 ?auto_351960 ) ( ON ?auto_351958 ?auto_351959 ) ( ON ?auto_351957 ?auto_351958 ) ( ON ?auto_351956 ?auto_351957 ) ( ON ?auto_351955 ?auto_351956 ) ( ON ?auto_351954 ?auto_351955 ) ( ON ?auto_351953 ?auto_351954 ) ( ON ?auto_351952 ?auto_351953 ) ( CLEAR ?auto_351950 ) ( ON ?auto_351951 ?auto_351952 ) ( CLEAR ?auto_351951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_351950 ?auto_351951 )
      ( MAKE-14PILE ?auto_351950 ?auto_351951 ?auto_351952 ?auto_351953 ?auto_351954 ?auto_351955 ?auto_351956 ?auto_351957 ?auto_351958 ?auto_351959 ?auto_351960 ?auto_351961 ?auto_351962 ?auto_351963 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_351978 - BLOCK
      ?auto_351979 - BLOCK
      ?auto_351980 - BLOCK
      ?auto_351981 - BLOCK
      ?auto_351982 - BLOCK
      ?auto_351983 - BLOCK
      ?auto_351984 - BLOCK
      ?auto_351985 - BLOCK
      ?auto_351986 - BLOCK
      ?auto_351987 - BLOCK
      ?auto_351988 - BLOCK
      ?auto_351989 - BLOCK
      ?auto_351990 - BLOCK
      ?auto_351991 - BLOCK
    )
    :vars
    (
      ?auto_351992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_351991 ?auto_351992 ) ( not ( = ?auto_351978 ?auto_351979 ) ) ( not ( = ?auto_351978 ?auto_351980 ) ) ( not ( = ?auto_351978 ?auto_351981 ) ) ( not ( = ?auto_351978 ?auto_351982 ) ) ( not ( = ?auto_351978 ?auto_351983 ) ) ( not ( = ?auto_351978 ?auto_351984 ) ) ( not ( = ?auto_351978 ?auto_351985 ) ) ( not ( = ?auto_351978 ?auto_351986 ) ) ( not ( = ?auto_351978 ?auto_351987 ) ) ( not ( = ?auto_351978 ?auto_351988 ) ) ( not ( = ?auto_351978 ?auto_351989 ) ) ( not ( = ?auto_351978 ?auto_351990 ) ) ( not ( = ?auto_351978 ?auto_351991 ) ) ( not ( = ?auto_351978 ?auto_351992 ) ) ( not ( = ?auto_351979 ?auto_351980 ) ) ( not ( = ?auto_351979 ?auto_351981 ) ) ( not ( = ?auto_351979 ?auto_351982 ) ) ( not ( = ?auto_351979 ?auto_351983 ) ) ( not ( = ?auto_351979 ?auto_351984 ) ) ( not ( = ?auto_351979 ?auto_351985 ) ) ( not ( = ?auto_351979 ?auto_351986 ) ) ( not ( = ?auto_351979 ?auto_351987 ) ) ( not ( = ?auto_351979 ?auto_351988 ) ) ( not ( = ?auto_351979 ?auto_351989 ) ) ( not ( = ?auto_351979 ?auto_351990 ) ) ( not ( = ?auto_351979 ?auto_351991 ) ) ( not ( = ?auto_351979 ?auto_351992 ) ) ( not ( = ?auto_351980 ?auto_351981 ) ) ( not ( = ?auto_351980 ?auto_351982 ) ) ( not ( = ?auto_351980 ?auto_351983 ) ) ( not ( = ?auto_351980 ?auto_351984 ) ) ( not ( = ?auto_351980 ?auto_351985 ) ) ( not ( = ?auto_351980 ?auto_351986 ) ) ( not ( = ?auto_351980 ?auto_351987 ) ) ( not ( = ?auto_351980 ?auto_351988 ) ) ( not ( = ?auto_351980 ?auto_351989 ) ) ( not ( = ?auto_351980 ?auto_351990 ) ) ( not ( = ?auto_351980 ?auto_351991 ) ) ( not ( = ?auto_351980 ?auto_351992 ) ) ( not ( = ?auto_351981 ?auto_351982 ) ) ( not ( = ?auto_351981 ?auto_351983 ) ) ( not ( = ?auto_351981 ?auto_351984 ) ) ( not ( = ?auto_351981 ?auto_351985 ) ) ( not ( = ?auto_351981 ?auto_351986 ) ) ( not ( = ?auto_351981 ?auto_351987 ) ) ( not ( = ?auto_351981 ?auto_351988 ) ) ( not ( = ?auto_351981 ?auto_351989 ) ) ( not ( = ?auto_351981 ?auto_351990 ) ) ( not ( = ?auto_351981 ?auto_351991 ) ) ( not ( = ?auto_351981 ?auto_351992 ) ) ( not ( = ?auto_351982 ?auto_351983 ) ) ( not ( = ?auto_351982 ?auto_351984 ) ) ( not ( = ?auto_351982 ?auto_351985 ) ) ( not ( = ?auto_351982 ?auto_351986 ) ) ( not ( = ?auto_351982 ?auto_351987 ) ) ( not ( = ?auto_351982 ?auto_351988 ) ) ( not ( = ?auto_351982 ?auto_351989 ) ) ( not ( = ?auto_351982 ?auto_351990 ) ) ( not ( = ?auto_351982 ?auto_351991 ) ) ( not ( = ?auto_351982 ?auto_351992 ) ) ( not ( = ?auto_351983 ?auto_351984 ) ) ( not ( = ?auto_351983 ?auto_351985 ) ) ( not ( = ?auto_351983 ?auto_351986 ) ) ( not ( = ?auto_351983 ?auto_351987 ) ) ( not ( = ?auto_351983 ?auto_351988 ) ) ( not ( = ?auto_351983 ?auto_351989 ) ) ( not ( = ?auto_351983 ?auto_351990 ) ) ( not ( = ?auto_351983 ?auto_351991 ) ) ( not ( = ?auto_351983 ?auto_351992 ) ) ( not ( = ?auto_351984 ?auto_351985 ) ) ( not ( = ?auto_351984 ?auto_351986 ) ) ( not ( = ?auto_351984 ?auto_351987 ) ) ( not ( = ?auto_351984 ?auto_351988 ) ) ( not ( = ?auto_351984 ?auto_351989 ) ) ( not ( = ?auto_351984 ?auto_351990 ) ) ( not ( = ?auto_351984 ?auto_351991 ) ) ( not ( = ?auto_351984 ?auto_351992 ) ) ( not ( = ?auto_351985 ?auto_351986 ) ) ( not ( = ?auto_351985 ?auto_351987 ) ) ( not ( = ?auto_351985 ?auto_351988 ) ) ( not ( = ?auto_351985 ?auto_351989 ) ) ( not ( = ?auto_351985 ?auto_351990 ) ) ( not ( = ?auto_351985 ?auto_351991 ) ) ( not ( = ?auto_351985 ?auto_351992 ) ) ( not ( = ?auto_351986 ?auto_351987 ) ) ( not ( = ?auto_351986 ?auto_351988 ) ) ( not ( = ?auto_351986 ?auto_351989 ) ) ( not ( = ?auto_351986 ?auto_351990 ) ) ( not ( = ?auto_351986 ?auto_351991 ) ) ( not ( = ?auto_351986 ?auto_351992 ) ) ( not ( = ?auto_351987 ?auto_351988 ) ) ( not ( = ?auto_351987 ?auto_351989 ) ) ( not ( = ?auto_351987 ?auto_351990 ) ) ( not ( = ?auto_351987 ?auto_351991 ) ) ( not ( = ?auto_351987 ?auto_351992 ) ) ( not ( = ?auto_351988 ?auto_351989 ) ) ( not ( = ?auto_351988 ?auto_351990 ) ) ( not ( = ?auto_351988 ?auto_351991 ) ) ( not ( = ?auto_351988 ?auto_351992 ) ) ( not ( = ?auto_351989 ?auto_351990 ) ) ( not ( = ?auto_351989 ?auto_351991 ) ) ( not ( = ?auto_351989 ?auto_351992 ) ) ( not ( = ?auto_351990 ?auto_351991 ) ) ( not ( = ?auto_351990 ?auto_351992 ) ) ( not ( = ?auto_351991 ?auto_351992 ) ) ( ON ?auto_351990 ?auto_351991 ) ( ON ?auto_351989 ?auto_351990 ) ( ON ?auto_351988 ?auto_351989 ) ( ON ?auto_351987 ?auto_351988 ) ( ON ?auto_351986 ?auto_351987 ) ( ON ?auto_351985 ?auto_351986 ) ( ON ?auto_351984 ?auto_351985 ) ( ON ?auto_351983 ?auto_351984 ) ( ON ?auto_351982 ?auto_351983 ) ( ON ?auto_351981 ?auto_351982 ) ( ON ?auto_351980 ?auto_351981 ) ( ON ?auto_351979 ?auto_351980 ) ( ON ?auto_351978 ?auto_351979 ) ( CLEAR ?auto_351978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_351978 )
      ( MAKE-14PILE ?auto_351978 ?auto_351979 ?auto_351980 ?auto_351981 ?auto_351982 ?auto_351983 ?auto_351984 ?auto_351985 ?auto_351986 ?auto_351987 ?auto_351988 ?auto_351989 ?auto_351990 ?auto_351991 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_352007 - BLOCK
      ?auto_352008 - BLOCK
      ?auto_352009 - BLOCK
      ?auto_352010 - BLOCK
      ?auto_352011 - BLOCK
      ?auto_352012 - BLOCK
      ?auto_352013 - BLOCK
      ?auto_352014 - BLOCK
      ?auto_352015 - BLOCK
      ?auto_352016 - BLOCK
      ?auto_352017 - BLOCK
      ?auto_352018 - BLOCK
      ?auto_352019 - BLOCK
      ?auto_352020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_352020 ) ( not ( = ?auto_352007 ?auto_352008 ) ) ( not ( = ?auto_352007 ?auto_352009 ) ) ( not ( = ?auto_352007 ?auto_352010 ) ) ( not ( = ?auto_352007 ?auto_352011 ) ) ( not ( = ?auto_352007 ?auto_352012 ) ) ( not ( = ?auto_352007 ?auto_352013 ) ) ( not ( = ?auto_352007 ?auto_352014 ) ) ( not ( = ?auto_352007 ?auto_352015 ) ) ( not ( = ?auto_352007 ?auto_352016 ) ) ( not ( = ?auto_352007 ?auto_352017 ) ) ( not ( = ?auto_352007 ?auto_352018 ) ) ( not ( = ?auto_352007 ?auto_352019 ) ) ( not ( = ?auto_352007 ?auto_352020 ) ) ( not ( = ?auto_352008 ?auto_352009 ) ) ( not ( = ?auto_352008 ?auto_352010 ) ) ( not ( = ?auto_352008 ?auto_352011 ) ) ( not ( = ?auto_352008 ?auto_352012 ) ) ( not ( = ?auto_352008 ?auto_352013 ) ) ( not ( = ?auto_352008 ?auto_352014 ) ) ( not ( = ?auto_352008 ?auto_352015 ) ) ( not ( = ?auto_352008 ?auto_352016 ) ) ( not ( = ?auto_352008 ?auto_352017 ) ) ( not ( = ?auto_352008 ?auto_352018 ) ) ( not ( = ?auto_352008 ?auto_352019 ) ) ( not ( = ?auto_352008 ?auto_352020 ) ) ( not ( = ?auto_352009 ?auto_352010 ) ) ( not ( = ?auto_352009 ?auto_352011 ) ) ( not ( = ?auto_352009 ?auto_352012 ) ) ( not ( = ?auto_352009 ?auto_352013 ) ) ( not ( = ?auto_352009 ?auto_352014 ) ) ( not ( = ?auto_352009 ?auto_352015 ) ) ( not ( = ?auto_352009 ?auto_352016 ) ) ( not ( = ?auto_352009 ?auto_352017 ) ) ( not ( = ?auto_352009 ?auto_352018 ) ) ( not ( = ?auto_352009 ?auto_352019 ) ) ( not ( = ?auto_352009 ?auto_352020 ) ) ( not ( = ?auto_352010 ?auto_352011 ) ) ( not ( = ?auto_352010 ?auto_352012 ) ) ( not ( = ?auto_352010 ?auto_352013 ) ) ( not ( = ?auto_352010 ?auto_352014 ) ) ( not ( = ?auto_352010 ?auto_352015 ) ) ( not ( = ?auto_352010 ?auto_352016 ) ) ( not ( = ?auto_352010 ?auto_352017 ) ) ( not ( = ?auto_352010 ?auto_352018 ) ) ( not ( = ?auto_352010 ?auto_352019 ) ) ( not ( = ?auto_352010 ?auto_352020 ) ) ( not ( = ?auto_352011 ?auto_352012 ) ) ( not ( = ?auto_352011 ?auto_352013 ) ) ( not ( = ?auto_352011 ?auto_352014 ) ) ( not ( = ?auto_352011 ?auto_352015 ) ) ( not ( = ?auto_352011 ?auto_352016 ) ) ( not ( = ?auto_352011 ?auto_352017 ) ) ( not ( = ?auto_352011 ?auto_352018 ) ) ( not ( = ?auto_352011 ?auto_352019 ) ) ( not ( = ?auto_352011 ?auto_352020 ) ) ( not ( = ?auto_352012 ?auto_352013 ) ) ( not ( = ?auto_352012 ?auto_352014 ) ) ( not ( = ?auto_352012 ?auto_352015 ) ) ( not ( = ?auto_352012 ?auto_352016 ) ) ( not ( = ?auto_352012 ?auto_352017 ) ) ( not ( = ?auto_352012 ?auto_352018 ) ) ( not ( = ?auto_352012 ?auto_352019 ) ) ( not ( = ?auto_352012 ?auto_352020 ) ) ( not ( = ?auto_352013 ?auto_352014 ) ) ( not ( = ?auto_352013 ?auto_352015 ) ) ( not ( = ?auto_352013 ?auto_352016 ) ) ( not ( = ?auto_352013 ?auto_352017 ) ) ( not ( = ?auto_352013 ?auto_352018 ) ) ( not ( = ?auto_352013 ?auto_352019 ) ) ( not ( = ?auto_352013 ?auto_352020 ) ) ( not ( = ?auto_352014 ?auto_352015 ) ) ( not ( = ?auto_352014 ?auto_352016 ) ) ( not ( = ?auto_352014 ?auto_352017 ) ) ( not ( = ?auto_352014 ?auto_352018 ) ) ( not ( = ?auto_352014 ?auto_352019 ) ) ( not ( = ?auto_352014 ?auto_352020 ) ) ( not ( = ?auto_352015 ?auto_352016 ) ) ( not ( = ?auto_352015 ?auto_352017 ) ) ( not ( = ?auto_352015 ?auto_352018 ) ) ( not ( = ?auto_352015 ?auto_352019 ) ) ( not ( = ?auto_352015 ?auto_352020 ) ) ( not ( = ?auto_352016 ?auto_352017 ) ) ( not ( = ?auto_352016 ?auto_352018 ) ) ( not ( = ?auto_352016 ?auto_352019 ) ) ( not ( = ?auto_352016 ?auto_352020 ) ) ( not ( = ?auto_352017 ?auto_352018 ) ) ( not ( = ?auto_352017 ?auto_352019 ) ) ( not ( = ?auto_352017 ?auto_352020 ) ) ( not ( = ?auto_352018 ?auto_352019 ) ) ( not ( = ?auto_352018 ?auto_352020 ) ) ( not ( = ?auto_352019 ?auto_352020 ) ) ( ON ?auto_352019 ?auto_352020 ) ( ON ?auto_352018 ?auto_352019 ) ( ON ?auto_352017 ?auto_352018 ) ( ON ?auto_352016 ?auto_352017 ) ( ON ?auto_352015 ?auto_352016 ) ( ON ?auto_352014 ?auto_352015 ) ( ON ?auto_352013 ?auto_352014 ) ( ON ?auto_352012 ?auto_352013 ) ( ON ?auto_352011 ?auto_352012 ) ( ON ?auto_352010 ?auto_352011 ) ( ON ?auto_352009 ?auto_352010 ) ( ON ?auto_352008 ?auto_352009 ) ( ON ?auto_352007 ?auto_352008 ) ( CLEAR ?auto_352007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_352007 )
      ( MAKE-14PILE ?auto_352007 ?auto_352008 ?auto_352009 ?auto_352010 ?auto_352011 ?auto_352012 ?auto_352013 ?auto_352014 ?auto_352015 ?auto_352016 ?auto_352017 ?auto_352018 ?auto_352019 ?auto_352020 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_352035 - BLOCK
      ?auto_352036 - BLOCK
      ?auto_352037 - BLOCK
      ?auto_352038 - BLOCK
      ?auto_352039 - BLOCK
      ?auto_352040 - BLOCK
      ?auto_352041 - BLOCK
      ?auto_352042 - BLOCK
      ?auto_352043 - BLOCK
      ?auto_352044 - BLOCK
      ?auto_352045 - BLOCK
      ?auto_352046 - BLOCK
      ?auto_352047 - BLOCK
      ?auto_352048 - BLOCK
    )
    :vars
    (
      ?auto_352049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_352035 ?auto_352036 ) ) ( not ( = ?auto_352035 ?auto_352037 ) ) ( not ( = ?auto_352035 ?auto_352038 ) ) ( not ( = ?auto_352035 ?auto_352039 ) ) ( not ( = ?auto_352035 ?auto_352040 ) ) ( not ( = ?auto_352035 ?auto_352041 ) ) ( not ( = ?auto_352035 ?auto_352042 ) ) ( not ( = ?auto_352035 ?auto_352043 ) ) ( not ( = ?auto_352035 ?auto_352044 ) ) ( not ( = ?auto_352035 ?auto_352045 ) ) ( not ( = ?auto_352035 ?auto_352046 ) ) ( not ( = ?auto_352035 ?auto_352047 ) ) ( not ( = ?auto_352035 ?auto_352048 ) ) ( not ( = ?auto_352036 ?auto_352037 ) ) ( not ( = ?auto_352036 ?auto_352038 ) ) ( not ( = ?auto_352036 ?auto_352039 ) ) ( not ( = ?auto_352036 ?auto_352040 ) ) ( not ( = ?auto_352036 ?auto_352041 ) ) ( not ( = ?auto_352036 ?auto_352042 ) ) ( not ( = ?auto_352036 ?auto_352043 ) ) ( not ( = ?auto_352036 ?auto_352044 ) ) ( not ( = ?auto_352036 ?auto_352045 ) ) ( not ( = ?auto_352036 ?auto_352046 ) ) ( not ( = ?auto_352036 ?auto_352047 ) ) ( not ( = ?auto_352036 ?auto_352048 ) ) ( not ( = ?auto_352037 ?auto_352038 ) ) ( not ( = ?auto_352037 ?auto_352039 ) ) ( not ( = ?auto_352037 ?auto_352040 ) ) ( not ( = ?auto_352037 ?auto_352041 ) ) ( not ( = ?auto_352037 ?auto_352042 ) ) ( not ( = ?auto_352037 ?auto_352043 ) ) ( not ( = ?auto_352037 ?auto_352044 ) ) ( not ( = ?auto_352037 ?auto_352045 ) ) ( not ( = ?auto_352037 ?auto_352046 ) ) ( not ( = ?auto_352037 ?auto_352047 ) ) ( not ( = ?auto_352037 ?auto_352048 ) ) ( not ( = ?auto_352038 ?auto_352039 ) ) ( not ( = ?auto_352038 ?auto_352040 ) ) ( not ( = ?auto_352038 ?auto_352041 ) ) ( not ( = ?auto_352038 ?auto_352042 ) ) ( not ( = ?auto_352038 ?auto_352043 ) ) ( not ( = ?auto_352038 ?auto_352044 ) ) ( not ( = ?auto_352038 ?auto_352045 ) ) ( not ( = ?auto_352038 ?auto_352046 ) ) ( not ( = ?auto_352038 ?auto_352047 ) ) ( not ( = ?auto_352038 ?auto_352048 ) ) ( not ( = ?auto_352039 ?auto_352040 ) ) ( not ( = ?auto_352039 ?auto_352041 ) ) ( not ( = ?auto_352039 ?auto_352042 ) ) ( not ( = ?auto_352039 ?auto_352043 ) ) ( not ( = ?auto_352039 ?auto_352044 ) ) ( not ( = ?auto_352039 ?auto_352045 ) ) ( not ( = ?auto_352039 ?auto_352046 ) ) ( not ( = ?auto_352039 ?auto_352047 ) ) ( not ( = ?auto_352039 ?auto_352048 ) ) ( not ( = ?auto_352040 ?auto_352041 ) ) ( not ( = ?auto_352040 ?auto_352042 ) ) ( not ( = ?auto_352040 ?auto_352043 ) ) ( not ( = ?auto_352040 ?auto_352044 ) ) ( not ( = ?auto_352040 ?auto_352045 ) ) ( not ( = ?auto_352040 ?auto_352046 ) ) ( not ( = ?auto_352040 ?auto_352047 ) ) ( not ( = ?auto_352040 ?auto_352048 ) ) ( not ( = ?auto_352041 ?auto_352042 ) ) ( not ( = ?auto_352041 ?auto_352043 ) ) ( not ( = ?auto_352041 ?auto_352044 ) ) ( not ( = ?auto_352041 ?auto_352045 ) ) ( not ( = ?auto_352041 ?auto_352046 ) ) ( not ( = ?auto_352041 ?auto_352047 ) ) ( not ( = ?auto_352041 ?auto_352048 ) ) ( not ( = ?auto_352042 ?auto_352043 ) ) ( not ( = ?auto_352042 ?auto_352044 ) ) ( not ( = ?auto_352042 ?auto_352045 ) ) ( not ( = ?auto_352042 ?auto_352046 ) ) ( not ( = ?auto_352042 ?auto_352047 ) ) ( not ( = ?auto_352042 ?auto_352048 ) ) ( not ( = ?auto_352043 ?auto_352044 ) ) ( not ( = ?auto_352043 ?auto_352045 ) ) ( not ( = ?auto_352043 ?auto_352046 ) ) ( not ( = ?auto_352043 ?auto_352047 ) ) ( not ( = ?auto_352043 ?auto_352048 ) ) ( not ( = ?auto_352044 ?auto_352045 ) ) ( not ( = ?auto_352044 ?auto_352046 ) ) ( not ( = ?auto_352044 ?auto_352047 ) ) ( not ( = ?auto_352044 ?auto_352048 ) ) ( not ( = ?auto_352045 ?auto_352046 ) ) ( not ( = ?auto_352045 ?auto_352047 ) ) ( not ( = ?auto_352045 ?auto_352048 ) ) ( not ( = ?auto_352046 ?auto_352047 ) ) ( not ( = ?auto_352046 ?auto_352048 ) ) ( not ( = ?auto_352047 ?auto_352048 ) ) ( ON ?auto_352035 ?auto_352049 ) ( not ( = ?auto_352048 ?auto_352049 ) ) ( not ( = ?auto_352047 ?auto_352049 ) ) ( not ( = ?auto_352046 ?auto_352049 ) ) ( not ( = ?auto_352045 ?auto_352049 ) ) ( not ( = ?auto_352044 ?auto_352049 ) ) ( not ( = ?auto_352043 ?auto_352049 ) ) ( not ( = ?auto_352042 ?auto_352049 ) ) ( not ( = ?auto_352041 ?auto_352049 ) ) ( not ( = ?auto_352040 ?auto_352049 ) ) ( not ( = ?auto_352039 ?auto_352049 ) ) ( not ( = ?auto_352038 ?auto_352049 ) ) ( not ( = ?auto_352037 ?auto_352049 ) ) ( not ( = ?auto_352036 ?auto_352049 ) ) ( not ( = ?auto_352035 ?auto_352049 ) ) ( ON ?auto_352036 ?auto_352035 ) ( ON ?auto_352037 ?auto_352036 ) ( ON ?auto_352038 ?auto_352037 ) ( ON ?auto_352039 ?auto_352038 ) ( ON ?auto_352040 ?auto_352039 ) ( ON ?auto_352041 ?auto_352040 ) ( ON ?auto_352042 ?auto_352041 ) ( ON ?auto_352043 ?auto_352042 ) ( ON ?auto_352044 ?auto_352043 ) ( ON ?auto_352045 ?auto_352044 ) ( ON ?auto_352046 ?auto_352045 ) ( ON ?auto_352047 ?auto_352046 ) ( ON ?auto_352048 ?auto_352047 ) ( CLEAR ?auto_352048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_352048 ?auto_352047 ?auto_352046 ?auto_352045 ?auto_352044 ?auto_352043 ?auto_352042 ?auto_352041 ?auto_352040 ?auto_352039 ?auto_352038 ?auto_352037 ?auto_352036 ?auto_352035 )
      ( MAKE-14PILE ?auto_352035 ?auto_352036 ?auto_352037 ?auto_352038 ?auto_352039 ?auto_352040 ?auto_352041 ?auto_352042 ?auto_352043 ?auto_352044 ?auto_352045 ?auto_352046 ?auto_352047 ?auto_352048 ) )
  )

)

