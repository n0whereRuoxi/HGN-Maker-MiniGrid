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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_95725 - BLOCK
      ?auto_95726 - BLOCK
      ?auto_95727 - BLOCK
      ?auto_95728 - BLOCK
      ?auto_95729 - BLOCK
      ?auto_95730 - BLOCK
      ?auto_95731 - BLOCK
    )
    :vars
    (
      ?auto_95732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95732 ?auto_95731 ) ( CLEAR ?auto_95732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95725 ) ( ON ?auto_95726 ?auto_95725 ) ( ON ?auto_95727 ?auto_95726 ) ( ON ?auto_95728 ?auto_95727 ) ( ON ?auto_95729 ?auto_95728 ) ( ON ?auto_95730 ?auto_95729 ) ( ON ?auto_95731 ?auto_95730 ) ( not ( = ?auto_95725 ?auto_95726 ) ) ( not ( = ?auto_95725 ?auto_95727 ) ) ( not ( = ?auto_95725 ?auto_95728 ) ) ( not ( = ?auto_95725 ?auto_95729 ) ) ( not ( = ?auto_95725 ?auto_95730 ) ) ( not ( = ?auto_95725 ?auto_95731 ) ) ( not ( = ?auto_95725 ?auto_95732 ) ) ( not ( = ?auto_95726 ?auto_95727 ) ) ( not ( = ?auto_95726 ?auto_95728 ) ) ( not ( = ?auto_95726 ?auto_95729 ) ) ( not ( = ?auto_95726 ?auto_95730 ) ) ( not ( = ?auto_95726 ?auto_95731 ) ) ( not ( = ?auto_95726 ?auto_95732 ) ) ( not ( = ?auto_95727 ?auto_95728 ) ) ( not ( = ?auto_95727 ?auto_95729 ) ) ( not ( = ?auto_95727 ?auto_95730 ) ) ( not ( = ?auto_95727 ?auto_95731 ) ) ( not ( = ?auto_95727 ?auto_95732 ) ) ( not ( = ?auto_95728 ?auto_95729 ) ) ( not ( = ?auto_95728 ?auto_95730 ) ) ( not ( = ?auto_95728 ?auto_95731 ) ) ( not ( = ?auto_95728 ?auto_95732 ) ) ( not ( = ?auto_95729 ?auto_95730 ) ) ( not ( = ?auto_95729 ?auto_95731 ) ) ( not ( = ?auto_95729 ?auto_95732 ) ) ( not ( = ?auto_95730 ?auto_95731 ) ) ( not ( = ?auto_95730 ?auto_95732 ) ) ( not ( = ?auto_95731 ?auto_95732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95732 ?auto_95731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95734 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_95734 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_95734 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_95735 - BLOCK
    )
    :vars
    (
      ?auto_95736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95735 ?auto_95736 ) ( CLEAR ?auto_95735 ) ( HAND-EMPTY ) ( not ( = ?auto_95735 ?auto_95736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95735 ?auto_95736 )
      ( MAKE-1PILE ?auto_95735 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95743 - BLOCK
      ?auto_95744 - BLOCK
      ?auto_95745 - BLOCK
      ?auto_95746 - BLOCK
      ?auto_95747 - BLOCK
      ?auto_95748 - BLOCK
    )
    :vars
    (
      ?auto_95749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95749 ?auto_95748 ) ( CLEAR ?auto_95749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95743 ) ( ON ?auto_95744 ?auto_95743 ) ( ON ?auto_95745 ?auto_95744 ) ( ON ?auto_95746 ?auto_95745 ) ( ON ?auto_95747 ?auto_95746 ) ( ON ?auto_95748 ?auto_95747 ) ( not ( = ?auto_95743 ?auto_95744 ) ) ( not ( = ?auto_95743 ?auto_95745 ) ) ( not ( = ?auto_95743 ?auto_95746 ) ) ( not ( = ?auto_95743 ?auto_95747 ) ) ( not ( = ?auto_95743 ?auto_95748 ) ) ( not ( = ?auto_95743 ?auto_95749 ) ) ( not ( = ?auto_95744 ?auto_95745 ) ) ( not ( = ?auto_95744 ?auto_95746 ) ) ( not ( = ?auto_95744 ?auto_95747 ) ) ( not ( = ?auto_95744 ?auto_95748 ) ) ( not ( = ?auto_95744 ?auto_95749 ) ) ( not ( = ?auto_95745 ?auto_95746 ) ) ( not ( = ?auto_95745 ?auto_95747 ) ) ( not ( = ?auto_95745 ?auto_95748 ) ) ( not ( = ?auto_95745 ?auto_95749 ) ) ( not ( = ?auto_95746 ?auto_95747 ) ) ( not ( = ?auto_95746 ?auto_95748 ) ) ( not ( = ?auto_95746 ?auto_95749 ) ) ( not ( = ?auto_95747 ?auto_95748 ) ) ( not ( = ?auto_95747 ?auto_95749 ) ) ( not ( = ?auto_95748 ?auto_95749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95749 ?auto_95748 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95750 - BLOCK
      ?auto_95751 - BLOCK
      ?auto_95752 - BLOCK
      ?auto_95753 - BLOCK
      ?auto_95754 - BLOCK
      ?auto_95755 - BLOCK
    )
    :vars
    (
      ?auto_95756 - BLOCK
      ?auto_95757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95756 ?auto_95755 ) ( CLEAR ?auto_95756 ) ( ON-TABLE ?auto_95750 ) ( ON ?auto_95751 ?auto_95750 ) ( ON ?auto_95752 ?auto_95751 ) ( ON ?auto_95753 ?auto_95752 ) ( ON ?auto_95754 ?auto_95753 ) ( ON ?auto_95755 ?auto_95754 ) ( not ( = ?auto_95750 ?auto_95751 ) ) ( not ( = ?auto_95750 ?auto_95752 ) ) ( not ( = ?auto_95750 ?auto_95753 ) ) ( not ( = ?auto_95750 ?auto_95754 ) ) ( not ( = ?auto_95750 ?auto_95755 ) ) ( not ( = ?auto_95750 ?auto_95756 ) ) ( not ( = ?auto_95751 ?auto_95752 ) ) ( not ( = ?auto_95751 ?auto_95753 ) ) ( not ( = ?auto_95751 ?auto_95754 ) ) ( not ( = ?auto_95751 ?auto_95755 ) ) ( not ( = ?auto_95751 ?auto_95756 ) ) ( not ( = ?auto_95752 ?auto_95753 ) ) ( not ( = ?auto_95752 ?auto_95754 ) ) ( not ( = ?auto_95752 ?auto_95755 ) ) ( not ( = ?auto_95752 ?auto_95756 ) ) ( not ( = ?auto_95753 ?auto_95754 ) ) ( not ( = ?auto_95753 ?auto_95755 ) ) ( not ( = ?auto_95753 ?auto_95756 ) ) ( not ( = ?auto_95754 ?auto_95755 ) ) ( not ( = ?auto_95754 ?auto_95756 ) ) ( not ( = ?auto_95755 ?auto_95756 ) ) ( HOLDING ?auto_95757 ) ( not ( = ?auto_95750 ?auto_95757 ) ) ( not ( = ?auto_95751 ?auto_95757 ) ) ( not ( = ?auto_95752 ?auto_95757 ) ) ( not ( = ?auto_95753 ?auto_95757 ) ) ( not ( = ?auto_95754 ?auto_95757 ) ) ( not ( = ?auto_95755 ?auto_95757 ) ) ( not ( = ?auto_95756 ?auto_95757 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_95757 )
      ( MAKE-6PILE ?auto_95750 ?auto_95751 ?auto_95752 ?auto_95753 ?auto_95754 ?auto_95755 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_95758 - BLOCK
      ?auto_95759 - BLOCK
      ?auto_95760 - BLOCK
      ?auto_95761 - BLOCK
      ?auto_95762 - BLOCK
      ?auto_95763 - BLOCK
    )
    :vars
    (
      ?auto_95764 - BLOCK
      ?auto_95765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95764 ?auto_95763 ) ( ON-TABLE ?auto_95758 ) ( ON ?auto_95759 ?auto_95758 ) ( ON ?auto_95760 ?auto_95759 ) ( ON ?auto_95761 ?auto_95760 ) ( ON ?auto_95762 ?auto_95761 ) ( ON ?auto_95763 ?auto_95762 ) ( not ( = ?auto_95758 ?auto_95759 ) ) ( not ( = ?auto_95758 ?auto_95760 ) ) ( not ( = ?auto_95758 ?auto_95761 ) ) ( not ( = ?auto_95758 ?auto_95762 ) ) ( not ( = ?auto_95758 ?auto_95763 ) ) ( not ( = ?auto_95758 ?auto_95764 ) ) ( not ( = ?auto_95759 ?auto_95760 ) ) ( not ( = ?auto_95759 ?auto_95761 ) ) ( not ( = ?auto_95759 ?auto_95762 ) ) ( not ( = ?auto_95759 ?auto_95763 ) ) ( not ( = ?auto_95759 ?auto_95764 ) ) ( not ( = ?auto_95760 ?auto_95761 ) ) ( not ( = ?auto_95760 ?auto_95762 ) ) ( not ( = ?auto_95760 ?auto_95763 ) ) ( not ( = ?auto_95760 ?auto_95764 ) ) ( not ( = ?auto_95761 ?auto_95762 ) ) ( not ( = ?auto_95761 ?auto_95763 ) ) ( not ( = ?auto_95761 ?auto_95764 ) ) ( not ( = ?auto_95762 ?auto_95763 ) ) ( not ( = ?auto_95762 ?auto_95764 ) ) ( not ( = ?auto_95763 ?auto_95764 ) ) ( not ( = ?auto_95758 ?auto_95765 ) ) ( not ( = ?auto_95759 ?auto_95765 ) ) ( not ( = ?auto_95760 ?auto_95765 ) ) ( not ( = ?auto_95761 ?auto_95765 ) ) ( not ( = ?auto_95762 ?auto_95765 ) ) ( not ( = ?auto_95763 ?auto_95765 ) ) ( not ( = ?auto_95764 ?auto_95765 ) ) ( ON ?auto_95765 ?auto_95764 ) ( CLEAR ?auto_95765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95758 ?auto_95759 ?auto_95760 ?auto_95761 ?auto_95762 ?auto_95763 ?auto_95764 )
      ( MAKE-6PILE ?auto_95758 ?auto_95759 ?auto_95760 ?auto_95761 ?auto_95762 ?auto_95763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95768 - BLOCK
      ?auto_95769 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_95769 ) ( CLEAR ?auto_95768 ) ( ON-TABLE ?auto_95768 ) ( not ( = ?auto_95768 ?auto_95769 ) ) )
    :subtasks
    ( ( !STACK ?auto_95769 ?auto_95768 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95770 - BLOCK
      ?auto_95771 - BLOCK
    )
    :vars
    (
      ?auto_95772 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95770 ) ( ON-TABLE ?auto_95770 ) ( not ( = ?auto_95770 ?auto_95771 ) ) ( ON ?auto_95771 ?auto_95772 ) ( CLEAR ?auto_95771 ) ( HAND-EMPTY ) ( not ( = ?auto_95770 ?auto_95772 ) ) ( not ( = ?auto_95771 ?auto_95772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95771 ?auto_95772 )
      ( MAKE-2PILE ?auto_95770 ?auto_95771 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95773 - BLOCK
      ?auto_95774 - BLOCK
    )
    :vars
    (
      ?auto_95775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95773 ?auto_95774 ) ) ( ON ?auto_95774 ?auto_95775 ) ( CLEAR ?auto_95774 ) ( not ( = ?auto_95773 ?auto_95775 ) ) ( not ( = ?auto_95774 ?auto_95775 ) ) ( HOLDING ?auto_95773 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95773 )
      ( MAKE-2PILE ?auto_95773 ?auto_95774 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95776 - BLOCK
      ?auto_95777 - BLOCK
    )
    :vars
    (
      ?auto_95778 - BLOCK
      ?auto_95783 - BLOCK
      ?auto_95780 - BLOCK
      ?auto_95781 - BLOCK
      ?auto_95779 - BLOCK
      ?auto_95782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95776 ?auto_95777 ) ) ( ON ?auto_95777 ?auto_95778 ) ( not ( = ?auto_95776 ?auto_95778 ) ) ( not ( = ?auto_95777 ?auto_95778 ) ) ( ON ?auto_95776 ?auto_95777 ) ( CLEAR ?auto_95776 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95783 ) ( ON ?auto_95780 ?auto_95783 ) ( ON ?auto_95781 ?auto_95780 ) ( ON ?auto_95779 ?auto_95781 ) ( ON ?auto_95782 ?auto_95779 ) ( ON ?auto_95778 ?auto_95782 ) ( not ( = ?auto_95783 ?auto_95780 ) ) ( not ( = ?auto_95783 ?auto_95781 ) ) ( not ( = ?auto_95783 ?auto_95779 ) ) ( not ( = ?auto_95783 ?auto_95782 ) ) ( not ( = ?auto_95783 ?auto_95778 ) ) ( not ( = ?auto_95783 ?auto_95777 ) ) ( not ( = ?auto_95783 ?auto_95776 ) ) ( not ( = ?auto_95780 ?auto_95781 ) ) ( not ( = ?auto_95780 ?auto_95779 ) ) ( not ( = ?auto_95780 ?auto_95782 ) ) ( not ( = ?auto_95780 ?auto_95778 ) ) ( not ( = ?auto_95780 ?auto_95777 ) ) ( not ( = ?auto_95780 ?auto_95776 ) ) ( not ( = ?auto_95781 ?auto_95779 ) ) ( not ( = ?auto_95781 ?auto_95782 ) ) ( not ( = ?auto_95781 ?auto_95778 ) ) ( not ( = ?auto_95781 ?auto_95777 ) ) ( not ( = ?auto_95781 ?auto_95776 ) ) ( not ( = ?auto_95779 ?auto_95782 ) ) ( not ( = ?auto_95779 ?auto_95778 ) ) ( not ( = ?auto_95779 ?auto_95777 ) ) ( not ( = ?auto_95779 ?auto_95776 ) ) ( not ( = ?auto_95782 ?auto_95778 ) ) ( not ( = ?auto_95782 ?auto_95777 ) ) ( not ( = ?auto_95782 ?auto_95776 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95783 ?auto_95780 ?auto_95781 ?auto_95779 ?auto_95782 ?auto_95778 ?auto_95777 )
      ( MAKE-2PILE ?auto_95776 ?auto_95777 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95789 - BLOCK
      ?auto_95790 - BLOCK
      ?auto_95791 - BLOCK
      ?auto_95792 - BLOCK
      ?auto_95793 - BLOCK
    )
    :vars
    (
      ?auto_95794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95794 ?auto_95793 ) ( CLEAR ?auto_95794 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95789 ) ( ON ?auto_95790 ?auto_95789 ) ( ON ?auto_95791 ?auto_95790 ) ( ON ?auto_95792 ?auto_95791 ) ( ON ?auto_95793 ?auto_95792 ) ( not ( = ?auto_95789 ?auto_95790 ) ) ( not ( = ?auto_95789 ?auto_95791 ) ) ( not ( = ?auto_95789 ?auto_95792 ) ) ( not ( = ?auto_95789 ?auto_95793 ) ) ( not ( = ?auto_95789 ?auto_95794 ) ) ( not ( = ?auto_95790 ?auto_95791 ) ) ( not ( = ?auto_95790 ?auto_95792 ) ) ( not ( = ?auto_95790 ?auto_95793 ) ) ( not ( = ?auto_95790 ?auto_95794 ) ) ( not ( = ?auto_95791 ?auto_95792 ) ) ( not ( = ?auto_95791 ?auto_95793 ) ) ( not ( = ?auto_95791 ?auto_95794 ) ) ( not ( = ?auto_95792 ?auto_95793 ) ) ( not ( = ?auto_95792 ?auto_95794 ) ) ( not ( = ?auto_95793 ?auto_95794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95794 ?auto_95793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95795 - BLOCK
      ?auto_95796 - BLOCK
      ?auto_95797 - BLOCK
      ?auto_95798 - BLOCK
      ?auto_95799 - BLOCK
    )
    :vars
    (
      ?auto_95800 - BLOCK
      ?auto_95801 - BLOCK
      ?auto_95802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95800 ?auto_95799 ) ( CLEAR ?auto_95800 ) ( ON-TABLE ?auto_95795 ) ( ON ?auto_95796 ?auto_95795 ) ( ON ?auto_95797 ?auto_95796 ) ( ON ?auto_95798 ?auto_95797 ) ( ON ?auto_95799 ?auto_95798 ) ( not ( = ?auto_95795 ?auto_95796 ) ) ( not ( = ?auto_95795 ?auto_95797 ) ) ( not ( = ?auto_95795 ?auto_95798 ) ) ( not ( = ?auto_95795 ?auto_95799 ) ) ( not ( = ?auto_95795 ?auto_95800 ) ) ( not ( = ?auto_95796 ?auto_95797 ) ) ( not ( = ?auto_95796 ?auto_95798 ) ) ( not ( = ?auto_95796 ?auto_95799 ) ) ( not ( = ?auto_95796 ?auto_95800 ) ) ( not ( = ?auto_95797 ?auto_95798 ) ) ( not ( = ?auto_95797 ?auto_95799 ) ) ( not ( = ?auto_95797 ?auto_95800 ) ) ( not ( = ?auto_95798 ?auto_95799 ) ) ( not ( = ?auto_95798 ?auto_95800 ) ) ( not ( = ?auto_95799 ?auto_95800 ) ) ( HOLDING ?auto_95801 ) ( CLEAR ?auto_95802 ) ( not ( = ?auto_95795 ?auto_95801 ) ) ( not ( = ?auto_95795 ?auto_95802 ) ) ( not ( = ?auto_95796 ?auto_95801 ) ) ( not ( = ?auto_95796 ?auto_95802 ) ) ( not ( = ?auto_95797 ?auto_95801 ) ) ( not ( = ?auto_95797 ?auto_95802 ) ) ( not ( = ?auto_95798 ?auto_95801 ) ) ( not ( = ?auto_95798 ?auto_95802 ) ) ( not ( = ?auto_95799 ?auto_95801 ) ) ( not ( = ?auto_95799 ?auto_95802 ) ) ( not ( = ?auto_95800 ?auto_95801 ) ) ( not ( = ?auto_95800 ?auto_95802 ) ) ( not ( = ?auto_95801 ?auto_95802 ) ) )
    :subtasks
    ( ( !STACK ?auto_95801 ?auto_95802 )
      ( MAKE-5PILE ?auto_95795 ?auto_95796 ?auto_95797 ?auto_95798 ?auto_95799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95803 - BLOCK
      ?auto_95804 - BLOCK
      ?auto_95805 - BLOCK
      ?auto_95806 - BLOCK
      ?auto_95807 - BLOCK
    )
    :vars
    (
      ?auto_95808 - BLOCK
      ?auto_95810 - BLOCK
      ?auto_95809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95808 ?auto_95807 ) ( ON-TABLE ?auto_95803 ) ( ON ?auto_95804 ?auto_95803 ) ( ON ?auto_95805 ?auto_95804 ) ( ON ?auto_95806 ?auto_95805 ) ( ON ?auto_95807 ?auto_95806 ) ( not ( = ?auto_95803 ?auto_95804 ) ) ( not ( = ?auto_95803 ?auto_95805 ) ) ( not ( = ?auto_95803 ?auto_95806 ) ) ( not ( = ?auto_95803 ?auto_95807 ) ) ( not ( = ?auto_95803 ?auto_95808 ) ) ( not ( = ?auto_95804 ?auto_95805 ) ) ( not ( = ?auto_95804 ?auto_95806 ) ) ( not ( = ?auto_95804 ?auto_95807 ) ) ( not ( = ?auto_95804 ?auto_95808 ) ) ( not ( = ?auto_95805 ?auto_95806 ) ) ( not ( = ?auto_95805 ?auto_95807 ) ) ( not ( = ?auto_95805 ?auto_95808 ) ) ( not ( = ?auto_95806 ?auto_95807 ) ) ( not ( = ?auto_95806 ?auto_95808 ) ) ( not ( = ?auto_95807 ?auto_95808 ) ) ( CLEAR ?auto_95810 ) ( not ( = ?auto_95803 ?auto_95809 ) ) ( not ( = ?auto_95803 ?auto_95810 ) ) ( not ( = ?auto_95804 ?auto_95809 ) ) ( not ( = ?auto_95804 ?auto_95810 ) ) ( not ( = ?auto_95805 ?auto_95809 ) ) ( not ( = ?auto_95805 ?auto_95810 ) ) ( not ( = ?auto_95806 ?auto_95809 ) ) ( not ( = ?auto_95806 ?auto_95810 ) ) ( not ( = ?auto_95807 ?auto_95809 ) ) ( not ( = ?auto_95807 ?auto_95810 ) ) ( not ( = ?auto_95808 ?auto_95809 ) ) ( not ( = ?auto_95808 ?auto_95810 ) ) ( not ( = ?auto_95809 ?auto_95810 ) ) ( ON ?auto_95809 ?auto_95808 ) ( CLEAR ?auto_95809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95803 ?auto_95804 ?auto_95805 ?auto_95806 ?auto_95807 ?auto_95808 )
      ( MAKE-5PILE ?auto_95803 ?auto_95804 ?auto_95805 ?auto_95806 ?auto_95807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95811 - BLOCK
      ?auto_95812 - BLOCK
      ?auto_95813 - BLOCK
      ?auto_95814 - BLOCK
      ?auto_95815 - BLOCK
    )
    :vars
    (
      ?auto_95817 - BLOCK
      ?auto_95818 - BLOCK
      ?auto_95816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95817 ?auto_95815 ) ( ON-TABLE ?auto_95811 ) ( ON ?auto_95812 ?auto_95811 ) ( ON ?auto_95813 ?auto_95812 ) ( ON ?auto_95814 ?auto_95813 ) ( ON ?auto_95815 ?auto_95814 ) ( not ( = ?auto_95811 ?auto_95812 ) ) ( not ( = ?auto_95811 ?auto_95813 ) ) ( not ( = ?auto_95811 ?auto_95814 ) ) ( not ( = ?auto_95811 ?auto_95815 ) ) ( not ( = ?auto_95811 ?auto_95817 ) ) ( not ( = ?auto_95812 ?auto_95813 ) ) ( not ( = ?auto_95812 ?auto_95814 ) ) ( not ( = ?auto_95812 ?auto_95815 ) ) ( not ( = ?auto_95812 ?auto_95817 ) ) ( not ( = ?auto_95813 ?auto_95814 ) ) ( not ( = ?auto_95813 ?auto_95815 ) ) ( not ( = ?auto_95813 ?auto_95817 ) ) ( not ( = ?auto_95814 ?auto_95815 ) ) ( not ( = ?auto_95814 ?auto_95817 ) ) ( not ( = ?auto_95815 ?auto_95817 ) ) ( not ( = ?auto_95811 ?auto_95818 ) ) ( not ( = ?auto_95811 ?auto_95816 ) ) ( not ( = ?auto_95812 ?auto_95818 ) ) ( not ( = ?auto_95812 ?auto_95816 ) ) ( not ( = ?auto_95813 ?auto_95818 ) ) ( not ( = ?auto_95813 ?auto_95816 ) ) ( not ( = ?auto_95814 ?auto_95818 ) ) ( not ( = ?auto_95814 ?auto_95816 ) ) ( not ( = ?auto_95815 ?auto_95818 ) ) ( not ( = ?auto_95815 ?auto_95816 ) ) ( not ( = ?auto_95817 ?auto_95818 ) ) ( not ( = ?auto_95817 ?auto_95816 ) ) ( not ( = ?auto_95818 ?auto_95816 ) ) ( ON ?auto_95818 ?auto_95817 ) ( CLEAR ?auto_95818 ) ( HOLDING ?auto_95816 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95816 )
      ( MAKE-5PILE ?auto_95811 ?auto_95812 ?auto_95813 ?auto_95814 ?auto_95815 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_95819 - BLOCK
      ?auto_95820 - BLOCK
      ?auto_95821 - BLOCK
      ?auto_95822 - BLOCK
      ?auto_95823 - BLOCK
    )
    :vars
    (
      ?auto_95825 - BLOCK
      ?auto_95826 - BLOCK
      ?auto_95824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95825 ?auto_95823 ) ( ON-TABLE ?auto_95819 ) ( ON ?auto_95820 ?auto_95819 ) ( ON ?auto_95821 ?auto_95820 ) ( ON ?auto_95822 ?auto_95821 ) ( ON ?auto_95823 ?auto_95822 ) ( not ( = ?auto_95819 ?auto_95820 ) ) ( not ( = ?auto_95819 ?auto_95821 ) ) ( not ( = ?auto_95819 ?auto_95822 ) ) ( not ( = ?auto_95819 ?auto_95823 ) ) ( not ( = ?auto_95819 ?auto_95825 ) ) ( not ( = ?auto_95820 ?auto_95821 ) ) ( not ( = ?auto_95820 ?auto_95822 ) ) ( not ( = ?auto_95820 ?auto_95823 ) ) ( not ( = ?auto_95820 ?auto_95825 ) ) ( not ( = ?auto_95821 ?auto_95822 ) ) ( not ( = ?auto_95821 ?auto_95823 ) ) ( not ( = ?auto_95821 ?auto_95825 ) ) ( not ( = ?auto_95822 ?auto_95823 ) ) ( not ( = ?auto_95822 ?auto_95825 ) ) ( not ( = ?auto_95823 ?auto_95825 ) ) ( not ( = ?auto_95819 ?auto_95826 ) ) ( not ( = ?auto_95819 ?auto_95824 ) ) ( not ( = ?auto_95820 ?auto_95826 ) ) ( not ( = ?auto_95820 ?auto_95824 ) ) ( not ( = ?auto_95821 ?auto_95826 ) ) ( not ( = ?auto_95821 ?auto_95824 ) ) ( not ( = ?auto_95822 ?auto_95826 ) ) ( not ( = ?auto_95822 ?auto_95824 ) ) ( not ( = ?auto_95823 ?auto_95826 ) ) ( not ( = ?auto_95823 ?auto_95824 ) ) ( not ( = ?auto_95825 ?auto_95826 ) ) ( not ( = ?auto_95825 ?auto_95824 ) ) ( not ( = ?auto_95826 ?auto_95824 ) ) ( ON ?auto_95826 ?auto_95825 ) ( ON ?auto_95824 ?auto_95826 ) ( CLEAR ?auto_95824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95819 ?auto_95820 ?auto_95821 ?auto_95822 ?auto_95823 ?auto_95825 ?auto_95826 )
      ( MAKE-5PILE ?auto_95819 ?auto_95820 ?auto_95821 ?auto_95822 ?auto_95823 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95830 - BLOCK
      ?auto_95831 - BLOCK
      ?auto_95832 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_95832 ) ( CLEAR ?auto_95831 ) ( ON-TABLE ?auto_95830 ) ( ON ?auto_95831 ?auto_95830 ) ( not ( = ?auto_95830 ?auto_95831 ) ) ( not ( = ?auto_95830 ?auto_95832 ) ) ( not ( = ?auto_95831 ?auto_95832 ) ) )
    :subtasks
    ( ( !STACK ?auto_95832 ?auto_95831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95833 - BLOCK
      ?auto_95834 - BLOCK
      ?auto_95835 - BLOCK
    )
    :vars
    (
      ?auto_95836 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95834 ) ( ON-TABLE ?auto_95833 ) ( ON ?auto_95834 ?auto_95833 ) ( not ( = ?auto_95833 ?auto_95834 ) ) ( not ( = ?auto_95833 ?auto_95835 ) ) ( not ( = ?auto_95834 ?auto_95835 ) ) ( ON ?auto_95835 ?auto_95836 ) ( CLEAR ?auto_95835 ) ( HAND-EMPTY ) ( not ( = ?auto_95833 ?auto_95836 ) ) ( not ( = ?auto_95834 ?auto_95836 ) ) ( not ( = ?auto_95835 ?auto_95836 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95835 ?auto_95836 )
      ( MAKE-3PILE ?auto_95833 ?auto_95834 ?auto_95835 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95837 - BLOCK
      ?auto_95838 - BLOCK
      ?auto_95839 - BLOCK
    )
    :vars
    (
      ?auto_95840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95837 ) ( not ( = ?auto_95837 ?auto_95838 ) ) ( not ( = ?auto_95837 ?auto_95839 ) ) ( not ( = ?auto_95838 ?auto_95839 ) ) ( ON ?auto_95839 ?auto_95840 ) ( CLEAR ?auto_95839 ) ( not ( = ?auto_95837 ?auto_95840 ) ) ( not ( = ?auto_95838 ?auto_95840 ) ) ( not ( = ?auto_95839 ?auto_95840 ) ) ( HOLDING ?auto_95838 ) ( CLEAR ?auto_95837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95837 ?auto_95838 )
      ( MAKE-3PILE ?auto_95837 ?auto_95838 ?auto_95839 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95841 - BLOCK
      ?auto_95842 - BLOCK
      ?auto_95843 - BLOCK
    )
    :vars
    (
      ?auto_95844 - BLOCK
      ?auto_95846 - BLOCK
      ?auto_95848 - BLOCK
      ?auto_95847 - BLOCK
      ?auto_95845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95841 ) ( not ( = ?auto_95841 ?auto_95842 ) ) ( not ( = ?auto_95841 ?auto_95843 ) ) ( not ( = ?auto_95842 ?auto_95843 ) ) ( ON ?auto_95843 ?auto_95844 ) ( not ( = ?auto_95841 ?auto_95844 ) ) ( not ( = ?auto_95842 ?auto_95844 ) ) ( not ( = ?auto_95843 ?auto_95844 ) ) ( CLEAR ?auto_95841 ) ( ON ?auto_95842 ?auto_95843 ) ( CLEAR ?auto_95842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95846 ) ( ON ?auto_95848 ?auto_95846 ) ( ON ?auto_95847 ?auto_95848 ) ( ON ?auto_95845 ?auto_95847 ) ( ON ?auto_95844 ?auto_95845 ) ( not ( = ?auto_95846 ?auto_95848 ) ) ( not ( = ?auto_95846 ?auto_95847 ) ) ( not ( = ?auto_95846 ?auto_95845 ) ) ( not ( = ?auto_95846 ?auto_95844 ) ) ( not ( = ?auto_95846 ?auto_95843 ) ) ( not ( = ?auto_95846 ?auto_95842 ) ) ( not ( = ?auto_95848 ?auto_95847 ) ) ( not ( = ?auto_95848 ?auto_95845 ) ) ( not ( = ?auto_95848 ?auto_95844 ) ) ( not ( = ?auto_95848 ?auto_95843 ) ) ( not ( = ?auto_95848 ?auto_95842 ) ) ( not ( = ?auto_95847 ?auto_95845 ) ) ( not ( = ?auto_95847 ?auto_95844 ) ) ( not ( = ?auto_95847 ?auto_95843 ) ) ( not ( = ?auto_95847 ?auto_95842 ) ) ( not ( = ?auto_95845 ?auto_95844 ) ) ( not ( = ?auto_95845 ?auto_95843 ) ) ( not ( = ?auto_95845 ?auto_95842 ) ) ( not ( = ?auto_95841 ?auto_95846 ) ) ( not ( = ?auto_95841 ?auto_95848 ) ) ( not ( = ?auto_95841 ?auto_95847 ) ) ( not ( = ?auto_95841 ?auto_95845 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95846 ?auto_95848 ?auto_95847 ?auto_95845 ?auto_95844 ?auto_95843 )
      ( MAKE-3PILE ?auto_95841 ?auto_95842 ?auto_95843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95849 - BLOCK
      ?auto_95850 - BLOCK
      ?auto_95851 - BLOCK
    )
    :vars
    (
      ?auto_95854 - BLOCK
      ?auto_95855 - BLOCK
      ?auto_95853 - BLOCK
      ?auto_95856 - BLOCK
      ?auto_95852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95849 ?auto_95850 ) ) ( not ( = ?auto_95849 ?auto_95851 ) ) ( not ( = ?auto_95850 ?auto_95851 ) ) ( ON ?auto_95851 ?auto_95854 ) ( not ( = ?auto_95849 ?auto_95854 ) ) ( not ( = ?auto_95850 ?auto_95854 ) ) ( not ( = ?auto_95851 ?auto_95854 ) ) ( ON ?auto_95850 ?auto_95851 ) ( CLEAR ?auto_95850 ) ( ON-TABLE ?auto_95855 ) ( ON ?auto_95853 ?auto_95855 ) ( ON ?auto_95856 ?auto_95853 ) ( ON ?auto_95852 ?auto_95856 ) ( ON ?auto_95854 ?auto_95852 ) ( not ( = ?auto_95855 ?auto_95853 ) ) ( not ( = ?auto_95855 ?auto_95856 ) ) ( not ( = ?auto_95855 ?auto_95852 ) ) ( not ( = ?auto_95855 ?auto_95854 ) ) ( not ( = ?auto_95855 ?auto_95851 ) ) ( not ( = ?auto_95855 ?auto_95850 ) ) ( not ( = ?auto_95853 ?auto_95856 ) ) ( not ( = ?auto_95853 ?auto_95852 ) ) ( not ( = ?auto_95853 ?auto_95854 ) ) ( not ( = ?auto_95853 ?auto_95851 ) ) ( not ( = ?auto_95853 ?auto_95850 ) ) ( not ( = ?auto_95856 ?auto_95852 ) ) ( not ( = ?auto_95856 ?auto_95854 ) ) ( not ( = ?auto_95856 ?auto_95851 ) ) ( not ( = ?auto_95856 ?auto_95850 ) ) ( not ( = ?auto_95852 ?auto_95854 ) ) ( not ( = ?auto_95852 ?auto_95851 ) ) ( not ( = ?auto_95852 ?auto_95850 ) ) ( not ( = ?auto_95849 ?auto_95855 ) ) ( not ( = ?auto_95849 ?auto_95853 ) ) ( not ( = ?auto_95849 ?auto_95856 ) ) ( not ( = ?auto_95849 ?auto_95852 ) ) ( HOLDING ?auto_95849 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95849 )
      ( MAKE-3PILE ?auto_95849 ?auto_95850 ?auto_95851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95857 - BLOCK
      ?auto_95858 - BLOCK
      ?auto_95859 - BLOCK
    )
    :vars
    (
      ?auto_95863 - BLOCK
      ?auto_95860 - BLOCK
      ?auto_95864 - BLOCK
      ?auto_95862 - BLOCK
      ?auto_95861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95857 ?auto_95858 ) ) ( not ( = ?auto_95857 ?auto_95859 ) ) ( not ( = ?auto_95858 ?auto_95859 ) ) ( ON ?auto_95859 ?auto_95863 ) ( not ( = ?auto_95857 ?auto_95863 ) ) ( not ( = ?auto_95858 ?auto_95863 ) ) ( not ( = ?auto_95859 ?auto_95863 ) ) ( ON ?auto_95858 ?auto_95859 ) ( ON-TABLE ?auto_95860 ) ( ON ?auto_95864 ?auto_95860 ) ( ON ?auto_95862 ?auto_95864 ) ( ON ?auto_95861 ?auto_95862 ) ( ON ?auto_95863 ?auto_95861 ) ( not ( = ?auto_95860 ?auto_95864 ) ) ( not ( = ?auto_95860 ?auto_95862 ) ) ( not ( = ?auto_95860 ?auto_95861 ) ) ( not ( = ?auto_95860 ?auto_95863 ) ) ( not ( = ?auto_95860 ?auto_95859 ) ) ( not ( = ?auto_95860 ?auto_95858 ) ) ( not ( = ?auto_95864 ?auto_95862 ) ) ( not ( = ?auto_95864 ?auto_95861 ) ) ( not ( = ?auto_95864 ?auto_95863 ) ) ( not ( = ?auto_95864 ?auto_95859 ) ) ( not ( = ?auto_95864 ?auto_95858 ) ) ( not ( = ?auto_95862 ?auto_95861 ) ) ( not ( = ?auto_95862 ?auto_95863 ) ) ( not ( = ?auto_95862 ?auto_95859 ) ) ( not ( = ?auto_95862 ?auto_95858 ) ) ( not ( = ?auto_95861 ?auto_95863 ) ) ( not ( = ?auto_95861 ?auto_95859 ) ) ( not ( = ?auto_95861 ?auto_95858 ) ) ( not ( = ?auto_95857 ?auto_95860 ) ) ( not ( = ?auto_95857 ?auto_95864 ) ) ( not ( = ?auto_95857 ?auto_95862 ) ) ( not ( = ?auto_95857 ?auto_95861 ) ) ( ON ?auto_95857 ?auto_95858 ) ( CLEAR ?auto_95857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95860 ?auto_95864 ?auto_95862 ?auto_95861 ?auto_95863 ?auto_95859 ?auto_95858 )
      ( MAKE-3PILE ?auto_95857 ?auto_95858 ?auto_95859 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95869 - BLOCK
      ?auto_95870 - BLOCK
      ?auto_95871 - BLOCK
      ?auto_95872 - BLOCK
    )
    :vars
    (
      ?auto_95873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95873 ?auto_95872 ) ( CLEAR ?auto_95873 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95869 ) ( ON ?auto_95870 ?auto_95869 ) ( ON ?auto_95871 ?auto_95870 ) ( ON ?auto_95872 ?auto_95871 ) ( not ( = ?auto_95869 ?auto_95870 ) ) ( not ( = ?auto_95869 ?auto_95871 ) ) ( not ( = ?auto_95869 ?auto_95872 ) ) ( not ( = ?auto_95869 ?auto_95873 ) ) ( not ( = ?auto_95870 ?auto_95871 ) ) ( not ( = ?auto_95870 ?auto_95872 ) ) ( not ( = ?auto_95870 ?auto_95873 ) ) ( not ( = ?auto_95871 ?auto_95872 ) ) ( not ( = ?auto_95871 ?auto_95873 ) ) ( not ( = ?auto_95872 ?auto_95873 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95873 ?auto_95872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95874 - BLOCK
      ?auto_95875 - BLOCK
      ?auto_95876 - BLOCK
      ?auto_95877 - BLOCK
    )
    :vars
    (
      ?auto_95878 - BLOCK
      ?auto_95879 - BLOCK
      ?auto_95880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95878 ?auto_95877 ) ( CLEAR ?auto_95878 ) ( ON-TABLE ?auto_95874 ) ( ON ?auto_95875 ?auto_95874 ) ( ON ?auto_95876 ?auto_95875 ) ( ON ?auto_95877 ?auto_95876 ) ( not ( = ?auto_95874 ?auto_95875 ) ) ( not ( = ?auto_95874 ?auto_95876 ) ) ( not ( = ?auto_95874 ?auto_95877 ) ) ( not ( = ?auto_95874 ?auto_95878 ) ) ( not ( = ?auto_95875 ?auto_95876 ) ) ( not ( = ?auto_95875 ?auto_95877 ) ) ( not ( = ?auto_95875 ?auto_95878 ) ) ( not ( = ?auto_95876 ?auto_95877 ) ) ( not ( = ?auto_95876 ?auto_95878 ) ) ( not ( = ?auto_95877 ?auto_95878 ) ) ( HOLDING ?auto_95879 ) ( CLEAR ?auto_95880 ) ( not ( = ?auto_95874 ?auto_95879 ) ) ( not ( = ?auto_95874 ?auto_95880 ) ) ( not ( = ?auto_95875 ?auto_95879 ) ) ( not ( = ?auto_95875 ?auto_95880 ) ) ( not ( = ?auto_95876 ?auto_95879 ) ) ( not ( = ?auto_95876 ?auto_95880 ) ) ( not ( = ?auto_95877 ?auto_95879 ) ) ( not ( = ?auto_95877 ?auto_95880 ) ) ( not ( = ?auto_95878 ?auto_95879 ) ) ( not ( = ?auto_95878 ?auto_95880 ) ) ( not ( = ?auto_95879 ?auto_95880 ) ) )
    :subtasks
    ( ( !STACK ?auto_95879 ?auto_95880 )
      ( MAKE-4PILE ?auto_95874 ?auto_95875 ?auto_95876 ?auto_95877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95881 - BLOCK
      ?auto_95882 - BLOCK
      ?auto_95883 - BLOCK
      ?auto_95884 - BLOCK
    )
    :vars
    (
      ?auto_95885 - BLOCK
      ?auto_95886 - BLOCK
      ?auto_95887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95885 ?auto_95884 ) ( ON-TABLE ?auto_95881 ) ( ON ?auto_95882 ?auto_95881 ) ( ON ?auto_95883 ?auto_95882 ) ( ON ?auto_95884 ?auto_95883 ) ( not ( = ?auto_95881 ?auto_95882 ) ) ( not ( = ?auto_95881 ?auto_95883 ) ) ( not ( = ?auto_95881 ?auto_95884 ) ) ( not ( = ?auto_95881 ?auto_95885 ) ) ( not ( = ?auto_95882 ?auto_95883 ) ) ( not ( = ?auto_95882 ?auto_95884 ) ) ( not ( = ?auto_95882 ?auto_95885 ) ) ( not ( = ?auto_95883 ?auto_95884 ) ) ( not ( = ?auto_95883 ?auto_95885 ) ) ( not ( = ?auto_95884 ?auto_95885 ) ) ( CLEAR ?auto_95886 ) ( not ( = ?auto_95881 ?auto_95887 ) ) ( not ( = ?auto_95881 ?auto_95886 ) ) ( not ( = ?auto_95882 ?auto_95887 ) ) ( not ( = ?auto_95882 ?auto_95886 ) ) ( not ( = ?auto_95883 ?auto_95887 ) ) ( not ( = ?auto_95883 ?auto_95886 ) ) ( not ( = ?auto_95884 ?auto_95887 ) ) ( not ( = ?auto_95884 ?auto_95886 ) ) ( not ( = ?auto_95885 ?auto_95887 ) ) ( not ( = ?auto_95885 ?auto_95886 ) ) ( not ( = ?auto_95887 ?auto_95886 ) ) ( ON ?auto_95887 ?auto_95885 ) ( CLEAR ?auto_95887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95881 ?auto_95882 ?auto_95883 ?auto_95884 ?auto_95885 )
      ( MAKE-4PILE ?auto_95881 ?auto_95882 ?auto_95883 ?auto_95884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95888 - BLOCK
      ?auto_95889 - BLOCK
      ?auto_95890 - BLOCK
      ?auto_95891 - BLOCK
    )
    :vars
    (
      ?auto_95892 - BLOCK
      ?auto_95894 - BLOCK
      ?auto_95893 - BLOCK
      ?auto_95895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95892 ?auto_95891 ) ( ON-TABLE ?auto_95888 ) ( ON ?auto_95889 ?auto_95888 ) ( ON ?auto_95890 ?auto_95889 ) ( ON ?auto_95891 ?auto_95890 ) ( not ( = ?auto_95888 ?auto_95889 ) ) ( not ( = ?auto_95888 ?auto_95890 ) ) ( not ( = ?auto_95888 ?auto_95891 ) ) ( not ( = ?auto_95888 ?auto_95892 ) ) ( not ( = ?auto_95889 ?auto_95890 ) ) ( not ( = ?auto_95889 ?auto_95891 ) ) ( not ( = ?auto_95889 ?auto_95892 ) ) ( not ( = ?auto_95890 ?auto_95891 ) ) ( not ( = ?auto_95890 ?auto_95892 ) ) ( not ( = ?auto_95891 ?auto_95892 ) ) ( not ( = ?auto_95888 ?auto_95894 ) ) ( not ( = ?auto_95888 ?auto_95893 ) ) ( not ( = ?auto_95889 ?auto_95894 ) ) ( not ( = ?auto_95889 ?auto_95893 ) ) ( not ( = ?auto_95890 ?auto_95894 ) ) ( not ( = ?auto_95890 ?auto_95893 ) ) ( not ( = ?auto_95891 ?auto_95894 ) ) ( not ( = ?auto_95891 ?auto_95893 ) ) ( not ( = ?auto_95892 ?auto_95894 ) ) ( not ( = ?auto_95892 ?auto_95893 ) ) ( not ( = ?auto_95894 ?auto_95893 ) ) ( ON ?auto_95894 ?auto_95892 ) ( CLEAR ?auto_95894 ) ( HOLDING ?auto_95893 ) ( CLEAR ?auto_95895 ) ( ON-TABLE ?auto_95895 ) ( not ( = ?auto_95895 ?auto_95893 ) ) ( not ( = ?auto_95888 ?auto_95895 ) ) ( not ( = ?auto_95889 ?auto_95895 ) ) ( not ( = ?auto_95890 ?auto_95895 ) ) ( not ( = ?auto_95891 ?auto_95895 ) ) ( not ( = ?auto_95892 ?auto_95895 ) ) ( not ( = ?auto_95894 ?auto_95895 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95895 ?auto_95893 )
      ( MAKE-4PILE ?auto_95888 ?auto_95889 ?auto_95890 ?auto_95891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95896 - BLOCK
      ?auto_95897 - BLOCK
      ?auto_95898 - BLOCK
      ?auto_95899 - BLOCK
    )
    :vars
    (
      ?auto_95900 - BLOCK
      ?auto_95902 - BLOCK
      ?auto_95903 - BLOCK
      ?auto_95901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95900 ?auto_95899 ) ( ON-TABLE ?auto_95896 ) ( ON ?auto_95897 ?auto_95896 ) ( ON ?auto_95898 ?auto_95897 ) ( ON ?auto_95899 ?auto_95898 ) ( not ( = ?auto_95896 ?auto_95897 ) ) ( not ( = ?auto_95896 ?auto_95898 ) ) ( not ( = ?auto_95896 ?auto_95899 ) ) ( not ( = ?auto_95896 ?auto_95900 ) ) ( not ( = ?auto_95897 ?auto_95898 ) ) ( not ( = ?auto_95897 ?auto_95899 ) ) ( not ( = ?auto_95897 ?auto_95900 ) ) ( not ( = ?auto_95898 ?auto_95899 ) ) ( not ( = ?auto_95898 ?auto_95900 ) ) ( not ( = ?auto_95899 ?auto_95900 ) ) ( not ( = ?auto_95896 ?auto_95902 ) ) ( not ( = ?auto_95896 ?auto_95903 ) ) ( not ( = ?auto_95897 ?auto_95902 ) ) ( not ( = ?auto_95897 ?auto_95903 ) ) ( not ( = ?auto_95898 ?auto_95902 ) ) ( not ( = ?auto_95898 ?auto_95903 ) ) ( not ( = ?auto_95899 ?auto_95902 ) ) ( not ( = ?auto_95899 ?auto_95903 ) ) ( not ( = ?auto_95900 ?auto_95902 ) ) ( not ( = ?auto_95900 ?auto_95903 ) ) ( not ( = ?auto_95902 ?auto_95903 ) ) ( ON ?auto_95902 ?auto_95900 ) ( CLEAR ?auto_95901 ) ( ON-TABLE ?auto_95901 ) ( not ( = ?auto_95901 ?auto_95903 ) ) ( not ( = ?auto_95896 ?auto_95901 ) ) ( not ( = ?auto_95897 ?auto_95901 ) ) ( not ( = ?auto_95898 ?auto_95901 ) ) ( not ( = ?auto_95899 ?auto_95901 ) ) ( not ( = ?auto_95900 ?auto_95901 ) ) ( not ( = ?auto_95902 ?auto_95901 ) ) ( ON ?auto_95903 ?auto_95902 ) ( CLEAR ?auto_95903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95896 ?auto_95897 ?auto_95898 ?auto_95899 ?auto_95900 ?auto_95902 )
      ( MAKE-4PILE ?auto_95896 ?auto_95897 ?auto_95898 ?auto_95899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95904 - BLOCK
      ?auto_95905 - BLOCK
      ?auto_95906 - BLOCK
      ?auto_95907 - BLOCK
    )
    :vars
    (
      ?auto_95910 - BLOCK
      ?auto_95909 - BLOCK
      ?auto_95911 - BLOCK
      ?auto_95908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95910 ?auto_95907 ) ( ON-TABLE ?auto_95904 ) ( ON ?auto_95905 ?auto_95904 ) ( ON ?auto_95906 ?auto_95905 ) ( ON ?auto_95907 ?auto_95906 ) ( not ( = ?auto_95904 ?auto_95905 ) ) ( not ( = ?auto_95904 ?auto_95906 ) ) ( not ( = ?auto_95904 ?auto_95907 ) ) ( not ( = ?auto_95904 ?auto_95910 ) ) ( not ( = ?auto_95905 ?auto_95906 ) ) ( not ( = ?auto_95905 ?auto_95907 ) ) ( not ( = ?auto_95905 ?auto_95910 ) ) ( not ( = ?auto_95906 ?auto_95907 ) ) ( not ( = ?auto_95906 ?auto_95910 ) ) ( not ( = ?auto_95907 ?auto_95910 ) ) ( not ( = ?auto_95904 ?auto_95909 ) ) ( not ( = ?auto_95904 ?auto_95911 ) ) ( not ( = ?auto_95905 ?auto_95909 ) ) ( not ( = ?auto_95905 ?auto_95911 ) ) ( not ( = ?auto_95906 ?auto_95909 ) ) ( not ( = ?auto_95906 ?auto_95911 ) ) ( not ( = ?auto_95907 ?auto_95909 ) ) ( not ( = ?auto_95907 ?auto_95911 ) ) ( not ( = ?auto_95910 ?auto_95909 ) ) ( not ( = ?auto_95910 ?auto_95911 ) ) ( not ( = ?auto_95909 ?auto_95911 ) ) ( ON ?auto_95909 ?auto_95910 ) ( not ( = ?auto_95908 ?auto_95911 ) ) ( not ( = ?auto_95904 ?auto_95908 ) ) ( not ( = ?auto_95905 ?auto_95908 ) ) ( not ( = ?auto_95906 ?auto_95908 ) ) ( not ( = ?auto_95907 ?auto_95908 ) ) ( not ( = ?auto_95910 ?auto_95908 ) ) ( not ( = ?auto_95909 ?auto_95908 ) ) ( ON ?auto_95911 ?auto_95909 ) ( CLEAR ?auto_95911 ) ( HOLDING ?auto_95908 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95908 )
      ( MAKE-4PILE ?auto_95904 ?auto_95905 ?auto_95906 ?auto_95907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95912 - BLOCK
      ?auto_95913 - BLOCK
      ?auto_95914 - BLOCK
      ?auto_95915 - BLOCK
    )
    :vars
    (
      ?auto_95917 - BLOCK
      ?auto_95916 - BLOCK
      ?auto_95919 - BLOCK
      ?auto_95918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95917 ?auto_95915 ) ( ON-TABLE ?auto_95912 ) ( ON ?auto_95913 ?auto_95912 ) ( ON ?auto_95914 ?auto_95913 ) ( ON ?auto_95915 ?auto_95914 ) ( not ( = ?auto_95912 ?auto_95913 ) ) ( not ( = ?auto_95912 ?auto_95914 ) ) ( not ( = ?auto_95912 ?auto_95915 ) ) ( not ( = ?auto_95912 ?auto_95917 ) ) ( not ( = ?auto_95913 ?auto_95914 ) ) ( not ( = ?auto_95913 ?auto_95915 ) ) ( not ( = ?auto_95913 ?auto_95917 ) ) ( not ( = ?auto_95914 ?auto_95915 ) ) ( not ( = ?auto_95914 ?auto_95917 ) ) ( not ( = ?auto_95915 ?auto_95917 ) ) ( not ( = ?auto_95912 ?auto_95916 ) ) ( not ( = ?auto_95912 ?auto_95919 ) ) ( not ( = ?auto_95913 ?auto_95916 ) ) ( not ( = ?auto_95913 ?auto_95919 ) ) ( not ( = ?auto_95914 ?auto_95916 ) ) ( not ( = ?auto_95914 ?auto_95919 ) ) ( not ( = ?auto_95915 ?auto_95916 ) ) ( not ( = ?auto_95915 ?auto_95919 ) ) ( not ( = ?auto_95917 ?auto_95916 ) ) ( not ( = ?auto_95917 ?auto_95919 ) ) ( not ( = ?auto_95916 ?auto_95919 ) ) ( ON ?auto_95916 ?auto_95917 ) ( not ( = ?auto_95918 ?auto_95919 ) ) ( not ( = ?auto_95912 ?auto_95918 ) ) ( not ( = ?auto_95913 ?auto_95918 ) ) ( not ( = ?auto_95914 ?auto_95918 ) ) ( not ( = ?auto_95915 ?auto_95918 ) ) ( not ( = ?auto_95917 ?auto_95918 ) ) ( not ( = ?auto_95916 ?auto_95918 ) ) ( ON ?auto_95919 ?auto_95916 ) ( ON ?auto_95918 ?auto_95919 ) ( CLEAR ?auto_95918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95912 ?auto_95913 ?auto_95914 ?auto_95915 ?auto_95917 ?auto_95916 ?auto_95919 )
      ( MAKE-4PILE ?auto_95912 ?auto_95913 ?auto_95914 ?auto_95915 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95924 - BLOCK
      ?auto_95925 - BLOCK
      ?auto_95926 - BLOCK
      ?auto_95927 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_95927 ) ( CLEAR ?auto_95926 ) ( ON-TABLE ?auto_95924 ) ( ON ?auto_95925 ?auto_95924 ) ( ON ?auto_95926 ?auto_95925 ) ( not ( = ?auto_95924 ?auto_95925 ) ) ( not ( = ?auto_95924 ?auto_95926 ) ) ( not ( = ?auto_95924 ?auto_95927 ) ) ( not ( = ?auto_95925 ?auto_95926 ) ) ( not ( = ?auto_95925 ?auto_95927 ) ) ( not ( = ?auto_95926 ?auto_95927 ) ) )
    :subtasks
    ( ( !STACK ?auto_95927 ?auto_95926 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95928 - BLOCK
      ?auto_95929 - BLOCK
      ?auto_95930 - BLOCK
      ?auto_95931 - BLOCK
    )
    :vars
    (
      ?auto_95932 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95930 ) ( ON-TABLE ?auto_95928 ) ( ON ?auto_95929 ?auto_95928 ) ( ON ?auto_95930 ?auto_95929 ) ( not ( = ?auto_95928 ?auto_95929 ) ) ( not ( = ?auto_95928 ?auto_95930 ) ) ( not ( = ?auto_95928 ?auto_95931 ) ) ( not ( = ?auto_95929 ?auto_95930 ) ) ( not ( = ?auto_95929 ?auto_95931 ) ) ( not ( = ?auto_95930 ?auto_95931 ) ) ( ON ?auto_95931 ?auto_95932 ) ( CLEAR ?auto_95931 ) ( HAND-EMPTY ) ( not ( = ?auto_95928 ?auto_95932 ) ) ( not ( = ?auto_95929 ?auto_95932 ) ) ( not ( = ?auto_95930 ?auto_95932 ) ) ( not ( = ?auto_95931 ?auto_95932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95931 ?auto_95932 )
      ( MAKE-4PILE ?auto_95928 ?auto_95929 ?auto_95930 ?auto_95931 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95933 - BLOCK
      ?auto_95934 - BLOCK
      ?auto_95935 - BLOCK
      ?auto_95936 - BLOCK
    )
    :vars
    (
      ?auto_95937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95933 ) ( ON ?auto_95934 ?auto_95933 ) ( not ( = ?auto_95933 ?auto_95934 ) ) ( not ( = ?auto_95933 ?auto_95935 ) ) ( not ( = ?auto_95933 ?auto_95936 ) ) ( not ( = ?auto_95934 ?auto_95935 ) ) ( not ( = ?auto_95934 ?auto_95936 ) ) ( not ( = ?auto_95935 ?auto_95936 ) ) ( ON ?auto_95936 ?auto_95937 ) ( CLEAR ?auto_95936 ) ( not ( = ?auto_95933 ?auto_95937 ) ) ( not ( = ?auto_95934 ?auto_95937 ) ) ( not ( = ?auto_95935 ?auto_95937 ) ) ( not ( = ?auto_95936 ?auto_95937 ) ) ( HOLDING ?auto_95935 ) ( CLEAR ?auto_95934 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95933 ?auto_95934 ?auto_95935 )
      ( MAKE-4PILE ?auto_95933 ?auto_95934 ?auto_95935 ?auto_95936 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95938 - BLOCK
      ?auto_95939 - BLOCK
      ?auto_95940 - BLOCK
      ?auto_95941 - BLOCK
    )
    :vars
    (
      ?auto_95942 - BLOCK
      ?auto_95943 - BLOCK
      ?auto_95944 - BLOCK
      ?auto_95945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95938 ) ( ON ?auto_95939 ?auto_95938 ) ( not ( = ?auto_95938 ?auto_95939 ) ) ( not ( = ?auto_95938 ?auto_95940 ) ) ( not ( = ?auto_95938 ?auto_95941 ) ) ( not ( = ?auto_95939 ?auto_95940 ) ) ( not ( = ?auto_95939 ?auto_95941 ) ) ( not ( = ?auto_95940 ?auto_95941 ) ) ( ON ?auto_95941 ?auto_95942 ) ( not ( = ?auto_95938 ?auto_95942 ) ) ( not ( = ?auto_95939 ?auto_95942 ) ) ( not ( = ?auto_95940 ?auto_95942 ) ) ( not ( = ?auto_95941 ?auto_95942 ) ) ( CLEAR ?auto_95939 ) ( ON ?auto_95940 ?auto_95941 ) ( CLEAR ?auto_95940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95943 ) ( ON ?auto_95944 ?auto_95943 ) ( ON ?auto_95945 ?auto_95944 ) ( ON ?auto_95942 ?auto_95945 ) ( not ( = ?auto_95943 ?auto_95944 ) ) ( not ( = ?auto_95943 ?auto_95945 ) ) ( not ( = ?auto_95943 ?auto_95942 ) ) ( not ( = ?auto_95943 ?auto_95941 ) ) ( not ( = ?auto_95943 ?auto_95940 ) ) ( not ( = ?auto_95944 ?auto_95945 ) ) ( not ( = ?auto_95944 ?auto_95942 ) ) ( not ( = ?auto_95944 ?auto_95941 ) ) ( not ( = ?auto_95944 ?auto_95940 ) ) ( not ( = ?auto_95945 ?auto_95942 ) ) ( not ( = ?auto_95945 ?auto_95941 ) ) ( not ( = ?auto_95945 ?auto_95940 ) ) ( not ( = ?auto_95938 ?auto_95943 ) ) ( not ( = ?auto_95938 ?auto_95944 ) ) ( not ( = ?auto_95938 ?auto_95945 ) ) ( not ( = ?auto_95939 ?auto_95943 ) ) ( not ( = ?auto_95939 ?auto_95944 ) ) ( not ( = ?auto_95939 ?auto_95945 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_95943 ?auto_95944 ?auto_95945 ?auto_95942 ?auto_95941 )
      ( MAKE-4PILE ?auto_95938 ?auto_95939 ?auto_95940 ?auto_95941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95946 - BLOCK
      ?auto_95947 - BLOCK
      ?auto_95948 - BLOCK
      ?auto_95949 - BLOCK
    )
    :vars
    (
      ?auto_95950 - BLOCK
      ?auto_95952 - BLOCK
      ?auto_95953 - BLOCK
      ?auto_95951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95946 ) ( not ( = ?auto_95946 ?auto_95947 ) ) ( not ( = ?auto_95946 ?auto_95948 ) ) ( not ( = ?auto_95946 ?auto_95949 ) ) ( not ( = ?auto_95947 ?auto_95948 ) ) ( not ( = ?auto_95947 ?auto_95949 ) ) ( not ( = ?auto_95948 ?auto_95949 ) ) ( ON ?auto_95949 ?auto_95950 ) ( not ( = ?auto_95946 ?auto_95950 ) ) ( not ( = ?auto_95947 ?auto_95950 ) ) ( not ( = ?auto_95948 ?auto_95950 ) ) ( not ( = ?auto_95949 ?auto_95950 ) ) ( ON ?auto_95948 ?auto_95949 ) ( CLEAR ?auto_95948 ) ( ON-TABLE ?auto_95952 ) ( ON ?auto_95953 ?auto_95952 ) ( ON ?auto_95951 ?auto_95953 ) ( ON ?auto_95950 ?auto_95951 ) ( not ( = ?auto_95952 ?auto_95953 ) ) ( not ( = ?auto_95952 ?auto_95951 ) ) ( not ( = ?auto_95952 ?auto_95950 ) ) ( not ( = ?auto_95952 ?auto_95949 ) ) ( not ( = ?auto_95952 ?auto_95948 ) ) ( not ( = ?auto_95953 ?auto_95951 ) ) ( not ( = ?auto_95953 ?auto_95950 ) ) ( not ( = ?auto_95953 ?auto_95949 ) ) ( not ( = ?auto_95953 ?auto_95948 ) ) ( not ( = ?auto_95951 ?auto_95950 ) ) ( not ( = ?auto_95951 ?auto_95949 ) ) ( not ( = ?auto_95951 ?auto_95948 ) ) ( not ( = ?auto_95946 ?auto_95952 ) ) ( not ( = ?auto_95946 ?auto_95953 ) ) ( not ( = ?auto_95946 ?auto_95951 ) ) ( not ( = ?auto_95947 ?auto_95952 ) ) ( not ( = ?auto_95947 ?auto_95953 ) ) ( not ( = ?auto_95947 ?auto_95951 ) ) ( HOLDING ?auto_95947 ) ( CLEAR ?auto_95946 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95946 ?auto_95947 )
      ( MAKE-4PILE ?auto_95946 ?auto_95947 ?auto_95948 ?auto_95949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95954 - BLOCK
      ?auto_95955 - BLOCK
      ?auto_95956 - BLOCK
      ?auto_95957 - BLOCK
    )
    :vars
    (
      ?auto_95961 - BLOCK
      ?auto_95958 - BLOCK
      ?auto_95960 - BLOCK
      ?auto_95959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95954 ) ( not ( = ?auto_95954 ?auto_95955 ) ) ( not ( = ?auto_95954 ?auto_95956 ) ) ( not ( = ?auto_95954 ?auto_95957 ) ) ( not ( = ?auto_95955 ?auto_95956 ) ) ( not ( = ?auto_95955 ?auto_95957 ) ) ( not ( = ?auto_95956 ?auto_95957 ) ) ( ON ?auto_95957 ?auto_95961 ) ( not ( = ?auto_95954 ?auto_95961 ) ) ( not ( = ?auto_95955 ?auto_95961 ) ) ( not ( = ?auto_95956 ?auto_95961 ) ) ( not ( = ?auto_95957 ?auto_95961 ) ) ( ON ?auto_95956 ?auto_95957 ) ( ON-TABLE ?auto_95958 ) ( ON ?auto_95960 ?auto_95958 ) ( ON ?auto_95959 ?auto_95960 ) ( ON ?auto_95961 ?auto_95959 ) ( not ( = ?auto_95958 ?auto_95960 ) ) ( not ( = ?auto_95958 ?auto_95959 ) ) ( not ( = ?auto_95958 ?auto_95961 ) ) ( not ( = ?auto_95958 ?auto_95957 ) ) ( not ( = ?auto_95958 ?auto_95956 ) ) ( not ( = ?auto_95960 ?auto_95959 ) ) ( not ( = ?auto_95960 ?auto_95961 ) ) ( not ( = ?auto_95960 ?auto_95957 ) ) ( not ( = ?auto_95960 ?auto_95956 ) ) ( not ( = ?auto_95959 ?auto_95961 ) ) ( not ( = ?auto_95959 ?auto_95957 ) ) ( not ( = ?auto_95959 ?auto_95956 ) ) ( not ( = ?auto_95954 ?auto_95958 ) ) ( not ( = ?auto_95954 ?auto_95960 ) ) ( not ( = ?auto_95954 ?auto_95959 ) ) ( not ( = ?auto_95955 ?auto_95958 ) ) ( not ( = ?auto_95955 ?auto_95960 ) ) ( not ( = ?auto_95955 ?auto_95959 ) ) ( CLEAR ?auto_95954 ) ( ON ?auto_95955 ?auto_95956 ) ( CLEAR ?auto_95955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_95958 ?auto_95960 ?auto_95959 ?auto_95961 ?auto_95957 ?auto_95956 )
      ( MAKE-4PILE ?auto_95954 ?auto_95955 ?auto_95956 ?auto_95957 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95962 - BLOCK
      ?auto_95963 - BLOCK
      ?auto_95964 - BLOCK
      ?auto_95965 - BLOCK
    )
    :vars
    (
      ?auto_95968 - BLOCK
      ?auto_95966 - BLOCK
      ?auto_95967 - BLOCK
      ?auto_95969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95962 ?auto_95963 ) ) ( not ( = ?auto_95962 ?auto_95964 ) ) ( not ( = ?auto_95962 ?auto_95965 ) ) ( not ( = ?auto_95963 ?auto_95964 ) ) ( not ( = ?auto_95963 ?auto_95965 ) ) ( not ( = ?auto_95964 ?auto_95965 ) ) ( ON ?auto_95965 ?auto_95968 ) ( not ( = ?auto_95962 ?auto_95968 ) ) ( not ( = ?auto_95963 ?auto_95968 ) ) ( not ( = ?auto_95964 ?auto_95968 ) ) ( not ( = ?auto_95965 ?auto_95968 ) ) ( ON ?auto_95964 ?auto_95965 ) ( ON-TABLE ?auto_95966 ) ( ON ?auto_95967 ?auto_95966 ) ( ON ?auto_95969 ?auto_95967 ) ( ON ?auto_95968 ?auto_95969 ) ( not ( = ?auto_95966 ?auto_95967 ) ) ( not ( = ?auto_95966 ?auto_95969 ) ) ( not ( = ?auto_95966 ?auto_95968 ) ) ( not ( = ?auto_95966 ?auto_95965 ) ) ( not ( = ?auto_95966 ?auto_95964 ) ) ( not ( = ?auto_95967 ?auto_95969 ) ) ( not ( = ?auto_95967 ?auto_95968 ) ) ( not ( = ?auto_95967 ?auto_95965 ) ) ( not ( = ?auto_95967 ?auto_95964 ) ) ( not ( = ?auto_95969 ?auto_95968 ) ) ( not ( = ?auto_95969 ?auto_95965 ) ) ( not ( = ?auto_95969 ?auto_95964 ) ) ( not ( = ?auto_95962 ?auto_95966 ) ) ( not ( = ?auto_95962 ?auto_95967 ) ) ( not ( = ?auto_95962 ?auto_95969 ) ) ( not ( = ?auto_95963 ?auto_95966 ) ) ( not ( = ?auto_95963 ?auto_95967 ) ) ( not ( = ?auto_95963 ?auto_95969 ) ) ( ON ?auto_95963 ?auto_95964 ) ( CLEAR ?auto_95963 ) ( HOLDING ?auto_95962 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95962 )
      ( MAKE-4PILE ?auto_95962 ?auto_95963 ?auto_95964 ?auto_95965 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_95970 - BLOCK
      ?auto_95971 - BLOCK
      ?auto_95972 - BLOCK
      ?auto_95973 - BLOCK
    )
    :vars
    (
      ?auto_95975 - BLOCK
      ?auto_95974 - BLOCK
      ?auto_95976 - BLOCK
      ?auto_95977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95970 ?auto_95971 ) ) ( not ( = ?auto_95970 ?auto_95972 ) ) ( not ( = ?auto_95970 ?auto_95973 ) ) ( not ( = ?auto_95971 ?auto_95972 ) ) ( not ( = ?auto_95971 ?auto_95973 ) ) ( not ( = ?auto_95972 ?auto_95973 ) ) ( ON ?auto_95973 ?auto_95975 ) ( not ( = ?auto_95970 ?auto_95975 ) ) ( not ( = ?auto_95971 ?auto_95975 ) ) ( not ( = ?auto_95972 ?auto_95975 ) ) ( not ( = ?auto_95973 ?auto_95975 ) ) ( ON ?auto_95972 ?auto_95973 ) ( ON-TABLE ?auto_95974 ) ( ON ?auto_95976 ?auto_95974 ) ( ON ?auto_95977 ?auto_95976 ) ( ON ?auto_95975 ?auto_95977 ) ( not ( = ?auto_95974 ?auto_95976 ) ) ( not ( = ?auto_95974 ?auto_95977 ) ) ( not ( = ?auto_95974 ?auto_95975 ) ) ( not ( = ?auto_95974 ?auto_95973 ) ) ( not ( = ?auto_95974 ?auto_95972 ) ) ( not ( = ?auto_95976 ?auto_95977 ) ) ( not ( = ?auto_95976 ?auto_95975 ) ) ( not ( = ?auto_95976 ?auto_95973 ) ) ( not ( = ?auto_95976 ?auto_95972 ) ) ( not ( = ?auto_95977 ?auto_95975 ) ) ( not ( = ?auto_95977 ?auto_95973 ) ) ( not ( = ?auto_95977 ?auto_95972 ) ) ( not ( = ?auto_95970 ?auto_95974 ) ) ( not ( = ?auto_95970 ?auto_95976 ) ) ( not ( = ?auto_95970 ?auto_95977 ) ) ( not ( = ?auto_95971 ?auto_95974 ) ) ( not ( = ?auto_95971 ?auto_95976 ) ) ( not ( = ?auto_95971 ?auto_95977 ) ) ( ON ?auto_95971 ?auto_95972 ) ( ON ?auto_95970 ?auto_95971 ) ( CLEAR ?auto_95970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_95974 ?auto_95976 ?auto_95977 ?auto_95975 ?auto_95973 ?auto_95972 ?auto_95971 )
      ( MAKE-4PILE ?auto_95970 ?auto_95971 ?auto_95972 ?auto_95973 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95981 - BLOCK
      ?auto_95982 - BLOCK
      ?auto_95983 - BLOCK
    )
    :vars
    (
      ?auto_95984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95984 ?auto_95983 ) ( CLEAR ?auto_95984 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95981 ) ( ON ?auto_95982 ?auto_95981 ) ( ON ?auto_95983 ?auto_95982 ) ( not ( = ?auto_95981 ?auto_95982 ) ) ( not ( = ?auto_95981 ?auto_95983 ) ) ( not ( = ?auto_95981 ?auto_95984 ) ) ( not ( = ?auto_95982 ?auto_95983 ) ) ( not ( = ?auto_95982 ?auto_95984 ) ) ( not ( = ?auto_95983 ?auto_95984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_95984 ?auto_95983 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95985 - BLOCK
      ?auto_95986 - BLOCK
      ?auto_95987 - BLOCK
    )
    :vars
    (
      ?auto_95988 - BLOCK
      ?auto_95989 - BLOCK
      ?auto_95990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95988 ?auto_95987 ) ( CLEAR ?auto_95988 ) ( ON-TABLE ?auto_95985 ) ( ON ?auto_95986 ?auto_95985 ) ( ON ?auto_95987 ?auto_95986 ) ( not ( = ?auto_95985 ?auto_95986 ) ) ( not ( = ?auto_95985 ?auto_95987 ) ) ( not ( = ?auto_95985 ?auto_95988 ) ) ( not ( = ?auto_95986 ?auto_95987 ) ) ( not ( = ?auto_95986 ?auto_95988 ) ) ( not ( = ?auto_95987 ?auto_95988 ) ) ( HOLDING ?auto_95989 ) ( CLEAR ?auto_95990 ) ( not ( = ?auto_95985 ?auto_95989 ) ) ( not ( = ?auto_95985 ?auto_95990 ) ) ( not ( = ?auto_95986 ?auto_95989 ) ) ( not ( = ?auto_95986 ?auto_95990 ) ) ( not ( = ?auto_95987 ?auto_95989 ) ) ( not ( = ?auto_95987 ?auto_95990 ) ) ( not ( = ?auto_95988 ?auto_95989 ) ) ( not ( = ?auto_95988 ?auto_95990 ) ) ( not ( = ?auto_95989 ?auto_95990 ) ) )
    :subtasks
    ( ( !STACK ?auto_95989 ?auto_95990 )
      ( MAKE-3PILE ?auto_95985 ?auto_95986 ?auto_95987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95991 - BLOCK
      ?auto_95992 - BLOCK
      ?auto_95993 - BLOCK
    )
    :vars
    (
      ?auto_95996 - BLOCK
      ?auto_95995 - BLOCK
      ?auto_95994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95996 ?auto_95993 ) ( ON-TABLE ?auto_95991 ) ( ON ?auto_95992 ?auto_95991 ) ( ON ?auto_95993 ?auto_95992 ) ( not ( = ?auto_95991 ?auto_95992 ) ) ( not ( = ?auto_95991 ?auto_95993 ) ) ( not ( = ?auto_95991 ?auto_95996 ) ) ( not ( = ?auto_95992 ?auto_95993 ) ) ( not ( = ?auto_95992 ?auto_95996 ) ) ( not ( = ?auto_95993 ?auto_95996 ) ) ( CLEAR ?auto_95995 ) ( not ( = ?auto_95991 ?auto_95994 ) ) ( not ( = ?auto_95991 ?auto_95995 ) ) ( not ( = ?auto_95992 ?auto_95994 ) ) ( not ( = ?auto_95992 ?auto_95995 ) ) ( not ( = ?auto_95993 ?auto_95994 ) ) ( not ( = ?auto_95993 ?auto_95995 ) ) ( not ( = ?auto_95996 ?auto_95994 ) ) ( not ( = ?auto_95996 ?auto_95995 ) ) ( not ( = ?auto_95994 ?auto_95995 ) ) ( ON ?auto_95994 ?auto_95996 ) ( CLEAR ?auto_95994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_95991 ?auto_95992 ?auto_95993 ?auto_95996 )
      ( MAKE-3PILE ?auto_95991 ?auto_95992 ?auto_95993 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_95997 - BLOCK
      ?auto_95998 - BLOCK
      ?auto_95999 - BLOCK
    )
    :vars
    (
      ?auto_96001 - BLOCK
      ?auto_96002 - BLOCK
      ?auto_96000 - BLOCK
      ?auto_96003 - BLOCK
      ?auto_96004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96001 ?auto_95999 ) ( ON-TABLE ?auto_95997 ) ( ON ?auto_95998 ?auto_95997 ) ( ON ?auto_95999 ?auto_95998 ) ( not ( = ?auto_95997 ?auto_95998 ) ) ( not ( = ?auto_95997 ?auto_95999 ) ) ( not ( = ?auto_95997 ?auto_96001 ) ) ( not ( = ?auto_95998 ?auto_95999 ) ) ( not ( = ?auto_95998 ?auto_96001 ) ) ( not ( = ?auto_95999 ?auto_96001 ) ) ( not ( = ?auto_95997 ?auto_96002 ) ) ( not ( = ?auto_95997 ?auto_96000 ) ) ( not ( = ?auto_95998 ?auto_96002 ) ) ( not ( = ?auto_95998 ?auto_96000 ) ) ( not ( = ?auto_95999 ?auto_96002 ) ) ( not ( = ?auto_95999 ?auto_96000 ) ) ( not ( = ?auto_96001 ?auto_96002 ) ) ( not ( = ?auto_96001 ?auto_96000 ) ) ( not ( = ?auto_96002 ?auto_96000 ) ) ( ON ?auto_96002 ?auto_96001 ) ( CLEAR ?auto_96002 ) ( HOLDING ?auto_96000 ) ( CLEAR ?auto_96003 ) ( ON-TABLE ?auto_96004 ) ( ON ?auto_96003 ?auto_96004 ) ( not ( = ?auto_96004 ?auto_96003 ) ) ( not ( = ?auto_96004 ?auto_96000 ) ) ( not ( = ?auto_96003 ?auto_96000 ) ) ( not ( = ?auto_95997 ?auto_96003 ) ) ( not ( = ?auto_95997 ?auto_96004 ) ) ( not ( = ?auto_95998 ?auto_96003 ) ) ( not ( = ?auto_95998 ?auto_96004 ) ) ( not ( = ?auto_95999 ?auto_96003 ) ) ( not ( = ?auto_95999 ?auto_96004 ) ) ( not ( = ?auto_96001 ?auto_96003 ) ) ( not ( = ?auto_96001 ?auto_96004 ) ) ( not ( = ?auto_96002 ?auto_96003 ) ) ( not ( = ?auto_96002 ?auto_96004 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96004 ?auto_96003 ?auto_96000 )
      ( MAKE-3PILE ?auto_95997 ?auto_95998 ?auto_95999 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96005 - BLOCK
      ?auto_96006 - BLOCK
      ?auto_96007 - BLOCK
    )
    :vars
    (
      ?auto_96012 - BLOCK
      ?auto_96010 - BLOCK
      ?auto_96011 - BLOCK
      ?auto_96009 - BLOCK
      ?auto_96008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96012 ?auto_96007 ) ( ON-TABLE ?auto_96005 ) ( ON ?auto_96006 ?auto_96005 ) ( ON ?auto_96007 ?auto_96006 ) ( not ( = ?auto_96005 ?auto_96006 ) ) ( not ( = ?auto_96005 ?auto_96007 ) ) ( not ( = ?auto_96005 ?auto_96012 ) ) ( not ( = ?auto_96006 ?auto_96007 ) ) ( not ( = ?auto_96006 ?auto_96012 ) ) ( not ( = ?auto_96007 ?auto_96012 ) ) ( not ( = ?auto_96005 ?auto_96010 ) ) ( not ( = ?auto_96005 ?auto_96011 ) ) ( not ( = ?auto_96006 ?auto_96010 ) ) ( not ( = ?auto_96006 ?auto_96011 ) ) ( not ( = ?auto_96007 ?auto_96010 ) ) ( not ( = ?auto_96007 ?auto_96011 ) ) ( not ( = ?auto_96012 ?auto_96010 ) ) ( not ( = ?auto_96012 ?auto_96011 ) ) ( not ( = ?auto_96010 ?auto_96011 ) ) ( ON ?auto_96010 ?auto_96012 ) ( CLEAR ?auto_96009 ) ( ON-TABLE ?auto_96008 ) ( ON ?auto_96009 ?auto_96008 ) ( not ( = ?auto_96008 ?auto_96009 ) ) ( not ( = ?auto_96008 ?auto_96011 ) ) ( not ( = ?auto_96009 ?auto_96011 ) ) ( not ( = ?auto_96005 ?auto_96009 ) ) ( not ( = ?auto_96005 ?auto_96008 ) ) ( not ( = ?auto_96006 ?auto_96009 ) ) ( not ( = ?auto_96006 ?auto_96008 ) ) ( not ( = ?auto_96007 ?auto_96009 ) ) ( not ( = ?auto_96007 ?auto_96008 ) ) ( not ( = ?auto_96012 ?auto_96009 ) ) ( not ( = ?auto_96012 ?auto_96008 ) ) ( not ( = ?auto_96010 ?auto_96009 ) ) ( not ( = ?auto_96010 ?auto_96008 ) ) ( ON ?auto_96011 ?auto_96010 ) ( CLEAR ?auto_96011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96005 ?auto_96006 ?auto_96007 ?auto_96012 ?auto_96010 )
      ( MAKE-3PILE ?auto_96005 ?auto_96006 ?auto_96007 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96013 - BLOCK
      ?auto_96014 - BLOCK
      ?auto_96015 - BLOCK
    )
    :vars
    (
      ?auto_96020 - BLOCK
      ?auto_96019 - BLOCK
      ?auto_96018 - BLOCK
      ?auto_96017 - BLOCK
      ?auto_96016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96020 ?auto_96015 ) ( ON-TABLE ?auto_96013 ) ( ON ?auto_96014 ?auto_96013 ) ( ON ?auto_96015 ?auto_96014 ) ( not ( = ?auto_96013 ?auto_96014 ) ) ( not ( = ?auto_96013 ?auto_96015 ) ) ( not ( = ?auto_96013 ?auto_96020 ) ) ( not ( = ?auto_96014 ?auto_96015 ) ) ( not ( = ?auto_96014 ?auto_96020 ) ) ( not ( = ?auto_96015 ?auto_96020 ) ) ( not ( = ?auto_96013 ?auto_96019 ) ) ( not ( = ?auto_96013 ?auto_96018 ) ) ( not ( = ?auto_96014 ?auto_96019 ) ) ( not ( = ?auto_96014 ?auto_96018 ) ) ( not ( = ?auto_96015 ?auto_96019 ) ) ( not ( = ?auto_96015 ?auto_96018 ) ) ( not ( = ?auto_96020 ?auto_96019 ) ) ( not ( = ?auto_96020 ?auto_96018 ) ) ( not ( = ?auto_96019 ?auto_96018 ) ) ( ON ?auto_96019 ?auto_96020 ) ( ON-TABLE ?auto_96017 ) ( not ( = ?auto_96017 ?auto_96016 ) ) ( not ( = ?auto_96017 ?auto_96018 ) ) ( not ( = ?auto_96016 ?auto_96018 ) ) ( not ( = ?auto_96013 ?auto_96016 ) ) ( not ( = ?auto_96013 ?auto_96017 ) ) ( not ( = ?auto_96014 ?auto_96016 ) ) ( not ( = ?auto_96014 ?auto_96017 ) ) ( not ( = ?auto_96015 ?auto_96016 ) ) ( not ( = ?auto_96015 ?auto_96017 ) ) ( not ( = ?auto_96020 ?auto_96016 ) ) ( not ( = ?auto_96020 ?auto_96017 ) ) ( not ( = ?auto_96019 ?auto_96016 ) ) ( not ( = ?auto_96019 ?auto_96017 ) ) ( ON ?auto_96018 ?auto_96019 ) ( CLEAR ?auto_96018 ) ( HOLDING ?auto_96016 ) ( CLEAR ?auto_96017 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96017 ?auto_96016 )
      ( MAKE-3PILE ?auto_96013 ?auto_96014 ?auto_96015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96021 - BLOCK
      ?auto_96022 - BLOCK
      ?auto_96023 - BLOCK
    )
    :vars
    (
      ?auto_96024 - BLOCK
      ?auto_96025 - BLOCK
      ?auto_96026 - BLOCK
      ?auto_96027 - BLOCK
      ?auto_96028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96024 ?auto_96023 ) ( ON-TABLE ?auto_96021 ) ( ON ?auto_96022 ?auto_96021 ) ( ON ?auto_96023 ?auto_96022 ) ( not ( = ?auto_96021 ?auto_96022 ) ) ( not ( = ?auto_96021 ?auto_96023 ) ) ( not ( = ?auto_96021 ?auto_96024 ) ) ( not ( = ?auto_96022 ?auto_96023 ) ) ( not ( = ?auto_96022 ?auto_96024 ) ) ( not ( = ?auto_96023 ?auto_96024 ) ) ( not ( = ?auto_96021 ?auto_96025 ) ) ( not ( = ?auto_96021 ?auto_96026 ) ) ( not ( = ?auto_96022 ?auto_96025 ) ) ( not ( = ?auto_96022 ?auto_96026 ) ) ( not ( = ?auto_96023 ?auto_96025 ) ) ( not ( = ?auto_96023 ?auto_96026 ) ) ( not ( = ?auto_96024 ?auto_96025 ) ) ( not ( = ?auto_96024 ?auto_96026 ) ) ( not ( = ?auto_96025 ?auto_96026 ) ) ( ON ?auto_96025 ?auto_96024 ) ( ON-TABLE ?auto_96027 ) ( not ( = ?auto_96027 ?auto_96028 ) ) ( not ( = ?auto_96027 ?auto_96026 ) ) ( not ( = ?auto_96028 ?auto_96026 ) ) ( not ( = ?auto_96021 ?auto_96028 ) ) ( not ( = ?auto_96021 ?auto_96027 ) ) ( not ( = ?auto_96022 ?auto_96028 ) ) ( not ( = ?auto_96022 ?auto_96027 ) ) ( not ( = ?auto_96023 ?auto_96028 ) ) ( not ( = ?auto_96023 ?auto_96027 ) ) ( not ( = ?auto_96024 ?auto_96028 ) ) ( not ( = ?auto_96024 ?auto_96027 ) ) ( not ( = ?auto_96025 ?auto_96028 ) ) ( not ( = ?auto_96025 ?auto_96027 ) ) ( ON ?auto_96026 ?auto_96025 ) ( CLEAR ?auto_96027 ) ( ON ?auto_96028 ?auto_96026 ) ( CLEAR ?auto_96028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96021 ?auto_96022 ?auto_96023 ?auto_96024 ?auto_96025 ?auto_96026 )
      ( MAKE-3PILE ?auto_96021 ?auto_96022 ?auto_96023 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96029 - BLOCK
      ?auto_96030 - BLOCK
      ?auto_96031 - BLOCK
    )
    :vars
    (
      ?auto_96035 - BLOCK
      ?auto_96032 - BLOCK
      ?auto_96036 - BLOCK
      ?auto_96034 - BLOCK
      ?auto_96033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96035 ?auto_96031 ) ( ON-TABLE ?auto_96029 ) ( ON ?auto_96030 ?auto_96029 ) ( ON ?auto_96031 ?auto_96030 ) ( not ( = ?auto_96029 ?auto_96030 ) ) ( not ( = ?auto_96029 ?auto_96031 ) ) ( not ( = ?auto_96029 ?auto_96035 ) ) ( not ( = ?auto_96030 ?auto_96031 ) ) ( not ( = ?auto_96030 ?auto_96035 ) ) ( not ( = ?auto_96031 ?auto_96035 ) ) ( not ( = ?auto_96029 ?auto_96032 ) ) ( not ( = ?auto_96029 ?auto_96036 ) ) ( not ( = ?auto_96030 ?auto_96032 ) ) ( not ( = ?auto_96030 ?auto_96036 ) ) ( not ( = ?auto_96031 ?auto_96032 ) ) ( not ( = ?auto_96031 ?auto_96036 ) ) ( not ( = ?auto_96035 ?auto_96032 ) ) ( not ( = ?auto_96035 ?auto_96036 ) ) ( not ( = ?auto_96032 ?auto_96036 ) ) ( ON ?auto_96032 ?auto_96035 ) ( not ( = ?auto_96034 ?auto_96033 ) ) ( not ( = ?auto_96034 ?auto_96036 ) ) ( not ( = ?auto_96033 ?auto_96036 ) ) ( not ( = ?auto_96029 ?auto_96033 ) ) ( not ( = ?auto_96029 ?auto_96034 ) ) ( not ( = ?auto_96030 ?auto_96033 ) ) ( not ( = ?auto_96030 ?auto_96034 ) ) ( not ( = ?auto_96031 ?auto_96033 ) ) ( not ( = ?auto_96031 ?auto_96034 ) ) ( not ( = ?auto_96035 ?auto_96033 ) ) ( not ( = ?auto_96035 ?auto_96034 ) ) ( not ( = ?auto_96032 ?auto_96033 ) ) ( not ( = ?auto_96032 ?auto_96034 ) ) ( ON ?auto_96036 ?auto_96032 ) ( ON ?auto_96033 ?auto_96036 ) ( CLEAR ?auto_96033 ) ( HOLDING ?auto_96034 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96034 )
      ( MAKE-3PILE ?auto_96029 ?auto_96030 ?auto_96031 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96037 - BLOCK
      ?auto_96038 - BLOCK
      ?auto_96039 - BLOCK
    )
    :vars
    (
      ?auto_96044 - BLOCK
      ?auto_96043 - BLOCK
      ?auto_96041 - BLOCK
      ?auto_96040 - BLOCK
      ?auto_96042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96044 ?auto_96039 ) ( ON-TABLE ?auto_96037 ) ( ON ?auto_96038 ?auto_96037 ) ( ON ?auto_96039 ?auto_96038 ) ( not ( = ?auto_96037 ?auto_96038 ) ) ( not ( = ?auto_96037 ?auto_96039 ) ) ( not ( = ?auto_96037 ?auto_96044 ) ) ( not ( = ?auto_96038 ?auto_96039 ) ) ( not ( = ?auto_96038 ?auto_96044 ) ) ( not ( = ?auto_96039 ?auto_96044 ) ) ( not ( = ?auto_96037 ?auto_96043 ) ) ( not ( = ?auto_96037 ?auto_96041 ) ) ( not ( = ?auto_96038 ?auto_96043 ) ) ( not ( = ?auto_96038 ?auto_96041 ) ) ( not ( = ?auto_96039 ?auto_96043 ) ) ( not ( = ?auto_96039 ?auto_96041 ) ) ( not ( = ?auto_96044 ?auto_96043 ) ) ( not ( = ?auto_96044 ?auto_96041 ) ) ( not ( = ?auto_96043 ?auto_96041 ) ) ( ON ?auto_96043 ?auto_96044 ) ( not ( = ?auto_96040 ?auto_96042 ) ) ( not ( = ?auto_96040 ?auto_96041 ) ) ( not ( = ?auto_96042 ?auto_96041 ) ) ( not ( = ?auto_96037 ?auto_96042 ) ) ( not ( = ?auto_96037 ?auto_96040 ) ) ( not ( = ?auto_96038 ?auto_96042 ) ) ( not ( = ?auto_96038 ?auto_96040 ) ) ( not ( = ?auto_96039 ?auto_96042 ) ) ( not ( = ?auto_96039 ?auto_96040 ) ) ( not ( = ?auto_96044 ?auto_96042 ) ) ( not ( = ?auto_96044 ?auto_96040 ) ) ( not ( = ?auto_96043 ?auto_96042 ) ) ( not ( = ?auto_96043 ?auto_96040 ) ) ( ON ?auto_96041 ?auto_96043 ) ( ON ?auto_96042 ?auto_96041 ) ( ON ?auto_96040 ?auto_96042 ) ( CLEAR ?auto_96040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96037 ?auto_96038 ?auto_96039 ?auto_96044 ?auto_96043 ?auto_96041 ?auto_96042 )
      ( MAKE-3PILE ?auto_96037 ?auto_96038 ?auto_96039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96050 - BLOCK
      ?auto_96051 - BLOCK
      ?auto_96052 - BLOCK
      ?auto_96053 - BLOCK
      ?auto_96054 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_96054 ) ( CLEAR ?auto_96053 ) ( ON-TABLE ?auto_96050 ) ( ON ?auto_96051 ?auto_96050 ) ( ON ?auto_96052 ?auto_96051 ) ( ON ?auto_96053 ?auto_96052 ) ( not ( = ?auto_96050 ?auto_96051 ) ) ( not ( = ?auto_96050 ?auto_96052 ) ) ( not ( = ?auto_96050 ?auto_96053 ) ) ( not ( = ?auto_96050 ?auto_96054 ) ) ( not ( = ?auto_96051 ?auto_96052 ) ) ( not ( = ?auto_96051 ?auto_96053 ) ) ( not ( = ?auto_96051 ?auto_96054 ) ) ( not ( = ?auto_96052 ?auto_96053 ) ) ( not ( = ?auto_96052 ?auto_96054 ) ) ( not ( = ?auto_96053 ?auto_96054 ) ) )
    :subtasks
    ( ( !STACK ?auto_96054 ?auto_96053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96055 - BLOCK
      ?auto_96056 - BLOCK
      ?auto_96057 - BLOCK
      ?auto_96058 - BLOCK
      ?auto_96059 - BLOCK
    )
    :vars
    (
      ?auto_96060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96058 ) ( ON-TABLE ?auto_96055 ) ( ON ?auto_96056 ?auto_96055 ) ( ON ?auto_96057 ?auto_96056 ) ( ON ?auto_96058 ?auto_96057 ) ( not ( = ?auto_96055 ?auto_96056 ) ) ( not ( = ?auto_96055 ?auto_96057 ) ) ( not ( = ?auto_96055 ?auto_96058 ) ) ( not ( = ?auto_96055 ?auto_96059 ) ) ( not ( = ?auto_96056 ?auto_96057 ) ) ( not ( = ?auto_96056 ?auto_96058 ) ) ( not ( = ?auto_96056 ?auto_96059 ) ) ( not ( = ?auto_96057 ?auto_96058 ) ) ( not ( = ?auto_96057 ?auto_96059 ) ) ( not ( = ?auto_96058 ?auto_96059 ) ) ( ON ?auto_96059 ?auto_96060 ) ( CLEAR ?auto_96059 ) ( HAND-EMPTY ) ( not ( = ?auto_96055 ?auto_96060 ) ) ( not ( = ?auto_96056 ?auto_96060 ) ) ( not ( = ?auto_96057 ?auto_96060 ) ) ( not ( = ?auto_96058 ?auto_96060 ) ) ( not ( = ?auto_96059 ?auto_96060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96059 ?auto_96060 )
      ( MAKE-5PILE ?auto_96055 ?auto_96056 ?auto_96057 ?auto_96058 ?auto_96059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96061 - BLOCK
      ?auto_96062 - BLOCK
      ?auto_96063 - BLOCK
      ?auto_96064 - BLOCK
      ?auto_96065 - BLOCK
    )
    :vars
    (
      ?auto_96066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96061 ) ( ON ?auto_96062 ?auto_96061 ) ( ON ?auto_96063 ?auto_96062 ) ( not ( = ?auto_96061 ?auto_96062 ) ) ( not ( = ?auto_96061 ?auto_96063 ) ) ( not ( = ?auto_96061 ?auto_96064 ) ) ( not ( = ?auto_96061 ?auto_96065 ) ) ( not ( = ?auto_96062 ?auto_96063 ) ) ( not ( = ?auto_96062 ?auto_96064 ) ) ( not ( = ?auto_96062 ?auto_96065 ) ) ( not ( = ?auto_96063 ?auto_96064 ) ) ( not ( = ?auto_96063 ?auto_96065 ) ) ( not ( = ?auto_96064 ?auto_96065 ) ) ( ON ?auto_96065 ?auto_96066 ) ( CLEAR ?auto_96065 ) ( not ( = ?auto_96061 ?auto_96066 ) ) ( not ( = ?auto_96062 ?auto_96066 ) ) ( not ( = ?auto_96063 ?auto_96066 ) ) ( not ( = ?auto_96064 ?auto_96066 ) ) ( not ( = ?auto_96065 ?auto_96066 ) ) ( HOLDING ?auto_96064 ) ( CLEAR ?auto_96063 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96061 ?auto_96062 ?auto_96063 ?auto_96064 )
      ( MAKE-5PILE ?auto_96061 ?auto_96062 ?auto_96063 ?auto_96064 ?auto_96065 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96067 - BLOCK
      ?auto_96068 - BLOCK
      ?auto_96069 - BLOCK
      ?auto_96070 - BLOCK
      ?auto_96071 - BLOCK
    )
    :vars
    (
      ?auto_96072 - BLOCK
      ?auto_96074 - BLOCK
      ?auto_96073 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96067 ) ( ON ?auto_96068 ?auto_96067 ) ( ON ?auto_96069 ?auto_96068 ) ( not ( = ?auto_96067 ?auto_96068 ) ) ( not ( = ?auto_96067 ?auto_96069 ) ) ( not ( = ?auto_96067 ?auto_96070 ) ) ( not ( = ?auto_96067 ?auto_96071 ) ) ( not ( = ?auto_96068 ?auto_96069 ) ) ( not ( = ?auto_96068 ?auto_96070 ) ) ( not ( = ?auto_96068 ?auto_96071 ) ) ( not ( = ?auto_96069 ?auto_96070 ) ) ( not ( = ?auto_96069 ?auto_96071 ) ) ( not ( = ?auto_96070 ?auto_96071 ) ) ( ON ?auto_96071 ?auto_96072 ) ( not ( = ?auto_96067 ?auto_96072 ) ) ( not ( = ?auto_96068 ?auto_96072 ) ) ( not ( = ?auto_96069 ?auto_96072 ) ) ( not ( = ?auto_96070 ?auto_96072 ) ) ( not ( = ?auto_96071 ?auto_96072 ) ) ( CLEAR ?auto_96069 ) ( ON ?auto_96070 ?auto_96071 ) ( CLEAR ?auto_96070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96074 ) ( ON ?auto_96073 ?auto_96074 ) ( ON ?auto_96072 ?auto_96073 ) ( not ( = ?auto_96074 ?auto_96073 ) ) ( not ( = ?auto_96074 ?auto_96072 ) ) ( not ( = ?auto_96074 ?auto_96071 ) ) ( not ( = ?auto_96074 ?auto_96070 ) ) ( not ( = ?auto_96073 ?auto_96072 ) ) ( not ( = ?auto_96073 ?auto_96071 ) ) ( not ( = ?auto_96073 ?auto_96070 ) ) ( not ( = ?auto_96067 ?auto_96074 ) ) ( not ( = ?auto_96067 ?auto_96073 ) ) ( not ( = ?auto_96068 ?auto_96074 ) ) ( not ( = ?auto_96068 ?auto_96073 ) ) ( not ( = ?auto_96069 ?auto_96074 ) ) ( not ( = ?auto_96069 ?auto_96073 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96074 ?auto_96073 ?auto_96072 ?auto_96071 )
      ( MAKE-5PILE ?auto_96067 ?auto_96068 ?auto_96069 ?auto_96070 ?auto_96071 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96075 - BLOCK
      ?auto_96076 - BLOCK
      ?auto_96077 - BLOCK
      ?auto_96078 - BLOCK
      ?auto_96079 - BLOCK
    )
    :vars
    (
      ?auto_96080 - BLOCK
      ?auto_96082 - BLOCK
      ?auto_96081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96075 ) ( ON ?auto_96076 ?auto_96075 ) ( not ( = ?auto_96075 ?auto_96076 ) ) ( not ( = ?auto_96075 ?auto_96077 ) ) ( not ( = ?auto_96075 ?auto_96078 ) ) ( not ( = ?auto_96075 ?auto_96079 ) ) ( not ( = ?auto_96076 ?auto_96077 ) ) ( not ( = ?auto_96076 ?auto_96078 ) ) ( not ( = ?auto_96076 ?auto_96079 ) ) ( not ( = ?auto_96077 ?auto_96078 ) ) ( not ( = ?auto_96077 ?auto_96079 ) ) ( not ( = ?auto_96078 ?auto_96079 ) ) ( ON ?auto_96079 ?auto_96080 ) ( not ( = ?auto_96075 ?auto_96080 ) ) ( not ( = ?auto_96076 ?auto_96080 ) ) ( not ( = ?auto_96077 ?auto_96080 ) ) ( not ( = ?auto_96078 ?auto_96080 ) ) ( not ( = ?auto_96079 ?auto_96080 ) ) ( ON ?auto_96078 ?auto_96079 ) ( CLEAR ?auto_96078 ) ( ON-TABLE ?auto_96082 ) ( ON ?auto_96081 ?auto_96082 ) ( ON ?auto_96080 ?auto_96081 ) ( not ( = ?auto_96082 ?auto_96081 ) ) ( not ( = ?auto_96082 ?auto_96080 ) ) ( not ( = ?auto_96082 ?auto_96079 ) ) ( not ( = ?auto_96082 ?auto_96078 ) ) ( not ( = ?auto_96081 ?auto_96080 ) ) ( not ( = ?auto_96081 ?auto_96079 ) ) ( not ( = ?auto_96081 ?auto_96078 ) ) ( not ( = ?auto_96075 ?auto_96082 ) ) ( not ( = ?auto_96075 ?auto_96081 ) ) ( not ( = ?auto_96076 ?auto_96082 ) ) ( not ( = ?auto_96076 ?auto_96081 ) ) ( not ( = ?auto_96077 ?auto_96082 ) ) ( not ( = ?auto_96077 ?auto_96081 ) ) ( HOLDING ?auto_96077 ) ( CLEAR ?auto_96076 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96075 ?auto_96076 ?auto_96077 )
      ( MAKE-5PILE ?auto_96075 ?auto_96076 ?auto_96077 ?auto_96078 ?auto_96079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96083 - BLOCK
      ?auto_96084 - BLOCK
      ?auto_96085 - BLOCK
      ?auto_96086 - BLOCK
      ?auto_96087 - BLOCK
    )
    :vars
    (
      ?auto_96090 - BLOCK
      ?auto_96088 - BLOCK
      ?auto_96089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96083 ) ( ON ?auto_96084 ?auto_96083 ) ( not ( = ?auto_96083 ?auto_96084 ) ) ( not ( = ?auto_96083 ?auto_96085 ) ) ( not ( = ?auto_96083 ?auto_96086 ) ) ( not ( = ?auto_96083 ?auto_96087 ) ) ( not ( = ?auto_96084 ?auto_96085 ) ) ( not ( = ?auto_96084 ?auto_96086 ) ) ( not ( = ?auto_96084 ?auto_96087 ) ) ( not ( = ?auto_96085 ?auto_96086 ) ) ( not ( = ?auto_96085 ?auto_96087 ) ) ( not ( = ?auto_96086 ?auto_96087 ) ) ( ON ?auto_96087 ?auto_96090 ) ( not ( = ?auto_96083 ?auto_96090 ) ) ( not ( = ?auto_96084 ?auto_96090 ) ) ( not ( = ?auto_96085 ?auto_96090 ) ) ( not ( = ?auto_96086 ?auto_96090 ) ) ( not ( = ?auto_96087 ?auto_96090 ) ) ( ON ?auto_96086 ?auto_96087 ) ( ON-TABLE ?auto_96088 ) ( ON ?auto_96089 ?auto_96088 ) ( ON ?auto_96090 ?auto_96089 ) ( not ( = ?auto_96088 ?auto_96089 ) ) ( not ( = ?auto_96088 ?auto_96090 ) ) ( not ( = ?auto_96088 ?auto_96087 ) ) ( not ( = ?auto_96088 ?auto_96086 ) ) ( not ( = ?auto_96089 ?auto_96090 ) ) ( not ( = ?auto_96089 ?auto_96087 ) ) ( not ( = ?auto_96089 ?auto_96086 ) ) ( not ( = ?auto_96083 ?auto_96088 ) ) ( not ( = ?auto_96083 ?auto_96089 ) ) ( not ( = ?auto_96084 ?auto_96088 ) ) ( not ( = ?auto_96084 ?auto_96089 ) ) ( not ( = ?auto_96085 ?auto_96088 ) ) ( not ( = ?auto_96085 ?auto_96089 ) ) ( CLEAR ?auto_96084 ) ( ON ?auto_96085 ?auto_96086 ) ( CLEAR ?auto_96085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96088 ?auto_96089 ?auto_96090 ?auto_96087 ?auto_96086 )
      ( MAKE-5PILE ?auto_96083 ?auto_96084 ?auto_96085 ?auto_96086 ?auto_96087 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96091 - BLOCK
      ?auto_96092 - BLOCK
      ?auto_96093 - BLOCK
      ?auto_96094 - BLOCK
      ?auto_96095 - BLOCK
    )
    :vars
    (
      ?auto_96097 - BLOCK
      ?auto_96098 - BLOCK
      ?auto_96096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96091 ) ( not ( = ?auto_96091 ?auto_96092 ) ) ( not ( = ?auto_96091 ?auto_96093 ) ) ( not ( = ?auto_96091 ?auto_96094 ) ) ( not ( = ?auto_96091 ?auto_96095 ) ) ( not ( = ?auto_96092 ?auto_96093 ) ) ( not ( = ?auto_96092 ?auto_96094 ) ) ( not ( = ?auto_96092 ?auto_96095 ) ) ( not ( = ?auto_96093 ?auto_96094 ) ) ( not ( = ?auto_96093 ?auto_96095 ) ) ( not ( = ?auto_96094 ?auto_96095 ) ) ( ON ?auto_96095 ?auto_96097 ) ( not ( = ?auto_96091 ?auto_96097 ) ) ( not ( = ?auto_96092 ?auto_96097 ) ) ( not ( = ?auto_96093 ?auto_96097 ) ) ( not ( = ?auto_96094 ?auto_96097 ) ) ( not ( = ?auto_96095 ?auto_96097 ) ) ( ON ?auto_96094 ?auto_96095 ) ( ON-TABLE ?auto_96098 ) ( ON ?auto_96096 ?auto_96098 ) ( ON ?auto_96097 ?auto_96096 ) ( not ( = ?auto_96098 ?auto_96096 ) ) ( not ( = ?auto_96098 ?auto_96097 ) ) ( not ( = ?auto_96098 ?auto_96095 ) ) ( not ( = ?auto_96098 ?auto_96094 ) ) ( not ( = ?auto_96096 ?auto_96097 ) ) ( not ( = ?auto_96096 ?auto_96095 ) ) ( not ( = ?auto_96096 ?auto_96094 ) ) ( not ( = ?auto_96091 ?auto_96098 ) ) ( not ( = ?auto_96091 ?auto_96096 ) ) ( not ( = ?auto_96092 ?auto_96098 ) ) ( not ( = ?auto_96092 ?auto_96096 ) ) ( not ( = ?auto_96093 ?auto_96098 ) ) ( not ( = ?auto_96093 ?auto_96096 ) ) ( ON ?auto_96093 ?auto_96094 ) ( CLEAR ?auto_96093 ) ( HOLDING ?auto_96092 ) ( CLEAR ?auto_96091 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96091 ?auto_96092 )
      ( MAKE-5PILE ?auto_96091 ?auto_96092 ?auto_96093 ?auto_96094 ?auto_96095 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96099 - BLOCK
      ?auto_96100 - BLOCK
      ?auto_96101 - BLOCK
      ?auto_96102 - BLOCK
      ?auto_96103 - BLOCK
    )
    :vars
    (
      ?auto_96104 - BLOCK
      ?auto_96105 - BLOCK
      ?auto_96106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96099 ) ( not ( = ?auto_96099 ?auto_96100 ) ) ( not ( = ?auto_96099 ?auto_96101 ) ) ( not ( = ?auto_96099 ?auto_96102 ) ) ( not ( = ?auto_96099 ?auto_96103 ) ) ( not ( = ?auto_96100 ?auto_96101 ) ) ( not ( = ?auto_96100 ?auto_96102 ) ) ( not ( = ?auto_96100 ?auto_96103 ) ) ( not ( = ?auto_96101 ?auto_96102 ) ) ( not ( = ?auto_96101 ?auto_96103 ) ) ( not ( = ?auto_96102 ?auto_96103 ) ) ( ON ?auto_96103 ?auto_96104 ) ( not ( = ?auto_96099 ?auto_96104 ) ) ( not ( = ?auto_96100 ?auto_96104 ) ) ( not ( = ?auto_96101 ?auto_96104 ) ) ( not ( = ?auto_96102 ?auto_96104 ) ) ( not ( = ?auto_96103 ?auto_96104 ) ) ( ON ?auto_96102 ?auto_96103 ) ( ON-TABLE ?auto_96105 ) ( ON ?auto_96106 ?auto_96105 ) ( ON ?auto_96104 ?auto_96106 ) ( not ( = ?auto_96105 ?auto_96106 ) ) ( not ( = ?auto_96105 ?auto_96104 ) ) ( not ( = ?auto_96105 ?auto_96103 ) ) ( not ( = ?auto_96105 ?auto_96102 ) ) ( not ( = ?auto_96106 ?auto_96104 ) ) ( not ( = ?auto_96106 ?auto_96103 ) ) ( not ( = ?auto_96106 ?auto_96102 ) ) ( not ( = ?auto_96099 ?auto_96105 ) ) ( not ( = ?auto_96099 ?auto_96106 ) ) ( not ( = ?auto_96100 ?auto_96105 ) ) ( not ( = ?auto_96100 ?auto_96106 ) ) ( not ( = ?auto_96101 ?auto_96105 ) ) ( not ( = ?auto_96101 ?auto_96106 ) ) ( ON ?auto_96101 ?auto_96102 ) ( CLEAR ?auto_96099 ) ( ON ?auto_96100 ?auto_96101 ) ( CLEAR ?auto_96100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96105 ?auto_96106 ?auto_96104 ?auto_96103 ?auto_96102 ?auto_96101 )
      ( MAKE-5PILE ?auto_96099 ?auto_96100 ?auto_96101 ?auto_96102 ?auto_96103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96107 - BLOCK
      ?auto_96108 - BLOCK
      ?auto_96109 - BLOCK
      ?auto_96110 - BLOCK
      ?auto_96111 - BLOCK
    )
    :vars
    (
      ?auto_96112 - BLOCK
      ?auto_96114 - BLOCK
      ?auto_96113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96107 ?auto_96108 ) ) ( not ( = ?auto_96107 ?auto_96109 ) ) ( not ( = ?auto_96107 ?auto_96110 ) ) ( not ( = ?auto_96107 ?auto_96111 ) ) ( not ( = ?auto_96108 ?auto_96109 ) ) ( not ( = ?auto_96108 ?auto_96110 ) ) ( not ( = ?auto_96108 ?auto_96111 ) ) ( not ( = ?auto_96109 ?auto_96110 ) ) ( not ( = ?auto_96109 ?auto_96111 ) ) ( not ( = ?auto_96110 ?auto_96111 ) ) ( ON ?auto_96111 ?auto_96112 ) ( not ( = ?auto_96107 ?auto_96112 ) ) ( not ( = ?auto_96108 ?auto_96112 ) ) ( not ( = ?auto_96109 ?auto_96112 ) ) ( not ( = ?auto_96110 ?auto_96112 ) ) ( not ( = ?auto_96111 ?auto_96112 ) ) ( ON ?auto_96110 ?auto_96111 ) ( ON-TABLE ?auto_96114 ) ( ON ?auto_96113 ?auto_96114 ) ( ON ?auto_96112 ?auto_96113 ) ( not ( = ?auto_96114 ?auto_96113 ) ) ( not ( = ?auto_96114 ?auto_96112 ) ) ( not ( = ?auto_96114 ?auto_96111 ) ) ( not ( = ?auto_96114 ?auto_96110 ) ) ( not ( = ?auto_96113 ?auto_96112 ) ) ( not ( = ?auto_96113 ?auto_96111 ) ) ( not ( = ?auto_96113 ?auto_96110 ) ) ( not ( = ?auto_96107 ?auto_96114 ) ) ( not ( = ?auto_96107 ?auto_96113 ) ) ( not ( = ?auto_96108 ?auto_96114 ) ) ( not ( = ?auto_96108 ?auto_96113 ) ) ( not ( = ?auto_96109 ?auto_96114 ) ) ( not ( = ?auto_96109 ?auto_96113 ) ) ( ON ?auto_96109 ?auto_96110 ) ( ON ?auto_96108 ?auto_96109 ) ( CLEAR ?auto_96108 ) ( HOLDING ?auto_96107 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96107 )
      ( MAKE-5PILE ?auto_96107 ?auto_96108 ?auto_96109 ?auto_96110 ?auto_96111 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96115 - BLOCK
      ?auto_96116 - BLOCK
      ?auto_96117 - BLOCK
      ?auto_96118 - BLOCK
      ?auto_96119 - BLOCK
    )
    :vars
    (
      ?auto_96121 - BLOCK
      ?auto_96120 - BLOCK
      ?auto_96122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96115 ?auto_96116 ) ) ( not ( = ?auto_96115 ?auto_96117 ) ) ( not ( = ?auto_96115 ?auto_96118 ) ) ( not ( = ?auto_96115 ?auto_96119 ) ) ( not ( = ?auto_96116 ?auto_96117 ) ) ( not ( = ?auto_96116 ?auto_96118 ) ) ( not ( = ?auto_96116 ?auto_96119 ) ) ( not ( = ?auto_96117 ?auto_96118 ) ) ( not ( = ?auto_96117 ?auto_96119 ) ) ( not ( = ?auto_96118 ?auto_96119 ) ) ( ON ?auto_96119 ?auto_96121 ) ( not ( = ?auto_96115 ?auto_96121 ) ) ( not ( = ?auto_96116 ?auto_96121 ) ) ( not ( = ?auto_96117 ?auto_96121 ) ) ( not ( = ?auto_96118 ?auto_96121 ) ) ( not ( = ?auto_96119 ?auto_96121 ) ) ( ON ?auto_96118 ?auto_96119 ) ( ON-TABLE ?auto_96120 ) ( ON ?auto_96122 ?auto_96120 ) ( ON ?auto_96121 ?auto_96122 ) ( not ( = ?auto_96120 ?auto_96122 ) ) ( not ( = ?auto_96120 ?auto_96121 ) ) ( not ( = ?auto_96120 ?auto_96119 ) ) ( not ( = ?auto_96120 ?auto_96118 ) ) ( not ( = ?auto_96122 ?auto_96121 ) ) ( not ( = ?auto_96122 ?auto_96119 ) ) ( not ( = ?auto_96122 ?auto_96118 ) ) ( not ( = ?auto_96115 ?auto_96120 ) ) ( not ( = ?auto_96115 ?auto_96122 ) ) ( not ( = ?auto_96116 ?auto_96120 ) ) ( not ( = ?auto_96116 ?auto_96122 ) ) ( not ( = ?auto_96117 ?auto_96120 ) ) ( not ( = ?auto_96117 ?auto_96122 ) ) ( ON ?auto_96117 ?auto_96118 ) ( ON ?auto_96116 ?auto_96117 ) ( ON ?auto_96115 ?auto_96116 ) ( CLEAR ?auto_96115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96120 ?auto_96122 ?auto_96121 ?auto_96119 ?auto_96118 ?auto_96117 ?auto_96116 )
      ( MAKE-5PILE ?auto_96115 ?auto_96116 ?auto_96117 ?auto_96118 ?auto_96119 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96125 - BLOCK
      ?auto_96126 - BLOCK
    )
    :vars
    (
      ?auto_96127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96127 ?auto_96126 ) ( CLEAR ?auto_96127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96125 ) ( ON ?auto_96126 ?auto_96125 ) ( not ( = ?auto_96125 ?auto_96126 ) ) ( not ( = ?auto_96125 ?auto_96127 ) ) ( not ( = ?auto_96126 ?auto_96127 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96127 ?auto_96126 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96128 - BLOCK
      ?auto_96129 - BLOCK
    )
    :vars
    (
      ?auto_96130 - BLOCK
      ?auto_96131 - BLOCK
      ?auto_96132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96130 ?auto_96129 ) ( CLEAR ?auto_96130 ) ( ON-TABLE ?auto_96128 ) ( ON ?auto_96129 ?auto_96128 ) ( not ( = ?auto_96128 ?auto_96129 ) ) ( not ( = ?auto_96128 ?auto_96130 ) ) ( not ( = ?auto_96129 ?auto_96130 ) ) ( HOLDING ?auto_96131 ) ( CLEAR ?auto_96132 ) ( not ( = ?auto_96128 ?auto_96131 ) ) ( not ( = ?auto_96128 ?auto_96132 ) ) ( not ( = ?auto_96129 ?auto_96131 ) ) ( not ( = ?auto_96129 ?auto_96132 ) ) ( not ( = ?auto_96130 ?auto_96131 ) ) ( not ( = ?auto_96130 ?auto_96132 ) ) ( not ( = ?auto_96131 ?auto_96132 ) ) )
    :subtasks
    ( ( !STACK ?auto_96131 ?auto_96132 )
      ( MAKE-2PILE ?auto_96128 ?auto_96129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96133 - BLOCK
      ?auto_96134 - BLOCK
    )
    :vars
    (
      ?auto_96136 - BLOCK
      ?auto_96137 - BLOCK
      ?auto_96135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96136 ?auto_96134 ) ( ON-TABLE ?auto_96133 ) ( ON ?auto_96134 ?auto_96133 ) ( not ( = ?auto_96133 ?auto_96134 ) ) ( not ( = ?auto_96133 ?auto_96136 ) ) ( not ( = ?auto_96134 ?auto_96136 ) ) ( CLEAR ?auto_96137 ) ( not ( = ?auto_96133 ?auto_96135 ) ) ( not ( = ?auto_96133 ?auto_96137 ) ) ( not ( = ?auto_96134 ?auto_96135 ) ) ( not ( = ?auto_96134 ?auto_96137 ) ) ( not ( = ?auto_96136 ?auto_96135 ) ) ( not ( = ?auto_96136 ?auto_96137 ) ) ( not ( = ?auto_96135 ?auto_96137 ) ) ( ON ?auto_96135 ?auto_96136 ) ( CLEAR ?auto_96135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96133 ?auto_96134 ?auto_96136 )
      ( MAKE-2PILE ?auto_96133 ?auto_96134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96138 - BLOCK
      ?auto_96139 - BLOCK
    )
    :vars
    (
      ?auto_96141 - BLOCK
      ?auto_96140 - BLOCK
      ?auto_96142 - BLOCK
      ?auto_96145 - BLOCK
      ?auto_96143 - BLOCK
      ?auto_96144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96141 ?auto_96139 ) ( ON-TABLE ?auto_96138 ) ( ON ?auto_96139 ?auto_96138 ) ( not ( = ?auto_96138 ?auto_96139 ) ) ( not ( = ?auto_96138 ?auto_96141 ) ) ( not ( = ?auto_96139 ?auto_96141 ) ) ( not ( = ?auto_96138 ?auto_96140 ) ) ( not ( = ?auto_96138 ?auto_96142 ) ) ( not ( = ?auto_96139 ?auto_96140 ) ) ( not ( = ?auto_96139 ?auto_96142 ) ) ( not ( = ?auto_96141 ?auto_96140 ) ) ( not ( = ?auto_96141 ?auto_96142 ) ) ( not ( = ?auto_96140 ?auto_96142 ) ) ( ON ?auto_96140 ?auto_96141 ) ( CLEAR ?auto_96140 ) ( HOLDING ?auto_96142 ) ( CLEAR ?auto_96145 ) ( ON-TABLE ?auto_96143 ) ( ON ?auto_96144 ?auto_96143 ) ( ON ?auto_96145 ?auto_96144 ) ( not ( = ?auto_96143 ?auto_96144 ) ) ( not ( = ?auto_96143 ?auto_96145 ) ) ( not ( = ?auto_96143 ?auto_96142 ) ) ( not ( = ?auto_96144 ?auto_96145 ) ) ( not ( = ?auto_96144 ?auto_96142 ) ) ( not ( = ?auto_96145 ?auto_96142 ) ) ( not ( = ?auto_96138 ?auto_96145 ) ) ( not ( = ?auto_96138 ?auto_96143 ) ) ( not ( = ?auto_96138 ?auto_96144 ) ) ( not ( = ?auto_96139 ?auto_96145 ) ) ( not ( = ?auto_96139 ?auto_96143 ) ) ( not ( = ?auto_96139 ?auto_96144 ) ) ( not ( = ?auto_96141 ?auto_96145 ) ) ( not ( = ?auto_96141 ?auto_96143 ) ) ( not ( = ?auto_96141 ?auto_96144 ) ) ( not ( = ?auto_96140 ?auto_96145 ) ) ( not ( = ?auto_96140 ?auto_96143 ) ) ( not ( = ?auto_96140 ?auto_96144 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96143 ?auto_96144 ?auto_96145 ?auto_96142 )
      ( MAKE-2PILE ?auto_96138 ?auto_96139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96146 - BLOCK
      ?auto_96147 - BLOCK
    )
    :vars
    (
      ?auto_96149 - BLOCK
      ?auto_96153 - BLOCK
      ?auto_96150 - BLOCK
      ?auto_96148 - BLOCK
      ?auto_96152 - BLOCK
      ?auto_96151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96149 ?auto_96147 ) ( ON-TABLE ?auto_96146 ) ( ON ?auto_96147 ?auto_96146 ) ( not ( = ?auto_96146 ?auto_96147 ) ) ( not ( = ?auto_96146 ?auto_96149 ) ) ( not ( = ?auto_96147 ?auto_96149 ) ) ( not ( = ?auto_96146 ?auto_96153 ) ) ( not ( = ?auto_96146 ?auto_96150 ) ) ( not ( = ?auto_96147 ?auto_96153 ) ) ( not ( = ?auto_96147 ?auto_96150 ) ) ( not ( = ?auto_96149 ?auto_96153 ) ) ( not ( = ?auto_96149 ?auto_96150 ) ) ( not ( = ?auto_96153 ?auto_96150 ) ) ( ON ?auto_96153 ?auto_96149 ) ( CLEAR ?auto_96148 ) ( ON-TABLE ?auto_96152 ) ( ON ?auto_96151 ?auto_96152 ) ( ON ?auto_96148 ?auto_96151 ) ( not ( = ?auto_96152 ?auto_96151 ) ) ( not ( = ?auto_96152 ?auto_96148 ) ) ( not ( = ?auto_96152 ?auto_96150 ) ) ( not ( = ?auto_96151 ?auto_96148 ) ) ( not ( = ?auto_96151 ?auto_96150 ) ) ( not ( = ?auto_96148 ?auto_96150 ) ) ( not ( = ?auto_96146 ?auto_96148 ) ) ( not ( = ?auto_96146 ?auto_96152 ) ) ( not ( = ?auto_96146 ?auto_96151 ) ) ( not ( = ?auto_96147 ?auto_96148 ) ) ( not ( = ?auto_96147 ?auto_96152 ) ) ( not ( = ?auto_96147 ?auto_96151 ) ) ( not ( = ?auto_96149 ?auto_96148 ) ) ( not ( = ?auto_96149 ?auto_96152 ) ) ( not ( = ?auto_96149 ?auto_96151 ) ) ( not ( = ?auto_96153 ?auto_96148 ) ) ( not ( = ?auto_96153 ?auto_96152 ) ) ( not ( = ?auto_96153 ?auto_96151 ) ) ( ON ?auto_96150 ?auto_96153 ) ( CLEAR ?auto_96150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96146 ?auto_96147 ?auto_96149 ?auto_96153 )
      ( MAKE-2PILE ?auto_96146 ?auto_96147 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96154 - BLOCK
      ?auto_96155 - BLOCK
    )
    :vars
    (
      ?auto_96159 - BLOCK
      ?auto_96161 - BLOCK
      ?auto_96156 - BLOCK
      ?auto_96158 - BLOCK
      ?auto_96157 - BLOCK
      ?auto_96160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96159 ?auto_96155 ) ( ON-TABLE ?auto_96154 ) ( ON ?auto_96155 ?auto_96154 ) ( not ( = ?auto_96154 ?auto_96155 ) ) ( not ( = ?auto_96154 ?auto_96159 ) ) ( not ( = ?auto_96155 ?auto_96159 ) ) ( not ( = ?auto_96154 ?auto_96161 ) ) ( not ( = ?auto_96154 ?auto_96156 ) ) ( not ( = ?auto_96155 ?auto_96161 ) ) ( not ( = ?auto_96155 ?auto_96156 ) ) ( not ( = ?auto_96159 ?auto_96161 ) ) ( not ( = ?auto_96159 ?auto_96156 ) ) ( not ( = ?auto_96161 ?auto_96156 ) ) ( ON ?auto_96161 ?auto_96159 ) ( ON-TABLE ?auto_96158 ) ( ON ?auto_96157 ?auto_96158 ) ( not ( = ?auto_96158 ?auto_96157 ) ) ( not ( = ?auto_96158 ?auto_96160 ) ) ( not ( = ?auto_96158 ?auto_96156 ) ) ( not ( = ?auto_96157 ?auto_96160 ) ) ( not ( = ?auto_96157 ?auto_96156 ) ) ( not ( = ?auto_96160 ?auto_96156 ) ) ( not ( = ?auto_96154 ?auto_96160 ) ) ( not ( = ?auto_96154 ?auto_96158 ) ) ( not ( = ?auto_96154 ?auto_96157 ) ) ( not ( = ?auto_96155 ?auto_96160 ) ) ( not ( = ?auto_96155 ?auto_96158 ) ) ( not ( = ?auto_96155 ?auto_96157 ) ) ( not ( = ?auto_96159 ?auto_96160 ) ) ( not ( = ?auto_96159 ?auto_96158 ) ) ( not ( = ?auto_96159 ?auto_96157 ) ) ( not ( = ?auto_96161 ?auto_96160 ) ) ( not ( = ?auto_96161 ?auto_96158 ) ) ( not ( = ?auto_96161 ?auto_96157 ) ) ( ON ?auto_96156 ?auto_96161 ) ( CLEAR ?auto_96156 ) ( HOLDING ?auto_96160 ) ( CLEAR ?auto_96157 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96158 ?auto_96157 ?auto_96160 )
      ( MAKE-2PILE ?auto_96154 ?auto_96155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96162 - BLOCK
      ?auto_96163 - BLOCK
    )
    :vars
    (
      ?auto_96165 - BLOCK
      ?auto_96168 - BLOCK
      ?auto_96167 - BLOCK
      ?auto_96164 - BLOCK
      ?auto_96166 - BLOCK
      ?auto_96169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96165 ?auto_96163 ) ( ON-TABLE ?auto_96162 ) ( ON ?auto_96163 ?auto_96162 ) ( not ( = ?auto_96162 ?auto_96163 ) ) ( not ( = ?auto_96162 ?auto_96165 ) ) ( not ( = ?auto_96163 ?auto_96165 ) ) ( not ( = ?auto_96162 ?auto_96168 ) ) ( not ( = ?auto_96162 ?auto_96167 ) ) ( not ( = ?auto_96163 ?auto_96168 ) ) ( not ( = ?auto_96163 ?auto_96167 ) ) ( not ( = ?auto_96165 ?auto_96168 ) ) ( not ( = ?auto_96165 ?auto_96167 ) ) ( not ( = ?auto_96168 ?auto_96167 ) ) ( ON ?auto_96168 ?auto_96165 ) ( ON-TABLE ?auto_96164 ) ( ON ?auto_96166 ?auto_96164 ) ( not ( = ?auto_96164 ?auto_96166 ) ) ( not ( = ?auto_96164 ?auto_96169 ) ) ( not ( = ?auto_96164 ?auto_96167 ) ) ( not ( = ?auto_96166 ?auto_96169 ) ) ( not ( = ?auto_96166 ?auto_96167 ) ) ( not ( = ?auto_96169 ?auto_96167 ) ) ( not ( = ?auto_96162 ?auto_96169 ) ) ( not ( = ?auto_96162 ?auto_96164 ) ) ( not ( = ?auto_96162 ?auto_96166 ) ) ( not ( = ?auto_96163 ?auto_96169 ) ) ( not ( = ?auto_96163 ?auto_96164 ) ) ( not ( = ?auto_96163 ?auto_96166 ) ) ( not ( = ?auto_96165 ?auto_96169 ) ) ( not ( = ?auto_96165 ?auto_96164 ) ) ( not ( = ?auto_96165 ?auto_96166 ) ) ( not ( = ?auto_96168 ?auto_96169 ) ) ( not ( = ?auto_96168 ?auto_96164 ) ) ( not ( = ?auto_96168 ?auto_96166 ) ) ( ON ?auto_96167 ?auto_96168 ) ( CLEAR ?auto_96166 ) ( ON ?auto_96169 ?auto_96167 ) ( CLEAR ?auto_96169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96162 ?auto_96163 ?auto_96165 ?auto_96168 ?auto_96167 )
      ( MAKE-2PILE ?auto_96162 ?auto_96163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96170 - BLOCK
      ?auto_96171 - BLOCK
    )
    :vars
    (
      ?auto_96172 - BLOCK
      ?auto_96177 - BLOCK
      ?auto_96174 - BLOCK
      ?auto_96175 - BLOCK
      ?auto_96176 - BLOCK
      ?auto_96173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96172 ?auto_96171 ) ( ON-TABLE ?auto_96170 ) ( ON ?auto_96171 ?auto_96170 ) ( not ( = ?auto_96170 ?auto_96171 ) ) ( not ( = ?auto_96170 ?auto_96172 ) ) ( not ( = ?auto_96171 ?auto_96172 ) ) ( not ( = ?auto_96170 ?auto_96177 ) ) ( not ( = ?auto_96170 ?auto_96174 ) ) ( not ( = ?auto_96171 ?auto_96177 ) ) ( not ( = ?auto_96171 ?auto_96174 ) ) ( not ( = ?auto_96172 ?auto_96177 ) ) ( not ( = ?auto_96172 ?auto_96174 ) ) ( not ( = ?auto_96177 ?auto_96174 ) ) ( ON ?auto_96177 ?auto_96172 ) ( ON-TABLE ?auto_96175 ) ( not ( = ?auto_96175 ?auto_96176 ) ) ( not ( = ?auto_96175 ?auto_96173 ) ) ( not ( = ?auto_96175 ?auto_96174 ) ) ( not ( = ?auto_96176 ?auto_96173 ) ) ( not ( = ?auto_96176 ?auto_96174 ) ) ( not ( = ?auto_96173 ?auto_96174 ) ) ( not ( = ?auto_96170 ?auto_96173 ) ) ( not ( = ?auto_96170 ?auto_96175 ) ) ( not ( = ?auto_96170 ?auto_96176 ) ) ( not ( = ?auto_96171 ?auto_96173 ) ) ( not ( = ?auto_96171 ?auto_96175 ) ) ( not ( = ?auto_96171 ?auto_96176 ) ) ( not ( = ?auto_96172 ?auto_96173 ) ) ( not ( = ?auto_96172 ?auto_96175 ) ) ( not ( = ?auto_96172 ?auto_96176 ) ) ( not ( = ?auto_96177 ?auto_96173 ) ) ( not ( = ?auto_96177 ?auto_96175 ) ) ( not ( = ?auto_96177 ?auto_96176 ) ) ( ON ?auto_96174 ?auto_96177 ) ( ON ?auto_96173 ?auto_96174 ) ( CLEAR ?auto_96173 ) ( HOLDING ?auto_96176 ) ( CLEAR ?auto_96175 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96175 ?auto_96176 )
      ( MAKE-2PILE ?auto_96170 ?auto_96171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96178 - BLOCK
      ?auto_96179 - BLOCK
    )
    :vars
    (
      ?auto_96180 - BLOCK
      ?auto_96182 - BLOCK
      ?auto_96183 - BLOCK
      ?auto_96184 - BLOCK
      ?auto_96185 - BLOCK
      ?auto_96181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96180 ?auto_96179 ) ( ON-TABLE ?auto_96178 ) ( ON ?auto_96179 ?auto_96178 ) ( not ( = ?auto_96178 ?auto_96179 ) ) ( not ( = ?auto_96178 ?auto_96180 ) ) ( not ( = ?auto_96179 ?auto_96180 ) ) ( not ( = ?auto_96178 ?auto_96182 ) ) ( not ( = ?auto_96178 ?auto_96183 ) ) ( not ( = ?auto_96179 ?auto_96182 ) ) ( not ( = ?auto_96179 ?auto_96183 ) ) ( not ( = ?auto_96180 ?auto_96182 ) ) ( not ( = ?auto_96180 ?auto_96183 ) ) ( not ( = ?auto_96182 ?auto_96183 ) ) ( ON ?auto_96182 ?auto_96180 ) ( ON-TABLE ?auto_96184 ) ( not ( = ?auto_96184 ?auto_96185 ) ) ( not ( = ?auto_96184 ?auto_96181 ) ) ( not ( = ?auto_96184 ?auto_96183 ) ) ( not ( = ?auto_96185 ?auto_96181 ) ) ( not ( = ?auto_96185 ?auto_96183 ) ) ( not ( = ?auto_96181 ?auto_96183 ) ) ( not ( = ?auto_96178 ?auto_96181 ) ) ( not ( = ?auto_96178 ?auto_96184 ) ) ( not ( = ?auto_96178 ?auto_96185 ) ) ( not ( = ?auto_96179 ?auto_96181 ) ) ( not ( = ?auto_96179 ?auto_96184 ) ) ( not ( = ?auto_96179 ?auto_96185 ) ) ( not ( = ?auto_96180 ?auto_96181 ) ) ( not ( = ?auto_96180 ?auto_96184 ) ) ( not ( = ?auto_96180 ?auto_96185 ) ) ( not ( = ?auto_96182 ?auto_96181 ) ) ( not ( = ?auto_96182 ?auto_96184 ) ) ( not ( = ?auto_96182 ?auto_96185 ) ) ( ON ?auto_96183 ?auto_96182 ) ( ON ?auto_96181 ?auto_96183 ) ( CLEAR ?auto_96184 ) ( ON ?auto_96185 ?auto_96181 ) ( CLEAR ?auto_96185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96178 ?auto_96179 ?auto_96180 ?auto_96182 ?auto_96183 ?auto_96181 )
      ( MAKE-2PILE ?auto_96178 ?auto_96179 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96186 - BLOCK
      ?auto_96187 - BLOCK
    )
    :vars
    (
      ?auto_96192 - BLOCK
      ?auto_96190 - BLOCK
      ?auto_96188 - BLOCK
      ?auto_96193 - BLOCK
      ?auto_96189 - BLOCK
      ?auto_96191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96192 ?auto_96187 ) ( ON-TABLE ?auto_96186 ) ( ON ?auto_96187 ?auto_96186 ) ( not ( = ?auto_96186 ?auto_96187 ) ) ( not ( = ?auto_96186 ?auto_96192 ) ) ( not ( = ?auto_96187 ?auto_96192 ) ) ( not ( = ?auto_96186 ?auto_96190 ) ) ( not ( = ?auto_96186 ?auto_96188 ) ) ( not ( = ?auto_96187 ?auto_96190 ) ) ( not ( = ?auto_96187 ?auto_96188 ) ) ( not ( = ?auto_96192 ?auto_96190 ) ) ( not ( = ?auto_96192 ?auto_96188 ) ) ( not ( = ?auto_96190 ?auto_96188 ) ) ( ON ?auto_96190 ?auto_96192 ) ( not ( = ?auto_96193 ?auto_96189 ) ) ( not ( = ?auto_96193 ?auto_96191 ) ) ( not ( = ?auto_96193 ?auto_96188 ) ) ( not ( = ?auto_96189 ?auto_96191 ) ) ( not ( = ?auto_96189 ?auto_96188 ) ) ( not ( = ?auto_96191 ?auto_96188 ) ) ( not ( = ?auto_96186 ?auto_96191 ) ) ( not ( = ?auto_96186 ?auto_96193 ) ) ( not ( = ?auto_96186 ?auto_96189 ) ) ( not ( = ?auto_96187 ?auto_96191 ) ) ( not ( = ?auto_96187 ?auto_96193 ) ) ( not ( = ?auto_96187 ?auto_96189 ) ) ( not ( = ?auto_96192 ?auto_96191 ) ) ( not ( = ?auto_96192 ?auto_96193 ) ) ( not ( = ?auto_96192 ?auto_96189 ) ) ( not ( = ?auto_96190 ?auto_96191 ) ) ( not ( = ?auto_96190 ?auto_96193 ) ) ( not ( = ?auto_96190 ?auto_96189 ) ) ( ON ?auto_96188 ?auto_96190 ) ( ON ?auto_96191 ?auto_96188 ) ( ON ?auto_96189 ?auto_96191 ) ( CLEAR ?auto_96189 ) ( HOLDING ?auto_96193 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96193 )
      ( MAKE-2PILE ?auto_96186 ?auto_96187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96194 - BLOCK
      ?auto_96195 - BLOCK
    )
    :vars
    (
      ?auto_96200 - BLOCK
      ?auto_96201 - BLOCK
      ?auto_96198 - BLOCK
      ?auto_96197 - BLOCK
      ?auto_96199 - BLOCK
      ?auto_96196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96200 ?auto_96195 ) ( ON-TABLE ?auto_96194 ) ( ON ?auto_96195 ?auto_96194 ) ( not ( = ?auto_96194 ?auto_96195 ) ) ( not ( = ?auto_96194 ?auto_96200 ) ) ( not ( = ?auto_96195 ?auto_96200 ) ) ( not ( = ?auto_96194 ?auto_96201 ) ) ( not ( = ?auto_96194 ?auto_96198 ) ) ( not ( = ?auto_96195 ?auto_96201 ) ) ( not ( = ?auto_96195 ?auto_96198 ) ) ( not ( = ?auto_96200 ?auto_96201 ) ) ( not ( = ?auto_96200 ?auto_96198 ) ) ( not ( = ?auto_96201 ?auto_96198 ) ) ( ON ?auto_96201 ?auto_96200 ) ( not ( = ?auto_96197 ?auto_96199 ) ) ( not ( = ?auto_96197 ?auto_96196 ) ) ( not ( = ?auto_96197 ?auto_96198 ) ) ( not ( = ?auto_96199 ?auto_96196 ) ) ( not ( = ?auto_96199 ?auto_96198 ) ) ( not ( = ?auto_96196 ?auto_96198 ) ) ( not ( = ?auto_96194 ?auto_96196 ) ) ( not ( = ?auto_96194 ?auto_96197 ) ) ( not ( = ?auto_96194 ?auto_96199 ) ) ( not ( = ?auto_96195 ?auto_96196 ) ) ( not ( = ?auto_96195 ?auto_96197 ) ) ( not ( = ?auto_96195 ?auto_96199 ) ) ( not ( = ?auto_96200 ?auto_96196 ) ) ( not ( = ?auto_96200 ?auto_96197 ) ) ( not ( = ?auto_96200 ?auto_96199 ) ) ( not ( = ?auto_96201 ?auto_96196 ) ) ( not ( = ?auto_96201 ?auto_96197 ) ) ( not ( = ?auto_96201 ?auto_96199 ) ) ( ON ?auto_96198 ?auto_96201 ) ( ON ?auto_96196 ?auto_96198 ) ( ON ?auto_96199 ?auto_96196 ) ( ON ?auto_96197 ?auto_96199 ) ( CLEAR ?auto_96197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96194 ?auto_96195 ?auto_96200 ?auto_96201 ?auto_96198 ?auto_96196 ?auto_96199 )
      ( MAKE-2PILE ?auto_96194 ?auto_96195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96208 - BLOCK
      ?auto_96209 - BLOCK
      ?auto_96210 - BLOCK
      ?auto_96211 - BLOCK
      ?auto_96212 - BLOCK
      ?auto_96213 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_96213 ) ( CLEAR ?auto_96212 ) ( ON-TABLE ?auto_96208 ) ( ON ?auto_96209 ?auto_96208 ) ( ON ?auto_96210 ?auto_96209 ) ( ON ?auto_96211 ?auto_96210 ) ( ON ?auto_96212 ?auto_96211 ) ( not ( = ?auto_96208 ?auto_96209 ) ) ( not ( = ?auto_96208 ?auto_96210 ) ) ( not ( = ?auto_96208 ?auto_96211 ) ) ( not ( = ?auto_96208 ?auto_96212 ) ) ( not ( = ?auto_96208 ?auto_96213 ) ) ( not ( = ?auto_96209 ?auto_96210 ) ) ( not ( = ?auto_96209 ?auto_96211 ) ) ( not ( = ?auto_96209 ?auto_96212 ) ) ( not ( = ?auto_96209 ?auto_96213 ) ) ( not ( = ?auto_96210 ?auto_96211 ) ) ( not ( = ?auto_96210 ?auto_96212 ) ) ( not ( = ?auto_96210 ?auto_96213 ) ) ( not ( = ?auto_96211 ?auto_96212 ) ) ( not ( = ?auto_96211 ?auto_96213 ) ) ( not ( = ?auto_96212 ?auto_96213 ) ) )
    :subtasks
    ( ( !STACK ?auto_96213 ?auto_96212 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96214 - BLOCK
      ?auto_96215 - BLOCK
      ?auto_96216 - BLOCK
      ?auto_96217 - BLOCK
      ?auto_96218 - BLOCK
      ?auto_96219 - BLOCK
    )
    :vars
    (
      ?auto_96220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96218 ) ( ON-TABLE ?auto_96214 ) ( ON ?auto_96215 ?auto_96214 ) ( ON ?auto_96216 ?auto_96215 ) ( ON ?auto_96217 ?auto_96216 ) ( ON ?auto_96218 ?auto_96217 ) ( not ( = ?auto_96214 ?auto_96215 ) ) ( not ( = ?auto_96214 ?auto_96216 ) ) ( not ( = ?auto_96214 ?auto_96217 ) ) ( not ( = ?auto_96214 ?auto_96218 ) ) ( not ( = ?auto_96214 ?auto_96219 ) ) ( not ( = ?auto_96215 ?auto_96216 ) ) ( not ( = ?auto_96215 ?auto_96217 ) ) ( not ( = ?auto_96215 ?auto_96218 ) ) ( not ( = ?auto_96215 ?auto_96219 ) ) ( not ( = ?auto_96216 ?auto_96217 ) ) ( not ( = ?auto_96216 ?auto_96218 ) ) ( not ( = ?auto_96216 ?auto_96219 ) ) ( not ( = ?auto_96217 ?auto_96218 ) ) ( not ( = ?auto_96217 ?auto_96219 ) ) ( not ( = ?auto_96218 ?auto_96219 ) ) ( ON ?auto_96219 ?auto_96220 ) ( CLEAR ?auto_96219 ) ( HAND-EMPTY ) ( not ( = ?auto_96214 ?auto_96220 ) ) ( not ( = ?auto_96215 ?auto_96220 ) ) ( not ( = ?auto_96216 ?auto_96220 ) ) ( not ( = ?auto_96217 ?auto_96220 ) ) ( not ( = ?auto_96218 ?auto_96220 ) ) ( not ( = ?auto_96219 ?auto_96220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96219 ?auto_96220 )
      ( MAKE-6PILE ?auto_96214 ?auto_96215 ?auto_96216 ?auto_96217 ?auto_96218 ?auto_96219 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96221 - BLOCK
      ?auto_96222 - BLOCK
      ?auto_96223 - BLOCK
      ?auto_96224 - BLOCK
      ?auto_96225 - BLOCK
      ?auto_96226 - BLOCK
    )
    :vars
    (
      ?auto_96227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96221 ) ( ON ?auto_96222 ?auto_96221 ) ( ON ?auto_96223 ?auto_96222 ) ( ON ?auto_96224 ?auto_96223 ) ( not ( = ?auto_96221 ?auto_96222 ) ) ( not ( = ?auto_96221 ?auto_96223 ) ) ( not ( = ?auto_96221 ?auto_96224 ) ) ( not ( = ?auto_96221 ?auto_96225 ) ) ( not ( = ?auto_96221 ?auto_96226 ) ) ( not ( = ?auto_96222 ?auto_96223 ) ) ( not ( = ?auto_96222 ?auto_96224 ) ) ( not ( = ?auto_96222 ?auto_96225 ) ) ( not ( = ?auto_96222 ?auto_96226 ) ) ( not ( = ?auto_96223 ?auto_96224 ) ) ( not ( = ?auto_96223 ?auto_96225 ) ) ( not ( = ?auto_96223 ?auto_96226 ) ) ( not ( = ?auto_96224 ?auto_96225 ) ) ( not ( = ?auto_96224 ?auto_96226 ) ) ( not ( = ?auto_96225 ?auto_96226 ) ) ( ON ?auto_96226 ?auto_96227 ) ( CLEAR ?auto_96226 ) ( not ( = ?auto_96221 ?auto_96227 ) ) ( not ( = ?auto_96222 ?auto_96227 ) ) ( not ( = ?auto_96223 ?auto_96227 ) ) ( not ( = ?auto_96224 ?auto_96227 ) ) ( not ( = ?auto_96225 ?auto_96227 ) ) ( not ( = ?auto_96226 ?auto_96227 ) ) ( HOLDING ?auto_96225 ) ( CLEAR ?auto_96224 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96221 ?auto_96222 ?auto_96223 ?auto_96224 ?auto_96225 )
      ( MAKE-6PILE ?auto_96221 ?auto_96222 ?auto_96223 ?auto_96224 ?auto_96225 ?auto_96226 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96228 - BLOCK
      ?auto_96229 - BLOCK
      ?auto_96230 - BLOCK
      ?auto_96231 - BLOCK
      ?auto_96232 - BLOCK
      ?auto_96233 - BLOCK
    )
    :vars
    (
      ?auto_96234 - BLOCK
      ?auto_96235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96228 ) ( ON ?auto_96229 ?auto_96228 ) ( ON ?auto_96230 ?auto_96229 ) ( ON ?auto_96231 ?auto_96230 ) ( not ( = ?auto_96228 ?auto_96229 ) ) ( not ( = ?auto_96228 ?auto_96230 ) ) ( not ( = ?auto_96228 ?auto_96231 ) ) ( not ( = ?auto_96228 ?auto_96232 ) ) ( not ( = ?auto_96228 ?auto_96233 ) ) ( not ( = ?auto_96229 ?auto_96230 ) ) ( not ( = ?auto_96229 ?auto_96231 ) ) ( not ( = ?auto_96229 ?auto_96232 ) ) ( not ( = ?auto_96229 ?auto_96233 ) ) ( not ( = ?auto_96230 ?auto_96231 ) ) ( not ( = ?auto_96230 ?auto_96232 ) ) ( not ( = ?auto_96230 ?auto_96233 ) ) ( not ( = ?auto_96231 ?auto_96232 ) ) ( not ( = ?auto_96231 ?auto_96233 ) ) ( not ( = ?auto_96232 ?auto_96233 ) ) ( ON ?auto_96233 ?auto_96234 ) ( not ( = ?auto_96228 ?auto_96234 ) ) ( not ( = ?auto_96229 ?auto_96234 ) ) ( not ( = ?auto_96230 ?auto_96234 ) ) ( not ( = ?auto_96231 ?auto_96234 ) ) ( not ( = ?auto_96232 ?auto_96234 ) ) ( not ( = ?auto_96233 ?auto_96234 ) ) ( CLEAR ?auto_96231 ) ( ON ?auto_96232 ?auto_96233 ) ( CLEAR ?auto_96232 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96235 ) ( ON ?auto_96234 ?auto_96235 ) ( not ( = ?auto_96235 ?auto_96234 ) ) ( not ( = ?auto_96235 ?auto_96233 ) ) ( not ( = ?auto_96235 ?auto_96232 ) ) ( not ( = ?auto_96228 ?auto_96235 ) ) ( not ( = ?auto_96229 ?auto_96235 ) ) ( not ( = ?auto_96230 ?auto_96235 ) ) ( not ( = ?auto_96231 ?auto_96235 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96235 ?auto_96234 ?auto_96233 )
      ( MAKE-6PILE ?auto_96228 ?auto_96229 ?auto_96230 ?auto_96231 ?auto_96232 ?auto_96233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96236 - BLOCK
      ?auto_96237 - BLOCK
      ?auto_96238 - BLOCK
      ?auto_96239 - BLOCK
      ?auto_96240 - BLOCK
      ?auto_96241 - BLOCK
    )
    :vars
    (
      ?auto_96242 - BLOCK
      ?auto_96243 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96236 ) ( ON ?auto_96237 ?auto_96236 ) ( ON ?auto_96238 ?auto_96237 ) ( not ( = ?auto_96236 ?auto_96237 ) ) ( not ( = ?auto_96236 ?auto_96238 ) ) ( not ( = ?auto_96236 ?auto_96239 ) ) ( not ( = ?auto_96236 ?auto_96240 ) ) ( not ( = ?auto_96236 ?auto_96241 ) ) ( not ( = ?auto_96237 ?auto_96238 ) ) ( not ( = ?auto_96237 ?auto_96239 ) ) ( not ( = ?auto_96237 ?auto_96240 ) ) ( not ( = ?auto_96237 ?auto_96241 ) ) ( not ( = ?auto_96238 ?auto_96239 ) ) ( not ( = ?auto_96238 ?auto_96240 ) ) ( not ( = ?auto_96238 ?auto_96241 ) ) ( not ( = ?auto_96239 ?auto_96240 ) ) ( not ( = ?auto_96239 ?auto_96241 ) ) ( not ( = ?auto_96240 ?auto_96241 ) ) ( ON ?auto_96241 ?auto_96242 ) ( not ( = ?auto_96236 ?auto_96242 ) ) ( not ( = ?auto_96237 ?auto_96242 ) ) ( not ( = ?auto_96238 ?auto_96242 ) ) ( not ( = ?auto_96239 ?auto_96242 ) ) ( not ( = ?auto_96240 ?auto_96242 ) ) ( not ( = ?auto_96241 ?auto_96242 ) ) ( ON ?auto_96240 ?auto_96241 ) ( CLEAR ?auto_96240 ) ( ON-TABLE ?auto_96243 ) ( ON ?auto_96242 ?auto_96243 ) ( not ( = ?auto_96243 ?auto_96242 ) ) ( not ( = ?auto_96243 ?auto_96241 ) ) ( not ( = ?auto_96243 ?auto_96240 ) ) ( not ( = ?auto_96236 ?auto_96243 ) ) ( not ( = ?auto_96237 ?auto_96243 ) ) ( not ( = ?auto_96238 ?auto_96243 ) ) ( not ( = ?auto_96239 ?auto_96243 ) ) ( HOLDING ?auto_96239 ) ( CLEAR ?auto_96238 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96236 ?auto_96237 ?auto_96238 ?auto_96239 )
      ( MAKE-6PILE ?auto_96236 ?auto_96237 ?auto_96238 ?auto_96239 ?auto_96240 ?auto_96241 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96244 - BLOCK
      ?auto_96245 - BLOCK
      ?auto_96246 - BLOCK
      ?auto_96247 - BLOCK
      ?auto_96248 - BLOCK
      ?auto_96249 - BLOCK
    )
    :vars
    (
      ?auto_96251 - BLOCK
      ?auto_96250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96244 ) ( ON ?auto_96245 ?auto_96244 ) ( ON ?auto_96246 ?auto_96245 ) ( not ( = ?auto_96244 ?auto_96245 ) ) ( not ( = ?auto_96244 ?auto_96246 ) ) ( not ( = ?auto_96244 ?auto_96247 ) ) ( not ( = ?auto_96244 ?auto_96248 ) ) ( not ( = ?auto_96244 ?auto_96249 ) ) ( not ( = ?auto_96245 ?auto_96246 ) ) ( not ( = ?auto_96245 ?auto_96247 ) ) ( not ( = ?auto_96245 ?auto_96248 ) ) ( not ( = ?auto_96245 ?auto_96249 ) ) ( not ( = ?auto_96246 ?auto_96247 ) ) ( not ( = ?auto_96246 ?auto_96248 ) ) ( not ( = ?auto_96246 ?auto_96249 ) ) ( not ( = ?auto_96247 ?auto_96248 ) ) ( not ( = ?auto_96247 ?auto_96249 ) ) ( not ( = ?auto_96248 ?auto_96249 ) ) ( ON ?auto_96249 ?auto_96251 ) ( not ( = ?auto_96244 ?auto_96251 ) ) ( not ( = ?auto_96245 ?auto_96251 ) ) ( not ( = ?auto_96246 ?auto_96251 ) ) ( not ( = ?auto_96247 ?auto_96251 ) ) ( not ( = ?auto_96248 ?auto_96251 ) ) ( not ( = ?auto_96249 ?auto_96251 ) ) ( ON ?auto_96248 ?auto_96249 ) ( ON-TABLE ?auto_96250 ) ( ON ?auto_96251 ?auto_96250 ) ( not ( = ?auto_96250 ?auto_96251 ) ) ( not ( = ?auto_96250 ?auto_96249 ) ) ( not ( = ?auto_96250 ?auto_96248 ) ) ( not ( = ?auto_96244 ?auto_96250 ) ) ( not ( = ?auto_96245 ?auto_96250 ) ) ( not ( = ?auto_96246 ?auto_96250 ) ) ( not ( = ?auto_96247 ?auto_96250 ) ) ( CLEAR ?auto_96246 ) ( ON ?auto_96247 ?auto_96248 ) ( CLEAR ?auto_96247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96250 ?auto_96251 ?auto_96249 ?auto_96248 )
      ( MAKE-6PILE ?auto_96244 ?auto_96245 ?auto_96246 ?auto_96247 ?auto_96248 ?auto_96249 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96252 - BLOCK
      ?auto_96253 - BLOCK
      ?auto_96254 - BLOCK
      ?auto_96255 - BLOCK
      ?auto_96256 - BLOCK
      ?auto_96257 - BLOCK
    )
    :vars
    (
      ?auto_96259 - BLOCK
      ?auto_96258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96252 ) ( ON ?auto_96253 ?auto_96252 ) ( not ( = ?auto_96252 ?auto_96253 ) ) ( not ( = ?auto_96252 ?auto_96254 ) ) ( not ( = ?auto_96252 ?auto_96255 ) ) ( not ( = ?auto_96252 ?auto_96256 ) ) ( not ( = ?auto_96252 ?auto_96257 ) ) ( not ( = ?auto_96253 ?auto_96254 ) ) ( not ( = ?auto_96253 ?auto_96255 ) ) ( not ( = ?auto_96253 ?auto_96256 ) ) ( not ( = ?auto_96253 ?auto_96257 ) ) ( not ( = ?auto_96254 ?auto_96255 ) ) ( not ( = ?auto_96254 ?auto_96256 ) ) ( not ( = ?auto_96254 ?auto_96257 ) ) ( not ( = ?auto_96255 ?auto_96256 ) ) ( not ( = ?auto_96255 ?auto_96257 ) ) ( not ( = ?auto_96256 ?auto_96257 ) ) ( ON ?auto_96257 ?auto_96259 ) ( not ( = ?auto_96252 ?auto_96259 ) ) ( not ( = ?auto_96253 ?auto_96259 ) ) ( not ( = ?auto_96254 ?auto_96259 ) ) ( not ( = ?auto_96255 ?auto_96259 ) ) ( not ( = ?auto_96256 ?auto_96259 ) ) ( not ( = ?auto_96257 ?auto_96259 ) ) ( ON ?auto_96256 ?auto_96257 ) ( ON-TABLE ?auto_96258 ) ( ON ?auto_96259 ?auto_96258 ) ( not ( = ?auto_96258 ?auto_96259 ) ) ( not ( = ?auto_96258 ?auto_96257 ) ) ( not ( = ?auto_96258 ?auto_96256 ) ) ( not ( = ?auto_96252 ?auto_96258 ) ) ( not ( = ?auto_96253 ?auto_96258 ) ) ( not ( = ?auto_96254 ?auto_96258 ) ) ( not ( = ?auto_96255 ?auto_96258 ) ) ( ON ?auto_96255 ?auto_96256 ) ( CLEAR ?auto_96255 ) ( HOLDING ?auto_96254 ) ( CLEAR ?auto_96253 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96252 ?auto_96253 ?auto_96254 )
      ( MAKE-6PILE ?auto_96252 ?auto_96253 ?auto_96254 ?auto_96255 ?auto_96256 ?auto_96257 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96260 - BLOCK
      ?auto_96261 - BLOCK
      ?auto_96262 - BLOCK
      ?auto_96263 - BLOCK
      ?auto_96264 - BLOCK
      ?auto_96265 - BLOCK
    )
    :vars
    (
      ?auto_96267 - BLOCK
      ?auto_96266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96260 ) ( ON ?auto_96261 ?auto_96260 ) ( not ( = ?auto_96260 ?auto_96261 ) ) ( not ( = ?auto_96260 ?auto_96262 ) ) ( not ( = ?auto_96260 ?auto_96263 ) ) ( not ( = ?auto_96260 ?auto_96264 ) ) ( not ( = ?auto_96260 ?auto_96265 ) ) ( not ( = ?auto_96261 ?auto_96262 ) ) ( not ( = ?auto_96261 ?auto_96263 ) ) ( not ( = ?auto_96261 ?auto_96264 ) ) ( not ( = ?auto_96261 ?auto_96265 ) ) ( not ( = ?auto_96262 ?auto_96263 ) ) ( not ( = ?auto_96262 ?auto_96264 ) ) ( not ( = ?auto_96262 ?auto_96265 ) ) ( not ( = ?auto_96263 ?auto_96264 ) ) ( not ( = ?auto_96263 ?auto_96265 ) ) ( not ( = ?auto_96264 ?auto_96265 ) ) ( ON ?auto_96265 ?auto_96267 ) ( not ( = ?auto_96260 ?auto_96267 ) ) ( not ( = ?auto_96261 ?auto_96267 ) ) ( not ( = ?auto_96262 ?auto_96267 ) ) ( not ( = ?auto_96263 ?auto_96267 ) ) ( not ( = ?auto_96264 ?auto_96267 ) ) ( not ( = ?auto_96265 ?auto_96267 ) ) ( ON ?auto_96264 ?auto_96265 ) ( ON-TABLE ?auto_96266 ) ( ON ?auto_96267 ?auto_96266 ) ( not ( = ?auto_96266 ?auto_96267 ) ) ( not ( = ?auto_96266 ?auto_96265 ) ) ( not ( = ?auto_96266 ?auto_96264 ) ) ( not ( = ?auto_96260 ?auto_96266 ) ) ( not ( = ?auto_96261 ?auto_96266 ) ) ( not ( = ?auto_96262 ?auto_96266 ) ) ( not ( = ?auto_96263 ?auto_96266 ) ) ( ON ?auto_96263 ?auto_96264 ) ( CLEAR ?auto_96261 ) ( ON ?auto_96262 ?auto_96263 ) ( CLEAR ?auto_96262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96266 ?auto_96267 ?auto_96265 ?auto_96264 ?auto_96263 )
      ( MAKE-6PILE ?auto_96260 ?auto_96261 ?auto_96262 ?auto_96263 ?auto_96264 ?auto_96265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96268 - BLOCK
      ?auto_96269 - BLOCK
      ?auto_96270 - BLOCK
      ?auto_96271 - BLOCK
      ?auto_96272 - BLOCK
      ?auto_96273 - BLOCK
    )
    :vars
    (
      ?auto_96274 - BLOCK
      ?auto_96275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96268 ) ( not ( = ?auto_96268 ?auto_96269 ) ) ( not ( = ?auto_96268 ?auto_96270 ) ) ( not ( = ?auto_96268 ?auto_96271 ) ) ( not ( = ?auto_96268 ?auto_96272 ) ) ( not ( = ?auto_96268 ?auto_96273 ) ) ( not ( = ?auto_96269 ?auto_96270 ) ) ( not ( = ?auto_96269 ?auto_96271 ) ) ( not ( = ?auto_96269 ?auto_96272 ) ) ( not ( = ?auto_96269 ?auto_96273 ) ) ( not ( = ?auto_96270 ?auto_96271 ) ) ( not ( = ?auto_96270 ?auto_96272 ) ) ( not ( = ?auto_96270 ?auto_96273 ) ) ( not ( = ?auto_96271 ?auto_96272 ) ) ( not ( = ?auto_96271 ?auto_96273 ) ) ( not ( = ?auto_96272 ?auto_96273 ) ) ( ON ?auto_96273 ?auto_96274 ) ( not ( = ?auto_96268 ?auto_96274 ) ) ( not ( = ?auto_96269 ?auto_96274 ) ) ( not ( = ?auto_96270 ?auto_96274 ) ) ( not ( = ?auto_96271 ?auto_96274 ) ) ( not ( = ?auto_96272 ?auto_96274 ) ) ( not ( = ?auto_96273 ?auto_96274 ) ) ( ON ?auto_96272 ?auto_96273 ) ( ON-TABLE ?auto_96275 ) ( ON ?auto_96274 ?auto_96275 ) ( not ( = ?auto_96275 ?auto_96274 ) ) ( not ( = ?auto_96275 ?auto_96273 ) ) ( not ( = ?auto_96275 ?auto_96272 ) ) ( not ( = ?auto_96268 ?auto_96275 ) ) ( not ( = ?auto_96269 ?auto_96275 ) ) ( not ( = ?auto_96270 ?auto_96275 ) ) ( not ( = ?auto_96271 ?auto_96275 ) ) ( ON ?auto_96271 ?auto_96272 ) ( ON ?auto_96270 ?auto_96271 ) ( CLEAR ?auto_96270 ) ( HOLDING ?auto_96269 ) ( CLEAR ?auto_96268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96268 ?auto_96269 )
      ( MAKE-6PILE ?auto_96268 ?auto_96269 ?auto_96270 ?auto_96271 ?auto_96272 ?auto_96273 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96276 - BLOCK
      ?auto_96277 - BLOCK
      ?auto_96278 - BLOCK
      ?auto_96279 - BLOCK
      ?auto_96280 - BLOCK
      ?auto_96281 - BLOCK
    )
    :vars
    (
      ?auto_96282 - BLOCK
      ?auto_96283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96276 ) ( not ( = ?auto_96276 ?auto_96277 ) ) ( not ( = ?auto_96276 ?auto_96278 ) ) ( not ( = ?auto_96276 ?auto_96279 ) ) ( not ( = ?auto_96276 ?auto_96280 ) ) ( not ( = ?auto_96276 ?auto_96281 ) ) ( not ( = ?auto_96277 ?auto_96278 ) ) ( not ( = ?auto_96277 ?auto_96279 ) ) ( not ( = ?auto_96277 ?auto_96280 ) ) ( not ( = ?auto_96277 ?auto_96281 ) ) ( not ( = ?auto_96278 ?auto_96279 ) ) ( not ( = ?auto_96278 ?auto_96280 ) ) ( not ( = ?auto_96278 ?auto_96281 ) ) ( not ( = ?auto_96279 ?auto_96280 ) ) ( not ( = ?auto_96279 ?auto_96281 ) ) ( not ( = ?auto_96280 ?auto_96281 ) ) ( ON ?auto_96281 ?auto_96282 ) ( not ( = ?auto_96276 ?auto_96282 ) ) ( not ( = ?auto_96277 ?auto_96282 ) ) ( not ( = ?auto_96278 ?auto_96282 ) ) ( not ( = ?auto_96279 ?auto_96282 ) ) ( not ( = ?auto_96280 ?auto_96282 ) ) ( not ( = ?auto_96281 ?auto_96282 ) ) ( ON ?auto_96280 ?auto_96281 ) ( ON-TABLE ?auto_96283 ) ( ON ?auto_96282 ?auto_96283 ) ( not ( = ?auto_96283 ?auto_96282 ) ) ( not ( = ?auto_96283 ?auto_96281 ) ) ( not ( = ?auto_96283 ?auto_96280 ) ) ( not ( = ?auto_96276 ?auto_96283 ) ) ( not ( = ?auto_96277 ?auto_96283 ) ) ( not ( = ?auto_96278 ?auto_96283 ) ) ( not ( = ?auto_96279 ?auto_96283 ) ) ( ON ?auto_96279 ?auto_96280 ) ( ON ?auto_96278 ?auto_96279 ) ( CLEAR ?auto_96276 ) ( ON ?auto_96277 ?auto_96278 ) ( CLEAR ?auto_96277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96283 ?auto_96282 ?auto_96281 ?auto_96280 ?auto_96279 ?auto_96278 )
      ( MAKE-6PILE ?auto_96276 ?auto_96277 ?auto_96278 ?auto_96279 ?auto_96280 ?auto_96281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96284 - BLOCK
      ?auto_96285 - BLOCK
      ?auto_96286 - BLOCK
      ?auto_96287 - BLOCK
      ?auto_96288 - BLOCK
      ?auto_96289 - BLOCK
    )
    :vars
    (
      ?auto_96291 - BLOCK
      ?auto_96290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96284 ?auto_96285 ) ) ( not ( = ?auto_96284 ?auto_96286 ) ) ( not ( = ?auto_96284 ?auto_96287 ) ) ( not ( = ?auto_96284 ?auto_96288 ) ) ( not ( = ?auto_96284 ?auto_96289 ) ) ( not ( = ?auto_96285 ?auto_96286 ) ) ( not ( = ?auto_96285 ?auto_96287 ) ) ( not ( = ?auto_96285 ?auto_96288 ) ) ( not ( = ?auto_96285 ?auto_96289 ) ) ( not ( = ?auto_96286 ?auto_96287 ) ) ( not ( = ?auto_96286 ?auto_96288 ) ) ( not ( = ?auto_96286 ?auto_96289 ) ) ( not ( = ?auto_96287 ?auto_96288 ) ) ( not ( = ?auto_96287 ?auto_96289 ) ) ( not ( = ?auto_96288 ?auto_96289 ) ) ( ON ?auto_96289 ?auto_96291 ) ( not ( = ?auto_96284 ?auto_96291 ) ) ( not ( = ?auto_96285 ?auto_96291 ) ) ( not ( = ?auto_96286 ?auto_96291 ) ) ( not ( = ?auto_96287 ?auto_96291 ) ) ( not ( = ?auto_96288 ?auto_96291 ) ) ( not ( = ?auto_96289 ?auto_96291 ) ) ( ON ?auto_96288 ?auto_96289 ) ( ON-TABLE ?auto_96290 ) ( ON ?auto_96291 ?auto_96290 ) ( not ( = ?auto_96290 ?auto_96291 ) ) ( not ( = ?auto_96290 ?auto_96289 ) ) ( not ( = ?auto_96290 ?auto_96288 ) ) ( not ( = ?auto_96284 ?auto_96290 ) ) ( not ( = ?auto_96285 ?auto_96290 ) ) ( not ( = ?auto_96286 ?auto_96290 ) ) ( not ( = ?auto_96287 ?auto_96290 ) ) ( ON ?auto_96287 ?auto_96288 ) ( ON ?auto_96286 ?auto_96287 ) ( ON ?auto_96285 ?auto_96286 ) ( CLEAR ?auto_96285 ) ( HOLDING ?auto_96284 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96284 )
      ( MAKE-6PILE ?auto_96284 ?auto_96285 ?auto_96286 ?auto_96287 ?auto_96288 ?auto_96289 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96292 - BLOCK
      ?auto_96293 - BLOCK
      ?auto_96294 - BLOCK
      ?auto_96295 - BLOCK
      ?auto_96296 - BLOCK
      ?auto_96297 - BLOCK
    )
    :vars
    (
      ?auto_96298 - BLOCK
      ?auto_96299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96292 ?auto_96293 ) ) ( not ( = ?auto_96292 ?auto_96294 ) ) ( not ( = ?auto_96292 ?auto_96295 ) ) ( not ( = ?auto_96292 ?auto_96296 ) ) ( not ( = ?auto_96292 ?auto_96297 ) ) ( not ( = ?auto_96293 ?auto_96294 ) ) ( not ( = ?auto_96293 ?auto_96295 ) ) ( not ( = ?auto_96293 ?auto_96296 ) ) ( not ( = ?auto_96293 ?auto_96297 ) ) ( not ( = ?auto_96294 ?auto_96295 ) ) ( not ( = ?auto_96294 ?auto_96296 ) ) ( not ( = ?auto_96294 ?auto_96297 ) ) ( not ( = ?auto_96295 ?auto_96296 ) ) ( not ( = ?auto_96295 ?auto_96297 ) ) ( not ( = ?auto_96296 ?auto_96297 ) ) ( ON ?auto_96297 ?auto_96298 ) ( not ( = ?auto_96292 ?auto_96298 ) ) ( not ( = ?auto_96293 ?auto_96298 ) ) ( not ( = ?auto_96294 ?auto_96298 ) ) ( not ( = ?auto_96295 ?auto_96298 ) ) ( not ( = ?auto_96296 ?auto_96298 ) ) ( not ( = ?auto_96297 ?auto_96298 ) ) ( ON ?auto_96296 ?auto_96297 ) ( ON-TABLE ?auto_96299 ) ( ON ?auto_96298 ?auto_96299 ) ( not ( = ?auto_96299 ?auto_96298 ) ) ( not ( = ?auto_96299 ?auto_96297 ) ) ( not ( = ?auto_96299 ?auto_96296 ) ) ( not ( = ?auto_96292 ?auto_96299 ) ) ( not ( = ?auto_96293 ?auto_96299 ) ) ( not ( = ?auto_96294 ?auto_96299 ) ) ( not ( = ?auto_96295 ?auto_96299 ) ) ( ON ?auto_96295 ?auto_96296 ) ( ON ?auto_96294 ?auto_96295 ) ( ON ?auto_96293 ?auto_96294 ) ( ON ?auto_96292 ?auto_96293 ) ( CLEAR ?auto_96292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96299 ?auto_96298 ?auto_96297 ?auto_96296 ?auto_96295 ?auto_96294 ?auto_96293 )
      ( MAKE-6PILE ?auto_96292 ?auto_96293 ?auto_96294 ?auto_96295 ?auto_96296 ?auto_96297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96301 - BLOCK
    )
    :vars
    (
      ?auto_96302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96302 ?auto_96301 ) ( CLEAR ?auto_96302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96301 ) ( not ( = ?auto_96301 ?auto_96302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96302 ?auto_96301 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96303 - BLOCK
    )
    :vars
    (
      ?auto_96304 - BLOCK
      ?auto_96305 - BLOCK
      ?auto_96306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96304 ?auto_96303 ) ( CLEAR ?auto_96304 ) ( ON-TABLE ?auto_96303 ) ( not ( = ?auto_96303 ?auto_96304 ) ) ( HOLDING ?auto_96305 ) ( CLEAR ?auto_96306 ) ( not ( = ?auto_96303 ?auto_96305 ) ) ( not ( = ?auto_96303 ?auto_96306 ) ) ( not ( = ?auto_96304 ?auto_96305 ) ) ( not ( = ?auto_96304 ?auto_96306 ) ) ( not ( = ?auto_96305 ?auto_96306 ) ) )
    :subtasks
    ( ( !STACK ?auto_96305 ?auto_96306 )
      ( MAKE-1PILE ?auto_96303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96307 - BLOCK
    )
    :vars
    (
      ?auto_96308 - BLOCK
      ?auto_96309 - BLOCK
      ?auto_96310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96308 ?auto_96307 ) ( ON-TABLE ?auto_96307 ) ( not ( = ?auto_96307 ?auto_96308 ) ) ( CLEAR ?auto_96309 ) ( not ( = ?auto_96307 ?auto_96310 ) ) ( not ( = ?auto_96307 ?auto_96309 ) ) ( not ( = ?auto_96308 ?auto_96310 ) ) ( not ( = ?auto_96308 ?auto_96309 ) ) ( not ( = ?auto_96310 ?auto_96309 ) ) ( ON ?auto_96310 ?auto_96308 ) ( CLEAR ?auto_96310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96307 ?auto_96308 )
      ( MAKE-1PILE ?auto_96307 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96311 - BLOCK
    )
    :vars
    (
      ?auto_96312 - BLOCK
      ?auto_96314 - BLOCK
      ?auto_96313 - BLOCK
      ?auto_96318 - BLOCK
      ?auto_96315 - BLOCK
      ?auto_96317 - BLOCK
      ?auto_96316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96312 ?auto_96311 ) ( ON-TABLE ?auto_96311 ) ( not ( = ?auto_96311 ?auto_96312 ) ) ( not ( = ?auto_96311 ?auto_96314 ) ) ( not ( = ?auto_96311 ?auto_96313 ) ) ( not ( = ?auto_96312 ?auto_96314 ) ) ( not ( = ?auto_96312 ?auto_96313 ) ) ( not ( = ?auto_96314 ?auto_96313 ) ) ( ON ?auto_96314 ?auto_96312 ) ( CLEAR ?auto_96314 ) ( HOLDING ?auto_96313 ) ( CLEAR ?auto_96318 ) ( ON-TABLE ?auto_96315 ) ( ON ?auto_96317 ?auto_96315 ) ( ON ?auto_96316 ?auto_96317 ) ( ON ?auto_96318 ?auto_96316 ) ( not ( = ?auto_96315 ?auto_96317 ) ) ( not ( = ?auto_96315 ?auto_96316 ) ) ( not ( = ?auto_96315 ?auto_96318 ) ) ( not ( = ?auto_96315 ?auto_96313 ) ) ( not ( = ?auto_96317 ?auto_96316 ) ) ( not ( = ?auto_96317 ?auto_96318 ) ) ( not ( = ?auto_96317 ?auto_96313 ) ) ( not ( = ?auto_96316 ?auto_96318 ) ) ( not ( = ?auto_96316 ?auto_96313 ) ) ( not ( = ?auto_96318 ?auto_96313 ) ) ( not ( = ?auto_96311 ?auto_96318 ) ) ( not ( = ?auto_96311 ?auto_96315 ) ) ( not ( = ?auto_96311 ?auto_96317 ) ) ( not ( = ?auto_96311 ?auto_96316 ) ) ( not ( = ?auto_96312 ?auto_96318 ) ) ( not ( = ?auto_96312 ?auto_96315 ) ) ( not ( = ?auto_96312 ?auto_96317 ) ) ( not ( = ?auto_96312 ?auto_96316 ) ) ( not ( = ?auto_96314 ?auto_96318 ) ) ( not ( = ?auto_96314 ?auto_96315 ) ) ( not ( = ?auto_96314 ?auto_96317 ) ) ( not ( = ?auto_96314 ?auto_96316 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96315 ?auto_96317 ?auto_96316 ?auto_96318 ?auto_96313 )
      ( MAKE-1PILE ?auto_96311 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96319 - BLOCK
    )
    :vars
    (
      ?auto_96325 - BLOCK
      ?auto_96326 - BLOCK
      ?auto_96321 - BLOCK
      ?auto_96320 - BLOCK
      ?auto_96324 - BLOCK
      ?auto_96323 - BLOCK
      ?auto_96322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96325 ?auto_96319 ) ( ON-TABLE ?auto_96319 ) ( not ( = ?auto_96319 ?auto_96325 ) ) ( not ( = ?auto_96319 ?auto_96326 ) ) ( not ( = ?auto_96319 ?auto_96321 ) ) ( not ( = ?auto_96325 ?auto_96326 ) ) ( not ( = ?auto_96325 ?auto_96321 ) ) ( not ( = ?auto_96326 ?auto_96321 ) ) ( ON ?auto_96326 ?auto_96325 ) ( CLEAR ?auto_96320 ) ( ON-TABLE ?auto_96324 ) ( ON ?auto_96323 ?auto_96324 ) ( ON ?auto_96322 ?auto_96323 ) ( ON ?auto_96320 ?auto_96322 ) ( not ( = ?auto_96324 ?auto_96323 ) ) ( not ( = ?auto_96324 ?auto_96322 ) ) ( not ( = ?auto_96324 ?auto_96320 ) ) ( not ( = ?auto_96324 ?auto_96321 ) ) ( not ( = ?auto_96323 ?auto_96322 ) ) ( not ( = ?auto_96323 ?auto_96320 ) ) ( not ( = ?auto_96323 ?auto_96321 ) ) ( not ( = ?auto_96322 ?auto_96320 ) ) ( not ( = ?auto_96322 ?auto_96321 ) ) ( not ( = ?auto_96320 ?auto_96321 ) ) ( not ( = ?auto_96319 ?auto_96320 ) ) ( not ( = ?auto_96319 ?auto_96324 ) ) ( not ( = ?auto_96319 ?auto_96323 ) ) ( not ( = ?auto_96319 ?auto_96322 ) ) ( not ( = ?auto_96325 ?auto_96320 ) ) ( not ( = ?auto_96325 ?auto_96324 ) ) ( not ( = ?auto_96325 ?auto_96323 ) ) ( not ( = ?auto_96325 ?auto_96322 ) ) ( not ( = ?auto_96326 ?auto_96320 ) ) ( not ( = ?auto_96326 ?auto_96324 ) ) ( not ( = ?auto_96326 ?auto_96323 ) ) ( not ( = ?auto_96326 ?auto_96322 ) ) ( ON ?auto_96321 ?auto_96326 ) ( CLEAR ?auto_96321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96319 ?auto_96325 ?auto_96326 )
      ( MAKE-1PILE ?auto_96319 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96327 - BLOCK
    )
    :vars
    (
      ?auto_96330 - BLOCK
      ?auto_96333 - BLOCK
      ?auto_96329 - BLOCK
      ?auto_96332 - BLOCK
      ?auto_96334 - BLOCK
      ?auto_96331 - BLOCK
      ?auto_96328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96330 ?auto_96327 ) ( ON-TABLE ?auto_96327 ) ( not ( = ?auto_96327 ?auto_96330 ) ) ( not ( = ?auto_96327 ?auto_96333 ) ) ( not ( = ?auto_96327 ?auto_96329 ) ) ( not ( = ?auto_96330 ?auto_96333 ) ) ( not ( = ?auto_96330 ?auto_96329 ) ) ( not ( = ?auto_96333 ?auto_96329 ) ) ( ON ?auto_96333 ?auto_96330 ) ( ON-TABLE ?auto_96332 ) ( ON ?auto_96334 ?auto_96332 ) ( ON ?auto_96331 ?auto_96334 ) ( not ( = ?auto_96332 ?auto_96334 ) ) ( not ( = ?auto_96332 ?auto_96331 ) ) ( not ( = ?auto_96332 ?auto_96328 ) ) ( not ( = ?auto_96332 ?auto_96329 ) ) ( not ( = ?auto_96334 ?auto_96331 ) ) ( not ( = ?auto_96334 ?auto_96328 ) ) ( not ( = ?auto_96334 ?auto_96329 ) ) ( not ( = ?auto_96331 ?auto_96328 ) ) ( not ( = ?auto_96331 ?auto_96329 ) ) ( not ( = ?auto_96328 ?auto_96329 ) ) ( not ( = ?auto_96327 ?auto_96328 ) ) ( not ( = ?auto_96327 ?auto_96332 ) ) ( not ( = ?auto_96327 ?auto_96334 ) ) ( not ( = ?auto_96327 ?auto_96331 ) ) ( not ( = ?auto_96330 ?auto_96328 ) ) ( not ( = ?auto_96330 ?auto_96332 ) ) ( not ( = ?auto_96330 ?auto_96334 ) ) ( not ( = ?auto_96330 ?auto_96331 ) ) ( not ( = ?auto_96333 ?auto_96328 ) ) ( not ( = ?auto_96333 ?auto_96332 ) ) ( not ( = ?auto_96333 ?auto_96334 ) ) ( not ( = ?auto_96333 ?auto_96331 ) ) ( ON ?auto_96329 ?auto_96333 ) ( CLEAR ?auto_96329 ) ( HOLDING ?auto_96328 ) ( CLEAR ?auto_96331 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96332 ?auto_96334 ?auto_96331 ?auto_96328 )
      ( MAKE-1PILE ?auto_96327 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96335 - BLOCK
    )
    :vars
    (
      ?auto_96341 - BLOCK
      ?auto_96336 - BLOCK
      ?auto_96338 - BLOCK
      ?auto_96337 - BLOCK
      ?auto_96339 - BLOCK
      ?auto_96342 - BLOCK
      ?auto_96340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96341 ?auto_96335 ) ( ON-TABLE ?auto_96335 ) ( not ( = ?auto_96335 ?auto_96341 ) ) ( not ( = ?auto_96335 ?auto_96336 ) ) ( not ( = ?auto_96335 ?auto_96338 ) ) ( not ( = ?auto_96341 ?auto_96336 ) ) ( not ( = ?auto_96341 ?auto_96338 ) ) ( not ( = ?auto_96336 ?auto_96338 ) ) ( ON ?auto_96336 ?auto_96341 ) ( ON-TABLE ?auto_96337 ) ( ON ?auto_96339 ?auto_96337 ) ( ON ?auto_96342 ?auto_96339 ) ( not ( = ?auto_96337 ?auto_96339 ) ) ( not ( = ?auto_96337 ?auto_96342 ) ) ( not ( = ?auto_96337 ?auto_96340 ) ) ( not ( = ?auto_96337 ?auto_96338 ) ) ( not ( = ?auto_96339 ?auto_96342 ) ) ( not ( = ?auto_96339 ?auto_96340 ) ) ( not ( = ?auto_96339 ?auto_96338 ) ) ( not ( = ?auto_96342 ?auto_96340 ) ) ( not ( = ?auto_96342 ?auto_96338 ) ) ( not ( = ?auto_96340 ?auto_96338 ) ) ( not ( = ?auto_96335 ?auto_96340 ) ) ( not ( = ?auto_96335 ?auto_96337 ) ) ( not ( = ?auto_96335 ?auto_96339 ) ) ( not ( = ?auto_96335 ?auto_96342 ) ) ( not ( = ?auto_96341 ?auto_96340 ) ) ( not ( = ?auto_96341 ?auto_96337 ) ) ( not ( = ?auto_96341 ?auto_96339 ) ) ( not ( = ?auto_96341 ?auto_96342 ) ) ( not ( = ?auto_96336 ?auto_96340 ) ) ( not ( = ?auto_96336 ?auto_96337 ) ) ( not ( = ?auto_96336 ?auto_96339 ) ) ( not ( = ?auto_96336 ?auto_96342 ) ) ( ON ?auto_96338 ?auto_96336 ) ( CLEAR ?auto_96342 ) ( ON ?auto_96340 ?auto_96338 ) ( CLEAR ?auto_96340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96335 ?auto_96341 ?auto_96336 ?auto_96338 )
      ( MAKE-1PILE ?auto_96335 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96343 - BLOCK
    )
    :vars
    (
      ?auto_96346 - BLOCK
      ?auto_96350 - BLOCK
      ?auto_96347 - BLOCK
      ?auto_96348 - BLOCK
      ?auto_96349 - BLOCK
      ?auto_96345 - BLOCK
      ?auto_96344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96346 ?auto_96343 ) ( ON-TABLE ?auto_96343 ) ( not ( = ?auto_96343 ?auto_96346 ) ) ( not ( = ?auto_96343 ?auto_96350 ) ) ( not ( = ?auto_96343 ?auto_96347 ) ) ( not ( = ?auto_96346 ?auto_96350 ) ) ( not ( = ?auto_96346 ?auto_96347 ) ) ( not ( = ?auto_96350 ?auto_96347 ) ) ( ON ?auto_96350 ?auto_96346 ) ( ON-TABLE ?auto_96348 ) ( ON ?auto_96349 ?auto_96348 ) ( not ( = ?auto_96348 ?auto_96349 ) ) ( not ( = ?auto_96348 ?auto_96345 ) ) ( not ( = ?auto_96348 ?auto_96344 ) ) ( not ( = ?auto_96348 ?auto_96347 ) ) ( not ( = ?auto_96349 ?auto_96345 ) ) ( not ( = ?auto_96349 ?auto_96344 ) ) ( not ( = ?auto_96349 ?auto_96347 ) ) ( not ( = ?auto_96345 ?auto_96344 ) ) ( not ( = ?auto_96345 ?auto_96347 ) ) ( not ( = ?auto_96344 ?auto_96347 ) ) ( not ( = ?auto_96343 ?auto_96344 ) ) ( not ( = ?auto_96343 ?auto_96348 ) ) ( not ( = ?auto_96343 ?auto_96349 ) ) ( not ( = ?auto_96343 ?auto_96345 ) ) ( not ( = ?auto_96346 ?auto_96344 ) ) ( not ( = ?auto_96346 ?auto_96348 ) ) ( not ( = ?auto_96346 ?auto_96349 ) ) ( not ( = ?auto_96346 ?auto_96345 ) ) ( not ( = ?auto_96350 ?auto_96344 ) ) ( not ( = ?auto_96350 ?auto_96348 ) ) ( not ( = ?auto_96350 ?auto_96349 ) ) ( not ( = ?auto_96350 ?auto_96345 ) ) ( ON ?auto_96347 ?auto_96350 ) ( ON ?auto_96344 ?auto_96347 ) ( CLEAR ?auto_96344 ) ( HOLDING ?auto_96345 ) ( CLEAR ?auto_96349 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96348 ?auto_96349 ?auto_96345 )
      ( MAKE-1PILE ?auto_96343 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96351 - BLOCK
    )
    :vars
    (
      ?auto_96358 - BLOCK
      ?auto_96357 - BLOCK
      ?auto_96352 - BLOCK
      ?auto_96355 - BLOCK
      ?auto_96354 - BLOCK
      ?auto_96356 - BLOCK
      ?auto_96353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96358 ?auto_96351 ) ( ON-TABLE ?auto_96351 ) ( not ( = ?auto_96351 ?auto_96358 ) ) ( not ( = ?auto_96351 ?auto_96357 ) ) ( not ( = ?auto_96351 ?auto_96352 ) ) ( not ( = ?auto_96358 ?auto_96357 ) ) ( not ( = ?auto_96358 ?auto_96352 ) ) ( not ( = ?auto_96357 ?auto_96352 ) ) ( ON ?auto_96357 ?auto_96358 ) ( ON-TABLE ?auto_96355 ) ( ON ?auto_96354 ?auto_96355 ) ( not ( = ?auto_96355 ?auto_96354 ) ) ( not ( = ?auto_96355 ?auto_96356 ) ) ( not ( = ?auto_96355 ?auto_96353 ) ) ( not ( = ?auto_96355 ?auto_96352 ) ) ( not ( = ?auto_96354 ?auto_96356 ) ) ( not ( = ?auto_96354 ?auto_96353 ) ) ( not ( = ?auto_96354 ?auto_96352 ) ) ( not ( = ?auto_96356 ?auto_96353 ) ) ( not ( = ?auto_96356 ?auto_96352 ) ) ( not ( = ?auto_96353 ?auto_96352 ) ) ( not ( = ?auto_96351 ?auto_96353 ) ) ( not ( = ?auto_96351 ?auto_96355 ) ) ( not ( = ?auto_96351 ?auto_96354 ) ) ( not ( = ?auto_96351 ?auto_96356 ) ) ( not ( = ?auto_96358 ?auto_96353 ) ) ( not ( = ?auto_96358 ?auto_96355 ) ) ( not ( = ?auto_96358 ?auto_96354 ) ) ( not ( = ?auto_96358 ?auto_96356 ) ) ( not ( = ?auto_96357 ?auto_96353 ) ) ( not ( = ?auto_96357 ?auto_96355 ) ) ( not ( = ?auto_96357 ?auto_96354 ) ) ( not ( = ?auto_96357 ?auto_96356 ) ) ( ON ?auto_96352 ?auto_96357 ) ( ON ?auto_96353 ?auto_96352 ) ( CLEAR ?auto_96354 ) ( ON ?auto_96356 ?auto_96353 ) ( CLEAR ?auto_96356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96351 ?auto_96358 ?auto_96357 ?auto_96352 ?auto_96353 )
      ( MAKE-1PILE ?auto_96351 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96359 - BLOCK
    )
    :vars
    (
      ?auto_96362 - BLOCK
      ?auto_96366 - BLOCK
      ?auto_96363 - BLOCK
      ?auto_96361 - BLOCK
      ?auto_96360 - BLOCK
      ?auto_96365 - BLOCK
      ?auto_96364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96362 ?auto_96359 ) ( ON-TABLE ?auto_96359 ) ( not ( = ?auto_96359 ?auto_96362 ) ) ( not ( = ?auto_96359 ?auto_96366 ) ) ( not ( = ?auto_96359 ?auto_96363 ) ) ( not ( = ?auto_96362 ?auto_96366 ) ) ( not ( = ?auto_96362 ?auto_96363 ) ) ( not ( = ?auto_96366 ?auto_96363 ) ) ( ON ?auto_96366 ?auto_96362 ) ( ON-TABLE ?auto_96361 ) ( not ( = ?auto_96361 ?auto_96360 ) ) ( not ( = ?auto_96361 ?auto_96365 ) ) ( not ( = ?auto_96361 ?auto_96364 ) ) ( not ( = ?auto_96361 ?auto_96363 ) ) ( not ( = ?auto_96360 ?auto_96365 ) ) ( not ( = ?auto_96360 ?auto_96364 ) ) ( not ( = ?auto_96360 ?auto_96363 ) ) ( not ( = ?auto_96365 ?auto_96364 ) ) ( not ( = ?auto_96365 ?auto_96363 ) ) ( not ( = ?auto_96364 ?auto_96363 ) ) ( not ( = ?auto_96359 ?auto_96364 ) ) ( not ( = ?auto_96359 ?auto_96361 ) ) ( not ( = ?auto_96359 ?auto_96360 ) ) ( not ( = ?auto_96359 ?auto_96365 ) ) ( not ( = ?auto_96362 ?auto_96364 ) ) ( not ( = ?auto_96362 ?auto_96361 ) ) ( not ( = ?auto_96362 ?auto_96360 ) ) ( not ( = ?auto_96362 ?auto_96365 ) ) ( not ( = ?auto_96366 ?auto_96364 ) ) ( not ( = ?auto_96366 ?auto_96361 ) ) ( not ( = ?auto_96366 ?auto_96360 ) ) ( not ( = ?auto_96366 ?auto_96365 ) ) ( ON ?auto_96363 ?auto_96366 ) ( ON ?auto_96364 ?auto_96363 ) ( ON ?auto_96365 ?auto_96364 ) ( CLEAR ?auto_96365 ) ( HOLDING ?auto_96360 ) ( CLEAR ?auto_96361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96361 ?auto_96360 )
      ( MAKE-1PILE ?auto_96359 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96367 - BLOCK
    )
    :vars
    (
      ?auto_96373 - BLOCK
      ?auto_96369 - BLOCK
      ?auto_96371 - BLOCK
      ?auto_96374 - BLOCK
      ?auto_96368 - BLOCK
      ?auto_96370 - BLOCK
      ?auto_96372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96373 ?auto_96367 ) ( ON-TABLE ?auto_96367 ) ( not ( = ?auto_96367 ?auto_96373 ) ) ( not ( = ?auto_96367 ?auto_96369 ) ) ( not ( = ?auto_96367 ?auto_96371 ) ) ( not ( = ?auto_96373 ?auto_96369 ) ) ( not ( = ?auto_96373 ?auto_96371 ) ) ( not ( = ?auto_96369 ?auto_96371 ) ) ( ON ?auto_96369 ?auto_96373 ) ( ON-TABLE ?auto_96374 ) ( not ( = ?auto_96374 ?auto_96368 ) ) ( not ( = ?auto_96374 ?auto_96370 ) ) ( not ( = ?auto_96374 ?auto_96372 ) ) ( not ( = ?auto_96374 ?auto_96371 ) ) ( not ( = ?auto_96368 ?auto_96370 ) ) ( not ( = ?auto_96368 ?auto_96372 ) ) ( not ( = ?auto_96368 ?auto_96371 ) ) ( not ( = ?auto_96370 ?auto_96372 ) ) ( not ( = ?auto_96370 ?auto_96371 ) ) ( not ( = ?auto_96372 ?auto_96371 ) ) ( not ( = ?auto_96367 ?auto_96372 ) ) ( not ( = ?auto_96367 ?auto_96374 ) ) ( not ( = ?auto_96367 ?auto_96368 ) ) ( not ( = ?auto_96367 ?auto_96370 ) ) ( not ( = ?auto_96373 ?auto_96372 ) ) ( not ( = ?auto_96373 ?auto_96374 ) ) ( not ( = ?auto_96373 ?auto_96368 ) ) ( not ( = ?auto_96373 ?auto_96370 ) ) ( not ( = ?auto_96369 ?auto_96372 ) ) ( not ( = ?auto_96369 ?auto_96374 ) ) ( not ( = ?auto_96369 ?auto_96368 ) ) ( not ( = ?auto_96369 ?auto_96370 ) ) ( ON ?auto_96371 ?auto_96369 ) ( ON ?auto_96372 ?auto_96371 ) ( ON ?auto_96370 ?auto_96372 ) ( CLEAR ?auto_96374 ) ( ON ?auto_96368 ?auto_96370 ) ( CLEAR ?auto_96368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96367 ?auto_96373 ?auto_96369 ?auto_96371 ?auto_96372 ?auto_96370 )
      ( MAKE-1PILE ?auto_96367 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96375 - BLOCK
    )
    :vars
    (
      ?auto_96379 - BLOCK
      ?auto_96376 - BLOCK
      ?auto_96382 - BLOCK
      ?auto_96377 - BLOCK
      ?auto_96378 - BLOCK
      ?auto_96380 - BLOCK
      ?auto_96381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96379 ?auto_96375 ) ( ON-TABLE ?auto_96375 ) ( not ( = ?auto_96375 ?auto_96379 ) ) ( not ( = ?auto_96375 ?auto_96376 ) ) ( not ( = ?auto_96375 ?auto_96382 ) ) ( not ( = ?auto_96379 ?auto_96376 ) ) ( not ( = ?auto_96379 ?auto_96382 ) ) ( not ( = ?auto_96376 ?auto_96382 ) ) ( ON ?auto_96376 ?auto_96379 ) ( not ( = ?auto_96377 ?auto_96378 ) ) ( not ( = ?auto_96377 ?auto_96380 ) ) ( not ( = ?auto_96377 ?auto_96381 ) ) ( not ( = ?auto_96377 ?auto_96382 ) ) ( not ( = ?auto_96378 ?auto_96380 ) ) ( not ( = ?auto_96378 ?auto_96381 ) ) ( not ( = ?auto_96378 ?auto_96382 ) ) ( not ( = ?auto_96380 ?auto_96381 ) ) ( not ( = ?auto_96380 ?auto_96382 ) ) ( not ( = ?auto_96381 ?auto_96382 ) ) ( not ( = ?auto_96375 ?auto_96381 ) ) ( not ( = ?auto_96375 ?auto_96377 ) ) ( not ( = ?auto_96375 ?auto_96378 ) ) ( not ( = ?auto_96375 ?auto_96380 ) ) ( not ( = ?auto_96379 ?auto_96381 ) ) ( not ( = ?auto_96379 ?auto_96377 ) ) ( not ( = ?auto_96379 ?auto_96378 ) ) ( not ( = ?auto_96379 ?auto_96380 ) ) ( not ( = ?auto_96376 ?auto_96381 ) ) ( not ( = ?auto_96376 ?auto_96377 ) ) ( not ( = ?auto_96376 ?auto_96378 ) ) ( not ( = ?auto_96376 ?auto_96380 ) ) ( ON ?auto_96382 ?auto_96376 ) ( ON ?auto_96381 ?auto_96382 ) ( ON ?auto_96380 ?auto_96381 ) ( ON ?auto_96378 ?auto_96380 ) ( CLEAR ?auto_96378 ) ( HOLDING ?auto_96377 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96377 )
      ( MAKE-1PILE ?auto_96375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96383 - BLOCK
    )
    :vars
    (
      ?auto_96390 - BLOCK
      ?auto_96388 - BLOCK
      ?auto_96386 - BLOCK
      ?auto_96387 - BLOCK
      ?auto_96384 - BLOCK
      ?auto_96389 - BLOCK
      ?auto_96385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96390 ?auto_96383 ) ( ON-TABLE ?auto_96383 ) ( not ( = ?auto_96383 ?auto_96390 ) ) ( not ( = ?auto_96383 ?auto_96388 ) ) ( not ( = ?auto_96383 ?auto_96386 ) ) ( not ( = ?auto_96390 ?auto_96388 ) ) ( not ( = ?auto_96390 ?auto_96386 ) ) ( not ( = ?auto_96388 ?auto_96386 ) ) ( ON ?auto_96388 ?auto_96390 ) ( not ( = ?auto_96387 ?auto_96384 ) ) ( not ( = ?auto_96387 ?auto_96389 ) ) ( not ( = ?auto_96387 ?auto_96385 ) ) ( not ( = ?auto_96387 ?auto_96386 ) ) ( not ( = ?auto_96384 ?auto_96389 ) ) ( not ( = ?auto_96384 ?auto_96385 ) ) ( not ( = ?auto_96384 ?auto_96386 ) ) ( not ( = ?auto_96389 ?auto_96385 ) ) ( not ( = ?auto_96389 ?auto_96386 ) ) ( not ( = ?auto_96385 ?auto_96386 ) ) ( not ( = ?auto_96383 ?auto_96385 ) ) ( not ( = ?auto_96383 ?auto_96387 ) ) ( not ( = ?auto_96383 ?auto_96384 ) ) ( not ( = ?auto_96383 ?auto_96389 ) ) ( not ( = ?auto_96390 ?auto_96385 ) ) ( not ( = ?auto_96390 ?auto_96387 ) ) ( not ( = ?auto_96390 ?auto_96384 ) ) ( not ( = ?auto_96390 ?auto_96389 ) ) ( not ( = ?auto_96388 ?auto_96385 ) ) ( not ( = ?auto_96388 ?auto_96387 ) ) ( not ( = ?auto_96388 ?auto_96384 ) ) ( not ( = ?auto_96388 ?auto_96389 ) ) ( ON ?auto_96386 ?auto_96388 ) ( ON ?auto_96385 ?auto_96386 ) ( ON ?auto_96389 ?auto_96385 ) ( ON ?auto_96384 ?auto_96389 ) ( ON ?auto_96387 ?auto_96384 ) ( CLEAR ?auto_96387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96383 ?auto_96390 ?auto_96388 ?auto_96386 ?auto_96385 ?auto_96389 ?auto_96384 )
      ( MAKE-1PILE ?auto_96383 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96398 - BLOCK
      ?auto_96399 - BLOCK
      ?auto_96400 - BLOCK
      ?auto_96401 - BLOCK
      ?auto_96402 - BLOCK
      ?auto_96403 - BLOCK
      ?auto_96404 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_96404 ) ( CLEAR ?auto_96403 ) ( ON-TABLE ?auto_96398 ) ( ON ?auto_96399 ?auto_96398 ) ( ON ?auto_96400 ?auto_96399 ) ( ON ?auto_96401 ?auto_96400 ) ( ON ?auto_96402 ?auto_96401 ) ( ON ?auto_96403 ?auto_96402 ) ( not ( = ?auto_96398 ?auto_96399 ) ) ( not ( = ?auto_96398 ?auto_96400 ) ) ( not ( = ?auto_96398 ?auto_96401 ) ) ( not ( = ?auto_96398 ?auto_96402 ) ) ( not ( = ?auto_96398 ?auto_96403 ) ) ( not ( = ?auto_96398 ?auto_96404 ) ) ( not ( = ?auto_96399 ?auto_96400 ) ) ( not ( = ?auto_96399 ?auto_96401 ) ) ( not ( = ?auto_96399 ?auto_96402 ) ) ( not ( = ?auto_96399 ?auto_96403 ) ) ( not ( = ?auto_96399 ?auto_96404 ) ) ( not ( = ?auto_96400 ?auto_96401 ) ) ( not ( = ?auto_96400 ?auto_96402 ) ) ( not ( = ?auto_96400 ?auto_96403 ) ) ( not ( = ?auto_96400 ?auto_96404 ) ) ( not ( = ?auto_96401 ?auto_96402 ) ) ( not ( = ?auto_96401 ?auto_96403 ) ) ( not ( = ?auto_96401 ?auto_96404 ) ) ( not ( = ?auto_96402 ?auto_96403 ) ) ( not ( = ?auto_96402 ?auto_96404 ) ) ( not ( = ?auto_96403 ?auto_96404 ) ) )
    :subtasks
    ( ( !STACK ?auto_96404 ?auto_96403 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96405 - BLOCK
      ?auto_96406 - BLOCK
      ?auto_96407 - BLOCK
      ?auto_96408 - BLOCK
      ?auto_96409 - BLOCK
      ?auto_96410 - BLOCK
      ?auto_96411 - BLOCK
    )
    :vars
    (
      ?auto_96412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96410 ) ( ON-TABLE ?auto_96405 ) ( ON ?auto_96406 ?auto_96405 ) ( ON ?auto_96407 ?auto_96406 ) ( ON ?auto_96408 ?auto_96407 ) ( ON ?auto_96409 ?auto_96408 ) ( ON ?auto_96410 ?auto_96409 ) ( not ( = ?auto_96405 ?auto_96406 ) ) ( not ( = ?auto_96405 ?auto_96407 ) ) ( not ( = ?auto_96405 ?auto_96408 ) ) ( not ( = ?auto_96405 ?auto_96409 ) ) ( not ( = ?auto_96405 ?auto_96410 ) ) ( not ( = ?auto_96405 ?auto_96411 ) ) ( not ( = ?auto_96406 ?auto_96407 ) ) ( not ( = ?auto_96406 ?auto_96408 ) ) ( not ( = ?auto_96406 ?auto_96409 ) ) ( not ( = ?auto_96406 ?auto_96410 ) ) ( not ( = ?auto_96406 ?auto_96411 ) ) ( not ( = ?auto_96407 ?auto_96408 ) ) ( not ( = ?auto_96407 ?auto_96409 ) ) ( not ( = ?auto_96407 ?auto_96410 ) ) ( not ( = ?auto_96407 ?auto_96411 ) ) ( not ( = ?auto_96408 ?auto_96409 ) ) ( not ( = ?auto_96408 ?auto_96410 ) ) ( not ( = ?auto_96408 ?auto_96411 ) ) ( not ( = ?auto_96409 ?auto_96410 ) ) ( not ( = ?auto_96409 ?auto_96411 ) ) ( not ( = ?auto_96410 ?auto_96411 ) ) ( ON ?auto_96411 ?auto_96412 ) ( CLEAR ?auto_96411 ) ( HAND-EMPTY ) ( not ( = ?auto_96405 ?auto_96412 ) ) ( not ( = ?auto_96406 ?auto_96412 ) ) ( not ( = ?auto_96407 ?auto_96412 ) ) ( not ( = ?auto_96408 ?auto_96412 ) ) ( not ( = ?auto_96409 ?auto_96412 ) ) ( not ( = ?auto_96410 ?auto_96412 ) ) ( not ( = ?auto_96411 ?auto_96412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96411 ?auto_96412 )
      ( MAKE-7PILE ?auto_96405 ?auto_96406 ?auto_96407 ?auto_96408 ?auto_96409 ?auto_96410 ?auto_96411 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96413 - BLOCK
      ?auto_96414 - BLOCK
      ?auto_96415 - BLOCK
      ?auto_96416 - BLOCK
      ?auto_96417 - BLOCK
      ?auto_96418 - BLOCK
      ?auto_96419 - BLOCK
    )
    :vars
    (
      ?auto_96420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96413 ) ( ON ?auto_96414 ?auto_96413 ) ( ON ?auto_96415 ?auto_96414 ) ( ON ?auto_96416 ?auto_96415 ) ( ON ?auto_96417 ?auto_96416 ) ( not ( = ?auto_96413 ?auto_96414 ) ) ( not ( = ?auto_96413 ?auto_96415 ) ) ( not ( = ?auto_96413 ?auto_96416 ) ) ( not ( = ?auto_96413 ?auto_96417 ) ) ( not ( = ?auto_96413 ?auto_96418 ) ) ( not ( = ?auto_96413 ?auto_96419 ) ) ( not ( = ?auto_96414 ?auto_96415 ) ) ( not ( = ?auto_96414 ?auto_96416 ) ) ( not ( = ?auto_96414 ?auto_96417 ) ) ( not ( = ?auto_96414 ?auto_96418 ) ) ( not ( = ?auto_96414 ?auto_96419 ) ) ( not ( = ?auto_96415 ?auto_96416 ) ) ( not ( = ?auto_96415 ?auto_96417 ) ) ( not ( = ?auto_96415 ?auto_96418 ) ) ( not ( = ?auto_96415 ?auto_96419 ) ) ( not ( = ?auto_96416 ?auto_96417 ) ) ( not ( = ?auto_96416 ?auto_96418 ) ) ( not ( = ?auto_96416 ?auto_96419 ) ) ( not ( = ?auto_96417 ?auto_96418 ) ) ( not ( = ?auto_96417 ?auto_96419 ) ) ( not ( = ?auto_96418 ?auto_96419 ) ) ( ON ?auto_96419 ?auto_96420 ) ( CLEAR ?auto_96419 ) ( not ( = ?auto_96413 ?auto_96420 ) ) ( not ( = ?auto_96414 ?auto_96420 ) ) ( not ( = ?auto_96415 ?auto_96420 ) ) ( not ( = ?auto_96416 ?auto_96420 ) ) ( not ( = ?auto_96417 ?auto_96420 ) ) ( not ( = ?auto_96418 ?auto_96420 ) ) ( not ( = ?auto_96419 ?auto_96420 ) ) ( HOLDING ?auto_96418 ) ( CLEAR ?auto_96417 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96413 ?auto_96414 ?auto_96415 ?auto_96416 ?auto_96417 ?auto_96418 )
      ( MAKE-7PILE ?auto_96413 ?auto_96414 ?auto_96415 ?auto_96416 ?auto_96417 ?auto_96418 ?auto_96419 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96421 - BLOCK
      ?auto_96422 - BLOCK
      ?auto_96423 - BLOCK
      ?auto_96424 - BLOCK
      ?auto_96425 - BLOCK
      ?auto_96426 - BLOCK
      ?auto_96427 - BLOCK
    )
    :vars
    (
      ?auto_96428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96421 ) ( ON ?auto_96422 ?auto_96421 ) ( ON ?auto_96423 ?auto_96422 ) ( ON ?auto_96424 ?auto_96423 ) ( ON ?auto_96425 ?auto_96424 ) ( not ( = ?auto_96421 ?auto_96422 ) ) ( not ( = ?auto_96421 ?auto_96423 ) ) ( not ( = ?auto_96421 ?auto_96424 ) ) ( not ( = ?auto_96421 ?auto_96425 ) ) ( not ( = ?auto_96421 ?auto_96426 ) ) ( not ( = ?auto_96421 ?auto_96427 ) ) ( not ( = ?auto_96422 ?auto_96423 ) ) ( not ( = ?auto_96422 ?auto_96424 ) ) ( not ( = ?auto_96422 ?auto_96425 ) ) ( not ( = ?auto_96422 ?auto_96426 ) ) ( not ( = ?auto_96422 ?auto_96427 ) ) ( not ( = ?auto_96423 ?auto_96424 ) ) ( not ( = ?auto_96423 ?auto_96425 ) ) ( not ( = ?auto_96423 ?auto_96426 ) ) ( not ( = ?auto_96423 ?auto_96427 ) ) ( not ( = ?auto_96424 ?auto_96425 ) ) ( not ( = ?auto_96424 ?auto_96426 ) ) ( not ( = ?auto_96424 ?auto_96427 ) ) ( not ( = ?auto_96425 ?auto_96426 ) ) ( not ( = ?auto_96425 ?auto_96427 ) ) ( not ( = ?auto_96426 ?auto_96427 ) ) ( ON ?auto_96427 ?auto_96428 ) ( not ( = ?auto_96421 ?auto_96428 ) ) ( not ( = ?auto_96422 ?auto_96428 ) ) ( not ( = ?auto_96423 ?auto_96428 ) ) ( not ( = ?auto_96424 ?auto_96428 ) ) ( not ( = ?auto_96425 ?auto_96428 ) ) ( not ( = ?auto_96426 ?auto_96428 ) ) ( not ( = ?auto_96427 ?auto_96428 ) ) ( CLEAR ?auto_96425 ) ( ON ?auto_96426 ?auto_96427 ) ( CLEAR ?auto_96426 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96428 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96428 ?auto_96427 )
      ( MAKE-7PILE ?auto_96421 ?auto_96422 ?auto_96423 ?auto_96424 ?auto_96425 ?auto_96426 ?auto_96427 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96429 - BLOCK
      ?auto_96430 - BLOCK
      ?auto_96431 - BLOCK
      ?auto_96432 - BLOCK
      ?auto_96433 - BLOCK
      ?auto_96434 - BLOCK
      ?auto_96435 - BLOCK
    )
    :vars
    (
      ?auto_96436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96429 ) ( ON ?auto_96430 ?auto_96429 ) ( ON ?auto_96431 ?auto_96430 ) ( ON ?auto_96432 ?auto_96431 ) ( not ( = ?auto_96429 ?auto_96430 ) ) ( not ( = ?auto_96429 ?auto_96431 ) ) ( not ( = ?auto_96429 ?auto_96432 ) ) ( not ( = ?auto_96429 ?auto_96433 ) ) ( not ( = ?auto_96429 ?auto_96434 ) ) ( not ( = ?auto_96429 ?auto_96435 ) ) ( not ( = ?auto_96430 ?auto_96431 ) ) ( not ( = ?auto_96430 ?auto_96432 ) ) ( not ( = ?auto_96430 ?auto_96433 ) ) ( not ( = ?auto_96430 ?auto_96434 ) ) ( not ( = ?auto_96430 ?auto_96435 ) ) ( not ( = ?auto_96431 ?auto_96432 ) ) ( not ( = ?auto_96431 ?auto_96433 ) ) ( not ( = ?auto_96431 ?auto_96434 ) ) ( not ( = ?auto_96431 ?auto_96435 ) ) ( not ( = ?auto_96432 ?auto_96433 ) ) ( not ( = ?auto_96432 ?auto_96434 ) ) ( not ( = ?auto_96432 ?auto_96435 ) ) ( not ( = ?auto_96433 ?auto_96434 ) ) ( not ( = ?auto_96433 ?auto_96435 ) ) ( not ( = ?auto_96434 ?auto_96435 ) ) ( ON ?auto_96435 ?auto_96436 ) ( not ( = ?auto_96429 ?auto_96436 ) ) ( not ( = ?auto_96430 ?auto_96436 ) ) ( not ( = ?auto_96431 ?auto_96436 ) ) ( not ( = ?auto_96432 ?auto_96436 ) ) ( not ( = ?auto_96433 ?auto_96436 ) ) ( not ( = ?auto_96434 ?auto_96436 ) ) ( not ( = ?auto_96435 ?auto_96436 ) ) ( ON ?auto_96434 ?auto_96435 ) ( CLEAR ?auto_96434 ) ( ON-TABLE ?auto_96436 ) ( HOLDING ?auto_96433 ) ( CLEAR ?auto_96432 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96429 ?auto_96430 ?auto_96431 ?auto_96432 ?auto_96433 )
      ( MAKE-7PILE ?auto_96429 ?auto_96430 ?auto_96431 ?auto_96432 ?auto_96433 ?auto_96434 ?auto_96435 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96437 - BLOCK
      ?auto_96438 - BLOCK
      ?auto_96439 - BLOCK
      ?auto_96440 - BLOCK
      ?auto_96441 - BLOCK
      ?auto_96442 - BLOCK
      ?auto_96443 - BLOCK
    )
    :vars
    (
      ?auto_96444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96437 ) ( ON ?auto_96438 ?auto_96437 ) ( ON ?auto_96439 ?auto_96438 ) ( ON ?auto_96440 ?auto_96439 ) ( not ( = ?auto_96437 ?auto_96438 ) ) ( not ( = ?auto_96437 ?auto_96439 ) ) ( not ( = ?auto_96437 ?auto_96440 ) ) ( not ( = ?auto_96437 ?auto_96441 ) ) ( not ( = ?auto_96437 ?auto_96442 ) ) ( not ( = ?auto_96437 ?auto_96443 ) ) ( not ( = ?auto_96438 ?auto_96439 ) ) ( not ( = ?auto_96438 ?auto_96440 ) ) ( not ( = ?auto_96438 ?auto_96441 ) ) ( not ( = ?auto_96438 ?auto_96442 ) ) ( not ( = ?auto_96438 ?auto_96443 ) ) ( not ( = ?auto_96439 ?auto_96440 ) ) ( not ( = ?auto_96439 ?auto_96441 ) ) ( not ( = ?auto_96439 ?auto_96442 ) ) ( not ( = ?auto_96439 ?auto_96443 ) ) ( not ( = ?auto_96440 ?auto_96441 ) ) ( not ( = ?auto_96440 ?auto_96442 ) ) ( not ( = ?auto_96440 ?auto_96443 ) ) ( not ( = ?auto_96441 ?auto_96442 ) ) ( not ( = ?auto_96441 ?auto_96443 ) ) ( not ( = ?auto_96442 ?auto_96443 ) ) ( ON ?auto_96443 ?auto_96444 ) ( not ( = ?auto_96437 ?auto_96444 ) ) ( not ( = ?auto_96438 ?auto_96444 ) ) ( not ( = ?auto_96439 ?auto_96444 ) ) ( not ( = ?auto_96440 ?auto_96444 ) ) ( not ( = ?auto_96441 ?auto_96444 ) ) ( not ( = ?auto_96442 ?auto_96444 ) ) ( not ( = ?auto_96443 ?auto_96444 ) ) ( ON ?auto_96442 ?auto_96443 ) ( ON-TABLE ?auto_96444 ) ( CLEAR ?auto_96440 ) ( ON ?auto_96441 ?auto_96442 ) ( CLEAR ?auto_96441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96444 ?auto_96443 ?auto_96442 )
      ( MAKE-7PILE ?auto_96437 ?auto_96438 ?auto_96439 ?auto_96440 ?auto_96441 ?auto_96442 ?auto_96443 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96445 - BLOCK
      ?auto_96446 - BLOCK
      ?auto_96447 - BLOCK
      ?auto_96448 - BLOCK
      ?auto_96449 - BLOCK
      ?auto_96450 - BLOCK
      ?auto_96451 - BLOCK
    )
    :vars
    (
      ?auto_96452 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96445 ) ( ON ?auto_96446 ?auto_96445 ) ( ON ?auto_96447 ?auto_96446 ) ( not ( = ?auto_96445 ?auto_96446 ) ) ( not ( = ?auto_96445 ?auto_96447 ) ) ( not ( = ?auto_96445 ?auto_96448 ) ) ( not ( = ?auto_96445 ?auto_96449 ) ) ( not ( = ?auto_96445 ?auto_96450 ) ) ( not ( = ?auto_96445 ?auto_96451 ) ) ( not ( = ?auto_96446 ?auto_96447 ) ) ( not ( = ?auto_96446 ?auto_96448 ) ) ( not ( = ?auto_96446 ?auto_96449 ) ) ( not ( = ?auto_96446 ?auto_96450 ) ) ( not ( = ?auto_96446 ?auto_96451 ) ) ( not ( = ?auto_96447 ?auto_96448 ) ) ( not ( = ?auto_96447 ?auto_96449 ) ) ( not ( = ?auto_96447 ?auto_96450 ) ) ( not ( = ?auto_96447 ?auto_96451 ) ) ( not ( = ?auto_96448 ?auto_96449 ) ) ( not ( = ?auto_96448 ?auto_96450 ) ) ( not ( = ?auto_96448 ?auto_96451 ) ) ( not ( = ?auto_96449 ?auto_96450 ) ) ( not ( = ?auto_96449 ?auto_96451 ) ) ( not ( = ?auto_96450 ?auto_96451 ) ) ( ON ?auto_96451 ?auto_96452 ) ( not ( = ?auto_96445 ?auto_96452 ) ) ( not ( = ?auto_96446 ?auto_96452 ) ) ( not ( = ?auto_96447 ?auto_96452 ) ) ( not ( = ?auto_96448 ?auto_96452 ) ) ( not ( = ?auto_96449 ?auto_96452 ) ) ( not ( = ?auto_96450 ?auto_96452 ) ) ( not ( = ?auto_96451 ?auto_96452 ) ) ( ON ?auto_96450 ?auto_96451 ) ( ON-TABLE ?auto_96452 ) ( ON ?auto_96449 ?auto_96450 ) ( CLEAR ?auto_96449 ) ( HOLDING ?auto_96448 ) ( CLEAR ?auto_96447 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96445 ?auto_96446 ?auto_96447 ?auto_96448 )
      ( MAKE-7PILE ?auto_96445 ?auto_96446 ?auto_96447 ?auto_96448 ?auto_96449 ?auto_96450 ?auto_96451 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96453 - BLOCK
      ?auto_96454 - BLOCK
      ?auto_96455 - BLOCK
      ?auto_96456 - BLOCK
      ?auto_96457 - BLOCK
      ?auto_96458 - BLOCK
      ?auto_96459 - BLOCK
    )
    :vars
    (
      ?auto_96460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96453 ) ( ON ?auto_96454 ?auto_96453 ) ( ON ?auto_96455 ?auto_96454 ) ( not ( = ?auto_96453 ?auto_96454 ) ) ( not ( = ?auto_96453 ?auto_96455 ) ) ( not ( = ?auto_96453 ?auto_96456 ) ) ( not ( = ?auto_96453 ?auto_96457 ) ) ( not ( = ?auto_96453 ?auto_96458 ) ) ( not ( = ?auto_96453 ?auto_96459 ) ) ( not ( = ?auto_96454 ?auto_96455 ) ) ( not ( = ?auto_96454 ?auto_96456 ) ) ( not ( = ?auto_96454 ?auto_96457 ) ) ( not ( = ?auto_96454 ?auto_96458 ) ) ( not ( = ?auto_96454 ?auto_96459 ) ) ( not ( = ?auto_96455 ?auto_96456 ) ) ( not ( = ?auto_96455 ?auto_96457 ) ) ( not ( = ?auto_96455 ?auto_96458 ) ) ( not ( = ?auto_96455 ?auto_96459 ) ) ( not ( = ?auto_96456 ?auto_96457 ) ) ( not ( = ?auto_96456 ?auto_96458 ) ) ( not ( = ?auto_96456 ?auto_96459 ) ) ( not ( = ?auto_96457 ?auto_96458 ) ) ( not ( = ?auto_96457 ?auto_96459 ) ) ( not ( = ?auto_96458 ?auto_96459 ) ) ( ON ?auto_96459 ?auto_96460 ) ( not ( = ?auto_96453 ?auto_96460 ) ) ( not ( = ?auto_96454 ?auto_96460 ) ) ( not ( = ?auto_96455 ?auto_96460 ) ) ( not ( = ?auto_96456 ?auto_96460 ) ) ( not ( = ?auto_96457 ?auto_96460 ) ) ( not ( = ?auto_96458 ?auto_96460 ) ) ( not ( = ?auto_96459 ?auto_96460 ) ) ( ON ?auto_96458 ?auto_96459 ) ( ON-TABLE ?auto_96460 ) ( ON ?auto_96457 ?auto_96458 ) ( CLEAR ?auto_96455 ) ( ON ?auto_96456 ?auto_96457 ) ( CLEAR ?auto_96456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96460 ?auto_96459 ?auto_96458 ?auto_96457 )
      ( MAKE-7PILE ?auto_96453 ?auto_96454 ?auto_96455 ?auto_96456 ?auto_96457 ?auto_96458 ?auto_96459 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96461 - BLOCK
      ?auto_96462 - BLOCK
      ?auto_96463 - BLOCK
      ?auto_96464 - BLOCK
      ?auto_96465 - BLOCK
      ?auto_96466 - BLOCK
      ?auto_96467 - BLOCK
    )
    :vars
    (
      ?auto_96468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96461 ) ( ON ?auto_96462 ?auto_96461 ) ( not ( = ?auto_96461 ?auto_96462 ) ) ( not ( = ?auto_96461 ?auto_96463 ) ) ( not ( = ?auto_96461 ?auto_96464 ) ) ( not ( = ?auto_96461 ?auto_96465 ) ) ( not ( = ?auto_96461 ?auto_96466 ) ) ( not ( = ?auto_96461 ?auto_96467 ) ) ( not ( = ?auto_96462 ?auto_96463 ) ) ( not ( = ?auto_96462 ?auto_96464 ) ) ( not ( = ?auto_96462 ?auto_96465 ) ) ( not ( = ?auto_96462 ?auto_96466 ) ) ( not ( = ?auto_96462 ?auto_96467 ) ) ( not ( = ?auto_96463 ?auto_96464 ) ) ( not ( = ?auto_96463 ?auto_96465 ) ) ( not ( = ?auto_96463 ?auto_96466 ) ) ( not ( = ?auto_96463 ?auto_96467 ) ) ( not ( = ?auto_96464 ?auto_96465 ) ) ( not ( = ?auto_96464 ?auto_96466 ) ) ( not ( = ?auto_96464 ?auto_96467 ) ) ( not ( = ?auto_96465 ?auto_96466 ) ) ( not ( = ?auto_96465 ?auto_96467 ) ) ( not ( = ?auto_96466 ?auto_96467 ) ) ( ON ?auto_96467 ?auto_96468 ) ( not ( = ?auto_96461 ?auto_96468 ) ) ( not ( = ?auto_96462 ?auto_96468 ) ) ( not ( = ?auto_96463 ?auto_96468 ) ) ( not ( = ?auto_96464 ?auto_96468 ) ) ( not ( = ?auto_96465 ?auto_96468 ) ) ( not ( = ?auto_96466 ?auto_96468 ) ) ( not ( = ?auto_96467 ?auto_96468 ) ) ( ON ?auto_96466 ?auto_96467 ) ( ON-TABLE ?auto_96468 ) ( ON ?auto_96465 ?auto_96466 ) ( ON ?auto_96464 ?auto_96465 ) ( CLEAR ?auto_96464 ) ( HOLDING ?auto_96463 ) ( CLEAR ?auto_96462 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96461 ?auto_96462 ?auto_96463 )
      ( MAKE-7PILE ?auto_96461 ?auto_96462 ?auto_96463 ?auto_96464 ?auto_96465 ?auto_96466 ?auto_96467 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96469 - BLOCK
      ?auto_96470 - BLOCK
      ?auto_96471 - BLOCK
      ?auto_96472 - BLOCK
      ?auto_96473 - BLOCK
      ?auto_96474 - BLOCK
      ?auto_96475 - BLOCK
    )
    :vars
    (
      ?auto_96476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96469 ) ( ON ?auto_96470 ?auto_96469 ) ( not ( = ?auto_96469 ?auto_96470 ) ) ( not ( = ?auto_96469 ?auto_96471 ) ) ( not ( = ?auto_96469 ?auto_96472 ) ) ( not ( = ?auto_96469 ?auto_96473 ) ) ( not ( = ?auto_96469 ?auto_96474 ) ) ( not ( = ?auto_96469 ?auto_96475 ) ) ( not ( = ?auto_96470 ?auto_96471 ) ) ( not ( = ?auto_96470 ?auto_96472 ) ) ( not ( = ?auto_96470 ?auto_96473 ) ) ( not ( = ?auto_96470 ?auto_96474 ) ) ( not ( = ?auto_96470 ?auto_96475 ) ) ( not ( = ?auto_96471 ?auto_96472 ) ) ( not ( = ?auto_96471 ?auto_96473 ) ) ( not ( = ?auto_96471 ?auto_96474 ) ) ( not ( = ?auto_96471 ?auto_96475 ) ) ( not ( = ?auto_96472 ?auto_96473 ) ) ( not ( = ?auto_96472 ?auto_96474 ) ) ( not ( = ?auto_96472 ?auto_96475 ) ) ( not ( = ?auto_96473 ?auto_96474 ) ) ( not ( = ?auto_96473 ?auto_96475 ) ) ( not ( = ?auto_96474 ?auto_96475 ) ) ( ON ?auto_96475 ?auto_96476 ) ( not ( = ?auto_96469 ?auto_96476 ) ) ( not ( = ?auto_96470 ?auto_96476 ) ) ( not ( = ?auto_96471 ?auto_96476 ) ) ( not ( = ?auto_96472 ?auto_96476 ) ) ( not ( = ?auto_96473 ?auto_96476 ) ) ( not ( = ?auto_96474 ?auto_96476 ) ) ( not ( = ?auto_96475 ?auto_96476 ) ) ( ON ?auto_96474 ?auto_96475 ) ( ON-TABLE ?auto_96476 ) ( ON ?auto_96473 ?auto_96474 ) ( ON ?auto_96472 ?auto_96473 ) ( CLEAR ?auto_96470 ) ( ON ?auto_96471 ?auto_96472 ) ( CLEAR ?auto_96471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96476 ?auto_96475 ?auto_96474 ?auto_96473 ?auto_96472 )
      ( MAKE-7PILE ?auto_96469 ?auto_96470 ?auto_96471 ?auto_96472 ?auto_96473 ?auto_96474 ?auto_96475 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96477 - BLOCK
      ?auto_96478 - BLOCK
      ?auto_96479 - BLOCK
      ?auto_96480 - BLOCK
      ?auto_96481 - BLOCK
      ?auto_96482 - BLOCK
      ?auto_96483 - BLOCK
    )
    :vars
    (
      ?auto_96484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96477 ) ( not ( = ?auto_96477 ?auto_96478 ) ) ( not ( = ?auto_96477 ?auto_96479 ) ) ( not ( = ?auto_96477 ?auto_96480 ) ) ( not ( = ?auto_96477 ?auto_96481 ) ) ( not ( = ?auto_96477 ?auto_96482 ) ) ( not ( = ?auto_96477 ?auto_96483 ) ) ( not ( = ?auto_96478 ?auto_96479 ) ) ( not ( = ?auto_96478 ?auto_96480 ) ) ( not ( = ?auto_96478 ?auto_96481 ) ) ( not ( = ?auto_96478 ?auto_96482 ) ) ( not ( = ?auto_96478 ?auto_96483 ) ) ( not ( = ?auto_96479 ?auto_96480 ) ) ( not ( = ?auto_96479 ?auto_96481 ) ) ( not ( = ?auto_96479 ?auto_96482 ) ) ( not ( = ?auto_96479 ?auto_96483 ) ) ( not ( = ?auto_96480 ?auto_96481 ) ) ( not ( = ?auto_96480 ?auto_96482 ) ) ( not ( = ?auto_96480 ?auto_96483 ) ) ( not ( = ?auto_96481 ?auto_96482 ) ) ( not ( = ?auto_96481 ?auto_96483 ) ) ( not ( = ?auto_96482 ?auto_96483 ) ) ( ON ?auto_96483 ?auto_96484 ) ( not ( = ?auto_96477 ?auto_96484 ) ) ( not ( = ?auto_96478 ?auto_96484 ) ) ( not ( = ?auto_96479 ?auto_96484 ) ) ( not ( = ?auto_96480 ?auto_96484 ) ) ( not ( = ?auto_96481 ?auto_96484 ) ) ( not ( = ?auto_96482 ?auto_96484 ) ) ( not ( = ?auto_96483 ?auto_96484 ) ) ( ON ?auto_96482 ?auto_96483 ) ( ON-TABLE ?auto_96484 ) ( ON ?auto_96481 ?auto_96482 ) ( ON ?auto_96480 ?auto_96481 ) ( ON ?auto_96479 ?auto_96480 ) ( CLEAR ?auto_96479 ) ( HOLDING ?auto_96478 ) ( CLEAR ?auto_96477 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96477 ?auto_96478 )
      ( MAKE-7PILE ?auto_96477 ?auto_96478 ?auto_96479 ?auto_96480 ?auto_96481 ?auto_96482 ?auto_96483 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96485 - BLOCK
      ?auto_96486 - BLOCK
      ?auto_96487 - BLOCK
      ?auto_96488 - BLOCK
      ?auto_96489 - BLOCK
      ?auto_96490 - BLOCK
      ?auto_96491 - BLOCK
    )
    :vars
    (
      ?auto_96492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96485 ) ( not ( = ?auto_96485 ?auto_96486 ) ) ( not ( = ?auto_96485 ?auto_96487 ) ) ( not ( = ?auto_96485 ?auto_96488 ) ) ( not ( = ?auto_96485 ?auto_96489 ) ) ( not ( = ?auto_96485 ?auto_96490 ) ) ( not ( = ?auto_96485 ?auto_96491 ) ) ( not ( = ?auto_96486 ?auto_96487 ) ) ( not ( = ?auto_96486 ?auto_96488 ) ) ( not ( = ?auto_96486 ?auto_96489 ) ) ( not ( = ?auto_96486 ?auto_96490 ) ) ( not ( = ?auto_96486 ?auto_96491 ) ) ( not ( = ?auto_96487 ?auto_96488 ) ) ( not ( = ?auto_96487 ?auto_96489 ) ) ( not ( = ?auto_96487 ?auto_96490 ) ) ( not ( = ?auto_96487 ?auto_96491 ) ) ( not ( = ?auto_96488 ?auto_96489 ) ) ( not ( = ?auto_96488 ?auto_96490 ) ) ( not ( = ?auto_96488 ?auto_96491 ) ) ( not ( = ?auto_96489 ?auto_96490 ) ) ( not ( = ?auto_96489 ?auto_96491 ) ) ( not ( = ?auto_96490 ?auto_96491 ) ) ( ON ?auto_96491 ?auto_96492 ) ( not ( = ?auto_96485 ?auto_96492 ) ) ( not ( = ?auto_96486 ?auto_96492 ) ) ( not ( = ?auto_96487 ?auto_96492 ) ) ( not ( = ?auto_96488 ?auto_96492 ) ) ( not ( = ?auto_96489 ?auto_96492 ) ) ( not ( = ?auto_96490 ?auto_96492 ) ) ( not ( = ?auto_96491 ?auto_96492 ) ) ( ON ?auto_96490 ?auto_96491 ) ( ON-TABLE ?auto_96492 ) ( ON ?auto_96489 ?auto_96490 ) ( ON ?auto_96488 ?auto_96489 ) ( ON ?auto_96487 ?auto_96488 ) ( CLEAR ?auto_96485 ) ( ON ?auto_96486 ?auto_96487 ) ( CLEAR ?auto_96486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96492 ?auto_96491 ?auto_96490 ?auto_96489 ?auto_96488 ?auto_96487 )
      ( MAKE-7PILE ?auto_96485 ?auto_96486 ?auto_96487 ?auto_96488 ?auto_96489 ?auto_96490 ?auto_96491 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96493 - BLOCK
      ?auto_96494 - BLOCK
      ?auto_96495 - BLOCK
      ?auto_96496 - BLOCK
      ?auto_96497 - BLOCK
      ?auto_96498 - BLOCK
      ?auto_96499 - BLOCK
    )
    :vars
    (
      ?auto_96500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96493 ?auto_96494 ) ) ( not ( = ?auto_96493 ?auto_96495 ) ) ( not ( = ?auto_96493 ?auto_96496 ) ) ( not ( = ?auto_96493 ?auto_96497 ) ) ( not ( = ?auto_96493 ?auto_96498 ) ) ( not ( = ?auto_96493 ?auto_96499 ) ) ( not ( = ?auto_96494 ?auto_96495 ) ) ( not ( = ?auto_96494 ?auto_96496 ) ) ( not ( = ?auto_96494 ?auto_96497 ) ) ( not ( = ?auto_96494 ?auto_96498 ) ) ( not ( = ?auto_96494 ?auto_96499 ) ) ( not ( = ?auto_96495 ?auto_96496 ) ) ( not ( = ?auto_96495 ?auto_96497 ) ) ( not ( = ?auto_96495 ?auto_96498 ) ) ( not ( = ?auto_96495 ?auto_96499 ) ) ( not ( = ?auto_96496 ?auto_96497 ) ) ( not ( = ?auto_96496 ?auto_96498 ) ) ( not ( = ?auto_96496 ?auto_96499 ) ) ( not ( = ?auto_96497 ?auto_96498 ) ) ( not ( = ?auto_96497 ?auto_96499 ) ) ( not ( = ?auto_96498 ?auto_96499 ) ) ( ON ?auto_96499 ?auto_96500 ) ( not ( = ?auto_96493 ?auto_96500 ) ) ( not ( = ?auto_96494 ?auto_96500 ) ) ( not ( = ?auto_96495 ?auto_96500 ) ) ( not ( = ?auto_96496 ?auto_96500 ) ) ( not ( = ?auto_96497 ?auto_96500 ) ) ( not ( = ?auto_96498 ?auto_96500 ) ) ( not ( = ?auto_96499 ?auto_96500 ) ) ( ON ?auto_96498 ?auto_96499 ) ( ON-TABLE ?auto_96500 ) ( ON ?auto_96497 ?auto_96498 ) ( ON ?auto_96496 ?auto_96497 ) ( ON ?auto_96495 ?auto_96496 ) ( ON ?auto_96494 ?auto_96495 ) ( CLEAR ?auto_96494 ) ( HOLDING ?auto_96493 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96493 )
      ( MAKE-7PILE ?auto_96493 ?auto_96494 ?auto_96495 ?auto_96496 ?auto_96497 ?auto_96498 ?auto_96499 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_96501 - BLOCK
      ?auto_96502 - BLOCK
      ?auto_96503 - BLOCK
      ?auto_96504 - BLOCK
      ?auto_96505 - BLOCK
      ?auto_96506 - BLOCK
      ?auto_96507 - BLOCK
    )
    :vars
    (
      ?auto_96508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96501 ?auto_96502 ) ) ( not ( = ?auto_96501 ?auto_96503 ) ) ( not ( = ?auto_96501 ?auto_96504 ) ) ( not ( = ?auto_96501 ?auto_96505 ) ) ( not ( = ?auto_96501 ?auto_96506 ) ) ( not ( = ?auto_96501 ?auto_96507 ) ) ( not ( = ?auto_96502 ?auto_96503 ) ) ( not ( = ?auto_96502 ?auto_96504 ) ) ( not ( = ?auto_96502 ?auto_96505 ) ) ( not ( = ?auto_96502 ?auto_96506 ) ) ( not ( = ?auto_96502 ?auto_96507 ) ) ( not ( = ?auto_96503 ?auto_96504 ) ) ( not ( = ?auto_96503 ?auto_96505 ) ) ( not ( = ?auto_96503 ?auto_96506 ) ) ( not ( = ?auto_96503 ?auto_96507 ) ) ( not ( = ?auto_96504 ?auto_96505 ) ) ( not ( = ?auto_96504 ?auto_96506 ) ) ( not ( = ?auto_96504 ?auto_96507 ) ) ( not ( = ?auto_96505 ?auto_96506 ) ) ( not ( = ?auto_96505 ?auto_96507 ) ) ( not ( = ?auto_96506 ?auto_96507 ) ) ( ON ?auto_96507 ?auto_96508 ) ( not ( = ?auto_96501 ?auto_96508 ) ) ( not ( = ?auto_96502 ?auto_96508 ) ) ( not ( = ?auto_96503 ?auto_96508 ) ) ( not ( = ?auto_96504 ?auto_96508 ) ) ( not ( = ?auto_96505 ?auto_96508 ) ) ( not ( = ?auto_96506 ?auto_96508 ) ) ( not ( = ?auto_96507 ?auto_96508 ) ) ( ON ?auto_96506 ?auto_96507 ) ( ON-TABLE ?auto_96508 ) ( ON ?auto_96505 ?auto_96506 ) ( ON ?auto_96504 ?auto_96505 ) ( ON ?auto_96503 ?auto_96504 ) ( ON ?auto_96502 ?auto_96503 ) ( ON ?auto_96501 ?auto_96502 ) ( CLEAR ?auto_96501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96508 ?auto_96507 ?auto_96506 ?auto_96505 ?auto_96504 ?auto_96503 ?auto_96502 )
      ( MAKE-7PILE ?auto_96501 ?auto_96502 ?auto_96503 ?auto_96504 ?auto_96505 ?auto_96506 ?auto_96507 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96515 - BLOCK
      ?auto_96516 - BLOCK
      ?auto_96517 - BLOCK
      ?auto_96518 - BLOCK
      ?auto_96519 - BLOCK
      ?auto_96520 - BLOCK
    )
    :vars
    (
      ?auto_96521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96521 ?auto_96520 ) ( CLEAR ?auto_96521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96515 ) ( ON ?auto_96516 ?auto_96515 ) ( ON ?auto_96517 ?auto_96516 ) ( ON ?auto_96518 ?auto_96517 ) ( ON ?auto_96519 ?auto_96518 ) ( ON ?auto_96520 ?auto_96519 ) ( not ( = ?auto_96515 ?auto_96516 ) ) ( not ( = ?auto_96515 ?auto_96517 ) ) ( not ( = ?auto_96515 ?auto_96518 ) ) ( not ( = ?auto_96515 ?auto_96519 ) ) ( not ( = ?auto_96515 ?auto_96520 ) ) ( not ( = ?auto_96515 ?auto_96521 ) ) ( not ( = ?auto_96516 ?auto_96517 ) ) ( not ( = ?auto_96516 ?auto_96518 ) ) ( not ( = ?auto_96516 ?auto_96519 ) ) ( not ( = ?auto_96516 ?auto_96520 ) ) ( not ( = ?auto_96516 ?auto_96521 ) ) ( not ( = ?auto_96517 ?auto_96518 ) ) ( not ( = ?auto_96517 ?auto_96519 ) ) ( not ( = ?auto_96517 ?auto_96520 ) ) ( not ( = ?auto_96517 ?auto_96521 ) ) ( not ( = ?auto_96518 ?auto_96519 ) ) ( not ( = ?auto_96518 ?auto_96520 ) ) ( not ( = ?auto_96518 ?auto_96521 ) ) ( not ( = ?auto_96519 ?auto_96520 ) ) ( not ( = ?auto_96519 ?auto_96521 ) ) ( not ( = ?auto_96520 ?auto_96521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96521 ?auto_96520 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96537 - BLOCK
      ?auto_96538 - BLOCK
      ?auto_96539 - BLOCK
      ?auto_96540 - BLOCK
      ?auto_96541 - BLOCK
      ?auto_96542 - BLOCK
    )
    :vars
    (
      ?auto_96543 - BLOCK
      ?auto_96544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96537 ) ( ON ?auto_96538 ?auto_96537 ) ( ON ?auto_96539 ?auto_96538 ) ( ON ?auto_96540 ?auto_96539 ) ( ON ?auto_96541 ?auto_96540 ) ( not ( = ?auto_96537 ?auto_96538 ) ) ( not ( = ?auto_96537 ?auto_96539 ) ) ( not ( = ?auto_96537 ?auto_96540 ) ) ( not ( = ?auto_96537 ?auto_96541 ) ) ( not ( = ?auto_96537 ?auto_96542 ) ) ( not ( = ?auto_96537 ?auto_96543 ) ) ( not ( = ?auto_96538 ?auto_96539 ) ) ( not ( = ?auto_96538 ?auto_96540 ) ) ( not ( = ?auto_96538 ?auto_96541 ) ) ( not ( = ?auto_96538 ?auto_96542 ) ) ( not ( = ?auto_96538 ?auto_96543 ) ) ( not ( = ?auto_96539 ?auto_96540 ) ) ( not ( = ?auto_96539 ?auto_96541 ) ) ( not ( = ?auto_96539 ?auto_96542 ) ) ( not ( = ?auto_96539 ?auto_96543 ) ) ( not ( = ?auto_96540 ?auto_96541 ) ) ( not ( = ?auto_96540 ?auto_96542 ) ) ( not ( = ?auto_96540 ?auto_96543 ) ) ( not ( = ?auto_96541 ?auto_96542 ) ) ( not ( = ?auto_96541 ?auto_96543 ) ) ( not ( = ?auto_96542 ?auto_96543 ) ) ( ON ?auto_96543 ?auto_96544 ) ( CLEAR ?auto_96543 ) ( not ( = ?auto_96537 ?auto_96544 ) ) ( not ( = ?auto_96538 ?auto_96544 ) ) ( not ( = ?auto_96539 ?auto_96544 ) ) ( not ( = ?auto_96540 ?auto_96544 ) ) ( not ( = ?auto_96541 ?auto_96544 ) ) ( not ( = ?auto_96542 ?auto_96544 ) ) ( not ( = ?auto_96543 ?auto_96544 ) ) ( HOLDING ?auto_96542 ) ( CLEAR ?auto_96541 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96537 ?auto_96538 ?auto_96539 ?auto_96540 ?auto_96541 ?auto_96542 ?auto_96543 )
      ( MAKE-6PILE ?auto_96537 ?auto_96538 ?auto_96539 ?auto_96540 ?auto_96541 ?auto_96542 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96545 - BLOCK
      ?auto_96546 - BLOCK
      ?auto_96547 - BLOCK
      ?auto_96548 - BLOCK
      ?auto_96549 - BLOCK
      ?auto_96550 - BLOCK
    )
    :vars
    (
      ?auto_96552 - BLOCK
      ?auto_96551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96545 ) ( ON ?auto_96546 ?auto_96545 ) ( ON ?auto_96547 ?auto_96546 ) ( ON ?auto_96548 ?auto_96547 ) ( ON ?auto_96549 ?auto_96548 ) ( not ( = ?auto_96545 ?auto_96546 ) ) ( not ( = ?auto_96545 ?auto_96547 ) ) ( not ( = ?auto_96545 ?auto_96548 ) ) ( not ( = ?auto_96545 ?auto_96549 ) ) ( not ( = ?auto_96545 ?auto_96550 ) ) ( not ( = ?auto_96545 ?auto_96552 ) ) ( not ( = ?auto_96546 ?auto_96547 ) ) ( not ( = ?auto_96546 ?auto_96548 ) ) ( not ( = ?auto_96546 ?auto_96549 ) ) ( not ( = ?auto_96546 ?auto_96550 ) ) ( not ( = ?auto_96546 ?auto_96552 ) ) ( not ( = ?auto_96547 ?auto_96548 ) ) ( not ( = ?auto_96547 ?auto_96549 ) ) ( not ( = ?auto_96547 ?auto_96550 ) ) ( not ( = ?auto_96547 ?auto_96552 ) ) ( not ( = ?auto_96548 ?auto_96549 ) ) ( not ( = ?auto_96548 ?auto_96550 ) ) ( not ( = ?auto_96548 ?auto_96552 ) ) ( not ( = ?auto_96549 ?auto_96550 ) ) ( not ( = ?auto_96549 ?auto_96552 ) ) ( not ( = ?auto_96550 ?auto_96552 ) ) ( ON ?auto_96552 ?auto_96551 ) ( not ( = ?auto_96545 ?auto_96551 ) ) ( not ( = ?auto_96546 ?auto_96551 ) ) ( not ( = ?auto_96547 ?auto_96551 ) ) ( not ( = ?auto_96548 ?auto_96551 ) ) ( not ( = ?auto_96549 ?auto_96551 ) ) ( not ( = ?auto_96550 ?auto_96551 ) ) ( not ( = ?auto_96552 ?auto_96551 ) ) ( CLEAR ?auto_96549 ) ( ON ?auto_96550 ?auto_96552 ) ( CLEAR ?auto_96550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96551 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96551 ?auto_96552 )
      ( MAKE-6PILE ?auto_96545 ?auto_96546 ?auto_96547 ?auto_96548 ?auto_96549 ?auto_96550 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96553 - BLOCK
      ?auto_96554 - BLOCK
      ?auto_96555 - BLOCK
      ?auto_96556 - BLOCK
      ?auto_96557 - BLOCK
      ?auto_96558 - BLOCK
    )
    :vars
    (
      ?auto_96559 - BLOCK
      ?auto_96560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96553 ) ( ON ?auto_96554 ?auto_96553 ) ( ON ?auto_96555 ?auto_96554 ) ( ON ?auto_96556 ?auto_96555 ) ( not ( = ?auto_96553 ?auto_96554 ) ) ( not ( = ?auto_96553 ?auto_96555 ) ) ( not ( = ?auto_96553 ?auto_96556 ) ) ( not ( = ?auto_96553 ?auto_96557 ) ) ( not ( = ?auto_96553 ?auto_96558 ) ) ( not ( = ?auto_96553 ?auto_96559 ) ) ( not ( = ?auto_96554 ?auto_96555 ) ) ( not ( = ?auto_96554 ?auto_96556 ) ) ( not ( = ?auto_96554 ?auto_96557 ) ) ( not ( = ?auto_96554 ?auto_96558 ) ) ( not ( = ?auto_96554 ?auto_96559 ) ) ( not ( = ?auto_96555 ?auto_96556 ) ) ( not ( = ?auto_96555 ?auto_96557 ) ) ( not ( = ?auto_96555 ?auto_96558 ) ) ( not ( = ?auto_96555 ?auto_96559 ) ) ( not ( = ?auto_96556 ?auto_96557 ) ) ( not ( = ?auto_96556 ?auto_96558 ) ) ( not ( = ?auto_96556 ?auto_96559 ) ) ( not ( = ?auto_96557 ?auto_96558 ) ) ( not ( = ?auto_96557 ?auto_96559 ) ) ( not ( = ?auto_96558 ?auto_96559 ) ) ( ON ?auto_96559 ?auto_96560 ) ( not ( = ?auto_96553 ?auto_96560 ) ) ( not ( = ?auto_96554 ?auto_96560 ) ) ( not ( = ?auto_96555 ?auto_96560 ) ) ( not ( = ?auto_96556 ?auto_96560 ) ) ( not ( = ?auto_96557 ?auto_96560 ) ) ( not ( = ?auto_96558 ?auto_96560 ) ) ( not ( = ?auto_96559 ?auto_96560 ) ) ( ON ?auto_96558 ?auto_96559 ) ( CLEAR ?auto_96558 ) ( ON-TABLE ?auto_96560 ) ( HOLDING ?auto_96557 ) ( CLEAR ?auto_96556 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96553 ?auto_96554 ?auto_96555 ?auto_96556 ?auto_96557 )
      ( MAKE-6PILE ?auto_96553 ?auto_96554 ?auto_96555 ?auto_96556 ?auto_96557 ?auto_96558 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96561 - BLOCK
      ?auto_96562 - BLOCK
      ?auto_96563 - BLOCK
      ?auto_96564 - BLOCK
      ?auto_96565 - BLOCK
      ?auto_96566 - BLOCK
    )
    :vars
    (
      ?auto_96567 - BLOCK
      ?auto_96568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96561 ) ( ON ?auto_96562 ?auto_96561 ) ( ON ?auto_96563 ?auto_96562 ) ( ON ?auto_96564 ?auto_96563 ) ( not ( = ?auto_96561 ?auto_96562 ) ) ( not ( = ?auto_96561 ?auto_96563 ) ) ( not ( = ?auto_96561 ?auto_96564 ) ) ( not ( = ?auto_96561 ?auto_96565 ) ) ( not ( = ?auto_96561 ?auto_96566 ) ) ( not ( = ?auto_96561 ?auto_96567 ) ) ( not ( = ?auto_96562 ?auto_96563 ) ) ( not ( = ?auto_96562 ?auto_96564 ) ) ( not ( = ?auto_96562 ?auto_96565 ) ) ( not ( = ?auto_96562 ?auto_96566 ) ) ( not ( = ?auto_96562 ?auto_96567 ) ) ( not ( = ?auto_96563 ?auto_96564 ) ) ( not ( = ?auto_96563 ?auto_96565 ) ) ( not ( = ?auto_96563 ?auto_96566 ) ) ( not ( = ?auto_96563 ?auto_96567 ) ) ( not ( = ?auto_96564 ?auto_96565 ) ) ( not ( = ?auto_96564 ?auto_96566 ) ) ( not ( = ?auto_96564 ?auto_96567 ) ) ( not ( = ?auto_96565 ?auto_96566 ) ) ( not ( = ?auto_96565 ?auto_96567 ) ) ( not ( = ?auto_96566 ?auto_96567 ) ) ( ON ?auto_96567 ?auto_96568 ) ( not ( = ?auto_96561 ?auto_96568 ) ) ( not ( = ?auto_96562 ?auto_96568 ) ) ( not ( = ?auto_96563 ?auto_96568 ) ) ( not ( = ?auto_96564 ?auto_96568 ) ) ( not ( = ?auto_96565 ?auto_96568 ) ) ( not ( = ?auto_96566 ?auto_96568 ) ) ( not ( = ?auto_96567 ?auto_96568 ) ) ( ON ?auto_96566 ?auto_96567 ) ( ON-TABLE ?auto_96568 ) ( CLEAR ?auto_96564 ) ( ON ?auto_96565 ?auto_96566 ) ( CLEAR ?auto_96565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96568 ?auto_96567 ?auto_96566 )
      ( MAKE-6PILE ?auto_96561 ?auto_96562 ?auto_96563 ?auto_96564 ?auto_96565 ?auto_96566 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96569 - BLOCK
      ?auto_96570 - BLOCK
      ?auto_96571 - BLOCK
      ?auto_96572 - BLOCK
      ?auto_96573 - BLOCK
      ?auto_96574 - BLOCK
    )
    :vars
    (
      ?auto_96576 - BLOCK
      ?auto_96575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96569 ) ( ON ?auto_96570 ?auto_96569 ) ( ON ?auto_96571 ?auto_96570 ) ( not ( = ?auto_96569 ?auto_96570 ) ) ( not ( = ?auto_96569 ?auto_96571 ) ) ( not ( = ?auto_96569 ?auto_96572 ) ) ( not ( = ?auto_96569 ?auto_96573 ) ) ( not ( = ?auto_96569 ?auto_96574 ) ) ( not ( = ?auto_96569 ?auto_96576 ) ) ( not ( = ?auto_96570 ?auto_96571 ) ) ( not ( = ?auto_96570 ?auto_96572 ) ) ( not ( = ?auto_96570 ?auto_96573 ) ) ( not ( = ?auto_96570 ?auto_96574 ) ) ( not ( = ?auto_96570 ?auto_96576 ) ) ( not ( = ?auto_96571 ?auto_96572 ) ) ( not ( = ?auto_96571 ?auto_96573 ) ) ( not ( = ?auto_96571 ?auto_96574 ) ) ( not ( = ?auto_96571 ?auto_96576 ) ) ( not ( = ?auto_96572 ?auto_96573 ) ) ( not ( = ?auto_96572 ?auto_96574 ) ) ( not ( = ?auto_96572 ?auto_96576 ) ) ( not ( = ?auto_96573 ?auto_96574 ) ) ( not ( = ?auto_96573 ?auto_96576 ) ) ( not ( = ?auto_96574 ?auto_96576 ) ) ( ON ?auto_96576 ?auto_96575 ) ( not ( = ?auto_96569 ?auto_96575 ) ) ( not ( = ?auto_96570 ?auto_96575 ) ) ( not ( = ?auto_96571 ?auto_96575 ) ) ( not ( = ?auto_96572 ?auto_96575 ) ) ( not ( = ?auto_96573 ?auto_96575 ) ) ( not ( = ?auto_96574 ?auto_96575 ) ) ( not ( = ?auto_96576 ?auto_96575 ) ) ( ON ?auto_96574 ?auto_96576 ) ( ON-TABLE ?auto_96575 ) ( ON ?auto_96573 ?auto_96574 ) ( CLEAR ?auto_96573 ) ( HOLDING ?auto_96572 ) ( CLEAR ?auto_96571 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96569 ?auto_96570 ?auto_96571 ?auto_96572 )
      ( MAKE-6PILE ?auto_96569 ?auto_96570 ?auto_96571 ?auto_96572 ?auto_96573 ?auto_96574 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96577 - BLOCK
      ?auto_96578 - BLOCK
      ?auto_96579 - BLOCK
      ?auto_96580 - BLOCK
      ?auto_96581 - BLOCK
      ?auto_96582 - BLOCK
    )
    :vars
    (
      ?auto_96584 - BLOCK
      ?auto_96583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96577 ) ( ON ?auto_96578 ?auto_96577 ) ( ON ?auto_96579 ?auto_96578 ) ( not ( = ?auto_96577 ?auto_96578 ) ) ( not ( = ?auto_96577 ?auto_96579 ) ) ( not ( = ?auto_96577 ?auto_96580 ) ) ( not ( = ?auto_96577 ?auto_96581 ) ) ( not ( = ?auto_96577 ?auto_96582 ) ) ( not ( = ?auto_96577 ?auto_96584 ) ) ( not ( = ?auto_96578 ?auto_96579 ) ) ( not ( = ?auto_96578 ?auto_96580 ) ) ( not ( = ?auto_96578 ?auto_96581 ) ) ( not ( = ?auto_96578 ?auto_96582 ) ) ( not ( = ?auto_96578 ?auto_96584 ) ) ( not ( = ?auto_96579 ?auto_96580 ) ) ( not ( = ?auto_96579 ?auto_96581 ) ) ( not ( = ?auto_96579 ?auto_96582 ) ) ( not ( = ?auto_96579 ?auto_96584 ) ) ( not ( = ?auto_96580 ?auto_96581 ) ) ( not ( = ?auto_96580 ?auto_96582 ) ) ( not ( = ?auto_96580 ?auto_96584 ) ) ( not ( = ?auto_96581 ?auto_96582 ) ) ( not ( = ?auto_96581 ?auto_96584 ) ) ( not ( = ?auto_96582 ?auto_96584 ) ) ( ON ?auto_96584 ?auto_96583 ) ( not ( = ?auto_96577 ?auto_96583 ) ) ( not ( = ?auto_96578 ?auto_96583 ) ) ( not ( = ?auto_96579 ?auto_96583 ) ) ( not ( = ?auto_96580 ?auto_96583 ) ) ( not ( = ?auto_96581 ?auto_96583 ) ) ( not ( = ?auto_96582 ?auto_96583 ) ) ( not ( = ?auto_96584 ?auto_96583 ) ) ( ON ?auto_96582 ?auto_96584 ) ( ON-TABLE ?auto_96583 ) ( ON ?auto_96581 ?auto_96582 ) ( CLEAR ?auto_96579 ) ( ON ?auto_96580 ?auto_96581 ) ( CLEAR ?auto_96580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96583 ?auto_96584 ?auto_96582 ?auto_96581 )
      ( MAKE-6PILE ?auto_96577 ?auto_96578 ?auto_96579 ?auto_96580 ?auto_96581 ?auto_96582 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96585 - BLOCK
      ?auto_96586 - BLOCK
      ?auto_96587 - BLOCK
      ?auto_96588 - BLOCK
      ?auto_96589 - BLOCK
      ?auto_96590 - BLOCK
    )
    :vars
    (
      ?auto_96592 - BLOCK
      ?auto_96591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96585 ) ( ON ?auto_96586 ?auto_96585 ) ( not ( = ?auto_96585 ?auto_96586 ) ) ( not ( = ?auto_96585 ?auto_96587 ) ) ( not ( = ?auto_96585 ?auto_96588 ) ) ( not ( = ?auto_96585 ?auto_96589 ) ) ( not ( = ?auto_96585 ?auto_96590 ) ) ( not ( = ?auto_96585 ?auto_96592 ) ) ( not ( = ?auto_96586 ?auto_96587 ) ) ( not ( = ?auto_96586 ?auto_96588 ) ) ( not ( = ?auto_96586 ?auto_96589 ) ) ( not ( = ?auto_96586 ?auto_96590 ) ) ( not ( = ?auto_96586 ?auto_96592 ) ) ( not ( = ?auto_96587 ?auto_96588 ) ) ( not ( = ?auto_96587 ?auto_96589 ) ) ( not ( = ?auto_96587 ?auto_96590 ) ) ( not ( = ?auto_96587 ?auto_96592 ) ) ( not ( = ?auto_96588 ?auto_96589 ) ) ( not ( = ?auto_96588 ?auto_96590 ) ) ( not ( = ?auto_96588 ?auto_96592 ) ) ( not ( = ?auto_96589 ?auto_96590 ) ) ( not ( = ?auto_96589 ?auto_96592 ) ) ( not ( = ?auto_96590 ?auto_96592 ) ) ( ON ?auto_96592 ?auto_96591 ) ( not ( = ?auto_96585 ?auto_96591 ) ) ( not ( = ?auto_96586 ?auto_96591 ) ) ( not ( = ?auto_96587 ?auto_96591 ) ) ( not ( = ?auto_96588 ?auto_96591 ) ) ( not ( = ?auto_96589 ?auto_96591 ) ) ( not ( = ?auto_96590 ?auto_96591 ) ) ( not ( = ?auto_96592 ?auto_96591 ) ) ( ON ?auto_96590 ?auto_96592 ) ( ON-TABLE ?auto_96591 ) ( ON ?auto_96589 ?auto_96590 ) ( ON ?auto_96588 ?auto_96589 ) ( CLEAR ?auto_96588 ) ( HOLDING ?auto_96587 ) ( CLEAR ?auto_96586 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96585 ?auto_96586 ?auto_96587 )
      ( MAKE-6PILE ?auto_96585 ?auto_96586 ?auto_96587 ?auto_96588 ?auto_96589 ?auto_96590 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96593 - BLOCK
      ?auto_96594 - BLOCK
      ?auto_96595 - BLOCK
      ?auto_96596 - BLOCK
      ?auto_96597 - BLOCK
      ?auto_96598 - BLOCK
    )
    :vars
    (
      ?auto_96599 - BLOCK
      ?auto_96600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96593 ) ( ON ?auto_96594 ?auto_96593 ) ( not ( = ?auto_96593 ?auto_96594 ) ) ( not ( = ?auto_96593 ?auto_96595 ) ) ( not ( = ?auto_96593 ?auto_96596 ) ) ( not ( = ?auto_96593 ?auto_96597 ) ) ( not ( = ?auto_96593 ?auto_96598 ) ) ( not ( = ?auto_96593 ?auto_96599 ) ) ( not ( = ?auto_96594 ?auto_96595 ) ) ( not ( = ?auto_96594 ?auto_96596 ) ) ( not ( = ?auto_96594 ?auto_96597 ) ) ( not ( = ?auto_96594 ?auto_96598 ) ) ( not ( = ?auto_96594 ?auto_96599 ) ) ( not ( = ?auto_96595 ?auto_96596 ) ) ( not ( = ?auto_96595 ?auto_96597 ) ) ( not ( = ?auto_96595 ?auto_96598 ) ) ( not ( = ?auto_96595 ?auto_96599 ) ) ( not ( = ?auto_96596 ?auto_96597 ) ) ( not ( = ?auto_96596 ?auto_96598 ) ) ( not ( = ?auto_96596 ?auto_96599 ) ) ( not ( = ?auto_96597 ?auto_96598 ) ) ( not ( = ?auto_96597 ?auto_96599 ) ) ( not ( = ?auto_96598 ?auto_96599 ) ) ( ON ?auto_96599 ?auto_96600 ) ( not ( = ?auto_96593 ?auto_96600 ) ) ( not ( = ?auto_96594 ?auto_96600 ) ) ( not ( = ?auto_96595 ?auto_96600 ) ) ( not ( = ?auto_96596 ?auto_96600 ) ) ( not ( = ?auto_96597 ?auto_96600 ) ) ( not ( = ?auto_96598 ?auto_96600 ) ) ( not ( = ?auto_96599 ?auto_96600 ) ) ( ON ?auto_96598 ?auto_96599 ) ( ON-TABLE ?auto_96600 ) ( ON ?auto_96597 ?auto_96598 ) ( ON ?auto_96596 ?auto_96597 ) ( CLEAR ?auto_96594 ) ( ON ?auto_96595 ?auto_96596 ) ( CLEAR ?auto_96595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96600 ?auto_96599 ?auto_96598 ?auto_96597 ?auto_96596 )
      ( MAKE-6PILE ?auto_96593 ?auto_96594 ?auto_96595 ?auto_96596 ?auto_96597 ?auto_96598 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96601 - BLOCK
      ?auto_96602 - BLOCK
      ?auto_96603 - BLOCK
      ?auto_96604 - BLOCK
      ?auto_96605 - BLOCK
      ?auto_96606 - BLOCK
    )
    :vars
    (
      ?auto_96608 - BLOCK
      ?auto_96607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96601 ) ( not ( = ?auto_96601 ?auto_96602 ) ) ( not ( = ?auto_96601 ?auto_96603 ) ) ( not ( = ?auto_96601 ?auto_96604 ) ) ( not ( = ?auto_96601 ?auto_96605 ) ) ( not ( = ?auto_96601 ?auto_96606 ) ) ( not ( = ?auto_96601 ?auto_96608 ) ) ( not ( = ?auto_96602 ?auto_96603 ) ) ( not ( = ?auto_96602 ?auto_96604 ) ) ( not ( = ?auto_96602 ?auto_96605 ) ) ( not ( = ?auto_96602 ?auto_96606 ) ) ( not ( = ?auto_96602 ?auto_96608 ) ) ( not ( = ?auto_96603 ?auto_96604 ) ) ( not ( = ?auto_96603 ?auto_96605 ) ) ( not ( = ?auto_96603 ?auto_96606 ) ) ( not ( = ?auto_96603 ?auto_96608 ) ) ( not ( = ?auto_96604 ?auto_96605 ) ) ( not ( = ?auto_96604 ?auto_96606 ) ) ( not ( = ?auto_96604 ?auto_96608 ) ) ( not ( = ?auto_96605 ?auto_96606 ) ) ( not ( = ?auto_96605 ?auto_96608 ) ) ( not ( = ?auto_96606 ?auto_96608 ) ) ( ON ?auto_96608 ?auto_96607 ) ( not ( = ?auto_96601 ?auto_96607 ) ) ( not ( = ?auto_96602 ?auto_96607 ) ) ( not ( = ?auto_96603 ?auto_96607 ) ) ( not ( = ?auto_96604 ?auto_96607 ) ) ( not ( = ?auto_96605 ?auto_96607 ) ) ( not ( = ?auto_96606 ?auto_96607 ) ) ( not ( = ?auto_96608 ?auto_96607 ) ) ( ON ?auto_96606 ?auto_96608 ) ( ON-TABLE ?auto_96607 ) ( ON ?auto_96605 ?auto_96606 ) ( ON ?auto_96604 ?auto_96605 ) ( ON ?auto_96603 ?auto_96604 ) ( CLEAR ?auto_96603 ) ( HOLDING ?auto_96602 ) ( CLEAR ?auto_96601 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96601 ?auto_96602 )
      ( MAKE-6PILE ?auto_96601 ?auto_96602 ?auto_96603 ?auto_96604 ?auto_96605 ?auto_96606 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96609 - BLOCK
      ?auto_96610 - BLOCK
      ?auto_96611 - BLOCK
      ?auto_96612 - BLOCK
      ?auto_96613 - BLOCK
      ?auto_96614 - BLOCK
    )
    :vars
    (
      ?auto_96616 - BLOCK
      ?auto_96615 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96609 ) ( not ( = ?auto_96609 ?auto_96610 ) ) ( not ( = ?auto_96609 ?auto_96611 ) ) ( not ( = ?auto_96609 ?auto_96612 ) ) ( not ( = ?auto_96609 ?auto_96613 ) ) ( not ( = ?auto_96609 ?auto_96614 ) ) ( not ( = ?auto_96609 ?auto_96616 ) ) ( not ( = ?auto_96610 ?auto_96611 ) ) ( not ( = ?auto_96610 ?auto_96612 ) ) ( not ( = ?auto_96610 ?auto_96613 ) ) ( not ( = ?auto_96610 ?auto_96614 ) ) ( not ( = ?auto_96610 ?auto_96616 ) ) ( not ( = ?auto_96611 ?auto_96612 ) ) ( not ( = ?auto_96611 ?auto_96613 ) ) ( not ( = ?auto_96611 ?auto_96614 ) ) ( not ( = ?auto_96611 ?auto_96616 ) ) ( not ( = ?auto_96612 ?auto_96613 ) ) ( not ( = ?auto_96612 ?auto_96614 ) ) ( not ( = ?auto_96612 ?auto_96616 ) ) ( not ( = ?auto_96613 ?auto_96614 ) ) ( not ( = ?auto_96613 ?auto_96616 ) ) ( not ( = ?auto_96614 ?auto_96616 ) ) ( ON ?auto_96616 ?auto_96615 ) ( not ( = ?auto_96609 ?auto_96615 ) ) ( not ( = ?auto_96610 ?auto_96615 ) ) ( not ( = ?auto_96611 ?auto_96615 ) ) ( not ( = ?auto_96612 ?auto_96615 ) ) ( not ( = ?auto_96613 ?auto_96615 ) ) ( not ( = ?auto_96614 ?auto_96615 ) ) ( not ( = ?auto_96616 ?auto_96615 ) ) ( ON ?auto_96614 ?auto_96616 ) ( ON-TABLE ?auto_96615 ) ( ON ?auto_96613 ?auto_96614 ) ( ON ?auto_96612 ?auto_96613 ) ( ON ?auto_96611 ?auto_96612 ) ( CLEAR ?auto_96609 ) ( ON ?auto_96610 ?auto_96611 ) ( CLEAR ?auto_96610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96615 ?auto_96616 ?auto_96614 ?auto_96613 ?auto_96612 ?auto_96611 )
      ( MAKE-6PILE ?auto_96609 ?auto_96610 ?auto_96611 ?auto_96612 ?auto_96613 ?auto_96614 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96617 - BLOCK
      ?auto_96618 - BLOCK
      ?auto_96619 - BLOCK
      ?auto_96620 - BLOCK
      ?auto_96621 - BLOCK
      ?auto_96622 - BLOCK
    )
    :vars
    (
      ?auto_96624 - BLOCK
      ?auto_96623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96617 ?auto_96618 ) ) ( not ( = ?auto_96617 ?auto_96619 ) ) ( not ( = ?auto_96617 ?auto_96620 ) ) ( not ( = ?auto_96617 ?auto_96621 ) ) ( not ( = ?auto_96617 ?auto_96622 ) ) ( not ( = ?auto_96617 ?auto_96624 ) ) ( not ( = ?auto_96618 ?auto_96619 ) ) ( not ( = ?auto_96618 ?auto_96620 ) ) ( not ( = ?auto_96618 ?auto_96621 ) ) ( not ( = ?auto_96618 ?auto_96622 ) ) ( not ( = ?auto_96618 ?auto_96624 ) ) ( not ( = ?auto_96619 ?auto_96620 ) ) ( not ( = ?auto_96619 ?auto_96621 ) ) ( not ( = ?auto_96619 ?auto_96622 ) ) ( not ( = ?auto_96619 ?auto_96624 ) ) ( not ( = ?auto_96620 ?auto_96621 ) ) ( not ( = ?auto_96620 ?auto_96622 ) ) ( not ( = ?auto_96620 ?auto_96624 ) ) ( not ( = ?auto_96621 ?auto_96622 ) ) ( not ( = ?auto_96621 ?auto_96624 ) ) ( not ( = ?auto_96622 ?auto_96624 ) ) ( ON ?auto_96624 ?auto_96623 ) ( not ( = ?auto_96617 ?auto_96623 ) ) ( not ( = ?auto_96618 ?auto_96623 ) ) ( not ( = ?auto_96619 ?auto_96623 ) ) ( not ( = ?auto_96620 ?auto_96623 ) ) ( not ( = ?auto_96621 ?auto_96623 ) ) ( not ( = ?auto_96622 ?auto_96623 ) ) ( not ( = ?auto_96624 ?auto_96623 ) ) ( ON ?auto_96622 ?auto_96624 ) ( ON-TABLE ?auto_96623 ) ( ON ?auto_96621 ?auto_96622 ) ( ON ?auto_96620 ?auto_96621 ) ( ON ?auto_96619 ?auto_96620 ) ( ON ?auto_96618 ?auto_96619 ) ( CLEAR ?auto_96618 ) ( HOLDING ?auto_96617 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96617 )
      ( MAKE-6PILE ?auto_96617 ?auto_96618 ?auto_96619 ?auto_96620 ?auto_96621 ?auto_96622 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96625 - BLOCK
      ?auto_96626 - BLOCK
      ?auto_96627 - BLOCK
      ?auto_96628 - BLOCK
      ?auto_96629 - BLOCK
      ?auto_96630 - BLOCK
    )
    :vars
    (
      ?auto_96632 - BLOCK
      ?auto_96631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96625 ?auto_96626 ) ) ( not ( = ?auto_96625 ?auto_96627 ) ) ( not ( = ?auto_96625 ?auto_96628 ) ) ( not ( = ?auto_96625 ?auto_96629 ) ) ( not ( = ?auto_96625 ?auto_96630 ) ) ( not ( = ?auto_96625 ?auto_96632 ) ) ( not ( = ?auto_96626 ?auto_96627 ) ) ( not ( = ?auto_96626 ?auto_96628 ) ) ( not ( = ?auto_96626 ?auto_96629 ) ) ( not ( = ?auto_96626 ?auto_96630 ) ) ( not ( = ?auto_96626 ?auto_96632 ) ) ( not ( = ?auto_96627 ?auto_96628 ) ) ( not ( = ?auto_96627 ?auto_96629 ) ) ( not ( = ?auto_96627 ?auto_96630 ) ) ( not ( = ?auto_96627 ?auto_96632 ) ) ( not ( = ?auto_96628 ?auto_96629 ) ) ( not ( = ?auto_96628 ?auto_96630 ) ) ( not ( = ?auto_96628 ?auto_96632 ) ) ( not ( = ?auto_96629 ?auto_96630 ) ) ( not ( = ?auto_96629 ?auto_96632 ) ) ( not ( = ?auto_96630 ?auto_96632 ) ) ( ON ?auto_96632 ?auto_96631 ) ( not ( = ?auto_96625 ?auto_96631 ) ) ( not ( = ?auto_96626 ?auto_96631 ) ) ( not ( = ?auto_96627 ?auto_96631 ) ) ( not ( = ?auto_96628 ?auto_96631 ) ) ( not ( = ?auto_96629 ?auto_96631 ) ) ( not ( = ?auto_96630 ?auto_96631 ) ) ( not ( = ?auto_96632 ?auto_96631 ) ) ( ON ?auto_96630 ?auto_96632 ) ( ON-TABLE ?auto_96631 ) ( ON ?auto_96629 ?auto_96630 ) ( ON ?auto_96628 ?auto_96629 ) ( ON ?auto_96627 ?auto_96628 ) ( ON ?auto_96626 ?auto_96627 ) ( ON ?auto_96625 ?auto_96626 ) ( CLEAR ?auto_96625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96631 ?auto_96632 ?auto_96630 ?auto_96629 ?auto_96628 ?auto_96627 ?auto_96626 )
      ( MAKE-6PILE ?auto_96625 ?auto_96626 ?auto_96627 ?auto_96628 ?auto_96629 ?auto_96630 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96634 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_96634 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_96634 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96635 - BLOCK
    )
    :vars
    (
      ?auto_96636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96635 ?auto_96636 ) ( CLEAR ?auto_96635 ) ( HAND-EMPTY ) ( not ( = ?auto_96635 ?auto_96636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96635 ?auto_96636 )
      ( MAKE-1PILE ?auto_96635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96637 - BLOCK
    )
    :vars
    (
      ?auto_96638 - BLOCK
      ?auto_96642 - BLOCK
      ?auto_96640 - BLOCK
      ?auto_96639 - BLOCK
      ?auto_96641 - BLOCK
      ?auto_96643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96637 ?auto_96638 ) ) ( HOLDING ?auto_96637 ) ( CLEAR ?auto_96638 ) ( ON-TABLE ?auto_96642 ) ( ON ?auto_96640 ?auto_96642 ) ( ON ?auto_96639 ?auto_96640 ) ( ON ?auto_96641 ?auto_96639 ) ( ON ?auto_96643 ?auto_96641 ) ( ON ?auto_96638 ?auto_96643 ) ( not ( = ?auto_96642 ?auto_96640 ) ) ( not ( = ?auto_96642 ?auto_96639 ) ) ( not ( = ?auto_96642 ?auto_96641 ) ) ( not ( = ?auto_96642 ?auto_96643 ) ) ( not ( = ?auto_96642 ?auto_96638 ) ) ( not ( = ?auto_96642 ?auto_96637 ) ) ( not ( = ?auto_96640 ?auto_96639 ) ) ( not ( = ?auto_96640 ?auto_96641 ) ) ( not ( = ?auto_96640 ?auto_96643 ) ) ( not ( = ?auto_96640 ?auto_96638 ) ) ( not ( = ?auto_96640 ?auto_96637 ) ) ( not ( = ?auto_96639 ?auto_96641 ) ) ( not ( = ?auto_96639 ?auto_96643 ) ) ( not ( = ?auto_96639 ?auto_96638 ) ) ( not ( = ?auto_96639 ?auto_96637 ) ) ( not ( = ?auto_96641 ?auto_96643 ) ) ( not ( = ?auto_96641 ?auto_96638 ) ) ( not ( = ?auto_96641 ?auto_96637 ) ) ( not ( = ?auto_96643 ?auto_96638 ) ) ( not ( = ?auto_96643 ?auto_96637 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96642 ?auto_96640 ?auto_96639 ?auto_96641 ?auto_96643 ?auto_96638 ?auto_96637 )
      ( MAKE-1PILE ?auto_96637 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96644 - BLOCK
    )
    :vars
    (
      ?auto_96646 - BLOCK
      ?auto_96648 - BLOCK
      ?auto_96647 - BLOCK
      ?auto_96649 - BLOCK
      ?auto_96645 - BLOCK
      ?auto_96650 - BLOCK
      ?auto_96651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96644 ?auto_96646 ) ) ( CLEAR ?auto_96646 ) ( ON-TABLE ?auto_96648 ) ( ON ?auto_96647 ?auto_96648 ) ( ON ?auto_96649 ?auto_96647 ) ( ON ?auto_96645 ?auto_96649 ) ( ON ?auto_96650 ?auto_96645 ) ( ON ?auto_96646 ?auto_96650 ) ( not ( = ?auto_96648 ?auto_96647 ) ) ( not ( = ?auto_96648 ?auto_96649 ) ) ( not ( = ?auto_96648 ?auto_96645 ) ) ( not ( = ?auto_96648 ?auto_96650 ) ) ( not ( = ?auto_96648 ?auto_96646 ) ) ( not ( = ?auto_96648 ?auto_96644 ) ) ( not ( = ?auto_96647 ?auto_96649 ) ) ( not ( = ?auto_96647 ?auto_96645 ) ) ( not ( = ?auto_96647 ?auto_96650 ) ) ( not ( = ?auto_96647 ?auto_96646 ) ) ( not ( = ?auto_96647 ?auto_96644 ) ) ( not ( = ?auto_96649 ?auto_96645 ) ) ( not ( = ?auto_96649 ?auto_96650 ) ) ( not ( = ?auto_96649 ?auto_96646 ) ) ( not ( = ?auto_96649 ?auto_96644 ) ) ( not ( = ?auto_96645 ?auto_96650 ) ) ( not ( = ?auto_96645 ?auto_96646 ) ) ( not ( = ?auto_96645 ?auto_96644 ) ) ( not ( = ?auto_96650 ?auto_96646 ) ) ( not ( = ?auto_96650 ?auto_96644 ) ) ( ON ?auto_96644 ?auto_96651 ) ( CLEAR ?auto_96644 ) ( HAND-EMPTY ) ( not ( = ?auto_96644 ?auto_96651 ) ) ( not ( = ?auto_96646 ?auto_96651 ) ) ( not ( = ?auto_96648 ?auto_96651 ) ) ( not ( = ?auto_96647 ?auto_96651 ) ) ( not ( = ?auto_96649 ?auto_96651 ) ) ( not ( = ?auto_96645 ?auto_96651 ) ) ( not ( = ?auto_96650 ?auto_96651 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96644 ?auto_96651 )
      ( MAKE-1PILE ?auto_96644 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96652 - BLOCK
    )
    :vars
    (
      ?auto_96658 - BLOCK
      ?auto_96659 - BLOCK
      ?auto_96654 - BLOCK
      ?auto_96655 - BLOCK
      ?auto_96656 - BLOCK
      ?auto_96657 - BLOCK
      ?auto_96653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96652 ?auto_96658 ) ) ( ON-TABLE ?auto_96659 ) ( ON ?auto_96654 ?auto_96659 ) ( ON ?auto_96655 ?auto_96654 ) ( ON ?auto_96656 ?auto_96655 ) ( ON ?auto_96657 ?auto_96656 ) ( not ( = ?auto_96659 ?auto_96654 ) ) ( not ( = ?auto_96659 ?auto_96655 ) ) ( not ( = ?auto_96659 ?auto_96656 ) ) ( not ( = ?auto_96659 ?auto_96657 ) ) ( not ( = ?auto_96659 ?auto_96658 ) ) ( not ( = ?auto_96659 ?auto_96652 ) ) ( not ( = ?auto_96654 ?auto_96655 ) ) ( not ( = ?auto_96654 ?auto_96656 ) ) ( not ( = ?auto_96654 ?auto_96657 ) ) ( not ( = ?auto_96654 ?auto_96658 ) ) ( not ( = ?auto_96654 ?auto_96652 ) ) ( not ( = ?auto_96655 ?auto_96656 ) ) ( not ( = ?auto_96655 ?auto_96657 ) ) ( not ( = ?auto_96655 ?auto_96658 ) ) ( not ( = ?auto_96655 ?auto_96652 ) ) ( not ( = ?auto_96656 ?auto_96657 ) ) ( not ( = ?auto_96656 ?auto_96658 ) ) ( not ( = ?auto_96656 ?auto_96652 ) ) ( not ( = ?auto_96657 ?auto_96658 ) ) ( not ( = ?auto_96657 ?auto_96652 ) ) ( ON ?auto_96652 ?auto_96653 ) ( CLEAR ?auto_96652 ) ( not ( = ?auto_96652 ?auto_96653 ) ) ( not ( = ?auto_96658 ?auto_96653 ) ) ( not ( = ?auto_96659 ?auto_96653 ) ) ( not ( = ?auto_96654 ?auto_96653 ) ) ( not ( = ?auto_96655 ?auto_96653 ) ) ( not ( = ?auto_96656 ?auto_96653 ) ) ( not ( = ?auto_96657 ?auto_96653 ) ) ( HOLDING ?auto_96658 ) ( CLEAR ?auto_96657 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96659 ?auto_96654 ?auto_96655 ?auto_96656 ?auto_96657 ?auto_96658 )
      ( MAKE-1PILE ?auto_96652 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96660 - BLOCK
    )
    :vars
    (
      ?auto_96661 - BLOCK
      ?auto_96666 - BLOCK
      ?auto_96662 - BLOCK
      ?auto_96664 - BLOCK
      ?auto_96663 - BLOCK
      ?auto_96667 - BLOCK
      ?auto_96665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96660 ?auto_96661 ) ) ( ON-TABLE ?auto_96666 ) ( ON ?auto_96662 ?auto_96666 ) ( ON ?auto_96664 ?auto_96662 ) ( ON ?auto_96663 ?auto_96664 ) ( ON ?auto_96667 ?auto_96663 ) ( not ( = ?auto_96666 ?auto_96662 ) ) ( not ( = ?auto_96666 ?auto_96664 ) ) ( not ( = ?auto_96666 ?auto_96663 ) ) ( not ( = ?auto_96666 ?auto_96667 ) ) ( not ( = ?auto_96666 ?auto_96661 ) ) ( not ( = ?auto_96666 ?auto_96660 ) ) ( not ( = ?auto_96662 ?auto_96664 ) ) ( not ( = ?auto_96662 ?auto_96663 ) ) ( not ( = ?auto_96662 ?auto_96667 ) ) ( not ( = ?auto_96662 ?auto_96661 ) ) ( not ( = ?auto_96662 ?auto_96660 ) ) ( not ( = ?auto_96664 ?auto_96663 ) ) ( not ( = ?auto_96664 ?auto_96667 ) ) ( not ( = ?auto_96664 ?auto_96661 ) ) ( not ( = ?auto_96664 ?auto_96660 ) ) ( not ( = ?auto_96663 ?auto_96667 ) ) ( not ( = ?auto_96663 ?auto_96661 ) ) ( not ( = ?auto_96663 ?auto_96660 ) ) ( not ( = ?auto_96667 ?auto_96661 ) ) ( not ( = ?auto_96667 ?auto_96660 ) ) ( ON ?auto_96660 ?auto_96665 ) ( not ( = ?auto_96660 ?auto_96665 ) ) ( not ( = ?auto_96661 ?auto_96665 ) ) ( not ( = ?auto_96666 ?auto_96665 ) ) ( not ( = ?auto_96662 ?auto_96665 ) ) ( not ( = ?auto_96664 ?auto_96665 ) ) ( not ( = ?auto_96663 ?auto_96665 ) ) ( not ( = ?auto_96667 ?auto_96665 ) ) ( CLEAR ?auto_96667 ) ( ON ?auto_96661 ?auto_96660 ) ( CLEAR ?auto_96661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96665 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96665 ?auto_96660 )
      ( MAKE-1PILE ?auto_96660 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96668 - BLOCK
    )
    :vars
    (
      ?auto_96669 - BLOCK
      ?auto_96674 - BLOCK
      ?auto_96672 - BLOCK
      ?auto_96671 - BLOCK
      ?auto_96673 - BLOCK
      ?auto_96675 - BLOCK
      ?auto_96670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96668 ?auto_96669 ) ) ( ON-TABLE ?auto_96674 ) ( ON ?auto_96672 ?auto_96674 ) ( ON ?auto_96671 ?auto_96672 ) ( ON ?auto_96673 ?auto_96671 ) ( not ( = ?auto_96674 ?auto_96672 ) ) ( not ( = ?auto_96674 ?auto_96671 ) ) ( not ( = ?auto_96674 ?auto_96673 ) ) ( not ( = ?auto_96674 ?auto_96675 ) ) ( not ( = ?auto_96674 ?auto_96669 ) ) ( not ( = ?auto_96674 ?auto_96668 ) ) ( not ( = ?auto_96672 ?auto_96671 ) ) ( not ( = ?auto_96672 ?auto_96673 ) ) ( not ( = ?auto_96672 ?auto_96675 ) ) ( not ( = ?auto_96672 ?auto_96669 ) ) ( not ( = ?auto_96672 ?auto_96668 ) ) ( not ( = ?auto_96671 ?auto_96673 ) ) ( not ( = ?auto_96671 ?auto_96675 ) ) ( not ( = ?auto_96671 ?auto_96669 ) ) ( not ( = ?auto_96671 ?auto_96668 ) ) ( not ( = ?auto_96673 ?auto_96675 ) ) ( not ( = ?auto_96673 ?auto_96669 ) ) ( not ( = ?auto_96673 ?auto_96668 ) ) ( not ( = ?auto_96675 ?auto_96669 ) ) ( not ( = ?auto_96675 ?auto_96668 ) ) ( ON ?auto_96668 ?auto_96670 ) ( not ( = ?auto_96668 ?auto_96670 ) ) ( not ( = ?auto_96669 ?auto_96670 ) ) ( not ( = ?auto_96674 ?auto_96670 ) ) ( not ( = ?auto_96672 ?auto_96670 ) ) ( not ( = ?auto_96671 ?auto_96670 ) ) ( not ( = ?auto_96673 ?auto_96670 ) ) ( not ( = ?auto_96675 ?auto_96670 ) ) ( ON ?auto_96669 ?auto_96668 ) ( CLEAR ?auto_96669 ) ( ON-TABLE ?auto_96670 ) ( HOLDING ?auto_96675 ) ( CLEAR ?auto_96673 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96674 ?auto_96672 ?auto_96671 ?auto_96673 ?auto_96675 )
      ( MAKE-1PILE ?auto_96668 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96676 - BLOCK
    )
    :vars
    (
      ?auto_96679 - BLOCK
      ?auto_96678 - BLOCK
      ?auto_96677 - BLOCK
      ?auto_96680 - BLOCK
      ?auto_96682 - BLOCK
      ?auto_96681 - BLOCK
      ?auto_96683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96676 ?auto_96679 ) ) ( ON-TABLE ?auto_96678 ) ( ON ?auto_96677 ?auto_96678 ) ( ON ?auto_96680 ?auto_96677 ) ( ON ?auto_96682 ?auto_96680 ) ( not ( = ?auto_96678 ?auto_96677 ) ) ( not ( = ?auto_96678 ?auto_96680 ) ) ( not ( = ?auto_96678 ?auto_96682 ) ) ( not ( = ?auto_96678 ?auto_96681 ) ) ( not ( = ?auto_96678 ?auto_96679 ) ) ( not ( = ?auto_96678 ?auto_96676 ) ) ( not ( = ?auto_96677 ?auto_96680 ) ) ( not ( = ?auto_96677 ?auto_96682 ) ) ( not ( = ?auto_96677 ?auto_96681 ) ) ( not ( = ?auto_96677 ?auto_96679 ) ) ( not ( = ?auto_96677 ?auto_96676 ) ) ( not ( = ?auto_96680 ?auto_96682 ) ) ( not ( = ?auto_96680 ?auto_96681 ) ) ( not ( = ?auto_96680 ?auto_96679 ) ) ( not ( = ?auto_96680 ?auto_96676 ) ) ( not ( = ?auto_96682 ?auto_96681 ) ) ( not ( = ?auto_96682 ?auto_96679 ) ) ( not ( = ?auto_96682 ?auto_96676 ) ) ( not ( = ?auto_96681 ?auto_96679 ) ) ( not ( = ?auto_96681 ?auto_96676 ) ) ( ON ?auto_96676 ?auto_96683 ) ( not ( = ?auto_96676 ?auto_96683 ) ) ( not ( = ?auto_96679 ?auto_96683 ) ) ( not ( = ?auto_96678 ?auto_96683 ) ) ( not ( = ?auto_96677 ?auto_96683 ) ) ( not ( = ?auto_96680 ?auto_96683 ) ) ( not ( = ?auto_96682 ?auto_96683 ) ) ( not ( = ?auto_96681 ?auto_96683 ) ) ( ON ?auto_96679 ?auto_96676 ) ( ON-TABLE ?auto_96683 ) ( CLEAR ?auto_96682 ) ( ON ?auto_96681 ?auto_96679 ) ( CLEAR ?auto_96681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96683 ?auto_96676 ?auto_96679 )
      ( MAKE-1PILE ?auto_96676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96684 - BLOCK
    )
    :vars
    (
      ?auto_96690 - BLOCK
      ?auto_96686 - BLOCK
      ?auto_96685 - BLOCK
      ?auto_96689 - BLOCK
      ?auto_96691 - BLOCK
      ?auto_96687 - BLOCK
      ?auto_96688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96684 ?auto_96690 ) ) ( ON-TABLE ?auto_96686 ) ( ON ?auto_96685 ?auto_96686 ) ( ON ?auto_96689 ?auto_96685 ) ( not ( = ?auto_96686 ?auto_96685 ) ) ( not ( = ?auto_96686 ?auto_96689 ) ) ( not ( = ?auto_96686 ?auto_96691 ) ) ( not ( = ?auto_96686 ?auto_96687 ) ) ( not ( = ?auto_96686 ?auto_96690 ) ) ( not ( = ?auto_96686 ?auto_96684 ) ) ( not ( = ?auto_96685 ?auto_96689 ) ) ( not ( = ?auto_96685 ?auto_96691 ) ) ( not ( = ?auto_96685 ?auto_96687 ) ) ( not ( = ?auto_96685 ?auto_96690 ) ) ( not ( = ?auto_96685 ?auto_96684 ) ) ( not ( = ?auto_96689 ?auto_96691 ) ) ( not ( = ?auto_96689 ?auto_96687 ) ) ( not ( = ?auto_96689 ?auto_96690 ) ) ( not ( = ?auto_96689 ?auto_96684 ) ) ( not ( = ?auto_96691 ?auto_96687 ) ) ( not ( = ?auto_96691 ?auto_96690 ) ) ( not ( = ?auto_96691 ?auto_96684 ) ) ( not ( = ?auto_96687 ?auto_96690 ) ) ( not ( = ?auto_96687 ?auto_96684 ) ) ( ON ?auto_96684 ?auto_96688 ) ( not ( = ?auto_96684 ?auto_96688 ) ) ( not ( = ?auto_96690 ?auto_96688 ) ) ( not ( = ?auto_96686 ?auto_96688 ) ) ( not ( = ?auto_96685 ?auto_96688 ) ) ( not ( = ?auto_96689 ?auto_96688 ) ) ( not ( = ?auto_96691 ?auto_96688 ) ) ( not ( = ?auto_96687 ?auto_96688 ) ) ( ON ?auto_96690 ?auto_96684 ) ( ON-TABLE ?auto_96688 ) ( ON ?auto_96687 ?auto_96690 ) ( CLEAR ?auto_96687 ) ( HOLDING ?auto_96691 ) ( CLEAR ?auto_96689 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96686 ?auto_96685 ?auto_96689 ?auto_96691 )
      ( MAKE-1PILE ?auto_96684 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96692 - BLOCK
    )
    :vars
    (
      ?auto_96693 - BLOCK
      ?auto_96696 - BLOCK
      ?auto_96697 - BLOCK
      ?auto_96699 - BLOCK
      ?auto_96698 - BLOCK
      ?auto_96694 - BLOCK
      ?auto_96695 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96692 ?auto_96693 ) ) ( ON-TABLE ?auto_96696 ) ( ON ?auto_96697 ?auto_96696 ) ( ON ?auto_96699 ?auto_96697 ) ( not ( = ?auto_96696 ?auto_96697 ) ) ( not ( = ?auto_96696 ?auto_96699 ) ) ( not ( = ?auto_96696 ?auto_96698 ) ) ( not ( = ?auto_96696 ?auto_96694 ) ) ( not ( = ?auto_96696 ?auto_96693 ) ) ( not ( = ?auto_96696 ?auto_96692 ) ) ( not ( = ?auto_96697 ?auto_96699 ) ) ( not ( = ?auto_96697 ?auto_96698 ) ) ( not ( = ?auto_96697 ?auto_96694 ) ) ( not ( = ?auto_96697 ?auto_96693 ) ) ( not ( = ?auto_96697 ?auto_96692 ) ) ( not ( = ?auto_96699 ?auto_96698 ) ) ( not ( = ?auto_96699 ?auto_96694 ) ) ( not ( = ?auto_96699 ?auto_96693 ) ) ( not ( = ?auto_96699 ?auto_96692 ) ) ( not ( = ?auto_96698 ?auto_96694 ) ) ( not ( = ?auto_96698 ?auto_96693 ) ) ( not ( = ?auto_96698 ?auto_96692 ) ) ( not ( = ?auto_96694 ?auto_96693 ) ) ( not ( = ?auto_96694 ?auto_96692 ) ) ( ON ?auto_96692 ?auto_96695 ) ( not ( = ?auto_96692 ?auto_96695 ) ) ( not ( = ?auto_96693 ?auto_96695 ) ) ( not ( = ?auto_96696 ?auto_96695 ) ) ( not ( = ?auto_96697 ?auto_96695 ) ) ( not ( = ?auto_96699 ?auto_96695 ) ) ( not ( = ?auto_96698 ?auto_96695 ) ) ( not ( = ?auto_96694 ?auto_96695 ) ) ( ON ?auto_96693 ?auto_96692 ) ( ON-TABLE ?auto_96695 ) ( ON ?auto_96694 ?auto_96693 ) ( CLEAR ?auto_96699 ) ( ON ?auto_96698 ?auto_96694 ) ( CLEAR ?auto_96698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96695 ?auto_96692 ?auto_96693 ?auto_96694 )
      ( MAKE-1PILE ?auto_96692 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96700 - BLOCK
    )
    :vars
    (
      ?auto_96704 - BLOCK
      ?auto_96705 - BLOCK
      ?auto_96701 - BLOCK
      ?auto_96703 - BLOCK
      ?auto_96702 - BLOCK
      ?auto_96707 - BLOCK
      ?auto_96706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96700 ?auto_96704 ) ) ( ON-TABLE ?auto_96705 ) ( ON ?auto_96701 ?auto_96705 ) ( not ( = ?auto_96705 ?auto_96701 ) ) ( not ( = ?auto_96705 ?auto_96703 ) ) ( not ( = ?auto_96705 ?auto_96702 ) ) ( not ( = ?auto_96705 ?auto_96707 ) ) ( not ( = ?auto_96705 ?auto_96704 ) ) ( not ( = ?auto_96705 ?auto_96700 ) ) ( not ( = ?auto_96701 ?auto_96703 ) ) ( not ( = ?auto_96701 ?auto_96702 ) ) ( not ( = ?auto_96701 ?auto_96707 ) ) ( not ( = ?auto_96701 ?auto_96704 ) ) ( not ( = ?auto_96701 ?auto_96700 ) ) ( not ( = ?auto_96703 ?auto_96702 ) ) ( not ( = ?auto_96703 ?auto_96707 ) ) ( not ( = ?auto_96703 ?auto_96704 ) ) ( not ( = ?auto_96703 ?auto_96700 ) ) ( not ( = ?auto_96702 ?auto_96707 ) ) ( not ( = ?auto_96702 ?auto_96704 ) ) ( not ( = ?auto_96702 ?auto_96700 ) ) ( not ( = ?auto_96707 ?auto_96704 ) ) ( not ( = ?auto_96707 ?auto_96700 ) ) ( ON ?auto_96700 ?auto_96706 ) ( not ( = ?auto_96700 ?auto_96706 ) ) ( not ( = ?auto_96704 ?auto_96706 ) ) ( not ( = ?auto_96705 ?auto_96706 ) ) ( not ( = ?auto_96701 ?auto_96706 ) ) ( not ( = ?auto_96703 ?auto_96706 ) ) ( not ( = ?auto_96702 ?auto_96706 ) ) ( not ( = ?auto_96707 ?auto_96706 ) ) ( ON ?auto_96704 ?auto_96700 ) ( ON-TABLE ?auto_96706 ) ( ON ?auto_96707 ?auto_96704 ) ( ON ?auto_96702 ?auto_96707 ) ( CLEAR ?auto_96702 ) ( HOLDING ?auto_96703 ) ( CLEAR ?auto_96701 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96705 ?auto_96701 ?auto_96703 )
      ( MAKE-1PILE ?auto_96700 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96708 - BLOCK
    )
    :vars
    (
      ?auto_96711 - BLOCK
      ?auto_96714 - BLOCK
      ?auto_96712 - BLOCK
      ?auto_96710 - BLOCK
      ?auto_96715 - BLOCK
      ?auto_96713 - BLOCK
      ?auto_96709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96708 ?auto_96711 ) ) ( ON-TABLE ?auto_96714 ) ( ON ?auto_96712 ?auto_96714 ) ( not ( = ?auto_96714 ?auto_96712 ) ) ( not ( = ?auto_96714 ?auto_96710 ) ) ( not ( = ?auto_96714 ?auto_96715 ) ) ( not ( = ?auto_96714 ?auto_96713 ) ) ( not ( = ?auto_96714 ?auto_96711 ) ) ( not ( = ?auto_96714 ?auto_96708 ) ) ( not ( = ?auto_96712 ?auto_96710 ) ) ( not ( = ?auto_96712 ?auto_96715 ) ) ( not ( = ?auto_96712 ?auto_96713 ) ) ( not ( = ?auto_96712 ?auto_96711 ) ) ( not ( = ?auto_96712 ?auto_96708 ) ) ( not ( = ?auto_96710 ?auto_96715 ) ) ( not ( = ?auto_96710 ?auto_96713 ) ) ( not ( = ?auto_96710 ?auto_96711 ) ) ( not ( = ?auto_96710 ?auto_96708 ) ) ( not ( = ?auto_96715 ?auto_96713 ) ) ( not ( = ?auto_96715 ?auto_96711 ) ) ( not ( = ?auto_96715 ?auto_96708 ) ) ( not ( = ?auto_96713 ?auto_96711 ) ) ( not ( = ?auto_96713 ?auto_96708 ) ) ( ON ?auto_96708 ?auto_96709 ) ( not ( = ?auto_96708 ?auto_96709 ) ) ( not ( = ?auto_96711 ?auto_96709 ) ) ( not ( = ?auto_96714 ?auto_96709 ) ) ( not ( = ?auto_96712 ?auto_96709 ) ) ( not ( = ?auto_96710 ?auto_96709 ) ) ( not ( = ?auto_96715 ?auto_96709 ) ) ( not ( = ?auto_96713 ?auto_96709 ) ) ( ON ?auto_96711 ?auto_96708 ) ( ON-TABLE ?auto_96709 ) ( ON ?auto_96713 ?auto_96711 ) ( ON ?auto_96715 ?auto_96713 ) ( CLEAR ?auto_96712 ) ( ON ?auto_96710 ?auto_96715 ) ( CLEAR ?auto_96710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96709 ?auto_96708 ?auto_96711 ?auto_96713 ?auto_96715 )
      ( MAKE-1PILE ?auto_96708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96716 - BLOCK
    )
    :vars
    (
      ?auto_96719 - BLOCK
      ?auto_96718 - BLOCK
      ?auto_96722 - BLOCK
      ?auto_96720 - BLOCK
      ?auto_96721 - BLOCK
      ?auto_96717 - BLOCK
      ?auto_96723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96716 ?auto_96719 ) ) ( ON-TABLE ?auto_96718 ) ( not ( = ?auto_96718 ?auto_96722 ) ) ( not ( = ?auto_96718 ?auto_96720 ) ) ( not ( = ?auto_96718 ?auto_96721 ) ) ( not ( = ?auto_96718 ?auto_96717 ) ) ( not ( = ?auto_96718 ?auto_96719 ) ) ( not ( = ?auto_96718 ?auto_96716 ) ) ( not ( = ?auto_96722 ?auto_96720 ) ) ( not ( = ?auto_96722 ?auto_96721 ) ) ( not ( = ?auto_96722 ?auto_96717 ) ) ( not ( = ?auto_96722 ?auto_96719 ) ) ( not ( = ?auto_96722 ?auto_96716 ) ) ( not ( = ?auto_96720 ?auto_96721 ) ) ( not ( = ?auto_96720 ?auto_96717 ) ) ( not ( = ?auto_96720 ?auto_96719 ) ) ( not ( = ?auto_96720 ?auto_96716 ) ) ( not ( = ?auto_96721 ?auto_96717 ) ) ( not ( = ?auto_96721 ?auto_96719 ) ) ( not ( = ?auto_96721 ?auto_96716 ) ) ( not ( = ?auto_96717 ?auto_96719 ) ) ( not ( = ?auto_96717 ?auto_96716 ) ) ( ON ?auto_96716 ?auto_96723 ) ( not ( = ?auto_96716 ?auto_96723 ) ) ( not ( = ?auto_96719 ?auto_96723 ) ) ( not ( = ?auto_96718 ?auto_96723 ) ) ( not ( = ?auto_96722 ?auto_96723 ) ) ( not ( = ?auto_96720 ?auto_96723 ) ) ( not ( = ?auto_96721 ?auto_96723 ) ) ( not ( = ?auto_96717 ?auto_96723 ) ) ( ON ?auto_96719 ?auto_96716 ) ( ON-TABLE ?auto_96723 ) ( ON ?auto_96717 ?auto_96719 ) ( ON ?auto_96721 ?auto_96717 ) ( ON ?auto_96720 ?auto_96721 ) ( CLEAR ?auto_96720 ) ( HOLDING ?auto_96722 ) ( CLEAR ?auto_96718 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96718 ?auto_96722 )
      ( MAKE-1PILE ?auto_96716 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96724 - BLOCK
    )
    :vars
    (
      ?auto_96729 - BLOCK
      ?auto_96727 - BLOCK
      ?auto_96726 - BLOCK
      ?auto_96728 - BLOCK
      ?auto_96730 - BLOCK
      ?auto_96731 - BLOCK
      ?auto_96725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96724 ?auto_96729 ) ) ( ON-TABLE ?auto_96727 ) ( not ( = ?auto_96727 ?auto_96726 ) ) ( not ( = ?auto_96727 ?auto_96728 ) ) ( not ( = ?auto_96727 ?auto_96730 ) ) ( not ( = ?auto_96727 ?auto_96731 ) ) ( not ( = ?auto_96727 ?auto_96729 ) ) ( not ( = ?auto_96727 ?auto_96724 ) ) ( not ( = ?auto_96726 ?auto_96728 ) ) ( not ( = ?auto_96726 ?auto_96730 ) ) ( not ( = ?auto_96726 ?auto_96731 ) ) ( not ( = ?auto_96726 ?auto_96729 ) ) ( not ( = ?auto_96726 ?auto_96724 ) ) ( not ( = ?auto_96728 ?auto_96730 ) ) ( not ( = ?auto_96728 ?auto_96731 ) ) ( not ( = ?auto_96728 ?auto_96729 ) ) ( not ( = ?auto_96728 ?auto_96724 ) ) ( not ( = ?auto_96730 ?auto_96731 ) ) ( not ( = ?auto_96730 ?auto_96729 ) ) ( not ( = ?auto_96730 ?auto_96724 ) ) ( not ( = ?auto_96731 ?auto_96729 ) ) ( not ( = ?auto_96731 ?auto_96724 ) ) ( ON ?auto_96724 ?auto_96725 ) ( not ( = ?auto_96724 ?auto_96725 ) ) ( not ( = ?auto_96729 ?auto_96725 ) ) ( not ( = ?auto_96727 ?auto_96725 ) ) ( not ( = ?auto_96726 ?auto_96725 ) ) ( not ( = ?auto_96728 ?auto_96725 ) ) ( not ( = ?auto_96730 ?auto_96725 ) ) ( not ( = ?auto_96731 ?auto_96725 ) ) ( ON ?auto_96729 ?auto_96724 ) ( ON-TABLE ?auto_96725 ) ( ON ?auto_96731 ?auto_96729 ) ( ON ?auto_96730 ?auto_96731 ) ( ON ?auto_96728 ?auto_96730 ) ( CLEAR ?auto_96727 ) ( ON ?auto_96726 ?auto_96728 ) ( CLEAR ?auto_96726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96725 ?auto_96724 ?auto_96729 ?auto_96731 ?auto_96730 ?auto_96728 )
      ( MAKE-1PILE ?auto_96724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96732 - BLOCK
    )
    :vars
    (
      ?auto_96734 - BLOCK
      ?auto_96735 - BLOCK
      ?auto_96739 - BLOCK
      ?auto_96736 - BLOCK
      ?auto_96733 - BLOCK
      ?auto_96737 - BLOCK
      ?auto_96738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96732 ?auto_96734 ) ) ( not ( = ?auto_96735 ?auto_96739 ) ) ( not ( = ?auto_96735 ?auto_96736 ) ) ( not ( = ?auto_96735 ?auto_96733 ) ) ( not ( = ?auto_96735 ?auto_96737 ) ) ( not ( = ?auto_96735 ?auto_96734 ) ) ( not ( = ?auto_96735 ?auto_96732 ) ) ( not ( = ?auto_96739 ?auto_96736 ) ) ( not ( = ?auto_96739 ?auto_96733 ) ) ( not ( = ?auto_96739 ?auto_96737 ) ) ( not ( = ?auto_96739 ?auto_96734 ) ) ( not ( = ?auto_96739 ?auto_96732 ) ) ( not ( = ?auto_96736 ?auto_96733 ) ) ( not ( = ?auto_96736 ?auto_96737 ) ) ( not ( = ?auto_96736 ?auto_96734 ) ) ( not ( = ?auto_96736 ?auto_96732 ) ) ( not ( = ?auto_96733 ?auto_96737 ) ) ( not ( = ?auto_96733 ?auto_96734 ) ) ( not ( = ?auto_96733 ?auto_96732 ) ) ( not ( = ?auto_96737 ?auto_96734 ) ) ( not ( = ?auto_96737 ?auto_96732 ) ) ( ON ?auto_96732 ?auto_96738 ) ( not ( = ?auto_96732 ?auto_96738 ) ) ( not ( = ?auto_96734 ?auto_96738 ) ) ( not ( = ?auto_96735 ?auto_96738 ) ) ( not ( = ?auto_96739 ?auto_96738 ) ) ( not ( = ?auto_96736 ?auto_96738 ) ) ( not ( = ?auto_96733 ?auto_96738 ) ) ( not ( = ?auto_96737 ?auto_96738 ) ) ( ON ?auto_96734 ?auto_96732 ) ( ON-TABLE ?auto_96738 ) ( ON ?auto_96737 ?auto_96734 ) ( ON ?auto_96733 ?auto_96737 ) ( ON ?auto_96736 ?auto_96733 ) ( ON ?auto_96739 ?auto_96736 ) ( CLEAR ?auto_96739 ) ( HOLDING ?auto_96735 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96735 )
      ( MAKE-1PILE ?auto_96732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96740 - BLOCK
    )
    :vars
    (
      ?auto_96744 - BLOCK
      ?auto_96742 - BLOCK
      ?auto_96741 - BLOCK
      ?auto_96745 - BLOCK
      ?auto_96746 - BLOCK
      ?auto_96743 - BLOCK
      ?auto_96747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96740 ?auto_96744 ) ) ( not ( = ?auto_96742 ?auto_96741 ) ) ( not ( = ?auto_96742 ?auto_96745 ) ) ( not ( = ?auto_96742 ?auto_96746 ) ) ( not ( = ?auto_96742 ?auto_96743 ) ) ( not ( = ?auto_96742 ?auto_96744 ) ) ( not ( = ?auto_96742 ?auto_96740 ) ) ( not ( = ?auto_96741 ?auto_96745 ) ) ( not ( = ?auto_96741 ?auto_96746 ) ) ( not ( = ?auto_96741 ?auto_96743 ) ) ( not ( = ?auto_96741 ?auto_96744 ) ) ( not ( = ?auto_96741 ?auto_96740 ) ) ( not ( = ?auto_96745 ?auto_96746 ) ) ( not ( = ?auto_96745 ?auto_96743 ) ) ( not ( = ?auto_96745 ?auto_96744 ) ) ( not ( = ?auto_96745 ?auto_96740 ) ) ( not ( = ?auto_96746 ?auto_96743 ) ) ( not ( = ?auto_96746 ?auto_96744 ) ) ( not ( = ?auto_96746 ?auto_96740 ) ) ( not ( = ?auto_96743 ?auto_96744 ) ) ( not ( = ?auto_96743 ?auto_96740 ) ) ( ON ?auto_96740 ?auto_96747 ) ( not ( = ?auto_96740 ?auto_96747 ) ) ( not ( = ?auto_96744 ?auto_96747 ) ) ( not ( = ?auto_96742 ?auto_96747 ) ) ( not ( = ?auto_96741 ?auto_96747 ) ) ( not ( = ?auto_96745 ?auto_96747 ) ) ( not ( = ?auto_96746 ?auto_96747 ) ) ( not ( = ?auto_96743 ?auto_96747 ) ) ( ON ?auto_96744 ?auto_96740 ) ( ON-TABLE ?auto_96747 ) ( ON ?auto_96743 ?auto_96744 ) ( ON ?auto_96746 ?auto_96743 ) ( ON ?auto_96745 ?auto_96746 ) ( ON ?auto_96741 ?auto_96745 ) ( ON ?auto_96742 ?auto_96741 ) ( CLEAR ?auto_96742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96747 ?auto_96740 ?auto_96744 ?auto_96743 ?auto_96746 ?auto_96745 ?auto_96741 )
      ( MAKE-1PILE ?auto_96740 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96753 - BLOCK
      ?auto_96754 - BLOCK
      ?auto_96755 - BLOCK
      ?auto_96756 - BLOCK
      ?auto_96757 - BLOCK
    )
    :vars
    (
      ?auto_96758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96758 ?auto_96757 ) ( CLEAR ?auto_96758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96753 ) ( ON ?auto_96754 ?auto_96753 ) ( ON ?auto_96755 ?auto_96754 ) ( ON ?auto_96756 ?auto_96755 ) ( ON ?auto_96757 ?auto_96756 ) ( not ( = ?auto_96753 ?auto_96754 ) ) ( not ( = ?auto_96753 ?auto_96755 ) ) ( not ( = ?auto_96753 ?auto_96756 ) ) ( not ( = ?auto_96753 ?auto_96757 ) ) ( not ( = ?auto_96753 ?auto_96758 ) ) ( not ( = ?auto_96754 ?auto_96755 ) ) ( not ( = ?auto_96754 ?auto_96756 ) ) ( not ( = ?auto_96754 ?auto_96757 ) ) ( not ( = ?auto_96754 ?auto_96758 ) ) ( not ( = ?auto_96755 ?auto_96756 ) ) ( not ( = ?auto_96755 ?auto_96757 ) ) ( not ( = ?auto_96755 ?auto_96758 ) ) ( not ( = ?auto_96756 ?auto_96757 ) ) ( not ( = ?auto_96756 ?auto_96758 ) ) ( not ( = ?auto_96757 ?auto_96758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96758 ?auto_96757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96759 - BLOCK
      ?auto_96760 - BLOCK
      ?auto_96761 - BLOCK
      ?auto_96762 - BLOCK
      ?auto_96763 - BLOCK
    )
    :vars
    (
      ?auto_96764 - BLOCK
      ?auto_96765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96764 ?auto_96763 ) ( CLEAR ?auto_96764 ) ( ON-TABLE ?auto_96759 ) ( ON ?auto_96760 ?auto_96759 ) ( ON ?auto_96761 ?auto_96760 ) ( ON ?auto_96762 ?auto_96761 ) ( ON ?auto_96763 ?auto_96762 ) ( not ( = ?auto_96759 ?auto_96760 ) ) ( not ( = ?auto_96759 ?auto_96761 ) ) ( not ( = ?auto_96759 ?auto_96762 ) ) ( not ( = ?auto_96759 ?auto_96763 ) ) ( not ( = ?auto_96759 ?auto_96764 ) ) ( not ( = ?auto_96760 ?auto_96761 ) ) ( not ( = ?auto_96760 ?auto_96762 ) ) ( not ( = ?auto_96760 ?auto_96763 ) ) ( not ( = ?auto_96760 ?auto_96764 ) ) ( not ( = ?auto_96761 ?auto_96762 ) ) ( not ( = ?auto_96761 ?auto_96763 ) ) ( not ( = ?auto_96761 ?auto_96764 ) ) ( not ( = ?auto_96762 ?auto_96763 ) ) ( not ( = ?auto_96762 ?auto_96764 ) ) ( not ( = ?auto_96763 ?auto_96764 ) ) ( HOLDING ?auto_96765 ) ( not ( = ?auto_96759 ?auto_96765 ) ) ( not ( = ?auto_96760 ?auto_96765 ) ) ( not ( = ?auto_96761 ?auto_96765 ) ) ( not ( = ?auto_96762 ?auto_96765 ) ) ( not ( = ?auto_96763 ?auto_96765 ) ) ( not ( = ?auto_96764 ?auto_96765 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_96765 )
      ( MAKE-5PILE ?auto_96759 ?auto_96760 ?auto_96761 ?auto_96762 ?auto_96763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96766 - BLOCK
      ?auto_96767 - BLOCK
      ?auto_96768 - BLOCK
      ?auto_96769 - BLOCK
      ?auto_96770 - BLOCK
    )
    :vars
    (
      ?auto_96772 - BLOCK
      ?auto_96771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96772 ?auto_96770 ) ( ON-TABLE ?auto_96766 ) ( ON ?auto_96767 ?auto_96766 ) ( ON ?auto_96768 ?auto_96767 ) ( ON ?auto_96769 ?auto_96768 ) ( ON ?auto_96770 ?auto_96769 ) ( not ( = ?auto_96766 ?auto_96767 ) ) ( not ( = ?auto_96766 ?auto_96768 ) ) ( not ( = ?auto_96766 ?auto_96769 ) ) ( not ( = ?auto_96766 ?auto_96770 ) ) ( not ( = ?auto_96766 ?auto_96772 ) ) ( not ( = ?auto_96767 ?auto_96768 ) ) ( not ( = ?auto_96767 ?auto_96769 ) ) ( not ( = ?auto_96767 ?auto_96770 ) ) ( not ( = ?auto_96767 ?auto_96772 ) ) ( not ( = ?auto_96768 ?auto_96769 ) ) ( not ( = ?auto_96768 ?auto_96770 ) ) ( not ( = ?auto_96768 ?auto_96772 ) ) ( not ( = ?auto_96769 ?auto_96770 ) ) ( not ( = ?auto_96769 ?auto_96772 ) ) ( not ( = ?auto_96770 ?auto_96772 ) ) ( not ( = ?auto_96766 ?auto_96771 ) ) ( not ( = ?auto_96767 ?auto_96771 ) ) ( not ( = ?auto_96768 ?auto_96771 ) ) ( not ( = ?auto_96769 ?auto_96771 ) ) ( not ( = ?auto_96770 ?auto_96771 ) ) ( not ( = ?auto_96772 ?auto_96771 ) ) ( ON ?auto_96771 ?auto_96772 ) ( CLEAR ?auto_96771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96766 ?auto_96767 ?auto_96768 ?auto_96769 ?auto_96770 ?auto_96772 )
      ( MAKE-5PILE ?auto_96766 ?auto_96767 ?auto_96768 ?auto_96769 ?auto_96770 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96773 - BLOCK
      ?auto_96774 - BLOCK
      ?auto_96775 - BLOCK
      ?auto_96776 - BLOCK
      ?auto_96777 - BLOCK
    )
    :vars
    (
      ?auto_96778 - BLOCK
      ?auto_96779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96778 ?auto_96777 ) ( ON-TABLE ?auto_96773 ) ( ON ?auto_96774 ?auto_96773 ) ( ON ?auto_96775 ?auto_96774 ) ( ON ?auto_96776 ?auto_96775 ) ( ON ?auto_96777 ?auto_96776 ) ( not ( = ?auto_96773 ?auto_96774 ) ) ( not ( = ?auto_96773 ?auto_96775 ) ) ( not ( = ?auto_96773 ?auto_96776 ) ) ( not ( = ?auto_96773 ?auto_96777 ) ) ( not ( = ?auto_96773 ?auto_96778 ) ) ( not ( = ?auto_96774 ?auto_96775 ) ) ( not ( = ?auto_96774 ?auto_96776 ) ) ( not ( = ?auto_96774 ?auto_96777 ) ) ( not ( = ?auto_96774 ?auto_96778 ) ) ( not ( = ?auto_96775 ?auto_96776 ) ) ( not ( = ?auto_96775 ?auto_96777 ) ) ( not ( = ?auto_96775 ?auto_96778 ) ) ( not ( = ?auto_96776 ?auto_96777 ) ) ( not ( = ?auto_96776 ?auto_96778 ) ) ( not ( = ?auto_96777 ?auto_96778 ) ) ( not ( = ?auto_96773 ?auto_96779 ) ) ( not ( = ?auto_96774 ?auto_96779 ) ) ( not ( = ?auto_96775 ?auto_96779 ) ) ( not ( = ?auto_96776 ?auto_96779 ) ) ( not ( = ?auto_96777 ?auto_96779 ) ) ( not ( = ?auto_96778 ?auto_96779 ) ) ( HOLDING ?auto_96779 ) ( CLEAR ?auto_96778 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96773 ?auto_96774 ?auto_96775 ?auto_96776 ?auto_96777 ?auto_96778 ?auto_96779 )
      ( MAKE-5PILE ?auto_96773 ?auto_96774 ?auto_96775 ?auto_96776 ?auto_96777 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96780 - BLOCK
      ?auto_96781 - BLOCK
      ?auto_96782 - BLOCK
      ?auto_96783 - BLOCK
      ?auto_96784 - BLOCK
    )
    :vars
    (
      ?auto_96785 - BLOCK
      ?auto_96786 - BLOCK
      ?auto_96787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96785 ?auto_96784 ) ( ON-TABLE ?auto_96780 ) ( ON ?auto_96781 ?auto_96780 ) ( ON ?auto_96782 ?auto_96781 ) ( ON ?auto_96783 ?auto_96782 ) ( ON ?auto_96784 ?auto_96783 ) ( not ( = ?auto_96780 ?auto_96781 ) ) ( not ( = ?auto_96780 ?auto_96782 ) ) ( not ( = ?auto_96780 ?auto_96783 ) ) ( not ( = ?auto_96780 ?auto_96784 ) ) ( not ( = ?auto_96780 ?auto_96785 ) ) ( not ( = ?auto_96781 ?auto_96782 ) ) ( not ( = ?auto_96781 ?auto_96783 ) ) ( not ( = ?auto_96781 ?auto_96784 ) ) ( not ( = ?auto_96781 ?auto_96785 ) ) ( not ( = ?auto_96782 ?auto_96783 ) ) ( not ( = ?auto_96782 ?auto_96784 ) ) ( not ( = ?auto_96782 ?auto_96785 ) ) ( not ( = ?auto_96783 ?auto_96784 ) ) ( not ( = ?auto_96783 ?auto_96785 ) ) ( not ( = ?auto_96784 ?auto_96785 ) ) ( not ( = ?auto_96780 ?auto_96786 ) ) ( not ( = ?auto_96781 ?auto_96786 ) ) ( not ( = ?auto_96782 ?auto_96786 ) ) ( not ( = ?auto_96783 ?auto_96786 ) ) ( not ( = ?auto_96784 ?auto_96786 ) ) ( not ( = ?auto_96785 ?auto_96786 ) ) ( CLEAR ?auto_96785 ) ( ON ?auto_96786 ?auto_96787 ) ( CLEAR ?auto_96786 ) ( HAND-EMPTY ) ( not ( = ?auto_96780 ?auto_96787 ) ) ( not ( = ?auto_96781 ?auto_96787 ) ) ( not ( = ?auto_96782 ?auto_96787 ) ) ( not ( = ?auto_96783 ?auto_96787 ) ) ( not ( = ?auto_96784 ?auto_96787 ) ) ( not ( = ?auto_96785 ?auto_96787 ) ) ( not ( = ?auto_96786 ?auto_96787 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96786 ?auto_96787 )
      ( MAKE-5PILE ?auto_96780 ?auto_96781 ?auto_96782 ?auto_96783 ?auto_96784 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96804 - BLOCK
      ?auto_96805 - BLOCK
      ?auto_96806 - BLOCK
      ?auto_96807 - BLOCK
      ?auto_96808 - BLOCK
    )
    :vars
    (
      ?auto_96810 - BLOCK
      ?auto_96809 - BLOCK
      ?auto_96811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96804 ) ( ON ?auto_96805 ?auto_96804 ) ( ON ?auto_96806 ?auto_96805 ) ( ON ?auto_96807 ?auto_96806 ) ( not ( = ?auto_96804 ?auto_96805 ) ) ( not ( = ?auto_96804 ?auto_96806 ) ) ( not ( = ?auto_96804 ?auto_96807 ) ) ( not ( = ?auto_96804 ?auto_96808 ) ) ( not ( = ?auto_96804 ?auto_96810 ) ) ( not ( = ?auto_96805 ?auto_96806 ) ) ( not ( = ?auto_96805 ?auto_96807 ) ) ( not ( = ?auto_96805 ?auto_96808 ) ) ( not ( = ?auto_96805 ?auto_96810 ) ) ( not ( = ?auto_96806 ?auto_96807 ) ) ( not ( = ?auto_96806 ?auto_96808 ) ) ( not ( = ?auto_96806 ?auto_96810 ) ) ( not ( = ?auto_96807 ?auto_96808 ) ) ( not ( = ?auto_96807 ?auto_96810 ) ) ( not ( = ?auto_96808 ?auto_96810 ) ) ( not ( = ?auto_96804 ?auto_96809 ) ) ( not ( = ?auto_96805 ?auto_96809 ) ) ( not ( = ?auto_96806 ?auto_96809 ) ) ( not ( = ?auto_96807 ?auto_96809 ) ) ( not ( = ?auto_96808 ?auto_96809 ) ) ( not ( = ?auto_96810 ?auto_96809 ) ) ( ON ?auto_96809 ?auto_96811 ) ( not ( = ?auto_96804 ?auto_96811 ) ) ( not ( = ?auto_96805 ?auto_96811 ) ) ( not ( = ?auto_96806 ?auto_96811 ) ) ( not ( = ?auto_96807 ?auto_96811 ) ) ( not ( = ?auto_96808 ?auto_96811 ) ) ( not ( = ?auto_96810 ?auto_96811 ) ) ( not ( = ?auto_96809 ?auto_96811 ) ) ( ON ?auto_96810 ?auto_96809 ) ( CLEAR ?auto_96810 ) ( HOLDING ?auto_96808 ) ( CLEAR ?auto_96807 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96804 ?auto_96805 ?auto_96806 ?auto_96807 ?auto_96808 ?auto_96810 )
      ( MAKE-5PILE ?auto_96804 ?auto_96805 ?auto_96806 ?auto_96807 ?auto_96808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96812 - BLOCK
      ?auto_96813 - BLOCK
      ?auto_96814 - BLOCK
      ?auto_96815 - BLOCK
      ?auto_96816 - BLOCK
    )
    :vars
    (
      ?auto_96819 - BLOCK
      ?auto_96818 - BLOCK
      ?auto_96817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96812 ) ( ON ?auto_96813 ?auto_96812 ) ( ON ?auto_96814 ?auto_96813 ) ( ON ?auto_96815 ?auto_96814 ) ( not ( = ?auto_96812 ?auto_96813 ) ) ( not ( = ?auto_96812 ?auto_96814 ) ) ( not ( = ?auto_96812 ?auto_96815 ) ) ( not ( = ?auto_96812 ?auto_96816 ) ) ( not ( = ?auto_96812 ?auto_96819 ) ) ( not ( = ?auto_96813 ?auto_96814 ) ) ( not ( = ?auto_96813 ?auto_96815 ) ) ( not ( = ?auto_96813 ?auto_96816 ) ) ( not ( = ?auto_96813 ?auto_96819 ) ) ( not ( = ?auto_96814 ?auto_96815 ) ) ( not ( = ?auto_96814 ?auto_96816 ) ) ( not ( = ?auto_96814 ?auto_96819 ) ) ( not ( = ?auto_96815 ?auto_96816 ) ) ( not ( = ?auto_96815 ?auto_96819 ) ) ( not ( = ?auto_96816 ?auto_96819 ) ) ( not ( = ?auto_96812 ?auto_96818 ) ) ( not ( = ?auto_96813 ?auto_96818 ) ) ( not ( = ?auto_96814 ?auto_96818 ) ) ( not ( = ?auto_96815 ?auto_96818 ) ) ( not ( = ?auto_96816 ?auto_96818 ) ) ( not ( = ?auto_96819 ?auto_96818 ) ) ( ON ?auto_96818 ?auto_96817 ) ( not ( = ?auto_96812 ?auto_96817 ) ) ( not ( = ?auto_96813 ?auto_96817 ) ) ( not ( = ?auto_96814 ?auto_96817 ) ) ( not ( = ?auto_96815 ?auto_96817 ) ) ( not ( = ?auto_96816 ?auto_96817 ) ) ( not ( = ?auto_96819 ?auto_96817 ) ) ( not ( = ?auto_96818 ?auto_96817 ) ) ( ON ?auto_96819 ?auto_96818 ) ( CLEAR ?auto_96815 ) ( ON ?auto_96816 ?auto_96819 ) ( CLEAR ?auto_96816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96817 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96817 ?auto_96818 ?auto_96819 )
      ( MAKE-5PILE ?auto_96812 ?auto_96813 ?auto_96814 ?auto_96815 ?auto_96816 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96820 - BLOCK
      ?auto_96821 - BLOCK
      ?auto_96822 - BLOCK
      ?auto_96823 - BLOCK
      ?auto_96824 - BLOCK
    )
    :vars
    (
      ?auto_96827 - BLOCK
      ?auto_96826 - BLOCK
      ?auto_96825 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96820 ) ( ON ?auto_96821 ?auto_96820 ) ( ON ?auto_96822 ?auto_96821 ) ( not ( = ?auto_96820 ?auto_96821 ) ) ( not ( = ?auto_96820 ?auto_96822 ) ) ( not ( = ?auto_96820 ?auto_96823 ) ) ( not ( = ?auto_96820 ?auto_96824 ) ) ( not ( = ?auto_96820 ?auto_96827 ) ) ( not ( = ?auto_96821 ?auto_96822 ) ) ( not ( = ?auto_96821 ?auto_96823 ) ) ( not ( = ?auto_96821 ?auto_96824 ) ) ( not ( = ?auto_96821 ?auto_96827 ) ) ( not ( = ?auto_96822 ?auto_96823 ) ) ( not ( = ?auto_96822 ?auto_96824 ) ) ( not ( = ?auto_96822 ?auto_96827 ) ) ( not ( = ?auto_96823 ?auto_96824 ) ) ( not ( = ?auto_96823 ?auto_96827 ) ) ( not ( = ?auto_96824 ?auto_96827 ) ) ( not ( = ?auto_96820 ?auto_96826 ) ) ( not ( = ?auto_96821 ?auto_96826 ) ) ( not ( = ?auto_96822 ?auto_96826 ) ) ( not ( = ?auto_96823 ?auto_96826 ) ) ( not ( = ?auto_96824 ?auto_96826 ) ) ( not ( = ?auto_96827 ?auto_96826 ) ) ( ON ?auto_96826 ?auto_96825 ) ( not ( = ?auto_96820 ?auto_96825 ) ) ( not ( = ?auto_96821 ?auto_96825 ) ) ( not ( = ?auto_96822 ?auto_96825 ) ) ( not ( = ?auto_96823 ?auto_96825 ) ) ( not ( = ?auto_96824 ?auto_96825 ) ) ( not ( = ?auto_96827 ?auto_96825 ) ) ( not ( = ?auto_96826 ?auto_96825 ) ) ( ON ?auto_96827 ?auto_96826 ) ( ON ?auto_96824 ?auto_96827 ) ( CLEAR ?auto_96824 ) ( ON-TABLE ?auto_96825 ) ( HOLDING ?auto_96823 ) ( CLEAR ?auto_96822 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96820 ?auto_96821 ?auto_96822 ?auto_96823 )
      ( MAKE-5PILE ?auto_96820 ?auto_96821 ?auto_96822 ?auto_96823 ?auto_96824 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96828 - BLOCK
      ?auto_96829 - BLOCK
      ?auto_96830 - BLOCK
      ?auto_96831 - BLOCK
      ?auto_96832 - BLOCK
    )
    :vars
    (
      ?auto_96833 - BLOCK
      ?auto_96835 - BLOCK
      ?auto_96834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96828 ) ( ON ?auto_96829 ?auto_96828 ) ( ON ?auto_96830 ?auto_96829 ) ( not ( = ?auto_96828 ?auto_96829 ) ) ( not ( = ?auto_96828 ?auto_96830 ) ) ( not ( = ?auto_96828 ?auto_96831 ) ) ( not ( = ?auto_96828 ?auto_96832 ) ) ( not ( = ?auto_96828 ?auto_96833 ) ) ( not ( = ?auto_96829 ?auto_96830 ) ) ( not ( = ?auto_96829 ?auto_96831 ) ) ( not ( = ?auto_96829 ?auto_96832 ) ) ( not ( = ?auto_96829 ?auto_96833 ) ) ( not ( = ?auto_96830 ?auto_96831 ) ) ( not ( = ?auto_96830 ?auto_96832 ) ) ( not ( = ?auto_96830 ?auto_96833 ) ) ( not ( = ?auto_96831 ?auto_96832 ) ) ( not ( = ?auto_96831 ?auto_96833 ) ) ( not ( = ?auto_96832 ?auto_96833 ) ) ( not ( = ?auto_96828 ?auto_96835 ) ) ( not ( = ?auto_96829 ?auto_96835 ) ) ( not ( = ?auto_96830 ?auto_96835 ) ) ( not ( = ?auto_96831 ?auto_96835 ) ) ( not ( = ?auto_96832 ?auto_96835 ) ) ( not ( = ?auto_96833 ?auto_96835 ) ) ( ON ?auto_96835 ?auto_96834 ) ( not ( = ?auto_96828 ?auto_96834 ) ) ( not ( = ?auto_96829 ?auto_96834 ) ) ( not ( = ?auto_96830 ?auto_96834 ) ) ( not ( = ?auto_96831 ?auto_96834 ) ) ( not ( = ?auto_96832 ?auto_96834 ) ) ( not ( = ?auto_96833 ?auto_96834 ) ) ( not ( = ?auto_96835 ?auto_96834 ) ) ( ON ?auto_96833 ?auto_96835 ) ( ON ?auto_96832 ?auto_96833 ) ( ON-TABLE ?auto_96834 ) ( CLEAR ?auto_96830 ) ( ON ?auto_96831 ?auto_96832 ) ( CLEAR ?auto_96831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96834 ?auto_96835 ?auto_96833 ?auto_96832 )
      ( MAKE-5PILE ?auto_96828 ?auto_96829 ?auto_96830 ?auto_96831 ?auto_96832 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96836 - BLOCK
      ?auto_96837 - BLOCK
      ?auto_96838 - BLOCK
      ?auto_96839 - BLOCK
      ?auto_96840 - BLOCK
    )
    :vars
    (
      ?auto_96843 - BLOCK
      ?auto_96841 - BLOCK
      ?auto_96842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96836 ) ( ON ?auto_96837 ?auto_96836 ) ( not ( = ?auto_96836 ?auto_96837 ) ) ( not ( = ?auto_96836 ?auto_96838 ) ) ( not ( = ?auto_96836 ?auto_96839 ) ) ( not ( = ?auto_96836 ?auto_96840 ) ) ( not ( = ?auto_96836 ?auto_96843 ) ) ( not ( = ?auto_96837 ?auto_96838 ) ) ( not ( = ?auto_96837 ?auto_96839 ) ) ( not ( = ?auto_96837 ?auto_96840 ) ) ( not ( = ?auto_96837 ?auto_96843 ) ) ( not ( = ?auto_96838 ?auto_96839 ) ) ( not ( = ?auto_96838 ?auto_96840 ) ) ( not ( = ?auto_96838 ?auto_96843 ) ) ( not ( = ?auto_96839 ?auto_96840 ) ) ( not ( = ?auto_96839 ?auto_96843 ) ) ( not ( = ?auto_96840 ?auto_96843 ) ) ( not ( = ?auto_96836 ?auto_96841 ) ) ( not ( = ?auto_96837 ?auto_96841 ) ) ( not ( = ?auto_96838 ?auto_96841 ) ) ( not ( = ?auto_96839 ?auto_96841 ) ) ( not ( = ?auto_96840 ?auto_96841 ) ) ( not ( = ?auto_96843 ?auto_96841 ) ) ( ON ?auto_96841 ?auto_96842 ) ( not ( = ?auto_96836 ?auto_96842 ) ) ( not ( = ?auto_96837 ?auto_96842 ) ) ( not ( = ?auto_96838 ?auto_96842 ) ) ( not ( = ?auto_96839 ?auto_96842 ) ) ( not ( = ?auto_96840 ?auto_96842 ) ) ( not ( = ?auto_96843 ?auto_96842 ) ) ( not ( = ?auto_96841 ?auto_96842 ) ) ( ON ?auto_96843 ?auto_96841 ) ( ON ?auto_96840 ?auto_96843 ) ( ON-TABLE ?auto_96842 ) ( ON ?auto_96839 ?auto_96840 ) ( CLEAR ?auto_96839 ) ( HOLDING ?auto_96838 ) ( CLEAR ?auto_96837 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96836 ?auto_96837 ?auto_96838 )
      ( MAKE-5PILE ?auto_96836 ?auto_96837 ?auto_96838 ?auto_96839 ?auto_96840 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96844 - BLOCK
      ?auto_96845 - BLOCK
      ?auto_96846 - BLOCK
      ?auto_96847 - BLOCK
      ?auto_96848 - BLOCK
    )
    :vars
    (
      ?auto_96850 - BLOCK
      ?auto_96849 - BLOCK
      ?auto_96851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96844 ) ( ON ?auto_96845 ?auto_96844 ) ( not ( = ?auto_96844 ?auto_96845 ) ) ( not ( = ?auto_96844 ?auto_96846 ) ) ( not ( = ?auto_96844 ?auto_96847 ) ) ( not ( = ?auto_96844 ?auto_96848 ) ) ( not ( = ?auto_96844 ?auto_96850 ) ) ( not ( = ?auto_96845 ?auto_96846 ) ) ( not ( = ?auto_96845 ?auto_96847 ) ) ( not ( = ?auto_96845 ?auto_96848 ) ) ( not ( = ?auto_96845 ?auto_96850 ) ) ( not ( = ?auto_96846 ?auto_96847 ) ) ( not ( = ?auto_96846 ?auto_96848 ) ) ( not ( = ?auto_96846 ?auto_96850 ) ) ( not ( = ?auto_96847 ?auto_96848 ) ) ( not ( = ?auto_96847 ?auto_96850 ) ) ( not ( = ?auto_96848 ?auto_96850 ) ) ( not ( = ?auto_96844 ?auto_96849 ) ) ( not ( = ?auto_96845 ?auto_96849 ) ) ( not ( = ?auto_96846 ?auto_96849 ) ) ( not ( = ?auto_96847 ?auto_96849 ) ) ( not ( = ?auto_96848 ?auto_96849 ) ) ( not ( = ?auto_96850 ?auto_96849 ) ) ( ON ?auto_96849 ?auto_96851 ) ( not ( = ?auto_96844 ?auto_96851 ) ) ( not ( = ?auto_96845 ?auto_96851 ) ) ( not ( = ?auto_96846 ?auto_96851 ) ) ( not ( = ?auto_96847 ?auto_96851 ) ) ( not ( = ?auto_96848 ?auto_96851 ) ) ( not ( = ?auto_96850 ?auto_96851 ) ) ( not ( = ?auto_96849 ?auto_96851 ) ) ( ON ?auto_96850 ?auto_96849 ) ( ON ?auto_96848 ?auto_96850 ) ( ON-TABLE ?auto_96851 ) ( ON ?auto_96847 ?auto_96848 ) ( CLEAR ?auto_96845 ) ( ON ?auto_96846 ?auto_96847 ) ( CLEAR ?auto_96846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96851 ?auto_96849 ?auto_96850 ?auto_96848 ?auto_96847 )
      ( MAKE-5PILE ?auto_96844 ?auto_96845 ?auto_96846 ?auto_96847 ?auto_96848 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96852 - BLOCK
      ?auto_96853 - BLOCK
      ?auto_96854 - BLOCK
      ?auto_96855 - BLOCK
      ?auto_96856 - BLOCK
    )
    :vars
    (
      ?auto_96857 - BLOCK
      ?auto_96859 - BLOCK
      ?auto_96858 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96852 ) ( not ( = ?auto_96852 ?auto_96853 ) ) ( not ( = ?auto_96852 ?auto_96854 ) ) ( not ( = ?auto_96852 ?auto_96855 ) ) ( not ( = ?auto_96852 ?auto_96856 ) ) ( not ( = ?auto_96852 ?auto_96857 ) ) ( not ( = ?auto_96853 ?auto_96854 ) ) ( not ( = ?auto_96853 ?auto_96855 ) ) ( not ( = ?auto_96853 ?auto_96856 ) ) ( not ( = ?auto_96853 ?auto_96857 ) ) ( not ( = ?auto_96854 ?auto_96855 ) ) ( not ( = ?auto_96854 ?auto_96856 ) ) ( not ( = ?auto_96854 ?auto_96857 ) ) ( not ( = ?auto_96855 ?auto_96856 ) ) ( not ( = ?auto_96855 ?auto_96857 ) ) ( not ( = ?auto_96856 ?auto_96857 ) ) ( not ( = ?auto_96852 ?auto_96859 ) ) ( not ( = ?auto_96853 ?auto_96859 ) ) ( not ( = ?auto_96854 ?auto_96859 ) ) ( not ( = ?auto_96855 ?auto_96859 ) ) ( not ( = ?auto_96856 ?auto_96859 ) ) ( not ( = ?auto_96857 ?auto_96859 ) ) ( ON ?auto_96859 ?auto_96858 ) ( not ( = ?auto_96852 ?auto_96858 ) ) ( not ( = ?auto_96853 ?auto_96858 ) ) ( not ( = ?auto_96854 ?auto_96858 ) ) ( not ( = ?auto_96855 ?auto_96858 ) ) ( not ( = ?auto_96856 ?auto_96858 ) ) ( not ( = ?auto_96857 ?auto_96858 ) ) ( not ( = ?auto_96859 ?auto_96858 ) ) ( ON ?auto_96857 ?auto_96859 ) ( ON ?auto_96856 ?auto_96857 ) ( ON-TABLE ?auto_96858 ) ( ON ?auto_96855 ?auto_96856 ) ( ON ?auto_96854 ?auto_96855 ) ( CLEAR ?auto_96854 ) ( HOLDING ?auto_96853 ) ( CLEAR ?auto_96852 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96852 ?auto_96853 )
      ( MAKE-5PILE ?auto_96852 ?auto_96853 ?auto_96854 ?auto_96855 ?auto_96856 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96860 - BLOCK
      ?auto_96861 - BLOCK
      ?auto_96862 - BLOCK
      ?auto_96863 - BLOCK
      ?auto_96864 - BLOCK
    )
    :vars
    (
      ?auto_96867 - BLOCK
      ?auto_96866 - BLOCK
      ?auto_96865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96860 ) ( not ( = ?auto_96860 ?auto_96861 ) ) ( not ( = ?auto_96860 ?auto_96862 ) ) ( not ( = ?auto_96860 ?auto_96863 ) ) ( not ( = ?auto_96860 ?auto_96864 ) ) ( not ( = ?auto_96860 ?auto_96867 ) ) ( not ( = ?auto_96861 ?auto_96862 ) ) ( not ( = ?auto_96861 ?auto_96863 ) ) ( not ( = ?auto_96861 ?auto_96864 ) ) ( not ( = ?auto_96861 ?auto_96867 ) ) ( not ( = ?auto_96862 ?auto_96863 ) ) ( not ( = ?auto_96862 ?auto_96864 ) ) ( not ( = ?auto_96862 ?auto_96867 ) ) ( not ( = ?auto_96863 ?auto_96864 ) ) ( not ( = ?auto_96863 ?auto_96867 ) ) ( not ( = ?auto_96864 ?auto_96867 ) ) ( not ( = ?auto_96860 ?auto_96866 ) ) ( not ( = ?auto_96861 ?auto_96866 ) ) ( not ( = ?auto_96862 ?auto_96866 ) ) ( not ( = ?auto_96863 ?auto_96866 ) ) ( not ( = ?auto_96864 ?auto_96866 ) ) ( not ( = ?auto_96867 ?auto_96866 ) ) ( ON ?auto_96866 ?auto_96865 ) ( not ( = ?auto_96860 ?auto_96865 ) ) ( not ( = ?auto_96861 ?auto_96865 ) ) ( not ( = ?auto_96862 ?auto_96865 ) ) ( not ( = ?auto_96863 ?auto_96865 ) ) ( not ( = ?auto_96864 ?auto_96865 ) ) ( not ( = ?auto_96867 ?auto_96865 ) ) ( not ( = ?auto_96866 ?auto_96865 ) ) ( ON ?auto_96867 ?auto_96866 ) ( ON ?auto_96864 ?auto_96867 ) ( ON-TABLE ?auto_96865 ) ( ON ?auto_96863 ?auto_96864 ) ( ON ?auto_96862 ?auto_96863 ) ( CLEAR ?auto_96860 ) ( ON ?auto_96861 ?auto_96862 ) ( CLEAR ?auto_96861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96865 ?auto_96866 ?auto_96867 ?auto_96864 ?auto_96863 ?auto_96862 )
      ( MAKE-5PILE ?auto_96860 ?auto_96861 ?auto_96862 ?auto_96863 ?auto_96864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96868 - BLOCK
      ?auto_96869 - BLOCK
      ?auto_96870 - BLOCK
      ?auto_96871 - BLOCK
      ?auto_96872 - BLOCK
    )
    :vars
    (
      ?auto_96873 - BLOCK
      ?auto_96874 - BLOCK
      ?auto_96875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96868 ?auto_96869 ) ) ( not ( = ?auto_96868 ?auto_96870 ) ) ( not ( = ?auto_96868 ?auto_96871 ) ) ( not ( = ?auto_96868 ?auto_96872 ) ) ( not ( = ?auto_96868 ?auto_96873 ) ) ( not ( = ?auto_96869 ?auto_96870 ) ) ( not ( = ?auto_96869 ?auto_96871 ) ) ( not ( = ?auto_96869 ?auto_96872 ) ) ( not ( = ?auto_96869 ?auto_96873 ) ) ( not ( = ?auto_96870 ?auto_96871 ) ) ( not ( = ?auto_96870 ?auto_96872 ) ) ( not ( = ?auto_96870 ?auto_96873 ) ) ( not ( = ?auto_96871 ?auto_96872 ) ) ( not ( = ?auto_96871 ?auto_96873 ) ) ( not ( = ?auto_96872 ?auto_96873 ) ) ( not ( = ?auto_96868 ?auto_96874 ) ) ( not ( = ?auto_96869 ?auto_96874 ) ) ( not ( = ?auto_96870 ?auto_96874 ) ) ( not ( = ?auto_96871 ?auto_96874 ) ) ( not ( = ?auto_96872 ?auto_96874 ) ) ( not ( = ?auto_96873 ?auto_96874 ) ) ( ON ?auto_96874 ?auto_96875 ) ( not ( = ?auto_96868 ?auto_96875 ) ) ( not ( = ?auto_96869 ?auto_96875 ) ) ( not ( = ?auto_96870 ?auto_96875 ) ) ( not ( = ?auto_96871 ?auto_96875 ) ) ( not ( = ?auto_96872 ?auto_96875 ) ) ( not ( = ?auto_96873 ?auto_96875 ) ) ( not ( = ?auto_96874 ?auto_96875 ) ) ( ON ?auto_96873 ?auto_96874 ) ( ON ?auto_96872 ?auto_96873 ) ( ON-TABLE ?auto_96875 ) ( ON ?auto_96871 ?auto_96872 ) ( ON ?auto_96870 ?auto_96871 ) ( ON ?auto_96869 ?auto_96870 ) ( CLEAR ?auto_96869 ) ( HOLDING ?auto_96868 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96868 )
      ( MAKE-5PILE ?auto_96868 ?auto_96869 ?auto_96870 ?auto_96871 ?auto_96872 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96876 - BLOCK
      ?auto_96877 - BLOCK
      ?auto_96878 - BLOCK
      ?auto_96879 - BLOCK
      ?auto_96880 - BLOCK
    )
    :vars
    (
      ?auto_96881 - BLOCK
      ?auto_96882 - BLOCK
      ?auto_96883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96876 ?auto_96877 ) ) ( not ( = ?auto_96876 ?auto_96878 ) ) ( not ( = ?auto_96876 ?auto_96879 ) ) ( not ( = ?auto_96876 ?auto_96880 ) ) ( not ( = ?auto_96876 ?auto_96881 ) ) ( not ( = ?auto_96877 ?auto_96878 ) ) ( not ( = ?auto_96877 ?auto_96879 ) ) ( not ( = ?auto_96877 ?auto_96880 ) ) ( not ( = ?auto_96877 ?auto_96881 ) ) ( not ( = ?auto_96878 ?auto_96879 ) ) ( not ( = ?auto_96878 ?auto_96880 ) ) ( not ( = ?auto_96878 ?auto_96881 ) ) ( not ( = ?auto_96879 ?auto_96880 ) ) ( not ( = ?auto_96879 ?auto_96881 ) ) ( not ( = ?auto_96880 ?auto_96881 ) ) ( not ( = ?auto_96876 ?auto_96882 ) ) ( not ( = ?auto_96877 ?auto_96882 ) ) ( not ( = ?auto_96878 ?auto_96882 ) ) ( not ( = ?auto_96879 ?auto_96882 ) ) ( not ( = ?auto_96880 ?auto_96882 ) ) ( not ( = ?auto_96881 ?auto_96882 ) ) ( ON ?auto_96882 ?auto_96883 ) ( not ( = ?auto_96876 ?auto_96883 ) ) ( not ( = ?auto_96877 ?auto_96883 ) ) ( not ( = ?auto_96878 ?auto_96883 ) ) ( not ( = ?auto_96879 ?auto_96883 ) ) ( not ( = ?auto_96880 ?auto_96883 ) ) ( not ( = ?auto_96881 ?auto_96883 ) ) ( not ( = ?auto_96882 ?auto_96883 ) ) ( ON ?auto_96881 ?auto_96882 ) ( ON ?auto_96880 ?auto_96881 ) ( ON-TABLE ?auto_96883 ) ( ON ?auto_96879 ?auto_96880 ) ( ON ?auto_96878 ?auto_96879 ) ( ON ?auto_96877 ?auto_96878 ) ( ON ?auto_96876 ?auto_96877 ) ( CLEAR ?auto_96876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96883 ?auto_96882 ?auto_96881 ?auto_96880 ?auto_96879 ?auto_96878 ?auto_96877 )
      ( MAKE-5PILE ?auto_96876 ?auto_96877 ?auto_96878 ?auto_96879 ?auto_96880 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96886 - BLOCK
      ?auto_96887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_96887 ) ( CLEAR ?auto_96886 ) ( ON-TABLE ?auto_96886 ) ( not ( = ?auto_96886 ?auto_96887 ) ) )
    :subtasks
    ( ( !STACK ?auto_96887 ?auto_96886 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96888 - BLOCK
      ?auto_96889 - BLOCK
    )
    :vars
    (
      ?auto_96890 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96888 ) ( ON-TABLE ?auto_96888 ) ( not ( = ?auto_96888 ?auto_96889 ) ) ( ON ?auto_96889 ?auto_96890 ) ( CLEAR ?auto_96889 ) ( HAND-EMPTY ) ( not ( = ?auto_96888 ?auto_96890 ) ) ( not ( = ?auto_96889 ?auto_96890 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96889 ?auto_96890 )
      ( MAKE-2PILE ?auto_96888 ?auto_96889 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96891 - BLOCK
      ?auto_96892 - BLOCK
    )
    :vars
    (
      ?auto_96893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96891 ?auto_96892 ) ) ( ON ?auto_96892 ?auto_96893 ) ( CLEAR ?auto_96892 ) ( not ( = ?auto_96891 ?auto_96893 ) ) ( not ( = ?auto_96892 ?auto_96893 ) ) ( HOLDING ?auto_96891 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96891 )
      ( MAKE-2PILE ?auto_96891 ?auto_96892 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96894 - BLOCK
      ?auto_96895 - BLOCK
    )
    :vars
    (
      ?auto_96896 - BLOCK
      ?auto_96897 - BLOCK
      ?auto_96900 - BLOCK
      ?auto_96899 - BLOCK
      ?auto_96898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96894 ?auto_96895 ) ) ( ON ?auto_96895 ?auto_96896 ) ( not ( = ?auto_96894 ?auto_96896 ) ) ( not ( = ?auto_96895 ?auto_96896 ) ) ( ON ?auto_96894 ?auto_96895 ) ( CLEAR ?auto_96894 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96897 ) ( ON ?auto_96900 ?auto_96897 ) ( ON ?auto_96899 ?auto_96900 ) ( ON ?auto_96898 ?auto_96899 ) ( ON ?auto_96896 ?auto_96898 ) ( not ( = ?auto_96897 ?auto_96900 ) ) ( not ( = ?auto_96897 ?auto_96899 ) ) ( not ( = ?auto_96897 ?auto_96898 ) ) ( not ( = ?auto_96897 ?auto_96896 ) ) ( not ( = ?auto_96897 ?auto_96895 ) ) ( not ( = ?auto_96897 ?auto_96894 ) ) ( not ( = ?auto_96900 ?auto_96899 ) ) ( not ( = ?auto_96900 ?auto_96898 ) ) ( not ( = ?auto_96900 ?auto_96896 ) ) ( not ( = ?auto_96900 ?auto_96895 ) ) ( not ( = ?auto_96900 ?auto_96894 ) ) ( not ( = ?auto_96899 ?auto_96898 ) ) ( not ( = ?auto_96899 ?auto_96896 ) ) ( not ( = ?auto_96899 ?auto_96895 ) ) ( not ( = ?auto_96899 ?auto_96894 ) ) ( not ( = ?auto_96898 ?auto_96896 ) ) ( not ( = ?auto_96898 ?auto_96895 ) ) ( not ( = ?auto_96898 ?auto_96894 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96897 ?auto_96900 ?auto_96899 ?auto_96898 ?auto_96896 ?auto_96895 )
      ( MAKE-2PILE ?auto_96894 ?auto_96895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96901 - BLOCK
      ?auto_96902 - BLOCK
    )
    :vars
    (
      ?auto_96904 - BLOCK
      ?auto_96907 - BLOCK
      ?auto_96903 - BLOCK
      ?auto_96906 - BLOCK
      ?auto_96905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96901 ?auto_96902 ) ) ( ON ?auto_96902 ?auto_96904 ) ( not ( = ?auto_96901 ?auto_96904 ) ) ( not ( = ?auto_96902 ?auto_96904 ) ) ( ON-TABLE ?auto_96907 ) ( ON ?auto_96903 ?auto_96907 ) ( ON ?auto_96906 ?auto_96903 ) ( ON ?auto_96905 ?auto_96906 ) ( ON ?auto_96904 ?auto_96905 ) ( not ( = ?auto_96907 ?auto_96903 ) ) ( not ( = ?auto_96907 ?auto_96906 ) ) ( not ( = ?auto_96907 ?auto_96905 ) ) ( not ( = ?auto_96907 ?auto_96904 ) ) ( not ( = ?auto_96907 ?auto_96902 ) ) ( not ( = ?auto_96907 ?auto_96901 ) ) ( not ( = ?auto_96903 ?auto_96906 ) ) ( not ( = ?auto_96903 ?auto_96905 ) ) ( not ( = ?auto_96903 ?auto_96904 ) ) ( not ( = ?auto_96903 ?auto_96902 ) ) ( not ( = ?auto_96903 ?auto_96901 ) ) ( not ( = ?auto_96906 ?auto_96905 ) ) ( not ( = ?auto_96906 ?auto_96904 ) ) ( not ( = ?auto_96906 ?auto_96902 ) ) ( not ( = ?auto_96906 ?auto_96901 ) ) ( not ( = ?auto_96905 ?auto_96904 ) ) ( not ( = ?auto_96905 ?auto_96902 ) ) ( not ( = ?auto_96905 ?auto_96901 ) ) ( HOLDING ?auto_96901 ) ( CLEAR ?auto_96902 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96907 ?auto_96903 ?auto_96906 ?auto_96905 ?auto_96904 ?auto_96902 ?auto_96901 )
      ( MAKE-2PILE ?auto_96901 ?auto_96902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96908 - BLOCK
      ?auto_96909 - BLOCK
    )
    :vars
    (
      ?auto_96910 - BLOCK
      ?auto_96911 - BLOCK
      ?auto_96914 - BLOCK
      ?auto_96912 - BLOCK
      ?auto_96913 - BLOCK
      ?auto_96915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96908 ?auto_96909 ) ) ( ON ?auto_96909 ?auto_96910 ) ( not ( = ?auto_96908 ?auto_96910 ) ) ( not ( = ?auto_96909 ?auto_96910 ) ) ( ON-TABLE ?auto_96911 ) ( ON ?auto_96914 ?auto_96911 ) ( ON ?auto_96912 ?auto_96914 ) ( ON ?auto_96913 ?auto_96912 ) ( ON ?auto_96910 ?auto_96913 ) ( not ( = ?auto_96911 ?auto_96914 ) ) ( not ( = ?auto_96911 ?auto_96912 ) ) ( not ( = ?auto_96911 ?auto_96913 ) ) ( not ( = ?auto_96911 ?auto_96910 ) ) ( not ( = ?auto_96911 ?auto_96909 ) ) ( not ( = ?auto_96911 ?auto_96908 ) ) ( not ( = ?auto_96914 ?auto_96912 ) ) ( not ( = ?auto_96914 ?auto_96913 ) ) ( not ( = ?auto_96914 ?auto_96910 ) ) ( not ( = ?auto_96914 ?auto_96909 ) ) ( not ( = ?auto_96914 ?auto_96908 ) ) ( not ( = ?auto_96912 ?auto_96913 ) ) ( not ( = ?auto_96912 ?auto_96910 ) ) ( not ( = ?auto_96912 ?auto_96909 ) ) ( not ( = ?auto_96912 ?auto_96908 ) ) ( not ( = ?auto_96913 ?auto_96910 ) ) ( not ( = ?auto_96913 ?auto_96909 ) ) ( not ( = ?auto_96913 ?auto_96908 ) ) ( CLEAR ?auto_96909 ) ( ON ?auto_96908 ?auto_96915 ) ( CLEAR ?auto_96908 ) ( HAND-EMPTY ) ( not ( = ?auto_96908 ?auto_96915 ) ) ( not ( = ?auto_96909 ?auto_96915 ) ) ( not ( = ?auto_96910 ?auto_96915 ) ) ( not ( = ?auto_96911 ?auto_96915 ) ) ( not ( = ?auto_96914 ?auto_96915 ) ) ( not ( = ?auto_96912 ?auto_96915 ) ) ( not ( = ?auto_96913 ?auto_96915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96908 ?auto_96915 )
      ( MAKE-2PILE ?auto_96908 ?auto_96909 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96916 - BLOCK
      ?auto_96917 - BLOCK
    )
    :vars
    (
      ?auto_96922 - BLOCK
      ?auto_96923 - BLOCK
      ?auto_96920 - BLOCK
      ?auto_96921 - BLOCK
      ?auto_96918 - BLOCK
      ?auto_96919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96916 ?auto_96917 ) ) ( not ( = ?auto_96916 ?auto_96922 ) ) ( not ( = ?auto_96917 ?auto_96922 ) ) ( ON-TABLE ?auto_96923 ) ( ON ?auto_96920 ?auto_96923 ) ( ON ?auto_96921 ?auto_96920 ) ( ON ?auto_96918 ?auto_96921 ) ( ON ?auto_96922 ?auto_96918 ) ( not ( = ?auto_96923 ?auto_96920 ) ) ( not ( = ?auto_96923 ?auto_96921 ) ) ( not ( = ?auto_96923 ?auto_96918 ) ) ( not ( = ?auto_96923 ?auto_96922 ) ) ( not ( = ?auto_96923 ?auto_96917 ) ) ( not ( = ?auto_96923 ?auto_96916 ) ) ( not ( = ?auto_96920 ?auto_96921 ) ) ( not ( = ?auto_96920 ?auto_96918 ) ) ( not ( = ?auto_96920 ?auto_96922 ) ) ( not ( = ?auto_96920 ?auto_96917 ) ) ( not ( = ?auto_96920 ?auto_96916 ) ) ( not ( = ?auto_96921 ?auto_96918 ) ) ( not ( = ?auto_96921 ?auto_96922 ) ) ( not ( = ?auto_96921 ?auto_96917 ) ) ( not ( = ?auto_96921 ?auto_96916 ) ) ( not ( = ?auto_96918 ?auto_96922 ) ) ( not ( = ?auto_96918 ?auto_96917 ) ) ( not ( = ?auto_96918 ?auto_96916 ) ) ( ON ?auto_96916 ?auto_96919 ) ( CLEAR ?auto_96916 ) ( not ( = ?auto_96916 ?auto_96919 ) ) ( not ( = ?auto_96917 ?auto_96919 ) ) ( not ( = ?auto_96922 ?auto_96919 ) ) ( not ( = ?auto_96923 ?auto_96919 ) ) ( not ( = ?auto_96920 ?auto_96919 ) ) ( not ( = ?auto_96921 ?auto_96919 ) ) ( not ( = ?auto_96918 ?auto_96919 ) ) ( HOLDING ?auto_96917 ) ( CLEAR ?auto_96922 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96923 ?auto_96920 ?auto_96921 ?auto_96918 ?auto_96922 ?auto_96917 )
      ( MAKE-2PILE ?auto_96916 ?auto_96917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96924 - BLOCK
      ?auto_96925 - BLOCK
    )
    :vars
    (
      ?auto_96930 - BLOCK
      ?auto_96927 - BLOCK
      ?auto_96928 - BLOCK
      ?auto_96931 - BLOCK
      ?auto_96926 - BLOCK
      ?auto_96929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96924 ?auto_96925 ) ) ( not ( = ?auto_96924 ?auto_96930 ) ) ( not ( = ?auto_96925 ?auto_96930 ) ) ( ON-TABLE ?auto_96927 ) ( ON ?auto_96928 ?auto_96927 ) ( ON ?auto_96931 ?auto_96928 ) ( ON ?auto_96926 ?auto_96931 ) ( ON ?auto_96930 ?auto_96926 ) ( not ( = ?auto_96927 ?auto_96928 ) ) ( not ( = ?auto_96927 ?auto_96931 ) ) ( not ( = ?auto_96927 ?auto_96926 ) ) ( not ( = ?auto_96927 ?auto_96930 ) ) ( not ( = ?auto_96927 ?auto_96925 ) ) ( not ( = ?auto_96927 ?auto_96924 ) ) ( not ( = ?auto_96928 ?auto_96931 ) ) ( not ( = ?auto_96928 ?auto_96926 ) ) ( not ( = ?auto_96928 ?auto_96930 ) ) ( not ( = ?auto_96928 ?auto_96925 ) ) ( not ( = ?auto_96928 ?auto_96924 ) ) ( not ( = ?auto_96931 ?auto_96926 ) ) ( not ( = ?auto_96931 ?auto_96930 ) ) ( not ( = ?auto_96931 ?auto_96925 ) ) ( not ( = ?auto_96931 ?auto_96924 ) ) ( not ( = ?auto_96926 ?auto_96930 ) ) ( not ( = ?auto_96926 ?auto_96925 ) ) ( not ( = ?auto_96926 ?auto_96924 ) ) ( ON ?auto_96924 ?auto_96929 ) ( not ( = ?auto_96924 ?auto_96929 ) ) ( not ( = ?auto_96925 ?auto_96929 ) ) ( not ( = ?auto_96930 ?auto_96929 ) ) ( not ( = ?auto_96927 ?auto_96929 ) ) ( not ( = ?auto_96928 ?auto_96929 ) ) ( not ( = ?auto_96931 ?auto_96929 ) ) ( not ( = ?auto_96926 ?auto_96929 ) ) ( CLEAR ?auto_96930 ) ( ON ?auto_96925 ?auto_96924 ) ( CLEAR ?auto_96925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96929 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96929 ?auto_96924 )
      ( MAKE-2PILE ?auto_96924 ?auto_96925 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96932 - BLOCK
      ?auto_96933 - BLOCK
    )
    :vars
    (
      ?auto_96938 - BLOCK
      ?auto_96935 - BLOCK
      ?auto_96939 - BLOCK
      ?auto_96934 - BLOCK
      ?auto_96936 - BLOCK
      ?auto_96937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96932 ?auto_96933 ) ) ( not ( = ?auto_96932 ?auto_96938 ) ) ( not ( = ?auto_96933 ?auto_96938 ) ) ( ON-TABLE ?auto_96935 ) ( ON ?auto_96939 ?auto_96935 ) ( ON ?auto_96934 ?auto_96939 ) ( ON ?auto_96936 ?auto_96934 ) ( not ( = ?auto_96935 ?auto_96939 ) ) ( not ( = ?auto_96935 ?auto_96934 ) ) ( not ( = ?auto_96935 ?auto_96936 ) ) ( not ( = ?auto_96935 ?auto_96938 ) ) ( not ( = ?auto_96935 ?auto_96933 ) ) ( not ( = ?auto_96935 ?auto_96932 ) ) ( not ( = ?auto_96939 ?auto_96934 ) ) ( not ( = ?auto_96939 ?auto_96936 ) ) ( not ( = ?auto_96939 ?auto_96938 ) ) ( not ( = ?auto_96939 ?auto_96933 ) ) ( not ( = ?auto_96939 ?auto_96932 ) ) ( not ( = ?auto_96934 ?auto_96936 ) ) ( not ( = ?auto_96934 ?auto_96938 ) ) ( not ( = ?auto_96934 ?auto_96933 ) ) ( not ( = ?auto_96934 ?auto_96932 ) ) ( not ( = ?auto_96936 ?auto_96938 ) ) ( not ( = ?auto_96936 ?auto_96933 ) ) ( not ( = ?auto_96936 ?auto_96932 ) ) ( ON ?auto_96932 ?auto_96937 ) ( not ( = ?auto_96932 ?auto_96937 ) ) ( not ( = ?auto_96933 ?auto_96937 ) ) ( not ( = ?auto_96938 ?auto_96937 ) ) ( not ( = ?auto_96935 ?auto_96937 ) ) ( not ( = ?auto_96939 ?auto_96937 ) ) ( not ( = ?auto_96934 ?auto_96937 ) ) ( not ( = ?auto_96936 ?auto_96937 ) ) ( ON ?auto_96933 ?auto_96932 ) ( CLEAR ?auto_96933 ) ( ON-TABLE ?auto_96937 ) ( HOLDING ?auto_96938 ) ( CLEAR ?auto_96936 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96935 ?auto_96939 ?auto_96934 ?auto_96936 ?auto_96938 )
      ( MAKE-2PILE ?auto_96932 ?auto_96933 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96940 - BLOCK
      ?auto_96941 - BLOCK
    )
    :vars
    (
      ?auto_96947 - BLOCK
      ?auto_96944 - BLOCK
      ?auto_96946 - BLOCK
      ?auto_96942 - BLOCK
      ?auto_96945 - BLOCK
      ?auto_96943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96940 ?auto_96941 ) ) ( not ( = ?auto_96940 ?auto_96947 ) ) ( not ( = ?auto_96941 ?auto_96947 ) ) ( ON-TABLE ?auto_96944 ) ( ON ?auto_96946 ?auto_96944 ) ( ON ?auto_96942 ?auto_96946 ) ( ON ?auto_96945 ?auto_96942 ) ( not ( = ?auto_96944 ?auto_96946 ) ) ( not ( = ?auto_96944 ?auto_96942 ) ) ( not ( = ?auto_96944 ?auto_96945 ) ) ( not ( = ?auto_96944 ?auto_96947 ) ) ( not ( = ?auto_96944 ?auto_96941 ) ) ( not ( = ?auto_96944 ?auto_96940 ) ) ( not ( = ?auto_96946 ?auto_96942 ) ) ( not ( = ?auto_96946 ?auto_96945 ) ) ( not ( = ?auto_96946 ?auto_96947 ) ) ( not ( = ?auto_96946 ?auto_96941 ) ) ( not ( = ?auto_96946 ?auto_96940 ) ) ( not ( = ?auto_96942 ?auto_96945 ) ) ( not ( = ?auto_96942 ?auto_96947 ) ) ( not ( = ?auto_96942 ?auto_96941 ) ) ( not ( = ?auto_96942 ?auto_96940 ) ) ( not ( = ?auto_96945 ?auto_96947 ) ) ( not ( = ?auto_96945 ?auto_96941 ) ) ( not ( = ?auto_96945 ?auto_96940 ) ) ( ON ?auto_96940 ?auto_96943 ) ( not ( = ?auto_96940 ?auto_96943 ) ) ( not ( = ?auto_96941 ?auto_96943 ) ) ( not ( = ?auto_96947 ?auto_96943 ) ) ( not ( = ?auto_96944 ?auto_96943 ) ) ( not ( = ?auto_96946 ?auto_96943 ) ) ( not ( = ?auto_96942 ?auto_96943 ) ) ( not ( = ?auto_96945 ?auto_96943 ) ) ( ON ?auto_96941 ?auto_96940 ) ( ON-TABLE ?auto_96943 ) ( CLEAR ?auto_96945 ) ( ON ?auto_96947 ?auto_96941 ) ( CLEAR ?auto_96947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96943 ?auto_96940 ?auto_96941 )
      ( MAKE-2PILE ?auto_96940 ?auto_96941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96948 - BLOCK
      ?auto_96949 - BLOCK
    )
    :vars
    (
      ?auto_96955 - BLOCK
      ?auto_96953 - BLOCK
      ?auto_96952 - BLOCK
      ?auto_96951 - BLOCK
      ?auto_96950 - BLOCK
      ?auto_96954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96948 ?auto_96949 ) ) ( not ( = ?auto_96948 ?auto_96955 ) ) ( not ( = ?auto_96949 ?auto_96955 ) ) ( ON-TABLE ?auto_96953 ) ( ON ?auto_96952 ?auto_96953 ) ( ON ?auto_96951 ?auto_96952 ) ( not ( = ?auto_96953 ?auto_96952 ) ) ( not ( = ?auto_96953 ?auto_96951 ) ) ( not ( = ?auto_96953 ?auto_96950 ) ) ( not ( = ?auto_96953 ?auto_96955 ) ) ( not ( = ?auto_96953 ?auto_96949 ) ) ( not ( = ?auto_96953 ?auto_96948 ) ) ( not ( = ?auto_96952 ?auto_96951 ) ) ( not ( = ?auto_96952 ?auto_96950 ) ) ( not ( = ?auto_96952 ?auto_96955 ) ) ( not ( = ?auto_96952 ?auto_96949 ) ) ( not ( = ?auto_96952 ?auto_96948 ) ) ( not ( = ?auto_96951 ?auto_96950 ) ) ( not ( = ?auto_96951 ?auto_96955 ) ) ( not ( = ?auto_96951 ?auto_96949 ) ) ( not ( = ?auto_96951 ?auto_96948 ) ) ( not ( = ?auto_96950 ?auto_96955 ) ) ( not ( = ?auto_96950 ?auto_96949 ) ) ( not ( = ?auto_96950 ?auto_96948 ) ) ( ON ?auto_96948 ?auto_96954 ) ( not ( = ?auto_96948 ?auto_96954 ) ) ( not ( = ?auto_96949 ?auto_96954 ) ) ( not ( = ?auto_96955 ?auto_96954 ) ) ( not ( = ?auto_96953 ?auto_96954 ) ) ( not ( = ?auto_96952 ?auto_96954 ) ) ( not ( = ?auto_96951 ?auto_96954 ) ) ( not ( = ?auto_96950 ?auto_96954 ) ) ( ON ?auto_96949 ?auto_96948 ) ( ON-TABLE ?auto_96954 ) ( ON ?auto_96955 ?auto_96949 ) ( CLEAR ?auto_96955 ) ( HOLDING ?auto_96950 ) ( CLEAR ?auto_96951 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96953 ?auto_96952 ?auto_96951 ?auto_96950 )
      ( MAKE-2PILE ?auto_96948 ?auto_96949 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96956 - BLOCK
      ?auto_96957 - BLOCK
    )
    :vars
    (
      ?auto_96959 - BLOCK
      ?auto_96958 - BLOCK
      ?auto_96962 - BLOCK
      ?auto_96963 - BLOCK
      ?auto_96960 - BLOCK
      ?auto_96961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96956 ?auto_96957 ) ) ( not ( = ?auto_96956 ?auto_96959 ) ) ( not ( = ?auto_96957 ?auto_96959 ) ) ( ON-TABLE ?auto_96958 ) ( ON ?auto_96962 ?auto_96958 ) ( ON ?auto_96963 ?auto_96962 ) ( not ( = ?auto_96958 ?auto_96962 ) ) ( not ( = ?auto_96958 ?auto_96963 ) ) ( not ( = ?auto_96958 ?auto_96960 ) ) ( not ( = ?auto_96958 ?auto_96959 ) ) ( not ( = ?auto_96958 ?auto_96957 ) ) ( not ( = ?auto_96958 ?auto_96956 ) ) ( not ( = ?auto_96962 ?auto_96963 ) ) ( not ( = ?auto_96962 ?auto_96960 ) ) ( not ( = ?auto_96962 ?auto_96959 ) ) ( not ( = ?auto_96962 ?auto_96957 ) ) ( not ( = ?auto_96962 ?auto_96956 ) ) ( not ( = ?auto_96963 ?auto_96960 ) ) ( not ( = ?auto_96963 ?auto_96959 ) ) ( not ( = ?auto_96963 ?auto_96957 ) ) ( not ( = ?auto_96963 ?auto_96956 ) ) ( not ( = ?auto_96960 ?auto_96959 ) ) ( not ( = ?auto_96960 ?auto_96957 ) ) ( not ( = ?auto_96960 ?auto_96956 ) ) ( ON ?auto_96956 ?auto_96961 ) ( not ( = ?auto_96956 ?auto_96961 ) ) ( not ( = ?auto_96957 ?auto_96961 ) ) ( not ( = ?auto_96959 ?auto_96961 ) ) ( not ( = ?auto_96958 ?auto_96961 ) ) ( not ( = ?auto_96962 ?auto_96961 ) ) ( not ( = ?auto_96963 ?auto_96961 ) ) ( not ( = ?auto_96960 ?auto_96961 ) ) ( ON ?auto_96957 ?auto_96956 ) ( ON-TABLE ?auto_96961 ) ( ON ?auto_96959 ?auto_96957 ) ( CLEAR ?auto_96963 ) ( ON ?auto_96960 ?auto_96959 ) ( CLEAR ?auto_96960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96961 ?auto_96956 ?auto_96957 ?auto_96959 )
      ( MAKE-2PILE ?auto_96956 ?auto_96957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96964 - BLOCK
      ?auto_96965 - BLOCK
    )
    :vars
    (
      ?auto_96968 - BLOCK
      ?auto_96971 - BLOCK
      ?auto_96966 - BLOCK
      ?auto_96967 - BLOCK
      ?auto_96969 - BLOCK
      ?auto_96970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96964 ?auto_96965 ) ) ( not ( = ?auto_96964 ?auto_96968 ) ) ( not ( = ?auto_96965 ?auto_96968 ) ) ( ON-TABLE ?auto_96971 ) ( ON ?auto_96966 ?auto_96971 ) ( not ( = ?auto_96971 ?auto_96966 ) ) ( not ( = ?auto_96971 ?auto_96967 ) ) ( not ( = ?auto_96971 ?auto_96969 ) ) ( not ( = ?auto_96971 ?auto_96968 ) ) ( not ( = ?auto_96971 ?auto_96965 ) ) ( not ( = ?auto_96971 ?auto_96964 ) ) ( not ( = ?auto_96966 ?auto_96967 ) ) ( not ( = ?auto_96966 ?auto_96969 ) ) ( not ( = ?auto_96966 ?auto_96968 ) ) ( not ( = ?auto_96966 ?auto_96965 ) ) ( not ( = ?auto_96966 ?auto_96964 ) ) ( not ( = ?auto_96967 ?auto_96969 ) ) ( not ( = ?auto_96967 ?auto_96968 ) ) ( not ( = ?auto_96967 ?auto_96965 ) ) ( not ( = ?auto_96967 ?auto_96964 ) ) ( not ( = ?auto_96969 ?auto_96968 ) ) ( not ( = ?auto_96969 ?auto_96965 ) ) ( not ( = ?auto_96969 ?auto_96964 ) ) ( ON ?auto_96964 ?auto_96970 ) ( not ( = ?auto_96964 ?auto_96970 ) ) ( not ( = ?auto_96965 ?auto_96970 ) ) ( not ( = ?auto_96968 ?auto_96970 ) ) ( not ( = ?auto_96971 ?auto_96970 ) ) ( not ( = ?auto_96966 ?auto_96970 ) ) ( not ( = ?auto_96967 ?auto_96970 ) ) ( not ( = ?auto_96969 ?auto_96970 ) ) ( ON ?auto_96965 ?auto_96964 ) ( ON-TABLE ?auto_96970 ) ( ON ?auto_96968 ?auto_96965 ) ( ON ?auto_96969 ?auto_96968 ) ( CLEAR ?auto_96969 ) ( HOLDING ?auto_96967 ) ( CLEAR ?auto_96966 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96971 ?auto_96966 ?auto_96967 )
      ( MAKE-2PILE ?auto_96964 ?auto_96965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96972 - BLOCK
      ?auto_96973 - BLOCK
    )
    :vars
    (
      ?auto_96977 - BLOCK
      ?auto_96978 - BLOCK
      ?auto_96976 - BLOCK
      ?auto_96975 - BLOCK
      ?auto_96974 - BLOCK
      ?auto_96979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96972 ?auto_96973 ) ) ( not ( = ?auto_96972 ?auto_96977 ) ) ( not ( = ?auto_96973 ?auto_96977 ) ) ( ON-TABLE ?auto_96978 ) ( ON ?auto_96976 ?auto_96978 ) ( not ( = ?auto_96978 ?auto_96976 ) ) ( not ( = ?auto_96978 ?auto_96975 ) ) ( not ( = ?auto_96978 ?auto_96974 ) ) ( not ( = ?auto_96978 ?auto_96977 ) ) ( not ( = ?auto_96978 ?auto_96973 ) ) ( not ( = ?auto_96978 ?auto_96972 ) ) ( not ( = ?auto_96976 ?auto_96975 ) ) ( not ( = ?auto_96976 ?auto_96974 ) ) ( not ( = ?auto_96976 ?auto_96977 ) ) ( not ( = ?auto_96976 ?auto_96973 ) ) ( not ( = ?auto_96976 ?auto_96972 ) ) ( not ( = ?auto_96975 ?auto_96974 ) ) ( not ( = ?auto_96975 ?auto_96977 ) ) ( not ( = ?auto_96975 ?auto_96973 ) ) ( not ( = ?auto_96975 ?auto_96972 ) ) ( not ( = ?auto_96974 ?auto_96977 ) ) ( not ( = ?auto_96974 ?auto_96973 ) ) ( not ( = ?auto_96974 ?auto_96972 ) ) ( ON ?auto_96972 ?auto_96979 ) ( not ( = ?auto_96972 ?auto_96979 ) ) ( not ( = ?auto_96973 ?auto_96979 ) ) ( not ( = ?auto_96977 ?auto_96979 ) ) ( not ( = ?auto_96978 ?auto_96979 ) ) ( not ( = ?auto_96976 ?auto_96979 ) ) ( not ( = ?auto_96975 ?auto_96979 ) ) ( not ( = ?auto_96974 ?auto_96979 ) ) ( ON ?auto_96973 ?auto_96972 ) ( ON-TABLE ?auto_96979 ) ( ON ?auto_96977 ?auto_96973 ) ( ON ?auto_96974 ?auto_96977 ) ( CLEAR ?auto_96976 ) ( ON ?auto_96975 ?auto_96974 ) ( CLEAR ?auto_96975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96979 ?auto_96972 ?auto_96973 ?auto_96977 ?auto_96974 )
      ( MAKE-2PILE ?auto_96972 ?auto_96973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96980 - BLOCK
      ?auto_96981 - BLOCK
    )
    :vars
    (
      ?auto_96984 - BLOCK
      ?auto_96987 - BLOCK
      ?auto_96983 - BLOCK
      ?auto_96982 - BLOCK
      ?auto_96985 - BLOCK
      ?auto_96986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96980 ?auto_96981 ) ) ( not ( = ?auto_96980 ?auto_96984 ) ) ( not ( = ?auto_96981 ?auto_96984 ) ) ( ON-TABLE ?auto_96987 ) ( not ( = ?auto_96987 ?auto_96983 ) ) ( not ( = ?auto_96987 ?auto_96982 ) ) ( not ( = ?auto_96987 ?auto_96985 ) ) ( not ( = ?auto_96987 ?auto_96984 ) ) ( not ( = ?auto_96987 ?auto_96981 ) ) ( not ( = ?auto_96987 ?auto_96980 ) ) ( not ( = ?auto_96983 ?auto_96982 ) ) ( not ( = ?auto_96983 ?auto_96985 ) ) ( not ( = ?auto_96983 ?auto_96984 ) ) ( not ( = ?auto_96983 ?auto_96981 ) ) ( not ( = ?auto_96983 ?auto_96980 ) ) ( not ( = ?auto_96982 ?auto_96985 ) ) ( not ( = ?auto_96982 ?auto_96984 ) ) ( not ( = ?auto_96982 ?auto_96981 ) ) ( not ( = ?auto_96982 ?auto_96980 ) ) ( not ( = ?auto_96985 ?auto_96984 ) ) ( not ( = ?auto_96985 ?auto_96981 ) ) ( not ( = ?auto_96985 ?auto_96980 ) ) ( ON ?auto_96980 ?auto_96986 ) ( not ( = ?auto_96980 ?auto_96986 ) ) ( not ( = ?auto_96981 ?auto_96986 ) ) ( not ( = ?auto_96984 ?auto_96986 ) ) ( not ( = ?auto_96987 ?auto_96986 ) ) ( not ( = ?auto_96983 ?auto_96986 ) ) ( not ( = ?auto_96982 ?auto_96986 ) ) ( not ( = ?auto_96985 ?auto_96986 ) ) ( ON ?auto_96981 ?auto_96980 ) ( ON-TABLE ?auto_96986 ) ( ON ?auto_96984 ?auto_96981 ) ( ON ?auto_96985 ?auto_96984 ) ( ON ?auto_96982 ?auto_96985 ) ( CLEAR ?auto_96982 ) ( HOLDING ?auto_96983 ) ( CLEAR ?auto_96987 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96987 ?auto_96983 )
      ( MAKE-2PILE ?auto_96980 ?auto_96981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96988 - BLOCK
      ?auto_96989 - BLOCK
    )
    :vars
    (
      ?auto_96995 - BLOCK
      ?auto_96992 - BLOCK
      ?auto_96993 - BLOCK
      ?auto_96990 - BLOCK
      ?auto_96991 - BLOCK
      ?auto_96994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96988 ?auto_96989 ) ) ( not ( = ?auto_96988 ?auto_96995 ) ) ( not ( = ?auto_96989 ?auto_96995 ) ) ( ON-TABLE ?auto_96992 ) ( not ( = ?auto_96992 ?auto_96993 ) ) ( not ( = ?auto_96992 ?auto_96990 ) ) ( not ( = ?auto_96992 ?auto_96991 ) ) ( not ( = ?auto_96992 ?auto_96995 ) ) ( not ( = ?auto_96992 ?auto_96989 ) ) ( not ( = ?auto_96992 ?auto_96988 ) ) ( not ( = ?auto_96993 ?auto_96990 ) ) ( not ( = ?auto_96993 ?auto_96991 ) ) ( not ( = ?auto_96993 ?auto_96995 ) ) ( not ( = ?auto_96993 ?auto_96989 ) ) ( not ( = ?auto_96993 ?auto_96988 ) ) ( not ( = ?auto_96990 ?auto_96991 ) ) ( not ( = ?auto_96990 ?auto_96995 ) ) ( not ( = ?auto_96990 ?auto_96989 ) ) ( not ( = ?auto_96990 ?auto_96988 ) ) ( not ( = ?auto_96991 ?auto_96995 ) ) ( not ( = ?auto_96991 ?auto_96989 ) ) ( not ( = ?auto_96991 ?auto_96988 ) ) ( ON ?auto_96988 ?auto_96994 ) ( not ( = ?auto_96988 ?auto_96994 ) ) ( not ( = ?auto_96989 ?auto_96994 ) ) ( not ( = ?auto_96995 ?auto_96994 ) ) ( not ( = ?auto_96992 ?auto_96994 ) ) ( not ( = ?auto_96993 ?auto_96994 ) ) ( not ( = ?auto_96990 ?auto_96994 ) ) ( not ( = ?auto_96991 ?auto_96994 ) ) ( ON ?auto_96989 ?auto_96988 ) ( ON-TABLE ?auto_96994 ) ( ON ?auto_96995 ?auto_96989 ) ( ON ?auto_96991 ?auto_96995 ) ( ON ?auto_96990 ?auto_96991 ) ( CLEAR ?auto_96992 ) ( ON ?auto_96993 ?auto_96990 ) ( CLEAR ?auto_96993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96994 ?auto_96988 ?auto_96989 ?auto_96995 ?auto_96991 ?auto_96990 )
      ( MAKE-2PILE ?auto_96988 ?auto_96989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96996 - BLOCK
      ?auto_96997 - BLOCK
    )
    :vars
    (
      ?auto_96999 - BLOCK
      ?auto_97001 - BLOCK
      ?auto_97003 - BLOCK
      ?auto_96998 - BLOCK
      ?auto_97000 - BLOCK
      ?auto_97002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96996 ?auto_96997 ) ) ( not ( = ?auto_96996 ?auto_96999 ) ) ( not ( = ?auto_96997 ?auto_96999 ) ) ( not ( = ?auto_97001 ?auto_97003 ) ) ( not ( = ?auto_97001 ?auto_96998 ) ) ( not ( = ?auto_97001 ?auto_97000 ) ) ( not ( = ?auto_97001 ?auto_96999 ) ) ( not ( = ?auto_97001 ?auto_96997 ) ) ( not ( = ?auto_97001 ?auto_96996 ) ) ( not ( = ?auto_97003 ?auto_96998 ) ) ( not ( = ?auto_97003 ?auto_97000 ) ) ( not ( = ?auto_97003 ?auto_96999 ) ) ( not ( = ?auto_97003 ?auto_96997 ) ) ( not ( = ?auto_97003 ?auto_96996 ) ) ( not ( = ?auto_96998 ?auto_97000 ) ) ( not ( = ?auto_96998 ?auto_96999 ) ) ( not ( = ?auto_96998 ?auto_96997 ) ) ( not ( = ?auto_96998 ?auto_96996 ) ) ( not ( = ?auto_97000 ?auto_96999 ) ) ( not ( = ?auto_97000 ?auto_96997 ) ) ( not ( = ?auto_97000 ?auto_96996 ) ) ( ON ?auto_96996 ?auto_97002 ) ( not ( = ?auto_96996 ?auto_97002 ) ) ( not ( = ?auto_96997 ?auto_97002 ) ) ( not ( = ?auto_96999 ?auto_97002 ) ) ( not ( = ?auto_97001 ?auto_97002 ) ) ( not ( = ?auto_97003 ?auto_97002 ) ) ( not ( = ?auto_96998 ?auto_97002 ) ) ( not ( = ?auto_97000 ?auto_97002 ) ) ( ON ?auto_96997 ?auto_96996 ) ( ON-TABLE ?auto_97002 ) ( ON ?auto_96999 ?auto_96997 ) ( ON ?auto_97000 ?auto_96999 ) ( ON ?auto_96998 ?auto_97000 ) ( ON ?auto_97003 ?auto_96998 ) ( CLEAR ?auto_97003 ) ( HOLDING ?auto_97001 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97001 )
      ( MAKE-2PILE ?auto_96996 ?auto_96997 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97004 - BLOCK
      ?auto_97005 - BLOCK
    )
    :vars
    (
      ?auto_97008 - BLOCK
      ?auto_97006 - BLOCK
      ?auto_97007 - BLOCK
      ?auto_97009 - BLOCK
      ?auto_97011 - BLOCK
      ?auto_97010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97004 ?auto_97005 ) ) ( not ( = ?auto_97004 ?auto_97008 ) ) ( not ( = ?auto_97005 ?auto_97008 ) ) ( not ( = ?auto_97006 ?auto_97007 ) ) ( not ( = ?auto_97006 ?auto_97009 ) ) ( not ( = ?auto_97006 ?auto_97011 ) ) ( not ( = ?auto_97006 ?auto_97008 ) ) ( not ( = ?auto_97006 ?auto_97005 ) ) ( not ( = ?auto_97006 ?auto_97004 ) ) ( not ( = ?auto_97007 ?auto_97009 ) ) ( not ( = ?auto_97007 ?auto_97011 ) ) ( not ( = ?auto_97007 ?auto_97008 ) ) ( not ( = ?auto_97007 ?auto_97005 ) ) ( not ( = ?auto_97007 ?auto_97004 ) ) ( not ( = ?auto_97009 ?auto_97011 ) ) ( not ( = ?auto_97009 ?auto_97008 ) ) ( not ( = ?auto_97009 ?auto_97005 ) ) ( not ( = ?auto_97009 ?auto_97004 ) ) ( not ( = ?auto_97011 ?auto_97008 ) ) ( not ( = ?auto_97011 ?auto_97005 ) ) ( not ( = ?auto_97011 ?auto_97004 ) ) ( ON ?auto_97004 ?auto_97010 ) ( not ( = ?auto_97004 ?auto_97010 ) ) ( not ( = ?auto_97005 ?auto_97010 ) ) ( not ( = ?auto_97008 ?auto_97010 ) ) ( not ( = ?auto_97006 ?auto_97010 ) ) ( not ( = ?auto_97007 ?auto_97010 ) ) ( not ( = ?auto_97009 ?auto_97010 ) ) ( not ( = ?auto_97011 ?auto_97010 ) ) ( ON ?auto_97005 ?auto_97004 ) ( ON-TABLE ?auto_97010 ) ( ON ?auto_97008 ?auto_97005 ) ( ON ?auto_97011 ?auto_97008 ) ( ON ?auto_97009 ?auto_97011 ) ( ON ?auto_97007 ?auto_97009 ) ( ON ?auto_97006 ?auto_97007 ) ( CLEAR ?auto_97006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97010 ?auto_97004 ?auto_97005 ?auto_97008 ?auto_97011 ?auto_97009 ?auto_97007 )
      ( MAKE-2PILE ?auto_97004 ?auto_97005 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97016 - BLOCK
      ?auto_97017 - BLOCK
      ?auto_97018 - BLOCK
      ?auto_97019 - BLOCK
    )
    :vars
    (
      ?auto_97020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97020 ?auto_97019 ) ( CLEAR ?auto_97020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97016 ) ( ON ?auto_97017 ?auto_97016 ) ( ON ?auto_97018 ?auto_97017 ) ( ON ?auto_97019 ?auto_97018 ) ( not ( = ?auto_97016 ?auto_97017 ) ) ( not ( = ?auto_97016 ?auto_97018 ) ) ( not ( = ?auto_97016 ?auto_97019 ) ) ( not ( = ?auto_97016 ?auto_97020 ) ) ( not ( = ?auto_97017 ?auto_97018 ) ) ( not ( = ?auto_97017 ?auto_97019 ) ) ( not ( = ?auto_97017 ?auto_97020 ) ) ( not ( = ?auto_97018 ?auto_97019 ) ) ( not ( = ?auto_97018 ?auto_97020 ) ) ( not ( = ?auto_97019 ?auto_97020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97020 ?auto_97019 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97021 - BLOCK
      ?auto_97022 - BLOCK
      ?auto_97023 - BLOCK
      ?auto_97024 - BLOCK
    )
    :vars
    (
      ?auto_97025 - BLOCK
      ?auto_97026 - BLOCK
      ?auto_97027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97025 ?auto_97024 ) ( CLEAR ?auto_97025 ) ( ON-TABLE ?auto_97021 ) ( ON ?auto_97022 ?auto_97021 ) ( ON ?auto_97023 ?auto_97022 ) ( ON ?auto_97024 ?auto_97023 ) ( not ( = ?auto_97021 ?auto_97022 ) ) ( not ( = ?auto_97021 ?auto_97023 ) ) ( not ( = ?auto_97021 ?auto_97024 ) ) ( not ( = ?auto_97021 ?auto_97025 ) ) ( not ( = ?auto_97022 ?auto_97023 ) ) ( not ( = ?auto_97022 ?auto_97024 ) ) ( not ( = ?auto_97022 ?auto_97025 ) ) ( not ( = ?auto_97023 ?auto_97024 ) ) ( not ( = ?auto_97023 ?auto_97025 ) ) ( not ( = ?auto_97024 ?auto_97025 ) ) ( HOLDING ?auto_97026 ) ( CLEAR ?auto_97027 ) ( not ( = ?auto_97021 ?auto_97026 ) ) ( not ( = ?auto_97021 ?auto_97027 ) ) ( not ( = ?auto_97022 ?auto_97026 ) ) ( not ( = ?auto_97022 ?auto_97027 ) ) ( not ( = ?auto_97023 ?auto_97026 ) ) ( not ( = ?auto_97023 ?auto_97027 ) ) ( not ( = ?auto_97024 ?auto_97026 ) ) ( not ( = ?auto_97024 ?auto_97027 ) ) ( not ( = ?auto_97025 ?auto_97026 ) ) ( not ( = ?auto_97025 ?auto_97027 ) ) ( not ( = ?auto_97026 ?auto_97027 ) ) )
    :subtasks
    ( ( !STACK ?auto_97026 ?auto_97027 )
      ( MAKE-4PILE ?auto_97021 ?auto_97022 ?auto_97023 ?auto_97024 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97028 - BLOCK
      ?auto_97029 - BLOCK
      ?auto_97030 - BLOCK
      ?auto_97031 - BLOCK
    )
    :vars
    (
      ?auto_97032 - BLOCK
      ?auto_97034 - BLOCK
      ?auto_97033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97032 ?auto_97031 ) ( ON-TABLE ?auto_97028 ) ( ON ?auto_97029 ?auto_97028 ) ( ON ?auto_97030 ?auto_97029 ) ( ON ?auto_97031 ?auto_97030 ) ( not ( = ?auto_97028 ?auto_97029 ) ) ( not ( = ?auto_97028 ?auto_97030 ) ) ( not ( = ?auto_97028 ?auto_97031 ) ) ( not ( = ?auto_97028 ?auto_97032 ) ) ( not ( = ?auto_97029 ?auto_97030 ) ) ( not ( = ?auto_97029 ?auto_97031 ) ) ( not ( = ?auto_97029 ?auto_97032 ) ) ( not ( = ?auto_97030 ?auto_97031 ) ) ( not ( = ?auto_97030 ?auto_97032 ) ) ( not ( = ?auto_97031 ?auto_97032 ) ) ( CLEAR ?auto_97034 ) ( not ( = ?auto_97028 ?auto_97033 ) ) ( not ( = ?auto_97028 ?auto_97034 ) ) ( not ( = ?auto_97029 ?auto_97033 ) ) ( not ( = ?auto_97029 ?auto_97034 ) ) ( not ( = ?auto_97030 ?auto_97033 ) ) ( not ( = ?auto_97030 ?auto_97034 ) ) ( not ( = ?auto_97031 ?auto_97033 ) ) ( not ( = ?auto_97031 ?auto_97034 ) ) ( not ( = ?auto_97032 ?auto_97033 ) ) ( not ( = ?auto_97032 ?auto_97034 ) ) ( not ( = ?auto_97033 ?auto_97034 ) ) ( ON ?auto_97033 ?auto_97032 ) ( CLEAR ?auto_97033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97028 ?auto_97029 ?auto_97030 ?auto_97031 ?auto_97032 )
      ( MAKE-4PILE ?auto_97028 ?auto_97029 ?auto_97030 ?auto_97031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97035 - BLOCK
      ?auto_97036 - BLOCK
      ?auto_97037 - BLOCK
      ?auto_97038 - BLOCK
    )
    :vars
    (
      ?auto_97040 - BLOCK
      ?auto_97039 - BLOCK
      ?auto_97041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97040 ?auto_97038 ) ( ON-TABLE ?auto_97035 ) ( ON ?auto_97036 ?auto_97035 ) ( ON ?auto_97037 ?auto_97036 ) ( ON ?auto_97038 ?auto_97037 ) ( not ( = ?auto_97035 ?auto_97036 ) ) ( not ( = ?auto_97035 ?auto_97037 ) ) ( not ( = ?auto_97035 ?auto_97038 ) ) ( not ( = ?auto_97035 ?auto_97040 ) ) ( not ( = ?auto_97036 ?auto_97037 ) ) ( not ( = ?auto_97036 ?auto_97038 ) ) ( not ( = ?auto_97036 ?auto_97040 ) ) ( not ( = ?auto_97037 ?auto_97038 ) ) ( not ( = ?auto_97037 ?auto_97040 ) ) ( not ( = ?auto_97038 ?auto_97040 ) ) ( not ( = ?auto_97035 ?auto_97039 ) ) ( not ( = ?auto_97035 ?auto_97041 ) ) ( not ( = ?auto_97036 ?auto_97039 ) ) ( not ( = ?auto_97036 ?auto_97041 ) ) ( not ( = ?auto_97037 ?auto_97039 ) ) ( not ( = ?auto_97037 ?auto_97041 ) ) ( not ( = ?auto_97038 ?auto_97039 ) ) ( not ( = ?auto_97038 ?auto_97041 ) ) ( not ( = ?auto_97040 ?auto_97039 ) ) ( not ( = ?auto_97040 ?auto_97041 ) ) ( not ( = ?auto_97039 ?auto_97041 ) ) ( ON ?auto_97039 ?auto_97040 ) ( CLEAR ?auto_97039 ) ( HOLDING ?auto_97041 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97041 )
      ( MAKE-4PILE ?auto_97035 ?auto_97036 ?auto_97037 ?auto_97038 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97042 - BLOCK
      ?auto_97043 - BLOCK
      ?auto_97044 - BLOCK
      ?auto_97045 - BLOCK
    )
    :vars
    (
      ?auto_97047 - BLOCK
      ?auto_97046 - BLOCK
      ?auto_97048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97047 ?auto_97045 ) ( ON-TABLE ?auto_97042 ) ( ON ?auto_97043 ?auto_97042 ) ( ON ?auto_97044 ?auto_97043 ) ( ON ?auto_97045 ?auto_97044 ) ( not ( = ?auto_97042 ?auto_97043 ) ) ( not ( = ?auto_97042 ?auto_97044 ) ) ( not ( = ?auto_97042 ?auto_97045 ) ) ( not ( = ?auto_97042 ?auto_97047 ) ) ( not ( = ?auto_97043 ?auto_97044 ) ) ( not ( = ?auto_97043 ?auto_97045 ) ) ( not ( = ?auto_97043 ?auto_97047 ) ) ( not ( = ?auto_97044 ?auto_97045 ) ) ( not ( = ?auto_97044 ?auto_97047 ) ) ( not ( = ?auto_97045 ?auto_97047 ) ) ( not ( = ?auto_97042 ?auto_97046 ) ) ( not ( = ?auto_97042 ?auto_97048 ) ) ( not ( = ?auto_97043 ?auto_97046 ) ) ( not ( = ?auto_97043 ?auto_97048 ) ) ( not ( = ?auto_97044 ?auto_97046 ) ) ( not ( = ?auto_97044 ?auto_97048 ) ) ( not ( = ?auto_97045 ?auto_97046 ) ) ( not ( = ?auto_97045 ?auto_97048 ) ) ( not ( = ?auto_97047 ?auto_97046 ) ) ( not ( = ?auto_97047 ?auto_97048 ) ) ( not ( = ?auto_97046 ?auto_97048 ) ) ( ON ?auto_97046 ?auto_97047 ) ( ON ?auto_97048 ?auto_97046 ) ( CLEAR ?auto_97048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97042 ?auto_97043 ?auto_97044 ?auto_97045 ?auto_97047 ?auto_97046 )
      ( MAKE-4PILE ?auto_97042 ?auto_97043 ?auto_97044 ?auto_97045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97049 - BLOCK
      ?auto_97050 - BLOCK
      ?auto_97051 - BLOCK
      ?auto_97052 - BLOCK
    )
    :vars
    (
      ?auto_97054 - BLOCK
      ?auto_97055 - BLOCK
      ?auto_97053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97054 ?auto_97052 ) ( ON-TABLE ?auto_97049 ) ( ON ?auto_97050 ?auto_97049 ) ( ON ?auto_97051 ?auto_97050 ) ( ON ?auto_97052 ?auto_97051 ) ( not ( = ?auto_97049 ?auto_97050 ) ) ( not ( = ?auto_97049 ?auto_97051 ) ) ( not ( = ?auto_97049 ?auto_97052 ) ) ( not ( = ?auto_97049 ?auto_97054 ) ) ( not ( = ?auto_97050 ?auto_97051 ) ) ( not ( = ?auto_97050 ?auto_97052 ) ) ( not ( = ?auto_97050 ?auto_97054 ) ) ( not ( = ?auto_97051 ?auto_97052 ) ) ( not ( = ?auto_97051 ?auto_97054 ) ) ( not ( = ?auto_97052 ?auto_97054 ) ) ( not ( = ?auto_97049 ?auto_97055 ) ) ( not ( = ?auto_97049 ?auto_97053 ) ) ( not ( = ?auto_97050 ?auto_97055 ) ) ( not ( = ?auto_97050 ?auto_97053 ) ) ( not ( = ?auto_97051 ?auto_97055 ) ) ( not ( = ?auto_97051 ?auto_97053 ) ) ( not ( = ?auto_97052 ?auto_97055 ) ) ( not ( = ?auto_97052 ?auto_97053 ) ) ( not ( = ?auto_97054 ?auto_97055 ) ) ( not ( = ?auto_97054 ?auto_97053 ) ) ( not ( = ?auto_97055 ?auto_97053 ) ) ( ON ?auto_97055 ?auto_97054 ) ( HOLDING ?auto_97053 ) ( CLEAR ?auto_97055 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97049 ?auto_97050 ?auto_97051 ?auto_97052 ?auto_97054 ?auto_97055 ?auto_97053 )
      ( MAKE-4PILE ?auto_97049 ?auto_97050 ?auto_97051 ?auto_97052 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97056 - BLOCK
      ?auto_97057 - BLOCK
      ?auto_97058 - BLOCK
      ?auto_97059 - BLOCK
    )
    :vars
    (
      ?auto_97061 - BLOCK
      ?auto_97062 - BLOCK
      ?auto_97060 - BLOCK
      ?auto_97063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97061 ?auto_97059 ) ( ON-TABLE ?auto_97056 ) ( ON ?auto_97057 ?auto_97056 ) ( ON ?auto_97058 ?auto_97057 ) ( ON ?auto_97059 ?auto_97058 ) ( not ( = ?auto_97056 ?auto_97057 ) ) ( not ( = ?auto_97056 ?auto_97058 ) ) ( not ( = ?auto_97056 ?auto_97059 ) ) ( not ( = ?auto_97056 ?auto_97061 ) ) ( not ( = ?auto_97057 ?auto_97058 ) ) ( not ( = ?auto_97057 ?auto_97059 ) ) ( not ( = ?auto_97057 ?auto_97061 ) ) ( not ( = ?auto_97058 ?auto_97059 ) ) ( not ( = ?auto_97058 ?auto_97061 ) ) ( not ( = ?auto_97059 ?auto_97061 ) ) ( not ( = ?auto_97056 ?auto_97062 ) ) ( not ( = ?auto_97056 ?auto_97060 ) ) ( not ( = ?auto_97057 ?auto_97062 ) ) ( not ( = ?auto_97057 ?auto_97060 ) ) ( not ( = ?auto_97058 ?auto_97062 ) ) ( not ( = ?auto_97058 ?auto_97060 ) ) ( not ( = ?auto_97059 ?auto_97062 ) ) ( not ( = ?auto_97059 ?auto_97060 ) ) ( not ( = ?auto_97061 ?auto_97062 ) ) ( not ( = ?auto_97061 ?auto_97060 ) ) ( not ( = ?auto_97062 ?auto_97060 ) ) ( ON ?auto_97062 ?auto_97061 ) ( CLEAR ?auto_97062 ) ( ON ?auto_97060 ?auto_97063 ) ( CLEAR ?auto_97060 ) ( HAND-EMPTY ) ( not ( = ?auto_97056 ?auto_97063 ) ) ( not ( = ?auto_97057 ?auto_97063 ) ) ( not ( = ?auto_97058 ?auto_97063 ) ) ( not ( = ?auto_97059 ?auto_97063 ) ) ( not ( = ?auto_97061 ?auto_97063 ) ) ( not ( = ?auto_97062 ?auto_97063 ) ) ( not ( = ?auto_97060 ?auto_97063 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97060 ?auto_97063 )
      ( MAKE-4PILE ?auto_97056 ?auto_97057 ?auto_97058 ?auto_97059 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97064 - BLOCK
      ?auto_97065 - BLOCK
      ?auto_97066 - BLOCK
      ?auto_97067 - BLOCK
    )
    :vars
    (
      ?auto_97070 - BLOCK
      ?auto_97069 - BLOCK
      ?auto_97071 - BLOCK
      ?auto_97068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97070 ?auto_97067 ) ( ON-TABLE ?auto_97064 ) ( ON ?auto_97065 ?auto_97064 ) ( ON ?auto_97066 ?auto_97065 ) ( ON ?auto_97067 ?auto_97066 ) ( not ( = ?auto_97064 ?auto_97065 ) ) ( not ( = ?auto_97064 ?auto_97066 ) ) ( not ( = ?auto_97064 ?auto_97067 ) ) ( not ( = ?auto_97064 ?auto_97070 ) ) ( not ( = ?auto_97065 ?auto_97066 ) ) ( not ( = ?auto_97065 ?auto_97067 ) ) ( not ( = ?auto_97065 ?auto_97070 ) ) ( not ( = ?auto_97066 ?auto_97067 ) ) ( not ( = ?auto_97066 ?auto_97070 ) ) ( not ( = ?auto_97067 ?auto_97070 ) ) ( not ( = ?auto_97064 ?auto_97069 ) ) ( not ( = ?auto_97064 ?auto_97071 ) ) ( not ( = ?auto_97065 ?auto_97069 ) ) ( not ( = ?auto_97065 ?auto_97071 ) ) ( not ( = ?auto_97066 ?auto_97069 ) ) ( not ( = ?auto_97066 ?auto_97071 ) ) ( not ( = ?auto_97067 ?auto_97069 ) ) ( not ( = ?auto_97067 ?auto_97071 ) ) ( not ( = ?auto_97070 ?auto_97069 ) ) ( not ( = ?auto_97070 ?auto_97071 ) ) ( not ( = ?auto_97069 ?auto_97071 ) ) ( ON ?auto_97071 ?auto_97068 ) ( CLEAR ?auto_97071 ) ( not ( = ?auto_97064 ?auto_97068 ) ) ( not ( = ?auto_97065 ?auto_97068 ) ) ( not ( = ?auto_97066 ?auto_97068 ) ) ( not ( = ?auto_97067 ?auto_97068 ) ) ( not ( = ?auto_97070 ?auto_97068 ) ) ( not ( = ?auto_97069 ?auto_97068 ) ) ( not ( = ?auto_97071 ?auto_97068 ) ) ( HOLDING ?auto_97069 ) ( CLEAR ?auto_97070 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97064 ?auto_97065 ?auto_97066 ?auto_97067 ?auto_97070 ?auto_97069 )
      ( MAKE-4PILE ?auto_97064 ?auto_97065 ?auto_97066 ?auto_97067 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97072 - BLOCK
      ?auto_97073 - BLOCK
      ?auto_97074 - BLOCK
      ?auto_97075 - BLOCK
    )
    :vars
    (
      ?auto_97078 - BLOCK
      ?auto_97079 - BLOCK
      ?auto_97077 - BLOCK
      ?auto_97076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97078 ?auto_97075 ) ( ON-TABLE ?auto_97072 ) ( ON ?auto_97073 ?auto_97072 ) ( ON ?auto_97074 ?auto_97073 ) ( ON ?auto_97075 ?auto_97074 ) ( not ( = ?auto_97072 ?auto_97073 ) ) ( not ( = ?auto_97072 ?auto_97074 ) ) ( not ( = ?auto_97072 ?auto_97075 ) ) ( not ( = ?auto_97072 ?auto_97078 ) ) ( not ( = ?auto_97073 ?auto_97074 ) ) ( not ( = ?auto_97073 ?auto_97075 ) ) ( not ( = ?auto_97073 ?auto_97078 ) ) ( not ( = ?auto_97074 ?auto_97075 ) ) ( not ( = ?auto_97074 ?auto_97078 ) ) ( not ( = ?auto_97075 ?auto_97078 ) ) ( not ( = ?auto_97072 ?auto_97079 ) ) ( not ( = ?auto_97072 ?auto_97077 ) ) ( not ( = ?auto_97073 ?auto_97079 ) ) ( not ( = ?auto_97073 ?auto_97077 ) ) ( not ( = ?auto_97074 ?auto_97079 ) ) ( not ( = ?auto_97074 ?auto_97077 ) ) ( not ( = ?auto_97075 ?auto_97079 ) ) ( not ( = ?auto_97075 ?auto_97077 ) ) ( not ( = ?auto_97078 ?auto_97079 ) ) ( not ( = ?auto_97078 ?auto_97077 ) ) ( not ( = ?auto_97079 ?auto_97077 ) ) ( ON ?auto_97077 ?auto_97076 ) ( not ( = ?auto_97072 ?auto_97076 ) ) ( not ( = ?auto_97073 ?auto_97076 ) ) ( not ( = ?auto_97074 ?auto_97076 ) ) ( not ( = ?auto_97075 ?auto_97076 ) ) ( not ( = ?auto_97078 ?auto_97076 ) ) ( not ( = ?auto_97079 ?auto_97076 ) ) ( not ( = ?auto_97077 ?auto_97076 ) ) ( CLEAR ?auto_97078 ) ( ON ?auto_97079 ?auto_97077 ) ( CLEAR ?auto_97079 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97076 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97076 ?auto_97077 )
      ( MAKE-4PILE ?auto_97072 ?auto_97073 ?auto_97074 ?auto_97075 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97096 - BLOCK
      ?auto_97097 - BLOCK
      ?auto_97098 - BLOCK
      ?auto_97099 - BLOCK
    )
    :vars
    (
      ?auto_97102 - BLOCK
      ?auto_97101 - BLOCK
      ?auto_97103 - BLOCK
      ?auto_97100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97096 ) ( ON ?auto_97097 ?auto_97096 ) ( ON ?auto_97098 ?auto_97097 ) ( not ( = ?auto_97096 ?auto_97097 ) ) ( not ( = ?auto_97096 ?auto_97098 ) ) ( not ( = ?auto_97096 ?auto_97099 ) ) ( not ( = ?auto_97096 ?auto_97102 ) ) ( not ( = ?auto_97097 ?auto_97098 ) ) ( not ( = ?auto_97097 ?auto_97099 ) ) ( not ( = ?auto_97097 ?auto_97102 ) ) ( not ( = ?auto_97098 ?auto_97099 ) ) ( not ( = ?auto_97098 ?auto_97102 ) ) ( not ( = ?auto_97099 ?auto_97102 ) ) ( not ( = ?auto_97096 ?auto_97101 ) ) ( not ( = ?auto_97096 ?auto_97103 ) ) ( not ( = ?auto_97097 ?auto_97101 ) ) ( not ( = ?auto_97097 ?auto_97103 ) ) ( not ( = ?auto_97098 ?auto_97101 ) ) ( not ( = ?auto_97098 ?auto_97103 ) ) ( not ( = ?auto_97099 ?auto_97101 ) ) ( not ( = ?auto_97099 ?auto_97103 ) ) ( not ( = ?auto_97102 ?auto_97101 ) ) ( not ( = ?auto_97102 ?auto_97103 ) ) ( not ( = ?auto_97101 ?auto_97103 ) ) ( ON ?auto_97103 ?auto_97100 ) ( not ( = ?auto_97096 ?auto_97100 ) ) ( not ( = ?auto_97097 ?auto_97100 ) ) ( not ( = ?auto_97098 ?auto_97100 ) ) ( not ( = ?auto_97099 ?auto_97100 ) ) ( not ( = ?auto_97102 ?auto_97100 ) ) ( not ( = ?auto_97101 ?auto_97100 ) ) ( not ( = ?auto_97103 ?auto_97100 ) ) ( ON ?auto_97101 ?auto_97103 ) ( ON-TABLE ?auto_97100 ) ( ON ?auto_97102 ?auto_97101 ) ( CLEAR ?auto_97102 ) ( HOLDING ?auto_97099 ) ( CLEAR ?auto_97098 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97096 ?auto_97097 ?auto_97098 ?auto_97099 ?auto_97102 )
      ( MAKE-4PILE ?auto_97096 ?auto_97097 ?auto_97098 ?auto_97099 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97104 - BLOCK
      ?auto_97105 - BLOCK
      ?auto_97106 - BLOCK
      ?auto_97107 - BLOCK
    )
    :vars
    (
      ?auto_97108 - BLOCK
      ?auto_97111 - BLOCK
      ?auto_97110 - BLOCK
      ?auto_97109 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97104 ) ( ON ?auto_97105 ?auto_97104 ) ( ON ?auto_97106 ?auto_97105 ) ( not ( = ?auto_97104 ?auto_97105 ) ) ( not ( = ?auto_97104 ?auto_97106 ) ) ( not ( = ?auto_97104 ?auto_97107 ) ) ( not ( = ?auto_97104 ?auto_97108 ) ) ( not ( = ?auto_97105 ?auto_97106 ) ) ( not ( = ?auto_97105 ?auto_97107 ) ) ( not ( = ?auto_97105 ?auto_97108 ) ) ( not ( = ?auto_97106 ?auto_97107 ) ) ( not ( = ?auto_97106 ?auto_97108 ) ) ( not ( = ?auto_97107 ?auto_97108 ) ) ( not ( = ?auto_97104 ?auto_97111 ) ) ( not ( = ?auto_97104 ?auto_97110 ) ) ( not ( = ?auto_97105 ?auto_97111 ) ) ( not ( = ?auto_97105 ?auto_97110 ) ) ( not ( = ?auto_97106 ?auto_97111 ) ) ( not ( = ?auto_97106 ?auto_97110 ) ) ( not ( = ?auto_97107 ?auto_97111 ) ) ( not ( = ?auto_97107 ?auto_97110 ) ) ( not ( = ?auto_97108 ?auto_97111 ) ) ( not ( = ?auto_97108 ?auto_97110 ) ) ( not ( = ?auto_97111 ?auto_97110 ) ) ( ON ?auto_97110 ?auto_97109 ) ( not ( = ?auto_97104 ?auto_97109 ) ) ( not ( = ?auto_97105 ?auto_97109 ) ) ( not ( = ?auto_97106 ?auto_97109 ) ) ( not ( = ?auto_97107 ?auto_97109 ) ) ( not ( = ?auto_97108 ?auto_97109 ) ) ( not ( = ?auto_97111 ?auto_97109 ) ) ( not ( = ?auto_97110 ?auto_97109 ) ) ( ON ?auto_97111 ?auto_97110 ) ( ON-TABLE ?auto_97109 ) ( ON ?auto_97108 ?auto_97111 ) ( CLEAR ?auto_97106 ) ( ON ?auto_97107 ?auto_97108 ) ( CLEAR ?auto_97107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97109 ?auto_97110 ?auto_97111 ?auto_97108 )
      ( MAKE-4PILE ?auto_97104 ?auto_97105 ?auto_97106 ?auto_97107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97112 - BLOCK
      ?auto_97113 - BLOCK
      ?auto_97114 - BLOCK
      ?auto_97115 - BLOCK
    )
    :vars
    (
      ?auto_97118 - BLOCK
      ?auto_97119 - BLOCK
      ?auto_97116 - BLOCK
      ?auto_97117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97112 ) ( ON ?auto_97113 ?auto_97112 ) ( not ( = ?auto_97112 ?auto_97113 ) ) ( not ( = ?auto_97112 ?auto_97114 ) ) ( not ( = ?auto_97112 ?auto_97115 ) ) ( not ( = ?auto_97112 ?auto_97118 ) ) ( not ( = ?auto_97113 ?auto_97114 ) ) ( not ( = ?auto_97113 ?auto_97115 ) ) ( not ( = ?auto_97113 ?auto_97118 ) ) ( not ( = ?auto_97114 ?auto_97115 ) ) ( not ( = ?auto_97114 ?auto_97118 ) ) ( not ( = ?auto_97115 ?auto_97118 ) ) ( not ( = ?auto_97112 ?auto_97119 ) ) ( not ( = ?auto_97112 ?auto_97116 ) ) ( not ( = ?auto_97113 ?auto_97119 ) ) ( not ( = ?auto_97113 ?auto_97116 ) ) ( not ( = ?auto_97114 ?auto_97119 ) ) ( not ( = ?auto_97114 ?auto_97116 ) ) ( not ( = ?auto_97115 ?auto_97119 ) ) ( not ( = ?auto_97115 ?auto_97116 ) ) ( not ( = ?auto_97118 ?auto_97119 ) ) ( not ( = ?auto_97118 ?auto_97116 ) ) ( not ( = ?auto_97119 ?auto_97116 ) ) ( ON ?auto_97116 ?auto_97117 ) ( not ( = ?auto_97112 ?auto_97117 ) ) ( not ( = ?auto_97113 ?auto_97117 ) ) ( not ( = ?auto_97114 ?auto_97117 ) ) ( not ( = ?auto_97115 ?auto_97117 ) ) ( not ( = ?auto_97118 ?auto_97117 ) ) ( not ( = ?auto_97119 ?auto_97117 ) ) ( not ( = ?auto_97116 ?auto_97117 ) ) ( ON ?auto_97119 ?auto_97116 ) ( ON-TABLE ?auto_97117 ) ( ON ?auto_97118 ?auto_97119 ) ( ON ?auto_97115 ?auto_97118 ) ( CLEAR ?auto_97115 ) ( HOLDING ?auto_97114 ) ( CLEAR ?auto_97113 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97112 ?auto_97113 ?auto_97114 )
      ( MAKE-4PILE ?auto_97112 ?auto_97113 ?auto_97114 ?auto_97115 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97120 - BLOCK
      ?auto_97121 - BLOCK
      ?auto_97122 - BLOCK
      ?auto_97123 - BLOCK
    )
    :vars
    (
      ?auto_97127 - BLOCK
      ?auto_97124 - BLOCK
      ?auto_97126 - BLOCK
      ?auto_97125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97120 ) ( ON ?auto_97121 ?auto_97120 ) ( not ( = ?auto_97120 ?auto_97121 ) ) ( not ( = ?auto_97120 ?auto_97122 ) ) ( not ( = ?auto_97120 ?auto_97123 ) ) ( not ( = ?auto_97120 ?auto_97127 ) ) ( not ( = ?auto_97121 ?auto_97122 ) ) ( not ( = ?auto_97121 ?auto_97123 ) ) ( not ( = ?auto_97121 ?auto_97127 ) ) ( not ( = ?auto_97122 ?auto_97123 ) ) ( not ( = ?auto_97122 ?auto_97127 ) ) ( not ( = ?auto_97123 ?auto_97127 ) ) ( not ( = ?auto_97120 ?auto_97124 ) ) ( not ( = ?auto_97120 ?auto_97126 ) ) ( not ( = ?auto_97121 ?auto_97124 ) ) ( not ( = ?auto_97121 ?auto_97126 ) ) ( not ( = ?auto_97122 ?auto_97124 ) ) ( not ( = ?auto_97122 ?auto_97126 ) ) ( not ( = ?auto_97123 ?auto_97124 ) ) ( not ( = ?auto_97123 ?auto_97126 ) ) ( not ( = ?auto_97127 ?auto_97124 ) ) ( not ( = ?auto_97127 ?auto_97126 ) ) ( not ( = ?auto_97124 ?auto_97126 ) ) ( ON ?auto_97126 ?auto_97125 ) ( not ( = ?auto_97120 ?auto_97125 ) ) ( not ( = ?auto_97121 ?auto_97125 ) ) ( not ( = ?auto_97122 ?auto_97125 ) ) ( not ( = ?auto_97123 ?auto_97125 ) ) ( not ( = ?auto_97127 ?auto_97125 ) ) ( not ( = ?auto_97124 ?auto_97125 ) ) ( not ( = ?auto_97126 ?auto_97125 ) ) ( ON ?auto_97124 ?auto_97126 ) ( ON-TABLE ?auto_97125 ) ( ON ?auto_97127 ?auto_97124 ) ( ON ?auto_97123 ?auto_97127 ) ( CLEAR ?auto_97121 ) ( ON ?auto_97122 ?auto_97123 ) ( CLEAR ?auto_97122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97125 ?auto_97126 ?auto_97124 ?auto_97127 ?auto_97123 )
      ( MAKE-4PILE ?auto_97120 ?auto_97121 ?auto_97122 ?auto_97123 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97128 - BLOCK
      ?auto_97129 - BLOCK
      ?auto_97130 - BLOCK
      ?auto_97131 - BLOCK
    )
    :vars
    (
      ?auto_97133 - BLOCK
      ?auto_97134 - BLOCK
      ?auto_97135 - BLOCK
      ?auto_97132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97128 ) ( not ( = ?auto_97128 ?auto_97129 ) ) ( not ( = ?auto_97128 ?auto_97130 ) ) ( not ( = ?auto_97128 ?auto_97131 ) ) ( not ( = ?auto_97128 ?auto_97133 ) ) ( not ( = ?auto_97129 ?auto_97130 ) ) ( not ( = ?auto_97129 ?auto_97131 ) ) ( not ( = ?auto_97129 ?auto_97133 ) ) ( not ( = ?auto_97130 ?auto_97131 ) ) ( not ( = ?auto_97130 ?auto_97133 ) ) ( not ( = ?auto_97131 ?auto_97133 ) ) ( not ( = ?auto_97128 ?auto_97134 ) ) ( not ( = ?auto_97128 ?auto_97135 ) ) ( not ( = ?auto_97129 ?auto_97134 ) ) ( not ( = ?auto_97129 ?auto_97135 ) ) ( not ( = ?auto_97130 ?auto_97134 ) ) ( not ( = ?auto_97130 ?auto_97135 ) ) ( not ( = ?auto_97131 ?auto_97134 ) ) ( not ( = ?auto_97131 ?auto_97135 ) ) ( not ( = ?auto_97133 ?auto_97134 ) ) ( not ( = ?auto_97133 ?auto_97135 ) ) ( not ( = ?auto_97134 ?auto_97135 ) ) ( ON ?auto_97135 ?auto_97132 ) ( not ( = ?auto_97128 ?auto_97132 ) ) ( not ( = ?auto_97129 ?auto_97132 ) ) ( not ( = ?auto_97130 ?auto_97132 ) ) ( not ( = ?auto_97131 ?auto_97132 ) ) ( not ( = ?auto_97133 ?auto_97132 ) ) ( not ( = ?auto_97134 ?auto_97132 ) ) ( not ( = ?auto_97135 ?auto_97132 ) ) ( ON ?auto_97134 ?auto_97135 ) ( ON-TABLE ?auto_97132 ) ( ON ?auto_97133 ?auto_97134 ) ( ON ?auto_97131 ?auto_97133 ) ( ON ?auto_97130 ?auto_97131 ) ( CLEAR ?auto_97130 ) ( HOLDING ?auto_97129 ) ( CLEAR ?auto_97128 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97128 ?auto_97129 )
      ( MAKE-4PILE ?auto_97128 ?auto_97129 ?auto_97130 ?auto_97131 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97136 - BLOCK
      ?auto_97137 - BLOCK
      ?auto_97138 - BLOCK
      ?auto_97139 - BLOCK
    )
    :vars
    (
      ?auto_97141 - BLOCK
      ?auto_97143 - BLOCK
      ?auto_97142 - BLOCK
      ?auto_97140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97136 ) ( not ( = ?auto_97136 ?auto_97137 ) ) ( not ( = ?auto_97136 ?auto_97138 ) ) ( not ( = ?auto_97136 ?auto_97139 ) ) ( not ( = ?auto_97136 ?auto_97141 ) ) ( not ( = ?auto_97137 ?auto_97138 ) ) ( not ( = ?auto_97137 ?auto_97139 ) ) ( not ( = ?auto_97137 ?auto_97141 ) ) ( not ( = ?auto_97138 ?auto_97139 ) ) ( not ( = ?auto_97138 ?auto_97141 ) ) ( not ( = ?auto_97139 ?auto_97141 ) ) ( not ( = ?auto_97136 ?auto_97143 ) ) ( not ( = ?auto_97136 ?auto_97142 ) ) ( not ( = ?auto_97137 ?auto_97143 ) ) ( not ( = ?auto_97137 ?auto_97142 ) ) ( not ( = ?auto_97138 ?auto_97143 ) ) ( not ( = ?auto_97138 ?auto_97142 ) ) ( not ( = ?auto_97139 ?auto_97143 ) ) ( not ( = ?auto_97139 ?auto_97142 ) ) ( not ( = ?auto_97141 ?auto_97143 ) ) ( not ( = ?auto_97141 ?auto_97142 ) ) ( not ( = ?auto_97143 ?auto_97142 ) ) ( ON ?auto_97142 ?auto_97140 ) ( not ( = ?auto_97136 ?auto_97140 ) ) ( not ( = ?auto_97137 ?auto_97140 ) ) ( not ( = ?auto_97138 ?auto_97140 ) ) ( not ( = ?auto_97139 ?auto_97140 ) ) ( not ( = ?auto_97141 ?auto_97140 ) ) ( not ( = ?auto_97143 ?auto_97140 ) ) ( not ( = ?auto_97142 ?auto_97140 ) ) ( ON ?auto_97143 ?auto_97142 ) ( ON-TABLE ?auto_97140 ) ( ON ?auto_97141 ?auto_97143 ) ( ON ?auto_97139 ?auto_97141 ) ( ON ?auto_97138 ?auto_97139 ) ( CLEAR ?auto_97136 ) ( ON ?auto_97137 ?auto_97138 ) ( CLEAR ?auto_97137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97140 ?auto_97142 ?auto_97143 ?auto_97141 ?auto_97139 ?auto_97138 )
      ( MAKE-4PILE ?auto_97136 ?auto_97137 ?auto_97138 ?auto_97139 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97144 - BLOCK
      ?auto_97145 - BLOCK
      ?auto_97146 - BLOCK
      ?auto_97147 - BLOCK
    )
    :vars
    (
      ?auto_97150 - BLOCK
      ?auto_97148 - BLOCK
      ?auto_97151 - BLOCK
      ?auto_97149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97144 ?auto_97145 ) ) ( not ( = ?auto_97144 ?auto_97146 ) ) ( not ( = ?auto_97144 ?auto_97147 ) ) ( not ( = ?auto_97144 ?auto_97150 ) ) ( not ( = ?auto_97145 ?auto_97146 ) ) ( not ( = ?auto_97145 ?auto_97147 ) ) ( not ( = ?auto_97145 ?auto_97150 ) ) ( not ( = ?auto_97146 ?auto_97147 ) ) ( not ( = ?auto_97146 ?auto_97150 ) ) ( not ( = ?auto_97147 ?auto_97150 ) ) ( not ( = ?auto_97144 ?auto_97148 ) ) ( not ( = ?auto_97144 ?auto_97151 ) ) ( not ( = ?auto_97145 ?auto_97148 ) ) ( not ( = ?auto_97145 ?auto_97151 ) ) ( not ( = ?auto_97146 ?auto_97148 ) ) ( not ( = ?auto_97146 ?auto_97151 ) ) ( not ( = ?auto_97147 ?auto_97148 ) ) ( not ( = ?auto_97147 ?auto_97151 ) ) ( not ( = ?auto_97150 ?auto_97148 ) ) ( not ( = ?auto_97150 ?auto_97151 ) ) ( not ( = ?auto_97148 ?auto_97151 ) ) ( ON ?auto_97151 ?auto_97149 ) ( not ( = ?auto_97144 ?auto_97149 ) ) ( not ( = ?auto_97145 ?auto_97149 ) ) ( not ( = ?auto_97146 ?auto_97149 ) ) ( not ( = ?auto_97147 ?auto_97149 ) ) ( not ( = ?auto_97150 ?auto_97149 ) ) ( not ( = ?auto_97148 ?auto_97149 ) ) ( not ( = ?auto_97151 ?auto_97149 ) ) ( ON ?auto_97148 ?auto_97151 ) ( ON-TABLE ?auto_97149 ) ( ON ?auto_97150 ?auto_97148 ) ( ON ?auto_97147 ?auto_97150 ) ( ON ?auto_97146 ?auto_97147 ) ( ON ?auto_97145 ?auto_97146 ) ( CLEAR ?auto_97145 ) ( HOLDING ?auto_97144 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97144 )
      ( MAKE-4PILE ?auto_97144 ?auto_97145 ?auto_97146 ?auto_97147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97152 - BLOCK
      ?auto_97153 - BLOCK
      ?auto_97154 - BLOCK
      ?auto_97155 - BLOCK
    )
    :vars
    (
      ?auto_97156 - BLOCK
      ?auto_97159 - BLOCK
      ?auto_97157 - BLOCK
      ?auto_97158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97152 ?auto_97153 ) ) ( not ( = ?auto_97152 ?auto_97154 ) ) ( not ( = ?auto_97152 ?auto_97155 ) ) ( not ( = ?auto_97152 ?auto_97156 ) ) ( not ( = ?auto_97153 ?auto_97154 ) ) ( not ( = ?auto_97153 ?auto_97155 ) ) ( not ( = ?auto_97153 ?auto_97156 ) ) ( not ( = ?auto_97154 ?auto_97155 ) ) ( not ( = ?auto_97154 ?auto_97156 ) ) ( not ( = ?auto_97155 ?auto_97156 ) ) ( not ( = ?auto_97152 ?auto_97159 ) ) ( not ( = ?auto_97152 ?auto_97157 ) ) ( not ( = ?auto_97153 ?auto_97159 ) ) ( not ( = ?auto_97153 ?auto_97157 ) ) ( not ( = ?auto_97154 ?auto_97159 ) ) ( not ( = ?auto_97154 ?auto_97157 ) ) ( not ( = ?auto_97155 ?auto_97159 ) ) ( not ( = ?auto_97155 ?auto_97157 ) ) ( not ( = ?auto_97156 ?auto_97159 ) ) ( not ( = ?auto_97156 ?auto_97157 ) ) ( not ( = ?auto_97159 ?auto_97157 ) ) ( ON ?auto_97157 ?auto_97158 ) ( not ( = ?auto_97152 ?auto_97158 ) ) ( not ( = ?auto_97153 ?auto_97158 ) ) ( not ( = ?auto_97154 ?auto_97158 ) ) ( not ( = ?auto_97155 ?auto_97158 ) ) ( not ( = ?auto_97156 ?auto_97158 ) ) ( not ( = ?auto_97159 ?auto_97158 ) ) ( not ( = ?auto_97157 ?auto_97158 ) ) ( ON ?auto_97159 ?auto_97157 ) ( ON-TABLE ?auto_97158 ) ( ON ?auto_97156 ?auto_97159 ) ( ON ?auto_97155 ?auto_97156 ) ( ON ?auto_97154 ?auto_97155 ) ( ON ?auto_97153 ?auto_97154 ) ( ON ?auto_97152 ?auto_97153 ) ( CLEAR ?auto_97152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97158 ?auto_97157 ?auto_97159 ?auto_97156 ?auto_97155 ?auto_97154 ?auto_97153 )
      ( MAKE-4PILE ?auto_97152 ?auto_97153 ?auto_97154 ?auto_97155 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97163 - BLOCK
      ?auto_97164 - BLOCK
      ?auto_97165 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_97165 ) ( CLEAR ?auto_97164 ) ( ON-TABLE ?auto_97163 ) ( ON ?auto_97164 ?auto_97163 ) ( not ( = ?auto_97163 ?auto_97164 ) ) ( not ( = ?auto_97163 ?auto_97165 ) ) ( not ( = ?auto_97164 ?auto_97165 ) ) )
    :subtasks
    ( ( !STACK ?auto_97165 ?auto_97164 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97166 - BLOCK
      ?auto_97167 - BLOCK
      ?auto_97168 - BLOCK
    )
    :vars
    (
      ?auto_97169 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_97167 ) ( ON-TABLE ?auto_97166 ) ( ON ?auto_97167 ?auto_97166 ) ( not ( = ?auto_97166 ?auto_97167 ) ) ( not ( = ?auto_97166 ?auto_97168 ) ) ( not ( = ?auto_97167 ?auto_97168 ) ) ( ON ?auto_97168 ?auto_97169 ) ( CLEAR ?auto_97168 ) ( HAND-EMPTY ) ( not ( = ?auto_97166 ?auto_97169 ) ) ( not ( = ?auto_97167 ?auto_97169 ) ) ( not ( = ?auto_97168 ?auto_97169 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97168 ?auto_97169 )
      ( MAKE-3PILE ?auto_97166 ?auto_97167 ?auto_97168 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97170 - BLOCK
      ?auto_97171 - BLOCK
      ?auto_97172 - BLOCK
    )
    :vars
    (
      ?auto_97173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97170 ) ( not ( = ?auto_97170 ?auto_97171 ) ) ( not ( = ?auto_97170 ?auto_97172 ) ) ( not ( = ?auto_97171 ?auto_97172 ) ) ( ON ?auto_97172 ?auto_97173 ) ( CLEAR ?auto_97172 ) ( not ( = ?auto_97170 ?auto_97173 ) ) ( not ( = ?auto_97171 ?auto_97173 ) ) ( not ( = ?auto_97172 ?auto_97173 ) ) ( HOLDING ?auto_97171 ) ( CLEAR ?auto_97170 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97170 ?auto_97171 )
      ( MAKE-3PILE ?auto_97170 ?auto_97171 ?auto_97172 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97174 - BLOCK
      ?auto_97175 - BLOCK
      ?auto_97176 - BLOCK
    )
    :vars
    (
      ?auto_97177 - BLOCK
      ?auto_97180 - BLOCK
      ?auto_97179 - BLOCK
      ?auto_97178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97174 ) ( not ( = ?auto_97174 ?auto_97175 ) ) ( not ( = ?auto_97174 ?auto_97176 ) ) ( not ( = ?auto_97175 ?auto_97176 ) ) ( ON ?auto_97176 ?auto_97177 ) ( not ( = ?auto_97174 ?auto_97177 ) ) ( not ( = ?auto_97175 ?auto_97177 ) ) ( not ( = ?auto_97176 ?auto_97177 ) ) ( CLEAR ?auto_97174 ) ( ON ?auto_97175 ?auto_97176 ) ( CLEAR ?auto_97175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97180 ) ( ON ?auto_97179 ?auto_97180 ) ( ON ?auto_97178 ?auto_97179 ) ( ON ?auto_97177 ?auto_97178 ) ( not ( = ?auto_97180 ?auto_97179 ) ) ( not ( = ?auto_97180 ?auto_97178 ) ) ( not ( = ?auto_97180 ?auto_97177 ) ) ( not ( = ?auto_97180 ?auto_97176 ) ) ( not ( = ?auto_97180 ?auto_97175 ) ) ( not ( = ?auto_97179 ?auto_97178 ) ) ( not ( = ?auto_97179 ?auto_97177 ) ) ( not ( = ?auto_97179 ?auto_97176 ) ) ( not ( = ?auto_97179 ?auto_97175 ) ) ( not ( = ?auto_97178 ?auto_97177 ) ) ( not ( = ?auto_97178 ?auto_97176 ) ) ( not ( = ?auto_97178 ?auto_97175 ) ) ( not ( = ?auto_97174 ?auto_97180 ) ) ( not ( = ?auto_97174 ?auto_97179 ) ) ( not ( = ?auto_97174 ?auto_97178 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97180 ?auto_97179 ?auto_97178 ?auto_97177 ?auto_97176 )
      ( MAKE-3PILE ?auto_97174 ?auto_97175 ?auto_97176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97181 - BLOCK
      ?auto_97182 - BLOCK
      ?auto_97183 - BLOCK
    )
    :vars
    (
      ?auto_97187 - BLOCK
      ?auto_97185 - BLOCK
      ?auto_97184 - BLOCK
      ?auto_97186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97181 ?auto_97182 ) ) ( not ( = ?auto_97181 ?auto_97183 ) ) ( not ( = ?auto_97182 ?auto_97183 ) ) ( ON ?auto_97183 ?auto_97187 ) ( not ( = ?auto_97181 ?auto_97187 ) ) ( not ( = ?auto_97182 ?auto_97187 ) ) ( not ( = ?auto_97183 ?auto_97187 ) ) ( ON ?auto_97182 ?auto_97183 ) ( CLEAR ?auto_97182 ) ( ON-TABLE ?auto_97185 ) ( ON ?auto_97184 ?auto_97185 ) ( ON ?auto_97186 ?auto_97184 ) ( ON ?auto_97187 ?auto_97186 ) ( not ( = ?auto_97185 ?auto_97184 ) ) ( not ( = ?auto_97185 ?auto_97186 ) ) ( not ( = ?auto_97185 ?auto_97187 ) ) ( not ( = ?auto_97185 ?auto_97183 ) ) ( not ( = ?auto_97185 ?auto_97182 ) ) ( not ( = ?auto_97184 ?auto_97186 ) ) ( not ( = ?auto_97184 ?auto_97187 ) ) ( not ( = ?auto_97184 ?auto_97183 ) ) ( not ( = ?auto_97184 ?auto_97182 ) ) ( not ( = ?auto_97186 ?auto_97187 ) ) ( not ( = ?auto_97186 ?auto_97183 ) ) ( not ( = ?auto_97186 ?auto_97182 ) ) ( not ( = ?auto_97181 ?auto_97185 ) ) ( not ( = ?auto_97181 ?auto_97184 ) ) ( not ( = ?auto_97181 ?auto_97186 ) ) ( HOLDING ?auto_97181 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97181 )
      ( MAKE-3PILE ?auto_97181 ?auto_97182 ?auto_97183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97188 - BLOCK
      ?auto_97189 - BLOCK
      ?auto_97190 - BLOCK
    )
    :vars
    (
      ?auto_97191 - BLOCK
      ?auto_97192 - BLOCK
      ?auto_97193 - BLOCK
      ?auto_97194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97188 ?auto_97189 ) ) ( not ( = ?auto_97188 ?auto_97190 ) ) ( not ( = ?auto_97189 ?auto_97190 ) ) ( ON ?auto_97190 ?auto_97191 ) ( not ( = ?auto_97188 ?auto_97191 ) ) ( not ( = ?auto_97189 ?auto_97191 ) ) ( not ( = ?auto_97190 ?auto_97191 ) ) ( ON ?auto_97189 ?auto_97190 ) ( ON-TABLE ?auto_97192 ) ( ON ?auto_97193 ?auto_97192 ) ( ON ?auto_97194 ?auto_97193 ) ( ON ?auto_97191 ?auto_97194 ) ( not ( = ?auto_97192 ?auto_97193 ) ) ( not ( = ?auto_97192 ?auto_97194 ) ) ( not ( = ?auto_97192 ?auto_97191 ) ) ( not ( = ?auto_97192 ?auto_97190 ) ) ( not ( = ?auto_97192 ?auto_97189 ) ) ( not ( = ?auto_97193 ?auto_97194 ) ) ( not ( = ?auto_97193 ?auto_97191 ) ) ( not ( = ?auto_97193 ?auto_97190 ) ) ( not ( = ?auto_97193 ?auto_97189 ) ) ( not ( = ?auto_97194 ?auto_97191 ) ) ( not ( = ?auto_97194 ?auto_97190 ) ) ( not ( = ?auto_97194 ?auto_97189 ) ) ( not ( = ?auto_97188 ?auto_97192 ) ) ( not ( = ?auto_97188 ?auto_97193 ) ) ( not ( = ?auto_97188 ?auto_97194 ) ) ( ON ?auto_97188 ?auto_97189 ) ( CLEAR ?auto_97188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97192 ?auto_97193 ?auto_97194 ?auto_97191 ?auto_97190 ?auto_97189 )
      ( MAKE-3PILE ?auto_97188 ?auto_97189 ?auto_97190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97195 - BLOCK
      ?auto_97196 - BLOCK
      ?auto_97197 - BLOCK
    )
    :vars
    (
      ?auto_97198 - BLOCK
      ?auto_97200 - BLOCK
      ?auto_97201 - BLOCK
      ?auto_97199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97195 ?auto_97196 ) ) ( not ( = ?auto_97195 ?auto_97197 ) ) ( not ( = ?auto_97196 ?auto_97197 ) ) ( ON ?auto_97197 ?auto_97198 ) ( not ( = ?auto_97195 ?auto_97198 ) ) ( not ( = ?auto_97196 ?auto_97198 ) ) ( not ( = ?auto_97197 ?auto_97198 ) ) ( ON ?auto_97196 ?auto_97197 ) ( ON-TABLE ?auto_97200 ) ( ON ?auto_97201 ?auto_97200 ) ( ON ?auto_97199 ?auto_97201 ) ( ON ?auto_97198 ?auto_97199 ) ( not ( = ?auto_97200 ?auto_97201 ) ) ( not ( = ?auto_97200 ?auto_97199 ) ) ( not ( = ?auto_97200 ?auto_97198 ) ) ( not ( = ?auto_97200 ?auto_97197 ) ) ( not ( = ?auto_97200 ?auto_97196 ) ) ( not ( = ?auto_97201 ?auto_97199 ) ) ( not ( = ?auto_97201 ?auto_97198 ) ) ( not ( = ?auto_97201 ?auto_97197 ) ) ( not ( = ?auto_97201 ?auto_97196 ) ) ( not ( = ?auto_97199 ?auto_97198 ) ) ( not ( = ?auto_97199 ?auto_97197 ) ) ( not ( = ?auto_97199 ?auto_97196 ) ) ( not ( = ?auto_97195 ?auto_97200 ) ) ( not ( = ?auto_97195 ?auto_97201 ) ) ( not ( = ?auto_97195 ?auto_97199 ) ) ( HOLDING ?auto_97195 ) ( CLEAR ?auto_97196 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97200 ?auto_97201 ?auto_97199 ?auto_97198 ?auto_97197 ?auto_97196 ?auto_97195 )
      ( MAKE-3PILE ?auto_97195 ?auto_97196 ?auto_97197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97202 - BLOCK
      ?auto_97203 - BLOCK
      ?auto_97204 - BLOCK
    )
    :vars
    (
      ?auto_97207 - BLOCK
      ?auto_97205 - BLOCK
      ?auto_97208 - BLOCK
      ?auto_97206 - BLOCK
      ?auto_97209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97202 ?auto_97203 ) ) ( not ( = ?auto_97202 ?auto_97204 ) ) ( not ( = ?auto_97203 ?auto_97204 ) ) ( ON ?auto_97204 ?auto_97207 ) ( not ( = ?auto_97202 ?auto_97207 ) ) ( not ( = ?auto_97203 ?auto_97207 ) ) ( not ( = ?auto_97204 ?auto_97207 ) ) ( ON ?auto_97203 ?auto_97204 ) ( ON-TABLE ?auto_97205 ) ( ON ?auto_97208 ?auto_97205 ) ( ON ?auto_97206 ?auto_97208 ) ( ON ?auto_97207 ?auto_97206 ) ( not ( = ?auto_97205 ?auto_97208 ) ) ( not ( = ?auto_97205 ?auto_97206 ) ) ( not ( = ?auto_97205 ?auto_97207 ) ) ( not ( = ?auto_97205 ?auto_97204 ) ) ( not ( = ?auto_97205 ?auto_97203 ) ) ( not ( = ?auto_97208 ?auto_97206 ) ) ( not ( = ?auto_97208 ?auto_97207 ) ) ( not ( = ?auto_97208 ?auto_97204 ) ) ( not ( = ?auto_97208 ?auto_97203 ) ) ( not ( = ?auto_97206 ?auto_97207 ) ) ( not ( = ?auto_97206 ?auto_97204 ) ) ( not ( = ?auto_97206 ?auto_97203 ) ) ( not ( = ?auto_97202 ?auto_97205 ) ) ( not ( = ?auto_97202 ?auto_97208 ) ) ( not ( = ?auto_97202 ?auto_97206 ) ) ( CLEAR ?auto_97203 ) ( ON ?auto_97202 ?auto_97209 ) ( CLEAR ?auto_97202 ) ( HAND-EMPTY ) ( not ( = ?auto_97202 ?auto_97209 ) ) ( not ( = ?auto_97203 ?auto_97209 ) ) ( not ( = ?auto_97204 ?auto_97209 ) ) ( not ( = ?auto_97207 ?auto_97209 ) ) ( not ( = ?auto_97205 ?auto_97209 ) ) ( not ( = ?auto_97208 ?auto_97209 ) ) ( not ( = ?auto_97206 ?auto_97209 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97202 ?auto_97209 )
      ( MAKE-3PILE ?auto_97202 ?auto_97203 ?auto_97204 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97210 - BLOCK
      ?auto_97211 - BLOCK
      ?auto_97212 - BLOCK
    )
    :vars
    (
      ?auto_97216 - BLOCK
      ?auto_97214 - BLOCK
      ?auto_97213 - BLOCK
      ?auto_97217 - BLOCK
      ?auto_97215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97210 ?auto_97211 ) ) ( not ( = ?auto_97210 ?auto_97212 ) ) ( not ( = ?auto_97211 ?auto_97212 ) ) ( ON ?auto_97212 ?auto_97216 ) ( not ( = ?auto_97210 ?auto_97216 ) ) ( not ( = ?auto_97211 ?auto_97216 ) ) ( not ( = ?auto_97212 ?auto_97216 ) ) ( ON-TABLE ?auto_97214 ) ( ON ?auto_97213 ?auto_97214 ) ( ON ?auto_97217 ?auto_97213 ) ( ON ?auto_97216 ?auto_97217 ) ( not ( = ?auto_97214 ?auto_97213 ) ) ( not ( = ?auto_97214 ?auto_97217 ) ) ( not ( = ?auto_97214 ?auto_97216 ) ) ( not ( = ?auto_97214 ?auto_97212 ) ) ( not ( = ?auto_97214 ?auto_97211 ) ) ( not ( = ?auto_97213 ?auto_97217 ) ) ( not ( = ?auto_97213 ?auto_97216 ) ) ( not ( = ?auto_97213 ?auto_97212 ) ) ( not ( = ?auto_97213 ?auto_97211 ) ) ( not ( = ?auto_97217 ?auto_97216 ) ) ( not ( = ?auto_97217 ?auto_97212 ) ) ( not ( = ?auto_97217 ?auto_97211 ) ) ( not ( = ?auto_97210 ?auto_97214 ) ) ( not ( = ?auto_97210 ?auto_97213 ) ) ( not ( = ?auto_97210 ?auto_97217 ) ) ( ON ?auto_97210 ?auto_97215 ) ( CLEAR ?auto_97210 ) ( not ( = ?auto_97210 ?auto_97215 ) ) ( not ( = ?auto_97211 ?auto_97215 ) ) ( not ( = ?auto_97212 ?auto_97215 ) ) ( not ( = ?auto_97216 ?auto_97215 ) ) ( not ( = ?auto_97214 ?auto_97215 ) ) ( not ( = ?auto_97213 ?auto_97215 ) ) ( not ( = ?auto_97217 ?auto_97215 ) ) ( HOLDING ?auto_97211 ) ( CLEAR ?auto_97212 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97214 ?auto_97213 ?auto_97217 ?auto_97216 ?auto_97212 ?auto_97211 )
      ( MAKE-3PILE ?auto_97210 ?auto_97211 ?auto_97212 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97218 - BLOCK
      ?auto_97219 - BLOCK
      ?auto_97220 - BLOCK
    )
    :vars
    (
      ?auto_97222 - BLOCK
      ?auto_97221 - BLOCK
      ?auto_97225 - BLOCK
      ?auto_97223 - BLOCK
      ?auto_97224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97218 ?auto_97219 ) ) ( not ( = ?auto_97218 ?auto_97220 ) ) ( not ( = ?auto_97219 ?auto_97220 ) ) ( ON ?auto_97220 ?auto_97222 ) ( not ( = ?auto_97218 ?auto_97222 ) ) ( not ( = ?auto_97219 ?auto_97222 ) ) ( not ( = ?auto_97220 ?auto_97222 ) ) ( ON-TABLE ?auto_97221 ) ( ON ?auto_97225 ?auto_97221 ) ( ON ?auto_97223 ?auto_97225 ) ( ON ?auto_97222 ?auto_97223 ) ( not ( = ?auto_97221 ?auto_97225 ) ) ( not ( = ?auto_97221 ?auto_97223 ) ) ( not ( = ?auto_97221 ?auto_97222 ) ) ( not ( = ?auto_97221 ?auto_97220 ) ) ( not ( = ?auto_97221 ?auto_97219 ) ) ( not ( = ?auto_97225 ?auto_97223 ) ) ( not ( = ?auto_97225 ?auto_97222 ) ) ( not ( = ?auto_97225 ?auto_97220 ) ) ( not ( = ?auto_97225 ?auto_97219 ) ) ( not ( = ?auto_97223 ?auto_97222 ) ) ( not ( = ?auto_97223 ?auto_97220 ) ) ( not ( = ?auto_97223 ?auto_97219 ) ) ( not ( = ?auto_97218 ?auto_97221 ) ) ( not ( = ?auto_97218 ?auto_97225 ) ) ( not ( = ?auto_97218 ?auto_97223 ) ) ( ON ?auto_97218 ?auto_97224 ) ( not ( = ?auto_97218 ?auto_97224 ) ) ( not ( = ?auto_97219 ?auto_97224 ) ) ( not ( = ?auto_97220 ?auto_97224 ) ) ( not ( = ?auto_97222 ?auto_97224 ) ) ( not ( = ?auto_97221 ?auto_97224 ) ) ( not ( = ?auto_97225 ?auto_97224 ) ) ( not ( = ?auto_97223 ?auto_97224 ) ) ( CLEAR ?auto_97220 ) ( ON ?auto_97219 ?auto_97218 ) ( CLEAR ?auto_97219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97224 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97224 ?auto_97218 )
      ( MAKE-3PILE ?auto_97218 ?auto_97219 ?auto_97220 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97226 - BLOCK
      ?auto_97227 - BLOCK
      ?auto_97228 - BLOCK
    )
    :vars
    (
      ?auto_97232 - BLOCK
      ?auto_97231 - BLOCK
      ?auto_97233 - BLOCK
      ?auto_97230 - BLOCK
      ?auto_97229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97226 ?auto_97227 ) ) ( not ( = ?auto_97226 ?auto_97228 ) ) ( not ( = ?auto_97227 ?auto_97228 ) ) ( not ( = ?auto_97226 ?auto_97232 ) ) ( not ( = ?auto_97227 ?auto_97232 ) ) ( not ( = ?auto_97228 ?auto_97232 ) ) ( ON-TABLE ?auto_97231 ) ( ON ?auto_97233 ?auto_97231 ) ( ON ?auto_97230 ?auto_97233 ) ( ON ?auto_97232 ?auto_97230 ) ( not ( = ?auto_97231 ?auto_97233 ) ) ( not ( = ?auto_97231 ?auto_97230 ) ) ( not ( = ?auto_97231 ?auto_97232 ) ) ( not ( = ?auto_97231 ?auto_97228 ) ) ( not ( = ?auto_97231 ?auto_97227 ) ) ( not ( = ?auto_97233 ?auto_97230 ) ) ( not ( = ?auto_97233 ?auto_97232 ) ) ( not ( = ?auto_97233 ?auto_97228 ) ) ( not ( = ?auto_97233 ?auto_97227 ) ) ( not ( = ?auto_97230 ?auto_97232 ) ) ( not ( = ?auto_97230 ?auto_97228 ) ) ( not ( = ?auto_97230 ?auto_97227 ) ) ( not ( = ?auto_97226 ?auto_97231 ) ) ( not ( = ?auto_97226 ?auto_97233 ) ) ( not ( = ?auto_97226 ?auto_97230 ) ) ( ON ?auto_97226 ?auto_97229 ) ( not ( = ?auto_97226 ?auto_97229 ) ) ( not ( = ?auto_97227 ?auto_97229 ) ) ( not ( = ?auto_97228 ?auto_97229 ) ) ( not ( = ?auto_97232 ?auto_97229 ) ) ( not ( = ?auto_97231 ?auto_97229 ) ) ( not ( = ?auto_97233 ?auto_97229 ) ) ( not ( = ?auto_97230 ?auto_97229 ) ) ( ON ?auto_97227 ?auto_97226 ) ( CLEAR ?auto_97227 ) ( ON-TABLE ?auto_97229 ) ( HOLDING ?auto_97228 ) ( CLEAR ?auto_97232 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97231 ?auto_97233 ?auto_97230 ?auto_97232 ?auto_97228 )
      ( MAKE-3PILE ?auto_97226 ?auto_97227 ?auto_97228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97234 - BLOCK
      ?auto_97235 - BLOCK
      ?auto_97236 - BLOCK
    )
    :vars
    (
      ?auto_97238 - BLOCK
      ?auto_97240 - BLOCK
      ?auto_97239 - BLOCK
      ?auto_97241 - BLOCK
      ?auto_97237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97234 ?auto_97235 ) ) ( not ( = ?auto_97234 ?auto_97236 ) ) ( not ( = ?auto_97235 ?auto_97236 ) ) ( not ( = ?auto_97234 ?auto_97238 ) ) ( not ( = ?auto_97235 ?auto_97238 ) ) ( not ( = ?auto_97236 ?auto_97238 ) ) ( ON-TABLE ?auto_97240 ) ( ON ?auto_97239 ?auto_97240 ) ( ON ?auto_97241 ?auto_97239 ) ( ON ?auto_97238 ?auto_97241 ) ( not ( = ?auto_97240 ?auto_97239 ) ) ( not ( = ?auto_97240 ?auto_97241 ) ) ( not ( = ?auto_97240 ?auto_97238 ) ) ( not ( = ?auto_97240 ?auto_97236 ) ) ( not ( = ?auto_97240 ?auto_97235 ) ) ( not ( = ?auto_97239 ?auto_97241 ) ) ( not ( = ?auto_97239 ?auto_97238 ) ) ( not ( = ?auto_97239 ?auto_97236 ) ) ( not ( = ?auto_97239 ?auto_97235 ) ) ( not ( = ?auto_97241 ?auto_97238 ) ) ( not ( = ?auto_97241 ?auto_97236 ) ) ( not ( = ?auto_97241 ?auto_97235 ) ) ( not ( = ?auto_97234 ?auto_97240 ) ) ( not ( = ?auto_97234 ?auto_97239 ) ) ( not ( = ?auto_97234 ?auto_97241 ) ) ( ON ?auto_97234 ?auto_97237 ) ( not ( = ?auto_97234 ?auto_97237 ) ) ( not ( = ?auto_97235 ?auto_97237 ) ) ( not ( = ?auto_97236 ?auto_97237 ) ) ( not ( = ?auto_97238 ?auto_97237 ) ) ( not ( = ?auto_97240 ?auto_97237 ) ) ( not ( = ?auto_97239 ?auto_97237 ) ) ( not ( = ?auto_97241 ?auto_97237 ) ) ( ON ?auto_97235 ?auto_97234 ) ( ON-TABLE ?auto_97237 ) ( CLEAR ?auto_97238 ) ( ON ?auto_97236 ?auto_97235 ) ( CLEAR ?auto_97236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97237 ?auto_97234 ?auto_97235 )
      ( MAKE-3PILE ?auto_97234 ?auto_97235 ?auto_97236 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97242 - BLOCK
      ?auto_97243 - BLOCK
      ?auto_97244 - BLOCK
    )
    :vars
    (
      ?auto_97246 - BLOCK
      ?auto_97245 - BLOCK
      ?auto_97248 - BLOCK
      ?auto_97247 - BLOCK
      ?auto_97249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97242 ?auto_97243 ) ) ( not ( = ?auto_97242 ?auto_97244 ) ) ( not ( = ?auto_97243 ?auto_97244 ) ) ( not ( = ?auto_97242 ?auto_97246 ) ) ( not ( = ?auto_97243 ?auto_97246 ) ) ( not ( = ?auto_97244 ?auto_97246 ) ) ( ON-TABLE ?auto_97245 ) ( ON ?auto_97248 ?auto_97245 ) ( ON ?auto_97247 ?auto_97248 ) ( not ( = ?auto_97245 ?auto_97248 ) ) ( not ( = ?auto_97245 ?auto_97247 ) ) ( not ( = ?auto_97245 ?auto_97246 ) ) ( not ( = ?auto_97245 ?auto_97244 ) ) ( not ( = ?auto_97245 ?auto_97243 ) ) ( not ( = ?auto_97248 ?auto_97247 ) ) ( not ( = ?auto_97248 ?auto_97246 ) ) ( not ( = ?auto_97248 ?auto_97244 ) ) ( not ( = ?auto_97248 ?auto_97243 ) ) ( not ( = ?auto_97247 ?auto_97246 ) ) ( not ( = ?auto_97247 ?auto_97244 ) ) ( not ( = ?auto_97247 ?auto_97243 ) ) ( not ( = ?auto_97242 ?auto_97245 ) ) ( not ( = ?auto_97242 ?auto_97248 ) ) ( not ( = ?auto_97242 ?auto_97247 ) ) ( ON ?auto_97242 ?auto_97249 ) ( not ( = ?auto_97242 ?auto_97249 ) ) ( not ( = ?auto_97243 ?auto_97249 ) ) ( not ( = ?auto_97244 ?auto_97249 ) ) ( not ( = ?auto_97246 ?auto_97249 ) ) ( not ( = ?auto_97245 ?auto_97249 ) ) ( not ( = ?auto_97248 ?auto_97249 ) ) ( not ( = ?auto_97247 ?auto_97249 ) ) ( ON ?auto_97243 ?auto_97242 ) ( ON-TABLE ?auto_97249 ) ( ON ?auto_97244 ?auto_97243 ) ( CLEAR ?auto_97244 ) ( HOLDING ?auto_97246 ) ( CLEAR ?auto_97247 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97245 ?auto_97248 ?auto_97247 ?auto_97246 )
      ( MAKE-3PILE ?auto_97242 ?auto_97243 ?auto_97244 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97250 - BLOCK
      ?auto_97251 - BLOCK
      ?auto_97252 - BLOCK
    )
    :vars
    (
      ?auto_97255 - BLOCK
      ?auto_97254 - BLOCK
      ?auto_97256 - BLOCK
      ?auto_97253 - BLOCK
      ?auto_97257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97250 ?auto_97251 ) ) ( not ( = ?auto_97250 ?auto_97252 ) ) ( not ( = ?auto_97251 ?auto_97252 ) ) ( not ( = ?auto_97250 ?auto_97255 ) ) ( not ( = ?auto_97251 ?auto_97255 ) ) ( not ( = ?auto_97252 ?auto_97255 ) ) ( ON-TABLE ?auto_97254 ) ( ON ?auto_97256 ?auto_97254 ) ( ON ?auto_97253 ?auto_97256 ) ( not ( = ?auto_97254 ?auto_97256 ) ) ( not ( = ?auto_97254 ?auto_97253 ) ) ( not ( = ?auto_97254 ?auto_97255 ) ) ( not ( = ?auto_97254 ?auto_97252 ) ) ( not ( = ?auto_97254 ?auto_97251 ) ) ( not ( = ?auto_97256 ?auto_97253 ) ) ( not ( = ?auto_97256 ?auto_97255 ) ) ( not ( = ?auto_97256 ?auto_97252 ) ) ( not ( = ?auto_97256 ?auto_97251 ) ) ( not ( = ?auto_97253 ?auto_97255 ) ) ( not ( = ?auto_97253 ?auto_97252 ) ) ( not ( = ?auto_97253 ?auto_97251 ) ) ( not ( = ?auto_97250 ?auto_97254 ) ) ( not ( = ?auto_97250 ?auto_97256 ) ) ( not ( = ?auto_97250 ?auto_97253 ) ) ( ON ?auto_97250 ?auto_97257 ) ( not ( = ?auto_97250 ?auto_97257 ) ) ( not ( = ?auto_97251 ?auto_97257 ) ) ( not ( = ?auto_97252 ?auto_97257 ) ) ( not ( = ?auto_97255 ?auto_97257 ) ) ( not ( = ?auto_97254 ?auto_97257 ) ) ( not ( = ?auto_97256 ?auto_97257 ) ) ( not ( = ?auto_97253 ?auto_97257 ) ) ( ON ?auto_97251 ?auto_97250 ) ( ON-TABLE ?auto_97257 ) ( ON ?auto_97252 ?auto_97251 ) ( CLEAR ?auto_97253 ) ( ON ?auto_97255 ?auto_97252 ) ( CLEAR ?auto_97255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97257 ?auto_97250 ?auto_97251 ?auto_97252 )
      ( MAKE-3PILE ?auto_97250 ?auto_97251 ?auto_97252 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97258 - BLOCK
      ?auto_97259 - BLOCK
      ?auto_97260 - BLOCK
    )
    :vars
    (
      ?auto_97264 - BLOCK
      ?auto_97262 - BLOCK
      ?auto_97261 - BLOCK
      ?auto_97265 - BLOCK
      ?auto_97263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97258 ?auto_97259 ) ) ( not ( = ?auto_97258 ?auto_97260 ) ) ( not ( = ?auto_97259 ?auto_97260 ) ) ( not ( = ?auto_97258 ?auto_97264 ) ) ( not ( = ?auto_97259 ?auto_97264 ) ) ( not ( = ?auto_97260 ?auto_97264 ) ) ( ON-TABLE ?auto_97262 ) ( ON ?auto_97261 ?auto_97262 ) ( not ( = ?auto_97262 ?auto_97261 ) ) ( not ( = ?auto_97262 ?auto_97265 ) ) ( not ( = ?auto_97262 ?auto_97264 ) ) ( not ( = ?auto_97262 ?auto_97260 ) ) ( not ( = ?auto_97262 ?auto_97259 ) ) ( not ( = ?auto_97261 ?auto_97265 ) ) ( not ( = ?auto_97261 ?auto_97264 ) ) ( not ( = ?auto_97261 ?auto_97260 ) ) ( not ( = ?auto_97261 ?auto_97259 ) ) ( not ( = ?auto_97265 ?auto_97264 ) ) ( not ( = ?auto_97265 ?auto_97260 ) ) ( not ( = ?auto_97265 ?auto_97259 ) ) ( not ( = ?auto_97258 ?auto_97262 ) ) ( not ( = ?auto_97258 ?auto_97261 ) ) ( not ( = ?auto_97258 ?auto_97265 ) ) ( ON ?auto_97258 ?auto_97263 ) ( not ( = ?auto_97258 ?auto_97263 ) ) ( not ( = ?auto_97259 ?auto_97263 ) ) ( not ( = ?auto_97260 ?auto_97263 ) ) ( not ( = ?auto_97264 ?auto_97263 ) ) ( not ( = ?auto_97262 ?auto_97263 ) ) ( not ( = ?auto_97261 ?auto_97263 ) ) ( not ( = ?auto_97265 ?auto_97263 ) ) ( ON ?auto_97259 ?auto_97258 ) ( ON-TABLE ?auto_97263 ) ( ON ?auto_97260 ?auto_97259 ) ( ON ?auto_97264 ?auto_97260 ) ( CLEAR ?auto_97264 ) ( HOLDING ?auto_97265 ) ( CLEAR ?auto_97261 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97262 ?auto_97261 ?auto_97265 )
      ( MAKE-3PILE ?auto_97258 ?auto_97259 ?auto_97260 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97266 - BLOCK
      ?auto_97267 - BLOCK
      ?auto_97268 - BLOCK
    )
    :vars
    (
      ?auto_97269 - BLOCK
      ?auto_97273 - BLOCK
      ?auto_97270 - BLOCK
      ?auto_97271 - BLOCK
      ?auto_97272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97266 ?auto_97267 ) ) ( not ( = ?auto_97266 ?auto_97268 ) ) ( not ( = ?auto_97267 ?auto_97268 ) ) ( not ( = ?auto_97266 ?auto_97269 ) ) ( not ( = ?auto_97267 ?auto_97269 ) ) ( not ( = ?auto_97268 ?auto_97269 ) ) ( ON-TABLE ?auto_97273 ) ( ON ?auto_97270 ?auto_97273 ) ( not ( = ?auto_97273 ?auto_97270 ) ) ( not ( = ?auto_97273 ?auto_97271 ) ) ( not ( = ?auto_97273 ?auto_97269 ) ) ( not ( = ?auto_97273 ?auto_97268 ) ) ( not ( = ?auto_97273 ?auto_97267 ) ) ( not ( = ?auto_97270 ?auto_97271 ) ) ( not ( = ?auto_97270 ?auto_97269 ) ) ( not ( = ?auto_97270 ?auto_97268 ) ) ( not ( = ?auto_97270 ?auto_97267 ) ) ( not ( = ?auto_97271 ?auto_97269 ) ) ( not ( = ?auto_97271 ?auto_97268 ) ) ( not ( = ?auto_97271 ?auto_97267 ) ) ( not ( = ?auto_97266 ?auto_97273 ) ) ( not ( = ?auto_97266 ?auto_97270 ) ) ( not ( = ?auto_97266 ?auto_97271 ) ) ( ON ?auto_97266 ?auto_97272 ) ( not ( = ?auto_97266 ?auto_97272 ) ) ( not ( = ?auto_97267 ?auto_97272 ) ) ( not ( = ?auto_97268 ?auto_97272 ) ) ( not ( = ?auto_97269 ?auto_97272 ) ) ( not ( = ?auto_97273 ?auto_97272 ) ) ( not ( = ?auto_97270 ?auto_97272 ) ) ( not ( = ?auto_97271 ?auto_97272 ) ) ( ON ?auto_97267 ?auto_97266 ) ( ON-TABLE ?auto_97272 ) ( ON ?auto_97268 ?auto_97267 ) ( ON ?auto_97269 ?auto_97268 ) ( CLEAR ?auto_97270 ) ( ON ?auto_97271 ?auto_97269 ) ( CLEAR ?auto_97271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97272 ?auto_97266 ?auto_97267 ?auto_97268 ?auto_97269 )
      ( MAKE-3PILE ?auto_97266 ?auto_97267 ?auto_97268 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97274 - BLOCK
      ?auto_97275 - BLOCK
      ?auto_97276 - BLOCK
    )
    :vars
    (
      ?auto_97281 - BLOCK
      ?auto_97279 - BLOCK
      ?auto_97280 - BLOCK
      ?auto_97277 - BLOCK
      ?auto_97278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97274 ?auto_97275 ) ) ( not ( = ?auto_97274 ?auto_97276 ) ) ( not ( = ?auto_97275 ?auto_97276 ) ) ( not ( = ?auto_97274 ?auto_97281 ) ) ( not ( = ?auto_97275 ?auto_97281 ) ) ( not ( = ?auto_97276 ?auto_97281 ) ) ( ON-TABLE ?auto_97279 ) ( not ( = ?auto_97279 ?auto_97280 ) ) ( not ( = ?auto_97279 ?auto_97277 ) ) ( not ( = ?auto_97279 ?auto_97281 ) ) ( not ( = ?auto_97279 ?auto_97276 ) ) ( not ( = ?auto_97279 ?auto_97275 ) ) ( not ( = ?auto_97280 ?auto_97277 ) ) ( not ( = ?auto_97280 ?auto_97281 ) ) ( not ( = ?auto_97280 ?auto_97276 ) ) ( not ( = ?auto_97280 ?auto_97275 ) ) ( not ( = ?auto_97277 ?auto_97281 ) ) ( not ( = ?auto_97277 ?auto_97276 ) ) ( not ( = ?auto_97277 ?auto_97275 ) ) ( not ( = ?auto_97274 ?auto_97279 ) ) ( not ( = ?auto_97274 ?auto_97280 ) ) ( not ( = ?auto_97274 ?auto_97277 ) ) ( ON ?auto_97274 ?auto_97278 ) ( not ( = ?auto_97274 ?auto_97278 ) ) ( not ( = ?auto_97275 ?auto_97278 ) ) ( not ( = ?auto_97276 ?auto_97278 ) ) ( not ( = ?auto_97281 ?auto_97278 ) ) ( not ( = ?auto_97279 ?auto_97278 ) ) ( not ( = ?auto_97280 ?auto_97278 ) ) ( not ( = ?auto_97277 ?auto_97278 ) ) ( ON ?auto_97275 ?auto_97274 ) ( ON-TABLE ?auto_97278 ) ( ON ?auto_97276 ?auto_97275 ) ( ON ?auto_97281 ?auto_97276 ) ( ON ?auto_97277 ?auto_97281 ) ( CLEAR ?auto_97277 ) ( HOLDING ?auto_97280 ) ( CLEAR ?auto_97279 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97279 ?auto_97280 )
      ( MAKE-3PILE ?auto_97274 ?auto_97275 ?auto_97276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97282 - BLOCK
      ?auto_97283 - BLOCK
      ?auto_97284 - BLOCK
    )
    :vars
    (
      ?auto_97288 - BLOCK
      ?auto_97289 - BLOCK
      ?auto_97287 - BLOCK
      ?auto_97286 - BLOCK
      ?auto_97285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97282 ?auto_97283 ) ) ( not ( = ?auto_97282 ?auto_97284 ) ) ( not ( = ?auto_97283 ?auto_97284 ) ) ( not ( = ?auto_97282 ?auto_97288 ) ) ( not ( = ?auto_97283 ?auto_97288 ) ) ( not ( = ?auto_97284 ?auto_97288 ) ) ( ON-TABLE ?auto_97289 ) ( not ( = ?auto_97289 ?auto_97287 ) ) ( not ( = ?auto_97289 ?auto_97286 ) ) ( not ( = ?auto_97289 ?auto_97288 ) ) ( not ( = ?auto_97289 ?auto_97284 ) ) ( not ( = ?auto_97289 ?auto_97283 ) ) ( not ( = ?auto_97287 ?auto_97286 ) ) ( not ( = ?auto_97287 ?auto_97288 ) ) ( not ( = ?auto_97287 ?auto_97284 ) ) ( not ( = ?auto_97287 ?auto_97283 ) ) ( not ( = ?auto_97286 ?auto_97288 ) ) ( not ( = ?auto_97286 ?auto_97284 ) ) ( not ( = ?auto_97286 ?auto_97283 ) ) ( not ( = ?auto_97282 ?auto_97289 ) ) ( not ( = ?auto_97282 ?auto_97287 ) ) ( not ( = ?auto_97282 ?auto_97286 ) ) ( ON ?auto_97282 ?auto_97285 ) ( not ( = ?auto_97282 ?auto_97285 ) ) ( not ( = ?auto_97283 ?auto_97285 ) ) ( not ( = ?auto_97284 ?auto_97285 ) ) ( not ( = ?auto_97288 ?auto_97285 ) ) ( not ( = ?auto_97289 ?auto_97285 ) ) ( not ( = ?auto_97287 ?auto_97285 ) ) ( not ( = ?auto_97286 ?auto_97285 ) ) ( ON ?auto_97283 ?auto_97282 ) ( ON-TABLE ?auto_97285 ) ( ON ?auto_97284 ?auto_97283 ) ( ON ?auto_97288 ?auto_97284 ) ( ON ?auto_97286 ?auto_97288 ) ( CLEAR ?auto_97289 ) ( ON ?auto_97287 ?auto_97286 ) ( CLEAR ?auto_97287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97285 ?auto_97282 ?auto_97283 ?auto_97284 ?auto_97288 ?auto_97286 )
      ( MAKE-3PILE ?auto_97282 ?auto_97283 ?auto_97284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97290 - BLOCK
      ?auto_97291 - BLOCK
      ?auto_97292 - BLOCK
    )
    :vars
    (
      ?auto_97293 - BLOCK
      ?auto_97295 - BLOCK
      ?auto_97297 - BLOCK
      ?auto_97296 - BLOCK
      ?auto_97294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97290 ?auto_97291 ) ) ( not ( = ?auto_97290 ?auto_97292 ) ) ( not ( = ?auto_97291 ?auto_97292 ) ) ( not ( = ?auto_97290 ?auto_97293 ) ) ( not ( = ?auto_97291 ?auto_97293 ) ) ( not ( = ?auto_97292 ?auto_97293 ) ) ( not ( = ?auto_97295 ?auto_97297 ) ) ( not ( = ?auto_97295 ?auto_97296 ) ) ( not ( = ?auto_97295 ?auto_97293 ) ) ( not ( = ?auto_97295 ?auto_97292 ) ) ( not ( = ?auto_97295 ?auto_97291 ) ) ( not ( = ?auto_97297 ?auto_97296 ) ) ( not ( = ?auto_97297 ?auto_97293 ) ) ( not ( = ?auto_97297 ?auto_97292 ) ) ( not ( = ?auto_97297 ?auto_97291 ) ) ( not ( = ?auto_97296 ?auto_97293 ) ) ( not ( = ?auto_97296 ?auto_97292 ) ) ( not ( = ?auto_97296 ?auto_97291 ) ) ( not ( = ?auto_97290 ?auto_97295 ) ) ( not ( = ?auto_97290 ?auto_97297 ) ) ( not ( = ?auto_97290 ?auto_97296 ) ) ( ON ?auto_97290 ?auto_97294 ) ( not ( = ?auto_97290 ?auto_97294 ) ) ( not ( = ?auto_97291 ?auto_97294 ) ) ( not ( = ?auto_97292 ?auto_97294 ) ) ( not ( = ?auto_97293 ?auto_97294 ) ) ( not ( = ?auto_97295 ?auto_97294 ) ) ( not ( = ?auto_97297 ?auto_97294 ) ) ( not ( = ?auto_97296 ?auto_97294 ) ) ( ON ?auto_97291 ?auto_97290 ) ( ON-TABLE ?auto_97294 ) ( ON ?auto_97292 ?auto_97291 ) ( ON ?auto_97293 ?auto_97292 ) ( ON ?auto_97296 ?auto_97293 ) ( ON ?auto_97297 ?auto_97296 ) ( CLEAR ?auto_97297 ) ( HOLDING ?auto_97295 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97295 )
      ( MAKE-3PILE ?auto_97290 ?auto_97291 ?auto_97292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97298 - BLOCK
      ?auto_97299 - BLOCK
      ?auto_97300 - BLOCK
    )
    :vars
    (
      ?auto_97302 - BLOCK
      ?auto_97303 - BLOCK
      ?auto_97301 - BLOCK
      ?auto_97305 - BLOCK
      ?auto_97304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97298 ?auto_97299 ) ) ( not ( = ?auto_97298 ?auto_97300 ) ) ( not ( = ?auto_97299 ?auto_97300 ) ) ( not ( = ?auto_97298 ?auto_97302 ) ) ( not ( = ?auto_97299 ?auto_97302 ) ) ( not ( = ?auto_97300 ?auto_97302 ) ) ( not ( = ?auto_97303 ?auto_97301 ) ) ( not ( = ?auto_97303 ?auto_97305 ) ) ( not ( = ?auto_97303 ?auto_97302 ) ) ( not ( = ?auto_97303 ?auto_97300 ) ) ( not ( = ?auto_97303 ?auto_97299 ) ) ( not ( = ?auto_97301 ?auto_97305 ) ) ( not ( = ?auto_97301 ?auto_97302 ) ) ( not ( = ?auto_97301 ?auto_97300 ) ) ( not ( = ?auto_97301 ?auto_97299 ) ) ( not ( = ?auto_97305 ?auto_97302 ) ) ( not ( = ?auto_97305 ?auto_97300 ) ) ( not ( = ?auto_97305 ?auto_97299 ) ) ( not ( = ?auto_97298 ?auto_97303 ) ) ( not ( = ?auto_97298 ?auto_97301 ) ) ( not ( = ?auto_97298 ?auto_97305 ) ) ( ON ?auto_97298 ?auto_97304 ) ( not ( = ?auto_97298 ?auto_97304 ) ) ( not ( = ?auto_97299 ?auto_97304 ) ) ( not ( = ?auto_97300 ?auto_97304 ) ) ( not ( = ?auto_97302 ?auto_97304 ) ) ( not ( = ?auto_97303 ?auto_97304 ) ) ( not ( = ?auto_97301 ?auto_97304 ) ) ( not ( = ?auto_97305 ?auto_97304 ) ) ( ON ?auto_97299 ?auto_97298 ) ( ON-TABLE ?auto_97304 ) ( ON ?auto_97300 ?auto_97299 ) ( ON ?auto_97302 ?auto_97300 ) ( ON ?auto_97305 ?auto_97302 ) ( ON ?auto_97301 ?auto_97305 ) ( ON ?auto_97303 ?auto_97301 ) ( CLEAR ?auto_97303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97304 ?auto_97298 ?auto_97299 ?auto_97300 ?auto_97302 ?auto_97305 ?auto_97301 )
      ( MAKE-3PILE ?auto_97298 ?auto_97299 ?auto_97300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97309 - BLOCK
      ?auto_97310 - BLOCK
      ?auto_97311 - BLOCK
    )
    :vars
    (
      ?auto_97312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97312 ?auto_97311 ) ( CLEAR ?auto_97312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97309 ) ( ON ?auto_97310 ?auto_97309 ) ( ON ?auto_97311 ?auto_97310 ) ( not ( = ?auto_97309 ?auto_97310 ) ) ( not ( = ?auto_97309 ?auto_97311 ) ) ( not ( = ?auto_97309 ?auto_97312 ) ) ( not ( = ?auto_97310 ?auto_97311 ) ) ( not ( = ?auto_97310 ?auto_97312 ) ) ( not ( = ?auto_97311 ?auto_97312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97312 ?auto_97311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97313 - BLOCK
      ?auto_97314 - BLOCK
      ?auto_97315 - BLOCK
    )
    :vars
    (
      ?auto_97316 - BLOCK
      ?auto_97317 - BLOCK
      ?auto_97318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97316 ?auto_97315 ) ( CLEAR ?auto_97316 ) ( ON-TABLE ?auto_97313 ) ( ON ?auto_97314 ?auto_97313 ) ( ON ?auto_97315 ?auto_97314 ) ( not ( = ?auto_97313 ?auto_97314 ) ) ( not ( = ?auto_97313 ?auto_97315 ) ) ( not ( = ?auto_97313 ?auto_97316 ) ) ( not ( = ?auto_97314 ?auto_97315 ) ) ( not ( = ?auto_97314 ?auto_97316 ) ) ( not ( = ?auto_97315 ?auto_97316 ) ) ( HOLDING ?auto_97317 ) ( CLEAR ?auto_97318 ) ( not ( = ?auto_97313 ?auto_97317 ) ) ( not ( = ?auto_97313 ?auto_97318 ) ) ( not ( = ?auto_97314 ?auto_97317 ) ) ( not ( = ?auto_97314 ?auto_97318 ) ) ( not ( = ?auto_97315 ?auto_97317 ) ) ( not ( = ?auto_97315 ?auto_97318 ) ) ( not ( = ?auto_97316 ?auto_97317 ) ) ( not ( = ?auto_97316 ?auto_97318 ) ) ( not ( = ?auto_97317 ?auto_97318 ) ) )
    :subtasks
    ( ( !STACK ?auto_97317 ?auto_97318 )
      ( MAKE-3PILE ?auto_97313 ?auto_97314 ?auto_97315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97319 - BLOCK
      ?auto_97320 - BLOCK
      ?auto_97321 - BLOCK
    )
    :vars
    (
      ?auto_97324 - BLOCK
      ?auto_97322 - BLOCK
      ?auto_97323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97324 ?auto_97321 ) ( ON-TABLE ?auto_97319 ) ( ON ?auto_97320 ?auto_97319 ) ( ON ?auto_97321 ?auto_97320 ) ( not ( = ?auto_97319 ?auto_97320 ) ) ( not ( = ?auto_97319 ?auto_97321 ) ) ( not ( = ?auto_97319 ?auto_97324 ) ) ( not ( = ?auto_97320 ?auto_97321 ) ) ( not ( = ?auto_97320 ?auto_97324 ) ) ( not ( = ?auto_97321 ?auto_97324 ) ) ( CLEAR ?auto_97322 ) ( not ( = ?auto_97319 ?auto_97323 ) ) ( not ( = ?auto_97319 ?auto_97322 ) ) ( not ( = ?auto_97320 ?auto_97323 ) ) ( not ( = ?auto_97320 ?auto_97322 ) ) ( not ( = ?auto_97321 ?auto_97323 ) ) ( not ( = ?auto_97321 ?auto_97322 ) ) ( not ( = ?auto_97324 ?auto_97323 ) ) ( not ( = ?auto_97324 ?auto_97322 ) ) ( not ( = ?auto_97323 ?auto_97322 ) ) ( ON ?auto_97323 ?auto_97324 ) ( CLEAR ?auto_97323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97319 ?auto_97320 ?auto_97321 ?auto_97324 )
      ( MAKE-3PILE ?auto_97319 ?auto_97320 ?auto_97321 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97325 - BLOCK
      ?auto_97326 - BLOCK
      ?auto_97327 - BLOCK
    )
    :vars
    (
      ?auto_97330 - BLOCK
      ?auto_97329 - BLOCK
      ?auto_97328 - BLOCK
      ?auto_97331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97330 ?auto_97327 ) ( ON-TABLE ?auto_97325 ) ( ON ?auto_97326 ?auto_97325 ) ( ON ?auto_97327 ?auto_97326 ) ( not ( = ?auto_97325 ?auto_97326 ) ) ( not ( = ?auto_97325 ?auto_97327 ) ) ( not ( = ?auto_97325 ?auto_97330 ) ) ( not ( = ?auto_97326 ?auto_97327 ) ) ( not ( = ?auto_97326 ?auto_97330 ) ) ( not ( = ?auto_97327 ?auto_97330 ) ) ( not ( = ?auto_97325 ?auto_97329 ) ) ( not ( = ?auto_97325 ?auto_97328 ) ) ( not ( = ?auto_97326 ?auto_97329 ) ) ( not ( = ?auto_97326 ?auto_97328 ) ) ( not ( = ?auto_97327 ?auto_97329 ) ) ( not ( = ?auto_97327 ?auto_97328 ) ) ( not ( = ?auto_97330 ?auto_97329 ) ) ( not ( = ?auto_97330 ?auto_97328 ) ) ( not ( = ?auto_97329 ?auto_97328 ) ) ( ON ?auto_97329 ?auto_97330 ) ( CLEAR ?auto_97329 ) ( HOLDING ?auto_97328 ) ( CLEAR ?auto_97331 ) ( ON-TABLE ?auto_97331 ) ( not ( = ?auto_97331 ?auto_97328 ) ) ( not ( = ?auto_97325 ?auto_97331 ) ) ( not ( = ?auto_97326 ?auto_97331 ) ) ( not ( = ?auto_97327 ?auto_97331 ) ) ( not ( = ?auto_97330 ?auto_97331 ) ) ( not ( = ?auto_97329 ?auto_97331 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97331 ?auto_97328 )
      ( MAKE-3PILE ?auto_97325 ?auto_97326 ?auto_97327 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97332 - BLOCK
      ?auto_97333 - BLOCK
      ?auto_97334 - BLOCK
    )
    :vars
    (
      ?auto_97338 - BLOCK
      ?auto_97335 - BLOCK
      ?auto_97336 - BLOCK
      ?auto_97337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97338 ?auto_97334 ) ( ON-TABLE ?auto_97332 ) ( ON ?auto_97333 ?auto_97332 ) ( ON ?auto_97334 ?auto_97333 ) ( not ( = ?auto_97332 ?auto_97333 ) ) ( not ( = ?auto_97332 ?auto_97334 ) ) ( not ( = ?auto_97332 ?auto_97338 ) ) ( not ( = ?auto_97333 ?auto_97334 ) ) ( not ( = ?auto_97333 ?auto_97338 ) ) ( not ( = ?auto_97334 ?auto_97338 ) ) ( not ( = ?auto_97332 ?auto_97335 ) ) ( not ( = ?auto_97332 ?auto_97336 ) ) ( not ( = ?auto_97333 ?auto_97335 ) ) ( not ( = ?auto_97333 ?auto_97336 ) ) ( not ( = ?auto_97334 ?auto_97335 ) ) ( not ( = ?auto_97334 ?auto_97336 ) ) ( not ( = ?auto_97338 ?auto_97335 ) ) ( not ( = ?auto_97338 ?auto_97336 ) ) ( not ( = ?auto_97335 ?auto_97336 ) ) ( ON ?auto_97335 ?auto_97338 ) ( CLEAR ?auto_97337 ) ( ON-TABLE ?auto_97337 ) ( not ( = ?auto_97337 ?auto_97336 ) ) ( not ( = ?auto_97332 ?auto_97337 ) ) ( not ( = ?auto_97333 ?auto_97337 ) ) ( not ( = ?auto_97334 ?auto_97337 ) ) ( not ( = ?auto_97338 ?auto_97337 ) ) ( not ( = ?auto_97335 ?auto_97337 ) ) ( ON ?auto_97336 ?auto_97335 ) ( CLEAR ?auto_97336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97332 ?auto_97333 ?auto_97334 ?auto_97338 ?auto_97335 )
      ( MAKE-3PILE ?auto_97332 ?auto_97333 ?auto_97334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97339 - BLOCK
      ?auto_97340 - BLOCK
      ?auto_97341 - BLOCK
    )
    :vars
    (
      ?auto_97343 - BLOCK
      ?auto_97344 - BLOCK
      ?auto_97342 - BLOCK
      ?auto_97345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97343 ?auto_97341 ) ( ON-TABLE ?auto_97339 ) ( ON ?auto_97340 ?auto_97339 ) ( ON ?auto_97341 ?auto_97340 ) ( not ( = ?auto_97339 ?auto_97340 ) ) ( not ( = ?auto_97339 ?auto_97341 ) ) ( not ( = ?auto_97339 ?auto_97343 ) ) ( not ( = ?auto_97340 ?auto_97341 ) ) ( not ( = ?auto_97340 ?auto_97343 ) ) ( not ( = ?auto_97341 ?auto_97343 ) ) ( not ( = ?auto_97339 ?auto_97344 ) ) ( not ( = ?auto_97339 ?auto_97342 ) ) ( not ( = ?auto_97340 ?auto_97344 ) ) ( not ( = ?auto_97340 ?auto_97342 ) ) ( not ( = ?auto_97341 ?auto_97344 ) ) ( not ( = ?auto_97341 ?auto_97342 ) ) ( not ( = ?auto_97343 ?auto_97344 ) ) ( not ( = ?auto_97343 ?auto_97342 ) ) ( not ( = ?auto_97344 ?auto_97342 ) ) ( ON ?auto_97344 ?auto_97343 ) ( not ( = ?auto_97345 ?auto_97342 ) ) ( not ( = ?auto_97339 ?auto_97345 ) ) ( not ( = ?auto_97340 ?auto_97345 ) ) ( not ( = ?auto_97341 ?auto_97345 ) ) ( not ( = ?auto_97343 ?auto_97345 ) ) ( not ( = ?auto_97344 ?auto_97345 ) ) ( ON ?auto_97342 ?auto_97344 ) ( CLEAR ?auto_97342 ) ( HOLDING ?auto_97345 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97345 )
      ( MAKE-3PILE ?auto_97339 ?auto_97340 ?auto_97341 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97346 - BLOCK
      ?auto_97347 - BLOCK
      ?auto_97348 - BLOCK
    )
    :vars
    (
      ?auto_97351 - BLOCK
      ?auto_97349 - BLOCK
      ?auto_97352 - BLOCK
      ?auto_97350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97351 ?auto_97348 ) ( ON-TABLE ?auto_97346 ) ( ON ?auto_97347 ?auto_97346 ) ( ON ?auto_97348 ?auto_97347 ) ( not ( = ?auto_97346 ?auto_97347 ) ) ( not ( = ?auto_97346 ?auto_97348 ) ) ( not ( = ?auto_97346 ?auto_97351 ) ) ( not ( = ?auto_97347 ?auto_97348 ) ) ( not ( = ?auto_97347 ?auto_97351 ) ) ( not ( = ?auto_97348 ?auto_97351 ) ) ( not ( = ?auto_97346 ?auto_97349 ) ) ( not ( = ?auto_97346 ?auto_97352 ) ) ( not ( = ?auto_97347 ?auto_97349 ) ) ( not ( = ?auto_97347 ?auto_97352 ) ) ( not ( = ?auto_97348 ?auto_97349 ) ) ( not ( = ?auto_97348 ?auto_97352 ) ) ( not ( = ?auto_97351 ?auto_97349 ) ) ( not ( = ?auto_97351 ?auto_97352 ) ) ( not ( = ?auto_97349 ?auto_97352 ) ) ( ON ?auto_97349 ?auto_97351 ) ( not ( = ?auto_97350 ?auto_97352 ) ) ( not ( = ?auto_97346 ?auto_97350 ) ) ( not ( = ?auto_97347 ?auto_97350 ) ) ( not ( = ?auto_97348 ?auto_97350 ) ) ( not ( = ?auto_97351 ?auto_97350 ) ) ( not ( = ?auto_97349 ?auto_97350 ) ) ( ON ?auto_97352 ?auto_97349 ) ( ON ?auto_97350 ?auto_97352 ) ( CLEAR ?auto_97350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97346 ?auto_97347 ?auto_97348 ?auto_97351 ?auto_97349 ?auto_97352 )
      ( MAKE-3PILE ?auto_97346 ?auto_97347 ?auto_97348 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97353 - BLOCK
      ?auto_97354 - BLOCK
      ?auto_97355 - BLOCK
    )
    :vars
    (
      ?auto_97358 - BLOCK
      ?auto_97356 - BLOCK
      ?auto_97359 - BLOCK
      ?auto_97357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97358 ?auto_97355 ) ( ON-TABLE ?auto_97353 ) ( ON ?auto_97354 ?auto_97353 ) ( ON ?auto_97355 ?auto_97354 ) ( not ( = ?auto_97353 ?auto_97354 ) ) ( not ( = ?auto_97353 ?auto_97355 ) ) ( not ( = ?auto_97353 ?auto_97358 ) ) ( not ( = ?auto_97354 ?auto_97355 ) ) ( not ( = ?auto_97354 ?auto_97358 ) ) ( not ( = ?auto_97355 ?auto_97358 ) ) ( not ( = ?auto_97353 ?auto_97356 ) ) ( not ( = ?auto_97353 ?auto_97359 ) ) ( not ( = ?auto_97354 ?auto_97356 ) ) ( not ( = ?auto_97354 ?auto_97359 ) ) ( not ( = ?auto_97355 ?auto_97356 ) ) ( not ( = ?auto_97355 ?auto_97359 ) ) ( not ( = ?auto_97358 ?auto_97356 ) ) ( not ( = ?auto_97358 ?auto_97359 ) ) ( not ( = ?auto_97356 ?auto_97359 ) ) ( ON ?auto_97356 ?auto_97358 ) ( not ( = ?auto_97357 ?auto_97359 ) ) ( not ( = ?auto_97353 ?auto_97357 ) ) ( not ( = ?auto_97354 ?auto_97357 ) ) ( not ( = ?auto_97355 ?auto_97357 ) ) ( not ( = ?auto_97358 ?auto_97357 ) ) ( not ( = ?auto_97356 ?auto_97357 ) ) ( ON ?auto_97359 ?auto_97356 ) ( HOLDING ?auto_97357 ) ( CLEAR ?auto_97359 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97353 ?auto_97354 ?auto_97355 ?auto_97358 ?auto_97356 ?auto_97359 ?auto_97357 )
      ( MAKE-3PILE ?auto_97353 ?auto_97354 ?auto_97355 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97360 - BLOCK
      ?auto_97361 - BLOCK
      ?auto_97362 - BLOCK
    )
    :vars
    (
      ?auto_97365 - BLOCK
      ?auto_97364 - BLOCK
      ?auto_97363 - BLOCK
      ?auto_97366 - BLOCK
      ?auto_97367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97365 ?auto_97362 ) ( ON-TABLE ?auto_97360 ) ( ON ?auto_97361 ?auto_97360 ) ( ON ?auto_97362 ?auto_97361 ) ( not ( = ?auto_97360 ?auto_97361 ) ) ( not ( = ?auto_97360 ?auto_97362 ) ) ( not ( = ?auto_97360 ?auto_97365 ) ) ( not ( = ?auto_97361 ?auto_97362 ) ) ( not ( = ?auto_97361 ?auto_97365 ) ) ( not ( = ?auto_97362 ?auto_97365 ) ) ( not ( = ?auto_97360 ?auto_97364 ) ) ( not ( = ?auto_97360 ?auto_97363 ) ) ( not ( = ?auto_97361 ?auto_97364 ) ) ( not ( = ?auto_97361 ?auto_97363 ) ) ( not ( = ?auto_97362 ?auto_97364 ) ) ( not ( = ?auto_97362 ?auto_97363 ) ) ( not ( = ?auto_97365 ?auto_97364 ) ) ( not ( = ?auto_97365 ?auto_97363 ) ) ( not ( = ?auto_97364 ?auto_97363 ) ) ( ON ?auto_97364 ?auto_97365 ) ( not ( = ?auto_97366 ?auto_97363 ) ) ( not ( = ?auto_97360 ?auto_97366 ) ) ( not ( = ?auto_97361 ?auto_97366 ) ) ( not ( = ?auto_97362 ?auto_97366 ) ) ( not ( = ?auto_97365 ?auto_97366 ) ) ( not ( = ?auto_97364 ?auto_97366 ) ) ( ON ?auto_97363 ?auto_97364 ) ( CLEAR ?auto_97363 ) ( ON ?auto_97366 ?auto_97367 ) ( CLEAR ?auto_97366 ) ( HAND-EMPTY ) ( not ( = ?auto_97360 ?auto_97367 ) ) ( not ( = ?auto_97361 ?auto_97367 ) ) ( not ( = ?auto_97362 ?auto_97367 ) ) ( not ( = ?auto_97365 ?auto_97367 ) ) ( not ( = ?auto_97364 ?auto_97367 ) ) ( not ( = ?auto_97363 ?auto_97367 ) ) ( not ( = ?auto_97366 ?auto_97367 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97366 ?auto_97367 )
      ( MAKE-3PILE ?auto_97360 ?auto_97361 ?auto_97362 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97368 - BLOCK
      ?auto_97369 - BLOCK
      ?auto_97370 - BLOCK
    )
    :vars
    (
      ?auto_97371 - BLOCK
      ?auto_97373 - BLOCK
      ?auto_97372 - BLOCK
      ?auto_97375 - BLOCK
      ?auto_97374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97371 ?auto_97370 ) ( ON-TABLE ?auto_97368 ) ( ON ?auto_97369 ?auto_97368 ) ( ON ?auto_97370 ?auto_97369 ) ( not ( = ?auto_97368 ?auto_97369 ) ) ( not ( = ?auto_97368 ?auto_97370 ) ) ( not ( = ?auto_97368 ?auto_97371 ) ) ( not ( = ?auto_97369 ?auto_97370 ) ) ( not ( = ?auto_97369 ?auto_97371 ) ) ( not ( = ?auto_97370 ?auto_97371 ) ) ( not ( = ?auto_97368 ?auto_97373 ) ) ( not ( = ?auto_97368 ?auto_97372 ) ) ( not ( = ?auto_97369 ?auto_97373 ) ) ( not ( = ?auto_97369 ?auto_97372 ) ) ( not ( = ?auto_97370 ?auto_97373 ) ) ( not ( = ?auto_97370 ?auto_97372 ) ) ( not ( = ?auto_97371 ?auto_97373 ) ) ( not ( = ?auto_97371 ?auto_97372 ) ) ( not ( = ?auto_97373 ?auto_97372 ) ) ( ON ?auto_97373 ?auto_97371 ) ( not ( = ?auto_97375 ?auto_97372 ) ) ( not ( = ?auto_97368 ?auto_97375 ) ) ( not ( = ?auto_97369 ?auto_97375 ) ) ( not ( = ?auto_97370 ?auto_97375 ) ) ( not ( = ?auto_97371 ?auto_97375 ) ) ( not ( = ?auto_97373 ?auto_97375 ) ) ( ON ?auto_97375 ?auto_97374 ) ( CLEAR ?auto_97375 ) ( not ( = ?auto_97368 ?auto_97374 ) ) ( not ( = ?auto_97369 ?auto_97374 ) ) ( not ( = ?auto_97370 ?auto_97374 ) ) ( not ( = ?auto_97371 ?auto_97374 ) ) ( not ( = ?auto_97373 ?auto_97374 ) ) ( not ( = ?auto_97372 ?auto_97374 ) ) ( not ( = ?auto_97375 ?auto_97374 ) ) ( HOLDING ?auto_97372 ) ( CLEAR ?auto_97373 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97368 ?auto_97369 ?auto_97370 ?auto_97371 ?auto_97373 ?auto_97372 )
      ( MAKE-3PILE ?auto_97368 ?auto_97369 ?auto_97370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97376 - BLOCK
      ?auto_97377 - BLOCK
      ?auto_97378 - BLOCK
    )
    :vars
    (
      ?auto_97382 - BLOCK
      ?auto_97379 - BLOCK
      ?auto_97383 - BLOCK
      ?auto_97381 - BLOCK
      ?auto_97380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97382 ?auto_97378 ) ( ON-TABLE ?auto_97376 ) ( ON ?auto_97377 ?auto_97376 ) ( ON ?auto_97378 ?auto_97377 ) ( not ( = ?auto_97376 ?auto_97377 ) ) ( not ( = ?auto_97376 ?auto_97378 ) ) ( not ( = ?auto_97376 ?auto_97382 ) ) ( not ( = ?auto_97377 ?auto_97378 ) ) ( not ( = ?auto_97377 ?auto_97382 ) ) ( not ( = ?auto_97378 ?auto_97382 ) ) ( not ( = ?auto_97376 ?auto_97379 ) ) ( not ( = ?auto_97376 ?auto_97383 ) ) ( not ( = ?auto_97377 ?auto_97379 ) ) ( not ( = ?auto_97377 ?auto_97383 ) ) ( not ( = ?auto_97378 ?auto_97379 ) ) ( not ( = ?auto_97378 ?auto_97383 ) ) ( not ( = ?auto_97382 ?auto_97379 ) ) ( not ( = ?auto_97382 ?auto_97383 ) ) ( not ( = ?auto_97379 ?auto_97383 ) ) ( ON ?auto_97379 ?auto_97382 ) ( not ( = ?auto_97381 ?auto_97383 ) ) ( not ( = ?auto_97376 ?auto_97381 ) ) ( not ( = ?auto_97377 ?auto_97381 ) ) ( not ( = ?auto_97378 ?auto_97381 ) ) ( not ( = ?auto_97382 ?auto_97381 ) ) ( not ( = ?auto_97379 ?auto_97381 ) ) ( ON ?auto_97381 ?auto_97380 ) ( not ( = ?auto_97376 ?auto_97380 ) ) ( not ( = ?auto_97377 ?auto_97380 ) ) ( not ( = ?auto_97378 ?auto_97380 ) ) ( not ( = ?auto_97382 ?auto_97380 ) ) ( not ( = ?auto_97379 ?auto_97380 ) ) ( not ( = ?auto_97383 ?auto_97380 ) ) ( not ( = ?auto_97381 ?auto_97380 ) ) ( CLEAR ?auto_97379 ) ( ON ?auto_97383 ?auto_97381 ) ( CLEAR ?auto_97383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97380 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97380 ?auto_97381 )
      ( MAKE-3PILE ?auto_97376 ?auto_97377 ?auto_97378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97384 - BLOCK
      ?auto_97385 - BLOCK
      ?auto_97386 - BLOCK
    )
    :vars
    (
      ?auto_97387 - BLOCK
      ?auto_97391 - BLOCK
      ?auto_97388 - BLOCK
      ?auto_97389 - BLOCK
      ?auto_97390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97387 ?auto_97386 ) ( ON-TABLE ?auto_97384 ) ( ON ?auto_97385 ?auto_97384 ) ( ON ?auto_97386 ?auto_97385 ) ( not ( = ?auto_97384 ?auto_97385 ) ) ( not ( = ?auto_97384 ?auto_97386 ) ) ( not ( = ?auto_97384 ?auto_97387 ) ) ( not ( = ?auto_97385 ?auto_97386 ) ) ( not ( = ?auto_97385 ?auto_97387 ) ) ( not ( = ?auto_97386 ?auto_97387 ) ) ( not ( = ?auto_97384 ?auto_97391 ) ) ( not ( = ?auto_97384 ?auto_97388 ) ) ( not ( = ?auto_97385 ?auto_97391 ) ) ( not ( = ?auto_97385 ?auto_97388 ) ) ( not ( = ?auto_97386 ?auto_97391 ) ) ( not ( = ?auto_97386 ?auto_97388 ) ) ( not ( = ?auto_97387 ?auto_97391 ) ) ( not ( = ?auto_97387 ?auto_97388 ) ) ( not ( = ?auto_97391 ?auto_97388 ) ) ( not ( = ?auto_97389 ?auto_97388 ) ) ( not ( = ?auto_97384 ?auto_97389 ) ) ( not ( = ?auto_97385 ?auto_97389 ) ) ( not ( = ?auto_97386 ?auto_97389 ) ) ( not ( = ?auto_97387 ?auto_97389 ) ) ( not ( = ?auto_97391 ?auto_97389 ) ) ( ON ?auto_97389 ?auto_97390 ) ( not ( = ?auto_97384 ?auto_97390 ) ) ( not ( = ?auto_97385 ?auto_97390 ) ) ( not ( = ?auto_97386 ?auto_97390 ) ) ( not ( = ?auto_97387 ?auto_97390 ) ) ( not ( = ?auto_97391 ?auto_97390 ) ) ( not ( = ?auto_97388 ?auto_97390 ) ) ( not ( = ?auto_97389 ?auto_97390 ) ) ( ON ?auto_97388 ?auto_97389 ) ( CLEAR ?auto_97388 ) ( ON-TABLE ?auto_97390 ) ( HOLDING ?auto_97391 ) ( CLEAR ?auto_97387 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97384 ?auto_97385 ?auto_97386 ?auto_97387 ?auto_97391 )
      ( MAKE-3PILE ?auto_97384 ?auto_97385 ?auto_97386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97392 - BLOCK
      ?auto_97393 - BLOCK
      ?auto_97394 - BLOCK
    )
    :vars
    (
      ?auto_97399 - BLOCK
      ?auto_97395 - BLOCK
      ?auto_97398 - BLOCK
      ?auto_97396 - BLOCK
      ?auto_97397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97399 ?auto_97394 ) ( ON-TABLE ?auto_97392 ) ( ON ?auto_97393 ?auto_97392 ) ( ON ?auto_97394 ?auto_97393 ) ( not ( = ?auto_97392 ?auto_97393 ) ) ( not ( = ?auto_97392 ?auto_97394 ) ) ( not ( = ?auto_97392 ?auto_97399 ) ) ( not ( = ?auto_97393 ?auto_97394 ) ) ( not ( = ?auto_97393 ?auto_97399 ) ) ( not ( = ?auto_97394 ?auto_97399 ) ) ( not ( = ?auto_97392 ?auto_97395 ) ) ( not ( = ?auto_97392 ?auto_97398 ) ) ( not ( = ?auto_97393 ?auto_97395 ) ) ( not ( = ?auto_97393 ?auto_97398 ) ) ( not ( = ?auto_97394 ?auto_97395 ) ) ( not ( = ?auto_97394 ?auto_97398 ) ) ( not ( = ?auto_97399 ?auto_97395 ) ) ( not ( = ?auto_97399 ?auto_97398 ) ) ( not ( = ?auto_97395 ?auto_97398 ) ) ( not ( = ?auto_97396 ?auto_97398 ) ) ( not ( = ?auto_97392 ?auto_97396 ) ) ( not ( = ?auto_97393 ?auto_97396 ) ) ( not ( = ?auto_97394 ?auto_97396 ) ) ( not ( = ?auto_97399 ?auto_97396 ) ) ( not ( = ?auto_97395 ?auto_97396 ) ) ( ON ?auto_97396 ?auto_97397 ) ( not ( = ?auto_97392 ?auto_97397 ) ) ( not ( = ?auto_97393 ?auto_97397 ) ) ( not ( = ?auto_97394 ?auto_97397 ) ) ( not ( = ?auto_97399 ?auto_97397 ) ) ( not ( = ?auto_97395 ?auto_97397 ) ) ( not ( = ?auto_97398 ?auto_97397 ) ) ( not ( = ?auto_97396 ?auto_97397 ) ) ( ON ?auto_97398 ?auto_97396 ) ( ON-TABLE ?auto_97397 ) ( CLEAR ?auto_97399 ) ( ON ?auto_97395 ?auto_97398 ) ( CLEAR ?auto_97395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97397 ?auto_97396 ?auto_97398 )
      ( MAKE-3PILE ?auto_97392 ?auto_97393 ?auto_97394 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97416 - BLOCK
      ?auto_97417 - BLOCK
      ?auto_97418 - BLOCK
    )
    :vars
    (
      ?auto_97423 - BLOCK
      ?auto_97420 - BLOCK
      ?auto_97422 - BLOCK
      ?auto_97421 - BLOCK
      ?auto_97419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97416 ) ( ON ?auto_97417 ?auto_97416 ) ( not ( = ?auto_97416 ?auto_97417 ) ) ( not ( = ?auto_97416 ?auto_97418 ) ) ( not ( = ?auto_97416 ?auto_97423 ) ) ( not ( = ?auto_97417 ?auto_97418 ) ) ( not ( = ?auto_97417 ?auto_97423 ) ) ( not ( = ?auto_97418 ?auto_97423 ) ) ( not ( = ?auto_97416 ?auto_97420 ) ) ( not ( = ?auto_97416 ?auto_97422 ) ) ( not ( = ?auto_97417 ?auto_97420 ) ) ( not ( = ?auto_97417 ?auto_97422 ) ) ( not ( = ?auto_97418 ?auto_97420 ) ) ( not ( = ?auto_97418 ?auto_97422 ) ) ( not ( = ?auto_97423 ?auto_97420 ) ) ( not ( = ?auto_97423 ?auto_97422 ) ) ( not ( = ?auto_97420 ?auto_97422 ) ) ( not ( = ?auto_97421 ?auto_97422 ) ) ( not ( = ?auto_97416 ?auto_97421 ) ) ( not ( = ?auto_97417 ?auto_97421 ) ) ( not ( = ?auto_97418 ?auto_97421 ) ) ( not ( = ?auto_97423 ?auto_97421 ) ) ( not ( = ?auto_97420 ?auto_97421 ) ) ( ON ?auto_97421 ?auto_97419 ) ( not ( = ?auto_97416 ?auto_97419 ) ) ( not ( = ?auto_97417 ?auto_97419 ) ) ( not ( = ?auto_97418 ?auto_97419 ) ) ( not ( = ?auto_97423 ?auto_97419 ) ) ( not ( = ?auto_97420 ?auto_97419 ) ) ( not ( = ?auto_97422 ?auto_97419 ) ) ( not ( = ?auto_97421 ?auto_97419 ) ) ( ON ?auto_97422 ?auto_97421 ) ( ON-TABLE ?auto_97419 ) ( ON ?auto_97420 ?auto_97422 ) ( ON ?auto_97423 ?auto_97420 ) ( CLEAR ?auto_97423 ) ( HOLDING ?auto_97418 ) ( CLEAR ?auto_97417 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97416 ?auto_97417 ?auto_97418 ?auto_97423 )
      ( MAKE-3PILE ?auto_97416 ?auto_97417 ?auto_97418 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97424 - BLOCK
      ?auto_97425 - BLOCK
      ?auto_97426 - BLOCK
    )
    :vars
    (
      ?auto_97429 - BLOCK
      ?auto_97428 - BLOCK
      ?auto_97431 - BLOCK
      ?auto_97430 - BLOCK
      ?auto_97427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97424 ) ( ON ?auto_97425 ?auto_97424 ) ( not ( = ?auto_97424 ?auto_97425 ) ) ( not ( = ?auto_97424 ?auto_97426 ) ) ( not ( = ?auto_97424 ?auto_97429 ) ) ( not ( = ?auto_97425 ?auto_97426 ) ) ( not ( = ?auto_97425 ?auto_97429 ) ) ( not ( = ?auto_97426 ?auto_97429 ) ) ( not ( = ?auto_97424 ?auto_97428 ) ) ( not ( = ?auto_97424 ?auto_97431 ) ) ( not ( = ?auto_97425 ?auto_97428 ) ) ( not ( = ?auto_97425 ?auto_97431 ) ) ( not ( = ?auto_97426 ?auto_97428 ) ) ( not ( = ?auto_97426 ?auto_97431 ) ) ( not ( = ?auto_97429 ?auto_97428 ) ) ( not ( = ?auto_97429 ?auto_97431 ) ) ( not ( = ?auto_97428 ?auto_97431 ) ) ( not ( = ?auto_97430 ?auto_97431 ) ) ( not ( = ?auto_97424 ?auto_97430 ) ) ( not ( = ?auto_97425 ?auto_97430 ) ) ( not ( = ?auto_97426 ?auto_97430 ) ) ( not ( = ?auto_97429 ?auto_97430 ) ) ( not ( = ?auto_97428 ?auto_97430 ) ) ( ON ?auto_97430 ?auto_97427 ) ( not ( = ?auto_97424 ?auto_97427 ) ) ( not ( = ?auto_97425 ?auto_97427 ) ) ( not ( = ?auto_97426 ?auto_97427 ) ) ( not ( = ?auto_97429 ?auto_97427 ) ) ( not ( = ?auto_97428 ?auto_97427 ) ) ( not ( = ?auto_97431 ?auto_97427 ) ) ( not ( = ?auto_97430 ?auto_97427 ) ) ( ON ?auto_97431 ?auto_97430 ) ( ON-TABLE ?auto_97427 ) ( ON ?auto_97428 ?auto_97431 ) ( ON ?auto_97429 ?auto_97428 ) ( CLEAR ?auto_97425 ) ( ON ?auto_97426 ?auto_97429 ) ( CLEAR ?auto_97426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97427 ?auto_97430 ?auto_97431 ?auto_97428 ?auto_97429 )
      ( MAKE-3PILE ?auto_97424 ?auto_97425 ?auto_97426 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97432 - BLOCK
      ?auto_97433 - BLOCK
      ?auto_97434 - BLOCK
    )
    :vars
    (
      ?auto_97437 - BLOCK
      ?auto_97438 - BLOCK
      ?auto_97439 - BLOCK
      ?auto_97436 - BLOCK
      ?auto_97435 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97432 ) ( not ( = ?auto_97432 ?auto_97433 ) ) ( not ( = ?auto_97432 ?auto_97434 ) ) ( not ( = ?auto_97432 ?auto_97437 ) ) ( not ( = ?auto_97433 ?auto_97434 ) ) ( not ( = ?auto_97433 ?auto_97437 ) ) ( not ( = ?auto_97434 ?auto_97437 ) ) ( not ( = ?auto_97432 ?auto_97438 ) ) ( not ( = ?auto_97432 ?auto_97439 ) ) ( not ( = ?auto_97433 ?auto_97438 ) ) ( not ( = ?auto_97433 ?auto_97439 ) ) ( not ( = ?auto_97434 ?auto_97438 ) ) ( not ( = ?auto_97434 ?auto_97439 ) ) ( not ( = ?auto_97437 ?auto_97438 ) ) ( not ( = ?auto_97437 ?auto_97439 ) ) ( not ( = ?auto_97438 ?auto_97439 ) ) ( not ( = ?auto_97436 ?auto_97439 ) ) ( not ( = ?auto_97432 ?auto_97436 ) ) ( not ( = ?auto_97433 ?auto_97436 ) ) ( not ( = ?auto_97434 ?auto_97436 ) ) ( not ( = ?auto_97437 ?auto_97436 ) ) ( not ( = ?auto_97438 ?auto_97436 ) ) ( ON ?auto_97436 ?auto_97435 ) ( not ( = ?auto_97432 ?auto_97435 ) ) ( not ( = ?auto_97433 ?auto_97435 ) ) ( not ( = ?auto_97434 ?auto_97435 ) ) ( not ( = ?auto_97437 ?auto_97435 ) ) ( not ( = ?auto_97438 ?auto_97435 ) ) ( not ( = ?auto_97439 ?auto_97435 ) ) ( not ( = ?auto_97436 ?auto_97435 ) ) ( ON ?auto_97439 ?auto_97436 ) ( ON-TABLE ?auto_97435 ) ( ON ?auto_97438 ?auto_97439 ) ( ON ?auto_97437 ?auto_97438 ) ( ON ?auto_97434 ?auto_97437 ) ( CLEAR ?auto_97434 ) ( HOLDING ?auto_97433 ) ( CLEAR ?auto_97432 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97432 ?auto_97433 )
      ( MAKE-3PILE ?auto_97432 ?auto_97433 ?auto_97434 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97440 - BLOCK
      ?auto_97441 - BLOCK
      ?auto_97442 - BLOCK
    )
    :vars
    (
      ?auto_97443 - BLOCK
      ?auto_97447 - BLOCK
      ?auto_97445 - BLOCK
      ?auto_97446 - BLOCK
      ?auto_97444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97440 ) ( not ( = ?auto_97440 ?auto_97441 ) ) ( not ( = ?auto_97440 ?auto_97442 ) ) ( not ( = ?auto_97440 ?auto_97443 ) ) ( not ( = ?auto_97441 ?auto_97442 ) ) ( not ( = ?auto_97441 ?auto_97443 ) ) ( not ( = ?auto_97442 ?auto_97443 ) ) ( not ( = ?auto_97440 ?auto_97447 ) ) ( not ( = ?auto_97440 ?auto_97445 ) ) ( not ( = ?auto_97441 ?auto_97447 ) ) ( not ( = ?auto_97441 ?auto_97445 ) ) ( not ( = ?auto_97442 ?auto_97447 ) ) ( not ( = ?auto_97442 ?auto_97445 ) ) ( not ( = ?auto_97443 ?auto_97447 ) ) ( not ( = ?auto_97443 ?auto_97445 ) ) ( not ( = ?auto_97447 ?auto_97445 ) ) ( not ( = ?auto_97446 ?auto_97445 ) ) ( not ( = ?auto_97440 ?auto_97446 ) ) ( not ( = ?auto_97441 ?auto_97446 ) ) ( not ( = ?auto_97442 ?auto_97446 ) ) ( not ( = ?auto_97443 ?auto_97446 ) ) ( not ( = ?auto_97447 ?auto_97446 ) ) ( ON ?auto_97446 ?auto_97444 ) ( not ( = ?auto_97440 ?auto_97444 ) ) ( not ( = ?auto_97441 ?auto_97444 ) ) ( not ( = ?auto_97442 ?auto_97444 ) ) ( not ( = ?auto_97443 ?auto_97444 ) ) ( not ( = ?auto_97447 ?auto_97444 ) ) ( not ( = ?auto_97445 ?auto_97444 ) ) ( not ( = ?auto_97446 ?auto_97444 ) ) ( ON ?auto_97445 ?auto_97446 ) ( ON-TABLE ?auto_97444 ) ( ON ?auto_97447 ?auto_97445 ) ( ON ?auto_97443 ?auto_97447 ) ( ON ?auto_97442 ?auto_97443 ) ( CLEAR ?auto_97440 ) ( ON ?auto_97441 ?auto_97442 ) ( CLEAR ?auto_97441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97444 ?auto_97446 ?auto_97445 ?auto_97447 ?auto_97443 ?auto_97442 )
      ( MAKE-3PILE ?auto_97440 ?auto_97441 ?auto_97442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97448 - BLOCK
      ?auto_97449 - BLOCK
      ?auto_97450 - BLOCK
    )
    :vars
    (
      ?auto_97453 - BLOCK
      ?auto_97451 - BLOCK
      ?auto_97455 - BLOCK
      ?auto_97452 - BLOCK
      ?auto_97454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97448 ?auto_97449 ) ) ( not ( = ?auto_97448 ?auto_97450 ) ) ( not ( = ?auto_97448 ?auto_97453 ) ) ( not ( = ?auto_97449 ?auto_97450 ) ) ( not ( = ?auto_97449 ?auto_97453 ) ) ( not ( = ?auto_97450 ?auto_97453 ) ) ( not ( = ?auto_97448 ?auto_97451 ) ) ( not ( = ?auto_97448 ?auto_97455 ) ) ( not ( = ?auto_97449 ?auto_97451 ) ) ( not ( = ?auto_97449 ?auto_97455 ) ) ( not ( = ?auto_97450 ?auto_97451 ) ) ( not ( = ?auto_97450 ?auto_97455 ) ) ( not ( = ?auto_97453 ?auto_97451 ) ) ( not ( = ?auto_97453 ?auto_97455 ) ) ( not ( = ?auto_97451 ?auto_97455 ) ) ( not ( = ?auto_97452 ?auto_97455 ) ) ( not ( = ?auto_97448 ?auto_97452 ) ) ( not ( = ?auto_97449 ?auto_97452 ) ) ( not ( = ?auto_97450 ?auto_97452 ) ) ( not ( = ?auto_97453 ?auto_97452 ) ) ( not ( = ?auto_97451 ?auto_97452 ) ) ( ON ?auto_97452 ?auto_97454 ) ( not ( = ?auto_97448 ?auto_97454 ) ) ( not ( = ?auto_97449 ?auto_97454 ) ) ( not ( = ?auto_97450 ?auto_97454 ) ) ( not ( = ?auto_97453 ?auto_97454 ) ) ( not ( = ?auto_97451 ?auto_97454 ) ) ( not ( = ?auto_97455 ?auto_97454 ) ) ( not ( = ?auto_97452 ?auto_97454 ) ) ( ON ?auto_97455 ?auto_97452 ) ( ON-TABLE ?auto_97454 ) ( ON ?auto_97451 ?auto_97455 ) ( ON ?auto_97453 ?auto_97451 ) ( ON ?auto_97450 ?auto_97453 ) ( ON ?auto_97449 ?auto_97450 ) ( CLEAR ?auto_97449 ) ( HOLDING ?auto_97448 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97448 )
      ( MAKE-3PILE ?auto_97448 ?auto_97449 ?auto_97450 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97456 - BLOCK
      ?auto_97457 - BLOCK
      ?auto_97458 - BLOCK
    )
    :vars
    (
      ?auto_97461 - BLOCK
      ?auto_97462 - BLOCK
      ?auto_97460 - BLOCK
      ?auto_97459 - BLOCK
      ?auto_97463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97456 ?auto_97457 ) ) ( not ( = ?auto_97456 ?auto_97458 ) ) ( not ( = ?auto_97456 ?auto_97461 ) ) ( not ( = ?auto_97457 ?auto_97458 ) ) ( not ( = ?auto_97457 ?auto_97461 ) ) ( not ( = ?auto_97458 ?auto_97461 ) ) ( not ( = ?auto_97456 ?auto_97462 ) ) ( not ( = ?auto_97456 ?auto_97460 ) ) ( not ( = ?auto_97457 ?auto_97462 ) ) ( not ( = ?auto_97457 ?auto_97460 ) ) ( not ( = ?auto_97458 ?auto_97462 ) ) ( not ( = ?auto_97458 ?auto_97460 ) ) ( not ( = ?auto_97461 ?auto_97462 ) ) ( not ( = ?auto_97461 ?auto_97460 ) ) ( not ( = ?auto_97462 ?auto_97460 ) ) ( not ( = ?auto_97459 ?auto_97460 ) ) ( not ( = ?auto_97456 ?auto_97459 ) ) ( not ( = ?auto_97457 ?auto_97459 ) ) ( not ( = ?auto_97458 ?auto_97459 ) ) ( not ( = ?auto_97461 ?auto_97459 ) ) ( not ( = ?auto_97462 ?auto_97459 ) ) ( ON ?auto_97459 ?auto_97463 ) ( not ( = ?auto_97456 ?auto_97463 ) ) ( not ( = ?auto_97457 ?auto_97463 ) ) ( not ( = ?auto_97458 ?auto_97463 ) ) ( not ( = ?auto_97461 ?auto_97463 ) ) ( not ( = ?auto_97462 ?auto_97463 ) ) ( not ( = ?auto_97460 ?auto_97463 ) ) ( not ( = ?auto_97459 ?auto_97463 ) ) ( ON ?auto_97460 ?auto_97459 ) ( ON-TABLE ?auto_97463 ) ( ON ?auto_97462 ?auto_97460 ) ( ON ?auto_97461 ?auto_97462 ) ( ON ?auto_97458 ?auto_97461 ) ( ON ?auto_97457 ?auto_97458 ) ( ON ?auto_97456 ?auto_97457 ) ( CLEAR ?auto_97456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97463 ?auto_97459 ?auto_97460 ?auto_97462 ?auto_97461 ?auto_97458 ?auto_97457 )
      ( MAKE-3PILE ?auto_97456 ?auto_97457 ?auto_97458 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97468 - BLOCK
      ?auto_97469 - BLOCK
      ?auto_97470 - BLOCK
      ?auto_97471 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_97471 ) ( CLEAR ?auto_97470 ) ( ON-TABLE ?auto_97468 ) ( ON ?auto_97469 ?auto_97468 ) ( ON ?auto_97470 ?auto_97469 ) ( not ( = ?auto_97468 ?auto_97469 ) ) ( not ( = ?auto_97468 ?auto_97470 ) ) ( not ( = ?auto_97468 ?auto_97471 ) ) ( not ( = ?auto_97469 ?auto_97470 ) ) ( not ( = ?auto_97469 ?auto_97471 ) ) ( not ( = ?auto_97470 ?auto_97471 ) ) )
    :subtasks
    ( ( !STACK ?auto_97471 ?auto_97470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97472 - BLOCK
      ?auto_97473 - BLOCK
      ?auto_97474 - BLOCK
      ?auto_97475 - BLOCK
    )
    :vars
    (
      ?auto_97476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_97474 ) ( ON-TABLE ?auto_97472 ) ( ON ?auto_97473 ?auto_97472 ) ( ON ?auto_97474 ?auto_97473 ) ( not ( = ?auto_97472 ?auto_97473 ) ) ( not ( = ?auto_97472 ?auto_97474 ) ) ( not ( = ?auto_97472 ?auto_97475 ) ) ( not ( = ?auto_97473 ?auto_97474 ) ) ( not ( = ?auto_97473 ?auto_97475 ) ) ( not ( = ?auto_97474 ?auto_97475 ) ) ( ON ?auto_97475 ?auto_97476 ) ( CLEAR ?auto_97475 ) ( HAND-EMPTY ) ( not ( = ?auto_97472 ?auto_97476 ) ) ( not ( = ?auto_97473 ?auto_97476 ) ) ( not ( = ?auto_97474 ?auto_97476 ) ) ( not ( = ?auto_97475 ?auto_97476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97475 ?auto_97476 )
      ( MAKE-4PILE ?auto_97472 ?auto_97473 ?auto_97474 ?auto_97475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97477 - BLOCK
      ?auto_97478 - BLOCK
      ?auto_97479 - BLOCK
      ?auto_97480 - BLOCK
    )
    :vars
    (
      ?auto_97481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97477 ) ( ON ?auto_97478 ?auto_97477 ) ( not ( = ?auto_97477 ?auto_97478 ) ) ( not ( = ?auto_97477 ?auto_97479 ) ) ( not ( = ?auto_97477 ?auto_97480 ) ) ( not ( = ?auto_97478 ?auto_97479 ) ) ( not ( = ?auto_97478 ?auto_97480 ) ) ( not ( = ?auto_97479 ?auto_97480 ) ) ( ON ?auto_97480 ?auto_97481 ) ( CLEAR ?auto_97480 ) ( not ( = ?auto_97477 ?auto_97481 ) ) ( not ( = ?auto_97478 ?auto_97481 ) ) ( not ( = ?auto_97479 ?auto_97481 ) ) ( not ( = ?auto_97480 ?auto_97481 ) ) ( HOLDING ?auto_97479 ) ( CLEAR ?auto_97478 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97477 ?auto_97478 ?auto_97479 )
      ( MAKE-4PILE ?auto_97477 ?auto_97478 ?auto_97479 ?auto_97480 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97482 - BLOCK
      ?auto_97483 - BLOCK
      ?auto_97484 - BLOCK
      ?auto_97485 - BLOCK
    )
    :vars
    (
      ?auto_97486 - BLOCK
      ?auto_97487 - BLOCK
      ?auto_97488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97482 ) ( ON ?auto_97483 ?auto_97482 ) ( not ( = ?auto_97482 ?auto_97483 ) ) ( not ( = ?auto_97482 ?auto_97484 ) ) ( not ( = ?auto_97482 ?auto_97485 ) ) ( not ( = ?auto_97483 ?auto_97484 ) ) ( not ( = ?auto_97483 ?auto_97485 ) ) ( not ( = ?auto_97484 ?auto_97485 ) ) ( ON ?auto_97485 ?auto_97486 ) ( not ( = ?auto_97482 ?auto_97486 ) ) ( not ( = ?auto_97483 ?auto_97486 ) ) ( not ( = ?auto_97484 ?auto_97486 ) ) ( not ( = ?auto_97485 ?auto_97486 ) ) ( CLEAR ?auto_97483 ) ( ON ?auto_97484 ?auto_97485 ) ( CLEAR ?auto_97484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97487 ) ( ON ?auto_97488 ?auto_97487 ) ( ON ?auto_97486 ?auto_97488 ) ( not ( = ?auto_97487 ?auto_97488 ) ) ( not ( = ?auto_97487 ?auto_97486 ) ) ( not ( = ?auto_97487 ?auto_97485 ) ) ( not ( = ?auto_97487 ?auto_97484 ) ) ( not ( = ?auto_97488 ?auto_97486 ) ) ( not ( = ?auto_97488 ?auto_97485 ) ) ( not ( = ?auto_97488 ?auto_97484 ) ) ( not ( = ?auto_97482 ?auto_97487 ) ) ( not ( = ?auto_97482 ?auto_97488 ) ) ( not ( = ?auto_97483 ?auto_97487 ) ) ( not ( = ?auto_97483 ?auto_97488 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97487 ?auto_97488 ?auto_97486 ?auto_97485 )
      ( MAKE-4PILE ?auto_97482 ?auto_97483 ?auto_97484 ?auto_97485 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97489 - BLOCK
      ?auto_97490 - BLOCK
      ?auto_97491 - BLOCK
      ?auto_97492 - BLOCK
    )
    :vars
    (
      ?auto_97495 - BLOCK
      ?auto_97494 - BLOCK
      ?auto_97493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97489 ) ( not ( = ?auto_97489 ?auto_97490 ) ) ( not ( = ?auto_97489 ?auto_97491 ) ) ( not ( = ?auto_97489 ?auto_97492 ) ) ( not ( = ?auto_97490 ?auto_97491 ) ) ( not ( = ?auto_97490 ?auto_97492 ) ) ( not ( = ?auto_97491 ?auto_97492 ) ) ( ON ?auto_97492 ?auto_97495 ) ( not ( = ?auto_97489 ?auto_97495 ) ) ( not ( = ?auto_97490 ?auto_97495 ) ) ( not ( = ?auto_97491 ?auto_97495 ) ) ( not ( = ?auto_97492 ?auto_97495 ) ) ( ON ?auto_97491 ?auto_97492 ) ( CLEAR ?auto_97491 ) ( ON-TABLE ?auto_97494 ) ( ON ?auto_97493 ?auto_97494 ) ( ON ?auto_97495 ?auto_97493 ) ( not ( = ?auto_97494 ?auto_97493 ) ) ( not ( = ?auto_97494 ?auto_97495 ) ) ( not ( = ?auto_97494 ?auto_97492 ) ) ( not ( = ?auto_97494 ?auto_97491 ) ) ( not ( = ?auto_97493 ?auto_97495 ) ) ( not ( = ?auto_97493 ?auto_97492 ) ) ( not ( = ?auto_97493 ?auto_97491 ) ) ( not ( = ?auto_97489 ?auto_97494 ) ) ( not ( = ?auto_97489 ?auto_97493 ) ) ( not ( = ?auto_97490 ?auto_97494 ) ) ( not ( = ?auto_97490 ?auto_97493 ) ) ( HOLDING ?auto_97490 ) ( CLEAR ?auto_97489 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97489 ?auto_97490 )
      ( MAKE-4PILE ?auto_97489 ?auto_97490 ?auto_97491 ?auto_97492 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97496 - BLOCK
      ?auto_97497 - BLOCK
      ?auto_97498 - BLOCK
      ?auto_97499 - BLOCK
    )
    :vars
    (
      ?auto_97500 - BLOCK
      ?auto_97502 - BLOCK
      ?auto_97501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97496 ) ( not ( = ?auto_97496 ?auto_97497 ) ) ( not ( = ?auto_97496 ?auto_97498 ) ) ( not ( = ?auto_97496 ?auto_97499 ) ) ( not ( = ?auto_97497 ?auto_97498 ) ) ( not ( = ?auto_97497 ?auto_97499 ) ) ( not ( = ?auto_97498 ?auto_97499 ) ) ( ON ?auto_97499 ?auto_97500 ) ( not ( = ?auto_97496 ?auto_97500 ) ) ( not ( = ?auto_97497 ?auto_97500 ) ) ( not ( = ?auto_97498 ?auto_97500 ) ) ( not ( = ?auto_97499 ?auto_97500 ) ) ( ON ?auto_97498 ?auto_97499 ) ( ON-TABLE ?auto_97502 ) ( ON ?auto_97501 ?auto_97502 ) ( ON ?auto_97500 ?auto_97501 ) ( not ( = ?auto_97502 ?auto_97501 ) ) ( not ( = ?auto_97502 ?auto_97500 ) ) ( not ( = ?auto_97502 ?auto_97499 ) ) ( not ( = ?auto_97502 ?auto_97498 ) ) ( not ( = ?auto_97501 ?auto_97500 ) ) ( not ( = ?auto_97501 ?auto_97499 ) ) ( not ( = ?auto_97501 ?auto_97498 ) ) ( not ( = ?auto_97496 ?auto_97502 ) ) ( not ( = ?auto_97496 ?auto_97501 ) ) ( not ( = ?auto_97497 ?auto_97502 ) ) ( not ( = ?auto_97497 ?auto_97501 ) ) ( CLEAR ?auto_97496 ) ( ON ?auto_97497 ?auto_97498 ) ( CLEAR ?auto_97497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97502 ?auto_97501 ?auto_97500 ?auto_97499 ?auto_97498 )
      ( MAKE-4PILE ?auto_97496 ?auto_97497 ?auto_97498 ?auto_97499 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97503 - BLOCK
      ?auto_97504 - BLOCK
      ?auto_97505 - BLOCK
      ?auto_97506 - BLOCK
    )
    :vars
    (
      ?auto_97509 - BLOCK
      ?auto_97507 - BLOCK
      ?auto_97508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97503 ?auto_97504 ) ) ( not ( = ?auto_97503 ?auto_97505 ) ) ( not ( = ?auto_97503 ?auto_97506 ) ) ( not ( = ?auto_97504 ?auto_97505 ) ) ( not ( = ?auto_97504 ?auto_97506 ) ) ( not ( = ?auto_97505 ?auto_97506 ) ) ( ON ?auto_97506 ?auto_97509 ) ( not ( = ?auto_97503 ?auto_97509 ) ) ( not ( = ?auto_97504 ?auto_97509 ) ) ( not ( = ?auto_97505 ?auto_97509 ) ) ( not ( = ?auto_97506 ?auto_97509 ) ) ( ON ?auto_97505 ?auto_97506 ) ( ON-TABLE ?auto_97507 ) ( ON ?auto_97508 ?auto_97507 ) ( ON ?auto_97509 ?auto_97508 ) ( not ( = ?auto_97507 ?auto_97508 ) ) ( not ( = ?auto_97507 ?auto_97509 ) ) ( not ( = ?auto_97507 ?auto_97506 ) ) ( not ( = ?auto_97507 ?auto_97505 ) ) ( not ( = ?auto_97508 ?auto_97509 ) ) ( not ( = ?auto_97508 ?auto_97506 ) ) ( not ( = ?auto_97508 ?auto_97505 ) ) ( not ( = ?auto_97503 ?auto_97507 ) ) ( not ( = ?auto_97503 ?auto_97508 ) ) ( not ( = ?auto_97504 ?auto_97507 ) ) ( not ( = ?auto_97504 ?auto_97508 ) ) ( ON ?auto_97504 ?auto_97505 ) ( CLEAR ?auto_97504 ) ( HOLDING ?auto_97503 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97503 )
      ( MAKE-4PILE ?auto_97503 ?auto_97504 ?auto_97505 ?auto_97506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97510 - BLOCK
      ?auto_97511 - BLOCK
      ?auto_97512 - BLOCK
      ?auto_97513 - BLOCK
    )
    :vars
    (
      ?auto_97516 - BLOCK
      ?auto_97515 - BLOCK
      ?auto_97514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97510 ?auto_97511 ) ) ( not ( = ?auto_97510 ?auto_97512 ) ) ( not ( = ?auto_97510 ?auto_97513 ) ) ( not ( = ?auto_97511 ?auto_97512 ) ) ( not ( = ?auto_97511 ?auto_97513 ) ) ( not ( = ?auto_97512 ?auto_97513 ) ) ( ON ?auto_97513 ?auto_97516 ) ( not ( = ?auto_97510 ?auto_97516 ) ) ( not ( = ?auto_97511 ?auto_97516 ) ) ( not ( = ?auto_97512 ?auto_97516 ) ) ( not ( = ?auto_97513 ?auto_97516 ) ) ( ON ?auto_97512 ?auto_97513 ) ( ON-TABLE ?auto_97515 ) ( ON ?auto_97514 ?auto_97515 ) ( ON ?auto_97516 ?auto_97514 ) ( not ( = ?auto_97515 ?auto_97514 ) ) ( not ( = ?auto_97515 ?auto_97516 ) ) ( not ( = ?auto_97515 ?auto_97513 ) ) ( not ( = ?auto_97515 ?auto_97512 ) ) ( not ( = ?auto_97514 ?auto_97516 ) ) ( not ( = ?auto_97514 ?auto_97513 ) ) ( not ( = ?auto_97514 ?auto_97512 ) ) ( not ( = ?auto_97510 ?auto_97515 ) ) ( not ( = ?auto_97510 ?auto_97514 ) ) ( not ( = ?auto_97511 ?auto_97515 ) ) ( not ( = ?auto_97511 ?auto_97514 ) ) ( ON ?auto_97511 ?auto_97512 ) ( ON ?auto_97510 ?auto_97511 ) ( CLEAR ?auto_97510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97515 ?auto_97514 ?auto_97516 ?auto_97513 ?auto_97512 ?auto_97511 )
      ( MAKE-4PILE ?auto_97510 ?auto_97511 ?auto_97512 ?auto_97513 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97517 - BLOCK
      ?auto_97518 - BLOCK
      ?auto_97519 - BLOCK
      ?auto_97520 - BLOCK
    )
    :vars
    (
      ?auto_97522 - BLOCK
      ?auto_97521 - BLOCK
      ?auto_97523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97517 ?auto_97518 ) ) ( not ( = ?auto_97517 ?auto_97519 ) ) ( not ( = ?auto_97517 ?auto_97520 ) ) ( not ( = ?auto_97518 ?auto_97519 ) ) ( not ( = ?auto_97518 ?auto_97520 ) ) ( not ( = ?auto_97519 ?auto_97520 ) ) ( ON ?auto_97520 ?auto_97522 ) ( not ( = ?auto_97517 ?auto_97522 ) ) ( not ( = ?auto_97518 ?auto_97522 ) ) ( not ( = ?auto_97519 ?auto_97522 ) ) ( not ( = ?auto_97520 ?auto_97522 ) ) ( ON ?auto_97519 ?auto_97520 ) ( ON-TABLE ?auto_97521 ) ( ON ?auto_97523 ?auto_97521 ) ( ON ?auto_97522 ?auto_97523 ) ( not ( = ?auto_97521 ?auto_97523 ) ) ( not ( = ?auto_97521 ?auto_97522 ) ) ( not ( = ?auto_97521 ?auto_97520 ) ) ( not ( = ?auto_97521 ?auto_97519 ) ) ( not ( = ?auto_97523 ?auto_97522 ) ) ( not ( = ?auto_97523 ?auto_97520 ) ) ( not ( = ?auto_97523 ?auto_97519 ) ) ( not ( = ?auto_97517 ?auto_97521 ) ) ( not ( = ?auto_97517 ?auto_97523 ) ) ( not ( = ?auto_97518 ?auto_97521 ) ) ( not ( = ?auto_97518 ?auto_97523 ) ) ( ON ?auto_97518 ?auto_97519 ) ( HOLDING ?auto_97517 ) ( CLEAR ?auto_97518 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97521 ?auto_97523 ?auto_97522 ?auto_97520 ?auto_97519 ?auto_97518 ?auto_97517 )
      ( MAKE-4PILE ?auto_97517 ?auto_97518 ?auto_97519 ?auto_97520 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97524 - BLOCK
      ?auto_97525 - BLOCK
      ?auto_97526 - BLOCK
      ?auto_97527 - BLOCK
    )
    :vars
    (
      ?auto_97530 - BLOCK
      ?auto_97529 - BLOCK
      ?auto_97528 - BLOCK
      ?auto_97531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97524 ?auto_97525 ) ) ( not ( = ?auto_97524 ?auto_97526 ) ) ( not ( = ?auto_97524 ?auto_97527 ) ) ( not ( = ?auto_97525 ?auto_97526 ) ) ( not ( = ?auto_97525 ?auto_97527 ) ) ( not ( = ?auto_97526 ?auto_97527 ) ) ( ON ?auto_97527 ?auto_97530 ) ( not ( = ?auto_97524 ?auto_97530 ) ) ( not ( = ?auto_97525 ?auto_97530 ) ) ( not ( = ?auto_97526 ?auto_97530 ) ) ( not ( = ?auto_97527 ?auto_97530 ) ) ( ON ?auto_97526 ?auto_97527 ) ( ON-TABLE ?auto_97529 ) ( ON ?auto_97528 ?auto_97529 ) ( ON ?auto_97530 ?auto_97528 ) ( not ( = ?auto_97529 ?auto_97528 ) ) ( not ( = ?auto_97529 ?auto_97530 ) ) ( not ( = ?auto_97529 ?auto_97527 ) ) ( not ( = ?auto_97529 ?auto_97526 ) ) ( not ( = ?auto_97528 ?auto_97530 ) ) ( not ( = ?auto_97528 ?auto_97527 ) ) ( not ( = ?auto_97528 ?auto_97526 ) ) ( not ( = ?auto_97524 ?auto_97529 ) ) ( not ( = ?auto_97524 ?auto_97528 ) ) ( not ( = ?auto_97525 ?auto_97529 ) ) ( not ( = ?auto_97525 ?auto_97528 ) ) ( ON ?auto_97525 ?auto_97526 ) ( CLEAR ?auto_97525 ) ( ON ?auto_97524 ?auto_97531 ) ( CLEAR ?auto_97524 ) ( HAND-EMPTY ) ( not ( = ?auto_97524 ?auto_97531 ) ) ( not ( = ?auto_97525 ?auto_97531 ) ) ( not ( = ?auto_97526 ?auto_97531 ) ) ( not ( = ?auto_97527 ?auto_97531 ) ) ( not ( = ?auto_97530 ?auto_97531 ) ) ( not ( = ?auto_97529 ?auto_97531 ) ) ( not ( = ?auto_97528 ?auto_97531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97524 ?auto_97531 )
      ( MAKE-4PILE ?auto_97524 ?auto_97525 ?auto_97526 ?auto_97527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97532 - BLOCK
      ?auto_97533 - BLOCK
      ?auto_97534 - BLOCK
      ?auto_97535 - BLOCK
    )
    :vars
    (
      ?auto_97539 - BLOCK
      ?auto_97537 - BLOCK
      ?auto_97538 - BLOCK
      ?auto_97536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97532 ?auto_97533 ) ) ( not ( = ?auto_97532 ?auto_97534 ) ) ( not ( = ?auto_97532 ?auto_97535 ) ) ( not ( = ?auto_97533 ?auto_97534 ) ) ( not ( = ?auto_97533 ?auto_97535 ) ) ( not ( = ?auto_97534 ?auto_97535 ) ) ( ON ?auto_97535 ?auto_97539 ) ( not ( = ?auto_97532 ?auto_97539 ) ) ( not ( = ?auto_97533 ?auto_97539 ) ) ( not ( = ?auto_97534 ?auto_97539 ) ) ( not ( = ?auto_97535 ?auto_97539 ) ) ( ON ?auto_97534 ?auto_97535 ) ( ON-TABLE ?auto_97537 ) ( ON ?auto_97538 ?auto_97537 ) ( ON ?auto_97539 ?auto_97538 ) ( not ( = ?auto_97537 ?auto_97538 ) ) ( not ( = ?auto_97537 ?auto_97539 ) ) ( not ( = ?auto_97537 ?auto_97535 ) ) ( not ( = ?auto_97537 ?auto_97534 ) ) ( not ( = ?auto_97538 ?auto_97539 ) ) ( not ( = ?auto_97538 ?auto_97535 ) ) ( not ( = ?auto_97538 ?auto_97534 ) ) ( not ( = ?auto_97532 ?auto_97537 ) ) ( not ( = ?auto_97532 ?auto_97538 ) ) ( not ( = ?auto_97533 ?auto_97537 ) ) ( not ( = ?auto_97533 ?auto_97538 ) ) ( ON ?auto_97532 ?auto_97536 ) ( CLEAR ?auto_97532 ) ( not ( = ?auto_97532 ?auto_97536 ) ) ( not ( = ?auto_97533 ?auto_97536 ) ) ( not ( = ?auto_97534 ?auto_97536 ) ) ( not ( = ?auto_97535 ?auto_97536 ) ) ( not ( = ?auto_97539 ?auto_97536 ) ) ( not ( = ?auto_97537 ?auto_97536 ) ) ( not ( = ?auto_97538 ?auto_97536 ) ) ( HOLDING ?auto_97533 ) ( CLEAR ?auto_97534 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97537 ?auto_97538 ?auto_97539 ?auto_97535 ?auto_97534 ?auto_97533 )
      ( MAKE-4PILE ?auto_97532 ?auto_97533 ?auto_97534 ?auto_97535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97540 - BLOCK
      ?auto_97541 - BLOCK
      ?auto_97542 - BLOCK
      ?auto_97543 - BLOCK
    )
    :vars
    (
      ?auto_97545 - BLOCK
      ?auto_97544 - BLOCK
      ?auto_97546 - BLOCK
      ?auto_97547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97540 ?auto_97541 ) ) ( not ( = ?auto_97540 ?auto_97542 ) ) ( not ( = ?auto_97540 ?auto_97543 ) ) ( not ( = ?auto_97541 ?auto_97542 ) ) ( not ( = ?auto_97541 ?auto_97543 ) ) ( not ( = ?auto_97542 ?auto_97543 ) ) ( ON ?auto_97543 ?auto_97545 ) ( not ( = ?auto_97540 ?auto_97545 ) ) ( not ( = ?auto_97541 ?auto_97545 ) ) ( not ( = ?auto_97542 ?auto_97545 ) ) ( not ( = ?auto_97543 ?auto_97545 ) ) ( ON ?auto_97542 ?auto_97543 ) ( ON-TABLE ?auto_97544 ) ( ON ?auto_97546 ?auto_97544 ) ( ON ?auto_97545 ?auto_97546 ) ( not ( = ?auto_97544 ?auto_97546 ) ) ( not ( = ?auto_97544 ?auto_97545 ) ) ( not ( = ?auto_97544 ?auto_97543 ) ) ( not ( = ?auto_97544 ?auto_97542 ) ) ( not ( = ?auto_97546 ?auto_97545 ) ) ( not ( = ?auto_97546 ?auto_97543 ) ) ( not ( = ?auto_97546 ?auto_97542 ) ) ( not ( = ?auto_97540 ?auto_97544 ) ) ( not ( = ?auto_97540 ?auto_97546 ) ) ( not ( = ?auto_97541 ?auto_97544 ) ) ( not ( = ?auto_97541 ?auto_97546 ) ) ( ON ?auto_97540 ?auto_97547 ) ( not ( = ?auto_97540 ?auto_97547 ) ) ( not ( = ?auto_97541 ?auto_97547 ) ) ( not ( = ?auto_97542 ?auto_97547 ) ) ( not ( = ?auto_97543 ?auto_97547 ) ) ( not ( = ?auto_97545 ?auto_97547 ) ) ( not ( = ?auto_97544 ?auto_97547 ) ) ( not ( = ?auto_97546 ?auto_97547 ) ) ( CLEAR ?auto_97542 ) ( ON ?auto_97541 ?auto_97540 ) ( CLEAR ?auto_97541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97547 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97547 ?auto_97540 )
      ( MAKE-4PILE ?auto_97540 ?auto_97541 ?auto_97542 ?auto_97543 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97548 - BLOCK
      ?auto_97549 - BLOCK
      ?auto_97550 - BLOCK
      ?auto_97551 - BLOCK
    )
    :vars
    (
      ?auto_97555 - BLOCK
      ?auto_97554 - BLOCK
      ?auto_97553 - BLOCK
      ?auto_97552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97548 ?auto_97549 ) ) ( not ( = ?auto_97548 ?auto_97550 ) ) ( not ( = ?auto_97548 ?auto_97551 ) ) ( not ( = ?auto_97549 ?auto_97550 ) ) ( not ( = ?auto_97549 ?auto_97551 ) ) ( not ( = ?auto_97550 ?auto_97551 ) ) ( ON ?auto_97551 ?auto_97555 ) ( not ( = ?auto_97548 ?auto_97555 ) ) ( not ( = ?auto_97549 ?auto_97555 ) ) ( not ( = ?auto_97550 ?auto_97555 ) ) ( not ( = ?auto_97551 ?auto_97555 ) ) ( ON-TABLE ?auto_97554 ) ( ON ?auto_97553 ?auto_97554 ) ( ON ?auto_97555 ?auto_97553 ) ( not ( = ?auto_97554 ?auto_97553 ) ) ( not ( = ?auto_97554 ?auto_97555 ) ) ( not ( = ?auto_97554 ?auto_97551 ) ) ( not ( = ?auto_97554 ?auto_97550 ) ) ( not ( = ?auto_97553 ?auto_97555 ) ) ( not ( = ?auto_97553 ?auto_97551 ) ) ( not ( = ?auto_97553 ?auto_97550 ) ) ( not ( = ?auto_97548 ?auto_97554 ) ) ( not ( = ?auto_97548 ?auto_97553 ) ) ( not ( = ?auto_97549 ?auto_97554 ) ) ( not ( = ?auto_97549 ?auto_97553 ) ) ( ON ?auto_97548 ?auto_97552 ) ( not ( = ?auto_97548 ?auto_97552 ) ) ( not ( = ?auto_97549 ?auto_97552 ) ) ( not ( = ?auto_97550 ?auto_97552 ) ) ( not ( = ?auto_97551 ?auto_97552 ) ) ( not ( = ?auto_97555 ?auto_97552 ) ) ( not ( = ?auto_97554 ?auto_97552 ) ) ( not ( = ?auto_97553 ?auto_97552 ) ) ( ON ?auto_97549 ?auto_97548 ) ( CLEAR ?auto_97549 ) ( ON-TABLE ?auto_97552 ) ( HOLDING ?auto_97550 ) ( CLEAR ?auto_97551 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97554 ?auto_97553 ?auto_97555 ?auto_97551 ?auto_97550 )
      ( MAKE-4PILE ?auto_97548 ?auto_97549 ?auto_97550 ?auto_97551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97556 - BLOCK
      ?auto_97557 - BLOCK
      ?auto_97558 - BLOCK
      ?auto_97559 - BLOCK
    )
    :vars
    (
      ?auto_97563 - BLOCK
      ?auto_97562 - BLOCK
      ?auto_97561 - BLOCK
      ?auto_97560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97556 ?auto_97557 ) ) ( not ( = ?auto_97556 ?auto_97558 ) ) ( not ( = ?auto_97556 ?auto_97559 ) ) ( not ( = ?auto_97557 ?auto_97558 ) ) ( not ( = ?auto_97557 ?auto_97559 ) ) ( not ( = ?auto_97558 ?auto_97559 ) ) ( ON ?auto_97559 ?auto_97563 ) ( not ( = ?auto_97556 ?auto_97563 ) ) ( not ( = ?auto_97557 ?auto_97563 ) ) ( not ( = ?auto_97558 ?auto_97563 ) ) ( not ( = ?auto_97559 ?auto_97563 ) ) ( ON-TABLE ?auto_97562 ) ( ON ?auto_97561 ?auto_97562 ) ( ON ?auto_97563 ?auto_97561 ) ( not ( = ?auto_97562 ?auto_97561 ) ) ( not ( = ?auto_97562 ?auto_97563 ) ) ( not ( = ?auto_97562 ?auto_97559 ) ) ( not ( = ?auto_97562 ?auto_97558 ) ) ( not ( = ?auto_97561 ?auto_97563 ) ) ( not ( = ?auto_97561 ?auto_97559 ) ) ( not ( = ?auto_97561 ?auto_97558 ) ) ( not ( = ?auto_97556 ?auto_97562 ) ) ( not ( = ?auto_97556 ?auto_97561 ) ) ( not ( = ?auto_97557 ?auto_97562 ) ) ( not ( = ?auto_97557 ?auto_97561 ) ) ( ON ?auto_97556 ?auto_97560 ) ( not ( = ?auto_97556 ?auto_97560 ) ) ( not ( = ?auto_97557 ?auto_97560 ) ) ( not ( = ?auto_97558 ?auto_97560 ) ) ( not ( = ?auto_97559 ?auto_97560 ) ) ( not ( = ?auto_97563 ?auto_97560 ) ) ( not ( = ?auto_97562 ?auto_97560 ) ) ( not ( = ?auto_97561 ?auto_97560 ) ) ( ON ?auto_97557 ?auto_97556 ) ( ON-TABLE ?auto_97560 ) ( CLEAR ?auto_97559 ) ( ON ?auto_97558 ?auto_97557 ) ( CLEAR ?auto_97558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97560 ?auto_97556 ?auto_97557 )
      ( MAKE-4PILE ?auto_97556 ?auto_97557 ?auto_97558 ?auto_97559 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97564 - BLOCK
      ?auto_97565 - BLOCK
      ?auto_97566 - BLOCK
      ?auto_97567 - BLOCK
    )
    :vars
    (
      ?auto_97568 - BLOCK
      ?auto_97571 - BLOCK
      ?auto_97570 - BLOCK
      ?auto_97569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97564 ?auto_97565 ) ) ( not ( = ?auto_97564 ?auto_97566 ) ) ( not ( = ?auto_97564 ?auto_97567 ) ) ( not ( = ?auto_97565 ?auto_97566 ) ) ( not ( = ?auto_97565 ?auto_97567 ) ) ( not ( = ?auto_97566 ?auto_97567 ) ) ( not ( = ?auto_97564 ?auto_97568 ) ) ( not ( = ?auto_97565 ?auto_97568 ) ) ( not ( = ?auto_97566 ?auto_97568 ) ) ( not ( = ?auto_97567 ?auto_97568 ) ) ( ON-TABLE ?auto_97571 ) ( ON ?auto_97570 ?auto_97571 ) ( ON ?auto_97568 ?auto_97570 ) ( not ( = ?auto_97571 ?auto_97570 ) ) ( not ( = ?auto_97571 ?auto_97568 ) ) ( not ( = ?auto_97571 ?auto_97567 ) ) ( not ( = ?auto_97571 ?auto_97566 ) ) ( not ( = ?auto_97570 ?auto_97568 ) ) ( not ( = ?auto_97570 ?auto_97567 ) ) ( not ( = ?auto_97570 ?auto_97566 ) ) ( not ( = ?auto_97564 ?auto_97571 ) ) ( not ( = ?auto_97564 ?auto_97570 ) ) ( not ( = ?auto_97565 ?auto_97571 ) ) ( not ( = ?auto_97565 ?auto_97570 ) ) ( ON ?auto_97564 ?auto_97569 ) ( not ( = ?auto_97564 ?auto_97569 ) ) ( not ( = ?auto_97565 ?auto_97569 ) ) ( not ( = ?auto_97566 ?auto_97569 ) ) ( not ( = ?auto_97567 ?auto_97569 ) ) ( not ( = ?auto_97568 ?auto_97569 ) ) ( not ( = ?auto_97571 ?auto_97569 ) ) ( not ( = ?auto_97570 ?auto_97569 ) ) ( ON ?auto_97565 ?auto_97564 ) ( ON-TABLE ?auto_97569 ) ( ON ?auto_97566 ?auto_97565 ) ( CLEAR ?auto_97566 ) ( HOLDING ?auto_97567 ) ( CLEAR ?auto_97568 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97571 ?auto_97570 ?auto_97568 ?auto_97567 )
      ( MAKE-4PILE ?auto_97564 ?auto_97565 ?auto_97566 ?auto_97567 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97572 - BLOCK
      ?auto_97573 - BLOCK
      ?auto_97574 - BLOCK
      ?auto_97575 - BLOCK
    )
    :vars
    (
      ?auto_97578 - BLOCK
      ?auto_97576 - BLOCK
      ?auto_97577 - BLOCK
      ?auto_97579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97572 ?auto_97573 ) ) ( not ( = ?auto_97572 ?auto_97574 ) ) ( not ( = ?auto_97572 ?auto_97575 ) ) ( not ( = ?auto_97573 ?auto_97574 ) ) ( not ( = ?auto_97573 ?auto_97575 ) ) ( not ( = ?auto_97574 ?auto_97575 ) ) ( not ( = ?auto_97572 ?auto_97578 ) ) ( not ( = ?auto_97573 ?auto_97578 ) ) ( not ( = ?auto_97574 ?auto_97578 ) ) ( not ( = ?auto_97575 ?auto_97578 ) ) ( ON-TABLE ?auto_97576 ) ( ON ?auto_97577 ?auto_97576 ) ( ON ?auto_97578 ?auto_97577 ) ( not ( = ?auto_97576 ?auto_97577 ) ) ( not ( = ?auto_97576 ?auto_97578 ) ) ( not ( = ?auto_97576 ?auto_97575 ) ) ( not ( = ?auto_97576 ?auto_97574 ) ) ( not ( = ?auto_97577 ?auto_97578 ) ) ( not ( = ?auto_97577 ?auto_97575 ) ) ( not ( = ?auto_97577 ?auto_97574 ) ) ( not ( = ?auto_97572 ?auto_97576 ) ) ( not ( = ?auto_97572 ?auto_97577 ) ) ( not ( = ?auto_97573 ?auto_97576 ) ) ( not ( = ?auto_97573 ?auto_97577 ) ) ( ON ?auto_97572 ?auto_97579 ) ( not ( = ?auto_97572 ?auto_97579 ) ) ( not ( = ?auto_97573 ?auto_97579 ) ) ( not ( = ?auto_97574 ?auto_97579 ) ) ( not ( = ?auto_97575 ?auto_97579 ) ) ( not ( = ?auto_97578 ?auto_97579 ) ) ( not ( = ?auto_97576 ?auto_97579 ) ) ( not ( = ?auto_97577 ?auto_97579 ) ) ( ON ?auto_97573 ?auto_97572 ) ( ON-TABLE ?auto_97579 ) ( ON ?auto_97574 ?auto_97573 ) ( CLEAR ?auto_97578 ) ( ON ?auto_97575 ?auto_97574 ) ( CLEAR ?auto_97575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97579 ?auto_97572 ?auto_97573 ?auto_97574 )
      ( MAKE-4PILE ?auto_97572 ?auto_97573 ?auto_97574 ?auto_97575 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97580 - BLOCK
      ?auto_97581 - BLOCK
      ?auto_97582 - BLOCK
      ?auto_97583 - BLOCK
    )
    :vars
    (
      ?auto_97586 - BLOCK
      ?auto_97584 - BLOCK
      ?auto_97585 - BLOCK
      ?auto_97587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97580 ?auto_97581 ) ) ( not ( = ?auto_97580 ?auto_97582 ) ) ( not ( = ?auto_97580 ?auto_97583 ) ) ( not ( = ?auto_97581 ?auto_97582 ) ) ( not ( = ?auto_97581 ?auto_97583 ) ) ( not ( = ?auto_97582 ?auto_97583 ) ) ( not ( = ?auto_97580 ?auto_97586 ) ) ( not ( = ?auto_97581 ?auto_97586 ) ) ( not ( = ?auto_97582 ?auto_97586 ) ) ( not ( = ?auto_97583 ?auto_97586 ) ) ( ON-TABLE ?auto_97584 ) ( ON ?auto_97585 ?auto_97584 ) ( not ( = ?auto_97584 ?auto_97585 ) ) ( not ( = ?auto_97584 ?auto_97586 ) ) ( not ( = ?auto_97584 ?auto_97583 ) ) ( not ( = ?auto_97584 ?auto_97582 ) ) ( not ( = ?auto_97585 ?auto_97586 ) ) ( not ( = ?auto_97585 ?auto_97583 ) ) ( not ( = ?auto_97585 ?auto_97582 ) ) ( not ( = ?auto_97580 ?auto_97584 ) ) ( not ( = ?auto_97580 ?auto_97585 ) ) ( not ( = ?auto_97581 ?auto_97584 ) ) ( not ( = ?auto_97581 ?auto_97585 ) ) ( ON ?auto_97580 ?auto_97587 ) ( not ( = ?auto_97580 ?auto_97587 ) ) ( not ( = ?auto_97581 ?auto_97587 ) ) ( not ( = ?auto_97582 ?auto_97587 ) ) ( not ( = ?auto_97583 ?auto_97587 ) ) ( not ( = ?auto_97586 ?auto_97587 ) ) ( not ( = ?auto_97584 ?auto_97587 ) ) ( not ( = ?auto_97585 ?auto_97587 ) ) ( ON ?auto_97581 ?auto_97580 ) ( ON-TABLE ?auto_97587 ) ( ON ?auto_97582 ?auto_97581 ) ( ON ?auto_97583 ?auto_97582 ) ( CLEAR ?auto_97583 ) ( HOLDING ?auto_97586 ) ( CLEAR ?auto_97585 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97584 ?auto_97585 ?auto_97586 )
      ( MAKE-4PILE ?auto_97580 ?auto_97581 ?auto_97582 ?auto_97583 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97588 - BLOCK
      ?auto_97589 - BLOCK
      ?auto_97590 - BLOCK
      ?auto_97591 - BLOCK
    )
    :vars
    (
      ?auto_97595 - BLOCK
      ?auto_97593 - BLOCK
      ?auto_97594 - BLOCK
      ?auto_97592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97588 ?auto_97589 ) ) ( not ( = ?auto_97588 ?auto_97590 ) ) ( not ( = ?auto_97588 ?auto_97591 ) ) ( not ( = ?auto_97589 ?auto_97590 ) ) ( not ( = ?auto_97589 ?auto_97591 ) ) ( not ( = ?auto_97590 ?auto_97591 ) ) ( not ( = ?auto_97588 ?auto_97595 ) ) ( not ( = ?auto_97589 ?auto_97595 ) ) ( not ( = ?auto_97590 ?auto_97595 ) ) ( not ( = ?auto_97591 ?auto_97595 ) ) ( ON-TABLE ?auto_97593 ) ( ON ?auto_97594 ?auto_97593 ) ( not ( = ?auto_97593 ?auto_97594 ) ) ( not ( = ?auto_97593 ?auto_97595 ) ) ( not ( = ?auto_97593 ?auto_97591 ) ) ( not ( = ?auto_97593 ?auto_97590 ) ) ( not ( = ?auto_97594 ?auto_97595 ) ) ( not ( = ?auto_97594 ?auto_97591 ) ) ( not ( = ?auto_97594 ?auto_97590 ) ) ( not ( = ?auto_97588 ?auto_97593 ) ) ( not ( = ?auto_97588 ?auto_97594 ) ) ( not ( = ?auto_97589 ?auto_97593 ) ) ( not ( = ?auto_97589 ?auto_97594 ) ) ( ON ?auto_97588 ?auto_97592 ) ( not ( = ?auto_97588 ?auto_97592 ) ) ( not ( = ?auto_97589 ?auto_97592 ) ) ( not ( = ?auto_97590 ?auto_97592 ) ) ( not ( = ?auto_97591 ?auto_97592 ) ) ( not ( = ?auto_97595 ?auto_97592 ) ) ( not ( = ?auto_97593 ?auto_97592 ) ) ( not ( = ?auto_97594 ?auto_97592 ) ) ( ON ?auto_97589 ?auto_97588 ) ( ON-TABLE ?auto_97592 ) ( ON ?auto_97590 ?auto_97589 ) ( ON ?auto_97591 ?auto_97590 ) ( CLEAR ?auto_97594 ) ( ON ?auto_97595 ?auto_97591 ) ( CLEAR ?auto_97595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97592 ?auto_97588 ?auto_97589 ?auto_97590 ?auto_97591 )
      ( MAKE-4PILE ?auto_97588 ?auto_97589 ?auto_97590 ?auto_97591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97596 - BLOCK
      ?auto_97597 - BLOCK
      ?auto_97598 - BLOCK
      ?auto_97599 - BLOCK
    )
    :vars
    (
      ?auto_97600 - BLOCK
      ?auto_97601 - BLOCK
      ?auto_97602 - BLOCK
      ?auto_97603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97596 ?auto_97597 ) ) ( not ( = ?auto_97596 ?auto_97598 ) ) ( not ( = ?auto_97596 ?auto_97599 ) ) ( not ( = ?auto_97597 ?auto_97598 ) ) ( not ( = ?auto_97597 ?auto_97599 ) ) ( not ( = ?auto_97598 ?auto_97599 ) ) ( not ( = ?auto_97596 ?auto_97600 ) ) ( not ( = ?auto_97597 ?auto_97600 ) ) ( not ( = ?auto_97598 ?auto_97600 ) ) ( not ( = ?auto_97599 ?auto_97600 ) ) ( ON-TABLE ?auto_97601 ) ( not ( = ?auto_97601 ?auto_97602 ) ) ( not ( = ?auto_97601 ?auto_97600 ) ) ( not ( = ?auto_97601 ?auto_97599 ) ) ( not ( = ?auto_97601 ?auto_97598 ) ) ( not ( = ?auto_97602 ?auto_97600 ) ) ( not ( = ?auto_97602 ?auto_97599 ) ) ( not ( = ?auto_97602 ?auto_97598 ) ) ( not ( = ?auto_97596 ?auto_97601 ) ) ( not ( = ?auto_97596 ?auto_97602 ) ) ( not ( = ?auto_97597 ?auto_97601 ) ) ( not ( = ?auto_97597 ?auto_97602 ) ) ( ON ?auto_97596 ?auto_97603 ) ( not ( = ?auto_97596 ?auto_97603 ) ) ( not ( = ?auto_97597 ?auto_97603 ) ) ( not ( = ?auto_97598 ?auto_97603 ) ) ( not ( = ?auto_97599 ?auto_97603 ) ) ( not ( = ?auto_97600 ?auto_97603 ) ) ( not ( = ?auto_97601 ?auto_97603 ) ) ( not ( = ?auto_97602 ?auto_97603 ) ) ( ON ?auto_97597 ?auto_97596 ) ( ON-TABLE ?auto_97603 ) ( ON ?auto_97598 ?auto_97597 ) ( ON ?auto_97599 ?auto_97598 ) ( ON ?auto_97600 ?auto_97599 ) ( CLEAR ?auto_97600 ) ( HOLDING ?auto_97602 ) ( CLEAR ?auto_97601 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97601 ?auto_97602 )
      ( MAKE-4PILE ?auto_97596 ?auto_97597 ?auto_97598 ?auto_97599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97604 - BLOCK
      ?auto_97605 - BLOCK
      ?auto_97606 - BLOCK
      ?auto_97607 - BLOCK
    )
    :vars
    (
      ?auto_97610 - BLOCK
      ?auto_97611 - BLOCK
      ?auto_97608 - BLOCK
      ?auto_97609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97604 ?auto_97605 ) ) ( not ( = ?auto_97604 ?auto_97606 ) ) ( not ( = ?auto_97604 ?auto_97607 ) ) ( not ( = ?auto_97605 ?auto_97606 ) ) ( not ( = ?auto_97605 ?auto_97607 ) ) ( not ( = ?auto_97606 ?auto_97607 ) ) ( not ( = ?auto_97604 ?auto_97610 ) ) ( not ( = ?auto_97605 ?auto_97610 ) ) ( not ( = ?auto_97606 ?auto_97610 ) ) ( not ( = ?auto_97607 ?auto_97610 ) ) ( ON-TABLE ?auto_97611 ) ( not ( = ?auto_97611 ?auto_97608 ) ) ( not ( = ?auto_97611 ?auto_97610 ) ) ( not ( = ?auto_97611 ?auto_97607 ) ) ( not ( = ?auto_97611 ?auto_97606 ) ) ( not ( = ?auto_97608 ?auto_97610 ) ) ( not ( = ?auto_97608 ?auto_97607 ) ) ( not ( = ?auto_97608 ?auto_97606 ) ) ( not ( = ?auto_97604 ?auto_97611 ) ) ( not ( = ?auto_97604 ?auto_97608 ) ) ( not ( = ?auto_97605 ?auto_97611 ) ) ( not ( = ?auto_97605 ?auto_97608 ) ) ( ON ?auto_97604 ?auto_97609 ) ( not ( = ?auto_97604 ?auto_97609 ) ) ( not ( = ?auto_97605 ?auto_97609 ) ) ( not ( = ?auto_97606 ?auto_97609 ) ) ( not ( = ?auto_97607 ?auto_97609 ) ) ( not ( = ?auto_97610 ?auto_97609 ) ) ( not ( = ?auto_97611 ?auto_97609 ) ) ( not ( = ?auto_97608 ?auto_97609 ) ) ( ON ?auto_97605 ?auto_97604 ) ( ON-TABLE ?auto_97609 ) ( ON ?auto_97606 ?auto_97605 ) ( ON ?auto_97607 ?auto_97606 ) ( ON ?auto_97610 ?auto_97607 ) ( CLEAR ?auto_97611 ) ( ON ?auto_97608 ?auto_97610 ) ( CLEAR ?auto_97608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97609 ?auto_97604 ?auto_97605 ?auto_97606 ?auto_97607 ?auto_97610 )
      ( MAKE-4PILE ?auto_97604 ?auto_97605 ?auto_97606 ?auto_97607 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97612 - BLOCK
      ?auto_97613 - BLOCK
      ?auto_97614 - BLOCK
      ?auto_97615 - BLOCK
    )
    :vars
    (
      ?auto_97619 - BLOCK
      ?auto_97617 - BLOCK
      ?auto_97618 - BLOCK
      ?auto_97616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97612 ?auto_97613 ) ) ( not ( = ?auto_97612 ?auto_97614 ) ) ( not ( = ?auto_97612 ?auto_97615 ) ) ( not ( = ?auto_97613 ?auto_97614 ) ) ( not ( = ?auto_97613 ?auto_97615 ) ) ( not ( = ?auto_97614 ?auto_97615 ) ) ( not ( = ?auto_97612 ?auto_97619 ) ) ( not ( = ?auto_97613 ?auto_97619 ) ) ( not ( = ?auto_97614 ?auto_97619 ) ) ( not ( = ?auto_97615 ?auto_97619 ) ) ( not ( = ?auto_97617 ?auto_97618 ) ) ( not ( = ?auto_97617 ?auto_97619 ) ) ( not ( = ?auto_97617 ?auto_97615 ) ) ( not ( = ?auto_97617 ?auto_97614 ) ) ( not ( = ?auto_97618 ?auto_97619 ) ) ( not ( = ?auto_97618 ?auto_97615 ) ) ( not ( = ?auto_97618 ?auto_97614 ) ) ( not ( = ?auto_97612 ?auto_97617 ) ) ( not ( = ?auto_97612 ?auto_97618 ) ) ( not ( = ?auto_97613 ?auto_97617 ) ) ( not ( = ?auto_97613 ?auto_97618 ) ) ( ON ?auto_97612 ?auto_97616 ) ( not ( = ?auto_97612 ?auto_97616 ) ) ( not ( = ?auto_97613 ?auto_97616 ) ) ( not ( = ?auto_97614 ?auto_97616 ) ) ( not ( = ?auto_97615 ?auto_97616 ) ) ( not ( = ?auto_97619 ?auto_97616 ) ) ( not ( = ?auto_97617 ?auto_97616 ) ) ( not ( = ?auto_97618 ?auto_97616 ) ) ( ON ?auto_97613 ?auto_97612 ) ( ON-TABLE ?auto_97616 ) ( ON ?auto_97614 ?auto_97613 ) ( ON ?auto_97615 ?auto_97614 ) ( ON ?auto_97619 ?auto_97615 ) ( ON ?auto_97618 ?auto_97619 ) ( CLEAR ?auto_97618 ) ( HOLDING ?auto_97617 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97617 )
      ( MAKE-4PILE ?auto_97612 ?auto_97613 ?auto_97614 ?auto_97615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97620 - BLOCK
      ?auto_97621 - BLOCK
      ?auto_97622 - BLOCK
      ?auto_97623 - BLOCK
    )
    :vars
    (
      ?auto_97627 - BLOCK
      ?auto_97626 - BLOCK
      ?auto_97624 - BLOCK
      ?auto_97625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97620 ?auto_97621 ) ) ( not ( = ?auto_97620 ?auto_97622 ) ) ( not ( = ?auto_97620 ?auto_97623 ) ) ( not ( = ?auto_97621 ?auto_97622 ) ) ( not ( = ?auto_97621 ?auto_97623 ) ) ( not ( = ?auto_97622 ?auto_97623 ) ) ( not ( = ?auto_97620 ?auto_97627 ) ) ( not ( = ?auto_97621 ?auto_97627 ) ) ( not ( = ?auto_97622 ?auto_97627 ) ) ( not ( = ?auto_97623 ?auto_97627 ) ) ( not ( = ?auto_97626 ?auto_97624 ) ) ( not ( = ?auto_97626 ?auto_97627 ) ) ( not ( = ?auto_97626 ?auto_97623 ) ) ( not ( = ?auto_97626 ?auto_97622 ) ) ( not ( = ?auto_97624 ?auto_97627 ) ) ( not ( = ?auto_97624 ?auto_97623 ) ) ( not ( = ?auto_97624 ?auto_97622 ) ) ( not ( = ?auto_97620 ?auto_97626 ) ) ( not ( = ?auto_97620 ?auto_97624 ) ) ( not ( = ?auto_97621 ?auto_97626 ) ) ( not ( = ?auto_97621 ?auto_97624 ) ) ( ON ?auto_97620 ?auto_97625 ) ( not ( = ?auto_97620 ?auto_97625 ) ) ( not ( = ?auto_97621 ?auto_97625 ) ) ( not ( = ?auto_97622 ?auto_97625 ) ) ( not ( = ?auto_97623 ?auto_97625 ) ) ( not ( = ?auto_97627 ?auto_97625 ) ) ( not ( = ?auto_97626 ?auto_97625 ) ) ( not ( = ?auto_97624 ?auto_97625 ) ) ( ON ?auto_97621 ?auto_97620 ) ( ON-TABLE ?auto_97625 ) ( ON ?auto_97622 ?auto_97621 ) ( ON ?auto_97623 ?auto_97622 ) ( ON ?auto_97627 ?auto_97623 ) ( ON ?auto_97624 ?auto_97627 ) ( ON ?auto_97626 ?auto_97624 ) ( CLEAR ?auto_97626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97625 ?auto_97620 ?auto_97621 ?auto_97622 ?auto_97623 ?auto_97627 ?auto_97624 )
      ( MAKE-4PILE ?auto_97620 ?auto_97621 ?auto_97622 ?auto_97623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97630 - BLOCK
      ?auto_97631 - BLOCK
    )
    :vars
    (
      ?auto_97632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97632 ?auto_97631 ) ( CLEAR ?auto_97632 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97630 ) ( ON ?auto_97631 ?auto_97630 ) ( not ( = ?auto_97630 ?auto_97631 ) ) ( not ( = ?auto_97630 ?auto_97632 ) ) ( not ( = ?auto_97631 ?auto_97632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97632 ?auto_97631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97633 - BLOCK
      ?auto_97634 - BLOCK
    )
    :vars
    (
      ?auto_97635 - BLOCK
      ?auto_97636 - BLOCK
      ?auto_97637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97635 ?auto_97634 ) ( CLEAR ?auto_97635 ) ( ON-TABLE ?auto_97633 ) ( ON ?auto_97634 ?auto_97633 ) ( not ( = ?auto_97633 ?auto_97634 ) ) ( not ( = ?auto_97633 ?auto_97635 ) ) ( not ( = ?auto_97634 ?auto_97635 ) ) ( HOLDING ?auto_97636 ) ( CLEAR ?auto_97637 ) ( not ( = ?auto_97633 ?auto_97636 ) ) ( not ( = ?auto_97633 ?auto_97637 ) ) ( not ( = ?auto_97634 ?auto_97636 ) ) ( not ( = ?auto_97634 ?auto_97637 ) ) ( not ( = ?auto_97635 ?auto_97636 ) ) ( not ( = ?auto_97635 ?auto_97637 ) ) ( not ( = ?auto_97636 ?auto_97637 ) ) )
    :subtasks
    ( ( !STACK ?auto_97636 ?auto_97637 )
      ( MAKE-2PILE ?auto_97633 ?auto_97634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97638 - BLOCK
      ?auto_97639 - BLOCK
    )
    :vars
    (
      ?auto_97642 - BLOCK
      ?auto_97640 - BLOCK
      ?auto_97641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97642 ?auto_97639 ) ( ON-TABLE ?auto_97638 ) ( ON ?auto_97639 ?auto_97638 ) ( not ( = ?auto_97638 ?auto_97639 ) ) ( not ( = ?auto_97638 ?auto_97642 ) ) ( not ( = ?auto_97639 ?auto_97642 ) ) ( CLEAR ?auto_97640 ) ( not ( = ?auto_97638 ?auto_97641 ) ) ( not ( = ?auto_97638 ?auto_97640 ) ) ( not ( = ?auto_97639 ?auto_97641 ) ) ( not ( = ?auto_97639 ?auto_97640 ) ) ( not ( = ?auto_97642 ?auto_97641 ) ) ( not ( = ?auto_97642 ?auto_97640 ) ) ( not ( = ?auto_97641 ?auto_97640 ) ) ( ON ?auto_97641 ?auto_97642 ) ( CLEAR ?auto_97641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97638 ?auto_97639 ?auto_97642 )
      ( MAKE-2PILE ?auto_97638 ?auto_97639 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97643 - BLOCK
      ?auto_97644 - BLOCK
    )
    :vars
    (
      ?auto_97645 - BLOCK
      ?auto_97647 - BLOCK
      ?auto_97646 - BLOCK
      ?auto_97648 - BLOCK
      ?auto_97649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97645 ?auto_97644 ) ( ON-TABLE ?auto_97643 ) ( ON ?auto_97644 ?auto_97643 ) ( not ( = ?auto_97643 ?auto_97644 ) ) ( not ( = ?auto_97643 ?auto_97645 ) ) ( not ( = ?auto_97644 ?auto_97645 ) ) ( not ( = ?auto_97643 ?auto_97647 ) ) ( not ( = ?auto_97643 ?auto_97646 ) ) ( not ( = ?auto_97644 ?auto_97647 ) ) ( not ( = ?auto_97644 ?auto_97646 ) ) ( not ( = ?auto_97645 ?auto_97647 ) ) ( not ( = ?auto_97645 ?auto_97646 ) ) ( not ( = ?auto_97647 ?auto_97646 ) ) ( ON ?auto_97647 ?auto_97645 ) ( CLEAR ?auto_97647 ) ( HOLDING ?auto_97646 ) ( CLEAR ?auto_97648 ) ( ON-TABLE ?auto_97649 ) ( ON ?auto_97648 ?auto_97649 ) ( not ( = ?auto_97649 ?auto_97648 ) ) ( not ( = ?auto_97649 ?auto_97646 ) ) ( not ( = ?auto_97648 ?auto_97646 ) ) ( not ( = ?auto_97643 ?auto_97648 ) ) ( not ( = ?auto_97643 ?auto_97649 ) ) ( not ( = ?auto_97644 ?auto_97648 ) ) ( not ( = ?auto_97644 ?auto_97649 ) ) ( not ( = ?auto_97645 ?auto_97648 ) ) ( not ( = ?auto_97645 ?auto_97649 ) ) ( not ( = ?auto_97647 ?auto_97648 ) ) ( not ( = ?auto_97647 ?auto_97649 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97649 ?auto_97648 ?auto_97646 )
      ( MAKE-2PILE ?auto_97643 ?auto_97644 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97650 - BLOCK
      ?auto_97651 - BLOCK
    )
    :vars
    (
      ?auto_97655 - BLOCK
      ?auto_97654 - BLOCK
      ?auto_97656 - BLOCK
      ?auto_97652 - BLOCK
      ?auto_97653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97655 ?auto_97651 ) ( ON-TABLE ?auto_97650 ) ( ON ?auto_97651 ?auto_97650 ) ( not ( = ?auto_97650 ?auto_97651 ) ) ( not ( = ?auto_97650 ?auto_97655 ) ) ( not ( = ?auto_97651 ?auto_97655 ) ) ( not ( = ?auto_97650 ?auto_97654 ) ) ( not ( = ?auto_97650 ?auto_97656 ) ) ( not ( = ?auto_97651 ?auto_97654 ) ) ( not ( = ?auto_97651 ?auto_97656 ) ) ( not ( = ?auto_97655 ?auto_97654 ) ) ( not ( = ?auto_97655 ?auto_97656 ) ) ( not ( = ?auto_97654 ?auto_97656 ) ) ( ON ?auto_97654 ?auto_97655 ) ( CLEAR ?auto_97652 ) ( ON-TABLE ?auto_97653 ) ( ON ?auto_97652 ?auto_97653 ) ( not ( = ?auto_97653 ?auto_97652 ) ) ( not ( = ?auto_97653 ?auto_97656 ) ) ( not ( = ?auto_97652 ?auto_97656 ) ) ( not ( = ?auto_97650 ?auto_97652 ) ) ( not ( = ?auto_97650 ?auto_97653 ) ) ( not ( = ?auto_97651 ?auto_97652 ) ) ( not ( = ?auto_97651 ?auto_97653 ) ) ( not ( = ?auto_97655 ?auto_97652 ) ) ( not ( = ?auto_97655 ?auto_97653 ) ) ( not ( = ?auto_97654 ?auto_97652 ) ) ( not ( = ?auto_97654 ?auto_97653 ) ) ( ON ?auto_97656 ?auto_97654 ) ( CLEAR ?auto_97656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97650 ?auto_97651 ?auto_97655 ?auto_97654 )
      ( MAKE-2PILE ?auto_97650 ?auto_97651 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97657 - BLOCK
      ?auto_97658 - BLOCK
    )
    :vars
    (
      ?auto_97659 - BLOCK
      ?auto_97661 - BLOCK
      ?auto_97662 - BLOCK
      ?auto_97660 - BLOCK
      ?auto_97663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97659 ?auto_97658 ) ( ON-TABLE ?auto_97657 ) ( ON ?auto_97658 ?auto_97657 ) ( not ( = ?auto_97657 ?auto_97658 ) ) ( not ( = ?auto_97657 ?auto_97659 ) ) ( not ( = ?auto_97658 ?auto_97659 ) ) ( not ( = ?auto_97657 ?auto_97661 ) ) ( not ( = ?auto_97657 ?auto_97662 ) ) ( not ( = ?auto_97658 ?auto_97661 ) ) ( not ( = ?auto_97658 ?auto_97662 ) ) ( not ( = ?auto_97659 ?auto_97661 ) ) ( not ( = ?auto_97659 ?auto_97662 ) ) ( not ( = ?auto_97661 ?auto_97662 ) ) ( ON ?auto_97661 ?auto_97659 ) ( ON-TABLE ?auto_97660 ) ( not ( = ?auto_97660 ?auto_97663 ) ) ( not ( = ?auto_97660 ?auto_97662 ) ) ( not ( = ?auto_97663 ?auto_97662 ) ) ( not ( = ?auto_97657 ?auto_97663 ) ) ( not ( = ?auto_97657 ?auto_97660 ) ) ( not ( = ?auto_97658 ?auto_97663 ) ) ( not ( = ?auto_97658 ?auto_97660 ) ) ( not ( = ?auto_97659 ?auto_97663 ) ) ( not ( = ?auto_97659 ?auto_97660 ) ) ( not ( = ?auto_97661 ?auto_97663 ) ) ( not ( = ?auto_97661 ?auto_97660 ) ) ( ON ?auto_97662 ?auto_97661 ) ( CLEAR ?auto_97662 ) ( HOLDING ?auto_97663 ) ( CLEAR ?auto_97660 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97660 ?auto_97663 )
      ( MAKE-2PILE ?auto_97657 ?auto_97658 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97664 - BLOCK
      ?auto_97665 - BLOCK
    )
    :vars
    (
      ?auto_97667 - BLOCK
      ?auto_97666 - BLOCK
      ?auto_97670 - BLOCK
      ?auto_97668 - BLOCK
      ?auto_97669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97667 ?auto_97665 ) ( ON-TABLE ?auto_97664 ) ( ON ?auto_97665 ?auto_97664 ) ( not ( = ?auto_97664 ?auto_97665 ) ) ( not ( = ?auto_97664 ?auto_97667 ) ) ( not ( = ?auto_97665 ?auto_97667 ) ) ( not ( = ?auto_97664 ?auto_97666 ) ) ( not ( = ?auto_97664 ?auto_97670 ) ) ( not ( = ?auto_97665 ?auto_97666 ) ) ( not ( = ?auto_97665 ?auto_97670 ) ) ( not ( = ?auto_97667 ?auto_97666 ) ) ( not ( = ?auto_97667 ?auto_97670 ) ) ( not ( = ?auto_97666 ?auto_97670 ) ) ( ON ?auto_97666 ?auto_97667 ) ( ON-TABLE ?auto_97668 ) ( not ( = ?auto_97668 ?auto_97669 ) ) ( not ( = ?auto_97668 ?auto_97670 ) ) ( not ( = ?auto_97669 ?auto_97670 ) ) ( not ( = ?auto_97664 ?auto_97669 ) ) ( not ( = ?auto_97664 ?auto_97668 ) ) ( not ( = ?auto_97665 ?auto_97669 ) ) ( not ( = ?auto_97665 ?auto_97668 ) ) ( not ( = ?auto_97667 ?auto_97669 ) ) ( not ( = ?auto_97667 ?auto_97668 ) ) ( not ( = ?auto_97666 ?auto_97669 ) ) ( not ( = ?auto_97666 ?auto_97668 ) ) ( ON ?auto_97670 ?auto_97666 ) ( CLEAR ?auto_97668 ) ( ON ?auto_97669 ?auto_97670 ) ( CLEAR ?auto_97669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97664 ?auto_97665 ?auto_97667 ?auto_97666 ?auto_97670 )
      ( MAKE-2PILE ?auto_97664 ?auto_97665 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97671 - BLOCK
      ?auto_97672 - BLOCK
    )
    :vars
    (
      ?auto_97674 - BLOCK
      ?auto_97673 - BLOCK
      ?auto_97675 - BLOCK
      ?auto_97677 - BLOCK
      ?auto_97676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97674 ?auto_97672 ) ( ON-TABLE ?auto_97671 ) ( ON ?auto_97672 ?auto_97671 ) ( not ( = ?auto_97671 ?auto_97672 ) ) ( not ( = ?auto_97671 ?auto_97674 ) ) ( not ( = ?auto_97672 ?auto_97674 ) ) ( not ( = ?auto_97671 ?auto_97673 ) ) ( not ( = ?auto_97671 ?auto_97675 ) ) ( not ( = ?auto_97672 ?auto_97673 ) ) ( not ( = ?auto_97672 ?auto_97675 ) ) ( not ( = ?auto_97674 ?auto_97673 ) ) ( not ( = ?auto_97674 ?auto_97675 ) ) ( not ( = ?auto_97673 ?auto_97675 ) ) ( ON ?auto_97673 ?auto_97674 ) ( not ( = ?auto_97677 ?auto_97676 ) ) ( not ( = ?auto_97677 ?auto_97675 ) ) ( not ( = ?auto_97676 ?auto_97675 ) ) ( not ( = ?auto_97671 ?auto_97676 ) ) ( not ( = ?auto_97671 ?auto_97677 ) ) ( not ( = ?auto_97672 ?auto_97676 ) ) ( not ( = ?auto_97672 ?auto_97677 ) ) ( not ( = ?auto_97674 ?auto_97676 ) ) ( not ( = ?auto_97674 ?auto_97677 ) ) ( not ( = ?auto_97673 ?auto_97676 ) ) ( not ( = ?auto_97673 ?auto_97677 ) ) ( ON ?auto_97675 ?auto_97673 ) ( ON ?auto_97676 ?auto_97675 ) ( CLEAR ?auto_97676 ) ( HOLDING ?auto_97677 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97677 )
      ( MAKE-2PILE ?auto_97671 ?auto_97672 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97678 - BLOCK
      ?auto_97679 - BLOCK
    )
    :vars
    (
      ?auto_97681 - BLOCK
      ?auto_97684 - BLOCK
      ?auto_97680 - BLOCK
      ?auto_97683 - BLOCK
      ?auto_97682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97681 ?auto_97679 ) ( ON-TABLE ?auto_97678 ) ( ON ?auto_97679 ?auto_97678 ) ( not ( = ?auto_97678 ?auto_97679 ) ) ( not ( = ?auto_97678 ?auto_97681 ) ) ( not ( = ?auto_97679 ?auto_97681 ) ) ( not ( = ?auto_97678 ?auto_97684 ) ) ( not ( = ?auto_97678 ?auto_97680 ) ) ( not ( = ?auto_97679 ?auto_97684 ) ) ( not ( = ?auto_97679 ?auto_97680 ) ) ( not ( = ?auto_97681 ?auto_97684 ) ) ( not ( = ?auto_97681 ?auto_97680 ) ) ( not ( = ?auto_97684 ?auto_97680 ) ) ( ON ?auto_97684 ?auto_97681 ) ( not ( = ?auto_97683 ?auto_97682 ) ) ( not ( = ?auto_97683 ?auto_97680 ) ) ( not ( = ?auto_97682 ?auto_97680 ) ) ( not ( = ?auto_97678 ?auto_97682 ) ) ( not ( = ?auto_97678 ?auto_97683 ) ) ( not ( = ?auto_97679 ?auto_97682 ) ) ( not ( = ?auto_97679 ?auto_97683 ) ) ( not ( = ?auto_97681 ?auto_97682 ) ) ( not ( = ?auto_97681 ?auto_97683 ) ) ( not ( = ?auto_97684 ?auto_97682 ) ) ( not ( = ?auto_97684 ?auto_97683 ) ) ( ON ?auto_97680 ?auto_97684 ) ( ON ?auto_97682 ?auto_97680 ) ( ON ?auto_97683 ?auto_97682 ) ( CLEAR ?auto_97683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97678 ?auto_97679 ?auto_97681 ?auto_97684 ?auto_97680 ?auto_97682 )
      ( MAKE-2PILE ?auto_97678 ?auto_97679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97685 - BLOCK
      ?auto_97686 - BLOCK
    )
    :vars
    (
      ?auto_97691 - BLOCK
      ?auto_97688 - BLOCK
      ?auto_97689 - BLOCK
      ?auto_97690 - BLOCK
      ?auto_97687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97691 ?auto_97686 ) ( ON-TABLE ?auto_97685 ) ( ON ?auto_97686 ?auto_97685 ) ( not ( = ?auto_97685 ?auto_97686 ) ) ( not ( = ?auto_97685 ?auto_97691 ) ) ( not ( = ?auto_97686 ?auto_97691 ) ) ( not ( = ?auto_97685 ?auto_97688 ) ) ( not ( = ?auto_97685 ?auto_97689 ) ) ( not ( = ?auto_97686 ?auto_97688 ) ) ( not ( = ?auto_97686 ?auto_97689 ) ) ( not ( = ?auto_97691 ?auto_97688 ) ) ( not ( = ?auto_97691 ?auto_97689 ) ) ( not ( = ?auto_97688 ?auto_97689 ) ) ( ON ?auto_97688 ?auto_97691 ) ( not ( = ?auto_97690 ?auto_97687 ) ) ( not ( = ?auto_97690 ?auto_97689 ) ) ( not ( = ?auto_97687 ?auto_97689 ) ) ( not ( = ?auto_97685 ?auto_97687 ) ) ( not ( = ?auto_97685 ?auto_97690 ) ) ( not ( = ?auto_97686 ?auto_97687 ) ) ( not ( = ?auto_97686 ?auto_97690 ) ) ( not ( = ?auto_97691 ?auto_97687 ) ) ( not ( = ?auto_97691 ?auto_97690 ) ) ( not ( = ?auto_97688 ?auto_97687 ) ) ( not ( = ?auto_97688 ?auto_97690 ) ) ( ON ?auto_97689 ?auto_97688 ) ( ON ?auto_97687 ?auto_97689 ) ( HOLDING ?auto_97690 ) ( CLEAR ?auto_97687 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97685 ?auto_97686 ?auto_97691 ?auto_97688 ?auto_97689 ?auto_97687 ?auto_97690 )
      ( MAKE-2PILE ?auto_97685 ?auto_97686 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97692 - BLOCK
      ?auto_97693 - BLOCK
    )
    :vars
    (
      ?auto_97696 - BLOCK
      ?auto_97697 - BLOCK
      ?auto_97698 - BLOCK
      ?auto_97694 - BLOCK
      ?auto_97695 - BLOCK
      ?auto_97699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97696 ?auto_97693 ) ( ON-TABLE ?auto_97692 ) ( ON ?auto_97693 ?auto_97692 ) ( not ( = ?auto_97692 ?auto_97693 ) ) ( not ( = ?auto_97692 ?auto_97696 ) ) ( not ( = ?auto_97693 ?auto_97696 ) ) ( not ( = ?auto_97692 ?auto_97697 ) ) ( not ( = ?auto_97692 ?auto_97698 ) ) ( not ( = ?auto_97693 ?auto_97697 ) ) ( not ( = ?auto_97693 ?auto_97698 ) ) ( not ( = ?auto_97696 ?auto_97697 ) ) ( not ( = ?auto_97696 ?auto_97698 ) ) ( not ( = ?auto_97697 ?auto_97698 ) ) ( ON ?auto_97697 ?auto_97696 ) ( not ( = ?auto_97694 ?auto_97695 ) ) ( not ( = ?auto_97694 ?auto_97698 ) ) ( not ( = ?auto_97695 ?auto_97698 ) ) ( not ( = ?auto_97692 ?auto_97695 ) ) ( not ( = ?auto_97692 ?auto_97694 ) ) ( not ( = ?auto_97693 ?auto_97695 ) ) ( not ( = ?auto_97693 ?auto_97694 ) ) ( not ( = ?auto_97696 ?auto_97695 ) ) ( not ( = ?auto_97696 ?auto_97694 ) ) ( not ( = ?auto_97697 ?auto_97695 ) ) ( not ( = ?auto_97697 ?auto_97694 ) ) ( ON ?auto_97698 ?auto_97697 ) ( ON ?auto_97695 ?auto_97698 ) ( CLEAR ?auto_97695 ) ( ON ?auto_97694 ?auto_97699 ) ( CLEAR ?auto_97694 ) ( HAND-EMPTY ) ( not ( = ?auto_97692 ?auto_97699 ) ) ( not ( = ?auto_97693 ?auto_97699 ) ) ( not ( = ?auto_97696 ?auto_97699 ) ) ( not ( = ?auto_97697 ?auto_97699 ) ) ( not ( = ?auto_97698 ?auto_97699 ) ) ( not ( = ?auto_97694 ?auto_97699 ) ) ( not ( = ?auto_97695 ?auto_97699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97694 ?auto_97699 )
      ( MAKE-2PILE ?auto_97692 ?auto_97693 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97700 - BLOCK
      ?auto_97701 - BLOCK
    )
    :vars
    (
      ?auto_97702 - BLOCK
      ?auto_97703 - BLOCK
      ?auto_97706 - BLOCK
      ?auto_97707 - BLOCK
      ?auto_97704 - BLOCK
      ?auto_97705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97702 ?auto_97701 ) ( ON-TABLE ?auto_97700 ) ( ON ?auto_97701 ?auto_97700 ) ( not ( = ?auto_97700 ?auto_97701 ) ) ( not ( = ?auto_97700 ?auto_97702 ) ) ( not ( = ?auto_97701 ?auto_97702 ) ) ( not ( = ?auto_97700 ?auto_97703 ) ) ( not ( = ?auto_97700 ?auto_97706 ) ) ( not ( = ?auto_97701 ?auto_97703 ) ) ( not ( = ?auto_97701 ?auto_97706 ) ) ( not ( = ?auto_97702 ?auto_97703 ) ) ( not ( = ?auto_97702 ?auto_97706 ) ) ( not ( = ?auto_97703 ?auto_97706 ) ) ( ON ?auto_97703 ?auto_97702 ) ( not ( = ?auto_97707 ?auto_97704 ) ) ( not ( = ?auto_97707 ?auto_97706 ) ) ( not ( = ?auto_97704 ?auto_97706 ) ) ( not ( = ?auto_97700 ?auto_97704 ) ) ( not ( = ?auto_97700 ?auto_97707 ) ) ( not ( = ?auto_97701 ?auto_97704 ) ) ( not ( = ?auto_97701 ?auto_97707 ) ) ( not ( = ?auto_97702 ?auto_97704 ) ) ( not ( = ?auto_97702 ?auto_97707 ) ) ( not ( = ?auto_97703 ?auto_97704 ) ) ( not ( = ?auto_97703 ?auto_97707 ) ) ( ON ?auto_97706 ?auto_97703 ) ( ON ?auto_97707 ?auto_97705 ) ( CLEAR ?auto_97707 ) ( not ( = ?auto_97700 ?auto_97705 ) ) ( not ( = ?auto_97701 ?auto_97705 ) ) ( not ( = ?auto_97702 ?auto_97705 ) ) ( not ( = ?auto_97703 ?auto_97705 ) ) ( not ( = ?auto_97706 ?auto_97705 ) ) ( not ( = ?auto_97707 ?auto_97705 ) ) ( not ( = ?auto_97704 ?auto_97705 ) ) ( HOLDING ?auto_97704 ) ( CLEAR ?auto_97706 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97700 ?auto_97701 ?auto_97702 ?auto_97703 ?auto_97706 ?auto_97704 )
      ( MAKE-2PILE ?auto_97700 ?auto_97701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97708 - BLOCK
      ?auto_97709 - BLOCK
    )
    :vars
    (
      ?auto_97711 - BLOCK
      ?auto_97714 - BLOCK
      ?auto_97712 - BLOCK
      ?auto_97710 - BLOCK
      ?auto_97715 - BLOCK
      ?auto_97713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97711 ?auto_97709 ) ( ON-TABLE ?auto_97708 ) ( ON ?auto_97709 ?auto_97708 ) ( not ( = ?auto_97708 ?auto_97709 ) ) ( not ( = ?auto_97708 ?auto_97711 ) ) ( not ( = ?auto_97709 ?auto_97711 ) ) ( not ( = ?auto_97708 ?auto_97714 ) ) ( not ( = ?auto_97708 ?auto_97712 ) ) ( not ( = ?auto_97709 ?auto_97714 ) ) ( not ( = ?auto_97709 ?auto_97712 ) ) ( not ( = ?auto_97711 ?auto_97714 ) ) ( not ( = ?auto_97711 ?auto_97712 ) ) ( not ( = ?auto_97714 ?auto_97712 ) ) ( ON ?auto_97714 ?auto_97711 ) ( not ( = ?auto_97710 ?auto_97715 ) ) ( not ( = ?auto_97710 ?auto_97712 ) ) ( not ( = ?auto_97715 ?auto_97712 ) ) ( not ( = ?auto_97708 ?auto_97715 ) ) ( not ( = ?auto_97708 ?auto_97710 ) ) ( not ( = ?auto_97709 ?auto_97715 ) ) ( not ( = ?auto_97709 ?auto_97710 ) ) ( not ( = ?auto_97711 ?auto_97715 ) ) ( not ( = ?auto_97711 ?auto_97710 ) ) ( not ( = ?auto_97714 ?auto_97715 ) ) ( not ( = ?auto_97714 ?auto_97710 ) ) ( ON ?auto_97712 ?auto_97714 ) ( ON ?auto_97710 ?auto_97713 ) ( not ( = ?auto_97708 ?auto_97713 ) ) ( not ( = ?auto_97709 ?auto_97713 ) ) ( not ( = ?auto_97711 ?auto_97713 ) ) ( not ( = ?auto_97714 ?auto_97713 ) ) ( not ( = ?auto_97712 ?auto_97713 ) ) ( not ( = ?auto_97710 ?auto_97713 ) ) ( not ( = ?auto_97715 ?auto_97713 ) ) ( CLEAR ?auto_97712 ) ( ON ?auto_97715 ?auto_97710 ) ( CLEAR ?auto_97715 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97713 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97713 ?auto_97710 )
      ( MAKE-2PILE ?auto_97708 ?auto_97709 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97716 - BLOCK
      ?auto_97717 - BLOCK
    )
    :vars
    (
      ?auto_97718 - BLOCK
      ?auto_97723 - BLOCK
      ?auto_97720 - BLOCK
      ?auto_97722 - BLOCK
      ?auto_97721 - BLOCK
      ?auto_97719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97718 ?auto_97717 ) ( ON-TABLE ?auto_97716 ) ( ON ?auto_97717 ?auto_97716 ) ( not ( = ?auto_97716 ?auto_97717 ) ) ( not ( = ?auto_97716 ?auto_97718 ) ) ( not ( = ?auto_97717 ?auto_97718 ) ) ( not ( = ?auto_97716 ?auto_97723 ) ) ( not ( = ?auto_97716 ?auto_97720 ) ) ( not ( = ?auto_97717 ?auto_97723 ) ) ( not ( = ?auto_97717 ?auto_97720 ) ) ( not ( = ?auto_97718 ?auto_97723 ) ) ( not ( = ?auto_97718 ?auto_97720 ) ) ( not ( = ?auto_97723 ?auto_97720 ) ) ( ON ?auto_97723 ?auto_97718 ) ( not ( = ?auto_97722 ?auto_97721 ) ) ( not ( = ?auto_97722 ?auto_97720 ) ) ( not ( = ?auto_97721 ?auto_97720 ) ) ( not ( = ?auto_97716 ?auto_97721 ) ) ( not ( = ?auto_97716 ?auto_97722 ) ) ( not ( = ?auto_97717 ?auto_97721 ) ) ( not ( = ?auto_97717 ?auto_97722 ) ) ( not ( = ?auto_97718 ?auto_97721 ) ) ( not ( = ?auto_97718 ?auto_97722 ) ) ( not ( = ?auto_97723 ?auto_97721 ) ) ( not ( = ?auto_97723 ?auto_97722 ) ) ( ON ?auto_97722 ?auto_97719 ) ( not ( = ?auto_97716 ?auto_97719 ) ) ( not ( = ?auto_97717 ?auto_97719 ) ) ( not ( = ?auto_97718 ?auto_97719 ) ) ( not ( = ?auto_97723 ?auto_97719 ) ) ( not ( = ?auto_97720 ?auto_97719 ) ) ( not ( = ?auto_97722 ?auto_97719 ) ) ( not ( = ?auto_97721 ?auto_97719 ) ) ( ON ?auto_97721 ?auto_97722 ) ( CLEAR ?auto_97721 ) ( ON-TABLE ?auto_97719 ) ( HOLDING ?auto_97720 ) ( CLEAR ?auto_97723 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97716 ?auto_97717 ?auto_97718 ?auto_97723 ?auto_97720 )
      ( MAKE-2PILE ?auto_97716 ?auto_97717 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97724 - BLOCK
      ?auto_97725 - BLOCK
    )
    :vars
    (
      ?auto_97729 - BLOCK
      ?auto_97727 - BLOCK
      ?auto_97728 - BLOCK
      ?auto_97731 - BLOCK
      ?auto_97726 - BLOCK
      ?auto_97730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97729 ?auto_97725 ) ( ON-TABLE ?auto_97724 ) ( ON ?auto_97725 ?auto_97724 ) ( not ( = ?auto_97724 ?auto_97725 ) ) ( not ( = ?auto_97724 ?auto_97729 ) ) ( not ( = ?auto_97725 ?auto_97729 ) ) ( not ( = ?auto_97724 ?auto_97727 ) ) ( not ( = ?auto_97724 ?auto_97728 ) ) ( not ( = ?auto_97725 ?auto_97727 ) ) ( not ( = ?auto_97725 ?auto_97728 ) ) ( not ( = ?auto_97729 ?auto_97727 ) ) ( not ( = ?auto_97729 ?auto_97728 ) ) ( not ( = ?auto_97727 ?auto_97728 ) ) ( ON ?auto_97727 ?auto_97729 ) ( not ( = ?auto_97731 ?auto_97726 ) ) ( not ( = ?auto_97731 ?auto_97728 ) ) ( not ( = ?auto_97726 ?auto_97728 ) ) ( not ( = ?auto_97724 ?auto_97726 ) ) ( not ( = ?auto_97724 ?auto_97731 ) ) ( not ( = ?auto_97725 ?auto_97726 ) ) ( not ( = ?auto_97725 ?auto_97731 ) ) ( not ( = ?auto_97729 ?auto_97726 ) ) ( not ( = ?auto_97729 ?auto_97731 ) ) ( not ( = ?auto_97727 ?auto_97726 ) ) ( not ( = ?auto_97727 ?auto_97731 ) ) ( ON ?auto_97731 ?auto_97730 ) ( not ( = ?auto_97724 ?auto_97730 ) ) ( not ( = ?auto_97725 ?auto_97730 ) ) ( not ( = ?auto_97729 ?auto_97730 ) ) ( not ( = ?auto_97727 ?auto_97730 ) ) ( not ( = ?auto_97728 ?auto_97730 ) ) ( not ( = ?auto_97731 ?auto_97730 ) ) ( not ( = ?auto_97726 ?auto_97730 ) ) ( ON ?auto_97726 ?auto_97731 ) ( ON-TABLE ?auto_97730 ) ( CLEAR ?auto_97727 ) ( ON ?auto_97728 ?auto_97726 ) ( CLEAR ?auto_97728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97730 ?auto_97731 ?auto_97726 )
      ( MAKE-2PILE ?auto_97724 ?auto_97725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97732 - BLOCK
      ?auto_97733 - BLOCK
    )
    :vars
    (
      ?auto_97734 - BLOCK
      ?auto_97737 - BLOCK
      ?auto_97735 - BLOCK
      ?auto_97736 - BLOCK
      ?auto_97738 - BLOCK
      ?auto_97739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97734 ?auto_97733 ) ( ON-TABLE ?auto_97732 ) ( ON ?auto_97733 ?auto_97732 ) ( not ( = ?auto_97732 ?auto_97733 ) ) ( not ( = ?auto_97732 ?auto_97734 ) ) ( not ( = ?auto_97733 ?auto_97734 ) ) ( not ( = ?auto_97732 ?auto_97737 ) ) ( not ( = ?auto_97732 ?auto_97735 ) ) ( not ( = ?auto_97733 ?auto_97737 ) ) ( not ( = ?auto_97733 ?auto_97735 ) ) ( not ( = ?auto_97734 ?auto_97737 ) ) ( not ( = ?auto_97734 ?auto_97735 ) ) ( not ( = ?auto_97737 ?auto_97735 ) ) ( not ( = ?auto_97736 ?auto_97738 ) ) ( not ( = ?auto_97736 ?auto_97735 ) ) ( not ( = ?auto_97738 ?auto_97735 ) ) ( not ( = ?auto_97732 ?auto_97738 ) ) ( not ( = ?auto_97732 ?auto_97736 ) ) ( not ( = ?auto_97733 ?auto_97738 ) ) ( not ( = ?auto_97733 ?auto_97736 ) ) ( not ( = ?auto_97734 ?auto_97738 ) ) ( not ( = ?auto_97734 ?auto_97736 ) ) ( not ( = ?auto_97737 ?auto_97738 ) ) ( not ( = ?auto_97737 ?auto_97736 ) ) ( ON ?auto_97736 ?auto_97739 ) ( not ( = ?auto_97732 ?auto_97739 ) ) ( not ( = ?auto_97733 ?auto_97739 ) ) ( not ( = ?auto_97734 ?auto_97739 ) ) ( not ( = ?auto_97737 ?auto_97739 ) ) ( not ( = ?auto_97735 ?auto_97739 ) ) ( not ( = ?auto_97736 ?auto_97739 ) ) ( not ( = ?auto_97738 ?auto_97739 ) ) ( ON ?auto_97738 ?auto_97736 ) ( ON-TABLE ?auto_97739 ) ( ON ?auto_97735 ?auto_97738 ) ( CLEAR ?auto_97735 ) ( HOLDING ?auto_97737 ) ( CLEAR ?auto_97734 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97732 ?auto_97733 ?auto_97734 ?auto_97737 )
      ( MAKE-2PILE ?auto_97732 ?auto_97733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97740 - BLOCK
      ?auto_97741 - BLOCK
    )
    :vars
    (
      ?auto_97747 - BLOCK
      ?auto_97743 - BLOCK
      ?auto_97742 - BLOCK
      ?auto_97746 - BLOCK
      ?auto_97744 - BLOCK
      ?auto_97745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97747 ?auto_97741 ) ( ON-TABLE ?auto_97740 ) ( ON ?auto_97741 ?auto_97740 ) ( not ( = ?auto_97740 ?auto_97741 ) ) ( not ( = ?auto_97740 ?auto_97747 ) ) ( not ( = ?auto_97741 ?auto_97747 ) ) ( not ( = ?auto_97740 ?auto_97743 ) ) ( not ( = ?auto_97740 ?auto_97742 ) ) ( not ( = ?auto_97741 ?auto_97743 ) ) ( not ( = ?auto_97741 ?auto_97742 ) ) ( not ( = ?auto_97747 ?auto_97743 ) ) ( not ( = ?auto_97747 ?auto_97742 ) ) ( not ( = ?auto_97743 ?auto_97742 ) ) ( not ( = ?auto_97746 ?auto_97744 ) ) ( not ( = ?auto_97746 ?auto_97742 ) ) ( not ( = ?auto_97744 ?auto_97742 ) ) ( not ( = ?auto_97740 ?auto_97744 ) ) ( not ( = ?auto_97740 ?auto_97746 ) ) ( not ( = ?auto_97741 ?auto_97744 ) ) ( not ( = ?auto_97741 ?auto_97746 ) ) ( not ( = ?auto_97747 ?auto_97744 ) ) ( not ( = ?auto_97747 ?auto_97746 ) ) ( not ( = ?auto_97743 ?auto_97744 ) ) ( not ( = ?auto_97743 ?auto_97746 ) ) ( ON ?auto_97746 ?auto_97745 ) ( not ( = ?auto_97740 ?auto_97745 ) ) ( not ( = ?auto_97741 ?auto_97745 ) ) ( not ( = ?auto_97747 ?auto_97745 ) ) ( not ( = ?auto_97743 ?auto_97745 ) ) ( not ( = ?auto_97742 ?auto_97745 ) ) ( not ( = ?auto_97746 ?auto_97745 ) ) ( not ( = ?auto_97744 ?auto_97745 ) ) ( ON ?auto_97744 ?auto_97746 ) ( ON-TABLE ?auto_97745 ) ( ON ?auto_97742 ?auto_97744 ) ( CLEAR ?auto_97747 ) ( ON ?auto_97743 ?auto_97742 ) ( CLEAR ?auto_97743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97745 ?auto_97746 ?auto_97744 ?auto_97742 )
      ( MAKE-2PILE ?auto_97740 ?auto_97741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97764 - BLOCK
      ?auto_97765 - BLOCK
    )
    :vars
    (
      ?auto_97768 - BLOCK
      ?auto_97769 - BLOCK
      ?auto_97771 - BLOCK
      ?auto_97767 - BLOCK
      ?auto_97766 - BLOCK
      ?auto_97770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97764 ) ( not ( = ?auto_97764 ?auto_97765 ) ) ( not ( = ?auto_97764 ?auto_97768 ) ) ( not ( = ?auto_97765 ?auto_97768 ) ) ( not ( = ?auto_97764 ?auto_97769 ) ) ( not ( = ?auto_97764 ?auto_97771 ) ) ( not ( = ?auto_97765 ?auto_97769 ) ) ( not ( = ?auto_97765 ?auto_97771 ) ) ( not ( = ?auto_97768 ?auto_97769 ) ) ( not ( = ?auto_97768 ?auto_97771 ) ) ( not ( = ?auto_97769 ?auto_97771 ) ) ( not ( = ?auto_97767 ?auto_97766 ) ) ( not ( = ?auto_97767 ?auto_97771 ) ) ( not ( = ?auto_97766 ?auto_97771 ) ) ( not ( = ?auto_97764 ?auto_97766 ) ) ( not ( = ?auto_97764 ?auto_97767 ) ) ( not ( = ?auto_97765 ?auto_97766 ) ) ( not ( = ?auto_97765 ?auto_97767 ) ) ( not ( = ?auto_97768 ?auto_97766 ) ) ( not ( = ?auto_97768 ?auto_97767 ) ) ( not ( = ?auto_97769 ?auto_97766 ) ) ( not ( = ?auto_97769 ?auto_97767 ) ) ( ON ?auto_97767 ?auto_97770 ) ( not ( = ?auto_97764 ?auto_97770 ) ) ( not ( = ?auto_97765 ?auto_97770 ) ) ( not ( = ?auto_97768 ?auto_97770 ) ) ( not ( = ?auto_97769 ?auto_97770 ) ) ( not ( = ?auto_97771 ?auto_97770 ) ) ( not ( = ?auto_97767 ?auto_97770 ) ) ( not ( = ?auto_97766 ?auto_97770 ) ) ( ON ?auto_97766 ?auto_97767 ) ( ON-TABLE ?auto_97770 ) ( ON ?auto_97771 ?auto_97766 ) ( ON ?auto_97769 ?auto_97771 ) ( ON ?auto_97768 ?auto_97769 ) ( CLEAR ?auto_97768 ) ( HOLDING ?auto_97765 ) ( CLEAR ?auto_97764 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97764 ?auto_97765 ?auto_97768 )
      ( MAKE-2PILE ?auto_97764 ?auto_97765 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97772 - BLOCK
      ?auto_97773 - BLOCK
    )
    :vars
    (
      ?auto_97775 - BLOCK
      ?auto_97776 - BLOCK
      ?auto_97779 - BLOCK
      ?auto_97774 - BLOCK
      ?auto_97777 - BLOCK
      ?auto_97778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97772 ) ( not ( = ?auto_97772 ?auto_97773 ) ) ( not ( = ?auto_97772 ?auto_97775 ) ) ( not ( = ?auto_97773 ?auto_97775 ) ) ( not ( = ?auto_97772 ?auto_97776 ) ) ( not ( = ?auto_97772 ?auto_97779 ) ) ( not ( = ?auto_97773 ?auto_97776 ) ) ( not ( = ?auto_97773 ?auto_97779 ) ) ( not ( = ?auto_97775 ?auto_97776 ) ) ( not ( = ?auto_97775 ?auto_97779 ) ) ( not ( = ?auto_97776 ?auto_97779 ) ) ( not ( = ?auto_97774 ?auto_97777 ) ) ( not ( = ?auto_97774 ?auto_97779 ) ) ( not ( = ?auto_97777 ?auto_97779 ) ) ( not ( = ?auto_97772 ?auto_97777 ) ) ( not ( = ?auto_97772 ?auto_97774 ) ) ( not ( = ?auto_97773 ?auto_97777 ) ) ( not ( = ?auto_97773 ?auto_97774 ) ) ( not ( = ?auto_97775 ?auto_97777 ) ) ( not ( = ?auto_97775 ?auto_97774 ) ) ( not ( = ?auto_97776 ?auto_97777 ) ) ( not ( = ?auto_97776 ?auto_97774 ) ) ( ON ?auto_97774 ?auto_97778 ) ( not ( = ?auto_97772 ?auto_97778 ) ) ( not ( = ?auto_97773 ?auto_97778 ) ) ( not ( = ?auto_97775 ?auto_97778 ) ) ( not ( = ?auto_97776 ?auto_97778 ) ) ( not ( = ?auto_97779 ?auto_97778 ) ) ( not ( = ?auto_97774 ?auto_97778 ) ) ( not ( = ?auto_97777 ?auto_97778 ) ) ( ON ?auto_97777 ?auto_97774 ) ( ON-TABLE ?auto_97778 ) ( ON ?auto_97779 ?auto_97777 ) ( ON ?auto_97776 ?auto_97779 ) ( ON ?auto_97775 ?auto_97776 ) ( CLEAR ?auto_97772 ) ( ON ?auto_97773 ?auto_97775 ) ( CLEAR ?auto_97773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97778 ?auto_97774 ?auto_97777 ?auto_97779 ?auto_97776 ?auto_97775 )
      ( MAKE-2PILE ?auto_97772 ?auto_97773 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97780 - BLOCK
      ?auto_97781 - BLOCK
    )
    :vars
    (
      ?auto_97786 - BLOCK
      ?auto_97785 - BLOCK
      ?auto_97783 - BLOCK
      ?auto_97784 - BLOCK
      ?auto_97787 - BLOCK
      ?auto_97782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97780 ?auto_97781 ) ) ( not ( = ?auto_97780 ?auto_97786 ) ) ( not ( = ?auto_97781 ?auto_97786 ) ) ( not ( = ?auto_97780 ?auto_97785 ) ) ( not ( = ?auto_97780 ?auto_97783 ) ) ( not ( = ?auto_97781 ?auto_97785 ) ) ( not ( = ?auto_97781 ?auto_97783 ) ) ( not ( = ?auto_97786 ?auto_97785 ) ) ( not ( = ?auto_97786 ?auto_97783 ) ) ( not ( = ?auto_97785 ?auto_97783 ) ) ( not ( = ?auto_97784 ?auto_97787 ) ) ( not ( = ?auto_97784 ?auto_97783 ) ) ( not ( = ?auto_97787 ?auto_97783 ) ) ( not ( = ?auto_97780 ?auto_97787 ) ) ( not ( = ?auto_97780 ?auto_97784 ) ) ( not ( = ?auto_97781 ?auto_97787 ) ) ( not ( = ?auto_97781 ?auto_97784 ) ) ( not ( = ?auto_97786 ?auto_97787 ) ) ( not ( = ?auto_97786 ?auto_97784 ) ) ( not ( = ?auto_97785 ?auto_97787 ) ) ( not ( = ?auto_97785 ?auto_97784 ) ) ( ON ?auto_97784 ?auto_97782 ) ( not ( = ?auto_97780 ?auto_97782 ) ) ( not ( = ?auto_97781 ?auto_97782 ) ) ( not ( = ?auto_97786 ?auto_97782 ) ) ( not ( = ?auto_97785 ?auto_97782 ) ) ( not ( = ?auto_97783 ?auto_97782 ) ) ( not ( = ?auto_97784 ?auto_97782 ) ) ( not ( = ?auto_97787 ?auto_97782 ) ) ( ON ?auto_97787 ?auto_97784 ) ( ON-TABLE ?auto_97782 ) ( ON ?auto_97783 ?auto_97787 ) ( ON ?auto_97785 ?auto_97783 ) ( ON ?auto_97786 ?auto_97785 ) ( ON ?auto_97781 ?auto_97786 ) ( CLEAR ?auto_97781 ) ( HOLDING ?auto_97780 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97780 )
      ( MAKE-2PILE ?auto_97780 ?auto_97781 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97788 - BLOCK
      ?auto_97789 - BLOCK
    )
    :vars
    (
      ?auto_97793 - BLOCK
      ?auto_97792 - BLOCK
      ?auto_97791 - BLOCK
      ?auto_97790 - BLOCK
      ?auto_97795 - BLOCK
      ?auto_97794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97788 ?auto_97789 ) ) ( not ( = ?auto_97788 ?auto_97793 ) ) ( not ( = ?auto_97789 ?auto_97793 ) ) ( not ( = ?auto_97788 ?auto_97792 ) ) ( not ( = ?auto_97788 ?auto_97791 ) ) ( not ( = ?auto_97789 ?auto_97792 ) ) ( not ( = ?auto_97789 ?auto_97791 ) ) ( not ( = ?auto_97793 ?auto_97792 ) ) ( not ( = ?auto_97793 ?auto_97791 ) ) ( not ( = ?auto_97792 ?auto_97791 ) ) ( not ( = ?auto_97790 ?auto_97795 ) ) ( not ( = ?auto_97790 ?auto_97791 ) ) ( not ( = ?auto_97795 ?auto_97791 ) ) ( not ( = ?auto_97788 ?auto_97795 ) ) ( not ( = ?auto_97788 ?auto_97790 ) ) ( not ( = ?auto_97789 ?auto_97795 ) ) ( not ( = ?auto_97789 ?auto_97790 ) ) ( not ( = ?auto_97793 ?auto_97795 ) ) ( not ( = ?auto_97793 ?auto_97790 ) ) ( not ( = ?auto_97792 ?auto_97795 ) ) ( not ( = ?auto_97792 ?auto_97790 ) ) ( ON ?auto_97790 ?auto_97794 ) ( not ( = ?auto_97788 ?auto_97794 ) ) ( not ( = ?auto_97789 ?auto_97794 ) ) ( not ( = ?auto_97793 ?auto_97794 ) ) ( not ( = ?auto_97792 ?auto_97794 ) ) ( not ( = ?auto_97791 ?auto_97794 ) ) ( not ( = ?auto_97790 ?auto_97794 ) ) ( not ( = ?auto_97795 ?auto_97794 ) ) ( ON ?auto_97795 ?auto_97790 ) ( ON-TABLE ?auto_97794 ) ( ON ?auto_97791 ?auto_97795 ) ( ON ?auto_97792 ?auto_97791 ) ( ON ?auto_97793 ?auto_97792 ) ( ON ?auto_97789 ?auto_97793 ) ( ON ?auto_97788 ?auto_97789 ) ( CLEAR ?auto_97788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97794 ?auto_97790 ?auto_97795 ?auto_97791 ?auto_97792 ?auto_97793 ?auto_97789 )
      ( MAKE-2PILE ?auto_97788 ?auto_97789 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97801 - BLOCK
      ?auto_97802 - BLOCK
      ?auto_97803 - BLOCK
      ?auto_97804 - BLOCK
      ?auto_97805 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_97805 ) ( CLEAR ?auto_97804 ) ( ON-TABLE ?auto_97801 ) ( ON ?auto_97802 ?auto_97801 ) ( ON ?auto_97803 ?auto_97802 ) ( ON ?auto_97804 ?auto_97803 ) ( not ( = ?auto_97801 ?auto_97802 ) ) ( not ( = ?auto_97801 ?auto_97803 ) ) ( not ( = ?auto_97801 ?auto_97804 ) ) ( not ( = ?auto_97801 ?auto_97805 ) ) ( not ( = ?auto_97802 ?auto_97803 ) ) ( not ( = ?auto_97802 ?auto_97804 ) ) ( not ( = ?auto_97802 ?auto_97805 ) ) ( not ( = ?auto_97803 ?auto_97804 ) ) ( not ( = ?auto_97803 ?auto_97805 ) ) ( not ( = ?auto_97804 ?auto_97805 ) ) )
    :subtasks
    ( ( !STACK ?auto_97805 ?auto_97804 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97806 - BLOCK
      ?auto_97807 - BLOCK
      ?auto_97808 - BLOCK
      ?auto_97809 - BLOCK
      ?auto_97810 - BLOCK
    )
    :vars
    (
      ?auto_97811 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_97809 ) ( ON-TABLE ?auto_97806 ) ( ON ?auto_97807 ?auto_97806 ) ( ON ?auto_97808 ?auto_97807 ) ( ON ?auto_97809 ?auto_97808 ) ( not ( = ?auto_97806 ?auto_97807 ) ) ( not ( = ?auto_97806 ?auto_97808 ) ) ( not ( = ?auto_97806 ?auto_97809 ) ) ( not ( = ?auto_97806 ?auto_97810 ) ) ( not ( = ?auto_97807 ?auto_97808 ) ) ( not ( = ?auto_97807 ?auto_97809 ) ) ( not ( = ?auto_97807 ?auto_97810 ) ) ( not ( = ?auto_97808 ?auto_97809 ) ) ( not ( = ?auto_97808 ?auto_97810 ) ) ( not ( = ?auto_97809 ?auto_97810 ) ) ( ON ?auto_97810 ?auto_97811 ) ( CLEAR ?auto_97810 ) ( HAND-EMPTY ) ( not ( = ?auto_97806 ?auto_97811 ) ) ( not ( = ?auto_97807 ?auto_97811 ) ) ( not ( = ?auto_97808 ?auto_97811 ) ) ( not ( = ?auto_97809 ?auto_97811 ) ) ( not ( = ?auto_97810 ?auto_97811 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97810 ?auto_97811 )
      ( MAKE-5PILE ?auto_97806 ?auto_97807 ?auto_97808 ?auto_97809 ?auto_97810 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97812 - BLOCK
      ?auto_97813 - BLOCK
      ?auto_97814 - BLOCK
      ?auto_97815 - BLOCK
      ?auto_97816 - BLOCK
    )
    :vars
    (
      ?auto_97817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97812 ) ( ON ?auto_97813 ?auto_97812 ) ( ON ?auto_97814 ?auto_97813 ) ( not ( = ?auto_97812 ?auto_97813 ) ) ( not ( = ?auto_97812 ?auto_97814 ) ) ( not ( = ?auto_97812 ?auto_97815 ) ) ( not ( = ?auto_97812 ?auto_97816 ) ) ( not ( = ?auto_97813 ?auto_97814 ) ) ( not ( = ?auto_97813 ?auto_97815 ) ) ( not ( = ?auto_97813 ?auto_97816 ) ) ( not ( = ?auto_97814 ?auto_97815 ) ) ( not ( = ?auto_97814 ?auto_97816 ) ) ( not ( = ?auto_97815 ?auto_97816 ) ) ( ON ?auto_97816 ?auto_97817 ) ( CLEAR ?auto_97816 ) ( not ( = ?auto_97812 ?auto_97817 ) ) ( not ( = ?auto_97813 ?auto_97817 ) ) ( not ( = ?auto_97814 ?auto_97817 ) ) ( not ( = ?auto_97815 ?auto_97817 ) ) ( not ( = ?auto_97816 ?auto_97817 ) ) ( HOLDING ?auto_97815 ) ( CLEAR ?auto_97814 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97812 ?auto_97813 ?auto_97814 ?auto_97815 )
      ( MAKE-5PILE ?auto_97812 ?auto_97813 ?auto_97814 ?auto_97815 ?auto_97816 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97818 - BLOCK
      ?auto_97819 - BLOCK
      ?auto_97820 - BLOCK
      ?auto_97821 - BLOCK
      ?auto_97822 - BLOCK
    )
    :vars
    (
      ?auto_97823 - BLOCK
      ?auto_97824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97818 ) ( ON ?auto_97819 ?auto_97818 ) ( ON ?auto_97820 ?auto_97819 ) ( not ( = ?auto_97818 ?auto_97819 ) ) ( not ( = ?auto_97818 ?auto_97820 ) ) ( not ( = ?auto_97818 ?auto_97821 ) ) ( not ( = ?auto_97818 ?auto_97822 ) ) ( not ( = ?auto_97819 ?auto_97820 ) ) ( not ( = ?auto_97819 ?auto_97821 ) ) ( not ( = ?auto_97819 ?auto_97822 ) ) ( not ( = ?auto_97820 ?auto_97821 ) ) ( not ( = ?auto_97820 ?auto_97822 ) ) ( not ( = ?auto_97821 ?auto_97822 ) ) ( ON ?auto_97822 ?auto_97823 ) ( not ( = ?auto_97818 ?auto_97823 ) ) ( not ( = ?auto_97819 ?auto_97823 ) ) ( not ( = ?auto_97820 ?auto_97823 ) ) ( not ( = ?auto_97821 ?auto_97823 ) ) ( not ( = ?auto_97822 ?auto_97823 ) ) ( CLEAR ?auto_97820 ) ( ON ?auto_97821 ?auto_97822 ) ( CLEAR ?auto_97821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97824 ) ( ON ?auto_97823 ?auto_97824 ) ( not ( = ?auto_97824 ?auto_97823 ) ) ( not ( = ?auto_97824 ?auto_97822 ) ) ( not ( = ?auto_97824 ?auto_97821 ) ) ( not ( = ?auto_97818 ?auto_97824 ) ) ( not ( = ?auto_97819 ?auto_97824 ) ) ( not ( = ?auto_97820 ?auto_97824 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97824 ?auto_97823 ?auto_97822 )
      ( MAKE-5PILE ?auto_97818 ?auto_97819 ?auto_97820 ?auto_97821 ?auto_97822 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97825 - BLOCK
      ?auto_97826 - BLOCK
      ?auto_97827 - BLOCK
      ?auto_97828 - BLOCK
      ?auto_97829 - BLOCK
    )
    :vars
    (
      ?auto_97831 - BLOCK
      ?auto_97830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97825 ) ( ON ?auto_97826 ?auto_97825 ) ( not ( = ?auto_97825 ?auto_97826 ) ) ( not ( = ?auto_97825 ?auto_97827 ) ) ( not ( = ?auto_97825 ?auto_97828 ) ) ( not ( = ?auto_97825 ?auto_97829 ) ) ( not ( = ?auto_97826 ?auto_97827 ) ) ( not ( = ?auto_97826 ?auto_97828 ) ) ( not ( = ?auto_97826 ?auto_97829 ) ) ( not ( = ?auto_97827 ?auto_97828 ) ) ( not ( = ?auto_97827 ?auto_97829 ) ) ( not ( = ?auto_97828 ?auto_97829 ) ) ( ON ?auto_97829 ?auto_97831 ) ( not ( = ?auto_97825 ?auto_97831 ) ) ( not ( = ?auto_97826 ?auto_97831 ) ) ( not ( = ?auto_97827 ?auto_97831 ) ) ( not ( = ?auto_97828 ?auto_97831 ) ) ( not ( = ?auto_97829 ?auto_97831 ) ) ( ON ?auto_97828 ?auto_97829 ) ( CLEAR ?auto_97828 ) ( ON-TABLE ?auto_97830 ) ( ON ?auto_97831 ?auto_97830 ) ( not ( = ?auto_97830 ?auto_97831 ) ) ( not ( = ?auto_97830 ?auto_97829 ) ) ( not ( = ?auto_97830 ?auto_97828 ) ) ( not ( = ?auto_97825 ?auto_97830 ) ) ( not ( = ?auto_97826 ?auto_97830 ) ) ( not ( = ?auto_97827 ?auto_97830 ) ) ( HOLDING ?auto_97827 ) ( CLEAR ?auto_97826 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97825 ?auto_97826 ?auto_97827 )
      ( MAKE-5PILE ?auto_97825 ?auto_97826 ?auto_97827 ?auto_97828 ?auto_97829 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97832 - BLOCK
      ?auto_97833 - BLOCK
      ?auto_97834 - BLOCK
      ?auto_97835 - BLOCK
      ?auto_97836 - BLOCK
    )
    :vars
    (
      ?auto_97837 - BLOCK
      ?auto_97838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97832 ) ( ON ?auto_97833 ?auto_97832 ) ( not ( = ?auto_97832 ?auto_97833 ) ) ( not ( = ?auto_97832 ?auto_97834 ) ) ( not ( = ?auto_97832 ?auto_97835 ) ) ( not ( = ?auto_97832 ?auto_97836 ) ) ( not ( = ?auto_97833 ?auto_97834 ) ) ( not ( = ?auto_97833 ?auto_97835 ) ) ( not ( = ?auto_97833 ?auto_97836 ) ) ( not ( = ?auto_97834 ?auto_97835 ) ) ( not ( = ?auto_97834 ?auto_97836 ) ) ( not ( = ?auto_97835 ?auto_97836 ) ) ( ON ?auto_97836 ?auto_97837 ) ( not ( = ?auto_97832 ?auto_97837 ) ) ( not ( = ?auto_97833 ?auto_97837 ) ) ( not ( = ?auto_97834 ?auto_97837 ) ) ( not ( = ?auto_97835 ?auto_97837 ) ) ( not ( = ?auto_97836 ?auto_97837 ) ) ( ON ?auto_97835 ?auto_97836 ) ( ON-TABLE ?auto_97838 ) ( ON ?auto_97837 ?auto_97838 ) ( not ( = ?auto_97838 ?auto_97837 ) ) ( not ( = ?auto_97838 ?auto_97836 ) ) ( not ( = ?auto_97838 ?auto_97835 ) ) ( not ( = ?auto_97832 ?auto_97838 ) ) ( not ( = ?auto_97833 ?auto_97838 ) ) ( not ( = ?auto_97834 ?auto_97838 ) ) ( CLEAR ?auto_97833 ) ( ON ?auto_97834 ?auto_97835 ) ( CLEAR ?auto_97834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97838 ?auto_97837 ?auto_97836 ?auto_97835 )
      ( MAKE-5PILE ?auto_97832 ?auto_97833 ?auto_97834 ?auto_97835 ?auto_97836 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97839 - BLOCK
      ?auto_97840 - BLOCK
      ?auto_97841 - BLOCK
      ?auto_97842 - BLOCK
      ?auto_97843 - BLOCK
    )
    :vars
    (
      ?auto_97845 - BLOCK
      ?auto_97844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97839 ) ( not ( = ?auto_97839 ?auto_97840 ) ) ( not ( = ?auto_97839 ?auto_97841 ) ) ( not ( = ?auto_97839 ?auto_97842 ) ) ( not ( = ?auto_97839 ?auto_97843 ) ) ( not ( = ?auto_97840 ?auto_97841 ) ) ( not ( = ?auto_97840 ?auto_97842 ) ) ( not ( = ?auto_97840 ?auto_97843 ) ) ( not ( = ?auto_97841 ?auto_97842 ) ) ( not ( = ?auto_97841 ?auto_97843 ) ) ( not ( = ?auto_97842 ?auto_97843 ) ) ( ON ?auto_97843 ?auto_97845 ) ( not ( = ?auto_97839 ?auto_97845 ) ) ( not ( = ?auto_97840 ?auto_97845 ) ) ( not ( = ?auto_97841 ?auto_97845 ) ) ( not ( = ?auto_97842 ?auto_97845 ) ) ( not ( = ?auto_97843 ?auto_97845 ) ) ( ON ?auto_97842 ?auto_97843 ) ( ON-TABLE ?auto_97844 ) ( ON ?auto_97845 ?auto_97844 ) ( not ( = ?auto_97844 ?auto_97845 ) ) ( not ( = ?auto_97844 ?auto_97843 ) ) ( not ( = ?auto_97844 ?auto_97842 ) ) ( not ( = ?auto_97839 ?auto_97844 ) ) ( not ( = ?auto_97840 ?auto_97844 ) ) ( not ( = ?auto_97841 ?auto_97844 ) ) ( ON ?auto_97841 ?auto_97842 ) ( CLEAR ?auto_97841 ) ( HOLDING ?auto_97840 ) ( CLEAR ?auto_97839 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97839 ?auto_97840 )
      ( MAKE-5PILE ?auto_97839 ?auto_97840 ?auto_97841 ?auto_97842 ?auto_97843 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97846 - BLOCK
      ?auto_97847 - BLOCK
      ?auto_97848 - BLOCK
      ?auto_97849 - BLOCK
      ?auto_97850 - BLOCK
    )
    :vars
    (
      ?auto_97852 - BLOCK
      ?auto_97851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97846 ) ( not ( = ?auto_97846 ?auto_97847 ) ) ( not ( = ?auto_97846 ?auto_97848 ) ) ( not ( = ?auto_97846 ?auto_97849 ) ) ( not ( = ?auto_97846 ?auto_97850 ) ) ( not ( = ?auto_97847 ?auto_97848 ) ) ( not ( = ?auto_97847 ?auto_97849 ) ) ( not ( = ?auto_97847 ?auto_97850 ) ) ( not ( = ?auto_97848 ?auto_97849 ) ) ( not ( = ?auto_97848 ?auto_97850 ) ) ( not ( = ?auto_97849 ?auto_97850 ) ) ( ON ?auto_97850 ?auto_97852 ) ( not ( = ?auto_97846 ?auto_97852 ) ) ( not ( = ?auto_97847 ?auto_97852 ) ) ( not ( = ?auto_97848 ?auto_97852 ) ) ( not ( = ?auto_97849 ?auto_97852 ) ) ( not ( = ?auto_97850 ?auto_97852 ) ) ( ON ?auto_97849 ?auto_97850 ) ( ON-TABLE ?auto_97851 ) ( ON ?auto_97852 ?auto_97851 ) ( not ( = ?auto_97851 ?auto_97852 ) ) ( not ( = ?auto_97851 ?auto_97850 ) ) ( not ( = ?auto_97851 ?auto_97849 ) ) ( not ( = ?auto_97846 ?auto_97851 ) ) ( not ( = ?auto_97847 ?auto_97851 ) ) ( not ( = ?auto_97848 ?auto_97851 ) ) ( ON ?auto_97848 ?auto_97849 ) ( CLEAR ?auto_97846 ) ( ON ?auto_97847 ?auto_97848 ) ( CLEAR ?auto_97847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97851 ?auto_97852 ?auto_97850 ?auto_97849 ?auto_97848 )
      ( MAKE-5PILE ?auto_97846 ?auto_97847 ?auto_97848 ?auto_97849 ?auto_97850 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97853 - BLOCK
      ?auto_97854 - BLOCK
      ?auto_97855 - BLOCK
      ?auto_97856 - BLOCK
      ?auto_97857 - BLOCK
    )
    :vars
    (
      ?auto_97858 - BLOCK
      ?auto_97859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97853 ?auto_97854 ) ) ( not ( = ?auto_97853 ?auto_97855 ) ) ( not ( = ?auto_97853 ?auto_97856 ) ) ( not ( = ?auto_97853 ?auto_97857 ) ) ( not ( = ?auto_97854 ?auto_97855 ) ) ( not ( = ?auto_97854 ?auto_97856 ) ) ( not ( = ?auto_97854 ?auto_97857 ) ) ( not ( = ?auto_97855 ?auto_97856 ) ) ( not ( = ?auto_97855 ?auto_97857 ) ) ( not ( = ?auto_97856 ?auto_97857 ) ) ( ON ?auto_97857 ?auto_97858 ) ( not ( = ?auto_97853 ?auto_97858 ) ) ( not ( = ?auto_97854 ?auto_97858 ) ) ( not ( = ?auto_97855 ?auto_97858 ) ) ( not ( = ?auto_97856 ?auto_97858 ) ) ( not ( = ?auto_97857 ?auto_97858 ) ) ( ON ?auto_97856 ?auto_97857 ) ( ON-TABLE ?auto_97859 ) ( ON ?auto_97858 ?auto_97859 ) ( not ( = ?auto_97859 ?auto_97858 ) ) ( not ( = ?auto_97859 ?auto_97857 ) ) ( not ( = ?auto_97859 ?auto_97856 ) ) ( not ( = ?auto_97853 ?auto_97859 ) ) ( not ( = ?auto_97854 ?auto_97859 ) ) ( not ( = ?auto_97855 ?auto_97859 ) ) ( ON ?auto_97855 ?auto_97856 ) ( ON ?auto_97854 ?auto_97855 ) ( CLEAR ?auto_97854 ) ( HOLDING ?auto_97853 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97853 )
      ( MAKE-5PILE ?auto_97853 ?auto_97854 ?auto_97855 ?auto_97856 ?auto_97857 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97860 - BLOCK
      ?auto_97861 - BLOCK
      ?auto_97862 - BLOCK
      ?auto_97863 - BLOCK
      ?auto_97864 - BLOCK
    )
    :vars
    (
      ?auto_97865 - BLOCK
      ?auto_97866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97860 ?auto_97861 ) ) ( not ( = ?auto_97860 ?auto_97862 ) ) ( not ( = ?auto_97860 ?auto_97863 ) ) ( not ( = ?auto_97860 ?auto_97864 ) ) ( not ( = ?auto_97861 ?auto_97862 ) ) ( not ( = ?auto_97861 ?auto_97863 ) ) ( not ( = ?auto_97861 ?auto_97864 ) ) ( not ( = ?auto_97862 ?auto_97863 ) ) ( not ( = ?auto_97862 ?auto_97864 ) ) ( not ( = ?auto_97863 ?auto_97864 ) ) ( ON ?auto_97864 ?auto_97865 ) ( not ( = ?auto_97860 ?auto_97865 ) ) ( not ( = ?auto_97861 ?auto_97865 ) ) ( not ( = ?auto_97862 ?auto_97865 ) ) ( not ( = ?auto_97863 ?auto_97865 ) ) ( not ( = ?auto_97864 ?auto_97865 ) ) ( ON ?auto_97863 ?auto_97864 ) ( ON-TABLE ?auto_97866 ) ( ON ?auto_97865 ?auto_97866 ) ( not ( = ?auto_97866 ?auto_97865 ) ) ( not ( = ?auto_97866 ?auto_97864 ) ) ( not ( = ?auto_97866 ?auto_97863 ) ) ( not ( = ?auto_97860 ?auto_97866 ) ) ( not ( = ?auto_97861 ?auto_97866 ) ) ( not ( = ?auto_97862 ?auto_97866 ) ) ( ON ?auto_97862 ?auto_97863 ) ( ON ?auto_97861 ?auto_97862 ) ( ON ?auto_97860 ?auto_97861 ) ( CLEAR ?auto_97860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97866 ?auto_97865 ?auto_97864 ?auto_97863 ?auto_97862 ?auto_97861 )
      ( MAKE-5PILE ?auto_97860 ?auto_97861 ?auto_97862 ?auto_97863 ?auto_97864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97867 - BLOCK
      ?auto_97868 - BLOCK
      ?auto_97869 - BLOCK
      ?auto_97870 - BLOCK
      ?auto_97871 - BLOCK
    )
    :vars
    (
      ?auto_97873 - BLOCK
      ?auto_97872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97867 ?auto_97868 ) ) ( not ( = ?auto_97867 ?auto_97869 ) ) ( not ( = ?auto_97867 ?auto_97870 ) ) ( not ( = ?auto_97867 ?auto_97871 ) ) ( not ( = ?auto_97868 ?auto_97869 ) ) ( not ( = ?auto_97868 ?auto_97870 ) ) ( not ( = ?auto_97868 ?auto_97871 ) ) ( not ( = ?auto_97869 ?auto_97870 ) ) ( not ( = ?auto_97869 ?auto_97871 ) ) ( not ( = ?auto_97870 ?auto_97871 ) ) ( ON ?auto_97871 ?auto_97873 ) ( not ( = ?auto_97867 ?auto_97873 ) ) ( not ( = ?auto_97868 ?auto_97873 ) ) ( not ( = ?auto_97869 ?auto_97873 ) ) ( not ( = ?auto_97870 ?auto_97873 ) ) ( not ( = ?auto_97871 ?auto_97873 ) ) ( ON ?auto_97870 ?auto_97871 ) ( ON-TABLE ?auto_97872 ) ( ON ?auto_97873 ?auto_97872 ) ( not ( = ?auto_97872 ?auto_97873 ) ) ( not ( = ?auto_97872 ?auto_97871 ) ) ( not ( = ?auto_97872 ?auto_97870 ) ) ( not ( = ?auto_97867 ?auto_97872 ) ) ( not ( = ?auto_97868 ?auto_97872 ) ) ( not ( = ?auto_97869 ?auto_97872 ) ) ( ON ?auto_97869 ?auto_97870 ) ( ON ?auto_97868 ?auto_97869 ) ( HOLDING ?auto_97867 ) ( CLEAR ?auto_97868 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97872 ?auto_97873 ?auto_97871 ?auto_97870 ?auto_97869 ?auto_97868 ?auto_97867 )
      ( MAKE-5PILE ?auto_97867 ?auto_97868 ?auto_97869 ?auto_97870 ?auto_97871 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97874 - BLOCK
      ?auto_97875 - BLOCK
      ?auto_97876 - BLOCK
      ?auto_97877 - BLOCK
      ?auto_97878 - BLOCK
    )
    :vars
    (
      ?auto_97880 - BLOCK
      ?auto_97879 - BLOCK
      ?auto_97881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97874 ?auto_97875 ) ) ( not ( = ?auto_97874 ?auto_97876 ) ) ( not ( = ?auto_97874 ?auto_97877 ) ) ( not ( = ?auto_97874 ?auto_97878 ) ) ( not ( = ?auto_97875 ?auto_97876 ) ) ( not ( = ?auto_97875 ?auto_97877 ) ) ( not ( = ?auto_97875 ?auto_97878 ) ) ( not ( = ?auto_97876 ?auto_97877 ) ) ( not ( = ?auto_97876 ?auto_97878 ) ) ( not ( = ?auto_97877 ?auto_97878 ) ) ( ON ?auto_97878 ?auto_97880 ) ( not ( = ?auto_97874 ?auto_97880 ) ) ( not ( = ?auto_97875 ?auto_97880 ) ) ( not ( = ?auto_97876 ?auto_97880 ) ) ( not ( = ?auto_97877 ?auto_97880 ) ) ( not ( = ?auto_97878 ?auto_97880 ) ) ( ON ?auto_97877 ?auto_97878 ) ( ON-TABLE ?auto_97879 ) ( ON ?auto_97880 ?auto_97879 ) ( not ( = ?auto_97879 ?auto_97880 ) ) ( not ( = ?auto_97879 ?auto_97878 ) ) ( not ( = ?auto_97879 ?auto_97877 ) ) ( not ( = ?auto_97874 ?auto_97879 ) ) ( not ( = ?auto_97875 ?auto_97879 ) ) ( not ( = ?auto_97876 ?auto_97879 ) ) ( ON ?auto_97876 ?auto_97877 ) ( ON ?auto_97875 ?auto_97876 ) ( CLEAR ?auto_97875 ) ( ON ?auto_97874 ?auto_97881 ) ( CLEAR ?auto_97874 ) ( HAND-EMPTY ) ( not ( = ?auto_97874 ?auto_97881 ) ) ( not ( = ?auto_97875 ?auto_97881 ) ) ( not ( = ?auto_97876 ?auto_97881 ) ) ( not ( = ?auto_97877 ?auto_97881 ) ) ( not ( = ?auto_97878 ?auto_97881 ) ) ( not ( = ?auto_97880 ?auto_97881 ) ) ( not ( = ?auto_97879 ?auto_97881 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97874 ?auto_97881 )
      ( MAKE-5PILE ?auto_97874 ?auto_97875 ?auto_97876 ?auto_97877 ?auto_97878 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97882 - BLOCK
      ?auto_97883 - BLOCK
      ?auto_97884 - BLOCK
      ?auto_97885 - BLOCK
      ?auto_97886 - BLOCK
    )
    :vars
    (
      ?auto_97888 - BLOCK
      ?auto_97887 - BLOCK
      ?auto_97889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97882 ?auto_97883 ) ) ( not ( = ?auto_97882 ?auto_97884 ) ) ( not ( = ?auto_97882 ?auto_97885 ) ) ( not ( = ?auto_97882 ?auto_97886 ) ) ( not ( = ?auto_97883 ?auto_97884 ) ) ( not ( = ?auto_97883 ?auto_97885 ) ) ( not ( = ?auto_97883 ?auto_97886 ) ) ( not ( = ?auto_97884 ?auto_97885 ) ) ( not ( = ?auto_97884 ?auto_97886 ) ) ( not ( = ?auto_97885 ?auto_97886 ) ) ( ON ?auto_97886 ?auto_97888 ) ( not ( = ?auto_97882 ?auto_97888 ) ) ( not ( = ?auto_97883 ?auto_97888 ) ) ( not ( = ?auto_97884 ?auto_97888 ) ) ( not ( = ?auto_97885 ?auto_97888 ) ) ( not ( = ?auto_97886 ?auto_97888 ) ) ( ON ?auto_97885 ?auto_97886 ) ( ON-TABLE ?auto_97887 ) ( ON ?auto_97888 ?auto_97887 ) ( not ( = ?auto_97887 ?auto_97888 ) ) ( not ( = ?auto_97887 ?auto_97886 ) ) ( not ( = ?auto_97887 ?auto_97885 ) ) ( not ( = ?auto_97882 ?auto_97887 ) ) ( not ( = ?auto_97883 ?auto_97887 ) ) ( not ( = ?auto_97884 ?auto_97887 ) ) ( ON ?auto_97884 ?auto_97885 ) ( ON ?auto_97882 ?auto_97889 ) ( CLEAR ?auto_97882 ) ( not ( = ?auto_97882 ?auto_97889 ) ) ( not ( = ?auto_97883 ?auto_97889 ) ) ( not ( = ?auto_97884 ?auto_97889 ) ) ( not ( = ?auto_97885 ?auto_97889 ) ) ( not ( = ?auto_97886 ?auto_97889 ) ) ( not ( = ?auto_97888 ?auto_97889 ) ) ( not ( = ?auto_97887 ?auto_97889 ) ) ( HOLDING ?auto_97883 ) ( CLEAR ?auto_97884 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97887 ?auto_97888 ?auto_97886 ?auto_97885 ?auto_97884 ?auto_97883 )
      ( MAKE-5PILE ?auto_97882 ?auto_97883 ?auto_97884 ?auto_97885 ?auto_97886 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97890 - BLOCK
      ?auto_97891 - BLOCK
      ?auto_97892 - BLOCK
      ?auto_97893 - BLOCK
      ?auto_97894 - BLOCK
    )
    :vars
    (
      ?auto_97897 - BLOCK
      ?auto_97895 - BLOCK
      ?auto_97896 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97890 ?auto_97891 ) ) ( not ( = ?auto_97890 ?auto_97892 ) ) ( not ( = ?auto_97890 ?auto_97893 ) ) ( not ( = ?auto_97890 ?auto_97894 ) ) ( not ( = ?auto_97891 ?auto_97892 ) ) ( not ( = ?auto_97891 ?auto_97893 ) ) ( not ( = ?auto_97891 ?auto_97894 ) ) ( not ( = ?auto_97892 ?auto_97893 ) ) ( not ( = ?auto_97892 ?auto_97894 ) ) ( not ( = ?auto_97893 ?auto_97894 ) ) ( ON ?auto_97894 ?auto_97897 ) ( not ( = ?auto_97890 ?auto_97897 ) ) ( not ( = ?auto_97891 ?auto_97897 ) ) ( not ( = ?auto_97892 ?auto_97897 ) ) ( not ( = ?auto_97893 ?auto_97897 ) ) ( not ( = ?auto_97894 ?auto_97897 ) ) ( ON ?auto_97893 ?auto_97894 ) ( ON-TABLE ?auto_97895 ) ( ON ?auto_97897 ?auto_97895 ) ( not ( = ?auto_97895 ?auto_97897 ) ) ( not ( = ?auto_97895 ?auto_97894 ) ) ( not ( = ?auto_97895 ?auto_97893 ) ) ( not ( = ?auto_97890 ?auto_97895 ) ) ( not ( = ?auto_97891 ?auto_97895 ) ) ( not ( = ?auto_97892 ?auto_97895 ) ) ( ON ?auto_97892 ?auto_97893 ) ( ON ?auto_97890 ?auto_97896 ) ( not ( = ?auto_97890 ?auto_97896 ) ) ( not ( = ?auto_97891 ?auto_97896 ) ) ( not ( = ?auto_97892 ?auto_97896 ) ) ( not ( = ?auto_97893 ?auto_97896 ) ) ( not ( = ?auto_97894 ?auto_97896 ) ) ( not ( = ?auto_97897 ?auto_97896 ) ) ( not ( = ?auto_97895 ?auto_97896 ) ) ( CLEAR ?auto_97892 ) ( ON ?auto_97891 ?auto_97890 ) ( CLEAR ?auto_97891 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97896 ?auto_97890 )
      ( MAKE-5PILE ?auto_97890 ?auto_97891 ?auto_97892 ?auto_97893 ?auto_97894 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97898 - BLOCK
      ?auto_97899 - BLOCK
      ?auto_97900 - BLOCK
      ?auto_97901 - BLOCK
      ?auto_97902 - BLOCK
    )
    :vars
    (
      ?auto_97905 - BLOCK
      ?auto_97903 - BLOCK
      ?auto_97904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97898 ?auto_97899 ) ) ( not ( = ?auto_97898 ?auto_97900 ) ) ( not ( = ?auto_97898 ?auto_97901 ) ) ( not ( = ?auto_97898 ?auto_97902 ) ) ( not ( = ?auto_97899 ?auto_97900 ) ) ( not ( = ?auto_97899 ?auto_97901 ) ) ( not ( = ?auto_97899 ?auto_97902 ) ) ( not ( = ?auto_97900 ?auto_97901 ) ) ( not ( = ?auto_97900 ?auto_97902 ) ) ( not ( = ?auto_97901 ?auto_97902 ) ) ( ON ?auto_97902 ?auto_97905 ) ( not ( = ?auto_97898 ?auto_97905 ) ) ( not ( = ?auto_97899 ?auto_97905 ) ) ( not ( = ?auto_97900 ?auto_97905 ) ) ( not ( = ?auto_97901 ?auto_97905 ) ) ( not ( = ?auto_97902 ?auto_97905 ) ) ( ON ?auto_97901 ?auto_97902 ) ( ON-TABLE ?auto_97903 ) ( ON ?auto_97905 ?auto_97903 ) ( not ( = ?auto_97903 ?auto_97905 ) ) ( not ( = ?auto_97903 ?auto_97902 ) ) ( not ( = ?auto_97903 ?auto_97901 ) ) ( not ( = ?auto_97898 ?auto_97903 ) ) ( not ( = ?auto_97899 ?auto_97903 ) ) ( not ( = ?auto_97900 ?auto_97903 ) ) ( ON ?auto_97898 ?auto_97904 ) ( not ( = ?auto_97898 ?auto_97904 ) ) ( not ( = ?auto_97899 ?auto_97904 ) ) ( not ( = ?auto_97900 ?auto_97904 ) ) ( not ( = ?auto_97901 ?auto_97904 ) ) ( not ( = ?auto_97902 ?auto_97904 ) ) ( not ( = ?auto_97905 ?auto_97904 ) ) ( not ( = ?auto_97903 ?auto_97904 ) ) ( ON ?auto_97899 ?auto_97898 ) ( CLEAR ?auto_97899 ) ( ON-TABLE ?auto_97904 ) ( HOLDING ?auto_97900 ) ( CLEAR ?auto_97901 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97903 ?auto_97905 ?auto_97902 ?auto_97901 ?auto_97900 )
      ( MAKE-5PILE ?auto_97898 ?auto_97899 ?auto_97900 ?auto_97901 ?auto_97902 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97906 - BLOCK
      ?auto_97907 - BLOCK
      ?auto_97908 - BLOCK
      ?auto_97909 - BLOCK
      ?auto_97910 - BLOCK
    )
    :vars
    (
      ?auto_97913 - BLOCK
      ?auto_97912 - BLOCK
      ?auto_97911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97906 ?auto_97907 ) ) ( not ( = ?auto_97906 ?auto_97908 ) ) ( not ( = ?auto_97906 ?auto_97909 ) ) ( not ( = ?auto_97906 ?auto_97910 ) ) ( not ( = ?auto_97907 ?auto_97908 ) ) ( not ( = ?auto_97907 ?auto_97909 ) ) ( not ( = ?auto_97907 ?auto_97910 ) ) ( not ( = ?auto_97908 ?auto_97909 ) ) ( not ( = ?auto_97908 ?auto_97910 ) ) ( not ( = ?auto_97909 ?auto_97910 ) ) ( ON ?auto_97910 ?auto_97913 ) ( not ( = ?auto_97906 ?auto_97913 ) ) ( not ( = ?auto_97907 ?auto_97913 ) ) ( not ( = ?auto_97908 ?auto_97913 ) ) ( not ( = ?auto_97909 ?auto_97913 ) ) ( not ( = ?auto_97910 ?auto_97913 ) ) ( ON ?auto_97909 ?auto_97910 ) ( ON-TABLE ?auto_97912 ) ( ON ?auto_97913 ?auto_97912 ) ( not ( = ?auto_97912 ?auto_97913 ) ) ( not ( = ?auto_97912 ?auto_97910 ) ) ( not ( = ?auto_97912 ?auto_97909 ) ) ( not ( = ?auto_97906 ?auto_97912 ) ) ( not ( = ?auto_97907 ?auto_97912 ) ) ( not ( = ?auto_97908 ?auto_97912 ) ) ( ON ?auto_97906 ?auto_97911 ) ( not ( = ?auto_97906 ?auto_97911 ) ) ( not ( = ?auto_97907 ?auto_97911 ) ) ( not ( = ?auto_97908 ?auto_97911 ) ) ( not ( = ?auto_97909 ?auto_97911 ) ) ( not ( = ?auto_97910 ?auto_97911 ) ) ( not ( = ?auto_97913 ?auto_97911 ) ) ( not ( = ?auto_97912 ?auto_97911 ) ) ( ON ?auto_97907 ?auto_97906 ) ( ON-TABLE ?auto_97911 ) ( CLEAR ?auto_97909 ) ( ON ?auto_97908 ?auto_97907 ) ( CLEAR ?auto_97908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97911 ?auto_97906 ?auto_97907 )
      ( MAKE-5PILE ?auto_97906 ?auto_97907 ?auto_97908 ?auto_97909 ?auto_97910 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97914 - BLOCK
      ?auto_97915 - BLOCK
      ?auto_97916 - BLOCK
      ?auto_97917 - BLOCK
      ?auto_97918 - BLOCK
    )
    :vars
    (
      ?auto_97920 - BLOCK
      ?auto_97919 - BLOCK
      ?auto_97921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97914 ?auto_97915 ) ) ( not ( = ?auto_97914 ?auto_97916 ) ) ( not ( = ?auto_97914 ?auto_97917 ) ) ( not ( = ?auto_97914 ?auto_97918 ) ) ( not ( = ?auto_97915 ?auto_97916 ) ) ( not ( = ?auto_97915 ?auto_97917 ) ) ( not ( = ?auto_97915 ?auto_97918 ) ) ( not ( = ?auto_97916 ?auto_97917 ) ) ( not ( = ?auto_97916 ?auto_97918 ) ) ( not ( = ?auto_97917 ?auto_97918 ) ) ( ON ?auto_97918 ?auto_97920 ) ( not ( = ?auto_97914 ?auto_97920 ) ) ( not ( = ?auto_97915 ?auto_97920 ) ) ( not ( = ?auto_97916 ?auto_97920 ) ) ( not ( = ?auto_97917 ?auto_97920 ) ) ( not ( = ?auto_97918 ?auto_97920 ) ) ( ON-TABLE ?auto_97919 ) ( ON ?auto_97920 ?auto_97919 ) ( not ( = ?auto_97919 ?auto_97920 ) ) ( not ( = ?auto_97919 ?auto_97918 ) ) ( not ( = ?auto_97919 ?auto_97917 ) ) ( not ( = ?auto_97914 ?auto_97919 ) ) ( not ( = ?auto_97915 ?auto_97919 ) ) ( not ( = ?auto_97916 ?auto_97919 ) ) ( ON ?auto_97914 ?auto_97921 ) ( not ( = ?auto_97914 ?auto_97921 ) ) ( not ( = ?auto_97915 ?auto_97921 ) ) ( not ( = ?auto_97916 ?auto_97921 ) ) ( not ( = ?auto_97917 ?auto_97921 ) ) ( not ( = ?auto_97918 ?auto_97921 ) ) ( not ( = ?auto_97920 ?auto_97921 ) ) ( not ( = ?auto_97919 ?auto_97921 ) ) ( ON ?auto_97915 ?auto_97914 ) ( ON-TABLE ?auto_97921 ) ( ON ?auto_97916 ?auto_97915 ) ( CLEAR ?auto_97916 ) ( HOLDING ?auto_97917 ) ( CLEAR ?auto_97918 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97919 ?auto_97920 ?auto_97918 ?auto_97917 )
      ( MAKE-5PILE ?auto_97914 ?auto_97915 ?auto_97916 ?auto_97917 ?auto_97918 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97922 - BLOCK
      ?auto_97923 - BLOCK
      ?auto_97924 - BLOCK
      ?auto_97925 - BLOCK
      ?auto_97926 - BLOCK
    )
    :vars
    (
      ?auto_97927 - BLOCK
      ?auto_97929 - BLOCK
      ?auto_97928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97922 ?auto_97923 ) ) ( not ( = ?auto_97922 ?auto_97924 ) ) ( not ( = ?auto_97922 ?auto_97925 ) ) ( not ( = ?auto_97922 ?auto_97926 ) ) ( not ( = ?auto_97923 ?auto_97924 ) ) ( not ( = ?auto_97923 ?auto_97925 ) ) ( not ( = ?auto_97923 ?auto_97926 ) ) ( not ( = ?auto_97924 ?auto_97925 ) ) ( not ( = ?auto_97924 ?auto_97926 ) ) ( not ( = ?auto_97925 ?auto_97926 ) ) ( ON ?auto_97926 ?auto_97927 ) ( not ( = ?auto_97922 ?auto_97927 ) ) ( not ( = ?auto_97923 ?auto_97927 ) ) ( not ( = ?auto_97924 ?auto_97927 ) ) ( not ( = ?auto_97925 ?auto_97927 ) ) ( not ( = ?auto_97926 ?auto_97927 ) ) ( ON-TABLE ?auto_97929 ) ( ON ?auto_97927 ?auto_97929 ) ( not ( = ?auto_97929 ?auto_97927 ) ) ( not ( = ?auto_97929 ?auto_97926 ) ) ( not ( = ?auto_97929 ?auto_97925 ) ) ( not ( = ?auto_97922 ?auto_97929 ) ) ( not ( = ?auto_97923 ?auto_97929 ) ) ( not ( = ?auto_97924 ?auto_97929 ) ) ( ON ?auto_97922 ?auto_97928 ) ( not ( = ?auto_97922 ?auto_97928 ) ) ( not ( = ?auto_97923 ?auto_97928 ) ) ( not ( = ?auto_97924 ?auto_97928 ) ) ( not ( = ?auto_97925 ?auto_97928 ) ) ( not ( = ?auto_97926 ?auto_97928 ) ) ( not ( = ?auto_97927 ?auto_97928 ) ) ( not ( = ?auto_97929 ?auto_97928 ) ) ( ON ?auto_97923 ?auto_97922 ) ( ON-TABLE ?auto_97928 ) ( ON ?auto_97924 ?auto_97923 ) ( CLEAR ?auto_97926 ) ( ON ?auto_97925 ?auto_97924 ) ( CLEAR ?auto_97925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97928 ?auto_97922 ?auto_97923 ?auto_97924 )
      ( MAKE-5PILE ?auto_97922 ?auto_97923 ?auto_97924 ?auto_97925 ?auto_97926 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97930 - BLOCK
      ?auto_97931 - BLOCK
      ?auto_97932 - BLOCK
      ?auto_97933 - BLOCK
      ?auto_97934 - BLOCK
    )
    :vars
    (
      ?auto_97937 - BLOCK
      ?auto_97936 - BLOCK
      ?auto_97935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97930 ?auto_97931 ) ) ( not ( = ?auto_97930 ?auto_97932 ) ) ( not ( = ?auto_97930 ?auto_97933 ) ) ( not ( = ?auto_97930 ?auto_97934 ) ) ( not ( = ?auto_97931 ?auto_97932 ) ) ( not ( = ?auto_97931 ?auto_97933 ) ) ( not ( = ?auto_97931 ?auto_97934 ) ) ( not ( = ?auto_97932 ?auto_97933 ) ) ( not ( = ?auto_97932 ?auto_97934 ) ) ( not ( = ?auto_97933 ?auto_97934 ) ) ( not ( = ?auto_97930 ?auto_97937 ) ) ( not ( = ?auto_97931 ?auto_97937 ) ) ( not ( = ?auto_97932 ?auto_97937 ) ) ( not ( = ?auto_97933 ?auto_97937 ) ) ( not ( = ?auto_97934 ?auto_97937 ) ) ( ON-TABLE ?auto_97936 ) ( ON ?auto_97937 ?auto_97936 ) ( not ( = ?auto_97936 ?auto_97937 ) ) ( not ( = ?auto_97936 ?auto_97934 ) ) ( not ( = ?auto_97936 ?auto_97933 ) ) ( not ( = ?auto_97930 ?auto_97936 ) ) ( not ( = ?auto_97931 ?auto_97936 ) ) ( not ( = ?auto_97932 ?auto_97936 ) ) ( ON ?auto_97930 ?auto_97935 ) ( not ( = ?auto_97930 ?auto_97935 ) ) ( not ( = ?auto_97931 ?auto_97935 ) ) ( not ( = ?auto_97932 ?auto_97935 ) ) ( not ( = ?auto_97933 ?auto_97935 ) ) ( not ( = ?auto_97934 ?auto_97935 ) ) ( not ( = ?auto_97937 ?auto_97935 ) ) ( not ( = ?auto_97936 ?auto_97935 ) ) ( ON ?auto_97931 ?auto_97930 ) ( ON-TABLE ?auto_97935 ) ( ON ?auto_97932 ?auto_97931 ) ( ON ?auto_97933 ?auto_97932 ) ( CLEAR ?auto_97933 ) ( HOLDING ?auto_97934 ) ( CLEAR ?auto_97937 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97936 ?auto_97937 ?auto_97934 )
      ( MAKE-5PILE ?auto_97930 ?auto_97931 ?auto_97932 ?auto_97933 ?auto_97934 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97938 - BLOCK
      ?auto_97939 - BLOCK
      ?auto_97940 - BLOCK
      ?auto_97941 - BLOCK
      ?auto_97942 - BLOCK
    )
    :vars
    (
      ?auto_97945 - BLOCK
      ?auto_97943 - BLOCK
      ?auto_97944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97938 ?auto_97939 ) ) ( not ( = ?auto_97938 ?auto_97940 ) ) ( not ( = ?auto_97938 ?auto_97941 ) ) ( not ( = ?auto_97938 ?auto_97942 ) ) ( not ( = ?auto_97939 ?auto_97940 ) ) ( not ( = ?auto_97939 ?auto_97941 ) ) ( not ( = ?auto_97939 ?auto_97942 ) ) ( not ( = ?auto_97940 ?auto_97941 ) ) ( not ( = ?auto_97940 ?auto_97942 ) ) ( not ( = ?auto_97941 ?auto_97942 ) ) ( not ( = ?auto_97938 ?auto_97945 ) ) ( not ( = ?auto_97939 ?auto_97945 ) ) ( not ( = ?auto_97940 ?auto_97945 ) ) ( not ( = ?auto_97941 ?auto_97945 ) ) ( not ( = ?auto_97942 ?auto_97945 ) ) ( ON-TABLE ?auto_97943 ) ( ON ?auto_97945 ?auto_97943 ) ( not ( = ?auto_97943 ?auto_97945 ) ) ( not ( = ?auto_97943 ?auto_97942 ) ) ( not ( = ?auto_97943 ?auto_97941 ) ) ( not ( = ?auto_97938 ?auto_97943 ) ) ( not ( = ?auto_97939 ?auto_97943 ) ) ( not ( = ?auto_97940 ?auto_97943 ) ) ( ON ?auto_97938 ?auto_97944 ) ( not ( = ?auto_97938 ?auto_97944 ) ) ( not ( = ?auto_97939 ?auto_97944 ) ) ( not ( = ?auto_97940 ?auto_97944 ) ) ( not ( = ?auto_97941 ?auto_97944 ) ) ( not ( = ?auto_97942 ?auto_97944 ) ) ( not ( = ?auto_97945 ?auto_97944 ) ) ( not ( = ?auto_97943 ?auto_97944 ) ) ( ON ?auto_97939 ?auto_97938 ) ( ON-TABLE ?auto_97944 ) ( ON ?auto_97940 ?auto_97939 ) ( ON ?auto_97941 ?auto_97940 ) ( CLEAR ?auto_97945 ) ( ON ?auto_97942 ?auto_97941 ) ( CLEAR ?auto_97942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97944 ?auto_97938 ?auto_97939 ?auto_97940 ?auto_97941 )
      ( MAKE-5PILE ?auto_97938 ?auto_97939 ?auto_97940 ?auto_97941 ?auto_97942 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97946 - BLOCK
      ?auto_97947 - BLOCK
      ?auto_97948 - BLOCK
      ?auto_97949 - BLOCK
      ?auto_97950 - BLOCK
    )
    :vars
    (
      ?auto_97951 - BLOCK
      ?auto_97952 - BLOCK
      ?auto_97953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97946 ?auto_97947 ) ) ( not ( = ?auto_97946 ?auto_97948 ) ) ( not ( = ?auto_97946 ?auto_97949 ) ) ( not ( = ?auto_97946 ?auto_97950 ) ) ( not ( = ?auto_97947 ?auto_97948 ) ) ( not ( = ?auto_97947 ?auto_97949 ) ) ( not ( = ?auto_97947 ?auto_97950 ) ) ( not ( = ?auto_97948 ?auto_97949 ) ) ( not ( = ?auto_97948 ?auto_97950 ) ) ( not ( = ?auto_97949 ?auto_97950 ) ) ( not ( = ?auto_97946 ?auto_97951 ) ) ( not ( = ?auto_97947 ?auto_97951 ) ) ( not ( = ?auto_97948 ?auto_97951 ) ) ( not ( = ?auto_97949 ?auto_97951 ) ) ( not ( = ?auto_97950 ?auto_97951 ) ) ( ON-TABLE ?auto_97952 ) ( not ( = ?auto_97952 ?auto_97951 ) ) ( not ( = ?auto_97952 ?auto_97950 ) ) ( not ( = ?auto_97952 ?auto_97949 ) ) ( not ( = ?auto_97946 ?auto_97952 ) ) ( not ( = ?auto_97947 ?auto_97952 ) ) ( not ( = ?auto_97948 ?auto_97952 ) ) ( ON ?auto_97946 ?auto_97953 ) ( not ( = ?auto_97946 ?auto_97953 ) ) ( not ( = ?auto_97947 ?auto_97953 ) ) ( not ( = ?auto_97948 ?auto_97953 ) ) ( not ( = ?auto_97949 ?auto_97953 ) ) ( not ( = ?auto_97950 ?auto_97953 ) ) ( not ( = ?auto_97951 ?auto_97953 ) ) ( not ( = ?auto_97952 ?auto_97953 ) ) ( ON ?auto_97947 ?auto_97946 ) ( ON-TABLE ?auto_97953 ) ( ON ?auto_97948 ?auto_97947 ) ( ON ?auto_97949 ?auto_97948 ) ( ON ?auto_97950 ?auto_97949 ) ( CLEAR ?auto_97950 ) ( HOLDING ?auto_97951 ) ( CLEAR ?auto_97952 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97952 ?auto_97951 )
      ( MAKE-5PILE ?auto_97946 ?auto_97947 ?auto_97948 ?auto_97949 ?auto_97950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97954 - BLOCK
      ?auto_97955 - BLOCK
      ?auto_97956 - BLOCK
      ?auto_97957 - BLOCK
      ?auto_97958 - BLOCK
    )
    :vars
    (
      ?auto_97961 - BLOCK
      ?auto_97959 - BLOCK
      ?auto_97960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97954 ?auto_97955 ) ) ( not ( = ?auto_97954 ?auto_97956 ) ) ( not ( = ?auto_97954 ?auto_97957 ) ) ( not ( = ?auto_97954 ?auto_97958 ) ) ( not ( = ?auto_97955 ?auto_97956 ) ) ( not ( = ?auto_97955 ?auto_97957 ) ) ( not ( = ?auto_97955 ?auto_97958 ) ) ( not ( = ?auto_97956 ?auto_97957 ) ) ( not ( = ?auto_97956 ?auto_97958 ) ) ( not ( = ?auto_97957 ?auto_97958 ) ) ( not ( = ?auto_97954 ?auto_97961 ) ) ( not ( = ?auto_97955 ?auto_97961 ) ) ( not ( = ?auto_97956 ?auto_97961 ) ) ( not ( = ?auto_97957 ?auto_97961 ) ) ( not ( = ?auto_97958 ?auto_97961 ) ) ( ON-TABLE ?auto_97959 ) ( not ( = ?auto_97959 ?auto_97961 ) ) ( not ( = ?auto_97959 ?auto_97958 ) ) ( not ( = ?auto_97959 ?auto_97957 ) ) ( not ( = ?auto_97954 ?auto_97959 ) ) ( not ( = ?auto_97955 ?auto_97959 ) ) ( not ( = ?auto_97956 ?auto_97959 ) ) ( ON ?auto_97954 ?auto_97960 ) ( not ( = ?auto_97954 ?auto_97960 ) ) ( not ( = ?auto_97955 ?auto_97960 ) ) ( not ( = ?auto_97956 ?auto_97960 ) ) ( not ( = ?auto_97957 ?auto_97960 ) ) ( not ( = ?auto_97958 ?auto_97960 ) ) ( not ( = ?auto_97961 ?auto_97960 ) ) ( not ( = ?auto_97959 ?auto_97960 ) ) ( ON ?auto_97955 ?auto_97954 ) ( ON-TABLE ?auto_97960 ) ( ON ?auto_97956 ?auto_97955 ) ( ON ?auto_97957 ?auto_97956 ) ( ON ?auto_97958 ?auto_97957 ) ( CLEAR ?auto_97959 ) ( ON ?auto_97961 ?auto_97958 ) ( CLEAR ?auto_97961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97960 ?auto_97954 ?auto_97955 ?auto_97956 ?auto_97957 ?auto_97958 )
      ( MAKE-5PILE ?auto_97954 ?auto_97955 ?auto_97956 ?auto_97957 ?auto_97958 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97962 - BLOCK
      ?auto_97963 - BLOCK
      ?auto_97964 - BLOCK
      ?auto_97965 - BLOCK
      ?auto_97966 - BLOCK
    )
    :vars
    (
      ?auto_97967 - BLOCK
      ?auto_97968 - BLOCK
      ?auto_97969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97962 ?auto_97963 ) ) ( not ( = ?auto_97962 ?auto_97964 ) ) ( not ( = ?auto_97962 ?auto_97965 ) ) ( not ( = ?auto_97962 ?auto_97966 ) ) ( not ( = ?auto_97963 ?auto_97964 ) ) ( not ( = ?auto_97963 ?auto_97965 ) ) ( not ( = ?auto_97963 ?auto_97966 ) ) ( not ( = ?auto_97964 ?auto_97965 ) ) ( not ( = ?auto_97964 ?auto_97966 ) ) ( not ( = ?auto_97965 ?auto_97966 ) ) ( not ( = ?auto_97962 ?auto_97967 ) ) ( not ( = ?auto_97963 ?auto_97967 ) ) ( not ( = ?auto_97964 ?auto_97967 ) ) ( not ( = ?auto_97965 ?auto_97967 ) ) ( not ( = ?auto_97966 ?auto_97967 ) ) ( not ( = ?auto_97968 ?auto_97967 ) ) ( not ( = ?auto_97968 ?auto_97966 ) ) ( not ( = ?auto_97968 ?auto_97965 ) ) ( not ( = ?auto_97962 ?auto_97968 ) ) ( not ( = ?auto_97963 ?auto_97968 ) ) ( not ( = ?auto_97964 ?auto_97968 ) ) ( ON ?auto_97962 ?auto_97969 ) ( not ( = ?auto_97962 ?auto_97969 ) ) ( not ( = ?auto_97963 ?auto_97969 ) ) ( not ( = ?auto_97964 ?auto_97969 ) ) ( not ( = ?auto_97965 ?auto_97969 ) ) ( not ( = ?auto_97966 ?auto_97969 ) ) ( not ( = ?auto_97967 ?auto_97969 ) ) ( not ( = ?auto_97968 ?auto_97969 ) ) ( ON ?auto_97963 ?auto_97962 ) ( ON-TABLE ?auto_97969 ) ( ON ?auto_97964 ?auto_97963 ) ( ON ?auto_97965 ?auto_97964 ) ( ON ?auto_97966 ?auto_97965 ) ( ON ?auto_97967 ?auto_97966 ) ( CLEAR ?auto_97967 ) ( HOLDING ?auto_97968 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97968 )
      ( MAKE-5PILE ?auto_97962 ?auto_97963 ?auto_97964 ?auto_97965 ?auto_97966 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97970 - BLOCK
      ?auto_97971 - BLOCK
      ?auto_97972 - BLOCK
      ?auto_97973 - BLOCK
      ?auto_97974 - BLOCK
    )
    :vars
    (
      ?auto_97976 - BLOCK
      ?auto_97975 - BLOCK
      ?auto_97977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97970 ?auto_97971 ) ) ( not ( = ?auto_97970 ?auto_97972 ) ) ( not ( = ?auto_97970 ?auto_97973 ) ) ( not ( = ?auto_97970 ?auto_97974 ) ) ( not ( = ?auto_97971 ?auto_97972 ) ) ( not ( = ?auto_97971 ?auto_97973 ) ) ( not ( = ?auto_97971 ?auto_97974 ) ) ( not ( = ?auto_97972 ?auto_97973 ) ) ( not ( = ?auto_97972 ?auto_97974 ) ) ( not ( = ?auto_97973 ?auto_97974 ) ) ( not ( = ?auto_97970 ?auto_97976 ) ) ( not ( = ?auto_97971 ?auto_97976 ) ) ( not ( = ?auto_97972 ?auto_97976 ) ) ( not ( = ?auto_97973 ?auto_97976 ) ) ( not ( = ?auto_97974 ?auto_97976 ) ) ( not ( = ?auto_97975 ?auto_97976 ) ) ( not ( = ?auto_97975 ?auto_97974 ) ) ( not ( = ?auto_97975 ?auto_97973 ) ) ( not ( = ?auto_97970 ?auto_97975 ) ) ( not ( = ?auto_97971 ?auto_97975 ) ) ( not ( = ?auto_97972 ?auto_97975 ) ) ( ON ?auto_97970 ?auto_97977 ) ( not ( = ?auto_97970 ?auto_97977 ) ) ( not ( = ?auto_97971 ?auto_97977 ) ) ( not ( = ?auto_97972 ?auto_97977 ) ) ( not ( = ?auto_97973 ?auto_97977 ) ) ( not ( = ?auto_97974 ?auto_97977 ) ) ( not ( = ?auto_97976 ?auto_97977 ) ) ( not ( = ?auto_97975 ?auto_97977 ) ) ( ON ?auto_97971 ?auto_97970 ) ( ON-TABLE ?auto_97977 ) ( ON ?auto_97972 ?auto_97971 ) ( ON ?auto_97973 ?auto_97972 ) ( ON ?auto_97974 ?auto_97973 ) ( ON ?auto_97976 ?auto_97974 ) ( ON ?auto_97975 ?auto_97976 ) ( CLEAR ?auto_97975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97977 ?auto_97970 ?auto_97971 ?auto_97972 ?auto_97973 ?auto_97974 ?auto_97976 )
      ( MAKE-5PILE ?auto_97970 ?auto_97971 ?auto_97972 ?auto_97973 ?auto_97974 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97979 - BLOCK
    )
    :vars
    (
      ?auto_97980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97980 ?auto_97979 ) ( CLEAR ?auto_97980 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97979 ) ( not ( = ?auto_97979 ?auto_97980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97980 ?auto_97979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97981 - BLOCK
    )
    :vars
    (
      ?auto_97982 - BLOCK
      ?auto_97983 - BLOCK
      ?auto_97984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97982 ?auto_97981 ) ( CLEAR ?auto_97982 ) ( ON-TABLE ?auto_97981 ) ( not ( = ?auto_97981 ?auto_97982 ) ) ( HOLDING ?auto_97983 ) ( CLEAR ?auto_97984 ) ( not ( = ?auto_97981 ?auto_97983 ) ) ( not ( = ?auto_97981 ?auto_97984 ) ) ( not ( = ?auto_97982 ?auto_97983 ) ) ( not ( = ?auto_97982 ?auto_97984 ) ) ( not ( = ?auto_97983 ?auto_97984 ) ) )
    :subtasks
    ( ( !STACK ?auto_97983 ?auto_97984 )
      ( MAKE-1PILE ?auto_97981 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97985 - BLOCK
    )
    :vars
    (
      ?auto_97988 - BLOCK
      ?auto_97986 - BLOCK
      ?auto_97987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97988 ?auto_97985 ) ( ON-TABLE ?auto_97985 ) ( not ( = ?auto_97985 ?auto_97988 ) ) ( CLEAR ?auto_97986 ) ( not ( = ?auto_97985 ?auto_97987 ) ) ( not ( = ?auto_97985 ?auto_97986 ) ) ( not ( = ?auto_97988 ?auto_97987 ) ) ( not ( = ?auto_97988 ?auto_97986 ) ) ( not ( = ?auto_97987 ?auto_97986 ) ) ( ON ?auto_97987 ?auto_97988 ) ( CLEAR ?auto_97987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97985 ?auto_97988 )
      ( MAKE-1PILE ?auto_97985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97989 - BLOCK
    )
    :vars
    (
      ?auto_97992 - BLOCK
      ?auto_97990 - BLOCK
      ?auto_97991 - BLOCK
      ?auto_97995 - BLOCK
      ?auto_97993 - BLOCK
      ?auto_97994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97992 ?auto_97989 ) ( ON-TABLE ?auto_97989 ) ( not ( = ?auto_97989 ?auto_97992 ) ) ( not ( = ?auto_97989 ?auto_97990 ) ) ( not ( = ?auto_97989 ?auto_97991 ) ) ( not ( = ?auto_97992 ?auto_97990 ) ) ( not ( = ?auto_97992 ?auto_97991 ) ) ( not ( = ?auto_97990 ?auto_97991 ) ) ( ON ?auto_97990 ?auto_97992 ) ( CLEAR ?auto_97990 ) ( HOLDING ?auto_97991 ) ( CLEAR ?auto_97995 ) ( ON-TABLE ?auto_97993 ) ( ON ?auto_97994 ?auto_97993 ) ( ON ?auto_97995 ?auto_97994 ) ( not ( = ?auto_97993 ?auto_97994 ) ) ( not ( = ?auto_97993 ?auto_97995 ) ) ( not ( = ?auto_97993 ?auto_97991 ) ) ( not ( = ?auto_97994 ?auto_97995 ) ) ( not ( = ?auto_97994 ?auto_97991 ) ) ( not ( = ?auto_97995 ?auto_97991 ) ) ( not ( = ?auto_97989 ?auto_97995 ) ) ( not ( = ?auto_97989 ?auto_97993 ) ) ( not ( = ?auto_97989 ?auto_97994 ) ) ( not ( = ?auto_97992 ?auto_97995 ) ) ( not ( = ?auto_97992 ?auto_97993 ) ) ( not ( = ?auto_97992 ?auto_97994 ) ) ( not ( = ?auto_97990 ?auto_97995 ) ) ( not ( = ?auto_97990 ?auto_97993 ) ) ( not ( = ?auto_97990 ?auto_97994 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97993 ?auto_97994 ?auto_97995 ?auto_97991 )
      ( MAKE-1PILE ?auto_97989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97996 - BLOCK
    )
    :vars
    (
      ?auto_98000 - BLOCK
      ?auto_97997 - BLOCK
      ?auto_97999 - BLOCK
      ?auto_98002 - BLOCK
      ?auto_97998 - BLOCK
      ?auto_98001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98000 ?auto_97996 ) ( ON-TABLE ?auto_97996 ) ( not ( = ?auto_97996 ?auto_98000 ) ) ( not ( = ?auto_97996 ?auto_97997 ) ) ( not ( = ?auto_97996 ?auto_97999 ) ) ( not ( = ?auto_98000 ?auto_97997 ) ) ( not ( = ?auto_98000 ?auto_97999 ) ) ( not ( = ?auto_97997 ?auto_97999 ) ) ( ON ?auto_97997 ?auto_98000 ) ( CLEAR ?auto_98002 ) ( ON-TABLE ?auto_97998 ) ( ON ?auto_98001 ?auto_97998 ) ( ON ?auto_98002 ?auto_98001 ) ( not ( = ?auto_97998 ?auto_98001 ) ) ( not ( = ?auto_97998 ?auto_98002 ) ) ( not ( = ?auto_97998 ?auto_97999 ) ) ( not ( = ?auto_98001 ?auto_98002 ) ) ( not ( = ?auto_98001 ?auto_97999 ) ) ( not ( = ?auto_98002 ?auto_97999 ) ) ( not ( = ?auto_97996 ?auto_98002 ) ) ( not ( = ?auto_97996 ?auto_97998 ) ) ( not ( = ?auto_97996 ?auto_98001 ) ) ( not ( = ?auto_98000 ?auto_98002 ) ) ( not ( = ?auto_98000 ?auto_97998 ) ) ( not ( = ?auto_98000 ?auto_98001 ) ) ( not ( = ?auto_97997 ?auto_98002 ) ) ( not ( = ?auto_97997 ?auto_97998 ) ) ( not ( = ?auto_97997 ?auto_98001 ) ) ( ON ?auto_97999 ?auto_97997 ) ( CLEAR ?auto_97999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97996 ?auto_98000 ?auto_97997 )
      ( MAKE-1PILE ?auto_97996 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98003 - BLOCK
    )
    :vars
    (
      ?auto_98006 - BLOCK
      ?auto_98004 - BLOCK
      ?auto_98005 - BLOCK
      ?auto_98009 - BLOCK
      ?auto_98008 - BLOCK
      ?auto_98007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98006 ?auto_98003 ) ( ON-TABLE ?auto_98003 ) ( not ( = ?auto_98003 ?auto_98006 ) ) ( not ( = ?auto_98003 ?auto_98004 ) ) ( not ( = ?auto_98003 ?auto_98005 ) ) ( not ( = ?auto_98006 ?auto_98004 ) ) ( not ( = ?auto_98006 ?auto_98005 ) ) ( not ( = ?auto_98004 ?auto_98005 ) ) ( ON ?auto_98004 ?auto_98006 ) ( ON-TABLE ?auto_98009 ) ( ON ?auto_98008 ?auto_98009 ) ( not ( = ?auto_98009 ?auto_98008 ) ) ( not ( = ?auto_98009 ?auto_98007 ) ) ( not ( = ?auto_98009 ?auto_98005 ) ) ( not ( = ?auto_98008 ?auto_98007 ) ) ( not ( = ?auto_98008 ?auto_98005 ) ) ( not ( = ?auto_98007 ?auto_98005 ) ) ( not ( = ?auto_98003 ?auto_98007 ) ) ( not ( = ?auto_98003 ?auto_98009 ) ) ( not ( = ?auto_98003 ?auto_98008 ) ) ( not ( = ?auto_98006 ?auto_98007 ) ) ( not ( = ?auto_98006 ?auto_98009 ) ) ( not ( = ?auto_98006 ?auto_98008 ) ) ( not ( = ?auto_98004 ?auto_98007 ) ) ( not ( = ?auto_98004 ?auto_98009 ) ) ( not ( = ?auto_98004 ?auto_98008 ) ) ( ON ?auto_98005 ?auto_98004 ) ( CLEAR ?auto_98005 ) ( HOLDING ?auto_98007 ) ( CLEAR ?auto_98008 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98009 ?auto_98008 ?auto_98007 )
      ( MAKE-1PILE ?auto_98003 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98010 - BLOCK
    )
    :vars
    (
      ?auto_98011 - BLOCK
      ?auto_98013 - BLOCK
      ?auto_98014 - BLOCK
      ?auto_98016 - BLOCK
      ?auto_98015 - BLOCK
      ?auto_98012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98011 ?auto_98010 ) ( ON-TABLE ?auto_98010 ) ( not ( = ?auto_98010 ?auto_98011 ) ) ( not ( = ?auto_98010 ?auto_98013 ) ) ( not ( = ?auto_98010 ?auto_98014 ) ) ( not ( = ?auto_98011 ?auto_98013 ) ) ( not ( = ?auto_98011 ?auto_98014 ) ) ( not ( = ?auto_98013 ?auto_98014 ) ) ( ON ?auto_98013 ?auto_98011 ) ( ON-TABLE ?auto_98016 ) ( ON ?auto_98015 ?auto_98016 ) ( not ( = ?auto_98016 ?auto_98015 ) ) ( not ( = ?auto_98016 ?auto_98012 ) ) ( not ( = ?auto_98016 ?auto_98014 ) ) ( not ( = ?auto_98015 ?auto_98012 ) ) ( not ( = ?auto_98015 ?auto_98014 ) ) ( not ( = ?auto_98012 ?auto_98014 ) ) ( not ( = ?auto_98010 ?auto_98012 ) ) ( not ( = ?auto_98010 ?auto_98016 ) ) ( not ( = ?auto_98010 ?auto_98015 ) ) ( not ( = ?auto_98011 ?auto_98012 ) ) ( not ( = ?auto_98011 ?auto_98016 ) ) ( not ( = ?auto_98011 ?auto_98015 ) ) ( not ( = ?auto_98013 ?auto_98012 ) ) ( not ( = ?auto_98013 ?auto_98016 ) ) ( not ( = ?auto_98013 ?auto_98015 ) ) ( ON ?auto_98014 ?auto_98013 ) ( CLEAR ?auto_98015 ) ( ON ?auto_98012 ?auto_98014 ) ( CLEAR ?auto_98012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98010 ?auto_98011 ?auto_98013 ?auto_98014 )
      ( MAKE-1PILE ?auto_98010 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98017 - BLOCK
    )
    :vars
    (
      ?auto_98023 - BLOCK
      ?auto_98018 - BLOCK
      ?auto_98022 - BLOCK
      ?auto_98020 - BLOCK
      ?auto_98019 - BLOCK
      ?auto_98021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98023 ?auto_98017 ) ( ON-TABLE ?auto_98017 ) ( not ( = ?auto_98017 ?auto_98023 ) ) ( not ( = ?auto_98017 ?auto_98018 ) ) ( not ( = ?auto_98017 ?auto_98022 ) ) ( not ( = ?auto_98023 ?auto_98018 ) ) ( not ( = ?auto_98023 ?auto_98022 ) ) ( not ( = ?auto_98018 ?auto_98022 ) ) ( ON ?auto_98018 ?auto_98023 ) ( ON-TABLE ?auto_98020 ) ( not ( = ?auto_98020 ?auto_98019 ) ) ( not ( = ?auto_98020 ?auto_98021 ) ) ( not ( = ?auto_98020 ?auto_98022 ) ) ( not ( = ?auto_98019 ?auto_98021 ) ) ( not ( = ?auto_98019 ?auto_98022 ) ) ( not ( = ?auto_98021 ?auto_98022 ) ) ( not ( = ?auto_98017 ?auto_98021 ) ) ( not ( = ?auto_98017 ?auto_98020 ) ) ( not ( = ?auto_98017 ?auto_98019 ) ) ( not ( = ?auto_98023 ?auto_98021 ) ) ( not ( = ?auto_98023 ?auto_98020 ) ) ( not ( = ?auto_98023 ?auto_98019 ) ) ( not ( = ?auto_98018 ?auto_98021 ) ) ( not ( = ?auto_98018 ?auto_98020 ) ) ( not ( = ?auto_98018 ?auto_98019 ) ) ( ON ?auto_98022 ?auto_98018 ) ( ON ?auto_98021 ?auto_98022 ) ( CLEAR ?auto_98021 ) ( HOLDING ?auto_98019 ) ( CLEAR ?auto_98020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98020 ?auto_98019 )
      ( MAKE-1PILE ?auto_98017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98024 - BLOCK
    )
    :vars
    (
      ?auto_98028 - BLOCK
      ?auto_98029 - BLOCK
      ?auto_98030 - BLOCK
      ?auto_98026 - BLOCK
      ?auto_98025 - BLOCK
      ?auto_98027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98028 ?auto_98024 ) ( ON-TABLE ?auto_98024 ) ( not ( = ?auto_98024 ?auto_98028 ) ) ( not ( = ?auto_98024 ?auto_98029 ) ) ( not ( = ?auto_98024 ?auto_98030 ) ) ( not ( = ?auto_98028 ?auto_98029 ) ) ( not ( = ?auto_98028 ?auto_98030 ) ) ( not ( = ?auto_98029 ?auto_98030 ) ) ( ON ?auto_98029 ?auto_98028 ) ( ON-TABLE ?auto_98026 ) ( not ( = ?auto_98026 ?auto_98025 ) ) ( not ( = ?auto_98026 ?auto_98027 ) ) ( not ( = ?auto_98026 ?auto_98030 ) ) ( not ( = ?auto_98025 ?auto_98027 ) ) ( not ( = ?auto_98025 ?auto_98030 ) ) ( not ( = ?auto_98027 ?auto_98030 ) ) ( not ( = ?auto_98024 ?auto_98027 ) ) ( not ( = ?auto_98024 ?auto_98026 ) ) ( not ( = ?auto_98024 ?auto_98025 ) ) ( not ( = ?auto_98028 ?auto_98027 ) ) ( not ( = ?auto_98028 ?auto_98026 ) ) ( not ( = ?auto_98028 ?auto_98025 ) ) ( not ( = ?auto_98029 ?auto_98027 ) ) ( not ( = ?auto_98029 ?auto_98026 ) ) ( not ( = ?auto_98029 ?auto_98025 ) ) ( ON ?auto_98030 ?auto_98029 ) ( ON ?auto_98027 ?auto_98030 ) ( CLEAR ?auto_98026 ) ( ON ?auto_98025 ?auto_98027 ) ( CLEAR ?auto_98025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98024 ?auto_98028 ?auto_98029 ?auto_98030 ?auto_98027 )
      ( MAKE-1PILE ?auto_98024 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98031 - BLOCK
    )
    :vars
    (
      ?auto_98037 - BLOCK
      ?auto_98035 - BLOCK
      ?auto_98033 - BLOCK
      ?auto_98032 - BLOCK
      ?auto_98034 - BLOCK
      ?auto_98036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98037 ?auto_98031 ) ( ON-TABLE ?auto_98031 ) ( not ( = ?auto_98031 ?auto_98037 ) ) ( not ( = ?auto_98031 ?auto_98035 ) ) ( not ( = ?auto_98031 ?auto_98033 ) ) ( not ( = ?auto_98037 ?auto_98035 ) ) ( not ( = ?auto_98037 ?auto_98033 ) ) ( not ( = ?auto_98035 ?auto_98033 ) ) ( ON ?auto_98035 ?auto_98037 ) ( not ( = ?auto_98032 ?auto_98034 ) ) ( not ( = ?auto_98032 ?auto_98036 ) ) ( not ( = ?auto_98032 ?auto_98033 ) ) ( not ( = ?auto_98034 ?auto_98036 ) ) ( not ( = ?auto_98034 ?auto_98033 ) ) ( not ( = ?auto_98036 ?auto_98033 ) ) ( not ( = ?auto_98031 ?auto_98036 ) ) ( not ( = ?auto_98031 ?auto_98032 ) ) ( not ( = ?auto_98031 ?auto_98034 ) ) ( not ( = ?auto_98037 ?auto_98036 ) ) ( not ( = ?auto_98037 ?auto_98032 ) ) ( not ( = ?auto_98037 ?auto_98034 ) ) ( not ( = ?auto_98035 ?auto_98036 ) ) ( not ( = ?auto_98035 ?auto_98032 ) ) ( not ( = ?auto_98035 ?auto_98034 ) ) ( ON ?auto_98033 ?auto_98035 ) ( ON ?auto_98036 ?auto_98033 ) ( ON ?auto_98034 ?auto_98036 ) ( CLEAR ?auto_98034 ) ( HOLDING ?auto_98032 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98032 )
      ( MAKE-1PILE ?auto_98031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98038 - BLOCK
    )
    :vars
    (
      ?auto_98043 - BLOCK
      ?auto_98042 - BLOCK
      ?auto_98040 - BLOCK
      ?auto_98039 - BLOCK
      ?auto_98041 - BLOCK
      ?auto_98044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98043 ?auto_98038 ) ( ON-TABLE ?auto_98038 ) ( not ( = ?auto_98038 ?auto_98043 ) ) ( not ( = ?auto_98038 ?auto_98042 ) ) ( not ( = ?auto_98038 ?auto_98040 ) ) ( not ( = ?auto_98043 ?auto_98042 ) ) ( not ( = ?auto_98043 ?auto_98040 ) ) ( not ( = ?auto_98042 ?auto_98040 ) ) ( ON ?auto_98042 ?auto_98043 ) ( not ( = ?auto_98039 ?auto_98041 ) ) ( not ( = ?auto_98039 ?auto_98044 ) ) ( not ( = ?auto_98039 ?auto_98040 ) ) ( not ( = ?auto_98041 ?auto_98044 ) ) ( not ( = ?auto_98041 ?auto_98040 ) ) ( not ( = ?auto_98044 ?auto_98040 ) ) ( not ( = ?auto_98038 ?auto_98044 ) ) ( not ( = ?auto_98038 ?auto_98039 ) ) ( not ( = ?auto_98038 ?auto_98041 ) ) ( not ( = ?auto_98043 ?auto_98044 ) ) ( not ( = ?auto_98043 ?auto_98039 ) ) ( not ( = ?auto_98043 ?auto_98041 ) ) ( not ( = ?auto_98042 ?auto_98044 ) ) ( not ( = ?auto_98042 ?auto_98039 ) ) ( not ( = ?auto_98042 ?auto_98041 ) ) ( ON ?auto_98040 ?auto_98042 ) ( ON ?auto_98044 ?auto_98040 ) ( ON ?auto_98041 ?auto_98044 ) ( ON ?auto_98039 ?auto_98041 ) ( CLEAR ?auto_98039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98038 ?auto_98043 ?auto_98042 ?auto_98040 ?auto_98044 ?auto_98041 )
      ( MAKE-1PILE ?auto_98038 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98045 - BLOCK
    )
    :vars
    (
      ?auto_98050 - BLOCK
      ?auto_98048 - BLOCK
      ?auto_98046 - BLOCK
      ?auto_98051 - BLOCK
      ?auto_98049 - BLOCK
      ?auto_98047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98050 ?auto_98045 ) ( ON-TABLE ?auto_98045 ) ( not ( = ?auto_98045 ?auto_98050 ) ) ( not ( = ?auto_98045 ?auto_98048 ) ) ( not ( = ?auto_98045 ?auto_98046 ) ) ( not ( = ?auto_98050 ?auto_98048 ) ) ( not ( = ?auto_98050 ?auto_98046 ) ) ( not ( = ?auto_98048 ?auto_98046 ) ) ( ON ?auto_98048 ?auto_98050 ) ( not ( = ?auto_98051 ?auto_98049 ) ) ( not ( = ?auto_98051 ?auto_98047 ) ) ( not ( = ?auto_98051 ?auto_98046 ) ) ( not ( = ?auto_98049 ?auto_98047 ) ) ( not ( = ?auto_98049 ?auto_98046 ) ) ( not ( = ?auto_98047 ?auto_98046 ) ) ( not ( = ?auto_98045 ?auto_98047 ) ) ( not ( = ?auto_98045 ?auto_98051 ) ) ( not ( = ?auto_98045 ?auto_98049 ) ) ( not ( = ?auto_98050 ?auto_98047 ) ) ( not ( = ?auto_98050 ?auto_98051 ) ) ( not ( = ?auto_98050 ?auto_98049 ) ) ( not ( = ?auto_98048 ?auto_98047 ) ) ( not ( = ?auto_98048 ?auto_98051 ) ) ( not ( = ?auto_98048 ?auto_98049 ) ) ( ON ?auto_98046 ?auto_98048 ) ( ON ?auto_98047 ?auto_98046 ) ( ON ?auto_98049 ?auto_98047 ) ( HOLDING ?auto_98051 ) ( CLEAR ?auto_98049 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98045 ?auto_98050 ?auto_98048 ?auto_98046 ?auto_98047 ?auto_98049 ?auto_98051 )
      ( MAKE-1PILE ?auto_98045 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98052 - BLOCK
    )
    :vars
    (
      ?auto_98058 - BLOCK
      ?auto_98056 - BLOCK
      ?auto_98053 - BLOCK
      ?auto_98055 - BLOCK
      ?auto_98054 - BLOCK
      ?auto_98057 - BLOCK
      ?auto_98059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98058 ?auto_98052 ) ( ON-TABLE ?auto_98052 ) ( not ( = ?auto_98052 ?auto_98058 ) ) ( not ( = ?auto_98052 ?auto_98056 ) ) ( not ( = ?auto_98052 ?auto_98053 ) ) ( not ( = ?auto_98058 ?auto_98056 ) ) ( not ( = ?auto_98058 ?auto_98053 ) ) ( not ( = ?auto_98056 ?auto_98053 ) ) ( ON ?auto_98056 ?auto_98058 ) ( not ( = ?auto_98055 ?auto_98054 ) ) ( not ( = ?auto_98055 ?auto_98057 ) ) ( not ( = ?auto_98055 ?auto_98053 ) ) ( not ( = ?auto_98054 ?auto_98057 ) ) ( not ( = ?auto_98054 ?auto_98053 ) ) ( not ( = ?auto_98057 ?auto_98053 ) ) ( not ( = ?auto_98052 ?auto_98057 ) ) ( not ( = ?auto_98052 ?auto_98055 ) ) ( not ( = ?auto_98052 ?auto_98054 ) ) ( not ( = ?auto_98058 ?auto_98057 ) ) ( not ( = ?auto_98058 ?auto_98055 ) ) ( not ( = ?auto_98058 ?auto_98054 ) ) ( not ( = ?auto_98056 ?auto_98057 ) ) ( not ( = ?auto_98056 ?auto_98055 ) ) ( not ( = ?auto_98056 ?auto_98054 ) ) ( ON ?auto_98053 ?auto_98056 ) ( ON ?auto_98057 ?auto_98053 ) ( ON ?auto_98054 ?auto_98057 ) ( CLEAR ?auto_98054 ) ( ON ?auto_98055 ?auto_98059 ) ( CLEAR ?auto_98055 ) ( HAND-EMPTY ) ( not ( = ?auto_98052 ?auto_98059 ) ) ( not ( = ?auto_98058 ?auto_98059 ) ) ( not ( = ?auto_98056 ?auto_98059 ) ) ( not ( = ?auto_98053 ?auto_98059 ) ) ( not ( = ?auto_98055 ?auto_98059 ) ) ( not ( = ?auto_98054 ?auto_98059 ) ) ( not ( = ?auto_98057 ?auto_98059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98055 ?auto_98059 )
      ( MAKE-1PILE ?auto_98052 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98060 - BLOCK
    )
    :vars
    (
      ?auto_98066 - BLOCK
      ?auto_98065 - BLOCK
      ?auto_98061 - BLOCK
      ?auto_98062 - BLOCK
      ?auto_98063 - BLOCK
      ?auto_98064 - BLOCK
      ?auto_98067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98066 ?auto_98060 ) ( ON-TABLE ?auto_98060 ) ( not ( = ?auto_98060 ?auto_98066 ) ) ( not ( = ?auto_98060 ?auto_98065 ) ) ( not ( = ?auto_98060 ?auto_98061 ) ) ( not ( = ?auto_98066 ?auto_98065 ) ) ( not ( = ?auto_98066 ?auto_98061 ) ) ( not ( = ?auto_98065 ?auto_98061 ) ) ( ON ?auto_98065 ?auto_98066 ) ( not ( = ?auto_98062 ?auto_98063 ) ) ( not ( = ?auto_98062 ?auto_98064 ) ) ( not ( = ?auto_98062 ?auto_98061 ) ) ( not ( = ?auto_98063 ?auto_98064 ) ) ( not ( = ?auto_98063 ?auto_98061 ) ) ( not ( = ?auto_98064 ?auto_98061 ) ) ( not ( = ?auto_98060 ?auto_98064 ) ) ( not ( = ?auto_98060 ?auto_98062 ) ) ( not ( = ?auto_98060 ?auto_98063 ) ) ( not ( = ?auto_98066 ?auto_98064 ) ) ( not ( = ?auto_98066 ?auto_98062 ) ) ( not ( = ?auto_98066 ?auto_98063 ) ) ( not ( = ?auto_98065 ?auto_98064 ) ) ( not ( = ?auto_98065 ?auto_98062 ) ) ( not ( = ?auto_98065 ?auto_98063 ) ) ( ON ?auto_98061 ?auto_98065 ) ( ON ?auto_98064 ?auto_98061 ) ( ON ?auto_98062 ?auto_98067 ) ( CLEAR ?auto_98062 ) ( not ( = ?auto_98060 ?auto_98067 ) ) ( not ( = ?auto_98066 ?auto_98067 ) ) ( not ( = ?auto_98065 ?auto_98067 ) ) ( not ( = ?auto_98061 ?auto_98067 ) ) ( not ( = ?auto_98062 ?auto_98067 ) ) ( not ( = ?auto_98063 ?auto_98067 ) ) ( not ( = ?auto_98064 ?auto_98067 ) ) ( HOLDING ?auto_98063 ) ( CLEAR ?auto_98064 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98060 ?auto_98066 ?auto_98065 ?auto_98061 ?auto_98064 ?auto_98063 )
      ( MAKE-1PILE ?auto_98060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98068 - BLOCK
    )
    :vars
    (
      ?auto_98075 - BLOCK
      ?auto_98072 - BLOCK
      ?auto_98069 - BLOCK
      ?auto_98071 - BLOCK
      ?auto_98070 - BLOCK
      ?auto_98073 - BLOCK
      ?auto_98074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98075 ?auto_98068 ) ( ON-TABLE ?auto_98068 ) ( not ( = ?auto_98068 ?auto_98075 ) ) ( not ( = ?auto_98068 ?auto_98072 ) ) ( not ( = ?auto_98068 ?auto_98069 ) ) ( not ( = ?auto_98075 ?auto_98072 ) ) ( not ( = ?auto_98075 ?auto_98069 ) ) ( not ( = ?auto_98072 ?auto_98069 ) ) ( ON ?auto_98072 ?auto_98075 ) ( not ( = ?auto_98071 ?auto_98070 ) ) ( not ( = ?auto_98071 ?auto_98073 ) ) ( not ( = ?auto_98071 ?auto_98069 ) ) ( not ( = ?auto_98070 ?auto_98073 ) ) ( not ( = ?auto_98070 ?auto_98069 ) ) ( not ( = ?auto_98073 ?auto_98069 ) ) ( not ( = ?auto_98068 ?auto_98073 ) ) ( not ( = ?auto_98068 ?auto_98071 ) ) ( not ( = ?auto_98068 ?auto_98070 ) ) ( not ( = ?auto_98075 ?auto_98073 ) ) ( not ( = ?auto_98075 ?auto_98071 ) ) ( not ( = ?auto_98075 ?auto_98070 ) ) ( not ( = ?auto_98072 ?auto_98073 ) ) ( not ( = ?auto_98072 ?auto_98071 ) ) ( not ( = ?auto_98072 ?auto_98070 ) ) ( ON ?auto_98069 ?auto_98072 ) ( ON ?auto_98073 ?auto_98069 ) ( ON ?auto_98071 ?auto_98074 ) ( not ( = ?auto_98068 ?auto_98074 ) ) ( not ( = ?auto_98075 ?auto_98074 ) ) ( not ( = ?auto_98072 ?auto_98074 ) ) ( not ( = ?auto_98069 ?auto_98074 ) ) ( not ( = ?auto_98071 ?auto_98074 ) ) ( not ( = ?auto_98070 ?auto_98074 ) ) ( not ( = ?auto_98073 ?auto_98074 ) ) ( CLEAR ?auto_98073 ) ( ON ?auto_98070 ?auto_98071 ) ( CLEAR ?auto_98070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98074 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98074 ?auto_98071 )
      ( MAKE-1PILE ?auto_98068 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98076 - BLOCK
    )
    :vars
    (
      ?auto_98081 - BLOCK
      ?auto_98082 - BLOCK
      ?auto_98083 - BLOCK
      ?auto_98077 - BLOCK
      ?auto_98078 - BLOCK
      ?auto_98080 - BLOCK
      ?auto_98079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98081 ?auto_98076 ) ( ON-TABLE ?auto_98076 ) ( not ( = ?auto_98076 ?auto_98081 ) ) ( not ( = ?auto_98076 ?auto_98082 ) ) ( not ( = ?auto_98076 ?auto_98083 ) ) ( not ( = ?auto_98081 ?auto_98082 ) ) ( not ( = ?auto_98081 ?auto_98083 ) ) ( not ( = ?auto_98082 ?auto_98083 ) ) ( ON ?auto_98082 ?auto_98081 ) ( not ( = ?auto_98077 ?auto_98078 ) ) ( not ( = ?auto_98077 ?auto_98080 ) ) ( not ( = ?auto_98077 ?auto_98083 ) ) ( not ( = ?auto_98078 ?auto_98080 ) ) ( not ( = ?auto_98078 ?auto_98083 ) ) ( not ( = ?auto_98080 ?auto_98083 ) ) ( not ( = ?auto_98076 ?auto_98080 ) ) ( not ( = ?auto_98076 ?auto_98077 ) ) ( not ( = ?auto_98076 ?auto_98078 ) ) ( not ( = ?auto_98081 ?auto_98080 ) ) ( not ( = ?auto_98081 ?auto_98077 ) ) ( not ( = ?auto_98081 ?auto_98078 ) ) ( not ( = ?auto_98082 ?auto_98080 ) ) ( not ( = ?auto_98082 ?auto_98077 ) ) ( not ( = ?auto_98082 ?auto_98078 ) ) ( ON ?auto_98083 ?auto_98082 ) ( ON ?auto_98077 ?auto_98079 ) ( not ( = ?auto_98076 ?auto_98079 ) ) ( not ( = ?auto_98081 ?auto_98079 ) ) ( not ( = ?auto_98082 ?auto_98079 ) ) ( not ( = ?auto_98083 ?auto_98079 ) ) ( not ( = ?auto_98077 ?auto_98079 ) ) ( not ( = ?auto_98078 ?auto_98079 ) ) ( not ( = ?auto_98080 ?auto_98079 ) ) ( ON ?auto_98078 ?auto_98077 ) ( CLEAR ?auto_98078 ) ( ON-TABLE ?auto_98079 ) ( HOLDING ?auto_98080 ) ( CLEAR ?auto_98083 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98076 ?auto_98081 ?auto_98082 ?auto_98083 ?auto_98080 )
      ( MAKE-1PILE ?auto_98076 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98084 - BLOCK
    )
    :vars
    (
      ?auto_98090 - BLOCK
      ?auto_98091 - BLOCK
      ?auto_98089 - BLOCK
      ?auto_98085 - BLOCK
      ?auto_98087 - BLOCK
      ?auto_98086 - BLOCK
      ?auto_98088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98090 ?auto_98084 ) ( ON-TABLE ?auto_98084 ) ( not ( = ?auto_98084 ?auto_98090 ) ) ( not ( = ?auto_98084 ?auto_98091 ) ) ( not ( = ?auto_98084 ?auto_98089 ) ) ( not ( = ?auto_98090 ?auto_98091 ) ) ( not ( = ?auto_98090 ?auto_98089 ) ) ( not ( = ?auto_98091 ?auto_98089 ) ) ( ON ?auto_98091 ?auto_98090 ) ( not ( = ?auto_98085 ?auto_98087 ) ) ( not ( = ?auto_98085 ?auto_98086 ) ) ( not ( = ?auto_98085 ?auto_98089 ) ) ( not ( = ?auto_98087 ?auto_98086 ) ) ( not ( = ?auto_98087 ?auto_98089 ) ) ( not ( = ?auto_98086 ?auto_98089 ) ) ( not ( = ?auto_98084 ?auto_98086 ) ) ( not ( = ?auto_98084 ?auto_98085 ) ) ( not ( = ?auto_98084 ?auto_98087 ) ) ( not ( = ?auto_98090 ?auto_98086 ) ) ( not ( = ?auto_98090 ?auto_98085 ) ) ( not ( = ?auto_98090 ?auto_98087 ) ) ( not ( = ?auto_98091 ?auto_98086 ) ) ( not ( = ?auto_98091 ?auto_98085 ) ) ( not ( = ?auto_98091 ?auto_98087 ) ) ( ON ?auto_98089 ?auto_98091 ) ( ON ?auto_98085 ?auto_98088 ) ( not ( = ?auto_98084 ?auto_98088 ) ) ( not ( = ?auto_98090 ?auto_98088 ) ) ( not ( = ?auto_98091 ?auto_98088 ) ) ( not ( = ?auto_98089 ?auto_98088 ) ) ( not ( = ?auto_98085 ?auto_98088 ) ) ( not ( = ?auto_98087 ?auto_98088 ) ) ( not ( = ?auto_98086 ?auto_98088 ) ) ( ON ?auto_98087 ?auto_98085 ) ( ON-TABLE ?auto_98088 ) ( CLEAR ?auto_98089 ) ( ON ?auto_98086 ?auto_98087 ) ( CLEAR ?auto_98086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98088 ?auto_98085 ?auto_98087 )
      ( MAKE-1PILE ?auto_98084 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98092 - BLOCK
    )
    :vars
    (
      ?auto_98098 - BLOCK
      ?auto_98093 - BLOCK
      ?auto_98096 - BLOCK
      ?auto_98097 - BLOCK
      ?auto_98094 - BLOCK
      ?auto_98099 - BLOCK
      ?auto_98095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98098 ?auto_98092 ) ( ON-TABLE ?auto_98092 ) ( not ( = ?auto_98092 ?auto_98098 ) ) ( not ( = ?auto_98092 ?auto_98093 ) ) ( not ( = ?auto_98092 ?auto_98096 ) ) ( not ( = ?auto_98098 ?auto_98093 ) ) ( not ( = ?auto_98098 ?auto_98096 ) ) ( not ( = ?auto_98093 ?auto_98096 ) ) ( ON ?auto_98093 ?auto_98098 ) ( not ( = ?auto_98097 ?auto_98094 ) ) ( not ( = ?auto_98097 ?auto_98099 ) ) ( not ( = ?auto_98097 ?auto_98096 ) ) ( not ( = ?auto_98094 ?auto_98099 ) ) ( not ( = ?auto_98094 ?auto_98096 ) ) ( not ( = ?auto_98099 ?auto_98096 ) ) ( not ( = ?auto_98092 ?auto_98099 ) ) ( not ( = ?auto_98092 ?auto_98097 ) ) ( not ( = ?auto_98092 ?auto_98094 ) ) ( not ( = ?auto_98098 ?auto_98099 ) ) ( not ( = ?auto_98098 ?auto_98097 ) ) ( not ( = ?auto_98098 ?auto_98094 ) ) ( not ( = ?auto_98093 ?auto_98099 ) ) ( not ( = ?auto_98093 ?auto_98097 ) ) ( not ( = ?auto_98093 ?auto_98094 ) ) ( ON ?auto_98097 ?auto_98095 ) ( not ( = ?auto_98092 ?auto_98095 ) ) ( not ( = ?auto_98098 ?auto_98095 ) ) ( not ( = ?auto_98093 ?auto_98095 ) ) ( not ( = ?auto_98096 ?auto_98095 ) ) ( not ( = ?auto_98097 ?auto_98095 ) ) ( not ( = ?auto_98094 ?auto_98095 ) ) ( not ( = ?auto_98099 ?auto_98095 ) ) ( ON ?auto_98094 ?auto_98097 ) ( ON-TABLE ?auto_98095 ) ( ON ?auto_98099 ?auto_98094 ) ( CLEAR ?auto_98099 ) ( HOLDING ?auto_98096 ) ( CLEAR ?auto_98093 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98092 ?auto_98098 ?auto_98093 ?auto_98096 )
      ( MAKE-1PILE ?auto_98092 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98100 - BLOCK
    )
    :vars
    (
      ?auto_98106 - BLOCK
      ?auto_98101 - BLOCK
      ?auto_98104 - BLOCK
      ?auto_98105 - BLOCK
      ?auto_98102 - BLOCK
      ?auto_98107 - BLOCK
      ?auto_98103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98106 ?auto_98100 ) ( ON-TABLE ?auto_98100 ) ( not ( = ?auto_98100 ?auto_98106 ) ) ( not ( = ?auto_98100 ?auto_98101 ) ) ( not ( = ?auto_98100 ?auto_98104 ) ) ( not ( = ?auto_98106 ?auto_98101 ) ) ( not ( = ?auto_98106 ?auto_98104 ) ) ( not ( = ?auto_98101 ?auto_98104 ) ) ( ON ?auto_98101 ?auto_98106 ) ( not ( = ?auto_98105 ?auto_98102 ) ) ( not ( = ?auto_98105 ?auto_98107 ) ) ( not ( = ?auto_98105 ?auto_98104 ) ) ( not ( = ?auto_98102 ?auto_98107 ) ) ( not ( = ?auto_98102 ?auto_98104 ) ) ( not ( = ?auto_98107 ?auto_98104 ) ) ( not ( = ?auto_98100 ?auto_98107 ) ) ( not ( = ?auto_98100 ?auto_98105 ) ) ( not ( = ?auto_98100 ?auto_98102 ) ) ( not ( = ?auto_98106 ?auto_98107 ) ) ( not ( = ?auto_98106 ?auto_98105 ) ) ( not ( = ?auto_98106 ?auto_98102 ) ) ( not ( = ?auto_98101 ?auto_98107 ) ) ( not ( = ?auto_98101 ?auto_98105 ) ) ( not ( = ?auto_98101 ?auto_98102 ) ) ( ON ?auto_98105 ?auto_98103 ) ( not ( = ?auto_98100 ?auto_98103 ) ) ( not ( = ?auto_98106 ?auto_98103 ) ) ( not ( = ?auto_98101 ?auto_98103 ) ) ( not ( = ?auto_98104 ?auto_98103 ) ) ( not ( = ?auto_98105 ?auto_98103 ) ) ( not ( = ?auto_98102 ?auto_98103 ) ) ( not ( = ?auto_98107 ?auto_98103 ) ) ( ON ?auto_98102 ?auto_98105 ) ( ON-TABLE ?auto_98103 ) ( ON ?auto_98107 ?auto_98102 ) ( CLEAR ?auto_98101 ) ( ON ?auto_98104 ?auto_98107 ) ( CLEAR ?auto_98104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98103 ?auto_98105 ?auto_98102 ?auto_98107 )
      ( MAKE-1PILE ?auto_98100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98108 - BLOCK
    )
    :vars
    (
      ?auto_98110 - BLOCK
      ?auto_98114 - BLOCK
      ?auto_98113 - BLOCK
      ?auto_98112 - BLOCK
      ?auto_98111 - BLOCK
      ?auto_98115 - BLOCK
      ?auto_98109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98110 ?auto_98108 ) ( ON-TABLE ?auto_98108 ) ( not ( = ?auto_98108 ?auto_98110 ) ) ( not ( = ?auto_98108 ?auto_98114 ) ) ( not ( = ?auto_98108 ?auto_98113 ) ) ( not ( = ?auto_98110 ?auto_98114 ) ) ( not ( = ?auto_98110 ?auto_98113 ) ) ( not ( = ?auto_98114 ?auto_98113 ) ) ( not ( = ?auto_98112 ?auto_98111 ) ) ( not ( = ?auto_98112 ?auto_98115 ) ) ( not ( = ?auto_98112 ?auto_98113 ) ) ( not ( = ?auto_98111 ?auto_98115 ) ) ( not ( = ?auto_98111 ?auto_98113 ) ) ( not ( = ?auto_98115 ?auto_98113 ) ) ( not ( = ?auto_98108 ?auto_98115 ) ) ( not ( = ?auto_98108 ?auto_98112 ) ) ( not ( = ?auto_98108 ?auto_98111 ) ) ( not ( = ?auto_98110 ?auto_98115 ) ) ( not ( = ?auto_98110 ?auto_98112 ) ) ( not ( = ?auto_98110 ?auto_98111 ) ) ( not ( = ?auto_98114 ?auto_98115 ) ) ( not ( = ?auto_98114 ?auto_98112 ) ) ( not ( = ?auto_98114 ?auto_98111 ) ) ( ON ?auto_98112 ?auto_98109 ) ( not ( = ?auto_98108 ?auto_98109 ) ) ( not ( = ?auto_98110 ?auto_98109 ) ) ( not ( = ?auto_98114 ?auto_98109 ) ) ( not ( = ?auto_98113 ?auto_98109 ) ) ( not ( = ?auto_98112 ?auto_98109 ) ) ( not ( = ?auto_98111 ?auto_98109 ) ) ( not ( = ?auto_98115 ?auto_98109 ) ) ( ON ?auto_98111 ?auto_98112 ) ( ON-TABLE ?auto_98109 ) ( ON ?auto_98115 ?auto_98111 ) ( ON ?auto_98113 ?auto_98115 ) ( CLEAR ?auto_98113 ) ( HOLDING ?auto_98114 ) ( CLEAR ?auto_98110 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98108 ?auto_98110 ?auto_98114 )
      ( MAKE-1PILE ?auto_98108 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98116 - BLOCK
    )
    :vars
    (
      ?auto_98120 - BLOCK
      ?auto_98117 - BLOCK
      ?auto_98122 - BLOCK
      ?auto_98121 - BLOCK
      ?auto_98119 - BLOCK
      ?auto_98118 - BLOCK
      ?auto_98123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98120 ?auto_98116 ) ( ON-TABLE ?auto_98116 ) ( not ( = ?auto_98116 ?auto_98120 ) ) ( not ( = ?auto_98116 ?auto_98117 ) ) ( not ( = ?auto_98116 ?auto_98122 ) ) ( not ( = ?auto_98120 ?auto_98117 ) ) ( not ( = ?auto_98120 ?auto_98122 ) ) ( not ( = ?auto_98117 ?auto_98122 ) ) ( not ( = ?auto_98121 ?auto_98119 ) ) ( not ( = ?auto_98121 ?auto_98118 ) ) ( not ( = ?auto_98121 ?auto_98122 ) ) ( not ( = ?auto_98119 ?auto_98118 ) ) ( not ( = ?auto_98119 ?auto_98122 ) ) ( not ( = ?auto_98118 ?auto_98122 ) ) ( not ( = ?auto_98116 ?auto_98118 ) ) ( not ( = ?auto_98116 ?auto_98121 ) ) ( not ( = ?auto_98116 ?auto_98119 ) ) ( not ( = ?auto_98120 ?auto_98118 ) ) ( not ( = ?auto_98120 ?auto_98121 ) ) ( not ( = ?auto_98120 ?auto_98119 ) ) ( not ( = ?auto_98117 ?auto_98118 ) ) ( not ( = ?auto_98117 ?auto_98121 ) ) ( not ( = ?auto_98117 ?auto_98119 ) ) ( ON ?auto_98121 ?auto_98123 ) ( not ( = ?auto_98116 ?auto_98123 ) ) ( not ( = ?auto_98120 ?auto_98123 ) ) ( not ( = ?auto_98117 ?auto_98123 ) ) ( not ( = ?auto_98122 ?auto_98123 ) ) ( not ( = ?auto_98121 ?auto_98123 ) ) ( not ( = ?auto_98119 ?auto_98123 ) ) ( not ( = ?auto_98118 ?auto_98123 ) ) ( ON ?auto_98119 ?auto_98121 ) ( ON-TABLE ?auto_98123 ) ( ON ?auto_98118 ?auto_98119 ) ( ON ?auto_98122 ?auto_98118 ) ( CLEAR ?auto_98120 ) ( ON ?auto_98117 ?auto_98122 ) ( CLEAR ?auto_98117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98123 ?auto_98121 ?auto_98119 ?auto_98118 ?auto_98122 )
      ( MAKE-1PILE ?auto_98116 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98140 - BLOCK
    )
    :vars
    (
      ?auto_98145 - BLOCK
      ?auto_98144 - BLOCK
      ?auto_98141 - BLOCK
      ?auto_98143 - BLOCK
      ?auto_98147 - BLOCK
      ?auto_98142 - BLOCK
      ?auto_98146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98140 ?auto_98145 ) ) ( not ( = ?auto_98140 ?auto_98144 ) ) ( not ( = ?auto_98140 ?auto_98141 ) ) ( not ( = ?auto_98145 ?auto_98144 ) ) ( not ( = ?auto_98145 ?auto_98141 ) ) ( not ( = ?auto_98144 ?auto_98141 ) ) ( not ( = ?auto_98143 ?auto_98147 ) ) ( not ( = ?auto_98143 ?auto_98142 ) ) ( not ( = ?auto_98143 ?auto_98141 ) ) ( not ( = ?auto_98147 ?auto_98142 ) ) ( not ( = ?auto_98147 ?auto_98141 ) ) ( not ( = ?auto_98142 ?auto_98141 ) ) ( not ( = ?auto_98140 ?auto_98142 ) ) ( not ( = ?auto_98140 ?auto_98143 ) ) ( not ( = ?auto_98140 ?auto_98147 ) ) ( not ( = ?auto_98145 ?auto_98142 ) ) ( not ( = ?auto_98145 ?auto_98143 ) ) ( not ( = ?auto_98145 ?auto_98147 ) ) ( not ( = ?auto_98144 ?auto_98142 ) ) ( not ( = ?auto_98144 ?auto_98143 ) ) ( not ( = ?auto_98144 ?auto_98147 ) ) ( ON ?auto_98143 ?auto_98146 ) ( not ( = ?auto_98140 ?auto_98146 ) ) ( not ( = ?auto_98145 ?auto_98146 ) ) ( not ( = ?auto_98144 ?auto_98146 ) ) ( not ( = ?auto_98141 ?auto_98146 ) ) ( not ( = ?auto_98143 ?auto_98146 ) ) ( not ( = ?auto_98147 ?auto_98146 ) ) ( not ( = ?auto_98142 ?auto_98146 ) ) ( ON ?auto_98147 ?auto_98143 ) ( ON-TABLE ?auto_98146 ) ( ON ?auto_98142 ?auto_98147 ) ( ON ?auto_98141 ?auto_98142 ) ( ON ?auto_98144 ?auto_98141 ) ( ON ?auto_98145 ?auto_98144 ) ( CLEAR ?auto_98145 ) ( HOLDING ?auto_98140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98140 ?auto_98145 )
      ( MAKE-1PILE ?auto_98140 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98148 - BLOCK
    )
    :vars
    (
      ?auto_98151 - BLOCK
      ?auto_98154 - BLOCK
      ?auto_98152 - BLOCK
      ?auto_98150 - BLOCK
      ?auto_98155 - BLOCK
      ?auto_98153 - BLOCK
      ?auto_98149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98148 ?auto_98151 ) ) ( not ( = ?auto_98148 ?auto_98154 ) ) ( not ( = ?auto_98148 ?auto_98152 ) ) ( not ( = ?auto_98151 ?auto_98154 ) ) ( not ( = ?auto_98151 ?auto_98152 ) ) ( not ( = ?auto_98154 ?auto_98152 ) ) ( not ( = ?auto_98150 ?auto_98155 ) ) ( not ( = ?auto_98150 ?auto_98153 ) ) ( not ( = ?auto_98150 ?auto_98152 ) ) ( not ( = ?auto_98155 ?auto_98153 ) ) ( not ( = ?auto_98155 ?auto_98152 ) ) ( not ( = ?auto_98153 ?auto_98152 ) ) ( not ( = ?auto_98148 ?auto_98153 ) ) ( not ( = ?auto_98148 ?auto_98150 ) ) ( not ( = ?auto_98148 ?auto_98155 ) ) ( not ( = ?auto_98151 ?auto_98153 ) ) ( not ( = ?auto_98151 ?auto_98150 ) ) ( not ( = ?auto_98151 ?auto_98155 ) ) ( not ( = ?auto_98154 ?auto_98153 ) ) ( not ( = ?auto_98154 ?auto_98150 ) ) ( not ( = ?auto_98154 ?auto_98155 ) ) ( ON ?auto_98150 ?auto_98149 ) ( not ( = ?auto_98148 ?auto_98149 ) ) ( not ( = ?auto_98151 ?auto_98149 ) ) ( not ( = ?auto_98154 ?auto_98149 ) ) ( not ( = ?auto_98152 ?auto_98149 ) ) ( not ( = ?auto_98150 ?auto_98149 ) ) ( not ( = ?auto_98155 ?auto_98149 ) ) ( not ( = ?auto_98153 ?auto_98149 ) ) ( ON ?auto_98155 ?auto_98150 ) ( ON-TABLE ?auto_98149 ) ( ON ?auto_98153 ?auto_98155 ) ( ON ?auto_98152 ?auto_98153 ) ( ON ?auto_98154 ?auto_98152 ) ( ON ?auto_98151 ?auto_98154 ) ( ON ?auto_98148 ?auto_98151 ) ( CLEAR ?auto_98148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98149 ?auto_98150 ?auto_98155 ?auto_98153 ?auto_98152 ?auto_98154 ?auto_98151 )
      ( MAKE-1PILE ?auto_98148 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98162 - BLOCK
      ?auto_98163 - BLOCK
      ?auto_98164 - BLOCK
      ?auto_98165 - BLOCK
      ?auto_98166 - BLOCK
      ?auto_98167 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_98167 ) ( CLEAR ?auto_98166 ) ( ON-TABLE ?auto_98162 ) ( ON ?auto_98163 ?auto_98162 ) ( ON ?auto_98164 ?auto_98163 ) ( ON ?auto_98165 ?auto_98164 ) ( ON ?auto_98166 ?auto_98165 ) ( not ( = ?auto_98162 ?auto_98163 ) ) ( not ( = ?auto_98162 ?auto_98164 ) ) ( not ( = ?auto_98162 ?auto_98165 ) ) ( not ( = ?auto_98162 ?auto_98166 ) ) ( not ( = ?auto_98162 ?auto_98167 ) ) ( not ( = ?auto_98163 ?auto_98164 ) ) ( not ( = ?auto_98163 ?auto_98165 ) ) ( not ( = ?auto_98163 ?auto_98166 ) ) ( not ( = ?auto_98163 ?auto_98167 ) ) ( not ( = ?auto_98164 ?auto_98165 ) ) ( not ( = ?auto_98164 ?auto_98166 ) ) ( not ( = ?auto_98164 ?auto_98167 ) ) ( not ( = ?auto_98165 ?auto_98166 ) ) ( not ( = ?auto_98165 ?auto_98167 ) ) ( not ( = ?auto_98166 ?auto_98167 ) ) )
    :subtasks
    ( ( !STACK ?auto_98167 ?auto_98166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98168 - BLOCK
      ?auto_98169 - BLOCK
      ?auto_98170 - BLOCK
      ?auto_98171 - BLOCK
      ?auto_98172 - BLOCK
      ?auto_98173 - BLOCK
    )
    :vars
    (
      ?auto_98174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98172 ) ( ON-TABLE ?auto_98168 ) ( ON ?auto_98169 ?auto_98168 ) ( ON ?auto_98170 ?auto_98169 ) ( ON ?auto_98171 ?auto_98170 ) ( ON ?auto_98172 ?auto_98171 ) ( not ( = ?auto_98168 ?auto_98169 ) ) ( not ( = ?auto_98168 ?auto_98170 ) ) ( not ( = ?auto_98168 ?auto_98171 ) ) ( not ( = ?auto_98168 ?auto_98172 ) ) ( not ( = ?auto_98168 ?auto_98173 ) ) ( not ( = ?auto_98169 ?auto_98170 ) ) ( not ( = ?auto_98169 ?auto_98171 ) ) ( not ( = ?auto_98169 ?auto_98172 ) ) ( not ( = ?auto_98169 ?auto_98173 ) ) ( not ( = ?auto_98170 ?auto_98171 ) ) ( not ( = ?auto_98170 ?auto_98172 ) ) ( not ( = ?auto_98170 ?auto_98173 ) ) ( not ( = ?auto_98171 ?auto_98172 ) ) ( not ( = ?auto_98171 ?auto_98173 ) ) ( not ( = ?auto_98172 ?auto_98173 ) ) ( ON ?auto_98173 ?auto_98174 ) ( CLEAR ?auto_98173 ) ( HAND-EMPTY ) ( not ( = ?auto_98168 ?auto_98174 ) ) ( not ( = ?auto_98169 ?auto_98174 ) ) ( not ( = ?auto_98170 ?auto_98174 ) ) ( not ( = ?auto_98171 ?auto_98174 ) ) ( not ( = ?auto_98172 ?auto_98174 ) ) ( not ( = ?auto_98173 ?auto_98174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98173 ?auto_98174 )
      ( MAKE-6PILE ?auto_98168 ?auto_98169 ?auto_98170 ?auto_98171 ?auto_98172 ?auto_98173 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98175 - BLOCK
      ?auto_98176 - BLOCK
      ?auto_98177 - BLOCK
      ?auto_98178 - BLOCK
      ?auto_98179 - BLOCK
      ?auto_98180 - BLOCK
    )
    :vars
    (
      ?auto_98181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98175 ) ( ON ?auto_98176 ?auto_98175 ) ( ON ?auto_98177 ?auto_98176 ) ( ON ?auto_98178 ?auto_98177 ) ( not ( = ?auto_98175 ?auto_98176 ) ) ( not ( = ?auto_98175 ?auto_98177 ) ) ( not ( = ?auto_98175 ?auto_98178 ) ) ( not ( = ?auto_98175 ?auto_98179 ) ) ( not ( = ?auto_98175 ?auto_98180 ) ) ( not ( = ?auto_98176 ?auto_98177 ) ) ( not ( = ?auto_98176 ?auto_98178 ) ) ( not ( = ?auto_98176 ?auto_98179 ) ) ( not ( = ?auto_98176 ?auto_98180 ) ) ( not ( = ?auto_98177 ?auto_98178 ) ) ( not ( = ?auto_98177 ?auto_98179 ) ) ( not ( = ?auto_98177 ?auto_98180 ) ) ( not ( = ?auto_98178 ?auto_98179 ) ) ( not ( = ?auto_98178 ?auto_98180 ) ) ( not ( = ?auto_98179 ?auto_98180 ) ) ( ON ?auto_98180 ?auto_98181 ) ( CLEAR ?auto_98180 ) ( not ( = ?auto_98175 ?auto_98181 ) ) ( not ( = ?auto_98176 ?auto_98181 ) ) ( not ( = ?auto_98177 ?auto_98181 ) ) ( not ( = ?auto_98178 ?auto_98181 ) ) ( not ( = ?auto_98179 ?auto_98181 ) ) ( not ( = ?auto_98180 ?auto_98181 ) ) ( HOLDING ?auto_98179 ) ( CLEAR ?auto_98178 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98175 ?auto_98176 ?auto_98177 ?auto_98178 ?auto_98179 )
      ( MAKE-6PILE ?auto_98175 ?auto_98176 ?auto_98177 ?auto_98178 ?auto_98179 ?auto_98180 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98182 - BLOCK
      ?auto_98183 - BLOCK
      ?auto_98184 - BLOCK
      ?auto_98185 - BLOCK
      ?auto_98186 - BLOCK
      ?auto_98187 - BLOCK
    )
    :vars
    (
      ?auto_98188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98182 ) ( ON ?auto_98183 ?auto_98182 ) ( ON ?auto_98184 ?auto_98183 ) ( ON ?auto_98185 ?auto_98184 ) ( not ( = ?auto_98182 ?auto_98183 ) ) ( not ( = ?auto_98182 ?auto_98184 ) ) ( not ( = ?auto_98182 ?auto_98185 ) ) ( not ( = ?auto_98182 ?auto_98186 ) ) ( not ( = ?auto_98182 ?auto_98187 ) ) ( not ( = ?auto_98183 ?auto_98184 ) ) ( not ( = ?auto_98183 ?auto_98185 ) ) ( not ( = ?auto_98183 ?auto_98186 ) ) ( not ( = ?auto_98183 ?auto_98187 ) ) ( not ( = ?auto_98184 ?auto_98185 ) ) ( not ( = ?auto_98184 ?auto_98186 ) ) ( not ( = ?auto_98184 ?auto_98187 ) ) ( not ( = ?auto_98185 ?auto_98186 ) ) ( not ( = ?auto_98185 ?auto_98187 ) ) ( not ( = ?auto_98186 ?auto_98187 ) ) ( ON ?auto_98187 ?auto_98188 ) ( not ( = ?auto_98182 ?auto_98188 ) ) ( not ( = ?auto_98183 ?auto_98188 ) ) ( not ( = ?auto_98184 ?auto_98188 ) ) ( not ( = ?auto_98185 ?auto_98188 ) ) ( not ( = ?auto_98186 ?auto_98188 ) ) ( not ( = ?auto_98187 ?auto_98188 ) ) ( CLEAR ?auto_98185 ) ( ON ?auto_98186 ?auto_98187 ) ( CLEAR ?auto_98186 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98188 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98188 ?auto_98187 )
      ( MAKE-6PILE ?auto_98182 ?auto_98183 ?auto_98184 ?auto_98185 ?auto_98186 ?auto_98187 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98189 - BLOCK
      ?auto_98190 - BLOCK
      ?auto_98191 - BLOCK
      ?auto_98192 - BLOCK
      ?auto_98193 - BLOCK
      ?auto_98194 - BLOCK
    )
    :vars
    (
      ?auto_98195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98189 ) ( ON ?auto_98190 ?auto_98189 ) ( ON ?auto_98191 ?auto_98190 ) ( not ( = ?auto_98189 ?auto_98190 ) ) ( not ( = ?auto_98189 ?auto_98191 ) ) ( not ( = ?auto_98189 ?auto_98192 ) ) ( not ( = ?auto_98189 ?auto_98193 ) ) ( not ( = ?auto_98189 ?auto_98194 ) ) ( not ( = ?auto_98190 ?auto_98191 ) ) ( not ( = ?auto_98190 ?auto_98192 ) ) ( not ( = ?auto_98190 ?auto_98193 ) ) ( not ( = ?auto_98190 ?auto_98194 ) ) ( not ( = ?auto_98191 ?auto_98192 ) ) ( not ( = ?auto_98191 ?auto_98193 ) ) ( not ( = ?auto_98191 ?auto_98194 ) ) ( not ( = ?auto_98192 ?auto_98193 ) ) ( not ( = ?auto_98192 ?auto_98194 ) ) ( not ( = ?auto_98193 ?auto_98194 ) ) ( ON ?auto_98194 ?auto_98195 ) ( not ( = ?auto_98189 ?auto_98195 ) ) ( not ( = ?auto_98190 ?auto_98195 ) ) ( not ( = ?auto_98191 ?auto_98195 ) ) ( not ( = ?auto_98192 ?auto_98195 ) ) ( not ( = ?auto_98193 ?auto_98195 ) ) ( not ( = ?auto_98194 ?auto_98195 ) ) ( ON ?auto_98193 ?auto_98194 ) ( CLEAR ?auto_98193 ) ( ON-TABLE ?auto_98195 ) ( HOLDING ?auto_98192 ) ( CLEAR ?auto_98191 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98189 ?auto_98190 ?auto_98191 ?auto_98192 )
      ( MAKE-6PILE ?auto_98189 ?auto_98190 ?auto_98191 ?auto_98192 ?auto_98193 ?auto_98194 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98196 - BLOCK
      ?auto_98197 - BLOCK
      ?auto_98198 - BLOCK
      ?auto_98199 - BLOCK
      ?auto_98200 - BLOCK
      ?auto_98201 - BLOCK
    )
    :vars
    (
      ?auto_98202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98196 ) ( ON ?auto_98197 ?auto_98196 ) ( ON ?auto_98198 ?auto_98197 ) ( not ( = ?auto_98196 ?auto_98197 ) ) ( not ( = ?auto_98196 ?auto_98198 ) ) ( not ( = ?auto_98196 ?auto_98199 ) ) ( not ( = ?auto_98196 ?auto_98200 ) ) ( not ( = ?auto_98196 ?auto_98201 ) ) ( not ( = ?auto_98197 ?auto_98198 ) ) ( not ( = ?auto_98197 ?auto_98199 ) ) ( not ( = ?auto_98197 ?auto_98200 ) ) ( not ( = ?auto_98197 ?auto_98201 ) ) ( not ( = ?auto_98198 ?auto_98199 ) ) ( not ( = ?auto_98198 ?auto_98200 ) ) ( not ( = ?auto_98198 ?auto_98201 ) ) ( not ( = ?auto_98199 ?auto_98200 ) ) ( not ( = ?auto_98199 ?auto_98201 ) ) ( not ( = ?auto_98200 ?auto_98201 ) ) ( ON ?auto_98201 ?auto_98202 ) ( not ( = ?auto_98196 ?auto_98202 ) ) ( not ( = ?auto_98197 ?auto_98202 ) ) ( not ( = ?auto_98198 ?auto_98202 ) ) ( not ( = ?auto_98199 ?auto_98202 ) ) ( not ( = ?auto_98200 ?auto_98202 ) ) ( not ( = ?auto_98201 ?auto_98202 ) ) ( ON ?auto_98200 ?auto_98201 ) ( ON-TABLE ?auto_98202 ) ( CLEAR ?auto_98198 ) ( ON ?auto_98199 ?auto_98200 ) ( CLEAR ?auto_98199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98202 ?auto_98201 ?auto_98200 )
      ( MAKE-6PILE ?auto_98196 ?auto_98197 ?auto_98198 ?auto_98199 ?auto_98200 ?auto_98201 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98203 - BLOCK
      ?auto_98204 - BLOCK
      ?auto_98205 - BLOCK
      ?auto_98206 - BLOCK
      ?auto_98207 - BLOCK
      ?auto_98208 - BLOCK
    )
    :vars
    (
      ?auto_98209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98203 ) ( ON ?auto_98204 ?auto_98203 ) ( not ( = ?auto_98203 ?auto_98204 ) ) ( not ( = ?auto_98203 ?auto_98205 ) ) ( not ( = ?auto_98203 ?auto_98206 ) ) ( not ( = ?auto_98203 ?auto_98207 ) ) ( not ( = ?auto_98203 ?auto_98208 ) ) ( not ( = ?auto_98204 ?auto_98205 ) ) ( not ( = ?auto_98204 ?auto_98206 ) ) ( not ( = ?auto_98204 ?auto_98207 ) ) ( not ( = ?auto_98204 ?auto_98208 ) ) ( not ( = ?auto_98205 ?auto_98206 ) ) ( not ( = ?auto_98205 ?auto_98207 ) ) ( not ( = ?auto_98205 ?auto_98208 ) ) ( not ( = ?auto_98206 ?auto_98207 ) ) ( not ( = ?auto_98206 ?auto_98208 ) ) ( not ( = ?auto_98207 ?auto_98208 ) ) ( ON ?auto_98208 ?auto_98209 ) ( not ( = ?auto_98203 ?auto_98209 ) ) ( not ( = ?auto_98204 ?auto_98209 ) ) ( not ( = ?auto_98205 ?auto_98209 ) ) ( not ( = ?auto_98206 ?auto_98209 ) ) ( not ( = ?auto_98207 ?auto_98209 ) ) ( not ( = ?auto_98208 ?auto_98209 ) ) ( ON ?auto_98207 ?auto_98208 ) ( ON-TABLE ?auto_98209 ) ( ON ?auto_98206 ?auto_98207 ) ( CLEAR ?auto_98206 ) ( HOLDING ?auto_98205 ) ( CLEAR ?auto_98204 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98203 ?auto_98204 ?auto_98205 )
      ( MAKE-6PILE ?auto_98203 ?auto_98204 ?auto_98205 ?auto_98206 ?auto_98207 ?auto_98208 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98210 - BLOCK
      ?auto_98211 - BLOCK
      ?auto_98212 - BLOCK
      ?auto_98213 - BLOCK
      ?auto_98214 - BLOCK
      ?auto_98215 - BLOCK
    )
    :vars
    (
      ?auto_98216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98210 ) ( ON ?auto_98211 ?auto_98210 ) ( not ( = ?auto_98210 ?auto_98211 ) ) ( not ( = ?auto_98210 ?auto_98212 ) ) ( not ( = ?auto_98210 ?auto_98213 ) ) ( not ( = ?auto_98210 ?auto_98214 ) ) ( not ( = ?auto_98210 ?auto_98215 ) ) ( not ( = ?auto_98211 ?auto_98212 ) ) ( not ( = ?auto_98211 ?auto_98213 ) ) ( not ( = ?auto_98211 ?auto_98214 ) ) ( not ( = ?auto_98211 ?auto_98215 ) ) ( not ( = ?auto_98212 ?auto_98213 ) ) ( not ( = ?auto_98212 ?auto_98214 ) ) ( not ( = ?auto_98212 ?auto_98215 ) ) ( not ( = ?auto_98213 ?auto_98214 ) ) ( not ( = ?auto_98213 ?auto_98215 ) ) ( not ( = ?auto_98214 ?auto_98215 ) ) ( ON ?auto_98215 ?auto_98216 ) ( not ( = ?auto_98210 ?auto_98216 ) ) ( not ( = ?auto_98211 ?auto_98216 ) ) ( not ( = ?auto_98212 ?auto_98216 ) ) ( not ( = ?auto_98213 ?auto_98216 ) ) ( not ( = ?auto_98214 ?auto_98216 ) ) ( not ( = ?auto_98215 ?auto_98216 ) ) ( ON ?auto_98214 ?auto_98215 ) ( ON-TABLE ?auto_98216 ) ( ON ?auto_98213 ?auto_98214 ) ( CLEAR ?auto_98211 ) ( ON ?auto_98212 ?auto_98213 ) ( CLEAR ?auto_98212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98216 ?auto_98215 ?auto_98214 ?auto_98213 )
      ( MAKE-6PILE ?auto_98210 ?auto_98211 ?auto_98212 ?auto_98213 ?auto_98214 ?auto_98215 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98217 - BLOCK
      ?auto_98218 - BLOCK
      ?auto_98219 - BLOCK
      ?auto_98220 - BLOCK
      ?auto_98221 - BLOCK
      ?auto_98222 - BLOCK
    )
    :vars
    (
      ?auto_98223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98217 ) ( not ( = ?auto_98217 ?auto_98218 ) ) ( not ( = ?auto_98217 ?auto_98219 ) ) ( not ( = ?auto_98217 ?auto_98220 ) ) ( not ( = ?auto_98217 ?auto_98221 ) ) ( not ( = ?auto_98217 ?auto_98222 ) ) ( not ( = ?auto_98218 ?auto_98219 ) ) ( not ( = ?auto_98218 ?auto_98220 ) ) ( not ( = ?auto_98218 ?auto_98221 ) ) ( not ( = ?auto_98218 ?auto_98222 ) ) ( not ( = ?auto_98219 ?auto_98220 ) ) ( not ( = ?auto_98219 ?auto_98221 ) ) ( not ( = ?auto_98219 ?auto_98222 ) ) ( not ( = ?auto_98220 ?auto_98221 ) ) ( not ( = ?auto_98220 ?auto_98222 ) ) ( not ( = ?auto_98221 ?auto_98222 ) ) ( ON ?auto_98222 ?auto_98223 ) ( not ( = ?auto_98217 ?auto_98223 ) ) ( not ( = ?auto_98218 ?auto_98223 ) ) ( not ( = ?auto_98219 ?auto_98223 ) ) ( not ( = ?auto_98220 ?auto_98223 ) ) ( not ( = ?auto_98221 ?auto_98223 ) ) ( not ( = ?auto_98222 ?auto_98223 ) ) ( ON ?auto_98221 ?auto_98222 ) ( ON-TABLE ?auto_98223 ) ( ON ?auto_98220 ?auto_98221 ) ( ON ?auto_98219 ?auto_98220 ) ( CLEAR ?auto_98219 ) ( HOLDING ?auto_98218 ) ( CLEAR ?auto_98217 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98217 ?auto_98218 )
      ( MAKE-6PILE ?auto_98217 ?auto_98218 ?auto_98219 ?auto_98220 ?auto_98221 ?auto_98222 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98224 - BLOCK
      ?auto_98225 - BLOCK
      ?auto_98226 - BLOCK
      ?auto_98227 - BLOCK
      ?auto_98228 - BLOCK
      ?auto_98229 - BLOCK
    )
    :vars
    (
      ?auto_98230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98224 ) ( not ( = ?auto_98224 ?auto_98225 ) ) ( not ( = ?auto_98224 ?auto_98226 ) ) ( not ( = ?auto_98224 ?auto_98227 ) ) ( not ( = ?auto_98224 ?auto_98228 ) ) ( not ( = ?auto_98224 ?auto_98229 ) ) ( not ( = ?auto_98225 ?auto_98226 ) ) ( not ( = ?auto_98225 ?auto_98227 ) ) ( not ( = ?auto_98225 ?auto_98228 ) ) ( not ( = ?auto_98225 ?auto_98229 ) ) ( not ( = ?auto_98226 ?auto_98227 ) ) ( not ( = ?auto_98226 ?auto_98228 ) ) ( not ( = ?auto_98226 ?auto_98229 ) ) ( not ( = ?auto_98227 ?auto_98228 ) ) ( not ( = ?auto_98227 ?auto_98229 ) ) ( not ( = ?auto_98228 ?auto_98229 ) ) ( ON ?auto_98229 ?auto_98230 ) ( not ( = ?auto_98224 ?auto_98230 ) ) ( not ( = ?auto_98225 ?auto_98230 ) ) ( not ( = ?auto_98226 ?auto_98230 ) ) ( not ( = ?auto_98227 ?auto_98230 ) ) ( not ( = ?auto_98228 ?auto_98230 ) ) ( not ( = ?auto_98229 ?auto_98230 ) ) ( ON ?auto_98228 ?auto_98229 ) ( ON-TABLE ?auto_98230 ) ( ON ?auto_98227 ?auto_98228 ) ( ON ?auto_98226 ?auto_98227 ) ( CLEAR ?auto_98224 ) ( ON ?auto_98225 ?auto_98226 ) ( CLEAR ?auto_98225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98230 ?auto_98229 ?auto_98228 ?auto_98227 ?auto_98226 )
      ( MAKE-6PILE ?auto_98224 ?auto_98225 ?auto_98226 ?auto_98227 ?auto_98228 ?auto_98229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98231 - BLOCK
      ?auto_98232 - BLOCK
      ?auto_98233 - BLOCK
      ?auto_98234 - BLOCK
      ?auto_98235 - BLOCK
      ?auto_98236 - BLOCK
    )
    :vars
    (
      ?auto_98237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98231 ?auto_98232 ) ) ( not ( = ?auto_98231 ?auto_98233 ) ) ( not ( = ?auto_98231 ?auto_98234 ) ) ( not ( = ?auto_98231 ?auto_98235 ) ) ( not ( = ?auto_98231 ?auto_98236 ) ) ( not ( = ?auto_98232 ?auto_98233 ) ) ( not ( = ?auto_98232 ?auto_98234 ) ) ( not ( = ?auto_98232 ?auto_98235 ) ) ( not ( = ?auto_98232 ?auto_98236 ) ) ( not ( = ?auto_98233 ?auto_98234 ) ) ( not ( = ?auto_98233 ?auto_98235 ) ) ( not ( = ?auto_98233 ?auto_98236 ) ) ( not ( = ?auto_98234 ?auto_98235 ) ) ( not ( = ?auto_98234 ?auto_98236 ) ) ( not ( = ?auto_98235 ?auto_98236 ) ) ( ON ?auto_98236 ?auto_98237 ) ( not ( = ?auto_98231 ?auto_98237 ) ) ( not ( = ?auto_98232 ?auto_98237 ) ) ( not ( = ?auto_98233 ?auto_98237 ) ) ( not ( = ?auto_98234 ?auto_98237 ) ) ( not ( = ?auto_98235 ?auto_98237 ) ) ( not ( = ?auto_98236 ?auto_98237 ) ) ( ON ?auto_98235 ?auto_98236 ) ( ON-TABLE ?auto_98237 ) ( ON ?auto_98234 ?auto_98235 ) ( ON ?auto_98233 ?auto_98234 ) ( ON ?auto_98232 ?auto_98233 ) ( CLEAR ?auto_98232 ) ( HOLDING ?auto_98231 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98231 )
      ( MAKE-6PILE ?auto_98231 ?auto_98232 ?auto_98233 ?auto_98234 ?auto_98235 ?auto_98236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98238 - BLOCK
      ?auto_98239 - BLOCK
      ?auto_98240 - BLOCK
      ?auto_98241 - BLOCK
      ?auto_98242 - BLOCK
      ?auto_98243 - BLOCK
    )
    :vars
    (
      ?auto_98244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98238 ?auto_98239 ) ) ( not ( = ?auto_98238 ?auto_98240 ) ) ( not ( = ?auto_98238 ?auto_98241 ) ) ( not ( = ?auto_98238 ?auto_98242 ) ) ( not ( = ?auto_98238 ?auto_98243 ) ) ( not ( = ?auto_98239 ?auto_98240 ) ) ( not ( = ?auto_98239 ?auto_98241 ) ) ( not ( = ?auto_98239 ?auto_98242 ) ) ( not ( = ?auto_98239 ?auto_98243 ) ) ( not ( = ?auto_98240 ?auto_98241 ) ) ( not ( = ?auto_98240 ?auto_98242 ) ) ( not ( = ?auto_98240 ?auto_98243 ) ) ( not ( = ?auto_98241 ?auto_98242 ) ) ( not ( = ?auto_98241 ?auto_98243 ) ) ( not ( = ?auto_98242 ?auto_98243 ) ) ( ON ?auto_98243 ?auto_98244 ) ( not ( = ?auto_98238 ?auto_98244 ) ) ( not ( = ?auto_98239 ?auto_98244 ) ) ( not ( = ?auto_98240 ?auto_98244 ) ) ( not ( = ?auto_98241 ?auto_98244 ) ) ( not ( = ?auto_98242 ?auto_98244 ) ) ( not ( = ?auto_98243 ?auto_98244 ) ) ( ON ?auto_98242 ?auto_98243 ) ( ON-TABLE ?auto_98244 ) ( ON ?auto_98241 ?auto_98242 ) ( ON ?auto_98240 ?auto_98241 ) ( ON ?auto_98239 ?auto_98240 ) ( ON ?auto_98238 ?auto_98239 ) ( CLEAR ?auto_98238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98244 ?auto_98243 ?auto_98242 ?auto_98241 ?auto_98240 ?auto_98239 )
      ( MAKE-6PILE ?auto_98238 ?auto_98239 ?auto_98240 ?auto_98241 ?auto_98242 ?auto_98243 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98245 - BLOCK
      ?auto_98246 - BLOCK
      ?auto_98247 - BLOCK
      ?auto_98248 - BLOCK
      ?auto_98249 - BLOCK
      ?auto_98250 - BLOCK
    )
    :vars
    (
      ?auto_98251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98245 ?auto_98246 ) ) ( not ( = ?auto_98245 ?auto_98247 ) ) ( not ( = ?auto_98245 ?auto_98248 ) ) ( not ( = ?auto_98245 ?auto_98249 ) ) ( not ( = ?auto_98245 ?auto_98250 ) ) ( not ( = ?auto_98246 ?auto_98247 ) ) ( not ( = ?auto_98246 ?auto_98248 ) ) ( not ( = ?auto_98246 ?auto_98249 ) ) ( not ( = ?auto_98246 ?auto_98250 ) ) ( not ( = ?auto_98247 ?auto_98248 ) ) ( not ( = ?auto_98247 ?auto_98249 ) ) ( not ( = ?auto_98247 ?auto_98250 ) ) ( not ( = ?auto_98248 ?auto_98249 ) ) ( not ( = ?auto_98248 ?auto_98250 ) ) ( not ( = ?auto_98249 ?auto_98250 ) ) ( ON ?auto_98250 ?auto_98251 ) ( not ( = ?auto_98245 ?auto_98251 ) ) ( not ( = ?auto_98246 ?auto_98251 ) ) ( not ( = ?auto_98247 ?auto_98251 ) ) ( not ( = ?auto_98248 ?auto_98251 ) ) ( not ( = ?auto_98249 ?auto_98251 ) ) ( not ( = ?auto_98250 ?auto_98251 ) ) ( ON ?auto_98249 ?auto_98250 ) ( ON-TABLE ?auto_98251 ) ( ON ?auto_98248 ?auto_98249 ) ( ON ?auto_98247 ?auto_98248 ) ( ON ?auto_98246 ?auto_98247 ) ( HOLDING ?auto_98245 ) ( CLEAR ?auto_98246 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98251 ?auto_98250 ?auto_98249 ?auto_98248 ?auto_98247 ?auto_98246 ?auto_98245 )
      ( MAKE-6PILE ?auto_98245 ?auto_98246 ?auto_98247 ?auto_98248 ?auto_98249 ?auto_98250 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98252 - BLOCK
      ?auto_98253 - BLOCK
      ?auto_98254 - BLOCK
      ?auto_98255 - BLOCK
      ?auto_98256 - BLOCK
      ?auto_98257 - BLOCK
    )
    :vars
    (
      ?auto_98258 - BLOCK
      ?auto_98259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98252 ?auto_98253 ) ) ( not ( = ?auto_98252 ?auto_98254 ) ) ( not ( = ?auto_98252 ?auto_98255 ) ) ( not ( = ?auto_98252 ?auto_98256 ) ) ( not ( = ?auto_98252 ?auto_98257 ) ) ( not ( = ?auto_98253 ?auto_98254 ) ) ( not ( = ?auto_98253 ?auto_98255 ) ) ( not ( = ?auto_98253 ?auto_98256 ) ) ( not ( = ?auto_98253 ?auto_98257 ) ) ( not ( = ?auto_98254 ?auto_98255 ) ) ( not ( = ?auto_98254 ?auto_98256 ) ) ( not ( = ?auto_98254 ?auto_98257 ) ) ( not ( = ?auto_98255 ?auto_98256 ) ) ( not ( = ?auto_98255 ?auto_98257 ) ) ( not ( = ?auto_98256 ?auto_98257 ) ) ( ON ?auto_98257 ?auto_98258 ) ( not ( = ?auto_98252 ?auto_98258 ) ) ( not ( = ?auto_98253 ?auto_98258 ) ) ( not ( = ?auto_98254 ?auto_98258 ) ) ( not ( = ?auto_98255 ?auto_98258 ) ) ( not ( = ?auto_98256 ?auto_98258 ) ) ( not ( = ?auto_98257 ?auto_98258 ) ) ( ON ?auto_98256 ?auto_98257 ) ( ON-TABLE ?auto_98258 ) ( ON ?auto_98255 ?auto_98256 ) ( ON ?auto_98254 ?auto_98255 ) ( ON ?auto_98253 ?auto_98254 ) ( CLEAR ?auto_98253 ) ( ON ?auto_98252 ?auto_98259 ) ( CLEAR ?auto_98252 ) ( HAND-EMPTY ) ( not ( = ?auto_98252 ?auto_98259 ) ) ( not ( = ?auto_98253 ?auto_98259 ) ) ( not ( = ?auto_98254 ?auto_98259 ) ) ( not ( = ?auto_98255 ?auto_98259 ) ) ( not ( = ?auto_98256 ?auto_98259 ) ) ( not ( = ?auto_98257 ?auto_98259 ) ) ( not ( = ?auto_98258 ?auto_98259 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98252 ?auto_98259 )
      ( MAKE-6PILE ?auto_98252 ?auto_98253 ?auto_98254 ?auto_98255 ?auto_98256 ?auto_98257 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98260 - BLOCK
      ?auto_98261 - BLOCK
      ?auto_98262 - BLOCK
      ?auto_98263 - BLOCK
      ?auto_98264 - BLOCK
      ?auto_98265 - BLOCK
    )
    :vars
    (
      ?auto_98267 - BLOCK
      ?auto_98266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98260 ?auto_98261 ) ) ( not ( = ?auto_98260 ?auto_98262 ) ) ( not ( = ?auto_98260 ?auto_98263 ) ) ( not ( = ?auto_98260 ?auto_98264 ) ) ( not ( = ?auto_98260 ?auto_98265 ) ) ( not ( = ?auto_98261 ?auto_98262 ) ) ( not ( = ?auto_98261 ?auto_98263 ) ) ( not ( = ?auto_98261 ?auto_98264 ) ) ( not ( = ?auto_98261 ?auto_98265 ) ) ( not ( = ?auto_98262 ?auto_98263 ) ) ( not ( = ?auto_98262 ?auto_98264 ) ) ( not ( = ?auto_98262 ?auto_98265 ) ) ( not ( = ?auto_98263 ?auto_98264 ) ) ( not ( = ?auto_98263 ?auto_98265 ) ) ( not ( = ?auto_98264 ?auto_98265 ) ) ( ON ?auto_98265 ?auto_98267 ) ( not ( = ?auto_98260 ?auto_98267 ) ) ( not ( = ?auto_98261 ?auto_98267 ) ) ( not ( = ?auto_98262 ?auto_98267 ) ) ( not ( = ?auto_98263 ?auto_98267 ) ) ( not ( = ?auto_98264 ?auto_98267 ) ) ( not ( = ?auto_98265 ?auto_98267 ) ) ( ON ?auto_98264 ?auto_98265 ) ( ON-TABLE ?auto_98267 ) ( ON ?auto_98263 ?auto_98264 ) ( ON ?auto_98262 ?auto_98263 ) ( ON ?auto_98260 ?auto_98266 ) ( CLEAR ?auto_98260 ) ( not ( = ?auto_98260 ?auto_98266 ) ) ( not ( = ?auto_98261 ?auto_98266 ) ) ( not ( = ?auto_98262 ?auto_98266 ) ) ( not ( = ?auto_98263 ?auto_98266 ) ) ( not ( = ?auto_98264 ?auto_98266 ) ) ( not ( = ?auto_98265 ?auto_98266 ) ) ( not ( = ?auto_98267 ?auto_98266 ) ) ( HOLDING ?auto_98261 ) ( CLEAR ?auto_98262 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98267 ?auto_98265 ?auto_98264 ?auto_98263 ?auto_98262 ?auto_98261 )
      ( MAKE-6PILE ?auto_98260 ?auto_98261 ?auto_98262 ?auto_98263 ?auto_98264 ?auto_98265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98268 - BLOCK
      ?auto_98269 - BLOCK
      ?auto_98270 - BLOCK
      ?auto_98271 - BLOCK
      ?auto_98272 - BLOCK
      ?auto_98273 - BLOCK
    )
    :vars
    (
      ?auto_98274 - BLOCK
      ?auto_98275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98268 ?auto_98269 ) ) ( not ( = ?auto_98268 ?auto_98270 ) ) ( not ( = ?auto_98268 ?auto_98271 ) ) ( not ( = ?auto_98268 ?auto_98272 ) ) ( not ( = ?auto_98268 ?auto_98273 ) ) ( not ( = ?auto_98269 ?auto_98270 ) ) ( not ( = ?auto_98269 ?auto_98271 ) ) ( not ( = ?auto_98269 ?auto_98272 ) ) ( not ( = ?auto_98269 ?auto_98273 ) ) ( not ( = ?auto_98270 ?auto_98271 ) ) ( not ( = ?auto_98270 ?auto_98272 ) ) ( not ( = ?auto_98270 ?auto_98273 ) ) ( not ( = ?auto_98271 ?auto_98272 ) ) ( not ( = ?auto_98271 ?auto_98273 ) ) ( not ( = ?auto_98272 ?auto_98273 ) ) ( ON ?auto_98273 ?auto_98274 ) ( not ( = ?auto_98268 ?auto_98274 ) ) ( not ( = ?auto_98269 ?auto_98274 ) ) ( not ( = ?auto_98270 ?auto_98274 ) ) ( not ( = ?auto_98271 ?auto_98274 ) ) ( not ( = ?auto_98272 ?auto_98274 ) ) ( not ( = ?auto_98273 ?auto_98274 ) ) ( ON ?auto_98272 ?auto_98273 ) ( ON-TABLE ?auto_98274 ) ( ON ?auto_98271 ?auto_98272 ) ( ON ?auto_98270 ?auto_98271 ) ( ON ?auto_98268 ?auto_98275 ) ( not ( = ?auto_98268 ?auto_98275 ) ) ( not ( = ?auto_98269 ?auto_98275 ) ) ( not ( = ?auto_98270 ?auto_98275 ) ) ( not ( = ?auto_98271 ?auto_98275 ) ) ( not ( = ?auto_98272 ?auto_98275 ) ) ( not ( = ?auto_98273 ?auto_98275 ) ) ( not ( = ?auto_98274 ?auto_98275 ) ) ( CLEAR ?auto_98270 ) ( ON ?auto_98269 ?auto_98268 ) ( CLEAR ?auto_98269 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98275 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98275 ?auto_98268 )
      ( MAKE-6PILE ?auto_98268 ?auto_98269 ?auto_98270 ?auto_98271 ?auto_98272 ?auto_98273 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98276 - BLOCK
      ?auto_98277 - BLOCK
      ?auto_98278 - BLOCK
      ?auto_98279 - BLOCK
      ?auto_98280 - BLOCK
      ?auto_98281 - BLOCK
    )
    :vars
    (
      ?auto_98283 - BLOCK
      ?auto_98282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98276 ?auto_98277 ) ) ( not ( = ?auto_98276 ?auto_98278 ) ) ( not ( = ?auto_98276 ?auto_98279 ) ) ( not ( = ?auto_98276 ?auto_98280 ) ) ( not ( = ?auto_98276 ?auto_98281 ) ) ( not ( = ?auto_98277 ?auto_98278 ) ) ( not ( = ?auto_98277 ?auto_98279 ) ) ( not ( = ?auto_98277 ?auto_98280 ) ) ( not ( = ?auto_98277 ?auto_98281 ) ) ( not ( = ?auto_98278 ?auto_98279 ) ) ( not ( = ?auto_98278 ?auto_98280 ) ) ( not ( = ?auto_98278 ?auto_98281 ) ) ( not ( = ?auto_98279 ?auto_98280 ) ) ( not ( = ?auto_98279 ?auto_98281 ) ) ( not ( = ?auto_98280 ?auto_98281 ) ) ( ON ?auto_98281 ?auto_98283 ) ( not ( = ?auto_98276 ?auto_98283 ) ) ( not ( = ?auto_98277 ?auto_98283 ) ) ( not ( = ?auto_98278 ?auto_98283 ) ) ( not ( = ?auto_98279 ?auto_98283 ) ) ( not ( = ?auto_98280 ?auto_98283 ) ) ( not ( = ?auto_98281 ?auto_98283 ) ) ( ON ?auto_98280 ?auto_98281 ) ( ON-TABLE ?auto_98283 ) ( ON ?auto_98279 ?auto_98280 ) ( ON ?auto_98276 ?auto_98282 ) ( not ( = ?auto_98276 ?auto_98282 ) ) ( not ( = ?auto_98277 ?auto_98282 ) ) ( not ( = ?auto_98278 ?auto_98282 ) ) ( not ( = ?auto_98279 ?auto_98282 ) ) ( not ( = ?auto_98280 ?auto_98282 ) ) ( not ( = ?auto_98281 ?auto_98282 ) ) ( not ( = ?auto_98283 ?auto_98282 ) ) ( ON ?auto_98277 ?auto_98276 ) ( CLEAR ?auto_98277 ) ( ON-TABLE ?auto_98282 ) ( HOLDING ?auto_98278 ) ( CLEAR ?auto_98279 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98283 ?auto_98281 ?auto_98280 ?auto_98279 ?auto_98278 )
      ( MAKE-6PILE ?auto_98276 ?auto_98277 ?auto_98278 ?auto_98279 ?auto_98280 ?auto_98281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98284 - BLOCK
      ?auto_98285 - BLOCK
      ?auto_98286 - BLOCK
      ?auto_98287 - BLOCK
      ?auto_98288 - BLOCK
      ?auto_98289 - BLOCK
    )
    :vars
    (
      ?auto_98291 - BLOCK
      ?auto_98290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98284 ?auto_98285 ) ) ( not ( = ?auto_98284 ?auto_98286 ) ) ( not ( = ?auto_98284 ?auto_98287 ) ) ( not ( = ?auto_98284 ?auto_98288 ) ) ( not ( = ?auto_98284 ?auto_98289 ) ) ( not ( = ?auto_98285 ?auto_98286 ) ) ( not ( = ?auto_98285 ?auto_98287 ) ) ( not ( = ?auto_98285 ?auto_98288 ) ) ( not ( = ?auto_98285 ?auto_98289 ) ) ( not ( = ?auto_98286 ?auto_98287 ) ) ( not ( = ?auto_98286 ?auto_98288 ) ) ( not ( = ?auto_98286 ?auto_98289 ) ) ( not ( = ?auto_98287 ?auto_98288 ) ) ( not ( = ?auto_98287 ?auto_98289 ) ) ( not ( = ?auto_98288 ?auto_98289 ) ) ( ON ?auto_98289 ?auto_98291 ) ( not ( = ?auto_98284 ?auto_98291 ) ) ( not ( = ?auto_98285 ?auto_98291 ) ) ( not ( = ?auto_98286 ?auto_98291 ) ) ( not ( = ?auto_98287 ?auto_98291 ) ) ( not ( = ?auto_98288 ?auto_98291 ) ) ( not ( = ?auto_98289 ?auto_98291 ) ) ( ON ?auto_98288 ?auto_98289 ) ( ON-TABLE ?auto_98291 ) ( ON ?auto_98287 ?auto_98288 ) ( ON ?auto_98284 ?auto_98290 ) ( not ( = ?auto_98284 ?auto_98290 ) ) ( not ( = ?auto_98285 ?auto_98290 ) ) ( not ( = ?auto_98286 ?auto_98290 ) ) ( not ( = ?auto_98287 ?auto_98290 ) ) ( not ( = ?auto_98288 ?auto_98290 ) ) ( not ( = ?auto_98289 ?auto_98290 ) ) ( not ( = ?auto_98291 ?auto_98290 ) ) ( ON ?auto_98285 ?auto_98284 ) ( ON-TABLE ?auto_98290 ) ( CLEAR ?auto_98287 ) ( ON ?auto_98286 ?auto_98285 ) ( CLEAR ?auto_98286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98290 ?auto_98284 ?auto_98285 )
      ( MAKE-6PILE ?auto_98284 ?auto_98285 ?auto_98286 ?auto_98287 ?auto_98288 ?auto_98289 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98292 - BLOCK
      ?auto_98293 - BLOCK
      ?auto_98294 - BLOCK
      ?auto_98295 - BLOCK
      ?auto_98296 - BLOCK
      ?auto_98297 - BLOCK
    )
    :vars
    (
      ?auto_98298 - BLOCK
      ?auto_98299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98292 ?auto_98293 ) ) ( not ( = ?auto_98292 ?auto_98294 ) ) ( not ( = ?auto_98292 ?auto_98295 ) ) ( not ( = ?auto_98292 ?auto_98296 ) ) ( not ( = ?auto_98292 ?auto_98297 ) ) ( not ( = ?auto_98293 ?auto_98294 ) ) ( not ( = ?auto_98293 ?auto_98295 ) ) ( not ( = ?auto_98293 ?auto_98296 ) ) ( not ( = ?auto_98293 ?auto_98297 ) ) ( not ( = ?auto_98294 ?auto_98295 ) ) ( not ( = ?auto_98294 ?auto_98296 ) ) ( not ( = ?auto_98294 ?auto_98297 ) ) ( not ( = ?auto_98295 ?auto_98296 ) ) ( not ( = ?auto_98295 ?auto_98297 ) ) ( not ( = ?auto_98296 ?auto_98297 ) ) ( ON ?auto_98297 ?auto_98298 ) ( not ( = ?auto_98292 ?auto_98298 ) ) ( not ( = ?auto_98293 ?auto_98298 ) ) ( not ( = ?auto_98294 ?auto_98298 ) ) ( not ( = ?auto_98295 ?auto_98298 ) ) ( not ( = ?auto_98296 ?auto_98298 ) ) ( not ( = ?auto_98297 ?auto_98298 ) ) ( ON ?auto_98296 ?auto_98297 ) ( ON-TABLE ?auto_98298 ) ( ON ?auto_98292 ?auto_98299 ) ( not ( = ?auto_98292 ?auto_98299 ) ) ( not ( = ?auto_98293 ?auto_98299 ) ) ( not ( = ?auto_98294 ?auto_98299 ) ) ( not ( = ?auto_98295 ?auto_98299 ) ) ( not ( = ?auto_98296 ?auto_98299 ) ) ( not ( = ?auto_98297 ?auto_98299 ) ) ( not ( = ?auto_98298 ?auto_98299 ) ) ( ON ?auto_98293 ?auto_98292 ) ( ON-TABLE ?auto_98299 ) ( ON ?auto_98294 ?auto_98293 ) ( CLEAR ?auto_98294 ) ( HOLDING ?auto_98295 ) ( CLEAR ?auto_98296 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98298 ?auto_98297 ?auto_98296 ?auto_98295 )
      ( MAKE-6PILE ?auto_98292 ?auto_98293 ?auto_98294 ?auto_98295 ?auto_98296 ?auto_98297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98300 - BLOCK
      ?auto_98301 - BLOCK
      ?auto_98302 - BLOCK
      ?auto_98303 - BLOCK
      ?auto_98304 - BLOCK
      ?auto_98305 - BLOCK
    )
    :vars
    (
      ?auto_98307 - BLOCK
      ?auto_98306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98300 ?auto_98301 ) ) ( not ( = ?auto_98300 ?auto_98302 ) ) ( not ( = ?auto_98300 ?auto_98303 ) ) ( not ( = ?auto_98300 ?auto_98304 ) ) ( not ( = ?auto_98300 ?auto_98305 ) ) ( not ( = ?auto_98301 ?auto_98302 ) ) ( not ( = ?auto_98301 ?auto_98303 ) ) ( not ( = ?auto_98301 ?auto_98304 ) ) ( not ( = ?auto_98301 ?auto_98305 ) ) ( not ( = ?auto_98302 ?auto_98303 ) ) ( not ( = ?auto_98302 ?auto_98304 ) ) ( not ( = ?auto_98302 ?auto_98305 ) ) ( not ( = ?auto_98303 ?auto_98304 ) ) ( not ( = ?auto_98303 ?auto_98305 ) ) ( not ( = ?auto_98304 ?auto_98305 ) ) ( ON ?auto_98305 ?auto_98307 ) ( not ( = ?auto_98300 ?auto_98307 ) ) ( not ( = ?auto_98301 ?auto_98307 ) ) ( not ( = ?auto_98302 ?auto_98307 ) ) ( not ( = ?auto_98303 ?auto_98307 ) ) ( not ( = ?auto_98304 ?auto_98307 ) ) ( not ( = ?auto_98305 ?auto_98307 ) ) ( ON ?auto_98304 ?auto_98305 ) ( ON-TABLE ?auto_98307 ) ( ON ?auto_98300 ?auto_98306 ) ( not ( = ?auto_98300 ?auto_98306 ) ) ( not ( = ?auto_98301 ?auto_98306 ) ) ( not ( = ?auto_98302 ?auto_98306 ) ) ( not ( = ?auto_98303 ?auto_98306 ) ) ( not ( = ?auto_98304 ?auto_98306 ) ) ( not ( = ?auto_98305 ?auto_98306 ) ) ( not ( = ?auto_98307 ?auto_98306 ) ) ( ON ?auto_98301 ?auto_98300 ) ( ON-TABLE ?auto_98306 ) ( ON ?auto_98302 ?auto_98301 ) ( CLEAR ?auto_98304 ) ( ON ?auto_98303 ?auto_98302 ) ( CLEAR ?auto_98303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98306 ?auto_98300 ?auto_98301 ?auto_98302 )
      ( MAKE-6PILE ?auto_98300 ?auto_98301 ?auto_98302 ?auto_98303 ?auto_98304 ?auto_98305 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98308 - BLOCK
      ?auto_98309 - BLOCK
      ?auto_98310 - BLOCK
      ?auto_98311 - BLOCK
      ?auto_98312 - BLOCK
      ?auto_98313 - BLOCK
    )
    :vars
    (
      ?auto_98315 - BLOCK
      ?auto_98314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98308 ?auto_98309 ) ) ( not ( = ?auto_98308 ?auto_98310 ) ) ( not ( = ?auto_98308 ?auto_98311 ) ) ( not ( = ?auto_98308 ?auto_98312 ) ) ( not ( = ?auto_98308 ?auto_98313 ) ) ( not ( = ?auto_98309 ?auto_98310 ) ) ( not ( = ?auto_98309 ?auto_98311 ) ) ( not ( = ?auto_98309 ?auto_98312 ) ) ( not ( = ?auto_98309 ?auto_98313 ) ) ( not ( = ?auto_98310 ?auto_98311 ) ) ( not ( = ?auto_98310 ?auto_98312 ) ) ( not ( = ?auto_98310 ?auto_98313 ) ) ( not ( = ?auto_98311 ?auto_98312 ) ) ( not ( = ?auto_98311 ?auto_98313 ) ) ( not ( = ?auto_98312 ?auto_98313 ) ) ( ON ?auto_98313 ?auto_98315 ) ( not ( = ?auto_98308 ?auto_98315 ) ) ( not ( = ?auto_98309 ?auto_98315 ) ) ( not ( = ?auto_98310 ?auto_98315 ) ) ( not ( = ?auto_98311 ?auto_98315 ) ) ( not ( = ?auto_98312 ?auto_98315 ) ) ( not ( = ?auto_98313 ?auto_98315 ) ) ( ON-TABLE ?auto_98315 ) ( ON ?auto_98308 ?auto_98314 ) ( not ( = ?auto_98308 ?auto_98314 ) ) ( not ( = ?auto_98309 ?auto_98314 ) ) ( not ( = ?auto_98310 ?auto_98314 ) ) ( not ( = ?auto_98311 ?auto_98314 ) ) ( not ( = ?auto_98312 ?auto_98314 ) ) ( not ( = ?auto_98313 ?auto_98314 ) ) ( not ( = ?auto_98315 ?auto_98314 ) ) ( ON ?auto_98309 ?auto_98308 ) ( ON-TABLE ?auto_98314 ) ( ON ?auto_98310 ?auto_98309 ) ( ON ?auto_98311 ?auto_98310 ) ( CLEAR ?auto_98311 ) ( HOLDING ?auto_98312 ) ( CLEAR ?auto_98313 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98315 ?auto_98313 ?auto_98312 )
      ( MAKE-6PILE ?auto_98308 ?auto_98309 ?auto_98310 ?auto_98311 ?auto_98312 ?auto_98313 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98316 - BLOCK
      ?auto_98317 - BLOCK
      ?auto_98318 - BLOCK
      ?auto_98319 - BLOCK
      ?auto_98320 - BLOCK
      ?auto_98321 - BLOCK
    )
    :vars
    (
      ?auto_98323 - BLOCK
      ?auto_98322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98316 ?auto_98317 ) ) ( not ( = ?auto_98316 ?auto_98318 ) ) ( not ( = ?auto_98316 ?auto_98319 ) ) ( not ( = ?auto_98316 ?auto_98320 ) ) ( not ( = ?auto_98316 ?auto_98321 ) ) ( not ( = ?auto_98317 ?auto_98318 ) ) ( not ( = ?auto_98317 ?auto_98319 ) ) ( not ( = ?auto_98317 ?auto_98320 ) ) ( not ( = ?auto_98317 ?auto_98321 ) ) ( not ( = ?auto_98318 ?auto_98319 ) ) ( not ( = ?auto_98318 ?auto_98320 ) ) ( not ( = ?auto_98318 ?auto_98321 ) ) ( not ( = ?auto_98319 ?auto_98320 ) ) ( not ( = ?auto_98319 ?auto_98321 ) ) ( not ( = ?auto_98320 ?auto_98321 ) ) ( ON ?auto_98321 ?auto_98323 ) ( not ( = ?auto_98316 ?auto_98323 ) ) ( not ( = ?auto_98317 ?auto_98323 ) ) ( not ( = ?auto_98318 ?auto_98323 ) ) ( not ( = ?auto_98319 ?auto_98323 ) ) ( not ( = ?auto_98320 ?auto_98323 ) ) ( not ( = ?auto_98321 ?auto_98323 ) ) ( ON-TABLE ?auto_98323 ) ( ON ?auto_98316 ?auto_98322 ) ( not ( = ?auto_98316 ?auto_98322 ) ) ( not ( = ?auto_98317 ?auto_98322 ) ) ( not ( = ?auto_98318 ?auto_98322 ) ) ( not ( = ?auto_98319 ?auto_98322 ) ) ( not ( = ?auto_98320 ?auto_98322 ) ) ( not ( = ?auto_98321 ?auto_98322 ) ) ( not ( = ?auto_98323 ?auto_98322 ) ) ( ON ?auto_98317 ?auto_98316 ) ( ON-TABLE ?auto_98322 ) ( ON ?auto_98318 ?auto_98317 ) ( ON ?auto_98319 ?auto_98318 ) ( CLEAR ?auto_98321 ) ( ON ?auto_98320 ?auto_98319 ) ( CLEAR ?auto_98320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98322 ?auto_98316 ?auto_98317 ?auto_98318 ?auto_98319 )
      ( MAKE-6PILE ?auto_98316 ?auto_98317 ?auto_98318 ?auto_98319 ?auto_98320 ?auto_98321 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98324 - BLOCK
      ?auto_98325 - BLOCK
      ?auto_98326 - BLOCK
      ?auto_98327 - BLOCK
      ?auto_98328 - BLOCK
      ?auto_98329 - BLOCK
    )
    :vars
    (
      ?auto_98331 - BLOCK
      ?auto_98330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98324 ?auto_98325 ) ) ( not ( = ?auto_98324 ?auto_98326 ) ) ( not ( = ?auto_98324 ?auto_98327 ) ) ( not ( = ?auto_98324 ?auto_98328 ) ) ( not ( = ?auto_98324 ?auto_98329 ) ) ( not ( = ?auto_98325 ?auto_98326 ) ) ( not ( = ?auto_98325 ?auto_98327 ) ) ( not ( = ?auto_98325 ?auto_98328 ) ) ( not ( = ?auto_98325 ?auto_98329 ) ) ( not ( = ?auto_98326 ?auto_98327 ) ) ( not ( = ?auto_98326 ?auto_98328 ) ) ( not ( = ?auto_98326 ?auto_98329 ) ) ( not ( = ?auto_98327 ?auto_98328 ) ) ( not ( = ?auto_98327 ?auto_98329 ) ) ( not ( = ?auto_98328 ?auto_98329 ) ) ( not ( = ?auto_98324 ?auto_98331 ) ) ( not ( = ?auto_98325 ?auto_98331 ) ) ( not ( = ?auto_98326 ?auto_98331 ) ) ( not ( = ?auto_98327 ?auto_98331 ) ) ( not ( = ?auto_98328 ?auto_98331 ) ) ( not ( = ?auto_98329 ?auto_98331 ) ) ( ON-TABLE ?auto_98331 ) ( ON ?auto_98324 ?auto_98330 ) ( not ( = ?auto_98324 ?auto_98330 ) ) ( not ( = ?auto_98325 ?auto_98330 ) ) ( not ( = ?auto_98326 ?auto_98330 ) ) ( not ( = ?auto_98327 ?auto_98330 ) ) ( not ( = ?auto_98328 ?auto_98330 ) ) ( not ( = ?auto_98329 ?auto_98330 ) ) ( not ( = ?auto_98331 ?auto_98330 ) ) ( ON ?auto_98325 ?auto_98324 ) ( ON-TABLE ?auto_98330 ) ( ON ?auto_98326 ?auto_98325 ) ( ON ?auto_98327 ?auto_98326 ) ( ON ?auto_98328 ?auto_98327 ) ( CLEAR ?auto_98328 ) ( HOLDING ?auto_98329 ) ( CLEAR ?auto_98331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98331 ?auto_98329 )
      ( MAKE-6PILE ?auto_98324 ?auto_98325 ?auto_98326 ?auto_98327 ?auto_98328 ?auto_98329 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98332 - BLOCK
      ?auto_98333 - BLOCK
      ?auto_98334 - BLOCK
      ?auto_98335 - BLOCK
      ?auto_98336 - BLOCK
      ?auto_98337 - BLOCK
    )
    :vars
    (
      ?auto_98339 - BLOCK
      ?auto_98338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98332 ?auto_98333 ) ) ( not ( = ?auto_98332 ?auto_98334 ) ) ( not ( = ?auto_98332 ?auto_98335 ) ) ( not ( = ?auto_98332 ?auto_98336 ) ) ( not ( = ?auto_98332 ?auto_98337 ) ) ( not ( = ?auto_98333 ?auto_98334 ) ) ( not ( = ?auto_98333 ?auto_98335 ) ) ( not ( = ?auto_98333 ?auto_98336 ) ) ( not ( = ?auto_98333 ?auto_98337 ) ) ( not ( = ?auto_98334 ?auto_98335 ) ) ( not ( = ?auto_98334 ?auto_98336 ) ) ( not ( = ?auto_98334 ?auto_98337 ) ) ( not ( = ?auto_98335 ?auto_98336 ) ) ( not ( = ?auto_98335 ?auto_98337 ) ) ( not ( = ?auto_98336 ?auto_98337 ) ) ( not ( = ?auto_98332 ?auto_98339 ) ) ( not ( = ?auto_98333 ?auto_98339 ) ) ( not ( = ?auto_98334 ?auto_98339 ) ) ( not ( = ?auto_98335 ?auto_98339 ) ) ( not ( = ?auto_98336 ?auto_98339 ) ) ( not ( = ?auto_98337 ?auto_98339 ) ) ( ON-TABLE ?auto_98339 ) ( ON ?auto_98332 ?auto_98338 ) ( not ( = ?auto_98332 ?auto_98338 ) ) ( not ( = ?auto_98333 ?auto_98338 ) ) ( not ( = ?auto_98334 ?auto_98338 ) ) ( not ( = ?auto_98335 ?auto_98338 ) ) ( not ( = ?auto_98336 ?auto_98338 ) ) ( not ( = ?auto_98337 ?auto_98338 ) ) ( not ( = ?auto_98339 ?auto_98338 ) ) ( ON ?auto_98333 ?auto_98332 ) ( ON-TABLE ?auto_98338 ) ( ON ?auto_98334 ?auto_98333 ) ( ON ?auto_98335 ?auto_98334 ) ( ON ?auto_98336 ?auto_98335 ) ( CLEAR ?auto_98339 ) ( ON ?auto_98337 ?auto_98336 ) ( CLEAR ?auto_98337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98338 ?auto_98332 ?auto_98333 ?auto_98334 ?auto_98335 ?auto_98336 )
      ( MAKE-6PILE ?auto_98332 ?auto_98333 ?auto_98334 ?auto_98335 ?auto_98336 ?auto_98337 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98340 - BLOCK
      ?auto_98341 - BLOCK
      ?auto_98342 - BLOCK
      ?auto_98343 - BLOCK
      ?auto_98344 - BLOCK
      ?auto_98345 - BLOCK
    )
    :vars
    (
      ?auto_98347 - BLOCK
      ?auto_98346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98340 ?auto_98341 ) ) ( not ( = ?auto_98340 ?auto_98342 ) ) ( not ( = ?auto_98340 ?auto_98343 ) ) ( not ( = ?auto_98340 ?auto_98344 ) ) ( not ( = ?auto_98340 ?auto_98345 ) ) ( not ( = ?auto_98341 ?auto_98342 ) ) ( not ( = ?auto_98341 ?auto_98343 ) ) ( not ( = ?auto_98341 ?auto_98344 ) ) ( not ( = ?auto_98341 ?auto_98345 ) ) ( not ( = ?auto_98342 ?auto_98343 ) ) ( not ( = ?auto_98342 ?auto_98344 ) ) ( not ( = ?auto_98342 ?auto_98345 ) ) ( not ( = ?auto_98343 ?auto_98344 ) ) ( not ( = ?auto_98343 ?auto_98345 ) ) ( not ( = ?auto_98344 ?auto_98345 ) ) ( not ( = ?auto_98340 ?auto_98347 ) ) ( not ( = ?auto_98341 ?auto_98347 ) ) ( not ( = ?auto_98342 ?auto_98347 ) ) ( not ( = ?auto_98343 ?auto_98347 ) ) ( not ( = ?auto_98344 ?auto_98347 ) ) ( not ( = ?auto_98345 ?auto_98347 ) ) ( ON ?auto_98340 ?auto_98346 ) ( not ( = ?auto_98340 ?auto_98346 ) ) ( not ( = ?auto_98341 ?auto_98346 ) ) ( not ( = ?auto_98342 ?auto_98346 ) ) ( not ( = ?auto_98343 ?auto_98346 ) ) ( not ( = ?auto_98344 ?auto_98346 ) ) ( not ( = ?auto_98345 ?auto_98346 ) ) ( not ( = ?auto_98347 ?auto_98346 ) ) ( ON ?auto_98341 ?auto_98340 ) ( ON-TABLE ?auto_98346 ) ( ON ?auto_98342 ?auto_98341 ) ( ON ?auto_98343 ?auto_98342 ) ( ON ?auto_98344 ?auto_98343 ) ( ON ?auto_98345 ?auto_98344 ) ( CLEAR ?auto_98345 ) ( HOLDING ?auto_98347 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98347 )
      ( MAKE-6PILE ?auto_98340 ?auto_98341 ?auto_98342 ?auto_98343 ?auto_98344 ?auto_98345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98348 - BLOCK
      ?auto_98349 - BLOCK
      ?auto_98350 - BLOCK
      ?auto_98351 - BLOCK
      ?auto_98352 - BLOCK
      ?auto_98353 - BLOCK
    )
    :vars
    (
      ?auto_98355 - BLOCK
      ?auto_98354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98348 ?auto_98349 ) ) ( not ( = ?auto_98348 ?auto_98350 ) ) ( not ( = ?auto_98348 ?auto_98351 ) ) ( not ( = ?auto_98348 ?auto_98352 ) ) ( not ( = ?auto_98348 ?auto_98353 ) ) ( not ( = ?auto_98349 ?auto_98350 ) ) ( not ( = ?auto_98349 ?auto_98351 ) ) ( not ( = ?auto_98349 ?auto_98352 ) ) ( not ( = ?auto_98349 ?auto_98353 ) ) ( not ( = ?auto_98350 ?auto_98351 ) ) ( not ( = ?auto_98350 ?auto_98352 ) ) ( not ( = ?auto_98350 ?auto_98353 ) ) ( not ( = ?auto_98351 ?auto_98352 ) ) ( not ( = ?auto_98351 ?auto_98353 ) ) ( not ( = ?auto_98352 ?auto_98353 ) ) ( not ( = ?auto_98348 ?auto_98355 ) ) ( not ( = ?auto_98349 ?auto_98355 ) ) ( not ( = ?auto_98350 ?auto_98355 ) ) ( not ( = ?auto_98351 ?auto_98355 ) ) ( not ( = ?auto_98352 ?auto_98355 ) ) ( not ( = ?auto_98353 ?auto_98355 ) ) ( ON ?auto_98348 ?auto_98354 ) ( not ( = ?auto_98348 ?auto_98354 ) ) ( not ( = ?auto_98349 ?auto_98354 ) ) ( not ( = ?auto_98350 ?auto_98354 ) ) ( not ( = ?auto_98351 ?auto_98354 ) ) ( not ( = ?auto_98352 ?auto_98354 ) ) ( not ( = ?auto_98353 ?auto_98354 ) ) ( not ( = ?auto_98355 ?auto_98354 ) ) ( ON ?auto_98349 ?auto_98348 ) ( ON-TABLE ?auto_98354 ) ( ON ?auto_98350 ?auto_98349 ) ( ON ?auto_98351 ?auto_98350 ) ( ON ?auto_98352 ?auto_98351 ) ( ON ?auto_98353 ?auto_98352 ) ( ON ?auto_98355 ?auto_98353 ) ( CLEAR ?auto_98355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98354 ?auto_98348 ?auto_98349 ?auto_98350 ?auto_98351 ?auto_98352 ?auto_98353 )
      ( MAKE-6PILE ?auto_98348 ?auto_98349 ?auto_98350 ?auto_98351 ?auto_98352 ?auto_98353 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98363 - BLOCK
      ?auto_98364 - BLOCK
      ?auto_98365 - BLOCK
      ?auto_98366 - BLOCK
      ?auto_98367 - BLOCK
      ?auto_98368 - BLOCK
      ?auto_98369 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_98369 ) ( CLEAR ?auto_98368 ) ( ON-TABLE ?auto_98363 ) ( ON ?auto_98364 ?auto_98363 ) ( ON ?auto_98365 ?auto_98364 ) ( ON ?auto_98366 ?auto_98365 ) ( ON ?auto_98367 ?auto_98366 ) ( ON ?auto_98368 ?auto_98367 ) ( not ( = ?auto_98363 ?auto_98364 ) ) ( not ( = ?auto_98363 ?auto_98365 ) ) ( not ( = ?auto_98363 ?auto_98366 ) ) ( not ( = ?auto_98363 ?auto_98367 ) ) ( not ( = ?auto_98363 ?auto_98368 ) ) ( not ( = ?auto_98363 ?auto_98369 ) ) ( not ( = ?auto_98364 ?auto_98365 ) ) ( not ( = ?auto_98364 ?auto_98366 ) ) ( not ( = ?auto_98364 ?auto_98367 ) ) ( not ( = ?auto_98364 ?auto_98368 ) ) ( not ( = ?auto_98364 ?auto_98369 ) ) ( not ( = ?auto_98365 ?auto_98366 ) ) ( not ( = ?auto_98365 ?auto_98367 ) ) ( not ( = ?auto_98365 ?auto_98368 ) ) ( not ( = ?auto_98365 ?auto_98369 ) ) ( not ( = ?auto_98366 ?auto_98367 ) ) ( not ( = ?auto_98366 ?auto_98368 ) ) ( not ( = ?auto_98366 ?auto_98369 ) ) ( not ( = ?auto_98367 ?auto_98368 ) ) ( not ( = ?auto_98367 ?auto_98369 ) ) ( not ( = ?auto_98368 ?auto_98369 ) ) )
    :subtasks
    ( ( !STACK ?auto_98369 ?auto_98368 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98370 - BLOCK
      ?auto_98371 - BLOCK
      ?auto_98372 - BLOCK
      ?auto_98373 - BLOCK
      ?auto_98374 - BLOCK
      ?auto_98375 - BLOCK
      ?auto_98376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_98375 ) ( ON-TABLE ?auto_98370 ) ( ON ?auto_98371 ?auto_98370 ) ( ON ?auto_98372 ?auto_98371 ) ( ON ?auto_98373 ?auto_98372 ) ( ON ?auto_98374 ?auto_98373 ) ( ON ?auto_98375 ?auto_98374 ) ( not ( = ?auto_98370 ?auto_98371 ) ) ( not ( = ?auto_98370 ?auto_98372 ) ) ( not ( = ?auto_98370 ?auto_98373 ) ) ( not ( = ?auto_98370 ?auto_98374 ) ) ( not ( = ?auto_98370 ?auto_98375 ) ) ( not ( = ?auto_98370 ?auto_98376 ) ) ( not ( = ?auto_98371 ?auto_98372 ) ) ( not ( = ?auto_98371 ?auto_98373 ) ) ( not ( = ?auto_98371 ?auto_98374 ) ) ( not ( = ?auto_98371 ?auto_98375 ) ) ( not ( = ?auto_98371 ?auto_98376 ) ) ( not ( = ?auto_98372 ?auto_98373 ) ) ( not ( = ?auto_98372 ?auto_98374 ) ) ( not ( = ?auto_98372 ?auto_98375 ) ) ( not ( = ?auto_98372 ?auto_98376 ) ) ( not ( = ?auto_98373 ?auto_98374 ) ) ( not ( = ?auto_98373 ?auto_98375 ) ) ( not ( = ?auto_98373 ?auto_98376 ) ) ( not ( = ?auto_98374 ?auto_98375 ) ) ( not ( = ?auto_98374 ?auto_98376 ) ) ( not ( = ?auto_98375 ?auto_98376 ) ) ( ON-TABLE ?auto_98376 ) ( CLEAR ?auto_98376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_98376 )
      ( MAKE-7PILE ?auto_98370 ?auto_98371 ?auto_98372 ?auto_98373 ?auto_98374 ?auto_98375 ?auto_98376 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98377 - BLOCK
      ?auto_98378 - BLOCK
      ?auto_98379 - BLOCK
      ?auto_98380 - BLOCK
      ?auto_98381 - BLOCK
      ?auto_98382 - BLOCK
      ?auto_98383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98377 ) ( ON ?auto_98378 ?auto_98377 ) ( ON ?auto_98379 ?auto_98378 ) ( ON ?auto_98380 ?auto_98379 ) ( ON ?auto_98381 ?auto_98380 ) ( not ( = ?auto_98377 ?auto_98378 ) ) ( not ( = ?auto_98377 ?auto_98379 ) ) ( not ( = ?auto_98377 ?auto_98380 ) ) ( not ( = ?auto_98377 ?auto_98381 ) ) ( not ( = ?auto_98377 ?auto_98382 ) ) ( not ( = ?auto_98377 ?auto_98383 ) ) ( not ( = ?auto_98378 ?auto_98379 ) ) ( not ( = ?auto_98378 ?auto_98380 ) ) ( not ( = ?auto_98378 ?auto_98381 ) ) ( not ( = ?auto_98378 ?auto_98382 ) ) ( not ( = ?auto_98378 ?auto_98383 ) ) ( not ( = ?auto_98379 ?auto_98380 ) ) ( not ( = ?auto_98379 ?auto_98381 ) ) ( not ( = ?auto_98379 ?auto_98382 ) ) ( not ( = ?auto_98379 ?auto_98383 ) ) ( not ( = ?auto_98380 ?auto_98381 ) ) ( not ( = ?auto_98380 ?auto_98382 ) ) ( not ( = ?auto_98380 ?auto_98383 ) ) ( not ( = ?auto_98381 ?auto_98382 ) ) ( not ( = ?auto_98381 ?auto_98383 ) ) ( not ( = ?auto_98382 ?auto_98383 ) ) ( ON-TABLE ?auto_98383 ) ( CLEAR ?auto_98383 ) ( HOLDING ?auto_98382 ) ( CLEAR ?auto_98381 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98377 ?auto_98378 ?auto_98379 ?auto_98380 ?auto_98381 ?auto_98382 )
      ( MAKE-7PILE ?auto_98377 ?auto_98378 ?auto_98379 ?auto_98380 ?auto_98381 ?auto_98382 ?auto_98383 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98384 - BLOCK
      ?auto_98385 - BLOCK
      ?auto_98386 - BLOCK
      ?auto_98387 - BLOCK
      ?auto_98388 - BLOCK
      ?auto_98389 - BLOCK
      ?auto_98390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98384 ) ( ON ?auto_98385 ?auto_98384 ) ( ON ?auto_98386 ?auto_98385 ) ( ON ?auto_98387 ?auto_98386 ) ( ON ?auto_98388 ?auto_98387 ) ( not ( = ?auto_98384 ?auto_98385 ) ) ( not ( = ?auto_98384 ?auto_98386 ) ) ( not ( = ?auto_98384 ?auto_98387 ) ) ( not ( = ?auto_98384 ?auto_98388 ) ) ( not ( = ?auto_98384 ?auto_98389 ) ) ( not ( = ?auto_98384 ?auto_98390 ) ) ( not ( = ?auto_98385 ?auto_98386 ) ) ( not ( = ?auto_98385 ?auto_98387 ) ) ( not ( = ?auto_98385 ?auto_98388 ) ) ( not ( = ?auto_98385 ?auto_98389 ) ) ( not ( = ?auto_98385 ?auto_98390 ) ) ( not ( = ?auto_98386 ?auto_98387 ) ) ( not ( = ?auto_98386 ?auto_98388 ) ) ( not ( = ?auto_98386 ?auto_98389 ) ) ( not ( = ?auto_98386 ?auto_98390 ) ) ( not ( = ?auto_98387 ?auto_98388 ) ) ( not ( = ?auto_98387 ?auto_98389 ) ) ( not ( = ?auto_98387 ?auto_98390 ) ) ( not ( = ?auto_98388 ?auto_98389 ) ) ( not ( = ?auto_98388 ?auto_98390 ) ) ( not ( = ?auto_98389 ?auto_98390 ) ) ( ON-TABLE ?auto_98390 ) ( CLEAR ?auto_98388 ) ( ON ?auto_98389 ?auto_98390 ) ( CLEAR ?auto_98389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98390 )
      ( MAKE-7PILE ?auto_98384 ?auto_98385 ?auto_98386 ?auto_98387 ?auto_98388 ?auto_98389 ?auto_98390 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98391 - BLOCK
      ?auto_98392 - BLOCK
      ?auto_98393 - BLOCK
      ?auto_98394 - BLOCK
      ?auto_98395 - BLOCK
      ?auto_98396 - BLOCK
      ?auto_98397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98391 ) ( ON ?auto_98392 ?auto_98391 ) ( ON ?auto_98393 ?auto_98392 ) ( ON ?auto_98394 ?auto_98393 ) ( not ( = ?auto_98391 ?auto_98392 ) ) ( not ( = ?auto_98391 ?auto_98393 ) ) ( not ( = ?auto_98391 ?auto_98394 ) ) ( not ( = ?auto_98391 ?auto_98395 ) ) ( not ( = ?auto_98391 ?auto_98396 ) ) ( not ( = ?auto_98391 ?auto_98397 ) ) ( not ( = ?auto_98392 ?auto_98393 ) ) ( not ( = ?auto_98392 ?auto_98394 ) ) ( not ( = ?auto_98392 ?auto_98395 ) ) ( not ( = ?auto_98392 ?auto_98396 ) ) ( not ( = ?auto_98392 ?auto_98397 ) ) ( not ( = ?auto_98393 ?auto_98394 ) ) ( not ( = ?auto_98393 ?auto_98395 ) ) ( not ( = ?auto_98393 ?auto_98396 ) ) ( not ( = ?auto_98393 ?auto_98397 ) ) ( not ( = ?auto_98394 ?auto_98395 ) ) ( not ( = ?auto_98394 ?auto_98396 ) ) ( not ( = ?auto_98394 ?auto_98397 ) ) ( not ( = ?auto_98395 ?auto_98396 ) ) ( not ( = ?auto_98395 ?auto_98397 ) ) ( not ( = ?auto_98396 ?auto_98397 ) ) ( ON-TABLE ?auto_98397 ) ( ON ?auto_98396 ?auto_98397 ) ( CLEAR ?auto_98396 ) ( HOLDING ?auto_98395 ) ( CLEAR ?auto_98394 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98391 ?auto_98392 ?auto_98393 ?auto_98394 ?auto_98395 )
      ( MAKE-7PILE ?auto_98391 ?auto_98392 ?auto_98393 ?auto_98394 ?auto_98395 ?auto_98396 ?auto_98397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98398 - BLOCK
      ?auto_98399 - BLOCK
      ?auto_98400 - BLOCK
      ?auto_98401 - BLOCK
      ?auto_98402 - BLOCK
      ?auto_98403 - BLOCK
      ?auto_98404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98398 ) ( ON ?auto_98399 ?auto_98398 ) ( ON ?auto_98400 ?auto_98399 ) ( ON ?auto_98401 ?auto_98400 ) ( not ( = ?auto_98398 ?auto_98399 ) ) ( not ( = ?auto_98398 ?auto_98400 ) ) ( not ( = ?auto_98398 ?auto_98401 ) ) ( not ( = ?auto_98398 ?auto_98402 ) ) ( not ( = ?auto_98398 ?auto_98403 ) ) ( not ( = ?auto_98398 ?auto_98404 ) ) ( not ( = ?auto_98399 ?auto_98400 ) ) ( not ( = ?auto_98399 ?auto_98401 ) ) ( not ( = ?auto_98399 ?auto_98402 ) ) ( not ( = ?auto_98399 ?auto_98403 ) ) ( not ( = ?auto_98399 ?auto_98404 ) ) ( not ( = ?auto_98400 ?auto_98401 ) ) ( not ( = ?auto_98400 ?auto_98402 ) ) ( not ( = ?auto_98400 ?auto_98403 ) ) ( not ( = ?auto_98400 ?auto_98404 ) ) ( not ( = ?auto_98401 ?auto_98402 ) ) ( not ( = ?auto_98401 ?auto_98403 ) ) ( not ( = ?auto_98401 ?auto_98404 ) ) ( not ( = ?auto_98402 ?auto_98403 ) ) ( not ( = ?auto_98402 ?auto_98404 ) ) ( not ( = ?auto_98403 ?auto_98404 ) ) ( ON-TABLE ?auto_98404 ) ( ON ?auto_98403 ?auto_98404 ) ( CLEAR ?auto_98401 ) ( ON ?auto_98402 ?auto_98403 ) ( CLEAR ?auto_98402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98404 ?auto_98403 )
      ( MAKE-7PILE ?auto_98398 ?auto_98399 ?auto_98400 ?auto_98401 ?auto_98402 ?auto_98403 ?auto_98404 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98405 - BLOCK
      ?auto_98406 - BLOCK
      ?auto_98407 - BLOCK
      ?auto_98408 - BLOCK
      ?auto_98409 - BLOCK
      ?auto_98410 - BLOCK
      ?auto_98411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98405 ) ( ON ?auto_98406 ?auto_98405 ) ( ON ?auto_98407 ?auto_98406 ) ( not ( = ?auto_98405 ?auto_98406 ) ) ( not ( = ?auto_98405 ?auto_98407 ) ) ( not ( = ?auto_98405 ?auto_98408 ) ) ( not ( = ?auto_98405 ?auto_98409 ) ) ( not ( = ?auto_98405 ?auto_98410 ) ) ( not ( = ?auto_98405 ?auto_98411 ) ) ( not ( = ?auto_98406 ?auto_98407 ) ) ( not ( = ?auto_98406 ?auto_98408 ) ) ( not ( = ?auto_98406 ?auto_98409 ) ) ( not ( = ?auto_98406 ?auto_98410 ) ) ( not ( = ?auto_98406 ?auto_98411 ) ) ( not ( = ?auto_98407 ?auto_98408 ) ) ( not ( = ?auto_98407 ?auto_98409 ) ) ( not ( = ?auto_98407 ?auto_98410 ) ) ( not ( = ?auto_98407 ?auto_98411 ) ) ( not ( = ?auto_98408 ?auto_98409 ) ) ( not ( = ?auto_98408 ?auto_98410 ) ) ( not ( = ?auto_98408 ?auto_98411 ) ) ( not ( = ?auto_98409 ?auto_98410 ) ) ( not ( = ?auto_98409 ?auto_98411 ) ) ( not ( = ?auto_98410 ?auto_98411 ) ) ( ON-TABLE ?auto_98411 ) ( ON ?auto_98410 ?auto_98411 ) ( ON ?auto_98409 ?auto_98410 ) ( CLEAR ?auto_98409 ) ( HOLDING ?auto_98408 ) ( CLEAR ?auto_98407 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98405 ?auto_98406 ?auto_98407 ?auto_98408 )
      ( MAKE-7PILE ?auto_98405 ?auto_98406 ?auto_98407 ?auto_98408 ?auto_98409 ?auto_98410 ?auto_98411 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98412 - BLOCK
      ?auto_98413 - BLOCK
      ?auto_98414 - BLOCK
      ?auto_98415 - BLOCK
      ?auto_98416 - BLOCK
      ?auto_98417 - BLOCK
      ?auto_98418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98412 ) ( ON ?auto_98413 ?auto_98412 ) ( ON ?auto_98414 ?auto_98413 ) ( not ( = ?auto_98412 ?auto_98413 ) ) ( not ( = ?auto_98412 ?auto_98414 ) ) ( not ( = ?auto_98412 ?auto_98415 ) ) ( not ( = ?auto_98412 ?auto_98416 ) ) ( not ( = ?auto_98412 ?auto_98417 ) ) ( not ( = ?auto_98412 ?auto_98418 ) ) ( not ( = ?auto_98413 ?auto_98414 ) ) ( not ( = ?auto_98413 ?auto_98415 ) ) ( not ( = ?auto_98413 ?auto_98416 ) ) ( not ( = ?auto_98413 ?auto_98417 ) ) ( not ( = ?auto_98413 ?auto_98418 ) ) ( not ( = ?auto_98414 ?auto_98415 ) ) ( not ( = ?auto_98414 ?auto_98416 ) ) ( not ( = ?auto_98414 ?auto_98417 ) ) ( not ( = ?auto_98414 ?auto_98418 ) ) ( not ( = ?auto_98415 ?auto_98416 ) ) ( not ( = ?auto_98415 ?auto_98417 ) ) ( not ( = ?auto_98415 ?auto_98418 ) ) ( not ( = ?auto_98416 ?auto_98417 ) ) ( not ( = ?auto_98416 ?auto_98418 ) ) ( not ( = ?auto_98417 ?auto_98418 ) ) ( ON-TABLE ?auto_98418 ) ( ON ?auto_98417 ?auto_98418 ) ( ON ?auto_98416 ?auto_98417 ) ( CLEAR ?auto_98414 ) ( ON ?auto_98415 ?auto_98416 ) ( CLEAR ?auto_98415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98418 ?auto_98417 ?auto_98416 )
      ( MAKE-7PILE ?auto_98412 ?auto_98413 ?auto_98414 ?auto_98415 ?auto_98416 ?auto_98417 ?auto_98418 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98419 - BLOCK
      ?auto_98420 - BLOCK
      ?auto_98421 - BLOCK
      ?auto_98422 - BLOCK
      ?auto_98423 - BLOCK
      ?auto_98424 - BLOCK
      ?auto_98425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98419 ) ( ON ?auto_98420 ?auto_98419 ) ( not ( = ?auto_98419 ?auto_98420 ) ) ( not ( = ?auto_98419 ?auto_98421 ) ) ( not ( = ?auto_98419 ?auto_98422 ) ) ( not ( = ?auto_98419 ?auto_98423 ) ) ( not ( = ?auto_98419 ?auto_98424 ) ) ( not ( = ?auto_98419 ?auto_98425 ) ) ( not ( = ?auto_98420 ?auto_98421 ) ) ( not ( = ?auto_98420 ?auto_98422 ) ) ( not ( = ?auto_98420 ?auto_98423 ) ) ( not ( = ?auto_98420 ?auto_98424 ) ) ( not ( = ?auto_98420 ?auto_98425 ) ) ( not ( = ?auto_98421 ?auto_98422 ) ) ( not ( = ?auto_98421 ?auto_98423 ) ) ( not ( = ?auto_98421 ?auto_98424 ) ) ( not ( = ?auto_98421 ?auto_98425 ) ) ( not ( = ?auto_98422 ?auto_98423 ) ) ( not ( = ?auto_98422 ?auto_98424 ) ) ( not ( = ?auto_98422 ?auto_98425 ) ) ( not ( = ?auto_98423 ?auto_98424 ) ) ( not ( = ?auto_98423 ?auto_98425 ) ) ( not ( = ?auto_98424 ?auto_98425 ) ) ( ON-TABLE ?auto_98425 ) ( ON ?auto_98424 ?auto_98425 ) ( ON ?auto_98423 ?auto_98424 ) ( ON ?auto_98422 ?auto_98423 ) ( CLEAR ?auto_98422 ) ( HOLDING ?auto_98421 ) ( CLEAR ?auto_98420 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98419 ?auto_98420 ?auto_98421 )
      ( MAKE-7PILE ?auto_98419 ?auto_98420 ?auto_98421 ?auto_98422 ?auto_98423 ?auto_98424 ?auto_98425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98426 - BLOCK
      ?auto_98427 - BLOCK
      ?auto_98428 - BLOCK
      ?auto_98429 - BLOCK
      ?auto_98430 - BLOCK
      ?auto_98431 - BLOCK
      ?auto_98432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98426 ) ( ON ?auto_98427 ?auto_98426 ) ( not ( = ?auto_98426 ?auto_98427 ) ) ( not ( = ?auto_98426 ?auto_98428 ) ) ( not ( = ?auto_98426 ?auto_98429 ) ) ( not ( = ?auto_98426 ?auto_98430 ) ) ( not ( = ?auto_98426 ?auto_98431 ) ) ( not ( = ?auto_98426 ?auto_98432 ) ) ( not ( = ?auto_98427 ?auto_98428 ) ) ( not ( = ?auto_98427 ?auto_98429 ) ) ( not ( = ?auto_98427 ?auto_98430 ) ) ( not ( = ?auto_98427 ?auto_98431 ) ) ( not ( = ?auto_98427 ?auto_98432 ) ) ( not ( = ?auto_98428 ?auto_98429 ) ) ( not ( = ?auto_98428 ?auto_98430 ) ) ( not ( = ?auto_98428 ?auto_98431 ) ) ( not ( = ?auto_98428 ?auto_98432 ) ) ( not ( = ?auto_98429 ?auto_98430 ) ) ( not ( = ?auto_98429 ?auto_98431 ) ) ( not ( = ?auto_98429 ?auto_98432 ) ) ( not ( = ?auto_98430 ?auto_98431 ) ) ( not ( = ?auto_98430 ?auto_98432 ) ) ( not ( = ?auto_98431 ?auto_98432 ) ) ( ON-TABLE ?auto_98432 ) ( ON ?auto_98431 ?auto_98432 ) ( ON ?auto_98430 ?auto_98431 ) ( ON ?auto_98429 ?auto_98430 ) ( CLEAR ?auto_98427 ) ( ON ?auto_98428 ?auto_98429 ) ( CLEAR ?auto_98428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98432 ?auto_98431 ?auto_98430 ?auto_98429 )
      ( MAKE-7PILE ?auto_98426 ?auto_98427 ?auto_98428 ?auto_98429 ?auto_98430 ?auto_98431 ?auto_98432 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98433 - BLOCK
      ?auto_98434 - BLOCK
      ?auto_98435 - BLOCK
      ?auto_98436 - BLOCK
      ?auto_98437 - BLOCK
      ?auto_98438 - BLOCK
      ?auto_98439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98433 ) ( not ( = ?auto_98433 ?auto_98434 ) ) ( not ( = ?auto_98433 ?auto_98435 ) ) ( not ( = ?auto_98433 ?auto_98436 ) ) ( not ( = ?auto_98433 ?auto_98437 ) ) ( not ( = ?auto_98433 ?auto_98438 ) ) ( not ( = ?auto_98433 ?auto_98439 ) ) ( not ( = ?auto_98434 ?auto_98435 ) ) ( not ( = ?auto_98434 ?auto_98436 ) ) ( not ( = ?auto_98434 ?auto_98437 ) ) ( not ( = ?auto_98434 ?auto_98438 ) ) ( not ( = ?auto_98434 ?auto_98439 ) ) ( not ( = ?auto_98435 ?auto_98436 ) ) ( not ( = ?auto_98435 ?auto_98437 ) ) ( not ( = ?auto_98435 ?auto_98438 ) ) ( not ( = ?auto_98435 ?auto_98439 ) ) ( not ( = ?auto_98436 ?auto_98437 ) ) ( not ( = ?auto_98436 ?auto_98438 ) ) ( not ( = ?auto_98436 ?auto_98439 ) ) ( not ( = ?auto_98437 ?auto_98438 ) ) ( not ( = ?auto_98437 ?auto_98439 ) ) ( not ( = ?auto_98438 ?auto_98439 ) ) ( ON-TABLE ?auto_98439 ) ( ON ?auto_98438 ?auto_98439 ) ( ON ?auto_98437 ?auto_98438 ) ( ON ?auto_98436 ?auto_98437 ) ( ON ?auto_98435 ?auto_98436 ) ( CLEAR ?auto_98435 ) ( HOLDING ?auto_98434 ) ( CLEAR ?auto_98433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98433 ?auto_98434 )
      ( MAKE-7PILE ?auto_98433 ?auto_98434 ?auto_98435 ?auto_98436 ?auto_98437 ?auto_98438 ?auto_98439 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98440 - BLOCK
      ?auto_98441 - BLOCK
      ?auto_98442 - BLOCK
      ?auto_98443 - BLOCK
      ?auto_98444 - BLOCK
      ?auto_98445 - BLOCK
      ?auto_98446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98440 ) ( not ( = ?auto_98440 ?auto_98441 ) ) ( not ( = ?auto_98440 ?auto_98442 ) ) ( not ( = ?auto_98440 ?auto_98443 ) ) ( not ( = ?auto_98440 ?auto_98444 ) ) ( not ( = ?auto_98440 ?auto_98445 ) ) ( not ( = ?auto_98440 ?auto_98446 ) ) ( not ( = ?auto_98441 ?auto_98442 ) ) ( not ( = ?auto_98441 ?auto_98443 ) ) ( not ( = ?auto_98441 ?auto_98444 ) ) ( not ( = ?auto_98441 ?auto_98445 ) ) ( not ( = ?auto_98441 ?auto_98446 ) ) ( not ( = ?auto_98442 ?auto_98443 ) ) ( not ( = ?auto_98442 ?auto_98444 ) ) ( not ( = ?auto_98442 ?auto_98445 ) ) ( not ( = ?auto_98442 ?auto_98446 ) ) ( not ( = ?auto_98443 ?auto_98444 ) ) ( not ( = ?auto_98443 ?auto_98445 ) ) ( not ( = ?auto_98443 ?auto_98446 ) ) ( not ( = ?auto_98444 ?auto_98445 ) ) ( not ( = ?auto_98444 ?auto_98446 ) ) ( not ( = ?auto_98445 ?auto_98446 ) ) ( ON-TABLE ?auto_98446 ) ( ON ?auto_98445 ?auto_98446 ) ( ON ?auto_98444 ?auto_98445 ) ( ON ?auto_98443 ?auto_98444 ) ( ON ?auto_98442 ?auto_98443 ) ( CLEAR ?auto_98440 ) ( ON ?auto_98441 ?auto_98442 ) ( CLEAR ?auto_98441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98446 ?auto_98445 ?auto_98444 ?auto_98443 ?auto_98442 )
      ( MAKE-7PILE ?auto_98440 ?auto_98441 ?auto_98442 ?auto_98443 ?auto_98444 ?auto_98445 ?auto_98446 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98447 - BLOCK
      ?auto_98448 - BLOCK
      ?auto_98449 - BLOCK
      ?auto_98450 - BLOCK
      ?auto_98451 - BLOCK
      ?auto_98452 - BLOCK
      ?auto_98453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98447 ?auto_98448 ) ) ( not ( = ?auto_98447 ?auto_98449 ) ) ( not ( = ?auto_98447 ?auto_98450 ) ) ( not ( = ?auto_98447 ?auto_98451 ) ) ( not ( = ?auto_98447 ?auto_98452 ) ) ( not ( = ?auto_98447 ?auto_98453 ) ) ( not ( = ?auto_98448 ?auto_98449 ) ) ( not ( = ?auto_98448 ?auto_98450 ) ) ( not ( = ?auto_98448 ?auto_98451 ) ) ( not ( = ?auto_98448 ?auto_98452 ) ) ( not ( = ?auto_98448 ?auto_98453 ) ) ( not ( = ?auto_98449 ?auto_98450 ) ) ( not ( = ?auto_98449 ?auto_98451 ) ) ( not ( = ?auto_98449 ?auto_98452 ) ) ( not ( = ?auto_98449 ?auto_98453 ) ) ( not ( = ?auto_98450 ?auto_98451 ) ) ( not ( = ?auto_98450 ?auto_98452 ) ) ( not ( = ?auto_98450 ?auto_98453 ) ) ( not ( = ?auto_98451 ?auto_98452 ) ) ( not ( = ?auto_98451 ?auto_98453 ) ) ( not ( = ?auto_98452 ?auto_98453 ) ) ( ON-TABLE ?auto_98453 ) ( ON ?auto_98452 ?auto_98453 ) ( ON ?auto_98451 ?auto_98452 ) ( ON ?auto_98450 ?auto_98451 ) ( ON ?auto_98449 ?auto_98450 ) ( ON ?auto_98448 ?auto_98449 ) ( CLEAR ?auto_98448 ) ( HOLDING ?auto_98447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98447 )
      ( MAKE-7PILE ?auto_98447 ?auto_98448 ?auto_98449 ?auto_98450 ?auto_98451 ?auto_98452 ?auto_98453 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98454 - BLOCK
      ?auto_98455 - BLOCK
      ?auto_98456 - BLOCK
      ?auto_98457 - BLOCK
      ?auto_98458 - BLOCK
      ?auto_98459 - BLOCK
      ?auto_98460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98454 ?auto_98455 ) ) ( not ( = ?auto_98454 ?auto_98456 ) ) ( not ( = ?auto_98454 ?auto_98457 ) ) ( not ( = ?auto_98454 ?auto_98458 ) ) ( not ( = ?auto_98454 ?auto_98459 ) ) ( not ( = ?auto_98454 ?auto_98460 ) ) ( not ( = ?auto_98455 ?auto_98456 ) ) ( not ( = ?auto_98455 ?auto_98457 ) ) ( not ( = ?auto_98455 ?auto_98458 ) ) ( not ( = ?auto_98455 ?auto_98459 ) ) ( not ( = ?auto_98455 ?auto_98460 ) ) ( not ( = ?auto_98456 ?auto_98457 ) ) ( not ( = ?auto_98456 ?auto_98458 ) ) ( not ( = ?auto_98456 ?auto_98459 ) ) ( not ( = ?auto_98456 ?auto_98460 ) ) ( not ( = ?auto_98457 ?auto_98458 ) ) ( not ( = ?auto_98457 ?auto_98459 ) ) ( not ( = ?auto_98457 ?auto_98460 ) ) ( not ( = ?auto_98458 ?auto_98459 ) ) ( not ( = ?auto_98458 ?auto_98460 ) ) ( not ( = ?auto_98459 ?auto_98460 ) ) ( ON-TABLE ?auto_98460 ) ( ON ?auto_98459 ?auto_98460 ) ( ON ?auto_98458 ?auto_98459 ) ( ON ?auto_98457 ?auto_98458 ) ( ON ?auto_98456 ?auto_98457 ) ( ON ?auto_98455 ?auto_98456 ) ( ON ?auto_98454 ?auto_98455 ) ( CLEAR ?auto_98454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98460 ?auto_98459 ?auto_98458 ?auto_98457 ?auto_98456 ?auto_98455 )
      ( MAKE-7PILE ?auto_98454 ?auto_98455 ?auto_98456 ?auto_98457 ?auto_98458 ?auto_98459 ?auto_98460 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98461 - BLOCK
      ?auto_98462 - BLOCK
      ?auto_98463 - BLOCK
      ?auto_98464 - BLOCK
      ?auto_98465 - BLOCK
      ?auto_98466 - BLOCK
      ?auto_98467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98461 ?auto_98462 ) ) ( not ( = ?auto_98461 ?auto_98463 ) ) ( not ( = ?auto_98461 ?auto_98464 ) ) ( not ( = ?auto_98461 ?auto_98465 ) ) ( not ( = ?auto_98461 ?auto_98466 ) ) ( not ( = ?auto_98461 ?auto_98467 ) ) ( not ( = ?auto_98462 ?auto_98463 ) ) ( not ( = ?auto_98462 ?auto_98464 ) ) ( not ( = ?auto_98462 ?auto_98465 ) ) ( not ( = ?auto_98462 ?auto_98466 ) ) ( not ( = ?auto_98462 ?auto_98467 ) ) ( not ( = ?auto_98463 ?auto_98464 ) ) ( not ( = ?auto_98463 ?auto_98465 ) ) ( not ( = ?auto_98463 ?auto_98466 ) ) ( not ( = ?auto_98463 ?auto_98467 ) ) ( not ( = ?auto_98464 ?auto_98465 ) ) ( not ( = ?auto_98464 ?auto_98466 ) ) ( not ( = ?auto_98464 ?auto_98467 ) ) ( not ( = ?auto_98465 ?auto_98466 ) ) ( not ( = ?auto_98465 ?auto_98467 ) ) ( not ( = ?auto_98466 ?auto_98467 ) ) ( ON-TABLE ?auto_98467 ) ( ON ?auto_98466 ?auto_98467 ) ( ON ?auto_98465 ?auto_98466 ) ( ON ?auto_98464 ?auto_98465 ) ( ON ?auto_98463 ?auto_98464 ) ( ON ?auto_98462 ?auto_98463 ) ( HOLDING ?auto_98461 ) ( CLEAR ?auto_98462 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98467 ?auto_98466 ?auto_98465 ?auto_98464 ?auto_98463 ?auto_98462 ?auto_98461 )
      ( MAKE-7PILE ?auto_98461 ?auto_98462 ?auto_98463 ?auto_98464 ?auto_98465 ?auto_98466 ?auto_98467 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98468 - BLOCK
      ?auto_98469 - BLOCK
      ?auto_98470 - BLOCK
      ?auto_98471 - BLOCK
      ?auto_98472 - BLOCK
      ?auto_98473 - BLOCK
      ?auto_98474 - BLOCK
    )
    :vars
    (
      ?auto_98475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98468 ?auto_98469 ) ) ( not ( = ?auto_98468 ?auto_98470 ) ) ( not ( = ?auto_98468 ?auto_98471 ) ) ( not ( = ?auto_98468 ?auto_98472 ) ) ( not ( = ?auto_98468 ?auto_98473 ) ) ( not ( = ?auto_98468 ?auto_98474 ) ) ( not ( = ?auto_98469 ?auto_98470 ) ) ( not ( = ?auto_98469 ?auto_98471 ) ) ( not ( = ?auto_98469 ?auto_98472 ) ) ( not ( = ?auto_98469 ?auto_98473 ) ) ( not ( = ?auto_98469 ?auto_98474 ) ) ( not ( = ?auto_98470 ?auto_98471 ) ) ( not ( = ?auto_98470 ?auto_98472 ) ) ( not ( = ?auto_98470 ?auto_98473 ) ) ( not ( = ?auto_98470 ?auto_98474 ) ) ( not ( = ?auto_98471 ?auto_98472 ) ) ( not ( = ?auto_98471 ?auto_98473 ) ) ( not ( = ?auto_98471 ?auto_98474 ) ) ( not ( = ?auto_98472 ?auto_98473 ) ) ( not ( = ?auto_98472 ?auto_98474 ) ) ( not ( = ?auto_98473 ?auto_98474 ) ) ( ON-TABLE ?auto_98474 ) ( ON ?auto_98473 ?auto_98474 ) ( ON ?auto_98472 ?auto_98473 ) ( ON ?auto_98471 ?auto_98472 ) ( ON ?auto_98470 ?auto_98471 ) ( ON ?auto_98469 ?auto_98470 ) ( CLEAR ?auto_98469 ) ( ON ?auto_98468 ?auto_98475 ) ( CLEAR ?auto_98468 ) ( HAND-EMPTY ) ( not ( = ?auto_98468 ?auto_98475 ) ) ( not ( = ?auto_98469 ?auto_98475 ) ) ( not ( = ?auto_98470 ?auto_98475 ) ) ( not ( = ?auto_98471 ?auto_98475 ) ) ( not ( = ?auto_98472 ?auto_98475 ) ) ( not ( = ?auto_98473 ?auto_98475 ) ) ( not ( = ?auto_98474 ?auto_98475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98468 ?auto_98475 )
      ( MAKE-7PILE ?auto_98468 ?auto_98469 ?auto_98470 ?auto_98471 ?auto_98472 ?auto_98473 ?auto_98474 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98476 - BLOCK
      ?auto_98477 - BLOCK
      ?auto_98478 - BLOCK
      ?auto_98479 - BLOCK
      ?auto_98480 - BLOCK
      ?auto_98481 - BLOCK
      ?auto_98482 - BLOCK
    )
    :vars
    (
      ?auto_98483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98476 ?auto_98477 ) ) ( not ( = ?auto_98476 ?auto_98478 ) ) ( not ( = ?auto_98476 ?auto_98479 ) ) ( not ( = ?auto_98476 ?auto_98480 ) ) ( not ( = ?auto_98476 ?auto_98481 ) ) ( not ( = ?auto_98476 ?auto_98482 ) ) ( not ( = ?auto_98477 ?auto_98478 ) ) ( not ( = ?auto_98477 ?auto_98479 ) ) ( not ( = ?auto_98477 ?auto_98480 ) ) ( not ( = ?auto_98477 ?auto_98481 ) ) ( not ( = ?auto_98477 ?auto_98482 ) ) ( not ( = ?auto_98478 ?auto_98479 ) ) ( not ( = ?auto_98478 ?auto_98480 ) ) ( not ( = ?auto_98478 ?auto_98481 ) ) ( not ( = ?auto_98478 ?auto_98482 ) ) ( not ( = ?auto_98479 ?auto_98480 ) ) ( not ( = ?auto_98479 ?auto_98481 ) ) ( not ( = ?auto_98479 ?auto_98482 ) ) ( not ( = ?auto_98480 ?auto_98481 ) ) ( not ( = ?auto_98480 ?auto_98482 ) ) ( not ( = ?auto_98481 ?auto_98482 ) ) ( ON-TABLE ?auto_98482 ) ( ON ?auto_98481 ?auto_98482 ) ( ON ?auto_98480 ?auto_98481 ) ( ON ?auto_98479 ?auto_98480 ) ( ON ?auto_98478 ?auto_98479 ) ( ON ?auto_98476 ?auto_98483 ) ( CLEAR ?auto_98476 ) ( not ( = ?auto_98476 ?auto_98483 ) ) ( not ( = ?auto_98477 ?auto_98483 ) ) ( not ( = ?auto_98478 ?auto_98483 ) ) ( not ( = ?auto_98479 ?auto_98483 ) ) ( not ( = ?auto_98480 ?auto_98483 ) ) ( not ( = ?auto_98481 ?auto_98483 ) ) ( not ( = ?auto_98482 ?auto_98483 ) ) ( HOLDING ?auto_98477 ) ( CLEAR ?auto_98478 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98482 ?auto_98481 ?auto_98480 ?auto_98479 ?auto_98478 ?auto_98477 )
      ( MAKE-7PILE ?auto_98476 ?auto_98477 ?auto_98478 ?auto_98479 ?auto_98480 ?auto_98481 ?auto_98482 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98484 - BLOCK
      ?auto_98485 - BLOCK
      ?auto_98486 - BLOCK
      ?auto_98487 - BLOCK
      ?auto_98488 - BLOCK
      ?auto_98489 - BLOCK
      ?auto_98490 - BLOCK
    )
    :vars
    (
      ?auto_98491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98484 ?auto_98485 ) ) ( not ( = ?auto_98484 ?auto_98486 ) ) ( not ( = ?auto_98484 ?auto_98487 ) ) ( not ( = ?auto_98484 ?auto_98488 ) ) ( not ( = ?auto_98484 ?auto_98489 ) ) ( not ( = ?auto_98484 ?auto_98490 ) ) ( not ( = ?auto_98485 ?auto_98486 ) ) ( not ( = ?auto_98485 ?auto_98487 ) ) ( not ( = ?auto_98485 ?auto_98488 ) ) ( not ( = ?auto_98485 ?auto_98489 ) ) ( not ( = ?auto_98485 ?auto_98490 ) ) ( not ( = ?auto_98486 ?auto_98487 ) ) ( not ( = ?auto_98486 ?auto_98488 ) ) ( not ( = ?auto_98486 ?auto_98489 ) ) ( not ( = ?auto_98486 ?auto_98490 ) ) ( not ( = ?auto_98487 ?auto_98488 ) ) ( not ( = ?auto_98487 ?auto_98489 ) ) ( not ( = ?auto_98487 ?auto_98490 ) ) ( not ( = ?auto_98488 ?auto_98489 ) ) ( not ( = ?auto_98488 ?auto_98490 ) ) ( not ( = ?auto_98489 ?auto_98490 ) ) ( ON-TABLE ?auto_98490 ) ( ON ?auto_98489 ?auto_98490 ) ( ON ?auto_98488 ?auto_98489 ) ( ON ?auto_98487 ?auto_98488 ) ( ON ?auto_98486 ?auto_98487 ) ( ON ?auto_98484 ?auto_98491 ) ( not ( = ?auto_98484 ?auto_98491 ) ) ( not ( = ?auto_98485 ?auto_98491 ) ) ( not ( = ?auto_98486 ?auto_98491 ) ) ( not ( = ?auto_98487 ?auto_98491 ) ) ( not ( = ?auto_98488 ?auto_98491 ) ) ( not ( = ?auto_98489 ?auto_98491 ) ) ( not ( = ?auto_98490 ?auto_98491 ) ) ( CLEAR ?auto_98486 ) ( ON ?auto_98485 ?auto_98484 ) ( CLEAR ?auto_98485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98491 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98491 ?auto_98484 )
      ( MAKE-7PILE ?auto_98484 ?auto_98485 ?auto_98486 ?auto_98487 ?auto_98488 ?auto_98489 ?auto_98490 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98492 - BLOCK
      ?auto_98493 - BLOCK
      ?auto_98494 - BLOCK
      ?auto_98495 - BLOCK
      ?auto_98496 - BLOCK
      ?auto_98497 - BLOCK
      ?auto_98498 - BLOCK
    )
    :vars
    (
      ?auto_98499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98492 ?auto_98493 ) ) ( not ( = ?auto_98492 ?auto_98494 ) ) ( not ( = ?auto_98492 ?auto_98495 ) ) ( not ( = ?auto_98492 ?auto_98496 ) ) ( not ( = ?auto_98492 ?auto_98497 ) ) ( not ( = ?auto_98492 ?auto_98498 ) ) ( not ( = ?auto_98493 ?auto_98494 ) ) ( not ( = ?auto_98493 ?auto_98495 ) ) ( not ( = ?auto_98493 ?auto_98496 ) ) ( not ( = ?auto_98493 ?auto_98497 ) ) ( not ( = ?auto_98493 ?auto_98498 ) ) ( not ( = ?auto_98494 ?auto_98495 ) ) ( not ( = ?auto_98494 ?auto_98496 ) ) ( not ( = ?auto_98494 ?auto_98497 ) ) ( not ( = ?auto_98494 ?auto_98498 ) ) ( not ( = ?auto_98495 ?auto_98496 ) ) ( not ( = ?auto_98495 ?auto_98497 ) ) ( not ( = ?auto_98495 ?auto_98498 ) ) ( not ( = ?auto_98496 ?auto_98497 ) ) ( not ( = ?auto_98496 ?auto_98498 ) ) ( not ( = ?auto_98497 ?auto_98498 ) ) ( ON-TABLE ?auto_98498 ) ( ON ?auto_98497 ?auto_98498 ) ( ON ?auto_98496 ?auto_98497 ) ( ON ?auto_98495 ?auto_98496 ) ( ON ?auto_98492 ?auto_98499 ) ( not ( = ?auto_98492 ?auto_98499 ) ) ( not ( = ?auto_98493 ?auto_98499 ) ) ( not ( = ?auto_98494 ?auto_98499 ) ) ( not ( = ?auto_98495 ?auto_98499 ) ) ( not ( = ?auto_98496 ?auto_98499 ) ) ( not ( = ?auto_98497 ?auto_98499 ) ) ( not ( = ?auto_98498 ?auto_98499 ) ) ( ON ?auto_98493 ?auto_98492 ) ( CLEAR ?auto_98493 ) ( ON-TABLE ?auto_98499 ) ( HOLDING ?auto_98494 ) ( CLEAR ?auto_98495 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98498 ?auto_98497 ?auto_98496 ?auto_98495 ?auto_98494 )
      ( MAKE-7PILE ?auto_98492 ?auto_98493 ?auto_98494 ?auto_98495 ?auto_98496 ?auto_98497 ?auto_98498 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98500 - BLOCK
      ?auto_98501 - BLOCK
      ?auto_98502 - BLOCK
      ?auto_98503 - BLOCK
      ?auto_98504 - BLOCK
      ?auto_98505 - BLOCK
      ?auto_98506 - BLOCK
    )
    :vars
    (
      ?auto_98507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98500 ?auto_98501 ) ) ( not ( = ?auto_98500 ?auto_98502 ) ) ( not ( = ?auto_98500 ?auto_98503 ) ) ( not ( = ?auto_98500 ?auto_98504 ) ) ( not ( = ?auto_98500 ?auto_98505 ) ) ( not ( = ?auto_98500 ?auto_98506 ) ) ( not ( = ?auto_98501 ?auto_98502 ) ) ( not ( = ?auto_98501 ?auto_98503 ) ) ( not ( = ?auto_98501 ?auto_98504 ) ) ( not ( = ?auto_98501 ?auto_98505 ) ) ( not ( = ?auto_98501 ?auto_98506 ) ) ( not ( = ?auto_98502 ?auto_98503 ) ) ( not ( = ?auto_98502 ?auto_98504 ) ) ( not ( = ?auto_98502 ?auto_98505 ) ) ( not ( = ?auto_98502 ?auto_98506 ) ) ( not ( = ?auto_98503 ?auto_98504 ) ) ( not ( = ?auto_98503 ?auto_98505 ) ) ( not ( = ?auto_98503 ?auto_98506 ) ) ( not ( = ?auto_98504 ?auto_98505 ) ) ( not ( = ?auto_98504 ?auto_98506 ) ) ( not ( = ?auto_98505 ?auto_98506 ) ) ( ON-TABLE ?auto_98506 ) ( ON ?auto_98505 ?auto_98506 ) ( ON ?auto_98504 ?auto_98505 ) ( ON ?auto_98503 ?auto_98504 ) ( ON ?auto_98500 ?auto_98507 ) ( not ( = ?auto_98500 ?auto_98507 ) ) ( not ( = ?auto_98501 ?auto_98507 ) ) ( not ( = ?auto_98502 ?auto_98507 ) ) ( not ( = ?auto_98503 ?auto_98507 ) ) ( not ( = ?auto_98504 ?auto_98507 ) ) ( not ( = ?auto_98505 ?auto_98507 ) ) ( not ( = ?auto_98506 ?auto_98507 ) ) ( ON ?auto_98501 ?auto_98500 ) ( ON-TABLE ?auto_98507 ) ( CLEAR ?auto_98503 ) ( ON ?auto_98502 ?auto_98501 ) ( CLEAR ?auto_98502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98507 ?auto_98500 ?auto_98501 )
      ( MAKE-7PILE ?auto_98500 ?auto_98501 ?auto_98502 ?auto_98503 ?auto_98504 ?auto_98505 ?auto_98506 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98508 - BLOCK
      ?auto_98509 - BLOCK
      ?auto_98510 - BLOCK
      ?auto_98511 - BLOCK
      ?auto_98512 - BLOCK
      ?auto_98513 - BLOCK
      ?auto_98514 - BLOCK
    )
    :vars
    (
      ?auto_98515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98508 ?auto_98509 ) ) ( not ( = ?auto_98508 ?auto_98510 ) ) ( not ( = ?auto_98508 ?auto_98511 ) ) ( not ( = ?auto_98508 ?auto_98512 ) ) ( not ( = ?auto_98508 ?auto_98513 ) ) ( not ( = ?auto_98508 ?auto_98514 ) ) ( not ( = ?auto_98509 ?auto_98510 ) ) ( not ( = ?auto_98509 ?auto_98511 ) ) ( not ( = ?auto_98509 ?auto_98512 ) ) ( not ( = ?auto_98509 ?auto_98513 ) ) ( not ( = ?auto_98509 ?auto_98514 ) ) ( not ( = ?auto_98510 ?auto_98511 ) ) ( not ( = ?auto_98510 ?auto_98512 ) ) ( not ( = ?auto_98510 ?auto_98513 ) ) ( not ( = ?auto_98510 ?auto_98514 ) ) ( not ( = ?auto_98511 ?auto_98512 ) ) ( not ( = ?auto_98511 ?auto_98513 ) ) ( not ( = ?auto_98511 ?auto_98514 ) ) ( not ( = ?auto_98512 ?auto_98513 ) ) ( not ( = ?auto_98512 ?auto_98514 ) ) ( not ( = ?auto_98513 ?auto_98514 ) ) ( ON-TABLE ?auto_98514 ) ( ON ?auto_98513 ?auto_98514 ) ( ON ?auto_98512 ?auto_98513 ) ( ON ?auto_98508 ?auto_98515 ) ( not ( = ?auto_98508 ?auto_98515 ) ) ( not ( = ?auto_98509 ?auto_98515 ) ) ( not ( = ?auto_98510 ?auto_98515 ) ) ( not ( = ?auto_98511 ?auto_98515 ) ) ( not ( = ?auto_98512 ?auto_98515 ) ) ( not ( = ?auto_98513 ?auto_98515 ) ) ( not ( = ?auto_98514 ?auto_98515 ) ) ( ON ?auto_98509 ?auto_98508 ) ( ON-TABLE ?auto_98515 ) ( ON ?auto_98510 ?auto_98509 ) ( CLEAR ?auto_98510 ) ( HOLDING ?auto_98511 ) ( CLEAR ?auto_98512 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98514 ?auto_98513 ?auto_98512 ?auto_98511 )
      ( MAKE-7PILE ?auto_98508 ?auto_98509 ?auto_98510 ?auto_98511 ?auto_98512 ?auto_98513 ?auto_98514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98516 - BLOCK
      ?auto_98517 - BLOCK
      ?auto_98518 - BLOCK
      ?auto_98519 - BLOCK
      ?auto_98520 - BLOCK
      ?auto_98521 - BLOCK
      ?auto_98522 - BLOCK
    )
    :vars
    (
      ?auto_98523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98516 ?auto_98517 ) ) ( not ( = ?auto_98516 ?auto_98518 ) ) ( not ( = ?auto_98516 ?auto_98519 ) ) ( not ( = ?auto_98516 ?auto_98520 ) ) ( not ( = ?auto_98516 ?auto_98521 ) ) ( not ( = ?auto_98516 ?auto_98522 ) ) ( not ( = ?auto_98517 ?auto_98518 ) ) ( not ( = ?auto_98517 ?auto_98519 ) ) ( not ( = ?auto_98517 ?auto_98520 ) ) ( not ( = ?auto_98517 ?auto_98521 ) ) ( not ( = ?auto_98517 ?auto_98522 ) ) ( not ( = ?auto_98518 ?auto_98519 ) ) ( not ( = ?auto_98518 ?auto_98520 ) ) ( not ( = ?auto_98518 ?auto_98521 ) ) ( not ( = ?auto_98518 ?auto_98522 ) ) ( not ( = ?auto_98519 ?auto_98520 ) ) ( not ( = ?auto_98519 ?auto_98521 ) ) ( not ( = ?auto_98519 ?auto_98522 ) ) ( not ( = ?auto_98520 ?auto_98521 ) ) ( not ( = ?auto_98520 ?auto_98522 ) ) ( not ( = ?auto_98521 ?auto_98522 ) ) ( ON-TABLE ?auto_98522 ) ( ON ?auto_98521 ?auto_98522 ) ( ON ?auto_98520 ?auto_98521 ) ( ON ?auto_98516 ?auto_98523 ) ( not ( = ?auto_98516 ?auto_98523 ) ) ( not ( = ?auto_98517 ?auto_98523 ) ) ( not ( = ?auto_98518 ?auto_98523 ) ) ( not ( = ?auto_98519 ?auto_98523 ) ) ( not ( = ?auto_98520 ?auto_98523 ) ) ( not ( = ?auto_98521 ?auto_98523 ) ) ( not ( = ?auto_98522 ?auto_98523 ) ) ( ON ?auto_98517 ?auto_98516 ) ( ON-TABLE ?auto_98523 ) ( ON ?auto_98518 ?auto_98517 ) ( CLEAR ?auto_98520 ) ( ON ?auto_98519 ?auto_98518 ) ( CLEAR ?auto_98519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98523 ?auto_98516 ?auto_98517 ?auto_98518 )
      ( MAKE-7PILE ?auto_98516 ?auto_98517 ?auto_98518 ?auto_98519 ?auto_98520 ?auto_98521 ?auto_98522 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98524 - BLOCK
      ?auto_98525 - BLOCK
      ?auto_98526 - BLOCK
      ?auto_98527 - BLOCK
      ?auto_98528 - BLOCK
      ?auto_98529 - BLOCK
      ?auto_98530 - BLOCK
    )
    :vars
    (
      ?auto_98531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98524 ?auto_98525 ) ) ( not ( = ?auto_98524 ?auto_98526 ) ) ( not ( = ?auto_98524 ?auto_98527 ) ) ( not ( = ?auto_98524 ?auto_98528 ) ) ( not ( = ?auto_98524 ?auto_98529 ) ) ( not ( = ?auto_98524 ?auto_98530 ) ) ( not ( = ?auto_98525 ?auto_98526 ) ) ( not ( = ?auto_98525 ?auto_98527 ) ) ( not ( = ?auto_98525 ?auto_98528 ) ) ( not ( = ?auto_98525 ?auto_98529 ) ) ( not ( = ?auto_98525 ?auto_98530 ) ) ( not ( = ?auto_98526 ?auto_98527 ) ) ( not ( = ?auto_98526 ?auto_98528 ) ) ( not ( = ?auto_98526 ?auto_98529 ) ) ( not ( = ?auto_98526 ?auto_98530 ) ) ( not ( = ?auto_98527 ?auto_98528 ) ) ( not ( = ?auto_98527 ?auto_98529 ) ) ( not ( = ?auto_98527 ?auto_98530 ) ) ( not ( = ?auto_98528 ?auto_98529 ) ) ( not ( = ?auto_98528 ?auto_98530 ) ) ( not ( = ?auto_98529 ?auto_98530 ) ) ( ON-TABLE ?auto_98530 ) ( ON ?auto_98529 ?auto_98530 ) ( ON ?auto_98524 ?auto_98531 ) ( not ( = ?auto_98524 ?auto_98531 ) ) ( not ( = ?auto_98525 ?auto_98531 ) ) ( not ( = ?auto_98526 ?auto_98531 ) ) ( not ( = ?auto_98527 ?auto_98531 ) ) ( not ( = ?auto_98528 ?auto_98531 ) ) ( not ( = ?auto_98529 ?auto_98531 ) ) ( not ( = ?auto_98530 ?auto_98531 ) ) ( ON ?auto_98525 ?auto_98524 ) ( ON-TABLE ?auto_98531 ) ( ON ?auto_98526 ?auto_98525 ) ( ON ?auto_98527 ?auto_98526 ) ( CLEAR ?auto_98527 ) ( HOLDING ?auto_98528 ) ( CLEAR ?auto_98529 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98530 ?auto_98529 ?auto_98528 )
      ( MAKE-7PILE ?auto_98524 ?auto_98525 ?auto_98526 ?auto_98527 ?auto_98528 ?auto_98529 ?auto_98530 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98532 - BLOCK
      ?auto_98533 - BLOCK
      ?auto_98534 - BLOCK
      ?auto_98535 - BLOCK
      ?auto_98536 - BLOCK
      ?auto_98537 - BLOCK
      ?auto_98538 - BLOCK
    )
    :vars
    (
      ?auto_98539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98532 ?auto_98533 ) ) ( not ( = ?auto_98532 ?auto_98534 ) ) ( not ( = ?auto_98532 ?auto_98535 ) ) ( not ( = ?auto_98532 ?auto_98536 ) ) ( not ( = ?auto_98532 ?auto_98537 ) ) ( not ( = ?auto_98532 ?auto_98538 ) ) ( not ( = ?auto_98533 ?auto_98534 ) ) ( not ( = ?auto_98533 ?auto_98535 ) ) ( not ( = ?auto_98533 ?auto_98536 ) ) ( not ( = ?auto_98533 ?auto_98537 ) ) ( not ( = ?auto_98533 ?auto_98538 ) ) ( not ( = ?auto_98534 ?auto_98535 ) ) ( not ( = ?auto_98534 ?auto_98536 ) ) ( not ( = ?auto_98534 ?auto_98537 ) ) ( not ( = ?auto_98534 ?auto_98538 ) ) ( not ( = ?auto_98535 ?auto_98536 ) ) ( not ( = ?auto_98535 ?auto_98537 ) ) ( not ( = ?auto_98535 ?auto_98538 ) ) ( not ( = ?auto_98536 ?auto_98537 ) ) ( not ( = ?auto_98536 ?auto_98538 ) ) ( not ( = ?auto_98537 ?auto_98538 ) ) ( ON-TABLE ?auto_98538 ) ( ON ?auto_98537 ?auto_98538 ) ( ON ?auto_98532 ?auto_98539 ) ( not ( = ?auto_98532 ?auto_98539 ) ) ( not ( = ?auto_98533 ?auto_98539 ) ) ( not ( = ?auto_98534 ?auto_98539 ) ) ( not ( = ?auto_98535 ?auto_98539 ) ) ( not ( = ?auto_98536 ?auto_98539 ) ) ( not ( = ?auto_98537 ?auto_98539 ) ) ( not ( = ?auto_98538 ?auto_98539 ) ) ( ON ?auto_98533 ?auto_98532 ) ( ON-TABLE ?auto_98539 ) ( ON ?auto_98534 ?auto_98533 ) ( ON ?auto_98535 ?auto_98534 ) ( CLEAR ?auto_98537 ) ( ON ?auto_98536 ?auto_98535 ) ( CLEAR ?auto_98536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98539 ?auto_98532 ?auto_98533 ?auto_98534 ?auto_98535 )
      ( MAKE-7PILE ?auto_98532 ?auto_98533 ?auto_98534 ?auto_98535 ?auto_98536 ?auto_98537 ?auto_98538 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98540 - BLOCK
      ?auto_98541 - BLOCK
      ?auto_98542 - BLOCK
      ?auto_98543 - BLOCK
      ?auto_98544 - BLOCK
      ?auto_98545 - BLOCK
      ?auto_98546 - BLOCK
    )
    :vars
    (
      ?auto_98547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98540 ?auto_98541 ) ) ( not ( = ?auto_98540 ?auto_98542 ) ) ( not ( = ?auto_98540 ?auto_98543 ) ) ( not ( = ?auto_98540 ?auto_98544 ) ) ( not ( = ?auto_98540 ?auto_98545 ) ) ( not ( = ?auto_98540 ?auto_98546 ) ) ( not ( = ?auto_98541 ?auto_98542 ) ) ( not ( = ?auto_98541 ?auto_98543 ) ) ( not ( = ?auto_98541 ?auto_98544 ) ) ( not ( = ?auto_98541 ?auto_98545 ) ) ( not ( = ?auto_98541 ?auto_98546 ) ) ( not ( = ?auto_98542 ?auto_98543 ) ) ( not ( = ?auto_98542 ?auto_98544 ) ) ( not ( = ?auto_98542 ?auto_98545 ) ) ( not ( = ?auto_98542 ?auto_98546 ) ) ( not ( = ?auto_98543 ?auto_98544 ) ) ( not ( = ?auto_98543 ?auto_98545 ) ) ( not ( = ?auto_98543 ?auto_98546 ) ) ( not ( = ?auto_98544 ?auto_98545 ) ) ( not ( = ?auto_98544 ?auto_98546 ) ) ( not ( = ?auto_98545 ?auto_98546 ) ) ( ON-TABLE ?auto_98546 ) ( ON ?auto_98540 ?auto_98547 ) ( not ( = ?auto_98540 ?auto_98547 ) ) ( not ( = ?auto_98541 ?auto_98547 ) ) ( not ( = ?auto_98542 ?auto_98547 ) ) ( not ( = ?auto_98543 ?auto_98547 ) ) ( not ( = ?auto_98544 ?auto_98547 ) ) ( not ( = ?auto_98545 ?auto_98547 ) ) ( not ( = ?auto_98546 ?auto_98547 ) ) ( ON ?auto_98541 ?auto_98540 ) ( ON-TABLE ?auto_98547 ) ( ON ?auto_98542 ?auto_98541 ) ( ON ?auto_98543 ?auto_98542 ) ( ON ?auto_98544 ?auto_98543 ) ( CLEAR ?auto_98544 ) ( HOLDING ?auto_98545 ) ( CLEAR ?auto_98546 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98546 ?auto_98545 )
      ( MAKE-7PILE ?auto_98540 ?auto_98541 ?auto_98542 ?auto_98543 ?auto_98544 ?auto_98545 ?auto_98546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98548 - BLOCK
      ?auto_98549 - BLOCK
      ?auto_98550 - BLOCK
      ?auto_98551 - BLOCK
      ?auto_98552 - BLOCK
      ?auto_98553 - BLOCK
      ?auto_98554 - BLOCK
    )
    :vars
    (
      ?auto_98555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98548 ?auto_98549 ) ) ( not ( = ?auto_98548 ?auto_98550 ) ) ( not ( = ?auto_98548 ?auto_98551 ) ) ( not ( = ?auto_98548 ?auto_98552 ) ) ( not ( = ?auto_98548 ?auto_98553 ) ) ( not ( = ?auto_98548 ?auto_98554 ) ) ( not ( = ?auto_98549 ?auto_98550 ) ) ( not ( = ?auto_98549 ?auto_98551 ) ) ( not ( = ?auto_98549 ?auto_98552 ) ) ( not ( = ?auto_98549 ?auto_98553 ) ) ( not ( = ?auto_98549 ?auto_98554 ) ) ( not ( = ?auto_98550 ?auto_98551 ) ) ( not ( = ?auto_98550 ?auto_98552 ) ) ( not ( = ?auto_98550 ?auto_98553 ) ) ( not ( = ?auto_98550 ?auto_98554 ) ) ( not ( = ?auto_98551 ?auto_98552 ) ) ( not ( = ?auto_98551 ?auto_98553 ) ) ( not ( = ?auto_98551 ?auto_98554 ) ) ( not ( = ?auto_98552 ?auto_98553 ) ) ( not ( = ?auto_98552 ?auto_98554 ) ) ( not ( = ?auto_98553 ?auto_98554 ) ) ( ON-TABLE ?auto_98554 ) ( ON ?auto_98548 ?auto_98555 ) ( not ( = ?auto_98548 ?auto_98555 ) ) ( not ( = ?auto_98549 ?auto_98555 ) ) ( not ( = ?auto_98550 ?auto_98555 ) ) ( not ( = ?auto_98551 ?auto_98555 ) ) ( not ( = ?auto_98552 ?auto_98555 ) ) ( not ( = ?auto_98553 ?auto_98555 ) ) ( not ( = ?auto_98554 ?auto_98555 ) ) ( ON ?auto_98549 ?auto_98548 ) ( ON-TABLE ?auto_98555 ) ( ON ?auto_98550 ?auto_98549 ) ( ON ?auto_98551 ?auto_98550 ) ( ON ?auto_98552 ?auto_98551 ) ( CLEAR ?auto_98554 ) ( ON ?auto_98553 ?auto_98552 ) ( CLEAR ?auto_98553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98555 ?auto_98548 ?auto_98549 ?auto_98550 ?auto_98551 ?auto_98552 )
      ( MAKE-7PILE ?auto_98548 ?auto_98549 ?auto_98550 ?auto_98551 ?auto_98552 ?auto_98553 ?auto_98554 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98556 - BLOCK
      ?auto_98557 - BLOCK
      ?auto_98558 - BLOCK
      ?auto_98559 - BLOCK
      ?auto_98560 - BLOCK
      ?auto_98561 - BLOCK
      ?auto_98562 - BLOCK
    )
    :vars
    (
      ?auto_98563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98556 ?auto_98557 ) ) ( not ( = ?auto_98556 ?auto_98558 ) ) ( not ( = ?auto_98556 ?auto_98559 ) ) ( not ( = ?auto_98556 ?auto_98560 ) ) ( not ( = ?auto_98556 ?auto_98561 ) ) ( not ( = ?auto_98556 ?auto_98562 ) ) ( not ( = ?auto_98557 ?auto_98558 ) ) ( not ( = ?auto_98557 ?auto_98559 ) ) ( not ( = ?auto_98557 ?auto_98560 ) ) ( not ( = ?auto_98557 ?auto_98561 ) ) ( not ( = ?auto_98557 ?auto_98562 ) ) ( not ( = ?auto_98558 ?auto_98559 ) ) ( not ( = ?auto_98558 ?auto_98560 ) ) ( not ( = ?auto_98558 ?auto_98561 ) ) ( not ( = ?auto_98558 ?auto_98562 ) ) ( not ( = ?auto_98559 ?auto_98560 ) ) ( not ( = ?auto_98559 ?auto_98561 ) ) ( not ( = ?auto_98559 ?auto_98562 ) ) ( not ( = ?auto_98560 ?auto_98561 ) ) ( not ( = ?auto_98560 ?auto_98562 ) ) ( not ( = ?auto_98561 ?auto_98562 ) ) ( ON ?auto_98556 ?auto_98563 ) ( not ( = ?auto_98556 ?auto_98563 ) ) ( not ( = ?auto_98557 ?auto_98563 ) ) ( not ( = ?auto_98558 ?auto_98563 ) ) ( not ( = ?auto_98559 ?auto_98563 ) ) ( not ( = ?auto_98560 ?auto_98563 ) ) ( not ( = ?auto_98561 ?auto_98563 ) ) ( not ( = ?auto_98562 ?auto_98563 ) ) ( ON ?auto_98557 ?auto_98556 ) ( ON-TABLE ?auto_98563 ) ( ON ?auto_98558 ?auto_98557 ) ( ON ?auto_98559 ?auto_98558 ) ( ON ?auto_98560 ?auto_98559 ) ( ON ?auto_98561 ?auto_98560 ) ( CLEAR ?auto_98561 ) ( HOLDING ?auto_98562 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98562 )
      ( MAKE-7PILE ?auto_98556 ?auto_98557 ?auto_98558 ?auto_98559 ?auto_98560 ?auto_98561 ?auto_98562 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_98564 - BLOCK
      ?auto_98565 - BLOCK
      ?auto_98566 - BLOCK
      ?auto_98567 - BLOCK
      ?auto_98568 - BLOCK
      ?auto_98569 - BLOCK
      ?auto_98570 - BLOCK
    )
    :vars
    (
      ?auto_98571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98564 ?auto_98565 ) ) ( not ( = ?auto_98564 ?auto_98566 ) ) ( not ( = ?auto_98564 ?auto_98567 ) ) ( not ( = ?auto_98564 ?auto_98568 ) ) ( not ( = ?auto_98564 ?auto_98569 ) ) ( not ( = ?auto_98564 ?auto_98570 ) ) ( not ( = ?auto_98565 ?auto_98566 ) ) ( not ( = ?auto_98565 ?auto_98567 ) ) ( not ( = ?auto_98565 ?auto_98568 ) ) ( not ( = ?auto_98565 ?auto_98569 ) ) ( not ( = ?auto_98565 ?auto_98570 ) ) ( not ( = ?auto_98566 ?auto_98567 ) ) ( not ( = ?auto_98566 ?auto_98568 ) ) ( not ( = ?auto_98566 ?auto_98569 ) ) ( not ( = ?auto_98566 ?auto_98570 ) ) ( not ( = ?auto_98567 ?auto_98568 ) ) ( not ( = ?auto_98567 ?auto_98569 ) ) ( not ( = ?auto_98567 ?auto_98570 ) ) ( not ( = ?auto_98568 ?auto_98569 ) ) ( not ( = ?auto_98568 ?auto_98570 ) ) ( not ( = ?auto_98569 ?auto_98570 ) ) ( ON ?auto_98564 ?auto_98571 ) ( not ( = ?auto_98564 ?auto_98571 ) ) ( not ( = ?auto_98565 ?auto_98571 ) ) ( not ( = ?auto_98566 ?auto_98571 ) ) ( not ( = ?auto_98567 ?auto_98571 ) ) ( not ( = ?auto_98568 ?auto_98571 ) ) ( not ( = ?auto_98569 ?auto_98571 ) ) ( not ( = ?auto_98570 ?auto_98571 ) ) ( ON ?auto_98565 ?auto_98564 ) ( ON-TABLE ?auto_98571 ) ( ON ?auto_98566 ?auto_98565 ) ( ON ?auto_98567 ?auto_98566 ) ( ON ?auto_98568 ?auto_98567 ) ( ON ?auto_98569 ?auto_98568 ) ( ON ?auto_98570 ?auto_98569 ) ( CLEAR ?auto_98570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98571 ?auto_98564 ?auto_98565 ?auto_98566 ?auto_98567 ?auto_98568 ?auto_98569 )
      ( MAKE-7PILE ?auto_98564 ?auto_98565 ?auto_98566 ?auto_98567 ?auto_98568 ?auto_98569 ?auto_98570 ) )
  )

)

