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
      ?auto_783666 - BLOCK
    )
    :vars
    (
      ?auto_783667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783666 ?auto_783667 ) ( CLEAR ?auto_783666 ) ( HAND-EMPTY ) ( not ( = ?auto_783666 ?auto_783667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_783666 ?auto_783667 )
      ( !PUTDOWN ?auto_783666 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_783673 - BLOCK
      ?auto_783674 - BLOCK
    )
    :vars
    (
      ?auto_783675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_783673 ) ( ON ?auto_783674 ?auto_783675 ) ( CLEAR ?auto_783674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_783673 ) ( not ( = ?auto_783673 ?auto_783674 ) ) ( not ( = ?auto_783673 ?auto_783675 ) ) ( not ( = ?auto_783674 ?auto_783675 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_783674 ?auto_783675 )
      ( !STACK ?auto_783674 ?auto_783673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_783683 - BLOCK
      ?auto_783684 - BLOCK
    )
    :vars
    (
      ?auto_783685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783684 ?auto_783685 ) ( not ( = ?auto_783683 ?auto_783684 ) ) ( not ( = ?auto_783683 ?auto_783685 ) ) ( not ( = ?auto_783684 ?auto_783685 ) ) ( ON ?auto_783683 ?auto_783684 ) ( CLEAR ?auto_783683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_783683 )
      ( MAKE-2PILE ?auto_783683 ?auto_783684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_783694 - BLOCK
      ?auto_783695 - BLOCK
      ?auto_783696 - BLOCK
    )
    :vars
    (
      ?auto_783697 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_783695 ) ( ON ?auto_783696 ?auto_783697 ) ( CLEAR ?auto_783696 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_783694 ) ( ON ?auto_783695 ?auto_783694 ) ( not ( = ?auto_783694 ?auto_783695 ) ) ( not ( = ?auto_783694 ?auto_783696 ) ) ( not ( = ?auto_783694 ?auto_783697 ) ) ( not ( = ?auto_783695 ?auto_783696 ) ) ( not ( = ?auto_783695 ?auto_783697 ) ) ( not ( = ?auto_783696 ?auto_783697 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_783696 ?auto_783697 )
      ( !STACK ?auto_783696 ?auto_783695 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_783708 - BLOCK
      ?auto_783709 - BLOCK
      ?auto_783710 - BLOCK
    )
    :vars
    (
      ?auto_783711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783710 ?auto_783711 ) ( ON-TABLE ?auto_783708 ) ( not ( = ?auto_783708 ?auto_783709 ) ) ( not ( = ?auto_783708 ?auto_783710 ) ) ( not ( = ?auto_783708 ?auto_783711 ) ) ( not ( = ?auto_783709 ?auto_783710 ) ) ( not ( = ?auto_783709 ?auto_783711 ) ) ( not ( = ?auto_783710 ?auto_783711 ) ) ( CLEAR ?auto_783708 ) ( ON ?auto_783709 ?auto_783710 ) ( CLEAR ?auto_783709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_783708 ?auto_783709 )
      ( MAKE-3PILE ?auto_783708 ?auto_783709 ?auto_783710 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_783722 - BLOCK
      ?auto_783723 - BLOCK
      ?auto_783724 - BLOCK
    )
    :vars
    (
      ?auto_783725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783724 ?auto_783725 ) ( not ( = ?auto_783722 ?auto_783723 ) ) ( not ( = ?auto_783722 ?auto_783724 ) ) ( not ( = ?auto_783722 ?auto_783725 ) ) ( not ( = ?auto_783723 ?auto_783724 ) ) ( not ( = ?auto_783723 ?auto_783725 ) ) ( not ( = ?auto_783724 ?auto_783725 ) ) ( ON ?auto_783723 ?auto_783724 ) ( ON ?auto_783722 ?auto_783723 ) ( CLEAR ?auto_783722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_783722 )
      ( MAKE-3PILE ?auto_783722 ?auto_783723 ?auto_783724 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_783737 - BLOCK
      ?auto_783738 - BLOCK
      ?auto_783739 - BLOCK
      ?auto_783740 - BLOCK
    )
    :vars
    (
      ?auto_783741 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_783739 ) ( ON ?auto_783740 ?auto_783741 ) ( CLEAR ?auto_783740 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_783737 ) ( ON ?auto_783738 ?auto_783737 ) ( ON ?auto_783739 ?auto_783738 ) ( not ( = ?auto_783737 ?auto_783738 ) ) ( not ( = ?auto_783737 ?auto_783739 ) ) ( not ( = ?auto_783737 ?auto_783740 ) ) ( not ( = ?auto_783737 ?auto_783741 ) ) ( not ( = ?auto_783738 ?auto_783739 ) ) ( not ( = ?auto_783738 ?auto_783740 ) ) ( not ( = ?auto_783738 ?auto_783741 ) ) ( not ( = ?auto_783739 ?auto_783740 ) ) ( not ( = ?auto_783739 ?auto_783741 ) ) ( not ( = ?auto_783740 ?auto_783741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_783740 ?auto_783741 )
      ( !STACK ?auto_783740 ?auto_783739 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_783755 - BLOCK
      ?auto_783756 - BLOCK
      ?auto_783757 - BLOCK
      ?auto_783758 - BLOCK
    )
    :vars
    (
      ?auto_783759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783758 ?auto_783759 ) ( ON-TABLE ?auto_783755 ) ( ON ?auto_783756 ?auto_783755 ) ( not ( = ?auto_783755 ?auto_783756 ) ) ( not ( = ?auto_783755 ?auto_783757 ) ) ( not ( = ?auto_783755 ?auto_783758 ) ) ( not ( = ?auto_783755 ?auto_783759 ) ) ( not ( = ?auto_783756 ?auto_783757 ) ) ( not ( = ?auto_783756 ?auto_783758 ) ) ( not ( = ?auto_783756 ?auto_783759 ) ) ( not ( = ?auto_783757 ?auto_783758 ) ) ( not ( = ?auto_783757 ?auto_783759 ) ) ( not ( = ?auto_783758 ?auto_783759 ) ) ( CLEAR ?auto_783756 ) ( ON ?auto_783757 ?auto_783758 ) ( CLEAR ?auto_783757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_783755 ?auto_783756 ?auto_783757 )
      ( MAKE-4PILE ?auto_783755 ?auto_783756 ?auto_783757 ?auto_783758 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_783773 - BLOCK
      ?auto_783774 - BLOCK
      ?auto_783775 - BLOCK
      ?auto_783776 - BLOCK
    )
    :vars
    (
      ?auto_783777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783776 ?auto_783777 ) ( ON-TABLE ?auto_783773 ) ( not ( = ?auto_783773 ?auto_783774 ) ) ( not ( = ?auto_783773 ?auto_783775 ) ) ( not ( = ?auto_783773 ?auto_783776 ) ) ( not ( = ?auto_783773 ?auto_783777 ) ) ( not ( = ?auto_783774 ?auto_783775 ) ) ( not ( = ?auto_783774 ?auto_783776 ) ) ( not ( = ?auto_783774 ?auto_783777 ) ) ( not ( = ?auto_783775 ?auto_783776 ) ) ( not ( = ?auto_783775 ?auto_783777 ) ) ( not ( = ?auto_783776 ?auto_783777 ) ) ( ON ?auto_783775 ?auto_783776 ) ( CLEAR ?auto_783773 ) ( ON ?auto_783774 ?auto_783775 ) ( CLEAR ?auto_783774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_783773 ?auto_783774 )
      ( MAKE-4PILE ?auto_783773 ?auto_783774 ?auto_783775 ?auto_783776 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_783791 - BLOCK
      ?auto_783792 - BLOCK
      ?auto_783793 - BLOCK
      ?auto_783794 - BLOCK
    )
    :vars
    (
      ?auto_783795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783794 ?auto_783795 ) ( not ( = ?auto_783791 ?auto_783792 ) ) ( not ( = ?auto_783791 ?auto_783793 ) ) ( not ( = ?auto_783791 ?auto_783794 ) ) ( not ( = ?auto_783791 ?auto_783795 ) ) ( not ( = ?auto_783792 ?auto_783793 ) ) ( not ( = ?auto_783792 ?auto_783794 ) ) ( not ( = ?auto_783792 ?auto_783795 ) ) ( not ( = ?auto_783793 ?auto_783794 ) ) ( not ( = ?auto_783793 ?auto_783795 ) ) ( not ( = ?auto_783794 ?auto_783795 ) ) ( ON ?auto_783793 ?auto_783794 ) ( ON ?auto_783792 ?auto_783793 ) ( ON ?auto_783791 ?auto_783792 ) ( CLEAR ?auto_783791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_783791 )
      ( MAKE-4PILE ?auto_783791 ?auto_783792 ?auto_783793 ?auto_783794 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_783810 - BLOCK
      ?auto_783811 - BLOCK
      ?auto_783812 - BLOCK
      ?auto_783813 - BLOCK
      ?auto_783814 - BLOCK
    )
    :vars
    (
      ?auto_783815 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_783813 ) ( ON ?auto_783814 ?auto_783815 ) ( CLEAR ?auto_783814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_783810 ) ( ON ?auto_783811 ?auto_783810 ) ( ON ?auto_783812 ?auto_783811 ) ( ON ?auto_783813 ?auto_783812 ) ( not ( = ?auto_783810 ?auto_783811 ) ) ( not ( = ?auto_783810 ?auto_783812 ) ) ( not ( = ?auto_783810 ?auto_783813 ) ) ( not ( = ?auto_783810 ?auto_783814 ) ) ( not ( = ?auto_783810 ?auto_783815 ) ) ( not ( = ?auto_783811 ?auto_783812 ) ) ( not ( = ?auto_783811 ?auto_783813 ) ) ( not ( = ?auto_783811 ?auto_783814 ) ) ( not ( = ?auto_783811 ?auto_783815 ) ) ( not ( = ?auto_783812 ?auto_783813 ) ) ( not ( = ?auto_783812 ?auto_783814 ) ) ( not ( = ?auto_783812 ?auto_783815 ) ) ( not ( = ?auto_783813 ?auto_783814 ) ) ( not ( = ?auto_783813 ?auto_783815 ) ) ( not ( = ?auto_783814 ?auto_783815 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_783814 ?auto_783815 )
      ( !STACK ?auto_783814 ?auto_783813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_783832 - BLOCK
      ?auto_783833 - BLOCK
      ?auto_783834 - BLOCK
      ?auto_783835 - BLOCK
      ?auto_783836 - BLOCK
    )
    :vars
    (
      ?auto_783837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783836 ?auto_783837 ) ( ON-TABLE ?auto_783832 ) ( ON ?auto_783833 ?auto_783832 ) ( ON ?auto_783834 ?auto_783833 ) ( not ( = ?auto_783832 ?auto_783833 ) ) ( not ( = ?auto_783832 ?auto_783834 ) ) ( not ( = ?auto_783832 ?auto_783835 ) ) ( not ( = ?auto_783832 ?auto_783836 ) ) ( not ( = ?auto_783832 ?auto_783837 ) ) ( not ( = ?auto_783833 ?auto_783834 ) ) ( not ( = ?auto_783833 ?auto_783835 ) ) ( not ( = ?auto_783833 ?auto_783836 ) ) ( not ( = ?auto_783833 ?auto_783837 ) ) ( not ( = ?auto_783834 ?auto_783835 ) ) ( not ( = ?auto_783834 ?auto_783836 ) ) ( not ( = ?auto_783834 ?auto_783837 ) ) ( not ( = ?auto_783835 ?auto_783836 ) ) ( not ( = ?auto_783835 ?auto_783837 ) ) ( not ( = ?auto_783836 ?auto_783837 ) ) ( CLEAR ?auto_783834 ) ( ON ?auto_783835 ?auto_783836 ) ( CLEAR ?auto_783835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_783832 ?auto_783833 ?auto_783834 ?auto_783835 )
      ( MAKE-5PILE ?auto_783832 ?auto_783833 ?auto_783834 ?auto_783835 ?auto_783836 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_783854 - BLOCK
      ?auto_783855 - BLOCK
      ?auto_783856 - BLOCK
      ?auto_783857 - BLOCK
      ?auto_783858 - BLOCK
    )
    :vars
    (
      ?auto_783859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783858 ?auto_783859 ) ( ON-TABLE ?auto_783854 ) ( ON ?auto_783855 ?auto_783854 ) ( not ( = ?auto_783854 ?auto_783855 ) ) ( not ( = ?auto_783854 ?auto_783856 ) ) ( not ( = ?auto_783854 ?auto_783857 ) ) ( not ( = ?auto_783854 ?auto_783858 ) ) ( not ( = ?auto_783854 ?auto_783859 ) ) ( not ( = ?auto_783855 ?auto_783856 ) ) ( not ( = ?auto_783855 ?auto_783857 ) ) ( not ( = ?auto_783855 ?auto_783858 ) ) ( not ( = ?auto_783855 ?auto_783859 ) ) ( not ( = ?auto_783856 ?auto_783857 ) ) ( not ( = ?auto_783856 ?auto_783858 ) ) ( not ( = ?auto_783856 ?auto_783859 ) ) ( not ( = ?auto_783857 ?auto_783858 ) ) ( not ( = ?auto_783857 ?auto_783859 ) ) ( not ( = ?auto_783858 ?auto_783859 ) ) ( ON ?auto_783857 ?auto_783858 ) ( CLEAR ?auto_783855 ) ( ON ?auto_783856 ?auto_783857 ) ( CLEAR ?auto_783856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_783854 ?auto_783855 ?auto_783856 )
      ( MAKE-5PILE ?auto_783854 ?auto_783855 ?auto_783856 ?auto_783857 ?auto_783858 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_783876 - BLOCK
      ?auto_783877 - BLOCK
      ?auto_783878 - BLOCK
      ?auto_783879 - BLOCK
      ?auto_783880 - BLOCK
    )
    :vars
    (
      ?auto_783881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783880 ?auto_783881 ) ( ON-TABLE ?auto_783876 ) ( not ( = ?auto_783876 ?auto_783877 ) ) ( not ( = ?auto_783876 ?auto_783878 ) ) ( not ( = ?auto_783876 ?auto_783879 ) ) ( not ( = ?auto_783876 ?auto_783880 ) ) ( not ( = ?auto_783876 ?auto_783881 ) ) ( not ( = ?auto_783877 ?auto_783878 ) ) ( not ( = ?auto_783877 ?auto_783879 ) ) ( not ( = ?auto_783877 ?auto_783880 ) ) ( not ( = ?auto_783877 ?auto_783881 ) ) ( not ( = ?auto_783878 ?auto_783879 ) ) ( not ( = ?auto_783878 ?auto_783880 ) ) ( not ( = ?auto_783878 ?auto_783881 ) ) ( not ( = ?auto_783879 ?auto_783880 ) ) ( not ( = ?auto_783879 ?auto_783881 ) ) ( not ( = ?auto_783880 ?auto_783881 ) ) ( ON ?auto_783879 ?auto_783880 ) ( ON ?auto_783878 ?auto_783879 ) ( CLEAR ?auto_783876 ) ( ON ?auto_783877 ?auto_783878 ) ( CLEAR ?auto_783877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_783876 ?auto_783877 )
      ( MAKE-5PILE ?auto_783876 ?auto_783877 ?auto_783878 ?auto_783879 ?auto_783880 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_783898 - BLOCK
      ?auto_783899 - BLOCK
      ?auto_783900 - BLOCK
      ?auto_783901 - BLOCK
      ?auto_783902 - BLOCK
    )
    :vars
    (
      ?auto_783903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783902 ?auto_783903 ) ( not ( = ?auto_783898 ?auto_783899 ) ) ( not ( = ?auto_783898 ?auto_783900 ) ) ( not ( = ?auto_783898 ?auto_783901 ) ) ( not ( = ?auto_783898 ?auto_783902 ) ) ( not ( = ?auto_783898 ?auto_783903 ) ) ( not ( = ?auto_783899 ?auto_783900 ) ) ( not ( = ?auto_783899 ?auto_783901 ) ) ( not ( = ?auto_783899 ?auto_783902 ) ) ( not ( = ?auto_783899 ?auto_783903 ) ) ( not ( = ?auto_783900 ?auto_783901 ) ) ( not ( = ?auto_783900 ?auto_783902 ) ) ( not ( = ?auto_783900 ?auto_783903 ) ) ( not ( = ?auto_783901 ?auto_783902 ) ) ( not ( = ?auto_783901 ?auto_783903 ) ) ( not ( = ?auto_783902 ?auto_783903 ) ) ( ON ?auto_783901 ?auto_783902 ) ( ON ?auto_783900 ?auto_783901 ) ( ON ?auto_783899 ?auto_783900 ) ( ON ?auto_783898 ?auto_783899 ) ( CLEAR ?auto_783898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_783898 )
      ( MAKE-5PILE ?auto_783898 ?auto_783899 ?auto_783900 ?auto_783901 ?auto_783902 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_783921 - BLOCK
      ?auto_783922 - BLOCK
      ?auto_783923 - BLOCK
      ?auto_783924 - BLOCK
      ?auto_783925 - BLOCK
      ?auto_783926 - BLOCK
    )
    :vars
    (
      ?auto_783927 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_783925 ) ( ON ?auto_783926 ?auto_783927 ) ( CLEAR ?auto_783926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_783921 ) ( ON ?auto_783922 ?auto_783921 ) ( ON ?auto_783923 ?auto_783922 ) ( ON ?auto_783924 ?auto_783923 ) ( ON ?auto_783925 ?auto_783924 ) ( not ( = ?auto_783921 ?auto_783922 ) ) ( not ( = ?auto_783921 ?auto_783923 ) ) ( not ( = ?auto_783921 ?auto_783924 ) ) ( not ( = ?auto_783921 ?auto_783925 ) ) ( not ( = ?auto_783921 ?auto_783926 ) ) ( not ( = ?auto_783921 ?auto_783927 ) ) ( not ( = ?auto_783922 ?auto_783923 ) ) ( not ( = ?auto_783922 ?auto_783924 ) ) ( not ( = ?auto_783922 ?auto_783925 ) ) ( not ( = ?auto_783922 ?auto_783926 ) ) ( not ( = ?auto_783922 ?auto_783927 ) ) ( not ( = ?auto_783923 ?auto_783924 ) ) ( not ( = ?auto_783923 ?auto_783925 ) ) ( not ( = ?auto_783923 ?auto_783926 ) ) ( not ( = ?auto_783923 ?auto_783927 ) ) ( not ( = ?auto_783924 ?auto_783925 ) ) ( not ( = ?auto_783924 ?auto_783926 ) ) ( not ( = ?auto_783924 ?auto_783927 ) ) ( not ( = ?auto_783925 ?auto_783926 ) ) ( not ( = ?auto_783925 ?auto_783927 ) ) ( not ( = ?auto_783926 ?auto_783927 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_783926 ?auto_783927 )
      ( !STACK ?auto_783926 ?auto_783925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_783947 - BLOCK
      ?auto_783948 - BLOCK
      ?auto_783949 - BLOCK
      ?auto_783950 - BLOCK
      ?auto_783951 - BLOCK
      ?auto_783952 - BLOCK
    )
    :vars
    (
      ?auto_783953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783952 ?auto_783953 ) ( ON-TABLE ?auto_783947 ) ( ON ?auto_783948 ?auto_783947 ) ( ON ?auto_783949 ?auto_783948 ) ( ON ?auto_783950 ?auto_783949 ) ( not ( = ?auto_783947 ?auto_783948 ) ) ( not ( = ?auto_783947 ?auto_783949 ) ) ( not ( = ?auto_783947 ?auto_783950 ) ) ( not ( = ?auto_783947 ?auto_783951 ) ) ( not ( = ?auto_783947 ?auto_783952 ) ) ( not ( = ?auto_783947 ?auto_783953 ) ) ( not ( = ?auto_783948 ?auto_783949 ) ) ( not ( = ?auto_783948 ?auto_783950 ) ) ( not ( = ?auto_783948 ?auto_783951 ) ) ( not ( = ?auto_783948 ?auto_783952 ) ) ( not ( = ?auto_783948 ?auto_783953 ) ) ( not ( = ?auto_783949 ?auto_783950 ) ) ( not ( = ?auto_783949 ?auto_783951 ) ) ( not ( = ?auto_783949 ?auto_783952 ) ) ( not ( = ?auto_783949 ?auto_783953 ) ) ( not ( = ?auto_783950 ?auto_783951 ) ) ( not ( = ?auto_783950 ?auto_783952 ) ) ( not ( = ?auto_783950 ?auto_783953 ) ) ( not ( = ?auto_783951 ?auto_783952 ) ) ( not ( = ?auto_783951 ?auto_783953 ) ) ( not ( = ?auto_783952 ?auto_783953 ) ) ( CLEAR ?auto_783950 ) ( ON ?auto_783951 ?auto_783952 ) ( CLEAR ?auto_783951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_783947 ?auto_783948 ?auto_783949 ?auto_783950 ?auto_783951 )
      ( MAKE-6PILE ?auto_783947 ?auto_783948 ?auto_783949 ?auto_783950 ?auto_783951 ?auto_783952 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_783973 - BLOCK
      ?auto_783974 - BLOCK
      ?auto_783975 - BLOCK
      ?auto_783976 - BLOCK
      ?auto_783977 - BLOCK
      ?auto_783978 - BLOCK
    )
    :vars
    (
      ?auto_783979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_783978 ?auto_783979 ) ( ON-TABLE ?auto_783973 ) ( ON ?auto_783974 ?auto_783973 ) ( ON ?auto_783975 ?auto_783974 ) ( not ( = ?auto_783973 ?auto_783974 ) ) ( not ( = ?auto_783973 ?auto_783975 ) ) ( not ( = ?auto_783973 ?auto_783976 ) ) ( not ( = ?auto_783973 ?auto_783977 ) ) ( not ( = ?auto_783973 ?auto_783978 ) ) ( not ( = ?auto_783973 ?auto_783979 ) ) ( not ( = ?auto_783974 ?auto_783975 ) ) ( not ( = ?auto_783974 ?auto_783976 ) ) ( not ( = ?auto_783974 ?auto_783977 ) ) ( not ( = ?auto_783974 ?auto_783978 ) ) ( not ( = ?auto_783974 ?auto_783979 ) ) ( not ( = ?auto_783975 ?auto_783976 ) ) ( not ( = ?auto_783975 ?auto_783977 ) ) ( not ( = ?auto_783975 ?auto_783978 ) ) ( not ( = ?auto_783975 ?auto_783979 ) ) ( not ( = ?auto_783976 ?auto_783977 ) ) ( not ( = ?auto_783976 ?auto_783978 ) ) ( not ( = ?auto_783976 ?auto_783979 ) ) ( not ( = ?auto_783977 ?auto_783978 ) ) ( not ( = ?auto_783977 ?auto_783979 ) ) ( not ( = ?auto_783978 ?auto_783979 ) ) ( ON ?auto_783977 ?auto_783978 ) ( CLEAR ?auto_783975 ) ( ON ?auto_783976 ?auto_783977 ) ( CLEAR ?auto_783976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_783973 ?auto_783974 ?auto_783975 ?auto_783976 )
      ( MAKE-6PILE ?auto_783973 ?auto_783974 ?auto_783975 ?auto_783976 ?auto_783977 ?auto_783978 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_783999 - BLOCK
      ?auto_784000 - BLOCK
      ?auto_784001 - BLOCK
      ?auto_784002 - BLOCK
      ?auto_784003 - BLOCK
      ?auto_784004 - BLOCK
    )
    :vars
    (
      ?auto_784005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784004 ?auto_784005 ) ( ON-TABLE ?auto_783999 ) ( ON ?auto_784000 ?auto_783999 ) ( not ( = ?auto_783999 ?auto_784000 ) ) ( not ( = ?auto_783999 ?auto_784001 ) ) ( not ( = ?auto_783999 ?auto_784002 ) ) ( not ( = ?auto_783999 ?auto_784003 ) ) ( not ( = ?auto_783999 ?auto_784004 ) ) ( not ( = ?auto_783999 ?auto_784005 ) ) ( not ( = ?auto_784000 ?auto_784001 ) ) ( not ( = ?auto_784000 ?auto_784002 ) ) ( not ( = ?auto_784000 ?auto_784003 ) ) ( not ( = ?auto_784000 ?auto_784004 ) ) ( not ( = ?auto_784000 ?auto_784005 ) ) ( not ( = ?auto_784001 ?auto_784002 ) ) ( not ( = ?auto_784001 ?auto_784003 ) ) ( not ( = ?auto_784001 ?auto_784004 ) ) ( not ( = ?auto_784001 ?auto_784005 ) ) ( not ( = ?auto_784002 ?auto_784003 ) ) ( not ( = ?auto_784002 ?auto_784004 ) ) ( not ( = ?auto_784002 ?auto_784005 ) ) ( not ( = ?auto_784003 ?auto_784004 ) ) ( not ( = ?auto_784003 ?auto_784005 ) ) ( not ( = ?auto_784004 ?auto_784005 ) ) ( ON ?auto_784003 ?auto_784004 ) ( ON ?auto_784002 ?auto_784003 ) ( CLEAR ?auto_784000 ) ( ON ?auto_784001 ?auto_784002 ) ( CLEAR ?auto_784001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_783999 ?auto_784000 ?auto_784001 )
      ( MAKE-6PILE ?auto_783999 ?auto_784000 ?auto_784001 ?auto_784002 ?auto_784003 ?auto_784004 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_784025 - BLOCK
      ?auto_784026 - BLOCK
      ?auto_784027 - BLOCK
      ?auto_784028 - BLOCK
      ?auto_784029 - BLOCK
      ?auto_784030 - BLOCK
    )
    :vars
    (
      ?auto_784031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784030 ?auto_784031 ) ( ON-TABLE ?auto_784025 ) ( not ( = ?auto_784025 ?auto_784026 ) ) ( not ( = ?auto_784025 ?auto_784027 ) ) ( not ( = ?auto_784025 ?auto_784028 ) ) ( not ( = ?auto_784025 ?auto_784029 ) ) ( not ( = ?auto_784025 ?auto_784030 ) ) ( not ( = ?auto_784025 ?auto_784031 ) ) ( not ( = ?auto_784026 ?auto_784027 ) ) ( not ( = ?auto_784026 ?auto_784028 ) ) ( not ( = ?auto_784026 ?auto_784029 ) ) ( not ( = ?auto_784026 ?auto_784030 ) ) ( not ( = ?auto_784026 ?auto_784031 ) ) ( not ( = ?auto_784027 ?auto_784028 ) ) ( not ( = ?auto_784027 ?auto_784029 ) ) ( not ( = ?auto_784027 ?auto_784030 ) ) ( not ( = ?auto_784027 ?auto_784031 ) ) ( not ( = ?auto_784028 ?auto_784029 ) ) ( not ( = ?auto_784028 ?auto_784030 ) ) ( not ( = ?auto_784028 ?auto_784031 ) ) ( not ( = ?auto_784029 ?auto_784030 ) ) ( not ( = ?auto_784029 ?auto_784031 ) ) ( not ( = ?auto_784030 ?auto_784031 ) ) ( ON ?auto_784029 ?auto_784030 ) ( ON ?auto_784028 ?auto_784029 ) ( ON ?auto_784027 ?auto_784028 ) ( CLEAR ?auto_784025 ) ( ON ?auto_784026 ?auto_784027 ) ( CLEAR ?auto_784026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_784025 ?auto_784026 )
      ( MAKE-6PILE ?auto_784025 ?auto_784026 ?auto_784027 ?auto_784028 ?auto_784029 ?auto_784030 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_784051 - BLOCK
      ?auto_784052 - BLOCK
      ?auto_784053 - BLOCK
      ?auto_784054 - BLOCK
      ?auto_784055 - BLOCK
      ?auto_784056 - BLOCK
    )
    :vars
    (
      ?auto_784057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784056 ?auto_784057 ) ( not ( = ?auto_784051 ?auto_784052 ) ) ( not ( = ?auto_784051 ?auto_784053 ) ) ( not ( = ?auto_784051 ?auto_784054 ) ) ( not ( = ?auto_784051 ?auto_784055 ) ) ( not ( = ?auto_784051 ?auto_784056 ) ) ( not ( = ?auto_784051 ?auto_784057 ) ) ( not ( = ?auto_784052 ?auto_784053 ) ) ( not ( = ?auto_784052 ?auto_784054 ) ) ( not ( = ?auto_784052 ?auto_784055 ) ) ( not ( = ?auto_784052 ?auto_784056 ) ) ( not ( = ?auto_784052 ?auto_784057 ) ) ( not ( = ?auto_784053 ?auto_784054 ) ) ( not ( = ?auto_784053 ?auto_784055 ) ) ( not ( = ?auto_784053 ?auto_784056 ) ) ( not ( = ?auto_784053 ?auto_784057 ) ) ( not ( = ?auto_784054 ?auto_784055 ) ) ( not ( = ?auto_784054 ?auto_784056 ) ) ( not ( = ?auto_784054 ?auto_784057 ) ) ( not ( = ?auto_784055 ?auto_784056 ) ) ( not ( = ?auto_784055 ?auto_784057 ) ) ( not ( = ?auto_784056 ?auto_784057 ) ) ( ON ?auto_784055 ?auto_784056 ) ( ON ?auto_784054 ?auto_784055 ) ( ON ?auto_784053 ?auto_784054 ) ( ON ?auto_784052 ?auto_784053 ) ( ON ?auto_784051 ?auto_784052 ) ( CLEAR ?auto_784051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_784051 )
      ( MAKE-6PILE ?auto_784051 ?auto_784052 ?auto_784053 ?auto_784054 ?auto_784055 ?auto_784056 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_784078 - BLOCK
      ?auto_784079 - BLOCK
      ?auto_784080 - BLOCK
      ?auto_784081 - BLOCK
      ?auto_784082 - BLOCK
      ?auto_784083 - BLOCK
      ?auto_784084 - BLOCK
    )
    :vars
    (
      ?auto_784085 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_784083 ) ( ON ?auto_784084 ?auto_784085 ) ( CLEAR ?auto_784084 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_784078 ) ( ON ?auto_784079 ?auto_784078 ) ( ON ?auto_784080 ?auto_784079 ) ( ON ?auto_784081 ?auto_784080 ) ( ON ?auto_784082 ?auto_784081 ) ( ON ?auto_784083 ?auto_784082 ) ( not ( = ?auto_784078 ?auto_784079 ) ) ( not ( = ?auto_784078 ?auto_784080 ) ) ( not ( = ?auto_784078 ?auto_784081 ) ) ( not ( = ?auto_784078 ?auto_784082 ) ) ( not ( = ?auto_784078 ?auto_784083 ) ) ( not ( = ?auto_784078 ?auto_784084 ) ) ( not ( = ?auto_784078 ?auto_784085 ) ) ( not ( = ?auto_784079 ?auto_784080 ) ) ( not ( = ?auto_784079 ?auto_784081 ) ) ( not ( = ?auto_784079 ?auto_784082 ) ) ( not ( = ?auto_784079 ?auto_784083 ) ) ( not ( = ?auto_784079 ?auto_784084 ) ) ( not ( = ?auto_784079 ?auto_784085 ) ) ( not ( = ?auto_784080 ?auto_784081 ) ) ( not ( = ?auto_784080 ?auto_784082 ) ) ( not ( = ?auto_784080 ?auto_784083 ) ) ( not ( = ?auto_784080 ?auto_784084 ) ) ( not ( = ?auto_784080 ?auto_784085 ) ) ( not ( = ?auto_784081 ?auto_784082 ) ) ( not ( = ?auto_784081 ?auto_784083 ) ) ( not ( = ?auto_784081 ?auto_784084 ) ) ( not ( = ?auto_784081 ?auto_784085 ) ) ( not ( = ?auto_784082 ?auto_784083 ) ) ( not ( = ?auto_784082 ?auto_784084 ) ) ( not ( = ?auto_784082 ?auto_784085 ) ) ( not ( = ?auto_784083 ?auto_784084 ) ) ( not ( = ?auto_784083 ?auto_784085 ) ) ( not ( = ?auto_784084 ?auto_784085 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_784084 ?auto_784085 )
      ( !STACK ?auto_784084 ?auto_784083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_784108 - BLOCK
      ?auto_784109 - BLOCK
      ?auto_784110 - BLOCK
      ?auto_784111 - BLOCK
      ?auto_784112 - BLOCK
      ?auto_784113 - BLOCK
      ?auto_784114 - BLOCK
    )
    :vars
    (
      ?auto_784115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784114 ?auto_784115 ) ( ON-TABLE ?auto_784108 ) ( ON ?auto_784109 ?auto_784108 ) ( ON ?auto_784110 ?auto_784109 ) ( ON ?auto_784111 ?auto_784110 ) ( ON ?auto_784112 ?auto_784111 ) ( not ( = ?auto_784108 ?auto_784109 ) ) ( not ( = ?auto_784108 ?auto_784110 ) ) ( not ( = ?auto_784108 ?auto_784111 ) ) ( not ( = ?auto_784108 ?auto_784112 ) ) ( not ( = ?auto_784108 ?auto_784113 ) ) ( not ( = ?auto_784108 ?auto_784114 ) ) ( not ( = ?auto_784108 ?auto_784115 ) ) ( not ( = ?auto_784109 ?auto_784110 ) ) ( not ( = ?auto_784109 ?auto_784111 ) ) ( not ( = ?auto_784109 ?auto_784112 ) ) ( not ( = ?auto_784109 ?auto_784113 ) ) ( not ( = ?auto_784109 ?auto_784114 ) ) ( not ( = ?auto_784109 ?auto_784115 ) ) ( not ( = ?auto_784110 ?auto_784111 ) ) ( not ( = ?auto_784110 ?auto_784112 ) ) ( not ( = ?auto_784110 ?auto_784113 ) ) ( not ( = ?auto_784110 ?auto_784114 ) ) ( not ( = ?auto_784110 ?auto_784115 ) ) ( not ( = ?auto_784111 ?auto_784112 ) ) ( not ( = ?auto_784111 ?auto_784113 ) ) ( not ( = ?auto_784111 ?auto_784114 ) ) ( not ( = ?auto_784111 ?auto_784115 ) ) ( not ( = ?auto_784112 ?auto_784113 ) ) ( not ( = ?auto_784112 ?auto_784114 ) ) ( not ( = ?auto_784112 ?auto_784115 ) ) ( not ( = ?auto_784113 ?auto_784114 ) ) ( not ( = ?auto_784113 ?auto_784115 ) ) ( not ( = ?auto_784114 ?auto_784115 ) ) ( CLEAR ?auto_784112 ) ( ON ?auto_784113 ?auto_784114 ) ( CLEAR ?auto_784113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_784108 ?auto_784109 ?auto_784110 ?auto_784111 ?auto_784112 ?auto_784113 )
      ( MAKE-7PILE ?auto_784108 ?auto_784109 ?auto_784110 ?auto_784111 ?auto_784112 ?auto_784113 ?auto_784114 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_784138 - BLOCK
      ?auto_784139 - BLOCK
      ?auto_784140 - BLOCK
      ?auto_784141 - BLOCK
      ?auto_784142 - BLOCK
      ?auto_784143 - BLOCK
      ?auto_784144 - BLOCK
    )
    :vars
    (
      ?auto_784145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784144 ?auto_784145 ) ( ON-TABLE ?auto_784138 ) ( ON ?auto_784139 ?auto_784138 ) ( ON ?auto_784140 ?auto_784139 ) ( ON ?auto_784141 ?auto_784140 ) ( not ( = ?auto_784138 ?auto_784139 ) ) ( not ( = ?auto_784138 ?auto_784140 ) ) ( not ( = ?auto_784138 ?auto_784141 ) ) ( not ( = ?auto_784138 ?auto_784142 ) ) ( not ( = ?auto_784138 ?auto_784143 ) ) ( not ( = ?auto_784138 ?auto_784144 ) ) ( not ( = ?auto_784138 ?auto_784145 ) ) ( not ( = ?auto_784139 ?auto_784140 ) ) ( not ( = ?auto_784139 ?auto_784141 ) ) ( not ( = ?auto_784139 ?auto_784142 ) ) ( not ( = ?auto_784139 ?auto_784143 ) ) ( not ( = ?auto_784139 ?auto_784144 ) ) ( not ( = ?auto_784139 ?auto_784145 ) ) ( not ( = ?auto_784140 ?auto_784141 ) ) ( not ( = ?auto_784140 ?auto_784142 ) ) ( not ( = ?auto_784140 ?auto_784143 ) ) ( not ( = ?auto_784140 ?auto_784144 ) ) ( not ( = ?auto_784140 ?auto_784145 ) ) ( not ( = ?auto_784141 ?auto_784142 ) ) ( not ( = ?auto_784141 ?auto_784143 ) ) ( not ( = ?auto_784141 ?auto_784144 ) ) ( not ( = ?auto_784141 ?auto_784145 ) ) ( not ( = ?auto_784142 ?auto_784143 ) ) ( not ( = ?auto_784142 ?auto_784144 ) ) ( not ( = ?auto_784142 ?auto_784145 ) ) ( not ( = ?auto_784143 ?auto_784144 ) ) ( not ( = ?auto_784143 ?auto_784145 ) ) ( not ( = ?auto_784144 ?auto_784145 ) ) ( ON ?auto_784143 ?auto_784144 ) ( CLEAR ?auto_784141 ) ( ON ?auto_784142 ?auto_784143 ) ( CLEAR ?auto_784142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_784138 ?auto_784139 ?auto_784140 ?auto_784141 ?auto_784142 )
      ( MAKE-7PILE ?auto_784138 ?auto_784139 ?auto_784140 ?auto_784141 ?auto_784142 ?auto_784143 ?auto_784144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_784168 - BLOCK
      ?auto_784169 - BLOCK
      ?auto_784170 - BLOCK
      ?auto_784171 - BLOCK
      ?auto_784172 - BLOCK
      ?auto_784173 - BLOCK
      ?auto_784174 - BLOCK
    )
    :vars
    (
      ?auto_784175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784174 ?auto_784175 ) ( ON-TABLE ?auto_784168 ) ( ON ?auto_784169 ?auto_784168 ) ( ON ?auto_784170 ?auto_784169 ) ( not ( = ?auto_784168 ?auto_784169 ) ) ( not ( = ?auto_784168 ?auto_784170 ) ) ( not ( = ?auto_784168 ?auto_784171 ) ) ( not ( = ?auto_784168 ?auto_784172 ) ) ( not ( = ?auto_784168 ?auto_784173 ) ) ( not ( = ?auto_784168 ?auto_784174 ) ) ( not ( = ?auto_784168 ?auto_784175 ) ) ( not ( = ?auto_784169 ?auto_784170 ) ) ( not ( = ?auto_784169 ?auto_784171 ) ) ( not ( = ?auto_784169 ?auto_784172 ) ) ( not ( = ?auto_784169 ?auto_784173 ) ) ( not ( = ?auto_784169 ?auto_784174 ) ) ( not ( = ?auto_784169 ?auto_784175 ) ) ( not ( = ?auto_784170 ?auto_784171 ) ) ( not ( = ?auto_784170 ?auto_784172 ) ) ( not ( = ?auto_784170 ?auto_784173 ) ) ( not ( = ?auto_784170 ?auto_784174 ) ) ( not ( = ?auto_784170 ?auto_784175 ) ) ( not ( = ?auto_784171 ?auto_784172 ) ) ( not ( = ?auto_784171 ?auto_784173 ) ) ( not ( = ?auto_784171 ?auto_784174 ) ) ( not ( = ?auto_784171 ?auto_784175 ) ) ( not ( = ?auto_784172 ?auto_784173 ) ) ( not ( = ?auto_784172 ?auto_784174 ) ) ( not ( = ?auto_784172 ?auto_784175 ) ) ( not ( = ?auto_784173 ?auto_784174 ) ) ( not ( = ?auto_784173 ?auto_784175 ) ) ( not ( = ?auto_784174 ?auto_784175 ) ) ( ON ?auto_784173 ?auto_784174 ) ( ON ?auto_784172 ?auto_784173 ) ( CLEAR ?auto_784170 ) ( ON ?auto_784171 ?auto_784172 ) ( CLEAR ?auto_784171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_784168 ?auto_784169 ?auto_784170 ?auto_784171 )
      ( MAKE-7PILE ?auto_784168 ?auto_784169 ?auto_784170 ?auto_784171 ?auto_784172 ?auto_784173 ?auto_784174 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_784198 - BLOCK
      ?auto_784199 - BLOCK
      ?auto_784200 - BLOCK
      ?auto_784201 - BLOCK
      ?auto_784202 - BLOCK
      ?auto_784203 - BLOCK
      ?auto_784204 - BLOCK
    )
    :vars
    (
      ?auto_784205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784204 ?auto_784205 ) ( ON-TABLE ?auto_784198 ) ( ON ?auto_784199 ?auto_784198 ) ( not ( = ?auto_784198 ?auto_784199 ) ) ( not ( = ?auto_784198 ?auto_784200 ) ) ( not ( = ?auto_784198 ?auto_784201 ) ) ( not ( = ?auto_784198 ?auto_784202 ) ) ( not ( = ?auto_784198 ?auto_784203 ) ) ( not ( = ?auto_784198 ?auto_784204 ) ) ( not ( = ?auto_784198 ?auto_784205 ) ) ( not ( = ?auto_784199 ?auto_784200 ) ) ( not ( = ?auto_784199 ?auto_784201 ) ) ( not ( = ?auto_784199 ?auto_784202 ) ) ( not ( = ?auto_784199 ?auto_784203 ) ) ( not ( = ?auto_784199 ?auto_784204 ) ) ( not ( = ?auto_784199 ?auto_784205 ) ) ( not ( = ?auto_784200 ?auto_784201 ) ) ( not ( = ?auto_784200 ?auto_784202 ) ) ( not ( = ?auto_784200 ?auto_784203 ) ) ( not ( = ?auto_784200 ?auto_784204 ) ) ( not ( = ?auto_784200 ?auto_784205 ) ) ( not ( = ?auto_784201 ?auto_784202 ) ) ( not ( = ?auto_784201 ?auto_784203 ) ) ( not ( = ?auto_784201 ?auto_784204 ) ) ( not ( = ?auto_784201 ?auto_784205 ) ) ( not ( = ?auto_784202 ?auto_784203 ) ) ( not ( = ?auto_784202 ?auto_784204 ) ) ( not ( = ?auto_784202 ?auto_784205 ) ) ( not ( = ?auto_784203 ?auto_784204 ) ) ( not ( = ?auto_784203 ?auto_784205 ) ) ( not ( = ?auto_784204 ?auto_784205 ) ) ( ON ?auto_784203 ?auto_784204 ) ( ON ?auto_784202 ?auto_784203 ) ( ON ?auto_784201 ?auto_784202 ) ( CLEAR ?auto_784199 ) ( ON ?auto_784200 ?auto_784201 ) ( CLEAR ?auto_784200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_784198 ?auto_784199 ?auto_784200 )
      ( MAKE-7PILE ?auto_784198 ?auto_784199 ?auto_784200 ?auto_784201 ?auto_784202 ?auto_784203 ?auto_784204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_784228 - BLOCK
      ?auto_784229 - BLOCK
      ?auto_784230 - BLOCK
      ?auto_784231 - BLOCK
      ?auto_784232 - BLOCK
      ?auto_784233 - BLOCK
      ?auto_784234 - BLOCK
    )
    :vars
    (
      ?auto_784235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784234 ?auto_784235 ) ( ON-TABLE ?auto_784228 ) ( not ( = ?auto_784228 ?auto_784229 ) ) ( not ( = ?auto_784228 ?auto_784230 ) ) ( not ( = ?auto_784228 ?auto_784231 ) ) ( not ( = ?auto_784228 ?auto_784232 ) ) ( not ( = ?auto_784228 ?auto_784233 ) ) ( not ( = ?auto_784228 ?auto_784234 ) ) ( not ( = ?auto_784228 ?auto_784235 ) ) ( not ( = ?auto_784229 ?auto_784230 ) ) ( not ( = ?auto_784229 ?auto_784231 ) ) ( not ( = ?auto_784229 ?auto_784232 ) ) ( not ( = ?auto_784229 ?auto_784233 ) ) ( not ( = ?auto_784229 ?auto_784234 ) ) ( not ( = ?auto_784229 ?auto_784235 ) ) ( not ( = ?auto_784230 ?auto_784231 ) ) ( not ( = ?auto_784230 ?auto_784232 ) ) ( not ( = ?auto_784230 ?auto_784233 ) ) ( not ( = ?auto_784230 ?auto_784234 ) ) ( not ( = ?auto_784230 ?auto_784235 ) ) ( not ( = ?auto_784231 ?auto_784232 ) ) ( not ( = ?auto_784231 ?auto_784233 ) ) ( not ( = ?auto_784231 ?auto_784234 ) ) ( not ( = ?auto_784231 ?auto_784235 ) ) ( not ( = ?auto_784232 ?auto_784233 ) ) ( not ( = ?auto_784232 ?auto_784234 ) ) ( not ( = ?auto_784232 ?auto_784235 ) ) ( not ( = ?auto_784233 ?auto_784234 ) ) ( not ( = ?auto_784233 ?auto_784235 ) ) ( not ( = ?auto_784234 ?auto_784235 ) ) ( ON ?auto_784233 ?auto_784234 ) ( ON ?auto_784232 ?auto_784233 ) ( ON ?auto_784231 ?auto_784232 ) ( ON ?auto_784230 ?auto_784231 ) ( CLEAR ?auto_784228 ) ( ON ?auto_784229 ?auto_784230 ) ( CLEAR ?auto_784229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_784228 ?auto_784229 )
      ( MAKE-7PILE ?auto_784228 ?auto_784229 ?auto_784230 ?auto_784231 ?auto_784232 ?auto_784233 ?auto_784234 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_784258 - BLOCK
      ?auto_784259 - BLOCK
      ?auto_784260 - BLOCK
      ?auto_784261 - BLOCK
      ?auto_784262 - BLOCK
      ?auto_784263 - BLOCK
      ?auto_784264 - BLOCK
    )
    :vars
    (
      ?auto_784265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784264 ?auto_784265 ) ( not ( = ?auto_784258 ?auto_784259 ) ) ( not ( = ?auto_784258 ?auto_784260 ) ) ( not ( = ?auto_784258 ?auto_784261 ) ) ( not ( = ?auto_784258 ?auto_784262 ) ) ( not ( = ?auto_784258 ?auto_784263 ) ) ( not ( = ?auto_784258 ?auto_784264 ) ) ( not ( = ?auto_784258 ?auto_784265 ) ) ( not ( = ?auto_784259 ?auto_784260 ) ) ( not ( = ?auto_784259 ?auto_784261 ) ) ( not ( = ?auto_784259 ?auto_784262 ) ) ( not ( = ?auto_784259 ?auto_784263 ) ) ( not ( = ?auto_784259 ?auto_784264 ) ) ( not ( = ?auto_784259 ?auto_784265 ) ) ( not ( = ?auto_784260 ?auto_784261 ) ) ( not ( = ?auto_784260 ?auto_784262 ) ) ( not ( = ?auto_784260 ?auto_784263 ) ) ( not ( = ?auto_784260 ?auto_784264 ) ) ( not ( = ?auto_784260 ?auto_784265 ) ) ( not ( = ?auto_784261 ?auto_784262 ) ) ( not ( = ?auto_784261 ?auto_784263 ) ) ( not ( = ?auto_784261 ?auto_784264 ) ) ( not ( = ?auto_784261 ?auto_784265 ) ) ( not ( = ?auto_784262 ?auto_784263 ) ) ( not ( = ?auto_784262 ?auto_784264 ) ) ( not ( = ?auto_784262 ?auto_784265 ) ) ( not ( = ?auto_784263 ?auto_784264 ) ) ( not ( = ?auto_784263 ?auto_784265 ) ) ( not ( = ?auto_784264 ?auto_784265 ) ) ( ON ?auto_784263 ?auto_784264 ) ( ON ?auto_784262 ?auto_784263 ) ( ON ?auto_784261 ?auto_784262 ) ( ON ?auto_784260 ?auto_784261 ) ( ON ?auto_784259 ?auto_784260 ) ( ON ?auto_784258 ?auto_784259 ) ( CLEAR ?auto_784258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_784258 )
      ( MAKE-7PILE ?auto_784258 ?auto_784259 ?auto_784260 ?auto_784261 ?auto_784262 ?auto_784263 ?auto_784264 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_784289 - BLOCK
      ?auto_784290 - BLOCK
      ?auto_784291 - BLOCK
      ?auto_784292 - BLOCK
      ?auto_784293 - BLOCK
      ?auto_784294 - BLOCK
      ?auto_784295 - BLOCK
      ?auto_784296 - BLOCK
    )
    :vars
    (
      ?auto_784297 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_784295 ) ( ON ?auto_784296 ?auto_784297 ) ( CLEAR ?auto_784296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_784289 ) ( ON ?auto_784290 ?auto_784289 ) ( ON ?auto_784291 ?auto_784290 ) ( ON ?auto_784292 ?auto_784291 ) ( ON ?auto_784293 ?auto_784292 ) ( ON ?auto_784294 ?auto_784293 ) ( ON ?auto_784295 ?auto_784294 ) ( not ( = ?auto_784289 ?auto_784290 ) ) ( not ( = ?auto_784289 ?auto_784291 ) ) ( not ( = ?auto_784289 ?auto_784292 ) ) ( not ( = ?auto_784289 ?auto_784293 ) ) ( not ( = ?auto_784289 ?auto_784294 ) ) ( not ( = ?auto_784289 ?auto_784295 ) ) ( not ( = ?auto_784289 ?auto_784296 ) ) ( not ( = ?auto_784289 ?auto_784297 ) ) ( not ( = ?auto_784290 ?auto_784291 ) ) ( not ( = ?auto_784290 ?auto_784292 ) ) ( not ( = ?auto_784290 ?auto_784293 ) ) ( not ( = ?auto_784290 ?auto_784294 ) ) ( not ( = ?auto_784290 ?auto_784295 ) ) ( not ( = ?auto_784290 ?auto_784296 ) ) ( not ( = ?auto_784290 ?auto_784297 ) ) ( not ( = ?auto_784291 ?auto_784292 ) ) ( not ( = ?auto_784291 ?auto_784293 ) ) ( not ( = ?auto_784291 ?auto_784294 ) ) ( not ( = ?auto_784291 ?auto_784295 ) ) ( not ( = ?auto_784291 ?auto_784296 ) ) ( not ( = ?auto_784291 ?auto_784297 ) ) ( not ( = ?auto_784292 ?auto_784293 ) ) ( not ( = ?auto_784292 ?auto_784294 ) ) ( not ( = ?auto_784292 ?auto_784295 ) ) ( not ( = ?auto_784292 ?auto_784296 ) ) ( not ( = ?auto_784292 ?auto_784297 ) ) ( not ( = ?auto_784293 ?auto_784294 ) ) ( not ( = ?auto_784293 ?auto_784295 ) ) ( not ( = ?auto_784293 ?auto_784296 ) ) ( not ( = ?auto_784293 ?auto_784297 ) ) ( not ( = ?auto_784294 ?auto_784295 ) ) ( not ( = ?auto_784294 ?auto_784296 ) ) ( not ( = ?auto_784294 ?auto_784297 ) ) ( not ( = ?auto_784295 ?auto_784296 ) ) ( not ( = ?auto_784295 ?auto_784297 ) ) ( not ( = ?auto_784296 ?auto_784297 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_784296 ?auto_784297 )
      ( !STACK ?auto_784296 ?auto_784295 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_784323 - BLOCK
      ?auto_784324 - BLOCK
      ?auto_784325 - BLOCK
      ?auto_784326 - BLOCK
      ?auto_784327 - BLOCK
      ?auto_784328 - BLOCK
      ?auto_784329 - BLOCK
      ?auto_784330 - BLOCK
    )
    :vars
    (
      ?auto_784331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784330 ?auto_784331 ) ( ON-TABLE ?auto_784323 ) ( ON ?auto_784324 ?auto_784323 ) ( ON ?auto_784325 ?auto_784324 ) ( ON ?auto_784326 ?auto_784325 ) ( ON ?auto_784327 ?auto_784326 ) ( ON ?auto_784328 ?auto_784327 ) ( not ( = ?auto_784323 ?auto_784324 ) ) ( not ( = ?auto_784323 ?auto_784325 ) ) ( not ( = ?auto_784323 ?auto_784326 ) ) ( not ( = ?auto_784323 ?auto_784327 ) ) ( not ( = ?auto_784323 ?auto_784328 ) ) ( not ( = ?auto_784323 ?auto_784329 ) ) ( not ( = ?auto_784323 ?auto_784330 ) ) ( not ( = ?auto_784323 ?auto_784331 ) ) ( not ( = ?auto_784324 ?auto_784325 ) ) ( not ( = ?auto_784324 ?auto_784326 ) ) ( not ( = ?auto_784324 ?auto_784327 ) ) ( not ( = ?auto_784324 ?auto_784328 ) ) ( not ( = ?auto_784324 ?auto_784329 ) ) ( not ( = ?auto_784324 ?auto_784330 ) ) ( not ( = ?auto_784324 ?auto_784331 ) ) ( not ( = ?auto_784325 ?auto_784326 ) ) ( not ( = ?auto_784325 ?auto_784327 ) ) ( not ( = ?auto_784325 ?auto_784328 ) ) ( not ( = ?auto_784325 ?auto_784329 ) ) ( not ( = ?auto_784325 ?auto_784330 ) ) ( not ( = ?auto_784325 ?auto_784331 ) ) ( not ( = ?auto_784326 ?auto_784327 ) ) ( not ( = ?auto_784326 ?auto_784328 ) ) ( not ( = ?auto_784326 ?auto_784329 ) ) ( not ( = ?auto_784326 ?auto_784330 ) ) ( not ( = ?auto_784326 ?auto_784331 ) ) ( not ( = ?auto_784327 ?auto_784328 ) ) ( not ( = ?auto_784327 ?auto_784329 ) ) ( not ( = ?auto_784327 ?auto_784330 ) ) ( not ( = ?auto_784327 ?auto_784331 ) ) ( not ( = ?auto_784328 ?auto_784329 ) ) ( not ( = ?auto_784328 ?auto_784330 ) ) ( not ( = ?auto_784328 ?auto_784331 ) ) ( not ( = ?auto_784329 ?auto_784330 ) ) ( not ( = ?auto_784329 ?auto_784331 ) ) ( not ( = ?auto_784330 ?auto_784331 ) ) ( CLEAR ?auto_784328 ) ( ON ?auto_784329 ?auto_784330 ) ( CLEAR ?auto_784329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_784323 ?auto_784324 ?auto_784325 ?auto_784326 ?auto_784327 ?auto_784328 ?auto_784329 )
      ( MAKE-8PILE ?auto_784323 ?auto_784324 ?auto_784325 ?auto_784326 ?auto_784327 ?auto_784328 ?auto_784329 ?auto_784330 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_784357 - BLOCK
      ?auto_784358 - BLOCK
      ?auto_784359 - BLOCK
      ?auto_784360 - BLOCK
      ?auto_784361 - BLOCK
      ?auto_784362 - BLOCK
      ?auto_784363 - BLOCK
      ?auto_784364 - BLOCK
    )
    :vars
    (
      ?auto_784365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784364 ?auto_784365 ) ( ON-TABLE ?auto_784357 ) ( ON ?auto_784358 ?auto_784357 ) ( ON ?auto_784359 ?auto_784358 ) ( ON ?auto_784360 ?auto_784359 ) ( ON ?auto_784361 ?auto_784360 ) ( not ( = ?auto_784357 ?auto_784358 ) ) ( not ( = ?auto_784357 ?auto_784359 ) ) ( not ( = ?auto_784357 ?auto_784360 ) ) ( not ( = ?auto_784357 ?auto_784361 ) ) ( not ( = ?auto_784357 ?auto_784362 ) ) ( not ( = ?auto_784357 ?auto_784363 ) ) ( not ( = ?auto_784357 ?auto_784364 ) ) ( not ( = ?auto_784357 ?auto_784365 ) ) ( not ( = ?auto_784358 ?auto_784359 ) ) ( not ( = ?auto_784358 ?auto_784360 ) ) ( not ( = ?auto_784358 ?auto_784361 ) ) ( not ( = ?auto_784358 ?auto_784362 ) ) ( not ( = ?auto_784358 ?auto_784363 ) ) ( not ( = ?auto_784358 ?auto_784364 ) ) ( not ( = ?auto_784358 ?auto_784365 ) ) ( not ( = ?auto_784359 ?auto_784360 ) ) ( not ( = ?auto_784359 ?auto_784361 ) ) ( not ( = ?auto_784359 ?auto_784362 ) ) ( not ( = ?auto_784359 ?auto_784363 ) ) ( not ( = ?auto_784359 ?auto_784364 ) ) ( not ( = ?auto_784359 ?auto_784365 ) ) ( not ( = ?auto_784360 ?auto_784361 ) ) ( not ( = ?auto_784360 ?auto_784362 ) ) ( not ( = ?auto_784360 ?auto_784363 ) ) ( not ( = ?auto_784360 ?auto_784364 ) ) ( not ( = ?auto_784360 ?auto_784365 ) ) ( not ( = ?auto_784361 ?auto_784362 ) ) ( not ( = ?auto_784361 ?auto_784363 ) ) ( not ( = ?auto_784361 ?auto_784364 ) ) ( not ( = ?auto_784361 ?auto_784365 ) ) ( not ( = ?auto_784362 ?auto_784363 ) ) ( not ( = ?auto_784362 ?auto_784364 ) ) ( not ( = ?auto_784362 ?auto_784365 ) ) ( not ( = ?auto_784363 ?auto_784364 ) ) ( not ( = ?auto_784363 ?auto_784365 ) ) ( not ( = ?auto_784364 ?auto_784365 ) ) ( ON ?auto_784363 ?auto_784364 ) ( CLEAR ?auto_784361 ) ( ON ?auto_784362 ?auto_784363 ) ( CLEAR ?auto_784362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_784357 ?auto_784358 ?auto_784359 ?auto_784360 ?auto_784361 ?auto_784362 )
      ( MAKE-8PILE ?auto_784357 ?auto_784358 ?auto_784359 ?auto_784360 ?auto_784361 ?auto_784362 ?auto_784363 ?auto_784364 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_784391 - BLOCK
      ?auto_784392 - BLOCK
      ?auto_784393 - BLOCK
      ?auto_784394 - BLOCK
      ?auto_784395 - BLOCK
      ?auto_784396 - BLOCK
      ?auto_784397 - BLOCK
      ?auto_784398 - BLOCK
    )
    :vars
    (
      ?auto_784399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784398 ?auto_784399 ) ( ON-TABLE ?auto_784391 ) ( ON ?auto_784392 ?auto_784391 ) ( ON ?auto_784393 ?auto_784392 ) ( ON ?auto_784394 ?auto_784393 ) ( not ( = ?auto_784391 ?auto_784392 ) ) ( not ( = ?auto_784391 ?auto_784393 ) ) ( not ( = ?auto_784391 ?auto_784394 ) ) ( not ( = ?auto_784391 ?auto_784395 ) ) ( not ( = ?auto_784391 ?auto_784396 ) ) ( not ( = ?auto_784391 ?auto_784397 ) ) ( not ( = ?auto_784391 ?auto_784398 ) ) ( not ( = ?auto_784391 ?auto_784399 ) ) ( not ( = ?auto_784392 ?auto_784393 ) ) ( not ( = ?auto_784392 ?auto_784394 ) ) ( not ( = ?auto_784392 ?auto_784395 ) ) ( not ( = ?auto_784392 ?auto_784396 ) ) ( not ( = ?auto_784392 ?auto_784397 ) ) ( not ( = ?auto_784392 ?auto_784398 ) ) ( not ( = ?auto_784392 ?auto_784399 ) ) ( not ( = ?auto_784393 ?auto_784394 ) ) ( not ( = ?auto_784393 ?auto_784395 ) ) ( not ( = ?auto_784393 ?auto_784396 ) ) ( not ( = ?auto_784393 ?auto_784397 ) ) ( not ( = ?auto_784393 ?auto_784398 ) ) ( not ( = ?auto_784393 ?auto_784399 ) ) ( not ( = ?auto_784394 ?auto_784395 ) ) ( not ( = ?auto_784394 ?auto_784396 ) ) ( not ( = ?auto_784394 ?auto_784397 ) ) ( not ( = ?auto_784394 ?auto_784398 ) ) ( not ( = ?auto_784394 ?auto_784399 ) ) ( not ( = ?auto_784395 ?auto_784396 ) ) ( not ( = ?auto_784395 ?auto_784397 ) ) ( not ( = ?auto_784395 ?auto_784398 ) ) ( not ( = ?auto_784395 ?auto_784399 ) ) ( not ( = ?auto_784396 ?auto_784397 ) ) ( not ( = ?auto_784396 ?auto_784398 ) ) ( not ( = ?auto_784396 ?auto_784399 ) ) ( not ( = ?auto_784397 ?auto_784398 ) ) ( not ( = ?auto_784397 ?auto_784399 ) ) ( not ( = ?auto_784398 ?auto_784399 ) ) ( ON ?auto_784397 ?auto_784398 ) ( ON ?auto_784396 ?auto_784397 ) ( CLEAR ?auto_784394 ) ( ON ?auto_784395 ?auto_784396 ) ( CLEAR ?auto_784395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_784391 ?auto_784392 ?auto_784393 ?auto_784394 ?auto_784395 )
      ( MAKE-8PILE ?auto_784391 ?auto_784392 ?auto_784393 ?auto_784394 ?auto_784395 ?auto_784396 ?auto_784397 ?auto_784398 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_784425 - BLOCK
      ?auto_784426 - BLOCK
      ?auto_784427 - BLOCK
      ?auto_784428 - BLOCK
      ?auto_784429 - BLOCK
      ?auto_784430 - BLOCK
      ?auto_784431 - BLOCK
      ?auto_784432 - BLOCK
    )
    :vars
    (
      ?auto_784433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784432 ?auto_784433 ) ( ON-TABLE ?auto_784425 ) ( ON ?auto_784426 ?auto_784425 ) ( ON ?auto_784427 ?auto_784426 ) ( not ( = ?auto_784425 ?auto_784426 ) ) ( not ( = ?auto_784425 ?auto_784427 ) ) ( not ( = ?auto_784425 ?auto_784428 ) ) ( not ( = ?auto_784425 ?auto_784429 ) ) ( not ( = ?auto_784425 ?auto_784430 ) ) ( not ( = ?auto_784425 ?auto_784431 ) ) ( not ( = ?auto_784425 ?auto_784432 ) ) ( not ( = ?auto_784425 ?auto_784433 ) ) ( not ( = ?auto_784426 ?auto_784427 ) ) ( not ( = ?auto_784426 ?auto_784428 ) ) ( not ( = ?auto_784426 ?auto_784429 ) ) ( not ( = ?auto_784426 ?auto_784430 ) ) ( not ( = ?auto_784426 ?auto_784431 ) ) ( not ( = ?auto_784426 ?auto_784432 ) ) ( not ( = ?auto_784426 ?auto_784433 ) ) ( not ( = ?auto_784427 ?auto_784428 ) ) ( not ( = ?auto_784427 ?auto_784429 ) ) ( not ( = ?auto_784427 ?auto_784430 ) ) ( not ( = ?auto_784427 ?auto_784431 ) ) ( not ( = ?auto_784427 ?auto_784432 ) ) ( not ( = ?auto_784427 ?auto_784433 ) ) ( not ( = ?auto_784428 ?auto_784429 ) ) ( not ( = ?auto_784428 ?auto_784430 ) ) ( not ( = ?auto_784428 ?auto_784431 ) ) ( not ( = ?auto_784428 ?auto_784432 ) ) ( not ( = ?auto_784428 ?auto_784433 ) ) ( not ( = ?auto_784429 ?auto_784430 ) ) ( not ( = ?auto_784429 ?auto_784431 ) ) ( not ( = ?auto_784429 ?auto_784432 ) ) ( not ( = ?auto_784429 ?auto_784433 ) ) ( not ( = ?auto_784430 ?auto_784431 ) ) ( not ( = ?auto_784430 ?auto_784432 ) ) ( not ( = ?auto_784430 ?auto_784433 ) ) ( not ( = ?auto_784431 ?auto_784432 ) ) ( not ( = ?auto_784431 ?auto_784433 ) ) ( not ( = ?auto_784432 ?auto_784433 ) ) ( ON ?auto_784431 ?auto_784432 ) ( ON ?auto_784430 ?auto_784431 ) ( ON ?auto_784429 ?auto_784430 ) ( CLEAR ?auto_784427 ) ( ON ?auto_784428 ?auto_784429 ) ( CLEAR ?auto_784428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_784425 ?auto_784426 ?auto_784427 ?auto_784428 )
      ( MAKE-8PILE ?auto_784425 ?auto_784426 ?auto_784427 ?auto_784428 ?auto_784429 ?auto_784430 ?auto_784431 ?auto_784432 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_784459 - BLOCK
      ?auto_784460 - BLOCK
      ?auto_784461 - BLOCK
      ?auto_784462 - BLOCK
      ?auto_784463 - BLOCK
      ?auto_784464 - BLOCK
      ?auto_784465 - BLOCK
      ?auto_784466 - BLOCK
    )
    :vars
    (
      ?auto_784467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784466 ?auto_784467 ) ( ON-TABLE ?auto_784459 ) ( ON ?auto_784460 ?auto_784459 ) ( not ( = ?auto_784459 ?auto_784460 ) ) ( not ( = ?auto_784459 ?auto_784461 ) ) ( not ( = ?auto_784459 ?auto_784462 ) ) ( not ( = ?auto_784459 ?auto_784463 ) ) ( not ( = ?auto_784459 ?auto_784464 ) ) ( not ( = ?auto_784459 ?auto_784465 ) ) ( not ( = ?auto_784459 ?auto_784466 ) ) ( not ( = ?auto_784459 ?auto_784467 ) ) ( not ( = ?auto_784460 ?auto_784461 ) ) ( not ( = ?auto_784460 ?auto_784462 ) ) ( not ( = ?auto_784460 ?auto_784463 ) ) ( not ( = ?auto_784460 ?auto_784464 ) ) ( not ( = ?auto_784460 ?auto_784465 ) ) ( not ( = ?auto_784460 ?auto_784466 ) ) ( not ( = ?auto_784460 ?auto_784467 ) ) ( not ( = ?auto_784461 ?auto_784462 ) ) ( not ( = ?auto_784461 ?auto_784463 ) ) ( not ( = ?auto_784461 ?auto_784464 ) ) ( not ( = ?auto_784461 ?auto_784465 ) ) ( not ( = ?auto_784461 ?auto_784466 ) ) ( not ( = ?auto_784461 ?auto_784467 ) ) ( not ( = ?auto_784462 ?auto_784463 ) ) ( not ( = ?auto_784462 ?auto_784464 ) ) ( not ( = ?auto_784462 ?auto_784465 ) ) ( not ( = ?auto_784462 ?auto_784466 ) ) ( not ( = ?auto_784462 ?auto_784467 ) ) ( not ( = ?auto_784463 ?auto_784464 ) ) ( not ( = ?auto_784463 ?auto_784465 ) ) ( not ( = ?auto_784463 ?auto_784466 ) ) ( not ( = ?auto_784463 ?auto_784467 ) ) ( not ( = ?auto_784464 ?auto_784465 ) ) ( not ( = ?auto_784464 ?auto_784466 ) ) ( not ( = ?auto_784464 ?auto_784467 ) ) ( not ( = ?auto_784465 ?auto_784466 ) ) ( not ( = ?auto_784465 ?auto_784467 ) ) ( not ( = ?auto_784466 ?auto_784467 ) ) ( ON ?auto_784465 ?auto_784466 ) ( ON ?auto_784464 ?auto_784465 ) ( ON ?auto_784463 ?auto_784464 ) ( ON ?auto_784462 ?auto_784463 ) ( CLEAR ?auto_784460 ) ( ON ?auto_784461 ?auto_784462 ) ( CLEAR ?auto_784461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_784459 ?auto_784460 ?auto_784461 )
      ( MAKE-8PILE ?auto_784459 ?auto_784460 ?auto_784461 ?auto_784462 ?auto_784463 ?auto_784464 ?auto_784465 ?auto_784466 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_784493 - BLOCK
      ?auto_784494 - BLOCK
      ?auto_784495 - BLOCK
      ?auto_784496 - BLOCK
      ?auto_784497 - BLOCK
      ?auto_784498 - BLOCK
      ?auto_784499 - BLOCK
      ?auto_784500 - BLOCK
    )
    :vars
    (
      ?auto_784501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784500 ?auto_784501 ) ( ON-TABLE ?auto_784493 ) ( not ( = ?auto_784493 ?auto_784494 ) ) ( not ( = ?auto_784493 ?auto_784495 ) ) ( not ( = ?auto_784493 ?auto_784496 ) ) ( not ( = ?auto_784493 ?auto_784497 ) ) ( not ( = ?auto_784493 ?auto_784498 ) ) ( not ( = ?auto_784493 ?auto_784499 ) ) ( not ( = ?auto_784493 ?auto_784500 ) ) ( not ( = ?auto_784493 ?auto_784501 ) ) ( not ( = ?auto_784494 ?auto_784495 ) ) ( not ( = ?auto_784494 ?auto_784496 ) ) ( not ( = ?auto_784494 ?auto_784497 ) ) ( not ( = ?auto_784494 ?auto_784498 ) ) ( not ( = ?auto_784494 ?auto_784499 ) ) ( not ( = ?auto_784494 ?auto_784500 ) ) ( not ( = ?auto_784494 ?auto_784501 ) ) ( not ( = ?auto_784495 ?auto_784496 ) ) ( not ( = ?auto_784495 ?auto_784497 ) ) ( not ( = ?auto_784495 ?auto_784498 ) ) ( not ( = ?auto_784495 ?auto_784499 ) ) ( not ( = ?auto_784495 ?auto_784500 ) ) ( not ( = ?auto_784495 ?auto_784501 ) ) ( not ( = ?auto_784496 ?auto_784497 ) ) ( not ( = ?auto_784496 ?auto_784498 ) ) ( not ( = ?auto_784496 ?auto_784499 ) ) ( not ( = ?auto_784496 ?auto_784500 ) ) ( not ( = ?auto_784496 ?auto_784501 ) ) ( not ( = ?auto_784497 ?auto_784498 ) ) ( not ( = ?auto_784497 ?auto_784499 ) ) ( not ( = ?auto_784497 ?auto_784500 ) ) ( not ( = ?auto_784497 ?auto_784501 ) ) ( not ( = ?auto_784498 ?auto_784499 ) ) ( not ( = ?auto_784498 ?auto_784500 ) ) ( not ( = ?auto_784498 ?auto_784501 ) ) ( not ( = ?auto_784499 ?auto_784500 ) ) ( not ( = ?auto_784499 ?auto_784501 ) ) ( not ( = ?auto_784500 ?auto_784501 ) ) ( ON ?auto_784499 ?auto_784500 ) ( ON ?auto_784498 ?auto_784499 ) ( ON ?auto_784497 ?auto_784498 ) ( ON ?auto_784496 ?auto_784497 ) ( ON ?auto_784495 ?auto_784496 ) ( CLEAR ?auto_784493 ) ( ON ?auto_784494 ?auto_784495 ) ( CLEAR ?auto_784494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_784493 ?auto_784494 )
      ( MAKE-8PILE ?auto_784493 ?auto_784494 ?auto_784495 ?auto_784496 ?auto_784497 ?auto_784498 ?auto_784499 ?auto_784500 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_784527 - BLOCK
      ?auto_784528 - BLOCK
      ?auto_784529 - BLOCK
      ?auto_784530 - BLOCK
      ?auto_784531 - BLOCK
      ?auto_784532 - BLOCK
      ?auto_784533 - BLOCK
      ?auto_784534 - BLOCK
    )
    :vars
    (
      ?auto_784535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784534 ?auto_784535 ) ( not ( = ?auto_784527 ?auto_784528 ) ) ( not ( = ?auto_784527 ?auto_784529 ) ) ( not ( = ?auto_784527 ?auto_784530 ) ) ( not ( = ?auto_784527 ?auto_784531 ) ) ( not ( = ?auto_784527 ?auto_784532 ) ) ( not ( = ?auto_784527 ?auto_784533 ) ) ( not ( = ?auto_784527 ?auto_784534 ) ) ( not ( = ?auto_784527 ?auto_784535 ) ) ( not ( = ?auto_784528 ?auto_784529 ) ) ( not ( = ?auto_784528 ?auto_784530 ) ) ( not ( = ?auto_784528 ?auto_784531 ) ) ( not ( = ?auto_784528 ?auto_784532 ) ) ( not ( = ?auto_784528 ?auto_784533 ) ) ( not ( = ?auto_784528 ?auto_784534 ) ) ( not ( = ?auto_784528 ?auto_784535 ) ) ( not ( = ?auto_784529 ?auto_784530 ) ) ( not ( = ?auto_784529 ?auto_784531 ) ) ( not ( = ?auto_784529 ?auto_784532 ) ) ( not ( = ?auto_784529 ?auto_784533 ) ) ( not ( = ?auto_784529 ?auto_784534 ) ) ( not ( = ?auto_784529 ?auto_784535 ) ) ( not ( = ?auto_784530 ?auto_784531 ) ) ( not ( = ?auto_784530 ?auto_784532 ) ) ( not ( = ?auto_784530 ?auto_784533 ) ) ( not ( = ?auto_784530 ?auto_784534 ) ) ( not ( = ?auto_784530 ?auto_784535 ) ) ( not ( = ?auto_784531 ?auto_784532 ) ) ( not ( = ?auto_784531 ?auto_784533 ) ) ( not ( = ?auto_784531 ?auto_784534 ) ) ( not ( = ?auto_784531 ?auto_784535 ) ) ( not ( = ?auto_784532 ?auto_784533 ) ) ( not ( = ?auto_784532 ?auto_784534 ) ) ( not ( = ?auto_784532 ?auto_784535 ) ) ( not ( = ?auto_784533 ?auto_784534 ) ) ( not ( = ?auto_784533 ?auto_784535 ) ) ( not ( = ?auto_784534 ?auto_784535 ) ) ( ON ?auto_784533 ?auto_784534 ) ( ON ?auto_784532 ?auto_784533 ) ( ON ?auto_784531 ?auto_784532 ) ( ON ?auto_784530 ?auto_784531 ) ( ON ?auto_784529 ?auto_784530 ) ( ON ?auto_784528 ?auto_784529 ) ( ON ?auto_784527 ?auto_784528 ) ( CLEAR ?auto_784527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_784527 )
      ( MAKE-8PILE ?auto_784527 ?auto_784528 ?auto_784529 ?auto_784530 ?auto_784531 ?auto_784532 ?auto_784533 ?auto_784534 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_784562 - BLOCK
      ?auto_784563 - BLOCK
      ?auto_784564 - BLOCK
      ?auto_784565 - BLOCK
      ?auto_784566 - BLOCK
      ?auto_784567 - BLOCK
      ?auto_784568 - BLOCK
      ?auto_784569 - BLOCK
      ?auto_784570 - BLOCK
    )
    :vars
    (
      ?auto_784571 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_784569 ) ( ON ?auto_784570 ?auto_784571 ) ( CLEAR ?auto_784570 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_784562 ) ( ON ?auto_784563 ?auto_784562 ) ( ON ?auto_784564 ?auto_784563 ) ( ON ?auto_784565 ?auto_784564 ) ( ON ?auto_784566 ?auto_784565 ) ( ON ?auto_784567 ?auto_784566 ) ( ON ?auto_784568 ?auto_784567 ) ( ON ?auto_784569 ?auto_784568 ) ( not ( = ?auto_784562 ?auto_784563 ) ) ( not ( = ?auto_784562 ?auto_784564 ) ) ( not ( = ?auto_784562 ?auto_784565 ) ) ( not ( = ?auto_784562 ?auto_784566 ) ) ( not ( = ?auto_784562 ?auto_784567 ) ) ( not ( = ?auto_784562 ?auto_784568 ) ) ( not ( = ?auto_784562 ?auto_784569 ) ) ( not ( = ?auto_784562 ?auto_784570 ) ) ( not ( = ?auto_784562 ?auto_784571 ) ) ( not ( = ?auto_784563 ?auto_784564 ) ) ( not ( = ?auto_784563 ?auto_784565 ) ) ( not ( = ?auto_784563 ?auto_784566 ) ) ( not ( = ?auto_784563 ?auto_784567 ) ) ( not ( = ?auto_784563 ?auto_784568 ) ) ( not ( = ?auto_784563 ?auto_784569 ) ) ( not ( = ?auto_784563 ?auto_784570 ) ) ( not ( = ?auto_784563 ?auto_784571 ) ) ( not ( = ?auto_784564 ?auto_784565 ) ) ( not ( = ?auto_784564 ?auto_784566 ) ) ( not ( = ?auto_784564 ?auto_784567 ) ) ( not ( = ?auto_784564 ?auto_784568 ) ) ( not ( = ?auto_784564 ?auto_784569 ) ) ( not ( = ?auto_784564 ?auto_784570 ) ) ( not ( = ?auto_784564 ?auto_784571 ) ) ( not ( = ?auto_784565 ?auto_784566 ) ) ( not ( = ?auto_784565 ?auto_784567 ) ) ( not ( = ?auto_784565 ?auto_784568 ) ) ( not ( = ?auto_784565 ?auto_784569 ) ) ( not ( = ?auto_784565 ?auto_784570 ) ) ( not ( = ?auto_784565 ?auto_784571 ) ) ( not ( = ?auto_784566 ?auto_784567 ) ) ( not ( = ?auto_784566 ?auto_784568 ) ) ( not ( = ?auto_784566 ?auto_784569 ) ) ( not ( = ?auto_784566 ?auto_784570 ) ) ( not ( = ?auto_784566 ?auto_784571 ) ) ( not ( = ?auto_784567 ?auto_784568 ) ) ( not ( = ?auto_784567 ?auto_784569 ) ) ( not ( = ?auto_784567 ?auto_784570 ) ) ( not ( = ?auto_784567 ?auto_784571 ) ) ( not ( = ?auto_784568 ?auto_784569 ) ) ( not ( = ?auto_784568 ?auto_784570 ) ) ( not ( = ?auto_784568 ?auto_784571 ) ) ( not ( = ?auto_784569 ?auto_784570 ) ) ( not ( = ?auto_784569 ?auto_784571 ) ) ( not ( = ?auto_784570 ?auto_784571 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_784570 ?auto_784571 )
      ( !STACK ?auto_784570 ?auto_784569 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_784600 - BLOCK
      ?auto_784601 - BLOCK
      ?auto_784602 - BLOCK
      ?auto_784603 - BLOCK
      ?auto_784604 - BLOCK
      ?auto_784605 - BLOCK
      ?auto_784606 - BLOCK
      ?auto_784607 - BLOCK
      ?auto_784608 - BLOCK
    )
    :vars
    (
      ?auto_784609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784608 ?auto_784609 ) ( ON-TABLE ?auto_784600 ) ( ON ?auto_784601 ?auto_784600 ) ( ON ?auto_784602 ?auto_784601 ) ( ON ?auto_784603 ?auto_784602 ) ( ON ?auto_784604 ?auto_784603 ) ( ON ?auto_784605 ?auto_784604 ) ( ON ?auto_784606 ?auto_784605 ) ( not ( = ?auto_784600 ?auto_784601 ) ) ( not ( = ?auto_784600 ?auto_784602 ) ) ( not ( = ?auto_784600 ?auto_784603 ) ) ( not ( = ?auto_784600 ?auto_784604 ) ) ( not ( = ?auto_784600 ?auto_784605 ) ) ( not ( = ?auto_784600 ?auto_784606 ) ) ( not ( = ?auto_784600 ?auto_784607 ) ) ( not ( = ?auto_784600 ?auto_784608 ) ) ( not ( = ?auto_784600 ?auto_784609 ) ) ( not ( = ?auto_784601 ?auto_784602 ) ) ( not ( = ?auto_784601 ?auto_784603 ) ) ( not ( = ?auto_784601 ?auto_784604 ) ) ( not ( = ?auto_784601 ?auto_784605 ) ) ( not ( = ?auto_784601 ?auto_784606 ) ) ( not ( = ?auto_784601 ?auto_784607 ) ) ( not ( = ?auto_784601 ?auto_784608 ) ) ( not ( = ?auto_784601 ?auto_784609 ) ) ( not ( = ?auto_784602 ?auto_784603 ) ) ( not ( = ?auto_784602 ?auto_784604 ) ) ( not ( = ?auto_784602 ?auto_784605 ) ) ( not ( = ?auto_784602 ?auto_784606 ) ) ( not ( = ?auto_784602 ?auto_784607 ) ) ( not ( = ?auto_784602 ?auto_784608 ) ) ( not ( = ?auto_784602 ?auto_784609 ) ) ( not ( = ?auto_784603 ?auto_784604 ) ) ( not ( = ?auto_784603 ?auto_784605 ) ) ( not ( = ?auto_784603 ?auto_784606 ) ) ( not ( = ?auto_784603 ?auto_784607 ) ) ( not ( = ?auto_784603 ?auto_784608 ) ) ( not ( = ?auto_784603 ?auto_784609 ) ) ( not ( = ?auto_784604 ?auto_784605 ) ) ( not ( = ?auto_784604 ?auto_784606 ) ) ( not ( = ?auto_784604 ?auto_784607 ) ) ( not ( = ?auto_784604 ?auto_784608 ) ) ( not ( = ?auto_784604 ?auto_784609 ) ) ( not ( = ?auto_784605 ?auto_784606 ) ) ( not ( = ?auto_784605 ?auto_784607 ) ) ( not ( = ?auto_784605 ?auto_784608 ) ) ( not ( = ?auto_784605 ?auto_784609 ) ) ( not ( = ?auto_784606 ?auto_784607 ) ) ( not ( = ?auto_784606 ?auto_784608 ) ) ( not ( = ?auto_784606 ?auto_784609 ) ) ( not ( = ?auto_784607 ?auto_784608 ) ) ( not ( = ?auto_784607 ?auto_784609 ) ) ( not ( = ?auto_784608 ?auto_784609 ) ) ( CLEAR ?auto_784606 ) ( ON ?auto_784607 ?auto_784608 ) ( CLEAR ?auto_784607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_784600 ?auto_784601 ?auto_784602 ?auto_784603 ?auto_784604 ?auto_784605 ?auto_784606 ?auto_784607 )
      ( MAKE-9PILE ?auto_784600 ?auto_784601 ?auto_784602 ?auto_784603 ?auto_784604 ?auto_784605 ?auto_784606 ?auto_784607 ?auto_784608 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_784638 - BLOCK
      ?auto_784639 - BLOCK
      ?auto_784640 - BLOCK
      ?auto_784641 - BLOCK
      ?auto_784642 - BLOCK
      ?auto_784643 - BLOCK
      ?auto_784644 - BLOCK
      ?auto_784645 - BLOCK
      ?auto_784646 - BLOCK
    )
    :vars
    (
      ?auto_784647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784646 ?auto_784647 ) ( ON-TABLE ?auto_784638 ) ( ON ?auto_784639 ?auto_784638 ) ( ON ?auto_784640 ?auto_784639 ) ( ON ?auto_784641 ?auto_784640 ) ( ON ?auto_784642 ?auto_784641 ) ( ON ?auto_784643 ?auto_784642 ) ( not ( = ?auto_784638 ?auto_784639 ) ) ( not ( = ?auto_784638 ?auto_784640 ) ) ( not ( = ?auto_784638 ?auto_784641 ) ) ( not ( = ?auto_784638 ?auto_784642 ) ) ( not ( = ?auto_784638 ?auto_784643 ) ) ( not ( = ?auto_784638 ?auto_784644 ) ) ( not ( = ?auto_784638 ?auto_784645 ) ) ( not ( = ?auto_784638 ?auto_784646 ) ) ( not ( = ?auto_784638 ?auto_784647 ) ) ( not ( = ?auto_784639 ?auto_784640 ) ) ( not ( = ?auto_784639 ?auto_784641 ) ) ( not ( = ?auto_784639 ?auto_784642 ) ) ( not ( = ?auto_784639 ?auto_784643 ) ) ( not ( = ?auto_784639 ?auto_784644 ) ) ( not ( = ?auto_784639 ?auto_784645 ) ) ( not ( = ?auto_784639 ?auto_784646 ) ) ( not ( = ?auto_784639 ?auto_784647 ) ) ( not ( = ?auto_784640 ?auto_784641 ) ) ( not ( = ?auto_784640 ?auto_784642 ) ) ( not ( = ?auto_784640 ?auto_784643 ) ) ( not ( = ?auto_784640 ?auto_784644 ) ) ( not ( = ?auto_784640 ?auto_784645 ) ) ( not ( = ?auto_784640 ?auto_784646 ) ) ( not ( = ?auto_784640 ?auto_784647 ) ) ( not ( = ?auto_784641 ?auto_784642 ) ) ( not ( = ?auto_784641 ?auto_784643 ) ) ( not ( = ?auto_784641 ?auto_784644 ) ) ( not ( = ?auto_784641 ?auto_784645 ) ) ( not ( = ?auto_784641 ?auto_784646 ) ) ( not ( = ?auto_784641 ?auto_784647 ) ) ( not ( = ?auto_784642 ?auto_784643 ) ) ( not ( = ?auto_784642 ?auto_784644 ) ) ( not ( = ?auto_784642 ?auto_784645 ) ) ( not ( = ?auto_784642 ?auto_784646 ) ) ( not ( = ?auto_784642 ?auto_784647 ) ) ( not ( = ?auto_784643 ?auto_784644 ) ) ( not ( = ?auto_784643 ?auto_784645 ) ) ( not ( = ?auto_784643 ?auto_784646 ) ) ( not ( = ?auto_784643 ?auto_784647 ) ) ( not ( = ?auto_784644 ?auto_784645 ) ) ( not ( = ?auto_784644 ?auto_784646 ) ) ( not ( = ?auto_784644 ?auto_784647 ) ) ( not ( = ?auto_784645 ?auto_784646 ) ) ( not ( = ?auto_784645 ?auto_784647 ) ) ( not ( = ?auto_784646 ?auto_784647 ) ) ( ON ?auto_784645 ?auto_784646 ) ( CLEAR ?auto_784643 ) ( ON ?auto_784644 ?auto_784645 ) ( CLEAR ?auto_784644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_784638 ?auto_784639 ?auto_784640 ?auto_784641 ?auto_784642 ?auto_784643 ?auto_784644 )
      ( MAKE-9PILE ?auto_784638 ?auto_784639 ?auto_784640 ?auto_784641 ?auto_784642 ?auto_784643 ?auto_784644 ?auto_784645 ?auto_784646 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_784676 - BLOCK
      ?auto_784677 - BLOCK
      ?auto_784678 - BLOCK
      ?auto_784679 - BLOCK
      ?auto_784680 - BLOCK
      ?auto_784681 - BLOCK
      ?auto_784682 - BLOCK
      ?auto_784683 - BLOCK
      ?auto_784684 - BLOCK
    )
    :vars
    (
      ?auto_784685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784684 ?auto_784685 ) ( ON-TABLE ?auto_784676 ) ( ON ?auto_784677 ?auto_784676 ) ( ON ?auto_784678 ?auto_784677 ) ( ON ?auto_784679 ?auto_784678 ) ( ON ?auto_784680 ?auto_784679 ) ( not ( = ?auto_784676 ?auto_784677 ) ) ( not ( = ?auto_784676 ?auto_784678 ) ) ( not ( = ?auto_784676 ?auto_784679 ) ) ( not ( = ?auto_784676 ?auto_784680 ) ) ( not ( = ?auto_784676 ?auto_784681 ) ) ( not ( = ?auto_784676 ?auto_784682 ) ) ( not ( = ?auto_784676 ?auto_784683 ) ) ( not ( = ?auto_784676 ?auto_784684 ) ) ( not ( = ?auto_784676 ?auto_784685 ) ) ( not ( = ?auto_784677 ?auto_784678 ) ) ( not ( = ?auto_784677 ?auto_784679 ) ) ( not ( = ?auto_784677 ?auto_784680 ) ) ( not ( = ?auto_784677 ?auto_784681 ) ) ( not ( = ?auto_784677 ?auto_784682 ) ) ( not ( = ?auto_784677 ?auto_784683 ) ) ( not ( = ?auto_784677 ?auto_784684 ) ) ( not ( = ?auto_784677 ?auto_784685 ) ) ( not ( = ?auto_784678 ?auto_784679 ) ) ( not ( = ?auto_784678 ?auto_784680 ) ) ( not ( = ?auto_784678 ?auto_784681 ) ) ( not ( = ?auto_784678 ?auto_784682 ) ) ( not ( = ?auto_784678 ?auto_784683 ) ) ( not ( = ?auto_784678 ?auto_784684 ) ) ( not ( = ?auto_784678 ?auto_784685 ) ) ( not ( = ?auto_784679 ?auto_784680 ) ) ( not ( = ?auto_784679 ?auto_784681 ) ) ( not ( = ?auto_784679 ?auto_784682 ) ) ( not ( = ?auto_784679 ?auto_784683 ) ) ( not ( = ?auto_784679 ?auto_784684 ) ) ( not ( = ?auto_784679 ?auto_784685 ) ) ( not ( = ?auto_784680 ?auto_784681 ) ) ( not ( = ?auto_784680 ?auto_784682 ) ) ( not ( = ?auto_784680 ?auto_784683 ) ) ( not ( = ?auto_784680 ?auto_784684 ) ) ( not ( = ?auto_784680 ?auto_784685 ) ) ( not ( = ?auto_784681 ?auto_784682 ) ) ( not ( = ?auto_784681 ?auto_784683 ) ) ( not ( = ?auto_784681 ?auto_784684 ) ) ( not ( = ?auto_784681 ?auto_784685 ) ) ( not ( = ?auto_784682 ?auto_784683 ) ) ( not ( = ?auto_784682 ?auto_784684 ) ) ( not ( = ?auto_784682 ?auto_784685 ) ) ( not ( = ?auto_784683 ?auto_784684 ) ) ( not ( = ?auto_784683 ?auto_784685 ) ) ( not ( = ?auto_784684 ?auto_784685 ) ) ( ON ?auto_784683 ?auto_784684 ) ( ON ?auto_784682 ?auto_784683 ) ( CLEAR ?auto_784680 ) ( ON ?auto_784681 ?auto_784682 ) ( CLEAR ?auto_784681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_784676 ?auto_784677 ?auto_784678 ?auto_784679 ?auto_784680 ?auto_784681 )
      ( MAKE-9PILE ?auto_784676 ?auto_784677 ?auto_784678 ?auto_784679 ?auto_784680 ?auto_784681 ?auto_784682 ?auto_784683 ?auto_784684 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_784714 - BLOCK
      ?auto_784715 - BLOCK
      ?auto_784716 - BLOCK
      ?auto_784717 - BLOCK
      ?auto_784718 - BLOCK
      ?auto_784719 - BLOCK
      ?auto_784720 - BLOCK
      ?auto_784721 - BLOCK
      ?auto_784722 - BLOCK
    )
    :vars
    (
      ?auto_784723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784722 ?auto_784723 ) ( ON-TABLE ?auto_784714 ) ( ON ?auto_784715 ?auto_784714 ) ( ON ?auto_784716 ?auto_784715 ) ( ON ?auto_784717 ?auto_784716 ) ( not ( = ?auto_784714 ?auto_784715 ) ) ( not ( = ?auto_784714 ?auto_784716 ) ) ( not ( = ?auto_784714 ?auto_784717 ) ) ( not ( = ?auto_784714 ?auto_784718 ) ) ( not ( = ?auto_784714 ?auto_784719 ) ) ( not ( = ?auto_784714 ?auto_784720 ) ) ( not ( = ?auto_784714 ?auto_784721 ) ) ( not ( = ?auto_784714 ?auto_784722 ) ) ( not ( = ?auto_784714 ?auto_784723 ) ) ( not ( = ?auto_784715 ?auto_784716 ) ) ( not ( = ?auto_784715 ?auto_784717 ) ) ( not ( = ?auto_784715 ?auto_784718 ) ) ( not ( = ?auto_784715 ?auto_784719 ) ) ( not ( = ?auto_784715 ?auto_784720 ) ) ( not ( = ?auto_784715 ?auto_784721 ) ) ( not ( = ?auto_784715 ?auto_784722 ) ) ( not ( = ?auto_784715 ?auto_784723 ) ) ( not ( = ?auto_784716 ?auto_784717 ) ) ( not ( = ?auto_784716 ?auto_784718 ) ) ( not ( = ?auto_784716 ?auto_784719 ) ) ( not ( = ?auto_784716 ?auto_784720 ) ) ( not ( = ?auto_784716 ?auto_784721 ) ) ( not ( = ?auto_784716 ?auto_784722 ) ) ( not ( = ?auto_784716 ?auto_784723 ) ) ( not ( = ?auto_784717 ?auto_784718 ) ) ( not ( = ?auto_784717 ?auto_784719 ) ) ( not ( = ?auto_784717 ?auto_784720 ) ) ( not ( = ?auto_784717 ?auto_784721 ) ) ( not ( = ?auto_784717 ?auto_784722 ) ) ( not ( = ?auto_784717 ?auto_784723 ) ) ( not ( = ?auto_784718 ?auto_784719 ) ) ( not ( = ?auto_784718 ?auto_784720 ) ) ( not ( = ?auto_784718 ?auto_784721 ) ) ( not ( = ?auto_784718 ?auto_784722 ) ) ( not ( = ?auto_784718 ?auto_784723 ) ) ( not ( = ?auto_784719 ?auto_784720 ) ) ( not ( = ?auto_784719 ?auto_784721 ) ) ( not ( = ?auto_784719 ?auto_784722 ) ) ( not ( = ?auto_784719 ?auto_784723 ) ) ( not ( = ?auto_784720 ?auto_784721 ) ) ( not ( = ?auto_784720 ?auto_784722 ) ) ( not ( = ?auto_784720 ?auto_784723 ) ) ( not ( = ?auto_784721 ?auto_784722 ) ) ( not ( = ?auto_784721 ?auto_784723 ) ) ( not ( = ?auto_784722 ?auto_784723 ) ) ( ON ?auto_784721 ?auto_784722 ) ( ON ?auto_784720 ?auto_784721 ) ( ON ?auto_784719 ?auto_784720 ) ( CLEAR ?auto_784717 ) ( ON ?auto_784718 ?auto_784719 ) ( CLEAR ?auto_784718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_784714 ?auto_784715 ?auto_784716 ?auto_784717 ?auto_784718 )
      ( MAKE-9PILE ?auto_784714 ?auto_784715 ?auto_784716 ?auto_784717 ?auto_784718 ?auto_784719 ?auto_784720 ?auto_784721 ?auto_784722 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_784752 - BLOCK
      ?auto_784753 - BLOCK
      ?auto_784754 - BLOCK
      ?auto_784755 - BLOCK
      ?auto_784756 - BLOCK
      ?auto_784757 - BLOCK
      ?auto_784758 - BLOCK
      ?auto_784759 - BLOCK
      ?auto_784760 - BLOCK
    )
    :vars
    (
      ?auto_784761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784760 ?auto_784761 ) ( ON-TABLE ?auto_784752 ) ( ON ?auto_784753 ?auto_784752 ) ( ON ?auto_784754 ?auto_784753 ) ( not ( = ?auto_784752 ?auto_784753 ) ) ( not ( = ?auto_784752 ?auto_784754 ) ) ( not ( = ?auto_784752 ?auto_784755 ) ) ( not ( = ?auto_784752 ?auto_784756 ) ) ( not ( = ?auto_784752 ?auto_784757 ) ) ( not ( = ?auto_784752 ?auto_784758 ) ) ( not ( = ?auto_784752 ?auto_784759 ) ) ( not ( = ?auto_784752 ?auto_784760 ) ) ( not ( = ?auto_784752 ?auto_784761 ) ) ( not ( = ?auto_784753 ?auto_784754 ) ) ( not ( = ?auto_784753 ?auto_784755 ) ) ( not ( = ?auto_784753 ?auto_784756 ) ) ( not ( = ?auto_784753 ?auto_784757 ) ) ( not ( = ?auto_784753 ?auto_784758 ) ) ( not ( = ?auto_784753 ?auto_784759 ) ) ( not ( = ?auto_784753 ?auto_784760 ) ) ( not ( = ?auto_784753 ?auto_784761 ) ) ( not ( = ?auto_784754 ?auto_784755 ) ) ( not ( = ?auto_784754 ?auto_784756 ) ) ( not ( = ?auto_784754 ?auto_784757 ) ) ( not ( = ?auto_784754 ?auto_784758 ) ) ( not ( = ?auto_784754 ?auto_784759 ) ) ( not ( = ?auto_784754 ?auto_784760 ) ) ( not ( = ?auto_784754 ?auto_784761 ) ) ( not ( = ?auto_784755 ?auto_784756 ) ) ( not ( = ?auto_784755 ?auto_784757 ) ) ( not ( = ?auto_784755 ?auto_784758 ) ) ( not ( = ?auto_784755 ?auto_784759 ) ) ( not ( = ?auto_784755 ?auto_784760 ) ) ( not ( = ?auto_784755 ?auto_784761 ) ) ( not ( = ?auto_784756 ?auto_784757 ) ) ( not ( = ?auto_784756 ?auto_784758 ) ) ( not ( = ?auto_784756 ?auto_784759 ) ) ( not ( = ?auto_784756 ?auto_784760 ) ) ( not ( = ?auto_784756 ?auto_784761 ) ) ( not ( = ?auto_784757 ?auto_784758 ) ) ( not ( = ?auto_784757 ?auto_784759 ) ) ( not ( = ?auto_784757 ?auto_784760 ) ) ( not ( = ?auto_784757 ?auto_784761 ) ) ( not ( = ?auto_784758 ?auto_784759 ) ) ( not ( = ?auto_784758 ?auto_784760 ) ) ( not ( = ?auto_784758 ?auto_784761 ) ) ( not ( = ?auto_784759 ?auto_784760 ) ) ( not ( = ?auto_784759 ?auto_784761 ) ) ( not ( = ?auto_784760 ?auto_784761 ) ) ( ON ?auto_784759 ?auto_784760 ) ( ON ?auto_784758 ?auto_784759 ) ( ON ?auto_784757 ?auto_784758 ) ( ON ?auto_784756 ?auto_784757 ) ( CLEAR ?auto_784754 ) ( ON ?auto_784755 ?auto_784756 ) ( CLEAR ?auto_784755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_784752 ?auto_784753 ?auto_784754 ?auto_784755 )
      ( MAKE-9PILE ?auto_784752 ?auto_784753 ?auto_784754 ?auto_784755 ?auto_784756 ?auto_784757 ?auto_784758 ?auto_784759 ?auto_784760 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_784790 - BLOCK
      ?auto_784791 - BLOCK
      ?auto_784792 - BLOCK
      ?auto_784793 - BLOCK
      ?auto_784794 - BLOCK
      ?auto_784795 - BLOCK
      ?auto_784796 - BLOCK
      ?auto_784797 - BLOCK
      ?auto_784798 - BLOCK
    )
    :vars
    (
      ?auto_784799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784798 ?auto_784799 ) ( ON-TABLE ?auto_784790 ) ( ON ?auto_784791 ?auto_784790 ) ( not ( = ?auto_784790 ?auto_784791 ) ) ( not ( = ?auto_784790 ?auto_784792 ) ) ( not ( = ?auto_784790 ?auto_784793 ) ) ( not ( = ?auto_784790 ?auto_784794 ) ) ( not ( = ?auto_784790 ?auto_784795 ) ) ( not ( = ?auto_784790 ?auto_784796 ) ) ( not ( = ?auto_784790 ?auto_784797 ) ) ( not ( = ?auto_784790 ?auto_784798 ) ) ( not ( = ?auto_784790 ?auto_784799 ) ) ( not ( = ?auto_784791 ?auto_784792 ) ) ( not ( = ?auto_784791 ?auto_784793 ) ) ( not ( = ?auto_784791 ?auto_784794 ) ) ( not ( = ?auto_784791 ?auto_784795 ) ) ( not ( = ?auto_784791 ?auto_784796 ) ) ( not ( = ?auto_784791 ?auto_784797 ) ) ( not ( = ?auto_784791 ?auto_784798 ) ) ( not ( = ?auto_784791 ?auto_784799 ) ) ( not ( = ?auto_784792 ?auto_784793 ) ) ( not ( = ?auto_784792 ?auto_784794 ) ) ( not ( = ?auto_784792 ?auto_784795 ) ) ( not ( = ?auto_784792 ?auto_784796 ) ) ( not ( = ?auto_784792 ?auto_784797 ) ) ( not ( = ?auto_784792 ?auto_784798 ) ) ( not ( = ?auto_784792 ?auto_784799 ) ) ( not ( = ?auto_784793 ?auto_784794 ) ) ( not ( = ?auto_784793 ?auto_784795 ) ) ( not ( = ?auto_784793 ?auto_784796 ) ) ( not ( = ?auto_784793 ?auto_784797 ) ) ( not ( = ?auto_784793 ?auto_784798 ) ) ( not ( = ?auto_784793 ?auto_784799 ) ) ( not ( = ?auto_784794 ?auto_784795 ) ) ( not ( = ?auto_784794 ?auto_784796 ) ) ( not ( = ?auto_784794 ?auto_784797 ) ) ( not ( = ?auto_784794 ?auto_784798 ) ) ( not ( = ?auto_784794 ?auto_784799 ) ) ( not ( = ?auto_784795 ?auto_784796 ) ) ( not ( = ?auto_784795 ?auto_784797 ) ) ( not ( = ?auto_784795 ?auto_784798 ) ) ( not ( = ?auto_784795 ?auto_784799 ) ) ( not ( = ?auto_784796 ?auto_784797 ) ) ( not ( = ?auto_784796 ?auto_784798 ) ) ( not ( = ?auto_784796 ?auto_784799 ) ) ( not ( = ?auto_784797 ?auto_784798 ) ) ( not ( = ?auto_784797 ?auto_784799 ) ) ( not ( = ?auto_784798 ?auto_784799 ) ) ( ON ?auto_784797 ?auto_784798 ) ( ON ?auto_784796 ?auto_784797 ) ( ON ?auto_784795 ?auto_784796 ) ( ON ?auto_784794 ?auto_784795 ) ( ON ?auto_784793 ?auto_784794 ) ( CLEAR ?auto_784791 ) ( ON ?auto_784792 ?auto_784793 ) ( CLEAR ?auto_784792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_784790 ?auto_784791 ?auto_784792 )
      ( MAKE-9PILE ?auto_784790 ?auto_784791 ?auto_784792 ?auto_784793 ?auto_784794 ?auto_784795 ?auto_784796 ?auto_784797 ?auto_784798 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_784828 - BLOCK
      ?auto_784829 - BLOCK
      ?auto_784830 - BLOCK
      ?auto_784831 - BLOCK
      ?auto_784832 - BLOCK
      ?auto_784833 - BLOCK
      ?auto_784834 - BLOCK
      ?auto_784835 - BLOCK
      ?auto_784836 - BLOCK
    )
    :vars
    (
      ?auto_784837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784836 ?auto_784837 ) ( ON-TABLE ?auto_784828 ) ( not ( = ?auto_784828 ?auto_784829 ) ) ( not ( = ?auto_784828 ?auto_784830 ) ) ( not ( = ?auto_784828 ?auto_784831 ) ) ( not ( = ?auto_784828 ?auto_784832 ) ) ( not ( = ?auto_784828 ?auto_784833 ) ) ( not ( = ?auto_784828 ?auto_784834 ) ) ( not ( = ?auto_784828 ?auto_784835 ) ) ( not ( = ?auto_784828 ?auto_784836 ) ) ( not ( = ?auto_784828 ?auto_784837 ) ) ( not ( = ?auto_784829 ?auto_784830 ) ) ( not ( = ?auto_784829 ?auto_784831 ) ) ( not ( = ?auto_784829 ?auto_784832 ) ) ( not ( = ?auto_784829 ?auto_784833 ) ) ( not ( = ?auto_784829 ?auto_784834 ) ) ( not ( = ?auto_784829 ?auto_784835 ) ) ( not ( = ?auto_784829 ?auto_784836 ) ) ( not ( = ?auto_784829 ?auto_784837 ) ) ( not ( = ?auto_784830 ?auto_784831 ) ) ( not ( = ?auto_784830 ?auto_784832 ) ) ( not ( = ?auto_784830 ?auto_784833 ) ) ( not ( = ?auto_784830 ?auto_784834 ) ) ( not ( = ?auto_784830 ?auto_784835 ) ) ( not ( = ?auto_784830 ?auto_784836 ) ) ( not ( = ?auto_784830 ?auto_784837 ) ) ( not ( = ?auto_784831 ?auto_784832 ) ) ( not ( = ?auto_784831 ?auto_784833 ) ) ( not ( = ?auto_784831 ?auto_784834 ) ) ( not ( = ?auto_784831 ?auto_784835 ) ) ( not ( = ?auto_784831 ?auto_784836 ) ) ( not ( = ?auto_784831 ?auto_784837 ) ) ( not ( = ?auto_784832 ?auto_784833 ) ) ( not ( = ?auto_784832 ?auto_784834 ) ) ( not ( = ?auto_784832 ?auto_784835 ) ) ( not ( = ?auto_784832 ?auto_784836 ) ) ( not ( = ?auto_784832 ?auto_784837 ) ) ( not ( = ?auto_784833 ?auto_784834 ) ) ( not ( = ?auto_784833 ?auto_784835 ) ) ( not ( = ?auto_784833 ?auto_784836 ) ) ( not ( = ?auto_784833 ?auto_784837 ) ) ( not ( = ?auto_784834 ?auto_784835 ) ) ( not ( = ?auto_784834 ?auto_784836 ) ) ( not ( = ?auto_784834 ?auto_784837 ) ) ( not ( = ?auto_784835 ?auto_784836 ) ) ( not ( = ?auto_784835 ?auto_784837 ) ) ( not ( = ?auto_784836 ?auto_784837 ) ) ( ON ?auto_784835 ?auto_784836 ) ( ON ?auto_784834 ?auto_784835 ) ( ON ?auto_784833 ?auto_784834 ) ( ON ?auto_784832 ?auto_784833 ) ( ON ?auto_784831 ?auto_784832 ) ( ON ?auto_784830 ?auto_784831 ) ( CLEAR ?auto_784828 ) ( ON ?auto_784829 ?auto_784830 ) ( CLEAR ?auto_784829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_784828 ?auto_784829 )
      ( MAKE-9PILE ?auto_784828 ?auto_784829 ?auto_784830 ?auto_784831 ?auto_784832 ?auto_784833 ?auto_784834 ?auto_784835 ?auto_784836 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_784866 - BLOCK
      ?auto_784867 - BLOCK
      ?auto_784868 - BLOCK
      ?auto_784869 - BLOCK
      ?auto_784870 - BLOCK
      ?auto_784871 - BLOCK
      ?auto_784872 - BLOCK
      ?auto_784873 - BLOCK
      ?auto_784874 - BLOCK
    )
    :vars
    (
      ?auto_784875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784874 ?auto_784875 ) ( not ( = ?auto_784866 ?auto_784867 ) ) ( not ( = ?auto_784866 ?auto_784868 ) ) ( not ( = ?auto_784866 ?auto_784869 ) ) ( not ( = ?auto_784866 ?auto_784870 ) ) ( not ( = ?auto_784866 ?auto_784871 ) ) ( not ( = ?auto_784866 ?auto_784872 ) ) ( not ( = ?auto_784866 ?auto_784873 ) ) ( not ( = ?auto_784866 ?auto_784874 ) ) ( not ( = ?auto_784866 ?auto_784875 ) ) ( not ( = ?auto_784867 ?auto_784868 ) ) ( not ( = ?auto_784867 ?auto_784869 ) ) ( not ( = ?auto_784867 ?auto_784870 ) ) ( not ( = ?auto_784867 ?auto_784871 ) ) ( not ( = ?auto_784867 ?auto_784872 ) ) ( not ( = ?auto_784867 ?auto_784873 ) ) ( not ( = ?auto_784867 ?auto_784874 ) ) ( not ( = ?auto_784867 ?auto_784875 ) ) ( not ( = ?auto_784868 ?auto_784869 ) ) ( not ( = ?auto_784868 ?auto_784870 ) ) ( not ( = ?auto_784868 ?auto_784871 ) ) ( not ( = ?auto_784868 ?auto_784872 ) ) ( not ( = ?auto_784868 ?auto_784873 ) ) ( not ( = ?auto_784868 ?auto_784874 ) ) ( not ( = ?auto_784868 ?auto_784875 ) ) ( not ( = ?auto_784869 ?auto_784870 ) ) ( not ( = ?auto_784869 ?auto_784871 ) ) ( not ( = ?auto_784869 ?auto_784872 ) ) ( not ( = ?auto_784869 ?auto_784873 ) ) ( not ( = ?auto_784869 ?auto_784874 ) ) ( not ( = ?auto_784869 ?auto_784875 ) ) ( not ( = ?auto_784870 ?auto_784871 ) ) ( not ( = ?auto_784870 ?auto_784872 ) ) ( not ( = ?auto_784870 ?auto_784873 ) ) ( not ( = ?auto_784870 ?auto_784874 ) ) ( not ( = ?auto_784870 ?auto_784875 ) ) ( not ( = ?auto_784871 ?auto_784872 ) ) ( not ( = ?auto_784871 ?auto_784873 ) ) ( not ( = ?auto_784871 ?auto_784874 ) ) ( not ( = ?auto_784871 ?auto_784875 ) ) ( not ( = ?auto_784872 ?auto_784873 ) ) ( not ( = ?auto_784872 ?auto_784874 ) ) ( not ( = ?auto_784872 ?auto_784875 ) ) ( not ( = ?auto_784873 ?auto_784874 ) ) ( not ( = ?auto_784873 ?auto_784875 ) ) ( not ( = ?auto_784874 ?auto_784875 ) ) ( ON ?auto_784873 ?auto_784874 ) ( ON ?auto_784872 ?auto_784873 ) ( ON ?auto_784871 ?auto_784872 ) ( ON ?auto_784870 ?auto_784871 ) ( ON ?auto_784869 ?auto_784870 ) ( ON ?auto_784868 ?auto_784869 ) ( ON ?auto_784867 ?auto_784868 ) ( ON ?auto_784866 ?auto_784867 ) ( CLEAR ?auto_784866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_784866 )
      ( MAKE-9PILE ?auto_784866 ?auto_784867 ?auto_784868 ?auto_784869 ?auto_784870 ?auto_784871 ?auto_784872 ?auto_784873 ?auto_784874 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_784905 - BLOCK
      ?auto_784906 - BLOCK
      ?auto_784907 - BLOCK
      ?auto_784908 - BLOCK
      ?auto_784909 - BLOCK
      ?auto_784910 - BLOCK
      ?auto_784911 - BLOCK
      ?auto_784912 - BLOCK
      ?auto_784913 - BLOCK
      ?auto_784914 - BLOCK
    )
    :vars
    (
      ?auto_784915 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_784913 ) ( ON ?auto_784914 ?auto_784915 ) ( CLEAR ?auto_784914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_784905 ) ( ON ?auto_784906 ?auto_784905 ) ( ON ?auto_784907 ?auto_784906 ) ( ON ?auto_784908 ?auto_784907 ) ( ON ?auto_784909 ?auto_784908 ) ( ON ?auto_784910 ?auto_784909 ) ( ON ?auto_784911 ?auto_784910 ) ( ON ?auto_784912 ?auto_784911 ) ( ON ?auto_784913 ?auto_784912 ) ( not ( = ?auto_784905 ?auto_784906 ) ) ( not ( = ?auto_784905 ?auto_784907 ) ) ( not ( = ?auto_784905 ?auto_784908 ) ) ( not ( = ?auto_784905 ?auto_784909 ) ) ( not ( = ?auto_784905 ?auto_784910 ) ) ( not ( = ?auto_784905 ?auto_784911 ) ) ( not ( = ?auto_784905 ?auto_784912 ) ) ( not ( = ?auto_784905 ?auto_784913 ) ) ( not ( = ?auto_784905 ?auto_784914 ) ) ( not ( = ?auto_784905 ?auto_784915 ) ) ( not ( = ?auto_784906 ?auto_784907 ) ) ( not ( = ?auto_784906 ?auto_784908 ) ) ( not ( = ?auto_784906 ?auto_784909 ) ) ( not ( = ?auto_784906 ?auto_784910 ) ) ( not ( = ?auto_784906 ?auto_784911 ) ) ( not ( = ?auto_784906 ?auto_784912 ) ) ( not ( = ?auto_784906 ?auto_784913 ) ) ( not ( = ?auto_784906 ?auto_784914 ) ) ( not ( = ?auto_784906 ?auto_784915 ) ) ( not ( = ?auto_784907 ?auto_784908 ) ) ( not ( = ?auto_784907 ?auto_784909 ) ) ( not ( = ?auto_784907 ?auto_784910 ) ) ( not ( = ?auto_784907 ?auto_784911 ) ) ( not ( = ?auto_784907 ?auto_784912 ) ) ( not ( = ?auto_784907 ?auto_784913 ) ) ( not ( = ?auto_784907 ?auto_784914 ) ) ( not ( = ?auto_784907 ?auto_784915 ) ) ( not ( = ?auto_784908 ?auto_784909 ) ) ( not ( = ?auto_784908 ?auto_784910 ) ) ( not ( = ?auto_784908 ?auto_784911 ) ) ( not ( = ?auto_784908 ?auto_784912 ) ) ( not ( = ?auto_784908 ?auto_784913 ) ) ( not ( = ?auto_784908 ?auto_784914 ) ) ( not ( = ?auto_784908 ?auto_784915 ) ) ( not ( = ?auto_784909 ?auto_784910 ) ) ( not ( = ?auto_784909 ?auto_784911 ) ) ( not ( = ?auto_784909 ?auto_784912 ) ) ( not ( = ?auto_784909 ?auto_784913 ) ) ( not ( = ?auto_784909 ?auto_784914 ) ) ( not ( = ?auto_784909 ?auto_784915 ) ) ( not ( = ?auto_784910 ?auto_784911 ) ) ( not ( = ?auto_784910 ?auto_784912 ) ) ( not ( = ?auto_784910 ?auto_784913 ) ) ( not ( = ?auto_784910 ?auto_784914 ) ) ( not ( = ?auto_784910 ?auto_784915 ) ) ( not ( = ?auto_784911 ?auto_784912 ) ) ( not ( = ?auto_784911 ?auto_784913 ) ) ( not ( = ?auto_784911 ?auto_784914 ) ) ( not ( = ?auto_784911 ?auto_784915 ) ) ( not ( = ?auto_784912 ?auto_784913 ) ) ( not ( = ?auto_784912 ?auto_784914 ) ) ( not ( = ?auto_784912 ?auto_784915 ) ) ( not ( = ?auto_784913 ?auto_784914 ) ) ( not ( = ?auto_784913 ?auto_784915 ) ) ( not ( = ?auto_784914 ?auto_784915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_784914 ?auto_784915 )
      ( !STACK ?auto_784914 ?auto_784913 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_784947 - BLOCK
      ?auto_784948 - BLOCK
      ?auto_784949 - BLOCK
      ?auto_784950 - BLOCK
      ?auto_784951 - BLOCK
      ?auto_784952 - BLOCK
      ?auto_784953 - BLOCK
      ?auto_784954 - BLOCK
      ?auto_784955 - BLOCK
      ?auto_784956 - BLOCK
    )
    :vars
    (
      ?auto_784957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784956 ?auto_784957 ) ( ON-TABLE ?auto_784947 ) ( ON ?auto_784948 ?auto_784947 ) ( ON ?auto_784949 ?auto_784948 ) ( ON ?auto_784950 ?auto_784949 ) ( ON ?auto_784951 ?auto_784950 ) ( ON ?auto_784952 ?auto_784951 ) ( ON ?auto_784953 ?auto_784952 ) ( ON ?auto_784954 ?auto_784953 ) ( not ( = ?auto_784947 ?auto_784948 ) ) ( not ( = ?auto_784947 ?auto_784949 ) ) ( not ( = ?auto_784947 ?auto_784950 ) ) ( not ( = ?auto_784947 ?auto_784951 ) ) ( not ( = ?auto_784947 ?auto_784952 ) ) ( not ( = ?auto_784947 ?auto_784953 ) ) ( not ( = ?auto_784947 ?auto_784954 ) ) ( not ( = ?auto_784947 ?auto_784955 ) ) ( not ( = ?auto_784947 ?auto_784956 ) ) ( not ( = ?auto_784947 ?auto_784957 ) ) ( not ( = ?auto_784948 ?auto_784949 ) ) ( not ( = ?auto_784948 ?auto_784950 ) ) ( not ( = ?auto_784948 ?auto_784951 ) ) ( not ( = ?auto_784948 ?auto_784952 ) ) ( not ( = ?auto_784948 ?auto_784953 ) ) ( not ( = ?auto_784948 ?auto_784954 ) ) ( not ( = ?auto_784948 ?auto_784955 ) ) ( not ( = ?auto_784948 ?auto_784956 ) ) ( not ( = ?auto_784948 ?auto_784957 ) ) ( not ( = ?auto_784949 ?auto_784950 ) ) ( not ( = ?auto_784949 ?auto_784951 ) ) ( not ( = ?auto_784949 ?auto_784952 ) ) ( not ( = ?auto_784949 ?auto_784953 ) ) ( not ( = ?auto_784949 ?auto_784954 ) ) ( not ( = ?auto_784949 ?auto_784955 ) ) ( not ( = ?auto_784949 ?auto_784956 ) ) ( not ( = ?auto_784949 ?auto_784957 ) ) ( not ( = ?auto_784950 ?auto_784951 ) ) ( not ( = ?auto_784950 ?auto_784952 ) ) ( not ( = ?auto_784950 ?auto_784953 ) ) ( not ( = ?auto_784950 ?auto_784954 ) ) ( not ( = ?auto_784950 ?auto_784955 ) ) ( not ( = ?auto_784950 ?auto_784956 ) ) ( not ( = ?auto_784950 ?auto_784957 ) ) ( not ( = ?auto_784951 ?auto_784952 ) ) ( not ( = ?auto_784951 ?auto_784953 ) ) ( not ( = ?auto_784951 ?auto_784954 ) ) ( not ( = ?auto_784951 ?auto_784955 ) ) ( not ( = ?auto_784951 ?auto_784956 ) ) ( not ( = ?auto_784951 ?auto_784957 ) ) ( not ( = ?auto_784952 ?auto_784953 ) ) ( not ( = ?auto_784952 ?auto_784954 ) ) ( not ( = ?auto_784952 ?auto_784955 ) ) ( not ( = ?auto_784952 ?auto_784956 ) ) ( not ( = ?auto_784952 ?auto_784957 ) ) ( not ( = ?auto_784953 ?auto_784954 ) ) ( not ( = ?auto_784953 ?auto_784955 ) ) ( not ( = ?auto_784953 ?auto_784956 ) ) ( not ( = ?auto_784953 ?auto_784957 ) ) ( not ( = ?auto_784954 ?auto_784955 ) ) ( not ( = ?auto_784954 ?auto_784956 ) ) ( not ( = ?auto_784954 ?auto_784957 ) ) ( not ( = ?auto_784955 ?auto_784956 ) ) ( not ( = ?auto_784955 ?auto_784957 ) ) ( not ( = ?auto_784956 ?auto_784957 ) ) ( CLEAR ?auto_784954 ) ( ON ?auto_784955 ?auto_784956 ) ( CLEAR ?auto_784955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_784947 ?auto_784948 ?auto_784949 ?auto_784950 ?auto_784951 ?auto_784952 ?auto_784953 ?auto_784954 ?auto_784955 )
      ( MAKE-10PILE ?auto_784947 ?auto_784948 ?auto_784949 ?auto_784950 ?auto_784951 ?auto_784952 ?auto_784953 ?auto_784954 ?auto_784955 ?auto_784956 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_784989 - BLOCK
      ?auto_784990 - BLOCK
      ?auto_784991 - BLOCK
      ?auto_784992 - BLOCK
      ?auto_784993 - BLOCK
      ?auto_784994 - BLOCK
      ?auto_784995 - BLOCK
      ?auto_784996 - BLOCK
      ?auto_784997 - BLOCK
      ?auto_784998 - BLOCK
    )
    :vars
    (
      ?auto_784999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_784998 ?auto_784999 ) ( ON-TABLE ?auto_784989 ) ( ON ?auto_784990 ?auto_784989 ) ( ON ?auto_784991 ?auto_784990 ) ( ON ?auto_784992 ?auto_784991 ) ( ON ?auto_784993 ?auto_784992 ) ( ON ?auto_784994 ?auto_784993 ) ( ON ?auto_784995 ?auto_784994 ) ( not ( = ?auto_784989 ?auto_784990 ) ) ( not ( = ?auto_784989 ?auto_784991 ) ) ( not ( = ?auto_784989 ?auto_784992 ) ) ( not ( = ?auto_784989 ?auto_784993 ) ) ( not ( = ?auto_784989 ?auto_784994 ) ) ( not ( = ?auto_784989 ?auto_784995 ) ) ( not ( = ?auto_784989 ?auto_784996 ) ) ( not ( = ?auto_784989 ?auto_784997 ) ) ( not ( = ?auto_784989 ?auto_784998 ) ) ( not ( = ?auto_784989 ?auto_784999 ) ) ( not ( = ?auto_784990 ?auto_784991 ) ) ( not ( = ?auto_784990 ?auto_784992 ) ) ( not ( = ?auto_784990 ?auto_784993 ) ) ( not ( = ?auto_784990 ?auto_784994 ) ) ( not ( = ?auto_784990 ?auto_784995 ) ) ( not ( = ?auto_784990 ?auto_784996 ) ) ( not ( = ?auto_784990 ?auto_784997 ) ) ( not ( = ?auto_784990 ?auto_784998 ) ) ( not ( = ?auto_784990 ?auto_784999 ) ) ( not ( = ?auto_784991 ?auto_784992 ) ) ( not ( = ?auto_784991 ?auto_784993 ) ) ( not ( = ?auto_784991 ?auto_784994 ) ) ( not ( = ?auto_784991 ?auto_784995 ) ) ( not ( = ?auto_784991 ?auto_784996 ) ) ( not ( = ?auto_784991 ?auto_784997 ) ) ( not ( = ?auto_784991 ?auto_784998 ) ) ( not ( = ?auto_784991 ?auto_784999 ) ) ( not ( = ?auto_784992 ?auto_784993 ) ) ( not ( = ?auto_784992 ?auto_784994 ) ) ( not ( = ?auto_784992 ?auto_784995 ) ) ( not ( = ?auto_784992 ?auto_784996 ) ) ( not ( = ?auto_784992 ?auto_784997 ) ) ( not ( = ?auto_784992 ?auto_784998 ) ) ( not ( = ?auto_784992 ?auto_784999 ) ) ( not ( = ?auto_784993 ?auto_784994 ) ) ( not ( = ?auto_784993 ?auto_784995 ) ) ( not ( = ?auto_784993 ?auto_784996 ) ) ( not ( = ?auto_784993 ?auto_784997 ) ) ( not ( = ?auto_784993 ?auto_784998 ) ) ( not ( = ?auto_784993 ?auto_784999 ) ) ( not ( = ?auto_784994 ?auto_784995 ) ) ( not ( = ?auto_784994 ?auto_784996 ) ) ( not ( = ?auto_784994 ?auto_784997 ) ) ( not ( = ?auto_784994 ?auto_784998 ) ) ( not ( = ?auto_784994 ?auto_784999 ) ) ( not ( = ?auto_784995 ?auto_784996 ) ) ( not ( = ?auto_784995 ?auto_784997 ) ) ( not ( = ?auto_784995 ?auto_784998 ) ) ( not ( = ?auto_784995 ?auto_784999 ) ) ( not ( = ?auto_784996 ?auto_784997 ) ) ( not ( = ?auto_784996 ?auto_784998 ) ) ( not ( = ?auto_784996 ?auto_784999 ) ) ( not ( = ?auto_784997 ?auto_784998 ) ) ( not ( = ?auto_784997 ?auto_784999 ) ) ( not ( = ?auto_784998 ?auto_784999 ) ) ( ON ?auto_784997 ?auto_784998 ) ( CLEAR ?auto_784995 ) ( ON ?auto_784996 ?auto_784997 ) ( CLEAR ?auto_784996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_784989 ?auto_784990 ?auto_784991 ?auto_784992 ?auto_784993 ?auto_784994 ?auto_784995 ?auto_784996 )
      ( MAKE-10PILE ?auto_784989 ?auto_784990 ?auto_784991 ?auto_784992 ?auto_784993 ?auto_784994 ?auto_784995 ?auto_784996 ?auto_784997 ?auto_784998 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_785031 - BLOCK
      ?auto_785032 - BLOCK
      ?auto_785033 - BLOCK
      ?auto_785034 - BLOCK
      ?auto_785035 - BLOCK
      ?auto_785036 - BLOCK
      ?auto_785037 - BLOCK
      ?auto_785038 - BLOCK
      ?auto_785039 - BLOCK
      ?auto_785040 - BLOCK
    )
    :vars
    (
      ?auto_785041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785040 ?auto_785041 ) ( ON-TABLE ?auto_785031 ) ( ON ?auto_785032 ?auto_785031 ) ( ON ?auto_785033 ?auto_785032 ) ( ON ?auto_785034 ?auto_785033 ) ( ON ?auto_785035 ?auto_785034 ) ( ON ?auto_785036 ?auto_785035 ) ( not ( = ?auto_785031 ?auto_785032 ) ) ( not ( = ?auto_785031 ?auto_785033 ) ) ( not ( = ?auto_785031 ?auto_785034 ) ) ( not ( = ?auto_785031 ?auto_785035 ) ) ( not ( = ?auto_785031 ?auto_785036 ) ) ( not ( = ?auto_785031 ?auto_785037 ) ) ( not ( = ?auto_785031 ?auto_785038 ) ) ( not ( = ?auto_785031 ?auto_785039 ) ) ( not ( = ?auto_785031 ?auto_785040 ) ) ( not ( = ?auto_785031 ?auto_785041 ) ) ( not ( = ?auto_785032 ?auto_785033 ) ) ( not ( = ?auto_785032 ?auto_785034 ) ) ( not ( = ?auto_785032 ?auto_785035 ) ) ( not ( = ?auto_785032 ?auto_785036 ) ) ( not ( = ?auto_785032 ?auto_785037 ) ) ( not ( = ?auto_785032 ?auto_785038 ) ) ( not ( = ?auto_785032 ?auto_785039 ) ) ( not ( = ?auto_785032 ?auto_785040 ) ) ( not ( = ?auto_785032 ?auto_785041 ) ) ( not ( = ?auto_785033 ?auto_785034 ) ) ( not ( = ?auto_785033 ?auto_785035 ) ) ( not ( = ?auto_785033 ?auto_785036 ) ) ( not ( = ?auto_785033 ?auto_785037 ) ) ( not ( = ?auto_785033 ?auto_785038 ) ) ( not ( = ?auto_785033 ?auto_785039 ) ) ( not ( = ?auto_785033 ?auto_785040 ) ) ( not ( = ?auto_785033 ?auto_785041 ) ) ( not ( = ?auto_785034 ?auto_785035 ) ) ( not ( = ?auto_785034 ?auto_785036 ) ) ( not ( = ?auto_785034 ?auto_785037 ) ) ( not ( = ?auto_785034 ?auto_785038 ) ) ( not ( = ?auto_785034 ?auto_785039 ) ) ( not ( = ?auto_785034 ?auto_785040 ) ) ( not ( = ?auto_785034 ?auto_785041 ) ) ( not ( = ?auto_785035 ?auto_785036 ) ) ( not ( = ?auto_785035 ?auto_785037 ) ) ( not ( = ?auto_785035 ?auto_785038 ) ) ( not ( = ?auto_785035 ?auto_785039 ) ) ( not ( = ?auto_785035 ?auto_785040 ) ) ( not ( = ?auto_785035 ?auto_785041 ) ) ( not ( = ?auto_785036 ?auto_785037 ) ) ( not ( = ?auto_785036 ?auto_785038 ) ) ( not ( = ?auto_785036 ?auto_785039 ) ) ( not ( = ?auto_785036 ?auto_785040 ) ) ( not ( = ?auto_785036 ?auto_785041 ) ) ( not ( = ?auto_785037 ?auto_785038 ) ) ( not ( = ?auto_785037 ?auto_785039 ) ) ( not ( = ?auto_785037 ?auto_785040 ) ) ( not ( = ?auto_785037 ?auto_785041 ) ) ( not ( = ?auto_785038 ?auto_785039 ) ) ( not ( = ?auto_785038 ?auto_785040 ) ) ( not ( = ?auto_785038 ?auto_785041 ) ) ( not ( = ?auto_785039 ?auto_785040 ) ) ( not ( = ?auto_785039 ?auto_785041 ) ) ( not ( = ?auto_785040 ?auto_785041 ) ) ( ON ?auto_785039 ?auto_785040 ) ( ON ?auto_785038 ?auto_785039 ) ( CLEAR ?auto_785036 ) ( ON ?auto_785037 ?auto_785038 ) ( CLEAR ?auto_785037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_785031 ?auto_785032 ?auto_785033 ?auto_785034 ?auto_785035 ?auto_785036 ?auto_785037 )
      ( MAKE-10PILE ?auto_785031 ?auto_785032 ?auto_785033 ?auto_785034 ?auto_785035 ?auto_785036 ?auto_785037 ?auto_785038 ?auto_785039 ?auto_785040 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_785073 - BLOCK
      ?auto_785074 - BLOCK
      ?auto_785075 - BLOCK
      ?auto_785076 - BLOCK
      ?auto_785077 - BLOCK
      ?auto_785078 - BLOCK
      ?auto_785079 - BLOCK
      ?auto_785080 - BLOCK
      ?auto_785081 - BLOCK
      ?auto_785082 - BLOCK
    )
    :vars
    (
      ?auto_785083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785082 ?auto_785083 ) ( ON-TABLE ?auto_785073 ) ( ON ?auto_785074 ?auto_785073 ) ( ON ?auto_785075 ?auto_785074 ) ( ON ?auto_785076 ?auto_785075 ) ( ON ?auto_785077 ?auto_785076 ) ( not ( = ?auto_785073 ?auto_785074 ) ) ( not ( = ?auto_785073 ?auto_785075 ) ) ( not ( = ?auto_785073 ?auto_785076 ) ) ( not ( = ?auto_785073 ?auto_785077 ) ) ( not ( = ?auto_785073 ?auto_785078 ) ) ( not ( = ?auto_785073 ?auto_785079 ) ) ( not ( = ?auto_785073 ?auto_785080 ) ) ( not ( = ?auto_785073 ?auto_785081 ) ) ( not ( = ?auto_785073 ?auto_785082 ) ) ( not ( = ?auto_785073 ?auto_785083 ) ) ( not ( = ?auto_785074 ?auto_785075 ) ) ( not ( = ?auto_785074 ?auto_785076 ) ) ( not ( = ?auto_785074 ?auto_785077 ) ) ( not ( = ?auto_785074 ?auto_785078 ) ) ( not ( = ?auto_785074 ?auto_785079 ) ) ( not ( = ?auto_785074 ?auto_785080 ) ) ( not ( = ?auto_785074 ?auto_785081 ) ) ( not ( = ?auto_785074 ?auto_785082 ) ) ( not ( = ?auto_785074 ?auto_785083 ) ) ( not ( = ?auto_785075 ?auto_785076 ) ) ( not ( = ?auto_785075 ?auto_785077 ) ) ( not ( = ?auto_785075 ?auto_785078 ) ) ( not ( = ?auto_785075 ?auto_785079 ) ) ( not ( = ?auto_785075 ?auto_785080 ) ) ( not ( = ?auto_785075 ?auto_785081 ) ) ( not ( = ?auto_785075 ?auto_785082 ) ) ( not ( = ?auto_785075 ?auto_785083 ) ) ( not ( = ?auto_785076 ?auto_785077 ) ) ( not ( = ?auto_785076 ?auto_785078 ) ) ( not ( = ?auto_785076 ?auto_785079 ) ) ( not ( = ?auto_785076 ?auto_785080 ) ) ( not ( = ?auto_785076 ?auto_785081 ) ) ( not ( = ?auto_785076 ?auto_785082 ) ) ( not ( = ?auto_785076 ?auto_785083 ) ) ( not ( = ?auto_785077 ?auto_785078 ) ) ( not ( = ?auto_785077 ?auto_785079 ) ) ( not ( = ?auto_785077 ?auto_785080 ) ) ( not ( = ?auto_785077 ?auto_785081 ) ) ( not ( = ?auto_785077 ?auto_785082 ) ) ( not ( = ?auto_785077 ?auto_785083 ) ) ( not ( = ?auto_785078 ?auto_785079 ) ) ( not ( = ?auto_785078 ?auto_785080 ) ) ( not ( = ?auto_785078 ?auto_785081 ) ) ( not ( = ?auto_785078 ?auto_785082 ) ) ( not ( = ?auto_785078 ?auto_785083 ) ) ( not ( = ?auto_785079 ?auto_785080 ) ) ( not ( = ?auto_785079 ?auto_785081 ) ) ( not ( = ?auto_785079 ?auto_785082 ) ) ( not ( = ?auto_785079 ?auto_785083 ) ) ( not ( = ?auto_785080 ?auto_785081 ) ) ( not ( = ?auto_785080 ?auto_785082 ) ) ( not ( = ?auto_785080 ?auto_785083 ) ) ( not ( = ?auto_785081 ?auto_785082 ) ) ( not ( = ?auto_785081 ?auto_785083 ) ) ( not ( = ?auto_785082 ?auto_785083 ) ) ( ON ?auto_785081 ?auto_785082 ) ( ON ?auto_785080 ?auto_785081 ) ( ON ?auto_785079 ?auto_785080 ) ( CLEAR ?auto_785077 ) ( ON ?auto_785078 ?auto_785079 ) ( CLEAR ?auto_785078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_785073 ?auto_785074 ?auto_785075 ?auto_785076 ?auto_785077 ?auto_785078 )
      ( MAKE-10PILE ?auto_785073 ?auto_785074 ?auto_785075 ?auto_785076 ?auto_785077 ?auto_785078 ?auto_785079 ?auto_785080 ?auto_785081 ?auto_785082 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_785115 - BLOCK
      ?auto_785116 - BLOCK
      ?auto_785117 - BLOCK
      ?auto_785118 - BLOCK
      ?auto_785119 - BLOCK
      ?auto_785120 - BLOCK
      ?auto_785121 - BLOCK
      ?auto_785122 - BLOCK
      ?auto_785123 - BLOCK
      ?auto_785124 - BLOCK
    )
    :vars
    (
      ?auto_785125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785124 ?auto_785125 ) ( ON-TABLE ?auto_785115 ) ( ON ?auto_785116 ?auto_785115 ) ( ON ?auto_785117 ?auto_785116 ) ( ON ?auto_785118 ?auto_785117 ) ( not ( = ?auto_785115 ?auto_785116 ) ) ( not ( = ?auto_785115 ?auto_785117 ) ) ( not ( = ?auto_785115 ?auto_785118 ) ) ( not ( = ?auto_785115 ?auto_785119 ) ) ( not ( = ?auto_785115 ?auto_785120 ) ) ( not ( = ?auto_785115 ?auto_785121 ) ) ( not ( = ?auto_785115 ?auto_785122 ) ) ( not ( = ?auto_785115 ?auto_785123 ) ) ( not ( = ?auto_785115 ?auto_785124 ) ) ( not ( = ?auto_785115 ?auto_785125 ) ) ( not ( = ?auto_785116 ?auto_785117 ) ) ( not ( = ?auto_785116 ?auto_785118 ) ) ( not ( = ?auto_785116 ?auto_785119 ) ) ( not ( = ?auto_785116 ?auto_785120 ) ) ( not ( = ?auto_785116 ?auto_785121 ) ) ( not ( = ?auto_785116 ?auto_785122 ) ) ( not ( = ?auto_785116 ?auto_785123 ) ) ( not ( = ?auto_785116 ?auto_785124 ) ) ( not ( = ?auto_785116 ?auto_785125 ) ) ( not ( = ?auto_785117 ?auto_785118 ) ) ( not ( = ?auto_785117 ?auto_785119 ) ) ( not ( = ?auto_785117 ?auto_785120 ) ) ( not ( = ?auto_785117 ?auto_785121 ) ) ( not ( = ?auto_785117 ?auto_785122 ) ) ( not ( = ?auto_785117 ?auto_785123 ) ) ( not ( = ?auto_785117 ?auto_785124 ) ) ( not ( = ?auto_785117 ?auto_785125 ) ) ( not ( = ?auto_785118 ?auto_785119 ) ) ( not ( = ?auto_785118 ?auto_785120 ) ) ( not ( = ?auto_785118 ?auto_785121 ) ) ( not ( = ?auto_785118 ?auto_785122 ) ) ( not ( = ?auto_785118 ?auto_785123 ) ) ( not ( = ?auto_785118 ?auto_785124 ) ) ( not ( = ?auto_785118 ?auto_785125 ) ) ( not ( = ?auto_785119 ?auto_785120 ) ) ( not ( = ?auto_785119 ?auto_785121 ) ) ( not ( = ?auto_785119 ?auto_785122 ) ) ( not ( = ?auto_785119 ?auto_785123 ) ) ( not ( = ?auto_785119 ?auto_785124 ) ) ( not ( = ?auto_785119 ?auto_785125 ) ) ( not ( = ?auto_785120 ?auto_785121 ) ) ( not ( = ?auto_785120 ?auto_785122 ) ) ( not ( = ?auto_785120 ?auto_785123 ) ) ( not ( = ?auto_785120 ?auto_785124 ) ) ( not ( = ?auto_785120 ?auto_785125 ) ) ( not ( = ?auto_785121 ?auto_785122 ) ) ( not ( = ?auto_785121 ?auto_785123 ) ) ( not ( = ?auto_785121 ?auto_785124 ) ) ( not ( = ?auto_785121 ?auto_785125 ) ) ( not ( = ?auto_785122 ?auto_785123 ) ) ( not ( = ?auto_785122 ?auto_785124 ) ) ( not ( = ?auto_785122 ?auto_785125 ) ) ( not ( = ?auto_785123 ?auto_785124 ) ) ( not ( = ?auto_785123 ?auto_785125 ) ) ( not ( = ?auto_785124 ?auto_785125 ) ) ( ON ?auto_785123 ?auto_785124 ) ( ON ?auto_785122 ?auto_785123 ) ( ON ?auto_785121 ?auto_785122 ) ( ON ?auto_785120 ?auto_785121 ) ( CLEAR ?auto_785118 ) ( ON ?auto_785119 ?auto_785120 ) ( CLEAR ?auto_785119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_785115 ?auto_785116 ?auto_785117 ?auto_785118 ?auto_785119 )
      ( MAKE-10PILE ?auto_785115 ?auto_785116 ?auto_785117 ?auto_785118 ?auto_785119 ?auto_785120 ?auto_785121 ?auto_785122 ?auto_785123 ?auto_785124 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_785157 - BLOCK
      ?auto_785158 - BLOCK
      ?auto_785159 - BLOCK
      ?auto_785160 - BLOCK
      ?auto_785161 - BLOCK
      ?auto_785162 - BLOCK
      ?auto_785163 - BLOCK
      ?auto_785164 - BLOCK
      ?auto_785165 - BLOCK
      ?auto_785166 - BLOCK
    )
    :vars
    (
      ?auto_785167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785166 ?auto_785167 ) ( ON-TABLE ?auto_785157 ) ( ON ?auto_785158 ?auto_785157 ) ( ON ?auto_785159 ?auto_785158 ) ( not ( = ?auto_785157 ?auto_785158 ) ) ( not ( = ?auto_785157 ?auto_785159 ) ) ( not ( = ?auto_785157 ?auto_785160 ) ) ( not ( = ?auto_785157 ?auto_785161 ) ) ( not ( = ?auto_785157 ?auto_785162 ) ) ( not ( = ?auto_785157 ?auto_785163 ) ) ( not ( = ?auto_785157 ?auto_785164 ) ) ( not ( = ?auto_785157 ?auto_785165 ) ) ( not ( = ?auto_785157 ?auto_785166 ) ) ( not ( = ?auto_785157 ?auto_785167 ) ) ( not ( = ?auto_785158 ?auto_785159 ) ) ( not ( = ?auto_785158 ?auto_785160 ) ) ( not ( = ?auto_785158 ?auto_785161 ) ) ( not ( = ?auto_785158 ?auto_785162 ) ) ( not ( = ?auto_785158 ?auto_785163 ) ) ( not ( = ?auto_785158 ?auto_785164 ) ) ( not ( = ?auto_785158 ?auto_785165 ) ) ( not ( = ?auto_785158 ?auto_785166 ) ) ( not ( = ?auto_785158 ?auto_785167 ) ) ( not ( = ?auto_785159 ?auto_785160 ) ) ( not ( = ?auto_785159 ?auto_785161 ) ) ( not ( = ?auto_785159 ?auto_785162 ) ) ( not ( = ?auto_785159 ?auto_785163 ) ) ( not ( = ?auto_785159 ?auto_785164 ) ) ( not ( = ?auto_785159 ?auto_785165 ) ) ( not ( = ?auto_785159 ?auto_785166 ) ) ( not ( = ?auto_785159 ?auto_785167 ) ) ( not ( = ?auto_785160 ?auto_785161 ) ) ( not ( = ?auto_785160 ?auto_785162 ) ) ( not ( = ?auto_785160 ?auto_785163 ) ) ( not ( = ?auto_785160 ?auto_785164 ) ) ( not ( = ?auto_785160 ?auto_785165 ) ) ( not ( = ?auto_785160 ?auto_785166 ) ) ( not ( = ?auto_785160 ?auto_785167 ) ) ( not ( = ?auto_785161 ?auto_785162 ) ) ( not ( = ?auto_785161 ?auto_785163 ) ) ( not ( = ?auto_785161 ?auto_785164 ) ) ( not ( = ?auto_785161 ?auto_785165 ) ) ( not ( = ?auto_785161 ?auto_785166 ) ) ( not ( = ?auto_785161 ?auto_785167 ) ) ( not ( = ?auto_785162 ?auto_785163 ) ) ( not ( = ?auto_785162 ?auto_785164 ) ) ( not ( = ?auto_785162 ?auto_785165 ) ) ( not ( = ?auto_785162 ?auto_785166 ) ) ( not ( = ?auto_785162 ?auto_785167 ) ) ( not ( = ?auto_785163 ?auto_785164 ) ) ( not ( = ?auto_785163 ?auto_785165 ) ) ( not ( = ?auto_785163 ?auto_785166 ) ) ( not ( = ?auto_785163 ?auto_785167 ) ) ( not ( = ?auto_785164 ?auto_785165 ) ) ( not ( = ?auto_785164 ?auto_785166 ) ) ( not ( = ?auto_785164 ?auto_785167 ) ) ( not ( = ?auto_785165 ?auto_785166 ) ) ( not ( = ?auto_785165 ?auto_785167 ) ) ( not ( = ?auto_785166 ?auto_785167 ) ) ( ON ?auto_785165 ?auto_785166 ) ( ON ?auto_785164 ?auto_785165 ) ( ON ?auto_785163 ?auto_785164 ) ( ON ?auto_785162 ?auto_785163 ) ( ON ?auto_785161 ?auto_785162 ) ( CLEAR ?auto_785159 ) ( ON ?auto_785160 ?auto_785161 ) ( CLEAR ?auto_785160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_785157 ?auto_785158 ?auto_785159 ?auto_785160 )
      ( MAKE-10PILE ?auto_785157 ?auto_785158 ?auto_785159 ?auto_785160 ?auto_785161 ?auto_785162 ?auto_785163 ?auto_785164 ?auto_785165 ?auto_785166 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_785199 - BLOCK
      ?auto_785200 - BLOCK
      ?auto_785201 - BLOCK
      ?auto_785202 - BLOCK
      ?auto_785203 - BLOCK
      ?auto_785204 - BLOCK
      ?auto_785205 - BLOCK
      ?auto_785206 - BLOCK
      ?auto_785207 - BLOCK
      ?auto_785208 - BLOCK
    )
    :vars
    (
      ?auto_785209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785208 ?auto_785209 ) ( ON-TABLE ?auto_785199 ) ( ON ?auto_785200 ?auto_785199 ) ( not ( = ?auto_785199 ?auto_785200 ) ) ( not ( = ?auto_785199 ?auto_785201 ) ) ( not ( = ?auto_785199 ?auto_785202 ) ) ( not ( = ?auto_785199 ?auto_785203 ) ) ( not ( = ?auto_785199 ?auto_785204 ) ) ( not ( = ?auto_785199 ?auto_785205 ) ) ( not ( = ?auto_785199 ?auto_785206 ) ) ( not ( = ?auto_785199 ?auto_785207 ) ) ( not ( = ?auto_785199 ?auto_785208 ) ) ( not ( = ?auto_785199 ?auto_785209 ) ) ( not ( = ?auto_785200 ?auto_785201 ) ) ( not ( = ?auto_785200 ?auto_785202 ) ) ( not ( = ?auto_785200 ?auto_785203 ) ) ( not ( = ?auto_785200 ?auto_785204 ) ) ( not ( = ?auto_785200 ?auto_785205 ) ) ( not ( = ?auto_785200 ?auto_785206 ) ) ( not ( = ?auto_785200 ?auto_785207 ) ) ( not ( = ?auto_785200 ?auto_785208 ) ) ( not ( = ?auto_785200 ?auto_785209 ) ) ( not ( = ?auto_785201 ?auto_785202 ) ) ( not ( = ?auto_785201 ?auto_785203 ) ) ( not ( = ?auto_785201 ?auto_785204 ) ) ( not ( = ?auto_785201 ?auto_785205 ) ) ( not ( = ?auto_785201 ?auto_785206 ) ) ( not ( = ?auto_785201 ?auto_785207 ) ) ( not ( = ?auto_785201 ?auto_785208 ) ) ( not ( = ?auto_785201 ?auto_785209 ) ) ( not ( = ?auto_785202 ?auto_785203 ) ) ( not ( = ?auto_785202 ?auto_785204 ) ) ( not ( = ?auto_785202 ?auto_785205 ) ) ( not ( = ?auto_785202 ?auto_785206 ) ) ( not ( = ?auto_785202 ?auto_785207 ) ) ( not ( = ?auto_785202 ?auto_785208 ) ) ( not ( = ?auto_785202 ?auto_785209 ) ) ( not ( = ?auto_785203 ?auto_785204 ) ) ( not ( = ?auto_785203 ?auto_785205 ) ) ( not ( = ?auto_785203 ?auto_785206 ) ) ( not ( = ?auto_785203 ?auto_785207 ) ) ( not ( = ?auto_785203 ?auto_785208 ) ) ( not ( = ?auto_785203 ?auto_785209 ) ) ( not ( = ?auto_785204 ?auto_785205 ) ) ( not ( = ?auto_785204 ?auto_785206 ) ) ( not ( = ?auto_785204 ?auto_785207 ) ) ( not ( = ?auto_785204 ?auto_785208 ) ) ( not ( = ?auto_785204 ?auto_785209 ) ) ( not ( = ?auto_785205 ?auto_785206 ) ) ( not ( = ?auto_785205 ?auto_785207 ) ) ( not ( = ?auto_785205 ?auto_785208 ) ) ( not ( = ?auto_785205 ?auto_785209 ) ) ( not ( = ?auto_785206 ?auto_785207 ) ) ( not ( = ?auto_785206 ?auto_785208 ) ) ( not ( = ?auto_785206 ?auto_785209 ) ) ( not ( = ?auto_785207 ?auto_785208 ) ) ( not ( = ?auto_785207 ?auto_785209 ) ) ( not ( = ?auto_785208 ?auto_785209 ) ) ( ON ?auto_785207 ?auto_785208 ) ( ON ?auto_785206 ?auto_785207 ) ( ON ?auto_785205 ?auto_785206 ) ( ON ?auto_785204 ?auto_785205 ) ( ON ?auto_785203 ?auto_785204 ) ( ON ?auto_785202 ?auto_785203 ) ( CLEAR ?auto_785200 ) ( ON ?auto_785201 ?auto_785202 ) ( CLEAR ?auto_785201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_785199 ?auto_785200 ?auto_785201 )
      ( MAKE-10PILE ?auto_785199 ?auto_785200 ?auto_785201 ?auto_785202 ?auto_785203 ?auto_785204 ?auto_785205 ?auto_785206 ?auto_785207 ?auto_785208 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_785241 - BLOCK
      ?auto_785242 - BLOCK
      ?auto_785243 - BLOCK
      ?auto_785244 - BLOCK
      ?auto_785245 - BLOCK
      ?auto_785246 - BLOCK
      ?auto_785247 - BLOCK
      ?auto_785248 - BLOCK
      ?auto_785249 - BLOCK
      ?auto_785250 - BLOCK
    )
    :vars
    (
      ?auto_785251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785250 ?auto_785251 ) ( ON-TABLE ?auto_785241 ) ( not ( = ?auto_785241 ?auto_785242 ) ) ( not ( = ?auto_785241 ?auto_785243 ) ) ( not ( = ?auto_785241 ?auto_785244 ) ) ( not ( = ?auto_785241 ?auto_785245 ) ) ( not ( = ?auto_785241 ?auto_785246 ) ) ( not ( = ?auto_785241 ?auto_785247 ) ) ( not ( = ?auto_785241 ?auto_785248 ) ) ( not ( = ?auto_785241 ?auto_785249 ) ) ( not ( = ?auto_785241 ?auto_785250 ) ) ( not ( = ?auto_785241 ?auto_785251 ) ) ( not ( = ?auto_785242 ?auto_785243 ) ) ( not ( = ?auto_785242 ?auto_785244 ) ) ( not ( = ?auto_785242 ?auto_785245 ) ) ( not ( = ?auto_785242 ?auto_785246 ) ) ( not ( = ?auto_785242 ?auto_785247 ) ) ( not ( = ?auto_785242 ?auto_785248 ) ) ( not ( = ?auto_785242 ?auto_785249 ) ) ( not ( = ?auto_785242 ?auto_785250 ) ) ( not ( = ?auto_785242 ?auto_785251 ) ) ( not ( = ?auto_785243 ?auto_785244 ) ) ( not ( = ?auto_785243 ?auto_785245 ) ) ( not ( = ?auto_785243 ?auto_785246 ) ) ( not ( = ?auto_785243 ?auto_785247 ) ) ( not ( = ?auto_785243 ?auto_785248 ) ) ( not ( = ?auto_785243 ?auto_785249 ) ) ( not ( = ?auto_785243 ?auto_785250 ) ) ( not ( = ?auto_785243 ?auto_785251 ) ) ( not ( = ?auto_785244 ?auto_785245 ) ) ( not ( = ?auto_785244 ?auto_785246 ) ) ( not ( = ?auto_785244 ?auto_785247 ) ) ( not ( = ?auto_785244 ?auto_785248 ) ) ( not ( = ?auto_785244 ?auto_785249 ) ) ( not ( = ?auto_785244 ?auto_785250 ) ) ( not ( = ?auto_785244 ?auto_785251 ) ) ( not ( = ?auto_785245 ?auto_785246 ) ) ( not ( = ?auto_785245 ?auto_785247 ) ) ( not ( = ?auto_785245 ?auto_785248 ) ) ( not ( = ?auto_785245 ?auto_785249 ) ) ( not ( = ?auto_785245 ?auto_785250 ) ) ( not ( = ?auto_785245 ?auto_785251 ) ) ( not ( = ?auto_785246 ?auto_785247 ) ) ( not ( = ?auto_785246 ?auto_785248 ) ) ( not ( = ?auto_785246 ?auto_785249 ) ) ( not ( = ?auto_785246 ?auto_785250 ) ) ( not ( = ?auto_785246 ?auto_785251 ) ) ( not ( = ?auto_785247 ?auto_785248 ) ) ( not ( = ?auto_785247 ?auto_785249 ) ) ( not ( = ?auto_785247 ?auto_785250 ) ) ( not ( = ?auto_785247 ?auto_785251 ) ) ( not ( = ?auto_785248 ?auto_785249 ) ) ( not ( = ?auto_785248 ?auto_785250 ) ) ( not ( = ?auto_785248 ?auto_785251 ) ) ( not ( = ?auto_785249 ?auto_785250 ) ) ( not ( = ?auto_785249 ?auto_785251 ) ) ( not ( = ?auto_785250 ?auto_785251 ) ) ( ON ?auto_785249 ?auto_785250 ) ( ON ?auto_785248 ?auto_785249 ) ( ON ?auto_785247 ?auto_785248 ) ( ON ?auto_785246 ?auto_785247 ) ( ON ?auto_785245 ?auto_785246 ) ( ON ?auto_785244 ?auto_785245 ) ( ON ?auto_785243 ?auto_785244 ) ( CLEAR ?auto_785241 ) ( ON ?auto_785242 ?auto_785243 ) ( CLEAR ?auto_785242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_785241 ?auto_785242 )
      ( MAKE-10PILE ?auto_785241 ?auto_785242 ?auto_785243 ?auto_785244 ?auto_785245 ?auto_785246 ?auto_785247 ?auto_785248 ?auto_785249 ?auto_785250 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_785283 - BLOCK
      ?auto_785284 - BLOCK
      ?auto_785285 - BLOCK
      ?auto_785286 - BLOCK
      ?auto_785287 - BLOCK
      ?auto_785288 - BLOCK
      ?auto_785289 - BLOCK
      ?auto_785290 - BLOCK
      ?auto_785291 - BLOCK
      ?auto_785292 - BLOCK
    )
    :vars
    (
      ?auto_785293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785292 ?auto_785293 ) ( not ( = ?auto_785283 ?auto_785284 ) ) ( not ( = ?auto_785283 ?auto_785285 ) ) ( not ( = ?auto_785283 ?auto_785286 ) ) ( not ( = ?auto_785283 ?auto_785287 ) ) ( not ( = ?auto_785283 ?auto_785288 ) ) ( not ( = ?auto_785283 ?auto_785289 ) ) ( not ( = ?auto_785283 ?auto_785290 ) ) ( not ( = ?auto_785283 ?auto_785291 ) ) ( not ( = ?auto_785283 ?auto_785292 ) ) ( not ( = ?auto_785283 ?auto_785293 ) ) ( not ( = ?auto_785284 ?auto_785285 ) ) ( not ( = ?auto_785284 ?auto_785286 ) ) ( not ( = ?auto_785284 ?auto_785287 ) ) ( not ( = ?auto_785284 ?auto_785288 ) ) ( not ( = ?auto_785284 ?auto_785289 ) ) ( not ( = ?auto_785284 ?auto_785290 ) ) ( not ( = ?auto_785284 ?auto_785291 ) ) ( not ( = ?auto_785284 ?auto_785292 ) ) ( not ( = ?auto_785284 ?auto_785293 ) ) ( not ( = ?auto_785285 ?auto_785286 ) ) ( not ( = ?auto_785285 ?auto_785287 ) ) ( not ( = ?auto_785285 ?auto_785288 ) ) ( not ( = ?auto_785285 ?auto_785289 ) ) ( not ( = ?auto_785285 ?auto_785290 ) ) ( not ( = ?auto_785285 ?auto_785291 ) ) ( not ( = ?auto_785285 ?auto_785292 ) ) ( not ( = ?auto_785285 ?auto_785293 ) ) ( not ( = ?auto_785286 ?auto_785287 ) ) ( not ( = ?auto_785286 ?auto_785288 ) ) ( not ( = ?auto_785286 ?auto_785289 ) ) ( not ( = ?auto_785286 ?auto_785290 ) ) ( not ( = ?auto_785286 ?auto_785291 ) ) ( not ( = ?auto_785286 ?auto_785292 ) ) ( not ( = ?auto_785286 ?auto_785293 ) ) ( not ( = ?auto_785287 ?auto_785288 ) ) ( not ( = ?auto_785287 ?auto_785289 ) ) ( not ( = ?auto_785287 ?auto_785290 ) ) ( not ( = ?auto_785287 ?auto_785291 ) ) ( not ( = ?auto_785287 ?auto_785292 ) ) ( not ( = ?auto_785287 ?auto_785293 ) ) ( not ( = ?auto_785288 ?auto_785289 ) ) ( not ( = ?auto_785288 ?auto_785290 ) ) ( not ( = ?auto_785288 ?auto_785291 ) ) ( not ( = ?auto_785288 ?auto_785292 ) ) ( not ( = ?auto_785288 ?auto_785293 ) ) ( not ( = ?auto_785289 ?auto_785290 ) ) ( not ( = ?auto_785289 ?auto_785291 ) ) ( not ( = ?auto_785289 ?auto_785292 ) ) ( not ( = ?auto_785289 ?auto_785293 ) ) ( not ( = ?auto_785290 ?auto_785291 ) ) ( not ( = ?auto_785290 ?auto_785292 ) ) ( not ( = ?auto_785290 ?auto_785293 ) ) ( not ( = ?auto_785291 ?auto_785292 ) ) ( not ( = ?auto_785291 ?auto_785293 ) ) ( not ( = ?auto_785292 ?auto_785293 ) ) ( ON ?auto_785291 ?auto_785292 ) ( ON ?auto_785290 ?auto_785291 ) ( ON ?auto_785289 ?auto_785290 ) ( ON ?auto_785288 ?auto_785289 ) ( ON ?auto_785287 ?auto_785288 ) ( ON ?auto_785286 ?auto_785287 ) ( ON ?auto_785285 ?auto_785286 ) ( ON ?auto_785284 ?auto_785285 ) ( ON ?auto_785283 ?auto_785284 ) ( CLEAR ?auto_785283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_785283 )
      ( MAKE-10PILE ?auto_785283 ?auto_785284 ?auto_785285 ?auto_785286 ?auto_785287 ?auto_785288 ?auto_785289 ?auto_785290 ?auto_785291 ?auto_785292 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785326 - BLOCK
      ?auto_785327 - BLOCK
      ?auto_785328 - BLOCK
      ?auto_785329 - BLOCK
      ?auto_785330 - BLOCK
      ?auto_785331 - BLOCK
      ?auto_785332 - BLOCK
      ?auto_785333 - BLOCK
      ?auto_785334 - BLOCK
      ?auto_785335 - BLOCK
      ?auto_785336 - BLOCK
    )
    :vars
    (
      ?auto_785337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_785335 ) ( ON ?auto_785336 ?auto_785337 ) ( CLEAR ?auto_785336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_785326 ) ( ON ?auto_785327 ?auto_785326 ) ( ON ?auto_785328 ?auto_785327 ) ( ON ?auto_785329 ?auto_785328 ) ( ON ?auto_785330 ?auto_785329 ) ( ON ?auto_785331 ?auto_785330 ) ( ON ?auto_785332 ?auto_785331 ) ( ON ?auto_785333 ?auto_785332 ) ( ON ?auto_785334 ?auto_785333 ) ( ON ?auto_785335 ?auto_785334 ) ( not ( = ?auto_785326 ?auto_785327 ) ) ( not ( = ?auto_785326 ?auto_785328 ) ) ( not ( = ?auto_785326 ?auto_785329 ) ) ( not ( = ?auto_785326 ?auto_785330 ) ) ( not ( = ?auto_785326 ?auto_785331 ) ) ( not ( = ?auto_785326 ?auto_785332 ) ) ( not ( = ?auto_785326 ?auto_785333 ) ) ( not ( = ?auto_785326 ?auto_785334 ) ) ( not ( = ?auto_785326 ?auto_785335 ) ) ( not ( = ?auto_785326 ?auto_785336 ) ) ( not ( = ?auto_785326 ?auto_785337 ) ) ( not ( = ?auto_785327 ?auto_785328 ) ) ( not ( = ?auto_785327 ?auto_785329 ) ) ( not ( = ?auto_785327 ?auto_785330 ) ) ( not ( = ?auto_785327 ?auto_785331 ) ) ( not ( = ?auto_785327 ?auto_785332 ) ) ( not ( = ?auto_785327 ?auto_785333 ) ) ( not ( = ?auto_785327 ?auto_785334 ) ) ( not ( = ?auto_785327 ?auto_785335 ) ) ( not ( = ?auto_785327 ?auto_785336 ) ) ( not ( = ?auto_785327 ?auto_785337 ) ) ( not ( = ?auto_785328 ?auto_785329 ) ) ( not ( = ?auto_785328 ?auto_785330 ) ) ( not ( = ?auto_785328 ?auto_785331 ) ) ( not ( = ?auto_785328 ?auto_785332 ) ) ( not ( = ?auto_785328 ?auto_785333 ) ) ( not ( = ?auto_785328 ?auto_785334 ) ) ( not ( = ?auto_785328 ?auto_785335 ) ) ( not ( = ?auto_785328 ?auto_785336 ) ) ( not ( = ?auto_785328 ?auto_785337 ) ) ( not ( = ?auto_785329 ?auto_785330 ) ) ( not ( = ?auto_785329 ?auto_785331 ) ) ( not ( = ?auto_785329 ?auto_785332 ) ) ( not ( = ?auto_785329 ?auto_785333 ) ) ( not ( = ?auto_785329 ?auto_785334 ) ) ( not ( = ?auto_785329 ?auto_785335 ) ) ( not ( = ?auto_785329 ?auto_785336 ) ) ( not ( = ?auto_785329 ?auto_785337 ) ) ( not ( = ?auto_785330 ?auto_785331 ) ) ( not ( = ?auto_785330 ?auto_785332 ) ) ( not ( = ?auto_785330 ?auto_785333 ) ) ( not ( = ?auto_785330 ?auto_785334 ) ) ( not ( = ?auto_785330 ?auto_785335 ) ) ( not ( = ?auto_785330 ?auto_785336 ) ) ( not ( = ?auto_785330 ?auto_785337 ) ) ( not ( = ?auto_785331 ?auto_785332 ) ) ( not ( = ?auto_785331 ?auto_785333 ) ) ( not ( = ?auto_785331 ?auto_785334 ) ) ( not ( = ?auto_785331 ?auto_785335 ) ) ( not ( = ?auto_785331 ?auto_785336 ) ) ( not ( = ?auto_785331 ?auto_785337 ) ) ( not ( = ?auto_785332 ?auto_785333 ) ) ( not ( = ?auto_785332 ?auto_785334 ) ) ( not ( = ?auto_785332 ?auto_785335 ) ) ( not ( = ?auto_785332 ?auto_785336 ) ) ( not ( = ?auto_785332 ?auto_785337 ) ) ( not ( = ?auto_785333 ?auto_785334 ) ) ( not ( = ?auto_785333 ?auto_785335 ) ) ( not ( = ?auto_785333 ?auto_785336 ) ) ( not ( = ?auto_785333 ?auto_785337 ) ) ( not ( = ?auto_785334 ?auto_785335 ) ) ( not ( = ?auto_785334 ?auto_785336 ) ) ( not ( = ?auto_785334 ?auto_785337 ) ) ( not ( = ?auto_785335 ?auto_785336 ) ) ( not ( = ?auto_785335 ?auto_785337 ) ) ( not ( = ?auto_785336 ?auto_785337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_785336 ?auto_785337 )
      ( !STACK ?auto_785336 ?auto_785335 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785372 - BLOCK
      ?auto_785373 - BLOCK
      ?auto_785374 - BLOCK
      ?auto_785375 - BLOCK
      ?auto_785376 - BLOCK
      ?auto_785377 - BLOCK
      ?auto_785378 - BLOCK
      ?auto_785379 - BLOCK
      ?auto_785380 - BLOCK
      ?auto_785381 - BLOCK
      ?auto_785382 - BLOCK
    )
    :vars
    (
      ?auto_785383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785382 ?auto_785383 ) ( ON-TABLE ?auto_785372 ) ( ON ?auto_785373 ?auto_785372 ) ( ON ?auto_785374 ?auto_785373 ) ( ON ?auto_785375 ?auto_785374 ) ( ON ?auto_785376 ?auto_785375 ) ( ON ?auto_785377 ?auto_785376 ) ( ON ?auto_785378 ?auto_785377 ) ( ON ?auto_785379 ?auto_785378 ) ( ON ?auto_785380 ?auto_785379 ) ( not ( = ?auto_785372 ?auto_785373 ) ) ( not ( = ?auto_785372 ?auto_785374 ) ) ( not ( = ?auto_785372 ?auto_785375 ) ) ( not ( = ?auto_785372 ?auto_785376 ) ) ( not ( = ?auto_785372 ?auto_785377 ) ) ( not ( = ?auto_785372 ?auto_785378 ) ) ( not ( = ?auto_785372 ?auto_785379 ) ) ( not ( = ?auto_785372 ?auto_785380 ) ) ( not ( = ?auto_785372 ?auto_785381 ) ) ( not ( = ?auto_785372 ?auto_785382 ) ) ( not ( = ?auto_785372 ?auto_785383 ) ) ( not ( = ?auto_785373 ?auto_785374 ) ) ( not ( = ?auto_785373 ?auto_785375 ) ) ( not ( = ?auto_785373 ?auto_785376 ) ) ( not ( = ?auto_785373 ?auto_785377 ) ) ( not ( = ?auto_785373 ?auto_785378 ) ) ( not ( = ?auto_785373 ?auto_785379 ) ) ( not ( = ?auto_785373 ?auto_785380 ) ) ( not ( = ?auto_785373 ?auto_785381 ) ) ( not ( = ?auto_785373 ?auto_785382 ) ) ( not ( = ?auto_785373 ?auto_785383 ) ) ( not ( = ?auto_785374 ?auto_785375 ) ) ( not ( = ?auto_785374 ?auto_785376 ) ) ( not ( = ?auto_785374 ?auto_785377 ) ) ( not ( = ?auto_785374 ?auto_785378 ) ) ( not ( = ?auto_785374 ?auto_785379 ) ) ( not ( = ?auto_785374 ?auto_785380 ) ) ( not ( = ?auto_785374 ?auto_785381 ) ) ( not ( = ?auto_785374 ?auto_785382 ) ) ( not ( = ?auto_785374 ?auto_785383 ) ) ( not ( = ?auto_785375 ?auto_785376 ) ) ( not ( = ?auto_785375 ?auto_785377 ) ) ( not ( = ?auto_785375 ?auto_785378 ) ) ( not ( = ?auto_785375 ?auto_785379 ) ) ( not ( = ?auto_785375 ?auto_785380 ) ) ( not ( = ?auto_785375 ?auto_785381 ) ) ( not ( = ?auto_785375 ?auto_785382 ) ) ( not ( = ?auto_785375 ?auto_785383 ) ) ( not ( = ?auto_785376 ?auto_785377 ) ) ( not ( = ?auto_785376 ?auto_785378 ) ) ( not ( = ?auto_785376 ?auto_785379 ) ) ( not ( = ?auto_785376 ?auto_785380 ) ) ( not ( = ?auto_785376 ?auto_785381 ) ) ( not ( = ?auto_785376 ?auto_785382 ) ) ( not ( = ?auto_785376 ?auto_785383 ) ) ( not ( = ?auto_785377 ?auto_785378 ) ) ( not ( = ?auto_785377 ?auto_785379 ) ) ( not ( = ?auto_785377 ?auto_785380 ) ) ( not ( = ?auto_785377 ?auto_785381 ) ) ( not ( = ?auto_785377 ?auto_785382 ) ) ( not ( = ?auto_785377 ?auto_785383 ) ) ( not ( = ?auto_785378 ?auto_785379 ) ) ( not ( = ?auto_785378 ?auto_785380 ) ) ( not ( = ?auto_785378 ?auto_785381 ) ) ( not ( = ?auto_785378 ?auto_785382 ) ) ( not ( = ?auto_785378 ?auto_785383 ) ) ( not ( = ?auto_785379 ?auto_785380 ) ) ( not ( = ?auto_785379 ?auto_785381 ) ) ( not ( = ?auto_785379 ?auto_785382 ) ) ( not ( = ?auto_785379 ?auto_785383 ) ) ( not ( = ?auto_785380 ?auto_785381 ) ) ( not ( = ?auto_785380 ?auto_785382 ) ) ( not ( = ?auto_785380 ?auto_785383 ) ) ( not ( = ?auto_785381 ?auto_785382 ) ) ( not ( = ?auto_785381 ?auto_785383 ) ) ( not ( = ?auto_785382 ?auto_785383 ) ) ( CLEAR ?auto_785380 ) ( ON ?auto_785381 ?auto_785382 ) ( CLEAR ?auto_785381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_785372 ?auto_785373 ?auto_785374 ?auto_785375 ?auto_785376 ?auto_785377 ?auto_785378 ?auto_785379 ?auto_785380 ?auto_785381 )
      ( MAKE-11PILE ?auto_785372 ?auto_785373 ?auto_785374 ?auto_785375 ?auto_785376 ?auto_785377 ?auto_785378 ?auto_785379 ?auto_785380 ?auto_785381 ?auto_785382 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785418 - BLOCK
      ?auto_785419 - BLOCK
      ?auto_785420 - BLOCK
      ?auto_785421 - BLOCK
      ?auto_785422 - BLOCK
      ?auto_785423 - BLOCK
      ?auto_785424 - BLOCK
      ?auto_785425 - BLOCK
      ?auto_785426 - BLOCK
      ?auto_785427 - BLOCK
      ?auto_785428 - BLOCK
    )
    :vars
    (
      ?auto_785429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785428 ?auto_785429 ) ( ON-TABLE ?auto_785418 ) ( ON ?auto_785419 ?auto_785418 ) ( ON ?auto_785420 ?auto_785419 ) ( ON ?auto_785421 ?auto_785420 ) ( ON ?auto_785422 ?auto_785421 ) ( ON ?auto_785423 ?auto_785422 ) ( ON ?auto_785424 ?auto_785423 ) ( ON ?auto_785425 ?auto_785424 ) ( not ( = ?auto_785418 ?auto_785419 ) ) ( not ( = ?auto_785418 ?auto_785420 ) ) ( not ( = ?auto_785418 ?auto_785421 ) ) ( not ( = ?auto_785418 ?auto_785422 ) ) ( not ( = ?auto_785418 ?auto_785423 ) ) ( not ( = ?auto_785418 ?auto_785424 ) ) ( not ( = ?auto_785418 ?auto_785425 ) ) ( not ( = ?auto_785418 ?auto_785426 ) ) ( not ( = ?auto_785418 ?auto_785427 ) ) ( not ( = ?auto_785418 ?auto_785428 ) ) ( not ( = ?auto_785418 ?auto_785429 ) ) ( not ( = ?auto_785419 ?auto_785420 ) ) ( not ( = ?auto_785419 ?auto_785421 ) ) ( not ( = ?auto_785419 ?auto_785422 ) ) ( not ( = ?auto_785419 ?auto_785423 ) ) ( not ( = ?auto_785419 ?auto_785424 ) ) ( not ( = ?auto_785419 ?auto_785425 ) ) ( not ( = ?auto_785419 ?auto_785426 ) ) ( not ( = ?auto_785419 ?auto_785427 ) ) ( not ( = ?auto_785419 ?auto_785428 ) ) ( not ( = ?auto_785419 ?auto_785429 ) ) ( not ( = ?auto_785420 ?auto_785421 ) ) ( not ( = ?auto_785420 ?auto_785422 ) ) ( not ( = ?auto_785420 ?auto_785423 ) ) ( not ( = ?auto_785420 ?auto_785424 ) ) ( not ( = ?auto_785420 ?auto_785425 ) ) ( not ( = ?auto_785420 ?auto_785426 ) ) ( not ( = ?auto_785420 ?auto_785427 ) ) ( not ( = ?auto_785420 ?auto_785428 ) ) ( not ( = ?auto_785420 ?auto_785429 ) ) ( not ( = ?auto_785421 ?auto_785422 ) ) ( not ( = ?auto_785421 ?auto_785423 ) ) ( not ( = ?auto_785421 ?auto_785424 ) ) ( not ( = ?auto_785421 ?auto_785425 ) ) ( not ( = ?auto_785421 ?auto_785426 ) ) ( not ( = ?auto_785421 ?auto_785427 ) ) ( not ( = ?auto_785421 ?auto_785428 ) ) ( not ( = ?auto_785421 ?auto_785429 ) ) ( not ( = ?auto_785422 ?auto_785423 ) ) ( not ( = ?auto_785422 ?auto_785424 ) ) ( not ( = ?auto_785422 ?auto_785425 ) ) ( not ( = ?auto_785422 ?auto_785426 ) ) ( not ( = ?auto_785422 ?auto_785427 ) ) ( not ( = ?auto_785422 ?auto_785428 ) ) ( not ( = ?auto_785422 ?auto_785429 ) ) ( not ( = ?auto_785423 ?auto_785424 ) ) ( not ( = ?auto_785423 ?auto_785425 ) ) ( not ( = ?auto_785423 ?auto_785426 ) ) ( not ( = ?auto_785423 ?auto_785427 ) ) ( not ( = ?auto_785423 ?auto_785428 ) ) ( not ( = ?auto_785423 ?auto_785429 ) ) ( not ( = ?auto_785424 ?auto_785425 ) ) ( not ( = ?auto_785424 ?auto_785426 ) ) ( not ( = ?auto_785424 ?auto_785427 ) ) ( not ( = ?auto_785424 ?auto_785428 ) ) ( not ( = ?auto_785424 ?auto_785429 ) ) ( not ( = ?auto_785425 ?auto_785426 ) ) ( not ( = ?auto_785425 ?auto_785427 ) ) ( not ( = ?auto_785425 ?auto_785428 ) ) ( not ( = ?auto_785425 ?auto_785429 ) ) ( not ( = ?auto_785426 ?auto_785427 ) ) ( not ( = ?auto_785426 ?auto_785428 ) ) ( not ( = ?auto_785426 ?auto_785429 ) ) ( not ( = ?auto_785427 ?auto_785428 ) ) ( not ( = ?auto_785427 ?auto_785429 ) ) ( not ( = ?auto_785428 ?auto_785429 ) ) ( ON ?auto_785427 ?auto_785428 ) ( CLEAR ?auto_785425 ) ( ON ?auto_785426 ?auto_785427 ) ( CLEAR ?auto_785426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_785418 ?auto_785419 ?auto_785420 ?auto_785421 ?auto_785422 ?auto_785423 ?auto_785424 ?auto_785425 ?auto_785426 )
      ( MAKE-11PILE ?auto_785418 ?auto_785419 ?auto_785420 ?auto_785421 ?auto_785422 ?auto_785423 ?auto_785424 ?auto_785425 ?auto_785426 ?auto_785427 ?auto_785428 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785464 - BLOCK
      ?auto_785465 - BLOCK
      ?auto_785466 - BLOCK
      ?auto_785467 - BLOCK
      ?auto_785468 - BLOCK
      ?auto_785469 - BLOCK
      ?auto_785470 - BLOCK
      ?auto_785471 - BLOCK
      ?auto_785472 - BLOCK
      ?auto_785473 - BLOCK
      ?auto_785474 - BLOCK
    )
    :vars
    (
      ?auto_785475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785474 ?auto_785475 ) ( ON-TABLE ?auto_785464 ) ( ON ?auto_785465 ?auto_785464 ) ( ON ?auto_785466 ?auto_785465 ) ( ON ?auto_785467 ?auto_785466 ) ( ON ?auto_785468 ?auto_785467 ) ( ON ?auto_785469 ?auto_785468 ) ( ON ?auto_785470 ?auto_785469 ) ( not ( = ?auto_785464 ?auto_785465 ) ) ( not ( = ?auto_785464 ?auto_785466 ) ) ( not ( = ?auto_785464 ?auto_785467 ) ) ( not ( = ?auto_785464 ?auto_785468 ) ) ( not ( = ?auto_785464 ?auto_785469 ) ) ( not ( = ?auto_785464 ?auto_785470 ) ) ( not ( = ?auto_785464 ?auto_785471 ) ) ( not ( = ?auto_785464 ?auto_785472 ) ) ( not ( = ?auto_785464 ?auto_785473 ) ) ( not ( = ?auto_785464 ?auto_785474 ) ) ( not ( = ?auto_785464 ?auto_785475 ) ) ( not ( = ?auto_785465 ?auto_785466 ) ) ( not ( = ?auto_785465 ?auto_785467 ) ) ( not ( = ?auto_785465 ?auto_785468 ) ) ( not ( = ?auto_785465 ?auto_785469 ) ) ( not ( = ?auto_785465 ?auto_785470 ) ) ( not ( = ?auto_785465 ?auto_785471 ) ) ( not ( = ?auto_785465 ?auto_785472 ) ) ( not ( = ?auto_785465 ?auto_785473 ) ) ( not ( = ?auto_785465 ?auto_785474 ) ) ( not ( = ?auto_785465 ?auto_785475 ) ) ( not ( = ?auto_785466 ?auto_785467 ) ) ( not ( = ?auto_785466 ?auto_785468 ) ) ( not ( = ?auto_785466 ?auto_785469 ) ) ( not ( = ?auto_785466 ?auto_785470 ) ) ( not ( = ?auto_785466 ?auto_785471 ) ) ( not ( = ?auto_785466 ?auto_785472 ) ) ( not ( = ?auto_785466 ?auto_785473 ) ) ( not ( = ?auto_785466 ?auto_785474 ) ) ( not ( = ?auto_785466 ?auto_785475 ) ) ( not ( = ?auto_785467 ?auto_785468 ) ) ( not ( = ?auto_785467 ?auto_785469 ) ) ( not ( = ?auto_785467 ?auto_785470 ) ) ( not ( = ?auto_785467 ?auto_785471 ) ) ( not ( = ?auto_785467 ?auto_785472 ) ) ( not ( = ?auto_785467 ?auto_785473 ) ) ( not ( = ?auto_785467 ?auto_785474 ) ) ( not ( = ?auto_785467 ?auto_785475 ) ) ( not ( = ?auto_785468 ?auto_785469 ) ) ( not ( = ?auto_785468 ?auto_785470 ) ) ( not ( = ?auto_785468 ?auto_785471 ) ) ( not ( = ?auto_785468 ?auto_785472 ) ) ( not ( = ?auto_785468 ?auto_785473 ) ) ( not ( = ?auto_785468 ?auto_785474 ) ) ( not ( = ?auto_785468 ?auto_785475 ) ) ( not ( = ?auto_785469 ?auto_785470 ) ) ( not ( = ?auto_785469 ?auto_785471 ) ) ( not ( = ?auto_785469 ?auto_785472 ) ) ( not ( = ?auto_785469 ?auto_785473 ) ) ( not ( = ?auto_785469 ?auto_785474 ) ) ( not ( = ?auto_785469 ?auto_785475 ) ) ( not ( = ?auto_785470 ?auto_785471 ) ) ( not ( = ?auto_785470 ?auto_785472 ) ) ( not ( = ?auto_785470 ?auto_785473 ) ) ( not ( = ?auto_785470 ?auto_785474 ) ) ( not ( = ?auto_785470 ?auto_785475 ) ) ( not ( = ?auto_785471 ?auto_785472 ) ) ( not ( = ?auto_785471 ?auto_785473 ) ) ( not ( = ?auto_785471 ?auto_785474 ) ) ( not ( = ?auto_785471 ?auto_785475 ) ) ( not ( = ?auto_785472 ?auto_785473 ) ) ( not ( = ?auto_785472 ?auto_785474 ) ) ( not ( = ?auto_785472 ?auto_785475 ) ) ( not ( = ?auto_785473 ?auto_785474 ) ) ( not ( = ?auto_785473 ?auto_785475 ) ) ( not ( = ?auto_785474 ?auto_785475 ) ) ( ON ?auto_785473 ?auto_785474 ) ( ON ?auto_785472 ?auto_785473 ) ( CLEAR ?auto_785470 ) ( ON ?auto_785471 ?auto_785472 ) ( CLEAR ?auto_785471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_785464 ?auto_785465 ?auto_785466 ?auto_785467 ?auto_785468 ?auto_785469 ?auto_785470 ?auto_785471 )
      ( MAKE-11PILE ?auto_785464 ?auto_785465 ?auto_785466 ?auto_785467 ?auto_785468 ?auto_785469 ?auto_785470 ?auto_785471 ?auto_785472 ?auto_785473 ?auto_785474 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785510 - BLOCK
      ?auto_785511 - BLOCK
      ?auto_785512 - BLOCK
      ?auto_785513 - BLOCK
      ?auto_785514 - BLOCK
      ?auto_785515 - BLOCK
      ?auto_785516 - BLOCK
      ?auto_785517 - BLOCK
      ?auto_785518 - BLOCK
      ?auto_785519 - BLOCK
      ?auto_785520 - BLOCK
    )
    :vars
    (
      ?auto_785521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785520 ?auto_785521 ) ( ON-TABLE ?auto_785510 ) ( ON ?auto_785511 ?auto_785510 ) ( ON ?auto_785512 ?auto_785511 ) ( ON ?auto_785513 ?auto_785512 ) ( ON ?auto_785514 ?auto_785513 ) ( ON ?auto_785515 ?auto_785514 ) ( not ( = ?auto_785510 ?auto_785511 ) ) ( not ( = ?auto_785510 ?auto_785512 ) ) ( not ( = ?auto_785510 ?auto_785513 ) ) ( not ( = ?auto_785510 ?auto_785514 ) ) ( not ( = ?auto_785510 ?auto_785515 ) ) ( not ( = ?auto_785510 ?auto_785516 ) ) ( not ( = ?auto_785510 ?auto_785517 ) ) ( not ( = ?auto_785510 ?auto_785518 ) ) ( not ( = ?auto_785510 ?auto_785519 ) ) ( not ( = ?auto_785510 ?auto_785520 ) ) ( not ( = ?auto_785510 ?auto_785521 ) ) ( not ( = ?auto_785511 ?auto_785512 ) ) ( not ( = ?auto_785511 ?auto_785513 ) ) ( not ( = ?auto_785511 ?auto_785514 ) ) ( not ( = ?auto_785511 ?auto_785515 ) ) ( not ( = ?auto_785511 ?auto_785516 ) ) ( not ( = ?auto_785511 ?auto_785517 ) ) ( not ( = ?auto_785511 ?auto_785518 ) ) ( not ( = ?auto_785511 ?auto_785519 ) ) ( not ( = ?auto_785511 ?auto_785520 ) ) ( not ( = ?auto_785511 ?auto_785521 ) ) ( not ( = ?auto_785512 ?auto_785513 ) ) ( not ( = ?auto_785512 ?auto_785514 ) ) ( not ( = ?auto_785512 ?auto_785515 ) ) ( not ( = ?auto_785512 ?auto_785516 ) ) ( not ( = ?auto_785512 ?auto_785517 ) ) ( not ( = ?auto_785512 ?auto_785518 ) ) ( not ( = ?auto_785512 ?auto_785519 ) ) ( not ( = ?auto_785512 ?auto_785520 ) ) ( not ( = ?auto_785512 ?auto_785521 ) ) ( not ( = ?auto_785513 ?auto_785514 ) ) ( not ( = ?auto_785513 ?auto_785515 ) ) ( not ( = ?auto_785513 ?auto_785516 ) ) ( not ( = ?auto_785513 ?auto_785517 ) ) ( not ( = ?auto_785513 ?auto_785518 ) ) ( not ( = ?auto_785513 ?auto_785519 ) ) ( not ( = ?auto_785513 ?auto_785520 ) ) ( not ( = ?auto_785513 ?auto_785521 ) ) ( not ( = ?auto_785514 ?auto_785515 ) ) ( not ( = ?auto_785514 ?auto_785516 ) ) ( not ( = ?auto_785514 ?auto_785517 ) ) ( not ( = ?auto_785514 ?auto_785518 ) ) ( not ( = ?auto_785514 ?auto_785519 ) ) ( not ( = ?auto_785514 ?auto_785520 ) ) ( not ( = ?auto_785514 ?auto_785521 ) ) ( not ( = ?auto_785515 ?auto_785516 ) ) ( not ( = ?auto_785515 ?auto_785517 ) ) ( not ( = ?auto_785515 ?auto_785518 ) ) ( not ( = ?auto_785515 ?auto_785519 ) ) ( not ( = ?auto_785515 ?auto_785520 ) ) ( not ( = ?auto_785515 ?auto_785521 ) ) ( not ( = ?auto_785516 ?auto_785517 ) ) ( not ( = ?auto_785516 ?auto_785518 ) ) ( not ( = ?auto_785516 ?auto_785519 ) ) ( not ( = ?auto_785516 ?auto_785520 ) ) ( not ( = ?auto_785516 ?auto_785521 ) ) ( not ( = ?auto_785517 ?auto_785518 ) ) ( not ( = ?auto_785517 ?auto_785519 ) ) ( not ( = ?auto_785517 ?auto_785520 ) ) ( not ( = ?auto_785517 ?auto_785521 ) ) ( not ( = ?auto_785518 ?auto_785519 ) ) ( not ( = ?auto_785518 ?auto_785520 ) ) ( not ( = ?auto_785518 ?auto_785521 ) ) ( not ( = ?auto_785519 ?auto_785520 ) ) ( not ( = ?auto_785519 ?auto_785521 ) ) ( not ( = ?auto_785520 ?auto_785521 ) ) ( ON ?auto_785519 ?auto_785520 ) ( ON ?auto_785518 ?auto_785519 ) ( ON ?auto_785517 ?auto_785518 ) ( CLEAR ?auto_785515 ) ( ON ?auto_785516 ?auto_785517 ) ( CLEAR ?auto_785516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_785510 ?auto_785511 ?auto_785512 ?auto_785513 ?auto_785514 ?auto_785515 ?auto_785516 )
      ( MAKE-11PILE ?auto_785510 ?auto_785511 ?auto_785512 ?auto_785513 ?auto_785514 ?auto_785515 ?auto_785516 ?auto_785517 ?auto_785518 ?auto_785519 ?auto_785520 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785556 - BLOCK
      ?auto_785557 - BLOCK
      ?auto_785558 - BLOCK
      ?auto_785559 - BLOCK
      ?auto_785560 - BLOCK
      ?auto_785561 - BLOCK
      ?auto_785562 - BLOCK
      ?auto_785563 - BLOCK
      ?auto_785564 - BLOCK
      ?auto_785565 - BLOCK
      ?auto_785566 - BLOCK
    )
    :vars
    (
      ?auto_785567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785566 ?auto_785567 ) ( ON-TABLE ?auto_785556 ) ( ON ?auto_785557 ?auto_785556 ) ( ON ?auto_785558 ?auto_785557 ) ( ON ?auto_785559 ?auto_785558 ) ( ON ?auto_785560 ?auto_785559 ) ( not ( = ?auto_785556 ?auto_785557 ) ) ( not ( = ?auto_785556 ?auto_785558 ) ) ( not ( = ?auto_785556 ?auto_785559 ) ) ( not ( = ?auto_785556 ?auto_785560 ) ) ( not ( = ?auto_785556 ?auto_785561 ) ) ( not ( = ?auto_785556 ?auto_785562 ) ) ( not ( = ?auto_785556 ?auto_785563 ) ) ( not ( = ?auto_785556 ?auto_785564 ) ) ( not ( = ?auto_785556 ?auto_785565 ) ) ( not ( = ?auto_785556 ?auto_785566 ) ) ( not ( = ?auto_785556 ?auto_785567 ) ) ( not ( = ?auto_785557 ?auto_785558 ) ) ( not ( = ?auto_785557 ?auto_785559 ) ) ( not ( = ?auto_785557 ?auto_785560 ) ) ( not ( = ?auto_785557 ?auto_785561 ) ) ( not ( = ?auto_785557 ?auto_785562 ) ) ( not ( = ?auto_785557 ?auto_785563 ) ) ( not ( = ?auto_785557 ?auto_785564 ) ) ( not ( = ?auto_785557 ?auto_785565 ) ) ( not ( = ?auto_785557 ?auto_785566 ) ) ( not ( = ?auto_785557 ?auto_785567 ) ) ( not ( = ?auto_785558 ?auto_785559 ) ) ( not ( = ?auto_785558 ?auto_785560 ) ) ( not ( = ?auto_785558 ?auto_785561 ) ) ( not ( = ?auto_785558 ?auto_785562 ) ) ( not ( = ?auto_785558 ?auto_785563 ) ) ( not ( = ?auto_785558 ?auto_785564 ) ) ( not ( = ?auto_785558 ?auto_785565 ) ) ( not ( = ?auto_785558 ?auto_785566 ) ) ( not ( = ?auto_785558 ?auto_785567 ) ) ( not ( = ?auto_785559 ?auto_785560 ) ) ( not ( = ?auto_785559 ?auto_785561 ) ) ( not ( = ?auto_785559 ?auto_785562 ) ) ( not ( = ?auto_785559 ?auto_785563 ) ) ( not ( = ?auto_785559 ?auto_785564 ) ) ( not ( = ?auto_785559 ?auto_785565 ) ) ( not ( = ?auto_785559 ?auto_785566 ) ) ( not ( = ?auto_785559 ?auto_785567 ) ) ( not ( = ?auto_785560 ?auto_785561 ) ) ( not ( = ?auto_785560 ?auto_785562 ) ) ( not ( = ?auto_785560 ?auto_785563 ) ) ( not ( = ?auto_785560 ?auto_785564 ) ) ( not ( = ?auto_785560 ?auto_785565 ) ) ( not ( = ?auto_785560 ?auto_785566 ) ) ( not ( = ?auto_785560 ?auto_785567 ) ) ( not ( = ?auto_785561 ?auto_785562 ) ) ( not ( = ?auto_785561 ?auto_785563 ) ) ( not ( = ?auto_785561 ?auto_785564 ) ) ( not ( = ?auto_785561 ?auto_785565 ) ) ( not ( = ?auto_785561 ?auto_785566 ) ) ( not ( = ?auto_785561 ?auto_785567 ) ) ( not ( = ?auto_785562 ?auto_785563 ) ) ( not ( = ?auto_785562 ?auto_785564 ) ) ( not ( = ?auto_785562 ?auto_785565 ) ) ( not ( = ?auto_785562 ?auto_785566 ) ) ( not ( = ?auto_785562 ?auto_785567 ) ) ( not ( = ?auto_785563 ?auto_785564 ) ) ( not ( = ?auto_785563 ?auto_785565 ) ) ( not ( = ?auto_785563 ?auto_785566 ) ) ( not ( = ?auto_785563 ?auto_785567 ) ) ( not ( = ?auto_785564 ?auto_785565 ) ) ( not ( = ?auto_785564 ?auto_785566 ) ) ( not ( = ?auto_785564 ?auto_785567 ) ) ( not ( = ?auto_785565 ?auto_785566 ) ) ( not ( = ?auto_785565 ?auto_785567 ) ) ( not ( = ?auto_785566 ?auto_785567 ) ) ( ON ?auto_785565 ?auto_785566 ) ( ON ?auto_785564 ?auto_785565 ) ( ON ?auto_785563 ?auto_785564 ) ( ON ?auto_785562 ?auto_785563 ) ( CLEAR ?auto_785560 ) ( ON ?auto_785561 ?auto_785562 ) ( CLEAR ?auto_785561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_785556 ?auto_785557 ?auto_785558 ?auto_785559 ?auto_785560 ?auto_785561 )
      ( MAKE-11PILE ?auto_785556 ?auto_785557 ?auto_785558 ?auto_785559 ?auto_785560 ?auto_785561 ?auto_785562 ?auto_785563 ?auto_785564 ?auto_785565 ?auto_785566 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785602 - BLOCK
      ?auto_785603 - BLOCK
      ?auto_785604 - BLOCK
      ?auto_785605 - BLOCK
      ?auto_785606 - BLOCK
      ?auto_785607 - BLOCK
      ?auto_785608 - BLOCK
      ?auto_785609 - BLOCK
      ?auto_785610 - BLOCK
      ?auto_785611 - BLOCK
      ?auto_785612 - BLOCK
    )
    :vars
    (
      ?auto_785613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785612 ?auto_785613 ) ( ON-TABLE ?auto_785602 ) ( ON ?auto_785603 ?auto_785602 ) ( ON ?auto_785604 ?auto_785603 ) ( ON ?auto_785605 ?auto_785604 ) ( not ( = ?auto_785602 ?auto_785603 ) ) ( not ( = ?auto_785602 ?auto_785604 ) ) ( not ( = ?auto_785602 ?auto_785605 ) ) ( not ( = ?auto_785602 ?auto_785606 ) ) ( not ( = ?auto_785602 ?auto_785607 ) ) ( not ( = ?auto_785602 ?auto_785608 ) ) ( not ( = ?auto_785602 ?auto_785609 ) ) ( not ( = ?auto_785602 ?auto_785610 ) ) ( not ( = ?auto_785602 ?auto_785611 ) ) ( not ( = ?auto_785602 ?auto_785612 ) ) ( not ( = ?auto_785602 ?auto_785613 ) ) ( not ( = ?auto_785603 ?auto_785604 ) ) ( not ( = ?auto_785603 ?auto_785605 ) ) ( not ( = ?auto_785603 ?auto_785606 ) ) ( not ( = ?auto_785603 ?auto_785607 ) ) ( not ( = ?auto_785603 ?auto_785608 ) ) ( not ( = ?auto_785603 ?auto_785609 ) ) ( not ( = ?auto_785603 ?auto_785610 ) ) ( not ( = ?auto_785603 ?auto_785611 ) ) ( not ( = ?auto_785603 ?auto_785612 ) ) ( not ( = ?auto_785603 ?auto_785613 ) ) ( not ( = ?auto_785604 ?auto_785605 ) ) ( not ( = ?auto_785604 ?auto_785606 ) ) ( not ( = ?auto_785604 ?auto_785607 ) ) ( not ( = ?auto_785604 ?auto_785608 ) ) ( not ( = ?auto_785604 ?auto_785609 ) ) ( not ( = ?auto_785604 ?auto_785610 ) ) ( not ( = ?auto_785604 ?auto_785611 ) ) ( not ( = ?auto_785604 ?auto_785612 ) ) ( not ( = ?auto_785604 ?auto_785613 ) ) ( not ( = ?auto_785605 ?auto_785606 ) ) ( not ( = ?auto_785605 ?auto_785607 ) ) ( not ( = ?auto_785605 ?auto_785608 ) ) ( not ( = ?auto_785605 ?auto_785609 ) ) ( not ( = ?auto_785605 ?auto_785610 ) ) ( not ( = ?auto_785605 ?auto_785611 ) ) ( not ( = ?auto_785605 ?auto_785612 ) ) ( not ( = ?auto_785605 ?auto_785613 ) ) ( not ( = ?auto_785606 ?auto_785607 ) ) ( not ( = ?auto_785606 ?auto_785608 ) ) ( not ( = ?auto_785606 ?auto_785609 ) ) ( not ( = ?auto_785606 ?auto_785610 ) ) ( not ( = ?auto_785606 ?auto_785611 ) ) ( not ( = ?auto_785606 ?auto_785612 ) ) ( not ( = ?auto_785606 ?auto_785613 ) ) ( not ( = ?auto_785607 ?auto_785608 ) ) ( not ( = ?auto_785607 ?auto_785609 ) ) ( not ( = ?auto_785607 ?auto_785610 ) ) ( not ( = ?auto_785607 ?auto_785611 ) ) ( not ( = ?auto_785607 ?auto_785612 ) ) ( not ( = ?auto_785607 ?auto_785613 ) ) ( not ( = ?auto_785608 ?auto_785609 ) ) ( not ( = ?auto_785608 ?auto_785610 ) ) ( not ( = ?auto_785608 ?auto_785611 ) ) ( not ( = ?auto_785608 ?auto_785612 ) ) ( not ( = ?auto_785608 ?auto_785613 ) ) ( not ( = ?auto_785609 ?auto_785610 ) ) ( not ( = ?auto_785609 ?auto_785611 ) ) ( not ( = ?auto_785609 ?auto_785612 ) ) ( not ( = ?auto_785609 ?auto_785613 ) ) ( not ( = ?auto_785610 ?auto_785611 ) ) ( not ( = ?auto_785610 ?auto_785612 ) ) ( not ( = ?auto_785610 ?auto_785613 ) ) ( not ( = ?auto_785611 ?auto_785612 ) ) ( not ( = ?auto_785611 ?auto_785613 ) ) ( not ( = ?auto_785612 ?auto_785613 ) ) ( ON ?auto_785611 ?auto_785612 ) ( ON ?auto_785610 ?auto_785611 ) ( ON ?auto_785609 ?auto_785610 ) ( ON ?auto_785608 ?auto_785609 ) ( ON ?auto_785607 ?auto_785608 ) ( CLEAR ?auto_785605 ) ( ON ?auto_785606 ?auto_785607 ) ( CLEAR ?auto_785606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_785602 ?auto_785603 ?auto_785604 ?auto_785605 ?auto_785606 )
      ( MAKE-11PILE ?auto_785602 ?auto_785603 ?auto_785604 ?auto_785605 ?auto_785606 ?auto_785607 ?auto_785608 ?auto_785609 ?auto_785610 ?auto_785611 ?auto_785612 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785648 - BLOCK
      ?auto_785649 - BLOCK
      ?auto_785650 - BLOCK
      ?auto_785651 - BLOCK
      ?auto_785652 - BLOCK
      ?auto_785653 - BLOCK
      ?auto_785654 - BLOCK
      ?auto_785655 - BLOCK
      ?auto_785656 - BLOCK
      ?auto_785657 - BLOCK
      ?auto_785658 - BLOCK
    )
    :vars
    (
      ?auto_785659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785658 ?auto_785659 ) ( ON-TABLE ?auto_785648 ) ( ON ?auto_785649 ?auto_785648 ) ( ON ?auto_785650 ?auto_785649 ) ( not ( = ?auto_785648 ?auto_785649 ) ) ( not ( = ?auto_785648 ?auto_785650 ) ) ( not ( = ?auto_785648 ?auto_785651 ) ) ( not ( = ?auto_785648 ?auto_785652 ) ) ( not ( = ?auto_785648 ?auto_785653 ) ) ( not ( = ?auto_785648 ?auto_785654 ) ) ( not ( = ?auto_785648 ?auto_785655 ) ) ( not ( = ?auto_785648 ?auto_785656 ) ) ( not ( = ?auto_785648 ?auto_785657 ) ) ( not ( = ?auto_785648 ?auto_785658 ) ) ( not ( = ?auto_785648 ?auto_785659 ) ) ( not ( = ?auto_785649 ?auto_785650 ) ) ( not ( = ?auto_785649 ?auto_785651 ) ) ( not ( = ?auto_785649 ?auto_785652 ) ) ( not ( = ?auto_785649 ?auto_785653 ) ) ( not ( = ?auto_785649 ?auto_785654 ) ) ( not ( = ?auto_785649 ?auto_785655 ) ) ( not ( = ?auto_785649 ?auto_785656 ) ) ( not ( = ?auto_785649 ?auto_785657 ) ) ( not ( = ?auto_785649 ?auto_785658 ) ) ( not ( = ?auto_785649 ?auto_785659 ) ) ( not ( = ?auto_785650 ?auto_785651 ) ) ( not ( = ?auto_785650 ?auto_785652 ) ) ( not ( = ?auto_785650 ?auto_785653 ) ) ( not ( = ?auto_785650 ?auto_785654 ) ) ( not ( = ?auto_785650 ?auto_785655 ) ) ( not ( = ?auto_785650 ?auto_785656 ) ) ( not ( = ?auto_785650 ?auto_785657 ) ) ( not ( = ?auto_785650 ?auto_785658 ) ) ( not ( = ?auto_785650 ?auto_785659 ) ) ( not ( = ?auto_785651 ?auto_785652 ) ) ( not ( = ?auto_785651 ?auto_785653 ) ) ( not ( = ?auto_785651 ?auto_785654 ) ) ( not ( = ?auto_785651 ?auto_785655 ) ) ( not ( = ?auto_785651 ?auto_785656 ) ) ( not ( = ?auto_785651 ?auto_785657 ) ) ( not ( = ?auto_785651 ?auto_785658 ) ) ( not ( = ?auto_785651 ?auto_785659 ) ) ( not ( = ?auto_785652 ?auto_785653 ) ) ( not ( = ?auto_785652 ?auto_785654 ) ) ( not ( = ?auto_785652 ?auto_785655 ) ) ( not ( = ?auto_785652 ?auto_785656 ) ) ( not ( = ?auto_785652 ?auto_785657 ) ) ( not ( = ?auto_785652 ?auto_785658 ) ) ( not ( = ?auto_785652 ?auto_785659 ) ) ( not ( = ?auto_785653 ?auto_785654 ) ) ( not ( = ?auto_785653 ?auto_785655 ) ) ( not ( = ?auto_785653 ?auto_785656 ) ) ( not ( = ?auto_785653 ?auto_785657 ) ) ( not ( = ?auto_785653 ?auto_785658 ) ) ( not ( = ?auto_785653 ?auto_785659 ) ) ( not ( = ?auto_785654 ?auto_785655 ) ) ( not ( = ?auto_785654 ?auto_785656 ) ) ( not ( = ?auto_785654 ?auto_785657 ) ) ( not ( = ?auto_785654 ?auto_785658 ) ) ( not ( = ?auto_785654 ?auto_785659 ) ) ( not ( = ?auto_785655 ?auto_785656 ) ) ( not ( = ?auto_785655 ?auto_785657 ) ) ( not ( = ?auto_785655 ?auto_785658 ) ) ( not ( = ?auto_785655 ?auto_785659 ) ) ( not ( = ?auto_785656 ?auto_785657 ) ) ( not ( = ?auto_785656 ?auto_785658 ) ) ( not ( = ?auto_785656 ?auto_785659 ) ) ( not ( = ?auto_785657 ?auto_785658 ) ) ( not ( = ?auto_785657 ?auto_785659 ) ) ( not ( = ?auto_785658 ?auto_785659 ) ) ( ON ?auto_785657 ?auto_785658 ) ( ON ?auto_785656 ?auto_785657 ) ( ON ?auto_785655 ?auto_785656 ) ( ON ?auto_785654 ?auto_785655 ) ( ON ?auto_785653 ?auto_785654 ) ( ON ?auto_785652 ?auto_785653 ) ( CLEAR ?auto_785650 ) ( ON ?auto_785651 ?auto_785652 ) ( CLEAR ?auto_785651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_785648 ?auto_785649 ?auto_785650 ?auto_785651 )
      ( MAKE-11PILE ?auto_785648 ?auto_785649 ?auto_785650 ?auto_785651 ?auto_785652 ?auto_785653 ?auto_785654 ?auto_785655 ?auto_785656 ?auto_785657 ?auto_785658 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785694 - BLOCK
      ?auto_785695 - BLOCK
      ?auto_785696 - BLOCK
      ?auto_785697 - BLOCK
      ?auto_785698 - BLOCK
      ?auto_785699 - BLOCK
      ?auto_785700 - BLOCK
      ?auto_785701 - BLOCK
      ?auto_785702 - BLOCK
      ?auto_785703 - BLOCK
      ?auto_785704 - BLOCK
    )
    :vars
    (
      ?auto_785705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785704 ?auto_785705 ) ( ON-TABLE ?auto_785694 ) ( ON ?auto_785695 ?auto_785694 ) ( not ( = ?auto_785694 ?auto_785695 ) ) ( not ( = ?auto_785694 ?auto_785696 ) ) ( not ( = ?auto_785694 ?auto_785697 ) ) ( not ( = ?auto_785694 ?auto_785698 ) ) ( not ( = ?auto_785694 ?auto_785699 ) ) ( not ( = ?auto_785694 ?auto_785700 ) ) ( not ( = ?auto_785694 ?auto_785701 ) ) ( not ( = ?auto_785694 ?auto_785702 ) ) ( not ( = ?auto_785694 ?auto_785703 ) ) ( not ( = ?auto_785694 ?auto_785704 ) ) ( not ( = ?auto_785694 ?auto_785705 ) ) ( not ( = ?auto_785695 ?auto_785696 ) ) ( not ( = ?auto_785695 ?auto_785697 ) ) ( not ( = ?auto_785695 ?auto_785698 ) ) ( not ( = ?auto_785695 ?auto_785699 ) ) ( not ( = ?auto_785695 ?auto_785700 ) ) ( not ( = ?auto_785695 ?auto_785701 ) ) ( not ( = ?auto_785695 ?auto_785702 ) ) ( not ( = ?auto_785695 ?auto_785703 ) ) ( not ( = ?auto_785695 ?auto_785704 ) ) ( not ( = ?auto_785695 ?auto_785705 ) ) ( not ( = ?auto_785696 ?auto_785697 ) ) ( not ( = ?auto_785696 ?auto_785698 ) ) ( not ( = ?auto_785696 ?auto_785699 ) ) ( not ( = ?auto_785696 ?auto_785700 ) ) ( not ( = ?auto_785696 ?auto_785701 ) ) ( not ( = ?auto_785696 ?auto_785702 ) ) ( not ( = ?auto_785696 ?auto_785703 ) ) ( not ( = ?auto_785696 ?auto_785704 ) ) ( not ( = ?auto_785696 ?auto_785705 ) ) ( not ( = ?auto_785697 ?auto_785698 ) ) ( not ( = ?auto_785697 ?auto_785699 ) ) ( not ( = ?auto_785697 ?auto_785700 ) ) ( not ( = ?auto_785697 ?auto_785701 ) ) ( not ( = ?auto_785697 ?auto_785702 ) ) ( not ( = ?auto_785697 ?auto_785703 ) ) ( not ( = ?auto_785697 ?auto_785704 ) ) ( not ( = ?auto_785697 ?auto_785705 ) ) ( not ( = ?auto_785698 ?auto_785699 ) ) ( not ( = ?auto_785698 ?auto_785700 ) ) ( not ( = ?auto_785698 ?auto_785701 ) ) ( not ( = ?auto_785698 ?auto_785702 ) ) ( not ( = ?auto_785698 ?auto_785703 ) ) ( not ( = ?auto_785698 ?auto_785704 ) ) ( not ( = ?auto_785698 ?auto_785705 ) ) ( not ( = ?auto_785699 ?auto_785700 ) ) ( not ( = ?auto_785699 ?auto_785701 ) ) ( not ( = ?auto_785699 ?auto_785702 ) ) ( not ( = ?auto_785699 ?auto_785703 ) ) ( not ( = ?auto_785699 ?auto_785704 ) ) ( not ( = ?auto_785699 ?auto_785705 ) ) ( not ( = ?auto_785700 ?auto_785701 ) ) ( not ( = ?auto_785700 ?auto_785702 ) ) ( not ( = ?auto_785700 ?auto_785703 ) ) ( not ( = ?auto_785700 ?auto_785704 ) ) ( not ( = ?auto_785700 ?auto_785705 ) ) ( not ( = ?auto_785701 ?auto_785702 ) ) ( not ( = ?auto_785701 ?auto_785703 ) ) ( not ( = ?auto_785701 ?auto_785704 ) ) ( not ( = ?auto_785701 ?auto_785705 ) ) ( not ( = ?auto_785702 ?auto_785703 ) ) ( not ( = ?auto_785702 ?auto_785704 ) ) ( not ( = ?auto_785702 ?auto_785705 ) ) ( not ( = ?auto_785703 ?auto_785704 ) ) ( not ( = ?auto_785703 ?auto_785705 ) ) ( not ( = ?auto_785704 ?auto_785705 ) ) ( ON ?auto_785703 ?auto_785704 ) ( ON ?auto_785702 ?auto_785703 ) ( ON ?auto_785701 ?auto_785702 ) ( ON ?auto_785700 ?auto_785701 ) ( ON ?auto_785699 ?auto_785700 ) ( ON ?auto_785698 ?auto_785699 ) ( ON ?auto_785697 ?auto_785698 ) ( CLEAR ?auto_785695 ) ( ON ?auto_785696 ?auto_785697 ) ( CLEAR ?auto_785696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_785694 ?auto_785695 ?auto_785696 )
      ( MAKE-11PILE ?auto_785694 ?auto_785695 ?auto_785696 ?auto_785697 ?auto_785698 ?auto_785699 ?auto_785700 ?auto_785701 ?auto_785702 ?auto_785703 ?auto_785704 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785740 - BLOCK
      ?auto_785741 - BLOCK
      ?auto_785742 - BLOCK
      ?auto_785743 - BLOCK
      ?auto_785744 - BLOCK
      ?auto_785745 - BLOCK
      ?auto_785746 - BLOCK
      ?auto_785747 - BLOCK
      ?auto_785748 - BLOCK
      ?auto_785749 - BLOCK
      ?auto_785750 - BLOCK
    )
    :vars
    (
      ?auto_785751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785750 ?auto_785751 ) ( ON-TABLE ?auto_785740 ) ( not ( = ?auto_785740 ?auto_785741 ) ) ( not ( = ?auto_785740 ?auto_785742 ) ) ( not ( = ?auto_785740 ?auto_785743 ) ) ( not ( = ?auto_785740 ?auto_785744 ) ) ( not ( = ?auto_785740 ?auto_785745 ) ) ( not ( = ?auto_785740 ?auto_785746 ) ) ( not ( = ?auto_785740 ?auto_785747 ) ) ( not ( = ?auto_785740 ?auto_785748 ) ) ( not ( = ?auto_785740 ?auto_785749 ) ) ( not ( = ?auto_785740 ?auto_785750 ) ) ( not ( = ?auto_785740 ?auto_785751 ) ) ( not ( = ?auto_785741 ?auto_785742 ) ) ( not ( = ?auto_785741 ?auto_785743 ) ) ( not ( = ?auto_785741 ?auto_785744 ) ) ( not ( = ?auto_785741 ?auto_785745 ) ) ( not ( = ?auto_785741 ?auto_785746 ) ) ( not ( = ?auto_785741 ?auto_785747 ) ) ( not ( = ?auto_785741 ?auto_785748 ) ) ( not ( = ?auto_785741 ?auto_785749 ) ) ( not ( = ?auto_785741 ?auto_785750 ) ) ( not ( = ?auto_785741 ?auto_785751 ) ) ( not ( = ?auto_785742 ?auto_785743 ) ) ( not ( = ?auto_785742 ?auto_785744 ) ) ( not ( = ?auto_785742 ?auto_785745 ) ) ( not ( = ?auto_785742 ?auto_785746 ) ) ( not ( = ?auto_785742 ?auto_785747 ) ) ( not ( = ?auto_785742 ?auto_785748 ) ) ( not ( = ?auto_785742 ?auto_785749 ) ) ( not ( = ?auto_785742 ?auto_785750 ) ) ( not ( = ?auto_785742 ?auto_785751 ) ) ( not ( = ?auto_785743 ?auto_785744 ) ) ( not ( = ?auto_785743 ?auto_785745 ) ) ( not ( = ?auto_785743 ?auto_785746 ) ) ( not ( = ?auto_785743 ?auto_785747 ) ) ( not ( = ?auto_785743 ?auto_785748 ) ) ( not ( = ?auto_785743 ?auto_785749 ) ) ( not ( = ?auto_785743 ?auto_785750 ) ) ( not ( = ?auto_785743 ?auto_785751 ) ) ( not ( = ?auto_785744 ?auto_785745 ) ) ( not ( = ?auto_785744 ?auto_785746 ) ) ( not ( = ?auto_785744 ?auto_785747 ) ) ( not ( = ?auto_785744 ?auto_785748 ) ) ( not ( = ?auto_785744 ?auto_785749 ) ) ( not ( = ?auto_785744 ?auto_785750 ) ) ( not ( = ?auto_785744 ?auto_785751 ) ) ( not ( = ?auto_785745 ?auto_785746 ) ) ( not ( = ?auto_785745 ?auto_785747 ) ) ( not ( = ?auto_785745 ?auto_785748 ) ) ( not ( = ?auto_785745 ?auto_785749 ) ) ( not ( = ?auto_785745 ?auto_785750 ) ) ( not ( = ?auto_785745 ?auto_785751 ) ) ( not ( = ?auto_785746 ?auto_785747 ) ) ( not ( = ?auto_785746 ?auto_785748 ) ) ( not ( = ?auto_785746 ?auto_785749 ) ) ( not ( = ?auto_785746 ?auto_785750 ) ) ( not ( = ?auto_785746 ?auto_785751 ) ) ( not ( = ?auto_785747 ?auto_785748 ) ) ( not ( = ?auto_785747 ?auto_785749 ) ) ( not ( = ?auto_785747 ?auto_785750 ) ) ( not ( = ?auto_785747 ?auto_785751 ) ) ( not ( = ?auto_785748 ?auto_785749 ) ) ( not ( = ?auto_785748 ?auto_785750 ) ) ( not ( = ?auto_785748 ?auto_785751 ) ) ( not ( = ?auto_785749 ?auto_785750 ) ) ( not ( = ?auto_785749 ?auto_785751 ) ) ( not ( = ?auto_785750 ?auto_785751 ) ) ( ON ?auto_785749 ?auto_785750 ) ( ON ?auto_785748 ?auto_785749 ) ( ON ?auto_785747 ?auto_785748 ) ( ON ?auto_785746 ?auto_785747 ) ( ON ?auto_785745 ?auto_785746 ) ( ON ?auto_785744 ?auto_785745 ) ( ON ?auto_785743 ?auto_785744 ) ( ON ?auto_785742 ?auto_785743 ) ( CLEAR ?auto_785740 ) ( ON ?auto_785741 ?auto_785742 ) ( CLEAR ?auto_785741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_785740 ?auto_785741 )
      ( MAKE-11PILE ?auto_785740 ?auto_785741 ?auto_785742 ?auto_785743 ?auto_785744 ?auto_785745 ?auto_785746 ?auto_785747 ?auto_785748 ?auto_785749 ?auto_785750 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_785786 - BLOCK
      ?auto_785787 - BLOCK
      ?auto_785788 - BLOCK
      ?auto_785789 - BLOCK
      ?auto_785790 - BLOCK
      ?auto_785791 - BLOCK
      ?auto_785792 - BLOCK
      ?auto_785793 - BLOCK
      ?auto_785794 - BLOCK
      ?auto_785795 - BLOCK
      ?auto_785796 - BLOCK
    )
    :vars
    (
      ?auto_785797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785796 ?auto_785797 ) ( not ( = ?auto_785786 ?auto_785787 ) ) ( not ( = ?auto_785786 ?auto_785788 ) ) ( not ( = ?auto_785786 ?auto_785789 ) ) ( not ( = ?auto_785786 ?auto_785790 ) ) ( not ( = ?auto_785786 ?auto_785791 ) ) ( not ( = ?auto_785786 ?auto_785792 ) ) ( not ( = ?auto_785786 ?auto_785793 ) ) ( not ( = ?auto_785786 ?auto_785794 ) ) ( not ( = ?auto_785786 ?auto_785795 ) ) ( not ( = ?auto_785786 ?auto_785796 ) ) ( not ( = ?auto_785786 ?auto_785797 ) ) ( not ( = ?auto_785787 ?auto_785788 ) ) ( not ( = ?auto_785787 ?auto_785789 ) ) ( not ( = ?auto_785787 ?auto_785790 ) ) ( not ( = ?auto_785787 ?auto_785791 ) ) ( not ( = ?auto_785787 ?auto_785792 ) ) ( not ( = ?auto_785787 ?auto_785793 ) ) ( not ( = ?auto_785787 ?auto_785794 ) ) ( not ( = ?auto_785787 ?auto_785795 ) ) ( not ( = ?auto_785787 ?auto_785796 ) ) ( not ( = ?auto_785787 ?auto_785797 ) ) ( not ( = ?auto_785788 ?auto_785789 ) ) ( not ( = ?auto_785788 ?auto_785790 ) ) ( not ( = ?auto_785788 ?auto_785791 ) ) ( not ( = ?auto_785788 ?auto_785792 ) ) ( not ( = ?auto_785788 ?auto_785793 ) ) ( not ( = ?auto_785788 ?auto_785794 ) ) ( not ( = ?auto_785788 ?auto_785795 ) ) ( not ( = ?auto_785788 ?auto_785796 ) ) ( not ( = ?auto_785788 ?auto_785797 ) ) ( not ( = ?auto_785789 ?auto_785790 ) ) ( not ( = ?auto_785789 ?auto_785791 ) ) ( not ( = ?auto_785789 ?auto_785792 ) ) ( not ( = ?auto_785789 ?auto_785793 ) ) ( not ( = ?auto_785789 ?auto_785794 ) ) ( not ( = ?auto_785789 ?auto_785795 ) ) ( not ( = ?auto_785789 ?auto_785796 ) ) ( not ( = ?auto_785789 ?auto_785797 ) ) ( not ( = ?auto_785790 ?auto_785791 ) ) ( not ( = ?auto_785790 ?auto_785792 ) ) ( not ( = ?auto_785790 ?auto_785793 ) ) ( not ( = ?auto_785790 ?auto_785794 ) ) ( not ( = ?auto_785790 ?auto_785795 ) ) ( not ( = ?auto_785790 ?auto_785796 ) ) ( not ( = ?auto_785790 ?auto_785797 ) ) ( not ( = ?auto_785791 ?auto_785792 ) ) ( not ( = ?auto_785791 ?auto_785793 ) ) ( not ( = ?auto_785791 ?auto_785794 ) ) ( not ( = ?auto_785791 ?auto_785795 ) ) ( not ( = ?auto_785791 ?auto_785796 ) ) ( not ( = ?auto_785791 ?auto_785797 ) ) ( not ( = ?auto_785792 ?auto_785793 ) ) ( not ( = ?auto_785792 ?auto_785794 ) ) ( not ( = ?auto_785792 ?auto_785795 ) ) ( not ( = ?auto_785792 ?auto_785796 ) ) ( not ( = ?auto_785792 ?auto_785797 ) ) ( not ( = ?auto_785793 ?auto_785794 ) ) ( not ( = ?auto_785793 ?auto_785795 ) ) ( not ( = ?auto_785793 ?auto_785796 ) ) ( not ( = ?auto_785793 ?auto_785797 ) ) ( not ( = ?auto_785794 ?auto_785795 ) ) ( not ( = ?auto_785794 ?auto_785796 ) ) ( not ( = ?auto_785794 ?auto_785797 ) ) ( not ( = ?auto_785795 ?auto_785796 ) ) ( not ( = ?auto_785795 ?auto_785797 ) ) ( not ( = ?auto_785796 ?auto_785797 ) ) ( ON ?auto_785795 ?auto_785796 ) ( ON ?auto_785794 ?auto_785795 ) ( ON ?auto_785793 ?auto_785794 ) ( ON ?auto_785792 ?auto_785793 ) ( ON ?auto_785791 ?auto_785792 ) ( ON ?auto_785790 ?auto_785791 ) ( ON ?auto_785789 ?auto_785790 ) ( ON ?auto_785788 ?auto_785789 ) ( ON ?auto_785787 ?auto_785788 ) ( ON ?auto_785786 ?auto_785787 ) ( CLEAR ?auto_785786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_785786 )
      ( MAKE-11PILE ?auto_785786 ?auto_785787 ?auto_785788 ?auto_785789 ?auto_785790 ?auto_785791 ?auto_785792 ?auto_785793 ?auto_785794 ?auto_785795 ?auto_785796 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_785833 - BLOCK
      ?auto_785834 - BLOCK
      ?auto_785835 - BLOCK
      ?auto_785836 - BLOCK
      ?auto_785837 - BLOCK
      ?auto_785838 - BLOCK
      ?auto_785839 - BLOCK
      ?auto_785840 - BLOCK
      ?auto_785841 - BLOCK
      ?auto_785842 - BLOCK
      ?auto_785843 - BLOCK
      ?auto_785844 - BLOCK
    )
    :vars
    (
      ?auto_785845 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_785843 ) ( ON ?auto_785844 ?auto_785845 ) ( CLEAR ?auto_785844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_785833 ) ( ON ?auto_785834 ?auto_785833 ) ( ON ?auto_785835 ?auto_785834 ) ( ON ?auto_785836 ?auto_785835 ) ( ON ?auto_785837 ?auto_785836 ) ( ON ?auto_785838 ?auto_785837 ) ( ON ?auto_785839 ?auto_785838 ) ( ON ?auto_785840 ?auto_785839 ) ( ON ?auto_785841 ?auto_785840 ) ( ON ?auto_785842 ?auto_785841 ) ( ON ?auto_785843 ?auto_785842 ) ( not ( = ?auto_785833 ?auto_785834 ) ) ( not ( = ?auto_785833 ?auto_785835 ) ) ( not ( = ?auto_785833 ?auto_785836 ) ) ( not ( = ?auto_785833 ?auto_785837 ) ) ( not ( = ?auto_785833 ?auto_785838 ) ) ( not ( = ?auto_785833 ?auto_785839 ) ) ( not ( = ?auto_785833 ?auto_785840 ) ) ( not ( = ?auto_785833 ?auto_785841 ) ) ( not ( = ?auto_785833 ?auto_785842 ) ) ( not ( = ?auto_785833 ?auto_785843 ) ) ( not ( = ?auto_785833 ?auto_785844 ) ) ( not ( = ?auto_785833 ?auto_785845 ) ) ( not ( = ?auto_785834 ?auto_785835 ) ) ( not ( = ?auto_785834 ?auto_785836 ) ) ( not ( = ?auto_785834 ?auto_785837 ) ) ( not ( = ?auto_785834 ?auto_785838 ) ) ( not ( = ?auto_785834 ?auto_785839 ) ) ( not ( = ?auto_785834 ?auto_785840 ) ) ( not ( = ?auto_785834 ?auto_785841 ) ) ( not ( = ?auto_785834 ?auto_785842 ) ) ( not ( = ?auto_785834 ?auto_785843 ) ) ( not ( = ?auto_785834 ?auto_785844 ) ) ( not ( = ?auto_785834 ?auto_785845 ) ) ( not ( = ?auto_785835 ?auto_785836 ) ) ( not ( = ?auto_785835 ?auto_785837 ) ) ( not ( = ?auto_785835 ?auto_785838 ) ) ( not ( = ?auto_785835 ?auto_785839 ) ) ( not ( = ?auto_785835 ?auto_785840 ) ) ( not ( = ?auto_785835 ?auto_785841 ) ) ( not ( = ?auto_785835 ?auto_785842 ) ) ( not ( = ?auto_785835 ?auto_785843 ) ) ( not ( = ?auto_785835 ?auto_785844 ) ) ( not ( = ?auto_785835 ?auto_785845 ) ) ( not ( = ?auto_785836 ?auto_785837 ) ) ( not ( = ?auto_785836 ?auto_785838 ) ) ( not ( = ?auto_785836 ?auto_785839 ) ) ( not ( = ?auto_785836 ?auto_785840 ) ) ( not ( = ?auto_785836 ?auto_785841 ) ) ( not ( = ?auto_785836 ?auto_785842 ) ) ( not ( = ?auto_785836 ?auto_785843 ) ) ( not ( = ?auto_785836 ?auto_785844 ) ) ( not ( = ?auto_785836 ?auto_785845 ) ) ( not ( = ?auto_785837 ?auto_785838 ) ) ( not ( = ?auto_785837 ?auto_785839 ) ) ( not ( = ?auto_785837 ?auto_785840 ) ) ( not ( = ?auto_785837 ?auto_785841 ) ) ( not ( = ?auto_785837 ?auto_785842 ) ) ( not ( = ?auto_785837 ?auto_785843 ) ) ( not ( = ?auto_785837 ?auto_785844 ) ) ( not ( = ?auto_785837 ?auto_785845 ) ) ( not ( = ?auto_785838 ?auto_785839 ) ) ( not ( = ?auto_785838 ?auto_785840 ) ) ( not ( = ?auto_785838 ?auto_785841 ) ) ( not ( = ?auto_785838 ?auto_785842 ) ) ( not ( = ?auto_785838 ?auto_785843 ) ) ( not ( = ?auto_785838 ?auto_785844 ) ) ( not ( = ?auto_785838 ?auto_785845 ) ) ( not ( = ?auto_785839 ?auto_785840 ) ) ( not ( = ?auto_785839 ?auto_785841 ) ) ( not ( = ?auto_785839 ?auto_785842 ) ) ( not ( = ?auto_785839 ?auto_785843 ) ) ( not ( = ?auto_785839 ?auto_785844 ) ) ( not ( = ?auto_785839 ?auto_785845 ) ) ( not ( = ?auto_785840 ?auto_785841 ) ) ( not ( = ?auto_785840 ?auto_785842 ) ) ( not ( = ?auto_785840 ?auto_785843 ) ) ( not ( = ?auto_785840 ?auto_785844 ) ) ( not ( = ?auto_785840 ?auto_785845 ) ) ( not ( = ?auto_785841 ?auto_785842 ) ) ( not ( = ?auto_785841 ?auto_785843 ) ) ( not ( = ?auto_785841 ?auto_785844 ) ) ( not ( = ?auto_785841 ?auto_785845 ) ) ( not ( = ?auto_785842 ?auto_785843 ) ) ( not ( = ?auto_785842 ?auto_785844 ) ) ( not ( = ?auto_785842 ?auto_785845 ) ) ( not ( = ?auto_785843 ?auto_785844 ) ) ( not ( = ?auto_785843 ?auto_785845 ) ) ( not ( = ?auto_785844 ?auto_785845 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_785844 ?auto_785845 )
      ( !STACK ?auto_785844 ?auto_785843 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_785883 - BLOCK
      ?auto_785884 - BLOCK
      ?auto_785885 - BLOCK
      ?auto_785886 - BLOCK
      ?auto_785887 - BLOCK
      ?auto_785888 - BLOCK
      ?auto_785889 - BLOCK
      ?auto_785890 - BLOCK
      ?auto_785891 - BLOCK
      ?auto_785892 - BLOCK
      ?auto_785893 - BLOCK
      ?auto_785894 - BLOCK
    )
    :vars
    (
      ?auto_785895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785894 ?auto_785895 ) ( ON-TABLE ?auto_785883 ) ( ON ?auto_785884 ?auto_785883 ) ( ON ?auto_785885 ?auto_785884 ) ( ON ?auto_785886 ?auto_785885 ) ( ON ?auto_785887 ?auto_785886 ) ( ON ?auto_785888 ?auto_785887 ) ( ON ?auto_785889 ?auto_785888 ) ( ON ?auto_785890 ?auto_785889 ) ( ON ?auto_785891 ?auto_785890 ) ( ON ?auto_785892 ?auto_785891 ) ( not ( = ?auto_785883 ?auto_785884 ) ) ( not ( = ?auto_785883 ?auto_785885 ) ) ( not ( = ?auto_785883 ?auto_785886 ) ) ( not ( = ?auto_785883 ?auto_785887 ) ) ( not ( = ?auto_785883 ?auto_785888 ) ) ( not ( = ?auto_785883 ?auto_785889 ) ) ( not ( = ?auto_785883 ?auto_785890 ) ) ( not ( = ?auto_785883 ?auto_785891 ) ) ( not ( = ?auto_785883 ?auto_785892 ) ) ( not ( = ?auto_785883 ?auto_785893 ) ) ( not ( = ?auto_785883 ?auto_785894 ) ) ( not ( = ?auto_785883 ?auto_785895 ) ) ( not ( = ?auto_785884 ?auto_785885 ) ) ( not ( = ?auto_785884 ?auto_785886 ) ) ( not ( = ?auto_785884 ?auto_785887 ) ) ( not ( = ?auto_785884 ?auto_785888 ) ) ( not ( = ?auto_785884 ?auto_785889 ) ) ( not ( = ?auto_785884 ?auto_785890 ) ) ( not ( = ?auto_785884 ?auto_785891 ) ) ( not ( = ?auto_785884 ?auto_785892 ) ) ( not ( = ?auto_785884 ?auto_785893 ) ) ( not ( = ?auto_785884 ?auto_785894 ) ) ( not ( = ?auto_785884 ?auto_785895 ) ) ( not ( = ?auto_785885 ?auto_785886 ) ) ( not ( = ?auto_785885 ?auto_785887 ) ) ( not ( = ?auto_785885 ?auto_785888 ) ) ( not ( = ?auto_785885 ?auto_785889 ) ) ( not ( = ?auto_785885 ?auto_785890 ) ) ( not ( = ?auto_785885 ?auto_785891 ) ) ( not ( = ?auto_785885 ?auto_785892 ) ) ( not ( = ?auto_785885 ?auto_785893 ) ) ( not ( = ?auto_785885 ?auto_785894 ) ) ( not ( = ?auto_785885 ?auto_785895 ) ) ( not ( = ?auto_785886 ?auto_785887 ) ) ( not ( = ?auto_785886 ?auto_785888 ) ) ( not ( = ?auto_785886 ?auto_785889 ) ) ( not ( = ?auto_785886 ?auto_785890 ) ) ( not ( = ?auto_785886 ?auto_785891 ) ) ( not ( = ?auto_785886 ?auto_785892 ) ) ( not ( = ?auto_785886 ?auto_785893 ) ) ( not ( = ?auto_785886 ?auto_785894 ) ) ( not ( = ?auto_785886 ?auto_785895 ) ) ( not ( = ?auto_785887 ?auto_785888 ) ) ( not ( = ?auto_785887 ?auto_785889 ) ) ( not ( = ?auto_785887 ?auto_785890 ) ) ( not ( = ?auto_785887 ?auto_785891 ) ) ( not ( = ?auto_785887 ?auto_785892 ) ) ( not ( = ?auto_785887 ?auto_785893 ) ) ( not ( = ?auto_785887 ?auto_785894 ) ) ( not ( = ?auto_785887 ?auto_785895 ) ) ( not ( = ?auto_785888 ?auto_785889 ) ) ( not ( = ?auto_785888 ?auto_785890 ) ) ( not ( = ?auto_785888 ?auto_785891 ) ) ( not ( = ?auto_785888 ?auto_785892 ) ) ( not ( = ?auto_785888 ?auto_785893 ) ) ( not ( = ?auto_785888 ?auto_785894 ) ) ( not ( = ?auto_785888 ?auto_785895 ) ) ( not ( = ?auto_785889 ?auto_785890 ) ) ( not ( = ?auto_785889 ?auto_785891 ) ) ( not ( = ?auto_785889 ?auto_785892 ) ) ( not ( = ?auto_785889 ?auto_785893 ) ) ( not ( = ?auto_785889 ?auto_785894 ) ) ( not ( = ?auto_785889 ?auto_785895 ) ) ( not ( = ?auto_785890 ?auto_785891 ) ) ( not ( = ?auto_785890 ?auto_785892 ) ) ( not ( = ?auto_785890 ?auto_785893 ) ) ( not ( = ?auto_785890 ?auto_785894 ) ) ( not ( = ?auto_785890 ?auto_785895 ) ) ( not ( = ?auto_785891 ?auto_785892 ) ) ( not ( = ?auto_785891 ?auto_785893 ) ) ( not ( = ?auto_785891 ?auto_785894 ) ) ( not ( = ?auto_785891 ?auto_785895 ) ) ( not ( = ?auto_785892 ?auto_785893 ) ) ( not ( = ?auto_785892 ?auto_785894 ) ) ( not ( = ?auto_785892 ?auto_785895 ) ) ( not ( = ?auto_785893 ?auto_785894 ) ) ( not ( = ?auto_785893 ?auto_785895 ) ) ( not ( = ?auto_785894 ?auto_785895 ) ) ( CLEAR ?auto_785892 ) ( ON ?auto_785893 ?auto_785894 ) ( CLEAR ?auto_785893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_785883 ?auto_785884 ?auto_785885 ?auto_785886 ?auto_785887 ?auto_785888 ?auto_785889 ?auto_785890 ?auto_785891 ?auto_785892 ?auto_785893 )
      ( MAKE-12PILE ?auto_785883 ?auto_785884 ?auto_785885 ?auto_785886 ?auto_785887 ?auto_785888 ?auto_785889 ?auto_785890 ?auto_785891 ?auto_785892 ?auto_785893 ?auto_785894 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_785933 - BLOCK
      ?auto_785934 - BLOCK
      ?auto_785935 - BLOCK
      ?auto_785936 - BLOCK
      ?auto_785937 - BLOCK
      ?auto_785938 - BLOCK
      ?auto_785939 - BLOCK
      ?auto_785940 - BLOCK
      ?auto_785941 - BLOCK
      ?auto_785942 - BLOCK
      ?auto_785943 - BLOCK
      ?auto_785944 - BLOCK
    )
    :vars
    (
      ?auto_785945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785944 ?auto_785945 ) ( ON-TABLE ?auto_785933 ) ( ON ?auto_785934 ?auto_785933 ) ( ON ?auto_785935 ?auto_785934 ) ( ON ?auto_785936 ?auto_785935 ) ( ON ?auto_785937 ?auto_785936 ) ( ON ?auto_785938 ?auto_785937 ) ( ON ?auto_785939 ?auto_785938 ) ( ON ?auto_785940 ?auto_785939 ) ( ON ?auto_785941 ?auto_785940 ) ( not ( = ?auto_785933 ?auto_785934 ) ) ( not ( = ?auto_785933 ?auto_785935 ) ) ( not ( = ?auto_785933 ?auto_785936 ) ) ( not ( = ?auto_785933 ?auto_785937 ) ) ( not ( = ?auto_785933 ?auto_785938 ) ) ( not ( = ?auto_785933 ?auto_785939 ) ) ( not ( = ?auto_785933 ?auto_785940 ) ) ( not ( = ?auto_785933 ?auto_785941 ) ) ( not ( = ?auto_785933 ?auto_785942 ) ) ( not ( = ?auto_785933 ?auto_785943 ) ) ( not ( = ?auto_785933 ?auto_785944 ) ) ( not ( = ?auto_785933 ?auto_785945 ) ) ( not ( = ?auto_785934 ?auto_785935 ) ) ( not ( = ?auto_785934 ?auto_785936 ) ) ( not ( = ?auto_785934 ?auto_785937 ) ) ( not ( = ?auto_785934 ?auto_785938 ) ) ( not ( = ?auto_785934 ?auto_785939 ) ) ( not ( = ?auto_785934 ?auto_785940 ) ) ( not ( = ?auto_785934 ?auto_785941 ) ) ( not ( = ?auto_785934 ?auto_785942 ) ) ( not ( = ?auto_785934 ?auto_785943 ) ) ( not ( = ?auto_785934 ?auto_785944 ) ) ( not ( = ?auto_785934 ?auto_785945 ) ) ( not ( = ?auto_785935 ?auto_785936 ) ) ( not ( = ?auto_785935 ?auto_785937 ) ) ( not ( = ?auto_785935 ?auto_785938 ) ) ( not ( = ?auto_785935 ?auto_785939 ) ) ( not ( = ?auto_785935 ?auto_785940 ) ) ( not ( = ?auto_785935 ?auto_785941 ) ) ( not ( = ?auto_785935 ?auto_785942 ) ) ( not ( = ?auto_785935 ?auto_785943 ) ) ( not ( = ?auto_785935 ?auto_785944 ) ) ( not ( = ?auto_785935 ?auto_785945 ) ) ( not ( = ?auto_785936 ?auto_785937 ) ) ( not ( = ?auto_785936 ?auto_785938 ) ) ( not ( = ?auto_785936 ?auto_785939 ) ) ( not ( = ?auto_785936 ?auto_785940 ) ) ( not ( = ?auto_785936 ?auto_785941 ) ) ( not ( = ?auto_785936 ?auto_785942 ) ) ( not ( = ?auto_785936 ?auto_785943 ) ) ( not ( = ?auto_785936 ?auto_785944 ) ) ( not ( = ?auto_785936 ?auto_785945 ) ) ( not ( = ?auto_785937 ?auto_785938 ) ) ( not ( = ?auto_785937 ?auto_785939 ) ) ( not ( = ?auto_785937 ?auto_785940 ) ) ( not ( = ?auto_785937 ?auto_785941 ) ) ( not ( = ?auto_785937 ?auto_785942 ) ) ( not ( = ?auto_785937 ?auto_785943 ) ) ( not ( = ?auto_785937 ?auto_785944 ) ) ( not ( = ?auto_785937 ?auto_785945 ) ) ( not ( = ?auto_785938 ?auto_785939 ) ) ( not ( = ?auto_785938 ?auto_785940 ) ) ( not ( = ?auto_785938 ?auto_785941 ) ) ( not ( = ?auto_785938 ?auto_785942 ) ) ( not ( = ?auto_785938 ?auto_785943 ) ) ( not ( = ?auto_785938 ?auto_785944 ) ) ( not ( = ?auto_785938 ?auto_785945 ) ) ( not ( = ?auto_785939 ?auto_785940 ) ) ( not ( = ?auto_785939 ?auto_785941 ) ) ( not ( = ?auto_785939 ?auto_785942 ) ) ( not ( = ?auto_785939 ?auto_785943 ) ) ( not ( = ?auto_785939 ?auto_785944 ) ) ( not ( = ?auto_785939 ?auto_785945 ) ) ( not ( = ?auto_785940 ?auto_785941 ) ) ( not ( = ?auto_785940 ?auto_785942 ) ) ( not ( = ?auto_785940 ?auto_785943 ) ) ( not ( = ?auto_785940 ?auto_785944 ) ) ( not ( = ?auto_785940 ?auto_785945 ) ) ( not ( = ?auto_785941 ?auto_785942 ) ) ( not ( = ?auto_785941 ?auto_785943 ) ) ( not ( = ?auto_785941 ?auto_785944 ) ) ( not ( = ?auto_785941 ?auto_785945 ) ) ( not ( = ?auto_785942 ?auto_785943 ) ) ( not ( = ?auto_785942 ?auto_785944 ) ) ( not ( = ?auto_785942 ?auto_785945 ) ) ( not ( = ?auto_785943 ?auto_785944 ) ) ( not ( = ?auto_785943 ?auto_785945 ) ) ( not ( = ?auto_785944 ?auto_785945 ) ) ( ON ?auto_785943 ?auto_785944 ) ( CLEAR ?auto_785941 ) ( ON ?auto_785942 ?auto_785943 ) ( CLEAR ?auto_785942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_785933 ?auto_785934 ?auto_785935 ?auto_785936 ?auto_785937 ?auto_785938 ?auto_785939 ?auto_785940 ?auto_785941 ?auto_785942 )
      ( MAKE-12PILE ?auto_785933 ?auto_785934 ?auto_785935 ?auto_785936 ?auto_785937 ?auto_785938 ?auto_785939 ?auto_785940 ?auto_785941 ?auto_785942 ?auto_785943 ?auto_785944 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_785983 - BLOCK
      ?auto_785984 - BLOCK
      ?auto_785985 - BLOCK
      ?auto_785986 - BLOCK
      ?auto_785987 - BLOCK
      ?auto_785988 - BLOCK
      ?auto_785989 - BLOCK
      ?auto_785990 - BLOCK
      ?auto_785991 - BLOCK
      ?auto_785992 - BLOCK
      ?auto_785993 - BLOCK
      ?auto_785994 - BLOCK
    )
    :vars
    (
      ?auto_785995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_785994 ?auto_785995 ) ( ON-TABLE ?auto_785983 ) ( ON ?auto_785984 ?auto_785983 ) ( ON ?auto_785985 ?auto_785984 ) ( ON ?auto_785986 ?auto_785985 ) ( ON ?auto_785987 ?auto_785986 ) ( ON ?auto_785988 ?auto_785987 ) ( ON ?auto_785989 ?auto_785988 ) ( ON ?auto_785990 ?auto_785989 ) ( not ( = ?auto_785983 ?auto_785984 ) ) ( not ( = ?auto_785983 ?auto_785985 ) ) ( not ( = ?auto_785983 ?auto_785986 ) ) ( not ( = ?auto_785983 ?auto_785987 ) ) ( not ( = ?auto_785983 ?auto_785988 ) ) ( not ( = ?auto_785983 ?auto_785989 ) ) ( not ( = ?auto_785983 ?auto_785990 ) ) ( not ( = ?auto_785983 ?auto_785991 ) ) ( not ( = ?auto_785983 ?auto_785992 ) ) ( not ( = ?auto_785983 ?auto_785993 ) ) ( not ( = ?auto_785983 ?auto_785994 ) ) ( not ( = ?auto_785983 ?auto_785995 ) ) ( not ( = ?auto_785984 ?auto_785985 ) ) ( not ( = ?auto_785984 ?auto_785986 ) ) ( not ( = ?auto_785984 ?auto_785987 ) ) ( not ( = ?auto_785984 ?auto_785988 ) ) ( not ( = ?auto_785984 ?auto_785989 ) ) ( not ( = ?auto_785984 ?auto_785990 ) ) ( not ( = ?auto_785984 ?auto_785991 ) ) ( not ( = ?auto_785984 ?auto_785992 ) ) ( not ( = ?auto_785984 ?auto_785993 ) ) ( not ( = ?auto_785984 ?auto_785994 ) ) ( not ( = ?auto_785984 ?auto_785995 ) ) ( not ( = ?auto_785985 ?auto_785986 ) ) ( not ( = ?auto_785985 ?auto_785987 ) ) ( not ( = ?auto_785985 ?auto_785988 ) ) ( not ( = ?auto_785985 ?auto_785989 ) ) ( not ( = ?auto_785985 ?auto_785990 ) ) ( not ( = ?auto_785985 ?auto_785991 ) ) ( not ( = ?auto_785985 ?auto_785992 ) ) ( not ( = ?auto_785985 ?auto_785993 ) ) ( not ( = ?auto_785985 ?auto_785994 ) ) ( not ( = ?auto_785985 ?auto_785995 ) ) ( not ( = ?auto_785986 ?auto_785987 ) ) ( not ( = ?auto_785986 ?auto_785988 ) ) ( not ( = ?auto_785986 ?auto_785989 ) ) ( not ( = ?auto_785986 ?auto_785990 ) ) ( not ( = ?auto_785986 ?auto_785991 ) ) ( not ( = ?auto_785986 ?auto_785992 ) ) ( not ( = ?auto_785986 ?auto_785993 ) ) ( not ( = ?auto_785986 ?auto_785994 ) ) ( not ( = ?auto_785986 ?auto_785995 ) ) ( not ( = ?auto_785987 ?auto_785988 ) ) ( not ( = ?auto_785987 ?auto_785989 ) ) ( not ( = ?auto_785987 ?auto_785990 ) ) ( not ( = ?auto_785987 ?auto_785991 ) ) ( not ( = ?auto_785987 ?auto_785992 ) ) ( not ( = ?auto_785987 ?auto_785993 ) ) ( not ( = ?auto_785987 ?auto_785994 ) ) ( not ( = ?auto_785987 ?auto_785995 ) ) ( not ( = ?auto_785988 ?auto_785989 ) ) ( not ( = ?auto_785988 ?auto_785990 ) ) ( not ( = ?auto_785988 ?auto_785991 ) ) ( not ( = ?auto_785988 ?auto_785992 ) ) ( not ( = ?auto_785988 ?auto_785993 ) ) ( not ( = ?auto_785988 ?auto_785994 ) ) ( not ( = ?auto_785988 ?auto_785995 ) ) ( not ( = ?auto_785989 ?auto_785990 ) ) ( not ( = ?auto_785989 ?auto_785991 ) ) ( not ( = ?auto_785989 ?auto_785992 ) ) ( not ( = ?auto_785989 ?auto_785993 ) ) ( not ( = ?auto_785989 ?auto_785994 ) ) ( not ( = ?auto_785989 ?auto_785995 ) ) ( not ( = ?auto_785990 ?auto_785991 ) ) ( not ( = ?auto_785990 ?auto_785992 ) ) ( not ( = ?auto_785990 ?auto_785993 ) ) ( not ( = ?auto_785990 ?auto_785994 ) ) ( not ( = ?auto_785990 ?auto_785995 ) ) ( not ( = ?auto_785991 ?auto_785992 ) ) ( not ( = ?auto_785991 ?auto_785993 ) ) ( not ( = ?auto_785991 ?auto_785994 ) ) ( not ( = ?auto_785991 ?auto_785995 ) ) ( not ( = ?auto_785992 ?auto_785993 ) ) ( not ( = ?auto_785992 ?auto_785994 ) ) ( not ( = ?auto_785992 ?auto_785995 ) ) ( not ( = ?auto_785993 ?auto_785994 ) ) ( not ( = ?auto_785993 ?auto_785995 ) ) ( not ( = ?auto_785994 ?auto_785995 ) ) ( ON ?auto_785993 ?auto_785994 ) ( ON ?auto_785992 ?auto_785993 ) ( CLEAR ?auto_785990 ) ( ON ?auto_785991 ?auto_785992 ) ( CLEAR ?auto_785991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_785983 ?auto_785984 ?auto_785985 ?auto_785986 ?auto_785987 ?auto_785988 ?auto_785989 ?auto_785990 ?auto_785991 )
      ( MAKE-12PILE ?auto_785983 ?auto_785984 ?auto_785985 ?auto_785986 ?auto_785987 ?auto_785988 ?auto_785989 ?auto_785990 ?auto_785991 ?auto_785992 ?auto_785993 ?auto_785994 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_786033 - BLOCK
      ?auto_786034 - BLOCK
      ?auto_786035 - BLOCK
      ?auto_786036 - BLOCK
      ?auto_786037 - BLOCK
      ?auto_786038 - BLOCK
      ?auto_786039 - BLOCK
      ?auto_786040 - BLOCK
      ?auto_786041 - BLOCK
      ?auto_786042 - BLOCK
      ?auto_786043 - BLOCK
      ?auto_786044 - BLOCK
    )
    :vars
    (
      ?auto_786045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786044 ?auto_786045 ) ( ON-TABLE ?auto_786033 ) ( ON ?auto_786034 ?auto_786033 ) ( ON ?auto_786035 ?auto_786034 ) ( ON ?auto_786036 ?auto_786035 ) ( ON ?auto_786037 ?auto_786036 ) ( ON ?auto_786038 ?auto_786037 ) ( ON ?auto_786039 ?auto_786038 ) ( not ( = ?auto_786033 ?auto_786034 ) ) ( not ( = ?auto_786033 ?auto_786035 ) ) ( not ( = ?auto_786033 ?auto_786036 ) ) ( not ( = ?auto_786033 ?auto_786037 ) ) ( not ( = ?auto_786033 ?auto_786038 ) ) ( not ( = ?auto_786033 ?auto_786039 ) ) ( not ( = ?auto_786033 ?auto_786040 ) ) ( not ( = ?auto_786033 ?auto_786041 ) ) ( not ( = ?auto_786033 ?auto_786042 ) ) ( not ( = ?auto_786033 ?auto_786043 ) ) ( not ( = ?auto_786033 ?auto_786044 ) ) ( not ( = ?auto_786033 ?auto_786045 ) ) ( not ( = ?auto_786034 ?auto_786035 ) ) ( not ( = ?auto_786034 ?auto_786036 ) ) ( not ( = ?auto_786034 ?auto_786037 ) ) ( not ( = ?auto_786034 ?auto_786038 ) ) ( not ( = ?auto_786034 ?auto_786039 ) ) ( not ( = ?auto_786034 ?auto_786040 ) ) ( not ( = ?auto_786034 ?auto_786041 ) ) ( not ( = ?auto_786034 ?auto_786042 ) ) ( not ( = ?auto_786034 ?auto_786043 ) ) ( not ( = ?auto_786034 ?auto_786044 ) ) ( not ( = ?auto_786034 ?auto_786045 ) ) ( not ( = ?auto_786035 ?auto_786036 ) ) ( not ( = ?auto_786035 ?auto_786037 ) ) ( not ( = ?auto_786035 ?auto_786038 ) ) ( not ( = ?auto_786035 ?auto_786039 ) ) ( not ( = ?auto_786035 ?auto_786040 ) ) ( not ( = ?auto_786035 ?auto_786041 ) ) ( not ( = ?auto_786035 ?auto_786042 ) ) ( not ( = ?auto_786035 ?auto_786043 ) ) ( not ( = ?auto_786035 ?auto_786044 ) ) ( not ( = ?auto_786035 ?auto_786045 ) ) ( not ( = ?auto_786036 ?auto_786037 ) ) ( not ( = ?auto_786036 ?auto_786038 ) ) ( not ( = ?auto_786036 ?auto_786039 ) ) ( not ( = ?auto_786036 ?auto_786040 ) ) ( not ( = ?auto_786036 ?auto_786041 ) ) ( not ( = ?auto_786036 ?auto_786042 ) ) ( not ( = ?auto_786036 ?auto_786043 ) ) ( not ( = ?auto_786036 ?auto_786044 ) ) ( not ( = ?auto_786036 ?auto_786045 ) ) ( not ( = ?auto_786037 ?auto_786038 ) ) ( not ( = ?auto_786037 ?auto_786039 ) ) ( not ( = ?auto_786037 ?auto_786040 ) ) ( not ( = ?auto_786037 ?auto_786041 ) ) ( not ( = ?auto_786037 ?auto_786042 ) ) ( not ( = ?auto_786037 ?auto_786043 ) ) ( not ( = ?auto_786037 ?auto_786044 ) ) ( not ( = ?auto_786037 ?auto_786045 ) ) ( not ( = ?auto_786038 ?auto_786039 ) ) ( not ( = ?auto_786038 ?auto_786040 ) ) ( not ( = ?auto_786038 ?auto_786041 ) ) ( not ( = ?auto_786038 ?auto_786042 ) ) ( not ( = ?auto_786038 ?auto_786043 ) ) ( not ( = ?auto_786038 ?auto_786044 ) ) ( not ( = ?auto_786038 ?auto_786045 ) ) ( not ( = ?auto_786039 ?auto_786040 ) ) ( not ( = ?auto_786039 ?auto_786041 ) ) ( not ( = ?auto_786039 ?auto_786042 ) ) ( not ( = ?auto_786039 ?auto_786043 ) ) ( not ( = ?auto_786039 ?auto_786044 ) ) ( not ( = ?auto_786039 ?auto_786045 ) ) ( not ( = ?auto_786040 ?auto_786041 ) ) ( not ( = ?auto_786040 ?auto_786042 ) ) ( not ( = ?auto_786040 ?auto_786043 ) ) ( not ( = ?auto_786040 ?auto_786044 ) ) ( not ( = ?auto_786040 ?auto_786045 ) ) ( not ( = ?auto_786041 ?auto_786042 ) ) ( not ( = ?auto_786041 ?auto_786043 ) ) ( not ( = ?auto_786041 ?auto_786044 ) ) ( not ( = ?auto_786041 ?auto_786045 ) ) ( not ( = ?auto_786042 ?auto_786043 ) ) ( not ( = ?auto_786042 ?auto_786044 ) ) ( not ( = ?auto_786042 ?auto_786045 ) ) ( not ( = ?auto_786043 ?auto_786044 ) ) ( not ( = ?auto_786043 ?auto_786045 ) ) ( not ( = ?auto_786044 ?auto_786045 ) ) ( ON ?auto_786043 ?auto_786044 ) ( ON ?auto_786042 ?auto_786043 ) ( ON ?auto_786041 ?auto_786042 ) ( CLEAR ?auto_786039 ) ( ON ?auto_786040 ?auto_786041 ) ( CLEAR ?auto_786040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_786033 ?auto_786034 ?auto_786035 ?auto_786036 ?auto_786037 ?auto_786038 ?auto_786039 ?auto_786040 )
      ( MAKE-12PILE ?auto_786033 ?auto_786034 ?auto_786035 ?auto_786036 ?auto_786037 ?auto_786038 ?auto_786039 ?auto_786040 ?auto_786041 ?auto_786042 ?auto_786043 ?auto_786044 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_786083 - BLOCK
      ?auto_786084 - BLOCK
      ?auto_786085 - BLOCK
      ?auto_786086 - BLOCK
      ?auto_786087 - BLOCK
      ?auto_786088 - BLOCK
      ?auto_786089 - BLOCK
      ?auto_786090 - BLOCK
      ?auto_786091 - BLOCK
      ?auto_786092 - BLOCK
      ?auto_786093 - BLOCK
      ?auto_786094 - BLOCK
    )
    :vars
    (
      ?auto_786095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786094 ?auto_786095 ) ( ON-TABLE ?auto_786083 ) ( ON ?auto_786084 ?auto_786083 ) ( ON ?auto_786085 ?auto_786084 ) ( ON ?auto_786086 ?auto_786085 ) ( ON ?auto_786087 ?auto_786086 ) ( ON ?auto_786088 ?auto_786087 ) ( not ( = ?auto_786083 ?auto_786084 ) ) ( not ( = ?auto_786083 ?auto_786085 ) ) ( not ( = ?auto_786083 ?auto_786086 ) ) ( not ( = ?auto_786083 ?auto_786087 ) ) ( not ( = ?auto_786083 ?auto_786088 ) ) ( not ( = ?auto_786083 ?auto_786089 ) ) ( not ( = ?auto_786083 ?auto_786090 ) ) ( not ( = ?auto_786083 ?auto_786091 ) ) ( not ( = ?auto_786083 ?auto_786092 ) ) ( not ( = ?auto_786083 ?auto_786093 ) ) ( not ( = ?auto_786083 ?auto_786094 ) ) ( not ( = ?auto_786083 ?auto_786095 ) ) ( not ( = ?auto_786084 ?auto_786085 ) ) ( not ( = ?auto_786084 ?auto_786086 ) ) ( not ( = ?auto_786084 ?auto_786087 ) ) ( not ( = ?auto_786084 ?auto_786088 ) ) ( not ( = ?auto_786084 ?auto_786089 ) ) ( not ( = ?auto_786084 ?auto_786090 ) ) ( not ( = ?auto_786084 ?auto_786091 ) ) ( not ( = ?auto_786084 ?auto_786092 ) ) ( not ( = ?auto_786084 ?auto_786093 ) ) ( not ( = ?auto_786084 ?auto_786094 ) ) ( not ( = ?auto_786084 ?auto_786095 ) ) ( not ( = ?auto_786085 ?auto_786086 ) ) ( not ( = ?auto_786085 ?auto_786087 ) ) ( not ( = ?auto_786085 ?auto_786088 ) ) ( not ( = ?auto_786085 ?auto_786089 ) ) ( not ( = ?auto_786085 ?auto_786090 ) ) ( not ( = ?auto_786085 ?auto_786091 ) ) ( not ( = ?auto_786085 ?auto_786092 ) ) ( not ( = ?auto_786085 ?auto_786093 ) ) ( not ( = ?auto_786085 ?auto_786094 ) ) ( not ( = ?auto_786085 ?auto_786095 ) ) ( not ( = ?auto_786086 ?auto_786087 ) ) ( not ( = ?auto_786086 ?auto_786088 ) ) ( not ( = ?auto_786086 ?auto_786089 ) ) ( not ( = ?auto_786086 ?auto_786090 ) ) ( not ( = ?auto_786086 ?auto_786091 ) ) ( not ( = ?auto_786086 ?auto_786092 ) ) ( not ( = ?auto_786086 ?auto_786093 ) ) ( not ( = ?auto_786086 ?auto_786094 ) ) ( not ( = ?auto_786086 ?auto_786095 ) ) ( not ( = ?auto_786087 ?auto_786088 ) ) ( not ( = ?auto_786087 ?auto_786089 ) ) ( not ( = ?auto_786087 ?auto_786090 ) ) ( not ( = ?auto_786087 ?auto_786091 ) ) ( not ( = ?auto_786087 ?auto_786092 ) ) ( not ( = ?auto_786087 ?auto_786093 ) ) ( not ( = ?auto_786087 ?auto_786094 ) ) ( not ( = ?auto_786087 ?auto_786095 ) ) ( not ( = ?auto_786088 ?auto_786089 ) ) ( not ( = ?auto_786088 ?auto_786090 ) ) ( not ( = ?auto_786088 ?auto_786091 ) ) ( not ( = ?auto_786088 ?auto_786092 ) ) ( not ( = ?auto_786088 ?auto_786093 ) ) ( not ( = ?auto_786088 ?auto_786094 ) ) ( not ( = ?auto_786088 ?auto_786095 ) ) ( not ( = ?auto_786089 ?auto_786090 ) ) ( not ( = ?auto_786089 ?auto_786091 ) ) ( not ( = ?auto_786089 ?auto_786092 ) ) ( not ( = ?auto_786089 ?auto_786093 ) ) ( not ( = ?auto_786089 ?auto_786094 ) ) ( not ( = ?auto_786089 ?auto_786095 ) ) ( not ( = ?auto_786090 ?auto_786091 ) ) ( not ( = ?auto_786090 ?auto_786092 ) ) ( not ( = ?auto_786090 ?auto_786093 ) ) ( not ( = ?auto_786090 ?auto_786094 ) ) ( not ( = ?auto_786090 ?auto_786095 ) ) ( not ( = ?auto_786091 ?auto_786092 ) ) ( not ( = ?auto_786091 ?auto_786093 ) ) ( not ( = ?auto_786091 ?auto_786094 ) ) ( not ( = ?auto_786091 ?auto_786095 ) ) ( not ( = ?auto_786092 ?auto_786093 ) ) ( not ( = ?auto_786092 ?auto_786094 ) ) ( not ( = ?auto_786092 ?auto_786095 ) ) ( not ( = ?auto_786093 ?auto_786094 ) ) ( not ( = ?auto_786093 ?auto_786095 ) ) ( not ( = ?auto_786094 ?auto_786095 ) ) ( ON ?auto_786093 ?auto_786094 ) ( ON ?auto_786092 ?auto_786093 ) ( ON ?auto_786091 ?auto_786092 ) ( ON ?auto_786090 ?auto_786091 ) ( CLEAR ?auto_786088 ) ( ON ?auto_786089 ?auto_786090 ) ( CLEAR ?auto_786089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_786083 ?auto_786084 ?auto_786085 ?auto_786086 ?auto_786087 ?auto_786088 ?auto_786089 )
      ( MAKE-12PILE ?auto_786083 ?auto_786084 ?auto_786085 ?auto_786086 ?auto_786087 ?auto_786088 ?auto_786089 ?auto_786090 ?auto_786091 ?auto_786092 ?auto_786093 ?auto_786094 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_786133 - BLOCK
      ?auto_786134 - BLOCK
      ?auto_786135 - BLOCK
      ?auto_786136 - BLOCK
      ?auto_786137 - BLOCK
      ?auto_786138 - BLOCK
      ?auto_786139 - BLOCK
      ?auto_786140 - BLOCK
      ?auto_786141 - BLOCK
      ?auto_786142 - BLOCK
      ?auto_786143 - BLOCK
      ?auto_786144 - BLOCK
    )
    :vars
    (
      ?auto_786145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786144 ?auto_786145 ) ( ON-TABLE ?auto_786133 ) ( ON ?auto_786134 ?auto_786133 ) ( ON ?auto_786135 ?auto_786134 ) ( ON ?auto_786136 ?auto_786135 ) ( ON ?auto_786137 ?auto_786136 ) ( not ( = ?auto_786133 ?auto_786134 ) ) ( not ( = ?auto_786133 ?auto_786135 ) ) ( not ( = ?auto_786133 ?auto_786136 ) ) ( not ( = ?auto_786133 ?auto_786137 ) ) ( not ( = ?auto_786133 ?auto_786138 ) ) ( not ( = ?auto_786133 ?auto_786139 ) ) ( not ( = ?auto_786133 ?auto_786140 ) ) ( not ( = ?auto_786133 ?auto_786141 ) ) ( not ( = ?auto_786133 ?auto_786142 ) ) ( not ( = ?auto_786133 ?auto_786143 ) ) ( not ( = ?auto_786133 ?auto_786144 ) ) ( not ( = ?auto_786133 ?auto_786145 ) ) ( not ( = ?auto_786134 ?auto_786135 ) ) ( not ( = ?auto_786134 ?auto_786136 ) ) ( not ( = ?auto_786134 ?auto_786137 ) ) ( not ( = ?auto_786134 ?auto_786138 ) ) ( not ( = ?auto_786134 ?auto_786139 ) ) ( not ( = ?auto_786134 ?auto_786140 ) ) ( not ( = ?auto_786134 ?auto_786141 ) ) ( not ( = ?auto_786134 ?auto_786142 ) ) ( not ( = ?auto_786134 ?auto_786143 ) ) ( not ( = ?auto_786134 ?auto_786144 ) ) ( not ( = ?auto_786134 ?auto_786145 ) ) ( not ( = ?auto_786135 ?auto_786136 ) ) ( not ( = ?auto_786135 ?auto_786137 ) ) ( not ( = ?auto_786135 ?auto_786138 ) ) ( not ( = ?auto_786135 ?auto_786139 ) ) ( not ( = ?auto_786135 ?auto_786140 ) ) ( not ( = ?auto_786135 ?auto_786141 ) ) ( not ( = ?auto_786135 ?auto_786142 ) ) ( not ( = ?auto_786135 ?auto_786143 ) ) ( not ( = ?auto_786135 ?auto_786144 ) ) ( not ( = ?auto_786135 ?auto_786145 ) ) ( not ( = ?auto_786136 ?auto_786137 ) ) ( not ( = ?auto_786136 ?auto_786138 ) ) ( not ( = ?auto_786136 ?auto_786139 ) ) ( not ( = ?auto_786136 ?auto_786140 ) ) ( not ( = ?auto_786136 ?auto_786141 ) ) ( not ( = ?auto_786136 ?auto_786142 ) ) ( not ( = ?auto_786136 ?auto_786143 ) ) ( not ( = ?auto_786136 ?auto_786144 ) ) ( not ( = ?auto_786136 ?auto_786145 ) ) ( not ( = ?auto_786137 ?auto_786138 ) ) ( not ( = ?auto_786137 ?auto_786139 ) ) ( not ( = ?auto_786137 ?auto_786140 ) ) ( not ( = ?auto_786137 ?auto_786141 ) ) ( not ( = ?auto_786137 ?auto_786142 ) ) ( not ( = ?auto_786137 ?auto_786143 ) ) ( not ( = ?auto_786137 ?auto_786144 ) ) ( not ( = ?auto_786137 ?auto_786145 ) ) ( not ( = ?auto_786138 ?auto_786139 ) ) ( not ( = ?auto_786138 ?auto_786140 ) ) ( not ( = ?auto_786138 ?auto_786141 ) ) ( not ( = ?auto_786138 ?auto_786142 ) ) ( not ( = ?auto_786138 ?auto_786143 ) ) ( not ( = ?auto_786138 ?auto_786144 ) ) ( not ( = ?auto_786138 ?auto_786145 ) ) ( not ( = ?auto_786139 ?auto_786140 ) ) ( not ( = ?auto_786139 ?auto_786141 ) ) ( not ( = ?auto_786139 ?auto_786142 ) ) ( not ( = ?auto_786139 ?auto_786143 ) ) ( not ( = ?auto_786139 ?auto_786144 ) ) ( not ( = ?auto_786139 ?auto_786145 ) ) ( not ( = ?auto_786140 ?auto_786141 ) ) ( not ( = ?auto_786140 ?auto_786142 ) ) ( not ( = ?auto_786140 ?auto_786143 ) ) ( not ( = ?auto_786140 ?auto_786144 ) ) ( not ( = ?auto_786140 ?auto_786145 ) ) ( not ( = ?auto_786141 ?auto_786142 ) ) ( not ( = ?auto_786141 ?auto_786143 ) ) ( not ( = ?auto_786141 ?auto_786144 ) ) ( not ( = ?auto_786141 ?auto_786145 ) ) ( not ( = ?auto_786142 ?auto_786143 ) ) ( not ( = ?auto_786142 ?auto_786144 ) ) ( not ( = ?auto_786142 ?auto_786145 ) ) ( not ( = ?auto_786143 ?auto_786144 ) ) ( not ( = ?auto_786143 ?auto_786145 ) ) ( not ( = ?auto_786144 ?auto_786145 ) ) ( ON ?auto_786143 ?auto_786144 ) ( ON ?auto_786142 ?auto_786143 ) ( ON ?auto_786141 ?auto_786142 ) ( ON ?auto_786140 ?auto_786141 ) ( ON ?auto_786139 ?auto_786140 ) ( CLEAR ?auto_786137 ) ( ON ?auto_786138 ?auto_786139 ) ( CLEAR ?auto_786138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_786133 ?auto_786134 ?auto_786135 ?auto_786136 ?auto_786137 ?auto_786138 )
      ( MAKE-12PILE ?auto_786133 ?auto_786134 ?auto_786135 ?auto_786136 ?auto_786137 ?auto_786138 ?auto_786139 ?auto_786140 ?auto_786141 ?auto_786142 ?auto_786143 ?auto_786144 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_786183 - BLOCK
      ?auto_786184 - BLOCK
      ?auto_786185 - BLOCK
      ?auto_786186 - BLOCK
      ?auto_786187 - BLOCK
      ?auto_786188 - BLOCK
      ?auto_786189 - BLOCK
      ?auto_786190 - BLOCK
      ?auto_786191 - BLOCK
      ?auto_786192 - BLOCK
      ?auto_786193 - BLOCK
      ?auto_786194 - BLOCK
    )
    :vars
    (
      ?auto_786195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786194 ?auto_786195 ) ( ON-TABLE ?auto_786183 ) ( ON ?auto_786184 ?auto_786183 ) ( ON ?auto_786185 ?auto_786184 ) ( ON ?auto_786186 ?auto_786185 ) ( not ( = ?auto_786183 ?auto_786184 ) ) ( not ( = ?auto_786183 ?auto_786185 ) ) ( not ( = ?auto_786183 ?auto_786186 ) ) ( not ( = ?auto_786183 ?auto_786187 ) ) ( not ( = ?auto_786183 ?auto_786188 ) ) ( not ( = ?auto_786183 ?auto_786189 ) ) ( not ( = ?auto_786183 ?auto_786190 ) ) ( not ( = ?auto_786183 ?auto_786191 ) ) ( not ( = ?auto_786183 ?auto_786192 ) ) ( not ( = ?auto_786183 ?auto_786193 ) ) ( not ( = ?auto_786183 ?auto_786194 ) ) ( not ( = ?auto_786183 ?auto_786195 ) ) ( not ( = ?auto_786184 ?auto_786185 ) ) ( not ( = ?auto_786184 ?auto_786186 ) ) ( not ( = ?auto_786184 ?auto_786187 ) ) ( not ( = ?auto_786184 ?auto_786188 ) ) ( not ( = ?auto_786184 ?auto_786189 ) ) ( not ( = ?auto_786184 ?auto_786190 ) ) ( not ( = ?auto_786184 ?auto_786191 ) ) ( not ( = ?auto_786184 ?auto_786192 ) ) ( not ( = ?auto_786184 ?auto_786193 ) ) ( not ( = ?auto_786184 ?auto_786194 ) ) ( not ( = ?auto_786184 ?auto_786195 ) ) ( not ( = ?auto_786185 ?auto_786186 ) ) ( not ( = ?auto_786185 ?auto_786187 ) ) ( not ( = ?auto_786185 ?auto_786188 ) ) ( not ( = ?auto_786185 ?auto_786189 ) ) ( not ( = ?auto_786185 ?auto_786190 ) ) ( not ( = ?auto_786185 ?auto_786191 ) ) ( not ( = ?auto_786185 ?auto_786192 ) ) ( not ( = ?auto_786185 ?auto_786193 ) ) ( not ( = ?auto_786185 ?auto_786194 ) ) ( not ( = ?auto_786185 ?auto_786195 ) ) ( not ( = ?auto_786186 ?auto_786187 ) ) ( not ( = ?auto_786186 ?auto_786188 ) ) ( not ( = ?auto_786186 ?auto_786189 ) ) ( not ( = ?auto_786186 ?auto_786190 ) ) ( not ( = ?auto_786186 ?auto_786191 ) ) ( not ( = ?auto_786186 ?auto_786192 ) ) ( not ( = ?auto_786186 ?auto_786193 ) ) ( not ( = ?auto_786186 ?auto_786194 ) ) ( not ( = ?auto_786186 ?auto_786195 ) ) ( not ( = ?auto_786187 ?auto_786188 ) ) ( not ( = ?auto_786187 ?auto_786189 ) ) ( not ( = ?auto_786187 ?auto_786190 ) ) ( not ( = ?auto_786187 ?auto_786191 ) ) ( not ( = ?auto_786187 ?auto_786192 ) ) ( not ( = ?auto_786187 ?auto_786193 ) ) ( not ( = ?auto_786187 ?auto_786194 ) ) ( not ( = ?auto_786187 ?auto_786195 ) ) ( not ( = ?auto_786188 ?auto_786189 ) ) ( not ( = ?auto_786188 ?auto_786190 ) ) ( not ( = ?auto_786188 ?auto_786191 ) ) ( not ( = ?auto_786188 ?auto_786192 ) ) ( not ( = ?auto_786188 ?auto_786193 ) ) ( not ( = ?auto_786188 ?auto_786194 ) ) ( not ( = ?auto_786188 ?auto_786195 ) ) ( not ( = ?auto_786189 ?auto_786190 ) ) ( not ( = ?auto_786189 ?auto_786191 ) ) ( not ( = ?auto_786189 ?auto_786192 ) ) ( not ( = ?auto_786189 ?auto_786193 ) ) ( not ( = ?auto_786189 ?auto_786194 ) ) ( not ( = ?auto_786189 ?auto_786195 ) ) ( not ( = ?auto_786190 ?auto_786191 ) ) ( not ( = ?auto_786190 ?auto_786192 ) ) ( not ( = ?auto_786190 ?auto_786193 ) ) ( not ( = ?auto_786190 ?auto_786194 ) ) ( not ( = ?auto_786190 ?auto_786195 ) ) ( not ( = ?auto_786191 ?auto_786192 ) ) ( not ( = ?auto_786191 ?auto_786193 ) ) ( not ( = ?auto_786191 ?auto_786194 ) ) ( not ( = ?auto_786191 ?auto_786195 ) ) ( not ( = ?auto_786192 ?auto_786193 ) ) ( not ( = ?auto_786192 ?auto_786194 ) ) ( not ( = ?auto_786192 ?auto_786195 ) ) ( not ( = ?auto_786193 ?auto_786194 ) ) ( not ( = ?auto_786193 ?auto_786195 ) ) ( not ( = ?auto_786194 ?auto_786195 ) ) ( ON ?auto_786193 ?auto_786194 ) ( ON ?auto_786192 ?auto_786193 ) ( ON ?auto_786191 ?auto_786192 ) ( ON ?auto_786190 ?auto_786191 ) ( ON ?auto_786189 ?auto_786190 ) ( ON ?auto_786188 ?auto_786189 ) ( CLEAR ?auto_786186 ) ( ON ?auto_786187 ?auto_786188 ) ( CLEAR ?auto_786187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_786183 ?auto_786184 ?auto_786185 ?auto_786186 ?auto_786187 )
      ( MAKE-12PILE ?auto_786183 ?auto_786184 ?auto_786185 ?auto_786186 ?auto_786187 ?auto_786188 ?auto_786189 ?auto_786190 ?auto_786191 ?auto_786192 ?auto_786193 ?auto_786194 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_786233 - BLOCK
      ?auto_786234 - BLOCK
      ?auto_786235 - BLOCK
      ?auto_786236 - BLOCK
      ?auto_786237 - BLOCK
      ?auto_786238 - BLOCK
      ?auto_786239 - BLOCK
      ?auto_786240 - BLOCK
      ?auto_786241 - BLOCK
      ?auto_786242 - BLOCK
      ?auto_786243 - BLOCK
      ?auto_786244 - BLOCK
    )
    :vars
    (
      ?auto_786245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786244 ?auto_786245 ) ( ON-TABLE ?auto_786233 ) ( ON ?auto_786234 ?auto_786233 ) ( ON ?auto_786235 ?auto_786234 ) ( not ( = ?auto_786233 ?auto_786234 ) ) ( not ( = ?auto_786233 ?auto_786235 ) ) ( not ( = ?auto_786233 ?auto_786236 ) ) ( not ( = ?auto_786233 ?auto_786237 ) ) ( not ( = ?auto_786233 ?auto_786238 ) ) ( not ( = ?auto_786233 ?auto_786239 ) ) ( not ( = ?auto_786233 ?auto_786240 ) ) ( not ( = ?auto_786233 ?auto_786241 ) ) ( not ( = ?auto_786233 ?auto_786242 ) ) ( not ( = ?auto_786233 ?auto_786243 ) ) ( not ( = ?auto_786233 ?auto_786244 ) ) ( not ( = ?auto_786233 ?auto_786245 ) ) ( not ( = ?auto_786234 ?auto_786235 ) ) ( not ( = ?auto_786234 ?auto_786236 ) ) ( not ( = ?auto_786234 ?auto_786237 ) ) ( not ( = ?auto_786234 ?auto_786238 ) ) ( not ( = ?auto_786234 ?auto_786239 ) ) ( not ( = ?auto_786234 ?auto_786240 ) ) ( not ( = ?auto_786234 ?auto_786241 ) ) ( not ( = ?auto_786234 ?auto_786242 ) ) ( not ( = ?auto_786234 ?auto_786243 ) ) ( not ( = ?auto_786234 ?auto_786244 ) ) ( not ( = ?auto_786234 ?auto_786245 ) ) ( not ( = ?auto_786235 ?auto_786236 ) ) ( not ( = ?auto_786235 ?auto_786237 ) ) ( not ( = ?auto_786235 ?auto_786238 ) ) ( not ( = ?auto_786235 ?auto_786239 ) ) ( not ( = ?auto_786235 ?auto_786240 ) ) ( not ( = ?auto_786235 ?auto_786241 ) ) ( not ( = ?auto_786235 ?auto_786242 ) ) ( not ( = ?auto_786235 ?auto_786243 ) ) ( not ( = ?auto_786235 ?auto_786244 ) ) ( not ( = ?auto_786235 ?auto_786245 ) ) ( not ( = ?auto_786236 ?auto_786237 ) ) ( not ( = ?auto_786236 ?auto_786238 ) ) ( not ( = ?auto_786236 ?auto_786239 ) ) ( not ( = ?auto_786236 ?auto_786240 ) ) ( not ( = ?auto_786236 ?auto_786241 ) ) ( not ( = ?auto_786236 ?auto_786242 ) ) ( not ( = ?auto_786236 ?auto_786243 ) ) ( not ( = ?auto_786236 ?auto_786244 ) ) ( not ( = ?auto_786236 ?auto_786245 ) ) ( not ( = ?auto_786237 ?auto_786238 ) ) ( not ( = ?auto_786237 ?auto_786239 ) ) ( not ( = ?auto_786237 ?auto_786240 ) ) ( not ( = ?auto_786237 ?auto_786241 ) ) ( not ( = ?auto_786237 ?auto_786242 ) ) ( not ( = ?auto_786237 ?auto_786243 ) ) ( not ( = ?auto_786237 ?auto_786244 ) ) ( not ( = ?auto_786237 ?auto_786245 ) ) ( not ( = ?auto_786238 ?auto_786239 ) ) ( not ( = ?auto_786238 ?auto_786240 ) ) ( not ( = ?auto_786238 ?auto_786241 ) ) ( not ( = ?auto_786238 ?auto_786242 ) ) ( not ( = ?auto_786238 ?auto_786243 ) ) ( not ( = ?auto_786238 ?auto_786244 ) ) ( not ( = ?auto_786238 ?auto_786245 ) ) ( not ( = ?auto_786239 ?auto_786240 ) ) ( not ( = ?auto_786239 ?auto_786241 ) ) ( not ( = ?auto_786239 ?auto_786242 ) ) ( not ( = ?auto_786239 ?auto_786243 ) ) ( not ( = ?auto_786239 ?auto_786244 ) ) ( not ( = ?auto_786239 ?auto_786245 ) ) ( not ( = ?auto_786240 ?auto_786241 ) ) ( not ( = ?auto_786240 ?auto_786242 ) ) ( not ( = ?auto_786240 ?auto_786243 ) ) ( not ( = ?auto_786240 ?auto_786244 ) ) ( not ( = ?auto_786240 ?auto_786245 ) ) ( not ( = ?auto_786241 ?auto_786242 ) ) ( not ( = ?auto_786241 ?auto_786243 ) ) ( not ( = ?auto_786241 ?auto_786244 ) ) ( not ( = ?auto_786241 ?auto_786245 ) ) ( not ( = ?auto_786242 ?auto_786243 ) ) ( not ( = ?auto_786242 ?auto_786244 ) ) ( not ( = ?auto_786242 ?auto_786245 ) ) ( not ( = ?auto_786243 ?auto_786244 ) ) ( not ( = ?auto_786243 ?auto_786245 ) ) ( not ( = ?auto_786244 ?auto_786245 ) ) ( ON ?auto_786243 ?auto_786244 ) ( ON ?auto_786242 ?auto_786243 ) ( ON ?auto_786241 ?auto_786242 ) ( ON ?auto_786240 ?auto_786241 ) ( ON ?auto_786239 ?auto_786240 ) ( ON ?auto_786238 ?auto_786239 ) ( ON ?auto_786237 ?auto_786238 ) ( CLEAR ?auto_786235 ) ( ON ?auto_786236 ?auto_786237 ) ( CLEAR ?auto_786236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_786233 ?auto_786234 ?auto_786235 ?auto_786236 )
      ( MAKE-12PILE ?auto_786233 ?auto_786234 ?auto_786235 ?auto_786236 ?auto_786237 ?auto_786238 ?auto_786239 ?auto_786240 ?auto_786241 ?auto_786242 ?auto_786243 ?auto_786244 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_786283 - BLOCK
      ?auto_786284 - BLOCK
      ?auto_786285 - BLOCK
      ?auto_786286 - BLOCK
      ?auto_786287 - BLOCK
      ?auto_786288 - BLOCK
      ?auto_786289 - BLOCK
      ?auto_786290 - BLOCK
      ?auto_786291 - BLOCK
      ?auto_786292 - BLOCK
      ?auto_786293 - BLOCK
      ?auto_786294 - BLOCK
    )
    :vars
    (
      ?auto_786295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786294 ?auto_786295 ) ( ON-TABLE ?auto_786283 ) ( ON ?auto_786284 ?auto_786283 ) ( not ( = ?auto_786283 ?auto_786284 ) ) ( not ( = ?auto_786283 ?auto_786285 ) ) ( not ( = ?auto_786283 ?auto_786286 ) ) ( not ( = ?auto_786283 ?auto_786287 ) ) ( not ( = ?auto_786283 ?auto_786288 ) ) ( not ( = ?auto_786283 ?auto_786289 ) ) ( not ( = ?auto_786283 ?auto_786290 ) ) ( not ( = ?auto_786283 ?auto_786291 ) ) ( not ( = ?auto_786283 ?auto_786292 ) ) ( not ( = ?auto_786283 ?auto_786293 ) ) ( not ( = ?auto_786283 ?auto_786294 ) ) ( not ( = ?auto_786283 ?auto_786295 ) ) ( not ( = ?auto_786284 ?auto_786285 ) ) ( not ( = ?auto_786284 ?auto_786286 ) ) ( not ( = ?auto_786284 ?auto_786287 ) ) ( not ( = ?auto_786284 ?auto_786288 ) ) ( not ( = ?auto_786284 ?auto_786289 ) ) ( not ( = ?auto_786284 ?auto_786290 ) ) ( not ( = ?auto_786284 ?auto_786291 ) ) ( not ( = ?auto_786284 ?auto_786292 ) ) ( not ( = ?auto_786284 ?auto_786293 ) ) ( not ( = ?auto_786284 ?auto_786294 ) ) ( not ( = ?auto_786284 ?auto_786295 ) ) ( not ( = ?auto_786285 ?auto_786286 ) ) ( not ( = ?auto_786285 ?auto_786287 ) ) ( not ( = ?auto_786285 ?auto_786288 ) ) ( not ( = ?auto_786285 ?auto_786289 ) ) ( not ( = ?auto_786285 ?auto_786290 ) ) ( not ( = ?auto_786285 ?auto_786291 ) ) ( not ( = ?auto_786285 ?auto_786292 ) ) ( not ( = ?auto_786285 ?auto_786293 ) ) ( not ( = ?auto_786285 ?auto_786294 ) ) ( not ( = ?auto_786285 ?auto_786295 ) ) ( not ( = ?auto_786286 ?auto_786287 ) ) ( not ( = ?auto_786286 ?auto_786288 ) ) ( not ( = ?auto_786286 ?auto_786289 ) ) ( not ( = ?auto_786286 ?auto_786290 ) ) ( not ( = ?auto_786286 ?auto_786291 ) ) ( not ( = ?auto_786286 ?auto_786292 ) ) ( not ( = ?auto_786286 ?auto_786293 ) ) ( not ( = ?auto_786286 ?auto_786294 ) ) ( not ( = ?auto_786286 ?auto_786295 ) ) ( not ( = ?auto_786287 ?auto_786288 ) ) ( not ( = ?auto_786287 ?auto_786289 ) ) ( not ( = ?auto_786287 ?auto_786290 ) ) ( not ( = ?auto_786287 ?auto_786291 ) ) ( not ( = ?auto_786287 ?auto_786292 ) ) ( not ( = ?auto_786287 ?auto_786293 ) ) ( not ( = ?auto_786287 ?auto_786294 ) ) ( not ( = ?auto_786287 ?auto_786295 ) ) ( not ( = ?auto_786288 ?auto_786289 ) ) ( not ( = ?auto_786288 ?auto_786290 ) ) ( not ( = ?auto_786288 ?auto_786291 ) ) ( not ( = ?auto_786288 ?auto_786292 ) ) ( not ( = ?auto_786288 ?auto_786293 ) ) ( not ( = ?auto_786288 ?auto_786294 ) ) ( not ( = ?auto_786288 ?auto_786295 ) ) ( not ( = ?auto_786289 ?auto_786290 ) ) ( not ( = ?auto_786289 ?auto_786291 ) ) ( not ( = ?auto_786289 ?auto_786292 ) ) ( not ( = ?auto_786289 ?auto_786293 ) ) ( not ( = ?auto_786289 ?auto_786294 ) ) ( not ( = ?auto_786289 ?auto_786295 ) ) ( not ( = ?auto_786290 ?auto_786291 ) ) ( not ( = ?auto_786290 ?auto_786292 ) ) ( not ( = ?auto_786290 ?auto_786293 ) ) ( not ( = ?auto_786290 ?auto_786294 ) ) ( not ( = ?auto_786290 ?auto_786295 ) ) ( not ( = ?auto_786291 ?auto_786292 ) ) ( not ( = ?auto_786291 ?auto_786293 ) ) ( not ( = ?auto_786291 ?auto_786294 ) ) ( not ( = ?auto_786291 ?auto_786295 ) ) ( not ( = ?auto_786292 ?auto_786293 ) ) ( not ( = ?auto_786292 ?auto_786294 ) ) ( not ( = ?auto_786292 ?auto_786295 ) ) ( not ( = ?auto_786293 ?auto_786294 ) ) ( not ( = ?auto_786293 ?auto_786295 ) ) ( not ( = ?auto_786294 ?auto_786295 ) ) ( ON ?auto_786293 ?auto_786294 ) ( ON ?auto_786292 ?auto_786293 ) ( ON ?auto_786291 ?auto_786292 ) ( ON ?auto_786290 ?auto_786291 ) ( ON ?auto_786289 ?auto_786290 ) ( ON ?auto_786288 ?auto_786289 ) ( ON ?auto_786287 ?auto_786288 ) ( ON ?auto_786286 ?auto_786287 ) ( CLEAR ?auto_786284 ) ( ON ?auto_786285 ?auto_786286 ) ( CLEAR ?auto_786285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_786283 ?auto_786284 ?auto_786285 )
      ( MAKE-12PILE ?auto_786283 ?auto_786284 ?auto_786285 ?auto_786286 ?auto_786287 ?auto_786288 ?auto_786289 ?auto_786290 ?auto_786291 ?auto_786292 ?auto_786293 ?auto_786294 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_786333 - BLOCK
      ?auto_786334 - BLOCK
      ?auto_786335 - BLOCK
      ?auto_786336 - BLOCK
      ?auto_786337 - BLOCK
      ?auto_786338 - BLOCK
      ?auto_786339 - BLOCK
      ?auto_786340 - BLOCK
      ?auto_786341 - BLOCK
      ?auto_786342 - BLOCK
      ?auto_786343 - BLOCK
      ?auto_786344 - BLOCK
    )
    :vars
    (
      ?auto_786345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786344 ?auto_786345 ) ( ON-TABLE ?auto_786333 ) ( not ( = ?auto_786333 ?auto_786334 ) ) ( not ( = ?auto_786333 ?auto_786335 ) ) ( not ( = ?auto_786333 ?auto_786336 ) ) ( not ( = ?auto_786333 ?auto_786337 ) ) ( not ( = ?auto_786333 ?auto_786338 ) ) ( not ( = ?auto_786333 ?auto_786339 ) ) ( not ( = ?auto_786333 ?auto_786340 ) ) ( not ( = ?auto_786333 ?auto_786341 ) ) ( not ( = ?auto_786333 ?auto_786342 ) ) ( not ( = ?auto_786333 ?auto_786343 ) ) ( not ( = ?auto_786333 ?auto_786344 ) ) ( not ( = ?auto_786333 ?auto_786345 ) ) ( not ( = ?auto_786334 ?auto_786335 ) ) ( not ( = ?auto_786334 ?auto_786336 ) ) ( not ( = ?auto_786334 ?auto_786337 ) ) ( not ( = ?auto_786334 ?auto_786338 ) ) ( not ( = ?auto_786334 ?auto_786339 ) ) ( not ( = ?auto_786334 ?auto_786340 ) ) ( not ( = ?auto_786334 ?auto_786341 ) ) ( not ( = ?auto_786334 ?auto_786342 ) ) ( not ( = ?auto_786334 ?auto_786343 ) ) ( not ( = ?auto_786334 ?auto_786344 ) ) ( not ( = ?auto_786334 ?auto_786345 ) ) ( not ( = ?auto_786335 ?auto_786336 ) ) ( not ( = ?auto_786335 ?auto_786337 ) ) ( not ( = ?auto_786335 ?auto_786338 ) ) ( not ( = ?auto_786335 ?auto_786339 ) ) ( not ( = ?auto_786335 ?auto_786340 ) ) ( not ( = ?auto_786335 ?auto_786341 ) ) ( not ( = ?auto_786335 ?auto_786342 ) ) ( not ( = ?auto_786335 ?auto_786343 ) ) ( not ( = ?auto_786335 ?auto_786344 ) ) ( not ( = ?auto_786335 ?auto_786345 ) ) ( not ( = ?auto_786336 ?auto_786337 ) ) ( not ( = ?auto_786336 ?auto_786338 ) ) ( not ( = ?auto_786336 ?auto_786339 ) ) ( not ( = ?auto_786336 ?auto_786340 ) ) ( not ( = ?auto_786336 ?auto_786341 ) ) ( not ( = ?auto_786336 ?auto_786342 ) ) ( not ( = ?auto_786336 ?auto_786343 ) ) ( not ( = ?auto_786336 ?auto_786344 ) ) ( not ( = ?auto_786336 ?auto_786345 ) ) ( not ( = ?auto_786337 ?auto_786338 ) ) ( not ( = ?auto_786337 ?auto_786339 ) ) ( not ( = ?auto_786337 ?auto_786340 ) ) ( not ( = ?auto_786337 ?auto_786341 ) ) ( not ( = ?auto_786337 ?auto_786342 ) ) ( not ( = ?auto_786337 ?auto_786343 ) ) ( not ( = ?auto_786337 ?auto_786344 ) ) ( not ( = ?auto_786337 ?auto_786345 ) ) ( not ( = ?auto_786338 ?auto_786339 ) ) ( not ( = ?auto_786338 ?auto_786340 ) ) ( not ( = ?auto_786338 ?auto_786341 ) ) ( not ( = ?auto_786338 ?auto_786342 ) ) ( not ( = ?auto_786338 ?auto_786343 ) ) ( not ( = ?auto_786338 ?auto_786344 ) ) ( not ( = ?auto_786338 ?auto_786345 ) ) ( not ( = ?auto_786339 ?auto_786340 ) ) ( not ( = ?auto_786339 ?auto_786341 ) ) ( not ( = ?auto_786339 ?auto_786342 ) ) ( not ( = ?auto_786339 ?auto_786343 ) ) ( not ( = ?auto_786339 ?auto_786344 ) ) ( not ( = ?auto_786339 ?auto_786345 ) ) ( not ( = ?auto_786340 ?auto_786341 ) ) ( not ( = ?auto_786340 ?auto_786342 ) ) ( not ( = ?auto_786340 ?auto_786343 ) ) ( not ( = ?auto_786340 ?auto_786344 ) ) ( not ( = ?auto_786340 ?auto_786345 ) ) ( not ( = ?auto_786341 ?auto_786342 ) ) ( not ( = ?auto_786341 ?auto_786343 ) ) ( not ( = ?auto_786341 ?auto_786344 ) ) ( not ( = ?auto_786341 ?auto_786345 ) ) ( not ( = ?auto_786342 ?auto_786343 ) ) ( not ( = ?auto_786342 ?auto_786344 ) ) ( not ( = ?auto_786342 ?auto_786345 ) ) ( not ( = ?auto_786343 ?auto_786344 ) ) ( not ( = ?auto_786343 ?auto_786345 ) ) ( not ( = ?auto_786344 ?auto_786345 ) ) ( ON ?auto_786343 ?auto_786344 ) ( ON ?auto_786342 ?auto_786343 ) ( ON ?auto_786341 ?auto_786342 ) ( ON ?auto_786340 ?auto_786341 ) ( ON ?auto_786339 ?auto_786340 ) ( ON ?auto_786338 ?auto_786339 ) ( ON ?auto_786337 ?auto_786338 ) ( ON ?auto_786336 ?auto_786337 ) ( ON ?auto_786335 ?auto_786336 ) ( CLEAR ?auto_786333 ) ( ON ?auto_786334 ?auto_786335 ) ( CLEAR ?auto_786334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_786333 ?auto_786334 )
      ( MAKE-12PILE ?auto_786333 ?auto_786334 ?auto_786335 ?auto_786336 ?auto_786337 ?auto_786338 ?auto_786339 ?auto_786340 ?auto_786341 ?auto_786342 ?auto_786343 ?auto_786344 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_786383 - BLOCK
      ?auto_786384 - BLOCK
      ?auto_786385 - BLOCK
      ?auto_786386 - BLOCK
      ?auto_786387 - BLOCK
      ?auto_786388 - BLOCK
      ?auto_786389 - BLOCK
      ?auto_786390 - BLOCK
      ?auto_786391 - BLOCK
      ?auto_786392 - BLOCK
      ?auto_786393 - BLOCK
      ?auto_786394 - BLOCK
    )
    :vars
    (
      ?auto_786395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786394 ?auto_786395 ) ( not ( = ?auto_786383 ?auto_786384 ) ) ( not ( = ?auto_786383 ?auto_786385 ) ) ( not ( = ?auto_786383 ?auto_786386 ) ) ( not ( = ?auto_786383 ?auto_786387 ) ) ( not ( = ?auto_786383 ?auto_786388 ) ) ( not ( = ?auto_786383 ?auto_786389 ) ) ( not ( = ?auto_786383 ?auto_786390 ) ) ( not ( = ?auto_786383 ?auto_786391 ) ) ( not ( = ?auto_786383 ?auto_786392 ) ) ( not ( = ?auto_786383 ?auto_786393 ) ) ( not ( = ?auto_786383 ?auto_786394 ) ) ( not ( = ?auto_786383 ?auto_786395 ) ) ( not ( = ?auto_786384 ?auto_786385 ) ) ( not ( = ?auto_786384 ?auto_786386 ) ) ( not ( = ?auto_786384 ?auto_786387 ) ) ( not ( = ?auto_786384 ?auto_786388 ) ) ( not ( = ?auto_786384 ?auto_786389 ) ) ( not ( = ?auto_786384 ?auto_786390 ) ) ( not ( = ?auto_786384 ?auto_786391 ) ) ( not ( = ?auto_786384 ?auto_786392 ) ) ( not ( = ?auto_786384 ?auto_786393 ) ) ( not ( = ?auto_786384 ?auto_786394 ) ) ( not ( = ?auto_786384 ?auto_786395 ) ) ( not ( = ?auto_786385 ?auto_786386 ) ) ( not ( = ?auto_786385 ?auto_786387 ) ) ( not ( = ?auto_786385 ?auto_786388 ) ) ( not ( = ?auto_786385 ?auto_786389 ) ) ( not ( = ?auto_786385 ?auto_786390 ) ) ( not ( = ?auto_786385 ?auto_786391 ) ) ( not ( = ?auto_786385 ?auto_786392 ) ) ( not ( = ?auto_786385 ?auto_786393 ) ) ( not ( = ?auto_786385 ?auto_786394 ) ) ( not ( = ?auto_786385 ?auto_786395 ) ) ( not ( = ?auto_786386 ?auto_786387 ) ) ( not ( = ?auto_786386 ?auto_786388 ) ) ( not ( = ?auto_786386 ?auto_786389 ) ) ( not ( = ?auto_786386 ?auto_786390 ) ) ( not ( = ?auto_786386 ?auto_786391 ) ) ( not ( = ?auto_786386 ?auto_786392 ) ) ( not ( = ?auto_786386 ?auto_786393 ) ) ( not ( = ?auto_786386 ?auto_786394 ) ) ( not ( = ?auto_786386 ?auto_786395 ) ) ( not ( = ?auto_786387 ?auto_786388 ) ) ( not ( = ?auto_786387 ?auto_786389 ) ) ( not ( = ?auto_786387 ?auto_786390 ) ) ( not ( = ?auto_786387 ?auto_786391 ) ) ( not ( = ?auto_786387 ?auto_786392 ) ) ( not ( = ?auto_786387 ?auto_786393 ) ) ( not ( = ?auto_786387 ?auto_786394 ) ) ( not ( = ?auto_786387 ?auto_786395 ) ) ( not ( = ?auto_786388 ?auto_786389 ) ) ( not ( = ?auto_786388 ?auto_786390 ) ) ( not ( = ?auto_786388 ?auto_786391 ) ) ( not ( = ?auto_786388 ?auto_786392 ) ) ( not ( = ?auto_786388 ?auto_786393 ) ) ( not ( = ?auto_786388 ?auto_786394 ) ) ( not ( = ?auto_786388 ?auto_786395 ) ) ( not ( = ?auto_786389 ?auto_786390 ) ) ( not ( = ?auto_786389 ?auto_786391 ) ) ( not ( = ?auto_786389 ?auto_786392 ) ) ( not ( = ?auto_786389 ?auto_786393 ) ) ( not ( = ?auto_786389 ?auto_786394 ) ) ( not ( = ?auto_786389 ?auto_786395 ) ) ( not ( = ?auto_786390 ?auto_786391 ) ) ( not ( = ?auto_786390 ?auto_786392 ) ) ( not ( = ?auto_786390 ?auto_786393 ) ) ( not ( = ?auto_786390 ?auto_786394 ) ) ( not ( = ?auto_786390 ?auto_786395 ) ) ( not ( = ?auto_786391 ?auto_786392 ) ) ( not ( = ?auto_786391 ?auto_786393 ) ) ( not ( = ?auto_786391 ?auto_786394 ) ) ( not ( = ?auto_786391 ?auto_786395 ) ) ( not ( = ?auto_786392 ?auto_786393 ) ) ( not ( = ?auto_786392 ?auto_786394 ) ) ( not ( = ?auto_786392 ?auto_786395 ) ) ( not ( = ?auto_786393 ?auto_786394 ) ) ( not ( = ?auto_786393 ?auto_786395 ) ) ( not ( = ?auto_786394 ?auto_786395 ) ) ( ON ?auto_786393 ?auto_786394 ) ( ON ?auto_786392 ?auto_786393 ) ( ON ?auto_786391 ?auto_786392 ) ( ON ?auto_786390 ?auto_786391 ) ( ON ?auto_786389 ?auto_786390 ) ( ON ?auto_786388 ?auto_786389 ) ( ON ?auto_786387 ?auto_786388 ) ( ON ?auto_786386 ?auto_786387 ) ( ON ?auto_786385 ?auto_786386 ) ( ON ?auto_786384 ?auto_786385 ) ( ON ?auto_786383 ?auto_786384 ) ( CLEAR ?auto_786383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_786383 )
      ( MAKE-12PILE ?auto_786383 ?auto_786384 ?auto_786385 ?auto_786386 ?auto_786387 ?auto_786388 ?auto_786389 ?auto_786390 ?auto_786391 ?auto_786392 ?auto_786393 ?auto_786394 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786434 - BLOCK
      ?auto_786435 - BLOCK
      ?auto_786436 - BLOCK
      ?auto_786437 - BLOCK
      ?auto_786438 - BLOCK
      ?auto_786439 - BLOCK
      ?auto_786440 - BLOCK
      ?auto_786441 - BLOCK
      ?auto_786442 - BLOCK
      ?auto_786443 - BLOCK
      ?auto_786444 - BLOCK
      ?auto_786445 - BLOCK
      ?auto_786446 - BLOCK
    )
    :vars
    (
      ?auto_786447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_786445 ) ( ON ?auto_786446 ?auto_786447 ) ( CLEAR ?auto_786446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_786434 ) ( ON ?auto_786435 ?auto_786434 ) ( ON ?auto_786436 ?auto_786435 ) ( ON ?auto_786437 ?auto_786436 ) ( ON ?auto_786438 ?auto_786437 ) ( ON ?auto_786439 ?auto_786438 ) ( ON ?auto_786440 ?auto_786439 ) ( ON ?auto_786441 ?auto_786440 ) ( ON ?auto_786442 ?auto_786441 ) ( ON ?auto_786443 ?auto_786442 ) ( ON ?auto_786444 ?auto_786443 ) ( ON ?auto_786445 ?auto_786444 ) ( not ( = ?auto_786434 ?auto_786435 ) ) ( not ( = ?auto_786434 ?auto_786436 ) ) ( not ( = ?auto_786434 ?auto_786437 ) ) ( not ( = ?auto_786434 ?auto_786438 ) ) ( not ( = ?auto_786434 ?auto_786439 ) ) ( not ( = ?auto_786434 ?auto_786440 ) ) ( not ( = ?auto_786434 ?auto_786441 ) ) ( not ( = ?auto_786434 ?auto_786442 ) ) ( not ( = ?auto_786434 ?auto_786443 ) ) ( not ( = ?auto_786434 ?auto_786444 ) ) ( not ( = ?auto_786434 ?auto_786445 ) ) ( not ( = ?auto_786434 ?auto_786446 ) ) ( not ( = ?auto_786434 ?auto_786447 ) ) ( not ( = ?auto_786435 ?auto_786436 ) ) ( not ( = ?auto_786435 ?auto_786437 ) ) ( not ( = ?auto_786435 ?auto_786438 ) ) ( not ( = ?auto_786435 ?auto_786439 ) ) ( not ( = ?auto_786435 ?auto_786440 ) ) ( not ( = ?auto_786435 ?auto_786441 ) ) ( not ( = ?auto_786435 ?auto_786442 ) ) ( not ( = ?auto_786435 ?auto_786443 ) ) ( not ( = ?auto_786435 ?auto_786444 ) ) ( not ( = ?auto_786435 ?auto_786445 ) ) ( not ( = ?auto_786435 ?auto_786446 ) ) ( not ( = ?auto_786435 ?auto_786447 ) ) ( not ( = ?auto_786436 ?auto_786437 ) ) ( not ( = ?auto_786436 ?auto_786438 ) ) ( not ( = ?auto_786436 ?auto_786439 ) ) ( not ( = ?auto_786436 ?auto_786440 ) ) ( not ( = ?auto_786436 ?auto_786441 ) ) ( not ( = ?auto_786436 ?auto_786442 ) ) ( not ( = ?auto_786436 ?auto_786443 ) ) ( not ( = ?auto_786436 ?auto_786444 ) ) ( not ( = ?auto_786436 ?auto_786445 ) ) ( not ( = ?auto_786436 ?auto_786446 ) ) ( not ( = ?auto_786436 ?auto_786447 ) ) ( not ( = ?auto_786437 ?auto_786438 ) ) ( not ( = ?auto_786437 ?auto_786439 ) ) ( not ( = ?auto_786437 ?auto_786440 ) ) ( not ( = ?auto_786437 ?auto_786441 ) ) ( not ( = ?auto_786437 ?auto_786442 ) ) ( not ( = ?auto_786437 ?auto_786443 ) ) ( not ( = ?auto_786437 ?auto_786444 ) ) ( not ( = ?auto_786437 ?auto_786445 ) ) ( not ( = ?auto_786437 ?auto_786446 ) ) ( not ( = ?auto_786437 ?auto_786447 ) ) ( not ( = ?auto_786438 ?auto_786439 ) ) ( not ( = ?auto_786438 ?auto_786440 ) ) ( not ( = ?auto_786438 ?auto_786441 ) ) ( not ( = ?auto_786438 ?auto_786442 ) ) ( not ( = ?auto_786438 ?auto_786443 ) ) ( not ( = ?auto_786438 ?auto_786444 ) ) ( not ( = ?auto_786438 ?auto_786445 ) ) ( not ( = ?auto_786438 ?auto_786446 ) ) ( not ( = ?auto_786438 ?auto_786447 ) ) ( not ( = ?auto_786439 ?auto_786440 ) ) ( not ( = ?auto_786439 ?auto_786441 ) ) ( not ( = ?auto_786439 ?auto_786442 ) ) ( not ( = ?auto_786439 ?auto_786443 ) ) ( not ( = ?auto_786439 ?auto_786444 ) ) ( not ( = ?auto_786439 ?auto_786445 ) ) ( not ( = ?auto_786439 ?auto_786446 ) ) ( not ( = ?auto_786439 ?auto_786447 ) ) ( not ( = ?auto_786440 ?auto_786441 ) ) ( not ( = ?auto_786440 ?auto_786442 ) ) ( not ( = ?auto_786440 ?auto_786443 ) ) ( not ( = ?auto_786440 ?auto_786444 ) ) ( not ( = ?auto_786440 ?auto_786445 ) ) ( not ( = ?auto_786440 ?auto_786446 ) ) ( not ( = ?auto_786440 ?auto_786447 ) ) ( not ( = ?auto_786441 ?auto_786442 ) ) ( not ( = ?auto_786441 ?auto_786443 ) ) ( not ( = ?auto_786441 ?auto_786444 ) ) ( not ( = ?auto_786441 ?auto_786445 ) ) ( not ( = ?auto_786441 ?auto_786446 ) ) ( not ( = ?auto_786441 ?auto_786447 ) ) ( not ( = ?auto_786442 ?auto_786443 ) ) ( not ( = ?auto_786442 ?auto_786444 ) ) ( not ( = ?auto_786442 ?auto_786445 ) ) ( not ( = ?auto_786442 ?auto_786446 ) ) ( not ( = ?auto_786442 ?auto_786447 ) ) ( not ( = ?auto_786443 ?auto_786444 ) ) ( not ( = ?auto_786443 ?auto_786445 ) ) ( not ( = ?auto_786443 ?auto_786446 ) ) ( not ( = ?auto_786443 ?auto_786447 ) ) ( not ( = ?auto_786444 ?auto_786445 ) ) ( not ( = ?auto_786444 ?auto_786446 ) ) ( not ( = ?auto_786444 ?auto_786447 ) ) ( not ( = ?auto_786445 ?auto_786446 ) ) ( not ( = ?auto_786445 ?auto_786447 ) ) ( not ( = ?auto_786446 ?auto_786447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_786446 ?auto_786447 )
      ( !STACK ?auto_786446 ?auto_786445 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786488 - BLOCK
      ?auto_786489 - BLOCK
      ?auto_786490 - BLOCK
      ?auto_786491 - BLOCK
      ?auto_786492 - BLOCK
      ?auto_786493 - BLOCK
      ?auto_786494 - BLOCK
      ?auto_786495 - BLOCK
      ?auto_786496 - BLOCK
      ?auto_786497 - BLOCK
      ?auto_786498 - BLOCK
      ?auto_786499 - BLOCK
      ?auto_786500 - BLOCK
    )
    :vars
    (
      ?auto_786501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786500 ?auto_786501 ) ( ON-TABLE ?auto_786488 ) ( ON ?auto_786489 ?auto_786488 ) ( ON ?auto_786490 ?auto_786489 ) ( ON ?auto_786491 ?auto_786490 ) ( ON ?auto_786492 ?auto_786491 ) ( ON ?auto_786493 ?auto_786492 ) ( ON ?auto_786494 ?auto_786493 ) ( ON ?auto_786495 ?auto_786494 ) ( ON ?auto_786496 ?auto_786495 ) ( ON ?auto_786497 ?auto_786496 ) ( ON ?auto_786498 ?auto_786497 ) ( not ( = ?auto_786488 ?auto_786489 ) ) ( not ( = ?auto_786488 ?auto_786490 ) ) ( not ( = ?auto_786488 ?auto_786491 ) ) ( not ( = ?auto_786488 ?auto_786492 ) ) ( not ( = ?auto_786488 ?auto_786493 ) ) ( not ( = ?auto_786488 ?auto_786494 ) ) ( not ( = ?auto_786488 ?auto_786495 ) ) ( not ( = ?auto_786488 ?auto_786496 ) ) ( not ( = ?auto_786488 ?auto_786497 ) ) ( not ( = ?auto_786488 ?auto_786498 ) ) ( not ( = ?auto_786488 ?auto_786499 ) ) ( not ( = ?auto_786488 ?auto_786500 ) ) ( not ( = ?auto_786488 ?auto_786501 ) ) ( not ( = ?auto_786489 ?auto_786490 ) ) ( not ( = ?auto_786489 ?auto_786491 ) ) ( not ( = ?auto_786489 ?auto_786492 ) ) ( not ( = ?auto_786489 ?auto_786493 ) ) ( not ( = ?auto_786489 ?auto_786494 ) ) ( not ( = ?auto_786489 ?auto_786495 ) ) ( not ( = ?auto_786489 ?auto_786496 ) ) ( not ( = ?auto_786489 ?auto_786497 ) ) ( not ( = ?auto_786489 ?auto_786498 ) ) ( not ( = ?auto_786489 ?auto_786499 ) ) ( not ( = ?auto_786489 ?auto_786500 ) ) ( not ( = ?auto_786489 ?auto_786501 ) ) ( not ( = ?auto_786490 ?auto_786491 ) ) ( not ( = ?auto_786490 ?auto_786492 ) ) ( not ( = ?auto_786490 ?auto_786493 ) ) ( not ( = ?auto_786490 ?auto_786494 ) ) ( not ( = ?auto_786490 ?auto_786495 ) ) ( not ( = ?auto_786490 ?auto_786496 ) ) ( not ( = ?auto_786490 ?auto_786497 ) ) ( not ( = ?auto_786490 ?auto_786498 ) ) ( not ( = ?auto_786490 ?auto_786499 ) ) ( not ( = ?auto_786490 ?auto_786500 ) ) ( not ( = ?auto_786490 ?auto_786501 ) ) ( not ( = ?auto_786491 ?auto_786492 ) ) ( not ( = ?auto_786491 ?auto_786493 ) ) ( not ( = ?auto_786491 ?auto_786494 ) ) ( not ( = ?auto_786491 ?auto_786495 ) ) ( not ( = ?auto_786491 ?auto_786496 ) ) ( not ( = ?auto_786491 ?auto_786497 ) ) ( not ( = ?auto_786491 ?auto_786498 ) ) ( not ( = ?auto_786491 ?auto_786499 ) ) ( not ( = ?auto_786491 ?auto_786500 ) ) ( not ( = ?auto_786491 ?auto_786501 ) ) ( not ( = ?auto_786492 ?auto_786493 ) ) ( not ( = ?auto_786492 ?auto_786494 ) ) ( not ( = ?auto_786492 ?auto_786495 ) ) ( not ( = ?auto_786492 ?auto_786496 ) ) ( not ( = ?auto_786492 ?auto_786497 ) ) ( not ( = ?auto_786492 ?auto_786498 ) ) ( not ( = ?auto_786492 ?auto_786499 ) ) ( not ( = ?auto_786492 ?auto_786500 ) ) ( not ( = ?auto_786492 ?auto_786501 ) ) ( not ( = ?auto_786493 ?auto_786494 ) ) ( not ( = ?auto_786493 ?auto_786495 ) ) ( not ( = ?auto_786493 ?auto_786496 ) ) ( not ( = ?auto_786493 ?auto_786497 ) ) ( not ( = ?auto_786493 ?auto_786498 ) ) ( not ( = ?auto_786493 ?auto_786499 ) ) ( not ( = ?auto_786493 ?auto_786500 ) ) ( not ( = ?auto_786493 ?auto_786501 ) ) ( not ( = ?auto_786494 ?auto_786495 ) ) ( not ( = ?auto_786494 ?auto_786496 ) ) ( not ( = ?auto_786494 ?auto_786497 ) ) ( not ( = ?auto_786494 ?auto_786498 ) ) ( not ( = ?auto_786494 ?auto_786499 ) ) ( not ( = ?auto_786494 ?auto_786500 ) ) ( not ( = ?auto_786494 ?auto_786501 ) ) ( not ( = ?auto_786495 ?auto_786496 ) ) ( not ( = ?auto_786495 ?auto_786497 ) ) ( not ( = ?auto_786495 ?auto_786498 ) ) ( not ( = ?auto_786495 ?auto_786499 ) ) ( not ( = ?auto_786495 ?auto_786500 ) ) ( not ( = ?auto_786495 ?auto_786501 ) ) ( not ( = ?auto_786496 ?auto_786497 ) ) ( not ( = ?auto_786496 ?auto_786498 ) ) ( not ( = ?auto_786496 ?auto_786499 ) ) ( not ( = ?auto_786496 ?auto_786500 ) ) ( not ( = ?auto_786496 ?auto_786501 ) ) ( not ( = ?auto_786497 ?auto_786498 ) ) ( not ( = ?auto_786497 ?auto_786499 ) ) ( not ( = ?auto_786497 ?auto_786500 ) ) ( not ( = ?auto_786497 ?auto_786501 ) ) ( not ( = ?auto_786498 ?auto_786499 ) ) ( not ( = ?auto_786498 ?auto_786500 ) ) ( not ( = ?auto_786498 ?auto_786501 ) ) ( not ( = ?auto_786499 ?auto_786500 ) ) ( not ( = ?auto_786499 ?auto_786501 ) ) ( not ( = ?auto_786500 ?auto_786501 ) ) ( CLEAR ?auto_786498 ) ( ON ?auto_786499 ?auto_786500 ) ( CLEAR ?auto_786499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_786488 ?auto_786489 ?auto_786490 ?auto_786491 ?auto_786492 ?auto_786493 ?auto_786494 ?auto_786495 ?auto_786496 ?auto_786497 ?auto_786498 ?auto_786499 )
      ( MAKE-13PILE ?auto_786488 ?auto_786489 ?auto_786490 ?auto_786491 ?auto_786492 ?auto_786493 ?auto_786494 ?auto_786495 ?auto_786496 ?auto_786497 ?auto_786498 ?auto_786499 ?auto_786500 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786542 - BLOCK
      ?auto_786543 - BLOCK
      ?auto_786544 - BLOCK
      ?auto_786545 - BLOCK
      ?auto_786546 - BLOCK
      ?auto_786547 - BLOCK
      ?auto_786548 - BLOCK
      ?auto_786549 - BLOCK
      ?auto_786550 - BLOCK
      ?auto_786551 - BLOCK
      ?auto_786552 - BLOCK
      ?auto_786553 - BLOCK
      ?auto_786554 - BLOCK
    )
    :vars
    (
      ?auto_786555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786554 ?auto_786555 ) ( ON-TABLE ?auto_786542 ) ( ON ?auto_786543 ?auto_786542 ) ( ON ?auto_786544 ?auto_786543 ) ( ON ?auto_786545 ?auto_786544 ) ( ON ?auto_786546 ?auto_786545 ) ( ON ?auto_786547 ?auto_786546 ) ( ON ?auto_786548 ?auto_786547 ) ( ON ?auto_786549 ?auto_786548 ) ( ON ?auto_786550 ?auto_786549 ) ( ON ?auto_786551 ?auto_786550 ) ( not ( = ?auto_786542 ?auto_786543 ) ) ( not ( = ?auto_786542 ?auto_786544 ) ) ( not ( = ?auto_786542 ?auto_786545 ) ) ( not ( = ?auto_786542 ?auto_786546 ) ) ( not ( = ?auto_786542 ?auto_786547 ) ) ( not ( = ?auto_786542 ?auto_786548 ) ) ( not ( = ?auto_786542 ?auto_786549 ) ) ( not ( = ?auto_786542 ?auto_786550 ) ) ( not ( = ?auto_786542 ?auto_786551 ) ) ( not ( = ?auto_786542 ?auto_786552 ) ) ( not ( = ?auto_786542 ?auto_786553 ) ) ( not ( = ?auto_786542 ?auto_786554 ) ) ( not ( = ?auto_786542 ?auto_786555 ) ) ( not ( = ?auto_786543 ?auto_786544 ) ) ( not ( = ?auto_786543 ?auto_786545 ) ) ( not ( = ?auto_786543 ?auto_786546 ) ) ( not ( = ?auto_786543 ?auto_786547 ) ) ( not ( = ?auto_786543 ?auto_786548 ) ) ( not ( = ?auto_786543 ?auto_786549 ) ) ( not ( = ?auto_786543 ?auto_786550 ) ) ( not ( = ?auto_786543 ?auto_786551 ) ) ( not ( = ?auto_786543 ?auto_786552 ) ) ( not ( = ?auto_786543 ?auto_786553 ) ) ( not ( = ?auto_786543 ?auto_786554 ) ) ( not ( = ?auto_786543 ?auto_786555 ) ) ( not ( = ?auto_786544 ?auto_786545 ) ) ( not ( = ?auto_786544 ?auto_786546 ) ) ( not ( = ?auto_786544 ?auto_786547 ) ) ( not ( = ?auto_786544 ?auto_786548 ) ) ( not ( = ?auto_786544 ?auto_786549 ) ) ( not ( = ?auto_786544 ?auto_786550 ) ) ( not ( = ?auto_786544 ?auto_786551 ) ) ( not ( = ?auto_786544 ?auto_786552 ) ) ( not ( = ?auto_786544 ?auto_786553 ) ) ( not ( = ?auto_786544 ?auto_786554 ) ) ( not ( = ?auto_786544 ?auto_786555 ) ) ( not ( = ?auto_786545 ?auto_786546 ) ) ( not ( = ?auto_786545 ?auto_786547 ) ) ( not ( = ?auto_786545 ?auto_786548 ) ) ( not ( = ?auto_786545 ?auto_786549 ) ) ( not ( = ?auto_786545 ?auto_786550 ) ) ( not ( = ?auto_786545 ?auto_786551 ) ) ( not ( = ?auto_786545 ?auto_786552 ) ) ( not ( = ?auto_786545 ?auto_786553 ) ) ( not ( = ?auto_786545 ?auto_786554 ) ) ( not ( = ?auto_786545 ?auto_786555 ) ) ( not ( = ?auto_786546 ?auto_786547 ) ) ( not ( = ?auto_786546 ?auto_786548 ) ) ( not ( = ?auto_786546 ?auto_786549 ) ) ( not ( = ?auto_786546 ?auto_786550 ) ) ( not ( = ?auto_786546 ?auto_786551 ) ) ( not ( = ?auto_786546 ?auto_786552 ) ) ( not ( = ?auto_786546 ?auto_786553 ) ) ( not ( = ?auto_786546 ?auto_786554 ) ) ( not ( = ?auto_786546 ?auto_786555 ) ) ( not ( = ?auto_786547 ?auto_786548 ) ) ( not ( = ?auto_786547 ?auto_786549 ) ) ( not ( = ?auto_786547 ?auto_786550 ) ) ( not ( = ?auto_786547 ?auto_786551 ) ) ( not ( = ?auto_786547 ?auto_786552 ) ) ( not ( = ?auto_786547 ?auto_786553 ) ) ( not ( = ?auto_786547 ?auto_786554 ) ) ( not ( = ?auto_786547 ?auto_786555 ) ) ( not ( = ?auto_786548 ?auto_786549 ) ) ( not ( = ?auto_786548 ?auto_786550 ) ) ( not ( = ?auto_786548 ?auto_786551 ) ) ( not ( = ?auto_786548 ?auto_786552 ) ) ( not ( = ?auto_786548 ?auto_786553 ) ) ( not ( = ?auto_786548 ?auto_786554 ) ) ( not ( = ?auto_786548 ?auto_786555 ) ) ( not ( = ?auto_786549 ?auto_786550 ) ) ( not ( = ?auto_786549 ?auto_786551 ) ) ( not ( = ?auto_786549 ?auto_786552 ) ) ( not ( = ?auto_786549 ?auto_786553 ) ) ( not ( = ?auto_786549 ?auto_786554 ) ) ( not ( = ?auto_786549 ?auto_786555 ) ) ( not ( = ?auto_786550 ?auto_786551 ) ) ( not ( = ?auto_786550 ?auto_786552 ) ) ( not ( = ?auto_786550 ?auto_786553 ) ) ( not ( = ?auto_786550 ?auto_786554 ) ) ( not ( = ?auto_786550 ?auto_786555 ) ) ( not ( = ?auto_786551 ?auto_786552 ) ) ( not ( = ?auto_786551 ?auto_786553 ) ) ( not ( = ?auto_786551 ?auto_786554 ) ) ( not ( = ?auto_786551 ?auto_786555 ) ) ( not ( = ?auto_786552 ?auto_786553 ) ) ( not ( = ?auto_786552 ?auto_786554 ) ) ( not ( = ?auto_786552 ?auto_786555 ) ) ( not ( = ?auto_786553 ?auto_786554 ) ) ( not ( = ?auto_786553 ?auto_786555 ) ) ( not ( = ?auto_786554 ?auto_786555 ) ) ( ON ?auto_786553 ?auto_786554 ) ( CLEAR ?auto_786551 ) ( ON ?auto_786552 ?auto_786553 ) ( CLEAR ?auto_786552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_786542 ?auto_786543 ?auto_786544 ?auto_786545 ?auto_786546 ?auto_786547 ?auto_786548 ?auto_786549 ?auto_786550 ?auto_786551 ?auto_786552 )
      ( MAKE-13PILE ?auto_786542 ?auto_786543 ?auto_786544 ?auto_786545 ?auto_786546 ?auto_786547 ?auto_786548 ?auto_786549 ?auto_786550 ?auto_786551 ?auto_786552 ?auto_786553 ?auto_786554 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786596 - BLOCK
      ?auto_786597 - BLOCK
      ?auto_786598 - BLOCK
      ?auto_786599 - BLOCK
      ?auto_786600 - BLOCK
      ?auto_786601 - BLOCK
      ?auto_786602 - BLOCK
      ?auto_786603 - BLOCK
      ?auto_786604 - BLOCK
      ?auto_786605 - BLOCK
      ?auto_786606 - BLOCK
      ?auto_786607 - BLOCK
      ?auto_786608 - BLOCK
    )
    :vars
    (
      ?auto_786609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786608 ?auto_786609 ) ( ON-TABLE ?auto_786596 ) ( ON ?auto_786597 ?auto_786596 ) ( ON ?auto_786598 ?auto_786597 ) ( ON ?auto_786599 ?auto_786598 ) ( ON ?auto_786600 ?auto_786599 ) ( ON ?auto_786601 ?auto_786600 ) ( ON ?auto_786602 ?auto_786601 ) ( ON ?auto_786603 ?auto_786602 ) ( ON ?auto_786604 ?auto_786603 ) ( not ( = ?auto_786596 ?auto_786597 ) ) ( not ( = ?auto_786596 ?auto_786598 ) ) ( not ( = ?auto_786596 ?auto_786599 ) ) ( not ( = ?auto_786596 ?auto_786600 ) ) ( not ( = ?auto_786596 ?auto_786601 ) ) ( not ( = ?auto_786596 ?auto_786602 ) ) ( not ( = ?auto_786596 ?auto_786603 ) ) ( not ( = ?auto_786596 ?auto_786604 ) ) ( not ( = ?auto_786596 ?auto_786605 ) ) ( not ( = ?auto_786596 ?auto_786606 ) ) ( not ( = ?auto_786596 ?auto_786607 ) ) ( not ( = ?auto_786596 ?auto_786608 ) ) ( not ( = ?auto_786596 ?auto_786609 ) ) ( not ( = ?auto_786597 ?auto_786598 ) ) ( not ( = ?auto_786597 ?auto_786599 ) ) ( not ( = ?auto_786597 ?auto_786600 ) ) ( not ( = ?auto_786597 ?auto_786601 ) ) ( not ( = ?auto_786597 ?auto_786602 ) ) ( not ( = ?auto_786597 ?auto_786603 ) ) ( not ( = ?auto_786597 ?auto_786604 ) ) ( not ( = ?auto_786597 ?auto_786605 ) ) ( not ( = ?auto_786597 ?auto_786606 ) ) ( not ( = ?auto_786597 ?auto_786607 ) ) ( not ( = ?auto_786597 ?auto_786608 ) ) ( not ( = ?auto_786597 ?auto_786609 ) ) ( not ( = ?auto_786598 ?auto_786599 ) ) ( not ( = ?auto_786598 ?auto_786600 ) ) ( not ( = ?auto_786598 ?auto_786601 ) ) ( not ( = ?auto_786598 ?auto_786602 ) ) ( not ( = ?auto_786598 ?auto_786603 ) ) ( not ( = ?auto_786598 ?auto_786604 ) ) ( not ( = ?auto_786598 ?auto_786605 ) ) ( not ( = ?auto_786598 ?auto_786606 ) ) ( not ( = ?auto_786598 ?auto_786607 ) ) ( not ( = ?auto_786598 ?auto_786608 ) ) ( not ( = ?auto_786598 ?auto_786609 ) ) ( not ( = ?auto_786599 ?auto_786600 ) ) ( not ( = ?auto_786599 ?auto_786601 ) ) ( not ( = ?auto_786599 ?auto_786602 ) ) ( not ( = ?auto_786599 ?auto_786603 ) ) ( not ( = ?auto_786599 ?auto_786604 ) ) ( not ( = ?auto_786599 ?auto_786605 ) ) ( not ( = ?auto_786599 ?auto_786606 ) ) ( not ( = ?auto_786599 ?auto_786607 ) ) ( not ( = ?auto_786599 ?auto_786608 ) ) ( not ( = ?auto_786599 ?auto_786609 ) ) ( not ( = ?auto_786600 ?auto_786601 ) ) ( not ( = ?auto_786600 ?auto_786602 ) ) ( not ( = ?auto_786600 ?auto_786603 ) ) ( not ( = ?auto_786600 ?auto_786604 ) ) ( not ( = ?auto_786600 ?auto_786605 ) ) ( not ( = ?auto_786600 ?auto_786606 ) ) ( not ( = ?auto_786600 ?auto_786607 ) ) ( not ( = ?auto_786600 ?auto_786608 ) ) ( not ( = ?auto_786600 ?auto_786609 ) ) ( not ( = ?auto_786601 ?auto_786602 ) ) ( not ( = ?auto_786601 ?auto_786603 ) ) ( not ( = ?auto_786601 ?auto_786604 ) ) ( not ( = ?auto_786601 ?auto_786605 ) ) ( not ( = ?auto_786601 ?auto_786606 ) ) ( not ( = ?auto_786601 ?auto_786607 ) ) ( not ( = ?auto_786601 ?auto_786608 ) ) ( not ( = ?auto_786601 ?auto_786609 ) ) ( not ( = ?auto_786602 ?auto_786603 ) ) ( not ( = ?auto_786602 ?auto_786604 ) ) ( not ( = ?auto_786602 ?auto_786605 ) ) ( not ( = ?auto_786602 ?auto_786606 ) ) ( not ( = ?auto_786602 ?auto_786607 ) ) ( not ( = ?auto_786602 ?auto_786608 ) ) ( not ( = ?auto_786602 ?auto_786609 ) ) ( not ( = ?auto_786603 ?auto_786604 ) ) ( not ( = ?auto_786603 ?auto_786605 ) ) ( not ( = ?auto_786603 ?auto_786606 ) ) ( not ( = ?auto_786603 ?auto_786607 ) ) ( not ( = ?auto_786603 ?auto_786608 ) ) ( not ( = ?auto_786603 ?auto_786609 ) ) ( not ( = ?auto_786604 ?auto_786605 ) ) ( not ( = ?auto_786604 ?auto_786606 ) ) ( not ( = ?auto_786604 ?auto_786607 ) ) ( not ( = ?auto_786604 ?auto_786608 ) ) ( not ( = ?auto_786604 ?auto_786609 ) ) ( not ( = ?auto_786605 ?auto_786606 ) ) ( not ( = ?auto_786605 ?auto_786607 ) ) ( not ( = ?auto_786605 ?auto_786608 ) ) ( not ( = ?auto_786605 ?auto_786609 ) ) ( not ( = ?auto_786606 ?auto_786607 ) ) ( not ( = ?auto_786606 ?auto_786608 ) ) ( not ( = ?auto_786606 ?auto_786609 ) ) ( not ( = ?auto_786607 ?auto_786608 ) ) ( not ( = ?auto_786607 ?auto_786609 ) ) ( not ( = ?auto_786608 ?auto_786609 ) ) ( ON ?auto_786607 ?auto_786608 ) ( ON ?auto_786606 ?auto_786607 ) ( CLEAR ?auto_786604 ) ( ON ?auto_786605 ?auto_786606 ) ( CLEAR ?auto_786605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_786596 ?auto_786597 ?auto_786598 ?auto_786599 ?auto_786600 ?auto_786601 ?auto_786602 ?auto_786603 ?auto_786604 ?auto_786605 )
      ( MAKE-13PILE ?auto_786596 ?auto_786597 ?auto_786598 ?auto_786599 ?auto_786600 ?auto_786601 ?auto_786602 ?auto_786603 ?auto_786604 ?auto_786605 ?auto_786606 ?auto_786607 ?auto_786608 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786650 - BLOCK
      ?auto_786651 - BLOCK
      ?auto_786652 - BLOCK
      ?auto_786653 - BLOCK
      ?auto_786654 - BLOCK
      ?auto_786655 - BLOCK
      ?auto_786656 - BLOCK
      ?auto_786657 - BLOCK
      ?auto_786658 - BLOCK
      ?auto_786659 - BLOCK
      ?auto_786660 - BLOCK
      ?auto_786661 - BLOCK
      ?auto_786662 - BLOCK
    )
    :vars
    (
      ?auto_786663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786662 ?auto_786663 ) ( ON-TABLE ?auto_786650 ) ( ON ?auto_786651 ?auto_786650 ) ( ON ?auto_786652 ?auto_786651 ) ( ON ?auto_786653 ?auto_786652 ) ( ON ?auto_786654 ?auto_786653 ) ( ON ?auto_786655 ?auto_786654 ) ( ON ?auto_786656 ?auto_786655 ) ( ON ?auto_786657 ?auto_786656 ) ( not ( = ?auto_786650 ?auto_786651 ) ) ( not ( = ?auto_786650 ?auto_786652 ) ) ( not ( = ?auto_786650 ?auto_786653 ) ) ( not ( = ?auto_786650 ?auto_786654 ) ) ( not ( = ?auto_786650 ?auto_786655 ) ) ( not ( = ?auto_786650 ?auto_786656 ) ) ( not ( = ?auto_786650 ?auto_786657 ) ) ( not ( = ?auto_786650 ?auto_786658 ) ) ( not ( = ?auto_786650 ?auto_786659 ) ) ( not ( = ?auto_786650 ?auto_786660 ) ) ( not ( = ?auto_786650 ?auto_786661 ) ) ( not ( = ?auto_786650 ?auto_786662 ) ) ( not ( = ?auto_786650 ?auto_786663 ) ) ( not ( = ?auto_786651 ?auto_786652 ) ) ( not ( = ?auto_786651 ?auto_786653 ) ) ( not ( = ?auto_786651 ?auto_786654 ) ) ( not ( = ?auto_786651 ?auto_786655 ) ) ( not ( = ?auto_786651 ?auto_786656 ) ) ( not ( = ?auto_786651 ?auto_786657 ) ) ( not ( = ?auto_786651 ?auto_786658 ) ) ( not ( = ?auto_786651 ?auto_786659 ) ) ( not ( = ?auto_786651 ?auto_786660 ) ) ( not ( = ?auto_786651 ?auto_786661 ) ) ( not ( = ?auto_786651 ?auto_786662 ) ) ( not ( = ?auto_786651 ?auto_786663 ) ) ( not ( = ?auto_786652 ?auto_786653 ) ) ( not ( = ?auto_786652 ?auto_786654 ) ) ( not ( = ?auto_786652 ?auto_786655 ) ) ( not ( = ?auto_786652 ?auto_786656 ) ) ( not ( = ?auto_786652 ?auto_786657 ) ) ( not ( = ?auto_786652 ?auto_786658 ) ) ( not ( = ?auto_786652 ?auto_786659 ) ) ( not ( = ?auto_786652 ?auto_786660 ) ) ( not ( = ?auto_786652 ?auto_786661 ) ) ( not ( = ?auto_786652 ?auto_786662 ) ) ( not ( = ?auto_786652 ?auto_786663 ) ) ( not ( = ?auto_786653 ?auto_786654 ) ) ( not ( = ?auto_786653 ?auto_786655 ) ) ( not ( = ?auto_786653 ?auto_786656 ) ) ( not ( = ?auto_786653 ?auto_786657 ) ) ( not ( = ?auto_786653 ?auto_786658 ) ) ( not ( = ?auto_786653 ?auto_786659 ) ) ( not ( = ?auto_786653 ?auto_786660 ) ) ( not ( = ?auto_786653 ?auto_786661 ) ) ( not ( = ?auto_786653 ?auto_786662 ) ) ( not ( = ?auto_786653 ?auto_786663 ) ) ( not ( = ?auto_786654 ?auto_786655 ) ) ( not ( = ?auto_786654 ?auto_786656 ) ) ( not ( = ?auto_786654 ?auto_786657 ) ) ( not ( = ?auto_786654 ?auto_786658 ) ) ( not ( = ?auto_786654 ?auto_786659 ) ) ( not ( = ?auto_786654 ?auto_786660 ) ) ( not ( = ?auto_786654 ?auto_786661 ) ) ( not ( = ?auto_786654 ?auto_786662 ) ) ( not ( = ?auto_786654 ?auto_786663 ) ) ( not ( = ?auto_786655 ?auto_786656 ) ) ( not ( = ?auto_786655 ?auto_786657 ) ) ( not ( = ?auto_786655 ?auto_786658 ) ) ( not ( = ?auto_786655 ?auto_786659 ) ) ( not ( = ?auto_786655 ?auto_786660 ) ) ( not ( = ?auto_786655 ?auto_786661 ) ) ( not ( = ?auto_786655 ?auto_786662 ) ) ( not ( = ?auto_786655 ?auto_786663 ) ) ( not ( = ?auto_786656 ?auto_786657 ) ) ( not ( = ?auto_786656 ?auto_786658 ) ) ( not ( = ?auto_786656 ?auto_786659 ) ) ( not ( = ?auto_786656 ?auto_786660 ) ) ( not ( = ?auto_786656 ?auto_786661 ) ) ( not ( = ?auto_786656 ?auto_786662 ) ) ( not ( = ?auto_786656 ?auto_786663 ) ) ( not ( = ?auto_786657 ?auto_786658 ) ) ( not ( = ?auto_786657 ?auto_786659 ) ) ( not ( = ?auto_786657 ?auto_786660 ) ) ( not ( = ?auto_786657 ?auto_786661 ) ) ( not ( = ?auto_786657 ?auto_786662 ) ) ( not ( = ?auto_786657 ?auto_786663 ) ) ( not ( = ?auto_786658 ?auto_786659 ) ) ( not ( = ?auto_786658 ?auto_786660 ) ) ( not ( = ?auto_786658 ?auto_786661 ) ) ( not ( = ?auto_786658 ?auto_786662 ) ) ( not ( = ?auto_786658 ?auto_786663 ) ) ( not ( = ?auto_786659 ?auto_786660 ) ) ( not ( = ?auto_786659 ?auto_786661 ) ) ( not ( = ?auto_786659 ?auto_786662 ) ) ( not ( = ?auto_786659 ?auto_786663 ) ) ( not ( = ?auto_786660 ?auto_786661 ) ) ( not ( = ?auto_786660 ?auto_786662 ) ) ( not ( = ?auto_786660 ?auto_786663 ) ) ( not ( = ?auto_786661 ?auto_786662 ) ) ( not ( = ?auto_786661 ?auto_786663 ) ) ( not ( = ?auto_786662 ?auto_786663 ) ) ( ON ?auto_786661 ?auto_786662 ) ( ON ?auto_786660 ?auto_786661 ) ( ON ?auto_786659 ?auto_786660 ) ( CLEAR ?auto_786657 ) ( ON ?auto_786658 ?auto_786659 ) ( CLEAR ?auto_786658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_786650 ?auto_786651 ?auto_786652 ?auto_786653 ?auto_786654 ?auto_786655 ?auto_786656 ?auto_786657 ?auto_786658 )
      ( MAKE-13PILE ?auto_786650 ?auto_786651 ?auto_786652 ?auto_786653 ?auto_786654 ?auto_786655 ?auto_786656 ?auto_786657 ?auto_786658 ?auto_786659 ?auto_786660 ?auto_786661 ?auto_786662 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786704 - BLOCK
      ?auto_786705 - BLOCK
      ?auto_786706 - BLOCK
      ?auto_786707 - BLOCK
      ?auto_786708 - BLOCK
      ?auto_786709 - BLOCK
      ?auto_786710 - BLOCK
      ?auto_786711 - BLOCK
      ?auto_786712 - BLOCK
      ?auto_786713 - BLOCK
      ?auto_786714 - BLOCK
      ?auto_786715 - BLOCK
      ?auto_786716 - BLOCK
    )
    :vars
    (
      ?auto_786717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786716 ?auto_786717 ) ( ON-TABLE ?auto_786704 ) ( ON ?auto_786705 ?auto_786704 ) ( ON ?auto_786706 ?auto_786705 ) ( ON ?auto_786707 ?auto_786706 ) ( ON ?auto_786708 ?auto_786707 ) ( ON ?auto_786709 ?auto_786708 ) ( ON ?auto_786710 ?auto_786709 ) ( not ( = ?auto_786704 ?auto_786705 ) ) ( not ( = ?auto_786704 ?auto_786706 ) ) ( not ( = ?auto_786704 ?auto_786707 ) ) ( not ( = ?auto_786704 ?auto_786708 ) ) ( not ( = ?auto_786704 ?auto_786709 ) ) ( not ( = ?auto_786704 ?auto_786710 ) ) ( not ( = ?auto_786704 ?auto_786711 ) ) ( not ( = ?auto_786704 ?auto_786712 ) ) ( not ( = ?auto_786704 ?auto_786713 ) ) ( not ( = ?auto_786704 ?auto_786714 ) ) ( not ( = ?auto_786704 ?auto_786715 ) ) ( not ( = ?auto_786704 ?auto_786716 ) ) ( not ( = ?auto_786704 ?auto_786717 ) ) ( not ( = ?auto_786705 ?auto_786706 ) ) ( not ( = ?auto_786705 ?auto_786707 ) ) ( not ( = ?auto_786705 ?auto_786708 ) ) ( not ( = ?auto_786705 ?auto_786709 ) ) ( not ( = ?auto_786705 ?auto_786710 ) ) ( not ( = ?auto_786705 ?auto_786711 ) ) ( not ( = ?auto_786705 ?auto_786712 ) ) ( not ( = ?auto_786705 ?auto_786713 ) ) ( not ( = ?auto_786705 ?auto_786714 ) ) ( not ( = ?auto_786705 ?auto_786715 ) ) ( not ( = ?auto_786705 ?auto_786716 ) ) ( not ( = ?auto_786705 ?auto_786717 ) ) ( not ( = ?auto_786706 ?auto_786707 ) ) ( not ( = ?auto_786706 ?auto_786708 ) ) ( not ( = ?auto_786706 ?auto_786709 ) ) ( not ( = ?auto_786706 ?auto_786710 ) ) ( not ( = ?auto_786706 ?auto_786711 ) ) ( not ( = ?auto_786706 ?auto_786712 ) ) ( not ( = ?auto_786706 ?auto_786713 ) ) ( not ( = ?auto_786706 ?auto_786714 ) ) ( not ( = ?auto_786706 ?auto_786715 ) ) ( not ( = ?auto_786706 ?auto_786716 ) ) ( not ( = ?auto_786706 ?auto_786717 ) ) ( not ( = ?auto_786707 ?auto_786708 ) ) ( not ( = ?auto_786707 ?auto_786709 ) ) ( not ( = ?auto_786707 ?auto_786710 ) ) ( not ( = ?auto_786707 ?auto_786711 ) ) ( not ( = ?auto_786707 ?auto_786712 ) ) ( not ( = ?auto_786707 ?auto_786713 ) ) ( not ( = ?auto_786707 ?auto_786714 ) ) ( not ( = ?auto_786707 ?auto_786715 ) ) ( not ( = ?auto_786707 ?auto_786716 ) ) ( not ( = ?auto_786707 ?auto_786717 ) ) ( not ( = ?auto_786708 ?auto_786709 ) ) ( not ( = ?auto_786708 ?auto_786710 ) ) ( not ( = ?auto_786708 ?auto_786711 ) ) ( not ( = ?auto_786708 ?auto_786712 ) ) ( not ( = ?auto_786708 ?auto_786713 ) ) ( not ( = ?auto_786708 ?auto_786714 ) ) ( not ( = ?auto_786708 ?auto_786715 ) ) ( not ( = ?auto_786708 ?auto_786716 ) ) ( not ( = ?auto_786708 ?auto_786717 ) ) ( not ( = ?auto_786709 ?auto_786710 ) ) ( not ( = ?auto_786709 ?auto_786711 ) ) ( not ( = ?auto_786709 ?auto_786712 ) ) ( not ( = ?auto_786709 ?auto_786713 ) ) ( not ( = ?auto_786709 ?auto_786714 ) ) ( not ( = ?auto_786709 ?auto_786715 ) ) ( not ( = ?auto_786709 ?auto_786716 ) ) ( not ( = ?auto_786709 ?auto_786717 ) ) ( not ( = ?auto_786710 ?auto_786711 ) ) ( not ( = ?auto_786710 ?auto_786712 ) ) ( not ( = ?auto_786710 ?auto_786713 ) ) ( not ( = ?auto_786710 ?auto_786714 ) ) ( not ( = ?auto_786710 ?auto_786715 ) ) ( not ( = ?auto_786710 ?auto_786716 ) ) ( not ( = ?auto_786710 ?auto_786717 ) ) ( not ( = ?auto_786711 ?auto_786712 ) ) ( not ( = ?auto_786711 ?auto_786713 ) ) ( not ( = ?auto_786711 ?auto_786714 ) ) ( not ( = ?auto_786711 ?auto_786715 ) ) ( not ( = ?auto_786711 ?auto_786716 ) ) ( not ( = ?auto_786711 ?auto_786717 ) ) ( not ( = ?auto_786712 ?auto_786713 ) ) ( not ( = ?auto_786712 ?auto_786714 ) ) ( not ( = ?auto_786712 ?auto_786715 ) ) ( not ( = ?auto_786712 ?auto_786716 ) ) ( not ( = ?auto_786712 ?auto_786717 ) ) ( not ( = ?auto_786713 ?auto_786714 ) ) ( not ( = ?auto_786713 ?auto_786715 ) ) ( not ( = ?auto_786713 ?auto_786716 ) ) ( not ( = ?auto_786713 ?auto_786717 ) ) ( not ( = ?auto_786714 ?auto_786715 ) ) ( not ( = ?auto_786714 ?auto_786716 ) ) ( not ( = ?auto_786714 ?auto_786717 ) ) ( not ( = ?auto_786715 ?auto_786716 ) ) ( not ( = ?auto_786715 ?auto_786717 ) ) ( not ( = ?auto_786716 ?auto_786717 ) ) ( ON ?auto_786715 ?auto_786716 ) ( ON ?auto_786714 ?auto_786715 ) ( ON ?auto_786713 ?auto_786714 ) ( ON ?auto_786712 ?auto_786713 ) ( CLEAR ?auto_786710 ) ( ON ?auto_786711 ?auto_786712 ) ( CLEAR ?auto_786711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_786704 ?auto_786705 ?auto_786706 ?auto_786707 ?auto_786708 ?auto_786709 ?auto_786710 ?auto_786711 )
      ( MAKE-13PILE ?auto_786704 ?auto_786705 ?auto_786706 ?auto_786707 ?auto_786708 ?auto_786709 ?auto_786710 ?auto_786711 ?auto_786712 ?auto_786713 ?auto_786714 ?auto_786715 ?auto_786716 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786758 - BLOCK
      ?auto_786759 - BLOCK
      ?auto_786760 - BLOCK
      ?auto_786761 - BLOCK
      ?auto_786762 - BLOCK
      ?auto_786763 - BLOCK
      ?auto_786764 - BLOCK
      ?auto_786765 - BLOCK
      ?auto_786766 - BLOCK
      ?auto_786767 - BLOCK
      ?auto_786768 - BLOCK
      ?auto_786769 - BLOCK
      ?auto_786770 - BLOCK
    )
    :vars
    (
      ?auto_786771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786770 ?auto_786771 ) ( ON-TABLE ?auto_786758 ) ( ON ?auto_786759 ?auto_786758 ) ( ON ?auto_786760 ?auto_786759 ) ( ON ?auto_786761 ?auto_786760 ) ( ON ?auto_786762 ?auto_786761 ) ( ON ?auto_786763 ?auto_786762 ) ( not ( = ?auto_786758 ?auto_786759 ) ) ( not ( = ?auto_786758 ?auto_786760 ) ) ( not ( = ?auto_786758 ?auto_786761 ) ) ( not ( = ?auto_786758 ?auto_786762 ) ) ( not ( = ?auto_786758 ?auto_786763 ) ) ( not ( = ?auto_786758 ?auto_786764 ) ) ( not ( = ?auto_786758 ?auto_786765 ) ) ( not ( = ?auto_786758 ?auto_786766 ) ) ( not ( = ?auto_786758 ?auto_786767 ) ) ( not ( = ?auto_786758 ?auto_786768 ) ) ( not ( = ?auto_786758 ?auto_786769 ) ) ( not ( = ?auto_786758 ?auto_786770 ) ) ( not ( = ?auto_786758 ?auto_786771 ) ) ( not ( = ?auto_786759 ?auto_786760 ) ) ( not ( = ?auto_786759 ?auto_786761 ) ) ( not ( = ?auto_786759 ?auto_786762 ) ) ( not ( = ?auto_786759 ?auto_786763 ) ) ( not ( = ?auto_786759 ?auto_786764 ) ) ( not ( = ?auto_786759 ?auto_786765 ) ) ( not ( = ?auto_786759 ?auto_786766 ) ) ( not ( = ?auto_786759 ?auto_786767 ) ) ( not ( = ?auto_786759 ?auto_786768 ) ) ( not ( = ?auto_786759 ?auto_786769 ) ) ( not ( = ?auto_786759 ?auto_786770 ) ) ( not ( = ?auto_786759 ?auto_786771 ) ) ( not ( = ?auto_786760 ?auto_786761 ) ) ( not ( = ?auto_786760 ?auto_786762 ) ) ( not ( = ?auto_786760 ?auto_786763 ) ) ( not ( = ?auto_786760 ?auto_786764 ) ) ( not ( = ?auto_786760 ?auto_786765 ) ) ( not ( = ?auto_786760 ?auto_786766 ) ) ( not ( = ?auto_786760 ?auto_786767 ) ) ( not ( = ?auto_786760 ?auto_786768 ) ) ( not ( = ?auto_786760 ?auto_786769 ) ) ( not ( = ?auto_786760 ?auto_786770 ) ) ( not ( = ?auto_786760 ?auto_786771 ) ) ( not ( = ?auto_786761 ?auto_786762 ) ) ( not ( = ?auto_786761 ?auto_786763 ) ) ( not ( = ?auto_786761 ?auto_786764 ) ) ( not ( = ?auto_786761 ?auto_786765 ) ) ( not ( = ?auto_786761 ?auto_786766 ) ) ( not ( = ?auto_786761 ?auto_786767 ) ) ( not ( = ?auto_786761 ?auto_786768 ) ) ( not ( = ?auto_786761 ?auto_786769 ) ) ( not ( = ?auto_786761 ?auto_786770 ) ) ( not ( = ?auto_786761 ?auto_786771 ) ) ( not ( = ?auto_786762 ?auto_786763 ) ) ( not ( = ?auto_786762 ?auto_786764 ) ) ( not ( = ?auto_786762 ?auto_786765 ) ) ( not ( = ?auto_786762 ?auto_786766 ) ) ( not ( = ?auto_786762 ?auto_786767 ) ) ( not ( = ?auto_786762 ?auto_786768 ) ) ( not ( = ?auto_786762 ?auto_786769 ) ) ( not ( = ?auto_786762 ?auto_786770 ) ) ( not ( = ?auto_786762 ?auto_786771 ) ) ( not ( = ?auto_786763 ?auto_786764 ) ) ( not ( = ?auto_786763 ?auto_786765 ) ) ( not ( = ?auto_786763 ?auto_786766 ) ) ( not ( = ?auto_786763 ?auto_786767 ) ) ( not ( = ?auto_786763 ?auto_786768 ) ) ( not ( = ?auto_786763 ?auto_786769 ) ) ( not ( = ?auto_786763 ?auto_786770 ) ) ( not ( = ?auto_786763 ?auto_786771 ) ) ( not ( = ?auto_786764 ?auto_786765 ) ) ( not ( = ?auto_786764 ?auto_786766 ) ) ( not ( = ?auto_786764 ?auto_786767 ) ) ( not ( = ?auto_786764 ?auto_786768 ) ) ( not ( = ?auto_786764 ?auto_786769 ) ) ( not ( = ?auto_786764 ?auto_786770 ) ) ( not ( = ?auto_786764 ?auto_786771 ) ) ( not ( = ?auto_786765 ?auto_786766 ) ) ( not ( = ?auto_786765 ?auto_786767 ) ) ( not ( = ?auto_786765 ?auto_786768 ) ) ( not ( = ?auto_786765 ?auto_786769 ) ) ( not ( = ?auto_786765 ?auto_786770 ) ) ( not ( = ?auto_786765 ?auto_786771 ) ) ( not ( = ?auto_786766 ?auto_786767 ) ) ( not ( = ?auto_786766 ?auto_786768 ) ) ( not ( = ?auto_786766 ?auto_786769 ) ) ( not ( = ?auto_786766 ?auto_786770 ) ) ( not ( = ?auto_786766 ?auto_786771 ) ) ( not ( = ?auto_786767 ?auto_786768 ) ) ( not ( = ?auto_786767 ?auto_786769 ) ) ( not ( = ?auto_786767 ?auto_786770 ) ) ( not ( = ?auto_786767 ?auto_786771 ) ) ( not ( = ?auto_786768 ?auto_786769 ) ) ( not ( = ?auto_786768 ?auto_786770 ) ) ( not ( = ?auto_786768 ?auto_786771 ) ) ( not ( = ?auto_786769 ?auto_786770 ) ) ( not ( = ?auto_786769 ?auto_786771 ) ) ( not ( = ?auto_786770 ?auto_786771 ) ) ( ON ?auto_786769 ?auto_786770 ) ( ON ?auto_786768 ?auto_786769 ) ( ON ?auto_786767 ?auto_786768 ) ( ON ?auto_786766 ?auto_786767 ) ( ON ?auto_786765 ?auto_786766 ) ( CLEAR ?auto_786763 ) ( ON ?auto_786764 ?auto_786765 ) ( CLEAR ?auto_786764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_786758 ?auto_786759 ?auto_786760 ?auto_786761 ?auto_786762 ?auto_786763 ?auto_786764 )
      ( MAKE-13PILE ?auto_786758 ?auto_786759 ?auto_786760 ?auto_786761 ?auto_786762 ?auto_786763 ?auto_786764 ?auto_786765 ?auto_786766 ?auto_786767 ?auto_786768 ?auto_786769 ?auto_786770 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786812 - BLOCK
      ?auto_786813 - BLOCK
      ?auto_786814 - BLOCK
      ?auto_786815 - BLOCK
      ?auto_786816 - BLOCK
      ?auto_786817 - BLOCK
      ?auto_786818 - BLOCK
      ?auto_786819 - BLOCK
      ?auto_786820 - BLOCK
      ?auto_786821 - BLOCK
      ?auto_786822 - BLOCK
      ?auto_786823 - BLOCK
      ?auto_786824 - BLOCK
    )
    :vars
    (
      ?auto_786825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786824 ?auto_786825 ) ( ON-TABLE ?auto_786812 ) ( ON ?auto_786813 ?auto_786812 ) ( ON ?auto_786814 ?auto_786813 ) ( ON ?auto_786815 ?auto_786814 ) ( ON ?auto_786816 ?auto_786815 ) ( not ( = ?auto_786812 ?auto_786813 ) ) ( not ( = ?auto_786812 ?auto_786814 ) ) ( not ( = ?auto_786812 ?auto_786815 ) ) ( not ( = ?auto_786812 ?auto_786816 ) ) ( not ( = ?auto_786812 ?auto_786817 ) ) ( not ( = ?auto_786812 ?auto_786818 ) ) ( not ( = ?auto_786812 ?auto_786819 ) ) ( not ( = ?auto_786812 ?auto_786820 ) ) ( not ( = ?auto_786812 ?auto_786821 ) ) ( not ( = ?auto_786812 ?auto_786822 ) ) ( not ( = ?auto_786812 ?auto_786823 ) ) ( not ( = ?auto_786812 ?auto_786824 ) ) ( not ( = ?auto_786812 ?auto_786825 ) ) ( not ( = ?auto_786813 ?auto_786814 ) ) ( not ( = ?auto_786813 ?auto_786815 ) ) ( not ( = ?auto_786813 ?auto_786816 ) ) ( not ( = ?auto_786813 ?auto_786817 ) ) ( not ( = ?auto_786813 ?auto_786818 ) ) ( not ( = ?auto_786813 ?auto_786819 ) ) ( not ( = ?auto_786813 ?auto_786820 ) ) ( not ( = ?auto_786813 ?auto_786821 ) ) ( not ( = ?auto_786813 ?auto_786822 ) ) ( not ( = ?auto_786813 ?auto_786823 ) ) ( not ( = ?auto_786813 ?auto_786824 ) ) ( not ( = ?auto_786813 ?auto_786825 ) ) ( not ( = ?auto_786814 ?auto_786815 ) ) ( not ( = ?auto_786814 ?auto_786816 ) ) ( not ( = ?auto_786814 ?auto_786817 ) ) ( not ( = ?auto_786814 ?auto_786818 ) ) ( not ( = ?auto_786814 ?auto_786819 ) ) ( not ( = ?auto_786814 ?auto_786820 ) ) ( not ( = ?auto_786814 ?auto_786821 ) ) ( not ( = ?auto_786814 ?auto_786822 ) ) ( not ( = ?auto_786814 ?auto_786823 ) ) ( not ( = ?auto_786814 ?auto_786824 ) ) ( not ( = ?auto_786814 ?auto_786825 ) ) ( not ( = ?auto_786815 ?auto_786816 ) ) ( not ( = ?auto_786815 ?auto_786817 ) ) ( not ( = ?auto_786815 ?auto_786818 ) ) ( not ( = ?auto_786815 ?auto_786819 ) ) ( not ( = ?auto_786815 ?auto_786820 ) ) ( not ( = ?auto_786815 ?auto_786821 ) ) ( not ( = ?auto_786815 ?auto_786822 ) ) ( not ( = ?auto_786815 ?auto_786823 ) ) ( not ( = ?auto_786815 ?auto_786824 ) ) ( not ( = ?auto_786815 ?auto_786825 ) ) ( not ( = ?auto_786816 ?auto_786817 ) ) ( not ( = ?auto_786816 ?auto_786818 ) ) ( not ( = ?auto_786816 ?auto_786819 ) ) ( not ( = ?auto_786816 ?auto_786820 ) ) ( not ( = ?auto_786816 ?auto_786821 ) ) ( not ( = ?auto_786816 ?auto_786822 ) ) ( not ( = ?auto_786816 ?auto_786823 ) ) ( not ( = ?auto_786816 ?auto_786824 ) ) ( not ( = ?auto_786816 ?auto_786825 ) ) ( not ( = ?auto_786817 ?auto_786818 ) ) ( not ( = ?auto_786817 ?auto_786819 ) ) ( not ( = ?auto_786817 ?auto_786820 ) ) ( not ( = ?auto_786817 ?auto_786821 ) ) ( not ( = ?auto_786817 ?auto_786822 ) ) ( not ( = ?auto_786817 ?auto_786823 ) ) ( not ( = ?auto_786817 ?auto_786824 ) ) ( not ( = ?auto_786817 ?auto_786825 ) ) ( not ( = ?auto_786818 ?auto_786819 ) ) ( not ( = ?auto_786818 ?auto_786820 ) ) ( not ( = ?auto_786818 ?auto_786821 ) ) ( not ( = ?auto_786818 ?auto_786822 ) ) ( not ( = ?auto_786818 ?auto_786823 ) ) ( not ( = ?auto_786818 ?auto_786824 ) ) ( not ( = ?auto_786818 ?auto_786825 ) ) ( not ( = ?auto_786819 ?auto_786820 ) ) ( not ( = ?auto_786819 ?auto_786821 ) ) ( not ( = ?auto_786819 ?auto_786822 ) ) ( not ( = ?auto_786819 ?auto_786823 ) ) ( not ( = ?auto_786819 ?auto_786824 ) ) ( not ( = ?auto_786819 ?auto_786825 ) ) ( not ( = ?auto_786820 ?auto_786821 ) ) ( not ( = ?auto_786820 ?auto_786822 ) ) ( not ( = ?auto_786820 ?auto_786823 ) ) ( not ( = ?auto_786820 ?auto_786824 ) ) ( not ( = ?auto_786820 ?auto_786825 ) ) ( not ( = ?auto_786821 ?auto_786822 ) ) ( not ( = ?auto_786821 ?auto_786823 ) ) ( not ( = ?auto_786821 ?auto_786824 ) ) ( not ( = ?auto_786821 ?auto_786825 ) ) ( not ( = ?auto_786822 ?auto_786823 ) ) ( not ( = ?auto_786822 ?auto_786824 ) ) ( not ( = ?auto_786822 ?auto_786825 ) ) ( not ( = ?auto_786823 ?auto_786824 ) ) ( not ( = ?auto_786823 ?auto_786825 ) ) ( not ( = ?auto_786824 ?auto_786825 ) ) ( ON ?auto_786823 ?auto_786824 ) ( ON ?auto_786822 ?auto_786823 ) ( ON ?auto_786821 ?auto_786822 ) ( ON ?auto_786820 ?auto_786821 ) ( ON ?auto_786819 ?auto_786820 ) ( ON ?auto_786818 ?auto_786819 ) ( CLEAR ?auto_786816 ) ( ON ?auto_786817 ?auto_786818 ) ( CLEAR ?auto_786817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_786812 ?auto_786813 ?auto_786814 ?auto_786815 ?auto_786816 ?auto_786817 )
      ( MAKE-13PILE ?auto_786812 ?auto_786813 ?auto_786814 ?auto_786815 ?auto_786816 ?auto_786817 ?auto_786818 ?auto_786819 ?auto_786820 ?auto_786821 ?auto_786822 ?auto_786823 ?auto_786824 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786866 - BLOCK
      ?auto_786867 - BLOCK
      ?auto_786868 - BLOCK
      ?auto_786869 - BLOCK
      ?auto_786870 - BLOCK
      ?auto_786871 - BLOCK
      ?auto_786872 - BLOCK
      ?auto_786873 - BLOCK
      ?auto_786874 - BLOCK
      ?auto_786875 - BLOCK
      ?auto_786876 - BLOCK
      ?auto_786877 - BLOCK
      ?auto_786878 - BLOCK
    )
    :vars
    (
      ?auto_786879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786878 ?auto_786879 ) ( ON-TABLE ?auto_786866 ) ( ON ?auto_786867 ?auto_786866 ) ( ON ?auto_786868 ?auto_786867 ) ( ON ?auto_786869 ?auto_786868 ) ( not ( = ?auto_786866 ?auto_786867 ) ) ( not ( = ?auto_786866 ?auto_786868 ) ) ( not ( = ?auto_786866 ?auto_786869 ) ) ( not ( = ?auto_786866 ?auto_786870 ) ) ( not ( = ?auto_786866 ?auto_786871 ) ) ( not ( = ?auto_786866 ?auto_786872 ) ) ( not ( = ?auto_786866 ?auto_786873 ) ) ( not ( = ?auto_786866 ?auto_786874 ) ) ( not ( = ?auto_786866 ?auto_786875 ) ) ( not ( = ?auto_786866 ?auto_786876 ) ) ( not ( = ?auto_786866 ?auto_786877 ) ) ( not ( = ?auto_786866 ?auto_786878 ) ) ( not ( = ?auto_786866 ?auto_786879 ) ) ( not ( = ?auto_786867 ?auto_786868 ) ) ( not ( = ?auto_786867 ?auto_786869 ) ) ( not ( = ?auto_786867 ?auto_786870 ) ) ( not ( = ?auto_786867 ?auto_786871 ) ) ( not ( = ?auto_786867 ?auto_786872 ) ) ( not ( = ?auto_786867 ?auto_786873 ) ) ( not ( = ?auto_786867 ?auto_786874 ) ) ( not ( = ?auto_786867 ?auto_786875 ) ) ( not ( = ?auto_786867 ?auto_786876 ) ) ( not ( = ?auto_786867 ?auto_786877 ) ) ( not ( = ?auto_786867 ?auto_786878 ) ) ( not ( = ?auto_786867 ?auto_786879 ) ) ( not ( = ?auto_786868 ?auto_786869 ) ) ( not ( = ?auto_786868 ?auto_786870 ) ) ( not ( = ?auto_786868 ?auto_786871 ) ) ( not ( = ?auto_786868 ?auto_786872 ) ) ( not ( = ?auto_786868 ?auto_786873 ) ) ( not ( = ?auto_786868 ?auto_786874 ) ) ( not ( = ?auto_786868 ?auto_786875 ) ) ( not ( = ?auto_786868 ?auto_786876 ) ) ( not ( = ?auto_786868 ?auto_786877 ) ) ( not ( = ?auto_786868 ?auto_786878 ) ) ( not ( = ?auto_786868 ?auto_786879 ) ) ( not ( = ?auto_786869 ?auto_786870 ) ) ( not ( = ?auto_786869 ?auto_786871 ) ) ( not ( = ?auto_786869 ?auto_786872 ) ) ( not ( = ?auto_786869 ?auto_786873 ) ) ( not ( = ?auto_786869 ?auto_786874 ) ) ( not ( = ?auto_786869 ?auto_786875 ) ) ( not ( = ?auto_786869 ?auto_786876 ) ) ( not ( = ?auto_786869 ?auto_786877 ) ) ( not ( = ?auto_786869 ?auto_786878 ) ) ( not ( = ?auto_786869 ?auto_786879 ) ) ( not ( = ?auto_786870 ?auto_786871 ) ) ( not ( = ?auto_786870 ?auto_786872 ) ) ( not ( = ?auto_786870 ?auto_786873 ) ) ( not ( = ?auto_786870 ?auto_786874 ) ) ( not ( = ?auto_786870 ?auto_786875 ) ) ( not ( = ?auto_786870 ?auto_786876 ) ) ( not ( = ?auto_786870 ?auto_786877 ) ) ( not ( = ?auto_786870 ?auto_786878 ) ) ( not ( = ?auto_786870 ?auto_786879 ) ) ( not ( = ?auto_786871 ?auto_786872 ) ) ( not ( = ?auto_786871 ?auto_786873 ) ) ( not ( = ?auto_786871 ?auto_786874 ) ) ( not ( = ?auto_786871 ?auto_786875 ) ) ( not ( = ?auto_786871 ?auto_786876 ) ) ( not ( = ?auto_786871 ?auto_786877 ) ) ( not ( = ?auto_786871 ?auto_786878 ) ) ( not ( = ?auto_786871 ?auto_786879 ) ) ( not ( = ?auto_786872 ?auto_786873 ) ) ( not ( = ?auto_786872 ?auto_786874 ) ) ( not ( = ?auto_786872 ?auto_786875 ) ) ( not ( = ?auto_786872 ?auto_786876 ) ) ( not ( = ?auto_786872 ?auto_786877 ) ) ( not ( = ?auto_786872 ?auto_786878 ) ) ( not ( = ?auto_786872 ?auto_786879 ) ) ( not ( = ?auto_786873 ?auto_786874 ) ) ( not ( = ?auto_786873 ?auto_786875 ) ) ( not ( = ?auto_786873 ?auto_786876 ) ) ( not ( = ?auto_786873 ?auto_786877 ) ) ( not ( = ?auto_786873 ?auto_786878 ) ) ( not ( = ?auto_786873 ?auto_786879 ) ) ( not ( = ?auto_786874 ?auto_786875 ) ) ( not ( = ?auto_786874 ?auto_786876 ) ) ( not ( = ?auto_786874 ?auto_786877 ) ) ( not ( = ?auto_786874 ?auto_786878 ) ) ( not ( = ?auto_786874 ?auto_786879 ) ) ( not ( = ?auto_786875 ?auto_786876 ) ) ( not ( = ?auto_786875 ?auto_786877 ) ) ( not ( = ?auto_786875 ?auto_786878 ) ) ( not ( = ?auto_786875 ?auto_786879 ) ) ( not ( = ?auto_786876 ?auto_786877 ) ) ( not ( = ?auto_786876 ?auto_786878 ) ) ( not ( = ?auto_786876 ?auto_786879 ) ) ( not ( = ?auto_786877 ?auto_786878 ) ) ( not ( = ?auto_786877 ?auto_786879 ) ) ( not ( = ?auto_786878 ?auto_786879 ) ) ( ON ?auto_786877 ?auto_786878 ) ( ON ?auto_786876 ?auto_786877 ) ( ON ?auto_786875 ?auto_786876 ) ( ON ?auto_786874 ?auto_786875 ) ( ON ?auto_786873 ?auto_786874 ) ( ON ?auto_786872 ?auto_786873 ) ( ON ?auto_786871 ?auto_786872 ) ( CLEAR ?auto_786869 ) ( ON ?auto_786870 ?auto_786871 ) ( CLEAR ?auto_786870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_786866 ?auto_786867 ?auto_786868 ?auto_786869 ?auto_786870 )
      ( MAKE-13PILE ?auto_786866 ?auto_786867 ?auto_786868 ?auto_786869 ?auto_786870 ?auto_786871 ?auto_786872 ?auto_786873 ?auto_786874 ?auto_786875 ?auto_786876 ?auto_786877 ?auto_786878 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786920 - BLOCK
      ?auto_786921 - BLOCK
      ?auto_786922 - BLOCK
      ?auto_786923 - BLOCK
      ?auto_786924 - BLOCK
      ?auto_786925 - BLOCK
      ?auto_786926 - BLOCK
      ?auto_786927 - BLOCK
      ?auto_786928 - BLOCK
      ?auto_786929 - BLOCK
      ?auto_786930 - BLOCK
      ?auto_786931 - BLOCK
      ?auto_786932 - BLOCK
    )
    :vars
    (
      ?auto_786933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786932 ?auto_786933 ) ( ON-TABLE ?auto_786920 ) ( ON ?auto_786921 ?auto_786920 ) ( ON ?auto_786922 ?auto_786921 ) ( not ( = ?auto_786920 ?auto_786921 ) ) ( not ( = ?auto_786920 ?auto_786922 ) ) ( not ( = ?auto_786920 ?auto_786923 ) ) ( not ( = ?auto_786920 ?auto_786924 ) ) ( not ( = ?auto_786920 ?auto_786925 ) ) ( not ( = ?auto_786920 ?auto_786926 ) ) ( not ( = ?auto_786920 ?auto_786927 ) ) ( not ( = ?auto_786920 ?auto_786928 ) ) ( not ( = ?auto_786920 ?auto_786929 ) ) ( not ( = ?auto_786920 ?auto_786930 ) ) ( not ( = ?auto_786920 ?auto_786931 ) ) ( not ( = ?auto_786920 ?auto_786932 ) ) ( not ( = ?auto_786920 ?auto_786933 ) ) ( not ( = ?auto_786921 ?auto_786922 ) ) ( not ( = ?auto_786921 ?auto_786923 ) ) ( not ( = ?auto_786921 ?auto_786924 ) ) ( not ( = ?auto_786921 ?auto_786925 ) ) ( not ( = ?auto_786921 ?auto_786926 ) ) ( not ( = ?auto_786921 ?auto_786927 ) ) ( not ( = ?auto_786921 ?auto_786928 ) ) ( not ( = ?auto_786921 ?auto_786929 ) ) ( not ( = ?auto_786921 ?auto_786930 ) ) ( not ( = ?auto_786921 ?auto_786931 ) ) ( not ( = ?auto_786921 ?auto_786932 ) ) ( not ( = ?auto_786921 ?auto_786933 ) ) ( not ( = ?auto_786922 ?auto_786923 ) ) ( not ( = ?auto_786922 ?auto_786924 ) ) ( not ( = ?auto_786922 ?auto_786925 ) ) ( not ( = ?auto_786922 ?auto_786926 ) ) ( not ( = ?auto_786922 ?auto_786927 ) ) ( not ( = ?auto_786922 ?auto_786928 ) ) ( not ( = ?auto_786922 ?auto_786929 ) ) ( not ( = ?auto_786922 ?auto_786930 ) ) ( not ( = ?auto_786922 ?auto_786931 ) ) ( not ( = ?auto_786922 ?auto_786932 ) ) ( not ( = ?auto_786922 ?auto_786933 ) ) ( not ( = ?auto_786923 ?auto_786924 ) ) ( not ( = ?auto_786923 ?auto_786925 ) ) ( not ( = ?auto_786923 ?auto_786926 ) ) ( not ( = ?auto_786923 ?auto_786927 ) ) ( not ( = ?auto_786923 ?auto_786928 ) ) ( not ( = ?auto_786923 ?auto_786929 ) ) ( not ( = ?auto_786923 ?auto_786930 ) ) ( not ( = ?auto_786923 ?auto_786931 ) ) ( not ( = ?auto_786923 ?auto_786932 ) ) ( not ( = ?auto_786923 ?auto_786933 ) ) ( not ( = ?auto_786924 ?auto_786925 ) ) ( not ( = ?auto_786924 ?auto_786926 ) ) ( not ( = ?auto_786924 ?auto_786927 ) ) ( not ( = ?auto_786924 ?auto_786928 ) ) ( not ( = ?auto_786924 ?auto_786929 ) ) ( not ( = ?auto_786924 ?auto_786930 ) ) ( not ( = ?auto_786924 ?auto_786931 ) ) ( not ( = ?auto_786924 ?auto_786932 ) ) ( not ( = ?auto_786924 ?auto_786933 ) ) ( not ( = ?auto_786925 ?auto_786926 ) ) ( not ( = ?auto_786925 ?auto_786927 ) ) ( not ( = ?auto_786925 ?auto_786928 ) ) ( not ( = ?auto_786925 ?auto_786929 ) ) ( not ( = ?auto_786925 ?auto_786930 ) ) ( not ( = ?auto_786925 ?auto_786931 ) ) ( not ( = ?auto_786925 ?auto_786932 ) ) ( not ( = ?auto_786925 ?auto_786933 ) ) ( not ( = ?auto_786926 ?auto_786927 ) ) ( not ( = ?auto_786926 ?auto_786928 ) ) ( not ( = ?auto_786926 ?auto_786929 ) ) ( not ( = ?auto_786926 ?auto_786930 ) ) ( not ( = ?auto_786926 ?auto_786931 ) ) ( not ( = ?auto_786926 ?auto_786932 ) ) ( not ( = ?auto_786926 ?auto_786933 ) ) ( not ( = ?auto_786927 ?auto_786928 ) ) ( not ( = ?auto_786927 ?auto_786929 ) ) ( not ( = ?auto_786927 ?auto_786930 ) ) ( not ( = ?auto_786927 ?auto_786931 ) ) ( not ( = ?auto_786927 ?auto_786932 ) ) ( not ( = ?auto_786927 ?auto_786933 ) ) ( not ( = ?auto_786928 ?auto_786929 ) ) ( not ( = ?auto_786928 ?auto_786930 ) ) ( not ( = ?auto_786928 ?auto_786931 ) ) ( not ( = ?auto_786928 ?auto_786932 ) ) ( not ( = ?auto_786928 ?auto_786933 ) ) ( not ( = ?auto_786929 ?auto_786930 ) ) ( not ( = ?auto_786929 ?auto_786931 ) ) ( not ( = ?auto_786929 ?auto_786932 ) ) ( not ( = ?auto_786929 ?auto_786933 ) ) ( not ( = ?auto_786930 ?auto_786931 ) ) ( not ( = ?auto_786930 ?auto_786932 ) ) ( not ( = ?auto_786930 ?auto_786933 ) ) ( not ( = ?auto_786931 ?auto_786932 ) ) ( not ( = ?auto_786931 ?auto_786933 ) ) ( not ( = ?auto_786932 ?auto_786933 ) ) ( ON ?auto_786931 ?auto_786932 ) ( ON ?auto_786930 ?auto_786931 ) ( ON ?auto_786929 ?auto_786930 ) ( ON ?auto_786928 ?auto_786929 ) ( ON ?auto_786927 ?auto_786928 ) ( ON ?auto_786926 ?auto_786927 ) ( ON ?auto_786925 ?auto_786926 ) ( ON ?auto_786924 ?auto_786925 ) ( CLEAR ?auto_786922 ) ( ON ?auto_786923 ?auto_786924 ) ( CLEAR ?auto_786923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_786920 ?auto_786921 ?auto_786922 ?auto_786923 )
      ( MAKE-13PILE ?auto_786920 ?auto_786921 ?auto_786922 ?auto_786923 ?auto_786924 ?auto_786925 ?auto_786926 ?auto_786927 ?auto_786928 ?auto_786929 ?auto_786930 ?auto_786931 ?auto_786932 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_786974 - BLOCK
      ?auto_786975 - BLOCK
      ?auto_786976 - BLOCK
      ?auto_786977 - BLOCK
      ?auto_786978 - BLOCK
      ?auto_786979 - BLOCK
      ?auto_786980 - BLOCK
      ?auto_786981 - BLOCK
      ?auto_786982 - BLOCK
      ?auto_786983 - BLOCK
      ?auto_786984 - BLOCK
      ?auto_786985 - BLOCK
      ?auto_786986 - BLOCK
    )
    :vars
    (
      ?auto_786987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_786986 ?auto_786987 ) ( ON-TABLE ?auto_786974 ) ( ON ?auto_786975 ?auto_786974 ) ( not ( = ?auto_786974 ?auto_786975 ) ) ( not ( = ?auto_786974 ?auto_786976 ) ) ( not ( = ?auto_786974 ?auto_786977 ) ) ( not ( = ?auto_786974 ?auto_786978 ) ) ( not ( = ?auto_786974 ?auto_786979 ) ) ( not ( = ?auto_786974 ?auto_786980 ) ) ( not ( = ?auto_786974 ?auto_786981 ) ) ( not ( = ?auto_786974 ?auto_786982 ) ) ( not ( = ?auto_786974 ?auto_786983 ) ) ( not ( = ?auto_786974 ?auto_786984 ) ) ( not ( = ?auto_786974 ?auto_786985 ) ) ( not ( = ?auto_786974 ?auto_786986 ) ) ( not ( = ?auto_786974 ?auto_786987 ) ) ( not ( = ?auto_786975 ?auto_786976 ) ) ( not ( = ?auto_786975 ?auto_786977 ) ) ( not ( = ?auto_786975 ?auto_786978 ) ) ( not ( = ?auto_786975 ?auto_786979 ) ) ( not ( = ?auto_786975 ?auto_786980 ) ) ( not ( = ?auto_786975 ?auto_786981 ) ) ( not ( = ?auto_786975 ?auto_786982 ) ) ( not ( = ?auto_786975 ?auto_786983 ) ) ( not ( = ?auto_786975 ?auto_786984 ) ) ( not ( = ?auto_786975 ?auto_786985 ) ) ( not ( = ?auto_786975 ?auto_786986 ) ) ( not ( = ?auto_786975 ?auto_786987 ) ) ( not ( = ?auto_786976 ?auto_786977 ) ) ( not ( = ?auto_786976 ?auto_786978 ) ) ( not ( = ?auto_786976 ?auto_786979 ) ) ( not ( = ?auto_786976 ?auto_786980 ) ) ( not ( = ?auto_786976 ?auto_786981 ) ) ( not ( = ?auto_786976 ?auto_786982 ) ) ( not ( = ?auto_786976 ?auto_786983 ) ) ( not ( = ?auto_786976 ?auto_786984 ) ) ( not ( = ?auto_786976 ?auto_786985 ) ) ( not ( = ?auto_786976 ?auto_786986 ) ) ( not ( = ?auto_786976 ?auto_786987 ) ) ( not ( = ?auto_786977 ?auto_786978 ) ) ( not ( = ?auto_786977 ?auto_786979 ) ) ( not ( = ?auto_786977 ?auto_786980 ) ) ( not ( = ?auto_786977 ?auto_786981 ) ) ( not ( = ?auto_786977 ?auto_786982 ) ) ( not ( = ?auto_786977 ?auto_786983 ) ) ( not ( = ?auto_786977 ?auto_786984 ) ) ( not ( = ?auto_786977 ?auto_786985 ) ) ( not ( = ?auto_786977 ?auto_786986 ) ) ( not ( = ?auto_786977 ?auto_786987 ) ) ( not ( = ?auto_786978 ?auto_786979 ) ) ( not ( = ?auto_786978 ?auto_786980 ) ) ( not ( = ?auto_786978 ?auto_786981 ) ) ( not ( = ?auto_786978 ?auto_786982 ) ) ( not ( = ?auto_786978 ?auto_786983 ) ) ( not ( = ?auto_786978 ?auto_786984 ) ) ( not ( = ?auto_786978 ?auto_786985 ) ) ( not ( = ?auto_786978 ?auto_786986 ) ) ( not ( = ?auto_786978 ?auto_786987 ) ) ( not ( = ?auto_786979 ?auto_786980 ) ) ( not ( = ?auto_786979 ?auto_786981 ) ) ( not ( = ?auto_786979 ?auto_786982 ) ) ( not ( = ?auto_786979 ?auto_786983 ) ) ( not ( = ?auto_786979 ?auto_786984 ) ) ( not ( = ?auto_786979 ?auto_786985 ) ) ( not ( = ?auto_786979 ?auto_786986 ) ) ( not ( = ?auto_786979 ?auto_786987 ) ) ( not ( = ?auto_786980 ?auto_786981 ) ) ( not ( = ?auto_786980 ?auto_786982 ) ) ( not ( = ?auto_786980 ?auto_786983 ) ) ( not ( = ?auto_786980 ?auto_786984 ) ) ( not ( = ?auto_786980 ?auto_786985 ) ) ( not ( = ?auto_786980 ?auto_786986 ) ) ( not ( = ?auto_786980 ?auto_786987 ) ) ( not ( = ?auto_786981 ?auto_786982 ) ) ( not ( = ?auto_786981 ?auto_786983 ) ) ( not ( = ?auto_786981 ?auto_786984 ) ) ( not ( = ?auto_786981 ?auto_786985 ) ) ( not ( = ?auto_786981 ?auto_786986 ) ) ( not ( = ?auto_786981 ?auto_786987 ) ) ( not ( = ?auto_786982 ?auto_786983 ) ) ( not ( = ?auto_786982 ?auto_786984 ) ) ( not ( = ?auto_786982 ?auto_786985 ) ) ( not ( = ?auto_786982 ?auto_786986 ) ) ( not ( = ?auto_786982 ?auto_786987 ) ) ( not ( = ?auto_786983 ?auto_786984 ) ) ( not ( = ?auto_786983 ?auto_786985 ) ) ( not ( = ?auto_786983 ?auto_786986 ) ) ( not ( = ?auto_786983 ?auto_786987 ) ) ( not ( = ?auto_786984 ?auto_786985 ) ) ( not ( = ?auto_786984 ?auto_786986 ) ) ( not ( = ?auto_786984 ?auto_786987 ) ) ( not ( = ?auto_786985 ?auto_786986 ) ) ( not ( = ?auto_786985 ?auto_786987 ) ) ( not ( = ?auto_786986 ?auto_786987 ) ) ( ON ?auto_786985 ?auto_786986 ) ( ON ?auto_786984 ?auto_786985 ) ( ON ?auto_786983 ?auto_786984 ) ( ON ?auto_786982 ?auto_786983 ) ( ON ?auto_786981 ?auto_786982 ) ( ON ?auto_786980 ?auto_786981 ) ( ON ?auto_786979 ?auto_786980 ) ( ON ?auto_786978 ?auto_786979 ) ( ON ?auto_786977 ?auto_786978 ) ( CLEAR ?auto_786975 ) ( ON ?auto_786976 ?auto_786977 ) ( CLEAR ?auto_786976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_786974 ?auto_786975 ?auto_786976 )
      ( MAKE-13PILE ?auto_786974 ?auto_786975 ?auto_786976 ?auto_786977 ?auto_786978 ?auto_786979 ?auto_786980 ?auto_786981 ?auto_786982 ?auto_786983 ?auto_786984 ?auto_786985 ?auto_786986 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_787028 - BLOCK
      ?auto_787029 - BLOCK
      ?auto_787030 - BLOCK
      ?auto_787031 - BLOCK
      ?auto_787032 - BLOCK
      ?auto_787033 - BLOCK
      ?auto_787034 - BLOCK
      ?auto_787035 - BLOCK
      ?auto_787036 - BLOCK
      ?auto_787037 - BLOCK
      ?auto_787038 - BLOCK
      ?auto_787039 - BLOCK
      ?auto_787040 - BLOCK
    )
    :vars
    (
      ?auto_787041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787040 ?auto_787041 ) ( ON-TABLE ?auto_787028 ) ( not ( = ?auto_787028 ?auto_787029 ) ) ( not ( = ?auto_787028 ?auto_787030 ) ) ( not ( = ?auto_787028 ?auto_787031 ) ) ( not ( = ?auto_787028 ?auto_787032 ) ) ( not ( = ?auto_787028 ?auto_787033 ) ) ( not ( = ?auto_787028 ?auto_787034 ) ) ( not ( = ?auto_787028 ?auto_787035 ) ) ( not ( = ?auto_787028 ?auto_787036 ) ) ( not ( = ?auto_787028 ?auto_787037 ) ) ( not ( = ?auto_787028 ?auto_787038 ) ) ( not ( = ?auto_787028 ?auto_787039 ) ) ( not ( = ?auto_787028 ?auto_787040 ) ) ( not ( = ?auto_787028 ?auto_787041 ) ) ( not ( = ?auto_787029 ?auto_787030 ) ) ( not ( = ?auto_787029 ?auto_787031 ) ) ( not ( = ?auto_787029 ?auto_787032 ) ) ( not ( = ?auto_787029 ?auto_787033 ) ) ( not ( = ?auto_787029 ?auto_787034 ) ) ( not ( = ?auto_787029 ?auto_787035 ) ) ( not ( = ?auto_787029 ?auto_787036 ) ) ( not ( = ?auto_787029 ?auto_787037 ) ) ( not ( = ?auto_787029 ?auto_787038 ) ) ( not ( = ?auto_787029 ?auto_787039 ) ) ( not ( = ?auto_787029 ?auto_787040 ) ) ( not ( = ?auto_787029 ?auto_787041 ) ) ( not ( = ?auto_787030 ?auto_787031 ) ) ( not ( = ?auto_787030 ?auto_787032 ) ) ( not ( = ?auto_787030 ?auto_787033 ) ) ( not ( = ?auto_787030 ?auto_787034 ) ) ( not ( = ?auto_787030 ?auto_787035 ) ) ( not ( = ?auto_787030 ?auto_787036 ) ) ( not ( = ?auto_787030 ?auto_787037 ) ) ( not ( = ?auto_787030 ?auto_787038 ) ) ( not ( = ?auto_787030 ?auto_787039 ) ) ( not ( = ?auto_787030 ?auto_787040 ) ) ( not ( = ?auto_787030 ?auto_787041 ) ) ( not ( = ?auto_787031 ?auto_787032 ) ) ( not ( = ?auto_787031 ?auto_787033 ) ) ( not ( = ?auto_787031 ?auto_787034 ) ) ( not ( = ?auto_787031 ?auto_787035 ) ) ( not ( = ?auto_787031 ?auto_787036 ) ) ( not ( = ?auto_787031 ?auto_787037 ) ) ( not ( = ?auto_787031 ?auto_787038 ) ) ( not ( = ?auto_787031 ?auto_787039 ) ) ( not ( = ?auto_787031 ?auto_787040 ) ) ( not ( = ?auto_787031 ?auto_787041 ) ) ( not ( = ?auto_787032 ?auto_787033 ) ) ( not ( = ?auto_787032 ?auto_787034 ) ) ( not ( = ?auto_787032 ?auto_787035 ) ) ( not ( = ?auto_787032 ?auto_787036 ) ) ( not ( = ?auto_787032 ?auto_787037 ) ) ( not ( = ?auto_787032 ?auto_787038 ) ) ( not ( = ?auto_787032 ?auto_787039 ) ) ( not ( = ?auto_787032 ?auto_787040 ) ) ( not ( = ?auto_787032 ?auto_787041 ) ) ( not ( = ?auto_787033 ?auto_787034 ) ) ( not ( = ?auto_787033 ?auto_787035 ) ) ( not ( = ?auto_787033 ?auto_787036 ) ) ( not ( = ?auto_787033 ?auto_787037 ) ) ( not ( = ?auto_787033 ?auto_787038 ) ) ( not ( = ?auto_787033 ?auto_787039 ) ) ( not ( = ?auto_787033 ?auto_787040 ) ) ( not ( = ?auto_787033 ?auto_787041 ) ) ( not ( = ?auto_787034 ?auto_787035 ) ) ( not ( = ?auto_787034 ?auto_787036 ) ) ( not ( = ?auto_787034 ?auto_787037 ) ) ( not ( = ?auto_787034 ?auto_787038 ) ) ( not ( = ?auto_787034 ?auto_787039 ) ) ( not ( = ?auto_787034 ?auto_787040 ) ) ( not ( = ?auto_787034 ?auto_787041 ) ) ( not ( = ?auto_787035 ?auto_787036 ) ) ( not ( = ?auto_787035 ?auto_787037 ) ) ( not ( = ?auto_787035 ?auto_787038 ) ) ( not ( = ?auto_787035 ?auto_787039 ) ) ( not ( = ?auto_787035 ?auto_787040 ) ) ( not ( = ?auto_787035 ?auto_787041 ) ) ( not ( = ?auto_787036 ?auto_787037 ) ) ( not ( = ?auto_787036 ?auto_787038 ) ) ( not ( = ?auto_787036 ?auto_787039 ) ) ( not ( = ?auto_787036 ?auto_787040 ) ) ( not ( = ?auto_787036 ?auto_787041 ) ) ( not ( = ?auto_787037 ?auto_787038 ) ) ( not ( = ?auto_787037 ?auto_787039 ) ) ( not ( = ?auto_787037 ?auto_787040 ) ) ( not ( = ?auto_787037 ?auto_787041 ) ) ( not ( = ?auto_787038 ?auto_787039 ) ) ( not ( = ?auto_787038 ?auto_787040 ) ) ( not ( = ?auto_787038 ?auto_787041 ) ) ( not ( = ?auto_787039 ?auto_787040 ) ) ( not ( = ?auto_787039 ?auto_787041 ) ) ( not ( = ?auto_787040 ?auto_787041 ) ) ( ON ?auto_787039 ?auto_787040 ) ( ON ?auto_787038 ?auto_787039 ) ( ON ?auto_787037 ?auto_787038 ) ( ON ?auto_787036 ?auto_787037 ) ( ON ?auto_787035 ?auto_787036 ) ( ON ?auto_787034 ?auto_787035 ) ( ON ?auto_787033 ?auto_787034 ) ( ON ?auto_787032 ?auto_787033 ) ( ON ?auto_787031 ?auto_787032 ) ( ON ?auto_787030 ?auto_787031 ) ( CLEAR ?auto_787028 ) ( ON ?auto_787029 ?auto_787030 ) ( CLEAR ?auto_787029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_787028 ?auto_787029 )
      ( MAKE-13PILE ?auto_787028 ?auto_787029 ?auto_787030 ?auto_787031 ?auto_787032 ?auto_787033 ?auto_787034 ?auto_787035 ?auto_787036 ?auto_787037 ?auto_787038 ?auto_787039 ?auto_787040 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_787082 - BLOCK
      ?auto_787083 - BLOCK
      ?auto_787084 - BLOCK
      ?auto_787085 - BLOCK
      ?auto_787086 - BLOCK
      ?auto_787087 - BLOCK
      ?auto_787088 - BLOCK
      ?auto_787089 - BLOCK
      ?auto_787090 - BLOCK
      ?auto_787091 - BLOCK
      ?auto_787092 - BLOCK
      ?auto_787093 - BLOCK
      ?auto_787094 - BLOCK
    )
    :vars
    (
      ?auto_787095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787094 ?auto_787095 ) ( not ( = ?auto_787082 ?auto_787083 ) ) ( not ( = ?auto_787082 ?auto_787084 ) ) ( not ( = ?auto_787082 ?auto_787085 ) ) ( not ( = ?auto_787082 ?auto_787086 ) ) ( not ( = ?auto_787082 ?auto_787087 ) ) ( not ( = ?auto_787082 ?auto_787088 ) ) ( not ( = ?auto_787082 ?auto_787089 ) ) ( not ( = ?auto_787082 ?auto_787090 ) ) ( not ( = ?auto_787082 ?auto_787091 ) ) ( not ( = ?auto_787082 ?auto_787092 ) ) ( not ( = ?auto_787082 ?auto_787093 ) ) ( not ( = ?auto_787082 ?auto_787094 ) ) ( not ( = ?auto_787082 ?auto_787095 ) ) ( not ( = ?auto_787083 ?auto_787084 ) ) ( not ( = ?auto_787083 ?auto_787085 ) ) ( not ( = ?auto_787083 ?auto_787086 ) ) ( not ( = ?auto_787083 ?auto_787087 ) ) ( not ( = ?auto_787083 ?auto_787088 ) ) ( not ( = ?auto_787083 ?auto_787089 ) ) ( not ( = ?auto_787083 ?auto_787090 ) ) ( not ( = ?auto_787083 ?auto_787091 ) ) ( not ( = ?auto_787083 ?auto_787092 ) ) ( not ( = ?auto_787083 ?auto_787093 ) ) ( not ( = ?auto_787083 ?auto_787094 ) ) ( not ( = ?auto_787083 ?auto_787095 ) ) ( not ( = ?auto_787084 ?auto_787085 ) ) ( not ( = ?auto_787084 ?auto_787086 ) ) ( not ( = ?auto_787084 ?auto_787087 ) ) ( not ( = ?auto_787084 ?auto_787088 ) ) ( not ( = ?auto_787084 ?auto_787089 ) ) ( not ( = ?auto_787084 ?auto_787090 ) ) ( not ( = ?auto_787084 ?auto_787091 ) ) ( not ( = ?auto_787084 ?auto_787092 ) ) ( not ( = ?auto_787084 ?auto_787093 ) ) ( not ( = ?auto_787084 ?auto_787094 ) ) ( not ( = ?auto_787084 ?auto_787095 ) ) ( not ( = ?auto_787085 ?auto_787086 ) ) ( not ( = ?auto_787085 ?auto_787087 ) ) ( not ( = ?auto_787085 ?auto_787088 ) ) ( not ( = ?auto_787085 ?auto_787089 ) ) ( not ( = ?auto_787085 ?auto_787090 ) ) ( not ( = ?auto_787085 ?auto_787091 ) ) ( not ( = ?auto_787085 ?auto_787092 ) ) ( not ( = ?auto_787085 ?auto_787093 ) ) ( not ( = ?auto_787085 ?auto_787094 ) ) ( not ( = ?auto_787085 ?auto_787095 ) ) ( not ( = ?auto_787086 ?auto_787087 ) ) ( not ( = ?auto_787086 ?auto_787088 ) ) ( not ( = ?auto_787086 ?auto_787089 ) ) ( not ( = ?auto_787086 ?auto_787090 ) ) ( not ( = ?auto_787086 ?auto_787091 ) ) ( not ( = ?auto_787086 ?auto_787092 ) ) ( not ( = ?auto_787086 ?auto_787093 ) ) ( not ( = ?auto_787086 ?auto_787094 ) ) ( not ( = ?auto_787086 ?auto_787095 ) ) ( not ( = ?auto_787087 ?auto_787088 ) ) ( not ( = ?auto_787087 ?auto_787089 ) ) ( not ( = ?auto_787087 ?auto_787090 ) ) ( not ( = ?auto_787087 ?auto_787091 ) ) ( not ( = ?auto_787087 ?auto_787092 ) ) ( not ( = ?auto_787087 ?auto_787093 ) ) ( not ( = ?auto_787087 ?auto_787094 ) ) ( not ( = ?auto_787087 ?auto_787095 ) ) ( not ( = ?auto_787088 ?auto_787089 ) ) ( not ( = ?auto_787088 ?auto_787090 ) ) ( not ( = ?auto_787088 ?auto_787091 ) ) ( not ( = ?auto_787088 ?auto_787092 ) ) ( not ( = ?auto_787088 ?auto_787093 ) ) ( not ( = ?auto_787088 ?auto_787094 ) ) ( not ( = ?auto_787088 ?auto_787095 ) ) ( not ( = ?auto_787089 ?auto_787090 ) ) ( not ( = ?auto_787089 ?auto_787091 ) ) ( not ( = ?auto_787089 ?auto_787092 ) ) ( not ( = ?auto_787089 ?auto_787093 ) ) ( not ( = ?auto_787089 ?auto_787094 ) ) ( not ( = ?auto_787089 ?auto_787095 ) ) ( not ( = ?auto_787090 ?auto_787091 ) ) ( not ( = ?auto_787090 ?auto_787092 ) ) ( not ( = ?auto_787090 ?auto_787093 ) ) ( not ( = ?auto_787090 ?auto_787094 ) ) ( not ( = ?auto_787090 ?auto_787095 ) ) ( not ( = ?auto_787091 ?auto_787092 ) ) ( not ( = ?auto_787091 ?auto_787093 ) ) ( not ( = ?auto_787091 ?auto_787094 ) ) ( not ( = ?auto_787091 ?auto_787095 ) ) ( not ( = ?auto_787092 ?auto_787093 ) ) ( not ( = ?auto_787092 ?auto_787094 ) ) ( not ( = ?auto_787092 ?auto_787095 ) ) ( not ( = ?auto_787093 ?auto_787094 ) ) ( not ( = ?auto_787093 ?auto_787095 ) ) ( not ( = ?auto_787094 ?auto_787095 ) ) ( ON ?auto_787093 ?auto_787094 ) ( ON ?auto_787092 ?auto_787093 ) ( ON ?auto_787091 ?auto_787092 ) ( ON ?auto_787090 ?auto_787091 ) ( ON ?auto_787089 ?auto_787090 ) ( ON ?auto_787088 ?auto_787089 ) ( ON ?auto_787087 ?auto_787088 ) ( ON ?auto_787086 ?auto_787087 ) ( ON ?auto_787085 ?auto_787086 ) ( ON ?auto_787084 ?auto_787085 ) ( ON ?auto_787083 ?auto_787084 ) ( ON ?auto_787082 ?auto_787083 ) ( CLEAR ?auto_787082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_787082 )
      ( MAKE-13PILE ?auto_787082 ?auto_787083 ?auto_787084 ?auto_787085 ?auto_787086 ?auto_787087 ?auto_787088 ?auto_787089 ?auto_787090 ?auto_787091 ?auto_787092 ?auto_787093 ?auto_787094 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787137 - BLOCK
      ?auto_787138 - BLOCK
      ?auto_787139 - BLOCK
      ?auto_787140 - BLOCK
      ?auto_787141 - BLOCK
      ?auto_787142 - BLOCK
      ?auto_787143 - BLOCK
      ?auto_787144 - BLOCK
      ?auto_787145 - BLOCK
      ?auto_787146 - BLOCK
      ?auto_787147 - BLOCK
      ?auto_787148 - BLOCK
      ?auto_787149 - BLOCK
      ?auto_787150 - BLOCK
    )
    :vars
    (
      ?auto_787151 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_787149 ) ( ON ?auto_787150 ?auto_787151 ) ( CLEAR ?auto_787150 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_787137 ) ( ON ?auto_787138 ?auto_787137 ) ( ON ?auto_787139 ?auto_787138 ) ( ON ?auto_787140 ?auto_787139 ) ( ON ?auto_787141 ?auto_787140 ) ( ON ?auto_787142 ?auto_787141 ) ( ON ?auto_787143 ?auto_787142 ) ( ON ?auto_787144 ?auto_787143 ) ( ON ?auto_787145 ?auto_787144 ) ( ON ?auto_787146 ?auto_787145 ) ( ON ?auto_787147 ?auto_787146 ) ( ON ?auto_787148 ?auto_787147 ) ( ON ?auto_787149 ?auto_787148 ) ( not ( = ?auto_787137 ?auto_787138 ) ) ( not ( = ?auto_787137 ?auto_787139 ) ) ( not ( = ?auto_787137 ?auto_787140 ) ) ( not ( = ?auto_787137 ?auto_787141 ) ) ( not ( = ?auto_787137 ?auto_787142 ) ) ( not ( = ?auto_787137 ?auto_787143 ) ) ( not ( = ?auto_787137 ?auto_787144 ) ) ( not ( = ?auto_787137 ?auto_787145 ) ) ( not ( = ?auto_787137 ?auto_787146 ) ) ( not ( = ?auto_787137 ?auto_787147 ) ) ( not ( = ?auto_787137 ?auto_787148 ) ) ( not ( = ?auto_787137 ?auto_787149 ) ) ( not ( = ?auto_787137 ?auto_787150 ) ) ( not ( = ?auto_787137 ?auto_787151 ) ) ( not ( = ?auto_787138 ?auto_787139 ) ) ( not ( = ?auto_787138 ?auto_787140 ) ) ( not ( = ?auto_787138 ?auto_787141 ) ) ( not ( = ?auto_787138 ?auto_787142 ) ) ( not ( = ?auto_787138 ?auto_787143 ) ) ( not ( = ?auto_787138 ?auto_787144 ) ) ( not ( = ?auto_787138 ?auto_787145 ) ) ( not ( = ?auto_787138 ?auto_787146 ) ) ( not ( = ?auto_787138 ?auto_787147 ) ) ( not ( = ?auto_787138 ?auto_787148 ) ) ( not ( = ?auto_787138 ?auto_787149 ) ) ( not ( = ?auto_787138 ?auto_787150 ) ) ( not ( = ?auto_787138 ?auto_787151 ) ) ( not ( = ?auto_787139 ?auto_787140 ) ) ( not ( = ?auto_787139 ?auto_787141 ) ) ( not ( = ?auto_787139 ?auto_787142 ) ) ( not ( = ?auto_787139 ?auto_787143 ) ) ( not ( = ?auto_787139 ?auto_787144 ) ) ( not ( = ?auto_787139 ?auto_787145 ) ) ( not ( = ?auto_787139 ?auto_787146 ) ) ( not ( = ?auto_787139 ?auto_787147 ) ) ( not ( = ?auto_787139 ?auto_787148 ) ) ( not ( = ?auto_787139 ?auto_787149 ) ) ( not ( = ?auto_787139 ?auto_787150 ) ) ( not ( = ?auto_787139 ?auto_787151 ) ) ( not ( = ?auto_787140 ?auto_787141 ) ) ( not ( = ?auto_787140 ?auto_787142 ) ) ( not ( = ?auto_787140 ?auto_787143 ) ) ( not ( = ?auto_787140 ?auto_787144 ) ) ( not ( = ?auto_787140 ?auto_787145 ) ) ( not ( = ?auto_787140 ?auto_787146 ) ) ( not ( = ?auto_787140 ?auto_787147 ) ) ( not ( = ?auto_787140 ?auto_787148 ) ) ( not ( = ?auto_787140 ?auto_787149 ) ) ( not ( = ?auto_787140 ?auto_787150 ) ) ( not ( = ?auto_787140 ?auto_787151 ) ) ( not ( = ?auto_787141 ?auto_787142 ) ) ( not ( = ?auto_787141 ?auto_787143 ) ) ( not ( = ?auto_787141 ?auto_787144 ) ) ( not ( = ?auto_787141 ?auto_787145 ) ) ( not ( = ?auto_787141 ?auto_787146 ) ) ( not ( = ?auto_787141 ?auto_787147 ) ) ( not ( = ?auto_787141 ?auto_787148 ) ) ( not ( = ?auto_787141 ?auto_787149 ) ) ( not ( = ?auto_787141 ?auto_787150 ) ) ( not ( = ?auto_787141 ?auto_787151 ) ) ( not ( = ?auto_787142 ?auto_787143 ) ) ( not ( = ?auto_787142 ?auto_787144 ) ) ( not ( = ?auto_787142 ?auto_787145 ) ) ( not ( = ?auto_787142 ?auto_787146 ) ) ( not ( = ?auto_787142 ?auto_787147 ) ) ( not ( = ?auto_787142 ?auto_787148 ) ) ( not ( = ?auto_787142 ?auto_787149 ) ) ( not ( = ?auto_787142 ?auto_787150 ) ) ( not ( = ?auto_787142 ?auto_787151 ) ) ( not ( = ?auto_787143 ?auto_787144 ) ) ( not ( = ?auto_787143 ?auto_787145 ) ) ( not ( = ?auto_787143 ?auto_787146 ) ) ( not ( = ?auto_787143 ?auto_787147 ) ) ( not ( = ?auto_787143 ?auto_787148 ) ) ( not ( = ?auto_787143 ?auto_787149 ) ) ( not ( = ?auto_787143 ?auto_787150 ) ) ( not ( = ?auto_787143 ?auto_787151 ) ) ( not ( = ?auto_787144 ?auto_787145 ) ) ( not ( = ?auto_787144 ?auto_787146 ) ) ( not ( = ?auto_787144 ?auto_787147 ) ) ( not ( = ?auto_787144 ?auto_787148 ) ) ( not ( = ?auto_787144 ?auto_787149 ) ) ( not ( = ?auto_787144 ?auto_787150 ) ) ( not ( = ?auto_787144 ?auto_787151 ) ) ( not ( = ?auto_787145 ?auto_787146 ) ) ( not ( = ?auto_787145 ?auto_787147 ) ) ( not ( = ?auto_787145 ?auto_787148 ) ) ( not ( = ?auto_787145 ?auto_787149 ) ) ( not ( = ?auto_787145 ?auto_787150 ) ) ( not ( = ?auto_787145 ?auto_787151 ) ) ( not ( = ?auto_787146 ?auto_787147 ) ) ( not ( = ?auto_787146 ?auto_787148 ) ) ( not ( = ?auto_787146 ?auto_787149 ) ) ( not ( = ?auto_787146 ?auto_787150 ) ) ( not ( = ?auto_787146 ?auto_787151 ) ) ( not ( = ?auto_787147 ?auto_787148 ) ) ( not ( = ?auto_787147 ?auto_787149 ) ) ( not ( = ?auto_787147 ?auto_787150 ) ) ( not ( = ?auto_787147 ?auto_787151 ) ) ( not ( = ?auto_787148 ?auto_787149 ) ) ( not ( = ?auto_787148 ?auto_787150 ) ) ( not ( = ?auto_787148 ?auto_787151 ) ) ( not ( = ?auto_787149 ?auto_787150 ) ) ( not ( = ?auto_787149 ?auto_787151 ) ) ( not ( = ?auto_787150 ?auto_787151 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_787150 ?auto_787151 )
      ( !STACK ?auto_787150 ?auto_787149 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787195 - BLOCK
      ?auto_787196 - BLOCK
      ?auto_787197 - BLOCK
      ?auto_787198 - BLOCK
      ?auto_787199 - BLOCK
      ?auto_787200 - BLOCK
      ?auto_787201 - BLOCK
      ?auto_787202 - BLOCK
      ?auto_787203 - BLOCK
      ?auto_787204 - BLOCK
      ?auto_787205 - BLOCK
      ?auto_787206 - BLOCK
      ?auto_787207 - BLOCK
      ?auto_787208 - BLOCK
    )
    :vars
    (
      ?auto_787209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787208 ?auto_787209 ) ( ON-TABLE ?auto_787195 ) ( ON ?auto_787196 ?auto_787195 ) ( ON ?auto_787197 ?auto_787196 ) ( ON ?auto_787198 ?auto_787197 ) ( ON ?auto_787199 ?auto_787198 ) ( ON ?auto_787200 ?auto_787199 ) ( ON ?auto_787201 ?auto_787200 ) ( ON ?auto_787202 ?auto_787201 ) ( ON ?auto_787203 ?auto_787202 ) ( ON ?auto_787204 ?auto_787203 ) ( ON ?auto_787205 ?auto_787204 ) ( ON ?auto_787206 ?auto_787205 ) ( not ( = ?auto_787195 ?auto_787196 ) ) ( not ( = ?auto_787195 ?auto_787197 ) ) ( not ( = ?auto_787195 ?auto_787198 ) ) ( not ( = ?auto_787195 ?auto_787199 ) ) ( not ( = ?auto_787195 ?auto_787200 ) ) ( not ( = ?auto_787195 ?auto_787201 ) ) ( not ( = ?auto_787195 ?auto_787202 ) ) ( not ( = ?auto_787195 ?auto_787203 ) ) ( not ( = ?auto_787195 ?auto_787204 ) ) ( not ( = ?auto_787195 ?auto_787205 ) ) ( not ( = ?auto_787195 ?auto_787206 ) ) ( not ( = ?auto_787195 ?auto_787207 ) ) ( not ( = ?auto_787195 ?auto_787208 ) ) ( not ( = ?auto_787195 ?auto_787209 ) ) ( not ( = ?auto_787196 ?auto_787197 ) ) ( not ( = ?auto_787196 ?auto_787198 ) ) ( not ( = ?auto_787196 ?auto_787199 ) ) ( not ( = ?auto_787196 ?auto_787200 ) ) ( not ( = ?auto_787196 ?auto_787201 ) ) ( not ( = ?auto_787196 ?auto_787202 ) ) ( not ( = ?auto_787196 ?auto_787203 ) ) ( not ( = ?auto_787196 ?auto_787204 ) ) ( not ( = ?auto_787196 ?auto_787205 ) ) ( not ( = ?auto_787196 ?auto_787206 ) ) ( not ( = ?auto_787196 ?auto_787207 ) ) ( not ( = ?auto_787196 ?auto_787208 ) ) ( not ( = ?auto_787196 ?auto_787209 ) ) ( not ( = ?auto_787197 ?auto_787198 ) ) ( not ( = ?auto_787197 ?auto_787199 ) ) ( not ( = ?auto_787197 ?auto_787200 ) ) ( not ( = ?auto_787197 ?auto_787201 ) ) ( not ( = ?auto_787197 ?auto_787202 ) ) ( not ( = ?auto_787197 ?auto_787203 ) ) ( not ( = ?auto_787197 ?auto_787204 ) ) ( not ( = ?auto_787197 ?auto_787205 ) ) ( not ( = ?auto_787197 ?auto_787206 ) ) ( not ( = ?auto_787197 ?auto_787207 ) ) ( not ( = ?auto_787197 ?auto_787208 ) ) ( not ( = ?auto_787197 ?auto_787209 ) ) ( not ( = ?auto_787198 ?auto_787199 ) ) ( not ( = ?auto_787198 ?auto_787200 ) ) ( not ( = ?auto_787198 ?auto_787201 ) ) ( not ( = ?auto_787198 ?auto_787202 ) ) ( not ( = ?auto_787198 ?auto_787203 ) ) ( not ( = ?auto_787198 ?auto_787204 ) ) ( not ( = ?auto_787198 ?auto_787205 ) ) ( not ( = ?auto_787198 ?auto_787206 ) ) ( not ( = ?auto_787198 ?auto_787207 ) ) ( not ( = ?auto_787198 ?auto_787208 ) ) ( not ( = ?auto_787198 ?auto_787209 ) ) ( not ( = ?auto_787199 ?auto_787200 ) ) ( not ( = ?auto_787199 ?auto_787201 ) ) ( not ( = ?auto_787199 ?auto_787202 ) ) ( not ( = ?auto_787199 ?auto_787203 ) ) ( not ( = ?auto_787199 ?auto_787204 ) ) ( not ( = ?auto_787199 ?auto_787205 ) ) ( not ( = ?auto_787199 ?auto_787206 ) ) ( not ( = ?auto_787199 ?auto_787207 ) ) ( not ( = ?auto_787199 ?auto_787208 ) ) ( not ( = ?auto_787199 ?auto_787209 ) ) ( not ( = ?auto_787200 ?auto_787201 ) ) ( not ( = ?auto_787200 ?auto_787202 ) ) ( not ( = ?auto_787200 ?auto_787203 ) ) ( not ( = ?auto_787200 ?auto_787204 ) ) ( not ( = ?auto_787200 ?auto_787205 ) ) ( not ( = ?auto_787200 ?auto_787206 ) ) ( not ( = ?auto_787200 ?auto_787207 ) ) ( not ( = ?auto_787200 ?auto_787208 ) ) ( not ( = ?auto_787200 ?auto_787209 ) ) ( not ( = ?auto_787201 ?auto_787202 ) ) ( not ( = ?auto_787201 ?auto_787203 ) ) ( not ( = ?auto_787201 ?auto_787204 ) ) ( not ( = ?auto_787201 ?auto_787205 ) ) ( not ( = ?auto_787201 ?auto_787206 ) ) ( not ( = ?auto_787201 ?auto_787207 ) ) ( not ( = ?auto_787201 ?auto_787208 ) ) ( not ( = ?auto_787201 ?auto_787209 ) ) ( not ( = ?auto_787202 ?auto_787203 ) ) ( not ( = ?auto_787202 ?auto_787204 ) ) ( not ( = ?auto_787202 ?auto_787205 ) ) ( not ( = ?auto_787202 ?auto_787206 ) ) ( not ( = ?auto_787202 ?auto_787207 ) ) ( not ( = ?auto_787202 ?auto_787208 ) ) ( not ( = ?auto_787202 ?auto_787209 ) ) ( not ( = ?auto_787203 ?auto_787204 ) ) ( not ( = ?auto_787203 ?auto_787205 ) ) ( not ( = ?auto_787203 ?auto_787206 ) ) ( not ( = ?auto_787203 ?auto_787207 ) ) ( not ( = ?auto_787203 ?auto_787208 ) ) ( not ( = ?auto_787203 ?auto_787209 ) ) ( not ( = ?auto_787204 ?auto_787205 ) ) ( not ( = ?auto_787204 ?auto_787206 ) ) ( not ( = ?auto_787204 ?auto_787207 ) ) ( not ( = ?auto_787204 ?auto_787208 ) ) ( not ( = ?auto_787204 ?auto_787209 ) ) ( not ( = ?auto_787205 ?auto_787206 ) ) ( not ( = ?auto_787205 ?auto_787207 ) ) ( not ( = ?auto_787205 ?auto_787208 ) ) ( not ( = ?auto_787205 ?auto_787209 ) ) ( not ( = ?auto_787206 ?auto_787207 ) ) ( not ( = ?auto_787206 ?auto_787208 ) ) ( not ( = ?auto_787206 ?auto_787209 ) ) ( not ( = ?auto_787207 ?auto_787208 ) ) ( not ( = ?auto_787207 ?auto_787209 ) ) ( not ( = ?auto_787208 ?auto_787209 ) ) ( CLEAR ?auto_787206 ) ( ON ?auto_787207 ?auto_787208 ) ( CLEAR ?auto_787207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_787195 ?auto_787196 ?auto_787197 ?auto_787198 ?auto_787199 ?auto_787200 ?auto_787201 ?auto_787202 ?auto_787203 ?auto_787204 ?auto_787205 ?auto_787206 ?auto_787207 )
      ( MAKE-14PILE ?auto_787195 ?auto_787196 ?auto_787197 ?auto_787198 ?auto_787199 ?auto_787200 ?auto_787201 ?auto_787202 ?auto_787203 ?auto_787204 ?auto_787205 ?auto_787206 ?auto_787207 ?auto_787208 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787253 - BLOCK
      ?auto_787254 - BLOCK
      ?auto_787255 - BLOCK
      ?auto_787256 - BLOCK
      ?auto_787257 - BLOCK
      ?auto_787258 - BLOCK
      ?auto_787259 - BLOCK
      ?auto_787260 - BLOCK
      ?auto_787261 - BLOCK
      ?auto_787262 - BLOCK
      ?auto_787263 - BLOCK
      ?auto_787264 - BLOCK
      ?auto_787265 - BLOCK
      ?auto_787266 - BLOCK
    )
    :vars
    (
      ?auto_787267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787266 ?auto_787267 ) ( ON-TABLE ?auto_787253 ) ( ON ?auto_787254 ?auto_787253 ) ( ON ?auto_787255 ?auto_787254 ) ( ON ?auto_787256 ?auto_787255 ) ( ON ?auto_787257 ?auto_787256 ) ( ON ?auto_787258 ?auto_787257 ) ( ON ?auto_787259 ?auto_787258 ) ( ON ?auto_787260 ?auto_787259 ) ( ON ?auto_787261 ?auto_787260 ) ( ON ?auto_787262 ?auto_787261 ) ( ON ?auto_787263 ?auto_787262 ) ( not ( = ?auto_787253 ?auto_787254 ) ) ( not ( = ?auto_787253 ?auto_787255 ) ) ( not ( = ?auto_787253 ?auto_787256 ) ) ( not ( = ?auto_787253 ?auto_787257 ) ) ( not ( = ?auto_787253 ?auto_787258 ) ) ( not ( = ?auto_787253 ?auto_787259 ) ) ( not ( = ?auto_787253 ?auto_787260 ) ) ( not ( = ?auto_787253 ?auto_787261 ) ) ( not ( = ?auto_787253 ?auto_787262 ) ) ( not ( = ?auto_787253 ?auto_787263 ) ) ( not ( = ?auto_787253 ?auto_787264 ) ) ( not ( = ?auto_787253 ?auto_787265 ) ) ( not ( = ?auto_787253 ?auto_787266 ) ) ( not ( = ?auto_787253 ?auto_787267 ) ) ( not ( = ?auto_787254 ?auto_787255 ) ) ( not ( = ?auto_787254 ?auto_787256 ) ) ( not ( = ?auto_787254 ?auto_787257 ) ) ( not ( = ?auto_787254 ?auto_787258 ) ) ( not ( = ?auto_787254 ?auto_787259 ) ) ( not ( = ?auto_787254 ?auto_787260 ) ) ( not ( = ?auto_787254 ?auto_787261 ) ) ( not ( = ?auto_787254 ?auto_787262 ) ) ( not ( = ?auto_787254 ?auto_787263 ) ) ( not ( = ?auto_787254 ?auto_787264 ) ) ( not ( = ?auto_787254 ?auto_787265 ) ) ( not ( = ?auto_787254 ?auto_787266 ) ) ( not ( = ?auto_787254 ?auto_787267 ) ) ( not ( = ?auto_787255 ?auto_787256 ) ) ( not ( = ?auto_787255 ?auto_787257 ) ) ( not ( = ?auto_787255 ?auto_787258 ) ) ( not ( = ?auto_787255 ?auto_787259 ) ) ( not ( = ?auto_787255 ?auto_787260 ) ) ( not ( = ?auto_787255 ?auto_787261 ) ) ( not ( = ?auto_787255 ?auto_787262 ) ) ( not ( = ?auto_787255 ?auto_787263 ) ) ( not ( = ?auto_787255 ?auto_787264 ) ) ( not ( = ?auto_787255 ?auto_787265 ) ) ( not ( = ?auto_787255 ?auto_787266 ) ) ( not ( = ?auto_787255 ?auto_787267 ) ) ( not ( = ?auto_787256 ?auto_787257 ) ) ( not ( = ?auto_787256 ?auto_787258 ) ) ( not ( = ?auto_787256 ?auto_787259 ) ) ( not ( = ?auto_787256 ?auto_787260 ) ) ( not ( = ?auto_787256 ?auto_787261 ) ) ( not ( = ?auto_787256 ?auto_787262 ) ) ( not ( = ?auto_787256 ?auto_787263 ) ) ( not ( = ?auto_787256 ?auto_787264 ) ) ( not ( = ?auto_787256 ?auto_787265 ) ) ( not ( = ?auto_787256 ?auto_787266 ) ) ( not ( = ?auto_787256 ?auto_787267 ) ) ( not ( = ?auto_787257 ?auto_787258 ) ) ( not ( = ?auto_787257 ?auto_787259 ) ) ( not ( = ?auto_787257 ?auto_787260 ) ) ( not ( = ?auto_787257 ?auto_787261 ) ) ( not ( = ?auto_787257 ?auto_787262 ) ) ( not ( = ?auto_787257 ?auto_787263 ) ) ( not ( = ?auto_787257 ?auto_787264 ) ) ( not ( = ?auto_787257 ?auto_787265 ) ) ( not ( = ?auto_787257 ?auto_787266 ) ) ( not ( = ?auto_787257 ?auto_787267 ) ) ( not ( = ?auto_787258 ?auto_787259 ) ) ( not ( = ?auto_787258 ?auto_787260 ) ) ( not ( = ?auto_787258 ?auto_787261 ) ) ( not ( = ?auto_787258 ?auto_787262 ) ) ( not ( = ?auto_787258 ?auto_787263 ) ) ( not ( = ?auto_787258 ?auto_787264 ) ) ( not ( = ?auto_787258 ?auto_787265 ) ) ( not ( = ?auto_787258 ?auto_787266 ) ) ( not ( = ?auto_787258 ?auto_787267 ) ) ( not ( = ?auto_787259 ?auto_787260 ) ) ( not ( = ?auto_787259 ?auto_787261 ) ) ( not ( = ?auto_787259 ?auto_787262 ) ) ( not ( = ?auto_787259 ?auto_787263 ) ) ( not ( = ?auto_787259 ?auto_787264 ) ) ( not ( = ?auto_787259 ?auto_787265 ) ) ( not ( = ?auto_787259 ?auto_787266 ) ) ( not ( = ?auto_787259 ?auto_787267 ) ) ( not ( = ?auto_787260 ?auto_787261 ) ) ( not ( = ?auto_787260 ?auto_787262 ) ) ( not ( = ?auto_787260 ?auto_787263 ) ) ( not ( = ?auto_787260 ?auto_787264 ) ) ( not ( = ?auto_787260 ?auto_787265 ) ) ( not ( = ?auto_787260 ?auto_787266 ) ) ( not ( = ?auto_787260 ?auto_787267 ) ) ( not ( = ?auto_787261 ?auto_787262 ) ) ( not ( = ?auto_787261 ?auto_787263 ) ) ( not ( = ?auto_787261 ?auto_787264 ) ) ( not ( = ?auto_787261 ?auto_787265 ) ) ( not ( = ?auto_787261 ?auto_787266 ) ) ( not ( = ?auto_787261 ?auto_787267 ) ) ( not ( = ?auto_787262 ?auto_787263 ) ) ( not ( = ?auto_787262 ?auto_787264 ) ) ( not ( = ?auto_787262 ?auto_787265 ) ) ( not ( = ?auto_787262 ?auto_787266 ) ) ( not ( = ?auto_787262 ?auto_787267 ) ) ( not ( = ?auto_787263 ?auto_787264 ) ) ( not ( = ?auto_787263 ?auto_787265 ) ) ( not ( = ?auto_787263 ?auto_787266 ) ) ( not ( = ?auto_787263 ?auto_787267 ) ) ( not ( = ?auto_787264 ?auto_787265 ) ) ( not ( = ?auto_787264 ?auto_787266 ) ) ( not ( = ?auto_787264 ?auto_787267 ) ) ( not ( = ?auto_787265 ?auto_787266 ) ) ( not ( = ?auto_787265 ?auto_787267 ) ) ( not ( = ?auto_787266 ?auto_787267 ) ) ( ON ?auto_787265 ?auto_787266 ) ( CLEAR ?auto_787263 ) ( ON ?auto_787264 ?auto_787265 ) ( CLEAR ?auto_787264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_787253 ?auto_787254 ?auto_787255 ?auto_787256 ?auto_787257 ?auto_787258 ?auto_787259 ?auto_787260 ?auto_787261 ?auto_787262 ?auto_787263 ?auto_787264 )
      ( MAKE-14PILE ?auto_787253 ?auto_787254 ?auto_787255 ?auto_787256 ?auto_787257 ?auto_787258 ?auto_787259 ?auto_787260 ?auto_787261 ?auto_787262 ?auto_787263 ?auto_787264 ?auto_787265 ?auto_787266 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787311 - BLOCK
      ?auto_787312 - BLOCK
      ?auto_787313 - BLOCK
      ?auto_787314 - BLOCK
      ?auto_787315 - BLOCK
      ?auto_787316 - BLOCK
      ?auto_787317 - BLOCK
      ?auto_787318 - BLOCK
      ?auto_787319 - BLOCK
      ?auto_787320 - BLOCK
      ?auto_787321 - BLOCK
      ?auto_787322 - BLOCK
      ?auto_787323 - BLOCK
      ?auto_787324 - BLOCK
    )
    :vars
    (
      ?auto_787325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787324 ?auto_787325 ) ( ON-TABLE ?auto_787311 ) ( ON ?auto_787312 ?auto_787311 ) ( ON ?auto_787313 ?auto_787312 ) ( ON ?auto_787314 ?auto_787313 ) ( ON ?auto_787315 ?auto_787314 ) ( ON ?auto_787316 ?auto_787315 ) ( ON ?auto_787317 ?auto_787316 ) ( ON ?auto_787318 ?auto_787317 ) ( ON ?auto_787319 ?auto_787318 ) ( ON ?auto_787320 ?auto_787319 ) ( not ( = ?auto_787311 ?auto_787312 ) ) ( not ( = ?auto_787311 ?auto_787313 ) ) ( not ( = ?auto_787311 ?auto_787314 ) ) ( not ( = ?auto_787311 ?auto_787315 ) ) ( not ( = ?auto_787311 ?auto_787316 ) ) ( not ( = ?auto_787311 ?auto_787317 ) ) ( not ( = ?auto_787311 ?auto_787318 ) ) ( not ( = ?auto_787311 ?auto_787319 ) ) ( not ( = ?auto_787311 ?auto_787320 ) ) ( not ( = ?auto_787311 ?auto_787321 ) ) ( not ( = ?auto_787311 ?auto_787322 ) ) ( not ( = ?auto_787311 ?auto_787323 ) ) ( not ( = ?auto_787311 ?auto_787324 ) ) ( not ( = ?auto_787311 ?auto_787325 ) ) ( not ( = ?auto_787312 ?auto_787313 ) ) ( not ( = ?auto_787312 ?auto_787314 ) ) ( not ( = ?auto_787312 ?auto_787315 ) ) ( not ( = ?auto_787312 ?auto_787316 ) ) ( not ( = ?auto_787312 ?auto_787317 ) ) ( not ( = ?auto_787312 ?auto_787318 ) ) ( not ( = ?auto_787312 ?auto_787319 ) ) ( not ( = ?auto_787312 ?auto_787320 ) ) ( not ( = ?auto_787312 ?auto_787321 ) ) ( not ( = ?auto_787312 ?auto_787322 ) ) ( not ( = ?auto_787312 ?auto_787323 ) ) ( not ( = ?auto_787312 ?auto_787324 ) ) ( not ( = ?auto_787312 ?auto_787325 ) ) ( not ( = ?auto_787313 ?auto_787314 ) ) ( not ( = ?auto_787313 ?auto_787315 ) ) ( not ( = ?auto_787313 ?auto_787316 ) ) ( not ( = ?auto_787313 ?auto_787317 ) ) ( not ( = ?auto_787313 ?auto_787318 ) ) ( not ( = ?auto_787313 ?auto_787319 ) ) ( not ( = ?auto_787313 ?auto_787320 ) ) ( not ( = ?auto_787313 ?auto_787321 ) ) ( not ( = ?auto_787313 ?auto_787322 ) ) ( not ( = ?auto_787313 ?auto_787323 ) ) ( not ( = ?auto_787313 ?auto_787324 ) ) ( not ( = ?auto_787313 ?auto_787325 ) ) ( not ( = ?auto_787314 ?auto_787315 ) ) ( not ( = ?auto_787314 ?auto_787316 ) ) ( not ( = ?auto_787314 ?auto_787317 ) ) ( not ( = ?auto_787314 ?auto_787318 ) ) ( not ( = ?auto_787314 ?auto_787319 ) ) ( not ( = ?auto_787314 ?auto_787320 ) ) ( not ( = ?auto_787314 ?auto_787321 ) ) ( not ( = ?auto_787314 ?auto_787322 ) ) ( not ( = ?auto_787314 ?auto_787323 ) ) ( not ( = ?auto_787314 ?auto_787324 ) ) ( not ( = ?auto_787314 ?auto_787325 ) ) ( not ( = ?auto_787315 ?auto_787316 ) ) ( not ( = ?auto_787315 ?auto_787317 ) ) ( not ( = ?auto_787315 ?auto_787318 ) ) ( not ( = ?auto_787315 ?auto_787319 ) ) ( not ( = ?auto_787315 ?auto_787320 ) ) ( not ( = ?auto_787315 ?auto_787321 ) ) ( not ( = ?auto_787315 ?auto_787322 ) ) ( not ( = ?auto_787315 ?auto_787323 ) ) ( not ( = ?auto_787315 ?auto_787324 ) ) ( not ( = ?auto_787315 ?auto_787325 ) ) ( not ( = ?auto_787316 ?auto_787317 ) ) ( not ( = ?auto_787316 ?auto_787318 ) ) ( not ( = ?auto_787316 ?auto_787319 ) ) ( not ( = ?auto_787316 ?auto_787320 ) ) ( not ( = ?auto_787316 ?auto_787321 ) ) ( not ( = ?auto_787316 ?auto_787322 ) ) ( not ( = ?auto_787316 ?auto_787323 ) ) ( not ( = ?auto_787316 ?auto_787324 ) ) ( not ( = ?auto_787316 ?auto_787325 ) ) ( not ( = ?auto_787317 ?auto_787318 ) ) ( not ( = ?auto_787317 ?auto_787319 ) ) ( not ( = ?auto_787317 ?auto_787320 ) ) ( not ( = ?auto_787317 ?auto_787321 ) ) ( not ( = ?auto_787317 ?auto_787322 ) ) ( not ( = ?auto_787317 ?auto_787323 ) ) ( not ( = ?auto_787317 ?auto_787324 ) ) ( not ( = ?auto_787317 ?auto_787325 ) ) ( not ( = ?auto_787318 ?auto_787319 ) ) ( not ( = ?auto_787318 ?auto_787320 ) ) ( not ( = ?auto_787318 ?auto_787321 ) ) ( not ( = ?auto_787318 ?auto_787322 ) ) ( not ( = ?auto_787318 ?auto_787323 ) ) ( not ( = ?auto_787318 ?auto_787324 ) ) ( not ( = ?auto_787318 ?auto_787325 ) ) ( not ( = ?auto_787319 ?auto_787320 ) ) ( not ( = ?auto_787319 ?auto_787321 ) ) ( not ( = ?auto_787319 ?auto_787322 ) ) ( not ( = ?auto_787319 ?auto_787323 ) ) ( not ( = ?auto_787319 ?auto_787324 ) ) ( not ( = ?auto_787319 ?auto_787325 ) ) ( not ( = ?auto_787320 ?auto_787321 ) ) ( not ( = ?auto_787320 ?auto_787322 ) ) ( not ( = ?auto_787320 ?auto_787323 ) ) ( not ( = ?auto_787320 ?auto_787324 ) ) ( not ( = ?auto_787320 ?auto_787325 ) ) ( not ( = ?auto_787321 ?auto_787322 ) ) ( not ( = ?auto_787321 ?auto_787323 ) ) ( not ( = ?auto_787321 ?auto_787324 ) ) ( not ( = ?auto_787321 ?auto_787325 ) ) ( not ( = ?auto_787322 ?auto_787323 ) ) ( not ( = ?auto_787322 ?auto_787324 ) ) ( not ( = ?auto_787322 ?auto_787325 ) ) ( not ( = ?auto_787323 ?auto_787324 ) ) ( not ( = ?auto_787323 ?auto_787325 ) ) ( not ( = ?auto_787324 ?auto_787325 ) ) ( ON ?auto_787323 ?auto_787324 ) ( ON ?auto_787322 ?auto_787323 ) ( CLEAR ?auto_787320 ) ( ON ?auto_787321 ?auto_787322 ) ( CLEAR ?auto_787321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_787311 ?auto_787312 ?auto_787313 ?auto_787314 ?auto_787315 ?auto_787316 ?auto_787317 ?auto_787318 ?auto_787319 ?auto_787320 ?auto_787321 )
      ( MAKE-14PILE ?auto_787311 ?auto_787312 ?auto_787313 ?auto_787314 ?auto_787315 ?auto_787316 ?auto_787317 ?auto_787318 ?auto_787319 ?auto_787320 ?auto_787321 ?auto_787322 ?auto_787323 ?auto_787324 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787369 - BLOCK
      ?auto_787370 - BLOCK
      ?auto_787371 - BLOCK
      ?auto_787372 - BLOCK
      ?auto_787373 - BLOCK
      ?auto_787374 - BLOCK
      ?auto_787375 - BLOCK
      ?auto_787376 - BLOCK
      ?auto_787377 - BLOCK
      ?auto_787378 - BLOCK
      ?auto_787379 - BLOCK
      ?auto_787380 - BLOCK
      ?auto_787381 - BLOCK
      ?auto_787382 - BLOCK
    )
    :vars
    (
      ?auto_787383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787382 ?auto_787383 ) ( ON-TABLE ?auto_787369 ) ( ON ?auto_787370 ?auto_787369 ) ( ON ?auto_787371 ?auto_787370 ) ( ON ?auto_787372 ?auto_787371 ) ( ON ?auto_787373 ?auto_787372 ) ( ON ?auto_787374 ?auto_787373 ) ( ON ?auto_787375 ?auto_787374 ) ( ON ?auto_787376 ?auto_787375 ) ( ON ?auto_787377 ?auto_787376 ) ( not ( = ?auto_787369 ?auto_787370 ) ) ( not ( = ?auto_787369 ?auto_787371 ) ) ( not ( = ?auto_787369 ?auto_787372 ) ) ( not ( = ?auto_787369 ?auto_787373 ) ) ( not ( = ?auto_787369 ?auto_787374 ) ) ( not ( = ?auto_787369 ?auto_787375 ) ) ( not ( = ?auto_787369 ?auto_787376 ) ) ( not ( = ?auto_787369 ?auto_787377 ) ) ( not ( = ?auto_787369 ?auto_787378 ) ) ( not ( = ?auto_787369 ?auto_787379 ) ) ( not ( = ?auto_787369 ?auto_787380 ) ) ( not ( = ?auto_787369 ?auto_787381 ) ) ( not ( = ?auto_787369 ?auto_787382 ) ) ( not ( = ?auto_787369 ?auto_787383 ) ) ( not ( = ?auto_787370 ?auto_787371 ) ) ( not ( = ?auto_787370 ?auto_787372 ) ) ( not ( = ?auto_787370 ?auto_787373 ) ) ( not ( = ?auto_787370 ?auto_787374 ) ) ( not ( = ?auto_787370 ?auto_787375 ) ) ( not ( = ?auto_787370 ?auto_787376 ) ) ( not ( = ?auto_787370 ?auto_787377 ) ) ( not ( = ?auto_787370 ?auto_787378 ) ) ( not ( = ?auto_787370 ?auto_787379 ) ) ( not ( = ?auto_787370 ?auto_787380 ) ) ( not ( = ?auto_787370 ?auto_787381 ) ) ( not ( = ?auto_787370 ?auto_787382 ) ) ( not ( = ?auto_787370 ?auto_787383 ) ) ( not ( = ?auto_787371 ?auto_787372 ) ) ( not ( = ?auto_787371 ?auto_787373 ) ) ( not ( = ?auto_787371 ?auto_787374 ) ) ( not ( = ?auto_787371 ?auto_787375 ) ) ( not ( = ?auto_787371 ?auto_787376 ) ) ( not ( = ?auto_787371 ?auto_787377 ) ) ( not ( = ?auto_787371 ?auto_787378 ) ) ( not ( = ?auto_787371 ?auto_787379 ) ) ( not ( = ?auto_787371 ?auto_787380 ) ) ( not ( = ?auto_787371 ?auto_787381 ) ) ( not ( = ?auto_787371 ?auto_787382 ) ) ( not ( = ?auto_787371 ?auto_787383 ) ) ( not ( = ?auto_787372 ?auto_787373 ) ) ( not ( = ?auto_787372 ?auto_787374 ) ) ( not ( = ?auto_787372 ?auto_787375 ) ) ( not ( = ?auto_787372 ?auto_787376 ) ) ( not ( = ?auto_787372 ?auto_787377 ) ) ( not ( = ?auto_787372 ?auto_787378 ) ) ( not ( = ?auto_787372 ?auto_787379 ) ) ( not ( = ?auto_787372 ?auto_787380 ) ) ( not ( = ?auto_787372 ?auto_787381 ) ) ( not ( = ?auto_787372 ?auto_787382 ) ) ( not ( = ?auto_787372 ?auto_787383 ) ) ( not ( = ?auto_787373 ?auto_787374 ) ) ( not ( = ?auto_787373 ?auto_787375 ) ) ( not ( = ?auto_787373 ?auto_787376 ) ) ( not ( = ?auto_787373 ?auto_787377 ) ) ( not ( = ?auto_787373 ?auto_787378 ) ) ( not ( = ?auto_787373 ?auto_787379 ) ) ( not ( = ?auto_787373 ?auto_787380 ) ) ( not ( = ?auto_787373 ?auto_787381 ) ) ( not ( = ?auto_787373 ?auto_787382 ) ) ( not ( = ?auto_787373 ?auto_787383 ) ) ( not ( = ?auto_787374 ?auto_787375 ) ) ( not ( = ?auto_787374 ?auto_787376 ) ) ( not ( = ?auto_787374 ?auto_787377 ) ) ( not ( = ?auto_787374 ?auto_787378 ) ) ( not ( = ?auto_787374 ?auto_787379 ) ) ( not ( = ?auto_787374 ?auto_787380 ) ) ( not ( = ?auto_787374 ?auto_787381 ) ) ( not ( = ?auto_787374 ?auto_787382 ) ) ( not ( = ?auto_787374 ?auto_787383 ) ) ( not ( = ?auto_787375 ?auto_787376 ) ) ( not ( = ?auto_787375 ?auto_787377 ) ) ( not ( = ?auto_787375 ?auto_787378 ) ) ( not ( = ?auto_787375 ?auto_787379 ) ) ( not ( = ?auto_787375 ?auto_787380 ) ) ( not ( = ?auto_787375 ?auto_787381 ) ) ( not ( = ?auto_787375 ?auto_787382 ) ) ( not ( = ?auto_787375 ?auto_787383 ) ) ( not ( = ?auto_787376 ?auto_787377 ) ) ( not ( = ?auto_787376 ?auto_787378 ) ) ( not ( = ?auto_787376 ?auto_787379 ) ) ( not ( = ?auto_787376 ?auto_787380 ) ) ( not ( = ?auto_787376 ?auto_787381 ) ) ( not ( = ?auto_787376 ?auto_787382 ) ) ( not ( = ?auto_787376 ?auto_787383 ) ) ( not ( = ?auto_787377 ?auto_787378 ) ) ( not ( = ?auto_787377 ?auto_787379 ) ) ( not ( = ?auto_787377 ?auto_787380 ) ) ( not ( = ?auto_787377 ?auto_787381 ) ) ( not ( = ?auto_787377 ?auto_787382 ) ) ( not ( = ?auto_787377 ?auto_787383 ) ) ( not ( = ?auto_787378 ?auto_787379 ) ) ( not ( = ?auto_787378 ?auto_787380 ) ) ( not ( = ?auto_787378 ?auto_787381 ) ) ( not ( = ?auto_787378 ?auto_787382 ) ) ( not ( = ?auto_787378 ?auto_787383 ) ) ( not ( = ?auto_787379 ?auto_787380 ) ) ( not ( = ?auto_787379 ?auto_787381 ) ) ( not ( = ?auto_787379 ?auto_787382 ) ) ( not ( = ?auto_787379 ?auto_787383 ) ) ( not ( = ?auto_787380 ?auto_787381 ) ) ( not ( = ?auto_787380 ?auto_787382 ) ) ( not ( = ?auto_787380 ?auto_787383 ) ) ( not ( = ?auto_787381 ?auto_787382 ) ) ( not ( = ?auto_787381 ?auto_787383 ) ) ( not ( = ?auto_787382 ?auto_787383 ) ) ( ON ?auto_787381 ?auto_787382 ) ( ON ?auto_787380 ?auto_787381 ) ( ON ?auto_787379 ?auto_787380 ) ( CLEAR ?auto_787377 ) ( ON ?auto_787378 ?auto_787379 ) ( CLEAR ?auto_787378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_787369 ?auto_787370 ?auto_787371 ?auto_787372 ?auto_787373 ?auto_787374 ?auto_787375 ?auto_787376 ?auto_787377 ?auto_787378 )
      ( MAKE-14PILE ?auto_787369 ?auto_787370 ?auto_787371 ?auto_787372 ?auto_787373 ?auto_787374 ?auto_787375 ?auto_787376 ?auto_787377 ?auto_787378 ?auto_787379 ?auto_787380 ?auto_787381 ?auto_787382 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787427 - BLOCK
      ?auto_787428 - BLOCK
      ?auto_787429 - BLOCK
      ?auto_787430 - BLOCK
      ?auto_787431 - BLOCK
      ?auto_787432 - BLOCK
      ?auto_787433 - BLOCK
      ?auto_787434 - BLOCK
      ?auto_787435 - BLOCK
      ?auto_787436 - BLOCK
      ?auto_787437 - BLOCK
      ?auto_787438 - BLOCK
      ?auto_787439 - BLOCK
      ?auto_787440 - BLOCK
    )
    :vars
    (
      ?auto_787441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787440 ?auto_787441 ) ( ON-TABLE ?auto_787427 ) ( ON ?auto_787428 ?auto_787427 ) ( ON ?auto_787429 ?auto_787428 ) ( ON ?auto_787430 ?auto_787429 ) ( ON ?auto_787431 ?auto_787430 ) ( ON ?auto_787432 ?auto_787431 ) ( ON ?auto_787433 ?auto_787432 ) ( ON ?auto_787434 ?auto_787433 ) ( not ( = ?auto_787427 ?auto_787428 ) ) ( not ( = ?auto_787427 ?auto_787429 ) ) ( not ( = ?auto_787427 ?auto_787430 ) ) ( not ( = ?auto_787427 ?auto_787431 ) ) ( not ( = ?auto_787427 ?auto_787432 ) ) ( not ( = ?auto_787427 ?auto_787433 ) ) ( not ( = ?auto_787427 ?auto_787434 ) ) ( not ( = ?auto_787427 ?auto_787435 ) ) ( not ( = ?auto_787427 ?auto_787436 ) ) ( not ( = ?auto_787427 ?auto_787437 ) ) ( not ( = ?auto_787427 ?auto_787438 ) ) ( not ( = ?auto_787427 ?auto_787439 ) ) ( not ( = ?auto_787427 ?auto_787440 ) ) ( not ( = ?auto_787427 ?auto_787441 ) ) ( not ( = ?auto_787428 ?auto_787429 ) ) ( not ( = ?auto_787428 ?auto_787430 ) ) ( not ( = ?auto_787428 ?auto_787431 ) ) ( not ( = ?auto_787428 ?auto_787432 ) ) ( not ( = ?auto_787428 ?auto_787433 ) ) ( not ( = ?auto_787428 ?auto_787434 ) ) ( not ( = ?auto_787428 ?auto_787435 ) ) ( not ( = ?auto_787428 ?auto_787436 ) ) ( not ( = ?auto_787428 ?auto_787437 ) ) ( not ( = ?auto_787428 ?auto_787438 ) ) ( not ( = ?auto_787428 ?auto_787439 ) ) ( not ( = ?auto_787428 ?auto_787440 ) ) ( not ( = ?auto_787428 ?auto_787441 ) ) ( not ( = ?auto_787429 ?auto_787430 ) ) ( not ( = ?auto_787429 ?auto_787431 ) ) ( not ( = ?auto_787429 ?auto_787432 ) ) ( not ( = ?auto_787429 ?auto_787433 ) ) ( not ( = ?auto_787429 ?auto_787434 ) ) ( not ( = ?auto_787429 ?auto_787435 ) ) ( not ( = ?auto_787429 ?auto_787436 ) ) ( not ( = ?auto_787429 ?auto_787437 ) ) ( not ( = ?auto_787429 ?auto_787438 ) ) ( not ( = ?auto_787429 ?auto_787439 ) ) ( not ( = ?auto_787429 ?auto_787440 ) ) ( not ( = ?auto_787429 ?auto_787441 ) ) ( not ( = ?auto_787430 ?auto_787431 ) ) ( not ( = ?auto_787430 ?auto_787432 ) ) ( not ( = ?auto_787430 ?auto_787433 ) ) ( not ( = ?auto_787430 ?auto_787434 ) ) ( not ( = ?auto_787430 ?auto_787435 ) ) ( not ( = ?auto_787430 ?auto_787436 ) ) ( not ( = ?auto_787430 ?auto_787437 ) ) ( not ( = ?auto_787430 ?auto_787438 ) ) ( not ( = ?auto_787430 ?auto_787439 ) ) ( not ( = ?auto_787430 ?auto_787440 ) ) ( not ( = ?auto_787430 ?auto_787441 ) ) ( not ( = ?auto_787431 ?auto_787432 ) ) ( not ( = ?auto_787431 ?auto_787433 ) ) ( not ( = ?auto_787431 ?auto_787434 ) ) ( not ( = ?auto_787431 ?auto_787435 ) ) ( not ( = ?auto_787431 ?auto_787436 ) ) ( not ( = ?auto_787431 ?auto_787437 ) ) ( not ( = ?auto_787431 ?auto_787438 ) ) ( not ( = ?auto_787431 ?auto_787439 ) ) ( not ( = ?auto_787431 ?auto_787440 ) ) ( not ( = ?auto_787431 ?auto_787441 ) ) ( not ( = ?auto_787432 ?auto_787433 ) ) ( not ( = ?auto_787432 ?auto_787434 ) ) ( not ( = ?auto_787432 ?auto_787435 ) ) ( not ( = ?auto_787432 ?auto_787436 ) ) ( not ( = ?auto_787432 ?auto_787437 ) ) ( not ( = ?auto_787432 ?auto_787438 ) ) ( not ( = ?auto_787432 ?auto_787439 ) ) ( not ( = ?auto_787432 ?auto_787440 ) ) ( not ( = ?auto_787432 ?auto_787441 ) ) ( not ( = ?auto_787433 ?auto_787434 ) ) ( not ( = ?auto_787433 ?auto_787435 ) ) ( not ( = ?auto_787433 ?auto_787436 ) ) ( not ( = ?auto_787433 ?auto_787437 ) ) ( not ( = ?auto_787433 ?auto_787438 ) ) ( not ( = ?auto_787433 ?auto_787439 ) ) ( not ( = ?auto_787433 ?auto_787440 ) ) ( not ( = ?auto_787433 ?auto_787441 ) ) ( not ( = ?auto_787434 ?auto_787435 ) ) ( not ( = ?auto_787434 ?auto_787436 ) ) ( not ( = ?auto_787434 ?auto_787437 ) ) ( not ( = ?auto_787434 ?auto_787438 ) ) ( not ( = ?auto_787434 ?auto_787439 ) ) ( not ( = ?auto_787434 ?auto_787440 ) ) ( not ( = ?auto_787434 ?auto_787441 ) ) ( not ( = ?auto_787435 ?auto_787436 ) ) ( not ( = ?auto_787435 ?auto_787437 ) ) ( not ( = ?auto_787435 ?auto_787438 ) ) ( not ( = ?auto_787435 ?auto_787439 ) ) ( not ( = ?auto_787435 ?auto_787440 ) ) ( not ( = ?auto_787435 ?auto_787441 ) ) ( not ( = ?auto_787436 ?auto_787437 ) ) ( not ( = ?auto_787436 ?auto_787438 ) ) ( not ( = ?auto_787436 ?auto_787439 ) ) ( not ( = ?auto_787436 ?auto_787440 ) ) ( not ( = ?auto_787436 ?auto_787441 ) ) ( not ( = ?auto_787437 ?auto_787438 ) ) ( not ( = ?auto_787437 ?auto_787439 ) ) ( not ( = ?auto_787437 ?auto_787440 ) ) ( not ( = ?auto_787437 ?auto_787441 ) ) ( not ( = ?auto_787438 ?auto_787439 ) ) ( not ( = ?auto_787438 ?auto_787440 ) ) ( not ( = ?auto_787438 ?auto_787441 ) ) ( not ( = ?auto_787439 ?auto_787440 ) ) ( not ( = ?auto_787439 ?auto_787441 ) ) ( not ( = ?auto_787440 ?auto_787441 ) ) ( ON ?auto_787439 ?auto_787440 ) ( ON ?auto_787438 ?auto_787439 ) ( ON ?auto_787437 ?auto_787438 ) ( ON ?auto_787436 ?auto_787437 ) ( CLEAR ?auto_787434 ) ( ON ?auto_787435 ?auto_787436 ) ( CLEAR ?auto_787435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_787427 ?auto_787428 ?auto_787429 ?auto_787430 ?auto_787431 ?auto_787432 ?auto_787433 ?auto_787434 ?auto_787435 )
      ( MAKE-14PILE ?auto_787427 ?auto_787428 ?auto_787429 ?auto_787430 ?auto_787431 ?auto_787432 ?auto_787433 ?auto_787434 ?auto_787435 ?auto_787436 ?auto_787437 ?auto_787438 ?auto_787439 ?auto_787440 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787485 - BLOCK
      ?auto_787486 - BLOCK
      ?auto_787487 - BLOCK
      ?auto_787488 - BLOCK
      ?auto_787489 - BLOCK
      ?auto_787490 - BLOCK
      ?auto_787491 - BLOCK
      ?auto_787492 - BLOCK
      ?auto_787493 - BLOCK
      ?auto_787494 - BLOCK
      ?auto_787495 - BLOCK
      ?auto_787496 - BLOCK
      ?auto_787497 - BLOCK
      ?auto_787498 - BLOCK
    )
    :vars
    (
      ?auto_787499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787498 ?auto_787499 ) ( ON-TABLE ?auto_787485 ) ( ON ?auto_787486 ?auto_787485 ) ( ON ?auto_787487 ?auto_787486 ) ( ON ?auto_787488 ?auto_787487 ) ( ON ?auto_787489 ?auto_787488 ) ( ON ?auto_787490 ?auto_787489 ) ( ON ?auto_787491 ?auto_787490 ) ( not ( = ?auto_787485 ?auto_787486 ) ) ( not ( = ?auto_787485 ?auto_787487 ) ) ( not ( = ?auto_787485 ?auto_787488 ) ) ( not ( = ?auto_787485 ?auto_787489 ) ) ( not ( = ?auto_787485 ?auto_787490 ) ) ( not ( = ?auto_787485 ?auto_787491 ) ) ( not ( = ?auto_787485 ?auto_787492 ) ) ( not ( = ?auto_787485 ?auto_787493 ) ) ( not ( = ?auto_787485 ?auto_787494 ) ) ( not ( = ?auto_787485 ?auto_787495 ) ) ( not ( = ?auto_787485 ?auto_787496 ) ) ( not ( = ?auto_787485 ?auto_787497 ) ) ( not ( = ?auto_787485 ?auto_787498 ) ) ( not ( = ?auto_787485 ?auto_787499 ) ) ( not ( = ?auto_787486 ?auto_787487 ) ) ( not ( = ?auto_787486 ?auto_787488 ) ) ( not ( = ?auto_787486 ?auto_787489 ) ) ( not ( = ?auto_787486 ?auto_787490 ) ) ( not ( = ?auto_787486 ?auto_787491 ) ) ( not ( = ?auto_787486 ?auto_787492 ) ) ( not ( = ?auto_787486 ?auto_787493 ) ) ( not ( = ?auto_787486 ?auto_787494 ) ) ( not ( = ?auto_787486 ?auto_787495 ) ) ( not ( = ?auto_787486 ?auto_787496 ) ) ( not ( = ?auto_787486 ?auto_787497 ) ) ( not ( = ?auto_787486 ?auto_787498 ) ) ( not ( = ?auto_787486 ?auto_787499 ) ) ( not ( = ?auto_787487 ?auto_787488 ) ) ( not ( = ?auto_787487 ?auto_787489 ) ) ( not ( = ?auto_787487 ?auto_787490 ) ) ( not ( = ?auto_787487 ?auto_787491 ) ) ( not ( = ?auto_787487 ?auto_787492 ) ) ( not ( = ?auto_787487 ?auto_787493 ) ) ( not ( = ?auto_787487 ?auto_787494 ) ) ( not ( = ?auto_787487 ?auto_787495 ) ) ( not ( = ?auto_787487 ?auto_787496 ) ) ( not ( = ?auto_787487 ?auto_787497 ) ) ( not ( = ?auto_787487 ?auto_787498 ) ) ( not ( = ?auto_787487 ?auto_787499 ) ) ( not ( = ?auto_787488 ?auto_787489 ) ) ( not ( = ?auto_787488 ?auto_787490 ) ) ( not ( = ?auto_787488 ?auto_787491 ) ) ( not ( = ?auto_787488 ?auto_787492 ) ) ( not ( = ?auto_787488 ?auto_787493 ) ) ( not ( = ?auto_787488 ?auto_787494 ) ) ( not ( = ?auto_787488 ?auto_787495 ) ) ( not ( = ?auto_787488 ?auto_787496 ) ) ( not ( = ?auto_787488 ?auto_787497 ) ) ( not ( = ?auto_787488 ?auto_787498 ) ) ( not ( = ?auto_787488 ?auto_787499 ) ) ( not ( = ?auto_787489 ?auto_787490 ) ) ( not ( = ?auto_787489 ?auto_787491 ) ) ( not ( = ?auto_787489 ?auto_787492 ) ) ( not ( = ?auto_787489 ?auto_787493 ) ) ( not ( = ?auto_787489 ?auto_787494 ) ) ( not ( = ?auto_787489 ?auto_787495 ) ) ( not ( = ?auto_787489 ?auto_787496 ) ) ( not ( = ?auto_787489 ?auto_787497 ) ) ( not ( = ?auto_787489 ?auto_787498 ) ) ( not ( = ?auto_787489 ?auto_787499 ) ) ( not ( = ?auto_787490 ?auto_787491 ) ) ( not ( = ?auto_787490 ?auto_787492 ) ) ( not ( = ?auto_787490 ?auto_787493 ) ) ( not ( = ?auto_787490 ?auto_787494 ) ) ( not ( = ?auto_787490 ?auto_787495 ) ) ( not ( = ?auto_787490 ?auto_787496 ) ) ( not ( = ?auto_787490 ?auto_787497 ) ) ( not ( = ?auto_787490 ?auto_787498 ) ) ( not ( = ?auto_787490 ?auto_787499 ) ) ( not ( = ?auto_787491 ?auto_787492 ) ) ( not ( = ?auto_787491 ?auto_787493 ) ) ( not ( = ?auto_787491 ?auto_787494 ) ) ( not ( = ?auto_787491 ?auto_787495 ) ) ( not ( = ?auto_787491 ?auto_787496 ) ) ( not ( = ?auto_787491 ?auto_787497 ) ) ( not ( = ?auto_787491 ?auto_787498 ) ) ( not ( = ?auto_787491 ?auto_787499 ) ) ( not ( = ?auto_787492 ?auto_787493 ) ) ( not ( = ?auto_787492 ?auto_787494 ) ) ( not ( = ?auto_787492 ?auto_787495 ) ) ( not ( = ?auto_787492 ?auto_787496 ) ) ( not ( = ?auto_787492 ?auto_787497 ) ) ( not ( = ?auto_787492 ?auto_787498 ) ) ( not ( = ?auto_787492 ?auto_787499 ) ) ( not ( = ?auto_787493 ?auto_787494 ) ) ( not ( = ?auto_787493 ?auto_787495 ) ) ( not ( = ?auto_787493 ?auto_787496 ) ) ( not ( = ?auto_787493 ?auto_787497 ) ) ( not ( = ?auto_787493 ?auto_787498 ) ) ( not ( = ?auto_787493 ?auto_787499 ) ) ( not ( = ?auto_787494 ?auto_787495 ) ) ( not ( = ?auto_787494 ?auto_787496 ) ) ( not ( = ?auto_787494 ?auto_787497 ) ) ( not ( = ?auto_787494 ?auto_787498 ) ) ( not ( = ?auto_787494 ?auto_787499 ) ) ( not ( = ?auto_787495 ?auto_787496 ) ) ( not ( = ?auto_787495 ?auto_787497 ) ) ( not ( = ?auto_787495 ?auto_787498 ) ) ( not ( = ?auto_787495 ?auto_787499 ) ) ( not ( = ?auto_787496 ?auto_787497 ) ) ( not ( = ?auto_787496 ?auto_787498 ) ) ( not ( = ?auto_787496 ?auto_787499 ) ) ( not ( = ?auto_787497 ?auto_787498 ) ) ( not ( = ?auto_787497 ?auto_787499 ) ) ( not ( = ?auto_787498 ?auto_787499 ) ) ( ON ?auto_787497 ?auto_787498 ) ( ON ?auto_787496 ?auto_787497 ) ( ON ?auto_787495 ?auto_787496 ) ( ON ?auto_787494 ?auto_787495 ) ( ON ?auto_787493 ?auto_787494 ) ( CLEAR ?auto_787491 ) ( ON ?auto_787492 ?auto_787493 ) ( CLEAR ?auto_787492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_787485 ?auto_787486 ?auto_787487 ?auto_787488 ?auto_787489 ?auto_787490 ?auto_787491 ?auto_787492 )
      ( MAKE-14PILE ?auto_787485 ?auto_787486 ?auto_787487 ?auto_787488 ?auto_787489 ?auto_787490 ?auto_787491 ?auto_787492 ?auto_787493 ?auto_787494 ?auto_787495 ?auto_787496 ?auto_787497 ?auto_787498 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787543 - BLOCK
      ?auto_787544 - BLOCK
      ?auto_787545 - BLOCK
      ?auto_787546 - BLOCK
      ?auto_787547 - BLOCK
      ?auto_787548 - BLOCK
      ?auto_787549 - BLOCK
      ?auto_787550 - BLOCK
      ?auto_787551 - BLOCK
      ?auto_787552 - BLOCK
      ?auto_787553 - BLOCK
      ?auto_787554 - BLOCK
      ?auto_787555 - BLOCK
      ?auto_787556 - BLOCK
    )
    :vars
    (
      ?auto_787557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787556 ?auto_787557 ) ( ON-TABLE ?auto_787543 ) ( ON ?auto_787544 ?auto_787543 ) ( ON ?auto_787545 ?auto_787544 ) ( ON ?auto_787546 ?auto_787545 ) ( ON ?auto_787547 ?auto_787546 ) ( ON ?auto_787548 ?auto_787547 ) ( not ( = ?auto_787543 ?auto_787544 ) ) ( not ( = ?auto_787543 ?auto_787545 ) ) ( not ( = ?auto_787543 ?auto_787546 ) ) ( not ( = ?auto_787543 ?auto_787547 ) ) ( not ( = ?auto_787543 ?auto_787548 ) ) ( not ( = ?auto_787543 ?auto_787549 ) ) ( not ( = ?auto_787543 ?auto_787550 ) ) ( not ( = ?auto_787543 ?auto_787551 ) ) ( not ( = ?auto_787543 ?auto_787552 ) ) ( not ( = ?auto_787543 ?auto_787553 ) ) ( not ( = ?auto_787543 ?auto_787554 ) ) ( not ( = ?auto_787543 ?auto_787555 ) ) ( not ( = ?auto_787543 ?auto_787556 ) ) ( not ( = ?auto_787543 ?auto_787557 ) ) ( not ( = ?auto_787544 ?auto_787545 ) ) ( not ( = ?auto_787544 ?auto_787546 ) ) ( not ( = ?auto_787544 ?auto_787547 ) ) ( not ( = ?auto_787544 ?auto_787548 ) ) ( not ( = ?auto_787544 ?auto_787549 ) ) ( not ( = ?auto_787544 ?auto_787550 ) ) ( not ( = ?auto_787544 ?auto_787551 ) ) ( not ( = ?auto_787544 ?auto_787552 ) ) ( not ( = ?auto_787544 ?auto_787553 ) ) ( not ( = ?auto_787544 ?auto_787554 ) ) ( not ( = ?auto_787544 ?auto_787555 ) ) ( not ( = ?auto_787544 ?auto_787556 ) ) ( not ( = ?auto_787544 ?auto_787557 ) ) ( not ( = ?auto_787545 ?auto_787546 ) ) ( not ( = ?auto_787545 ?auto_787547 ) ) ( not ( = ?auto_787545 ?auto_787548 ) ) ( not ( = ?auto_787545 ?auto_787549 ) ) ( not ( = ?auto_787545 ?auto_787550 ) ) ( not ( = ?auto_787545 ?auto_787551 ) ) ( not ( = ?auto_787545 ?auto_787552 ) ) ( not ( = ?auto_787545 ?auto_787553 ) ) ( not ( = ?auto_787545 ?auto_787554 ) ) ( not ( = ?auto_787545 ?auto_787555 ) ) ( not ( = ?auto_787545 ?auto_787556 ) ) ( not ( = ?auto_787545 ?auto_787557 ) ) ( not ( = ?auto_787546 ?auto_787547 ) ) ( not ( = ?auto_787546 ?auto_787548 ) ) ( not ( = ?auto_787546 ?auto_787549 ) ) ( not ( = ?auto_787546 ?auto_787550 ) ) ( not ( = ?auto_787546 ?auto_787551 ) ) ( not ( = ?auto_787546 ?auto_787552 ) ) ( not ( = ?auto_787546 ?auto_787553 ) ) ( not ( = ?auto_787546 ?auto_787554 ) ) ( not ( = ?auto_787546 ?auto_787555 ) ) ( not ( = ?auto_787546 ?auto_787556 ) ) ( not ( = ?auto_787546 ?auto_787557 ) ) ( not ( = ?auto_787547 ?auto_787548 ) ) ( not ( = ?auto_787547 ?auto_787549 ) ) ( not ( = ?auto_787547 ?auto_787550 ) ) ( not ( = ?auto_787547 ?auto_787551 ) ) ( not ( = ?auto_787547 ?auto_787552 ) ) ( not ( = ?auto_787547 ?auto_787553 ) ) ( not ( = ?auto_787547 ?auto_787554 ) ) ( not ( = ?auto_787547 ?auto_787555 ) ) ( not ( = ?auto_787547 ?auto_787556 ) ) ( not ( = ?auto_787547 ?auto_787557 ) ) ( not ( = ?auto_787548 ?auto_787549 ) ) ( not ( = ?auto_787548 ?auto_787550 ) ) ( not ( = ?auto_787548 ?auto_787551 ) ) ( not ( = ?auto_787548 ?auto_787552 ) ) ( not ( = ?auto_787548 ?auto_787553 ) ) ( not ( = ?auto_787548 ?auto_787554 ) ) ( not ( = ?auto_787548 ?auto_787555 ) ) ( not ( = ?auto_787548 ?auto_787556 ) ) ( not ( = ?auto_787548 ?auto_787557 ) ) ( not ( = ?auto_787549 ?auto_787550 ) ) ( not ( = ?auto_787549 ?auto_787551 ) ) ( not ( = ?auto_787549 ?auto_787552 ) ) ( not ( = ?auto_787549 ?auto_787553 ) ) ( not ( = ?auto_787549 ?auto_787554 ) ) ( not ( = ?auto_787549 ?auto_787555 ) ) ( not ( = ?auto_787549 ?auto_787556 ) ) ( not ( = ?auto_787549 ?auto_787557 ) ) ( not ( = ?auto_787550 ?auto_787551 ) ) ( not ( = ?auto_787550 ?auto_787552 ) ) ( not ( = ?auto_787550 ?auto_787553 ) ) ( not ( = ?auto_787550 ?auto_787554 ) ) ( not ( = ?auto_787550 ?auto_787555 ) ) ( not ( = ?auto_787550 ?auto_787556 ) ) ( not ( = ?auto_787550 ?auto_787557 ) ) ( not ( = ?auto_787551 ?auto_787552 ) ) ( not ( = ?auto_787551 ?auto_787553 ) ) ( not ( = ?auto_787551 ?auto_787554 ) ) ( not ( = ?auto_787551 ?auto_787555 ) ) ( not ( = ?auto_787551 ?auto_787556 ) ) ( not ( = ?auto_787551 ?auto_787557 ) ) ( not ( = ?auto_787552 ?auto_787553 ) ) ( not ( = ?auto_787552 ?auto_787554 ) ) ( not ( = ?auto_787552 ?auto_787555 ) ) ( not ( = ?auto_787552 ?auto_787556 ) ) ( not ( = ?auto_787552 ?auto_787557 ) ) ( not ( = ?auto_787553 ?auto_787554 ) ) ( not ( = ?auto_787553 ?auto_787555 ) ) ( not ( = ?auto_787553 ?auto_787556 ) ) ( not ( = ?auto_787553 ?auto_787557 ) ) ( not ( = ?auto_787554 ?auto_787555 ) ) ( not ( = ?auto_787554 ?auto_787556 ) ) ( not ( = ?auto_787554 ?auto_787557 ) ) ( not ( = ?auto_787555 ?auto_787556 ) ) ( not ( = ?auto_787555 ?auto_787557 ) ) ( not ( = ?auto_787556 ?auto_787557 ) ) ( ON ?auto_787555 ?auto_787556 ) ( ON ?auto_787554 ?auto_787555 ) ( ON ?auto_787553 ?auto_787554 ) ( ON ?auto_787552 ?auto_787553 ) ( ON ?auto_787551 ?auto_787552 ) ( ON ?auto_787550 ?auto_787551 ) ( CLEAR ?auto_787548 ) ( ON ?auto_787549 ?auto_787550 ) ( CLEAR ?auto_787549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_787543 ?auto_787544 ?auto_787545 ?auto_787546 ?auto_787547 ?auto_787548 ?auto_787549 )
      ( MAKE-14PILE ?auto_787543 ?auto_787544 ?auto_787545 ?auto_787546 ?auto_787547 ?auto_787548 ?auto_787549 ?auto_787550 ?auto_787551 ?auto_787552 ?auto_787553 ?auto_787554 ?auto_787555 ?auto_787556 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787601 - BLOCK
      ?auto_787602 - BLOCK
      ?auto_787603 - BLOCK
      ?auto_787604 - BLOCK
      ?auto_787605 - BLOCK
      ?auto_787606 - BLOCK
      ?auto_787607 - BLOCK
      ?auto_787608 - BLOCK
      ?auto_787609 - BLOCK
      ?auto_787610 - BLOCK
      ?auto_787611 - BLOCK
      ?auto_787612 - BLOCK
      ?auto_787613 - BLOCK
      ?auto_787614 - BLOCK
    )
    :vars
    (
      ?auto_787615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787614 ?auto_787615 ) ( ON-TABLE ?auto_787601 ) ( ON ?auto_787602 ?auto_787601 ) ( ON ?auto_787603 ?auto_787602 ) ( ON ?auto_787604 ?auto_787603 ) ( ON ?auto_787605 ?auto_787604 ) ( not ( = ?auto_787601 ?auto_787602 ) ) ( not ( = ?auto_787601 ?auto_787603 ) ) ( not ( = ?auto_787601 ?auto_787604 ) ) ( not ( = ?auto_787601 ?auto_787605 ) ) ( not ( = ?auto_787601 ?auto_787606 ) ) ( not ( = ?auto_787601 ?auto_787607 ) ) ( not ( = ?auto_787601 ?auto_787608 ) ) ( not ( = ?auto_787601 ?auto_787609 ) ) ( not ( = ?auto_787601 ?auto_787610 ) ) ( not ( = ?auto_787601 ?auto_787611 ) ) ( not ( = ?auto_787601 ?auto_787612 ) ) ( not ( = ?auto_787601 ?auto_787613 ) ) ( not ( = ?auto_787601 ?auto_787614 ) ) ( not ( = ?auto_787601 ?auto_787615 ) ) ( not ( = ?auto_787602 ?auto_787603 ) ) ( not ( = ?auto_787602 ?auto_787604 ) ) ( not ( = ?auto_787602 ?auto_787605 ) ) ( not ( = ?auto_787602 ?auto_787606 ) ) ( not ( = ?auto_787602 ?auto_787607 ) ) ( not ( = ?auto_787602 ?auto_787608 ) ) ( not ( = ?auto_787602 ?auto_787609 ) ) ( not ( = ?auto_787602 ?auto_787610 ) ) ( not ( = ?auto_787602 ?auto_787611 ) ) ( not ( = ?auto_787602 ?auto_787612 ) ) ( not ( = ?auto_787602 ?auto_787613 ) ) ( not ( = ?auto_787602 ?auto_787614 ) ) ( not ( = ?auto_787602 ?auto_787615 ) ) ( not ( = ?auto_787603 ?auto_787604 ) ) ( not ( = ?auto_787603 ?auto_787605 ) ) ( not ( = ?auto_787603 ?auto_787606 ) ) ( not ( = ?auto_787603 ?auto_787607 ) ) ( not ( = ?auto_787603 ?auto_787608 ) ) ( not ( = ?auto_787603 ?auto_787609 ) ) ( not ( = ?auto_787603 ?auto_787610 ) ) ( not ( = ?auto_787603 ?auto_787611 ) ) ( not ( = ?auto_787603 ?auto_787612 ) ) ( not ( = ?auto_787603 ?auto_787613 ) ) ( not ( = ?auto_787603 ?auto_787614 ) ) ( not ( = ?auto_787603 ?auto_787615 ) ) ( not ( = ?auto_787604 ?auto_787605 ) ) ( not ( = ?auto_787604 ?auto_787606 ) ) ( not ( = ?auto_787604 ?auto_787607 ) ) ( not ( = ?auto_787604 ?auto_787608 ) ) ( not ( = ?auto_787604 ?auto_787609 ) ) ( not ( = ?auto_787604 ?auto_787610 ) ) ( not ( = ?auto_787604 ?auto_787611 ) ) ( not ( = ?auto_787604 ?auto_787612 ) ) ( not ( = ?auto_787604 ?auto_787613 ) ) ( not ( = ?auto_787604 ?auto_787614 ) ) ( not ( = ?auto_787604 ?auto_787615 ) ) ( not ( = ?auto_787605 ?auto_787606 ) ) ( not ( = ?auto_787605 ?auto_787607 ) ) ( not ( = ?auto_787605 ?auto_787608 ) ) ( not ( = ?auto_787605 ?auto_787609 ) ) ( not ( = ?auto_787605 ?auto_787610 ) ) ( not ( = ?auto_787605 ?auto_787611 ) ) ( not ( = ?auto_787605 ?auto_787612 ) ) ( not ( = ?auto_787605 ?auto_787613 ) ) ( not ( = ?auto_787605 ?auto_787614 ) ) ( not ( = ?auto_787605 ?auto_787615 ) ) ( not ( = ?auto_787606 ?auto_787607 ) ) ( not ( = ?auto_787606 ?auto_787608 ) ) ( not ( = ?auto_787606 ?auto_787609 ) ) ( not ( = ?auto_787606 ?auto_787610 ) ) ( not ( = ?auto_787606 ?auto_787611 ) ) ( not ( = ?auto_787606 ?auto_787612 ) ) ( not ( = ?auto_787606 ?auto_787613 ) ) ( not ( = ?auto_787606 ?auto_787614 ) ) ( not ( = ?auto_787606 ?auto_787615 ) ) ( not ( = ?auto_787607 ?auto_787608 ) ) ( not ( = ?auto_787607 ?auto_787609 ) ) ( not ( = ?auto_787607 ?auto_787610 ) ) ( not ( = ?auto_787607 ?auto_787611 ) ) ( not ( = ?auto_787607 ?auto_787612 ) ) ( not ( = ?auto_787607 ?auto_787613 ) ) ( not ( = ?auto_787607 ?auto_787614 ) ) ( not ( = ?auto_787607 ?auto_787615 ) ) ( not ( = ?auto_787608 ?auto_787609 ) ) ( not ( = ?auto_787608 ?auto_787610 ) ) ( not ( = ?auto_787608 ?auto_787611 ) ) ( not ( = ?auto_787608 ?auto_787612 ) ) ( not ( = ?auto_787608 ?auto_787613 ) ) ( not ( = ?auto_787608 ?auto_787614 ) ) ( not ( = ?auto_787608 ?auto_787615 ) ) ( not ( = ?auto_787609 ?auto_787610 ) ) ( not ( = ?auto_787609 ?auto_787611 ) ) ( not ( = ?auto_787609 ?auto_787612 ) ) ( not ( = ?auto_787609 ?auto_787613 ) ) ( not ( = ?auto_787609 ?auto_787614 ) ) ( not ( = ?auto_787609 ?auto_787615 ) ) ( not ( = ?auto_787610 ?auto_787611 ) ) ( not ( = ?auto_787610 ?auto_787612 ) ) ( not ( = ?auto_787610 ?auto_787613 ) ) ( not ( = ?auto_787610 ?auto_787614 ) ) ( not ( = ?auto_787610 ?auto_787615 ) ) ( not ( = ?auto_787611 ?auto_787612 ) ) ( not ( = ?auto_787611 ?auto_787613 ) ) ( not ( = ?auto_787611 ?auto_787614 ) ) ( not ( = ?auto_787611 ?auto_787615 ) ) ( not ( = ?auto_787612 ?auto_787613 ) ) ( not ( = ?auto_787612 ?auto_787614 ) ) ( not ( = ?auto_787612 ?auto_787615 ) ) ( not ( = ?auto_787613 ?auto_787614 ) ) ( not ( = ?auto_787613 ?auto_787615 ) ) ( not ( = ?auto_787614 ?auto_787615 ) ) ( ON ?auto_787613 ?auto_787614 ) ( ON ?auto_787612 ?auto_787613 ) ( ON ?auto_787611 ?auto_787612 ) ( ON ?auto_787610 ?auto_787611 ) ( ON ?auto_787609 ?auto_787610 ) ( ON ?auto_787608 ?auto_787609 ) ( ON ?auto_787607 ?auto_787608 ) ( CLEAR ?auto_787605 ) ( ON ?auto_787606 ?auto_787607 ) ( CLEAR ?auto_787606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_787601 ?auto_787602 ?auto_787603 ?auto_787604 ?auto_787605 ?auto_787606 )
      ( MAKE-14PILE ?auto_787601 ?auto_787602 ?auto_787603 ?auto_787604 ?auto_787605 ?auto_787606 ?auto_787607 ?auto_787608 ?auto_787609 ?auto_787610 ?auto_787611 ?auto_787612 ?auto_787613 ?auto_787614 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787659 - BLOCK
      ?auto_787660 - BLOCK
      ?auto_787661 - BLOCK
      ?auto_787662 - BLOCK
      ?auto_787663 - BLOCK
      ?auto_787664 - BLOCK
      ?auto_787665 - BLOCK
      ?auto_787666 - BLOCK
      ?auto_787667 - BLOCK
      ?auto_787668 - BLOCK
      ?auto_787669 - BLOCK
      ?auto_787670 - BLOCK
      ?auto_787671 - BLOCK
      ?auto_787672 - BLOCK
    )
    :vars
    (
      ?auto_787673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787672 ?auto_787673 ) ( ON-TABLE ?auto_787659 ) ( ON ?auto_787660 ?auto_787659 ) ( ON ?auto_787661 ?auto_787660 ) ( ON ?auto_787662 ?auto_787661 ) ( not ( = ?auto_787659 ?auto_787660 ) ) ( not ( = ?auto_787659 ?auto_787661 ) ) ( not ( = ?auto_787659 ?auto_787662 ) ) ( not ( = ?auto_787659 ?auto_787663 ) ) ( not ( = ?auto_787659 ?auto_787664 ) ) ( not ( = ?auto_787659 ?auto_787665 ) ) ( not ( = ?auto_787659 ?auto_787666 ) ) ( not ( = ?auto_787659 ?auto_787667 ) ) ( not ( = ?auto_787659 ?auto_787668 ) ) ( not ( = ?auto_787659 ?auto_787669 ) ) ( not ( = ?auto_787659 ?auto_787670 ) ) ( not ( = ?auto_787659 ?auto_787671 ) ) ( not ( = ?auto_787659 ?auto_787672 ) ) ( not ( = ?auto_787659 ?auto_787673 ) ) ( not ( = ?auto_787660 ?auto_787661 ) ) ( not ( = ?auto_787660 ?auto_787662 ) ) ( not ( = ?auto_787660 ?auto_787663 ) ) ( not ( = ?auto_787660 ?auto_787664 ) ) ( not ( = ?auto_787660 ?auto_787665 ) ) ( not ( = ?auto_787660 ?auto_787666 ) ) ( not ( = ?auto_787660 ?auto_787667 ) ) ( not ( = ?auto_787660 ?auto_787668 ) ) ( not ( = ?auto_787660 ?auto_787669 ) ) ( not ( = ?auto_787660 ?auto_787670 ) ) ( not ( = ?auto_787660 ?auto_787671 ) ) ( not ( = ?auto_787660 ?auto_787672 ) ) ( not ( = ?auto_787660 ?auto_787673 ) ) ( not ( = ?auto_787661 ?auto_787662 ) ) ( not ( = ?auto_787661 ?auto_787663 ) ) ( not ( = ?auto_787661 ?auto_787664 ) ) ( not ( = ?auto_787661 ?auto_787665 ) ) ( not ( = ?auto_787661 ?auto_787666 ) ) ( not ( = ?auto_787661 ?auto_787667 ) ) ( not ( = ?auto_787661 ?auto_787668 ) ) ( not ( = ?auto_787661 ?auto_787669 ) ) ( not ( = ?auto_787661 ?auto_787670 ) ) ( not ( = ?auto_787661 ?auto_787671 ) ) ( not ( = ?auto_787661 ?auto_787672 ) ) ( not ( = ?auto_787661 ?auto_787673 ) ) ( not ( = ?auto_787662 ?auto_787663 ) ) ( not ( = ?auto_787662 ?auto_787664 ) ) ( not ( = ?auto_787662 ?auto_787665 ) ) ( not ( = ?auto_787662 ?auto_787666 ) ) ( not ( = ?auto_787662 ?auto_787667 ) ) ( not ( = ?auto_787662 ?auto_787668 ) ) ( not ( = ?auto_787662 ?auto_787669 ) ) ( not ( = ?auto_787662 ?auto_787670 ) ) ( not ( = ?auto_787662 ?auto_787671 ) ) ( not ( = ?auto_787662 ?auto_787672 ) ) ( not ( = ?auto_787662 ?auto_787673 ) ) ( not ( = ?auto_787663 ?auto_787664 ) ) ( not ( = ?auto_787663 ?auto_787665 ) ) ( not ( = ?auto_787663 ?auto_787666 ) ) ( not ( = ?auto_787663 ?auto_787667 ) ) ( not ( = ?auto_787663 ?auto_787668 ) ) ( not ( = ?auto_787663 ?auto_787669 ) ) ( not ( = ?auto_787663 ?auto_787670 ) ) ( not ( = ?auto_787663 ?auto_787671 ) ) ( not ( = ?auto_787663 ?auto_787672 ) ) ( not ( = ?auto_787663 ?auto_787673 ) ) ( not ( = ?auto_787664 ?auto_787665 ) ) ( not ( = ?auto_787664 ?auto_787666 ) ) ( not ( = ?auto_787664 ?auto_787667 ) ) ( not ( = ?auto_787664 ?auto_787668 ) ) ( not ( = ?auto_787664 ?auto_787669 ) ) ( not ( = ?auto_787664 ?auto_787670 ) ) ( not ( = ?auto_787664 ?auto_787671 ) ) ( not ( = ?auto_787664 ?auto_787672 ) ) ( not ( = ?auto_787664 ?auto_787673 ) ) ( not ( = ?auto_787665 ?auto_787666 ) ) ( not ( = ?auto_787665 ?auto_787667 ) ) ( not ( = ?auto_787665 ?auto_787668 ) ) ( not ( = ?auto_787665 ?auto_787669 ) ) ( not ( = ?auto_787665 ?auto_787670 ) ) ( not ( = ?auto_787665 ?auto_787671 ) ) ( not ( = ?auto_787665 ?auto_787672 ) ) ( not ( = ?auto_787665 ?auto_787673 ) ) ( not ( = ?auto_787666 ?auto_787667 ) ) ( not ( = ?auto_787666 ?auto_787668 ) ) ( not ( = ?auto_787666 ?auto_787669 ) ) ( not ( = ?auto_787666 ?auto_787670 ) ) ( not ( = ?auto_787666 ?auto_787671 ) ) ( not ( = ?auto_787666 ?auto_787672 ) ) ( not ( = ?auto_787666 ?auto_787673 ) ) ( not ( = ?auto_787667 ?auto_787668 ) ) ( not ( = ?auto_787667 ?auto_787669 ) ) ( not ( = ?auto_787667 ?auto_787670 ) ) ( not ( = ?auto_787667 ?auto_787671 ) ) ( not ( = ?auto_787667 ?auto_787672 ) ) ( not ( = ?auto_787667 ?auto_787673 ) ) ( not ( = ?auto_787668 ?auto_787669 ) ) ( not ( = ?auto_787668 ?auto_787670 ) ) ( not ( = ?auto_787668 ?auto_787671 ) ) ( not ( = ?auto_787668 ?auto_787672 ) ) ( not ( = ?auto_787668 ?auto_787673 ) ) ( not ( = ?auto_787669 ?auto_787670 ) ) ( not ( = ?auto_787669 ?auto_787671 ) ) ( not ( = ?auto_787669 ?auto_787672 ) ) ( not ( = ?auto_787669 ?auto_787673 ) ) ( not ( = ?auto_787670 ?auto_787671 ) ) ( not ( = ?auto_787670 ?auto_787672 ) ) ( not ( = ?auto_787670 ?auto_787673 ) ) ( not ( = ?auto_787671 ?auto_787672 ) ) ( not ( = ?auto_787671 ?auto_787673 ) ) ( not ( = ?auto_787672 ?auto_787673 ) ) ( ON ?auto_787671 ?auto_787672 ) ( ON ?auto_787670 ?auto_787671 ) ( ON ?auto_787669 ?auto_787670 ) ( ON ?auto_787668 ?auto_787669 ) ( ON ?auto_787667 ?auto_787668 ) ( ON ?auto_787666 ?auto_787667 ) ( ON ?auto_787665 ?auto_787666 ) ( ON ?auto_787664 ?auto_787665 ) ( CLEAR ?auto_787662 ) ( ON ?auto_787663 ?auto_787664 ) ( CLEAR ?auto_787663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_787659 ?auto_787660 ?auto_787661 ?auto_787662 ?auto_787663 )
      ( MAKE-14PILE ?auto_787659 ?auto_787660 ?auto_787661 ?auto_787662 ?auto_787663 ?auto_787664 ?auto_787665 ?auto_787666 ?auto_787667 ?auto_787668 ?auto_787669 ?auto_787670 ?auto_787671 ?auto_787672 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787717 - BLOCK
      ?auto_787718 - BLOCK
      ?auto_787719 - BLOCK
      ?auto_787720 - BLOCK
      ?auto_787721 - BLOCK
      ?auto_787722 - BLOCK
      ?auto_787723 - BLOCK
      ?auto_787724 - BLOCK
      ?auto_787725 - BLOCK
      ?auto_787726 - BLOCK
      ?auto_787727 - BLOCK
      ?auto_787728 - BLOCK
      ?auto_787729 - BLOCK
      ?auto_787730 - BLOCK
    )
    :vars
    (
      ?auto_787731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787730 ?auto_787731 ) ( ON-TABLE ?auto_787717 ) ( ON ?auto_787718 ?auto_787717 ) ( ON ?auto_787719 ?auto_787718 ) ( not ( = ?auto_787717 ?auto_787718 ) ) ( not ( = ?auto_787717 ?auto_787719 ) ) ( not ( = ?auto_787717 ?auto_787720 ) ) ( not ( = ?auto_787717 ?auto_787721 ) ) ( not ( = ?auto_787717 ?auto_787722 ) ) ( not ( = ?auto_787717 ?auto_787723 ) ) ( not ( = ?auto_787717 ?auto_787724 ) ) ( not ( = ?auto_787717 ?auto_787725 ) ) ( not ( = ?auto_787717 ?auto_787726 ) ) ( not ( = ?auto_787717 ?auto_787727 ) ) ( not ( = ?auto_787717 ?auto_787728 ) ) ( not ( = ?auto_787717 ?auto_787729 ) ) ( not ( = ?auto_787717 ?auto_787730 ) ) ( not ( = ?auto_787717 ?auto_787731 ) ) ( not ( = ?auto_787718 ?auto_787719 ) ) ( not ( = ?auto_787718 ?auto_787720 ) ) ( not ( = ?auto_787718 ?auto_787721 ) ) ( not ( = ?auto_787718 ?auto_787722 ) ) ( not ( = ?auto_787718 ?auto_787723 ) ) ( not ( = ?auto_787718 ?auto_787724 ) ) ( not ( = ?auto_787718 ?auto_787725 ) ) ( not ( = ?auto_787718 ?auto_787726 ) ) ( not ( = ?auto_787718 ?auto_787727 ) ) ( not ( = ?auto_787718 ?auto_787728 ) ) ( not ( = ?auto_787718 ?auto_787729 ) ) ( not ( = ?auto_787718 ?auto_787730 ) ) ( not ( = ?auto_787718 ?auto_787731 ) ) ( not ( = ?auto_787719 ?auto_787720 ) ) ( not ( = ?auto_787719 ?auto_787721 ) ) ( not ( = ?auto_787719 ?auto_787722 ) ) ( not ( = ?auto_787719 ?auto_787723 ) ) ( not ( = ?auto_787719 ?auto_787724 ) ) ( not ( = ?auto_787719 ?auto_787725 ) ) ( not ( = ?auto_787719 ?auto_787726 ) ) ( not ( = ?auto_787719 ?auto_787727 ) ) ( not ( = ?auto_787719 ?auto_787728 ) ) ( not ( = ?auto_787719 ?auto_787729 ) ) ( not ( = ?auto_787719 ?auto_787730 ) ) ( not ( = ?auto_787719 ?auto_787731 ) ) ( not ( = ?auto_787720 ?auto_787721 ) ) ( not ( = ?auto_787720 ?auto_787722 ) ) ( not ( = ?auto_787720 ?auto_787723 ) ) ( not ( = ?auto_787720 ?auto_787724 ) ) ( not ( = ?auto_787720 ?auto_787725 ) ) ( not ( = ?auto_787720 ?auto_787726 ) ) ( not ( = ?auto_787720 ?auto_787727 ) ) ( not ( = ?auto_787720 ?auto_787728 ) ) ( not ( = ?auto_787720 ?auto_787729 ) ) ( not ( = ?auto_787720 ?auto_787730 ) ) ( not ( = ?auto_787720 ?auto_787731 ) ) ( not ( = ?auto_787721 ?auto_787722 ) ) ( not ( = ?auto_787721 ?auto_787723 ) ) ( not ( = ?auto_787721 ?auto_787724 ) ) ( not ( = ?auto_787721 ?auto_787725 ) ) ( not ( = ?auto_787721 ?auto_787726 ) ) ( not ( = ?auto_787721 ?auto_787727 ) ) ( not ( = ?auto_787721 ?auto_787728 ) ) ( not ( = ?auto_787721 ?auto_787729 ) ) ( not ( = ?auto_787721 ?auto_787730 ) ) ( not ( = ?auto_787721 ?auto_787731 ) ) ( not ( = ?auto_787722 ?auto_787723 ) ) ( not ( = ?auto_787722 ?auto_787724 ) ) ( not ( = ?auto_787722 ?auto_787725 ) ) ( not ( = ?auto_787722 ?auto_787726 ) ) ( not ( = ?auto_787722 ?auto_787727 ) ) ( not ( = ?auto_787722 ?auto_787728 ) ) ( not ( = ?auto_787722 ?auto_787729 ) ) ( not ( = ?auto_787722 ?auto_787730 ) ) ( not ( = ?auto_787722 ?auto_787731 ) ) ( not ( = ?auto_787723 ?auto_787724 ) ) ( not ( = ?auto_787723 ?auto_787725 ) ) ( not ( = ?auto_787723 ?auto_787726 ) ) ( not ( = ?auto_787723 ?auto_787727 ) ) ( not ( = ?auto_787723 ?auto_787728 ) ) ( not ( = ?auto_787723 ?auto_787729 ) ) ( not ( = ?auto_787723 ?auto_787730 ) ) ( not ( = ?auto_787723 ?auto_787731 ) ) ( not ( = ?auto_787724 ?auto_787725 ) ) ( not ( = ?auto_787724 ?auto_787726 ) ) ( not ( = ?auto_787724 ?auto_787727 ) ) ( not ( = ?auto_787724 ?auto_787728 ) ) ( not ( = ?auto_787724 ?auto_787729 ) ) ( not ( = ?auto_787724 ?auto_787730 ) ) ( not ( = ?auto_787724 ?auto_787731 ) ) ( not ( = ?auto_787725 ?auto_787726 ) ) ( not ( = ?auto_787725 ?auto_787727 ) ) ( not ( = ?auto_787725 ?auto_787728 ) ) ( not ( = ?auto_787725 ?auto_787729 ) ) ( not ( = ?auto_787725 ?auto_787730 ) ) ( not ( = ?auto_787725 ?auto_787731 ) ) ( not ( = ?auto_787726 ?auto_787727 ) ) ( not ( = ?auto_787726 ?auto_787728 ) ) ( not ( = ?auto_787726 ?auto_787729 ) ) ( not ( = ?auto_787726 ?auto_787730 ) ) ( not ( = ?auto_787726 ?auto_787731 ) ) ( not ( = ?auto_787727 ?auto_787728 ) ) ( not ( = ?auto_787727 ?auto_787729 ) ) ( not ( = ?auto_787727 ?auto_787730 ) ) ( not ( = ?auto_787727 ?auto_787731 ) ) ( not ( = ?auto_787728 ?auto_787729 ) ) ( not ( = ?auto_787728 ?auto_787730 ) ) ( not ( = ?auto_787728 ?auto_787731 ) ) ( not ( = ?auto_787729 ?auto_787730 ) ) ( not ( = ?auto_787729 ?auto_787731 ) ) ( not ( = ?auto_787730 ?auto_787731 ) ) ( ON ?auto_787729 ?auto_787730 ) ( ON ?auto_787728 ?auto_787729 ) ( ON ?auto_787727 ?auto_787728 ) ( ON ?auto_787726 ?auto_787727 ) ( ON ?auto_787725 ?auto_787726 ) ( ON ?auto_787724 ?auto_787725 ) ( ON ?auto_787723 ?auto_787724 ) ( ON ?auto_787722 ?auto_787723 ) ( ON ?auto_787721 ?auto_787722 ) ( CLEAR ?auto_787719 ) ( ON ?auto_787720 ?auto_787721 ) ( CLEAR ?auto_787720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_787717 ?auto_787718 ?auto_787719 ?auto_787720 )
      ( MAKE-14PILE ?auto_787717 ?auto_787718 ?auto_787719 ?auto_787720 ?auto_787721 ?auto_787722 ?auto_787723 ?auto_787724 ?auto_787725 ?auto_787726 ?auto_787727 ?auto_787728 ?auto_787729 ?auto_787730 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787775 - BLOCK
      ?auto_787776 - BLOCK
      ?auto_787777 - BLOCK
      ?auto_787778 - BLOCK
      ?auto_787779 - BLOCK
      ?auto_787780 - BLOCK
      ?auto_787781 - BLOCK
      ?auto_787782 - BLOCK
      ?auto_787783 - BLOCK
      ?auto_787784 - BLOCK
      ?auto_787785 - BLOCK
      ?auto_787786 - BLOCK
      ?auto_787787 - BLOCK
      ?auto_787788 - BLOCK
    )
    :vars
    (
      ?auto_787789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787788 ?auto_787789 ) ( ON-TABLE ?auto_787775 ) ( ON ?auto_787776 ?auto_787775 ) ( not ( = ?auto_787775 ?auto_787776 ) ) ( not ( = ?auto_787775 ?auto_787777 ) ) ( not ( = ?auto_787775 ?auto_787778 ) ) ( not ( = ?auto_787775 ?auto_787779 ) ) ( not ( = ?auto_787775 ?auto_787780 ) ) ( not ( = ?auto_787775 ?auto_787781 ) ) ( not ( = ?auto_787775 ?auto_787782 ) ) ( not ( = ?auto_787775 ?auto_787783 ) ) ( not ( = ?auto_787775 ?auto_787784 ) ) ( not ( = ?auto_787775 ?auto_787785 ) ) ( not ( = ?auto_787775 ?auto_787786 ) ) ( not ( = ?auto_787775 ?auto_787787 ) ) ( not ( = ?auto_787775 ?auto_787788 ) ) ( not ( = ?auto_787775 ?auto_787789 ) ) ( not ( = ?auto_787776 ?auto_787777 ) ) ( not ( = ?auto_787776 ?auto_787778 ) ) ( not ( = ?auto_787776 ?auto_787779 ) ) ( not ( = ?auto_787776 ?auto_787780 ) ) ( not ( = ?auto_787776 ?auto_787781 ) ) ( not ( = ?auto_787776 ?auto_787782 ) ) ( not ( = ?auto_787776 ?auto_787783 ) ) ( not ( = ?auto_787776 ?auto_787784 ) ) ( not ( = ?auto_787776 ?auto_787785 ) ) ( not ( = ?auto_787776 ?auto_787786 ) ) ( not ( = ?auto_787776 ?auto_787787 ) ) ( not ( = ?auto_787776 ?auto_787788 ) ) ( not ( = ?auto_787776 ?auto_787789 ) ) ( not ( = ?auto_787777 ?auto_787778 ) ) ( not ( = ?auto_787777 ?auto_787779 ) ) ( not ( = ?auto_787777 ?auto_787780 ) ) ( not ( = ?auto_787777 ?auto_787781 ) ) ( not ( = ?auto_787777 ?auto_787782 ) ) ( not ( = ?auto_787777 ?auto_787783 ) ) ( not ( = ?auto_787777 ?auto_787784 ) ) ( not ( = ?auto_787777 ?auto_787785 ) ) ( not ( = ?auto_787777 ?auto_787786 ) ) ( not ( = ?auto_787777 ?auto_787787 ) ) ( not ( = ?auto_787777 ?auto_787788 ) ) ( not ( = ?auto_787777 ?auto_787789 ) ) ( not ( = ?auto_787778 ?auto_787779 ) ) ( not ( = ?auto_787778 ?auto_787780 ) ) ( not ( = ?auto_787778 ?auto_787781 ) ) ( not ( = ?auto_787778 ?auto_787782 ) ) ( not ( = ?auto_787778 ?auto_787783 ) ) ( not ( = ?auto_787778 ?auto_787784 ) ) ( not ( = ?auto_787778 ?auto_787785 ) ) ( not ( = ?auto_787778 ?auto_787786 ) ) ( not ( = ?auto_787778 ?auto_787787 ) ) ( not ( = ?auto_787778 ?auto_787788 ) ) ( not ( = ?auto_787778 ?auto_787789 ) ) ( not ( = ?auto_787779 ?auto_787780 ) ) ( not ( = ?auto_787779 ?auto_787781 ) ) ( not ( = ?auto_787779 ?auto_787782 ) ) ( not ( = ?auto_787779 ?auto_787783 ) ) ( not ( = ?auto_787779 ?auto_787784 ) ) ( not ( = ?auto_787779 ?auto_787785 ) ) ( not ( = ?auto_787779 ?auto_787786 ) ) ( not ( = ?auto_787779 ?auto_787787 ) ) ( not ( = ?auto_787779 ?auto_787788 ) ) ( not ( = ?auto_787779 ?auto_787789 ) ) ( not ( = ?auto_787780 ?auto_787781 ) ) ( not ( = ?auto_787780 ?auto_787782 ) ) ( not ( = ?auto_787780 ?auto_787783 ) ) ( not ( = ?auto_787780 ?auto_787784 ) ) ( not ( = ?auto_787780 ?auto_787785 ) ) ( not ( = ?auto_787780 ?auto_787786 ) ) ( not ( = ?auto_787780 ?auto_787787 ) ) ( not ( = ?auto_787780 ?auto_787788 ) ) ( not ( = ?auto_787780 ?auto_787789 ) ) ( not ( = ?auto_787781 ?auto_787782 ) ) ( not ( = ?auto_787781 ?auto_787783 ) ) ( not ( = ?auto_787781 ?auto_787784 ) ) ( not ( = ?auto_787781 ?auto_787785 ) ) ( not ( = ?auto_787781 ?auto_787786 ) ) ( not ( = ?auto_787781 ?auto_787787 ) ) ( not ( = ?auto_787781 ?auto_787788 ) ) ( not ( = ?auto_787781 ?auto_787789 ) ) ( not ( = ?auto_787782 ?auto_787783 ) ) ( not ( = ?auto_787782 ?auto_787784 ) ) ( not ( = ?auto_787782 ?auto_787785 ) ) ( not ( = ?auto_787782 ?auto_787786 ) ) ( not ( = ?auto_787782 ?auto_787787 ) ) ( not ( = ?auto_787782 ?auto_787788 ) ) ( not ( = ?auto_787782 ?auto_787789 ) ) ( not ( = ?auto_787783 ?auto_787784 ) ) ( not ( = ?auto_787783 ?auto_787785 ) ) ( not ( = ?auto_787783 ?auto_787786 ) ) ( not ( = ?auto_787783 ?auto_787787 ) ) ( not ( = ?auto_787783 ?auto_787788 ) ) ( not ( = ?auto_787783 ?auto_787789 ) ) ( not ( = ?auto_787784 ?auto_787785 ) ) ( not ( = ?auto_787784 ?auto_787786 ) ) ( not ( = ?auto_787784 ?auto_787787 ) ) ( not ( = ?auto_787784 ?auto_787788 ) ) ( not ( = ?auto_787784 ?auto_787789 ) ) ( not ( = ?auto_787785 ?auto_787786 ) ) ( not ( = ?auto_787785 ?auto_787787 ) ) ( not ( = ?auto_787785 ?auto_787788 ) ) ( not ( = ?auto_787785 ?auto_787789 ) ) ( not ( = ?auto_787786 ?auto_787787 ) ) ( not ( = ?auto_787786 ?auto_787788 ) ) ( not ( = ?auto_787786 ?auto_787789 ) ) ( not ( = ?auto_787787 ?auto_787788 ) ) ( not ( = ?auto_787787 ?auto_787789 ) ) ( not ( = ?auto_787788 ?auto_787789 ) ) ( ON ?auto_787787 ?auto_787788 ) ( ON ?auto_787786 ?auto_787787 ) ( ON ?auto_787785 ?auto_787786 ) ( ON ?auto_787784 ?auto_787785 ) ( ON ?auto_787783 ?auto_787784 ) ( ON ?auto_787782 ?auto_787783 ) ( ON ?auto_787781 ?auto_787782 ) ( ON ?auto_787780 ?auto_787781 ) ( ON ?auto_787779 ?auto_787780 ) ( ON ?auto_787778 ?auto_787779 ) ( CLEAR ?auto_787776 ) ( ON ?auto_787777 ?auto_787778 ) ( CLEAR ?auto_787777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_787775 ?auto_787776 ?auto_787777 )
      ( MAKE-14PILE ?auto_787775 ?auto_787776 ?auto_787777 ?auto_787778 ?auto_787779 ?auto_787780 ?auto_787781 ?auto_787782 ?auto_787783 ?auto_787784 ?auto_787785 ?auto_787786 ?auto_787787 ?auto_787788 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787833 - BLOCK
      ?auto_787834 - BLOCK
      ?auto_787835 - BLOCK
      ?auto_787836 - BLOCK
      ?auto_787837 - BLOCK
      ?auto_787838 - BLOCK
      ?auto_787839 - BLOCK
      ?auto_787840 - BLOCK
      ?auto_787841 - BLOCK
      ?auto_787842 - BLOCK
      ?auto_787843 - BLOCK
      ?auto_787844 - BLOCK
      ?auto_787845 - BLOCK
      ?auto_787846 - BLOCK
    )
    :vars
    (
      ?auto_787847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787846 ?auto_787847 ) ( ON-TABLE ?auto_787833 ) ( not ( = ?auto_787833 ?auto_787834 ) ) ( not ( = ?auto_787833 ?auto_787835 ) ) ( not ( = ?auto_787833 ?auto_787836 ) ) ( not ( = ?auto_787833 ?auto_787837 ) ) ( not ( = ?auto_787833 ?auto_787838 ) ) ( not ( = ?auto_787833 ?auto_787839 ) ) ( not ( = ?auto_787833 ?auto_787840 ) ) ( not ( = ?auto_787833 ?auto_787841 ) ) ( not ( = ?auto_787833 ?auto_787842 ) ) ( not ( = ?auto_787833 ?auto_787843 ) ) ( not ( = ?auto_787833 ?auto_787844 ) ) ( not ( = ?auto_787833 ?auto_787845 ) ) ( not ( = ?auto_787833 ?auto_787846 ) ) ( not ( = ?auto_787833 ?auto_787847 ) ) ( not ( = ?auto_787834 ?auto_787835 ) ) ( not ( = ?auto_787834 ?auto_787836 ) ) ( not ( = ?auto_787834 ?auto_787837 ) ) ( not ( = ?auto_787834 ?auto_787838 ) ) ( not ( = ?auto_787834 ?auto_787839 ) ) ( not ( = ?auto_787834 ?auto_787840 ) ) ( not ( = ?auto_787834 ?auto_787841 ) ) ( not ( = ?auto_787834 ?auto_787842 ) ) ( not ( = ?auto_787834 ?auto_787843 ) ) ( not ( = ?auto_787834 ?auto_787844 ) ) ( not ( = ?auto_787834 ?auto_787845 ) ) ( not ( = ?auto_787834 ?auto_787846 ) ) ( not ( = ?auto_787834 ?auto_787847 ) ) ( not ( = ?auto_787835 ?auto_787836 ) ) ( not ( = ?auto_787835 ?auto_787837 ) ) ( not ( = ?auto_787835 ?auto_787838 ) ) ( not ( = ?auto_787835 ?auto_787839 ) ) ( not ( = ?auto_787835 ?auto_787840 ) ) ( not ( = ?auto_787835 ?auto_787841 ) ) ( not ( = ?auto_787835 ?auto_787842 ) ) ( not ( = ?auto_787835 ?auto_787843 ) ) ( not ( = ?auto_787835 ?auto_787844 ) ) ( not ( = ?auto_787835 ?auto_787845 ) ) ( not ( = ?auto_787835 ?auto_787846 ) ) ( not ( = ?auto_787835 ?auto_787847 ) ) ( not ( = ?auto_787836 ?auto_787837 ) ) ( not ( = ?auto_787836 ?auto_787838 ) ) ( not ( = ?auto_787836 ?auto_787839 ) ) ( not ( = ?auto_787836 ?auto_787840 ) ) ( not ( = ?auto_787836 ?auto_787841 ) ) ( not ( = ?auto_787836 ?auto_787842 ) ) ( not ( = ?auto_787836 ?auto_787843 ) ) ( not ( = ?auto_787836 ?auto_787844 ) ) ( not ( = ?auto_787836 ?auto_787845 ) ) ( not ( = ?auto_787836 ?auto_787846 ) ) ( not ( = ?auto_787836 ?auto_787847 ) ) ( not ( = ?auto_787837 ?auto_787838 ) ) ( not ( = ?auto_787837 ?auto_787839 ) ) ( not ( = ?auto_787837 ?auto_787840 ) ) ( not ( = ?auto_787837 ?auto_787841 ) ) ( not ( = ?auto_787837 ?auto_787842 ) ) ( not ( = ?auto_787837 ?auto_787843 ) ) ( not ( = ?auto_787837 ?auto_787844 ) ) ( not ( = ?auto_787837 ?auto_787845 ) ) ( not ( = ?auto_787837 ?auto_787846 ) ) ( not ( = ?auto_787837 ?auto_787847 ) ) ( not ( = ?auto_787838 ?auto_787839 ) ) ( not ( = ?auto_787838 ?auto_787840 ) ) ( not ( = ?auto_787838 ?auto_787841 ) ) ( not ( = ?auto_787838 ?auto_787842 ) ) ( not ( = ?auto_787838 ?auto_787843 ) ) ( not ( = ?auto_787838 ?auto_787844 ) ) ( not ( = ?auto_787838 ?auto_787845 ) ) ( not ( = ?auto_787838 ?auto_787846 ) ) ( not ( = ?auto_787838 ?auto_787847 ) ) ( not ( = ?auto_787839 ?auto_787840 ) ) ( not ( = ?auto_787839 ?auto_787841 ) ) ( not ( = ?auto_787839 ?auto_787842 ) ) ( not ( = ?auto_787839 ?auto_787843 ) ) ( not ( = ?auto_787839 ?auto_787844 ) ) ( not ( = ?auto_787839 ?auto_787845 ) ) ( not ( = ?auto_787839 ?auto_787846 ) ) ( not ( = ?auto_787839 ?auto_787847 ) ) ( not ( = ?auto_787840 ?auto_787841 ) ) ( not ( = ?auto_787840 ?auto_787842 ) ) ( not ( = ?auto_787840 ?auto_787843 ) ) ( not ( = ?auto_787840 ?auto_787844 ) ) ( not ( = ?auto_787840 ?auto_787845 ) ) ( not ( = ?auto_787840 ?auto_787846 ) ) ( not ( = ?auto_787840 ?auto_787847 ) ) ( not ( = ?auto_787841 ?auto_787842 ) ) ( not ( = ?auto_787841 ?auto_787843 ) ) ( not ( = ?auto_787841 ?auto_787844 ) ) ( not ( = ?auto_787841 ?auto_787845 ) ) ( not ( = ?auto_787841 ?auto_787846 ) ) ( not ( = ?auto_787841 ?auto_787847 ) ) ( not ( = ?auto_787842 ?auto_787843 ) ) ( not ( = ?auto_787842 ?auto_787844 ) ) ( not ( = ?auto_787842 ?auto_787845 ) ) ( not ( = ?auto_787842 ?auto_787846 ) ) ( not ( = ?auto_787842 ?auto_787847 ) ) ( not ( = ?auto_787843 ?auto_787844 ) ) ( not ( = ?auto_787843 ?auto_787845 ) ) ( not ( = ?auto_787843 ?auto_787846 ) ) ( not ( = ?auto_787843 ?auto_787847 ) ) ( not ( = ?auto_787844 ?auto_787845 ) ) ( not ( = ?auto_787844 ?auto_787846 ) ) ( not ( = ?auto_787844 ?auto_787847 ) ) ( not ( = ?auto_787845 ?auto_787846 ) ) ( not ( = ?auto_787845 ?auto_787847 ) ) ( not ( = ?auto_787846 ?auto_787847 ) ) ( ON ?auto_787845 ?auto_787846 ) ( ON ?auto_787844 ?auto_787845 ) ( ON ?auto_787843 ?auto_787844 ) ( ON ?auto_787842 ?auto_787843 ) ( ON ?auto_787841 ?auto_787842 ) ( ON ?auto_787840 ?auto_787841 ) ( ON ?auto_787839 ?auto_787840 ) ( ON ?auto_787838 ?auto_787839 ) ( ON ?auto_787837 ?auto_787838 ) ( ON ?auto_787836 ?auto_787837 ) ( ON ?auto_787835 ?auto_787836 ) ( CLEAR ?auto_787833 ) ( ON ?auto_787834 ?auto_787835 ) ( CLEAR ?auto_787834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_787833 ?auto_787834 )
      ( MAKE-14PILE ?auto_787833 ?auto_787834 ?auto_787835 ?auto_787836 ?auto_787837 ?auto_787838 ?auto_787839 ?auto_787840 ?auto_787841 ?auto_787842 ?auto_787843 ?auto_787844 ?auto_787845 ?auto_787846 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_787891 - BLOCK
      ?auto_787892 - BLOCK
      ?auto_787893 - BLOCK
      ?auto_787894 - BLOCK
      ?auto_787895 - BLOCK
      ?auto_787896 - BLOCK
      ?auto_787897 - BLOCK
      ?auto_787898 - BLOCK
      ?auto_787899 - BLOCK
      ?auto_787900 - BLOCK
      ?auto_787901 - BLOCK
      ?auto_787902 - BLOCK
      ?auto_787903 - BLOCK
      ?auto_787904 - BLOCK
    )
    :vars
    (
      ?auto_787905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787904 ?auto_787905 ) ( not ( = ?auto_787891 ?auto_787892 ) ) ( not ( = ?auto_787891 ?auto_787893 ) ) ( not ( = ?auto_787891 ?auto_787894 ) ) ( not ( = ?auto_787891 ?auto_787895 ) ) ( not ( = ?auto_787891 ?auto_787896 ) ) ( not ( = ?auto_787891 ?auto_787897 ) ) ( not ( = ?auto_787891 ?auto_787898 ) ) ( not ( = ?auto_787891 ?auto_787899 ) ) ( not ( = ?auto_787891 ?auto_787900 ) ) ( not ( = ?auto_787891 ?auto_787901 ) ) ( not ( = ?auto_787891 ?auto_787902 ) ) ( not ( = ?auto_787891 ?auto_787903 ) ) ( not ( = ?auto_787891 ?auto_787904 ) ) ( not ( = ?auto_787891 ?auto_787905 ) ) ( not ( = ?auto_787892 ?auto_787893 ) ) ( not ( = ?auto_787892 ?auto_787894 ) ) ( not ( = ?auto_787892 ?auto_787895 ) ) ( not ( = ?auto_787892 ?auto_787896 ) ) ( not ( = ?auto_787892 ?auto_787897 ) ) ( not ( = ?auto_787892 ?auto_787898 ) ) ( not ( = ?auto_787892 ?auto_787899 ) ) ( not ( = ?auto_787892 ?auto_787900 ) ) ( not ( = ?auto_787892 ?auto_787901 ) ) ( not ( = ?auto_787892 ?auto_787902 ) ) ( not ( = ?auto_787892 ?auto_787903 ) ) ( not ( = ?auto_787892 ?auto_787904 ) ) ( not ( = ?auto_787892 ?auto_787905 ) ) ( not ( = ?auto_787893 ?auto_787894 ) ) ( not ( = ?auto_787893 ?auto_787895 ) ) ( not ( = ?auto_787893 ?auto_787896 ) ) ( not ( = ?auto_787893 ?auto_787897 ) ) ( not ( = ?auto_787893 ?auto_787898 ) ) ( not ( = ?auto_787893 ?auto_787899 ) ) ( not ( = ?auto_787893 ?auto_787900 ) ) ( not ( = ?auto_787893 ?auto_787901 ) ) ( not ( = ?auto_787893 ?auto_787902 ) ) ( not ( = ?auto_787893 ?auto_787903 ) ) ( not ( = ?auto_787893 ?auto_787904 ) ) ( not ( = ?auto_787893 ?auto_787905 ) ) ( not ( = ?auto_787894 ?auto_787895 ) ) ( not ( = ?auto_787894 ?auto_787896 ) ) ( not ( = ?auto_787894 ?auto_787897 ) ) ( not ( = ?auto_787894 ?auto_787898 ) ) ( not ( = ?auto_787894 ?auto_787899 ) ) ( not ( = ?auto_787894 ?auto_787900 ) ) ( not ( = ?auto_787894 ?auto_787901 ) ) ( not ( = ?auto_787894 ?auto_787902 ) ) ( not ( = ?auto_787894 ?auto_787903 ) ) ( not ( = ?auto_787894 ?auto_787904 ) ) ( not ( = ?auto_787894 ?auto_787905 ) ) ( not ( = ?auto_787895 ?auto_787896 ) ) ( not ( = ?auto_787895 ?auto_787897 ) ) ( not ( = ?auto_787895 ?auto_787898 ) ) ( not ( = ?auto_787895 ?auto_787899 ) ) ( not ( = ?auto_787895 ?auto_787900 ) ) ( not ( = ?auto_787895 ?auto_787901 ) ) ( not ( = ?auto_787895 ?auto_787902 ) ) ( not ( = ?auto_787895 ?auto_787903 ) ) ( not ( = ?auto_787895 ?auto_787904 ) ) ( not ( = ?auto_787895 ?auto_787905 ) ) ( not ( = ?auto_787896 ?auto_787897 ) ) ( not ( = ?auto_787896 ?auto_787898 ) ) ( not ( = ?auto_787896 ?auto_787899 ) ) ( not ( = ?auto_787896 ?auto_787900 ) ) ( not ( = ?auto_787896 ?auto_787901 ) ) ( not ( = ?auto_787896 ?auto_787902 ) ) ( not ( = ?auto_787896 ?auto_787903 ) ) ( not ( = ?auto_787896 ?auto_787904 ) ) ( not ( = ?auto_787896 ?auto_787905 ) ) ( not ( = ?auto_787897 ?auto_787898 ) ) ( not ( = ?auto_787897 ?auto_787899 ) ) ( not ( = ?auto_787897 ?auto_787900 ) ) ( not ( = ?auto_787897 ?auto_787901 ) ) ( not ( = ?auto_787897 ?auto_787902 ) ) ( not ( = ?auto_787897 ?auto_787903 ) ) ( not ( = ?auto_787897 ?auto_787904 ) ) ( not ( = ?auto_787897 ?auto_787905 ) ) ( not ( = ?auto_787898 ?auto_787899 ) ) ( not ( = ?auto_787898 ?auto_787900 ) ) ( not ( = ?auto_787898 ?auto_787901 ) ) ( not ( = ?auto_787898 ?auto_787902 ) ) ( not ( = ?auto_787898 ?auto_787903 ) ) ( not ( = ?auto_787898 ?auto_787904 ) ) ( not ( = ?auto_787898 ?auto_787905 ) ) ( not ( = ?auto_787899 ?auto_787900 ) ) ( not ( = ?auto_787899 ?auto_787901 ) ) ( not ( = ?auto_787899 ?auto_787902 ) ) ( not ( = ?auto_787899 ?auto_787903 ) ) ( not ( = ?auto_787899 ?auto_787904 ) ) ( not ( = ?auto_787899 ?auto_787905 ) ) ( not ( = ?auto_787900 ?auto_787901 ) ) ( not ( = ?auto_787900 ?auto_787902 ) ) ( not ( = ?auto_787900 ?auto_787903 ) ) ( not ( = ?auto_787900 ?auto_787904 ) ) ( not ( = ?auto_787900 ?auto_787905 ) ) ( not ( = ?auto_787901 ?auto_787902 ) ) ( not ( = ?auto_787901 ?auto_787903 ) ) ( not ( = ?auto_787901 ?auto_787904 ) ) ( not ( = ?auto_787901 ?auto_787905 ) ) ( not ( = ?auto_787902 ?auto_787903 ) ) ( not ( = ?auto_787902 ?auto_787904 ) ) ( not ( = ?auto_787902 ?auto_787905 ) ) ( not ( = ?auto_787903 ?auto_787904 ) ) ( not ( = ?auto_787903 ?auto_787905 ) ) ( not ( = ?auto_787904 ?auto_787905 ) ) ( ON ?auto_787903 ?auto_787904 ) ( ON ?auto_787902 ?auto_787903 ) ( ON ?auto_787901 ?auto_787902 ) ( ON ?auto_787900 ?auto_787901 ) ( ON ?auto_787899 ?auto_787900 ) ( ON ?auto_787898 ?auto_787899 ) ( ON ?auto_787897 ?auto_787898 ) ( ON ?auto_787896 ?auto_787897 ) ( ON ?auto_787895 ?auto_787896 ) ( ON ?auto_787894 ?auto_787895 ) ( ON ?auto_787893 ?auto_787894 ) ( ON ?auto_787892 ?auto_787893 ) ( ON ?auto_787891 ?auto_787892 ) ( CLEAR ?auto_787891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_787891 )
      ( MAKE-14PILE ?auto_787891 ?auto_787892 ?auto_787893 ?auto_787894 ?auto_787895 ?auto_787896 ?auto_787897 ?auto_787898 ?auto_787899 ?auto_787900 ?auto_787901 ?auto_787902 ?auto_787903 ?auto_787904 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_787950 - BLOCK
      ?auto_787951 - BLOCK
      ?auto_787952 - BLOCK
      ?auto_787953 - BLOCK
      ?auto_787954 - BLOCK
      ?auto_787955 - BLOCK
      ?auto_787956 - BLOCK
      ?auto_787957 - BLOCK
      ?auto_787958 - BLOCK
      ?auto_787959 - BLOCK
      ?auto_787960 - BLOCK
      ?auto_787961 - BLOCK
      ?auto_787962 - BLOCK
      ?auto_787963 - BLOCK
      ?auto_787964 - BLOCK
    )
    :vars
    (
      ?auto_787965 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_787963 ) ( ON ?auto_787964 ?auto_787965 ) ( CLEAR ?auto_787964 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_787950 ) ( ON ?auto_787951 ?auto_787950 ) ( ON ?auto_787952 ?auto_787951 ) ( ON ?auto_787953 ?auto_787952 ) ( ON ?auto_787954 ?auto_787953 ) ( ON ?auto_787955 ?auto_787954 ) ( ON ?auto_787956 ?auto_787955 ) ( ON ?auto_787957 ?auto_787956 ) ( ON ?auto_787958 ?auto_787957 ) ( ON ?auto_787959 ?auto_787958 ) ( ON ?auto_787960 ?auto_787959 ) ( ON ?auto_787961 ?auto_787960 ) ( ON ?auto_787962 ?auto_787961 ) ( ON ?auto_787963 ?auto_787962 ) ( not ( = ?auto_787950 ?auto_787951 ) ) ( not ( = ?auto_787950 ?auto_787952 ) ) ( not ( = ?auto_787950 ?auto_787953 ) ) ( not ( = ?auto_787950 ?auto_787954 ) ) ( not ( = ?auto_787950 ?auto_787955 ) ) ( not ( = ?auto_787950 ?auto_787956 ) ) ( not ( = ?auto_787950 ?auto_787957 ) ) ( not ( = ?auto_787950 ?auto_787958 ) ) ( not ( = ?auto_787950 ?auto_787959 ) ) ( not ( = ?auto_787950 ?auto_787960 ) ) ( not ( = ?auto_787950 ?auto_787961 ) ) ( not ( = ?auto_787950 ?auto_787962 ) ) ( not ( = ?auto_787950 ?auto_787963 ) ) ( not ( = ?auto_787950 ?auto_787964 ) ) ( not ( = ?auto_787950 ?auto_787965 ) ) ( not ( = ?auto_787951 ?auto_787952 ) ) ( not ( = ?auto_787951 ?auto_787953 ) ) ( not ( = ?auto_787951 ?auto_787954 ) ) ( not ( = ?auto_787951 ?auto_787955 ) ) ( not ( = ?auto_787951 ?auto_787956 ) ) ( not ( = ?auto_787951 ?auto_787957 ) ) ( not ( = ?auto_787951 ?auto_787958 ) ) ( not ( = ?auto_787951 ?auto_787959 ) ) ( not ( = ?auto_787951 ?auto_787960 ) ) ( not ( = ?auto_787951 ?auto_787961 ) ) ( not ( = ?auto_787951 ?auto_787962 ) ) ( not ( = ?auto_787951 ?auto_787963 ) ) ( not ( = ?auto_787951 ?auto_787964 ) ) ( not ( = ?auto_787951 ?auto_787965 ) ) ( not ( = ?auto_787952 ?auto_787953 ) ) ( not ( = ?auto_787952 ?auto_787954 ) ) ( not ( = ?auto_787952 ?auto_787955 ) ) ( not ( = ?auto_787952 ?auto_787956 ) ) ( not ( = ?auto_787952 ?auto_787957 ) ) ( not ( = ?auto_787952 ?auto_787958 ) ) ( not ( = ?auto_787952 ?auto_787959 ) ) ( not ( = ?auto_787952 ?auto_787960 ) ) ( not ( = ?auto_787952 ?auto_787961 ) ) ( not ( = ?auto_787952 ?auto_787962 ) ) ( not ( = ?auto_787952 ?auto_787963 ) ) ( not ( = ?auto_787952 ?auto_787964 ) ) ( not ( = ?auto_787952 ?auto_787965 ) ) ( not ( = ?auto_787953 ?auto_787954 ) ) ( not ( = ?auto_787953 ?auto_787955 ) ) ( not ( = ?auto_787953 ?auto_787956 ) ) ( not ( = ?auto_787953 ?auto_787957 ) ) ( not ( = ?auto_787953 ?auto_787958 ) ) ( not ( = ?auto_787953 ?auto_787959 ) ) ( not ( = ?auto_787953 ?auto_787960 ) ) ( not ( = ?auto_787953 ?auto_787961 ) ) ( not ( = ?auto_787953 ?auto_787962 ) ) ( not ( = ?auto_787953 ?auto_787963 ) ) ( not ( = ?auto_787953 ?auto_787964 ) ) ( not ( = ?auto_787953 ?auto_787965 ) ) ( not ( = ?auto_787954 ?auto_787955 ) ) ( not ( = ?auto_787954 ?auto_787956 ) ) ( not ( = ?auto_787954 ?auto_787957 ) ) ( not ( = ?auto_787954 ?auto_787958 ) ) ( not ( = ?auto_787954 ?auto_787959 ) ) ( not ( = ?auto_787954 ?auto_787960 ) ) ( not ( = ?auto_787954 ?auto_787961 ) ) ( not ( = ?auto_787954 ?auto_787962 ) ) ( not ( = ?auto_787954 ?auto_787963 ) ) ( not ( = ?auto_787954 ?auto_787964 ) ) ( not ( = ?auto_787954 ?auto_787965 ) ) ( not ( = ?auto_787955 ?auto_787956 ) ) ( not ( = ?auto_787955 ?auto_787957 ) ) ( not ( = ?auto_787955 ?auto_787958 ) ) ( not ( = ?auto_787955 ?auto_787959 ) ) ( not ( = ?auto_787955 ?auto_787960 ) ) ( not ( = ?auto_787955 ?auto_787961 ) ) ( not ( = ?auto_787955 ?auto_787962 ) ) ( not ( = ?auto_787955 ?auto_787963 ) ) ( not ( = ?auto_787955 ?auto_787964 ) ) ( not ( = ?auto_787955 ?auto_787965 ) ) ( not ( = ?auto_787956 ?auto_787957 ) ) ( not ( = ?auto_787956 ?auto_787958 ) ) ( not ( = ?auto_787956 ?auto_787959 ) ) ( not ( = ?auto_787956 ?auto_787960 ) ) ( not ( = ?auto_787956 ?auto_787961 ) ) ( not ( = ?auto_787956 ?auto_787962 ) ) ( not ( = ?auto_787956 ?auto_787963 ) ) ( not ( = ?auto_787956 ?auto_787964 ) ) ( not ( = ?auto_787956 ?auto_787965 ) ) ( not ( = ?auto_787957 ?auto_787958 ) ) ( not ( = ?auto_787957 ?auto_787959 ) ) ( not ( = ?auto_787957 ?auto_787960 ) ) ( not ( = ?auto_787957 ?auto_787961 ) ) ( not ( = ?auto_787957 ?auto_787962 ) ) ( not ( = ?auto_787957 ?auto_787963 ) ) ( not ( = ?auto_787957 ?auto_787964 ) ) ( not ( = ?auto_787957 ?auto_787965 ) ) ( not ( = ?auto_787958 ?auto_787959 ) ) ( not ( = ?auto_787958 ?auto_787960 ) ) ( not ( = ?auto_787958 ?auto_787961 ) ) ( not ( = ?auto_787958 ?auto_787962 ) ) ( not ( = ?auto_787958 ?auto_787963 ) ) ( not ( = ?auto_787958 ?auto_787964 ) ) ( not ( = ?auto_787958 ?auto_787965 ) ) ( not ( = ?auto_787959 ?auto_787960 ) ) ( not ( = ?auto_787959 ?auto_787961 ) ) ( not ( = ?auto_787959 ?auto_787962 ) ) ( not ( = ?auto_787959 ?auto_787963 ) ) ( not ( = ?auto_787959 ?auto_787964 ) ) ( not ( = ?auto_787959 ?auto_787965 ) ) ( not ( = ?auto_787960 ?auto_787961 ) ) ( not ( = ?auto_787960 ?auto_787962 ) ) ( not ( = ?auto_787960 ?auto_787963 ) ) ( not ( = ?auto_787960 ?auto_787964 ) ) ( not ( = ?auto_787960 ?auto_787965 ) ) ( not ( = ?auto_787961 ?auto_787962 ) ) ( not ( = ?auto_787961 ?auto_787963 ) ) ( not ( = ?auto_787961 ?auto_787964 ) ) ( not ( = ?auto_787961 ?auto_787965 ) ) ( not ( = ?auto_787962 ?auto_787963 ) ) ( not ( = ?auto_787962 ?auto_787964 ) ) ( not ( = ?auto_787962 ?auto_787965 ) ) ( not ( = ?auto_787963 ?auto_787964 ) ) ( not ( = ?auto_787963 ?auto_787965 ) ) ( not ( = ?auto_787964 ?auto_787965 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_787964 ?auto_787965 )
      ( !STACK ?auto_787964 ?auto_787963 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788012 - BLOCK
      ?auto_788013 - BLOCK
      ?auto_788014 - BLOCK
      ?auto_788015 - BLOCK
      ?auto_788016 - BLOCK
      ?auto_788017 - BLOCK
      ?auto_788018 - BLOCK
      ?auto_788019 - BLOCK
      ?auto_788020 - BLOCK
      ?auto_788021 - BLOCK
      ?auto_788022 - BLOCK
      ?auto_788023 - BLOCK
      ?auto_788024 - BLOCK
      ?auto_788025 - BLOCK
      ?auto_788026 - BLOCK
    )
    :vars
    (
      ?auto_788027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788026 ?auto_788027 ) ( ON-TABLE ?auto_788012 ) ( ON ?auto_788013 ?auto_788012 ) ( ON ?auto_788014 ?auto_788013 ) ( ON ?auto_788015 ?auto_788014 ) ( ON ?auto_788016 ?auto_788015 ) ( ON ?auto_788017 ?auto_788016 ) ( ON ?auto_788018 ?auto_788017 ) ( ON ?auto_788019 ?auto_788018 ) ( ON ?auto_788020 ?auto_788019 ) ( ON ?auto_788021 ?auto_788020 ) ( ON ?auto_788022 ?auto_788021 ) ( ON ?auto_788023 ?auto_788022 ) ( ON ?auto_788024 ?auto_788023 ) ( not ( = ?auto_788012 ?auto_788013 ) ) ( not ( = ?auto_788012 ?auto_788014 ) ) ( not ( = ?auto_788012 ?auto_788015 ) ) ( not ( = ?auto_788012 ?auto_788016 ) ) ( not ( = ?auto_788012 ?auto_788017 ) ) ( not ( = ?auto_788012 ?auto_788018 ) ) ( not ( = ?auto_788012 ?auto_788019 ) ) ( not ( = ?auto_788012 ?auto_788020 ) ) ( not ( = ?auto_788012 ?auto_788021 ) ) ( not ( = ?auto_788012 ?auto_788022 ) ) ( not ( = ?auto_788012 ?auto_788023 ) ) ( not ( = ?auto_788012 ?auto_788024 ) ) ( not ( = ?auto_788012 ?auto_788025 ) ) ( not ( = ?auto_788012 ?auto_788026 ) ) ( not ( = ?auto_788012 ?auto_788027 ) ) ( not ( = ?auto_788013 ?auto_788014 ) ) ( not ( = ?auto_788013 ?auto_788015 ) ) ( not ( = ?auto_788013 ?auto_788016 ) ) ( not ( = ?auto_788013 ?auto_788017 ) ) ( not ( = ?auto_788013 ?auto_788018 ) ) ( not ( = ?auto_788013 ?auto_788019 ) ) ( not ( = ?auto_788013 ?auto_788020 ) ) ( not ( = ?auto_788013 ?auto_788021 ) ) ( not ( = ?auto_788013 ?auto_788022 ) ) ( not ( = ?auto_788013 ?auto_788023 ) ) ( not ( = ?auto_788013 ?auto_788024 ) ) ( not ( = ?auto_788013 ?auto_788025 ) ) ( not ( = ?auto_788013 ?auto_788026 ) ) ( not ( = ?auto_788013 ?auto_788027 ) ) ( not ( = ?auto_788014 ?auto_788015 ) ) ( not ( = ?auto_788014 ?auto_788016 ) ) ( not ( = ?auto_788014 ?auto_788017 ) ) ( not ( = ?auto_788014 ?auto_788018 ) ) ( not ( = ?auto_788014 ?auto_788019 ) ) ( not ( = ?auto_788014 ?auto_788020 ) ) ( not ( = ?auto_788014 ?auto_788021 ) ) ( not ( = ?auto_788014 ?auto_788022 ) ) ( not ( = ?auto_788014 ?auto_788023 ) ) ( not ( = ?auto_788014 ?auto_788024 ) ) ( not ( = ?auto_788014 ?auto_788025 ) ) ( not ( = ?auto_788014 ?auto_788026 ) ) ( not ( = ?auto_788014 ?auto_788027 ) ) ( not ( = ?auto_788015 ?auto_788016 ) ) ( not ( = ?auto_788015 ?auto_788017 ) ) ( not ( = ?auto_788015 ?auto_788018 ) ) ( not ( = ?auto_788015 ?auto_788019 ) ) ( not ( = ?auto_788015 ?auto_788020 ) ) ( not ( = ?auto_788015 ?auto_788021 ) ) ( not ( = ?auto_788015 ?auto_788022 ) ) ( not ( = ?auto_788015 ?auto_788023 ) ) ( not ( = ?auto_788015 ?auto_788024 ) ) ( not ( = ?auto_788015 ?auto_788025 ) ) ( not ( = ?auto_788015 ?auto_788026 ) ) ( not ( = ?auto_788015 ?auto_788027 ) ) ( not ( = ?auto_788016 ?auto_788017 ) ) ( not ( = ?auto_788016 ?auto_788018 ) ) ( not ( = ?auto_788016 ?auto_788019 ) ) ( not ( = ?auto_788016 ?auto_788020 ) ) ( not ( = ?auto_788016 ?auto_788021 ) ) ( not ( = ?auto_788016 ?auto_788022 ) ) ( not ( = ?auto_788016 ?auto_788023 ) ) ( not ( = ?auto_788016 ?auto_788024 ) ) ( not ( = ?auto_788016 ?auto_788025 ) ) ( not ( = ?auto_788016 ?auto_788026 ) ) ( not ( = ?auto_788016 ?auto_788027 ) ) ( not ( = ?auto_788017 ?auto_788018 ) ) ( not ( = ?auto_788017 ?auto_788019 ) ) ( not ( = ?auto_788017 ?auto_788020 ) ) ( not ( = ?auto_788017 ?auto_788021 ) ) ( not ( = ?auto_788017 ?auto_788022 ) ) ( not ( = ?auto_788017 ?auto_788023 ) ) ( not ( = ?auto_788017 ?auto_788024 ) ) ( not ( = ?auto_788017 ?auto_788025 ) ) ( not ( = ?auto_788017 ?auto_788026 ) ) ( not ( = ?auto_788017 ?auto_788027 ) ) ( not ( = ?auto_788018 ?auto_788019 ) ) ( not ( = ?auto_788018 ?auto_788020 ) ) ( not ( = ?auto_788018 ?auto_788021 ) ) ( not ( = ?auto_788018 ?auto_788022 ) ) ( not ( = ?auto_788018 ?auto_788023 ) ) ( not ( = ?auto_788018 ?auto_788024 ) ) ( not ( = ?auto_788018 ?auto_788025 ) ) ( not ( = ?auto_788018 ?auto_788026 ) ) ( not ( = ?auto_788018 ?auto_788027 ) ) ( not ( = ?auto_788019 ?auto_788020 ) ) ( not ( = ?auto_788019 ?auto_788021 ) ) ( not ( = ?auto_788019 ?auto_788022 ) ) ( not ( = ?auto_788019 ?auto_788023 ) ) ( not ( = ?auto_788019 ?auto_788024 ) ) ( not ( = ?auto_788019 ?auto_788025 ) ) ( not ( = ?auto_788019 ?auto_788026 ) ) ( not ( = ?auto_788019 ?auto_788027 ) ) ( not ( = ?auto_788020 ?auto_788021 ) ) ( not ( = ?auto_788020 ?auto_788022 ) ) ( not ( = ?auto_788020 ?auto_788023 ) ) ( not ( = ?auto_788020 ?auto_788024 ) ) ( not ( = ?auto_788020 ?auto_788025 ) ) ( not ( = ?auto_788020 ?auto_788026 ) ) ( not ( = ?auto_788020 ?auto_788027 ) ) ( not ( = ?auto_788021 ?auto_788022 ) ) ( not ( = ?auto_788021 ?auto_788023 ) ) ( not ( = ?auto_788021 ?auto_788024 ) ) ( not ( = ?auto_788021 ?auto_788025 ) ) ( not ( = ?auto_788021 ?auto_788026 ) ) ( not ( = ?auto_788021 ?auto_788027 ) ) ( not ( = ?auto_788022 ?auto_788023 ) ) ( not ( = ?auto_788022 ?auto_788024 ) ) ( not ( = ?auto_788022 ?auto_788025 ) ) ( not ( = ?auto_788022 ?auto_788026 ) ) ( not ( = ?auto_788022 ?auto_788027 ) ) ( not ( = ?auto_788023 ?auto_788024 ) ) ( not ( = ?auto_788023 ?auto_788025 ) ) ( not ( = ?auto_788023 ?auto_788026 ) ) ( not ( = ?auto_788023 ?auto_788027 ) ) ( not ( = ?auto_788024 ?auto_788025 ) ) ( not ( = ?auto_788024 ?auto_788026 ) ) ( not ( = ?auto_788024 ?auto_788027 ) ) ( not ( = ?auto_788025 ?auto_788026 ) ) ( not ( = ?auto_788025 ?auto_788027 ) ) ( not ( = ?auto_788026 ?auto_788027 ) ) ( CLEAR ?auto_788024 ) ( ON ?auto_788025 ?auto_788026 ) ( CLEAR ?auto_788025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_788012 ?auto_788013 ?auto_788014 ?auto_788015 ?auto_788016 ?auto_788017 ?auto_788018 ?auto_788019 ?auto_788020 ?auto_788021 ?auto_788022 ?auto_788023 ?auto_788024 ?auto_788025 )
      ( MAKE-15PILE ?auto_788012 ?auto_788013 ?auto_788014 ?auto_788015 ?auto_788016 ?auto_788017 ?auto_788018 ?auto_788019 ?auto_788020 ?auto_788021 ?auto_788022 ?auto_788023 ?auto_788024 ?auto_788025 ?auto_788026 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788074 - BLOCK
      ?auto_788075 - BLOCK
      ?auto_788076 - BLOCK
      ?auto_788077 - BLOCK
      ?auto_788078 - BLOCK
      ?auto_788079 - BLOCK
      ?auto_788080 - BLOCK
      ?auto_788081 - BLOCK
      ?auto_788082 - BLOCK
      ?auto_788083 - BLOCK
      ?auto_788084 - BLOCK
      ?auto_788085 - BLOCK
      ?auto_788086 - BLOCK
      ?auto_788087 - BLOCK
      ?auto_788088 - BLOCK
    )
    :vars
    (
      ?auto_788089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788088 ?auto_788089 ) ( ON-TABLE ?auto_788074 ) ( ON ?auto_788075 ?auto_788074 ) ( ON ?auto_788076 ?auto_788075 ) ( ON ?auto_788077 ?auto_788076 ) ( ON ?auto_788078 ?auto_788077 ) ( ON ?auto_788079 ?auto_788078 ) ( ON ?auto_788080 ?auto_788079 ) ( ON ?auto_788081 ?auto_788080 ) ( ON ?auto_788082 ?auto_788081 ) ( ON ?auto_788083 ?auto_788082 ) ( ON ?auto_788084 ?auto_788083 ) ( ON ?auto_788085 ?auto_788084 ) ( not ( = ?auto_788074 ?auto_788075 ) ) ( not ( = ?auto_788074 ?auto_788076 ) ) ( not ( = ?auto_788074 ?auto_788077 ) ) ( not ( = ?auto_788074 ?auto_788078 ) ) ( not ( = ?auto_788074 ?auto_788079 ) ) ( not ( = ?auto_788074 ?auto_788080 ) ) ( not ( = ?auto_788074 ?auto_788081 ) ) ( not ( = ?auto_788074 ?auto_788082 ) ) ( not ( = ?auto_788074 ?auto_788083 ) ) ( not ( = ?auto_788074 ?auto_788084 ) ) ( not ( = ?auto_788074 ?auto_788085 ) ) ( not ( = ?auto_788074 ?auto_788086 ) ) ( not ( = ?auto_788074 ?auto_788087 ) ) ( not ( = ?auto_788074 ?auto_788088 ) ) ( not ( = ?auto_788074 ?auto_788089 ) ) ( not ( = ?auto_788075 ?auto_788076 ) ) ( not ( = ?auto_788075 ?auto_788077 ) ) ( not ( = ?auto_788075 ?auto_788078 ) ) ( not ( = ?auto_788075 ?auto_788079 ) ) ( not ( = ?auto_788075 ?auto_788080 ) ) ( not ( = ?auto_788075 ?auto_788081 ) ) ( not ( = ?auto_788075 ?auto_788082 ) ) ( not ( = ?auto_788075 ?auto_788083 ) ) ( not ( = ?auto_788075 ?auto_788084 ) ) ( not ( = ?auto_788075 ?auto_788085 ) ) ( not ( = ?auto_788075 ?auto_788086 ) ) ( not ( = ?auto_788075 ?auto_788087 ) ) ( not ( = ?auto_788075 ?auto_788088 ) ) ( not ( = ?auto_788075 ?auto_788089 ) ) ( not ( = ?auto_788076 ?auto_788077 ) ) ( not ( = ?auto_788076 ?auto_788078 ) ) ( not ( = ?auto_788076 ?auto_788079 ) ) ( not ( = ?auto_788076 ?auto_788080 ) ) ( not ( = ?auto_788076 ?auto_788081 ) ) ( not ( = ?auto_788076 ?auto_788082 ) ) ( not ( = ?auto_788076 ?auto_788083 ) ) ( not ( = ?auto_788076 ?auto_788084 ) ) ( not ( = ?auto_788076 ?auto_788085 ) ) ( not ( = ?auto_788076 ?auto_788086 ) ) ( not ( = ?auto_788076 ?auto_788087 ) ) ( not ( = ?auto_788076 ?auto_788088 ) ) ( not ( = ?auto_788076 ?auto_788089 ) ) ( not ( = ?auto_788077 ?auto_788078 ) ) ( not ( = ?auto_788077 ?auto_788079 ) ) ( not ( = ?auto_788077 ?auto_788080 ) ) ( not ( = ?auto_788077 ?auto_788081 ) ) ( not ( = ?auto_788077 ?auto_788082 ) ) ( not ( = ?auto_788077 ?auto_788083 ) ) ( not ( = ?auto_788077 ?auto_788084 ) ) ( not ( = ?auto_788077 ?auto_788085 ) ) ( not ( = ?auto_788077 ?auto_788086 ) ) ( not ( = ?auto_788077 ?auto_788087 ) ) ( not ( = ?auto_788077 ?auto_788088 ) ) ( not ( = ?auto_788077 ?auto_788089 ) ) ( not ( = ?auto_788078 ?auto_788079 ) ) ( not ( = ?auto_788078 ?auto_788080 ) ) ( not ( = ?auto_788078 ?auto_788081 ) ) ( not ( = ?auto_788078 ?auto_788082 ) ) ( not ( = ?auto_788078 ?auto_788083 ) ) ( not ( = ?auto_788078 ?auto_788084 ) ) ( not ( = ?auto_788078 ?auto_788085 ) ) ( not ( = ?auto_788078 ?auto_788086 ) ) ( not ( = ?auto_788078 ?auto_788087 ) ) ( not ( = ?auto_788078 ?auto_788088 ) ) ( not ( = ?auto_788078 ?auto_788089 ) ) ( not ( = ?auto_788079 ?auto_788080 ) ) ( not ( = ?auto_788079 ?auto_788081 ) ) ( not ( = ?auto_788079 ?auto_788082 ) ) ( not ( = ?auto_788079 ?auto_788083 ) ) ( not ( = ?auto_788079 ?auto_788084 ) ) ( not ( = ?auto_788079 ?auto_788085 ) ) ( not ( = ?auto_788079 ?auto_788086 ) ) ( not ( = ?auto_788079 ?auto_788087 ) ) ( not ( = ?auto_788079 ?auto_788088 ) ) ( not ( = ?auto_788079 ?auto_788089 ) ) ( not ( = ?auto_788080 ?auto_788081 ) ) ( not ( = ?auto_788080 ?auto_788082 ) ) ( not ( = ?auto_788080 ?auto_788083 ) ) ( not ( = ?auto_788080 ?auto_788084 ) ) ( not ( = ?auto_788080 ?auto_788085 ) ) ( not ( = ?auto_788080 ?auto_788086 ) ) ( not ( = ?auto_788080 ?auto_788087 ) ) ( not ( = ?auto_788080 ?auto_788088 ) ) ( not ( = ?auto_788080 ?auto_788089 ) ) ( not ( = ?auto_788081 ?auto_788082 ) ) ( not ( = ?auto_788081 ?auto_788083 ) ) ( not ( = ?auto_788081 ?auto_788084 ) ) ( not ( = ?auto_788081 ?auto_788085 ) ) ( not ( = ?auto_788081 ?auto_788086 ) ) ( not ( = ?auto_788081 ?auto_788087 ) ) ( not ( = ?auto_788081 ?auto_788088 ) ) ( not ( = ?auto_788081 ?auto_788089 ) ) ( not ( = ?auto_788082 ?auto_788083 ) ) ( not ( = ?auto_788082 ?auto_788084 ) ) ( not ( = ?auto_788082 ?auto_788085 ) ) ( not ( = ?auto_788082 ?auto_788086 ) ) ( not ( = ?auto_788082 ?auto_788087 ) ) ( not ( = ?auto_788082 ?auto_788088 ) ) ( not ( = ?auto_788082 ?auto_788089 ) ) ( not ( = ?auto_788083 ?auto_788084 ) ) ( not ( = ?auto_788083 ?auto_788085 ) ) ( not ( = ?auto_788083 ?auto_788086 ) ) ( not ( = ?auto_788083 ?auto_788087 ) ) ( not ( = ?auto_788083 ?auto_788088 ) ) ( not ( = ?auto_788083 ?auto_788089 ) ) ( not ( = ?auto_788084 ?auto_788085 ) ) ( not ( = ?auto_788084 ?auto_788086 ) ) ( not ( = ?auto_788084 ?auto_788087 ) ) ( not ( = ?auto_788084 ?auto_788088 ) ) ( not ( = ?auto_788084 ?auto_788089 ) ) ( not ( = ?auto_788085 ?auto_788086 ) ) ( not ( = ?auto_788085 ?auto_788087 ) ) ( not ( = ?auto_788085 ?auto_788088 ) ) ( not ( = ?auto_788085 ?auto_788089 ) ) ( not ( = ?auto_788086 ?auto_788087 ) ) ( not ( = ?auto_788086 ?auto_788088 ) ) ( not ( = ?auto_788086 ?auto_788089 ) ) ( not ( = ?auto_788087 ?auto_788088 ) ) ( not ( = ?auto_788087 ?auto_788089 ) ) ( not ( = ?auto_788088 ?auto_788089 ) ) ( ON ?auto_788087 ?auto_788088 ) ( CLEAR ?auto_788085 ) ( ON ?auto_788086 ?auto_788087 ) ( CLEAR ?auto_788086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_788074 ?auto_788075 ?auto_788076 ?auto_788077 ?auto_788078 ?auto_788079 ?auto_788080 ?auto_788081 ?auto_788082 ?auto_788083 ?auto_788084 ?auto_788085 ?auto_788086 )
      ( MAKE-15PILE ?auto_788074 ?auto_788075 ?auto_788076 ?auto_788077 ?auto_788078 ?auto_788079 ?auto_788080 ?auto_788081 ?auto_788082 ?auto_788083 ?auto_788084 ?auto_788085 ?auto_788086 ?auto_788087 ?auto_788088 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788136 - BLOCK
      ?auto_788137 - BLOCK
      ?auto_788138 - BLOCK
      ?auto_788139 - BLOCK
      ?auto_788140 - BLOCK
      ?auto_788141 - BLOCK
      ?auto_788142 - BLOCK
      ?auto_788143 - BLOCK
      ?auto_788144 - BLOCK
      ?auto_788145 - BLOCK
      ?auto_788146 - BLOCK
      ?auto_788147 - BLOCK
      ?auto_788148 - BLOCK
      ?auto_788149 - BLOCK
      ?auto_788150 - BLOCK
    )
    :vars
    (
      ?auto_788151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788150 ?auto_788151 ) ( ON-TABLE ?auto_788136 ) ( ON ?auto_788137 ?auto_788136 ) ( ON ?auto_788138 ?auto_788137 ) ( ON ?auto_788139 ?auto_788138 ) ( ON ?auto_788140 ?auto_788139 ) ( ON ?auto_788141 ?auto_788140 ) ( ON ?auto_788142 ?auto_788141 ) ( ON ?auto_788143 ?auto_788142 ) ( ON ?auto_788144 ?auto_788143 ) ( ON ?auto_788145 ?auto_788144 ) ( ON ?auto_788146 ?auto_788145 ) ( not ( = ?auto_788136 ?auto_788137 ) ) ( not ( = ?auto_788136 ?auto_788138 ) ) ( not ( = ?auto_788136 ?auto_788139 ) ) ( not ( = ?auto_788136 ?auto_788140 ) ) ( not ( = ?auto_788136 ?auto_788141 ) ) ( not ( = ?auto_788136 ?auto_788142 ) ) ( not ( = ?auto_788136 ?auto_788143 ) ) ( not ( = ?auto_788136 ?auto_788144 ) ) ( not ( = ?auto_788136 ?auto_788145 ) ) ( not ( = ?auto_788136 ?auto_788146 ) ) ( not ( = ?auto_788136 ?auto_788147 ) ) ( not ( = ?auto_788136 ?auto_788148 ) ) ( not ( = ?auto_788136 ?auto_788149 ) ) ( not ( = ?auto_788136 ?auto_788150 ) ) ( not ( = ?auto_788136 ?auto_788151 ) ) ( not ( = ?auto_788137 ?auto_788138 ) ) ( not ( = ?auto_788137 ?auto_788139 ) ) ( not ( = ?auto_788137 ?auto_788140 ) ) ( not ( = ?auto_788137 ?auto_788141 ) ) ( not ( = ?auto_788137 ?auto_788142 ) ) ( not ( = ?auto_788137 ?auto_788143 ) ) ( not ( = ?auto_788137 ?auto_788144 ) ) ( not ( = ?auto_788137 ?auto_788145 ) ) ( not ( = ?auto_788137 ?auto_788146 ) ) ( not ( = ?auto_788137 ?auto_788147 ) ) ( not ( = ?auto_788137 ?auto_788148 ) ) ( not ( = ?auto_788137 ?auto_788149 ) ) ( not ( = ?auto_788137 ?auto_788150 ) ) ( not ( = ?auto_788137 ?auto_788151 ) ) ( not ( = ?auto_788138 ?auto_788139 ) ) ( not ( = ?auto_788138 ?auto_788140 ) ) ( not ( = ?auto_788138 ?auto_788141 ) ) ( not ( = ?auto_788138 ?auto_788142 ) ) ( not ( = ?auto_788138 ?auto_788143 ) ) ( not ( = ?auto_788138 ?auto_788144 ) ) ( not ( = ?auto_788138 ?auto_788145 ) ) ( not ( = ?auto_788138 ?auto_788146 ) ) ( not ( = ?auto_788138 ?auto_788147 ) ) ( not ( = ?auto_788138 ?auto_788148 ) ) ( not ( = ?auto_788138 ?auto_788149 ) ) ( not ( = ?auto_788138 ?auto_788150 ) ) ( not ( = ?auto_788138 ?auto_788151 ) ) ( not ( = ?auto_788139 ?auto_788140 ) ) ( not ( = ?auto_788139 ?auto_788141 ) ) ( not ( = ?auto_788139 ?auto_788142 ) ) ( not ( = ?auto_788139 ?auto_788143 ) ) ( not ( = ?auto_788139 ?auto_788144 ) ) ( not ( = ?auto_788139 ?auto_788145 ) ) ( not ( = ?auto_788139 ?auto_788146 ) ) ( not ( = ?auto_788139 ?auto_788147 ) ) ( not ( = ?auto_788139 ?auto_788148 ) ) ( not ( = ?auto_788139 ?auto_788149 ) ) ( not ( = ?auto_788139 ?auto_788150 ) ) ( not ( = ?auto_788139 ?auto_788151 ) ) ( not ( = ?auto_788140 ?auto_788141 ) ) ( not ( = ?auto_788140 ?auto_788142 ) ) ( not ( = ?auto_788140 ?auto_788143 ) ) ( not ( = ?auto_788140 ?auto_788144 ) ) ( not ( = ?auto_788140 ?auto_788145 ) ) ( not ( = ?auto_788140 ?auto_788146 ) ) ( not ( = ?auto_788140 ?auto_788147 ) ) ( not ( = ?auto_788140 ?auto_788148 ) ) ( not ( = ?auto_788140 ?auto_788149 ) ) ( not ( = ?auto_788140 ?auto_788150 ) ) ( not ( = ?auto_788140 ?auto_788151 ) ) ( not ( = ?auto_788141 ?auto_788142 ) ) ( not ( = ?auto_788141 ?auto_788143 ) ) ( not ( = ?auto_788141 ?auto_788144 ) ) ( not ( = ?auto_788141 ?auto_788145 ) ) ( not ( = ?auto_788141 ?auto_788146 ) ) ( not ( = ?auto_788141 ?auto_788147 ) ) ( not ( = ?auto_788141 ?auto_788148 ) ) ( not ( = ?auto_788141 ?auto_788149 ) ) ( not ( = ?auto_788141 ?auto_788150 ) ) ( not ( = ?auto_788141 ?auto_788151 ) ) ( not ( = ?auto_788142 ?auto_788143 ) ) ( not ( = ?auto_788142 ?auto_788144 ) ) ( not ( = ?auto_788142 ?auto_788145 ) ) ( not ( = ?auto_788142 ?auto_788146 ) ) ( not ( = ?auto_788142 ?auto_788147 ) ) ( not ( = ?auto_788142 ?auto_788148 ) ) ( not ( = ?auto_788142 ?auto_788149 ) ) ( not ( = ?auto_788142 ?auto_788150 ) ) ( not ( = ?auto_788142 ?auto_788151 ) ) ( not ( = ?auto_788143 ?auto_788144 ) ) ( not ( = ?auto_788143 ?auto_788145 ) ) ( not ( = ?auto_788143 ?auto_788146 ) ) ( not ( = ?auto_788143 ?auto_788147 ) ) ( not ( = ?auto_788143 ?auto_788148 ) ) ( not ( = ?auto_788143 ?auto_788149 ) ) ( not ( = ?auto_788143 ?auto_788150 ) ) ( not ( = ?auto_788143 ?auto_788151 ) ) ( not ( = ?auto_788144 ?auto_788145 ) ) ( not ( = ?auto_788144 ?auto_788146 ) ) ( not ( = ?auto_788144 ?auto_788147 ) ) ( not ( = ?auto_788144 ?auto_788148 ) ) ( not ( = ?auto_788144 ?auto_788149 ) ) ( not ( = ?auto_788144 ?auto_788150 ) ) ( not ( = ?auto_788144 ?auto_788151 ) ) ( not ( = ?auto_788145 ?auto_788146 ) ) ( not ( = ?auto_788145 ?auto_788147 ) ) ( not ( = ?auto_788145 ?auto_788148 ) ) ( not ( = ?auto_788145 ?auto_788149 ) ) ( not ( = ?auto_788145 ?auto_788150 ) ) ( not ( = ?auto_788145 ?auto_788151 ) ) ( not ( = ?auto_788146 ?auto_788147 ) ) ( not ( = ?auto_788146 ?auto_788148 ) ) ( not ( = ?auto_788146 ?auto_788149 ) ) ( not ( = ?auto_788146 ?auto_788150 ) ) ( not ( = ?auto_788146 ?auto_788151 ) ) ( not ( = ?auto_788147 ?auto_788148 ) ) ( not ( = ?auto_788147 ?auto_788149 ) ) ( not ( = ?auto_788147 ?auto_788150 ) ) ( not ( = ?auto_788147 ?auto_788151 ) ) ( not ( = ?auto_788148 ?auto_788149 ) ) ( not ( = ?auto_788148 ?auto_788150 ) ) ( not ( = ?auto_788148 ?auto_788151 ) ) ( not ( = ?auto_788149 ?auto_788150 ) ) ( not ( = ?auto_788149 ?auto_788151 ) ) ( not ( = ?auto_788150 ?auto_788151 ) ) ( ON ?auto_788149 ?auto_788150 ) ( ON ?auto_788148 ?auto_788149 ) ( CLEAR ?auto_788146 ) ( ON ?auto_788147 ?auto_788148 ) ( CLEAR ?auto_788147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_788136 ?auto_788137 ?auto_788138 ?auto_788139 ?auto_788140 ?auto_788141 ?auto_788142 ?auto_788143 ?auto_788144 ?auto_788145 ?auto_788146 ?auto_788147 )
      ( MAKE-15PILE ?auto_788136 ?auto_788137 ?auto_788138 ?auto_788139 ?auto_788140 ?auto_788141 ?auto_788142 ?auto_788143 ?auto_788144 ?auto_788145 ?auto_788146 ?auto_788147 ?auto_788148 ?auto_788149 ?auto_788150 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788198 - BLOCK
      ?auto_788199 - BLOCK
      ?auto_788200 - BLOCK
      ?auto_788201 - BLOCK
      ?auto_788202 - BLOCK
      ?auto_788203 - BLOCK
      ?auto_788204 - BLOCK
      ?auto_788205 - BLOCK
      ?auto_788206 - BLOCK
      ?auto_788207 - BLOCK
      ?auto_788208 - BLOCK
      ?auto_788209 - BLOCK
      ?auto_788210 - BLOCK
      ?auto_788211 - BLOCK
      ?auto_788212 - BLOCK
    )
    :vars
    (
      ?auto_788213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788212 ?auto_788213 ) ( ON-TABLE ?auto_788198 ) ( ON ?auto_788199 ?auto_788198 ) ( ON ?auto_788200 ?auto_788199 ) ( ON ?auto_788201 ?auto_788200 ) ( ON ?auto_788202 ?auto_788201 ) ( ON ?auto_788203 ?auto_788202 ) ( ON ?auto_788204 ?auto_788203 ) ( ON ?auto_788205 ?auto_788204 ) ( ON ?auto_788206 ?auto_788205 ) ( ON ?auto_788207 ?auto_788206 ) ( not ( = ?auto_788198 ?auto_788199 ) ) ( not ( = ?auto_788198 ?auto_788200 ) ) ( not ( = ?auto_788198 ?auto_788201 ) ) ( not ( = ?auto_788198 ?auto_788202 ) ) ( not ( = ?auto_788198 ?auto_788203 ) ) ( not ( = ?auto_788198 ?auto_788204 ) ) ( not ( = ?auto_788198 ?auto_788205 ) ) ( not ( = ?auto_788198 ?auto_788206 ) ) ( not ( = ?auto_788198 ?auto_788207 ) ) ( not ( = ?auto_788198 ?auto_788208 ) ) ( not ( = ?auto_788198 ?auto_788209 ) ) ( not ( = ?auto_788198 ?auto_788210 ) ) ( not ( = ?auto_788198 ?auto_788211 ) ) ( not ( = ?auto_788198 ?auto_788212 ) ) ( not ( = ?auto_788198 ?auto_788213 ) ) ( not ( = ?auto_788199 ?auto_788200 ) ) ( not ( = ?auto_788199 ?auto_788201 ) ) ( not ( = ?auto_788199 ?auto_788202 ) ) ( not ( = ?auto_788199 ?auto_788203 ) ) ( not ( = ?auto_788199 ?auto_788204 ) ) ( not ( = ?auto_788199 ?auto_788205 ) ) ( not ( = ?auto_788199 ?auto_788206 ) ) ( not ( = ?auto_788199 ?auto_788207 ) ) ( not ( = ?auto_788199 ?auto_788208 ) ) ( not ( = ?auto_788199 ?auto_788209 ) ) ( not ( = ?auto_788199 ?auto_788210 ) ) ( not ( = ?auto_788199 ?auto_788211 ) ) ( not ( = ?auto_788199 ?auto_788212 ) ) ( not ( = ?auto_788199 ?auto_788213 ) ) ( not ( = ?auto_788200 ?auto_788201 ) ) ( not ( = ?auto_788200 ?auto_788202 ) ) ( not ( = ?auto_788200 ?auto_788203 ) ) ( not ( = ?auto_788200 ?auto_788204 ) ) ( not ( = ?auto_788200 ?auto_788205 ) ) ( not ( = ?auto_788200 ?auto_788206 ) ) ( not ( = ?auto_788200 ?auto_788207 ) ) ( not ( = ?auto_788200 ?auto_788208 ) ) ( not ( = ?auto_788200 ?auto_788209 ) ) ( not ( = ?auto_788200 ?auto_788210 ) ) ( not ( = ?auto_788200 ?auto_788211 ) ) ( not ( = ?auto_788200 ?auto_788212 ) ) ( not ( = ?auto_788200 ?auto_788213 ) ) ( not ( = ?auto_788201 ?auto_788202 ) ) ( not ( = ?auto_788201 ?auto_788203 ) ) ( not ( = ?auto_788201 ?auto_788204 ) ) ( not ( = ?auto_788201 ?auto_788205 ) ) ( not ( = ?auto_788201 ?auto_788206 ) ) ( not ( = ?auto_788201 ?auto_788207 ) ) ( not ( = ?auto_788201 ?auto_788208 ) ) ( not ( = ?auto_788201 ?auto_788209 ) ) ( not ( = ?auto_788201 ?auto_788210 ) ) ( not ( = ?auto_788201 ?auto_788211 ) ) ( not ( = ?auto_788201 ?auto_788212 ) ) ( not ( = ?auto_788201 ?auto_788213 ) ) ( not ( = ?auto_788202 ?auto_788203 ) ) ( not ( = ?auto_788202 ?auto_788204 ) ) ( not ( = ?auto_788202 ?auto_788205 ) ) ( not ( = ?auto_788202 ?auto_788206 ) ) ( not ( = ?auto_788202 ?auto_788207 ) ) ( not ( = ?auto_788202 ?auto_788208 ) ) ( not ( = ?auto_788202 ?auto_788209 ) ) ( not ( = ?auto_788202 ?auto_788210 ) ) ( not ( = ?auto_788202 ?auto_788211 ) ) ( not ( = ?auto_788202 ?auto_788212 ) ) ( not ( = ?auto_788202 ?auto_788213 ) ) ( not ( = ?auto_788203 ?auto_788204 ) ) ( not ( = ?auto_788203 ?auto_788205 ) ) ( not ( = ?auto_788203 ?auto_788206 ) ) ( not ( = ?auto_788203 ?auto_788207 ) ) ( not ( = ?auto_788203 ?auto_788208 ) ) ( not ( = ?auto_788203 ?auto_788209 ) ) ( not ( = ?auto_788203 ?auto_788210 ) ) ( not ( = ?auto_788203 ?auto_788211 ) ) ( not ( = ?auto_788203 ?auto_788212 ) ) ( not ( = ?auto_788203 ?auto_788213 ) ) ( not ( = ?auto_788204 ?auto_788205 ) ) ( not ( = ?auto_788204 ?auto_788206 ) ) ( not ( = ?auto_788204 ?auto_788207 ) ) ( not ( = ?auto_788204 ?auto_788208 ) ) ( not ( = ?auto_788204 ?auto_788209 ) ) ( not ( = ?auto_788204 ?auto_788210 ) ) ( not ( = ?auto_788204 ?auto_788211 ) ) ( not ( = ?auto_788204 ?auto_788212 ) ) ( not ( = ?auto_788204 ?auto_788213 ) ) ( not ( = ?auto_788205 ?auto_788206 ) ) ( not ( = ?auto_788205 ?auto_788207 ) ) ( not ( = ?auto_788205 ?auto_788208 ) ) ( not ( = ?auto_788205 ?auto_788209 ) ) ( not ( = ?auto_788205 ?auto_788210 ) ) ( not ( = ?auto_788205 ?auto_788211 ) ) ( not ( = ?auto_788205 ?auto_788212 ) ) ( not ( = ?auto_788205 ?auto_788213 ) ) ( not ( = ?auto_788206 ?auto_788207 ) ) ( not ( = ?auto_788206 ?auto_788208 ) ) ( not ( = ?auto_788206 ?auto_788209 ) ) ( not ( = ?auto_788206 ?auto_788210 ) ) ( not ( = ?auto_788206 ?auto_788211 ) ) ( not ( = ?auto_788206 ?auto_788212 ) ) ( not ( = ?auto_788206 ?auto_788213 ) ) ( not ( = ?auto_788207 ?auto_788208 ) ) ( not ( = ?auto_788207 ?auto_788209 ) ) ( not ( = ?auto_788207 ?auto_788210 ) ) ( not ( = ?auto_788207 ?auto_788211 ) ) ( not ( = ?auto_788207 ?auto_788212 ) ) ( not ( = ?auto_788207 ?auto_788213 ) ) ( not ( = ?auto_788208 ?auto_788209 ) ) ( not ( = ?auto_788208 ?auto_788210 ) ) ( not ( = ?auto_788208 ?auto_788211 ) ) ( not ( = ?auto_788208 ?auto_788212 ) ) ( not ( = ?auto_788208 ?auto_788213 ) ) ( not ( = ?auto_788209 ?auto_788210 ) ) ( not ( = ?auto_788209 ?auto_788211 ) ) ( not ( = ?auto_788209 ?auto_788212 ) ) ( not ( = ?auto_788209 ?auto_788213 ) ) ( not ( = ?auto_788210 ?auto_788211 ) ) ( not ( = ?auto_788210 ?auto_788212 ) ) ( not ( = ?auto_788210 ?auto_788213 ) ) ( not ( = ?auto_788211 ?auto_788212 ) ) ( not ( = ?auto_788211 ?auto_788213 ) ) ( not ( = ?auto_788212 ?auto_788213 ) ) ( ON ?auto_788211 ?auto_788212 ) ( ON ?auto_788210 ?auto_788211 ) ( ON ?auto_788209 ?auto_788210 ) ( CLEAR ?auto_788207 ) ( ON ?auto_788208 ?auto_788209 ) ( CLEAR ?auto_788208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_788198 ?auto_788199 ?auto_788200 ?auto_788201 ?auto_788202 ?auto_788203 ?auto_788204 ?auto_788205 ?auto_788206 ?auto_788207 ?auto_788208 )
      ( MAKE-15PILE ?auto_788198 ?auto_788199 ?auto_788200 ?auto_788201 ?auto_788202 ?auto_788203 ?auto_788204 ?auto_788205 ?auto_788206 ?auto_788207 ?auto_788208 ?auto_788209 ?auto_788210 ?auto_788211 ?auto_788212 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788260 - BLOCK
      ?auto_788261 - BLOCK
      ?auto_788262 - BLOCK
      ?auto_788263 - BLOCK
      ?auto_788264 - BLOCK
      ?auto_788265 - BLOCK
      ?auto_788266 - BLOCK
      ?auto_788267 - BLOCK
      ?auto_788268 - BLOCK
      ?auto_788269 - BLOCK
      ?auto_788270 - BLOCK
      ?auto_788271 - BLOCK
      ?auto_788272 - BLOCK
      ?auto_788273 - BLOCK
      ?auto_788274 - BLOCK
    )
    :vars
    (
      ?auto_788275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788274 ?auto_788275 ) ( ON-TABLE ?auto_788260 ) ( ON ?auto_788261 ?auto_788260 ) ( ON ?auto_788262 ?auto_788261 ) ( ON ?auto_788263 ?auto_788262 ) ( ON ?auto_788264 ?auto_788263 ) ( ON ?auto_788265 ?auto_788264 ) ( ON ?auto_788266 ?auto_788265 ) ( ON ?auto_788267 ?auto_788266 ) ( ON ?auto_788268 ?auto_788267 ) ( not ( = ?auto_788260 ?auto_788261 ) ) ( not ( = ?auto_788260 ?auto_788262 ) ) ( not ( = ?auto_788260 ?auto_788263 ) ) ( not ( = ?auto_788260 ?auto_788264 ) ) ( not ( = ?auto_788260 ?auto_788265 ) ) ( not ( = ?auto_788260 ?auto_788266 ) ) ( not ( = ?auto_788260 ?auto_788267 ) ) ( not ( = ?auto_788260 ?auto_788268 ) ) ( not ( = ?auto_788260 ?auto_788269 ) ) ( not ( = ?auto_788260 ?auto_788270 ) ) ( not ( = ?auto_788260 ?auto_788271 ) ) ( not ( = ?auto_788260 ?auto_788272 ) ) ( not ( = ?auto_788260 ?auto_788273 ) ) ( not ( = ?auto_788260 ?auto_788274 ) ) ( not ( = ?auto_788260 ?auto_788275 ) ) ( not ( = ?auto_788261 ?auto_788262 ) ) ( not ( = ?auto_788261 ?auto_788263 ) ) ( not ( = ?auto_788261 ?auto_788264 ) ) ( not ( = ?auto_788261 ?auto_788265 ) ) ( not ( = ?auto_788261 ?auto_788266 ) ) ( not ( = ?auto_788261 ?auto_788267 ) ) ( not ( = ?auto_788261 ?auto_788268 ) ) ( not ( = ?auto_788261 ?auto_788269 ) ) ( not ( = ?auto_788261 ?auto_788270 ) ) ( not ( = ?auto_788261 ?auto_788271 ) ) ( not ( = ?auto_788261 ?auto_788272 ) ) ( not ( = ?auto_788261 ?auto_788273 ) ) ( not ( = ?auto_788261 ?auto_788274 ) ) ( not ( = ?auto_788261 ?auto_788275 ) ) ( not ( = ?auto_788262 ?auto_788263 ) ) ( not ( = ?auto_788262 ?auto_788264 ) ) ( not ( = ?auto_788262 ?auto_788265 ) ) ( not ( = ?auto_788262 ?auto_788266 ) ) ( not ( = ?auto_788262 ?auto_788267 ) ) ( not ( = ?auto_788262 ?auto_788268 ) ) ( not ( = ?auto_788262 ?auto_788269 ) ) ( not ( = ?auto_788262 ?auto_788270 ) ) ( not ( = ?auto_788262 ?auto_788271 ) ) ( not ( = ?auto_788262 ?auto_788272 ) ) ( not ( = ?auto_788262 ?auto_788273 ) ) ( not ( = ?auto_788262 ?auto_788274 ) ) ( not ( = ?auto_788262 ?auto_788275 ) ) ( not ( = ?auto_788263 ?auto_788264 ) ) ( not ( = ?auto_788263 ?auto_788265 ) ) ( not ( = ?auto_788263 ?auto_788266 ) ) ( not ( = ?auto_788263 ?auto_788267 ) ) ( not ( = ?auto_788263 ?auto_788268 ) ) ( not ( = ?auto_788263 ?auto_788269 ) ) ( not ( = ?auto_788263 ?auto_788270 ) ) ( not ( = ?auto_788263 ?auto_788271 ) ) ( not ( = ?auto_788263 ?auto_788272 ) ) ( not ( = ?auto_788263 ?auto_788273 ) ) ( not ( = ?auto_788263 ?auto_788274 ) ) ( not ( = ?auto_788263 ?auto_788275 ) ) ( not ( = ?auto_788264 ?auto_788265 ) ) ( not ( = ?auto_788264 ?auto_788266 ) ) ( not ( = ?auto_788264 ?auto_788267 ) ) ( not ( = ?auto_788264 ?auto_788268 ) ) ( not ( = ?auto_788264 ?auto_788269 ) ) ( not ( = ?auto_788264 ?auto_788270 ) ) ( not ( = ?auto_788264 ?auto_788271 ) ) ( not ( = ?auto_788264 ?auto_788272 ) ) ( not ( = ?auto_788264 ?auto_788273 ) ) ( not ( = ?auto_788264 ?auto_788274 ) ) ( not ( = ?auto_788264 ?auto_788275 ) ) ( not ( = ?auto_788265 ?auto_788266 ) ) ( not ( = ?auto_788265 ?auto_788267 ) ) ( not ( = ?auto_788265 ?auto_788268 ) ) ( not ( = ?auto_788265 ?auto_788269 ) ) ( not ( = ?auto_788265 ?auto_788270 ) ) ( not ( = ?auto_788265 ?auto_788271 ) ) ( not ( = ?auto_788265 ?auto_788272 ) ) ( not ( = ?auto_788265 ?auto_788273 ) ) ( not ( = ?auto_788265 ?auto_788274 ) ) ( not ( = ?auto_788265 ?auto_788275 ) ) ( not ( = ?auto_788266 ?auto_788267 ) ) ( not ( = ?auto_788266 ?auto_788268 ) ) ( not ( = ?auto_788266 ?auto_788269 ) ) ( not ( = ?auto_788266 ?auto_788270 ) ) ( not ( = ?auto_788266 ?auto_788271 ) ) ( not ( = ?auto_788266 ?auto_788272 ) ) ( not ( = ?auto_788266 ?auto_788273 ) ) ( not ( = ?auto_788266 ?auto_788274 ) ) ( not ( = ?auto_788266 ?auto_788275 ) ) ( not ( = ?auto_788267 ?auto_788268 ) ) ( not ( = ?auto_788267 ?auto_788269 ) ) ( not ( = ?auto_788267 ?auto_788270 ) ) ( not ( = ?auto_788267 ?auto_788271 ) ) ( not ( = ?auto_788267 ?auto_788272 ) ) ( not ( = ?auto_788267 ?auto_788273 ) ) ( not ( = ?auto_788267 ?auto_788274 ) ) ( not ( = ?auto_788267 ?auto_788275 ) ) ( not ( = ?auto_788268 ?auto_788269 ) ) ( not ( = ?auto_788268 ?auto_788270 ) ) ( not ( = ?auto_788268 ?auto_788271 ) ) ( not ( = ?auto_788268 ?auto_788272 ) ) ( not ( = ?auto_788268 ?auto_788273 ) ) ( not ( = ?auto_788268 ?auto_788274 ) ) ( not ( = ?auto_788268 ?auto_788275 ) ) ( not ( = ?auto_788269 ?auto_788270 ) ) ( not ( = ?auto_788269 ?auto_788271 ) ) ( not ( = ?auto_788269 ?auto_788272 ) ) ( not ( = ?auto_788269 ?auto_788273 ) ) ( not ( = ?auto_788269 ?auto_788274 ) ) ( not ( = ?auto_788269 ?auto_788275 ) ) ( not ( = ?auto_788270 ?auto_788271 ) ) ( not ( = ?auto_788270 ?auto_788272 ) ) ( not ( = ?auto_788270 ?auto_788273 ) ) ( not ( = ?auto_788270 ?auto_788274 ) ) ( not ( = ?auto_788270 ?auto_788275 ) ) ( not ( = ?auto_788271 ?auto_788272 ) ) ( not ( = ?auto_788271 ?auto_788273 ) ) ( not ( = ?auto_788271 ?auto_788274 ) ) ( not ( = ?auto_788271 ?auto_788275 ) ) ( not ( = ?auto_788272 ?auto_788273 ) ) ( not ( = ?auto_788272 ?auto_788274 ) ) ( not ( = ?auto_788272 ?auto_788275 ) ) ( not ( = ?auto_788273 ?auto_788274 ) ) ( not ( = ?auto_788273 ?auto_788275 ) ) ( not ( = ?auto_788274 ?auto_788275 ) ) ( ON ?auto_788273 ?auto_788274 ) ( ON ?auto_788272 ?auto_788273 ) ( ON ?auto_788271 ?auto_788272 ) ( ON ?auto_788270 ?auto_788271 ) ( CLEAR ?auto_788268 ) ( ON ?auto_788269 ?auto_788270 ) ( CLEAR ?auto_788269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_788260 ?auto_788261 ?auto_788262 ?auto_788263 ?auto_788264 ?auto_788265 ?auto_788266 ?auto_788267 ?auto_788268 ?auto_788269 )
      ( MAKE-15PILE ?auto_788260 ?auto_788261 ?auto_788262 ?auto_788263 ?auto_788264 ?auto_788265 ?auto_788266 ?auto_788267 ?auto_788268 ?auto_788269 ?auto_788270 ?auto_788271 ?auto_788272 ?auto_788273 ?auto_788274 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788322 - BLOCK
      ?auto_788323 - BLOCK
      ?auto_788324 - BLOCK
      ?auto_788325 - BLOCK
      ?auto_788326 - BLOCK
      ?auto_788327 - BLOCK
      ?auto_788328 - BLOCK
      ?auto_788329 - BLOCK
      ?auto_788330 - BLOCK
      ?auto_788331 - BLOCK
      ?auto_788332 - BLOCK
      ?auto_788333 - BLOCK
      ?auto_788334 - BLOCK
      ?auto_788335 - BLOCK
      ?auto_788336 - BLOCK
    )
    :vars
    (
      ?auto_788337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788336 ?auto_788337 ) ( ON-TABLE ?auto_788322 ) ( ON ?auto_788323 ?auto_788322 ) ( ON ?auto_788324 ?auto_788323 ) ( ON ?auto_788325 ?auto_788324 ) ( ON ?auto_788326 ?auto_788325 ) ( ON ?auto_788327 ?auto_788326 ) ( ON ?auto_788328 ?auto_788327 ) ( ON ?auto_788329 ?auto_788328 ) ( not ( = ?auto_788322 ?auto_788323 ) ) ( not ( = ?auto_788322 ?auto_788324 ) ) ( not ( = ?auto_788322 ?auto_788325 ) ) ( not ( = ?auto_788322 ?auto_788326 ) ) ( not ( = ?auto_788322 ?auto_788327 ) ) ( not ( = ?auto_788322 ?auto_788328 ) ) ( not ( = ?auto_788322 ?auto_788329 ) ) ( not ( = ?auto_788322 ?auto_788330 ) ) ( not ( = ?auto_788322 ?auto_788331 ) ) ( not ( = ?auto_788322 ?auto_788332 ) ) ( not ( = ?auto_788322 ?auto_788333 ) ) ( not ( = ?auto_788322 ?auto_788334 ) ) ( not ( = ?auto_788322 ?auto_788335 ) ) ( not ( = ?auto_788322 ?auto_788336 ) ) ( not ( = ?auto_788322 ?auto_788337 ) ) ( not ( = ?auto_788323 ?auto_788324 ) ) ( not ( = ?auto_788323 ?auto_788325 ) ) ( not ( = ?auto_788323 ?auto_788326 ) ) ( not ( = ?auto_788323 ?auto_788327 ) ) ( not ( = ?auto_788323 ?auto_788328 ) ) ( not ( = ?auto_788323 ?auto_788329 ) ) ( not ( = ?auto_788323 ?auto_788330 ) ) ( not ( = ?auto_788323 ?auto_788331 ) ) ( not ( = ?auto_788323 ?auto_788332 ) ) ( not ( = ?auto_788323 ?auto_788333 ) ) ( not ( = ?auto_788323 ?auto_788334 ) ) ( not ( = ?auto_788323 ?auto_788335 ) ) ( not ( = ?auto_788323 ?auto_788336 ) ) ( not ( = ?auto_788323 ?auto_788337 ) ) ( not ( = ?auto_788324 ?auto_788325 ) ) ( not ( = ?auto_788324 ?auto_788326 ) ) ( not ( = ?auto_788324 ?auto_788327 ) ) ( not ( = ?auto_788324 ?auto_788328 ) ) ( not ( = ?auto_788324 ?auto_788329 ) ) ( not ( = ?auto_788324 ?auto_788330 ) ) ( not ( = ?auto_788324 ?auto_788331 ) ) ( not ( = ?auto_788324 ?auto_788332 ) ) ( not ( = ?auto_788324 ?auto_788333 ) ) ( not ( = ?auto_788324 ?auto_788334 ) ) ( not ( = ?auto_788324 ?auto_788335 ) ) ( not ( = ?auto_788324 ?auto_788336 ) ) ( not ( = ?auto_788324 ?auto_788337 ) ) ( not ( = ?auto_788325 ?auto_788326 ) ) ( not ( = ?auto_788325 ?auto_788327 ) ) ( not ( = ?auto_788325 ?auto_788328 ) ) ( not ( = ?auto_788325 ?auto_788329 ) ) ( not ( = ?auto_788325 ?auto_788330 ) ) ( not ( = ?auto_788325 ?auto_788331 ) ) ( not ( = ?auto_788325 ?auto_788332 ) ) ( not ( = ?auto_788325 ?auto_788333 ) ) ( not ( = ?auto_788325 ?auto_788334 ) ) ( not ( = ?auto_788325 ?auto_788335 ) ) ( not ( = ?auto_788325 ?auto_788336 ) ) ( not ( = ?auto_788325 ?auto_788337 ) ) ( not ( = ?auto_788326 ?auto_788327 ) ) ( not ( = ?auto_788326 ?auto_788328 ) ) ( not ( = ?auto_788326 ?auto_788329 ) ) ( not ( = ?auto_788326 ?auto_788330 ) ) ( not ( = ?auto_788326 ?auto_788331 ) ) ( not ( = ?auto_788326 ?auto_788332 ) ) ( not ( = ?auto_788326 ?auto_788333 ) ) ( not ( = ?auto_788326 ?auto_788334 ) ) ( not ( = ?auto_788326 ?auto_788335 ) ) ( not ( = ?auto_788326 ?auto_788336 ) ) ( not ( = ?auto_788326 ?auto_788337 ) ) ( not ( = ?auto_788327 ?auto_788328 ) ) ( not ( = ?auto_788327 ?auto_788329 ) ) ( not ( = ?auto_788327 ?auto_788330 ) ) ( not ( = ?auto_788327 ?auto_788331 ) ) ( not ( = ?auto_788327 ?auto_788332 ) ) ( not ( = ?auto_788327 ?auto_788333 ) ) ( not ( = ?auto_788327 ?auto_788334 ) ) ( not ( = ?auto_788327 ?auto_788335 ) ) ( not ( = ?auto_788327 ?auto_788336 ) ) ( not ( = ?auto_788327 ?auto_788337 ) ) ( not ( = ?auto_788328 ?auto_788329 ) ) ( not ( = ?auto_788328 ?auto_788330 ) ) ( not ( = ?auto_788328 ?auto_788331 ) ) ( not ( = ?auto_788328 ?auto_788332 ) ) ( not ( = ?auto_788328 ?auto_788333 ) ) ( not ( = ?auto_788328 ?auto_788334 ) ) ( not ( = ?auto_788328 ?auto_788335 ) ) ( not ( = ?auto_788328 ?auto_788336 ) ) ( not ( = ?auto_788328 ?auto_788337 ) ) ( not ( = ?auto_788329 ?auto_788330 ) ) ( not ( = ?auto_788329 ?auto_788331 ) ) ( not ( = ?auto_788329 ?auto_788332 ) ) ( not ( = ?auto_788329 ?auto_788333 ) ) ( not ( = ?auto_788329 ?auto_788334 ) ) ( not ( = ?auto_788329 ?auto_788335 ) ) ( not ( = ?auto_788329 ?auto_788336 ) ) ( not ( = ?auto_788329 ?auto_788337 ) ) ( not ( = ?auto_788330 ?auto_788331 ) ) ( not ( = ?auto_788330 ?auto_788332 ) ) ( not ( = ?auto_788330 ?auto_788333 ) ) ( not ( = ?auto_788330 ?auto_788334 ) ) ( not ( = ?auto_788330 ?auto_788335 ) ) ( not ( = ?auto_788330 ?auto_788336 ) ) ( not ( = ?auto_788330 ?auto_788337 ) ) ( not ( = ?auto_788331 ?auto_788332 ) ) ( not ( = ?auto_788331 ?auto_788333 ) ) ( not ( = ?auto_788331 ?auto_788334 ) ) ( not ( = ?auto_788331 ?auto_788335 ) ) ( not ( = ?auto_788331 ?auto_788336 ) ) ( not ( = ?auto_788331 ?auto_788337 ) ) ( not ( = ?auto_788332 ?auto_788333 ) ) ( not ( = ?auto_788332 ?auto_788334 ) ) ( not ( = ?auto_788332 ?auto_788335 ) ) ( not ( = ?auto_788332 ?auto_788336 ) ) ( not ( = ?auto_788332 ?auto_788337 ) ) ( not ( = ?auto_788333 ?auto_788334 ) ) ( not ( = ?auto_788333 ?auto_788335 ) ) ( not ( = ?auto_788333 ?auto_788336 ) ) ( not ( = ?auto_788333 ?auto_788337 ) ) ( not ( = ?auto_788334 ?auto_788335 ) ) ( not ( = ?auto_788334 ?auto_788336 ) ) ( not ( = ?auto_788334 ?auto_788337 ) ) ( not ( = ?auto_788335 ?auto_788336 ) ) ( not ( = ?auto_788335 ?auto_788337 ) ) ( not ( = ?auto_788336 ?auto_788337 ) ) ( ON ?auto_788335 ?auto_788336 ) ( ON ?auto_788334 ?auto_788335 ) ( ON ?auto_788333 ?auto_788334 ) ( ON ?auto_788332 ?auto_788333 ) ( ON ?auto_788331 ?auto_788332 ) ( CLEAR ?auto_788329 ) ( ON ?auto_788330 ?auto_788331 ) ( CLEAR ?auto_788330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_788322 ?auto_788323 ?auto_788324 ?auto_788325 ?auto_788326 ?auto_788327 ?auto_788328 ?auto_788329 ?auto_788330 )
      ( MAKE-15PILE ?auto_788322 ?auto_788323 ?auto_788324 ?auto_788325 ?auto_788326 ?auto_788327 ?auto_788328 ?auto_788329 ?auto_788330 ?auto_788331 ?auto_788332 ?auto_788333 ?auto_788334 ?auto_788335 ?auto_788336 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788384 - BLOCK
      ?auto_788385 - BLOCK
      ?auto_788386 - BLOCK
      ?auto_788387 - BLOCK
      ?auto_788388 - BLOCK
      ?auto_788389 - BLOCK
      ?auto_788390 - BLOCK
      ?auto_788391 - BLOCK
      ?auto_788392 - BLOCK
      ?auto_788393 - BLOCK
      ?auto_788394 - BLOCK
      ?auto_788395 - BLOCK
      ?auto_788396 - BLOCK
      ?auto_788397 - BLOCK
      ?auto_788398 - BLOCK
    )
    :vars
    (
      ?auto_788399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788398 ?auto_788399 ) ( ON-TABLE ?auto_788384 ) ( ON ?auto_788385 ?auto_788384 ) ( ON ?auto_788386 ?auto_788385 ) ( ON ?auto_788387 ?auto_788386 ) ( ON ?auto_788388 ?auto_788387 ) ( ON ?auto_788389 ?auto_788388 ) ( ON ?auto_788390 ?auto_788389 ) ( not ( = ?auto_788384 ?auto_788385 ) ) ( not ( = ?auto_788384 ?auto_788386 ) ) ( not ( = ?auto_788384 ?auto_788387 ) ) ( not ( = ?auto_788384 ?auto_788388 ) ) ( not ( = ?auto_788384 ?auto_788389 ) ) ( not ( = ?auto_788384 ?auto_788390 ) ) ( not ( = ?auto_788384 ?auto_788391 ) ) ( not ( = ?auto_788384 ?auto_788392 ) ) ( not ( = ?auto_788384 ?auto_788393 ) ) ( not ( = ?auto_788384 ?auto_788394 ) ) ( not ( = ?auto_788384 ?auto_788395 ) ) ( not ( = ?auto_788384 ?auto_788396 ) ) ( not ( = ?auto_788384 ?auto_788397 ) ) ( not ( = ?auto_788384 ?auto_788398 ) ) ( not ( = ?auto_788384 ?auto_788399 ) ) ( not ( = ?auto_788385 ?auto_788386 ) ) ( not ( = ?auto_788385 ?auto_788387 ) ) ( not ( = ?auto_788385 ?auto_788388 ) ) ( not ( = ?auto_788385 ?auto_788389 ) ) ( not ( = ?auto_788385 ?auto_788390 ) ) ( not ( = ?auto_788385 ?auto_788391 ) ) ( not ( = ?auto_788385 ?auto_788392 ) ) ( not ( = ?auto_788385 ?auto_788393 ) ) ( not ( = ?auto_788385 ?auto_788394 ) ) ( not ( = ?auto_788385 ?auto_788395 ) ) ( not ( = ?auto_788385 ?auto_788396 ) ) ( not ( = ?auto_788385 ?auto_788397 ) ) ( not ( = ?auto_788385 ?auto_788398 ) ) ( not ( = ?auto_788385 ?auto_788399 ) ) ( not ( = ?auto_788386 ?auto_788387 ) ) ( not ( = ?auto_788386 ?auto_788388 ) ) ( not ( = ?auto_788386 ?auto_788389 ) ) ( not ( = ?auto_788386 ?auto_788390 ) ) ( not ( = ?auto_788386 ?auto_788391 ) ) ( not ( = ?auto_788386 ?auto_788392 ) ) ( not ( = ?auto_788386 ?auto_788393 ) ) ( not ( = ?auto_788386 ?auto_788394 ) ) ( not ( = ?auto_788386 ?auto_788395 ) ) ( not ( = ?auto_788386 ?auto_788396 ) ) ( not ( = ?auto_788386 ?auto_788397 ) ) ( not ( = ?auto_788386 ?auto_788398 ) ) ( not ( = ?auto_788386 ?auto_788399 ) ) ( not ( = ?auto_788387 ?auto_788388 ) ) ( not ( = ?auto_788387 ?auto_788389 ) ) ( not ( = ?auto_788387 ?auto_788390 ) ) ( not ( = ?auto_788387 ?auto_788391 ) ) ( not ( = ?auto_788387 ?auto_788392 ) ) ( not ( = ?auto_788387 ?auto_788393 ) ) ( not ( = ?auto_788387 ?auto_788394 ) ) ( not ( = ?auto_788387 ?auto_788395 ) ) ( not ( = ?auto_788387 ?auto_788396 ) ) ( not ( = ?auto_788387 ?auto_788397 ) ) ( not ( = ?auto_788387 ?auto_788398 ) ) ( not ( = ?auto_788387 ?auto_788399 ) ) ( not ( = ?auto_788388 ?auto_788389 ) ) ( not ( = ?auto_788388 ?auto_788390 ) ) ( not ( = ?auto_788388 ?auto_788391 ) ) ( not ( = ?auto_788388 ?auto_788392 ) ) ( not ( = ?auto_788388 ?auto_788393 ) ) ( not ( = ?auto_788388 ?auto_788394 ) ) ( not ( = ?auto_788388 ?auto_788395 ) ) ( not ( = ?auto_788388 ?auto_788396 ) ) ( not ( = ?auto_788388 ?auto_788397 ) ) ( not ( = ?auto_788388 ?auto_788398 ) ) ( not ( = ?auto_788388 ?auto_788399 ) ) ( not ( = ?auto_788389 ?auto_788390 ) ) ( not ( = ?auto_788389 ?auto_788391 ) ) ( not ( = ?auto_788389 ?auto_788392 ) ) ( not ( = ?auto_788389 ?auto_788393 ) ) ( not ( = ?auto_788389 ?auto_788394 ) ) ( not ( = ?auto_788389 ?auto_788395 ) ) ( not ( = ?auto_788389 ?auto_788396 ) ) ( not ( = ?auto_788389 ?auto_788397 ) ) ( not ( = ?auto_788389 ?auto_788398 ) ) ( not ( = ?auto_788389 ?auto_788399 ) ) ( not ( = ?auto_788390 ?auto_788391 ) ) ( not ( = ?auto_788390 ?auto_788392 ) ) ( not ( = ?auto_788390 ?auto_788393 ) ) ( not ( = ?auto_788390 ?auto_788394 ) ) ( not ( = ?auto_788390 ?auto_788395 ) ) ( not ( = ?auto_788390 ?auto_788396 ) ) ( not ( = ?auto_788390 ?auto_788397 ) ) ( not ( = ?auto_788390 ?auto_788398 ) ) ( not ( = ?auto_788390 ?auto_788399 ) ) ( not ( = ?auto_788391 ?auto_788392 ) ) ( not ( = ?auto_788391 ?auto_788393 ) ) ( not ( = ?auto_788391 ?auto_788394 ) ) ( not ( = ?auto_788391 ?auto_788395 ) ) ( not ( = ?auto_788391 ?auto_788396 ) ) ( not ( = ?auto_788391 ?auto_788397 ) ) ( not ( = ?auto_788391 ?auto_788398 ) ) ( not ( = ?auto_788391 ?auto_788399 ) ) ( not ( = ?auto_788392 ?auto_788393 ) ) ( not ( = ?auto_788392 ?auto_788394 ) ) ( not ( = ?auto_788392 ?auto_788395 ) ) ( not ( = ?auto_788392 ?auto_788396 ) ) ( not ( = ?auto_788392 ?auto_788397 ) ) ( not ( = ?auto_788392 ?auto_788398 ) ) ( not ( = ?auto_788392 ?auto_788399 ) ) ( not ( = ?auto_788393 ?auto_788394 ) ) ( not ( = ?auto_788393 ?auto_788395 ) ) ( not ( = ?auto_788393 ?auto_788396 ) ) ( not ( = ?auto_788393 ?auto_788397 ) ) ( not ( = ?auto_788393 ?auto_788398 ) ) ( not ( = ?auto_788393 ?auto_788399 ) ) ( not ( = ?auto_788394 ?auto_788395 ) ) ( not ( = ?auto_788394 ?auto_788396 ) ) ( not ( = ?auto_788394 ?auto_788397 ) ) ( not ( = ?auto_788394 ?auto_788398 ) ) ( not ( = ?auto_788394 ?auto_788399 ) ) ( not ( = ?auto_788395 ?auto_788396 ) ) ( not ( = ?auto_788395 ?auto_788397 ) ) ( not ( = ?auto_788395 ?auto_788398 ) ) ( not ( = ?auto_788395 ?auto_788399 ) ) ( not ( = ?auto_788396 ?auto_788397 ) ) ( not ( = ?auto_788396 ?auto_788398 ) ) ( not ( = ?auto_788396 ?auto_788399 ) ) ( not ( = ?auto_788397 ?auto_788398 ) ) ( not ( = ?auto_788397 ?auto_788399 ) ) ( not ( = ?auto_788398 ?auto_788399 ) ) ( ON ?auto_788397 ?auto_788398 ) ( ON ?auto_788396 ?auto_788397 ) ( ON ?auto_788395 ?auto_788396 ) ( ON ?auto_788394 ?auto_788395 ) ( ON ?auto_788393 ?auto_788394 ) ( ON ?auto_788392 ?auto_788393 ) ( CLEAR ?auto_788390 ) ( ON ?auto_788391 ?auto_788392 ) ( CLEAR ?auto_788391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_788384 ?auto_788385 ?auto_788386 ?auto_788387 ?auto_788388 ?auto_788389 ?auto_788390 ?auto_788391 )
      ( MAKE-15PILE ?auto_788384 ?auto_788385 ?auto_788386 ?auto_788387 ?auto_788388 ?auto_788389 ?auto_788390 ?auto_788391 ?auto_788392 ?auto_788393 ?auto_788394 ?auto_788395 ?auto_788396 ?auto_788397 ?auto_788398 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788446 - BLOCK
      ?auto_788447 - BLOCK
      ?auto_788448 - BLOCK
      ?auto_788449 - BLOCK
      ?auto_788450 - BLOCK
      ?auto_788451 - BLOCK
      ?auto_788452 - BLOCK
      ?auto_788453 - BLOCK
      ?auto_788454 - BLOCK
      ?auto_788455 - BLOCK
      ?auto_788456 - BLOCK
      ?auto_788457 - BLOCK
      ?auto_788458 - BLOCK
      ?auto_788459 - BLOCK
      ?auto_788460 - BLOCK
    )
    :vars
    (
      ?auto_788461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788460 ?auto_788461 ) ( ON-TABLE ?auto_788446 ) ( ON ?auto_788447 ?auto_788446 ) ( ON ?auto_788448 ?auto_788447 ) ( ON ?auto_788449 ?auto_788448 ) ( ON ?auto_788450 ?auto_788449 ) ( ON ?auto_788451 ?auto_788450 ) ( not ( = ?auto_788446 ?auto_788447 ) ) ( not ( = ?auto_788446 ?auto_788448 ) ) ( not ( = ?auto_788446 ?auto_788449 ) ) ( not ( = ?auto_788446 ?auto_788450 ) ) ( not ( = ?auto_788446 ?auto_788451 ) ) ( not ( = ?auto_788446 ?auto_788452 ) ) ( not ( = ?auto_788446 ?auto_788453 ) ) ( not ( = ?auto_788446 ?auto_788454 ) ) ( not ( = ?auto_788446 ?auto_788455 ) ) ( not ( = ?auto_788446 ?auto_788456 ) ) ( not ( = ?auto_788446 ?auto_788457 ) ) ( not ( = ?auto_788446 ?auto_788458 ) ) ( not ( = ?auto_788446 ?auto_788459 ) ) ( not ( = ?auto_788446 ?auto_788460 ) ) ( not ( = ?auto_788446 ?auto_788461 ) ) ( not ( = ?auto_788447 ?auto_788448 ) ) ( not ( = ?auto_788447 ?auto_788449 ) ) ( not ( = ?auto_788447 ?auto_788450 ) ) ( not ( = ?auto_788447 ?auto_788451 ) ) ( not ( = ?auto_788447 ?auto_788452 ) ) ( not ( = ?auto_788447 ?auto_788453 ) ) ( not ( = ?auto_788447 ?auto_788454 ) ) ( not ( = ?auto_788447 ?auto_788455 ) ) ( not ( = ?auto_788447 ?auto_788456 ) ) ( not ( = ?auto_788447 ?auto_788457 ) ) ( not ( = ?auto_788447 ?auto_788458 ) ) ( not ( = ?auto_788447 ?auto_788459 ) ) ( not ( = ?auto_788447 ?auto_788460 ) ) ( not ( = ?auto_788447 ?auto_788461 ) ) ( not ( = ?auto_788448 ?auto_788449 ) ) ( not ( = ?auto_788448 ?auto_788450 ) ) ( not ( = ?auto_788448 ?auto_788451 ) ) ( not ( = ?auto_788448 ?auto_788452 ) ) ( not ( = ?auto_788448 ?auto_788453 ) ) ( not ( = ?auto_788448 ?auto_788454 ) ) ( not ( = ?auto_788448 ?auto_788455 ) ) ( not ( = ?auto_788448 ?auto_788456 ) ) ( not ( = ?auto_788448 ?auto_788457 ) ) ( not ( = ?auto_788448 ?auto_788458 ) ) ( not ( = ?auto_788448 ?auto_788459 ) ) ( not ( = ?auto_788448 ?auto_788460 ) ) ( not ( = ?auto_788448 ?auto_788461 ) ) ( not ( = ?auto_788449 ?auto_788450 ) ) ( not ( = ?auto_788449 ?auto_788451 ) ) ( not ( = ?auto_788449 ?auto_788452 ) ) ( not ( = ?auto_788449 ?auto_788453 ) ) ( not ( = ?auto_788449 ?auto_788454 ) ) ( not ( = ?auto_788449 ?auto_788455 ) ) ( not ( = ?auto_788449 ?auto_788456 ) ) ( not ( = ?auto_788449 ?auto_788457 ) ) ( not ( = ?auto_788449 ?auto_788458 ) ) ( not ( = ?auto_788449 ?auto_788459 ) ) ( not ( = ?auto_788449 ?auto_788460 ) ) ( not ( = ?auto_788449 ?auto_788461 ) ) ( not ( = ?auto_788450 ?auto_788451 ) ) ( not ( = ?auto_788450 ?auto_788452 ) ) ( not ( = ?auto_788450 ?auto_788453 ) ) ( not ( = ?auto_788450 ?auto_788454 ) ) ( not ( = ?auto_788450 ?auto_788455 ) ) ( not ( = ?auto_788450 ?auto_788456 ) ) ( not ( = ?auto_788450 ?auto_788457 ) ) ( not ( = ?auto_788450 ?auto_788458 ) ) ( not ( = ?auto_788450 ?auto_788459 ) ) ( not ( = ?auto_788450 ?auto_788460 ) ) ( not ( = ?auto_788450 ?auto_788461 ) ) ( not ( = ?auto_788451 ?auto_788452 ) ) ( not ( = ?auto_788451 ?auto_788453 ) ) ( not ( = ?auto_788451 ?auto_788454 ) ) ( not ( = ?auto_788451 ?auto_788455 ) ) ( not ( = ?auto_788451 ?auto_788456 ) ) ( not ( = ?auto_788451 ?auto_788457 ) ) ( not ( = ?auto_788451 ?auto_788458 ) ) ( not ( = ?auto_788451 ?auto_788459 ) ) ( not ( = ?auto_788451 ?auto_788460 ) ) ( not ( = ?auto_788451 ?auto_788461 ) ) ( not ( = ?auto_788452 ?auto_788453 ) ) ( not ( = ?auto_788452 ?auto_788454 ) ) ( not ( = ?auto_788452 ?auto_788455 ) ) ( not ( = ?auto_788452 ?auto_788456 ) ) ( not ( = ?auto_788452 ?auto_788457 ) ) ( not ( = ?auto_788452 ?auto_788458 ) ) ( not ( = ?auto_788452 ?auto_788459 ) ) ( not ( = ?auto_788452 ?auto_788460 ) ) ( not ( = ?auto_788452 ?auto_788461 ) ) ( not ( = ?auto_788453 ?auto_788454 ) ) ( not ( = ?auto_788453 ?auto_788455 ) ) ( not ( = ?auto_788453 ?auto_788456 ) ) ( not ( = ?auto_788453 ?auto_788457 ) ) ( not ( = ?auto_788453 ?auto_788458 ) ) ( not ( = ?auto_788453 ?auto_788459 ) ) ( not ( = ?auto_788453 ?auto_788460 ) ) ( not ( = ?auto_788453 ?auto_788461 ) ) ( not ( = ?auto_788454 ?auto_788455 ) ) ( not ( = ?auto_788454 ?auto_788456 ) ) ( not ( = ?auto_788454 ?auto_788457 ) ) ( not ( = ?auto_788454 ?auto_788458 ) ) ( not ( = ?auto_788454 ?auto_788459 ) ) ( not ( = ?auto_788454 ?auto_788460 ) ) ( not ( = ?auto_788454 ?auto_788461 ) ) ( not ( = ?auto_788455 ?auto_788456 ) ) ( not ( = ?auto_788455 ?auto_788457 ) ) ( not ( = ?auto_788455 ?auto_788458 ) ) ( not ( = ?auto_788455 ?auto_788459 ) ) ( not ( = ?auto_788455 ?auto_788460 ) ) ( not ( = ?auto_788455 ?auto_788461 ) ) ( not ( = ?auto_788456 ?auto_788457 ) ) ( not ( = ?auto_788456 ?auto_788458 ) ) ( not ( = ?auto_788456 ?auto_788459 ) ) ( not ( = ?auto_788456 ?auto_788460 ) ) ( not ( = ?auto_788456 ?auto_788461 ) ) ( not ( = ?auto_788457 ?auto_788458 ) ) ( not ( = ?auto_788457 ?auto_788459 ) ) ( not ( = ?auto_788457 ?auto_788460 ) ) ( not ( = ?auto_788457 ?auto_788461 ) ) ( not ( = ?auto_788458 ?auto_788459 ) ) ( not ( = ?auto_788458 ?auto_788460 ) ) ( not ( = ?auto_788458 ?auto_788461 ) ) ( not ( = ?auto_788459 ?auto_788460 ) ) ( not ( = ?auto_788459 ?auto_788461 ) ) ( not ( = ?auto_788460 ?auto_788461 ) ) ( ON ?auto_788459 ?auto_788460 ) ( ON ?auto_788458 ?auto_788459 ) ( ON ?auto_788457 ?auto_788458 ) ( ON ?auto_788456 ?auto_788457 ) ( ON ?auto_788455 ?auto_788456 ) ( ON ?auto_788454 ?auto_788455 ) ( ON ?auto_788453 ?auto_788454 ) ( CLEAR ?auto_788451 ) ( ON ?auto_788452 ?auto_788453 ) ( CLEAR ?auto_788452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_788446 ?auto_788447 ?auto_788448 ?auto_788449 ?auto_788450 ?auto_788451 ?auto_788452 )
      ( MAKE-15PILE ?auto_788446 ?auto_788447 ?auto_788448 ?auto_788449 ?auto_788450 ?auto_788451 ?auto_788452 ?auto_788453 ?auto_788454 ?auto_788455 ?auto_788456 ?auto_788457 ?auto_788458 ?auto_788459 ?auto_788460 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788508 - BLOCK
      ?auto_788509 - BLOCK
      ?auto_788510 - BLOCK
      ?auto_788511 - BLOCK
      ?auto_788512 - BLOCK
      ?auto_788513 - BLOCK
      ?auto_788514 - BLOCK
      ?auto_788515 - BLOCK
      ?auto_788516 - BLOCK
      ?auto_788517 - BLOCK
      ?auto_788518 - BLOCK
      ?auto_788519 - BLOCK
      ?auto_788520 - BLOCK
      ?auto_788521 - BLOCK
      ?auto_788522 - BLOCK
    )
    :vars
    (
      ?auto_788523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788522 ?auto_788523 ) ( ON-TABLE ?auto_788508 ) ( ON ?auto_788509 ?auto_788508 ) ( ON ?auto_788510 ?auto_788509 ) ( ON ?auto_788511 ?auto_788510 ) ( ON ?auto_788512 ?auto_788511 ) ( not ( = ?auto_788508 ?auto_788509 ) ) ( not ( = ?auto_788508 ?auto_788510 ) ) ( not ( = ?auto_788508 ?auto_788511 ) ) ( not ( = ?auto_788508 ?auto_788512 ) ) ( not ( = ?auto_788508 ?auto_788513 ) ) ( not ( = ?auto_788508 ?auto_788514 ) ) ( not ( = ?auto_788508 ?auto_788515 ) ) ( not ( = ?auto_788508 ?auto_788516 ) ) ( not ( = ?auto_788508 ?auto_788517 ) ) ( not ( = ?auto_788508 ?auto_788518 ) ) ( not ( = ?auto_788508 ?auto_788519 ) ) ( not ( = ?auto_788508 ?auto_788520 ) ) ( not ( = ?auto_788508 ?auto_788521 ) ) ( not ( = ?auto_788508 ?auto_788522 ) ) ( not ( = ?auto_788508 ?auto_788523 ) ) ( not ( = ?auto_788509 ?auto_788510 ) ) ( not ( = ?auto_788509 ?auto_788511 ) ) ( not ( = ?auto_788509 ?auto_788512 ) ) ( not ( = ?auto_788509 ?auto_788513 ) ) ( not ( = ?auto_788509 ?auto_788514 ) ) ( not ( = ?auto_788509 ?auto_788515 ) ) ( not ( = ?auto_788509 ?auto_788516 ) ) ( not ( = ?auto_788509 ?auto_788517 ) ) ( not ( = ?auto_788509 ?auto_788518 ) ) ( not ( = ?auto_788509 ?auto_788519 ) ) ( not ( = ?auto_788509 ?auto_788520 ) ) ( not ( = ?auto_788509 ?auto_788521 ) ) ( not ( = ?auto_788509 ?auto_788522 ) ) ( not ( = ?auto_788509 ?auto_788523 ) ) ( not ( = ?auto_788510 ?auto_788511 ) ) ( not ( = ?auto_788510 ?auto_788512 ) ) ( not ( = ?auto_788510 ?auto_788513 ) ) ( not ( = ?auto_788510 ?auto_788514 ) ) ( not ( = ?auto_788510 ?auto_788515 ) ) ( not ( = ?auto_788510 ?auto_788516 ) ) ( not ( = ?auto_788510 ?auto_788517 ) ) ( not ( = ?auto_788510 ?auto_788518 ) ) ( not ( = ?auto_788510 ?auto_788519 ) ) ( not ( = ?auto_788510 ?auto_788520 ) ) ( not ( = ?auto_788510 ?auto_788521 ) ) ( not ( = ?auto_788510 ?auto_788522 ) ) ( not ( = ?auto_788510 ?auto_788523 ) ) ( not ( = ?auto_788511 ?auto_788512 ) ) ( not ( = ?auto_788511 ?auto_788513 ) ) ( not ( = ?auto_788511 ?auto_788514 ) ) ( not ( = ?auto_788511 ?auto_788515 ) ) ( not ( = ?auto_788511 ?auto_788516 ) ) ( not ( = ?auto_788511 ?auto_788517 ) ) ( not ( = ?auto_788511 ?auto_788518 ) ) ( not ( = ?auto_788511 ?auto_788519 ) ) ( not ( = ?auto_788511 ?auto_788520 ) ) ( not ( = ?auto_788511 ?auto_788521 ) ) ( not ( = ?auto_788511 ?auto_788522 ) ) ( not ( = ?auto_788511 ?auto_788523 ) ) ( not ( = ?auto_788512 ?auto_788513 ) ) ( not ( = ?auto_788512 ?auto_788514 ) ) ( not ( = ?auto_788512 ?auto_788515 ) ) ( not ( = ?auto_788512 ?auto_788516 ) ) ( not ( = ?auto_788512 ?auto_788517 ) ) ( not ( = ?auto_788512 ?auto_788518 ) ) ( not ( = ?auto_788512 ?auto_788519 ) ) ( not ( = ?auto_788512 ?auto_788520 ) ) ( not ( = ?auto_788512 ?auto_788521 ) ) ( not ( = ?auto_788512 ?auto_788522 ) ) ( not ( = ?auto_788512 ?auto_788523 ) ) ( not ( = ?auto_788513 ?auto_788514 ) ) ( not ( = ?auto_788513 ?auto_788515 ) ) ( not ( = ?auto_788513 ?auto_788516 ) ) ( not ( = ?auto_788513 ?auto_788517 ) ) ( not ( = ?auto_788513 ?auto_788518 ) ) ( not ( = ?auto_788513 ?auto_788519 ) ) ( not ( = ?auto_788513 ?auto_788520 ) ) ( not ( = ?auto_788513 ?auto_788521 ) ) ( not ( = ?auto_788513 ?auto_788522 ) ) ( not ( = ?auto_788513 ?auto_788523 ) ) ( not ( = ?auto_788514 ?auto_788515 ) ) ( not ( = ?auto_788514 ?auto_788516 ) ) ( not ( = ?auto_788514 ?auto_788517 ) ) ( not ( = ?auto_788514 ?auto_788518 ) ) ( not ( = ?auto_788514 ?auto_788519 ) ) ( not ( = ?auto_788514 ?auto_788520 ) ) ( not ( = ?auto_788514 ?auto_788521 ) ) ( not ( = ?auto_788514 ?auto_788522 ) ) ( not ( = ?auto_788514 ?auto_788523 ) ) ( not ( = ?auto_788515 ?auto_788516 ) ) ( not ( = ?auto_788515 ?auto_788517 ) ) ( not ( = ?auto_788515 ?auto_788518 ) ) ( not ( = ?auto_788515 ?auto_788519 ) ) ( not ( = ?auto_788515 ?auto_788520 ) ) ( not ( = ?auto_788515 ?auto_788521 ) ) ( not ( = ?auto_788515 ?auto_788522 ) ) ( not ( = ?auto_788515 ?auto_788523 ) ) ( not ( = ?auto_788516 ?auto_788517 ) ) ( not ( = ?auto_788516 ?auto_788518 ) ) ( not ( = ?auto_788516 ?auto_788519 ) ) ( not ( = ?auto_788516 ?auto_788520 ) ) ( not ( = ?auto_788516 ?auto_788521 ) ) ( not ( = ?auto_788516 ?auto_788522 ) ) ( not ( = ?auto_788516 ?auto_788523 ) ) ( not ( = ?auto_788517 ?auto_788518 ) ) ( not ( = ?auto_788517 ?auto_788519 ) ) ( not ( = ?auto_788517 ?auto_788520 ) ) ( not ( = ?auto_788517 ?auto_788521 ) ) ( not ( = ?auto_788517 ?auto_788522 ) ) ( not ( = ?auto_788517 ?auto_788523 ) ) ( not ( = ?auto_788518 ?auto_788519 ) ) ( not ( = ?auto_788518 ?auto_788520 ) ) ( not ( = ?auto_788518 ?auto_788521 ) ) ( not ( = ?auto_788518 ?auto_788522 ) ) ( not ( = ?auto_788518 ?auto_788523 ) ) ( not ( = ?auto_788519 ?auto_788520 ) ) ( not ( = ?auto_788519 ?auto_788521 ) ) ( not ( = ?auto_788519 ?auto_788522 ) ) ( not ( = ?auto_788519 ?auto_788523 ) ) ( not ( = ?auto_788520 ?auto_788521 ) ) ( not ( = ?auto_788520 ?auto_788522 ) ) ( not ( = ?auto_788520 ?auto_788523 ) ) ( not ( = ?auto_788521 ?auto_788522 ) ) ( not ( = ?auto_788521 ?auto_788523 ) ) ( not ( = ?auto_788522 ?auto_788523 ) ) ( ON ?auto_788521 ?auto_788522 ) ( ON ?auto_788520 ?auto_788521 ) ( ON ?auto_788519 ?auto_788520 ) ( ON ?auto_788518 ?auto_788519 ) ( ON ?auto_788517 ?auto_788518 ) ( ON ?auto_788516 ?auto_788517 ) ( ON ?auto_788515 ?auto_788516 ) ( ON ?auto_788514 ?auto_788515 ) ( CLEAR ?auto_788512 ) ( ON ?auto_788513 ?auto_788514 ) ( CLEAR ?auto_788513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_788508 ?auto_788509 ?auto_788510 ?auto_788511 ?auto_788512 ?auto_788513 )
      ( MAKE-15PILE ?auto_788508 ?auto_788509 ?auto_788510 ?auto_788511 ?auto_788512 ?auto_788513 ?auto_788514 ?auto_788515 ?auto_788516 ?auto_788517 ?auto_788518 ?auto_788519 ?auto_788520 ?auto_788521 ?auto_788522 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788570 - BLOCK
      ?auto_788571 - BLOCK
      ?auto_788572 - BLOCK
      ?auto_788573 - BLOCK
      ?auto_788574 - BLOCK
      ?auto_788575 - BLOCK
      ?auto_788576 - BLOCK
      ?auto_788577 - BLOCK
      ?auto_788578 - BLOCK
      ?auto_788579 - BLOCK
      ?auto_788580 - BLOCK
      ?auto_788581 - BLOCK
      ?auto_788582 - BLOCK
      ?auto_788583 - BLOCK
      ?auto_788584 - BLOCK
    )
    :vars
    (
      ?auto_788585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788584 ?auto_788585 ) ( ON-TABLE ?auto_788570 ) ( ON ?auto_788571 ?auto_788570 ) ( ON ?auto_788572 ?auto_788571 ) ( ON ?auto_788573 ?auto_788572 ) ( not ( = ?auto_788570 ?auto_788571 ) ) ( not ( = ?auto_788570 ?auto_788572 ) ) ( not ( = ?auto_788570 ?auto_788573 ) ) ( not ( = ?auto_788570 ?auto_788574 ) ) ( not ( = ?auto_788570 ?auto_788575 ) ) ( not ( = ?auto_788570 ?auto_788576 ) ) ( not ( = ?auto_788570 ?auto_788577 ) ) ( not ( = ?auto_788570 ?auto_788578 ) ) ( not ( = ?auto_788570 ?auto_788579 ) ) ( not ( = ?auto_788570 ?auto_788580 ) ) ( not ( = ?auto_788570 ?auto_788581 ) ) ( not ( = ?auto_788570 ?auto_788582 ) ) ( not ( = ?auto_788570 ?auto_788583 ) ) ( not ( = ?auto_788570 ?auto_788584 ) ) ( not ( = ?auto_788570 ?auto_788585 ) ) ( not ( = ?auto_788571 ?auto_788572 ) ) ( not ( = ?auto_788571 ?auto_788573 ) ) ( not ( = ?auto_788571 ?auto_788574 ) ) ( not ( = ?auto_788571 ?auto_788575 ) ) ( not ( = ?auto_788571 ?auto_788576 ) ) ( not ( = ?auto_788571 ?auto_788577 ) ) ( not ( = ?auto_788571 ?auto_788578 ) ) ( not ( = ?auto_788571 ?auto_788579 ) ) ( not ( = ?auto_788571 ?auto_788580 ) ) ( not ( = ?auto_788571 ?auto_788581 ) ) ( not ( = ?auto_788571 ?auto_788582 ) ) ( not ( = ?auto_788571 ?auto_788583 ) ) ( not ( = ?auto_788571 ?auto_788584 ) ) ( not ( = ?auto_788571 ?auto_788585 ) ) ( not ( = ?auto_788572 ?auto_788573 ) ) ( not ( = ?auto_788572 ?auto_788574 ) ) ( not ( = ?auto_788572 ?auto_788575 ) ) ( not ( = ?auto_788572 ?auto_788576 ) ) ( not ( = ?auto_788572 ?auto_788577 ) ) ( not ( = ?auto_788572 ?auto_788578 ) ) ( not ( = ?auto_788572 ?auto_788579 ) ) ( not ( = ?auto_788572 ?auto_788580 ) ) ( not ( = ?auto_788572 ?auto_788581 ) ) ( not ( = ?auto_788572 ?auto_788582 ) ) ( not ( = ?auto_788572 ?auto_788583 ) ) ( not ( = ?auto_788572 ?auto_788584 ) ) ( not ( = ?auto_788572 ?auto_788585 ) ) ( not ( = ?auto_788573 ?auto_788574 ) ) ( not ( = ?auto_788573 ?auto_788575 ) ) ( not ( = ?auto_788573 ?auto_788576 ) ) ( not ( = ?auto_788573 ?auto_788577 ) ) ( not ( = ?auto_788573 ?auto_788578 ) ) ( not ( = ?auto_788573 ?auto_788579 ) ) ( not ( = ?auto_788573 ?auto_788580 ) ) ( not ( = ?auto_788573 ?auto_788581 ) ) ( not ( = ?auto_788573 ?auto_788582 ) ) ( not ( = ?auto_788573 ?auto_788583 ) ) ( not ( = ?auto_788573 ?auto_788584 ) ) ( not ( = ?auto_788573 ?auto_788585 ) ) ( not ( = ?auto_788574 ?auto_788575 ) ) ( not ( = ?auto_788574 ?auto_788576 ) ) ( not ( = ?auto_788574 ?auto_788577 ) ) ( not ( = ?auto_788574 ?auto_788578 ) ) ( not ( = ?auto_788574 ?auto_788579 ) ) ( not ( = ?auto_788574 ?auto_788580 ) ) ( not ( = ?auto_788574 ?auto_788581 ) ) ( not ( = ?auto_788574 ?auto_788582 ) ) ( not ( = ?auto_788574 ?auto_788583 ) ) ( not ( = ?auto_788574 ?auto_788584 ) ) ( not ( = ?auto_788574 ?auto_788585 ) ) ( not ( = ?auto_788575 ?auto_788576 ) ) ( not ( = ?auto_788575 ?auto_788577 ) ) ( not ( = ?auto_788575 ?auto_788578 ) ) ( not ( = ?auto_788575 ?auto_788579 ) ) ( not ( = ?auto_788575 ?auto_788580 ) ) ( not ( = ?auto_788575 ?auto_788581 ) ) ( not ( = ?auto_788575 ?auto_788582 ) ) ( not ( = ?auto_788575 ?auto_788583 ) ) ( not ( = ?auto_788575 ?auto_788584 ) ) ( not ( = ?auto_788575 ?auto_788585 ) ) ( not ( = ?auto_788576 ?auto_788577 ) ) ( not ( = ?auto_788576 ?auto_788578 ) ) ( not ( = ?auto_788576 ?auto_788579 ) ) ( not ( = ?auto_788576 ?auto_788580 ) ) ( not ( = ?auto_788576 ?auto_788581 ) ) ( not ( = ?auto_788576 ?auto_788582 ) ) ( not ( = ?auto_788576 ?auto_788583 ) ) ( not ( = ?auto_788576 ?auto_788584 ) ) ( not ( = ?auto_788576 ?auto_788585 ) ) ( not ( = ?auto_788577 ?auto_788578 ) ) ( not ( = ?auto_788577 ?auto_788579 ) ) ( not ( = ?auto_788577 ?auto_788580 ) ) ( not ( = ?auto_788577 ?auto_788581 ) ) ( not ( = ?auto_788577 ?auto_788582 ) ) ( not ( = ?auto_788577 ?auto_788583 ) ) ( not ( = ?auto_788577 ?auto_788584 ) ) ( not ( = ?auto_788577 ?auto_788585 ) ) ( not ( = ?auto_788578 ?auto_788579 ) ) ( not ( = ?auto_788578 ?auto_788580 ) ) ( not ( = ?auto_788578 ?auto_788581 ) ) ( not ( = ?auto_788578 ?auto_788582 ) ) ( not ( = ?auto_788578 ?auto_788583 ) ) ( not ( = ?auto_788578 ?auto_788584 ) ) ( not ( = ?auto_788578 ?auto_788585 ) ) ( not ( = ?auto_788579 ?auto_788580 ) ) ( not ( = ?auto_788579 ?auto_788581 ) ) ( not ( = ?auto_788579 ?auto_788582 ) ) ( not ( = ?auto_788579 ?auto_788583 ) ) ( not ( = ?auto_788579 ?auto_788584 ) ) ( not ( = ?auto_788579 ?auto_788585 ) ) ( not ( = ?auto_788580 ?auto_788581 ) ) ( not ( = ?auto_788580 ?auto_788582 ) ) ( not ( = ?auto_788580 ?auto_788583 ) ) ( not ( = ?auto_788580 ?auto_788584 ) ) ( not ( = ?auto_788580 ?auto_788585 ) ) ( not ( = ?auto_788581 ?auto_788582 ) ) ( not ( = ?auto_788581 ?auto_788583 ) ) ( not ( = ?auto_788581 ?auto_788584 ) ) ( not ( = ?auto_788581 ?auto_788585 ) ) ( not ( = ?auto_788582 ?auto_788583 ) ) ( not ( = ?auto_788582 ?auto_788584 ) ) ( not ( = ?auto_788582 ?auto_788585 ) ) ( not ( = ?auto_788583 ?auto_788584 ) ) ( not ( = ?auto_788583 ?auto_788585 ) ) ( not ( = ?auto_788584 ?auto_788585 ) ) ( ON ?auto_788583 ?auto_788584 ) ( ON ?auto_788582 ?auto_788583 ) ( ON ?auto_788581 ?auto_788582 ) ( ON ?auto_788580 ?auto_788581 ) ( ON ?auto_788579 ?auto_788580 ) ( ON ?auto_788578 ?auto_788579 ) ( ON ?auto_788577 ?auto_788578 ) ( ON ?auto_788576 ?auto_788577 ) ( ON ?auto_788575 ?auto_788576 ) ( CLEAR ?auto_788573 ) ( ON ?auto_788574 ?auto_788575 ) ( CLEAR ?auto_788574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_788570 ?auto_788571 ?auto_788572 ?auto_788573 ?auto_788574 )
      ( MAKE-15PILE ?auto_788570 ?auto_788571 ?auto_788572 ?auto_788573 ?auto_788574 ?auto_788575 ?auto_788576 ?auto_788577 ?auto_788578 ?auto_788579 ?auto_788580 ?auto_788581 ?auto_788582 ?auto_788583 ?auto_788584 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788632 - BLOCK
      ?auto_788633 - BLOCK
      ?auto_788634 - BLOCK
      ?auto_788635 - BLOCK
      ?auto_788636 - BLOCK
      ?auto_788637 - BLOCK
      ?auto_788638 - BLOCK
      ?auto_788639 - BLOCK
      ?auto_788640 - BLOCK
      ?auto_788641 - BLOCK
      ?auto_788642 - BLOCK
      ?auto_788643 - BLOCK
      ?auto_788644 - BLOCK
      ?auto_788645 - BLOCK
      ?auto_788646 - BLOCK
    )
    :vars
    (
      ?auto_788647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788646 ?auto_788647 ) ( ON-TABLE ?auto_788632 ) ( ON ?auto_788633 ?auto_788632 ) ( ON ?auto_788634 ?auto_788633 ) ( not ( = ?auto_788632 ?auto_788633 ) ) ( not ( = ?auto_788632 ?auto_788634 ) ) ( not ( = ?auto_788632 ?auto_788635 ) ) ( not ( = ?auto_788632 ?auto_788636 ) ) ( not ( = ?auto_788632 ?auto_788637 ) ) ( not ( = ?auto_788632 ?auto_788638 ) ) ( not ( = ?auto_788632 ?auto_788639 ) ) ( not ( = ?auto_788632 ?auto_788640 ) ) ( not ( = ?auto_788632 ?auto_788641 ) ) ( not ( = ?auto_788632 ?auto_788642 ) ) ( not ( = ?auto_788632 ?auto_788643 ) ) ( not ( = ?auto_788632 ?auto_788644 ) ) ( not ( = ?auto_788632 ?auto_788645 ) ) ( not ( = ?auto_788632 ?auto_788646 ) ) ( not ( = ?auto_788632 ?auto_788647 ) ) ( not ( = ?auto_788633 ?auto_788634 ) ) ( not ( = ?auto_788633 ?auto_788635 ) ) ( not ( = ?auto_788633 ?auto_788636 ) ) ( not ( = ?auto_788633 ?auto_788637 ) ) ( not ( = ?auto_788633 ?auto_788638 ) ) ( not ( = ?auto_788633 ?auto_788639 ) ) ( not ( = ?auto_788633 ?auto_788640 ) ) ( not ( = ?auto_788633 ?auto_788641 ) ) ( not ( = ?auto_788633 ?auto_788642 ) ) ( not ( = ?auto_788633 ?auto_788643 ) ) ( not ( = ?auto_788633 ?auto_788644 ) ) ( not ( = ?auto_788633 ?auto_788645 ) ) ( not ( = ?auto_788633 ?auto_788646 ) ) ( not ( = ?auto_788633 ?auto_788647 ) ) ( not ( = ?auto_788634 ?auto_788635 ) ) ( not ( = ?auto_788634 ?auto_788636 ) ) ( not ( = ?auto_788634 ?auto_788637 ) ) ( not ( = ?auto_788634 ?auto_788638 ) ) ( not ( = ?auto_788634 ?auto_788639 ) ) ( not ( = ?auto_788634 ?auto_788640 ) ) ( not ( = ?auto_788634 ?auto_788641 ) ) ( not ( = ?auto_788634 ?auto_788642 ) ) ( not ( = ?auto_788634 ?auto_788643 ) ) ( not ( = ?auto_788634 ?auto_788644 ) ) ( not ( = ?auto_788634 ?auto_788645 ) ) ( not ( = ?auto_788634 ?auto_788646 ) ) ( not ( = ?auto_788634 ?auto_788647 ) ) ( not ( = ?auto_788635 ?auto_788636 ) ) ( not ( = ?auto_788635 ?auto_788637 ) ) ( not ( = ?auto_788635 ?auto_788638 ) ) ( not ( = ?auto_788635 ?auto_788639 ) ) ( not ( = ?auto_788635 ?auto_788640 ) ) ( not ( = ?auto_788635 ?auto_788641 ) ) ( not ( = ?auto_788635 ?auto_788642 ) ) ( not ( = ?auto_788635 ?auto_788643 ) ) ( not ( = ?auto_788635 ?auto_788644 ) ) ( not ( = ?auto_788635 ?auto_788645 ) ) ( not ( = ?auto_788635 ?auto_788646 ) ) ( not ( = ?auto_788635 ?auto_788647 ) ) ( not ( = ?auto_788636 ?auto_788637 ) ) ( not ( = ?auto_788636 ?auto_788638 ) ) ( not ( = ?auto_788636 ?auto_788639 ) ) ( not ( = ?auto_788636 ?auto_788640 ) ) ( not ( = ?auto_788636 ?auto_788641 ) ) ( not ( = ?auto_788636 ?auto_788642 ) ) ( not ( = ?auto_788636 ?auto_788643 ) ) ( not ( = ?auto_788636 ?auto_788644 ) ) ( not ( = ?auto_788636 ?auto_788645 ) ) ( not ( = ?auto_788636 ?auto_788646 ) ) ( not ( = ?auto_788636 ?auto_788647 ) ) ( not ( = ?auto_788637 ?auto_788638 ) ) ( not ( = ?auto_788637 ?auto_788639 ) ) ( not ( = ?auto_788637 ?auto_788640 ) ) ( not ( = ?auto_788637 ?auto_788641 ) ) ( not ( = ?auto_788637 ?auto_788642 ) ) ( not ( = ?auto_788637 ?auto_788643 ) ) ( not ( = ?auto_788637 ?auto_788644 ) ) ( not ( = ?auto_788637 ?auto_788645 ) ) ( not ( = ?auto_788637 ?auto_788646 ) ) ( not ( = ?auto_788637 ?auto_788647 ) ) ( not ( = ?auto_788638 ?auto_788639 ) ) ( not ( = ?auto_788638 ?auto_788640 ) ) ( not ( = ?auto_788638 ?auto_788641 ) ) ( not ( = ?auto_788638 ?auto_788642 ) ) ( not ( = ?auto_788638 ?auto_788643 ) ) ( not ( = ?auto_788638 ?auto_788644 ) ) ( not ( = ?auto_788638 ?auto_788645 ) ) ( not ( = ?auto_788638 ?auto_788646 ) ) ( not ( = ?auto_788638 ?auto_788647 ) ) ( not ( = ?auto_788639 ?auto_788640 ) ) ( not ( = ?auto_788639 ?auto_788641 ) ) ( not ( = ?auto_788639 ?auto_788642 ) ) ( not ( = ?auto_788639 ?auto_788643 ) ) ( not ( = ?auto_788639 ?auto_788644 ) ) ( not ( = ?auto_788639 ?auto_788645 ) ) ( not ( = ?auto_788639 ?auto_788646 ) ) ( not ( = ?auto_788639 ?auto_788647 ) ) ( not ( = ?auto_788640 ?auto_788641 ) ) ( not ( = ?auto_788640 ?auto_788642 ) ) ( not ( = ?auto_788640 ?auto_788643 ) ) ( not ( = ?auto_788640 ?auto_788644 ) ) ( not ( = ?auto_788640 ?auto_788645 ) ) ( not ( = ?auto_788640 ?auto_788646 ) ) ( not ( = ?auto_788640 ?auto_788647 ) ) ( not ( = ?auto_788641 ?auto_788642 ) ) ( not ( = ?auto_788641 ?auto_788643 ) ) ( not ( = ?auto_788641 ?auto_788644 ) ) ( not ( = ?auto_788641 ?auto_788645 ) ) ( not ( = ?auto_788641 ?auto_788646 ) ) ( not ( = ?auto_788641 ?auto_788647 ) ) ( not ( = ?auto_788642 ?auto_788643 ) ) ( not ( = ?auto_788642 ?auto_788644 ) ) ( not ( = ?auto_788642 ?auto_788645 ) ) ( not ( = ?auto_788642 ?auto_788646 ) ) ( not ( = ?auto_788642 ?auto_788647 ) ) ( not ( = ?auto_788643 ?auto_788644 ) ) ( not ( = ?auto_788643 ?auto_788645 ) ) ( not ( = ?auto_788643 ?auto_788646 ) ) ( not ( = ?auto_788643 ?auto_788647 ) ) ( not ( = ?auto_788644 ?auto_788645 ) ) ( not ( = ?auto_788644 ?auto_788646 ) ) ( not ( = ?auto_788644 ?auto_788647 ) ) ( not ( = ?auto_788645 ?auto_788646 ) ) ( not ( = ?auto_788645 ?auto_788647 ) ) ( not ( = ?auto_788646 ?auto_788647 ) ) ( ON ?auto_788645 ?auto_788646 ) ( ON ?auto_788644 ?auto_788645 ) ( ON ?auto_788643 ?auto_788644 ) ( ON ?auto_788642 ?auto_788643 ) ( ON ?auto_788641 ?auto_788642 ) ( ON ?auto_788640 ?auto_788641 ) ( ON ?auto_788639 ?auto_788640 ) ( ON ?auto_788638 ?auto_788639 ) ( ON ?auto_788637 ?auto_788638 ) ( ON ?auto_788636 ?auto_788637 ) ( CLEAR ?auto_788634 ) ( ON ?auto_788635 ?auto_788636 ) ( CLEAR ?auto_788635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_788632 ?auto_788633 ?auto_788634 ?auto_788635 )
      ( MAKE-15PILE ?auto_788632 ?auto_788633 ?auto_788634 ?auto_788635 ?auto_788636 ?auto_788637 ?auto_788638 ?auto_788639 ?auto_788640 ?auto_788641 ?auto_788642 ?auto_788643 ?auto_788644 ?auto_788645 ?auto_788646 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788694 - BLOCK
      ?auto_788695 - BLOCK
      ?auto_788696 - BLOCK
      ?auto_788697 - BLOCK
      ?auto_788698 - BLOCK
      ?auto_788699 - BLOCK
      ?auto_788700 - BLOCK
      ?auto_788701 - BLOCK
      ?auto_788702 - BLOCK
      ?auto_788703 - BLOCK
      ?auto_788704 - BLOCK
      ?auto_788705 - BLOCK
      ?auto_788706 - BLOCK
      ?auto_788707 - BLOCK
      ?auto_788708 - BLOCK
    )
    :vars
    (
      ?auto_788709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788708 ?auto_788709 ) ( ON-TABLE ?auto_788694 ) ( ON ?auto_788695 ?auto_788694 ) ( not ( = ?auto_788694 ?auto_788695 ) ) ( not ( = ?auto_788694 ?auto_788696 ) ) ( not ( = ?auto_788694 ?auto_788697 ) ) ( not ( = ?auto_788694 ?auto_788698 ) ) ( not ( = ?auto_788694 ?auto_788699 ) ) ( not ( = ?auto_788694 ?auto_788700 ) ) ( not ( = ?auto_788694 ?auto_788701 ) ) ( not ( = ?auto_788694 ?auto_788702 ) ) ( not ( = ?auto_788694 ?auto_788703 ) ) ( not ( = ?auto_788694 ?auto_788704 ) ) ( not ( = ?auto_788694 ?auto_788705 ) ) ( not ( = ?auto_788694 ?auto_788706 ) ) ( not ( = ?auto_788694 ?auto_788707 ) ) ( not ( = ?auto_788694 ?auto_788708 ) ) ( not ( = ?auto_788694 ?auto_788709 ) ) ( not ( = ?auto_788695 ?auto_788696 ) ) ( not ( = ?auto_788695 ?auto_788697 ) ) ( not ( = ?auto_788695 ?auto_788698 ) ) ( not ( = ?auto_788695 ?auto_788699 ) ) ( not ( = ?auto_788695 ?auto_788700 ) ) ( not ( = ?auto_788695 ?auto_788701 ) ) ( not ( = ?auto_788695 ?auto_788702 ) ) ( not ( = ?auto_788695 ?auto_788703 ) ) ( not ( = ?auto_788695 ?auto_788704 ) ) ( not ( = ?auto_788695 ?auto_788705 ) ) ( not ( = ?auto_788695 ?auto_788706 ) ) ( not ( = ?auto_788695 ?auto_788707 ) ) ( not ( = ?auto_788695 ?auto_788708 ) ) ( not ( = ?auto_788695 ?auto_788709 ) ) ( not ( = ?auto_788696 ?auto_788697 ) ) ( not ( = ?auto_788696 ?auto_788698 ) ) ( not ( = ?auto_788696 ?auto_788699 ) ) ( not ( = ?auto_788696 ?auto_788700 ) ) ( not ( = ?auto_788696 ?auto_788701 ) ) ( not ( = ?auto_788696 ?auto_788702 ) ) ( not ( = ?auto_788696 ?auto_788703 ) ) ( not ( = ?auto_788696 ?auto_788704 ) ) ( not ( = ?auto_788696 ?auto_788705 ) ) ( not ( = ?auto_788696 ?auto_788706 ) ) ( not ( = ?auto_788696 ?auto_788707 ) ) ( not ( = ?auto_788696 ?auto_788708 ) ) ( not ( = ?auto_788696 ?auto_788709 ) ) ( not ( = ?auto_788697 ?auto_788698 ) ) ( not ( = ?auto_788697 ?auto_788699 ) ) ( not ( = ?auto_788697 ?auto_788700 ) ) ( not ( = ?auto_788697 ?auto_788701 ) ) ( not ( = ?auto_788697 ?auto_788702 ) ) ( not ( = ?auto_788697 ?auto_788703 ) ) ( not ( = ?auto_788697 ?auto_788704 ) ) ( not ( = ?auto_788697 ?auto_788705 ) ) ( not ( = ?auto_788697 ?auto_788706 ) ) ( not ( = ?auto_788697 ?auto_788707 ) ) ( not ( = ?auto_788697 ?auto_788708 ) ) ( not ( = ?auto_788697 ?auto_788709 ) ) ( not ( = ?auto_788698 ?auto_788699 ) ) ( not ( = ?auto_788698 ?auto_788700 ) ) ( not ( = ?auto_788698 ?auto_788701 ) ) ( not ( = ?auto_788698 ?auto_788702 ) ) ( not ( = ?auto_788698 ?auto_788703 ) ) ( not ( = ?auto_788698 ?auto_788704 ) ) ( not ( = ?auto_788698 ?auto_788705 ) ) ( not ( = ?auto_788698 ?auto_788706 ) ) ( not ( = ?auto_788698 ?auto_788707 ) ) ( not ( = ?auto_788698 ?auto_788708 ) ) ( not ( = ?auto_788698 ?auto_788709 ) ) ( not ( = ?auto_788699 ?auto_788700 ) ) ( not ( = ?auto_788699 ?auto_788701 ) ) ( not ( = ?auto_788699 ?auto_788702 ) ) ( not ( = ?auto_788699 ?auto_788703 ) ) ( not ( = ?auto_788699 ?auto_788704 ) ) ( not ( = ?auto_788699 ?auto_788705 ) ) ( not ( = ?auto_788699 ?auto_788706 ) ) ( not ( = ?auto_788699 ?auto_788707 ) ) ( not ( = ?auto_788699 ?auto_788708 ) ) ( not ( = ?auto_788699 ?auto_788709 ) ) ( not ( = ?auto_788700 ?auto_788701 ) ) ( not ( = ?auto_788700 ?auto_788702 ) ) ( not ( = ?auto_788700 ?auto_788703 ) ) ( not ( = ?auto_788700 ?auto_788704 ) ) ( not ( = ?auto_788700 ?auto_788705 ) ) ( not ( = ?auto_788700 ?auto_788706 ) ) ( not ( = ?auto_788700 ?auto_788707 ) ) ( not ( = ?auto_788700 ?auto_788708 ) ) ( not ( = ?auto_788700 ?auto_788709 ) ) ( not ( = ?auto_788701 ?auto_788702 ) ) ( not ( = ?auto_788701 ?auto_788703 ) ) ( not ( = ?auto_788701 ?auto_788704 ) ) ( not ( = ?auto_788701 ?auto_788705 ) ) ( not ( = ?auto_788701 ?auto_788706 ) ) ( not ( = ?auto_788701 ?auto_788707 ) ) ( not ( = ?auto_788701 ?auto_788708 ) ) ( not ( = ?auto_788701 ?auto_788709 ) ) ( not ( = ?auto_788702 ?auto_788703 ) ) ( not ( = ?auto_788702 ?auto_788704 ) ) ( not ( = ?auto_788702 ?auto_788705 ) ) ( not ( = ?auto_788702 ?auto_788706 ) ) ( not ( = ?auto_788702 ?auto_788707 ) ) ( not ( = ?auto_788702 ?auto_788708 ) ) ( not ( = ?auto_788702 ?auto_788709 ) ) ( not ( = ?auto_788703 ?auto_788704 ) ) ( not ( = ?auto_788703 ?auto_788705 ) ) ( not ( = ?auto_788703 ?auto_788706 ) ) ( not ( = ?auto_788703 ?auto_788707 ) ) ( not ( = ?auto_788703 ?auto_788708 ) ) ( not ( = ?auto_788703 ?auto_788709 ) ) ( not ( = ?auto_788704 ?auto_788705 ) ) ( not ( = ?auto_788704 ?auto_788706 ) ) ( not ( = ?auto_788704 ?auto_788707 ) ) ( not ( = ?auto_788704 ?auto_788708 ) ) ( not ( = ?auto_788704 ?auto_788709 ) ) ( not ( = ?auto_788705 ?auto_788706 ) ) ( not ( = ?auto_788705 ?auto_788707 ) ) ( not ( = ?auto_788705 ?auto_788708 ) ) ( not ( = ?auto_788705 ?auto_788709 ) ) ( not ( = ?auto_788706 ?auto_788707 ) ) ( not ( = ?auto_788706 ?auto_788708 ) ) ( not ( = ?auto_788706 ?auto_788709 ) ) ( not ( = ?auto_788707 ?auto_788708 ) ) ( not ( = ?auto_788707 ?auto_788709 ) ) ( not ( = ?auto_788708 ?auto_788709 ) ) ( ON ?auto_788707 ?auto_788708 ) ( ON ?auto_788706 ?auto_788707 ) ( ON ?auto_788705 ?auto_788706 ) ( ON ?auto_788704 ?auto_788705 ) ( ON ?auto_788703 ?auto_788704 ) ( ON ?auto_788702 ?auto_788703 ) ( ON ?auto_788701 ?auto_788702 ) ( ON ?auto_788700 ?auto_788701 ) ( ON ?auto_788699 ?auto_788700 ) ( ON ?auto_788698 ?auto_788699 ) ( ON ?auto_788697 ?auto_788698 ) ( CLEAR ?auto_788695 ) ( ON ?auto_788696 ?auto_788697 ) ( CLEAR ?auto_788696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_788694 ?auto_788695 ?auto_788696 )
      ( MAKE-15PILE ?auto_788694 ?auto_788695 ?auto_788696 ?auto_788697 ?auto_788698 ?auto_788699 ?auto_788700 ?auto_788701 ?auto_788702 ?auto_788703 ?auto_788704 ?auto_788705 ?auto_788706 ?auto_788707 ?auto_788708 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788756 - BLOCK
      ?auto_788757 - BLOCK
      ?auto_788758 - BLOCK
      ?auto_788759 - BLOCK
      ?auto_788760 - BLOCK
      ?auto_788761 - BLOCK
      ?auto_788762 - BLOCK
      ?auto_788763 - BLOCK
      ?auto_788764 - BLOCK
      ?auto_788765 - BLOCK
      ?auto_788766 - BLOCK
      ?auto_788767 - BLOCK
      ?auto_788768 - BLOCK
      ?auto_788769 - BLOCK
      ?auto_788770 - BLOCK
    )
    :vars
    (
      ?auto_788771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788770 ?auto_788771 ) ( ON-TABLE ?auto_788756 ) ( not ( = ?auto_788756 ?auto_788757 ) ) ( not ( = ?auto_788756 ?auto_788758 ) ) ( not ( = ?auto_788756 ?auto_788759 ) ) ( not ( = ?auto_788756 ?auto_788760 ) ) ( not ( = ?auto_788756 ?auto_788761 ) ) ( not ( = ?auto_788756 ?auto_788762 ) ) ( not ( = ?auto_788756 ?auto_788763 ) ) ( not ( = ?auto_788756 ?auto_788764 ) ) ( not ( = ?auto_788756 ?auto_788765 ) ) ( not ( = ?auto_788756 ?auto_788766 ) ) ( not ( = ?auto_788756 ?auto_788767 ) ) ( not ( = ?auto_788756 ?auto_788768 ) ) ( not ( = ?auto_788756 ?auto_788769 ) ) ( not ( = ?auto_788756 ?auto_788770 ) ) ( not ( = ?auto_788756 ?auto_788771 ) ) ( not ( = ?auto_788757 ?auto_788758 ) ) ( not ( = ?auto_788757 ?auto_788759 ) ) ( not ( = ?auto_788757 ?auto_788760 ) ) ( not ( = ?auto_788757 ?auto_788761 ) ) ( not ( = ?auto_788757 ?auto_788762 ) ) ( not ( = ?auto_788757 ?auto_788763 ) ) ( not ( = ?auto_788757 ?auto_788764 ) ) ( not ( = ?auto_788757 ?auto_788765 ) ) ( not ( = ?auto_788757 ?auto_788766 ) ) ( not ( = ?auto_788757 ?auto_788767 ) ) ( not ( = ?auto_788757 ?auto_788768 ) ) ( not ( = ?auto_788757 ?auto_788769 ) ) ( not ( = ?auto_788757 ?auto_788770 ) ) ( not ( = ?auto_788757 ?auto_788771 ) ) ( not ( = ?auto_788758 ?auto_788759 ) ) ( not ( = ?auto_788758 ?auto_788760 ) ) ( not ( = ?auto_788758 ?auto_788761 ) ) ( not ( = ?auto_788758 ?auto_788762 ) ) ( not ( = ?auto_788758 ?auto_788763 ) ) ( not ( = ?auto_788758 ?auto_788764 ) ) ( not ( = ?auto_788758 ?auto_788765 ) ) ( not ( = ?auto_788758 ?auto_788766 ) ) ( not ( = ?auto_788758 ?auto_788767 ) ) ( not ( = ?auto_788758 ?auto_788768 ) ) ( not ( = ?auto_788758 ?auto_788769 ) ) ( not ( = ?auto_788758 ?auto_788770 ) ) ( not ( = ?auto_788758 ?auto_788771 ) ) ( not ( = ?auto_788759 ?auto_788760 ) ) ( not ( = ?auto_788759 ?auto_788761 ) ) ( not ( = ?auto_788759 ?auto_788762 ) ) ( not ( = ?auto_788759 ?auto_788763 ) ) ( not ( = ?auto_788759 ?auto_788764 ) ) ( not ( = ?auto_788759 ?auto_788765 ) ) ( not ( = ?auto_788759 ?auto_788766 ) ) ( not ( = ?auto_788759 ?auto_788767 ) ) ( not ( = ?auto_788759 ?auto_788768 ) ) ( not ( = ?auto_788759 ?auto_788769 ) ) ( not ( = ?auto_788759 ?auto_788770 ) ) ( not ( = ?auto_788759 ?auto_788771 ) ) ( not ( = ?auto_788760 ?auto_788761 ) ) ( not ( = ?auto_788760 ?auto_788762 ) ) ( not ( = ?auto_788760 ?auto_788763 ) ) ( not ( = ?auto_788760 ?auto_788764 ) ) ( not ( = ?auto_788760 ?auto_788765 ) ) ( not ( = ?auto_788760 ?auto_788766 ) ) ( not ( = ?auto_788760 ?auto_788767 ) ) ( not ( = ?auto_788760 ?auto_788768 ) ) ( not ( = ?auto_788760 ?auto_788769 ) ) ( not ( = ?auto_788760 ?auto_788770 ) ) ( not ( = ?auto_788760 ?auto_788771 ) ) ( not ( = ?auto_788761 ?auto_788762 ) ) ( not ( = ?auto_788761 ?auto_788763 ) ) ( not ( = ?auto_788761 ?auto_788764 ) ) ( not ( = ?auto_788761 ?auto_788765 ) ) ( not ( = ?auto_788761 ?auto_788766 ) ) ( not ( = ?auto_788761 ?auto_788767 ) ) ( not ( = ?auto_788761 ?auto_788768 ) ) ( not ( = ?auto_788761 ?auto_788769 ) ) ( not ( = ?auto_788761 ?auto_788770 ) ) ( not ( = ?auto_788761 ?auto_788771 ) ) ( not ( = ?auto_788762 ?auto_788763 ) ) ( not ( = ?auto_788762 ?auto_788764 ) ) ( not ( = ?auto_788762 ?auto_788765 ) ) ( not ( = ?auto_788762 ?auto_788766 ) ) ( not ( = ?auto_788762 ?auto_788767 ) ) ( not ( = ?auto_788762 ?auto_788768 ) ) ( not ( = ?auto_788762 ?auto_788769 ) ) ( not ( = ?auto_788762 ?auto_788770 ) ) ( not ( = ?auto_788762 ?auto_788771 ) ) ( not ( = ?auto_788763 ?auto_788764 ) ) ( not ( = ?auto_788763 ?auto_788765 ) ) ( not ( = ?auto_788763 ?auto_788766 ) ) ( not ( = ?auto_788763 ?auto_788767 ) ) ( not ( = ?auto_788763 ?auto_788768 ) ) ( not ( = ?auto_788763 ?auto_788769 ) ) ( not ( = ?auto_788763 ?auto_788770 ) ) ( not ( = ?auto_788763 ?auto_788771 ) ) ( not ( = ?auto_788764 ?auto_788765 ) ) ( not ( = ?auto_788764 ?auto_788766 ) ) ( not ( = ?auto_788764 ?auto_788767 ) ) ( not ( = ?auto_788764 ?auto_788768 ) ) ( not ( = ?auto_788764 ?auto_788769 ) ) ( not ( = ?auto_788764 ?auto_788770 ) ) ( not ( = ?auto_788764 ?auto_788771 ) ) ( not ( = ?auto_788765 ?auto_788766 ) ) ( not ( = ?auto_788765 ?auto_788767 ) ) ( not ( = ?auto_788765 ?auto_788768 ) ) ( not ( = ?auto_788765 ?auto_788769 ) ) ( not ( = ?auto_788765 ?auto_788770 ) ) ( not ( = ?auto_788765 ?auto_788771 ) ) ( not ( = ?auto_788766 ?auto_788767 ) ) ( not ( = ?auto_788766 ?auto_788768 ) ) ( not ( = ?auto_788766 ?auto_788769 ) ) ( not ( = ?auto_788766 ?auto_788770 ) ) ( not ( = ?auto_788766 ?auto_788771 ) ) ( not ( = ?auto_788767 ?auto_788768 ) ) ( not ( = ?auto_788767 ?auto_788769 ) ) ( not ( = ?auto_788767 ?auto_788770 ) ) ( not ( = ?auto_788767 ?auto_788771 ) ) ( not ( = ?auto_788768 ?auto_788769 ) ) ( not ( = ?auto_788768 ?auto_788770 ) ) ( not ( = ?auto_788768 ?auto_788771 ) ) ( not ( = ?auto_788769 ?auto_788770 ) ) ( not ( = ?auto_788769 ?auto_788771 ) ) ( not ( = ?auto_788770 ?auto_788771 ) ) ( ON ?auto_788769 ?auto_788770 ) ( ON ?auto_788768 ?auto_788769 ) ( ON ?auto_788767 ?auto_788768 ) ( ON ?auto_788766 ?auto_788767 ) ( ON ?auto_788765 ?auto_788766 ) ( ON ?auto_788764 ?auto_788765 ) ( ON ?auto_788763 ?auto_788764 ) ( ON ?auto_788762 ?auto_788763 ) ( ON ?auto_788761 ?auto_788762 ) ( ON ?auto_788760 ?auto_788761 ) ( ON ?auto_788759 ?auto_788760 ) ( ON ?auto_788758 ?auto_788759 ) ( CLEAR ?auto_788756 ) ( ON ?auto_788757 ?auto_788758 ) ( CLEAR ?auto_788757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_788756 ?auto_788757 )
      ( MAKE-15PILE ?auto_788756 ?auto_788757 ?auto_788758 ?auto_788759 ?auto_788760 ?auto_788761 ?auto_788762 ?auto_788763 ?auto_788764 ?auto_788765 ?auto_788766 ?auto_788767 ?auto_788768 ?auto_788769 ?auto_788770 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_788818 - BLOCK
      ?auto_788819 - BLOCK
      ?auto_788820 - BLOCK
      ?auto_788821 - BLOCK
      ?auto_788822 - BLOCK
      ?auto_788823 - BLOCK
      ?auto_788824 - BLOCK
      ?auto_788825 - BLOCK
      ?auto_788826 - BLOCK
      ?auto_788827 - BLOCK
      ?auto_788828 - BLOCK
      ?auto_788829 - BLOCK
      ?auto_788830 - BLOCK
      ?auto_788831 - BLOCK
      ?auto_788832 - BLOCK
    )
    :vars
    (
      ?auto_788833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788832 ?auto_788833 ) ( not ( = ?auto_788818 ?auto_788819 ) ) ( not ( = ?auto_788818 ?auto_788820 ) ) ( not ( = ?auto_788818 ?auto_788821 ) ) ( not ( = ?auto_788818 ?auto_788822 ) ) ( not ( = ?auto_788818 ?auto_788823 ) ) ( not ( = ?auto_788818 ?auto_788824 ) ) ( not ( = ?auto_788818 ?auto_788825 ) ) ( not ( = ?auto_788818 ?auto_788826 ) ) ( not ( = ?auto_788818 ?auto_788827 ) ) ( not ( = ?auto_788818 ?auto_788828 ) ) ( not ( = ?auto_788818 ?auto_788829 ) ) ( not ( = ?auto_788818 ?auto_788830 ) ) ( not ( = ?auto_788818 ?auto_788831 ) ) ( not ( = ?auto_788818 ?auto_788832 ) ) ( not ( = ?auto_788818 ?auto_788833 ) ) ( not ( = ?auto_788819 ?auto_788820 ) ) ( not ( = ?auto_788819 ?auto_788821 ) ) ( not ( = ?auto_788819 ?auto_788822 ) ) ( not ( = ?auto_788819 ?auto_788823 ) ) ( not ( = ?auto_788819 ?auto_788824 ) ) ( not ( = ?auto_788819 ?auto_788825 ) ) ( not ( = ?auto_788819 ?auto_788826 ) ) ( not ( = ?auto_788819 ?auto_788827 ) ) ( not ( = ?auto_788819 ?auto_788828 ) ) ( not ( = ?auto_788819 ?auto_788829 ) ) ( not ( = ?auto_788819 ?auto_788830 ) ) ( not ( = ?auto_788819 ?auto_788831 ) ) ( not ( = ?auto_788819 ?auto_788832 ) ) ( not ( = ?auto_788819 ?auto_788833 ) ) ( not ( = ?auto_788820 ?auto_788821 ) ) ( not ( = ?auto_788820 ?auto_788822 ) ) ( not ( = ?auto_788820 ?auto_788823 ) ) ( not ( = ?auto_788820 ?auto_788824 ) ) ( not ( = ?auto_788820 ?auto_788825 ) ) ( not ( = ?auto_788820 ?auto_788826 ) ) ( not ( = ?auto_788820 ?auto_788827 ) ) ( not ( = ?auto_788820 ?auto_788828 ) ) ( not ( = ?auto_788820 ?auto_788829 ) ) ( not ( = ?auto_788820 ?auto_788830 ) ) ( not ( = ?auto_788820 ?auto_788831 ) ) ( not ( = ?auto_788820 ?auto_788832 ) ) ( not ( = ?auto_788820 ?auto_788833 ) ) ( not ( = ?auto_788821 ?auto_788822 ) ) ( not ( = ?auto_788821 ?auto_788823 ) ) ( not ( = ?auto_788821 ?auto_788824 ) ) ( not ( = ?auto_788821 ?auto_788825 ) ) ( not ( = ?auto_788821 ?auto_788826 ) ) ( not ( = ?auto_788821 ?auto_788827 ) ) ( not ( = ?auto_788821 ?auto_788828 ) ) ( not ( = ?auto_788821 ?auto_788829 ) ) ( not ( = ?auto_788821 ?auto_788830 ) ) ( not ( = ?auto_788821 ?auto_788831 ) ) ( not ( = ?auto_788821 ?auto_788832 ) ) ( not ( = ?auto_788821 ?auto_788833 ) ) ( not ( = ?auto_788822 ?auto_788823 ) ) ( not ( = ?auto_788822 ?auto_788824 ) ) ( not ( = ?auto_788822 ?auto_788825 ) ) ( not ( = ?auto_788822 ?auto_788826 ) ) ( not ( = ?auto_788822 ?auto_788827 ) ) ( not ( = ?auto_788822 ?auto_788828 ) ) ( not ( = ?auto_788822 ?auto_788829 ) ) ( not ( = ?auto_788822 ?auto_788830 ) ) ( not ( = ?auto_788822 ?auto_788831 ) ) ( not ( = ?auto_788822 ?auto_788832 ) ) ( not ( = ?auto_788822 ?auto_788833 ) ) ( not ( = ?auto_788823 ?auto_788824 ) ) ( not ( = ?auto_788823 ?auto_788825 ) ) ( not ( = ?auto_788823 ?auto_788826 ) ) ( not ( = ?auto_788823 ?auto_788827 ) ) ( not ( = ?auto_788823 ?auto_788828 ) ) ( not ( = ?auto_788823 ?auto_788829 ) ) ( not ( = ?auto_788823 ?auto_788830 ) ) ( not ( = ?auto_788823 ?auto_788831 ) ) ( not ( = ?auto_788823 ?auto_788832 ) ) ( not ( = ?auto_788823 ?auto_788833 ) ) ( not ( = ?auto_788824 ?auto_788825 ) ) ( not ( = ?auto_788824 ?auto_788826 ) ) ( not ( = ?auto_788824 ?auto_788827 ) ) ( not ( = ?auto_788824 ?auto_788828 ) ) ( not ( = ?auto_788824 ?auto_788829 ) ) ( not ( = ?auto_788824 ?auto_788830 ) ) ( not ( = ?auto_788824 ?auto_788831 ) ) ( not ( = ?auto_788824 ?auto_788832 ) ) ( not ( = ?auto_788824 ?auto_788833 ) ) ( not ( = ?auto_788825 ?auto_788826 ) ) ( not ( = ?auto_788825 ?auto_788827 ) ) ( not ( = ?auto_788825 ?auto_788828 ) ) ( not ( = ?auto_788825 ?auto_788829 ) ) ( not ( = ?auto_788825 ?auto_788830 ) ) ( not ( = ?auto_788825 ?auto_788831 ) ) ( not ( = ?auto_788825 ?auto_788832 ) ) ( not ( = ?auto_788825 ?auto_788833 ) ) ( not ( = ?auto_788826 ?auto_788827 ) ) ( not ( = ?auto_788826 ?auto_788828 ) ) ( not ( = ?auto_788826 ?auto_788829 ) ) ( not ( = ?auto_788826 ?auto_788830 ) ) ( not ( = ?auto_788826 ?auto_788831 ) ) ( not ( = ?auto_788826 ?auto_788832 ) ) ( not ( = ?auto_788826 ?auto_788833 ) ) ( not ( = ?auto_788827 ?auto_788828 ) ) ( not ( = ?auto_788827 ?auto_788829 ) ) ( not ( = ?auto_788827 ?auto_788830 ) ) ( not ( = ?auto_788827 ?auto_788831 ) ) ( not ( = ?auto_788827 ?auto_788832 ) ) ( not ( = ?auto_788827 ?auto_788833 ) ) ( not ( = ?auto_788828 ?auto_788829 ) ) ( not ( = ?auto_788828 ?auto_788830 ) ) ( not ( = ?auto_788828 ?auto_788831 ) ) ( not ( = ?auto_788828 ?auto_788832 ) ) ( not ( = ?auto_788828 ?auto_788833 ) ) ( not ( = ?auto_788829 ?auto_788830 ) ) ( not ( = ?auto_788829 ?auto_788831 ) ) ( not ( = ?auto_788829 ?auto_788832 ) ) ( not ( = ?auto_788829 ?auto_788833 ) ) ( not ( = ?auto_788830 ?auto_788831 ) ) ( not ( = ?auto_788830 ?auto_788832 ) ) ( not ( = ?auto_788830 ?auto_788833 ) ) ( not ( = ?auto_788831 ?auto_788832 ) ) ( not ( = ?auto_788831 ?auto_788833 ) ) ( not ( = ?auto_788832 ?auto_788833 ) ) ( ON ?auto_788831 ?auto_788832 ) ( ON ?auto_788830 ?auto_788831 ) ( ON ?auto_788829 ?auto_788830 ) ( ON ?auto_788828 ?auto_788829 ) ( ON ?auto_788827 ?auto_788828 ) ( ON ?auto_788826 ?auto_788827 ) ( ON ?auto_788825 ?auto_788826 ) ( ON ?auto_788824 ?auto_788825 ) ( ON ?auto_788823 ?auto_788824 ) ( ON ?auto_788822 ?auto_788823 ) ( ON ?auto_788821 ?auto_788822 ) ( ON ?auto_788820 ?auto_788821 ) ( ON ?auto_788819 ?auto_788820 ) ( ON ?auto_788818 ?auto_788819 ) ( CLEAR ?auto_788818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_788818 )
      ( MAKE-15PILE ?auto_788818 ?auto_788819 ?auto_788820 ?auto_788821 ?auto_788822 ?auto_788823 ?auto_788824 ?auto_788825 ?auto_788826 ?auto_788827 ?auto_788828 ?auto_788829 ?auto_788830 ?auto_788831 ?auto_788832 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_788881 - BLOCK
      ?auto_788882 - BLOCK
      ?auto_788883 - BLOCK
      ?auto_788884 - BLOCK
      ?auto_788885 - BLOCK
      ?auto_788886 - BLOCK
      ?auto_788887 - BLOCK
      ?auto_788888 - BLOCK
      ?auto_788889 - BLOCK
      ?auto_788890 - BLOCK
      ?auto_788891 - BLOCK
      ?auto_788892 - BLOCK
      ?auto_788893 - BLOCK
      ?auto_788894 - BLOCK
      ?auto_788895 - BLOCK
      ?auto_788896 - BLOCK
    )
    :vars
    (
      ?auto_788897 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_788895 ) ( ON ?auto_788896 ?auto_788897 ) ( CLEAR ?auto_788896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_788881 ) ( ON ?auto_788882 ?auto_788881 ) ( ON ?auto_788883 ?auto_788882 ) ( ON ?auto_788884 ?auto_788883 ) ( ON ?auto_788885 ?auto_788884 ) ( ON ?auto_788886 ?auto_788885 ) ( ON ?auto_788887 ?auto_788886 ) ( ON ?auto_788888 ?auto_788887 ) ( ON ?auto_788889 ?auto_788888 ) ( ON ?auto_788890 ?auto_788889 ) ( ON ?auto_788891 ?auto_788890 ) ( ON ?auto_788892 ?auto_788891 ) ( ON ?auto_788893 ?auto_788892 ) ( ON ?auto_788894 ?auto_788893 ) ( ON ?auto_788895 ?auto_788894 ) ( not ( = ?auto_788881 ?auto_788882 ) ) ( not ( = ?auto_788881 ?auto_788883 ) ) ( not ( = ?auto_788881 ?auto_788884 ) ) ( not ( = ?auto_788881 ?auto_788885 ) ) ( not ( = ?auto_788881 ?auto_788886 ) ) ( not ( = ?auto_788881 ?auto_788887 ) ) ( not ( = ?auto_788881 ?auto_788888 ) ) ( not ( = ?auto_788881 ?auto_788889 ) ) ( not ( = ?auto_788881 ?auto_788890 ) ) ( not ( = ?auto_788881 ?auto_788891 ) ) ( not ( = ?auto_788881 ?auto_788892 ) ) ( not ( = ?auto_788881 ?auto_788893 ) ) ( not ( = ?auto_788881 ?auto_788894 ) ) ( not ( = ?auto_788881 ?auto_788895 ) ) ( not ( = ?auto_788881 ?auto_788896 ) ) ( not ( = ?auto_788881 ?auto_788897 ) ) ( not ( = ?auto_788882 ?auto_788883 ) ) ( not ( = ?auto_788882 ?auto_788884 ) ) ( not ( = ?auto_788882 ?auto_788885 ) ) ( not ( = ?auto_788882 ?auto_788886 ) ) ( not ( = ?auto_788882 ?auto_788887 ) ) ( not ( = ?auto_788882 ?auto_788888 ) ) ( not ( = ?auto_788882 ?auto_788889 ) ) ( not ( = ?auto_788882 ?auto_788890 ) ) ( not ( = ?auto_788882 ?auto_788891 ) ) ( not ( = ?auto_788882 ?auto_788892 ) ) ( not ( = ?auto_788882 ?auto_788893 ) ) ( not ( = ?auto_788882 ?auto_788894 ) ) ( not ( = ?auto_788882 ?auto_788895 ) ) ( not ( = ?auto_788882 ?auto_788896 ) ) ( not ( = ?auto_788882 ?auto_788897 ) ) ( not ( = ?auto_788883 ?auto_788884 ) ) ( not ( = ?auto_788883 ?auto_788885 ) ) ( not ( = ?auto_788883 ?auto_788886 ) ) ( not ( = ?auto_788883 ?auto_788887 ) ) ( not ( = ?auto_788883 ?auto_788888 ) ) ( not ( = ?auto_788883 ?auto_788889 ) ) ( not ( = ?auto_788883 ?auto_788890 ) ) ( not ( = ?auto_788883 ?auto_788891 ) ) ( not ( = ?auto_788883 ?auto_788892 ) ) ( not ( = ?auto_788883 ?auto_788893 ) ) ( not ( = ?auto_788883 ?auto_788894 ) ) ( not ( = ?auto_788883 ?auto_788895 ) ) ( not ( = ?auto_788883 ?auto_788896 ) ) ( not ( = ?auto_788883 ?auto_788897 ) ) ( not ( = ?auto_788884 ?auto_788885 ) ) ( not ( = ?auto_788884 ?auto_788886 ) ) ( not ( = ?auto_788884 ?auto_788887 ) ) ( not ( = ?auto_788884 ?auto_788888 ) ) ( not ( = ?auto_788884 ?auto_788889 ) ) ( not ( = ?auto_788884 ?auto_788890 ) ) ( not ( = ?auto_788884 ?auto_788891 ) ) ( not ( = ?auto_788884 ?auto_788892 ) ) ( not ( = ?auto_788884 ?auto_788893 ) ) ( not ( = ?auto_788884 ?auto_788894 ) ) ( not ( = ?auto_788884 ?auto_788895 ) ) ( not ( = ?auto_788884 ?auto_788896 ) ) ( not ( = ?auto_788884 ?auto_788897 ) ) ( not ( = ?auto_788885 ?auto_788886 ) ) ( not ( = ?auto_788885 ?auto_788887 ) ) ( not ( = ?auto_788885 ?auto_788888 ) ) ( not ( = ?auto_788885 ?auto_788889 ) ) ( not ( = ?auto_788885 ?auto_788890 ) ) ( not ( = ?auto_788885 ?auto_788891 ) ) ( not ( = ?auto_788885 ?auto_788892 ) ) ( not ( = ?auto_788885 ?auto_788893 ) ) ( not ( = ?auto_788885 ?auto_788894 ) ) ( not ( = ?auto_788885 ?auto_788895 ) ) ( not ( = ?auto_788885 ?auto_788896 ) ) ( not ( = ?auto_788885 ?auto_788897 ) ) ( not ( = ?auto_788886 ?auto_788887 ) ) ( not ( = ?auto_788886 ?auto_788888 ) ) ( not ( = ?auto_788886 ?auto_788889 ) ) ( not ( = ?auto_788886 ?auto_788890 ) ) ( not ( = ?auto_788886 ?auto_788891 ) ) ( not ( = ?auto_788886 ?auto_788892 ) ) ( not ( = ?auto_788886 ?auto_788893 ) ) ( not ( = ?auto_788886 ?auto_788894 ) ) ( not ( = ?auto_788886 ?auto_788895 ) ) ( not ( = ?auto_788886 ?auto_788896 ) ) ( not ( = ?auto_788886 ?auto_788897 ) ) ( not ( = ?auto_788887 ?auto_788888 ) ) ( not ( = ?auto_788887 ?auto_788889 ) ) ( not ( = ?auto_788887 ?auto_788890 ) ) ( not ( = ?auto_788887 ?auto_788891 ) ) ( not ( = ?auto_788887 ?auto_788892 ) ) ( not ( = ?auto_788887 ?auto_788893 ) ) ( not ( = ?auto_788887 ?auto_788894 ) ) ( not ( = ?auto_788887 ?auto_788895 ) ) ( not ( = ?auto_788887 ?auto_788896 ) ) ( not ( = ?auto_788887 ?auto_788897 ) ) ( not ( = ?auto_788888 ?auto_788889 ) ) ( not ( = ?auto_788888 ?auto_788890 ) ) ( not ( = ?auto_788888 ?auto_788891 ) ) ( not ( = ?auto_788888 ?auto_788892 ) ) ( not ( = ?auto_788888 ?auto_788893 ) ) ( not ( = ?auto_788888 ?auto_788894 ) ) ( not ( = ?auto_788888 ?auto_788895 ) ) ( not ( = ?auto_788888 ?auto_788896 ) ) ( not ( = ?auto_788888 ?auto_788897 ) ) ( not ( = ?auto_788889 ?auto_788890 ) ) ( not ( = ?auto_788889 ?auto_788891 ) ) ( not ( = ?auto_788889 ?auto_788892 ) ) ( not ( = ?auto_788889 ?auto_788893 ) ) ( not ( = ?auto_788889 ?auto_788894 ) ) ( not ( = ?auto_788889 ?auto_788895 ) ) ( not ( = ?auto_788889 ?auto_788896 ) ) ( not ( = ?auto_788889 ?auto_788897 ) ) ( not ( = ?auto_788890 ?auto_788891 ) ) ( not ( = ?auto_788890 ?auto_788892 ) ) ( not ( = ?auto_788890 ?auto_788893 ) ) ( not ( = ?auto_788890 ?auto_788894 ) ) ( not ( = ?auto_788890 ?auto_788895 ) ) ( not ( = ?auto_788890 ?auto_788896 ) ) ( not ( = ?auto_788890 ?auto_788897 ) ) ( not ( = ?auto_788891 ?auto_788892 ) ) ( not ( = ?auto_788891 ?auto_788893 ) ) ( not ( = ?auto_788891 ?auto_788894 ) ) ( not ( = ?auto_788891 ?auto_788895 ) ) ( not ( = ?auto_788891 ?auto_788896 ) ) ( not ( = ?auto_788891 ?auto_788897 ) ) ( not ( = ?auto_788892 ?auto_788893 ) ) ( not ( = ?auto_788892 ?auto_788894 ) ) ( not ( = ?auto_788892 ?auto_788895 ) ) ( not ( = ?auto_788892 ?auto_788896 ) ) ( not ( = ?auto_788892 ?auto_788897 ) ) ( not ( = ?auto_788893 ?auto_788894 ) ) ( not ( = ?auto_788893 ?auto_788895 ) ) ( not ( = ?auto_788893 ?auto_788896 ) ) ( not ( = ?auto_788893 ?auto_788897 ) ) ( not ( = ?auto_788894 ?auto_788895 ) ) ( not ( = ?auto_788894 ?auto_788896 ) ) ( not ( = ?auto_788894 ?auto_788897 ) ) ( not ( = ?auto_788895 ?auto_788896 ) ) ( not ( = ?auto_788895 ?auto_788897 ) ) ( not ( = ?auto_788896 ?auto_788897 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_788896 ?auto_788897 )
      ( !STACK ?auto_788896 ?auto_788895 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_788947 - BLOCK
      ?auto_788948 - BLOCK
      ?auto_788949 - BLOCK
      ?auto_788950 - BLOCK
      ?auto_788951 - BLOCK
      ?auto_788952 - BLOCK
      ?auto_788953 - BLOCK
      ?auto_788954 - BLOCK
      ?auto_788955 - BLOCK
      ?auto_788956 - BLOCK
      ?auto_788957 - BLOCK
      ?auto_788958 - BLOCK
      ?auto_788959 - BLOCK
      ?auto_788960 - BLOCK
      ?auto_788961 - BLOCK
      ?auto_788962 - BLOCK
    )
    :vars
    (
      ?auto_788963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_788962 ?auto_788963 ) ( ON-TABLE ?auto_788947 ) ( ON ?auto_788948 ?auto_788947 ) ( ON ?auto_788949 ?auto_788948 ) ( ON ?auto_788950 ?auto_788949 ) ( ON ?auto_788951 ?auto_788950 ) ( ON ?auto_788952 ?auto_788951 ) ( ON ?auto_788953 ?auto_788952 ) ( ON ?auto_788954 ?auto_788953 ) ( ON ?auto_788955 ?auto_788954 ) ( ON ?auto_788956 ?auto_788955 ) ( ON ?auto_788957 ?auto_788956 ) ( ON ?auto_788958 ?auto_788957 ) ( ON ?auto_788959 ?auto_788958 ) ( ON ?auto_788960 ?auto_788959 ) ( not ( = ?auto_788947 ?auto_788948 ) ) ( not ( = ?auto_788947 ?auto_788949 ) ) ( not ( = ?auto_788947 ?auto_788950 ) ) ( not ( = ?auto_788947 ?auto_788951 ) ) ( not ( = ?auto_788947 ?auto_788952 ) ) ( not ( = ?auto_788947 ?auto_788953 ) ) ( not ( = ?auto_788947 ?auto_788954 ) ) ( not ( = ?auto_788947 ?auto_788955 ) ) ( not ( = ?auto_788947 ?auto_788956 ) ) ( not ( = ?auto_788947 ?auto_788957 ) ) ( not ( = ?auto_788947 ?auto_788958 ) ) ( not ( = ?auto_788947 ?auto_788959 ) ) ( not ( = ?auto_788947 ?auto_788960 ) ) ( not ( = ?auto_788947 ?auto_788961 ) ) ( not ( = ?auto_788947 ?auto_788962 ) ) ( not ( = ?auto_788947 ?auto_788963 ) ) ( not ( = ?auto_788948 ?auto_788949 ) ) ( not ( = ?auto_788948 ?auto_788950 ) ) ( not ( = ?auto_788948 ?auto_788951 ) ) ( not ( = ?auto_788948 ?auto_788952 ) ) ( not ( = ?auto_788948 ?auto_788953 ) ) ( not ( = ?auto_788948 ?auto_788954 ) ) ( not ( = ?auto_788948 ?auto_788955 ) ) ( not ( = ?auto_788948 ?auto_788956 ) ) ( not ( = ?auto_788948 ?auto_788957 ) ) ( not ( = ?auto_788948 ?auto_788958 ) ) ( not ( = ?auto_788948 ?auto_788959 ) ) ( not ( = ?auto_788948 ?auto_788960 ) ) ( not ( = ?auto_788948 ?auto_788961 ) ) ( not ( = ?auto_788948 ?auto_788962 ) ) ( not ( = ?auto_788948 ?auto_788963 ) ) ( not ( = ?auto_788949 ?auto_788950 ) ) ( not ( = ?auto_788949 ?auto_788951 ) ) ( not ( = ?auto_788949 ?auto_788952 ) ) ( not ( = ?auto_788949 ?auto_788953 ) ) ( not ( = ?auto_788949 ?auto_788954 ) ) ( not ( = ?auto_788949 ?auto_788955 ) ) ( not ( = ?auto_788949 ?auto_788956 ) ) ( not ( = ?auto_788949 ?auto_788957 ) ) ( not ( = ?auto_788949 ?auto_788958 ) ) ( not ( = ?auto_788949 ?auto_788959 ) ) ( not ( = ?auto_788949 ?auto_788960 ) ) ( not ( = ?auto_788949 ?auto_788961 ) ) ( not ( = ?auto_788949 ?auto_788962 ) ) ( not ( = ?auto_788949 ?auto_788963 ) ) ( not ( = ?auto_788950 ?auto_788951 ) ) ( not ( = ?auto_788950 ?auto_788952 ) ) ( not ( = ?auto_788950 ?auto_788953 ) ) ( not ( = ?auto_788950 ?auto_788954 ) ) ( not ( = ?auto_788950 ?auto_788955 ) ) ( not ( = ?auto_788950 ?auto_788956 ) ) ( not ( = ?auto_788950 ?auto_788957 ) ) ( not ( = ?auto_788950 ?auto_788958 ) ) ( not ( = ?auto_788950 ?auto_788959 ) ) ( not ( = ?auto_788950 ?auto_788960 ) ) ( not ( = ?auto_788950 ?auto_788961 ) ) ( not ( = ?auto_788950 ?auto_788962 ) ) ( not ( = ?auto_788950 ?auto_788963 ) ) ( not ( = ?auto_788951 ?auto_788952 ) ) ( not ( = ?auto_788951 ?auto_788953 ) ) ( not ( = ?auto_788951 ?auto_788954 ) ) ( not ( = ?auto_788951 ?auto_788955 ) ) ( not ( = ?auto_788951 ?auto_788956 ) ) ( not ( = ?auto_788951 ?auto_788957 ) ) ( not ( = ?auto_788951 ?auto_788958 ) ) ( not ( = ?auto_788951 ?auto_788959 ) ) ( not ( = ?auto_788951 ?auto_788960 ) ) ( not ( = ?auto_788951 ?auto_788961 ) ) ( not ( = ?auto_788951 ?auto_788962 ) ) ( not ( = ?auto_788951 ?auto_788963 ) ) ( not ( = ?auto_788952 ?auto_788953 ) ) ( not ( = ?auto_788952 ?auto_788954 ) ) ( not ( = ?auto_788952 ?auto_788955 ) ) ( not ( = ?auto_788952 ?auto_788956 ) ) ( not ( = ?auto_788952 ?auto_788957 ) ) ( not ( = ?auto_788952 ?auto_788958 ) ) ( not ( = ?auto_788952 ?auto_788959 ) ) ( not ( = ?auto_788952 ?auto_788960 ) ) ( not ( = ?auto_788952 ?auto_788961 ) ) ( not ( = ?auto_788952 ?auto_788962 ) ) ( not ( = ?auto_788952 ?auto_788963 ) ) ( not ( = ?auto_788953 ?auto_788954 ) ) ( not ( = ?auto_788953 ?auto_788955 ) ) ( not ( = ?auto_788953 ?auto_788956 ) ) ( not ( = ?auto_788953 ?auto_788957 ) ) ( not ( = ?auto_788953 ?auto_788958 ) ) ( not ( = ?auto_788953 ?auto_788959 ) ) ( not ( = ?auto_788953 ?auto_788960 ) ) ( not ( = ?auto_788953 ?auto_788961 ) ) ( not ( = ?auto_788953 ?auto_788962 ) ) ( not ( = ?auto_788953 ?auto_788963 ) ) ( not ( = ?auto_788954 ?auto_788955 ) ) ( not ( = ?auto_788954 ?auto_788956 ) ) ( not ( = ?auto_788954 ?auto_788957 ) ) ( not ( = ?auto_788954 ?auto_788958 ) ) ( not ( = ?auto_788954 ?auto_788959 ) ) ( not ( = ?auto_788954 ?auto_788960 ) ) ( not ( = ?auto_788954 ?auto_788961 ) ) ( not ( = ?auto_788954 ?auto_788962 ) ) ( not ( = ?auto_788954 ?auto_788963 ) ) ( not ( = ?auto_788955 ?auto_788956 ) ) ( not ( = ?auto_788955 ?auto_788957 ) ) ( not ( = ?auto_788955 ?auto_788958 ) ) ( not ( = ?auto_788955 ?auto_788959 ) ) ( not ( = ?auto_788955 ?auto_788960 ) ) ( not ( = ?auto_788955 ?auto_788961 ) ) ( not ( = ?auto_788955 ?auto_788962 ) ) ( not ( = ?auto_788955 ?auto_788963 ) ) ( not ( = ?auto_788956 ?auto_788957 ) ) ( not ( = ?auto_788956 ?auto_788958 ) ) ( not ( = ?auto_788956 ?auto_788959 ) ) ( not ( = ?auto_788956 ?auto_788960 ) ) ( not ( = ?auto_788956 ?auto_788961 ) ) ( not ( = ?auto_788956 ?auto_788962 ) ) ( not ( = ?auto_788956 ?auto_788963 ) ) ( not ( = ?auto_788957 ?auto_788958 ) ) ( not ( = ?auto_788957 ?auto_788959 ) ) ( not ( = ?auto_788957 ?auto_788960 ) ) ( not ( = ?auto_788957 ?auto_788961 ) ) ( not ( = ?auto_788957 ?auto_788962 ) ) ( not ( = ?auto_788957 ?auto_788963 ) ) ( not ( = ?auto_788958 ?auto_788959 ) ) ( not ( = ?auto_788958 ?auto_788960 ) ) ( not ( = ?auto_788958 ?auto_788961 ) ) ( not ( = ?auto_788958 ?auto_788962 ) ) ( not ( = ?auto_788958 ?auto_788963 ) ) ( not ( = ?auto_788959 ?auto_788960 ) ) ( not ( = ?auto_788959 ?auto_788961 ) ) ( not ( = ?auto_788959 ?auto_788962 ) ) ( not ( = ?auto_788959 ?auto_788963 ) ) ( not ( = ?auto_788960 ?auto_788961 ) ) ( not ( = ?auto_788960 ?auto_788962 ) ) ( not ( = ?auto_788960 ?auto_788963 ) ) ( not ( = ?auto_788961 ?auto_788962 ) ) ( not ( = ?auto_788961 ?auto_788963 ) ) ( not ( = ?auto_788962 ?auto_788963 ) ) ( CLEAR ?auto_788960 ) ( ON ?auto_788961 ?auto_788962 ) ( CLEAR ?auto_788961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_788947 ?auto_788948 ?auto_788949 ?auto_788950 ?auto_788951 ?auto_788952 ?auto_788953 ?auto_788954 ?auto_788955 ?auto_788956 ?auto_788957 ?auto_788958 ?auto_788959 ?auto_788960 ?auto_788961 )
      ( MAKE-16PILE ?auto_788947 ?auto_788948 ?auto_788949 ?auto_788950 ?auto_788951 ?auto_788952 ?auto_788953 ?auto_788954 ?auto_788955 ?auto_788956 ?auto_788957 ?auto_788958 ?auto_788959 ?auto_788960 ?auto_788961 ?auto_788962 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789013 - BLOCK
      ?auto_789014 - BLOCK
      ?auto_789015 - BLOCK
      ?auto_789016 - BLOCK
      ?auto_789017 - BLOCK
      ?auto_789018 - BLOCK
      ?auto_789019 - BLOCK
      ?auto_789020 - BLOCK
      ?auto_789021 - BLOCK
      ?auto_789022 - BLOCK
      ?auto_789023 - BLOCK
      ?auto_789024 - BLOCK
      ?auto_789025 - BLOCK
      ?auto_789026 - BLOCK
      ?auto_789027 - BLOCK
      ?auto_789028 - BLOCK
    )
    :vars
    (
      ?auto_789029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789028 ?auto_789029 ) ( ON-TABLE ?auto_789013 ) ( ON ?auto_789014 ?auto_789013 ) ( ON ?auto_789015 ?auto_789014 ) ( ON ?auto_789016 ?auto_789015 ) ( ON ?auto_789017 ?auto_789016 ) ( ON ?auto_789018 ?auto_789017 ) ( ON ?auto_789019 ?auto_789018 ) ( ON ?auto_789020 ?auto_789019 ) ( ON ?auto_789021 ?auto_789020 ) ( ON ?auto_789022 ?auto_789021 ) ( ON ?auto_789023 ?auto_789022 ) ( ON ?auto_789024 ?auto_789023 ) ( ON ?auto_789025 ?auto_789024 ) ( not ( = ?auto_789013 ?auto_789014 ) ) ( not ( = ?auto_789013 ?auto_789015 ) ) ( not ( = ?auto_789013 ?auto_789016 ) ) ( not ( = ?auto_789013 ?auto_789017 ) ) ( not ( = ?auto_789013 ?auto_789018 ) ) ( not ( = ?auto_789013 ?auto_789019 ) ) ( not ( = ?auto_789013 ?auto_789020 ) ) ( not ( = ?auto_789013 ?auto_789021 ) ) ( not ( = ?auto_789013 ?auto_789022 ) ) ( not ( = ?auto_789013 ?auto_789023 ) ) ( not ( = ?auto_789013 ?auto_789024 ) ) ( not ( = ?auto_789013 ?auto_789025 ) ) ( not ( = ?auto_789013 ?auto_789026 ) ) ( not ( = ?auto_789013 ?auto_789027 ) ) ( not ( = ?auto_789013 ?auto_789028 ) ) ( not ( = ?auto_789013 ?auto_789029 ) ) ( not ( = ?auto_789014 ?auto_789015 ) ) ( not ( = ?auto_789014 ?auto_789016 ) ) ( not ( = ?auto_789014 ?auto_789017 ) ) ( not ( = ?auto_789014 ?auto_789018 ) ) ( not ( = ?auto_789014 ?auto_789019 ) ) ( not ( = ?auto_789014 ?auto_789020 ) ) ( not ( = ?auto_789014 ?auto_789021 ) ) ( not ( = ?auto_789014 ?auto_789022 ) ) ( not ( = ?auto_789014 ?auto_789023 ) ) ( not ( = ?auto_789014 ?auto_789024 ) ) ( not ( = ?auto_789014 ?auto_789025 ) ) ( not ( = ?auto_789014 ?auto_789026 ) ) ( not ( = ?auto_789014 ?auto_789027 ) ) ( not ( = ?auto_789014 ?auto_789028 ) ) ( not ( = ?auto_789014 ?auto_789029 ) ) ( not ( = ?auto_789015 ?auto_789016 ) ) ( not ( = ?auto_789015 ?auto_789017 ) ) ( not ( = ?auto_789015 ?auto_789018 ) ) ( not ( = ?auto_789015 ?auto_789019 ) ) ( not ( = ?auto_789015 ?auto_789020 ) ) ( not ( = ?auto_789015 ?auto_789021 ) ) ( not ( = ?auto_789015 ?auto_789022 ) ) ( not ( = ?auto_789015 ?auto_789023 ) ) ( not ( = ?auto_789015 ?auto_789024 ) ) ( not ( = ?auto_789015 ?auto_789025 ) ) ( not ( = ?auto_789015 ?auto_789026 ) ) ( not ( = ?auto_789015 ?auto_789027 ) ) ( not ( = ?auto_789015 ?auto_789028 ) ) ( not ( = ?auto_789015 ?auto_789029 ) ) ( not ( = ?auto_789016 ?auto_789017 ) ) ( not ( = ?auto_789016 ?auto_789018 ) ) ( not ( = ?auto_789016 ?auto_789019 ) ) ( not ( = ?auto_789016 ?auto_789020 ) ) ( not ( = ?auto_789016 ?auto_789021 ) ) ( not ( = ?auto_789016 ?auto_789022 ) ) ( not ( = ?auto_789016 ?auto_789023 ) ) ( not ( = ?auto_789016 ?auto_789024 ) ) ( not ( = ?auto_789016 ?auto_789025 ) ) ( not ( = ?auto_789016 ?auto_789026 ) ) ( not ( = ?auto_789016 ?auto_789027 ) ) ( not ( = ?auto_789016 ?auto_789028 ) ) ( not ( = ?auto_789016 ?auto_789029 ) ) ( not ( = ?auto_789017 ?auto_789018 ) ) ( not ( = ?auto_789017 ?auto_789019 ) ) ( not ( = ?auto_789017 ?auto_789020 ) ) ( not ( = ?auto_789017 ?auto_789021 ) ) ( not ( = ?auto_789017 ?auto_789022 ) ) ( not ( = ?auto_789017 ?auto_789023 ) ) ( not ( = ?auto_789017 ?auto_789024 ) ) ( not ( = ?auto_789017 ?auto_789025 ) ) ( not ( = ?auto_789017 ?auto_789026 ) ) ( not ( = ?auto_789017 ?auto_789027 ) ) ( not ( = ?auto_789017 ?auto_789028 ) ) ( not ( = ?auto_789017 ?auto_789029 ) ) ( not ( = ?auto_789018 ?auto_789019 ) ) ( not ( = ?auto_789018 ?auto_789020 ) ) ( not ( = ?auto_789018 ?auto_789021 ) ) ( not ( = ?auto_789018 ?auto_789022 ) ) ( not ( = ?auto_789018 ?auto_789023 ) ) ( not ( = ?auto_789018 ?auto_789024 ) ) ( not ( = ?auto_789018 ?auto_789025 ) ) ( not ( = ?auto_789018 ?auto_789026 ) ) ( not ( = ?auto_789018 ?auto_789027 ) ) ( not ( = ?auto_789018 ?auto_789028 ) ) ( not ( = ?auto_789018 ?auto_789029 ) ) ( not ( = ?auto_789019 ?auto_789020 ) ) ( not ( = ?auto_789019 ?auto_789021 ) ) ( not ( = ?auto_789019 ?auto_789022 ) ) ( not ( = ?auto_789019 ?auto_789023 ) ) ( not ( = ?auto_789019 ?auto_789024 ) ) ( not ( = ?auto_789019 ?auto_789025 ) ) ( not ( = ?auto_789019 ?auto_789026 ) ) ( not ( = ?auto_789019 ?auto_789027 ) ) ( not ( = ?auto_789019 ?auto_789028 ) ) ( not ( = ?auto_789019 ?auto_789029 ) ) ( not ( = ?auto_789020 ?auto_789021 ) ) ( not ( = ?auto_789020 ?auto_789022 ) ) ( not ( = ?auto_789020 ?auto_789023 ) ) ( not ( = ?auto_789020 ?auto_789024 ) ) ( not ( = ?auto_789020 ?auto_789025 ) ) ( not ( = ?auto_789020 ?auto_789026 ) ) ( not ( = ?auto_789020 ?auto_789027 ) ) ( not ( = ?auto_789020 ?auto_789028 ) ) ( not ( = ?auto_789020 ?auto_789029 ) ) ( not ( = ?auto_789021 ?auto_789022 ) ) ( not ( = ?auto_789021 ?auto_789023 ) ) ( not ( = ?auto_789021 ?auto_789024 ) ) ( not ( = ?auto_789021 ?auto_789025 ) ) ( not ( = ?auto_789021 ?auto_789026 ) ) ( not ( = ?auto_789021 ?auto_789027 ) ) ( not ( = ?auto_789021 ?auto_789028 ) ) ( not ( = ?auto_789021 ?auto_789029 ) ) ( not ( = ?auto_789022 ?auto_789023 ) ) ( not ( = ?auto_789022 ?auto_789024 ) ) ( not ( = ?auto_789022 ?auto_789025 ) ) ( not ( = ?auto_789022 ?auto_789026 ) ) ( not ( = ?auto_789022 ?auto_789027 ) ) ( not ( = ?auto_789022 ?auto_789028 ) ) ( not ( = ?auto_789022 ?auto_789029 ) ) ( not ( = ?auto_789023 ?auto_789024 ) ) ( not ( = ?auto_789023 ?auto_789025 ) ) ( not ( = ?auto_789023 ?auto_789026 ) ) ( not ( = ?auto_789023 ?auto_789027 ) ) ( not ( = ?auto_789023 ?auto_789028 ) ) ( not ( = ?auto_789023 ?auto_789029 ) ) ( not ( = ?auto_789024 ?auto_789025 ) ) ( not ( = ?auto_789024 ?auto_789026 ) ) ( not ( = ?auto_789024 ?auto_789027 ) ) ( not ( = ?auto_789024 ?auto_789028 ) ) ( not ( = ?auto_789024 ?auto_789029 ) ) ( not ( = ?auto_789025 ?auto_789026 ) ) ( not ( = ?auto_789025 ?auto_789027 ) ) ( not ( = ?auto_789025 ?auto_789028 ) ) ( not ( = ?auto_789025 ?auto_789029 ) ) ( not ( = ?auto_789026 ?auto_789027 ) ) ( not ( = ?auto_789026 ?auto_789028 ) ) ( not ( = ?auto_789026 ?auto_789029 ) ) ( not ( = ?auto_789027 ?auto_789028 ) ) ( not ( = ?auto_789027 ?auto_789029 ) ) ( not ( = ?auto_789028 ?auto_789029 ) ) ( ON ?auto_789027 ?auto_789028 ) ( CLEAR ?auto_789025 ) ( ON ?auto_789026 ?auto_789027 ) ( CLEAR ?auto_789026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_789013 ?auto_789014 ?auto_789015 ?auto_789016 ?auto_789017 ?auto_789018 ?auto_789019 ?auto_789020 ?auto_789021 ?auto_789022 ?auto_789023 ?auto_789024 ?auto_789025 ?auto_789026 )
      ( MAKE-16PILE ?auto_789013 ?auto_789014 ?auto_789015 ?auto_789016 ?auto_789017 ?auto_789018 ?auto_789019 ?auto_789020 ?auto_789021 ?auto_789022 ?auto_789023 ?auto_789024 ?auto_789025 ?auto_789026 ?auto_789027 ?auto_789028 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789079 - BLOCK
      ?auto_789080 - BLOCK
      ?auto_789081 - BLOCK
      ?auto_789082 - BLOCK
      ?auto_789083 - BLOCK
      ?auto_789084 - BLOCK
      ?auto_789085 - BLOCK
      ?auto_789086 - BLOCK
      ?auto_789087 - BLOCK
      ?auto_789088 - BLOCK
      ?auto_789089 - BLOCK
      ?auto_789090 - BLOCK
      ?auto_789091 - BLOCK
      ?auto_789092 - BLOCK
      ?auto_789093 - BLOCK
      ?auto_789094 - BLOCK
    )
    :vars
    (
      ?auto_789095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789094 ?auto_789095 ) ( ON-TABLE ?auto_789079 ) ( ON ?auto_789080 ?auto_789079 ) ( ON ?auto_789081 ?auto_789080 ) ( ON ?auto_789082 ?auto_789081 ) ( ON ?auto_789083 ?auto_789082 ) ( ON ?auto_789084 ?auto_789083 ) ( ON ?auto_789085 ?auto_789084 ) ( ON ?auto_789086 ?auto_789085 ) ( ON ?auto_789087 ?auto_789086 ) ( ON ?auto_789088 ?auto_789087 ) ( ON ?auto_789089 ?auto_789088 ) ( ON ?auto_789090 ?auto_789089 ) ( not ( = ?auto_789079 ?auto_789080 ) ) ( not ( = ?auto_789079 ?auto_789081 ) ) ( not ( = ?auto_789079 ?auto_789082 ) ) ( not ( = ?auto_789079 ?auto_789083 ) ) ( not ( = ?auto_789079 ?auto_789084 ) ) ( not ( = ?auto_789079 ?auto_789085 ) ) ( not ( = ?auto_789079 ?auto_789086 ) ) ( not ( = ?auto_789079 ?auto_789087 ) ) ( not ( = ?auto_789079 ?auto_789088 ) ) ( not ( = ?auto_789079 ?auto_789089 ) ) ( not ( = ?auto_789079 ?auto_789090 ) ) ( not ( = ?auto_789079 ?auto_789091 ) ) ( not ( = ?auto_789079 ?auto_789092 ) ) ( not ( = ?auto_789079 ?auto_789093 ) ) ( not ( = ?auto_789079 ?auto_789094 ) ) ( not ( = ?auto_789079 ?auto_789095 ) ) ( not ( = ?auto_789080 ?auto_789081 ) ) ( not ( = ?auto_789080 ?auto_789082 ) ) ( not ( = ?auto_789080 ?auto_789083 ) ) ( not ( = ?auto_789080 ?auto_789084 ) ) ( not ( = ?auto_789080 ?auto_789085 ) ) ( not ( = ?auto_789080 ?auto_789086 ) ) ( not ( = ?auto_789080 ?auto_789087 ) ) ( not ( = ?auto_789080 ?auto_789088 ) ) ( not ( = ?auto_789080 ?auto_789089 ) ) ( not ( = ?auto_789080 ?auto_789090 ) ) ( not ( = ?auto_789080 ?auto_789091 ) ) ( not ( = ?auto_789080 ?auto_789092 ) ) ( not ( = ?auto_789080 ?auto_789093 ) ) ( not ( = ?auto_789080 ?auto_789094 ) ) ( not ( = ?auto_789080 ?auto_789095 ) ) ( not ( = ?auto_789081 ?auto_789082 ) ) ( not ( = ?auto_789081 ?auto_789083 ) ) ( not ( = ?auto_789081 ?auto_789084 ) ) ( not ( = ?auto_789081 ?auto_789085 ) ) ( not ( = ?auto_789081 ?auto_789086 ) ) ( not ( = ?auto_789081 ?auto_789087 ) ) ( not ( = ?auto_789081 ?auto_789088 ) ) ( not ( = ?auto_789081 ?auto_789089 ) ) ( not ( = ?auto_789081 ?auto_789090 ) ) ( not ( = ?auto_789081 ?auto_789091 ) ) ( not ( = ?auto_789081 ?auto_789092 ) ) ( not ( = ?auto_789081 ?auto_789093 ) ) ( not ( = ?auto_789081 ?auto_789094 ) ) ( not ( = ?auto_789081 ?auto_789095 ) ) ( not ( = ?auto_789082 ?auto_789083 ) ) ( not ( = ?auto_789082 ?auto_789084 ) ) ( not ( = ?auto_789082 ?auto_789085 ) ) ( not ( = ?auto_789082 ?auto_789086 ) ) ( not ( = ?auto_789082 ?auto_789087 ) ) ( not ( = ?auto_789082 ?auto_789088 ) ) ( not ( = ?auto_789082 ?auto_789089 ) ) ( not ( = ?auto_789082 ?auto_789090 ) ) ( not ( = ?auto_789082 ?auto_789091 ) ) ( not ( = ?auto_789082 ?auto_789092 ) ) ( not ( = ?auto_789082 ?auto_789093 ) ) ( not ( = ?auto_789082 ?auto_789094 ) ) ( not ( = ?auto_789082 ?auto_789095 ) ) ( not ( = ?auto_789083 ?auto_789084 ) ) ( not ( = ?auto_789083 ?auto_789085 ) ) ( not ( = ?auto_789083 ?auto_789086 ) ) ( not ( = ?auto_789083 ?auto_789087 ) ) ( not ( = ?auto_789083 ?auto_789088 ) ) ( not ( = ?auto_789083 ?auto_789089 ) ) ( not ( = ?auto_789083 ?auto_789090 ) ) ( not ( = ?auto_789083 ?auto_789091 ) ) ( not ( = ?auto_789083 ?auto_789092 ) ) ( not ( = ?auto_789083 ?auto_789093 ) ) ( not ( = ?auto_789083 ?auto_789094 ) ) ( not ( = ?auto_789083 ?auto_789095 ) ) ( not ( = ?auto_789084 ?auto_789085 ) ) ( not ( = ?auto_789084 ?auto_789086 ) ) ( not ( = ?auto_789084 ?auto_789087 ) ) ( not ( = ?auto_789084 ?auto_789088 ) ) ( not ( = ?auto_789084 ?auto_789089 ) ) ( not ( = ?auto_789084 ?auto_789090 ) ) ( not ( = ?auto_789084 ?auto_789091 ) ) ( not ( = ?auto_789084 ?auto_789092 ) ) ( not ( = ?auto_789084 ?auto_789093 ) ) ( not ( = ?auto_789084 ?auto_789094 ) ) ( not ( = ?auto_789084 ?auto_789095 ) ) ( not ( = ?auto_789085 ?auto_789086 ) ) ( not ( = ?auto_789085 ?auto_789087 ) ) ( not ( = ?auto_789085 ?auto_789088 ) ) ( not ( = ?auto_789085 ?auto_789089 ) ) ( not ( = ?auto_789085 ?auto_789090 ) ) ( not ( = ?auto_789085 ?auto_789091 ) ) ( not ( = ?auto_789085 ?auto_789092 ) ) ( not ( = ?auto_789085 ?auto_789093 ) ) ( not ( = ?auto_789085 ?auto_789094 ) ) ( not ( = ?auto_789085 ?auto_789095 ) ) ( not ( = ?auto_789086 ?auto_789087 ) ) ( not ( = ?auto_789086 ?auto_789088 ) ) ( not ( = ?auto_789086 ?auto_789089 ) ) ( not ( = ?auto_789086 ?auto_789090 ) ) ( not ( = ?auto_789086 ?auto_789091 ) ) ( not ( = ?auto_789086 ?auto_789092 ) ) ( not ( = ?auto_789086 ?auto_789093 ) ) ( not ( = ?auto_789086 ?auto_789094 ) ) ( not ( = ?auto_789086 ?auto_789095 ) ) ( not ( = ?auto_789087 ?auto_789088 ) ) ( not ( = ?auto_789087 ?auto_789089 ) ) ( not ( = ?auto_789087 ?auto_789090 ) ) ( not ( = ?auto_789087 ?auto_789091 ) ) ( not ( = ?auto_789087 ?auto_789092 ) ) ( not ( = ?auto_789087 ?auto_789093 ) ) ( not ( = ?auto_789087 ?auto_789094 ) ) ( not ( = ?auto_789087 ?auto_789095 ) ) ( not ( = ?auto_789088 ?auto_789089 ) ) ( not ( = ?auto_789088 ?auto_789090 ) ) ( not ( = ?auto_789088 ?auto_789091 ) ) ( not ( = ?auto_789088 ?auto_789092 ) ) ( not ( = ?auto_789088 ?auto_789093 ) ) ( not ( = ?auto_789088 ?auto_789094 ) ) ( not ( = ?auto_789088 ?auto_789095 ) ) ( not ( = ?auto_789089 ?auto_789090 ) ) ( not ( = ?auto_789089 ?auto_789091 ) ) ( not ( = ?auto_789089 ?auto_789092 ) ) ( not ( = ?auto_789089 ?auto_789093 ) ) ( not ( = ?auto_789089 ?auto_789094 ) ) ( not ( = ?auto_789089 ?auto_789095 ) ) ( not ( = ?auto_789090 ?auto_789091 ) ) ( not ( = ?auto_789090 ?auto_789092 ) ) ( not ( = ?auto_789090 ?auto_789093 ) ) ( not ( = ?auto_789090 ?auto_789094 ) ) ( not ( = ?auto_789090 ?auto_789095 ) ) ( not ( = ?auto_789091 ?auto_789092 ) ) ( not ( = ?auto_789091 ?auto_789093 ) ) ( not ( = ?auto_789091 ?auto_789094 ) ) ( not ( = ?auto_789091 ?auto_789095 ) ) ( not ( = ?auto_789092 ?auto_789093 ) ) ( not ( = ?auto_789092 ?auto_789094 ) ) ( not ( = ?auto_789092 ?auto_789095 ) ) ( not ( = ?auto_789093 ?auto_789094 ) ) ( not ( = ?auto_789093 ?auto_789095 ) ) ( not ( = ?auto_789094 ?auto_789095 ) ) ( ON ?auto_789093 ?auto_789094 ) ( ON ?auto_789092 ?auto_789093 ) ( CLEAR ?auto_789090 ) ( ON ?auto_789091 ?auto_789092 ) ( CLEAR ?auto_789091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_789079 ?auto_789080 ?auto_789081 ?auto_789082 ?auto_789083 ?auto_789084 ?auto_789085 ?auto_789086 ?auto_789087 ?auto_789088 ?auto_789089 ?auto_789090 ?auto_789091 )
      ( MAKE-16PILE ?auto_789079 ?auto_789080 ?auto_789081 ?auto_789082 ?auto_789083 ?auto_789084 ?auto_789085 ?auto_789086 ?auto_789087 ?auto_789088 ?auto_789089 ?auto_789090 ?auto_789091 ?auto_789092 ?auto_789093 ?auto_789094 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789145 - BLOCK
      ?auto_789146 - BLOCK
      ?auto_789147 - BLOCK
      ?auto_789148 - BLOCK
      ?auto_789149 - BLOCK
      ?auto_789150 - BLOCK
      ?auto_789151 - BLOCK
      ?auto_789152 - BLOCK
      ?auto_789153 - BLOCK
      ?auto_789154 - BLOCK
      ?auto_789155 - BLOCK
      ?auto_789156 - BLOCK
      ?auto_789157 - BLOCK
      ?auto_789158 - BLOCK
      ?auto_789159 - BLOCK
      ?auto_789160 - BLOCK
    )
    :vars
    (
      ?auto_789161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789160 ?auto_789161 ) ( ON-TABLE ?auto_789145 ) ( ON ?auto_789146 ?auto_789145 ) ( ON ?auto_789147 ?auto_789146 ) ( ON ?auto_789148 ?auto_789147 ) ( ON ?auto_789149 ?auto_789148 ) ( ON ?auto_789150 ?auto_789149 ) ( ON ?auto_789151 ?auto_789150 ) ( ON ?auto_789152 ?auto_789151 ) ( ON ?auto_789153 ?auto_789152 ) ( ON ?auto_789154 ?auto_789153 ) ( ON ?auto_789155 ?auto_789154 ) ( not ( = ?auto_789145 ?auto_789146 ) ) ( not ( = ?auto_789145 ?auto_789147 ) ) ( not ( = ?auto_789145 ?auto_789148 ) ) ( not ( = ?auto_789145 ?auto_789149 ) ) ( not ( = ?auto_789145 ?auto_789150 ) ) ( not ( = ?auto_789145 ?auto_789151 ) ) ( not ( = ?auto_789145 ?auto_789152 ) ) ( not ( = ?auto_789145 ?auto_789153 ) ) ( not ( = ?auto_789145 ?auto_789154 ) ) ( not ( = ?auto_789145 ?auto_789155 ) ) ( not ( = ?auto_789145 ?auto_789156 ) ) ( not ( = ?auto_789145 ?auto_789157 ) ) ( not ( = ?auto_789145 ?auto_789158 ) ) ( not ( = ?auto_789145 ?auto_789159 ) ) ( not ( = ?auto_789145 ?auto_789160 ) ) ( not ( = ?auto_789145 ?auto_789161 ) ) ( not ( = ?auto_789146 ?auto_789147 ) ) ( not ( = ?auto_789146 ?auto_789148 ) ) ( not ( = ?auto_789146 ?auto_789149 ) ) ( not ( = ?auto_789146 ?auto_789150 ) ) ( not ( = ?auto_789146 ?auto_789151 ) ) ( not ( = ?auto_789146 ?auto_789152 ) ) ( not ( = ?auto_789146 ?auto_789153 ) ) ( not ( = ?auto_789146 ?auto_789154 ) ) ( not ( = ?auto_789146 ?auto_789155 ) ) ( not ( = ?auto_789146 ?auto_789156 ) ) ( not ( = ?auto_789146 ?auto_789157 ) ) ( not ( = ?auto_789146 ?auto_789158 ) ) ( not ( = ?auto_789146 ?auto_789159 ) ) ( not ( = ?auto_789146 ?auto_789160 ) ) ( not ( = ?auto_789146 ?auto_789161 ) ) ( not ( = ?auto_789147 ?auto_789148 ) ) ( not ( = ?auto_789147 ?auto_789149 ) ) ( not ( = ?auto_789147 ?auto_789150 ) ) ( not ( = ?auto_789147 ?auto_789151 ) ) ( not ( = ?auto_789147 ?auto_789152 ) ) ( not ( = ?auto_789147 ?auto_789153 ) ) ( not ( = ?auto_789147 ?auto_789154 ) ) ( not ( = ?auto_789147 ?auto_789155 ) ) ( not ( = ?auto_789147 ?auto_789156 ) ) ( not ( = ?auto_789147 ?auto_789157 ) ) ( not ( = ?auto_789147 ?auto_789158 ) ) ( not ( = ?auto_789147 ?auto_789159 ) ) ( not ( = ?auto_789147 ?auto_789160 ) ) ( not ( = ?auto_789147 ?auto_789161 ) ) ( not ( = ?auto_789148 ?auto_789149 ) ) ( not ( = ?auto_789148 ?auto_789150 ) ) ( not ( = ?auto_789148 ?auto_789151 ) ) ( not ( = ?auto_789148 ?auto_789152 ) ) ( not ( = ?auto_789148 ?auto_789153 ) ) ( not ( = ?auto_789148 ?auto_789154 ) ) ( not ( = ?auto_789148 ?auto_789155 ) ) ( not ( = ?auto_789148 ?auto_789156 ) ) ( not ( = ?auto_789148 ?auto_789157 ) ) ( not ( = ?auto_789148 ?auto_789158 ) ) ( not ( = ?auto_789148 ?auto_789159 ) ) ( not ( = ?auto_789148 ?auto_789160 ) ) ( not ( = ?auto_789148 ?auto_789161 ) ) ( not ( = ?auto_789149 ?auto_789150 ) ) ( not ( = ?auto_789149 ?auto_789151 ) ) ( not ( = ?auto_789149 ?auto_789152 ) ) ( not ( = ?auto_789149 ?auto_789153 ) ) ( not ( = ?auto_789149 ?auto_789154 ) ) ( not ( = ?auto_789149 ?auto_789155 ) ) ( not ( = ?auto_789149 ?auto_789156 ) ) ( not ( = ?auto_789149 ?auto_789157 ) ) ( not ( = ?auto_789149 ?auto_789158 ) ) ( not ( = ?auto_789149 ?auto_789159 ) ) ( not ( = ?auto_789149 ?auto_789160 ) ) ( not ( = ?auto_789149 ?auto_789161 ) ) ( not ( = ?auto_789150 ?auto_789151 ) ) ( not ( = ?auto_789150 ?auto_789152 ) ) ( not ( = ?auto_789150 ?auto_789153 ) ) ( not ( = ?auto_789150 ?auto_789154 ) ) ( not ( = ?auto_789150 ?auto_789155 ) ) ( not ( = ?auto_789150 ?auto_789156 ) ) ( not ( = ?auto_789150 ?auto_789157 ) ) ( not ( = ?auto_789150 ?auto_789158 ) ) ( not ( = ?auto_789150 ?auto_789159 ) ) ( not ( = ?auto_789150 ?auto_789160 ) ) ( not ( = ?auto_789150 ?auto_789161 ) ) ( not ( = ?auto_789151 ?auto_789152 ) ) ( not ( = ?auto_789151 ?auto_789153 ) ) ( not ( = ?auto_789151 ?auto_789154 ) ) ( not ( = ?auto_789151 ?auto_789155 ) ) ( not ( = ?auto_789151 ?auto_789156 ) ) ( not ( = ?auto_789151 ?auto_789157 ) ) ( not ( = ?auto_789151 ?auto_789158 ) ) ( not ( = ?auto_789151 ?auto_789159 ) ) ( not ( = ?auto_789151 ?auto_789160 ) ) ( not ( = ?auto_789151 ?auto_789161 ) ) ( not ( = ?auto_789152 ?auto_789153 ) ) ( not ( = ?auto_789152 ?auto_789154 ) ) ( not ( = ?auto_789152 ?auto_789155 ) ) ( not ( = ?auto_789152 ?auto_789156 ) ) ( not ( = ?auto_789152 ?auto_789157 ) ) ( not ( = ?auto_789152 ?auto_789158 ) ) ( not ( = ?auto_789152 ?auto_789159 ) ) ( not ( = ?auto_789152 ?auto_789160 ) ) ( not ( = ?auto_789152 ?auto_789161 ) ) ( not ( = ?auto_789153 ?auto_789154 ) ) ( not ( = ?auto_789153 ?auto_789155 ) ) ( not ( = ?auto_789153 ?auto_789156 ) ) ( not ( = ?auto_789153 ?auto_789157 ) ) ( not ( = ?auto_789153 ?auto_789158 ) ) ( not ( = ?auto_789153 ?auto_789159 ) ) ( not ( = ?auto_789153 ?auto_789160 ) ) ( not ( = ?auto_789153 ?auto_789161 ) ) ( not ( = ?auto_789154 ?auto_789155 ) ) ( not ( = ?auto_789154 ?auto_789156 ) ) ( not ( = ?auto_789154 ?auto_789157 ) ) ( not ( = ?auto_789154 ?auto_789158 ) ) ( not ( = ?auto_789154 ?auto_789159 ) ) ( not ( = ?auto_789154 ?auto_789160 ) ) ( not ( = ?auto_789154 ?auto_789161 ) ) ( not ( = ?auto_789155 ?auto_789156 ) ) ( not ( = ?auto_789155 ?auto_789157 ) ) ( not ( = ?auto_789155 ?auto_789158 ) ) ( not ( = ?auto_789155 ?auto_789159 ) ) ( not ( = ?auto_789155 ?auto_789160 ) ) ( not ( = ?auto_789155 ?auto_789161 ) ) ( not ( = ?auto_789156 ?auto_789157 ) ) ( not ( = ?auto_789156 ?auto_789158 ) ) ( not ( = ?auto_789156 ?auto_789159 ) ) ( not ( = ?auto_789156 ?auto_789160 ) ) ( not ( = ?auto_789156 ?auto_789161 ) ) ( not ( = ?auto_789157 ?auto_789158 ) ) ( not ( = ?auto_789157 ?auto_789159 ) ) ( not ( = ?auto_789157 ?auto_789160 ) ) ( not ( = ?auto_789157 ?auto_789161 ) ) ( not ( = ?auto_789158 ?auto_789159 ) ) ( not ( = ?auto_789158 ?auto_789160 ) ) ( not ( = ?auto_789158 ?auto_789161 ) ) ( not ( = ?auto_789159 ?auto_789160 ) ) ( not ( = ?auto_789159 ?auto_789161 ) ) ( not ( = ?auto_789160 ?auto_789161 ) ) ( ON ?auto_789159 ?auto_789160 ) ( ON ?auto_789158 ?auto_789159 ) ( ON ?auto_789157 ?auto_789158 ) ( CLEAR ?auto_789155 ) ( ON ?auto_789156 ?auto_789157 ) ( CLEAR ?auto_789156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_789145 ?auto_789146 ?auto_789147 ?auto_789148 ?auto_789149 ?auto_789150 ?auto_789151 ?auto_789152 ?auto_789153 ?auto_789154 ?auto_789155 ?auto_789156 )
      ( MAKE-16PILE ?auto_789145 ?auto_789146 ?auto_789147 ?auto_789148 ?auto_789149 ?auto_789150 ?auto_789151 ?auto_789152 ?auto_789153 ?auto_789154 ?auto_789155 ?auto_789156 ?auto_789157 ?auto_789158 ?auto_789159 ?auto_789160 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789211 - BLOCK
      ?auto_789212 - BLOCK
      ?auto_789213 - BLOCK
      ?auto_789214 - BLOCK
      ?auto_789215 - BLOCK
      ?auto_789216 - BLOCK
      ?auto_789217 - BLOCK
      ?auto_789218 - BLOCK
      ?auto_789219 - BLOCK
      ?auto_789220 - BLOCK
      ?auto_789221 - BLOCK
      ?auto_789222 - BLOCK
      ?auto_789223 - BLOCK
      ?auto_789224 - BLOCK
      ?auto_789225 - BLOCK
      ?auto_789226 - BLOCK
    )
    :vars
    (
      ?auto_789227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789226 ?auto_789227 ) ( ON-TABLE ?auto_789211 ) ( ON ?auto_789212 ?auto_789211 ) ( ON ?auto_789213 ?auto_789212 ) ( ON ?auto_789214 ?auto_789213 ) ( ON ?auto_789215 ?auto_789214 ) ( ON ?auto_789216 ?auto_789215 ) ( ON ?auto_789217 ?auto_789216 ) ( ON ?auto_789218 ?auto_789217 ) ( ON ?auto_789219 ?auto_789218 ) ( ON ?auto_789220 ?auto_789219 ) ( not ( = ?auto_789211 ?auto_789212 ) ) ( not ( = ?auto_789211 ?auto_789213 ) ) ( not ( = ?auto_789211 ?auto_789214 ) ) ( not ( = ?auto_789211 ?auto_789215 ) ) ( not ( = ?auto_789211 ?auto_789216 ) ) ( not ( = ?auto_789211 ?auto_789217 ) ) ( not ( = ?auto_789211 ?auto_789218 ) ) ( not ( = ?auto_789211 ?auto_789219 ) ) ( not ( = ?auto_789211 ?auto_789220 ) ) ( not ( = ?auto_789211 ?auto_789221 ) ) ( not ( = ?auto_789211 ?auto_789222 ) ) ( not ( = ?auto_789211 ?auto_789223 ) ) ( not ( = ?auto_789211 ?auto_789224 ) ) ( not ( = ?auto_789211 ?auto_789225 ) ) ( not ( = ?auto_789211 ?auto_789226 ) ) ( not ( = ?auto_789211 ?auto_789227 ) ) ( not ( = ?auto_789212 ?auto_789213 ) ) ( not ( = ?auto_789212 ?auto_789214 ) ) ( not ( = ?auto_789212 ?auto_789215 ) ) ( not ( = ?auto_789212 ?auto_789216 ) ) ( not ( = ?auto_789212 ?auto_789217 ) ) ( not ( = ?auto_789212 ?auto_789218 ) ) ( not ( = ?auto_789212 ?auto_789219 ) ) ( not ( = ?auto_789212 ?auto_789220 ) ) ( not ( = ?auto_789212 ?auto_789221 ) ) ( not ( = ?auto_789212 ?auto_789222 ) ) ( not ( = ?auto_789212 ?auto_789223 ) ) ( not ( = ?auto_789212 ?auto_789224 ) ) ( not ( = ?auto_789212 ?auto_789225 ) ) ( not ( = ?auto_789212 ?auto_789226 ) ) ( not ( = ?auto_789212 ?auto_789227 ) ) ( not ( = ?auto_789213 ?auto_789214 ) ) ( not ( = ?auto_789213 ?auto_789215 ) ) ( not ( = ?auto_789213 ?auto_789216 ) ) ( not ( = ?auto_789213 ?auto_789217 ) ) ( not ( = ?auto_789213 ?auto_789218 ) ) ( not ( = ?auto_789213 ?auto_789219 ) ) ( not ( = ?auto_789213 ?auto_789220 ) ) ( not ( = ?auto_789213 ?auto_789221 ) ) ( not ( = ?auto_789213 ?auto_789222 ) ) ( not ( = ?auto_789213 ?auto_789223 ) ) ( not ( = ?auto_789213 ?auto_789224 ) ) ( not ( = ?auto_789213 ?auto_789225 ) ) ( not ( = ?auto_789213 ?auto_789226 ) ) ( not ( = ?auto_789213 ?auto_789227 ) ) ( not ( = ?auto_789214 ?auto_789215 ) ) ( not ( = ?auto_789214 ?auto_789216 ) ) ( not ( = ?auto_789214 ?auto_789217 ) ) ( not ( = ?auto_789214 ?auto_789218 ) ) ( not ( = ?auto_789214 ?auto_789219 ) ) ( not ( = ?auto_789214 ?auto_789220 ) ) ( not ( = ?auto_789214 ?auto_789221 ) ) ( not ( = ?auto_789214 ?auto_789222 ) ) ( not ( = ?auto_789214 ?auto_789223 ) ) ( not ( = ?auto_789214 ?auto_789224 ) ) ( not ( = ?auto_789214 ?auto_789225 ) ) ( not ( = ?auto_789214 ?auto_789226 ) ) ( not ( = ?auto_789214 ?auto_789227 ) ) ( not ( = ?auto_789215 ?auto_789216 ) ) ( not ( = ?auto_789215 ?auto_789217 ) ) ( not ( = ?auto_789215 ?auto_789218 ) ) ( not ( = ?auto_789215 ?auto_789219 ) ) ( not ( = ?auto_789215 ?auto_789220 ) ) ( not ( = ?auto_789215 ?auto_789221 ) ) ( not ( = ?auto_789215 ?auto_789222 ) ) ( not ( = ?auto_789215 ?auto_789223 ) ) ( not ( = ?auto_789215 ?auto_789224 ) ) ( not ( = ?auto_789215 ?auto_789225 ) ) ( not ( = ?auto_789215 ?auto_789226 ) ) ( not ( = ?auto_789215 ?auto_789227 ) ) ( not ( = ?auto_789216 ?auto_789217 ) ) ( not ( = ?auto_789216 ?auto_789218 ) ) ( not ( = ?auto_789216 ?auto_789219 ) ) ( not ( = ?auto_789216 ?auto_789220 ) ) ( not ( = ?auto_789216 ?auto_789221 ) ) ( not ( = ?auto_789216 ?auto_789222 ) ) ( not ( = ?auto_789216 ?auto_789223 ) ) ( not ( = ?auto_789216 ?auto_789224 ) ) ( not ( = ?auto_789216 ?auto_789225 ) ) ( not ( = ?auto_789216 ?auto_789226 ) ) ( not ( = ?auto_789216 ?auto_789227 ) ) ( not ( = ?auto_789217 ?auto_789218 ) ) ( not ( = ?auto_789217 ?auto_789219 ) ) ( not ( = ?auto_789217 ?auto_789220 ) ) ( not ( = ?auto_789217 ?auto_789221 ) ) ( not ( = ?auto_789217 ?auto_789222 ) ) ( not ( = ?auto_789217 ?auto_789223 ) ) ( not ( = ?auto_789217 ?auto_789224 ) ) ( not ( = ?auto_789217 ?auto_789225 ) ) ( not ( = ?auto_789217 ?auto_789226 ) ) ( not ( = ?auto_789217 ?auto_789227 ) ) ( not ( = ?auto_789218 ?auto_789219 ) ) ( not ( = ?auto_789218 ?auto_789220 ) ) ( not ( = ?auto_789218 ?auto_789221 ) ) ( not ( = ?auto_789218 ?auto_789222 ) ) ( not ( = ?auto_789218 ?auto_789223 ) ) ( not ( = ?auto_789218 ?auto_789224 ) ) ( not ( = ?auto_789218 ?auto_789225 ) ) ( not ( = ?auto_789218 ?auto_789226 ) ) ( not ( = ?auto_789218 ?auto_789227 ) ) ( not ( = ?auto_789219 ?auto_789220 ) ) ( not ( = ?auto_789219 ?auto_789221 ) ) ( not ( = ?auto_789219 ?auto_789222 ) ) ( not ( = ?auto_789219 ?auto_789223 ) ) ( not ( = ?auto_789219 ?auto_789224 ) ) ( not ( = ?auto_789219 ?auto_789225 ) ) ( not ( = ?auto_789219 ?auto_789226 ) ) ( not ( = ?auto_789219 ?auto_789227 ) ) ( not ( = ?auto_789220 ?auto_789221 ) ) ( not ( = ?auto_789220 ?auto_789222 ) ) ( not ( = ?auto_789220 ?auto_789223 ) ) ( not ( = ?auto_789220 ?auto_789224 ) ) ( not ( = ?auto_789220 ?auto_789225 ) ) ( not ( = ?auto_789220 ?auto_789226 ) ) ( not ( = ?auto_789220 ?auto_789227 ) ) ( not ( = ?auto_789221 ?auto_789222 ) ) ( not ( = ?auto_789221 ?auto_789223 ) ) ( not ( = ?auto_789221 ?auto_789224 ) ) ( not ( = ?auto_789221 ?auto_789225 ) ) ( not ( = ?auto_789221 ?auto_789226 ) ) ( not ( = ?auto_789221 ?auto_789227 ) ) ( not ( = ?auto_789222 ?auto_789223 ) ) ( not ( = ?auto_789222 ?auto_789224 ) ) ( not ( = ?auto_789222 ?auto_789225 ) ) ( not ( = ?auto_789222 ?auto_789226 ) ) ( not ( = ?auto_789222 ?auto_789227 ) ) ( not ( = ?auto_789223 ?auto_789224 ) ) ( not ( = ?auto_789223 ?auto_789225 ) ) ( not ( = ?auto_789223 ?auto_789226 ) ) ( not ( = ?auto_789223 ?auto_789227 ) ) ( not ( = ?auto_789224 ?auto_789225 ) ) ( not ( = ?auto_789224 ?auto_789226 ) ) ( not ( = ?auto_789224 ?auto_789227 ) ) ( not ( = ?auto_789225 ?auto_789226 ) ) ( not ( = ?auto_789225 ?auto_789227 ) ) ( not ( = ?auto_789226 ?auto_789227 ) ) ( ON ?auto_789225 ?auto_789226 ) ( ON ?auto_789224 ?auto_789225 ) ( ON ?auto_789223 ?auto_789224 ) ( ON ?auto_789222 ?auto_789223 ) ( CLEAR ?auto_789220 ) ( ON ?auto_789221 ?auto_789222 ) ( CLEAR ?auto_789221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_789211 ?auto_789212 ?auto_789213 ?auto_789214 ?auto_789215 ?auto_789216 ?auto_789217 ?auto_789218 ?auto_789219 ?auto_789220 ?auto_789221 )
      ( MAKE-16PILE ?auto_789211 ?auto_789212 ?auto_789213 ?auto_789214 ?auto_789215 ?auto_789216 ?auto_789217 ?auto_789218 ?auto_789219 ?auto_789220 ?auto_789221 ?auto_789222 ?auto_789223 ?auto_789224 ?auto_789225 ?auto_789226 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789277 - BLOCK
      ?auto_789278 - BLOCK
      ?auto_789279 - BLOCK
      ?auto_789280 - BLOCK
      ?auto_789281 - BLOCK
      ?auto_789282 - BLOCK
      ?auto_789283 - BLOCK
      ?auto_789284 - BLOCK
      ?auto_789285 - BLOCK
      ?auto_789286 - BLOCK
      ?auto_789287 - BLOCK
      ?auto_789288 - BLOCK
      ?auto_789289 - BLOCK
      ?auto_789290 - BLOCK
      ?auto_789291 - BLOCK
      ?auto_789292 - BLOCK
    )
    :vars
    (
      ?auto_789293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789292 ?auto_789293 ) ( ON-TABLE ?auto_789277 ) ( ON ?auto_789278 ?auto_789277 ) ( ON ?auto_789279 ?auto_789278 ) ( ON ?auto_789280 ?auto_789279 ) ( ON ?auto_789281 ?auto_789280 ) ( ON ?auto_789282 ?auto_789281 ) ( ON ?auto_789283 ?auto_789282 ) ( ON ?auto_789284 ?auto_789283 ) ( ON ?auto_789285 ?auto_789284 ) ( not ( = ?auto_789277 ?auto_789278 ) ) ( not ( = ?auto_789277 ?auto_789279 ) ) ( not ( = ?auto_789277 ?auto_789280 ) ) ( not ( = ?auto_789277 ?auto_789281 ) ) ( not ( = ?auto_789277 ?auto_789282 ) ) ( not ( = ?auto_789277 ?auto_789283 ) ) ( not ( = ?auto_789277 ?auto_789284 ) ) ( not ( = ?auto_789277 ?auto_789285 ) ) ( not ( = ?auto_789277 ?auto_789286 ) ) ( not ( = ?auto_789277 ?auto_789287 ) ) ( not ( = ?auto_789277 ?auto_789288 ) ) ( not ( = ?auto_789277 ?auto_789289 ) ) ( not ( = ?auto_789277 ?auto_789290 ) ) ( not ( = ?auto_789277 ?auto_789291 ) ) ( not ( = ?auto_789277 ?auto_789292 ) ) ( not ( = ?auto_789277 ?auto_789293 ) ) ( not ( = ?auto_789278 ?auto_789279 ) ) ( not ( = ?auto_789278 ?auto_789280 ) ) ( not ( = ?auto_789278 ?auto_789281 ) ) ( not ( = ?auto_789278 ?auto_789282 ) ) ( not ( = ?auto_789278 ?auto_789283 ) ) ( not ( = ?auto_789278 ?auto_789284 ) ) ( not ( = ?auto_789278 ?auto_789285 ) ) ( not ( = ?auto_789278 ?auto_789286 ) ) ( not ( = ?auto_789278 ?auto_789287 ) ) ( not ( = ?auto_789278 ?auto_789288 ) ) ( not ( = ?auto_789278 ?auto_789289 ) ) ( not ( = ?auto_789278 ?auto_789290 ) ) ( not ( = ?auto_789278 ?auto_789291 ) ) ( not ( = ?auto_789278 ?auto_789292 ) ) ( not ( = ?auto_789278 ?auto_789293 ) ) ( not ( = ?auto_789279 ?auto_789280 ) ) ( not ( = ?auto_789279 ?auto_789281 ) ) ( not ( = ?auto_789279 ?auto_789282 ) ) ( not ( = ?auto_789279 ?auto_789283 ) ) ( not ( = ?auto_789279 ?auto_789284 ) ) ( not ( = ?auto_789279 ?auto_789285 ) ) ( not ( = ?auto_789279 ?auto_789286 ) ) ( not ( = ?auto_789279 ?auto_789287 ) ) ( not ( = ?auto_789279 ?auto_789288 ) ) ( not ( = ?auto_789279 ?auto_789289 ) ) ( not ( = ?auto_789279 ?auto_789290 ) ) ( not ( = ?auto_789279 ?auto_789291 ) ) ( not ( = ?auto_789279 ?auto_789292 ) ) ( not ( = ?auto_789279 ?auto_789293 ) ) ( not ( = ?auto_789280 ?auto_789281 ) ) ( not ( = ?auto_789280 ?auto_789282 ) ) ( not ( = ?auto_789280 ?auto_789283 ) ) ( not ( = ?auto_789280 ?auto_789284 ) ) ( not ( = ?auto_789280 ?auto_789285 ) ) ( not ( = ?auto_789280 ?auto_789286 ) ) ( not ( = ?auto_789280 ?auto_789287 ) ) ( not ( = ?auto_789280 ?auto_789288 ) ) ( not ( = ?auto_789280 ?auto_789289 ) ) ( not ( = ?auto_789280 ?auto_789290 ) ) ( not ( = ?auto_789280 ?auto_789291 ) ) ( not ( = ?auto_789280 ?auto_789292 ) ) ( not ( = ?auto_789280 ?auto_789293 ) ) ( not ( = ?auto_789281 ?auto_789282 ) ) ( not ( = ?auto_789281 ?auto_789283 ) ) ( not ( = ?auto_789281 ?auto_789284 ) ) ( not ( = ?auto_789281 ?auto_789285 ) ) ( not ( = ?auto_789281 ?auto_789286 ) ) ( not ( = ?auto_789281 ?auto_789287 ) ) ( not ( = ?auto_789281 ?auto_789288 ) ) ( not ( = ?auto_789281 ?auto_789289 ) ) ( not ( = ?auto_789281 ?auto_789290 ) ) ( not ( = ?auto_789281 ?auto_789291 ) ) ( not ( = ?auto_789281 ?auto_789292 ) ) ( not ( = ?auto_789281 ?auto_789293 ) ) ( not ( = ?auto_789282 ?auto_789283 ) ) ( not ( = ?auto_789282 ?auto_789284 ) ) ( not ( = ?auto_789282 ?auto_789285 ) ) ( not ( = ?auto_789282 ?auto_789286 ) ) ( not ( = ?auto_789282 ?auto_789287 ) ) ( not ( = ?auto_789282 ?auto_789288 ) ) ( not ( = ?auto_789282 ?auto_789289 ) ) ( not ( = ?auto_789282 ?auto_789290 ) ) ( not ( = ?auto_789282 ?auto_789291 ) ) ( not ( = ?auto_789282 ?auto_789292 ) ) ( not ( = ?auto_789282 ?auto_789293 ) ) ( not ( = ?auto_789283 ?auto_789284 ) ) ( not ( = ?auto_789283 ?auto_789285 ) ) ( not ( = ?auto_789283 ?auto_789286 ) ) ( not ( = ?auto_789283 ?auto_789287 ) ) ( not ( = ?auto_789283 ?auto_789288 ) ) ( not ( = ?auto_789283 ?auto_789289 ) ) ( not ( = ?auto_789283 ?auto_789290 ) ) ( not ( = ?auto_789283 ?auto_789291 ) ) ( not ( = ?auto_789283 ?auto_789292 ) ) ( not ( = ?auto_789283 ?auto_789293 ) ) ( not ( = ?auto_789284 ?auto_789285 ) ) ( not ( = ?auto_789284 ?auto_789286 ) ) ( not ( = ?auto_789284 ?auto_789287 ) ) ( not ( = ?auto_789284 ?auto_789288 ) ) ( not ( = ?auto_789284 ?auto_789289 ) ) ( not ( = ?auto_789284 ?auto_789290 ) ) ( not ( = ?auto_789284 ?auto_789291 ) ) ( not ( = ?auto_789284 ?auto_789292 ) ) ( not ( = ?auto_789284 ?auto_789293 ) ) ( not ( = ?auto_789285 ?auto_789286 ) ) ( not ( = ?auto_789285 ?auto_789287 ) ) ( not ( = ?auto_789285 ?auto_789288 ) ) ( not ( = ?auto_789285 ?auto_789289 ) ) ( not ( = ?auto_789285 ?auto_789290 ) ) ( not ( = ?auto_789285 ?auto_789291 ) ) ( not ( = ?auto_789285 ?auto_789292 ) ) ( not ( = ?auto_789285 ?auto_789293 ) ) ( not ( = ?auto_789286 ?auto_789287 ) ) ( not ( = ?auto_789286 ?auto_789288 ) ) ( not ( = ?auto_789286 ?auto_789289 ) ) ( not ( = ?auto_789286 ?auto_789290 ) ) ( not ( = ?auto_789286 ?auto_789291 ) ) ( not ( = ?auto_789286 ?auto_789292 ) ) ( not ( = ?auto_789286 ?auto_789293 ) ) ( not ( = ?auto_789287 ?auto_789288 ) ) ( not ( = ?auto_789287 ?auto_789289 ) ) ( not ( = ?auto_789287 ?auto_789290 ) ) ( not ( = ?auto_789287 ?auto_789291 ) ) ( not ( = ?auto_789287 ?auto_789292 ) ) ( not ( = ?auto_789287 ?auto_789293 ) ) ( not ( = ?auto_789288 ?auto_789289 ) ) ( not ( = ?auto_789288 ?auto_789290 ) ) ( not ( = ?auto_789288 ?auto_789291 ) ) ( not ( = ?auto_789288 ?auto_789292 ) ) ( not ( = ?auto_789288 ?auto_789293 ) ) ( not ( = ?auto_789289 ?auto_789290 ) ) ( not ( = ?auto_789289 ?auto_789291 ) ) ( not ( = ?auto_789289 ?auto_789292 ) ) ( not ( = ?auto_789289 ?auto_789293 ) ) ( not ( = ?auto_789290 ?auto_789291 ) ) ( not ( = ?auto_789290 ?auto_789292 ) ) ( not ( = ?auto_789290 ?auto_789293 ) ) ( not ( = ?auto_789291 ?auto_789292 ) ) ( not ( = ?auto_789291 ?auto_789293 ) ) ( not ( = ?auto_789292 ?auto_789293 ) ) ( ON ?auto_789291 ?auto_789292 ) ( ON ?auto_789290 ?auto_789291 ) ( ON ?auto_789289 ?auto_789290 ) ( ON ?auto_789288 ?auto_789289 ) ( ON ?auto_789287 ?auto_789288 ) ( CLEAR ?auto_789285 ) ( ON ?auto_789286 ?auto_789287 ) ( CLEAR ?auto_789286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_789277 ?auto_789278 ?auto_789279 ?auto_789280 ?auto_789281 ?auto_789282 ?auto_789283 ?auto_789284 ?auto_789285 ?auto_789286 )
      ( MAKE-16PILE ?auto_789277 ?auto_789278 ?auto_789279 ?auto_789280 ?auto_789281 ?auto_789282 ?auto_789283 ?auto_789284 ?auto_789285 ?auto_789286 ?auto_789287 ?auto_789288 ?auto_789289 ?auto_789290 ?auto_789291 ?auto_789292 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789343 - BLOCK
      ?auto_789344 - BLOCK
      ?auto_789345 - BLOCK
      ?auto_789346 - BLOCK
      ?auto_789347 - BLOCK
      ?auto_789348 - BLOCK
      ?auto_789349 - BLOCK
      ?auto_789350 - BLOCK
      ?auto_789351 - BLOCK
      ?auto_789352 - BLOCK
      ?auto_789353 - BLOCK
      ?auto_789354 - BLOCK
      ?auto_789355 - BLOCK
      ?auto_789356 - BLOCK
      ?auto_789357 - BLOCK
      ?auto_789358 - BLOCK
    )
    :vars
    (
      ?auto_789359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789358 ?auto_789359 ) ( ON-TABLE ?auto_789343 ) ( ON ?auto_789344 ?auto_789343 ) ( ON ?auto_789345 ?auto_789344 ) ( ON ?auto_789346 ?auto_789345 ) ( ON ?auto_789347 ?auto_789346 ) ( ON ?auto_789348 ?auto_789347 ) ( ON ?auto_789349 ?auto_789348 ) ( ON ?auto_789350 ?auto_789349 ) ( not ( = ?auto_789343 ?auto_789344 ) ) ( not ( = ?auto_789343 ?auto_789345 ) ) ( not ( = ?auto_789343 ?auto_789346 ) ) ( not ( = ?auto_789343 ?auto_789347 ) ) ( not ( = ?auto_789343 ?auto_789348 ) ) ( not ( = ?auto_789343 ?auto_789349 ) ) ( not ( = ?auto_789343 ?auto_789350 ) ) ( not ( = ?auto_789343 ?auto_789351 ) ) ( not ( = ?auto_789343 ?auto_789352 ) ) ( not ( = ?auto_789343 ?auto_789353 ) ) ( not ( = ?auto_789343 ?auto_789354 ) ) ( not ( = ?auto_789343 ?auto_789355 ) ) ( not ( = ?auto_789343 ?auto_789356 ) ) ( not ( = ?auto_789343 ?auto_789357 ) ) ( not ( = ?auto_789343 ?auto_789358 ) ) ( not ( = ?auto_789343 ?auto_789359 ) ) ( not ( = ?auto_789344 ?auto_789345 ) ) ( not ( = ?auto_789344 ?auto_789346 ) ) ( not ( = ?auto_789344 ?auto_789347 ) ) ( not ( = ?auto_789344 ?auto_789348 ) ) ( not ( = ?auto_789344 ?auto_789349 ) ) ( not ( = ?auto_789344 ?auto_789350 ) ) ( not ( = ?auto_789344 ?auto_789351 ) ) ( not ( = ?auto_789344 ?auto_789352 ) ) ( not ( = ?auto_789344 ?auto_789353 ) ) ( not ( = ?auto_789344 ?auto_789354 ) ) ( not ( = ?auto_789344 ?auto_789355 ) ) ( not ( = ?auto_789344 ?auto_789356 ) ) ( not ( = ?auto_789344 ?auto_789357 ) ) ( not ( = ?auto_789344 ?auto_789358 ) ) ( not ( = ?auto_789344 ?auto_789359 ) ) ( not ( = ?auto_789345 ?auto_789346 ) ) ( not ( = ?auto_789345 ?auto_789347 ) ) ( not ( = ?auto_789345 ?auto_789348 ) ) ( not ( = ?auto_789345 ?auto_789349 ) ) ( not ( = ?auto_789345 ?auto_789350 ) ) ( not ( = ?auto_789345 ?auto_789351 ) ) ( not ( = ?auto_789345 ?auto_789352 ) ) ( not ( = ?auto_789345 ?auto_789353 ) ) ( not ( = ?auto_789345 ?auto_789354 ) ) ( not ( = ?auto_789345 ?auto_789355 ) ) ( not ( = ?auto_789345 ?auto_789356 ) ) ( not ( = ?auto_789345 ?auto_789357 ) ) ( not ( = ?auto_789345 ?auto_789358 ) ) ( not ( = ?auto_789345 ?auto_789359 ) ) ( not ( = ?auto_789346 ?auto_789347 ) ) ( not ( = ?auto_789346 ?auto_789348 ) ) ( not ( = ?auto_789346 ?auto_789349 ) ) ( not ( = ?auto_789346 ?auto_789350 ) ) ( not ( = ?auto_789346 ?auto_789351 ) ) ( not ( = ?auto_789346 ?auto_789352 ) ) ( not ( = ?auto_789346 ?auto_789353 ) ) ( not ( = ?auto_789346 ?auto_789354 ) ) ( not ( = ?auto_789346 ?auto_789355 ) ) ( not ( = ?auto_789346 ?auto_789356 ) ) ( not ( = ?auto_789346 ?auto_789357 ) ) ( not ( = ?auto_789346 ?auto_789358 ) ) ( not ( = ?auto_789346 ?auto_789359 ) ) ( not ( = ?auto_789347 ?auto_789348 ) ) ( not ( = ?auto_789347 ?auto_789349 ) ) ( not ( = ?auto_789347 ?auto_789350 ) ) ( not ( = ?auto_789347 ?auto_789351 ) ) ( not ( = ?auto_789347 ?auto_789352 ) ) ( not ( = ?auto_789347 ?auto_789353 ) ) ( not ( = ?auto_789347 ?auto_789354 ) ) ( not ( = ?auto_789347 ?auto_789355 ) ) ( not ( = ?auto_789347 ?auto_789356 ) ) ( not ( = ?auto_789347 ?auto_789357 ) ) ( not ( = ?auto_789347 ?auto_789358 ) ) ( not ( = ?auto_789347 ?auto_789359 ) ) ( not ( = ?auto_789348 ?auto_789349 ) ) ( not ( = ?auto_789348 ?auto_789350 ) ) ( not ( = ?auto_789348 ?auto_789351 ) ) ( not ( = ?auto_789348 ?auto_789352 ) ) ( not ( = ?auto_789348 ?auto_789353 ) ) ( not ( = ?auto_789348 ?auto_789354 ) ) ( not ( = ?auto_789348 ?auto_789355 ) ) ( not ( = ?auto_789348 ?auto_789356 ) ) ( not ( = ?auto_789348 ?auto_789357 ) ) ( not ( = ?auto_789348 ?auto_789358 ) ) ( not ( = ?auto_789348 ?auto_789359 ) ) ( not ( = ?auto_789349 ?auto_789350 ) ) ( not ( = ?auto_789349 ?auto_789351 ) ) ( not ( = ?auto_789349 ?auto_789352 ) ) ( not ( = ?auto_789349 ?auto_789353 ) ) ( not ( = ?auto_789349 ?auto_789354 ) ) ( not ( = ?auto_789349 ?auto_789355 ) ) ( not ( = ?auto_789349 ?auto_789356 ) ) ( not ( = ?auto_789349 ?auto_789357 ) ) ( not ( = ?auto_789349 ?auto_789358 ) ) ( not ( = ?auto_789349 ?auto_789359 ) ) ( not ( = ?auto_789350 ?auto_789351 ) ) ( not ( = ?auto_789350 ?auto_789352 ) ) ( not ( = ?auto_789350 ?auto_789353 ) ) ( not ( = ?auto_789350 ?auto_789354 ) ) ( not ( = ?auto_789350 ?auto_789355 ) ) ( not ( = ?auto_789350 ?auto_789356 ) ) ( not ( = ?auto_789350 ?auto_789357 ) ) ( not ( = ?auto_789350 ?auto_789358 ) ) ( not ( = ?auto_789350 ?auto_789359 ) ) ( not ( = ?auto_789351 ?auto_789352 ) ) ( not ( = ?auto_789351 ?auto_789353 ) ) ( not ( = ?auto_789351 ?auto_789354 ) ) ( not ( = ?auto_789351 ?auto_789355 ) ) ( not ( = ?auto_789351 ?auto_789356 ) ) ( not ( = ?auto_789351 ?auto_789357 ) ) ( not ( = ?auto_789351 ?auto_789358 ) ) ( not ( = ?auto_789351 ?auto_789359 ) ) ( not ( = ?auto_789352 ?auto_789353 ) ) ( not ( = ?auto_789352 ?auto_789354 ) ) ( not ( = ?auto_789352 ?auto_789355 ) ) ( not ( = ?auto_789352 ?auto_789356 ) ) ( not ( = ?auto_789352 ?auto_789357 ) ) ( not ( = ?auto_789352 ?auto_789358 ) ) ( not ( = ?auto_789352 ?auto_789359 ) ) ( not ( = ?auto_789353 ?auto_789354 ) ) ( not ( = ?auto_789353 ?auto_789355 ) ) ( not ( = ?auto_789353 ?auto_789356 ) ) ( not ( = ?auto_789353 ?auto_789357 ) ) ( not ( = ?auto_789353 ?auto_789358 ) ) ( not ( = ?auto_789353 ?auto_789359 ) ) ( not ( = ?auto_789354 ?auto_789355 ) ) ( not ( = ?auto_789354 ?auto_789356 ) ) ( not ( = ?auto_789354 ?auto_789357 ) ) ( not ( = ?auto_789354 ?auto_789358 ) ) ( not ( = ?auto_789354 ?auto_789359 ) ) ( not ( = ?auto_789355 ?auto_789356 ) ) ( not ( = ?auto_789355 ?auto_789357 ) ) ( not ( = ?auto_789355 ?auto_789358 ) ) ( not ( = ?auto_789355 ?auto_789359 ) ) ( not ( = ?auto_789356 ?auto_789357 ) ) ( not ( = ?auto_789356 ?auto_789358 ) ) ( not ( = ?auto_789356 ?auto_789359 ) ) ( not ( = ?auto_789357 ?auto_789358 ) ) ( not ( = ?auto_789357 ?auto_789359 ) ) ( not ( = ?auto_789358 ?auto_789359 ) ) ( ON ?auto_789357 ?auto_789358 ) ( ON ?auto_789356 ?auto_789357 ) ( ON ?auto_789355 ?auto_789356 ) ( ON ?auto_789354 ?auto_789355 ) ( ON ?auto_789353 ?auto_789354 ) ( ON ?auto_789352 ?auto_789353 ) ( CLEAR ?auto_789350 ) ( ON ?auto_789351 ?auto_789352 ) ( CLEAR ?auto_789351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_789343 ?auto_789344 ?auto_789345 ?auto_789346 ?auto_789347 ?auto_789348 ?auto_789349 ?auto_789350 ?auto_789351 )
      ( MAKE-16PILE ?auto_789343 ?auto_789344 ?auto_789345 ?auto_789346 ?auto_789347 ?auto_789348 ?auto_789349 ?auto_789350 ?auto_789351 ?auto_789352 ?auto_789353 ?auto_789354 ?auto_789355 ?auto_789356 ?auto_789357 ?auto_789358 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789409 - BLOCK
      ?auto_789410 - BLOCK
      ?auto_789411 - BLOCK
      ?auto_789412 - BLOCK
      ?auto_789413 - BLOCK
      ?auto_789414 - BLOCK
      ?auto_789415 - BLOCK
      ?auto_789416 - BLOCK
      ?auto_789417 - BLOCK
      ?auto_789418 - BLOCK
      ?auto_789419 - BLOCK
      ?auto_789420 - BLOCK
      ?auto_789421 - BLOCK
      ?auto_789422 - BLOCK
      ?auto_789423 - BLOCK
      ?auto_789424 - BLOCK
    )
    :vars
    (
      ?auto_789425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789424 ?auto_789425 ) ( ON-TABLE ?auto_789409 ) ( ON ?auto_789410 ?auto_789409 ) ( ON ?auto_789411 ?auto_789410 ) ( ON ?auto_789412 ?auto_789411 ) ( ON ?auto_789413 ?auto_789412 ) ( ON ?auto_789414 ?auto_789413 ) ( ON ?auto_789415 ?auto_789414 ) ( not ( = ?auto_789409 ?auto_789410 ) ) ( not ( = ?auto_789409 ?auto_789411 ) ) ( not ( = ?auto_789409 ?auto_789412 ) ) ( not ( = ?auto_789409 ?auto_789413 ) ) ( not ( = ?auto_789409 ?auto_789414 ) ) ( not ( = ?auto_789409 ?auto_789415 ) ) ( not ( = ?auto_789409 ?auto_789416 ) ) ( not ( = ?auto_789409 ?auto_789417 ) ) ( not ( = ?auto_789409 ?auto_789418 ) ) ( not ( = ?auto_789409 ?auto_789419 ) ) ( not ( = ?auto_789409 ?auto_789420 ) ) ( not ( = ?auto_789409 ?auto_789421 ) ) ( not ( = ?auto_789409 ?auto_789422 ) ) ( not ( = ?auto_789409 ?auto_789423 ) ) ( not ( = ?auto_789409 ?auto_789424 ) ) ( not ( = ?auto_789409 ?auto_789425 ) ) ( not ( = ?auto_789410 ?auto_789411 ) ) ( not ( = ?auto_789410 ?auto_789412 ) ) ( not ( = ?auto_789410 ?auto_789413 ) ) ( not ( = ?auto_789410 ?auto_789414 ) ) ( not ( = ?auto_789410 ?auto_789415 ) ) ( not ( = ?auto_789410 ?auto_789416 ) ) ( not ( = ?auto_789410 ?auto_789417 ) ) ( not ( = ?auto_789410 ?auto_789418 ) ) ( not ( = ?auto_789410 ?auto_789419 ) ) ( not ( = ?auto_789410 ?auto_789420 ) ) ( not ( = ?auto_789410 ?auto_789421 ) ) ( not ( = ?auto_789410 ?auto_789422 ) ) ( not ( = ?auto_789410 ?auto_789423 ) ) ( not ( = ?auto_789410 ?auto_789424 ) ) ( not ( = ?auto_789410 ?auto_789425 ) ) ( not ( = ?auto_789411 ?auto_789412 ) ) ( not ( = ?auto_789411 ?auto_789413 ) ) ( not ( = ?auto_789411 ?auto_789414 ) ) ( not ( = ?auto_789411 ?auto_789415 ) ) ( not ( = ?auto_789411 ?auto_789416 ) ) ( not ( = ?auto_789411 ?auto_789417 ) ) ( not ( = ?auto_789411 ?auto_789418 ) ) ( not ( = ?auto_789411 ?auto_789419 ) ) ( not ( = ?auto_789411 ?auto_789420 ) ) ( not ( = ?auto_789411 ?auto_789421 ) ) ( not ( = ?auto_789411 ?auto_789422 ) ) ( not ( = ?auto_789411 ?auto_789423 ) ) ( not ( = ?auto_789411 ?auto_789424 ) ) ( not ( = ?auto_789411 ?auto_789425 ) ) ( not ( = ?auto_789412 ?auto_789413 ) ) ( not ( = ?auto_789412 ?auto_789414 ) ) ( not ( = ?auto_789412 ?auto_789415 ) ) ( not ( = ?auto_789412 ?auto_789416 ) ) ( not ( = ?auto_789412 ?auto_789417 ) ) ( not ( = ?auto_789412 ?auto_789418 ) ) ( not ( = ?auto_789412 ?auto_789419 ) ) ( not ( = ?auto_789412 ?auto_789420 ) ) ( not ( = ?auto_789412 ?auto_789421 ) ) ( not ( = ?auto_789412 ?auto_789422 ) ) ( not ( = ?auto_789412 ?auto_789423 ) ) ( not ( = ?auto_789412 ?auto_789424 ) ) ( not ( = ?auto_789412 ?auto_789425 ) ) ( not ( = ?auto_789413 ?auto_789414 ) ) ( not ( = ?auto_789413 ?auto_789415 ) ) ( not ( = ?auto_789413 ?auto_789416 ) ) ( not ( = ?auto_789413 ?auto_789417 ) ) ( not ( = ?auto_789413 ?auto_789418 ) ) ( not ( = ?auto_789413 ?auto_789419 ) ) ( not ( = ?auto_789413 ?auto_789420 ) ) ( not ( = ?auto_789413 ?auto_789421 ) ) ( not ( = ?auto_789413 ?auto_789422 ) ) ( not ( = ?auto_789413 ?auto_789423 ) ) ( not ( = ?auto_789413 ?auto_789424 ) ) ( not ( = ?auto_789413 ?auto_789425 ) ) ( not ( = ?auto_789414 ?auto_789415 ) ) ( not ( = ?auto_789414 ?auto_789416 ) ) ( not ( = ?auto_789414 ?auto_789417 ) ) ( not ( = ?auto_789414 ?auto_789418 ) ) ( not ( = ?auto_789414 ?auto_789419 ) ) ( not ( = ?auto_789414 ?auto_789420 ) ) ( not ( = ?auto_789414 ?auto_789421 ) ) ( not ( = ?auto_789414 ?auto_789422 ) ) ( not ( = ?auto_789414 ?auto_789423 ) ) ( not ( = ?auto_789414 ?auto_789424 ) ) ( not ( = ?auto_789414 ?auto_789425 ) ) ( not ( = ?auto_789415 ?auto_789416 ) ) ( not ( = ?auto_789415 ?auto_789417 ) ) ( not ( = ?auto_789415 ?auto_789418 ) ) ( not ( = ?auto_789415 ?auto_789419 ) ) ( not ( = ?auto_789415 ?auto_789420 ) ) ( not ( = ?auto_789415 ?auto_789421 ) ) ( not ( = ?auto_789415 ?auto_789422 ) ) ( not ( = ?auto_789415 ?auto_789423 ) ) ( not ( = ?auto_789415 ?auto_789424 ) ) ( not ( = ?auto_789415 ?auto_789425 ) ) ( not ( = ?auto_789416 ?auto_789417 ) ) ( not ( = ?auto_789416 ?auto_789418 ) ) ( not ( = ?auto_789416 ?auto_789419 ) ) ( not ( = ?auto_789416 ?auto_789420 ) ) ( not ( = ?auto_789416 ?auto_789421 ) ) ( not ( = ?auto_789416 ?auto_789422 ) ) ( not ( = ?auto_789416 ?auto_789423 ) ) ( not ( = ?auto_789416 ?auto_789424 ) ) ( not ( = ?auto_789416 ?auto_789425 ) ) ( not ( = ?auto_789417 ?auto_789418 ) ) ( not ( = ?auto_789417 ?auto_789419 ) ) ( not ( = ?auto_789417 ?auto_789420 ) ) ( not ( = ?auto_789417 ?auto_789421 ) ) ( not ( = ?auto_789417 ?auto_789422 ) ) ( not ( = ?auto_789417 ?auto_789423 ) ) ( not ( = ?auto_789417 ?auto_789424 ) ) ( not ( = ?auto_789417 ?auto_789425 ) ) ( not ( = ?auto_789418 ?auto_789419 ) ) ( not ( = ?auto_789418 ?auto_789420 ) ) ( not ( = ?auto_789418 ?auto_789421 ) ) ( not ( = ?auto_789418 ?auto_789422 ) ) ( not ( = ?auto_789418 ?auto_789423 ) ) ( not ( = ?auto_789418 ?auto_789424 ) ) ( not ( = ?auto_789418 ?auto_789425 ) ) ( not ( = ?auto_789419 ?auto_789420 ) ) ( not ( = ?auto_789419 ?auto_789421 ) ) ( not ( = ?auto_789419 ?auto_789422 ) ) ( not ( = ?auto_789419 ?auto_789423 ) ) ( not ( = ?auto_789419 ?auto_789424 ) ) ( not ( = ?auto_789419 ?auto_789425 ) ) ( not ( = ?auto_789420 ?auto_789421 ) ) ( not ( = ?auto_789420 ?auto_789422 ) ) ( not ( = ?auto_789420 ?auto_789423 ) ) ( not ( = ?auto_789420 ?auto_789424 ) ) ( not ( = ?auto_789420 ?auto_789425 ) ) ( not ( = ?auto_789421 ?auto_789422 ) ) ( not ( = ?auto_789421 ?auto_789423 ) ) ( not ( = ?auto_789421 ?auto_789424 ) ) ( not ( = ?auto_789421 ?auto_789425 ) ) ( not ( = ?auto_789422 ?auto_789423 ) ) ( not ( = ?auto_789422 ?auto_789424 ) ) ( not ( = ?auto_789422 ?auto_789425 ) ) ( not ( = ?auto_789423 ?auto_789424 ) ) ( not ( = ?auto_789423 ?auto_789425 ) ) ( not ( = ?auto_789424 ?auto_789425 ) ) ( ON ?auto_789423 ?auto_789424 ) ( ON ?auto_789422 ?auto_789423 ) ( ON ?auto_789421 ?auto_789422 ) ( ON ?auto_789420 ?auto_789421 ) ( ON ?auto_789419 ?auto_789420 ) ( ON ?auto_789418 ?auto_789419 ) ( ON ?auto_789417 ?auto_789418 ) ( CLEAR ?auto_789415 ) ( ON ?auto_789416 ?auto_789417 ) ( CLEAR ?auto_789416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_789409 ?auto_789410 ?auto_789411 ?auto_789412 ?auto_789413 ?auto_789414 ?auto_789415 ?auto_789416 )
      ( MAKE-16PILE ?auto_789409 ?auto_789410 ?auto_789411 ?auto_789412 ?auto_789413 ?auto_789414 ?auto_789415 ?auto_789416 ?auto_789417 ?auto_789418 ?auto_789419 ?auto_789420 ?auto_789421 ?auto_789422 ?auto_789423 ?auto_789424 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789475 - BLOCK
      ?auto_789476 - BLOCK
      ?auto_789477 - BLOCK
      ?auto_789478 - BLOCK
      ?auto_789479 - BLOCK
      ?auto_789480 - BLOCK
      ?auto_789481 - BLOCK
      ?auto_789482 - BLOCK
      ?auto_789483 - BLOCK
      ?auto_789484 - BLOCK
      ?auto_789485 - BLOCK
      ?auto_789486 - BLOCK
      ?auto_789487 - BLOCK
      ?auto_789488 - BLOCK
      ?auto_789489 - BLOCK
      ?auto_789490 - BLOCK
    )
    :vars
    (
      ?auto_789491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789490 ?auto_789491 ) ( ON-TABLE ?auto_789475 ) ( ON ?auto_789476 ?auto_789475 ) ( ON ?auto_789477 ?auto_789476 ) ( ON ?auto_789478 ?auto_789477 ) ( ON ?auto_789479 ?auto_789478 ) ( ON ?auto_789480 ?auto_789479 ) ( not ( = ?auto_789475 ?auto_789476 ) ) ( not ( = ?auto_789475 ?auto_789477 ) ) ( not ( = ?auto_789475 ?auto_789478 ) ) ( not ( = ?auto_789475 ?auto_789479 ) ) ( not ( = ?auto_789475 ?auto_789480 ) ) ( not ( = ?auto_789475 ?auto_789481 ) ) ( not ( = ?auto_789475 ?auto_789482 ) ) ( not ( = ?auto_789475 ?auto_789483 ) ) ( not ( = ?auto_789475 ?auto_789484 ) ) ( not ( = ?auto_789475 ?auto_789485 ) ) ( not ( = ?auto_789475 ?auto_789486 ) ) ( not ( = ?auto_789475 ?auto_789487 ) ) ( not ( = ?auto_789475 ?auto_789488 ) ) ( not ( = ?auto_789475 ?auto_789489 ) ) ( not ( = ?auto_789475 ?auto_789490 ) ) ( not ( = ?auto_789475 ?auto_789491 ) ) ( not ( = ?auto_789476 ?auto_789477 ) ) ( not ( = ?auto_789476 ?auto_789478 ) ) ( not ( = ?auto_789476 ?auto_789479 ) ) ( not ( = ?auto_789476 ?auto_789480 ) ) ( not ( = ?auto_789476 ?auto_789481 ) ) ( not ( = ?auto_789476 ?auto_789482 ) ) ( not ( = ?auto_789476 ?auto_789483 ) ) ( not ( = ?auto_789476 ?auto_789484 ) ) ( not ( = ?auto_789476 ?auto_789485 ) ) ( not ( = ?auto_789476 ?auto_789486 ) ) ( not ( = ?auto_789476 ?auto_789487 ) ) ( not ( = ?auto_789476 ?auto_789488 ) ) ( not ( = ?auto_789476 ?auto_789489 ) ) ( not ( = ?auto_789476 ?auto_789490 ) ) ( not ( = ?auto_789476 ?auto_789491 ) ) ( not ( = ?auto_789477 ?auto_789478 ) ) ( not ( = ?auto_789477 ?auto_789479 ) ) ( not ( = ?auto_789477 ?auto_789480 ) ) ( not ( = ?auto_789477 ?auto_789481 ) ) ( not ( = ?auto_789477 ?auto_789482 ) ) ( not ( = ?auto_789477 ?auto_789483 ) ) ( not ( = ?auto_789477 ?auto_789484 ) ) ( not ( = ?auto_789477 ?auto_789485 ) ) ( not ( = ?auto_789477 ?auto_789486 ) ) ( not ( = ?auto_789477 ?auto_789487 ) ) ( not ( = ?auto_789477 ?auto_789488 ) ) ( not ( = ?auto_789477 ?auto_789489 ) ) ( not ( = ?auto_789477 ?auto_789490 ) ) ( not ( = ?auto_789477 ?auto_789491 ) ) ( not ( = ?auto_789478 ?auto_789479 ) ) ( not ( = ?auto_789478 ?auto_789480 ) ) ( not ( = ?auto_789478 ?auto_789481 ) ) ( not ( = ?auto_789478 ?auto_789482 ) ) ( not ( = ?auto_789478 ?auto_789483 ) ) ( not ( = ?auto_789478 ?auto_789484 ) ) ( not ( = ?auto_789478 ?auto_789485 ) ) ( not ( = ?auto_789478 ?auto_789486 ) ) ( not ( = ?auto_789478 ?auto_789487 ) ) ( not ( = ?auto_789478 ?auto_789488 ) ) ( not ( = ?auto_789478 ?auto_789489 ) ) ( not ( = ?auto_789478 ?auto_789490 ) ) ( not ( = ?auto_789478 ?auto_789491 ) ) ( not ( = ?auto_789479 ?auto_789480 ) ) ( not ( = ?auto_789479 ?auto_789481 ) ) ( not ( = ?auto_789479 ?auto_789482 ) ) ( not ( = ?auto_789479 ?auto_789483 ) ) ( not ( = ?auto_789479 ?auto_789484 ) ) ( not ( = ?auto_789479 ?auto_789485 ) ) ( not ( = ?auto_789479 ?auto_789486 ) ) ( not ( = ?auto_789479 ?auto_789487 ) ) ( not ( = ?auto_789479 ?auto_789488 ) ) ( not ( = ?auto_789479 ?auto_789489 ) ) ( not ( = ?auto_789479 ?auto_789490 ) ) ( not ( = ?auto_789479 ?auto_789491 ) ) ( not ( = ?auto_789480 ?auto_789481 ) ) ( not ( = ?auto_789480 ?auto_789482 ) ) ( not ( = ?auto_789480 ?auto_789483 ) ) ( not ( = ?auto_789480 ?auto_789484 ) ) ( not ( = ?auto_789480 ?auto_789485 ) ) ( not ( = ?auto_789480 ?auto_789486 ) ) ( not ( = ?auto_789480 ?auto_789487 ) ) ( not ( = ?auto_789480 ?auto_789488 ) ) ( not ( = ?auto_789480 ?auto_789489 ) ) ( not ( = ?auto_789480 ?auto_789490 ) ) ( not ( = ?auto_789480 ?auto_789491 ) ) ( not ( = ?auto_789481 ?auto_789482 ) ) ( not ( = ?auto_789481 ?auto_789483 ) ) ( not ( = ?auto_789481 ?auto_789484 ) ) ( not ( = ?auto_789481 ?auto_789485 ) ) ( not ( = ?auto_789481 ?auto_789486 ) ) ( not ( = ?auto_789481 ?auto_789487 ) ) ( not ( = ?auto_789481 ?auto_789488 ) ) ( not ( = ?auto_789481 ?auto_789489 ) ) ( not ( = ?auto_789481 ?auto_789490 ) ) ( not ( = ?auto_789481 ?auto_789491 ) ) ( not ( = ?auto_789482 ?auto_789483 ) ) ( not ( = ?auto_789482 ?auto_789484 ) ) ( not ( = ?auto_789482 ?auto_789485 ) ) ( not ( = ?auto_789482 ?auto_789486 ) ) ( not ( = ?auto_789482 ?auto_789487 ) ) ( not ( = ?auto_789482 ?auto_789488 ) ) ( not ( = ?auto_789482 ?auto_789489 ) ) ( not ( = ?auto_789482 ?auto_789490 ) ) ( not ( = ?auto_789482 ?auto_789491 ) ) ( not ( = ?auto_789483 ?auto_789484 ) ) ( not ( = ?auto_789483 ?auto_789485 ) ) ( not ( = ?auto_789483 ?auto_789486 ) ) ( not ( = ?auto_789483 ?auto_789487 ) ) ( not ( = ?auto_789483 ?auto_789488 ) ) ( not ( = ?auto_789483 ?auto_789489 ) ) ( not ( = ?auto_789483 ?auto_789490 ) ) ( not ( = ?auto_789483 ?auto_789491 ) ) ( not ( = ?auto_789484 ?auto_789485 ) ) ( not ( = ?auto_789484 ?auto_789486 ) ) ( not ( = ?auto_789484 ?auto_789487 ) ) ( not ( = ?auto_789484 ?auto_789488 ) ) ( not ( = ?auto_789484 ?auto_789489 ) ) ( not ( = ?auto_789484 ?auto_789490 ) ) ( not ( = ?auto_789484 ?auto_789491 ) ) ( not ( = ?auto_789485 ?auto_789486 ) ) ( not ( = ?auto_789485 ?auto_789487 ) ) ( not ( = ?auto_789485 ?auto_789488 ) ) ( not ( = ?auto_789485 ?auto_789489 ) ) ( not ( = ?auto_789485 ?auto_789490 ) ) ( not ( = ?auto_789485 ?auto_789491 ) ) ( not ( = ?auto_789486 ?auto_789487 ) ) ( not ( = ?auto_789486 ?auto_789488 ) ) ( not ( = ?auto_789486 ?auto_789489 ) ) ( not ( = ?auto_789486 ?auto_789490 ) ) ( not ( = ?auto_789486 ?auto_789491 ) ) ( not ( = ?auto_789487 ?auto_789488 ) ) ( not ( = ?auto_789487 ?auto_789489 ) ) ( not ( = ?auto_789487 ?auto_789490 ) ) ( not ( = ?auto_789487 ?auto_789491 ) ) ( not ( = ?auto_789488 ?auto_789489 ) ) ( not ( = ?auto_789488 ?auto_789490 ) ) ( not ( = ?auto_789488 ?auto_789491 ) ) ( not ( = ?auto_789489 ?auto_789490 ) ) ( not ( = ?auto_789489 ?auto_789491 ) ) ( not ( = ?auto_789490 ?auto_789491 ) ) ( ON ?auto_789489 ?auto_789490 ) ( ON ?auto_789488 ?auto_789489 ) ( ON ?auto_789487 ?auto_789488 ) ( ON ?auto_789486 ?auto_789487 ) ( ON ?auto_789485 ?auto_789486 ) ( ON ?auto_789484 ?auto_789485 ) ( ON ?auto_789483 ?auto_789484 ) ( ON ?auto_789482 ?auto_789483 ) ( CLEAR ?auto_789480 ) ( ON ?auto_789481 ?auto_789482 ) ( CLEAR ?auto_789481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_789475 ?auto_789476 ?auto_789477 ?auto_789478 ?auto_789479 ?auto_789480 ?auto_789481 )
      ( MAKE-16PILE ?auto_789475 ?auto_789476 ?auto_789477 ?auto_789478 ?auto_789479 ?auto_789480 ?auto_789481 ?auto_789482 ?auto_789483 ?auto_789484 ?auto_789485 ?auto_789486 ?auto_789487 ?auto_789488 ?auto_789489 ?auto_789490 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789541 - BLOCK
      ?auto_789542 - BLOCK
      ?auto_789543 - BLOCK
      ?auto_789544 - BLOCK
      ?auto_789545 - BLOCK
      ?auto_789546 - BLOCK
      ?auto_789547 - BLOCK
      ?auto_789548 - BLOCK
      ?auto_789549 - BLOCK
      ?auto_789550 - BLOCK
      ?auto_789551 - BLOCK
      ?auto_789552 - BLOCK
      ?auto_789553 - BLOCK
      ?auto_789554 - BLOCK
      ?auto_789555 - BLOCK
      ?auto_789556 - BLOCK
    )
    :vars
    (
      ?auto_789557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789556 ?auto_789557 ) ( ON-TABLE ?auto_789541 ) ( ON ?auto_789542 ?auto_789541 ) ( ON ?auto_789543 ?auto_789542 ) ( ON ?auto_789544 ?auto_789543 ) ( ON ?auto_789545 ?auto_789544 ) ( not ( = ?auto_789541 ?auto_789542 ) ) ( not ( = ?auto_789541 ?auto_789543 ) ) ( not ( = ?auto_789541 ?auto_789544 ) ) ( not ( = ?auto_789541 ?auto_789545 ) ) ( not ( = ?auto_789541 ?auto_789546 ) ) ( not ( = ?auto_789541 ?auto_789547 ) ) ( not ( = ?auto_789541 ?auto_789548 ) ) ( not ( = ?auto_789541 ?auto_789549 ) ) ( not ( = ?auto_789541 ?auto_789550 ) ) ( not ( = ?auto_789541 ?auto_789551 ) ) ( not ( = ?auto_789541 ?auto_789552 ) ) ( not ( = ?auto_789541 ?auto_789553 ) ) ( not ( = ?auto_789541 ?auto_789554 ) ) ( not ( = ?auto_789541 ?auto_789555 ) ) ( not ( = ?auto_789541 ?auto_789556 ) ) ( not ( = ?auto_789541 ?auto_789557 ) ) ( not ( = ?auto_789542 ?auto_789543 ) ) ( not ( = ?auto_789542 ?auto_789544 ) ) ( not ( = ?auto_789542 ?auto_789545 ) ) ( not ( = ?auto_789542 ?auto_789546 ) ) ( not ( = ?auto_789542 ?auto_789547 ) ) ( not ( = ?auto_789542 ?auto_789548 ) ) ( not ( = ?auto_789542 ?auto_789549 ) ) ( not ( = ?auto_789542 ?auto_789550 ) ) ( not ( = ?auto_789542 ?auto_789551 ) ) ( not ( = ?auto_789542 ?auto_789552 ) ) ( not ( = ?auto_789542 ?auto_789553 ) ) ( not ( = ?auto_789542 ?auto_789554 ) ) ( not ( = ?auto_789542 ?auto_789555 ) ) ( not ( = ?auto_789542 ?auto_789556 ) ) ( not ( = ?auto_789542 ?auto_789557 ) ) ( not ( = ?auto_789543 ?auto_789544 ) ) ( not ( = ?auto_789543 ?auto_789545 ) ) ( not ( = ?auto_789543 ?auto_789546 ) ) ( not ( = ?auto_789543 ?auto_789547 ) ) ( not ( = ?auto_789543 ?auto_789548 ) ) ( not ( = ?auto_789543 ?auto_789549 ) ) ( not ( = ?auto_789543 ?auto_789550 ) ) ( not ( = ?auto_789543 ?auto_789551 ) ) ( not ( = ?auto_789543 ?auto_789552 ) ) ( not ( = ?auto_789543 ?auto_789553 ) ) ( not ( = ?auto_789543 ?auto_789554 ) ) ( not ( = ?auto_789543 ?auto_789555 ) ) ( not ( = ?auto_789543 ?auto_789556 ) ) ( not ( = ?auto_789543 ?auto_789557 ) ) ( not ( = ?auto_789544 ?auto_789545 ) ) ( not ( = ?auto_789544 ?auto_789546 ) ) ( not ( = ?auto_789544 ?auto_789547 ) ) ( not ( = ?auto_789544 ?auto_789548 ) ) ( not ( = ?auto_789544 ?auto_789549 ) ) ( not ( = ?auto_789544 ?auto_789550 ) ) ( not ( = ?auto_789544 ?auto_789551 ) ) ( not ( = ?auto_789544 ?auto_789552 ) ) ( not ( = ?auto_789544 ?auto_789553 ) ) ( not ( = ?auto_789544 ?auto_789554 ) ) ( not ( = ?auto_789544 ?auto_789555 ) ) ( not ( = ?auto_789544 ?auto_789556 ) ) ( not ( = ?auto_789544 ?auto_789557 ) ) ( not ( = ?auto_789545 ?auto_789546 ) ) ( not ( = ?auto_789545 ?auto_789547 ) ) ( not ( = ?auto_789545 ?auto_789548 ) ) ( not ( = ?auto_789545 ?auto_789549 ) ) ( not ( = ?auto_789545 ?auto_789550 ) ) ( not ( = ?auto_789545 ?auto_789551 ) ) ( not ( = ?auto_789545 ?auto_789552 ) ) ( not ( = ?auto_789545 ?auto_789553 ) ) ( not ( = ?auto_789545 ?auto_789554 ) ) ( not ( = ?auto_789545 ?auto_789555 ) ) ( not ( = ?auto_789545 ?auto_789556 ) ) ( not ( = ?auto_789545 ?auto_789557 ) ) ( not ( = ?auto_789546 ?auto_789547 ) ) ( not ( = ?auto_789546 ?auto_789548 ) ) ( not ( = ?auto_789546 ?auto_789549 ) ) ( not ( = ?auto_789546 ?auto_789550 ) ) ( not ( = ?auto_789546 ?auto_789551 ) ) ( not ( = ?auto_789546 ?auto_789552 ) ) ( not ( = ?auto_789546 ?auto_789553 ) ) ( not ( = ?auto_789546 ?auto_789554 ) ) ( not ( = ?auto_789546 ?auto_789555 ) ) ( not ( = ?auto_789546 ?auto_789556 ) ) ( not ( = ?auto_789546 ?auto_789557 ) ) ( not ( = ?auto_789547 ?auto_789548 ) ) ( not ( = ?auto_789547 ?auto_789549 ) ) ( not ( = ?auto_789547 ?auto_789550 ) ) ( not ( = ?auto_789547 ?auto_789551 ) ) ( not ( = ?auto_789547 ?auto_789552 ) ) ( not ( = ?auto_789547 ?auto_789553 ) ) ( not ( = ?auto_789547 ?auto_789554 ) ) ( not ( = ?auto_789547 ?auto_789555 ) ) ( not ( = ?auto_789547 ?auto_789556 ) ) ( not ( = ?auto_789547 ?auto_789557 ) ) ( not ( = ?auto_789548 ?auto_789549 ) ) ( not ( = ?auto_789548 ?auto_789550 ) ) ( not ( = ?auto_789548 ?auto_789551 ) ) ( not ( = ?auto_789548 ?auto_789552 ) ) ( not ( = ?auto_789548 ?auto_789553 ) ) ( not ( = ?auto_789548 ?auto_789554 ) ) ( not ( = ?auto_789548 ?auto_789555 ) ) ( not ( = ?auto_789548 ?auto_789556 ) ) ( not ( = ?auto_789548 ?auto_789557 ) ) ( not ( = ?auto_789549 ?auto_789550 ) ) ( not ( = ?auto_789549 ?auto_789551 ) ) ( not ( = ?auto_789549 ?auto_789552 ) ) ( not ( = ?auto_789549 ?auto_789553 ) ) ( not ( = ?auto_789549 ?auto_789554 ) ) ( not ( = ?auto_789549 ?auto_789555 ) ) ( not ( = ?auto_789549 ?auto_789556 ) ) ( not ( = ?auto_789549 ?auto_789557 ) ) ( not ( = ?auto_789550 ?auto_789551 ) ) ( not ( = ?auto_789550 ?auto_789552 ) ) ( not ( = ?auto_789550 ?auto_789553 ) ) ( not ( = ?auto_789550 ?auto_789554 ) ) ( not ( = ?auto_789550 ?auto_789555 ) ) ( not ( = ?auto_789550 ?auto_789556 ) ) ( not ( = ?auto_789550 ?auto_789557 ) ) ( not ( = ?auto_789551 ?auto_789552 ) ) ( not ( = ?auto_789551 ?auto_789553 ) ) ( not ( = ?auto_789551 ?auto_789554 ) ) ( not ( = ?auto_789551 ?auto_789555 ) ) ( not ( = ?auto_789551 ?auto_789556 ) ) ( not ( = ?auto_789551 ?auto_789557 ) ) ( not ( = ?auto_789552 ?auto_789553 ) ) ( not ( = ?auto_789552 ?auto_789554 ) ) ( not ( = ?auto_789552 ?auto_789555 ) ) ( not ( = ?auto_789552 ?auto_789556 ) ) ( not ( = ?auto_789552 ?auto_789557 ) ) ( not ( = ?auto_789553 ?auto_789554 ) ) ( not ( = ?auto_789553 ?auto_789555 ) ) ( not ( = ?auto_789553 ?auto_789556 ) ) ( not ( = ?auto_789553 ?auto_789557 ) ) ( not ( = ?auto_789554 ?auto_789555 ) ) ( not ( = ?auto_789554 ?auto_789556 ) ) ( not ( = ?auto_789554 ?auto_789557 ) ) ( not ( = ?auto_789555 ?auto_789556 ) ) ( not ( = ?auto_789555 ?auto_789557 ) ) ( not ( = ?auto_789556 ?auto_789557 ) ) ( ON ?auto_789555 ?auto_789556 ) ( ON ?auto_789554 ?auto_789555 ) ( ON ?auto_789553 ?auto_789554 ) ( ON ?auto_789552 ?auto_789553 ) ( ON ?auto_789551 ?auto_789552 ) ( ON ?auto_789550 ?auto_789551 ) ( ON ?auto_789549 ?auto_789550 ) ( ON ?auto_789548 ?auto_789549 ) ( ON ?auto_789547 ?auto_789548 ) ( CLEAR ?auto_789545 ) ( ON ?auto_789546 ?auto_789547 ) ( CLEAR ?auto_789546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_789541 ?auto_789542 ?auto_789543 ?auto_789544 ?auto_789545 ?auto_789546 )
      ( MAKE-16PILE ?auto_789541 ?auto_789542 ?auto_789543 ?auto_789544 ?auto_789545 ?auto_789546 ?auto_789547 ?auto_789548 ?auto_789549 ?auto_789550 ?auto_789551 ?auto_789552 ?auto_789553 ?auto_789554 ?auto_789555 ?auto_789556 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789607 - BLOCK
      ?auto_789608 - BLOCK
      ?auto_789609 - BLOCK
      ?auto_789610 - BLOCK
      ?auto_789611 - BLOCK
      ?auto_789612 - BLOCK
      ?auto_789613 - BLOCK
      ?auto_789614 - BLOCK
      ?auto_789615 - BLOCK
      ?auto_789616 - BLOCK
      ?auto_789617 - BLOCK
      ?auto_789618 - BLOCK
      ?auto_789619 - BLOCK
      ?auto_789620 - BLOCK
      ?auto_789621 - BLOCK
      ?auto_789622 - BLOCK
    )
    :vars
    (
      ?auto_789623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789622 ?auto_789623 ) ( ON-TABLE ?auto_789607 ) ( ON ?auto_789608 ?auto_789607 ) ( ON ?auto_789609 ?auto_789608 ) ( ON ?auto_789610 ?auto_789609 ) ( not ( = ?auto_789607 ?auto_789608 ) ) ( not ( = ?auto_789607 ?auto_789609 ) ) ( not ( = ?auto_789607 ?auto_789610 ) ) ( not ( = ?auto_789607 ?auto_789611 ) ) ( not ( = ?auto_789607 ?auto_789612 ) ) ( not ( = ?auto_789607 ?auto_789613 ) ) ( not ( = ?auto_789607 ?auto_789614 ) ) ( not ( = ?auto_789607 ?auto_789615 ) ) ( not ( = ?auto_789607 ?auto_789616 ) ) ( not ( = ?auto_789607 ?auto_789617 ) ) ( not ( = ?auto_789607 ?auto_789618 ) ) ( not ( = ?auto_789607 ?auto_789619 ) ) ( not ( = ?auto_789607 ?auto_789620 ) ) ( not ( = ?auto_789607 ?auto_789621 ) ) ( not ( = ?auto_789607 ?auto_789622 ) ) ( not ( = ?auto_789607 ?auto_789623 ) ) ( not ( = ?auto_789608 ?auto_789609 ) ) ( not ( = ?auto_789608 ?auto_789610 ) ) ( not ( = ?auto_789608 ?auto_789611 ) ) ( not ( = ?auto_789608 ?auto_789612 ) ) ( not ( = ?auto_789608 ?auto_789613 ) ) ( not ( = ?auto_789608 ?auto_789614 ) ) ( not ( = ?auto_789608 ?auto_789615 ) ) ( not ( = ?auto_789608 ?auto_789616 ) ) ( not ( = ?auto_789608 ?auto_789617 ) ) ( not ( = ?auto_789608 ?auto_789618 ) ) ( not ( = ?auto_789608 ?auto_789619 ) ) ( not ( = ?auto_789608 ?auto_789620 ) ) ( not ( = ?auto_789608 ?auto_789621 ) ) ( not ( = ?auto_789608 ?auto_789622 ) ) ( not ( = ?auto_789608 ?auto_789623 ) ) ( not ( = ?auto_789609 ?auto_789610 ) ) ( not ( = ?auto_789609 ?auto_789611 ) ) ( not ( = ?auto_789609 ?auto_789612 ) ) ( not ( = ?auto_789609 ?auto_789613 ) ) ( not ( = ?auto_789609 ?auto_789614 ) ) ( not ( = ?auto_789609 ?auto_789615 ) ) ( not ( = ?auto_789609 ?auto_789616 ) ) ( not ( = ?auto_789609 ?auto_789617 ) ) ( not ( = ?auto_789609 ?auto_789618 ) ) ( not ( = ?auto_789609 ?auto_789619 ) ) ( not ( = ?auto_789609 ?auto_789620 ) ) ( not ( = ?auto_789609 ?auto_789621 ) ) ( not ( = ?auto_789609 ?auto_789622 ) ) ( not ( = ?auto_789609 ?auto_789623 ) ) ( not ( = ?auto_789610 ?auto_789611 ) ) ( not ( = ?auto_789610 ?auto_789612 ) ) ( not ( = ?auto_789610 ?auto_789613 ) ) ( not ( = ?auto_789610 ?auto_789614 ) ) ( not ( = ?auto_789610 ?auto_789615 ) ) ( not ( = ?auto_789610 ?auto_789616 ) ) ( not ( = ?auto_789610 ?auto_789617 ) ) ( not ( = ?auto_789610 ?auto_789618 ) ) ( not ( = ?auto_789610 ?auto_789619 ) ) ( not ( = ?auto_789610 ?auto_789620 ) ) ( not ( = ?auto_789610 ?auto_789621 ) ) ( not ( = ?auto_789610 ?auto_789622 ) ) ( not ( = ?auto_789610 ?auto_789623 ) ) ( not ( = ?auto_789611 ?auto_789612 ) ) ( not ( = ?auto_789611 ?auto_789613 ) ) ( not ( = ?auto_789611 ?auto_789614 ) ) ( not ( = ?auto_789611 ?auto_789615 ) ) ( not ( = ?auto_789611 ?auto_789616 ) ) ( not ( = ?auto_789611 ?auto_789617 ) ) ( not ( = ?auto_789611 ?auto_789618 ) ) ( not ( = ?auto_789611 ?auto_789619 ) ) ( not ( = ?auto_789611 ?auto_789620 ) ) ( not ( = ?auto_789611 ?auto_789621 ) ) ( not ( = ?auto_789611 ?auto_789622 ) ) ( not ( = ?auto_789611 ?auto_789623 ) ) ( not ( = ?auto_789612 ?auto_789613 ) ) ( not ( = ?auto_789612 ?auto_789614 ) ) ( not ( = ?auto_789612 ?auto_789615 ) ) ( not ( = ?auto_789612 ?auto_789616 ) ) ( not ( = ?auto_789612 ?auto_789617 ) ) ( not ( = ?auto_789612 ?auto_789618 ) ) ( not ( = ?auto_789612 ?auto_789619 ) ) ( not ( = ?auto_789612 ?auto_789620 ) ) ( not ( = ?auto_789612 ?auto_789621 ) ) ( not ( = ?auto_789612 ?auto_789622 ) ) ( not ( = ?auto_789612 ?auto_789623 ) ) ( not ( = ?auto_789613 ?auto_789614 ) ) ( not ( = ?auto_789613 ?auto_789615 ) ) ( not ( = ?auto_789613 ?auto_789616 ) ) ( not ( = ?auto_789613 ?auto_789617 ) ) ( not ( = ?auto_789613 ?auto_789618 ) ) ( not ( = ?auto_789613 ?auto_789619 ) ) ( not ( = ?auto_789613 ?auto_789620 ) ) ( not ( = ?auto_789613 ?auto_789621 ) ) ( not ( = ?auto_789613 ?auto_789622 ) ) ( not ( = ?auto_789613 ?auto_789623 ) ) ( not ( = ?auto_789614 ?auto_789615 ) ) ( not ( = ?auto_789614 ?auto_789616 ) ) ( not ( = ?auto_789614 ?auto_789617 ) ) ( not ( = ?auto_789614 ?auto_789618 ) ) ( not ( = ?auto_789614 ?auto_789619 ) ) ( not ( = ?auto_789614 ?auto_789620 ) ) ( not ( = ?auto_789614 ?auto_789621 ) ) ( not ( = ?auto_789614 ?auto_789622 ) ) ( not ( = ?auto_789614 ?auto_789623 ) ) ( not ( = ?auto_789615 ?auto_789616 ) ) ( not ( = ?auto_789615 ?auto_789617 ) ) ( not ( = ?auto_789615 ?auto_789618 ) ) ( not ( = ?auto_789615 ?auto_789619 ) ) ( not ( = ?auto_789615 ?auto_789620 ) ) ( not ( = ?auto_789615 ?auto_789621 ) ) ( not ( = ?auto_789615 ?auto_789622 ) ) ( not ( = ?auto_789615 ?auto_789623 ) ) ( not ( = ?auto_789616 ?auto_789617 ) ) ( not ( = ?auto_789616 ?auto_789618 ) ) ( not ( = ?auto_789616 ?auto_789619 ) ) ( not ( = ?auto_789616 ?auto_789620 ) ) ( not ( = ?auto_789616 ?auto_789621 ) ) ( not ( = ?auto_789616 ?auto_789622 ) ) ( not ( = ?auto_789616 ?auto_789623 ) ) ( not ( = ?auto_789617 ?auto_789618 ) ) ( not ( = ?auto_789617 ?auto_789619 ) ) ( not ( = ?auto_789617 ?auto_789620 ) ) ( not ( = ?auto_789617 ?auto_789621 ) ) ( not ( = ?auto_789617 ?auto_789622 ) ) ( not ( = ?auto_789617 ?auto_789623 ) ) ( not ( = ?auto_789618 ?auto_789619 ) ) ( not ( = ?auto_789618 ?auto_789620 ) ) ( not ( = ?auto_789618 ?auto_789621 ) ) ( not ( = ?auto_789618 ?auto_789622 ) ) ( not ( = ?auto_789618 ?auto_789623 ) ) ( not ( = ?auto_789619 ?auto_789620 ) ) ( not ( = ?auto_789619 ?auto_789621 ) ) ( not ( = ?auto_789619 ?auto_789622 ) ) ( not ( = ?auto_789619 ?auto_789623 ) ) ( not ( = ?auto_789620 ?auto_789621 ) ) ( not ( = ?auto_789620 ?auto_789622 ) ) ( not ( = ?auto_789620 ?auto_789623 ) ) ( not ( = ?auto_789621 ?auto_789622 ) ) ( not ( = ?auto_789621 ?auto_789623 ) ) ( not ( = ?auto_789622 ?auto_789623 ) ) ( ON ?auto_789621 ?auto_789622 ) ( ON ?auto_789620 ?auto_789621 ) ( ON ?auto_789619 ?auto_789620 ) ( ON ?auto_789618 ?auto_789619 ) ( ON ?auto_789617 ?auto_789618 ) ( ON ?auto_789616 ?auto_789617 ) ( ON ?auto_789615 ?auto_789616 ) ( ON ?auto_789614 ?auto_789615 ) ( ON ?auto_789613 ?auto_789614 ) ( ON ?auto_789612 ?auto_789613 ) ( CLEAR ?auto_789610 ) ( ON ?auto_789611 ?auto_789612 ) ( CLEAR ?auto_789611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_789607 ?auto_789608 ?auto_789609 ?auto_789610 ?auto_789611 )
      ( MAKE-16PILE ?auto_789607 ?auto_789608 ?auto_789609 ?auto_789610 ?auto_789611 ?auto_789612 ?auto_789613 ?auto_789614 ?auto_789615 ?auto_789616 ?auto_789617 ?auto_789618 ?auto_789619 ?auto_789620 ?auto_789621 ?auto_789622 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789673 - BLOCK
      ?auto_789674 - BLOCK
      ?auto_789675 - BLOCK
      ?auto_789676 - BLOCK
      ?auto_789677 - BLOCK
      ?auto_789678 - BLOCK
      ?auto_789679 - BLOCK
      ?auto_789680 - BLOCK
      ?auto_789681 - BLOCK
      ?auto_789682 - BLOCK
      ?auto_789683 - BLOCK
      ?auto_789684 - BLOCK
      ?auto_789685 - BLOCK
      ?auto_789686 - BLOCK
      ?auto_789687 - BLOCK
      ?auto_789688 - BLOCK
    )
    :vars
    (
      ?auto_789689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789688 ?auto_789689 ) ( ON-TABLE ?auto_789673 ) ( ON ?auto_789674 ?auto_789673 ) ( ON ?auto_789675 ?auto_789674 ) ( not ( = ?auto_789673 ?auto_789674 ) ) ( not ( = ?auto_789673 ?auto_789675 ) ) ( not ( = ?auto_789673 ?auto_789676 ) ) ( not ( = ?auto_789673 ?auto_789677 ) ) ( not ( = ?auto_789673 ?auto_789678 ) ) ( not ( = ?auto_789673 ?auto_789679 ) ) ( not ( = ?auto_789673 ?auto_789680 ) ) ( not ( = ?auto_789673 ?auto_789681 ) ) ( not ( = ?auto_789673 ?auto_789682 ) ) ( not ( = ?auto_789673 ?auto_789683 ) ) ( not ( = ?auto_789673 ?auto_789684 ) ) ( not ( = ?auto_789673 ?auto_789685 ) ) ( not ( = ?auto_789673 ?auto_789686 ) ) ( not ( = ?auto_789673 ?auto_789687 ) ) ( not ( = ?auto_789673 ?auto_789688 ) ) ( not ( = ?auto_789673 ?auto_789689 ) ) ( not ( = ?auto_789674 ?auto_789675 ) ) ( not ( = ?auto_789674 ?auto_789676 ) ) ( not ( = ?auto_789674 ?auto_789677 ) ) ( not ( = ?auto_789674 ?auto_789678 ) ) ( not ( = ?auto_789674 ?auto_789679 ) ) ( not ( = ?auto_789674 ?auto_789680 ) ) ( not ( = ?auto_789674 ?auto_789681 ) ) ( not ( = ?auto_789674 ?auto_789682 ) ) ( not ( = ?auto_789674 ?auto_789683 ) ) ( not ( = ?auto_789674 ?auto_789684 ) ) ( not ( = ?auto_789674 ?auto_789685 ) ) ( not ( = ?auto_789674 ?auto_789686 ) ) ( not ( = ?auto_789674 ?auto_789687 ) ) ( not ( = ?auto_789674 ?auto_789688 ) ) ( not ( = ?auto_789674 ?auto_789689 ) ) ( not ( = ?auto_789675 ?auto_789676 ) ) ( not ( = ?auto_789675 ?auto_789677 ) ) ( not ( = ?auto_789675 ?auto_789678 ) ) ( not ( = ?auto_789675 ?auto_789679 ) ) ( not ( = ?auto_789675 ?auto_789680 ) ) ( not ( = ?auto_789675 ?auto_789681 ) ) ( not ( = ?auto_789675 ?auto_789682 ) ) ( not ( = ?auto_789675 ?auto_789683 ) ) ( not ( = ?auto_789675 ?auto_789684 ) ) ( not ( = ?auto_789675 ?auto_789685 ) ) ( not ( = ?auto_789675 ?auto_789686 ) ) ( not ( = ?auto_789675 ?auto_789687 ) ) ( not ( = ?auto_789675 ?auto_789688 ) ) ( not ( = ?auto_789675 ?auto_789689 ) ) ( not ( = ?auto_789676 ?auto_789677 ) ) ( not ( = ?auto_789676 ?auto_789678 ) ) ( not ( = ?auto_789676 ?auto_789679 ) ) ( not ( = ?auto_789676 ?auto_789680 ) ) ( not ( = ?auto_789676 ?auto_789681 ) ) ( not ( = ?auto_789676 ?auto_789682 ) ) ( not ( = ?auto_789676 ?auto_789683 ) ) ( not ( = ?auto_789676 ?auto_789684 ) ) ( not ( = ?auto_789676 ?auto_789685 ) ) ( not ( = ?auto_789676 ?auto_789686 ) ) ( not ( = ?auto_789676 ?auto_789687 ) ) ( not ( = ?auto_789676 ?auto_789688 ) ) ( not ( = ?auto_789676 ?auto_789689 ) ) ( not ( = ?auto_789677 ?auto_789678 ) ) ( not ( = ?auto_789677 ?auto_789679 ) ) ( not ( = ?auto_789677 ?auto_789680 ) ) ( not ( = ?auto_789677 ?auto_789681 ) ) ( not ( = ?auto_789677 ?auto_789682 ) ) ( not ( = ?auto_789677 ?auto_789683 ) ) ( not ( = ?auto_789677 ?auto_789684 ) ) ( not ( = ?auto_789677 ?auto_789685 ) ) ( not ( = ?auto_789677 ?auto_789686 ) ) ( not ( = ?auto_789677 ?auto_789687 ) ) ( not ( = ?auto_789677 ?auto_789688 ) ) ( not ( = ?auto_789677 ?auto_789689 ) ) ( not ( = ?auto_789678 ?auto_789679 ) ) ( not ( = ?auto_789678 ?auto_789680 ) ) ( not ( = ?auto_789678 ?auto_789681 ) ) ( not ( = ?auto_789678 ?auto_789682 ) ) ( not ( = ?auto_789678 ?auto_789683 ) ) ( not ( = ?auto_789678 ?auto_789684 ) ) ( not ( = ?auto_789678 ?auto_789685 ) ) ( not ( = ?auto_789678 ?auto_789686 ) ) ( not ( = ?auto_789678 ?auto_789687 ) ) ( not ( = ?auto_789678 ?auto_789688 ) ) ( not ( = ?auto_789678 ?auto_789689 ) ) ( not ( = ?auto_789679 ?auto_789680 ) ) ( not ( = ?auto_789679 ?auto_789681 ) ) ( not ( = ?auto_789679 ?auto_789682 ) ) ( not ( = ?auto_789679 ?auto_789683 ) ) ( not ( = ?auto_789679 ?auto_789684 ) ) ( not ( = ?auto_789679 ?auto_789685 ) ) ( not ( = ?auto_789679 ?auto_789686 ) ) ( not ( = ?auto_789679 ?auto_789687 ) ) ( not ( = ?auto_789679 ?auto_789688 ) ) ( not ( = ?auto_789679 ?auto_789689 ) ) ( not ( = ?auto_789680 ?auto_789681 ) ) ( not ( = ?auto_789680 ?auto_789682 ) ) ( not ( = ?auto_789680 ?auto_789683 ) ) ( not ( = ?auto_789680 ?auto_789684 ) ) ( not ( = ?auto_789680 ?auto_789685 ) ) ( not ( = ?auto_789680 ?auto_789686 ) ) ( not ( = ?auto_789680 ?auto_789687 ) ) ( not ( = ?auto_789680 ?auto_789688 ) ) ( not ( = ?auto_789680 ?auto_789689 ) ) ( not ( = ?auto_789681 ?auto_789682 ) ) ( not ( = ?auto_789681 ?auto_789683 ) ) ( not ( = ?auto_789681 ?auto_789684 ) ) ( not ( = ?auto_789681 ?auto_789685 ) ) ( not ( = ?auto_789681 ?auto_789686 ) ) ( not ( = ?auto_789681 ?auto_789687 ) ) ( not ( = ?auto_789681 ?auto_789688 ) ) ( not ( = ?auto_789681 ?auto_789689 ) ) ( not ( = ?auto_789682 ?auto_789683 ) ) ( not ( = ?auto_789682 ?auto_789684 ) ) ( not ( = ?auto_789682 ?auto_789685 ) ) ( not ( = ?auto_789682 ?auto_789686 ) ) ( not ( = ?auto_789682 ?auto_789687 ) ) ( not ( = ?auto_789682 ?auto_789688 ) ) ( not ( = ?auto_789682 ?auto_789689 ) ) ( not ( = ?auto_789683 ?auto_789684 ) ) ( not ( = ?auto_789683 ?auto_789685 ) ) ( not ( = ?auto_789683 ?auto_789686 ) ) ( not ( = ?auto_789683 ?auto_789687 ) ) ( not ( = ?auto_789683 ?auto_789688 ) ) ( not ( = ?auto_789683 ?auto_789689 ) ) ( not ( = ?auto_789684 ?auto_789685 ) ) ( not ( = ?auto_789684 ?auto_789686 ) ) ( not ( = ?auto_789684 ?auto_789687 ) ) ( not ( = ?auto_789684 ?auto_789688 ) ) ( not ( = ?auto_789684 ?auto_789689 ) ) ( not ( = ?auto_789685 ?auto_789686 ) ) ( not ( = ?auto_789685 ?auto_789687 ) ) ( not ( = ?auto_789685 ?auto_789688 ) ) ( not ( = ?auto_789685 ?auto_789689 ) ) ( not ( = ?auto_789686 ?auto_789687 ) ) ( not ( = ?auto_789686 ?auto_789688 ) ) ( not ( = ?auto_789686 ?auto_789689 ) ) ( not ( = ?auto_789687 ?auto_789688 ) ) ( not ( = ?auto_789687 ?auto_789689 ) ) ( not ( = ?auto_789688 ?auto_789689 ) ) ( ON ?auto_789687 ?auto_789688 ) ( ON ?auto_789686 ?auto_789687 ) ( ON ?auto_789685 ?auto_789686 ) ( ON ?auto_789684 ?auto_789685 ) ( ON ?auto_789683 ?auto_789684 ) ( ON ?auto_789682 ?auto_789683 ) ( ON ?auto_789681 ?auto_789682 ) ( ON ?auto_789680 ?auto_789681 ) ( ON ?auto_789679 ?auto_789680 ) ( ON ?auto_789678 ?auto_789679 ) ( ON ?auto_789677 ?auto_789678 ) ( CLEAR ?auto_789675 ) ( ON ?auto_789676 ?auto_789677 ) ( CLEAR ?auto_789676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_789673 ?auto_789674 ?auto_789675 ?auto_789676 )
      ( MAKE-16PILE ?auto_789673 ?auto_789674 ?auto_789675 ?auto_789676 ?auto_789677 ?auto_789678 ?auto_789679 ?auto_789680 ?auto_789681 ?auto_789682 ?auto_789683 ?auto_789684 ?auto_789685 ?auto_789686 ?auto_789687 ?auto_789688 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789739 - BLOCK
      ?auto_789740 - BLOCK
      ?auto_789741 - BLOCK
      ?auto_789742 - BLOCK
      ?auto_789743 - BLOCK
      ?auto_789744 - BLOCK
      ?auto_789745 - BLOCK
      ?auto_789746 - BLOCK
      ?auto_789747 - BLOCK
      ?auto_789748 - BLOCK
      ?auto_789749 - BLOCK
      ?auto_789750 - BLOCK
      ?auto_789751 - BLOCK
      ?auto_789752 - BLOCK
      ?auto_789753 - BLOCK
      ?auto_789754 - BLOCK
    )
    :vars
    (
      ?auto_789755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789754 ?auto_789755 ) ( ON-TABLE ?auto_789739 ) ( ON ?auto_789740 ?auto_789739 ) ( not ( = ?auto_789739 ?auto_789740 ) ) ( not ( = ?auto_789739 ?auto_789741 ) ) ( not ( = ?auto_789739 ?auto_789742 ) ) ( not ( = ?auto_789739 ?auto_789743 ) ) ( not ( = ?auto_789739 ?auto_789744 ) ) ( not ( = ?auto_789739 ?auto_789745 ) ) ( not ( = ?auto_789739 ?auto_789746 ) ) ( not ( = ?auto_789739 ?auto_789747 ) ) ( not ( = ?auto_789739 ?auto_789748 ) ) ( not ( = ?auto_789739 ?auto_789749 ) ) ( not ( = ?auto_789739 ?auto_789750 ) ) ( not ( = ?auto_789739 ?auto_789751 ) ) ( not ( = ?auto_789739 ?auto_789752 ) ) ( not ( = ?auto_789739 ?auto_789753 ) ) ( not ( = ?auto_789739 ?auto_789754 ) ) ( not ( = ?auto_789739 ?auto_789755 ) ) ( not ( = ?auto_789740 ?auto_789741 ) ) ( not ( = ?auto_789740 ?auto_789742 ) ) ( not ( = ?auto_789740 ?auto_789743 ) ) ( not ( = ?auto_789740 ?auto_789744 ) ) ( not ( = ?auto_789740 ?auto_789745 ) ) ( not ( = ?auto_789740 ?auto_789746 ) ) ( not ( = ?auto_789740 ?auto_789747 ) ) ( not ( = ?auto_789740 ?auto_789748 ) ) ( not ( = ?auto_789740 ?auto_789749 ) ) ( not ( = ?auto_789740 ?auto_789750 ) ) ( not ( = ?auto_789740 ?auto_789751 ) ) ( not ( = ?auto_789740 ?auto_789752 ) ) ( not ( = ?auto_789740 ?auto_789753 ) ) ( not ( = ?auto_789740 ?auto_789754 ) ) ( not ( = ?auto_789740 ?auto_789755 ) ) ( not ( = ?auto_789741 ?auto_789742 ) ) ( not ( = ?auto_789741 ?auto_789743 ) ) ( not ( = ?auto_789741 ?auto_789744 ) ) ( not ( = ?auto_789741 ?auto_789745 ) ) ( not ( = ?auto_789741 ?auto_789746 ) ) ( not ( = ?auto_789741 ?auto_789747 ) ) ( not ( = ?auto_789741 ?auto_789748 ) ) ( not ( = ?auto_789741 ?auto_789749 ) ) ( not ( = ?auto_789741 ?auto_789750 ) ) ( not ( = ?auto_789741 ?auto_789751 ) ) ( not ( = ?auto_789741 ?auto_789752 ) ) ( not ( = ?auto_789741 ?auto_789753 ) ) ( not ( = ?auto_789741 ?auto_789754 ) ) ( not ( = ?auto_789741 ?auto_789755 ) ) ( not ( = ?auto_789742 ?auto_789743 ) ) ( not ( = ?auto_789742 ?auto_789744 ) ) ( not ( = ?auto_789742 ?auto_789745 ) ) ( not ( = ?auto_789742 ?auto_789746 ) ) ( not ( = ?auto_789742 ?auto_789747 ) ) ( not ( = ?auto_789742 ?auto_789748 ) ) ( not ( = ?auto_789742 ?auto_789749 ) ) ( not ( = ?auto_789742 ?auto_789750 ) ) ( not ( = ?auto_789742 ?auto_789751 ) ) ( not ( = ?auto_789742 ?auto_789752 ) ) ( not ( = ?auto_789742 ?auto_789753 ) ) ( not ( = ?auto_789742 ?auto_789754 ) ) ( not ( = ?auto_789742 ?auto_789755 ) ) ( not ( = ?auto_789743 ?auto_789744 ) ) ( not ( = ?auto_789743 ?auto_789745 ) ) ( not ( = ?auto_789743 ?auto_789746 ) ) ( not ( = ?auto_789743 ?auto_789747 ) ) ( not ( = ?auto_789743 ?auto_789748 ) ) ( not ( = ?auto_789743 ?auto_789749 ) ) ( not ( = ?auto_789743 ?auto_789750 ) ) ( not ( = ?auto_789743 ?auto_789751 ) ) ( not ( = ?auto_789743 ?auto_789752 ) ) ( not ( = ?auto_789743 ?auto_789753 ) ) ( not ( = ?auto_789743 ?auto_789754 ) ) ( not ( = ?auto_789743 ?auto_789755 ) ) ( not ( = ?auto_789744 ?auto_789745 ) ) ( not ( = ?auto_789744 ?auto_789746 ) ) ( not ( = ?auto_789744 ?auto_789747 ) ) ( not ( = ?auto_789744 ?auto_789748 ) ) ( not ( = ?auto_789744 ?auto_789749 ) ) ( not ( = ?auto_789744 ?auto_789750 ) ) ( not ( = ?auto_789744 ?auto_789751 ) ) ( not ( = ?auto_789744 ?auto_789752 ) ) ( not ( = ?auto_789744 ?auto_789753 ) ) ( not ( = ?auto_789744 ?auto_789754 ) ) ( not ( = ?auto_789744 ?auto_789755 ) ) ( not ( = ?auto_789745 ?auto_789746 ) ) ( not ( = ?auto_789745 ?auto_789747 ) ) ( not ( = ?auto_789745 ?auto_789748 ) ) ( not ( = ?auto_789745 ?auto_789749 ) ) ( not ( = ?auto_789745 ?auto_789750 ) ) ( not ( = ?auto_789745 ?auto_789751 ) ) ( not ( = ?auto_789745 ?auto_789752 ) ) ( not ( = ?auto_789745 ?auto_789753 ) ) ( not ( = ?auto_789745 ?auto_789754 ) ) ( not ( = ?auto_789745 ?auto_789755 ) ) ( not ( = ?auto_789746 ?auto_789747 ) ) ( not ( = ?auto_789746 ?auto_789748 ) ) ( not ( = ?auto_789746 ?auto_789749 ) ) ( not ( = ?auto_789746 ?auto_789750 ) ) ( not ( = ?auto_789746 ?auto_789751 ) ) ( not ( = ?auto_789746 ?auto_789752 ) ) ( not ( = ?auto_789746 ?auto_789753 ) ) ( not ( = ?auto_789746 ?auto_789754 ) ) ( not ( = ?auto_789746 ?auto_789755 ) ) ( not ( = ?auto_789747 ?auto_789748 ) ) ( not ( = ?auto_789747 ?auto_789749 ) ) ( not ( = ?auto_789747 ?auto_789750 ) ) ( not ( = ?auto_789747 ?auto_789751 ) ) ( not ( = ?auto_789747 ?auto_789752 ) ) ( not ( = ?auto_789747 ?auto_789753 ) ) ( not ( = ?auto_789747 ?auto_789754 ) ) ( not ( = ?auto_789747 ?auto_789755 ) ) ( not ( = ?auto_789748 ?auto_789749 ) ) ( not ( = ?auto_789748 ?auto_789750 ) ) ( not ( = ?auto_789748 ?auto_789751 ) ) ( not ( = ?auto_789748 ?auto_789752 ) ) ( not ( = ?auto_789748 ?auto_789753 ) ) ( not ( = ?auto_789748 ?auto_789754 ) ) ( not ( = ?auto_789748 ?auto_789755 ) ) ( not ( = ?auto_789749 ?auto_789750 ) ) ( not ( = ?auto_789749 ?auto_789751 ) ) ( not ( = ?auto_789749 ?auto_789752 ) ) ( not ( = ?auto_789749 ?auto_789753 ) ) ( not ( = ?auto_789749 ?auto_789754 ) ) ( not ( = ?auto_789749 ?auto_789755 ) ) ( not ( = ?auto_789750 ?auto_789751 ) ) ( not ( = ?auto_789750 ?auto_789752 ) ) ( not ( = ?auto_789750 ?auto_789753 ) ) ( not ( = ?auto_789750 ?auto_789754 ) ) ( not ( = ?auto_789750 ?auto_789755 ) ) ( not ( = ?auto_789751 ?auto_789752 ) ) ( not ( = ?auto_789751 ?auto_789753 ) ) ( not ( = ?auto_789751 ?auto_789754 ) ) ( not ( = ?auto_789751 ?auto_789755 ) ) ( not ( = ?auto_789752 ?auto_789753 ) ) ( not ( = ?auto_789752 ?auto_789754 ) ) ( not ( = ?auto_789752 ?auto_789755 ) ) ( not ( = ?auto_789753 ?auto_789754 ) ) ( not ( = ?auto_789753 ?auto_789755 ) ) ( not ( = ?auto_789754 ?auto_789755 ) ) ( ON ?auto_789753 ?auto_789754 ) ( ON ?auto_789752 ?auto_789753 ) ( ON ?auto_789751 ?auto_789752 ) ( ON ?auto_789750 ?auto_789751 ) ( ON ?auto_789749 ?auto_789750 ) ( ON ?auto_789748 ?auto_789749 ) ( ON ?auto_789747 ?auto_789748 ) ( ON ?auto_789746 ?auto_789747 ) ( ON ?auto_789745 ?auto_789746 ) ( ON ?auto_789744 ?auto_789745 ) ( ON ?auto_789743 ?auto_789744 ) ( ON ?auto_789742 ?auto_789743 ) ( CLEAR ?auto_789740 ) ( ON ?auto_789741 ?auto_789742 ) ( CLEAR ?auto_789741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_789739 ?auto_789740 ?auto_789741 )
      ( MAKE-16PILE ?auto_789739 ?auto_789740 ?auto_789741 ?auto_789742 ?auto_789743 ?auto_789744 ?auto_789745 ?auto_789746 ?auto_789747 ?auto_789748 ?auto_789749 ?auto_789750 ?auto_789751 ?auto_789752 ?auto_789753 ?auto_789754 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789805 - BLOCK
      ?auto_789806 - BLOCK
      ?auto_789807 - BLOCK
      ?auto_789808 - BLOCK
      ?auto_789809 - BLOCK
      ?auto_789810 - BLOCK
      ?auto_789811 - BLOCK
      ?auto_789812 - BLOCK
      ?auto_789813 - BLOCK
      ?auto_789814 - BLOCK
      ?auto_789815 - BLOCK
      ?auto_789816 - BLOCK
      ?auto_789817 - BLOCK
      ?auto_789818 - BLOCK
      ?auto_789819 - BLOCK
      ?auto_789820 - BLOCK
    )
    :vars
    (
      ?auto_789821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789820 ?auto_789821 ) ( ON-TABLE ?auto_789805 ) ( not ( = ?auto_789805 ?auto_789806 ) ) ( not ( = ?auto_789805 ?auto_789807 ) ) ( not ( = ?auto_789805 ?auto_789808 ) ) ( not ( = ?auto_789805 ?auto_789809 ) ) ( not ( = ?auto_789805 ?auto_789810 ) ) ( not ( = ?auto_789805 ?auto_789811 ) ) ( not ( = ?auto_789805 ?auto_789812 ) ) ( not ( = ?auto_789805 ?auto_789813 ) ) ( not ( = ?auto_789805 ?auto_789814 ) ) ( not ( = ?auto_789805 ?auto_789815 ) ) ( not ( = ?auto_789805 ?auto_789816 ) ) ( not ( = ?auto_789805 ?auto_789817 ) ) ( not ( = ?auto_789805 ?auto_789818 ) ) ( not ( = ?auto_789805 ?auto_789819 ) ) ( not ( = ?auto_789805 ?auto_789820 ) ) ( not ( = ?auto_789805 ?auto_789821 ) ) ( not ( = ?auto_789806 ?auto_789807 ) ) ( not ( = ?auto_789806 ?auto_789808 ) ) ( not ( = ?auto_789806 ?auto_789809 ) ) ( not ( = ?auto_789806 ?auto_789810 ) ) ( not ( = ?auto_789806 ?auto_789811 ) ) ( not ( = ?auto_789806 ?auto_789812 ) ) ( not ( = ?auto_789806 ?auto_789813 ) ) ( not ( = ?auto_789806 ?auto_789814 ) ) ( not ( = ?auto_789806 ?auto_789815 ) ) ( not ( = ?auto_789806 ?auto_789816 ) ) ( not ( = ?auto_789806 ?auto_789817 ) ) ( not ( = ?auto_789806 ?auto_789818 ) ) ( not ( = ?auto_789806 ?auto_789819 ) ) ( not ( = ?auto_789806 ?auto_789820 ) ) ( not ( = ?auto_789806 ?auto_789821 ) ) ( not ( = ?auto_789807 ?auto_789808 ) ) ( not ( = ?auto_789807 ?auto_789809 ) ) ( not ( = ?auto_789807 ?auto_789810 ) ) ( not ( = ?auto_789807 ?auto_789811 ) ) ( not ( = ?auto_789807 ?auto_789812 ) ) ( not ( = ?auto_789807 ?auto_789813 ) ) ( not ( = ?auto_789807 ?auto_789814 ) ) ( not ( = ?auto_789807 ?auto_789815 ) ) ( not ( = ?auto_789807 ?auto_789816 ) ) ( not ( = ?auto_789807 ?auto_789817 ) ) ( not ( = ?auto_789807 ?auto_789818 ) ) ( not ( = ?auto_789807 ?auto_789819 ) ) ( not ( = ?auto_789807 ?auto_789820 ) ) ( not ( = ?auto_789807 ?auto_789821 ) ) ( not ( = ?auto_789808 ?auto_789809 ) ) ( not ( = ?auto_789808 ?auto_789810 ) ) ( not ( = ?auto_789808 ?auto_789811 ) ) ( not ( = ?auto_789808 ?auto_789812 ) ) ( not ( = ?auto_789808 ?auto_789813 ) ) ( not ( = ?auto_789808 ?auto_789814 ) ) ( not ( = ?auto_789808 ?auto_789815 ) ) ( not ( = ?auto_789808 ?auto_789816 ) ) ( not ( = ?auto_789808 ?auto_789817 ) ) ( not ( = ?auto_789808 ?auto_789818 ) ) ( not ( = ?auto_789808 ?auto_789819 ) ) ( not ( = ?auto_789808 ?auto_789820 ) ) ( not ( = ?auto_789808 ?auto_789821 ) ) ( not ( = ?auto_789809 ?auto_789810 ) ) ( not ( = ?auto_789809 ?auto_789811 ) ) ( not ( = ?auto_789809 ?auto_789812 ) ) ( not ( = ?auto_789809 ?auto_789813 ) ) ( not ( = ?auto_789809 ?auto_789814 ) ) ( not ( = ?auto_789809 ?auto_789815 ) ) ( not ( = ?auto_789809 ?auto_789816 ) ) ( not ( = ?auto_789809 ?auto_789817 ) ) ( not ( = ?auto_789809 ?auto_789818 ) ) ( not ( = ?auto_789809 ?auto_789819 ) ) ( not ( = ?auto_789809 ?auto_789820 ) ) ( not ( = ?auto_789809 ?auto_789821 ) ) ( not ( = ?auto_789810 ?auto_789811 ) ) ( not ( = ?auto_789810 ?auto_789812 ) ) ( not ( = ?auto_789810 ?auto_789813 ) ) ( not ( = ?auto_789810 ?auto_789814 ) ) ( not ( = ?auto_789810 ?auto_789815 ) ) ( not ( = ?auto_789810 ?auto_789816 ) ) ( not ( = ?auto_789810 ?auto_789817 ) ) ( not ( = ?auto_789810 ?auto_789818 ) ) ( not ( = ?auto_789810 ?auto_789819 ) ) ( not ( = ?auto_789810 ?auto_789820 ) ) ( not ( = ?auto_789810 ?auto_789821 ) ) ( not ( = ?auto_789811 ?auto_789812 ) ) ( not ( = ?auto_789811 ?auto_789813 ) ) ( not ( = ?auto_789811 ?auto_789814 ) ) ( not ( = ?auto_789811 ?auto_789815 ) ) ( not ( = ?auto_789811 ?auto_789816 ) ) ( not ( = ?auto_789811 ?auto_789817 ) ) ( not ( = ?auto_789811 ?auto_789818 ) ) ( not ( = ?auto_789811 ?auto_789819 ) ) ( not ( = ?auto_789811 ?auto_789820 ) ) ( not ( = ?auto_789811 ?auto_789821 ) ) ( not ( = ?auto_789812 ?auto_789813 ) ) ( not ( = ?auto_789812 ?auto_789814 ) ) ( not ( = ?auto_789812 ?auto_789815 ) ) ( not ( = ?auto_789812 ?auto_789816 ) ) ( not ( = ?auto_789812 ?auto_789817 ) ) ( not ( = ?auto_789812 ?auto_789818 ) ) ( not ( = ?auto_789812 ?auto_789819 ) ) ( not ( = ?auto_789812 ?auto_789820 ) ) ( not ( = ?auto_789812 ?auto_789821 ) ) ( not ( = ?auto_789813 ?auto_789814 ) ) ( not ( = ?auto_789813 ?auto_789815 ) ) ( not ( = ?auto_789813 ?auto_789816 ) ) ( not ( = ?auto_789813 ?auto_789817 ) ) ( not ( = ?auto_789813 ?auto_789818 ) ) ( not ( = ?auto_789813 ?auto_789819 ) ) ( not ( = ?auto_789813 ?auto_789820 ) ) ( not ( = ?auto_789813 ?auto_789821 ) ) ( not ( = ?auto_789814 ?auto_789815 ) ) ( not ( = ?auto_789814 ?auto_789816 ) ) ( not ( = ?auto_789814 ?auto_789817 ) ) ( not ( = ?auto_789814 ?auto_789818 ) ) ( not ( = ?auto_789814 ?auto_789819 ) ) ( not ( = ?auto_789814 ?auto_789820 ) ) ( not ( = ?auto_789814 ?auto_789821 ) ) ( not ( = ?auto_789815 ?auto_789816 ) ) ( not ( = ?auto_789815 ?auto_789817 ) ) ( not ( = ?auto_789815 ?auto_789818 ) ) ( not ( = ?auto_789815 ?auto_789819 ) ) ( not ( = ?auto_789815 ?auto_789820 ) ) ( not ( = ?auto_789815 ?auto_789821 ) ) ( not ( = ?auto_789816 ?auto_789817 ) ) ( not ( = ?auto_789816 ?auto_789818 ) ) ( not ( = ?auto_789816 ?auto_789819 ) ) ( not ( = ?auto_789816 ?auto_789820 ) ) ( not ( = ?auto_789816 ?auto_789821 ) ) ( not ( = ?auto_789817 ?auto_789818 ) ) ( not ( = ?auto_789817 ?auto_789819 ) ) ( not ( = ?auto_789817 ?auto_789820 ) ) ( not ( = ?auto_789817 ?auto_789821 ) ) ( not ( = ?auto_789818 ?auto_789819 ) ) ( not ( = ?auto_789818 ?auto_789820 ) ) ( not ( = ?auto_789818 ?auto_789821 ) ) ( not ( = ?auto_789819 ?auto_789820 ) ) ( not ( = ?auto_789819 ?auto_789821 ) ) ( not ( = ?auto_789820 ?auto_789821 ) ) ( ON ?auto_789819 ?auto_789820 ) ( ON ?auto_789818 ?auto_789819 ) ( ON ?auto_789817 ?auto_789818 ) ( ON ?auto_789816 ?auto_789817 ) ( ON ?auto_789815 ?auto_789816 ) ( ON ?auto_789814 ?auto_789815 ) ( ON ?auto_789813 ?auto_789814 ) ( ON ?auto_789812 ?auto_789813 ) ( ON ?auto_789811 ?auto_789812 ) ( ON ?auto_789810 ?auto_789811 ) ( ON ?auto_789809 ?auto_789810 ) ( ON ?auto_789808 ?auto_789809 ) ( ON ?auto_789807 ?auto_789808 ) ( CLEAR ?auto_789805 ) ( ON ?auto_789806 ?auto_789807 ) ( CLEAR ?auto_789806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_789805 ?auto_789806 )
      ( MAKE-16PILE ?auto_789805 ?auto_789806 ?auto_789807 ?auto_789808 ?auto_789809 ?auto_789810 ?auto_789811 ?auto_789812 ?auto_789813 ?auto_789814 ?auto_789815 ?auto_789816 ?auto_789817 ?auto_789818 ?auto_789819 ?auto_789820 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_789871 - BLOCK
      ?auto_789872 - BLOCK
      ?auto_789873 - BLOCK
      ?auto_789874 - BLOCK
      ?auto_789875 - BLOCK
      ?auto_789876 - BLOCK
      ?auto_789877 - BLOCK
      ?auto_789878 - BLOCK
      ?auto_789879 - BLOCK
      ?auto_789880 - BLOCK
      ?auto_789881 - BLOCK
      ?auto_789882 - BLOCK
      ?auto_789883 - BLOCK
      ?auto_789884 - BLOCK
      ?auto_789885 - BLOCK
      ?auto_789886 - BLOCK
    )
    :vars
    (
      ?auto_789887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_789886 ?auto_789887 ) ( not ( = ?auto_789871 ?auto_789872 ) ) ( not ( = ?auto_789871 ?auto_789873 ) ) ( not ( = ?auto_789871 ?auto_789874 ) ) ( not ( = ?auto_789871 ?auto_789875 ) ) ( not ( = ?auto_789871 ?auto_789876 ) ) ( not ( = ?auto_789871 ?auto_789877 ) ) ( not ( = ?auto_789871 ?auto_789878 ) ) ( not ( = ?auto_789871 ?auto_789879 ) ) ( not ( = ?auto_789871 ?auto_789880 ) ) ( not ( = ?auto_789871 ?auto_789881 ) ) ( not ( = ?auto_789871 ?auto_789882 ) ) ( not ( = ?auto_789871 ?auto_789883 ) ) ( not ( = ?auto_789871 ?auto_789884 ) ) ( not ( = ?auto_789871 ?auto_789885 ) ) ( not ( = ?auto_789871 ?auto_789886 ) ) ( not ( = ?auto_789871 ?auto_789887 ) ) ( not ( = ?auto_789872 ?auto_789873 ) ) ( not ( = ?auto_789872 ?auto_789874 ) ) ( not ( = ?auto_789872 ?auto_789875 ) ) ( not ( = ?auto_789872 ?auto_789876 ) ) ( not ( = ?auto_789872 ?auto_789877 ) ) ( not ( = ?auto_789872 ?auto_789878 ) ) ( not ( = ?auto_789872 ?auto_789879 ) ) ( not ( = ?auto_789872 ?auto_789880 ) ) ( not ( = ?auto_789872 ?auto_789881 ) ) ( not ( = ?auto_789872 ?auto_789882 ) ) ( not ( = ?auto_789872 ?auto_789883 ) ) ( not ( = ?auto_789872 ?auto_789884 ) ) ( not ( = ?auto_789872 ?auto_789885 ) ) ( not ( = ?auto_789872 ?auto_789886 ) ) ( not ( = ?auto_789872 ?auto_789887 ) ) ( not ( = ?auto_789873 ?auto_789874 ) ) ( not ( = ?auto_789873 ?auto_789875 ) ) ( not ( = ?auto_789873 ?auto_789876 ) ) ( not ( = ?auto_789873 ?auto_789877 ) ) ( not ( = ?auto_789873 ?auto_789878 ) ) ( not ( = ?auto_789873 ?auto_789879 ) ) ( not ( = ?auto_789873 ?auto_789880 ) ) ( not ( = ?auto_789873 ?auto_789881 ) ) ( not ( = ?auto_789873 ?auto_789882 ) ) ( not ( = ?auto_789873 ?auto_789883 ) ) ( not ( = ?auto_789873 ?auto_789884 ) ) ( not ( = ?auto_789873 ?auto_789885 ) ) ( not ( = ?auto_789873 ?auto_789886 ) ) ( not ( = ?auto_789873 ?auto_789887 ) ) ( not ( = ?auto_789874 ?auto_789875 ) ) ( not ( = ?auto_789874 ?auto_789876 ) ) ( not ( = ?auto_789874 ?auto_789877 ) ) ( not ( = ?auto_789874 ?auto_789878 ) ) ( not ( = ?auto_789874 ?auto_789879 ) ) ( not ( = ?auto_789874 ?auto_789880 ) ) ( not ( = ?auto_789874 ?auto_789881 ) ) ( not ( = ?auto_789874 ?auto_789882 ) ) ( not ( = ?auto_789874 ?auto_789883 ) ) ( not ( = ?auto_789874 ?auto_789884 ) ) ( not ( = ?auto_789874 ?auto_789885 ) ) ( not ( = ?auto_789874 ?auto_789886 ) ) ( not ( = ?auto_789874 ?auto_789887 ) ) ( not ( = ?auto_789875 ?auto_789876 ) ) ( not ( = ?auto_789875 ?auto_789877 ) ) ( not ( = ?auto_789875 ?auto_789878 ) ) ( not ( = ?auto_789875 ?auto_789879 ) ) ( not ( = ?auto_789875 ?auto_789880 ) ) ( not ( = ?auto_789875 ?auto_789881 ) ) ( not ( = ?auto_789875 ?auto_789882 ) ) ( not ( = ?auto_789875 ?auto_789883 ) ) ( not ( = ?auto_789875 ?auto_789884 ) ) ( not ( = ?auto_789875 ?auto_789885 ) ) ( not ( = ?auto_789875 ?auto_789886 ) ) ( not ( = ?auto_789875 ?auto_789887 ) ) ( not ( = ?auto_789876 ?auto_789877 ) ) ( not ( = ?auto_789876 ?auto_789878 ) ) ( not ( = ?auto_789876 ?auto_789879 ) ) ( not ( = ?auto_789876 ?auto_789880 ) ) ( not ( = ?auto_789876 ?auto_789881 ) ) ( not ( = ?auto_789876 ?auto_789882 ) ) ( not ( = ?auto_789876 ?auto_789883 ) ) ( not ( = ?auto_789876 ?auto_789884 ) ) ( not ( = ?auto_789876 ?auto_789885 ) ) ( not ( = ?auto_789876 ?auto_789886 ) ) ( not ( = ?auto_789876 ?auto_789887 ) ) ( not ( = ?auto_789877 ?auto_789878 ) ) ( not ( = ?auto_789877 ?auto_789879 ) ) ( not ( = ?auto_789877 ?auto_789880 ) ) ( not ( = ?auto_789877 ?auto_789881 ) ) ( not ( = ?auto_789877 ?auto_789882 ) ) ( not ( = ?auto_789877 ?auto_789883 ) ) ( not ( = ?auto_789877 ?auto_789884 ) ) ( not ( = ?auto_789877 ?auto_789885 ) ) ( not ( = ?auto_789877 ?auto_789886 ) ) ( not ( = ?auto_789877 ?auto_789887 ) ) ( not ( = ?auto_789878 ?auto_789879 ) ) ( not ( = ?auto_789878 ?auto_789880 ) ) ( not ( = ?auto_789878 ?auto_789881 ) ) ( not ( = ?auto_789878 ?auto_789882 ) ) ( not ( = ?auto_789878 ?auto_789883 ) ) ( not ( = ?auto_789878 ?auto_789884 ) ) ( not ( = ?auto_789878 ?auto_789885 ) ) ( not ( = ?auto_789878 ?auto_789886 ) ) ( not ( = ?auto_789878 ?auto_789887 ) ) ( not ( = ?auto_789879 ?auto_789880 ) ) ( not ( = ?auto_789879 ?auto_789881 ) ) ( not ( = ?auto_789879 ?auto_789882 ) ) ( not ( = ?auto_789879 ?auto_789883 ) ) ( not ( = ?auto_789879 ?auto_789884 ) ) ( not ( = ?auto_789879 ?auto_789885 ) ) ( not ( = ?auto_789879 ?auto_789886 ) ) ( not ( = ?auto_789879 ?auto_789887 ) ) ( not ( = ?auto_789880 ?auto_789881 ) ) ( not ( = ?auto_789880 ?auto_789882 ) ) ( not ( = ?auto_789880 ?auto_789883 ) ) ( not ( = ?auto_789880 ?auto_789884 ) ) ( not ( = ?auto_789880 ?auto_789885 ) ) ( not ( = ?auto_789880 ?auto_789886 ) ) ( not ( = ?auto_789880 ?auto_789887 ) ) ( not ( = ?auto_789881 ?auto_789882 ) ) ( not ( = ?auto_789881 ?auto_789883 ) ) ( not ( = ?auto_789881 ?auto_789884 ) ) ( not ( = ?auto_789881 ?auto_789885 ) ) ( not ( = ?auto_789881 ?auto_789886 ) ) ( not ( = ?auto_789881 ?auto_789887 ) ) ( not ( = ?auto_789882 ?auto_789883 ) ) ( not ( = ?auto_789882 ?auto_789884 ) ) ( not ( = ?auto_789882 ?auto_789885 ) ) ( not ( = ?auto_789882 ?auto_789886 ) ) ( not ( = ?auto_789882 ?auto_789887 ) ) ( not ( = ?auto_789883 ?auto_789884 ) ) ( not ( = ?auto_789883 ?auto_789885 ) ) ( not ( = ?auto_789883 ?auto_789886 ) ) ( not ( = ?auto_789883 ?auto_789887 ) ) ( not ( = ?auto_789884 ?auto_789885 ) ) ( not ( = ?auto_789884 ?auto_789886 ) ) ( not ( = ?auto_789884 ?auto_789887 ) ) ( not ( = ?auto_789885 ?auto_789886 ) ) ( not ( = ?auto_789885 ?auto_789887 ) ) ( not ( = ?auto_789886 ?auto_789887 ) ) ( ON ?auto_789885 ?auto_789886 ) ( ON ?auto_789884 ?auto_789885 ) ( ON ?auto_789883 ?auto_789884 ) ( ON ?auto_789882 ?auto_789883 ) ( ON ?auto_789881 ?auto_789882 ) ( ON ?auto_789880 ?auto_789881 ) ( ON ?auto_789879 ?auto_789880 ) ( ON ?auto_789878 ?auto_789879 ) ( ON ?auto_789877 ?auto_789878 ) ( ON ?auto_789876 ?auto_789877 ) ( ON ?auto_789875 ?auto_789876 ) ( ON ?auto_789874 ?auto_789875 ) ( ON ?auto_789873 ?auto_789874 ) ( ON ?auto_789872 ?auto_789873 ) ( ON ?auto_789871 ?auto_789872 ) ( CLEAR ?auto_789871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_789871 )
      ( MAKE-16PILE ?auto_789871 ?auto_789872 ?auto_789873 ?auto_789874 ?auto_789875 ?auto_789876 ?auto_789877 ?auto_789878 ?auto_789879 ?auto_789880 ?auto_789881 ?auto_789882 ?auto_789883 ?auto_789884 ?auto_789885 ?auto_789886 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_789938 - BLOCK
      ?auto_789939 - BLOCK
      ?auto_789940 - BLOCK
      ?auto_789941 - BLOCK
      ?auto_789942 - BLOCK
      ?auto_789943 - BLOCK
      ?auto_789944 - BLOCK
      ?auto_789945 - BLOCK
      ?auto_789946 - BLOCK
      ?auto_789947 - BLOCK
      ?auto_789948 - BLOCK
      ?auto_789949 - BLOCK
      ?auto_789950 - BLOCK
      ?auto_789951 - BLOCK
      ?auto_789952 - BLOCK
      ?auto_789953 - BLOCK
      ?auto_789954 - BLOCK
    )
    :vars
    (
      ?auto_789955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_789953 ) ( ON ?auto_789954 ?auto_789955 ) ( CLEAR ?auto_789954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_789938 ) ( ON ?auto_789939 ?auto_789938 ) ( ON ?auto_789940 ?auto_789939 ) ( ON ?auto_789941 ?auto_789940 ) ( ON ?auto_789942 ?auto_789941 ) ( ON ?auto_789943 ?auto_789942 ) ( ON ?auto_789944 ?auto_789943 ) ( ON ?auto_789945 ?auto_789944 ) ( ON ?auto_789946 ?auto_789945 ) ( ON ?auto_789947 ?auto_789946 ) ( ON ?auto_789948 ?auto_789947 ) ( ON ?auto_789949 ?auto_789948 ) ( ON ?auto_789950 ?auto_789949 ) ( ON ?auto_789951 ?auto_789950 ) ( ON ?auto_789952 ?auto_789951 ) ( ON ?auto_789953 ?auto_789952 ) ( not ( = ?auto_789938 ?auto_789939 ) ) ( not ( = ?auto_789938 ?auto_789940 ) ) ( not ( = ?auto_789938 ?auto_789941 ) ) ( not ( = ?auto_789938 ?auto_789942 ) ) ( not ( = ?auto_789938 ?auto_789943 ) ) ( not ( = ?auto_789938 ?auto_789944 ) ) ( not ( = ?auto_789938 ?auto_789945 ) ) ( not ( = ?auto_789938 ?auto_789946 ) ) ( not ( = ?auto_789938 ?auto_789947 ) ) ( not ( = ?auto_789938 ?auto_789948 ) ) ( not ( = ?auto_789938 ?auto_789949 ) ) ( not ( = ?auto_789938 ?auto_789950 ) ) ( not ( = ?auto_789938 ?auto_789951 ) ) ( not ( = ?auto_789938 ?auto_789952 ) ) ( not ( = ?auto_789938 ?auto_789953 ) ) ( not ( = ?auto_789938 ?auto_789954 ) ) ( not ( = ?auto_789938 ?auto_789955 ) ) ( not ( = ?auto_789939 ?auto_789940 ) ) ( not ( = ?auto_789939 ?auto_789941 ) ) ( not ( = ?auto_789939 ?auto_789942 ) ) ( not ( = ?auto_789939 ?auto_789943 ) ) ( not ( = ?auto_789939 ?auto_789944 ) ) ( not ( = ?auto_789939 ?auto_789945 ) ) ( not ( = ?auto_789939 ?auto_789946 ) ) ( not ( = ?auto_789939 ?auto_789947 ) ) ( not ( = ?auto_789939 ?auto_789948 ) ) ( not ( = ?auto_789939 ?auto_789949 ) ) ( not ( = ?auto_789939 ?auto_789950 ) ) ( not ( = ?auto_789939 ?auto_789951 ) ) ( not ( = ?auto_789939 ?auto_789952 ) ) ( not ( = ?auto_789939 ?auto_789953 ) ) ( not ( = ?auto_789939 ?auto_789954 ) ) ( not ( = ?auto_789939 ?auto_789955 ) ) ( not ( = ?auto_789940 ?auto_789941 ) ) ( not ( = ?auto_789940 ?auto_789942 ) ) ( not ( = ?auto_789940 ?auto_789943 ) ) ( not ( = ?auto_789940 ?auto_789944 ) ) ( not ( = ?auto_789940 ?auto_789945 ) ) ( not ( = ?auto_789940 ?auto_789946 ) ) ( not ( = ?auto_789940 ?auto_789947 ) ) ( not ( = ?auto_789940 ?auto_789948 ) ) ( not ( = ?auto_789940 ?auto_789949 ) ) ( not ( = ?auto_789940 ?auto_789950 ) ) ( not ( = ?auto_789940 ?auto_789951 ) ) ( not ( = ?auto_789940 ?auto_789952 ) ) ( not ( = ?auto_789940 ?auto_789953 ) ) ( not ( = ?auto_789940 ?auto_789954 ) ) ( not ( = ?auto_789940 ?auto_789955 ) ) ( not ( = ?auto_789941 ?auto_789942 ) ) ( not ( = ?auto_789941 ?auto_789943 ) ) ( not ( = ?auto_789941 ?auto_789944 ) ) ( not ( = ?auto_789941 ?auto_789945 ) ) ( not ( = ?auto_789941 ?auto_789946 ) ) ( not ( = ?auto_789941 ?auto_789947 ) ) ( not ( = ?auto_789941 ?auto_789948 ) ) ( not ( = ?auto_789941 ?auto_789949 ) ) ( not ( = ?auto_789941 ?auto_789950 ) ) ( not ( = ?auto_789941 ?auto_789951 ) ) ( not ( = ?auto_789941 ?auto_789952 ) ) ( not ( = ?auto_789941 ?auto_789953 ) ) ( not ( = ?auto_789941 ?auto_789954 ) ) ( not ( = ?auto_789941 ?auto_789955 ) ) ( not ( = ?auto_789942 ?auto_789943 ) ) ( not ( = ?auto_789942 ?auto_789944 ) ) ( not ( = ?auto_789942 ?auto_789945 ) ) ( not ( = ?auto_789942 ?auto_789946 ) ) ( not ( = ?auto_789942 ?auto_789947 ) ) ( not ( = ?auto_789942 ?auto_789948 ) ) ( not ( = ?auto_789942 ?auto_789949 ) ) ( not ( = ?auto_789942 ?auto_789950 ) ) ( not ( = ?auto_789942 ?auto_789951 ) ) ( not ( = ?auto_789942 ?auto_789952 ) ) ( not ( = ?auto_789942 ?auto_789953 ) ) ( not ( = ?auto_789942 ?auto_789954 ) ) ( not ( = ?auto_789942 ?auto_789955 ) ) ( not ( = ?auto_789943 ?auto_789944 ) ) ( not ( = ?auto_789943 ?auto_789945 ) ) ( not ( = ?auto_789943 ?auto_789946 ) ) ( not ( = ?auto_789943 ?auto_789947 ) ) ( not ( = ?auto_789943 ?auto_789948 ) ) ( not ( = ?auto_789943 ?auto_789949 ) ) ( not ( = ?auto_789943 ?auto_789950 ) ) ( not ( = ?auto_789943 ?auto_789951 ) ) ( not ( = ?auto_789943 ?auto_789952 ) ) ( not ( = ?auto_789943 ?auto_789953 ) ) ( not ( = ?auto_789943 ?auto_789954 ) ) ( not ( = ?auto_789943 ?auto_789955 ) ) ( not ( = ?auto_789944 ?auto_789945 ) ) ( not ( = ?auto_789944 ?auto_789946 ) ) ( not ( = ?auto_789944 ?auto_789947 ) ) ( not ( = ?auto_789944 ?auto_789948 ) ) ( not ( = ?auto_789944 ?auto_789949 ) ) ( not ( = ?auto_789944 ?auto_789950 ) ) ( not ( = ?auto_789944 ?auto_789951 ) ) ( not ( = ?auto_789944 ?auto_789952 ) ) ( not ( = ?auto_789944 ?auto_789953 ) ) ( not ( = ?auto_789944 ?auto_789954 ) ) ( not ( = ?auto_789944 ?auto_789955 ) ) ( not ( = ?auto_789945 ?auto_789946 ) ) ( not ( = ?auto_789945 ?auto_789947 ) ) ( not ( = ?auto_789945 ?auto_789948 ) ) ( not ( = ?auto_789945 ?auto_789949 ) ) ( not ( = ?auto_789945 ?auto_789950 ) ) ( not ( = ?auto_789945 ?auto_789951 ) ) ( not ( = ?auto_789945 ?auto_789952 ) ) ( not ( = ?auto_789945 ?auto_789953 ) ) ( not ( = ?auto_789945 ?auto_789954 ) ) ( not ( = ?auto_789945 ?auto_789955 ) ) ( not ( = ?auto_789946 ?auto_789947 ) ) ( not ( = ?auto_789946 ?auto_789948 ) ) ( not ( = ?auto_789946 ?auto_789949 ) ) ( not ( = ?auto_789946 ?auto_789950 ) ) ( not ( = ?auto_789946 ?auto_789951 ) ) ( not ( = ?auto_789946 ?auto_789952 ) ) ( not ( = ?auto_789946 ?auto_789953 ) ) ( not ( = ?auto_789946 ?auto_789954 ) ) ( not ( = ?auto_789946 ?auto_789955 ) ) ( not ( = ?auto_789947 ?auto_789948 ) ) ( not ( = ?auto_789947 ?auto_789949 ) ) ( not ( = ?auto_789947 ?auto_789950 ) ) ( not ( = ?auto_789947 ?auto_789951 ) ) ( not ( = ?auto_789947 ?auto_789952 ) ) ( not ( = ?auto_789947 ?auto_789953 ) ) ( not ( = ?auto_789947 ?auto_789954 ) ) ( not ( = ?auto_789947 ?auto_789955 ) ) ( not ( = ?auto_789948 ?auto_789949 ) ) ( not ( = ?auto_789948 ?auto_789950 ) ) ( not ( = ?auto_789948 ?auto_789951 ) ) ( not ( = ?auto_789948 ?auto_789952 ) ) ( not ( = ?auto_789948 ?auto_789953 ) ) ( not ( = ?auto_789948 ?auto_789954 ) ) ( not ( = ?auto_789948 ?auto_789955 ) ) ( not ( = ?auto_789949 ?auto_789950 ) ) ( not ( = ?auto_789949 ?auto_789951 ) ) ( not ( = ?auto_789949 ?auto_789952 ) ) ( not ( = ?auto_789949 ?auto_789953 ) ) ( not ( = ?auto_789949 ?auto_789954 ) ) ( not ( = ?auto_789949 ?auto_789955 ) ) ( not ( = ?auto_789950 ?auto_789951 ) ) ( not ( = ?auto_789950 ?auto_789952 ) ) ( not ( = ?auto_789950 ?auto_789953 ) ) ( not ( = ?auto_789950 ?auto_789954 ) ) ( not ( = ?auto_789950 ?auto_789955 ) ) ( not ( = ?auto_789951 ?auto_789952 ) ) ( not ( = ?auto_789951 ?auto_789953 ) ) ( not ( = ?auto_789951 ?auto_789954 ) ) ( not ( = ?auto_789951 ?auto_789955 ) ) ( not ( = ?auto_789952 ?auto_789953 ) ) ( not ( = ?auto_789952 ?auto_789954 ) ) ( not ( = ?auto_789952 ?auto_789955 ) ) ( not ( = ?auto_789953 ?auto_789954 ) ) ( not ( = ?auto_789953 ?auto_789955 ) ) ( not ( = ?auto_789954 ?auto_789955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_789954 ?auto_789955 )
      ( !STACK ?auto_789954 ?auto_789953 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790008 - BLOCK
      ?auto_790009 - BLOCK
      ?auto_790010 - BLOCK
      ?auto_790011 - BLOCK
      ?auto_790012 - BLOCK
      ?auto_790013 - BLOCK
      ?auto_790014 - BLOCK
      ?auto_790015 - BLOCK
      ?auto_790016 - BLOCK
      ?auto_790017 - BLOCK
      ?auto_790018 - BLOCK
      ?auto_790019 - BLOCK
      ?auto_790020 - BLOCK
      ?auto_790021 - BLOCK
      ?auto_790022 - BLOCK
      ?auto_790023 - BLOCK
      ?auto_790024 - BLOCK
    )
    :vars
    (
      ?auto_790025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790024 ?auto_790025 ) ( ON-TABLE ?auto_790008 ) ( ON ?auto_790009 ?auto_790008 ) ( ON ?auto_790010 ?auto_790009 ) ( ON ?auto_790011 ?auto_790010 ) ( ON ?auto_790012 ?auto_790011 ) ( ON ?auto_790013 ?auto_790012 ) ( ON ?auto_790014 ?auto_790013 ) ( ON ?auto_790015 ?auto_790014 ) ( ON ?auto_790016 ?auto_790015 ) ( ON ?auto_790017 ?auto_790016 ) ( ON ?auto_790018 ?auto_790017 ) ( ON ?auto_790019 ?auto_790018 ) ( ON ?auto_790020 ?auto_790019 ) ( ON ?auto_790021 ?auto_790020 ) ( ON ?auto_790022 ?auto_790021 ) ( not ( = ?auto_790008 ?auto_790009 ) ) ( not ( = ?auto_790008 ?auto_790010 ) ) ( not ( = ?auto_790008 ?auto_790011 ) ) ( not ( = ?auto_790008 ?auto_790012 ) ) ( not ( = ?auto_790008 ?auto_790013 ) ) ( not ( = ?auto_790008 ?auto_790014 ) ) ( not ( = ?auto_790008 ?auto_790015 ) ) ( not ( = ?auto_790008 ?auto_790016 ) ) ( not ( = ?auto_790008 ?auto_790017 ) ) ( not ( = ?auto_790008 ?auto_790018 ) ) ( not ( = ?auto_790008 ?auto_790019 ) ) ( not ( = ?auto_790008 ?auto_790020 ) ) ( not ( = ?auto_790008 ?auto_790021 ) ) ( not ( = ?auto_790008 ?auto_790022 ) ) ( not ( = ?auto_790008 ?auto_790023 ) ) ( not ( = ?auto_790008 ?auto_790024 ) ) ( not ( = ?auto_790008 ?auto_790025 ) ) ( not ( = ?auto_790009 ?auto_790010 ) ) ( not ( = ?auto_790009 ?auto_790011 ) ) ( not ( = ?auto_790009 ?auto_790012 ) ) ( not ( = ?auto_790009 ?auto_790013 ) ) ( not ( = ?auto_790009 ?auto_790014 ) ) ( not ( = ?auto_790009 ?auto_790015 ) ) ( not ( = ?auto_790009 ?auto_790016 ) ) ( not ( = ?auto_790009 ?auto_790017 ) ) ( not ( = ?auto_790009 ?auto_790018 ) ) ( not ( = ?auto_790009 ?auto_790019 ) ) ( not ( = ?auto_790009 ?auto_790020 ) ) ( not ( = ?auto_790009 ?auto_790021 ) ) ( not ( = ?auto_790009 ?auto_790022 ) ) ( not ( = ?auto_790009 ?auto_790023 ) ) ( not ( = ?auto_790009 ?auto_790024 ) ) ( not ( = ?auto_790009 ?auto_790025 ) ) ( not ( = ?auto_790010 ?auto_790011 ) ) ( not ( = ?auto_790010 ?auto_790012 ) ) ( not ( = ?auto_790010 ?auto_790013 ) ) ( not ( = ?auto_790010 ?auto_790014 ) ) ( not ( = ?auto_790010 ?auto_790015 ) ) ( not ( = ?auto_790010 ?auto_790016 ) ) ( not ( = ?auto_790010 ?auto_790017 ) ) ( not ( = ?auto_790010 ?auto_790018 ) ) ( not ( = ?auto_790010 ?auto_790019 ) ) ( not ( = ?auto_790010 ?auto_790020 ) ) ( not ( = ?auto_790010 ?auto_790021 ) ) ( not ( = ?auto_790010 ?auto_790022 ) ) ( not ( = ?auto_790010 ?auto_790023 ) ) ( not ( = ?auto_790010 ?auto_790024 ) ) ( not ( = ?auto_790010 ?auto_790025 ) ) ( not ( = ?auto_790011 ?auto_790012 ) ) ( not ( = ?auto_790011 ?auto_790013 ) ) ( not ( = ?auto_790011 ?auto_790014 ) ) ( not ( = ?auto_790011 ?auto_790015 ) ) ( not ( = ?auto_790011 ?auto_790016 ) ) ( not ( = ?auto_790011 ?auto_790017 ) ) ( not ( = ?auto_790011 ?auto_790018 ) ) ( not ( = ?auto_790011 ?auto_790019 ) ) ( not ( = ?auto_790011 ?auto_790020 ) ) ( not ( = ?auto_790011 ?auto_790021 ) ) ( not ( = ?auto_790011 ?auto_790022 ) ) ( not ( = ?auto_790011 ?auto_790023 ) ) ( not ( = ?auto_790011 ?auto_790024 ) ) ( not ( = ?auto_790011 ?auto_790025 ) ) ( not ( = ?auto_790012 ?auto_790013 ) ) ( not ( = ?auto_790012 ?auto_790014 ) ) ( not ( = ?auto_790012 ?auto_790015 ) ) ( not ( = ?auto_790012 ?auto_790016 ) ) ( not ( = ?auto_790012 ?auto_790017 ) ) ( not ( = ?auto_790012 ?auto_790018 ) ) ( not ( = ?auto_790012 ?auto_790019 ) ) ( not ( = ?auto_790012 ?auto_790020 ) ) ( not ( = ?auto_790012 ?auto_790021 ) ) ( not ( = ?auto_790012 ?auto_790022 ) ) ( not ( = ?auto_790012 ?auto_790023 ) ) ( not ( = ?auto_790012 ?auto_790024 ) ) ( not ( = ?auto_790012 ?auto_790025 ) ) ( not ( = ?auto_790013 ?auto_790014 ) ) ( not ( = ?auto_790013 ?auto_790015 ) ) ( not ( = ?auto_790013 ?auto_790016 ) ) ( not ( = ?auto_790013 ?auto_790017 ) ) ( not ( = ?auto_790013 ?auto_790018 ) ) ( not ( = ?auto_790013 ?auto_790019 ) ) ( not ( = ?auto_790013 ?auto_790020 ) ) ( not ( = ?auto_790013 ?auto_790021 ) ) ( not ( = ?auto_790013 ?auto_790022 ) ) ( not ( = ?auto_790013 ?auto_790023 ) ) ( not ( = ?auto_790013 ?auto_790024 ) ) ( not ( = ?auto_790013 ?auto_790025 ) ) ( not ( = ?auto_790014 ?auto_790015 ) ) ( not ( = ?auto_790014 ?auto_790016 ) ) ( not ( = ?auto_790014 ?auto_790017 ) ) ( not ( = ?auto_790014 ?auto_790018 ) ) ( not ( = ?auto_790014 ?auto_790019 ) ) ( not ( = ?auto_790014 ?auto_790020 ) ) ( not ( = ?auto_790014 ?auto_790021 ) ) ( not ( = ?auto_790014 ?auto_790022 ) ) ( not ( = ?auto_790014 ?auto_790023 ) ) ( not ( = ?auto_790014 ?auto_790024 ) ) ( not ( = ?auto_790014 ?auto_790025 ) ) ( not ( = ?auto_790015 ?auto_790016 ) ) ( not ( = ?auto_790015 ?auto_790017 ) ) ( not ( = ?auto_790015 ?auto_790018 ) ) ( not ( = ?auto_790015 ?auto_790019 ) ) ( not ( = ?auto_790015 ?auto_790020 ) ) ( not ( = ?auto_790015 ?auto_790021 ) ) ( not ( = ?auto_790015 ?auto_790022 ) ) ( not ( = ?auto_790015 ?auto_790023 ) ) ( not ( = ?auto_790015 ?auto_790024 ) ) ( not ( = ?auto_790015 ?auto_790025 ) ) ( not ( = ?auto_790016 ?auto_790017 ) ) ( not ( = ?auto_790016 ?auto_790018 ) ) ( not ( = ?auto_790016 ?auto_790019 ) ) ( not ( = ?auto_790016 ?auto_790020 ) ) ( not ( = ?auto_790016 ?auto_790021 ) ) ( not ( = ?auto_790016 ?auto_790022 ) ) ( not ( = ?auto_790016 ?auto_790023 ) ) ( not ( = ?auto_790016 ?auto_790024 ) ) ( not ( = ?auto_790016 ?auto_790025 ) ) ( not ( = ?auto_790017 ?auto_790018 ) ) ( not ( = ?auto_790017 ?auto_790019 ) ) ( not ( = ?auto_790017 ?auto_790020 ) ) ( not ( = ?auto_790017 ?auto_790021 ) ) ( not ( = ?auto_790017 ?auto_790022 ) ) ( not ( = ?auto_790017 ?auto_790023 ) ) ( not ( = ?auto_790017 ?auto_790024 ) ) ( not ( = ?auto_790017 ?auto_790025 ) ) ( not ( = ?auto_790018 ?auto_790019 ) ) ( not ( = ?auto_790018 ?auto_790020 ) ) ( not ( = ?auto_790018 ?auto_790021 ) ) ( not ( = ?auto_790018 ?auto_790022 ) ) ( not ( = ?auto_790018 ?auto_790023 ) ) ( not ( = ?auto_790018 ?auto_790024 ) ) ( not ( = ?auto_790018 ?auto_790025 ) ) ( not ( = ?auto_790019 ?auto_790020 ) ) ( not ( = ?auto_790019 ?auto_790021 ) ) ( not ( = ?auto_790019 ?auto_790022 ) ) ( not ( = ?auto_790019 ?auto_790023 ) ) ( not ( = ?auto_790019 ?auto_790024 ) ) ( not ( = ?auto_790019 ?auto_790025 ) ) ( not ( = ?auto_790020 ?auto_790021 ) ) ( not ( = ?auto_790020 ?auto_790022 ) ) ( not ( = ?auto_790020 ?auto_790023 ) ) ( not ( = ?auto_790020 ?auto_790024 ) ) ( not ( = ?auto_790020 ?auto_790025 ) ) ( not ( = ?auto_790021 ?auto_790022 ) ) ( not ( = ?auto_790021 ?auto_790023 ) ) ( not ( = ?auto_790021 ?auto_790024 ) ) ( not ( = ?auto_790021 ?auto_790025 ) ) ( not ( = ?auto_790022 ?auto_790023 ) ) ( not ( = ?auto_790022 ?auto_790024 ) ) ( not ( = ?auto_790022 ?auto_790025 ) ) ( not ( = ?auto_790023 ?auto_790024 ) ) ( not ( = ?auto_790023 ?auto_790025 ) ) ( not ( = ?auto_790024 ?auto_790025 ) ) ( CLEAR ?auto_790022 ) ( ON ?auto_790023 ?auto_790024 ) ( CLEAR ?auto_790023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_790008 ?auto_790009 ?auto_790010 ?auto_790011 ?auto_790012 ?auto_790013 ?auto_790014 ?auto_790015 ?auto_790016 ?auto_790017 ?auto_790018 ?auto_790019 ?auto_790020 ?auto_790021 ?auto_790022 ?auto_790023 )
      ( MAKE-17PILE ?auto_790008 ?auto_790009 ?auto_790010 ?auto_790011 ?auto_790012 ?auto_790013 ?auto_790014 ?auto_790015 ?auto_790016 ?auto_790017 ?auto_790018 ?auto_790019 ?auto_790020 ?auto_790021 ?auto_790022 ?auto_790023 ?auto_790024 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790078 - BLOCK
      ?auto_790079 - BLOCK
      ?auto_790080 - BLOCK
      ?auto_790081 - BLOCK
      ?auto_790082 - BLOCK
      ?auto_790083 - BLOCK
      ?auto_790084 - BLOCK
      ?auto_790085 - BLOCK
      ?auto_790086 - BLOCK
      ?auto_790087 - BLOCK
      ?auto_790088 - BLOCK
      ?auto_790089 - BLOCK
      ?auto_790090 - BLOCK
      ?auto_790091 - BLOCK
      ?auto_790092 - BLOCK
      ?auto_790093 - BLOCK
      ?auto_790094 - BLOCK
    )
    :vars
    (
      ?auto_790095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790094 ?auto_790095 ) ( ON-TABLE ?auto_790078 ) ( ON ?auto_790079 ?auto_790078 ) ( ON ?auto_790080 ?auto_790079 ) ( ON ?auto_790081 ?auto_790080 ) ( ON ?auto_790082 ?auto_790081 ) ( ON ?auto_790083 ?auto_790082 ) ( ON ?auto_790084 ?auto_790083 ) ( ON ?auto_790085 ?auto_790084 ) ( ON ?auto_790086 ?auto_790085 ) ( ON ?auto_790087 ?auto_790086 ) ( ON ?auto_790088 ?auto_790087 ) ( ON ?auto_790089 ?auto_790088 ) ( ON ?auto_790090 ?auto_790089 ) ( ON ?auto_790091 ?auto_790090 ) ( not ( = ?auto_790078 ?auto_790079 ) ) ( not ( = ?auto_790078 ?auto_790080 ) ) ( not ( = ?auto_790078 ?auto_790081 ) ) ( not ( = ?auto_790078 ?auto_790082 ) ) ( not ( = ?auto_790078 ?auto_790083 ) ) ( not ( = ?auto_790078 ?auto_790084 ) ) ( not ( = ?auto_790078 ?auto_790085 ) ) ( not ( = ?auto_790078 ?auto_790086 ) ) ( not ( = ?auto_790078 ?auto_790087 ) ) ( not ( = ?auto_790078 ?auto_790088 ) ) ( not ( = ?auto_790078 ?auto_790089 ) ) ( not ( = ?auto_790078 ?auto_790090 ) ) ( not ( = ?auto_790078 ?auto_790091 ) ) ( not ( = ?auto_790078 ?auto_790092 ) ) ( not ( = ?auto_790078 ?auto_790093 ) ) ( not ( = ?auto_790078 ?auto_790094 ) ) ( not ( = ?auto_790078 ?auto_790095 ) ) ( not ( = ?auto_790079 ?auto_790080 ) ) ( not ( = ?auto_790079 ?auto_790081 ) ) ( not ( = ?auto_790079 ?auto_790082 ) ) ( not ( = ?auto_790079 ?auto_790083 ) ) ( not ( = ?auto_790079 ?auto_790084 ) ) ( not ( = ?auto_790079 ?auto_790085 ) ) ( not ( = ?auto_790079 ?auto_790086 ) ) ( not ( = ?auto_790079 ?auto_790087 ) ) ( not ( = ?auto_790079 ?auto_790088 ) ) ( not ( = ?auto_790079 ?auto_790089 ) ) ( not ( = ?auto_790079 ?auto_790090 ) ) ( not ( = ?auto_790079 ?auto_790091 ) ) ( not ( = ?auto_790079 ?auto_790092 ) ) ( not ( = ?auto_790079 ?auto_790093 ) ) ( not ( = ?auto_790079 ?auto_790094 ) ) ( not ( = ?auto_790079 ?auto_790095 ) ) ( not ( = ?auto_790080 ?auto_790081 ) ) ( not ( = ?auto_790080 ?auto_790082 ) ) ( not ( = ?auto_790080 ?auto_790083 ) ) ( not ( = ?auto_790080 ?auto_790084 ) ) ( not ( = ?auto_790080 ?auto_790085 ) ) ( not ( = ?auto_790080 ?auto_790086 ) ) ( not ( = ?auto_790080 ?auto_790087 ) ) ( not ( = ?auto_790080 ?auto_790088 ) ) ( not ( = ?auto_790080 ?auto_790089 ) ) ( not ( = ?auto_790080 ?auto_790090 ) ) ( not ( = ?auto_790080 ?auto_790091 ) ) ( not ( = ?auto_790080 ?auto_790092 ) ) ( not ( = ?auto_790080 ?auto_790093 ) ) ( not ( = ?auto_790080 ?auto_790094 ) ) ( not ( = ?auto_790080 ?auto_790095 ) ) ( not ( = ?auto_790081 ?auto_790082 ) ) ( not ( = ?auto_790081 ?auto_790083 ) ) ( not ( = ?auto_790081 ?auto_790084 ) ) ( not ( = ?auto_790081 ?auto_790085 ) ) ( not ( = ?auto_790081 ?auto_790086 ) ) ( not ( = ?auto_790081 ?auto_790087 ) ) ( not ( = ?auto_790081 ?auto_790088 ) ) ( not ( = ?auto_790081 ?auto_790089 ) ) ( not ( = ?auto_790081 ?auto_790090 ) ) ( not ( = ?auto_790081 ?auto_790091 ) ) ( not ( = ?auto_790081 ?auto_790092 ) ) ( not ( = ?auto_790081 ?auto_790093 ) ) ( not ( = ?auto_790081 ?auto_790094 ) ) ( not ( = ?auto_790081 ?auto_790095 ) ) ( not ( = ?auto_790082 ?auto_790083 ) ) ( not ( = ?auto_790082 ?auto_790084 ) ) ( not ( = ?auto_790082 ?auto_790085 ) ) ( not ( = ?auto_790082 ?auto_790086 ) ) ( not ( = ?auto_790082 ?auto_790087 ) ) ( not ( = ?auto_790082 ?auto_790088 ) ) ( not ( = ?auto_790082 ?auto_790089 ) ) ( not ( = ?auto_790082 ?auto_790090 ) ) ( not ( = ?auto_790082 ?auto_790091 ) ) ( not ( = ?auto_790082 ?auto_790092 ) ) ( not ( = ?auto_790082 ?auto_790093 ) ) ( not ( = ?auto_790082 ?auto_790094 ) ) ( not ( = ?auto_790082 ?auto_790095 ) ) ( not ( = ?auto_790083 ?auto_790084 ) ) ( not ( = ?auto_790083 ?auto_790085 ) ) ( not ( = ?auto_790083 ?auto_790086 ) ) ( not ( = ?auto_790083 ?auto_790087 ) ) ( not ( = ?auto_790083 ?auto_790088 ) ) ( not ( = ?auto_790083 ?auto_790089 ) ) ( not ( = ?auto_790083 ?auto_790090 ) ) ( not ( = ?auto_790083 ?auto_790091 ) ) ( not ( = ?auto_790083 ?auto_790092 ) ) ( not ( = ?auto_790083 ?auto_790093 ) ) ( not ( = ?auto_790083 ?auto_790094 ) ) ( not ( = ?auto_790083 ?auto_790095 ) ) ( not ( = ?auto_790084 ?auto_790085 ) ) ( not ( = ?auto_790084 ?auto_790086 ) ) ( not ( = ?auto_790084 ?auto_790087 ) ) ( not ( = ?auto_790084 ?auto_790088 ) ) ( not ( = ?auto_790084 ?auto_790089 ) ) ( not ( = ?auto_790084 ?auto_790090 ) ) ( not ( = ?auto_790084 ?auto_790091 ) ) ( not ( = ?auto_790084 ?auto_790092 ) ) ( not ( = ?auto_790084 ?auto_790093 ) ) ( not ( = ?auto_790084 ?auto_790094 ) ) ( not ( = ?auto_790084 ?auto_790095 ) ) ( not ( = ?auto_790085 ?auto_790086 ) ) ( not ( = ?auto_790085 ?auto_790087 ) ) ( not ( = ?auto_790085 ?auto_790088 ) ) ( not ( = ?auto_790085 ?auto_790089 ) ) ( not ( = ?auto_790085 ?auto_790090 ) ) ( not ( = ?auto_790085 ?auto_790091 ) ) ( not ( = ?auto_790085 ?auto_790092 ) ) ( not ( = ?auto_790085 ?auto_790093 ) ) ( not ( = ?auto_790085 ?auto_790094 ) ) ( not ( = ?auto_790085 ?auto_790095 ) ) ( not ( = ?auto_790086 ?auto_790087 ) ) ( not ( = ?auto_790086 ?auto_790088 ) ) ( not ( = ?auto_790086 ?auto_790089 ) ) ( not ( = ?auto_790086 ?auto_790090 ) ) ( not ( = ?auto_790086 ?auto_790091 ) ) ( not ( = ?auto_790086 ?auto_790092 ) ) ( not ( = ?auto_790086 ?auto_790093 ) ) ( not ( = ?auto_790086 ?auto_790094 ) ) ( not ( = ?auto_790086 ?auto_790095 ) ) ( not ( = ?auto_790087 ?auto_790088 ) ) ( not ( = ?auto_790087 ?auto_790089 ) ) ( not ( = ?auto_790087 ?auto_790090 ) ) ( not ( = ?auto_790087 ?auto_790091 ) ) ( not ( = ?auto_790087 ?auto_790092 ) ) ( not ( = ?auto_790087 ?auto_790093 ) ) ( not ( = ?auto_790087 ?auto_790094 ) ) ( not ( = ?auto_790087 ?auto_790095 ) ) ( not ( = ?auto_790088 ?auto_790089 ) ) ( not ( = ?auto_790088 ?auto_790090 ) ) ( not ( = ?auto_790088 ?auto_790091 ) ) ( not ( = ?auto_790088 ?auto_790092 ) ) ( not ( = ?auto_790088 ?auto_790093 ) ) ( not ( = ?auto_790088 ?auto_790094 ) ) ( not ( = ?auto_790088 ?auto_790095 ) ) ( not ( = ?auto_790089 ?auto_790090 ) ) ( not ( = ?auto_790089 ?auto_790091 ) ) ( not ( = ?auto_790089 ?auto_790092 ) ) ( not ( = ?auto_790089 ?auto_790093 ) ) ( not ( = ?auto_790089 ?auto_790094 ) ) ( not ( = ?auto_790089 ?auto_790095 ) ) ( not ( = ?auto_790090 ?auto_790091 ) ) ( not ( = ?auto_790090 ?auto_790092 ) ) ( not ( = ?auto_790090 ?auto_790093 ) ) ( not ( = ?auto_790090 ?auto_790094 ) ) ( not ( = ?auto_790090 ?auto_790095 ) ) ( not ( = ?auto_790091 ?auto_790092 ) ) ( not ( = ?auto_790091 ?auto_790093 ) ) ( not ( = ?auto_790091 ?auto_790094 ) ) ( not ( = ?auto_790091 ?auto_790095 ) ) ( not ( = ?auto_790092 ?auto_790093 ) ) ( not ( = ?auto_790092 ?auto_790094 ) ) ( not ( = ?auto_790092 ?auto_790095 ) ) ( not ( = ?auto_790093 ?auto_790094 ) ) ( not ( = ?auto_790093 ?auto_790095 ) ) ( not ( = ?auto_790094 ?auto_790095 ) ) ( ON ?auto_790093 ?auto_790094 ) ( CLEAR ?auto_790091 ) ( ON ?auto_790092 ?auto_790093 ) ( CLEAR ?auto_790092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_790078 ?auto_790079 ?auto_790080 ?auto_790081 ?auto_790082 ?auto_790083 ?auto_790084 ?auto_790085 ?auto_790086 ?auto_790087 ?auto_790088 ?auto_790089 ?auto_790090 ?auto_790091 ?auto_790092 )
      ( MAKE-17PILE ?auto_790078 ?auto_790079 ?auto_790080 ?auto_790081 ?auto_790082 ?auto_790083 ?auto_790084 ?auto_790085 ?auto_790086 ?auto_790087 ?auto_790088 ?auto_790089 ?auto_790090 ?auto_790091 ?auto_790092 ?auto_790093 ?auto_790094 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790148 - BLOCK
      ?auto_790149 - BLOCK
      ?auto_790150 - BLOCK
      ?auto_790151 - BLOCK
      ?auto_790152 - BLOCK
      ?auto_790153 - BLOCK
      ?auto_790154 - BLOCK
      ?auto_790155 - BLOCK
      ?auto_790156 - BLOCK
      ?auto_790157 - BLOCK
      ?auto_790158 - BLOCK
      ?auto_790159 - BLOCK
      ?auto_790160 - BLOCK
      ?auto_790161 - BLOCK
      ?auto_790162 - BLOCK
      ?auto_790163 - BLOCK
      ?auto_790164 - BLOCK
    )
    :vars
    (
      ?auto_790165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790164 ?auto_790165 ) ( ON-TABLE ?auto_790148 ) ( ON ?auto_790149 ?auto_790148 ) ( ON ?auto_790150 ?auto_790149 ) ( ON ?auto_790151 ?auto_790150 ) ( ON ?auto_790152 ?auto_790151 ) ( ON ?auto_790153 ?auto_790152 ) ( ON ?auto_790154 ?auto_790153 ) ( ON ?auto_790155 ?auto_790154 ) ( ON ?auto_790156 ?auto_790155 ) ( ON ?auto_790157 ?auto_790156 ) ( ON ?auto_790158 ?auto_790157 ) ( ON ?auto_790159 ?auto_790158 ) ( ON ?auto_790160 ?auto_790159 ) ( not ( = ?auto_790148 ?auto_790149 ) ) ( not ( = ?auto_790148 ?auto_790150 ) ) ( not ( = ?auto_790148 ?auto_790151 ) ) ( not ( = ?auto_790148 ?auto_790152 ) ) ( not ( = ?auto_790148 ?auto_790153 ) ) ( not ( = ?auto_790148 ?auto_790154 ) ) ( not ( = ?auto_790148 ?auto_790155 ) ) ( not ( = ?auto_790148 ?auto_790156 ) ) ( not ( = ?auto_790148 ?auto_790157 ) ) ( not ( = ?auto_790148 ?auto_790158 ) ) ( not ( = ?auto_790148 ?auto_790159 ) ) ( not ( = ?auto_790148 ?auto_790160 ) ) ( not ( = ?auto_790148 ?auto_790161 ) ) ( not ( = ?auto_790148 ?auto_790162 ) ) ( not ( = ?auto_790148 ?auto_790163 ) ) ( not ( = ?auto_790148 ?auto_790164 ) ) ( not ( = ?auto_790148 ?auto_790165 ) ) ( not ( = ?auto_790149 ?auto_790150 ) ) ( not ( = ?auto_790149 ?auto_790151 ) ) ( not ( = ?auto_790149 ?auto_790152 ) ) ( not ( = ?auto_790149 ?auto_790153 ) ) ( not ( = ?auto_790149 ?auto_790154 ) ) ( not ( = ?auto_790149 ?auto_790155 ) ) ( not ( = ?auto_790149 ?auto_790156 ) ) ( not ( = ?auto_790149 ?auto_790157 ) ) ( not ( = ?auto_790149 ?auto_790158 ) ) ( not ( = ?auto_790149 ?auto_790159 ) ) ( not ( = ?auto_790149 ?auto_790160 ) ) ( not ( = ?auto_790149 ?auto_790161 ) ) ( not ( = ?auto_790149 ?auto_790162 ) ) ( not ( = ?auto_790149 ?auto_790163 ) ) ( not ( = ?auto_790149 ?auto_790164 ) ) ( not ( = ?auto_790149 ?auto_790165 ) ) ( not ( = ?auto_790150 ?auto_790151 ) ) ( not ( = ?auto_790150 ?auto_790152 ) ) ( not ( = ?auto_790150 ?auto_790153 ) ) ( not ( = ?auto_790150 ?auto_790154 ) ) ( not ( = ?auto_790150 ?auto_790155 ) ) ( not ( = ?auto_790150 ?auto_790156 ) ) ( not ( = ?auto_790150 ?auto_790157 ) ) ( not ( = ?auto_790150 ?auto_790158 ) ) ( not ( = ?auto_790150 ?auto_790159 ) ) ( not ( = ?auto_790150 ?auto_790160 ) ) ( not ( = ?auto_790150 ?auto_790161 ) ) ( not ( = ?auto_790150 ?auto_790162 ) ) ( not ( = ?auto_790150 ?auto_790163 ) ) ( not ( = ?auto_790150 ?auto_790164 ) ) ( not ( = ?auto_790150 ?auto_790165 ) ) ( not ( = ?auto_790151 ?auto_790152 ) ) ( not ( = ?auto_790151 ?auto_790153 ) ) ( not ( = ?auto_790151 ?auto_790154 ) ) ( not ( = ?auto_790151 ?auto_790155 ) ) ( not ( = ?auto_790151 ?auto_790156 ) ) ( not ( = ?auto_790151 ?auto_790157 ) ) ( not ( = ?auto_790151 ?auto_790158 ) ) ( not ( = ?auto_790151 ?auto_790159 ) ) ( not ( = ?auto_790151 ?auto_790160 ) ) ( not ( = ?auto_790151 ?auto_790161 ) ) ( not ( = ?auto_790151 ?auto_790162 ) ) ( not ( = ?auto_790151 ?auto_790163 ) ) ( not ( = ?auto_790151 ?auto_790164 ) ) ( not ( = ?auto_790151 ?auto_790165 ) ) ( not ( = ?auto_790152 ?auto_790153 ) ) ( not ( = ?auto_790152 ?auto_790154 ) ) ( not ( = ?auto_790152 ?auto_790155 ) ) ( not ( = ?auto_790152 ?auto_790156 ) ) ( not ( = ?auto_790152 ?auto_790157 ) ) ( not ( = ?auto_790152 ?auto_790158 ) ) ( not ( = ?auto_790152 ?auto_790159 ) ) ( not ( = ?auto_790152 ?auto_790160 ) ) ( not ( = ?auto_790152 ?auto_790161 ) ) ( not ( = ?auto_790152 ?auto_790162 ) ) ( not ( = ?auto_790152 ?auto_790163 ) ) ( not ( = ?auto_790152 ?auto_790164 ) ) ( not ( = ?auto_790152 ?auto_790165 ) ) ( not ( = ?auto_790153 ?auto_790154 ) ) ( not ( = ?auto_790153 ?auto_790155 ) ) ( not ( = ?auto_790153 ?auto_790156 ) ) ( not ( = ?auto_790153 ?auto_790157 ) ) ( not ( = ?auto_790153 ?auto_790158 ) ) ( not ( = ?auto_790153 ?auto_790159 ) ) ( not ( = ?auto_790153 ?auto_790160 ) ) ( not ( = ?auto_790153 ?auto_790161 ) ) ( not ( = ?auto_790153 ?auto_790162 ) ) ( not ( = ?auto_790153 ?auto_790163 ) ) ( not ( = ?auto_790153 ?auto_790164 ) ) ( not ( = ?auto_790153 ?auto_790165 ) ) ( not ( = ?auto_790154 ?auto_790155 ) ) ( not ( = ?auto_790154 ?auto_790156 ) ) ( not ( = ?auto_790154 ?auto_790157 ) ) ( not ( = ?auto_790154 ?auto_790158 ) ) ( not ( = ?auto_790154 ?auto_790159 ) ) ( not ( = ?auto_790154 ?auto_790160 ) ) ( not ( = ?auto_790154 ?auto_790161 ) ) ( not ( = ?auto_790154 ?auto_790162 ) ) ( not ( = ?auto_790154 ?auto_790163 ) ) ( not ( = ?auto_790154 ?auto_790164 ) ) ( not ( = ?auto_790154 ?auto_790165 ) ) ( not ( = ?auto_790155 ?auto_790156 ) ) ( not ( = ?auto_790155 ?auto_790157 ) ) ( not ( = ?auto_790155 ?auto_790158 ) ) ( not ( = ?auto_790155 ?auto_790159 ) ) ( not ( = ?auto_790155 ?auto_790160 ) ) ( not ( = ?auto_790155 ?auto_790161 ) ) ( not ( = ?auto_790155 ?auto_790162 ) ) ( not ( = ?auto_790155 ?auto_790163 ) ) ( not ( = ?auto_790155 ?auto_790164 ) ) ( not ( = ?auto_790155 ?auto_790165 ) ) ( not ( = ?auto_790156 ?auto_790157 ) ) ( not ( = ?auto_790156 ?auto_790158 ) ) ( not ( = ?auto_790156 ?auto_790159 ) ) ( not ( = ?auto_790156 ?auto_790160 ) ) ( not ( = ?auto_790156 ?auto_790161 ) ) ( not ( = ?auto_790156 ?auto_790162 ) ) ( not ( = ?auto_790156 ?auto_790163 ) ) ( not ( = ?auto_790156 ?auto_790164 ) ) ( not ( = ?auto_790156 ?auto_790165 ) ) ( not ( = ?auto_790157 ?auto_790158 ) ) ( not ( = ?auto_790157 ?auto_790159 ) ) ( not ( = ?auto_790157 ?auto_790160 ) ) ( not ( = ?auto_790157 ?auto_790161 ) ) ( not ( = ?auto_790157 ?auto_790162 ) ) ( not ( = ?auto_790157 ?auto_790163 ) ) ( not ( = ?auto_790157 ?auto_790164 ) ) ( not ( = ?auto_790157 ?auto_790165 ) ) ( not ( = ?auto_790158 ?auto_790159 ) ) ( not ( = ?auto_790158 ?auto_790160 ) ) ( not ( = ?auto_790158 ?auto_790161 ) ) ( not ( = ?auto_790158 ?auto_790162 ) ) ( not ( = ?auto_790158 ?auto_790163 ) ) ( not ( = ?auto_790158 ?auto_790164 ) ) ( not ( = ?auto_790158 ?auto_790165 ) ) ( not ( = ?auto_790159 ?auto_790160 ) ) ( not ( = ?auto_790159 ?auto_790161 ) ) ( not ( = ?auto_790159 ?auto_790162 ) ) ( not ( = ?auto_790159 ?auto_790163 ) ) ( not ( = ?auto_790159 ?auto_790164 ) ) ( not ( = ?auto_790159 ?auto_790165 ) ) ( not ( = ?auto_790160 ?auto_790161 ) ) ( not ( = ?auto_790160 ?auto_790162 ) ) ( not ( = ?auto_790160 ?auto_790163 ) ) ( not ( = ?auto_790160 ?auto_790164 ) ) ( not ( = ?auto_790160 ?auto_790165 ) ) ( not ( = ?auto_790161 ?auto_790162 ) ) ( not ( = ?auto_790161 ?auto_790163 ) ) ( not ( = ?auto_790161 ?auto_790164 ) ) ( not ( = ?auto_790161 ?auto_790165 ) ) ( not ( = ?auto_790162 ?auto_790163 ) ) ( not ( = ?auto_790162 ?auto_790164 ) ) ( not ( = ?auto_790162 ?auto_790165 ) ) ( not ( = ?auto_790163 ?auto_790164 ) ) ( not ( = ?auto_790163 ?auto_790165 ) ) ( not ( = ?auto_790164 ?auto_790165 ) ) ( ON ?auto_790163 ?auto_790164 ) ( ON ?auto_790162 ?auto_790163 ) ( CLEAR ?auto_790160 ) ( ON ?auto_790161 ?auto_790162 ) ( CLEAR ?auto_790161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_790148 ?auto_790149 ?auto_790150 ?auto_790151 ?auto_790152 ?auto_790153 ?auto_790154 ?auto_790155 ?auto_790156 ?auto_790157 ?auto_790158 ?auto_790159 ?auto_790160 ?auto_790161 )
      ( MAKE-17PILE ?auto_790148 ?auto_790149 ?auto_790150 ?auto_790151 ?auto_790152 ?auto_790153 ?auto_790154 ?auto_790155 ?auto_790156 ?auto_790157 ?auto_790158 ?auto_790159 ?auto_790160 ?auto_790161 ?auto_790162 ?auto_790163 ?auto_790164 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790218 - BLOCK
      ?auto_790219 - BLOCK
      ?auto_790220 - BLOCK
      ?auto_790221 - BLOCK
      ?auto_790222 - BLOCK
      ?auto_790223 - BLOCK
      ?auto_790224 - BLOCK
      ?auto_790225 - BLOCK
      ?auto_790226 - BLOCK
      ?auto_790227 - BLOCK
      ?auto_790228 - BLOCK
      ?auto_790229 - BLOCK
      ?auto_790230 - BLOCK
      ?auto_790231 - BLOCK
      ?auto_790232 - BLOCK
      ?auto_790233 - BLOCK
      ?auto_790234 - BLOCK
    )
    :vars
    (
      ?auto_790235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790234 ?auto_790235 ) ( ON-TABLE ?auto_790218 ) ( ON ?auto_790219 ?auto_790218 ) ( ON ?auto_790220 ?auto_790219 ) ( ON ?auto_790221 ?auto_790220 ) ( ON ?auto_790222 ?auto_790221 ) ( ON ?auto_790223 ?auto_790222 ) ( ON ?auto_790224 ?auto_790223 ) ( ON ?auto_790225 ?auto_790224 ) ( ON ?auto_790226 ?auto_790225 ) ( ON ?auto_790227 ?auto_790226 ) ( ON ?auto_790228 ?auto_790227 ) ( ON ?auto_790229 ?auto_790228 ) ( not ( = ?auto_790218 ?auto_790219 ) ) ( not ( = ?auto_790218 ?auto_790220 ) ) ( not ( = ?auto_790218 ?auto_790221 ) ) ( not ( = ?auto_790218 ?auto_790222 ) ) ( not ( = ?auto_790218 ?auto_790223 ) ) ( not ( = ?auto_790218 ?auto_790224 ) ) ( not ( = ?auto_790218 ?auto_790225 ) ) ( not ( = ?auto_790218 ?auto_790226 ) ) ( not ( = ?auto_790218 ?auto_790227 ) ) ( not ( = ?auto_790218 ?auto_790228 ) ) ( not ( = ?auto_790218 ?auto_790229 ) ) ( not ( = ?auto_790218 ?auto_790230 ) ) ( not ( = ?auto_790218 ?auto_790231 ) ) ( not ( = ?auto_790218 ?auto_790232 ) ) ( not ( = ?auto_790218 ?auto_790233 ) ) ( not ( = ?auto_790218 ?auto_790234 ) ) ( not ( = ?auto_790218 ?auto_790235 ) ) ( not ( = ?auto_790219 ?auto_790220 ) ) ( not ( = ?auto_790219 ?auto_790221 ) ) ( not ( = ?auto_790219 ?auto_790222 ) ) ( not ( = ?auto_790219 ?auto_790223 ) ) ( not ( = ?auto_790219 ?auto_790224 ) ) ( not ( = ?auto_790219 ?auto_790225 ) ) ( not ( = ?auto_790219 ?auto_790226 ) ) ( not ( = ?auto_790219 ?auto_790227 ) ) ( not ( = ?auto_790219 ?auto_790228 ) ) ( not ( = ?auto_790219 ?auto_790229 ) ) ( not ( = ?auto_790219 ?auto_790230 ) ) ( not ( = ?auto_790219 ?auto_790231 ) ) ( not ( = ?auto_790219 ?auto_790232 ) ) ( not ( = ?auto_790219 ?auto_790233 ) ) ( not ( = ?auto_790219 ?auto_790234 ) ) ( not ( = ?auto_790219 ?auto_790235 ) ) ( not ( = ?auto_790220 ?auto_790221 ) ) ( not ( = ?auto_790220 ?auto_790222 ) ) ( not ( = ?auto_790220 ?auto_790223 ) ) ( not ( = ?auto_790220 ?auto_790224 ) ) ( not ( = ?auto_790220 ?auto_790225 ) ) ( not ( = ?auto_790220 ?auto_790226 ) ) ( not ( = ?auto_790220 ?auto_790227 ) ) ( not ( = ?auto_790220 ?auto_790228 ) ) ( not ( = ?auto_790220 ?auto_790229 ) ) ( not ( = ?auto_790220 ?auto_790230 ) ) ( not ( = ?auto_790220 ?auto_790231 ) ) ( not ( = ?auto_790220 ?auto_790232 ) ) ( not ( = ?auto_790220 ?auto_790233 ) ) ( not ( = ?auto_790220 ?auto_790234 ) ) ( not ( = ?auto_790220 ?auto_790235 ) ) ( not ( = ?auto_790221 ?auto_790222 ) ) ( not ( = ?auto_790221 ?auto_790223 ) ) ( not ( = ?auto_790221 ?auto_790224 ) ) ( not ( = ?auto_790221 ?auto_790225 ) ) ( not ( = ?auto_790221 ?auto_790226 ) ) ( not ( = ?auto_790221 ?auto_790227 ) ) ( not ( = ?auto_790221 ?auto_790228 ) ) ( not ( = ?auto_790221 ?auto_790229 ) ) ( not ( = ?auto_790221 ?auto_790230 ) ) ( not ( = ?auto_790221 ?auto_790231 ) ) ( not ( = ?auto_790221 ?auto_790232 ) ) ( not ( = ?auto_790221 ?auto_790233 ) ) ( not ( = ?auto_790221 ?auto_790234 ) ) ( not ( = ?auto_790221 ?auto_790235 ) ) ( not ( = ?auto_790222 ?auto_790223 ) ) ( not ( = ?auto_790222 ?auto_790224 ) ) ( not ( = ?auto_790222 ?auto_790225 ) ) ( not ( = ?auto_790222 ?auto_790226 ) ) ( not ( = ?auto_790222 ?auto_790227 ) ) ( not ( = ?auto_790222 ?auto_790228 ) ) ( not ( = ?auto_790222 ?auto_790229 ) ) ( not ( = ?auto_790222 ?auto_790230 ) ) ( not ( = ?auto_790222 ?auto_790231 ) ) ( not ( = ?auto_790222 ?auto_790232 ) ) ( not ( = ?auto_790222 ?auto_790233 ) ) ( not ( = ?auto_790222 ?auto_790234 ) ) ( not ( = ?auto_790222 ?auto_790235 ) ) ( not ( = ?auto_790223 ?auto_790224 ) ) ( not ( = ?auto_790223 ?auto_790225 ) ) ( not ( = ?auto_790223 ?auto_790226 ) ) ( not ( = ?auto_790223 ?auto_790227 ) ) ( not ( = ?auto_790223 ?auto_790228 ) ) ( not ( = ?auto_790223 ?auto_790229 ) ) ( not ( = ?auto_790223 ?auto_790230 ) ) ( not ( = ?auto_790223 ?auto_790231 ) ) ( not ( = ?auto_790223 ?auto_790232 ) ) ( not ( = ?auto_790223 ?auto_790233 ) ) ( not ( = ?auto_790223 ?auto_790234 ) ) ( not ( = ?auto_790223 ?auto_790235 ) ) ( not ( = ?auto_790224 ?auto_790225 ) ) ( not ( = ?auto_790224 ?auto_790226 ) ) ( not ( = ?auto_790224 ?auto_790227 ) ) ( not ( = ?auto_790224 ?auto_790228 ) ) ( not ( = ?auto_790224 ?auto_790229 ) ) ( not ( = ?auto_790224 ?auto_790230 ) ) ( not ( = ?auto_790224 ?auto_790231 ) ) ( not ( = ?auto_790224 ?auto_790232 ) ) ( not ( = ?auto_790224 ?auto_790233 ) ) ( not ( = ?auto_790224 ?auto_790234 ) ) ( not ( = ?auto_790224 ?auto_790235 ) ) ( not ( = ?auto_790225 ?auto_790226 ) ) ( not ( = ?auto_790225 ?auto_790227 ) ) ( not ( = ?auto_790225 ?auto_790228 ) ) ( not ( = ?auto_790225 ?auto_790229 ) ) ( not ( = ?auto_790225 ?auto_790230 ) ) ( not ( = ?auto_790225 ?auto_790231 ) ) ( not ( = ?auto_790225 ?auto_790232 ) ) ( not ( = ?auto_790225 ?auto_790233 ) ) ( not ( = ?auto_790225 ?auto_790234 ) ) ( not ( = ?auto_790225 ?auto_790235 ) ) ( not ( = ?auto_790226 ?auto_790227 ) ) ( not ( = ?auto_790226 ?auto_790228 ) ) ( not ( = ?auto_790226 ?auto_790229 ) ) ( not ( = ?auto_790226 ?auto_790230 ) ) ( not ( = ?auto_790226 ?auto_790231 ) ) ( not ( = ?auto_790226 ?auto_790232 ) ) ( not ( = ?auto_790226 ?auto_790233 ) ) ( not ( = ?auto_790226 ?auto_790234 ) ) ( not ( = ?auto_790226 ?auto_790235 ) ) ( not ( = ?auto_790227 ?auto_790228 ) ) ( not ( = ?auto_790227 ?auto_790229 ) ) ( not ( = ?auto_790227 ?auto_790230 ) ) ( not ( = ?auto_790227 ?auto_790231 ) ) ( not ( = ?auto_790227 ?auto_790232 ) ) ( not ( = ?auto_790227 ?auto_790233 ) ) ( not ( = ?auto_790227 ?auto_790234 ) ) ( not ( = ?auto_790227 ?auto_790235 ) ) ( not ( = ?auto_790228 ?auto_790229 ) ) ( not ( = ?auto_790228 ?auto_790230 ) ) ( not ( = ?auto_790228 ?auto_790231 ) ) ( not ( = ?auto_790228 ?auto_790232 ) ) ( not ( = ?auto_790228 ?auto_790233 ) ) ( not ( = ?auto_790228 ?auto_790234 ) ) ( not ( = ?auto_790228 ?auto_790235 ) ) ( not ( = ?auto_790229 ?auto_790230 ) ) ( not ( = ?auto_790229 ?auto_790231 ) ) ( not ( = ?auto_790229 ?auto_790232 ) ) ( not ( = ?auto_790229 ?auto_790233 ) ) ( not ( = ?auto_790229 ?auto_790234 ) ) ( not ( = ?auto_790229 ?auto_790235 ) ) ( not ( = ?auto_790230 ?auto_790231 ) ) ( not ( = ?auto_790230 ?auto_790232 ) ) ( not ( = ?auto_790230 ?auto_790233 ) ) ( not ( = ?auto_790230 ?auto_790234 ) ) ( not ( = ?auto_790230 ?auto_790235 ) ) ( not ( = ?auto_790231 ?auto_790232 ) ) ( not ( = ?auto_790231 ?auto_790233 ) ) ( not ( = ?auto_790231 ?auto_790234 ) ) ( not ( = ?auto_790231 ?auto_790235 ) ) ( not ( = ?auto_790232 ?auto_790233 ) ) ( not ( = ?auto_790232 ?auto_790234 ) ) ( not ( = ?auto_790232 ?auto_790235 ) ) ( not ( = ?auto_790233 ?auto_790234 ) ) ( not ( = ?auto_790233 ?auto_790235 ) ) ( not ( = ?auto_790234 ?auto_790235 ) ) ( ON ?auto_790233 ?auto_790234 ) ( ON ?auto_790232 ?auto_790233 ) ( ON ?auto_790231 ?auto_790232 ) ( CLEAR ?auto_790229 ) ( ON ?auto_790230 ?auto_790231 ) ( CLEAR ?auto_790230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_790218 ?auto_790219 ?auto_790220 ?auto_790221 ?auto_790222 ?auto_790223 ?auto_790224 ?auto_790225 ?auto_790226 ?auto_790227 ?auto_790228 ?auto_790229 ?auto_790230 )
      ( MAKE-17PILE ?auto_790218 ?auto_790219 ?auto_790220 ?auto_790221 ?auto_790222 ?auto_790223 ?auto_790224 ?auto_790225 ?auto_790226 ?auto_790227 ?auto_790228 ?auto_790229 ?auto_790230 ?auto_790231 ?auto_790232 ?auto_790233 ?auto_790234 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790288 - BLOCK
      ?auto_790289 - BLOCK
      ?auto_790290 - BLOCK
      ?auto_790291 - BLOCK
      ?auto_790292 - BLOCK
      ?auto_790293 - BLOCK
      ?auto_790294 - BLOCK
      ?auto_790295 - BLOCK
      ?auto_790296 - BLOCK
      ?auto_790297 - BLOCK
      ?auto_790298 - BLOCK
      ?auto_790299 - BLOCK
      ?auto_790300 - BLOCK
      ?auto_790301 - BLOCK
      ?auto_790302 - BLOCK
      ?auto_790303 - BLOCK
      ?auto_790304 - BLOCK
    )
    :vars
    (
      ?auto_790305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790304 ?auto_790305 ) ( ON-TABLE ?auto_790288 ) ( ON ?auto_790289 ?auto_790288 ) ( ON ?auto_790290 ?auto_790289 ) ( ON ?auto_790291 ?auto_790290 ) ( ON ?auto_790292 ?auto_790291 ) ( ON ?auto_790293 ?auto_790292 ) ( ON ?auto_790294 ?auto_790293 ) ( ON ?auto_790295 ?auto_790294 ) ( ON ?auto_790296 ?auto_790295 ) ( ON ?auto_790297 ?auto_790296 ) ( ON ?auto_790298 ?auto_790297 ) ( not ( = ?auto_790288 ?auto_790289 ) ) ( not ( = ?auto_790288 ?auto_790290 ) ) ( not ( = ?auto_790288 ?auto_790291 ) ) ( not ( = ?auto_790288 ?auto_790292 ) ) ( not ( = ?auto_790288 ?auto_790293 ) ) ( not ( = ?auto_790288 ?auto_790294 ) ) ( not ( = ?auto_790288 ?auto_790295 ) ) ( not ( = ?auto_790288 ?auto_790296 ) ) ( not ( = ?auto_790288 ?auto_790297 ) ) ( not ( = ?auto_790288 ?auto_790298 ) ) ( not ( = ?auto_790288 ?auto_790299 ) ) ( not ( = ?auto_790288 ?auto_790300 ) ) ( not ( = ?auto_790288 ?auto_790301 ) ) ( not ( = ?auto_790288 ?auto_790302 ) ) ( not ( = ?auto_790288 ?auto_790303 ) ) ( not ( = ?auto_790288 ?auto_790304 ) ) ( not ( = ?auto_790288 ?auto_790305 ) ) ( not ( = ?auto_790289 ?auto_790290 ) ) ( not ( = ?auto_790289 ?auto_790291 ) ) ( not ( = ?auto_790289 ?auto_790292 ) ) ( not ( = ?auto_790289 ?auto_790293 ) ) ( not ( = ?auto_790289 ?auto_790294 ) ) ( not ( = ?auto_790289 ?auto_790295 ) ) ( not ( = ?auto_790289 ?auto_790296 ) ) ( not ( = ?auto_790289 ?auto_790297 ) ) ( not ( = ?auto_790289 ?auto_790298 ) ) ( not ( = ?auto_790289 ?auto_790299 ) ) ( not ( = ?auto_790289 ?auto_790300 ) ) ( not ( = ?auto_790289 ?auto_790301 ) ) ( not ( = ?auto_790289 ?auto_790302 ) ) ( not ( = ?auto_790289 ?auto_790303 ) ) ( not ( = ?auto_790289 ?auto_790304 ) ) ( not ( = ?auto_790289 ?auto_790305 ) ) ( not ( = ?auto_790290 ?auto_790291 ) ) ( not ( = ?auto_790290 ?auto_790292 ) ) ( not ( = ?auto_790290 ?auto_790293 ) ) ( not ( = ?auto_790290 ?auto_790294 ) ) ( not ( = ?auto_790290 ?auto_790295 ) ) ( not ( = ?auto_790290 ?auto_790296 ) ) ( not ( = ?auto_790290 ?auto_790297 ) ) ( not ( = ?auto_790290 ?auto_790298 ) ) ( not ( = ?auto_790290 ?auto_790299 ) ) ( not ( = ?auto_790290 ?auto_790300 ) ) ( not ( = ?auto_790290 ?auto_790301 ) ) ( not ( = ?auto_790290 ?auto_790302 ) ) ( not ( = ?auto_790290 ?auto_790303 ) ) ( not ( = ?auto_790290 ?auto_790304 ) ) ( not ( = ?auto_790290 ?auto_790305 ) ) ( not ( = ?auto_790291 ?auto_790292 ) ) ( not ( = ?auto_790291 ?auto_790293 ) ) ( not ( = ?auto_790291 ?auto_790294 ) ) ( not ( = ?auto_790291 ?auto_790295 ) ) ( not ( = ?auto_790291 ?auto_790296 ) ) ( not ( = ?auto_790291 ?auto_790297 ) ) ( not ( = ?auto_790291 ?auto_790298 ) ) ( not ( = ?auto_790291 ?auto_790299 ) ) ( not ( = ?auto_790291 ?auto_790300 ) ) ( not ( = ?auto_790291 ?auto_790301 ) ) ( not ( = ?auto_790291 ?auto_790302 ) ) ( not ( = ?auto_790291 ?auto_790303 ) ) ( not ( = ?auto_790291 ?auto_790304 ) ) ( not ( = ?auto_790291 ?auto_790305 ) ) ( not ( = ?auto_790292 ?auto_790293 ) ) ( not ( = ?auto_790292 ?auto_790294 ) ) ( not ( = ?auto_790292 ?auto_790295 ) ) ( not ( = ?auto_790292 ?auto_790296 ) ) ( not ( = ?auto_790292 ?auto_790297 ) ) ( not ( = ?auto_790292 ?auto_790298 ) ) ( not ( = ?auto_790292 ?auto_790299 ) ) ( not ( = ?auto_790292 ?auto_790300 ) ) ( not ( = ?auto_790292 ?auto_790301 ) ) ( not ( = ?auto_790292 ?auto_790302 ) ) ( not ( = ?auto_790292 ?auto_790303 ) ) ( not ( = ?auto_790292 ?auto_790304 ) ) ( not ( = ?auto_790292 ?auto_790305 ) ) ( not ( = ?auto_790293 ?auto_790294 ) ) ( not ( = ?auto_790293 ?auto_790295 ) ) ( not ( = ?auto_790293 ?auto_790296 ) ) ( not ( = ?auto_790293 ?auto_790297 ) ) ( not ( = ?auto_790293 ?auto_790298 ) ) ( not ( = ?auto_790293 ?auto_790299 ) ) ( not ( = ?auto_790293 ?auto_790300 ) ) ( not ( = ?auto_790293 ?auto_790301 ) ) ( not ( = ?auto_790293 ?auto_790302 ) ) ( not ( = ?auto_790293 ?auto_790303 ) ) ( not ( = ?auto_790293 ?auto_790304 ) ) ( not ( = ?auto_790293 ?auto_790305 ) ) ( not ( = ?auto_790294 ?auto_790295 ) ) ( not ( = ?auto_790294 ?auto_790296 ) ) ( not ( = ?auto_790294 ?auto_790297 ) ) ( not ( = ?auto_790294 ?auto_790298 ) ) ( not ( = ?auto_790294 ?auto_790299 ) ) ( not ( = ?auto_790294 ?auto_790300 ) ) ( not ( = ?auto_790294 ?auto_790301 ) ) ( not ( = ?auto_790294 ?auto_790302 ) ) ( not ( = ?auto_790294 ?auto_790303 ) ) ( not ( = ?auto_790294 ?auto_790304 ) ) ( not ( = ?auto_790294 ?auto_790305 ) ) ( not ( = ?auto_790295 ?auto_790296 ) ) ( not ( = ?auto_790295 ?auto_790297 ) ) ( not ( = ?auto_790295 ?auto_790298 ) ) ( not ( = ?auto_790295 ?auto_790299 ) ) ( not ( = ?auto_790295 ?auto_790300 ) ) ( not ( = ?auto_790295 ?auto_790301 ) ) ( not ( = ?auto_790295 ?auto_790302 ) ) ( not ( = ?auto_790295 ?auto_790303 ) ) ( not ( = ?auto_790295 ?auto_790304 ) ) ( not ( = ?auto_790295 ?auto_790305 ) ) ( not ( = ?auto_790296 ?auto_790297 ) ) ( not ( = ?auto_790296 ?auto_790298 ) ) ( not ( = ?auto_790296 ?auto_790299 ) ) ( not ( = ?auto_790296 ?auto_790300 ) ) ( not ( = ?auto_790296 ?auto_790301 ) ) ( not ( = ?auto_790296 ?auto_790302 ) ) ( not ( = ?auto_790296 ?auto_790303 ) ) ( not ( = ?auto_790296 ?auto_790304 ) ) ( not ( = ?auto_790296 ?auto_790305 ) ) ( not ( = ?auto_790297 ?auto_790298 ) ) ( not ( = ?auto_790297 ?auto_790299 ) ) ( not ( = ?auto_790297 ?auto_790300 ) ) ( not ( = ?auto_790297 ?auto_790301 ) ) ( not ( = ?auto_790297 ?auto_790302 ) ) ( not ( = ?auto_790297 ?auto_790303 ) ) ( not ( = ?auto_790297 ?auto_790304 ) ) ( not ( = ?auto_790297 ?auto_790305 ) ) ( not ( = ?auto_790298 ?auto_790299 ) ) ( not ( = ?auto_790298 ?auto_790300 ) ) ( not ( = ?auto_790298 ?auto_790301 ) ) ( not ( = ?auto_790298 ?auto_790302 ) ) ( not ( = ?auto_790298 ?auto_790303 ) ) ( not ( = ?auto_790298 ?auto_790304 ) ) ( not ( = ?auto_790298 ?auto_790305 ) ) ( not ( = ?auto_790299 ?auto_790300 ) ) ( not ( = ?auto_790299 ?auto_790301 ) ) ( not ( = ?auto_790299 ?auto_790302 ) ) ( not ( = ?auto_790299 ?auto_790303 ) ) ( not ( = ?auto_790299 ?auto_790304 ) ) ( not ( = ?auto_790299 ?auto_790305 ) ) ( not ( = ?auto_790300 ?auto_790301 ) ) ( not ( = ?auto_790300 ?auto_790302 ) ) ( not ( = ?auto_790300 ?auto_790303 ) ) ( not ( = ?auto_790300 ?auto_790304 ) ) ( not ( = ?auto_790300 ?auto_790305 ) ) ( not ( = ?auto_790301 ?auto_790302 ) ) ( not ( = ?auto_790301 ?auto_790303 ) ) ( not ( = ?auto_790301 ?auto_790304 ) ) ( not ( = ?auto_790301 ?auto_790305 ) ) ( not ( = ?auto_790302 ?auto_790303 ) ) ( not ( = ?auto_790302 ?auto_790304 ) ) ( not ( = ?auto_790302 ?auto_790305 ) ) ( not ( = ?auto_790303 ?auto_790304 ) ) ( not ( = ?auto_790303 ?auto_790305 ) ) ( not ( = ?auto_790304 ?auto_790305 ) ) ( ON ?auto_790303 ?auto_790304 ) ( ON ?auto_790302 ?auto_790303 ) ( ON ?auto_790301 ?auto_790302 ) ( ON ?auto_790300 ?auto_790301 ) ( CLEAR ?auto_790298 ) ( ON ?auto_790299 ?auto_790300 ) ( CLEAR ?auto_790299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_790288 ?auto_790289 ?auto_790290 ?auto_790291 ?auto_790292 ?auto_790293 ?auto_790294 ?auto_790295 ?auto_790296 ?auto_790297 ?auto_790298 ?auto_790299 )
      ( MAKE-17PILE ?auto_790288 ?auto_790289 ?auto_790290 ?auto_790291 ?auto_790292 ?auto_790293 ?auto_790294 ?auto_790295 ?auto_790296 ?auto_790297 ?auto_790298 ?auto_790299 ?auto_790300 ?auto_790301 ?auto_790302 ?auto_790303 ?auto_790304 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790358 - BLOCK
      ?auto_790359 - BLOCK
      ?auto_790360 - BLOCK
      ?auto_790361 - BLOCK
      ?auto_790362 - BLOCK
      ?auto_790363 - BLOCK
      ?auto_790364 - BLOCK
      ?auto_790365 - BLOCK
      ?auto_790366 - BLOCK
      ?auto_790367 - BLOCK
      ?auto_790368 - BLOCK
      ?auto_790369 - BLOCK
      ?auto_790370 - BLOCK
      ?auto_790371 - BLOCK
      ?auto_790372 - BLOCK
      ?auto_790373 - BLOCK
      ?auto_790374 - BLOCK
    )
    :vars
    (
      ?auto_790375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790374 ?auto_790375 ) ( ON-TABLE ?auto_790358 ) ( ON ?auto_790359 ?auto_790358 ) ( ON ?auto_790360 ?auto_790359 ) ( ON ?auto_790361 ?auto_790360 ) ( ON ?auto_790362 ?auto_790361 ) ( ON ?auto_790363 ?auto_790362 ) ( ON ?auto_790364 ?auto_790363 ) ( ON ?auto_790365 ?auto_790364 ) ( ON ?auto_790366 ?auto_790365 ) ( ON ?auto_790367 ?auto_790366 ) ( not ( = ?auto_790358 ?auto_790359 ) ) ( not ( = ?auto_790358 ?auto_790360 ) ) ( not ( = ?auto_790358 ?auto_790361 ) ) ( not ( = ?auto_790358 ?auto_790362 ) ) ( not ( = ?auto_790358 ?auto_790363 ) ) ( not ( = ?auto_790358 ?auto_790364 ) ) ( not ( = ?auto_790358 ?auto_790365 ) ) ( not ( = ?auto_790358 ?auto_790366 ) ) ( not ( = ?auto_790358 ?auto_790367 ) ) ( not ( = ?auto_790358 ?auto_790368 ) ) ( not ( = ?auto_790358 ?auto_790369 ) ) ( not ( = ?auto_790358 ?auto_790370 ) ) ( not ( = ?auto_790358 ?auto_790371 ) ) ( not ( = ?auto_790358 ?auto_790372 ) ) ( not ( = ?auto_790358 ?auto_790373 ) ) ( not ( = ?auto_790358 ?auto_790374 ) ) ( not ( = ?auto_790358 ?auto_790375 ) ) ( not ( = ?auto_790359 ?auto_790360 ) ) ( not ( = ?auto_790359 ?auto_790361 ) ) ( not ( = ?auto_790359 ?auto_790362 ) ) ( not ( = ?auto_790359 ?auto_790363 ) ) ( not ( = ?auto_790359 ?auto_790364 ) ) ( not ( = ?auto_790359 ?auto_790365 ) ) ( not ( = ?auto_790359 ?auto_790366 ) ) ( not ( = ?auto_790359 ?auto_790367 ) ) ( not ( = ?auto_790359 ?auto_790368 ) ) ( not ( = ?auto_790359 ?auto_790369 ) ) ( not ( = ?auto_790359 ?auto_790370 ) ) ( not ( = ?auto_790359 ?auto_790371 ) ) ( not ( = ?auto_790359 ?auto_790372 ) ) ( not ( = ?auto_790359 ?auto_790373 ) ) ( not ( = ?auto_790359 ?auto_790374 ) ) ( not ( = ?auto_790359 ?auto_790375 ) ) ( not ( = ?auto_790360 ?auto_790361 ) ) ( not ( = ?auto_790360 ?auto_790362 ) ) ( not ( = ?auto_790360 ?auto_790363 ) ) ( not ( = ?auto_790360 ?auto_790364 ) ) ( not ( = ?auto_790360 ?auto_790365 ) ) ( not ( = ?auto_790360 ?auto_790366 ) ) ( not ( = ?auto_790360 ?auto_790367 ) ) ( not ( = ?auto_790360 ?auto_790368 ) ) ( not ( = ?auto_790360 ?auto_790369 ) ) ( not ( = ?auto_790360 ?auto_790370 ) ) ( not ( = ?auto_790360 ?auto_790371 ) ) ( not ( = ?auto_790360 ?auto_790372 ) ) ( not ( = ?auto_790360 ?auto_790373 ) ) ( not ( = ?auto_790360 ?auto_790374 ) ) ( not ( = ?auto_790360 ?auto_790375 ) ) ( not ( = ?auto_790361 ?auto_790362 ) ) ( not ( = ?auto_790361 ?auto_790363 ) ) ( not ( = ?auto_790361 ?auto_790364 ) ) ( not ( = ?auto_790361 ?auto_790365 ) ) ( not ( = ?auto_790361 ?auto_790366 ) ) ( not ( = ?auto_790361 ?auto_790367 ) ) ( not ( = ?auto_790361 ?auto_790368 ) ) ( not ( = ?auto_790361 ?auto_790369 ) ) ( not ( = ?auto_790361 ?auto_790370 ) ) ( not ( = ?auto_790361 ?auto_790371 ) ) ( not ( = ?auto_790361 ?auto_790372 ) ) ( not ( = ?auto_790361 ?auto_790373 ) ) ( not ( = ?auto_790361 ?auto_790374 ) ) ( not ( = ?auto_790361 ?auto_790375 ) ) ( not ( = ?auto_790362 ?auto_790363 ) ) ( not ( = ?auto_790362 ?auto_790364 ) ) ( not ( = ?auto_790362 ?auto_790365 ) ) ( not ( = ?auto_790362 ?auto_790366 ) ) ( not ( = ?auto_790362 ?auto_790367 ) ) ( not ( = ?auto_790362 ?auto_790368 ) ) ( not ( = ?auto_790362 ?auto_790369 ) ) ( not ( = ?auto_790362 ?auto_790370 ) ) ( not ( = ?auto_790362 ?auto_790371 ) ) ( not ( = ?auto_790362 ?auto_790372 ) ) ( not ( = ?auto_790362 ?auto_790373 ) ) ( not ( = ?auto_790362 ?auto_790374 ) ) ( not ( = ?auto_790362 ?auto_790375 ) ) ( not ( = ?auto_790363 ?auto_790364 ) ) ( not ( = ?auto_790363 ?auto_790365 ) ) ( not ( = ?auto_790363 ?auto_790366 ) ) ( not ( = ?auto_790363 ?auto_790367 ) ) ( not ( = ?auto_790363 ?auto_790368 ) ) ( not ( = ?auto_790363 ?auto_790369 ) ) ( not ( = ?auto_790363 ?auto_790370 ) ) ( not ( = ?auto_790363 ?auto_790371 ) ) ( not ( = ?auto_790363 ?auto_790372 ) ) ( not ( = ?auto_790363 ?auto_790373 ) ) ( not ( = ?auto_790363 ?auto_790374 ) ) ( not ( = ?auto_790363 ?auto_790375 ) ) ( not ( = ?auto_790364 ?auto_790365 ) ) ( not ( = ?auto_790364 ?auto_790366 ) ) ( not ( = ?auto_790364 ?auto_790367 ) ) ( not ( = ?auto_790364 ?auto_790368 ) ) ( not ( = ?auto_790364 ?auto_790369 ) ) ( not ( = ?auto_790364 ?auto_790370 ) ) ( not ( = ?auto_790364 ?auto_790371 ) ) ( not ( = ?auto_790364 ?auto_790372 ) ) ( not ( = ?auto_790364 ?auto_790373 ) ) ( not ( = ?auto_790364 ?auto_790374 ) ) ( not ( = ?auto_790364 ?auto_790375 ) ) ( not ( = ?auto_790365 ?auto_790366 ) ) ( not ( = ?auto_790365 ?auto_790367 ) ) ( not ( = ?auto_790365 ?auto_790368 ) ) ( not ( = ?auto_790365 ?auto_790369 ) ) ( not ( = ?auto_790365 ?auto_790370 ) ) ( not ( = ?auto_790365 ?auto_790371 ) ) ( not ( = ?auto_790365 ?auto_790372 ) ) ( not ( = ?auto_790365 ?auto_790373 ) ) ( not ( = ?auto_790365 ?auto_790374 ) ) ( not ( = ?auto_790365 ?auto_790375 ) ) ( not ( = ?auto_790366 ?auto_790367 ) ) ( not ( = ?auto_790366 ?auto_790368 ) ) ( not ( = ?auto_790366 ?auto_790369 ) ) ( not ( = ?auto_790366 ?auto_790370 ) ) ( not ( = ?auto_790366 ?auto_790371 ) ) ( not ( = ?auto_790366 ?auto_790372 ) ) ( not ( = ?auto_790366 ?auto_790373 ) ) ( not ( = ?auto_790366 ?auto_790374 ) ) ( not ( = ?auto_790366 ?auto_790375 ) ) ( not ( = ?auto_790367 ?auto_790368 ) ) ( not ( = ?auto_790367 ?auto_790369 ) ) ( not ( = ?auto_790367 ?auto_790370 ) ) ( not ( = ?auto_790367 ?auto_790371 ) ) ( not ( = ?auto_790367 ?auto_790372 ) ) ( not ( = ?auto_790367 ?auto_790373 ) ) ( not ( = ?auto_790367 ?auto_790374 ) ) ( not ( = ?auto_790367 ?auto_790375 ) ) ( not ( = ?auto_790368 ?auto_790369 ) ) ( not ( = ?auto_790368 ?auto_790370 ) ) ( not ( = ?auto_790368 ?auto_790371 ) ) ( not ( = ?auto_790368 ?auto_790372 ) ) ( not ( = ?auto_790368 ?auto_790373 ) ) ( not ( = ?auto_790368 ?auto_790374 ) ) ( not ( = ?auto_790368 ?auto_790375 ) ) ( not ( = ?auto_790369 ?auto_790370 ) ) ( not ( = ?auto_790369 ?auto_790371 ) ) ( not ( = ?auto_790369 ?auto_790372 ) ) ( not ( = ?auto_790369 ?auto_790373 ) ) ( not ( = ?auto_790369 ?auto_790374 ) ) ( not ( = ?auto_790369 ?auto_790375 ) ) ( not ( = ?auto_790370 ?auto_790371 ) ) ( not ( = ?auto_790370 ?auto_790372 ) ) ( not ( = ?auto_790370 ?auto_790373 ) ) ( not ( = ?auto_790370 ?auto_790374 ) ) ( not ( = ?auto_790370 ?auto_790375 ) ) ( not ( = ?auto_790371 ?auto_790372 ) ) ( not ( = ?auto_790371 ?auto_790373 ) ) ( not ( = ?auto_790371 ?auto_790374 ) ) ( not ( = ?auto_790371 ?auto_790375 ) ) ( not ( = ?auto_790372 ?auto_790373 ) ) ( not ( = ?auto_790372 ?auto_790374 ) ) ( not ( = ?auto_790372 ?auto_790375 ) ) ( not ( = ?auto_790373 ?auto_790374 ) ) ( not ( = ?auto_790373 ?auto_790375 ) ) ( not ( = ?auto_790374 ?auto_790375 ) ) ( ON ?auto_790373 ?auto_790374 ) ( ON ?auto_790372 ?auto_790373 ) ( ON ?auto_790371 ?auto_790372 ) ( ON ?auto_790370 ?auto_790371 ) ( ON ?auto_790369 ?auto_790370 ) ( CLEAR ?auto_790367 ) ( ON ?auto_790368 ?auto_790369 ) ( CLEAR ?auto_790368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_790358 ?auto_790359 ?auto_790360 ?auto_790361 ?auto_790362 ?auto_790363 ?auto_790364 ?auto_790365 ?auto_790366 ?auto_790367 ?auto_790368 )
      ( MAKE-17PILE ?auto_790358 ?auto_790359 ?auto_790360 ?auto_790361 ?auto_790362 ?auto_790363 ?auto_790364 ?auto_790365 ?auto_790366 ?auto_790367 ?auto_790368 ?auto_790369 ?auto_790370 ?auto_790371 ?auto_790372 ?auto_790373 ?auto_790374 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790428 - BLOCK
      ?auto_790429 - BLOCK
      ?auto_790430 - BLOCK
      ?auto_790431 - BLOCK
      ?auto_790432 - BLOCK
      ?auto_790433 - BLOCK
      ?auto_790434 - BLOCK
      ?auto_790435 - BLOCK
      ?auto_790436 - BLOCK
      ?auto_790437 - BLOCK
      ?auto_790438 - BLOCK
      ?auto_790439 - BLOCK
      ?auto_790440 - BLOCK
      ?auto_790441 - BLOCK
      ?auto_790442 - BLOCK
      ?auto_790443 - BLOCK
      ?auto_790444 - BLOCK
    )
    :vars
    (
      ?auto_790445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790444 ?auto_790445 ) ( ON-TABLE ?auto_790428 ) ( ON ?auto_790429 ?auto_790428 ) ( ON ?auto_790430 ?auto_790429 ) ( ON ?auto_790431 ?auto_790430 ) ( ON ?auto_790432 ?auto_790431 ) ( ON ?auto_790433 ?auto_790432 ) ( ON ?auto_790434 ?auto_790433 ) ( ON ?auto_790435 ?auto_790434 ) ( ON ?auto_790436 ?auto_790435 ) ( not ( = ?auto_790428 ?auto_790429 ) ) ( not ( = ?auto_790428 ?auto_790430 ) ) ( not ( = ?auto_790428 ?auto_790431 ) ) ( not ( = ?auto_790428 ?auto_790432 ) ) ( not ( = ?auto_790428 ?auto_790433 ) ) ( not ( = ?auto_790428 ?auto_790434 ) ) ( not ( = ?auto_790428 ?auto_790435 ) ) ( not ( = ?auto_790428 ?auto_790436 ) ) ( not ( = ?auto_790428 ?auto_790437 ) ) ( not ( = ?auto_790428 ?auto_790438 ) ) ( not ( = ?auto_790428 ?auto_790439 ) ) ( not ( = ?auto_790428 ?auto_790440 ) ) ( not ( = ?auto_790428 ?auto_790441 ) ) ( not ( = ?auto_790428 ?auto_790442 ) ) ( not ( = ?auto_790428 ?auto_790443 ) ) ( not ( = ?auto_790428 ?auto_790444 ) ) ( not ( = ?auto_790428 ?auto_790445 ) ) ( not ( = ?auto_790429 ?auto_790430 ) ) ( not ( = ?auto_790429 ?auto_790431 ) ) ( not ( = ?auto_790429 ?auto_790432 ) ) ( not ( = ?auto_790429 ?auto_790433 ) ) ( not ( = ?auto_790429 ?auto_790434 ) ) ( not ( = ?auto_790429 ?auto_790435 ) ) ( not ( = ?auto_790429 ?auto_790436 ) ) ( not ( = ?auto_790429 ?auto_790437 ) ) ( not ( = ?auto_790429 ?auto_790438 ) ) ( not ( = ?auto_790429 ?auto_790439 ) ) ( not ( = ?auto_790429 ?auto_790440 ) ) ( not ( = ?auto_790429 ?auto_790441 ) ) ( not ( = ?auto_790429 ?auto_790442 ) ) ( not ( = ?auto_790429 ?auto_790443 ) ) ( not ( = ?auto_790429 ?auto_790444 ) ) ( not ( = ?auto_790429 ?auto_790445 ) ) ( not ( = ?auto_790430 ?auto_790431 ) ) ( not ( = ?auto_790430 ?auto_790432 ) ) ( not ( = ?auto_790430 ?auto_790433 ) ) ( not ( = ?auto_790430 ?auto_790434 ) ) ( not ( = ?auto_790430 ?auto_790435 ) ) ( not ( = ?auto_790430 ?auto_790436 ) ) ( not ( = ?auto_790430 ?auto_790437 ) ) ( not ( = ?auto_790430 ?auto_790438 ) ) ( not ( = ?auto_790430 ?auto_790439 ) ) ( not ( = ?auto_790430 ?auto_790440 ) ) ( not ( = ?auto_790430 ?auto_790441 ) ) ( not ( = ?auto_790430 ?auto_790442 ) ) ( not ( = ?auto_790430 ?auto_790443 ) ) ( not ( = ?auto_790430 ?auto_790444 ) ) ( not ( = ?auto_790430 ?auto_790445 ) ) ( not ( = ?auto_790431 ?auto_790432 ) ) ( not ( = ?auto_790431 ?auto_790433 ) ) ( not ( = ?auto_790431 ?auto_790434 ) ) ( not ( = ?auto_790431 ?auto_790435 ) ) ( not ( = ?auto_790431 ?auto_790436 ) ) ( not ( = ?auto_790431 ?auto_790437 ) ) ( not ( = ?auto_790431 ?auto_790438 ) ) ( not ( = ?auto_790431 ?auto_790439 ) ) ( not ( = ?auto_790431 ?auto_790440 ) ) ( not ( = ?auto_790431 ?auto_790441 ) ) ( not ( = ?auto_790431 ?auto_790442 ) ) ( not ( = ?auto_790431 ?auto_790443 ) ) ( not ( = ?auto_790431 ?auto_790444 ) ) ( not ( = ?auto_790431 ?auto_790445 ) ) ( not ( = ?auto_790432 ?auto_790433 ) ) ( not ( = ?auto_790432 ?auto_790434 ) ) ( not ( = ?auto_790432 ?auto_790435 ) ) ( not ( = ?auto_790432 ?auto_790436 ) ) ( not ( = ?auto_790432 ?auto_790437 ) ) ( not ( = ?auto_790432 ?auto_790438 ) ) ( not ( = ?auto_790432 ?auto_790439 ) ) ( not ( = ?auto_790432 ?auto_790440 ) ) ( not ( = ?auto_790432 ?auto_790441 ) ) ( not ( = ?auto_790432 ?auto_790442 ) ) ( not ( = ?auto_790432 ?auto_790443 ) ) ( not ( = ?auto_790432 ?auto_790444 ) ) ( not ( = ?auto_790432 ?auto_790445 ) ) ( not ( = ?auto_790433 ?auto_790434 ) ) ( not ( = ?auto_790433 ?auto_790435 ) ) ( not ( = ?auto_790433 ?auto_790436 ) ) ( not ( = ?auto_790433 ?auto_790437 ) ) ( not ( = ?auto_790433 ?auto_790438 ) ) ( not ( = ?auto_790433 ?auto_790439 ) ) ( not ( = ?auto_790433 ?auto_790440 ) ) ( not ( = ?auto_790433 ?auto_790441 ) ) ( not ( = ?auto_790433 ?auto_790442 ) ) ( not ( = ?auto_790433 ?auto_790443 ) ) ( not ( = ?auto_790433 ?auto_790444 ) ) ( not ( = ?auto_790433 ?auto_790445 ) ) ( not ( = ?auto_790434 ?auto_790435 ) ) ( not ( = ?auto_790434 ?auto_790436 ) ) ( not ( = ?auto_790434 ?auto_790437 ) ) ( not ( = ?auto_790434 ?auto_790438 ) ) ( not ( = ?auto_790434 ?auto_790439 ) ) ( not ( = ?auto_790434 ?auto_790440 ) ) ( not ( = ?auto_790434 ?auto_790441 ) ) ( not ( = ?auto_790434 ?auto_790442 ) ) ( not ( = ?auto_790434 ?auto_790443 ) ) ( not ( = ?auto_790434 ?auto_790444 ) ) ( not ( = ?auto_790434 ?auto_790445 ) ) ( not ( = ?auto_790435 ?auto_790436 ) ) ( not ( = ?auto_790435 ?auto_790437 ) ) ( not ( = ?auto_790435 ?auto_790438 ) ) ( not ( = ?auto_790435 ?auto_790439 ) ) ( not ( = ?auto_790435 ?auto_790440 ) ) ( not ( = ?auto_790435 ?auto_790441 ) ) ( not ( = ?auto_790435 ?auto_790442 ) ) ( not ( = ?auto_790435 ?auto_790443 ) ) ( not ( = ?auto_790435 ?auto_790444 ) ) ( not ( = ?auto_790435 ?auto_790445 ) ) ( not ( = ?auto_790436 ?auto_790437 ) ) ( not ( = ?auto_790436 ?auto_790438 ) ) ( not ( = ?auto_790436 ?auto_790439 ) ) ( not ( = ?auto_790436 ?auto_790440 ) ) ( not ( = ?auto_790436 ?auto_790441 ) ) ( not ( = ?auto_790436 ?auto_790442 ) ) ( not ( = ?auto_790436 ?auto_790443 ) ) ( not ( = ?auto_790436 ?auto_790444 ) ) ( not ( = ?auto_790436 ?auto_790445 ) ) ( not ( = ?auto_790437 ?auto_790438 ) ) ( not ( = ?auto_790437 ?auto_790439 ) ) ( not ( = ?auto_790437 ?auto_790440 ) ) ( not ( = ?auto_790437 ?auto_790441 ) ) ( not ( = ?auto_790437 ?auto_790442 ) ) ( not ( = ?auto_790437 ?auto_790443 ) ) ( not ( = ?auto_790437 ?auto_790444 ) ) ( not ( = ?auto_790437 ?auto_790445 ) ) ( not ( = ?auto_790438 ?auto_790439 ) ) ( not ( = ?auto_790438 ?auto_790440 ) ) ( not ( = ?auto_790438 ?auto_790441 ) ) ( not ( = ?auto_790438 ?auto_790442 ) ) ( not ( = ?auto_790438 ?auto_790443 ) ) ( not ( = ?auto_790438 ?auto_790444 ) ) ( not ( = ?auto_790438 ?auto_790445 ) ) ( not ( = ?auto_790439 ?auto_790440 ) ) ( not ( = ?auto_790439 ?auto_790441 ) ) ( not ( = ?auto_790439 ?auto_790442 ) ) ( not ( = ?auto_790439 ?auto_790443 ) ) ( not ( = ?auto_790439 ?auto_790444 ) ) ( not ( = ?auto_790439 ?auto_790445 ) ) ( not ( = ?auto_790440 ?auto_790441 ) ) ( not ( = ?auto_790440 ?auto_790442 ) ) ( not ( = ?auto_790440 ?auto_790443 ) ) ( not ( = ?auto_790440 ?auto_790444 ) ) ( not ( = ?auto_790440 ?auto_790445 ) ) ( not ( = ?auto_790441 ?auto_790442 ) ) ( not ( = ?auto_790441 ?auto_790443 ) ) ( not ( = ?auto_790441 ?auto_790444 ) ) ( not ( = ?auto_790441 ?auto_790445 ) ) ( not ( = ?auto_790442 ?auto_790443 ) ) ( not ( = ?auto_790442 ?auto_790444 ) ) ( not ( = ?auto_790442 ?auto_790445 ) ) ( not ( = ?auto_790443 ?auto_790444 ) ) ( not ( = ?auto_790443 ?auto_790445 ) ) ( not ( = ?auto_790444 ?auto_790445 ) ) ( ON ?auto_790443 ?auto_790444 ) ( ON ?auto_790442 ?auto_790443 ) ( ON ?auto_790441 ?auto_790442 ) ( ON ?auto_790440 ?auto_790441 ) ( ON ?auto_790439 ?auto_790440 ) ( ON ?auto_790438 ?auto_790439 ) ( CLEAR ?auto_790436 ) ( ON ?auto_790437 ?auto_790438 ) ( CLEAR ?auto_790437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_790428 ?auto_790429 ?auto_790430 ?auto_790431 ?auto_790432 ?auto_790433 ?auto_790434 ?auto_790435 ?auto_790436 ?auto_790437 )
      ( MAKE-17PILE ?auto_790428 ?auto_790429 ?auto_790430 ?auto_790431 ?auto_790432 ?auto_790433 ?auto_790434 ?auto_790435 ?auto_790436 ?auto_790437 ?auto_790438 ?auto_790439 ?auto_790440 ?auto_790441 ?auto_790442 ?auto_790443 ?auto_790444 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790498 - BLOCK
      ?auto_790499 - BLOCK
      ?auto_790500 - BLOCK
      ?auto_790501 - BLOCK
      ?auto_790502 - BLOCK
      ?auto_790503 - BLOCK
      ?auto_790504 - BLOCK
      ?auto_790505 - BLOCK
      ?auto_790506 - BLOCK
      ?auto_790507 - BLOCK
      ?auto_790508 - BLOCK
      ?auto_790509 - BLOCK
      ?auto_790510 - BLOCK
      ?auto_790511 - BLOCK
      ?auto_790512 - BLOCK
      ?auto_790513 - BLOCK
      ?auto_790514 - BLOCK
    )
    :vars
    (
      ?auto_790515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790514 ?auto_790515 ) ( ON-TABLE ?auto_790498 ) ( ON ?auto_790499 ?auto_790498 ) ( ON ?auto_790500 ?auto_790499 ) ( ON ?auto_790501 ?auto_790500 ) ( ON ?auto_790502 ?auto_790501 ) ( ON ?auto_790503 ?auto_790502 ) ( ON ?auto_790504 ?auto_790503 ) ( ON ?auto_790505 ?auto_790504 ) ( not ( = ?auto_790498 ?auto_790499 ) ) ( not ( = ?auto_790498 ?auto_790500 ) ) ( not ( = ?auto_790498 ?auto_790501 ) ) ( not ( = ?auto_790498 ?auto_790502 ) ) ( not ( = ?auto_790498 ?auto_790503 ) ) ( not ( = ?auto_790498 ?auto_790504 ) ) ( not ( = ?auto_790498 ?auto_790505 ) ) ( not ( = ?auto_790498 ?auto_790506 ) ) ( not ( = ?auto_790498 ?auto_790507 ) ) ( not ( = ?auto_790498 ?auto_790508 ) ) ( not ( = ?auto_790498 ?auto_790509 ) ) ( not ( = ?auto_790498 ?auto_790510 ) ) ( not ( = ?auto_790498 ?auto_790511 ) ) ( not ( = ?auto_790498 ?auto_790512 ) ) ( not ( = ?auto_790498 ?auto_790513 ) ) ( not ( = ?auto_790498 ?auto_790514 ) ) ( not ( = ?auto_790498 ?auto_790515 ) ) ( not ( = ?auto_790499 ?auto_790500 ) ) ( not ( = ?auto_790499 ?auto_790501 ) ) ( not ( = ?auto_790499 ?auto_790502 ) ) ( not ( = ?auto_790499 ?auto_790503 ) ) ( not ( = ?auto_790499 ?auto_790504 ) ) ( not ( = ?auto_790499 ?auto_790505 ) ) ( not ( = ?auto_790499 ?auto_790506 ) ) ( not ( = ?auto_790499 ?auto_790507 ) ) ( not ( = ?auto_790499 ?auto_790508 ) ) ( not ( = ?auto_790499 ?auto_790509 ) ) ( not ( = ?auto_790499 ?auto_790510 ) ) ( not ( = ?auto_790499 ?auto_790511 ) ) ( not ( = ?auto_790499 ?auto_790512 ) ) ( not ( = ?auto_790499 ?auto_790513 ) ) ( not ( = ?auto_790499 ?auto_790514 ) ) ( not ( = ?auto_790499 ?auto_790515 ) ) ( not ( = ?auto_790500 ?auto_790501 ) ) ( not ( = ?auto_790500 ?auto_790502 ) ) ( not ( = ?auto_790500 ?auto_790503 ) ) ( not ( = ?auto_790500 ?auto_790504 ) ) ( not ( = ?auto_790500 ?auto_790505 ) ) ( not ( = ?auto_790500 ?auto_790506 ) ) ( not ( = ?auto_790500 ?auto_790507 ) ) ( not ( = ?auto_790500 ?auto_790508 ) ) ( not ( = ?auto_790500 ?auto_790509 ) ) ( not ( = ?auto_790500 ?auto_790510 ) ) ( not ( = ?auto_790500 ?auto_790511 ) ) ( not ( = ?auto_790500 ?auto_790512 ) ) ( not ( = ?auto_790500 ?auto_790513 ) ) ( not ( = ?auto_790500 ?auto_790514 ) ) ( not ( = ?auto_790500 ?auto_790515 ) ) ( not ( = ?auto_790501 ?auto_790502 ) ) ( not ( = ?auto_790501 ?auto_790503 ) ) ( not ( = ?auto_790501 ?auto_790504 ) ) ( not ( = ?auto_790501 ?auto_790505 ) ) ( not ( = ?auto_790501 ?auto_790506 ) ) ( not ( = ?auto_790501 ?auto_790507 ) ) ( not ( = ?auto_790501 ?auto_790508 ) ) ( not ( = ?auto_790501 ?auto_790509 ) ) ( not ( = ?auto_790501 ?auto_790510 ) ) ( not ( = ?auto_790501 ?auto_790511 ) ) ( not ( = ?auto_790501 ?auto_790512 ) ) ( not ( = ?auto_790501 ?auto_790513 ) ) ( not ( = ?auto_790501 ?auto_790514 ) ) ( not ( = ?auto_790501 ?auto_790515 ) ) ( not ( = ?auto_790502 ?auto_790503 ) ) ( not ( = ?auto_790502 ?auto_790504 ) ) ( not ( = ?auto_790502 ?auto_790505 ) ) ( not ( = ?auto_790502 ?auto_790506 ) ) ( not ( = ?auto_790502 ?auto_790507 ) ) ( not ( = ?auto_790502 ?auto_790508 ) ) ( not ( = ?auto_790502 ?auto_790509 ) ) ( not ( = ?auto_790502 ?auto_790510 ) ) ( not ( = ?auto_790502 ?auto_790511 ) ) ( not ( = ?auto_790502 ?auto_790512 ) ) ( not ( = ?auto_790502 ?auto_790513 ) ) ( not ( = ?auto_790502 ?auto_790514 ) ) ( not ( = ?auto_790502 ?auto_790515 ) ) ( not ( = ?auto_790503 ?auto_790504 ) ) ( not ( = ?auto_790503 ?auto_790505 ) ) ( not ( = ?auto_790503 ?auto_790506 ) ) ( not ( = ?auto_790503 ?auto_790507 ) ) ( not ( = ?auto_790503 ?auto_790508 ) ) ( not ( = ?auto_790503 ?auto_790509 ) ) ( not ( = ?auto_790503 ?auto_790510 ) ) ( not ( = ?auto_790503 ?auto_790511 ) ) ( not ( = ?auto_790503 ?auto_790512 ) ) ( not ( = ?auto_790503 ?auto_790513 ) ) ( not ( = ?auto_790503 ?auto_790514 ) ) ( not ( = ?auto_790503 ?auto_790515 ) ) ( not ( = ?auto_790504 ?auto_790505 ) ) ( not ( = ?auto_790504 ?auto_790506 ) ) ( not ( = ?auto_790504 ?auto_790507 ) ) ( not ( = ?auto_790504 ?auto_790508 ) ) ( not ( = ?auto_790504 ?auto_790509 ) ) ( not ( = ?auto_790504 ?auto_790510 ) ) ( not ( = ?auto_790504 ?auto_790511 ) ) ( not ( = ?auto_790504 ?auto_790512 ) ) ( not ( = ?auto_790504 ?auto_790513 ) ) ( not ( = ?auto_790504 ?auto_790514 ) ) ( not ( = ?auto_790504 ?auto_790515 ) ) ( not ( = ?auto_790505 ?auto_790506 ) ) ( not ( = ?auto_790505 ?auto_790507 ) ) ( not ( = ?auto_790505 ?auto_790508 ) ) ( not ( = ?auto_790505 ?auto_790509 ) ) ( not ( = ?auto_790505 ?auto_790510 ) ) ( not ( = ?auto_790505 ?auto_790511 ) ) ( not ( = ?auto_790505 ?auto_790512 ) ) ( not ( = ?auto_790505 ?auto_790513 ) ) ( not ( = ?auto_790505 ?auto_790514 ) ) ( not ( = ?auto_790505 ?auto_790515 ) ) ( not ( = ?auto_790506 ?auto_790507 ) ) ( not ( = ?auto_790506 ?auto_790508 ) ) ( not ( = ?auto_790506 ?auto_790509 ) ) ( not ( = ?auto_790506 ?auto_790510 ) ) ( not ( = ?auto_790506 ?auto_790511 ) ) ( not ( = ?auto_790506 ?auto_790512 ) ) ( not ( = ?auto_790506 ?auto_790513 ) ) ( not ( = ?auto_790506 ?auto_790514 ) ) ( not ( = ?auto_790506 ?auto_790515 ) ) ( not ( = ?auto_790507 ?auto_790508 ) ) ( not ( = ?auto_790507 ?auto_790509 ) ) ( not ( = ?auto_790507 ?auto_790510 ) ) ( not ( = ?auto_790507 ?auto_790511 ) ) ( not ( = ?auto_790507 ?auto_790512 ) ) ( not ( = ?auto_790507 ?auto_790513 ) ) ( not ( = ?auto_790507 ?auto_790514 ) ) ( not ( = ?auto_790507 ?auto_790515 ) ) ( not ( = ?auto_790508 ?auto_790509 ) ) ( not ( = ?auto_790508 ?auto_790510 ) ) ( not ( = ?auto_790508 ?auto_790511 ) ) ( not ( = ?auto_790508 ?auto_790512 ) ) ( not ( = ?auto_790508 ?auto_790513 ) ) ( not ( = ?auto_790508 ?auto_790514 ) ) ( not ( = ?auto_790508 ?auto_790515 ) ) ( not ( = ?auto_790509 ?auto_790510 ) ) ( not ( = ?auto_790509 ?auto_790511 ) ) ( not ( = ?auto_790509 ?auto_790512 ) ) ( not ( = ?auto_790509 ?auto_790513 ) ) ( not ( = ?auto_790509 ?auto_790514 ) ) ( not ( = ?auto_790509 ?auto_790515 ) ) ( not ( = ?auto_790510 ?auto_790511 ) ) ( not ( = ?auto_790510 ?auto_790512 ) ) ( not ( = ?auto_790510 ?auto_790513 ) ) ( not ( = ?auto_790510 ?auto_790514 ) ) ( not ( = ?auto_790510 ?auto_790515 ) ) ( not ( = ?auto_790511 ?auto_790512 ) ) ( not ( = ?auto_790511 ?auto_790513 ) ) ( not ( = ?auto_790511 ?auto_790514 ) ) ( not ( = ?auto_790511 ?auto_790515 ) ) ( not ( = ?auto_790512 ?auto_790513 ) ) ( not ( = ?auto_790512 ?auto_790514 ) ) ( not ( = ?auto_790512 ?auto_790515 ) ) ( not ( = ?auto_790513 ?auto_790514 ) ) ( not ( = ?auto_790513 ?auto_790515 ) ) ( not ( = ?auto_790514 ?auto_790515 ) ) ( ON ?auto_790513 ?auto_790514 ) ( ON ?auto_790512 ?auto_790513 ) ( ON ?auto_790511 ?auto_790512 ) ( ON ?auto_790510 ?auto_790511 ) ( ON ?auto_790509 ?auto_790510 ) ( ON ?auto_790508 ?auto_790509 ) ( ON ?auto_790507 ?auto_790508 ) ( CLEAR ?auto_790505 ) ( ON ?auto_790506 ?auto_790507 ) ( CLEAR ?auto_790506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_790498 ?auto_790499 ?auto_790500 ?auto_790501 ?auto_790502 ?auto_790503 ?auto_790504 ?auto_790505 ?auto_790506 )
      ( MAKE-17PILE ?auto_790498 ?auto_790499 ?auto_790500 ?auto_790501 ?auto_790502 ?auto_790503 ?auto_790504 ?auto_790505 ?auto_790506 ?auto_790507 ?auto_790508 ?auto_790509 ?auto_790510 ?auto_790511 ?auto_790512 ?auto_790513 ?auto_790514 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790568 - BLOCK
      ?auto_790569 - BLOCK
      ?auto_790570 - BLOCK
      ?auto_790571 - BLOCK
      ?auto_790572 - BLOCK
      ?auto_790573 - BLOCK
      ?auto_790574 - BLOCK
      ?auto_790575 - BLOCK
      ?auto_790576 - BLOCK
      ?auto_790577 - BLOCK
      ?auto_790578 - BLOCK
      ?auto_790579 - BLOCK
      ?auto_790580 - BLOCK
      ?auto_790581 - BLOCK
      ?auto_790582 - BLOCK
      ?auto_790583 - BLOCK
      ?auto_790584 - BLOCK
    )
    :vars
    (
      ?auto_790585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790584 ?auto_790585 ) ( ON-TABLE ?auto_790568 ) ( ON ?auto_790569 ?auto_790568 ) ( ON ?auto_790570 ?auto_790569 ) ( ON ?auto_790571 ?auto_790570 ) ( ON ?auto_790572 ?auto_790571 ) ( ON ?auto_790573 ?auto_790572 ) ( ON ?auto_790574 ?auto_790573 ) ( not ( = ?auto_790568 ?auto_790569 ) ) ( not ( = ?auto_790568 ?auto_790570 ) ) ( not ( = ?auto_790568 ?auto_790571 ) ) ( not ( = ?auto_790568 ?auto_790572 ) ) ( not ( = ?auto_790568 ?auto_790573 ) ) ( not ( = ?auto_790568 ?auto_790574 ) ) ( not ( = ?auto_790568 ?auto_790575 ) ) ( not ( = ?auto_790568 ?auto_790576 ) ) ( not ( = ?auto_790568 ?auto_790577 ) ) ( not ( = ?auto_790568 ?auto_790578 ) ) ( not ( = ?auto_790568 ?auto_790579 ) ) ( not ( = ?auto_790568 ?auto_790580 ) ) ( not ( = ?auto_790568 ?auto_790581 ) ) ( not ( = ?auto_790568 ?auto_790582 ) ) ( not ( = ?auto_790568 ?auto_790583 ) ) ( not ( = ?auto_790568 ?auto_790584 ) ) ( not ( = ?auto_790568 ?auto_790585 ) ) ( not ( = ?auto_790569 ?auto_790570 ) ) ( not ( = ?auto_790569 ?auto_790571 ) ) ( not ( = ?auto_790569 ?auto_790572 ) ) ( not ( = ?auto_790569 ?auto_790573 ) ) ( not ( = ?auto_790569 ?auto_790574 ) ) ( not ( = ?auto_790569 ?auto_790575 ) ) ( not ( = ?auto_790569 ?auto_790576 ) ) ( not ( = ?auto_790569 ?auto_790577 ) ) ( not ( = ?auto_790569 ?auto_790578 ) ) ( not ( = ?auto_790569 ?auto_790579 ) ) ( not ( = ?auto_790569 ?auto_790580 ) ) ( not ( = ?auto_790569 ?auto_790581 ) ) ( not ( = ?auto_790569 ?auto_790582 ) ) ( not ( = ?auto_790569 ?auto_790583 ) ) ( not ( = ?auto_790569 ?auto_790584 ) ) ( not ( = ?auto_790569 ?auto_790585 ) ) ( not ( = ?auto_790570 ?auto_790571 ) ) ( not ( = ?auto_790570 ?auto_790572 ) ) ( not ( = ?auto_790570 ?auto_790573 ) ) ( not ( = ?auto_790570 ?auto_790574 ) ) ( not ( = ?auto_790570 ?auto_790575 ) ) ( not ( = ?auto_790570 ?auto_790576 ) ) ( not ( = ?auto_790570 ?auto_790577 ) ) ( not ( = ?auto_790570 ?auto_790578 ) ) ( not ( = ?auto_790570 ?auto_790579 ) ) ( not ( = ?auto_790570 ?auto_790580 ) ) ( not ( = ?auto_790570 ?auto_790581 ) ) ( not ( = ?auto_790570 ?auto_790582 ) ) ( not ( = ?auto_790570 ?auto_790583 ) ) ( not ( = ?auto_790570 ?auto_790584 ) ) ( not ( = ?auto_790570 ?auto_790585 ) ) ( not ( = ?auto_790571 ?auto_790572 ) ) ( not ( = ?auto_790571 ?auto_790573 ) ) ( not ( = ?auto_790571 ?auto_790574 ) ) ( not ( = ?auto_790571 ?auto_790575 ) ) ( not ( = ?auto_790571 ?auto_790576 ) ) ( not ( = ?auto_790571 ?auto_790577 ) ) ( not ( = ?auto_790571 ?auto_790578 ) ) ( not ( = ?auto_790571 ?auto_790579 ) ) ( not ( = ?auto_790571 ?auto_790580 ) ) ( not ( = ?auto_790571 ?auto_790581 ) ) ( not ( = ?auto_790571 ?auto_790582 ) ) ( not ( = ?auto_790571 ?auto_790583 ) ) ( not ( = ?auto_790571 ?auto_790584 ) ) ( not ( = ?auto_790571 ?auto_790585 ) ) ( not ( = ?auto_790572 ?auto_790573 ) ) ( not ( = ?auto_790572 ?auto_790574 ) ) ( not ( = ?auto_790572 ?auto_790575 ) ) ( not ( = ?auto_790572 ?auto_790576 ) ) ( not ( = ?auto_790572 ?auto_790577 ) ) ( not ( = ?auto_790572 ?auto_790578 ) ) ( not ( = ?auto_790572 ?auto_790579 ) ) ( not ( = ?auto_790572 ?auto_790580 ) ) ( not ( = ?auto_790572 ?auto_790581 ) ) ( not ( = ?auto_790572 ?auto_790582 ) ) ( not ( = ?auto_790572 ?auto_790583 ) ) ( not ( = ?auto_790572 ?auto_790584 ) ) ( not ( = ?auto_790572 ?auto_790585 ) ) ( not ( = ?auto_790573 ?auto_790574 ) ) ( not ( = ?auto_790573 ?auto_790575 ) ) ( not ( = ?auto_790573 ?auto_790576 ) ) ( not ( = ?auto_790573 ?auto_790577 ) ) ( not ( = ?auto_790573 ?auto_790578 ) ) ( not ( = ?auto_790573 ?auto_790579 ) ) ( not ( = ?auto_790573 ?auto_790580 ) ) ( not ( = ?auto_790573 ?auto_790581 ) ) ( not ( = ?auto_790573 ?auto_790582 ) ) ( not ( = ?auto_790573 ?auto_790583 ) ) ( not ( = ?auto_790573 ?auto_790584 ) ) ( not ( = ?auto_790573 ?auto_790585 ) ) ( not ( = ?auto_790574 ?auto_790575 ) ) ( not ( = ?auto_790574 ?auto_790576 ) ) ( not ( = ?auto_790574 ?auto_790577 ) ) ( not ( = ?auto_790574 ?auto_790578 ) ) ( not ( = ?auto_790574 ?auto_790579 ) ) ( not ( = ?auto_790574 ?auto_790580 ) ) ( not ( = ?auto_790574 ?auto_790581 ) ) ( not ( = ?auto_790574 ?auto_790582 ) ) ( not ( = ?auto_790574 ?auto_790583 ) ) ( not ( = ?auto_790574 ?auto_790584 ) ) ( not ( = ?auto_790574 ?auto_790585 ) ) ( not ( = ?auto_790575 ?auto_790576 ) ) ( not ( = ?auto_790575 ?auto_790577 ) ) ( not ( = ?auto_790575 ?auto_790578 ) ) ( not ( = ?auto_790575 ?auto_790579 ) ) ( not ( = ?auto_790575 ?auto_790580 ) ) ( not ( = ?auto_790575 ?auto_790581 ) ) ( not ( = ?auto_790575 ?auto_790582 ) ) ( not ( = ?auto_790575 ?auto_790583 ) ) ( not ( = ?auto_790575 ?auto_790584 ) ) ( not ( = ?auto_790575 ?auto_790585 ) ) ( not ( = ?auto_790576 ?auto_790577 ) ) ( not ( = ?auto_790576 ?auto_790578 ) ) ( not ( = ?auto_790576 ?auto_790579 ) ) ( not ( = ?auto_790576 ?auto_790580 ) ) ( not ( = ?auto_790576 ?auto_790581 ) ) ( not ( = ?auto_790576 ?auto_790582 ) ) ( not ( = ?auto_790576 ?auto_790583 ) ) ( not ( = ?auto_790576 ?auto_790584 ) ) ( not ( = ?auto_790576 ?auto_790585 ) ) ( not ( = ?auto_790577 ?auto_790578 ) ) ( not ( = ?auto_790577 ?auto_790579 ) ) ( not ( = ?auto_790577 ?auto_790580 ) ) ( not ( = ?auto_790577 ?auto_790581 ) ) ( not ( = ?auto_790577 ?auto_790582 ) ) ( not ( = ?auto_790577 ?auto_790583 ) ) ( not ( = ?auto_790577 ?auto_790584 ) ) ( not ( = ?auto_790577 ?auto_790585 ) ) ( not ( = ?auto_790578 ?auto_790579 ) ) ( not ( = ?auto_790578 ?auto_790580 ) ) ( not ( = ?auto_790578 ?auto_790581 ) ) ( not ( = ?auto_790578 ?auto_790582 ) ) ( not ( = ?auto_790578 ?auto_790583 ) ) ( not ( = ?auto_790578 ?auto_790584 ) ) ( not ( = ?auto_790578 ?auto_790585 ) ) ( not ( = ?auto_790579 ?auto_790580 ) ) ( not ( = ?auto_790579 ?auto_790581 ) ) ( not ( = ?auto_790579 ?auto_790582 ) ) ( not ( = ?auto_790579 ?auto_790583 ) ) ( not ( = ?auto_790579 ?auto_790584 ) ) ( not ( = ?auto_790579 ?auto_790585 ) ) ( not ( = ?auto_790580 ?auto_790581 ) ) ( not ( = ?auto_790580 ?auto_790582 ) ) ( not ( = ?auto_790580 ?auto_790583 ) ) ( not ( = ?auto_790580 ?auto_790584 ) ) ( not ( = ?auto_790580 ?auto_790585 ) ) ( not ( = ?auto_790581 ?auto_790582 ) ) ( not ( = ?auto_790581 ?auto_790583 ) ) ( not ( = ?auto_790581 ?auto_790584 ) ) ( not ( = ?auto_790581 ?auto_790585 ) ) ( not ( = ?auto_790582 ?auto_790583 ) ) ( not ( = ?auto_790582 ?auto_790584 ) ) ( not ( = ?auto_790582 ?auto_790585 ) ) ( not ( = ?auto_790583 ?auto_790584 ) ) ( not ( = ?auto_790583 ?auto_790585 ) ) ( not ( = ?auto_790584 ?auto_790585 ) ) ( ON ?auto_790583 ?auto_790584 ) ( ON ?auto_790582 ?auto_790583 ) ( ON ?auto_790581 ?auto_790582 ) ( ON ?auto_790580 ?auto_790581 ) ( ON ?auto_790579 ?auto_790580 ) ( ON ?auto_790578 ?auto_790579 ) ( ON ?auto_790577 ?auto_790578 ) ( ON ?auto_790576 ?auto_790577 ) ( CLEAR ?auto_790574 ) ( ON ?auto_790575 ?auto_790576 ) ( CLEAR ?auto_790575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_790568 ?auto_790569 ?auto_790570 ?auto_790571 ?auto_790572 ?auto_790573 ?auto_790574 ?auto_790575 )
      ( MAKE-17PILE ?auto_790568 ?auto_790569 ?auto_790570 ?auto_790571 ?auto_790572 ?auto_790573 ?auto_790574 ?auto_790575 ?auto_790576 ?auto_790577 ?auto_790578 ?auto_790579 ?auto_790580 ?auto_790581 ?auto_790582 ?auto_790583 ?auto_790584 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790638 - BLOCK
      ?auto_790639 - BLOCK
      ?auto_790640 - BLOCK
      ?auto_790641 - BLOCK
      ?auto_790642 - BLOCK
      ?auto_790643 - BLOCK
      ?auto_790644 - BLOCK
      ?auto_790645 - BLOCK
      ?auto_790646 - BLOCK
      ?auto_790647 - BLOCK
      ?auto_790648 - BLOCK
      ?auto_790649 - BLOCK
      ?auto_790650 - BLOCK
      ?auto_790651 - BLOCK
      ?auto_790652 - BLOCK
      ?auto_790653 - BLOCK
      ?auto_790654 - BLOCK
    )
    :vars
    (
      ?auto_790655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790654 ?auto_790655 ) ( ON-TABLE ?auto_790638 ) ( ON ?auto_790639 ?auto_790638 ) ( ON ?auto_790640 ?auto_790639 ) ( ON ?auto_790641 ?auto_790640 ) ( ON ?auto_790642 ?auto_790641 ) ( ON ?auto_790643 ?auto_790642 ) ( not ( = ?auto_790638 ?auto_790639 ) ) ( not ( = ?auto_790638 ?auto_790640 ) ) ( not ( = ?auto_790638 ?auto_790641 ) ) ( not ( = ?auto_790638 ?auto_790642 ) ) ( not ( = ?auto_790638 ?auto_790643 ) ) ( not ( = ?auto_790638 ?auto_790644 ) ) ( not ( = ?auto_790638 ?auto_790645 ) ) ( not ( = ?auto_790638 ?auto_790646 ) ) ( not ( = ?auto_790638 ?auto_790647 ) ) ( not ( = ?auto_790638 ?auto_790648 ) ) ( not ( = ?auto_790638 ?auto_790649 ) ) ( not ( = ?auto_790638 ?auto_790650 ) ) ( not ( = ?auto_790638 ?auto_790651 ) ) ( not ( = ?auto_790638 ?auto_790652 ) ) ( not ( = ?auto_790638 ?auto_790653 ) ) ( not ( = ?auto_790638 ?auto_790654 ) ) ( not ( = ?auto_790638 ?auto_790655 ) ) ( not ( = ?auto_790639 ?auto_790640 ) ) ( not ( = ?auto_790639 ?auto_790641 ) ) ( not ( = ?auto_790639 ?auto_790642 ) ) ( not ( = ?auto_790639 ?auto_790643 ) ) ( not ( = ?auto_790639 ?auto_790644 ) ) ( not ( = ?auto_790639 ?auto_790645 ) ) ( not ( = ?auto_790639 ?auto_790646 ) ) ( not ( = ?auto_790639 ?auto_790647 ) ) ( not ( = ?auto_790639 ?auto_790648 ) ) ( not ( = ?auto_790639 ?auto_790649 ) ) ( not ( = ?auto_790639 ?auto_790650 ) ) ( not ( = ?auto_790639 ?auto_790651 ) ) ( not ( = ?auto_790639 ?auto_790652 ) ) ( not ( = ?auto_790639 ?auto_790653 ) ) ( not ( = ?auto_790639 ?auto_790654 ) ) ( not ( = ?auto_790639 ?auto_790655 ) ) ( not ( = ?auto_790640 ?auto_790641 ) ) ( not ( = ?auto_790640 ?auto_790642 ) ) ( not ( = ?auto_790640 ?auto_790643 ) ) ( not ( = ?auto_790640 ?auto_790644 ) ) ( not ( = ?auto_790640 ?auto_790645 ) ) ( not ( = ?auto_790640 ?auto_790646 ) ) ( not ( = ?auto_790640 ?auto_790647 ) ) ( not ( = ?auto_790640 ?auto_790648 ) ) ( not ( = ?auto_790640 ?auto_790649 ) ) ( not ( = ?auto_790640 ?auto_790650 ) ) ( not ( = ?auto_790640 ?auto_790651 ) ) ( not ( = ?auto_790640 ?auto_790652 ) ) ( not ( = ?auto_790640 ?auto_790653 ) ) ( not ( = ?auto_790640 ?auto_790654 ) ) ( not ( = ?auto_790640 ?auto_790655 ) ) ( not ( = ?auto_790641 ?auto_790642 ) ) ( not ( = ?auto_790641 ?auto_790643 ) ) ( not ( = ?auto_790641 ?auto_790644 ) ) ( not ( = ?auto_790641 ?auto_790645 ) ) ( not ( = ?auto_790641 ?auto_790646 ) ) ( not ( = ?auto_790641 ?auto_790647 ) ) ( not ( = ?auto_790641 ?auto_790648 ) ) ( not ( = ?auto_790641 ?auto_790649 ) ) ( not ( = ?auto_790641 ?auto_790650 ) ) ( not ( = ?auto_790641 ?auto_790651 ) ) ( not ( = ?auto_790641 ?auto_790652 ) ) ( not ( = ?auto_790641 ?auto_790653 ) ) ( not ( = ?auto_790641 ?auto_790654 ) ) ( not ( = ?auto_790641 ?auto_790655 ) ) ( not ( = ?auto_790642 ?auto_790643 ) ) ( not ( = ?auto_790642 ?auto_790644 ) ) ( not ( = ?auto_790642 ?auto_790645 ) ) ( not ( = ?auto_790642 ?auto_790646 ) ) ( not ( = ?auto_790642 ?auto_790647 ) ) ( not ( = ?auto_790642 ?auto_790648 ) ) ( not ( = ?auto_790642 ?auto_790649 ) ) ( not ( = ?auto_790642 ?auto_790650 ) ) ( not ( = ?auto_790642 ?auto_790651 ) ) ( not ( = ?auto_790642 ?auto_790652 ) ) ( not ( = ?auto_790642 ?auto_790653 ) ) ( not ( = ?auto_790642 ?auto_790654 ) ) ( not ( = ?auto_790642 ?auto_790655 ) ) ( not ( = ?auto_790643 ?auto_790644 ) ) ( not ( = ?auto_790643 ?auto_790645 ) ) ( not ( = ?auto_790643 ?auto_790646 ) ) ( not ( = ?auto_790643 ?auto_790647 ) ) ( not ( = ?auto_790643 ?auto_790648 ) ) ( not ( = ?auto_790643 ?auto_790649 ) ) ( not ( = ?auto_790643 ?auto_790650 ) ) ( not ( = ?auto_790643 ?auto_790651 ) ) ( not ( = ?auto_790643 ?auto_790652 ) ) ( not ( = ?auto_790643 ?auto_790653 ) ) ( not ( = ?auto_790643 ?auto_790654 ) ) ( not ( = ?auto_790643 ?auto_790655 ) ) ( not ( = ?auto_790644 ?auto_790645 ) ) ( not ( = ?auto_790644 ?auto_790646 ) ) ( not ( = ?auto_790644 ?auto_790647 ) ) ( not ( = ?auto_790644 ?auto_790648 ) ) ( not ( = ?auto_790644 ?auto_790649 ) ) ( not ( = ?auto_790644 ?auto_790650 ) ) ( not ( = ?auto_790644 ?auto_790651 ) ) ( not ( = ?auto_790644 ?auto_790652 ) ) ( not ( = ?auto_790644 ?auto_790653 ) ) ( not ( = ?auto_790644 ?auto_790654 ) ) ( not ( = ?auto_790644 ?auto_790655 ) ) ( not ( = ?auto_790645 ?auto_790646 ) ) ( not ( = ?auto_790645 ?auto_790647 ) ) ( not ( = ?auto_790645 ?auto_790648 ) ) ( not ( = ?auto_790645 ?auto_790649 ) ) ( not ( = ?auto_790645 ?auto_790650 ) ) ( not ( = ?auto_790645 ?auto_790651 ) ) ( not ( = ?auto_790645 ?auto_790652 ) ) ( not ( = ?auto_790645 ?auto_790653 ) ) ( not ( = ?auto_790645 ?auto_790654 ) ) ( not ( = ?auto_790645 ?auto_790655 ) ) ( not ( = ?auto_790646 ?auto_790647 ) ) ( not ( = ?auto_790646 ?auto_790648 ) ) ( not ( = ?auto_790646 ?auto_790649 ) ) ( not ( = ?auto_790646 ?auto_790650 ) ) ( not ( = ?auto_790646 ?auto_790651 ) ) ( not ( = ?auto_790646 ?auto_790652 ) ) ( not ( = ?auto_790646 ?auto_790653 ) ) ( not ( = ?auto_790646 ?auto_790654 ) ) ( not ( = ?auto_790646 ?auto_790655 ) ) ( not ( = ?auto_790647 ?auto_790648 ) ) ( not ( = ?auto_790647 ?auto_790649 ) ) ( not ( = ?auto_790647 ?auto_790650 ) ) ( not ( = ?auto_790647 ?auto_790651 ) ) ( not ( = ?auto_790647 ?auto_790652 ) ) ( not ( = ?auto_790647 ?auto_790653 ) ) ( not ( = ?auto_790647 ?auto_790654 ) ) ( not ( = ?auto_790647 ?auto_790655 ) ) ( not ( = ?auto_790648 ?auto_790649 ) ) ( not ( = ?auto_790648 ?auto_790650 ) ) ( not ( = ?auto_790648 ?auto_790651 ) ) ( not ( = ?auto_790648 ?auto_790652 ) ) ( not ( = ?auto_790648 ?auto_790653 ) ) ( not ( = ?auto_790648 ?auto_790654 ) ) ( not ( = ?auto_790648 ?auto_790655 ) ) ( not ( = ?auto_790649 ?auto_790650 ) ) ( not ( = ?auto_790649 ?auto_790651 ) ) ( not ( = ?auto_790649 ?auto_790652 ) ) ( not ( = ?auto_790649 ?auto_790653 ) ) ( not ( = ?auto_790649 ?auto_790654 ) ) ( not ( = ?auto_790649 ?auto_790655 ) ) ( not ( = ?auto_790650 ?auto_790651 ) ) ( not ( = ?auto_790650 ?auto_790652 ) ) ( not ( = ?auto_790650 ?auto_790653 ) ) ( not ( = ?auto_790650 ?auto_790654 ) ) ( not ( = ?auto_790650 ?auto_790655 ) ) ( not ( = ?auto_790651 ?auto_790652 ) ) ( not ( = ?auto_790651 ?auto_790653 ) ) ( not ( = ?auto_790651 ?auto_790654 ) ) ( not ( = ?auto_790651 ?auto_790655 ) ) ( not ( = ?auto_790652 ?auto_790653 ) ) ( not ( = ?auto_790652 ?auto_790654 ) ) ( not ( = ?auto_790652 ?auto_790655 ) ) ( not ( = ?auto_790653 ?auto_790654 ) ) ( not ( = ?auto_790653 ?auto_790655 ) ) ( not ( = ?auto_790654 ?auto_790655 ) ) ( ON ?auto_790653 ?auto_790654 ) ( ON ?auto_790652 ?auto_790653 ) ( ON ?auto_790651 ?auto_790652 ) ( ON ?auto_790650 ?auto_790651 ) ( ON ?auto_790649 ?auto_790650 ) ( ON ?auto_790648 ?auto_790649 ) ( ON ?auto_790647 ?auto_790648 ) ( ON ?auto_790646 ?auto_790647 ) ( ON ?auto_790645 ?auto_790646 ) ( CLEAR ?auto_790643 ) ( ON ?auto_790644 ?auto_790645 ) ( CLEAR ?auto_790644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_790638 ?auto_790639 ?auto_790640 ?auto_790641 ?auto_790642 ?auto_790643 ?auto_790644 )
      ( MAKE-17PILE ?auto_790638 ?auto_790639 ?auto_790640 ?auto_790641 ?auto_790642 ?auto_790643 ?auto_790644 ?auto_790645 ?auto_790646 ?auto_790647 ?auto_790648 ?auto_790649 ?auto_790650 ?auto_790651 ?auto_790652 ?auto_790653 ?auto_790654 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790708 - BLOCK
      ?auto_790709 - BLOCK
      ?auto_790710 - BLOCK
      ?auto_790711 - BLOCK
      ?auto_790712 - BLOCK
      ?auto_790713 - BLOCK
      ?auto_790714 - BLOCK
      ?auto_790715 - BLOCK
      ?auto_790716 - BLOCK
      ?auto_790717 - BLOCK
      ?auto_790718 - BLOCK
      ?auto_790719 - BLOCK
      ?auto_790720 - BLOCK
      ?auto_790721 - BLOCK
      ?auto_790722 - BLOCK
      ?auto_790723 - BLOCK
      ?auto_790724 - BLOCK
    )
    :vars
    (
      ?auto_790725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790724 ?auto_790725 ) ( ON-TABLE ?auto_790708 ) ( ON ?auto_790709 ?auto_790708 ) ( ON ?auto_790710 ?auto_790709 ) ( ON ?auto_790711 ?auto_790710 ) ( ON ?auto_790712 ?auto_790711 ) ( not ( = ?auto_790708 ?auto_790709 ) ) ( not ( = ?auto_790708 ?auto_790710 ) ) ( not ( = ?auto_790708 ?auto_790711 ) ) ( not ( = ?auto_790708 ?auto_790712 ) ) ( not ( = ?auto_790708 ?auto_790713 ) ) ( not ( = ?auto_790708 ?auto_790714 ) ) ( not ( = ?auto_790708 ?auto_790715 ) ) ( not ( = ?auto_790708 ?auto_790716 ) ) ( not ( = ?auto_790708 ?auto_790717 ) ) ( not ( = ?auto_790708 ?auto_790718 ) ) ( not ( = ?auto_790708 ?auto_790719 ) ) ( not ( = ?auto_790708 ?auto_790720 ) ) ( not ( = ?auto_790708 ?auto_790721 ) ) ( not ( = ?auto_790708 ?auto_790722 ) ) ( not ( = ?auto_790708 ?auto_790723 ) ) ( not ( = ?auto_790708 ?auto_790724 ) ) ( not ( = ?auto_790708 ?auto_790725 ) ) ( not ( = ?auto_790709 ?auto_790710 ) ) ( not ( = ?auto_790709 ?auto_790711 ) ) ( not ( = ?auto_790709 ?auto_790712 ) ) ( not ( = ?auto_790709 ?auto_790713 ) ) ( not ( = ?auto_790709 ?auto_790714 ) ) ( not ( = ?auto_790709 ?auto_790715 ) ) ( not ( = ?auto_790709 ?auto_790716 ) ) ( not ( = ?auto_790709 ?auto_790717 ) ) ( not ( = ?auto_790709 ?auto_790718 ) ) ( not ( = ?auto_790709 ?auto_790719 ) ) ( not ( = ?auto_790709 ?auto_790720 ) ) ( not ( = ?auto_790709 ?auto_790721 ) ) ( not ( = ?auto_790709 ?auto_790722 ) ) ( not ( = ?auto_790709 ?auto_790723 ) ) ( not ( = ?auto_790709 ?auto_790724 ) ) ( not ( = ?auto_790709 ?auto_790725 ) ) ( not ( = ?auto_790710 ?auto_790711 ) ) ( not ( = ?auto_790710 ?auto_790712 ) ) ( not ( = ?auto_790710 ?auto_790713 ) ) ( not ( = ?auto_790710 ?auto_790714 ) ) ( not ( = ?auto_790710 ?auto_790715 ) ) ( not ( = ?auto_790710 ?auto_790716 ) ) ( not ( = ?auto_790710 ?auto_790717 ) ) ( not ( = ?auto_790710 ?auto_790718 ) ) ( not ( = ?auto_790710 ?auto_790719 ) ) ( not ( = ?auto_790710 ?auto_790720 ) ) ( not ( = ?auto_790710 ?auto_790721 ) ) ( not ( = ?auto_790710 ?auto_790722 ) ) ( not ( = ?auto_790710 ?auto_790723 ) ) ( not ( = ?auto_790710 ?auto_790724 ) ) ( not ( = ?auto_790710 ?auto_790725 ) ) ( not ( = ?auto_790711 ?auto_790712 ) ) ( not ( = ?auto_790711 ?auto_790713 ) ) ( not ( = ?auto_790711 ?auto_790714 ) ) ( not ( = ?auto_790711 ?auto_790715 ) ) ( not ( = ?auto_790711 ?auto_790716 ) ) ( not ( = ?auto_790711 ?auto_790717 ) ) ( not ( = ?auto_790711 ?auto_790718 ) ) ( not ( = ?auto_790711 ?auto_790719 ) ) ( not ( = ?auto_790711 ?auto_790720 ) ) ( not ( = ?auto_790711 ?auto_790721 ) ) ( not ( = ?auto_790711 ?auto_790722 ) ) ( not ( = ?auto_790711 ?auto_790723 ) ) ( not ( = ?auto_790711 ?auto_790724 ) ) ( not ( = ?auto_790711 ?auto_790725 ) ) ( not ( = ?auto_790712 ?auto_790713 ) ) ( not ( = ?auto_790712 ?auto_790714 ) ) ( not ( = ?auto_790712 ?auto_790715 ) ) ( not ( = ?auto_790712 ?auto_790716 ) ) ( not ( = ?auto_790712 ?auto_790717 ) ) ( not ( = ?auto_790712 ?auto_790718 ) ) ( not ( = ?auto_790712 ?auto_790719 ) ) ( not ( = ?auto_790712 ?auto_790720 ) ) ( not ( = ?auto_790712 ?auto_790721 ) ) ( not ( = ?auto_790712 ?auto_790722 ) ) ( not ( = ?auto_790712 ?auto_790723 ) ) ( not ( = ?auto_790712 ?auto_790724 ) ) ( not ( = ?auto_790712 ?auto_790725 ) ) ( not ( = ?auto_790713 ?auto_790714 ) ) ( not ( = ?auto_790713 ?auto_790715 ) ) ( not ( = ?auto_790713 ?auto_790716 ) ) ( not ( = ?auto_790713 ?auto_790717 ) ) ( not ( = ?auto_790713 ?auto_790718 ) ) ( not ( = ?auto_790713 ?auto_790719 ) ) ( not ( = ?auto_790713 ?auto_790720 ) ) ( not ( = ?auto_790713 ?auto_790721 ) ) ( not ( = ?auto_790713 ?auto_790722 ) ) ( not ( = ?auto_790713 ?auto_790723 ) ) ( not ( = ?auto_790713 ?auto_790724 ) ) ( not ( = ?auto_790713 ?auto_790725 ) ) ( not ( = ?auto_790714 ?auto_790715 ) ) ( not ( = ?auto_790714 ?auto_790716 ) ) ( not ( = ?auto_790714 ?auto_790717 ) ) ( not ( = ?auto_790714 ?auto_790718 ) ) ( not ( = ?auto_790714 ?auto_790719 ) ) ( not ( = ?auto_790714 ?auto_790720 ) ) ( not ( = ?auto_790714 ?auto_790721 ) ) ( not ( = ?auto_790714 ?auto_790722 ) ) ( not ( = ?auto_790714 ?auto_790723 ) ) ( not ( = ?auto_790714 ?auto_790724 ) ) ( not ( = ?auto_790714 ?auto_790725 ) ) ( not ( = ?auto_790715 ?auto_790716 ) ) ( not ( = ?auto_790715 ?auto_790717 ) ) ( not ( = ?auto_790715 ?auto_790718 ) ) ( not ( = ?auto_790715 ?auto_790719 ) ) ( not ( = ?auto_790715 ?auto_790720 ) ) ( not ( = ?auto_790715 ?auto_790721 ) ) ( not ( = ?auto_790715 ?auto_790722 ) ) ( not ( = ?auto_790715 ?auto_790723 ) ) ( not ( = ?auto_790715 ?auto_790724 ) ) ( not ( = ?auto_790715 ?auto_790725 ) ) ( not ( = ?auto_790716 ?auto_790717 ) ) ( not ( = ?auto_790716 ?auto_790718 ) ) ( not ( = ?auto_790716 ?auto_790719 ) ) ( not ( = ?auto_790716 ?auto_790720 ) ) ( not ( = ?auto_790716 ?auto_790721 ) ) ( not ( = ?auto_790716 ?auto_790722 ) ) ( not ( = ?auto_790716 ?auto_790723 ) ) ( not ( = ?auto_790716 ?auto_790724 ) ) ( not ( = ?auto_790716 ?auto_790725 ) ) ( not ( = ?auto_790717 ?auto_790718 ) ) ( not ( = ?auto_790717 ?auto_790719 ) ) ( not ( = ?auto_790717 ?auto_790720 ) ) ( not ( = ?auto_790717 ?auto_790721 ) ) ( not ( = ?auto_790717 ?auto_790722 ) ) ( not ( = ?auto_790717 ?auto_790723 ) ) ( not ( = ?auto_790717 ?auto_790724 ) ) ( not ( = ?auto_790717 ?auto_790725 ) ) ( not ( = ?auto_790718 ?auto_790719 ) ) ( not ( = ?auto_790718 ?auto_790720 ) ) ( not ( = ?auto_790718 ?auto_790721 ) ) ( not ( = ?auto_790718 ?auto_790722 ) ) ( not ( = ?auto_790718 ?auto_790723 ) ) ( not ( = ?auto_790718 ?auto_790724 ) ) ( not ( = ?auto_790718 ?auto_790725 ) ) ( not ( = ?auto_790719 ?auto_790720 ) ) ( not ( = ?auto_790719 ?auto_790721 ) ) ( not ( = ?auto_790719 ?auto_790722 ) ) ( not ( = ?auto_790719 ?auto_790723 ) ) ( not ( = ?auto_790719 ?auto_790724 ) ) ( not ( = ?auto_790719 ?auto_790725 ) ) ( not ( = ?auto_790720 ?auto_790721 ) ) ( not ( = ?auto_790720 ?auto_790722 ) ) ( not ( = ?auto_790720 ?auto_790723 ) ) ( not ( = ?auto_790720 ?auto_790724 ) ) ( not ( = ?auto_790720 ?auto_790725 ) ) ( not ( = ?auto_790721 ?auto_790722 ) ) ( not ( = ?auto_790721 ?auto_790723 ) ) ( not ( = ?auto_790721 ?auto_790724 ) ) ( not ( = ?auto_790721 ?auto_790725 ) ) ( not ( = ?auto_790722 ?auto_790723 ) ) ( not ( = ?auto_790722 ?auto_790724 ) ) ( not ( = ?auto_790722 ?auto_790725 ) ) ( not ( = ?auto_790723 ?auto_790724 ) ) ( not ( = ?auto_790723 ?auto_790725 ) ) ( not ( = ?auto_790724 ?auto_790725 ) ) ( ON ?auto_790723 ?auto_790724 ) ( ON ?auto_790722 ?auto_790723 ) ( ON ?auto_790721 ?auto_790722 ) ( ON ?auto_790720 ?auto_790721 ) ( ON ?auto_790719 ?auto_790720 ) ( ON ?auto_790718 ?auto_790719 ) ( ON ?auto_790717 ?auto_790718 ) ( ON ?auto_790716 ?auto_790717 ) ( ON ?auto_790715 ?auto_790716 ) ( ON ?auto_790714 ?auto_790715 ) ( CLEAR ?auto_790712 ) ( ON ?auto_790713 ?auto_790714 ) ( CLEAR ?auto_790713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_790708 ?auto_790709 ?auto_790710 ?auto_790711 ?auto_790712 ?auto_790713 )
      ( MAKE-17PILE ?auto_790708 ?auto_790709 ?auto_790710 ?auto_790711 ?auto_790712 ?auto_790713 ?auto_790714 ?auto_790715 ?auto_790716 ?auto_790717 ?auto_790718 ?auto_790719 ?auto_790720 ?auto_790721 ?auto_790722 ?auto_790723 ?auto_790724 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790778 - BLOCK
      ?auto_790779 - BLOCK
      ?auto_790780 - BLOCK
      ?auto_790781 - BLOCK
      ?auto_790782 - BLOCK
      ?auto_790783 - BLOCK
      ?auto_790784 - BLOCK
      ?auto_790785 - BLOCK
      ?auto_790786 - BLOCK
      ?auto_790787 - BLOCK
      ?auto_790788 - BLOCK
      ?auto_790789 - BLOCK
      ?auto_790790 - BLOCK
      ?auto_790791 - BLOCK
      ?auto_790792 - BLOCK
      ?auto_790793 - BLOCK
      ?auto_790794 - BLOCK
    )
    :vars
    (
      ?auto_790795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790794 ?auto_790795 ) ( ON-TABLE ?auto_790778 ) ( ON ?auto_790779 ?auto_790778 ) ( ON ?auto_790780 ?auto_790779 ) ( ON ?auto_790781 ?auto_790780 ) ( not ( = ?auto_790778 ?auto_790779 ) ) ( not ( = ?auto_790778 ?auto_790780 ) ) ( not ( = ?auto_790778 ?auto_790781 ) ) ( not ( = ?auto_790778 ?auto_790782 ) ) ( not ( = ?auto_790778 ?auto_790783 ) ) ( not ( = ?auto_790778 ?auto_790784 ) ) ( not ( = ?auto_790778 ?auto_790785 ) ) ( not ( = ?auto_790778 ?auto_790786 ) ) ( not ( = ?auto_790778 ?auto_790787 ) ) ( not ( = ?auto_790778 ?auto_790788 ) ) ( not ( = ?auto_790778 ?auto_790789 ) ) ( not ( = ?auto_790778 ?auto_790790 ) ) ( not ( = ?auto_790778 ?auto_790791 ) ) ( not ( = ?auto_790778 ?auto_790792 ) ) ( not ( = ?auto_790778 ?auto_790793 ) ) ( not ( = ?auto_790778 ?auto_790794 ) ) ( not ( = ?auto_790778 ?auto_790795 ) ) ( not ( = ?auto_790779 ?auto_790780 ) ) ( not ( = ?auto_790779 ?auto_790781 ) ) ( not ( = ?auto_790779 ?auto_790782 ) ) ( not ( = ?auto_790779 ?auto_790783 ) ) ( not ( = ?auto_790779 ?auto_790784 ) ) ( not ( = ?auto_790779 ?auto_790785 ) ) ( not ( = ?auto_790779 ?auto_790786 ) ) ( not ( = ?auto_790779 ?auto_790787 ) ) ( not ( = ?auto_790779 ?auto_790788 ) ) ( not ( = ?auto_790779 ?auto_790789 ) ) ( not ( = ?auto_790779 ?auto_790790 ) ) ( not ( = ?auto_790779 ?auto_790791 ) ) ( not ( = ?auto_790779 ?auto_790792 ) ) ( not ( = ?auto_790779 ?auto_790793 ) ) ( not ( = ?auto_790779 ?auto_790794 ) ) ( not ( = ?auto_790779 ?auto_790795 ) ) ( not ( = ?auto_790780 ?auto_790781 ) ) ( not ( = ?auto_790780 ?auto_790782 ) ) ( not ( = ?auto_790780 ?auto_790783 ) ) ( not ( = ?auto_790780 ?auto_790784 ) ) ( not ( = ?auto_790780 ?auto_790785 ) ) ( not ( = ?auto_790780 ?auto_790786 ) ) ( not ( = ?auto_790780 ?auto_790787 ) ) ( not ( = ?auto_790780 ?auto_790788 ) ) ( not ( = ?auto_790780 ?auto_790789 ) ) ( not ( = ?auto_790780 ?auto_790790 ) ) ( not ( = ?auto_790780 ?auto_790791 ) ) ( not ( = ?auto_790780 ?auto_790792 ) ) ( not ( = ?auto_790780 ?auto_790793 ) ) ( not ( = ?auto_790780 ?auto_790794 ) ) ( not ( = ?auto_790780 ?auto_790795 ) ) ( not ( = ?auto_790781 ?auto_790782 ) ) ( not ( = ?auto_790781 ?auto_790783 ) ) ( not ( = ?auto_790781 ?auto_790784 ) ) ( not ( = ?auto_790781 ?auto_790785 ) ) ( not ( = ?auto_790781 ?auto_790786 ) ) ( not ( = ?auto_790781 ?auto_790787 ) ) ( not ( = ?auto_790781 ?auto_790788 ) ) ( not ( = ?auto_790781 ?auto_790789 ) ) ( not ( = ?auto_790781 ?auto_790790 ) ) ( not ( = ?auto_790781 ?auto_790791 ) ) ( not ( = ?auto_790781 ?auto_790792 ) ) ( not ( = ?auto_790781 ?auto_790793 ) ) ( not ( = ?auto_790781 ?auto_790794 ) ) ( not ( = ?auto_790781 ?auto_790795 ) ) ( not ( = ?auto_790782 ?auto_790783 ) ) ( not ( = ?auto_790782 ?auto_790784 ) ) ( not ( = ?auto_790782 ?auto_790785 ) ) ( not ( = ?auto_790782 ?auto_790786 ) ) ( not ( = ?auto_790782 ?auto_790787 ) ) ( not ( = ?auto_790782 ?auto_790788 ) ) ( not ( = ?auto_790782 ?auto_790789 ) ) ( not ( = ?auto_790782 ?auto_790790 ) ) ( not ( = ?auto_790782 ?auto_790791 ) ) ( not ( = ?auto_790782 ?auto_790792 ) ) ( not ( = ?auto_790782 ?auto_790793 ) ) ( not ( = ?auto_790782 ?auto_790794 ) ) ( not ( = ?auto_790782 ?auto_790795 ) ) ( not ( = ?auto_790783 ?auto_790784 ) ) ( not ( = ?auto_790783 ?auto_790785 ) ) ( not ( = ?auto_790783 ?auto_790786 ) ) ( not ( = ?auto_790783 ?auto_790787 ) ) ( not ( = ?auto_790783 ?auto_790788 ) ) ( not ( = ?auto_790783 ?auto_790789 ) ) ( not ( = ?auto_790783 ?auto_790790 ) ) ( not ( = ?auto_790783 ?auto_790791 ) ) ( not ( = ?auto_790783 ?auto_790792 ) ) ( not ( = ?auto_790783 ?auto_790793 ) ) ( not ( = ?auto_790783 ?auto_790794 ) ) ( not ( = ?auto_790783 ?auto_790795 ) ) ( not ( = ?auto_790784 ?auto_790785 ) ) ( not ( = ?auto_790784 ?auto_790786 ) ) ( not ( = ?auto_790784 ?auto_790787 ) ) ( not ( = ?auto_790784 ?auto_790788 ) ) ( not ( = ?auto_790784 ?auto_790789 ) ) ( not ( = ?auto_790784 ?auto_790790 ) ) ( not ( = ?auto_790784 ?auto_790791 ) ) ( not ( = ?auto_790784 ?auto_790792 ) ) ( not ( = ?auto_790784 ?auto_790793 ) ) ( not ( = ?auto_790784 ?auto_790794 ) ) ( not ( = ?auto_790784 ?auto_790795 ) ) ( not ( = ?auto_790785 ?auto_790786 ) ) ( not ( = ?auto_790785 ?auto_790787 ) ) ( not ( = ?auto_790785 ?auto_790788 ) ) ( not ( = ?auto_790785 ?auto_790789 ) ) ( not ( = ?auto_790785 ?auto_790790 ) ) ( not ( = ?auto_790785 ?auto_790791 ) ) ( not ( = ?auto_790785 ?auto_790792 ) ) ( not ( = ?auto_790785 ?auto_790793 ) ) ( not ( = ?auto_790785 ?auto_790794 ) ) ( not ( = ?auto_790785 ?auto_790795 ) ) ( not ( = ?auto_790786 ?auto_790787 ) ) ( not ( = ?auto_790786 ?auto_790788 ) ) ( not ( = ?auto_790786 ?auto_790789 ) ) ( not ( = ?auto_790786 ?auto_790790 ) ) ( not ( = ?auto_790786 ?auto_790791 ) ) ( not ( = ?auto_790786 ?auto_790792 ) ) ( not ( = ?auto_790786 ?auto_790793 ) ) ( not ( = ?auto_790786 ?auto_790794 ) ) ( not ( = ?auto_790786 ?auto_790795 ) ) ( not ( = ?auto_790787 ?auto_790788 ) ) ( not ( = ?auto_790787 ?auto_790789 ) ) ( not ( = ?auto_790787 ?auto_790790 ) ) ( not ( = ?auto_790787 ?auto_790791 ) ) ( not ( = ?auto_790787 ?auto_790792 ) ) ( not ( = ?auto_790787 ?auto_790793 ) ) ( not ( = ?auto_790787 ?auto_790794 ) ) ( not ( = ?auto_790787 ?auto_790795 ) ) ( not ( = ?auto_790788 ?auto_790789 ) ) ( not ( = ?auto_790788 ?auto_790790 ) ) ( not ( = ?auto_790788 ?auto_790791 ) ) ( not ( = ?auto_790788 ?auto_790792 ) ) ( not ( = ?auto_790788 ?auto_790793 ) ) ( not ( = ?auto_790788 ?auto_790794 ) ) ( not ( = ?auto_790788 ?auto_790795 ) ) ( not ( = ?auto_790789 ?auto_790790 ) ) ( not ( = ?auto_790789 ?auto_790791 ) ) ( not ( = ?auto_790789 ?auto_790792 ) ) ( not ( = ?auto_790789 ?auto_790793 ) ) ( not ( = ?auto_790789 ?auto_790794 ) ) ( not ( = ?auto_790789 ?auto_790795 ) ) ( not ( = ?auto_790790 ?auto_790791 ) ) ( not ( = ?auto_790790 ?auto_790792 ) ) ( not ( = ?auto_790790 ?auto_790793 ) ) ( not ( = ?auto_790790 ?auto_790794 ) ) ( not ( = ?auto_790790 ?auto_790795 ) ) ( not ( = ?auto_790791 ?auto_790792 ) ) ( not ( = ?auto_790791 ?auto_790793 ) ) ( not ( = ?auto_790791 ?auto_790794 ) ) ( not ( = ?auto_790791 ?auto_790795 ) ) ( not ( = ?auto_790792 ?auto_790793 ) ) ( not ( = ?auto_790792 ?auto_790794 ) ) ( not ( = ?auto_790792 ?auto_790795 ) ) ( not ( = ?auto_790793 ?auto_790794 ) ) ( not ( = ?auto_790793 ?auto_790795 ) ) ( not ( = ?auto_790794 ?auto_790795 ) ) ( ON ?auto_790793 ?auto_790794 ) ( ON ?auto_790792 ?auto_790793 ) ( ON ?auto_790791 ?auto_790792 ) ( ON ?auto_790790 ?auto_790791 ) ( ON ?auto_790789 ?auto_790790 ) ( ON ?auto_790788 ?auto_790789 ) ( ON ?auto_790787 ?auto_790788 ) ( ON ?auto_790786 ?auto_790787 ) ( ON ?auto_790785 ?auto_790786 ) ( ON ?auto_790784 ?auto_790785 ) ( ON ?auto_790783 ?auto_790784 ) ( CLEAR ?auto_790781 ) ( ON ?auto_790782 ?auto_790783 ) ( CLEAR ?auto_790782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_790778 ?auto_790779 ?auto_790780 ?auto_790781 ?auto_790782 )
      ( MAKE-17PILE ?auto_790778 ?auto_790779 ?auto_790780 ?auto_790781 ?auto_790782 ?auto_790783 ?auto_790784 ?auto_790785 ?auto_790786 ?auto_790787 ?auto_790788 ?auto_790789 ?auto_790790 ?auto_790791 ?auto_790792 ?auto_790793 ?auto_790794 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790848 - BLOCK
      ?auto_790849 - BLOCK
      ?auto_790850 - BLOCK
      ?auto_790851 - BLOCK
      ?auto_790852 - BLOCK
      ?auto_790853 - BLOCK
      ?auto_790854 - BLOCK
      ?auto_790855 - BLOCK
      ?auto_790856 - BLOCK
      ?auto_790857 - BLOCK
      ?auto_790858 - BLOCK
      ?auto_790859 - BLOCK
      ?auto_790860 - BLOCK
      ?auto_790861 - BLOCK
      ?auto_790862 - BLOCK
      ?auto_790863 - BLOCK
      ?auto_790864 - BLOCK
    )
    :vars
    (
      ?auto_790865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790864 ?auto_790865 ) ( ON-TABLE ?auto_790848 ) ( ON ?auto_790849 ?auto_790848 ) ( ON ?auto_790850 ?auto_790849 ) ( not ( = ?auto_790848 ?auto_790849 ) ) ( not ( = ?auto_790848 ?auto_790850 ) ) ( not ( = ?auto_790848 ?auto_790851 ) ) ( not ( = ?auto_790848 ?auto_790852 ) ) ( not ( = ?auto_790848 ?auto_790853 ) ) ( not ( = ?auto_790848 ?auto_790854 ) ) ( not ( = ?auto_790848 ?auto_790855 ) ) ( not ( = ?auto_790848 ?auto_790856 ) ) ( not ( = ?auto_790848 ?auto_790857 ) ) ( not ( = ?auto_790848 ?auto_790858 ) ) ( not ( = ?auto_790848 ?auto_790859 ) ) ( not ( = ?auto_790848 ?auto_790860 ) ) ( not ( = ?auto_790848 ?auto_790861 ) ) ( not ( = ?auto_790848 ?auto_790862 ) ) ( not ( = ?auto_790848 ?auto_790863 ) ) ( not ( = ?auto_790848 ?auto_790864 ) ) ( not ( = ?auto_790848 ?auto_790865 ) ) ( not ( = ?auto_790849 ?auto_790850 ) ) ( not ( = ?auto_790849 ?auto_790851 ) ) ( not ( = ?auto_790849 ?auto_790852 ) ) ( not ( = ?auto_790849 ?auto_790853 ) ) ( not ( = ?auto_790849 ?auto_790854 ) ) ( not ( = ?auto_790849 ?auto_790855 ) ) ( not ( = ?auto_790849 ?auto_790856 ) ) ( not ( = ?auto_790849 ?auto_790857 ) ) ( not ( = ?auto_790849 ?auto_790858 ) ) ( not ( = ?auto_790849 ?auto_790859 ) ) ( not ( = ?auto_790849 ?auto_790860 ) ) ( not ( = ?auto_790849 ?auto_790861 ) ) ( not ( = ?auto_790849 ?auto_790862 ) ) ( not ( = ?auto_790849 ?auto_790863 ) ) ( not ( = ?auto_790849 ?auto_790864 ) ) ( not ( = ?auto_790849 ?auto_790865 ) ) ( not ( = ?auto_790850 ?auto_790851 ) ) ( not ( = ?auto_790850 ?auto_790852 ) ) ( not ( = ?auto_790850 ?auto_790853 ) ) ( not ( = ?auto_790850 ?auto_790854 ) ) ( not ( = ?auto_790850 ?auto_790855 ) ) ( not ( = ?auto_790850 ?auto_790856 ) ) ( not ( = ?auto_790850 ?auto_790857 ) ) ( not ( = ?auto_790850 ?auto_790858 ) ) ( not ( = ?auto_790850 ?auto_790859 ) ) ( not ( = ?auto_790850 ?auto_790860 ) ) ( not ( = ?auto_790850 ?auto_790861 ) ) ( not ( = ?auto_790850 ?auto_790862 ) ) ( not ( = ?auto_790850 ?auto_790863 ) ) ( not ( = ?auto_790850 ?auto_790864 ) ) ( not ( = ?auto_790850 ?auto_790865 ) ) ( not ( = ?auto_790851 ?auto_790852 ) ) ( not ( = ?auto_790851 ?auto_790853 ) ) ( not ( = ?auto_790851 ?auto_790854 ) ) ( not ( = ?auto_790851 ?auto_790855 ) ) ( not ( = ?auto_790851 ?auto_790856 ) ) ( not ( = ?auto_790851 ?auto_790857 ) ) ( not ( = ?auto_790851 ?auto_790858 ) ) ( not ( = ?auto_790851 ?auto_790859 ) ) ( not ( = ?auto_790851 ?auto_790860 ) ) ( not ( = ?auto_790851 ?auto_790861 ) ) ( not ( = ?auto_790851 ?auto_790862 ) ) ( not ( = ?auto_790851 ?auto_790863 ) ) ( not ( = ?auto_790851 ?auto_790864 ) ) ( not ( = ?auto_790851 ?auto_790865 ) ) ( not ( = ?auto_790852 ?auto_790853 ) ) ( not ( = ?auto_790852 ?auto_790854 ) ) ( not ( = ?auto_790852 ?auto_790855 ) ) ( not ( = ?auto_790852 ?auto_790856 ) ) ( not ( = ?auto_790852 ?auto_790857 ) ) ( not ( = ?auto_790852 ?auto_790858 ) ) ( not ( = ?auto_790852 ?auto_790859 ) ) ( not ( = ?auto_790852 ?auto_790860 ) ) ( not ( = ?auto_790852 ?auto_790861 ) ) ( not ( = ?auto_790852 ?auto_790862 ) ) ( not ( = ?auto_790852 ?auto_790863 ) ) ( not ( = ?auto_790852 ?auto_790864 ) ) ( not ( = ?auto_790852 ?auto_790865 ) ) ( not ( = ?auto_790853 ?auto_790854 ) ) ( not ( = ?auto_790853 ?auto_790855 ) ) ( not ( = ?auto_790853 ?auto_790856 ) ) ( not ( = ?auto_790853 ?auto_790857 ) ) ( not ( = ?auto_790853 ?auto_790858 ) ) ( not ( = ?auto_790853 ?auto_790859 ) ) ( not ( = ?auto_790853 ?auto_790860 ) ) ( not ( = ?auto_790853 ?auto_790861 ) ) ( not ( = ?auto_790853 ?auto_790862 ) ) ( not ( = ?auto_790853 ?auto_790863 ) ) ( not ( = ?auto_790853 ?auto_790864 ) ) ( not ( = ?auto_790853 ?auto_790865 ) ) ( not ( = ?auto_790854 ?auto_790855 ) ) ( not ( = ?auto_790854 ?auto_790856 ) ) ( not ( = ?auto_790854 ?auto_790857 ) ) ( not ( = ?auto_790854 ?auto_790858 ) ) ( not ( = ?auto_790854 ?auto_790859 ) ) ( not ( = ?auto_790854 ?auto_790860 ) ) ( not ( = ?auto_790854 ?auto_790861 ) ) ( not ( = ?auto_790854 ?auto_790862 ) ) ( not ( = ?auto_790854 ?auto_790863 ) ) ( not ( = ?auto_790854 ?auto_790864 ) ) ( not ( = ?auto_790854 ?auto_790865 ) ) ( not ( = ?auto_790855 ?auto_790856 ) ) ( not ( = ?auto_790855 ?auto_790857 ) ) ( not ( = ?auto_790855 ?auto_790858 ) ) ( not ( = ?auto_790855 ?auto_790859 ) ) ( not ( = ?auto_790855 ?auto_790860 ) ) ( not ( = ?auto_790855 ?auto_790861 ) ) ( not ( = ?auto_790855 ?auto_790862 ) ) ( not ( = ?auto_790855 ?auto_790863 ) ) ( not ( = ?auto_790855 ?auto_790864 ) ) ( not ( = ?auto_790855 ?auto_790865 ) ) ( not ( = ?auto_790856 ?auto_790857 ) ) ( not ( = ?auto_790856 ?auto_790858 ) ) ( not ( = ?auto_790856 ?auto_790859 ) ) ( not ( = ?auto_790856 ?auto_790860 ) ) ( not ( = ?auto_790856 ?auto_790861 ) ) ( not ( = ?auto_790856 ?auto_790862 ) ) ( not ( = ?auto_790856 ?auto_790863 ) ) ( not ( = ?auto_790856 ?auto_790864 ) ) ( not ( = ?auto_790856 ?auto_790865 ) ) ( not ( = ?auto_790857 ?auto_790858 ) ) ( not ( = ?auto_790857 ?auto_790859 ) ) ( not ( = ?auto_790857 ?auto_790860 ) ) ( not ( = ?auto_790857 ?auto_790861 ) ) ( not ( = ?auto_790857 ?auto_790862 ) ) ( not ( = ?auto_790857 ?auto_790863 ) ) ( not ( = ?auto_790857 ?auto_790864 ) ) ( not ( = ?auto_790857 ?auto_790865 ) ) ( not ( = ?auto_790858 ?auto_790859 ) ) ( not ( = ?auto_790858 ?auto_790860 ) ) ( not ( = ?auto_790858 ?auto_790861 ) ) ( not ( = ?auto_790858 ?auto_790862 ) ) ( not ( = ?auto_790858 ?auto_790863 ) ) ( not ( = ?auto_790858 ?auto_790864 ) ) ( not ( = ?auto_790858 ?auto_790865 ) ) ( not ( = ?auto_790859 ?auto_790860 ) ) ( not ( = ?auto_790859 ?auto_790861 ) ) ( not ( = ?auto_790859 ?auto_790862 ) ) ( not ( = ?auto_790859 ?auto_790863 ) ) ( not ( = ?auto_790859 ?auto_790864 ) ) ( not ( = ?auto_790859 ?auto_790865 ) ) ( not ( = ?auto_790860 ?auto_790861 ) ) ( not ( = ?auto_790860 ?auto_790862 ) ) ( not ( = ?auto_790860 ?auto_790863 ) ) ( not ( = ?auto_790860 ?auto_790864 ) ) ( not ( = ?auto_790860 ?auto_790865 ) ) ( not ( = ?auto_790861 ?auto_790862 ) ) ( not ( = ?auto_790861 ?auto_790863 ) ) ( not ( = ?auto_790861 ?auto_790864 ) ) ( not ( = ?auto_790861 ?auto_790865 ) ) ( not ( = ?auto_790862 ?auto_790863 ) ) ( not ( = ?auto_790862 ?auto_790864 ) ) ( not ( = ?auto_790862 ?auto_790865 ) ) ( not ( = ?auto_790863 ?auto_790864 ) ) ( not ( = ?auto_790863 ?auto_790865 ) ) ( not ( = ?auto_790864 ?auto_790865 ) ) ( ON ?auto_790863 ?auto_790864 ) ( ON ?auto_790862 ?auto_790863 ) ( ON ?auto_790861 ?auto_790862 ) ( ON ?auto_790860 ?auto_790861 ) ( ON ?auto_790859 ?auto_790860 ) ( ON ?auto_790858 ?auto_790859 ) ( ON ?auto_790857 ?auto_790858 ) ( ON ?auto_790856 ?auto_790857 ) ( ON ?auto_790855 ?auto_790856 ) ( ON ?auto_790854 ?auto_790855 ) ( ON ?auto_790853 ?auto_790854 ) ( ON ?auto_790852 ?auto_790853 ) ( CLEAR ?auto_790850 ) ( ON ?auto_790851 ?auto_790852 ) ( CLEAR ?auto_790851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_790848 ?auto_790849 ?auto_790850 ?auto_790851 )
      ( MAKE-17PILE ?auto_790848 ?auto_790849 ?auto_790850 ?auto_790851 ?auto_790852 ?auto_790853 ?auto_790854 ?auto_790855 ?auto_790856 ?auto_790857 ?auto_790858 ?auto_790859 ?auto_790860 ?auto_790861 ?auto_790862 ?auto_790863 ?auto_790864 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790918 - BLOCK
      ?auto_790919 - BLOCK
      ?auto_790920 - BLOCK
      ?auto_790921 - BLOCK
      ?auto_790922 - BLOCK
      ?auto_790923 - BLOCK
      ?auto_790924 - BLOCK
      ?auto_790925 - BLOCK
      ?auto_790926 - BLOCK
      ?auto_790927 - BLOCK
      ?auto_790928 - BLOCK
      ?auto_790929 - BLOCK
      ?auto_790930 - BLOCK
      ?auto_790931 - BLOCK
      ?auto_790932 - BLOCK
      ?auto_790933 - BLOCK
      ?auto_790934 - BLOCK
    )
    :vars
    (
      ?auto_790935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790934 ?auto_790935 ) ( ON-TABLE ?auto_790918 ) ( ON ?auto_790919 ?auto_790918 ) ( not ( = ?auto_790918 ?auto_790919 ) ) ( not ( = ?auto_790918 ?auto_790920 ) ) ( not ( = ?auto_790918 ?auto_790921 ) ) ( not ( = ?auto_790918 ?auto_790922 ) ) ( not ( = ?auto_790918 ?auto_790923 ) ) ( not ( = ?auto_790918 ?auto_790924 ) ) ( not ( = ?auto_790918 ?auto_790925 ) ) ( not ( = ?auto_790918 ?auto_790926 ) ) ( not ( = ?auto_790918 ?auto_790927 ) ) ( not ( = ?auto_790918 ?auto_790928 ) ) ( not ( = ?auto_790918 ?auto_790929 ) ) ( not ( = ?auto_790918 ?auto_790930 ) ) ( not ( = ?auto_790918 ?auto_790931 ) ) ( not ( = ?auto_790918 ?auto_790932 ) ) ( not ( = ?auto_790918 ?auto_790933 ) ) ( not ( = ?auto_790918 ?auto_790934 ) ) ( not ( = ?auto_790918 ?auto_790935 ) ) ( not ( = ?auto_790919 ?auto_790920 ) ) ( not ( = ?auto_790919 ?auto_790921 ) ) ( not ( = ?auto_790919 ?auto_790922 ) ) ( not ( = ?auto_790919 ?auto_790923 ) ) ( not ( = ?auto_790919 ?auto_790924 ) ) ( not ( = ?auto_790919 ?auto_790925 ) ) ( not ( = ?auto_790919 ?auto_790926 ) ) ( not ( = ?auto_790919 ?auto_790927 ) ) ( not ( = ?auto_790919 ?auto_790928 ) ) ( not ( = ?auto_790919 ?auto_790929 ) ) ( not ( = ?auto_790919 ?auto_790930 ) ) ( not ( = ?auto_790919 ?auto_790931 ) ) ( not ( = ?auto_790919 ?auto_790932 ) ) ( not ( = ?auto_790919 ?auto_790933 ) ) ( not ( = ?auto_790919 ?auto_790934 ) ) ( not ( = ?auto_790919 ?auto_790935 ) ) ( not ( = ?auto_790920 ?auto_790921 ) ) ( not ( = ?auto_790920 ?auto_790922 ) ) ( not ( = ?auto_790920 ?auto_790923 ) ) ( not ( = ?auto_790920 ?auto_790924 ) ) ( not ( = ?auto_790920 ?auto_790925 ) ) ( not ( = ?auto_790920 ?auto_790926 ) ) ( not ( = ?auto_790920 ?auto_790927 ) ) ( not ( = ?auto_790920 ?auto_790928 ) ) ( not ( = ?auto_790920 ?auto_790929 ) ) ( not ( = ?auto_790920 ?auto_790930 ) ) ( not ( = ?auto_790920 ?auto_790931 ) ) ( not ( = ?auto_790920 ?auto_790932 ) ) ( not ( = ?auto_790920 ?auto_790933 ) ) ( not ( = ?auto_790920 ?auto_790934 ) ) ( not ( = ?auto_790920 ?auto_790935 ) ) ( not ( = ?auto_790921 ?auto_790922 ) ) ( not ( = ?auto_790921 ?auto_790923 ) ) ( not ( = ?auto_790921 ?auto_790924 ) ) ( not ( = ?auto_790921 ?auto_790925 ) ) ( not ( = ?auto_790921 ?auto_790926 ) ) ( not ( = ?auto_790921 ?auto_790927 ) ) ( not ( = ?auto_790921 ?auto_790928 ) ) ( not ( = ?auto_790921 ?auto_790929 ) ) ( not ( = ?auto_790921 ?auto_790930 ) ) ( not ( = ?auto_790921 ?auto_790931 ) ) ( not ( = ?auto_790921 ?auto_790932 ) ) ( not ( = ?auto_790921 ?auto_790933 ) ) ( not ( = ?auto_790921 ?auto_790934 ) ) ( not ( = ?auto_790921 ?auto_790935 ) ) ( not ( = ?auto_790922 ?auto_790923 ) ) ( not ( = ?auto_790922 ?auto_790924 ) ) ( not ( = ?auto_790922 ?auto_790925 ) ) ( not ( = ?auto_790922 ?auto_790926 ) ) ( not ( = ?auto_790922 ?auto_790927 ) ) ( not ( = ?auto_790922 ?auto_790928 ) ) ( not ( = ?auto_790922 ?auto_790929 ) ) ( not ( = ?auto_790922 ?auto_790930 ) ) ( not ( = ?auto_790922 ?auto_790931 ) ) ( not ( = ?auto_790922 ?auto_790932 ) ) ( not ( = ?auto_790922 ?auto_790933 ) ) ( not ( = ?auto_790922 ?auto_790934 ) ) ( not ( = ?auto_790922 ?auto_790935 ) ) ( not ( = ?auto_790923 ?auto_790924 ) ) ( not ( = ?auto_790923 ?auto_790925 ) ) ( not ( = ?auto_790923 ?auto_790926 ) ) ( not ( = ?auto_790923 ?auto_790927 ) ) ( not ( = ?auto_790923 ?auto_790928 ) ) ( not ( = ?auto_790923 ?auto_790929 ) ) ( not ( = ?auto_790923 ?auto_790930 ) ) ( not ( = ?auto_790923 ?auto_790931 ) ) ( not ( = ?auto_790923 ?auto_790932 ) ) ( not ( = ?auto_790923 ?auto_790933 ) ) ( not ( = ?auto_790923 ?auto_790934 ) ) ( not ( = ?auto_790923 ?auto_790935 ) ) ( not ( = ?auto_790924 ?auto_790925 ) ) ( not ( = ?auto_790924 ?auto_790926 ) ) ( not ( = ?auto_790924 ?auto_790927 ) ) ( not ( = ?auto_790924 ?auto_790928 ) ) ( not ( = ?auto_790924 ?auto_790929 ) ) ( not ( = ?auto_790924 ?auto_790930 ) ) ( not ( = ?auto_790924 ?auto_790931 ) ) ( not ( = ?auto_790924 ?auto_790932 ) ) ( not ( = ?auto_790924 ?auto_790933 ) ) ( not ( = ?auto_790924 ?auto_790934 ) ) ( not ( = ?auto_790924 ?auto_790935 ) ) ( not ( = ?auto_790925 ?auto_790926 ) ) ( not ( = ?auto_790925 ?auto_790927 ) ) ( not ( = ?auto_790925 ?auto_790928 ) ) ( not ( = ?auto_790925 ?auto_790929 ) ) ( not ( = ?auto_790925 ?auto_790930 ) ) ( not ( = ?auto_790925 ?auto_790931 ) ) ( not ( = ?auto_790925 ?auto_790932 ) ) ( not ( = ?auto_790925 ?auto_790933 ) ) ( not ( = ?auto_790925 ?auto_790934 ) ) ( not ( = ?auto_790925 ?auto_790935 ) ) ( not ( = ?auto_790926 ?auto_790927 ) ) ( not ( = ?auto_790926 ?auto_790928 ) ) ( not ( = ?auto_790926 ?auto_790929 ) ) ( not ( = ?auto_790926 ?auto_790930 ) ) ( not ( = ?auto_790926 ?auto_790931 ) ) ( not ( = ?auto_790926 ?auto_790932 ) ) ( not ( = ?auto_790926 ?auto_790933 ) ) ( not ( = ?auto_790926 ?auto_790934 ) ) ( not ( = ?auto_790926 ?auto_790935 ) ) ( not ( = ?auto_790927 ?auto_790928 ) ) ( not ( = ?auto_790927 ?auto_790929 ) ) ( not ( = ?auto_790927 ?auto_790930 ) ) ( not ( = ?auto_790927 ?auto_790931 ) ) ( not ( = ?auto_790927 ?auto_790932 ) ) ( not ( = ?auto_790927 ?auto_790933 ) ) ( not ( = ?auto_790927 ?auto_790934 ) ) ( not ( = ?auto_790927 ?auto_790935 ) ) ( not ( = ?auto_790928 ?auto_790929 ) ) ( not ( = ?auto_790928 ?auto_790930 ) ) ( not ( = ?auto_790928 ?auto_790931 ) ) ( not ( = ?auto_790928 ?auto_790932 ) ) ( not ( = ?auto_790928 ?auto_790933 ) ) ( not ( = ?auto_790928 ?auto_790934 ) ) ( not ( = ?auto_790928 ?auto_790935 ) ) ( not ( = ?auto_790929 ?auto_790930 ) ) ( not ( = ?auto_790929 ?auto_790931 ) ) ( not ( = ?auto_790929 ?auto_790932 ) ) ( not ( = ?auto_790929 ?auto_790933 ) ) ( not ( = ?auto_790929 ?auto_790934 ) ) ( not ( = ?auto_790929 ?auto_790935 ) ) ( not ( = ?auto_790930 ?auto_790931 ) ) ( not ( = ?auto_790930 ?auto_790932 ) ) ( not ( = ?auto_790930 ?auto_790933 ) ) ( not ( = ?auto_790930 ?auto_790934 ) ) ( not ( = ?auto_790930 ?auto_790935 ) ) ( not ( = ?auto_790931 ?auto_790932 ) ) ( not ( = ?auto_790931 ?auto_790933 ) ) ( not ( = ?auto_790931 ?auto_790934 ) ) ( not ( = ?auto_790931 ?auto_790935 ) ) ( not ( = ?auto_790932 ?auto_790933 ) ) ( not ( = ?auto_790932 ?auto_790934 ) ) ( not ( = ?auto_790932 ?auto_790935 ) ) ( not ( = ?auto_790933 ?auto_790934 ) ) ( not ( = ?auto_790933 ?auto_790935 ) ) ( not ( = ?auto_790934 ?auto_790935 ) ) ( ON ?auto_790933 ?auto_790934 ) ( ON ?auto_790932 ?auto_790933 ) ( ON ?auto_790931 ?auto_790932 ) ( ON ?auto_790930 ?auto_790931 ) ( ON ?auto_790929 ?auto_790930 ) ( ON ?auto_790928 ?auto_790929 ) ( ON ?auto_790927 ?auto_790928 ) ( ON ?auto_790926 ?auto_790927 ) ( ON ?auto_790925 ?auto_790926 ) ( ON ?auto_790924 ?auto_790925 ) ( ON ?auto_790923 ?auto_790924 ) ( ON ?auto_790922 ?auto_790923 ) ( ON ?auto_790921 ?auto_790922 ) ( CLEAR ?auto_790919 ) ( ON ?auto_790920 ?auto_790921 ) ( CLEAR ?auto_790920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_790918 ?auto_790919 ?auto_790920 )
      ( MAKE-17PILE ?auto_790918 ?auto_790919 ?auto_790920 ?auto_790921 ?auto_790922 ?auto_790923 ?auto_790924 ?auto_790925 ?auto_790926 ?auto_790927 ?auto_790928 ?auto_790929 ?auto_790930 ?auto_790931 ?auto_790932 ?auto_790933 ?auto_790934 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_790988 - BLOCK
      ?auto_790989 - BLOCK
      ?auto_790990 - BLOCK
      ?auto_790991 - BLOCK
      ?auto_790992 - BLOCK
      ?auto_790993 - BLOCK
      ?auto_790994 - BLOCK
      ?auto_790995 - BLOCK
      ?auto_790996 - BLOCK
      ?auto_790997 - BLOCK
      ?auto_790998 - BLOCK
      ?auto_790999 - BLOCK
      ?auto_791000 - BLOCK
      ?auto_791001 - BLOCK
      ?auto_791002 - BLOCK
      ?auto_791003 - BLOCK
      ?auto_791004 - BLOCK
    )
    :vars
    (
      ?auto_791005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791004 ?auto_791005 ) ( ON-TABLE ?auto_790988 ) ( not ( = ?auto_790988 ?auto_790989 ) ) ( not ( = ?auto_790988 ?auto_790990 ) ) ( not ( = ?auto_790988 ?auto_790991 ) ) ( not ( = ?auto_790988 ?auto_790992 ) ) ( not ( = ?auto_790988 ?auto_790993 ) ) ( not ( = ?auto_790988 ?auto_790994 ) ) ( not ( = ?auto_790988 ?auto_790995 ) ) ( not ( = ?auto_790988 ?auto_790996 ) ) ( not ( = ?auto_790988 ?auto_790997 ) ) ( not ( = ?auto_790988 ?auto_790998 ) ) ( not ( = ?auto_790988 ?auto_790999 ) ) ( not ( = ?auto_790988 ?auto_791000 ) ) ( not ( = ?auto_790988 ?auto_791001 ) ) ( not ( = ?auto_790988 ?auto_791002 ) ) ( not ( = ?auto_790988 ?auto_791003 ) ) ( not ( = ?auto_790988 ?auto_791004 ) ) ( not ( = ?auto_790988 ?auto_791005 ) ) ( not ( = ?auto_790989 ?auto_790990 ) ) ( not ( = ?auto_790989 ?auto_790991 ) ) ( not ( = ?auto_790989 ?auto_790992 ) ) ( not ( = ?auto_790989 ?auto_790993 ) ) ( not ( = ?auto_790989 ?auto_790994 ) ) ( not ( = ?auto_790989 ?auto_790995 ) ) ( not ( = ?auto_790989 ?auto_790996 ) ) ( not ( = ?auto_790989 ?auto_790997 ) ) ( not ( = ?auto_790989 ?auto_790998 ) ) ( not ( = ?auto_790989 ?auto_790999 ) ) ( not ( = ?auto_790989 ?auto_791000 ) ) ( not ( = ?auto_790989 ?auto_791001 ) ) ( not ( = ?auto_790989 ?auto_791002 ) ) ( not ( = ?auto_790989 ?auto_791003 ) ) ( not ( = ?auto_790989 ?auto_791004 ) ) ( not ( = ?auto_790989 ?auto_791005 ) ) ( not ( = ?auto_790990 ?auto_790991 ) ) ( not ( = ?auto_790990 ?auto_790992 ) ) ( not ( = ?auto_790990 ?auto_790993 ) ) ( not ( = ?auto_790990 ?auto_790994 ) ) ( not ( = ?auto_790990 ?auto_790995 ) ) ( not ( = ?auto_790990 ?auto_790996 ) ) ( not ( = ?auto_790990 ?auto_790997 ) ) ( not ( = ?auto_790990 ?auto_790998 ) ) ( not ( = ?auto_790990 ?auto_790999 ) ) ( not ( = ?auto_790990 ?auto_791000 ) ) ( not ( = ?auto_790990 ?auto_791001 ) ) ( not ( = ?auto_790990 ?auto_791002 ) ) ( not ( = ?auto_790990 ?auto_791003 ) ) ( not ( = ?auto_790990 ?auto_791004 ) ) ( not ( = ?auto_790990 ?auto_791005 ) ) ( not ( = ?auto_790991 ?auto_790992 ) ) ( not ( = ?auto_790991 ?auto_790993 ) ) ( not ( = ?auto_790991 ?auto_790994 ) ) ( not ( = ?auto_790991 ?auto_790995 ) ) ( not ( = ?auto_790991 ?auto_790996 ) ) ( not ( = ?auto_790991 ?auto_790997 ) ) ( not ( = ?auto_790991 ?auto_790998 ) ) ( not ( = ?auto_790991 ?auto_790999 ) ) ( not ( = ?auto_790991 ?auto_791000 ) ) ( not ( = ?auto_790991 ?auto_791001 ) ) ( not ( = ?auto_790991 ?auto_791002 ) ) ( not ( = ?auto_790991 ?auto_791003 ) ) ( not ( = ?auto_790991 ?auto_791004 ) ) ( not ( = ?auto_790991 ?auto_791005 ) ) ( not ( = ?auto_790992 ?auto_790993 ) ) ( not ( = ?auto_790992 ?auto_790994 ) ) ( not ( = ?auto_790992 ?auto_790995 ) ) ( not ( = ?auto_790992 ?auto_790996 ) ) ( not ( = ?auto_790992 ?auto_790997 ) ) ( not ( = ?auto_790992 ?auto_790998 ) ) ( not ( = ?auto_790992 ?auto_790999 ) ) ( not ( = ?auto_790992 ?auto_791000 ) ) ( not ( = ?auto_790992 ?auto_791001 ) ) ( not ( = ?auto_790992 ?auto_791002 ) ) ( not ( = ?auto_790992 ?auto_791003 ) ) ( not ( = ?auto_790992 ?auto_791004 ) ) ( not ( = ?auto_790992 ?auto_791005 ) ) ( not ( = ?auto_790993 ?auto_790994 ) ) ( not ( = ?auto_790993 ?auto_790995 ) ) ( not ( = ?auto_790993 ?auto_790996 ) ) ( not ( = ?auto_790993 ?auto_790997 ) ) ( not ( = ?auto_790993 ?auto_790998 ) ) ( not ( = ?auto_790993 ?auto_790999 ) ) ( not ( = ?auto_790993 ?auto_791000 ) ) ( not ( = ?auto_790993 ?auto_791001 ) ) ( not ( = ?auto_790993 ?auto_791002 ) ) ( not ( = ?auto_790993 ?auto_791003 ) ) ( not ( = ?auto_790993 ?auto_791004 ) ) ( not ( = ?auto_790993 ?auto_791005 ) ) ( not ( = ?auto_790994 ?auto_790995 ) ) ( not ( = ?auto_790994 ?auto_790996 ) ) ( not ( = ?auto_790994 ?auto_790997 ) ) ( not ( = ?auto_790994 ?auto_790998 ) ) ( not ( = ?auto_790994 ?auto_790999 ) ) ( not ( = ?auto_790994 ?auto_791000 ) ) ( not ( = ?auto_790994 ?auto_791001 ) ) ( not ( = ?auto_790994 ?auto_791002 ) ) ( not ( = ?auto_790994 ?auto_791003 ) ) ( not ( = ?auto_790994 ?auto_791004 ) ) ( not ( = ?auto_790994 ?auto_791005 ) ) ( not ( = ?auto_790995 ?auto_790996 ) ) ( not ( = ?auto_790995 ?auto_790997 ) ) ( not ( = ?auto_790995 ?auto_790998 ) ) ( not ( = ?auto_790995 ?auto_790999 ) ) ( not ( = ?auto_790995 ?auto_791000 ) ) ( not ( = ?auto_790995 ?auto_791001 ) ) ( not ( = ?auto_790995 ?auto_791002 ) ) ( not ( = ?auto_790995 ?auto_791003 ) ) ( not ( = ?auto_790995 ?auto_791004 ) ) ( not ( = ?auto_790995 ?auto_791005 ) ) ( not ( = ?auto_790996 ?auto_790997 ) ) ( not ( = ?auto_790996 ?auto_790998 ) ) ( not ( = ?auto_790996 ?auto_790999 ) ) ( not ( = ?auto_790996 ?auto_791000 ) ) ( not ( = ?auto_790996 ?auto_791001 ) ) ( not ( = ?auto_790996 ?auto_791002 ) ) ( not ( = ?auto_790996 ?auto_791003 ) ) ( not ( = ?auto_790996 ?auto_791004 ) ) ( not ( = ?auto_790996 ?auto_791005 ) ) ( not ( = ?auto_790997 ?auto_790998 ) ) ( not ( = ?auto_790997 ?auto_790999 ) ) ( not ( = ?auto_790997 ?auto_791000 ) ) ( not ( = ?auto_790997 ?auto_791001 ) ) ( not ( = ?auto_790997 ?auto_791002 ) ) ( not ( = ?auto_790997 ?auto_791003 ) ) ( not ( = ?auto_790997 ?auto_791004 ) ) ( not ( = ?auto_790997 ?auto_791005 ) ) ( not ( = ?auto_790998 ?auto_790999 ) ) ( not ( = ?auto_790998 ?auto_791000 ) ) ( not ( = ?auto_790998 ?auto_791001 ) ) ( not ( = ?auto_790998 ?auto_791002 ) ) ( not ( = ?auto_790998 ?auto_791003 ) ) ( not ( = ?auto_790998 ?auto_791004 ) ) ( not ( = ?auto_790998 ?auto_791005 ) ) ( not ( = ?auto_790999 ?auto_791000 ) ) ( not ( = ?auto_790999 ?auto_791001 ) ) ( not ( = ?auto_790999 ?auto_791002 ) ) ( not ( = ?auto_790999 ?auto_791003 ) ) ( not ( = ?auto_790999 ?auto_791004 ) ) ( not ( = ?auto_790999 ?auto_791005 ) ) ( not ( = ?auto_791000 ?auto_791001 ) ) ( not ( = ?auto_791000 ?auto_791002 ) ) ( not ( = ?auto_791000 ?auto_791003 ) ) ( not ( = ?auto_791000 ?auto_791004 ) ) ( not ( = ?auto_791000 ?auto_791005 ) ) ( not ( = ?auto_791001 ?auto_791002 ) ) ( not ( = ?auto_791001 ?auto_791003 ) ) ( not ( = ?auto_791001 ?auto_791004 ) ) ( not ( = ?auto_791001 ?auto_791005 ) ) ( not ( = ?auto_791002 ?auto_791003 ) ) ( not ( = ?auto_791002 ?auto_791004 ) ) ( not ( = ?auto_791002 ?auto_791005 ) ) ( not ( = ?auto_791003 ?auto_791004 ) ) ( not ( = ?auto_791003 ?auto_791005 ) ) ( not ( = ?auto_791004 ?auto_791005 ) ) ( ON ?auto_791003 ?auto_791004 ) ( ON ?auto_791002 ?auto_791003 ) ( ON ?auto_791001 ?auto_791002 ) ( ON ?auto_791000 ?auto_791001 ) ( ON ?auto_790999 ?auto_791000 ) ( ON ?auto_790998 ?auto_790999 ) ( ON ?auto_790997 ?auto_790998 ) ( ON ?auto_790996 ?auto_790997 ) ( ON ?auto_790995 ?auto_790996 ) ( ON ?auto_790994 ?auto_790995 ) ( ON ?auto_790993 ?auto_790994 ) ( ON ?auto_790992 ?auto_790993 ) ( ON ?auto_790991 ?auto_790992 ) ( ON ?auto_790990 ?auto_790991 ) ( CLEAR ?auto_790988 ) ( ON ?auto_790989 ?auto_790990 ) ( CLEAR ?auto_790989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_790988 ?auto_790989 )
      ( MAKE-17PILE ?auto_790988 ?auto_790989 ?auto_790990 ?auto_790991 ?auto_790992 ?auto_790993 ?auto_790994 ?auto_790995 ?auto_790996 ?auto_790997 ?auto_790998 ?auto_790999 ?auto_791000 ?auto_791001 ?auto_791002 ?auto_791003 ?auto_791004 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_791058 - BLOCK
      ?auto_791059 - BLOCK
      ?auto_791060 - BLOCK
      ?auto_791061 - BLOCK
      ?auto_791062 - BLOCK
      ?auto_791063 - BLOCK
      ?auto_791064 - BLOCK
      ?auto_791065 - BLOCK
      ?auto_791066 - BLOCK
      ?auto_791067 - BLOCK
      ?auto_791068 - BLOCK
      ?auto_791069 - BLOCK
      ?auto_791070 - BLOCK
      ?auto_791071 - BLOCK
      ?auto_791072 - BLOCK
      ?auto_791073 - BLOCK
      ?auto_791074 - BLOCK
    )
    :vars
    (
      ?auto_791075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791074 ?auto_791075 ) ( not ( = ?auto_791058 ?auto_791059 ) ) ( not ( = ?auto_791058 ?auto_791060 ) ) ( not ( = ?auto_791058 ?auto_791061 ) ) ( not ( = ?auto_791058 ?auto_791062 ) ) ( not ( = ?auto_791058 ?auto_791063 ) ) ( not ( = ?auto_791058 ?auto_791064 ) ) ( not ( = ?auto_791058 ?auto_791065 ) ) ( not ( = ?auto_791058 ?auto_791066 ) ) ( not ( = ?auto_791058 ?auto_791067 ) ) ( not ( = ?auto_791058 ?auto_791068 ) ) ( not ( = ?auto_791058 ?auto_791069 ) ) ( not ( = ?auto_791058 ?auto_791070 ) ) ( not ( = ?auto_791058 ?auto_791071 ) ) ( not ( = ?auto_791058 ?auto_791072 ) ) ( not ( = ?auto_791058 ?auto_791073 ) ) ( not ( = ?auto_791058 ?auto_791074 ) ) ( not ( = ?auto_791058 ?auto_791075 ) ) ( not ( = ?auto_791059 ?auto_791060 ) ) ( not ( = ?auto_791059 ?auto_791061 ) ) ( not ( = ?auto_791059 ?auto_791062 ) ) ( not ( = ?auto_791059 ?auto_791063 ) ) ( not ( = ?auto_791059 ?auto_791064 ) ) ( not ( = ?auto_791059 ?auto_791065 ) ) ( not ( = ?auto_791059 ?auto_791066 ) ) ( not ( = ?auto_791059 ?auto_791067 ) ) ( not ( = ?auto_791059 ?auto_791068 ) ) ( not ( = ?auto_791059 ?auto_791069 ) ) ( not ( = ?auto_791059 ?auto_791070 ) ) ( not ( = ?auto_791059 ?auto_791071 ) ) ( not ( = ?auto_791059 ?auto_791072 ) ) ( not ( = ?auto_791059 ?auto_791073 ) ) ( not ( = ?auto_791059 ?auto_791074 ) ) ( not ( = ?auto_791059 ?auto_791075 ) ) ( not ( = ?auto_791060 ?auto_791061 ) ) ( not ( = ?auto_791060 ?auto_791062 ) ) ( not ( = ?auto_791060 ?auto_791063 ) ) ( not ( = ?auto_791060 ?auto_791064 ) ) ( not ( = ?auto_791060 ?auto_791065 ) ) ( not ( = ?auto_791060 ?auto_791066 ) ) ( not ( = ?auto_791060 ?auto_791067 ) ) ( not ( = ?auto_791060 ?auto_791068 ) ) ( not ( = ?auto_791060 ?auto_791069 ) ) ( not ( = ?auto_791060 ?auto_791070 ) ) ( not ( = ?auto_791060 ?auto_791071 ) ) ( not ( = ?auto_791060 ?auto_791072 ) ) ( not ( = ?auto_791060 ?auto_791073 ) ) ( not ( = ?auto_791060 ?auto_791074 ) ) ( not ( = ?auto_791060 ?auto_791075 ) ) ( not ( = ?auto_791061 ?auto_791062 ) ) ( not ( = ?auto_791061 ?auto_791063 ) ) ( not ( = ?auto_791061 ?auto_791064 ) ) ( not ( = ?auto_791061 ?auto_791065 ) ) ( not ( = ?auto_791061 ?auto_791066 ) ) ( not ( = ?auto_791061 ?auto_791067 ) ) ( not ( = ?auto_791061 ?auto_791068 ) ) ( not ( = ?auto_791061 ?auto_791069 ) ) ( not ( = ?auto_791061 ?auto_791070 ) ) ( not ( = ?auto_791061 ?auto_791071 ) ) ( not ( = ?auto_791061 ?auto_791072 ) ) ( not ( = ?auto_791061 ?auto_791073 ) ) ( not ( = ?auto_791061 ?auto_791074 ) ) ( not ( = ?auto_791061 ?auto_791075 ) ) ( not ( = ?auto_791062 ?auto_791063 ) ) ( not ( = ?auto_791062 ?auto_791064 ) ) ( not ( = ?auto_791062 ?auto_791065 ) ) ( not ( = ?auto_791062 ?auto_791066 ) ) ( not ( = ?auto_791062 ?auto_791067 ) ) ( not ( = ?auto_791062 ?auto_791068 ) ) ( not ( = ?auto_791062 ?auto_791069 ) ) ( not ( = ?auto_791062 ?auto_791070 ) ) ( not ( = ?auto_791062 ?auto_791071 ) ) ( not ( = ?auto_791062 ?auto_791072 ) ) ( not ( = ?auto_791062 ?auto_791073 ) ) ( not ( = ?auto_791062 ?auto_791074 ) ) ( not ( = ?auto_791062 ?auto_791075 ) ) ( not ( = ?auto_791063 ?auto_791064 ) ) ( not ( = ?auto_791063 ?auto_791065 ) ) ( not ( = ?auto_791063 ?auto_791066 ) ) ( not ( = ?auto_791063 ?auto_791067 ) ) ( not ( = ?auto_791063 ?auto_791068 ) ) ( not ( = ?auto_791063 ?auto_791069 ) ) ( not ( = ?auto_791063 ?auto_791070 ) ) ( not ( = ?auto_791063 ?auto_791071 ) ) ( not ( = ?auto_791063 ?auto_791072 ) ) ( not ( = ?auto_791063 ?auto_791073 ) ) ( not ( = ?auto_791063 ?auto_791074 ) ) ( not ( = ?auto_791063 ?auto_791075 ) ) ( not ( = ?auto_791064 ?auto_791065 ) ) ( not ( = ?auto_791064 ?auto_791066 ) ) ( not ( = ?auto_791064 ?auto_791067 ) ) ( not ( = ?auto_791064 ?auto_791068 ) ) ( not ( = ?auto_791064 ?auto_791069 ) ) ( not ( = ?auto_791064 ?auto_791070 ) ) ( not ( = ?auto_791064 ?auto_791071 ) ) ( not ( = ?auto_791064 ?auto_791072 ) ) ( not ( = ?auto_791064 ?auto_791073 ) ) ( not ( = ?auto_791064 ?auto_791074 ) ) ( not ( = ?auto_791064 ?auto_791075 ) ) ( not ( = ?auto_791065 ?auto_791066 ) ) ( not ( = ?auto_791065 ?auto_791067 ) ) ( not ( = ?auto_791065 ?auto_791068 ) ) ( not ( = ?auto_791065 ?auto_791069 ) ) ( not ( = ?auto_791065 ?auto_791070 ) ) ( not ( = ?auto_791065 ?auto_791071 ) ) ( not ( = ?auto_791065 ?auto_791072 ) ) ( not ( = ?auto_791065 ?auto_791073 ) ) ( not ( = ?auto_791065 ?auto_791074 ) ) ( not ( = ?auto_791065 ?auto_791075 ) ) ( not ( = ?auto_791066 ?auto_791067 ) ) ( not ( = ?auto_791066 ?auto_791068 ) ) ( not ( = ?auto_791066 ?auto_791069 ) ) ( not ( = ?auto_791066 ?auto_791070 ) ) ( not ( = ?auto_791066 ?auto_791071 ) ) ( not ( = ?auto_791066 ?auto_791072 ) ) ( not ( = ?auto_791066 ?auto_791073 ) ) ( not ( = ?auto_791066 ?auto_791074 ) ) ( not ( = ?auto_791066 ?auto_791075 ) ) ( not ( = ?auto_791067 ?auto_791068 ) ) ( not ( = ?auto_791067 ?auto_791069 ) ) ( not ( = ?auto_791067 ?auto_791070 ) ) ( not ( = ?auto_791067 ?auto_791071 ) ) ( not ( = ?auto_791067 ?auto_791072 ) ) ( not ( = ?auto_791067 ?auto_791073 ) ) ( not ( = ?auto_791067 ?auto_791074 ) ) ( not ( = ?auto_791067 ?auto_791075 ) ) ( not ( = ?auto_791068 ?auto_791069 ) ) ( not ( = ?auto_791068 ?auto_791070 ) ) ( not ( = ?auto_791068 ?auto_791071 ) ) ( not ( = ?auto_791068 ?auto_791072 ) ) ( not ( = ?auto_791068 ?auto_791073 ) ) ( not ( = ?auto_791068 ?auto_791074 ) ) ( not ( = ?auto_791068 ?auto_791075 ) ) ( not ( = ?auto_791069 ?auto_791070 ) ) ( not ( = ?auto_791069 ?auto_791071 ) ) ( not ( = ?auto_791069 ?auto_791072 ) ) ( not ( = ?auto_791069 ?auto_791073 ) ) ( not ( = ?auto_791069 ?auto_791074 ) ) ( not ( = ?auto_791069 ?auto_791075 ) ) ( not ( = ?auto_791070 ?auto_791071 ) ) ( not ( = ?auto_791070 ?auto_791072 ) ) ( not ( = ?auto_791070 ?auto_791073 ) ) ( not ( = ?auto_791070 ?auto_791074 ) ) ( not ( = ?auto_791070 ?auto_791075 ) ) ( not ( = ?auto_791071 ?auto_791072 ) ) ( not ( = ?auto_791071 ?auto_791073 ) ) ( not ( = ?auto_791071 ?auto_791074 ) ) ( not ( = ?auto_791071 ?auto_791075 ) ) ( not ( = ?auto_791072 ?auto_791073 ) ) ( not ( = ?auto_791072 ?auto_791074 ) ) ( not ( = ?auto_791072 ?auto_791075 ) ) ( not ( = ?auto_791073 ?auto_791074 ) ) ( not ( = ?auto_791073 ?auto_791075 ) ) ( not ( = ?auto_791074 ?auto_791075 ) ) ( ON ?auto_791073 ?auto_791074 ) ( ON ?auto_791072 ?auto_791073 ) ( ON ?auto_791071 ?auto_791072 ) ( ON ?auto_791070 ?auto_791071 ) ( ON ?auto_791069 ?auto_791070 ) ( ON ?auto_791068 ?auto_791069 ) ( ON ?auto_791067 ?auto_791068 ) ( ON ?auto_791066 ?auto_791067 ) ( ON ?auto_791065 ?auto_791066 ) ( ON ?auto_791064 ?auto_791065 ) ( ON ?auto_791063 ?auto_791064 ) ( ON ?auto_791062 ?auto_791063 ) ( ON ?auto_791061 ?auto_791062 ) ( ON ?auto_791060 ?auto_791061 ) ( ON ?auto_791059 ?auto_791060 ) ( ON ?auto_791058 ?auto_791059 ) ( CLEAR ?auto_791058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_791058 )
      ( MAKE-17PILE ?auto_791058 ?auto_791059 ?auto_791060 ?auto_791061 ?auto_791062 ?auto_791063 ?auto_791064 ?auto_791065 ?auto_791066 ?auto_791067 ?auto_791068 ?auto_791069 ?auto_791070 ?auto_791071 ?auto_791072 ?auto_791073 ?auto_791074 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791129 - BLOCK
      ?auto_791130 - BLOCK
      ?auto_791131 - BLOCK
      ?auto_791132 - BLOCK
      ?auto_791133 - BLOCK
      ?auto_791134 - BLOCK
      ?auto_791135 - BLOCK
      ?auto_791136 - BLOCK
      ?auto_791137 - BLOCK
      ?auto_791138 - BLOCK
      ?auto_791139 - BLOCK
      ?auto_791140 - BLOCK
      ?auto_791141 - BLOCK
      ?auto_791142 - BLOCK
      ?auto_791143 - BLOCK
      ?auto_791144 - BLOCK
      ?auto_791145 - BLOCK
      ?auto_791146 - BLOCK
    )
    :vars
    (
      ?auto_791147 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_791145 ) ( ON ?auto_791146 ?auto_791147 ) ( CLEAR ?auto_791146 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_791129 ) ( ON ?auto_791130 ?auto_791129 ) ( ON ?auto_791131 ?auto_791130 ) ( ON ?auto_791132 ?auto_791131 ) ( ON ?auto_791133 ?auto_791132 ) ( ON ?auto_791134 ?auto_791133 ) ( ON ?auto_791135 ?auto_791134 ) ( ON ?auto_791136 ?auto_791135 ) ( ON ?auto_791137 ?auto_791136 ) ( ON ?auto_791138 ?auto_791137 ) ( ON ?auto_791139 ?auto_791138 ) ( ON ?auto_791140 ?auto_791139 ) ( ON ?auto_791141 ?auto_791140 ) ( ON ?auto_791142 ?auto_791141 ) ( ON ?auto_791143 ?auto_791142 ) ( ON ?auto_791144 ?auto_791143 ) ( ON ?auto_791145 ?auto_791144 ) ( not ( = ?auto_791129 ?auto_791130 ) ) ( not ( = ?auto_791129 ?auto_791131 ) ) ( not ( = ?auto_791129 ?auto_791132 ) ) ( not ( = ?auto_791129 ?auto_791133 ) ) ( not ( = ?auto_791129 ?auto_791134 ) ) ( not ( = ?auto_791129 ?auto_791135 ) ) ( not ( = ?auto_791129 ?auto_791136 ) ) ( not ( = ?auto_791129 ?auto_791137 ) ) ( not ( = ?auto_791129 ?auto_791138 ) ) ( not ( = ?auto_791129 ?auto_791139 ) ) ( not ( = ?auto_791129 ?auto_791140 ) ) ( not ( = ?auto_791129 ?auto_791141 ) ) ( not ( = ?auto_791129 ?auto_791142 ) ) ( not ( = ?auto_791129 ?auto_791143 ) ) ( not ( = ?auto_791129 ?auto_791144 ) ) ( not ( = ?auto_791129 ?auto_791145 ) ) ( not ( = ?auto_791129 ?auto_791146 ) ) ( not ( = ?auto_791129 ?auto_791147 ) ) ( not ( = ?auto_791130 ?auto_791131 ) ) ( not ( = ?auto_791130 ?auto_791132 ) ) ( not ( = ?auto_791130 ?auto_791133 ) ) ( not ( = ?auto_791130 ?auto_791134 ) ) ( not ( = ?auto_791130 ?auto_791135 ) ) ( not ( = ?auto_791130 ?auto_791136 ) ) ( not ( = ?auto_791130 ?auto_791137 ) ) ( not ( = ?auto_791130 ?auto_791138 ) ) ( not ( = ?auto_791130 ?auto_791139 ) ) ( not ( = ?auto_791130 ?auto_791140 ) ) ( not ( = ?auto_791130 ?auto_791141 ) ) ( not ( = ?auto_791130 ?auto_791142 ) ) ( not ( = ?auto_791130 ?auto_791143 ) ) ( not ( = ?auto_791130 ?auto_791144 ) ) ( not ( = ?auto_791130 ?auto_791145 ) ) ( not ( = ?auto_791130 ?auto_791146 ) ) ( not ( = ?auto_791130 ?auto_791147 ) ) ( not ( = ?auto_791131 ?auto_791132 ) ) ( not ( = ?auto_791131 ?auto_791133 ) ) ( not ( = ?auto_791131 ?auto_791134 ) ) ( not ( = ?auto_791131 ?auto_791135 ) ) ( not ( = ?auto_791131 ?auto_791136 ) ) ( not ( = ?auto_791131 ?auto_791137 ) ) ( not ( = ?auto_791131 ?auto_791138 ) ) ( not ( = ?auto_791131 ?auto_791139 ) ) ( not ( = ?auto_791131 ?auto_791140 ) ) ( not ( = ?auto_791131 ?auto_791141 ) ) ( not ( = ?auto_791131 ?auto_791142 ) ) ( not ( = ?auto_791131 ?auto_791143 ) ) ( not ( = ?auto_791131 ?auto_791144 ) ) ( not ( = ?auto_791131 ?auto_791145 ) ) ( not ( = ?auto_791131 ?auto_791146 ) ) ( not ( = ?auto_791131 ?auto_791147 ) ) ( not ( = ?auto_791132 ?auto_791133 ) ) ( not ( = ?auto_791132 ?auto_791134 ) ) ( not ( = ?auto_791132 ?auto_791135 ) ) ( not ( = ?auto_791132 ?auto_791136 ) ) ( not ( = ?auto_791132 ?auto_791137 ) ) ( not ( = ?auto_791132 ?auto_791138 ) ) ( not ( = ?auto_791132 ?auto_791139 ) ) ( not ( = ?auto_791132 ?auto_791140 ) ) ( not ( = ?auto_791132 ?auto_791141 ) ) ( not ( = ?auto_791132 ?auto_791142 ) ) ( not ( = ?auto_791132 ?auto_791143 ) ) ( not ( = ?auto_791132 ?auto_791144 ) ) ( not ( = ?auto_791132 ?auto_791145 ) ) ( not ( = ?auto_791132 ?auto_791146 ) ) ( not ( = ?auto_791132 ?auto_791147 ) ) ( not ( = ?auto_791133 ?auto_791134 ) ) ( not ( = ?auto_791133 ?auto_791135 ) ) ( not ( = ?auto_791133 ?auto_791136 ) ) ( not ( = ?auto_791133 ?auto_791137 ) ) ( not ( = ?auto_791133 ?auto_791138 ) ) ( not ( = ?auto_791133 ?auto_791139 ) ) ( not ( = ?auto_791133 ?auto_791140 ) ) ( not ( = ?auto_791133 ?auto_791141 ) ) ( not ( = ?auto_791133 ?auto_791142 ) ) ( not ( = ?auto_791133 ?auto_791143 ) ) ( not ( = ?auto_791133 ?auto_791144 ) ) ( not ( = ?auto_791133 ?auto_791145 ) ) ( not ( = ?auto_791133 ?auto_791146 ) ) ( not ( = ?auto_791133 ?auto_791147 ) ) ( not ( = ?auto_791134 ?auto_791135 ) ) ( not ( = ?auto_791134 ?auto_791136 ) ) ( not ( = ?auto_791134 ?auto_791137 ) ) ( not ( = ?auto_791134 ?auto_791138 ) ) ( not ( = ?auto_791134 ?auto_791139 ) ) ( not ( = ?auto_791134 ?auto_791140 ) ) ( not ( = ?auto_791134 ?auto_791141 ) ) ( not ( = ?auto_791134 ?auto_791142 ) ) ( not ( = ?auto_791134 ?auto_791143 ) ) ( not ( = ?auto_791134 ?auto_791144 ) ) ( not ( = ?auto_791134 ?auto_791145 ) ) ( not ( = ?auto_791134 ?auto_791146 ) ) ( not ( = ?auto_791134 ?auto_791147 ) ) ( not ( = ?auto_791135 ?auto_791136 ) ) ( not ( = ?auto_791135 ?auto_791137 ) ) ( not ( = ?auto_791135 ?auto_791138 ) ) ( not ( = ?auto_791135 ?auto_791139 ) ) ( not ( = ?auto_791135 ?auto_791140 ) ) ( not ( = ?auto_791135 ?auto_791141 ) ) ( not ( = ?auto_791135 ?auto_791142 ) ) ( not ( = ?auto_791135 ?auto_791143 ) ) ( not ( = ?auto_791135 ?auto_791144 ) ) ( not ( = ?auto_791135 ?auto_791145 ) ) ( not ( = ?auto_791135 ?auto_791146 ) ) ( not ( = ?auto_791135 ?auto_791147 ) ) ( not ( = ?auto_791136 ?auto_791137 ) ) ( not ( = ?auto_791136 ?auto_791138 ) ) ( not ( = ?auto_791136 ?auto_791139 ) ) ( not ( = ?auto_791136 ?auto_791140 ) ) ( not ( = ?auto_791136 ?auto_791141 ) ) ( not ( = ?auto_791136 ?auto_791142 ) ) ( not ( = ?auto_791136 ?auto_791143 ) ) ( not ( = ?auto_791136 ?auto_791144 ) ) ( not ( = ?auto_791136 ?auto_791145 ) ) ( not ( = ?auto_791136 ?auto_791146 ) ) ( not ( = ?auto_791136 ?auto_791147 ) ) ( not ( = ?auto_791137 ?auto_791138 ) ) ( not ( = ?auto_791137 ?auto_791139 ) ) ( not ( = ?auto_791137 ?auto_791140 ) ) ( not ( = ?auto_791137 ?auto_791141 ) ) ( not ( = ?auto_791137 ?auto_791142 ) ) ( not ( = ?auto_791137 ?auto_791143 ) ) ( not ( = ?auto_791137 ?auto_791144 ) ) ( not ( = ?auto_791137 ?auto_791145 ) ) ( not ( = ?auto_791137 ?auto_791146 ) ) ( not ( = ?auto_791137 ?auto_791147 ) ) ( not ( = ?auto_791138 ?auto_791139 ) ) ( not ( = ?auto_791138 ?auto_791140 ) ) ( not ( = ?auto_791138 ?auto_791141 ) ) ( not ( = ?auto_791138 ?auto_791142 ) ) ( not ( = ?auto_791138 ?auto_791143 ) ) ( not ( = ?auto_791138 ?auto_791144 ) ) ( not ( = ?auto_791138 ?auto_791145 ) ) ( not ( = ?auto_791138 ?auto_791146 ) ) ( not ( = ?auto_791138 ?auto_791147 ) ) ( not ( = ?auto_791139 ?auto_791140 ) ) ( not ( = ?auto_791139 ?auto_791141 ) ) ( not ( = ?auto_791139 ?auto_791142 ) ) ( not ( = ?auto_791139 ?auto_791143 ) ) ( not ( = ?auto_791139 ?auto_791144 ) ) ( not ( = ?auto_791139 ?auto_791145 ) ) ( not ( = ?auto_791139 ?auto_791146 ) ) ( not ( = ?auto_791139 ?auto_791147 ) ) ( not ( = ?auto_791140 ?auto_791141 ) ) ( not ( = ?auto_791140 ?auto_791142 ) ) ( not ( = ?auto_791140 ?auto_791143 ) ) ( not ( = ?auto_791140 ?auto_791144 ) ) ( not ( = ?auto_791140 ?auto_791145 ) ) ( not ( = ?auto_791140 ?auto_791146 ) ) ( not ( = ?auto_791140 ?auto_791147 ) ) ( not ( = ?auto_791141 ?auto_791142 ) ) ( not ( = ?auto_791141 ?auto_791143 ) ) ( not ( = ?auto_791141 ?auto_791144 ) ) ( not ( = ?auto_791141 ?auto_791145 ) ) ( not ( = ?auto_791141 ?auto_791146 ) ) ( not ( = ?auto_791141 ?auto_791147 ) ) ( not ( = ?auto_791142 ?auto_791143 ) ) ( not ( = ?auto_791142 ?auto_791144 ) ) ( not ( = ?auto_791142 ?auto_791145 ) ) ( not ( = ?auto_791142 ?auto_791146 ) ) ( not ( = ?auto_791142 ?auto_791147 ) ) ( not ( = ?auto_791143 ?auto_791144 ) ) ( not ( = ?auto_791143 ?auto_791145 ) ) ( not ( = ?auto_791143 ?auto_791146 ) ) ( not ( = ?auto_791143 ?auto_791147 ) ) ( not ( = ?auto_791144 ?auto_791145 ) ) ( not ( = ?auto_791144 ?auto_791146 ) ) ( not ( = ?auto_791144 ?auto_791147 ) ) ( not ( = ?auto_791145 ?auto_791146 ) ) ( not ( = ?auto_791145 ?auto_791147 ) ) ( not ( = ?auto_791146 ?auto_791147 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_791146 ?auto_791147 )
      ( !STACK ?auto_791146 ?auto_791145 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791166 - BLOCK
      ?auto_791167 - BLOCK
      ?auto_791168 - BLOCK
      ?auto_791169 - BLOCK
      ?auto_791170 - BLOCK
      ?auto_791171 - BLOCK
      ?auto_791172 - BLOCK
      ?auto_791173 - BLOCK
      ?auto_791174 - BLOCK
      ?auto_791175 - BLOCK
      ?auto_791176 - BLOCK
      ?auto_791177 - BLOCK
      ?auto_791178 - BLOCK
      ?auto_791179 - BLOCK
      ?auto_791180 - BLOCK
      ?auto_791181 - BLOCK
      ?auto_791182 - BLOCK
      ?auto_791183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_791182 ) ( ON-TABLE ?auto_791183 ) ( CLEAR ?auto_791183 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_791166 ) ( ON ?auto_791167 ?auto_791166 ) ( ON ?auto_791168 ?auto_791167 ) ( ON ?auto_791169 ?auto_791168 ) ( ON ?auto_791170 ?auto_791169 ) ( ON ?auto_791171 ?auto_791170 ) ( ON ?auto_791172 ?auto_791171 ) ( ON ?auto_791173 ?auto_791172 ) ( ON ?auto_791174 ?auto_791173 ) ( ON ?auto_791175 ?auto_791174 ) ( ON ?auto_791176 ?auto_791175 ) ( ON ?auto_791177 ?auto_791176 ) ( ON ?auto_791178 ?auto_791177 ) ( ON ?auto_791179 ?auto_791178 ) ( ON ?auto_791180 ?auto_791179 ) ( ON ?auto_791181 ?auto_791180 ) ( ON ?auto_791182 ?auto_791181 ) ( not ( = ?auto_791166 ?auto_791167 ) ) ( not ( = ?auto_791166 ?auto_791168 ) ) ( not ( = ?auto_791166 ?auto_791169 ) ) ( not ( = ?auto_791166 ?auto_791170 ) ) ( not ( = ?auto_791166 ?auto_791171 ) ) ( not ( = ?auto_791166 ?auto_791172 ) ) ( not ( = ?auto_791166 ?auto_791173 ) ) ( not ( = ?auto_791166 ?auto_791174 ) ) ( not ( = ?auto_791166 ?auto_791175 ) ) ( not ( = ?auto_791166 ?auto_791176 ) ) ( not ( = ?auto_791166 ?auto_791177 ) ) ( not ( = ?auto_791166 ?auto_791178 ) ) ( not ( = ?auto_791166 ?auto_791179 ) ) ( not ( = ?auto_791166 ?auto_791180 ) ) ( not ( = ?auto_791166 ?auto_791181 ) ) ( not ( = ?auto_791166 ?auto_791182 ) ) ( not ( = ?auto_791166 ?auto_791183 ) ) ( not ( = ?auto_791167 ?auto_791168 ) ) ( not ( = ?auto_791167 ?auto_791169 ) ) ( not ( = ?auto_791167 ?auto_791170 ) ) ( not ( = ?auto_791167 ?auto_791171 ) ) ( not ( = ?auto_791167 ?auto_791172 ) ) ( not ( = ?auto_791167 ?auto_791173 ) ) ( not ( = ?auto_791167 ?auto_791174 ) ) ( not ( = ?auto_791167 ?auto_791175 ) ) ( not ( = ?auto_791167 ?auto_791176 ) ) ( not ( = ?auto_791167 ?auto_791177 ) ) ( not ( = ?auto_791167 ?auto_791178 ) ) ( not ( = ?auto_791167 ?auto_791179 ) ) ( not ( = ?auto_791167 ?auto_791180 ) ) ( not ( = ?auto_791167 ?auto_791181 ) ) ( not ( = ?auto_791167 ?auto_791182 ) ) ( not ( = ?auto_791167 ?auto_791183 ) ) ( not ( = ?auto_791168 ?auto_791169 ) ) ( not ( = ?auto_791168 ?auto_791170 ) ) ( not ( = ?auto_791168 ?auto_791171 ) ) ( not ( = ?auto_791168 ?auto_791172 ) ) ( not ( = ?auto_791168 ?auto_791173 ) ) ( not ( = ?auto_791168 ?auto_791174 ) ) ( not ( = ?auto_791168 ?auto_791175 ) ) ( not ( = ?auto_791168 ?auto_791176 ) ) ( not ( = ?auto_791168 ?auto_791177 ) ) ( not ( = ?auto_791168 ?auto_791178 ) ) ( not ( = ?auto_791168 ?auto_791179 ) ) ( not ( = ?auto_791168 ?auto_791180 ) ) ( not ( = ?auto_791168 ?auto_791181 ) ) ( not ( = ?auto_791168 ?auto_791182 ) ) ( not ( = ?auto_791168 ?auto_791183 ) ) ( not ( = ?auto_791169 ?auto_791170 ) ) ( not ( = ?auto_791169 ?auto_791171 ) ) ( not ( = ?auto_791169 ?auto_791172 ) ) ( not ( = ?auto_791169 ?auto_791173 ) ) ( not ( = ?auto_791169 ?auto_791174 ) ) ( not ( = ?auto_791169 ?auto_791175 ) ) ( not ( = ?auto_791169 ?auto_791176 ) ) ( not ( = ?auto_791169 ?auto_791177 ) ) ( not ( = ?auto_791169 ?auto_791178 ) ) ( not ( = ?auto_791169 ?auto_791179 ) ) ( not ( = ?auto_791169 ?auto_791180 ) ) ( not ( = ?auto_791169 ?auto_791181 ) ) ( not ( = ?auto_791169 ?auto_791182 ) ) ( not ( = ?auto_791169 ?auto_791183 ) ) ( not ( = ?auto_791170 ?auto_791171 ) ) ( not ( = ?auto_791170 ?auto_791172 ) ) ( not ( = ?auto_791170 ?auto_791173 ) ) ( not ( = ?auto_791170 ?auto_791174 ) ) ( not ( = ?auto_791170 ?auto_791175 ) ) ( not ( = ?auto_791170 ?auto_791176 ) ) ( not ( = ?auto_791170 ?auto_791177 ) ) ( not ( = ?auto_791170 ?auto_791178 ) ) ( not ( = ?auto_791170 ?auto_791179 ) ) ( not ( = ?auto_791170 ?auto_791180 ) ) ( not ( = ?auto_791170 ?auto_791181 ) ) ( not ( = ?auto_791170 ?auto_791182 ) ) ( not ( = ?auto_791170 ?auto_791183 ) ) ( not ( = ?auto_791171 ?auto_791172 ) ) ( not ( = ?auto_791171 ?auto_791173 ) ) ( not ( = ?auto_791171 ?auto_791174 ) ) ( not ( = ?auto_791171 ?auto_791175 ) ) ( not ( = ?auto_791171 ?auto_791176 ) ) ( not ( = ?auto_791171 ?auto_791177 ) ) ( not ( = ?auto_791171 ?auto_791178 ) ) ( not ( = ?auto_791171 ?auto_791179 ) ) ( not ( = ?auto_791171 ?auto_791180 ) ) ( not ( = ?auto_791171 ?auto_791181 ) ) ( not ( = ?auto_791171 ?auto_791182 ) ) ( not ( = ?auto_791171 ?auto_791183 ) ) ( not ( = ?auto_791172 ?auto_791173 ) ) ( not ( = ?auto_791172 ?auto_791174 ) ) ( not ( = ?auto_791172 ?auto_791175 ) ) ( not ( = ?auto_791172 ?auto_791176 ) ) ( not ( = ?auto_791172 ?auto_791177 ) ) ( not ( = ?auto_791172 ?auto_791178 ) ) ( not ( = ?auto_791172 ?auto_791179 ) ) ( not ( = ?auto_791172 ?auto_791180 ) ) ( not ( = ?auto_791172 ?auto_791181 ) ) ( not ( = ?auto_791172 ?auto_791182 ) ) ( not ( = ?auto_791172 ?auto_791183 ) ) ( not ( = ?auto_791173 ?auto_791174 ) ) ( not ( = ?auto_791173 ?auto_791175 ) ) ( not ( = ?auto_791173 ?auto_791176 ) ) ( not ( = ?auto_791173 ?auto_791177 ) ) ( not ( = ?auto_791173 ?auto_791178 ) ) ( not ( = ?auto_791173 ?auto_791179 ) ) ( not ( = ?auto_791173 ?auto_791180 ) ) ( not ( = ?auto_791173 ?auto_791181 ) ) ( not ( = ?auto_791173 ?auto_791182 ) ) ( not ( = ?auto_791173 ?auto_791183 ) ) ( not ( = ?auto_791174 ?auto_791175 ) ) ( not ( = ?auto_791174 ?auto_791176 ) ) ( not ( = ?auto_791174 ?auto_791177 ) ) ( not ( = ?auto_791174 ?auto_791178 ) ) ( not ( = ?auto_791174 ?auto_791179 ) ) ( not ( = ?auto_791174 ?auto_791180 ) ) ( not ( = ?auto_791174 ?auto_791181 ) ) ( not ( = ?auto_791174 ?auto_791182 ) ) ( not ( = ?auto_791174 ?auto_791183 ) ) ( not ( = ?auto_791175 ?auto_791176 ) ) ( not ( = ?auto_791175 ?auto_791177 ) ) ( not ( = ?auto_791175 ?auto_791178 ) ) ( not ( = ?auto_791175 ?auto_791179 ) ) ( not ( = ?auto_791175 ?auto_791180 ) ) ( not ( = ?auto_791175 ?auto_791181 ) ) ( not ( = ?auto_791175 ?auto_791182 ) ) ( not ( = ?auto_791175 ?auto_791183 ) ) ( not ( = ?auto_791176 ?auto_791177 ) ) ( not ( = ?auto_791176 ?auto_791178 ) ) ( not ( = ?auto_791176 ?auto_791179 ) ) ( not ( = ?auto_791176 ?auto_791180 ) ) ( not ( = ?auto_791176 ?auto_791181 ) ) ( not ( = ?auto_791176 ?auto_791182 ) ) ( not ( = ?auto_791176 ?auto_791183 ) ) ( not ( = ?auto_791177 ?auto_791178 ) ) ( not ( = ?auto_791177 ?auto_791179 ) ) ( not ( = ?auto_791177 ?auto_791180 ) ) ( not ( = ?auto_791177 ?auto_791181 ) ) ( not ( = ?auto_791177 ?auto_791182 ) ) ( not ( = ?auto_791177 ?auto_791183 ) ) ( not ( = ?auto_791178 ?auto_791179 ) ) ( not ( = ?auto_791178 ?auto_791180 ) ) ( not ( = ?auto_791178 ?auto_791181 ) ) ( not ( = ?auto_791178 ?auto_791182 ) ) ( not ( = ?auto_791178 ?auto_791183 ) ) ( not ( = ?auto_791179 ?auto_791180 ) ) ( not ( = ?auto_791179 ?auto_791181 ) ) ( not ( = ?auto_791179 ?auto_791182 ) ) ( not ( = ?auto_791179 ?auto_791183 ) ) ( not ( = ?auto_791180 ?auto_791181 ) ) ( not ( = ?auto_791180 ?auto_791182 ) ) ( not ( = ?auto_791180 ?auto_791183 ) ) ( not ( = ?auto_791181 ?auto_791182 ) ) ( not ( = ?auto_791181 ?auto_791183 ) ) ( not ( = ?auto_791182 ?auto_791183 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_791183 )
      ( !STACK ?auto_791183 ?auto_791182 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791202 - BLOCK
      ?auto_791203 - BLOCK
      ?auto_791204 - BLOCK
      ?auto_791205 - BLOCK
      ?auto_791206 - BLOCK
      ?auto_791207 - BLOCK
      ?auto_791208 - BLOCK
      ?auto_791209 - BLOCK
      ?auto_791210 - BLOCK
      ?auto_791211 - BLOCK
      ?auto_791212 - BLOCK
      ?auto_791213 - BLOCK
      ?auto_791214 - BLOCK
      ?auto_791215 - BLOCK
      ?auto_791216 - BLOCK
      ?auto_791217 - BLOCK
      ?auto_791218 - BLOCK
      ?auto_791219 - BLOCK
    )
    :vars
    (
      ?auto_791220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791219 ?auto_791220 ) ( ON-TABLE ?auto_791202 ) ( ON ?auto_791203 ?auto_791202 ) ( ON ?auto_791204 ?auto_791203 ) ( ON ?auto_791205 ?auto_791204 ) ( ON ?auto_791206 ?auto_791205 ) ( ON ?auto_791207 ?auto_791206 ) ( ON ?auto_791208 ?auto_791207 ) ( ON ?auto_791209 ?auto_791208 ) ( ON ?auto_791210 ?auto_791209 ) ( ON ?auto_791211 ?auto_791210 ) ( ON ?auto_791212 ?auto_791211 ) ( ON ?auto_791213 ?auto_791212 ) ( ON ?auto_791214 ?auto_791213 ) ( ON ?auto_791215 ?auto_791214 ) ( ON ?auto_791216 ?auto_791215 ) ( ON ?auto_791217 ?auto_791216 ) ( not ( = ?auto_791202 ?auto_791203 ) ) ( not ( = ?auto_791202 ?auto_791204 ) ) ( not ( = ?auto_791202 ?auto_791205 ) ) ( not ( = ?auto_791202 ?auto_791206 ) ) ( not ( = ?auto_791202 ?auto_791207 ) ) ( not ( = ?auto_791202 ?auto_791208 ) ) ( not ( = ?auto_791202 ?auto_791209 ) ) ( not ( = ?auto_791202 ?auto_791210 ) ) ( not ( = ?auto_791202 ?auto_791211 ) ) ( not ( = ?auto_791202 ?auto_791212 ) ) ( not ( = ?auto_791202 ?auto_791213 ) ) ( not ( = ?auto_791202 ?auto_791214 ) ) ( not ( = ?auto_791202 ?auto_791215 ) ) ( not ( = ?auto_791202 ?auto_791216 ) ) ( not ( = ?auto_791202 ?auto_791217 ) ) ( not ( = ?auto_791202 ?auto_791218 ) ) ( not ( = ?auto_791202 ?auto_791219 ) ) ( not ( = ?auto_791202 ?auto_791220 ) ) ( not ( = ?auto_791203 ?auto_791204 ) ) ( not ( = ?auto_791203 ?auto_791205 ) ) ( not ( = ?auto_791203 ?auto_791206 ) ) ( not ( = ?auto_791203 ?auto_791207 ) ) ( not ( = ?auto_791203 ?auto_791208 ) ) ( not ( = ?auto_791203 ?auto_791209 ) ) ( not ( = ?auto_791203 ?auto_791210 ) ) ( not ( = ?auto_791203 ?auto_791211 ) ) ( not ( = ?auto_791203 ?auto_791212 ) ) ( not ( = ?auto_791203 ?auto_791213 ) ) ( not ( = ?auto_791203 ?auto_791214 ) ) ( not ( = ?auto_791203 ?auto_791215 ) ) ( not ( = ?auto_791203 ?auto_791216 ) ) ( not ( = ?auto_791203 ?auto_791217 ) ) ( not ( = ?auto_791203 ?auto_791218 ) ) ( not ( = ?auto_791203 ?auto_791219 ) ) ( not ( = ?auto_791203 ?auto_791220 ) ) ( not ( = ?auto_791204 ?auto_791205 ) ) ( not ( = ?auto_791204 ?auto_791206 ) ) ( not ( = ?auto_791204 ?auto_791207 ) ) ( not ( = ?auto_791204 ?auto_791208 ) ) ( not ( = ?auto_791204 ?auto_791209 ) ) ( not ( = ?auto_791204 ?auto_791210 ) ) ( not ( = ?auto_791204 ?auto_791211 ) ) ( not ( = ?auto_791204 ?auto_791212 ) ) ( not ( = ?auto_791204 ?auto_791213 ) ) ( not ( = ?auto_791204 ?auto_791214 ) ) ( not ( = ?auto_791204 ?auto_791215 ) ) ( not ( = ?auto_791204 ?auto_791216 ) ) ( not ( = ?auto_791204 ?auto_791217 ) ) ( not ( = ?auto_791204 ?auto_791218 ) ) ( not ( = ?auto_791204 ?auto_791219 ) ) ( not ( = ?auto_791204 ?auto_791220 ) ) ( not ( = ?auto_791205 ?auto_791206 ) ) ( not ( = ?auto_791205 ?auto_791207 ) ) ( not ( = ?auto_791205 ?auto_791208 ) ) ( not ( = ?auto_791205 ?auto_791209 ) ) ( not ( = ?auto_791205 ?auto_791210 ) ) ( not ( = ?auto_791205 ?auto_791211 ) ) ( not ( = ?auto_791205 ?auto_791212 ) ) ( not ( = ?auto_791205 ?auto_791213 ) ) ( not ( = ?auto_791205 ?auto_791214 ) ) ( not ( = ?auto_791205 ?auto_791215 ) ) ( not ( = ?auto_791205 ?auto_791216 ) ) ( not ( = ?auto_791205 ?auto_791217 ) ) ( not ( = ?auto_791205 ?auto_791218 ) ) ( not ( = ?auto_791205 ?auto_791219 ) ) ( not ( = ?auto_791205 ?auto_791220 ) ) ( not ( = ?auto_791206 ?auto_791207 ) ) ( not ( = ?auto_791206 ?auto_791208 ) ) ( not ( = ?auto_791206 ?auto_791209 ) ) ( not ( = ?auto_791206 ?auto_791210 ) ) ( not ( = ?auto_791206 ?auto_791211 ) ) ( not ( = ?auto_791206 ?auto_791212 ) ) ( not ( = ?auto_791206 ?auto_791213 ) ) ( not ( = ?auto_791206 ?auto_791214 ) ) ( not ( = ?auto_791206 ?auto_791215 ) ) ( not ( = ?auto_791206 ?auto_791216 ) ) ( not ( = ?auto_791206 ?auto_791217 ) ) ( not ( = ?auto_791206 ?auto_791218 ) ) ( not ( = ?auto_791206 ?auto_791219 ) ) ( not ( = ?auto_791206 ?auto_791220 ) ) ( not ( = ?auto_791207 ?auto_791208 ) ) ( not ( = ?auto_791207 ?auto_791209 ) ) ( not ( = ?auto_791207 ?auto_791210 ) ) ( not ( = ?auto_791207 ?auto_791211 ) ) ( not ( = ?auto_791207 ?auto_791212 ) ) ( not ( = ?auto_791207 ?auto_791213 ) ) ( not ( = ?auto_791207 ?auto_791214 ) ) ( not ( = ?auto_791207 ?auto_791215 ) ) ( not ( = ?auto_791207 ?auto_791216 ) ) ( not ( = ?auto_791207 ?auto_791217 ) ) ( not ( = ?auto_791207 ?auto_791218 ) ) ( not ( = ?auto_791207 ?auto_791219 ) ) ( not ( = ?auto_791207 ?auto_791220 ) ) ( not ( = ?auto_791208 ?auto_791209 ) ) ( not ( = ?auto_791208 ?auto_791210 ) ) ( not ( = ?auto_791208 ?auto_791211 ) ) ( not ( = ?auto_791208 ?auto_791212 ) ) ( not ( = ?auto_791208 ?auto_791213 ) ) ( not ( = ?auto_791208 ?auto_791214 ) ) ( not ( = ?auto_791208 ?auto_791215 ) ) ( not ( = ?auto_791208 ?auto_791216 ) ) ( not ( = ?auto_791208 ?auto_791217 ) ) ( not ( = ?auto_791208 ?auto_791218 ) ) ( not ( = ?auto_791208 ?auto_791219 ) ) ( not ( = ?auto_791208 ?auto_791220 ) ) ( not ( = ?auto_791209 ?auto_791210 ) ) ( not ( = ?auto_791209 ?auto_791211 ) ) ( not ( = ?auto_791209 ?auto_791212 ) ) ( not ( = ?auto_791209 ?auto_791213 ) ) ( not ( = ?auto_791209 ?auto_791214 ) ) ( not ( = ?auto_791209 ?auto_791215 ) ) ( not ( = ?auto_791209 ?auto_791216 ) ) ( not ( = ?auto_791209 ?auto_791217 ) ) ( not ( = ?auto_791209 ?auto_791218 ) ) ( not ( = ?auto_791209 ?auto_791219 ) ) ( not ( = ?auto_791209 ?auto_791220 ) ) ( not ( = ?auto_791210 ?auto_791211 ) ) ( not ( = ?auto_791210 ?auto_791212 ) ) ( not ( = ?auto_791210 ?auto_791213 ) ) ( not ( = ?auto_791210 ?auto_791214 ) ) ( not ( = ?auto_791210 ?auto_791215 ) ) ( not ( = ?auto_791210 ?auto_791216 ) ) ( not ( = ?auto_791210 ?auto_791217 ) ) ( not ( = ?auto_791210 ?auto_791218 ) ) ( not ( = ?auto_791210 ?auto_791219 ) ) ( not ( = ?auto_791210 ?auto_791220 ) ) ( not ( = ?auto_791211 ?auto_791212 ) ) ( not ( = ?auto_791211 ?auto_791213 ) ) ( not ( = ?auto_791211 ?auto_791214 ) ) ( not ( = ?auto_791211 ?auto_791215 ) ) ( not ( = ?auto_791211 ?auto_791216 ) ) ( not ( = ?auto_791211 ?auto_791217 ) ) ( not ( = ?auto_791211 ?auto_791218 ) ) ( not ( = ?auto_791211 ?auto_791219 ) ) ( not ( = ?auto_791211 ?auto_791220 ) ) ( not ( = ?auto_791212 ?auto_791213 ) ) ( not ( = ?auto_791212 ?auto_791214 ) ) ( not ( = ?auto_791212 ?auto_791215 ) ) ( not ( = ?auto_791212 ?auto_791216 ) ) ( not ( = ?auto_791212 ?auto_791217 ) ) ( not ( = ?auto_791212 ?auto_791218 ) ) ( not ( = ?auto_791212 ?auto_791219 ) ) ( not ( = ?auto_791212 ?auto_791220 ) ) ( not ( = ?auto_791213 ?auto_791214 ) ) ( not ( = ?auto_791213 ?auto_791215 ) ) ( not ( = ?auto_791213 ?auto_791216 ) ) ( not ( = ?auto_791213 ?auto_791217 ) ) ( not ( = ?auto_791213 ?auto_791218 ) ) ( not ( = ?auto_791213 ?auto_791219 ) ) ( not ( = ?auto_791213 ?auto_791220 ) ) ( not ( = ?auto_791214 ?auto_791215 ) ) ( not ( = ?auto_791214 ?auto_791216 ) ) ( not ( = ?auto_791214 ?auto_791217 ) ) ( not ( = ?auto_791214 ?auto_791218 ) ) ( not ( = ?auto_791214 ?auto_791219 ) ) ( not ( = ?auto_791214 ?auto_791220 ) ) ( not ( = ?auto_791215 ?auto_791216 ) ) ( not ( = ?auto_791215 ?auto_791217 ) ) ( not ( = ?auto_791215 ?auto_791218 ) ) ( not ( = ?auto_791215 ?auto_791219 ) ) ( not ( = ?auto_791215 ?auto_791220 ) ) ( not ( = ?auto_791216 ?auto_791217 ) ) ( not ( = ?auto_791216 ?auto_791218 ) ) ( not ( = ?auto_791216 ?auto_791219 ) ) ( not ( = ?auto_791216 ?auto_791220 ) ) ( not ( = ?auto_791217 ?auto_791218 ) ) ( not ( = ?auto_791217 ?auto_791219 ) ) ( not ( = ?auto_791217 ?auto_791220 ) ) ( not ( = ?auto_791218 ?auto_791219 ) ) ( not ( = ?auto_791218 ?auto_791220 ) ) ( not ( = ?auto_791219 ?auto_791220 ) ) ( CLEAR ?auto_791217 ) ( ON ?auto_791218 ?auto_791219 ) ( CLEAR ?auto_791218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_791202 ?auto_791203 ?auto_791204 ?auto_791205 ?auto_791206 ?auto_791207 ?auto_791208 ?auto_791209 ?auto_791210 ?auto_791211 ?auto_791212 ?auto_791213 ?auto_791214 ?auto_791215 ?auto_791216 ?auto_791217 ?auto_791218 )
      ( MAKE-18PILE ?auto_791202 ?auto_791203 ?auto_791204 ?auto_791205 ?auto_791206 ?auto_791207 ?auto_791208 ?auto_791209 ?auto_791210 ?auto_791211 ?auto_791212 ?auto_791213 ?auto_791214 ?auto_791215 ?auto_791216 ?auto_791217 ?auto_791218 ?auto_791219 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791239 - BLOCK
      ?auto_791240 - BLOCK
      ?auto_791241 - BLOCK
      ?auto_791242 - BLOCK
      ?auto_791243 - BLOCK
      ?auto_791244 - BLOCK
      ?auto_791245 - BLOCK
      ?auto_791246 - BLOCK
      ?auto_791247 - BLOCK
      ?auto_791248 - BLOCK
      ?auto_791249 - BLOCK
      ?auto_791250 - BLOCK
      ?auto_791251 - BLOCK
      ?auto_791252 - BLOCK
      ?auto_791253 - BLOCK
      ?auto_791254 - BLOCK
      ?auto_791255 - BLOCK
      ?auto_791256 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791256 ) ( ON-TABLE ?auto_791239 ) ( ON ?auto_791240 ?auto_791239 ) ( ON ?auto_791241 ?auto_791240 ) ( ON ?auto_791242 ?auto_791241 ) ( ON ?auto_791243 ?auto_791242 ) ( ON ?auto_791244 ?auto_791243 ) ( ON ?auto_791245 ?auto_791244 ) ( ON ?auto_791246 ?auto_791245 ) ( ON ?auto_791247 ?auto_791246 ) ( ON ?auto_791248 ?auto_791247 ) ( ON ?auto_791249 ?auto_791248 ) ( ON ?auto_791250 ?auto_791249 ) ( ON ?auto_791251 ?auto_791250 ) ( ON ?auto_791252 ?auto_791251 ) ( ON ?auto_791253 ?auto_791252 ) ( ON ?auto_791254 ?auto_791253 ) ( not ( = ?auto_791239 ?auto_791240 ) ) ( not ( = ?auto_791239 ?auto_791241 ) ) ( not ( = ?auto_791239 ?auto_791242 ) ) ( not ( = ?auto_791239 ?auto_791243 ) ) ( not ( = ?auto_791239 ?auto_791244 ) ) ( not ( = ?auto_791239 ?auto_791245 ) ) ( not ( = ?auto_791239 ?auto_791246 ) ) ( not ( = ?auto_791239 ?auto_791247 ) ) ( not ( = ?auto_791239 ?auto_791248 ) ) ( not ( = ?auto_791239 ?auto_791249 ) ) ( not ( = ?auto_791239 ?auto_791250 ) ) ( not ( = ?auto_791239 ?auto_791251 ) ) ( not ( = ?auto_791239 ?auto_791252 ) ) ( not ( = ?auto_791239 ?auto_791253 ) ) ( not ( = ?auto_791239 ?auto_791254 ) ) ( not ( = ?auto_791239 ?auto_791255 ) ) ( not ( = ?auto_791239 ?auto_791256 ) ) ( not ( = ?auto_791240 ?auto_791241 ) ) ( not ( = ?auto_791240 ?auto_791242 ) ) ( not ( = ?auto_791240 ?auto_791243 ) ) ( not ( = ?auto_791240 ?auto_791244 ) ) ( not ( = ?auto_791240 ?auto_791245 ) ) ( not ( = ?auto_791240 ?auto_791246 ) ) ( not ( = ?auto_791240 ?auto_791247 ) ) ( not ( = ?auto_791240 ?auto_791248 ) ) ( not ( = ?auto_791240 ?auto_791249 ) ) ( not ( = ?auto_791240 ?auto_791250 ) ) ( not ( = ?auto_791240 ?auto_791251 ) ) ( not ( = ?auto_791240 ?auto_791252 ) ) ( not ( = ?auto_791240 ?auto_791253 ) ) ( not ( = ?auto_791240 ?auto_791254 ) ) ( not ( = ?auto_791240 ?auto_791255 ) ) ( not ( = ?auto_791240 ?auto_791256 ) ) ( not ( = ?auto_791241 ?auto_791242 ) ) ( not ( = ?auto_791241 ?auto_791243 ) ) ( not ( = ?auto_791241 ?auto_791244 ) ) ( not ( = ?auto_791241 ?auto_791245 ) ) ( not ( = ?auto_791241 ?auto_791246 ) ) ( not ( = ?auto_791241 ?auto_791247 ) ) ( not ( = ?auto_791241 ?auto_791248 ) ) ( not ( = ?auto_791241 ?auto_791249 ) ) ( not ( = ?auto_791241 ?auto_791250 ) ) ( not ( = ?auto_791241 ?auto_791251 ) ) ( not ( = ?auto_791241 ?auto_791252 ) ) ( not ( = ?auto_791241 ?auto_791253 ) ) ( not ( = ?auto_791241 ?auto_791254 ) ) ( not ( = ?auto_791241 ?auto_791255 ) ) ( not ( = ?auto_791241 ?auto_791256 ) ) ( not ( = ?auto_791242 ?auto_791243 ) ) ( not ( = ?auto_791242 ?auto_791244 ) ) ( not ( = ?auto_791242 ?auto_791245 ) ) ( not ( = ?auto_791242 ?auto_791246 ) ) ( not ( = ?auto_791242 ?auto_791247 ) ) ( not ( = ?auto_791242 ?auto_791248 ) ) ( not ( = ?auto_791242 ?auto_791249 ) ) ( not ( = ?auto_791242 ?auto_791250 ) ) ( not ( = ?auto_791242 ?auto_791251 ) ) ( not ( = ?auto_791242 ?auto_791252 ) ) ( not ( = ?auto_791242 ?auto_791253 ) ) ( not ( = ?auto_791242 ?auto_791254 ) ) ( not ( = ?auto_791242 ?auto_791255 ) ) ( not ( = ?auto_791242 ?auto_791256 ) ) ( not ( = ?auto_791243 ?auto_791244 ) ) ( not ( = ?auto_791243 ?auto_791245 ) ) ( not ( = ?auto_791243 ?auto_791246 ) ) ( not ( = ?auto_791243 ?auto_791247 ) ) ( not ( = ?auto_791243 ?auto_791248 ) ) ( not ( = ?auto_791243 ?auto_791249 ) ) ( not ( = ?auto_791243 ?auto_791250 ) ) ( not ( = ?auto_791243 ?auto_791251 ) ) ( not ( = ?auto_791243 ?auto_791252 ) ) ( not ( = ?auto_791243 ?auto_791253 ) ) ( not ( = ?auto_791243 ?auto_791254 ) ) ( not ( = ?auto_791243 ?auto_791255 ) ) ( not ( = ?auto_791243 ?auto_791256 ) ) ( not ( = ?auto_791244 ?auto_791245 ) ) ( not ( = ?auto_791244 ?auto_791246 ) ) ( not ( = ?auto_791244 ?auto_791247 ) ) ( not ( = ?auto_791244 ?auto_791248 ) ) ( not ( = ?auto_791244 ?auto_791249 ) ) ( not ( = ?auto_791244 ?auto_791250 ) ) ( not ( = ?auto_791244 ?auto_791251 ) ) ( not ( = ?auto_791244 ?auto_791252 ) ) ( not ( = ?auto_791244 ?auto_791253 ) ) ( not ( = ?auto_791244 ?auto_791254 ) ) ( not ( = ?auto_791244 ?auto_791255 ) ) ( not ( = ?auto_791244 ?auto_791256 ) ) ( not ( = ?auto_791245 ?auto_791246 ) ) ( not ( = ?auto_791245 ?auto_791247 ) ) ( not ( = ?auto_791245 ?auto_791248 ) ) ( not ( = ?auto_791245 ?auto_791249 ) ) ( not ( = ?auto_791245 ?auto_791250 ) ) ( not ( = ?auto_791245 ?auto_791251 ) ) ( not ( = ?auto_791245 ?auto_791252 ) ) ( not ( = ?auto_791245 ?auto_791253 ) ) ( not ( = ?auto_791245 ?auto_791254 ) ) ( not ( = ?auto_791245 ?auto_791255 ) ) ( not ( = ?auto_791245 ?auto_791256 ) ) ( not ( = ?auto_791246 ?auto_791247 ) ) ( not ( = ?auto_791246 ?auto_791248 ) ) ( not ( = ?auto_791246 ?auto_791249 ) ) ( not ( = ?auto_791246 ?auto_791250 ) ) ( not ( = ?auto_791246 ?auto_791251 ) ) ( not ( = ?auto_791246 ?auto_791252 ) ) ( not ( = ?auto_791246 ?auto_791253 ) ) ( not ( = ?auto_791246 ?auto_791254 ) ) ( not ( = ?auto_791246 ?auto_791255 ) ) ( not ( = ?auto_791246 ?auto_791256 ) ) ( not ( = ?auto_791247 ?auto_791248 ) ) ( not ( = ?auto_791247 ?auto_791249 ) ) ( not ( = ?auto_791247 ?auto_791250 ) ) ( not ( = ?auto_791247 ?auto_791251 ) ) ( not ( = ?auto_791247 ?auto_791252 ) ) ( not ( = ?auto_791247 ?auto_791253 ) ) ( not ( = ?auto_791247 ?auto_791254 ) ) ( not ( = ?auto_791247 ?auto_791255 ) ) ( not ( = ?auto_791247 ?auto_791256 ) ) ( not ( = ?auto_791248 ?auto_791249 ) ) ( not ( = ?auto_791248 ?auto_791250 ) ) ( not ( = ?auto_791248 ?auto_791251 ) ) ( not ( = ?auto_791248 ?auto_791252 ) ) ( not ( = ?auto_791248 ?auto_791253 ) ) ( not ( = ?auto_791248 ?auto_791254 ) ) ( not ( = ?auto_791248 ?auto_791255 ) ) ( not ( = ?auto_791248 ?auto_791256 ) ) ( not ( = ?auto_791249 ?auto_791250 ) ) ( not ( = ?auto_791249 ?auto_791251 ) ) ( not ( = ?auto_791249 ?auto_791252 ) ) ( not ( = ?auto_791249 ?auto_791253 ) ) ( not ( = ?auto_791249 ?auto_791254 ) ) ( not ( = ?auto_791249 ?auto_791255 ) ) ( not ( = ?auto_791249 ?auto_791256 ) ) ( not ( = ?auto_791250 ?auto_791251 ) ) ( not ( = ?auto_791250 ?auto_791252 ) ) ( not ( = ?auto_791250 ?auto_791253 ) ) ( not ( = ?auto_791250 ?auto_791254 ) ) ( not ( = ?auto_791250 ?auto_791255 ) ) ( not ( = ?auto_791250 ?auto_791256 ) ) ( not ( = ?auto_791251 ?auto_791252 ) ) ( not ( = ?auto_791251 ?auto_791253 ) ) ( not ( = ?auto_791251 ?auto_791254 ) ) ( not ( = ?auto_791251 ?auto_791255 ) ) ( not ( = ?auto_791251 ?auto_791256 ) ) ( not ( = ?auto_791252 ?auto_791253 ) ) ( not ( = ?auto_791252 ?auto_791254 ) ) ( not ( = ?auto_791252 ?auto_791255 ) ) ( not ( = ?auto_791252 ?auto_791256 ) ) ( not ( = ?auto_791253 ?auto_791254 ) ) ( not ( = ?auto_791253 ?auto_791255 ) ) ( not ( = ?auto_791253 ?auto_791256 ) ) ( not ( = ?auto_791254 ?auto_791255 ) ) ( not ( = ?auto_791254 ?auto_791256 ) ) ( not ( = ?auto_791255 ?auto_791256 ) ) ( CLEAR ?auto_791254 ) ( ON ?auto_791255 ?auto_791256 ) ( CLEAR ?auto_791255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_791239 ?auto_791240 ?auto_791241 ?auto_791242 ?auto_791243 ?auto_791244 ?auto_791245 ?auto_791246 ?auto_791247 ?auto_791248 ?auto_791249 ?auto_791250 ?auto_791251 ?auto_791252 ?auto_791253 ?auto_791254 ?auto_791255 )
      ( MAKE-18PILE ?auto_791239 ?auto_791240 ?auto_791241 ?auto_791242 ?auto_791243 ?auto_791244 ?auto_791245 ?auto_791246 ?auto_791247 ?auto_791248 ?auto_791249 ?auto_791250 ?auto_791251 ?auto_791252 ?auto_791253 ?auto_791254 ?auto_791255 ?auto_791256 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791275 - BLOCK
      ?auto_791276 - BLOCK
      ?auto_791277 - BLOCK
      ?auto_791278 - BLOCK
      ?auto_791279 - BLOCK
      ?auto_791280 - BLOCK
      ?auto_791281 - BLOCK
      ?auto_791282 - BLOCK
      ?auto_791283 - BLOCK
      ?auto_791284 - BLOCK
      ?auto_791285 - BLOCK
      ?auto_791286 - BLOCK
      ?auto_791287 - BLOCK
      ?auto_791288 - BLOCK
      ?auto_791289 - BLOCK
      ?auto_791290 - BLOCK
      ?auto_791291 - BLOCK
      ?auto_791292 - BLOCK
    )
    :vars
    (
      ?auto_791293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791292 ?auto_791293 ) ( ON-TABLE ?auto_791275 ) ( ON ?auto_791276 ?auto_791275 ) ( ON ?auto_791277 ?auto_791276 ) ( ON ?auto_791278 ?auto_791277 ) ( ON ?auto_791279 ?auto_791278 ) ( ON ?auto_791280 ?auto_791279 ) ( ON ?auto_791281 ?auto_791280 ) ( ON ?auto_791282 ?auto_791281 ) ( ON ?auto_791283 ?auto_791282 ) ( ON ?auto_791284 ?auto_791283 ) ( ON ?auto_791285 ?auto_791284 ) ( ON ?auto_791286 ?auto_791285 ) ( ON ?auto_791287 ?auto_791286 ) ( ON ?auto_791288 ?auto_791287 ) ( ON ?auto_791289 ?auto_791288 ) ( not ( = ?auto_791275 ?auto_791276 ) ) ( not ( = ?auto_791275 ?auto_791277 ) ) ( not ( = ?auto_791275 ?auto_791278 ) ) ( not ( = ?auto_791275 ?auto_791279 ) ) ( not ( = ?auto_791275 ?auto_791280 ) ) ( not ( = ?auto_791275 ?auto_791281 ) ) ( not ( = ?auto_791275 ?auto_791282 ) ) ( not ( = ?auto_791275 ?auto_791283 ) ) ( not ( = ?auto_791275 ?auto_791284 ) ) ( not ( = ?auto_791275 ?auto_791285 ) ) ( not ( = ?auto_791275 ?auto_791286 ) ) ( not ( = ?auto_791275 ?auto_791287 ) ) ( not ( = ?auto_791275 ?auto_791288 ) ) ( not ( = ?auto_791275 ?auto_791289 ) ) ( not ( = ?auto_791275 ?auto_791290 ) ) ( not ( = ?auto_791275 ?auto_791291 ) ) ( not ( = ?auto_791275 ?auto_791292 ) ) ( not ( = ?auto_791275 ?auto_791293 ) ) ( not ( = ?auto_791276 ?auto_791277 ) ) ( not ( = ?auto_791276 ?auto_791278 ) ) ( not ( = ?auto_791276 ?auto_791279 ) ) ( not ( = ?auto_791276 ?auto_791280 ) ) ( not ( = ?auto_791276 ?auto_791281 ) ) ( not ( = ?auto_791276 ?auto_791282 ) ) ( not ( = ?auto_791276 ?auto_791283 ) ) ( not ( = ?auto_791276 ?auto_791284 ) ) ( not ( = ?auto_791276 ?auto_791285 ) ) ( not ( = ?auto_791276 ?auto_791286 ) ) ( not ( = ?auto_791276 ?auto_791287 ) ) ( not ( = ?auto_791276 ?auto_791288 ) ) ( not ( = ?auto_791276 ?auto_791289 ) ) ( not ( = ?auto_791276 ?auto_791290 ) ) ( not ( = ?auto_791276 ?auto_791291 ) ) ( not ( = ?auto_791276 ?auto_791292 ) ) ( not ( = ?auto_791276 ?auto_791293 ) ) ( not ( = ?auto_791277 ?auto_791278 ) ) ( not ( = ?auto_791277 ?auto_791279 ) ) ( not ( = ?auto_791277 ?auto_791280 ) ) ( not ( = ?auto_791277 ?auto_791281 ) ) ( not ( = ?auto_791277 ?auto_791282 ) ) ( not ( = ?auto_791277 ?auto_791283 ) ) ( not ( = ?auto_791277 ?auto_791284 ) ) ( not ( = ?auto_791277 ?auto_791285 ) ) ( not ( = ?auto_791277 ?auto_791286 ) ) ( not ( = ?auto_791277 ?auto_791287 ) ) ( not ( = ?auto_791277 ?auto_791288 ) ) ( not ( = ?auto_791277 ?auto_791289 ) ) ( not ( = ?auto_791277 ?auto_791290 ) ) ( not ( = ?auto_791277 ?auto_791291 ) ) ( not ( = ?auto_791277 ?auto_791292 ) ) ( not ( = ?auto_791277 ?auto_791293 ) ) ( not ( = ?auto_791278 ?auto_791279 ) ) ( not ( = ?auto_791278 ?auto_791280 ) ) ( not ( = ?auto_791278 ?auto_791281 ) ) ( not ( = ?auto_791278 ?auto_791282 ) ) ( not ( = ?auto_791278 ?auto_791283 ) ) ( not ( = ?auto_791278 ?auto_791284 ) ) ( not ( = ?auto_791278 ?auto_791285 ) ) ( not ( = ?auto_791278 ?auto_791286 ) ) ( not ( = ?auto_791278 ?auto_791287 ) ) ( not ( = ?auto_791278 ?auto_791288 ) ) ( not ( = ?auto_791278 ?auto_791289 ) ) ( not ( = ?auto_791278 ?auto_791290 ) ) ( not ( = ?auto_791278 ?auto_791291 ) ) ( not ( = ?auto_791278 ?auto_791292 ) ) ( not ( = ?auto_791278 ?auto_791293 ) ) ( not ( = ?auto_791279 ?auto_791280 ) ) ( not ( = ?auto_791279 ?auto_791281 ) ) ( not ( = ?auto_791279 ?auto_791282 ) ) ( not ( = ?auto_791279 ?auto_791283 ) ) ( not ( = ?auto_791279 ?auto_791284 ) ) ( not ( = ?auto_791279 ?auto_791285 ) ) ( not ( = ?auto_791279 ?auto_791286 ) ) ( not ( = ?auto_791279 ?auto_791287 ) ) ( not ( = ?auto_791279 ?auto_791288 ) ) ( not ( = ?auto_791279 ?auto_791289 ) ) ( not ( = ?auto_791279 ?auto_791290 ) ) ( not ( = ?auto_791279 ?auto_791291 ) ) ( not ( = ?auto_791279 ?auto_791292 ) ) ( not ( = ?auto_791279 ?auto_791293 ) ) ( not ( = ?auto_791280 ?auto_791281 ) ) ( not ( = ?auto_791280 ?auto_791282 ) ) ( not ( = ?auto_791280 ?auto_791283 ) ) ( not ( = ?auto_791280 ?auto_791284 ) ) ( not ( = ?auto_791280 ?auto_791285 ) ) ( not ( = ?auto_791280 ?auto_791286 ) ) ( not ( = ?auto_791280 ?auto_791287 ) ) ( not ( = ?auto_791280 ?auto_791288 ) ) ( not ( = ?auto_791280 ?auto_791289 ) ) ( not ( = ?auto_791280 ?auto_791290 ) ) ( not ( = ?auto_791280 ?auto_791291 ) ) ( not ( = ?auto_791280 ?auto_791292 ) ) ( not ( = ?auto_791280 ?auto_791293 ) ) ( not ( = ?auto_791281 ?auto_791282 ) ) ( not ( = ?auto_791281 ?auto_791283 ) ) ( not ( = ?auto_791281 ?auto_791284 ) ) ( not ( = ?auto_791281 ?auto_791285 ) ) ( not ( = ?auto_791281 ?auto_791286 ) ) ( not ( = ?auto_791281 ?auto_791287 ) ) ( not ( = ?auto_791281 ?auto_791288 ) ) ( not ( = ?auto_791281 ?auto_791289 ) ) ( not ( = ?auto_791281 ?auto_791290 ) ) ( not ( = ?auto_791281 ?auto_791291 ) ) ( not ( = ?auto_791281 ?auto_791292 ) ) ( not ( = ?auto_791281 ?auto_791293 ) ) ( not ( = ?auto_791282 ?auto_791283 ) ) ( not ( = ?auto_791282 ?auto_791284 ) ) ( not ( = ?auto_791282 ?auto_791285 ) ) ( not ( = ?auto_791282 ?auto_791286 ) ) ( not ( = ?auto_791282 ?auto_791287 ) ) ( not ( = ?auto_791282 ?auto_791288 ) ) ( not ( = ?auto_791282 ?auto_791289 ) ) ( not ( = ?auto_791282 ?auto_791290 ) ) ( not ( = ?auto_791282 ?auto_791291 ) ) ( not ( = ?auto_791282 ?auto_791292 ) ) ( not ( = ?auto_791282 ?auto_791293 ) ) ( not ( = ?auto_791283 ?auto_791284 ) ) ( not ( = ?auto_791283 ?auto_791285 ) ) ( not ( = ?auto_791283 ?auto_791286 ) ) ( not ( = ?auto_791283 ?auto_791287 ) ) ( not ( = ?auto_791283 ?auto_791288 ) ) ( not ( = ?auto_791283 ?auto_791289 ) ) ( not ( = ?auto_791283 ?auto_791290 ) ) ( not ( = ?auto_791283 ?auto_791291 ) ) ( not ( = ?auto_791283 ?auto_791292 ) ) ( not ( = ?auto_791283 ?auto_791293 ) ) ( not ( = ?auto_791284 ?auto_791285 ) ) ( not ( = ?auto_791284 ?auto_791286 ) ) ( not ( = ?auto_791284 ?auto_791287 ) ) ( not ( = ?auto_791284 ?auto_791288 ) ) ( not ( = ?auto_791284 ?auto_791289 ) ) ( not ( = ?auto_791284 ?auto_791290 ) ) ( not ( = ?auto_791284 ?auto_791291 ) ) ( not ( = ?auto_791284 ?auto_791292 ) ) ( not ( = ?auto_791284 ?auto_791293 ) ) ( not ( = ?auto_791285 ?auto_791286 ) ) ( not ( = ?auto_791285 ?auto_791287 ) ) ( not ( = ?auto_791285 ?auto_791288 ) ) ( not ( = ?auto_791285 ?auto_791289 ) ) ( not ( = ?auto_791285 ?auto_791290 ) ) ( not ( = ?auto_791285 ?auto_791291 ) ) ( not ( = ?auto_791285 ?auto_791292 ) ) ( not ( = ?auto_791285 ?auto_791293 ) ) ( not ( = ?auto_791286 ?auto_791287 ) ) ( not ( = ?auto_791286 ?auto_791288 ) ) ( not ( = ?auto_791286 ?auto_791289 ) ) ( not ( = ?auto_791286 ?auto_791290 ) ) ( not ( = ?auto_791286 ?auto_791291 ) ) ( not ( = ?auto_791286 ?auto_791292 ) ) ( not ( = ?auto_791286 ?auto_791293 ) ) ( not ( = ?auto_791287 ?auto_791288 ) ) ( not ( = ?auto_791287 ?auto_791289 ) ) ( not ( = ?auto_791287 ?auto_791290 ) ) ( not ( = ?auto_791287 ?auto_791291 ) ) ( not ( = ?auto_791287 ?auto_791292 ) ) ( not ( = ?auto_791287 ?auto_791293 ) ) ( not ( = ?auto_791288 ?auto_791289 ) ) ( not ( = ?auto_791288 ?auto_791290 ) ) ( not ( = ?auto_791288 ?auto_791291 ) ) ( not ( = ?auto_791288 ?auto_791292 ) ) ( not ( = ?auto_791288 ?auto_791293 ) ) ( not ( = ?auto_791289 ?auto_791290 ) ) ( not ( = ?auto_791289 ?auto_791291 ) ) ( not ( = ?auto_791289 ?auto_791292 ) ) ( not ( = ?auto_791289 ?auto_791293 ) ) ( not ( = ?auto_791290 ?auto_791291 ) ) ( not ( = ?auto_791290 ?auto_791292 ) ) ( not ( = ?auto_791290 ?auto_791293 ) ) ( not ( = ?auto_791291 ?auto_791292 ) ) ( not ( = ?auto_791291 ?auto_791293 ) ) ( not ( = ?auto_791292 ?auto_791293 ) ) ( ON ?auto_791291 ?auto_791292 ) ( CLEAR ?auto_791289 ) ( ON ?auto_791290 ?auto_791291 ) ( CLEAR ?auto_791290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_791275 ?auto_791276 ?auto_791277 ?auto_791278 ?auto_791279 ?auto_791280 ?auto_791281 ?auto_791282 ?auto_791283 ?auto_791284 ?auto_791285 ?auto_791286 ?auto_791287 ?auto_791288 ?auto_791289 ?auto_791290 )
      ( MAKE-18PILE ?auto_791275 ?auto_791276 ?auto_791277 ?auto_791278 ?auto_791279 ?auto_791280 ?auto_791281 ?auto_791282 ?auto_791283 ?auto_791284 ?auto_791285 ?auto_791286 ?auto_791287 ?auto_791288 ?auto_791289 ?auto_791290 ?auto_791291 ?auto_791292 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791312 - BLOCK
      ?auto_791313 - BLOCK
      ?auto_791314 - BLOCK
      ?auto_791315 - BLOCK
      ?auto_791316 - BLOCK
      ?auto_791317 - BLOCK
      ?auto_791318 - BLOCK
      ?auto_791319 - BLOCK
      ?auto_791320 - BLOCK
      ?auto_791321 - BLOCK
      ?auto_791322 - BLOCK
      ?auto_791323 - BLOCK
      ?auto_791324 - BLOCK
      ?auto_791325 - BLOCK
      ?auto_791326 - BLOCK
      ?auto_791327 - BLOCK
      ?auto_791328 - BLOCK
      ?auto_791329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791329 ) ( ON-TABLE ?auto_791312 ) ( ON ?auto_791313 ?auto_791312 ) ( ON ?auto_791314 ?auto_791313 ) ( ON ?auto_791315 ?auto_791314 ) ( ON ?auto_791316 ?auto_791315 ) ( ON ?auto_791317 ?auto_791316 ) ( ON ?auto_791318 ?auto_791317 ) ( ON ?auto_791319 ?auto_791318 ) ( ON ?auto_791320 ?auto_791319 ) ( ON ?auto_791321 ?auto_791320 ) ( ON ?auto_791322 ?auto_791321 ) ( ON ?auto_791323 ?auto_791322 ) ( ON ?auto_791324 ?auto_791323 ) ( ON ?auto_791325 ?auto_791324 ) ( ON ?auto_791326 ?auto_791325 ) ( not ( = ?auto_791312 ?auto_791313 ) ) ( not ( = ?auto_791312 ?auto_791314 ) ) ( not ( = ?auto_791312 ?auto_791315 ) ) ( not ( = ?auto_791312 ?auto_791316 ) ) ( not ( = ?auto_791312 ?auto_791317 ) ) ( not ( = ?auto_791312 ?auto_791318 ) ) ( not ( = ?auto_791312 ?auto_791319 ) ) ( not ( = ?auto_791312 ?auto_791320 ) ) ( not ( = ?auto_791312 ?auto_791321 ) ) ( not ( = ?auto_791312 ?auto_791322 ) ) ( not ( = ?auto_791312 ?auto_791323 ) ) ( not ( = ?auto_791312 ?auto_791324 ) ) ( not ( = ?auto_791312 ?auto_791325 ) ) ( not ( = ?auto_791312 ?auto_791326 ) ) ( not ( = ?auto_791312 ?auto_791327 ) ) ( not ( = ?auto_791312 ?auto_791328 ) ) ( not ( = ?auto_791312 ?auto_791329 ) ) ( not ( = ?auto_791313 ?auto_791314 ) ) ( not ( = ?auto_791313 ?auto_791315 ) ) ( not ( = ?auto_791313 ?auto_791316 ) ) ( not ( = ?auto_791313 ?auto_791317 ) ) ( not ( = ?auto_791313 ?auto_791318 ) ) ( not ( = ?auto_791313 ?auto_791319 ) ) ( not ( = ?auto_791313 ?auto_791320 ) ) ( not ( = ?auto_791313 ?auto_791321 ) ) ( not ( = ?auto_791313 ?auto_791322 ) ) ( not ( = ?auto_791313 ?auto_791323 ) ) ( not ( = ?auto_791313 ?auto_791324 ) ) ( not ( = ?auto_791313 ?auto_791325 ) ) ( not ( = ?auto_791313 ?auto_791326 ) ) ( not ( = ?auto_791313 ?auto_791327 ) ) ( not ( = ?auto_791313 ?auto_791328 ) ) ( not ( = ?auto_791313 ?auto_791329 ) ) ( not ( = ?auto_791314 ?auto_791315 ) ) ( not ( = ?auto_791314 ?auto_791316 ) ) ( not ( = ?auto_791314 ?auto_791317 ) ) ( not ( = ?auto_791314 ?auto_791318 ) ) ( not ( = ?auto_791314 ?auto_791319 ) ) ( not ( = ?auto_791314 ?auto_791320 ) ) ( not ( = ?auto_791314 ?auto_791321 ) ) ( not ( = ?auto_791314 ?auto_791322 ) ) ( not ( = ?auto_791314 ?auto_791323 ) ) ( not ( = ?auto_791314 ?auto_791324 ) ) ( not ( = ?auto_791314 ?auto_791325 ) ) ( not ( = ?auto_791314 ?auto_791326 ) ) ( not ( = ?auto_791314 ?auto_791327 ) ) ( not ( = ?auto_791314 ?auto_791328 ) ) ( not ( = ?auto_791314 ?auto_791329 ) ) ( not ( = ?auto_791315 ?auto_791316 ) ) ( not ( = ?auto_791315 ?auto_791317 ) ) ( not ( = ?auto_791315 ?auto_791318 ) ) ( not ( = ?auto_791315 ?auto_791319 ) ) ( not ( = ?auto_791315 ?auto_791320 ) ) ( not ( = ?auto_791315 ?auto_791321 ) ) ( not ( = ?auto_791315 ?auto_791322 ) ) ( not ( = ?auto_791315 ?auto_791323 ) ) ( not ( = ?auto_791315 ?auto_791324 ) ) ( not ( = ?auto_791315 ?auto_791325 ) ) ( not ( = ?auto_791315 ?auto_791326 ) ) ( not ( = ?auto_791315 ?auto_791327 ) ) ( not ( = ?auto_791315 ?auto_791328 ) ) ( not ( = ?auto_791315 ?auto_791329 ) ) ( not ( = ?auto_791316 ?auto_791317 ) ) ( not ( = ?auto_791316 ?auto_791318 ) ) ( not ( = ?auto_791316 ?auto_791319 ) ) ( not ( = ?auto_791316 ?auto_791320 ) ) ( not ( = ?auto_791316 ?auto_791321 ) ) ( not ( = ?auto_791316 ?auto_791322 ) ) ( not ( = ?auto_791316 ?auto_791323 ) ) ( not ( = ?auto_791316 ?auto_791324 ) ) ( not ( = ?auto_791316 ?auto_791325 ) ) ( not ( = ?auto_791316 ?auto_791326 ) ) ( not ( = ?auto_791316 ?auto_791327 ) ) ( not ( = ?auto_791316 ?auto_791328 ) ) ( not ( = ?auto_791316 ?auto_791329 ) ) ( not ( = ?auto_791317 ?auto_791318 ) ) ( not ( = ?auto_791317 ?auto_791319 ) ) ( not ( = ?auto_791317 ?auto_791320 ) ) ( not ( = ?auto_791317 ?auto_791321 ) ) ( not ( = ?auto_791317 ?auto_791322 ) ) ( not ( = ?auto_791317 ?auto_791323 ) ) ( not ( = ?auto_791317 ?auto_791324 ) ) ( not ( = ?auto_791317 ?auto_791325 ) ) ( not ( = ?auto_791317 ?auto_791326 ) ) ( not ( = ?auto_791317 ?auto_791327 ) ) ( not ( = ?auto_791317 ?auto_791328 ) ) ( not ( = ?auto_791317 ?auto_791329 ) ) ( not ( = ?auto_791318 ?auto_791319 ) ) ( not ( = ?auto_791318 ?auto_791320 ) ) ( not ( = ?auto_791318 ?auto_791321 ) ) ( not ( = ?auto_791318 ?auto_791322 ) ) ( not ( = ?auto_791318 ?auto_791323 ) ) ( not ( = ?auto_791318 ?auto_791324 ) ) ( not ( = ?auto_791318 ?auto_791325 ) ) ( not ( = ?auto_791318 ?auto_791326 ) ) ( not ( = ?auto_791318 ?auto_791327 ) ) ( not ( = ?auto_791318 ?auto_791328 ) ) ( not ( = ?auto_791318 ?auto_791329 ) ) ( not ( = ?auto_791319 ?auto_791320 ) ) ( not ( = ?auto_791319 ?auto_791321 ) ) ( not ( = ?auto_791319 ?auto_791322 ) ) ( not ( = ?auto_791319 ?auto_791323 ) ) ( not ( = ?auto_791319 ?auto_791324 ) ) ( not ( = ?auto_791319 ?auto_791325 ) ) ( not ( = ?auto_791319 ?auto_791326 ) ) ( not ( = ?auto_791319 ?auto_791327 ) ) ( not ( = ?auto_791319 ?auto_791328 ) ) ( not ( = ?auto_791319 ?auto_791329 ) ) ( not ( = ?auto_791320 ?auto_791321 ) ) ( not ( = ?auto_791320 ?auto_791322 ) ) ( not ( = ?auto_791320 ?auto_791323 ) ) ( not ( = ?auto_791320 ?auto_791324 ) ) ( not ( = ?auto_791320 ?auto_791325 ) ) ( not ( = ?auto_791320 ?auto_791326 ) ) ( not ( = ?auto_791320 ?auto_791327 ) ) ( not ( = ?auto_791320 ?auto_791328 ) ) ( not ( = ?auto_791320 ?auto_791329 ) ) ( not ( = ?auto_791321 ?auto_791322 ) ) ( not ( = ?auto_791321 ?auto_791323 ) ) ( not ( = ?auto_791321 ?auto_791324 ) ) ( not ( = ?auto_791321 ?auto_791325 ) ) ( not ( = ?auto_791321 ?auto_791326 ) ) ( not ( = ?auto_791321 ?auto_791327 ) ) ( not ( = ?auto_791321 ?auto_791328 ) ) ( not ( = ?auto_791321 ?auto_791329 ) ) ( not ( = ?auto_791322 ?auto_791323 ) ) ( not ( = ?auto_791322 ?auto_791324 ) ) ( not ( = ?auto_791322 ?auto_791325 ) ) ( not ( = ?auto_791322 ?auto_791326 ) ) ( not ( = ?auto_791322 ?auto_791327 ) ) ( not ( = ?auto_791322 ?auto_791328 ) ) ( not ( = ?auto_791322 ?auto_791329 ) ) ( not ( = ?auto_791323 ?auto_791324 ) ) ( not ( = ?auto_791323 ?auto_791325 ) ) ( not ( = ?auto_791323 ?auto_791326 ) ) ( not ( = ?auto_791323 ?auto_791327 ) ) ( not ( = ?auto_791323 ?auto_791328 ) ) ( not ( = ?auto_791323 ?auto_791329 ) ) ( not ( = ?auto_791324 ?auto_791325 ) ) ( not ( = ?auto_791324 ?auto_791326 ) ) ( not ( = ?auto_791324 ?auto_791327 ) ) ( not ( = ?auto_791324 ?auto_791328 ) ) ( not ( = ?auto_791324 ?auto_791329 ) ) ( not ( = ?auto_791325 ?auto_791326 ) ) ( not ( = ?auto_791325 ?auto_791327 ) ) ( not ( = ?auto_791325 ?auto_791328 ) ) ( not ( = ?auto_791325 ?auto_791329 ) ) ( not ( = ?auto_791326 ?auto_791327 ) ) ( not ( = ?auto_791326 ?auto_791328 ) ) ( not ( = ?auto_791326 ?auto_791329 ) ) ( not ( = ?auto_791327 ?auto_791328 ) ) ( not ( = ?auto_791327 ?auto_791329 ) ) ( not ( = ?auto_791328 ?auto_791329 ) ) ( ON ?auto_791328 ?auto_791329 ) ( CLEAR ?auto_791326 ) ( ON ?auto_791327 ?auto_791328 ) ( CLEAR ?auto_791327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_791312 ?auto_791313 ?auto_791314 ?auto_791315 ?auto_791316 ?auto_791317 ?auto_791318 ?auto_791319 ?auto_791320 ?auto_791321 ?auto_791322 ?auto_791323 ?auto_791324 ?auto_791325 ?auto_791326 ?auto_791327 )
      ( MAKE-18PILE ?auto_791312 ?auto_791313 ?auto_791314 ?auto_791315 ?auto_791316 ?auto_791317 ?auto_791318 ?auto_791319 ?auto_791320 ?auto_791321 ?auto_791322 ?auto_791323 ?auto_791324 ?auto_791325 ?auto_791326 ?auto_791327 ?auto_791328 ?auto_791329 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791348 - BLOCK
      ?auto_791349 - BLOCK
      ?auto_791350 - BLOCK
      ?auto_791351 - BLOCK
      ?auto_791352 - BLOCK
      ?auto_791353 - BLOCK
      ?auto_791354 - BLOCK
      ?auto_791355 - BLOCK
      ?auto_791356 - BLOCK
      ?auto_791357 - BLOCK
      ?auto_791358 - BLOCK
      ?auto_791359 - BLOCK
      ?auto_791360 - BLOCK
      ?auto_791361 - BLOCK
      ?auto_791362 - BLOCK
      ?auto_791363 - BLOCK
      ?auto_791364 - BLOCK
      ?auto_791365 - BLOCK
    )
    :vars
    (
      ?auto_791366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791365 ?auto_791366 ) ( ON-TABLE ?auto_791348 ) ( ON ?auto_791349 ?auto_791348 ) ( ON ?auto_791350 ?auto_791349 ) ( ON ?auto_791351 ?auto_791350 ) ( ON ?auto_791352 ?auto_791351 ) ( ON ?auto_791353 ?auto_791352 ) ( ON ?auto_791354 ?auto_791353 ) ( ON ?auto_791355 ?auto_791354 ) ( ON ?auto_791356 ?auto_791355 ) ( ON ?auto_791357 ?auto_791356 ) ( ON ?auto_791358 ?auto_791357 ) ( ON ?auto_791359 ?auto_791358 ) ( ON ?auto_791360 ?auto_791359 ) ( ON ?auto_791361 ?auto_791360 ) ( not ( = ?auto_791348 ?auto_791349 ) ) ( not ( = ?auto_791348 ?auto_791350 ) ) ( not ( = ?auto_791348 ?auto_791351 ) ) ( not ( = ?auto_791348 ?auto_791352 ) ) ( not ( = ?auto_791348 ?auto_791353 ) ) ( not ( = ?auto_791348 ?auto_791354 ) ) ( not ( = ?auto_791348 ?auto_791355 ) ) ( not ( = ?auto_791348 ?auto_791356 ) ) ( not ( = ?auto_791348 ?auto_791357 ) ) ( not ( = ?auto_791348 ?auto_791358 ) ) ( not ( = ?auto_791348 ?auto_791359 ) ) ( not ( = ?auto_791348 ?auto_791360 ) ) ( not ( = ?auto_791348 ?auto_791361 ) ) ( not ( = ?auto_791348 ?auto_791362 ) ) ( not ( = ?auto_791348 ?auto_791363 ) ) ( not ( = ?auto_791348 ?auto_791364 ) ) ( not ( = ?auto_791348 ?auto_791365 ) ) ( not ( = ?auto_791348 ?auto_791366 ) ) ( not ( = ?auto_791349 ?auto_791350 ) ) ( not ( = ?auto_791349 ?auto_791351 ) ) ( not ( = ?auto_791349 ?auto_791352 ) ) ( not ( = ?auto_791349 ?auto_791353 ) ) ( not ( = ?auto_791349 ?auto_791354 ) ) ( not ( = ?auto_791349 ?auto_791355 ) ) ( not ( = ?auto_791349 ?auto_791356 ) ) ( not ( = ?auto_791349 ?auto_791357 ) ) ( not ( = ?auto_791349 ?auto_791358 ) ) ( not ( = ?auto_791349 ?auto_791359 ) ) ( not ( = ?auto_791349 ?auto_791360 ) ) ( not ( = ?auto_791349 ?auto_791361 ) ) ( not ( = ?auto_791349 ?auto_791362 ) ) ( not ( = ?auto_791349 ?auto_791363 ) ) ( not ( = ?auto_791349 ?auto_791364 ) ) ( not ( = ?auto_791349 ?auto_791365 ) ) ( not ( = ?auto_791349 ?auto_791366 ) ) ( not ( = ?auto_791350 ?auto_791351 ) ) ( not ( = ?auto_791350 ?auto_791352 ) ) ( not ( = ?auto_791350 ?auto_791353 ) ) ( not ( = ?auto_791350 ?auto_791354 ) ) ( not ( = ?auto_791350 ?auto_791355 ) ) ( not ( = ?auto_791350 ?auto_791356 ) ) ( not ( = ?auto_791350 ?auto_791357 ) ) ( not ( = ?auto_791350 ?auto_791358 ) ) ( not ( = ?auto_791350 ?auto_791359 ) ) ( not ( = ?auto_791350 ?auto_791360 ) ) ( not ( = ?auto_791350 ?auto_791361 ) ) ( not ( = ?auto_791350 ?auto_791362 ) ) ( not ( = ?auto_791350 ?auto_791363 ) ) ( not ( = ?auto_791350 ?auto_791364 ) ) ( not ( = ?auto_791350 ?auto_791365 ) ) ( not ( = ?auto_791350 ?auto_791366 ) ) ( not ( = ?auto_791351 ?auto_791352 ) ) ( not ( = ?auto_791351 ?auto_791353 ) ) ( not ( = ?auto_791351 ?auto_791354 ) ) ( not ( = ?auto_791351 ?auto_791355 ) ) ( not ( = ?auto_791351 ?auto_791356 ) ) ( not ( = ?auto_791351 ?auto_791357 ) ) ( not ( = ?auto_791351 ?auto_791358 ) ) ( not ( = ?auto_791351 ?auto_791359 ) ) ( not ( = ?auto_791351 ?auto_791360 ) ) ( not ( = ?auto_791351 ?auto_791361 ) ) ( not ( = ?auto_791351 ?auto_791362 ) ) ( not ( = ?auto_791351 ?auto_791363 ) ) ( not ( = ?auto_791351 ?auto_791364 ) ) ( not ( = ?auto_791351 ?auto_791365 ) ) ( not ( = ?auto_791351 ?auto_791366 ) ) ( not ( = ?auto_791352 ?auto_791353 ) ) ( not ( = ?auto_791352 ?auto_791354 ) ) ( not ( = ?auto_791352 ?auto_791355 ) ) ( not ( = ?auto_791352 ?auto_791356 ) ) ( not ( = ?auto_791352 ?auto_791357 ) ) ( not ( = ?auto_791352 ?auto_791358 ) ) ( not ( = ?auto_791352 ?auto_791359 ) ) ( not ( = ?auto_791352 ?auto_791360 ) ) ( not ( = ?auto_791352 ?auto_791361 ) ) ( not ( = ?auto_791352 ?auto_791362 ) ) ( not ( = ?auto_791352 ?auto_791363 ) ) ( not ( = ?auto_791352 ?auto_791364 ) ) ( not ( = ?auto_791352 ?auto_791365 ) ) ( not ( = ?auto_791352 ?auto_791366 ) ) ( not ( = ?auto_791353 ?auto_791354 ) ) ( not ( = ?auto_791353 ?auto_791355 ) ) ( not ( = ?auto_791353 ?auto_791356 ) ) ( not ( = ?auto_791353 ?auto_791357 ) ) ( not ( = ?auto_791353 ?auto_791358 ) ) ( not ( = ?auto_791353 ?auto_791359 ) ) ( not ( = ?auto_791353 ?auto_791360 ) ) ( not ( = ?auto_791353 ?auto_791361 ) ) ( not ( = ?auto_791353 ?auto_791362 ) ) ( not ( = ?auto_791353 ?auto_791363 ) ) ( not ( = ?auto_791353 ?auto_791364 ) ) ( not ( = ?auto_791353 ?auto_791365 ) ) ( not ( = ?auto_791353 ?auto_791366 ) ) ( not ( = ?auto_791354 ?auto_791355 ) ) ( not ( = ?auto_791354 ?auto_791356 ) ) ( not ( = ?auto_791354 ?auto_791357 ) ) ( not ( = ?auto_791354 ?auto_791358 ) ) ( not ( = ?auto_791354 ?auto_791359 ) ) ( not ( = ?auto_791354 ?auto_791360 ) ) ( not ( = ?auto_791354 ?auto_791361 ) ) ( not ( = ?auto_791354 ?auto_791362 ) ) ( not ( = ?auto_791354 ?auto_791363 ) ) ( not ( = ?auto_791354 ?auto_791364 ) ) ( not ( = ?auto_791354 ?auto_791365 ) ) ( not ( = ?auto_791354 ?auto_791366 ) ) ( not ( = ?auto_791355 ?auto_791356 ) ) ( not ( = ?auto_791355 ?auto_791357 ) ) ( not ( = ?auto_791355 ?auto_791358 ) ) ( not ( = ?auto_791355 ?auto_791359 ) ) ( not ( = ?auto_791355 ?auto_791360 ) ) ( not ( = ?auto_791355 ?auto_791361 ) ) ( not ( = ?auto_791355 ?auto_791362 ) ) ( not ( = ?auto_791355 ?auto_791363 ) ) ( not ( = ?auto_791355 ?auto_791364 ) ) ( not ( = ?auto_791355 ?auto_791365 ) ) ( not ( = ?auto_791355 ?auto_791366 ) ) ( not ( = ?auto_791356 ?auto_791357 ) ) ( not ( = ?auto_791356 ?auto_791358 ) ) ( not ( = ?auto_791356 ?auto_791359 ) ) ( not ( = ?auto_791356 ?auto_791360 ) ) ( not ( = ?auto_791356 ?auto_791361 ) ) ( not ( = ?auto_791356 ?auto_791362 ) ) ( not ( = ?auto_791356 ?auto_791363 ) ) ( not ( = ?auto_791356 ?auto_791364 ) ) ( not ( = ?auto_791356 ?auto_791365 ) ) ( not ( = ?auto_791356 ?auto_791366 ) ) ( not ( = ?auto_791357 ?auto_791358 ) ) ( not ( = ?auto_791357 ?auto_791359 ) ) ( not ( = ?auto_791357 ?auto_791360 ) ) ( not ( = ?auto_791357 ?auto_791361 ) ) ( not ( = ?auto_791357 ?auto_791362 ) ) ( not ( = ?auto_791357 ?auto_791363 ) ) ( not ( = ?auto_791357 ?auto_791364 ) ) ( not ( = ?auto_791357 ?auto_791365 ) ) ( not ( = ?auto_791357 ?auto_791366 ) ) ( not ( = ?auto_791358 ?auto_791359 ) ) ( not ( = ?auto_791358 ?auto_791360 ) ) ( not ( = ?auto_791358 ?auto_791361 ) ) ( not ( = ?auto_791358 ?auto_791362 ) ) ( not ( = ?auto_791358 ?auto_791363 ) ) ( not ( = ?auto_791358 ?auto_791364 ) ) ( not ( = ?auto_791358 ?auto_791365 ) ) ( not ( = ?auto_791358 ?auto_791366 ) ) ( not ( = ?auto_791359 ?auto_791360 ) ) ( not ( = ?auto_791359 ?auto_791361 ) ) ( not ( = ?auto_791359 ?auto_791362 ) ) ( not ( = ?auto_791359 ?auto_791363 ) ) ( not ( = ?auto_791359 ?auto_791364 ) ) ( not ( = ?auto_791359 ?auto_791365 ) ) ( not ( = ?auto_791359 ?auto_791366 ) ) ( not ( = ?auto_791360 ?auto_791361 ) ) ( not ( = ?auto_791360 ?auto_791362 ) ) ( not ( = ?auto_791360 ?auto_791363 ) ) ( not ( = ?auto_791360 ?auto_791364 ) ) ( not ( = ?auto_791360 ?auto_791365 ) ) ( not ( = ?auto_791360 ?auto_791366 ) ) ( not ( = ?auto_791361 ?auto_791362 ) ) ( not ( = ?auto_791361 ?auto_791363 ) ) ( not ( = ?auto_791361 ?auto_791364 ) ) ( not ( = ?auto_791361 ?auto_791365 ) ) ( not ( = ?auto_791361 ?auto_791366 ) ) ( not ( = ?auto_791362 ?auto_791363 ) ) ( not ( = ?auto_791362 ?auto_791364 ) ) ( not ( = ?auto_791362 ?auto_791365 ) ) ( not ( = ?auto_791362 ?auto_791366 ) ) ( not ( = ?auto_791363 ?auto_791364 ) ) ( not ( = ?auto_791363 ?auto_791365 ) ) ( not ( = ?auto_791363 ?auto_791366 ) ) ( not ( = ?auto_791364 ?auto_791365 ) ) ( not ( = ?auto_791364 ?auto_791366 ) ) ( not ( = ?auto_791365 ?auto_791366 ) ) ( ON ?auto_791364 ?auto_791365 ) ( ON ?auto_791363 ?auto_791364 ) ( CLEAR ?auto_791361 ) ( ON ?auto_791362 ?auto_791363 ) ( CLEAR ?auto_791362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_791348 ?auto_791349 ?auto_791350 ?auto_791351 ?auto_791352 ?auto_791353 ?auto_791354 ?auto_791355 ?auto_791356 ?auto_791357 ?auto_791358 ?auto_791359 ?auto_791360 ?auto_791361 ?auto_791362 )
      ( MAKE-18PILE ?auto_791348 ?auto_791349 ?auto_791350 ?auto_791351 ?auto_791352 ?auto_791353 ?auto_791354 ?auto_791355 ?auto_791356 ?auto_791357 ?auto_791358 ?auto_791359 ?auto_791360 ?auto_791361 ?auto_791362 ?auto_791363 ?auto_791364 ?auto_791365 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791385 - BLOCK
      ?auto_791386 - BLOCK
      ?auto_791387 - BLOCK
      ?auto_791388 - BLOCK
      ?auto_791389 - BLOCK
      ?auto_791390 - BLOCK
      ?auto_791391 - BLOCK
      ?auto_791392 - BLOCK
      ?auto_791393 - BLOCK
      ?auto_791394 - BLOCK
      ?auto_791395 - BLOCK
      ?auto_791396 - BLOCK
      ?auto_791397 - BLOCK
      ?auto_791398 - BLOCK
      ?auto_791399 - BLOCK
      ?auto_791400 - BLOCK
      ?auto_791401 - BLOCK
      ?auto_791402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791402 ) ( ON-TABLE ?auto_791385 ) ( ON ?auto_791386 ?auto_791385 ) ( ON ?auto_791387 ?auto_791386 ) ( ON ?auto_791388 ?auto_791387 ) ( ON ?auto_791389 ?auto_791388 ) ( ON ?auto_791390 ?auto_791389 ) ( ON ?auto_791391 ?auto_791390 ) ( ON ?auto_791392 ?auto_791391 ) ( ON ?auto_791393 ?auto_791392 ) ( ON ?auto_791394 ?auto_791393 ) ( ON ?auto_791395 ?auto_791394 ) ( ON ?auto_791396 ?auto_791395 ) ( ON ?auto_791397 ?auto_791396 ) ( ON ?auto_791398 ?auto_791397 ) ( not ( = ?auto_791385 ?auto_791386 ) ) ( not ( = ?auto_791385 ?auto_791387 ) ) ( not ( = ?auto_791385 ?auto_791388 ) ) ( not ( = ?auto_791385 ?auto_791389 ) ) ( not ( = ?auto_791385 ?auto_791390 ) ) ( not ( = ?auto_791385 ?auto_791391 ) ) ( not ( = ?auto_791385 ?auto_791392 ) ) ( not ( = ?auto_791385 ?auto_791393 ) ) ( not ( = ?auto_791385 ?auto_791394 ) ) ( not ( = ?auto_791385 ?auto_791395 ) ) ( not ( = ?auto_791385 ?auto_791396 ) ) ( not ( = ?auto_791385 ?auto_791397 ) ) ( not ( = ?auto_791385 ?auto_791398 ) ) ( not ( = ?auto_791385 ?auto_791399 ) ) ( not ( = ?auto_791385 ?auto_791400 ) ) ( not ( = ?auto_791385 ?auto_791401 ) ) ( not ( = ?auto_791385 ?auto_791402 ) ) ( not ( = ?auto_791386 ?auto_791387 ) ) ( not ( = ?auto_791386 ?auto_791388 ) ) ( not ( = ?auto_791386 ?auto_791389 ) ) ( not ( = ?auto_791386 ?auto_791390 ) ) ( not ( = ?auto_791386 ?auto_791391 ) ) ( not ( = ?auto_791386 ?auto_791392 ) ) ( not ( = ?auto_791386 ?auto_791393 ) ) ( not ( = ?auto_791386 ?auto_791394 ) ) ( not ( = ?auto_791386 ?auto_791395 ) ) ( not ( = ?auto_791386 ?auto_791396 ) ) ( not ( = ?auto_791386 ?auto_791397 ) ) ( not ( = ?auto_791386 ?auto_791398 ) ) ( not ( = ?auto_791386 ?auto_791399 ) ) ( not ( = ?auto_791386 ?auto_791400 ) ) ( not ( = ?auto_791386 ?auto_791401 ) ) ( not ( = ?auto_791386 ?auto_791402 ) ) ( not ( = ?auto_791387 ?auto_791388 ) ) ( not ( = ?auto_791387 ?auto_791389 ) ) ( not ( = ?auto_791387 ?auto_791390 ) ) ( not ( = ?auto_791387 ?auto_791391 ) ) ( not ( = ?auto_791387 ?auto_791392 ) ) ( not ( = ?auto_791387 ?auto_791393 ) ) ( not ( = ?auto_791387 ?auto_791394 ) ) ( not ( = ?auto_791387 ?auto_791395 ) ) ( not ( = ?auto_791387 ?auto_791396 ) ) ( not ( = ?auto_791387 ?auto_791397 ) ) ( not ( = ?auto_791387 ?auto_791398 ) ) ( not ( = ?auto_791387 ?auto_791399 ) ) ( not ( = ?auto_791387 ?auto_791400 ) ) ( not ( = ?auto_791387 ?auto_791401 ) ) ( not ( = ?auto_791387 ?auto_791402 ) ) ( not ( = ?auto_791388 ?auto_791389 ) ) ( not ( = ?auto_791388 ?auto_791390 ) ) ( not ( = ?auto_791388 ?auto_791391 ) ) ( not ( = ?auto_791388 ?auto_791392 ) ) ( not ( = ?auto_791388 ?auto_791393 ) ) ( not ( = ?auto_791388 ?auto_791394 ) ) ( not ( = ?auto_791388 ?auto_791395 ) ) ( not ( = ?auto_791388 ?auto_791396 ) ) ( not ( = ?auto_791388 ?auto_791397 ) ) ( not ( = ?auto_791388 ?auto_791398 ) ) ( not ( = ?auto_791388 ?auto_791399 ) ) ( not ( = ?auto_791388 ?auto_791400 ) ) ( not ( = ?auto_791388 ?auto_791401 ) ) ( not ( = ?auto_791388 ?auto_791402 ) ) ( not ( = ?auto_791389 ?auto_791390 ) ) ( not ( = ?auto_791389 ?auto_791391 ) ) ( not ( = ?auto_791389 ?auto_791392 ) ) ( not ( = ?auto_791389 ?auto_791393 ) ) ( not ( = ?auto_791389 ?auto_791394 ) ) ( not ( = ?auto_791389 ?auto_791395 ) ) ( not ( = ?auto_791389 ?auto_791396 ) ) ( not ( = ?auto_791389 ?auto_791397 ) ) ( not ( = ?auto_791389 ?auto_791398 ) ) ( not ( = ?auto_791389 ?auto_791399 ) ) ( not ( = ?auto_791389 ?auto_791400 ) ) ( not ( = ?auto_791389 ?auto_791401 ) ) ( not ( = ?auto_791389 ?auto_791402 ) ) ( not ( = ?auto_791390 ?auto_791391 ) ) ( not ( = ?auto_791390 ?auto_791392 ) ) ( not ( = ?auto_791390 ?auto_791393 ) ) ( not ( = ?auto_791390 ?auto_791394 ) ) ( not ( = ?auto_791390 ?auto_791395 ) ) ( not ( = ?auto_791390 ?auto_791396 ) ) ( not ( = ?auto_791390 ?auto_791397 ) ) ( not ( = ?auto_791390 ?auto_791398 ) ) ( not ( = ?auto_791390 ?auto_791399 ) ) ( not ( = ?auto_791390 ?auto_791400 ) ) ( not ( = ?auto_791390 ?auto_791401 ) ) ( not ( = ?auto_791390 ?auto_791402 ) ) ( not ( = ?auto_791391 ?auto_791392 ) ) ( not ( = ?auto_791391 ?auto_791393 ) ) ( not ( = ?auto_791391 ?auto_791394 ) ) ( not ( = ?auto_791391 ?auto_791395 ) ) ( not ( = ?auto_791391 ?auto_791396 ) ) ( not ( = ?auto_791391 ?auto_791397 ) ) ( not ( = ?auto_791391 ?auto_791398 ) ) ( not ( = ?auto_791391 ?auto_791399 ) ) ( not ( = ?auto_791391 ?auto_791400 ) ) ( not ( = ?auto_791391 ?auto_791401 ) ) ( not ( = ?auto_791391 ?auto_791402 ) ) ( not ( = ?auto_791392 ?auto_791393 ) ) ( not ( = ?auto_791392 ?auto_791394 ) ) ( not ( = ?auto_791392 ?auto_791395 ) ) ( not ( = ?auto_791392 ?auto_791396 ) ) ( not ( = ?auto_791392 ?auto_791397 ) ) ( not ( = ?auto_791392 ?auto_791398 ) ) ( not ( = ?auto_791392 ?auto_791399 ) ) ( not ( = ?auto_791392 ?auto_791400 ) ) ( not ( = ?auto_791392 ?auto_791401 ) ) ( not ( = ?auto_791392 ?auto_791402 ) ) ( not ( = ?auto_791393 ?auto_791394 ) ) ( not ( = ?auto_791393 ?auto_791395 ) ) ( not ( = ?auto_791393 ?auto_791396 ) ) ( not ( = ?auto_791393 ?auto_791397 ) ) ( not ( = ?auto_791393 ?auto_791398 ) ) ( not ( = ?auto_791393 ?auto_791399 ) ) ( not ( = ?auto_791393 ?auto_791400 ) ) ( not ( = ?auto_791393 ?auto_791401 ) ) ( not ( = ?auto_791393 ?auto_791402 ) ) ( not ( = ?auto_791394 ?auto_791395 ) ) ( not ( = ?auto_791394 ?auto_791396 ) ) ( not ( = ?auto_791394 ?auto_791397 ) ) ( not ( = ?auto_791394 ?auto_791398 ) ) ( not ( = ?auto_791394 ?auto_791399 ) ) ( not ( = ?auto_791394 ?auto_791400 ) ) ( not ( = ?auto_791394 ?auto_791401 ) ) ( not ( = ?auto_791394 ?auto_791402 ) ) ( not ( = ?auto_791395 ?auto_791396 ) ) ( not ( = ?auto_791395 ?auto_791397 ) ) ( not ( = ?auto_791395 ?auto_791398 ) ) ( not ( = ?auto_791395 ?auto_791399 ) ) ( not ( = ?auto_791395 ?auto_791400 ) ) ( not ( = ?auto_791395 ?auto_791401 ) ) ( not ( = ?auto_791395 ?auto_791402 ) ) ( not ( = ?auto_791396 ?auto_791397 ) ) ( not ( = ?auto_791396 ?auto_791398 ) ) ( not ( = ?auto_791396 ?auto_791399 ) ) ( not ( = ?auto_791396 ?auto_791400 ) ) ( not ( = ?auto_791396 ?auto_791401 ) ) ( not ( = ?auto_791396 ?auto_791402 ) ) ( not ( = ?auto_791397 ?auto_791398 ) ) ( not ( = ?auto_791397 ?auto_791399 ) ) ( not ( = ?auto_791397 ?auto_791400 ) ) ( not ( = ?auto_791397 ?auto_791401 ) ) ( not ( = ?auto_791397 ?auto_791402 ) ) ( not ( = ?auto_791398 ?auto_791399 ) ) ( not ( = ?auto_791398 ?auto_791400 ) ) ( not ( = ?auto_791398 ?auto_791401 ) ) ( not ( = ?auto_791398 ?auto_791402 ) ) ( not ( = ?auto_791399 ?auto_791400 ) ) ( not ( = ?auto_791399 ?auto_791401 ) ) ( not ( = ?auto_791399 ?auto_791402 ) ) ( not ( = ?auto_791400 ?auto_791401 ) ) ( not ( = ?auto_791400 ?auto_791402 ) ) ( not ( = ?auto_791401 ?auto_791402 ) ) ( ON ?auto_791401 ?auto_791402 ) ( ON ?auto_791400 ?auto_791401 ) ( CLEAR ?auto_791398 ) ( ON ?auto_791399 ?auto_791400 ) ( CLEAR ?auto_791399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_791385 ?auto_791386 ?auto_791387 ?auto_791388 ?auto_791389 ?auto_791390 ?auto_791391 ?auto_791392 ?auto_791393 ?auto_791394 ?auto_791395 ?auto_791396 ?auto_791397 ?auto_791398 ?auto_791399 )
      ( MAKE-18PILE ?auto_791385 ?auto_791386 ?auto_791387 ?auto_791388 ?auto_791389 ?auto_791390 ?auto_791391 ?auto_791392 ?auto_791393 ?auto_791394 ?auto_791395 ?auto_791396 ?auto_791397 ?auto_791398 ?auto_791399 ?auto_791400 ?auto_791401 ?auto_791402 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791421 - BLOCK
      ?auto_791422 - BLOCK
      ?auto_791423 - BLOCK
      ?auto_791424 - BLOCK
      ?auto_791425 - BLOCK
      ?auto_791426 - BLOCK
      ?auto_791427 - BLOCK
      ?auto_791428 - BLOCK
      ?auto_791429 - BLOCK
      ?auto_791430 - BLOCK
      ?auto_791431 - BLOCK
      ?auto_791432 - BLOCK
      ?auto_791433 - BLOCK
      ?auto_791434 - BLOCK
      ?auto_791435 - BLOCK
      ?auto_791436 - BLOCK
      ?auto_791437 - BLOCK
      ?auto_791438 - BLOCK
    )
    :vars
    (
      ?auto_791439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791438 ?auto_791439 ) ( ON-TABLE ?auto_791421 ) ( ON ?auto_791422 ?auto_791421 ) ( ON ?auto_791423 ?auto_791422 ) ( ON ?auto_791424 ?auto_791423 ) ( ON ?auto_791425 ?auto_791424 ) ( ON ?auto_791426 ?auto_791425 ) ( ON ?auto_791427 ?auto_791426 ) ( ON ?auto_791428 ?auto_791427 ) ( ON ?auto_791429 ?auto_791428 ) ( ON ?auto_791430 ?auto_791429 ) ( ON ?auto_791431 ?auto_791430 ) ( ON ?auto_791432 ?auto_791431 ) ( ON ?auto_791433 ?auto_791432 ) ( not ( = ?auto_791421 ?auto_791422 ) ) ( not ( = ?auto_791421 ?auto_791423 ) ) ( not ( = ?auto_791421 ?auto_791424 ) ) ( not ( = ?auto_791421 ?auto_791425 ) ) ( not ( = ?auto_791421 ?auto_791426 ) ) ( not ( = ?auto_791421 ?auto_791427 ) ) ( not ( = ?auto_791421 ?auto_791428 ) ) ( not ( = ?auto_791421 ?auto_791429 ) ) ( not ( = ?auto_791421 ?auto_791430 ) ) ( not ( = ?auto_791421 ?auto_791431 ) ) ( not ( = ?auto_791421 ?auto_791432 ) ) ( not ( = ?auto_791421 ?auto_791433 ) ) ( not ( = ?auto_791421 ?auto_791434 ) ) ( not ( = ?auto_791421 ?auto_791435 ) ) ( not ( = ?auto_791421 ?auto_791436 ) ) ( not ( = ?auto_791421 ?auto_791437 ) ) ( not ( = ?auto_791421 ?auto_791438 ) ) ( not ( = ?auto_791421 ?auto_791439 ) ) ( not ( = ?auto_791422 ?auto_791423 ) ) ( not ( = ?auto_791422 ?auto_791424 ) ) ( not ( = ?auto_791422 ?auto_791425 ) ) ( not ( = ?auto_791422 ?auto_791426 ) ) ( not ( = ?auto_791422 ?auto_791427 ) ) ( not ( = ?auto_791422 ?auto_791428 ) ) ( not ( = ?auto_791422 ?auto_791429 ) ) ( not ( = ?auto_791422 ?auto_791430 ) ) ( not ( = ?auto_791422 ?auto_791431 ) ) ( not ( = ?auto_791422 ?auto_791432 ) ) ( not ( = ?auto_791422 ?auto_791433 ) ) ( not ( = ?auto_791422 ?auto_791434 ) ) ( not ( = ?auto_791422 ?auto_791435 ) ) ( not ( = ?auto_791422 ?auto_791436 ) ) ( not ( = ?auto_791422 ?auto_791437 ) ) ( not ( = ?auto_791422 ?auto_791438 ) ) ( not ( = ?auto_791422 ?auto_791439 ) ) ( not ( = ?auto_791423 ?auto_791424 ) ) ( not ( = ?auto_791423 ?auto_791425 ) ) ( not ( = ?auto_791423 ?auto_791426 ) ) ( not ( = ?auto_791423 ?auto_791427 ) ) ( not ( = ?auto_791423 ?auto_791428 ) ) ( not ( = ?auto_791423 ?auto_791429 ) ) ( not ( = ?auto_791423 ?auto_791430 ) ) ( not ( = ?auto_791423 ?auto_791431 ) ) ( not ( = ?auto_791423 ?auto_791432 ) ) ( not ( = ?auto_791423 ?auto_791433 ) ) ( not ( = ?auto_791423 ?auto_791434 ) ) ( not ( = ?auto_791423 ?auto_791435 ) ) ( not ( = ?auto_791423 ?auto_791436 ) ) ( not ( = ?auto_791423 ?auto_791437 ) ) ( not ( = ?auto_791423 ?auto_791438 ) ) ( not ( = ?auto_791423 ?auto_791439 ) ) ( not ( = ?auto_791424 ?auto_791425 ) ) ( not ( = ?auto_791424 ?auto_791426 ) ) ( not ( = ?auto_791424 ?auto_791427 ) ) ( not ( = ?auto_791424 ?auto_791428 ) ) ( not ( = ?auto_791424 ?auto_791429 ) ) ( not ( = ?auto_791424 ?auto_791430 ) ) ( not ( = ?auto_791424 ?auto_791431 ) ) ( not ( = ?auto_791424 ?auto_791432 ) ) ( not ( = ?auto_791424 ?auto_791433 ) ) ( not ( = ?auto_791424 ?auto_791434 ) ) ( not ( = ?auto_791424 ?auto_791435 ) ) ( not ( = ?auto_791424 ?auto_791436 ) ) ( not ( = ?auto_791424 ?auto_791437 ) ) ( not ( = ?auto_791424 ?auto_791438 ) ) ( not ( = ?auto_791424 ?auto_791439 ) ) ( not ( = ?auto_791425 ?auto_791426 ) ) ( not ( = ?auto_791425 ?auto_791427 ) ) ( not ( = ?auto_791425 ?auto_791428 ) ) ( not ( = ?auto_791425 ?auto_791429 ) ) ( not ( = ?auto_791425 ?auto_791430 ) ) ( not ( = ?auto_791425 ?auto_791431 ) ) ( not ( = ?auto_791425 ?auto_791432 ) ) ( not ( = ?auto_791425 ?auto_791433 ) ) ( not ( = ?auto_791425 ?auto_791434 ) ) ( not ( = ?auto_791425 ?auto_791435 ) ) ( not ( = ?auto_791425 ?auto_791436 ) ) ( not ( = ?auto_791425 ?auto_791437 ) ) ( not ( = ?auto_791425 ?auto_791438 ) ) ( not ( = ?auto_791425 ?auto_791439 ) ) ( not ( = ?auto_791426 ?auto_791427 ) ) ( not ( = ?auto_791426 ?auto_791428 ) ) ( not ( = ?auto_791426 ?auto_791429 ) ) ( not ( = ?auto_791426 ?auto_791430 ) ) ( not ( = ?auto_791426 ?auto_791431 ) ) ( not ( = ?auto_791426 ?auto_791432 ) ) ( not ( = ?auto_791426 ?auto_791433 ) ) ( not ( = ?auto_791426 ?auto_791434 ) ) ( not ( = ?auto_791426 ?auto_791435 ) ) ( not ( = ?auto_791426 ?auto_791436 ) ) ( not ( = ?auto_791426 ?auto_791437 ) ) ( not ( = ?auto_791426 ?auto_791438 ) ) ( not ( = ?auto_791426 ?auto_791439 ) ) ( not ( = ?auto_791427 ?auto_791428 ) ) ( not ( = ?auto_791427 ?auto_791429 ) ) ( not ( = ?auto_791427 ?auto_791430 ) ) ( not ( = ?auto_791427 ?auto_791431 ) ) ( not ( = ?auto_791427 ?auto_791432 ) ) ( not ( = ?auto_791427 ?auto_791433 ) ) ( not ( = ?auto_791427 ?auto_791434 ) ) ( not ( = ?auto_791427 ?auto_791435 ) ) ( not ( = ?auto_791427 ?auto_791436 ) ) ( not ( = ?auto_791427 ?auto_791437 ) ) ( not ( = ?auto_791427 ?auto_791438 ) ) ( not ( = ?auto_791427 ?auto_791439 ) ) ( not ( = ?auto_791428 ?auto_791429 ) ) ( not ( = ?auto_791428 ?auto_791430 ) ) ( not ( = ?auto_791428 ?auto_791431 ) ) ( not ( = ?auto_791428 ?auto_791432 ) ) ( not ( = ?auto_791428 ?auto_791433 ) ) ( not ( = ?auto_791428 ?auto_791434 ) ) ( not ( = ?auto_791428 ?auto_791435 ) ) ( not ( = ?auto_791428 ?auto_791436 ) ) ( not ( = ?auto_791428 ?auto_791437 ) ) ( not ( = ?auto_791428 ?auto_791438 ) ) ( not ( = ?auto_791428 ?auto_791439 ) ) ( not ( = ?auto_791429 ?auto_791430 ) ) ( not ( = ?auto_791429 ?auto_791431 ) ) ( not ( = ?auto_791429 ?auto_791432 ) ) ( not ( = ?auto_791429 ?auto_791433 ) ) ( not ( = ?auto_791429 ?auto_791434 ) ) ( not ( = ?auto_791429 ?auto_791435 ) ) ( not ( = ?auto_791429 ?auto_791436 ) ) ( not ( = ?auto_791429 ?auto_791437 ) ) ( not ( = ?auto_791429 ?auto_791438 ) ) ( not ( = ?auto_791429 ?auto_791439 ) ) ( not ( = ?auto_791430 ?auto_791431 ) ) ( not ( = ?auto_791430 ?auto_791432 ) ) ( not ( = ?auto_791430 ?auto_791433 ) ) ( not ( = ?auto_791430 ?auto_791434 ) ) ( not ( = ?auto_791430 ?auto_791435 ) ) ( not ( = ?auto_791430 ?auto_791436 ) ) ( not ( = ?auto_791430 ?auto_791437 ) ) ( not ( = ?auto_791430 ?auto_791438 ) ) ( not ( = ?auto_791430 ?auto_791439 ) ) ( not ( = ?auto_791431 ?auto_791432 ) ) ( not ( = ?auto_791431 ?auto_791433 ) ) ( not ( = ?auto_791431 ?auto_791434 ) ) ( not ( = ?auto_791431 ?auto_791435 ) ) ( not ( = ?auto_791431 ?auto_791436 ) ) ( not ( = ?auto_791431 ?auto_791437 ) ) ( not ( = ?auto_791431 ?auto_791438 ) ) ( not ( = ?auto_791431 ?auto_791439 ) ) ( not ( = ?auto_791432 ?auto_791433 ) ) ( not ( = ?auto_791432 ?auto_791434 ) ) ( not ( = ?auto_791432 ?auto_791435 ) ) ( not ( = ?auto_791432 ?auto_791436 ) ) ( not ( = ?auto_791432 ?auto_791437 ) ) ( not ( = ?auto_791432 ?auto_791438 ) ) ( not ( = ?auto_791432 ?auto_791439 ) ) ( not ( = ?auto_791433 ?auto_791434 ) ) ( not ( = ?auto_791433 ?auto_791435 ) ) ( not ( = ?auto_791433 ?auto_791436 ) ) ( not ( = ?auto_791433 ?auto_791437 ) ) ( not ( = ?auto_791433 ?auto_791438 ) ) ( not ( = ?auto_791433 ?auto_791439 ) ) ( not ( = ?auto_791434 ?auto_791435 ) ) ( not ( = ?auto_791434 ?auto_791436 ) ) ( not ( = ?auto_791434 ?auto_791437 ) ) ( not ( = ?auto_791434 ?auto_791438 ) ) ( not ( = ?auto_791434 ?auto_791439 ) ) ( not ( = ?auto_791435 ?auto_791436 ) ) ( not ( = ?auto_791435 ?auto_791437 ) ) ( not ( = ?auto_791435 ?auto_791438 ) ) ( not ( = ?auto_791435 ?auto_791439 ) ) ( not ( = ?auto_791436 ?auto_791437 ) ) ( not ( = ?auto_791436 ?auto_791438 ) ) ( not ( = ?auto_791436 ?auto_791439 ) ) ( not ( = ?auto_791437 ?auto_791438 ) ) ( not ( = ?auto_791437 ?auto_791439 ) ) ( not ( = ?auto_791438 ?auto_791439 ) ) ( ON ?auto_791437 ?auto_791438 ) ( ON ?auto_791436 ?auto_791437 ) ( ON ?auto_791435 ?auto_791436 ) ( CLEAR ?auto_791433 ) ( ON ?auto_791434 ?auto_791435 ) ( CLEAR ?auto_791434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_791421 ?auto_791422 ?auto_791423 ?auto_791424 ?auto_791425 ?auto_791426 ?auto_791427 ?auto_791428 ?auto_791429 ?auto_791430 ?auto_791431 ?auto_791432 ?auto_791433 ?auto_791434 )
      ( MAKE-18PILE ?auto_791421 ?auto_791422 ?auto_791423 ?auto_791424 ?auto_791425 ?auto_791426 ?auto_791427 ?auto_791428 ?auto_791429 ?auto_791430 ?auto_791431 ?auto_791432 ?auto_791433 ?auto_791434 ?auto_791435 ?auto_791436 ?auto_791437 ?auto_791438 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791458 - BLOCK
      ?auto_791459 - BLOCK
      ?auto_791460 - BLOCK
      ?auto_791461 - BLOCK
      ?auto_791462 - BLOCK
      ?auto_791463 - BLOCK
      ?auto_791464 - BLOCK
      ?auto_791465 - BLOCK
      ?auto_791466 - BLOCK
      ?auto_791467 - BLOCK
      ?auto_791468 - BLOCK
      ?auto_791469 - BLOCK
      ?auto_791470 - BLOCK
      ?auto_791471 - BLOCK
      ?auto_791472 - BLOCK
      ?auto_791473 - BLOCK
      ?auto_791474 - BLOCK
      ?auto_791475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791475 ) ( ON-TABLE ?auto_791458 ) ( ON ?auto_791459 ?auto_791458 ) ( ON ?auto_791460 ?auto_791459 ) ( ON ?auto_791461 ?auto_791460 ) ( ON ?auto_791462 ?auto_791461 ) ( ON ?auto_791463 ?auto_791462 ) ( ON ?auto_791464 ?auto_791463 ) ( ON ?auto_791465 ?auto_791464 ) ( ON ?auto_791466 ?auto_791465 ) ( ON ?auto_791467 ?auto_791466 ) ( ON ?auto_791468 ?auto_791467 ) ( ON ?auto_791469 ?auto_791468 ) ( ON ?auto_791470 ?auto_791469 ) ( not ( = ?auto_791458 ?auto_791459 ) ) ( not ( = ?auto_791458 ?auto_791460 ) ) ( not ( = ?auto_791458 ?auto_791461 ) ) ( not ( = ?auto_791458 ?auto_791462 ) ) ( not ( = ?auto_791458 ?auto_791463 ) ) ( not ( = ?auto_791458 ?auto_791464 ) ) ( not ( = ?auto_791458 ?auto_791465 ) ) ( not ( = ?auto_791458 ?auto_791466 ) ) ( not ( = ?auto_791458 ?auto_791467 ) ) ( not ( = ?auto_791458 ?auto_791468 ) ) ( not ( = ?auto_791458 ?auto_791469 ) ) ( not ( = ?auto_791458 ?auto_791470 ) ) ( not ( = ?auto_791458 ?auto_791471 ) ) ( not ( = ?auto_791458 ?auto_791472 ) ) ( not ( = ?auto_791458 ?auto_791473 ) ) ( not ( = ?auto_791458 ?auto_791474 ) ) ( not ( = ?auto_791458 ?auto_791475 ) ) ( not ( = ?auto_791459 ?auto_791460 ) ) ( not ( = ?auto_791459 ?auto_791461 ) ) ( not ( = ?auto_791459 ?auto_791462 ) ) ( not ( = ?auto_791459 ?auto_791463 ) ) ( not ( = ?auto_791459 ?auto_791464 ) ) ( not ( = ?auto_791459 ?auto_791465 ) ) ( not ( = ?auto_791459 ?auto_791466 ) ) ( not ( = ?auto_791459 ?auto_791467 ) ) ( not ( = ?auto_791459 ?auto_791468 ) ) ( not ( = ?auto_791459 ?auto_791469 ) ) ( not ( = ?auto_791459 ?auto_791470 ) ) ( not ( = ?auto_791459 ?auto_791471 ) ) ( not ( = ?auto_791459 ?auto_791472 ) ) ( not ( = ?auto_791459 ?auto_791473 ) ) ( not ( = ?auto_791459 ?auto_791474 ) ) ( not ( = ?auto_791459 ?auto_791475 ) ) ( not ( = ?auto_791460 ?auto_791461 ) ) ( not ( = ?auto_791460 ?auto_791462 ) ) ( not ( = ?auto_791460 ?auto_791463 ) ) ( not ( = ?auto_791460 ?auto_791464 ) ) ( not ( = ?auto_791460 ?auto_791465 ) ) ( not ( = ?auto_791460 ?auto_791466 ) ) ( not ( = ?auto_791460 ?auto_791467 ) ) ( not ( = ?auto_791460 ?auto_791468 ) ) ( not ( = ?auto_791460 ?auto_791469 ) ) ( not ( = ?auto_791460 ?auto_791470 ) ) ( not ( = ?auto_791460 ?auto_791471 ) ) ( not ( = ?auto_791460 ?auto_791472 ) ) ( not ( = ?auto_791460 ?auto_791473 ) ) ( not ( = ?auto_791460 ?auto_791474 ) ) ( not ( = ?auto_791460 ?auto_791475 ) ) ( not ( = ?auto_791461 ?auto_791462 ) ) ( not ( = ?auto_791461 ?auto_791463 ) ) ( not ( = ?auto_791461 ?auto_791464 ) ) ( not ( = ?auto_791461 ?auto_791465 ) ) ( not ( = ?auto_791461 ?auto_791466 ) ) ( not ( = ?auto_791461 ?auto_791467 ) ) ( not ( = ?auto_791461 ?auto_791468 ) ) ( not ( = ?auto_791461 ?auto_791469 ) ) ( not ( = ?auto_791461 ?auto_791470 ) ) ( not ( = ?auto_791461 ?auto_791471 ) ) ( not ( = ?auto_791461 ?auto_791472 ) ) ( not ( = ?auto_791461 ?auto_791473 ) ) ( not ( = ?auto_791461 ?auto_791474 ) ) ( not ( = ?auto_791461 ?auto_791475 ) ) ( not ( = ?auto_791462 ?auto_791463 ) ) ( not ( = ?auto_791462 ?auto_791464 ) ) ( not ( = ?auto_791462 ?auto_791465 ) ) ( not ( = ?auto_791462 ?auto_791466 ) ) ( not ( = ?auto_791462 ?auto_791467 ) ) ( not ( = ?auto_791462 ?auto_791468 ) ) ( not ( = ?auto_791462 ?auto_791469 ) ) ( not ( = ?auto_791462 ?auto_791470 ) ) ( not ( = ?auto_791462 ?auto_791471 ) ) ( not ( = ?auto_791462 ?auto_791472 ) ) ( not ( = ?auto_791462 ?auto_791473 ) ) ( not ( = ?auto_791462 ?auto_791474 ) ) ( not ( = ?auto_791462 ?auto_791475 ) ) ( not ( = ?auto_791463 ?auto_791464 ) ) ( not ( = ?auto_791463 ?auto_791465 ) ) ( not ( = ?auto_791463 ?auto_791466 ) ) ( not ( = ?auto_791463 ?auto_791467 ) ) ( not ( = ?auto_791463 ?auto_791468 ) ) ( not ( = ?auto_791463 ?auto_791469 ) ) ( not ( = ?auto_791463 ?auto_791470 ) ) ( not ( = ?auto_791463 ?auto_791471 ) ) ( not ( = ?auto_791463 ?auto_791472 ) ) ( not ( = ?auto_791463 ?auto_791473 ) ) ( not ( = ?auto_791463 ?auto_791474 ) ) ( not ( = ?auto_791463 ?auto_791475 ) ) ( not ( = ?auto_791464 ?auto_791465 ) ) ( not ( = ?auto_791464 ?auto_791466 ) ) ( not ( = ?auto_791464 ?auto_791467 ) ) ( not ( = ?auto_791464 ?auto_791468 ) ) ( not ( = ?auto_791464 ?auto_791469 ) ) ( not ( = ?auto_791464 ?auto_791470 ) ) ( not ( = ?auto_791464 ?auto_791471 ) ) ( not ( = ?auto_791464 ?auto_791472 ) ) ( not ( = ?auto_791464 ?auto_791473 ) ) ( not ( = ?auto_791464 ?auto_791474 ) ) ( not ( = ?auto_791464 ?auto_791475 ) ) ( not ( = ?auto_791465 ?auto_791466 ) ) ( not ( = ?auto_791465 ?auto_791467 ) ) ( not ( = ?auto_791465 ?auto_791468 ) ) ( not ( = ?auto_791465 ?auto_791469 ) ) ( not ( = ?auto_791465 ?auto_791470 ) ) ( not ( = ?auto_791465 ?auto_791471 ) ) ( not ( = ?auto_791465 ?auto_791472 ) ) ( not ( = ?auto_791465 ?auto_791473 ) ) ( not ( = ?auto_791465 ?auto_791474 ) ) ( not ( = ?auto_791465 ?auto_791475 ) ) ( not ( = ?auto_791466 ?auto_791467 ) ) ( not ( = ?auto_791466 ?auto_791468 ) ) ( not ( = ?auto_791466 ?auto_791469 ) ) ( not ( = ?auto_791466 ?auto_791470 ) ) ( not ( = ?auto_791466 ?auto_791471 ) ) ( not ( = ?auto_791466 ?auto_791472 ) ) ( not ( = ?auto_791466 ?auto_791473 ) ) ( not ( = ?auto_791466 ?auto_791474 ) ) ( not ( = ?auto_791466 ?auto_791475 ) ) ( not ( = ?auto_791467 ?auto_791468 ) ) ( not ( = ?auto_791467 ?auto_791469 ) ) ( not ( = ?auto_791467 ?auto_791470 ) ) ( not ( = ?auto_791467 ?auto_791471 ) ) ( not ( = ?auto_791467 ?auto_791472 ) ) ( not ( = ?auto_791467 ?auto_791473 ) ) ( not ( = ?auto_791467 ?auto_791474 ) ) ( not ( = ?auto_791467 ?auto_791475 ) ) ( not ( = ?auto_791468 ?auto_791469 ) ) ( not ( = ?auto_791468 ?auto_791470 ) ) ( not ( = ?auto_791468 ?auto_791471 ) ) ( not ( = ?auto_791468 ?auto_791472 ) ) ( not ( = ?auto_791468 ?auto_791473 ) ) ( not ( = ?auto_791468 ?auto_791474 ) ) ( not ( = ?auto_791468 ?auto_791475 ) ) ( not ( = ?auto_791469 ?auto_791470 ) ) ( not ( = ?auto_791469 ?auto_791471 ) ) ( not ( = ?auto_791469 ?auto_791472 ) ) ( not ( = ?auto_791469 ?auto_791473 ) ) ( not ( = ?auto_791469 ?auto_791474 ) ) ( not ( = ?auto_791469 ?auto_791475 ) ) ( not ( = ?auto_791470 ?auto_791471 ) ) ( not ( = ?auto_791470 ?auto_791472 ) ) ( not ( = ?auto_791470 ?auto_791473 ) ) ( not ( = ?auto_791470 ?auto_791474 ) ) ( not ( = ?auto_791470 ?auto_791475 ) ) ( not ( = ?auto_791471 ?auto_791472 ) ) ( not ( = ?auto_791471 ?auto_791473 ) ) ( not ( = ?auto_791471 ?auto_791474 ) ) ( not ( = ?auto_791471 ?auto_791475 ) ) ( not ( = ?auto_791472 ?auto_791473 ) ) ( not ( = ?auto_791472 ?auto_791474 ) ) ( not ( = ?auto_791472 ?auto_791475 ) ) ( not ( = ?auto_791473 ?auto_791474 ) ) ( not ( = ?auto_791473 ?auto_791475 ) ) ( not ( = ?auto_791474 ?auto_791475 ) ) ( ON ?auto_791474 ?auto_791475 ) ( ON ?auto_791473 ?auto_791474 ) ( ON ?auto_791472 ?auto_791473 ) ( CLEAR ?auto_791470 ) ( ON ?auto_791471 ?auto_791472 ) ( CLEAR ?auto_791471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_791458 ?auto_791459 ?auto_791460 ?auto_791461 ?auto_791462 ?auto_791463 ?auto_791464 ?auto_791465 ?auto_791466 ?auto_791467 ?auto_791468 ?auto_791469 ?auto_791470 ?auto_791471 )
      ( MAKE-18PILE ?auto_791458 ?auto_791459 ?auto_791460 ?auto_791461 ?auto_791462 ?auto_791463 ?auto_791464 ?auto_791465 ?auto_791466 ?auto_791467 ?auto_791468 ?auto_791469 ?auto_791470 ?auto_791471 ?auto_791472 ?auto_791473 ?auto_791474 ?auto_791475 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791494 - BLOCK
      ?auto_791495 - BLOCK
      ?auto_791496 - BLOCK
      ?auto_791497 - BLOCK
      ?auto_791498 - BLOCK
      ?auto_791499 - BLOCK
      ?auto_791500 - BLOCK
      ?auto_791501 - BLOCK
      ?auto_791502 - BLOCK
      ?auto_791503 - BLOCK
      ?auto_791504 - BLOCK
      ?auto_791505 - BLOCK
      ?auto_791506 - BLOCK
      ?auto_791507 - BLOCK
      ?auto_791508 - BLOCK
      ?auto_791509 - BLOCK
      ?auto_791510 - BLOCK
      ?auto_791511 - BLOCK
    )
    :vars
    (
      ?auto_791512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791511 ?auto_791512 ) ( ON-TABLE ?auto_791494 ) ( ON ?auto_791495 ?auto_791494 ) ( ON ?auto_791496 ?auto_791495 ) ( ON ?auto_791497 ?auto_791496 ) ( ON ?auto_791498 ?auto_791497 ) ( ON ?auto_791499 ?auto_791498 ) ( ON ?auto_791500 ?auto_791499 ) ( ON ?auto_791501 ?auto_791500 ) ( ON ?auto_791502 ?auto_791501 ) ( ON ?auto_791503 ?auto_791502 ) ( ON ?auto_791504 ?auto_791503 ) ( ON ?auto_791505 ?auto_791504 ) ( not ( = ?auto_791494 ?auto_791495 ) ) ( not ( = ?auto_791494 ?auto_791496 ) ) ( not ( = ?auto_791494 ?auto_791497 ) ) ( not ( = ?auto_791494 ?auto_791498 ) ) ( not ( = ?auto_791494 ?auto_791499 ) ) ( not ( = ?auto_791494 ?auto_791500 ) ) ( not ( = ?auto_791494 ?auto_791501 ) ) ( not ( = ?auto_791494 ?auto_791502 ) ) ( not ( = ?auto_791494 ?auto_791503 ) ) ( not ( = ?auto_791494 ?auto_791504 ) ) ( not ( = ?auto_791494 ?auto_791505 ) ) ( not ( = ?auto_791494 ?auto_791506 ) ) ( not ( = ?auto_791494 ?auto_791507 ) ) ( not ( = ?auto_791494 ?auto_791508 ) ) ( not ( = ?auto_791494 ?auto_791509 ) ) ( not ( = ?auto_791494 ?auto_791510 ) ) ( not ( = ?auto_791494 ?auto_791511 ) ) ( not ( = ?auto_791494 ?auto_791512 ) ) ( not ( = ?auto_791495 ?auto_791496 ) ) ( not ( = ?auto_791495 ?auto_791497 ) ) ( not ( = ?auto_791495 ?auto_791498 ) ) ( not ( = ?auto_791495 ?auto_791499 ) ) ( not ( = ?auto_791495 ?auto_791500 ) ) ( not ( = ?auto_791495 ?auto_791501 ) ) ( not ( = ?auto_791495 ?auto_791502 ) ) ( not ( = ?auto_791495 ?auto_791503 ) ) ( not ( = ?auto_791495 ?auto_791504 ) ) ( not ( = ?auto_791495 ?auto_791505 ) ) ( not ( = ?auto_791495 ?auto_791506 ) ) ( not ( = ?auto_791495 ?auto_791507 ) ) ( not ( = ?auto_791495 ?auto_791508 ) ) ( not ( = ?auto_791495 ?auto_791509 ) ) ( not ( = ?auto_791495 ?auto_791510 ) ) ( not ( = ?auto_791495 ?auto_791511 ) ) ( not ( = ?auto_791495 ?auto_791512 ) ) ( not ( = ?auto_791496 ?auto_791497 ) ) ( not ( = ?auto_791496 ?auto_791498 ) ) ( not ( = ?auto_791496 ?auto_791499 ) ) ( not ( = ?auto_791496 ?auto_791500 ) ) ( not ( = ?auto_791496 ?auto_791501 ) ) ( not ( = ?auto_791496 ?auto_791502 ) ) ( not ( = ?auto_791496 ?auto_791503 ) ) ( not ( = ?auto_791496 ?auto_791504 ) ) ( not ( = ?auto_791496 ?auto_791505 ) ) ( not ( = ?auto_791496 ?auto_791506 ) ) ( not ( = ?auto_791496 ?auto_791507 ) ) ( not ( = ?auto_791496 ?auto_791508 ) ) ( not ( = ?auto_791496 ?auto_791509 ) ) ( not ( = ?auto_791496 ?auto_791510 ) ) ( not ( = ?auto_791496 ?auto_791511 ) ) ( not ( = ?auto_791496 ?auto_791512 ) ) ( not ( = ?auto_791497 ?auto_791498 ) ) ( not ( = ?auto_791497 ?auto_791499 ) ) ( not ( = ?auto_791497 ?auto_791500 ) ) ( not ( = ?auto_791497 ?auto_791501 ) ) ( not ( = ?auto_791497 ?auto_791502 ) ) ( not ( = ?auto_791497 ?auto_791503 ) ) ( not ( = ?auto_791497 ?auto_791504 ) ) ( not ( = ?auto_791497 ?auto_791505 ) ) ( not ( = ?auto_791497 ?auto_791506 ) ) ( not ( = ?auto_791497 ?auto_791507 ) ) ( not ( = ?auto_791497 ?auto_791508 ) ) ( not ( = ?auto_791497 ?auto_791509 ) ) ( not ( = ?auto_791497 ?auto_791510 ) ) ( not ( = ?auto_791497 ?auto_791511 ) ) ( not ( = ?auto_791497 ?auto_791512 ) ) ( not ( = ?auto_791498 ?auto_791499 ) ) ( not ( = ?auto_791498 ?auto_791500 ) ) ( not ( = ?auto_791498 ?auto_791501 ) ) ( not ( = ?auto_791498 ?auto_791502 ) ) ( not ( = ?auto_791498 ?auto_791503 ) ) ( not ( = ?auto_791498 ?auto_791504 ) ) ( not ( = ?auto_791498 ?auto_791505 ) ) ( not ( = ?auto_791498 ?auto_791506 ) ) ( not ( = ?auto_791498 ?auto_791507 ) ) ( not ( = ?auto_791498 ?auto_791508 ) ) ( not ( = ?auto_791498 ?auto_791509 ) ) ( not ( = ?auto_791498 ?auto_791510 ) ) ( not ( = ?auto_791498 ?auto_791511 ) ) ( not ( = ?auto_791498 ?auto_791512 ) ) ( not ( = ?auto_791499 ?auto_791500 ) ) ( not ( = ?auto_791499 ?auto_791501 ) ) ( not ( = ?auto_791499 ?auto_791502 ) ) ( not ( = ?auto_791499 ?auto_791503 ) ) ( not ( = ?auto_791499 ?auto_791504 ) ) ( not ( = ?auto_791499 ?auto_791505 ) ) ( not ( = ?auto_791499 ?auto_791506 ) ) ( not ( = ?auto_791499 ?auto_791507 ) ) ( not ( = ?auto_791499 ?auto_791508 ) ) ( not ( = ?auto_791499 ?auto_791509 ) ) ( not ( = ?auto_791499 ?auto_791510 ) ) ( not ( = ?auto_791499 ?auto_791511 ) ) ( not ( = ?auto_791499 ?auto_791512 ) ) ( not ( = ?auto_791500 ?auto_791501 ) ) ( not ( = ?auto_791500 ?auto_791502 ) ) ( not ( = ?auto_791500 ?auto_791503 ) ) ( not ( = ?auto_791500 ?auto_791504 ) ) ( not ( = ?auto_791500 ?auto_791505 ) ) ( not ( = ?auto_791500 ?auto_791506 ) ) ( not ( = ?auto_791500 ?auto_791507 ) ) ( not ( = ?auto_791500 ?auto_791508 ) ) ( not ( = ?auto_791500 ?auto_791509 ) ) ( not ( = ?auto_791500 ?auto_791510 ) ) ( not ( = ?auto_791500 ?auto_791511 ) ) ( not ( = ?auto_791500 ?auto_791512 ) ) ( not ( = ?auto_791501 ?auto_791502 ) ) ( not ( = ?auto_791501 ?auto_791503 ) ) ( not ( = ?auto_791501 ?auto_791504 ) ) ( not ( = ?auto_791501 ?auto_791505 ) ) ( not ( = ?auto_791501 ?auto_791506 ) ) ( not ( = ?auto_791501 ?auto_791507 ) ) ( not ( = ?auto_791501 ?auto_791508 ) ) ( not ( = ?auto_791501 ?auto_791509 ) ) ( not ( = ?auto_791501 ?auto_791510 ) ) ( not ( = ?auto_791501 ?auto_791511 ) ) ( not ( = ?auto_791501 ?auto_791512 ) ) ( not ( = ?auto_791502 ?auto_791503 ) ) ( not ( = ?auto_791502 ?auto_791504 ) ) ( not ( = ?auto_791502 ?auto_791505 ) ) ( not ( = ?auto_791502 ?auto_791506 ) ) ( not ( = ?auto_791502 ?auto_791507 ) ) ( not ( = ?auto_791502 ?auto_791508 ) ) ( not ( = ?auto_791502 ?auto_791509 ) ) ( not ( = ?auto_791502 ?auto_791510 ) ) ( not ( = ?auto_791502 ?auto_791511 ) ) ( not ( = ?auto_791502 ?auto_791512 ) ) ( not ( = ?auto_791503 ?auto_791504 ) ) ( not ( = ?auto_791503 ?auto_791505 ) ) ( not ( = ?auto_791503 ?auto_791506 ) ) ( not ( = ?auto_791503 ?auto_791507 ) ) ( not ( = ?auto_791503 ?auto_791508 ) ) ( not ( = ?auto_791503 ?auto_791509 ) ) ( not ( = ?auto_791503 ?auto_791510 ) ) ( not ( = ?auto_791503 ?auto_791511 ) ) ( not ( = ?auto_791503 ?auto_791512 ) ) ( not ( = ?auto_791504 ?auto_791505 ) ) ( not ( = ?auto_791504 ?auto_791506 ) ) ( not ( = ?auto_791504 ?auto_791507 ) ) ( not ( = ?auto_791504 ?auto_791508 ) ) ( not ( = ?auto_791504 ?auto_791509 ) ) ( not ( = ?auto_791504 ?auto_791510 ) ) ( not ( = ?auto_791504 ?auto_791511 ) ) ( not ( = ?auto_791504 ?auto_791512 ) ) ( not ( = ?auto_791505 ?auto_791506 ) ) ( not ( = ?auto_791505 ?auto_791507 ) ) ( not ( = ?auto_791505 ?auto_791508 ) ) ( not ( = ?auto_791505 ?auto_791509 ) ) ( not ( = ?auto_791505 ?auto_791510 ) ) ( not ( = ?auto_791505 ?auto_791511 ) ) ( not ( = ?auto_791505 ?auto_791512 ) ) ( not ( = ?auto_791506 ?auto_791507 ) ) ( not ( = ?auto_791506 ?auto_791508 ) ) ( not ( = ?auto_791506 ?auto_791509 ) ) ( not ( = ?auto_791506 ?auto_791510 ) ) ( not ( = ?auto_791506 ?auto_791511 ) ) ( not ( = ?auto_791506 ?auto_791512 ) ) ( not ( = ?auto_791507 ?auto_791508 ) ) ( not ( = ?auto_791507 ?auto_791509 ) ) ( not ( = ?auto_791507 ?auto_791510 ) ) ( not ( = ?auto_791507 ?auto_791511 ) ) ( not ( = ?auto_791507 ?auto_791512 ) ) ( not ( = ?auto_791508 ?auto_791509 ) ) ( not ( = ?auto_791508 ?auto_791510 ) ) ( not ( = ?auto_791508 ?auto_791511 ) ) ( not ( = ?auto_791508 ?auto_791512 ) ) ( not ( = ?auto_791509 ?auto_791510 ) ) ( not ( = ?auto_791509 ?auto_791511 ) ) ( not ( = ?auto_791509 ?auto_791512 ) ) ( not ( = ?auto_791510 ?auto_791511 ) ) ( not ( = ?auto_791510 ?auto_791512 ) ) ( not ( = ?auto_791511 ?auto_791512 ) ) ( ON ?auto_791510 ?auto_791511 ) ( ON ?auto_791509 ?auto_791510 ) ( ON ?auto_791508 ?auto_791509 ) ( ON ?auto_791507 ?auto_791508 ) ( CLEAR ?auto_791505 ) ( ON ?auto_791506 ?auto_791507 ) ( CLEAR ?auto_791506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_791494 ?auto_791495 ?auto_791496 ?auto_791497 ?auto_791498 ?auto_791499 ?auto_791500 ?auto_791501 ?auto_791502 ?auto_791503 ?auto_791504 ?auto_791505 ?auto_791506 )
      ( MAKE-18PILE ?auto_791494 ?auto_791495 ?auto_791496 ?auto_791497 ?auto_791498 ?auto_791499 ?auto_791500 ?auto_791501 ?auto_791502 ?auto_791503 ?auto_791504 ?auto_791505 ?auto_791506 ?auto_791507 ?auto_791508 ?auto_791509 ?auto_791510 ?auto_791511 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791531 - BLOCK
      ?auto_791532 - BLOCK
      ?auto_791533 - BLOCK
      ?auto_791534 - BLOCK
      ?auto_791535 - BLOCK
      ?auto_791536 - BLOCK
      ?auto_791537 - BLOCK
      ?auto_791538 - BLOCK
      ?auto_791539 - BLOCK
      ?auto_791540 - BLOCK
      ?auto_791541 - BLOCK
      ?auto_791542 - BLOCK
      ?auto_791543 - BLOCK
      ?auto_791544 - BLOCK
      ?auto_791545 - BLOCK
      ?auto_791546 - BLOCK
      ?auto_791547 - BLOCK
      ?auto_791548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791548 ) ( ON-TABLE ?auto_791531 ) ( ON ?auto_791532 ?auto_791531 ) ( ON ?auto_791533 ?auto_791532 ) ( ON ?auto_791534 ?auto_791533 ) ( ON ?auto_791535 ?auto_791534 ) ( ON ?auto_791536 ?auto_791535 ) ( ON ?auto_791537 ?auto_791536 ) ( ON ?auto_791538 ?auto_791537 ) ( ON ?auto_791539 ?auto_791538 ) ( ON ?auto_791540 ?auto_791539 ) ( ON ?auto_791541 ?auto_791540 ) ( ON ?auto_791542 ?auto_791541 ) ( not ( = ?auto_791531 ?auto_791532 ) ) ( not ( = ?auto_791531 ?auto_791533 ) ) ( not ( = ?auto_791531 ?auto_791534 ) ) ( not ( = ?auto_791531 ?auto_791535 ) ) ( not ( = ?auto_791531 ?auto_791536 ) ) ( not ( = ?auto_791531 ?auto_791537 ) ) ( not ( = ?auto_791531 ?auto_791538 ) ) ( not ( = ?auto_791531 ?auto_791539 ) ) ( not ( = ?auto_791531 ?auto_791540 ) ) ( not ( = ?auto_791531 ?auto_791541 ) ) ( not ( = ?auto_791531 ?auto_791542 ) ) ( not ( = ?auto_791531 ?auto_791543 ) ) ( not ( = ?auto_791531 ?auto_791544 ) ) ( not ( = ?auto_791531 ?auto_791545 ) ) ( not ( = ?auto_791531 ?auto_791546 ) ) ( not ( = ?auto_791531 ?auto_791547 ) ) ( not ( = ?auto_791531 ?auto_791548 ) ) ( not ( = ?auto_791532 ?auto_791533 ) ) ( not ( = ?auto_791532 ?auto_791534 ) ) ( not ( = ?auto_791532 ?auto_791535 ) ) ( not ( = ?auto_791532 ?auto_791536 ) ) ( not ( = ?auto_791532 ?auto_791537 ) ) ( not ( = ?auto_791532 ?auto_791538 ) ) ( not ( = ?auto_791532 ?auto_791539 ) ) ( not ( = ?auto_791532 ?auto_791540 ) ) ( not ( = ?auto_791532 ?auto_791541 ) ) ( not ( = ?auto_791532 ?auto_791542 ) ) ( not ( = ?auto_791532 ?auto_791543 ) ) ( not ( = ?auto_791532 ?auto_791544 ) ) ( not ( = ?auto_791532 ?auto_791545 ) ) ( not ( = ?auto_791532 ?auto_791546 ) ) ( not ( = ?auto_791532 ?auto_791547 ) ) ( not ( = ?auto_791532 ?auto_791548 ) ) ( not ( = ?auto_791533 ?auto_791534 ) ) ( not ( = ?auto_791533 ?auto_791535 ) ) ( not ( = ?auto_791533 ?auto_791536 ) ) ( not ( = ?auto_791533 ?auto_791537 ) ) ( not ( = ?auto_791533 ?auto_791538 ) ) ( not ( = ?auto_791533 ?auto_791539 ) ) ( not ( = ?auto_791533 ?auto_791540 ) ) ( not ( = ?auto_791533 ?auto_791541 ) ) ( not ( = ?auto_791533 ?auto_791542 ) ) ( not ( = ?auto_791533 ?auto_791543 ) ) ( not ( = ?auto_791533 ?auto_791544 ) ) ( not ( = ?auto_791533 ?auto_791545 ) ) ( not ( = ?auto_791533 ?auto_791546 ) ) ( not ( = ?auto_791533 ?auto_791547 ) ) ( not ( = ?auto_791533 ?auto_791548 ) ) ( not ( = ?auto_791534 ?auto_791535 ) ) ( not ( = ?auto_791534 ?auto_791536 ) ) ( not ( = ?auto_791534 ?auto_791537 ) ) ( not ( = ?auto_791534 ?auto_791538 ) ) ( not ( = ?auto_791534 ?auto_791539 ) ) ( not ( = ?auto_791534 ?auto_791540 ) ) ( not ( = ?auto_791534 ?auto_791541 ) ) ( not ( = ?auto_791534 ?auto_791542 ) ) ( not ( = ?auto_791534 ?auto_791543 ) ) ( not ( = ?auto_791534 ?auto_791544 ) ) ( not ( = ?auto_791534 ?auto_791545 ) ) ( not ( = ?auto_791534 ?auto_791546 ) ) ( not ( = ?auto_791534 ?auto_791547 ) ) ( not ( = ?auto_791534 ?auto_791548 ) ) ( not ( = ?auto_791535 ?auto_791536 ) ) ( not ( = ?auto_791535 ?auto_791537 ) ) ( not ( = ?auto_791535 ?auto_791538 ) ) ( not ( = ?auto_791535 ?auto_791539 ) ) ( not ( = ?auto_791535 ?auto_791540 ) ) ( not ( = ?auto_791535 ?auto_791541 ) ) ( not ( = ?auto_791535 ?auto_791542 ) ) ( not ( = ?auto_791535 ?auto_791543 ) ) ( not ( = ?auto_791535 ?auto_791544 ) ) ( not ( = ?auto_791535 ?auto_791545 ) ) ( not ( = ?auto_791535 ?auto_791546 ) ) ( not ( = ?auto_791535 ?auto_791547 ) ) ( not ( = ?auto_791535 ?auto_791548 ) ) ( not ( = ?auto_791536 ?auto_791537 ) ) ( not ( = ?auto_791536 ?auto_791538 ) ) ( not ( = ?auto_791536 ?auto_791539 ) ) ( not ( = ?auto_791536 ?auto_791540 ) ) ( not ( = ?auto_791536 ?auto_791541 ) ) ( not ( = ?auto_791536 ?auto_791542 ) ) ( not ( = ?auto_791536 ?auto_791543 ) ) ( not ( = ?auto_791536 ?auto_791544 ) ) ( not ( = ?auto_791536 ?auto_791545 ) ) ( not ( = ?auto_791536 ?auto_791546 ) ) ( not ( = ?auto_791536 ?auto_791547 ) ) ( not ( = ?auto_791536 ?auto_791548 ) ) ( not ( = ?auto_791537 ?auto_791538 ) ) ( not ( = ?auto_791537 ?auto_791539 ) ) ( not ( = ?auto_791537 ?auto_791540 ) ) ( not ( = ?auto_791537 ?auto_791541 ) ) ( not ( = ?auto_791537 ?auto_791542 ) ) ( not ( = ?auto_791537 ?auto_791543 ) ) ( not ( = ?auto_791537 ?auto_791544 ) ) ( not ( = ?auto_791537 ?auto_791545 ) ) ( not ( = ?auto_791537 ?auto_791546 ) ) ( not ( = ?auto_791537 ?auto_791547 ) ) ( not ( = ?auto_791537 ?auto_791548 ) ) ( not ( = ?auto_791538 ?auto_791539 ) ) ( not ( = ?auto_791538 ?auto_791540 ) ) ( not ( = ?auto_791538 ?auto_791541 ) ) ( not ( = ?auto_791538 ?auto_791542 ) ) ( not ( = ?auto_791538 ?auto_791543 ) ) ( not ( = ?auto_791538 ?auto_791544 ) ) ( not ( = ?auto_791538 ?auto_791545 ) ) ( not ( = ?auto_791538 ?auto_791546 ) ) ( not ( = ?auto_791538 ?auto_791547 ) ) ( not ( = ?auto_791538 ?auto_791548 ) ) ( not ( = ?auto_791539 ?auto_791540 ) ) ( not ( = ?auto_791539 ?auto_791541 ) ) ( not ( = ?auto_791539 ?auto_791542 ) ) ( not ( = ?auto_791539 ?auto_791543 ) ) ( not ( = ?auto_791539 ?auto_791544 ) ) ( not ( = ?auto_791539 ?auto_791545 ) ) ( not ( = ?auto_791539 ?auto_791546 ) ) ( not ( = ?auto_791539 ?auto_791547 ) ) ( not ( = ?auto_791539 ?auto_791548 ) ) ( not ( = ?auto_791540 ?auto_791541 ) ) ( not ( = ?auto_791540 ?auto_791542 ) ) ( not ( = ?auto_791540 ?auto_791543 ) ) ( not ( = ?auto_791540 ?auto_791544 ) ) ( not ( = ?auto_791540 ?auto_791545 ) ) ( not ( = ?auto_791540 ?auto_791546 ) ) ( not ( = ?auto_791540 ?auto_791547 ) ) ( not ( = ?auto_791540 ?auto_791548 ) ) ( not ( = ?auto_791541 ?auto_791542 ) ) ( not ( = ?auto_791541 ?auto_791543 ) ) ( not ( = ?auto_791541 ?auto_791544 ) ) ( not ( = ?auto_791541 ?auto_791545 ) ) ( not ( = ?auto_791541 ?auto_791546 ) ) ( not ( = ?auto_791541 ?auto_791547 ) ) ( not ( = ?auto_791541 ?auto_791548 ) ) ( not ( = ?auto_791542 ?auto_791543 ) ) ( not ( = ?auto_791542 ?auto_791544 ) ) ( not ( = ?auto_791542 ?auto_791545 ) ) ( not ( = ?auto_791542 ?auto_791546 ) ) ( not ( = ?auto_791542 ?auto_791547 ) ) ( not ( = ?auto_791542 ?auto_791548 ) ) ( not ( = ?auto_791543 ?auto_791544 ) ) ( not ( = ?auto_791543 ?auto_791545 ) ) ( not ( = ?auto_791543 ?auto_791546 ) ) ( not ( = ?auto_791543 ?auto_791547 ) ) ( not ( = ?auto_791543 ?auto_791548 ) ) ( not ( = ?auto_791544 ?auto_791545 ) ) ( not ( = ?auto_791544 ?auto_791546 ) ) ( not ( = ?auto_791544 ?auto_791547 ) ) ( not ( = ?auto_791544 ?auto_791548 ) ) ( not ( = ?auto_791545 ?auto_791546 ) ) ( not ( = ?auto_791545 ?auto_791547 ) ) ( not ( = ?auto_791545 ?auto_791548 ) ) ( not ( = ?auto_791546 ?auto_791547 ) ) ( not ( = ?auto_791546 ?auto_791548 ) ) ( not ( = ?auto_791547 ?auto_791548 ) ) ( ON ?auto_791547 ?auto_791548 ) ( ON ?auto_791546 ?auto_791547 ) ( ON ?auto_791545 ?auto_791546 ) ( ON ?auto_791544 ?auto_791545 ) ( CLEAR ?auto_791542 ) ( ON ?auto_791543 ?auto_791544 ) ( CLEAR ?auto_791543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_791531 ?auto_791532 ?auto_791533 ?auto_791534 ?auto_791535 ?auto_791536 ?auto_791537 ?auto_791538 ?auto_791539 ?auto_791540 ?auto_791541 ?auto_791542 ?auto_791543 )
      ( MAKE-18PILE ?auto_791531 ?auto_791532 ?auto_791533 ?auto_791534 ?auto_791535 ?auto_791536 ?auto_791537 ?auto_791538 ?auto_791539 ?auto_791540 ?auto_791541 ?auto_791542 ?auto_791543 ?auto_791544 ?auto_791545 ?auto_791546 ?auto_791547 ?auto_791548 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791567 - BLOCK
      ?auto_791568 - BLOCK
      ?auto_791569 - BLOCK
      ?auto_791570 - BLOCK
      ?auto_791571 - BLOCK
      ?auto_791572 - BLOCK
      ?auto_791573 - BLOCK
      ?auto_791574 - BLOCK
      ?auto_791575 - BLOCK
      ?auto_791576 - BLOCK
      ?auto_791577 - BLOCK
      ?auto_791578 - BLOCK
      ?auto_791579 - BLOCK
      ?auto_791580 - BLOCK
      ?auto_791581 - BLOCK
      ?auto_791582 - BLOCK
      ?auto_791583 - BLOCK
      ?auto_791584 - BLOCK
    )
    :vars
    (
      ?auto_791585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791584 ?auto_791585 ) ( ON-TABLE ?auto_791567 ) ( ON ?auto_791568 ?auto_791567 ) ( ON ?auto_791569 ?auto_791568 ) ( ON ?auto_791570 ?auto_791569 ) ( ON ?auto_791571 ?auto_791570 ) ( ON ?auto_791572 ?auto_791571 ) ( ON ?auto_791573 ?auto_791572 ) ( ON ?auto_791574 ?auto_791573 ) ( ON ?auto_791575 ?auto_791574 ) ( ON ?auto_791576 ?auto_791575 ) ( ON ?auto_791577 ?auto_791576 ) ( not ( = ?auto_791567 ?auto_791568 ) ) ( not ( = ?auto_791567 ?auto_791569 ) ) ( not ( = ?auto_791567 ?auto_791570 ) ) ( not ( = ?auto_791567 ?auto_791571 ) ) ( not ( = ?auto_791567 ?auto_791572 ) ) ( not ( = ?auto_791567 ?auto_791573 ) ) ( not ( = ?auto_791567 ?auto_791574 ) ) ( not ( = ?auto_791567 ?auto_791575 ) ) ( not ( = ?auto_791567 ?auto_791576 ) ) ( not ( = ?auto_791567 ?auto_791577 ) ) ( not ( = ?auto_791567 ?auto_791578 ) ) ( not ( = ?auto_791567 ?auto_791579 ) ) ( not ( = ?auto_791567 ?auto_791580 ) ) ( not ( = ?auto_791567 ?auto_791581 ) ) ( not ( = ?auto_791567 ?auto_791582 ) ) ( not ( = ?auto_791567 ?auto_791583 ) ) ( not ( = ?auto_791567 ?auto_791584 ) ) ( not ( = ?auto_791567 ?auto_791585 ) ) ( not ( = ?auto_791568 ?auto_791569 ) ) ( not ( = ?auto_791568 ?auto_791570 ) ) ( not ( = ?auto_791568 ?auto_791571 ) ) ( not ( = ?auto_791568 ?auto_791572 ) ) ( not ( = ?auto_791568 ?auto_791573 ) ) ( not ( = ?auto_791568 ?auto_791574 ) ) ( not ( = ?auto_791568 ?auto_791575 ) ) ( not ( = ?auto_791568 ?auto_791576 ) ) ( not ( = ?auto_791568 ?auto_791577 ) ) ( not ( = ?auto_791568 ?auto_791578 ) ) ( not ( = ?auto_791568 ?auto_791579 ) ) ( not ( = ?auto_791568 ?auto_791580 ) ) ( not ( = ?auto_791568 ?auto_791581 ) ) ( not ( = ?auto_791568 ?auto_791582 ) ) ( not ( = ?auto_791568 ?auto_791583 ) ) ( not ( = ?auto_791568 ?auto_791584 ) ) ( not ( = ?auto_791568 ?auto_791585 ) ) ( not ( = ?auto_791569 ?auto_791570 ) ) ( not ( = ?auto_791569 ?auto_791571 ) ) ( not ( = ?auto_791569 ?auto_791572 ) ) ( not ( = ?auto_791569 ?auto_791573 ) ) ( not ( = ?auto_791569 ?auto_791574 ) ) ( not ( = ?auto_791569 ?auto_791575 ) ) ( not ( = ?auto_791569 ?auto_791576 ) ) ( not ( = ?auto_791569 ?auto_791577 ) ) ( not ( = ?auto_791569 ?auto_791578 ) ) ( not ( = ?auto_791569 ?auto_791579 ) ) ( not ( = ?auto_791569 ?auto_791580 ) ) ( not ( = ?auto_791569 ?auto_791581 ) ) ( not ( = ?auto_791569 ?auto_791582 ) ) ( not ( = ?auto_791569 ?auto_791583 ) ) ( not ( = ?auto_791569 ?auto_791584 ) ) ( not ( = ?auto_791569 ?auto_791585 ) ) ( not ( = ?auto_791570 ?auto_791571 ) ) ( not ( = ?auto_791570 ?auto_791572 ) ) ( not ( = ?auto_791570 ?auto_791573 ) ) ( not ( = ?auto_791570 ?auto_791574 ) ) ( not ( = ?auto_791570 ?auto_791575 ) ) ( not ( = ?auto_791570 ?auto_791576 ) ) ( not ( = ?auto_791570 ?auto_791577 ) ) ( not ( = ?auto_791570 ?auto_791578 ) ) ( not ( = ?auto_791570 ?auto_791579 ) ) ( not ( = ?auto_791570 ?auto_791580 ) ) ( not ( = ?auto_791570 ?auto_791581 ) ) ( not ( = ?auto_791570 ?auto_791582 ) ) ( not ( = ?auto_791570 ?auto_791583 ) ) ( not ( = ?auto_791570 ?auto_791584 ) ) ( not ( = ?auto_791570 ?auto_791585 ) ) ( not ( = ?auto_791571 ?auto_791572 ) ) ( not ( = ?auto_791571 ?auto_791573 ) ) ( not ( = ?auto_791571 ?auto_791574 ) ) ( not ( = ?auto_791571 ?auto_791575 ) ) ( not ( = ?auto_791571 ?auto_791576 ) ) ( not ( = ?auto_791571 ?auto_791577 ) ) ( not ( = ?auto_791571 ?auto_791578 ) ) ( not ( = ?auto_791571 ?auto_791579 ) ) ( not ( = ?auto_791571 ?auto_791580 ) ) ( not ( = ?auto_791571 ?auto_791581 ) ) ( not ( = ?auto_791571 ?auto_791582 ) ) ( not ( = ?auto_791571 ?auto_791583 ) ) ( not ( = ?auto_791571 ?auto_791584 ) ) ( not ( = ?auto_791571 ?auto_791585 ) ) ( not ( = ?auto_791572 ?auto_791573 ) ) ( not ( = ?auto_791572 ?auto_791574 ) ) ( not ( = ?auto_791572 ?auto_791575 ) ) ( not ( = ?auto_791572 ?auto_791576 ) ) ( not ( = ?auto_791572 ?auto_791577 ) ) ( not ( = ?auto_791572 ?auto_791578 ) ) ( not ( = ?auto_791572 ?auto_791579 ) ) ( not ( = ?auto_791572 ?auto_791580 ) ) ( not ( = ?auto_791572 ?auto_791581 ) ) ( not ( = ?auto_791572 ?auto_791582 ) ) ( not ( = ?auto_791572 ?auto_791583 ) ) ( not ( = ?auto_791572 ?auto_791584 ) ) ( not ( = ?auto_791572 ?auto_791585 ) ) ( not ( = ?auto_791573 ?auto_791574 ) ) ( not ( = ?auto_791573 ?auto_791575 ) ) ( not ( = ?auto_791573 ?auto_791576 ) ) ( not ( = ?auto_791573 ?auto_791577 ) ) ( not ( = ?auto_791573 ?auto_791578 ) ) ( not ( = ?auto_791573 ?auto_791579 ) ) ( not ( = ?auto_791573 ?auto_791580 ) ) ( not ( = ?auto_791573 ?auto_791581 ) ) ( not ( = ?auto_791573 ?auto_791582 ) ) ( not ( = ?auto_791573 ?auto_791583 ) ) ( not ( = ?auto_791573 ?auto_791584 ) ) ( not ( = ?auto_791573 ?auto_791585 ) ) ( not ( = ?auto_791574 ?auto_791575 ) ) ( not ( = ?auto_791574 ?auto_791576 ) ) ( not ( = ?auto_791574 ?auto_791577 ) ) ( not ( = ?auto_791574 ?auto_791578 ) ) ( not ( = ?auto_791574 ?auto_791579 ) ) ( not ( = ?auto_791574 ?auto_791580 ) ) ( not ( = ?auto_791574 ?auto_791581 ) ) ( not ( = ?auto_791574 ?auto_791582 ) ) ( not ( = ?auto_791574 ?auto_791583 ) ) ( not ( = ?auto_791574 ?auto_791584 ) ) ( not ( = ?auto_791574 ?auto_791585 ) ) ( not ( = ?auto_791575 ?auto_791576 ) ) ( not ( = ?auto_791575 ?auto_791577 ) ) ( not ( = ?auto_791575 ?auto_791578 ) ) ( not ( = ?auto_791575 ?auto_791579 ) ) ( not ( = ?auto_791575 ?auto_791580 ) ) ( not ( = ?auto_791575 ?auto_791581 ) ) ( not ( = ?auto_791575 ?auto_791582 ) ) ( not ( = ?auto_791575 ?auto_791583 ) ) ( not ( = ?auto_791575 ?auto_791584 ) ) ( not ( = ?auto_791575 ?auto_791585 ) ) ( not ( = ?auto_791576 ?auto_791577 ) ) ( not ( = ?auto_791576 ?auto_791578 ) ) ( not ( = ?auto_791576 ?auto_791579 ) ) ( not ( = ?auto_791576 ?auto_791580 ) ) ( not ( = ?auto_791576 ?auto_791581 ) ) ( not ( = ?auto_791576 ?auto_791582 ) ) ( not ( = ?auto_791576 ?auto_791583 ) ) ( not ( = ?auto_791576 ?auto_791584 ) ) ( not ( = ?auto_791576 ?auto_791585 ) ) ( not ( = ?auto_791577 ?auto_791578 ) ) ( not ( = ?auto_791577 ?auto_791579 ) ) ( not ( = ?auto_791577 ?auto_791580 ) ) ( not ( = ?auto_791577 ?auto_791581 ) ) ( not ( = ?auto_791577 ?auto_791582 ) ) ( not ( = ?auto_791577 ?auto_791583 ) ) ( not ( = ?auto_791577 ?auto_791584 ) ) ( not ( = ?auto_791577 ?auto_791585 ) ) ( not ( = ?auto_791578 ?auto_791579 ) ) ( not ( = ?auto_791578 ?auto_791580 ) ) ( not ( = ?auto_791578 ?auto_791581 ) ) ( not ( = ?auto_791578 ?auto_791582 ) ) ( not ( = ?auto_791578 ?auto_791583 ) ) ( not ( = ?auto_791578 ?auto_791584 ) ) ( not ( = ?auto_791578 ?auto_791585 ) ) ( not ( = ?auto_791579 ?auto_791580 ) ) ( not ( = ?auto_791579 ?auto_791581 ) ) ( not ( = ?auto_791579 ?auto_791582 ) ) ( not ( = ?auto_791579 ?auto_791583 ) ) ( not ( = ?auto_791579 ?auto_791584 ) ) ( not ( = ?auto_791579 ?auto_791585 ) ) ( not ( = ?auto_791580 ?auto_791581 ) ) ( not ( = ?auto_791580 ?auto_791582 ) ) ( not ( = ?auto_791580 ?auto_791583 ) ) ( not ( = ?auto_791580 ?auto_791584 ) ) ( not ( = ?auto_791580 ?auto_791585 ) ) ( not ( = ?auto_791581 ?auto_791582 ) ) ( not ( = ?auto_791581 ?auto_791583 ) ) ( not ( = ?auto_791581 ?auto_791584 ) ) ( not ( = ?auto_791581 ?auto_791585 ) ) ( not ( = ?auto_791582 ?auto_791583 ) ) ( not ( = ?auto_791582 ?auto_791584 ) ) ( not ( = ?auto_791582 ?auto_791585 ) ) ( not ( = ?auto_791583 ?auto_791584 ) ) ( not ( = ?auto_791583 ?auto_791585 ) ) ( not ( = ?auto_791584 ?auto_791585 ) ) ( ON ?auto_791583 ?auto_791584 ) ( ON ?auto_791582 ?auto_791583 ) ( ON ?auto_791581 ?auto_791582 ) ( ON ?auto_791580 ?auto_791581 ) ( ON ?auto_791579 ?auto_791580 ) ( CLEAR ?auto_791577 ) ( ON ?auto_791578 ?auto_791579 ) ( CLEAR ?auto_791578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_791567 ?auto_791568 ?auto_791569 ?auto_791570 ?auto_791571 ?auto_791572 ?auto_791573 ?auto_791574 ?auto_791575 ?auto_791576 ?auto_791577 ?auto_791578 )
      ( MAKE-18PILE ?auto_791567 ?auto_791568 ?auto_791569 ?auto_791570 ?auto_791571 ?auto_791572 ?auto_791573 ?auto_791574 ?auto_791575 ?auto_791576 ?auto_791577 ?auto_791578 ?auto_791579 ?auto_791580 ?auto_791581 ?auto_791582 ?auto_791583 ?auto_791584 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791604 - BLOCK
      ?auto_791605 - BLOCK
      ?auto_791606 - BLOCK
      ?auto_791607 - BLOCK
      ?auto_791608 - BLOCK
      ?auto_791609 - BLOCK
      ?auto_791610 - BLOCK
      ?auto_791611 - BLOCK
      ?auto_791612 - BLOCK
      ?auto_791613 - BLOCK
      ?auto_791614 - BLOCK
      ?auto_791615 - BLOCK
      ?auto_791616 - BLOCK
      ?auto_791617 - BLOCK
      ?auto_791618 - BLOCK
      ?auto_791619 - BLOCK
      ?auto_791620 - BLOCK
      ?auto_791621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791621 ) ( ON-TABLE ?auto_791604 ) ( ON ?auto_791605 ?auto_791604 ) ( ON ?auto_791606 ?auto_791605 ) ( ON ?auto_791607 ?auto_791606 ) ( ON ?auto_791608 ?auto_791607 ) ( ON ?auto_791609 ?auto_791608 ) ( ON ?auto_791610 ?auto_791609 ) ( ON ?auto_791611 ?auto_791610 ) ( ON ?auto_791612 ?auto_791611 ) ( ON ?auto_791613 ?auto_791612 ) ( ON ?auto_791614 ?auto_791613 ) ( not ( = ?auto_791604 ?auto_791605 ) ) ( not ( = ?auto_791604 ?auto_791606 ) ) ( not ( = ?auto_791604 ?auto_791607 ) ) ( not ( = ?auto_791604 ?auto_791608 ) ) ( not ( = ?auto_791604 ?auto_791609 ) ) ( not ( = ?auto_791604 ?auto_791610 ) ) ( not ( = ?auto_791604 ?auto_791611 ) ) ( not ( = ?auto_791604 ?auto_791612 ) ) ( not ( = ?auto_791604 ?auto_791613 ) ) ( not ( = ?auto_791604 ?auto_791614 ) ) ( not ( = ?auto_791604 ?auto_791615 ) ) ( not ( = ?auto_791604 ?auto_791616 ) ) ( not ( = ?auto_791604 ?auto_791617 ) ) ( not ( = ?auto_791604 ?auto_791618 ) ) ( not ( = ?auto_791604 ?auto_791619 ) ) ( not ( = ?auto_791604 ?auto_791620 ) ) ( not ( = ?auto_791604 ?auto_791621 ) ) ( not ( = ?auto_791605 ?auto_791606 ) ) ( not ( = ?auto_791605 ?auto_791607 ) ) ( not ( = ?auto_791605 ?auto_791608 ) ) ( not ( = ?auto_791605 ?auto_791609 ) ) ( not ( = ?auto_791605 ?auto_791610 ) ) ( not ( = ?auto_791605 ?auto_791611 ) ) ( not ( = ?auto_791605 ?auto_791612 ) ) ( not ( = ?auto_791605 ?auto_791613 ) ) ( not ( = ?auto_791605 ?auto_791614 ) ) ( not ( = ?auto_791605 ?auto_791615 ) ) ( not ( = ?auto_791605 ?auto_791616 ) ) ( not ( = ?auto_791605 ?auto_791617 ) ) ( not ( = ?auto_791605 ?auto_791618 ) ) ( not ( = ?auto_791605 ?auto_791619 ) ) ( not ( = ?auto_791605 ?auto_791620 ) ) ( not ( = ?auto_791605 ?auto_791621 ) ) ( not ( = ?auto_791606 ?auto_791607 ) ) ( not ( = ?auto_791606 ?auto_791608 ) ) ( not ( = ?auto_791606 ?auto_791609 ) ) ( not ( = ?auto_791606 ?auto_791610 ) ) ( not ( = ?auto_791606 ?auto_791611 ) ) ( not ( = ?auto_791606 ?auto_791612 ) ) ( not ( = ?auto_791606 ?auto_791613 ) ) ( not ( = ?auto_791606 ?auto_791614 ) ) ( not ( = ?auto_791606 ?auto_791615 ) ) ( not ( = ?auto_791606 ?auto_791616 ) ) ( not ( = ?auto_791606 ?auto_791617 ) ) ( not ( = ?auto_791606 ?auto_791618 ) ) ( not ( = ?auto_791606 ?auto_791619 ) ) ( not ( = ?auto_791606 ?auto_791620 ) ) ( not ( = ?auto_791606 ?auto_791621 ) ) ( not ( = ?auto_791607 ?auto_791608 ) ) ( not ( = ?auto_791607 ?auto_791609 ) ) ( not ( = ?auto_791607 ?auto_791610 ) ) ( not ( = ?auto_791607 ?auto_791611 ) ) ( not ( = ?auto_791607 ?auto_791612 ) ) ( not ( = ?auto_791607 ?auto_791613 ) ) ( not ( = ?auto_791607 ?auto_791614 ) ) ( not ( = ?auto_791607 ?auto_791615 ) ) ( not ( = ?auto_791607 ?auto_791616 ) ) ( not ( = ?auto_791607 ?auto_791617 ) ) ( not ( = ?auto_791607 ?auto_791618 ) ) ( not ( = ?auto_791607 ?auto_791619 ) ) ( not ( = ?auto_791607 ?auto_791620 ) ) ( not ( = ?auto_791607 ?auto_791621 ) ) ( not ( = ?auto_791608 ?auto_791609 ) ) ( not ( = ?auto_791608 ?auto_791610 ) ) ( not ( = ?auto_791608 ?auto_791611 ) ) ( not ( = ?auto_791608 ?auto_791612 ) ) ( not ( = ?auto_791608 ?auto_791613 ) ) ( not ( = ?auto_791608 ?auto_791614 ) ) ( not ( = ?auto_791608 ?auto_791615 ) ) ( not ( = ?auto_791608 ?auto_791616 ) ) ( not ( = ?auto_791608 ?auto_791617 ) ) ( not ( = ?auto_791608 ?auto_791618 ) ) ( not ( = ?auto_791608 ?auto_791619 ) ) ( not ( = ?auto_791608 ?auto_791620 ) ) ( not ( = ?auto_791608 ?auto_791621 ) ) ( not ( = ?auto_791609 ?auto_791610 ) ) ( not ( = ?auto_791609 ?auto_791611 ) ) ( not ( = ?auto_791609 ?auto_791612 ) ) ( not ( = ?auto_791609 ?auto_791613 ) ) ( not ( = ?auto_791609 ?auto_791614 ) ) ( not ( = ?auto_791609 ?auto_791615 ) ) ( not ( = ?auto_791609 ?auto_791616 ) ) ( not ( = ?auto_791609 ?auto_791617 ) ) ( not ( = ?auto_791609 ?auto_791618 ) ) ( not ( = ?auto_791609 ?auto_791619 ) ) ( not ( = ?auto_791609 ?auto_791620 ) ) ( not ( = ?auto_791609 ?auto_791621 ) ) ( not ( = ?auto_791610 ?auto_791611 ) ) ( not ( = ?auto_791610 ?auto_791612 ) ) ( not ( = ?auto_791610 ?auto_791613 ) ) ( not ( = ?auto_791610 ?auto_791614 ) ) ( not ( = ?auto_791610 ?auto_791615 ) ) ( not ( = ?auto_791610 ?auto_791616 ) ) ( not ( = ?auto_791610 ?auto_791617 ) ) ( not ( = ?auto_791610 ?auto_791618 ) ) ( not ( = ?auto_791610 ?auto_791619 ) ) ( not ( = ?auto_791610 ?auto_791620 ) ) ( not ( = ?auto_791610 ?auto_791621 ) ) ( not ( = ?auto_791611 ?auto_791612 ) ) ( not ( = ?auto_791611 ?auto_791613 ) ) ( not ( = ?auto_791611 ?auto_791614 ) ) ( not ( = ?auto_791611 ?auto_791615 ) ) ( not ( = ?auto_791611 ?auto_791616 ) ) ( not ( = ?auto_791611 ?auto_791617 ) ) ( not ( = ?auto_791611 ?auto_791618 ) ) ( not ( = ?auto_791611 ?auto_791619 ) ) ( not ( = ?auto_791611 ?auto_791620 ) ) ( not ( = ?auto_791611 ?auto_791621 ) ) ( not ( = ?auto_791612 ?auto_791613 ) ) ( not ( = ?auto_791612 ?auto_791614 ) ) ( not ( = ?auto_791612 ?auto_791615 ) ) ( not ( = ?auto_791612 ?auto_791616 ) ) ( not ( = ?auto_791612 ?auto_791617 ) ) ( not ( = ?auto_791612 ?auto_791618 ) ) ( not ( = ?auto_791612 ?auto_791619 ) ) ( not ( = ?auto_791612 ?auto_791620 ) ) ( not ( = ?auto_791612 ?auto_791621 ) ) ( not ( = ?auto_791613 ?auto_791614 ) ) ( not ( = ?auto_791613 ?auto_791615 ) ) ( not ( = ?auto_791613 ?auto_791616 ) ) ( not ( = ?auto_791613 ?auto_791617 ) ) ( not ( = ?auto_791613 ?auto_791618 ) ) ( not ( = ?auto_791613 ?auto_791619 ) ) ( not ( = ?auto_791613 ?auto_791620 ) ) ( not ( = ?auto_791613 ?auto_791621 ) ) ( not ( = ?auto_791614 ?auto_791615 ) ) ( not ( = ?auto_791614 ?auto_791616 ) ) ( not ( = ?auto_791614 ?auto_791617 ) ) ( not ( = ?auto_791614 ?auto_791618 ) ) ( not ( = ?auto_791614 ?auto_791619 ) ) ( not ( = ?auto_791614 ?auto_791620 ) ) ( not ( = ?auto_791614 ?auto_791621 ) ) ( not ( = ?auto_791615 ?auto_791616 ) ) ( not ( = ?auto_791615 ?auto_791617 ) ) ( not ( = ?auto_791615 ?auto_791618 ) ) ( not ( = ?auto_791615 ?auto_791619 ) ) ( not ( = ?auto_791615 ?auto_791620 ) ) ( not ( = ?auto_791615 ?auto_791621 ) ) ( not ( = ?auto_791616 ?auto_791617 ) ) ( not ( = ?auto_791616 ?auto_791618 ) ) ( not ( = ?auto_791616 ?auto_791619 ) ) ( not ( = ?auto_791616 ?auto_791620 ) ) ( not ( = ?auto_791616 ?auto_791621 ) ) ( not ( = ?auto_791617 ?auto_791618 ) ) ( not ( = ?auto_791617 ?auto_791619 ) ) ( not ( = ?auto_791617 ?auto_791620 ) ) ( not ( = ?auto_791617 ?auto_791621 ) ) ( not ( = ?auto_791618 ?auto_791619 ) ) ( not ( = ?auto_791618 ?auto_791620 ) ) ( not ( = ?auto_791618 ?auto_791621 ) ) ( not ( = ?auto_791619 ?auto_791620 ) ) ( not ( = ?auto_791619 ?auto_791621 ) ) ( not ( = ?auto_791620 ?auto_791621 ) ) ( ON ?auto_791620 ?auto_791621 ) ( ON ?auto_791619 ?auto_791620 ) ( ON ?auto_791618 ?auto_791619 ) ( ON ?auto_791617 ?auto_791618 ) ( ON ?auto_791616 ?auto_791617 ) ( CLEAR ?auto_791614 ) ( ON ?auto_791615 ?auto_791616 ) ( CLEAR ?auto_791615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_791604 ?auto_791605 ?auto_791606 ?auto_791607 ?auto_791608 ?auto_791609 ?auto_791610 ?auto_791611 ?auto_791612 ?auto_791613 ?auto_791614 ?auto_791615 )
      ( MAKE-18PILE ?auto_791604 ?auto_791605 ?auto_791606 ?auto_791607 ?auto_791608 ?auto_791609 ?auto_791610 ?auto_791611 ?auto_791612 ?auto_791613 ?auto_791614 ?auto_791615 ?auto_791616 ?auto_791617 ?auto_791618 ?auto_791619 ?auto_791620 ?auto_791621 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791640 - BLOCK
      ?auto_791641 - BLOCK
      ?auto_791642 - BLOCK
      ?auto_791643 - BLOCK
      ?auto_791644 - BLOCK
      ?auto_791645 - BLOCK
      ?auto_791646 - BLOCK
      ?auto_791647 - BLOCK
      ?auto_791648 - BLOCK
      ?auto_791649 - BLOCK
      ?auto_791650 - BLOCK
      ?auto_791651 - BLOCK
      ?auto_791652 - BLOCK
      ?auto_791653 - BLOCK
      ?auto_791654 - BLOCK
      ?auto_791655 - BLOCK
      ?auto_791656 - BLOCK
      ?auto_791657 - BLOCK
    )
    :vars
    (
      ?auto_791658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791657 ?auto_791658 ) ( ON-TABLE ?auto_791640 ) ( ON ?auto_791641 ?auto_791640 ) ( ON ?auto_791642 ?auto_791641 ) ( ON ?auto_791643 ?auto_791642 ) ( ON ?auto_791644 ?auto_791643 ) ( ON ?auto_791645 ?auto_791644 ) ( ON ?auto_791646 ?auto_791645 ) ( ON ?auto_791647 ?auto_791646 ) ( ON ?auto_791648 ?auto_791647 ) ( ON ?auto_791649 ?auto_791648 ) ( not ( = ?auto_791640 ?auto_791641 ) ) ( not ( = ?auto_791640 ?auto_791642 ) ) ( not ( = ?auto_791640 ?auto_791643 ) ) ( not ( = ?auto_791640 ?auto_791644 ) ) ( not ( = ?auto_791640 ?auto_791645 ) ) ( not ( = ?auto_791640 ?auto_791646 ) ) ( not ( = ?auto_791640 ?auto_791647 ) ) ( not ( = ?auto_791640 ?auto_791648 ) ) ( not ( = ?auto_791640 ?auto_791649 ) ) ( not ( = ?auto_791640 ?auto_791650 ) ) ( not ( = ?auto_791640 ?auto_791651 ) ) ( not ( = ?auto_791640 ?auto_791652 ) ) ( not ( = ?auto_791640 ?auto_791653 ) ) ( not ( = ?auto_791640 ?auto_791654 ) ) ( not ( = ?auto_791640 ?auto_791655 ) ) ( not ( = ?auto_791640 ?auto_791656 ) ) ( not ( = ?auto_791640 ?auto_791657 ) ) ( not ( = ?auto_791640 ?auto_791658 ) ) ( not ( = ?auto_791641 ?auto_791642 ) ) ( not ( = ?auto_791641 ?auto_791643 ) ) ( not ( = ?auto_791641 ?auto_791644 ) ) ( not ( = ?auto_791641 ?auto_791645 ) ) ( not ( = ?auto_791641 ?auto_791646 ) ) ( not ( = ?auto_791641 ?auto_791647 ) ) ( not ( = ?auto_791641 ?auto_791648 ) ) ( not ( = ?auto_791641 ?auto_791649 ) ) ( not ( = ?auto_791641 ?auto_791650 ) ) ( not ( = ?auto_791641 ?auto_791651 ) ) ( not ( = ?auto_791641 ?auto_791652 ) ) ( not ( = ?auto_791641 ?auto_791653 ) ) ( not ( = ?auto_791641 ?auto_791654 ) ) ( not ( = ?auto_791641 ?auto_791655 ) ) ( not ( = ?auto_791641 ?auto_791656 ) ) ( not ( = ?auto_791641 ?auto_791657 ) ) ( not ( = ?auto_791641 ?auto_791658 ) ) ( not ( = ?auto_791642 ?auto_791643 ) ) ( not ( = ?auto_791642 ?auto_791644 ) ) ( not ( = ?auto_791642 ?auto_791645 ) ) ( not ( = ?auto_791642 ?auto_791646 ) ) ( not ( = ?auto_791642 ?auto_791647 ) ) ( not ( = ?auto_791642 ?auto_791648 ) ) ( not ( = ?auto_791642 ?auto_791649 ) ) ( not ( = ?auto_791642 ?auto_791650 ) ) ( not ( = ?auto_791642 ?auto_791651 ) ) ( not ( = ?auto_791642 ?auto_791652 ) ) ( not ( = ?auto_791642 ?auto_791653 ) ) ( not ( = ?auto_791642 ?auto_791654 ) ) ( not ( = ?auto_791642 ?auto_791655 ) ) ( not ( = ?auto_791642 ?auto_791656 ) ) ( not ( = ?auto_791642 ?auto_791657 ) ) ( not ( = ?auto_791642 ?auto_791658 ) ) ( not ( = ?auto_791643 ?auto_791644 ) ) ( not ( = ?auto_791643 ?auto_791645 ) ) ( not ( = ?auto_791643 ?auto_791646 ) ) ( not ( = ?auto_791643 ?auto_791647 ) ) ( not ( = ?auto_791643 ?auto_791648 ) ) ( not ( = ?auto_791643 ?auto_791649 ) ) ( not ( = ?auto_791643 ?auto_791650 ) ) ( not ( = ?auto_791643 ?auto_791651 ) ) ( not ( = ?auto_791643 ?auto_791652 ) ) ( not ( = ?auto_791643 ?auto_791653 ) ) ( not ( = ?auto_791643 ?auto_791654 ) ) ( not ( = ?auto_791643 ?auto_791655 ) ) ( not ( = ?auto_791643 ?auto_791656 ) ) ( not ( = ?auto_791643 ?auto_791657 ) ) ( not ( = ?auto_791643 ?auto_791658 ) ) ( not ( = ?auto_791644 ?auto_791645 ) ) ( not ( = ?auto_791644 ?auto_791646 ) ) ( not ( = ?auto_791644 ?auto_791647 ) ) ( not ( = ?auto_791644 ?auto_791648 ) ) ( not ( = ?auto_791644 ?auto_791649 ) ) ( not ( = ?auto_791644 ?auto_791650 ) ) ( not ( = ?auto_791644 ?auto_791651 ) ) ( not ( = ?auto_791644 ?auto_791652 ) ) ( not ( = ?auto_791644 ?auto_791653 ) ) ( not ( = ?auto_791644 ?auto_791654 ) ) ( not ( = ?auto_791644 ?auto_791655 ) ) ( not ( = ?auto_791644 ?auto_791656 ) ) ( not ( = ?auto_791644 ?auto_791657 ) ) ( not ( = ?auto_791644 ?auto_791658 ) ) ( not ( = ?auto_791645 ?auto_791646 ) ) ( not ( = ?auto_791645 ?auto_791647 ) ) ( not ( = ?auto_791645 ?auto_791648 ) ) ( not ( = ?auto_791645 ?auto_791649 ) ) ( not ( = ?auto_791645 ?auto_791650 ) ) ( not ( = ?auto_791645 ?auto_791651 ) ) ( not ( = ?auto_791645 ?auto_791652 ) ) ( not ( = ?auto_791645 ?auto_791653 ) ) ( not ( = ?auto_791645 ?auto_791654 ) ) ( not ( = ?auto_791645 ?auto_791655 ) ) ( not ( = ?auto_791645 ?auto_791656 ) ) ( not ( = ?auto_791645 ?auto_791657 ) ) ( not ( = ?auto_791645 ?auto_791658 ) ) ( not ( = ?auto_791646 ?auto_791647 ) ) ( not ( = ?auto_791646 ?auto_791648 ) ) ( not ( = ?auto_791646 ?auto_791649 ) ) ( not ( = ?auto_791646 ?auto_791650 ) ) ( not ( = ?auto_791646 ?auto_791651 ) ) ( not ( = ?auto_791646 ?auto_791652 ) ) ( not ( = ?auto_791646 ?auto_791653 ) ) ( not ( = ?auto_791646 ?auto_791654 ) ) ( not ( = ?auto_791646 ?auto_791655 ) ) ( not ( = ?auto_791646 ?auto_791656 ) ) ( not ( = ?auto_791646 ?auto_791657 ) ) ( not ( = ?auto_791646 ?auto_791658 ) ) ( not ( = ?auto_791647 ?auto_791648 ) ) ( not ( = ?auto_791647 ?auto_791649 ) ) ( not ( = ?auto_791647 ?auto_791650 ) ) ( not ( = ?auto_791647 ?auto_791651 ) ) ( not ( = ?auto_791647 ?auto_791652 ) ) ( not ( = ?auto_791647 ?auto_791653 ) ) ( not ( = ?auto_791647 ?auto_791654 ) ) ( not ( = ?auto_791647 ?auto_791655 ) ) ( not ( = ?auto_791647 ?auto_791656 ) ) ( not ( = ?auto_791647 ?auto_791657 ) ) ( not ( = ?auto_791647 ?auto_791658 ) ) ( not ( = ?auto_791648 ?auto_791649 ) ) ( not ( = ?auto_791648 ?auto_791650 ) ) ( not ( = ?auto_791648 ?auto_791651 ) ) ( not ( = ?auto_791648 ?auto_791652 ) ) ( not ( = ?auto_791648 ?auto_791653 ) ) ( not ( = ?auto_791648 ?auto_791654 ) ) ( not ( = ?auto_791648 ?auto_791655 ) ) ( not ( = ?auto_791648 ?auto_791656 ) ) ( not ( = ?auto_791648 ?auto_791657 ) ) ( not ( = ?auto_791648 ?auto_791658 ) ) ( not ( = ?auto_791649 ?auto_791650 ) ) ( not ( = ?auto_791649 ?auto_791651 ) ) ( not ( = ?auto_791649 ?auto_791652 ) ) ( not ( = ?auto_791649 ?auto_791653 ) ) ( not ( = ?auto_791649 ?auto_791654 ) ) ( not ( = ?auto_791649 ?auto_791655 ) ) ( not ( = ?auto_791649 ?auto_791656 ) ) ( not ( = ?auto_791649 ?auto_791657 ) ) ( not ( = ?auto_791649 ?auto_791658 ) ) ( not ( = ?auto_791650 ?auto_791651 ) ) ( not ( = ?auto_791650 ?auto_791652 ) ) ( not ( = ?auto_791650 ?auto_791653 ) ) ( not ( = ?auto_791650 ?auto_791654 ) ) ( not ( = ?auto_791650 ?auto_791655 ) ) ( not ( = ?auto_791650 ?auto_791656 ) ) ( not ( = ?auto_791650 ?auto_791657 ) ) ( not ( = ?auto_791650 ?auto_791658 ) ) ( not ( = ?auto_791651 ?auto_791652 ) ) ( not ( = ?auto_791651 ?auto_791653 ) ) ( not ( = ?auto_791651 ?auto_791654 ) ) ( not ( = ?auto_791651 ?auto_791655 ) ) ( not ( = ?auto_791651 ?auto_791656 ) ) ( not ( = ?auto_791651 ?auto_791657 ) ) ( not ( = ?auto_791651 ?auto_791658 ) ) ( not ( = ?auto_791652 ?auto_791653 ) ) ( not ( = ?auto_791652 ?auto_791654 ) ) ( not ( = ?auto_791652 ?auto_791655 ) ) ( not ( = ?auto_791652 ?auto_791656 ) ) ( not ( = ?auto_791652 ?auto_791657 ) ) ( not ( = ?auto_791652 ?auto_791658 ) ) ( not ( = ?auto_791653 ?auto_791654 ) ) ( not ( = ?auto_791653 ?auto_791655 ) ) ( not ( = ?auto_791653 ?auto_791656 ) ) ( not ( = ?auto_791653 ?auto_791657 ) ) ( not ( = ?auto_791653 ?auto_791658 ) ) ( not ( = ?auto_791654 ?auto_791655 ) ) ( not ( = ?auto_791654 ?auto_791656 ) ) ( not ( = ?auto_791654 ?auto_791657 ) ) ( not ( = ?auto_791654 ?auto_791658 ) ) ( not ( = ?auto_791655 ?auto_791656 ) ) ( not ( = ?auto_791655 ?auto_791657 ) ) ( not ( = ?auto_791655 ?auto_791658 ) ) ( not ( = ?auto_791656 ?auto_791657 ) ) ( not ( = ?auto_791656 ?auto_791658 ) ) ( not ( = ?auto_791657 ?auto_791658 ) ) ( ON ?auto_791656 ?auto_791657 ) ( ON ?auto_791655 ?auto_791656 ) ( ON ?auto_791654 ?auto_791655 ) ( ON ?auto_791653 ?auto_791654 ) ( ON ?auto_791652 ?auto_791653 ) ( ON ?auto_791651 ?auto_791652 ) ( CLEAR ?auto_791649 ) ( ON ?auto_791650 ?auto_791651 ) ( CLEAR ?auto_791650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_791640 ?auto_791641 ?auto_791642 ?auto_791643 ?auto_791644 ?auto_791645 ?auto_791646 ?auto_791647 ?auto_791648 ?auto_791649 ?auto_791650 )
      ( MAKE-18PILE ?auto_791640 ?auto_791641 ?auto_791642 ?auto_791643 ?auto_791644 ?auto_791645 ?auto_791646 ?auto_791647 ?auto_791648 ?auto_791649 ?auto_791650 ?auto_791651 ?auto_791652 ?auto_791653 ?auto_791654 ?auto_791655 ?auto_791656 ?auto_791657 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791677 - BLOCK
      ?auto_791678 - BLOCK
      ?auto_791679 - BLOCK
      ?auto_791680 - BLOCK
      ?auto_791681 - BLOCK
      ?auto_791682 - BLOCK
      ?auto_791683 - BLOCK
      ?auto_791684 - BLOCK
      ?auto_791685 - BLOCK
      ?auto_791686 - BLOCK
      ?auto_791687 - BLOCK
      ?auto_791688 - BLOCK
      ?auto_791689 - BLOCK
      ?auto_791690 - BLOCK
      ?auto_791691 - BLOCK
      ?auto_791692 - BLOCK
      ?auto_791693 - BLOCK
      ?auto_791694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791694 ) ( ON-TABLE ?auto_791677 ) ( ON ?auto_791678 ?auto_791677 ) ( ON ?auto_791679 ?auto_791678 ) ( ON ?auto_791680 ?auto_791679 ) ( ON ?auto_791681 ?auto_791680 ) ( ON ?auto_791682 ?auto_791681 ) ( ON ?auto_791683 ?auto_791682 ) ( ON ?auto_791684 ?auto_791683 ) ( ON ?auto_791685 ?auto_791684 ) ( ON ?auto_791686 ?auto_791685 ) ( not ( = ?auto_791677 ?auto_791678 ) ) ( not ( = ?auto_791677 ?auto_791679 ) ) ( not ( = ?auto_791677 ?auto_791680 ) ) ( not ( = ?auto_791677 ?auto_791681 ) ) ( not ( = ?auto_791677 ?auto_791682 ) ) ( not ( = ?auto_791677 ?auto_791683 ) ) ( not ( = ?auto_791677 ?auto_791684 ) ) ( not ( = ?auto_791677 ?auto_791685 ) ) ( not ( = ?auto_791677 ?auto_791686 ) ) ( not ( = ?auto_791677 ?auto_791687 ) ) ( not ( = ?auto_791677 ?auto_791688 ) ) ( not ( = ?auto_791677 ?auto_791689 ) ) ( not ( = ?auto_791677 ?auto_791690 ) ) ( not ( = ?auto_791677 ?auto_791691 ) ) ( not ( = ?auto_791677 ?auto_791692 ) ) ( not ( = ?auto_791677 ?auto_791693 ) ) ( not ( = ?auto_791677 ?auto_791694 ) ) ( not ( = ?auto_791678 ?auto_791679 ) ) ( not ( = ?auto_791678 ?auto_791680 ) ) ( not ( = ?auto_791678 ?auto_791681 ) ) ( not ( = ?auto_791678 ?auto_791682 ) ) ( not ( = ?auto_791678 ?auto_791683 ) ) ( not ( = ?auto_791678 ?auto_791684 ) ) ( not ( = ?auto_791678 ?auto_791685 ) ) ( not ( = ?auto_791678 ?auto_791686 ) ) ( not ( = ?auto_791678 ?auto_791687 ) ) ( not ( = ?auto_791678 ?auto_791688 ) ) ( not ( = ?auto_791678 ?auto_791689 ) ) ( not ( = ?auto_791678 ?auto_791690 ) ) ( not ( = ?auto_791678 ?auto_791691 ) ) ( not ( = ?auto_791678 ?auto_791692 ) ) ( not ( = ?auto_791678 ?auto_791693 ) ) ( not ( = ?auto_791678 ?auto_791694 ) ) ( not ( = ?auto_791679 ?auto_791680 ) ) ( not ( = ?auto_791679 ?auto_791681 ) ) ( not ( = ?auto_791679 ?auto_791682 ) ) ( not ( = ?auto_791679 ?auto_791683 ) ) ( not ( = ?auto_791679 ?auto_791684 ) ) ( not ( = ?auto_791679 ?auto_791685 ) ) ( not ( = ?auto_791679 ?auto_791686 ) ) ( not ( = ?auto_791679 ?auto_791687 ) ) ( not ( = ?auto_791679 ?auto_791688 ) ) ( not ( = ?auto_791679 ?auto_791689 ) ) ( not ( = ?auto_791679 ?auto_791690 ) ) ( not ( = ?auto_791679 ?auto_791691 ) ) ( not ( = ?auto_791679 ?auto_791692 ) ) ( not ( = ?auto_791679 ?auto_791693 ) ) ( not ( = ?auto_791679 ?auto_791694 ) ) ( not ( = ?auto_791680 ?auto_791681 ) ) ( not ( = ?auto_791680 ?auto_791682 ) ) ( not ( = ?auto_791680 ?auto_791683 ) ) ( not ( = ?auto_791680 ?auto_791684 ) ) ( not ( = ?auto_791680 ?auto_791685 ) ) ( not ( = ?auto_791680 ?auto_791686 ) ) ( not ( = ?auto_791680 ?auto_791687 ) ) ( not ( = ?auto_791680 ?auto_791688 ) ) ( not ( = ?auto_791680 ?auto_791689 ) ) ( not ( = ?auto_791680 ?auto_791690 ) ) ( not ( = ?auto_791680 ?auto_791691 ) ) ( not ( = ?auto_791680 ?auto_791692 ) ) ( not ( = ?auto_791680 ?auto_791693 ) ) ( not ( = ?auto_791680 ?auto_791694 ) ) ( not ( = ?auto_791681 ?auto_791682 ) ) ( not ( = ?auto_791681 ?auto_791683 ) ) ( not ( = ?auto_791681 ?auto_791684 ) ) ( not ( = ?auto_791681 ?auto_791685 ) ) ( not ( = ?auto_791681 ?auto_791686 ) ) ( not ( = ?auto_791681 ?auto_791687 ) ) ( not ( = ?auto_791681 ?auto_791688 ) ) ( not ( = ?auto_791681 ?auto_791689 ) ) ( not ( = ?auto_791681 ?auto_791690 ) ) ( not ( = ?auto_791681 ?auto_791691 ) ) ( not ( = ?auto_791681 ?auto_791692 ) ) ( not ( = ?auto_791681 ?auto_791693 ) ) ( not ( = ?auto_791681 ?auto_791694 ) ) ( not ( = ?auto_791682 ?auto_791683 ) ) ( not ( = ?auto_791682 ?auto_791684 ) ) ( not ( = ?auto_791682 ?auto_791685 ) ) ( not ( = ?auto_791682 ?auto_791686 ) ) ( not ( = ?auto_791682 ?auto_791687 ) ) ( not ( = ?auto_791682 ?auto_791688 ) ) ( not ( = ?auto_791682 ?auto_791689 ) ) ( not ( = ?auto_791682 ?auto_791690 ) ) ( not ( = ?auto_791682 ?auto_791691 ) ) ( not ( = ?auto_791682 ?auto_791692 ) ) ( not ( = ?auto_791682 ?auto_791693 ) ) ( not ( = ?auto_791682 ?auto_791694 ) ) ( not ( = ?auto_791683 ?auto_791684 ) ) ( not ( = ?auto_791683 ?auto_791685 ) ) ( not ( = ?auto_791683 ?auto_791686 ) ) ( not ( = ?auto_791683 ?auto_791687 ) ) ( not ( = ?auto_791683 ?auto_791688 ) ) ( not ( = ?auto_791683 ?auto_791689 ) ) ( not ( = ?auto_791683 ?auto_791690 ) ) ( not ( = ?auto_791683 ?auto_791691 ) ) ( not ( = ?auto_791683 ?auto_791692 ) ) ( not ( = ?auto_791683 ?auto_791693 ) ) ( not ( = ?auto_791683 ?auto_791694 ) ) ( not ( = ?auto_791684 ?auto_791685 ) ) ( not ( = ?auto_791684 ?auto_791686 ) ) ( not ( = ?auto_791684 ?auto_791687 ) ) ( not ( = ?auto_791684 ?auto_791688 ) ) ( not ( = ?auto_791684 ?auto_791689 ) ) ( not ( = ?auto_791684 ?auto_791690 ) ) ( not ( = ?auto_791684 ?auto_791691 ) ) ( not ( = ?auto_791684 ?auto_791692 ) ) ( not ( = ?auto_791684 ?auto_791693 ) ) ( not ( = ?auto_791684 ?auto_791694 ) ) ( not ( = ?auto_791685 ?auto_791686 ) ) ( not ( = ?auto_791685 ?auto_791687 ) ) ( not ( = ?auto_791685 ?auto_791688 ) ) ( not ( = ?auto_791685 ?auto_791689 ) ) ( not ( = ?auto_791685 ?auto_791690 ) ) ( not ( = ?auto_791685 ?auto_791691 ) ) ( not ( = ?auto_791685 ?auto_791692 ) ) ( not ( = ?auto_791685 ?auto_791693 ) ) ( not ( = ?auto_791685 ?auto_791694 ) ) ( not ( = ?auto_791686 ?auto_791687 ) ) ( not ( = ?auto_791686 ?auto_791688 ) ) ( not ( = ?auto_791686 ?auto_791689 ) ) ( not ( = ?auto_791686 ?auto_791690 ) ) ( not ( = ?auto_791686 ?auto_791691 ) ) ( not ( = ?auto_791686 ?auto_791692 ) ) ( not ( = ?auto_791686 ?auto_791693 ) ) ( not ( = ?auto_791686 ?auto_791694 ) ) ( not ( = ?auto_791687 ?auto_791688 ) ) ( not ( = ?auto_791687 ?auto_791689 ) ) ( not ( = ?auto_791687 ?auto_791690 ) ) ( not ( = ?auto_791687 ?auto_791691 ) ) ( not ( = ?auto_791687 ?auto_791692 ) ) ( not ( = ?auto_791687 ?auto_791693 ) ) ( not ( = ?auto_791687 ?auto_791694 ) ) ( not ( = ?auto_791688 ?auto_791689 ) ) ( not ( = ?auto_791688 ?auto_791690 ) ) ( not ( = ?auto_791688 ?auto_791691 ) ) ( not ( = ?auto_791688 ?auto_791692 ) ) ( not ( = ?auto_791688 ?auto_791693 ) ) ( not ( = ?auto_791688 ?auto_791694 ) ) ( not ( = ?auto_791689 ?auto_791690 ) ) ( not ( = ?auto_791689 ?auto_791691 ) ) ( not ( = ?auto_791689 ?auto_791692 ) ) ( not ( = ?auto_791689 ?auto_791693 ) ) ( not ( = ?auto_791689 ?auto_791694 ) ) ( not ( = ?auto_791690 ?auto_791691 ) ) ( not ( = ?auto_791690 ?auto_791692 ) ) ( not ( = ?auto_791690 ?auto_791693 ) ) ( not ( = ?auto_791690 ?auto_791694 ) ) ( not ( = ?auto_791691 ?auto_791692 ) ) ( not ( = ?auto_791691 ?auto_791693 ) ) ( not ( = ?auto_791691 ?auto_791694 ) ) ( not ( = ?auto_791692 ?auto_791693 ) ) ( not ( = ?auto_791692 ?auto_791694 ) ) ( not ( = ?auto_791693 ?auto_791694 ) ) ( ON ?auto_791693 ?auto_791694 ) ( ON ?auto_791692 ?auto_791693 ) ( ON ?auto_791691 ?auto_791692 ) ( ON ?auto_791690 ?auto_791691 ) ( ON ?auto_791689 ?auto_791690 ) ( ON ?auto_791688 ?auto_791689 ) ( CLEAR ?auto_791686 ) ( ON ?auto_791687 ?auto_791688 ) ( CLEAR ?auto_791687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_791677 ?auto_791678 ?auto_791679 ?auto_791680 ?auto_791681 ?auto_791682 ?auto_791683 ?auto_791684 ?auto_791685 ?auto_791686 ?auto_791687 )
      ( MAKE-18PILE ?auto_791677 ?auto_791678 ?auto_791679 ?auto_791680 ?auto_791681 ?auto_791682 ?auto_791683 ?auto_791684 ?auto_791685 ?auto_791686 ?auto_791687 ?auto_791688 ?auto_791689 ?auto_791690 ?auto_791691 ?auto_791692 ?auto_791693 ?auto_791694 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791713 - BLOCK
      ?auto_791714 - BLOCK
      ?auto_791715 - BLOCK
      ?auto_791716 - BLOCK
      ?auto_791717 - BLOCK
      ?auto_791718 - BLOCK
      ?auto_791719 - BLOCK
      ?auto_791720 - BLOCK
      ?auto_791721 - BLOCK
      ?auto_791722 - BLOCK
      ?auto_791723 - BLOCK
      ?auto_791724 - BLOCK
      ?auto_791725 - BLOCK
      ?auto_791726 - BLOCK
      ?auto_791727 - BLOCK
      ?auto_791728 - BLOCK
      ?auto_791729 - BLOCK
      ?auto_791730 - BLOCK
    )
    :vars
    (
      ?auto_791731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791730 ?auto_791731 ) ( ON-TABLE ?auto_791713 ) ( ON ?auto_791714 ?auto_791713 ) ( ON ?auto_791715 ?auto_791714 ) ( ON ?auto_791716 ?auto_791715 ) ( ON ?auto_791717 ?auto_791716 ) ( ON ?auto_791718 ?auto_791717 ) ( ON ?auto_791719 ?auto_791718 ) ( ON ?auto_791720 ?auto_791719 ) ( ON ?auto_791721 ?auto_791720 ) ( not ( = ?auto_791713 ?auto_791714 ) ) ( not ( = ?auto_791713 ?auto_791715 ) ) ( not ( = ?auto_791713 ?auto_791716 ) ) ( not ( = ?auto_791713 ?auto_791717 ) ) ( not ( = ?auto_791713 ?auto_791718 ) ) ( not ( = ?auto_791713 ?auto_791719 ) ) ( not ( = ?auto_791713 ?auto_791720 ) ) ( not ( = ?auto_791713 ?auto_791721 ) ) ( not ( = ?auto_791713 ?auto_791722 ) ) ( not ( = ?auto_791713 ?auto_791723 ) ) ( not ( = ?auto_791713 ?auto_791724 ) ) ( not ( = ?auto_791713 ?auto_791725 ) ) ( not ( = ?auto_791713 ?auto_791726 ) ) ( not ( = ?auto_791713 ?auto_791727 ) ) ( not ( = ?auto_791713 ?auto_791728 ) ) ( not ( = ?auto_791713 ?auto_791729 ) ) ( not ( = ?auto_791713 ?auto_791730 ) ) ( not ( = ?auto_791713 ?auto_791731 ) ) ( not ( = ?auto_791714 ?auto_791715 ) ) ( not ( = ?auto_791714 ?auto_791716 ) ) ( not ( = ?auto_791714 ?auto_791717 ) ) ( not ( = ?auto_791714 ?auto_791718 ) ) ( not ( = ?auto_791714 ?auto_791719 ) ) ( not ( = ?auto_791714 ?auto_791720 ) ) ( not ( = ?auto_791714 ?auto_791721 ) ) ( not ( = ?auto_791714 ?auto_791722 ) ) ( not ( = ?auto_791714 ?auto_791723 ) ) ( not ( = ?auto_791714 ?auto_791724 ) ) ( not ( = ?auto_791714 ?auto_791725 ) ) ( not ( = ?auto_791714 ?auto_791726 ) ) ( not ( = ?auto_791714 ?auto_791727 ) ) ( not ( = ?auto_791714 ?auto_791728 ) ) ( not ( = ?auto_791714 ?auto_791729 ) ) ( not ( = ?auto_791714 ?auto_791730 ) ) ( not ( = ?auto_791714 ?auto_791731 ) ) ( not ( = ?auto_791715 ?auto_791716 ) ) ( not ( = ?auto_791715 ?auto_791717 ) ) ( not ( = ?auto_791715 ?auto_791718 ) ) ( not ( = ?auto_791715 ?auto_791719 ) ) ( not ( = ?auto_791715 ?auto_791720 ) ) ( not ( = ?auto_791715 ?auto_791721 ) ) ( not ( = ?auto_791715 ?auto_791722 ) ) ( not ( = ?auto_791715 ?auto_791723 ) ) ( not ( = ?auto_791715 ?auto_791724 ) ) ( not ( = ?auto_791715 ?auto_791725 ) ) ( not ( = ?auto_791715 ?auto_791726 ) ) ( not ( = ?auto_791715 ?auto_791727 ) ) ( not ( = ?auto_791715 ?auto_791728 ) ) ( not ( = ?auto_791715 ?auto_791729 ) ) ( not ( = ?auto_791715 ?auto_791730 ) ) ( not ( = ?auto_791715 ?auto_791731 ) ) ( not ( = ?auto_791716 ?auto_791717 ) ) ( not ( = ?auto_791716 ?auto_791718 ) ) ( not ( = ?auto_791716 ?auto_791719 ) ) ( not ( = ?auto_791716 ?auto_791720 ) ) ( not ( = ?auto_791716 ?auto_791721 ) ) ( not ( = ?auto_791716 ?auto_791722 ) ) ( not ( = ?auto_791716 ?auto_791723 ) ) ( not ( = ?auto_791716 ?auto_791724 ) ) ( not ( = ?auto_791716 ?auto_791725 ) ) ( not ( = ?auto_791716 ?auto_791726 ) ) ( not ( = ?auto_791716 ?auto_791727 ) ) ( not ( = ?auto_791716 ?auto_791728 ) ) ( not ( = ?auto_791716 ?auto_791729 ) ) ( not ( = ?auto_791716 ?auto_791730 ) ) ( not ( = ?auto_791716 ?auto_791731 ) ) ( not ( = ?auto_791717 ?auto_791718 ) ) ( not ( = ?auto_791717 ?auto_791719 ) ) ( not ( = ?auto_791717 ?auto_791720 ) ) ( not ( = ?auto_791717 ?auto_791721 ) ) ( not ( = ?auto_791717 ?auto_791722 ) ) ( not ( = ?auto_791717 ?auto_791723 ) ) ( not ( = ?auto_791717 ?auto_791724 ) ) ( not ( = ?auto_791717 ?auto_791725 ) ) ( not ( = ?auto_791717 ?auto_791726 ) ) ( not ( = ?auto_791717 ?auto_791727 ) ) ( not ( = ?auto_791717 ?auto_791728 ) ) ( not ( = ?auto_791717 ?auto_791729 ) ) ( not ( = ?auto_791717 ?auto_791730 ) ) ( not ( = ?auto_791717 ?auto_791731 ) ) ( not ( = ?auto_791718 ?auto_791719 ) ) ( not ( = ?auto_791718 ?auto_791720 ) ) ( not ( = ?auto_791718 ?auto_791721 ) ) ( not ( = ?auto_791718 ?auto_791722 ) ) ( not ( = ?auto_791718 ?auto_791723 ) ) ( not ( = ?auto_791718 ?auto_791724 ) ) ( not ( = ?auto_791718 ?auto_791725 ) ) ( not ( = ?auto_791718 ?auto_791726 ) ) ( not ( = ?auto_791718 ?auto_791727 ) ) ( not ( = ?auto_791718 ?auto_791728 ) ) ( not ( = ?auto_791718 ?auto_791729 ) ) ( not ( = ?auto_791718 ?auto_791730 ) ) ( not ( = ?auto_791718 ?auto_791731 ) ) ( not ( = ?auto_791719 ?auto_791720 ) ) ( not ( = ?auto_791719 ?auto_791721 ) ) ( not ( = ?auto_791719 ?auto_791722 ) ) ( not ( = ?auto_791719 ?auto_791723 ) ) ( not ( = ?auto_791719 ?auto_791724 ) ) ( not ( = ?auto_791719 ?auto_791725 ) ) ( not ( = ?auto_791719 ?auto_791726 ) ) ( not ( = ?auto_791719 ?auto_791727 ) ) ( not ( = ?auto_791719 ?auto_791728 ) ) ( not ( = ?auto_791719 ?auto_791729 ) ) ( not ( = ?auto_791719 ?auto_791730 ) ) ( not ( = ?auto_791719 ?auto_791731 ) ) ( not ( = ?auto_791720 ?auto_791721 ) ) ( not ( = ?auto_791720 ?auto_791722 ) ) ( not ( = ?auto_791720 ?auto_791723 ) ) ( not ( = ?auto_791720 ?auto_791724 ) ) ( not ( = ?auto_791720 ?auto_791725 ) ) ( not ( = ?auto_791720 ?auto_791726 ) ) ( not ( = ?auto_791720 ?auto_791727 ) ) ( not ( = ?auto_791720 ?auto_791728 ) ) ( not ( = ?auto_791720 ?auto_791729 ) ) ( not ( = ?auto_791720 ?auto_791730 ) ) ( not ( = ?auto_791720 ?auto_791731 ) ) ( not ( = ?auto_791721 ?auto_791722 ) ) ( not ( = ?auto_791721 ?auto_791723 ) ) ( not ( = ?auto_791721 ?auto_791724 ) ) ( not ( = ?auto_791721 ?auto_791725 ) ) ( not ( = ?auto_791721 ?auto_791726 ) ) ( not ( = ?auto_791721 ?auto_791727 ) ) ( not ( = ?auto_791721 ?auto_791728 ) ) ( not ( = ?auto_791721 ?auto_791729 ) ) ( not ( = ?auto_791721 ?auto_791730 ) ) ( not ( = ?auto_791721 ?auto_791731 ) ) ( not ( = ?auto_791722 ?auto_791723 ) ) ( not ( = ?auto_791722 ?auto_791724 ) ) ( not ( = ?auto_791722 ?auto_791725 ) ) ( not ( = ?auto_791722 ?auto_791726 ) ) ( not ( = ?auto_791722 ?auto_791727 ) ) ( not ( = ?auto_791722 ?auto_791728 ) ) ( not ( = ?auto_791722 ?auto_791729 ) ) ( not ( = ?auto_791722 ?auto_791730 ) ) ( not ( = ?auto_791722 ?auto_791731 ) ) ( not ( = ?auto_791723 ?auto_791724 ) ) ( not ( = ?auto_791723 ?auto_791725 ) ) ( not ( = ?auto_791723 ?auto_791726 ) ) ( not ( = ?auto_791723 ?auto_791727 ) ) ( not ( = ?auto_791723 ?auto_791728 ) ) ( not ( = ?auto_791723 ?auto_791729 ) ) ( not ( = ?auto_791723 ?auto_791730 ) ) ( not ( = ?auto_791723 ?auto_791731 ) ) ( not ( = ?auto_791724 ?auto_791725 ) ) ( not ( = ?auto_791724 ?auto_791726 ) ) ( not ( = ?auto_791724 ?auto_791727 ) ) ( not ( = ?auto_791724 ?auto_791728 ) ) ( not ( = ?auto_791724 ?auto_791729 ) ) ( not ( = ?auto_791724 ?auto_791730 ) ) ( not ( = ?auto_791724 ?auto_791731 ) ) ( not ( = ?auto_791725 ?auto_791726 ) ) ( not ( = ?auto_791725 ?auto_791727 ) ) ( not ( = ?auto_791725 ?auto_791728 ) ) ( not ( = ?auto_791725 ?auto_791729 ) ) ( not ( = ?auto_791725 ?auto_791730 ) ) ( not ( = ?auto_791725 ?auto_791731 ) ) ( not ( = ?auto_791726 ?auto_791727 ) ) ( not ( = ?auto_791726 ?auto_791728 ) ) ( not ( = ?auto_791726 ?auto_791729 ) ) ( not ( = ?auto_791726 ?auto_791730 ) ) ( not ( = ?auto_791726 ?auto_791731 ) ) ( not ( = ?auto_791727 ?auto_791728 ) ) ( not ( = ?auto_791727 ?auto_791729 ) ) ( not ( = ?auto_791727 ?auto_791730 ) ) ( not ( = ?auto_791727 ?auto_791731 ) ) ( not ( = ?auto_791728 ?auto_791729 ) ) ( not ( = ?auto_791728 ?auto_791730 ) ) ( not ( = ?auto_791728 ?auto_791731 ) ) ( not ( = ?auto_791729 ?auto_791730 ) ) ( not ( = ?auto_791729 ?auto_791731 ) ) ( not ( = ?auto_791730 ?auto_791731 ) ) ( ON ?auto_791729 ?auto_791730 ) ( ON ?auto_791728 ?auto_791729 ) ( ON ?auto_791727 ?auto_791728 ) ( ON ?auto_791726 ?auto_791727 ) ( ON ?auto_791725 ?auto_791726 ) ( ON ?auto_791724 ?auto_791725 ) ( ON ?auto_791723 ?auto_791724 ) ( CLEAR ?auto_791721 ) ( ON ?auto_791722 ?auto_791723 ) ( CLEAR ?auto_791722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_791713 ?auto_791714 ?auto_791715 ?auto_791716 ?auto_791717 ?auto_791718 ?auto_791719 ?auto_791720 ?auto_791721 ?auto_791722 )
      ( MAKE-18PILE ?auto_791713 ?auto_791714 ?auto_791715 ?auto_791716 ?auto_791717 ?auto_791718 ?auto_791719 ?auto_791720 ?auto_791721 ?auto_791722 ?auto_791723 ?auto_791724 ?auto_791725 ?auto_791726 ?auto_791727 ?auto_791728 ?auto_791729 ?auto_791730 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791750 - BLOCK
      ?auto_791751 - BLOCK
      ?auto_791752 - BLOCK
      ?auto_791753 - BLOCK
      ?auto_791754 - BLOCK
      ?auto_791755 - BLOCK
      ?auto_791756 - BLOCK
      ?auto_791757 - BLOCK
      ?auto_791758 - BLOCK
      ?auto_791759 - BLOCK
      ?auto_791760 - BLOCK
      ?auto_791761 - BLOCK
      ?auto_791762 - BLOCK
      ?auto_791763 - BLOCK
      ?auto_791764 - BLOCK
      ?auto_791765 - BLOCK
      ?auto_791766 - BLOCK
      ?auto_791767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791767 ) ( ON-TABLE ?auto_791750 ) ( ON ?auto_791751 ?auto_791750 ) ( ON ?auto_791752 ?auto_791751 ) ( ON ?auto_791753 ?auto_791752 ) ( ON ?auto_791754 ?auto_791753 ) ( ON ?auto_791755 ?auto_791754 ) ( ON ?auto_791756 ?auto_791755 ) ( ON ?auto_791757 ?auto_791756 ) ( ON ?auto_791758 ?auto_791757 ) ( not ( = ?auto_791750 ?auto_791751 ) ) ( not ( = ?auto_791750 ?auto_791752 ) ) ( not ( = ?auto_791750 ?auto_791753 ) ) ( not ( = ?auto_791750 ?auto_791754 ) ) ( not ( = ?auto_791750 ?auto_791755 ) ) ( not ( = ?auto_791750 ?auto_791756 ) ) ( not ( = ?auto_791750 ?auto_791757 ) ) ( not ( = ?auto_791750 ?auto_791758 ) ) ( not ( = ?auto_791750 ?auto_791759 ) ) ( not ( = ?auto_791750 ?auto_791760 ) ) ( not ( = ?auto_791750 ?auto_791761 ) ) ( not ( = ?auto_791750 ?auto_791762 ) ) ( not ( = ?auto_791750 ?auto_791763 ) ) ( not ( = ?auto_791750 ?auto_791764 ) ) ( not ( = ?auto_791750 ?auto_791765 ) ) ( not ( = ?auto_791750 ?auto_791766 ) ) ( not ( = ?auto_791750 ?auto_791767 ) ) ( not ( = ?auto_791751 ?auto_791752 ) ) ( not ( = ?auto_791751 ?auto_791753 ) ) ( not ( = ?auto_791751 ?auto_791754 ) ) ( not ( = ?auto_791751 ?auto_791755 ) ) ( not ( = ?auto_791751 ?auto_791756 ) ) ( not ( = ?auto_791751 ?auto_791757 ) ) ( not ( = ?auto_791751 ?auto_791758 ) ) ( not ( = ?auto_791751 ?auto_791759 ) ) ( not ( = ?auto_791751 ?auto_791760 ) ) ( not ( = ?auto_791751 ?auto_791761 ) ) ( not ( = ?auto_791751 ?auto_791762 ) ) ( not ( = ?auto_791751 ?auto_791763 ) ) ( not ( = ?auto_791751 ?auto_791764 ) ) ( not ( = ?auto_791751 ?auto_791765 ) ) ( not ( = ?auto_791751 ?auto_791766 ) ) ( not ( = ?auto_791751 ?auto_791767 ) ) ( not ( = ?auto_791752 ?auto_791753 ) ) ( not ( = ?auto_791752 ?auto_791754 ) ) ( not ( = ?auto_791752 ?auto_791755 ) ) ( not ( = ?auto_791752 ?auto_791756 ) ) ( not ( = ?auto_791752 ?auto_791757 ) ) ( not ( = ?auto_791752 ?auto_791758 ) ) ( not ( = ?auto_791752 ?auto_791759 ) ) ( not ( = ?auto_791752 ?auto_791760 ) ) ( not ( = ?auto_791752 ?auto_791761 ) ) ( not ( = ?auto_791752 ?auto_791762 ) ) ( not ( = ?auto_791752 ?auto_791763 ) ) ( not ( = ?auto_791752 ?auto_791764 ) ) ( not ( = ?auto_791752 ?auto_791765 ) ) ( not ( = ?auto_791752 ?auto_791766 ) ) ( not ( = ?auto_791752 ?auto_791767 ) ) ( not ( = ?auto_791753 ?auto_791754 ) ) ( not ( = ?auto_791753 ?auto_791755 ) ) ( not ( = ?auto_791753 ?auto_791756 ) ) ( not ( = ?auto_791753 ?auto_791757 ) ) ( not ( = ?auto_791753 ?auto_791758 ) ) ( not ( = ?auto_791753 ?auto_791759 ) ) ( not ( = ?auto_791753 ?auto_791760 ) ) ( not ( = ?auto_791753 ?auto_791761 ) ) ( not ( = ?auto_791753 ?auto_791762 ) ) ( not ( = ?auto_791753 ?auto_791763 ) ) ( not ( = ?auto_791753 ?auto_791764 ) ) ( not ( = ?auto_791753 ?auto_791765 ) ) ( not ( = ?auto_791753 ?auto_791766 ) ) ( not ( = ?auto_791753 ?auto_791767 ) ) ( not ( = ?auto_791754 ?auto_791755 ) ) ( not ( = ?auto_791754 ?auto_791756 ) ) ( not ( = ?auto_791754 ?auto_791757 ) ) ( not ( = ?auto_791754 ?auto_791758 ) ) ( not ( = ?auto_791754 ?auto_791759 ) ) ( not ( = ?auto_791754 ?auto_791760 ) ) ( not ( = ?auto_791754 ?auto_791761 ) ) ( not ( = ?auto_791754 ?auto_791762 ) ) ( not ( = ?auto_791754 ?auto_791763 ) ) ( not ( = ?auto_791754 ?auto_791764 ) ) ( not ( = ?auto_791754 ?auto_791765 ) ) ( not ( = ?auto_791754 ?auto_791766 ) ) ( not ( = ?auto_791754 ?auto_791767 ) ) ( not ( = ?auto_791755 ?auto_791756 ) ) ( not ( = ?auto_791755 ?auto_791757 ) ) ( not ( = ?auto_791755 ?auto_791758 ) ) ( not ( = ?auto_791755 ?auto_791759 ) ) ( not ( = ?auto_791755 ?auto_791760 ) ) ( not ( = ?auto_791755 ?auto_791761 ) ) ( not ( = ?auto_791755 ?auto_791762 ) ) ( not ( = ?auto_791755 ?auto_791763 ) ) ( not ( = ?auto_791755 ?auto_791764 ) ) ( not ( = ?auto_791755 ?auto_791765 ) ) ( not ( = ?auto_791755 ?auto_791766 ) ) ( not ( = ?auto_791755 ?auto_791767 ) ) ( not ( = ?auto_791756 ?auto_791757 ) ) ( not ( = ?auto_791756 ?auto_791758 ) ) ( not ( = ?auto_791756 ?auto_791759 ) ) ( not ( = ?auto_791756 ?auto_791760 ) ) ( not ( = ?auto_791756 ?auto_791761 ) ) ( not ( = ?auto_791756 ?auto_791762 ) ) ( not ( = ?auto_791756 ?auto_791763 ) ) ( not ( = ?auto_791756 ?auto_791764 ) ) ( not ( = ?auto_791756 ?auto_791765 ) ) ( not ( = ?auto_791756 ?auto_791766 ) ) ( not ( = ?auto_791756 ?auto_791767 ) ) ( not ( = ?auto_791757 ?auto_791758 ) ) ( not ( = ?auto_791757 ?auto_791759 ) ) ( not ( = ?auto_791757 ?auto_791760 ) ) ( not ( = ?auto_791757 ?auto_791761 ) ) ( not ( = ?auto_791757 ?auto_791762 ) ) ( not ( = ?auto_791757 ?auto_791763 ) ) ( not ( = ?auto_791757 ?auto_791764 ) ) ( not ( = ?auto_791757 ?auto_791765 ) ) ( not ( = ?auto_791757 ?auto_791766 ) ) ( not ( = ?auto_791757 ?auto_791767 ) ) ( not ( = ?auto_791758 ?auto_791759 ) ) ( not ( = ?auto_791758 ?auto_791760 ) ) ( not ( = ?auto_791758 ?auto_791761 ) ) ( not ( = ?auto_791758 ?auto_791762 ) ) ( not ( = ?auto_791758 ?auto_791763 ) ) ( not ( = ?auto_791758 ?auto_791764 ) ) ( not ( = ?auto_791758 ?auto_791765 ) ) ( not ( = ?auto_791758 ?auto_791766 ) ) ( not ( = ?auto_791758 ?auto_791767 ) ) ( not ( = ?auto_791759 ?auto_791760 ) ) ( not ( = ?auto_791759 ?auto_791761 ) ) ( not ( = ?auto_791759 ?auto_791762 ) ) ( not ( = ?auto_791759 ?auto_791763 ) ) ( not ( = ?auto_791759 ?auto_791764 ) ) ( not ( = ?auto_791759 ?auto_791765 ) ) ( not ( = ?auto_791759 ?auto_791766 ) ) ( not ( = ?auto_791759 ?auto_791767 ) ) ( not ( = ?auto_791760 ?auto_791761 ) ) ( not ( = ?auto_791760 ?auto_791762 ) ) ( not ( = ?auto_791760 ?auto_791763 ) ) ( not ( = ?auto_791760 ?auto_791764 ) ) ( not ( = ?auto_791760 ?auto_791765 ) ) ( not ( = ?auto_791760 ?auto_791766 ) ) ( not ( = ?auto_791760 ?auto_791767 ) ) ( not ( = ?auto_791761 ?auto_791762 ) ) ( not ( = ?auto_791761 ?auto_791763 ) ) ( not ( = ?auto_791761 ?auto_791764 ) ) ( not ( = ?auto_791761 ?auto_791765 ) ) ( not ( = ?auto_791761 ?auto_791766 ) ) ( not ( = ?auto_791761 ?auto_791767 ) ) ( not ( = ?auto_791762 ?auto_791763 ) ) ( not ( = ?auto_791762 ?auto_791764 ) ) ( not ( = ?auto_791762 ?auto_791765 ) ) ( not ( = ?auto_791762 ?auto_791766 ) ) ( not ( = ?auto_791762 ?auto_791767 ) ) ( not ( = ?auto_791763 ?auto_791764 ) ) ( not ( = ?auto_791763 ?auto_791765 ) ) ( not ( = ?auto_791763 ?auto_791766 ) ) ( not ( = ?auto_791763 ?auto_791767 ) ) ( not ( = ?auto_791764 ?auto_791765 ) ) ( not ( = ?auto_791764 ?auto_791766 ) ) ( not ( = ?auto_791764 ?auto_791767 ) ) ( not ( = ?auto_791765 ?auto_791766 ) ) ( not ( = ?auto_791765 ?auto_791767 ) ) ( not ( = ?auto_791766 ?auto_791767 ) ) ( ON ?auto_791766 ?auto_791767 ) ( ON ?auto_791765 ?auto_791766 ) ( ON ?auto_791764 ?auto_791765 ) ( ON ?auto_791763 ?auto_791764 ) ( ON ?auto_791762 ?auto_791763 ) ( ON ?auto_791761 ?auto_791762 ) ( ON ?auto_791760 ?auto_791761 ) ( CLEAR ?auto_791758 ) ( ON ?auto_791759 ?auto_791760 ) ( CLEAR ?auto_791759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_791750 ?auto_791751 ?auto_791752 ?auto_791753 ?auto_791754 ?auto_791755 ?auto_791756 ?auto_791757 ?auto_791758 ?auto_791759 )
      ( MAKE-18PILE ?auto_791750 ?auto_791751 ?auto_791752 ?auto_791753 ?auto_791754 ?auto_791755 ?auto_791756 ?auto_791757 ?auto_791758 ?auto_791759 ?auto_791760 ?auto_791761 ?auto_791762 ?auto_791763 ?auto_791764 ?auto_791765 ?auto_791766 ?auto_791767 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791786 - BLOCK
      ?auto_791787 - BLOCK
      ?auto_791788 - BLOCK
      ?auto_791789 - BLOCK
      ?auto_791790 - BLOCK
      ?auto_791791 - BLOCK
      ?auto_791792 - BLOCK
      ?auto_791793 - BLOCK
      ?auto_791794 - BLOCK
      ?auto_791795 - BLOCK
      ?auto_791796 - BLOCK
      ?auto_791797 - BLOCK
      ?auto_791798 - BLOCK
      ?auto_791799 - BLOCK
      ?auto_791800 - BLOCK
      ?auto_791801 - BLOCK
      ?auto_791802 - BLOCK
      ?auto_791803 - BLOCK
    )
    :vars
    (
      ?auto_791804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791803 ?auto_791804 ) ( ON-TABLE ?auto_791786 ) ( ON ?auto_791787 ?auto_791786 ) ( ON ?auto_791788 ?auto_791787 ) ( ON ?auto_791789 ?auto_791788 ) ( ON ?auto_791790 ?auto_791789 ) ( ON ?auto_791791 ?auto_791790 ) ( ON ?auto_791792 ?auto_791791 ) ( ON ?auto_791793 ?auto_791792 ) ( not ( = ?auto_791786 ?auto_791787 ) ) ( not ( = ?auto_791786 ?auto_791788 ) ) ( not ( = ?auto_791786 ?auto_791789 ) ) ( not ( = ?auto_791786 ?auto_791790 ) ) ( not ( = ?auto_791786 ?auto_791791 ) ) ( not ( = ?auto_791786 ?auto_791792 ) ) ( not ( = ?auto_791786 ?auto_791793 ) ) ( not ( = ?auto_791786 ?auto_791794 ) ) ( not ( = ?auto_791786 ?auto_791795 ) ) ( not ( = ?auto_791786 ?auto_791796 ) ) ( not ( = ?auto_791786 ?auto_791797 ) ) ( not ( = ?auto_791786 ?auto_791798 ) ) ( not ( = ?auto_791786 ?auto_791799 ) ) ( not ( = ?auto_791786 ?auto_791800 ) ) ( not ( = ?auto_791786 ?auto_791801 ) ) ( not ( = ?auto_791786 ?auto_791802 ) ) ( not ( = ?auto_791786 ?auto_791803 ) ) ( not ( = ?auto_791786 ?auto_791804 ) ) ( not ( = ?auto_791787 ?auto_791788 ) ) ( not ( = ?auto_791787 ?auto_791789 ) ) ( not ( = ?auto_791787 ?auto_791790 ) ) ( not ( = ?auto_791787 ?auto_791791 ) ) ( not ( = ?auto_791787 ?auto_791792 ) ) ( not ( = ?auto_791787 ?auto_791793 ) ) ( not ( = ?auto_791787 ?auto_791794 ) ) ( not ( = ?auto_791787 ?auto_791795 ) ) ( not ( = ?auto_791787 ?auto_791796 ) ) ( not ( = ?auto_791787 ?auto_791797 ) ) ( not ( = ?auto_791787 ?auto_791798 ) ) ( not ( = ?auto_791787 ?auto_791799 ) ) ( not ( = ?auto_791787 ?auto_791800 ) ) ( not ( = ?auto_791787 ?auto_791801 ) ) ( not ( = ?auto_791787 ?auto_791802 ) ) ( not ( = ?auto_791787 ?auto_791803 ) ) ( not ( = ?auto_791787 ?auto_791804 ) ) ( not ( = ?auto_791788 ?auto_791789 ) ) ( not ( = ?auto_791788 ?auto_791790 ) ) ( not ( = ?auto_791788 ?auto_791791 ) ) ( not ( = ?auto_791788 ?auto_791792 ) ) ( not ( = ?auto_791788 ?auto_791793 ) ) ( not ( = ?auto_791788 ?auto_791794 ) ) ( not ( = ?auto_791788 ?auto_791795 ) ) ( not ( = ?auto_791788 ?auto_791796 ) ) ( not ( = ?auto_791788 ?auto_791797 ) ) ( not ( = ?auto_791788 ?auto_791798 ) ) ( not ( = ?auto_791788 ?auto_791799 ) ) ( not ( = ?auto_791788 ?auto_791800 ) ) ( not ( = ?auto_791788 ?auto_791801 ) ) ( not ( = ?auto_791788 ?auto_791802 ) ) ( not ( = ?auto_791788 ?auto_791803 ) ) ( not ( = ?auto_791788 ?auto_791804 ) ) ( not ( = ?auto_791789 ?auto_791790 ) ) ( not ( = ?auto_791789 ?auto_791791 ) ) ( not ( = ?auto_791789 ?auto_791792 ) ) ( not ( = ?auto_791789 ?auto_791793 ) ) ( not ( = ?auto_791789 ?auto_791794 ) ) ( not ( = ?auto_791789 ?auto_791795 ) ) ( not ( = ?auto_791789 ?auto_791796 ) ) ( not ( = ?auto_791789 ?auto_791797 ) ) ( not ( = ?auto_791789 ?auto_791798 ) ) ( not ( = ?auto_791789 ?auto_791799 ) ) ( not ( = ?auto_791789 ?auto_791800 ) ) ( not ( = ?auto_791789 ?auto_791801 ) ) ( not ( = ?auto_791789 ?auto_791802 ) ) ( not ( = ?auto_791789 ?auto_791803 ) ) ( not ( = ?auto_791789 ?auto_791804 ) ) ( not ( = ?auto_791790 ?auto_791791 ) ) ( not ( = ?auto_791790 ?auto_791792 ) ) ( not ( = ?auto_791790 ?auto_791793 ) ) ( not ( = ?auto_791790 ?auto_791794 ) ) ( not ( = ?auto_791790 ?auto_791795 ) ) ( not ( = ?auto_791790 ?auto_791796 ) ) ( not ( = ?auto_791790 ?auto_791797 ) ) ( not ( = ?auto_791790 ?auto_791798 ) ) ( not ( = ?auto_791790 ?auto_791799 ) ) ( not ( = ?auto_791790 ?auto_791800 ) ) ( not ( = ?auto_791790 ?auto_791801 ) ) ( not ( = ?auto_791790 ?auto_791802 ) ) ( not ( = ?auto_791790 ?auto_791803 ) ) ( not ( = ?auto_791790 ?auto_791804 ) ) ( not ( = ?auto_791791 ?auto_791792 ) ) ( not ( = ?auto_791791 ?auto_791793 ) ) ( not ( = ?auto_791791 ?auto_791794 ) ) ( not ( = ?auto_791791 ?auto_791795 ) ) ( not ( = ?auto_791791 ?auto_791796 ) ) ( not ( = ?auto_791791 ?auto_791797 ) ) ( not ( = ?auto_791791 ?auto_791798 ) ) ( not ( = ?auto_791791 ?auto_791799 ) ) ( not ( = ?auto_791791 ?auto_791800 ) ) ( not ( = ?auto_791791 ?auto_791801 ) ) ( not ( = ?auto_791791 ?auto_791802 ) ) ( not ( = ?auto_791791 ?auto_791803 ) ) ( not ( = ?auto_791791 ?auto_791804 ) ) ( not ( = ?auto_791792 ?auto_791793 ) ) ( not ( = ?auto_791792 ?auto_791794 ) ) ( not ( = ?auto_791792 ?auto_791795 ) ) ( not ( = ?auto_791792 ?auto_791796 ) ) ( not ( = ?auto_791792 ?auto_791797 ) ) ( not ( = ?auto_791792 ?auto_791798 ) ) ( not ( = ?auto_791792 ?auto_791799 ) ) ( not ( = ?auto_791792 ?auto_791800 ) ) ( not ( = ?auto_791792 ?auto_791801 ) ) ( not ( = ?auto_791792 ?auto_791802 ) ) ( not ( = ?auto_791792 ?auto_791803 ) ) ( not ( = ?auto_791792 ?auto_791804 ) ) ( not ( = ?auto_791793 ?auto_791794 ) ) ( not ( = ?auto_791793 ?auto_791795 ) ) ( not ( = ?auto_791793 ?auto_791796 ) ) ( not ( = ?auto_791793 ?auto_791797 ) ) ( not ( = ?auto_791793 ?auto_791798 ) ) ( not ( = ?auto_791793 ?auto_791799 ) ) ( not ( = ?auto_791793 ?auto_791800 ) ) ( not ( = ?auto_791793 ?auto_791801 ) ) ( not ( = ?auto_791793 ?auto_791802 ) ) ( not ( = ?auto_791793 ?auto_791803 ) ) ( not ( = ?auto_791793 ?auto_791804 ) ) ( not ( = ?auto_791794 ?auto_791795 ) ) ( not ( = ?auto_791794 ?auto_791796 ) ) ( not ( = ?auto_791794 ?auto_791797 ) ) ( not ( = ?auto_791794 ?auto_791798 ) ) ( not ( = ?auto_791794 ?auto_791799 ) ) ( not ( = ?auto_791794 ?auto_791800 ) ) ( not ( = ?auto_791794 ?auto_791801 ) ) ( not ( = ?auto_791794 ?auto_791802 ) ) ( not ( = ?auto_791794 ?auto_791803 ) ) ( not ( = ?auto_791794 ?auto_791804 ) ) ( not ( = ?auto_791795 ?auto_791796 ) ) ( not ( = ?auto_791795 ?auto_791797 ) ) ( not ( = ?auto_791795 ?auto_791798 ) ) ( not ( = ?auto_791795 ?auto_791799 ) ) ( not ( = ?auto_791795 ?auto_791800 ) ) ( not ( = ?auto_791795 ?auto_791801 ) ) ( not ( = ?auto_791795 ?auto_791802 ) ) ( not ( = ?auto_791795 ?auto_791803 ) ) ( not ( = ?auto_791795 ?auto_791804 ) ) ( not ( = ?auto_791796 ?auto_791797 ) ) ( not ( = ?auto_791796 ?auto_791798 ) ) ( not ( = ?auto_791796 ?auto_791799 ) ) ( not ( = ?auto_791796 ?auto_791800 ) ) ( not ( = ?auto_791796 ?auto_791801 ) ) ( not ( = ?auto_791796 ?auto_791802 ) ) ( not ( = ?auto_791796 ?auto_791803 ) ) ( not ( = ?auto_791796 ?auto_791804 ) ) ( not ( = ?auto_791797 ?auto_791798 ) ) ( not ( = ?auto_791797 ?auto_791799 ) ) ( not ( = ?auto_791797 ?auto_791800 ) ) ( not ( = ?auto_791797 ?auto_791801 ) ) ( not ( = ?auto_791797 ?auto_791802 ) ) ( not ( = ?auto_791797 ?auto_791803 ) ) ( not ( = ?auto_791797 ?auto_791804 ) ) ( not ( = ?auto_791798 ?auto_791799 ) ) ( not ( = ?auto_791798 ?auto_791800 ) ) ( not ( = ?auto_791798 ?auto_791801 ) ) ( not ( = ?auto_791798 ?auto_791802 ) ) ( not ( = ?auto_791798 ?auto_791803 ) ) ( not ( = ?auto_791798 ?auto_791804 ) ) ( not ( = ?auto_791799 ?auto_791800 ) ) ( not ( = ?auto_791799 ?auto_791801 ) ) ( not ( = ?auto_791799 ?auto_791802 ) ) ( not ( = ?auto_791799 ?auto_791803 ) ) ( not ( = ?auto_791799 ?auto_791804 ) ) ( not ( = ?auto_791800 ?auto_791801 ) ) ( not ( = ?auto_791800 ?auto_791802 ) ) ( not ( = ?auto_791800 ?auto_791803 ) ) ( not ( = ?auto_791800 ?auto_791804 ) ) ( not ( = ?auto_791801 ?auto_791802 ) ) ( not ( = ?auto_791801 ?auto_791803 ) ) ( not ( = ?auto_791801 ?auto_791804 ) ) ( not ( = ?auto_791802 ?auto_791803 ) ) ( not ( = ?auto_791802 ?auto_791804 ) ) ( not ( = ?auto_791803 ?auto_791804 ) ) ( ON ?auto_791802 ?auto_791803 ) ( ON ?auto_791801 ?auto_791802 ) ( ON ?auto_791800 ?auto_791801 ) ( ON ?auto_791799 ?auto_791800 ) ( ON ?auto_791798 ?auto_791799 ) ( ON ?auto_791797 ?auto_791798 ) ( ON ?auto_791796 ?auto_791797 ) ( ON ?auto_791795 ?auto_791796 ) ( CLEAR ?auto_791793 ) ( ON ?auto_791794 ?auto_791795 ) ( CLEAR ?auto_791794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_791786 ?auto_791787 ?auto_791788 ?auto_791789 ?auto_791790 ?auto_791791 ?auto_791792 ?auto_791793 ?auto_791794 )
      ( MAKE-18PILE ?auto_791786 ?auto_791787 ?auto_791788 ?auto_791789 ?auto_791790 ?auto_791791 ?auto_791792 ?auto_791793 ?auto_791794 ?auto_791795 ?auto_791796 ?auto_791797 ?auto_791798 ?auto_791799 ?auto_791800 ?auto_791801 ?auto_791802 ?auto_791803 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791823 - BLOCK
      ?auto_791824 - BLOCK
      ?auto_791825 - BLOCK
      ?auto_791826 - BLOCK
      ?auto_791827 - BLOCK
      ?auto_791828 - BLOCK
      ?auto_791829 - BLOCK
      ?auto_791830 - BLOCK
      ?auto_791831 - BLOCK
      ?auto_791832 - BLOCK
      ?auto_791833 - BLOCK
      ?auto_791834 - BLOCK
      ?auto_791835 - BLOCK
      ?auto_791836 - BLOCK
      ?auto_791837 - BLOCK
      ?auto_791838 - BLOCK
      ?auto_791839 - BLOCK
      ?auto_791840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791840 ) ( ON-TABLE ?auto_791823 ) ( ON ?auto_791824 ?auto_791823 ) ( ON ?auto_791825 ?auto_791824 ) ( ON ?auto_791826 ?auto_791825 ) ( ON ?auto_791827 ?auto_791826 ) ( ON ?auto_791828 ?auto_791827 ) ( ON ?auto_791829 ?auto_791828 ) ( ON ?auto_791830 ?auto_791829 ) ( not ( = ?auto_791823 ?auto_791824 ) ) ( not ( = ?auto_791823 ?auto_791825 ) ) ( not ( = ?auto_791823 ?auto_791826 ) ) ( not ( = ?auto_791823 ?auto_791827 ) ) ( not ( = ?auto_791823 ?auto_791828 ) ) ( not ( = ?auto_791823 ?auto_791829 ) ) ( not ( = ?auto_791823 ?auto_791830 ) ) ( not ( = ?auto_791823 ?auto_791831 ) ) ( not ( = ?auto_791823 ?auto_791832 ) ) ( not ( = ?auto_791823 ?auto_791833 ) ) ( not ( = ?auto_791823 ?auto_791834 ) ) ( not ( = ?auto_791823 ?auto_791835 ) ) ( not ( = ?auto_791823 ?auto_791836 ) ) ( not ( = ?auto_791823 ?auto_791837 ) ) ( not ( = ?auto_791823 ?auto_791838 ) ) ( not ( = ?auto_791823 ?auto_791839 ) ) ( not ( = ?auto_791823 ?auto_791840 ) ) ( not ( = ?auto_791824 ?auto_791825 ) ) ( not ( = ?auto_791824 ?auto_791826 ) ) ( not ( = ?auto_791824 ?auto_791827 ) ) ( not ( = ?auto_791824 ?auto_791828 ) ) ( not ( = ?auto_791824 ?auto_791829 ) ) ( not ( = ?auto_791824 ?auto_791830 ) ) ( not ( = ?auto_791824 ?auto_791831 ) ) ( not ( = ?auto_791824 ?auto_791832 ) ) ( not ( = ?auto_791824 ?auto_791833 ) ) ( not ( = ?auto_791824 ?auto_791834 ) ) ( not ( = ?auto_791824 ?auto_791835 ) ) ( not ( = ?auto_791824 ?auto_791836 ) ) ( not ( = ?auto_791824 ?auto_791837 ) ) ( not ( = ?auto_791824 ?auto_791838 ) ) ( not ( = ?auto_791824 ?auto_791839 ) ) ( not ( = ?auto_791824 ?auto_791840 ) ) ( not ( = ?auto_791825 ?auto_791826 ) ) ( not ( = ?auto_791825 ?auto_791827 ) ) ( not ( = ?auto_791825 ?auto_791828 ) ) ( not ( = ?auto_791825 ?auto_791829 ) ) ( not ( = ?auto_791825 ?auto_791830 ) ) ( not ( = ?auto_791825 ?auto_791831 ) ) ( not ( = ?auto_791825 ?auto_791832 ) ) ( not ( = ?auto_791825 ?auto_791833 ) ) ( not ( = ?auto_791825 ?auto_791834 ) ) ( not ( = ?auto_791825 ?auto_791835 ) ) ( not ( = ?auto_791825 ?auto_791836 ) ) ( not ( = ?auto_791825 ?auto_791837 ) ) ( not ( = ?auto_791825 ?auto_791838 ) ) ( not ( = ?auto_791825 ?auto_791839 ) ) ( not ( = ?auto_791825 ?auto_791840 ) ) ( not ( = ?auto_791826 ?auto_791827 ) ) ( not ( = ?auto_791826 ?auto_791828 ) ) ( not ( = ?auto_791826 ?auto_791829 ) ) ( not ( = ?auto_791826 ?auto_791830 ) ) ( not ( = ?auto_791826 ?auto_791831 ) ) ( not ( = ?auto_791826 ?auto_791832 ) ) ( not ( = ?auto_791826 ?auto_791833 ) ) ( not ( = ?auto_791826 ?auto_791834 ) ) ( not ( = ?auto_791826 ?auto_791835 ) ) ( not ( = ?auto_791826 ?auto_791836 ) ) ( not ( = ?auto_791826 ?auto_791837 ) ) ( not ( = ?auto_791826 ?auto_791838 ) ) ( not ( = ?auto_791826 ?auto_791839 ) ) ( not ( = ?auto_791826 ?auto_791840 ) ) ( not ( = ?auto_791827 ?auto_791828 ) ) ( not ( = ?auto_791827 ?auto_791829 ) ) ( not ( = ?auto_791827 ?auto_791830 ) ) ( not ( = ?auto_791827 ?auto_791831 ) ) ( not ( = ?auto_791827 ?auto_791832 ) ) ( not ( = ?auto_791827 ?auto_791833 ) ) ( not ( = ?auto_791827 ?auto_791834 ) ) ( not ( = ?auto_791827 ?auto_791835 ) ) ( not ( = ?auto_791827 ?auto_791836 ) ) ( not ( = ?auto_791827 ?auto_791837 ) ) ( not ( = ?auto_791827 ?auto_791838 ) ) ( not ( = ?auto_791827 ?auto_791839 ) ) ( not ( = ?auto_791827 ?auto_791840 ) ) ( not ( = ?auto_791828 ?auto_791829 ) ) ( not ( = ?auto_791828 ?auto_791830 ) ) ( not ( = ?auto_791828 ?auto_791831 ) ) ( not ( = ?auto_791828 ?auto_791832 ) ) ( not ( = ?auto_791828 ?auto_791833 ) ) ( not ( = ?auto_791828 ?auto_791834 ) ) ( not ( = ?auto_791828 ?auto_791835 ) ) ( not ( = ?auto_791828 ?auto_791836 ) ) ( not ( = ?auto_791828 ?auto_791837 ) ) ( not ( = ?auto_791828 ?auto_791838 ) ) ( not ( = ?auto_791828 ?auto_791839 ) ) ( not ( = ?auto_791828 ?auto_791840 ) ) ( not ( = ?auto_791829 ?auto_791830 ) ) ( not ( = ?auto_791829 ?auto_791831 ) ) ( not ( = ?auto_791829 ?auto_791832 ) ) ( not ( = ?auto_791829 ?auto_791833 ) ) ( not ( = ?auto_791829 ?auto_791834 ) ) ( not ( = ?auto_791829 ?auto_791835 ) ) ( not ( = ?auto_791829 ?auto_791836 ) ) ( not ( = ?auto_791829 ?auto_791837 ) ) ( not ( = ?auto_791829 ?auto_791838 ) ) ( not ( = ?auto_791829 ?auto_791839 ) ) ( not ( = ?auto_791829 ?auto_791840 ) ) ( not ( = ?auto_791830 ?auto_791831 ) ) ( not ( = ?auto_791830 ?auto_791832 ) ) ( not ( = ?auto_791830 ?auto_791833 ) ) ( not ( = ?auto_791830 ?auto_791834 ) ) ( not ( = ?auto_791830 ?auto_791835 ) ) ( not ( = ?auto_791830 ?auto_791836 ) ) ( not ( = ?auto_791830 ?auto_791837 ) ) ( not ( = ?auto_791830 ?auto_791838 ) ) ( not ( = ?auto_791830 ?auto_791839 ) ) ( not ( = ?auto_791830 ?auto_791840 ) ) ( not ( = ?auto_791831 ?auto_791832 ) ) ( not ( = ?auto_791831 ?auto_791833 ) ) ( not ( = ?auto_791831 ?auto_791834 ) ) ( not ( = ?auto_791831 ?auto_791835 ) ) ( not ( = ?auto_791831 ?auto_791836 ) ) ( not ( = ?auto_791831 ?auto_791837 ) ) ( not ( = ?auto_791831 ?auto_791838 ) ) ( not ( = ?auto_791831 ?auto_791839 ) ) ( not ( = ?auto_791831 ?auto_791840 ) ) ( not ( = ?auto_791832 ?auto_791833 ) ) ( not ( = ?auto_791832 ?auto_791834 ) ) ( not ( = ?auto_791832 ?auto_791835 ) ) ( not ( = ?auto_791832 ?auto_791836 ) ) ( not ( = ?auto_791832 ?auto_791837 ) ) ( not ( = ?auto_791832 ?auto_791838 ) ) ( not ( = ?auto_791832 ?auto_791839 ) ) ( not ( = ?auto_791832 ?auto_791840 ) ) ( not ( = ?auto_791833 ?auto_791834 ) ) ( not ( = ?auto_791833 ?auto_791835 ) ) ( not ( = ?auto_791833 ?auto_791836 ) ) ( not ( = ?auto_791833 ?auto_791837 ) ) ( not ( = ?auto_791833 ?auto_791838 ) ) ( not ( = ?auto_791833 ?auto_791839 ) ) ( not ( = ?auto_791833 ?auto_791840 ) ) ( not ( = ?auto_791834 ?auto_791835 ) ) ( not ( = ?auto_791834 ?auto_791836 ) ) ( not ( = ?auto_791834 ?auto_791837 ) ) ( not ( = ?auto_791834 ?auto_791838 ) ) ( not ( = ?auto_791834 ?auto_791839 ) ) ( not ( = ?auto_791834 ?auto_791840 ) ) ( not ( = ?auto_791835 ?auto_791836 ) ) ( not ( = ?auto_791835 ?auto_791837 ) ) ( not ( = ?auto_791835 ?auto_791838 ) ) ( not ( = ?auto_791835 ?auto_791839 ) ) ( not ( = ?auto_791835 ?auto_791840 ) ) ( not ( = ?auto_791836 ?auto_791837 ) ) ( not ( = ?auto_791836 ?auto_791838 ) ) ( not ( = ?auto_791836 ?auto_791839 ) ) ( not ( = ?auto_791836 ?auto_791840 ) ) ( not ( = ?auto_791837 ?auto_791838 ) ) ( not ( = ?auto_791837 ?auto_791839 ) ) ( not ( = ?auto_791837 ?auto_791840 ) ) ( not ( = ?auto_791838 ?auto_791839 ) ) ( not ( = ?auto_791838 ?auto_791840 ) ) ( not ( = ?auto_791839 ?auto_791840 ) ) ( ON ?auto_791839 ?auto_791840 ) ( ON ?auto_791838 ?auto_791839 ) ( ON ?auto_791837 ?auto_791838 ) ( ON ?auto_791836 ?auto_791837 ) ( ON ?auto_791835 ?auto_791836 ) ( ON ?auto_791834 ?auto_791835 ) ( ON ?auto_791833 ?auto_791834 ) ( ON ?auto_791832 ?auto_791833 ) ( CLEAR ?auto_791830 ) ( ON ?auto_791831 ?auto_791832 ) ( CLEAR ?auto_791831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_791823 ?auto_791824 ?auto_791825 ?auto_791826 ?auto_791827 ?auto_791828 ?auto_791829 ?auto_791830 ?auto_791831 )
      ( MAKE-18PILE ?auto_791823 ?auto_791824 ?auto_791825 ?auto_791826 ?auto_791827 ?auto_791828 ?auto_791829 ?auto_791830 ?auto_791831 ?auto_791832 ?auto_791833 ?auto_791834 ?auto_791835 ?auto_791836 ?auto_791837 ?auto_791838 ?auto_791839 ?auto_791840 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791859 - BLOCK
      ?auto_791860 - BLOCK
      ?auto_791861 - BLOCK
      ?auto_791862 - BLOCK
      ?auto_791863 - BLOCK
      ?auto_791864 - BLOCK
      ?auto_791865 - BLOCK
      ?auto_791866 - BLOCK
      ?auto_791867 - BLOCK
      ?auto_791868 - BLOCK
      ?auto_791869 - BLOCK
      ?auto_791870 - BLOCK
      ?auto_791871 - BLOCK
      ?auto_791872 - BLOCK
      ?auto_791873 - BLOCK
      ?auto_791874 - BLOCK
      ?auto_791875 - BLOCK
      ?auto_791876 - BLOCK
    )
    :vars
    (
      ?auto_791877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791876 ?auto_791877 ) ( ON-TABLE ?auto_791859 ) ( ON ?auto_791860 ?auto_791859 ) ( ON ?auto_791861 ?auto_791860 ) ( ON ?auto_791862 ?auto_791861 ) ( ON ?auto_791863 ?auto_791862 ) ( ON ?auto_791864 ?auto_791863 ) ( ON ?auto_791865 ?auto_791864 ) ( not ( = ?auto_791859 ?auto_791860 ) ) ( not ( = ?auto_791859 ?auto_791861 ) ) ( not ( = ?auto_791859 ?auto_791862 ) ) ( not ( = ?auto_791859 ?auto_791863 ) ) ( not ( = ?auto_791859 ?auto_791864 ) ) ( not ( = ?auto_791859 ?auto_791865 ) ) ( not ( = ?auto_791859 ?auto_791866 ) ) ( not ( = ?auto_791859 ?auto_791867 ) ) ( not ( = ?auto_791859 ?auto_791868 ) ) ( not ( = ?auto_791859 ?auto_791869 ) ) ( not ( = ?auto_791859 ?auto_791870 ) ) ( not ( = ?auto_791859 ?auto_791871 ) ) ( not ( = ?auto_791859 ?auto_791872 ) ) ( not ( = ?auto_791859 ?auto_791873 ) ) ( not ( = ?auto_791859 ?auto_791874 ) ) ( not ( = ?auto_791859 ?auto_791875 ) ) ( not ( = ?auto_791859 ?auto_791876 ) ) ( not ( = ?auto_791859 ?auto_791877 ) ) ( not ( = ?auto_791860 ?auto_791861 ) ) ( not ( = ?auto_791860 ?auto_791862 ) ) ( not ( = ?auto_791860 ?auto_791863 ) ) ( not ( = ?auto_791860 ?auto_791864 ) ) ( not ( = ?auto_791860 ?auto_791865 ) ) ( not ( = ?auto_791860 ?auto_791866 ) ) ( not ( = ?auto_791860 ?auto_791867 ) ) ( not ( = ?auto_791860 ?auto_791868 ) ) ( not ( = ?auto_791860 ?auto_791869 ) ) ( not ( = ?auto_791860 ?auto_791870 ) ) ( not ( = ?auto_791860 ?auto_791871 ) ) ( not ( = ?auto_791860 ?auto_791872 ) ) ( not ( = ?auto_791860 ?auto_791873 ) ) ( not ( = ?auto_791860 ?auto_791874 ) ) ( not ( = ?auto_791860 ?auto_791875 ) ) ( not ( = ?auto_791860 ?auto_791876 ) ) ( not ( = ?auto_791860 ?auto_791877 ) ) ( not ( = ?auto_791861 ?auto_791862 ) ) ( not ( = ?auto_791861 ?auto_791863 ) ) ( not ( = ?auto_791861 ?auto_791864 ) ) ( not ( = ?auto_791861 ?auto_791865 ) ) ( not ( = ?auto_791861 ?auto_791866 ) ) ( not ( = ?auto_791861 ?auto_791867 ) ) ( not ( = ?auto_791861 ?auto_791868 ) ) ( not ( = ?auto_791861 ?auto_791869 ) ) ( not ( = ?auto_791861 ?auto_791870 ) ) ( not ( = ?auto_791861 ?auto_791871 ) ) ( not ( = ?auto_791861 ?auto_791872 ) ) ( not ( = ?auto_791861 ?auto_791873 ) ) ( not ( = ?auto_791861 ?auto_791874 ) ) ( not ( = ?auto_791861 ?auto_791875 ) ) ( not ( = ?auto_791861 ?auto_791876 ) ) ( not ( = ?auto_791861 ?auto_791877 ) ) ( not ( = ?auto_791862 ?auto_791863 ) ) ( not ( = ?auto_791862 ?auto_791864 ) ) ( not ( = ?auto_791862 ?auto_791865 ) ) ( not ( = ?auto_791862 ?auto_791866 ) ) ( not ( = ?auto_791862 ?auto_791867 ) ) ( not ( = ?auto_791862 ?auto_791868 ) ) ( not ( = ?auto_791862 ?auto_791869 ) ) ( not ( = ?auto_791862 ?auto_791870 ) ) ( not ( = ?auto_791862 ?auto_791871 ) ) ( not ( = ?auto_791862 ?auto_791872 ) ) ( not ( = ?auto_791862 ?auto_791873 ) ) ( not ( = ?auto_791862 ?auto_791874 ) ) ( not ( = ?auto_791862 ?auto_791875 ) ) ( not ( = ?auto_791862 ?auto_791876 ) ) ( not ( = ?auto_791862 ?auto_791877 ) ) ( not ( = ?auto_791863 ?auto_791864 ) ) ( not ( = ?auto_791863 ?auto_791865 ) ) ( not ( = ?auto_791863 ?auto_791866 ) ) ( not ( = ?auto_791863 ?auto_791867 ) ) ( not ( = ?auto_791863 ?auto_791868 ) ) ( not ( = ?auto_791863 ?auto_791869 ) ) ( not ( = ?auto_791863 ?auto_791870 ) ) ( not ( = ?auto_791863 ?auto_791871 ) ) ( not ( = ?auto_791863 ?auto_791872 ) ) ( not ( = ?auto_791863 ?auto_791873 ) ) ( not ( = ?auto_791863 ?auto_791874 ) ) ( not ( = ?auto_791863 ?auto_791875 ) ) ( not ( = ?auto_791863 ?auto_791876 ) ) ( not ( = ?auto_791863 ?auto_791877 ) ) ( not ( = ?auto_791864 ?auto_791865 ) ) ( not ( = ?auto_791864 ?auto_791866 ) ) ( not ( = ?auto_791864 ?auto_791867 ) ) ( not ( = ?auto_791864 ?auto_791868 ) ) ( not ( = ?auto_791864 ?auto_791869 ) ) ( not ( = ?auto_791864 ?auto_791870 ) ) ( not ( = ?auto_791864 ?auto_791871 ) ) ( not ( = ?auto_791864 ?auto_791872 ) ) ( not ( = ?auto_791864 ?auto_791873 ) ) ( not ( = ?auto_791864 ?auto_791874 ) ) ( not ( = ?auto_791864 ?auto_791875 ) ) ( not ( = ?auto_791864 ?auto_791876 ) ) ( not ( = ?auto_791864 ?auto_791877 ) ) ( not ( = ?auto_791865 ?auto_791866 ) ) ( not ( = ?auto_791865 ?auto_791867 ) ) ( not ( = ?auto_791865 ?auto_791868 ) ) ( not ( = ?auto_791865 ?auto_791869 ) ) ( not ( = ?auto_791865 ?auto_791870 ) ) ( not ( = ?auto_791865 ?auto_791871 ) ) ( not ( = ?auto_791865 ?auto_791872 ) ) ( not ( = ?auto_791865 ?auto_791873 ) ) ( not ( = ?auto_791865 ?auto_791874 ) ) ( not ( = ?auto_791865 ?auto_791875 ) ) ( not ( = ?auto_791865 ?auto_791876 ) ) ( not ( = ?auto_791865 ?auto_791877 ) ) ( not ( = ?auto_791866 ?auto_791867 ) ) ( not ( = ?auto_791866 ?auto_791868 ) ) ( not ( = ?auto_791866 ?auto_791869 ) ) ( not ( = ?auto_791866 ?auto_791870 ) ) ( not ( = ?auto_791866 ?auto_791871 ) ) ( not ( = ?auto_791866 ?auto_791872 ) ) ( not ( = ?auto_791866 ?auto_791873 ) ) ( not ( = ?auto_791866 ?auto_791874 ) ) ( not ( = ?auto_791866 ?auto_791875 ) ) ( not ( = ?auto_791866 ?auto_791876 ) ) ( not ( = ?auto_791866 ?auto_791877 ) ) ( not ( = ?auto_791867 ?auto_791868 ) ) ( not ( = ?auto_791867 ?auto_791869 ) ) ( not ( = ?auto_791867 ?auto_791870 ) ) ( not ( = ?auto_791867 ?auto_791871 ) ) ( not ( = ?auto_791867 ?auto_791872 ) ) ( not ( = ?auto_791867 ?auto_791873 ) ) ( not ( = ?auto_791867 ?auto_791874 ) ) ( not ( = ?auto_791867 ?auto_791875 ) ) ( not ( = ?auto_791867 ?auto_791876 ) ) ( not ( = ?auto_791867 ?auto_791877 ) ) ( not ( = ?auto_791868 ?auto_791869 ) ) ( not ( = ?auto_791868 ?auto_791870 ) ) ( not ( = ?auto_791868 ?auto_791871 ) ) ( not ( = ?auto_791868 ?auto_791872 ) ) ( not ( = ?auto_791868 ?auto_791873 ) ) ( not ( = ?auto_791868 ?auto_791874 ) ) ( not ( = ?auto_791868 ?auto_791875 ) ) ( not ( = ?auto_791868 ?auto_791876 ) ) ( not ( = ?auto_791868 ?auto_791877 ) ) ( not ( = ?auto_791869 ?auto_791870 ) ) ( not ( = ?auto_791869 ?auto_791871 ) ) ( not ( = ?auto_791869 ?auto_791872 ) ) ( not ( = ?auto_791869 ?auto_791873 ) ) ( not ( = ?auto_791869 ?auto_791874 ) ) ( not ( = ?auto_791869 ?auto_791875 ) ) ( not ( = ?auto_791869 ?auto_791876 ) ) ( not ( = ?auto_791869 ?auto_791877 ) ) ( not ( = ?auto_791870 ?auto_791871 ) ) ( not ( = ?auto_791870 ?auto_791872 ) ) ( not ( = ?auto_791870 ?auto_791873 ) ) ( not ( = ?auto_791870 ?auto_791874 ) ) ( not ( = ?auto_791870 ?auto_791875 ) ) ( not ( = ?auto_791870 ?auto_791876 ) ) ( not ( = ?auto_791870 ?auto_791877 ) ) ( not ( = ?auto_791871 ?auto_791872 ) ) ( not ( = ?auto_791871 ?auto_791873 ) ) ( not ( = ?auto_791871 ?auto_791874 ) ) ( not ( = ?auto_791871 ?auto_791875 ) ) ( not ( = ?auto_791871 ?auto_791876 ) ) ( not ( = ?auto_791871 ?auto_791877 ) ) ( not ( = ?auto_791872 ?auto_791873 ) ) ( not ( = ?auto_791872 ?auto_791874 ) ) ( not ( = ?auto_791872 ?auto_791875 ) ) ( not ( = ?auto_791872 ?auto_791876 ) ) ( not ( = ?auto_791872 ?auto_791877 ) ) ( not ( = ?auto_791873 ?auto_791874 ) ) ( not ( = ?auto_791873 ?auto_791875 ) ) ( not ( = ?auto_791873 ?auto_791876 ) ) ( not ( = ?auto_791873 ?auto_791877 ) ) ( not ( = ?auto_791874 ?auto_791875 ) ) ( not ( = ?auto_791874 ?auto_791876 ) ) ( not ( = ?auto_791874 ?auto_791877 ) ) ( not ( = ?auto_791875 ?auto_791876 ) ) ( not ( = ?auto_791875 ?auto_791877 ) ) ( not ( = ?auto_791876 ?auto_791877 ) ) ( ON ?auto_791875 ?auto_791876 ) ( ON ?auto_791874 ?auto_791875 ) ( ON ?auto_791873 ?auto_791874 ) ( ON ?auto_791872 ?auto_791873 ) ( ON ?auto_791871 ?auto_791872 ) ( ON ?auto_791870 ?auto_791871 ) ( ON ?auto_791869 ?auto_791870 ) ( ON ?auto_791868 ?auto_791869 ) ( ON ?auto_791867 ?auto_791868 ) ( CLEAR ?auto_791865 ) ( ON ?auto_791866 ?auto_791867 ) ( CLEAR ?auto_791866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_791859 ?auto_791860 ?auto_791861 ?auto_791862 ?auto_791863 ?auto_791864 ?auto_791865 ?auto_791866 )
      ( MAKE-18PILE ?auto_791859 ?auto_791860 ?auto_791861 ?auto_791862 ?auto_791863 ?auto_791864 ?auto_791865 ?auto_791866 ?auto_791867 ?auto_791868 ?auto_791869 ?auto_791870 ?auto_791871 ?auto_791872 ?auto_791873 ?auto_791874 ?auto_791875 ?auto_791876 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791896 - BLOCK
      ?auto_791897 - BLOCK
      ?auto_791898 - BLOCK
      ?auto_791899 - BLOCK
      ?auto_791900 - BLOCK
      ?auto_791901 - BLOCK
      ?auto_791902 - BLOCK
      ?auto_791903 - BLOCK
      ?auto_791904 - BLOCK
      ?auto_791905 - BLOCK
      ?auto_791906 - BLOCK
      ?auto_791907 - BLOCK
      ?auto_791908 - BLOCK
      ?auto_791909 - BLOCK
      ?auto_791910 - BLOCK
      ?auto_791911 - BLOCK
      ?auto_791912 - BLOCK
      ?auto_791913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791913 ) ( ON-TABLE ?auto_791896 ) ( ON ?auto_791897 ?auto_791896 ) ( ON ?auto_791898 ?auto_791897 ) ( ON ?auto_791899 ?auto_791898 ) ( ON ?auto_791900 ?auto_791899 ) ( ON ?auto_791901 ?auto_791900 ) ( ON ?auto_791902 ?auto_791901 ) ( not ( = ?auto_791896 ?auto_791897 ) ) ( not ( = ?auto_791896 ?auto_791898 ) ) ( not ( = ?auto_791896 ?auto_791899 ) ) ( not ( = ?auto_791896 ?auto_791900 ) ) ( not ( = ?auto_791896 ?auto_791901 ) ) ( not ( = ?auto_791896 ?auto_791902 ) ) ( not ( = ?auto_791896 ?auto_791903 ) ) ( not ( = ?auto_791896 ?auto_791904 ) ) ( not ( = ?auto_791896 ?auto_791905 ) ) ( not ( = ?auto_791896 ?auto_791906 ) ) ( not ( = ?auto_791896 ?auto_791907 ) ) ( not ( = ?auto_791896 ?auto_791908 ) ) ( not ( = ?auto_791896 ?auto_791909 ) ) ( not ( = ?auto_791896 ?auto_791910 ) ) ( not ( = ?auto_791896 ?auto_791911 ) ) ( not ( = ?auto_791896 ?auto_791912 ) ) ( not ( = ?auto_791896 ?auto_791913 ) ) ( not ( = ?auto_791897 ?auto_791898 ) ) ( not ( = ?auto_791897 ?auto_791899 ) ) ( not ( = ?auto_791897 ?auto_791900 ) ) ( not ( = ?auto_791897 ?auto_791901 ) ) ( not ( = ?auto_791897 ?auto_791902 ) ) ( not ( = ?auto_791897 ?auto_791903 ) ) ( not ( = ?auto_791897 ?auto_791904 ) ) ( not ( = ?auto_791897 ?auto_791905 ) ) ( not ( = ?auto_791897 ?auto_791906 ) ) ( not ( = ?auto_791897 ?auto_791907 ) ) ( not ( = ?auto_791897 ?auto_791908 ) ) ( not ( = ?auto_791897 ?auto_791909 ) ) ( not ( = ?auto_791897 ?auto_791910 ) ) ( not ( = ?auto_791897 ?auto_791911 ) ) ( not ( = ?auto_791897 ?auto_791912 ) ) ( not ( = ?auto_791897 ?auto_791913 ) ) ( not ( = ?auto_791898 ?auto_791899 ) ) ( not ( = ?auto_791898 ?auto_791900 ) ) ( not ( = ?auto_791898 ?auto_791901 ) ) ( not ( = ?auto_791898 ?auto_791902 ) ) ( not ( = ?auto_791898 ?auto_791903 ) ) ( not ( = ?auto_791898 ?auto_791904 ) ) ( not ( = ?auto_791898 ?auto_791905 ) ) ( not ( = ?auto_791898 ?auto_791906 ) ) ( not ( = ?auto_791898 ?auto_791907 ) ) ( not ( = ?auto_791898 ?auto_791908 ) ) ( not ( = ?auto_791898 ?auto_791909 ) ) ( not ( = ?auto_791898 ?auto_791910 ) ) ( not ( = ?auto_791898 ?auto_791911 ) ) ( not ( = ?auto_791898 ?auto_791912 ) ) ( not ( = ?auto_791898 ?auto_791913 ) ) ( not ( = ?auto_791899 ?auto_791900 ) ) ( not ( = ?auto_791899 ?auto_791901 ) ) ( not ( = ?auto_791899 ?auto_791902 ) ) ( not ( = ?auto_791899 ?auto_791903 ) ) ( not ( = ?auto_791899 ?auto_791904 ) ) ( not ( = ?auto_791899 ?auto_791905 ) ) ( not ( = ?auto_791899 ?auto_791906 ) ) ( not ( = ?auto_791899 ?auto_791907 ) ) ( not ( = ?auto_791899 ?auto_791908 ) ) ( not ( = ?auto_791899 ?auto_791909 ) ) ( not ( = ?auto_791899 ?auto_791910 ) ) ( not ( = ?auto_791899 ?auto_791911 ) ) ( not ( = ?auto_791899 ?auto_791912 ) ) ( not ( = ?auto_791899 ?auto_791913 ) ) ( not ( = ?auto_791900 ?auto_791901 ) ) ( not ( = ?auto_791900 ?auto_791902 ) ) ( not ( = ?auto_791900 ?auto_791903 ) ) ( not ( = ?auto_791900 ?auto_791904 ) ) ( not ( = ?auto_791900 ?auto_791905 ) ) ( not ( = ?auto_791900 ?auto_791906 ) ) ( not ( = ?auto_791900 ?auto_791907 ) ) ( not ( = ?auto_791900 ?auto_791908 ) ) ( not ( = ?auto_791900 ?auto_791909 ) ) ( not ( = ?auto_791900 ?auto_791910 ) ) ( not ( = ?auto_791900 ?auto_791911 ) ) ( not ( = ?auto_791900 ?auto_791912 ) ) ( not ( = ?auto_791900 ?auto_791913 ) ) ( not ( = ?auto_791901 ?auto_791902 ) ) ( not ( = ?auto_791901 ?auto_791903 ) ) ( not ( = ?auto_791901 ?auto_791904 ) ) ( not ( = ?auto_791901 ?auto_791905 ) ) ( not ( = ?auto_791901 ?auto_791906 ) ) ( not ( = ?auto_791901 ?auto_791907 ) ) ( not ( = ?auto_791901 ?auto_791908 ) ) ( not ( = ?auto_791901 ?auto_791909 ) ) ( not ( = ?auto_791901 ?auto_791910 ) ) ( not ( = ?auto_791901 ?auto_791911 ) ) ( not ( = ?auto_791901 ?auto_791912 ) ) ( not ( = ?auto_791901 ?auto_791913 ) ) ( not ( = ?auto_791902 ?auto_791903 ) ) ( not ( = ?auto_791902 ?auto_791904 ) ) ( not ( = ?auto_791902 ?auto_791905 ) ) ( not ( = ?auto_791902 ?auto_791906 ) ) ( not ( = ?auto_791902 ?auto_791907 ) ) ( not ( = ?auto_791902 ?auto_791908 ) ) ( not ( = ?auto_791902 ?auto_791909 ) ) ( not ( = ?auto_791902 ?auto_791910 ) ) ( not ( = ?auto_791902 ?auto_791911 ) ) ( not ( = ?auto_791902 ?auto_791912 ) ) ( not ( = ?auto_791902 ?auto_791913 ) ) ( not ( = ?auto_791903 ?auto_791904 ) ) ( not ( = ?auto_791903 ?auto_791905 ) ) ( not ( = ?auto_791903 ?auto_791906 ) ) ( not ( = ?auto_791903 ?auto_791907 ) ) ( not ( = ?auto_791903 ?auto_791908 ) ) ( not ( = ?auto_791903 ?auto_791909 ) ) ( not ( = ?auto_791903 ?auto_791910 ) ) ( not ( = ?auto_791903 ?auto_791911 ) ) ( not ( = ?auto_791903 ?auto_791912 ) ) ( not ( = ?auto_791903 ?auto_791913 ) ) ( not ( = ?auto_791904 ?auto_791905 ) ) ( not ( = ?auto_791904 ?auto_791906 ) ) ( not ( = ?auto_791904 ?auto_791907 ) ) ( not ( = ?auto_791904 ?auto_791908 ) ) ( not ( = ?auto_791904 ?auto_791909 ) ) ( not ( = ?auto_791904 ?auto_791910 ) ) ( not ( = ?auto_791904 ?auto_791911 ) ) ( not ( = ?auto_791904 ?auto_791912 ) ) ( not ( = ?auto_791904 ?auto_791913 ) ) ( not ( = ?auto_791905 ?auto_791906 ) ) ( not ( = ?auto_791905 ?auto_791907 ) ) ( not ( = ?auto_791905 ?auto_791908 ) ) ( not ( = ?auto_791905 ?auto_791909 ) ) ( not ( = ?auto_791905 ?auto_791910 ) ) ( not ( = ?auto_791905 ?auto_791911 ) ) ( not ( = ?auto_791905 ?auto_791912 ) ) ( not ( = ?auto_791905 ?auto_791913 ) ) ( not ( = ?auto_791906 ?auto_791907 ) ) ( not ( = ?auto_791906 ?auto_791908 ) ) ( not ( = ?auto_791906 ?auto_791909 ) ) ( not ( = ?auto_791906 ?auto_791910 ) ) ( not ( = ?auto_791906 ?auto_791911 ) ) ( not ( = ?auto_791906 ?auto_791912 ) ) ( not ( = ?auto_791906 ?auto_791913 ) ) ( not ( = ?auto_791907 ?auto_791908 ) ) ( not ( = ?auto_791907 ?auto_791909 ) ) ( not ( = ?auto_791907 ?auto_791910 ) ) ( not ( = ?auto_791907 ?auto_791911 ) ) ( not ( = ?auto_791907 ?auto_791912 ) ) ( not ( = ?auto_791907 ?auto_791913 ) ) ( not ( = ?auto_791908 ?auto_791909 ) ) ( not ( = ?auto_791908 ?auto_791910 ) ) ( not ( = ?auto_791908 ?auto_791911 ) ) ( not ( = ?auto_791908 ?auto_791912 ) ) ( not ( = ?auto_791908 ?auto_791913 ) ) ( not ( = ?auto_791909 ?auto_791910 ) ) ( not ( = ?auto_791909 ?auto_791911 ) ) ( not ( = ?auto_791909 ?auto_791912 ) ) ( not ( = ?auto_791909 ?auto_791913 ) ) ( not ( = ?auto_791910 ?auto_791911 ) ) ( not ( = ?auto_791910 ?auto_791912 ) ) ( not ( = ?auto_791910 ?auto_791913 ) ) ( not ( = ?auto_791911 ?auto_791912 ) ) ( not ( = ?auto_791911 ?auto_791913 ) ) ( not ( = ?auto_791912 ?auto_791913 ) ) ( ON ?auto_791912 ?auto_791913 ) ( ON ?auto_791911 ?auto_791912 ) ( ON ?auto_791910 ?auto_791911 ) ( ON ?auto_791909 ?auto_791910 ) ( ON ?auto_791908 ?auto_791909 ) ( ON ?auto_791907 ?auto_791908 ) ( ON ?auto_791906 ?auto_791907 ) ( ON ?auto_791905 ?auto_791906 ) ( ON ?auto_791904 ?auto_791905 ) ( CLEAR ?auto_791902 ) ( ON ?auto_791903 ?auto_791904 ) ( CLEAR ?auto_791903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_791896 ?auto_791897 ?auto_791898 ?auto_791899 ?auto_791900 ?auto_791901 ?auto_791902 ?auto_791903 )
      ( MAKE-18PILE ?auto_791896 ?auto_791897 ?auto_791898 ?auto_791899 ?auto_791900 ?auto_791901 ?auto_791902 ?auto_791903 ?auto_791904 ?auto_791905 ?auto_791906 ?auto_791907 ?auto_791908 ?auto_791909 ?auto_791910 ?auto_791911 ?auto_791912 ?auto_791913 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791932 - BLOCK
      ?auto_791933 - BLOCK
      ?auto_791934 - BLOCK
      ?auto_791935 - BLOCK
      ?auto_791936 - BLOCK
      ?auto_791937 - BLOCK
      ?auto_791938 - BLOCK
      ?auto_791939 - BLOCK
      ?auto_791940 - BLOCK
      ?auto_791941 - BLOCK
      ?auto_791942 - BLOCK
      ?auto_791943 - BLOCK
      ?auto_791944 - BLOCK
      ?auto_791945 - BLOCK
      ?auto_791946 - BLOCK
      ?auto_791947 - BLOCK
      ?auto_791948 - BLOCK
      ?auto_791949 - BLOCK
    )
    :vars
    (
      ?auto_791950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_791949 ?auto_791950 ) ( ON-TABLE ?auto_791932 ) ( ON ?auto_791933 ?auto_791932 ) ( ON ?auto_791934 ?auto_791933 ) ( ON ?auto_791935 ?auto_791934 ) ( ON ?auto_791936 ?auto_791935 ) ( ON ?auto_791937 ?auto_791936 ) ( not ( = ?auto_791932 ?auto_791933 ) ) ( not ( = ?auto_791932 ?auto_791934 ) ) ( not ( = ?auto_791932 ?auto_791935 ) ) ( not ( = ?auto_791932 ?auto_791936 ) ) ( not ( = ?auto_791932 ?auto_791937 ) ) ( not ( = ?auto_791932 ?auto_791938 ) ) ( not ( = ?auto_791932 ?auto_791939 ) ) ( not ( = ?auto_791932 ?auto_791940 ) ) ( not ( = ?auto_791932 ?auto_791941 ) ) ( not ( = ?auto_791932 ?auto_791942 ) ) ( not ( = ?auto_791932 ?auto_791943 ) ) ( not ( = ?auto_791932 ?auto_791944 ) ) ( not ( = ?auto_791932 ?auto_791945 ) ) ( not ( = ?auto_791932 ?auto_791946 ) ) ( not ( = ?auto_791932 ?auto_791947 ) ) ( not ( = ?auto_791932 ?auto_791948 ) ) ( not ( = ?auto_791932 ?auto_791949 ) ) ( not ( = ?auto_791932 ?auto_791950 ) ) ( not ( = ?auto_791933 ?auto_791934 ) ) ( not ( = ?auto_791933 ?auto_791935 ) ) ( not ( = ?auto_791933 ?auto_791936 ) ) ( not ( = ?auto_791933 ?auto_791937 ) ) ( not ( = ?auto_791933 ?auto_791938 ) ) ( not ( = ?auto_791933 ?auto_791939 ) ) ( not ( = ?auto_791933 ?auto_791940 ) ) ( not ( = ?auto_791933 ?auto_791941 ) ) ( not ( = ?auto_791933 ?auto_791942 ) ) ( not ( = ?auto_791933 ?auto_791943 ) ) ( not ( = ?auto_791933 ?auto_791944 ) ) ( not ( = ?auto_791933 ?auto_791945 ) ) ( not ( = ?auto_791933 ?auto_791946 ) ) ( not ( = ?auto_791933 ?auto_791947 ) ) ( not ( = ?auto_791933 ?auto_791948 ) ) ( not ( = ?auto_791933 ?auto_791949 ) ) ( not ( = ?auto_791933 ?auto_791950 ) ) ( not ( = ?auto_791934 ?auto_791935 ) ) ( not ( = ?auto_791934 ?auto_791936 ) ) ( not ( = ?auto_791934 ?auto_791937 ) ) ( not ( = ?auto_791934 ?auto_791938 ) ) ( not ( = ?auto_791934 ?auto_791939 ) ) ( not ( = ?auto_791934 ?auto_791940 ) ) ( not ( = ?auto_791934 ?auto_791941 ) ) ( not ( = ?auto_791934 ?auto_791942 ) ) ( not ( = ?auto_791934 ?auto_791943 ) ) ( not ( = ?auto_791934 ?auto_791944 ) ) ( not ( = ?auto_791934 ?auto_791945 ) ) ( not ( = ?auto_791934 ?auto_791946 ) ) ( not ( = ?auto_791934 ?auto_791947 ) ) ( not ( = ?auto_791934 ?auto_791948 ) ) ( not ( = ?auto_791934 ?auto_791949 ) ) ( not ( = ?auto_791934 ?auto_791950 ) ) ( not ( = ?auto_791935 ?auto_791936 ) ) ( not ( = ?auto_791935 ?auto_791937 ) ) ( not ( = ?auto_791935 ?auto_791938 ) ) ( not ( = ?auto_791935 ?auto_791939 ) ) ( not ( = ?auto_791935 ?auto_791940 ) ) ( not ( = ?auto_791935 ?auto_791941 ) ) ( not ( = ?auto_791935 ?auto_791942 ) ) ( not ( = ?auto_791935 ?auto_791943 ) ) ( not ( = ?auto_791935 ?auto_791944 ) ) ( not ( = ?auto_791935 ?auto_791945 ) ) ( not ( = ?auto_791935 ?auto_791946 ) ) ( not ( = ?auto_791935 ?auto_791947 ) ) ( not ( = ?auto_791935 ?auto_791948 ) ) ( not ( = ?auto_791935 ?auto_791949 ) ) ( not ( = ?auto_791935 ?auto_791950 ) ) ( not ( = ?auto_791936 ?auto_791937 ) ) ( not ( = ?auto_791936 ?auto_791938 ) ) ( not ( = ?auto_791936 ?auto_791939 ) ) ( not ( = ?auto_791936 ?auto_791940 ) ) ( not ( = ?auto_791936 ?auto_791941 ) ) ( not ( = ?auto_791936 ?auto_791942 ) ) ( not ( = ?auto_791936 ?auto_791943 ) ) ( not ( = ?auto_791936 ?auto_791944 ) ) ( not ( = ?auto_791936 ?auto_791945 ) ) ( not ( = ?auto_791936 ?auto_791946 ) ) ( not ( = ?auto_791936 ?auto_791947 ) ) ( not ( = ?auto_791936 ?auto_791948 ) ) ( not ( = ?auto_791936 ?auto_791949 ) ) ( not ( = ?auto_791936 ?auto_791950 ) ) ( not ( = ?auto_791937 ?auto_791938 ) ) ( not ( = ?auto_791937 ?auto_791939 ) ) ( not ( = ?auto_791937 ?auto_791940 ) ) ( not ( = ?auto_791937 ?auto_791941 ) ) ( not ( = ?auto_791937 ?auto_791942 ) ) ( not ( = ?auto_791937 ?auto_791943 ) ) ( not ( = ?auto_791937 ?auto_791944 ) ) ( not ( = ?auto_791937 ?auto_791945 ) ) ( not ( = ?auto_791937 ?auto_791946 ) ) ( not ( = ?auto_791937 ?auto_791947 ) ) ( not ( = ?auto_791937 ?auto_791948 ) ) ( not ( = ?auto_791937 ?auto_791949 ) ) ( not ( = ?auto_791937 ?auto_791950 ) ) ( not ( = ?auto_791938 ?auto_791939 ) ) ( not ( = ?auto_791938 ?auto_791940 ) ) ( not ( = ?auto_791938 ?auto_791941 ) ) ( not ( = ?auto_791938 ?auto_791942 ) ) ( not ( = ?auto_791938 ?auto_791943 ) ) ( not ( = ?auto_791938 ?auto_791944 ) ) ( not ( = ?auto_791938 ?auto_791945 ) ) ( not ( = ?auto_791938 ?auto_791946 ) ) ( not ( = ?auto_791938 ?auto_791947 ) ) ( not ( = ?auto_791938 ?auto_791948 ) ) ( not ( = ?auto_791938 ?auto_791949 ) ) ( not ( = ?auto_791938 ?auto_791950 ) ) ( not ( = ?auto_791939 ?auto_791940 ) ) ( not ( = ?auto_791939 ?auto_791941 ) ) ( not ( = ?auto_791939 ?auto_791942 ) ) ( not ( = ?auto_791939 ?auto_791943 ) ) ( not ( = ?auto_791939 ?auto_791944 ) ) ( not ( = ?auto_791939 ?auto_791945 ) ) ( not ( = ?auto_791939 ?auto_791946 ) ) ( not ( = ?auto_791939 ?auto_791947 ) ) ( not ( = ?auto_791939 ?auto_791948 ) ) ( not ( = ?auto_791939 ?auto_791949 ) ) ( not ( = ?auto_791939 ?auto_791950 ) ) ( not ( = ?auto_791940 ?auto_791941 ) ) ( not ( = ?auto_791940 ?auto_791942 ) ) ( not ( = ?auto_791940 ?auto_791943 ) ) ( not ( = ?auto_791940 ?auto_791944 ) ) ( not ( = ?auto_791940 ?auto_791945 ) ) ( not ( = ?auto_791940 ?auto_791946 ) ) ( not ( = ?auto_791940 ?auto_791947 ) ) ( not ( = ?auto_791940 ?auto_791948 ) ) ( not ( = ?auto_791940 ?auto_791949 ) ) ( not ( = ?auto_791940 ?auto_791950 ) ) ( not ( = ?auto_791941 ?auto_791942 ) ) ( not ( = ?auto_791941 ?auto_791943 ) ) ( not ( = ?auto_791941 ?auto_791944 ) ) ( not ( = ?auto_791941 ?auto_791945 ) ) ( not ( = ?auto_791941 ?auto_791946 ) ) ( not ( = ?auto_791941 ?auto_791947 ) ) ( not ( = ?auto_791941 ?auto_791948 ) ) ( not ( = ?auto_791941 ?auto_791949 ) ) ( not ( = ?auto_791941 ?auto_791950 ) ) ( not ( = ?auto_791942 ?auto_791943 ) ) ( not ( = ?auto_791942 ?auto_791944 ) ) ( not ( = ?auto_791942 ?auto_791945 ) ) ( not ( = ?auto_791942 ?auto_791946 ) ) ( not ( = ?auto_791942 ?auto_791947 ) ) ( not ( = ?auto_791942 ?auto_791948 ) ) ( not ( = ?auto_791942 ?auto_791949 ) ) ( not ( = ?auto_791942 ?auto_791950 ) ) ( not ( = ?auto_791943 ?auto_791944 ) ) ( not ( = ?auto_791943 ?auto_791945 ) ) ( not ( = ?auto_791943 ?auto_791946 ) ) ( not ( = ?auto_791943 ?auto_791947 ) ) ( not ( = ?auto_791943 ?auto_791948 ) ) ( not ( = ?auto_791943 ?auto_791949 ) ) ( not ( = ?auto_791943 ?auto_791950 ) ) ( not ( = ?auto_791944 ?auto_791945 ) ) ( not ( = ?auto_791944 ?auto_791946 ) ) ( not ( = ?auto_791944 ?auto_791947 ) ) ( not ( = ?auto_791944 ?auto_791948 ) ) ( not ( = ?auto_791944 ?auto_791949 ) ) ( not ( = ?auto_791944 ?auto_791950 ) ) ( not ( = ?auto_791945 ?auto_791946 ) ) ( not ( = ?auto_791945 ?auto_791947 ) ) ( not ( = ?auto_791945 ?auto_791948 ) ) ( not ( = ?auto_791945 ?auto_791949 ) ) ( not ( = ?auto_791945 ?auto_791950 ) ) ( not ( = ?auto_791946 ?auto_791947 ) ) ( not ( = ?auto_791946 ?auto_791948 ) ) ( not ( = ?auto_791946 ?auto_791949 ) ) ( not ( = ?auto_791946 ?auto_791950 ) ) ( not ( = ?auto_791947 ?auto_791948 ) ) ( not ( = ?auto_791947 ?auto_791949 ) ) ( not ( = ?auto_791947 ?auto_791950 ) ) ( not ( = ?auto_791948 ?auto_791949 ) ) ( not ( = ?auto_791948 ?auto_791950 ) ) ( not ( = ?auto_791949 ?auto_791950 ) ) ( ON ?auto_791948 ?auto_791949 ) ( ON ?auto_791947 ?auto_791948 ) ( ON ?auto_791946 ?auto_791947 ) ( ON ?auto_791945 ?auto_791946 ) ( ON ?auto_791944 ?auto_791945 ) ( ON ?auto_791943 ?auto_791944 ) ( ON ?auto_791942 ?auto_791943 ) ( ON ?auto_791941 ?auto_791942 ) ( ON ?auto_791940 ?auto_791941 ) ( ON ?auto_791939 ?auto_791940 ) ( CLEAR ?auto_791937 ) ( ON ?auto_791938 ?auto_791939 ) ( CLEAR ?auto_791938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_791932 ?auto_791933 ?auto_791934 ?auto_791935 ?auto_791936 ?auto_791937 ?auto_791938 )
      ( MAKE-18PILE ?auto_791932 ?auto_791933 ?auto_791934 ?auto_791935 ?auto_791936 ?auto_791937 ?auto_791938 ?auto_791939 ?auto_791940 ?auto_791941 ?auto_791942 ?auto_791943 ?auto_791944 ?auto_791945 ?auto_791946 ?auto_791947 ?auto_791948 ?auto_791949 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_791969 - BLOCK
      ?auto_791970 - BLOCK
      ?auto_791971 - BLOCK
      ?auto_791972 - BLOCK
      ?auto_791973 - BLOCK
      ?auto_791974 - BLOCK
      ?auto_791975 - BLOCK
      ?auto_791976 - BLOCK
      ?auto_791977 - BLOCK
      ?auto_791978 - BLOCK
      ?auto_791979 - BLOCK
      ?auto_791980 - BLOCK
      ?auto_791981 - BLOCK
      ?auto_791982 - BLOCK
      ?auto_791983 - BLOCK
      ?auto_791984 - BLOCK
      ?auto_791985 - BLOCK
      ?auto_791986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_791986 ) ( ON-TABLE ?auto_791969 ) ( ON ?auto_791970 ?auto_791969 ) ( ON ?auto_791971 ?auto_791970 ) ( ON ?auto_791972 ?auto_791971 ) ( ON ?auto_791973 ?auto_791972 ) ( ON ?auto_791974 ?auto_791973 ) ( not ( = ?auto_791969 ?auto_791970 ) ) ( not ( = ?auto_791969 ?auto_791971 ) ) ( not ( = ?auto_791969 ?auto_791972 ) ) ( not ( = ?auto_791969 ?auto_791973 ) ) ( not ( = ?auto_791969 ?auto_791974 ) ) ( not ( = ?auto_791969 ?auto_791975 ) ) ( not ( = ?auto_791969 ?auto_791976 ) ) ( not ( = ?auto_791969 ?auto_791977 ) ) ( not ( = ?auto_791969 ?auto_791978 ) ) ( not ( = ?auto_791969 ?auto_791979 ) ) ( not ( = ?auto_791969 ?auto_791980 ) ) ( not ( = ?auto_791969 ?auto_791981 ) ) ( not ( = ?auto_791969 ?auto_791982 ) ) ( not ( = ?auto_791969 ?auto_791983 ) ) ( not ( = ?auto_791969 ?auto_791984 ) ) ( not ( = ?auto_791969 ?auto_791985 ) ) ( not ( = ?auto_791969 ?auto_791986 ) ) ( not ( = ?auto_791970 ?auto_791971 ) ) ( not ( = ?auto_791970 ?auto_791972 ) ) ( not ( = ?auto_791970 ?auto_791973 ) ) ( not ( = ?auto_791970 ?auto_791974 ) ) ( not ( = ?auto_791970 ?auto_791975 ) ) ( not ( = ?auto_791970 ?auto_791976 ) ) ( not ( = ?auto_791970 ?auto_791977 ) ) ( not ( = ?auto_791970 ?auto_791978 ) ) ( not ( = ?auto_791970 ?auto_791979 ) ) ( not ( = ?auto_791970 ?auto_791980 ) ) ( not ( = ?auto_791970 ?auto_791981 ) ) ( not ( = ?auto_791970 ?auto_791982 ) ) ( not ( = ?auto_791970 ?auto_791983 ) ) ( not ( = ?auto_791970 ?auto_791984 ) ) ( not ( = ?auto_791970 ?auto_791985 ) ) ( not ( = ?auto_791970 ?auto_791986 ) ) ( not ( = ?auto_791971 ?auto_791972 ) ) ( not ( = ?auto_791971 ?auto_791973 ) ) ( not ( = ?auto_791971 ?auto_791974 ) ) ( not ( = ?auto_791971 ?auto_791975 ) ) ( not ( = ?auto_791971 ?auto_791976 ) ) ( not ( = ?auto_791971 ?auto_791977 ) ) ( not ( = ?auto_791971 ?auto_791978 ) ) ( not ( = ?auto_791971 ?auto_791979 ) ) ( not ( = ?auto_791971 ?auto_791980 ) ) ( not ( = ?auto_791971 ?auto_791981 ) ) ( not ( = ?auto_791971 ?auto_791982 ) ) ( not ( = ?auto_791971 ?auto_791983 ) ) ( not ( = ?auto_791971 ?auto_791984 ) ) ( not ( = ?auto_791971 ?auto_791985 ) ) ( not ( = ?auto_791971 ?auto_791986 ) ) ( not ( = ?auto_791972 ?auto_791973 ) ) ( not ( = ?auto_791972 ?auto_791974 ) ) ( not ( = ?auto_791972 ?auto_791975 ) ) ( not ( = ?auto_791972 ?auto_791976 ) ) ( not ( = ?auto_791972 ?auto_791977 ) ) ( not ( = ?auto_791972 ?auto_791978 ) ) ( not ( = ?auto_791972 ?auto_791979 ) ) ( not ( = ?auto_791972 ?auto_791980 ) ) ( not ( = ?auto_791972 ?auto_791981 ) ) ( not ( = ?auto_791972 ?auto_791982 ) ) ( not ( = ?auto_791972 ?auto_791983 ) ) ( not ( = ?auto_791972 ?auto_791984 ) ) ( not ( = ?auto_791972 ?auto_791985 ) ) ( not ( = ?auto_791972 ?auto_791986 ) ) ( not ( = ?auto_791973 ?auto_791974 ) ) ( not ( = ?auto_791973 ?auto_791975 ) ) ( not ( = ?auto_791973 ?auto_791976 ) ) ( not ( = ?auto_791973 ?auto_791977 ) ) ( not ( = ?auto_791973 ?auto_791978 ) ) ( not ( = ?auto_791973 ?auto_791979 ) ) ( not ( = ?auto_791973 ?auto_791980 ) ) ( not ( = ?auto_791973 ?auto_791981 ) ) ( not ( = ?auto_791973 ?auto_791982 ) ) ( not ( = ?auto_791973 ?auto_791983 ) ) ( not ( = ?auto_791973 ?auto_791984 ) ) ( not ( = ?auto_791973 ?auto_791985 ) ) ( not ( = ?auto_791973 ?auto_791986 ) ) ( not ( = ?auto_791974 ?auto_791975 ) ) ( not ( = ?auto_791974 ?auto_791976 ) ) ( not ( = ?auto_791974 ?auto_791977 ) ) ( not ( = ?auto_791974 ?auto_791978 ) ) ( not ( = ?auto_791974 ?auto_791979 ) ) ( not ( = ?auto_791974 ?auto_791980 ) ) ( not ( = ?auto_791974 ?auto_791981 ) ) ( not ( = ?auto_791974 ?auto_791982 ) ) ( not ( = ?auto_791974 ?auto_791983 ) ) ( not ( = ?auto_791974 ?auto_791984 ) ) ( not ( = ?auto_791974 ?auto_791985 ) ) ( not ( = ?auto_791974 ?auto_791986 ) ) ( not ( = ?auto_791975 ?auto_791976 ) ) ( not ( = ?auto_791975 ?auto_791977 ) ) ( not ( = ?auto_791975 ?auto_791978 ) ) ( not ( = ?auto_791975 ?auto_791979 ) ) ( not ( = ?auto_791975 ?auto_791980 ) ) ( not ( = ?auto_791975 ?auto_791981 ) ) ( not ( = ?auto_791975 ?auto_791982 ) ) ( not ( = ?auto_791975 ?auto_791983 ) ) ( not ( = ?auto_791975 ?auto_791984 ) ) ( not ( = ?auto_791975 ?auto_791985 ) ) ( not ( = ?auto_791975 ?auto_791986 ) ) ( not ( = ?auto_791976 ?auto_791977 ) ) ( not ( = ?auto_791976 ?auto_791978 ) ) ( not ( = ?auto_791976 ?auto_791979 ) ) ( not ( = ?auto_791976 ?auto_791980 ) ) ( not ( = ?auto_791976 ?auto_791981 ) ) ( not ( = ?auto_791976 ?auto_791982 ) ) ( not ( = ?auto_791976 ?auto_791983 ) ) ( not ( = ?auto_791976 ?auto_791984 ) ) ( not ( = ?auto_791976 ?auto_791985 ) ) ( not ( = ?auto_791976 ?auto_791986 ) ) ( not ( = ?auto_791977 ?auto_791978 ) ) ( not ( = ?auto_791977 ?auto_791979 ) ) ( not ( = ?auto_791977 ?auto_791980 ) ) ( not ( = ?auto_791977 ?auto_791981 ) ) ( not ( = ?auto_791977 ?auto_791982 ) ) ( not ( = ?auto_791977 ?auto_791983 ) ) ( not ( = ?auto_791977 ?auto_791984 ) ) ( not ( = ?auto_791977 ?auto_791985 ) ) ( not ( = ?auto_791977 ?auto_791986 ) ) ( not ( = ?auto_791978 ?auto_791979 ) ) ( not ( = ?auto_791978 ?auto_791980 ) ) ( not ( = ?auto_791978 ?auto_791981 ) ) ( not ( = ?auto_791978 ?auto_791982 ) ) ( not ( = ?auto_791978 ?auto_791983 ) ) ( not ( = ?auto_791978 ?auto_791984 ) ) ( not ( = ?auto_791978 ?auto_791985 ) ) ( not ( = ?auto_791978 ?auto_791986 ) ) ( not ( = ?auto_791979 ?auto_791980 ) ) ( not ( = ?auto_791979 ?auto_791981 ) ) ( not ( = ?auto_791979 ?auto_791982 ) ) ( not ( = ?auto_791979 ?auto_791983 ) ) ( not ( = ?auto_791979 ?auto_791984 ) ) ( not ( = ?auto_791979 ?auto_791985 ) ) ( not ( = ?auto_791979 ?auto_791986 ) ) ( not ( = ?auto_791980 ?auto_791981 ) ) ( not ( = ?auto_791980 ?auto_791982 ) ) ( not ( = ?auto_791980 ?auto_791983 ) ) ( not ( = ?auto_791980 ?auto_791984 ) ) ( not ( = ?auto_791980 ?auto_791985 ) ) ( not ( = ?auto_791980 ?auto_791986 ) ) ( not ( = ?auto_791981 ?auto_791982 ) ) ( not ( = ?auto_791981 ?auto_791983 ) ) ( not ( = ?auto_791981 ?auto_791984 ) ) ( not ( = ?auto_791981 ?auto_791985 ) ) ( not ( = ?auto_791981 ?auto_791986 ) ) ( not ( = ?auto_791982 ?auto_791983 ) ) ( not ( = ?auto_791982 ?auto_791984 ) ) ( not ( = ?auto_791982 ?auto_791985 ) ) ( not ( = ?auto_791982 ?auto_791986 ) ) ( not ( = ?auto_791983 ?auto_791984 ) ) ( not ( = ?auto_791983 ?auto_791985 ) ) ( not ( = ?auto_791983 ?auto_791986 ) ) ( not ( = ?auto_791984 ?auto_791985 ) ) ( not ( = ?auto_791984 ?auto_791986 ) ) ( not ( = ?auto_791985 ?auto_791986 ) ) ( ON ?auto_791985 ?auto_791986 ) ( ON ?auto_791984 ?auto_791985 ) ( ON ?auto_791983 ?auto_791984 ) ( ON ?auto_791982 ?auto_791983 ) ( ON ?auto_791981 ?auto_791982 ) ( ON ?auto_791980 ?auto_791981 ) ( ON ?auto_791979 ?auto_791980 ) ( ON ?auto_791978 ?auto_791979 ) ( ON ?auto_791977 ?auto_791978 ) ( ON ?auto_791976 ?auto_791977 ) ( CLEAR ?auto_791974 ) ( ON ?auto_791975 ?auto_791976 ) ( CLEAR ?auto_791975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_791969 ?auto_791970 ?auto_791971 ?auto_791972 ?auto_791973 ?auto_791974 ?auto_791975 )
      ( MAKE-18PILE ?auto_791969 ?auto_791970 ?auto_791971 ?auto_791972 ?auto_791973 ?auto_791974 ?auto_791975 ?auto_791976 ?auto_791977 ?auto_791978 ?auto_791979 ?auto_791980 ?auto_791981 ?auto_791982 ?auto_791983 ?auto_791984 ?auto_791985 ?auto_791986 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792005 - BLOCK
      ?auto_792006 - BLOCK
      ?auto_792007 - BLOCK
      ?auto_792008 - BLOCK
      ?auto_792009 - BLOCK
      ?auto_792010 - BLOCK
      ?auto_792011 - BLOCK
      ?auto_792012 - BLOCK
      ?auto_792013 - BLOCK
      ?auto_792014 - BLOCK
      ?auto_792015 - BLOCK
      ?auto_792016 - BLOCK
      ?auto_792017 - BLOCK
      ?auto_792018 - BLOCK
      ?auto_792019 - BLOCK
      ?auto_792020 - BLOCK
      ?auto_792021 - BLOCK
      ?auto_792022 - BLOCK
    )
    :vars
    (
      ?auto_792023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792022 ?auto_792023 ) ( ON-TABLE ?auto_792005 ) ( ON ?auto_792006 ?auto_792005 ) ( ON ?auto_792007 ?auto_792006 ) ( ON ?auto_792008 ?auto_792007 ) ( ON ?auto_792009 ?auto_792008 ) ( not ( = ?auto_792005 ?auto_792006 ) ) ( not ( = ?auto_792005 ?auto_792007 ) ) ( not ( = ?auto_792005 ?auto_792008 ) ) ( not ( = ?auto_792005 ?auto_792009 ) ) ( not ( = ?auto_792005 ?auto_792010 ) ) ( not ( = ?auto_792005 ?auto_792011 ) ) ( not ( = ?auto_792005 ?auto_792012 ) ) ( not ( = ?auto_792005 ?auto_792013 ) ) ( not ( = ?auto_792005 ?auto_792014 ) ) ( not ( = ?auto_792005 ?auto_792015 ) ) ( not ( = ?auto_792005 ?auto_792016 ) ) ( not ( = ?auto_792005 ?auto_792017 ) ) ( not ( = ?auto_792005 ?auto_792018 ) ) ( not ( = ?auto_792005 ?auto_792019 ) ) ( not ( = ?auto_792005 ?auto_792020 ) ) ( not ( = ?auto_792005 ?auto_792021 ) ) ( not ( = ?auto_792005 ?auto_792022 ) ) ( not ( = ?auto_792005 ?auto_792023 ) ) ( not ( = ?auto_792006 ?auto_792007 ) ) ( not ( = ?auto_792006 ?auto_792008 ) ) ( not ( = ?auto_792006 ?auto_792009 ) ) ( not ( = ?auto_792006 ?auto_792010 ) ) ( not ( = ?auto_792006 ?auto_792011 ) ) ( not ( = ?auto_792006 ?auto_792012 ) ) ( not ( = ?auto_792006 ?auto_792013 ) ) ( not ( = ?auto_792006 ?auto_792014 ) ) ( not ( = ?auto_792006 ?auto_792015 ) ) ( not ( = ?auto_792006 ?auto_792016 ) ) ( not ( = ?auto_792006 ?auto_792017 ) ) ( not ( = ?auto_792006 ?auto_792018 ) ) ( not ( = ?auto_792006 ?auto_792019 ) ) ( not ( = ?auto_792006 ?auto_792020 ) ) ( not ( = ?auto_792006 ?auto_792021 ) ) ( not ( = ?auto_792006 ?auto_792022 ) ) ( not ( = ?auto_792006 ?auto_792023 ) ) ( not ( = ?auto_792007 ?auto_792008 ) ) ( not ( = ?auto_792007 ?auto_792009 ) ) ( not ( = ?auto_792007 ?auto_792010 ) ) ( not ( = ?auto_792007 ?auto_792011 ) ) ( not ( = ?auto_792007 ?auto_792012 ) ) ( not ( = ?auto_792007 ?auto_792013 ) ) ( not ( = ?auto_792007 ?auto_792014 ) ) ( not ( = ?auto_792007 ?auto_792015 ) ) ( not ( = ?auto_792007 ?auto_792016 ) ) ( not ( = ?auto_792007 ?auto_792017 ) ) ( not ( = ?auto_792007 ?auto_792018 ) ) ( not ( = ?auto_792007 ?auto_792019 ) ) ( not ( = ?auto_792007 ?auto_792020 ) ) ( not ( = ?auto_792007 ?auto_792021 ) ) ( not ( = ?auto_792007 ?auto_792022 ) ) ( not ( = ?auto_792007 ?auto_792023 ) ) ( not ( = ?auto_792008 ?auto_792009 ) ) ( not ( = ?auto_792008 ?auto_792010 ) ) ( not ( = ?auto_792008 ?auto_792011 ) ) ( not ( = ?auto_792008 ?auto_792012 ) ) ( not ( = ?auto_792008 ?auto_792013 ) ) ( not ( = ?auto_792008 ?auto_792014 ) ) ( not ( = ?auto_792008 ?auto_792015 ) ) ( not ( = ?auto_792008 ?auto_792016 ) ) ( not ( = ?auto_792008 ?auto_792017 ) ) ( not ( = ?auto_792008 ?auto_792018 ) ) ( not ( = ?auto_792008 ?auto_792019 ) ) ( not ( = ?auto_792008 ?auto_792020 ) ) ( not ( = ?auto_792008 ?auto_792021 ) ) ( not ( = ?auto_792008 ?auto_792022 ) ) ( not ( = ?auto_792008 ?auto_792023 ) ) ( not ( = ?auto_792009 ?auto_792010 ) ) ( not ( = ?auto_792009 ?auto_792011 ) ) ( not ( = ?auto_792009 ?auto_792012 ) ) ( not ( = ?auto_792009 ?auto_792013 ) ) ( not ( = ?auto_792009 ?auto_792014 ) ) ( not ( = ?auto_792009 ?auto_792015 ) ) ( not ( = ?auto_792009 ?auto_792016 ) ) ( not ( = ?auto_792009 ?auto_792017 ) ) ( not ( = ?auto_792009 ?auto_792018 ) ) ( not ( = ?auto_792009 ?auto_792019 ) ) ( not ( = ?auto_792009 ?auto_792020 ) ) ( not ( = ?auto_792009 ?auto_792021 ) ) ( not ( = ?auto_792009 ?auto_792022 ) ) ( not ( = ?auto_792009 ?auto_792023 ) ) ( not ( = ?auto_792010 ?auto_792011 ) ) ( not ( = ?auto_792010 ?auto_792012 ) ) ( not ( = ?auto_792010 ?auto_792013 ) ) ( not ( = ?auto_792010 ?auto_792014 ) ) ( not ( = ?auto_792010 ?auto_792015 ) ) ( not ( = ?auto_792010 ?auto_792016 ) ) ( not ( = ?auto_792010 ?auto_792017 ) ) ( not ( = ?auto_792010 ?auto_792018 ) ) ( not ( = ?auto_792010 ?auto_792019 ) ) ( not ( = ?auto_792010 ?auto_792020 ) ) ( not ( = ?auto_792010 ?auto_792021 ) ) ( not ( = ?auto_792010 ?auto_792022 ) ) ( not ( = ?auto_792010 ?auto_792023 ) ) ( not ( = ?auto_792011 ?auto_792012 ) ) ( not ( = ?auto_792011 ?auto_792013 ) ) ( not ( = ?auto_792011 ?auto_792014 ) ) ( not ( = ?auto_792011 ?auto_792015 ) ) ( not ( = ?auto_792011 ?auto_792016 ) ) ( not ( = ?auto_792011 ?auto_792017 ) ) ( not ( = ?auto_792011 ?auto_792018 ) ) ( not ( = ?auto_792011 ?auto_792019 ) ) ( not ( = ?auto_792011 ?auto_792020 ) ) ( not ( = ?auto_792011 ?auto_792021 ) ) ( not ( = ?auto_792011 ?auto_792022 ) ) ( not ( = ?auto_792011 ?auto_792023 ) ) ( not ( = ?auto_792012 ?auto_792013 ) ) ( not ( = ?auto_792012 ?auto_792014 ) ) ( not ( = ?auto_792012 ?auto_792015 ) ) ( not ( = ?auto_792012 ?auto_792016 ) ) ( not ( = ?auto_792012 ?auto_792017 ) ) ( not ( = ?auto_792012 ?auto_792018 ) ) ( not ( = ?auto_792012 ?auto_792019 ) ) ( not ( = ?auto_792012 ?auto_792020 ) ) ( not ( = ?auto_792012 ?auto_792021 ) ) ( not ( = ?auto_792012 ?auto_792022 ) ) ( not ( = ?auto_792012 ?auto_792023 ) ) ( not ( = ?auto_792013 ?auto_792014 ) ) ( not ( = ?auto_792013 ?auto_792015 ) ) ( not ( = ?auto_792013 ?auto_792016 ) ) ( not ( = ?auto_792013 ?auto_792017 ) ) ( not ( = ?auto_792013 ?auto_792018 ) ) ( not ( = ?auto_792013 ?auto_792019 ) ) ( not ( = ?auto_792013 ?auto_792020 ) ) ( not ( = ?auto_792013 ?auto_792021 ) ) ( not ( = ?auto_792013 ?auto_792022 ) ) ( not ( = ?auto_792013 ?auto_792023 ) ) ( not ( = ?auto_792014 ?auto_792015 ) ) ( not ( = ?auto_792014 ?auto_792016 ) ) ( not ( = ?auto_792014 ?auto_792017 ) ) ( not ( = ?auto_792014 ?auto_792018 ) ) ( not ( = ?auto_792014 ?auto_792019 ) ) ( not ( = ?auto_792014 ?auto_792020 ) ) ( not ( = ?auto_792014 ?auto_792021 ) ) ( not ( = ?auto_792014 ?auto_792022 ) ) ( not ( = ?auto_792014 ?auto_792023 ) ) ( not ( = ?auto_792015 ?auto_792016 ) ) ( not ( = ?auto_792015 ?auto_792017 ) ) ( not ( = ?auto_792015 ?auto_792018 ) ) ( not ( = ?auto_792015 ?auto_792019 ) ) ( not ( = ?auto_792015 ?auto_792020 ) ) ( not ( = ?auto_792015 ?auto_792021 ) ) ( not ( = ?auto_792015 ?auto_792022 ) ) ( not ( = ?auto_792015 ?auto_792023 ) ) ( not ( = ?auto_792016 ?auto_792017 ) ) ( not ( = ?auto_792016 ?auto_792018 ) ) ( not ( = ?auto_792016 ?auto_792019 ) ) ( not ( = ?auto_792016 ?auto_792020 ) ) ( not ( = ?auto_792016 ?auto_792021 ) ) ( not ( = ?auto_792016 ?auto_792022 ) ) ( not ( = ?auto_792016 ?auto_792023 ) ) ( not ( = ?auto_792017 ?auto_792018 ) ) ( not ( = ?auto_792017 ?auto_792019 ) ) ( not ( = ?auto_792017 ?auto_792020 ) ) ( not ( = ?auto_792017 ?auto_792021 ) ) ( not ( = ?auto_792017 ?auto_792022 ) ) ( not ( = ?auto_792017 ?auto_792023 ) ) ( not ( = ?auto_792018 ?auto_792019 ) ) ( not ( = ?auto_792018 ?auto_792020 ) ) ( not ( = ?auto_792018 ?auto_792021 ) ) ( not ( = ?auto_792018 ?auto_792022 ) ) ( not ( = ?auto_792018 ?auto_792023 ) ) ( not ( = ?auto_792019 ?auto_792020 ) ) ( not ( = ?auto_792019 ?auto_792021 ) ) ( not ( = ?auto_792019 ?auto_792022 ) ) ( not ( = ?auto_792019 ?auto_792023 ) ) ( not ( = ?auto_792020 ?auto_792021 ) ) ( not ( = ?auto_792020 ?auto_792022 ) ) ( not ( = ?auto_792020 ?auto_792023 ) ) ( not ( = ?auto_792021 ?auto_792022 ) ) ( not ( = ?auto_792021 ?auto_792023 ) ) ( not ( = ?auto_792022 ?auto_792023 ) ) ( ON ?auto_792021 ?auto_792022 ) ( ON ?auto_792020 ?auto_792021 ) ( ON ?auto_792019 ?auto_792020 ) ( ON ?auto_792018 ?auto_792019 ) ( ON ?auto_792017 ?auto_792018 ) ( ON ?auto_792016 ?auto_792017 ) ( ON ?auto_792015 ?auto_792016 ) ( ON ?auto_792014 ?auto_792015 ) ( ON ?auto_792013 ?auto_792014 ) ( ON ?auto_792012 ?auto_792013 ) ( ON ?auto_792011 ?auto_792012 ) ( CLEAR ?auto_792009 ) ( ON ?auto_792010 ?auto_792011 ) ( CLEAR ?auto_792010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_792005 ?auto_792006 ?auto_792007 ?auto_792008 ?auto_792009 ?auto_792010 )
      ( MAKE-18PILE ?auto_792005 ?auto_792006 ?auto_792007 ?auto_792008 ?auto_792009 ?auto_792010 ?auto_792011 ?auto_792012 ?auto_792013 ?auto_792014 ?auto_792015 ?auto_792016 ?auto_792017 ?auto_792018 ?auto_792019 ?auto_792020 ?auto_792021 ?auto_792022 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792042 - BLOCK
      ?auto_792043 - BLOCK
      ?auto_792044 - BLOCK
      ?auto_792045 - BLOCK
      ?auto_792046 - BLOCK
      ?auto_792047 - BLOCK
      ?auto_792048 - BLOCK
      ?auto_792049 - BLOCK
      ?auto_792050 - BLOCK
      ?auto_792051 - BLOCK
      ?auto_792052 - BLOCK
      ?auto_792053 - BLOCK
      ?auto_792054 - BLOCK
      ?auto_792055 - BLOCK
      ?auto_792056 - BLOCK
      ?auto_792057 - BLOCK
      ?auto_792058 - BLOCK
      ?auto_792059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_792059 ) ( ON-TABLE ?auto_792042 ) ( ON ?auto_792043 ?auto_792042 ) ( ON ?auto_792044 ?auto_792043 ) ( ON ?auto_792045 ?auto_792044 ) ( ON ?auto_792046 ?auto_792045 ) ( not ( = ?auto_792042 ?auto_792043 ) ) ( not ( = ?auto_792042 ?auto_792044 ) ) ( not ( = ?auto_792042 ?auto_792045 ) ) ( not ( = ?auto_792042 ?auto_792046 ) ) ( not ( = ?auto_792042 ?auto_792047 ) ) ( not ( = ?auto_792042 ?auto_792048 ) ) ( not ( = ?auto_792042 ?auto_792049 ) ) ( not ( = ?auto_792042 ?auto_792050 ) ) ( not ( = ?auto_792042 ?auto_792051 ) ) ( not ( = ?auto_792042 ?auto_792052 ) ) ( not ( = ?auto_792042 ?auto_792053 ) ) ( not ( = ?auto_792042 ?auto_792054 ) ) ( not ( = ?auto_792042 ?auto_792055 ) ) ( not ( = ?auto_792042 ?auto_792056 ) ) ( not ( = ?auto_792042 ?auto_792057 ) ) ( not ( = ?auto_792042 ?auto_792058 ) ) ( not ( = ?auto_792042 ?auto_792059 ) ) ( not ( = ?auto_792043 ?auto_792044 ) ) ( not ( = ?auto_792043 ?auto_792045 ) ) ( not ( = ?auto_792043 ?auto_792046 ) ) ( not ( = ?auto_792043 ?auto_792047 ) ) ( not ( = ?auto_792043 ?auto_792048 ) ) ( not ( = ?auto_792043 ?auto_792049 ) ) ( not ( = ?auto_792043 ?auto_792050 ) ) ( not ( = ?auto_792043 ?auto_792051 ) ) ( not ( = ?auto_792043 ?auto_792052 ) ) ( not ( = ?auto_792043 ?auto_792053 ) ) ( not ( = ?auto_792043 ?auto_792054 ) ) ( not ( = ?auto_792043 ?auto_792055 ) ) ( not ( = ?auto_792043 ?auto_792056 ) ) ( not ( = ?auto_792043 ?auto_792057 ) ) ( not ( = ?auto_792043 ?auto_792058 ) ) ( not ( = ?auto_792043 ?auto_792059 ) ) ( not ( = ?auto_792044 ?auto_792045 ) ) ( not ( = ?auto_792044 ?auto_792046 ) ) ( not ( = ?auto_792044 ?auto_792047 ) ) ( not ( = ?auto_792044 ?auto_792048 ) ) ( not ( = ?auto_792044 ?auto_792049 ) ) ( not ( = ?auto_792044 ?auto_792050 ) ) ( not ( = ?auto_792044 ?auto_792051 ) ) ( not ( = ?auto_792044 ?auto_792052 ) ) ( not ( = ?auto_792044 ?auto_792053 ) ) ( not ( = ?auto_792044 ?auto_792054 ) ) ( not ( = ?auto_792044 ?auto_792055 ) ) ( not ( = ?auto_792044 ?auto_792056 ) ) ( not ( = ?auto_792044 ?auto_792057 ) ) ( not ( = ?auto_792044 ?auto_792058 ) ) ( not ( = ?auto_792044 ?auto_792059 ) ) ( not ( = ?auto_792045 ?auto_792046 ) ) ( not ( = ?auto_792045 ?auto_792047 ) ) ( not ( = ?auto_792045 ?auto_792048 ) ) ( not ( = ?auto_792045 ?auto_792049 ) ) ( not ( = ?auto_792045 ?auto_792050 ) ) ( not ( = ?auto_792045 ?auto_792051 ) ) ( not ( = ?auto_792045 ?auto_792052 ) ) ( not ( = ?auto_792045 ?auto_792053 ) ) ( not ( = ?auto_792045 ?auto_792054 ) ) ( not ( = ?auto_792045 ?auto_792055 ) ) ( not ( = ?auto_792045 ?auto_792056 ) ) ( not ( = ?auto_792045 ?auto_792057 ) ) ( not ( = ?auto_792045 ?auto_792058 ) ) ( not ( = ?auto_792045 ?auto_792059 ) ) ( not ( = ?auto_792046 ?auto_792047 ) ) ( not ( = ?auto_792046 ?auto_792048 ) ) ( not ( = ?auto_792046 ?auto_792049 ) ) ( not ( = ?auto_792046 ?auto_792050 ) ) ( not ( = ?auto_792046 ?auto_792051 ) ) ( not ( = ?auto_792046 ?auto_792052 ) ) ( not ( = ?auto_792046 ?auto_792053 ) ) ( not ( = ?auto_792046 ?auto_792054 ) ) ( not ( = ?auto_792046 ?auto_792055 ) ) ( not ( = ?auto_792046 ?auto_792056 ) ) ( not ( = ?auto_792046 ?auto_792057 ) ) ( not ( = ?auto_792046 ?auto_792058 ) ) ( not ( = ?auto_792046 ?auto_792059 ) ) ( not ( = ?auto_792047 ?auto_792048 ) ) ( not ( = ?auto_792047 ?auto_792049 ) ) ( not ( = ?auto_792047 ?auto_792050 ) ) ( not ( = ?auto_792047 ?auto_792051 ) ) ( not ( = ?auto_792047 ?auto_792052 ) ) ( not ( = ?auto_792047 ?auto_792053 ) ) ( not ( = ?auto_792047 ?auto_792054 ) ) ( not ( = ?auto_792047 ?auto_792055 ) ) ( not ( = ?auto_792047 ?auto_792056 ) ) ( not ( = ?auto_792047 ?auto_792057 ) ) ( not ( = ?auto_792047 ?auto_792058 ) ) ( not ( = ?auto_792047 ?auto_792059 ) ) ( not ( = ?auto_792048 ?auto_792049 ) ) ( not ( = ?auto_792048 ?auto_792050 ) ) ( not ( = ?auto_792048 ?auto_792051 ) ) ( not ( = ?auto_792048 ?auto_792052 ) ) ( not ( = ?auto_792048 ?auto_792053 ) ) ( not ( = ?auto_792048 ?auto_792054 ) ) ( not ( = ?auto_792048 ?auto_792055 ) ) ( not ( = ?auto_792048 ?auto_792056 ) ) ( not ( = ?auto_792048 ?auto_792057 ) ) ( not ( = ?auto_792048 ?auto_792058 ) ) ( not ( = ?auto_792048 ?auto_792059 ) ) ( not ( = ?auto_792049 ?auto_792050 ) ) ( not ( = ?auto_792049 ?auto_792051 ) ) ( not ( = ?auto_792049 ?auto_792052 ) ) ( not ( = ?auto_792049 ?auto_792053 ) ) ( not ( = ?auto_792049 ?auto_792054 ) ) ( not ( = ?auto_792049 ?auto_792055 ) ) ( not ( = ?auto_792049 ?auto_792056 ) ) ( not ( = ?auto_792049 ?auto_792057 ) ) ( not ( = ?auto_792049 ?auto_792058 ) ) ( not ( = ?auto_792049 ?auto_792059 ) ) ( not ( = ?auto_792050 ?auto_792051 ) ) ( not ( = ?auto_792050 ?auto_792052 ) ) ( not ( = ?auto_792050 ?auto_792053 ) ) ( not ( = ?auto_792050 ?auto_792054 ) ) ( not ( = ?auto_792050 ?auto_792055 ) ) ( not ( = ?auto_792050 ?auto_792056 ) ) ( not ( = ?auto_792050 ?auto_792057 ) ) ( not ( = ?auto_792050 ?auto_792058 ) ) ( not ( = ?auto_792050 ?auto_792059 ) ) ( not ( = ?auto_792051 ?auto_792052 ) ) ( not ( = ?auto_792051 ?auto_792053 ) ) ( not ( = ?auto_792051 ?auto_792054 ) ) ( not ( = ?auto_792051 ?auto_792055 ) ) ( not ( = ?auto_792051 ?auto_792056 ) ) ( not ( = ?auto_792051 ?auto_792057 ) ) ( not ( = ?auto_792051 ?auto_792058 ) ) ( not ( = ?auto_792051 ?auto_792059 ) ) ( not ( = ?auto_792052 ?auto_792053 ) ) ( not ( = ?auto_792052 ?auto_792054 ) ) ( not ( = ?auto_792052 ?auto_792055 ) ) ( not ( = ?auto_792052 ?auto_792056 ) ) ( not ( = ?auto_792052 ?auto_792057 ) ) ( not ( = ?auto_792052 ?auto_792058 ) ) ( not ( = ?auto_792052 ?auto_792059 ) ) ( not ( = ?auto_792053 ?auto_792054 ) ) ( not ( = ?auto_792053 ?auto_792055 ) ) ( not ( = ?auto_792053 ?auto_792056 ) ) ( not ( = ?auto_792053 ?auto_792057 ) ) ( not ( = ?auto_792053 ?auto_792058 ) ) ( not ( = ?auto_792053 ?auto_792059 ) ) ( not ( = ?auto_792054 ?auto_792055 ) ) ( not ( = ?auto_792054 ?auto_792056 ) ) ( not ( = ?auto_792054 ?auto_792057 ) ) ( not ( = ?auto_792054 ?auto_792058 ) ) ( not ( = ?auto_792054 ?auto_792059 ) ) ( not ( = ?auto_792055 ?auto_792056 ) ) ( not ( = ?auto_792055 ?auto_792057 ) ) ( not ( = ?auto_792055 ?auto_792058 ) ) ( not ( = ?auto_792055 ?auto_792059 ) ) ( not ( = ?auto_792056 ?auto_792057 ) ) ( not ( = ?auto_792056 ?auto_792058 ) ) ( not ( = ?auto_792056 ?auto_792059 ) ) ( not ( = ?auto_792057 ?auto_792058 ) ) ( not ( = ?auto_792057 ?auto_792059 ) ) ( not ( = ?auto_792058 ?auto_792059 ) ) ( ON ?auto_792058 ?auto_792059 ) ( ON ?auto_792057 ?auto_792058 ) ( ON ?auto_792056 ?auto_792057 ) ( ON ?auto_792055 ?auto_792056 ) ( ON ?auto_792054 ?auto_792055 ) ( ON ?auto_792053 ?auto_792054 ) ( ON ?auto_792052 ?auto_792053 ) ( ON ?auto_792051 ?auto_792052 ) ( ON ?auto_792050 ?auto_792051 ) ( ON ?auto_792049 ?auto_792050 ) ( ON ?auto_792048 ?auto_792049 ) ( CLEAR ?auto_792046 ) ( ON ?auto_792047 ?auto_792048 ) ( CLEAR ?auto_792047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_792042 ?auto_792043 ?auto_792044 ?auto_792045 ?auto_792046 ?auto_792047 )
      ( MAKE-18PILE ?auto_792042 ?auto_792043 ?auto_792044 ?auto_792045 ?auto_792046 ?auto_792047 ?auto_792048 ?auto_792049 ?auto_792050 ?auto_792051 ?auto_792052 ?auto_792053 ?auto_792054 ?auto_792055 ?auto_792056 ?auto_792057 ?auto_792058 ?auto_792059 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792078 - BLOCK
      ?auto_792079 - BLOCK
      ?auto_792080 - BLOCK
      ?auto_792081 - BLOCK
      ?auto_792082 - BLOCK
      ?auto_792083 - BLOCK
      ?auto_792084 - BLOCK
      ?auto_792085 - BLOCK
      ?auto_792086 - BLOCK
      ?auto_792087 - BLOCK
      ?auto_792088 - BLOCK
      ?auto_792089 - BLOCK
      ?auto_792090 - BLOCK
      ?auto_792091 - BLOCK
      ?auto_792092 - BLOCK
      ?auto_792093 - BLOCK
      ?auto_792094 - BLOCK
      ?auto_792095 - BLOCK
    )
    :vars
    (
      ?auto_792096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792095 ?auto_792096 ) ( ON-TABLE ?auto_792078 ) ( ON ?auto_792079 ?auto_792078 ) ( ON ?auto_792080 ?auto_792079 ) ( ON ?auto_792081 ?auto_792080 ) ( not ( = ?auto_792078 ?auto_792079 ) ) ( not ( = ?auto_792078 ?auto_792080 ) ) ( not ( = ?auto_792078 ?auto_792081 ) ) ( not ( = ?auto_792078 ?auto_792082 ) ) ( not ( = ?auto_792078 ?auto_792083 ) ) ( not ( = ?auto_792078 ?auto_792084 ) ) ( not ( = ?auto_792078 ?auto_792085 ) ) ( not ( = ?auto_792078 ?auto_792086 ) ) ( not ( = ?auto_792078 ?auto_792087 ) ) ( not ( = ?auto_792078 ?auto_792088 ) ) ( not ( = ?auto_792078 ?auto_792089 ) ) ( not ( = ?auto_792078 ?auto_792090 ) ) ( not ( = ?auto_792078 ?auto_792091 ) ) ( not ( = ?auto_792078 ?auto_792092 ) ) ( not ( = ?auto_792078 ?auto_792093 ) ) ( not ( = ?auto_792078 ?auto_792094 ) ) ( not ( = ?auto_792078 ?auto_792095 ) ) ( not ( = ?auto_792078 ?auto_792096 ) ) ( not ( = ?auto_792079 ?auto_792080 ) ) ( not ( = ?auto_792079 ?auto_792081 ) ) ( not ( = ?auto_792079 ?auto_792082 ) ) ( not ( = ?auto_792079 ?auto_792083 ) ) ( not ( = ?auto_792079 ?auto_792084 ) ) ( not ( = ?auto_792079 ?auto_792085 ) ) ( not ( = ?auto_792079 ?auto_792086 ) ) ( not ( = ?auto_792079 ?auto_792087 ) ) ( not ( = ?auto_792079 ?auto_792088 ) ) ( not ( = ?auto_792079 ?auto_792089 ) ) ( not ( = ?auto_792079 ?auto_792090 ) ) ( not ( = ?auto_792079 ?auto_792091 ) ) ( not ( = ?auto_792079 ?auto_792092 ) ) ( not ( = ?auto_792079 ?auto_792093 ) ) ( not ( = ?auto_792079 ?auto_792094 ) ) ( not ( = ?auto_792079 ?auto_792095 ) ) ( not ( = ?auto_792079 ?auto_792096 ) ) ( not ( = ?auto_792080 ?auto_792081 ) ) ( not ( = ?auto_792080 ?auto_792082 ) ) ( not ( = ?auto_792080 ?auto_792083 ) ) ( not ( = ?auto_792080 ?auto_792084 ) ) ( not ( = ?auto_792080 ?auto_792085 ) ) ( not ( = ?auto_792080 ?auto_792086 ) ) ( not ( = ?auto_792080 ?auto_792087 ) ) ( not ( = ?auto_792080 ?auto_792088 ) ) ( not ( = ?auto_792080 ?auto_792089 ) ) ( not ( = ?auto_792080 ?auto_792090 ) ) ( not ( = ?auto_792080 ?auto_792091 ) ) ( not ( = ?auto_792080 ?auto_792092 ) ) ( not ( = ?auto_792080 ?auto_792093 ) ) ( not ( = ?auto_792080 ?auto_792094 ) ) ( not ( = ?auto_792080 ?auto_792095 ) ) ( not ( = ?auto_792080 ?auto_792096 ) ) ( not ( = ?auto_792081 ?auto_792082 ) ) ( not ( = ?auto_792081 ?auto_792083 ) ) ( not ( = ?auto_792081 ?auto_792084 ) ) ( not ( = ?auto_792081 ?auto_792085 ) ) ( not ( = ?auto_792081 ?auto_792086 ) ) ( not ( = ?auto_792081 ?auto_792087 ) ) ( not ( = ?auto_792081 ?auto_792088 ) ) ( not ( = ?auto_792081 ?auto_792089 ) ) ( not ( = ?auto_792081 ?auto_792090 ) ) ( not ( = ?auto_792081 ?auto_792091 ) ) ( not ( = ?auto_792081 ?auto_792092 ) ) ( not ( = ?auto_792081 ?auto_792093 ) ) ( not ( = ?auto_792081 ?auto_792094 ) ) ( not ( = ?auto_792081 ?auto_792095 ) ) ( not ( = ?auto_792081 ?auto_792096 ) ) ( not ( = ?auto_792082 ?auto_792083 ) ) ( not ( = ?auto_792082 ?auto_792084 ) ) ( not ( = ?auto_792082 ?auto_792085 ) ) ( not ( = ?auto_792082 ?auto_792086 ) ) ( not ( = ?auto_792082 ?auto_792087 ) ) ( not ( = ?auto_792082 ?auto_792088 ) ) ( not ( = ?auto_792082 ?auto_792089 ) ) ( not ( = ?auto_792082 ?auto_792090 ) ) ( not ( = ?auto_792082 ?auto_792091 ) ) ( not ( = ?auto_792082 ?auto_792092 ) ) ( not ( = ?auto_792082 ?auto_792093 ) ) ( not ( = ?auto_792082 ?auto_792094 ) ) ( not ( = ?auto_792082 ?auto_792095 ) ) ( not ( = ?auto_792082 ?auto_792096 ) ) ( not ( = ?auto_792083 ?auto_792084 ) ) ( not ( = ?auto_792083 ?auto_792085 ) ) ( not ( = ?auto_792083 ?auto_792086 ) ) ( not ( = ?auto_792083 ?auto_792087 ) ) ( not ( = ?auto_792083 ?auto_792088 ) ) ( not ( = ?auto_792083 ?auto_792089 ) ) ( not ( = ?auto_792083 ?auto_792090 ) ) ( not ( = ?auto_792083 ?auto_792091 ) ) ( not ( = ?auto_792083 ?auto_792092 ) ) ( not ( = ?auto_792083 ?auto_792093 ) ) ( not ( = ?auto_792083 ?auto_792094 ) ) ( not ( = ?auto_792083 ?auto_792095 ) ) ( not ( = ?auto_792083 ?auto_792096 ) ) ( not ( = ?auto_792084 ?auto_792085 ) ) ( not ( = ?auto_792084 ?auto_792086 ) ) ( not ( = ?auto_792084 ?auto_792087 ) ) ( not ( = ?auto_792084 ?auto_792088 ) ) ( not ( = ?auto_792084 ?auto_792089 ) ) ( not ( = ?auto_792084 ?auto_792090 ) ) ( not ( = ?auto_792084 ?auto_792091 ) ) ( not ( = ?auto_792084 ?auto_792092 ) ) ( not ( = ?auto_792084 ?auto_792093 ) ) ( not ( = ?auto_792084 ?auto_792094 ) ) ( not ( = ?auto_792084 ?auto_792095 ) ) ( not ( = ?auto_792084 ?auto_792096 ) ) ( not ( = ?auto_792085 ?auto_792086 ) ) ( not ( = ?auto_792085 ?auto_792087 ) ) ( not ( = ?auto_792085 ?auto_792088 ) ) ( not ( = ?auto_792085 ?auto_792089 ) ) ( not ( = ?auto_792085 ?auto_792090 ) ) ( not ( = ?auto_792085 ?auto_792091 ) ) ( not ( = ?auto_792085 ?auto_792092 ) ) ( not ( = ?auto_792085 ?auto_792093 ) ) ( not ( = ?auto_792085 ?auto_792094 ) ) ( not ( = ?auto_792085 ?auto_792095 ) ) ( not ( = ?auto_792085 ?auto_792096 ) ) ( not ( = ?auto_792086 ?auto_792087 ) ) ( not ( = ?auto_792086 ?auto_792088 ) ) ( not ( = ?auto_792086 ?auto_792089 ) ) ( not ( = ?auto_792086 ?auto_792090 ) ) ( not ( = ?auto_792086 ?auto_792091 ) ) ( not ( = ?auto_792086 ?auto_792092 ) ) ( not ( = ?auto_792086 ?auto_792093 ) ) ( not ( = ?auto_792086 ?auto_792094 ) ) ( not ( = ?auto_792086 ?auto_792095 ) ) ( not ( = ?auto_792086 ?auto_792096 ) ) ( not ( = ?auto_792087 ?auto_792088 ) ) ( not ( = ?auto_792087 ?auto_792089 ) ) ( not ( = ?auto_792087 ?auto_792090 ) ) ( not ( = ?auto_792087 ?auto_792091 ) ) ( not ( = ?auto_792087 ?auto_792092 ) ) ( not ( = ?auto_792087 ?auto_792093 ) ) ( not ( = ?auto_792087 ?auto_792094 ) ) ( not ( = ?auto_792087 ?auto_792095 ) ) ( not ( = ?auto_792087 ?auto_792096 ) ) ( not ( = ?auto_792088 ?auto_792089 ) ) ( not ( = ?auto_792088 ?auto_792090 ) ) ( not ( = ?auto_792088 ?auto_792091 ) ) ( not ( = ?auto_792088 ?auto_792092 ) ) ( not ( = ?auto_792088 ?auto_792093 ) ) ( not ( = ?auto_792088 ?auto_792094 ) ) ( not ( = ?auto_792088 ?auto_792095 ) ) ( not ( = ?auto_792088 ?auto_792096 ) ) ( not ( = ?auto_792089 ?auto_792090 ) ) ( not ( = ?auto_792089 ?auto_792091 ) ) ( not ( = ?auto_792089 ?auto_792092 ) ) ( not ( = ?auto_792089 ?auto_792093 ) ) ( not ( = ?auto_792089 ?auto_792094 ) ) ( not ( = ?auto_792089 ?auto_792095 ) ) ( not ( = ?auto_792089 ?auto_792096 ) ) ( not ( = ?auto_792090 ?auto_792091 ) ) ( not ( = ?auto_792090 ?auto_792092 ) ) ( not ( = ?auto_792090 ?auto_792093 ) ) ( not ( = ?auto_792090 ?auto_792094 ) ) ( not ( = ?auto_792090 ?auto_792095 ) ) ( not ( = ?auto_792090 ?auto_792096 ) ) ( not ( = ?auto_792091 ?auto_792092 ) ) ( not ( = ?auto_792091 ?auto_792093 ) ) ( not ( = ?auto_792091 ?auto_792094 ) ) ( not ( = ?auto_792091 ?auto_792095 ) ) ( not ( = ?auto_792091 ?auto_792096 ) ) ( not ( = ?auto_792092 ?auto_792093 ) ) ( not ( = ?auto_792092 ?auto_792094 ) ) ( not ( = ?auto_792092 ?auto_792095 ) ) ( not ( = ?auto_792092 ?auto_792096 ) ) ( not ( = ?auto_792093 ?auto_792094 ) ) ( not ( = ?auto_792093 ?auto_792095 ) ) ( not ( = ?auto_792093 ?auto_792096 ) ) ( not ( = ?auto_792094 ?auto_792095 ) ) ( not ( = ?auto_792094 ?auto_792096 ) ) ( not ( = ?auto_792095 ?auto_792096 ) ) ( ON ?auto_792094 ?auto_792095 ) ( ON ?auto_792093 ?auto_792094 ) ( ON ?auto_792092 ?auto_792093 ) ( ON ?auto_792091 ?auto_792092 ) ( ON ?auto_792090 ?auto_792091 ) ( ON ?auto_792089 ?auto_792090 ) ( ON ?auto_792088 ?auto_792089 ) ( ON ?auto_792087 ?auto_792088 ) ( ON ?auto_792086 ?auto_792087 ) ( ON ?auto_792085 ?auto_792086 ) ( ON ?auto_792084 ?auto_792085 ) ( ON ?auto_792083 ?auto_792084 ) ( CLEAR ?auto_792081 ) ( ON ?auto_792082 ?auto_792083 ) ( CLEAR ?auto_792082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_792078 ?auto_792079 ?auto_792080 ?auto_792081 ?auto_792082 )
      ( MAKE-18PILE ?auto_792078 ?auto_792079 ?auto_792080 ?auto_792081 ?auto_792082 ?auto_792083 ?auto_792084 ?auto_792085 ?auto_792086 ?auto_792087 ?auto_792088 ?auto_792089 ?auto_792090 ?auto_792091 ?auto_792092 ?auto_792093 ?auto_792094 ?auto_792095 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792115 - BLOCK
      ?auto_792116 - BLOCK
      ?auto_792117 - BLOCK
      ?auto_792118 - BLOCK
      ?auto_792119 - BLOCK
      ?auto_792120 - BLOCK
      ?auto_792121 - BLOCK
      ?auto_792122 - BLOCK
      ?auto_792123 - BLOCK
      ?auto_792124 - BLOCK
      ?auto_792125 - BLOCK
      ?auto_792126 - BLOCK
      ?auto_792127 - BLOCK
      ?auto_792128 - BLOCK
      ?auto_792129 - BLOCK
      ?auto_792130 - BLOCK
      ?auto_792131 - BLOCK
      ?auto_792132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_792132 ) ( ON-TABLE ?auto_792115 ) ( ON ?auto_792116 ?auto_792115 ) ( ON ?auto_792117 ?auto_792116 ) ( ON ?auto_792118 ?auto_792117 ) ( not ( = ?auto_792115 ?auto_792116 ) ) ( not ( = ?auto_792115 ?auto_792117 ) ) ( not ( = ?auto_792115 ?auto_792118 ) ) ( not ( = ?auto_792115 ?auto_792119 ) ) ( not ( = ?auto_792115 ?auto_792120 ) ) ( not ( = ?auto_792115 ?auto_792121 ) ) ( not ( = ?auto_792115 ?auto_792122 ) ) ( not ( = ?auto_792115 ?auto_792123 ) ) ( not ( = ?auto_792115 ?auto_792124 ) ) ( not ( = ?auto_792115 ?auto_792125 ) ) ( not ( = ?auto_792115 ?auto_792126 ) ) ( not ( = ?auto_792115 ?auto_792127 ) ) ( not ( = ?auto_792115 ?auto_792128 ) ) ( not ( = ?auto_792115 ?auto_792129 ) ) ( not ( = ?auto_792115 ?auto_792130 ) ) ( not ( = ?auto_792115 ?auto_792131 ) ) ( not ( = ?auto_792115 ?auto_792132 ) ) ( not ( = ?auto_792116 ?auto_792117 ) ) ( not ( = ?auto_792116 ?auto_792118 ) ) ( not ( = ?auto_792116 ?auto_792119 ) ) ( not ( = ?auto_792116 ?auto_792120 ) ) ( not ( = ?auto_792116 ?auto_792121 ) ) ( not ( = ?auto_792116 ?auto_792122 ) ) ( not ( = ?auto_792116 ?auto_792123 ) ) ( not ( = ?auto_792116 ?auto_792124 ) ) ( not ( = ?auto_792116 ?auto_792125 ) ) ( not ( = ?auto_792116 ?auto_792126 ) ) ( not ( = ?auto_792116 ?auto_792127 ) ) ( not ( = ?auto_792116 ?auto_792128 ) ) ( not ( = ?auto_792116 ?auto_792129 ) ) ( not ( = ?auto_792116 ?auto_792130 ) ) ( not ( = ?auto_792116 ?auto_792131 ) ) ( not ( = ?auto_792116 ?auto_792132 ) ) ( not ( = ?auto_792117 ?auto_792118 ) ) ( not ( = ?auto_792117 ?auto_792119 ) ) ( not ( = ?auto_792117 ?auto_792120 ) ) ( not ( = ?auto_792117 ?auto_792121 ) ) ( not ( = ?auto_792117 ?auto_792122 ) ) ( not ( = ?auto_792117 ?auto_792123 ) ) ( not ( = ?auto_792117 ?auto_792124 ) ) ( not ( = ?auto_792117 ?auto_792125 ) ) ( not ( = ?auto_792117 ?auto_792126 ) ) ( not ( = ?auto_792117 ?auto_792127 ) ) ( not ( = ?auto_792117 ?auto_792128 ) ) ( not ( = ?auto_792117 ?auto_792129 ) ) ( not ( = ?auto_792117 ?auto_792130 ) ) ( not ( = ?auto_792117 ?auto_792131 ) ) ( not ( = ?auto_792117 ?auto_792132 ) ) ( not ( = ?auto_792118 ?auto_792119 ) ) ( not ( = ?auto_792118 ?auto_792120 ) ) ( not ( = ?auto_792118 ?auto_792121 ) ) ( not ( = ?auto_792118 ?auto_792122 ) ) ( not ( = ?auto_792118 ?auto_792123 ) ) ( not ( = ?auto_792118 ?auto_792124 ) ) ( not ( = ?auto_792118 ?auto_792125 ) ) ( not ( = ?auto_792118 ?auto_792126 ) ) ( not ( = ?auto_792118 ?auto_792127 ) ) ( not ( = ?auto_792118 ?auto_792128 ) ) ( not ( = ?auto_792118 ?auto_792129 ) ) ( not ( = ?auto_792118 ?auto_792130 ) ) ( not ( = ?auto_792118 ?auto_792131 ) ) ( not ( = ?auto_792118 ?auto_792132 ) ) ( not ( = ?auto_792119 ?auto_792120 ) ) ( not ( = ?auto_792119 ?auto_792121 ) ) ( not ( = ?auto_792119 ?auto_792122 ) ) ( not ( = ?auto_792119 ?auto_792123 ) ) ( not ( = ?auto_792119 ?auto_792124 ) ) ( not ( = ?auto_792119 ?auto_792125 ) ) ( not ( = ?auto_792119 ?auto_792126 ) ) ( not ( = ?auto_792119 ?auto_792127 ) ) ( not ( = ?auto_792119 ?auto_792128 ) ) ( not ( = ?auto_792119 ?auto_792129 ) ) ( not ( = ?auto_792119 ?auto_792130 ) ) ( not ( = ?auto_792119 ?auto_792131 ) ) ( not ( = ?auto_792119 ?auto_792132 ) ) ( not ( = ?auto_792120 ?auto_792121 ) ) ( not ( = ?auto_792120 ?auto_792122 ) ) ( not ( = ?auto_792120 ?auto_792123 ) ) ( not ( = ?auto_792120 ?auto_792124 ) ) ( not ( = ?auto_792120 ?auto_792125 ) ) ( not ( = ?auto_792120 ?auto_792126 ) ) ( not ( = ?auto_792120 ?auto_792127 ) ) ( not ( = ?auto_792120 ?auto_792128 ) ) ( not ( = ?auto_792120 ?auto_792129 ) ) ( not ( = ?auto_792120 ?auto_792130 ) ) ( not ( = ?auto_792120 ?auto_792131 ) ) ( not ( = ?auto_792120 ?auto_792132 ) ) ( not ( = ?auto_792121 ?auto_792122 ) ) ( not ( = ?auto_792121 ?auto_792123 ) ) ( not ( = ?auto_792121 ?auto_792124 ) ) ( not ( = ?auto_792121 ?auto_792125 ) ) ( not ( = ?auto_792121 ?auto_792126 ) ) ( not ( = ?auto_792121 ?auto_792127 ) ) ( not ( = ?auto_792121 ?auto_792128 ) ) ( not ( = ?auto_792121 ?auto_792129 ) ) ( not ( = ?auto_792121 ?auto_792130 ) ) ( not ( = ?auto_792121 ?auto_792131 ) ) ( not ( = ?auto_792121 ?auto_792132 ) ) ( not ( = ?auto_792122 ?auto_792123 ) ) ( not ( = ?auto_792122 ?auto_792124 ) ) ( not ( = ?auto_792122 ?auto_792125 ) ) ( not ( = ?auto_792122 ?auto_792126 ) ) ( not ( = ?auto_792122 ?auto_792127 ) ) ( not ( = ?auto_792122 ?auto_792128 ) ) ( not ( = ?auto_792122 ?auto_792129 ) ) ( not ( = ?auto_792122 ?auto_792130 ) ) ( not ( = ?auto_792122 ?auto_792131 ) ) ( not ( = ?auto_792122 ?auto_792132 ) ) ( not ( = ?auto_792123 ?auto_792124 ) ) ( not ( = ?auto_792123 ?auto_792125 ) ) ( not ( = ?auto_792123 ?auto_792126 ) ) ( not ( = ?auto_792123 ?auto_792127 ) ) ( not ( = ?auto_792123 ?auto_792128 ) ) ( not ( = ?auto_792123 ?auto_792129 ) ) ( not ( = ?auto_792123 ?auto_792130 ) ) ( not ( = ?auto_792123 ?auto_792131 ) ) ( not ( = ?auto_792123 ?auto_792132 ) ) ( not ( = ?auto_792124 ?auto_792125 ) ) ( not ( = ?auto_792124 ?auto_792126 ) ) ( not ( = ?auto_792124 ?auto_792127 ) ) ( not ( = ?auto_792124 ?auto_792128 ) ) ( not ( = ?auto_792124 ?auto_792129 ) ) ( not ( = ?auto_792124 ?auto_792130 ) ) ( not ( = ?auto_792124 ?auto_792131 ) ) ( not ( = ?auto_792124 ?auto_792132 ) ) ( not ( = ?auto_792125 ?auto_792126 ) ) ( not ( = ?auto_792125 ?auto_792127 ) ) ( not ( = ?auto_792125 ?auto_792128 ) ) ( not ( = ?auto_792125 ?auto_792129 ) ) ( not ( = ?auto_792125 ?auto_792130 ) ) ( not ( = ?auto_792125 ?auto_792131 ) ) ( not ( = ?auto_792125 ?auto_792132 ) ) ( not ( = ?auto_792126 ?auto_792127 ) ) ( not ( = ?auto_792126 ?auto_792128 ) ) ( not ( = ?auto_792126 ?auto_792129 ) ) ( not ( = ?auto_792126 ?auto_792130 ) ) ( not ( = ?auto_792126 ?auto_792131 ) ) ( not ( = ?auto_792126 ?auto_792132 ) ) ( not ( = ?auto_792127 ?auto_792128 ) ) ( not ( = ?auto_792127 ?auto_792129 ) ) ( not ( = ?auto_792127 ?auto_792130 ) ) ( not ( = ?auto_792127 ?auto_792131 ) ) ( not ( = ?auto_792127 ?auto_792132 ) ) ( not ( = ?auto_792128 ?auto_792129 ) ) ( not ( = ?auto_792128 ?auto_792130 ) ) ( not ( = ?auto_792128 ?auto_792131 ) ) ( not ( = ?auto_792128 ?auto_792132 ) ) ( not ( = ?auto_792129 ?auto_792130 ) ) ( not ( = ?auto_792129 ?auto_792131 ) ) ( not ( = ?auto_792129 ?auto_792132 ) ) ( not ( = ?auto_792130 ?auto_792131 ) ) ( not ( = ?auto_792130 ?auto_792132 ) ) ( not ( = ?auto_792131 ?auto_792132 ) ) ( ON ?auto_792131 ?auto_792132 ) ( ON ?auto_792130 ?auto_792131 ) ( ON ?auto_792129 ?auto_792130 ) ( ON ?auto_792128 ?auto_792129 ) ( ON ?auto_792127 ?auto_792128 ) ( ON ?auto_792126 ?auto_792127 ) ( ON ?auto_792125 ?auto_792126 ) ( ON ?auto_792124 ?auto_792125 ) ( ON ?auto_792123 ?auto_792124 ) ( ON ?auto_792122 ?auto_792123 ) ( ON ?auto_792121 ?auto_792122 ) ( ON ?auto_792120 ?auto_792121 ) ( CLEAR ?auto_792118 ) ( ON ?auto_792119 ?auto_792120 ) ( CLEAR ?auto_792119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_792115 ?auto_792116 ?auto_792117 ?auto_792118 ?auto_792119 )
      ( MAKE-18PILE ?auto_792115 ?auto_792116 ?auto_792117 ?auto_792118 ?auto_792119 ?auto_792120 ?auto_792121 ?auto_792122 ?auto_792123 ?auto_792124 ?auto_792125 ?auto_792126 ?auto_792127 ?auto_792128 ?auto_792129 ?auto_792130 ?auto_792131 ?auto_792132 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792151 - BLOCK
      ?auto_792152 - BLOCK
      ?auto_792153 - BLOCK
      ?auto_792154 - BLOCK
      ?auto_792155 - BLOCK
      ?auto_792156 - BLOCK
      ?auto_792157 - BLOCK
      ?auto_792158 - BLOCK
      ?auto_792159 - BLOCK
      ?auto_792160 - BLOCK
      ?auto_792161 - BLOCK
      ?auto_792162 - BLOCK
      ?auto_792163 - BLOCK
      ?auto_792164 - BLOCK
      ?auto_792165 - BLOCK
      ?auto_792166 - BLOCK
      ?auto_792167 - BLOCK
      ?auto_792168 - BLOCK
    )
    :vars
    (
      ?auto_792169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792168 ?auto_792169 ) ( ON-TABLE ?auto_792151 ) ( ON ?auto_792152 ?auto_792151 ) ( ON ?auto_792153 ?auto_792152 ) ( not ( = ?auto_792151 ?auto_792152 ) ) ( not ( = ?auto_792151 ?auto_792153 ) ) ( not ( = ?auto_792151 ?auto_792154 ) ) ( not ( = ?auto_792151 ?auto_792155 ) ) ( not ( = ?auto_792151 ?auto_792156 ) ) ( not ( = ?auto_792151 ?auto_792157 ) ) ( not ( = ?auto_792151 ?auto_792158 ) ) ( not ( = ?auto_792151 ?auto_792159 ) ) ( not ( = ?auto_792151 ?auto_792160 ) ) ( not ( = ?auto_792151 ?auto_792161 ) ) ( not ( = ?auto_792151 ?auto_792162 ) ) ( not ( = ?auto_792151 ?auto_792163 ) ) ( not ( = ?auto_792151 ?auto_792164 ) ) ( not ( = ?auto_792151 ?auto_792165 ) ) ( not ( = ?auto_792151 ?auto_792166 ) ) ( not ( = ?auto_792151 ?auto_792167 ) ) ( not ( = ?auto_792151 ?auto_792168 ) ) ( not ( = ?auto_792151 ?auto_792169 ) ) ( not ( = ?auto_792152 ?auto_792153 ) ) ( not ( = ?auto_792152 ?auto_792154 ) ) ( not ( = ?auto_792152 ?auto_792155 ) ) ( not ( = ?auto_792152 ?auto_792156 ) ) ( not ( = ?auto_792152 ?auto_792157 ) ) ( not ( = ?auto_792152 ?auto_792158 ) ) ( not ( = ?auto_792152 ?auto_792159 ) ) ( not ( = ?auto_792152 ?auto_792160 ) ) ( not ( = ?auto_792152 ?auto_792161 ) ) ( not ( = ?auto_792152 ?auto_792162 ) ) ( not ( = ?auto_792152 ?auto_792163 ) ) ( not ( = ?auto_792152 ?auto_792164 ) ) ( not ( = ?auto_792152 ?auto_792165 ) ) ( not ( = ?auto_792152 ?auto_792166 ) ) ( not ( = ?auto_792152 ?auto_792167 ) ) ( not ( = ?auto_792152 ?auto_792168 ) ) ( not ( = ?auto_792152 ?auto_792169 ) ) ( not ( = ?auto_792153 ?auto_792154 ) ) ( not ( = ?auto_792153 ?auto_792155 ) ) ( not ( = ?auto_792153 ?auto_792156 ) ) ( not ( = ?auto_792153 ?auto_792157 ) ) ( not ( = ?auto_792153 ?auto_792158 ) ) ( not ( = ?auto_792153 ?auto_792159 ) ) ( not ( = ?auto_792153 ?auto_792160 ) ) ( not ( = ?auto_792153 ?auto_792161 ) ) ( not ( = ?auto_792153 ?auto_792162 ) ) ( not ( = ?auto_792153 ?auto_792163 ) ) ( not ( = ?auto_792153 ?auto_792164 ) ) ( not ( = ?auto_792153 ?auto_792165 ) ) ( not ( = ?auto_792153 ?auto_792166 ) ) ( not ( = ?auto_792153 ?auto_792167 ) ) ( not ( = ?auto_792153 ?auto_792168 ) ) ( not ( = ?auto_792153 ?auto_792169 ) ) ( not ( = ?auto_792154 ?auto_792155 ) ) ( not ( = ?auto_792154 ?auto_792156 ) ) ( not ( = ?auto_792154 ?auto_792157 ) ) ( not ( = ?auto_792154 ?auto_792158 ) ) ( not ( = ?auto_792154 ?auto_792159 ) ) ( not ( = ?auto_792154 ?auto_792160 ) ) ( not ( = ?auto_792154 ?auto_792161 ) ) ( not ( = ?auto_792154 ?auto_792162 ) ) ( not ( = ?auto_792154 ?auto_792163 ) ) ( not ( = ?auto_792154 ?auto_792164 ) ) ( not ( = ?auto_792154 ?auto_792165 ) ) ( not ( = ?auto_792154 ?auto_792166 ) ) ( not ( = ?auto_792154 ?auto_792167 ) ) ( not ( = ?auto_792154 ?auto_792168 ) ) ( not ( = ?auto_792154 ?auto_792169 ) ) ( not ( = ?auto_792155 ?auto_792156 ) ) ( not ( = ?auto_792155 ?auto_792157 ) ) ( not ( = ?auto_792155 ?auto_792158 ) ) ( not ( = ?auto_792155 ?auto_792159 ) ) ( not ( = ?auto_792155 ?auto_792160 ) ) ( not ( = ?auto_792155 ?auto_792161 ) ) ( not ( = ?auto_792155 ?auto_792162 ) ) ( not ( = ?auto_792155 ?auto_792163 ) ) ( not ( = ?auto_792155 ?auto_792164 ) ) ( not ( = ?auto_792155 ?auto_792165 ) ) ( not ( = ?auto_792155 ?auto_792166 ) ) ( not ( = ?auto_792155 ?auto_792167 ) ) ( not ( = ?auto_792155 ?auto_792168 ) ) ( not ( = ?auto_792155 ?auto_792169 ) ) ( not ( = ?auto_792156 ?auto_792157 ) ) ( not ( = ?auto_792156 ?auto_792158 ) ) ( not ( = ?auto_792156 ?auto_792159 ) ) ( not ( = ?auto_792156 ?auto_792160 ) ) ( not ( = ?auto_792156 ?auto_792161 ) ) ( not ( = ?auto_792156 ?auto_792162 ) ) ( not ( = ?auto_792156 ?auto_792163 ) ) ( not ( = ?auto_792156 ?auto_792164 ) ) ( not ( = ?auto_792156 ?auto_792165 ) ) ( not ( = ?auto_792156 ?auto_792166 ) ) ( not ( = ?auto_792156 ?auto_792167 ) ) ( not ( = ?auto_792156 ?auto_792168 ) ) ( not ( = ?auto_792156 ?auto_792169 ) ) ( not ( = ?auto_792157 ?auto_792158 ) ) ( not ( = ?auto_792157 ?auto_792159 ) ) ( not ( = ?auto_792157 ?auto_792160 ) ) ( not ( = ?auto_792157 ?auto_792161 ) ) ( not ( = ?auto_792157 ?auto_792162 ) ) ( not ( = ?auto_792157 ?auto_792163 ) ) ( not ( = ?auto_792157 ?auto_792164 ) ) ( not ( = ?auto_792157 ?auto_792165 ) ) ( not ( = ?auto_792157 ?auto_792166 ) ) ( not ( = ?auto_792157 ?auto_792167 ) ) ( not ( = ?auto_792157 ?auto_792168 ) ) ( not ( = ?auto_792157 ?auto_792169 ) ) ( not ( = ?auto_792158 ?auto_792159 ) ) ( not ( = ?auto_792158 ?auto_792160 ) ) ( not ( = ?auto_792158 ?auto_792161 ) ) ( not ( = ?auto_792158 ?auto_792162 ) ) ( not ( = ?auto_792158 ?auto_792163 ) ) ( not ( = ?auto_792158 ?auto_792164 ) ) ( not ( = ?auto_792158 ?auto_792165 ) ) ( not ( = ?auto_792158 ?auto_792166 ) ) ( not ( = ?auto_792158 ?auto_792167 ) ) ( not ( = ?auto_792158 ?auto_792168 ) ) ( not ( = ?auto_792158 ?auto_792169 ) ) ( not ( = ?auto_792159 ?auto_792160 ) ) ( not ( = ?auto_792159 ?auto_792161 ) ) ( not ( = ?auto_792159 ?auto_792162 ) ) ( not ( = ?auto_792159 ?auto_792163 ) ) ( not ( = ?auto_792159 ?auto_792164 ) ) ( not ( = ?auto_792159 ?auto_792165 ) ) ( not ( = ?auto_792159 ?auto_792166 ) ) ( not ( = ?auto_792159 ?auto_792167 ) ) ( not ( = ?auto_792159 ?auto_792168 ) ) ( not ( = ?auto_792159 ?auto_792169 ) ) ( not ( = ?auto_792160 ?auto_792161 ) ) ( not ( = ?auto_792160 ?auto_792162 ) ) ( not ( = ?auto_792160 ?auto_792163 ) ) ( not ( = ?auto_792160 ?auto_792164 ) ) ( not ( = ?auto_792160 ?auto_792165 ) ) ( not ( = ?auto_792160 ?auto_792166 ) ) ( not ( = ?auto_792160 ?auto_792167 ) ) ( not ( = ?auto_792160 ?auto_792168 ) ) ( not ( = ?auto_792160 ?auto_792169 ) ) ( not ( = ?auto_792161 ?auto_792162 ) ) ( not ( = ?auto_792161 ?auto_792163 ) ) ( not ( = ?auto_792161 ?auto_792164 ) ) ( not ( = ?auto_792161 ?auto_792165 ) ) ( not ( = ?auto_792161 ?auto_792166 ) ) ( not ( = ?auto_792161 ?auto_792167 ) ) ( not ( = ?auto_792161 ?auto_792168 ) ) ( not ( = ?auto_792161 ?auto_792169 ) ) ( not ( = ?auto_792162 ?auto_792163 ) ) ( not ( = ?auto_792162 ?auto_792164 ) ) ( not ( = ?auto_792162 ?auto_792165 ) ) ( not ( = ?auto_792162 ?auto_792166 ) ) ( not ( = ?auto_792162 ?auto_792167 ) ) ( not ( = ?auto_792162 ?auto_792168 ) ) ( not ( = ?auto_792162 ?auto_792169 ) ) ( not ( = ?auto_792163 ?auto_792164 ) ) ( not ( = ?auto_792163 ?auto_792165 ) ) ( not ( = ?auto_792163 ?auto_792166 ) ) ( not ( = ?auto_792163 ?auto_792167 ) ) ( not ( = ?auto_792163 ?auto_792168 ) ) ( not ( = ?auto_792163 ?auto_792169 ) ) ( not ( = ?auto_792164 ?auto_792165 ) ) ( not ( = ?auto_792164 ?auto_792166 ) ) ( not ( = ?auto_792164 ?auto_792167 ) ) ( not ( = ?auto_792164 ?auto_792168 ) ) ( not ( = ?auto_792164 ?auto_792169 ) ) ( not ( = ?auto_792165 ?auto_792166 ) ) ( not ( = ?auto_792165 ?auto_792167 ) ) ( not ( = ?auto_792165 ?auto_792168 ) ) ( not ( = ?auto_792165 ?auto_792169 ) ) ( not ( = ?auto_792166 ?auto_792167 ) ) ( not ( = ?auto_792166 ?auto_792168 ) ) ( not ( = ?auto_792166 ?auto_792169 ) ) ( not ( = ?auto_792167 ?auto_792168 ) ) ( not ( = ?auto_792167 ?auto_792169 ) ) ( not ( = ?auto_792168 ?auto_792169 ) ) ( ON ?auto_792167 ?auto_792168 ) ( ON ?auto_792166 ?auto_792167 ) ( ON ?auto_792165 ?auto_792166 ) ( ON ?auto_792164 ?auto_792165 ) ( ON ?auto_792163 ?auto_792164 ) ( ON ?auto_792162 ?auto_792163 ) ( ON ?auto_792161 ?auto_792162 ) ( ON ?auto_792160 ?auto_792161 ) ( ON ?auto_792159 ?auto_792160 ) ( ON ?auto_792158 ?auto_792159 ) ( ON ?auto_792157 ?auto_792158 ) ( ON ?auto_792156 ?auto_792157 ) ( ON ?auto_792155 ?auto_792156 ) ( CLEAR ?auto_792153 ) ( ON ?auto_792154 ?auto_792155 ) ( CLEAR ?auto_792154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_792151 ?auto_792152 ?auto_792153 ?auto_792154 )
      ( MAKE-18PILE ?auto_792151 ?auto_792152 ?auto_792153 ?auto_792154 ?auto_792155 ?auto_792156 ?auto_792157 ?auto_792158 ?auto_792159 ?auto_792160 ?auto_792161 ?auto_792162 ?auto_792163 ?auto_792164 ?auto_792165 ?auto_792166 ?auto_792167 ?auto_792168 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792188 - BLOCK
      ?auto_792189 - BLOCK
      ?auto_792190 - BLOCK
      ?auto_792191 - BLOCK
      ?auto_792192 - BLOCK
      ?auto_792193 - BLOCK
      ?auto_792194 - BLOCK
      ?auto_792195 - BLOCK
      ?auto_792196 - BLOCK
      ?auto_792197 - BLOCK
      ?auto_792198 - BLOCK
      ?auto_792199 - BLOCK
      ?auto_792200 - BLOCK
      ?auto_792201 - BLOCK
      ?auto_792202 - BLOCK
      ?auto_792203 - BLOCK
      ?auto_792204 - BLOCK
      ?auto_792205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_792205 ) ( ON-TABLE ?auto_792188 ) ( ON ?auto_792189 ?auto_792188 ) ( ON ?auto_792190 ?auto_792189 ) ( not ( = ?auto_792188 ?auto_792189 ) ) ( not ( = ?auto_792188 ?auto_792190 ) ) ( not ( = ?auto_792188 ?auto_792191 ) ) ( not ( = ?auto_792188 ?auto_792192 ) ) ( not ( = ?auto_792188 ?auto_792193 ) ) ( not ( = ?auto_792188 ?auto_792194 ) ) ( not ( = ?auto_792188 ?auto_792195 ) ) ( not ( = ?auto_792188 ?auto_792196 ) ) ( not ( = ?auto_792188 ?auto_792197 ) ) ( not ( = ?auto_792188 ?auto_792198 ) ) ( not ( = ?auto_792188 ?auto_792199 ) ) ( not ( = ?auto_792188 ?auto_792200 ) ) ( not ( = ?auto_792188 ?auto_792201 ) ) ( not ( = ?auto_792188 ?auto_792202 ) ) ( not ( = ?auto_792188 ?auto_792203 ) ) ( not ( = ?auto_792188 ?auto_792204 ) ) ( not ( = ?auto_792188 ?auto_792205 ) ) ( not ( = ?auto_792189 ?auto_792190 ) ) ( not ( = ?auto_792189 ?auto_792191 ) ) ( not ( = ?auto_792189 ?auto_792192 ) ) ( not ( = ?auto_792189 ?auto_792193 ) ) ( not ( = ?auto_792189 ?auto_792194 ) ) ( not ( = ?auto_792189 ?auto_792195 ) ) ( not ( = ?auto_792189 ?auto_792196 ) ) ( not ( = ?auto_792189 ?auto_792197 ) ) ( not ( = ?auto_792189 ?auto_792198 ) ) ( not ( = ?auto_792189 ?auto_792199 ) ) ( not ( = ?auto_792189 ?auto_792200 ) ) ( not ( = ?auto_792189 ?auto_792201 ) ) ( not ( = ?auto_792189 ?auto_792202 ) ) ( not ( = ?auto_792189 ?auto_792203 ) ) ( not ( = ?auto_792189 ?auto_792204 ) ) ( not ( = ?auto_792189 ?auto_792205 ) ) ( not ( = ?auto_792190 ?auto_792191 ) ) ( not ( = ?auto_792190 ?auto_792192 ) ) ( not ( = ?auto_792190 ?auto_792193 ) ) ( not ( = ?auto_792190 ?auto_792194 ) ) ( not ( = ?auto_792190 ?auto_792195 ) ) ( not ( = ?auto_792190 ?auto_792196 ) ) ( not ( = ?auto_792190 ?auto_792197 ) ) ( not ( = ?auto_792190 ?auto_792198 ) ) ( not ( = ?auto_792190 ?auto_792199 ) ) ( not ( = ?auto_792190 ?auto_792200 ) ) ( not ( = ?auto_792190 ?auto_792201 ) ) ( not ( = ?auto_792190 ?auto_792202 ) ) ( not ( = ?auto_792190 ?auto_792203 ) ) ( not ( = ?auto_792190 ?auto_792204 ) ) ( not ( = ?auto_792190 ?auto_792205 ) ) ( not ( = ?auto_792191 ?auto_792192 ) ) ( not ( = ?auto_792191 ?auto_792193 ) ) ( not ( = ?auto_792191 ?auto_792194 ) ) ( not ( = ?auto_792191 ?auto_792195 ) ) ( not ( = ?auto_792191 ?auto_792196 ) ) ( not ( = ?auto_792191 ?auto_792197 ) ) ( not ( = ?auto_792191 ?auto_792198 ) ) ( not ( = ?auto_792191 ?auto_792199 ) ) ( not ( = ?auto_792191 ?auto_792200 ) ) ( not ( = ?auto_792191 ?auto_792201 ) ) ( not ( = ?auto_792191 ?auto_792202 ) ) ( not ( = ?auto_792191 ?auto_792203 ) ) ( not ( = ?auto_792191 ?auto_792204 ) ) ( not ( = ?auto_792191 ?auto_792205 ) ) ( not ( = ?auto_792192 ?auto_792193 ) ) ( not ( = ?auto_792192 ?auto_792194 ) ) ( not ( = ?auto_792192 ?auto_792195 ) ) ( not ( = ?auto_792192 ?auto_792196 ) ) ( not ( = ?auto_792192 ?auto_792197 ) ) ( not ( = ?auto_792192 ?auto_792198 ) ) ( not ( = ?auto_792192 ?auto_792199 ) ) ( not ( = ?auto_792192 ?auto_792200 ) ) ( not ( = ?auto_792192 ?auto_792201 ) ) ( not ( = ?auto_792192 ?auto_792202 ) ) ( not ( = ?auto_792192 ?auto_792203 ) ) ( not ( = ?auto_792192 ?auto_792204 ) ) ( not ( = ?auto_792192 ?auto_792205 ) ) ( not ( = ?auto_792193 ?auto_792194 ) ) ( not ( = ?auto_792193 ?auto_792195 ) ) ( not ( = ?auto_792193 ?auto_792196 ) ) ( not ( = ?auto_792193 ?auto_792197 ) ) ( not ( = ?auto_792193 ?auto_792198 ) ) ( not ( = ?auto_792193 ?auto_792199 ) ) ( not ( = ?auto_792193 ?auto_792200 ) ) ( not ( = ?auto_792193 ?auto_792201 ) ) ( not ( = ?auto_792193 ?auto_792202 ) ) ( not ( = ?auto_792193 ?auto_792203 ) ) ( not ( = ?auto_792193 ?auto_792204 ) ) ( not ( = ?auto_792193 ?auto_792205 ) ) ( not ( = ?auto_792194 ?auto_792195 ) ) ( not ( = ?auto_792194 ?auto_792196 ) ) ( not ( = ?auto_792194 ?auto_792197 ) ) ( not ( = ?auto_792194 ?auto_792198 ) ) ( not ( = ?auto_792194 ?auto_792199 ) ) ( not ( = ?auto_792194 ?auto_792200 ) ) ( not ( = ?auto_792194 ?auto_792201 ) ) ( not ( = ?auto_792194 ?auto_792202 ) ) ( not ( = ?auto_792194 ?auto_792203 ) ) ( not ( = ?auto_792194 ?auto_792204 ) ) ( not ( = ?auto_792194 ?auto_792205 ) ) ( not ( = ?auto_792195 ?auto_792196 ) ) ( not ( = ?auto_792195 ?auto_792197 ) ) ( not ( = ?auto_792195 ?auto_792198 ) ) ( not ( = ?auto_792195 ?auto_792199 ) ) ( not ( = ?auto_792195 ?auto_792200 ) ) ( not ( = ?auto_792195 ?auto_792201 ) ) ( not ( = ?auto_792195 ?auto_792202 ) ) ( not ( = ?auto_792195 ?auto_792203 ) ) ( not ( = ?auto_792195 ?auto_792204 ) ) ( not ( = ?auto_792195 ?auto_792205 ) ) ( not ( = ?auto_792196 ?auto_792197 ) ) ( not ( = ?auto_792196 ?auto_792198 ) ) ( not ( = ?auto_792196 ?auto_792199 ) ) ( not ( = ?auto_792196 ?auto_792200 ) ) ( not ( = ?auto_792196 ?auto_792201 ) ) ( not ( = ?auto_792196 ?auto_792202 ) ) ( not ( = ?auto_792196 ?auto_792203 ) ) ( not ( = ?auto_792196 ?auto_792204 ) ) ( not ( = ?auto_792196 ?auto_792205 ) ) ( not ( = ?auto_792197 ?auto_792198 ) ) ( not ( = ?auto_792197 ?auto_792199 ) ) ( not ( = ?auto_792197 ?auto_792200 ) ) ( not ( = ?auto_792197 ?auto_792201 ) ) ( not ( = ?auto_792197 ?auto_792202 ) ) ( not ( = ?auto_792197 ?auto_792203 ) ) ( not ( = ?auto_792197 ?auto_792204 ) ) ( not ( = ?auto_792197 ?auto_792205 ) ) ( not ( = ?auto_792198 ?auto_792199 ) ) ( not ( = ?auto_792198 ?auto_792200 ) ) ( not ( = ?auto_792198 ?auto_792201 ) ) ( not ( = ?auto_792198 ?auto_792202 ) ) ( not ( = ?auto_792198 ?auto_792203 ) ) ( not ( = ?auto_792198 ?auto_792204 ) ) ( not ( = ?auto_792198 ?auto_792205 ) ) ( not ( = ?auto_792199 ?auto_792200 ) ) ( not ( = ?auto_792199 ?auto_792201 ) ) ( not ( = ?auto_792199 ?auto_792202 ) ) ( not ( = ?auto_792199 ?auto_792203 ) ) ( not ( = ?auto_792199 ?auto_792204 ) ) ( not ( = ?auto_792199 ?auto_792205 ) ) ( not ( = ?auto_792200 ?auto_792201 ) ) ( not ( = ?auto_792200 ?auto_792202 ) ) ( not ( = ?auto_792200 ?auto_792203 ) ) ( not ( = ?auto_792200 ?auto_792204 ) ) ( not ( = ?auto_792200 ?auto_792205 ) ) ( not ( = ?auto_792201 ?auto_792202 ) ) ( not ( = ?auto_792201 ?auto_792203 ) ) ( not ( = ?auto_792201 ?auto_792204 ) ) ( not ( = ?auto_792201 ?auto_792205 ) ) ( not ( = ?auto_792202 ?auto_792203 ) ) ( not ( = ?auto_792202 ?auto_792204 ) ) ( not ( = ?auto_792202 ?auto_792205 ) ) ( not ( = ?auto_792203 ?auto_792204 ) ) ( not ( = ?auto_792203 ?auto_792205 ) ) ( not ( = ?auto_792204 ?auto_792205 ) ) ( ON ?auto_792204 ?auto_792205 ) ( ON ?auto_792203 ?auto_792204 ) ( ON ?auto_792202 ?auto_792203 ) ( ON ?auto_792201 ?auto_792202 ) ( ON ?auto_792200 ?auto_792201 ) ( ON ?auto_792199 ?auto_792200 ) ( ON ?auto_792198 ?auto_792199 ) ( ON ?auto_792197 ?auto_792198 ) ( ON ?auto_792196 ?auto_792197 ) ( ON ?auto_792195 ?auto_792196 ) ( ON ?auto_792194 ?auto_792195 ) ( ON ?auto_792193 ?auto_792194 ) ( ON ?auto_792192 ?auto_792193 ) ( CLEAR ?auto_792190 ) ( ON ?auto_792191 ?auto_792192 ) ( CLEAR ?auto_792191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_792188 ?auto_792189 ?auto_792190 ?auto_792191 )
      ( MAKE-18PILE ?auto_792188 ?auto_792189 ?auto_792190 ?auto_792191 ?auto_792192 ?auto_792193 ?auto_792194 ?auto_792195 ?auto_792196 ?auto_792197 ?auto_792198 ?auto_792199 ?auto_792200 ?auto_792201 ?auto_792202 ?auto_792203 ?auto_792204 ?auto_792205 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792224 - BLOCK
      ?auto_792225 - BLOCK
      ?auto_792226 - BLOCK
      ?auto_792227 - BLOCK
      ?auto_792228 - BLOCK
      ?auto_792229 - BLOCK
      ?auto_792230 - BLOCK
      ?auto_792231 - BLOCK
      ?auto_792232 - BLOCK
      ?auto_792233 - BLOCK
      ?auto_792234 - BLOCK
      ?auto_792235 - BLOCK
      ?auto_792236 - BLOCK
      ?auto_792237 - BLOCK
      ?auto_792238 - BLOCK
      ?auto_792239 - BLOCK
      ?auto_792240 - BLOCK
      ?auto_792241 - BLOCK
    )
    :vars
    (
      ?auto_792242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792241 ?auto_792242 ) ( ON-TABLE ?auto_792224 ) ( ON ?auto_792225 ?auto_792224 ) ( not ( = ?auto_792224 ?auto_792225 ) ) ( not ( = ?auto_792224 ?auto_792226 ) ) ( not ( = ?auto_792224 ?auto_792227 ) ) ( not ( = ?auto_792224 ?auto_792228 ) ) ( not ( = ?auto_792224 ?auto_792229 ) ) ( not ( = ?auto_792224 ?auto_792230 ) ) ( not ( = ?auto_792224 ?auto_792231 ) ) ( not ( = ?auto_792224 ?auto_792232 ) ) ( not ( = ?auto_792224 ?auto_792233 ) ) ( not ( = ?auto_792224 ?auto_792234 ) ) ( not ( = ?auto_792224 ?auto_792235 ) ) ( not ( = ?auto_792224 ?auto_792236 ) ) ( not ( = ?auto_792224 ?auto_792237 ) ) ( not ( = ?auto_792224 ?auto_792238 ) ) ( not ( = ?auto_792224 ?auto_792239 ) ) ( not ( = ?auto_792224 ?auto_792240 ) ) ( not ( = ?auto_792224 ?auto_792241 ) ) ( not ( = ?auto_792224 ?auto_792242 ) ) ( not ( = ?auto_792225 ?auto_792226 ) ) ( not ( = ?auto_792225 ?auto_792227 ) ) ( not ( = ?auto_792225 ?auto_792228 ) ) ( not ( = ?auto_792225 ?auto_792229 ) ) ( not ( = ?auto_792225 ?auto_792230 ) ) ( not ( = ?auto_792225 ?auto_792231 ) ) ( not ( = ?auto_792225 ?auto_792232 ) ) ( not ( = ?auto_792225 ?auto_792233 ) ) ( not ( = ?auto_792225 ?auto_792234 ) ) ( not ( = ?auto_792225 ?auto_792235 ) ) ( not ( = ?auto_792225 ?auto_792236 ) ) ( not ( = ?auto_792225 ?auto_792237 ) ) ( not ( = ?auto_792225 ?auto_792238 ) ) ( not ( = ?auto_792225 ?auto_792239 ) ) ( not ( = ?auto_792225 ?auto_792240 ) ) ( not ( = ?auto_792225 ?auto_792241 ) ) ( not ( = ?auto_792225 ?auto_792242 ) ) ( not ( = ?auto_792226 ?auto_792227 ) ) ( not ( = ?auto_792226 ?auto_792228 ) ) ( not ( = ?auto_792226 ?auto_792229 ) ) ( not ( = ?auto_792226 ?auto_792230 ) ) ( not ( = ?auto_792226 ?auto_792231 ) ) ( not ( = ?auto_792226 ?auto_792232 ) ) ( not ( = ?auto_792226 ?auto_792233 ) ) ( not ( = ?auto_792226 ?auto_792234 ) ) ( not ( = ?auto_792226 ?auto_792235 ) ) ( not ( = ?auto_792226 ?auto_792236 ) ) ( not ( = ?auto_792226 ?auto_792237 ) ) ( not ( = ?auto_792226 ?auto_792238 ) ) ( not ( = ?auto_792226 ?auto_792239 ) ) ( not ( = ?auto_792226 ?auto_792240 ) ) ( not ( = ?auto_792226 ?auto_792241 ) ) ( not ( = ?auto_792226 ?auto_792242 ) ) ( not ( = ?auto_792227 ?auto_792228 ) ) ( not ( = ?auto_792227 ?auto_792229 ) ) ( not ( = ?auto_792227 ?auto_792230 ) ) ( not ( = ?auto_792227 ?auto_792231 ) ) ( not ( = ?auto_792227 ?auto_792232 ) ) ( not ( = ?auto_792227 ?auto_792233 ) ) ( not ( = ?auto_792227 ?auto_792234 ) ) ( not ( = ?auto_792227 ?auto_792235 ) ) ( not ( = ?auto_792227 ?auto_792236 ) ) ( not ( = ?auto_792227 ?auto_792237 ) ) ( not ( = ?auto_792227 ?auto_792238 ) ) ( not ( = ?auto_792227 ?auto_792239 ) ) ( not ( = ?auto_792227 ?auto_792240 ) ) ( not ( = ?auto_792227 ?auto_792241 ) ) ( not ( = ?auto_792227 ?auto_792242 ) ) ( not ( = ?auto_792228 ?auto_792229 ) ) ( not ( = ?auto_792228 ?auto_792230 ) ) ( not ( = ?auto_792228 ?auto_792231 ) ) ( not ( = ?auto_792228 ?auto_792232 ) ) ( not ( = ?auto_792228 ?auto_792233 ) ) ( not ( = ?auto_792228 ?auto_792234 ) ) ( not ( = ?auto_792228 ?auto_792235 ) ) ( not ( = ?auto_792228 ?auto_792236 ) ) ( not ( = ?auto_792228 ?auto_792237 ) ) ( not ( = ?auto_792228 ?auto_792238 ) ) ( not ( = ?auto_792228 ?auto_792239 ) ) ( not ( = ?auto_792228 ?auto_792240 ) ) ( not ( = ?auto_792228 ?auto_792241 ) ) ( not ( = ?auto_792228 ?auto_792242 ) ) ( not ( = ?auto_792229 ?auto_792230 ) ) ( not ( = ?auto_792229 ?auto_792231 ) ) ( not ( = ?auto_792229 ?auto_792232 ) ) ( not ( = ?auto_792229 ?auto_792233 ) ) ( not ( = ?auto_792229 ?auto_792234 ) ) ( not ( = ?auto_792229 ?auto_792235 ) ) ( not ( = ?auto_792229 ?auto_792236 ) ) ( not ( = ?auto_792229 ?auto_792237 ) ) ( not ( = ?auto_792229 ?auto_792238 ) ) ( not ( = ?auto_792229 ?auto_792239 ) ) ( not ( = ?auto_792229 ?auto_792240 ) ) ( not ( = ?auto_792229 ?auto_792241 ) ) ( not ( = ?auto_792229 ?auto_792242 ) ) ( not ( = ?auto_792230 ?auto_792231 ) ) ( not ( = ?auto_792230 ?auto_792232 ) ) ( not ( = ?auto_792230 ?auto_792233 ) ) ( not ( = ?auto_792230 ?auto_792234 ) ) ( not ( = ?auto_792230 ?auto_792235 ) ) ( not ( = ?auto_792230 ?auto_792236 ) ) ( not ( = ?auto_792230 ?auto_792237 ) ) ( not ( = ?auto_792230 ?auto_792238 ) ) ( not ( = ?auto_792230 ?auto_792239 ) ) ( not ( = ?auto_792230 ?auto_792240 ) ) ( not ( = ?auto_792230 ?auto_792241 ) ) ( not ( = ?auto_792230 ?auto_792242 ) ) ( not ( = ?auto_792231 ?auto_792232 ) ) ( not ( = ?auto_792231 ?auto_792233 ) ) ( not ( = ?auto_792231 ?auto_792234 ) ) ( not ( = ?auto_792231 ?auto_792235 ) ) ( not ( = ?auto_792231 ?auto_792236 ) ) ( not ( = ?auto_792231 ?auto_792237 ) ) ( not ( = ?auto_792231 ?auto_792238 ) ) ( not ( = ?auto_792231 ?auto_792239 ) ) ( not ( = ?auto_792231 ?auto_792240 ) ) ( not ( = ?auto_792231 ?auto_792241 ) ) ( not ( = ?auto_792231 ?auto_792242 ) ) ( not ( = ?auto_792232 ?auto_792233 ) ) ( not ( = ?auto_792232 ?auto_792234 ) ) ( not ( = ?auto_792232 ?auto_792235 ) ) ( not ( = ?auto_792232 ?auto_792236 ) ) ( not ( = ?auto_792232 ?auto_792237 ) ) ( not ( = ?auto_792232 ?auto_792238 ) ) ( not ( = ?auto_792232 ?auto_792239 ) ) ( not ( = ?auto_792232 ?auto_792240 ) ) ( not ( = ?auto_792232 ?auto_792241 ) ) ( not ( = ?auto_792232 ?auto_792242 ) ) ( not ( = ?auto_792233 ?auto_792234 ) ) ( not ( = ?auto_792233 ?auto_792235 ) ) ( not ( = ?auto_792233 ?auto_792236 ) ) ( not ( = ?auto_792233 ?auto_792237 ) ) ( not ( = ?auto_792233 ?auto_792238 ) ) ( not ( = ?auto_792233 ?auto_792239 ) ) ( not ( = ?auto_792233 ?auto_792240 ) ) ( not ( = ?auto_792233 ?auto_792241 ) ) ( not ( = ?auto_792233 ?auto_792242 ) ) ( not ( = ?auto_792234 ?auto_792235 ) ) ( not ( = ?auto_792234 ?auto_792236 ) ) ( not ( = ?auto_792234 ?auto_792237 ) ) ( not ( = ?auto_792234 ?auto_792238 ) ) ( not ( = ?auto_792234 ?auto_792239 ) ) ( not ( = ?auto_792234 ?auto_792240 ) ) ( not ( = ?auto_792234 ?auto_792241 ) ) ( not ( = ?auto_792234 ?auto_792242 ) ) ( not ( = ?auto_792235 ?auto_792236 ) ) ( not ( = ?auto_792235 ?auto_792237 ) ) ( not ( = ?auto_792235 ?auto_792238 ) ) ( not ( = ?auto_792235 ?auto_792239 ) ) ( not ( = ?auto_792235 ?auto_792240 ) ) ( not ( = ?auto_792235 ?auto_792241 ) ) ( not ( = ?auto_792235 ?auto_792242 ) ) ( not ( = ?auto_792236 ?auto_792237 ) ) ( not ( = ?auto_792236 ?auto_792238 ) ) ( not ( = ?auto_792236 ?auto_792239 ) ) ( not ( = ?auto_792236 ?auto_792240 ) ) ( not ( = ?auto_792236 ?auto_792241 ) ) ( not ( = ?auto_792236 ?auto_792242 ) ) ( not ( = ?auto_792237 ?auto_792238 ) ) ( not ( = ?auto_792237 ?auto_792239 ) ) ( not ( = ?auto_792237 ?auto_792240 ) ) ( not ( = ?auto_792237 ?auto_792241 ) ) ( not ( = ?auto_792237 ?auto_792242 ) ) ( not ( = ?auto_792238 ?auto_792239 ) ) ( not ( = ?auto_792238 ?auto_792240 ) ) ( not ( = ?auto_792238 ?auto_792241 ) ) ( not ( = ?auto_792238 ?auto_792242 ) ) ( not ( = ?auto_792239 ?auto_792240 ) ) ( not ( = ?auto_792239 ?auto_792241 ) ) ( not ( = ?auto_792239 ?auto_792242 ) ) ( not ( = ?auto_792240 ?auto_792241 ) ) ( not ( = ?auto_792240 ?auto_792242 ) ) ( not ( = ?auto_792241 ?auto_792242 ) ) ( ON ?auto_792240 ?auto_792241 ) ( ON ?auto_792239 ?auto_792240 ) ( ON ?auto_792238 ?auto_792239 ) ( ON ?auto_792237 ?auto_792238 ) ( ON ?auto_792236 ?auto_792237 ) ( ON ?auto_792235 ?auto_792236 ) ( ON ?auto_792234 ?auto_792235 ) ( ON ?auto_792233 ?auto_792234 ) ( ON ?auto_792232 ?auto_792233 ) ( ON ?auto_792231 ?auto_792232 ) ( ON ?auto_792230 ?auto_792231 ) ( ON ?auto_792229 ?auto_792230 ) ( ON ?auto_792228 ?auto_792229 ) ( ON ?auto_792227 ?auto_792228 ) ( CLEAR ?auto_792225 ) ( ON ?auto_792226 ?auto_792227 ) ( CLEAR ?auto_792226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_792224 ?auto_792225 ?auto_792226 )
      ( MAKE-18PILE ?auto_792224 ?auto_792225 ?auto_792226 ?auto_792227 ?auto_792228 ?auto_792229 ?auto_792230 ?auto_792231 ?auto_792232 ?auto_792233 ?auto_792234 ?auto_792235 ?auto_792236 ?auto_792237 ?auto_792238 ?auto_792239 ?auto_792240 ?auto_792241 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792261 - BLOCK
      ?auto_792262 - BLOCK
      ?auto_792263 - BLOCK
      ?auto_792264 - BLOCK
      ?auto_792265 - BLOCK
      ?auto_792266 - BLOCK
      ?auto_792267 - BLOCK
      ?auto_792268 - BLOCK
      ?auto_792269 - BLOCK
      ?auto_792270 - BLOCK
      ?auto_792271 - BLOCK
      ?auto_792272 - BLOCK
      ?auto_792273 - BLOCK
      ?auto_792274 - BLOCK
      ?auto_792275 - BLOCK
      ?auto_792276 - BLOCK
      ?auto_792277 - BLOCK
      ?auto_792278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_792278 ) ( ON-TABLE ?auto_792261 ) ( ON ?auto_792262 ?auto_792261 ) ( not ( = ?auto_792261 ?auto_792262 ) ) ( not ( = ?auto_792261 ?auto_792263 ) ) ( not ( = ?auto_792261 ?auto_792264 ) ) ( not ( = ?auto_792261 ?auto_792265 ) ) ( not ( = ?auto_792261 ?auto_792266 ) ) ( not ( = ?auto_792261 ?auto_792267 ) ) ( not ( = ?auto_792261 ?auto_792268 ) ) ( not ( = ?auto_792261 ?auto_792269 ) ) ( not ( = ?auto_792261 ?auto_792270 ) ) ( not ( = ?auto_792261 ?auto_792271 ) ) ( not ( = ?auto_792261 ?auto_792272 ) ) ( not ( = ?auto_792261 ?auto_792273 ) ) ( not ( = ?auto_792261 ?auto_792274 ) ) ( not ( = ?auto_792261 ?auto_792275 ) ) ( not ( = ?auto_792261 ?auto_792276 ) ) ( not ( = ?auto_792261 ?auto_792277 ) ) ( not ( = ?auto_792261 ?auto_792278 ) ) ( not ( = ?auto_792262 ?auto_792263 ) ) ( not ( = ?auto_792262 ?auto_792264 ) ) ( not ( = ?auto_792262 ?auto_792265 ) ) ( not ( = ?auto_792262 ?auto_792266 ) ) ( not ( = ?auto_792262 ?auto_792267 ) ) ( not ( = ?auto_792262 ?auto_792268 ) ) ( not ( = ?auto_792262 ?auto_792269 ) ) ( not ( = ?auto_792262 ?auto_792270 ) ) ( not ( = ?auto_792262 ?auto_792271 ) ) ( not ( = ?auto_792262 ?auto_792272 ) ) ( not ( = ?auto_792262 ?auto_792273 ) ) ( not ( = ?auto_792262 ?auto_792274 ) ) ( not ( = ?auto_792262 ?auto_792275 ) ) ( not ( = ?auto_792262 ?auto_792276 ) ) ( not ( = ?auto_792262 ?auto_792277 ) ) ( not ( = ?auto_792262 ?auto_792278 ) ) ( not ( = ?auto_792263 ?auto_792264 ) ) ( not ( = ?auto_792263 ?auto_792265 ) ) ( not ( = ?auto_792263 ?auto_792266 ) ) ( not ( = ?auto_792263 ?auto_792267 ) ) ( not ( = ?auto_792263 ?auto_792268 ) ) ( not ( = ?auto_792263 ?auto_792269 ) ) ( not ( = ?auto_792263 ?auto_792270 ) ) ( not ( = ?auto_792263 ?auto_792271 ) ) ( not ( = ?auto_792263 ?auto_792272 ) ) ( not ( = ?auto_792263 ?auto_792273 ) ) ( not ( = ?auto_792263 ?auto_792274 ) ) ( not ( = ?auto_792263 ?auto_792275 ) ) ( not ( = ?auto_792263 ?auto_792276 ) ) ( not ( = ?auto_792263 ?auto_792277 ) ) ( not ( = ?auto_792263 ?auto_792278 ) ) ( not ( = ?auto_792264 ?auto_792265 ) ) ( not ( = ?auto_792264 ?auto_792266 ) ) ( not ( = ?auto_792264 ?auto_792267 ) ) ( not ( = ?auto_792264 ?auto_792268 ) ) ( not ( = ?auto_792264 ?auto_792269 ) ) ( not ( = ?auto_792264 ?auto_792270 ) ) ( not ( = ?auto_792264 ?auto_792271 ) ) ( not ( = ?auto_792264 ?auto_792272 ) ) ( not ( = ?auto_792264 ?auto_792273 ) ) ( not ( = ?auto_792264 ?auto_792274 ) ) ( not ( = ?auto_792264 ?auto_792275 ) ) ( not ( = ?auto_792264 ?auto_792276 ) ) ( not ( = ?auto_792264 ?auto_792277 ) ) ( not ( = ?auto_792264 ?auto_792278 ) ) ( not ( = ?auto_792265 ?auto_792266 ) ) ( not ( = ?auto_792265 ?auto_792267 ) ) ( not ( = ?auto_792265 ?auto_792268 ) ) ( not ( = ?auto_792265 ?auto_792269 ) ) ( not ( = ?auto_792265 ?auto_792270 ) ) ( not ( = ?auto_792265 ?auto_792271 ) ) ( not ( = ?auto_792265 ?auto_792272 ) ) ( not ( = ?auto_792265 ?auto_792273 ) ) ( not ( = ?auto_792265 ?auto_792274 ) ) ( not ( = ?auto_792265 ?auto_792275 ) ) ( not ( = ?auto_792265 ?auto_792276 ) ) ( not ( = ?auto_792265 ?auto_792277 ) ) ( not ( = ?auto_792265 ?auto_792278 ) ) ( not ( = ?auto_792266 ?auto_792267 ) ) ( not ( = ?auto_792266 ?auto_792268 ) ) ( not ( = ?auto_792266 ?auto_792269 ) ) ( not ( = ?auto_792266 ?auto_792270 ) ) ( not ( = ?auto_792266 ?auto_792271 ) ) ( not ( = ?auto_792266 ?auto_792272 ) ) ( not ( = ?auto_792266 ?auto_792273 ) ) ( not ( = ?auto_792266 ?auto_792274 ) ) ( not ( = ?auto_792266 ?auto_792275 ) ) ( not ( = ?auto_792266 ?auto_792276 ) ) ( not ( = ?auto_792266 ?auto_792277 ) ) ( not ( = ?auto_792266 ?auto_792278 ) ) ( not ( = ?auto_792267 ?auto_792268 ) ) ( not ( = ?auto_792267 ?auto_792269 ) ) ( not ( = ?auto_792267 ?auto_792270 ) ) ( not ( = ?auto_792267 ?auto_792271 ) ) ( not ( = ?auto_792267 ?auto_792272 ) ) ( not ( = ?auto_792267 ?auto_792273 ) ) ( not ( = ?auto_792267 ?auto_792274 ) ) ( not ( = ?auto_792267 ?auto_792275 ) ) ( not ( = ?auto_792267 ?auto_792276 ) ) ( not ( = ?auto_792267 ?auto_792277 ) ) ( not ( = ?auto_792267 ?auto_792278 ) ) ( not ( = ?auto_792268 ?auto_792269 ) ) ( not ( = ?auto_792268 ?auto_792270 ) ) ( not ( = ?auto_792268 ?auto_792271 ) ) ( not ( = ?auto_792268 ?auto_792272 ) ) ( not ( = ?auto_792268 ?auto_792273 ) ) ( not ( = ?auto_792268 ?auto_792274 ) ) ( not ( = ?auto_792268 ?auto_792275 ) ) ( not ( = ?auto_792268 ?auto_792276 ) ) ( not ( = ?auto_792268 ?auto_792277 ) ) ( not ( = ?auto_792268 ?auto_792278 ) ) ( not ( = ?auto_792269 ?auto_792270 ) ) ( not ( = ?auto_792269 ?auto_792271 ) ) ( not ( = ?auto_792269 ?auto_792272 ) ) ( not ( = ?auto_792269 ?auto_792273 ) ) ( not ( = ?auto_792269 ?auto_792274 ) ) ( not ( = ?auto_792269 ?auto_792275 ) ) ( not ( = ?auto_792269 ?auto_792276 ) ) ( not ( = ?auto_792269 ?auto_792277 ) ) ( not ( = ?auto_792269 ?auto_792278 ) ) ( not ( = ?auto_792270 ?auto_792271 ) ) ( not ( = ?auto_792270 ?auto_792272 ) ) ( not ( = ?auto_792270 ?auto_792273 ) ) ( not ( = ?auto_792270 ?auto_792274 ) ) ( not ( = ?auto_792270 ?auto_792275 ) ) ( not ( = ?auto_792270 ?auto_792276 ) ) ( not ( = ?auto_792270 ?auto_792277 ) ) ( not ( = ?auto_792270 ?auto_792278 ) ) ( not ( = ?auto_792271 ?auto_792272 ) ) ( not ( = ?auto_792271 ?auto_792273 ) ) ( not ( = ?auto_792271 ?auto_792274 ) ) ( not ( = ?auto_792271 ?auto_792275 ) ) ( not ( = ?auto_792271 ?auto_792276 ) ) ( not ( = ?auto_792271 ?auto_792277 ) ) ( not ( = ?auto_792271 ?auto_792278 ) ) ( not ( = ?auto_792272 ?auto_792273 ) ) ( not ( = ?auto_792272 ?auto_792274 ) ) ( not ( = ?auto_792272 ?auto_792275 ) ) ( not ( = ?auto_792272 ?auto_792276 ) ) ( not ( = ?auto_792272 ?auto_792277 ) ) ( not ( = ?auto_792272 ?auto_792278 ) ) ( not ( = ?auto_792273 ?auto_792274 ) ) ( not ( = ?auto_792273 ?auto_792275 ) ) ( not ( = ?auto_792273 ?auto_792276 ) ) ( not ( = ?auto_792273 ?auto_792277 ) ) ( not ( = ?auto_792273 ?auto_792278 ) ) ( not ( = ?auto_792274 ?auto_792275 ) ) ( not ( = ?auto_792274 ?auto_792276 ) ) ( not ( = ?auto_792274 ?auto_792277 ) ) ( not ( = ?auto_792274 ?auto_792278 ) ) ( not ( = ?auto_792275 ?auto_792276 ) ) ( not ( = ?auto_792275 ?auto_792277 ) ) ( not ( = ?auto_792275 ?auto_792278 ) ) ( not ( = ?auto_792276 ?auto_792277 ) ) ( not ( = ?auto_792276 ?auto_792278 ) ) ( not ( = ?auto_792277 ?auto_792278 ) ) ( ON ?auto_792277 ?auto_792278 ) ( ON ?auto_792276 ?auto_792277 ) ( ON ?auto_792275 ?auto_792276 ) ( ON ?auto_792274 ?auto_792275 ) ( ON ?auto_792273 ?auto_792274 ) ( ON ?auto_792272 ?auto_792273 ) ( ON ?auto_792271 ?auto_792272 ) ( ON ?auto_792270 ?auto_792271 ) ( ON ?auto_792269 ?auto_792270 ) ( ON ?auto_792268 ?auto_792269 ) ( ON ?auto_792267 ?auto_792268 ) ( ON ?auto_792266 ?auto_792267 ) ( ON ?auto_792265 ?auto_792266 ) ( ON ?auto_792264 ?auto_792265 ) ( CLEAR ?auto_792262 ) ( ON ?auto_792263 ?auto_792264 ) ( CLEAR ?auto_792263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_792261 ?auto_792262 ?auto_792263 )
      ( MAKE-18PILE ?auto_792261 ?auto_792262 ?auto_792263 ?auto_792264 ?auto_792265 ?auto_792266 ?auto_792267 ?auto_792268 ?auto_792269 ?auto_792270 ?auto_792271 ?auto_792272 ?auto_792273 ?auto_792274 ?auto_792275 ?auto_792276 ?auto_792277 ?auto_792278 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792297 - BLOCK
      ?auto_792298 - BLOCK
      ?auto_792299 - BLOCK
      ?auto_792300 - BLOCK
      ?auto_792301 - BLOCK
      ?auto_792302 - BLOCK
      ?auto_792303 - BLOCK
      ?auto_792304 - BLOCK
      ?auto_792305 - BLOCK
      ?auto_792306 - BLOCK
      ?auto_792307 - BLOCK
      ?auto_792308 - BLOCK
      ?auto_792309 - BLOCK
      ?auto_792310 - BLOCK
      ?auto_792311 - BLOCK
      ?auto_792312 - BLOCK
      ?auto_792313 - BLOCK
      ?auto_792314 - BLOCK
    )
    :vars
    (
      ?auto_792315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792314 ?auto_792315 ) ( ON-TABLE ?auto_792297 ) ( not ( = ?auto_792297 ?auto_792298 ) ) ( not ( = ?auto_792297 ?auto_792299 ) ) ( not ( = ?auto_792297 ?auto_792300 ) ) ( not ( = ?auto_792297 ?auto_792301 ) ) ( not ( = ?auto_792297 ?auto_792302 ) ) ( not ( = ?auto_792297 ?auto_792303 ) ) ( not ( = ?auto_792297 ?auto_792304 ) ) ( not ( = ?auto_792297 ?auto_792305 ) ) ( not ( = ?auto_792297 ?auto_792306 ) ) ( not ( = ?auto_792297 ?auto_792307 ) ) ( not ( = ?auto_792297 ?auto_792308 ) ) ( not ( = ?auto_792297 ?auto_792309 ) ) ( not ( = ?auto_792297 ?auto_792310 ) ) ( not ( = ?auto_792297 ?auto_792311 ) ) ( not ( = ?auto_792297 ?auto_792312 ) ) ( not ( = ?auto_792297 ?auto_792313 ) ) ( not ( = ?auto_792297 ?auto_792314 ) ) ( not ( = ?auto_792297 ?auto_792315 ) ) ( not ( = ?auto_792298 ?auto_792299 ) ) ( not ( = ?auto_792298 ?auto_792300 ) ) ( not ( = ?auto_792298 ?auto_792301 ) ) ( not ( = ?auto_792298 ?auto_792302 ) ) ( not ( = ?auto_792298 ?auto_792303 ) ) ( not ( = ?auto_792298 ?auto_792304 ) ) ( not ( = ?auto_792298 ?auto_792305 ) ) ( not ( = ?auto_792298 ?auto_792306 ) ) ( not ( = ?auto_792298 ?auto_792307 ) ) ( not ( = ?auto_792298 ?auto_792308 ) ) ( not ( = ?auto_792298 ?auto_792309 ) ) ( not ( = ?auto_792298 ?auto_792310 ) ) ( not ( = ?auto_792298 ?auto_792311 ) ) ( not ( = ?auto_792298 ?auto_792312 ) ) ( not ( = ?auto_792298 ?auto_792313 ) ) ( not ( = ?auto_792298 ?auto_792314 ) ) ( not ( = ?auto_792298 ?auto_792315 ) ) ( not ( = ?auto_792299 ?auto_792300 ) ) ( not ( = ?auto_792299 ?auto_792301 ) ) ( not ( = ?auto_792299 ?auto_792302 ) ) ( not ( = ?auto_792299 ?auto_792303 ) ) ( not ( = ?auto_792299 ?auto_792304 ) ) ( not ( = ?auto_792299 ?auto_792305 ) ) ( not ( = ?auto_792299 ?auto_792306 ) ) ( not ( = ?auto_792299 ?auto_792307 ) ) ( not ( = ?auto_792299 ?auto_792308 ) ) ( not ( = ?auto_792299 ?auto_792309 ) ) ( not ( = ?auto_792299 ?auto_792310 ) ) ( not ( = ?auto_792299 ?auto_792311 ) ) ( not ( = ?auto_792299 ?auto_792312 ) ) ( not ( = ?auto_792299 ?auto_792313 ) ) ( not ( = ?auto_792299 ?auto_792314 ) ) ( not ( = ?auto_792299 ?auto_792315 ) ) ( not ( = ?auto_792300 ?auto_792301 ) ) ( not ( = ?auto_792300 ?auto_792302 ) ) ( not ( = ?auto_792300 ?auto_792303 ) ) ( not ( = ?auto_792300 ?auto_792304 ) ) ( not ( = ?auto_792300 ?auto_792305 ) ) ( not ( = ?auto_792300 ?auto_792306 ) ) ( not ( = ?auto_792300 ?auto_792307 ) ) ( not ( = ?auto_792300 ?auto_792308 ) ) ( not ( = ?auto_792300 ?auto_792309 ) ) ( not ( = ?auto_792300 ?auto_792310 ) ) ( not ( = ?auto_792300 ?auto_792311 ) ) ( not ( = ?auto_792300 ?auto_792312 ) ) ( not ( = ?auto_792300 ?auto_792313 ) ) ( not ( = ?auto_792300 ?auto_792314 ) ) ( not ( = ?auto_792300 ?auto_792315 ) ) ( not ( = ?auto_792301 ?auto_792302 ) ) ( not ( = ?auto_792301 ?auto_792303 ) ) ( not ( = ?auto_792301 ?auto_792304 ) ) ( not ( = ?auto_792301 ?auto_792305 ) ) ( not ( = ?auto_792301 ?auto_792306 ) ) ( not ( = ?auto_792301 ?auto_792307 ) ) ( not ( = ?auto_792301 ?auto_792308 ) ) ( not ( = ?auto_792301 ?auto_792309 ) ) ( not ( = ?auto_792301 ?auto_792310 ) ) ( not ( = ?auto_792301 ?auto_792311 ) ) ( not ( = ?auto_792301 ?auto_792312 ) ) ( not ( = ?auto_792301 ?auto_792313 ) ) ( not ( = ?auto_792301 ?auto_792314 ) ) ( not ( = ?auto_792301 ?auto_792315 ) ) ( not ( = ?auto_792302 ?auto_792303 ) ) ( not ( = ?auto_792302 ?auto_792304 ) ) ( not ( = ?auto_792302 ?auto_792305 ) ) ( not ( = ?auto_792302 ?auto_792306 ) ) ( not ( = ?auto_792302 ?auto_792307 ) ) ( not ( = ?auto_792302 ?auto_792308 ) ) ( not ( = ?auto_792302 ?auto_792309 ) ) ( not ( = ?auto_792302 ?auto_792310 ) ) ( not ( = ?auto_792302 ?auto_792311 ) ) ( not ( = ?auto_792302 ?auto_792312 ) ) ( not ( = ?auto_792302 ?auto_792313 ) ) ( not ( = ?auto_792302 ?auto_792314 ) ) ( not ( = ?auto_792302 ?auto_792315 ) ) ( not ( = ?auto_792303 ?auto_792304 ) ) ( not ( = ?auto_792303 ?auto_792305 ) ) ( not ( = ?auto_792303 ?auto_792306 ) ) ( not ( = ?auto_792303 ?auto_792307 ) ) ( not ( = ?auto_792303 ?auto_792308 ) ) ( not ( = ?auto_792303 ?auto_792309 ) ) ( not ( = ?auto_792303 ?auto_792310 ) ) ( not ( = ?auto_792303 ?auto_792311 ) ) ( not ( = ?auto_792303 ?auto_792312 ) ) ( not ( = ?auto_792303 ?auto_792313 ) ) ( not ( = ?auto_792303 ?auto_792314 ) ) ( not ( = ?auto_792303 ?auto_792315 ) ) ( not ( = ?auto_792304 ?auto_792305 ) ) ( not ( = ?auto_792304 ?auto_792306 ) ) ( not ( = ?auto_792304 ?auto_792307 ) ) ( not ( = ?auto_792304 ?auto_792308 ) ) ( not ( = ?auto_792304 ?auto_792309 ) ) ( not ( = ?auto_792304 ?auto_792310 ) ) ( not ( = ?auto_792304 ?auto_792311 ) ) ( not ( = ?auto_792304 ?auto_792312 ) ) ( not ( = ?auto_792304 ?auto_792313 ) ) ( not ( = ?auto_792304 ?auto_792314 ) ) ( not ( = ?auto_792304 ?auto_792315 ) ) ( not ( = ?auto_792305 ?auto_792306 ) ) ( not ( = ?auto_792305 ?auto_792307 ) ) ( not ( = ?auto_792305 ?auto_792308 ) ) ( not ( = ?auto_792305 ?auto_792309 ) ) ( not ( = ?auto_792305 ?auto_792310 ) ) ( not ( = ?auto_792305 ?auto_792311 ) ) ( not ( = ?auto_792305 ?auto_792312 ) ) ( not ( = ?auto_792305 ?auto_792313 ) ) ( not ( = ?auto_792305 ?auto_792314 ) ) ( not ( = ?auto_792305 ?auto_792315 ) ) ( not ( = ?auto_792306 ?auto_792307 ) ) ( not ( = ?auto_792306 ?auto_792308 ) ) ( not ( = ?auto_792306 ?auto_792309 ) ) ( not ( = ?auto_792306 ?auto_792310 ) ) ( not ( = ?auto_792306 ?auto_792311 ) ) ( not ( = ?auto_792306 ?auto_792312 ) ) ( not ( = ?auto_792306 ?auto_792313 ) ) ( not ( = ?auto_792306 ?auto_792314 ) ) ( not ( = ?auto_792306 ?auto_792315 ) ) ( not ( = ?auto_792307 ?auto_792308 ) ) ( not ( = ?auto_792307 ?auto_792309 ) ) ( not ( = ?auto_792307 ?auto_792310 ) ) ( not ( = ?auto_792307 ?auto_792311 ) ) ( not ( = ?auto_792307 ?auto_792312 ) ) ( not ( = ?auto_792307 ?auto_792313 ) ) ( not ( = ?auto_792307 ?auto_792314 ) ) ( not ( = ?auto_792307 ?auto_792315 ) ) ( not ( = ?auto_792308 ?auto_792309 ) ) ( not ( = ?auto_792308 ?auto_792310 ) ) ( not ( = ?auto_792308 ?auto_792311 ) ) ( not ( = ?auto_792308 ?auto_792312 ) ) ( not ( = ?auto_792308 ?auto_792313 ) ) ( not ( = ?auto_792308 ?auto_792314 ) ) ( not ( = ?auto_792308 ?auto_792315 ) ) ( not ( = ?auto_792309 ?auto_792310 ) ) ( not ( = ?auto_792309 ?auto_792311 ) ) ( not ( = ?auto_792309 ?auto_792312 ) ) ( not ( = ?auto_792309 ?auto_792313 ) ) ( not ( = ?auto_792309 ?auto_792314 ) ) ( not ( = ?auto_792309 ?auto_792315 ) ) ( not ( = ?auto_792310 ?auto_792311 ) ) ( not ( = ?auto_792310 ?auto_792312 ) ) ( not ( = ?auto_792310 ?auto_792313 ) ) ( not ( = ?auto_792310 ?auto_792314 ) ) ( not ( = ?auto_792310 ?auto_792315 ) ) ( not ( = ?auto_792311 ?auto_792312 ) ) ( not ( = ?auto_792311 ?auto_792313 ) ) ( not ( = ?auto_792311 ?auto_792314 ) ) ( not ( = ?auto_792311 ?auto_792315 ) ) ( not ( = ?auto_792312 ?auto_792313 ) ) ( not ( = ?auto_792312 ?auto_792314 ) ) ( not ( = ?auto_792312 ?auto_792315 ) ) ( not ( = ?auto_792313 ?auto_792314 ) ) ( not ( = ?auto_792313 ?auto_792315 ) ) ( not ( = ?auto_792314 ?auto_792315 ) ) ( ON ?auto_792313 ?auto_792314 ) ( ON ?auto_792312 ?auto_792313 ) ( ON ?auto_792311 ?auto_792312 ) ( ON ?auto_792310 ?auto_792311 ) ( ON ?auto_792309 ?auto_792310 ) ( ON ?auto_792308 ?auto_792309 ) ( ON ?auto_792307 ?auto_792308 ) ( ON ?auto_792306 ?auto_792307 ) ( ON ?auto_792305 ?auto_792306 ) ( ON ?auto_792304 ?auto_792305 ) ( ON ?auto_792303 ?auto_792304 ) ( ON ?auto_792302 ?auto_792303 ) ( ON ?auto_792301 ?auto_792302 ) ( ON ?auto_792300 ?auto_792301 ) ( ON ?auto_792299 ?auto_792300 ) ( CLEAR ?auto_792297 ) ( ON ?auto_792298 ?auto_792299 ) ( CLEAR ?auto_792298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_792297 ?auto_792298 )
      ( MAKE-18PILE ?auto_792297 ?auto_792298 ?auto_792299 ?auto_792300 ?auto_792301 ?auto_792302 ?auto_792303 ?auto_792304 ?auto_792305 ?auto_792306 ?auto_792307 ?auto_792308 ?auto_792309 ?auto_792310 ?auto_792311 ?auto_792312 ?auto_792313 ?auto_792314 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792334 - BLOCK
      ?auto_792335 - BLOCK
      ?auto_792336 - BLOCK
      ?auto_792337 - BLOCK
      ?auto_792338 - BLOCK
      ?auto_792339 - BLOCK
      ?auto_792340 - BLOCK
      ?auto_792341 - BLOCK
      ?auto_792342 - BLOCK
      ?auto_792343 - BLOCK
      ?auto_792344 - BLOCK
      ?auto_792345 - BLOCK
      ?auto_792346 - BLOCK
      ?auto_792347 - BLOCK
      ?auto_792348 - BLOCK
      ?auto_792349 - BLOCK
      ?auto_792350 - BLOCK
      ?auto_792351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_792351 ) ( ON-TABLE ?auto_792334 ) ( not ( = ?auto_792334 ?auto_792335 ) ) ( not ( = ?auto_792334 ?auto_792336 ) ) ( not ( = ?auto_792334 ?auto_792337 ) ) ( not ( = ?auto_792334 ?auto_792338 ) ) ( not ( = ?auto_792334 ?auto_792339 ) ) ( not ( = ?auto_792334 ?auto_792340 ) ) ( not ( = ?auto_792334 ?auto_792341 ) ) ( not ( = ?auto_792334 ?auto_792342 ) ) ( not ( = ?auto_792334 ?auto_792343 ) ) ( not ( = ?auto_792334 ?auto_792344 ) ) ( not ( = ?auto_792334 ?auto_792345 ) ) ( not ( = ?auto_792334 ?auto_792346 ) ) ( not ( = ?auto_792334 ?auto_792347 ) ) ( not ( = ?auto_792334 ?auto_792348 ) ) ( not ( = ?auto_792334 ?auto_792349 ) ) ( not ( = ?auto_792334 ?auto_792350 ) ) ( not ( = ?auto_792334 ?auto_792351 ) ) ( not ( = ?auto_792335 ?auto_792336 ) ) ( not ( = ?auto_792335 ?auto_792337 ) ) ( not ( = ?auto_792335 ?auto_792338 ) ) ( not ( = ?auto_792335 ?auto_792339 ) ) ( not ( = ?auto_792335 ?auto_792340 ) ) ( not ( = ?auto_792335 ?auto_792341 ) ) ( not ( = ?auto_792335 ?auto_792342 ) ) ( not ( = ?auto_792335 ?auto_792343 ) ) ( not ( = ?auto_792335 ?auto_792344 ) ) ( not ( = ?auto_792335 ?auto_792345 ) ) ( not ( = ?auto_792335 ?auto_792346 ) ) ( not ( = ?auto_792335 ?auto_792347 ) ) ( not ( = ?auto_792335 ?auto_792348 ) ) ( not ( = ?auto_792335 ?auto_792349 ) ) ( not ( = ?auto_792335 ?auto_792350 ) ) ( not ( = ?auto_792335 ?auto_792351 ) ) ( not ( = ?auto_792336 ?auto_792337 ) ) ( not ( = ?auto_792336 ?auto_792338 ) ) ( not ( = ?auto_792336 ?auto_792339 ) ) ( not ( = ?auto_792336 ?auto_792340 ) ) ( not ( = ?auto_792336 ?auto_792341 ) ) ( not ( = ?auto_792336 ?auto_792342 ) ) ( not ( = ?auto_792336 ?auto_792343 ) ) ( not ( = ?auto_792336 ?auto_792344 ) ) ( not ( = ?auto_792336 ?auto_792345 ) ) ( not ( = ?auto_792336 ?auto_792346 ) ) ( not ( = ?auto_792336 ?auto_792347 ) ) ( not ( = ?auto_792336 ?auto_792348 ) ) ( not ( = ?auto_792336 ?auto_792349 ) ) ( not ( = ?auto_792336 ?auto_792350 ) ) ( not ( = ?auto_792336 ?auto_792351 ) ) ( not ( = ?auto_792337 ?auto_792338 ) ) ( not ( = ?auto_792337 ?auto_792339 ) ) ( not ( = ?auto_792337 ?auto_792340 ) ) ( not ( = ?auto_792337 ?auto_792341 ) ) ( not ( = ?auto_792337 ?auto_792342 ) ) ( not ( = ?auto_792337 ?auto_792343 ) ) ( not ( = ?auto_792337 ?auto_792344 ) ) ( not ( = ?auto_792337 ?auto_792345 ) ) ( not ( = ?auto_792337 ?auto_792346 ) ) ( not ( = ?auto_792337 ?auto_792347 ) ) ( not ( = ?auto_792337 ?auto_792348 ) ) ( not ( = ?auto_792337 ?auto_792349 ) ) ( not ( = ?auto_792337 ?auto_792350 ) ) ( not ( = ?auto_792337 ?auto_792351 ) ) ( not ( = ?auto_792338 ?auto_792339 ) ) ( not ( = ?auto_792338 ?auto_792340 ) ) ( not ( = ?auto_792338 ?auto_792341 ) ) ( not ( = ?auto_792338 ?auto_792342 ) ) ( not ( = ?auto_792338 ?auto_792343 ) ) ( not ( = ?auto_792338 ?auto_792344 ) ) ( not ( = ?auto_792338 ?auto_792345 ) ) ( not ( = ?auto_792338 ?auto_792346 ) ) ( not ( = ?auto_792338 ?auto_792347 ) ) ( not ( = ?auto_792338 ?auto_792348 ) ) ( not ( = ?auto_792338 ?auto_792349 ) ) ( not ( = ?auto_792338 ?auto_792350 ) ) ( not ( = ?auto_792338 ?auto_792351 ) ) ( not ( = ?auto_792339 ?auto_792340 ) ) ( not ( = ?auto_792339 ?auto_792341 ) ) ( not ( = ?auto_792339 ?auto_792342 ) ) ( not ( = ?auto_792339 ?auto_792343 ) ) ( not ( = ?auto_792339 ?auto_792344 ) ) ( not ( = ?auto_792339 ?auto_792345 ) ) ( not ( = ?auto_792339 ?auto_792346 ) ) ( not ( = ?auto_792339 ?auto_792347 ) ) ( not ( = ?auto_792339 ?auto_792348 ) ) ( not ( = ?auto_792339 ?auto_792349 ) ) ( not ( = ?auto_792339 ?auto_792350 ) ) ( not ( = ?auto_792339 ?auto_792351 ) ) ( not ( = ?auto_792340 ?auto_792341 ) ) ( not ( = ?auto_792340 ?auto_792342 ) ) ( not ( = ?auto_792340 ?auto_792343 ) ) ( not ( = ?auto_792340 ?auto_792344 ) ) ( not ( = ?auto_792340 ?auto_792345 ) ) ( not ( = ?auto_792340 ?auto_792346 ) ) ( not ( = ?auto_792340 ?auto_792347 ) ) ( not ( = ?auto_792340 ?auto_792348 ) ) ( not ( = ?auto_792340 ?auto_792349 ) ) ( not ( = ?auto_792340 ?auto_792350 ) ) ( not ( = ?auto_792340 ?auto_792351 ) ) ( not ( = ?auto_792341 ?auto_792342 ) ) ( not ( = ?auto_792341 ?auto_792343 ) ) ( not ( = ?auto_792341 ?auto_792344 ) ) ( not ( = ?auto_792341 ?auto_792345 ) ) ( not ( = ?auto_792341 ?auto_792346 ) ) ( not ( = ?auto_792341 ?auto_792347 ) ) ( not ( = ?auto_792341 ?auto_792348 ) ) ( not ( = ?auto_792341 ?auto_792349 ) ) ( not ( = ?auto_792341 ?auto_792350 ) ) ( not ( = ?auto_792341 ?auto_792351 ) ) ( not ( = ?auto_792342 ?auto_792343 ) ) ( not ( = ?auto_792342 ?auto_792344 ) ) ( not ( = ?auto_792342 ?auto_792345 ) ) ( not ( = ?auto_792342 ?auto_792346 ) ) ( not ( = ?auto_792342 ?auto_792347 ) ) ( not ( = ?auto_792342 ?auto_792348 ) ) ( not ( = ?auto_792342 ?auto_792349 ) ) ( not ( = ?auto_792342 ?auto_792350 ) ) ( not ( = ?auto_792342 ?auto_792351 ) ) ( not ( = ?auto_792343 ?auto_792344 ) ) ( not ( = ?auto_792343 ?auto_792345 ) ) ( not ( = ?auto_792343 ?auto_792346 ) ) ( not ( = ?auto_792343 ?auto_792347 ) ) ( not ( = ?auto_792343 ?auto_792348 ) ) ( not ( = ?auto_792343 ?auto_792349 ) ) ( not ( = ?auto_792343 ?auto_792350 ) ) ( not ( = ?auto_792343 ?auto_792351 ) ) ( not ( = ?auto_792344 ?auto_792345 ) ) ( not ( = ?auto_792344 ?auto_792346 ) ) ( not ( = ?auto_792344 ?auto_792347 ) ) ( not ( = ?auto_792344 ?auto_792348 ) ) ( not ( = ?auto_792344 ?auto_792349 ) ) ( not ( = ?auto_792344 ?auto_792350 ) ) ( not ( = ?auto_792344 ?auto_792351 ) ) ( not ( = ?auto_792345 ?auto_792346 ) ) ( not ( = ?auto_792345 ?auto_792347 ) ) ( not ( = ?auto_792345 ?auto_792348 ) ) ( not ( = ?auto_792345 ?auto_792349 ) ) ( not ( = ?auto_792345 ?auto_792350 ) ) ( not ( = ?auto_792345 ?auto_792351 ) ) ( not ( = ?auto_792346 ?auto_792347 ) ) ( not ( = ?auto_792346 ?auto_792348 ) ) ( not ( = ?auto_792346 ?auto_792349 ) ) ( not ( = ?auto_792346 ?auto_792350 ) ) ( not ( = ?auto_792346 ?auto_792351 ) ) ( not ( = ?auto_792347 ?auto_792348 ) ) ( not ( = ?auto_792347 ?auto_792349 ) ) ( not ( = ?auto_792347 ?auto_792350 ) ) ( not ( = ?auto_792347 ?auto_792351 ) ) ( not ( = ?auto_792348 ?auto_792349 ) ) ( not ( = ?auto_792348 ?auto_792350 ) ) ( not ( = ?auto_792348 ?auto_792351 ) ) ( not ( = ?auto_792349 ?auto_792350 ) ) ( not ( = ?auto_792349 ?auto_792351 ) ) ( not ( = ?auto_792350 ?auto_792351 ) ) ( ON ?auto_792350 ?auto_792351 ) ( ON ?auto_792349 ?auto_792350 ) ( ON ?auto_792348 ?auto_792349 ) ( ON ?auto_792347 ?auto_792348 ) ( ON ?auto_792346 ?auto_792347 ) ( ON ?auto_792345 ?auto_792346 ) ( ON ?auto_792344 ?auto_792345 ) ( ON ?auto_792343 ?auto_792344 ) ( ON ?auto_792342 ?auto_792343 ) ( ON ?auto_792341 ?auto_792342 ) ( ON ?auto_792340 ?auto_792341 ) ( ON ?auto_792339 ?auto_792340 ) ( ON ?auto_792338 ?auto_792339 ) ( ON ?auto_792337 ?auto_792338 ) ( ON ?auto_792336 ?auto_792337 ) ( CLEAR ?auto_792334 ) ( ON ?auto_792335 ?auto_792336 ) ( CLEAR ?auto_792335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_792334 ?auto_792335 )
      ( MAKE-18PILE ?auto_792334 ?auto_792335 ?auto_792336 ?auto_792337 ?auto_792338 ?auto_792339 ?auto_792340 ?auto_792341 ?auto_792342 ?auto_792343 ?auto_792344 ?auto_792345 ?auto_792346 ?auto_792347 ?auto_792348 ?auto_792349 ?auto_792350 ?auto_792351 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792370 - BLOCK
      ?auto_792371 - BLOCK
      ?auto_792372 - BLOCK
      ?auto_792373 - BLOCK
      ?auto_792374 - BLOCK
      ?auto_792375 - BLOCK
      ?auto_792376 - BLOCK
      ?auto_792377 - BLOCK
      ?auto_792378 - BLOCK
      ?auto_792379 - BLOCK
      ?auto_792380 - BLOCK
      ?auto_792381 - BLOCK
      ?auto_792382 - BLOCK
      ?auto_792383 - BLOCK
      ?auto_792384 - BLOCK
      ?auto_792385 - BLOCK
      ?auto_792386 - BLOCK
      ?auto_792387 - BLOCK
    )
    :vars
    (
      ?auto_792388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_792387 ?auto_792388 ) ( not ( = ?auto_792370 ?auto_792371 ) ) ( not ( = ?auto_792370 ?auto_792372 ) ) ( not ( = ?auto_792370 ?auto_792373 ) ) ( not ( = ?auto_792370 ?auto_792374 ) ) ( not ( = ?auto_792370 ?auto_792375 ) ) ( not ( = ?auto_792370 ?auto_792376 ) ) ( not ( = ?auto_792370 ?auto_792377 ) ) ( not ( = ?auto_792370 ?auto_792378 ) ) ( not ( = ?auto_792370 ?auto_792379 ) ) ( not ( = ?auto_792370 ?auto_792380 ) ) ( not ( = ?auto_792370 ?auto_792381 ) ) ( not ( = ?auto_792370 ?auto_792382 ) ) ( not ( = ?auto_792370 ?auto_792383 ) ) ( not ( = ?auto_792370 ?auto_792384 ) ) ( not ( = ?auto_792370 ?auto_792385 ) ) ( not ( = ?auto_792370 ?auto_792386 ) ) ( not ( = ?auto_792370 ?auto_792387 ) ) ( not ( = ?auto_792370 ?auto_792388 ) ) ( not ( = ?auto_792371 ?auto_792372 ) ) ( not ( = ?auto_792371 ?auto_792373 ) ) ( not ( = ?auto_792371 ?auto_792374 ) ) ( not ( = ?auto_792371 ?auto_792375 ) ) ( not ( = ?auto_792371 ?auto_792376 ) ) ( not ( = ?auto_792371 ?auto_792377 ) ) ( not ( = ?auto_792371 ?auto_792378 ) ) ( not ( = ?auto_792371 ?auto_792379 ) ) ( not ( = ?auto_792371 ?auto_792380 ) ) ( not ( = ?auto_792371 ?auto_792381 ) ) ( not ( = ?auto_792371 ?auto_792382 ) ) ( not ( = ?auto_792371 ?auto_792383 ) ) ( not ( = ?auto_792371 ?auto_792384 ) ) ( not ( = ?auto_792371 ?auto_792385 ) ) ( not ( = ?auto_792371 ?auto_792386 ) ) ( not ( = ?auto_792371 ?auto_792387 ) ) ( not ( = ?auto_792371 ?auto_792388 ) ) ( not ( = ?auto_792372 ?auto_792373 ) ) ( not ( = ?auto_792372 ?auto_792374 ) ) ( not ( = ?auto_792372 ?auto_792375 ) ) ( not ( = ?auto_792372 ?auto_792376 ) ) ( not ( = ?auto_792372 ?auto_792377 ) ) ( not ( = ?auto_792372 ?auto_792378 ) ) ( not ( = ?auto_792372 ?auto_792379 ) ) ( not ( = ?auto_792372 ?auto_792380 ) ) ( not ( = ?auto_792372 ?auto_792381 ) ) ( not ( = ?auto_792372 ?auto_792382 ) ) ( not ( = ?auto_792372 ?auto_792383 ) ) ( not ( = ?auto_792372 ?auto_792384 ) ) ( not ( = ?auto_792372 ?auto_792385 ) ) ( not ( = ?auto_792372 ?auto_792386 ) ) ( not ( = ?auto_792372 ?auto_792387 ) ) ( not ( = ?auto_792372 ?auto_792388 ) ) ( not ( = ?auto_792373 ?auto_792374 ) ) ( not ( = ?auto_792373 ?auto_792375 ) ) ( not ( = ?auto_792373 ?auto_792376 ) ) ( not ( = ?auto_792373 ?auto_792377 ) ) ( not ( = ?auto_792373 ?auto_792378 ) ) ( not ( = ?auto_792373 ?auto_792379 ) ) ( not ( = ?auto_792373 ?auto_792380 ) ) ( not ( = ?auto_792373 ?auto_792381 ) ) ( not ( = ?auto_792373 ?auto_792382 ) ) ( not ( = ?auto_792373 ?auto_792383 ) ) ( not ( = ?auto_792373 ?auto_792384 ) ) ( not ( = ?auto_792373 ?auto_792385 ) ) ( not ( = ?auto_792373 ?auto_792386 ) ) ( not ( = ?auto_792373 ?auto_792387 ) ) ( not ( = ?auto_792373 ?auto_792388 ) ) ( not ( = ?auto_792374 ?auto_792375 ) ) ( not ( = ?auto_792374 ?auto_792376 ) ) ( not ( = ?auto_792374 ?auto_792377 ) ) ( not ( = ?auto_792374 ?auto_792378 ) ) ( not ( = ?auto_792374 ?auto_792379 ) ) ( not ( = ?auto_792374 ?auto_792380 ) ) ( not ( = ?auto_792374 ?auto_792381 ) ) ( not ( = ?auto_792374 ?auto_792382 ) ) ( not ( = ?auto_792374 ?auto_792383 ) ) ( not ( = ?auto_792374 ?auto_792384 ) ) ( not ( = ?auto_792374 ?auto_792385 ) ) ( not ( = ?auto_792374 ?auto_792386 ) ) ( not ( = ?auto_792374 ?auto_792387 ) ) ( not ( = ?auto_792374 ?auto_792388 ) ) ( not ( = ?auto_792375 ?auto_792376 ) ) ( not ( = ?auto_792375 ?auto_792377 ) ) ( not ( = ?auto_792375 ?auto_792378 ) ) ( not ( = ?auto_792375 ?auto_792379 ) ) ( not ( = ?auto_792375 ?auto_792380 ) ) ( not ( = ?auto_792375 ?auto_792381 ) ) ( not ( = ?auto_792375 ?auto_792382 ) ) ( not ( = ?auto_792375 ?auto_792383 ) ) ( not ( = ?auto_792375 ?auto_792384 ) ) ( not ( = ?auto_792375 ?auto_792385 ) ) ( not ( = ?auto_792375 ?auto_792386 ) ) ( not ( = ?auto_792375 ?auto_792387 ) ) ( not ( = ?auto_792375 ?auto_792388 ) ) ( not ( = ?auto_792376 ?auto_792377 ) ) ( not ( = ?auto_792376 ?auto_792378 ) ) ( not ( = ?auto_792376 ?auto_792379 ) ) ( not ( = ?auto_792376 ?auto_792380 ) ) ( not ( = ?auto_792376 ?auto_792381 ) ) ( not ( = ?auto_792376 ?auto_792382 ) ) ( not ( = ?auto_792376 ?auto_792383 ) ) ( not ( = ?auto_792376 ?auto_792384 ) ) ( not ( = ?auto_792376 ?auto_792385 ) ) ( not ( = ?auto_792376 ?auto_792386 ) ) ( not ( = ?auto_792376 ?auto_792387 ) ) ( not ( = ?auto_792376 ?auto_792388 ) ) ( not ( = ?auto_792377 ?auto_792378 ) ) ( not ( = ?auto_792377 ?auto_792379 ) ) ( not ( = ?auto_792377 ?auto_792380 ) ) ( not ( = ?auto_792377 ?auto_792381 ) ) ( not ( = ?auto_792377 ?auto_792382 ) ) ( not ( = ?auto_792377 ?auto_792383 ) ) ( not ( = ?auto_792377 ?auto_792384 ) ) ( not ( = ?auto_792377 ?auto_792385 ) ) ( not ( = ?auto_792377 ?auto_792386 ) ) ( not ( = ?auto_792377 ?auto_792387 ) ) ( not ( = ?auto_792377 ?auto_792388 ) ) ( not ( = ?auto_792378 ?auto_792379 ) ) ( not ( = ?auto_792378 ?auto_792380 ) ) ( not ( = ?auto_792378 ?auto_792381 ) ) ( not ( = ?auto_792378 ?auto_792382 ) ) ( not ( = ?auto_792378 ?auto_792383 ) ) ( not ( = ?auto_792378 ?auto_792384 ) ) ( not ( = ?auto_792378 ?auto_792385 ) ) ( not ( = ?auto_792378 ?auto_792386 ) ) ( not ( = ?auto_792378 ?auto_792387 ) ) ( not ( = ?auto_792378 ?auto_792388 ) ) ( not ( = ?auto_792379 ?auto_792380 ) ) ( not ( = ?auto_792379 ?auto_792381 ) ) ( not ( = ?auto_792379 ?auto_792382 ) ) ( not ( = ?auto_792379 ?auto_792383 ) ) ( not ( = ?auto_792379 ?auto_792384 ) ) ( not ( = ?auto_792379 ?auto_792385 ) ) ( not ( = ?auto_792379 ?auto_792386 ) ) ( not ( = ?auto_792379 ?auto_792387 ) ) ( not ( = ?auto_792379 ?auto_792388 ) ) ( not ( = ?auto_792380 ?auto_792381 ) ) ( not ( = ?auto_792380 ?auto_792382 ) ) ( not ( = ?auto_792380 ?auto_792383 ) ) ( not ( = ?auto_792380 ?auto_792384 ) ) ( not ( = ?auto_792380 ?auto_792385 ) ) ( not ( = ?auto_792380 ?auto_792386 ) ) ( not ( = ?auto_792380 ?auto_792387 ) ) ( not ( = ?auto_792380 ?auto_792388 ) ) ( not ( = ?auto_792381 ?auto_792382 ) ) ( not ( = ?auto_792381 ?auto_792383 ) ) ( not ( = ?auto_792381 ?auto_792384 ) ) ( not ( = ?auto_792381 ?auto_792385 ) ) ( not ( = ?auto_792381 ?auto_792386 ) ) ( not ( = ?auto_792381 ?auto_792387 ) ) ( not ( = ?auto_792381 ?auto_792388 ) ) ( not ( = ?auto_792382 ?auto_792383 ) ) ( not ( = ?auto_792382 ?auto_792384 ) ) ( not ( = ?auto_792382 ?auto_792385 ) ) ( not ( = ?auto_792382 ?auto_792386 ) ) ( not ( = ?auto_792382 ?auto_792387 ) ) ( not ( = ?auto_792382 ?auto_792388 ) ) ( not ( = ?auto_792383 ?auto_792384 ) ) ( not ( = ?auto_792383 ?auto_792385 ) ) ( not ( = ?auto_792383 ?auto_792386 ) ) ( not ( = ?auto_792383 ?auto_792387 ) ) ( not ( = ?auto_792383 ?auto_792388 ) ) ( not ( = ?auto_792384 ?auto_792385 ) ) ( not ( = ?auto_792384 ?auto_792386 ) ) ( not ( = ?auto_792384 ?auto_792387 ) ) ( not ( = ?auto_792384 ?auto_792388 ) ) ( not ( = ?auto_792385 ?auto_792386 ) ) ( not ( = ?auto_792385 ?auto_792387 ) ) ( not ( = ?auto_792385 ?auto_792388 ) ) ( not ( = ?auto_792386 ?auto_792387 ) ) ( not ( = ?auto_792386 ?auto_792388 ) ) ( not ( = ?auto_792387 ?auto_792388 ) ) ( ON ?auto_792386 ?auto_792387 ) ( ON ?auto_792385 ?auto_792386 ) ( ON ?auto_792384 ?auto_792385 ) ( ON ?auto_792383 ?auto_792384 ) ( ON ?auto_792382 ?auto_792383 ) ( ON ?auto_792381 ?auto_792382 ) ( ON ?auto_792380 ?auto_792381 ) ( ON ?auto_792379 ?auto_792380 ) ( ON ?auto_792378 ?auto_792379 ) ( ON ?auto_792377 ?auto_792378 ) ( ON ?auto_792376 ?auto_792377 ) ( ON ?auto_792375 ?auto_792376 ) ( ON ?auto_792374 ?auto_792375 ) ( ON ?auto_792373 ?auto_792374 ) ( ON ?auto_792372 ?auto_792373 ) ( ON ?auto_792371 ?auto_792372 ) ( ON ?auto_792370 ?auto_792371 ) ( CLEAR ?auto_792370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_792370 )
      ( MAKE-18PILE ?auto_792370 ?auto_792371 ?auto_792372 ?auto_792373 ?auto_792374 ?auto_792375 ?auto_792376 ?auto_792377 ?auto_792378 ?auto_792379 ?auto_792380 ?auto_792381 ?auto_792382 ?auto_792383 ?auto_792384 ?auto_792385 ?auto_792386 ?auto_792387 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792407 - BLOCK
      ?auto_792408 - BLOCK
      ?auto_792409 - BLOCK
      ?auto_792410 - BLOCK
      ?auto_792411 - BLOCK
      ?auto_792412 - BLOCK
      ?auto_792413 - BLOCK
      ?auto_792414 - BLOCK
      ?auto_792415 - BLOCK
      ?auto_792416 - BLOCK
      ?auto_792417 - BLOCK
      ?auto_792418 - BLOCK
      ?auto_792419 - BLOCK
      ?auto_792420 - BLOCK
      ?auto_792421 - BLOCK
      ?auto_792422 - BLOCK
      ?auto_792423 - BLOCK
      ?auto_792424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_792424 ) ( not ( = ?auto_792407 ?auto_792408 ) ) ( not ( = ?auto_792407 ?auto_792409 ) ) ( not ( = ?auto_792407 ?auto_792410 ) ) ( not ( = ?auto_792407 ?auto_792411 ) ) ( not ( = ?auto_792407 ?auto_792412 ) ) ( not ( = ?auto_792407 ?auto_792413 ) ) ( not ( = ?auto_792407 ?auto_792414 ) ) ( not ( = ?auto_792407 ?auto_792415 ) ) ( not ( = ?auto_792407 ?auto_792416 ) ) ( not ( = ?auto_792407 ?auto_792417 ) ) ( not ( = ?auto_792407 ?auto_792418 ) ) ( not ( = ?auto_792407 ?auto_792419 ) ) ( not ( = ?auto_792407 ?auto_792420 ) ) ( not ( = ?auto_792407 ?auto_792421 ) ) ( not ( = ?auto_792407 ?auto_792422 ) ) ( not ( = ?auto_792407 ?auto_792423 ) ) ( not ( = ?auto_792407 ?auto_792424 ) ) ( not ( = ?auto_792408 ?auto_792409 ) ) ( not ( = ?auto_792408 ?auto_792410 ) ) ( not ( = ?auto_792408 ?auto_792411 ) ) ( not ( = ?auto_792408 ?auto_792412 ) ) ( not ( = ?auto_792408 ?auto_792413 ) ) ( not ( = ?auto_792408 ?auto_792414 ) ) ( not ( = ?auto_792408 ?auto_792415 ) ) ( not ( = ?auto_792408 ?auto_792416 ) ) ( not ( = ?auto_792408 ?auto_792417 ) ) ( not ( = ?auto_792408 ?auto_792418 ) ) ( not ( = ?auto_792408 ?auto_792419 ) ) ( not ( = ?auto_792408 ?auto_792420 ) ) ( not ( = ?auto_792408 ?auto_792421 ) ) ( not ( = ?auto_792408 ?auto_792422 ) ) ( not ( = ?auto_792408 ?auto_792423 ) ) ( not ( = ?auto_792408 ?auto_792424 ) ) ( not ( = ?auto_792409 ?auto_792410 ) ) ( not ( = ?auto_792409 ?auto_792411 ) ) ( not ( = ?auto_792409 ?auto_792412 ) ) ( not ( = ?auto_792409 ?auto_792413 ) ) ( not ( = ?auto_792409 ?auto_792414 ) ) ( not ( = ?auto_792409 ?auto_792415 ) ) ( not ( = ?auto_792409 ?auto_792416 ) ) ( not ( = ?auto_792409 ?auto_792417 ) ) ( not ( = ?auto_792409 ?auto_792418 ) ) ( not ( = ?auto_792409 ?auto_792419 ) ) ( not ( = ?auto_792409 ?auto_792420 ) ) ( not ( = ?auto_792409 ?auto_792421 ) ) ( not ( = ?auto_792409 ?auto_792422 ) ) ( not ( = ?auto_792409 ?auto_792423 ) ) ( not ( = ?auto_792409 ?auto_792424 ) ) ( not ( = ?auto_792410 ?auto_792411 ) ) ( not ( = ?auto_792410 ?auto_792412 ) ) ( not ( = ?auto_792410 ?auto_792413 ) ) ( not ( = ?auto_792410 ?auto_792414 ) ) ( not ( = ?auto_792410 ?auto_792415 ) ) ( not ( = ?auto_792410 ?auto_792416 ) ) ( not ( = ?auto_792410 ?auto_792417 ) ) ( not ( = ?auto_792410 ?auto_792418 ) ) ( not ( = ?auto_792410 ?auto_792419 ) ) ( not ( = ?auto_792410 ?auto_792420 ) ) ( not ( = ?auto_792410 ?auto_792421 ) ) ( not ( = ?auto_792410 ?auto_792422 ) ) ( not ( = ?auto_792410 ?auto_792423 ) ) ( not ( = ?auto_792410 ?auto_792424 ) ) ( not ( = ?auto_792411 ?auto_792412 ) ) ( not ( = ?auto_792411 ?auto_792413 ) ) ( not ( = ?auto_792411 ?auto_792414 ) ) ( not ( = ?auto_792411 ?auto_792415 ) ) ( not ( = ?auto_792411 ?auto_792416 ) ) ( not ( = ?auto_792411 ?auto_792417 ) ) ( not ( = ?auto_792411 ?auto_792418 ) ) ( not ( = ?auto_792411 ?auto_792419 ) ) ( not ( = ?auto_792411 ?auto_792420 ) ) ( not ( = ?auto_792411 ?auto_792421 ) ) ( not ( = ?auto_792411 ?auto_792422 ) ) ( not ( = ?auto_792411 ?auto_792423 ) ) ( not ( = ?auto_792411 ?auto_792424 ) ) ( not ( = ?auto_792412 ?auto_792413 ) ) ( not ( = ?auto_792412 ?auto_792414 ) ) ( not ( = ?auto_792412 ?auto_792415 ) ) ( not ( = ?auto_792412 ?auto_792416 ) ) ( not ( = ?auto_792412 ?auto_792417 ) ) ( not ( = ?auto_792412 ?auto_792418 ) ) ( not ( = ?auto_792412 ?auto_792419 ) ) ( not ( = ?auto_792412 ?auto_792420 ) ) ( not ( = ?auto_792412 ?auto_792421 ) ) ( not ( = ?auto_792412 ?auto_792422 ) ) ( not ( = ?auto_792412 ?auto_792423 ) ) ( not ( = ?auto_792412 ?auto_792424 ) ) ( not ( = ?auto_792413 ?auto_792414 ) ) ( not ( = ?auto_792413 ?auto_792415 ) ) ( not ( = ?auto_792413 ?auto_792416 ) ) ( not ( = ?auto_792413 ?auto_792417 ) ) ( not ( = ?auto_792413 ?auto_792418 ) ) ( not ( = ?auto_792413 ?auto_792419 ) ) ( not ( = ?auto_792413 ?auto_792420 ) ) ( not ( = ?auto_792413 ?auto_792421 ) ) ( not ( = ?auto_792413 ?auto_792422 ) ) ( not ( = ?auto_792413 ?auto_792423 ) ) ( not ( = ?auto_792413 ?auto_792424 ) ) ( not ( = ?auto_792414 ?auto_792415 ) ) ( not ( = ?auto_792414 ?auto_792416 ) ) ( not ( = ?auto_792414 ?auto_792417 ) ) ( not ( = ?auto_792414 ?auto_792418 ) ) ( not ( = ?auto_792414 ?auto_792419 ) ) ( not ( = ?auto_792414 ?auto_792420 ) ) ( not ( = ?auto_792414 ?auto_792421 ) ) ( not ( = ?auto_792414 ?auto_792422 ) ) ( not ( = ?auto_792414 ?auto_792423 ) ) ( not ( = ?auto_792414 ?auto_792424 ) ) ( not ( = ?auto_792415 ?auto_792416 ) ) ( not ( = ?auto_792415 ?auto_792417 ) ) ( not ( = ?auto_792415 ?auto_792418 ) ) ( not ( = ?auto_792415 ?auto_792419 ) ) ( not ( = ?auto_792415 ?auto_792420 ) ) ( not ( = ?auto_792415 ?auto_792421 ) ) ( not ( = ?auto_792415 ?auto_792422 ) ) ( not ( = ?auto_792415 ?auto_792423 ) ) ( not ( = ?auto_792415 ?auto_792424 ) ) ( not ( = ?auto_792416 ?auto_792417 ) ) ( not ( = ?auto_792416 ?auto_792418 ) ) ( not ( = ?auto_792416 ?auto_792419 ) ) ( not ( = ?auto_792416 ?auto_792420 ) ) ( not ( = ?auto_792416 ?auto_792421 ) ) ( not ( = ?auto_792416 ?auto_792422 ) ) ( not ( = ?auto_792416 ?auto_792423 ) ) ( not ( = ?auto_792416 ?auto_792424 ) ) ( not ( = ?auto_792417 ?auto_792418 ) ) ( not ( = ?auto_792417 ?auto_792419 ) ) ( not ( = ?auto_792417 ?auto_792420 ) ) ( not ( = ?auto_792417 ?auto_792421 ) ) ( not ( = ?auto_792417 ?auto_792422 ) ) ( not ( = ?auto_792417 ?auto_792423 ) ) ( not ( = ?auto_792417 ?auto_792424 ) ) ( not ( = ?auto_792418 ?auto_792419 ) ) ( not ( = ?auto_792418 ?auto_792420 ) ) ( not ( = ?auto_792418 ?auto_792421 ) ) ( not ( = ?auto_792418 ?auto_792422 ) ) ( not ( = ?auto_792418 ?auto_792423 ) ) ( not ( = ?auto_792418 ?auto_792424 ) ) ( not ( = ?auto_792419 ?auto_792420 ) ) ( not ( = ?auto_792419 ?auto_792421 ) ) ( not ( = ?auto_792419 ?auto_792422 ) ) ( not ( = ?auto_792419 ?auto_792423 ) ) ( not ( = ?auto_792419 ?auto_792424 ) ) ( not ( = ?auto_792420 ?auto_792421 ) ) ( not ( = ?auto_792420 ?auto_792422 ) ) ( not ( = ?auto_792420 ?auto_792423 ) ) ( not ( = ?auto_792420 ?auto_792424 ) ) ( not ( = ?auto_792421 ?auto_792422 ) ) ( not ( = ?auto_792421 ?auto_792423 ) ) ( not ( = ?auto_792421 ?auto_792424 ) ) ( not ( = ?auto_792422 ?auto_792423 ) ) ( not ( = ?auto_792422 ?auto_792424 ) ) ( not ( = ?auto_792423 ?auto_792424 ) ) ( ON ?auto_792423 ?auto_792424 ) ( ON ?auto_792422 ?auto_792423 ) ( ON ?auto_792421 ?auto_792422 ) ( ON ?auto_792420 ?auto_792421 ) ( ON ?auto_792419 ?auto_792420 ) ( ON ?auto_792418 ?auto_792419 ) ( ON ?auto_792417 ?auto_792418 ) ( ON ?auto_792416 ?auto_792417 ) ( ON ?auto_792415 ?auto_792416 ) ( ON ?auto_792414 ?auto_792415 ) ( ON ?auto_792413 ?auto_792414 ) ( ON ?auto_792412 ?auto_792413 ) ( ON ?auto_792411 ?auto_792412 ) ( ON ?auto_792410 ?auto_792411 ) ( ON ?auto_792409 ?auto_792410 ) ( ON ?auto_792408 ?auto_792409 ) ( ON ?auto_792407 ?auto_792408 ) ( CLEAR ?auto_792407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_792407 )
      ( MAKE-18PILE ?auto_792407 ?auto_792408 ?auto_792409 ?auto_792410 ?auto_792411 ?auto_792412 ?auto_792413 ?auto_792414 ?auto_792415 ?auto_792416 ?auto_792417 ?auto_792418 ?auto_792419 ?auto_792420 ?auto_792421 ?auto_792422 ?auto_792423 ?auto_792424 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_792443 - BLOCK
      ?auto_792444 - BLOCK
      ?auto_792445 - BLOCK
      ?auto_792446 - BLOCK
      ?auto_792447 - BLOCK
      ?auto_792448 - BLOCK
      ?auto_792449 - BLOCK
      ?auto_792450 - BLOCK
      ?auto_792451 - BLOCK
      ?auto_792452 - BLOCK
      ?auto_792453 - BLOCK
      ?auto_792454 - BLOCK
      ?auto_792455 - BLOCK
      ?auto_792456 - BLOCK
      ?auto_792457 - BLOCK
      ?auto_792458 - BLOCK
      ?auto_792459 - BLOCK
      ?auto_792460 - BLOCK
    )
    :vars
    (
      ?auto_792461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_792443 ?auto_792444 ) ) ( not ( = ?auto_792443 ?auto_792445 ) ) ( not ( = ?auto_792443 ?auto_792446 ) ) ( not ( = ?auto_792443 ?auto_792447 ) ) ( not ( = ?auto_792443 ?auto_792448 ) ) ( not ( = ?auto_792443 ?auto_792449 ) ) ( not ( = ?auto_792443 ?auto_792450 ) ) ( not ( = ?auto_792443 ?auto_792451 ) ) ( not ( = ?auto_792443 ?auto_792452 ) ) ( not ( = ?auto_792443 ?auto_792453 ) ) ( not ( = ?auto_792443 ?auto_792454 ) ) ( not ( = ?auto_792443 ?auto_792455 ) ) ( not ( = ?auto_792443 ?auto_792456 ) ) ( not ( = ?auto_792443 ?auto_792457 ) ) ( not ( = ?auto_792443 ?auto_792458 ) ) ( not ( = ?auto_792443 ?auto_792459 ) ) ( not ( = ?auto_792443 ?auto_792460 ) ) ( not ( = ?auto_792444 ?auto_792445 ) ) ( not ( = ?auto_792444 ?auto_792446 ) ) ( not ( = ?auto_792444 ?auto_792447 ) ) ( not ( = ?auto_792444 ?auto_792448 ) ) ( not ( = ?auto_792444 ?auto_792449 ) ) ( not ( = ?auto_792444 ?auto_792450 ) ) ( not ( = ?auto_792444 ?auto_792451 ) ) ( not ( = ?auto_792444 ?auto_792452 ) ) ( not ( = ?auto_792444 ?auto_792453 ) ) ( not ( = ?auto_792444 ?auto_792454 ) ) ( not ( = ?auto_792444 ?auto_792455 ) ) ( not ( = ?auto_792444 ?auto_792456 ) ) ( not ( = ?auto_792444 ?auto_792457 ) ) ( not ( = ?auto_792444 ?auto_792458 ) ) ( not ( = ?auto_792444 ?auto_792459 ) ) ( not ( = ?auto_792444 ?auto_792460 ) ) ( not ( = ?auto_792445 ?auto_792446 ) ) ( not ( = ?auto_792445 ?auto_792447 ) ) ( not ( = ?auto_792445 ?auto_792448 ) ) ( not ( = ?auto_792445 ?auto_792449 ) ) ( not ( = ?auto_792445 ?auto_792450 ) ) ( not ( = ?auto_792445 ?auto_792451 ) ) ( not ( = ?auto_792445 ?auto_792452 ) ) ( not ( = ?auto_792445 ?auto_792453 ) ) ( not ( = ?auto_792445 ?auto_792454 ) ) ( not ( = ?auto_792445 ?auto_792455 ) ) ( not ( = ?auto_792445 ?auto_792456 ) ) ( not ( = ?auto_792445 ?auto_792457 ) ) ( not ( = ?auto_792445 ?auto_792458 ) ) ( not ( = ?auto_792445 ?auto_792459 ) ) ( not ( = ?auto_792445 ?auto_792460 ) ) ( not ( = ?auto_792446 ?auto_792447 ) ) ( not ( = ?auto_792446 ?auto_792448 ) ) ( not ( = ?auto_792446 ?auto_792449 ) ) ( not ( = ?auto_792446 ?auto_792450 ) ) ( not ( = ?auto_792446 ?auto_792451 ) ) ( not ( = ?auto_792446 ?auto_792452 ) ) ( not ( = ?auto_792446 ?auto_792453 ) ) ( not ( = ?auto_792446 ?auto_792454 ) ) ( not ( = ?auto_792446 ?auto_792455 ) ) ( not ( = ?auto_792446 ?auto_792456 ) ) ( not ( = ?auto_792446 ?auto_792457 ) ) ( not ( = ?auto_792446 ?auto_792458 ) ) ( not ( = ?auto_792446 ?auto_792459 ) ) ( not ( = ?auto_792446 ?auto_792460 ) ) ( not ( = ?auto_792447 ?auto_792448 ) ) ( not ( = ?auto_792447 ?auto_792449 ) ) ( not ( = ?auto_792447 ?auto_792450 ) ) ( not ( = ?auto_792447 ?auto_792451 ) ) ( not ( = ?auto_792447 ?auto_792452 ) ) ( not ( = ?auto_792447 ?auto_792453 ) ) ( not ( = ?auto_792447 ?auto_792454 ) ) ( not ( = ?auto_792447 ?auto_792455 ) ) ( not ( = ?auto_792447 ?auto_792456 ) ) ( not ( = ?auto_792447 ?auto_792457 ) ) ( not ( = ?auto_792447 ?auto_792458 ) ) ( not ( = ?auto_792447 ?auto_792459 ) ) ( not ( = ?auto_792447 ?auto_792460 ) ) ( not ( = ?auto_792448 ?auto_792449 ) ) ( not ( = ?auto_792448 ?auto_792450 ) ) ( not ( = ?auto_792448 ?auto_792451 ) ) ( not ( = ?auto_792448 ?auto_792452 ) ) ( not ( = ?auto_792448 ?auto_792453 ) ) ( not ( = ?auto_792448 ?auto_792454 ) ) ( not ( = ?auto_792448 ?auto_792455 ) ) ( not ( = ?auto_792448 ?auto_792456 ) ) ( not ( = ?auto_792448 ?auto_792457 ) ) ( not ( = ?auto_792448 ?auto_792458 ) ) ( not ( = ?auto_792448 ?auto_792459 ) ) ( not ( = ?auto_792448 ?auto_792460 ) ) ( not ( = ?auto_792449 ?auto_792450 ) ) ( not ( = ?auto_792449 ?auto_792451 ) ) ( not ( = ?auto_792449 ?auto_792452 ) ) ( not ( = ?auto_792449 ?auto_792453 ) ) ( not ( = ?auto_792449 ?auto_792454 ) ) ( not ( = ?auto_792449 ?auto_792455 ) ) ( not ( = ?auto_792449 ?auto_792456 ) ) ( not ( = ?auto_792449 ?auto_792457 ) ) ( not ( = ?auto_792449 ?auto_792458 ) ) ( not ( = ?auto_792449 ?auto_792459 ) ) ( not ( = ?auto_792449 ?auto_792460 ) ) ( not ( = ?auto_792450 ?auto_792451 ) ) ( not ( = ?auto_792450 ?auto_792452 ) ) ( not ( = ?auto_792450 ?auto_792453 ) ) ( not ( = ?auto_792450 ?auto_792454 ) ) ( not ( = ?auto_792450 ?auto_792455 ) ) ( not ( = ?auto_792450 ?auto_792456 ) ) ( not ( = ?auto_792450 ?auto_792457 ) ) ( not ( = ?auto_792450 ?auto_792458 ) ) ( not ( = ?auto_792450 ?auto_792459 ) ) ( not ( = ?auto_792450 ?auto_792460 ) ) ( not ( = ?auto_792451 ?auto_792452 ) ) ( not ( = ?auto_792451 ?auto_792453 ) ) ( not ( = ?auto_792451 ?auto_792454 ) ) ( not ( = ?auto_792451 ?auto_792455 ) ) ( not ( = ?auto_792451 ?auto_792456 ) ) ( not ( = ?auto_792451 ?auto_792457 ) ) ( not ( = ?auto_792451 ?auto_792458 ) ) ( not ( = ?auto_792451 ?auto_792459 ) ) ( not ( = ?auto_792451 ?auto_792460 ) ) ( not ( = ?auto_792452 ?auto_792453 ) ) ( not ( = ?auto_792452 ?auto_792454 ) ) ( not ( = ?auto_792452 ?auto_792455 ) ) ( not ( = ?auto_792452 ?auto_792456 ) ) ( not ( = ?auto_792452 ?auto_792457 ) ) ( not ( = ?auto_792452 ?auto_792458 ) ) ( not ( = ?auto_792452 ?auto_792459 ) ) ( not ( = ?auto_792452 ?auto_792460 ) ) ( not ( = ?auto_792453 ?auto_792454 ) ) ( not ( = ?auto_792453 ?auto_792455 ) ) ( not ( = ?auto_792453 ?auto_792456 ) ) ( not ( = ?auto_792453 ?auto_792457 ) ) ( not ( = ?auto_792453 ?auto_792458 ) ) ( not ( = ?auto_792453 ?auto_792459 ) ) ( not ( = ?auto_792453 ?auto_792460 ) ) ( not ( = ?auto_792454 ?auto_792455 ) ) ( not ( = ?auto_792454 ?auto_792456 ) ) ( not ( = ?auto_792454 ?auto_792457 ) ) ( not ( = ?auto_792454 ?auto_792458 ) ) ( not ( = ?auto_792454 ?auto_792459 ) ) ( not ( = ?auto_792454 ?auto_792460 ) ) ( not ( = ?auto_792455 ?auto_792456 ) ) ( not ( = ?auto_792455 ?auto_792457 ) ) ( not ( = ?auto_792455 ?auto_792458 ) ) ( not ( = ?auto_792455 ?auto_792459 ) ) ( not ( = ?auto_792455 ?auto_792460 ) ) ( not ( = ?auto_792456 ?auto_792457 ) ) ( not ( = ?auto_792456 ?auto_792458 ) ) ( not ( = ?auto_792456 ?auto_792459 ) ) ( not ( = ?auto_792456 ?auto_792460 ) ) ( not ( = ?auto_792457 ?auto_792458 ) ) ( not ( = ?auto_792457 ?auto_792459 ) ) ( not ( = ?auto_792457 ?auto_792460 ) ) ( not ( = ?auto_792458 ?auto_792459 ) ) ( not ( = ?auto_792458 ?auto_792460 ) ) ( not ( = ?auto_792459 ?auto_792460 ) ) ( ON ?auto_792443 ?auto_792461 ) ( not ( = ?auto_792460 ?auto_792461 ) ) ( not ( = ?auto_792459 ?auto_792461 ) ) ( not ( = ?auto_792458 ?auto_792461 ) ) ( not ( = ?auto_792457 ?auto_792461 ) ) ( not ( = ?auto_792456 ?auto_792461 ) ) ( not ( = ?auto_792455 ?auto_792461 ) ) ( not ( = ?auto_792454 ?auto_792461 ) ) ( not ( = ?auto_792453 ?auto_792461 ) ) ( not ( = ?auto_792452 ?auto_792461 ) ) ( not ( = ?auto_792451 ?auto_792461 ) ) ( not ( = ?auto_792450 ?auto_792461 ) ) ( not ( = ?auto_792449 ?auto_792461 ) ) ( not ( = ?auto_792448 ?auto_792461 ) ) ( not ( = ?auto_792447 ?auto_792461 ) ) ( not ( = ?auto_792446 ?auto_792461 ) ) ( not ( = ?auto_792445 ?auto_792461 ) ) ( not ( = ?auto_792444 ?auto_792461 ) ) ( not ( = ?auto_792443 ?auto_792461 ) ) ( ON ?auto_792444 ?auto_792443 ) ( ON ?auto_792445 ?auto_792444 ) ( ON ?auto_792446 ?auto_792445 ) ( ON ?auto_792447 ?auto_792446 ) ( ON ?auto_792448 ?auto_792447 ) ( ON ?auto_792449 ?auto_792448 ) ( ON ?auto_792450 ?auto_792449 ) ( ON ?auto_792451 ?auto_792450 ) ( ON ?auto_792452 ?auto_792451 ) ( ON ?auto_792453 ?auto_792452 ) ( ON ?auto_792454 ?auto_792453 ) ( ON ?auto_792455 ?auto_792454 ) ( ON ?auto_792456 ?auto_792455 ) ( ON ?auto_792457 ?auto_792456 ) ( ON ?auto_792458 ?auto_792457 ) ( ON ?auto_792459 ?auto_792458 ) ( ON ?auto_792460 ?auto_792459 ) ( CLEAR ?auto_792460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_792460 ?auto_792459 ?auto_792458 ?auto_792457 ?auto_792456 ?auto_792455 ?auto_792454 ?auto_792453 ?auto_792452 ?auto_792451 ?auto_792450 ?auto_792449 ?auto_792448 ?auto_792447 ?auto_792446 ?auto_792445 ?auto_792444 ?auto_792443 )
      ( MAKE-18PILE ?auto_792443 ?auto_792444 ?auto_792445 ?auto_792446 ?auto_792447 ?auto_792448 ?auto_792449 ?auto_792450 ?auto_792451 ?auto_792452 ?auto_792453 ?auto_792454 ?auto_792455 ?auto_792456 ?auto_792457 ?auto_792458 ?auto_792459 ?auto_792460 ) )
  )

)

